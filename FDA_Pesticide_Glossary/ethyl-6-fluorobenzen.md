---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.10866, 0.5585421, -3.411128, 1, 0, 0, 1,
-2.943999, 0.1698355, -0.4285606, 1, 0.007843138, 0, 1,
-2.874061, 0.1941994, -3.429188, 1, 0.01176471, 0, 1,
-2.808143, -1.344067, -2.018607, 1, 0.01960784, 0, 1,
-2.792168, -0.8094003, -0.3099372, 1, 0.02352941, 0, 1,
-2.714628, -0.3772638, -1.78393, 1, 0.03137255, 0, 1,
-2.701847, 0.6286756, -2.414967, 1, 0.03529412, 0, 1,
-2.610069, 2.300283, -0.6509031, 1, 0.04313726, 0, 1,
-2.59528, -1.393685, -2.212371, 1, 0.04705882, 0, 1,
-2.594558, -1.001486, -3.760308, 1, 0.05490196, 0, 1,
-2.561913, -0.8340305, -2.017362, 1, 0.05882353, 0, 1,
-2.440651, 0.9061402, -2.191601, 1, 0.06666667, 0, 1,
-2.433479, 0.7998181, -0.9198225, 1, 0.07058824, 0, 1,
-2.34456, 1.052843, -1.165036, 1, 0.07843138, 0, 1,
-2.334347, -0.5611193, -0.5789918, 1, 0.08235294, 0, 1,
-2.214545, 1.438285, -2.597145, 1, 0.09019608, 0, 1,
-2.208748, -1.158696, -2.518786, 1, 0.09411765, 0, 1,
-2.208353, -1.78639, -0.7092613, 1, 0.1019608, 0, 1,
-2.201982, 0.7356161, -0.3834307, 1, 0.1098039, 0, 1,
-2.187306, 0.9666209, -2.114127, 1, 0.1137255, 0, 1,
-2.178938, -1.123761, -1.34838, 1, 0.1215686, 0, 1,
-2.178453, -0.5824751, -2.114588, 1, 0.1254902, 0, 1,
-2.177694, -0.8702815, -4.49036, 1, 0.1333333, 0, 1,
-2.114186, -1.516983, -1.200407, 1, 0.1372549, 0, 1,
-2.097188, 0.4760653, -0.3529012, 1, 0.145098, 0, 1,
-2.071369, -0.4022042, -1.058314, 1, 0.1490196, 0, 1,
-2.049325, -0.546938, -1.76676, 1, 0.1568628, 0, 1,
-2.03575, 2.185809, -0.3263107, 1, 0.1607843, 0, 1,
-2.030808, -0.321014, -0.2028984, 1, 0.1686275, 0, 1,
-2.004346, -1.191311, -1.967179, 1, 0.172549, 0, 1,
-1.984183, -1.920475, -2.885563, 1, 0.1803922, 0, 1,
-1.975317, 0.75593, -1.856133, 1, 0.1843137, 0, 1,
-1.93419, -0.166464, -2.039632, 1, 0.1921569, 0, 1,
-1.927706, -0.5083681, -2.009453, 1, 0.1960784, 0, 1,
-1.919987, -1.329338, -2.835183, 1, 0.2039216, 0, 1,
-1.872145, 0.00827749, -1.421162, 1, 0.2117647, 0, 1,
-1.844505, -1.081581, -3.756619, 1, 0.2156863, 0, 1,
-1.836609, 0.7573908, -0.4768128, 1, 0.2235294, 0, 1,
-1.835454, 1.130938, 0.2258841, 1, 0.227451, 0, 1,
-1.832514, -1.84234, -2.346288, 1, 0.2352941, 0, 1,
-1.820742, 0.6576308, 0.1684727, 1, 0.2392157, 0, 1,
-1.806992, 0.7455612, -1.792925, 1, 0.2470588, 0, 1,
-1.801369, 1.901258, -1.417036, 1, 0.2509804, 0, 1,
-1.797931, 0.1630052, -1.53972, 1, 0.2588235, 0, 1,
-1.771958, 0.6018913, -1.477885, 1, 0.2627451, 0, 1,
-1.767228, -0.61746, -0.3967426, 1, 0.2705882, 0, 1,
-1.751953, 0.7635912, -2.679883, 1, 0.2745098, 0, 1,
-1.743978, 0.3019757, -2.000105, 1, 0.282353, 0, 1,
-1.742968, -1.852774, -2.612405, 1, 0.2862745, 0, 1,
-1.733712, -1.350892, -2.403983, 1, 0.2941177, 0, 1,
-1.710651, -0.04423456, -2.143059, 1, 0.3019608, 0, 1,
-1.690368, 1.086821, -1.371577, 1, 0.3058824, 0, 1,
-1.689583, -0.07720804, -0.2723076, 1, 0.3137255, 0, 1,
-1.685756, -2.110599, -1.964262, 1, 0.3176471, 0, 1,
-1.666119, -0.3205992, -1.285171, 1, 0.3254902, 0, 1,
-1.647827, -1.636976, -1.456241, 1, 0.3294118, 0, 1,
-1.647685, 0.3686375, -1.892929, 1, 0.3372549, 0, 1,
-1.623394, 0.7335844, -3.437527, 1, 0.3411765, 0, 1,
-1.620253, -2.750731, -1.799338, 1, 0.3490196, 0, 1,
-1.613339, -0.6669327, -0.428621, 1, 0.3529412, 0, 1,
-1.600003, -0.1109819, -1.941132, 1, 0.3607843, 0, 1,
-1.585282, -0.1212823, -1.386365, 1, 0.3647059, 0, 1,
-1.584797, -1.655045, -3.313411, 1, 0.372549, 0, 1,
-1.581459, -0.2960088, -0.8248087, 1, 0.3764706, 0, 1,
-1.579685, 0.8063893, -0.17203, 1, 0.3843137, 0, 1,
-1.579426, 0.3352964, -1.871454, 1, 0.3882353, 0, 1,
-1.577895, 0.4230237, 0.2077214, 1, 0.3960784, 0, 1,
-1.565658, 0.7596614, -0.4177863, 1, 0.4039216, 0, 1,
-1.56473, 1.122828, -0.7120095, 1, 0.4078431, 0, 1,
-1.556547, 0.3613562, -1.811318, 1, 0.4156863, 0, 1,
-1.555833, 1.17475, -0.802534, 1, 0.4196078, 0, 1,
-1.549398, 0.3046976, -2.633364, 1, 0.427451, 0, 1,
-1.544517, -0.595415, -0.3760716, 1, 0.4313726, 0, 1,
-1.505929, 0.08252317, -1.53209, 1, 0.4392157, 0, 1,
-1.505673, -0.9383222, -3.204254, 1, 0.4431373, 0, 1,
-1.494682, 0.05036862, -0.3296561, 1, 0.4509804, 0, 1,
-1.473957, 1.304688, 1.053405, 1, 0.454902, 0, 1,
-1.471616, 0.06515832, -1.778429, 1, 0.4627451, 0, 1,
-1.470901, -1.893617, -3.134566, 1, 0.4666667, 0, 1,
-1.46123, 1.374525, -2.061459, 1, 0.4745098, 0, 1,
-1.454768, -1.122085, -1.532996, 1, 0.4784314, 0, 1,
-1.452668, -2.762272, -3.250201, 1, 0.4862745, 0, 1,
-1.448704, 1.525999, -0.5918869, 1, 0.4901961, 0, 1,
-1.446338, 1.045959, -1.41994, 1, 0.4980392, 0, 1,
-1.43708, -0.08697601, -1.564228, 1, 0.5058824, 0, 1,
-1.436965, -1.663072, -2.063844, 1, 0.509804, 0, 1,
-1.428592, -1.369084, -1.63151, 1, 0.5176471, 0, 1,
-1.424057, -0.9213757, -2.850632, 1, 0.5215687, 0, 1,
-1.414809, 0.7920825, -1.434284, 1, 0.5294118, 0, 1,
-1.412038, -0.06197517, -0.713151, 1, 0.5333334, 0, 1,
-1.408687, 1.910067, -1.23866, 1, 0.5411765, 0, 1,
-1.400808, 0.7203815, -2.885962, 1, 0.5450981, 0, 1,
-1.395379, 0.6260213, -0.65086, 1, 0.5529412, 0, 1,
-1.389143, -1.512134, -3.595323, 1, 0.5568628, 0, 1,
-1.369319, 1.291413, -2.115444, 1, 0.5647059, 0, 1,
-1.366466, 0.788951, -0.1836102, 1, 0.5686275, 0, 1,
-1.366121, -0.02844323, 0.5873072, 1, 0.5764706, 0, 1,
-1.363829, -0.02944363, -1.818483, 1, 0.5803922, 0, 1,
-1.361746, -0.601147, -2.294626, 1, 0.5882353, 0, 1,
-1.361437, 1.348376, -2.339545, 1, 0.5921569, 0, 1,
-1.349245, 0.2408107, -1.958653, 1, 0.6, 0, 1,
-1.348052, -0.588573, -0.6293852, 1, 0.6078432, 0, 1,
-1.347752, 1.57566, -2.308632, 1, 0.6117647, 0, 1,
-1.346677, -0.009172085, -2.538059, 1, 0.6196079, 0, 1,
-1.336471, -1.040315, -0.6217903, 1, 0.6235294, 0, 1,
-1.335681, 0.1278207, -1.54244, 1, 0.6313726, 0, 1,
-1.330845, 0.2372628, 0.435156, 1, 0.6352941, 0, 1,
-1.329872, 0.7243591, -0.7721588, 1, 0.6431373, 0, 1,
-1.321462, -1.501733, -2.693086, 1, 0.6470588, 0, 1,
-1.306922, -0.134374, -3.732597, 1, 0.654902, 0, 1,
-1.303494, 0.3581856, -0.7430569, 1, 0.6588235, 0, 1,
-1.299063, 0.2412604, -3.258555, 1, 0.6666667, 0, 1,
-1.298895, -2.265547, -2.268971, 1, 0.6705883, 0, 1,
-1.290323, 0.8911729, -1.924674, 1, 0.6784314, 0, 1,
-1.280831, -0.4942113, -2.102803, 1, 0.682353, 0, 1,
-1.278555, -0.1511959, -0.4216128, 1, 0.6901961, 0, 1,
-1.273986, 0.1146519, -2.643038, 1, 0.6941177, 0, 1,
-1.269818, 1.373494, -1.70329, 1, 0.7019608, 0, 1,
-1.269392, 0.4211672, 0.4447865, 1, 0.7098039, 0, 1,
-1.258387, -0.5346065, -1.463235, 1, 0.7137255, 0, 1,
-1.25292, 0.6231516, -0.3875538, 1, 0.7215686, 0, 1,
-1.25019, 1.25421, 0.3670922, 1, 0.7254902, 0, 1,
-1.242547, -1.95133, -4.300589, 1, 0.7333333, 0, 1,
-1.23614, 2.417944, -1.098953, 1, 0.7372549, 0, 1,
-1.234316, 1.229871, -1.119328, 1, 0.7450981, 0, 1,
-1.226425, 0.1799414, 0.6416846, 1, 0.7490196, 0, 1,
-1.224054, 1.481929, -0.911384, 1, 0.7568628, 0, 1,
-1.223359, -0.6399004, -1.455607, 1, 0.7607843, 0, 1,
-1.221928, -0.2824533, -2.610507, 1, 0.7686275, 0, 1,
-1.219042, 0.5760749, -1.968689, 1, 0.772549, 0, 1,
-1.218066, -0.6115378, -1.869088, 1, 0.7803922, 0, 1,
-1.214264, 0.9720552, 1.505827, 1, 0.7843137, 0, 1,
-1.211495, -0.04942228, -1.360901, 1, 0.7921569, 0, 1,
-1.20605, 1.465025, -1.229236, 1, 0.7960784, 0, 1,
-1.20563, 0.3104846, -0.4865004, 1, 0.8039216, 0, 1,
-1.204704, -0.3120655, -3.282135, 1, 0.8117647, 0, 1,
-1.200642, 2.027015, -0.06892549, 1, 0.8156863, 0, 1,
-1.197677, -0.8483294, -3.306206, 1, 0.8235294, 0, 1,
-1.191354, 0.5020505, -1.865223, 1, 0.827451, 0, 1,
-1.189029, -2.219819, -2.480528, 1, 0.8352941, 0, 1,
-1.186266, -0.1489312, -0.5416654, 1, 0.8392157, 0, 1,
-1.182408, 1.643759, -0.5610234, 1, 0.8470588, 0, 1,
-1.179644, 0.01822183, -2.426669, 1, 0.8509804, 0, 1,
-1.169392, -0.5284126, -1.766258, 1, 0.8588235, 0, 1,
-1.166465, -0.9192793, -1.544681, 1, 0.8627451, 0, 1,
-1.162484, 1.044917, -1.613438, 1, 0.8705882, 0, 1,
-1.161309, -0.07917587, -0.5433702, 1, 0.8745098, 0, 1,
-1.153857, -1.24425, -1.107301, 1, 0.8823529, 0, 1,
-1.153192, -1.01163, -3.049376, 1, 0.8862745, 0, 1,
-1.151147, -0.9312676, -2.899961, 1, 0.8941177, 0, 1,
-1.146647, 1.1963, -1.768739, 1, 0.8980392, 0, 1,
-1.144014, 0.3784567, -0.7934369, 1, 0.9058824, 0, 1,
-1.143302, 0.9602116, -0.5791165, 1, 0.9137255, 0, 1,
-1.139677, 1.952377, -1.205711, 1, 0.9176471, 0, 1,
-1.137442, 0.4957446, 0.1174708, 1, 0.9254902, 0, 1,
-1.13336, -0.8693213, -1.811634, 1, 0.9294118, 0, 1,
-1.121868, -0.7199793, -2.443972, 1, 0.9372549, 0, 1,
-1.102522, 0.5387968, -1.121809, 1, 0.9411765, 0, 1,
-1.097647, -0.4901353, 0.3582169, 1, 0.9490196, 0, 1,
-1.095617, 0.2262751, -2.041785, 1, 0.9529412, 0, 1,
-1.091601, -0.09721407, -2.784858, 1, 0.9607843, 0, 1,
-1.083626, -0.9125482, -2.661148, 1, 0.9647059, 0, 1,
-1.082182, -0.02308606, -2.996978, 1, 0.972549, 0, 1,
-1.078609, 1.169153, -1.087509, 1, 0.9764706, 0, 1,
-1.077968, 0.09672663, -0.9387928, 1, 0.9843137, 0, 1,
-1.076461, 0.5494105, -0.5610735, 1, 0.9882353, 0, 1,
-1.069833, 0.6528265, -1.412395, 1, 0.9960784, 0, 1,
-1.068823, -0.001869478, -3.123818, 0.9960784, 1, 0, 1,
-1.065392, 1.465701, -0.3771392, 0.9921569, 1, 0, 1,
-1.063104, -0.5785677, -1.628076, 0.9843137, 1, 0, 1,
-1.062798, -0.6478305, -1.383135, 0.9803922, 1, 0, 1,
-1.049913, 0.08163578, -0.6822861, 0.972549, 1, 0, 1,
-1.048937, 0.379316, -0.7886821, 0.9686275, 1, 0, 1,
-1.04294, 0.2316855, -2.20762, 0.9607843, 1, 0, 1,
-1.039965, -0.6839466, -1.688813, 0.9568627, 1, 0, 1,
-1.03782, -1.388054, -2.821602, 0.9490196, 1, 0, 1,
-1.03657, -1.778127, -3.775975, 0.945098, 1, 0, 1,
-1.034815, -0.5809568, -2.018617, 0.9372549, 1, 0, 1,
-1.034429, -1.647445, -2.286477, 0.9333333, 1, 0, 1,
-1.027164, -1.211194, -2.857936, 0.9254902, 1, 0, 1,
-1.020008, 0.08075213, -1.789615, 0.9215686, 1, 0, 1,
-1.017763, -1.148949, -2.648429, 0.9137255, 1, 0, 1,
-1.0155, -1.05635, -2.652364, 0.9098039, 1, 0, 1,
-1.010623, 0.9481084, -1.499001, 0.9019608, 1, 0, 1,
-1.009314, -0.4227264, -3.11294, 0.8941177, 1, 0, 1,
-1.006497, -1.11152, -1.538733, 0.8901961, 1, 0, 1,
-1.003337, -0.09150824, -1.486995, 0.8823529, 1, 0, 1,
-1.003116, 0.8073823, 0.2130565, 0.8784314, 1, 0, 1,
-0.9970795, -0.4955512, -3.742921, 0.8705882, 1, 0, 1,
-0.9967855, 0.05747039, -2.41495, 0.8666667, 1, 0, 1,
-0.9952147, 0.8283896, -0.03764827, 0.8588235, 1, 0, 1,
-0.9927842, 0.4274193, -1.681072, 0.854902, 1, 0, 1,
-0.9833525, 0.3110542, -2.397825, 0.8470588, 1, 0, 1,
-0.9804749, -0.2154739, -1.704583, 0.8431373, 1, 0, 1,
-0.9770014, 0.7936489, -2.078007, 0.8352941, 1, 0, 1,
-0.9730558, 2.252302, -0.9665998, 0.8313726, 1, 0, 1,
-0.9662124, -0.8389776, -1.820284, 0.8235294, 1, 0, 1,
-0.9637878, 1.632215, -1.581405, 0.8196079, 1, 0, 1,
-0.9583541, -0.4278109, -2.871918, 0.8117647, 1, 0, 1,
-0.9569108, 0.8020219, -1.474709, 0.8078431, 1, 0, 1,
-0.9536877, -0.6148244, -0.9339311, 0.8, 1, 0, 1,
-0.9473268, -1.7872, -3.285571, 0.7921569, 1, 0, 1,
-0.9458581, -0.013209, -1.175715, 0.7882353, 1, 0, 1,
-0.9452543, -0.2379539, -0.9438201, 0.7803922, 1, 0, 1,
-0.9432687, -1.456737, -2.190417, 0.7764706, 1, 0, 1,
-0.9365522, -1.058817, -2.942966, 0.7686275, 1, 0, 1,
-0.9364827, 0.2656968, -2.093992, 0.7647059, 1, 0, 1,
-0.9314443, 0.5595292, -2.27329, 0.7568628, 1, 0, 1,
-0.9288979, -1.973409, -3.891595, 0.7529412, 1, 0, 1,
-0.9253134, 1.666795, -1.138569, 0.7450981, 1, 0, 1,
-0.9250838, -1.725956, -2.338114, 0.7411765, 1, 0, 1,
-0.9149036, -2.303784, -1.609521, 0.7333333, 1, 0, 1,
-0.9126701, -1.046556, -2.275737, 0.7294118, 1, 0, 1,
-0.9074338, -0.2545818, -1.809303, 0.7215686, 1, 0, 1,
-0.9056861, -0.8384376, -0.8520213, 0.7176471, 1, 0, 1,
-0.9000612, -0.0473375, -0.008806188, 0.7098039, 1, 0, 1,
-0.8966759, -0.02043381, -3.070891, 0.7058824, 1, 0, 1,
-0.894835, -0.4458096, -2.64912, 0.6980392, 1, 0, 1,
-0.8920347, -1.316804, -2.213363, 0.6901961, 1, 0, 1,
-0.8858181, -0.3465814, 0.6008475, 0.6862745, 1, 0, 1,
-0.8815556, 0.8306175, 0.1615533, 0.6784314, 1, 0, 1,
-0.8807138, -0.09696662, -1.107394, 0.6745098, 1, 0, 1,
-0.8804863, 1.193366, 0.3812211, 0.6666667, 1, 0, 1,
-0.8797512, -0.9840544, -4.051861, 0.6627451, 1, 0, 1,
-0.8770009, 3.224614, -0.5000647, 0.654902, 1, 0, 1,
-0.8736194, 0.1809613, -1.425241, 0.6509804, 1, 0, 1,
-0.8712243, -1.325919, -2.397153, 0.6431373, 1, 0, 1,
-0.8686963, -1.324914, -2.856947, 0.6392157, 1, 0, 1,
-0.8684739, -0.1365273, -2.916267, 0.6313726, 1, 0, 1,
-0.8636606, -0.08357383, -0.6215377, 0.627451, 1, 0, 1,
-0.8622364, -1.108107, -3.282564, 0.6196079, 1, 0, 1,
-0.8621678, 1.158799, -1.046269, 0.6156863, 1, 0, 1,
-0.8560253, -0.9480329, -1.947981, 0.6078432, 1, 0, 1,
-0.8547305, -0.1473106, -1.082776, 0.6039216, 1, 0, 1,
-0.8447898, 0.6473324, -0.06551483, 0.5960785, 1, 0, 1,
-0.8422079, 0.04494377, -1.959567, 0.5882353, 1, 0, 1,
-0.8417234, 0.4132704, -0.6377566, 0.5843138, 1, 0, 1,
-0.8360854, 1.323178, -1.411445, 0.5764706, 1, 0, 1,
-0.835111, 0.1294871, -1.728603, 0.572549, 1, 0, 1,
-0.8310564, -0.4946135, -2.281436, 0.5647059, 1, 0, 1,
-0.8219771, 0.6606598, -1.560773, 0.5607843, 1, 0, 1,
-0.8129054, -0.2471659, -1.898534, 0.5529412, 1, 0, 1,
-0.8101481, 0.328784, 0.9405192, 0.5490196, 1, 0, 1,
-0.8058644, 0.5649295, -0.9159083, 0.5411765, 1, 0, 1,
-0.7985467, 0.3429569, -0.8991269, 0.5372549, 1, 0, 1,
-0.7970439, -1.039218, -2.920712, 0.5294118, 1, 0, 1,
-0.7960981, 0.6312768, -0.4833924, 0.5254902, 1, 0, 1,
-0.7935458, -0.757983, -1.079106, 0.5176471, 1, 0, 1,
-0.7924736, -0.553269, -0.3870357, 0.5137255, 1, 0, 1,
-0.7885394, 0.6079879, -1.823087, 0.5058824, 1, 0, 1,
-0.7862428, -0.8479016, -0.8016424, 0.5019608, 1, 0, 1,
-0.7851608, 1.10457, -2.157177, 0.4941176, 1, 0, 1,
-0.7820324, 0.2375168, -1.479095, 0.4862745, 1, 0, 1,
-0.7800189, 0.846823, -1.697088, 0.4823529, 1, 0, 1,
-0.778236, -1.195235, -2.889608, 0.4745098, 1, 0, 1,
-0.7756522, -0.5829648, -0.4540196, 0.4705882, 1, 0, 1,
-0.7725298, 0.0922889, -0.9193518, 0.4627451, 1, 0, 1,
-0.7675329, 0.3914365, -1.217882, 0.4588235, 1, 0, 1,
-0.764245, -0.4412448, -0.6540329, 0.4509804, 1, 0, 1,
-0.763292, -0.1096834, -1.42402, 0.4470588, 1, 0, 1,
-0.762993, 0.4146132, -0.9706833, 0.4392157, 1, 0, 1,
-0.758199, 0.519891, -0.03102467, 0.4352941, 1, 0, 1,
-0.7475967, -0.09753748, -1.670894, 0.427451, 1, 0, 1,
-0.7450718, 0.886588, -2.822661, 0.4235294, 1, 0, 1,
-0.7443336, -0.1240648, -3.074344, 0.4156863, 1, 0, 1,
-0.7438112, -0.2479504, -1.469006, 0.4117647, 1, 0, 1,
-0.7421815, -0.4729408, -3.829143, 0.4039216, 1, 0, 1,
-0.7381015, -0.203191, -1.365557, 0.3960784, 1, 0, 1,
-0.7322519, -2.4122, -1.505421, 0.3921569, 1, 0, 1,
-0.7284265, 1.129113, -0.5238077, 0.3843137, 1, 0, 1,
-0.7277218, 0.2885801, -0.52904, 0.3803922, 1, 0, 1,
-0.7251731, -0.8488054, -1.343628, 0.372549, 1, 0, 1,
-0.7245565, 0.9182655, -0.03460788, 0.3686275, 1, 0, 1,
-0.7225807, 0.2448217, -0.2416675, 0.3607843, 1, 0, 1,
-0.7208388, -0.6768903, -1.885722, 0.3568628, 1, 0, 1,
-0.7174885, 1.076874, -1.054432, 0.3490196, 1, 0, 1,
-0.7043893, 1.681313, 2.489128, 0.345098, 1, 0, 1,
-0.6970824, 0.6549477, 1.811091, 0.3372549, 1, 0, 1,
-0.6920786, 0.1399636, -2.08877, 0.3333333, 1, 0, 1,
-0.6881565, -0.6908369, -1.525542, 0.3254902, 1, 0, 1,
-0.6786428, -0.07313155, -1.504158, 0.3215686, 1, 0, 1,
-0.6770304, 0.2057733, -1.131597, 0.3137255, 1, 0, 1,
-0.6759429, 1.175601, -1.632361, 0.3098039, 1, 0, 1,
-0.6731387, 1.301855, 1.118478, 0.3019608, 1, 0, 1,
-0.6685407, 1.413431, -1.324028, 0.2941177, 1, 0, 1,
-0.6637372, -1.160991, -3.803044, 0.2901961, 1, 0, 1,
-0.6588426, 0.2710661, -0.1991461, 0.282353, 1, 0, 1,
-0.6580415, -0.2463049, -2.375325, 0.2784314, 1, 0, 1,
-0.6554157, 0.4096329, -0.5601332, 0.2705882, 1, 0, 1,
-0.6520059, 0.02452273, -1.05932, 0.2666667, 1, 0, 1,
-0.6479901, 0.09644168, -2.929381, 0.2588235, 1, 0, 1,
-0.6396056, 0.261419, -0.580022, 0.254902, 1, 0, 1,
-0.6346235, 1.20084, 1.001471, 0.2470588, 1, 0, 1,
-0.6312076, 0.2439838, -1.542688, 0.2431373, 1, 0, 1,
-0.6281018, -0.4362452, -3.275236, 0.2352941, 1, 0, 1,
-0.6279901, -0.6121609, -3.055921, 0.2313726, 1, 0, 1,
-0.6274834, -0.7489787, -2.075517, 0.2235294, 1, 0, 1,
-0.6272033, 0.2280558, -1.855644, 0.2196078, 1, 0, 1,
-0.6212516, -0.4946325, -1.400155, 0.2117647, 1, 0, 1,
-0.6162661, -1.982634, -1.908774, 0.2078431, 1, 0, 1,
-0.6128442, 0.459083, -0.9074051, 0.2, 1, 0, 1,
-0.6120146, -0.8240135, -2.240359, 0.1921569, 1, 0, 1,
-0.60459, -0.4194713, -3.09049, 0.1882353, 1, 0, 1,
-0.5979426, 0.1798467, -0.6767023, 0.1803922, 1, 0, 1,
-0.5945908, 1.354262, -1.026523, 0.1764706, 1, 0, 1,
-0.5945746, -0.9856872, -2.336012, 0.1686275, 1, 0, 1,
-0.5920572, 0.7485766, 0.633453, 0.1647059, 1, 0, 1,
-0.586953, 1.108705, -0.5334414, 0.1568628, 1, 0, 1,
-0.5817909, 1.491641, -0.8830605, 0.1529412, 1, 0, 1,
-0.5773423, -2.504174, -3.094132, 0.145098, 1, 0, 1,
-0.5755769, 0.9892095, -0.1067036, 0.1411765, 1, 0, 1,
-0.5742071, -1.506232, -3.887116, 0.1333333, 1, 0, 1,
-0.5711215, -0.7434928, -3.612169, 0.1294118, 1, 0, 1,
-0.5699598, 0.8428605, -0.5961967, 0.1215686, 1, 0, 1,
-0.5695468, 0.06590554, -0.8356876, 0.1176471, 1, 0, 1,
-0.5618058, -0.5396001, -3.19422, 0.1098039, 1, 0, 1,
-0.5617455, 0.9769676, 1.753482, 0.1058824, 1, 0, 1,
-0.5585083, 0.04998142, -2.155442, 0.09803922, 1, 0, 1,
-0.5545224, -1.051847, -2.567931, 0.09019608, 1, 0, 1,
-0.5418497, -0.8058394, -1.445496, 0.08627451, 1, 0, 1,
-0.5391277, 2.000653, 0.2883591, 0.07843138, 1, 0, 1,
-0.536431, -0.541485, -1.83245, 0.07450981, 1, 0, 1,
-0.5354968, -0.4585894, -0.9055215, 0.06666667, 1, 0, 1,
-0.5318652, -0.4524396, -2.340961, 0.0627451, 1, 0, 1,
-0.5276688, 1.891025, -0.1659679, 0.05490196, 1, 0, 1,
-0.5261118, -0.4313623, -2.428717, 0.05098039, 1, 0, 1,
-0.5257678, -0.2650356, -1.574989, 0.04313726, 1, 0, 1,
-0.5250571, 0.2336211, -1.035584, 0.03921569, 1, 0, 1,
-0.5231084, 0.1809705, -1.450985, 0.03137255, 1, 0, 1,
-0.5204461, 0.3074107, -0.3562395, 0.02745098, 1, 0, 1,
-0.5165182, 0.8888344, -0.3975688, 0.01960784, 1, 0, 1,
-0.5141354, 1.295748, 0.1896635, 0.01568628, 1, 0, 1,
-0.5042192, -0.274446, -1.235083, 0.007843138, 1, 0, 1,
-0.5029135, -0.9479216, -3.08738, 0.003921569, 1, 0, 1,
-0.5002831, 1.069835, -0.3891802, 0, 1, 0.003921569, 1,
-0.4997946, -0.08364771, -1.770156, 0, 1, 0.01176471, 1,
-0.4992663, 0.1315452, -0.9280784, 0, 1, 0.01568628, 1,
-0.4972728, -0.6227633, -4.445254, 0, 1, 0.02352941, 1,
-0.4931965, -1.194415, -2.948935, 0, 1, 0.02745098, 1,
-0.4862443, 0.9266899, 0.1538042, 0, 1, 0.03529412, 1,
-0.4829488, -0.5149155, -1.465899, 0, 1, 0.03921569, 1,
-0.4754424, -0.5518919, -2.358844, 0, 1, 0.04705882, 1,
-0.4691449, 2.357886, -0.1747563, 0, 1, 0.05098039, 1,
-0.46866, 1.269673, 0.7976623, 0, 1, 0.05882353, 1,
-0.4677977, -0.004006723, -0.8300766, 0, 1, 0.0627451, 1,
-0.4676932, 1.110105, -1.037168, 0, 1, 0.07058824, 1,
-0.4612662, -0.03605162, -2.794702, 0, 1, 0.07450981, 1,
-0.4526725, -2.318801, -4.175839, 0, 1, 0.08235294, 1,
-0.4498993, 1.432137, -0.7253538, 0, 1, 0.08627451, 1,
-0.4488645, 0.03676763, -0.8090217, 0, 1, 0.09411765, 1,
-0.4483622, -0.5196966, -2.484751, 0, 1, 0.1019608, 1,
-0.4441624, -0.1927294, -1.140323, 0, 1, 0.1058824, 1,
-0.4421328, -0.23895, -1.36904, 0, 1, 0.1137255, 1,
-0.4367949, 0.2024275, -1.739893, 0, 1, 0.1176471, 1,
-0.4218691, 0.8409162, 1.743156, 0, 1, 0.1254902, 1,
-0.4208989, -1.164123, -1.972609, 0, 1, 0.1294118, 1,
-0.4200836, -1.054681, -3.512043, 0, 1, 0.1372549, 1,
-0.4191606, 1.137003, -2.250319, 0, 1, 0.1411765, 1,
-0.4171576, 0.4557105, -0.7710992, 0, 1, 0.1490196, 1,
-0.4154218, 0.2163124, -1.682503, 0, 1, 0.1529412, 1,
-0.4103611, -0.3372425, -4.133866, 0, 1, 0.1607843, 1,
-0.4092013, 0.62093, -0.4769135, 0, 1, 0.1647059, 1,
-0.4079964, -0.9620433, -3.661986, 0, 1, 0.172549, 1,
-0.407096, -2.256962, -2.405094, 0, 1, 0.1764706, 1,
-0.4057726, 1.557176, -1.133092, 0, 1, 0.1843137, 1,
-0.3966621, -0.6226403, -1.573696, 0, 1, 0.1882353, 1,
-0.3948877, 0.6733293, -1.396021, 0, 1, 0.1960784, 1,
-0.3900121, 0.1390375, 0.5845591, 0, 1, 0.2039216, 1,
-0.3858096, 1.342358, -0.7821747, 0, 1, 0.2078431, 1,
-0.3821816, 0.3775439, -1.312379, 0, 1, 0.2156863, 1,
-0.3800912, -0.6249654, -2.111703, 0, 1, 0.2196078, 1,
-0.3800138, 1.748435, -0.3949342, 0, 1, 0.227451, 1,
-0.3798433, 0.6071166, -0.4955374, 0, 1, 0.2313726, 1,
-0.3728389, 1.497334, -1.823389, 0, 1, 0.2392157, 1,
-0.370093, -0.8735328, -2.515663, 0, 1, 0.2431373, 1,
-0.36896, 1.134724, 0.004337445, 0, 1, 0.2509804, 1,
-0.364569, 1.175954, -2.185384, 0, 1, 0.254902, 1,
-0.3590768, 2.489713, -0.2422393, 0, 1, 0.2627451, 1,
-0.3580216, 0.65418, -0.3961425, 0, 1, 0.2666667, 1,
-0.3567048, -0.4261553, -4.627314, 0, 1, 0.2745098, 1,
-0.3564641, -0.6555978, -2.737311, 0, 1, 0.2784314, 1,
-0.3562021, -1.127524, -3.527475, 0, 1, 0.2862745, 1,
-0.3504748, -0.03896003, -1.666119, 0, 1, 0.2901961, 1,
-0.3480002, 0.07942572, -2.798807, 0, 1, 0.2980392, 1,
-0.3477966, 0.7196324, -2.184223, 0, 1, 0.3058824, 1,
-0.3461426, -0.7899626, -1.68846, 0, 1, 0.3098039, 1,
-0.3448121, -0.9438104, -1.968024, 0, 1, 0.3176471, 1,
-0.3444522, 0.9031045, -0.5123654, 0, 1, 0.3215686, 1,
-0.3434018, 0.1063164, -1.220774, 0, 1, 0.3294118, 1,
-0.3419244, 0.4433914, 0.3234185, 0, 1, 0.3333333, 1,
-0.3416694, 0.05741702, -2.209091, 0, 1, 0.3411765, 1,
-0.340997, 0.8690448, 0.4001687, 0, 1, 0.345098, 1,
-0.3357466, -2.77676, -3.723529, 0, 1, 0.3529412, 1,
-0.3354778, -1.035334, -0.9912556, 0, 1, 0.3568628, 1,
-0.3346666, 0.5307364, 1.294737, 0, 1, 0.3647059, 1,
-0.3324981, -0.3824165, -4.010137, 0, 1, 0.3686275, 1,
-0.3281173, -0.3122381, -3.192279, 0, 1, 0.3764706, 1,
-0.3278998, 1.031303, 0.7666448, 0, 1, 0.3803922, 1,
-0.3274895, -0.612945, -0.879716, 0, 1, 0.3882353, 1,
-0.3263055, -0.5738115, -3.746555, 0, 1, 0.3921569, 1,
-0.3258288, 1.031372, 0.3665497, 0, 1, 0.4, 1,
-0.3240083, 0.7223282, 0.3132609, 0, 1, 0.4078431, 1,
-0.3234996, -0.9616082, -3.607917, 0, 1, 0.4117647, 1,
-0.3210314, -0.3778511, -3.207039, 0, 1, 0.4196078, 1,
-0.3165085, -0.7661491, -3.367873, 0, 1, 0.4235294, 1,
-0.3164223, 1.764699, -0.5888448, 0, 1, 0.4313726, 1,
-0.3131809, -0.7769318, -2.504947, 0, 1, 0.4352941, 1,
-0.3116494, -1.511975, -2.867083, 0, 1, 0.4431373, 1,
-0.2943228, -0.1431834, -2.034803, 0, 1, 0.4470588, 1,
-0.2939724, -0.1342936, -0.4651287, 0, 1, 0.454902, 1,
-0.2914982, -0.5392603, -3.416149, 0, 1, 0.4588235, 1,
-0.2903833, 0.296289, -0.1067823, 0, 1, 0.4666667, 1,
-0.2894939, 1.200114, 1.437845, 0, 1, 0.4705882, 1,
-0.2874306, 1.416067, -0.4603499, 0, 1, 0.4784314, 1,
-0.2867979, -0.4109636, -2.896908, 0, 1, 0.4823529, 1,
-0.2856977, 0.3030089, -0.6061969, 0, 1, 0.4901961, 1,
-0.2856627, -1.380456, -1.801855, 0, 1, 0.4941176, 1,
-0.2645256, 1.561972, -0.6284828, 0, 1, 0.5019608, 1,
-0.2525538, 0.9941359, 0.3619838, 0, 1, 0.509804, 1,
-0.2486245, 1.134049, -2.754694, 0, 1, 0.5137255, 1,
-0.2484844, 0.6752532, -1.077451, 0, 1, 0.5215687, 1,
-0.2476855, 1.782154, 0.404078, 0, 1, 0.5254902, 1,
-0.244863, -0.8233557, -4.675164, 0, 1, 0.5333334, 1,
-0.2438344, 0.1491307, -1.15938, 0, 1, 0.5372549, 1,
-0.2420817, 0.8573677, -1.38612, 0, 1, 0.5450981, 1,
-0.2367228, -0.2978038, -2.532441, 0, 1, 0.5490196, 1,
-0.2352583, 0.04193184, -1.383373, 0, 1, 0.5568628, 1,
-0.2270621, -1.311004, -1.673297, 0, 1, 0.5607843, 1,
-0.2269405, -1.329376, -2.035156, 0, 1, 0.5686275, 1,
-0.2249676, -0.9732288, -4.378642, 0, 1, 0.572549, 1,
-0.2209771, -1.746632, -2.585454, 0, 1, 0.5803922, 1,
-0.2192381, 0.8220546, 0.3828492, 0, 1, 0.5843138, 1,
-0.2142433, -1.234972, -3.25358, 0, 1, 0.5921569, 1,
-0.2141919, -1.888769, -2.825722, 0, 1, 0.5960785, 1,
-0.2119182, 1.071488, 0.5417012, 0, 1, 0.6039216, 1,
-0.2117222, -0.3392855, -2.210664, 0, 1, 0.6117647, 1,
-0.2068337, 1.116534, 0.1237378, 0, 1, 0.6156863, 1,
-0.2067561, 0.2439662, 0.02075411, 0, 1, 0.6235294, 1,
-0.2018547, -0.9922166, -2.364244, 0, 1, 0.627451, 1,
-0.2011475, 1.148564, -1.127212, 0, 1, 0.6352941, 1,
-0.1920569, 0.7170703, -0.2617483, 0, 1, 0.6392157, 1,
-0.1916433, -0.09898612, -1.779016, 0, 1, 0.6470588, 1,
-0.189717, 1.104385, 1.098734, 0, 1, 0.6509804, 1,
-0.18847, 1.154868, 0.2567558, 0, 1, 0.6588235, 1,
-0.1859689, 1.772254, -0.08921782, 0, 1, 0.6627451, 1,
-0.178531, 0.834394, 0.1294544, 0, 1, 0.6705883, 1,
-0.1778331, -1.210506, -3.15367, 0, 1, 0.6745098, 1,
-0.1774887, -0.1805127, -1.74815, 0, 1, 0.682353, 1,
-0.1772723, 0.3049013, 1.242336, 0, 1, 0.6862745, 1,
-0.1692498, -2.305765, -2.618448, 0, 1, 0.6941177, 1,
-0.1689555, -0.3283478, -1.334918, 0, 1, 0.7019608, 1,
-0.1689232, 1.073966, -0.06879724, 0, 1, 0.7058824, 1,
-0.1684255, 0.4560275, 0.8263152, 0, 1, 0.7137255, 1,
-0.1681179, 0.6978691, -0.05845656, 0, 1, 0.7176471, 1,
-0.1672571, -0.5459545, -3.528965, 0, 1, 0.7254902, 1,
-0.1644559, -0.276042, -4.232359, 0, 1, 0.7294118, 1,
-0.1614414, -0.2639078, -1.572839, 0, 1, 0.7372549, 1,
-0.1588328, -0.9412568, -2.633954, 0, 1, 0.7411765, 1,
-0.1565024, -1.802609, -2.630719, 0, 1, 0.7490196, 1,
-0.155013, -2.051685, -2.476403, 0, 1, 0.7529412, 1,
-0.1505138, 0.3071758, -0.3657499, 0, 1, 0.7607843, 1,
-0.1497247, 0.7528821, -0.2433264, 0, 1, 0.7647059, 1,
-0.1490558, 1.086612, -1.037574, 0, 1, 0.772549, 1,
-0.1457964, 1.123696, 0.08403664, 0, 1, 0.7764706, 1,
-0.1427412, 0.5315942, -1.539402, 0, 1, 0.7843137, 1,
-0.1414942, 2.043214, -1.731664, 0, 1, 0.7882353, 1,
-0.1357647, 0.6123092, 0.8836018, 0, 1, 0.7960784, 1,
-0.1340089, -1.322289, -4.712673, 0, 1, 0.8039216, 1,
-0.1311381, 0.274327, -1.01882, 0, 1, 0.8078431, 1,
-0.1295259, -0.09317052, -1.924224, 0, 1, 0.8156863, 1,
-0.1278906, 1.771608, 0.1023804, 0, 1, 0.8196079, 1,
-0.1265746, 0.0330322, -2.003853, 0, 1, 0.827451, 1,
-0.1265489, -0.05052576, -3.640218, 0, 1, 0.8313726, 1,
-0.1216299, -0.2065208, -2.667021, 0, 1, 0.8392157, 1,
-0.1196036, 0.169518, -1.305666, 0, 1, 0.8431373, 1,
-0.1191262, 1.757848, -0.6949577, 0, 1, 0.8509804, 1,
-0.1181727, -0.8714617, -2.746465, 0, 1, 0.854902, 1,
-0.116896, 0.64132, 1.250482, 0, 1, 0.8627451, 1,
-0.114364, -1.065238, -4.222218, 0, 1, 0.8666667, 1,
-0.112643, -1.716088, -2.861222, 0, 1, 0.8745098, 1,
-0.1077821, 0.1461678, -0.3558801, 0, 1, 0.8784314, 1,
-0.1074405, -1.205188, -3.914067, 0, 1, 0.8862745, 1,
-0.1069456, -2.003428, -2.398807, 0, 1, 0.8901961, 1,
-0.1064625, 0.9397605, -0.6473261, 0, 1, 0.8980392, 1,
-0.1055607, 0.3166569, -0.3645768, 0, 1, 0.9058824, 1,
-0.09944886, 0.8183605, 0.6096724, 0, 1, 0.9098039, 1,
-0.09915891, 0.730742, -2.103983, 0, 1, 0.9176471, 1,
-0.09710038, 1.045948, -1.508726, 0, 1, 0.9215686, 1,
-0.09639893, -0.6359016, -3.298882, 0, 1, 0.9294118, 1,
-0.09281042, -0.7625837, -2.694093, 0, 1, 0.9333333, 1,
-0.08668675, 1.497213, -0.7529274, 0, 1, 0.9411765, 1,
-0.08544941, -0.8147249, -3.138107, 0, 1, 0.945098, 1,
-0.07906318, 1.668905, -0.8246941, 0, 1, 0.9529412, 1,
-0.07137607, -2.07755, -2.510689, 0, 1, 0.9568627, 1,
-0.06765094, 0.5751657, -0.6385296, 0, 1, 0.9647059, 1,
-0.06760975, 0.2358971, -0.176768, 0, 1, 0.9686275, 1,
-0.06662033, 0.2515365, -1.418164, 0, 1, 0.9764706, 1,
-0.06467749, 1.611113, 1.554206, 0, 1, 0.9803922, 1,
-0.06348804, 1.128274, 1.069115, 0, 1, 0.9882353, 1,
-0.05992494, -0.9944648, -4.099087, 0, 1, 0.9921569, 1,
-0.05716145, -0.4567835, -3.399431, 0, 1, 1, 1,
-0.04810116, -1.375978, -3.097237, 0, 0.9921569, 1, 1,
-0.03611681, -1.532585, -0.5806374, 0, 0.9882353, 1, 1,
-0.03599992, -0.5674853, -4.245575, 0, 0.9803922, 1, 1,
-0.02556971, 1.215991, -0.05789472, 0, 0.9764706, 1, 1,
-0.02142294, -0.9244878, -2.828772, 0, 0.9686275, 1, 1,
-0.01953782, -2.526816, -1.035311, 0, 0.9647059, 1, 1,
-0.01660116, -0.1711034, -2.152519, 0, 0.9568627, 1, 1,
-0.01539345, 0.001066558, -2.730095, 0, 0.9529412, 1, 1,
-0.01507238, -1.421385, -2.450883, 0, 0.945098, 1, 1,
-0.01339762, 1.816718, 0.3934553, 0, 0.9411765, 1, 1,
-0.01095045, 0.7085873, -0.9015642, 0, 0.9333333, 1, 1,
-0.009293904, -1.086621, -3.469899, 0, 0.9294118, 1, 1,
-0.008621026, -0.9073532, -3.219717, 0, 0.9215686, 1, 1,
-0.006875147, -0.2048044, -4.264836, 0, 0.9176471, 1, 1,
-0.002315154, -1.458472, -1.573588, 0, 0.9098039, 1, 1,
0.0009389948, 0.05122776, 1.754399, 0, 0.9058824, 1, 1,
0.001399269, 0.8602508, -0.03116567, 0, 0.8980392, 1, 1,
0.002886007, -0.2797183, 2.864616, 0, 0.8901961, 1, 1,
0.007010883, -1.518837, 2.310878, 0, 0.8862745, 1, 1,
0.007985467, 0.03885695, -0.1893033, 0, 0.8784314, 1, 1,
0.008066859, 0.01164981, 1.232874, 0, 0.8745098, 1, 1,
0.009158975, -1.008414, 3.004166, 0, 0.8666667, 1, 1,
0.0183972, 0.4080496, -0.3707056, 0, 0.8627451, 1, 1,
0.01956578, 0.1935585, 1.106741, 0, 0.854902, 1, 1,
0.02227639, -0.07197987, 2.822146, 0, 0.8509804, 1, 1,
0.02383726, 0.6853021, -1.145047, 0, 0.8431373, 1, 1,
0.02398855, 0.3151614, -0.2963775, 0, 0.8392157, 1, 1,
0.0244258, -1.490536, 3.62105, 0, 0.8313726, 1, 1,
0.02458335, 1.114778, -0.2471665, 0, 0.827451, 1, 1,
0.02492207, 0.7099367, 0.8901792, 0, 0.8196079, 1, 1,
0.02640019, 0.5458453, 1.603919, 0, 0.8156863, 1, 1,
0.02807801, 1.336871, 1.279883, 0, 0.8078431, 1, 1,
0.02954809, -0.1782911, 1.122145, 0, 0.8039216, 1, 1,
0.03077393, -0.8416039, 2.476058, 0, 0.7960784, 1, 1,
0.03118412, 0.2696913, -0.1073313, 0, 0.7882353, 1, 1,
0.03663756, -1.480285, 4.978041, 0, 0.7843137, 1, 1,
0.03788695, -0.4551374, 3.716381, 0, 0.7764706, 1, 1,
0.03875802, -0.6246693, 3.696162, 0, 0.772549, 1, 1,
0.0404888, 0.8928881, 0.853063, 0, 0.7647059, 1, 1,
0.04362399, -0.5313005, 4.29183, 0, 0.7607843, 1, 1,
0.04537128, 1.619083, -0.5165112, 0, 0.7529412, 1, 1,
0.05493186, -0.1220976, 3.836406, 0, 0.7490196, 1, 1,
0.05563381, 0.6573713, -0.7957727, 0, 0.7411765, 1, 1,
0.05837104, -1.261197, 2.915566, 0, 0.7372549, 1, 1,
0.05974415, -0.2249722, 1.42142, 0, 0.7294118, 1, 1,
0.06137317, -0.3034167, 3.917823, 0, 0.7254902, 1, 1,
0.06356195, -0.04009747, 1.774143, 0, 0.7176471, 1, 1,
0.06377634, -1.646859, 2.787975, 0, 0.7137255, 1, 1,
0.06778169, 0.8323126, -0.3634314, 0, 0.7058824, 1, 1,
0.06787469, -0.2647096, 0.9565127, 0, 0.6980392, 1, 1,
0.06970229, 1.851514, -0.3548125, 0, 0.6941177, 1, 1,
0.07328521, -0.8219087, 2.700979, 0, 0.6862745, 1, 1,
0.07825632, -1.169205, 3.644274, 0, 0.682353, 1, 1,
0.08148091, -0.2277158, 4.18373, 0, 0.6745098, 1, 1,
0.08377098, -0.8744489, 2.399457, 0, 0.6705883, 1, 1,
0.08742882, -1.498031, 3.461601, 0, 0.6627451, 1, 1,
0.08892654, -0.8022087, 2.526593, 0, 0.6588235, 1, 1,
0.0927209, 2.05146, -1.572766, 0, 0.6509804, 1, 1,
0.09279983, -0.05710076, 3.060919, 0, 0.6470588, 1, 1,
0.1038556, -0.3681909, 3.603035, 0, 0.6392157, 1, 1,
0.1041015, -0.2342052, 1.440052, 0, 0.6352941, 1, 1,
0.1045939, 0.7460708, -0.7118512, 0, 0.627451, 1, 1,
0.1051702, 0.5500065, -0.02610551, 0, 0.6235294, 1, 1,
0.1068649, -0.4615405, 2.187066, 0, 0.6156863, 1, 1,
0.1112646, 1.542432, 0.5133801, 0, 0.6117647, 1, 1,
0.1120008, 0.8605698, 0.5615816, 0, 0.6039216, 1, 1,
0.1142686, -0.8982051, 2.787293, 0, 0.5960785, 1, 1,
0.1182642, -1.53074, 4.540425, 0, 0.5921569, 1, 1,
0.1220223, -0.8197657, 2.535876, 0, 0.5843138, 1, 1,
0.1286599, 0.6447206, 0.3318326, 0, 0.5803922, 1, 1,
0.1334112, 0.1682126, 0.2457078, 0, 0.572549, 1, 1,
0.1340909, -0.3911175, 1.415113, 0, 0.5686275, 1, 1,
0.1352912, -0.6353242, 2.679053, 0, 0.5607843, 1, 1,
0.1353336, -0.06330386, 2.78291, 0, 0.5568628, 1, 1,
0.1373331, -0.4211684, 3.29582, 0, 0.5490196, 1, 1,
0.1483594, -0.1405911, 2.624405, 0, 0.5450981, 1, 1,
0.1498435, 0.1564386, -0.5025449, 0, 0.5372549, 1, 1,
0.1558283, -0.106097, 2.044759, 0, 0.5333334, 1, 1,
0.1561288, -0.1020511, 1.765184, 0, 0.5254902, 1, 1,
0.1571079, -0.3202955, 1.97996, 0, 0.5215687, 1, 1,
0.158345, 0.1516455, 2.153946, 0, 0.5137255, 1, 1,
0.161036, -0.9561695, 4.825089, 0, 0.509804, 1, 1,
0.1612526, -0.1738777, 1.974737, 0, 0.5019608, 1, 1,
0.1625581, 0.06926198, 2.515836, 0, 0.4941176, 1, 1,
0.1633813, 0.2721955, -0.04890934, 0, 0.4901961, 1, 1,
0.1662017, 0.5026685, 2.474482, 0, 0.4823529, 1, 1,
0.1710405, -0.5462845, 2.047912, 0, 0.4784314, 1, 1,
0.1787301, -0.1603625, 1.665035, 0, 0.4705882, 1, 1,
0.1828557, 0.9179448, -0.7833381, 0, 0.4666667, 1, 1,
0.1859049, -0.755222, 3.903065, 0, 0.4588235, 1, 1,
0.1963844, -0.859951, 3.640136, 0, 0.454902, 1, 1,
0.1967635, -1.514401, 1.524515, 0, 0.4470588, 1, 1,
0.1969366, -0.5806772, 2.490321, 0, 0.4431373, 1, 1,
0.1992537, 0.9469732, 1.059537, 0, 0.4352941, 1, 1,
0.2023895, 0.9118422, 0.1989973, 0, 0.4313726, 1, 1,
0.2035332, 0.2556071, -0.7485694, 0, 0.4235294, 1, 1,
0.2111343, -0.5902647, 1.254781, 0, 0.4196078, 1, 1,
0.2123759, 0.8182626, 0.2410894, 0, 0.4117647, 1, 1,
0.2137415, 0.9804571, 1.238465, 0, 0.4078431, 1, 1,
0.2146832, -0.8391535, 3.237876, 0, 0.4, 1, 1,
0.2171161, 0.7498803, 0.8878382, 0, 0.3921569, 1, 1,
0.2195257, -1.000457, 3.25289, 0, 0.3882353, 1, 1,
0.2257303, 1.162096, 0.967806, 0, 0.3803922, 1, 1,
0.2259457, 0.6967464, 0.8620859, 0, 0.3764706, 1, 1,
0.2260902, -0.1642726, 1.354718, 0, 0.3686275, 1, 1,
0.2268786, -1.05199, 3.086668, 0, 0.3647059, 1, 1,
0.228444, -0.2030319, 1.85193, 0, 0.3568628, 1, 1,
0.2315736, 0.5715607, 0.4272949, 0, 0.3529412, 1, 1,
0.2336454, 1.651738, -0.6107631, 0, 0.345098, 1, 1,
0.2385416, -1.67156, 3.538925, 0, 0.3411765, 1, 1,
0.2389395, -0.1393396, 3.487935, 0, 0.3333333, 1, 1,
0.2405988, -0.9848288, 2.1424, 0, 0.3294118, 1, 1,
0.2409658, -0.4358746, 3.667771, 0, 0.3215686, 1, 1,
0.2416628, 0.353989, 2.255863, 0, 0.3176471, 1, 1,
0.2420442, -1.38881, 2.377455, 0, 0.3098039, 1, 1,
0.2441897, -1.455211, 5.032688, 0, 0.3058824, 1, 1,
0.2493267, -0.8219616, 2.954281, 0, 0.2980392, 1, 1,
0.2518699, 0.3573973, 1.34787, 0, 0.2901961, 1, 1,
0.2532322, -0.4848348, 1.84411, 0, 0.2862745, 1, 1,
0.2575821, 0.5889138, 1.493247, 0, 0.2784314, 1, 1,
0.2612461, 0.4172049, -1.847549, 0, 0.2745098, 1, 1,
0.2615679, -0.9932622, 1.836284, 0, 0.2666667, 1, 1,
0.2657681, -1.975057, 1.312227, 0, 0.2627451, 1, 1,
0.2677203, -0.1629586, 2.265625, 0, 0.254902, 1, 1,
0.2688132, 0.7834519, -0.2839795, 0, 0.2509804, 1, 1,
0.2760561, -0.006538399, 2.273247, 0, 0.2431373, 1, 1,
0.2777011, 0.2164734, 1.571428, 0, 0.2392157, 1, 1,
0.2782831, -0.6119152, 3.423937, 0, 0.2313726, 1, 1,
0.2783856, -0.228585, 1.780303, 0, 0.227451, 1, 1,
0.2786462, -0.1603381, 2.281017, 0, 0.2196078, 1, 1,
0.2788725, -1.65036, 3.464228, 0, 0.2156863, 1, 1,
0.2832573, -0.2799356, -0.713449, 0, 0.2078431, 1, 1,
0.2839661, -0.4312131, 3.357802, 0, 0.2039216, 1, 1,
0.2873449, -0.7354059, 2.612914, 0, 0.1960784, 1, 1,
0.2878559, 0.3813239, -0.002573774, 0, 0.1882353, 1, 1,
0.2880412, 0.6010666, -0.844574, 0, 0.1843137, 1, 1,
0.2894312, -1.21748, 4.10866, 0, 0.1764706, 1, 1,
0.2913218, -0.7772067, 1.791671, 0, 0.172549, 1, 1,
0.2938735, -0.09625959, 2.575639, 0, 0.1647059, 1, 1,
0.2963443, -0.7225981, 4.390532, 0, 0.1607843, 1, 1,
0.2973086, -0.4813224, 2.028608, 0, 0.1529412, 1, 1,
0.2983142, -0.1075921, 1.812569, 0, 0.1490196, 1, 1,
0.2984591, 0.6430458, 0.0208543, 0, 0.1411765, 1, 1,
0.2993606, 0.8158122, 0.6971922, 0, 0.1372549, 1, 1,
0.2999921, 2.065057, -0.3896547, 0, 0.1294118, 1, 1,
0.3075248, 0.9296688, 1.268255, 0, 0.1254902, 1, 1,
0.3075911, 1.303284, 0.2686005, 0, 0.1176471, 1, 1,
0.3104973, -0.4972398, 3.598845, 0, 0.1137255, 1, 1,
0.3139403, -0.33961, 3.521575, 0, 0.1058824, 1, 1,
0.3152349, -0.1099065, 0.0659361, 0, 0.09803922, 1, 1,
0.3188099, 0.9988608, 1.141018, 0, 0.09411765, 1, 1,
0.3196493, -0.08944122, 1.571205, 0, 0.08627451, 1, 1,
0.3199939, -0.08889414, 1.20277, 0, 0.08235294, 1, 1,
0.3210798, 1.266824, -0.1568727, 0, 0.07450981, 1, 1,
0.3234191, -0.04483466, 2.082207, 0, 0.07058824, 1, 1,
0.3255673, -0.7288395, 1.464023, 0, 0.0627451, 1, 1,
0.3291484, 0.5167457, 0.1730612, 0, 0.05882353, 1, 1,
0.3291908, 0.4036218, 2.308761, 0, 0.05098039, 1, 1,
0.330002, 0.3040407, 0.352877, 0, 0.04705882, 1, 1,
0.3381405, -0.05323765, -0.338767, 0, 0.03921569, 1, 1,
0.34045, 2.560811, -0.4566235, 0, 0.03529412, 1, 1,
0.3410624, 1.156797, 0.1750226, 0, 0.02745098, 1, 1,
0.3538255, 1.444593, -0.3468727, 0, 0.02352941, 1, 1,
0.3552809, -1.061058, 3.732821, 0, 0.01568628, 1, 1,
0.3565447, 3.098154, 0.4316036, 0, 0.01176471, 1, 1,
0.3575698, 0.4002746, 0.03270832, 0, 0.003921569, 1, 1,
0.3592827, -0.1932499, 1.974478, 0.003921569, 0, 1, 1,
0.3646059, 1.5985, 0.5713243, 0.007843138, 0, 1, 1,
0.3650212, -0.5471891, 1.941701, 0.01568628, 0, 1, 1,
0.3653602, 0.0410222, 1.07059, 0.01960784, 0, 1, 1,
0.3655733, 0.6929883, 1.534047, 0.02745098, 0, 1, 1,
0.3665159, 0.1130735, 1.448756, 0.03137255, 0, 1, 1,
0.3695749, -0.484945, 4.910108, 0.03921569, 0, 1, 1,
0.3711175, -0.5117545, 3.177311, 0.04313726, 0, 1, 1,
0.3728986, 1.499249, -2.35064, 0.05098039, 0, 1, 1,
0.3819242, 1.159866, -0.825904, 0.05490196, 0, 1, 1,
0.3827297, -0.160592, 2.087634, 0.0627451, 0, 1, 1,
0.3873184, 0.5560889, -1.123183, 0.06666667, 0, 1, 1,
0.3918178, -0.4013432, 2.645351, 0.07450981, 0, 1, 1,
0.3940601, 0.5264621, 0.3058413, 0.07843138, 0, 1, 1,
0.3956352, 1.385836, -0.722776, 0.08627451, 0, 1, 1,
0.3989593, -1.77468, 4.486297, 0.09019608, 0, 1, 1,
0.3990024, -0.531028, 2.748467, 0.09803922, 0, 1, 1,
0.404969, -1.314556, 1.536597, 0.1058824, 0, 1, 1,
0.4119119, -0.04867025, 2.775437, 0.1098039, 0, 1, 1,
0.4165787, -0.8226116, 1.954995, 0.1176471, 0, 1, 1,
0.4292222, -0.9818535, 1.530908, 0.1215686, 0, 1, 1,
0.4317404, 0.9709765, 0.5618723, 0.1294118, 0, 1, 1,
0.4334475, 1.133837, -1.107258, 0.1333333, 0, 1, 1,
0.4347152, -1.11238, 2.637142, 0.1411765, 0, 1, 1,
0.4365532, 0.9255964, 0.5684332, 0.145098, 0, 1, 1,
0.4404533, 0.1317218, 1.746519, 0.1529412, 0, 1, 1,
0.4445985, 1.826247, -0.4798856, 0.1568628, 0, 1, 1,
0.4449431, -1.236465, 2.203163, 0.1647059, 0, 1, 1,
0.4487095, -1.767004, 1.514949, 0.1686275, 0, 1, 1,
0.452045, 0.4726741, -0.3454159, 0.1764706, 0, 1, 1,
0.4534162, -0.3104309, 0.8354571, 0.1803922, 0, 1, 1,
0.4557435, -0.4756778, 1.228059, 0.1882353, 0, 1, 1,
0.4568213, 0.370223, 1.371126, 0.1921569, 0, 1, 1,
0.4732436, -1.808827, 4.640697, 0.2, 0, 1, 1,
0.4798955, -1.226858, 1.312516, 0.2078431, 0, 1, 1,
0.4868118, -0.3885618, 2.405707, 0.2117647, 0, 1, 1,
0.4871646, 1.532665, 0.2675878, 0.2196078, 0, 1, 1,
0.4880812, 0.2728049, 1.703527, 0.2235294, 0, 1, 1,
0.4883172, -1.147514, 1.549801, 0.2313726, 0, 1, 1,
0.4896975, 0.2653847, 1.73184, 0.2352941, 0, 1, 1,
0.4938782, 0.2596155, 0.9376889, 0.2431373, 0, 1, 1,
0.4974973, 2.051792, 1.044898, 0.2470588, 0, 1, 1,
0.4987943, -0.6224242, 2.58045, 0.254902, 0, 1, 1,
0.5015126, 0.4119847, 0.9859031, 0.2588235, 0, 1, 1,
0.5017622, 0.440137, 1.052492, 0.2666667, 0, 1, 1,
0.5028226, -1.018731, 3.040106, 0.2705882, 0, 1, 1,
0.5046212, 1.10564, -0.0547077, 0.2784314, 0, 1, 1,
0.5064099, -0.3299631, 1.436246, 0.282353, 0, 1, 1,
0.5084041, 0.6039297, 1.822948, 0.2901961, 0, 1, 1,
0.5091845, 0.7271479, 3.045691, 0.2941177, 0, 1, 1,
0.5113304, 0.3642556, -1.380839, 0.3019608, 0, 1, 1,
0.5119458, -1.564016, 0.7151268, 0.3098039, 0, 1, 1,
0.5146196, -0.4813257, 2.617161, 0.3137255, 0, 1, 1,
0.516452, -0.8982509, 2.115038, 0.3215686, 0, 1, 1,
0.5191109, 1.074479, -0.269086, 0.3254902, 0, 1, 1,
0.5196457, -0.4539301, 2.827266, 0.3333333, 0, 1, 1,
0.5199295, -0.4053772, 2.073772, 0.3372549, 0, 1, 1,
0.5237995, -1.06648, 2.489327, 0.345098, 0, 1, 1,
0.5257224, 0.631187, -0.1979216, 0.3490196, 0, 1, 1,
0.5260295, -1.236471, 4.934762, 0.3568628, 0, 1, 1,
0.5268139, 0.298113, 2.574138, 0.3607843, 0, 1, 1,
0.5272152, -0.9364113, 3.782393, 0.3686275, 0, 1, 1,
0.5346622, -1.514461, 2.89348, 0.372549, 0, 1, 1,
0.5384998, -0.2665695, 1.761686, 0.3803922, 0, 1, 1,
0.5389816, -0.4687334, 0.5423015, 0.3843137, 0, 1, 1,
0.5408386, 2.122287, 0.08741327, 0.3921569, 0, 1, 1,
0.5439247, -1.5753, 2.754949, 0.3960784, 0, 1, 1,
0.549845, 3.081531, 1.696164, 0.4039216, 0, 1, 1,
0.5516383, -0.2537046, 1.697142, 0.4117647, 0, 1, 1,
0.5520354, 0.8288116, -0.5895917, 0.4156863, 0, 1, 1,
0.5570798, -0.408488, 1.662954, 0.4235294, 0, 1, 1,
0.5576742, -1.50973, 1.547255, 0.427451, 0, 1, 1,
0.5578017, 0.3661875, 0.001665903, 0.4352941, 0, 1, 1,
0.5585657, 2.085078, -0.1085686, 0.4392157, 0, 1, 1,
0.5593854, -0.1020977, 1.129903, 0.4470588, 0, 1, 1,
0.5604131, -0.6424237, 3.280574, 0.4509804, 0, 1, 1,
0.5699679, -0.6273672, 3.091696, 0.4588235, 0, 1, 1,
0.5706674, 1.808112, 0.8433789, 0.4627451, 0, 1, 1,
0.5734916, 1.64858, 0.9132833, 0.4705882, 0, 1, 1,
0.5768339, -0.2146392, 1.686978, 0.4745098, 0, 1, 1,
0.5781459, 0.4128142, -0.3789763, 0.4823529, 0, 1, 1,
0.5812747, 0.8677716, -1.109577, 0.4862745, 0, 1, 1,
0.5839313, -0.02880076, 2.061445, 0.4941176, 0, 1, 1,
0.5929506, 1.152139, 1.795374, 0.5019608, 0, 1, 1,
0.6030787, 0.5039613, 2.669873, 0.5058824, 0, 1, 1,
0.6050919, 0.8081745, -0.3535612, 0.5137255, 0, 1, 1,
0.605503, 0.1864192, 1.328701, 0.5176471, 0, 1, 1,
0.6075673, 0.740208, -0.4284679, 0.5254902, 0, 1, 1,
0.6093788, 0.2564068, -2.058092, 0.5294118, 0, 1, 1,
0.6110608, 0.6880631, 1.590346, 0.5372549, 0, 1, 1,
0.6142435, 0.7063884, 0.9276671, 0.5411765, 0, 1, 1,
0.6185315, -1.023472, 3.721661, 0.5490196, 0, 1, 1,
0.6186358, -0.4431916, 3.899531, 0.5529412, 0, 1, 1,
0.6198912, 1.235566, 0.9682316, 0.5607843, 0, 1, 1,
0.6213803, 1.43433, 1.347798, 0.5647059, 0, 1, 1,
0.6249874, 0.7668213, 1.266733, 0.572549, 0, 1, 1,
0.6251416, 0.8223467, -0.4666368, 0.5764706, 0, 1, 1,
0.6293465, 0.04822503, 3.174161, 0.5843138, 0, 1, 1,
0.636284, -0.923874, 1.045217, 0.5882353, 0, 1, 1,
0.637474, -0.01649011, 2.27108, 0.5960785, 0, 1, 1,
0.639606, 0.08650041, 0.7329088, 0.6039216, 0, 1, 1,
0.639649, 0.4137509, 1.261508, 0.6078432, 0, 1, 1,
0.6525658, 0.4155596, -0.879327, 0.6156863, 0, 1, 1,
0.6574183, 0.2302592, 1.008747, 0.6196079, 0, 1, 1,
0.6581057, 0.1610343, -0.2474606, 0.627451, 0, 1, 1,
0.6619917, -0.05621414, 2.016868, 0.6313726, 0, 1, 1,
0.6651012, 1.129217, 1.806276, 0.6392157, 0, 1, 1,
0.6770231, -0.1664454, 0.8790634, 0.6431373, 0, 1, 1,
0.6796174, -0.9457715, 2.626606, 0.6509804, 0, 1, 1,
0.680883, 0.03721701, -0.08725806, 0.654902, 0, 1, 1,
0.6841965, 1.699064, 0.4837994, 0.6627451, 0, 1, 1,
0.6843815, -0.883539, 3.715116, 0.6666667, 0, 1, 1,
0.6908961, 0.5074678, 2.302393, 0.6745098, 0, 1, 1,
0.6923679, 0.757213, 1.974831, 0.6784314, 0, 1, 1,
0.699348, -1.729523, 3.972808, 0.6862745, 0, 1, 1,
0.7073418, -0.2835164, 3.137516, 0.6901961, 0, 1, 1,
0.7150589, -0.8993378, 1.712636, 0.6980392, 0, 1, 1,
0.717791, 0.0001649648, 2.224842, 0.7058824, 0, 1, 1,
0.7237061, -0.1467621, 0.803511, 0.7098039, 0, 1, 1,
0.7359642, -0.05643395, 1.524075, 0.7176471, 0, 1, 1,
0.7492093, -0.6827392, 2.336281, 0.7215686, 0, 1, 1,
0.753941, -0.07779202, 1.145494, 0.7294118, 0, 1, 1,
0.7545677, 2.337701, 2.394768, 0.7333333, 0, 1, 1,
0.7567487, -0.3053554, 3.332938, 0.7411765, 0, 1, 1,
0.762021, 0.03091649, 2.619481, 0.7450981, 0, 1, 1,
0.7634173, -0.1871484, 2.423403, 0.7529412, 0, 1, 1,
0.7665017, 0.4559751, 3.12221, 0.7568628, 0, 1, 1,
0.7669994, -1.335497, 0.9863819, 0.7647059, 0, 1, 1,
0.7693121, -1.450414, 1.705735, 0.7686275, 0, 1, 1,
0.7708455, 0.1002606, 0.9059703, 0.7764706, 0, 1, 1,
0.7873639, 0.4775356, -1.425671, 0.7803922, 0, 1, 1,
0.8038532, 0.707093, 0.7464696, 0.7882353, 0, 1, 1,
0.8059319, -0.8589511, 3.419056, 0.7921569, 0, 1, 1,
0.8076245, -0.04245355, 1.916785, 0.8, 0, 1, 1,
0.8077034, 0.7742749, 1.104799, 0.8078431, 0, 1, 1,
0.8081175, 0.1131212, 1.680079, 0.8117647, 0, 1, 1,
0.8086578, -0.931491, 2.337188, 0.8196079, 0, 1, 1,
0.814281, 1.85816, -1.255238, 0.8235294, 0, 1, 1,
0.8144982, 0.2867515, 0.9906874, 0.8313726, 0, 1, 1,
0.8167545, -2.926876, 1.494707, 0.8352941, 0, 1, 1,
0.8198735, 0.126391, 1.121771, 0.8431373, 0, 1, 1,
0.8212996, 0.5227917, 0.3527884, 0.8470588, 0, 1, 1,
0.8242913, 0.1409472, 0.00762323, 0.854902, 0, 1, 1,
0.8296954, -0.2134083, 1.219303, 0.8588235, 0, 1, 1,
0.8479194, -0.06613903, 3.142056, 0.8666667, 0, 1, 1,
0.8535019, 1.204872, 0.7006797, 0.8705882, 0, 1, 1,
0.8662357, -0.530802, 1.059626, 0.8784314, 0, 1, 1,
0.8663393, -2.557034, 2.691954, 0.8823529, 0, 1, 1,
0.8693573, 1.969236, 2.289964, 0.8901961, 0, 1, 1,
0.8749232, -1.623877, 1.41193, 0.8941177, 0, 1, 1,
0.8753733, 1.803921, 0.9357664, 0.9019608, 0, 1, 1,
0.892352, -1.442516, 1.966443, 0.9098039, 0, 1, 1,
0.892927, -0.2092041, -0.728034, 0.9137255, 0, 1, 1,
0.8944982, 0.2745352, 1.306708, 0.9215686, 0, 1, 1,
0.9039066, 0.7247168, 0.02788872, 0.9254902, 0, 1, 1,
0.9083065, 0.8332068, 2.001772, 0.9333333, 0, 1, 1,
0.9157723, -0.997984, 0.7332497, 0.9372549, 0, 1, 1,
0.9197304, -2.248603, 1.046277, 0.945098, 0, 1, 1,
0.9214906, -0.6866034, 3.396159, 0.9490196, 0, 1, 1,
0.927302, 1.176295, 1.73786, 0.9568627, 0, 1, 1,
0.9293379, -0.1444022, 0.1045221, 0.9607843, 0, 1, 1,
0.9303269, -1.301255, 3.945771, 0.9686275, 0, 1, 1,
0.9316118, -0.9681443, 2.21059, 0.972549, 0, 1, 1,
0.9320554, 0.9132839, 1.831051, 0.9803922, 0, 1, 1,
0.937691, -2.788975, 4.008762, 0.9843137, 0, 1, 1,
0.941623, 0.6859303, 1.659248, 0.9921569, 0, 1, 1,
0.9422083, -0.7820137, 1.649817, 0.9960784, 0, 1, 1,
0.9449547, -2.471928, 0.9263742, 1, 0, 0.9960784, 1,
0.9473927, 0.357707, 0.8839, 1, 0, 0.9882353, 1,
0.9564104, 0.1820843, 0.1022114, 1, 0, 0.9843137, 1,
0.9582627, 1.887444, 1.181619, 1, 0, 0.9764706, 1,
0.964825, 0.4405786, 1.804667, 1, 0, 0.972549, 1,
0.9673893, 0.6100224, -0.2531697, 1, 0, 0.9647059, 1,
0.9799737, 0.1606569, 1.852217, 1, 0, 0.9607843, 1,
0.9802858, -0.9549631, 2.911824, 1, 0, 0.9529412, 1,
0.9844301, 1.052605, 0.6810584, 1, 0, 0.9490196, 1,
0.9872219, -2.330293, 2.076512, 1, 0, 0.9411765, 1,
0.9912406, 1.942781, 1.377608, 1, 0, 0.9372549, 1,
0.9935119, -1.155652, 2.234993, 1, 0, 0.9294118, 1,
1.00183, 0.5832546, 0.4572408, 1, 0, 0.9254902, 1,
1.008866, -0.5446366, 2.480346, 1, 0, 0.9176471, 1,
1.013709, 0.4927423, 1.540876, 1, 0, 0.9137255, 1,
1.017412, -1.352247, 2.473813, 1, 0, 0.9058824, 1,
1.022985, -0.2312342, 2.385262, 1, 0, 0.9019608, 1,
1.023015, 1.628748, -1.184173, 1, 0, 0.8941177, 1,
1.023669, 0.8476745, 1.666119, 1, 0, 0.8862745, 1,
1.02723, 0.8242919, 0.3055704, 1, 0, 0.8823529, 1,
1.030749, -1.43822, 3.04565, 1, 0, 0.8745098, 1,
1.033702, -2.139633, 2.64751, 1, 0, 0.8705882, 1,
1.0371, 0.4465501, -0.301307, 1, 0, 0.8627451, 1,
1.040678, -1.113299, 3.785378, 1, 0, 0.8588235, 1,
1.045187, 1.012165, 0.5822123, 1, 0, 0.8509804, 1,
1.049584, -0.4094019, 2.512771, 1, 0, 0.8470588, 1,
1.053941, 2.630008, 0.3922047, 1, 0, 0.8392157, 1,
1.056356, 1.266107, 1.099978, 1, 0, 0.8352941, 1,
1.05749, -0.8371426, 3.272075, 1, 0, 0.827451, 1,
1.06944, -0.05429776, 2.317564, 1, 0, 0.8235294, 1,
1.075389, 0.3857554, -0.3369026, 1, 0, 0.8156863, 1,
1.081663, -0.1236103, 1.131135, 1, 0, 0.8117647, 1,
1.087308, -1.308926, 1.293582, 1, 0, 0.8039216, 1,
1.099024, -0.5653704, 1.492063, 1, 0, 0.7960784, 1,
1.101942, 0.4253804, 1.179932, 1, 0, 0.7921569, 1,
1.110572, -1.664299, 3.409122, 1, 0, 0.7843137, 1,
1.115494, -0.7893512, 1.246205, 1, 0, 0.7803922, 1,
1.119668, -0.9850411, 2.787021, 1, 0, 0.772549, 1,
1.139289, -0.06164759, 2.051209, 1, 0, 0.7686275, 1,
1.14638, -0.0662732, 0.2260638, 1, 0, 0.7607843, 1,
1.147991, -0.2778185, 2.029659, 1, 0, 0.7568628, 1,
1.157458, 1.07027, 1.167633, 1, 0, 0.7490196, 1,
1.161458, 0.07038122, 2.383516, 1, 0, 0.7450981, 1,
1.165584, 1.384414, 0.05688074, 1, 0, 0.7372549, 1,
1.166778, 0.495589, 1.711892, 1, 0, 0.7333333, 1,
1.166983, -1.499238, 2.527455, 1, 0, 0.7254902, 1,
1.168178, 1.466812, 0.6248402, 1, 0, 0.7215686, 1,
1.16877, -0.2378075, 0.6263593, 1, 0, 0.7137255, 1,
1.173277, -1.187886, 3.265983, 1, 0, 0.7098039, 1,
1.189816, -0.5633528, 1.456579, 1, 0, 0.7019608, 1,
1.190863, 2.670933, -0.09565558, 1, 0, 0.6941177, 1,
1.202346, -0.6810818, 1.219185, 1, 0, 0.6901961, 1,
1.210721, 0.6666932, 1.588485, 1, 0, 0.682353, 1,
1.219251, 0.790319, -0.001159142, 1, 0, 0.6784314, 1,
1.221185, 0.2936388, -0.7331272, 1, 0, 0.6705883, 1,
1.230498, -0.2615387, 2.843108, 1, 0, 0.6666667, 1,
1.24778, -0.7100662, 1.992553, 1, 0, 0.6588235, 1,
1.253067, 0.4823706, 1.877073, 1, 0, 0.654902, 1,
1.259106, 1.082991, 1.574392, 1, 0, 0.6470588, 1,
1.275798, 1.250695, -0.3643275, 1, 0, 0.6431373, 1,
1.281688, -0.2026394, 2.177395, 1, 0, 0.6352941, 1,
1.285591, 0.8981574, -0.06238967, 1, 0, 0.6313726, 1,
1.289575, 0.5120081, 1.937802, 1, 0, 0.6235294, 1,
1.291462, -0.4354948, 0.7691174, 1, 0, 0.6196079, 1,
1.291923, -0.32478, 0.4391993, 1, 0, 0.6117647, 1,
1.298943, -0.6529664, 2.429021, 1, 0, 0.6078432, 1,
1.306679, 0.1576535, 2.04239, 1, 0, 0.6, 1,
1.307164, 1.574048, 1.767112, 1, 0, 0.5921569, 1,
1.307578, 1.035318, 1.826185, 1, 0, 0.5882353, 1,
1.317265, 2.022686, 1.138855, 1, 0, 0.5803922, 1,
1.328528, -1.030729, 3.376293, 1, 0, 0.5764706, 1,
1.358247, 0.1199751, 1.035097, 1, 0, 0.5686275, 1,
1.361093, -0.03261304, 1.776317, 1, 0, 0.5647059, 1,
1.38092, -0.317933, 0.324656, 1, 0, 0.5568628, 1,
1.3815, -0.7418126, 0.9657531, 1, 0, 0.5529412, 1,
1.383812, -1.45431, 3.176391, 1, 0, 0.5450981, 1,
1.385881, 1.148149, 0.6061031, 1, 0, 0.5411765, 1,
1.395646, 0.7924808, 1.9514, 1, 0, 0.5333334, 1,
1.403669, 1.123217, 0.3263336, 1, 0, 0.5294118, 1,
1.405953, -1.218418, 0.4315293, 1, 0, 0.5215687, 1,
1.411634, -0.7034804, 1.112416, 1, 0, 0.5176471, 1,
1.418852, -0.8434133, 1.570963, 1, 0, 0.509804, 1,
1.422854, 1.338508, 0.9899748, 1, 0, 0.5058824, 1,
1.4265, -0.7828109, 0.8827657, 1, 0, 0.4980392, 1,
1.427572, 0.5855905, 2.414344, 1, 0, 0.4901961, 1,
1.427971, -0.4061601, 2.611073, 1, 0, 0.4862745, 1,
1.430174, 0.3366669, 1.543368, 1, 0, 0.4784314, 1,
1.432073, 0.2466009, 1.202872, 1, 0, 0.4745098, 1,
1.440362, 0.7998088, 0.817184, 1, 0, 0.4666667, 1,
1.443721, 0.5553988, 1.162747, 1, 0, 0.4627451, 1,
1.451399, -1.035137, 1.360538, 1, 0, 0.454902, 1,
1.456684, -0.1402739, 2.17071, 1, 0, 0.4509804, 1,
1.456875, 0.3677499, 3.108078, 1, 0, 0.4431373, 1,
1.465294, 0.1331944, -0.3026634, 1, 0, 0.4392157, 1,
1.486865, 1.430026, -0.2889069, 1, 0, 0.4313726, 1,
1.502897, -0.7446007, 2.013814, 1, 0, 0.427451, 1,
1.51178, -1.158255, 4.487008, 1, 0, 0.4196078, 1,
1.515859, 1.006227, -0.1655233, 1, 0, 0.4156863, 1,
1.524299, -0.1073342, 3.262582, 1, 0, 0.4078431, 1,
1.557016, -0.8322777, 3.356347, 1, 0, 0.4039216, 1,
1.559419, 0.08062207, -0.2054831, 1, 0, 0.3960784, 1,
1.574399, 0.7730868, 1.961966, 1, 0, 0.3882353, 1,
1.575241, 0.8160241, 1.68307, 1, 0, 0.3843137, 1,
1.584255, -0.1669284, 2.263635, 1, 0, 0.3764706, 1,
1.594937, -0.8207135, 0.3578242, 1, 0, 0.372549, 1,
1.594997, 1.025239, 0.05415738, 1, 0, 0.3647059, 1,
1.599259, 1.14919, 2.705006, 1, 0, 0.3607843, 1,
1.605448, 1.417305, 1.451407, 1, 0, 0.3529412, 1,
1.608346, 0.5298359, 1.00975, 1, 0, 0.3490196, 1,
1.612612, -0.3581712, 0.1333955, 1, 0, 0.3411765, 1,
1.617825, -1.506733, 4.166521, 1, 0, 0.3372549, 1,
1.61791, -1.977123, 3.107268, 1, 0, 0.3294118, 1,
1.622764, 1.114889, 0.7902501, 1, 0, 0.3254902, 1,
1.650223, 0.1765926, 2.126563, 1, 0, 0.3176471, 1,
1.656912, -1.340461, 2.867884, 1, 0, 0.3137255, 1,
1.673682, -1.839126, 2.786141, 1, 0, 0.3058824, 1,
1.676694, 0.7162178, 2.213302, 1, 0, 0.2980392, 1,
1.685642, -0.5780771, 2.153167, 1, 0, 0.2941177, 1,
1.703166, -0.2628987, 2.591828, 1, 0, 0.2862745, 1,
1.703527, -1.093681, 1.287925, 1, 0, 0.282353, 1,
1.709214, -0.4514317, 2.593274, 1, 0, 0.2745098, 1,
1.71595, 1.22562, 1.149443, 1, 0, 0.2705882, 1,
1.736953, 0.1733939, 0.1521279, 1, 0, 0.2627451, 1,
1.756528, 0.3470503, 1.946717, 1, 0, 0.2588235, 1,
1.764397, 0.5548012, 1.367544, 1, 0, 0.2509804, 1,
1.764514, -0.7385458, 4.103076, 1, 0, 0.2470588, 1,
1.781249, 1.535475, 1.952029, 1, 0, 0.2392157, 1,
1.794469, 0.3191586, 1.986427, 1, 0, 0.2352941, 1,
1.797893, 1.53629, -0.1477631, 1, 0, 0.227451, 1,
1.817011, 0.5560976, 1.510112, 1, 0, 0.2235294, 1,
1.818384, 0.4011139, 1.875033, 1, 0, 0.2156863, 1,
1.844442, -1.699017, 3.064498, 1, 0, 0.2117647, 1,
1.848553, -0.1898113, 0.355493, 1, 0, 0.2039216, 1,
1.859305, 1.028185, -0.9992734, 1, 0, 0.1960784, 1,
1.871224, 1.937447, 1.48369, 1, 0, 0.1921569, 1,
1.874008, 0.9617184, 1.457829, 1, 0, 0.1843137, 1,
1.904724, 0.3707642, 0.3446695, 1, 0, 0.1803922, 1,
1.931574, 0.4599204, -1.008227, 1, 0, 0.172549, 1,
1.944756, 0.9358109, 1.371076, 1, 0, 0.1686275, 1,
1.959358, -0.417648, 1.362797, 1, 0, 0.1607843, 1,
1.965338, -0.7822118, 0.7553513, 1, 0, 0.1568628, 1,
1.999428, 1.927375, 3.061435, 1, 0, 0.1490196, 1,
2.010504, 0.5851628, 1.560684, 1, 0, 0.145098, 1,
2.02879, 0.6026781, 2.267561, 1, 0, 0.1372549, 1,
2.088622, 1.389452, 1.13621, 1, 0, 0.1333333, 1,
2.096385, 0.4537421, 0.48424, 1, 0, 0.1254902, 1,
2.11014, 0.7105464, 2.40598, 1, 0, 0.1215686, 1,
2.11104, -0.8772789, 0.6995766, 1, 0, 0.1137255, 1,
2.131726, -1.699436, 2.918759, 1, 0, 0.1098039, 1,
2.137338, -0.00938643, -0.2858461, 1, 0, 0.1019608, 1,
2.144023, 0.0977123, 3.308816, 1, 0, 0.09411765, 1,
2.181768, -0.9968931, 2.143275, 1, 0, 0.09019608, 1,
2.226353, -0.4882437, 0.9084616, 1, 0, 0.08235294, 1,
2.235105, -0.2437074, 3.822723, 1, 0, 0.07843138, 1,
2.239338, -0.2584364, 1.363367, 1, 0, 0.07058824, 1,
2.245408, -0.1166596, 1.966774, 1, 0, 0.06666667, 1,
2.246519, -0.9916255, 1.76237, 1, 0, 0.05882353, 1,
2.264068, 0.3743883, 2.644198, 1, 0, 0.05490196, 1,
2.290148, 1.457776, 1.331375, 1, 0, 0.04705882, 1,
2.349293, -0.875698, 3.73506, 1, 0, 0.04313726, 1,
2.373483, 1.389563, 1.230129, 1, 0, 0.03529412, 1,
2.398127, -1.206629, 2.431453, 1, 0, 0.03137255, 1,
2.628842, 1.375039, 1.99696, 1, 0, 0.02352941, 1,
2.630128, 0.2768829, 3.17985, 1, 0, 0.01960784, 1,
2.762851, -0.332066, -0.07273294, 1, 0, 0.01176471, 1,
2.832194, 0.4419616, 0.494725, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.1382327, -3.969553, -6.364511, 0, -0.5, 0.5, 0.5,
-0.1382327, -3.969553, -6.364511, 1, -0.5, 0.5, 0.5,
-0.1382327, -3.969553, -6.364511, 1, 1.5, 0.5, 0.5,
-0.1382327, -3.969553, -6.364511, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.115634, 0.1488689, -6.364511, 0, -0.5, 0.5, 0.5,
-4.115634, 0.1488689, -6.364511, 1, -0.5, 0.5, 0.5,
-4.115634, 0.1488689, -6.364511, 1, 1.5, 0.5, 0.5,
-4.115634, 0.1488689, -6.364511, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.115634, -3.969553, 0.1600077, 0, -0.5, 0.5, 0.5,
-4.115634, -3.969553, 0.1600077, 1, -0.5, 0.5, 0.5,
-4.115634, -3.969553, 0.1600077, 1, 1.5, 0.5, 0.5,
-4.115634, -3.969553, 0.1600077, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.019148, -4.858853,
2, -3.019148, -4.858853,
-3, -3.019148, -4.858853,
-3, -3.177549, -5.109796,
-2, -3.019148, -4.858853,
-2, -3.177549, -5.109796,
-1, -3.019148, -4.858853,
-1, -3.177549, -5.109796,
0, -3.019148, -4.858853,
0, -3.177549, -5.109796,
1, -3.019148, -4.858853,
1, -3.177549, -5.109796,
2, -3.019148, -4.858853,
2, -3.177549, -5.109796
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
-3, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
-3, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
-3, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5,
-2, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
-2, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
-2, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
-2, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5,
-1, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
-1, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
-1, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
-1, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5,
0, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
0, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
0, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
0, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5,
1, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
1, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
1, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
1, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5,
2, -3.494351, -5.611682, 0, -0.5, 0.5, 0.5,
2, -3.494351, -5.611682, 1, -0.5, 0.5, 0.5,
2, -3.494351, -5.611682, 1, 1.5, 0.5, 0.5,
2, -3.494351, -5.611682, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.197772, -2, -4.858853,
-3.197772, 3, -4.858853,
-3.197772, -2, -4.858853,
-3.350749, -2, -5.109796,
-3.197772, -1, -4.858853,
-3.350749, -1, -5.109796,
-3.197772, 0, -4.858853,
-3.350749, 0, -5.109796,
-3.197772, 1, -4.858853,
-3.350749, 1, -5.109796,
-3.197772, 2, -4.858853,
-3.350749, 2, -5.109796,
-3.197772, 3, -4.858853,
-3.350749, 3, -5.109796
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.656703, -2, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, -2, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, -2, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, -2, -5.611682, 0, 1.5, 0.5, 0.5,
-3.656703, -1, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, -1, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, -1, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, -1, -5.611682, 0, 1.5, 0.5, 0.5,
-3.656703, 0, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, 0, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, 0, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, 0, -5.611682, 0, 1.5, 0.5, 0.5,
-3.656703, 1, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, 1, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, 1, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, 1, -5.611682, 0, 1.5, 0.5, 0.5,
-3.656703, 2, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, 2, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, 2, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, 2, -5.611682, 0, 1.5, 0.5, 0.5,
-3.656703, 3, -5.611682, 0, -0.5, 0.5, 0.5,
-3.656703, 3, -5.611682, 1, -0.5, 0.5, 0.5,
-3.656703, 3, -5.611682, 1, 1.5, 0.5, 0.5,
-3.656703, 3, -5.611682, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.197772, -3.019148, -4,
-3.197772, -3.019148, 4,
-3.197772, -3.019148, -4,
-3.350749, -3.177549, -4,
-3.197772, -3.019148, -2,
-3.350749, -3.177549, -2,
-3.197772, -3.019148, 0,
-3.350749, -3.177549, 0,
-3.197772, -3.019148, 2,
-3.350749, -3.177549, 2,
-3.197772, -3.019148, 4,
-3.350749, -3.177549, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.656703, -3.494351, -4, 0, -0.5, 0.5, 0.5,
-3.656703, -3.494351, -4, 1, -0.5, 0.5, 0.5,
-3.656703, -3.494351, -4, 1, 1.5, 0.5, 0.5,
-3.656703, -3.494351, -4, 0, 1.5, 0.5, 0.5,
-3.656703, -3.494351, -2, 0, -0.5, 0.5, 0.5,
-3.656703, -3.494351, -2, 1, -0.5, 0.5, 0.5,
-3.656703, -3.494351, -2, 1, 1.5, 0.5, 0.5,
-3.656703, -3.494351, -2, 0, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 0, 0, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 0, 1, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 0, 1, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 0, 0, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 2, 0, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 2, 1, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 2, 1, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 2, 0, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 4, 0, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 4, 1, -0.5, 0.5, 0.5,
-3.656703, -3.494351, 4, 1, 1.5, 0.5, 0.5,
-3.656703, -3.494351, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.197772, -3.019148, -4.858853,
-3.197772, 3.316886, -4.858853,
-3.197772, -3.019148, 5.178869,
-3.197772, 3.316886, 5.178869,
-3.197772, -3.019148, -4.858853,
-3.197772, -3.019148, 5.178869,
-3.197772, 3.316886, -4.858853,
-3.197772, 3.316886, 5.178869,
-3.197772, -3.019148, -4.858853,
2.921307, -3.019148, -4.858853,
-3.197772, -3.019148, 5.178869,
2.921307, -3.019148, 5.178869,
-3.197772, 3.316886, -4.858853,
2.921307, 3.316886, -4.858853,
-3.197772, 3.316886, 5.178869,
2.921307, 3.316886, 5.178869,
2.921307, -3.019148, -4.858853,
2.921307, 3.316886, -4.858853,
2.921307, -3.019148, 5.178869,
2.921307, 3.316886, 5.178869,
2.921307, -3.019148, -4.858853,
2.921307, -3.019148, 5.178869,
2.921307, 3.316886, -4.858853,
2.921307, 3.316886, 5.178869
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.131077;
var distance = 31.72697;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1382327, -0.1488689, -0.1600077 );
mvMatrix.scale( 1.260036, 1.21689, 0.7681285 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.72697);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
ethyl-6-fluorobenzen<-read.table("ethyl-6-fluorobenzen.xyz")
```

```
## Error in read.table("ethyl-6-fluorobenzen.xyz"): no lines available in input
```

```r
x<-ethyl-6-fluorobenzen$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
y<-ethyl-6-fluorobenzen$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
z<-ethyl-6-fluorobenzen$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.10866, 0.5585421, -3.411128, 0, 0, 1, 1, 1,
-2.943999, 0.1698355, -0.4285606, 1, 0, 0, 1, 1,
-2.874061, 0.1941994, -3.429188, 1, 0, 0, 1, 1,
-2.808143, -1.344067, -2.018607, 1, 0, 0, 1, 1,
-2.792168, -0.8094003, -0.3099372, 1, 0, 0, 1, 1,
-2.714628, -0.3772638, -1.78393, 1, 0, 0, 1, 1,
-2.701847, 0.6286756, -2.414967, 0, 0, 0, 1, 1,
-2.610069, 2.300283, -0.6509031, 0, 0, 0, 1, 1,
-2.59528, -1.393685, -2.212371, 0, 0, 0, 1, 1,
-2.594558, -1.001486, -3.760308, 0, 0, 0, 1, 1,
-2.561913, -0.8340305, -2.017362, 0, 0, 0, 1, 1,
-2.440651, 0.9061402, -2.191601, 0, 0, 0, 1, 1,
-2.433479, 0.7998181, -0.9198225, 0, 0, 0, 1, 1,
-2.34456, 1.052843, -1.165036, 1, 1, 1, 1, 1,
-2.334347, -0.5611193, -0.5789918, 1, 1, 1, 1, 1,
-2.214545, 1.438285, -2.597145, 1, 1, 1, 1, 1,
-2.208748, -1.158696, -2.518786, 1, 1, 1, 1, 1,
-2.208353, -1.78639, -0.7092613, 1, 1, 1, 1, 1,
-2.201982, 0.7356161, -0.3834307, 1, 1, 1, 1, 1,
-2.187306, 0.9666209, -2.114127, 1, 1, 1, 1, 1,
-2.178938, -1.123761, -1.34838, 1, 1, 1, 1, 1,
-2.178453, -0.5824751, -2.114588, 1, 1, 1, 1, 1,
-2.177694, -0.8702815, -4.49036, 1, 1, 1, 1, 1,
-2.114186, -1.516983, -1.200407, 1, 1, 1, 1, 1,
-2.097188, 0.4760653, -0.3529012, 1, 1, 1, 1, 1,
-2.071369, -0.4022042, -1.058314, 1, 1, 1, 1, 1,
-2.049325, -0.546938, -1.76676, 1, 1, 1, 1, 1,
-2.03575, 2.185809, -0.3263107, 1, 1, 1, 1, 1,
-2.030808, -0.321014, -0.2028984, 0, 0, 1, 1, 1,
-2.004346, -1.191311, -1.967179, 1, 0, 0, 1, 1,
-1.984183, -1.920475, -2.885563, 1, 0, 0, 1, 1,
-1.975317, 0.75593, -1.856133, 1, 0, 0, 1, 1,
-1.93419, -0.166464, -2.039632, 1, 0, 0, 1, 1,
-1.927706, -0.5083681, -2.009453, 1, 0, 0, 1, 1,
-1.919987, -1.329338, -2.835183, 0, 0, 0, 1, 1,
-1.872145, 0.00827749, -1.421162, 0, 0, 0, 1, 1,
-1.844505, -1.081581, -3.756619, 0, 0, 0, 1, 1,
-1.836609, 0.7573908, -0.4768128, 0, 0, 0, 1, 1,
-1.835454, 1.130938, 0.2258841, 0, 0, 0, 1, 1,
-1.832514, -1.84234, -2.346288, 0, 0, 0, 1, 1,
-1.820742, 0.6576308, 0.1684727, 0, 0, 0, 1, 1,
-1.806992, 0.7455612, -1.792925, 1, 1, 1, 1, 1,
-1.801369, 1.901258, -1.417036, 1, 1, 1, 1, 1,
-1.797931, 0.1630052, -1.53972, 1, 1, 1, 1, 1,
-1.771958, 0.6018913, -1.477885, 1, 1, 1, 1, 1,
-1.767228, -0.61746, -0.3967426, 1, 1, 1, 1, 1,
-1.751953, 0.7635912, -2.679883, 1, 1, 1, 1, 1,
-1.743978, 0.3019757, -2.000105, 1, 1, 1, 1, 1,
-1.742968, -1.852774, -2.612405, 1, 1, 1, 1, 1,
-1.733712, -1.350892, -2.403983, 1, 1, 1, 1, 1,
-1.710651, -0.04423456, -2.143059, 1, 1, 1, 1, 1,
-1.690368, 1.086821, -1.371577, 1, 1, 1, 1, 1,
-1.689583, -0.07720804, -0.2723076, 1, 1, 1, 1, 1,
-1.685756, -2.110599, -1.964262, 1, 1, 1, 1, 1,
-1.666119, -0.3205992, -1.285171, 1, 1, 1, 1, 1,
-1.647827, -1.636976, -1.456241, 1, 1, 1, 1, 1,
-1.647685, 0.3686375, -1.892929, 0, 0, 1, 1, 1,
-1.623394, 0.7335844, -3.437527, 1, 0, 0, 1, 1,
-1.620253, -2.750731, -1.799338, 1, 0, 0, 1, 1,
-1.613339, -0.6669327, -0.428621, 1, 0, 0, 1, 1,
-1.600003, -0.1109819, -1.941132, 1, 0, 0, 1, 1,
-1.585282, -0.1212823, -1.386365, 1, 0, 0, 1, 1,
-1.584797, -1.655045, -3.313411, 0, 0, 0, 1, 1,
-1.581459, -0.2960088, -0.8248087, 0, 0, 0, 1, 1,
-1.579685, 0.8063893, -0.17203, 0, 0, 0, 1, 1,
-1.579426, 0.3352964, -1.871454, 0, 0, 0, 1, 1,
-1.577895, 0.4230237, 0.2077214, 0, 0, 0, 1, 1,
-1.565658, 0.7596614, -0.4177863, 0, 0, 0, 1, 1,
-1.56473, 1.122828, -0.7120095, 0, 0, 0, 1, 1,
-1.556547, 0.3613562, -1.811318, 1, 1, 1, 1, 1,
-1.555833, 1.17475, -0.802534, 1, 1, 1, 1, 1,
-1.549398, 0.3046976, -2.633364, 1, 1, 1, 1, 1,
-1.544517, -0.595415, -0.3760716, 1, 1, 1, 1, 1,
-1.505929, 0.08252317, -1.53209, 1, 1, 1, 1, 1,
-1.505673, -0.9383222, -3.204254, 1, 1, 1, 1, 1,
-1.494682, 0.05036862, -0.3296561, 1, 1, 1, 1, 1,
-1.473957, 1.304688, 1.053405, 1, 1, 1, 1, 1,
-1.471616, 0.06515832, -1.778429, 1, 1, 1, 1, 1,
-1.470901, -1.893617, -3.134566, 1, 1, 1, 1, 1,
-1.46123, 1.374525, -2.061459, 1, 1, 1, 1, 1,
-1.454768, -1.122085, -1.532996, 1, 1, 1, 1, 1,
-1.452668, -2.762272, -3.250201, 1, 1, 1, 1, 1,
-1.448704, 1.525999, -0.5918869, 1, 1, 1, 1, 1,
-1.446338, 1.045959, -1.41994, 1, 1, 1, 1, 1,
-1.43708, -0.08697601, -1.564228, 0, 0, 1, 1, 1,
-1.436965, -1.663072, -2.063844, 1, 0, 0, 1, 1,
-1.428592, -1.369084, -1.63151, 1, 0, 0, 1, 1,
-1.424057, -0.9213757, -2.850632, 1, 0, 0, 1, 1,
-1.414809, 0.7920825, -1.434284, 1, 0, 0, 1, 1,
-1.412038, -0.06197517, -0.713151, 1, 0, 0, 1, 1,
-1.408687, 1.910067, -1.23866, 0, 0, 0, 1, 1,
-1.400808, 0.7203815, -2.885962, 0, 0, 0, 1, 1,
-1.395379, 0.6260213, -0.65086, 0, 0, 0, 1, 1,
-1.389143, -1.512134, -3.595323, 0, 0, 0, 1, 1,
-1.369319, 1.291413, -2.115444, 0, 0, 0, 1, 1,
-1.366466, 0.788951, -0.1836102, 0, 0, 0, 1, 1,
-1.366121, -0.02844323, 0.5873072, 0, 0, 0, 1, 1,
-1.363829, -0.02944363, -1.818483, 1, 1, 1, 1, 1,
-1.361746, -0.601147, -2.294626, 1, 1, 1, 1, 1,
-1.361437, 1.348376, -2.339545, 1, 1, 1, 1, 1,
-1.349245, 0.2408107, -1.958653, 1, 1, 1, 1, 1,
-1.348052, -0.588573, -0.6293852, 1, 1, 1, 1, 1,
-1.347752, 1.57566, -2.308632, 1, 1, 1, 1, 1,
-1.346677, -0.009172085, -2.538059, 1, 1, 1, 1, 1,
-1.336471, -1.040315, -0.6217903, 1, 1, 1, 1, 1,
-1.335681, 0.1278207, -1.54244, 1, 1, 1, 1, 1,
-1.330845, 0.2372628, 0.435156, 1, 1, 1, 1, 1,
-1.329872, 0.7243591, -0.7721588, 1, 1, 1, 1, 1,
-1.321462, -1.501733, -2.693086, 1, 1, 1, 1, 1,
-1.306922, -0.134374, -3.732597, 1, 1, 1, 1, 1,
-1.303494, 0.3581856, -0.7430569, 1, 1, 1, 1, 1,
-1.299063, 0.2412604, -3.258555, 1, 1, 1, 1, 1,
-1.298895, -2.265547, -2.268971, 0, 0, 1, 1, 1,
-1.290323, 0.8911729, -1.924674, 1, 0, 0, 1, 1,
-1.280831, -0.4942113, -2.102803, 1, 0, 0, 1, 1,
-1.278555, -0.1511959, -0.4216128, 1, 0, 0, 1, 1,
-1.273986, 0.1146519, -2.643038, 1, 0, 0, 1, 1,
-1.269818, 1.373494, -1.70329, 1, 0, 0, 1, 1,
-1.269392, 0.4211672, 0.4447865, 0, 0, 0, 1, 1,
-1.258387, -0.5346065, -1.463235, 0, 0, 0, 1, 1,
-1.25292, 0.6231516, -0.3875538, 0, 0, 0, 1, 1,
-1.25019, 1.25421, 0.3670922, 0, 0, 0, 1, 1,
-1.242547, -1.95133, -4.300589, 0, 0, 0, 1, 1,
-1.23614, 2.417944, -1.098953, 0, 0, 0, 1, 1,
-1.234316, 1.229871, -1.119328, 0, 0, 0, 1, 1,
-1.226425, 0.1799414, 0.6416846, 1, 1, 1, 1, 1,
-1.224054, 1.481929, -0.911384, 1, 1, 1, 1, 1,
-1.223359, -0.6399004, -1.455607, 1, 1, 1, 1, 1,
-1.221928, -0.2824533, -2.610507, 1, 1, 1, 1, 1,
-1.219042, 0.5760749, -1.968689, 1, 1, 1, 1, 1,
-1.218066, -0.6115378, -1.869088, 1, 1, 1, 1, 1,
-1.214264, 0.9720552, 1.505827, 1, 1, 1, 1, 1,
-1.211495, -0.04942228, -1.360901, 1, 1, 1, 1, 1,
-1.20605, 1.465025, -1.229236, 1, 1, 1, 1, 1,
-1.20563, 0.3104846, -0.4865004, 1, 1, 1, 1, 1,
-1.204704, -0.3120655, -3.282135, 1, 1, 1, 1, 1,
-1.200642, 2.027015, -0.06892549, 1, 1, 1, 1, 1,
-1.197677, -0.8483294, -3.306206, 1, 1, 1, 1, 1,
-1.191354, 0.5020505, -1.865223, 1, 1, 1, 1, 1,
-1.189029, -2.219819, -2.480528, 1, 1, 1, 1, 1,
-1.186266, -0.1489312, -0.5416654, 0, 0, 1, 1, 1,
-1.182408, 1.643759, -0.5610234, 1, 0, 0, 1, 1,
-1.179644, 0.01822183, -2.426669, 1, 0, 0, 1, 1,
-1.169392, -0.5284126, -1.766258, 1, 0, 0, 1, 1,
-1.166465, -0.9192793, -1.544681, 1, 0, 0, 1, 1,
-1.162484, 1.044917, -1.613438, 1, 0, 0, 1, 1,
-1.161309, -0.07917587, -0.5433702, 0, 0, 0, 1, 1,
-1.153857, -1.24425, -1.107301, 0, 0, 0, 1, 1,
-1.153192, -1.01163, -3.049376, 0, 0, 0, 1, 1,
-1.151147, -0.9312676, -2.899961, 0, 0, 0, 1, 1,
-1.146647, 1.1963, -1.768739, 0, 0, 0, 1, 1,
-1.144014, 0.3784567, -0.7934369, 0, 0, 0, 1, 1,
-1.143302, 0.9602116, -0.5791165, 0, 0, 0, 1, 1,
-1.139677, 1.952377, -1.205711, 1, 1, 1, 1, 1,
-1.137442, 0.4957446, 0.1174708, 1, 1, 1, 1, 1,
-1.13336, -0.8693213, -1.811634, 1, 1, 1, 1, 1,
-1.121868, -0.7199793, -2.443972, 1, 1, 1, 1, 1,
-1.102522, 0.5387968, -1.121809, 1, 1, 1, 1, 1,
-1.097647, -0.4901353, 0.3582169, 1, 1, 1, 1, 1,
-1.095617, 0.2262751, -2.041785, 1, 1, 1, 1, 1,
-1.091601, -0.09721407, -2.784858, 1, 1, 1, 1, 1,
-1.083626, -0.9125482, -2.661148, 1, 1, 1, 1, 1,
-1.082182, -0.02308606, -2.996978, 1, 1, 1, 1, 1,
-1.078609, 1.169153, -1.087509, 1, 1, 1, 1, 1,
-1.077968, 0.09672663, -0.9387928, 1, 1, 1, 1, 1,
-1.076461, 0.5494105, -0.5610735, 1, 1, 1, 1, 1,
-1.069833, 0.6528265, -1.412395, 1, 1, 1, 1, 1,
-1.068823, -0.001869478, -3.123818, 1, 1, 1, 1, 1,
-1.065392, 1.465701, -0.3771392, 0, 0, 1, 1, 1,
-1.063104, -0.5785677, -1.628076, 1, 0, 0, 1, 1,
-1.062798, -0.6478305, -1.383135, 1, 0, 0, 1, 1,
-1.049913, 0.08163578, -0.6822861, 1, 0, 0, 1, 1,
-1.048937, 0.379316, -0.7886821, 1, 0, 0, 1, 1,
-1.04294, 0.2316855, -2.20762, 1, 0, 0, 1, 1,
-1.039965, -0.6839466, -1.688813, 0, 0, 0, 1, 1,
-1.03782, -1.388054, -2.821602, 0, 0, 0, 1, 1,
-1.03657, -1.778127, -3.775975, 0, 0, 0, 1, 1,
-1.034815, -0.5809568, -2.018617, 0, 0, 0, 1, 1,
-1.034429, -1.647445, -2.286477, 0, 0, 0, 1, 1,
-1.027164, -1.211194, -2.857936, 0, 0, 0, 1, 1,
-1.020008, 0.08075213, -1.789615, 0, 0, 0, 1, 1,
-1.017763, -1.148949, -2.648429, 1, 1, 1, 1, 1,
-1.0155, -1.05635, -2.652364, 1, 1, 1, 1, 1,
-1.010623, 0.9481084, -1.499001, 1, 1, 1, 1, 1,
-1.009314, -0.4227264, -3.11294, 1, 1, 1, 1, 1,
-1.006497, -1.11152, -1.538733, 1, 1, 1, 1, 1,
-1.003337, -0.09150824, -1.486995, 1, 1, 1, 1, 1,
-1.003116, 0.8073823, 0.2130565, 1, 1, 1, 1, 1,
-0.9970795, -0.4955512, -3.742921, 1, 1, 1, 1, 1,
-0.9967855, 0.05747039, -2.41495, 1, 1, 1, 1, 1,
-0.9952147, 0.8283896, -0.03764827, 1, 1, 1, 1, 1,
-0.9927842, 0.4274193, -1.681072, 1, 1, 1, 1, 1,
-0.9833525, 0.3110542, -2.397825, 1, 1, 1, 1, 1,
-0.9804749, -0.2154739, -1.704583, 1, 1, 1, 1, 1,
-0.9770014, 0.7936489, -2.078007, 1, 1, 1, 1, 1,
-0.9730558, 2.252302, -0.9665998, 1, 1, 1, 1, 1,
-0.9662124, -0.8389776, -1.820284, 0, 0, 1, 1, 1,
-0.9637878, 1.632215, -1.581405, 1, 0, 0, 1, 1,
-0.9583541, -0.4278109, -2.871918, 1, 0, 0, 1, 1,
-0.9569108, 0.8020219, -1.474709, 1, 0, 0, 1, 1,
-0.9536877, -0.6148244, -0.9339311, 1, 0, 0, 1, 1,
-0.9473268, -1.7872, -3.285571, 1, 0, 0, 1, 1,
-0.9458581, -0.013209, -1.175715, 0, 0, 0, 1, 1,
-0.9452543, -0.2379539, -0.9438201, 0, 0, 0, 1, 1,
-0.9432687, -1.456737, -2.190417, 0, 0, 0, 1, 1,
-0.9365522, -1.058817, -2.942966, 0, 0, 0, 1, 1,
-0.9364827, 0.2656968, -2.093992, 0, 0, 0, 1, 1,
-0.9314443, 0.5595292, -2.27329, 0, 0, 0, 1, 1,
-0.9288979, -1.973409, -3.891595, 0, 0, 0, 1, 1,
-0.9253134, 1.666795, -1.138569, 1, 1, 1, 1, 1,
-0.9250838, -1.725956, -2.338114, 1, 1, 1, 1, 1,
-0.9149036, -2.303784, -1.609521, 1, 1, 1, 1, 1,
-0.9126701, -1.046556, -2.275737, 1, 1, 1, 1, 1,
-0.9074338, -0.2545818, -1.809303, 1, 1, 1, 1, 1,
-0.9056861, -0.8384376, -0.8520213, 1, 1, 1, 1, 1,
-0.9000612, -0.0473375, -0.008806188, 1, 1, 1, 1, 1,
-0.8966759, -0.02043381, -3.070891, 1, 1, 1, 1, 1,
-0.894835, -0.4458096, -2.64912, 1, 1, 1, 1, 1,
-0.8920347, -1.316804, -2.213363, 1, 1, 1, 1, 1,
-0.8858181, -0.3465814, 0.6008475, 1, 1, 1, 1, 1,
-0.8815556, 0.8306175, 0.1615533, 1, 1, 1, 1, 1,
-0.8807138, -0.09696662, -1.107394, 1, 1, 1, 1, 1,
-0.8804863, 1.193366, 0.3812211, 1, 1, 1, 1, 1,
-0.8797512, -0.9840544, -4.051861, 1, 1, 1, 1, 1,
-0.8770009, 3.224614, -0.5000647, 0, 0, 1, 1, 1,
-0.8736194, 0.1809613, -1.425241, 1, 0, 0, 1, 1,
-0.8712243, -1.325919, -2.397153, 1, 0, 0, 1, 1,
-0.8686963, -1.324914, -2.856947, 1, 0, 0, 1, 1,
-0.8684739, -0.1365273, -2.916267, 1, 0, 0, 1, 1,
-0.8636606, -0.08357383, -0.6215377, 1, 0, 0, 1, 1,
-0.8622364, -1.108107, -3.282564, 0, 0, 0, 1, 1,
-0.8621678, 1.158799, -1.046269, 0, 0, 0, 1, 1,
-0.8560253, -0.9480329, -1.947981, 0, 0, 0, 1, 1,
-0.8547305, -0.1473106, -1.082776, 0, 0, 0, 1, 1,
-0.8447898, 0.6473324, -0.06551483, 0, 0, 0, 1, 1,
-0.8422079, 0.04494377, -1.959567, 0, 0, 0, 1, 1,
-0.8417234, 0.4132704, -0.6377566, 0, 0, 0, 1, 1,
-0.8360854, 1.323178, -1.411445, 1, 1, 1, 1, 1,
-0.835111, 0.1294871, -1.728603, 1, 1, 1, 1, 1,
-0.8310564, -0.4946135, -2.281436, 1, 1, 1, 1, 1,
-0.8219771, 0.6606598, -1.560773, 1, 1, 1, 1, 1,
-0.8129054, -0.2471659, -1.898534, 1, 1, 1, 1, 1,
-0.8101481, 0.328784, 0.9405192, 1, 1, 1, 1, 1,
-0.8058644, 0.5649295, -0.9159083, 1, 1, 1, 1, 1,
-0.7985467, 0.3429569, -0.8991269, 1, 1, 1, 1, 1,
-0.7970439, -1.039218, -2.920712, 1, 1, 1, 1, 1,
-0.7960981, 0.6312768, -0.4833924, 1, 1, 1, 1, 1,
-0.7935458, -0.757983, -1.079106, 1, 1, 1, 1, 1,
-0.7924736, -0.553269, -0.3870357, 1, 1, 1, 1, 1,
-0.7885394, 0.6079879, -1.823087, 1, 1, 1, 1, 1,
-0.7862428, -0.8479016, -0.8016424, 1, 1, 1, 1, 1,
-0.7851608, 1.10457, -2.157177, 1, 1, 1, 1, 1,
-0.7820324, 0.2375168, -1.479095, 0, 0, 1, 1, 1,
-0.7800189, 0.846823, -1.697088, 1, 0, 0, 1, 1,
-0.778236, -1.195235, -2.889608, 1, 0, 0, 1, 1,
-0.7756522, -0.5829648, -0.4540196, 1, 0, 0, 1, 1,
-0.7725298, 0.0922889, -0.9193518, 1, 0, 0, 1, 1,
-0.7675329, 0.3914365, -1.217882, 1, 0, 0, 1, 1,
-0.764245, -0.4412448, -0.6540329, 0, 0, 0, 1, 1,
-0.763292, -0.1096834, -1.42402, 0, 0, 0, 1, 1,
-0.762993, 0.4146132, -0.9706833, 0, 0, 0, 1, 1,
-0.758199, 0.519891, -0.03102467, 0, 0, 0, 1, 1,
-0.7475967, -0.09753748, -1.670894, 0, 0, 0, 1, 1,
-0.7450718, 0.886588, -2.822661, 0, 0, 0, 1, 1,
-0.7443336, -0.1240648, -3.074344, 0, 0, 0, 1, 1,
-0.7438112, -0.2479504, -1.469006, 1, 1, 1, 1, 1,
-0.7421815, -0.4729408, -3.829143, 1, 1, 1, 1, 1,
-0.7381015, -0.203191, -1.365557, 1, 1, 1, 1, 1,
-0.7322519, -2.4122, -1.505421, 1, 1, 1, 1, 1,
-0.7284265, 1.129113, -0.5238077, 1, 1, 1, 1, 1,
-0.7277218, 0.2885801, -0.52904, 1, 1, 1, 1, 1,
-0.7251731, -0.8488054, -1.343628, 1, 1, 1, 1, 1,
-0.7245565, 0.9182655, -0.03460788, 1, 1, 1, 1, 1,
-0.7225807, 0.2448217, -0.2416675, 1, 1, 1, 1, 1,
-0.7208388, -0.6768903, -1.885722, 1, 1, 1, 1, 1,
-0.7174885, 1.076874, -1.054432, 1, 1, 1, 1, 1,
-0.7043893, 1.681313, 2.489128, 1, 1, 1, 1, 1,
-0.6970824, 0.6549477, 1.811091, 1, 1, 1, 1, 1,
-0.6920786, 0.1399636, -2.08877, 1, 1, 1, 1, 1,
-0.6881565, -0.6908369, -1.525542, 1, 1, 1, 1, 1,
-0.6786428, -0.07313155, -1.504158, 0, 0, 1, 1, 1,
-0.6770304, 0.2057733, -1.131597, 1, 0, 0, 1, 1,
-0.6759429, 1.175601, -1.632361, 1, 0, 0, 1, 1,
-0.6731387, 1.301855, 1.118478, 1, 0, 0, 1, 1,
-0.6685407, 1.413431, -1.324028, 1, 0, 0, 1, 1,
-0.6637372, -1.160991, -3.803044, 1, 0, 0, 1, 1,
-0.6588426, 0.2710661, -0.1991461, 0, 0, 0, 1, 1,
-0.6580415, -0.2463049, -2.375325, 0, 0, 0, 1, 1,
-0.6554157, 0.4096329, -0.5601332, 0, 0, 0, 1, 1,
-0.6520059, 0.02452273, -1.05932, 0, 0, 0, 1, 1,
-0.6479901, 0.09644168, -2.929381, 0, 0, 0, 1, 1,
-0.6396056, 0.261419, -0.580022, 0, 0, 0, 1, 1,
-0.6346235, 1.20084, 1.001471, 0, 0, 0, 1, 1,
-0.6312076, 0.2439838, -1.542688, 1, 1, 1, 1, 1,
-0.6281018, -0.4362452, -3.275236, 1, 1, 1, 1, 1,
-0.6279901, -0.6121609, -3.055921, 1, 1, 1, 1, 1,
-0.6274834, -0.7489787, -2.075517, 1, 1, 1, 1, 1,
-0.6272033, 0.2280558, -1.855644, 1, 1, 1, 1, 1,
-0.6212516, -0.4946325, -1.400155, 1, 1, 1, 1, 1,
-0.6162661, -1.982634, -1.908774, 1, 1, 1, 1, 1,
-0.6128442, 0.459083, -0.9074051, 1, 1, 1, 1, 1,
-0.6120146, -0.8240135, -2.240359, 1, 1, 1, 1, 1,
-0.60459, -0.4194713, -3.09049, 1, 1, 1, 1, 1,
-0.5979426, 0.1798467, -0.6767023, 1, 1, 1, 1, 1,
-0.5945908, 1.354262, -1.026523, 1, 1, 1, 1, 1,
-0.5945746, -0.9856872, -2.336012, 1, 1, 1, 1, 1,
-0.5920572, 0.7485766, 0.633453, 1, 1, 1, 1, 1,
-0.586953, 1.108705, -0.5334414, 1, 1, 1, 1, 1,
-0.5817909, 1.491641, -0.8830605, 0, 0, 1, 1, 1,
-0.5773423, -2.504174, -3.094132, 1, 0, 0, 1, 1,
-0.5755769, 0.9892095, -0.1067036, 1, 0, 0, 1, 1,
-0.5742071, -1.506232, -3.887116, 1, 0, 0, 1, 1,
-0.5711215, -0.7434928, -3.612169, 1, 0, 0, 1, 1,
-0.5699598, 0.8428605, -0.5961967, 1, 0, 0, 1, 1,
-0.5695468, 0.06590554, -0.8356876, 0, 0, 0, 1, 1,
-0.5618058, -0.5396001, -3.19422, 0, 0, 0, 1, 1,
-0.5617455, 0.9769676, 1.753482, 0, 0, 0, 1, 1,
-0.5585083, 0.04998142, -2.155442, 0, 0, 0, 1, 1,
-0.5545224, -1.051847, -2.567931, 0, 0, 0, 1, 1,
-0.5418497, -0.8058394, -1.445496, 0, 0, 0, 1, 1,
-0.5391277, 2.000653, 0.2883591, 0, 0, 0, 1, 1,
-0.536431, -0.541485, -1.83245, 1, 1, 1, 1, 1,
-0.5354968, -0.4585894, -0.9055215, 1, 1, 1, 1, 1,
-0.5318652, -0.4524396, -2.340961, 1, 1, 1, 1, 1,
-0.5276688, 1.891025, -0.1659679, 1, 1, 1, 1, 1,
-0.5261118, -0.4313623, -2.428717, 1, 1, 1, 1, 1,
-0.5257678, -0.2650356, -1.574989, 1, 1, 1, 1, 1,
-0.5250571, 0.2336211, -1.035584, 1, 1, 1, 1, 1,
-0.5231084, 0.1809705, -1.450985, 1, 1, 1, 1, 1,
-0.5204461, 0.3074107, -0.3562395, 1, 1, 1, 1, 1,
-0.5165182, 0.8888344, -0.3975688, 1, 1, 1, 1, 1,
-0.5141354, 1.295748, 0.1896635, 1, 1, 1, 1, 1,
-0.5042192, -0.274446, -1.235083, 1, 1, 1, 1, 1,
-0.5029135, -0.9479216, -3.08738, 1, 1, 1, 1, 1,
-0.5002831, 1.069835, -0.3891802, 1, 1, 1, 1, 1,
-0.4997946, -0.08364771, -1.770156, 1, 1, 1, 1, 1,
-0.4992663, 0.1315452, -0.9280784, 0, 0, 1, 1, 1,
-0.4972728, -0.6227633, -4.445254, 1, 0, 0, 1, 1,
-0.4931965, -1.194415, -2.948935, 1, 0, 0, 1, 1,
-0.4862443, 0.9266899, 0.1538042, 1, 0, 0, 1, 1,
-0.4829488, -0.5149155, -1.465899, 1, 0, 0, 1, 1,
-0.4754424, -0.5518919, -2.358844, 1, 0, 0, 1, 1,
-0.4691449, 2.357886, -0.1747563, 0, 0, 0, 1, 1,
-0.46866, 1.269673, 0.7976623, 0, 0, 0, 1, 1,
-0.4677977, -0.004006723, -0.8300766, 0, 0, 0, 1, 1,
-0.4676932, 1.110105, -1.037168, 0, 0, 0, 1, 1,
-0.4612662, -0.03605162, -2.794702, 0, 0, 0, 1, 1,
-0.4526725, -2.318801, -4.175839, 0, 0, 0, 1, 1,
-0.4498993, 1.432137, -0.7253538, 0, 0, 0, 1, 1,
-0.4488645, 0.03676763, -0.8090217, 1, 1, 1, 1, 1,
-0.4483622, -0.5196966, -2.484751, 1, 1, 1, 1, 1,
-0.4441624, -0.1927294, -1.140323, 1, 1, 1, 1, 1,
-0.4421328, -0.23895, -1.36904, 1, 1, 1, 1, 1,
-0.4367949, 0.2024275, -1.739893, 1, 1, 1, 1, 1,
-0.4218691, 0.8409162, 1.743156, 1, 1, 1, 1, 1,
-0.4208989, -1.164123, -1.972609, 1, 1, 1, 1, 1,
-0.4200836, -1.054681, -3.512043, 1, 1, 1, 1, 1,
-0.4191606, 1.137003, -2.250319, 1, 1, 1, 1, 1,
-0.4171576, 0.4557105, -0.7710992, 1, 1, 1, 1, 1,
-0.4154218, 0.2163124, -1.682503, 1, 1, 1, 1, 1,
-0.4103611, -0.3372425, -4.133866, 1, 1, 1, 1, 1,
-0.4092013, 0.62093, -0.4769135, 1, 1, 1, 1, 1,
-0.4079964, -0.9620433, -3.661986, 1, 1, 1, 1, 1,
-0.407096, -2.256962, -2.405094, 1, 1, 1, 1, 1,
-0.4057726, 1.557176, -1.133092, 0, 0, 1, 1, 1,
-0.3966621, -0.6226403, -1.573696, 1, 0, 0, 1, 1,
-0.3948877, 0.6733293, -1.396021, 1, 0, 0, 1, 1,
-0.3900121, 0.1390375, 0.5845591, 1, 0, 0, 1, 1,
-0.3858096, 1.342358, -0.7821747, 1, 0, 0, 1, 1,
-0.3821816, 0.3775439, -1.312379, 1, 0, 0, 1, 1,
-0.3800912, -0.6249654, -2.111703, 0, 0, 0, 1, 1,
-0.3800138, 1.748435, -0.3949342, 0, 0, 0, 1, 1,
-0.3798433, 0.6071166, -0.4955374, 0, 0, 0, 1, 1,
-0.3728389, 1.497334, -1.823389, 0, 0, 0, 1, 1,
-0.370093, -0.8735328, -2.515663, 0, 0, 0, 1, 1,
-0.36896, 1.134724, 0.004337445, 0, 0, 0, 1, 1,
-0.364569, 1.175954, -2.185384, 0, 0, 0, 1, 1,
-0.3590768, 2.489713, -0.2422393, 1, 1, 1, 1, 1,
-0.3580216, 0.65418, -0.3961425, 1, 1, 1, 1, 1,
-0.3567048, -0.4261553, -4.627314, 1, 1, 1, 1, 1,
-0.3564641, -0.6555978, -2.737311, 1, 1, 1, 1, 1,
-0.3562021, -1.127524, -3.527475, 1, 1, 1, 1, 1,
-0.3504748, -0.03896003, -1.666119, 1, 1, 1, 1, 1,
-0.3480002, 0.07942572, -2.798807, 1, 1, 1, 1, 1,
-0.3477966, 0.7196324, -2.184223, 1, 1, 1, 1, 1,
-0.3461426, -0.7899626, -1.68846, 1, 1, 1, 1, 1,
-0.3448121, -0.9438104, -1.968024, 1, 1, 1, 1, 1,
-0.3444522, 0.9031045, -0.5123654, 1, 1, 1, 1, 1,
-0.3434018, 0.1063164, -1.220774, 1, 1, 1, 1, 1,
-0.3419244, 0.4433914, 0.3234185, 1, 1, 1, 1, 1,
-0.3416694, 0.05741702, -2.209091, 1, 1, 1, 1, 1,
-0.340997, 0.8690448, 0.4001687, 1, 1, 1, 1, 1,
-0.3357466, -2.77676, -3.723529, 0, 0, 1, 1, 1,
-0.3354778, -1.035334, -0.9912556, 1, 0, 0, 1, 1,
-0.3346666, 0.5307364, 1.294737, 1, 0, 0, 1, 1,
-0.3324981, -0.3824165, -4.010137, 1, 0, 0, 1, 1,
-0.3281173, -0.3122381, -3.192279, 1, 0, 0, 1, 1,
-0.3278998, 1.031303, 0.7666448, 1, 0, 0, 1, 1,
-0.3274895, -0.612945, -0.879716, 0, 0, 0, 1, 1,
-0.3263055, -0.5738115, -3.746555, 0, 0, 0, 1, 1,
-0.3258288, 1.031372, 0.3665497, 0, 0, 0, 1, 1,
-0.3240083, 0.7223282, 0.3132609, 0, 0, 0, 1, 1,
-0.3234996, -0.9616082, -3.607917, 0, 0, 0, 1, 1,
-0.3210314, -0.3778511, -3.207039, 0, 0, 0, 1, 1,
-0.3165085, -0.7661491, -3.367873, 0, 0, 0, 1, 1,
-0.3164223, 1.764699, -0.5888448, 1, 1, 1, 1, 1,
-0.3131809, -0.7769318, -2.504947, 1, 1, 1, 1, 1,
-0.3116494, -1.511975, -2.867083, 1, 1, 1, 1, 1,
-0.2943228, -0.1431834, -2.034803, 1, 1, 1, 1, 1,
-0.2939724, -0.1342936, -0.4651287, 1, 1, 1, 1, 1,
-0.2914982, -0.5392603, -3.416149, 1, 1, 1, 1, 1,
-0.2903833, 0.296289, -0.1067823, 1, 1, 1, 1, 1,
-0.2894939, 1.200114, 1.437845, 1, 1, 1, 1, 1,
-0.2874306, 1.416067, -0.4603499, 1, 1, 1, 1, 1,
-0.2867979, -0.4109636, -2.896908, 1, 1, 1, 1, 1,
-0.2856977, 0.3030089, -0.6061969, 1, 1, 1, 1, 1,
-0.2856627, -1.380456, -1.801855, 1, 1, 1, 1, 1,
-0.2645256, 1.561972, -0.6284828, 1, 1, 1, 1, 1,
-0.2525538, 0.9941359, 0.3619838, 1, 1, 1, 1, 1,
-0.2486245, 1.134049, -2.754694, 1, 1, 1, 1, 1,
-0.2484844, 0.6752532, -1.077451, 0, 0, 1, 1, 1,
-0.2476855, 1.782154, 0.404078, 1, 0, 0, 1, 1,
-0.244863, -0.8233557, -4.675164, 1, 0, 0, 1, 1,
-0.2438344, 0.1491307, -1.15938, 1, 0, 0, 1, 1,
-0.2420817, 0.8573677, -1.38612, 1, 0, 0, 1, 1,
-0.2367228, -0.2978038, -2.532441, 1, 0, 0, 1, 1,
-0.2352583, 0.04193184, -1.383373, 0, 0, 0, 1, 1,
-0.2270621, -1.311004, -1.673297, 0, 0, 0, 1, 1,
-0.2269405, -1.329376, -2.035156, 0, 0, 0, 1, 1,
-0.2249676, -0.9732288, -4.378642, 0, 0, 0, 1, 1,
-0.2209771, -1.746632, -2.585454, 0, 0, 0, 1, 1,
-0.2192381, 0.8220546, 0.3828492, 0, 0, 0, 1, 1,
-0.2142433, -1.234972, -3.25358, 0, 0, 0, 1, 1,
-0.2141919, -1.888769, -2.825722, 1, 1, 1, 1, 1,
-0.2119182, 1.071488, 0.5417012, 1, 1, 1, 1, 1,
-0.2117222, -0.3392855, -2.210664, 1, 1, 1, 1, 1,
-0.2068337, 1.116534, 0.1237378, 1, 1, 1, 1, 1,
-0.2067561, 0.2439662, 0.02075411, 1, 1, 1, 1, 1,
-0.2018547, -0.9922166, -2.364244, 1, 1, 1, 1, 1,
-0.2011475, 1.148564, -1.127212, 1, 1, 1, 1, 1,
-0.1920569, 0.7170703, -0.2617483, 1, 1, 1, 1, 1,
-0.1916433, -0.09898612, -1.779016, 1, 1, 1, 1, 1,
-0.189717, 1.104385, 1.098734, 1, 1, 1, 1, 1,
-0.18847, 1.154868, 0.2567558, 1, 1, 1, 1, 1,
-0.1859689, 1.772254, -0.08921782, 1, 1, 1, 1, 1,
-0.178531, 0.834394, 0.1294544, 1, 1, 1, 1, 1,
-0.1778331, -1.210506, -3.15367, 1, 1, 1, 1, 1,
-0.1774887, -0.1805127, -1.74815, 1, 1, 1, 1, 1,
-0.1772723, 0.3049013, 1.242336, 0, 0, 1, 1, 1,
-0.1692498, -2.305765, -2.618448, 1, 0, 0, 1, 1,
-0.1689555, -0.3283478, -1.334918, 1, 0, 0, 1, 1,
-0.1689232, 1.073966, -0.06879724, 1, 0, 0, 1, 1,
-0.1684255, 0.4560275, 0.8263152, 1, 0, 0, 1, 1,
-0.1681179, 0.6978691, -0.05845656, 1, 0, 0, 1, 1,
-0.1672571, -0.5459545, -3.528965, 0, 0, 0, 1, 1,
-0.1644559, -0.276042, -4.232359, 0, 0, 0, 1, 1,
-0.1614414, -0.2639078, -1.572839, 0, 0, 0, 1, 1,
-0.1588328, -0.9412568, -2.633954, 0, 0, 0, 1, 1,
-0.1565024, -1.802609, -2.630719, 0, 0, 0, 1, 1,
-0.155013, -2.051685, -2.476403, 0, 0, 0, 1, 1,
-0.1505138, 0.3071758, -0.3657499, 0, 0, 0, 1, 1,
-0.1497247, 0.7528821, -0.2433264, 1, 1, 1, 1, 1,
-0.1490558, 1.086612, -1.037574, 1, 1, 1, 1, 1,
-0.1457964, 1.123696, 0.08403664, 1, 1, 1, 1, 1,
-0.1427412, 0.5315942, -1.539402, 1, 1, 1, 1, 1,
-0.1414942, 2.043214, -1.731664, 1, 1, 1, 1, 1,
-0.1357647, 0.6123092, 0.8836018, 1, 1, 1, 1, 1,
-0.1340089, -1.322289, -4.712673, 1, 1, 1, 1, 1,
-0.1311381, 0.274327, -1.01882, 1, 1, 1, 1, 1,
-0.1295259, -0.09317052, -1.924224, 1, 1, 1, 1, 1,
-0.1278906, 1.771608, 0.1023804, 1, 1, 1, 1, 1,
-0.1265746, 0.0330322, -2.003853, 1, 1, 1, 1, 1,
-0.1265489, -0.05052576, -3.640218, 1, 1, 1, 1, 1,
-0.1216299, -0.2065208, -2.667021, 1, 1, 1, 1, 1,
-0.1196036, 0.169518, -1.305666, 1, 1, 1, 1, 1,
-0.1191262, 1.757848, -0.6949577, 1, 1, 1, 1, 1,
-0.1181727, -0.8714617, -2.746465, 0, 0, 1, 1, 1,
-0.116896, 0.64132, 1.250482, 1, 0, 0, 1, 1,
-0.114364, -1.065238, -4.222218, 1, 0, 0, 1, 1,
-0.112643, -1.716088, -2.861222, 1, 0, 0, 1, 1,
-0.1077821, 0.1461678, -0.3558801, 1, 0, 0, 1, 1,
-0.1074405, -1.205188, -3.914067, 1, 0, 0, 1, 1,
-0.1069456, -2.003428, -2.398807, 0, 0, 0, 1, 1,
-0.1064625, 0.9397605, -0.6473261, 0, 0, 0, 1, 1,
-0.1055607, 0.3166569, -0.3645768, 0, 0, 0, 1, 1,
-0.09944886, 0.8183605, 0.6096724, 0, 0, 0, 1, 1,
-0.09915891, 0.730742, -2.103983, 0, 0, 0, 1, 1,
-0.09710038, 1.045948, -1.508726, 0, 0, 0, 1, 1,
-0.09639893, -0.6359016, -3.298882, 0, 0, 0, 1, 1,
-0.09281042, -0.7625837, -2.694093, 1, 1, 1, 1, 1,
-0.08668675, 1.497213, -0.7529274, 1, 1, 1, 1, 1,
-0.08544941, -0.8147249, -3.138107, 1, 1, 1, 1, 1,
-0.07906318, 1.668905, -0.8246941, 1, 1, 1, 1, 1,
-0.07137607, -2.07755, -2.510689, 1, 1, 1, 1, 1,
-0.06765094, 0.5751657, -0.6385296, 1, 1, 1, 1, 1,
-0.06760975, 0.2358971, -0.176768, 1, 1, 1, 1, 1,
-0.06662033, 0.2515365, -1.418164, 1, 1, 1, 1, 1,
-0.06467749, 1.611113, 1.554206, 1, 1, 1, 1, 1,
-0.06348804, 1.128274, 1.069115, 1, 1, 1, 1, 1,
-0.05992494, -0.9944648, -4.099087, 1, 1, 1, 1, 1,
-0.05716145, -0.4567835, -3.399431, 1, 1, 1, 1, 1,
-0.04810116, -1.375978, -3.097237, 1, 1, 1, 1, 1,
-0.03611681, -1.532585, -0.5806374, 1, 1, 1, 1, 1,
-0.03599992, -0.5674853, -4.245575, 1, 1, 1, 1, 1,
-0.02556971, 1.215991, -0.05789472, 0, 0, 1, 1, 1,
-0.02142294, -0.9244878, -2.828772, 1, 0, 0, 1, 1,
-0.01953782, -2.526816, -1.035311, 1, 0, 0, 1, 1,
-0.01660116, -0.1711034, -2.152519, 1, 0, 0, 1, 1,
-0.01539345, 0.001066558, -2.730095, 1, 0, 0, 1, 1,
-0.01507238, -1.421385, -2.450883, 1, 0, 0, 1, 1,
-0.01339762, 1.816718, 0.3934553, 0, 0, 0, 1, 1,
-0.01095045, 0.7085873, -0.9015642, 0, 0, 0, 1, 1,
-0.009293904, -1.086621, -3.469899, 0, 0, 0, 1, 1,
-0.008621026, -0.9073532, -3.219717, 0, 0, 0, 1, 1,
-0.006875147, -0.2048044, -4.264836, 0, 0, 0, 1, 1,
-0.002315154, -1.458472, -1.573588, 0, 0, 0, 1, 1,
0.0009389948, 0.05122776, 1.754399, 0, 0, 0, 1, 1,
0.001399269, 0.8602508, -0.03116567, 1, 1, 1, 1, 1,
0.002886007, -0.2797183, 2.864616, 1, 1, 1, 1, 1,
0.007010883, -1.518837, 2.310878, 1, 1, 1, 1, 1,
0.007985467, 0.03885695, -0.1893033, 1, 1, 1, 1, 1,
0.008066859, 0.01164981, 1.232874, 1, 1, 1, 1, 1,
0.009158975, -1.008414, 3.004166, 1, 1, 1, 1, 1,
0.0183972, 0.4080496, -0.3707056, 1, 1, 1, 1, 1,
0.01956578, 0.1935585, 1.106741, 1, 1, 1, 1, 1,
0.02227639, -0.07197987, 2.822146, 1, 1, 1, 1, 1,
0.02383726, 0.6853021, -1.145047, 1, 1, 1, 1, 1,
0.02398855, 0.3151614, -0.2963775, 1, 1, 1, 1, 1,
0.0244258, -1.490536, 3.62105, 1, 1, 1, 1, 1,
0.02458335, 1.114778, -0.2471665, 1, 1, 1, 1, 1,
0.02492207, 0.7099367, 0.8901792, 1, 1, 1, 1, 1,
0.02640019, 0.5458453, 1.603919, 1, 1, 1, 1, 1,
0.02807801, 1.336871, 1.279883, 0, 0, 1, 1, 1,
0.02954809, -0.1782911, 1.122145, 1, 0, 0, 1, 1,
0.03077393, -0.8416039, 2.476058, 1, 0, 0, 1, 1,
0.03118412, 0.2696913, -0.1073313, 1, 0, 0, 1, 1,
0.03663756, -1.480285, 4.978041, 1, 0, 0, 1, 1,
0.03788695, -0.4551374, 3.716381, 1, 0, 0, 1, 1,
0.03875802, -0.6246693, 3.696162, 0, 0, 0, 1, 1,
0.0404888, 0.8928881, 0.853063, 0, 0, 0, 1, 1,
0.04362399, -0.5313005, 4.29183, 0, 0, 0, 1, 1,
0.04537128, 1.619083, -0.5165112, 0, 0, 0, 1, 1,
0.05493186, -0.1220976, 3.836406, 0, 0, 0, 1, 1,
0.05563381, 0.6573713, -0.7957727, 0, 0, 0, 1, 1,
0.05837104, -1.261197, 2.915566, 0, 0, 0, 1, 1,
0.05974415, -0.2249722, 1.42142, 1, 1, 1, 1, 1,
0.06137317, -0.3034167, 3.917823, 1, 1, 1, 1, 1,
0.06356195, -0.04009747, 1.774143, 1, 1, 1, 1, 1,
0.06377634, -1.646859, 2.787975, 1, 1, 1, 1, 1,
0.06778169, 0.8323126, -0.3634314, 1, 1, 1, 1, 1,
0.06787469, -0.2647096, 0.9565127, 1, 1, 1, 1, 1,
0.06970229, 1.851514, -0.3548125, 1, 1, 1, 1, 1,
0.07328521, -0.8219087, 2.700979, 1, 1, 1, 1, 1,
0.07825632, -1.169205, 3.644274, 1, 1, 1, 1, 1,
0.08148091, -0.2277158, 4.18373, 1, 1, 1, 1, 1,
0.08377098, -0.8744489, 2.399457, 1, 1, 1, 1, 1,
0.08742882, -1.498031, 3.461601, 1, 1, 1, 1, 1,
0.08892654, -0.8022087, 2.526593, 1, 1, 1, 1, 1,
0.0927209, 2.05146, -1.572766, 1, 1, 1, 1, 1,
0.09279983, -0.05710076, 3.060919, 1, 1, 1, 1, 1,
0.1038556, -0.3681909, 3.603035, 0, 0, 1, 1, 1,
0.1041015, -0.2342052, 1.440052, 1, 0, 0, 1, 1,
0.1045939, 0.7460708, -0.7118512, 1, 0, 0, 1, 1,
0.1051702, 0.5500065, -0.02610551, 1, 0, 0, 1, 1,
0.1068649, -0.4615405, 2.187066, 1, 0, 0, 1, 1,
0.1112646, 1.542432, 0.5133801, 1, 0, 0, 1, 1,
0.1120008, 0.8605698, 0.5615816, 0, 0, 0, 1, 1,
0.1142686, -0.8982051, 2.787293, 0, 0, 0, 1, 1,
0.1182642, -1.53074, 4.540425, 0, 0, 0, 1, 1,
0.1220223, -0.8197657, 2.535876, 0, 0, 0, 1, 1,
0.1286599, 0.6447206, 0.3318326, 0, 0, 0, 1, 1,
0.1334112, 0.1682126, 0.2457078, 0, 0, 0, 1, 1,
0.1340909, -0.3911175, 1.415113, 0, 0, 0, 1, 1,
0.1352912, -0.6353242, 2.679053, 1, 1, 1, 1, 1,
0.1353336, -0.06330386, 2.78291, 1, 1, 1, 1, 1,
0.1373331, -0.4211684, 3.29582, 1, 1, 1, 1, 1,
0.1483594, -0.1405911, 2.624405, 1, 1, 1, 1, 1,
0.1498435, 0.1564386, -0.5025449, 1, 1, 1, 1, 1,
0.1558283, -0.106097, 2.044759, 1, 1, 1, 1, 1,
0.1561288, -0.1020511, 1.765184, 1, 1, 1, 1, 1,
0.1571079, -0.3202955, 1.97996, 1, 1, 1, 1, 1,
0.158345, 0.1516455, 2.153946, 1, 1, 1, 1, 1,
0.161036, -0.9561695, 4.825089, 1, 1, 1, 1, 1,
0.1612526, -0.1738777, 1.974737, 1, 1, 1, 1, 1,
0.1625581, 0.06926198, 2.515836, 1, 1, 1, 1, 1,
0.1633813, 0.2721955, -0.04890934, 1, 1, 1, 1, 1,
0.1662017, 0.5026685, 2.474482, 1, 1, 1, 1, 1,
0.1710405, -0.5462845, 2.047912, 1, 1, 1, 1, 1,
0.1787301, -0.1603625, 1.665035, 0, 0, 1, 1, 1,
0.1828557, 0.9179448, -0.7833381, 1, 0, 0, 1, 1,
0.1859049, -0.755222, 3.903065, 1, 0, 0, 1, 1,
0.1963844, -0.859951, 3.640136, 1, 0, 0, 1, 1,
0.1967635, -1.514401, 1.524515, 1, 0, 0, 1, 1,
0.1969366, -0.5806772, 2.490321, 1, 0, 0, 1, 1,
0.1992537, 0.9469732, 1.059537, 0, 0, 0, 1, 1,
0.2023895, 0.9118422, 0.1989973, 0, 0, 0, 1, 1,
0.2035332, 0.2556071, -0.7485694, 0, 0, 0, 1, 1,
0.2111343, -0.5902647, 1.254781, 0, 0, 0, 1, 1,
0.2123759, 0.8182626, 0.2410894, 0, 0, 0, 1, 1,
0.2137415, 0.9804571, 1.238465, 0, 0, 0, 1, 1,
0.2146832, -0.8391535, 3.237876, 0, 0, 0, 1, 1,
0.2171161, 0.7498803, 0.8878382, 1, 1, 1, 1, 1,
0.2195257, -1.000457, 3.25289, 1, 1, 1, 1, 1,
0.2257303, 1.162096, 0.967806, 1, 1, 1, 1, 1,
0.2259457, 0.6967464, 0.8620859, 1, 1, 1, 1, 1,
0.2260902, -0.1642726, 1.354718, 1, 1, 1, 1, 1,
0.2268786, -1.05199, 3.086668, 1, 1, 1, 1, 1,
0.228444, -0.2030319, 1.85193, 1, 1, 1, 1, 1,
0.2315736, 0.5715607, 0.4272949, 1, 1, 1, 1, 1,
0.2336454, 1.651738, -0.6107631, 1, 1, 1, 1, 1,
0.2385416, -1.67156, 3.538925, 1, 1, 1, 1, 1,
0.2389395, -0.1393396, 3.487935, 1, 1, 1, 1, 1,
0.2405988, -0.9848288, 2.1424, 1, 1, 1, 1, 1,
0.2409658, -0.4358746, 3.667771, 1, 1, 1, 1, 1,
0.2416628, 0.353989, 2.255863, 1, 1, 1, 1, 1,
0.2420442, -1.38881, 2.377455, 1, 1, 1, 1, 1,
0.2441897, -1.455211, 5.032688, 0, 0, 1, 1, 1,
0.2493267, -0.8219616, 2.954281, 1, 0, 0, 1, 1,
0.2518699, 0.3573973, 1.34787, 1, 0, 0, 1, 1,
0.2532322, -0.4848348, 1.84411, 1, 0, 0, 1, 1,
0.2575821, 0.5889138, 1.493247, 1, 0, 0, 1, 1,
0.2612461, 0.4172049, -1.847549, 1, 0, 0, 1, 1,
0.2615679, -0.9932622, 1.836284, 0, 0, 0, 1, 1,
0.2657681, -1.975057, 1.312227, 0, 0, 0, 1, 1,
0.2677203, -0.1629586, 2.265625, 0, 0, 0, 1, 1,
0.2688132, 0.7834519, -0.2839795, 0, 0, 0, 1, 1,
0.2760561, -0.006538399, 2.273247, 0, 0, 0, 1, 1,
0.2777011, 0.2164734, 1.571428, 0, 0, 0, 1, 1,
0.2782831, -0.6119152, 3.423937, 0, 0, 0, 1, 1,
0.2783856, -0.228585, 1.780303, 1, 1, 1, 1, 1,
0.2786462, -0.1603381, 2.281017, 1, 1, 1, 1, 1,
0.2788725, -1.65036, 3.464228, 1, 1, 1, 1, 1,
0.2832573, -0.2799356, -0.713449, 1, 1, 1, 1, 1,
0.2839661, -0.4312131, 3.357802, 1, 1, 1, 1, 1,
0.2873449, -0.7354059, 2.612914, 1, 1, 1, 1, 1,
0.2878559, 0.3813239, -0.002573774, 1, 1, 1, 1, 1,
0.2880412, 0.6010666, -0.844574, 1, 1, 1, 1, 1,
0.2894312, -1.21748, 4.10866, 1, 1, 1, 1, 1,
0.2913218, -0.7772067, 1.791671, 1, 1, 1, 1, 1,
0.2938735, -0.09625959, 2.575639, 1, 1, 1, 1, 1,
0.2963443, -0.7225981, 4.390532, 1, 1, 1, 1, 1,
0.2973086, -0.4813224, 2.028608, 1, 1, 1, 1, 1,
0.2983142, -0.1075921, 1.812569, 1, 1, 1, 1, 1,
0.2984591, 0.6430458, 0.0208543, 1, 1, 1, 1, 1,
0.2993606, 0.8158122, 0.6971922, 0, 0, 1, 1, 1,
0.2999921, 2.065057, -0.3896547, 1, 0, 0, 1, 1,
0.3075248, 0.9296688, 1.268255, 1, 0, 0, 1, 1,
0.3075911, 1.303284, 0.2686005, 1, 0, 0, 1, 1,
0.3104973, -0.4972398, 3.598845, 1, 0, 0, 1, 1,
0.3139403, -0.33961, 3.521575, 1, 0, 0, 1, 1,
0.3152349, -0.1099065, 0.0659361, 0, 0, 0, 1, 1,
0.3188099, 0.9988608, 1.141018, 0, 0, 0, 1, 1,
0.3196493, -0.08944122, 1.571205, 0, 0, 0, 1, 1,
0.3199939, -0.08889414, 1.20277, 0, 0, 0, 1, 1,
0.3210798, 1.266824, -0.1568727, 0, 0, 0, 1, 1,
0.3234191, -0.04483466, 2.082207, 0, 0, 0, 1, 1,
0.3255673, -0.7288395, 1.464023, 0, 0, 0, 1, 1,
0.3291484, 0.5167457, 0.1730612, 1, 1, 1, 1, 1,
0.3291908, 0.4036218, 2.308761, 1, 1, 1, 1, 1,
0.330002, 0.3040407, 0.352877, 1, 1, 1, 1, 1,
0.3381405, -0.05323765, -0.338767, 1, 1, 1, 1, 1,
0.34045, 2.560811, -0.4566235, 1, 1, 1, 1, 1,
0.3410624, 1.156797, 0.1750226, 1, 1, 1, 1, 1,
0.3538255, 1.444593, -0.3468727, 1, 1, 1, 1, 1,
0.3552809, -1.061058, 3.732821, 1, 1, 1, 1, 1,
0.3565447, 3.098154, 0.4316036, 1, 1, 1, 1, 1,
0.3575698, 0.4002746, 0.03270832, 1, 1, 1, 1, 1,
0.3592827, -0.1932499, 1.974478, 1, 1, 1, 1, 1,
0.3646059, 1.5985, 0.5713243, 1, 1, 1, 1, 1,
0.3650212, -0.5471891, 1.941701, 1, 1, 1, 1, 1,
0.3653602, 0.0410222, 1.07059, 1, 1, 1, 1, 1,
0.3655733, 0.6929883, 1.534047, 1, 1, 1, 1, 1,
0.3665159, 0.1130735, 1.448756, 0, 0, 1, 1, 1,
0.3695749, -0.484945, 4.910108, 1, 0, 0, 1, 1,
0.3711175, -0.5117545, 3.177311, 1, 0, 0, 1, 1,
0.3728986, 1.499249, -2.35064, 1, 0, 0, 1, 1,
0.3819242, 1.159866, -0.825904, 1, 0, 0, 1, 1,
0.3827297, -0.160592, 2.087634, 1, 0, 0, 1, 1,
0.3873184, 0.5560889, -1.123183, 0, 0, 0, 1, 1,
0.3918178, -0.4013432, 2.645351, 0, 0, 0, 1, 1,
0.3940601, 0.5264621, 0.3058413, 0, 0, 0, 1, 1,
0.3956352, 1.385836, -0.722776, 0, 0, 0, 1, 1,
0.3989593, -1.77468, 4.486297, 0, 0, 0, 1, 1,
0.3990024, -0.531028, 2.748467, 0, 0, 0, 1, 1,
0.404969, -1.314556, 1.536597, 0, 0, 0, 1, 1,
0.4119119, -0.04867025, 2.775437, 1, 1, 1, 1, 1,
0.4165787, -0.8226116, 1.954995, 1, 1, 1, 1, 1,
0.4292222, -0.9818535, 1.530908, 1, 1, 1, 1, 1,
0.4317404, 0.9709765, 0.5618723, 1, 1, 1, 1, 1,
0.4334475, 1.133837, -1.107258, 1, 1, 1, 1, 1,
0.4347152, -1.11238, 2.637142, 1, 1, 1, 1, 1,
0.4365532, 0.9255964, 0.5684332, 1, 1, 1, 1, 1,
0.4404533, 0.1317218, 1.746519, 1, 1, 1, 1, 1,
0.4445985, 1.826247, -0.4798856, 1, 1, 1, 1, 1,
0.4449431, -1.236465, 2.203163, 1, 1, 1, 1, 1,
0.4487095, -1.767004, 1.514949, 1, 1, 1, 1, 1,
0.452045, 0.4726741, -0.3454159, 1, 1, 1, 1, 1,
0.4534162, -0.3104309, 0.8354571, 1, 1, 1, 1, 1,
0.4557435, -0.4756778, 1.228059, 1, 1, 1, 1, 1,
0.4568213, 0.370223, 1.371126, 1, 1, 1, 1, 1,
0.4732436, -1.808827, 4.640697, 0, 0, 1, 1, 1,
0.4798955, -1.226858, 1.312516, 1, 0, 0, 1, 1,
0.4868118, -0.3885618, 2.405707, 1, 0, 0, 1, 1,
0.4871646, 1.532665, 0.2675878, 1, 0, 0, 1, 1,
0.4880812, 0.2728049, 1.703527, 1, 0, 0, 1, 1,
0.4883172, -1.147514, 1.549801, 1, 0, 0, 1, 1,
0.4896975, 0.2653847, 1.73184, 0, 0, 0, 1, 1,
0.4938782, 0.2596155, 0.9376889, 0, 0, 0, 1, 1,
0.4974973, 2.051792, 1.044898, 0, 0, 0, 1, 1,
0.4987943, -0.6224242, 2.58045, 0, 0, 0, 1, 1,
0.5015126, 0.4119847, 0.9859031, 0, 0, 0, 1, 1,
0.5017622, 0.440137, 1.052492, 0, 0, 0, 1, 1,
0.5028226, -1.018731, 3.040106, 0, 0, 0, 1, 1,
0.5046212, 1.10564, -0.0547077, 1, 1, 1, 1, 1,
0.5064099, -0.3299631, 1.436246, 1, 1, 1, 1, 1,
0.5084041, 0.6039297, 1.822948, 1, 1, 1, 1, 1,
0.5091845, 0.7271479, 3.045691, 1, 1, 1, 1, 1,
0.5113304, 0.3642556, -1.380839, 1, 1, 1, 1, 1,
0.5119458, -1.564016, 0.7151268, 1, 1, 1, 1, 1,
0.5146196, -0.4813257, 2.617161, 1, 1, 1, 1, 1,
0.516452, -0.8982509, 2.115038, 1, 1, 1, 1, 1,
0.5191109, 1.074479, -0.269086, 1, 1, 1, 1, 1,
0.5196457, -0.4539301, 2.827266, 1, 1, 1, 1, 1,
0.5199295, -0.4053772, 2.073772, 1, 1, 1, 1, 1,
0.5237995, -1.06648, 2.489327, 1, 1, 1, 1, 1,
0.5257224, 0.631187, -0.1979216, 1, 1, 1, 1, 1,
0.5260295, -1.236471, 4.934762, 1, 1, 1, 1, 1,
0.5268139, 0.298113, 2.574138, 1, 1, 1, 1, 1,
0.5272152, -0.9364113, 3.782393, 0, 0, 1, 1, 1,
0.5346622, -1.514461, 2.89348, 1, 0, 0, 1, 1,
0.5384998, -0.2665695, 1.761686, 1, 0, 0, 1, 1,
0.5389816, -0.4687334, 0.5423015, 1, 0, 0, 1, 1,
0.5408386, 2.122287, 0.08741327, 1, 0, 0, 1, 1,
0.5439247, -1.5753, 2.754949, 1, 0, 0, 1, 1,
0.549845, 3.081531, 1.696164, 0, 0, 0, 1, 1,
0.5516383, -0.2537046, 1.697142, 0, 0, 0, 1, 1,
0.5520354, 0.8288116, -0.5895917, 0, 0, 0, 1, 1,
0.5570798, -0.408488, 1.662954, 0, 0, 0, 1, 1,
0.5576742, -1.50973, 1.547255, 0, 0, 0, 1, 1,
0.5578017, 0.3661875, 0.001665903, 0, 0, 0, 1, 1,
0.5585657, 2.085078, -0.1085686, 0, 0, 0, 1, 1,
0.5593854, -0.1020977, 1.129903, 1, 1, 1, 1, 1,
0.5604131, -0.6424237, 3.280574, 1, 1, 1, 1, 1,
0.5699679, -0.6273672, 3.091696, 1, 1, 1, 1, 1,
0.5706674, 1.808112, 0.8433789, 1, 1, 1, 1, 1,
0.5734916, 1.64858, 0.9132833, 1, 1, 1, 1, 1,
0.5768339, -0.2146392, 1.686978, 1, 1, 1, 1, 1,
0.5781459, 0.4128142, -0.3789763, 1, 1, 1, 1, 1,
0.5812747, 0.8677716, -1.109577, 1, 1, 1, 1, 1,
0.5839313, -0.02880076, 2.061445, 1, 1, 1, 1, 1,
0.5929506, 1.152139, 1.795374, 1, 1, 1, 1, 1,
0.6030787, 0.5039613, 2.669873, 1, 1, 1, 1, 1,
0.6050919, 0.8081745, -0.3535612, 1, 1, 1, 1, 1,
0.605503, 0.1864192, 1.328701, 1, 1, 1, 1, 1,
0.6075673, 0.740208, -0.4284679, 1, 1, 1, 1, 1,
0.6093788, 0.2564068, -2.058092, 1, 1, 1, 1, 1,
0.6110608, 0.6880631, 1.590346, 0, 0, 1, 1, 1,
0.6142435, 0.7063884, 0.9276671, 1, 0, 0, 1, 1,
0.6185315, -1.023472, 3.721661, 1, 0, 0, 1, 1,
0.6186358, -0.4431916, 3.899531, 1, 0, 0, 1, 1,
0.6198912, 1.235566, 0.9682316, 1, 0, 0, 1, 1,
0.6213803, 1.43433, 1.347798, 1, 0, 0, 1, 1,
0.6249874, 0.7668213, 1.266733, 0, 0, 0, 1, 1,
0.6251416, 0.8223467, -0.4666368, 0, 0, 0, 1, 1,
0.6293465, 0.04822503, 3.174161, 0, 0, 0, 1, 1,
0.636284, -0.923874, 1.045217, 0, 0, 0, 1, 1,
0.637474, -0.01649011, 2.27108, 0, 0, 0, 1, 1,
0.639606, 0.08650041, 0.7329088, 0, 0, 0, 1, 1,
0.639649, 0.4137509, 1.261508, 0, 0, 0, 1, 1,
0.6525658, 0.4155596, -0.879327, 1, 1, 1, 1, 1,
0.6574183, 0.2302592, 1.008747, 1, 1, 1, 1, 1,
0.6581057, 0.1610343, -0.2474606, 1, 1, 1, 1, 1,
0.6619917, -0.05621414, 2.016868, 1, 1, 1, 1, 1,
0.6651012, 1.129217, 1.806276, 1, 1, 1, 1, 1,
0.6770231, -0.1664454, 0.8790634, 1, 1, 1, 1, 1,
0.6796174, -0.9457715, 2.626606, 1, 1, 1, 1, 1,
0.680883, 0.03721701, -0.08725806, 1, 1, 1, 1, 1,
0.6841965, 1.699064, 0.4837994, 1, 1, 1, 1, 1,
0.6843815, -0.883539, 3.715116, 1, 1, 1, 1, 1,
0.6908961, 0.5074678, 2.302393, 1, 1, 1, 1, 1,
0.6923679, 0.757213, 1.974831, 1, 1, 1, 1, 1,
0.699348, -1.729523, 3.972808, 1, 1, 1, 1, 1,
0.7073418, -0.2835164, 3.137516, 1, 1, 1, 1, 1,
0.7150589, -0.8993378, 1.712636, 1, 1, 1, 1, 1,
0.717791, 0.0001649648, 2.224842, 0, 0, 1, 1, 1,
0.7237061, -0.1467621, 0.803511, 1, 0, 0, 1, 1,
0.7359642, -0.05643395, 1.524075, 1, 0, 0, 1, 1,
0.7492093, -0.6827392, 2.336281, 1, 0, 0, 1, 1,
0.753941, -0.07779202, 1.145494, 1, 0, 0, 1, 1,
0.7545677, 2.337701, 2.394768, 1, 0, 0, 1, 1,
0.7567487, -0.3053554, 3.332938, 0, 0, 0, 1, 1,
0.762021, 0.03091649, 2.619481, 0, 0, 0, 1, 1,
0.7634173, -0.1871484, 2.423403, 0, 0, 0, 1, 1,
0.7665017, 0.4559751, 3.12221, 0, 0, 0, 1, 1,
0.7669994, -1.335497, 0.9863819, 0, 0, 0, 1, 1,
0.7693121, -1.450414, 1.705735, 0, 0, 0, 1, 1,
0.7708455, 0.1002606, 0.9059703, 0, 0, 0, 1, 1,
0.7873639, 0.4775356, -1.425671, 1, 1, 1, 1, 1,
0.8038532, 0.707093, 0.7464696, 1, 1, 1, 1, 1,
0.8059319, -0.8589511, 3.419056, 1, 1, 1, 1, 1,
0.8076245, -0.04245355, 1.916785, 1, 1, 1, 1, 1,
0.8077034, 0.7742749, 1.104799, 1, 1, 1, 1, 1,
0.8081175, 0.1131212, 1.680079, 1, 1, 1, 1, 1,
0.8086578, -0.931491, 2.337188, 1, 1, 1, 1, 1,
0.814281, 1.85816, -1.255238, 1, 1, 1, 1, 1,
0.8144982, 0.2867515, 0.9906874, 1, 1, 1, 1, 1,
0.8167545, -2.926876, 1.494707, 1, 1, 1, 1, 1,
0.8198735, 0.126391, 1.121771, 1, 1, 1, 1, 1,
0.8212996, 0.5227917, 0.3527884, 1, 1, 1, 1, 1,
0.8242913, 0.1409472, 0.00762323, 1, 1, 1, 1, 1,
0.8296954, -0.2134083, 1.219303, 1, 1, 1, 1, 1,
0.8479194, -0.06613903, 3.142056, 1, 1, 1, 1, 1,
0.8535019, 1.204872, 0.7006797, 0, 0, 1, 1, 1,
0.8662357, -0.530802, 1.059626, 1, 0, 0, 1, 1,
0.8663393, -2.557034, 2.691954, 1, 0, 0, 1, 1,
0.8693573, 1.969236, 2.289964, 1, 0, 0, 1, 1,
0.8749232, -1.623877, 1.41193, 1, 0, 0, 1, 1,
0.8753733, 1.803921, 0.9357664, 1, 0, 0, 1, 1,
0.892352, -1.442516, 1.966443, 0, 0, 0, 1, 1,
0.892927, -0.2092041, -0.728034, 0, 0, 0, 1, 1,
0.8944982, 0.2745352, 1.306708, 0, 0, 0, 1, 1,
0.9039066, 0.7247168, 0.02788872, 0, 0, 0, 1, 1,
0.9083065, 0.8332068, 2.001772, 0, 0, 0, 1, 1,
0.9157723, -0.997984, 0.7332497, 0, 0, 0, 1, 1,
0.9197304, -2.248603, 1.046277, 0, 0, 0, 1, 1,
0.9214906, -0.6866034, 3.396159, 1, 1, 1, 1, 1,
0.927302, 1.176295, 1.73786, 1, 1, 1, 1, 1,
0.9293379, -0.1444022, 0.1045221, 1, 1, 1, 1, 1,
0.9303269, -1.301255, 3.945771, 1, 1, 1, 1, 1,
0.9316118, -0.9681443, 2.21059, 1, 1, 1, 1, 1,
0.9320554, 0.9132839, 1.831051, 1, 1, 1, 1, 1,
0.937691, -2.788975, 4.008762, 1, 1, 1, 1, 1,
0.941623, 0.6859303, 1.659248, 1, 1, 1, 1, 1,
0.9422083, -0.7820137, 1.649817, 1, 1, 1, 1, 1,
0.9449547, -2.471928, 0.9263742, 1, 1, 1, 1, 1,
0.9473927, 0.357707, 0.8839, 1, 1, 1, 1, 1,
0.9564104, 0.1820843, 0.1022114, 1, 1, 1, 1, 1,
0.9582627, 1.887444, 1.181619, 1, 1, 1, 1, 1,
0.964825, 0.4405786, 1.804667, 1, 1, 1, 1, 1,
0.9673893, 0.6100224, -0.2531697, 1, 1, 1, 1, 1,
0.9799737, 0.1606569, 1.852217, 0, 0, 1, 1, 1,
0.9802858, -0.9549631, 2.911824, 1, 0, 0, 1, 1,
0.9844301, 1.052605, 0.6810584, 1, 0, 0, 1, 1,
0.9872219, -2.330293, 2.076512, 1, 0, 0, 1, 1,
0.9912406, 1.942781, 1.377608, 1, 0, 0, 1, 1,
0.9935119, -1.155652, 2.234993, 1, 0, 0, 1, 1,
1.00183, 0.5832546, 0.4572408, 0, 0, 0, 1, 1,
1.008866, -0.5446366, 2.480346, 0, 0, 0, 1, 1,
1.013709, 0.4927423, 1.540876, 0, 0, 0, 1, 1,
1.017412, -1.352247, 2.473813, 0, 0, 0, 1, 1,
1.022985, -0.2312342, 2.385262, 0, 0, 0, 1, 1,
1.023015, 1.628748, -1.184173, 0, 0, 0, 1, 1,
1.023669, 0.8476745, 1.666119, 0, 0, 0, 1, 1,
1.02723, 0.8242919, 0.3055704, 1, 1, 1, 1, 1,
1.030749, -1.43822, 3.04565, 1, 1, 1, 1, 1,
1.033702, -2.139633, 2.64751, 1, 1, 1, 1, 1,
1.0371, 0.4465501, -0.301307, 1, 1, 1, 1, 1,
1.040678, -1.113299, 3.785378, 1, 1, 1, 1, 1,
1.045187, 1.012165, 0.5822123, 1, 1, 1, 1, 1,
1.049584, -0.4094019, 2.512771, 1, 1, 1, 1, 1,
1.053941, 2.630008, 0.3922047, 1, 1, 1, 1, 1,
1.056356, 1.266107, 1.099978, 1, 1, 1, 1, 1,
1.05749, -0.8371426, 3.272075, 1, 1, 1, 1, 1,
1.06944, -0.05429776, 2.317564, 1, 1, 1, 1, 1,
1.075389, 0.3857554, -0.3369026, 1, 1, 1, 1, 1,
1.081663, -0.1236103, 1.131135, 1, 1, 1, 1, 1,
1.087308, -1.308926, 1.293582, 1, 1, 1, 1, 1,
1.099024, -0.5653704, 1.492063, 1, 1, 1, 1, 1,
1.101942, 0.4253804, 1.179932, 0, 0, 1, 1, 1,
1.110572, -1.664299, 3.409122, 1, 0, 0, 1, 1,
1.115494, -0.7893512, 1.246205, 1, 0, 0, 1, 1,
1.119668, -0.9850411, 2.787021, 1, 0, 0, 1, 1,
1.139289, -0.06164759, 2.051209, 1, 0, 0, 1, 1,
1.14638, -0.0662732, 0.2260638, 1, 0, 0, 1, 1,
1.147991, -0.2778185, 2.029659, 0, 0, 0, 1, 1,
1.157458, 1.07027, 1.167633, 0, 0, 0, 1, 1,
1.161458, 0.07038122, 2.383516, 0, 0, 0, 1, 1,
1.165584, 1.384414, 0.05688074, 0, 0, 0, 1, 1,
1.166778, 0.495589, 1.711892, 0, 0, 0, 1, 1,
1.166983, -1.499238, 2.527455, 0, 0, 0, 1, 1,
1.168178, 1.466812, 0.6248402, 0, 0, 0, 1, 1,
1.16877, -0.2378075, 0.6263593, 1, 1, 1, 1, 1,
1.173277, -1.187886, 3.265983, 1, 1, 1, 1, 1,
1.189816, -0.5633528, 1.456579, 1, 1, 1, 1, 1,
1.190863, 2.670933, -0.09565558, 1, 1, 1, 1, 1,
1.202346, -0.6810818, 1.219185, 1, 1, 1, 1, 1,
1.210721, 0.6666932, 1.588485, 1, 1, 1, 1, 1,
1.219251, 0.790319, -0.001159142, 1, 1, 1, 1, 1,
1.221185, 0.2936388, -0.7331272, 1, 1, 1, 1, 1,
1.230498, -0.2615387, 2.843108, 1, 1, 1, 1, 1,
1.24778, -0.7100662, 1.992553, 1, 1, 1, 1, 1,
1.253067, 0.4823706, 1.877073, 1, 1, 1, 1, 1,
1.259106, 1.082991, 1.574392, 1, 1, 1, 1, 1,
1.275798, 1.250695, -0.3643275, 1, 1, 1, 1, 1,
1.281688, -0.2026394, 2.177395, 1, 1, 1, 1, 1,
1.285591, 0.8981574, -0.06238967, 1, 1, 1, 1, 1,
1.289575, 0.5120081, 1.937802, 0, 0, 1, 1, 1,
1.291462, -0.4354948, 0.7691174, 1, 0, 0, 1, 1,
1.291923, -0.32478, 0.4391993, 1, 0, 0, 1, 1,
1.298943, -0.6529664, 2.429021, 1, 0, 0, 1, 1,
1.306679, 0.1576535, 2.04239, 1, 0, 0, 1, 1,
1.307164, 1.574048, 1.767112, 1, 0, 0, 1, 1,
1.307578, 1.035318, 1.826185, 0, 0, 0, 1, 1,
1.317265, 2.022686, 1.138855, 0, 0, 0, 1, 1,
1.328528, -1.030729, 3.376293, 0, 0, 0, 1, 1,
1.358247, 0.1199751, 1.035097, 0, 0, 0, 1, 1,
1.361093, -0.03261304, 1.776317, 0, 0, 0, 1, 1,
1.38092, -0.317933, 0.324656, 0, 0, 0, 1, 1,
1.3815, -0.7418126, 0.9657531, 0, 0, 0, 1, 1,
1.383812, -1.45431, 3.176391, 1, 1, 1, 1, 1,
1.385881, 1.148149, 0.6061031, 1, 1, 1, 1, 1,
1.395646, 0.7924808, 1.9514, 1, 1, 1, 1, 1,
1.403669, 1.123217, 0.3263336, 1, 1, 1, 1, 1,
1.405953, -1.218418, 0.4315293, 1, 1, 1, 1, 1,
1.411634, -0.7034804, 1.112416, 1, 1, 1, 1, 1,
1.418852, -0.8434133, 1.570963, 1, 1, 1, 1, 1,
1.422854, 1.338508, 0.9899748, 1, 1, 1, 1, 1,
1.4265, -0.7828109, 0.8827657, 1, 1, 1, 1, 1,
1.427572, 0.5855905, 2.414344, 1, 1, 1, 1, 1,
1.427971, -0.4061601, 2.611073, 1, 1, 1, 1, 1,
1.430174, 0.3366669, 1.543368, 1, 1, 1, 1, 1,
1.432073, 0.2466009, 1.202872, 1, 1, 1, 1, 1,
1.440362, 0.7998088, 0.817184, 1, 1, 1, 1, 1,
1.443721, 0.5553988, 1.162747, 1, 1, 1, 1, 1,
1.451399, -1.035137, 1.360538, 0, 0, 1, 1, 1,
1.456684, -0.1402739, 2.17071, 1, 0, 0, 1, 1,
1.456875, 0.3677499, 3.108078, 1, 0, 0, 1, 1,
1.465294, 0.1331944, -0.3026634, 1, 0, 0, 1, 1,
1.486865, 1.430026, -0.2889069, 1, 0, 0, 1, 1,
1.502897, -0.7446007, 2.013814, 1, 0, 0, 1, 1,
1.51178, -1.158255, 4.487008, 0, 0, 0, 1, 1,
1.515859, 1.006227, -0.1655233, 0, 0, 0, 1, 1,
1.524299, -0.1073342, 3.262582, 0, 0, 0, 1, 1,
1.557016, -0.8322777, 3.356347, 0, 0, 0, 1, 1,
1.559419, 0.08062207, -0.2054831, 0, 0, 0, 1, 1,
1.574399, 0.7730868, 1.961966, 0, 0, 0, 1, 1,
1.575241, 0.8160241, 1.68307, 0, 0, 0, 1, 1,
1.584255, -0.1669284, 2.263635, 1, 1, 1, 1, 1,
1.594937, -0.8207135, 0.3578242, 1, 1, 1, 1, 1,
1.594997, 1.025239, 0.05415738, 1, 1, 1, 1, 1,
1.599259, 1.14919, 2.705006, 1, 1, 1, 1, 1,
1.605448, 1.417305, 1.451407, 1, 1, 1, 1, 1,
1.608346, 0.5298359, 1.00975, 1, 1, 1, 1, 1,
1.612612, -0.3581712, 0.1333955, 1, 1, 1, 1, 1,
1.617825, -1.506733, 4.166521, 1, 1, 1, 1, 1,
1.61791, -1.977123, 3.107268, 1, 1, 1, 1, 1,
1.622764, 1.114889, 0.7902501, 1, 1, 1, 1, 1,
1.650223, 0.1765926, 2.126563, 1, 1, 1, 1, 1,
1.656912, -1.340461, 2.867884, 1, 1, 1, 1, 1,
1.673682, -1.839126, 2.786141, 1, 1, 1, 1, 1,
1.676694, 0.7162178, 2.213302, 1, 1, 1, 1, 1,
1.685642, -0.5780771, 2.153167, 1, 1, 1, 1, 1,
1.703166, -0.2628987, 2.591828, 0, 0, 1, 1, 1,
1.703527, -1.093681, 1.287925, 1, 0, 0, 1, 1,
1.709214, -0.4514317, 2.593274, 1, 0, 0, 1, 1,
1.71595, 1.22562, 1.149443, 1, 0, 0, 1, 1,
1.736953, 0.1733939, 0.1521279, 1, 0, 0, 1, 1,
1.756528, 0.3470503, 1.946717, 1, 0, 0, 1, 1,
1.764397, 0.5548012, 1.367544, 0, 0, 0, 1, 1,
1.764514, -0.7385458, 4.103076, 0, 0, 0, 1, 1,
1.781249, 1.535475, 1.952029, 0, 0, 0, 1, 1,
1.794469, 0.3191586, 1.986427, 0, 0, 0, 1, 1,
1.797893, 1.53629, -0.1477631, 0, 0, 0, 1, 1,
1.817011, 0.5560976, 1.510112, 0, 0, 0, 1, 1,
1.818384, 0.4011139, 1.875033, 0, 0, 0, 1, 1,
1.844442, -1.699017, 3.064498, 1, 1, 1, 1, 1,
1.848553, -0.1898113, 0.355493, 1, 1, 1, 1, 1,
1.859305, 1.028185, -0.9992734, 1, 1, 1, 1, 1,
1.871224, 1.937447, 1.48369, 1, 1, 1, 1, 1,
1.874008, 0.9617184, 1.457829, 1, 1, 1, 1, 1,
1.904724, 0.3707642, 0.3446695, 1, 1, 1, 1, 1,
1.931574, 0.4599204, -1.008227, 1, 1, 1, 1, 1,
1.944756, 0.9358109, 1.371076, 1, 1, 1, 1, 1,
1.959358, -0.417648, 1.362797, 1, 1, 1, 1, 1,
1.965338, -0.7822118, 0.7553513, 1, 1, 1, 1, 1,
1.999428, 1.927375, 3.061435, 1, 1, 1, 1, 1,
2.010504, 0.5851628, 1.560684, 1, 1, 1, 1, 1,
2.02879, 0.6026781, 2.267561, 1, 1, 1, 1, 1,
2.088622, 1.389452, 1.13621, 1, 1, 1, 1, 1,
2.096385, 0.4537421, 0.48424, 1, 1, 1, 1, 1,
2.11014, 0.7105464, 2.40598, 0, 0, 1, 1, 1,
2.11104, -0.8772789, 0.6995766, 1, 0, 0, 1, 1,
2.131726, -1.699436, 2.918759, 1, 0, 0, 1, 1,
2.137338, -0.00938643, -0.2858461, 1, 0, 0, 1, 1,
2.144023, 0.0977123, 3.308816, 1, 0, 0, 1, 1,
2.181768, -0.9968931, 2.143275, 1, 0, 0, 1, 1,
2.226353, -0.4882437, 0.9084616, 0, 0, 0, 1, 1,
2.235105, -0.2437074, 3.822723, 0, 0, 0, 1, 1,
2.239338, -0.2584364, 1.363367, 0, 0, 0, 1, 1,
2.245408, -0.1166596, 1.966774, 0, 0, 0, 1, 1,
2.246519, -0.9916255, 1.76237, 0, 0, 0, 1, 1,
2.264068, 0.3743883, 2.644198, 0, 0, 0, 1, 1,
2.290148, 1.457776, 1.331375, 0, 0, 0, 1, 1,
2.349293, -0.875698, 3.73506, 1, 1, 1, 1, 1,
2.373483, 1.389563, 1.230129, 1, 1, 1, 1, 1,
2.398127, -1.206629, 2.431453, 1, 1, 1, 1, 1,
2.628842, 1.375039, 1.99696, 1, 1, 1, 1, 1,
2.630128, 0.2768829, 3.17985, 1, 1, 1, 1, 1,
2.762851, -0.332066, -0.07273294, 1, 1, 1, 1, 1,
2.832194, 0.4419616, 0.494725, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.994769;
var distance = 31.59375;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.1382328, -0.1488689, -0.1600077 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.59375);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
