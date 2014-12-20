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
-2.524922, 0.5321663, -0.9223546, 1, 0, 0, 1,
-2.513459, -0.8058516, -2.201616, 1, 0.007843138, 0, 1,
-2.482645, 1.013102, -2.104671, 1, 0.01176471, 0, 1,
-2.367808, -0.02144774, -1.784305, 1, 0.01960784, 0, 1,
-2.359818, -0.1332168, -1.830291, 1, 0.02352941, 0, 1,
-2.345882, -0.04221825, -2.165217, 1, 0.03137255, 0, 1,
-2.330338, -2.188704, -2.280223, 1, 0.03529412, 0, 1,
-2.319835, 0.3116972, -2.81109, 1, 0.04313726, 0, 1,
-2.307791, -0.1089281, -1.60057, 1, 0.04705882, 0, 1,
-2.284397, 1.099342, -1.982035, 1, 0.05490196, 0, 1,
-2.258305, 0.2550463, -0.2032014, 1, 0.05882353, 0, 1,
-2.249644, -0.05628071, -1.479064, 1, 0.06666667, 0, 1,
-2.143151, -0.2932011, -2.004961, 1, 0.07058824, 0, 1,
-2.108217, 1.623831, 1.191777, 1, 0.07843138, 0, 1,
-2.065609, -0.3546674, -1.679855, 1, 0.08235294, 0, 1,
-2.053183, -1.74556, -1.837929, 1, 0.09019608, 0, 1,
-2.046819, -0.4605861, -2.9403, 1, 0.09411765, 0, 1,
-2.032699, -0.4368347, -2.204888, 1, 0.1019608, 0, 1,
-2.02279, -0.2507006, -3.006738, 1, 0.1098039, 0, 1,
-2.008787, 0.8746412, -1.028947, 1, 0.1137255, 0, 1,
-2.002799, -1.713672, -0.3753201, 1, 0.1215686, 0, 1,
-1.98988, 2.026536, -0.1625145, 1, 0.1254902, 0, 1,
-1.973004, 0.3964867, -2.924417, 1, 0.1333333, 0, 1,
-1.953512, -1.405005, -0.0784979, 1, 0.1372549, 0, 1,
-1.946086, 0.4675295, -0.3409451, 1, 0.145098, 0, 1,
-1.941091, -0.09468781, -2.075868, 1, 0.1490196, 0, 1,
-1.93686, 0.217041, -3.327468, 1, 0.1568628, 0, 1,
-1.931432, 1.005022, -2.993683, 1, 0.1607843, 0, 1,
-1.865517, 0.0794625, -1.088863, 1, 0.1686275, 0, 1,
-1.822326, -0.2535958, 0.2148027, 1, 0.172549, 0, 1,
-1.804151, 0.6261661, -1.065673, 1, 0.1803922, 0, 1,
-1.788298, -0.2202496, -1.590297, 1, 0.1843137, 0, 1,
-1.787721, 1.604592, 0.2391358, 1, 0.1921569, 0, 1,
-1.786786, 1.198392, -0.6553722, 1, 0.1960784, 0, 1,
-1.769187, 0.9540269, -1.050508, 1, 0.2039216, 0, 1,
-1.759042, -1.171257, -3.290431, 1, 0.2117647, 0, 1,
-1.758443, 0.3658496, -0.08487675, 1, 0.2156863, 0, 1,
-1.757368, -0.1546994, -0.7550761, 1, 0.2235294, 0, 1,
-1.709963, 2.433432, -0.3467155, 1, 0.227451, 0, 1,
-1.704667, 0.745577, -1.690327, 1, 0.2352941, 0, 1,
-1.692257, 0.07992157, -1.650494, 1, 0.2392157, 0, 1,
-1.679958, 0.3311635, -2.654713, 1, 0.2470588, 0, 1,
-1.678726, -0.323857, -0.9353459, 1, 0.2509804, 0, 1,
-1.67255, 1.030394, -0.630988, 1, 0.2588235, 0, 1,
-1.667047, -0.9263809, -2.653818, 1, 0.2627451, 0, 1,
-1.6617, -1.231489, -2.750336, 1, 0.2705882, 0, 1,
-1.635704, -0.9087629, -1.788786, 1, 0.2745098, 0, 1,
-1.62379, -0.275095, -1.546984, 1, 0.282353, 0, 1,
-1.613526, 1.279672, -2.234287, 1, 0.2862745, 0, 1,
-1.609769, -0.2785708, -2.410131, 1, 0.2941177, 0, 1,
-1.609617, -1.186619, -1.938695, 1, 0.3019608, 0, 1,
-1.606831, 0.8036267, -2.599932, 1, 0.3058824, 0, 1,
-1.591085, 0.5549164, -0.5909125, 1, 0.3137255, 0, 1,
-1.56237, -1.240125, -3.119967, 1, 0.3176471, 0, 1,
-1.558386, 0.1008525, -0.8971193, 1, 0.3254902, 0, 1,
-1.557727, 0.05572296, -1.4735, 1, 0.3294118, 0, 1,
-1.55764, 1.243358, -1.881994, 1, 0.3372549, 0, 1,
-1.547632, 0.3076018, -3.632489, 1, 0.3411765, 0, 1,
-1.514293, -0.7986718, -1.02749, 1, 0.3490196, 0, 1,
-1.505831, 0.7302395, -1.992242, 1, 0.3529412, 0, 1,
-1.503012, 1.489571, -1.035895, 1, 0.3607843, 0, 1,
-1.501373, -1.468528, -1.676457, 1, 0.3647059, 0, 1,
-1.473267, 0.01984908, -0.6415886, 1, 0.372549, 0, 1,
-1.454124, -0.06843138, -2.988806, 1, 0.3764706, 0, 1,
-1.452173, 1.550382, 0.9800478, 1, 0.3843137, 0, 1,
-1.442346, 1.697245, -1.487507, 1, 0.3882353, 0, 1,
-1.428061, -2.776229, -1.724801, 1, 0.3960784, 0, 1,
-1.425996, -2.138105, -2.89568, 1, 0.4039216, 0, 1,
-1.408319, -1.139035, -1.467919, 1, 0.4078431, 0, 1,
-1.40302, 0.1326794, -1.199086, 1, 0.4156863, 0, 1,
-1.402084, 0.876024, 0.2323389, 1, 0.4196078, 0, 1,
-1.392151, 0.3747788, -0.8115512, 1, 0.427451, 0, 1,
-1.390118, 0.1685799, 0.1609058, 1, 0.4313726, 0, 1,
-1.382353, 0.4539945, -1.875559, 1, 0.4392157, 0, 1,
-1.380658, -2.195514, -2.910831, 1, 0.4431373, 0, 1,
-1.377109, -0.4209335, -3.279791, 1, 0.4509804, 0, 1,
-1.375049, 0.8945687, -0.7160639, 1, 0.454902, 0, 1,
-1.374055, 0.1755793, -1.199324, 1, 0.4627451, 0, 1,
-1.369605, -0.04733049, -1.004975, 1, 0.4666667, 0, 1,
-1.362231, 0.2340964, -1.378293, 1, 0.4745098, 0, 1,
-1.35014, -1.64556, -2.881735, 1, 0.4784314, 0, 1,
-1.350021, 0.2012444, -1.134241, 1, 0.4862745, 0, 1,
-1.349592, 1.700208, -0.8196049, 1, 0.4901961, 0, 1,
-1.333212, -0.2825958, -2.009508, 1, 0.4980392, 0, 1,
-1.319669, 1.258864, -0.4368394, 1, 0.5058824, 0, 1,
-1.3179, -1.326634, -0.2200236, 1, 0.509804, 0, 1,
-1.312805, 0.9656546, -1.329756, 1, 0.5176471, 0, 1,
-1.30974, -1.810982, -3.788021, 1, 0.5215687, 0, 1,
-1.308843, 0.3210821, -1.537904, 1, 0.5294118, 0, 1,
-1.308024, -0.6519955, -0.3580703, 1, 0.5333334, 0, 1,
-1.290571, 0.5311982, -1.448675, 1, 0.5411765, 0, 1,
-1.288651, -0.5850304, -3.396926, 1, 0.5450981, 0, 1,
-1.285912, 2.529667, -1.681557, 1, 0.5529412, 0, 1,
-1.278983, 0.6561086, -2.456283, 1, 0.5568628, 0, 1,
-1.263967, -0.1884301, -2.601815, 1, 0.5647059, 0, 1,
-1.257406, -1.133684, -3.187282, 1, 0.5686275, 0, 1,
-1.250182, -0.06139931, -2.713061, 1, 0.5764706, 0, 1,
-1.248471, 0.8330772, -2.136201, 1, 0.5803922, 0, 1,
-1.236241, 0.1798648, -1.509889, 1, 0.5882353, 0, 1,
-1.233873, 0.1500134, -1.543277, 1, 0.5921569, 0, 1,
-1.233321, -0.7088084, -1.600044, 1, 0.6, 0, 1,
-1.232111, 2.120018, -0.1307873, 1, 0.6078432, 0, 1,
-1.225709, -0.5070457, -2.741643, 1, 0.6117647, 0, 1,
-1.21982, -1.456381, -0.3865775, 1, 0.6196079, 0, 1,
-1.218531, -0.3904453, -0.7402614, 1, 0.6235294, 0, 1,
-1.20204, -0.9733324, -1.734537, 1, 0.6313726, 0, 1,
-1.197935, -0.310056, -2.429235, 1, 0.6352941, 0, 1,
-1.190333, 0.5491005, -1.436787, 1, 0.6431373, 0, 1,
-1.187377, 0.4966092, -0.2745191, 1, 0.6470588, 0, 1,
-1.184302, -1.539009, -2.559704, 1, 0.654902, 0, 1,
-1.183348, -0.5546609, -4.277068, 1, 0.6588235, 0, 1,
-1.181837, 0.4965629, 0.4508966, 1, 0.6666667, 0, 1,
-1.179783, 0.3951352, -1.33486, 1, 0.6705883, 0, 1,
-1.178652, 0.3439488, -0.911551, 1, 0.6784314, 0, 1,
-1.172173, 0.9053916, -1.199486, 1, 0.682353, 0, 1,
-1.167121, 0.77416, -0.8633075, 1, 0.6901961, 0, 1,
-1.164177, 1.007578, -0.3853755, 1, 0.6941177, 0, 1,
-1.155668, 0.03718041, -2.436203, 1, 0.7019608, 0, 1,
-1.153587, -0.570119, -2.214962, 1, 0.7098039, 0, 1,
-1.146924, 0.09920069, -0.4821759, 1, 0.7137255, 0, 1,
-1.142591, 1.317575, -0.5379233, 1, 0.7215686, 0, 1,
-1.139928, -2.689399, -2.444485, 1, 0.7254902, 0, 1,
-1.137914, -0.07567643, 0.2286737, 1, 0.7333333, 0, 1,
-1.136668, -0.5356026, -3.050693, 1, 0.7372549, 0, 1,
-1.135051, -0.5684978, -1.233389, 1, 0.7450981, 0, 1,
-1.132599, -0.9773371, -2.866182, 1, 0.7490196, 0, 1,
-1.122536, -0.7964486, -0.7188274, 1, 0.7568628, 0, 1,
-1.110653, -1.211598, -3.18525, 1, 0.7607843, 0, 1,
-1.102086, -0.01997321, -1.03028, 1, 0.7686275, 0, 1,
-1.099467, 0.913743, -1.650161, 1, 0.772549, 0, 1,
-1.097576, -0.7332509, -2.845573, 1, 0.7803922, 0, 1,
-1.082977, 0.2946916, -2.826772, 1, 0.7843137, 0, 1,
-1.079572, -1.242172, -3.477917, 1, 0.7921569, 0, 1,
-1.076224, -1.030755, -2.629607, 1, 0.7960784, 0, 1,
-1.071943, 0.9120141, -1.59403, 1, 0.8039216, 0, 1,
-1.071401, -0.3079853, -2.271687, 1, 0.8117647, 0, 1,
-1.070533, -0.6722633, -1.944631, 1, 0.8156863, 0, 1,
-1.063621, 0.9250591, -0.897779, 1, 0.8235294, 0, 1,
-1.06132, 0.9295827, -1.047078, 1, 0.827451, 0, 1,
-1.060394, -0.7559052, -1.30759, 1, 0.8352941, 0, 1,
-1.058854, -1.716954, -3.080251, 1, 0.8392157, 0, 1,
-1.041881, -0.5961758, -2.79405, 1, 0.8470588, 0, 1,
-1.038565, 0.1559111, -0.9497474, 1, 0.8509804, 0, 1,
-1.037954, -0.951681, -1.572738, 1, 0.8588235, 0, 1,
-1.036595, 0.02457876, -2.206524, 1, 0.8627451, 0, 1,
-1.031767, -0.8848289, -2.528762, 1, 0.8705882, 0, 1,
-1.029946, 1.588908, 0.5040195, 1, 0.8745098, 0, 1,
-1.024436, -0.5424508, -0.6999228, 1, 0.8823529, 0, 1,
-1.023912, 1.464459, -0.5214469, 1, 0.8862745, 0, 1,
-1.021989, 0.8570486, -0.1372013, 1, 0.8941177, 0, 1,
-1.021969, -0.1026239, -0.8090765, 1, 0.8980392, 0, 1,
-1.020922, -0.2459779, -1.842286, 1, 0.9058824, 0, 1,
-1.017084, -2.635776, -2.041145, 1, 0.9137255, 0, 1,
-1.006239, 0.6081315, -0.9808317, 1, 0.9176471, 0, 1,
-1.001922, 1.017382, 0.4247763, 1, 0.9254902, 0, 1,
-1.000281, -0.4642388, -1.608902, 1, 0.9294118, 0, 1,
-1.000142, -1.444195, -3.537869, 1, 0.9372549, 0, 1,
-0.9957269, 0.4015457, -0.9022729, 1, 0.9411765, 0, 1,
-0.9955688, -0.2619155, -2.585241, 1, 0.9490196, 0, 1,
-0.9867764, 0.2179616, -1.350233, 1, 0.9529412, 0, 1,
-0.9799799, 1.976445, 1.19088, 1, 0.9607843, 0, 1,
-0.9787402, -0.6676592, 0.657037, 1, 0.9647059, 0, 1,
-0.9758359, 1.472675, -1.31347, 1, 0.972549, 0, 1,
-0.9743325, -0.9514702, -1.981814, 1, 0.9764706, 0, 1,
-0.967563, 1.382769, 0.1837886, 1, 0.9843137, 0, 1,
-0.9639999, -1.235059, -1.976116, 1, 0.9882353, 0, 1,
-0.9560553, -1.811783, -2.282743, 1, 0.9960784, 0, 1,
-0.9526958, 0.4345838, -1.257322, 0.9960784, 1, 0, 1,
-0.9411887, 1.344274, -0.4589963, 0.9921569, 1, 0, 1,
-0.9330091, -0.3046946, -0.9242611, 0.9843137, 1, 0, 1,
-0.9304334, 0.1412135, -1.714076, 0.9803922, 1, 0, 1,
-0.9260411, -0.200553, -0.5025751, 0.972549, 1, 0, 1,
-0.9226936, 0.6373311, -1.655157, 0.9686275, 1, 0, 1,
-0.9212345, 0.7606878, -1.943276, 0.9607843, 1, 0, 1,
-0.9200613, 0.5635391, 0.6938825, 0.9568627, 1, 0, 1,
-0.9155692, 0.0253571, -2.076625, 0.9490196, 1, 0, 1,
-0.9051911, 0.5475989, -1.055508, 0.945098, 1, 0, 1,
-0.8988308, -1.941366, -2.327044, 0.9372549, 1, 0, 1,
-0.8985544, -0.8368148, -1.832869, 0.9333333, 1, 0, 1,
-0.8956418, 0.3232538, -1.628662, 0.9254902, 1, 0, 1,
-0.8920187, 0.9296481, -0.6871449, 0.9215686, 1, 0, 1,
-0.8917085, -0.1148964, -2.631725, 0.9137255, 1, 0, 1,
-0.8877242, -0.1771326, -1.018081, 0.9098039, 1, 0, 1,
-0.8863372, -2.183694, -5.338502, 0.9019608, 1, 0, 1,
-0.8815986, -1.812774, -1.982437, 0.8941177, 1, 0, 1,
-0.8668891, -0.9746833, -0.848726, 0.8901961, 1, 0, 1,
-0.8667619, -0.5675319, -3.363147, 0.8823529, 1, 0, 1,
-0.865818, 0.5065168, -1.590224, 0.8784314, 1, 0, 1,
-0.86442, -0.6389256, -1.795881, 0.8705882, 1, 0, 1,
-0.8636705, 0.9324231, -1.580731, 0.8666667, 1, 0, 1,
-0.8628775, -0.5679311, -1.519424, 0.8588235, 1, 0, 1,
-0.8593189, -0.9940714, -2.077362, 0.854902, 1, 0, 1,
-0.8566779, 0.3139351, -1.838555, 0.8470588, 1, 0, 1,
-0.856473, 1.460568, -2.025863, 0.8431373, 1, 0, 1,
-0.8556017, -0.3923521, -3.214612, 0.8352941, 1, 0, 1,
-0.8541942, -0.7156838, -1.832363, 0.8313726, 1, 0, 1,
-0.852721, -0.5032386, -2.725723, 0.8235294, 1, 0, 1,
-0.8499771, 0.4433672, -0.2623764, 0.8196079, 1, 0, 1,
-0.8479167, -1.948623, -2.794333, 0.8117647, 1, 0, 1,
-0.8445505, 0.3483267, -1.900337, 0.8078431, 1, 0, 1,
-0.8392038, -0.3902043, -2.463476, 0.8, 1, 0, 1,
-0.8349047, -1.329492, -2.536938, 0.7921569, 1, 0, 1,
-0.8258772, 0.734368, -0.1291922, 0.7882353, 1, 0, 1,
-0.8230882, 0.5248536, -1.275326, 0.7803922, 1, 0, 1,
-0.8223745, 0.7531716, -0.6232365, 0.7764706, 1, 0, 1,
-0.8185483, 1.114798, 0.2762953, 0.7686275, 1, 0, 1,
-0.8143706, 1.973761, -0.7883467, 0.7647059, 1, 0, 1,
-0.8138943, 1.317673, 0.9239712, 0.7568628, 1, 0, 1,
-0.8126371, -0.3691981, -1.534005, 0.7529412, 1, 0, 1,
-0.8116331, -1.228061, -1.989021, 0.7450981, 1, 0, 1,
-0.8094764, 0.09442662, -2.344259, 0.7411765, 1, 0, 1,
-0.807943, -1.226999, -2.515955, 0.7333333, 1, 0, 1,
-0.80784, 0.7859762, -1.956796, 0.7294118, 1, 0, 1,
-0.7994959, -0.4134338, -1.587768, 0.7215686, 1, 0, 1,
-0.7967826, 0.9960846, -2.394007, 0.7176471, 1, 0, 1,
-0.7965962, -0.9738992, -1.861853, 0.7098039, 1, 0, 1,
-0.7952033, 0.4100155, -1.870605, 0.7058824, 1, 0, 1,
-0.7928079, 0.9985183, -3.195426, 0.6980392, 1, 0, 1,
-0.7875717, 0.6644163, -0.07585707, 0.6901961, 1, 0, 1,
-0.7763693, 0.8381672, -0.4966845, 0.6862745, 1, 0, 1,
-0.7743523, 0.7327708, -1.727134, 0.6784314, 1, 0, 1,
-0.7671987, -0.5152684, -2.049007, 0.6745098, 1, 0, 1,
-0.7631527, 0.6080988, 0.8399296, 0.6666667, 1, 0, 1,
-0.7538841, 1.278313, -1.115445, 0.6627451, 1, 0, 1,
-0.7507726, -1.444662, -2.152614, 0.654902, 1, 0, 1,
-0.7484902, -0.756424, -2.054072, 0.6509804, 1, 0, 1,
-0.7384143, 0.6786616, -1.721417, 0.6431373, 1, 0, 1,
-0.7372302, 0.1777855, -0.1005103, 0.6392157, 1, 0, 1,
-0.7353976, 0.6361887, -1.495426, 0.6313726, 1, 0, 1,
-0.7331656, 0.2178012, -0.2087804, 0.627451, 1, 0, 1,
-0.7323748, -0.571399, -3.057734, 0.6196079, 1, 0, 1,
-0.7313261, -0.04292762, -2.14792, 0.6156863, 1, 0, 1,
-0.7295114, 0.5221124, -1.255628, 0.6078432, 1, 0, 1,
-0.7275825, -0.01730823, -1.289486, 0.6039216, 1, 0, 1,
-0.7267324, -1.534541, -1.542698, 0.5960785, 1, 0, 1,
-0.7253695, -0.6439438, -2.246294, 0.5882353, 1, 0, 1,
-0.7168797, 0.2305556, -1.136761, 0.5843138, 1, 0, 1,
-0.7151546, 1.544034, -0.5427818, 0.5764706, 1, 0, 1,
-0.7088605, -0.2314802, -1.563362, 0.572549, 1, 0, 1,
-0.6946051, 0.3231226, 1.58405, 0.5647059, 1, 0, 1,
-0.6943737, 1.225325, -1.739825, 0.5607843, 1, 0, 1,
-0.6847436, -1.063275, -4.574849, 0.5529412, 1, 0, 1,
-0.680844, 0.529082, -1.181882, 0.5490196, 1, 0, 1,
-0.6770478, -0.165697, -3.157422, 0.5411765, 1, 0, 1,
-0.6683984, -0.4268341, -3.03016, 0.5372549, 1, 0, 1,
-0.6667774, 0.2331294, 0.6285818, 0.5294118, 1, 0, 1,
-0.6653067, -0.5068657, -3.9335, 0.5254902, 1, 0, 1,
-0.6641987, 0.230205, -2.350449, 0.5176471, 1, 0, 1,
-0.6632956, 0.02363931, -1.86026, 0.5137255, 1, 0, 1,
-0.6620725, -0.4452959, -1.434795, 0.5058824, 1, 0, 1,
-0.6582605, -0.3645143, -1.718253, 0.5019608, 1, 0, 1,
-0.658051, -0.2568692, -1.304134, 0.4941176, 1, 0, 1,
-0.6567754, 0.5901761, -1.16073, 0.4862745, 1, 0, 1,
-0.6533367, -0.6807485, -1.889056, 0.4823529, 1, 0, 1,
-0.6530985, -0.4685924, -2.197015, 0.4745098, 1, 0, 1,
-0.6498628, -1.868248, -1.619054, 0.4705882, 1, 0, 1,
-0.6474108, 0.06828886, -1.170693, 0.4627451, 1, 0, 1,
-0.637733, -0.2158394, -1.034708, 0.4588235, 1, 0, 1,
-0.6342874, 1.124756, -0.2148084, 0.4509804, 1, 0, 1,
-0.6208807, -0.9938585, -4.019597, 0.4470588, 1, 0, 1,
-0.6204917, 0.100039, -0.535358, 0.4392157, 1, 0, 1,
-0.6201965, -0.4944631, -2.963244, 0.4352941, 1, 0, 1,
-0.6167125, 1.043042, -1.38922, 0.427451, 1, 0, 1,
-0.6143839, -0.7358792, -2.551156, 0.4235294, 1, 0, 1,
-0.6141323, 0.29493, -0.8375912, 0.4156863, 1, 0, 1,
-0.6093435, -0.83623, -2.911064, 0.4117647, 1, 0, 1,
-0.6089296, -1.442471, -2.975761, 0.4039216, 1, 0, 1,
-0.6078597, 0.9467371, 0.01168849, 0.3960784, 1, 0, 1,
-0.6074779, -0.2547526, -0.9620674, 0.3921569, 1, 0, 1,
-0.5951048, 0.3138143, -1.235299, 0.3843137, 1, 0, 1,
-0.5937825, 0.7357476, 0.3280903, 0.3803922, 1, 0, 1,
-0.5937635, -1.208861, -2.856383, 0.372549, 1, 0, 1,
-0.5915197, -0.5212591, -2.635947, 0.3686275, 1, 0, 1,
-0.5913575, -0.4278813, -1.363831, 0.3607843, 1, 0, 1,
-0.589038, 0.1940517, -1.302552, 0.3568628, 1, 0, 1,
-0.5859016, 1.378387, -0.005217989, 0.3490196, 1, 0, 1,
-0.5847828, -1.126118, -2.46445, 0.345098, 1, 0, 1,
-0.5842302, -0.5499045, -1.805534, 0.3372549, 1, 0, 1,
-0.5819125, -1.202567, -1.974347, 0.3333333, 1, 0, 1,
-0.5811409, 0.7067158, -0.1452184, 0.3254902, 1, 0, 1,
-0.5806489, -0.4921813, -2.284199, 0.3215686, 1, 0, 1,
-0.5782082, -0.957898, -3.317755, 0.3137255, 1, 0, 1,
-0.577825, -1.744864, -3.722846, 0.3098039, 1, 0, 1,
-0.5770123, -0.5129098, -2.937367, 0.3019608, 1, 0, 1,
-0.5733387, 0.2009393, -1.68426, 0.2941177, 1, 0, 1,
-0.5662471, 0.4806035, 0.6206661, 0.2901961, 1, 0, 1,
-0.5659193, 0.7685612, -0.8206751, 0.282353, 1, 0, 1,
-0.555107, 0.7557878, 1.705294, 0.2784314, 1, 0, 1,
-0.5525546, 0.5767067, -1.192351, 0.2705882, 1, 0, 1,
-0.551873, -0.04442728, -2.295983, 0.2666667, 1, 0, 1,
-0.5482762, 1.841066, -0.468023, 0.2588235, 1, 0, 1,
-0.5395249, -0.1734397, -2.738582, 0.254902, 1, 0, 1,
-0.5381306, -0.2367195, -2.781095, 0.2470588, 1, 0, 1,
-0.5376417, -1.539563, -2.951407, 0.2431373, 1, 0, 1,
-0.5336517, -0.02280545, -1.156126, 0.2352941, 1, 0, 1,
-0.5318476, 0.266493, -0.2000005, 0.2313726, 1, 0, 1,
-0.5308726, 0.4088051, -1.324449, 0.2235294, 1, 0, 1,
-0.5220273, 0.1723266, -1.005159, 0.2196078, 1, 0, 1,
-0.5214456, 0.2180099, -2.377366, 0.2117647, 1, 0, 1,
-0.5190447, -0.3729551, -0.5743718, 0.2078431, 1, 0, 1,
-0.513006, -1.183499, -3.430555, 0.2, 1, 0, 1,
-0.5119362, -0.4374175, -1.819677, 0.1921569, 1, 0, 1,
-0.5092129, -0.7913511, -2.483304, 0.1882353, 1, 0, 1,
-0.5039269, -0.8784571, -3.184862, 0.1803922, 1, 0, 1,
-0.497404, 0.00663769, -1.275749, 0.1764706, 1, 0, 1,
-0.4937729, -0.3618882, -0.6948544, 0.1686275, 1, 0, 1,
-0.4893089, -1.309755, -3.806168, 0.1647059, 1, 0, 1,
-0.4892724, -0.004408611, -1.45183, 0.1568628, 1, 0, 1,
-0.4864093, -1.360358, -1.393511, 0.1529412, 1, 0, 1,
-0.4775967, -0.4066198, -1.486343, 0.145098, 1, 0, 1,
-0.4765161, -0.9419017, -3.331412, 0.1411765, 1, 0, 1,
-0.4726307, -0.1768734, -3.451818, 0.1333333, 1, 0, 1,
-0.471814, -1.635318, -2.668949, 0.1294118, 1, 0, 1,
-0.4692671, -0.005252908, -0.4819214, 0.1215686, 1, 0, 1,
-0.4652844, -0.6814615, -3.424985, 0.1176471, 1, 0, 1,
-0.4646828, -0.3135749, -3.134067, 0.1098039, 1, 0, 1,
-0.4637873, 0.1033565, -1.523798, 0.1058824, 1, 0, 1,
-0.4637784, 1.150068, -0.01158397, 0.09803922, 1, 0, 1,
-0.4628457, 0.2877945, -2.308097, 0.09019608, 1, 0, 1,
-0.4542845, 0.3934763, 1.469091, 0.08627451, 1, 0, 1,
-0.4542536, -0.729162, -3.41646, 0.07843138, 1, 0, 1,
-0.4539289, 0.1184288, -2.648635, 0.07450981, 1, 0, 1,
-0.4535818, -0.9526824, -4.03436, 0.06666667, 1, 0, 1,
-0.4495033, 0.2106436, -1.698744, 0.0627451, 1, 0, 1,
-0.4465904, 0.5716078, -0.8319531, 0.05490196, 1, 0, 1,
-0.4465514, 0.4580433, -2.174124, 0.05098039, 1, 0, 1,
-0.4451555, -1.040617, -4.713358, 0.04313726, 1, 0, 1,
-0.4446744, 0.8708879, -2.436415, 0.03921569, 1, 0, 1,
-0.4416856, -0.09921838, -2.756058, 0.03137255, 1, 0, 1,
-0.4224509, -0.3205194, -1.390179, 0.02745098, 1, 0, 1,
-0.4187295, 0.4284149, -1.343795, 0.01960784, 1, 0, 1,
-0.4181104, -2.880099, -1.959938, 0.01568628, 1, 0, 1,
-0.4160684, -7.416899e-05, -3.195774, 0.007843138, 1, 0, 1,
-0.413325, -0.8514335, -2.276216, 0.003921569, 1, 0, 1,
-0.412228, 0.09220754, -2.08448, 0, 1, 0.003921569, 1,
-0.4079973, 1.650009, -0.1222808, 0, 1, 0.01176471, 1,
-0.4074276, 0.6623685, -0.4920523, 0, 1, 0.01568628, 1,
-0.4060479, -0.1930002, -2.578382, 0, 1, 0.02352941, 1,
-0.3943426, 0.5913563, -2.376143, 0, 1, 0.02745098, 1,
-0.390837, 0.7810137, -0.2461511, 0, 1, 0.03529412, 1,
-0.3908197, 0.191208, -3.022802, 0, 1, 0.03921569, 1,
-0.3885615, -0.8070579, -4.52904, 0, 1, 0.04705882, 1,
-0.3864808, -0.2589823, -2.516088, 0, 1, 0.05098039, 1,
-0.3843753, 0.915805, -0.6678154, 0, 1, 0.05882353, 1,
-0.3838384, 1.583592, -0.8367129, 0, 1, 0.0627451, 1,
-0.3700226, 1.277808, -1.549715, 0, 1, 0.07058824, 1,
-0.3668712, -1.075544, -3.160041, 0, 1, 0.07450981, 1,
-0.3625844, 0.0950114, -1.547452, 0, 1, 0.08235294, 1,
-0.3623689, 0.1532118, -2.00348, 0, 1, 0.08627451, 1,
-0.3609338, 0.9816962, -1.847059, 0, 1, 0.09411765, 1,
-0.360834, 1.893946, -0.08943791, 0, 1, 0.1019608, 1,
-0.3599138, -0.5708536, -3.467066, 0, 1, 0.1058824, 1,
-0.355159, -0.07473198, -2.296458, 0, 1, 0.1137255, 1,
-0.3548073, 0.5046812, -0.4507554, 0, 1, 0.1176471, 1,
-0.3543804, 0.6098092, -1.925182, 0, 1, 0.1254902, 1,
-0.3534769, 1.497151, -1.666725, 0, 1, 0.1294118, 1,
-0.3514443, 1.002812, -0.2959277, 0, 1, 0.1372549, 1,
-0.3484794, 0.6708958, -1.259049, 0, 1, 0.1411765, 1,
-0.3463632, -0.7269379, -2.366962, 0, 1, 0.1490196, 1,
-0.3453485, 0.140205, -1.461018, 0, 1, 0.1529412, 1,
-0.3434771, -1.019632, -1.689705, 0, 1, 0.1607843, 1,
-0.3432992, -1.306969, -3.03649, 0, 1, 0.1647059, 1,
-0.3430945, 0.1449613, -2.310313, 0, 1, 0.172549, 1,
-0.338338, 0.4076644, 0.4447829, 0, 1, 0.1764706, 1,
-0.337689, 0.2500725, -0.8664299, 0, 1, 0.1843137, 1,
-0.3362387, -0.7726981, -1.957261, 0, 1, 0.1882353, 1,
-0.3335623, -0.2935827, -3.636277, 0, 1, 0.1960784, 1,
-0.3286098, -1.624246, -4.826095, 0, 1, 0.2039216, 1,
-0.3281561, 0.5988583, 1.204819, 0, 1, 0.2078431, 1,
-0.3261299, 0.8821012, -0.2765166, 0, 1, 0.2156863, 1,
-0.3206715, 0.5952016, -1.007878, 0, 1, 0.2196078, 1,
-0.3190863, 1.322822, 0.3271305, 0, 1, 0.227451, 1,
-0.3179216, 0.1056242, -0.4019382, 0, 1, 0.2313726, 1,
-0.3127892, -1.406812, -2.211236, 0, 1, 0.2392157, 1,
-0.3092773, 1.613549, 0.8815988, 0, 1, 0.2431373, 1,
-0.3079086, -0.1137278, -2.031517, 0, 1, 0.2509804, 1,
-0.2909745, 0.5947693, -0.6593356, 0, 1, 0.254902, 1,
-0.2900505, 0.9014434, -0.6220272, 0, 1, 0.2627451, 1,
-0.2883395, -1.057186, -1.638498, 0, 1, 0.2666667, 1,
-0.2822975, 1.036218, 1.398519, 0, 1, 0.2745098, 1,
-0.2807008, -1.94456, -3.098074, 0, 1, 0.2784314, 1,
-0.2791705, 2.196485, -2.012346, 0, 1, 0.2862745, 1,
-0.278694, -0.3944275, -1.807624, 0, 1, 0.2901961, 1,
-0.2772566, 2.703013, -0.1684322, 0, 1, 0.2980392, 1,
-0.2762996, -0.9860303, -2.70279, 0, 1, 0.3058824, 1,
-0.2743383, 0.4829444, -0.578779, 0, 1, 0.3098039, 1,
-0.2702383, -0.1095163, -1.690471, 0, 1, 0.3176471, 1,
-0.2693354, -0.2064403, -2.319551, 0, 1, 0.3215686, 1,
-0.2688644, -1.484963, -3.187693, 0, 1, 0.3294118, 1,
-0.2672215, 1.972666, -0.26536, 0, 1, 0.3333333, 1,
-0.266828, 0.3593561, -0.857153, 0, 1, 0.3411765, 1,
-0.2631371, -1.481215, -3.369536, 0, 1, 0.345098, 1,
-0.2621459, -0.9861285, -2.670707, 0, 1, 0.3529412, 1,
-0.2602973, -0.5876558, -4.1622, 0, 1, 0.3568628, 1,
-0.2583632, 0.2452614, -0.3115622, 0, 1, 0.3647059, 1,
-0.2578051, 1.38389, -1.427635, 0, 1, 0.3686275, 1,
-0.2556166, 0.431792, -0.4388065, 0, 1, 0.3764706, 1,
-0.2551537, -1.527187, -4.203742, 0, 1, 0.3803922, 1,
-0.2542918, -2.01825, -3.723351, 0, 1, 0.3882353, 1,
-0.2540991, -1.665662, -3.334843, 0, 1, 0.3921569, 1,
-0.2523574, 0.4379529, -0.1651144, 0, 1, 0.4, 1,
-0.2518446, 0.4003991, 0.579749, 0, 1, 0.4078431, 1,
-0.247183, -0.3874199, -4.665962, 0, 1, 0.4117647, 1,
-0.2456717, 0.449775, -0.9665719, 0, 1, 0.4196078, 1,
-0.2416425, -0.01762149, -0.5723379, 0, 1, 0.4235294, 1,
-0.2408495, -1.818011, -2.317911, 0, 1, 0.4313726, 1,
-0.2397365, 0.7867073, 0.1254153, 0, 1, 0.4352941, 1,
-0.2359699, -0.173601, -1.274552, 0, 1, 0.4431373, 1,
-0.235139, -1.152837, -3.574207, 0, 1, 0.4470588, 1,
-0.2330101, -0.8897371, -1.946667, 0, 1, 0.454902, 1,
-0.2311508, 0.9892976, 0.2307525, 0, 1, 0.4588235, 1,
-0.2310652, 1.139684, -1.058062, 0, 1, 0.4666667, 1,
-0.2307888, -0.9387097, -3.381674, 0, 1, 0.4705882, 1,
-0.2288751, -0.5484513, -2.545819, 0, 1, 0.4784314, 1,
-0.2226131, -0.2126715, -4.153826, 0, 1, 0.4823529, 1,
-0.2218687, -0.1860093, -1.171813, 0, 1, 0.4901961, 1,
-0.2215596, 1.090272, -2.686743, 0, 1, 0.4941176, 1,
-0.2213607, 0.5786593, -1.149084, 0, 1, 0.5019608, 1,
-0.2185197, 0.6414359, -0.5392703, 0, 1, 0.509804, 1,
-0.2171369, 1.278704, -1.007694, 0, 1, 0.5137255, 1,
-0.2169157, -1.383031, -3.784001, 0, 1, 0.5215687, 1,
-0.2147714, 0.0937901, 0.4065717, 0, 1, 0.5254902, 1,
-0.2121633, -0.4018457, -4.617465, 0, 1, 0.5333334, 1,
-0.204809, -0.5977169, -2.311259, 0, 1, 0.5372549, 1,
-0.1996311, -0.5689889, -4.13711, 0, 1, 0.5450981, 1,
-0.1984585, -0.8159395, -3.292182, 0, 1, 0.5490196, 1,
-0.1969164, -1.280976, -3.570389, 0, 1, 0.5568628, 1,
-0.1959438, -1.812073, -1.649812, 0, 1, 0.5607843, 1,
-0.1937406, -1.726132, -2.122258, 0, 1, 0.5686275, 1,
-0.1913835, -1.18886, -4.717482, 0, 1, 0.572549, 1,
-0.190689, 0.3544078, 1.071986, 0, 1, 0.5803922, 1,
-0.1893121, 1.358614, -0.995651, 0, 1, 0.5843138, 1,
-0.1836181, -0.1153107, -3.156344, 0, 1, 0.5921569, 1,
-0.1821303, -0.9394692, -2.381391, 0, 1, 0.5960785, 1,
-0.1727722, 0.05692595, -2.093955, 0, 1, 0.6039216, 1,
-0.1717, -0.5413291, -2.249918, 0, 1, 0.6117647, 1,
-0.1694327, -0.8781498, -3.555809, 0, 1, 0.6156863, 1,
-0.1652702, 1.312289, 0.03715778, 0, 1, 0.6235294, 1,
-0.1616259, -0.1109067, -3.63457, 0, 1, 0.627451, 1,
-0.159757, -0.7506831, -3.668108, 0, 1, 0.6352941, 1,
-0.156753, 0.203748, 0.6314767, 0, 1, 0.6392157, 1,
-0.1559958, 1.219474, -1.105142, 0, 1, 0.6470588, 1,
-0.1528485, -2.003934, -4.60288, 0, 1, 0.6509804, 1,
-0.1513627, 0.09852695, -0.4083492, 0, 1, 0.6588235, 1,
-0.1501541, -1.095224, -3.276297, 0, 1, 0.6627451, 1,
-0.1496345, -1.027855, -3.72587, 0, 1, 0.6705883, 1,
-0.149044, 0.8968463, 1.064035, 0, 1, 0.6745098, 1,
-0.1482735, -0.4547693, -0.9652948, 0, 1, 0.682353, 1,
-0.1459877, -0.8383752, -3.744596, 0, 1, 0.6862745, 1,
-0.1424675, -1.881023, -2.337279, 0, 1, 0.6941177, 1,
-0.1392906, 0.8825187, 1.14929, 0, 1, 0.7019608, 1,
-0.1365242, 0.6537811, -0.0358016, 0, 1, 0.7058824, 1,
-0.1363335, 0.7295138, -1.067906, 0, 1, 0.7137255, 1,
-0.132412, 1.249425, -0.4853107, 0, 1, 0.7176471, 1,
-0.1322128, 0.0355535, -1.550163, 0, 1, 0.7254902, 1,
-0.1280671, -1.036917, -3.660455, 0, 1, 0.7294118, 1,
-0.1269398, 0.5232077, -0.615938, 0, 1, 0.7372549, 1,
-0.1267608, 0.1360413, -0.2514482, 0, 1, 0.7411765, 1,
-0.1261037, 0.180125, -0.7863747, 0, 1, 0.7490196, 1,
-0.1252554, 0.9095587, 2.085624, 0, 1, 0.7529412, 1,
-0.1177461, -1.531459, -3.132041, 0, 1, 0.7607843, 1,
-0.1174746, -0.234597, -1.320744, 0, 1, 0.7647059, 1,
-0.1161278, -0.8165393, -3.121143, 0, 1, 0.772549, 1,
-0.1138342, 0.8951696, 0.2810656, 0, 1, 0.7764706, 1,
-0.1137318, 1.456626, 0.4399567, 0, 1, 0.7843137, 1,
-0.1080746, -1.364705, -3.730011, 0, 1, 0.7882353, 1,
-0.1076541, 0.4916561, 0.1476786, 0, 1, 0.7960784, 1,
-0.10502, 0.685723, -1.945319, 0, 1, 0.8039216, 1,
-0.1015942, 0.3009966, 2.484956, 0, 1, 0.8078431, 1,
-0.100444, -0.9946694, -3.578988, 0, 1, 0.8156863, 1,
-0.09726615, 0.08654404, -2.327027, 0, 1, 0.8196079, 1,
-0.09665614, -0.2552631, -1.449484, 0, 1, 0.827451, 1,
-0.09134738, -0.07444472, -3.791235, 0, 1, 0.8313726, 1,
-0.09027487, 1.336841, 2.813174, 0, 1, 0.8392157, 1,
-0.08886846, -1.310245, -1.422408, 0, 1, 0.8431373, 1,
-0.08669277, -0.3115537, -3.5643, 0, 1, 0.8509804, 1,
-0.0865148, 1.508771, -0.1453118, 0, 1, 0.854902, 1,
-0.08413856, -0.04916047, -2.629837, 0, 1, 0.8627451, 1,
-0.07516198, 0.6615669, -1.210125, 0, 1, 0.8666667, 1,
-0.07152303, 1.316239, 1.391497, 0, 1, 0.8745098, 1,
-0.06710952, 0.4850408, -0.6146882, 0, 1, 0.8784314, 1,
-0.06706136, 0.8113201, -0.2839911, 0, 1, 0.8862745, 1,
-0.06472969, -1.098762, -2.026269, 0, 1, 0.8901961, 1,
-0.06399333, -0.054644, -2.590381, 0, 1, 0.8980392, 1,
-0.06207604, -0.521769, -3.238492, 0, 1, 0.9058824, 1,
-0.05093263, -0.9444523, -3.450377, 0, 1, 0.9098039, 1,
-0.04926291, -0.7832237, -4.243774, 0, 1, 0.9176471, 1,
-0.04521211, -0.7351022, -2.698081, 0, 1, 0.9215686, 1,
-0.04224921, 1.151348, -1.277295, 0, 1, 0.9294118, 1,
-0.03686691, 0.3857627, -1.168757, 0, 1, 0.9333333, 1,
-0.0355326, 0.29798, -1.179289, 0, 1, 0.9411765, 1,
-0.03020394, -0.9370173, -3.765963, 0, 1, 0.945098, 1,
-0.02728124, 1.442445, -0.6361358, 0, 1, 0.9529412, 1,
-0.02720027, -0.1725816, -2.840618, 0, 1, 0.9568627, 1,
-0.02651563, 0.2888051, 0.1382845, 0, 1, 0.9647059, 1,
-0.02472671, 0.1837951, -1.639165, 0, 1, 0.9686275, 1,
-0.02097728, -0.3142557, -2.825767, 0, 1, 0.9764706, 1,
-0.01978716, -0.4349517, -2.977396, 0, 1, 0.9803922, 1,
-0.01355586, -0.902459, -3.518602, 0, 1, 0.9882353, 1,
-0.01318876, 0.01584413, -1.750379, 0, 1, 0.9921569, 1,
-0.01124352, -1.19118, -2.660404, 0, 1, 1, 1,
-0.007915888, 0.6157488, -0.5308713, 0, 0.9921569, 1, 1,
-0.007322466, -0.8746601, -3.173291, 0, 0.9882353, 1, 1,
-0.006034221, -0.3193518, -2.317181, 0, 0.9803922, 1, 1,
-0.004954733, -0.6627785, -2.408358, 0, 0.9764706, 1, 1,
-0.004910348, 0.2264657, -0.4633729, 0, 0.9686275, 1, 1,
-0.003405717, 0.2124791, 1.202645, 0, 0.9647059, 1, 1,
0.002458166, 0.0837981, 0.5473434, 0, 0.9568627, 1, 1,
0.003658143, -1.502665, 1.996216, 0, 0.9529412, 1, 1,
0.006848182, -1.933901, 2.133748, 0, 0.945098, 1, 1,
0.007083121, -1.109342, 2.16462, 0, 0.9411765, 1, 1,
0.01028557, -1.401899, 2.861721, 0, 0.9333333, 1, 1,
0.01822614, 3.182563, -0.2364003, 0, 0.9294118, 1, 1,
0.02015898, 0.9142487, -0.3077515, 0, 0.9215686, 1, 1,
0.02259561, -0.259215, 2.531319, 0, 0.9176471, 1, 1,
0.02616001, 0.22991, 1.357383, 0, 0.9098039, 1, 1,
0.0268298, -1.160043, 3.015014, 0, 0.9058824, 1, 1,
0.03146365, 1.308218, -0.1215366, 0, 0.8980392, 1, 1,
0.03379848, 1.096377, -0.01681887, 0, 0.8901961, 1, 1,
0.03402685, 0.6091275, -1.195262, 0, 0.8862745, 1, 1,
0.03524045, -1.086994, 3.669291, 0, 0.8784314, 1, 1,
0.03613776, -1.441832, 4.791131, 0, 0.8745098, 1, 1,
0.03665501, 0.4168854, -0.3375064, 0, 0.8666667, 1, 1,
0.0390504, -0.6930602, 3.166536, 0, 0.8627451, 1, 1,
0.04072248, -0.9169149, 3.494888, 0, 0.854902, 1, 1,
0.04736957, 0.05868398, 2.769994, 0, 0.8509804, 1, 1,
0.04854791, -0.7414363, 3.399331, 0, 0.8431373, 1, 1,
0.04914971, -0.2601719, 3.125017, 0, 0.8392157, 1, 1,
0.05137428, -0.8635943, 3.439266, 0, 0.8313726, 1, 1,
0.05162796, -0.9709486, 1.700929, 0, 0.827451, 1, 1,
0.05448617, -0.3050531, 1.379357, 0, 0.8196079, 1, 1,
0.05618915, 0.6287244, -1.078603, 0, 0.8156863, 1, 1,
0.05750669, -1.153334, 3.375709, 0, 0.8078431, 1, 1,
0.05843439, -0.084331, 2.196645, 0, 0.8039216, 1, 1,
0.06109643, -1.55307, 3.424374, 0, 0.7960784, 1, 1,
0.06258319, 0.1244141, -1.13008, 0, 0.7882353, 1, 1,
0.06337588, 1.007784, 0.4602261, 0, 0.7843137, 1, 1,
0.0657222, -0.2295377, 2.864731, 0, 0.7764706, 1, 1,
0.06974062, -1.535284, 1.719427, 0, 0.772549, 1, 1,
0.0728767, 0.3184591, 0.2117294, 0, 0.7647059, 1, 1,
0.07762692, -0.465436, 3.999861, 0, 0.7607843, 1, 1,
0.07806157, 1.074649, -1.112946, 0, 0.7529412, 1, 1,
0.08312387, -0.2298906, 0.1022448, 0, 0.7490196, 1, 1,
0.08320755, -0.1764524, 1.782574, 0, 0.7411765, 1, 1,
0.08337232, -0.6868306, 3.506249, 0, 0.7372549, 1, 1,
0.08401772, -1.116532, 2.998673, 0, 0.7294118, 1, 1,
0.0841034, 0.6611984, -0.8754332, 0, 0.7254902, 1, 1,
0.08413121, -0.9449126, 2.799268, 0, 0.7176471, 1, 1,
0.09094449, -0.07780545, 2.056247, 0, 0.7137255, 1, 1,
0.09404681, 0.4639503, 0.2076828, 0, 0.7058824, 1, 1,
0.09553037, -1.140695, 2.326596, 0, 0.6980392, 1, 1,
0.1053677, 1.121347, 0.6791798, 0, 0.6941177, 1, 1,
0.1054231, 0.4810124, 0.2094384, 0, 0.6862745, 1, 1,
0.1091362, 0.5162017, 1.450464, 0, 0.682353, 1, 1,
0.1102188, 0.2348925, 0.6868664, 0, 0.6745098, 1, 1,
0.1137469, -0.3744109, 3.090306, 0, 0.6705883, 1, 1,
0.1168732, -0.1819781, 2.653207, 0, 0.6627451, 1, 1,
0.1178157, 0.712769, 0.5944205, 0, 0.6588235, 1, 1,
0.1180962, -1.269912, 2.834049, 0, 0.6509804, 1, 1,
0.1188802, -1.3753, 3.095148, 0, 0.6470588, 1, 1,
0.1191349, -0.8791586, 3.105963, 0, 0.6392157, 1, 1,
0.1215089, -0.9609749, 2.087624, 0, 0.6352941, 1, 1,
0.1231297, -2.239805, 2.976883, 0, 0.627451, 1, 1,
0.1302432, 0.4958003, 0.3167978, 0, 0.6235294, 1, 1,
0.1316332, -1.301104, 1.814816, 0, 0.6156863, 1, 1,
0.1316763, -0.9530916, 2.527238, 0, 0.6117647, 1, 1,
0.1333917, 1.913123, 1.810648, 0, 0.6039216, 1, 1,
0.1336055, 1.388476, 0.5365028, 0, 0.5960785, 1, 1,
0.1379709, 0.1942976, -0.2690403, 0, 0.5921569, 1, 1,
0.1388443, 2.711476, -1.077382, 0, 0.5843138, 1, 1,
0.1413406, -0.349978, 2.620773, 0, 0.5803922, 1, 1,
0.1419714, -0.1928227, 1.859604, 0, 0.572549, 1, 1,
0.1610544, 1.172321, -0.401594, 0, 0.5686275, 1, 1,
0.161944, 0.1352997, 0.6226827, 0, 0.5607843, 1, 1,
0.1637908, 0.8770249, 1.410138, 0, 0.5568628, 1, 1,
0.1674986, 0.1260082, 2.495991, 0, 0.5490196, 1, 1,
0.1677562, -1.73103, 3.326341, 0, 0.5450981, 1, 1,
0.1692067, 0.1575137, 2.143802, 0, 0.5372549, 1, 1,
0.171112, -0.3544373, 2.538187, 0, 0.5333334, 1, 1,
0.1712594, 1.088617, 0.9182435, 0, 0.5254902, 1, 1,
0.1732975, -0.6091154, 2.004471, 0, 0.5215687, 1, 1,
0.1746778, -0.02929461, 1.504746, 0, 0.5137255, 1, 1,
0.1758995, -0.399533, 2.142667, 0, 0.509804, 1, 1,
0.1772497, -0.3035424, 0.6861353, 0, 0.5019608, 1, 1,
0.1822217, 0.09451449, 2.258831, 0, 0.4941176, 1, 1,
0.1833962, 0.3923444, 0.200342, 0, 0.4901961, 1, 1,
0.1843037, -0.1723563, 0.9988551, 0, 0.4823529, 1, 1,
0.1857554, 0.1323789, 1.250724, 0, 0.4784314, 1, 1,
0.1894257, 0.6468223, -0.05209089, 0, 0.4705882, 1, 1,
0.1902336, 1.437382, 0.8653224, 0, 0.4666667, 1, 1,
0.1930609, -0.339023, 1.896158, 0, 0.4588235, 1, 1,
0.1936903, -1.194326, 5.237501, 0, 0.454902, 1, 1,
0.1963739, -1.137532, 2.262777, 0, 0.4470588, 1, 1,
0.1970019, -0.5099152, 2.550299, 0, 0.4431373, 1, 1,
0.2059876, 0.6935962, 1.545736, 0, 0.4352941, 1, 1,
0.2119544, 0.03507666, 1.774652, 0, 0.4313726, 1, 1,
0.2127411, -1.7018, 3.399917, 0, 0.4235294, 1, 1,
0.2149019, 0.640263, 0.5115222, 0, 0.4196078, 1, 1,
0.215278, 0.8260061, -0.3443964, 0, 0.4117647, 1, 1,
0.215354, 1.141849, 1.121613, 0, 0.4078431, 1, 1,
0.2153618, 1.121859, -0.4338351, 0, 0.4, 1, 1,
0.2170942, -0.2267782, 2.990008, 0, 0.3921569, 1, 1,
0.2283741, -1.828994, 2.611442, 0, 0.3882353, 1, 1,
0.2322826, -0.09161257, 2.044638, 0, 0.3803922, 1, 1,
0.2370086, -0.4861402, 1.677804, 0, 0.3764706, 1, 1,
0.2393291, 0.6763129, 1.752262, 0, 0.3686275, 1, 1,
0.2404503, 0.0882853, 2.91427, 0, 0.3647059, 1, 1,
0.2459868, -0.4731123, 3.746143, 0, 0.3568628, 1, 1,
0.2490975, -1.002551, 3.268791, 0, 0.3529412, 1, 1,
0.2514678, 0.4639714, 0.6324976, 0, 0.345098, 1, 1,
0.2524789, 1.520531, -0.4699082, 0, 0.3411765, 1, 1,
0.2554839, 0.6782418, 1.467126, 0, 0.3333333, 1, 1,
0.2578844, -2.402715, 2.667861, 0, 0.3294118, 1, 1,
0.2585534, 0.5489138, 0.1441439, 0, 0.3215686, 1, 1,
0.25887, -0.2873597, 0.6779548, 0, 0.3176471, 1, 1,
0.2591952, 1.217455, -1.93575, 0, 0.3098039, 1, 1,
0.2668538, -2.503045, 1.703115, 0, 0.3058824, 1, 1,
0.2671673, 1.846396, 0.08150525, 0, 0.2980392, 1, 1,
0.271741, 0.9653111, 0.8702556, 0, 0.2901961, 1, 1,
0.2719862, -0.4886641, 3.260101, 0, 0.2862745, 1, 1,
0.2721834, -0.7484997, 1.833316, 0, 0.2784314, 1, 1,
0.2723713, 0.5223557, 0.7163846, 0, 0.2745098, 1, 1,
0.2751774, -0.9381799, 1.222883, 0, 0.2666667, 1, 1,
0.2779804, -0.9663009, 1.325546, 0, 0.2627451, 1, 1,
0.2782255, 1.215388, -0.06643853, 0, 0.254902, 1, 1,
0.2787501, -2.053988, 2.610797, 0, 0.2509804, 1, 1,
0.2801652, -0.3777735, 0.1197125, 0, 0.2431373, 1, 1,
0.2802686, -0.7211267, 2.836679, 0, 0.2392157, 1, 1,
0.2819766, -0.627036, 3.109321, 0, 0.2313726, 1, 1,
0.2824016, -1.477293, 2.476567, 0, 0.227451, 1, 1,
0.2861756, 1.732507, 1.727798, 0, 0.2196078, 1, 1,
0.2875335, 0.3025648, -0.09563586, 0, 0.2156863, 1, 1,
0.2884365, 0.1884808, 1.852942, 0, 0.2078431, 1, 1,
0.2913775, 0.4940094, -0.7829672, 0, 0.2039216, 1, 1,
0.2941524, 1.504479, 1.161884, 0, 0.1960784, 1, 1,
0.2956418, -1.699962, 1.791548, 0, 0.1882353, 1, 1,
0.2957594, 0.1023509, 0.1314241, 0, 0.1843137, 1, 1,
0.2966972, 1.263771, -0.4033695, 0, 0.1764706, 1, 1,
0.2989467, -1.124858, 3.210713, 0, 0.172549, 1, 1,
0.3000652, 1.018561, 1.183423, 0, 0.1647059, 1, 1,
0.3026384, -0.07715664, 0.9724334, 0, 0.1607843, 1, 1,
0.3042225, -0.659486, 4.24991, 0, 0.1529412, 1, 1,
0.3074033, 2.316369, 1.637043, 0, 0.1490196, 1, 1,
0.3129925, 1.995495, -2.378045, 0, 0.1411765, 1, 1,
0.3213677, -0.6035204, 1.948042, 0, 0.1372549, 1, 1,
0.3250196, 0.5549411, 0.6012171, 0, 0.1294118, 1, 1,
0.3254386, 2.465568, -0.8214114, 0, 0.1254902, 1, 1,
0.32986, -0.6149904, 1.458937, 0, 0.1176471, 1, 1,
0.3305523, 0.4980451, 1.701774, 0, 0.1137255, 1, 1,
0.3310447, 0.7254432, 1.545892, 0, 0.1058824, 1, 1,
0.3350334, 0.7504959, -0.4670365, 0, 0.09803922, 1, 1,
0.3373403, -1.845892, 0.5444597, 0, 0.09411765, 1, 1,
0.337629, 0.07092397, 2.545013, 0, 0.08627451, 1, 1,
0.3389636, 0.5199544, 0.7575329, 0, 0.08235294, 1, 1,
0.3404162, 0.3258164, 0.4967397, 0, 0.07450981, 1, 1,
0.342693, -0.3486452, 2.833911, 0, 0.07058824, 1, 1,
0.3440089, -0.4327185, 2.111634, 0, 0.0627451, 1, 1,
0.3469694, 0.6232176, -1.054398, 0, 0.05882353, 1, 1,
0.3471832, 0.7166446, 0.8105041, 0, 0.05098039, 1, 1,
0.3476731, 2.189093, 1.066644, 0, 0.04705882, 1, 1,
0.3527547, -1.964517, 4.582162, 0, 0.03921569, 1, 1,
0.3544091, -0.5075549, 1.283884, 0, 0.03529412, 1, 1,
0.3572941, -0.8034448, 2.933042, 0, 0.02745098, 1, 1,
0.3579985, 0.5836341, -0.0172135, 0, 0.02352941, 1, 1,
0.363952, -0.1318985, 0.9163094, 0, 0.01568628, 1, 1,
0.3643506, -0.2004408, 2.314249, 0, 0.01176471, 1, 1,
0.3650262, 0.3243155, 1.230259, 0, 0.003921569, 1, 1,
0.3657558, -0.5785598, 1.443965, 0.003921569, 0, 1, 1,
0.367086, -1.396386, 3.186077, 0.007843138, 0, 1, 1,
0.3706663, 1.178579, 0.3002628, 0.01568628, 0, 1, 1,
0.3787443, -0.5846725, 2.170183, 0.01960784, 0, 1, 1,
0.3792284, -0.2240013, 2.464498, 0.02745098, 0, 1, 1,
0.3814435, 0.1617366, 1.088373, 0.03137255, 0, 1, 1,
0.3836331, 0.1673762, 0.9641593, 0.03921569, 0, 1, 1,
0.3856291, 0.5670618, 0.9282969, 0.04313726, 0, 1, 1,
0.388518, -0.3739627, 2.853246, 0.05098039, 0, 1, 1,
0.3887854, -0.4031775, 3.093255, 0.05490196, 0, 1, 1,
0.389916, -0.295992, 2.813683, 0.0627451, 0, 1, 1,
0.3915347, 0.105632, 2.209499, 0.06666667, 0, 1, 1,
0.3938333, -0.7435206, 3.301775, 0.07450981, 0, 1, 1,
0.4014213, -0.5451555, 2.638837, 0.07843138, 0, 1, 1,
0.4018211, 1.522628, -0.07365303, 0.08627451, 0, 1, 1,
0.4018931, -0.04143652, 1.699732, 0.09019608, 0, 1, 1,
0.4024946, 0.7203931, -0.4240288, 0.09803922, 0, 1, 1,
0.4025108, -1.059425, 3.165568, 0.1058824, 0, 1, 1,
0.4034507, 1.856725, 1.957774, 0.1098039, 0, 1, 1,
0.4092857, 0.1995346, 0.4466136, 0.1176471, 0, 1, 1,
0.4097651, -0.7567822, 3.731228, 0.1215686, 0, 1, 1,
0.4125537, -0.8868665, 2.216138, 0.1294118, 0, 1, 1,
0.4127047, -0.7280909, 0.4788577, 0.1333333, 0, 1, 1,
0.4150471, 1.37768, 1.086653, 0.1411765, 0, 1, 1,
0.4163848, 0.2751423, 0.3940725, 0.145098, 0, 1, 1,
0.4172823, 0.5520672, 0.668751, 0.1529412, 0, 1, 1,
0.4193721, 0.4639578, 0.8568162, 0.1568628, 0, 1, 1,
0.4196324, 2.380012, -0.4612291, 0.1647059, 0, 1, 1,
0.42815, 1.047516, 1.497121, 0.1686275, 0, 1, 1,
0.4293633, -1.111903, 4.465898, 0.1764706, 0, 1, 1,
0.4311352, -0.3394761, 2.8799, 0.1803922, 0, 1, 1,
0.4324789, -0.2713772, 1.884997, 0.1882353, 0, 1, 1,
0.4340749, -0.2808241, 3.338384, 0.1921569, 0, 1, 1,
0.4368009, -0.01591062, 2.989082, 0.2, 0, 1, 1,
0.4382842, -2.1704, 2.355962, 0.2078431, 0, 1, 1,
0.4434238, 0.7576182, 2.249462, 0.2117647, 0, 1, 1,
0.4466824, 1.274719, -0.2165985, 0.2196078, 0, 1, 1,
0.4490801, 0.1000241, 2.334922, 0.2235294, 0, 1, 1,
0.4504769, 0.7830591, -0.08549845, 0.2313726, 0, 1, 1,
0.4508247, -0.3179523, 3.602799, 0.2352941, 0, 1, 1,
0.453256, -2.040161, 2.469098, 0.2431373, 0, 1, 1,
0.4547688, -0.1187385, 0.7114624, 0.2470588, 0, 1, 1,
0.4573208, 0.6936666, 0.5253326, 0.254902, 0, 1, 1,
0.4574186, 0.4171714, -0.006727715, 0.2588235, 0, 1, 1,
0.4578221, 0.08044869, 1.43749, 0.2666667, 0, 1, 1,
0.4699072, -1.788976, 5.756535, 0.2705882, 0, 1, 1,
0.474194, -0.9708171, 3.404935, 0.2784314, 0, 1, 1,
0.4795533, 1.622693, -1.357251, 0.282353, 0, 1, 1,
0.4871315, -1.690412, 3.798625, 0.2901961, 0, 1, 1,
0.4871486, -1.571739, 2.738739, 0.2941177, 0, 1, 1,
0.4877034, 0.8497125, 2.09396, 0.3019608, 0, 1, 1,
0.500664, -0.4638038, 2.202993, 0.3098039, 0, 1, 1,
0.5047829, 1.361568, 1.799085, 0.3137255, 0, 1, 1,
0.5051101, 1.304177, -1.041194, 0.3215686, 0, 1, 1,
0.51733, -0.1362489, 2.507285, 0.3254902, 0, 1, 1,
0.5192116, 0.9663898, 1.761899, 0.3333333, 0, 1, 1,
0.5215444, -0.4587069, 1.886066, 0.3372549, 0, 1, 1,
0.5216576, -0.9354395, 3.143255, 0.345098, 0, 1, 1,
0.5298582, -0.2326225, 1.539107, 0.3490196, 0, 1, 1,
0.5300924, 1.894408, 0.1581109, 0.3568628, 0, 1, 1,
0.5305259, 0.459022, -0.3072085, 0.3607843, 0, 1, 1,
0.5365496, 1.533981, 0.9483244, 0.3686275, 0, 1, 1,
0.5383126, 0.2799766, -0.2663015, 0.372549, 0, 1, 1,
0.5384029, -0.8654931, 3.558042, 0.3803922, 0, 1, 1,
0.5615333, -0.0773545, 1.022544, 0.3843137, 0, 1, 1,
0.561981, -1.356815, 3.060921, 0.3921569, 0, 1, 1,
0.5678183, -1.15863, 3.466215, 0.3960784, 0, 1, 1,
0.5680735, -0.8253171, 2.731822, 0.4039216, 0, 1, 1,
0.5687054, 0.4466527, 0.6204144, 0.4117647, 0, 1, 1,
0.5701292, 1.853536, -0.9204457, 0.4156863, 0, 1, 1,
0.5716465, 0.5431898, 0.04967768, 0.4235294, 0, 1, 1,
0.5737572, -0.4171797, 2.412018, 0.427451, 0, 1, 1,
0.5750161, 0.1923311, -0.7347559, 0.4352941, 0, 1, 1,
0.5783221, 0.4255012, 1.045348, 0.4392157, 0, 1, 1,
0.5791346, 0.1107976, 2.003334, 0.4470588, 0, 1, 1,
0.58011, 0.558166, 1.847458, 0.4509804, 0, 1, 1,
0.5825063, -0.2435837, 2.681408, 0.4588235, 0, 1, 1,
0.5825882, -0.4846584, 1.945567, 0.4627451, 0, 1, 1,
0.5835662, 0.1658511, 0.7668253, 0.4705882, 0, 1, 1,
0.5918925, -0.3512414, -0.02596316, 0.4745098, 0, 1, 1,
0.5963898, 0.8118291, 0.1909, 0.4823529, 0, 1, 1,
0.6018729, 0.4664128, -0.06176305, 0.4862745, 0, 1, 1,
0.6041503, -0.5559897, 3.427316, 0.4941176, 0, 1, 1,
0.6070334, -0.2323443, 1.815225, 0.5019608, 0, 1, 1,
0.6097181, -0.03861528, 1.009646, 0.5058824, 0, 1, 1,
0.6148379, 0.9601324, 0.054951, 0.5137255, 0, 1, 1,
0.6225815, 2.278119, -0.1706014, 0.5176471, 0, 1, 1,
0.6235679, -1.800927, 1.759633, 0.5254902, 0, 1, 1,
0.628169, 0.9133099, 1.550174, 0.5294118, 0, 1, 1,
0.6320222, 1.050147, 1.336735, 0.5372549, 0, 1, 1,
0.6362104, 0.1341483, 2.559055, 0.5411765, 0, 1, 1,
0.636627, 0.4330077, 2.011868, 0.5490196, 0, 1, 1,
0.637252, -0.03445789, 0.6134439, 0.5529412, 0, 1, 1,
0.6414503, -0.3867208, 3.26955, 0.5607843, 0, 1, 1,
0.6463471, 1.625942, 0.5922251, 0.5647059, 0, 1, 1,
0.647248, 0.6091818, 1.021342, 0.572549, 0, 1, 1,
0.6546831, -1.422199, 2.68414, 0.5764706, 0, 1, 1,
0.6564796, -0.4229016, 2.155493, 0.5843138, 0, 1, 1,
0.6566151, -0.7282597, -1.201483, 0.5882353, 0, 1, 1,
0.6572536, 1.424734, 1.086082, 0.5960785, 0, 1, 1,
0.6607965, 1.673033, 0.7776577, 0.6039216, 0, 1, 1,
0.6635482, 0.5502561, 0.2389383, 0.6078432, 0, 1, 1,
0.6667145, 0.2385394, 2.843505, 0.6156863, 0, 1, 1,
0.6695418, -1.851705, 3.01083, 0.6196079, 0, 1, 1,
0.6725984, -0.8044331, 1.12209, 0.627451, 0, 1, 1,
0.6748943, 0.1978771, 2.074615, 0.6313726, 0, 1, 1,
0.6802453, 0.2814118, 2.799097, 0.6392157, 0, 1, 1,
0.6828069, 0.8036624, -0.5094634, 0.6431373, 0, 1, 1,
0.6922134, -0.6942357, 4.536669, 0.6509804, 0, 1, 1,
0.6953405, -0.3940489, 1.394652, 0.654902, 0, 1, 1,
0.6991122, -0.1543673, 1.494719, 0.6627451, 0, 1, 1,
0.6999851, 0.05883181, 0.8565449, 0.6666667, 0, 1, 1,
0.7020112, 0.7576149, 0.7786295, 0.6745098, 0, 1, 1,
0.7022537, 0.8852894, 0.3657022, 0.6784314, 0, 1, 1,
0.702813, 0.1350965, 0.3396985, 0.6862745, 0, 1, 1,
0.7028968, 0.6447576, 0.6465317, 0.6901961, 0, 1, 1,
0.7035828, -0.6061847, 2.127282, 0.6980392, 0, 1, 1,
0.7037016, -1.846541, 2.541316, 0.7058824, 0, 1, 1,
0.7089715, -0.4918396, 0.6693487, 0.7098039, 0, 1, 1,
0.7091526, 0.6800264, 0.3029961, 0.7176471, 0, 1, 1,
0.7150571, 2.131041, -0.658325, 0.7215686, 0, 1, 1,
0.7179909, -1.024265, 1.265888, 0.7294118, 0, 1, 1,
0.7213577, 0.2842234, 2.373672, 0.7333333, 0, 1, 1,
0.7242939, 0.4467722, 1.69894, 0.7411765, 0, 1, 1,
0.7302118, 0.7883632, 1.227317, 0.7450981, 0, 1, 1,
0.7303184, -1.748557, 2.998831, 0.7529412, 0, 1, 1,
0.7304439, 0.7428224, 1.073984, 0.7568628, 0, 1, 1,
0.7339426, -0.2558421, 1.769605, 0.7647059, 0, 1, 1,
0.7343541, 0.1726068, 1.425077, 0.7686275, 0, 1, 1,
0.7371581, 0.9834779, -0.01357821, 0.7764706, 0, 1, 1,
0.7380021, -0.3338867, 2.837285, 0.7803922, 0, 1, 1,
0.7383427, -0.6491106, 1.60271, 0.7882353, 0, 1, 1,
0.7383966, 0.8448551, -0.2051724, 0.7921569, 0, 1, 1,
0.7449221, -0.8673801, 3.45513, 0.8, 0, 1, 1,
0.7478594, 0.7123622, -1.332504, 0.8078431, 0, 1, 1,
0.7584761, 1.826266, -1.138171, 0.8117647, 0, 1, 1,
0.7632578, -0.8710397, 1.239336, 0.8196079, 0, 1, 1,
0.7676703, -0.9446761, 2.869582, 0.8235294, 0, 1, 1,
0.776286, 1.235983, -0.1680083, 0.8313726, 0, 1, 1,
0.7782626, -0.9639639, 2.27016, 0.8352941, 0, 1, 1,
0.7811644, 1.227991, 2.329167, 0.8431373, 0, 1, 1,
0.7856016, 1.993203, 1.172076, 0.8470588, 0, 1, 1,
0.7886726, 0.599914, 1.391501, 0.854902, 0, 1, 1,
0.7981856, 1.729406, -0.6107293, 0.8588235, 0, 1, 1,
0.8050425, 0.6814797, 0.9721474, 0.8666667, 0, 1, 1,
0.8105819, 1.176108, 2.007344, 0.8705882, 0, 1, 1,
0.8106723, 0.3961096, 1.226909, 0.8784314, 0, 1, 1,
0.8139222, -1.459517, 3.751412, 0.8823529, 0, 1, 1,
0.8178999, 0.79627, 1.036924, 0.8901961, 0, 1, 1,
0.8338012, -1.318856, 3.100976, 0.8941177, 0, 1, 1,
0.8357675, 0.3899826, 1.379612, 0.9019608, 0, 1, 1,
0.8366454, -0.4646404, 2.701898, 0.9098039, 0, 1, 1,
0.8373704, 0.07030533, 4.170217, 0.9137255, 0, 1, 1,
0.8402805, 0.2678705, 0.5241308, 0.9215686, 0, 1, 1,
0.8415167, -0.005443575, 1.611374, 0.9254902, 0, 1, 1,
0.8428742, 3.03996, 1.219887, 0.9333333, 0, 1, 1,
0.8477067, 0.5424011, 1.704457, 0.9372549, 0, 1, 1,
0.8532562, 0.8843028, -0.5484022, 0.945098, 0, 1, 1,
0.8655724, -0.9712092, 1.736971, 0.9490196, 0, 1, 1,
0.8706409, -0.4097987, 2.942869, 0.9568627, 0, 1, 1,
0.8738617, 0.2164515, -0.1907772, 0.9607843, 0, 1, 1,
0.878915, 1.043347, 0.3363289, 0.9686275, 0, 1, 1,
0.8854736, 0.3239486, 1.438727, 0.972549, 0, 1, 1,
0.8874091, -0.5841876, 1.269638, 0.9803922, 0, 1, 1,
0.8894135, 0.8515415, 1.024628, 0.9843137, 0, 1, 1,
0.890776, -0.6744958, 0.187746, 0.9921569, 0, 1, 1,
0.8909171, 0.1181233, 2.957358, 0.9960784, 0, 1, 1,
0.892659, 0.516869, 0.7402186, 1, 0, 0.9960784, 1,
0.894796, -0.939373, 3.198819, 1, 0, 0.9882353, 1,
0.9005055, 0.6871727, 1.256699, 1, 0, 0.9843137, 1,
0.9027379, 0.7155437, -0.4310759, 1, 0, 0.9764706, 1,
0.9028779, -0.2265521, 2.956503, 1, 0, 0.972549, 1,
0.9096451, 0.3568415, 2.170296, 1, 0, 0.9647059, 1,
0.9110585, -0.9307137, 1.478687, 1, 0, 0.9607843, 1,
0.913372, -0.04610821, 1.640047, 1, 0, 0.9529412, 1,
0.9167858, -0.9803118, 2.291322, 1, 0, 0.9490196, 1,
0.9220998, 0.4265971, 1.779161, 1, 0, 0.9411765, 1,
0.9229381, -0.7482115, 3.329936, 1, 0, 0.9372549, 1,
0.9299868, 2.518523, 1.712401, 1, 0, 0.9294118, 1,
0.9305867, 0.4657775, 0.6777372, 1, 0, 0.9254902, 1,
0.9445682, -0.3676157, 3.48204, 1, 0, 0.9176471, 1,
0.9446733, 1.747662, 0.3136534, 1, 0, 0.9137255, 1,
0.9472309, 0.7720544, -0.2048114, 1, 0, 0.9058824, 1,
0.9494584, -1.147558, 2.052687, 1, 0, 0.9019608, 1,
0.9520078, 0.7631381, 1.255841, 1, 0, 0.8941177, 1,
0.9589497, -0.09723284, 2.568684, 1, 0, 0.8862745, 1,
0.9669972, -2.03289, 1.929207, 1, 0, 0.8823529, 1,
0.968214, 0.2134819, 2.791993, 1, 0, 0.8745098, 1,
0.9704076, -2.776379, 4.065033, 1, 0, 0.8705882, 1,
0.973713, -0.6227512, 0.7583773, 1, 0, 0.8627451, 1,
0.9749545, 0.4041207, 0.895822, 1, 0, 0.8588235, 1,
0.9791151, -0.07700758, 0.217656, 1, 0, 0.8509804, 1,
0.9810293, 1.37752, 1.979527, 1, 0, 0.8470588, 1,
0.9812334, 1.301644, -1.150457, 1, 0, 0.8392157, 1,
0.9819006, 0.7876726, 0.3108686, 1, 0, 0.8352941, 1,
0.98338, 0.03470334, 0.6434168, 1, 0, 0.827451, 1,
0.9876468, -0.9584931, 1.995205, 1, 0, 0.8235294, 1,
1.010183, 1.356555, -0.0666104, 1, 0, 0.8156863, 1,
1.012777, 1.315962, 1.515947, 1, 0, 0.8117647, 1,
1.014408, 0.8163796, 2.744403, 1, 0, 0.8039216, 1,
1.02283, -0.7017197, 1.723042, 1, 0, 0.7960784, 1,
1.026482, 0.1055867, 1.729167, 1, 0, 0.7921569, 1,
1.033038, -1.469349, 3.483499, 1, 0, 0.7843137, 1,
1.034156, -0.566411, 1.884313, 1, 0, 0.7803922, 1,
1.034306, -0.8909641, 1.547497, 1, 0, 0.772549, 1,
1.038959, -0.03211043, -0.5897762, 1, 0, 0.7686275, 1,
1.044589, 0.4431766, 0.7930449, 1, 0, 0.7607843, 1,
1.059831, 0.4333949, 0.07754932, 1, 0, 0.7568628, 1,
1.061444, 0.2812124, 1.50871, 1, 0, 0.7490196, 1,
1.068503, -2.138381, 3.287662, 1, 0, 0.7450981, 1,
1.073642, -1.568118, 1.581338, 1, 0, 0.7372549, 1,
1.08042, 0.4781348, 0.9809783, 1, 0, 0.7333333, 1,
1.0866, -1.317676, 2.182613, 1, 0, 0.7254902, 1,
1.088625, 0.7131007, 0.4457809, 1, 0, 0.7215686, 1,
1.092563, 0.3099615, 1.068417, 1, 0, 0.7137255, 1,
1.113987, 0.8394313, 0.9646299, 1, 0, 0.7098039, 1,
1.116827, 0.2443207, 0.6656659, 1, 0, 0.7019608, 1,
1.125657, 0.2332454, 2.534228, 1, 0, 0.6941177, 1,
1.126029, -0.2272035, 0.8368158, 1, 0, 0.6901961, 1,
1.127057, 1.388671, 1.09469, 1, 0, 0.682353, 1,
1.127328, -1.105204, 3.282848, 1, 0, 0.6784314, 1,
1.129651, 0.4285781, 1.157261, 1, 0, 0.6705883, 1,
1.131329, -0.320757, 0.7736048, 1, 0, 0.6666667, 1,
1.14566, 0.566905, 0.1825803, 1, 0, 0.6588235, 1,
1.155797, -0.5662969, 0.7340954, 1, 0, 0.654902, 1,
1.157693, -0.3624319, 2.559261, 1, 0, 0.6470588, 1,
1.157745, -0.8705464, 2.514205, 1, 0, 0.6431373, 1,
1.166454, -0.5373309, 2.670987, 1, 0, 0.6352941, 1,
1.172447, -1.871677, 3.754019, 1, 0, 0.6313726, 1,
1.178306, 0.7065159, 1.216127, 1, 0, 0.6235294, 1,
1.195206, 1.355812, -0.5474391, 1, 0, 0.6196079, 1,
1.196821, -1.604456, 0.9103402, 1, 0, 0.6117647, 1,
1.197202, -0.04209711, 1.869696, 1, 0, 0.6078432, 1,
1.214518, -0.03831565, 0.9073524, 1, 0, 0.6, 1,
1.233366, -0.01299622, 3.384495, 1, 0, 0.5921569, 1,
1.2426, -1.753781, 2.581644, 1, 0, 0.5882353, 1,
1.26002, 1.114465, 4.290159, 1, 0, 0.5803922, 1,
1.26011, -1.937019, 1.979283, 1, 0, 0.5764706, 1,
1.274064, 2.213485, 1.570328, 1, 0, 0.5686275, 1,
1.28107, 0.1562791, 1.095013, 1, 0, 0.5647059, 1,
1.288939, -0.3080146, 2.611933, 1, 0, 0.5568628, 1,
1.289547, 1.375534, 0.8924331, 1, 0, 0.5529412, 1,
1.289988, -0.7741868, 0.8136465, 1, 0, 0.5450981, 1,
1.294444, -0.1574976, 0.3953983, 1, 0, 0.5411765, 1,
1.296932, 0.7274004, -0.136945, 1, 0, 0.5333334, 1,
1.312282, -2.155449, 1.957867, 1, 0, 0.5294118, 1,
1.314866, -0.7552792, 2.734199, 1, 0, 0.5215687, 1,
1.315366, -0.3560026, 0.2477587, 1, 0, 0.5176471, 1,
1.317498, 1.079847, 0.9066488, 1, 0, 0.509804, 1,
1.318281, -1.155948, 2.969978, 1, 0, 0.5058824, 1,
1.319185, -0.1480037, 1.636184, 1, 0, 0.4980392, 1,
1.32536, -0.6660861, 1.859476, 1, 0, 0.4901961, 1,
1.331, 1.599813, 1.183542, 1, 0, 0.4862745, 1,
1.333911, -0.1485714, 3.177308, 1, 0, 0.4784314, 1,
1.335042, 0.427625, 2.431808, 1, 0, 0.4745098, 1,
1.335726, 0.1511248, 1.771102, 1, 0, 0.4666667, 1,
1.339048, 0.2998932, 2.133642, 1, 0, 0.4627451, 1,
1.346365, 0.07373528, 1.631998, 1, 0, 0.454902, 1,
1.360901, 0.6496026, -0.6124382, 1, 0, 0.4509804, 1,
1.362239, -0.6760582, 1.331049, 1, 0, 0.4431373, 1,
1.368273, -1.625932, 1.530776, 1, 0, 0.4392157, 1,
1.376017, 1.600911, 0.8932933, 1, 0, 0.4313726, 1,
1.378272, -0.2743594, 3.35954, 1, 0, 0.427451, 1,
1.378538, -0.2297084, 0.5203658, 1, 0, 0.4196078, 1,
1.390577, -0.716633, 2.009592, 1, 0, 0.4156863, 1,
1.392262, -1.052658, 0.6223658, 1, 0, 0.4078431, 1,
1.394353, -1.070928, 1.591189, 1, 0, 0.4039216, 1,
1.40501, 0.04152835, 2.027746, 1, 0, 0.3960784, 1,
1.406022, -1.02642, 4.59629, 1, 0, 0.3882353, 1,
1.411837, 1.11573, 1.318217, 1, 0, 0.3843137, 1,
1.441438, 0.320065, 1.0035, 1, 0, 0.3764706, 1,
1.455285, 2.834735, -0.3365087, 1, 0, 0.372549, 1,
1.466738, 0.8711686, 1.44118, 1, 0, 0.3647059, 1,
1.469099, 0.9603018, 1.104555, 1, 0, 0.3607843, 1,
1.475801, 0.2332523, 3.524975, 1, 0, 0.3529412, 1,
1.490501, -0.9821364, 1.302885, 1, 0, 0.3490196, 1,
1.496031, 1.803518, -1.745988, 1, 0, 0.3411765, 1,
1.501964, 0.5120983, 0.1108563, 1, 0, 0.3372549, 1,
1.508496, 0.8538027, 3.098358, 1, 0, 0.3294118, 1,
1.512507, -1.16491, 0.7294971, 1, 0, 0.3254902, 1,
1.520681, 0.500958, 2.243427, 1, 0, 0.3176471, 1,
1.530219, -0.2652816, 2.716242, 1, 0, 0.3137255, 1,
1.538662, -1.940745, 2.591659, 1, 0, 0.3058824, 1,
1.550461, 0.01315031, 1.896794, 1, 0, 0.2980392, 1,
1.553853, -0.9183981, 1.804475, 1, 0, 0.2941177, 1,
1.561617, 0.9785485, 2.904251, 1, 0, 0.2862745, 1,
1.564402, -1.312214, 1.841809, 1, 0, 0.282353, 1,
1.60095, 0.950274, 0.7166636, 1, 0, 0.2745098, 1,
1.617436, -0.881733, 2.061543, 1, 0, 0.2705882, 1,
1.650374, -0.6027979, 0.5555502, 1, 0, 0.2627451, 1,
1.654311, -0.1200988, 0.2385302, 1, 0, 0.2588235, 1,
1.662335, -0.2157571, 0.9485118, 1, 0, 0.2509804, 1,
1.690344, 0.7432882, 1.888089, 1, 0, 0.2470588, 1,
1.697441, 0.60849, 1.738606, 1, 0, 0.2392157, 1,
1.70533, -1.275096, 2.494782, 1, 0, 0.2352941, 1,
1.706439, -2.018483, 2.623003, 1, 0, 0.227451, 1,
1.706761, -1.405964, 3.357911, 1, 0, 0.2235294, 1,
1.714156, -0.8181292, 2.569198, 1, 0, 0.2156863, 1,
1.718141, 0.06504007, 0.5947744, 1, 0, 0.2117647, 1,
1.721511, -0.3187498, 2.953698, 1, 0, 0.2039216, 1,
1.724515, -1.168193, 1.831951, 1, 0, 0.1960784, 1,
1.727295, -1.521615, 3.034132, 1, 0, 0.1921569, 1,
1.750908, 1.143876, 1.798636, 1, 0, 0.1843137, 1,
1.76105, -0.3964764, 2.838847, 1, 0, 0.1803922, 1,
1.778598, 1.188331, -0.7661892, 1, 0, 0.172549, 1,
1.791721, 0.9791262, 2.084418, 1, 0, 0.1686275, 1,
1.805395, -1.34828, 3.410379, 1, 0, 0.1607843, 1,
1.81399, 1.169387, 1.104448, 1, 0, 0.1568628, 1,
1.81445, 1.033402, 1.07861, 1, 0, 0.1490196, 1,
1.820972, 0.1556878, 0.5612516, 1, 0, 0.145098, 1,
1.867545, -1.475052, 2.204737, 1, 0, 0.1372549, 1,
1.881561, -0.2840386, 1.946899, 1, 0, 0.1333333, 1,
1.884904, -0.9367829, 1.486406, 1, 0, 0.1254902, 1,
1.940004, 0.06924031, 3.403576, 1, 0, 0.1215686, 1,
1.953074, 0.5668195, 1.260201, 1, 0, 0.1137255, 1,
1.963938, -3.768566, 3.551345, 1, 0, 0.1098039, 1,
1.990705, -2.942985, 1.426548, 1, 0, 0.1019608, 1,
2.129424, -0.9595852, 1.681228, 1, 0, 0.09411765, 1,
2.162252, -0.8501687, 0.7159865, 1, 0, 0.09019608, 1,
2.188122, 0.3050947, 0.7469311, 1, 0, 0.08235294, 1,
2.190522, -0.3268331, 0.7981417, 1, 0, 0.07843138, 1,
2.200328, -0.451684, 3.631495, 1, 0, 0.07058824, 1,
2.226258, 0.5985948, 1.154394, 1, 0, 0.06666667, 1,
2.261614, -0.573234, 1.576951, 1, 0, 0.05882353, 1,
2.416952, 1.756201, 1.663638, 1, 0, 0.05490196, 1,
2.426513, -1.046462, 3.625846, 1, 0, 0.04705882, 1,
2.436525, 0.356507, 1.497757, 1, 0, 0.04313726, 1,
2.509728, 1.314226, 0.7659877, 1, 0, 0.03529412, 1,
2.525043, -0.3716532, 2.36482, 1, 0, 0.03137255, 1,
2.579334, 1.726594, -1.453389, 1, 0, 0.02352941, 1,
2.697536, -0.08235765, 2.627693, 1, 0, 0.01960784, 1,
2.86117, 0.4238046, 0.4927885, 1, 0, 0.01176471, 1,
3.271606, -1.844704, 0.3835365, 1, 0, 0.007843138, 1
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
0.373342, -4.946782, -7.219111, 0, -0.5, 0.5, 0.5,
0.373342, -4.946782, -7.219111, 1, -0.5, 0.5, 0.5,
0.373342, -4.946782, -7.219111, 1, 1.5, 0.5, 0.5,
0.373342, -4.946782, -7.219111, 0, 1.5, 0.5, 0.5
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
-3.507434, -0.2930013, -7.219111, 0, -0.5, 0.5, 0.5,
-3.507434, -0.2930013, -7.219111, 1, -0.5, 0.5, 0.5,
-3.507434, -0.2930013, -7.219111, 1, 1.5, 0.5, 0.5,
-3.507434, -0.2930013, -7.219111, 0, 1.5, 0.5, 0.5
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
-3.507434, -4.946782, 0.2090163, 0, -0.5, 0.5, 0.5,
-3.507434, -4.946782, 0.2090163, 1, -0.5, 0.5, 0.5,
-3.507434, -4.946782, 0.2090163, 1, 1.5, 0.5, 0.5,
-3.507434, -4.946782, 0.2090163, 0, 1.5, 0.5, 0.5
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
-2, -3.872833, -5.504928,
3, -3.872833, -5.504928,
-2, -3.872833, -5.504928,
-2, -4.051824, -5.790625,
-1, -3.872833, -5.504928,
-1, -4.051824, -5.790625,
0, -3.872833, -5.504928,
0, -4.051824, -5.790625,
1, -3.872833, -5.504928,
1, -4.051824, -5.790625,
2, -3.872833, -5.504928,
2, -4.051824, -5.790625,
3, -3.872833, -5.504928,
3, -4.051824, -5.790625
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
-2, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
-2, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
-2, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
-2, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5,
-1, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
-1, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
-1, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
-1, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5,
0, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
0, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
0, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
0, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5,
1, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
1, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
1, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
1, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5,
2, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
2, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
2, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
2, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5,
3, -4.409807, -6.36202, 0, -0.5, 0.5, 0.5,
3, -4.409807, -6.36202, 1, -0.5, 0.5, 0.5,
3, -4.409807, -6.36202, 1, 1.5, 0.5, 0.5,
3, -4.409807, -6.36202, 0, 1.5, 0.5, 0.5
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
-2.61187, -3, -5.504928,
-2.61187, 3, -5.504928,
-2.61187, -3, -5.504928,
-2.761131, -3, -5.790625,
-2.61187, -2, -5.504928,
-2.761131, -2, -5.790625,
-2.61187, -1, -5.504928,
-2.761131, -1, -5.790625,
-2.61187, 0, -5.504928,
-2.761131, 0, -5.790625,
-2.61187, 1, -5.504928,
-2.761131, 1, -5.790625,
-2.61187, 2, -5.504928,
-2.761131, 2, -5.790625,
-2.61187, 3, -5.504928,
-2.761131, 3, -5.790625
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
"-3",
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
-3.059652, -3, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, -3, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, -3, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, -3, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, -2, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, -2, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, -2, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, -2, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, -1, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, -1, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, -1, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, -1, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, 0, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, 0, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, 0, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, 0, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, 1, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, 1, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, 1, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, 1, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, 2, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, 2, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, 2, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, 2, -6.36202, 0, 1.5, 0.5, 0.5,
-3.059652, 3, -6.36202, 0, -0.5, 0.5, 0.5,
-3.059652, 3, -6.36202, 1, -0.5, 0.5, 0.5,
-3.059652, 3, -6.36202, 1, 1.5, 0.5, 0.5,
-3.059652, 3, -6.36202, 0, 1.5, 0.5, 0.5
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
-2.61187, -3.872833, -4,
-2.61187, -3.872833, 4,
-2.61187, -3.872833, -4,
-2.761131, -4.051824, -4,
-2.61187, -3.872833, -2,
-2.761131, -4.051824, -2,
-2.61187, -3.872833, 0,
-2.761131, -4.051824, 0,
-2.61187, -3.872833, 2,
-2.761131, -4.051824, 2,
-2.61187, -3.872833, 4,
-2.761131, -4.051824, 4
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
-3.059652, -4.409807, -4, 0, -0.5, 0.5, 0.5,
-3.059652, -4.409807, -4, 1, -0.5, 0.5, 0.5,
-3.059652, -4.409807, -4, 1, 1.5, 0.5, 0.5,
-3.059652, -4.409807, -4, 0, 1.5, 0.5, 0.5,
-3.059652, -4.409807, -2, 0, -0.5, 0.5, 0.5,
-3.059652, -4.409807, -2, 1, -0.5, 0.5, 0.5,
-3.059652, -4.409807, -2, 1, 1.5, 0.5, 0.5,
-3.059652, -4.409807, -2, 0, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 0, 0, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 0, 1, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 0, 1, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 0, 0, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 2, 0, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 2, 1, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 2, 1, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 2, 0, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 4, 0, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 4, 1, -0.5, 0.5, 0.5,
-3.059652, -4.409807, 4, 1, 1.5, 0.5, 0.5,
-3.059652, -4.409807, 4, 0, 1.5, 0.5, 0.5
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
-2.61187, -3.872833, -5.504928,
-2.61187, 3.28683, -5.504928,
-2.61187, -3.872833, 5.922961,
-2.61187, 3.28683, 5.922961,
-2.61187, -3.872833, -5.504928,
-2.61187, -3.872833, 5.922961,
-2.61187, 3.28683, -5.504928,
-2.61187, 3.28683, 5.922961,
-2.61187, -3.872833, -5.504928,
3.358554, -3.872833, -5.504928,
-2.61187, -3.872833, 5.922961,
3.358554, -3.872833, 5.922961,
-2.61187, 3.28683, -5.504928,
3.358554, 3.28683, -5.504928,
-2.61187, 3.28683, 5.922961,
3.358554, 3.28683, 5.922961,
3.358554, -3.872833, -5.504928,
3.358554, 3.28683, -5.504928,
3.358554, -3.872833, 5.922961,
3.358554, 3.28683, 5.922961,
3.358554, -3.872833, -5.504928,
3.358554, -3.872833, 5.922961,
3.358554, 3.28683, -5.504928,
3.358554, 3.28683, 5.922961
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
var radius = 7.875143;
var distance = 35.0374;
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
mvMatrix.translate( -0.373342, 0.2930013, -0.2090163 );
mvMatrix.scale( 1.426156, 1.189268, 0.745086 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0374);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


