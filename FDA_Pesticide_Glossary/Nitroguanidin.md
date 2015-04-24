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
-3.512928, -1.054045, -2.215742, 1, 0, 0, 1,
-3.346943, 0.6055289, -0.0640813, 1, 0.007843138, 0, 1,
-3.271106, 2.103746, -0.7634614, 1, 0.01176471, 0, 1,
-2.939416, -0.7059964, -1.44781, 1, 0.01960784, 0, 1,
-2.631979, -0.7400187, -0.4555152, 1, 0.02352941, 0, 1,
-2.602317, -0.6560963, -3.705681, 1, 0.03137255, 0, 1,
-2.513164, -2.008308, -1.685605, 1, 0.03529412, 0, 1,
-2.473926, -0.6942498, -1.737765, 1, 0.04313726, 0, 1,
-2.460093, -1.265955, -1.216425, 1, 0.04705882, 0, 1,
-2.428726, -0.3627395, -3.344748, 1, 0.05490196, 0, 1,
-2.335071, 1.397234, 0.2064653, 1, 0.05882353, 0, 1,
-2.32396, -0.8358662, -3.059088, 1, 0.06666667, 0, 1,
-2.269792, -1.066616, -3.094514, 1, 0.07058824, 0, 1,
-2.26205, -0.7365611, -1.337909, 1, 0.07843138, 0, 1,
-2.191698, -2.750716, -2.379389, 1, 0.08235294, 0, 1,
-2.158947, -0.2033677, -0.9710158, 1, 0.09019608, 0, 1,
-2.153303, -0.321714, -2.408083, 1, 0.09411765, 0, 1,
-2.064437, 1.276865, 0.1826519, 1, 0.1019608, 0, 1,
-2.045556, 1.578202, -1.241809, 1, 0.1098039, 0, 1,
-2.042794, -1.101478, -0.8010643, 1, 0.1137255, 0, 1,
-1.995061, 0.18152, -1.227537, 1, 0.1215686, 0, 1,
-1.991947, -0.9172755, -2.598695, 1, 0.1254902, 0, 1,
-1.990166, 1.535079, 1.057255, 1, 0.1333333, 0, 1,
-1.91897, 0.714497, -2.313585, 1, 0.1372549, 0, 1,
-1.905794, 2.57925, -0.9076532, 1, 0.145098, 0, 1,
-1.903017, 0.2611765, -0.8117062, 1, 0.1490196, 0, 1,
-1.902523, -0.7149655, -3.166485, 1, 0.1568628, 0, 1,
-1.898132, -0.4297926, 0.01828286, 1, 0.1607843, 0, 1,
-1.887907, 1.313563, -0.430925, 1, 0.1686275, 0, 1,
-1.874179, 0.1781558, -0.6029039, 1, 0.172549, 0, 1,
-1.871091, 1.0065, 0.50996, 1, 0.1803922, 0, 1,
-1.869876, 0.2532527, -2.863336, 1, 0.1843137, 0, 1,
-1.848251, 0.2288428, -0.491604, 1, 0.1921569, 0, 1,
-1.847481, 0.482471, -0.4981026, 1, 0.1960784, 0, 1,
-1.839001, 0.129487, -1.266085, 1, 0.2039216, 0, 1,
-1.804617, -0.104666, -1.537743, 1, 0.2117647, 0, 1,
-1.794615, -0.08460106, -2.784731, 1, 0.2156863, 0, 1,
-1.782853, 0.6993932, -1.45018, 1, 0.2235294, 0, 1,
-1.768873, 1.466188, -2.672584, 1, 0.227451, 0, 1,
-1.763196, -1.543997, -4.580218, 1, 0.2352941, 0, 1,
-1.759386, -1.48578, -3.008036, 1, 0.2392157, 0, 1,
-1.75465, 0.8556355, -1.084663, 1, 0.2470588, 0, 1,
-1.752054, -0.4514242, -0.7098535, 1, 0.2509804, 0, 1,
-1.743878, -1.410934, -3.451144, 1, 0.2588235, 0, 1,
-1.737795, 0.5071705, -1.079555, 1, 0.2627451, 0, 1,
-1.71832, 1.56799, -0.2621293, 1, 0.2705882, 0, 1,
-1.717026, -0.8140844, -1.738821, 1, 0.2745098, 0, 1,
-1.709498, 0.1988639, -2.230079, 1, 0.282353, 0, 1,
-1.706248, 0.01152643, -2.198205, 1, 0.2862745, 0, 1,
-1.705637, -0.1092836, -2.651135, 1, 0.2941177, 0, 1,
-1.682094, 0.8252187, -1.384891, 1, 0.3019608, 0, 1,
-1.67785, 0.4533093, -2.091206, 1, 0.3058824, 0, 1,
-1.67722, 1.092375, -1.156699, 1, 0.3137255, 0, 1,
-1.658097, 1.294382, -1.817333, 1, 0.3176471, 0, 1,
-1.650391, -0.2096791, -1.93512, 1, 0.3254902, 0, 1,
-1.64835, 0.7102454, -2.050385, 1, 0.3294118, 0, 1,
-1.635255, 0.2505953, 0.5447454, 1, 0.3372549, 0, 1,
-1.622991, 1.04361, -1.766044, 1, 0.3411765, 0, 1,
-1.618716, -0.8389099, -1.392203, 1, 0.3490196, 0, 1,
-1.616107, -0.5627911, -1.612968, 1, 0.3529412, 0, 1,
-1.608263, -0.130884, -2.727456, 1, 0.3607843, 0, 1,
-1.607662, -0.7002012, -1.842116, 1, 0.3647059, 0, 1,
-1.583148, -0.664378, -1.671448, 1, 0.372549, 0, 1,
-1.568956, 0.1377274, -2.110741, 1, 0.3764706, 0, 1,
-1.567333, -1.353623, -1.190732, 1, 0.3843137, 0, 1,
-1.564648, -0.5369654, -0.7814535, 1, 0.3882353, 0, 1,
-1.558494, 0.9668686, 0.5743975, 1, 0.3960784, 0, 1,
-1.54332, 1.459314, 1.262546, 1, 0.4039216, 0, 1,
-1.53637, 2.264104, 1.472341, 1, 0.4078431, 0, 1,
-1.533887, -0.3499094, -2.664986, 1, 0.4156863, 0, 1,
-1.527, 0.965435, -3.629357, 1, 0.4196078, 0, 1,
-1.510353, 1.387942, -1.67948, 1, 0.427451, 0, 1,
-1.50624, -1.688255, -2.449916, 1, 0.4313726, 0, 1,
-1.503281, -1.239275, -1.120965, 1, 0.4392157, 0, 1,
-1.496425, 0.2027998, -0.4567003, 1, 0.4431373, 0, 1,
-1.49309, 2.082007, -3.506759, 1, 0.4509804, 0, 1,
-1.484257, -0.474537, -1.82597, 1, 0.454902, 0, 1,
-1.480621, -1.44698, -1.594939, 1, 0.4627451, 0, 1,
-1.474095, 0.9791238, 0.02530644, 1, 0.4666667, 0, 1,
-1.472253, 0.5169199, -1.942621, 1, 0.4745098, 0, 1,
-1.46476, -0.6390986, -1.801613, 1, 0.4784314, 0, 1,
-1.458928, -0.2987919, -2.211536, 1, 0.4862745, 0, 1,
-1.45828, -0.2712186, -1.801928, 1, 0.4901961, 0, 1,
-1.452535, 1.459982, 1.004946, 1, 0.4980392, 0, 1,
-1.448498, 0.1945001, -0.9804435, 1, 0.5058824, 0, 1,
-1.432739, -0.3160095, -2.829438, 1, 0.509804, 0, 1,
-1.418987, -0.5558504, 0.1759923, 1, 0.5176471, 0, 1,
-1.412287, -0.6888847, -3.589597, 1, 0.5215687, 0, 1,
-1.40031, -0.6890572, -2.056076, 1, 0.5294118, 0, 1,
-1.394489, -2.49341, -2.361291, 1, 0.5333334, 0, 1,
-1.393964, -0.3651796, -2.132289, 1, 0.5411765, 0, 1,
-1.380041, -0.05294608, -1.541071, 1, 0.5450981, 0, 1,
-1.379701, -0.4455838, -2.045205, 1, 0.5529412, 0, 1,
-1.371886, 0.1983526, -0.61735, 1, 0.5568628, 0, 1,
-1.368017, 0.2661903, 0.1222361, 1, 0.5647059, 0, 1,
-1.364287, -0.3817798, -2.513612, 1, 0.5686275, 0, 1,
-1.334839, -0.4205532, -1.146147, 1, 0.5764706, 0, 1,
-1.3345, 1.098818, -0.431149, 1, 0.5803922, 0, 1,
-1.325448, -0.3815008, -2.065779, 1, 0.5882353, 0, 1,
-1.319019, -2.383186, -1.596009, 1, 0.5921569, 0, 1,
-1.305603, 1.677181, -1.81328, 1, 0.6, 0, 1,
-1.305316, -1.38001, -0.5814677, 1, 0.6078432, 0, 1,
-1.304356, -0.7768629, -1.069596, 1, 0.6117647, 0, 1,
-1.298193, -0.6628835, -1.915267, 1, 0.6196079, 0, 1,
-1.293885, -0.3882926, -2.261259, 1, 0.6235294, 0, 1,
-1.288047, 0.759557, -0.9596356, 1, 0.6313726, 0, 1,
-1.276836, -0.9793959, -2.131046, 1, 0.6352941, 0, 1,
-1.269629, 0.5931209, -1.123341, 1, 0.6431373, 0, 1,
-1.253061, 0.1143983, -1.688049, 1, 0.6470588, 0, 1,
-1.242131, 0.5702306, -1.374868, 1, 0.654902, 0, 1,
-1.236764, -1.179991, -1.14371, 1, 0.6588235, 0, 1,
-1.230839, -2.123623, -2.799322, 1, 0.6666667, 0, 1,
-1.224925, -0.007201239, -1.893545, 1, 0.6705883, 0, 1,
-1.219833, -0.2443788, -1.763842, 1, 0.6784314, 0, 1,
-1.21627, -2.142794, -3.49068, 1, 0.682353, 0, 1,
-1.202939, -2.218138, -3.711054, 1, 0.6901961, 0, 1,
-1.164923, -0.6754104, -3.212066, 1, 0.6941177, 0, 1,
-1.162167, -0.2639886, 0.06498217, 1, 0.7019608, 0, 1,
-1.161728, -0.2144266, -1.708478, 1, 0.7098039, 0, 1,
-1.161442, 0.4751296, -0.4108094, 1, 0.7137255, 0, 1,
-1.155435, -0.8751084, -1.981357, 1, 0.7215686, 0, 1,
-1.143118, 0.4927983, -1.163055, 1, 0.7254902, 0, 1,
-1.140817, -1.621335, -1.710059, 1, 0.7333333, 0, 1,
-1.126985, 1.24117, 0.1828228, 1, 0.7372549, 0, 1,
-1.112906, -1.277547, -2.705076, 1, 0.7450981, 0, 1,
-1.111242, 0.002970868, -1.720375, 1, 0.7490196, 0, 1,
-1.109472, -0.1692339, -3.010957, 1, 0.7568628, 0, 1,
-1.107526, -0.2298686, -1.858395, 1, 0.7607843, 0, 1,
-1.097601, -0.4806276, -1.242507, 1, 0.7686275, 0, 1,
-1.087839, 2.243029, -1.747278, 1, 0.772549, 0, 1,
-1.072377, -0.6957874, -1.795604, 1, 0.7803922, 0, 1,
-1.062767, 0.5473667, -1.949869, 1, 0.7843137, 0, 1,
-1.057172, 0.1855356, -0.8312351, 1, 0.7921569, 0, 1,
-1.056823, 0.5851371, -2.121966, 1, 0.7960784, 0, 1,
-1.0553, 0.5355316, -0.777836, 1, 0.8039216, 0, 1,
-1.048539, -0.2516946, -2.679955, 1, 0.8117647, 0, 1,
-1.043777, 0.7816766, -1.277501, 1, 0.8156863, 0, 1,
-1.031925, -0.7562289, -1.372584, 1, 0.8235294, 0, 1,
-1.028914, 1.594259, 0.2463684, 1, 0.827451, 0, 1,
-1.026929, 0.2078775, -0.9626309, 1, 0.8352941, 0, 1,
-1.026686, 0.6081137, -1.197015, 1, 0.8392157, 0, 1,
-1.018375, -1.430416, -3.203792, 1, 0.8470588, 0, 1,
-1.015805, 2.01712, -0.8759822, 1, 0.8509804, 0, 1,
-1.01224, 1.090898, -1.833945, 1, 0.8588235, 0, 1,
-1.008226, 0.6012761, -2.10786, 1, 0.8627451, 0, 1,
-1.005732, -0.1890265, -0.5597755, 1, 0.8705882, 0, 1,
-1.003249, 1.512505, -1.93649, 1, 0.8745098, 0, 1,
-0.9909713, -1.757504, -2.148213, 1, 0.8823529, 0, 1,
-0.9886054, -0.5361608, -0.1182843, 1, 0.8862745, 0, 1,
-0.9877293, 1.477279, -0.636202, 1, 0.8941177, 0, 1,
-0.9859951, 1.477028, -2.031702, 1, 0.8980392, 0, 1,
-0.9837349, 0.8353144, -1.817298, 1, 0.9058824, 0, 1,
-0.9814491, -0.7813845, -1.461478, 1, 0.9137255, 0, 1,
-0.9784511, 0.03314745, -2.356792, 1, 0.9176471, 0, 1,
-0.9756839, -0.6161073, -2.351314, 1, 0.9254902, 0, 1,
-0.9691629, 0.9943407, -1.507956, 1, 0.9294118, 0, 1,
-0.9661024, -2.121946, -2.92076, 1, 0.9372549, 0, 1,
-0.959271, 0.5724623, -1.225196, 1, 0.9411765, 0, 1,
-0.9571054, -0.9731723, -0.661081, 1, 0.9490196, 0, 1,
-0.9463711, 0.03334939, -1.555033, 1, 0.9529412, 0, 1,
-0.945361, 0.53175, -0.257544, 1, 0.9607843, 0, 1,
-0.9365685, -1.039349, -0.8877967, 1, 0.9647059, 0, 1,
-0.9355918, -0.6089973, -2.446179, 1, 0.972549, 0, 1,
-0.9306966, -0.4260087, -2.866967, 1, 0.9764706, 0, 1,
-0.9222555, 0.8446229, -0.335121, 1, 0.9843137, 0, 1,
-0.9173967, -1.740282, -3.928728, 1, 0.9882353, 0, 1,
-0.9112538, -1.888159, -2.024229, 1, 0.9960784, 0, 1,
-0.9018403, -0.345655, -2.443341, 0.9960784, 1, 0, 1,
-0.8927508, -2.014421, -1.754653, 0.9921569, 1, 0, 1,
-0.890865, 0.2505652, -0.3666084, 0.9843137, 1, 0, 1,
-0.890615, 1.246212, -1.226715, 0.9803922, 1, 0, 1,
-0.8806213, -1.189808, -2.053915, 0.972549, 1, 0, 1,
-0.8794352, 0.5614629, -0.2591261, 0.9686275, 1, 0, 1,
-0.8747328, -1.136425, -2.707948, 0.9607843, 1, 0, 1,
-0.8737873, -0.1065304, -0.05412368, 0.9568627, 1, 0, 1,
-0.8716323, -0.5791982, -2.005693, 0.9490196, 1, 0, 1,
-0.8632258, 1.425849, 1.765253, 0.945098, 1, 0, 1,
-0.8612205, -0.8719237, -1.918684, 0.9372549, 1, 0, 1,
-0.8546447, -0.7666987, -2.005862, 0.9333333, 1, 0, 1,
-0.8405221, 0.1259651, -3.719735, 0.9254902, 1, 0, 1,
-0.8400354, -1.086125, -2.897909, 0.9215686, 1, 0, 1,
-0.8359593, 1.30029, -0.04785818, 0.9137255, 1, 0, 1,
-0.8276048, 0.6013011, -0.667868, 0.9098039, 1, 0, 1,
-0.8257592, -0.858955, -3.353826, 0.9019608, 1, 0, 1,
-0.822603, 1.889408, -1.642749, 0.8941177, 1, 0, 1,
-0.8183092, 0.1518469, -2.421428, 0.8901961, 1, 0, 1,
-0.816133, 0.5282558, -1.068446, 0.8823529, 1, 0, 1,
-0.8141026, -0.6293032, -2.427241, 0.8784314, 1, 0, 1,
-0.8117719, 0.3240547, -1.878567, 0.8705882, 1, 0, 1,
-0.8091815, -1.214084, -1.229277, 0.8666667, 1, 0, 1,
-0.8074777, 0.09241803, -1.357178, 0.8588235, 1, 0, 1,
-0.8068759, 1.640083, -0.1325384, 0.854902, 1, 0, 1,
-0.8034876, 0.1272438, -0.5979567, 0.8470588, 1, 0, 1,
-0.802769, 1.061167, -0.6772882, 0.8431373, 1, 0, 1,
-0.7948652, -0.2537012, -1.510577, 0.8352941, 1, 0, 1,
-0.7940282, 0.701748, -0.9078256, 0.8313726, 1, 0, 1,
-0.7885809, -0.3724658, -3.311695, 0.8235294, 1, 0, 1,
-0.7879826, 0.5324036, -2.330004, 0.8196079, 1, 0, 1,
-0.7855061, -1.559806, -0.62192, 0.8117647, 1, 0, 1,
-0.7838691, 0.7014597, -1.701259, 0.8078431, 1, 0, 1,
-0.7833512, -0.09032786, -1.944307, 0.8, 1, 0, 1,
-0.7815341, 0.4217162, -2.012598, 0.7921569, 1, 0, 1,
-0.7757512, -1.031977, -2.029461, 0.7882353, 1, 0, 1,
-0.7744969, 1.284364, -1.122517, 0.7803922, 1, 0, 1,
-0.7732204, 0.1817828, -0.1371112, 0.7764706, 1, 0, 1,
-0.7719005, 0.1465112, -1.029294, 0.7686275, 1, 0, 1,
-0.7666823, -1.214713, -1.517758, 0.7647059, 1, 0, 1,
-0.7666461, 0.647929, -1.046484, 0.7568628, 1, 0, 1,
-0.7658176, -0.7964807, -2.653095, 0.7529412, 1, 0, 1,
-0.7647272, -0.9441693, -0.4939352, 0.7450981, 1, 0, 1,
-0.7609706, -2.304992, 0.006809532, 0.7411765, 1, 0, 1,
-0.7568555, 0.8843527, 0.02300836, 0.7333333, 1, 0, 1,
-0.7545785, 2.086015, 0.007071619, 0.7294118, 1, 0, 1,
-0.7490359, 1.012896, 2.427968, 0.7215686, 1, 0, 1,
-0.7485824, 1.749729, 0.9377087, 0.7176471, 1, 0, 1,
-0.7405543, 1.223686, 0.1822336, 0.7098039, 1, 0, 1,
-0.7403246, -1.167725, -4.492797, 0.7058824, 1, 0, 1,
-0.7389959, -0.1493108, -2.700931, 0.6980392, 1, 0, 1,
-0.7364197, -0.04074488, -1.74768, 0.6901961, 1, 0, 1,
-0.7345083, -0.8769039, -3.376774, 0.6862745, 1, 0, 1,
-0.7314846, -0.305495, -0.7464607, 0.6784314, 1, 0, 1,
-0.7296405, 0.175596, -1.500016, 0.6745098, 1, 0, 1,
-0.7296151, -0.6932278, -2.963256, 0.6666667, 1, 0, 1,
-0.7284303, 1.780067, -0.05425953, 0.6627451, 1, 0, 1,
-0.7265865, -0.8678643, -2.861752, 0.654902, 1, 0, 1,
-0.7207354, -0.7508292, -4.774939, 0.6509804, 1, 0, 1,
-0.720735, 1.074931, 0.1967258, 0.6431373, 1, 0, 1,
-0.7194179, -1.848738, -3.442165, 0.6392157, 1, 0, 1,
-0.7191209, -0.1321731, -1.739659, 0.6313726, 1, 0, 1,
-0.7148541, -1.191862, -0.8768966, 0.627451, 1, 0, 1,
-0.713275, -0.05960762, -2.018293, 0.6196079, 1, 0, 1,
-0.705063, -0.3057981, -3.149199, 0.6156863, 1, 0, 1,
-0.7025673, -0.8510778, -3.095235, 0.6078432, 1, 0, 1,
-0.7025131, 0.7402531, -2.447, 0.6039216, 1, 0, 1,
-0.7010021, 0.7137855, -0.1289611, 0.5960785, 1, 0, 1,
-0.7002718, -1.732795, -2.852355, 0.5882353, 1, 0, 1,
-0.6924548, -0.9997222, -3.535281, 0.5843138, 1, 0, 1,
-0.6909049, 0.176416, 0.2010915, 0.5764706, 1, 0, 1,
-0.6894011, 0.6749935, -0.5946772, 0.572549, 1, 0, 1,
-0.6868703, -0.08175753, -0.7568002, 0.5647059, 1, 0, 1,
-0.6837587, -0.6477717, -2.269761, 0.5607843, 1, 0, 1,
-0.6804773, 1.302837, -1.910349, 0.5529412, 1, 0, 1,
-0.6707668, 0.3514022, -1.240463, 0.5490196, 1, 0, 1,
-0.6664848, -0.04760726, -1.229223, 0.5411765, 1, 0, 1,
-0.6633496, -1.334586, -3.161202, 0.5372549, 1, 0, 1,
-0.6625138, 0.3384995, -2.988635, 0.5294118, 1, 0, 1,
-0.6624721, 1.072086, -0.2296175, 0.5254902, 1, 0, 1,
-0.6613312, -0.3843461, -2.258739, 0.5176471, 1, 0, 1,
-0.6562878, -1.18851, -2.27778, 0.5137255, 1, 0, 1,
-0.6562148, -0.8749443, -0.8930628, 0.5058824, 1, 0, 1,
-0.653756, -1.220502, -2.975872, 0.5019608, 1, 0, 1,
-0.6495069, 2.3303, 1.409912, 0.4941176, 1, 0, 1,
-0.6482032, -0.1423161, -3.15164, 0.4862745, 1, 0, 1,
-0.6426561, -0.6937205, -2.941983, 0.4823529, 1, 0, 1,
-0.6375803, -0.5098642, -3.619527, 0.4745098, 1, 0, 1,
-0.6357846, -0.7170774, -2.007274, 0.4705882, 1, 0, 1,
-0.6308271, 0.2038637, -0.3852617, 0.4627451, 1, 0, 1,
-0.6271949, -0.3800307, -1.735471, 0.4588235, 1, 0, 1,
-0.6220258, -1.283187, -4.01951, 0.4509804, 1, 0, 1,
-0.6186813, -0.4584151, -2.053586, 0.4470588, 1, 0, 1,
-0.6179402, -0.5354338, -2.680374, 0.4392157, 1, 0, 1,
-0.615319, -0.2965289, -3.055444, 0.4352941, 1, 0, 1,
-0.6031185, -0.02888088, -1.497738, 0.427451, 1, 0, 1,
-0.6014595, -0.1273991, -0.3750403, 0.4235294, 1, 0, 1,
-0.6013584, -0.07773257, -2.460566, 0.4156863, 1, 0, 1,
-0.5999272, 0.9996119, -1.285525, 0.4117647, 1, 0, 1,
-0.5982784, -2.453057, -2.268872, 0.4039216, 1, 0, 1,
-0.5973814, 0.9064156, -2.288989, 0.3960784, 1, 0, 1,
-0.5950776, 0.7579983, -0.5822936, 0.3921569, 1, 0, 1,
-0.5913031, 0.4523311, 0.2081691, 0.3843137, 1, 0, 1,
-0.5897546, -1.584225, -2.603729, 0.3803922, 1, 0, 1,
-0.5791855, -0.2000588, 1.403557, 0.372549, 1, 0, 1,
-0.5781432, -0.1076611, -2.322786, 0.3686275, 1, 0, 1,
-0.5764786, 0.2797438, -1.709337, 0.3607843, 1, 0, 1,
-0.5753568, -0.46936, -2.600053, 0.3568628, 1, 0, 1,
-0.5693527, 0.08208486, 0.1435233, 0.3490196, 1, 0, 1,
-0.569351, 1.066706, 0.8041852, 0.345098, 1, 0, 1,
-0.5652137, 0.9961218, 0.8913757, 0.3372549, 1, 0, 1,
-0.5615631, -0.1003099, -3.407319, 0.3333333, 1, 0, 1,
-0.5601087, 2.044112, 1.58237, 0.3254902, 1, 0, 1,
-0.5599955, -1.940438, -1.996475, 0.3215686, 1, 0, 1,
-0.5588967, 1.520652, -1.725285, 0.3137255, 1, 0, 1,
-0.5578964, 0.3670884, -0.5093275, 0.3098039, 1, 0, 1,
-0.5504057, -0.7119077, -1.281832, 0.3019608, 1, 0, 1,
-0.5497267, -0.5492474, -1.486642, 0.2941177, 1, 0, 1,
-0.5491632, 0.1500984, -0.5651269, 0.2901961, 1, 0, 1,
-0.5454571, -1.003035, -3.523029, 0.282353, 1, 0, 1,
-0.5437581, -1.606067, -2.968023, 0.2784314, 1, 0, 1,
-0.5426269, -2.043984, -4.121371, 0.2705882, 1, 0, 1,
-0.5424078, -1.610079, -3.175598, 0.2666667, 1, 0, 1,
-0.5423546, 1.721708, -0.632526, 0.2588235, 1, 0, 1,
-0.5391013, -0.8685422, -1.540288, 0.254902, 1, 0, 1,
-0.5371332, -0.8412461, -2.131648, 0.2470588, 1, 0, 1,
-0.535431, 1.886045, -0.02311065, 0.2431373, 1, 0, 1,
-0.5296747, -1.119791, -1.760561, 0.2352941, 1, 0, 1,
-0.5286873, -1.088584, -2.760923, 0.2313726, 1, 0, 1,
-0.5238704, -0.2362695, -1.152745, 0.2235294, 1, 0, 1,
-0.5209525, -0.4957455, -0.871335, 0.2196078, 1, 0, 1,
-0.5202905, -1.338529, -3.246141, 0.2117647, 1, 0, 1,
-0.5169498, 0.5609275, -1.733877, 0.2078431, 1, 0, 1,
-0.5161626, 0.714471, -1.763776, 0.2, 1, 0, 1,
-0.5127416, 0.1607087, -1.67332, 0.1921569, 1, 0, 1,
-0.5097655, 0.7928182, -1.036959, 0.1882353, 1, 0, 1,
-0.5014102, 0.005465913, -1.743319, 0.1803922, 1, 0, 1,
-0.5005752, 0.5251929, -1.467495, 0.1764706, 1, 0, 1,
-0.4987025, 0.6493492, -0.2878902, 0.1686275, 1, 0, 1,
-0.4979047, -0.06340706, -1.594802, 0.1647059, 1, 0, 1,
-0.4936635, 0.5357281, -2.123939, 0.1568628, 1, 0, 1,
-0.4917585, 0.4737217, -1.466381, 0.1529412, 1, 0, 1,
-0.48705, 1.378284, -1.591604, 0.145098, 1, 0, 1,
-0.4776826, 0.7961684, 0.118748, 0.1411765, 1, 0, 1,
-0.476362, -0.8676684, -1.449312, 0.1333333, 1, 0, 1,
-0.4748106, -0.6073285, -1.20055, 0.1294118, 1, 0, 1,
-0.472878, 1.036017, 0.07241656, 0.1215686, 1, 0, 1,
-0.471184, -0.2391955, -0.6594099, 0.1176471, 1, 0, 1,
-0.4629048, -0.9530674, -2.999824, 0.1098039, 1, 0, 1,
-0.4625857, -0.6315488, -3.477798, 0.1058824, 1, 0, 1,
-0.4619522, -1.377214, -4.08886, 0.09803922, 1, 0, 1,
-0.4589707, 0.7545766, -1.603612, 0.09019608, 1, 0, 1,
-0.4572803, -1.353831, -3.305953, 0.08627451, 1, 0, 1,
-0.4516893, 0.07548655, -1.347481, 0.07843138, 1, 0, 1,
-0.4512243, 0.06335575, -1.719705, 0.07450981, 1, 0, 1,
-0.4501424, 0.5615636, -0.3270229, 0.06666667, 1, 0, 1,
-0.44976, 1.948444, -1.01911, 0.0627451, 1, 0, 1,
-0.4448557, -1.471935, -1.076198, 0.05490196, 1, 0, 1,
-0.4443623, 0.4093358, -0.06630812, 0.05098039, 1, 0, 1,
-0.4403048, 1.528491, -3.918253, 0.04313726, 1, 0, 1,
-0.4270977, -0.7677945, -4.258842, 0.03921569, 1, 0, 1,
-0.4230011, -0.5002453, -2.391224, 0.03137255, 1, 0, 1,
-0.4199758, -0.3422732, -1.966494, 0.02745098, 1, 0, 1,
-0.4170402, -0.9755248, -3.903936, 0.01960784, 1, 0, 1,
-0.4151652, -0.1271909, -1.707635, 0.01568628, 1, 0, 1,
-0.4143483, -0.3456926, -1.824626, 0.007843138, 1, 0, 1,
-0.4118214, 0.5953178, -2.520864, 0.003921569, 1, 0, 1,
-0.4088943, -0.5417477, -0.8535514, 0, 1, 0.003921569, 1,
-0.4081734, -0.907186, -1.797052, 0, 1, 0.01176471, 1,
-0.4080436, 0.5681483, -0.7784234, 0, 1, 0.01568628, 1,
-0.4064055, -1.143663, -2.630202, 0, 1, 0.02352941, 1,
-0.4021127, -0.03783915, -1.573768, 0, 1, 0.02745098, 1,
-0.3992598, 0.5693414, -2.491314, 0, 1, 0.03529412, 1,
-0.3921318, 1.310804, 1.32913, 0, 1, 0.03921569, 1,
-0.3912472, 0.3709011, 0.5592442, 0, 1, 0.04705882, 1,
-0.3880349, 2.352095, -0.4909421, 0, 1, 0.05098039, 1,
-0.386858, -0.7330912, -2.937499, 0, 1, 0.05882353, 1,
-0.3820263, 0.3167368, -0.5819529, 0, 1, 0.0627451, 1,
-0.378853, 0.3193936, -1.911383, 0, 1, 0.07058824, 1,
-0.3778132, 0.1795042, 0.7641774, 0, 1, 0.07450981, 1,
-0.3777593, 0.2736224, -1.060632, 0, 1, 0.08235294, 1,
-0.3773631, 0.9074991, 0.2807968, 0, 1, 0.08627451, 1,
-0.3747634, -0.7008373, -2.246114, 0, 1, 0.09411765, 1,
-0.374299, 0.36221, -1.560571, 0, 1, 0.1019608, 1,
-0.3728606, -1.012139, -6.298536, 0, 1, 0.1058824, 1,
-0.3714413, -1.4968, -3.456023, 0, 1, 0.1137255, 1,
-0.3677947, 0.4567854, -0.9822748, 0, 1, 0.1176471, 1,
-0.367467, 0.3750022, -0.3124758, 0, 1, 0.1254902, 1,
-0.361517, -0.7959886, -2.250559, 0, 1, 0.1294118, 1,
-0.3613474, 1.259087, -0.4951581, 0, 1, 0.1372549, 1,
-0.3602523, -1.804997, -3.987402, 0, 1, 0.1411765, 1,
-0.3586535, 0.3570575, -2.380344, 0, 1, 0.1490196, 1,
-0.3578148, -0.2470378, -3.431404, 0, 1, 0.1529412, 1,
-0.3562177, 0.3102411, 0.8062049, 0, 1, 0.1607843, 1,
-0.3544904, -1.094241, -2.148453, 0, 1, 0.1647059, 1,
-0.35033, 0.4112054, -1.753606, 0, 1, 0.172549, 1,
-0.3498736, -1.443692, -4.221133, 0, 1, 0.1764706, 1,
-0.3484154, 0.0002264521, -2.368392, 0, 1, 0.1843137, 1,
-0.3438004, -0.7625561, -1.47961, 0, 1, 0.1882353, 1,
-0.3422579, 0.5928466, -0.2027949, 0, 1, 0.1960784, 1,
-0.3405111, 0.9702308, -1.425616, 0, 1, 0.2039216, 1,
-0.3385046, 0.8238497, -1.093853, 0, 1, 0.2078431, 1,
-0.337698, -0.3549988, -2.178226, 0, 1, 0.2156863, 1,
-0.3374441, -0.06063101, -2.8616, 0, 1, 0.2196078, 1,
-0.3362105, 0.1086666, -2.702242, 0, 1, 0.227451, 1,
-0.335146, 0.6276103, -0.3475298, 0, 1, 0.2313726, 1,
-0.3287701, 1.370015, -0.02854687, 0, 1, 0.2392157, 1,
-0.3235751, -1.61202, -3.90961, 0, 1, 0.2431373, 1,
-0.3227761, -0.1089489, -2.644686, 0, 1, 0.2509804, 1,
-0.3222979, 0.1469368, -1.592919, 0, 1, 0.254902, 1,
-0.3221408, 1.107568, -0.2184364, 0, 1, 0.2627451, 1,
-0.3175053, 0.9153464, 0.6305128, 0, 1, 0.2666667, 1,
-0.3165979, -2.120374, -3.011575, 0, 1, 0.2745098, 1,
-0.3149268, -0.4604146, -1.716371, 0, 1, 0.2784314, 1,
-0.3104176, -2.064319, -3.172342, 0, 1, 0.2862745, 1,
-0.3087794, -0.8858933, -3.314693, 0, 1, 0.2901961, 1,
-0.3049808, -0.4814253, -2.170113, 0, 1, 0.2980392, 1,
-0.3026985, 0.5129318, 0.0956398, 0, 1, 0.3058824, 1,
-0.2996532, 1.318792, -0.5334169, 0, 1, 0.3098039, 1,
-0.2985268, -0.5319381, -2.001213, 0, 1, 0.3176471, 1,
-0.2936244, -0.007150251, -0.5996183, 0, 1, 0.3215686, 1,
-0.2925208, 0.04982584, -2.929398, 0, 1, 0.3294118, 1,
-0.2916414, -1.452142, -2.393748, 0, 1, 0.3333333, 1,
-0.2890935, -0.3397078, -0.1804485, 0, 1, 0.3411765, 1,
-0.2851616, -0.5140551, -3.06888, 0, 1, 0.345098, 1,
-0.2848968, -0.09448119, -0.5580297, 0, 1, 0.3529412, 1,
-0.2827725, 0.4301236, -0.8476386, 0, 1, 0.3568628, 1,
-0.280977, -1.491813, -3.366037, 0, 1, 0.3647059, 1,
-0.2807633, -0.2866704, -2.78207, 0, 1, 0.3686275, 1,
-0.2804154, 0.3084949, -1.02782, 0, 1, 0.3764706, 1,
-0.2761841, -1.183328, -4.447372, 0, 1, 0.3803922, 1,
-0.2742014, -0.5209501, -2.738377, 0, 1, 0.3882353, 1,
-0.2733994, -1.608462, -2.503788, 0, 1, 0.3921569, 1,
-0.2697594, -1.082579, -4.056904, 0, 1, 0.4, 1,
-0.2660922, -0.07913732, -1.985765, 0, 1, 0.4078431, 1,
-0.2660852, -0.1867789, -0.6343456, 0, 1, 0.4117647, 1,
-0.2659399, -0.2547449, -2.919649, 0, 1, 0.4196078, 1,
-0.26509, 0.05889685, -1.600585, 0, 1, 0.4235294, 1,
-0.2640508, 0.3970485, -2.649877, 0, 1, 0.4313726, 1,
-0.2603915, -0.2557034, -2.162791, 0, 1, 0.4352941, 1,
-0.2588747, -0.8602117, -3.534377, 0, 1, 0.4431373, 1,
-0.2585804, -0.6934766, -1.243319, 0, 1, 0.4470588, 1,
-0.257781, -1.465192, -1.644815, 0, 1, 0.454902, 1,
-0.2524328, -0.258008, 0.1558455, 0, 1, 0.4588235, 1,
-0.2477452, -1.027634, -2.834009, 0, 1, 0.4666667, 1,
-0.2474282, -0.1110553, -2.617236, 0, 1, 0.4705882, 1,
-0.2459228, 0.59807, -1.703936, 0, 1, 0.4784314, 1,
-0.2457986, -0.5912302, -2.256994, 0, 1, 0.4823529, 1,
-0.2454135, -0.3627812, -4.499669, 0, 1, 0.4901961, 1,
-0.2398938, 0.09170966, -2.557386, 0, 1, 0.4941176, 1,
-0.2353155, -0.2378493, -1.125703, 0, 1, 0.5019608, 1,
-0.2295108, -0.6615093, -2.797123, 0, 1, 0.509804, 1,
-0.2287055, -0.1061067, -1.553611, 0, 1, 0.5137255, 1,
-0.223699, -0.4991863, -2.397547, 0, 1, 0.5215687, 1,
-0.2232704, 0.8392684, 0.1439201, 0, 1, 0.5254902, 1,
-0.2222382, -0.2318938, -3.729588, 0, 1, 0.5333334, 1,
-0.2216966, 1.804454, -1.207338, 0, 1, 0.5372549, 1,
-0.2209279, -0.2395286, -2.44734, 0, 1, 0.5450981, 1,
-0.2197695, -0.4505628, -2.776878, 0, 1, 0.5490196, 1,
-0.2190519, 0.1612, -1.700275, 0, 1, 0.5568628, 1,
-0.2161891, 0.2123544, 0.3034138, 0, 1, 0.5607843, 1,
-0.2145767, -0.974228, -3.136791, 0, 1, 0.5686275, 1,
-0.214225, 0.2618812, -2.852875, 0, 1, 0.572549, 1,
-0.2128436, -0.2197476, -2.898715, 0, 1, 0.5803922, 1,
-0.206947, 0.07585524, -1.453988, 0, 1, 0.5843138, 1,
-0.2028347, -0.116898, -3.519283, 0, 1, 0.5921569, 1,
-0.1999738, 1.290045, 0.4363287, 0, 1, 0.5960785, 1,
-0.1992263, 0.2945197, -2.102869, 0, 1, 0.6039216, 1,
-0.1948261, 0.4808463, -2.04655, 0, 1, 0.6117647, 1,
-0.1929935, 0.1323983, -1.351022, 0, 1, 0.6156863, 1,
-0.1897293, 0.3371649, -1.059585, 0, 1, 0.6235294, 1,
-0.1863676, 0.1727668, -1.606761, 0, 1, 0.627451, 1,
-0.1799342, -0.6319664, -2.5187, 0, 1, 0.6352941, 1,
-0.1790153, -1.061555, -3.232383, 0, 1, 0.6392157, 1,
-0.1776547, 2.080132, 0.9556227, 0, 1, 0.6470588, 1,
-0.1759855, 0.4035272, 0.5335983, 0, 1, 0.6509804, 1,
-0.1747892, -1.480225, -2.629407, 0, 1, 0.6588235, 1,
-0.1691561, -0.4129227, -0.8144555, 0, 1, 0.6627451, 1,
-0.169148, 1.738155, 0.2905577, 0, 1, 0.6705883, 1,
-0.154568, 0.1250556, -0.7304823, 0, 1, 0.6745098, 1,
-0.1483059, -0.118181, -1.263383, 0, 1, 0.682353, 1,
-0.1448063, -0.1345914, -1.102926, 0, 1, 0.6862745, 1,
-0.1408431, -0.3759864, -2.410216, 0, 1, 0.6941177, 1,
-0.139528, 1.272067, 0.1391096, 0, 1, 0.7019608, 1,
-0.137267, 1.033963, -0.817112, 0, 1, 0.7058824, 1,
-0.131371, -0.3225307, -1.761614, 0, 1, 0.7137255, 1,
-0.1283666, -0.04454413, -1.227603, 0, 1, 0.7176471, 1,
-0.1271914, -0.9445984, -2.621416, 0, 1, 0.7254902, 1,
-0.1271888, 1.029966, -1.271613, 0, 1, 0.7294118, 1,
-0.1214674, 0.2900451, -0.6045521, 0, 1, 0.7372549, 1,
-0.1210371, -0.4391038, -3.618743, 0, 1, 0.7411765, 1,
-0.1196359, -0.6038353, -2.477783, 0, 1, 0.7490196, 1,
-0.1166049, 0.2498368, -1.144293, 0, 1, 0.7529412, 1,
-0.1161694, 0.4504962, 0.1678662, 0, 1, 0.7607843, 1,
-0.1154641, -0.7438277, -3.338512, 0, 1, 0.7647059, 1,
-0.1122933, 0.6550731, 0.9310135, 0, 1, 0.772549, 1,
-0.1116683, -1.590413, -2.803139, 0, 1, 0.7764706, 1,
-0.1063968, -0.3365803, -3.487055, 0, 1, 0.7843137, 1,
-0.1040422, -0.5134575, -3.619411, 0, 1, 0.7882353, 1,
-0.1036598, 0.5605208, 1.081707, 0, 1, 0.7960784, 1,
-0.09724043, 0.3474317, -0.9267352, 0, 1, 0.8039216, 1,
-0.09653011, 1.187, 0.3618629, 0, 1, 0.8078431, 1,
-0.08948089, -0.1477127, -1.128548, 0, 1, 0.8156863, 1,
-0.08835213, 0.4983416, 2.103405, 0, 1, 0.8196079, 1,
-0.08492055, -0.1395908, -3.711208, 0, 1, 0.827451, 1,
-0.0815434, 0.1937244, -0.3672763, 0, 1, 0.8313726, 1,
-0.08027154, 0.3219975, -1.074262, 0, 1, 0.8392157, 1,
-0.07921986, 1.366285, 1.042751, 0, 1, 0.8431373, 1,
-0.07691601, -0.8321271, -3.63278, 0, 1, 0.8509804, 1,
-0.07563569, 0.2682767, -1.726628, 0, 1, 0.854902, 1,
-0.06746897, 1.248353, 0.3765493, 0, 1, 0.8627451, 1,
-0.0652308, 0.1846566, -0.852282, 0, 1, 0.8666667, 1,
-0.06213427, 1.029467, 1.439635, 0, 1, 0.8745098, 1,
-0.05652927, -1.522401, -2.449816, 0, 1, 0.8784314, 1,
-0.05589206, -0.3710059, -1.703205, 0, 1, 0.8862745, 1,
-0.05439345, 1.238982, -1.275273, 0, 1, 0.8901961, 1,
-0.05383377, 0.480131, -1.238877, 0, 1, 0.8980392, 1,
-0.04927183, 1.972863, -0.01591794, 0, 1, 0.9058824, 1,
-0.04641076, -0.8868735, -4.874262, 0, 1, 0.9098039, 1,
-0.04450427, 0.3743936, 0.109663, 0, 1, 0.9176471, 1,
-0.03572597, -1.276327, -2.883717, 0, 1, 0.9215686, 1,
-0.03558843, -1.501064, -2.999123, 0, 1, 0.9294118, 1,
-0.03143481, -0.7493536, -4.909005, 0, 1, 0.9333333, 1,
-0.03133462, 0.7656208, 0.1291856, 0, 1, 0.9411765, 1,
-0.03129365, -0.1515986, -1.654225, 0, 1, 0.945098, 1,
-0.03035513, 0.2378681, -1.179632, 0, 1, 0.9529412, 1,
-0.02930245, 0.7643439, 0.07597293, 0, 1, 0.9568627, 1,
-0.02668762, -1.754497, -4.242302, 0, 1, 0.9647059, 1,
-0.02372436, -0.03713458, -2.832769, 0, 1, 0.9686275, 1,
-0.02174615, 0.3608022, 0.09532136, 0, 1, 0.9764706, 1,
-0.02111349, -1.146628, -3.413634, 0, 1, 0.9803922, 1,
-0.02071404, 1.63523, 0.7611019, 0, 1, 0.9882353, 1,
-0.01932194, -1.803682, -1.123862, 0, 1, 0.9921569, 1,
-0.01843052, 1.016934, 0.5350626, 0, 1, 1, 1,
-0.01726074, 0.7168803, 0.4662511, 0, 0.9921569, 1, 1,
-0.01674857, -0.2101211, -3.569934, 0, 0.9882353, 1, 1,
-0.01668269, 2.134779, -0.327841, 0, 0.9803922, 1, 1,
-0.01585646, 1.090482, -1.800295, 0, 0.9764706, 1, 1,
-0.01405713, 1.540768, -0.4177544, 0, 0.9686275, 1, 1,
-0.01136608, -0.06055772, -3.257015, 0, 0.9647059, 1, 1,
-0.007445721, 0.7989958, -0.2479372, 0, 0.9568627, 1, 1,
-0.00453592, 0.3521882, -0.7446273, 0, 0.9529412, 1, 1,
-0.001244454, -0.4785472, -3.344817, 0, 0.945098, 1, 1,
-0.0006762264, 0.7551419, 0.4154433, 0, 0.9411765, 1, 1,
-0.0006349618, 0.4813851, 0.48485, 0, 0.9333333, 1, 1,
-0.0005832057, 1.233216, 0.7434351, 0, 0.9294118, 1, 1,
0.002913097, -2.997472, 4.226442, 0, 0.9215686, 1, 1,
0.008989924, -0.4526778, 2.292346, 0, 0.9176471, 1, 1,
0.01026332, -0.2130078, 4.037785, 0, 0.9098039, 1, 1,
0.01254298, -0.3345748, 3.385521, 0, 0.9058824, 1, 1,
0.02297818, -0.7386235, 3.52681, 0, 0.8980392, 1, 1,
0.02310005, 0.6685044, 1.480378, 0, 0.8901961, 1, 1,
0.0282258, 0.9141381, 1.101222, 0, 0.8862745, 1, 1,
0.02987826, 0.9977047, -0.08549896, 0, 0.8784314, 1, 1,
0.03162446, 1.520701, -0.1686679, 0, 0.8745098, 1, 1,
0.03209011, 1.401444, -0.5425462, 0, 0.8666667, 1, 1,
0.03247869, 0.3645968, -0.5281005, 0, 0.8627451, 1, 1,
0.03371928, 0.1317806, 0.3596535, 0, 0.854902, 1, 1,
0.03618146, 0.5945794, 0.01001777, 0, 0.8509804, 1, 1,
0.03658094, -0.04568716, 1.396303, 0, 0.8431373, 1, 1,
0.03680124, -2.522835, 2.126557, 0, 0.8392157, 1, 1,
0.03960078, 1.108538, -1.634393, 0, 0.8313726, 1, 1,
0.0402442, -2.312843, 3.262794, 0, 0.827451, 1, 1,
0.040598, 0.01607865, -0.7419807, 0, 0.8196079, 1, 1,
0.04230973, 0.2522152, 0.4056111, 0, 0.8156863, 1, 1,
0.04245397, -0.03948082, 2.255184, 0, 0.8078431, 1, 1,
0.04458256, 1.093001, -1.373389, 0, 0.8039216, 1, 1,
0.04629146, 0.5269833, 3.480628, 0, 0.7960784, 1, 1,
0.04808673, 0.04134811, -0.16911, 0, 0.7882353, 1, 1,
0.04845817, 2.186868, -1.766243, 0, 0.7843137, 1, 1,
0.04939367, -0.3813658, 2.54351, 0, 0.7764706, 1, 1,
0.05024285, 0.6102464, -0.2195508, 0, 0.772549, 1, 1,
0.05044555, 0.8516408, 0.9225678, 0, 0.7647059, 1, 1,
0.05096438, 1.017678, -0.239475, 0, 0.7607843, 1, 1,
0.05133535, -0.1518034, 3.525997, 0, 0.7529412, 1, 1,
0.05231928, -1.562306, 1.989171, 0, 0.7490196, 1, 1,
0.05369844, -1.847167, 3.337168, 0, 0.7411765, 1, 1,
0.05906621, -1.626747, 2.567139, 0, 0.7372549, 1, 1,
0.06694636, 0.2397596, 1.313474, 0, 0.7294118, 1, 1,
0.07167728, -0.02259591, 0.9715396, 0, 0.7254902, 1, 1,
0.07431182, 0.07063038, 0.9736649, 0, 0.7176471, 1, 1,
0.07921376, 1.540003, -0.3120331, 0, 0.7137255, 1, 1,
0.08084294, -0.04757832, 0.8437726, 0, 0.7058824, 1, 1,
0.08251061, 1.485039, -1.768561, 0, 0.6980392, 1, 1,
0.08560225, -0.9009038, 4.346867, 0, 0.6941177, 1, 1,
0.08587322, 1.227302, -0.07271709, 0, 0.6862745, 1, 1,
0.08743816, 1.284308, -0.5428346, 0, 0.682353, 1, 1,
0.08749019, -0.2055668, 2.909674, 0, 0.6745098, 1, 1,
0.08840369, -0.3357911, 3.754783, 0, 0.6705883, 1, 1,
0.09498946, 1.123845, -0.7436917, 0, 0.6627451, 1, 1,
0.09629673, -0.4712925, 4.071194, 0, 0.6588235, 1, 1,
0.1020233, -0.1233115, 1.905177, 0, 0.6509804, 1, 1,
0.1028595, -1.256846, 5.143404, 0, 0.6470588, 1, 1,
0.1032621, 0.7656615, 0.7190174, 0, 0.6392157, 1, 1,
0.1056355, -0.8361146, 2.904813, 0, 0.6352941, 1, 1,
0.112865, -0.2541754, 2.755379, 0, 0.627451, 1, 1,
0.1152596, -0.5041335, 1.758212, 0, 0.6235294, 1, 1,
0.1166198, -0.8551311, 4.621336, 0, 0.6156863, 1, 1,
0.1177651, -1.093646, 1.447803, 0, 0.6117647, 1, 1,
0.1237959, -1.156021, 2.774428, 0, 0.6039216, 1, 1,
0.1242416, -0.2096311, 3.167506, 0, 0.5960785, 1, 1,
0.1258056, 0.6964685, 0.6177701, 0, 0.5921569, 1, 1,
0.1258128, 0.05660972, 0.5161853, 0, 0.5843138, 1, 1,
0.1277926, -1.730667, 2.975045, 0, 0.5803922, 1, 1,
0.1309747, -0.09464594, 1.954534, 0, 0.572549, 1, 1,
0.131317, 0.3283059, 0.4364315, 0, 0.5686275, 1, 1,
0.1316839, 1.178337, 1.900513, 0, 0.5607843, 1, 1,
0.1331699, 0.6387291, -0.1795951, 0, 0.5568628, 1, 1,
0.1334836, 0.291124, -1.905371, 0, 0.5490196, 1, 1,
0.134517, 0.3430291, 0.4799666, 0, 0.5450981, 1, 1,
0.1389108, -0.5945788, 2.539681, 0, 0.5372549, 1, 1,
0.1390485, 1.774647, -0.500338, 0, 0.5333334, 1, 1,
0.1400788, 0.2154647, 0.2111064, 0, 0.5254902, 1, 1,
0.1414469, -0.9051575, 2.87175, 0, 0.5215687, 1, 1,
0.1427934, 1.030515, 0.06444347, 0, 0.5137255, 1, 1,
0.1463416, -0.5067557, 3.62449, 0, 0.509804, 1, 1,
0.1523039, -0.03357458, 1.238221, 0, 0.5019608, 1, 1,
0.168106, 2.755983, 0.06707285, 0, 0.4941176, 1, 1,
0.1742262, 1.339324, -0.2190637, 0, 0.4901961, 1, 1,
0.1763514, 1.49614, 0.2292043, 0, 0.4823529, 1, 1,
0.1785429, -2.553989, 3.409011, 0, 0.4784314, 1, 1,
0.1797372, -0.261278, 2.846546, 0, 0.4705882, 1, 1,
0.180573, -0.5783954, 3.595685, 0, 0.4666667, 1, 1,
0.1821294, -1.797007, 3.554367, 0, 0.4588235, 1, 1,
0.1868663, -0.7041124, 2.844584, 0, 0.454902, 1, 1,
0.1921675, 0.1007779, -0.3822556, 0, 0.4470588, 1, 1,
0.1942521, 1.286608, -0.7536076, 0, 0.4431373, 1, 1,
0.1950713, -0.5762208, 3.391241, 0, 0.4352941, 1, 1,
0.1966448, 0.4628894, 0.310338, 0, 0.4313726, 1, 1,
0.1974948, 0.1260871, 0.4507244, 0, 0.4235294, 1, 1,
0.2079109, 0.2862118, 2.503404, 0, 0.4196078, 1, 1,
0.2116967, 1.008493, -0.7061896, 0, 0.4117647, 1, 1,
0.2132489, -0.01974749, 0.4560358, 0, 0.4078431, 1, 1,
0.2172215, 0.5378665, 0.9615826, 0, 0.4, 1, 1,
0.2174532, -1.894534, 2.482261, 0, 0.3921569, 1, 1,
0.2178393, 0.3706487, -0.8110652, 0, 0.3882353, 1, 1,
0.2195004, 0.2844666, -0.9248353, 0, 0.3803922, 1, 1,
0.221209, -1.765519, 1.378062, 0, 0.3764706, 1, 1,
0.2221471, 0.7274529, 0.2931916, 0, 0.3686275, 1, 1,
0.2266996, -1.12202, 3.173808, 0, 0.3647059, 1, 1,
0.2270662, 0.4611852, -0.4055326, 0, 0.3568628, 1, 1,
0.2300305, -1.48938, 2.812824, 0, 0.3529412, 1, 1,
0.230936, 1.030825, 0.03509862, 0, 0.345098, 1, 1,
0.2333193, 1.079524, -0.7167314, 0, 0.3411765, 1, 1,
0.2337105, 0.5394236, 0.01422567, 0, 0.3333333, 1, 1,
0.2355072, -2.940461, 3.910134, 0, 0.3294118, 1, 1,
0.2359152, 0.5088607, 0.1260605, 0, 0.3215686, 1, 1,
0.236454, 0.04737037, 1.118212, 0, 0.3176471, 1, 1,
0.2368055, -0.6665404, 3.277933, 0, 0.3098039, 1, 1,
0.2427076, -0.8307994, 2.709485, 0, 0.3058824, 1, 1,
0.2427692, -0.7233428, 2.966239, 0, 0.2980392, 1, 1,
0.2429127, 1.500584, 1.554005, 0, 0.2901961, 1, 1,
0.2457024, -0.6321875, 3.177388, 0, 0.2862745, 1, 1,
0.2458185, 0.1963688, 0.7885509, 0, 0.2784314, 1, 1,
0.2471331, -0.1251846, 2.81797, 0, 0.2745098, 1, 1,
0.2477509, -1.675902, 1.744485, 0, 0.2666667, 1, 1,
0.2595641, -0.07007222, 1.319093, 0, 0.2627451, 1, 1,
0.2614139, -0.9682683, 0.8413897, 0, 0.254902, 1, 1,
0.2652556, 0.2579158, -0.3530153, 0, 0.2509804, 1, 1,
0.2653669, 0.04903344, 1.085928, 0, 0.2431373, 1, 1,
0.2676037, 0.5648657, 1.98075, 0, 0.2392157, 1, 1,
0.2690632, 0.9764412, 0.5754504, 0, 0.2313726, 1, 1,
0.2764203, -1.463036, 2.531351, 0, 0.227451, 1, 1,
0.2775854, -1.504995, 1.868071, 0, 0.2196078, 1, 1,
0.2809473, 0.9647492, 1.633096, 0, 0.2156863, 1, 1,
0.2814003, -0.5819451, 0.9985013, 0, 0.2078431, 1, 1,
0.2974895, 0.3166979, -1.765334, 0, 0.2039216, 1, 1,
0.2989247, -1.08663, 3.654007, 0, 0.1960784, 1, 1,
0.3002577, 1.109424, 0.6290101, 0, 0.1882353, 1, 1,
0.3017292, -1.25294, 2.803419, 0, 0.1843137, 1, 1,
0.3022516, -1.168909, 3.178144, 0, 0.1764706, 1, 1,
0.3027276, 1.06032, 0.8693673, 0, 0.172549, 1, 1,
0.3043049, 0.444748, -0.5203146, 0, 0.1647059, 1, 1,
0.3046786, 1.605876, 0.6675394, 0, 0.1607843, 1, 1,
0.3101111, -0.2926311, 3.836298, 0, 0.1529412, 1, 1,
0.3117956, 0.5655944, 0.1555575, 0, 0.1490196, 1, 1,
0.3135422, -0.2672929, 3.649461, 0, 0.1411765, 1, 1,
0.3136847, 0.5257558, -0.1444999, 0, 0.1372549, 1, 1,
0.3150168, 1.078457, 0.7832239, 0, 0.1294118, 1, 1,
0.3157386, 0.9946835, 0.2165886, 0, 0.1254902, 1, 1,
0.3160435, 0.8078707, 1.880663, 0, 0.1176471, 1, 1,
0.3171618, 1.43957, 0.3131294, 0, 0.1137255, 1, 1,
0.3173765, 0.3282349, -0.509482, 0, 0.1058824, 1, 1,
0.3215159, 0.1494164, 0.8699394, 0, 0.09803922, 1, 1,
0.3366864, -0.345723, 2.562471, 0, 0.09411765, 1, 1,
0.3421265, 0.344476, 2.981819, 0, 0.08627451, 1, 1,
0.343843, -0.6713789, 3.525511, 0, 0.08235294, 1, 1,
0.345309, -0.752262, 4.342648, 0, 0.07450981, 1, 1,
0.3469309, -0.840498, 2.650681, 0, 0.07058824, 1, 1,
0.348915, -0.2562154, 1.078964, 0, 0.0627451, 1, 1,
0.3490919, -0.9858534, 2.836967, 0, 0.05882353, 1, 1,
0.3567499, 0.512756, 0.1350987, 0, 0.05098039, 1, 1,
0.3596745, -0.8456311, 5.739048, 0, 0.04705882, 1, 1,
0.3668334, 0.07501132, 2.070781, 0, 0.03921569, 1, 1,
0.3701334, 1.023734, 0.4698844, 0, 0.03529412, 1, 1,
0.3719771, -1.226738, 2.123883, 0, 0.02745098, 1, 1,
0.3873975, 0.6777794, -0.5586711, 0, 0.02352941, 1, 1,
0.3902006, -1.782197, 4.610111, 0, 0.01568628, 1, 1,
0.3940486, 0.6082596, 1.006748, 0, 0.01176471, 1, 1,
0.4105693, -1.272933, 2.137279, 0, 0.003921569, 1, 1,
0.4134299, 2.595622, 2.006095, 0.003921569, 0, 1, 1,
0.4151277, -0.8084215, 3.283238, 0.007843138, 0, 1, 1,
0.4249751, -1.109143, 2.354371, 0.01568628, 0, 1, 1,
0.4274624, 0.1419681, 0.7384214, 0.01960784, 0, 1, 1,
0.4289774, -0.1843934, 1.913576, 0.02745098, 0, 1, 1,
0.4310941, 0.4445179, 0.2981344, 0.03137255, 0, 1, 1,
0.4324054, 0.8562457, 0.3443286, 0.03921569, 0, 1, 1,
0.4364871, 0.939227, -0.5618614, 0.04313726, 0, 1, 1,
0.4402131, -0.4542639, 2.625219, 0.05098039, 0, 1, 1,
0.4411968, 0.3492653, 2.517617, 0.05490196, 0, 1, 1,
0.4427409, 1.589177, -0.6557633, 0.0627451, 0, 1, 1,
0.4436678, -1.671977, 3.802771, 0.06666667, 0, 1, 1,
0.446024, 0.5057044, -0.8623818, 0.07450981, 0, 1, 1,
0.4518691, -0.4918975, 1.804075, 0.07843138, 0, 1, 1,
0.454173, 1.454474, -1.405197, 0.08627451, 0, 1, 1,
0.457389, -0.8217815, 4.334376, 0.09019608, 0, 1, 1,
0.4666975, 1.489946, 0.2679723, 0.09803922, 0, 1, 1,
0.4671853, 0.0190763, 2.26731, 0.1058824, 0, 1, 1,
0.4729855, -0.3191017, 3.491603, 0.1098039, 0, 1, 1,
0.4761108, -1.127693, 3.360517, 0.1176471, 0, 1, 1,
0.4786632, 0.07609007, 0.9939353, 0.1215686, 0, 1, 1,
0.4816992, 0.1702849, 0.7201331, 0.1294118, 0, 1, 1,
0.4846306, 0.2613173, 2.889687, 0.1333333, 0, 1, 1,
0.4863569, -0.554902, 1.506068, 0.1411765, 0, 1, 1,
0.4897209, 0.5551836, 2.167543, 0.145098, 0, 1, 1,
0.4917163, -0.9501121, 2.695325, 0.1529412, 0, 1, 1,
0.4944554, -0.3016922, 3.175897, 0.1568628, 0, 1, 1,
0.4963726, -0.409462, 0.1680314, 0.1647059, 0, 1, 1,
0.4985365, -0.8009295, 2.134408, 0.1686275, 0, 1, 1,
0.5028167, 1.077714, 1.768268, 0.1764706, 0, 1, 1,
0.5056527, 0.08109612, 2.409759, 0.1803922, 0, 1, 1,
0.5081177, 0.2490739, 0.8921306, 0.1882353, 0, 1, 1,
0.5082452, 2.34911, 0.8778167, 0.1921569, 0, 1, 1,
0.5087958, -1.795259, 3.419266, 0.2, 0, 1, 1,
0.513988, 0.7149208, 0.841409, 0.2078431, 0, 1, 1,
0.5243976, -1.369728, 3.088588, 0.2117647, 0, 1, 1,
0.5289609, 0.8284611, 1.299268, 0.2196078, 0, 1, 1,
0.5347301, -0.199268, 1.821834, 0.2235294, 0, 1, 1,
0.5409714, -0.3939244, 3.06115, 0.2313726, 0, 1, 1,
0.5472851, -0.02839265, 1.925827, 0.2352941, 0, 1, 1,
0.5482146, -2.765022, 2.793583, 0.2431373, 0, 1, 1,
0.5543717, -0.8020717, 1.664436, 0.2470588, 0, 1, 1,
0.5563874, 0.02985757, 1.397335, 0.254902, 0, 1, 1,
0.5574793, 0.3611914, 0.5637067, 0.2588235, 0, 1, 1,
0.5645005, 0.1530978, 1.9101, 0.2666667, 0, 1, 1,
0.5750436, -2.571856, 2.158616, 0.2705882, 0, 1, 1,
0.5766573, -0.06324732, 1.673779, 0.2784314, 0, 1, 1,
0.5779005, -1.060927, 3.963623, 0.282353, 0, 1, 1,
0.5806757, -0.5230823, 3.16482, 0.2901961, 0, 1, 1,
0.5815621, 1.851297, 1.080058, 0.2941177, 0, 1, 1,
0.5859568, -1.145521, 4.276757, 0.3019608, 0, 1, 1,
0.5903112, -1.168916, 2.509185, 0.3098039, 0, 1, 1,
0.5971708, -0.890837, 4.485251, 0.3137255, 0, 1, 1,
0.5987368, -0.159394, 3.57258, 0.3215686, 0, 1, 1,
0.6027791, -1.339628, 2.607395, 0.3254902, 0, 1, 1,
0.6043765, 1.430822, 0.6231237, 0.3333333, 0, 1, 1,
0.6052715, 1.741694, 1.347553, 0.3372549, 0, 1, 1,
0.6057919, 0.08585578, 2.550026, 0.345098, 0, 1, 1,
0.6103094, -0.03488846, 0.6237409, 0.3490196, 0, 1, 1,
0.6134302, 0.2469293, 0.6791031, 0.3568628, 0, 1, 1,
0.6155874, -0.2643123, 1.272793, 0.3607843, 0, 1, 1,
0.6157582, -1.289591, 3.000041, 0.3686275, 0, 1, 1,
0.6166261, 0.1755223, 3.265112, 0.372549, 0, 1, 1,
0.6167893, 0.3921776, 1.253846, 0.3803922, 0, 1, 1,
0.6175038, 0.4162509, 0.4847981, 0.3843137, 0, 1, 1,
0.6285219, 1.692046, 0.7663625, 0.3921569, 0, 1, 1,
0.6289914, 0.3190468, -0.03460917, 0.3960784, 0, 1, 1,
0.6294292, 0.5682901, 1.902278, 0.4039216, 0, 1, 1,
0.6306195, -1.230687, 1.656407, 0.4117647, 0, 1, 1,
0.6308369, 0.2006663, 1.218822, 0.4156863, 0, 1, 1,
0.6351113, -0.4260434, 2.893852, 0.4235294, 0, 1, 1,
0.6352485, -0.972919, 2.709175, 0.427451, 0, 1, 1,
0.6436995, 0.1940469, 0.9480146, 0.4352941, 0, 1, 1,
0.6451575, -0.4933736, 0.4507032, 0.4392157, 0, 1, 1,
0.6495682, 0.2933265, 0.8441501, 0.4470588, 0, 1, 1,
0.6533174, -2.059639, 3.731692, 0.4509804, 0, 1, 1,
0.6552962, 2.375159, -0.9824447, 0.4588235, 0, 1, 1,
0.65545, 1.387331, 0.9565235, 0.4627451, 0, 1, 1,
0.6574658, 0.1499156, 2.367848, 0.4705882, 0, 1, 1,
0.6576142, -0.5382566, 2.130548, 0.4745098, 0, 1, 1,
0.657727, 0.8274549, -0.9045969, 0.4823529, 0, 1, 1,
0.6591858, -1.642215, 5.276526, 0.4862745, 0, 1, 1,
0.6597065, -0.6962296, 3.13436, 0.4941176, 0, 1, 1,
0.6733156, 0.8002977, -0.008861403, 0.5019608, 0, 1, 1,
0.6745769, 1.432837, -0.00658992, 0.5058824, 0, 1, 1,
0.6789001, -0.1427069, 2.487231, 0.5137255, 0, 1, 1,
0.6857702, -0.5274184, 1.758909, 0.5176471, 0, 1, 1,
0.6904426, 0.08066151, 1.544188, 0.5254902, 0, 1, 1,
0.6938418, -0.08083377, -0.1965574, 0.5294118, 0, 1, 1,
0.6983609, -0.6336478, 2.008041, 0.5372549, 0, 1, 1,
0.6983886, -0.3889146, 2.166393, 0.5411765, 0, 1, 1,
0.7022664, -1.826102, 1.977792, 0.5490196, 0, 1, 1,
0.7069009, -0.0271645, 2.354219, 0.5529412, 0, 1, 1,
0.7111239, 0.4921314, 1.772891, 0.5607843, 0, 1, 1,
0.7116194, -0.3821323, 1.030608, 0.5647059, 0, 1, 1,
0.71253, 1.198185, 0.9633369, 0.572549, 0, 1, 1,
0.7182332, 1.665715, -0.01348654, 0.5764706, 0, 1, 1,
0.7237854, -0.8178123, -0.249794, 0.5843138, 0, 1, 1,
0.7238159, 0.146977, 0.8412336, 0.5882353, 0, 1, 1,
0.724628, -0.1782711, 1.982582, 0.5960785, 0, 1, 1,
0.7275444, 0.6731314, 0.2594266, 0.6039216, 0, 1, 1,
0.7288287, 0.5187991, 1.648088, 0.6078432, 0, 1, 1,
0.7298715, -0.4916295, 2.870844, 0.6156863, 0, 1, 1,
0.7310672, 1.032798, 0.4255707, 0.6196079, 0, 1, 1,
0.7339409, 0.0254404, 0.8750957, 0.627451, 0, 1, 1,
0.7346932, 0.6298867, 1.375868, 0.6313726, 0, 1, 1,
0.7372515, 0.8414521, 0.6321737, 0.6392157, 0, 1, 1,
0.7380401, 0.1405929, 0.4705262, 0.6431373, 0, 1, 1,
0.7427847, -1.257878, 1.606945, 0.6509804, 0, 1, 1,
0.7448716, 1.196543, 0.3990638, 0.654902, 0, 1, 1,
0.7455102, 0.548875, 0.3363172, 0.6627451, 0, 1, 1,
0.7502163, -1.666008, 2.38137, 0.6666667, 0, 1, 1,
0.7516815, 0.2072552, 2.611127, 0.6745098, 0, 1, 1,
0.7585413, -0.8206463, 1.899122, 0.6784314, 0, 1, 1,
0.7600913, -1.76425, 3.402701, 0.6862745, 0, 1, 1,
0.7634655, 0.3983429, 1.411878, 0.6901961, 0, 1, 1,
0.7643357, 1.306198, 2.177916, 0.6980392, 0, 1, 1,
0.7764226, 0.03065356, 2.82829, 0.7058824, 0, 1, 1,
0.7769642, -0.5191392, 1.947878, 0.7098039, 0, 1, 1,
0.7796227, 0.3154923, 1.852176, 0.7176471, 0, 1, 1,
0.7908031, 1.465129, -0.1499694, 0.7215686, 0, 1, 1,
0.7980644, 0.8363266, 0.1657809, 0.7294118, 0, 1, 1,
0.7997267, 1.148777, -0.8219302, 0.7333333, 0, 1, 1,
0.8039422, 0.3182586, 1.422355, 0.7411765, 0, 1, 1,
0.806829, -0.4727468, 3.421563, 0.7450981, 0, 1, 1,
0.8080397, -1.470669, 3.674618, 0.7529412, 0, 1, 1,
0.8115804, -2.426316, 4.985883, 0.7568628, 0, 1, 1,
0.8197236, -0.2507319, 2.714336, 0.7647059, 0, 1, 1,
0.8205363, -1.900597, 2.497652, 0.7686275, 0, 1, 1,
0.8393704, 1.166557, -0.0944184, 0.7764706, 0, 1, 1,
0.8399544, -0.5585091, 2.122307, 0.7803922, 0, 1, 1,
0.8465983, 0.1455164, 1.2976, 0.7882353, 0, 1, 1,
0.8478606, 0.1079594, 1.174589, 0.7921569, 0, 1, 1,
0.8507112, 0.1676116, 0.7016247, 0.8, 0, 1, 1,
0.8551529, 0.1623275, 0.5163997, 0.8078431, 0, 1, 1,
0.8558222, -1.995743, 3.737702, 0.8117647, 0, 1, 1,
0.8564256, 0.3576931, 0.9878298, 0.8196079, 0, 1, 1,
0.8567402, -0.3982177, 3.946874, 0.8235294, 0, 1, 1,
0.8580494, -0.3194438, 2.397041, 0.8313726, 0, 1, 1,
0.8661285, -0.7394322, 2.211233, 0.8352941, 0, 1, 1,
0.8701144, -0.627239, 0.4924745, 0.8431373, 0, 1, 1,
0.8716527, -0.1468555, 0.9692159, 0.8470588, 0, 1, 1,
0.8774502, -0.01005723, 0.8487878, 0.854902, 0, 1, 1,
0.8792028, 1.284472, 0.2062727, 0.8588235, 0, 1, 1,
0.8805283, 1.346282, 0.5071596, 0.8666667, 0, 1, 1,
0.8879213, 0.9013584, 0.8561691, 0.8705882, 0, 1, 1,
0.8931528, 0.6958644, -1.869442, 0.8784314, 0, 1, 1,
0.8976784, -1.302042, 3.676637, 0.8823529, 0, 1, 1,
0.9044743, -0.3686648, 1.360544, 0.8901961, 0, 1, 1,
0.9084515, -0.8401515, 3.069571, 0.8941177, 0, 1, 1,
0.9092914, 0.4652039, 1.105887, 0.9019608, 0, 1, 1,
0.9102326, 0.5621693, 0.2635765, 0.9098039, 0, 1, 1,
0.9129835, -0.1945325, 1.961373, 0.9137255, 0, 1, 1,
0.9232012, 0.3417674, -0.2220698, 0.9215686, 0, 1, 1,
0.924191, 0.3153332, 0.7561429, 0.9254902, 0, 1, 1,
0.9244142, -1.457192, 0.8556266, 0.9333333, 0, 1, 1,
0.9255422, 0.6939812, 1.56704, 0.9372549, 0, 1, 1,
0.9297134, 0.9812944, 0.2897761, 0.945098, 0, 1, 1,
0.9317386, -0.6117744, 2.735884, 0.9490196, 0, 1, 1,
0.9385448, -0.513284, 1.595136, 0.9568627, 0, 1, 1,
0.9455772, -2.173481, 1.445209, 0.9607843, 0, 1, 1,
0.945601, 1.065447, 0.8565025, 0.9686275, 0, 1, 1,
0.9463125, 0.8742213, 0.5366461, 0.972549, 0, 1, 1,
0.9530012, -0.01599505, 3.33873, 0.9803922, 0, 1, 1,
0.955122, -1.45415, 2.656255, 0.9843137, 0, 1, 1,
0.9595577, -0.3342284, 1.63466, 0.9921569, 0, 1, 1,
0.9707015, -1.000512, 3.836193, 0.9960784, 0, 1, 1,
0.971213, -1.438033, 2.548137, 1, 0, 0.9960784, 1,
0.9719357, -1.533013, 1.609792, 1, 0, 0.9882353, 1,
0.9727607, 0.9464695, 1.835805, 1, 0, 0.9843137, 1,
0.9778842, -0.4925413, 1.473511, 1, 0, 0.9764706, 1,
0.9793676, -2.074268, 3.488418, 1, 0, 0.972549, 1,
0.9803609, -0.2711369, 2.027452, 1, 0, 0.9647059, 1,
0.9820462, 0.457388, -0.9956565, 1, 0, 0.9607843, 1,
0.9822727, -0.9165576, 0.9898075, 1, 0, 0.9529412, 1,
0.9946684, 0.9100598, -0.351397, 1, 0, 0.9490196, 1,
0.9961616, -0.4461046, 3.338276, 1, 0, 0.9411765, 1,
0.9971337, -1.388146, 4.045722, 1, 0, 0.9372549, 1,
1.017526, -0.4608494, 1.279212, 1, 0, 0.9294118, 1,
1.028654, 0.9301102, 1.403856, 1, 0, 0.9254902, 1,
1.037618, -1.815702, 2.076771, 1, 0, 0.9176471, 1,
1.038037, 0.8474134, 0.1100873, 1, 0, 0.9137255, 1,
1.040719, 0.9349383, 1.392945, 1, 0, 0.9058824, 1,
1.043332, -0.6482633, 2.960463, 1, 0, 0.9019608, 1,
1.050921, 1.60362, 1.732001, 1, 0, 0.8941177, 1,
1.05122, 0.8291705, 1.823774, 1, 0, 0.8862745, 1,
1.053104, -1.071818, 0.9504401, 1, 0, 0.8823529, 1,
1.054791, 0.982857, 2.002647, 1, 0, 0.8745098, 1,
1.057946, 0.8504477, 1.097215, 1, 0, 0.8705882, 1,
1.058866, -0.6896469, 4.381508, 1, 0, 0.8627451, 1,
1.0683, 1.188678, 1.802503, 1, 0, 0.8588235, 1,
1.068479, 1.746709, -0.6377, 1, 0, 0.8509804, 1,
1.083745, -0.517491, 1.957855, 1, 0, 0.8470588, 1,
1.092501, -0.4602676, 2.627555, 1, 0, 0.8392157, 1,
1.097161, -1.218448, 2.620974, 1, 0, 0.8352941, 1,
1.107308, -0.7702825, 1.667468, 1, 0, 0.827451, 1,
1.124852, 0.1942059, 3.93406, 1, 0, 0.8235294, 1,
1.125454, 0.6484182, 0.5958121, 1, 0, 0.8156863, 1,
1.128695, -0.03458999, 2.41291, 1, 0, 0.8117647, 1,
1.133201, 0.4169777, 2.08336, 1, 0, 0.8039216, 1,
1.141573, -1.315614, 3.042072, 1, 0, 0.7960784, 1,
1.142655, 2.08691, -0.06995039, 1, 0, 0.7921569, 1,
1.142831, -0.06807857, 0.6023866, 1, 0, 0.7843137, 1,
1.147768, 2.294607, 0.09533614, 1, 0, 0.7803922, 1,
1.155437, -0.6306126, 2.286978, 1, 0, 0.772549, 1,
1.169451, -0.4800584, 2.660911, 1, 0, 0.7686275, 1,
1.173299, -0.3935564, 1.898828, 1, 0, 0.7607843, 1,
1.173776, -0.8399377, 4.330002, 1, 0, 0.7568628, 1,
1.174818, 0.4597466, 1.710462, 1, 0, 0.7490196, 1,
1.178259, 0.6041017, 1.135791, 1, 0, 0.7450981, 1,
1.179016, 1.588439, 0.6977165, 1, 0, 0.7372549, 1,
1.179922, 0.2174968, 1.425773, 1, 0, 0.7333333, 1,
1.183639, 1.342857, 1.246513, 1, 0, 0.7254902, 1,
1.183889, -0.2134554, 1.34355, 1, 0, 0.7215686, 1,
1.189348, 0.2507143, 0.8719585, 1, 0, 0.7137255, 1,
1.189719, 0.5225508, 1.874508, 1, 0, 0.7098039, 1,
1.190212, -0.00559102, 0.418074, 1, 0, 0.7019608, 1,
1.192145, 0.7070552, 2.058643, 1, 0, 0.6941177, 1,
1.195953, 0.7931448, 0.2550007, 1, 0, 0.6901961, 1,
1.210194, 0.2305744, 1.245187, 1, 0, 0.682353, 1,
1.217015, -0.9068744, 0.7806888, 1, 0, 0.6784314, 1,
1.222825, -0.2237144, 1.734145, 1, 0, 0.6705883, 1,
1.224899, -0.09862891, 1.327705, 1, 0, 0.6666667, 1,
1.233049, 0.6854922, 0.03007462, 1, 0, 0.6588235, 1,
1.268387, -1.346858, 2.353631, 1, 0, 0.654902, 1,
1.275198, 0.8135649, 0.01805853, 1, 0, 0.6470588, 1,
1.276331, 0.7879753, 1.610451, 1, 0, 0.6431373, 1,
1.284091, -0.8685385, 0.4670797, 1, 0, 0.6352941, 1,
1.297124, 1.140327, 0.6405464, 1, 0, 0.6313726, 1,
1.312652, -0.01585224, 1.586165, 1, 0, 0.6235294, 1,
1.345627, 1.233094, 0.2720008, 1, 0, 0.6196079, 1,
1.351848, -0.006749933, 0.1970933, 1, 0, 0.6117647, 1,
1.354235, 1.322896, 1.095739, 1, 0, 0.6078432, 1,
1.354469, 1.624399, 0.3782237, 1, 0, 0.6, 1,
1.354482, 0.8505372, 1.359169, 1, 0, 0.5921569, 1,
1.358053, 1.449367, 2.496513, 1, 0, 0.5882353, 1,
1.364389, -0.7191887, 2.85694, 1, 0, 0.5803922, 1,
1.372155, 0.09573025, 1.351051, 1, 0, 0.5764706, 1,
1.38294, -0.5629654, 1.446532, 1, 0, 0.5686275, 1,
1.391441, 0.6488151, 1.152519, 1, 0, 0.5647059, 1,
1.400586, -1.927382, 3.592833, 1, 0, 0.5568628, 1,
1.403623, 0.2199016, 0.4038274, 1, 0, 0.5529412, 1,
1.404251, -0.1317987, -0.09790836, 1, 0, 0.5450981, 1,
1.428165, -2.064147, 2.647241, 1, 0, 0.5411765, 1,
1.438403, 0.09327606, 3.077768, 1, 0, 0.5333334, 1,
1.457291, -0.7961327, 1.364438, 1, 0, 0.5294118, 1,
1.458804, 0.4760466, 0.3991626, 1, 0, 0.5215687, 1,
1.476176, 0.6830896, 1.57645, 1, 0, 0.5176471, 1,
1.480716, 0.8641452, 1.505002, 1, 0, 0.509804, 1,
1.486866, 1.227985, 2.222367, 1, 0, 0.5058824, 1,
1.487118, -0.504807, 0.5678749, 1, 0, 0.4980392, 1,
1.495353, 1.05203, 0.5281342, 1, 0, 0.4901961, 1,
1.49751, -1.663336, 1.192247, 1, 0, 0.4862745, 1,
1.501105, -1.45755, 3.787115, 1, 0, 0.4784314, 1,
1.519978, 0.04733152, 0.8821287, 1, 0, 0.4745098, 1,
1.534094, 0.5370173, 1.686216, 1, 0, 0.4666667, 1,
1.535639, -0.3583548, 2.952503, 1, 0, 0.4627451, 1,
1.542873, -0.6279191, 1.760948, 1, 0, 0.454902, 1,
1.563463, -1.20402, 1.752849, 1, 0, 0.4509804, 1,
1.563478, 0.6107686, -0.6865966, 1, 0, 0.4431373, 1,
1.563949, -1.830058, 3.353817, 1, 0, 0.4392157, 1,
1.567078, -1.571892, 0.4377607, 1, 0, 0.4313726, 1,
1.576338, 1.217583, 0.6607044, 1, 0, 0.427451, 1,
1.586992, 0.9012497, 1.397543, 1, 0, 0.4196078, 1,
1.589785, 0.5551147, 1.210861, 1, 0, 0.4156863, 1,
1.591093, -0.918635, 2.438275, 1, 0, 0.4078431, 1,
1.594273, 1.267688, 2.102103, 1, 0, 0.4039216, 1,
1.598796, -1.044858, 2.528955, 1, 0, 0.3960784, 1,
1.609708, -0.7306457, 2.128657, 1, 0, 0.3882353, 1,
1.612406, -0.08764691, 0.6671968, 1, 0, 0.3843137, 1,
1.613334, 0.9360496, 1.623132, 1, 0, 0.3764706, 1,
1.61415, -0.01458201, 2.335076, 1, 0, 0.372549, 1,
1.616527, -1.516807, 1.064659, 1, 0, 0.3647059, 1,
1.624929, 0.2969112, 1.417269, 1, 0, 0.3607843, 1,
1.634222, 0.1793547, 1.422698, 1, 0, 0.3529412, 1,
1.656276, -0.3323979, 2.66273, 1, 0, 0.3490196, 1,
1.659057, 0.3134068, -0.1270807, 1, 0, 0.3411765, 1,
1.659303, 0.02945499, 3.195899, 1, 0, 0.3372549, 1,
1.659513, 1.063674, 1.431461, 1, 0, 0.3294118, 1,
1.66993, -0.1044005, 1.720455, 1, 0, 0.3254902, 1,
1.674324, 0.2630885, 2.047196, 1, 0, 0.3176471, 1,
1.699038, -0.5267621, 1.73767, 1, 0, 0.3137255, 1,
1.69924, -0.8412057, 2.773075, 1, 0, 0.3058824, 1,
1.711243, -0.5703726, 0.8882419, 1, 0, 0.2980392, 1,
1.727046, -0.778587, -0.6171993, 1, 0, 0.2941177, 1,
1.731624, 2.540774, 0.8280815, 1, 0, 0.2862745, 1,
1.754139, 0.9029336, -0.4619961, 1, 0, 0.282353, 1,
1.772035, 0.1647771, 1.785174, 1, 0, 0.2745098, 1,
1.775624, -0.06741606, 0.6945208, 1, 0, 0.2705882, 1,
1.781821, 1.28189, 0.3744801, 1, 0, 0.2627451, 1,
1.784483, -1.219828, 3.092336, 1, 0, 0.2588235, 1,
1.790617, -0.5151264, 3.599151, 1, 0, 0.2509804, 1,
1.800519, -0.7871004, 0.3985828, 1, 0, 0.2470588, 1,
1.806557, 1.68544, 2.227042, 1, 0, 0.2392157, 1,
1.810843, 0.8861762, 0.8305102, 1, 0, 0.2352941, 1,
1.817994, 0.2552508, 0.7894552, 1, 0, 0.227451, 1,
1.820683, -1.89542, 2.447365, 1, 0, 0.2235294, 1,
1.82163, 1.673798, 1.95835, 1, 0, 0.2156863, 1,
1.825219, 0.5386893, 1.004139, 1, 0, 0.2117647, 1,
1.826137, -1.38093, 1.210083, 1, 0, 0.2039216, 1,
1.828033, -0.8513842, 1.288767, 1, 0, 0.1960784, 1,
1.843785, -1.262789, 1.642917, 1, 0, 0.1921569, 1,
1.867495, -0.104901, 2.952427, 1, 0, 0.1843137, 1,
1.901268, 0.7383108, 1.116863, 1, 0, 0.1803922, 1,
1.978747, -0.6844603, 1.312114, 1, 0, 0.172549, 1,
2.019491, 1.011245, 1.767025, 1, 0, 0.1686275, 1,
2.025412, -0.1132034, 0.6568832, 1, 0, 0.1607843, 1,
2.027369, 0.08296166, 2.656754, 1, 0, 0.1568628, 1,
2.03475, -0.3380761, 0.005494962, 1, 0, 0.1490196, 1,
2.065896, 0.6252966, 1.703874, 1, 0, 0.145098, 1,
2.071471, -0.781095, 2.076196, 1, 0, 0.1372549, 1,
2.073618, -1.092061, -0.4010789, 1, 0, 0.1333333, 1,
2.080341, -0.4675816, 1.878245, 1, 0, 0.1254902, 1,
2.100847, -0.983112, 1.949284, 1, 0, 0.1215686, 1,
2.13414, 0.3542974, 2.601822, 1, 0, 0.1137255, 1,
2.167822, 0.5612229, 2.455745, 1, 0, 0.1098039, 1,
2.237259, 0.7131536, 2.649503, 1, 0, 0.1019608, 1,
2.238441, 0.02462693, 0.1707199, 1, 0, 0.09411765, 1,
2.264266, 0.3593041, 1.810712, 1, 0, 0.09019608, 1,
2.269774, 1.693295, 1.402322, 1, 0, 0.08235294, 1,
2.305998, 0.2520853, 2.135179, 1, 0, 0.07843138, 1,
2.312703, -1.406682, 2.178936, 1, 0, 0.07058824, 1,
2.359033, -1.335098, 2.212939, 1, 0, 0.06666667, 1,
2.43292, 0.1641886, 3.13084, 1, 0, 0.05882353, 1,
2.485398, -1.551605, 0.5688412, 1, 0, 0.05490196, 1,
2.500419, -0.09423418, 2.033314, 1, 0, 0.04705882, 1,
2.541357, -0.2310179, 2.405414, 1, 0, 0.04313726, 1,
2.637441, -1.010092, 2.538263, 1, 0, 0.03529412, 1,
2.821591, -1.187805, 3.352566, 1, 0, 0.03137255, 1,
3.013547, -1.579333, 2.713823, 1, 0, 0.02352941, 1,
3.062397, 1.754368, 0.8983217, 1, 0, 0.01960784, 1,
3.374818, 0.1423327, 1.690076, 1, 0, 0.01176471, 1,
3.854267, -0.7755502, 2.280335, 1, 0, 0.007843138, 1
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
0.1706697, -3.972683, -8.338907, 0, -0.5, 0.5, 0.5,
0.1706697, -3.972683, -8.338907, 1, -0.5, 0.5, 0.5,
0.1706697, -3.972683, -8.338907, 1, 1.5, 0.5, 0.5,
0.1706697, -3.972683, -8.338907, 0, 1.5, 0.5, 0.5
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
-4.761668, -0.1207447, -8.338907, 0, -0.5, 0.5, 0.5,
-4.761668, -0.1207447, -8.338907, 1, -0.5, 0.5, 0.5,
-4.761668, -0.1207447, -8.338907, 1, 1.5, 0.5, 0.5,
-4.761668, -0.1207447, -8.338907, 0, 1.5, 0.5, 0.5
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
-4.761668, -3.972683, -0.2797441, 0, -0.5, 0.5, 0.5,
-4.761668, -3.972683, -0.2797441, 1, -0.5, 0.5, 0.5,
-4.761668, -3.972683, -0.2797441, 1, 1.5, 0.5, 0.5,
-4.761668, -3.972683, -0.2797441, 0, 1.5, 0.5, 0.5
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
-2, -3.083774, -6.4791,
2, -3.083774, -6.4791,
-2, -3.083774, -6.4791,
-2, -3.231925, -6.789068,
0, -3.083774, -6.4791,
0, -3.231925, -6.789068,
2, -3.083774, -6.4791,
2, -3.231925, -6.789068
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
"-2",
"0",
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
-2, -3.528229, -7.409003, 0, -0.5, 0.5, 0.5,
-2, -3.528229, -7.409003, 1, -0.5, 0.5, 0.5,
-2, -3.528229, -7.409003, 1, 1.5, 0.5, 0.5,
-2, -3.528229, -7.409003, 0, 1.5, 0.5, 0.5,
0, -3.528229, -7.409003, 0, -0.5, 0.5, 0.5,
0, -3.528229, -7.409003, 1, -0.5, 0.5, 0.5,
0, -3.528229, -7.409003, 1, 1.5, 0.5, 0.5,
0, -3.528229, -7.409003, 0, 1.5, 0.5, 0.5,
2, -3.528229, -7.409003, 0, -0.5, 0.5, 0.5,
2, -3.528229, -7.409003, 1, -0.5, 0.5, 0.5,
2, -3.528229, -7.409003, 1, 1.5, 0.5, 0.5,
2, -3.528229, -7.409003, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.623436, -2, -6.4791,
-3.623436, 2, -6.4791,
-3.623436, -2, -6.4791,
-3.813141, -2, -6.789068,
-3.623436, -1, -6.4791,
-3.813141, -1, -6.789068,
-3.623436, 0, -6.4791,
-3.813141, 0, -6.789068,
-3.623436, 1, -6.4791,
-3.813141, 1, -6.789068,
-3.623436, 2, -6.4791,
-3.813141, 2, -6.789068
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
"2"
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
-4.192552, -2, -7.409003, 0, -0.5, 0.5, 0.5,
-4.192552, -2, -7.409003, 1, -0.5, 0.5, 0.5,
-4.192552, -2, -7.409003, 1, 1.5, 0.5, 0.5,
-4.192552, -2, -7.409003, 0, 1.5, 0.5, 0.5,
-4.192552, -1, -7.409003, 0, -0.5, 0.5, 0.5,
-4.192552, -1, -7.409003, 1, -0.5, 0.5, 0.5,
-4.192552, -1, -7.409003, 1, 1.5, 0.5, 0.5,
-4.192552, -1, -7.409003, 0, 1.5, 0.5, 0.5,
-4.192552, 0, -7.409003, 0, -0.5, 0.5, 0.5,
-4.192552, 0, -7.409003, 1, -0.5, 0.5, 0.5,
-4.192552, 0, -7.409003, 1, 1.5, 0.5, 0.5,
-4.192552, 0, -7.409003, 0, 1.5, 0.5, 0.5,
-4.192552, 1, -7.409003, 0, -0.5, 0.5, 0.5,
-4.192552, 1, -7.409003, 1, -0.5, 0.5, 0.5,
-4.192552, 1, -7.409003, 1, 1.5, 0.5, 0.5,
-4.192552, 1, -7.409003, 0, 1.5, 0.5, 0.5,
-4.192552, 2, -7.409003, 0, -0.5, 0.5, 0.5,
-4.192552, 2, -7.409003, 1, -0.5, 0.5, 0.5,
-4.192552, 2, -7.409003, 1, 1.5, 0.5, 0.5,
-4.192552, 2, -7.409003, 0, 1.5, 0.5, 0.5
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
-3.623436, -3.083774, -6,
-3.623436, -3.083774, 4,
-3.623436, -3.083774, -6,
-3.813141, -3.231925, -6,
-3.623436, -3.083774, -4,
-3.813141, -3.231925, -4,
-3.623436, -3.083774, -2,
-3.813141, -3.231925, -2,
-3.623436, -3.083774, 0,
-3.813141, -3.231925, 0,
-3.623436, -3.083774, 2,
-3.813141, -3.231925, 2,
-3.623436, -3.083774, 4,
-3.813141, -3.231925, 4
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
"-6",
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
-4.192552, -3.528229, -6, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -6, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -6, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, -6, 0, 1.5, 0.5, 0.5,
-4.192552, -3.528229, -4, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -4, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -4, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, -4, 0, 1.5, 0.5, 0.5,
-4.192552, -3.528229, -2, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -2, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, -2, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, -2, 0, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 0, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 0, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 0, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 0, 0, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 2, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 2, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 2, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 2, 0, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 4, 0, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 4, 1, -0.5, 0.5, 0.5,
-4.192552, -3.528229, 4, 1, 1.5, 0.5, 0.5,
-4.192552, -3.528229, 4, 0, 1.5, 0.5, 0.5
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
-3.623436, -3.083774, -6.4791,
-3.623436, 2.842285, -6.4791,
-3.623436, -3.083774, 5.919612,
-3.623436, 2.842285, 5.919612,
-3.623436, -3.083774, -6.4791,
-3.623436, -3.083774, 5.919612,
-3.623436, 2.842285, -6.4791,
-3.623436, 2.842285, 5.919612,
-3.623436, -3.083774, -6.4791,
3.964775, -3.083774, -6.4791,
-3.623436, -3.083774, 5.919612,
3.964775, -3.083774, 5.919612,
-3.623436, 2.842285, -6.4791,
3.964775, 2.842285, -6.4791,
-3.623436, 2.842285, 5.919612,
3.964775, 2.842285, 5.919612,
3.964775, -3.083774, -6.4791,
3.964775, 2.842285, -6.4791,
3.964775, -3.083774, 5.919612,
3.964775, 2.842285, 5.919612,
3.964775, -3.083774, -6.4791,
3.964775, -3.083774, 5.919612,
3.964775, 2.842285, -6.4791,
3.964775, 2.842285, 5.919612
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
var radius = 8.382427;
var distance = 37.29436;
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
mvMatrix.translate( -0.1706697, 0.1207447, 0.2797441 );
mvMatrix.scale( 1.194385, 1.529388, 0.7309827 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.29436);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Nitroguanidin<-read.table("Nitroguanidin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Nitroguanidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
```

```r
y<-Nitroguanidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
```

```r
z<-Nitroguanidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitroguanidin' not found
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
-3.512928, -1.054045, -2.215742, 0, 0, 1, 1, 1,
-3.346943, 0.6055289, -0.0640813, 1, 0, 0, 1, 1,
-3.271106, 2.103746, -0.7634614, 1, 0, 0, 1, 1,
-2.939416, -0.7059964, -1.44781, 1, 0, 0, 1, 1,
-2.631979, -0.7400187, -0.4555152, 1, 0, 0, 1, 1,
-2.602317, -0.6560963, -3.705681, 1, 0, 0, 1, 1,
-2.513164, -2.008308, -1.685605, 0, 0, 0, 1, 1,
-2.473926, -0.6942498, -1.737765, 0, 0, 0, 1, 1,
-2.460093, -1.265955, -1.216425, 0, 0, 0, 1, 1,
-2.428726, -0.3627395, -3.344748, 0, 0, 0, 1, 1,
-2.335071, 1.397234, 0.2064653, 0, 0, 0, 1, 1,
-2.32396, -0.8358662, -3.059088, 0, 0, 0, 1, 1,
-2.269792, -1.066616, -3.094514, 0, 0, 0, 1, 1,
-2.26205, -0.7365611, -1.337909, 1, 1, 1, 1, 1,
-2.191698, -2.750716, -2.379389, 1, 1, 1, 1, 1,
-2.158947, -0.2033677, -0.9710158, 1, 1, 1, 1, 1,
-2.153303, -0.321714, -2.408083, 1, 1, 1, 1, 1,
-2.064437, 1.276865, 0.1826519, 1, 1, 1, 1, 1,
-2.045556, 1.578202, -1.241809, 1, 1, 1, 1, 1,
-2.042794, -1.101478, -0.8010643, 1, 1, 1, 1, 1,
-1.995061, 0.18152, -1.227537, 1, 1, 1, 1, 1,
-1.991947, -0.9172755, -2.598695, 1, 1, 1, 1, 1,
-1.990166, 1.535079, 1.057255, 1, 1, 1, 1, 1,
-1.91897, 0.714497, -2.313585, 1, 1, 1, 1, 1,
-1.905794, 2.57925, -0.9076532, 1, 1, 1, 1, 1,
-1.903017, 0.2611765, -0.8117062, 1, 1, 1, 1, 1,
-1.902523, -0.7149655, -3.166485, 1, 1, 1, 1, 1,
-1.898132, -0.4297926, 0.01828286, 1, 1, 1, 1, 1,
-1.887907, 1.313563, -0.430925, 0, 0, 1, 1, 1,
-1.874179, 0.1781558, -0.6029039, 1, 0, 0, 1, 1,
-1.871091, 1.0065, 0.50996, 1, 0, 0, 1, 1,
-1.869876, 0.2532527, -2.863336, 1, 0, 0, 1, 1,
-1.848251, 0.2288428, -0.491604, 1, 0, 0, 1, 1,
-1.847481, 0.482471, -0.4981026, 1, 0, 0, 1, 1,
-1.839001, 0.129487, -1.266085, 0, 0, 0, 1, 1,
-1.804617, -0.104666, -1.537743, 0, 0, 0, 1, 1,
-1.794615, -0.08460106, -2.784731, 0, 0, 0, 1, 1,
-1.782853, 0.6993932, -1.45018, 0, 0, 0, 1, 1,
-1.768873, 1.466188, -2.672584, 0, 0, 0, 1, 1,
-1.763196, -1.543997, -4.580218, 0, 0, 0, 1, 1,
-1.759386, -1.48578, -3.008036, 0, 0, 0, 1, 1,
-1.75465, 0.8556355, -1.084663, 1, 1, 1, 1, 1,
-1.752054, -0.4514242, -0.7098535, 1, 1, 1, 1, 1,
-1.743878, -1.410934, -3.451144, 1, 1, 1, 1, 1,
-1.737795, 0.5071705, -1.079555, 1, 1, 1, 1, 1,
-1.71832, 1.56799, -0.2621293, 1, 1, 1, 1, 1,
-1.717026, -0.8140844, -1.738821, 1, 1, 1, 1, 1,
-1.709498, 0.1988639, -2.230079, 1, 1, 1, 1, 1,
-1.706248, 0.01152643, -2.198205, 1, 1, 1, 1, 1,
-1.705637, -0.1092836, -2.651135, 1, 1, 1, 1, 1,
-1.682094, 0.8252187, -1.384891, 1, 1, 1, 1, 1,
-1.67785, 0.4533093, -2.091206, 1, 1, 1, 1, 1,
-1.67722, 1.092375, -1.156699, 1, 1, 1, 1, 1,
-1.658097, 1.294382, -1.817333, 1, 1, 1, 1, 1,
-1.650391, -0.2096791, -1.93512, 1, 1, 1, 1, 1,
-1.64835, 0.7102454, -2.050385, 1, 1, 1, 1, 1,
-1.635255, 0.2505953, 0.5447454, 0, 0, 1, 1, 1,
-1.622991, 1.04361, -1.766044, 1, 0, 0, 1, 1,
-1.618716, -0.8389099, -1.392203, 1, 0, 0, 1, 1,
-1.616107, -0.5627911, -1.612968, 1, 0, 0, 1, 1,
-1.608263, -0.130884, -2.727456, 1, 0, 0, 1, 1,
-1.607662, -0.7002012, -1.842116, 1, 0, 0, 1, 1,
-1.583148, -0.664378, -1.671448, 0, 0, 0, 1, 1,
-1.568956, 0.1377274, -2.110741, 0, 0, 0, 1, 1,
-1.567333, -1.353623, -1.190732, 0, 0, 0, 1, 1,
-1.564648, -0.5369654, -0.7814535, 0, 0, 0, 1, 1,
-1.558494, 0.9668686, 0.5743975, 0, 0, 0, 1, 1,
-1.54332, 1.459314, 1.262546, 0, 0, 0, 1, 1,
-1.53637, 2.264104, 1.472341, 0, 0, 0, 1, 1,
-1.533887, -0.3499094, -2.664986, 1, 1, 1, 1, 1,
-1.527, 0.965435, -3.629357, 1, 1, 1, 1, 1,
-1.510353, 1.387942, -1.67948, 1, 1, 1, 1, 1,
-1.50624, -1.688255, -2.449916, 1, 1, 1, 1, 1,
-1.503281, -1.239275, -1.120965, 1, 1, 1, 1, 1,
-1.496425, 0.2027998, -0.4567003, 1, 1, 1, 1, 1,
-1.49309, 2.082007, -3.506759, 1, 1, 1, 1, 1,
-1.484257, -0.474537, -1.82597, 1, 1, 1, 1, 1,
-1.480621, -1.44698, -1.594939, 1, 1, 1, 1, 1,
-1.474095, 0.9791238, 0.02530644, 1, 1, 1, 1, 1,
-1.472253, 0.5169199, -1.942621, 1, 1, 1, 1, 1,
-1.46476, -0.6390986, -1.801613, 1, 1, 1, 1, 1,
-1.458928, -0.2987919, -2.211536, 1, 1, 1, 1, 1,
-1.45828, -0.2712186, -1.801928, 1, 1, 1, 1, 1,
-1.452535, 1.459982, 1.004946, 1, 1, 1, 1, 1,
-1.448498, 0.1945001, -0.9804435, 0, 0, 1, 1, 1,
-1.432739, -0.3160095, -2.829438, 1, 0, 0, 1, 1,
-1.418987, -0.5558504, 0.1759923, 1, 0, 0, 1, 1,
-1.412287, -0.6888847, -3.589597, 1, 0, 0, 1, 1,
-1.40031, -0.6890572, -2.056076, 1, 0, 0, 1, 1,
-1.394489, -2.49341, -2.361291, 1, 0, 0, 1, 1,
-1.393964, -0.3651796, -2.132289, 0, 0, 0, 1, 1,
-1.380041, -0.05294608, -1.541071, 0, 0, 0, 1, 1,
-1.379701, -0.4455838, -2.045205, 0, 0, 0, 1, 1,
-1.371886, 0.1983526, -0.61735, 0, 0, 0, 1, 1,
-1.368017, 0.2661903, 0.1222361, 0, 0, 0, 1, 1,
-1.364287, -0.3817798, -2.513612, 0, 0, 0, 1, 1,
-1.334839, -0.4205532, -1.146147, 0, 0, 0, 1, 1,
-1.3345, 1.098818, -0.431149, 1, 1, 1, 1, 1,
-1.325448, -0.3815008, -2.065779, 1, 1, 1, 1, 1,
-1.319019, -2.383186, -1.596009, 1, 1, 1, 1, 1,
-1.305603, 1.677181, -1.81328, 1, 1, 1, 1, 1,
-1.305316, -1.38001, -0.5814677, 1, 1, 1, 1, 1,
-1.304356, -0.7768629, -1.069596, 1, 1, 1, 1, 1,
-1.298193, -0.6628835, -1.915267, 1, 1, 1, 1, 1,
-1.293885, -0.3882926, -2.261259, 1, 1, 1, 1, 1,
-1.288047, 0.759557, -0.9596356, 1, 1, 1, 1, 1,
-1.276836, -0.9793959, -2.131046, 1, 1, 1, 1, 1,
-1.269629, 0.5931209, -1.123341, 1, 1, 1, 1, 1,
-1.253061, 0.1143983, -1.688049, 1, 1, 1, 1, 1,
-1.242131, 0.5702306, -1.374868, 1, 1, 1, 1, 1,
-1.236764, -1.179991, -1.14371, 1, 1, 1, 1, 1,
-1.230839, -2.123623, -2.799322, 1, 1, 1, 1, 1,
-1.224925, -0.007201239, -1.893545, 0, 0, 1, 1, 1,
-1.219833, -0.2443788, -1.763842, 1, 0, 0, 1, 1,
-1.21627, -2.142794, -3.49068, 1, 0, 0, 1, 1,
-1.202939, -2.218138, -3.711054, 1, 0, 0, 1, 1,
-1.164923, -0.6754104, -3.212066, 1, 0, 0, 1, 1,
-1.162167, -0.2639886, 0.06498217, 1, 0, 0, 1, 1,
-1.161728, -0.2144266, -1.708478, 0, 0, 0, 1, 1,
-1.161442, 0.4751296, -0.4108094, 0, 0, 0, 1, 1,
-1.155435, -0.8751084, -1.981357, 0, 0, 0, 1, 1,
-1.143118, 0.4927983, -1.163055, 0, 0, 0, 1, 1,
-1.140817, -1.621335, -1.710059, 0, 0, 0, 1, 1,
-1.126985, 1.24117, 0.1828228, 0, 0, 0, 1, 1,
-1.112906, -1.277547, -2.705076, 0, 0, 0, 1, 1,
-1.111242, 0.002970868, -1.720375, 1, 1, 1, 1, 1,
-1.109472, -0.1692339, -3.010957, 1, 1, 1, 1, 1,
-1.107526, -0.2298686, -1.858395, 1, 1, 1, 1, 1,
-1.097601, -0.4806276, -1.242507, 1, 1, 1, 1, 1,
-1.087839, 2.243029, -1.747278, 1, 1, 1, 1, 1,
-1.072377, -0.6957874, -1.795604, 1, 1, 1, 1, 1,
-1.062767, 0.5473667, -1.949869, 1, 1, 1, 1, 1,
-1.057172, 0.1855356, -0.8312351, 1, 1, 1, 1, 1,
-1.056823, 0.5851371, -2.121966, 1, 1, 1, 1, 1,
-1.0553, 0.5355316, -0.777836, 1, 1, 1, 1, 1,
-1.048539, -0.2516946, -2.679955, 1, 1, 1, 1, 1,
-1.043777, 0.7816766, -1.277501, 1, 1, 1, 1, 1,
-1.031925, -0.7562289, -1.372584, 1, 1, 1, 1, 1,
-1.028914, 1.594259, 0.2463684, 1, 1, 1, 1, 1,
-1.026929, 0.2078775, -0.9626309, 1, 1, 1, 1, 1,
-1.026686, 0.6081137, -1.197015, 0, 0, 1, 1, 1,
-1.018375, -1.430416, -3.203792, 1, 0, 0, 1, 1,
-1.015805, 2.01712, -0.8759822, 1, 0, 0, 1, 1,
-1.01224, 1.090898, -1.833945, 1, 0, 0, 1, 1,
-1.008226, 0.6012761, -2.10786, 1, 0, 0, 1, 1,
-1.005732, -0.1890265, -0.5597755, 1, 0, 0, 1, 1,
-1.003249, 1.512505, -1.93649, 0, 0, 0, 1, 1,
-0.9909713, -1.757504, -2.148213, 0, 0, 0, 1, 1,
-0.9886054, -0.5361608, -0.1182843, 0, 0, 0, 1, 1,
-0.9877293, 1.477279, -0.636202, 0, 0, 0, 1, 1,
-0.9859951, 1.477028, -2.031702, 0, 0, 0, 1, 1,
-0.9837349, 0.8353144, -1.817298, 0, 0, 0, 1, 1,
-0.9814491, -0.7813845, -1.461478, 0, 0, 0, 1, 1,
-0.9784511, 0.03314745, -2.356792, 1, 1, 1, 1, 1,
-0.9756839, -0.6161073, -2.351314, 1, 1, 1, 1, 1,
-0.9691629, 0.9943407, -1.507956, 1, 1, 1, 1, 1,
-0.9661024, -2.121946, -2.92076, 1, 1, 1, 1, 1,
-0.959271, 0.5724623, -1.225196, 1, 1, 1, 1, 1,
-0.9571054, -0.9731723, -0.661081, 1, 1, 1, 1, 1,
-0.9463711, 0.03334939, -1.555033, 1, 1, 1, 1, 1,
-0.945361, 0.53175, -0.257544, 1, 1, 1, 1, 1,
-0.9365685, -1.039349, -0.8877967, 1, 1, 1, 1, 1,
-0.9355918, -0.6089973, -2.446179, 1, 1, 1, 1, 1,
-0.9306966, -0.4260087, -2.866967, 1, 1, 1, 1, 1,
-0.9222555, 0.8446229, -0.335121, 1, 1, 1, 1, 1,
-0.9173967, -1.740282, -3.928728, 1, 1, 1, 1, 1,
-0.9112538, -1.888159, -2.024229, 1, 1, 1, 1, 1,
-0.9018403, -0.345655, -2.443341, 1, 1, 1, 1, 1,
-0.8927508, -2.014421, -1.754653, 0, 0, 1, 1, 1,
-0.890865, 0.2505652, -0.3666084, 1, 0, 0, 1, 1,
-0.890615, 1.246212, -1.226715, 1, 0, 0, 1, 1,
-0.8806213, -1.189808, -2.053915, 1, 0, 0, 1, 1,
-0.8794352, 0.5614629, -0.2591261, 1, 0, 0, 1, 1,
-0.8747328, -1.136425, -2.707948, 1, 0, 0, 1, 1,
-0.8737873, -0.1065304, -0.05412368, 0, 0, 0, 1, 1,
-0.8716323, -0.5791982, -2.005693, 0, 0, 0, 1, 1,
-0.8632258, 1.425849, 1.765253, 0, 0, 0, 1, 1,
-0.8612205, -0.8719237, -1.918684, 0, 0, 0, 1, 1,
-0.8546447, -0.7666987, -2.005862, 0, 0, 0, 1, 1,
-0.8405221, 0.1259651, -3.719735, 0, 0, 0, 1, 1,
-0.8400354, -1.086125, -2.897909, 0, 0, 0, 1, 1,
-0.8359593, 1.30029, -0.04785818, 1, 1, 1, 1, 1,
-0.8276048, 0.6013011, -0.667868, 1, 1, 1, 1, 1,
-0.8257592, -0.858955, -3.353826, 1, 1, 1, 1, 1,
-0.822603, 1.889408, -1.642749, 1, 1, 1, 1, 1,
-0.8183092, 0.1518469, -2.421428, 1, 1, 1, 1, 1,
-0.816133, 0.5282558, -1.068446, 1, 1, 1, 1, 1,
-0.8141026, -0.6293032, -2.427241, 1, 1, 1, 1, 1,
-0.8117719, 0.3240547, -1.878567, 1, 1, 1, 1, 1,
-0.8091815, -1.214084, -1.229277, 1, 1, 1, 1, 1,
-0.8074777, 0.09241803, -1.357178, 1, 1, 1, 1, 1,
-0.8068759, 1.640083, -0.1325384, 1, 1, 1, 1, 1,
-0.8034876, 0.1272438, -0.5979567, 1, 1, 1, 1, 1,
-0.802769, 1.061167, -0.6772882, 1, 1, 1, 1, 1,
-0.7948652, -0.2537012, -1.510577, 1, 1, 1, 1, 1,
-0.7940282, 0.701748, -0.9078256, 1, 1, 1, 1, 1,
-0.7885809, -0.3724658, -3.311695, 0, 0, 1, 1, 1,
-0.7879826, 0.5324036, -2.330004, 1, 0, 0, 1, 1,
-0.7855061, -1.559806, -0.62192, 1, 0, 0, 1, 1,
-0.7838691, 0.7014597, -1.701259, 1, 0, 0, 1, 1,
-0.7833512, -0.09032786, -1.944307, 1, 0, 0, 1, 1,
-0.7815341, 0.4217162, -2.012598, 1, 0, 0, 1, 1,
-0.7757512, -1.031977, -2.029461, 0, 0, 0, 1, 1,
-0.7744969, 1.284364, -1.122517, 0, 0, 0, 1, 1,
-0.7732204, 0.1817828, -0.1371112, 0, 0, 0, 1, 1,
-0.7719005, 0.1465112, -1.029294, 0, 0, 0, 1, 1,
-0.7666823, -1.214713, -1.517758, 0, 0, 0, 1, 1,
-0.7666461, 0.647929, -1.046484, 0, 0, 0, 1, 1,
-0.7658176, -0.7964807, -2.653095, 0, 0, 0, 1, 1,
-0.7647272, -0.9441693, -0.4939352, 1, 1, 1, 1, 1,
-0.7609706, -2.304992, 0.006809532, 1, 1, 1, 1, 1,
-0.7568555, 0.8843527, 0.02300836, 1, 1, 1, 1, 1,
-0.7545785, 2.086015, 0.007071619, 1, 1, 1, 1, 1,
-0.7490359, 1.012896, 2.427968, 1, 1, 1, 1, 1,
-0.7485824, 1.749729, 0.9377087, 1, 1, 1, 1, 1,
-0.7405543, 1.223686, 0.1822336, 1, 1, 1, 1, 1,
-0.7403246, -1.167725, -4.492797, 1, 1, 1, 1, 1,
-0.7389959, -0.1493108, -2.700931, 1, 1, 1, 1, 1,
-0.7364197, -0.04074488, -1.74768, 1, 1, 1, 1, 1,
-0.7345083, -0.8769039, -3.376774, 1, 1, 1, 1, 1,
-0.7314846, -0.305495, -0.7464607, 1, 1, 1, 1, 1,
-0.7296405, 0.175596, -1.500016, 1, 1, 1, 1, 1,
-0.7296151, -0.6932278, -2.963256, 1, 1, 1, 1, 1,
-0.7284303, 1.780067, -0.05425953, 1, 1, 1, 1, 1,
-0.7265865, -0.8678643, -2.861752, 0, 0, 1, 1, 1,
-0.7207354, -0.7508292, -4.774939, 1, 0, 0, 1, 1,
-0.720735, 1.074931, 0.1967258, 1, 0, 0, 1, 1,
-0.7194179, -1.848738, -3.442165, 1, 0, 0, 1, 1,
-0.7191209, -0.1321731, -1.739659, 1, 0, 0, 1, 1,
-0.7148541, -1.191862, -0.8768966, 1, 0, 0, 1, 1,
-0.713275, -0.05960762, -2.018293, 0, 0, 0, 1, 1,
-0.705063, -0.3057981, -3.149199, 0, 0, 0, 1, 1,
-0.7025673, -0.8510778, -3.095235, 0, 0, 0, 1, 1,
-0.7025131, 0.7402531, -2.447, 0, 0, 0, 1, 1,
-0.7010021, 0.7137855, -0.1289611, 0, 0, 0, 1, 1,
-0.7002718, -1.732795, -2.852355, 0, 0, 0, 1, 1,
-0.6924548, -0.9997222, -3.535281, 0, 0, 0, 1, 1,
-0.6909049, 0.176416, 0.2010915, 1, 1, 1, 1, 1,
-0.6894011, 0.6749935, -0.5946772, 1, 1, 1, 1, 1,
-0.6868703, -0.08175753, -0.7568002, 1, 1, 1, 1, 1,
-0.6837587, -0.6477717, -2.269761, 1, 1, 1, 1, 1,
-0.6804773, 1.302837, -1.910349, 1, 1, 1, 1, 1,
-0.6707668, 0.3514022, -1.240463, 1, 1, 1, 1, 1,
-0.6664848, -0.04760726, -1.229223, 1, 1, 1, 1, 1,
-0.6633496, -1.334586, -3.161202, 1, 1, 1, 1, 1,
-0.6625138, 0.3384995, -2.988635, 1, 1, 1, 1, 1,
-0.6624721, 1.072086, -0.2296175, 1, 1, 1, 1, 1,
-0.6613312, -0.3843461, -2.258739, 1, 1, 1, 1, 1,
-0.6562878, -1.18851, -2.27778, 1, 1, 1, 1, 1,
-0.6562148, -0.8749443, -0.8930628, 1, 1, 1, 1, 1,
-0.653756, -1.220502, -2.975872, 1, 1, 1, 1, 1,
-0.6495069, 2.3303, 1.409912, 1, 1, 1, 1, 1,
-0.6482032, -0.1423161, -3.15164, 0, 0, 1, 1, 1,
-0.6426561, -0.6937205, -2.941983, 1, 0, 0, 1, 1,
-0.6375803, -0.5098642, -3.619527, 1, 0, 0, 1, 1,
-0.6357846, -0.7170774, -2.007274, 1, 0, 0, 1, 1,
-0.6308271, 0.2038637, -0.3852617, 1, 0, 0, 1, 1,
-0.6271949, -0.3800307, -1.735471, 1, 0, 0, 1, 1,
-0.6220258, -1.283187, -4.01951, 0, 0, 0, 1, 1,
-0.6186813, -0.4584151, -2.053586, 0, 0, 0, 1, 1,
-0.6179402, -0.5354338, -2.680374, 0, 0, 0, 1, 1,
-0.615319, -0.2965289, -3.055444, 0, 0, 0, 1, 1,
-0.6031185, -0.02888088, -1.497738, 0, 0, 0, 1, 1,
-0.6014595, -0.1273991, -0.3750403, 0, 0, 0, 1, 1,
-0.6013584, -0.07773257, -2.460566, 0, 0, 0, 1, 1,
-0.5999272, 0.9996119, -1.285525, 1, 1, 1, 1, 1,
-0.5982784, -2.453057, -2.268872, 1, 1, 1, 1, 1,
-0.5973814, 0.9064156, -2.288989, 1, 1, 1, 1, 1,
-0.5950776, 0.7579983, -0.5822936, 1, 1, 1, 1, 1,
-0.5913031, 0.4523311, 0.2081691, 1, 1, 1, 1, 1,
-0.5897546, -1.584225, -2.603729, 1, 1, 1, 1, 1,
-0.5791855, -0.2000588, 1.403557, 1, 1, 1, 1, 1,
-0.5781432, -0.1076611, -2.322786, 1, 1, 1, 1, 1,
-0.5764786, 0.2797438, -1.709337, 1, 1, 1, 1, 1,
-0.5753568, -0.46936, -2.600053, 1, 1, 1, 1, 1,
-0.5693527, 0.08208486, 0.1435233, 1, 1, 1, 1, 1,
-0.569351, 1.066706, 0.8041852, 1, 1, 1, 1, 1,
-0.5652137, 0.9961218, 0.8913757, 1, 1, 1, 1, 1,
-0.5615631, -0.1003099, -3.407319, 1, 1, 1, 1, 1,
-0.5601087, 2.044112, 1.58237, 1, 1, 1, 1, 1,
-0.5599955, -1.940438, -1.996475, 0, 0, 1, 1, 1,
-0.5588967, 1.520652, -1.725285, 1, 0, 0, 1, 1,
-0.5578964, 0.3670884, -0.5093275, 1, 0, 0, 1, 1,
-0.5504057, -0.7119077, -1.281832, 1, 0, 0, 1, 1,
-0.5497267, -0.5492474, -1.486642, 1, 0, 0, 1, 1,
-0.5491632, 0.1500984, -0.5651269, 1, 0, 0, 1, 1,
-0.5454571, -1.003035, -3.523029, 0, 0, 0, 1, 1,
-0.5437581, -1.606067, -2.968023, 0, 0, 0, 1, 1,
-0.5426269, -2.043984, -4.121371, 0, 0, 0, 1, 1,
-0.5424078, -1.610079, -3.175598, 0, 0, 0, 1, 1,
-0.5423546, 1.721708, -0.632526, 0, 0, 0, 1, 1,
-0.5391013, -0.8685422, -1.540288, 0, 0, 0, 1, 1,
-0.5371332, -0.8412461, -2.131648, 0, 0, 0, 1, 1,
-0.535431, 1.886045, -0.02311065, 1, 1, 1, 1, 1,
-0.5296747, -1.119791, -1.760561, 1, 1, 1, 1, 1,
-0.5286873, -1.088584, -2.760923, 1, 1, 1, 1, 1,
-0.5238704, -0.2362695, -1.152745, 1, 1, 1, 1, 1,
-0.5209525, -0.4957455, -0.871335, 1, 1, 1, 1, 1,
-0.5202905, -1.338529, -3.246141, 1, 1, 1, 1, 1,
-0.5169498, 0.5609275, -1.733877, 1, 1, 1, 1, 1,
-0.5161626, 0.714471, -1.763776, 1, 1, 1, 1, 1,
-0.5127416, 0.1607087, -1.67332, 1, 1, 1, 1, 1,
-0.5097655, 0.7928182, -1.036959, 1, 1, 1, 1, 1,
-0.5014102, 0.005465913, -1.743319, 1, 1, 1, 1, 1,
-0.5005752, 0.5251929, -1.467495, 1, 1, 1, 1, 1,
-0.4987025, 0.6493492, -0.2878902, 1, 1, 1, 1, 1,
-0.4979047, -0.06340706, -1.594802, 1, 1, 1, 1, 1,
-0.4936635, 0.5357281, -2.123939, 1, 1, 1, 1, 1,
-0.4917585, 0.4737217, -1.466381, 0, 0, 1, 1, 1,
-0.48705, 1.378284, -1.591604, 1, 0, 0, 1, 1,
-0.4776826, 0.7961684, 0.118748, 1, 0, 0, 1, 1,
-0.476362, -0.8676684, -1.449312, 1, 0, 0, 1, 1,
-0.4748106, -0.6073285, -1.20055, 1, 0, 0, 1, 1,
-0.472878, 1.036017, 0.07241656, 1, 0, 0, 1, 1,
-0.471184, -0.2391955, -0.6594099, 0, 0, 0, 1, 1,
-0.4629048, -0.9530674, -2.999824, 0, 0, 0, 1, 1,
-0.4625857, -0.6315488, -3.477798, 0, 0, 0, 1, 1,
-0.4619522, -1.377214, -4.08886, 0, 0, 0, 1, 1,
-0.4589707, 0.7545766, -1.603612, 0, 0, 0, 1, 1,
-0.4572803, -1.353831, -3.305953, 0, 0, 0, 1, 1,
-0.4516893, 0.07548655, -1.347481, 0, 0, 0, 1, 1,
-0.4512243, 0.06335575, -1.719705, 1, 1, 1, 1, 1,
-0.4501424, 0.5615636, -0.3270229, 1, 1, 1, 1, 1,
-0.44976, 1.948444, -1.01911, 1, 1, 1, 1, 1,
-0.4448557, -1.471935, -1.076198, 1, 1, 1, 1, 1,
-0.4443623, 0.4093358, -0.06630812, 1, 1, 1, 1, 1,
-0.4403048, 1.528491, -3.918253, 1, 1, 1, 1, 1,
-0.4270977, -0.7677945, -4.258842, 1, 1, 1, 1, 1,
-0.4230011, -0.5002453, -2.391224, 1, 1, 1, 1, 1,
-0.4199758, -0.3422732, -1.966494, 1, 1, 1, 1, 1,
-0.4170402, -0.9755248, -3.903936, 1, 1, 1, 1, 1,
-0.4151652, -0.1271909, -1.707635, 1, 1, 1, 1, 1,
-0.4143483, -0.3456926, -1.824626, 1, 1, 1, 1, 1,
-0.4118214, 0.5953178, -2.520864, 1, 1, 1, 1, 1,
-0.4088943, -0.5417477, -0.8535514, 1, 1, 1, 1, 1,
-0.4081734, -0.907186, -1.797052, 1, 1, 1, 1, 1,
-0.4080436, 0.5681483, -0.7784234, 0, 0, 1, 1, 1,
-0.4064055, -1.143663, -2.630202, 1, 0, 0, 1, 1,
-0.4021127, -0.03783915, -1.573768, 1, 0, 0, 1, 1,
-0.3992598, 0.5693414, -2.491314, 1, 0, 0, 1, 1,
-0.3921318, 1.310804, 1.32913, 1, 0, 0, 1, 1,
-0.3912472, 0.3709011, 0.5592442, 1, 0, 0, 1, 1,
-0.3880349, 2.352095, -0.4909421, 0, 0, 0, 1, 1,
-0.386858, -0.7330912, -2.937499, 0, 0, 0, 1, 1,
-0.3820263, 0.3167368, -0.5819529, 0, 0, 0, 1, 1,
-0.378853, 0.3193936, -1.911383, 0, 0, 0, 1, 1,
-0.3778132, 0.1795042, 0.7641774, 0, 0, 0, 1, 1,
-0.3777593, 0.2736224, -1.060632, 0, 0, 0, 1, 1,
-0.3773631, 0.9074991, 0.2807968, 0, 0, 0, 1, 1,
-0.3747634, -0.7008373, -2.246114, 1, 1, 1, 1, 1,
-0.374299, 0.36221, -1.560571, 1, 1, 1, 1, 1,
-0.3728606, -1.012139, -6.298536, 1, 1, 1, 1, 1,
-0.3714413, -1.4968, -3.456023, 1, 1, 1, 1, 1,
-0.3677947, 0.4567854, -0.9822748, 1, 1, 1, 1, 1,
-0.367467, 0.3750022, -0.3124758, 1, 1, 1, 1, 1,
-0.361517, -0.7959886, -2.250559, 1, 1, 1, 1, 1,
-0.3613474, 1.259087, -0.4951581, 1, 1, 1, 1, 1,
-0.3602523, -1.804997, -3.987402, 1, 1, 1, 1, 1,
-0.3586535, 0.3570575, -2.380344, 1, 1, 1, 1, 1,
-0.3578148, -0.2470378, -3.431404, 1, 1, 1, 1, 1,
-0.3562177, 0.3102411, 0.8062049, 1, 1, 1, 1, 1,
-0.3544904, -1.094241, -2.148453, 1, 1, 1, 1, 1,
-0.35033, 0.4112054, -1.753606, 1, 1, 1, 1, 1,
-0.3498736, -1.443692, -4.221133, 1, 1, 1, 1, 1,
-0.3484154, 0.0002264521, -2.368392, 0, 0, 1, 1, 1,
-0.3438004, -0.7625561, -1.47961, 1, 0, 0, 1, 1,
-0.3422579, 0.5928466, -0.2027949, 1, 0, 0, 1, 1,
-0.3405111, 0.9702308, -1.425616, 1, 0, 0, 1, 1,
-0.3385046, 0.8238497, -1.093853, 1, 0, 0, 1, 1,
-0.337698, -0.3549988, -2.178226, 1, 0, 0, 1, 1,
-0.3374441, -0.06063101, -2.8616, 0, 0, 0, 1, 1,
-0.3362105, 0.1086666, -2.702242, 0, 0, 0, 1, 1,
-0.335146, 0.6276103, -0.3475298, 0, 0, 0, 1, 1,
-0.3287701, 1.370015, -0.02854687, 0, 0, 0, 1, 1,
-0.3235751, -1.61202, -3.90961, 0, 0, 0, 1, 1,
-0.3227761, -0.1089489, -2.644686, 0, 0, 0, 1, 1,
-0.3222979, 0.1469368, -1.592919, 0, 0, 0, 1, 1,
-0.3221408, 1.107568, -0.2184364, 1, 1, 1, 1, 1,
-0.3175053, 0.9153464, 0.6305128, 1, 1, 1, 1, 1,
-0.3165979, -2.120374, -3.011575, 1, 1, 1, 1, 1,
-0.3149268, -0.4604146, -1.716371, 1, 1, 1, 1, 1,
-0.3104176, -2.064319, -3.172342, 1, 1, 1, 1, 1,
-0.3087794, -0.8858933, -3.314693, 1, 1, 1, 1, 1,
-0.3049808, -0.4814253, -2.170113, 1, 1, 1, 1, 1,
-0.3026985, 0.5129318, 0.0956398, 1, 1, 1, 1, 1,
-0.2996532, 1.318792, -0.5334169, 1, 1, 1, 1, 1,
-0.2985268, -0.5319381, -2.001213, 1, 1, 1, 1, 1,
-0.2936244, -0.007150251, -0.5996183, 1, 1, 1, 1, 1,
-0.2925208, 0.04982584, -2.929398, 1, 1, 1, 1, 1,
-0.2916414, -1.452142, -2.393748, 1, 1, 1, 1, 1,
-0.2890935, -0.3397078, -0.1804485, 1, 1, 1, 1, 1,
-0.2851616, -0.5140551, -3.06888, 1, 1, 1, 1, 1,
-0.2848968, -0.09448119, -0.5580297, 0, 0, 1, 1, 1,
-0.2827725, 0.4301236, -0.8476386, 1, 0, 0, 1, 1,
-0.280977, -1.491813, -3.366037, 1, 0, 0, 1, 1,
-0.2807633, -0.2866704, -2.78207, 1, 0, 0, 1, 1,
-0.2804154, 0.3084949, -1.02782, 1, 0, 0, 1, 1,
-0.2761841, -1.183328, -4.447372, 1, 0, 0, 1, 1,
-0.2742014, -0.5209501, -2.738377, 0, 0, 0, 1, 1,
-0.2733994, -1.608462, -2.503788, 0, 0, 0, 1, 1,
-0.2697594, -1.082579, -4.056904, 0, 0, 0, 1, 1,
-0.2660922, -0.07913732, -1.985765, 0, 0, 0, 1, 1,
-0.2660852, -0.1867789, -0.6343456, 0, 0, 0, 1, 1,
-0.2659399, -0.2547449, -2.919649, 0, 0, 0, 1, 1,
-0.26509, 0.05889685, -1.600585, 0, 0, 0, 1, 1,
-0.2640508, 0.3970485, -2.649877, 1, 1, 1, 1, 1,
-0.2603915, -0.2557034, -2.162791, 1, 1, 1, 1, 1,
-0.2588747, -0.8602117, -3.534377, 1, 1, 1, 1, 1,
-0.2585804, -0.6934766, -1.243319, 1, 1, 1, 1, 1,
-0.257781, -1.465192, -1.644815, 1, 1, 1, 1, 1,
-0.2524328, -0.258008, 0.1558455, 1, 1, 1, 1, 1,
-0.2477452, -1.027634, -2.834009, 1, 1, 1, 1, 1,
-0.2474282, -0.1110553, -2.617236, 1, 1, 1, 1, 1,
-0.2459228, 0.59807, -1.703936, 1, 1, 1, 1, 1,
-0.2457986, -0.5912302, -2.256994, 1, 1, 1, 1, 1,
-0.2454135, -0.3627812, -4.499669, 1, 1, 1, 1, 1,
-0.2398938, 0.09170966, -2.557386, 1, 1, 1, 1, 1,
-0.2353155, -0.2378493, -1.125703, 1, 1, 1, 1, 1,
-0.2295108, -0.6615093, -2.797123, 1, 1, 1, 1, 1,
-0.2287055, -0.1061067, -1.553611, 1, 1, 1, 1, 1,
-0.223699, -0.4991863, -2.397547, 0, 0, 1, 1, 1,
-0.2232704, 0.8392684, 0.1439201, 1, 0, 0, 1, 1,
-0.2222382, -0.2318938, -3.729588, 1, 0, 0, 1, 1,
-0.2216966, 1.804454, -1.207338, 1, 0, 0, 1, 1,
-0.2209279, -0.2395286, -2.44734, 1, 0, 0, 1, 1,
-0.2197695, -0.4505628, -2.776878, 1, 0, 0, 1, 1,
-0.2190519, 0.1612, -1.700275, 0, 0, 0, 1, 1,
-0.2161891, 0.2123544, 0.3034138, 0, 0, 0, 1, 1,
-0.2145767, -0.974228, -3.136791, 0, 0, 0, 1, 1,
-0.214225, 0.2618812, -2.852875, 0, 0, 0, 1, 1,
-0.2128436, -0.2197476, -2.898715, 0, 0, 0, 1, 1,
-0.206947, 0.07585524, -1.453988, 0, 0, 0, 1, 1,
-0.2028347, -0.116898, -3.519283, 0, 0, 0, 1, 1,
-0.1999738, 1.290045, 0.4363287, 1, 1, 1, 1, 1,
-0.1992263, 0.2945197, -2.102869, 1, 1, 1, 1, 1,
-0.1948261, 0.4808463, -2.04655, 1, 1, 1, 1, 1,
-0.1929935, 0.1323983, -1.351022, 1, 1, 1, 1, 1,
-0.1897293, 0.3371649, -1.059585, 1, 1, 1, 1, 1,
-0.1863676, 0.1727668, -1.606761, 1, 1, 1, 1, 1,
-0.1799342, -0.6319664, -2.5187, 1, 1, 1, 1, 1,
-0.1790153, -1.061555, -3.232383, 1, 1, 1, 1, 1,
-0.1776547, 2.080132, 0.9556227, 1, 1, 1, 1, 1,
-0.1759855, 0.4035272, 0.5335983, 1, 1, 1, 1, 1,
-0.1747892, -1.480225, -2.629407, 1, 1, 1, 1, 1,
-0.1691561, -0.4129227, -0.8144555, 1, 1, 1, 1, 1,
-0.169148, 1.738155, 0.2905577, 1, 1, 1, 1, 1,
-0.154568, 0.1250556, -0.7304823, 1, 1, 1, 1, 1,
-0.1483059, -0.118181, -1.263383, 1, 1, 1, 1, 1,
-0.1448063, -0.1345914, -1.102926, 0, 0, 1, 1, 1,
-0.1408431, -0.3759864, -2.410216, 1, 0, 0, 1, 1,
-0.139528, 1.272067, 0.1391096, 1, 0, 0, 1, 1,
-0.137267, 1.033963, -0.817112, 1, 0, 0, 1, 1,
-0.131371, -0.3225307, -1.761614, 1, 0, 0, 1, 1,
-0.1283666, -0.04454413, -1.227603, 1, 0, 0, 1, 1,
-0.1271914, -0.9445984, -2.621416, 0, 0, 0, 1, 1,
-0.1271888, 1.029966, -1.271613, 0, 0, 0, 1, 1,
-0.1214674, 0.2900451, -0.6045521, 0, 0, 0, 1, 1,
-0.1210371, -0.4391038, -3.618743, 0, 0, 0, 1, 1,
-0.1196359, -0.6038353, -2.477783, 0, 0, 0, 1, 1,
-0.1166049, 0.2498368, -1.144293, 0, 0, 0, 1, 1,
-0.1161694, 0.4504962, 0.1678662, 0, 0, 0, 1, 1,
-0.1154641, -0.7438277, -3.338512, 1, 1, 1, 1, 1,
-0.1122933, 0.6550731, 0.9310135, 1, 1, 1, 1, 1,
-0.1116683, -1.590413, -2.803139, 1, 1, 1, 1, 1,
-0.1063968, -0.3365803, -3.487055, 1, 1, 1, 1, 1,
-0.1040422, -0.5134575, -3.619411, 1, 1, 1, 1, 1,
-0.1036598, 0.5605208, 1.081707, 1, 1, 1, 1, 1,
-0.09724043, 0.3474317, -0.9267352, 1, 1, 1, 1, 1,
-0.09653011, 1.187, 0.3618629, 1, 1, 1, 1, 1,
-0.08948089, -0.1477127, -1.128548, 1, 1, 1, 1, 1,
-0.08835213, 0.4983416, 2.103405, 1, 1, 1, 1, 1,
-0.08492055, -0.1395908, -3.711208, 1, 1, 1, 1, 1,
-0.0815434, 0.1937244, -0.3672763, 1, 1, 1, 1, 1,
-0.08027154, 0.3219975, -1.074262, 1, 1, 1, 1, 1,
-0.07921986, 1.366285, 1.042751, 1, 1, 1, 1, 1,
-0.07691601, -0.8321271, -3.63278, 1, 1, 1, 1, 1,
-0.07563569, 0.2682767, -1.726628, 0, 0, 1, 1, 1,
-0.06746897, 1.248353, 0.3765493, 1, 0, 0, 1, 1,
-0.0652308, 0.1846566, -0.852282, 1, 0, 0, 1, 1,
-0.06213427, 1.029467, 1.439635, 1, 0, 0, 1, 1,
-0.05652927, -1.522401, -2.449816, 1, 0, 0, 1, 1,
-0.05589206, -0.3710059, -1.703205, 1, 0, 0, 1, 1,
-0.05439345, 1.238982, -1.275273, 0, 0, 0, 1, 1,
-0.05383377, 0.480131, -1.238877, 0, 0, 0, 1, 1,
-0.04927183, 1.972863, -0.01591794, 0, 0, 0, 1, 1,
-0.04641076, -0.8868735, -4.874262, 0, 0, 0, 1, 1,
-0.04450427, 0.3743936, 0.109663, 0, 0, 0, 1, 1,
-0.03572597, -1.276327, -2.883717, 0, 0, 0, 1, 1,
-0.03558843, -1.501064, -2.999123, 0, 0, 0, 1, 1,
-0.03143481, -0.7493536, -4.909005, 1, 1, 1, 1, 1,
-0.03133462, 0.7656208, 0.1291856, 1, 1, 1, 1, 1,
-0.03129365, -0.1515986, -1.654225, 1, 1, 1, 1, 1,
-0.03035513, 0.2378681, -1.179632, 1, 1, 1, 1, 1,
-0.02930245, 0.7643439, 0.07597293, 1, 1, 1, 1, 1,
-0.02668762, -1.754497, -4.242302, 1, 1, 1, 1, 1,
-0.02372436, -0.03713458, -2.832769, 1, 1, 1, 1, 1,
-0.02174615, 0.3608022, 0.09532136, 1, 1, 1, 1, 1,
-0.02111349, -1.146628, -3.413634, 1, 1, 1, 1, 1,
-0.02071404, 1.63523, 0.7611019, 1, 1, 1, 1, 1,
-0.01932194, -1.803682, -1.123862, 1, 1, 1, 1, 1,
-0.01843052, 1.016934, 0.5350626, 1, 1, 1, 1, 1,
-0.01726074, 0.7168803, 0.4662511, 1, 1, 1, 1, 1,
-0.01674857, -0.2101211, -3.569934, 1, 1, 1, 1, 1,
-0.01668269, 2.134779, -0.327841, 1, 1, 1, 1, 1,
-0.01585646, 1.090482, -1.800295, 0, 0, 1, 1, 1,
-0.01405713, 1.540768, -0.4177544, 1, 0, 0, 1, 1,
-0.01136608, -0.06055772, -3.257015, 1, 0, 0, 1, 1,
-0.007445721, 0.7989958, -0.2479372, 1, 0, 0, 1, 1,
-0.00453592, 0.3521882, -0.7446273, 1, 0, 0, 1, 1,
-0.001244454, -0.4785472, -3.344817, 1, 0, 0, 1, 1,
-0.0006762264, 0.7551419, 0.4154433, 0, 0, 0, 1, 1,
-0.0006349618, 0.4813851, 0.48485, 0, 0, 0, 1, 1,
-0.0005832057, 1.233216, 0.7434351, 0, 0, 0, 1, 1,
0.002913097, -2.997472, 4.226442, 0, 0, 0, 1, 1,
0.008989924, -0.4526778, 2.292346, 0, 0, 0, 1, 1,
0.01026332, -0.2130078, 4.037785, 0, 0, 0, 1, 1,
0.01254298, -0.3345748, 3.385521, 0, 0, 0, 1, 1,
0.02297818, -0.7386235, 3.52681, 1, 1, 1, 1, 1,
0.02310005, 0.6685044, 1.480378, 1, 1, 1, 1, 1,
0.0282258, 0.9141381, 1.101222, 1, 1, 1, 1, 1,
0.02987826, 0.9977047, -0.08549896, 1, 1, 1, 1, 1,
0.03162446, 1.520701, -0.1686679, 1, 1, 1, 1, 1,
0.03209011, 1.401444, -0.5425462, 1, 1, 1, 1, 1,
0.03247869, 0.3645968, -0.5281005, 1, 1, 1, 1, 1,
0.03371928, 0.1317806, 0.3596535, 1, 1, 1, 1, 1,
0.03618146, 0.5945794, 0.01001777, 1, 1, 1, 1, 1,
0.03658094, -0.04568716, 1.396303, 1, 1, 1, 1, 1,
0.03680124, -2.522835, 2.126557, 1, 1, 1, 1, 1,
0.03960078, 1.108538, -1.634393, 1, 1, 1, 1, 1,
0.0402442, -2.312843, 3.262794, 1, 1, 1, 1, 1,
0.040598, 0.01607865, -0.7419807, 1, 1, 1, 1, 1,
0.04230973, 0.2522152, 0.4056111, 1, 1, 1, 1, 1,
0.04245397, -0.03948082, 2.255184, 0, 0, 1, 1, 1,
0.04458256, 1.093001, -1.373389, 1, 0, 0, 1, 1,
0.04629146, 0.5269833, 3.480628, 1, 0, 0, 1, 1,
0.04808673, 0.04134811, -0.16911, 1, 0, 0, 1, 1,
0.04845817, 2.186868, -1.766243, 1, 0, 0, 1, 1,
0.04939367, -0.3813658, 2.54351, 1, 0, 0, 1, 1,
0.05024285, 0.6102464, -0.2195508, 0, 0, 0, 1, 1,
0.05044555, 0.8516408, 0.9225678, 0, 0, 0, 1, 1,
0.05096438, 1.017678, -0.239475, 0, 0, 0, 1, 1,
0.05133535, -0.1518034, 3.525997, 0, 0, 0, 1, 1,
0.05231928, -1.562306, 1.989171, 0, 0, 0, 1, 1,
0.05369844, -1.847167, 3.337168, 0, 0, 0, 1, 1,
0.05906621, -1.626747, 2.567139, 0, 0, 0, 1, 1,
0.06694636, 0.2397596, 1.313474, 1, 1, 1, 1, 1,
0.07167728, -0.02259591, 0.9715396, 1, 1, 1, 1, 1,
0.07431182, 0.07063038, 0.9736649, 1, 1, 1, 1, 1,
0.07921376, 1.540003, -0.3120331, 1, 1, 1, 1, 1,
0.08084294, -0.04757832, 0.8437726, 1, 1, 1, 1, 1,
0.08251061, 1.485039, -1.768561, 1, 1, 1, 1, 1,
0.08560225, -0.9009038, 4.346867, 1, 1, 1, 1, 1,
0.08587322, 1.227302, -0.07271709, 1, 1, 1, 1, 1,
0.08743816, 1.284308, -0.5428346, 1, 1, 1, 1, 1,
0.08749019, -0.2055668, 2.909674, 1, 1, 1, 1, 1,
0.08840369, -0.3357911, 3.754783, 1, 1, 1, 1, 1,
0.09498946, 1.123845, -0.7436917, 1, 1, 1, 1, 1,
0.09629673, -0.4712925, 4.071194, 1, 1, 1, 1, 1,
0.1020233, -0.1233115, 1.905177, 1, 1, 1, 1, 1,
0.1028595, -1.256846, 5.143404, 1, 1, 1, 1, 1,
0.1032621, 0.7656615, 0.7190174, 0, 0, 1, 1, 1,
0.1056355, -0.8361146, 2.904813, 1, 0, 0, 1, 1,
0.112865, -0.2541754, 2.755379, 1, 0, 0, 1, 1,
0.1152596, -0.5041335, 1.758212, 1, 0, 0, 1, 1,
0.1166198, -0.8551311, 4.621336, 1, 0, 0, 1, 1,
0.1177651, -1.093646, 1.447803, 1, 0, 0, 1, 1,
0.1237959, -1.156021, 2.774428, 0, 0, 0, 1, 1,
0.1242416, -0.2096311, 3.167506, 0, 0, 0, 1, 1,
0.1258056, 0.6964685, 0.6177701, 0, 0, 0, 1, 1,
0.1258128, 0.05660972, 0.5161853, 0, 0, 0, 1, 1,
0.1277926, -1.730667, 2.975045, 0, 0, 0, 1, 1,
0.1309747, -0.09464594, 1.954534, 0, 0, 0, 1, 1,
0.131317, 0.3283059, 0.4364315, 0, 0, 0, 1, 1,
0.1316839, 1.178337, 1.900513, 1, 1, 1, 1, 1,
0.1331699, 0.6387291, -0.1795951, 1, 1, 1, 1, 1,
0.1334836, 0.291124, -1.905371, 1, 1, 1, 1, 1,
0.134517, 0.3430291, 0.4799666, 1, 1, 1, 1, 1,
0.1389108, -0.5945788, 2.539681, 1, 1, 1, 1, 1,
0.1390485, 1.774647, -0.500338, 1, 1, 1, 1, 1,
0.1400788, 0.2154647, 0.2111064, 1, 1, 1, 1, 1,
0.1414469, -0.9051575, 2.87175, 1, 1, 1, 1, 1,
0.1427934, 1.030515, 0.06444347, 1, 1, 1, 1, 1,
0.1463416, -0.5067557, 3.62449, 1, 1, 1, 1, 1,
0.1523039, -0.03357458, 1.238221, 1, 1, 1, 1, 1,
0.168106, 2.755983, 0.06707285, 1, 1, 1, 1, 1,
0.1742262, 1.339324, -0.2190637, 1, 1, 1, 1, 1,
0.1763514, 1.49614, 0.2292043, 1, 1, 1, 1, 1,
0.1785429, -2.553989, 3.409011, 1, 1, 1, 1, 1,
0.1797372, -0.261278, 2.846546, 0, 0, 1, 1, 1,
0.180573, -0.5783954, 3.595685, 1, 0, 0, 1, 1,
0.1821294, -1.797007, 3.554367, 1, 0, 0, 1, 1,
0.1868663, -0.7041124, 2.844584, 1, 0, 0, 1, 1,
0.1921675, 0.1007779, -0.3822556, 1, 0, 0, 1, 1,
0.1942521, 1.286608, -0.7536076, 1, 0, 0, 1, 1,
0.1950713, -0.5762208, 3.391241, 0, 0, 0, 1, 1,
0.1966448, 0.4628894, 0.310338, 0, 0, 0, 1, 1,
0.1974948, 0.1260871, 0.4507244, 0, 0, 0, 1, 1,
0.2079109, 0.2862118, 2.503404, 0, 0, 0, 1, 1,
0.2116967, 1.008493, -0.7061896, 0, 0, 0, 1, 1,
0.2132489, -0.01974749, 0.4560358, 0, 0, 0, 1, 1,
0.2172215, 0.5378665, 0.9615826, 0, 0, 0, 1, 1,
0.2174532, -1.894534, 2.482261, 1, 1, 1, 1, 1,
0.2178393, 0.3706487, -0.8110652, 1, 1, 1, 1, 1,
0.2195004, 0.2844666, -0.9248353, 1, 1, 1, 1, 1,
0.221209, -1.765519, 1.378062, 1, 1, 1, 1, 1,
0.2221471, 0.7274529, 0.2931916, 1, 1, 1, 1, 1,
0.2266996, -1.12202, 3.173808, 1, 1, 1, 1, 1,
0.2270662, 0.4611852, -0.4055326, 1, 1, 1, 1, 1,
0.2300305, -1.48938, 2.812824, 1, 1, 1, 1, 1,
0.230936, 1.030825, 0.03509862, 1, 1, 1, 1, 1,
0.2333193, 1.079524, -0.7167314, 1, 1, 1, 1, 1,
0.2337105, 0.5394236, 0.01422567, 1, 1, 1, 1, 1,
0.2355072, -2.940461, 3.910134, 1, 1, 1, 1, 1,
0.2359152, 0.5088607, 0.1260605, 1, 1, 1, 1, 1,
0.236454, 0.04737037, 1.118212, 1, 1, 1, 1, 1,
0.2368055, -0.6665404, 3.277933, 1, 1, 1, 1, 1,
0.2427076, -0.8307994, 2.709485, 0, 0, 1, 1, 1,
0.2427692, -0.7233428, 2.966239, 1, 0, 0, 1, 1,
0.2429127, 1.500584, 1.554005, 1, 0, 0, 1, 1,
0.2457024, -0.6321875, 3.177388, 1, 0, 0, 1, 1,
0.2458185, 0.1963688, 0.7885509, 1, 0, 0, 1, 1,
0.2471331, -0.1251846, 2.81797, 1, 0, 0, 1, 1,
0.2477509, -1.675902, 1.744485, 0, 0, 0, 1, 1,
0.2595641, -0.07007222, 1.319093, 0, 0, 0, 1, 1,
0.2614139, -0.9682683, 0.8413897, 0, 0, 0, 1, 1,
0.2652556, 0.2579158, -0.3530153, 0, 0, 0, 1, 1,
0.2653669, 0.04903344, 1.085928, 0, 0, 0, 1, 1,
0.2676037, 0.5648657, 1.98075, 0, 0, 0, 1, 1,
0.2690632, 0.9764412, 0.5754504, 0, 0, 0, 1, 1,
0.2764203, -1.463036, 2.531351, 1, 1, 1, 1, 1,
0.2775854, -1.504995, 1.868071, 1, 1, 1, 1, 1,
0.2809473, 0.9647492, 1.633096, 1, 1, 1, 1, 1,
0.2814003, -0.5819451, 0.9985013, 1, 1, 1, 1, 1,
0.2974895, 0.3166979, -1.765334, 1, 1, 1, 1, 1,
0.2989247, -1.08663, 3.654007, 1, 1, 1, 1, 1,
0.3002577, 1.109424, 0.6290101, 1, 1, 1, 1, 1,
0.3017292, -1.25294, 2.803419, 1, 1, 1, 1, 1,
0.3022516, -1.168909, 3.178144, 1, 1, 1, 1, 1,
0.3027276, 1.06032, 0.8693673, 1, 1, 1, 1, 1,
0.3043049, 0.444748, -0.5203146, 1, 1, 1, 1, 1,
0.3046786, 1.605876, 0.6675394, 1, 1, 1, 1, 1,
0.3101111, -0.2926311, 3.836298, 1, 1, 1, 1, 1,
0.3117956, 0.5655944, 0.1555575, 1, 1, 1, 1, 1,
0.3135422, -0.2672929, 3.649461, 1, 1, 1, 1, 1,
0.3136847, 0.5257558, -0.1444999, 0, 0, 1, 1, 1,
0.3150168, 1.078457, 0.7832239, 1, 0, 0, 1, 1,
0.3157386, 0.9946835, 0.2165886, 1, 0, 0, 1, 1,
0.3160435, 0.8078707, 1.880663, 1, 0, 0, 1, 1,
0.3171618, 1.43957, 0.3131294, 1, 0, 0, 1, 1,
0.3173765, 0.3282349, -0.509482, 1, 0, 0, 1, 1,
0.3215159, 0.1494164, 0.8699394, 0, 0, 0, 1, 1,
0.3366864, -0.345723, 2.562471, 0, 0, 0, 1, 1,
0.3421265, 0.344476, 2.981819, 0, 0, 0, 1, 1,
0.343843, -0.6713789, 3.525511, 0, 0, 0, 1, 1,
0.345309, -0.752262, 4.342648, 0, 0, 0, 1, 1,
0.3469309, -0.840498, 2.650681, 0, 0, 0, 1, 1,
0.348915, -0.2562154, 1.078964, 0, 0, 0, 1, 1,
0.3490919, -0.9858534, 2.836967, 1, 1, 1, 1, 1,
0.3567499, 0.512756, 0.1350987, 1, 1, 1, 1, 1,
0.3596745, -0.8456311, 5.739048, 1, 1, 1, 1, 1,
0.3668334, 0.07501132, 2.070781, 1, 1, 1, 1, 1,
0.3701334, 1.023734, 0.4698844, 1, 1, 1, 1, 1,
0.3719771, -1.226738, 2.123883, 1, 1, 1, 1, 1,
0.3873975, 0.6777794, -0.5586711, 1, 1, 1, 1, 1,
0.3902006, -1.782197, 4.610111, 1, 1, 1, 1, 1,
0.3940486, 0.6082596, 1.006748, 1, 1, 1, 1, 1,
0.4105693, -1.272933, 2.137279, 1, 1, 1, 1, 1,
0.4134299, 2.595622, 2.006095, 1, 1, 1, 1, 1,
0.4151277, -0.8084215, 3.283238, 1, 1, 1, 1, 1,
0.4249751, -1.109143, 2.354371, 1, 1, 1, 1, 1,
0.4274624, 0.1419681, 0.7384214, 1, 1, 1, 1, 1,
0.4289774, -0.1843934, 1.913576, 1, 1, 1, 1, 1,
0.4310941, 0.4445179, 0.2981344, 0, 0, 1, 1, 1,
0.4324054, 0.8562457, 0.3443286, 1, 0, 0, 1, 1,
0.4364871, 0.939227, -0.5618614, 1, 0, 0, 1, 1,
0.4402131, -0.4542639, 2.625219, 1, 0, 0, 1, 1,
0.4411968, 0.3492653, 2.517617, 1, 0, 0, 1, 1,
0.4427409, 1.589177, -0.6557633, 1, 0, 0, 1, 1,
0.4436678, -1.671977, 3.802771, 0, 0, 0, 1, 1,
0.446024, 0.5057044, -0.8623818, 0, 0, 0, 1, 1,
0.4518691, -0.4918975, 1.804075, 0, 0, 0, 1, 1,
0.454173, 1.454474, -1.405197, 0, 0, 0, 1, 1,
0.457389, -0.8217815, 4.334376, 0, 0, 0, 1, 1,
0.4666975, 1.489946, 0.2679723, 0, 0, 0, 1, 1,
0.4671853, 0.0190763, 2.26731, 0, 0, 0, 1, 1,
0.4729855, -0.3191017, 3.491603, 1, 1, 1, 1, 1,
0.4761108, -1.127693, 3.360517, 1, 1, 1, 1, 1,
0.4786632, 0.07609007, 0.9939353, 1, 1, 1, 1, 1,
0.4816992, 0.1702849, 0.7201331, 1, 1, 1, 1, 1,
0.4846306, 0.2613173, 2.889687, 1, 1, 1, 1, 1,
0.4863569, -0.554902, 1.506068, 1, 1, 1, 1, 1,
0.4897209, 0.5551836, 2.167543, 1, 1, 1, 1, 1,
0.4917163, -0.9501121, 2.695325, 1, 1, 1, 1, 1,
0.4944554, -0.3016922, 3.175897, 1, 1, 1, 1, 1,
0.4963726, -0.409462, 0.1680314, 1, 1, 1, 1, 1,
0.4985365, -0.8009295, 2.134408, 1, 1, 1, 1, 1,
0.5028167, 1.077714, 1.768268, 1, 1, 1, 1, 1,
0.5056527, 0.08109612, 2.409759, 1, 1, 1, 1, 1,
0.5081177, 0.2490739, 0.8921306, 1, 1, 1, 1, 1,
0.5082452, 2.34911, 0.8778167, 1, 1, 1, 1, 1,
0.5087958, -1.795259, 3.419266, 0, 0, 1, 1, 1,
0.513988, 0.7149208, 0.841409, 1, 0, 0, 1, 1,
0.5243976, -1.369728, 3.088588, 1, 0, 0, 1, 1,
0.5289609, 0.8284611, 1.299268, 1, 0, 0, 1, 1,
0.5347301, -0.199268, 1.821834, 1, 0, 0, 1, 1,
0.5409714, -0.3939244, 3.06115, 1, 0, 0, 1, 1,
0.5472851, -0.02839265, 1.925827, 0, 0, 0, 1, 1,
0.5482146, -2.765022, 2.793583, 0, 0, 0, 1, 1,
0.5543717, -0.8020717, 1.664436, 0, 0, 0, 1, 1,
0.5563874, 0.02985757, 1.397335, 0, 0, 0, 1, 1,
0.5574793, 0.3611914, 0.5637067, 0, 0, 0, 1, 1,
0.5645005, 0.1530978, 1.9101, 0, 0, 0, 1, 1,
0.5750436, -2.571856, 2.158616, 0, 0, 0, 1, 1,
0.5766573, -0.06324732, 1.673779, 1, 1, 1, 1, 1,
0.5779005, -1.060927, 3.963623, 1, 1, 1, 1, 1,
0.5806757, -0.5230823, 3.16482, 1, 1, 1, 1, 1,
0.5815621, 1.851297, 1.080058, 1, 1, 1, 1, 1,
0.5859568, -1.145521, 4.276757, 1, 1, 1, 1, 1,
0.5903112, -1.168916, 2.509185, 1, 1, 1, 1, 1,
0.5971708, -0.890837, 4.485251, 1, 1, 1, 1, 1,
0.5987368, -0.159394, 3.57258, 1, 1, 1, 1, 1,
0.6027791, -1.339628, 2.607395, 1, 1, 1, 1, 1,
0.6043765, 1.430822, 0.6231237, 1, 1, 1, 1, 1,
0.6052715, 1.741694, 1.347553, 1, 1, 1, 1, 1,
0.6057919, 0.08585578, 2.550026, 1, 1, 1, 1, 1,
0.6103094, -0.03488846, 0.6237409, 1, 1, 1, 1, 1,
0.6134302, 0.2469293, 0.6791031, 1, 1, 1, 1, 1,
0.6155874, -0.2643123, 1.272793, 1, 1, 1, 1, 1,
0.6157582, -1.289591, 3.000041, 0, 0, 1, 1, 1,
0.6166261, 0.1755223, 3.265112, 1, 0, 0, 1, 1,
0.6167893, 0.3921776, 1.253846, 1, 0, 0, 1, 1,
0.6175038, 0.4162509, 0.4847981, 1, 0, 0, 1, 1,
0.6285219, 1.692046, 0.7663625, 1, 0, 0, 1, 1,
0.6289914, 0.3190468, -0.03460917, 1, 0, 0, 1, 1,
0.6294292, 0.5682901, 1.902278, 0, 0, 0, 1, 1,
0.6306195, -1.230687, 1.656407, 0, 0, 0, 1, 1,
0.6308369, 0.2006663, 1.218822, 0, 0, 0, 1, 1,
0.6351113, -0.4260434, 2.893852, 0, 0, 0, 1, 1,
0.6352485, -0.972919, 2.709175, 0, 0, 0, 1, 1,
0.6436995, 0.1940469, 0.9480146, 0, 0, 0, 1, 1,
0.6451575, -0.4933736, 0.4507032, 0, 0, 0, 1, 1,
0.6495682, 0.2933265, 0.8441501, 1, 1, 1, 1, 1,
0.6533174, -2.059639, 3.731692, 1, 1, 1, 1, 1,
0.6552962, 2.375159, -0.9824447, 1, 1, 1, 1, 1,
0.65545, 1.387331, 0.9565235, 1, 1, 1, 1, 1,
0.6574658, 0.1499156, 2.367848, 1, 1, 1, 1, 1,
0.6576142, -0.5382566, 2.130548, 1, 1, 1, 1, 1,
0.657727, 0.8274549, -0.9045969, 1, 1, 1, 1, 1,
0.6591858, -1.642215, 5.276526, 1, 1, 1, 1, 1,
0.6597065, -0.6962296, 3.13436, 1, 1, 1, 1, 1,
0.6733156, 0.8002977, -0.008861403, 1, 1, 1, 1, 1,
0.6745769, 1.432837, -0.00658992, 1, 1, 1, 1, 1,
0.6789001, -0.1427069, 2.487231, 1, 1, 1, 1, 1,
0.6857702, -0.5274184, 1.758909, 1, 1, 1, 1, 1,
0.6904426, 0.08066151, 1.544188, 1, 1, 1, 1, 1,
0.6938418, -0.08083377, -0.1965574, 1, 1, 1, 1, 1,
0.6983609, -0.6336478, 2.008041, 0, 0, 1, 1, 1,
0.6983886, -0.3889146, 2.166393, 1, 0, 0, 1, 1,
0.7022664, -1.826102, 1.977792, 1, 0, 0, 1, 1,
0.7069009, -0.0271645, 2.354219, 1, 0, 0, 1, 1,
0.7111239, 0.4921314, 1.772891, 1, 0, 0, 1, 1,
0.7116194, -0.3821323, 1.030608, 1, 0, 0, 1, 1,
0.71253, 1.198185, 0.9633369, 0, 0, 0, 1, 1,
0.7182332, 1.665715, -0.01348654, 0, 0, 0, 1, 1,
0.7237854, -0.8178123, -0.249794, 0, 0, 0, 1, 1,
0.7238159, 0.146977, 0.8412336, 0, 0, 0, 1, 1,
0.724628, -0.1782711, 1.982582, 0, 0, 0, 1, 1,
0.7275444, 0.6731314, 0.2594266, 0, 0, 0, 1, 1,
0.7288287, 0.5187991, 1.648088, 0, 0, 0, 1, 1,
0.7298715, -0.4916295, 2.870844, 1, 1, 1, 1, 1,
0.7310672, 1.032798, 0.4255707, 1, 1, 1, 1, 1,
0.7339409, 0.0254404, 0.8750957, 1, 1, 1, 1, 1,
0.7346932, 0.6298867, 1.375868, 1, 1, 1, 1, 1,
0.7372515, 0.8414521, 0.6321737, 1, 1, 1, 1, 1,
0.7380401, 0.1405929, 0.4705262, 1, 1, 1, 1, 1,
0.7427847, -1.257878, 1.606945, 1, 1, 1, 1, 1,
0.7448716, 1.196543, 0.3990638, 1, 1, 1, 1, 1,
0.7455102, 0.548875, 0.3363172, 1, 1, 1, 1, 1,
0.7502163, -1.666008, 2.38137, 1, 1, 1, 1, 1,
0.7516815, 0.2072552, 2.611127, 1, 1, 1, 1, 1,
0.7585413, -0.8206463, 1.899122, 1, 1, 1, 1, 1,
0.7600913, -1.76425, 3.402701, 1, 1, 1, 1, 1,
0.7634655, 0.3983429, 1.411878, 1, 1, 1, 1, 1,
0.7643357, 1.306198, 2.177916, 1, 1, 1, 1, 1,
0.7764226, 0.03065356, 2.82829, 0, 0, 1, 1, 1,
0.7769642, -0.5191392, 1.947878, 1, 0, 0, 1, 1,
0.7796227, 0.3154923, 1.852176, 1, 0, 0, 1, 1,
0.7908031, 1.465129, -0.1499694, 1, 0, 0, 1, 1,
0.7980644, 0.8363266, 0.1657809, 1, 0, 0, 1, 1,
0.7997267, 1.148777, -0.8219302, 1, 0, 0, 1, 1,
0.8039422, 0.3182586, 1.422355, 0, 0, 0, 1, 1,
0.806829, -0.4727468, 3.421563, 0, 0, 0, 1, 1,
0.8080397, -1.470669, 3.674618, 0, 0, 0, 1, 1,
0.8115804, -2.426316, 4.985883, 0, 0, 0, 1, 1,
0.8197236, -0.2507319, 2.714336, 0, 0, 0, 1, 1,
0.8205363, -1.900597, 2.497652, 0, 0, 0, 1, 1,
0.8393704, 1.166557, -0.0944184, 0, 0, 0, 1, 1,
0.8399544, -0.5585091, 2.122307, 1, 1, 1, 1, 1,
0.8465983, 0.1455164, 1.2976, 1, 1, 1, 1, 1,
0.8478606, 0.1079594, 1.174589, 1, 1, 1, 1, 1,
0.8507112, 0.1676116, 0.7016247, 1, 1, 1, 1, 1,
0.8551529, 0.1623275, 0.5163997, 1, 1, 1, 1, 1,
0.8558222, -1.995743, 3.737702, 1, 1, 1, 1, 1,
0.8564256, 0.3576931, 0.9878298, 1, 1, 1, 1, 1,
0.8567402, -0.3982177, 3.946874, 1, 1, 1, 1, 1,
0.8580494, -0.3194438, 2.397041, 1, 1, 1, 1, 1,
0.8661285, -0.7394322, 2.211233, 1, 1, 1, 1, 1,
0.8701144, -0.627239, 0.4924745, 1, 1, 1, 1, 1,
0.8716527, -0.1468555, 0.9692159, 1, 1, 1, 1, 1,
0.8774502, -0.01005723, 0.8487878, 1, 1, 1, 1, 1,
0.8792028, 1.284472, 0.2062727, 1, 1, 1, 1, 1,
0.8805283, 1.346282, 0.5071596, 1, 1, 1, 1, 1,
0.8879213, 0.9013584, 0.8561691, 0, 0, 1, 1, 1,
0.8931528, 0.6958644, -1.869442, 1, 0, 0, 1, 1,
0.8976784, -1.302042, 3.676637, 1, 0, 0, 1, 1,
0.9044743, -0.3686648, 1.360544, 1, 0, 0, 1, 1,
0.9084515, -0.8401515, 3.069571, 1, 0, 0, 1, 1,
0.9092914, 0.4652039, 1.105887, 1, 0, 0, 1, 1,
0.9102326, 0.5621693, 0.2635765, 0, 0, 0, 1, 1,
0.9129835, -0.1945325, 1.961373, 0, 0, 0, 1, 1,
0.9232012, 0.3417674, -0.2220698, 0, 0, 0, 1, 1,
0.924191, 0.3153332, 0.7561429, 0, 0, 0, 1, 1,
0.9244142, -1.457192, 0.8556266, 0, 0, 0, 1, 1,
0.9255422, 0.6939812, 1.56704, 0, 0, 0, 1, 1,
0.9297134, 0.9812944, 0.2897761, 0, 0, 0, 1, 1,
0.9317386, -0.6117744, 2.735884, 1, 1, 1, 1, 1,
0.9385448, -0.513284, 1.595136, 1, 1, 1, 1, 1,
0.9455772, -2.173481, 1.445209, 1, 1, 1, 1, 1,
0.945601, 1.065447, 0.8565025, 1, 1, 1, 1, 1,
0.9463125, 0.8742213, 0.5366461, 1, 1, 1, 1, 1,
0.9530012, -0.01599505, 3.33873, 1, 1, 1, 1, 1,
0.955122, -1.45415, 2.656255, 1, 1, 1, 1, 1,
0.9595577, -0.3342284, 1.63466, 1, 1, 1, 1, 1,
0.9707015, -1.000512, 3.836193, 1, 1, 1, 1, 1,
0.971213, -1.438033, 2.548137, 1, 1, 1, 1, 1,
0.9719357, -1.533013, 1.609792, 1, 1, 1, 1, 1,
0.9727607, 0.9464695, 1.835805, 1, 1, 1, 1, 1,
0.9778842, -0.4925413, 1.473511, 1, 1, 1, 1, 1,
0.9793676, -2.074268, 3.488418, 1, 1, 1, 1, 1,
0.9803609, -0.2711369, 2.027452, 1, 1, 1, 1, 1,
0.9820462, 0.457388, -0.9956565, 0, 0, 1, 1, 1,
0.9822727, -0.9165576, 0.9898075, 1, 0, 0, 1, 1,
0.9946684, 0.9100598, -0.351397, 1, 0, 0, 1, 1,
0.9961616, -0.4461046, 3.338276, 1, 0, 0, 1, 1,
0.9971337, -1.388146, 4.045722, 1, 0, 0, 1, 1,
1.017526, -0.4608494, 1.279212, 1, 0, 0, 1, 1,
1.028654, 0.9301102, 1.403856, 0, 0, 0, 1, 1,
1.037618, -1.815702, 2.076771, 0, 0, 0, 1, 1,
1.038037, 0.8474134, 0.1100873, 0, 0, 0, 1, 1,
1.040719, 0.9349383, 1.392945, 0, 0, 0, 1, 1,
1.043332, -0.6482633, 2.960463, 0, 0, 0, 1, 1,
1.050921, 1.60362, 1.732001, 0, 0, 0, 1, 1,
1.05122, 0.8291705, 1.823774, 0, 0, 0, 1, 1,
1.053104, -1.071818, 0.9504401, 1, 1, 1, 1, 1,
1.054791, 0.982857, 2.002647, 1, 1, 1, 1, 1,
1.057946, 0.8504477, 1.097215, 1, 1, 1, 1, 1,
1.058866, -0.6896469, 4.381508, 1, 1, 1, 1, 1,
1.0683, 1.188678, 1.802503, 1, 1, 1, 1, 1,
1.068479, 1.746709, -0.6377, 1, 1, 1, 1, 1,
1.083745, -0.517491, 1.957855, 1, 1, 1, 1, 1,
1.092501, -0.4602676, 2.627555, 1, 1, 1, 1, 1,
1.097161, -1.218448, 2.620974, 1, 1, 1, 1, 1,
1.107308, -0.7702825, 1.667468, 1, 1, 1, 1, 1,
1.124852, 0.1942059, 3.93406, 1, 1, 1, 1, 1,
1.125454, 0.6484182, 0.5958121, 1, 1, 1, 1, 1,
1.128695, -0.03458999, 2.41291, 1, 1, 1, 1, 1,
1.133201, 0.4169777, 2.08336, 1, 1, 1, 1, 1,
1.141573, -1.315614, 3.042072, 1, 1, 1, 1, 1,
1.142655, 2.08691, -0.06995039, 0, 0, 1, 1, 1,
1.142831, -0.06807857, 0.6023866, 1, 0, 0, 1, 1,
1.147768, 2.294607, 0.09533614, 1, 0, 0, 1, 1,
1.155437, -0.6306126, 2.286978, 1, 0, 0, 1, 1,
1.169451, -0.4800584, 2.660911, 1, 0, 0, 1, 1,
1.173299, -0.3935564, 1.898828, 1, 0, 0, 1, 1,
1.173776, -0.8399377, 4.330002, 0, 0, 0, 1, 1,
1.174818, 0.4597466, 1.710462, 0, 0, 0, 1, 1,
1.178259, 0.6041017, 1.135791, 0, 0, 0, 1, 1,
1.179016, 1.588439, 0.6977165, 0, 0, 0, 1, 1,
1.179922, 0.2174968, 1.425773, 0, 0, 0, 1, 1,
1.183639, 1.342857, 1.246513, 0, 0, 0, 1, 1,
1.183889, -0.2134554, 1.34355, 0, 0, 0, 1, 1,
1.189348, 0.2507143, 0.8719585, 1, 1, 1, 1, 1,
1.189719, 0.5225508, 1.874508, 1, 1, 1, 1, 1,
1.190212, -0.00559102, 0.418074, 1, 1, 1, 1, 1,
1.192145, 0.7070552, 2.058643, 1, 1, 1, 1, 1,
1.195953, 0.7931448, 0.2550007, 1, 1, 1, 1, 1,
1.210194, 0.2305744, 1.245187, 1, 1, 1, 1, 1,
1.217015, -0.9068744, 0.7806888, 1, 1, 1, 1, 1,
1.222825, -0.2237144, 1.734145, 1, 1, 1, 1, 1,
1.224899, -0.09862891, 1.327705, 1, 1, 1, 1, 1,
1.233049, 0.6854922, 0.03007462, 1, 1, 1, 1, 1,
1.268387, -1.346858, 2.353631, 1, 1, 1, 1, 1,
1.275198, 0.8135649, 0.01805853, 1, 1, 1, 1, 1,
1.276331, 0.7879753, 1.610451, 1, 1, 1, 1, 1,
1.284091, -0.8685385, 0.4670797, 1, 1, 1, 1, 1,
1.297124, 1.140327, 0.6405464, 1, 1, 1, 1, 1,
1.312652, -0.01585224, 1.586165, 0, 0, 1, 1, 1,
1.345627, 1.233094, 0.2720008, 1, 0, 0, 1, 1,
1.351848, -0.006749933, 0.1970933, 1, 0, 0, 1, 1,
1.354235, 1.322896, 1.095739, 1, 0, 0, 1, 1,
1.354469, 1.624399, 0.3782237, 1, 0, 0, 1, 1,
1.354482, 0.8505372, 1.359169, 1, 0, 0, 1, 1,
1.358053, 1.449367, 2.496513, 0, 0, 0, 1, 1,
1.364389, -0.7191887, 2.85694, 0, 0, 0, 1, 1,
1.372155, 0.09573025, 1.351051, 0, 0, 0, 1, 1,
1.38294, -0.5629654, 1.446532, 0, 0, 0, 1, 1,
1.391441, 0.6488151, 1.152519, 0, 0, 0, 1, 1,
1.400586, -1.927382, 3.592833, 0, 0, 0, 1, 1,
1.403623, 0.2199016, 0.4038274, 0, 0, 0, 1, 1,
1.404251, -0.1317987, -0.09790836, 1, 1, 1, 1, 1,
1.428165, -2.064147, 2.647241, 1, 1, 1, 1, 1,
1.438403, 0.09327606, 3.077768, 1, 1, 1, 1, 1,
1.457291, -0.7961327, 1.364438, 1, 1, 1, 1, 1,
1.458804, 0.4760466, 0.3991626, 1, 1, 1, 1, 1,
1.476176, 0.6830896, 1.57645, 1, 1, 1, 1, 1,
1.480716, 0.8641452, 1.505002, 1, 1, 1, 1, 1,
1.486866, 1.227985, 2.222367, 1, 1, 1, 1, 1,
1.487118, -0.504807, 0.5678749, 1, 1, 1, 1, 1,
1.495353, 1.05203, 0.5281342, 1, 1, 1, 1, 1,
1.49751, -1.663336, 1.192247, 1, 1, 1, 1, 1,
1.501105, -1.45755, 3.787115, 1, 1, 1, 1, 1,
1.519978, 0.04733152, 0.8821287, 1, 1, 1, 1, 1,
1.534094, 0.5370173, 1.686216, 1, 1, 1, 1, 1,
1.535639, -0.3583548, 2.952503, 1, 1, 1, 1, 1,
1.542873, -0.6279191, 1.760948, 0, 0, 1, 1, 1,
1.563463, -1.20402, 1.752849, 1, 0, 0, 1, 1,
1.563478, 0.6107686, -0.6865966, 1, 0, 0, 1, 1,
1.563949, -1.830058, 3.353817, 1, 0, 0, 1, 1,
1.567078, -1.571892, 0.4377607, 1, 0, 0, 1, 1,
1.576338, 1.217583, 0.6607044, 1, 0, 0, 1, 1,
1.586992, 0.9012497, 1.397543, 0, 0, 0, 1, 1,
1.589785, 0.5551147, 1.210861, 0, 0, 0, 1, 1,
1.591093, -0.918635, 2.438275, 0, 0, 0, 1, 1,
1.594273, 1.267688, 2.102103, 0, 0, 0, 1, 1,
1.598796, -1.044858, 2.528955, 0, 0, 0, 1, 1,
1.609708, -0.7306457, 2.128657, 0, 0, 0, 1, 1,
1.612406, -0.08764691, 0.6671968, 0, 0, 0, 1, 1,
1.613334, 0.9360496, 1.623132, 1, 1, 1, 1, 1,
1.61415, -0.01458201, 2.335076, 1, 1, 1, 1, 1,
1.616527, -1.516807, 1.064659, 1, 1, 1, 1, 1,
1.624929, 0.2969112, 1.417269, 1, 1, 1, 1, 1,
1.634222, 0.1793547, 1.422698, 1, 1, 1, 1, 1,
1.656276, -0.3323979, 2.66273, 1, 1, 1, 1, 1,
1.659057, 0.3134068, -0.1270807, 1, 1, 1, 1, 1,
1.659303, 0.02945499, 3.195899, 1, 1, 1, 1, 1,
1.659513, 1.063674, 1.431461, 1, 1, 1, 1, 1,
1.66993, -0.1044005, 1.720455, 1, 1, 1, 1, 1,
1.674324, 0.2630885, 2.047196, 1, 1, 1, 1, 1,
1.699038, -0.5267621, 1.73767, 1, 1, 1, 1, 1,
1.69924, -0.8412057, 2.773075, 1, 1, 1, 1, 1,
1.711243, -0.5703726, 0.8882419, 1, 1, 1, 1, 1,
1.727046, -0.778587, -0.6171993, 1, 1, 1, 1, 1,
1.731624, 2.540774, 0.8280815, 0, 0, 1, 1, 1,
1.754139, 0.9029336, -0.4619961, 1, 0, 0, 1, 1,
1.772035, 0.1647771, 1.785174, 1, 0, 0, 1, 1,
1.775624, -0.06741606, 0.6945208, 1, 0, 0, 1, 1,
1.781821, 1.28189, 0.3744801, 1, 0, 0, 1, 1,
1.784483, -1.219828, 3.092336, 1, 0, 0, 1, 1,
1.790617, -0.5151264, 3.599151, 0, 0, 0, 1, 1,
1.800519, -0.7871004, 0.3985828, 0, 0, 0, 1, 1,
1.806557, 1.68544, 2.227042, 0, 0, 0, 1, 1,
1.810843, 0.8861762, 0.8305102, 0, 0, 0, 1, 1,
1.817994, 0.2552508, 0.7894552, 0, 0, 0, 1, 1,
1.820683, -1.89542, 2.447365, 0, 0, 0, 1, 1,
1.82163, 1.673798, 1.95835, 0, 0, 0, 1, 1,
1.825219, 0.5386893, 1.004139, 1, 1, 1, 1, 1,
1.826137, -1.38093, 1.210083, 1, 1, 1, 1, 1,
1.828033, -0.8513842, 1.288767, 1, 1, 1, 1, 1,
1.843785, -1.262789, 1.642917, 1, 1, 1, 1, 1,
1.867495, -0.104901, 2.952427, 1, 1, 1, 1, 1,
1.901268, 0.7383108, 1.116863, 1, 1, 1, 1, 1,
1.978747, -0.6844603, 1.312114, 1, 1, 1, 1, 1,
2.019491, 1.011245, 1.767025, 1, 1, 1, 1, 1,
2.025412, -0.1132034, 0.6568832, 1, 1, 1, 1, 1,
2.027369, 0.08296166, 2.656754, 1, 1, 1, 1, 1,
2.03475, -0.3380761, 0.005494962, 1, 1, 1, 1, 1,
2.065896, 0.6252966, 1.703874, 1, 1, 1, 1, 1,
2.071471, -0.781095, 2.076196, 1, 1, 1, 1, 1,
2.073618, -1.092061, -0.4010789, 1, 1, 1, 1, 1,
2.080341, -0.4675816, 1.878245, 1, 1, 1, 1, 1,
2.100847, -0.983112, 1.949284, 0, 0, 1, 1, 1,
2.13414, 0.3542974, 2.601822, 1, 0, 0, 1, 1,
2.167822, 0.5612229, 2.455745, 1, 0, 0, 1, 1,
2.237259, 0.7131536, 2.649503, 1, 0, 0, 1, 1,
2.238441, 0.02462693, 0.1707199, 1, 0, 0, 1, 1,
2.264266, 0.3593041, 1.810712, 1, 0, 0, 1, 1,
2.269774, 1.693295, 1.402322, 0, 0, 0, 1, 1,
2.305998, 0.2520853, 2.135179, 0, 0, 0, 1, 1,
2.312703, -1.406682, 2.178936, 0, 0, 0, 1, 1,
2.359033, -1.335098, 2.212939, 0, 0, 0, 1, 1,
2.43292, 0.1641886, 3.13084, 0, 0, 0, 1, 1,
2.485398, -1.551605, 0.5688412, 0, 0, 0, 1, 1,
2.500419, -0.09423418, 2.033314, 0, 0, 0, 1, 1,
2.541357, -0.2310179, 2.405414, 1, 1, 1, 1, 1,
2.637441, -1.010092, 2.538263, 1, 1, 1, 1, 1,
2.821591, -1.187805, 3.352566, 1, 1, 1, 1, 1,
3.013547, -1.579333, 2.713823, 1, 1, 1, 1, 1,
3.062397, 1.754368, 0.8983217, 1, 1, 1, 1, 1,
3.374818, 0.1423327, 1.690076, 1, 1, 1, 1, 1,
3.854267, -0.7755502, 2.280335, 1, 1, 1, 1, 1
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
var radius = 10.21453;
var distance = 35.87809;
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
mvMatrix.translate( -0.1706696, 0.1207447, 0.2797441 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.87809);
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