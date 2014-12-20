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
-3.656472, -0.166712, -0.941465, 1, 0, 0, 1,
-2.828795, 1.235422, -1.82084, 1, 0.007843138, 0, 1,
-2.746443, 0.1271539, -3.345651, 1, 0.01176471, 0, 1,
-2.640138, 0.6881775, -2.458256, 1, 0.01960784, 0, 1,
-2.637021, -0.4113943, -1.524659, 1, 0.02352941, 0, 1,
-2.472077, 1.175987, -0.7832736, 1, 0.03137255, 0, 1,
-2.393258, 0.8292705, -2.531276, 1, 0.03529412, 0, 1,
-2.365692, -1.818458, -2.152745, 1, 0.04313726, 0, 1,
-2.297766, -0.6721928, -2.134181, 1, 0.04705882, 0, 1,
-2.295871, 2.178162, -2.068276, 1, 0.05490196, 0, 1,
-2.286132, -0.6627515, -0.3682517, 1, 0.05882353, 0, 1,
-2.281268, 0.09380553, -1.532121, 1, 0.06666667, 0, 1,
-2.273971, -0.6893526, -2.75996, 1, 0.07058824, 0, 1,
-2.235395, -0.1352107, -2.418278, 1, 0.07843138, 0, 1,
-2.230742, 2.295729, -2.267307, 1, 0.08235294, 0, 1,
-2.228675, -0.8189402, -1.432983, 1, 0.09019608, 0, 1,
-2.228361, -0.6732774, -1.595263, 1, 0.09411765, 0, 1,
-2.194558, -0.260968, -1.934191, 1, 0.1019608, 0, 1,
-2.178529, -0.7378513, -0.9774952, 1, 0.1098039, 0, 1,
-2.141333, -0.1462034, -0.2738705, 1, 0.1137255, 0, 1,
-2.132943, -1.772854, -1.359675, 1, 0.1215686, 0, 1,
-2.093103, 1.315465, -1.435231, 1, 0.1254902, 0, 1,
-2.061206, -0.1504738, -0.672561, 1, 0.1333333, 0, 1,
-2.038938, -0.8852808, -2.622411, 1, 0.1372549, 0, 1,
-2.033425, -1.969023, -2.572486, 1, 0.145098, 0, 1,
-2.033137, 0.4464756, -1.92317, 1, 0.1490196, 0, 1,
-1.983442, 0.5245988, -1.574861, 1, 0.1568628, 0, 1,
-1.968628, 0.7435678, -1.55496, 1, 0.1607843, 0, 1,
-1.968444, -1.593653, -1.700193, 1, 0.1686275, 0, 1,
-1.964987, 2.291276, -0.3482737, 1, 0.172549, 0, 1,
-1.962925, 0.8193069, -0.7704928, 1, 0.1803922, 0, 1,
-1.961052, 0.2321128, -2.688775, 1, 0.1843137, 0, 1,
-1.944532, 0.07248561, -1.900201, 1, 0.1921569, 0, 1,
-1.941728, -0.9650668, -1.546567, 1, 0.1960784, 0, 1,
-1.933085, -1.312241, -3.475333, 1, 0.2039216, 0, 1,
-1.926669, 0.5841216, -2.466265, 1, 0.2117647, 0, 1,
-1.878457, 2.049971, -1.254848, 1, 0.2156863, 0, 1,
-1.837886, 0.6856118, -0.8558593, 1, 0.2235294, 0, 1,
-1.831369, -0.6829158, -1.422268, 1, 0.227451, 0, 1,
-1.822972, -1.984806, -3.011837, 1, 0.2352941, 0, 1,
-1.810429, -0.1860358, -0.8817847, 1, 0.2392157, 0, 1,
-1.780209, -0.1679537, -1.96404, 1, 0.2470588, 0, 1,
-1.772659, 0.6320136, -0.7292883, 1, 0.2509804, 0, 1,
-1.765745, 0.2758435, -0.5370422, 1, 0.2588235, 0, 1,
-1.761171, 0.4288532, -1.836483, 1, 0.2627451, 0, 1,
-1.757176, 0.03081379, -1.619013, 1, 0.2705882, 0, 1,
-1.750997, 1.553126, -1.063262, 1, 0.2745098, 0, 1,
-1.746208, 3.056029, -0.3664573, 1, 0.282353, 0, 1,
-1.734951, -1.493515, -3.231295, 1, 0.2862745, 0, 1,
-1.728923, -1.45014, -2.046601, 1, 0.2941177, 0, 1,
-1.719633, -1.682804, -2.570258, 1, 0.3019608, 0, 1,
-1.704628, 0.0959891, -0.8045827, 1, 0.3058824, 0, 1,
-1.700503, -0.5235039, -2.919294, 1, 0.3137255, 0, 1,
-1.68743, -0.3302127, -0.8490305, 1, 0.3176471, 0, 1,
-1.68406, 1.110831, -0.9070601, 1, 0.3254902, 0, 1,
-1.682368, -0.112288, -1.0965, 1, 0.3294118, 0, 1,
-1.676373, -1.703325, -2.900716, 1, 0.3372549, 0, 1,
-1.666695, -1.03183, -3.742073, 1, 0.3411765, 0, 1,
-1.657682, -0.9684753, -2.007193, 1, 0.3490196, 0, 1,
-1.656382, 1.326375, -0.0662781, 1, 0.3529412, 0, 1,
-1.643039, 1.488228, -0.68783, 1, 0.3607843, 0, 1,
-1.638085, 0.1005699, -0.8453546, 1, 0.3647059, 0, 1,
-1.617171, -0.3353234, -2.608181, 1, 0.372549, 0, 1,
-1.612073, 0.3373315, -1.784958, 1, 0.3764706, 0, 1,
-1.599642, -0.5701194, -0.7390736, 1, 0.3843137, 0, 1,
-1.563836, -0.7402014, -0.6139822, 1, 0.3882353, 0, 1,
-1.546118, -0.2547662, -1.57991, 1, 0.3960784, 0, 1,
-1.532996, -0.2026543, -2.742034, 1, 0.4039216, 0, 1,
-1.529767, -0.2893106, -1.211845, 1, 0.4078431, 0, 1,
-1.512094, 0.6574613, -1.678945, 1, 0.4156863, 0, 1,
-1.511575, 0.3426102, -0.8844896, 1, 0.4196078, 0, 1,
-1.509906, 0.1849672, -1.419434, 1, 0.427451, 0, 1,
-1.504343, -0.7111902, -1.444053, 1, 0.4313726, 0, 1,
-1.502041, -0.1373664, -2.993501, 1, 0.4392157, 0, 1,
-1.493149, 0.7514756, -0.9684414, 1, 0.4431373, 0, 1,
-1.478816, 0.8256834, -0.2493263, 1, 0.4509804, 0, 1,
-1.477497, 1.878436, 1.073429, 1, 0.454902, 0, 1,
-1.471727, -1.303861, -2.064147, 1, 0.4627451, 0, 1,
-1.466203, 0.41736, -1.591058, 1, 0.4666667, 0, 1,
-1.449511, 0.9578592, -1.903699, 1, 0.4745098, 0, 1,
-1.445084, -0.8818284, -2.877311, 1, 0.4784314, 0, 1,
-1.442477, -0.4617098, -0.7701942, 1, 0.4862745, 0, 1,
-1.426075, -1.137626, -2.267273, 1, 0.4901961, 0, 1,
-1.41677, 1.654553, -0.2140275, 1, 0.4980392, 0, 1,
-1.410022, 0.5731545, -2.010214, 1, 0.5058824, 0, 1,
-1.408251, -1.960893, -3.796659, 1, 0.509804, 0, 1,
-1.401521, -0.1900836, -2.623828, 1, 0.5176471, 0, 1,
-1.380855, -0.9315001, -1.450562, 1, 0.5215687, 0, 1,
-1.369576, -1.15915, -2.081237, 1, 0.5294118, 0, 1,
-1.341905, 0.1178817, -1.659795, 1, 0.5333334, 0, 1,
-1.335982, -0.4611221, -3.347004, 1, 0.5411765, 0, 1,
-1.334317, -0.9404016, -2.685179, 1, 0.5450981, 0, 1,
-1.3306, 1.553558, -0.5179456, 1, 0.5529412, 0, 1,
-1.328419, 0.313051, -2.279648, 1, 0.5568628, 0, 1,
-1.318913, -0.4495933, -0.6048557, 1, 0.5647059, 0, 1,
-1.312235, 0.9763324, -0.8096418, 1, 0.5686275, 0, 1,
-1.305856, 0.2295381, -0.2433447, 1, 0.5764706, 0, 1,
-1.302145, -0.8548222, -1.767504, 1, 0.5803922, 0, 1,
-1.302075, -1.032752, -1.85974, 1, 0.5882353, 0, 1,
-1.294594, -0.350753, -3.25661, 1, 0.5921569, 0, 1,
-1.292119, 1.067782, -1.350183, 1, 0.6, 0, 1,
-1.289177, -0.5121115, -2.148633, 1, 0.6078432, 0, 1,
-1.288705, -0.7764418, -2.003916, 1, 0.6117647, 0, 1,
-1.284832, 0.5090421, -0.8378952, 1, 0.6196079, 0, 1,
-1.273478, 0.6837741, -2.630668, 1, 0.6235294, 0, 1,
-1.271004, 0.5575848, -0.725507, 1, 0.6313726, 0, 1,
-1.269633, -1.901118, -4.014473, 1, 0.6352941, 0, 1,
-1.261701, 0.3283984, 0.003136488, 1, 0.6431373, 0, 1,
-1.260535, 0.7475951, -1.1793, 1, 0.6470588, 0, 1,
-1.253009, -0.2701632, -1.985691, 1, 0.654902, 0, 1,
-1.247031, 0.7318384, 0.4105004, 1, 0.6588235, 0, 1,
-1.246719, -0.8560888, -2.617019, 1, 0.6666667, 0, 1,
-1.245927, -0.2188402, -2.452532, 1, 0.6705883, 0, 1,
-1.237024, -0.9063347, 0.2068807, 1, 0.6784314, 0, 1,
-1.234643, -0.5236394, -0.7787292, 1, 0.682353, 0, 1,
-1.233125, -0.06840257, -0.9024997, 1, 0.6901961, 0, 1,
-1.23092, -0.1781297, 0.4801762, 1, 0.6941177, 0, 1,
-1.224535, -1.078957, -4.217285, 1, 0.7019608, 0, 1,
-1.217708, 2.43646, 0.613327, 1, 0.7098039, 0, 1,
-1.216653, 0.4202757, -0.837014, 1, 0.7137255, 0, 1,
-1.211513, -0.472247, -1.045909, 1, 0.7215686, 0, 1,
-1.210339, 1.371456, 0.7607458, 1, 0.7254902, 0, 1,
-1.210298, 1.134493, 0.2785028, 1, 0.7333333, 0, 1,
-1.209697, -1.058076, -2.913666, 1, 0.7372549, 0, 1,
-1.200879, -0.0827453, -2.706384, 1, 0.7450981, 0, 1,
-1.197388, 0.5020781, -1.549677, 1, 0.7490196, 0, 1,
-1.193419, -0.6273742, -0.9494067, 1, 0.7568628, 0, 1,
-1.185186, -1.151473, -2.680638, 1, 0.7607843, 0, 1,
-1.183564, -2.218967, -1.598208, 1, 0.7686275, 0, 1,
-1.172971, -0.3410487, -0.5981402, 1, 0.772549, 0, 1,
-1.171038, -0.7000948, -3.082182, 1, 0.7803922, 0, 1,
-1.167465, 0.2435554, -0.7751159, 1, 0.7843137, 0, 1,
-1.16678, 0.9666714, 0.7848039, 1, 0.7921569, 0, 1,
-1.166747, 0.2545496, -1.558949, 1, 0.7960784, 0, 1,
-1.156026, 1.796789, -1.06497, 1, 0.8039216, 0, 1,
-1.153068, 0.3313688, -2.334213, 1, 0.8117647, 0, 1,
-1.144384, -0.7824838, -1.919725, 1, 0.8156863, 0, 1,
-1.143449, 1.446721, -1.377619, 1, 0.8235294, 0, 1,
-1.141603, -1.351417, -2.234296, 1, 0.827451, 0, 1,
-1.137651, -0.7353395, -1.61643, 1, 0.8352941, 0, 1,
-1.135948, 0.04272637, -1.036278, 1, 0.8392157, 0, 1,
-1.134594, -0.2246119, -2.303634, 1, 0.8470588, 0, 1,
-1.127923, 1.358477, -0.2309317, 1, 0.8509804, 0, 1,
-1.113512, 0.6423211, -2.528452, 1, 0.8588235, 0, 1,
-1.112707, 0.3136542, -1.407689, 1, 0.8627451, 0, 1,
-1.109975, -1.695878, -3.644537, 1, 0.8705882, 0, 1,
-1.095636, 1.664481, -1.680048, 1, 0.8745098, 0, 1,
-1.095169, 1.120342, 0.01581111, 1, 0.8823529, 0, 1,
-1.087767, 0.8319252, -1.206802, 1, 0.8862745, 0, 1,
-1.071039, 0.5089014, -2.35836, 1, 0.8941177, 0, 1,
-1.070087, 1.664161, -0.5578009, 1, 0.8980392, 0, 1,
-1.062671, 1.189276, -0.6465635, 1, 0.9058824, 0, 1,
-1.059179, 0.09866828, -1.228743, 1, 0.9137255, 0, 1,
-1.055032, 0.4059078, -1.572258, 1, 0.9176471, 0, 1,
-1.054712, -0.03388641, -1.977201, 1, 0.9254902, 0, 1,
-1.053916, -2.204755, -0.9412954, 1, 0.9294118, 0, 1,
-1.041337, -0.5867855, -2.185023, 1, 0.9372549, 0, 1,
-1.037499, 0.05838719, -0.3810838, 1, 0.9411765, 0, 1,
-1.035248, -0.06933254, -2.009758, 1, 0.9490196, 0, 1,
-1.033486, 0.7907938, -0.3484973, 1, 0.9529412, 0, 1,
-1.032551, -1.691836, -3.589792, 1, 0.9607843, 0, 1,
-1.031278, -1.50256, -1.854648, 1, 0.9647059, 0, 1,
-1.020697, 0.06248697, -1.131831, 1, 0.972549, 0, 1,
-1.008994, 1.220851, 0.06574804, 1, 0.9764706, 0, 1,
-1.001789, 0.5449625, -0.4751154, 1, 0.9843137, 0, 1,
-1.000567, 0.3581563, -1.094164, 1, 0.9882353, 0, 1,
-0.9912273, 0.9516877, 0.1193835, 1, 0.9960784, 0, 1,
-0.9911471, -0.2576969, -2.213769, 0.9960784, 1, 0, 1,
-0.9885686, 0.1424104, -1.347868, 0.9921569, 1, 0, 1,
-0.9840891, 1.179752, 1.273012, 0.9843137, 1, 0, 1,
-0.9791098, -0.7106311, -2.977333, 0.9803922, 1, 0, 1,
-0.9785334, 1.49825, 1.748883, 0.972549, 1, 0, 1,
-0.9755189, -0.1598144, -1.361532, 0.9686275, 1, 0, 1,
-0.9681305, -1.363155, -1.578094, 0.9607843, 1, 0, 1,
-0.9678311, 0.08572183, -0.5007557, 0.9568627, 1, 0, 1,
-0.9603875, -1.125867, -4.22508, 0.9490196, 1, 0, 1,
-0.9581808, -0.2769169, -2.199837, 0.945098, 1, 0, 1,
-0.9531716, -0.3733394, -4.026095, 0.9372549, 1, 0, 1,
-0.9439219, 0.8957219, 0.4533434, 0.9333333, 1, 0, 1,
-0.9417742, -0.8625445, -0.8071073, 0.9254902, 1, 0, 1,
-0.9334312, -0.06649154, -0.01612652, 0.9215686, 1, 0, 1,
-0.9064818, -2.860654, -2.274781, 0.9137255, 1, 0, 1,
-0.8912904, -1.744273, -1.374017, 0.9098039, 1, 0, 1,
-0.8910943, -1.308493, -1.327832, 0.9019608, 1, 0, 1,
-0.8816925, 1.962777, -0.3475837, 0.8941177, 1, 0, 1,
-0.8785167, -1.73035, -2.010088, 0.8901961, 1, 0, 1,
-0.8744266, -0.3480797, -2.826108, 0.8823529, 1, 0, 1,
-0.8668273, 2.65808, 0.9033545, 0.8784314, 1, 0, 1,
-0.8666236, 0.1487118, -0.8102446, 0.8705882, 1, 0, 1,
-0.8634145, 2.291608, -2.708323, 0.8666667, 1, 0, 1,
-0.8608916, -0.85563, -2.704766, 0.8588235, 1, 0, 1,
-0.8604896, 1.354768, 0.1626291, 0.854902, 1, 0, 1,
-0.8504109, 1.667167, -1.637004, 0.8470588, 1, 0, 1,
-0.8493202, -0.9471154, -2.94336, 0.8431373, 1, 0, 1,
-0.8445138, 1.018385, -0.7255014, 0.8352941, 1, 0, 1,
-0.8438689, 1.117245, -1.84219, 0.8313726, 1, 0, 1,
-0.8410617, 0.7993344, -0.06044663, 0.8235294, 1, 0, 1,
-0.826349, 0.6846361, -1.277583, 0.8196079, 1, 0, 1,
-0.8203253, 0.5237842, 0.5233181, 0.8117647, 1, 0, 1,
-0.8198194, -1.185358, -2.22485, 0.8078431, 1, 0, 1,
-0.8173863, -0.7911535, -1.370252, 0.8, 1, 0, 1,
-0.8173229, -0.5860217, -1.961163, 0.7921569, 1, 0, 1,
-0.8170943, 1.553668, -0.1574984, 0.7882353, 1, 0, 1,
-0.8169684, 1.028158, -1.846308, 0.7803922, 1, 0, 1,
-0.8169514, 0.4213707, -2.024567, 0.7764706, 1, 0, 1,
-0.8168812, 1.049803, -0.8877051, 0.7686275, 1, 0, 1,
-0.8162231, -1.891252, -2.561157, 0.7647059, 1, 0, 1,
-0.8151613, 1.914009, -0.1023515, 0.7568628, 1, 0, 1,
-0.8138149, 1.394586, 1.73696, 0.7529412, 1, 0, 1,
-0.8055276, -0.3517504, -2.586458, 0.7450981, 1, 0, 1,
-0.7996766, 0.6422562, -0.6669937, 0.7411765, 1, 0, 1,
-0.7933814, -0.4628953, -3.087876, 0.7333333, 1, 0, 1,
-0.788755, 0.7564541, -0.9388285, 0.7294118, 1, 0, 1,
-0.7857025, -0.1890375, -1.230759, 0.7215686, 1, 0, 1,
-0.78115, -0.1543233, -0.3337052, 0.7176471, 1, 0, 1,
-0.7775633, 0.3642943, -0.9513273, 0.7098039, 1, 0, 1,
-0.7753668, 1.41341, -1.505537, 0.7058824, 1, 0, 1,
-0.7751958, -1.024464, -3.394522, 0.6980392, 1, 0, 1,
-0.7726703, -2.312212, -2.164993, 0.6901961, 1, 0, 1,
-0.7681429, -2.792433, -4.017509, 0.6862745, 1, 0, 1,
-0.7638499, -1.237191, -2.876684, 0.6784314, 1, 0, 1,
-0.7637835, 0.4702362, -1.653096, 0.6745098, 1, 0, 1,
-0.762656, 0.0387289, -2.91837, 0.6666667, 1, 0, 1,
-0.7625854, -0.2800557, -0.8816475, 0.6627451, 1, 0, 1,
-0.7596381, 1.23964, -0.9290195, 0.654902, 1, 0, 1,
-0.7567097, 0.1761008, 0.1232028, 0.6509804, 1, 0, 1,
-0.7559481, 0.270998, -2.205808, 0.6431373, 1, 0, 1,
-0.7550843, 0.7317542, 1.541004, 0.6392157, 1, 0, 1,
-0.7538053, -1.199843, -3.500385, 0.6313726, 1, 0, 1,
-0.7498552, 0.2326943, -1.520717, 0.627451, 1, 0, 1,
-0.7480886, -0.6847865, -3.596365, 0.6196079, 1, 0, 1,
-0.7474266, 0.3923053, -1.899705, 0.6156863, 1, 0, 1,
-0.745593, 0.4508484, -0.5021324, 0.6078432, 1, 0, 1,
-0.7423711, 0.5100384, -0.6874067, 0.6039216, 1, 0, 1,
-0.7423506, 0.3997741, -0.4216982, 0.5960785, 1, 0, 1,
-0.7397606, 0.1684914, -1.387605, 0.5882353, 1, 0, 1,
-0.7376435, -0.6152574, -2.323085, 0.5843138, 1, 0, 1,
-0.7337418, 0.02552005, -0.1813448, 0.5764706, 1, 0, 1,
-0.73, -1.817802, -2.52493, 0.572549, 1, 0, 1,
-0.7297815, 0.1412522, -3.125995, 0.5647059, 1, 0, 1,
-0.729667, 0.07966828, -1.653823, 0.5607843, 1, 0, 1,
-0.7249402, 0.5401989, 1.103182, 0.5529412, 1, 0, 1,
-0.7208993, -1.060899, -2.418374, 0.5490196, 1, 0, 1,
-0.7090194, -0.05088681, 0.2470841, 0.5411765, 1, 0, 1,
-0.7020642, 0.4961263, -1.696351, 0.5372549, 1, 0, 1,
-0.6975801, -0.3429241, -3.427218, 0.5294118, 1, 0, 1,
-0.6946866, 0.5109484, -0.9506763, 0.5254902, 1, 0, 1,
-0.6941159, 0.4846199, -2.03863, 0.5176471, 1, 0, 1,
-0.6936415, 0.6942805, -1.773009, 0.5137255, 1, 0, 1,
-0.6931117, 1.944429, 1.426238, 0.5058824, 1, 0, 1,
-0.6930659, 2.318079, 0.3600138, 0.5019608, 1, 0, 1,
-0.6910317, 0.2615958, 0.3702143, 0.4941176, 1, 0, 1,
-0.6823378, -0.5251188, -2.801743, 0.4862745, 1, 0, 1,
-0.6821691, 1.071337, -0.6336687, 0.4823529, 1, 0, 1,
-0.6742572, -1.239579, -1.765177, 0.4745098, 1, 0, 1,
-0.6645598, -0.1637912, -1.628862, 0.4705882, 1, 0, 1,
-0.6583139, 0.2243278, -0.005656007, 0.4627451, 1, 0, 1,
-0.6566651, 0.1495577, -1.800983, 0.4588235, 1, 0, 1,
-0.6515105, 2.302065, 0.4150919, 0.4509804, 1, 0, 1,
-0.6505076, -0.6657673, -0.497499, 0.4470588, 1, 0, 1,
-0.6498565, -0.4744088, -0.6777818, 0.4392157, 1, 0, 1,
-0.6485991, -1.262208, -2.515126, 0.4352941, 1, 0, 1,
-0.6405818, 0.5521461, 0.2314082, 0.427451, 1, 0, 1,
-0.6405056, -0.4103551, -3.117298, 0.4235294, 1, 0, 1,
-0.6381024, -0.9533984, -2.304799, 0.4156863, 1, 0, 1,
-0.6319361, -0.2862109, -1.803794, 0.4117647, 1, 0, 1,
-0.6270906, 1.328987, -2.884771, 0.4039216, 1, 0, 1,
-0.623518, -0.5760518, -1.889435, 0.3960784, 1, 0, 1,
-0.6200454, -0.536174, -3.690799, 0.3921569, 1, 0, 1,
-0.6197167, 0.03105841, -0.02368373, 0.3843137, 1, 0, 1,
-0.6151947, 1.729471, 1.694669, 0.3803922, 1, 0, 1,
-0.6144816, 0.7897351, 0.7435122, 0.372549, 1, 0, 1,
-0.6063917, 0.7936285, -0.5185233, 0.3686275, 1, 0, 1,
-0.6019471, -0.2116711, -2.055025, 0.3607843, 1, 0, 1,
-0.6009815, -0.2931672, -2.117069, 0.3568628, 1, 0, 1,
-0.5957821, -2.239803, -3.183867, 0.3490196, 1, 0, 1,
-0.5944323, -0.1507941, -0.7815623, 0.345098, 1, 0, 1,
-0.5852643, -0.3062803, -2.229832, 0.3372549, 1, 0, 1,
-0.5804066, -0.8837368, -3.68117, 0.3333333, 1, 0, 1,
-0.5801347, 0.2238802, -1.699388, 0.3254902, 1, 0, 1,
-0.5779907, 1.790868, -1.595995, 0.3215686, 1, 0, 1,
-0.5720931, -0.8895991, -2.849495, 0.3137255, 1, 0, 1,
-0.5720781, 0.3307292, 0.3026239, 0.3098039, 1, 0, 1,
-0.5708675, 0.7139492, 0.5544534, 0.3019608, 1, 0, 1,
-0.5681357, -0.1449335, -1.719055, 0.2941177, 1, 0, 1,
-0.5673005, 0.1026745, -1.170762, 0.2901961, 1, 0, 1,
-0.5603094, -1.266858, -2.529838, 0.282353, 1, 0, 1,
-0.5595204, -0.3432091, -1.886953, 0.2784314, 1, 0, 1,
-0.5587952, -1.616931, -0.8604985, 0.2705882, 1, 0, 1,
-0.5586022, 2.197607, -0.3920566, 0.2666667, 1, 0, 1,
-0.5580673, -0.3155959, -3.4032, 0.2588235, 1, 0, 1,
-0.5537658, -0.3899983, -1.681486, 0.254902, 1, 0, 1,
-0.5530011, -1.338481, -3.652288, 0.2470588, 1, 0, 1,
-0.5480294, -0.08347962, -1.62307, 0.2431373, 1, 0, 1,
-0.5459315, 0.7418818, -0.9270067, 0.2352941, 1, 0, 1,
-0.5457349, -2.314847, -3.460574, 0.2313726, 1, 0, 1,
-0.5443513, 2.342886, 0.3440049, 0.2235294, 1, 0, 1,
-0.5412842, 0.1218701, -1.516867, 0.2196078, 1, 0, 1,
-0.5388574, 0.1071777, -0.5230963, 0.2117647, 1, 0, 1,
-0.5377793, -0.3144687, -1.517485, 0.2078431, 1, 0, 1,
-0.5366949, -2.71658, -2.209174, 0.2, 1, 0, 1,
-0.536137, -0.6608066, -0.3494434, 0.1921569, 1, 0, 1,
-0.5347577, 0.2120143, -2.561146, 0.1882353, 1, 0, 1,
-0.5344648, 0.5312049, -0.9859411, 0.1803922, 1, 0, 1,
-0.5336481, -1.109263, -1.298429, 0.1764706, 1, 0, 1,
-0.5290728, -0.6805813, -0.8510603, 0.1686275, 1, 0, 1,
-0.5289192, 0.7582892, -1.63908, 0.1647059, 1, 0, 1,
-0.5281025, -1.281262, -1.933245, 0.1568628, 1, 0, 1,
-0.5219501, -0.5020029, -3.748548, 0.1529412, 1, 0, 1,
-0.5214294, -0.1305579, -4.108264, 0.145098, 1, 0, 1,
-0.5192822, -1.419477, -3.454635, 0.1411765, 1, 0, 1,
-0.5136171, 0.3575724, -1.934585, 0.1333333, 1, 0, 1,
-0.5112671, -0.3989271, -1.164709, 0.1294118, 1, 0, 1,
-0.5085035, -0.09462056, -0.8046954, 0.1215686, 1, 0, 1,
-0.5075485, -0.4170108, -3.901071, 0.1176471, 1, 0, 1,
-0.5029051, -0.5062993, -1.577487, 0.1098039, 1, 0, 1,
-0.5018342, -1.19044, -2.417575, 0.1058824, 1, 0, 1,
-0.5018055, -0.9086536, -0.9233767, 0.09803922, 1, 0, 1,
-0.5016994, 0.5929602, -1.6905, 0.09019608, 1, 0, 1,
-0.4974615, 0.4627049, -0.6349328, 0.08627451, 1, 0, 1,
-0.4904205, 0.1615503, -1.053458, 0.07843138, 1, 0, 1,
-0.483332, 0.5888854, -0.9954757, 0.07450981, 1, 0, 1,
-0.480528, 0.2177131, -1.177853, 0.06666667, 1, 0, 1,
-0.4805113, -0.9921944, -1.707963, 0.0627451, 1, 0, 1,
-0.4781642, 0.8417416, -1.549185, 0.05490196, 1, 0, 1,
-0.4761672, 2.512072, 0.5935133, 0.05098039, 1, 0, 1,
-0.4733215, -1.161164, -2.078529, 0.04313726, 1, 0, 1,
-0.4693711, 0.2247045, -2.630879, 0.03921569, 1, 0, 1,
-0.467106, -0.262055, -2.470254, 0.03137255, 1, 0, 1,
-0.4607294, -1.012288, -1.5965, 0.02745098, 1, 0, 1,
-0.4591327, -0.3210998, -3.068469, 0.01960784, 1, 0, 1,
-0.4589259, 1.364028, 1.653169, 0.01568628, 1, 0, 1,
-0.4575711, 0.7027972, 1.109092, 0.007843138, 1, 0, 1,
-0.457339, -0.3511692, -1.349254, 0.003921569, 1, 0, 1,
-0.4558898, 1.878673, -0.313171, 0, 1, 0.003921569, 1,
-0.4507806, -0.5657732, -0.9793398, 0, 1, 0.01176471, 1,
-0.4483263, -0.8542693, -2.658878, 0, 1, 0.01568628, 1,
-0.444359, -0.2271834, -1.848684, 0, 1, 0.02352941, 1,
-0.4430961, 1.497095, 0.4729977, 0, 1, 0.02745098, 1,
-0.4353821, 0.8566155, -0.9807909, 0, 1, 0.03529412, 1,
-0.4338067, 0.2572704, -1.28816, 0, 1, 0.03921569, 1,
-0.4259503, 0.04429655, -0.864703, 0, 1, 0.04705882, 1,
-0.4251027, 0.3502629, 0.4257002, 0, 1, 0.05098039, 1,
-0.4204615, -0.06604919, -0.6631453, 0, 1, 0.05882353, 1,
-0.4175644, -0.3416867, -1.57565, 0, 1, 0.0627451, 1,
-0.4168468, -1.683049, -2.141597, 0, 1, 0.07058824, 1,
-0.4066401, 0.0959876, -2.165102, 0, 1, 0.07450981, 1,
-0.4062232, 1.686701, -0.8855971, 0, 1, 0.08235294, 1,
-0.3994119, 1.063092, -1.264961, 0, 1, 0.08627451, 1,
-0.3988701, 0.2220184, -0.9792358, 0, 1, 0.09411765, 1,
-0.3972597, 1.472133, 2.296337, 0, 1, 0.1019608, 1,
-0.3968927, -0.2388708, -3.466827, 0, 1, 0.1058824, 1,
-0.3909878, 1.717589, 0.4176379, 0, 1, 0.1137255, 1,
-0.3908224, -0.9008652, -1.956674, 0, 1, 0.1176471, 1,
-0.3835977, 0.6705951, 0.5059412, 0, 1, 0.1254902, 1,
-0.3792615, -0.1684137, -0.6957117, 0, 1, 0.1294118, 1,
-0.3733616, 0.3283379, -2.22882, 0, 1, 0.1372549, 1,
-0.3699394, 1.207654, -1.386397, 0, 1, 0.1411765, 1,
-0.3571671, 1.71178, -0.01053951, 0, 1, 0.1490196, 1,
-0.3501481, -0.6106484, -3.582273, 0, 1, 0.1529412, 1,
-0.3467261, -2.145969, -2.672051, 0, 1, 0.1607843, 1,
-0.3452833, -0.9293348, -4.644042, 0, 1, 0.1647059, 1,
-0.3423404, 0.9554112, -0.3042323, 0, 1, 0.172549, 1,
-0.3419188, -1.449654, -1.530764, 0, 1, 0.1764706, 1,
-0.3397801, -0.8252794, -3.328973, 0, 1, 0.1843137, 1,
-0.334917, -0.6425407, -2.969133, 0, 1, 0.1882353, 1,
-0.3288962, -0.9338291, -3.427314, 0, 1, 0.1960784, 1,
-0.3222952, 0.7493898, -2.559759, 0, 1, 0.2039216, 1,
-0.3222457, -0.4556788, -2.088415, 0, 1, 0.2078431, 1,
-0.3206728, -2.564128, -3.430864, 0, 1, 0.2156863, 1,
-0.3190848, -0.01992723, -0.9415458, 0, 1, 0.2196078, 1,
-0.3183841, 0.3387958, -0.8857935, 0, 1, 0.227451, 1,
-0.3165889, -0.6990255, -0.7281934, 0, 1, 0.2313726, 1,
-0.3162467, 1.360054, 0.2267508, 0, 1, 0.2392157, 1,
-0.3141467, -0.1622149, 0.6326295, 0, 1, 0.2431373, 1,
-0.3136999, 0.657343, -2.245109, 0, 1, 0.2509804, 1,
-0.311311, -2.015966, -2.574131, 0, 1, 0.254902, 1,
-0.3110223, -0.6497091, -3.201089, 0, 1, 0.2627451, 1,
-0.3086841, 1.338824, -0.0380287, 0, 1, 0.2666667, 1,
-0.3082831, 0.1825613, -1.448241, 0, 1, 0.2745098, 1,
-0.3058738, -0.3924772, -3.383514, 0, 1, 0.2784314, 1,
-0.3029038, -0.1019831, -1.941001, 0, 1, 0.2862745, 1,
-0.3028447, 0.7842605, 0.03651905, 0, 1, 0.2901961, 1,
-0.2996169, 1.334794, -1.214161, 0, 1, 0.2980392, 1,
-0.2976215, 0.3908897, 0.4108775, 0, 1, 0.3058824, 1,
-0.2969507, -1.340739, -3.541601, 0, 1, 0.3098039, 1,
-0.2944225, 0.9837737, -1.038755, 0, 1, 0.3176471, 1,
-0.2918159, -0.7764344, -2.787834, 0, 1, 0.3215686, 1,
-0.2897073, 0.1895514, -1.299002, 0, 1, 0.3294118, 1,
-0.2895594, -1.24114, -3.584015, 0, 1, 0.3333333, 1,
-0.2870744, -0.9972038, -3.36287, 0, 1, 0.3411765, 1,
-0.2867332, 2.189816, -1.142108, 0, 1, 0.345098, 1,
-0.2846622, 0.4990222, -0.1465881, 0, 1, 0.3529412, 1,
-0.2828967, 0.7861677, -1.171674, 0, 1, 0.3568628, 1,
-0.2826042, -0.9359241, -2.328012, 0, 1, 0.3647059, 1,
-0.2775408, -1.97201, -2.335322, 0, 1, 0.3686275, 1,
-0.2749128, 0.9675855, 0.2586786, 0, 1, 0.3764706, 1,
-0.2746899, -0.5470591, -2.824051, 0, 1, 0.3803922, 1,
-0.2745218, -1.175679, -2.80214, 0, 1, 0.3882353, 1,
-0.2727491, -0.5652624, -1.864471, 0, 1, 0.3921569, 1,
-0.272452, 1.95624, 0.8394598, 0, 1, 0.4, 1,
-0.2721292, -0.8598446, -2.480231, 0, 1, 0.4078431, 1,
-0.2720387, -0.1947365, -3.827107, 0, 1, 0.4117647, 1,
-0.2616279, -0.3008946, -3.492635, 0, 1, 0.4196078, 1,
-0.2598749, -0.5886348, -2.682053, 0, 1, 0.4235294, 1,
-0.2544753, -2.054533, -2.768226, 0, 1, 0.4313726, 1,
-0.252052, 0.7570955, 0.5998781, 0, 1, 0.4352941, 1,
-0.2508863, 1.932812, -1.960347, 0, 1, 0.4431373, 1,
-0.2504732, -0.7563262, -2.121359, 0, 1, 0.4470588, 1,
-0.249977, 1.716303, 0.3485532, 0, 1, 0.454902, 1,
-0.2467112, -0.3855618, -2.47878, 0, 1, 0.4588235, 1,
-0.2438001, -1.223381, -0.9933105, 0, 1, 0.4666667, 1,
-0.2429413, -1.143814, -3.408317, 0, 1, 0.4705882, 1,
-0.242506, 1.563686, 0.2079791, 0, 1, 0.4784314, 1,
-0.2375578, -0.7622615, -2.194462, 0, 1, 0.4823529, 1,
-0.2306204, 0.1050583, 0.6941373, 0, 1, 0.4901961, 1,
-0.2299984, 0.1387172, -1.292868, 0, 1, 0.4941176, 1,
-0.2290431, 0.2444834, -0.4883684, 0, 1, 0.5019608, 1,
-0.2255872, 0.2034466, -1.913598, 0, 1, 0.509804, 1,
-0.2254531, -0.6137395, -3.281666, 0, 1, 0.5137255, 1,
-0.2226518, -0.8613839, -3.103383, 0, 1, 0.5215687, 1,
-0.2219343, 2.452049, -0.5818876, 0, 1, 0.5254902, 1,
-0.2188215, -0.6402742, -4.674044, 0, 1, 0.5333334, 1,
-0.2168021, 0.5070541, -0.01215116, 0, 1, 0.5372549, 1,
-0.2162987, -0.1257315, -2.074887, 0, 1, 0.5450981, 1,
-0.2148758, 0.8612208, -1.086317, 0, 1, 0.5490196, 1,
-0.2142904, 1.276768, -0.7113065, 0, 1, 0.5568628, 1,
-0.2105046, 0.1969186, -0.1962192, 0, 1, 0.5607843, 1,
-0.2056185, 0.1936163, -0.3403692, 0, 1, 0.5686275, 1,
-0.1999735, -1.123738, -3.078735, 0, 1, 0.572549, 1,
-0.1998651, -0.05349148, -2.096396, 0, 1, 0.5803922, 1,
-0.1970011, 0.09869073, -1.383388, 0, 1, 0.5843138, 1,
-0.1955541, -0.2901567, -2.867697, 0, 1, 0.5921569, 1,
-0.1924037, 0.4538255, -0.9164956, 0, 1, 0.5960785, 1,
-0.1858534, 0.8146269, 0.1977997, 0, 1, 0.6039216, 1,
-0.1797522, 0.5408612, 0.2227582, 0, 1, 0.6117647, 1,
-0.1788388, 0.273177, 0.8383604, 0, 1, 0.6156863, 1,
-0.1780731, -1.492767, -4.360148, 0, 1, 0.6235294, 1,
-0.1759243, 1.048145, -0.6070862, 0, 1, 0.627451, 1,
-0.1712143, 0.4570482, -1.191661, 0, 1, 0.6352941, 1,
-0.1693921, 0.2037444, 0.07081521, 0, 1, 0.6392157, 1,
-0.1653949, -0.2840986, -3.1721, 0, 1, 0.6470588, 1,
-0.1608367, -0.1097687, -2.876164, 0, 1, 0.6509804, 1,
-0.1582527, 1.784511, 0.1068946, 0, 1, 0.6588235, 1,
-0.1541936, -0.7364328, -4.010673, 0, 1, 0.6627451, 1,
-0.1535714, -1.090954, -1.550829, 0, 1, 0.6705883, 1,
-0.1529134, -1.133831, -1.497663, 0, 1, 0.6745098, 1,
-0.1521955, 0.4601555, -1.180371, 0, 1, 0.682353, 1,
-0.1521481, 1.654515, 0.978695, 0, 1, 0.6862745, 1,
-0.1516158, -2.050278, -3.779453, 0, 1, 0.6941177, 1,
-0.1482907, -0.1691128, -2.880715, 0, 1, 0.7019608, 1,
-0.1444403, 0.6678917, 2.153313, 0, 1, 0.7058824, 1,
-0.1417442, -1.120998, -3.65286, 0, 1, 0.7137255, 1,
-0.1396718, -0.419635, -2.251818, 0, 1, 0.7176471, 1,
-0.1371943, -0.05265339, -1.424219, 0, 1, 0.7254902, 1,
-0.1325561, 0.7475562, -2.569988, 0, 1, 0.7294118, 1,
-0.1324708, 0.3541431, -0.1941368, 0, 1, 0.7372549, 1,
-0.1301228, 0.3495935, -1.028124, 0, 1, 0.7411765, 1,
-0.1300127, 0.9681633, 0.7069205, 0, 1, 0.7490196, 1,
-0.127388, -0.7729507, -3.288785, 0, 1, 0.7529412, 1,
-0.1204584, 0.8247863, -1.106084, 0, 1, 0.7607843, 1,
-0.1186901, -0.9808293, -4.182651, 0, 1, 0.7647059, 1,
-0.1182563, -0.07880667, -1.380623, 0, 1, 0.772549, 1,
-0.1115534, -0.914291, -3.762712, 0, 1, 0.7764706, 1,
-0.1096472, 0.1723922, -0.7437472, 0, 1, 0.7843137, 1,
-0.1071586, 0.9891718, 0.9796812, 0, 1, 0.7882353, 1,
-0.1071386, -0.3074334, -1.41531, 0, 1, 0.7960784, 1,
-0.1047423, -2.532804, -5.543899, 0, 1, 0.8039216, 1,
-0.08429303, 0.0602814, -1.633862, 0, 1, 0.8078431, 1,
-0.07871009, -0.5053716, -3.804561, 0, 1, 0.8156863, 1,
-0.07398777, -0.02016955, -0.6346704, 0, 1, 0.8196079, 1,
-0.07270309, 0.5144374, 0.02851259, 0, 1, 0.827451, 1,
-0.06941789, 0.1171468, -0.6245911, 0, 1, 0.8313726, 1,
-0.06711213, -2.302948, -4.926004, 0, 1, 0.8392157, 1,
-0.06025276, -0.1439536, -1.028834, 0, 1, 0.8431373, 1,
-0.05974516, -0.229318, -3.036371, 0, 1, 0.8509804, 1,
-0.05964654, -0.9547458, -2.069147, 0, 1, 0.854902, 1,
-0.0591475, -1.009894, -2.620448, 0, 1, 0.8627451, 1,
-0.05887804, 0.9922474, 1.066863, 0, 1, 0.8666667, 1,
-0.05504227, -0.337488, -3.23849, 0, 1, 0.8745098, 1,
-0.05344734, -1.0999, -2.449642, 0, 1, 0.8784314, 1,
-0.05311804, 0.6651254, -0.1707837, 0, 1, 0.8862745, 1,
-0.04072363, -0.1414764, -3.087936, 0, 1, 0.8901961, 1,
-0.03853561, -0.9483927, -2.715874, 0, 1, 0.8980392, 1,
-0.03743331, 0.4646554, -1.148926, 0, 1, 0.9058824, 1,
-0.03647029, -1.018349, -3.751028, 0, 1, 0.9098039, 1,
-0.0344383, 0.8790473, -1.020636, 0, 1, 0.9176471, 1,
-0.02867217, 1.313759, 0.3505909, 0, 1, 0.9215686, 1,
-0.02754029, 0.4216201, -1.055334, 0, 1, 0.9294118, 1,
-0.02654188, -1.342919, -4.981522, 0, 1, 0.9333333, 1,
-0.02599985, 1.211062, 0.4650973, 0, 1, 0.9411765, 1,
-0.02579643, 0.4343611, -0.02443386, 0, 1, 0.945098, 1,
-0.02404501, -0.5898329, -3.964595, 0, 1, 0.9529412, 1,
-0.02376915, 1.114415, -1.716736, 0, 1, 0.9568627, 1,
-0.01978221, -1.108922, -2.361038, 0, 1, 0.9647059, 1,
-0.01901071, -0.5302534, -3.46052, 0, 1, 0.9686275, 1,
-0.01699961, 0.04526805, 0.8280774, 0, 1, 0.9764706, 1,
-0.009826459, 0.3857317, -0.9100212, 0, 1, 0.9803922, 1,
-0.007445451, 1.694159, 0.9122621, 0, 1, 0.9882353, 1,
-0.005286514, -0.386515, -1.688696, 0, 1, 0.9921569, 1,
-0.004412786, -0.6058984, -5.014659, 0, 1, 1, 1,
-0.002598298, -1.573127, -3.481898, 0, 0.9921569, 1, 1,
-0.002098211, -0.4271164, -2.758512, 0, 0.9882353, 1, 1,
-0.001898909, 1.022234, 0.07588183, 0, 0.9803922, 1, 1,
-0.001864601, 0.1547816, -0.591349, 0, 0.9764706, 1, 1,
-0.001796625, 0.8710825, -0.5202516, 0, 0.9686275, 1, 1,
0.002583832, 0.2344894, -2.373316, 0, 0.9647059, 1, 1,
0.003617847, -0.9375905, 1.948494, 0, 0.9568627, 1, 1,
0.01096416, -0.7502793, 3.889498, 0, 0.9529412, 1, 1,
0.01461038, 2.367145, -0.1418911, 0, 0.945098, 1, 1,
0.02046238, -0.6054169, 4.491047, 0, 0.9411765, 1, 1,
0.0280137, 1.295063, -0.2237892, 0, 0.9333333, 1, 1,
0.02999043, -0.05592333, 3.18607, 0, 0.9294118, 1, 1,
0.03103848, 0.6335614, 1.757836, 0, 0.9215686, 1, 1,
0.03582628, -0.9306504, 4.088013, 0, 0.9176471, 1, 1,
0.03827123, -0.1604962, 1.930129, 0, 0.9098039, 1, 1,
0.038943, 1.511617, -0.5048817, 0, 0.9058824, 1, 1,
0.0453145, -0.3434832, 4.999485, 0, 0.8980392, 1, 1,
0.04685378, 1.901913, -0.01401848, 0, 0.8901961, 1, 1,
0.05226706, -1.701607, 2.718645, 0, 0.8862745, 1, 1,
0.05459146, 0.9260126, 0.02719801, 0, 0.8784314, 1, 1,
0.05816798, -0.7077851, 2.885629, 0, 0.8745098, 1, 1,
0.06337909, -1.780914, 2.511851, 0, 0.8666667, 1, 1,
0.06369655, 0.1200253, 0.5230488, 0, 0.8627451, 1, 1,
0.07128263, 1.200514, 0.5402489, 0, 0.854902, 1, 1,
0.07222537, 0.5496048, -1.128488, 0, 0.8509804, 1, 1,
0.07690866, 0.7963532, 0.513644, 0, 0.8431373, 1, 1,
0.07819585, -1.676325, 3.543392, 0, 0.8392157, 1, 1,
0.07943782, 0.5556678, -2.139121, 0, 0.8313726, 1, 1,
0.08005731, 0.5891241, -1.158293, 0, 0.827451, 1, 1,
0.08153047, -1.785241, 2.350273, 0, 0.8196079, 1, 1,
0.08312345, 0.326715, 1.162397, 0, 0.8156863, 1, 1,
0.09032545, -0.3626533, 3.696903, 0, 0.8078431, 1, 1,
0.09083611, -0.4987443, 2.120744, 0, 0.8039216, 1, 1,
0.09153268, 2.252692, -0.3724187, 0, 0.7960784, 1, 1,
0.09209417, -0.2712842, 1.778787, 0, 0.7882353, 1, 1,
0.09272416, 0.1860919, 1.346658, 0, 0.7843137, 1, 1,
0.09335835, 0.8275768, 0.07476842, 0, 0.7764706, 1, 1,
0.09451721, 1.322312, -0.5627609, 0, 0.772549, 1, 1,
0.09468321, 2.139301, -0.7952278, 0, 0.7647059, 1, 1,
0.09756381, 0.7371691, 2.980824, 0, 0.7607843, 1, 1,
0.1012949, -1.383719, 3.550921, 0, 0.7529412, 1, 1,
0.1054826, 0.1613844, 1.555441, 0, 0.7490196, 1, 1,
0.1074393, -0.584829, 2.512616, 0, 0.7411765, 1, 1,
0.1114141, 0.07541255, 1.129863, 0, 0.7372549, 1, 1,
0.1180949, -0.5214474, 2.541507, 0, 0.7294118, 1, 1,
0.1183645, -1.352164, 3.032373, 0, 0.7254902, 1, 1,
0.118968, 0.1812061, -0.4668632, 0, 0.7176471, 1, 1,
0.1195629, 0.0745846, 0.4013359, 0, 0.7137255, 1, 1,
0.1213759, 0.9311727, 0.5016701, 0, 0.7058824, 1, 1,
0.1218332, -0.3146307, 2.352873, 0, 0.6980392, 1, 1,
0.1238741, -2.367064, 2.621877, 0, 0.6941177, 1, 1,
0.1260599, -2.536406, 4.605692, 0, 0.6862745, 1, 1,
0.1280787, -0.9548293, 2.927722, 0, 0.682353, 1, 1,
0.1281397, -0.295923, 2.265368, 0, 0.6745098, 1, 1,
0.1300426, 0.2735769, 0.8599079, 0, 0.6705883, 1, 1,
0.1330684, 2.969509, -1.630779, 0, 0.6627451, 1, 1,
0.137337, 0.2053703, -1.787876, 0, 0.6588235, 1, 1,
0.1375292, 0.549671, -0.2102072, 0, 0.6509804, 1, 1,
0.1433474, 0.7018473, -0.1750543, 0, 0.6470588, 1, 1,
0.1541349, -0.9789214, 2.743562, 0, 0.6392157, 1, 1,
0.1595409, 0.336475, 1.379577, 0, 0.6352941, 1, 1,
0.1614385, -1.250718, 2.784032, 0, 0.627451, 1, 1,
0.1646143, -1.704574, 2.902565, 0, 0.6235294, 1, 1,
0.1699281, -0.7694775, 1.826479, 0, 0.6156863, 1, 1,
0.1718545, -0.6638989, 2.825907, 0, 0.6117647, 1, 1,
0.1766339, -0.1308434, 1.012377, 0, 0.6039216, 1, 1,
0.1774556, -0.3044369, 2.325217, 0, 0.5960785, 1, 1,
0.1780623, -1.620984, 2.287313, 0, 0.5921569, 1, 1,
0.1796306, -1.239391, 2.636334, 0, 0.5843138, 1, 1,
0.1814637, -0.5784715, 2.385028, 0, 0.5803922, 1, 1,
0.1823322, 0.9714991, -0.02123601, 0, 0.572549, 1, 1,
0.18304, 0.1841072, 1.893012, 0, 0.5686275, 1, 1,
0.1833037, -0.626227, 5.098072, 0, 0.5607843, 1, 1,
0.188126, -1.19355, -0.09941239, 0, 0.5568628, 1, 1,
0.1900779, -1.071242, 2.715132, 0, 0.5490196, 1, 1,
0.1909678, 1.344267, -0.292229, 0, 0.5450981, 1, 1,
0.1980091, 0.5035309, 1.213943, 0, 0.5372549, 1, 1,
0.2005473, 2.512587, 0.9871287, 0, 0.5333334, 1, 1,
0.2025531, 0.2898425, 1.293947, 0, 0.5254902, 1, 1,
0.2036674, -0.1777737, 2.392068, 0, 0.5215687, 1, 1,
0.2038717, -0.8925133, 4.736192, 0, 0.5137255, 1, 1,
0.205538, 1.130547, -1.262632, 0, 0.509804, 1, 1,
0.2092115, -0.496361, 2.357719, 0, 0.5019608, 1, 1,
0.2093428, 0.05808268, 0.6323867, 0, 0.4941176, 1, 1,
0.2119201, 0.5476353, -0.9035992, 0, 0.4901961, 1, 1,
0.2124348, 0.2545072, 0.3524595, 0, 0.4823529, 1, 1,
0.2158839, -0.5893325, 2.754376, 0, 0.4784314, 1, 1,
0.2193213, -0.4982292, 3.013057, 0, 0.4705882, 1, 1,
0.2193927, 0.4823288, 0.9695454, 0, 0.4666667, 1, 1,
0.2235536, -0.2206298, 1.585517, 0, 0.4588235, 1, 1,
0.2297694, -1.022834, 3.587449, 0, 0.454902, 1, 1,
0.2310826, 0.6136916, 0.3850671, 0, 0.4470588, 1, 1,
0.2324412, 0.607926, 0.2662233, 0, 0.4431373, 1, 1,
0.2334289, -2.429445, 3.333807, 0, 0.4352941, 1, 1,
0.2374856, -0.4291687, 1.937092, 0, 0.4313726, 1, 1,
0.238912, -0.9593939, 4.416673, 0, 0.4235294, 1, 1,
0.2407771, -0.08752777, -0.1412937, 0, 0.4196078, 1, 1,
0.2417027, 2.236862, -0.4202599, 0, 0.4117647, 1, 1,
0.2425436, 0.01342996, 2.006137, 0, 0.4078431, 1, 1,
0.2459297, -0.2542026, 1.753327, 0, 0.4, 1, 1,
0.2467657, 1.127127, -0.363715, 0, 0.3921569, 1, 1,
0.2481154, 0.1842994, 0.7746018, 0, 0.3882353, 1, 1,
0.2484618, 1.002788, 1.016793, 0, 0.3803922, 1, 1,
0.2559722, -0.08831095, 1.504137, 0, 0.3764706, 1, 1,
0.2564063, -0.2411051, 2.683701, 0, 0.3686275, 1, 1,
0.2566852, -0.7148718, 2.892322, 0, 0.3647059, 1, 1,
0.2569826, 1.016896, -0.7647749, 0, 0.3568628, 1, 1,
0.2604113, -0.6999781, 2.69052, 0, 0.3529412, 1, 1,
0.2606329, -0.2281077, 2.272783, 0, 0.345098, 1, 1,
0.2618164, 1.306237, 0.2928283, 0, 0.3411765, 1, 1,
0.2658851, -2.26632, 2.304781, 0, 0.3333333, 1, 1,
0.2739378, 0.8682393, -1.600001, 0, 0.3294118, 1, 1,
0.2747959, 1.378962, 0.4732088, 0, 0.3215686, 1, 1,
0.2748234, -0.4961847, 4.255251, 0, 0.3176471, 1, 1,
0.2762009, -0.2206029, -0.6631911, 0, 0.3098039, 1, 1,
0.2782141, 0.8566704, -0.09943641, 0, 0.3058824, 1, 1,
0.2789462, 0.732609, 0.05230379, 0, 0.2980392, 1, 1,
0.2795496, -0.8906664, 0.9475278, 0, 0.2901961, 1, 1,
0.2828282, -0.6858869, 3.077927, 0, 0.2862745, 1, 1,
0.285578, -0.8868786, 3.04812, 0, 0.2784314, 1, 1,
0.2867161, 0.3527166, 1.662708, 0, 0.2745098, 1, 1,
0.2889304, -0.5709171, 2.075967, 0, 0.2666667, 1, 1,
0.291059, 0.2221627, 2.020531, 0, 0.2627451, 1, 1,
0.2962281, 0.6009099, -0.1761317, 0, 0.254902, 1, 1,
0.3015255, 1.234189, 1.106265, 0, 0.2509804, 1, 1,
0.3017936, 2.229681, -1.823374, 0, 0.2431373, 1, 1,
0.302088, -0.8624985, 2.219615, 0, 0.2392157, 1, 1,
0.3038432, -1.064702, 3.498156, 0, 0.2313726, 1, 1,
0.3109231, 0.339362, 0.7322907, 0, 0.227451, 1, 1,
0.3140065, -0.06801455, 3.142189, 0, 0.2196078, 1, 1,
0.318747, -1.33266, 2.132984, 0, 0.2156863, 1, 1,
0.3202158, -0.9881563, 1.711891, 0, 0.2078431, 1, 1,
0.3262947, 1.825492, 0.541196, 0, 0.2039216, 1, 1,
0.3294834, 1.01668, 0.086727, 0, 0.1960784, 1, 1,
0.3336871, 0.3969806, 0.5692357, 0, 0.1882353, 1, 1,
0.3355124, -0.4244693, 2.708221, 0, 0.1843137, 1, 1,
0.3364395, 1.826135, -0.827643, 0, 0.1764706, 1, 1,
0.3372546, 2.191207, 0.8580242, 0, 0.172549, 1, 1,
0.3426467, 0.5333787, 1.54004, 0, 0.1647059, 1, 1,
0.3494729, -0.04622241, 0.7426378, 0, 0.1607843, 1, 1,
0.3519907, 0.1120472, 1.08904, 0, 0.1529412, 1, 1,
0.3571831, 0.7318686, 0.7840675, 0, 0.1490196, 1, 1,
0.3621062, 0.2508068, 0.6531384, 0, 0.1411765, 1, 1,
0.3622333, -0.2511699, 3.371543, 0, 0.1372549, 1, 1,
0.3663907, 1.05215, 2.51041, 0, 0.1294118, 1, 1,
0.3757155, -0.7562839, 1.42894, 0, 0.1254902, 1, 1,
0.3760084, -2.022987, 3.002783, 0, 0.1176471, 1, 1,
0.3781629, -0.05558295, 1.328835, 0, 0.1137255, 1, 1,
0.3851, 0.1360131, 2.058054, 0, 0.1058824, 1, 1,
0.3852861, 1.27619, -0.6461816, 0, 0.09803922, 1, 1,
0.3852982, 0.08861198, 0.1231176, 0, 0.09411765, 1, 1,
0.3853954, -0.4819245, 1.694674, 0, 0.08627451, 1, 1,
0.3932776, -1.131383, 3.347331, 0, 0.08235294, 1, 1,
0.3943136, 1.360265, 0.9821779, 0, 0.07450981, 1, 1,
0.3944803, 0.7281238, 1.133187, 0, 0.07058824, 1, 1,
0.3956963, 0.1019322, 2.638994, 0, 0.0627451, 1, 1,
0.399114, -0.3584628, 2.825926, 0, 0.05882353, 1, 1,
0.399424, 1.258768, 0.1356608, 0, 0.05098039, 1, 1,
0.3994956, 1.923173, -1.497146, 0, 0.04705882, 1, 1,
0.4037474, 1.999826, -0.3143459, 0, 0.03921569, 1, 1,
0.4065953, 0.5910457, 1.748479, 0, 0.03529412, 1, 1,
0.4149033, -0.2315036, 1.227265, 0, 0.02745098, 1, 1,
0.4170096, 0.7312067, 0.7597813, 0, 0.02352941, 1, 1,
0.4188853, 0.6379092, 1.688512, 0, 0.01568628, 1, 1,
0.419078, -0.4086693, 0.9478725, 0, 0.01176471, 1, 1,
0.4244649, -1.131302, 1.292455, 0, 0.003921569, 1, 1,
0.4308702, 1.405257, -0.6665335, 0.003921569, 0, 1, 1,
0.435684, 2.145965, -0.02550969, 0.007843138, 0, 1, 1,
0.4376963, -0.1103805, 0.8835393, 0.01568628, 0, 1, 1,
0.4378272, -0.2421601, 1.822309, 0.01960784, 0, 1, 1,
0.4386714, 2.160751, 1.476619, 0.02745098, 0, 1, 1,
0.4422264, 2.077324, -0.8852096, 0.03137255, 0, 1, 1,
0.4463074, 0.7341998, 0.9544228, 0.03921569, 0, 1, 1,
0.4463679, -0.8504812, 2.729986, 0.04313726, 0, 1, 1,
0.4525787, -1.445153, 1.737915, 0.05098039, 0, 1, 1,
0.4539947, -0.373263, 2.211437, 0.05490196, 0, 1, 1,
0.4565748, -1.917009, 0.8801945, 0.0627451, 0, 1, 1,
0.4584635, 1.655777, -1.606949, 0.06666667, 0, 1, 1,
0.4608795, 0.4755564, 0.6478145, 0.07450981, 0, 1, 1,
0.4617477, 0.9865575, 1.041861, 0.07843138, 0, 1, 1,
0.4635201, 0.4870403, 0.07817425, 0.08627451, 0, 1, 1,
0.4642001, -0.6291237, 1.853133, 0.09019608, 0, 1, 1,
0.4658527, -0.6533241, 3.038763, 0.09803922, 0, 1, 1,
0.4668418, -0.08352169, 2.04971, 0.1058824, 0, 1, 1,
0.4669888, 1.352762, 0.2751593, 0.1098039, 0, 1, 1,
0.4757141, 0.4514005, -0.2784635, 0.1176471, 0, 1, 1,
0.4800289, 2.082987, -1.002905, 0.1215686, 0, 1, 1,
0.4826176, -0.3325527, 2.343978, 0.1294118, 0, 1, 1,
0.4836136, 0.3907817, 0.0525434, 0.1333333, 0, 1, 1,
0.4856082, 0.7348679, 1.629527, 0.1411765, 0, 1, 1,
0.4889881, -0.518671, 3.013813, 0.145098, 0, 1, 1,
0.501999, -1.316181, 3.180348, 0.1529412, 0, 1, 1,
0.5020399, 0.2584155, 1.783251, 0.1568628, 0, 1, 1,
0.5071843, -0.3688477, 2.141286, 0.1647059, 0, 1, 1,
0.5075594, -0.3335048, 1.678046, 0.1686275, 0, 1, 1,
0.5138659, 0.2408438, -0.4900336, 0.1764706, 0, 1, 1,
0.516721, -0.5338234, 3.190631, 0.1803922, 0, 1, 1,
0.5216491, 2.062118, -0.5893998, 0.1882353, 0, 1, 1,
0.5257764, 0.2444213, 1.800515, 0.1921569, 0, 1, 1,
0.5272727, 0.9501886, 0.4045236, 0.2, 0, 1, 1,
0.5279011, -1.911505, 1.610133, 0.2078431, 0, 1, 1,
0.5283313, -0.6579539, 2.852558, 0.2117647, 0, 1, 1,
0.5381532, -0.5201878, 2.295113, 0.2196078, 0, 1, 1,
0.5388826, 1.957327, 0.8181285, 0.2235294, 0, 1, 1,
0.5440684, -0.6705461, 5.181018, 0.2313726, 0, 1, 1,
0.5445698, -0.1160145, 1.32312, 0.2352941, 0, 1, 1,
0.5464761, -0.708748, 2.945292, 0.2431373, 0, 1, 1,
0.5521462, 0.4464051, 2.270244, 0.2470588, 0, 1, 1,
0.5649105, 1.397259, -0.8365251, 0.254902, 0, 1, 1,
0.5668481, 1.653637, 0.7039634, 0.2588235, 0, 1, 1,
0.5747374, 0.6336861, -1.166171, 0.2666667, 0, 1, 1,
0.5759015, 0.8278456, -0.4904528, 0.2705882, 0, 1, 1,
0.5775329, -0.4884931, 2.34462, 0.2784314, 0, 1, 1,
0.5797706, -0.4528961, 0.7282181, 0.282353, 0, 1, 1,
0.5839116, 0.877178, -0.3595197, 0.2901961, 0, 1, 1,
0.5847906, 2.253982, -0.5818301, 0.2941177, 0, 1, 1,
0.5872746, 1.299683, 0.3279644, 0.3019608, 0, 1, 1,
0.5883362, -1.582989, 4.169584, 0.3098039, 0, 1, 1,
0.5903986, -0.3968688, 1.515304, 0.3137255, 0, 1, 1,
0.5928133, 0.3440106, 2.52777, 0.3215686, 0, 1, 1,
0.5979025, 1.521915, 0.3556808, 0.3254902, 0, 1, 1,
0.6003733, 1.045687, 2.706212, 0.3333333, 0, 1, 1,
0.603412, -0.9183971, 3.416425, 0.3372549, 0, 1, 1,
0.6039463, -0.1121332, 0.1537218, 0.345098, 0, 1, 1,
0.6050934, -0.5862146, 2.708543, 0.3490196, 0, 1, 1,
0.606314, -0.419919, 3.487082, 0.3568628, 0, 1, 1,
0.6163469, 1.463081, 1.232785, 0.3607843, 0, 1, 1,
0.6225642, 0.2023132, -0.8744343, 0.3686275, 0, 1, 1,
0.6291555, -0.1547554, 1.234695, 0.372549, 0, 1, 1,
0.6347758, -0.4078169, 3.39516, 0.3803922, 0, 1, 1,
0.634783, 2.091209, -0.5079951, 0.3843137, 0, 1, 1,
0.634872, -2.277787, 3.02228, 0.3921569, 0, 1, 1,
0.6364225, -1.600065, 1.049026, 0.3960784, 0, 1, 1,
0.6368891, -0.9613329, 3.550492, 0.4039216, 0, 1, 1,
0.6463261, -0.751531, 2.791505, 0.4117647, 0, 1, 1,
0.6501135, -0.3650627, 2.580477, 0.4156863, 0, 1, 1,
0.6517293, 1.784737, 1.314435, 0.4235294, 0, 1, 1,
0.6531959, 0.1034986, 3.758589, 0.427451, 0, 1, 1,
0.6546454, 0.08640826, 1.39204, 0.4352941, 0, 1, 1,
0.6590558, 0.411532, 1.121352, 0.4392157, 0, 1, 1,
0.6611655, 0.7328683, 1.451559, 0.4470588, 0, 1, 1,
0.6618029, -0.3541955, 2.280977, 0.4509804, 0, 1, 1,
0.6621034, 0.8031967, -0.1978256, 0.4588235, 0, 1, 1,
0.662414, 0.5049006, 2.020562, 0.4627451, 0, 1, 1,
0.6642201, 0.2165187, 1.477203, 0.4705882, 0, 1, 1,
0.6674477, 0.3546568, 2.569481, 0.4745098, 0, 1, 1,
0.6713783, 0.45114, 2.938408, 0.4823529, 0, 1, 1,
0.6714036, 0.8962349, -0.0979581, 0.4862745, 0, 1, 1,
0.6718281, 0.148381, 1.114625, 0.4941176, 0, 1, 1,
0.6718494, 0.09157828, 2.08877, 0.5019608, 0, 1, 1,
0.6720831, 0.1106262, 1.317643, 0.5058824, 0, 1, 1,
0.6738251, -1.232972, 2.895525, 0.5137255, 0, 1, 1,
0.6796384, -0.1883068, 1.420717, 0.5176471, 0, 1, 1,
0.6807568, 0.9641927, 0.1008868, 0.5254902, 0, 1, 1,
0.6887093, -1.048259, 2.71575, 0.5294118, 0, 1, 1,
0.6902767, 0.6899747, 1.635798, 0.5372549, 0, 1, 1,
0.6939635, 1.597199, 0.2024871, 0.5411765, 0, 1, 1,
0.6979092, -0.1244396, 1.866659, 0.5490196, 0, 1, 1,
0.7067862, -0.4432394, 0.3914417, 0.5529412, 0, 1, 1,
0.7070214, -0.6429381, 1.826728, 0.5607843, 0, 1, 1,
0.7131914, -0.6010298, 4.043729, 0.5647059, 0, 1, 1,
0.7179315, -1.743544, 1.526123, 0.572549, 0, 1, 1,
0.7182945, 1.501391, -0.8557497, 0.5764706, 0, 1, 1,
0.7206328, -0.004900644, 1.378094, 0.5843138, 0, 1, 1,
0.7208995, 0.57631, 1.368581, 0.5882353, 0, 1, 1,
0.7225636, 0.2044792, 0.861748, 0.5960785, 0, 1, 1,
0.7232962, -0.1120083, -0.3503623, 0.6039216, 0, 1, 1,
0.7258839, 1.068532, 0.5925899, 0.6078432, 0, 1, 1,
0.7286119, 0.2191855, 1.266906, 0.6156863, 0, 1, 1,
0.7318549, -0.8826997, 3.091619, 0.6196079, 0, 1, 1,
0.7399257, -0.4291181, 2.752208, 0.627451, 0, 1, 1,
0.740098, -1.106818, 1.862008, 0.6313726, 0, 1, 1,
0.741324, 1.036816, 0.2152642, 0.6392157, 0, 1, 1,
0.7421489, -1.412602, 1.443759, 0.6431373, 0, 1, 1,
0.744501, -1.481416, 2.105769, 0.6509804, 0, 1, 1,
0.7460232, -0.5581453, 3.462546, 0.654902, 0, 1, 1,
0.7502921, -1.641518, 3.768301, 0.6627451, 0, 1, 1,
0.7506962, -1.309975, 1.253237, 0.6666667, 0, 1, 1,
0.7510732, -1.306441, 3.279569, 0.6745098, 0, 1, 1,
0.757179, 0.4085315, -0.4191092, 0.6784314, 0, 1, 1,
0.7607684, 1.170586, -0.7653846, 0.6862745, 0, 1, 1,
0.7674992, 1.455578, 0.3692222, 0.6901961, 0, 1, 1,
0.7685861, 1.256856, 1.304503, 0.6980392, 0, 1, 1,
0.7691005, -1.060299, 2.289983, 0.7058824, 0, 1, 1,
0.7730505, -0.4676714, 3.706145, 0.7098039, 0, 1, 1,
0.7841083, -1.424101, 1.501105, 0.7176471, 0, 1, 1,
0.7922902, -0.3512095, 0.6541879, 0.7215686, 0, 1, 1,
0.7934349, 0.5973829, -1.736739, 0.7294118, 0, 1, 1,
0.7962639, 0.6835946, 2.054621, 0.7333333, 0, 1, 1,
0.8001654, -0.9906971, 0.9870619, 0.7411765, 0, 1, 1,
0.8081659, -0.1514324, 2.735898, 0.7450981, 0, 1, 1,
0.8121665, -0.6482201, 1.992415, 0.7529412, 0, 1, 1,
0.8143885, 1.118674, 0.04288459, 0.7568628, 0, 1, 1,
0.8204643, 0.3035828, 1.773603, 0.7647059, 0, 1, 1,
0.8239582, 0.5700078, 2.58652, 0.7686275, 0, 1, 1,
0.8246125, -0.3220026, 3.080152, 0.7764706, 0, 1, 1,
0.8252343, 0.3989402, 0.8978602, 0.7803922, 0, 1, 1,
0.8271738, -0.6343825, 2.600713, 0.7882353, 0, 1, 1,
0.8353528, 1.868052, 0.5061828, 0.7921569, 0, 1, 1,
0.8356319, -0.667392, 2.686034, 0.8, 0, 1, 1,
0.8360105, 0.7063507, 2.083166, 0.8078431, 0, 1, 1,
0.842087, 0.1162884, 1.221881, 0.8117647, 0, 1, 1,
0.842252, 0.7304029, 1.270303, 0.8196079, 0, 1, 1,
0.8500933, -0.2015059, 1.458573, 0.8235294, 0, 1, 1,
0.8552454, 0.1912485, 0.9569903, 0.8313726, 0, 1, 1,
0.8562925, 1.157904, 2.224096, 0.8352941, 0, 1, 1,
0.8570212, -0.3045413, 2.653156, 0.8431373, 0, 1, 1,
0.8650907, 1.511943, -0.1713085, 0.8470588, 0, 1, 1,
0.8667384, -0.5102244, 3.025154, 0.854902, 0, 1, 1,
0.8673396, 1.674888, -0.2645577, 0.8588235, 0, 1, 1,
0.8702051, -1.538449, 2.136987, 0.8666667, 0, 1, 1,
0.8833328, 0.07221421, 0.5625852, 0.8705882, 0, 1, 1,
0.8834283, 0.7529336, -0.5281218, 0.8784314, 0, 1, 1,
0.888933, 1.121611, -0.240979, 0.8823529, 0, 1, 1,
0.8902975, -0.7392536, 2.119412, 0.8901961, 0, 1, 1,
0.8908465, -0.551053, 4.172529, 0.8941177, 0, 1, 1,
0.8940467, 0.7453557, 0.3532096, 0.9019608, 0, 1, 1,
0.9087991, 1.855015, 1.030073, 0.9098039, 0, 1, 1,
0.9105424, 1.340314, 0.5607801, 0.9137255, 0, 1, 1,
0.9118048, -0.4165512, 3.037609, 0.9215686, 0, 1, 1,
0.9132599, -0.8089511, 1.616277, 0.9254902, 0, 1, 1,
0.9175573, -1.402304, 4.371945, 0.9333333, 0, 1, 1,
0.9193704, 0.5493345, -0.4026173, 0.9372549, 0, 1, 1,
0.9228069, 0.820691, 0.9527942, 0.945098, 0, 1, 1,
0.9239612, -0.7077144, 1.727492, 0.9490196, 0, 1, 1,
0.929004, 1.134842, -0.1079584, 0.9568627, 0, 1, 1,
0.9303101, 1.064442, 1.187746, 0.9607843, 0, 1, 1,
0.9404112, -1.007306, 3.339566, 0.9686275, 0, 1, 1,
0.9404824, -0.2567445, 1.393927, 0.972549, 0, 1, 1,
0.9423339, 0.7982483, 3.654635, 0.9803922, 0, 1, 1,
0.9460232, 1.433854, 0.3475321, 0.9843137, 0, 1, 1,
0.9529351, -0.01942371, 1.865536, 0.9921569, 0, 1, 1,
0.955458, -0.62564, 2.897603, 0.9960784, 0, 1, 1,
0.9580531, 0.3952629, 1.323896, 1, 0, 0.9960784, 1,
0.9589087, -0.1576615, 3.28113, 1, 0, 0.9882353, 1,
0.9634923, -0.02590232, 2.617767, 1, 0, 0.9843137, 1,
0.9637597, 0.1161462, 1.444853, 1, 0, 0.9764706, 1,
0.9708269, 0.2225536, -0.2747018, 1, 0, 0.972549, 1,
0.9772965, 0.2326526, 0.455305, 1, 0, 0.9647059, 1,
0.9808038, 0.550459, -0.05808088, 1, 0, 0.9607843, 1,
0.983246, -0.8969735, 3.946762, 1, 0, 0.9529412, 1,
0.9859377, -1.247484, 2.687979, 1, 0, 0.9490196, 1,
0.9958119, 0.03589308, 0.1758995, 1, 0, 0.9411765, 1,
0.9966293, -1.258022, 2.970855, 1, 0, 0.9372549, 1,
0.9971322, -1.859471, 3.511307, 1, 0, 0.9294118, 1,
1.000148, -0.8860757, 3.243667, 1, 0, 0.9254902, 1,
1.005594, -1.231862, 2.609794, 1, 0, 0.9176471, 1,
1.017828, -1.307672, 2.90282, 1, 0, 0.9137255, 1,
1.050404, -0.6498169, 1.854839, 1, 0, 0.9058824, 1,
1.054324, 0.5463348, 2.545886, 1, 0, 0.9019608, 1,
1.055078, -0.004063696, -0.1225694, 1, 0, 0.8941177, 1,
1.063434, 0.9616572, -1.616508, 1, 0, 0.8862745, 1,
1.06729, -0.06470808, 2.148048, 1, 0, 0.8823529, 1,
1.073833, -0.6968957, 0.7968938, 1, 0, 0.8745098, 1,
1.091975, 1.975365, 0.9843882, 1, 0, 0.8705882, 1,
1.092936, 0.837719, 2.017418, 1, 0, 0.8627451, 1,
1.09444, 1.09248, 1.619884, 1, 0, 0.8588235, 1,
1.094654, -1.209598, 2.590246, 1, 0, 0.8509804, 1,
1.110944, 1.430826, 0.1893419, 1, 0, 0.8470588, 1,
1.112817, 2.609324, -1.695064, 1, 0, 0.8392157, 1,
1.117402, 0.7517689, 2.674039, 1, 0, 0.8352941, 1,
1.117891, 0.4501363, 0.719846, 1, 0, 0.827451, 1,
1.121466, -0.6742701, 2.783141, 1, 0, 0.8235294, 1,
1.126279, 1.558967, 1.159276, 1, 0, 0.8156863, 1,
1.130129, 0.1920081, 1.856273, 1, 0, 0.8117647, 1,
1.13138, -1.275786, 2.050789, 1, 0, 0.8039216, 1,
1.133659, -0.07254442, 2.021338, 1, 0, 0.7960784, 1,
1.134759, -1.512236, 2.820951, 1, 0, 0.7921569, 1,
1.137365, -2.06315, 3.703529, 1, 0, 0.7843137, 1,
1.140678, 0.9385531, 0.9324231, 1, 0, 0.7803922, 1,
1.14178, 2.815605, -1.057194, 1, 0, 0.772549, 1,
1.14792, -0.9203483, 1.366601, 1, 0, 0.7686275, 1,
1.152068, -0.7442591, 0.02537832, 1, 0, 0.7607843, 1,
1.156502, 1.375087, 0.5046436, 1, 0, 0.7568628, 1,
1.161031, 1.440114, 1.332997, 1, 0, 0.7490196, 1,
1.162539, 0.1029025, -0.3390556, 1, 0, 0.7450981, 1,
1.168993, -1.078919, 2.096041, 1, 0, 0.7372549, 1,
1.178418, 0.6363454, 1.345822, 1, 0, 0.7333333, 1,
1.202504, 0.9560335, 0.1564067, 1, 0, 0.7254902, 1,
1.219288, -0.1507169, 0.3846321, 1, 0, 0.7215686, 1,
1.233898, 0.1652524, -0.06368356, 1, 0, 0.7137255, 1,
1.235463, 0.3787104, 2.089404, 1, 0, 0.7098039, 1,
1.238037, -1.198298, 1.661, 1, 0, 0.7019608, 1,
1.242179, 0.7781193, -0.5709996, 1, 0, 0.6941177, 1,
1.246536, -0.3776178, 2.910259, 1, 0, 0.6901961, 1,
1.255306, 0.6149438, 0.8347713, 1, 0, 0.682353, 1,
1.258459, -0.5964088, 1.355658, 1, 0, 0.6784314, 1,
1.2601, -2.869027, 0.7484386, 1, 0, 0.6705883, 1,
1.26227, -1.154525, 2.675928, 1, 0, 0.6666667, 1,
1.263952, 1.301562, 1.219593, 1, 0, 0.6588235, 1,
1.265648, -1.205212, 2.070012, 1, 0, 0.654902, 1,
1.267187, -1.192322, 2.163268, 1, 0, 0.6470588, 1,
1.271601, -0.5119404, 2.504804, 1, 0, 0.6431373, 1,
1.282918, -0.5898021, 4.096148, 1, 0, 0.6352941, 1,
1.294679, -0.8628526, 4.146183, 1, 0, 0.6313726, 1,
1.299548, -1.580698, 2.234448, 1, 0, 0.6235294, 1,
1.306454, -0.2141524, 0.1305228, 1, 0, 0.6196079, 1,
1.312133, -0.4488575, 2.426542, 1, 0, 0.6117647, 1,
1.314469, -0.9506561, 0.7091617, 1, 0, 0.6078432, 1,
1.323387, -1.003575, 2.086238, 1, 0, 0.6, 1,
1.329545, 0.5004066, 0.2366615, 1, 0, 0.5921569, 1,
1.330302, -0.4025316, 2.297658, 1, 0, 0.5882353, 1,
1.332643, 0.1881443, 1.311511, 1, 0, 0.5803922, 1,
1.350244, 0.5708127, 2.906455, 1, 0, 0.5764706, 1,
1.362279, -0.2327169, 1.673776, 1, 0, 0.5686275, 1,
1.362424, 0.7306522, 2.83146, 1, 0, 0.5647059, 1,
1.364337, -1.360052, 2.533782, 1, 0, 0.5568628, 1,
1.389726, 0.1725397, 1.807484, 1, 0, 0.5529412, 1,
1.399567, -0.6611001, 1.575098, 1, 0, 0.5450981, 1,
1.402555, 0.8956335, 0.7776144, 1, 0, 0.5411765, 1,
1.414117, 0.2650635, 1.870612, 1, 0, 0.5333334, 1,
1.420959, -0.3404667, 2.023304, 1, 0, 0.5294118, 1,
1.421379, -0.2943317, 1.215775, 1, 0, 0.5215687, 1,
1.431417, 0.6096194, 0.7142597, 1, 0, 0.5176471, 1,
1.435024, 1.04348, 1.428339, 1, 0, 0.509804, 1,
1.439113, -0.8536504, 1.076603, 1, 0, 0.5058824, 1,
1.443846, -0.2048633, 2.055195, 1, 0, 0.4980392, 1,
1.444915, 2.00979, 0.3501923, 1, 0, 0.4901961, 1,
1.448126, -1.00761, 1.813603, 1, 0, 0.4862745, 1,
1.448731, 1.505505, 2.004052, 1, 0, 0.4784314, 1,
1.451765, 0.5022969, 3.704863, 1, 0, 0.4745098, 1,
1.452811, 0.7997942, 3.108994, 1, 0, 0.4666667, 1,
1.462727, 0.2580286, 1.443703, 1, 0, 0.4627451, 1,
1.467398, 1.062211, 1.181186, 1, 0, 0.454902, 1,
1.467603, -0.2223058, 0.08247161, 1, 0, 0.4509804, 1,
1.472295, -0.1525849, 1.473685, 1, 0, 0.4431373, 1,
1.480908, -2.572645, 2.535318, 1, 0, 0.4392157, 1,
1.486513, -0.1291556, 0.9156239, 1, 0, 0.4313726, 1,
1.491123, -2.344408, 1.584361, 1, 0, 0.427451, 1,
1.500495, 1.154095, 0.5847036, 1, 0, 0.4196078, 1,
1.502507, 0.8939813, 1.826963, 1, 0, 0.4156863, 1,
1.506909, 1.434402, 1.977002, 1, 0, 0.4078431, 1,
1.519542, -1.461875, 3.384592, 1, 0, 0.4039216, 1,
1.521329, -0.06686734, 0.5633565, 1, 0, 0.3960784, 1,
1.522844, -0.482975, 1.354578, 1, 0, 0.3882353, 1,
1.523498, 0.6610097, 1.8915, 1, 0, 0.3843137, 1,
1.526723, -0.1495196, 2.316703, 1, 0, 0.3764706, 1,
1.527193, -0.7630311, 1.283203, 1, 0, 0.372549, 1,
1.527295, -1.499724, 1.360305, 1, 0, 0.3647059, 1,
1.546351, 0.4805701, 2.876711, 1, 0, 0.3607843, 1,
1.55469, 1.789962, 2.419608, 1, 0, 0.3529412, 1,
1.555768, -0.7524956, 1.184026, 1, 0, 0.3490196, 1,
1.558335, -0.5319272, 1.739786, 1, 0, 0.3411765, 1,
1.567264, 0.6724386, 0.8618823, 1, 0, 0.3372549, 1,
1.594542, -0.3284359, 2.305459, 1, 0, 0.3294118, 1,
1.60671, -0.7807299, 2.810154, 1, 0, 0.3254902, 1,
1.606993, -1.221541, 1.72118, 1, 0, 0.3176471, 1,
1.615383, 0.5158651, 1.80699, 1, 0, 0.3137255, 1,
1.618379, 0.7022215, 0.6968757, 1, 0, 0.3058824, 1,
1.630719, 0.2587849, 1.847594, 1, 0, 0.2980392, 1,
1.645002, 2.063134, 2.003674, 1, 0, 0.2941177, 1,
1.654233, 0.1282104, 2.708931, 1, 0, 0.2862745, 1,
1.656704, 0.04858248, 0.6367096, 1, 0, 0.282353, 1,
1.680738, 1.135099, -0.7863778, 1, 0, 0.2745098, 1,
1.705826, 0.5873303, 3.152344, 1, 0, 0.2705882, 1,
1.712771, 1.817555, -0.1927626, 1, 0, 0.2627451, 1,
1.728035, 0.7042777, 3.278765, 1, 0, 0.2588235, 1,
1.797012, -1.502533, 3.272997, 1, 0, 0.2509804, 1,
1.837003, 1.69104, -0.7832806, 1, 0, 0.2470588, 1,
1.851048, 0.1274365, 1.990209, 1, 0, 0.2392157, 1,
1.857949, 1.304257, 0.1488833, 1, 0, 0.2352941, 1,
1.85959, 0.2974217, 2.270485, 1, 0, 0.227451, 1,
1.879714, 0.22942, 0.7766004, 1, 0, 0.2235294, 1,
1.883752, -2.251058, 3.537908, 1, 0, 0.2156863, 1,
1.902416, 0.6904585, 1.912216, 1, 0, 0.2117647, 1,
1.92169, -1.66567, 0.2188594, 1, 0, 0.2039216, 1,
1.948723, -1.23574, 3.106137, 1, 0, 0.1960784, 1,
1.953721, 0.4030717, 1.56423, 1, 0, 0.1921569, 1,
1.970813, -2.31609, 2.990824, 1, 0, 0.1843137, 1,
1.974363, -0.583241, 1.537914, 1, 0, 0.1803922, 1,
1.980362, -0.7903457, 1.884745, 1, 0, 0.172549, 1,
1.993828, 0.007111318, 1.400617, 1, 0, 0.1686275, 1,
2.042195, -0.002497211, 3.226029, 1, 0, 0.1607843, 1,
2.062181, 0.2352265, -0.2239734, 1, 0, 0.1568628, 1,
2.071581, 0.3605156, 1.877993, 1, 0, 0.1490196, 1,
2.093533, -0.05371382, 2.838591, 1, 0, 0.145098, 1,
2.097886, -1.470429, 4.035121, 1, 0, 0.1372549, 1,
2.105305, -1.943059, 1.424968, 1, 0, 0.1333333, 1,
2.131665, 0.2935581, 1.464389, 1, 0, 0.1254902, 1,
2.138562, 0.4208662, -0.2552386, 1, 0, 0.1215686, 1,
2.188638, -1.63158, 1.121547, 1, 0, 0.1137255, 1,
2.210064, 0.6399917, 2.725956, 1, 0, 0.1098039, 1,
2.21191, -1.059182, 1.266284, 1, 0, 0.1019608, 1,
2.237744, -0.9442345, 2.965973, 1, 0, 0.09411765, 1,
2.270927, -0.1606388, 0.8480667, 1, 0, 0.09019608, 1,
2.301114, 0.09871463, 1.469372, 1, 0, 0.08235294, 1,
2.328326, 1.205116, 2.239597, 1, 0, 0.07843138, 1,
2.3445, 0.1018417, 1.981734, 1, 0, 0.07058824, 1,
2.377215, -1.706972, 0.6036695, 1, 0, 0.06666667, 1,
2.399564, 0.2810185, 2.500948, 1, 0, 0.05882353, 1,
2.472177, 1.497492, 2.04758, 1, 0, 0.05490196, 1,
2.489394, 0.2163432, 2.340377, 1, 0, 0.04705882, 1,
2.557263, 0.8252318, 0.6170093, 1, 0, 0.04313726, 1,
2.649915, -0.7688578, 1.491224, 1, 0, 0.03529412, 1,
2.708391, 0.2781844, 1.058215, 1, 0, 0.03137255, 1,
2.790676, 0.2762464, 0.9510798, 1, 0, 0.02352941, 1,
2.899524, 2.504719, -0.6343352, 1, 0, 0.01960784, 1,
2.946257, -0.8299664, 2.052846, 1, 0, 0.01176471, 1,
3.1964, 1.349279, -0.3394651, 1, 0, 0.007843138, 1
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
-0.2300359, -3.873324, -7.361772, 0, -0.5, 0.5, 0.5,
-0.2300359, -3.873324, -7.361772, 1, -0.5, 0.5, 0.5,
-0.2300359, -3.873324, -7.361772, 1, 1.5, 0.5, 0.5,
-0.2300359, -3.873324, -7.361772, 0, 1.5, 0.5, 0.5
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
-4.818034, 0.09350061, -7.361772, 0, -0.5, 0.5, 0.5,
-4.818034, 0.09350061, -7.361772, 1, -0.5, 0.5, 0.5,
-4.818034, 0.09350061, -7.361772, 1, 1.5, 0.5, 0.5,
-4.818034, 0.09350061, -7.361772, 0, 1.5, 0.5, 0.5
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
-4.818034, -3.873324, -0.1814401, 0, -0.5, 0.5, 0.5,
-4.818034, -3.873324, -0.1814401, 1, -0.5, 0.5, 0.5,
-4.818034, -3.873324, -0.1814401, 1, 1.5, 0.5, 0.5,
-4.818034, -3.873324, -0.1814401, 0, 1.5, 0.5, 0.5
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
-3, -2.957903, -5.704772,
3, -2.957903, -5.704772,
-3, -2.957903, -5.704772,
-3, -3.110473, -5.980939,
-2, -2.957903, -5.704772,
-2, -3.110473, -5.980939,
-1, -2.957903, -5.704772,
-1, -3.110473, -5.980939,
0, -2.957903, -5.704772,
0, -3.110473, -5.980939,
1, -2.957903, -5.704772,
1, -3.110473, -5.980939,
2, -2.957903, -5.704772,
2, -3.110473, -5.980939,
3, -2.957903, -5.704772,
3, -3.110473, -5.980939
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
-3, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
-3, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
-3, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
-3, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
-2, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
-2, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
-2, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
-2, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
-1, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
-1, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
-1, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
-1, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
0, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
0, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
0, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
0, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
1, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
1, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
1, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
1, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
2, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
2, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
2, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
2, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5,
3, -3.415614, -6.533272, 0, -0.5, 0.5, 0.5,
3, -3.415614, -6.533272, 1, -0.5, 0.5, 0.5,
3, -3.415614, -6.533272, 1, 1.5, 0.5, 0.5,
3, -3.415614, -6.533272, 0, 1.5, 0.5, 0.5
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
-3.759265, -2, -5.704772,
-3.759265, 3, -5.704772,
-3.759265, -2, -5.704772,
-3.935726, -2, -5.980939,
-3.759265, -1, -5.704772,
-3.935726, -1, -5.980939,
-3.759265, 0, -5.704772,
-3.935726, 0, -5.980939,
-3.759265, 1, -5.704772,
-3.935726, 1, -5.980939,
-3.759265, 2, -5.704772,
-3.935726, 2, -5.980939,
-3.759265, 3, -5.704772,
-3.935726, 3, -5.980939
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
-4.28865, -2, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, -2, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, -2, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, -2, -6.533272, 0, 1.5, 0.5, 0.5,
-4.28865, -1, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, -1, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, -1, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, -1, -6.533272, 0, 1.5, 0.5, 0.5,
-4.28865, 0, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, 0, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, 0, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, 0, -6.533272, 0, 1.5, 0.5, 0.5,
-4.28865, 1, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, 1, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, 1, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, 1, -6.533272, 0, 1.5, 0.5, 0.5,
-4.28865, 2, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, 2, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, 2, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, 2, -6.533272, 0, 1.5, 0.5, 0.5,
-4.28865, 3, -6.533272, 0, -0.5, 0.5, 0.5,
-4.28865, 3, -6.533272, 1, -0.5, 0.5, 0.5,
-4.28865, 3, -6.533272, 1, 1.5, 0.5, 0.5,
-4.28865, 3, -6.533272, 0, 1.5, 0.5, 0.5
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
-3.759265, -2.957903, -4,
-3.759265, -2.957903, 4,
-3.759265, -2.957903, -4,
-3.935726, -3.110473, -4,
-3.759265, -2.957903, -2,
-3.935726, -3.110473, -2,
-3.759265, -2.957903, 0,
-3.935726, -3.110473, 0,
-3.759265, -2.957903, 2,
-3.935726, -3.110473, 2,
-3.759265, -2.957903, 4,
-3.935726, -3.110473, 4
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
-4.28865, -3.415614, -4, 0, -0.5, 0.5, 0.5,
-4.28865, -3.415614, -4, 1, -0.5, 0.5, 0.5,
-4.28865, -3.415614, -4, 1, 1.5, 0.5, 0.5,
-4.28865, -3.415614, -4, 0, 1.5, 0.5, 0.5,
-4.28865, -3.415614, -2, 0, -0.5, 0.5, 0.5,
-4.28865, -3.415614, -2, 1, -0.5, 0.5, 0.5,
-4.28865, -3.415614, -2, 1, 1.5, 0.5, 0.5,
-4.28865, -3.415614, -2, 0, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 0, 0, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 0, 1, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 0, 1, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 0, 0, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 2, 0, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 2, 1, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 2, 1, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 2, 0, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 4, 0, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 4, 1, -0.5, 0.5, 0.5,
-4.28865, -3.415614, 4, 1, 1.5, 0.5, 0.5,
-4.28865, -3.415614, 4, 0, 1.5, 0.5, 0.5
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
-3.759265, -2.957903, -5.704772,
-3.759265, 3.144904, -5.704772,
-3.759265, -2.957903, 5.341892,
-3.759265, 3.144904, 5.341892,
-3.759265, -2.957903, -5.704772,
-3.759265, -2.957903, 5.341892,
-3.759265, 3.144904, -5.704772,
-3.759265, 3.144904, 5.341892,
-3.759265, -2.957903, -5.704772,
3.299193, -2.957903, -5.704772,
-3.759265, -2.957903, 5.341892,
3.299193, -2.957903, 5.341892,
-3.759265, 3.144904, -5.704772,
3.299193, 3.144904, -5.704772,
-3.759265, 3.144904, 5.341892,
3.299193, 3.144904, 5.341892,
3.299193, -2.957903, -5.704772,
3.299193, 3.144904, -5.704772,
3.299193, -2.957903, 5.341892,
3.299193, 3.144904, 5.341892,
3.299193, -2.957903, -5.704772,
3.299193, -2.957903, 5.341892,
3.299193, 3.144904, -5.704772,
3.299193, 3.144904, 5.341892
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
var radius = 7.72142;
var distance = 34.35347;
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
mvMatrix.translate( 0.2300359, -0.09350061, 0.1814401 );
mvMatrix.scale( 1.182773, 1.367985, 0.7557531 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35347);
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
Phenylcarbamate<-read.table("Phenylcarbamate.xyz")
```

```
## Error in read.table("Phenylcarbamate.xyz"): no lines available in input
```

```r
x<-Phenylcarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
```

```r
y<-Phenylcarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
```

```r
z<-Phenylcarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylcarbamate' not found
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
-3.656472, -0.166712, -0.941465, 0, 0, 1, 1, 1,
-2.828795, 1.235422, -1.82084, 1, 0, 0, 1, 1,
-2.746443, 0.1271539, -3.345651, 1, 0, 0, 1, 1,
-2.640138, 0.6881775, -2.458256, 1, 0, 0, 1, 1,
-2.637021, -0.4113943, -1.524659, 1, 0, 0, 1, 1,
-2.472077, 1.175987, -0.7832736, 1, 0, 0, 1, 1,
-2.393258, 0.8292705, -2.531276, 0, 0, 0, 1, 1,
-2.365692, -1.818458, -2.152745, 0, 0, 0, 1, 1,
-2.297766, -0.6721928, -2.134181, 0, 0, 0, 1, 1,
-2.295871, 2.178162, -2.068276, 0, 0, 0, 1, 1,
-2.286132, -0.6627515, -0.3682517, 0, 0, 0, 1, 1,
-2.281268, 0.09380553, -1.532121, 0, 0, 0, 1, 1,
-2.273971, -0.6893526, -2.75996, 0, 0, 0, 1, 1,
-2.235395, -0.1352107, -2.418278, 1, 1, 1, 1, 1,
-2.230742, 2.295729, -2.267307, 1, 1, 1, 1, 1,
-2.228675, -0.8189402, -1.432983, 1, 1, 1, 1, 1,
-2.228361, -0.6732774, -1.595263, 1, 1, 1, 1, 1,
-2.194558, -0.260968, -1.934191, 1, 1, 1, 1, 1,
-2.178529, -0.7378513, -0.9774952, 1, 1, 1, 1, 1,
-2.141333, -0.1462034, -0.2738705, 1, 1, 1, 1, 1,
-2.132943, -1.772854, -1.359675, 1, 1, 1, 1, 1,
-2.093103, 1.315465, -1.435231, 1, 1, 1, 1, 1,
-2.061206, -0.1504738, -0.672561, 1, 1, 1, 1, 1,
-2.038938, -0.8852808, -2.622411, 1, 1, 1, 1, 1,
-2.033425, -1.969023, -2.572486, 1, 1, 1, 1, 1,
-2.033137, 0.4464756, -1.92317, 1, 1, 1, 1, 1,
-1.983442, 0.5245988, -1.574861, 1, 1, 1, 1, 1,
-1.968628, 0.7435678, -1.55496, 1, 1, 1, 1, 1,
-1.968444, -1.593653, -1.700193, 0, 0, 1, 1, 1,
-1.964987, 2.291276, -0.3482737, 1, 0, 0, 1, 1,
-1.962925, 0.8193069, -0.7704928, 1, 0, 0, 1, 1,
-1.961052, 0.2321128, -2.688775, 1, 0, 0, 1, 1,
-1.944532, 0.07248561, -1.900201, 1, 0, 0, 1, 1,
-1.941728, -0.9650668, -1.546567, 1, 0, 0, 1, 1,
-1.933085, -1.312241, -3.475333, 0, 0, 0, 1, 1,
-1.926669, 0.5841216, -2.466265, 0, 0, 0, 1, 1,
-1.878457, 2.049971, -1.254848, 0, 0, 0, 1, 1,
-1.837886, 0.6856118, -0.8558593, 0, 0, 0, 1, 1,
-1.831369, -0.6829158, -1.422268, 0, 0, 0, 1, 1,
-1.822972, -1.984806, -3.011837, 0, 0, 0, 1, 1,
-1.810429, -0.1860358, -0.8817847, 0, 0, 0, 1, 1,
-1.780209, -0.1679537, -1.96404, 1, 1, 1, 1, 1,
-1.772659, 0.6320136, -0.7292883, 1, 1, 1, 1, 1,
-1.765745, 0.2758435, -0.5370422, 1, 1, 1, 1, 1,
-1.761171, 0.4288532, -1.836483, 1, 1, 1, 1, 1,
-1.757176, 0.03081379, -1.619013, 1, 1, 1, 1, 1,
-1.750997, 1.553126, -1.063262, 1, 1, 1, 1, 1,
-1.746208, 3.056029, -0.3664573, 1, 1, 1, 1, 1,
-1.734951, -1.493515, -3.231295, 1, 1, 1, 1, 1,
-1.728923, -1.45014, -2.046601, 1, 1, 1, 1, 1,
-1.719633, -1.682804, -2.570258, 1, 1, 1, 1, 1,
-1.704628, 0.0959891, -0.8045827, 1, 1, 1, 1, 1,
-1.700503, -0.5235039, -2.919294, 1, 1, 1, 1, 1,
-1.68743, -0.3302127, -0.8490305, 1, 1, 1, 1, 1,
-1.68406, 1.110831, -0.9070601, 1, 1, 1, 1, 1,
-1.682368, -0.112288, -1.0965, 1, 1, 1, 1, 1,
-1.676373, -1.703325, -2.900716, 0, 0, 1, 1, 1,
-1.666695, -1.03183, -3.742073, 1, 0, 0, 1, 1,
-1.657682, -0.9684753, -2.007193, 1, 0, 0, 1, 1,
-1.656382, 1.326375, -0.0662781, 1, 0, 0, 1, 1,
-1.643039, 1.488228, -0.68783, 1, 0, 0, 1, 1,
-1.638085, 0.1005699, -0.8453546, 1, 0, 0, 1, 1,
-1.617171, -0.3353234, -2.608181, 0, 0, 0, 1, 1,
-1.612073, 0.3373315, -1.784958, 0, 0, 0, 1, 1,
-1.599642, -0.5701194, -0.7390736, 0, 0, 0, 1, 1,
-1.563836, -0.7402014, -0.6139822, 0, 0, 0, 1, 1,
-1.546118, -0.2547662, -1.57991, 0, 0, 0, 1, 1,
-1.532996, -0.2026543, -2.742034, 0, 0, 0, 1, 1,
-1.529767, -0.2893106, -1.211845, 0, 0, 0, 1, 1,
-1.512094, 0.6574613, -1.678945, 1, 1, 1, 1, 1,
-1.511575, 0.3426102, -0.8844896, 1, 1, 1, 1, 1,
-1.509906, 0.1849672, -1.419434, 1, 1, 1, 1, 1,
-1.504343, -0.7111902, -1.444053, 1, 1, 1, 1, 1,
-1.502041, -0.1373664, -2.993501, 1, 1, 1, 1, 1,
-1.493149, 0.7514756, -0.9684414, 1, 1, 1, 1, 1,
-1.478816, 0.8256834, -0.2493263, 1, 1, 1, 1, 1,
-1.477497, 1.878436, 1.073429, 1, 1, 1, 1, 1,
-1.471727, -1.303861, -2.064147, 1, 1, 1, 1, 1,
-1.466203, 0.41736, -1.591058, 1, 1, 1, 1, 1,
-1.449511, 0.9578592, -1.903699, 1, 1, 1, 1, 1,
-1.445084, -0.8818284, -2.877311, 1, 1, 1, 1, 1,
-1.442477, -0.4617098, -0.7701942, 1, 1, 1, 1, 1,
-1.426075, -1.137626, -2.267273, 1, 1, 1, 1, 1,
-1.41677, 1.654553, -0.2140275, 1, 1, 1, 1, 1,
-1.410022, 0.5731545, -2.010214, 0, 0, 1, 1, 1,
-1.408251, -1.960893, -3.796659, 1, 0, 0, 1, 1,
-1.401521, -0.1900836, -2.623828, 1, 0, 0, 1, 1,
-1.380855, -0.9315001, -1.450562, 1, 0, 0, 1, 1,
-1.369576, -1.15915, -2.081237, 1, 0, 0, 1, 1,
-1.341905, 0.1178817, -1.659795, 1, 0, 0, 1, 1,
-1.335982, -0.4611221, -3.347004, 0, 0, 0, 1, 1,
-1.334317, -0.9404016, -2.685179, 0, 0, 0, 1, 1,
-1.3306, 1.553558, -0.5179456, 0, 0, 0, 1, 1,
-1.328419, 0.313051, -2.279648, 0, 0, 0, 1, 1,
-1.318913, -0.4495933, -0.6048557, 0, 0, 0, 1, 1,
-1.312235, 0.9763324, -0.8096418, 0, 0, 0, 1, 1,
-1.305856, 0.2295381, -0.2433447, 0, 0, 0, 1, 1,
-1.302145, -0.8548222, -1.767504, 1, 1, 1, 1, 1,
-1.302075, -1.032752, -1.85974, 1, 1, 1, 1, 1,
-1.294594, -0.350753, -3.25661, 1, 1, 1, 1, 1,
-1.292119, 1.067782, -1.350183, 1, 1, 1, 1, 1,
-1.289177, -0.5121115, -2.148633, 1, 1, 1, 1, 1,
-1.288705, -0.7764418, -2.003916, 1, 1, 1, 1, 1,
-1.284832, 0.5090421, -0.8378952, 1, 1, 1, 1, 1,
-1.273478, 0.6837741, -2.630668, 1, 1, 1, 1, 1,
-1.271004, 0.5575848, -0.725507, 1, 1, 1, 1, 1,
-1.269633, -1.901118, -4.014473, 1, 1, 1, 1, 1,
-1.261701, 0.3283984, 0.003136488, 1, 1, 1, 1, 1,
-1.260535, 0.7475951, -1.1793, 1, 1, 1, 1, 1,
-1.253009, -0.2701632, -1.985691, 1, 1, 1, 1, 1,
-1.247031, 0.7318384, 0.4105004, 1, 1, 1, 1, 1,
-1.246719, -0.8560888, -2.617019, 1, 1, 1, 1, 1,
-1.245927, -0.2188402, -2.452532, 0, 0, 1, 1, 1,
-1.237024, -0.9063347, 0.2068807, 1, 0, 0, 1, 1,
-1.234643, -0.5236394, -0.7787292, 1, 0, 0, 1, 1,
-1.233125, -0.06840257, -0.9024997, 1, 0, 0, 1, 1,
-1.23092, -0.1781297, 0.4801762, 1, 0, 0, 1, 1,
-1.224535, -1.078957, -4.217285, 1, 0, 0, 1, 1,
-1.217708, 2.43646, 0.613327, 0, 0, 0, 1, 1,
-1.216653, 0.4202757, -0.837014, 0, 0, 0, 1, 1,
-1.211513, -0.472247, -1.045909, 0, 0, 0, 1, 1,
-1.210339, 1.371456, 0.7607458, 0, 0, 0, 1, 1,
-1.210298, 1.134493, 0.2785028, 0, 0, 0, 1, 1,
-1.209697, -1.058076, -2.913666, 0, 0, 0, 1, 1,
-1.200879, -0.0827453, -2.706384, 0, 0, 0, 1, 1,
-1.197388, 0.5020781, -1.549677, 1, 1, 1, 1, 1,
-1.193419, -0.6273742, -0.9494067, 1, 1, 1, 1, 1,
-1.185186, -1.151473, -2.680638, 1, 1, 1, 1, 1,
-1.183564, -2.218967, -1.598208, 1, 1, 1, 1, 1,
-1.172971, -0.3410487, -0.5981402, 1, 1, 1, 1, 1,
-1.171038, -0.7000948, -3.082182, 1, 1, 1, 1, 1,
-1.167465, 0.2435554, -0.7751159, 1, 1, 1, 1, 1,
-1.16678, 0.9666714, 0.7848039, 1, 1, 1, 1, 1,
-1.166747, 0.2545496, -1.558949, 1, 1, 1, 1, 1,
-1.156026, 1.796789, -1.06497, 1, 1, 1, 1, 1,
-1.153068, 0.3313688, -2.334213, 1, 1, 1, 1, 1,
-1.144384, -0.7824838, -1.919725, 1, 1, 1, 1, 1,
-1.143449, 1.446721, -1.377619, 1, 1, 1, 1, 1,
-1.141603, -1.351417, -2.234296, 1, 1, 1, 1, 1,
-1.137651, -0.7353395, -1.61643, 1, 1, 1, 1, 1,
-1.135948, 0.04272637, -1.036278, 0, 0, 1, 1, 1,
-1.134594, -0.2246119, -2.303634, 1, 0, 0, 1, 1,
-1.127923, 1.358477, -0.2309317, 1, 0, 0, 1, 1,
-1.113512, 0.6423211, -2.528452, 1, 0, 0, 1, 1,
-1.112707, 0.3136542, -1.407689, 1, 0, 0, 1, 1,
-1.109975, -1.695878, -3.644537, 1, 0, 0, 1, 1,
-1.095636, 1.664481, -1.680048, 0, 0, 0, 1, 1,
-1.095169, 1.120342, 0.01581111, 0, 0, 0, 1, 1,
-1.087767, 0.8319252, -1.206802, 0, 0, 0, 1, 1,
-1.071039, 0.5089014, -2.35836, 0, 0, 0, 1, 1,
-1.070087, 1.664161, -0.5578009, 0, 0, 0, 1, 1,
-1.062671, 1.189276, -0.6465635, 0, 0, 0, 1, 1,
-1.059179, 0.09866828, -1.228743, 0, 0, 0, 1, 1,
-1.055032, 0.4059078, -1.572258, 1, 1, 1, 1, 1,
-1.054712, -0.03388641, -1.977201, 1, 1, 1, 1, 1,
-1.053916, -2.204755, -0.9412954, 1, 1, 1, 1, 1,
-1.041337, -0.5867855, -2.185023, 1, 1, 1, 1, 1,
-1.037499, 0.05838719, -0.3810838, 1, 1, 1, 1, 1,
-1.035248, -0.06933254, -2.009758, 1, 1, 1, 1, 1,
-1.033486, 0.7907938, -0.3484973, 1, 1, 1, 1, 1,
-1.032551, -1.691836, -3.589792, 1, 1, 1, 1, 1,
-1.031278, -1.50256, -1.854648, 1, 1, 1, 1, 1,
-1.020697, 0.06248697, -1.131831, 1, 1, 1, 1, 1,
-1.008994, 1.220851, 0.06574804, 1, 1, 1, 1, 1,
-1.001789, 0.5449625, -0.4751154, 1, 1, 1, 1, 1,
-1.000567, 0.3581563, -1.094164, 1, 1, 1, 1, 1,
-0.9912273, 0.9516877, 0.1193835, 1, 1, 1, 1, 1,
-0.9911471, -0.2576969, -2.213769, 1, 1, 1, 1, 1,
-0.9885686, 0.1424104, -1.347868, 0, 0, 1, 1, 1,
-0.9840891, 1.179752, 1.273012, 1, 0, 0, 1, 1,
-0.9791098, -0.7106311, -2.977333, 1, 0, 0, 1, 1,
-0.9785334, 1.49825, 1.748883, 1, 0, 0, 1, 1,
-0.9755189, -0.1598144, -1.361532, 1, 0, 0, 1, 1,
-0.9681305, -1.363155, -1.578094, 1, 0, 0, 1, 1,
-0.9678311, 0.08572183, -0.5007557, 0, 0, 0, 1, 1,
-0.9603875, -1.125867, -4.22508, 0, 0, 0, 1, 1,
-0.9581808, -0.2769169, -2.199837, 0, 0, 0, 1, 1,
-0.9531716, -0.3733394, -4.026095, 0, 0, 0, 1, 1,
-0.9439219, 0.8957219, 0.4533434, 0, 0, 0, 1, 1,
-0.9417742, -0.8625445, -0.8071073, 0, 0, 0, 1, 1,
-0.9334312, -0.06649154, -0.01612652, 0, 0, 0, 1, 1,
-0.9064818, -2.860654, -2.274781, 1, 1, 1, 1, 1,
-0.8912904, -1.744273, -1.374017, 1, 1, 1, 1, 1,
-0.8910943, -1.308493, -1.327832, 1, 1, 1, 1, 1,
-0.8816925, 1.962777, -0.3475837, 1, 1, 1, 1, 1,
-0.8785167, -1.73035, -2.010088, 1, 1, 1, 1, 1,
-0.8744266, -0.3480797, -2.826108, 1, 1, 1, 1, 1,
-0.8668273, 2.65808, 0.9033545, 1, 1, 1, 1, 1,
-0.8666236, 0.1487118, -0.8102446, 1, 1, 1, 1, 1,
-0.8634145, 2.291608, -2.708323, 1, 1, 1, 1, 1,
-0.8608916, -0.85563, -2.704766, 1, 1, 1, 1, 1,
-0.8604896, 1.354768, 0.1626291, 1, 1, 1, 1, 1,
-0.8504109, 1.667167, -1.637004, 1, 1, 1, 1, 1,
-0.8493202, -0.9471154, -2.94336, 1, 1, 1, 1, 1,
-0.8445138, 1.018385, -0.7255014, 1, 1, 1, 1, 1,
-0.8438689, 1.117245, -1.84219, 1, 1, 1, 1, 1,
-0.8410617, 0.7993344, -0.06044663, 0, 0, 1, 1, 1,
-0.826349, 0.6846361, -1.277583, 1, 0, 0, 1, 1,
-0.8203253, 0.5237842, 0.5233181, 1, 0, 0, 1, 1,
-0.8198194, -1.185358, -2.22485, 1, 0, 0, 1, 1,
-0.8173863, -0.7911535, -1.370252, 1, 0, 0, 1, 1,
-0.8173229, -0.5860217, -1.961163, 1, 0, 0, 1, 1,
-0.8170943, 1.553668, -0.1574984, 0, 0, 0, 1, 1,
-0.8169684, 1.028158, -1.846308, 0, 0, 0, 1, 1,
-0.8169514, 0.4213707, -2.024567, 0, 0, 0, 1, 1,
-0.8168812, 1.049803, -0.8877051, 0, 0, 0, 1, 1,
-0.8162231, -1.891252, -2.561157, 0, 0, 0, 1, 1,
-0.8151613, 1.914009, -0.1023515, 0, 0, 0, 1, 1,
-0.8138149, 1.394586, 1.73696, 0, 0, 0, 1, 1,
-0.8055276, -0.3517504, -2.586458, 1, 1, 1, 1, 1,
-0.7996766, 0.6422562, -0.6669937, 1, 1, 1, 1, 1,
-0.7933814, -0.4628953, -3.087876, 1, 1, 1, 1, 1,
-0.788755, 0.7564541, -0.9388285, 1, 1, 1, 1, 1,
-0.7857025, -0.1890375, -1.230759, 1, 1, 1, 1, 1,
-0.78115, -0.1543233, -0.3337052, 1, 1, 1, 1, 1,
-0.7775633, 0.3642943, -0.9513273, 1, 1, 1, 1, 1,
-0.7753668, 1.41341, -1.505537, 1, 1, 1, 1, 1,
-0.7751958, -1.024464, -3.394522, 1, 1, 1, 1, 1,
-0.7726703, -2.312212, -2.164993, 1, 1, 1, 1, 1,
-0.7681429, -2.792433, -4.017509, 1, 1, 1, 1, 1,
-0.7638499, -1.237191, -2.876684, 1, 1, 1, 1, 1,
-0.7637835, 0.4702362, -1.653096, 1, 1, 1, 1, 1,
-0.762656, 0.0387289, -2.91837, 1, 1, 1, 1, 1,
-0.7625854, -0.2800557, -0.8816475, 1, 1, 1, 1, 1,
-0.7596381, 1.23964, -0.9290195, 0, 0, 1, 1, 1,
-0.7567097, 0.1761008, 0.1232028, 1, 0, 0, 1, 1,
-0.7559481, 0.270998, -2.205808, 1, 0, 0, 1, 1,
-0.7550843, 0.7317542, 1.541004, 1, 0, 0, 1, 1,
-0.7538053, -1.199843, -3.500385, 1, 0, 0, 1, 1,
-0.7498552, 0.2326943, -1.520717, 1, 0, 0, 1, 1,
-0.7480886, -0.6847865, -3.596365, 0, 0, 0, 1, 1,
-0.7474266, 0.3923053, -1.899705, 0, 0, 0, 1, 1,
-0.745593, 0.4508484, -0.5021324, 0, 0, 0, 1, 1,
-0.7423711, 0.5100384, -0.6874067, 0, 0, 0, 1, 1,
-0.7423506, 0.3997741, -0.4216982, 0, 0, 0, 1, 1,
-0.7397606, 0.1684914, -1.387605, 0, 0, 0, 1, 1,
-0.7376435, -0.6152574, -2.323085, 0, 0, 0, 1, 1,
-0.7337418, 0.02552005, -0.1813448, 1, 1, 1, 1, 1,
-0.73, -1.817802, -2.52493, 1, 1, 1, 1, 1,
-0.7297815, 0.1412522, -3.125995, 1, 1, 1, 1, 1,
-0.729667, 0.07966828, -1.653823, 1, 1, 1, 1, 1,
-0.7249402, 0.5401989, 1.103182, 1, 1, 1, 1, 1,
-0.7208993, -1.060899, -2.418374, 1, 1, 1, 1, 1,
-0.7090194, -0.05088681, 0.2470841, 1, 1, 1, 1, 1,
-0.7020642, 0.4961263, -1.696351, 1, 1, 1, 1, 1,
-0.6975801, -0.3429241, -3.427218, 1, 1, 1, 1, 1,
-0.6946866, 0.5109484, -0.9506763, 1, 1, 1, 1, 1,
-0.6941159, 0.4846199, -2.03863, 1, 1, 1, 1, 1,
-0.6936415, 0.6942805, -1.773009, 1, 1, 1, 1, 1,
-0.6931117, 1.944429, 1.426238, 1, 1, 1, 1, 1,
-0.6930659, 2.318079, 0.3600138, 1, 1, 1, 1, 1,
-0.6910317, 0.2615958, 0.3702143, 1, 1, 1, 1, 1,
-0.6823378, -0.5251188, -2.801743, 0, 0, 1, 1, 1,
-0.6821691, 1.071337, -0.6336687, 1, 0, 0, 1, 1,
-0.6742572, -1.239579, -1.765177, 1, 0, 0, 1, 1,
-0.6645598, -0.1637912, -1.628862, 1, 0, 0, 1, 1,
-0.6583139, 0.2243278, -0.005656007, 1, 0, 0, 1, 1,
-0.6566651, 0.1495577, -1.800983, 1, 0, 0, 1, 1,
-0.6515105, 2.302065, 0.4150919, 0, 0, 0, 1, 1,
-0.6505076, -0.6657673, -0.497499, 0, 0, 0, 1, 1,
-0.6498565, -0.4744088, -0.6777818, 0, 0, 0, 1, 1,
-0.6485991, -1.262208, -2.515126, 0, 0, 0, 1, 1,
-0.6405818, 0.5521461, 0.2314082, 0, 0, 0, 1, 1,
-0.6405056, -0.4103551, -3.117298, 0, 0, 0, 1, 1,
-0.6381024, -0.9533984, -2.304799, 0, 0, 0, 1, 1,
-0.6319361, -0.2862109, -1.803794, 1, 1, 1, 1, 1,
-0.6270906, 1.328987, -2.884771, 1, 1, 1, 1, 1,
-0.623518, -0.5760518, -1.889435, 1, 1, 1, 1, 1,
-0.6200454, -0.536174, -3.690799, 1, 1, 1, 1, 1,
-0.6197167, 0.03105841, -0.02368373, 1, 1, 1, 1, 1,
-0.6151947, 1.729471, 1.694669, 1, 1, 1, 1, 1,
-0.6144816, 0.7897351, 0.7435122, 1, 1, 1, 1, 1,
-0.6063917, 0.7936285, -0.5185233, 1, 1, 1, 1, 1,
-0.6019471, -0.2116711, -2.055025, 1, 1, 1, 1, 1,
-0.6009815, -0.2931672, -2.117069, 1, 1, 1, 1, 1,
-0.5957821, -2.239803, -3.183867, 1, 1, 1, 1, 1,
-0.5944323, -0.1507941, -0.7815623, 1, 1, 1, 1, 1,
-0.5852643, -0.3062803, -2.229832, 1, 1, 1, 1, 1,
-0.5804066, -0.8837368, -3.68117, 1, 1, 1, 1, 1,
-0.5801347, 0.2238802, -1.699388, 1, 1, 1, 1, 1,
-0.5779907, 1.790868, -1.595995, 0, 0, 1, 1, 1,
-0.5720931, -0.8895991, -2.849495, 1, 0, 0, 1, 1,
-0.5720781, 0.3307292, 0.3026239, 1, 0, 0, 1, 1,
-0.5708675, 0.7139492, 0.5544534, 1, 0, 0, 1, 1,
-0.5681357, -0.1449335, -1.719055, 1, 0, 0, 1, 1,
-0.5673005, 0.1026745, -1.170762, 1, 0, 0, 1, 1,
-0.5603094, -1.266858, -2.529838, 0, 0, 0, 1, 1,
-0.5595204, -0.3432091, -1.886953, 0, 0, 0, 1, 1,
-0.5587952, -1.616931, -0.8604985, 0, 0, 0, 1, 1,
-0.5586022, 2.197607, -0.3920566, 0, 0, 0, 1, 1,
-0.5580673, -0.3155959, -3.4032, 0, 0, 0, 1, 1,
-0.5537658, -0.3899983, -1.681486, 0, 0, 0, 1, 1,
-0.5530011, -1.338481, -3.652288, 0, 0, 0, 1, 1,
-0.5480294, -0.08347962, -1.62307, 1, 1, 1, 1, 1,
-0.5459315, 0.7418818, -0.9270067, 1, 1, 1, 1, 1,
-0.5457349, -2.314847, -3.460574, 1, 1, 1, 1, 1,
-0.5443513, 2.342886, 0.3440049, 1, 1, 1, 1, 1,
-0.5412842, 0.1218701, -1.516867, 1, 1, 1, 1, 1,
-0.5388574, 0.1071777, -0.5230963, 1, 1, 1, 1, 1,
-0.5377793, -0.3144687, -1.517485, 1, 1, 1, 1, 1,
-0.5366949, -2.71658, -2.209174, 1, 1, 1, 1, 1,
-0.536137, -0.6608066, -0.3494434, 1, 1, 1, 1, 1,
-0.5347577, 0.2120143, -2.561146, 1, 1, 1, 1, 1,
-0.5344648, 0.5312049, -0.9859411, 1, 1, 1, 1, 1,
-0.5336481, -1.109263, -1.298429, 1, 1, 1, 1, 1,
-0.5290728, -0.6805813, -0.8510603, 1, 1, 1, 1, 1,
-0.5289192, 0.7582892, -1.63908, 1, 1, 1, 1, 1,
-0.5281025, -1.281262, -1.933245, 1, 1, 1, 1, 1,
-0.5219501, -0.5020029, -3.748548, 0, 0, 1, 1, 1,
-0.5214294, -0.1305579, -4.108264, 1, 0, 0, 1, 1,
-0.5192822, -1.419477, -3.454635, 1, 0, 0, 1, 1,
-0.5136171, 0.3575724, -1.934585, 1, 0, 0, 1, 1,
-0.5112671, -0.3989271, -1.164709, 1, 0, 0, 1, 1,
-0.5085035, -0.09462056, -0.8046954, 1, 0, 0, 1, 1,
-0.5075485, -0.4170108, -3.901071, 0, 0, 0, 1, 1,
-0.5029051, -0.5062993, -1.577487, 0, 0, 0, 1, 1,
-0.5018342, -1.19044, -2.417575, 0, 0, 0, 1, 1,
-0.5018055, -0.9086536, -0.9233767, 0, 0, 0, 1, 1,
-0.5016994, 0.5929602, -1.6905, 0, 0, 0, 1, 1,
-0.4974615, 0.4627049, -0.6349328, 0, 0, 0, 1, 1,
-0.4904205, 0.1615503, -1.053458, 0, 0, 0, 1, 1,
-0.483332, 0.5888854, -0.9954757, 1, 1, 1, 1, 1,
-0.480528, 0.2177131, -1.177853, 1, 1, 1, 1, 1,
-0.4805113, -0.9921944, -1.707963, 1, 1, 1, 1, 1,
-0.4781642, 0.8417416, -1.549185, 1, 1, 1, 1, 1,
-0.4761672, 2.512072, 0.5935133, 1, 1, 1, 1, 1,
-0.4733215, -1.161164, -2.078529, 1, 1, 1, 1, 1,
-0.4693711, 0.2247045, -2.630879, 1, 1, 1, 1, 1,
-0.467106, -0.262055, -2.470254, 1, 1, 1, 1, 1,
-0.4607294, -1.012288, -1.5965, 1, 1, 1, 1, 1,
-0.4591327, -0.3210998, -3.068469, 1, 1, 1, 1, 1,
-0.4589259, 1.364028, 1.653169, 1, 1, 1, 1, 1,
-0.4575711, 0.7027972, 1.109092, 1, 1, 1, 1, 1,
-0.457339, -0.3511692, -1.349254, 1, 1, 1, 1, 1,
-0.4558898, 1.878673, -0.313171, 1, 1, 1, 1, 1,
-0.4507806, -0.5657732, -0.9793398, 1, 1, 1, 1, 1,
-0.4483263, -0.8542693, -2.658878, 0, 0, 1, 1, 1,
-0.444359, -0.2271834, -1.848684, 1, 0, 0, 1, 1,
-0.4430961, 1.497095, 0.4729977, 1, 0, 0, 1, 1,
-0.4353821, 0.8566155, -0.9807909, 1, 0, 0, 1, 1,
-0.4338067, 0.2572704, -1.28816, 1, 0, 0, 1, 1,
-0.4259503, 0.04429655, -0.864703, 1, 0, 0, 1, 1,
-0.4251027, 0.3502629, 0.4257002, 0, 0, 0, 1, 1,
-0.4204615, -0.06604919, -0.6631453, 0, 0, 0, 1, 1,
-0.4175644, -0.3416867, -1.57565, 0, 0, 0, 1, 1,
-0.4168468, -1.683049, -2.141597, 0, 0, 0, 1, 1,
-0.4066401, 0.0959876, -2.165102, 0, 0, 0, 1, 1,
-0.4062232, 1.686701, -0.8855971, 0, 0, 0, 1, 1,
-0.3994119, 1.063092, -1.264961, 0, 0, 0, 1, 1,
-0.3988701, 0.2220184, -0.9792358, 1, 1, 1, 1, 1,
-0.3972597, 1.472133, 2.296337, 1, 1, 1, 1, 1,
-0.3968927, -0.2388708, -3.466827, 1, 1, 1, 1, 1,
-0.3909878, 1.717589, 0.4176379, 1, 1, 1, 1, 1,
-0.3908224, -0.9008652, -1.956674, 1, 1, 1, 1, 1,
-0.3835977, 0.6705951, 0.5059412, 1, 1, 1, 1, 1,
-0.3792615, -0.1684137, -0.6957117, 1, 1, 1, 1, 1,
-0.3733616, 0.3283379, -2.22882, 1, 1, 1, 1, 1,
-0.3699394, 1.207654, -1.386397, 1, 1, 1, 1, 1,
-0.3571671, 1.71178, -0.01053951, 1, 1, 1, 1, 1,
-0.3501481, -0.6106484, -3.582273, 1, 1, 1, 1, 1,
-0.3467261, -2.145969, -2.672051, 1, 1, 1, 1, 1,
-0.3452833, -0.9293348, -4.644042, 1, 1, 1, 1, 1,
-0.3423404, 0.9554112, -0.3042323, 1, 1, 1, 1, 1,
-0.3419188, -1.449654, -1.530764, 1, 1, 1, 1, 1,
-0.3397801, -0.8252794, -3.328973, 0, 0, 1, 1, 1,
-0.334917, -0.6425407, -2.969133, 1, 0, 0, 1, 1,
-0.3288962, -0.9338291, -3.427314, 1, 0, 0, 1, 1,
-0.3222952, 0.7493898, -2.559759, 1, 0, 0, 1, 1,
-0.3222457, -0.4556788, -2.088415, 1, 0, 0, 1, 1,
-0.3206728, -2.564128, -3.430864, 1, 0, 0, 1, 1,
-0.3190848, -0.01992723, -0.9415458, 0, 0, 0, 1, 1,
-0.3183841, 0.3387958, -0.8857935, 0, 0, 0, 1, 1,
-0.3165889, -0.6990255, -0.7281934, 0, 0, 0, 1, 1,
-0.3162467, 1.360054, 0.2267508, 0, 0, 0, 1, 1,
-0.3141467, -0.1622149, 0.6326295, 0, 0, 0, 1, 1,
-0.3136999, 0.657343, -2.245109, 0, 0, 0, 1, 1,
-0.311311, -2.015966, -2.574131, 0, 0, 0, 1, 1,
-0.3110223, -0.6497091, -3.201089, 1, 1, 1, 1, 1,
-0.3086841, 1.338824, -0.0380287, 1, 1, 1, 1, 1,
-0.3082831, 0.1825613, -1.448241, 1, 1, 1, 1, 1,
-0.3058738, -0.3924772, -3.383514, 1, 1, 1, 1, 1,
-0.3029038, -0.1019831, -1.941001, 1, 1, 1, 1, 1,
-0.3028447, 0.7842605, 0.03651905, 1, 1, 1, 1, 1,
-0.2996169, 1.334794, -1.214161, 1, 1, 1, 1, 1,
-0.2976215, 0.3908897, 0.4108775, 1, 1, 1, 1, 1,
-0.2969507, -1.340739, -3.541601, 1, 1, 1, 1, 1,
-0.2944225, 0.9837737, -1.038755, 1, 1, 1, 1, 1,
-0.2918159, -0.7764344, -2.787834, 1, 1, 1, 1, 1,
-0.2897073, 0.1895514, -1.299002, 1, 1, 1, 1, 1,
-0.2895594, -1.24114, -3.584015, 1, 1, 1, 1, 1,
-0.2870744, -0.9972038, -3.36287, 1, 1, 1, 1, 1,
-0.2867332, 2.189816, -1.142108, 1, 1, 1, 1, 1,
-0.2846622, 0.4990222, -0.1465881, 0, 0, 1, 1, 1,
-0.2828967, 0.7861677, -1.171674, 1, 0, 0, 1, 1,
-0.2826042, -0.9359241, -2.328012, 1, 0, 0, 1, 1,
-0.2775408, -1.97201, -2.335322, 1, 0, 0, 1, 1,
-0.2749128, 0.9675855, 0.2586786, 1, 0, 0, 1, 1,
-0.2746899, -0.5470591, -2.824051, 1, 0, 0, 1, 1,
-0.2745218, -1.175679, -2.80214, 0, 0, 0, 1, 1,
-0.2727491, -0.5652624, -1.864471, 0, 0, 0, 1, 1,
-0.272452, 1.95624, 0.8394598, 0, 0, 0, 1, 1,
-0.2721292, -0.8598446, -2.480231, 0, 0, 0, 1, 1,
-0.2720387, -0.1947365, -3.827107, 0, 0, 0, 1, 1,
-0.2616279, -0.3008946, -3.492635, 0, 0, 0, 1, 1,
-0.2598749, -0.5886348, -2.682053, 0, 0, 0, 1, 1,
-0.2544753, -2.054533, -2.768226, 1, 1, 1, 1, 1,
-0.252052, 0.7570955, 0.5998781, 1, 1, 1, 1, 1,
-0.2508863, 1.932812, -1.960347, 1, 1, 1, 1, 1,
-0.2504732, -0.7563262, -2.121359, 1, 1, 1, 1, 1,
-0.249977, 1.716303, 0.3485532, 1, 1, 1, 1, 1,
-0.2467112, -0.3855618, -2.47878, 1, 1, 1, 1, 1,
-0.2438001, -1.223381, -0.9933105, 1, 1, 1, 1, 1,
-0.2429413, -1.143814, -3.408317, 1, 1, 1, 1, 1,
-0.242506, 1.563686, 0.2079791, 1, 1, 1, 1, 1,
-0.2375578, -0.7622615, -2.194462, 1, 1, 1, 1, 1,
-0.2306204, 0.1050583, 0.6941373, 1, 1, 1, 1, 1,
-0.2299984, 0.1387172, -1.292868, 1, 1, 1, 1, 1,
-0.2290431, 0.2444834, -0.4883684, 1, 1, 1, 1, 1,
-0.2255872, 0.2034466, -1.913598, 1, 1, 1, 1, 1,
-0.2254531, -0.6137395, -3.281666, 1, 1, 1, 1, 1,
-0.2226518, -0.8613839, -3.103383, 0, 0, 1, 1, 1,
-0.2219343, 2.452049, -0.5818876, 1, 0, 0, 1, 1,
-0.2188215, -0.6402742, -4.674044, 1, 0, 0, 1, 1,
-0.2168021, 0.5070541, -0.01215116, 1, 0, 0, 1, 1,
-0.2162987, -0.1257315, -2.074887, 1, 0, 0, 1, 1,
-0.2148758, 0.8612208, -1.086317, 1, 0, 0, 1, 1,
-0.2142904, 1.276768, -0.7113065, 0, 0, 0, 1, 1,
-0.2105046, 0.1969186, -0.1962192, 0, 0, 0, 1, 1,
-0.2056185, 0.1936163, -0.3403692, 0, 0, 0, 1, 1,
-0.1999735, -1.123738, -3.078735, 0, 0, 0, 1, 1,
-0.1998651, -0.05349148, -2.096396, 0, 0, 0, 1, 1,
-0.1970011, 0.09869073, -1.383388, 0, 0, 0, 1, 1,
-0.1955541, -0.2901567, -2.867697, 0, 0, 0, 1, 1,
-0.1924037, 0.4538255, -0.9164956, 1, 1, 1, 1, 1,
-0.1858534, 0.8146269, 0.1977997, 1, 1, 1, 1, 1,
-0.1797522, 0.5408612, 0.2227582, 1, 1, 1, 1, 1,
-0.1788388, 0.273177, 0.8383604, 1, 1, 1, 1, 1,
-0.1780731, -1.492767, -4.360148, 1, 1, 1, 1, 1,
-0.1759243, 1.048145, -0.6070862, 1, 1, 1, 1, 1,
-0.1712143, 0.4570482, -1.191661, 1, 1, 1, 1, 1,
-0.1693921, 0.2037444, 0.07081521, 1, 1, 1, 1, 1,
-0.1653949, -0.2840986, -3.1721, 1, 1, 1, 1, 1,
-0.1608367, -0.1097687, -2.876164, 1, 1, 1, 1, 1,
-0.1582527, 1.784511, 0.1068946, 1, 1, 1, 1, 1,
-0.1541936, -0.7364328, -4.010673, 1, 1, 1, 1, 1,
-0.1535714, -1.090954, -1.550829, 1, 1, 1, 1, 1,
-0.1529134, -1.133831, -1.497663, 1, 1, 1, 1, 1,
-0.1521955, 0.4601555, -1.180371, 1, 1, 1, 1, 1,
-0.1521481, 1.654515, 0.978695, 0, 0, 1, 1, 1,
-0.1516158, -2.050278, -3.779453, 1, 0, 0, 1, 1,
-0.1482907, -0.1691128, -2.880715, 1, 0, 0, 1, 1,
-0.1444403, 0.6678917, 2.153313, 1, 0, 0, 1, 1,
-0.1417442, -1.120998, -3.65286, 1, 0, 0, 1, 1,
-0.1396718, -0.419635, -2.251818, 1, 0, 0, 1, 1,
-0.1371943, -0.05265339, -1.424219, 0, 0, 0, 1, 1,
-0.1325561, 0.7475562, -2.569988, 0, 0, 0, 1, 1,
-0.1324708, 0.3541431, -0.1941368, 0, 0, 0, 1, 1,
-0.1301228, 0.3495935, -1.028124, 0, 0, 0, 1, 1,
-0.1300127, 0.9681633, 0.7069205, 0, 0, 0, 1, 1,
-0.127388, -0.7729507, -3.288785, 0, 0, 0, 1, 1,
-0.1204584, 0.8247863, -1.106084, 0, 0, 0, 1, 1,
-0.1186901, -0.9808293, -4.182651, 1, 1, 1, 1, 1,
-0.1182563, -0.07880667, -1.380623, 1, 1, 1, 1, 1,
-0.1115534, -0.914291, -3.762712, 1, 1, 1, 1, 1,
-0.1096472, 0.1723922, -0.7437472, 1, 1, 1, 1, 1,
-0.1071586, 0.9891718, 0.9796812, 1, 1, 1, 1, 1,
-0.1071386, -0.3074334, -1.41531, 1, 1, 1, 1, 1,
-0.1047423, -2.532804, -5.543899, 1, 1, 1, 1, 1,
-0.08429303, 0.0602814, -1.633862, 1, 1, 1, 1, 1,
-0.07871009, -0.5053716, -3.804561, 1, 1, 1, 1, 1,
-0.07398777, -0.02016955, -0.6346704, 1, 1, 1, 1, 1,
-0.07270309, 0.5144374, 0.02851259, 1, 1, 1, 1, 1,
-0.06941789, 0.1171468, -0.6245911, 1, 1, 1, 1, 1,
-0.06711213, -2.302948, -4.926004, 1, 1, 1, 1, 1,
-0.06025276, -0.1439536, -1.028834, 1, 1, 1, 1, 1,
-0.05974516, -0.229318, -3.036371, 1, 1, 1, 1, 1,
-0.05964654, -0.9547458, -2.069147, 0, 0, 1, 1, 1,
-0.0591475, -1.009894, -2.620448, 1, 0, 0, 1, 1,
-0.05887804, 0.9922474, 1.066863, 1, 0, 0, 1, 1,
-0.05504227, -0.337488, -3.23849, 1, 0, 0, 1, 1,
-0.05344734, -1.0999, -2.449642, 1, 0, 0, 1, 1,
-0.05311804, 0.6651254, -0.1707837, 1, 0, 0, 1, 1,
-0.04072363, -0.1414764, -3.087936, 0, 0, 0, 1, 1,
-0.03853561, -0.9483927, -2.715874, 0, 0, 0, 1, 1,
-0.03743331, 0.4646554, -1.148926, 0, 0, 0, 1, 1,
-0.03647029, -1.018349, -3.751028, 0, 0, 0, 1, 1,
-0.0344383, 0.8790473, -1.020636, 0, 0, 0, 1, 1,
-0.02867217, 1.313759, 0.3505909, 0, 0, 0, 1, 1,
-0.02754029, 0.4216201, -1.055334, 0, 0, 0, 1, 1,
-0.02654188, -1.342919, -4.981522, 1, 1, 1, 1, 1,
-0.02599985, 1.211062, 0.4650973, 1, 1, 1, 1, 1,
-0.02579643, 0.4343611, -0.02443386, 1, 1, 1, 1, 1,
-0.02404501, -0.5898329, -3.964595, 1, 1, 1, 1, 1,
-0.02376915, 1.114415, -1.716736, 1, 1, 1, 1, 1,
-0.01978221, -1.108922, -2.361038, 1, 1, 1, 1, 1,
-0.01901071, -0.5302534, -3.46052, 1, 1, 1, 1, 1,
-0.01699961, 0.04526805, 0.8280774, 1, 1, 1, 1, 1,
-0.009826459, 0.3857317, -0.9100212, 1, 1, 1, 1, 1,
-0.007445451, 1.694159, 0.9122621, 1, 1, 1, 1, 1,
-0.005286514, -0.386515, -1.688696, 1, 1, 1, 1, 1,
-0.004412786, -0.6058984, -5.014659, 1, 1, 1, 1, 1,
-0.002598298, -1.573127, -3.481898, 1, 1, 1, 1, 1,
-0.002098211, -0.4271164, -2.758512, 1, 1, 1, 1, 1,
-0.001898909, 1.022234, 0.07588183, 1, 1, 1, 1, 1,
-0.001864601, 0.1547816, -0.591349, 0, 0, 1, 1, 1,
-0.001796625, 0.8710825, -0.5202516, 1, 0, 0, 1, 1,
0.002583832, 0.2344894, -2.373316, 1, 0, 0, 1, 1,
0.003617847, -0.9375905, 1.948494, 1, 0, 0, 1, 1,
0.01096416, -0.7502793, 3.889498, 1, 0, 0, 1, 1,
0.01461038, 2.367145, -0.1418911, 1, 0, 0, 1, 1,
0.02046238, -0.6054169, 4.491047, 0, 0, 0, 1, 1,
0.0280137, 1.295063, -0.2237892, 0, 0, 0, 1, 1,
0.02999043, -0.05592333, 3.18607, 0, 0, 0, 1, 1,
0.03103848, 0.6335614, 1.757836, 0, 0, 0, 1, 1,
0.03582628, -0.9306504, 4.088013, 0, 0, 0, 1, 1,
0.03827123, -0.1604962, 1.930129, 0, 0, 0, 1, 1,
0.038943, 1.511617, -0.5048817, 0, 0, 0, 1, 1,
0.0453145, -0.3434832, 4.999485, 1, 1, 1, 1, 1,
0.04685378, 1.901913, -0.01401848, 1, 1, 1, 1, 1,
0.05226706, -1.701607, 2.718645, 1, 1, 1, 1, 1,
0.05459146, 0.9260126, 0.02719801, 1, 1, 1, 1, 1,
0.05816798, -0.7077851, 2.885629, 1, 1, 1, 1, 1,
0.06337909, -1.780914, 2.511851, 1, 1, 1, 1, 1,
0.06369655, 0.1200253, 0.5230488, 1, 1, 1, 1, 1,
0.07128263, 1.200514, 0.5402489, 1, 1, 1, 1, 1,
0.07222537, 0.5496048, -1.128488, 1, 1, 1, 1, 1,
0.07690866, 0.7963532, 0.513644, 1, 1, 1, 1, 1,
0.07819585, -1.676325, 3.543392, 1, 1, 1, 1, 1,
0.07943782, 0.5556678, -2.139121, 1, 1, 1, 1, 1,
0.08005731, 0.5891241, -1.158293, 1, 1, 1, 1, 1,
0.08153047, -1.785241, 2.350273, 1, 1, 1, 1, 1,
0.08312345, 0.326715, 1.162397, 1, 1, 1, 1, 1,
0.09032545, -0.3626533, 3.696903, 0, 0, 1, 1, 1,
0.09083611, -0.4987443, 2.120744, 1, 0, 0, 1, 1,
0.09153268, 2.252692, -0.3724187, 1, 0, 0, 1, 1,
0.09209417, -0.2712842, 1.778787, 1, 0, 0, 1, 1,
0.09272416, 0.1860919, 1.346658, 1, 0, 0, 1, 1,
0.09335835, 0.8275768, 0.07476842, 1, 0, 0, 1, 1,
0.09451721, 1.322312, -0.5627609, 0, 0, 0, 1, 1,
0.09468321, 2.139301, -0.7952278, 0, 0, 0, 1, 1,
0.09756381, 0.7371691, 2.980824, 0, 0, 0, 1, 1,
0.1012949, -1.383719, 3.550921, 0, 0, 0, 1, 1,
0.1054826, 0.1613844, 1.555441, 0, 0, 0, 1, 1,
0.1074393, -0.584829, 2.512616, 0, 0, 0, 1, 1,
0.1114141, 0.07541255, 1.129863, 0, 0, 0, 1, 1,
0.1180949, -0.5214474, 2.541507, 1, 1, 1, 1, 1,
0.1183645, -1.352164, 3.032373, 1, 1, 1, 1, 1,
0.118968, 0.1812061, -0.4668632, 1, 1, 1, 1, 1,
0.1195629, 0.0745846, 0.4013359, 1, 1, 1, 1, 1,
0.1213759, 0.9311727, 0.5016701, 1, 1, 1, 1, 1,
0.1218332, -0.3146307, 2.352873, 1, 1, 1, 1, 1,
0.1238741, -2.367064, 2.621877, 1, 1, 1, 1, 1,
0.1260599, -2.536406, 4.605692, 1, 1, 1, 1, 1,
0.1280787, -0.9548293, 2.927722, 1, 1, 1, 1, 1,
0.1281397, -0.295923, 2.265368, 1, 1, 1, 1, 1,
0.1300426, 0.2735769, 0.8599079, 1, 1, 1, 1, 1,
0.1330684, 2.969509, -1.630779, 1, 1, 1, 1, 1,
0.137337, 0.2053703, -1.787876, 1, 1, 1, 1, 1,
0.1375292, 0.549671, -0.2102072, 1, 1, 1, 1, 1,
0.1433474, 0.7018473, -0.1750543, 1, 1, 1, 1, 1,
0.1541349, -0.9789214, 2.743562, 0, 0, 1, 1, 1,
0.1595409, 0.336475, 1.379577, 1, 0, 0, 1, 1,
0.1614385, -1.250718, 2.784032, 1, 0, 0, 1, 1,
0.1646143, -1.704574, 2.902565, 1, 0, 0, 1, 1,
0.1699281, -0.7694775, 1.826479, 1, 0, 0, 1, 1,
0.1718545, -0.6638989, 2.825907, 1, 0, 0, 1, 1,
0.1766339, -0.1308434, 1.012377, 0, 0, 0, 1, 1,
0.1774556, -0.3044369, 2.325217, 0, 0, 0, 1, 1,
0.1780623, -1.620984, 2.287313, 0, 0, 0, 1, 1,
0.1796306, -1.239391, 2.636334, 0, 0, 0, 1, 1,
0.1814637, -0.5784715, 2.385028, 0, 0, 0, 1, 1,
0.1823322, 0.9714991, -0.02123601, 0, 0, 0, 1, 1,
0.18304, 0.1841072, 1.893012, 0, 0, 0, 1, 1,
0.1833037, -0.626227, 5.098072, 1, 1, 1, 1, 1,
0.188126, -1.19355, -0.09941239, 1, 1, 1, 1, 1,
0.1900779, -1.071242, 2.715132, 1, 1, 1, 1, 1,
0.1909678, 1.344267, -0.292229, 1, 1, 1, 1, 1,
0.1980091, 0.5035309, 1.213943, 1, 1, 1, 1, 1,
0.2005473, 2.512587, 0.9871287, 1, 1, 1, 1, 1,
0.2025531, 0.2898425, 1.293947, 1, 1, 1, 1, 1,
0.2036674, -0.1777737, 2.392068, 1, 1, 1, 1, 1,
0.2038717, -0.8925133, 4.736192, 1, 1, 1, 1, 1,
0.205538, 1.130547, -1.262632, 1, 1, 1, 1, 1,
0.2092115, -0.496361, 2.357719, 1, 1, 1, 1, 1,
0.2093428, 0.05808268, 0.6323867, 1, 1, 1, 1, 1,
0.2119201, 0.5476353, -0.9035992, 1, 1, 1, 1, 1,
0.2124348, 0.2545072, 0.3524595, 1, 1, 1, 1, 1,
0.2158839, -0.5893325, 2.754376, 1, 1, 1, 1, 1,
0.2193213, -0.4982292, 3.013057, 0, 0, 1, 1, 1,
0.2193927, 0.4823288, 0.9695454, 1, 0, 0, 1, 1,
0.2235536, -0.2206298, 1.585517, 1, 0, 0, 1, 1,
0.2297694, -1.022834, 3.587449, 1, 0, 0, 1, 1,
0.2310826, 0.6136916, 0.3850671, 1, 0, 0, 1, 1,
0.2324412, 0.607926, 0.2662233, 1, 0, 0, 1, 1,
0.2334289, -2.429445, 3.333807, 0, 0, 0, 1, 1,
0.2374856, -0.4291687, 1.937092, 0, 0, 0, 1, 1,
0.238912, -0.9593939, 4.416673, 0, 0, 0, 1, 1,
0.2407771, -0.08752777, -0.1412937, 0, 0, 0, 1, 1,
0.2417027, 2.236862, -0.4202599, 0, 0, 0, 1, 1,
0.2425436, 0.01342996, 2.006137, 0, 0, 0, 1, 1,
0.2459297, -0.2542026, 1.753327, 0, 0, 0, 1, 1,
0.2467657, 1.127127, -0.363715, 1, 1, 1, 1, 1,
0.2481154, 0.1842994, 0.7746018, 1, 1, 1, 1, 1,
0.2484618, 1.002788, 1.016793, 1, 1, 1, 1, 1,
0.2559722, -0.08831095, 1.504137, 1, 1, 1, 1, 1,
0.2564063, -0.2411051, 2.683701, 1, 1, 1, 1, 1,
0.2566852, -0.7148718, 2.892322, 1, 1, 1, 1, 1,
0.2569826, 1.016896, -0.7647749, 1, 1, 1, 1, 1,
0.2604113, -0.6999781, 2.69052, 1, 1, 1, 1, 1,
0.2606329, -0.2281077, 2.272783, 1, 1, 1, 1, 1,
0.2618164, 1.306237, 0.2928283, 1, 1, 1, 1, 1,
0.2658851, -2.26632, 2.304781, 1, 1, 1, 1, 1,
0.2739378, 0.8682393, -1.600001, 1, 1, 1, 1, 1,
0.2747959, 1.378962, 0.4732088, 1, 1, 1, 1, 1,
0.2748234, -0.4961847, 4.255251, 1, 1, 1, 1, 1,
0.2762009, -0.2206029, -0.6631911, 1, 1, 1, 1, 1,
0.2782141, 0.8566704, -0.09943641, 0, 0, 1, 1, 1,
0.2789462, 0.732609, 0.05230379, 1, 0, 0, 1, 1,
0.2795496, -0.8906664, 0.9475278, 1, 0, 0, 1, 1,
0.2828282, -0.6858869, 3.077927, 1, 0, 0, 1, 1,
0.285578, -0.8868786, 3.04812, 1, 0, 0, 1, 1,
0.2867161, 0.3527166, 1.662708, 1, 0, 0, 1, 1,
0.2889304, -0.5709171, 2.075967, 0, 0, 0, 1, 1,
0.291059, 0.2221627, 2.020531, 0, 0, 0, 1, 1,
0.2962281, 0.6009099, -0.1761317, 0, 0, 0, 1, 1,
0.3015255, 1.234189, 1.106265, 0, 0, 0, 1, 1,
0.3017936, 2.229681, -1.823374, 0, 0, 0, 1, 1,
0.302088, -0.8624985, 2.219615, 0, 0, 0, 1, 1,
0.3038432, -1.064702, 3.498156, 0, 0, 0, 1, 1,
0.3109231, 0.339362, 0.7322907, 1, 1, 1, 1, 1,
0.3140065, -0.06801455, 3.142189, 1, 1, 1, 1, 1,
0.318747, -1.33266, 2.132984, 1, 1, 1, 1, 1,
0.3202158, -0.9881563, 1.711891, 1, 1, 1, 1, 1,
0.3262947, 1.825492, 0.541196, 1, 1, 1, 1, 1,
0.3294834, 1.01668, 0.086727, 1, 1, 1, 1, 1,
0.3336871, 0.3969806, 0.5692357, 1, 1, 1, 1, 1,
0.3355124, -0.4244693, 2.708221, 1, 1, 1, 1, 1,
0.3364395, 1.826135, -0.827643, 1, 1, 1, 1, 1,
0.3372546, 2.191207, 0.8580242, 1, 1, 1, 1, 1,
0.3426467, 0.5333787, 1.54004, 1, 1, 1, 1, 1,
0.3494729, -0.04622241, 0.7426378, 1, 1, 1, 1, 1,
0.3519907, 0.1120472, 1.08904, 1, 1, 1, 1, 1,
0.3571831, 0.7318686, 0.7840675, 1, 1, 1, 1, 1,
0.3621062, 0.2508068, 0.6531384, 1, 1, 1, 1, 1,
0.3622333, -0.2511699, 3.371543, 0, 0, 1, 1, 1,
0.3663907, 1.05215, 2.51041, 1, 0, 0, 1, 1,
0.3757155, -0.7562839, 1.42894, 1, 0, 0, 1, 1,
0.3760084, -2.022987, 3.002783, 1, 0, 0, 1, 1,
0.3781629, -0.05558295, 1.328835, 1, 0, 0, 1, 1,
0.3851, 0.1360131, 2.058054, 1, 0, 0, 1, 1,
0.3852861, 1.27619, -0.6461816, 0, 0, 0, 1, 1,
0.3852982, 0.08861198, 0.1231176, 0, 0, 0, 1, 1,
0.3853954, -0.4819245, 1.694674, 0, 0, 0, 1, 1,
0.3932776, -1.131383, 3.347331, 0, 0, 0, 1, 1,
0.3943136, 1.360265, 0.9821779, 0, 0, 0, 1, 1,
0.3944803, 0.7281238, 1.133187, 0, 0, 0, 1, 1,
0.3956963, 0.1019322, 2.638994, 0, 0, 0, 1, 1,
0.399114, -0.3584628, 2.825926, 1, 1, 1, 1, 1,
0.399424, 1.258768, 0.1356608, 1, 1, 1, 1, 1,
0.3994956, 1.923173, -1.497146, 1, 1, 1, 1, 1,
0.4037474, 1.999826, -0.3143459, 1, 1, 1, 1, 1,
0.4065953, 0.5910457, 1.748479, 1, 1, 1, 1, 1,
0.4149033, -0.2315036, 1.227265, 1, 1, 1, 1, 1,
0.4170096, 0.7312067, 0.7597813, 1, 1, 1, 1, 1,
0.4188853, 0.6379092, 1.688512, 1, 1, 1, 1, 1,
0.419078, -0.4086693, 0.9478725, 1, 1, 1, 1, 1,
0.4244649, -1.131302, 1.292455, 1, 1, 1, 1, 1,
0.4308702, 1.405257, -0.6665335, 1, 1, 1, 1, 1,
0.435684, 2.145965, -0.02550969, 1, 1, 1, 1, 1,
0.4376963, -0.1103805, 0.8835393, 1, 1, 1, 1, 1,
0.4378272, -0.2421601, 1.822309, 1, 1, 1, 1, 1,
0.4386714, 2.160751, 1.476619, 1, 1, 1, 1, 1,
0.4422264, 2.077324, -0.8852096, 0, 0, 1, 1, 1,
0.4463074, 0.7341998, 0.9544228, 1, 0, 0, 1, 1,
0.4463679, -0.8504812, 2.729986, 1, 0, 0, 1, 1,
0.4525787, -1.445153, 1.737915, 1, 0, 0, 1, 1,
0.4539947, -0.373263, 2.211437, 1, 0, 0, 1, 1,
0.4565748, -1.917009, 0.8801945, 1, 0, 0, 1, 1,
0.4584635, 1.655777, -1.606949, 0, 0, 0, 1, 1,
0.4608795, 0.4755564, 0.6478145, 0, 0, 0, 1, 1,
0.4617477, 0.9865575, 1.041861, 0, 0, 0, 1, 1,
0.4635201, 0.4870403, 0.07817425, 0, 0, 0, 1, 1,
0.4642001, -0.6291237, 1.853133, 0, 0, 0, 1, 1,
0.4658527, -0.6533241, 3.038763, 0, 0, 0, 1, 1,
0.4668418, -0.08352169, 2.04971, 0, 0, 0, 1, 1,
0.4669888, 1.352762, 0.2751593, 1, 1, 1, 1, 1,
0.4757141, 0.4514005, -0.2784635, 1, 1, 1, 1, 1,
0.4800289, 2.082987, -1.002905, 1, 1, 1, 1, 1,
0.4826176, -0.3325527, 2.343978, 1, 1, 1, 1, 1,
0.4836136, 0.3907817, 0.0525434, 1, 1, 1, 1, 1,
0.4856082, 0.7348679, 1.629527, 1, 1, 1, 1, 1,
0.4889881, -0.518671, 3.013813, 1, 1, 1, 1, 1,
0.501999, -1.316181, 3.180348, 1, 1, 1, 1, 1,
0.5020399, 0.2584155, 1.783251, 1, 1, 1, 1, 1,
0.5071843, -0.3688477, 2.141286, 1, 1, 1, 1, 1,
0.5075594, -0.3335048, 1.678046, 1, 1, 1, 1, 1,
0.5138659, 0.2408438, -0.4900336, 1, 1, 1, 1, 1,
0.516721, -0.5338234, 3.190631, 1, 1, 1, 1, 1,
0.5216491, 2.062118, -0.5893998, 1, 1, 1, 1, 1,
0.5257764, 0.2444213, 1.800515, 1, 1, 1, 1, 1,
0.5272727, 0.9501886, 0.4045236, 0, 0, 1, 1, 1,
0.5279011, -1.911505, 1.610133, 1, 0, 0, 1, 1,
0.5283313, -0.6579539, 2.852558, 1, 0, 0, 1, 1,
0.5381532, -0.5201878, 2.295113, 1, 0, 0, 1, 1,
0.5388826, 1.957327, 0.8181285, 1, 0, 0, 1, 1,
0.5440684, -0.6705461, 5.181018, 1, 0, 0, 1, 1,
0.5445698, -0.1160145, 1.32312, 0, 0, 0, 1, 1,
0.5464761, -0.708748, 2.945292, 0, 0, 0, 1, 1,
0.5521462, 0.4464051, 2.270244, 0, 0, 0, 1, 1,
0.5649105, 1.397259, -0.8365251, 0, 0, 0, 1, 1,
0.5668481, 1.653637, 0.7039634, 0, 0, 0, 1, 1,
0.5747374, 0.6336861, -1.166171, 0, 0, 0, 1, 1,
0.5759015, 0.8278456, -0.4904528, 0, 0, 0, 1, 1,
0.5775329, -0.4884931, 2.34462, 1, 1, 1, 1, 1,
0.5797706, -0.4528961, 0.7282181, 1, 1, 1, 1, 1,
0.5839116, 0.877178, -0.3595197, 1, 1, 1, 1, 1,
0.5847906, 2.253982, -0.5818301, 1, 1, 1, 1, 1,
0.5872746, 1.299683, 0.3279644, 1, 1, 1, 1, 1,
0.5883362, -1.582989, 4.169584, 1, 1, 1, 1, 1,
0.5903986, -0.3968688, 1.515304, 1, 1, 1, 1, 1,
0.5928133, 0.3440106, 2.52777, 1, 1, 1, 1, 1,
0.5979025, 1.521915, 0.3556808, 1, 1, 1, 1, 1,
0.6003733, 1.045687, 2.706212, 1, 1, 1, 1, 1,
0.603412, -0.9183971, 3.416425, 1, 1, 1, 1, 1,
0.6039463, -0.1121332, 0.1537218, 1, 1, 1, 1, 1,
0.6050934, -0.5862146, 2.708543, 1, 1, 1, 1, 1,
0.606314, -0.419919, 3.487082, 1, 1, 1, 1, 1,
0.6163469, 1.463081, 1.232785, 1, 1, 1, 1, 1,
0.6225642, 0.2023132, -0.8744343, 0, 0, 1, 1, 1,
0.6291555, -0.1547554, 1.234695, 1, 0, 0, 1, 1,
0.6347758, -0.4078169, 3.39516, 1, 0, 0, 1, 1,
0.634783, 2.091209, -0.5079951, 1, 0, 0, 1, 1,
0.634872, -2.277787, 3.02228, 1, 0, 0, 1, 1,
0.6364225, -1.600065, 1.049026, 1, 0, 0, 1, 1,
0.6368891, -0.9613329, 3.550492, 0, 0, 0, 1, 1,
0.6463261, -0.751531, 2.791505, 0, 0, 0, 1, 1,
0.6501135, -0.3650627, 2.580477, 0, 0, 0, 1, 1,
0.6517293, 1.784737, 1.314435, 0, 0, 0, 1, 1,
0.6531959, 0.1034986, 3.758589, 0, 0, 0, 1, 1,
0.6546454, 0.08640826, 1.39204, 0, 0, 0, 1, 1,
0.6590558, 0.411532, 1.121352, 0, 0, 0, 1, 1,
0.6611655, 0.7328683, 1.451559, 1, 1, 1, 1, 1,
0.6618029, -0.3541955, 2.280977, 1, 1, 1, 1, 1,
0.6621034, 0.8031967, -0.1978256, 1, 1, 1, 1, 1,
0.662414, 0.5049006, 2.020562, 1, 1, 1, 1, 1,
0.6642201, 0.2165187, 1.477203, 1, 1, 1, 1, 1,
0.6674477, 0.3546568, 2.569481, 1, 1, 1, 1, 1,
0.6713783, 0.45114, 2.938408, 1, 1, 1, 1, 1,
0.6714036, 0.8962349, -0.0979581, 1, 1, 1, 1, 1,
0.6718281, 0.148381, 1.114625, 1, 1, 1, 1, 1,
0.6718494, 0.09157828, 2.08877, 1, 1, 1, 1, 1,
0.6720831, 0.1106262, 1.317643, 1, 1, 1, 1, 1,
0.6738251, -1.232972, 2.895525, 1, 1, 1, 1, 1,
0.6796384, -0.1883068, 1.420717, 1, 1, 1, 1, 1,
0.6807568, 0.9641927, 0.1008868, 1, 1, 1, 1, 1,
0.6887093, -1.048259, 2.71575, 1, 1, 1, 1, 1,
0.6902767, 0.6899747, 1.635798, 0, 0, 1, 1, 1,
0.6939635, 1.597199, 0.2024871, 1, 0, 0, 1, 1,
0.6979092, -0.1244396, 1.866659, 1, 0, 0, 1, 1,
0.7067862, -0.4432394, 0.3914417, 1, 0, 0, 1, 1,
0.7070214, -0.6429381, 1.826728, 1, 0, 0, 1, 1,
0.7131914, -0.6010298, 4.043729, 1, 0, 0, 1, 1,
0.7179315, -1.743544, 1.526123, 0, 0, 0, 1, 1,
0.7182945, 1.501391, -0.8557497, 0, 0, 0, 1, 1,
0.7206328, -0.004900644, 1.378094, 0, 0, 0, 1, 1,
0.7208995, 0.57631, 1.368581, 0, 0, 0, 1, 1,
0.7225636, 0.2044792, 0.861748, 0, 0, 0, 1, 1,
0.7232962, -0.1120083, -0.3503623, 0, 0, 0, 1, 1,
0.7258839, 1.068532, 0.5925899, 0, 0, 0, 1, 1,
0.7286119, 0.2191855, 1.266906, 1, 1, 1, 1, 1,
0.7318549, -0.8826997, 3.091619, 1, 1, 1, 1, 1,
0.7399257, -0.4291181, 2.752208, 1, 1, 1, 1, 1,
0.740098, -1.106818, 1.862008, 1, 1, 1, 1, 1,
0.741324, 1.036816, 0.2152642, 1, 1, 1, 1, 1,
0.7421489, -1.412602, 1.443759, 1, 1, 1, 1, 1,
0.744501, -1.481416, 2.105769, 1, 1, 1, 1, 1,
0.7460232, -0.5581453, 3.462546, 1, 1, 1, 1, 1,
0.7502921, -1.641518, 3.768301, 1, 1, 1, 1, 1,
0.7506962, -1.309975, 1.253237, 1, 1, 1, 1, 1,
0.7510732, -1.306441, 3.279569, 1, 1, 1, 1, 1,
0.757179, 0.4085315, -0.4191092, 1, 1, 1, 1, 1,
0.7607684, 1.170586, -0.7653846, 1, 1, 1, 1, 1,
0.7674992, 1.455578, 0.3692222, 1, 1, 1, 1, 1,
0.7685861, 1.256856, 1.304503, 1, 1, 1, 1, 1,
0.7691005, -1.060299, 2.289983, 0, 0, 1, 1, 1,
0.7730505, -0.4676714, 3.706145, 1, 0, 0, 1, 1,
0.7841083, -1.424101, 1.501105, 1, 0, 0, 1, 1,
0.7922902, -0.3512095, 0.6541879, 1, 0, 0, 1, 1,
0.7934349, 0.5973829, -1.736739, 1, 0, 0, 1, 1,
0.7962639, 0.6835946, 2.054621, 1, 0, 0, 1, 1,
0.8001654, -0.9906971, 0.9870619, 0, 0, 0, 1, 1,
0.8081659, -0.1514324, 2.735898, 0, 0, 0, 1, 1,
0.8121665, -0.6482201, 1.992415, 0, 0, 0, 1, 1,
0.8143885, 1.118674, 0.04288459, 0, 0, 0, 1, 1,
0.8204643, 0.3035828, 1.773603, 0, 0, 0, 1, 1,
0.8239582, 0.5700078, 2.58652, 0, 0, 0, 1, 1,
0.8246125, -0.3220026, 3.080152, 0, 0, 0, 1, 1,
0.8252343, 0.3989402, 0.8978602, 1, 1, 1, 1, 1,
0.8271738, -0.6343825, 2.600713, 1, 1, 1, 1, 1,
0.8353528, 1.868052, 0.5061828, 1, 1, 1, 1, 1,
0.8356319, -0.667392, 2.686034, 1, 1, 1, 1, 1,
0.8360105, 0.7063507, 2.083166, 1, 1, 1, 1, 1,
0.842087, 0.1162884, 1.221881, 1, 1, 1, 1, 1,
0.842252, 0.7304029, 1.270303, 1, 1, 1, 1, 1,
0.8500933, -0.2015059, 1.458573, 1, 1, 1, 1, 1,
0.8552454, 0.1912485, 0.9569903, 1, 1, 1, 1, 1,
0.8562925, 1.157904, 2.224096, 1, 1, 1, 1, 1,
0.8570212, -0.3045413, 2.653156, 1, 1, 1, 1, 1,
0.8650907, 1.511943, -0.1713085, 1, 1, 1, 1, 1,
0.8667384, -0.5102244, 3.025154, 1, 1, 1, 1, 1,
0.8673396, 1.674888, -0.2645577, 1, 1, 1, 1, 1,
0.8702051, -1.538449, 2.136987, 1, 1, 1, 1, 1,
0.8833328, 0.07221421, 0.5625852, 0, 0, 1, 1, 1,
0.8834283, 0.7529336, -0.5281218, 1, 0, 0, 1, 1,
0.888933, 1.121611, -0.240979, 1, 0, 0, 1, 1,
0.8902975, -0.7392536, 2.119412, 1, 0, 0, 1, 1,
0.8908465, -0.551053, 4.172529, 1, 0, 0, 1, 1,
0.8940467, 0.7453557, 0.3532096, 1, 0, 0, 1, 1,
0.9087991, 1.855015, 1.030073, 0, 0, 0, 1, 1,
0.9105424, 1.340314, 0.5607801, 0, 0, 0, 1, 1,
0.9118048, -0.4165512, 3.037609, 0, 0, 0, 1, 1,
0.9132599, -0.8089511, 1.616277, 0, 0, 0, 1, 1,
0.9175573, -1.402304, 4.371945, 0, 0, 0, 1, 1,
0.9193704, 0.5493345, -0.4026173, 0, 0, 0, 1, 1,
0.9228069, 0.820691, 0.9527942, 0, 0, 0, 1, 1,
0.9239612, -0.7077144, 1.727492, 1, 1, 1, 1, 1,
0.929004, 1.134842, -0.1079584, 1, 1, 1, 1, 1,
0.9303101, 1.064442, 1.187746, 1, 1, 1, 1, 1,
0.9404112, -1.007306, 3.339566, 1, 1, 1, 1, 1,
0.9404824, -0.2567445, 1.393927, 1, 1, 1, 1, 1,
0.9423339, 0.7982483, 3.654635, 1, 1, 1, 1, 1,
0.9460232, 1.433854, 0.3475321, 1, 1, 1, 1, 1,
0.9529351, -0.01942371, 1.865536, 1, 1, 1, 1, 1,
0.955458, -0.62564, 2.897603, 1, 1, 1, 1, 1,
0.9580531, 0.3952629, 1.323896, 1, 1, 1, 1, 1,
0.9589087, -0.1576615, 3.28113, 1, 1, 1, 1, 1,
0.9634923, -0.02590232, 2.617767, 1, 1, 1, 1, 1,
0.9637597, 0.1161462, 1.444853, 1, 1, 1, 1, 1,
0.9708269, 0.2225536, -0.2747018, 1, 1, 1, 1, 1,
0.9772965, 0.2326526, 0.455305, 1, 1, 1, 1, 1,
0.9808038, 0.550459, -0.05808088, 0, 0, 1, 1, 1,
0.983246, -0.8969735, 3.946762, 1, 0, 0, 1, 1,
0.9859377, -1.247484, 2.687979, 1, 0, 0, 1, 1,
0.9958119, 0.03589308, 0.1758995, 1, 0, 0, 1, 1,
0.9966293, -1.258022, 2.970855, 1, 0, 0, 1, 1,
0.9971322, -1.859471, 3.511307, 1, 0, 0, 1, 1,
1.000148, -0.8860757, 3.243667, 0, 0, 0, 1, 1,
1.005594, -1.231862, 2.609794, 0, 0, 0, 1, 1,
1.017828, -1.307672, 2.90282, 0, 0, 0, 1, 1,
1.050404, -0.6498169, 1.854839, 0, 0, 0, 1, 1,
1.054324, 0.5463348, 2.545886, 0, 0, 0, 1, 1,
1.055078, -0.004063696, -0.1225694, 0, 0, 0, 1, 1,
1.063434, 0.9616572, -1.616508, 0, 0, 0, 1, 1,
1.06729, -0.06470808, 2.148048, 1, 1, 1, 1, 1,
1.073833, -0.6968957, 0.7968938, 1, 1, 1, 1, 1,
1.091975, 1.975365, 0.9843882, 1, 1, 1, 1, 1,
1.092936, 0.837719, 2.017418, 1, 1, 1, 1, 1,
1.09444, 1.09248, 1.619884, 1, 1, 1, 1, 1,
1.094654, -1.209598, 2.590246, 1, 1, 1, 1, 1,
1.110944, 1.430826, 0.1893419, 1, 1, 1, 1, 1,
1.112817, 2.609324, -1.695064, 1, 1, 1, 1, 1,
1.117402, 0.7517689, 2.674039, 1, 1, 1, 1, 1,
1.117891, 0.4501363, 0.719846, 1, 1, 1, 1, 1,
1.121466, -0.6742701, 2.783141, 1, 1, 1, 1, 1,
1.126279, 1.558967, 1.159276, 1, 1, 1, 1, 1,
1.130129, 0.1920081, 1.856273, 1, 1, 1, 1, 1,
1.13138, -1.275786, 2.050789, 1, 1, 1, 1, 1,
1.133659, -0.07254442, 2.021338, 1, 1, 1, 1, 1,
1.134759, -1.512236, 2.820951, 0, 0, 1, 1, 1,
1.137365, -2.06315, 3.703529, 1, 0, 0, 1, 1,
1.140678, 0.9385531, 0.9324231, 1, 0, 0, 1, 1,
1.14178, 2.815605, -1.057194, 1, 0, 0, 1, 1,
1.14792, -0.9203483, 1.366601, 1, 0, 0, 1, 1,
1.152068, -0.7442591, 0.02537832, 1, 0, 0, 1, 1,
1.156502, 1.375087, 0.5046436, 0, 0, 0, 1, 1,
1.161031, 1.440114, 1.332997, 0, 0, 0, 1, 1,
1.162539, 0.1029025, -0.3390556, 0, 0, 0, 1, 1,
1.168993, -1.078919, 2.096041, 0, 0, 0, 1, 1,
1.178418, 0.6363454, 1.345822, 0, 0, 0, 1, 1,
1.202504, 0.9560335, 0.1564067, 0, 0, 0, 1, 1,
1.219288, -0.1507169, 0.3846321, 0, 0, 0, 1, 1,
1.233898, 0.1652524, -0.06368356, 1, 1, 1, 1, 1,
1.235463, 0.3787104, 2.089404, 1, 1, 1, 1, 1,
1.238037, -1.198298, 1.661, 1, 1, 1, 1, 1,
1.242179, 0.7781193, -0.5709996, 1, 1, 1, 1, 1,
1.246536, -0.3776178, 2.910259, 1, 1, 1, 1, 1,
1.255306, 0.6149438, 0.8347713, 1, 1, 1, 1, 1,
1.258459, -0.5964088, 1.355658, 1, 1, 1, 1, 1,
1.2601, -2.869027, 0.7484386, 1, 1, 1, 1, 1,
1.26227, -1.154525, 2.675928, 1, 1, 1, 1, 1,
1.263952, 1.301562, 1.219593, 1, 1, 1, 1, 1,
1.265648, -1.205212, 2.070012, 1, 1, 1, 1, 1,
1.267187, -1.192322, 2.163268, 1, 1, 1, 1, 1,
1.271601, -0.5119404, 2.504804, 1, 1, 1, 1, 1,
1.282918, -0.5898021, 4.096148, 1, 1, 1, 1, 1,
1.294679, -0.8628526, 4.146183, 1, 1, 1, 1, 1,
1.299548, -1.580698, 2.234448, 0, 0, 1, 1, 1,
1.306454, -0.2141524, 0.1305228, 1, 0, 0, 1, 1,
1.312133, -0.4488575, 2.426542, 1, 0, 0, 1, 1,
1.314469, -0.9506561, 0.7091617, 1, 0, 0, 1, 1,
1.323387, -1.003575, 2.086238, 1, 0, 0, 1, 1,
1.329545, 0.5004066, 0.2366615, 1, 0, 0, 1, 1,
1.330302, -0.4025316, 2.297658, 0, 0, 0, 1, 1,
1.332643, 0.1881443, 1.311511, 0, 0, 0, 1, 1,
1.350244, 0.5708127, 2.906455, 0, 0, 0, 1, 1,
1.362279, -0.2327169, 1.673776, 0, 0, 0, 1, 1,
1.362424, 0.7306522, 2.83146, 0, 0, 0, 1, 1,
1.364337, -1.360052, 2.533782, 0, 0, 0, 1, 1,
1.389726, 0.1725397, 1.807484, 0, 0, 0, 1, 1,
1.399567, -0.6611001, 1.575098, 1, 1, 1, 1, 1,
1.402555, 0.8956335, 0.7776144, 1, 1, 1, 1, 1,
1.414117, 0.2650635, 1.870612, 1, 1, 1, 1, 1,
1.420959, -0.3404667, 2.023304, 1, 1, 1, 1, 1,
1.421379, -0.2943317, 1.215775, 1, 1, 1, 1, 1,
1.431417, 0.6096194, 0.7142597, 1, 1, 1, 1, 1,
1.435024, 1.04348, 1.428339, 1, 1, 1, 1, 1,
1.439113, -0.8536504, 1.076603, 1, 1, 1, 1, 1,
1.443846, -0.2048633, 2.055195, 1, 1, 1, 1, 1,
1.444915, 2.00979, 0.3501923, 1, 1, 1, 1, 1,
1.448126, -1.00761, 1.813603, 1, 1, 1, 1, 1,
1.448731, 1.505505, 2.004052, 1, 1, 1, 1, 1,
1.451765, 0.5022969, 3.704863, 1, 1, 1, 1, 1,
1.452811, 0.7997942, 3.108994, 1, 1, 1, 1, 1,
1.462727, 0.2580286, 1.443703, 1, 1, 1, 1, 1,
1.467398, 1.062211, 1.181186, 0, 0, 1, 1, 1,
1.467603, -0.2223058, 0.08247161, 1, 0, 0, 1, 1,
1.472295, -0.1525849, 1.473685, 1, 0, 0, 1, 1,
1.480908, -2.572645, 2.535318, 1, 0, 0, 1, 1,
1.486513, -0.1291556, 0.9156239, 1, 0, 0, 1, 1,
1.491123, -2.344408, 1.584361, 1, 0, 0, 1, 1,
1.500495, 1.154095, 0.5847036, 0, 0, 0, 1, 1,
1.502507, 0.8939813, 1.826963, 0, 0, 0, 1, 1,
1.506909, 1.434402, 1.977002, 0, 0, 0, 1, 1,
1.519542, -1.461875, 3.384592, 0, 0, 0, 1, 1,
1.521329, -0.06686734, 0.5633565, 0, 0, 0, 1, 1,
1.522844, -0.482975, 1.354578, 0, 0, 0, 1, 1,
1.523498, 0.6610097, 1.8915, 0, 0, 0, 1, 1,
1.526723, -0.1495196, 2.316703, 1, 1, 1, 1, 1,
1.527193, -0.7630311, 1.283203, 1, 1, 1, 1, 1,
1.527295, -1.499724, 1.360305, 1, 1, 1, 1, 1,
1.546351, 0.4805701, 2.876711, 1, 1, 1, 1, 1,
1.55469, 1.789962, 2.419608, 1, 1, 1, 1, 1,
1.555768, -0.7524956, 1.184026, 1, 1, 1, 1, 1,
1.558335, -0.5319272, 1.739786, 1, 1, 1, 1, 1,
1.567264, 0.6724386, 0.8618823, 1, 1, 1, 1, 1,
1.594542, -0.3284359, 2.305459, 1, 1, 1, 1, 1,
1.60671, -0.7807299, 2.810154, 1, 1, 1, 1, 1,
1.606993, -1.221541, 1.72118, 1, 1, 1, 1, 1,
1.615383, 0.5158651, 1.80699, 1, 1, 1, 1, 1,
1.618379, 0.7022215, 0.6968757, 1, 1, 1, 1, 1,
1.630719, 0.2587849, 1.847594, 1, 1, 1, 1, 1,
1.645002, 2.063134, 2.003674, 1, 1, 1, 1, 1,
1.654233, 0.1282104, 2.708931, 0, 0, 1, 1, 1,
1.656704, 0.04858248, 0.6367096, 1, 0, 0, 1, 1,
1.680738, 1.135099, -0.7863778, 1, 0, 0, 1, 1,
1.705826, 0.5873303, 3.152344, 1, 0, 0, 1, 1,
1.712771, 1.817555, -0.1927626, 1, 0, 0, 1, 1,
1.728035, 0.7042777, 3.278765, 1, 0, 0, 1, 1,
1.797012, -1.502533, 3.272997, 0, 0, 0, 1, 1,
1.837003, 1.69104, -0.7832806, 0, 0, 0, 1, 1,
1.851048, 0.1274365, 1.990209, 0, 0, 0, 1, 1,
1.857949, 1.304257, 0.1488833, 0, 0, 0, 1, 1,
1.85959, 0.2974217, 2.270485, 0, 0, 0, 1, 1,
1.879714, 0.22942, 0.7766004, 0, 0, 0, 1, 1,
1.883752, -2.251058, 3.537908, 0, 0, 0, 1, 1,
1.902416, 0.6904585, 1.912216, 1, 1, 1, 1, 1,
1.92169, -1.66567, 0.2188594, 1, 1, 1, 1, 1,
1.948723, -1.23574, 3.106137, 1, 1, 1, 1, 1,
1.953721, 0.4030717, 1.56423, 1, 1, 1, 1, 1,
1.970813, -2.31609, 2.990824, 1, 1, 1, 1, 1,
1.974363, -0.583241, 1.537914, 1, 1, 1, 1, 1,
1.980362, -0.7903457, 1.884745, 1, 1, 1, 1, 1,
1.993828, 0.007111318, 1.400617, 1, 1, 1, 1, 1,
2.042195, -0.002497211, 3.226029, 1, 1, 1, 1, 1,
2.062181, 0.2352265, -0.2239734, 1, 1, 1, 1, 1,
2.071581, 0.3605156, 1.877993, 1, 1, 1, 1, 1,
2.093533, -0.05371382, 2.838591, 1, 1, 1, 1, 1,
2.097886, -1.470429, 4.035121, 1, 1, 1, 1, 1,
2.105305, -1.943059, 1.424968, 1, 1, 1, 1, 1,
2.131665, 0.2935581, 1.464389, 1, 1, 1, 1, 1,
2.138562, 0.4208662, -0.2552386, 0, 0, 1, 1, 1,
2.188638, -1.63158, 1.121547, 1, 0, 0, 1, 1,
2.210064, 0.6399917, 2.725956, 1, 0, 0, 1, 1,
2.21191, -1.059182, 1.266284, 1, 0, 0, 1, 1,
2.237744, -0.9442345, 2.965973, 1, 0, 0, 1, 1,
2.270927, -0.1606388, 0.8480667, 1, 0, 0, 1, 1,
2.301114, 0.09871463, 1.469372, 0, 0, 0, 1, 1,
2.328326, 1.205116, 2.239597, 0, 0, 0, 1, 1,
2.3445, 0.1018417, 1.981734, 0, 0, 0, 1, 1,
2.377215, -1.706972, 0.6036695, 0, 0, 0, 1, 1,
2.399564, 0.2810185, 2.500948, 0, 0, 0, 1, 1,
2.472177, 1.497492, 2.04758, 0, 0, 0, 1, 1,
2.489394, 0.2163432, 2.340377, 0, 0, 0, 1, 1,
2.557263, 0.8252318, 0.6170093, 1, 1, 1, 1, 1,
2.649915, -0.7688578, 1.491224, 1, 1, 1, 1, 1,
2.708391, 0.2781844, 1.058215, 1, 1, 1, 1, 1,
2.790676, 0.2762464, 0.9510798, 1, 1, 1, 1, 1,
2.899524, 2.504719, -0.6343352, 1, 1, 1, 1, 1,
2.946257, -0.8299664, 2.052846, 1, 1, 1, 1, 1,
3.1964, 1.349279, -0.3394651, 1, 1, 1, 1, 1
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
var radius = 9.575425;
var distance = 33.63327;
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
mvMatrix.translate( 0.230036, -0.09350049, 0.1814401 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63327);
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
