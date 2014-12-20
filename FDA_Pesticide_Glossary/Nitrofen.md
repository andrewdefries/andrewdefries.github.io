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
-3.542111, 0.2520453, -2.280039, 1, 0, 0, 1,
-2.801342, 0.5587488, -1.807938, 1, 0.007843138, 0, 1,
-2.753646, 0.7638416, -1.818189, 1, 0.01176471, 0, 1,
-2.587784, -0.624923, -2.516686, 1, 0.01960784, 0, 1,
-2.561034, 1.26095, -0.8980541, 1, 0.02352941, 0, 1,
-2.431786, -0.9334857, -3.089843, 1, 0.03137255, 0, 1,
-2.408544, -0.1270495, -1.263672, 1, 0.03529412, 0, 1,
-2.397623, -0.5092322, -1.897799, 1, 0.04313726, 0, 1,
-2.369264, -0.8933036, -1.375944, 1, 0.04705882, 0, 1,
-2.3307, 0.6776888, -0.06184563, 1, 0.05490196, 0, 1,
-2.309836, 1.774357, -1.119215, 1, 0.05882353, 0, 1,
-2.302573, -1.06126, 0.2869229, 1, 0.06666667, 0, 1,
-2.235648, -0.1915019, -2.364485, 1, 0.07058824, 0, 1,
-2.223763, -1.011142, -1.087729, 1, 0.07843138, 0, 1,
-2.219723, -1.200988, -2.259504, 1, 0.08235294, 0, 1,
-2.140805, -0.6265526, -1.330965, 1, 0.09019608, 0, 1,
-2.130505, -0.07050391, -1.498405, 1, 0.09411765, 0, 1,
-2.129352, 1.057187, -1.260865, 1, 0.1019608, 0, 1,
-2.126921, -2.575356, -1.435114, 1, 0.1098039, 0, 1,
-2.052099, 1.327937, -1.312533, 1, 0.1137255, 0, 1,
-2.041775, -0.2917375, -1.563667, 1, 0.1215686, 0, 1,
-2.030547, 0.6643363, -1.328523, 1, 0.1254902, 0, 1,
-2.02208, 1.660852, -1.716776, 1, 0.1333333, 0, 1,
-1.966746, 2.155516, -1.415434, 1, 0.1372549, 0, 1,
-1.944657, -0.9428059, -2.326629, 1, 0.145098, 0, 1,
-1.937886, -0.05565464, -1.437875, 1, 0.1490196, 0, 1,
-1.936042, -1.633756, -2.365915, 1, 0.1568628, 0, 1,
-1.922188, 0.2650387, -0.6136226, 1, 0.1607843, 0, 1,
-1.881499, -0.8515287, -2.14759, 1, 0.1686275, 0, 1,
-1.871628, 1.350349, -1.426111, 1, 0.172549, 0, 1,
-1.870892, 1.33693, -0.1850837, 1, 0.1803922, 0, 1,
-1.87006, -0.7485967, -1.927922, 1, 0.1843137, 0, 1,
-1.851503, 0.1700909, -1.688167, 1, 0.1921569, 0, 1,
-1.836515, -1.106741, -0.5701174, 1, 0.1960784, 0, 1,
-1.790168, -0.4854604, -1.261865, 1, 0.2039216, 0, 1,
-1.780791, -0.4666578, -1.721766, 1, 0.2117647, 0, 1,
-1.768593, 0.7412773, -0.5819647, 1, 0.2156863, 0, 1,
-1.753248, 0.7621047, -0.07095003, 1, 0.2235294, 0, 1,
-1.751008, 0.195544, -1.547727, 1, 0.227451, 0, 1,
-1.73156, -0.3968917, -0.5785247, 1, 0.2352941, 0, 1,
-1.723296, 1.690999, -0.03899937, 1, 0.2392157, 0, 1,
-1.718086, 1.039212, -1.03985, 1, 0.2470588, 0, 1,
-1.710166, 0.9182168, 0.2063518, 1, 0.2509804, 0, 1,
-1.702925, 0.8831378, -0.6245803, 1, 0.2588235, 0, 1,
-1.69953, 0.7052156, 0.09244472, 1, 0.2627451, 0, 1,
-1.693407, 0.6566842, -0.9384624, 1, 0.2705882, 0, 1,
-1.685401, 1.244883, -1.357729, 1, 0.2745098, 0, 1,
-1.6738, -0.1435986, -0.7749359, 1, 0.282353, 0, 1,
-1.668355, -0.1142399, -1.58336, 1, 0.2862745, 0, 1,
-1.653252, -0.9466253, -1.737258, 1, 0.2941177, 0, 1,
-1.616428, 1.608267, -0.5053143, 1, 0.3019608, 0, 1,
-1.611784, -0.1053224, -2.196141, 1, 0.3058824, 0, 1,
-1.607588, -0.3843164, -1.550724, 1, 0.3137255, 0, 1,
-1.60501, -0.8922098, -3.503426, 1, 0.3176471, 0, 1,
-1.602925, -0.7884065, -1.142993, 1, 0.3254902, 0, 1,
-1.578692, 0.2292258, -3.655404, 1, 0.3294118, 0, 1,
-1.568523, 0.3017825, -0.01096753, 1, 0.3372549, 0, 1,
-1.555797, -0.1955286, -1.077956, 1, 0.3411765, 0, 1,
-1.552657, 1.095274, 0.5508738, 1, 0.3490196, 0, 1,
-1.547764, -0.3850259, -1.98139, 1, 0.3529412, 0, 1,
-1.54567, 0.1468315, -2.057597, 1, 0.3607843, 0, 1,
-1.526626, -0.08858703, -1.70871, 1, 0.3647059, 0, 1,
-1.518045, 0.7299173, -0.441031, 1, 0.372549, 0, 1,
-1.513043, -0.6344157, -0.7788325, 1, 0.3764706, 0, 1,
-1.511172, 0.5188432, -2.045369, 1, 0.3843137, 0, 1,
-1.505385, 2.284882, 0.5431162, 1, 0.3882353, 0, 1,
-1.504835, -0.4842865, -0.7521976, 1, 0.3960784, 0, 1,
-1.487921, -0.2358081, -3.372546, 1, 0.4039216, 0, 1,
-1.486458, 0.1928501, -2.584189, 1, 0.4078431, 0, 1,
-1.48126, 0.3306242, -0.4068809, 1, 0.4156863, 0, 1,
-1.477105, -1.301032, -1.954578, 1, 0.4196078, 0, 1,
-1.476089, 0.9850841, -1.088984, 1, 0.427451, 0, 1,
-1.473176, -1.787537, -3.920613, 1, 0.4313726, 0, 1,
-1.460886, -0.278375, -1.722127, 1, 0.4392157, 0, 1,
-1.438888, -0.1676218, -2.935985, 1, 0.4431373, 0, 1,
-1.437505, -0.09311286, -2.033718, 1, 0.4509804, 0, 1,
-1.437148, -1.260583, -1.68176, 1, 0.454902, 0, 1,
-1.433004, -1.004874, -0.1984904, 1, 0.4627451, 0, 1,
-1.420436, -2.08981, -1.264034, 1, 0.4666667, 0, 1,
-1.407716, -0.5898591, -1.715624, 1, 0.4745098, 0, 1,
-1.401911, -0.6727021, -3.348292, 1, 0.4784314, 0, 1,
-1.398373, -1.692026, -2.995422, 1, 0.4862745, 0, 1,
-1.396206, 0.1021662, -2.752942, 1, 0.4901961, 0, 1,
-1.391778, -0.4760158, -1.547377, 1, 0.4980392, 0, 1,
-1.391031, -2.152039, -3.429945, 1, 0.5058824, 0, 1,
-1.381084, 0.5249009, -1.314883, 1, 0.509804, 0, 1,
-1.377243, -0.3823016, -1.3759, 1, 0.5176471, 0, 1,
-1.348526, 1.539666, -0.9388433, 1, 0.5215687, 0, 1,
-1.342402, 0.6327955, -1.604599, 1, 0.5294118, 0, 1,
-1.337655, -0.8167884, -3.251316, 1, 0.5333334, 0, 1,
-1.335182, 0.5475457, -1.544369, 1, 0.5411765, 0, 1,
-1.317502, -0.3935994, -2.233383, 1, 0.5450981, 0, 1,
-1.306325, 0.1530771, -0.4270155, 1, 0.5529412, 0, 1,
-1.302698, -0.9708587, -2.197041, 1, 0.5568628, 0, 1,
-1.285843, -1.015599, -2.05327, 1, 0.5647059, 0, 1,
-1.284207, -0.6268385, -1.799799, 1, 0.5686275, 0, 1,
-1.271105, -1.646127, -3.679148, 1, 0.5764706, 0, 1,
-1.268806, 1.595194, -0.6584284, 1, 0.5803922, 0, 1,
-1.262773, 1.077829, -2.579643, 1, 0.5882353, 0, 1,
-1.260527, -0.1010516, -2.202351, 1, 0.5921569, 0, 1,
-1.256679, -0.5467769, -3.313787, 1, 0.6, 0, 1,
-1.24285, -0.1185277, -2.213224, 1, 0.6078432, 0, 1,
-1.231226, -0.1865485, -1.451497, 1, 0.6117647, 0, 1,
-1.227366, 0.2080779, -2.012879, 1, 0.6196079, 0, 1,
-1.22552, 1.058939, 0.5876773, 1, 0.6235294, 0, 1,
-1.224801, 0.7144787, -0.7440567, 1, 0.6313726, 0, 1,
-1.215541, 0.1180836, 0.1093595, 1, 0.6352941, 0, 1,
-1.213324, -0.4210809, -2.699201, 1, 0.6431373, 0, 1,
-1.20321, 0.4720128, 0.04717875, 1, 0.6470588, 0, 1,
-1.195031, -1.700992, -2.267915, 1, 0.654902, 0, 1,
-1.19003, 1.454093, -0.4510955, 1, 0.6588235, 0, 1,
-1.180769, -0.4619783, -1.555853, 1, 0.6666667, 0, 1,
-1.177795, -0.01963782, -1.833013, 1, 0.6705883, 0, 1,
-1.176687, 1.071434, -0.6532592, 1, 0.6784314, 0, 1,
-1.171773, 0.6343458, -1.923435, 1, 0.682353, 0, 1,
-1.170498, -0.5552432, -3.10533, 1, 0.6901961, 0, 1,
-1.166346, 0.7096969, -0.07697403, 1, 0.6941177, 0, 1,
-1.166186, -1.546531, -3.591255, 1, 0.7019608, 0, 1,
-1.161138, -0.4300722, -2.246724, 1, 0.7098039, 0, 1,
-1.157731, -1.25616, -2.974391, 1, 0.7137255, 0, 1,
-1.150982, 0.8398513, -1.230438, 1, 0.7215686, 0, 1,
-1.147757, -0.07384571, -0.8765313, 1, 0.7254902, 0, 1,
-1.143457, -0.320237, -2.038761, 1, 0.7333333, 0, 1,
-1.142558, -0.272328, -1.579843, 1, 0.7372549, 0, 1,
-1.137775, 1.489148, -2.121509, 1, 0.7450981, 0, 1,
-1.136264, -0.8937241, -1.243986, 1, 0.7490196, 0, 1,
-1.134202, -1.191859, -2.541637, 1, 0.7568628, 0, 1,
-1.129161, 0.2668331, -0.436769, 1, 0.7607843, 0, 1,
-1.128222, 1.420126, 0.00798456, 1, 0.7686275, 0, 1,
-1.127505, 1.180963, -1.083801, 1, 0.772549, 0, 1,
-1.125373, -1.347955, -2.410061, 1, 0.7803922, 0, 1,
-1.11187, 0.1747167, -1.197126, 1, 0.7843137, 0, 1,
-1.109724, -1.549836, -2.750432, 1, 0.7921569, 0, 1,
-1.09604, 2.792746, -0.5464748, 1, 0.7960784, 0, 1,
-1.093126, -1.362316, -2.668213, 1, 0.8039216, 0, 1,
-1.092403, -0.1377099, -1.277977, 1, 0.8117647, 0, 1,
-1.082649, -1.100459, -2.487076, 1, 0.8156863, 0, 1,
-1.080158, 0.5760221, -1.280526, 1, 0.8235294, 0, 1,
-1.072272, 0.631489, -0.9062909, 1, 0.827451, 0, 1,
-1.069334, -1.118173, -2.819046, 1, 0.8352941, 0, 1,
-1.066459, -0.696612, -3.485358, 1, 0.8392157, 0, 1,
-1.063938, 0.5429444, -2.830281, 1, 0.8470588, 0, 1,
-1.062478, -1.005299, -2.384767, 1, 0.8509804, 0, 1,
-1.059475, -1.192247, -2.829348, 1, 0.8588235, 0, 1,
-1.051285, 0.9626809, -0.4945369, 1, 0.8627451, 0, 1,
-1.033909, -0.6509376, -1.447093, 1, 0.8705882, 0, 1,
-1.031973, 0.1570269, -1.355005, 1, 0.8745098, 0, 1,
-1.023118, -0.7067153, -1.773045, 1, 0.8823529, 0, 1,
-1.022367, 0.990024, -1.020151, 1, 0.8862745, 0, 1,
-1.015904, -1.913486, -1.385312, 1, 0.8941177, 0, 1,
-1.009483, -0.1835327, -3.151621, 1, 0.8980392, 0, 1,
-0.997113, -0.3382832, 1.042768, 1, 0.9058824, 0, 1,
-0.9933177, 0.4060658, -1.681407, 1, 0.9137255, 0, 1,
-0.9924042, -0.4990499, -1.462521, 1, 0.9176471, 0, 1,
-0.9881501, 0.5551711, -2.343885, 1, 0.9254902, 0, 1,
-0.9835992, 0.3486531, -2.474431, 1, 0.9294118, 0, 1,
-0.9764774, -2.468625, -2.215085, 1, 0.9372549, 0, 1,
-0.9672382, 0.7636798, -1.91551, 1, 0.9411765, 0, 1,
-0.9579154, 0.9355335, -0.8676997, 1, 0.9490196, 0, 1,
-0.951176, -1.475773, -3.113654, 1, 0.9529412, 0, 1,
-0.950548, 0.3671679, -1.007732, 1, 0.9607843, 0, 1,
-0.9489223, -0.9881022, -2.040022, 1, 0.9647059, 0, 1,
-0.9426559, -0.8069522, -2.542576, 1, 0.972549, 0, 1,
-0.9415351, -0.9946874, -2.420639, 1, 0.9764706, 0, 1,
-0.9375946, 0.1466754, -0.9936249, 1, 0.9843137, 0, 1,
-0.9348219, -0.7129822, -1.036913, 1, 0.9882353, 0, 1,
-0.933135, -0.334116, -3.130975, 1, 0.9960784, 0, 1,
-0.9322039, -1.374762, -1.728693, 0.9960784, 1, 0, 1,
-0.9313863, 0.8063929, -1.957009, 0.9921569, 1, 0, 1,
-0.9272403, -0.7283321, -1.671053, 0.9843137, 1, 0, 1,
-0.9209693, -1.153806, -2.280086, 0.9803922, 1, 0, 1,
-0.9153463, -0.9219034, -2.00496, 0.972549, 1, 0, 1,
-0.9100775, -1.770481, -2.805446, 0.9686275, 1, 0, 1,
-0.9063226, 0.7955528, -0.5859495, 0.9607843, 1, 0, 1,
-0.9056721, 0.7189076, -0.4578174, 0.9568627, 1, 0, 1,
-0.9049353, -0.187179, -2.237877, 0.9490196, 1, 0, 1,
-0.904806, 1.160682, -1.370769, 0.945098, 1, 0, 1,
-0.8975202, 1.150546, -0.09314921, 0.9372549, 1, 0, 1,
-0.8898097, -1.067186, -2.142844, 0.9333333, 1, 0, 1,
-0.8892464, 0.08176086, -3.01736, 0.9254902, 1, 0, 1,
-0.8845823, 0.7327141, 1.158406, 0.9215686, 1, 0, 1,
-0.8783054, 0.3325236, -1.989009, 0.9137255, 1, 0, 1,
-0.8764198, -1.278365, -1.765877, 0.9098039, 1, 0, 1,
-0.8755772, -1.597162, -2.769951, 0.9019608, 1, 0, 1,
-0.869916, -1.144912, -1.681866, 0.8941177, 1, 0, 1,
-0.8690463, 0.2858662, -3.717563, 0.8901961, 1, 0, 1,
-0.8687747, -0.4924733, -1.503181, 0.8823529, 1, 0, 1,
-0.8654557, -1.997923, -3.917114, 0.8784314, 1, 0, 1,
-0.8603157, 0.2771461, -2.020601, 0.8705882, 1, 0, 1,
-0.8594964, -0.1358445, -0.4036395, 0.8666667, 1, 0, 1,
-0.8586938, -0.7091129, -1.719172, 0.8588235, 1, 0, 1,
-0.8576678, -0.2028389, -1.716015, 0.854902, 1, 0, 1,
-0.856251, -1.155173, -1.465504, 0.8470588, 1, 0, 1,
-0.8554465, -0.8766467, -1.238617, 0.8431373, 1, 0, 1,
-0.852144, 0.4952738, -0.1743289, 0.8352941, 1, 0, 1,
-0.8452718, 1.015078, -1.525938, 0.8313726, 1, 0, 1,
-0.8442631, 0.1039263, -1.098544, 0.8235294, 1, 0, 1,
-0.8438899, 0.2667144, -1.315444, 0.8196079, 1, 0, 1,
-0.8434624, 0.9653752, -0.1349158, 0.8117647, 1, 0, 1,
-0.8400343, 0.9702532, -0.9678639, 0.8078431, 1, 0, 1,
-0.8388608, 0.2994389, -0.8046065, 0.8, 1, 0, 1,
-0.8340408, 0.1934519, -1.17446, 0.7921569, 1, 0, 1,
-0.8280806, -0.3057518, -2.435763, 0.7882353, 1, 0, 1,
-0.8245461, 1.695168, 0.7489191, 0.7803922, 1, 0, 1,
-0.8239461, -0.7784774, -2.631263, 0.7764706, 1, 0, 1,
-0.82075, 0.3926716, -1.183418, 0.7686275, 1, 0, 1,
-0.8149356, 0.8243624, 0.1435408, 0.7647059, 1, 0, 1,
-0.7982292, 0.3212609, -2.281873, 0.7568628, 1, 0, 1,
-0.7963931, 0.4336595, 1.550379, 0.7529412, 1, 0, 1,
-0.7957143, -0.2303053, -2.880694, 0.7450981, 1, 0, 1,
-0.7926507, -0.4637595, -2.621141, 0.7411765, 1, 0, 1,
-0.790969, 0.377703, -1.609068, 0.7333333, 1, 0, 1,
-0.7880785, 1.240603, 0.08970708, 0.7294118, 1, 0, 1,
-0.7872138, -0.5196548, -2.754404, 0.7215686, 1, 0, 1,
-0.7853196, -1.673733, -1.721126, 0.7176471, 1, 0, 1,
-0.7852872, 0.3608161, 1.448106, 0.7098039, 1, 0, 1,
-0.7821644, -1.65624, -1.124305, 0.7058824, 1, 0, 1,
-0.7746416, -0.9532, -0.4665075, 0.6980392, 1, 0, 1,
-0.7741923, 0.3715571, -1.915957, 0.6901961, 1, 0, 1,
-0.7734966, 0.3059435, -1.65891, 0.6862745, 1, 0, 1,
-0.7732359, -0.1948673, -3.240627, 0.6784314, 1, 0, 1,
-0.7731082, 0.4280234, -2.443012, 0.6745098, 1, 0, 1,
-0.7718613, 0.1336536, -1.683505, 0.6666667, 1, 0, 1,
-0.766387, -1.556839, -1.848762, 0.6627451, 1, 0, 1,
-0.7609254, 0.5106222, -0.6185527, 0.654902, 1, 0, 1,
-0.7575847, -1.261586, -1.421375, 0.6509804, 1, 0, 1,
-0.7512217, -0.9871661, -2.148604, 0.6431373, 1, 0, 1,
-0.7490259, -1.018129, -3.506801, 0.6392157, 1, 0, 1,
-0.7471964, -0.2279678, -2.075974, 0.6313726, 1, 0, 1,
-0.7463374, -0.3044963, -0.8004954, 0.627451, 1, 0, 1,
-0.7449193, 1.376911, -1.737441, 0.6196079, 1, 0, 1,
-0.7430744, -1.258994, -3.299224, 0.6156863, 1, 0, 1,
-0.7382174, 1.62711, -0.259692, 0.6078432, 1, 0, 1,
-0.7376659, 1.344356, -1.695514, 0.6039216, 1, 0, 1,
-0.7368564, 0.09447805, -1.614412, 0.5960785, 1, 0, 1,
-0.7350179, 0.4090719, -0.3145432, 0.5882353, 1, 0, 1,
-0.7289176, 0.6518469, -0.1996721, 0.5843138, 1, 0, 1,
-0.722122, -0.8047717, -3.298094, 0.5764706, 1, 0, 1,
-0.7199906, -1.256952, -3.515933, 0.572549, 1, 0, 1,
-0.7199736, -0.03447903, -1.932147, 0.5647059, 1, 0, 1,
-0.7179319, 1.885489, -0.4969102, 0.5607843, 1, 0, 1,
-0.7171347, -1.122377, -0.7014599, 0.5529412, 1, 0, 1,
-0.7110139, -1.398853, -2.441777, 0.5490196, 1, 0, 1,
-0.7092751, -0.05818743, -2.612064, 0.5411765, 1, 0, 1,
-0.7076122, 1.372654, -0.8906052, 0.5372549, 1, 0, 1,
-0.7067951, -0.9633508, -2.635437, 0.5294118, 1, 0, 1,
-0.7062678, -0.5197105, -2.172058, 0.5254902, 1, 0, 1,
-0.6994721, -0.2950882, -0.8003522, 0.5176471, 1, 0, 1,
-0.6890471, -0.8826248, -1.616963, 0.5137255, 1, 0, 1,
-0.684341, 0.2744257, -1.40725, 0.5058824, 1, 0, 1,
-0.6798754, 2.20127, 0.8684334, 0.5019608, 1, 0, 1,
-0.671209, -0.2475288, -1.465856, 0.4941176, 1, 0, 1,
-0.6704044, 1.357566, 0.2811529, 0.4862745, 1, 0, 1,
-0.6675931, 0.2670963, -2.086188, 0.4823529, 1, 0, 1,
-0.6656042, -1.343992, -3.209308, 0.4745098, 1, 0, 1,
-0.6644583, 1.347649, -0.5842287, 0.4705882, 1, 0, 1,
-0.6639618, -0.1109791, -1.670744, 0.4627451, 1, 0, 1,
-0.6628183, -0.1681512, -2.258495, 0.4588235, 1, 0, 1,
-0.6618821, -0.05059401, -0.08535468, 0.4509804, 1, 0, 1,
-0.6610886, -0.8945097, -2.799717, 0.4470588, 1, 0, 1,
-0.6607651, 0.5995758, -0.3583668, 0.4392157, 1, 0, 1,
-0.6606812, 0.4989619, -1.292465, 0.4352941, 1, 0, 1,
-0.6598415, 0.6046961, -2.53722, 0.427451, 1, 0, 1,
-0.6560528, -0.3059951, -1.06169, 0.4235294, 1, 0, 1,
-0.6408365, 0.3837607, -1.396533, 0.4156863, 1, 0, 1,
-0.6408158, 1.07866, -1.423826, 0.4117647, 1, 0, 1,
-0.6303058, -1.98305, -4.694234, 0.4039216, 1, 0, 1,
-0.6296425, -0.5557883, -2.63088, 0.3960784, 1, 0, 1,
-0.6264039, 0.3275291, 0.3080039, 0.3921569, 1, 0, 1,
-0.6247259, 0.5804163, -1.760045, 0.3843137, 1, 0, 1,
-0.6209387, 0.5545193, -1.822212, 0.3803922, 1, 0, 1,
-0.619479, 1.809748, 0.9427642, 0.372549, 1, 0, 1,
-0.6164793, -0.8344657, -3.510346, 0.3686275, 1, 0, 1,
-0.6162531, 1.364223, 0.9113167, 0.3607843, 1, 0, 1,
-0.6156408, 0.3008573, -1.71228, 0.3568628, 1, 0, 1,
-0.6047994, -1.3414, -1.992019, 0.3490196, 1, 0, 1,
-0.602743, 1.055545, -0.3726869, 0.345098, 1, 0, 1,
-0.6019703, -0.07578778, -1.17457, 0.3372549, 1, 0, 1,
-0.6015183, -1.199398, -2.519046, 0.3333333, 1, 0, 1,
-0.601344, -0.3969497, -2.10543, 0.3254902, 1, 0, 1,
-0.6008233, -0.1816296, -3.247347, 0.3215686, 1, 0, 1,
-0.5981727, -1.064737, -3.763351, 0.3137255, 1, 0, 1,
-0.5945739, -0.885685, -2.927916, 0.3098039, 1, 0, 1,
-0.5922198, -0.4490678, -1.570754, 0.3019608, 1, 0, 1,
-0.5904405, -0.7787004, -1.167431, 0.2941177, 1, 0, 1,
-0.5897134, -0.7847905, -1.257865, 0.2901961, 1, 0, 1,
-0.582963, 1.135501, -2.552431, 0.282353, 1, 0, 1,
-0.5819774, -0.1641226, -1.532628, 0.2784314, 1, 0, 1,
-0.5746608, -0.3163587, -3.275512, 0.2705882, 1, 0, 1,
-0.5674057, 0.5985849, -0.8973933, 0.2666667, 1, 0, 1,
-0.5574943, 0.4508122, -2.568572, 0.2588235, 1, 0, 1,
-0.5560419, -1.026675, -2.831216, 0.254902, 1, 0, 1,
-0.5520904, 0.01534582, -1.150469, 0.2470588, 1, 0, 1,
-0.5482399, -1.276267, -2.268136, 0.2431373, 1, 0, 1,
-0.5455735, 0.9568384, -0.5971072, 0.2352941, 1, 0, 1,
-0.5401811, 1.023181, -0.6268591, 0.2313726, 1, 0, 1,
-0.5364113, 0.2379242, -0.9153425, 0.2235294, 1, 0, 1,
-0.533006, -0.5341508, -2.134909, 0.2196078, 1, 0, 1,
-0.5262293, -1.021222, -2.132991, 0.2117647, 1, 0, 1,
-0.5230475, -1.213562, -4.188508, 0.2078431, 1, 0, 1,
-0.5212369, 0.2905453, -0.8048972, 0.2, 1, 0, 1,
-0.5161051, -1.372951, -3.743088, 0.1921569, 1, 0, 1,
-0.5123796, 0.09437202, -2.388528, 0.1882353, 1, 0, 1,
-0.5114415, 1.426168, 0.09359648, 0.1803922, 1, 0, 1,
-0.5098854, -0.5089982, -3.182102, 0.1764706, 1, 0, 1,
-0.4988466, 0.5580367, 1.266366, 0.1686275, 1, 0, 1,
-0.4960113, 1.884948, -0.9701905, 0.1647059, 1, 0, 1,
-0.4950907, -1.081045, -3.352217, 0.1568628, 1, 0, 1,
-0.4915472, -0.2033818, -3.187099, 0.1529412, 1, 0, 1,
-0.4899026, -0.5358707, -2.269284, 0.145098, 1, 0, 1,
-0.4891407, 0.4679609, -0.4631076, 0.1411765, 1, 0, 1,
-0.4862412, -0.6264711, -1.58694, 0.1333333, 1, 0, 1,
-0.4842593, -0.6820496, -2.149198, 0.1294118, 1, 0, 1,
-0.4824351, -0.3651124, -1.549641, 0.1215686, 1, 0, 1,
-0.4794688, -0.6806788, -1.828723, 0.1176471, 1, 0, 1,
-0.4759214, 0.3498959, -1.053514, 0.1098039, 1, 0, 1,
-0.4742239, -1.504328, -1.756569, 0.1058824, 1, 0, 1,
-0.4735466, -0.1072134, -1.753314, 0.09803922, 1, 0, 1,
-0.4682186, -1.348614, -3.688374, 0.09019608, 1, 0, 1,
-0.4642248, -0.2681254, -2.790738, 0.08627451, 1, 0, 1,
-0.4615597, -2.209637, -4.434816, 0.07843138, 1, 0, 1,
-0.4606665, 0.2685905, -1.905539, 0.07450981, 1, 0, 1,
-0.4562677, 0.2666518, -1.536546, 0.06666667, 1, 0, 1,
-0.44874, -0.5427721, -3.396294, 0.0627451, 1, 0, 1,
-0.4403726, 0.1079436, -2.195438, 0.05490196, 1, 0, 1,
-0.4374227, -0.5062383, -3.012992, 0.05098039, 1, 0, 1,
-0.4337986, 0.7941419, 0.4878363, 0.04313726, 1, 0, 1,
-0.4334829, 0.1630666, -0.4699658, 0.03921569, 1, 0, 1,
-0.4327458, 0.7236395, -1.696149, 0.03137255, 1, 0, 1,
-0.4296042, 0.1580721, -1.319404, 0.02745098, 1, 0, 1,
-0.4293003, -0.5520847, -2.497525, 0.01960784, 1, 0, 1,
-0.4196192, 0.855898, 0.577758, 0.01568628, 1, 0, 1,
-0.4193062, -0.989728, -4.691012, 0.007843138, 1, 0, 1,
-0.4191157, -0.02848301, -0.1970429, 0.003921569, 1, 0, 1,
-0.4183499, -0.4697016, -2.411547, 0, 1, 0.003921569, 1,
-0.4121315, -1.17027, -1.408698, 0, 1, 0.01176471, 1,
-0.4114771, -0.8968689, -3.910847, 0, 1, 0.01568628, 1,
-0.4095687, -1.562356, -4.707169, 0, 1, 0.02352941, 1,
-0.4091119, -0.971749, -1.795499, 0, 1, 0.02745098, 1,
-0.4038807, -1.358668, -0.9015893, 0, 1, 0.03529412, 1,
-0.403303, 2.163404, -1.469657, 0, 1, 0.03921569, 1,
-0.4025417, 0.5522702, -0.710078, 0, 1, 0.04705882, 1,
-0.3972368, -0.273082, -1.220617, 0, 1, 0.05098039, 1,
-0.3970733, 0.6196455, -1.820194, 0, 1, 0.05882353, 1,
-0.3948641, -0.2983111, -3.182496, 0, 1, 0.0627451, 1,
-0.392958, -1.527237, -4.104783, 0, 1, 0.07058824, 1,
-0.3929327, -0.5046383, -1.782486, 0, 1, 0.07450981, 1,
-0.3920896, -0.3071494, -1.850219, 0, 1, 0.08235294, 1,
-0.3879463, -0.2063249, -2.274561, 0, 1, 0.08627451, 1,
-0.3874856, -0.3074214, -1.433875, 0, 1, 0.09411765, 1,
-0.3869055, -0.01659109, -1.166419, 0, 1, 0.1019608, 1,
-0.3848331, 0.7479628, 0.003158041, 0, 1, 0.1058824, 1,
-0.377551, -1.924944, -2.716152, 0, 1, 0.1137255, 1,
-0.3758388, -1.748039, -3.540703, 0, 1, 0.1176471, 1,
-0.3731433, -1.47644, -3.499461, 0, 1, 0.1254902, 1,
-0.3722983, 2.056035, -1.000352, 0, 1, 0.1294118, 1,
-0.3708636, -0.4410514, -1.035997, 0, 1, 0.1372549, 1,
-0.3665827, 0.4887535, -0.7395958, 0, 1, 0.1411765, 1,
-0.3615646, 1.456852, 0.8966314, 0, 1, 0.1490196, 1,
-0.3585282, 2.393373, -0.2792765, 0, 1, 0.1529412, 1,
-0.350682, -0.2603415, -1.644594, 0, 1, 0.1607843, 1,
-0.3503164, 0.6837204, 1.136639, 0, 1, 0.1647059, 1,
-0.3479398, -0.8699285, -2.595618, 0, 1, 0.172549, 1,
-0.3457429, 0.4014198, 0.1269655, 0, 1, 0.1764706, 1,
-0.344742, -0.5675705, -2.993311, 0, 1, 0.1843137, 1,
-0.3415959, 0.02632749, -1.877593, 0, 1, 0.1882353, 1,
-0.3408356, 1.478383, -1.554846, 0, 1, 0.1960784, 1,
-0.3386472, -0.2671882, -2.999393, 0, 1, 0.2039216, 1,
-0.3376096, 0.4311353, -0.9250426, 0, 1, 0.2078431, 1,
-0.3358884, -0.884669, -2.634608, 0, 1, 0.2156863, 1,
-0.3337831, 0.160446, -1.778454, 0, 1, 0.2196078, 1,
-0.3309705, -0.1190541, -0.7791717, 0, 1, 0.227451, 1,
-0.3295229, -1.612473, -1.755226, 0, 1, 0.2313726, 1,
-0.3281118, -0.7095881, -3.513884, 0, 1, 0.2392157, 1,
-0.3253988, 0.5045583, -1.371389, 0, 1, 0.2431373, 1,
-0.3239875, -0.6011159, -0.9719875, 0, 1, 0.2509804, 1,
-0.3212508, 1.784707, 0.1698728, 0, 1, 0.254902, 1,
-0.3196828, 0.9251931, -1.037493, 0, 1, 0.2627451, 1,
-0.3191973, 0.2500543, -1.939358, 0, 1, 0.2666667, 1,
-0.319088, -0.1553614, -2.543135, 0, 1, 0.2745098, 1,
-0.3177186, 2.079242, 0.5688879, 0, 1, 0.2784314, 1,
-0.3152154, 0.6326206, -0.6761022, 0, 1, 0.2862745, 1,
-0.3137694, -0.1933083, -2.296004, 0, 1, 0.2901961, 1,
-0.3076039, 0.533786, -1.746719, 0, 1, 0.2980392, 1,
-0.3074184, -0.5926024, -5.192056, 0, 1, 0.3058824, 1,
-0.3066398, 0.560707, -0.3789529, 0, 1, 0.3098039, 1,
-0.3062401, 0.1129539, -2.265252, 0, 1, 0.3176471, 1,
-0.3042009, 0.7562096, -1.87689, 0, 1, 0.3215686, 1,
-0.3030175, -0.4096006, -3.416941, 0, 1, 0.3294118, 1,
-0.301306, 0.6631686, -0.7909671, 0, 1, 0.3333333, 1,
-0.301244, 0.2985163, -1.177475, 0, 1, 0.3411765, 1,
-0.2972175, 0.9094264, -0.6405585, 0, 1, 0.345098, 1,
-0.29191, -0.1369861, -2.861846, 0, 1, 0.3529412, 1,
-0.2873134, 0.1665837, -1.674634, 0, 1, 0.3568628, 1,
-0.2857538, 0.2814998, 0.4617913, 0, 1, 0.3647059, 1,
-0.2820143, -0.6186277, -3.302973, 0, 1, 0.3686275, 1,
-0.2809991, -0.3273126, -1.486196, 0, 1, 0.3764706, 1,
-0.2808771, 0.5170438, -0.9473235, 0, 1, 0.3803922, 1,
-0.2795244, -0.9998656, -2.992409, 0, 1, 0.3882353, 1,
-0.2783777, 0.7087376, -0.9666779, 0, 1, 0.3921569, 1,
-0.2773809, 0.7752265, -3.037048, 0, 1, 0.4, 1,
-0.2770697, -0.342318, -3.36436, 0, 1, 0.4078431, 1,
-0.2759086, 1.430227, 0.4338052, 0, 1, 0.4117647, 1,
-0.275059, 1.256107, -0.1934471, 0, 1, 0.4196078, 1,
-0.2744325, 0.9705014, -0.1500327, 0, 1, 0.4235294, 1,
-0.2727653, 2.274555, 0.8480196, 0, 1, 0.4313726, 1,
-0.2720948, -2.116077, -3.844446, 0, 1, 0.4352941, 1,
-0.2717381, -0.8249076, -2.192616, 0, 1, 0.4431373, 1,
-0.2693109, -0.3692079, -2.845131, 0, 1, 0.4470588, 1,
-0.263817, -0.07131864, -0.5739895, 0, 1, 0.454902, 1,
-0.2633715, -1.641617, -1.382772, 0, 1, 0.4588235, 1,
-0.2615745, 1.031069, 0.6295469, 0, 1, 0.4666667, 1,
-0.2610179, -0.4743512, -3.359504, 0, 1, 0.4705882, 1,
-0.2599617, 0.7510657, 2.793371, 0, 1, 0.4784314, 1,
-0.2542953, -1.77379, -5.655431, 0, 1, 0.4823529, 1,
-0.253818, 0.2575717, -0.7844024, 0, 1, 0.4901961, 1,
-0.2495816, -2.139698, -3.408045, 0, 1, 0.4941176, 1,
-0.2479215, -1.010381, -3.749999, 0, 1, 0.5019608, 1,
-0.2466236, 0.7978908, -0.9633297, 0, 1, 0.509804, 1,
-0.2455837, 0.5770405, 0.7681326, 0, 1, 0.5137255, 1,
-0.2408519, 1.144792, 0.2086324, 0, 1, 0.5215687, 1,
-0.2377841, -1.618603, 0.1836731, 0, 1, 0.5254902, 1,
-0.2361455, 0.1429845, 0.3895058, 0, 1, 0.5333334, 1,
-0.2358639, 0.8360305, -0.6630186, 0, 1, 0.5372549, 1,
-0.2350286, 0.4297089, 0.1887602, 0, 1, 0.5450981, 1,
-0.2284482, -0.7689629, -4.053098, 0, 1, 0.5490196, 1,
-0.2263616, 1.046365, 0.7926455, 0, 1, 0.5568628, 1,
-0.2248428, 1.84043, 0.09712764, 0, 1, 0.5607843, 1,
-0.2247047, -1.545016, -1.012787, 0, 1, 0.5686275, 1,
-0.2226568, 1.756379, -0.8150567, 0, 1, 0.572549, 1,
-0.222645, 1.502099, -1.393169, 0, 1, 0.5803922, 1,
-0.2200624, 0.5752832, 0.004205836, 0, 1, 0.5843138, 1,
-0.2194916, -1.063262, -4.792556, 0, 1, 0.5921569, 1,
-0.2194674, 0.4028632, -0.7349595, 0, 1, 0.5960785, 1,
-0.2187739, 1.296588, -1.228058, 0, 1, 0.6039216, 1,
-0.2169511, -1.340424, -3.841386, 0, 1, 0.6117647, 1,
-0.2127054, 0.2995158, -1.600775, 0, 1, 0.6156863, 1,
-0.2114184, 0.5610825, 0.3185533, 0, 1, 0.6235294, 1,
-0.2101338, -0.1281805, -1.442817, 0, 1, 0.627451, 1,
-0.2089768, 0.1441059, -1.393261, 0, 1, 0.6352941, 1,
-0.1980149, -1.481548, -2.736444, 0, 1, 0.6392157, 1,
-0.1880263, 1.148689, -0.2131415, 0, 1, 0.6470588, 1,
-0.1874697, 1.001627, -0.3934533, 0, 1, 0.6509804, 1,
-0.1850293, -0.6401972, -4.440878, 0, 1, 0.6588235, 1,
-0.1787065, 0.2371541, -0.2197029, 0, 1, 0.6627451, 1,
-0.1730438, -0.1498535, -2.760507, 0, 1, 0.6705883, 1,
-0.1708246, -0.2258891, -3.418892, 0, 1, 0.6745098, 1,
-0.1664995, 0.2890049, -0.3979307, 0, 1, 0.682353, 1,
-0.1655092, 0.5011613, 0.2875237, 0, 1, 0.6862745, 1,
-0.1648107, 0.9083276, -1.643471, 0, 1, 0.6941177, 1,
-0.1627688, -2.043576, -4.618299, 0, 1, 0.7019608, 1,
-0.1620271, 0.1191656, -0.7738362, 0, 1, 0.7058824, 1,
-0.1609423, -0.1601607, -2.195121, 0, 1, 0.7137255, 1,
-0.1539557, -0.2350319, -1.501423, 0, 1, 0.7176471, 1,
-0.1538162, 0.6772206, -1.159231, 0, 1, 0.7254902, 1,
-0.1526449, 0.5072545, -0.1786233, 0, 1, 0.7294118, 1,
-0.1470702, 0.567842, 0.995733, 0, 1, 0.7372549, 1,
-0.14522, 0.8344337, -1.552502, 0, 1, 0.7411765, 1,
-0.1434388, -0.6077998, -2.680406, 0, 1, 0.7490196, 1,
-0.1407936, -0.2221458, -3.348835, 0, 1, 0.7529412, 1,
-0.139981, 0.4646089, -1.765498, 0, 1, 0.7607843, 1,
-0.1390738, -0.3988984, -3.385495, 0, 1, 0.7647059, 1,
-0.136066, -0.1742705, -0.3383537, 0, 1, 0.772549, 1,
-0.1337175, 0.8553611, -0.9955269, 0, 1, 0.7764706, 1,
-0.1187578, -0.7300194, -3.40197, 0, 1, 0.7843137, 1,
-0.1187338, 0.9711278, 0.6745573, 0, 1, 0.7882353, 1,
-0.1169186, -0.4821548, -3.952235, 0, 1, 0.7960784, 1,
-0.1149133, 0.9702834, 0.1591991, 0, 1, 0.8039216, 1,
-0.1058197, -0.408649, -3.488209, 0, 1, 0.8078431, 1,
-0.1045473, 0.7407386, -0.7408416, 0, 1, 0.8156863, 1,
-0.1026555, -0.9232494, -3.966891, 0, 1, 0.8196079, 1,
-0.09927317, -1.980556, -4.104825, 0, 1, 0.827451, 1,
-0.09926911, 0.5502127, -0.6242895, 0, 1, 0.8313726, 1,
-0.09793595, 1.138348, -1.084046, 0, 1, 0.8392157, 1,
-0.09758867, -1.171832, -4.065908, 0, 1, 0.8431373, 1,
-0.09642569, 0.7687767, -1.309508, 0, 1, 0.8509804, 1,
-0.09635017, -1.48419, -4.179956, 0, 1, 0.854902, 1,
-0.08797761, 0.3542049, -0.3175507, 0, 1, 0.8627451, 1,
-0.08607659, -0.9761984, -2.765494, 0, 1, 0.8666667, 1,
-0.08240425, -0.2551568, -3.962102, 0, 1, 0.8745098, 1,
-0.07698734, 0.07089926, -1.46646, 0, 1, 0.8784314, 1,
-0.07611175, 0.3059242, -0.3158335, 0, 1, 0.8862745, 1,
-0.0753528, -1.060125, -2.33809, 0, 1, 0.8901961, 1,
-0.07072297, 2.195884, 1.279519, 0, 1, 0.8980392, 1,
-0.06522497, 1.129804, 0.5776552, 0, 1, 0.9058824, 1,
-0.06487691, -0.2103123, -3.458628, 0, 1, 0.9098039, 1,
-0.06482551, 1.516312, 1.217824, 0, 1, 0.9176471, 1,
-0.06330636, -0.3937173, -3.094127, 0, 1, 0.9215686, 1,
-0.06293441, -0.2825497, -2.453252, 0, 1, 0.9294118, 1,
-0.06126226, 0.5355868, -1.218428, 0, 1, 0.9333333, 1,
-0.05727973, -1.4145, -3.756864, 0, 1, 0.9411765, 1,
-0.05725935, 1.039171, 3.185864, 0, 1, 0.945098, 1,
-0.05631914, -1.390496, -2.719899, 0, 1, 0.9529412, 1,
-0.04889674, 0.110538, 0.5018579, 0, 1, 0.9568627, 1,
-0.04715724, -0.3062777, -4.000241, 0, 1, 0.9647059, 1,
-0.04705886, -0.371084, -2.994404, 0, 1, 0.9686275, 1,
-0.04494239, 2.232821, -0.4764218, 0, 1, 0.9764706, 1,
-0.0385958, -0.3515722, -1.934936, 0, 1, 0.9803922, 1,
-0.03507641, 0.3168263, 0.9366511, 0, 1, 0.9882353, 1,
-0.03294186, -0.1418222, -4.390743, 0, 1, 0.9921569, 1,
-0.02735413, -0.8779681, -2.375293, 0, 1, 1, 1,
-0.02420996, 0.1273959, 0.07185163, 0, 0.9921569, 1, 1,
-0.02245248, 0.3374504, -2.428212, 0, 0.9882353, 1, 1,
-0.02027207, 0.05648135, -1.669682, 0, 0.9803922, 1, 1,
-0.01946846, -2.3716, -3.936546, 0, 0.9764706, 1, 1,
-0.01851114, 1.331408, 0.404996, 0, 0.9686275, 1, 1,
-0.01808654, 1.596928, 0.5824915, 0, 0.9647059, 1, 1,
-0.01515141, -0.06200218, -3.793414, 0, 0.9568627, 1, 1,
-0.004855263, 0.29501, 0.8085591, 0, 0.9529412, 1, 1,
-0.002520073, -1.644712, -2.066816, 0, 0.945098, 1, 1,
0.003513349, -0.6655208, 2.418436, 0, 0.9411765, 1, 1,
0.004374376, -0.0121848, 1.114363, 0, 0.9333333, 1, 1,
0.004976558, -2.05062, 3.036633, 0, 0.9294118, 1, 1,
0.005821525, 1.542407, 1.336263, 0, 0.9215686, 1, 1,
0.008187599, 2.373562, -0.9239485, 0, 0.9176471, 1, 1,
0.009829073, 0.6115587, -1.016276, 0, 0.9098039, 1, 1,
0.01061085, 0.595202, 0.5084238, 0, 0.9058824, 1, 1,
0.01254995, 0.1136478, -0.6447399, 0, 0.8980392, 1, 1,
0.0164945, -0.3360273, 2.561854, 0, 0.8901961, 1, 1,
0.01969784, -0.4210136, 1.943108, 0, 0.8862745, 1, 1,
0.02239063, 0.296056, -1.361157, 0, 0.8784314, 1, 1,
0.02355103, -0.3059772, 2.54963, 0, 0.8745098, 1, 1,
0.02466403, 0.8987498, 0.6776123, 0, 0.8666667, 1, 1,
0.02529685, 1.539495, -2.473986, 0, 0.8627451, 1, 1,
0.0279542, 0.1940364, 0.8210503, 0, 0.854902, 1, 1,
0.0290208, 0.5853765, -0.03692212, 0, 0.8509804, 1, 1,
0.02966965, -0.490822, 3.965889, 0, 0.8431373, 1, 1,
0.03194938, -1.027027, 3.613422, 0, 0.8392157, 1, 1,
0.03313396, 0.7300843, 0.8446715, 0, 0.8313726, 1, 1,
0.04490602, -0.43071, 3.22555, 0, 0.827451, 1, 1,
0.04660014, -0.9216218, 3.126609, 0, 0.8196079, 1, 1,
0.04768909, 1.699519, 0.7020415, 0, 0.8156863, 1, 1,
0.0483847, -0.5348225, 3.731662, 0, 0.8078431, 1, 1,
0.04847965, 0.2716405, 0.9124173, 0, 0.8039216, 1, 1,
0.048868, 0.08709359, 2.473875, 0, 0.7960784, 1, 1,
0.05072636, 0.1546331, 0.7183819, 0, 0.7882353, 1, 1,
0.0508875, -0.7170012, 5.877779, 0, 0.7843137, 1, 1,
0.05472612, -0.7543461, 2.525653, 0, 0.7764706, 1, 1,
0.05509619, 0.7885531, 1.894426, 0, 0.772549, 1, 1,
0.05758031, 0.8038639, 0.1584855, 0, 0.7647059, 1, 1,
0.05809415, -1.413633, 1.438367, 0, 0.7607843, 1, 1,
0.05936842, 1.836094, 0.9549113, 0, 0.7529412, 1, 1,
0.06013035, -1.512841, 4.150172, 0, 0.7490196, 1, 1,
0.06291436, 1.645864, 0.7109947, 0, 0.7411765, 1, 1,
0.0631643, 0.725933, 1.903305, 0, 0.7372549, 1, 1,
0.06515339, -1.461389, 3.148817, 0, 0.7294118, 1, 1,
0.06624024, 0.9625304, -0.622524, 0, 0.7254902, 1, 1,
0.06626937, 1.793777, -0.3043403, 0, 0.7176471, 1, 1,
0.06744555, 0.5919394, 1.694403, 0, 0.7137255, 1, 1,
0.06853216, 0.3457473, 1.881988, 0, 0.7058824, 1, 1,
0.0689013, -2.101989, 3.430383, 0, 0.6980392, 1, 1,
0.07954473, -1.336941, 3.105035, 0, 0.6941177, 1, 1,
0.08519647, -1.791631, 2.96436, 0, 0.6862745, 1, 1,
0.08603203, 0.8143304, 0.3057311, 0, 0.682353, 1, 1,
0.0864635, 0.009723219, 1.323689, 0, 0.6745098, 1, 1,
0.08837194, 0.7819167, -0.1980626, 0, 0.6705883, 1, 1,
0.08837517, -0.03001332, 0.6589445, 0, 0.6627451, 1, 1,
0.09430604, 0.1262663, 2.232149, 0, 0.6588235, 1, 1,
0.1011516, -0.3007395, 3.221993, 0, 0.6509804, 1, 1,
0.1065389, 0.05585024, 2.407494, 0, 0.6470588, 1, 1,
0.1094682, 0.1218327, 0.6627038, 0, 0.6392157, 1, 1,
0.1100344, 0.3925001, -0.5214766, 0, 0.6352941, 1, 1,
0.1102448, -0.9177185, 5.689775, 0, 0.627451, 1, 1,
0.1103871, 0.5453207, 1.097936, 0, 0.6235294, 1, 1,
0.1189461, 1.570627, 0.7512, 0, 0.6156863, 1, 1,
0.1203076, 1.516791, -1.048621, 0, 0.6117647, 1, 1,
0.1314543, -0.6093417, 2.262584, 0, 0.6039216, 1, 1,
0.1339266, 0.3133928, 0.5806623, 0, 0.5960785, 1, 1,
0.1362124, 0.7805783, 0.04971675, 0, 0.5921569, 1, 1,
0.1387938, 0.7221851, 0.3966272, 0, 0.5843138, 1, 1,
0.1416954, -1.639529, 4.836872, 0, 0.5803922, 1, 1,
0.1425257, -0.5859995, 2.017041, 0, 0.572549, 1, 1,
0.1455735, -1.30685, 3.489429, 0, 0.5686275, 1, 1,
0.1482764, 0.383519, 0.3904849, 0, 0.5607843, 1, 1,
0.1492729, -1.337435, 3.203752, 0, 0.5568628, 1, 1,
0.1528104, 0.01515758, 2.06337, 0, 0.5490196, 1, 1,
0.1553845, 1.511888, -0.4613065, 0, 0.5450981, 1, 1,
0.1608339, 1.422353, 1.719043, 0, 0.5372549, 1, 1,
0.1650536, -0.7428574, 0.6659545, 0, 0.5333334, 1, 1,
0.1696261, -2.685113, 4.739329, 0, 0.5254902, 1, 1,
0.1708304, 0.3713089, 3.577261, 0, 0.5215687, 1, 1,
0.1737072, 0.6530014, 0.4376957, 0, 0.5137255, 1, 1,
0.1747406, -0.2903318, 3.686738, 0, 0.509804, 1, 1,
0.1767137, -0.1200384, 2.638242, 0, 0.5019608, 1, 1,
0.1770319, 0.002463368, -0.3194883, 0, 0.4941176, 1, 1,
0.1814062, 2.362409, 0.8054391, 0, 0.4901961, 1, 1,
0.184259, 1.934284, -0.842706, 0, 0.4823529, 1, 1,
0.1855429, -0.295438, 2.675254, 0, 0.4784314, 1, 1,
0.186632, 0.8731089, -0.341342, 0, 0.4705882, 1, 1,
0.1875935, 0.5205547, 1.404549, 0, 0.4666667, 1, 1,
0.1910981, -0.2084006, 2.457545, 0, 0.4588235, 1, 1,
0.1954998, -0.2285785, 1.833129, 0, 0.454902, 1, 1,
0.1974559, -0.2396743, 4.795972, 0, 0.4470588, 1, 1,
0.2002255, -0.6027807, 3.470222, 0, 0.4431373, 1, 1,
0.2079714, -0.6570729, 2.408067, 0, 0.4352941, 1, 1,
0.2100824, 0.5359321, 0.8673645, 0, 0.4313726, 1, 1,
0.2115282, 1.139296, 0.5819724, 0, 0.4235294, 1, 1,
0.2125349, -0.28703, 3.49352, 0, 0.4196078, 1, 1,
0.2129332, 1.246189, 0.5147638, 0, 0.4117647, 1, 1,
0.2130193, 1.352076, -0.01412932, 0, 0.4078431, 1, 1,
0.2170079, -1.101066, 3.075782, 0, 0.4, 1, 1,
0.2203858, 0.7586598, 1.112132, 0, 0.3921569, 1, 1,
0.2226576, 0.5934119, 0.962725, 0, 0.3882353, 1, 1,
0.2228758, -1.064852, 3.012597, 0, 0.3803922, 1, 1,
0.2267163, 0.3169909, -0.6479468, 0, 0.3764706, 1, 1,
0.2272681, 0.3918427, 1.963124, 0, 0.3686275, 1, 1,
0.2308808, -0.4511797, 3.353345, 0, 0.3647059, 1, 1,
0.2314229, -1.847535, -0.0002409587, 0, 0.3568628, 1, 1,
0.2318773, 0.6272473, 0.8104233, 0, 0.3529412, 1, 1,
0.2388881, 2.316988, 1.304767, 0, 0.345098, 1, 1,
0.2425442, -1.999963, 3.479708, 0, 0.3411765, 1, 1,
0.2470568, -0.4760758, 2.733623, 0, 0.3333333, 1, 1,
0.2497804, 0.5203431, 1.634713, 0, 0.3294118, 1, 1,
0.2512379, -1.328544, 3.7212, 0, 0.3215686, 1, 1,
0.2521923, -1.222156, 3.569675, 0, 0.3176471, 1, 1,
0.2533489, 1.94444, -0.05867455, 0, 0.3098039, 1, 1,
0.2534589, 0.2803992, -0.03023612, 0, 0.3058824, 1, 1,
0.2655186, -0.8251573, 1.10061, 0, 0.2980392, 1, 1,
0.2675208, -1.5626, 3.427322, 0, 0.2901961, 1, 1,
0.2727236, 0.8965045, 0.8303224, 0, 0.2862745, 1, 1,
0.2734556, -0.5007772, 1.711989, 0, 0.2784314, 1, 1,
0.2749443, -0.6745244, 2.74945, 0, 0.2745098, 1, 1,
0.2775879, 0.05559843, 1.377321, 0, 0.2666667, 1, 1,
0.2792002, -0.2794515, 2.545416, 0, 0.2627451, 1, 1,
0.2808406, 0.6053892, 0.6523545, 0, 0.254902, 1, 1,
0.2825085, 0.9316058, 1.79576, 0, 0.2509804, 1, 1,
0.2848533, -0.2189256, 4.352363, 0, 0.2431373, 1, 1,
0.2887239, 1.622651, 0.5980033, 0, 0.2392157, 1, 1,
0.2893942, 0.7418526, 0.5258145, 0, 0.2313726, 1, 1,
0.2988884, 2.007286, 0.1051228, 0, 0.227451, 1, 1,
0.2990887, -0.7003224, 2.337637, 0, 0.2196078, 1, 1,
0.3018521, -0.2703358, 3.954592, 0, 0.2156863, 1, 1,
0.3051113, -1.194415, 2.999059, 0, 0.2078431, 1, 1,
0.3083497, -0.7096896, 3.914638, 0, 0.2039216, 1, 1,
0.3109916, -0.5869339, 2.907394, 0, 0.1960784, 1, 1,
0.3113716, 1.896261, -0.1016945, 0, 0.1882353, 1, 1,
0.3119613, 0.004807124, 3.338559, 0, 0.1843137, 1, 1,
0.3140408, -0.6847229, 1.691709, 0, 0.1764706, 1, 1,
0.3172611, -0.5287847, 2.777865, 0, 0.172549, 1, 1,
0.3217842, 0.2316837, 0.5487608, 0, 0.1647059, 1, 1,
0.3232648, -1.802808, 3.822207, 0, 0.1607843, 1, 1,
0.3303895, -0.8489299, 3.34115, 0, 0.1529412, 1, 1,
0.3367181, -0.6272792, 2.156032, 0, 0.1490196, 1, 1,
0.3380613, -0.2490377, 2.129627, 0, 0.1411765, 1, 1,
0.339554, 0.9026088, -1.252687, 0, 0.1372549, 1, 1,
0.3403736, 0.5883564, 1.034969, 0, 0.1294118, 1, 1,
0.3495896, 0.05067867, 1.508935, 0, 0.1254902, 1, 1,
0.3511889, -0.3885073, 1.693049, 0, 0.1176471, 1, 1,
0.3541896, 0.07522271, 0.5595923, 0, 0.1137255, 1, 1,
0.3630285, -0.0838033, -0.4315933, 0, 0.1058824, 1, 1,
0.3655303, 0.7663984, 1.070432, 0, 0.09803922, 1, 1,
0.3730141, -2.109421, 6.477263, 0, 0.09411765, 1, 1,
0.3743688, -2.67911, 5.463421, 0, 0.08627451, 1, 1,
0.3773773, -1.016953, 2.837576, 0, 0.08235294, 1, 1,
0.3782739, -1.140517, 3.069666, 0, 0.07450981, 1, 1,
0.3825479, -0.7448618, 3.237159, 0, 0.07058824, 1, 1,
0.3946027, -0.8259176, 2.6924, 0, 0.0627451, 1, 1,
0.3948566, 1.006427, 2.582515, 0, 0.05882353, 1, 1,
0.3954185, 1.147697, 0.6781514, 0, 0.05098039, 1, 1,
0.3958651, 0.7055134, 0.4647265, 0, 0.04705882, 1, 1,
0.4002312, 0.1977492, 0.8959329, 0, 0.03921569, 1, 1,
0.4026369, -0.8294687, 2.34845, 0, 0.03529412, 1, 1,
0.403588, 0.2381842, 2.288604, 0, 0.02745098, 1, 1,
0.41321, 0.7649701, 1.538532, 0, 0.02352941, 1, 1,
0.4219152, -0.4948255, 0.9770293, 0, 0.01568628, 1, 1,
0.4259667, 0.05465155, 1.695345, 0, 0.01176471, 1, 1,
0.4311627, 0.3521992, 0.03789244, 0, 0.003921569, 1, 1,
0.4320825, 1.449184, -0.3579315, 0.003921569, 0, 1, 1,
0.4359017, -0.9092271, 2.661639, 0.007843138, 0, 1, 1,
0.4375945, -1.16504, 3.994194, 0.01568628, 0, 1, 1,
0.4402179, -0.2097786, 1.230998, 0.01960784, 0, 1, 1,
0.4487485, -1.267227, 4.116894, 0.02745098, 0, 1, 1,
0.4492612, -1.859736, 3.706252, 0.03137255, 0, 1, 1,
0.4531293, -0.2373424, 2.034402, 0.03921569, 0, 1, 1,
0.4533502, -2.107844, 4.176097, 0.04313726, 0, 1, 1,
0.4542486, -0.001195743, 2.629147, 0.05098039, 0, 1, 1,
0.4585788, 0.8672671, -0.5807654, 0.05490196, 0, 1, 1,
0.4586028, -0.5073372, 4.039556, 0.0627451, 0, 1, 1,
0.4610404, 0.9069185, 0.9396146, 0.06666667, 0, 1, 1,
0.4616191, 0.574002, -0.05943904, 0.07450981, 0, 1, 1,
0.4623176, 0.9123506, -1.610454, 0.07843138, 0, 1, 1,
0.4686132, 0.6988571, 0.489592, 0.08627451, 0, 1, 1,
0.4766367, 0.5973499, -0.9357414, 0.09019608, 0, 1, 1,
0.4887512, -0.1723746, 1.59806, 0.09803922, 0, 1, 1,
0.4889484, -0.4485149, 3.901864, 0.1058824, 0, 1, 1,
0.4917663, -1.358484, 3.689971, 0.1098039, 0, 1, 1,
0.495182, -1.46818, 2.844015, 0.1176471, 0, 1, 1,
0.5029237, -2.454756, 2.69048, 0.1215686, 0, 1, 1,
0.5034753, 1.973259, -0.6438729, 0.1294118, 0, 1, 1,
0.505209, 0.5798467, 1.204851, 0.1333333, 0, 1, 1,
0.5067174, 0.02975773, 0.7384034, 0.1411765, 0, 1, 1,
0.5082777, 0.04090726, 1.245265, 0.145098, 0, 1, 1,
0.5090548, -1.368662, 3.030008, 0.1529412, 0, 1, 1,
0.5096659, 1.747898, 0.6889017, 0.1568628, 0, 1, 1,
0.5181727, 0.3630381, 2.003194, 0.1647059, 0, 1, 1,
0.5194376, 0.03704909, 1.486552, 0.1686275, 0, 1, 1,
0.524746, 0.3206977, -0.8611935, 0.1764706, 0, 1, 1,
0.5251827, 1.306878, -0.06135668, 0.1803922, 0, 1, 1,
0.5269077, 1.509195, -0.1291859, 0.1882353, 0, 1, 1,
0.5324401, 0.1058426, 0.04739487, 0.1921569, 0, 1, 1,
0.5356793, -0.6045511, 3.897648, 0.2, 0, 1, 1,
0.5376476, 0.8480629, -1.027942, 0.2078431, 0, 1, 1,
0.5411943, 0.1373243, 2.419246, 0.2117647, 0, 1, 1,
0.5431758, -2.083385, 4.419116, 0.2196078, 0, 1, 1,
0.5475988, -1.406309, 4.473499, 0.2235294, 0, 1, 1,
0.5481268, 0.2337911, 3.158614, 0.2313726, 0, 1, 1,
0.5499827, -1.448674, 2.342664, 0.2352941, 0, 1, 1,
0.5521145, 0.1046523, 0.4320553, 0.2431373, 0, 1, 1,
0.5527226, -0.5861036, 3.198684, 0.2470588, 0, 1, 1,
0.5570287, -0.2223117, 2.953686, 0.254902, 0, 1, 1,
0.5579524, 0.3092002, 3.769452, 0.2588235, 0, 1, 1,
0.5609625, 1.707405, 1.431411, 0.2666667, 0, 1, 1,
0.5641994, -0.3367856, 3.247036, 0.2705882, 0, 1, 1,
0.5675571, 0.586211, 1.187739, 0.2784314, 0, 1, 1,
0.5676576, -1.001182, 3.343545, 0.282353, 0, 1, 1,
0.5700213, 0.9623347, 1.659263, 0.2901961, 0, 1, 1,
0.5728893, -1.407333, 2.692931, 0.2941177, 0, 1, 1,
0.577723, 1.315133, 1.682001, 0.3019608, 0, 1, 1,
0.5850709, -1.113956, 3.802948, 0.3098039, 0, 1, 1,
0.585969, 0.224748, -0.762984, 0.3137255, 0, 1, 1,
0.5873849, 1.70308, -0.4212371, 0.3215686, 0, 1, 1,
0.5889463, -0.7640772, 2.401942, 0.3254902, 0, 1, 1,
0.5894198, 0.4505987, 2.452977, 0.3333333, 0, 1, 1,
0.5899416, -0.5013392, 2.861969, 0.3372549, 0, 1, 1,
0.5920241, 0.2501642, 2.237055, 0.345098, 0, 1, 1,
0.5944544, 0.1241982, 1.485916, 0.3490196, 0, 1, 1,
0.6004045, 1.018324, 0.2760005, 0.3568628, 0, 1, 1,
0.6049351, 0.1799075, 0.9990408, 0.3607843, 0, 1, 1,
0.6074976, 1.730501, 0.8015579, 0.3686275, 0, 1, 1,
0.6083711, 0.9123791, 0.04125155, 0.372549, 0, 1, 1,
0.6121178, -0.06390192, 2.552896, 0.3803922, 0, 1, 1,
0.6125056, -0.1092006, 0.9710929, 0.3843137, 0, 1, 1,
0.6143737, 0.2150362, 1.509036, 0.3921569, 0, 1, 1,
0.6151065, 0.138963, 2.414062, 0.3960784, 0, 1, 1,
0.6183735, 2.892237, -0.4992484, 0.4039216, 0, 1, 1,
0.621453, 1.269063, 2.060595, 0.4117647, 0, 1, 1,
0.6232669, -0.203289, 0.1016037, 0.4156863, 0, 1, 1,
0.624587, 0.1761827, 2.45845, 0.4235294, 0, 1, 1,
0.6286935, 0.366601, 1.381759, 0.427451, 0, 1, 1,
0.6337012, -0.9492878, 3.367979, 0.4352941, 0, 1, 1,
0.6363837, 1.135914, -0.534642, 0.4392157, 0, 1, 1,
0.637863, -1.157653, 2.564602, 0.4470588, 0, 1, 1,
0.6383448, 2.623162, -0.7043716, 0.4509804, 0, 1, 1,
0.6406355, 0.3739207, 1.973411, 0.4588235, 0, 1, 1,
0.6434681, -0.1083091, 2.205994, 0.4627451, 0, 1, 1,
0.6490119, 0.5962927, 1.149692, 0.4705882, 0, 1, 1,
0.6495667, 0.7078567, -0.77242, 0.4745098, 0, 1, 1,
0.6499786, 1.758293, -1.014193, 0.4823529, 0, 1, 1,
0.6637317, 1.079191, -0.785629, 0.4862745, 0, 1, 1,
0.6723779, 1.079693, 1.543233, 0.4941176, 0, 1, 1,
0.6730461, 0.1587781, 1.492342, 0.5019608, 0, 1, 1,
0.6768727, 0.08573214, 1.835265, 0.5058824, 0, 1, 1,
0.67849, 1.644268, 1.006362, 0.5137255, 0, 1, 1,
0.6788921, 1.903554, -1.090565, 0.5176471, 0, 1, 1,
0.678987, -0.6926701, 2.972617, 0.5254902, 0, 1, 1,
0.6791921, -0.117721, 2.035514, 0.5294118, 0, 1, 1,
0.6826549, -0.7440689, 3.614659, 0.5372549, 0, 1, 1,
0.6844176, -0.01335064, 2.408823, 0.5411765, 0, 1, 1,
0.6854887, -0.4030619, 2.74391, 0.5490196, 0, 1, 1,
0.6864399, 0.5643857, 1.602691, 0.5529412, 0, 1, 1,
0.6953151, 0.04582442, 1.894675, 0.5607843, 0, 1, 1,
0.6986137, -0.6635156, 0.993314, 0.5647059, 0, 1, 1,
0.699501, 0.8838266, -1.391684, 0.572549, 0, 1, 1,
0.7011505, 1.111768, 0.2825524, 0.5764706, 0, 1, 1,
0.7017406, 0.6023494, 1.285919, 0.5843138, 0, 1, 1,
0.7076343, -1.499142, 0.7281657, 0.5882353, 0, 1, 1,
0.7089429, 2.476575, 0.4862556, 0.5960785, 0, 1, 1,
0.715558, 0.3840842, 1.034131, 0.6039216, 0, 1, 1,
0.722274, -0.1569462, 2.015954, 0.6078432, 0, 1, 1,
0.7234566, 1.112634, 0.2628641, 0.6156863, 0, 1, 1,
0.7240603, 0.8926029, 0.5892598, 0.6196079, 0, 1, 1,
0.7278566, -0.1933117, 2.152557, 0.627451, 0, 1, 1,
0.7312126, 1.397686, 1.870635, 0.6313726, 0, 1, 1,
0.731757, 0.01450865, 1.295768, 0.6392157, 0, 1, 1,
0.7410212, -2.203309, 3.530597, 0.6431373, 0, 1, 1,
0.7426902, 1.363945, -0.6005995, 0.6509804, 0, 1, 1,
0.7441556, -0.1619478, 1.94727, 0.654902, 0, 1, 1,
0.7470893, 0.007325453, 1.975974, 0.6627451, 0, 1, 1,
0.7480509, -0.2261464, 4.120145, 0.6666667, 0, 1, 1,
0.7487513, -1.024292, 1.63395, 0.6745098, 0, 1, 1,
0.7503093, 0.6422957, 2.821068, 0.6784314, 0, 1, 1,
0.7532594, 0.3937512, 1.75524, 0.6862745, 0, 1, 1,
0.7541658, -1.741915, 1.694458, 0.6901961, 0, 1, 1,
0.7544377, -0.2978964, 1.418271, 0.6980392, 0, 1, 1,
0.7549164, -0.628054, 2.536778, 0.7058824, 0, 1, 1,
0.7623151, -1.232923, 2.95419, 0.7098039, 0, 1, 1,
0.7676582, -1.844653, 3.068004, 0.7176471, 0, 1, 1,
0.7798617, -0.1008292, 2.056212, 0.7215686, 0, 1, 1,
0.7839264, -0.799051, 2.778355, 0.7294118, 0, 1, 1,
0.7877133, -0.184187, 2.306781, 0.7333333, 0, 1, 1,
0.7891662, -0.1271235, 0.608211, 0.7411765, 0, 1, 1,
0.7935368, -0.3301241, 2.015794, 0.7450981, 0, 1, 1,
0.798199, 1.392761, -0.0729778, 0.7529412, 0, 1, 1,
0.7983831, -0.2324921, 0.8495585, 0.7568628, 0, 1, 1,
0.8064677, -0.3338778, 2.741052, 0.7647059, 0, 1, 1,
0.8085157, -0.3078128, 1.6015, 0.7686275, 0, 1, 1,
0.817808, -0.5575224, 1.760124, 0.7764706, 0, 1, 1,
0.8179547, -0.5351313, 2.802271, 0.7803922, 0, 1, 1,
0.8204058, -1.168965, 1.300606, 0.7882353, 0, 1, 1,
0.8248158, -1.139596, 2.98139, 0.7921569, 0, 1, 1,
0.8283455, -1.413813, 3.541621, 0.8, 0, 1, 1,
0.8334761, 0.3956124, -0.2234685, 0.8078431, 0, 1, 1,
0.8375536, -1.576426, 2.383965, 0.8117647, 0, 1, 1,
0.838291, -0.1584029, 1.874177, 0.8196079, 0, 1, 1,
0.8394296, -0.3654262, 3.253415, 0.8235294, 0, 1, 1,
0.8422142, 0.6211805, -0.5040698, 0.8313726, 0, 1, 1,
0.8432494, 0.0490702, 0.9206939, 0.8352941, 0, 1, 1,
0.8436052, 0.5407213, 0.9755128, 0.8431373, 0, 1, 1,
0.8592206, 0.5166664, 0.2854444, 0.8470588, 0, 1, 1,
0.8596568, -0.2916173, 1.960383, 0.854902, 0, 1, 1,
0.8631865, 0.521253, 1.523404, 0.8588235, 0, 1, 1,
0.8646188, -1.571756, 3.416952, 0.8666667, 0, 1, 1,
0.8656866, 0.460769, 0.3310379, 0.8705882, 0, 1, 1,
0.8721802, -0.1183443, 1.748101, 0.8784314, 0, 1, 1,
0.8768539, -1.111416, 2.080779, 0.8823529, 0, 1, 1,
0.8780332, -0.4741963, 1.490572, 0.8901961, 0, 1, 1,
0.8798966, 1.024259, 0.7387477, 0.8941177, 0, 1, 1,
0.8818329, -0.04161987, 1.255158, 0.9019608, 0, 1, 1,
0.8841186, 0.08816066, 1.533518, 0.9098039, 0, 1, 1,
0.888047, 1.480474, 0.6703949, 0.9137255, 0, 1, 1,
0.8909625, -1.711848, 3.708291, 0.9215686, 0, 1, 1,
0.8916791, 1.140862, 0.1524702, 0.9254902, 0, 1, 1,
0.8951998, 0.7065439, 0.5251192, 0.9333333, 0, 1, 1,
0.9006449, 0.414364, 0.9930106, 0.9372549, 0, 1, 1,
0.9033176, 1.037732, -0.2963806, 0.945098, 0, 1, 1,
0.9045474, 0.817279, 0.272978, 0.9490196, 0, 1, 1,
0.9150915, -0.5017725, 1.455519, 0.9568627, 0, 1, 1,
0.916482, 0.9563534, 1.4149, 0.9607843, 0, 1, 1,
0.9213766, -0.1990175, 1.841497, 0.9686275, 0, 1, 1,
0.926428, 0.9625293, -0.5814055, 0.972549, 0, 1, 1,
0.9359208, 1.81293, 1.33511, 0.9803922, 0, 1, 1,
0.9374923, 0.5970623, 0.5699426, 0.9843137, 0, 1, 1,
0.9393858, 0.629278, 1.234487, 0.9921569, 0, 1, 1,
0.942143, 0.7729617, 2.060269, 0.9960784, 0, 1, 1,
0.944183, -1.021716, 2.912118, 1, 0, 0.9960784, 1,
0.9491382, -0.4397719, 1.480539, 1, 0, 0.9882353, 1,
0.9528652, 0.03526459, 1.674662, 1, 0, 0.9843137, 1,
0.9564977, -0.8603238, 2.016402, 1, 0, 0.9764706, 1,
0.957332, 0.5980529, 2.496379, 1, 0, 0.972549, 1,
0.9588009, -0.04231586, 2.435382, 1, 0, 0.9647059, 1,
0.9600506, 0.359905, 1.17038, 1, 0, 0.9607843, 1,
0.9635271, 1.082024, 0.05906228, 1, 0, 0.9529412, 1,
0.964702, -0.3771833, 2.541882, 1, 0, 0.9490196, 1,
0.9665803, 0.6257168, -0.03618208, 1, 0, 0.9411765, 1,
0.9807567, -0.185681, 0.9030101, 1, 0, 0.9372549, 1,
0.9822194, -0.4298182, 4.061465, 1, 0, 0.9294118, 1,
0.986192, -0.7427483, 0.9705651, 1, 0, 0.9254902, 1,
0.9863425, -0.8353451, 1.315623, 1, 0, 0.9176471, 1,
0.9867378, 1.298053, -0.2163934, 1, 0, 0.9137255, 1,
0.9899666, -0.2820111, 1.749767, 1, 0, 0.9058824, 1,
0.9950877, 0.2796158, 1.660709, 1, 0, 0.9019608, 1,
0.9977612, -0.7754484, 1.327234, 1, 0, 0.8941177, 1,
1.000578, 1.087322, -1.304209, 1, 0, 0.8862745, 1,
1.009662, -0.7577202, 1.13297, 1, 0, 0.8823529, 1,
1.010072, -0.3482679, 0.1593038, 1, 0, 0.8745098, 1,
1.011828, -0.9282517, 1.366456, 1, 0, 0.8705882, 1,
1.013093, -0.1273781, 1.197698, 1, 0, 0.8627451, 1,
1.019737, 0.3046173, 2.327168, 1, 0, 0.8588235, 1,
1.024764, 0.8635186, 2.047598, 1, 0, 0.8509804, 1,
1.030342, -1.205996, 1.570306, 1, 0, 0.8470588, 1,
1.03914, 0.3016692, 0.8043456, 1, 0, 0.8392157, 1,
1.042284, 0.5794306, 1.572785, 1, 0, 0.8352941, 1,
1.043448, 0.003453099, 2.058747, 1, 0, 0.827451, 1,
1.043479, 0.6813641, 1.35536, 1, 0, 0.8235294, 1,
1.047078, 0.7538264, 2.847814, 1, 0, 0.8156863, 1,
1.052544, 0.7756109, 0.5511659, 1, 0, 0.8117647, 1,
1.052744, 0.6019377, 2.804292, 1, 0, 0.8039216, 1,
1.062588, 0.1962739, 1.119823, 1, 0, 0.7960784, 1,
1.066404, -0.7881042, 2.38666, 1, 0, 0.7921569, 1,
1.069845, -0.3732683, 2.804193, 1, 0, 0.7843137, 1,
1.070971, 0.09046099, 3.394905, 1, 0, 0.7803922, 1,
1.074807, 0.3089754, -0.224966, 1, 0, 0.772549, 1,
1.080991, -0.4321813, 3.118492, 1, 0, 0.7686275, 1,
1.082994, 0.5702704, 1.675157, 1, 0, 0.7607843, 1,
1.08762, -1.162427, 3.110017, 1, 0, 0.7568628, 1,
1.105056, -1.100659, 2.390869, 1, 0, 0.7490196, 1,
1.122384, 0.8119245, 2.633203, 1, 0, 0.7450981, 1,
1.126247, -0.9502623, 3.666307, 1, 0, 0.7372549, 1,
1.128738, 0.7637787, 1.47939, 1, 0, 0.7333333, 1,
1.142908, 0.1381837, 1.204767, 1, 0, 0.7254902, 1,
1.150373, 0.3722938, 1.750356, 1, 0, 0.7215686, 1,
1.164637, 0.361004, 2.1328, 1, 0, 0.7137255, 1,
1.176841, 0.05635052, 1.930338, 1, 0, 0.7098039, 1,
1.17932, 1.027717, 1.342581, 1, 0, 0.7019608, 1,
1.183234, -0.8120551, 1.939454, 1, 0, 0.6941177, 1,
1.199925, 1.058329, -0.3539625, 1, 0, 0.6901961, 1,
1.202263, 0.6708927, 1.642178, 1, 0, 0.682353, 1,
1.204314, -1.487923, 1.608502, 1, 0, 0.6784314, 1,
1.204602, 0.1046002, 2.516868, 1, 0, 0.6705883, 1,
1.205016, 1.441501, 1.56631, 1, 0, 0.6666667, 1,
1.212854, -0.9921498, 2.108743, 1, 0, 0.6588235, 1,
1.218429, -0.09727828, 2.377738, 1, 0, 0.654902, 1,
1.219171, -0.2783926, 0.37937, 1, 0, 0.6470588, 1,
1.225974, -0.4998904, 1.716315, 1, 0, 0.6431373, 1,
1.232289, -0.8582318, 1.857896, 1, 0, 0.6352941, 1,
1.245229, 0.2040458, 0.4765562, 1, 0, 0.6313726, 1,
1.255034, 0.2615723, 1.014782, 1, 0, 0.6235294, 1,
1.264765, -1.762218, 3.266351, 1, 0, 0.6196079, 1,
1.266506, 1.019462, 1.249614, 1, 0, 0.6117647, 1,
1.266577, -0.05735908, 1.177468, 1, 0, 0.6078432, 1,
1.272879, -0.6360676, 1.434323, 1, 0, 0.6, 1,
1.289111, 0.9638075, 0.6021572, 1, 0, 0.5921569, 1,
1.291144, -0.8223525, 3.173884, 1, 0, 0.5882353, 1,
1.304001, 0.7149748, 0.4814103, 1, 0, 0.5803922, 1,
1.311621, -0.5498841, 2.514989, 1, 0, 0.5764706, 1,
1.31567, -1.580086, 3.731488, 1, 0, 0.5686275, 1,
1.323853, 1.290654, 0.491089, 1, 0, 0.5647059, 1,
1.324759, 0.7375393, 0.3701585, 1, 0, 0.5568628, 1,
1.333521, -0.522808, 0.7990166, 1, 0, 0.5529412, 1,
1.337029, -0.08191673, 0.992232, 1, 0, 0.5450981, 1,
1.347122, -1.104302, 3.23377, 1, 0, 0.5411765, 1,
1.362873, -2.306571, 5.181097, 1, 0, 0.5333334, 1,
1.363246, -0.7429799, 1.744332, 1, 0, 0.5294118, 1,
1.367585, -0.7419293, 1.789879, 1, 0, 0.5215687, 1,
1.391055, 0.4783314, 1.753547, 1, 0, 0.5176471, 1,
1.391647, -0.5602767, 3.49353, 1, 0, 0.509804, 1,
1.392389, 0.6910503, -0.003530176, 1, 0, 0.5058824, 1,
1.393069, -0.9547111, 1.127448, 1, 0, 0.4980392, 1,
1.400908, -0.916592, 1.987761, 1, 0, 0.4901961, 1,
1.415399, -1.36897, 2.263155, 1, 0, 0.4862745, 1,
1.427697, 0.1782306, 0.8734035, 1, 0, 0.4784314, 1,
1.438458, -0.1969155, 2.459391, 1, 0, 0.4745098, 1,
1.443274, -0.6063741, 2.231518, 1, 0, 0.4666667, 1,
1.447457, -0.03160873, 0.176401, 1, 0, 0.4627451, 1,
1.453472, -0.0259486, 0.9591332, 1, 0, 0.454902, 1,
1.461329, -0.07647783, 2.508664, 1, 0, 0.4509804, 1,
1.46663, -0.5239928, 2.791211, 1, 0, 0.4431373, 1,
1.468014, 0.6907529, 0.1263943, 1, 0, 0.4392157, 1,
1.481618, 3.183486, 1.039949, 1, 0, 0.4313726, 1,
1.487152, 0.6312957, 2.002127, 1, 0, 0.427451, 1,
1.487365, 0.3110805, 2.368594, 1, 0, 0.4196078, 1,
1.488169, 1.772256, 1.172977, 1, 0, 0.4156863, 1,
1.491242, 0.5250748, 1.09303, 1, 0, 0.4078431, 1,
1.503424, 0.5933475, -0.3297368, 1, 0, 0.4039216, 1,
1.50622, -0.3415706, 1.702397, 1, 0, 0.3960784, 1,
1.512039, 1.650983, 0.9119256, 1, 0, 0.3882353, 1,
1.516528, -1.268481, 4.035441, 1, 0, 0.3843137, 1,
1.523242, -0.5472418, 1.111553, 1, 0, 0.3764706, 1,
1.525794, -0.3402277, 2.898699, 1, 0, 0.372549, 1,
1.526176, 1.740282, 1.720744, 1, 0, 0.3647059, 1,
1.534836, -1.660141, 2.424628, 1, 0, 0.3607843, 1,
1.535399, -1.252713, 1.635452, 1, 0, 0.3529412, 1,
1.537862, 1.733484, -0.3585447, 1, 0, 0.3490196, 1,
1.543639, -0.4312875, 2.727599, 1, 0, 0.3411765, 1,
1.556065, -1.514003, 2.712778, 1, 0, 0.3372549, 1,
1.556432, -2.066513, 4.119917, 1, 0, 0.3294118, 1,
1.582666, 0.9785901, 1.272004, 1, 0, 0.3254902, 1,
1.584661, 0.6573501, 2.249846, 1, 0, 0.3176471, 1,
1.585642, 2.251745, -0.55867, 1, 0, 0.3137255, 1,
1.606249, 1.690316, 1.493176, 1, 0, 0.3058824, 1,
1.631621, -1.723862, 1.598177, 1, 0, 0.2980392, 1,
1.638861, -0.7549989, 1.975433, 1, 0, 0.2941177, 1,
1.639354, 0.487966, 1.582597, 1, 0, 0.2862745, 1,
1.640421, -0.4026497, 1.81117, 1, 0, 0.282353, 1,
1.642293, -2.127029, 0.9171385, 1, 0, 0.2745098, 1,
1.667117, 0.140294, 0.5808619, 1, 0, 0.2705882, 1,
1.674162, -0.4070882, 1.92129, 1, 0, 0.2627451, 1,
1.675319, -0.2938434, 2.005166, 1, 0, 0.2588235, 1,
1.693489, -0.677262, 0.5569223, 1, 0, 0.2509804, 1,
1.738505, 0.4237676, 3.293136, 1, 0, 0.2470588, 1,
1.742514, 0.0475074, 2.450769, 1, 0, 0.2392157, 1,
1.744286, 1.776226, -0.1453695, 1, 0, 0.2352941, 1,
1.748307, -0.1894015, 2.891337, 1, 0, 0.227451, 1,
1.77201, -0.2008974, 3.054374, 1, 0, 0.2235294, 1,
1.793196, -0.009291471, 1.400527, 1, 0, 0.2156863, 1,
1.812128, 0.9323586, 1.961506, 1, 0, 0.2117647, 1,
1.835977, -1.932636, 2.181862, 1, 0, 0.2039216, 1,
1.843025, 0.4160481, 2.426197, 1, 0, 0.1960784, 1,
1.894529, 1.108425, 0.0970017, 1, 0, 0.1921569, 1,
1.90582, -1.899606, 2.903845, 1, 0, 0.1843137, 1,
1.915258, -0.3407241, 3.366713, 1, 0, 0.1803922, 1,
1.94074, -1.676606, 2.188241, 1, 0, 0.172549, 1,
1.947074, 0.4874389, 1.887342, 1, 0, 0.1686275, 1,
1.992264, 1.183683, 1.539222, 1, 0, 0.1607843, 1,
1.994752, 0.6468745, 1.006953, 1, 0, 0.1568628, 1,
2.000023, -2.164553, 1.458673, 1, 0, 0.1490196, 1,
2.01204, -0.737547, -0.6594091, 1, 0, 0.145098, 1,
2.044264, 1.672875, 0.4388971, 1, 0, 0.1372549, 1,
2.048019, 0.1350722, 1.284174, 1, 0, 0.1333333, 1,
2.065609, -1.01189, 0.7457234, 1, 0, 0.1254902, 1,
2.11102, -0.9989281, 3.922103, 1, 0, 0.1215686, 1,
2.112245, 0.9130612, 0.1607334, 1, 0, 0.1137255, 1,
2.126315, -0.1069265, 3.643878, 1, 0, 0.1098039, 1,
2.129017, 0.7905478, 2.500719, 1, 0, 0.1019608, 1,
2.160815, -0.6774789, 2.729464, 1, 0, 0.09411765, 1,
2.182324, -0.8395559, 0.4114378, 1, 0, 0.09019608, 1,
2.248158, 1.337705, 1.630003, 1, 0, 0.08235294, 1,
2.260269, -0.6209734, 1.549247, 1, 0, 0.07843138, 1,
2.313171, -1.677747, 0.8000495, 1, 0, 0.07058824, 1,
2.316062, 0.4786001, 1.870054, 1, 0, 0.06666667, 1,
2.356434, -1.279543, 2.111844, 1, 0, 0.05882353, 1,
2.357754, -0.4236189, 2.696365, 1, 0, 0.05490196, 1,
2.363483, 1.001168, 0.455438, 1, 0, 0.04705882, 1,
2.389375, -0.3442252, 2.248813, 1, 0, 0.04313726, 1,
2.466237, 1.304999, 0.01883463, 1, 0, 0.03529412, 1,
2.719199, -1.130776, 2.406063, 1, 0, 0.03137255, 1,
2.755941, -0.1046339, 2.362318, 1, 0, 0.02352941, 1,
2.970382, 1.813769, 0.2702599, 1, 0, 0.01960784, 1,
3.079961, 0.7848384, 1.720122, 1, 0, 0.01176471, 1,
3.191828, 0.7306095, 2.314032, 1, 0, 0.007843138, 1
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
-0.1751415, -3.679841, -7.711923, 0, -0.5, 0.5, 0.5,
-0.1751415, -3.679841, -7.711923, 1, -0.5, 0.5, 0.5,
-0.1751415, -3.679841, -7.711923, 1, 1.5, 0.5, 0.5,
-0.1751415, -3.679841, -7.711923, 0, 1.5, 0.5, 0.5
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
-4.683514, 0.2491865, -7.711923, 0, -0.5, 0.5, 0.5,
-4.683514, 0.2491865, -7.711923, 1, -0.5, 0.5, 0.5,
-4.683514, 0.2491865, -7.711923, 1, 1.5, 0.5, 0.5,
-4.683514, 0.2491865, -7.711923, 0, 1.5, 0.5, 0.5
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
-4.683514, -3.679841, 0.4109163, 0, -0.5, 0.5, 0.5,
-4.683514, -3.679841, 0.4109163, 1, -0.5, 0.5, 0.5,
-4.683514, -3.679841, 0.4109163, 1, 1.5, 0.5, 0.5,
-4.683514, -3.679841, 0.4109163, 0, 1.5, 0.5, 0.5
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
-3, -2.773142, -5.837421,
3, -2.773142, -5.837421,
-3, -2.773142, -5.837421,
-3, -2.924258, -6.149838,
-2, -2.773142, -5.837421,
-2, -2.924258, -6.149838,
-1, -2.773142, -5.837421,
-1, -2.924258, -6.149838,
0, -2.773142, -5.837421,
0, -2.924258, -6.149838,
1, -2.773142, -5.837421,
1, -2.924258, -6.149838,
2, -2.773142, -5.837421,
2, -2.924258, -6.149838,
3, -2.773142, -5.837421,
3, -2.924258, -6.149838
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
"2",
"3"
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
-3, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
-3, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
-3, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
-3, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
-2, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
-2, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
-2, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
-2, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
-1, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
-1, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
-1, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
-1, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
0, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
0, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
0, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
0, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
1, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
1, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
1, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
1, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
2, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
2, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
2, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
2, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5,
3, -3.226491, -6.774672, 0, -0.5, 0.5, 0.5,
3, -3.226491, -6.774672, 1, -0.5, 0.5, 0.5,
3, -3.226491, -6.774672, 1, 1.5, 0.5, 0.5,
3, -3.226491, -6.774672, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.643121, -2, -5.837421,
-3.643121, 3, -5.837421,
-3.643121, -2, -5.837421,
-3.816519, -2, -6.149838,
-3.643121, -1, -5.837421,
-3.816519, -1, -6.149838,
-3.643121, 0, -5.837421,
-3.816519, 0, -6.149838,
-3.643121, 1, -5.837421,
-3.816519, 1, -6.149838,
-3.643121, 2, -5.837421,
-3.816519, 2, -6.149838,
-3.643121, 3, -5.837421,
-3.816519, 3, -6.149838
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
-4.163317, -2, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, -2, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, -2, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, -2, -6.774672, 0, 1.5, 0.5, 0.5,
-4.163317, -1, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, -1, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, -1, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, -1, -6.774672, 0, 1.5, 0.5, 0.5,
-4.163317, 0, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, 0, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, 0, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, 0, -6.774672, 0, 1.5, 0.5, 0.5,
-4.163317, 1, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, 1, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, 1, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, 1, -6.774672, 0, 1.5, 0.5, 0.5,
-4.163317, 2, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, 2, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, 2, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, 2, -6.774672, 0, 1.5, 0.5, 0.5,
-4.163317, 3, -6.774672, 0, -0.5, 0.5, 0.5,
-4.163317, 3, -6.774672, 1, -0.5, 0.5, 0.5,
-4.163317, 3, -6.774672, 1, 1.5, 0.5, 0.5,
-4.163317, 3, -6.774672, 0, 1.5, 0.5, 0.5
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
-3.643121, -2.773142, -4,
-3.643121, -2.773142, 6,
-3.643121, -2.773142, -4,
-3.816519, -2.924258, -4,
-3.643121, -2.773142, -2,
-3.816519, -2.924258, -2,
-3.643121, -2.773142, 0,
-3.816519, -2.924258, 0,
-3.643121, -2.773142, 2,
-3.816519, -2.924258, 2,
-3.643121, -2.773142, 4,
-3.816519, -2.924258, 4,
-3.643121, -2.773142, 6,
-3.816519, -2.924258, 6
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
"4",
"6"
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
-4.163317, -3.226491, -4, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, -4, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, -4, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, -4, 0, 1.5, 0.5, 0.5,
-4.163317, -3.226491, -2, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, -2, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, -2, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, -2, 0, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 0, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 0, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 0, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 0, 0, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 2, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 2, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 2, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 2, 0, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 4, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 4, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 4, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 4, 0, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 6, 0, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 6, 1, -0.5, 0.5, 0.5,
-4.163317, -3.226491, 6, 1, 1.5, 0.5, 0.5,
-4.163317, -3.226491, 6, 0, 1.5, 0.5, 0.5
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
-3.643121, -2.773142, -5.837421,
-3.643121, 3.271515, -5.837421,
-3.643121, -2.773142, 6.659254,
-3.643121, 3.271515, 6.659254,
-3.643121, -2.773142, -5.837421,
-3.643121, -2.773142, 6.659254,
-3.643121, 3.271515, -5.837421,
-3.643121, 3.271515, 6.659254,
-3.643121, -2.773142, -5.837421,
3.292838, -2.773142, -5.837421,
-3.643121, -2.773142, 6.659254,
3.292838, -2.773142, 6.659254,
-3.643121, 3.271515, -5.837421,
3.292838, 3.271515, -5.837421,
-3.643121, 3.271515, 6.659254,
3.292838, 3.271515, 6.659254,
3.292838, -2.773142, -5.837421,
3.292838, 3.271515, -5.837421,
3.292838, -2.773142, 6.659254,
3.292838, 3.271515, 6.659254,
3.292838, -2.773142, -5.837421,
3.292838, -2.773142, 6.659254,
3.292838, 3.271515, -5.837421,
3.292838, 3.271515, 6.659254
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
var radius = 8.286379;
var distance = 36.86703;
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
mvMatrix.translate( 0.1751415, -0.2491865, -0.4109163 );
mvMatrix.scale( 1.291731, 1.482201, 0.7169423 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.86703);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitrofen<-read.table("Nitrofen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nitrofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
```

```r
y<-Nitrofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
```

```r
z<-Nitrofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitrofen' not found
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
-3.542111, 0.2520453, -2.280039, 0, 0, 1, 1, 1,
-2.801342, 0.5587488, -1.807938, 1, 0, 0, 1, 1,
-2.753646, 0.7638416, -1.818189, 1, 0, 0, 1, 1,
-2.587784, -0.624923, -2.516686, 1, 0, 0, 1, 1,
-2.561034, 1.26095, -0.8980541, 1, 0, 0, 1, 1,
-2.431786, -0.9334857, -3.089843, 1, 0, 0, 1, 1,
-2.408544, -0.1270495, -1.263672, 0, 0, 0, 1, 1,
-2.397623, -0.5092322, -1.897799, 0, 0, 0, 1, 1,
-2.369264, -0.8933036, -1.375944, 0, 0, 0, 1, 1,
-2.3307, 0.6776888, -0.06184563, 0, 0, 0, 1, 1,
-2.309836, 1.774357, -1.119215, 0, 0, 0, 1, 1,
-2.302573, -1.06126, 0.2869229, 0, 0, 0, 1, 1,
-2.235648, -0.1915019, -2.364485, 0, 0, 0, 1, 1,
-2.223763, -1.011142, -1.087729, 1, 1, 1, 1, 1,
-2.219723, -1.200988, -2.259504, 1, 1, 1, 1, 1,
-2.140805, -0.6265526, -1.330965, 1, 1, 1, 1, 1,
-2.130505, -0.07050391, -1.498405, 1, 1, 1, 1, 1,
-2.129352, 1.057187, -1.260865, 1, 1, 1, 1, 1,
-2.126921, -2.575356, -1.435114, 1, 1, 1, 1, 1,
-2.052099, 1.327937, -1.312533, 1, 1, 1, 1, 1,
-2.041775, -0.2917375, -1.563667, 1, 1, 1, 1, 1,
-2.030547, 0.6643363, -1.328523, 1, 1, 1, 1, 1,
-2.02208, 1.660852, -1.716776, 1, 1, 1, 1, 1,
-1.966746, 2.155516, -1.415434, 1, 1, 1, 1, 1,
-1.944657, -0.9428059, -2.326629, 1, 1, 1, 1, 1,
-1.937886, -0.05565464, -1.437875, 1, 1, 1, 1, 1,
-1.936042, -1.633756, -2.365915, 1, 1, 1, 1, 1,
-1.922188, 0.2650387, -0.6136226, 1, 1, 1, 1, 1,
-1.881499, -0.8515287, -2.14759, 0, 0, 1, 1, 1,
-1.871628, 1.350349, -1.426111, 1, 0, 0, 1, 1,
-1.870892, 1.33693, -0.1850837, 1, 0, 0, 1, 1,
-1.87006, -0.7485967, -1.927922, 1, 0, 0, 1, 1,
-1.851503, 0.1700909, -1.688167, 1, 0, 0, 1, 1,
-1.836515, -1.106741, -0.5701174, 1, 0, 0, 1, 1,
-1.790168, -0.4854604, -1.261865, 0, 0, 0, 1, 1,
-1.780791, -0.4666578, -1.721766, 0, 0, 0, 1, 1,
-1.768593, 0.7412773, -0.5819647, 0, 0, 0, 1, 1,
-1.753248, 0.7621047, -0.07095003, 0, 0, 0, 1, 1,
-1.751008, 0.195544, -1.547727, 0, 0, 0, 1, 1,
-1.73156, -0.3968917, -0.5785247, 0, 0, 0, 1, 1,
-1.723296, 1.690999, -0.03899937, 0, 0, 0, 1, 1,
-1.718086, 1.039212, -1.03985, 1, 1, 1, 1, 1,
-1.710166, 0.9182168, 0.2063518, 1, 1, 1, 1, 1,
-1.702925, 0.8831378, -0.6245803, 1, 1, 1, 1, 1,
-1.69953, 0.7052156, 0.09244472, 1, 1, 1, 1, 1,
-1.693407, 0.6566842, -0.9384624, 1, 1, 1, 1, 1,
-1.685401, 1.244883, -1.357729, 1, 1, 1, 1, 1,
-1.6738, -0.1435986, -0.7749359, 1, 1, 1, 1, 1,
-1.668355, -0.1142399, -1.58336, 1, 1, 1, 1, 1,
-1.653252, -0.9466253, -1.737258, 1, 1, 1, 1, 1,
-1.616428, 1.608267, -0.5053143, 1, 1, 1, 1, 1,
-1.611784, -0.1053224, -2.196141, 1, 1, 1, 1, 1,
-1.607588, -0.3843164, -1.550724, 1, 1, 1, 1, 1,
-1.60501, -0.8922098, -3.503426, 1, 1, 1, 1, 1,
-1.602925, -0.7884065, -1.142993, 1, 1, 1, 1, 1,
-1.578692, 0.2292258, -3.655404, 1, 1, 1, 1, 1,
-1.568523, 0.3017825, -0.01096753, 0, 0, 1, 1, 1,
-1.555797, -0.1955286, -1.077956, 1, 0, 0, 1, 1,
-1.552657, 1.095274, 0.5508738, 1, 0, 0, 1, 1,
-1.547764, -0.3850259, -1.98139, 1, 0, 0, 1, 1,
-1.54567, 0.1468315, -2.057597, 1, 0, 0, 1, 1,
-1.526626, -0.08858703, -1.70871, 1, 0, 0, 1, 1,
-1.518045, 0.7299173, -0.441031, 0, 0, 0, 1, 1,
-1.513043, -0.6344157, -0.7788325, 0, 0, 0, 1, 1,
-1.511172, 0.5188432, -2.045369, 0, 0, 0, 1, 1,
-1.505385, 2.284882, 0.5431162, 0, 0, 0, 1, 1,
-1.504835, -0.4842865, -0.7521976, 0, 0, 0, 1, 1,
-1.487921, -0.2358081, -3.372546, 0, 0, 0, 1, 1,
-1.486458, 0.1928501, -2.584189, 0, 0, 0, 1, 1,
-1.48126, 0.3306242, -0.4068809, 1, 1, 1, 1, 1,
-1.477105, -1.301032, -1.954578, 1, 1, 1, 1, 1,
-1.476089, 0.9850841, -1.088984, 1, 1, 1, 1, 1,
-1.473176, -1.787537, -3.920613, 1, 1, 1, 1, 1,
-1.460886, -0.278375, -1.722127, 1, 1, 1, 1, 1,
-1.438888, -0.1676218, -2.935985, 1, 1, 1, 1, 1,
-1.437505, -0.09311286, -2.033718, 1, 1, 1, 1, 1,
-1.437148, -1.260583, -1.68176, 1, 1, 1, 1, 1,
-1.433004, -1.004874, -0.1984904, 1, 1, 1, 1, 1,
-1.420436, -2.08981, -1.264034, 1, 1, 1, 1, 1,
-1.407716, -0.5898591, -1.715624, 1, 1, 1, 1, 1,
-1.401911, -0.6727021, -3.348292, 1, 1, 1, 1, 1,
-1.398373, -1.692026, -2.995422, 1, 1, 1, 1, 1,
-1.396206, 0.1021662, -2.752942, 1, 1, 1, 1, 1,
-1.391778, -0.4760158, -1.547377, 1, 1, 1, 1, 1,
-1.391031, -2.152039, -3.429945, 0, 0, 1, 1, 1,
-1.381084, 0.5249009, -1.314883, 1, 0, 0, 1, 1,
-1.377243, -0.3823016, -1.3759, 1, 0, 0, 1, 1,
-1.348526, 1.539666, -0.9388433, 1, 0, 0, 1, 1,
-1.342402, 0.6327955, -1.604599, 1, 0, 0, 1, 1,
-1.337655, -0.8167884, -3.251316, 1, 0, 0, 1, 1,
-1.335182, 0.5475457, -1.544369, 0, 0, 0, 1, 1,
-1.317502, -0.3935994, -2.233383, 0, 0, 0, 1, 1,
-1.306325, 0.1530771, -0.4270155, 0, 0, 0, 1, 1,
-1.302698, -0.9708587, -2.197041, 0, 0, 0, 1, 1,
-1.285843, -1.015599, -2.05327, 0, 0, 0, 1, 1,
-1.284207, -0.6268385, -1.799799, 0, 0, 0, 1, 1,
-1.271105, -1.646127, -3.679148, 0, 0, 0, 1, 1,
-1.268806, 1.595194, -0.6584284, 1, 1, 1, 1, 1,
-1.262773, 1.077829, -2.579643, 1, 1, 1, 1, 1,
-1.260527, -0.1010516, -2.202351, 1, 1, 1, 1, 1,
-1.256679, -0.5467769, -3.313787, 1, 1, 1, 1, 1,
-1.24285, -0.1185277, -2.213224, 1, 1, 1, 1, 1,
-1.231226, -0.1865485, -1.451497, 1, 1, 1, 1, 1,
-1.227366, 0.2080779, -2.012879, 1, 1, 1, 1, 1,
-1.22552, 1.058939, 0.5876773, 1, 1, 1, 1, 1,
-1.224801, 0.7144787, -0.7440567, 1, 1, 1, 1, 1,
-1.215541, 0.1180836, 0.1093595, 1, 1, 1, 1, 1,
-1.213324, -0.4210809, -2.699201, 1, 1, 1, 1, 1,
-1.20321, 0.4720128, 0.04717875, 1, 1, 1, 1, 1,
-1.195031, -1.700992, -2.267915, 1, 1, 1, 1, 1,
-1.19003, 1.454093, -0.4510955, 1, 1, 1, 1, 1,
-1.180769, -0.4619783, -1.555853, 1, 1, 1, 1, 1,
-1.177795, -0.01963782, -1.833013, 0, 0, 1, 1, 1,
-1.176687, 1.071434, -0.6532592, 1, 0, 0, 1, 1,
-1.171773, 0.6343458, -1.923435, 1, 0, 0, 1, 1,
-1.170498, -0.5552432, -3.10533, 1, 0, 0, 1, 1,
-1.166346, 0.7096969, -0.07697403, 1, 0, 0, 1, 1,
-1.166186, -1.546531, -3.591255, 1, 0, 0, 1, 1,
-1.161138, -0.4300722, -2.246724, 0, 0, 0, 1, 1,
-1.157731, -1.25616, -2.974391, 0, 0, 0, 1, 1,
-1.150982, 0.8398513, -1.230438, 0, 0, 0, 1, 1,
-1.147757, -0.07384571, -0.8765313, 0, 0, 0, 1, 1,
-1.143457, -0.320237, -2.038761, 0, 0, 0, 1, 1,
-1.142558, -0.272328, -1.579843, 0, 0, 0, 1, 1,
-1.137775, 1.489148, -2.121509, 0, 0, 0, 1, 1,
-1.136264, -0.8937241, -1.243986, 1, 1, 1, 1, 1,
-1.134202, -1.191859, -2.541637, 1, 1, 1, 1, 1,
-1.129161, 0.2668331, -0.436769, 1, 1, 1, 1, 1,
-1.128222, 1.420126, 0.00798456, 1, 1, 1, 1, 1,
-1.127505, 1.180963, -1.083801, 1, 1, 1, 1, 1,
-1.125373, -1.347955, -2.410061, 1, 1, 1, 1, 1,
-1.11187, 0.1747167, -1.197126, 1, 1, 1, 1, 1,
-1.109724, -1.549836, -2.750432, 1, 1, 1, 1, 1,
-1.09604, 2.792746, -0.5464748, 1, 1, 1, 1, 1,
-1.093126, -1.362316, -2.668213, 1, 1, 1, 1, 1,
-1.092403, -0.1377099, -1.277977, 1, 1, 1, 1, 1,
-1.082649, -1.100459, -2.487076, 1, 1, 1, 1, 1,
-1.080158, 0.5760221, -1.280526, 1, 1, 1, 1, 1,
-1.072272, 0.631489, -0.9062909, 1, 1, 1, 1, 1,
-1.069334, -1.118173, -2.819046, 1, 1, 1, 1, 1,
-1.066459, -0.696612, -3.485358, 0, 0, 1, 1, 1,
-1.063938, 0.5429444, -2.830281, 1, 0, 0, 1, 1,
-1.062478, -1.005299, -2.384767, 1, 0, 0, 1, 1,
-1.059475, -1.192247, -2.829348, 1, 0, 0, 1, 1,
-1.051285, 0.9626809, -0.4945369, 1, 0, 0, 1, 1,
-1.033909, -0.6509376, -1.447093, 1, 0, 0, 1, 1,
-1.031973, 0.1570269, -1.355005, 0, 0, 0, 1, 1,
-1.023118, -0.7067153, -1.773045, 0, 0, 0, 1, 1,
-1.022367, 0.990024, -1.020151, 0, 0, 0, 1, 1,
-1.015904, -1.913486, -1.385312, 0, 0, 0, 1, 1,
-1.009483, -0.1835327, -3.151621, 0, 0, 0, 1, 1,
-0.997113, -0.3382832, 1.042768, 0, 0, 0, 1, 1,
-0.9933177, 0.4060658, -1.681407, 0, 0, 0, 1, 1,
-0.9924042, -0.4990499, -1.462521, 1, 1, 1, 1, 1,
-0.9881501, 0.5551711, -2.343885, 1, 1, 1, 1, 1,
-0.9835992, 0.3486531, -2.474431, 1, 1, 1, 1, 1,
-0.9764774, -2.468625, -2.215085, 1, 1, 1, 1, 1,
-0.9672382, 0.7636798, -1.91551, 1, 1, 1, 1, 1,
-0.9579154, 0.9355335, -0.8676997, 1, 1, 1, 1, 1,
-0.951176, -1.475773, -3.113654, 1, 1, 1, 1, 1,
-0.950548, 0.3671679, -1.007732, 1, 1, 1, 1, 1,
-0.9489223, -0.9881022, -2.040022, 1, 1, 1, 1, 1,
-0.9426559, -0.8069522, -2.542576, 1, 1, 1, 1, 1,
-0.9415351, -0.9946874, -2.420639, 1, 1, 1, 1, 1,
-0.9375946, 0.1466754, -0.9936249, 1, 1, 1, 1, 1,
-0.9348219, -0.7129822, -1.036913, 1, 1, 1, 1, 1,
-0.933135, -0.334116, -3.130975, 1, 1, 1, 1, 1,
-0.9322039, -1.374762, -1.728693, 1, 1, 1, 1, 1,
-0.9313863, 0.8063929, -1.957009, 0, 0, 1, 1, 1,
-0.9272403, -0.7283321, -1.671053, 1, 0, 0, 1, 1,
-0.9209693, -1.153806, -2.280086, 1, 0, 0, 1, 1,
-0.9153463, -0.9219034, -2.00496, 1, 0, 0, 1, 1,
-0.9100775, -1.770481, -2.805446, 1, 0, 0, 1, 1,
-0.9063226, 0.7955528, -0.5859495, 1, 0, 0, 1, 1,
-0.9056721, 0.7189076, -0.4578174, 0, 0, 0, 1, 1,
-0.9049353, -0.187179, -2.237877, 0, 0, 0, 1, 1,
-0.904806, 1.160682, -1.370769, 0, 0, 0, 1, 1,
-0.8975202, 1.150546, -0.09314921, 0, 0, 0, 1, 1,
-0.8898097, -1.067186, -2.142844, 0, 0, 0, 1, 1,
-0.8892464, 0.08176086, -3.01736, 0, 0, 0, 1, 1,
-0.8845823, 0.7327141, 1.158406, 0, 0, 0, 1, 1,
-0.8783054, 0.3325236, -1.989009, 1, 1, 1, 1, 1,
-0.8764198, -1.278365, -1.765877, 1, 1, 1, 1, 1,
-0.8755772, -1.597162, -2.769951, 1, 1, 1, 1, 1,
-0.869916, -1.144912, -1.681866, 1, 1, 1, 1, 1,
-0.8690463, 0.2858662, -3.717563, 1, 1, 1, 1, 1,
-0.8687747, -0.4924733, -1.503181, 1, 1, 1, 1, 1,
-0.8654557, -1.997923, -3.917114, 1, 1, 1, 1, 1,
-0.8603157, 0.2771461, -2.020601, 1, 1, 1, 1, 1,
-0.8594964, -0.1358445, -0.4036395, 1, 1, 1, 1, 1,
-0.8586938, -0.7091129, -1.719172, 1, 1, 1, 1, 1,
-0.8576678, -0.2028389, -1.716015, 1, 1, 1, 1, 1,
-0.856251, -1.155173, -1.465504, 1, 1, 1, 1, 1,
-0.8554465, -0.8766467, -1.238617, 1, 1, 1, 1, 1,
-0.852144, 0.4952738, -0.1743289, 1, 1, 1, 1, 1,
-0.8452718, 1.015078, -1.525938, 1, 1, 1, 1, 1,
-0.8442631, 0.1039263, -1.098544, 0, 0, 1, 1, 1,
-0.8438899, 0.2667144, -1.315444, 1, 0, 0, 1, 1,
-0.8434624, 0.9653752, -0.1349158, 1, 0, 0, 1, 1,
-0.8400343, 0.9702532, -0.9678639, 1, 0, 0, 1, 1,
-0.8388608, 0.2994389, -0.8046065, 1, 0, 0, 1, 1,
-0.8340408, 0.1934519, -1.17446, 1, 0, 0, 1, 1,
-0.8280806, -0.3057518, -2.435763, 0, 0, 0, 1, 1,
-0.8245461, 1.695168, 0.7489191, 0, 0, 0, 1, 1,
-0.8239461, -0.7784774, -2.631263, 0, 0, 0, 1, 1,
-0.82075, 0.3926716, -1.183418, 0, 0, 0, 1, 1,
-0.8149356, 0.8243624, 0.1435408, 0, 0, 0, 1, 1,
-0.7982292, 0.3212609, -2.281873, 0, 0, 0, 1, 1,
-0.7963931, 0.4336595, 1.550379, 0, 0, 0, 1, 1,
-0.7957143, -0.2303053, -2.880694, 1, 1, 1, 1, 1,
-0.7926507, -0.4637595, -2.621141, 1, 1, 1, 1, 1,
-0.790969, 0.377703, -1.609068, 1, 1, 1, 1, 1,
-0.7880785, 1.240603, 0.08970708, 1, 1, 1, 1, 1,
-0.7872138, -0.5196548, -2.754404, 1, 1, 1, 1, 1,
-0.7853196, -1.673733, -1.721126, 1, 1, 1, 1, 1,
-0.7852872, 0.3608161, 1.448106, 1, 1, 1, 1, 1,
-0.7821644, -1.65624, -1.124305, 1, 1, 1, 1, 1,
-0.7746416, -0.9532, -0.4665075, 1, 1, 1, 1, 1,
-0.7741923, 0.3715571, -1.915957, 1, 1, 1, 1, 1,
-0.7734966, 0.3059435, -1.65891, 1, 1, 1, 1, 1,
-0.7732359, -0.1948673, -3.240627, 1, 1, 1, 1, 1,
-0.7731082, 0.4280234, -2.443012, 1, 1, 1, 1, 1,
-0.7718613, 0.1336536, -1.683505, 1, 1, 1, 1, 1,
-0.766387, -1.556839, -1.848762, 1, 1, 1, 1, 1,
-0.7609254, 0.5106222, -0.6185527, 0, 0, 1, 1, 1,
-0.7575847, -1.261586, -1.421375, 1, 0, 0, 1, 1,
-0.7512217, -0.9871661, -2.148604, 1, 0, 0, 1, 1,
-0.7490259, -1.018129, -3.506801, 1, 0, 0, 1, 1,
-0.7471964, -0.2279678, -2.075974, 1, 0, 0, 1, 1,
-0.7463374, -0.3044963, -0.8004954, 1, 0, 0, 1, 1,
-0.7449193, 1.376911, -1.737441, 0, 0, 0, 1, 1,
-0.7430744, -1.258994, -3.299224, 0, 0, 0, 1, 1,
-0.7382174, 1.62711, -0.259692, 0, 0, 0, 1, 1,
-0.7376659, 1.344356, -1.695514, 0, 0, 0, 1, 1,
-0.7368564, 0.09447805, -1.614412, 0, 0, 0, 1, 1,
-0.7350179, 0.4090719, -0.3145432, 0, 0, 0, 1, 1,
-0.7289176, 0.6518469, -0.1996721, 0, 0, 0, 1, 1,
-0.722122, -0.8047717, -3.298094, 1, 1, 1, 1, 1,
-0.7199906, -1.256952, -3.515933, 1, 1, 1, 1, 1,
-0.7199736, -0.03447903, -1.932147, 1, 1, 1, 1, 1,
-0.7179319, 1.885489, -0.4969102, 1, 1, 1, 1, 1,
-0.7171347, -1.122377, -0.7014599, 1, 1, 1, 1, 1,
-0.7110139, -1.398853, -2.441777, 1, 1, 1, 1, 1,
-0.7092751, -0.05818743, -2.612064, 1, 1, 1, 1, 1,
-0.7076122, 1.372654, -0.8906052, 1, 1, 1, 1, 1,
-0.7067951, -0.9633508, -2.635437, 1, 1, 1, 1, 1,
-0.7062678, -0.5197105, -2.172058, 1, 1, 1, 1, 1,
-0.6994721, -0.2950882, -0.8003522, 1, 1, 1, 1, 1,
-0.6890471, -0.8826248, -1.616963, 1, 1, 1, 1, 1,
-0.684341, 0.2744257, -1.40725, 1, 1, 1, 1, 1,
-0.6798754, 2.20127, 0.8684334, 1, 1, 1, 1, 1,
-0.671209, -0.2475288, -1.465856, 1, 1, 1, 1, 1,
-0.6704044, 1.357566, 0.2811529, 0, 0, 1, 1, 1,
-0.6675931, 0.2670963, -2.086188, 1, 0, 0, 1, 1,
-0.6656042, -1.343992, -3.209308, 1, 0, 0, 1, 1,
-0.6644583, 1.347649, -0.5842287, 1, 0, 0, 1, 1,
-0.6639618, -0.1109791, -1.670744, 1, 0, 0, 1, 1,
-0.6628183, -0.1681512, -2.258495, 1, 0, 0, 1, 1,
-0.6618821, -0.05059401, -0.08535468, 0, 0, 0, 1, 1,
-0.6610886, -0.8945097, -2.799717, 0, 0, 0, 1, 1,
-0.6607651, 0.5995758, -0.3583668, 0, 0, 0, 1, 1,
-0.6606812, 0.4989619, -1.292465, 0, 0, 0, 1, 1,
-0.6598415, 0.6046961, -2.53722, 0, 0, 0, 1, 1,
-0.6560528, -0.3059951, -1.06169, 0, 0, 0, 1, 1,
-0.6408365, 0.3837607, -1.396533, 0, 0, 0, 1, 1,
-0.6408158, 1.07866, -1.423826, 1, 1, 1, 1, 1,
-0.6303058, -1.98305, -4.694234, 1, 1, 1, 1, 1,
-0.6296425, -0.5557883, -2.63088, 1, 1, 1, 1, 1,
-0.6264039, 0.3275291, 0.3080039, 1, 1, 1, 1, 1,
-0.6247259, 0.5804163, -1.760045, 1, 1, 1, 1, 1,
-0.6209387, 0.5545193, -1.822212, 1, 1, 1, 1, 1,
-0.619479, 1.809748, 0.9427642, 1, 1, 1, 1, 1,
-0.6164793, -0.8344657, -3.510346, 1, 1, 1, 1, 1,
-0.6162531, 1.364223, 0.9113167, 1, 1, 1, 1, 1,
-0.6156408, 0.3008573, -1.71228, 1, 1, 1, 1, 1,
-0.6047994, -1.3414, -1.992019, 1, 1, 1, 1, 1,
-0.602743, 1.055545, -0.3726869, 1, 1, 1, 1, 1,
-0.6019703, -0.07578778, -1.17457, 1, 1, 1, 1, 1,
-0.6015183, -1.199398, -2.519046, 1, 1, 1, 1, 1,
-0.601344, -0.3969497, -2.10543, 1, 1, 1, 1, 1,
-0.6008233, -0.1816296, -3.247347, 0, 0, 1, 1, 1,
-0.5981727, -1.064737, -3.763351, 1, 0, 0, 1, 1,
-0.5945739, -0.885685, -2.927916, 1, 0, 0, 1, 1,
-0.5922198, -0.4490678, -1.570754, 1, 0, 0, 1, 1,
-0.5904405, -0.7787004, -1.167431, 1, 0, 0, 1, 1,
-0.5897134, -0.7847905, -1.257865, 1, 0, 0, 1, 1,
-0.582963, 1.135501, -2.552431, 0, 0, 0, 1, 1,
-0.5819774, -0.1641226, -1.532628, 0, 0, 0, 1, 1,
-0.5746608, -0.3163587, -3.275512, 0, 0, 0, 1, 1,
-0.5674057, 0.5985849, -0.8973933, 0, 0, 0, 1, 1,
-0.5574943, 0.4508122, -2.568572, 0, 0, 0, 1, 1,
-0.5560419, -1.026675, -2.831216, 0, 0, 0, 1, 1,
-0.5520904, 0.01534582, -1.150469, 0, 0, 0, 1, 1,
-0.5482399, -1.276267, -2.268136, 1, 1, 1, 1, 1,
-0.5455735, 0.9568384, -0.5971072, 1, 1, 1, 1, 1,
-0.5401811, 1.023181, -0.6268591, 1, 1, 1, 1, 1,
-0.5364113, 0.2379242, -0.9153425, 1, 1, 1, 1, 1,
-0.533006, -0.5341508, -2.134909, 1, 1, 1, 1, 1,
-0.5262293, -1.021222, -2.132991, 1, 1, 1, 1, 1,
-0.5230475, -1.213562, -4.188508, 1, 1, 1, 1, 1,
-0.5212369, 0.2905453, -0.8048972, 1, 1, 1, 1, 1,
-0.5161051, -1.372951, -3.743088, 1, 1, 1, 1, 1,
-0.5123796, 0.09437202, -2.388528, 1, 1, 1, 1, 1,
-0.5114415, 1.426168, 0.09359648, 1, 1, 1, 1, 1,
-0.5098854, -0.5089982, -3.182102, 1, 1, 1, 1, 1,
-0.4988466, 0.5580367, 1.266366, 1, 1, 1, 1, 1,
-0.4960113, 1.884948, -0.9701905, 1, 1, 1, 1, 1,
-0.4950907, -1.081045, -3.352217, 1, 1, 1, 1, 1,
-0.4915472, -0.2033818, -3.187099, 0, 0, 1, 1, 1,
-0.4899026, -0.5358707, -2.269284, 1, 0, 0, 1, 1,
-0.4891407, 0.4679609, -0.4631076, 1, 0, 0, 1, 1,
-0.4862412, -0.6264711, -1.58694, 1, 0, 0, 1, 1,
-0.4842593, -0.6820496, -2.149198, 1, 0, 0, 1, 1,
-0.4824351, -0.3651124, -1.549641, 1, 0, 0, 1, 1,
-0.4794688, -0.6806788, -1.828723, 0, 0, 0, 1, 1,
-0.4759214, 0.3498959, -1.053514, 0, 0, 0, 1, 1,
-0.4742239, -1.504328, -1.756569, 0, 0, 0, 1, 1,
-0.4735466, -0.1072134, -1.753314, 0, 0, 0, 1, 1,
-0.4682186, -1.348614, -3.688374, 0, 0, 0, 1, 1,
-0.4642248, -0.2681254, -2.790738, 0, 0, 0, 1, 1,
-0.4615597, -2.209637, -4.434816, 0, 0, 0, 1, 1,
-0.4606665, 0.2685905, -1.905539, 1, 1, 1, 1, 1,
-0.4562677, 0.2666518, -1.536546, 1, 1, 1, 1, 1,
-0.44874, -0.5427721, -3.396294, 1, 1, 1, 1, 1,
-0.4403726, 0.1079436, -2.195438, 1, 1, 1, 1, 1,
-0.4374227, -0.5062383, -3.012992, 1, 1, 1, 1, 1,
-0.4337986, 0.7941419, 0.4878363, 1, 1, 1, 1, 1,
-0.4334829, 0.1630666, -0.4699658, 1, 1, 1, 1, 1,
-0.4327458, 0.7236395, -1.696149, 1, 1, 1, 1, 1,
-0.4296042, 0.1580721, -1.319404, 1, 1, 1, 1, 1,
-0.4293003, -0.5520847, -2.497525, 1, 1, 1, 1, 1,
-0.4196192, 0.855898, 0.577758, 1, 1, 1, 1, 1,
-0.4193062, -0.989728, -4.691012, 1, 1, 1, 1, 1,
-0.4191157, -0.02848301, -0.1970429, 1, 1, 1, 1, 1,
-0.4183499, -0.4697016, -2.411547, 1, 1, 1, 1, 1,
-0.4121315, -1.17027, -1.408698, 1, 1, 1, 1, 1,
-0.4114771, -0.8968689, -3.910847, 0, 0, 1, 1, 1,
-0.4095687, -1.562356, -4.707169, 1, 0, 0, 1, 1,
-0.4091119, -0.971749, -1.795499, 1, 0, 0, 1, 1,
-0.4038807, -1.358668, -0.9015893, 1, 0, 0, 1, 1,
-0.403303, 2.163404, -1.469657, 1, 0, 0, 1, 1,
-0.4025417, 0.5522702, -0.710078, 1, 0, 0, 1, 1,
-0.3972368, -0.273082, -1.220617, 0, 0, 0, 1, 1,
-0.3970733, 0.6196455, -1.820194, 0, 0, 0, 1, 1,
-0.3948641, -0.2983111, -3.182496, 0, 0, 0, 1, 1,
-0.392958, -1.527237, -4.104783, 0, 0, 0, 1, 1,
-0.3929327, -0.5046383, -1.782486, 0, 0, 0, 1, 1,
-0.3920896, -0.3071494, -1.850219, 0, 0, 0, 1, 1,
-0.3879463, -0.2063249, -2.274561, 0, 0, 0, 1, 1,
-0.3874856, -0.3074214, -1.433875, 1, 1, 1, 1, 1,
-0.3869055, -0.01659109, -1.166419, 1, 1, 1, 1, 1,
-0.3848331, 0.7479628, 0.003158041, 1, 1, 1, 1, 1,
-0.377551, -1.924944, -2.716152, 1, 1, 1, 1, 1,
-0.3758388, -1.748039, -3.540703, 1, 1, 1, 1, 1,
-0.3731433, -1.47644, -3.499461, 1, 1, 1, 1, 1,
-0.3722983, 2.056035, -1.000352, 1, 1, 1, 1, 1,
-0.3708636, -0.4410514, -1.035997, 1, 1, 1, 1, 1,
-0.3665827, 0.4887535, -0.7395958, 1, 1, 1, 1, 1,
-0.3615646, 1.456852, 0.8966314, 1, 1, 1, 1, 1,
-0.3585282, 2.393373, -0.2792765, 1, 1, 1, 1, 1,
-0.350682, -0.2603415, -1.644594, 1, 1, 1, 1, 1,
-0.3503164, 0.6837204, 1.136639, 1, 1, 1, 1, 1,
-0.3479398, -0.8699285, -2.595618, 1, 1, 1, 1, 1,
-0.3457429, 0.4014198, 0.1269655, 1, 1, 1, 1, 1,
-0.344742, -0.5675705, -2.993311, 0, 0, 1, 1, 1,
-0.3415959, 0.02632749, -1.877593, 1, 0, 0, 1, 1,
-0.3408356, 1.478383, -1.554846, 1, 0, 0, 1, 1,
-0.3386472, -0.2671882, -2.999393, 1, 0, 0, 1, 1,
-0.3376096, 0.4311353, -0.9250426, 1, 0, 0, 1, 1,
-0.3358884, -0.884669, -2.634608, 1, 0, 0, 1, 1,
-0.3337831, 0.160446, -1.778454, 0, 0, 0, 1, 1,
-0.3309705, -0.1190541, -0.7791717, 0, 0, 0, 1, 1,
-0.3295229, -1.612473, -1.755226, 0, 0, 0, 1, 1,
-0.3281118, -0.7095881, -3.513884, 0, 0, 0, 1, 1,
-0.3253988, 0.5045583, -1.371389, 0, 0, 0, 1, 1,
-0.3239875, -0.6011159, -0.9719875, 0, 0, 0, 1, 1,
-0.3212508, 1.784707, 0.1698728, 0, 0, 0, 1, 1,
-0.3196828, 0.9251931, -1.037493, 1, 1, 1, 1, 1,
-0.3191973, 0.2500543, -1.939358, 1, 1, 1, 1, 1,
-0.319088, -0.1553614, -2.543135, 1, 1, 1, 1, 1,
-0.3177186, 2.079242, 0.5688879, 1, 1, 1, 1, 1,
-0.3152154, 0.6326206, -0.6761022, 1, 1, 1, 1, 1,
-0.3137694, -0.1933083, -2.296004, 1, 1, 1, 1, 1,
-0.3076039, 0.533786, -1.746719, 1, 1, 1, 1, 1,
-0.3074184, -0.5926024, -5.192056, 1, 1, 1, 1, 1,
-0.3066398, 0.560707, -0.3789529, 1, 1, 1, 1, 1,
-0.3062401, 0.1129539, -2.265252, 1, 1, 1, 1, 1,
-0.3042009, 0.7562096, -1.87689, 1, 1, 1, 1, 1,
-0.3030175, -0.4096006, -3.416941, 1, 1, 1, 1, 1,
-0.301306, 0.6631686, -0.7909671, 1, 1, 1, 1, 1,
-0.301244, 0.2985163, -1.177475, 1, 1, 1, 1, 1,
-0.2972175, 0.9094264, -0.6405585, 1, 1, 1, 1, 1,
-0.29191, -0.1369861, -2.861846, 0, 0, 1, 1, 1,
-0.2873134, 0.1665837, -1.674634, 1, 0, 0, 1, 1,
-0.2857538, 0.2814998, 0.4617913, 1, 0, 0, 1, 1,
-0.2820143, -0.6186277, -3.302973, 1, 0, 0, 1, 1,
-0.2809991, -0.3273126, -1.486196, 1, 0, 0, 1, 1,
-0.2808771, 0.5170438, -0.9473235, 1, 0, 0, 1, 1,
-0.2795244, -0.9998656, -2.992409, 0, 0, 0, 1, 1,
-0.2783777, 0.7087376, -0.9666779, 0, 0, 0, 1, 1,
-0.2773809, 0.7752265, -3.037048, 0, 0, 0, 1, 1,
-0.2770697, -0.342318, -3.36436, 0, 0, 0, 1, 1,
-0.2759086, 1.430227, 0.4338052, 0, 0, 0, 1, 1,
-0.275059, 1.256107, -0.1934471, 0, 0, 0, 1, 1,
-0.2744325, 0.9705014, -0.1500327, 0, 0, 0, 1, 1,
-0.2727653, 2.274555, 0.8480196, 1, 1, 1, 1, 1,
-0.2720948, -2.116077, -3.844446, 1, 1, 1, 1, 1,
-0.2717381, -0.8249076, -2.192616, 1, 1, 1, 1, 1,
-0.2693109, -0.3692079, -2.845131, 1, 1, 1, 1, 1,
-0.263817, -0.07131864, -0.5739895, 1, 1, 1, 1, 1,
-0.2633715, -1.641617, -1.382772, 1, 1, 1, 1, 1,
-0.2615745, 1.031069, 0.6295469, 1, 1, 1, 1, 1,
-0.2610179, -0.4743512, -3.359504, 1, 1, 1, 1, 1,
-0.2599617, 0.7510657, 2.793371, 1, 1, 1, 1, 1,
-0.2542953, -1.77379, -5.655431, 1, 1, 1, 1, 1,
-0.253818, 0.2575717, -0.7844024, 1, 1, 1, 1, 1,
-0.2495816, -2.139698, -3.408045, 1, 1, 1, 1, 1,
-0.2479215, -1.010381, -3.749999, 1, 1, 1, 1, 1,
-0.2466236, 0.7978908, -0.9633297, 1, 1, 1, 1, 1,
-0.2455837, 0.5770405, 0.7681326, 1, 1, 1, 1, 1,
-0.2408519, 1.144792, 0.2086324, 0, 0, 1, 1, 1,
-0.2377841, -1.618603, 0.1836731, 1, 0, 0, 1, 1,
-0.2361455, 0.1429845, 0.3895058, 1, 0, 0, 1, 1,
-0.2358639, 0.8360305, -0.6630186, 1, 0, 0, 1, 1,
-0.2350286, 0.4297089, 0.1887602, 1, 0, 0, 1, 1,
-0.2284482, -0.7689629, -4.053098, 1, 0, 0, 1, 1,
-0.2263616, 1.046365, 0.7926455, 0, 0, 0, 1, 1,
-0.2248428, 1.84043, 0.09712764, 0, 0, 0, 1, 1,
-0.2247047, -1.545016, -1.012787, 0, 0, 0, 1, 1,
-0.2226568, 1.756379, -0.8150567, 0, 0, 0, 1, 1,
-0.222645, 1.502099, -1.393169, 0, 0, 0, 1, 1,
-0.2200624, 0.5752832, 0.004205836, 0, 0, 0, 1, 1,
-0.2194916, -1.063262, -4.792556, 0, 0, 0, 1, 1,
-0.2194674, 0.4028632, -0.7349595, 1, 1, 1, 1, 1,
-0.2187739, 1.296588, -1.228058, 1, 1, 1, 1, 1,
-0.2169511, -1.340424, -3.841386, 1, 1, 1, 1, 1,
-0.2127054, 0.2995158, -1.600775, 1, 1, 1, 1, 1,
-0.2114184, 0.5610825, 0.3185533, 1, 1, 1, 1, 1,
-0.2101338, -0.1281805, -1.442817, 1, 1, 1, 1, 1,
-0.2089768, 0.1441059, -1.393261, 1, 1, 1, 1, 1,
-0.1980149, -1.481548, -2.736444, 1, 1, 1, 1, 1,
-0.1880263, 1.148689, -0.2131415, 1, 1, 1, 1, 1,
-0.1874697, 1.001627, -0.3934533, 1, 1, 1, 1, 1,
-0.1850293, -0.6401972, -4.440878, 1, 1, 1, 1, 1,
-0.1787065, 0.2371541, -0.2197029, 1, 1, 1, 1, 1,
-0.1730438, -0.1498535, -2.760507, 1, 1, 1, 1, 1,
-0.1708246, -0.2258891, -3.418892, 1, 1, 1, 1, 1,
-0.1664995, 0.2890049, -0.3979307, 1, 1, 1, 1, 1,
-0.1655092, 0.5011613, 0.2875237, 0, 0, 1, 1, 1,
-0.1648107, 0.9083276, -1.643471, 1, 0, 0, 1, 1,
-0.1627688, -2.043576, -4.618299, 1, 0, 0, 1, 1,
-0.1620271, 0.1191656, -0.7738362, 1, 0, 0, 1, 1,
-0.1609423, -0.1601607, -2.195121, 1, 0, 0, 1, 1,
-0.1539557, -0.2350319, -1.501423, 1, 0, 0, 1, 1,
-0.1538162, 0.6772206, -1.159231, 0, 0, 0, 1, 1,
-0.1526449, 0.5072545, -0.1786233, 0, 0, 0, 1, 1,
-0.1470702, 0.567842, 0.995733, 0, 0, 0, 1, 1,
-0.14522, 0.8344337, -1.552502, 0, 0, 0, 1, 1,
-0.1434388, -0.6077998, -2.680406, 0, 0, 0, 1, 1,
-0.1407936, -0.2221458, -3.348835, 0, 0, 0, 1, 1,
-0.139981, 0.4646089, -1.765498, 0, 0, 0, 1, 1,
-0.1390738, -0.3988984, -3.385495, 1, 1, 1, 1, 1,
-0.136066, -0.1742705, -0.3383537, 1, 1, 1, 1, 1,
-0.1337175, 0.8553611, -0.9955269, 1, 1, 1, 1, 1,
-0.1187578, -0.7300194, -3.40197, 1, 1, 1, 1, 1,
-0.1187338, 0.9711278, 0.6745573, 1, 1, 1, 1, 1,
-0.1169186, -0.4821548, -3.952235, 1, 1, 1, 1, 1,
-0.1149133, 0.9702834, 0.1591991, 1, 1, 1, 1, 1,
-0.1058197, -0.408649, -3.488209, 1, 1, 1, 1, 1,
-0.1045473, 0.7407386, -0.7408416, 1, 1, 1, 1, 1,
-0.1026555, -0.9232494, -3.966891, 1, 1, 1, 1, 1,
-0.09927317, -1.980556, -4.104825, 1, 1, 1, 1, 1,
-0.09926911, 0.5502127, -0.6242895, 1, 1, 1, 1, 1,
-0.09793595, 1.138348, -1.084046, 1, 1, 1, 1, 1,
-0.09758867, -1.171832, -4.065908, 1, 1, 1, 1, 1,
-0.09642569, 0.7687767, -1.309508, 1, 1, 1, 1, 1,
-0.09635017, -1.48419, -4.179956, 0, 0, 1, 1, 1,
-0.08797761, 0.3542049, -0.3175507, 1, 0, 0, 1, 1,
-0.08607659, -0.9761984, -2.765494, 1, 0, 0, 1, 1,
-0.08240425, -0.2551568, -3.962102, 1, 0, 0, 1, 1,
-0.07698734, 0.07089926, -1.46646, 1, 0, 0, 1, 1,
-0.07611175, 0.3059242, -0.3158335, 1, 0, 0, 1, 1,
-0.0753528, -1.060125, -2.33809, 0, 0, 0, 1, 1,
-0.07072297, 2.195884, 1.279519, 0, 0, 0, 1, 1,
-0.06522497, 1.129804, 0.5776552, 0, 0, 0, 1, 1,
-0.06487691, -0.2103123, -3.458628, 0, 0, 0, 1, 1,
-0.06482551, 1.516312, 1.217824, 0, 0, 0, 1, 1,
-0.06330636, -0.3937173, -3.094127, 0, 0, 0, 1, 1,
-0.06293441, -0.2825497, -2.453252, 0, 0, 0, 1, 1,
-0.06126226, 0.5355868, -1.218428, 1, 1, 1, 1, 1,
-0.05727973, -1.4145, -3.756864, 1, 1, 1, 1, 1,
-0.05725935, 1.039171, 3.185864, 1, 1, 1, 1, 1,
-0.05631914, -1.390496, -2.719899, 1, 1, 1, 1, 1,
-0.04889674, 0.110538, 0.5018579, 1, 1, 1, 1, 1,
-0.04715724, -0.3062777, -4.000241, 1, 1, 1, 1, 1,
-0.04705886, -0.371084, -2.994404, 1, 1, 1, 1, 1,
-0.04494239, 2.232821, -0.4764218, 1, 1, 1, 1, 1,
-0.0385958, -0.3515722, -1.934936, 1, 1, 1, 1, 1,
-0.03507641, 0.3168263, 0.9366511, 1, 1, 1, 1, 1,
-0.03294186, -0.1418222, -4.390743, 1, 1, 1, 1, 1,
-0.02735413, -0.8779681, -2.375293, 1, 1, 1, 1, 1,
-0.02420996, 0.1273959, 0.07185163, 1, 1, 1, 1, 1,
-0.02245248, 0.3374504, -2.428212, 1, 1, 1, 1, 1,
-0.02027207, 0.05648135, -1.669682, 1, 1, 1, 1, 1,
-0.01946846, -2.3716, -3.936546, 0, 0, 1, 1, 1,
-0.01851114, 1.331408, 0.404996, 1, 0, 0, 1, 1,
-0.01808654, 1.596928, 0.5824915, 1, 0, 0, 1, 1,
-0.01515141, -0.06200218, -3.793414, 1, 0, 0, 1, 1,
-0.004855263, 0.29501, 0.8085591, 1, 0, 0, 1, 1,
-0.002520073, -1.644712, -2.066816, 1, 0, 0, 1, 1,
0.003513349, -0.6655208, 2.418436, 0, 0, 0, 1, 1,
0.004374376, -0.0121848, 1.114363, 0, 0, 0, 1, 1,
0.004976558, -2.05062, 3.036633, 0, 0, 0, 1, 1,
0.005821525, 1.542407, 1.336263, 0, 0, 0, 1, 1,
0.008187599, 2.373562, -0.9239485, 0, 0, 0, 1, 1,
0.009829073, 0.6115587, -1.016276, 0, 0, 0, 1, 1,
0.01061085, 0.595202, 0.5084238, 0, 0, 0, 1, 1,
0.01254995, 0.1136478, -0.6447399, 1, 1, 1, 1, 1,
0.0164945, -0.3360273, 2.561854, 1, 1, 1, 1, 1,
0.01969784, -0.4210136, 1.943108, 1, 1, 1, 1, 1,
0.02239063, 0.296056, -1.361157, 1, 1, 1, 1, 1,
0.02355103, -0.3059772, 2.54963, 1, 1, 1, 1, 1,
0.02466403, 0.8987498, 0.6776123, 1, 1, 1, 1, 1,
0.02529685, 1.539495, -2.473986, 1, 1, 1, 1, 1,
0.0279542, 0.1940364, 0.8210503, 1, 1, 1, 1, 1,
0.0290208, 0.5853765, -0.03692212, 1, 1, 1, 1, 1,
0.02966965, -0.490822, 3.965889, 1, 1, 1, 1, 1,
0.03194938, -1.027027, 3.613422, 1, 1, 1, 1, 1,
0.03313396, 0.7300843, 0.8446715, 1, 1, 1, 1, 1,
0.04490602, -0.43071, 3.22555, 1, 1, 1, 1, 1,
0.04660014, -0.9216218, 3.126609, 1, 1, 1, 1, 1,
0.04768909, 1.699519, 0.7020415, 1, 1, 1, 1, 1,
0.0483847, -0.5348225, 3.731662, 0, 0, 1, 1, 1,
0.04847965, 0.2716405, 0.9124173, 1, 0, 0, 1, 1,
0.048868, 0.08709359, 2.473875, 1, 0, 0, 1, 1,
0.05072636, 0.1546331, 0.7183819, 1, 0, 0, 1, 1,
0.0508875, -0.7170012, 5.877779, 1, 0, 0, 1, 1,
0.05472612, -0.7543461, 2.525653, 1, 0, 0, 1, 1,
0.05509619, 0.7885531, 1.894426, 0, 0, 0, 1, 1,
0.05758031, 0.8038639, 0.1584855, 0, 0, 0, 1, 1,
0.05809415, -1.413633, 1.438367, 0, 0, 0, 1, 1,
0.05936842, 1.836094, 0.9549113, 0, 0, 0, 1, 1,
0.06013035, -1.512841, 4.150172, 0, 0, 0, 1, 1,
0.06291436, 1.645864, 0.7109947, 0, 0, 0, 1, 1,
0.0631643, 0.725933, 1.903305, 0, 0, 0, 1, 1,
0.06515339, -1.461389, 3.148817, 1, 1, 1, 1, 1,
0.06624024, 0.9625304, -0.622524, 1, 1, 1, 1, 1,
0.06626937, 1.793777, -0.3043403, 1, 1, 1, 1, 1,
0.06744555, 0.5919394, 1.694403, 1, 1, 1, 1, 1,
0.06853216, 0.3457473, 1.881988, 1, 1, 1, 1, 1,
0.0689013, -2.101989, 3.430383, 1, 1, 1, 1, 1,
0.07954473, -1.336941, 3.105035, 1, 1, 1, 1, 1,
0.08519647, -1.791631, 2.96436, 1, 1, 1, 1, 1,
0.08603203, 0.8143304, 0.3057311, 1, 1, 1, 1, 1,
0.0864635, 0.009723219, 1.323689, 1, 1, 1, 1, 1,
0.08837194, 0.7819167, -0.1980626, 1, 1, 1, 1, 1,
0.08837517, -0.03001332, 0.6589445, 1, 1, 1, 1, 1,
0.09430604, 0.1262663, 2.232149, 1, 1, 1, 1, 1,
0.1011516, -0.3007395, 3.221993, 1, 1, 1, 1, 1,
0.1065389, 0.05585024, 2.407494, 1, 1, 1, 1, 1,
0.1094682, 0.1218327, 0.6627038, 0, 0, 1, 1, 1,
0.1100344, 0.3925001, -0.5214766, 1, 0, 0, 1, 1,
0.1102448, -0.9177185, 5.689775, 1, 0, 0, 1, 1,
0.1103871, 0.5453207, 1.097936, 1, 0, 0, 1, 1,
0.1189461, 1.570627, 0.7512, 1, 0, 0, 1, 1,
0.1203076, 1.516791, -1.048621, 1, 0, 0, 1, 1,
0.1314543, -0.6093417, 2.262584, 0, 0, 0, 1, 1,
0.1339266, 0.3133928, 0.5806623, 0, 0, 0, 1, 1,
0.1362124, 0.7805783, 0.04971675, 0, 0, 0, 1, 1,
0.1387938, 0.7221851, 0.3966272, 0, 0, 0, 1, 1,
0.1416954, -1.639529, 4.836872, 0, 0, 0, 1, 1,
0.1425257, -0.5859995, 2.017041, 0, 0, 0, 1, 1,
0.1455735, -1.30685, 3.489429, 0, 0, 0, 1, 1,
0.1482764, 0.383519, 0.3904849, 1, 1, 1, 1, 1,
0.1492729, -1.337435, 3.203752, 1, 1, 1, 1, 1,
0.1528104, 0.01515758, 2.06337, 1, 1, 1, 1, 1,
0.1553845, 1.511888, -0.4613065, 1, 1, 1, 1, 1,
0.1608339, 1.422353, 1.719043, 1, 1, 1, 1, 1,
0.1650536, -0.7428574, 0.6659545, 1, 1, 1, 1, 1,
0.1696261, -2.685113, 4.739329, 1, 1, 1, 1, 1,
0.1708304, 0.3713089, 3.577261, 1, 1, 1, 1, 1,
0.1737072, 0.6530014, 0.4376957, 1, 1, 1, 1, 1,
0.1747406, -0.2903318, 3.686738, 1, 1, 1, 1, 1,
0.1767137, -0.1200384, 2.638242, 1, 1, 1, 1, 1,
0.1770319, 0.002463368, -0.3194883, 1, 1, 1, 1, 1,
0.1814062, 2.362409, 0.8054391, 1, 1, 1, 1, 1,
0.184259, 1.934284, -0.842706, 1, 1, 1, 1, 1,
0.1855429, -0.295438, 2.675254, 1, 1, 1, 1, 1,
0.186632, 0.8731089, -0.341342, 0, 0, 1, 1, 1,
0.1875935, 0.5205547, 1.404549, 1, 0, 0, 1, 1,
0.1910981, -0.2084006, 2.457545, 1, 0, 0, 1, 1,
0.1954998, -0.2285785, 1.833129, 1, 0, 0, 1, 1,
0.1974559, -0.2396743, 4.795972, 1, 0, 0, 1, 1,
0.2002255, -0.6027807, 3.470222, 1, 0, 0, 1, 1,
0.2079714, -0.6570729, 2.408067, 0, 0, 0, 1, 1,
0.2100824, 0.5359321, 0.8673645, 0, 0, 0, 1, 1,
0.2115282, 1.139296, 0.5819724, 0, 0, 0, 1, 1,
0.2125349, -0.28703, 3.49352, 0, 0, 0, 1, 1,
0.2129332, 1.246189, 0.5147638, 0, 0, 0, 1, 1,
0.2130193, 1.352076, -0.01412932, 0, 0, 0, 1, 1,
0.2170079, -1.101066, 3.075782, 0, 0, 0, 1, 1,
0.2203858, 0.7586598, 1.112132, 1, 1, 1, 1, 1,
0.2226576, 0.5934119, 0.962725, 1, 1, 1, 1, 1,
0.2228758, -1.064852, 3.012597, 1, 1, 1, 1, 1,
0.2267163, 0.3169909, -0.6479468, 1, 1, 1, 1, 1,
0.2272681, 0.3918427, 1.963124, 1, 1, 1, 1, 1,
0.2308808, -0.4511797, 3.353345, 1, 1, 1, 1, 1,
0.2314229, -1.847535, -0.0002409587, 1, 1, 1, 1, 1,
0.2318773, 0.6272473, 0.8104233, 1, 1, 1, 1, 1,
0.2388881, 2.316988, 1.304767, 1, 1, 1, 1, 1,
0.2425442, -1.999963, 3.479708, 1, 1, 1, 1, 1,
0.2470568, -0.4760758, 2.733623, 1, 1, 1, 1, 1,
0.2497804, 0.5203431, 1.634713, 1, 1, 1, 1, 1,
0.2512379, -1.328544, 3.7212, 1, 1, 1, 1, 1,
0.2521923, -1.222156, 3.569675, 1, 1, 1, 1, 1,
0.2533489, 1.94444, -0.05867455, 1, 1, 1, 1, 1,
0.2534589, 0.2803992, -0.03023612, 0, 0, 1, 1, 1,
0.2655186, -0.8251573, 1.10061, 1, 0, 0, 1, 1,
0.2675208, -1.5626, 3.427322, 1, 0, 0, 1, 1,
0.2727236, 0.8965045, 0.8303224, 1, 0, 0, 1, 1,
0.2734556, -0.5007772, 1.711989, 1, 0, 0, 1, 1,
0.2749443, -0.6745244, 2.74945, 1, 0, 0, 1, 1,
0.2775879, 0.05559843, 1.377321, 0, 0, 0, 1, 1,
0.2792002, -0.2794515, 2.545416, 0, 0, 0, 1, 1,
0.2808406, 0.6053892, 0.6523545, 0, 0, 0, 1, 1,
0.2825085, 0.9316058, 1.79576, 0, 0, 0, 1, 1,
0.2848533, -0.2189256, 4.352363, 0, 0, 0, 1, 1,
0.2887239, 1.622651, 0.5980033, 0, 0, 0, 1, 1,
0.2893942, 0.7418526, 0.5258145, 0, 0, 0, 1, 1,
0.2988884, 2.007286, 0.1051228, 1, 1, 1, 1, 1,
0.2990887, -0.7003224, 2.337637, 1, 1, 1, 1, 1,
0.3018521, -0.2703358, 3.954592, 1, 1, 1, 1, 1,
0.3051113, -1.194415, 2.999059, 1, 1, 1, 1, 1,
0.3083497, -0.7096896, 3.914638, 1, 1, 1, 1, 1,
0.3109916, -0.5869339, 2.907394, 1, 1, 1, 1, 1,
0.3113716, 1.896261, -0.1016945, 1, 1, 1, 1, 1,
0.3119613, 0.004807124, 3.338559, 1, 1, 1, 1, 1,
0.3140408, -0.6847229, 1.691709, 1, 1, 1, 1, 1,
0.3172611, -0.5287847, 2.777865, 1, 1, 1, 1, 1,
0.3217842, 0.2316837, 0.5487608, 1, 1, 1, 1, 1,
0.3232648, -1.802808, 3.822207, 1, 1, 1, 1, 1,
0.3303895, -0.8489299, 3.34115, 1, 1, 1, 1, 1,
0.3367181, -0.6272792, 2.156032, 1, 1, 1, 1, 1,
0.3380613, -0.2490377, 2.129627, 1, 1, 1, 1, 1,
0.339554, 0.9026088, -1.252687, 0, 0, 1, 1, 1,
0.3403736, 0.5883564, 1.034969, 1, 0, 0, 1, 1,
0.3495896, 0.05067867, 1.508935, 1, 0, 0, 1, 1,
0.3511889, -0.3885073, 1.693049, 1, 0, 0, 1, 1,
0.3541896, 0.07522271, 0.5595923, 1, 0, 0, 1, 1,
0.3630285, -0.0838033, -0.4315933, 1, 0, 0, 1, 1,
0.3655303, 0.7663984, 1.070432, 0, 0, 0, 1, 1,
0.3730141, -2.109421, 6.477263, 0, 0, 0, 1, 1,
0.3743688, -2.67911, 5.463421, 0, 0, 0, 1, 1,
0.3773773, -1.016953, 2.837576, 0, 0, 0, 1, 1,
0.3782739, -1.140517, 3.069666, 0, 0, 0, 1, 1,
0.3825479, -0.7448618, 3.237159, 0, 0, 0, 1, 1,
0.3946027, -0.8259176, 2.6924, 0, 0, 0, 1, 1,
0.3948566, 1.006427, 2.582515, 1, 1, 1, 1, 1,
0.3954185, 1.147697, 0.6781514, 1, 1, 1, 1, 1,
0.3958651, 0.7055134, 0.4647265, 1, 1, 1, 1, 1,
0.4002312, 0.1977492, 0.8959329, 1, 1, 1, 1, 1,
0.4026369, -0.8294687, 2.34845, 1, 1, 1, 1, 1,
0.403588, 0.2381842, 2.288604, 1, 1, 1, 1, 1,
0.41321, 0.7649701, 1.538532, 1, 1, 1, 1, 1,
0.4219152, -0.4948255, 0.9770293, 1, 1, 1, 1, 1,
0.4259667, 0.05465155, 1.695345, 1, 1, 1, 1, 1,
0.4311627, 0.3521992, 0.03789244, 1, 1, 1, 1, 1,
0.4320825, 1.449184, -0.3579315, 1, 1, 1, 1, 1,
0.4359017, -0.9092271, 2.661639, 1, 1, 1, 1, 1,
0.4375945, -1.16504, 3.994194, 1, 1, 1, 1, 1,
0.4402179, -0.2097786, 1.230998, 1, 1, 1, 1, 1,
0.4487485, -1.267227, 4.116894, 1, 1, 1, 1, 1,
0.4492612, -1.859736, 3.706252, 0, 0, 1, 1, 1,
0.4531293, -0.2373424, 2.034402, 1, 0, 0, 1, 1,
0.4533502, -2.107844, 4.176097, 1, 0, 0, 1, 1,
0.4542486, -0.001195743, 2.629147, 1, 0, 0, 1, 1,
0.4585788, 0.8672671, -0.5807654, 1, 0, 0, 1, 1,
0.4586028, -0.5073372, 4.039556, 1, 0, 0, 1, 1,
0.4610404, 0.9069185, 0.9396146, 0, 0, 0, 1, 1,
0.4616191, 0.574002, -0.05943904, 0, 0, 0, 1, 1,
0.4623176, 0.9123506, -1.610454, 0, 0, 0, 1, 1,
0.4686132, 0.6988571, 0.489592, 0, 0, 0, 1, 1,
0.4766367, 0.5973499, -0.9357414, 0, 0, 0, 1, 1,
0.4887512, -0.1723746, 1.59806, 0, 0, 0, 1, 1,
0.4889484, -0.4485149, 3.901864, 0, 0, 0, 1, 1,
0.4917663, -1.358484, 3.689971, 1, 1, 1, 1, 1,
0.495182, -1.46818, 2.844015, 1, 1, 1, 1, 1,
0.5029237, -2.454756, 2.69048, 1, 1, 1, 1, 1,
0.5034753, 1.973259, -0.6438729, 1, 1, 1, 1, 1,
0.505209, 0.5798467, 1.204851, 1, 1, 1, 1, 1,
0.5067174, 0.02975773, 0.7384034, 1, 1, 1, 1, 1,
0.5082777, 0.04090726, 1.245265, 1, 1, 1, 1, 1,
0.5090548, -1.368662, 3.030008, 1, 1, 1, 1, 1,
0.5096659, 1.747898, 0.6889017, 1, 1, 1, 1, 1,
0.5181727, 0.3630381, 2.003194, 1, 1, 1, 1, 1,
0.5194376, 0.03704909, 1.486552, 1, 1, 1, 1, 1,
0.524746, 0.3206977, -0.8611935, 1, 1, 1, 1, 1,
0.5251827, 1.306878, -0.06135668, 1, 1, 1, 1, 1,
0.5269077, 1.509195, -0.1291859, 1, 1, 1, 1, 1,
0.5324401, 0.1058426, 0.04739487, 1, 1, 1, 1, 1,
0.5356793, -0.6045511, 3.897648, 0, 0, 1, 1, 1,
0.5376476, 0.8480629, -1.027942, 1, 0, 0, 1, 1,
0.5411943, 0.1373243, 2.419246, 1, 0, 0, 1, 1,
0.5431758, -2.083385, 4.419116, 1, 0, 0, 1, 1,
0.5475988, -1.406309, 4.473499, 1, 0, 0, 1, 1,
0.5481268, 0.2337911, 3.158614, 1, 0, 0, 1, 1,
0.5499827, -1.448674, 2.342664, 0, 0, 0, 1, 1,
0.5521145, 0.1046523, 0.4320553, 0, 0, 0, 1, 1,
0.5527226, -0.5861036, 3.198684, 0, 0, 0, 1, 1,
0.5570287, -0.2223117, 2.953686, 0, 0, 0, 1, 1,
0.5579524, 0.3092002, 3.769452, 0, 0, 0, 1, 1,
0.5609625, 1.707405, 1.431411, 0, 0, 0, 1, 1,
0.5641994, -0.3367856, 3.247036, 0, 0, 0, 1, 1,
0.5675571, 0.586211, 1.187739, 1, 1, 1, 1, 1,
0.5676576, -1.001182, 3.343545, 1, 1, 1, 1, 1,
0.5700213, 0.9623347, 1.659263, 1, 1, 1, 1, 1,
0.5728893, -1.407333, 2.692931, 1, 1, 1, 1, 1,
0.577723, 1.315133, 1.682001, 1, 1, 1, 1, 1,
0.5850709, -1.113956, 3.802948, 1, 1, 1, 1, 1,
0.585969, 0.224748, -0.762984, 1, 1, 1, 1, 1,
0.5873849, 1.70308, -0.4212371, 1, 1, 1, 1, 1,
0.5889463, -0.7640772, 2.401942, 1, 1, 1, 1, 1,
0.5894198, 0.4505987, 2.452977, 1, 1, 1, 1, 1,
0.5899416, -0.5013392, 2.861969, 1, 1, 1, 1, 1,
0.5920241, 0.2501642, 2.237055, 1, 1, 1, 1, 1,
0.5944544, 0.1241982, 1.485916, 1, 1, 1, 1, 1,
0.6004045, 1.018324, 0.2760005, 1, 1, 1, 1, 1,
0.6049351, 0.1799075, 0.9990408, 1, 1, 1, 1, 1,
0.6074976, 1.730501, 0.8015579, 0, 0, 1, 1, 1,
0.6083711, 0.9123791, 0.04125155, 1, 0, 0, 1, 1,
0.6121178, -0.06390192, 2.552896, 1, 0, 0, 1, 1,
0.6125056, -0.1092006, 0.9710929, 1, 0, 0, 1, 1,
0.6143737, 0.2150362, 1.509036, 1, 0, 0, 1, 1,
0.6151065, 0.138963, 2.414062, 1, 0, 0, 1, 1,
0.6183735, 2.892237, -0.4992484, 0, 0, 0, 1, 1,
0.621453, 1.269063, 2.060595, 0, 0, 0, 1, 1,
0.6232669, -0.203289, 0.1016037, 0, 0, 0, 1, 1,
0.624587, 0.1761827, 2.45845, 0, 0, 0, 1, 1,
0.6286935, 0.366601, 1.381759, 0, 0, 0, 1, 1,
0.6337012, -0.9492878, 3.367979, 0, 0, 0, 1, 1,
0.6363837, 1.135914, -0.534642, 0, 0, 0, 1, 1,
0.637863, -1.157653, 2.564602, 1, 1, 1, 1, 1,
0.6383448, 2.623162, -0.7043716, 1, 1, 1, 1, 1,
0.6406355, 0.3739207, 1.973411, 1, 1, 1, 1, 1,
0.6434681, -0.1083091, 2.205994, 1, 1, 1, 1, 1,
0.6490119, 0.5962927, 1.149692, 1, 1, 1, 1, 1,
0.6495667, 0.7078567, -0.77242, 1, 1, 1, 1, 1,
0.6499786, 1.758293, -1.014193, 1, 1, 1, 1, 1,
0.6637317, 1.079191, -0.785629, 1, 1, 1, 1, 1,
0.6723779, 1.079693, 1.543233, 1, 1, 1, 1, 1,
0.6730461, 0.1587781, 1.492342, 1, 1, 1, 1, 1,
0.6768727, 0.08573214, 1.835265, 1, 1, 1, 1, 1,
0.67849, 1.644268, 1.006362, 1, 1, 1, 1, 1,
0.6788921, 1.903554, -1.090565, 1, 1, 1, 1, 1,
0.678987, -0.6926701, 2.972617, 1, 1, 1, 1, 1,
0.6791921, -0.117721, 2.035514, 1, 1, 1, 1, 1,
0.6826549, -0.7440689, 3.614659, 0, 0, 1, 1, 1,
0.6844176, -0.01335064, 2.408823, 1, 0, 0, 1, 1,
0.6854887, -0.4030619, 2.74391, 1, 0, 0, 1, 1,
0.6864399, 0.5643857, 1.602691, 1, 0, 0, 1, 1,
0.6953151, 0.04582442, 1.894675, 1, 0, 0, 1, 1,
0.6986137, -0.6635156, 0.993314, 1, 0, 0, 1, 1,
0.699501, 0.8838266, -1.391684, 0, 0, 0, 1, 1,
0.7011505, 1.111768, 0.2825524, 0, 0, 0, 1, 1,
0.7017406, 0.6023494, 1.285919, 0, 0, 0, 1, 1,
0.7076343, -1.499142, 0.7281657, 0, 0, 0, 1, 1,
0.7089429, 2.476575, 0.4862556, 0, 0, 0, 1, 1,
0.715558, 0.3840842, 1.034131, 0, 0, 0, 1, 1,
0.722274, -0.1569462, 2.015954, 0, 0, 0, 1, 1,
0.7234566, 1.112634, 0.2628641, 1, 1, 1, 1, 1,
0.7240603, 0.8926029, 0.5892598, 1, 1, 1, 1, 1,
0.7278566, -0.1933117, 2.152557, 1, 1, 1, 1, 1,
0.7312126, 1.397686, 1.870635, 1, 1, 1, 1, 1,
0.731757, 0.01450865, 1.295768, 1, 1, 1, 1, 1,
0.7410212, -2.203309, 3.530597, 1, 1, 1, 1, 1,
0.7426902, 1.363945, -0.6005995, 1, 1, 1, 1, 1,
0.7441556, -0.1619478, 1.94727, 1, 1, 1, 1, 1,
0.7470893, 0.007325453, 1.975974, 1, 1, 1, 1, 1,
0.7480509, -0.2261464, 4.120145, 1, 1, 1, 1, 1,
0.7487513, -1.024292, 1.63395, 1, 1, 1, 1, 1,
0.7503093, 0.6422957, 2.821068, 1, 1, 1, 1, 1,
0.7532594, 0.3937512, 1.75524, 1, 1, 1, 1, 1,
0.7541658, -1.741915, 1.694458, 1, 1, 1, 1, 1,
0.7544377, -0.2978964, 1.418271, 1, 1, 1, 1, 1,
0.7549164, -0.628054, 2.536778, 0, 0, 1, 1, 1,
0.7623151, -1.232923, 2.95419, 1, 0, 0, 1, 1,
0.7676582, -1.844653, 3.068004, 1, 0, 0, 1, 1,
0.7798617, -0.1008292, 2.056212, 1, 0, 0, 1, 1,
0.7839264, -0.799051, 2.778355, 1, 0, 0, 1, 1,
0.7877133, -0.184187, 2.306781, 1, 0, 0, 1, 1,
0.7891662, -0.1271235, 0.608211, 0, 0, 0, 1, 1,
0.7935368, -0.3301241, 2.015794, 0, 0, 0, 1, 1,
0.798199, 1.392761, -0.0729778, 0, 0, 0, 1, 1,
0.7983831, -0.2324921, 0.8495585, 0, 0, 0, 1, 1,
0.8064677, -0.3338778, 2.741052, 0, 0, 0, 1, 1,
0.8085157, -0.3078128, 1.6015, 0, 0, 0, 1, 1,
0.817808, -0.5575224, 1.760124, 0, 0, 0, 1, 1,
0.8179547, -0.5351313, 2.802271, 1, 1, 1, 1, 1,
0.8204058, -1.168965, 1.300606, 1, 1, 1, 1, 1,
0.8248158, -1.139596, 2.98139, 1, 1, 1, 1, 1,
0.8283455, -1.413813, 3.541621, 1, 1, 1, 1, 1,
0.8334761, 0.3956124, -0.2234685, 1, 1, 1, 1, 1,
0.8375536, -1.576426, 2.383965, 1, 1, 1, 1, 1,
0.838291, -0.1584029, 1.874177, 1, 1, 1, 1, 1,
0.8394296, -0.3654262, 3.253415, 1, 1, 1, 1, 1,
0.8422142, 0.6211805, -0.5040698, 1, 1, 1, 1, 1,
0.8432494, 0.0490702, 0.9206939, 1, 1, 1, 1, 1,
0.8436052, 0.5407213, 0.9755128, 1, 1, 1, 1, 1,
0.8592206, 0.5166664, 0.2854444, 1, 1, 1, 1, 1,
0.8596568, -0.2916173, 1.960383, 1, 1, 1, 1, 1,
0.8631865, 0.521253, 1.523404, 1, 1, 1, 1, 1,
0.8646188, -1.571756, 3.416952, 1, 1, 1, 1, 1,
0.8656866, 0.460769, 0.3310379, 0, 0, 1, 1, 1,
0.8721802, -0.1183443, 1.748101, 1, 0, 0, 1, 1,
0.8768539, -1.111416, 2.080779, 1, 0, 0, 1, 1,
0.8780332, -0.4741963, 1.490572, 1, 0, 0, 1, 1,
0.8798966, 1.024259, 0.7387477, 1, 0, 0, 1, 1,
0.8818329, -0.04161987, 1.255158, 1, 0, 0, 1, 1,
0.8841186, 0.08816066, 1.533518, 0, 0, 0, 1, 1,
0.888047, 1.480474, 0.6703949, 0, 0, 0, 1, 1,
0.8909625, -1.711848, 3.708291, 0, 0, 0, 1, 1,
0.8916791, 1.140862, 0.1524702, 0, 0, 0, 1, 1,
0.8951998, 0.7065439, 0.5251192, 0, 0, 0, 1, 1,
0.9006449, 0.414364, 0.9930106, 0, 0, 0, 1, 1,
0.9033176, 1.037732, -0.2963806, 0, 0, 0, 1, 1,
0.9045474, 0.817279, 0.272978, 1, 1, 1, 1, 1,
0.9150915, -0.5017725, 1.455519, 1, 1, 1, 1, 1,
0.916482, 0.9563534, 1.4149, 1, 1, 1, 1, 1,
0.9213766, -0.1990175, 1.841497, 1, 1, 1, 1, 1,
0.926428, 0.9625293, -0.5814055, 1, 1, 1, 1, 1,
0.9359208, 1.81293, 1.33511, 1, 1, 1, 1, 1,
0.9374923, 0.5970623, 0.5699426, 1, 1, 1, 1, 1,
0.9393858, 0.629278, 1.234487, 1, 1, 1, 1, 1,
0.942143, 0.7729617, 2.060269, 1, 1, 1, 1, 1,
0.944183, -1.021716, 2.912118, 1, 1, 1, 1, 1,
0.9491382, -0.4397719, 1.480539, 1, 1, 1, 1, 1,
0.9528652, 0.03526459, 1.674662, 1, 1, 1, 1, 1,
0.9564977, -0.8603238, 2.016402, 1, 1, 1, 1, 1,
0.957332, 0.5980529, 2.496379, 1, 1, 1, 1, 1,
0.9588009, -0.04231586, 2.435382, 1, 1, 1, 1, 1,
0.9600506, 0.359905, 1.17038, 0, 0, 1, 1, 1,
0.9635271, 1.082024, 0.05906228, 1, 0, 0, 1, 1,
0.964702, -0.3771833, 2.541882, 1, 0, 0, 1, 1,
0.9665803, 0.6257168, -0.03618208, 1, 0, 0, 1, 1,
0.9807567, -0.185681, 0.9030101, 1, 0, 0, 1, 1,
0.9822194, -0.4298182, 4.061465, 1, 0, 0, 1, 1,
0.986192, -0.7427483, 0.9705651, 0, 0, 0, 1, 1,
0.9863425, -0.8353451, 1.315623, 0, 0, 0, 1, 1,
0.9867378, 1.298053, -0.2163934, 0, 0, 0, 1, 1,
0.9899666, -0.2820111, 1.749767, 0, 0, 0, 1, 1,
0.9950877, 0.2796158, 1.660709, 0, 0, 0, 1, 1,
0.9977612, -0.7754484, 1.327234, 0, 0, 0, 1, 1,
1.000578, 1.087322, -1.304209, 0, 0, 0, 1, 1,
1.009662, -0.7577202, 1.13297, 1, 1, 1, 1, 1,
1.010072, -0.3482679, 0.1593038, 1, 1, 1, 1, 1,
1.011828, -0.9282517, 1.366456, 1, 1, 1, 1, 1,
1.013093, -0.1273781, 1.197698, 1, 1, 1, 1, 1,
1.019737, 0.3046173, 2.327168, 1, 1, 1, 1, 1,
1.024764, 0.8635186, 2.047598, 1, 1, 1, 1, 1,
1.030342, -1.205996, 1.570306, 1, 1, 1, 1, 1,
1.03914, 0.3016692, 0.8043456, 1, 1, 1, 1, 1,
1.042284, 0.5794306, 1.572785, 1, 1, 1, 1, 1,
1.043448, 0.003453099, 2.058747, 1, 1, 1, 1, 1,
1.043479, 0.6813641, 1.35536, 1, 1, 1, 1, 1,
1.047078, 0.7538264, 2.847814, 1, 1, 1, 1, 1,
1.052544, 0.7756109, 0.5511659, 1, 1, 1, 1, 1,
1.052744, 0.6019377, 2.804292, 1, 1, 1, 1, 1,
1.062588, 0.1962739, 1.119823, 1, 1, 1, 1, 1,
1.066404, -0.7881042, 2.38666, 0, 0, 1, 1, 1,
1.069845, -0.3732683, 2.804193, 1, 0, 0, 1, 1,
1.070971, 0.09046099, 3.394905, 1, 0, 0, 1, 1,
1.074807, 0.3089754, -0.224966, 1, 0, 0, 1, 1,
1.080991, -0.4321813, 3.118492, 1, 0, 0, 1, 1,
1.082994, 0.5702704, 1.675157, 1, 0, 0, 1, 1,
1.08762, -1.162427, 3.110017, 0, 0, 0, 1, 1,
1.105056, -1.100659, 2.390869, 0, 0, 0, 1, 1,
1.122384, 0.8119245, 2.633203, 0, 0, 0, 1, 1,
1.126247, -0.9502623, 3.666307, 0, 0, 0, 1, 1,
1.128738, 0.7637787, 1.47939, 0, 0, 0, 1, 1,
1.142908, 0.1381837, 1.204767, 0, 0, 0, 1, 1,
1.150373, 0.3722938, 1.750356, 0, 0, 0, 1, 1,
1.164637, 0.361004, 2.1328, 1, 1, 1, 1, 1,
1.176841, 0.05635052, 1.930338, 1, 1, 1, 1, 1,
1.17932, 1.027717, 1.342581, 1, 1, 1, 1, 1,
1.183234, -0.8120551, 1.939454, 1, 1, 1, 1, 1,
1.199925, 1.058329, -0.3539625, 1, 1, 1, 1, 1,
1.202263, 0.6708927, 1.642178, 1, 1, 1, 1, 1,
1.204314, -1.487923, 1.608502, 1, 1, 1, 1, 1,
1.204602, 0.1046002, 2.516868, 1, 1, 1, 1, 1,
1.205016, 1.441501, 1.56631, 1, 1, 1, 1, 1,
1.212854, -0.9921498, 2.108743, 1, 1, 1, 1, 1,
1.218429, -0.09727828, 2.377738, 1, 1, 1, 1, 1,
1.219171, -0.2783926, 0.37937, 1, 1, 1, 1, 1,
1.225974, -0.4998904, 1.716315, 1, 1, 1, 1, 1,
1.232289, -0.8582318, 1.857896, 1, 1, 1, 1, 1,
1.245229, 0.2040458, 0.4765562, 1, 1, 1, 1, 1,
1.255034, 0.2615723, 1.014782, 0, 0, 1, 1, 1,
1.264765, -1.762218, 3.266351, 1, 0, 0, 1, 1,
1.266506, 1.019462, 1.249614, 1, 0, 0, 1, 1,
1.266577, -0.05735908, 1.177468, 1, 0, 0, 1, 1,
1.272879, -0.6360676, 1.434323, 1, 0, 0, 1, 1,
1.289111, 0.9638075, 0.6021572, 1, 0, 0, 1, 1,
1.291144, -0.8223525, 3.173884, 0, 0, 0, 1, 1,
1.304001, 0.7149748, 0.4814103, 0, 0, 0, 1, 1,
1.311621, -0.5498841, 2.514989, 0, 0, 0, 1, 1,
1.31567, -1.580086, 3.731488, 0, 0, 0, 1, 1,
1.323853, 1.290654, 0.491089, 0, 0, 0, 1, 1,
1.324759, 0.7375393, 0.3701585, 0, 0, 0, 1, 1,
1.333521, -0.522808, 0.7990166, 0, 0, 0, 1, 1,
1.337029, -0.08191673, 0.992232, 1, 1, 1, 1, 1,
1.347122, -1.104302, 3.23377, 1, 1, 1, 1, 1,
1.362873, -2.306571, 5.181097, 1, 1, 1, 1, 1,
1.363246, -0.7429799, 1.744332, 1, 1, 1, 1, 1,
1.367585, -0.7419293, 1.789879, 1, 1, 1, 1, 1,
1.391055, 0.4783314, 1.753547, 1, 1, 1, 1, 1,
1.391647, -0.5602767, 3.49353, 1, 1, 1, 1, 1,
1.392389, 0.6910503, -0.003530176, 1, 1, 1, 1, 1,
1.393069, -0.9547111, 1.127448, 1, 1, 1, 1, 1,
1.400908, -0.916592, 1.987761, 1, 1, 1, 1, 1,
1.415399, -1.36897, 2.263155, 1, 1, 1, 1, 1,
1.427697, 0.1782306, 0.8734035, 1, 1, 1, 1, 1,
1.438458, -0.1969155, 2.459391, 1, 1, 1, 1, 1,
1.443274, -0.6063741, 2.231518, 1, 1, 1, 1, 1,
1.447457, -0.03160873, 0.176401, 1, 1, 1, 1, 1,
1.453472, -0.0259486, 0.9591332, 0, 0, 1, 1, 1,
1.461329, -0.07647783, 2.508664, 1, 0, 0, 1, 1,
1.46663, -0.5239928, 2.791211, 1, 0, 0, 1, 1,
1.468014, 0.6907529, 0.1263943, 1, 0, 0, 1, 1,
1.481618, 3.183486, 1.039949, 1, 0, 0, 1, 1,
1.487152, 0.6312957, 2.002127, 1, 0, 0, 1, 1,
1.487365, 0.3110805, 2.368594, 0, 0, 0, 1, 1,
1.488169, 1.772256, 1.172977, 0, 0, 0, 1, 1,
1.491242, 0.5250748, 1.09303, 0, 0, 0, 1, 1,
1.503424, 0.5933475, -0.3297368, 0, 0, 0, 1, 1,
1.50622, -0.3415706, 1.702397, 0, 0, 0, 1, 1,
1.512039, 1.650983, 0.9119256, 0, 0, 0, 1, 1,
1.516528, -1.268481, 4.035441, 0, 0, 0, 1, 1,
1.523242, -0.5472418, 1.111553, 1, 1, 1, 1, 1,
1.525794, -0.3402277, 2.898699, 1, 1, 1, 1, 1,
1.526176, 1.740282, 1.720744, 1, 1, 1, 1, 1,
1.534836, -1.660141, 2.424628, 1, 1, 1, 1, 1,
1.535399, -1.252713, 1.635452, 1, 1, 1, 1, 1,
1.537862, 1.733484, -0.3585447, 1, 1, 1, 1, 1,
1.543639, -0.4312875, 2.727599, 1, 1, 1, 1, 1,
1.556065, -1.514003, 2.712778, 1, 1, 1, 1, 1,
1.556432, -2.066513, 4.119917, 1, 1, 1, 1, 1,
1.582666, 0.9785901, 1.272004, 1, 1, 1, 1, 1,
1.584661, 0.6573501, 2.249846, 1, 1, 1, 1, 1,
1.585642, 2.251745, -0.55867, 1, 1, 1, 1, 1,
1.606249, 1.690316, 1.493176, 1, 1, 1, 1, 1,
1.631621, -1.723862, 1.598177, 1, 1, 1, 1, 1,
1.638861, -0.7549989, 1.975433, 1, 1, 1, 1, 1,
1.639354, 0.487966, 1.582597, 0, 0, 1, 1, 1,
1.640421, -0.4026497, 1.81117, 1, 0, 0, 1, 1,
1.642293, -2.127029, 0.9171385, 1, 0, 0, 1, 1,
1.667117, 0.140294, 0.5808619, 1, 0, 0, 1, 1,
1.674162, -0.4070882, 1.92129, 1, 0, 0, 1, 1,
1.675319, -0.2938434, 2.005166, 1, 0, 0, 1, 1,
1.693489, -0.677262, 0.5569223, 0, 0, 0, 1, 1,
1.738505, 0.4237676, 3.293136, 0, 0, 0, 1, 1,
1.742514, 0.0475074, 2.450769, 0, 0, 0, 1, 1,
1.744286, 1.776226, -0.1453695, 0, 0, 0, 1, 1,
1.748307, -0.1894015, 2.891337, 0, 0, 0, 1, 1,
1.77201, -0.2008974, 3.054374, 0, 0, 0, 1, 1,
1.793196, -0.009291471, 1.400527, 0, 0, 0, 1, 1,
1.812128, 0.9323586, 1.961506, 1, 1, 1, 1, 1,
1.835977, -1.932636, 2.181862, 1, 1, 1, 1, 1,
1.843025, 0.4160481, 2.426197, 1, 1, 1, 1, 1,
1.894529, 1.108425, 0.0970017, 1, 1, 1, 1, 1,
1.90582, -1.899606, 2.903845, 1, 1, 1, 1, 1,
1.915258, -0.3407241, 3.366713, 1, 1, 1, 1, 1,
1.94074, -1.676606, 2.188241, 1, 1, 1, 1, 1,
1.947074, 0.4874389, 1.887342, 1, 1, 1, 1, 1,
1.992264, 1.183683, 1.539222, 1, 1, 1, 1, 1,
1.994752, 0.6468745, 1.006953, 1, 1, 1, 1, 1,
2.000023, -2.164553, 1.458673, 1, 1, 1, 1, 1,
2.01204, -0.737547, -0.6594091, 1, 1, 1, 1, 1,
2.044264, 1.672875, 0.4388971, 1, 1, 1, 1, 1,
2.048019, 0.1350722, 1.284174, 1, 1, 1, 1, 1,
2.065609, -1.01189, 0.7457234, 1, 1, 1, 1, 1,
2.11102, -0.9989281, 3.922103, 0, 0, 1, 1, 1,
2.112245, 0.9130612, 0.1607334, 1, 0, 0, 1, 1,
2.126315, -0.1069265, 3.643878, 1, 0, 0, 1, 1,
2.129017, 0.7905478, 2.500719, 1, 0, 0, 1, 1,
2.160815, -0.6774789, 2.729464, 1, 0, 0, 1, 1,
2.182324, -0.8395559, 0.4114378, 1, 0, 0, 1, 1,
2.248158, 1.337705, 1.630003, 0, 0, 0, 1, 1,
2.260269, -0.6209734, 1.549247, 0, 0, 0, 1, 1,
2.313171, -1.677747, 0.8000495, 0, 0, 0, 1, 1,
2.316062, 0.4786001, 1.870054, 0, 0, 0, 1, 1,
2.356434, -1.279543, 2.111844, 0, 0, 0, 1, 1,
2.357754, -0.4236189, 2.696365, 0, 0, 0, 1, 1,
2.363483, 1.001168, 0.455438, 0, 0, 0, 1, 1,
2.389375, -0.3442252, 2.248813, 1, 1, 1, 1, 1,
2.466237, 1.304999, 0.01883463, 1, 1, 1, 1, 1,
2.719199, -1.130776, 2.406063, 1, 1, 1, 1, 1,
2.755941, -0.1046339, 2.362318, 1, 1, 1, 1, 1,
2.970382, 1.813769, 0.2702599, 1, 1, 1, 1, 1,
3.079961, 0.7848384, 1.720122, 1, 1, 1, 1, 1,
3.191828, 0.7306095, 2.314032, 1, 1, 1, 1, 1
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
var radius = 10.11057;
var distance = 35.51296;
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
mvMatrix.translate( 0.1751413, -0.2491865, -0.4109163 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.51296);
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
