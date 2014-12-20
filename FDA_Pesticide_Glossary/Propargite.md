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
-3.352309, 0.8074317, -1.82651, 1, 0, 0, 1,
-3.015204, 0.3005233, 0.1358517, 1, 0.007843138, 0, 1,
-2.897826, -0.4385807, -1.441059, 1, 0.01176471, 0, 1,
-2.719991, -0.5873716, -1.037373, 1, 0.01960784, 0, 1,
-2.627402, -0.4474339, -1.648612, 1, 0.02352941, 0, 1,
-2.579584, -0.04187262, -0.1459882, 1, 0.03137255, 0, 1,
-2.507495, 1.367213, 0.2399085, 1, 0.03529412, 0, 1,
-2.330975, 0.04966044, -2.151319, 1, 0.04313726, 0, 1,
-2.311684, 1.859462, -2.060572, 1, 0.04705882, 0, 1,
-2.231386, -1.62815, -0.4489596, 1, 0.05490196, 0, 1,
-2.210149, -0.4141838, -0.8507892, 1, 0.05882353, 0, 1,
-2.195099, -0.4439617, -1.774903, 1, 0.06666667, 0, 1,
-2.113343, 2.024787, -2.402174, 1, 0.07058824, 0, 1,
-2.103594, 0.06010305, 1.343377, 1, 0.07843138, 0, 1,
-2.09634, -0.2504161, -2.533516, 1, 0.08235294, 0, 1,
-2.089459, 2.018552, 0.2747313, 1, 0.09019608, 0, 1,
-2.08463, 0.643474, 0.4843481, 1, 0.09411765, 0, 1,
-2.08078, 0.9172459, -2.010805, 1, 0.1019608, 0, 1,
-2.059881, -0.3436732, -2.297532, 1, 0.1098039, 0, 1,
-2.056083, 1.767386, -0.2217707, 1, 0.1137255, 0, 1,
-2.053923, 0.8948523, -0.5779076, 1, 0.1215686, 0, 1,
-2.050406, 0.4681994, -1.948793, 1, 0.1254902, 0, 1,
-2.046325, 0.2638963, -1.924046, 1, 0.1333333, 0, 1,
-1.989622, -1.059609, -2.623061, 1, 0.1372549, 0, 1,
-1.957648, 0.07273523, -0.9142122, 1, 0.145098, 0, 1,
-1.954971, 1.082815, -0.7811503, 1, 0.1490196, 0, 1,
-1.954793, 0.1176248, -2.282298, 1, 0.1568628, 0, 1,
-1.94786, 0.2357184, -0.9983149, 1, 0.1607843, 0, 1,
-1.927139, -0.6483667, -2.906682, 1, 0.1686275, 0, 1,
-1.908372, -1.025633, -2.244576, 1, 0.172549, 0, 1,
-1.899615, -1.247965, -3.235644, 1, 0.1803922, 0, 1,
-1.89238, -1.083128, -3.157377, 1, 0.1843137, 0, 1,
-1.869636, 0.5102031, -0.02152532, 1, 0.1921569, 0, 1,
-1.863256, 1.951458, -1.076715, 1, 0.1960784, 0, 1,
-1.855539, -1.417857, -2.51486, 1, 0.2039216, 0, 1,
-1.855405, -1.030268, -2.236236, 1, 0.2117647, 0, 1,
-1.84029, 0.6553032, -0.7593203, 1, 0.2156863, 0, 1,
-1.835957, 0.5008381, 0.132374, 1, 0.2235294, 0, 1,
-1.831875, -0.02139634, -1.293267, 1, 0.227451, 0, 1,
-1.81942, 0.399705, -3.329152, 1, 0.2352941, 0, 1,
-1.806096, -0.3990987, -1.588828, 1, 0.2392157, 0, 1,
-1.794465, -0.3082107, 0.1032298, 1, 0.2470588, 0, 1,
-1.791593, 0.2131205, -1.047418, 1, 0.2509804, 0, 1,
-1.784479, 0.3562706, -0.6199145, 1, 0.2588235, 0, 1,
-1.780977, -0.6028185, -1.437319, 1, 0.2627451, 0, 1,
-1.737912, 2.284173, 0.4331613, 1, 0.2705882, 0, 1,
-1.732002, 0.1562151, -0.1267751, 1, 0.2745098, 0, 1,
-1.70167, 0.3082741, -1.875762, 1, 0.282353, 0, 1,
-1.69978, 0.2077435, -1.201772, 1, 0.2862745, 0, 1,
-1.697186, -0.6747532, -2.631371, 1, 0.2941177, 0, 1,
-1.683536, 1.021999, 0.09978802, 1, 0.3019608, 0, 1,
-1.680884, -2.672543, -1.196879, 1, 0.3058824, 0, 1,
-1.679466, -0.9503565, -2.507714, 1, 0.3137255, 0, 1,
-1.657312, 0.06231749, -0.2103691, 1, 0.3176471, 0, 1,
-1.649341, -1.178146, -1.769127, 1, 0.3254902, 0, 1,
-1.630906, 0.7879028, -2.949453, 1, 0.3294118, 0, 1,
-1.62293, -1.721257, -2.716169, 1, 0.3372549, 0, 1,
-1.620586, 0.340603, -1.180692, 1, 0.3411765, 0, 1,
-1.611894, 1.549227, -1.587452, 1, 0.3490196, 0, 1,
-1.60854, 1.674197, -0.7522866, 1, 0.3529412, 0, 1,
-1.608299, -0.1730189, -1.275008, 1, 0.3607843, 0, 1,
-1.607831, 1.168534, -0.6196622, 1, 0.3647059, 0, 1,
-1.603127, 0.03788354, -0.9702029, 1, 0.372549, 0, 1,
-1.601926, 0.8132612, -1.616559, 1, 0.3764706, 0, 1,
-1.596466, 0.2201679, -1.636659, 1, 0.3843137, 0, 1,
-1.591414, 0.9142565, -0.6163887, 1, 0.3882353, 0, 1,
-1.581055, 0.1155843, -1.387345, 1, 0.3960784, 0, 1,
-1.573962, -0.9212242, -3.273781, 1, 0.4039216, 0, 1,
-1.572524, -1.650127, -4.402786, 1, 0.4078431, 0, 1,
-1.566671, 2.035641, -0.9045734, 1, 0.4156863, 0, 1,
-1.554427, 0.9333302, -0.1383875, 1, 0.4196078, 0, 1,
-1.542345, -1.193855, -3.241225, 1, 0.427451, 0, 1,
-1.539214, -0.8899922, 0.1751209, 1, 0.4313726, 0, 1,
-1.536597, -0.4394539, -2.069253, 1, 0.4392157, 0, 1,
-1.535626, -0.1697101, -1.277139, 1, 0.4431373, 0, 1,
-1.531838, -0.5247639, -1.461371, 1, 0.4509804, 0, 1,
-1.52632, 0.5908308, -1.774873, 1, 0.454902, 0, 1,
-1.524882, 1.036291, 1.024918, 1, 0.4627451, 0, 1,
-1.520864, 1.645909, -0.3192283, 1, 0.4666667, 0, 1,
-1.517604, -0.6944947, -0.5729287, 1, 0.4745098, 0, 1,
-1.507166, 0.5041715, -2.579722, 1, 0.4784314, 0, 1,
-1.492837, -2.751747, -1.517936, 1, 0.4862745, 0, 1,
-1.491115, -2.581001, -0.6985809, 1, 0.4901961, 0, 1,
-1.483701, 0.9355538, -3.893305, 1, 0.4980392, 0, 1,
-1.480282, 1.028203, -1.018744, 1, 0.5058824, 0, 1,
-1.4777, 0.8432631, -1.167417, 1, 0.509804, 0, 1,
-1.470227, -0.1716395, -1.997057, 1, 0.5176471, 0, 1,
-1.468667, 0.01519903, -1.802441, 1, 0.5215687, 0, 1,
-1.437237, -0.1457694, -1.731223, 1, 0.5294118, 0, 1,
-1.433318, -1.844066, -2.58337, 1, 0.5333334, 0, 1,
-1.42698, 0.2899839, -1.424791, 1, 0.5411765, 0, 1,
-1.422213, 0.8197817, -0.8852066, 1, 0.5450981, 0, 1,
-1.416731, 0.4573949, -1.874983, 1, 0.5529412, 0, 1,
-1.416446, -0.2505673, -1.668135, 1, 0.5568628, 0, 1,
-1.412584, -1.166991, -3.008048, 1, 0.5647059, 0, 1,
-1.411662, -0.2343995, -2.448092, 1, 0.5686275, 0, 1,
-1.400314, 0.6382627, -3.633591, 1, 0.5764706, 0, 1,
-1.395936, -0.7562979, -1.4117, 1, 0.5803922, 0, 1,
-1.395338, 0.3125835, -2.247139, 1, 0.5882353, 0, 1,
-1.390251, 1.518901, -0.08594899, 1, 0.5921569, 0, 1,
-1.380397, -0.4041301, -1.786708, 1, 0.6, 0, 1,
-1.378201, -1.08845, -1.342377, 1, 0.6078432, 0, 1,
-1.377568, 0.7446884, -2.224931, 1, 0.6117647, 0, 1,
-1.375155, 0.8650351, -1.184633, 1, 0.6196079, 0, 1,
-1.358832, 0.9224733, -0.4057301, 1, 0.6235294, 0, 1,
-1.339927, -1.469773, -1.885837, 1, 0.6313726, 0, 1,
-1.33653, 1.161697, 0.6282381, 1, 0.6352941, 0, 1,
-1.33548, 1.535189, -2.572171, 1, 0.6431373, 0, 1,
-1.317443, -0.7435679, -0.3664806, 1, 0.6470588, 0, 1,
-1.316849, -0.6987943, -1.554304, 1, 0.654902, 0, 1,
-1.313844, 1.18, -3.203475, 1, 0.6588235, 0, 1,
-1.311267, -0.7259535, -1.152043, 1, 0.6666667, 0, 1,
-1.297595, 0.5373456, -1.20202, 1, 0.6705883, 0, 1,
-1.296268, 0.5305644, -2.174142, 1, 0.6784314, 0, 1,
-1.292874, 0.5088281, -0.9317667, 1, 0.682353, 0, 1,
-1.289678, 0.07269081, -1.437918, 1, 0.6901961, 0, 1,
-1.284967, 1.069157, -0.07538792, 1, 0.6941177, 0, 1,
-1.28296, -1.440399, -3.054127, 1, 0.7019608, 0, 1,
-1.280004, -0.4372986, -1.478073, 1, 0.7098039, 0, 1,
-1.277972, 1.038574, 0.3555254, 1, 0.7137255, 0, 1,
-1.268574, 0.3056752, -1.546823, 1, 0.7215686, 0, 1,
-1.262607, 0.8604689, -1.933281, 1, 0.7254902, 0, 1,
-1.262295, -0.3579741, -1.878166, 1, 0.7333333, 0, 1,
-1.257927, 1.553834, -1.484027, 1, 0.7372549, 0, 1,
-1.239758, 0.5944134, -1.268561, 1, 0.7450981, 0, 1,
-1.235997, 0.9138357, -1.933658, 1, 0.7490196, 0, 1,
-1.226754, 0.08500627, -2.279802, 1, 0.7568628, 0, 1,
-1.211812, -0.3797891, -1.445981, 1, 0.7607843, 0, 1,
-1.210312, 0.3233263, -0.496463, 1, 0.7686275, 0, 1,
-1.205791, -0.7393531, -1.641067, 1, 0.772549, 0, 1,
-1.19851, -0.3082842, -2.509612, 1, 0.7803922, 0, 1,
-1.196939, 1.42358, 0.276825, 1, 0.7843137, 0, 1,
-1.191168, 0.1979581, -0.8459883, 1, 0.7921569, 0, 1,
-1.188241, 1.495841, -1.710103, 1, 0.7960784, 0, 1,
-1.174391, 0.2091781, -2.134948, 1, 0.8039216, 0, 1,
-1.172967, 0.7080027, -0.5340828, 1, 0.8117647, 0, 1,
-1.168239, 1.477449, -0.9704251, 1, 0.8156863, 0, 1,
-1.158031, -0.9062021, -2.166958, 1, 0.8235294, 0, 1,
-1.153414, 1.533456, 0.3461379, 1, 0.827451, 0, 1,
-1.147184, 0.7384704, -0.3093905, 1, 0.8352941, 0, 1,
-1.134494, -0.08420461, -3.258134, 1, 0.8392157, 0, 1,
-1.13242, 2.179436, -0.6893908, 1, 0.8470588, 0, 1,
-1.131738, -1.379528, -3.998278, 1, 0.8509804, 0, 1,
-1.117307, -0.4995877, -2.761791, 1, 0.8588235, 0, 1,
-1.113416, 0.9193804, -2.456718, 1, 0.8627451, 0, 1,
-1.112044, 0.5057802, -1.209148, 1, 0.8705882, 0, 1,
-1.109861, 1.315046, -0.600964, 1, 0.8745098, 0, 1,
-1.106917, 1.218747, -0.6420106, 1, 0.8823529, 0, 1,
-1.099542, 0.02238927, -0.6407902, 1, 0.8862745, 0, 1,
-1.099165, -1.603844, -2.04384, 1, 0.8941177, 0, 1,
-1.091694, -0.3900706, -2.157146, 1, 0.8980392, 0, 1,
-1.08863, -0.06472525, -1.363099, 1, 0.9058824, 0, 1,
-1.08618, -0.4753709, -2.077677, 1, 0.9137255, 0, 1,
-1.084854, 0.8180765, -2.167827, 1, 0.9176471, 0, 1,
-1.082399, -0.5671462, -1.149471, 1, 0.9254902, 0, 1,
-1.081894, 1.210839, -1.828817, 1, 0.9294118, 0, 1,
-1.080564, 0.7775738, -0.9261821, 1, 0.9372549, 0, 1,
-1.079827, 1.033392, -0.8724808, 1, 0.9411765, 0, 1,
-1.073084, -1.044861, -1.346722, 1, 0.9490196, 0, 1,
-1.071033, -1.60243, -2.446945, 1, 0.9529412, 0, 1,
-1.064112, 0.4401397, -0.8077011, 1, 0.9607843, 0, 1,
-1.061569, 0.04298477, -2.866148, 1, 0.9647059, 0, 1,
-1.056033, -0.2217051, -1.956874, 1, 0.972549, 0, 1,
-1.053912, 0.1058341, -0.1102589, 1, 0.9764706, 0, 1,
-1.041674, -0.2410753, -1.313532, 1, 0.9843137, 0, 1,
-1.040212, -0.3371534, -1.628893, 1, 0.9882353, 0, 1,
-1.039176, -0.2044792, -0.02481302, 1, 0.9960784, 0, 1,
-1.027536, -0.6804191, -0.8001708, 0.9960784, 1, 0, 1,
-1.025614, -0.09700473, -1.015092, 0.9921569, 1, 0, 1,
-1.019588, 0.4701785, 1.054841, 0.9843137, 1, 0, 1,
-1.008253, -0.6353796, -2.536274, 0.9803922, 1, 0, 1,
-1.004735, -2.719146, -2.8389, 0.972549, 1, 0, 1,
-0.9912308, 2.332658, -1.53666, 0.9686275, 1, 0, 1,
-0.9885628, -1.790405, -2.972258, 0.9607843, 1, 0, 1,
-0.9857945, 1.285641, 0.438533, 0.9568627, 1, 0, 1,
-0.9844516, -0.2509027, -1.981416, 0.9490196, 1, 0, 1,
-0.9826566, -1.031752, -3.47876, 0.945098, 1, 0, 1,
-0.9727987, 0.8555768, -0.01295424, 0.9372549, 1, 0, 1,
-0.9687282, -1.401225, -2.968954, 0.9333333, 1, 0, 1,
-0.9669563, -1.481683, -3.089219, 0.9254902, 1, 0, 1,
-0.9655796, 0.7620731, -1.483038, 0.9215686, 1, 0, 1,
-0.9526952, 0.9519271, 0.09202944, 0.9137255, 1, 0, 1,
-0.9506751, 0.01415615, -1.573884, 0.9098039, 1, 0, 1,
-0.945749, 0.7177981, -2.064853, 0.9019608, 1, 0, 1,
-0.9427186, 0.5449737, -3.014999, 0.8941177, 1, 0, 1,
-0.9423659, 0.1349046, -2.337826, 0.8901961, 1, 0, 1,
-0.9404252, -0.1913367, -0.2529514, 0.8823529, 1, 0, 1,
-0.9352528, -1.642489, -3.582126, 0.8784314, 1, 0, 1,
-0.9250616, -1.387425, -1.032488, 0.8705882, 1, 0, 1,
-0.9244165, 0.6849757, 0.107444, 0.8666667, 1, 0, 1,
-0.9166197, 0.2319524, -1.261187, 0.8588235, 1, 0, 1,
-0.9048037, -1.129178, -1.583449, 0.854902, 1, 0, 1,
-0.904171, 2.392373, 0.7028201, 0.8470588, 1, 0, 1,
-0.9005015, 0.80755, -1.990572, 0.8431373, 1, 0, 1,
-0.8989235, 2.051565, -0.549849, 0.8352941, 1, 0, 1,
-0.8927316, 0.5680733, -0.1594778, 0.8313726, 1, 0, 1,
-0.8920898, 0.5033261, -0.4553262, 0.8235294, 1, 0, 1,
-0.8901725, -0.7010903, -2.795914, 0.8196079, 1, 0, 1,
-0.8901551, 1.208946, -1.060506, 0.8117647, 1, 0, 1,
-0.8893117, -1.055858, -1.804847, 0.8078431, 1, 0, 1,
-0.8861735, 0.4695019, -2.285961, 0.8, 1, 0, 1,
-0.8848997, 0.8373114, -1.004881, 0.7921569, 1, 0, 1,
-0.8797641, 0.2329757, -1.743848, 0.7882353, 1, 0, 1,
-0.8772901, 0.8743581, -0.7882023, 0.7803922, 1, 0, 1,
-0.8685958, 2.551736, 1.05607, 0.7764706, 1, 0, 1,
-0.8653225, -1.125723, -2.267596, 0.7686275, 1, 0, 1,
-0.8647791, -0.778683, -2.377349, 0.7647059, 1, 0, 1,
-0.8638129, 2.104426, 1.207846, 0.7568628, 1, 0, 1,
-0.8553057, 0.08706489, -2.016723, 0.7529412, 1, 0, 1,
-0.8527285, -1.209519, -1.920558, 0.7450981, 1, 0, 1,
-0.8491967, -2.097777, -3.412969, 0.7411765, 1, 0, 1,
-0.848351, -0.1688199, -1.992685, 0.7333333, 1, 0, 1,
-0.8416044, 0.5469223, -0.7128639, 0.7294118, 1, 0, 1,
-0.8407992, 0.4974924, -1.698327, 0.7215686, 1, 0, 1,
-0.8371093, -0.1866347, -3.513779, 0.7176471, 1, 0, 1,
-0.8346381, -1.093695, -1.587564, 0.7098039, 1, 0, 1,
-0.834564, -0.7257014, -1.293514, 0.7058824, 1, 0, 1,
-0.8340501, -0.8375213, -0.103973, 0.6980392, 1, 0, 1,
-0.8313993, -1.903029, -3.461775, 0.6901961, 1, 0, 1,
-0.8238549, 0.007265507, -0.5714049, 0.6862745, 1, 0, 1,
-0.8200486, -1.110546, -5.418313, 0.6784314, 1, 0, 1,
-0.8188056, -1.047237, -1.580656, 0.6745098, 1, 0, 1,
-0.8183918, -0.5496848, -2.767009, 0.6666667, 1, 0, 1,
-0.8171225, -0.8442406, 0.3707639, 0.6627451, 1, 0, 1,
-0.815798, -0.5267209, -1.266445, 0.654902, 1, 0, 1,
-0.8123843, -0.2129548, -1.596879, 0.6509804, 1, 0, 1,
-0.8096608, -0.08123148, -2.137179, 0.6431373, 1, 0, 1,
-0.8036349, -0.4912862, -1.268991, 0.6392157, 1, 0, 1,
-0.801514, -0.556138, -1.58555, 0.6313726, 1, 0, 1,
-0.801309, 0.1918167, -2.822132, 0.627451, 1, 0, 1,
-0.7876883, 0.8729526, -0.3022134, 0.6196079, 1, 0, 1,
-0.7856801, 0.1523419, -0.8678546, 0.6156863, 1, 0, 1,
-0.7792971, -1.806115, -2.555091, 0.6078432, 1, 0, 1,
-0.7783899, 0.6865653, -0.5353971, 0.6039216, 1, 0, 1,
-0.7735308, 0.1593764, -0.707095, 0.5960785, 1, 0, 1,
-0.772631, 0.09204565, -1.314713, 0.5882353, 1, 0, 1,
-0.7629492, 1.105435, -2.330816, 0.5843138, 1, 0, 1,
-0.7621677, 1.224783, -1.631155, 0.5764706, 1, 0, 1,
-0.7559262, 0.03612062, 0.03284977, 0.572549, 1, 0, 1,
-0.7508191, -0.2520241, -1.656782, 0.5647059, 1, 0, 1,
-0.7483999, 0.9580257, -1.414025, 0.5607843, 1, 0, 1,
-0.7464592, 0.821336, -2.145097, 0.5529412, 1, 0, 1,
-0.7422681, -0.8322088, -2.508897, 0.5490196, 1, 0, 1,
-0.7376816, 0.1663879, -1.926354, 0.5411765, 1, 0, 1,
-0.7364195, -0.7844362, -2.526103, 0.5372549, 1, 0, 1,
-0.7346069, -1.486883, -2.45755, 0.5294118, 1, 0, 1,
-0.7342126, 1.423967, -0.4754136, 0.5254902, 1, 0, 1,
-0.73232, 0.3705358, -2.783097, 0.5176471, 1, 0, 1,
-0.7303993, 1.080097, 1.503606, 0.5137255, 1, 0, 1,
-0.7302001, -0.5560157, -2.669562, 0.5058824, 1, 0, 1,
-0.7225131, 1.252278, 0.6873193, 0.5019608, 1, 0, 1,
-0.7222565, -1.373533, -3.015808, 0.4941176, 1, 0, 1,
-0.7165811, 0.3593693, -0.3867227, 0.4862745, 1, 0, 1,
-0.7165757, 1.915544, -0.9649071, 0.4823529, 1, 0, 1,
-0.7159799, -1.397703, -5.1212, 0.4745098, 1, 0, 1,
-0.7124894, 0.1071097, -1.626063, 0.4705882, 1, 0, 1,
-0.7101237, 0.05581997, -1.995737, 0.4627451, 1, 0, 1,
-0.7070515, -1.246773, -4.048661, 0.4588235, 1, 0, 1,
-0.7067006, -1.269014, -2.887583, 0.4509804, 1, 0, 1,
-0.6991402, 1.196679, -0.6552413, 0.4470588, 1, 0, 1,
-0.6976447, 1.304667, -1.43293, 0.4392157, 1, 0, 1,
-0.6971716, -0.720513, -3.76082, 0.4352941, 1, 0, 1,
-0.6963142, -2.254816, -1.601063, 0.427451, 1, 0, 1,
-0.6953388, -0.4793485, -3.31175, 0.4235294, 1, 0, 1,
-0.6931774, -0.5624208, -1.413664, 0.4156863, 1, 0, 1,
-0.69149, -0.3771598, -3.42744, 0.4117647, 1, 0, 1,
-0.6858653, -2.349953, -1.997206, 0.4039216, 1, 0, 1,
-0.6801348, -2.581234, -2.831546, 0.3960784, 1, 0, 1,
-0.6789771, -0.3447753, -0.844622, 0.3921569, 1, 0, 1,
-0.6741969, 0.4035579, -1.473685, 0.3843137, 1, 0, 1,
-0.6652963, -0.9416693, -4.335922, 0.3803922, 1, 0, 1,
-0.66229, -1.520865, -3.653383, 0.372549, 1, 0, 1,
-0.6610578, 0.0140615, 0.02304981, 0.3686275, 1, 0, 1,
-0.6605347, 0.4091588, -1.409328, 0.3607843, 1, 0, 1,
-0.6567899, 1.175094, -0.1454395, 0.3568628, 1, 0, 1,
-0.6495147, 0.0771291, -0.2643191, 0.3490196, 1, 0, 1,
-0.6454738, 0.4967249, -0.01895236, 0.345098, 1, 0, 1,
-0.6361551, 0.6913546, -0.7763994, 0.3372549, 1, 0, 1,
-0.6349068, -0.4764941, -3.561985, 0.3333333, 1, 0, 1,
-0.6339174, 1.191041, -0.5061934, 0.3254902, 1, 0, 1,
-0.6172978, 0.222197, 0.1820471, 0.3215686, 1, 0, 1,
-0.6163781, -0.2846845, -1.304836, 0.3137255, 1, 0, 1,
-0.6160489, 0.7841568, -0.2430406, 0.3098039, 1, 0, 1,
-0.6153576, 0.5934969, -0.7506614, 0.3019608, 1, 0, 1,
-0.612649, 0.1285297, -0.7768041, 0.2941177, 1, 0, 1,
-0.6121166, -0.8446648, -1.79087, 0.2901961, 1, 0, 1,
-0.6110928, 0.3161774, -0.2320242, 0.282353, 1, 0, 1,
-0.6070361, 1.398997, -0.01027956, 0.2784314, 1, 0, 1,
-0.5923644, 0.3517488, -1.571059, 0.2705882, 1, 0, 1,
-0.5911462, 3.363725, 0.7431903, 0.2666667, 1, 0, 1,
-0.5874419, 0.1401217, -1.729632, 0.2588235, 1, 0, 1,
-0.5842581, -1.270148, -3.782056, 0.254902, 1, 0, 1,
-0.5829025, 1.400634, 0.3717323, 0.2470588, 1, 0, 1,
-0.5731971, 0.3600242, -1.694168, 0.2431373, 1, 0, 1,
-0.5699179, -0.8241441, -1.246933, 0.2352941, 1, 0, 1,
-0.5673077, 1.646944, 0.4624868, 0.2313726, 1, 0, 1,
-0.5652437, -1.903992, -2.654715, 0.2235294, 1, 0, 1,
-0.5562665, -0.1936566, -3.519052, 0.2196078, 1, 0, 1,
-0.5559513, 0.3387528, -0.5622966, 0.2117647, 1, 0, 1,
-0.5552168, -1.664545, -3.528507, 0.2078431, 1, 0, 1,
-0.5529501, -0.2762113, -0.4691031, 0.2, 1, 0, 1,
-0.5401478, -2.386533, -3.532087, 0.1921569, 1, 0, 1,
-0.5336064, -0.8858937, -2.117468, 0.1882353, 1, 0, 1,
-0.5283881, -1.644731, -1.872308, 0.1803922, 1, 0, 1,
-0.5274943, 0.7642166, -0.7723447, 0.1764706, 1, 0, 1,
-0.5221398, 0.2121828, -2.012698, 0.1686275, 1, 0, 1,
-0.5218293, -0.8098527, -3.411011, 0.1647059, 1, 0, 1,
-0.5152871, -0.5761741, -3.642641, 0.1568628, 1, 0, 1,
-0.5142428, 1.134392, -1.638288, 0.1529412, 1, 0, 1,
-0.5140062, -1.01611, -2.375751, 0.145098, 1, 0, 1,
-0.513721, -1.536677, 0.08975949, 0.1411765, 1, 0, 1,
-0.5103466, -0.09051745, -2.765643, 0.1333333, 1, 0, 1,
-0.5070842, -1.610848, -1.782491, 0.1294118, 1, 0, 1,
-0.5052509, 0.2754541, 0.0534342, 0.1215686, 1, 0, 1,
-0.5028657, -1.096662, -2.513604, 0.1176471, 1, 0, 1,
-0.5019204, -0.1819354, -1.921911, 0.1098039, 1, 0, 1,
-0.5002596, -1.862995, -3.479369, 0.1058824, 1, 0, 1,
-0.4993158, -0.6841871, -3.883338, 0.09803922, 1, 0, 1,
-0.4990964, 0.07008778, 0.1114905, 0.09019608, 1, 0, 1,
-0.4965706, 0.02971553, -1.332644, 0.08627451, 1, 0, 1,
-0.4925599, 0.9669952, -1.75099, 0.07843138, 1, 0, 1,
-0.490595, -2.335276, -2.74452, 0.07450981, 1, 0, 1,
-0.4890528, -0.2425523, -3.228101, 0.06666667, 1, 0, 1,
-0.480263, -0.1101216, -1.405507, 0.0627451, 1, 0, 1,
-0.4773998, -0.6751744, -2.383188, 0.05490196, 1, 0, 1,
-0.474759, 0.9955812, -0.2923426, 0.05098039, 1, 0, 1,
-0.4732325, -0.0193577, 0.236831, 0.04313726, 1, 0, 1,
-0.4705577, -1.238487, -0.3154463, 0.03921569, 1, 0, 1,
-0.4704269, -1.503761, -0.6365157, 0.03137255, 1, 0, 1,
-0.4631312, 0.5016048, 0.555106, 0.02745098, 1, 0, 1,
-0.4591275, -0.01825694, -2.453467, 0.01960784, 1, 0, 1,
-0.4554131, -0.2613033, -1.408131, 0.01568628, 1, 0, 1,
-0.4540524, 0.9668601, -1.288741, 0.007843138, 1, 0, 1,
-0.4531804, 0.07041179, -0.5009646, 0.003921569, 1, 0, 1,
-0.4528062, 0.2575542, -0.9241237, 0, 1, 0.003921569, 1,
-0.4510242, -0.7505565, -6.364529, 0, 1, 0.01176471, 1,
-0.4427621, 0.9938833, -1.340959, 0, 1, 0.01568628, 1,
-0.4417244, -0.4366007, -3.91003, 0, 1, 0.02352941, 1,
-0.4318653, 1.777246, -0.7835813, 0, 1, 0.02745098, 1,
-0.4193259, 0.8163116, 0.4845793, 0, 1, 0.03529412, 1,
-0.4171317, -0.0919813, -0.9582673, 0, 1, 0.03921569, 1,
-0.4169008, 1.174636, -2.046662, 0, 1, 0.04705882, 1,
-0.4136375, 1.082173, 1.173055, 0, 1, 0.05098039, 1,
-0.4129686, -1.087414, -2.898199, 0, 1, 0.05882353, 1,
-0.4109096, 1.413808, 2.277268, 0, 1, 0.0627451, 1,
-0.4105434, -0.5416923, -2.918311, 0, 1, 0.07058824, 1,
-0.4088533, 0.1945671, -0.9032027, 0, 1, 0.07450981, 1,
-0.403702, -0.4025977, -2.469549, 0, 1, 0.08235294, 1,
-0.4032458, -1.057329, -2.742698, 0, 1, 0.08627451, 1,
-0.4019483, -0.6257517, -3.525243, 0, 1, 0.09411765, 1,
-0.395359, 1.873951, 0.5239659, 0, 1, 0.1019608, 1,
-0.3830628, 0.5828762, -1.940553, 0, 1, 0.1058824, 1,
-0.3829439, 0.678677, -1.476938, 0, 1, 0.1137255, 1,
-0.3797713, -0.7773176, -2.562559, 0, 1, 0.1176471, 1,
-0.3794302, 0.02286225, -2.454036, 0, 1, 0.1254902, 1,
-0.378672, -1.182487, -1.44132, 0, 1, 0.1294118, 1,
-0.3722083, -0.2923267, 0.08602631, 0, 1, 0.1372549, 1,
-0.3703712, 0.7926617, 1.461331, 0, 1, 0.1411765, 1,
-0.3683962, 1.709231, 0.03983118, 0, 1, 0.1490196, 1,
-0.3659489, -0.2564688, -3.646844, 0, 1, 0.1529412, 1,
-0.3642077, 0.2512581, -2.433158, 0, 1, 0.1607843, 1,
-0.3614874, -1.511281, -3.222052, 0, 1, 0.1647059, 1,
-0.3612091, -0.2612802, -1.394563, 0, 1, 0.172549, 1,
-0.352637, 1.039697, -2.174902, 0, 1, 0.1764706, 1,
-0.3522823, 0.8808243, -0.6762386, 0, 1, 0.1843137, 1,
-0.3507017, 0.05990392, -0.4040685, 0, 1, 0.1882353, 1,
-0.3494212, 1.281052, 1.390971, 0, 1, 0.1960784, 1,
-0.3485004, -1.437523, -3.21115, 0, 1, 0.2039216, 1,
-0.3450746, -0.5794116, -3.238402, 0, 1, 0.2078431, 1,
-0.340919, 0.2317769, -2.125304, 0, 1, 0.2156863, 1,
-0.3406034, -1.063152, -2.253667, 0, 1, 0.2196078, 1,
-0.3389519, 1.548466, -1.287751, 0, 1, 0.227451, 1,
-0.3327875, 1.755366, -0.1839104, 0, 1, 0.2313726, 1,
-0.3300981, 1.698327, -0.5055474, 0, 1, 0.2392157, 1,
-0.3293783, 0.3315848, -0.301936, 0, 1, 0.2431373, 1,
-0.3286678, -0.1176614, -1.669798, 0, 1, 0.2509804, 1,
-0.3185124, -0.4449356, -3.130307, 0, 1, 0.254902, 1,
-0.3058583, -0.02757253, -1.045091, 0, 1, 0.2627451, 1,
-0.3052648, 0.2242937, -1.027424, 0, 1, 0.2666667, 1,
-0.3019634, 0.5195815, -0.8555226, 0, 1, 0.2745098, 1,
-0.3015793, -0.8061922, -2.97891, 0, 1, 0.2784314, 1,
-0.2936618, -0.5348095, -3.591907, 0, 1, 0.2862745, 1,
-0.2918983, -0.6544533, -1.644701, 0, 1, 0.2901961, 1,
-0.2918482, -1.197509, -2.498655, 0, 1, 0.2980392, 1,
-0.290905, 2.915417, -0.5343332, 0, 1, 0.3058824, 1,
-0.2892235, -1.654912, -4.196605, 0, 1, 0.3098039, 1,
-0.2878146, 1.351076, -0.8069603, 0, 1, 0.3176471, 1,
-0.2869184, 0.9456246, 0.992398, 0, 1, 0.3215686, 1,
-0.2823832, 1.483791, -0.8363892, 0, 1, 0.3294118, 1,
-0.2808531, 0.6421474, -0.6767122, 0, 1, 0.3333333, 1,
-0.2808437, -0.1712197, -0.9419852, 0, 1, 0.3411765, 1,
-0.2757924, 0.02991395, -1.52309, 0, 1, 0.345098, 1,
-0.2754011, -0.0645281, -2.223839, 0, 1, 0.3529412, 1,
-0.2748005, -0.7474288, -2.771072, 0, 1, 0.3568628, 1,
-0.27339, 1.566712, -1.460444, 0, 1, 0.3647059, 1,
-0.2703458, -0.9956775, -1.740021, 0, 1, 0.3686275, 1,
-0.2689043, 0.7872016, -1.404661, 0, 1, 0.3764706, 1,
-0.268365, -0.6488423, -1.077941, 0, 1, 0.3803922, 1,
-0.2664771, -0.8599312, -1.938239, 0, 1, 0.3882353, 1,
-0.2646371, -0.9591543, -0.7457637, 0, 1, 0.3921569, 1,
-0.2620058, 0.0166966, -0.2159048, 0, 1, 0.4, 1,
-0.261614, -1.557729, -2.326491, 0, 1, 0.4078431, 1,
-0.2551168, -1.788579, -1.639366, 0, 1, 0.4117647, 1,
-0.2551113, 0.2474747, -1.860863, 0, 1, 0.4196078, 1,
-0.2548591, -0.1012571, -0.7341714, 0, 1, 0.4235294, 1,
-0.254517, -0.665727, -2.263395, 0, 1, 0.4313726, 1,
-0.2535397, -0.6680272, -1.273067, 0, 1, 0.4352941, 1,
-0.2532838, 0.08518135, -2.352685, 0, 1, 0.4431373, 1,
-0.2508608, -0.3395, -4.300272, 0, 1, 0.4470588, 1,
-0.2502009, -1.2837, -3.942753, 0, 1, 0.454902, 1,
-0.2447052, -2.161598, -5.705177, 0, 1, 0.4588235, 1,
-0.2421084, -0.7855636, -1.96958, 0, 1, 0.4666667, 1,
-0.2415085, 0.1678526, -2.158933, 0, 1, 0.4705882, 1,
-0.2414423, -1.090839, -4.508414, 0, 1, 0.4784314, 1,
-0.2396892, 0.3964126, 0.06612843, 0, 1, 0.4823529, 1,
-0.2385968, 0.9886277, -1.244266, 0, 1, 0.4901961, 1,
-0.2379799, -0.9615281, -3.225589, 0, 1, 0.4941176, 1,
-0.2367611, -0.2396234, -4.254055, 0, 1, 0.5019608, 1,
-0.234402, -1.123358, -2.549326, 0, 1, 0.509804, 1,
-0.2327613, -1.509897, -3.803654, 0, 1, 0.5137255, 1,
-0.2317476, 0.1383049, -2.188893, 0, 1, 0.5215687, 1,
-0.2303194, 0.5732716, -0.387236, 0, 1, 0.5254902, 1,
-0.2260134, 0.1314708, -1.020076, 0, 1, 0.5333334, 1,
-0.2235691, -0.3396528, -3.776856, 0, 1, 0.5372549, 1,
-0.2181053, -0.3816984, -1.985499, 0, 1, 0.5450981, 1,
-0.2169366, -0.172341, -2.7768, 0, 1, 0.5490196, 1,
-0.21431, -0.6223769, -2.811914, 0, 1, 0.5568628, 1,
-0.2130427, -0.224813, -2.459649, 0, 1, 0.5607843, 1,
-0.2126345, 1.623124, -0.7088048, 0, 1, 0.5686275, 1,
-0.2116507, -0.9430602, -4.155663, 0, 1, 0.572549, 1,
-0.2102605, -1.123498, -1.926217, 0, 1, 0.5803922, 1,
-0.2094288, 1.57626, -0.7453484, 0, 1, 0.5843138, 1,
-0.2079364, 0.2244074, 1.061697, 0, 1, 0.5921569, 1,
-0.2042587, 0.1550335, -1.566554, 0, 1, 0.5960785, 1,
-0.2024951, 0.3494109, -1.476912, 0, 1, 0.6039216, 1,
-0.1996311, 0.1276217, -1.579138, 0, 1, 0.6117647, 1,
-0.1991456, -0.3859377, -1.667955, 0, 1, 0.6156863, 1,
-0.1962492, -0.09187197, -2.07996, 0, 1, 0.6235294, 1,
-0.1934372, -1.32961, -0.8055661, 0, 1, 0.627451, 1,
-0.1902553, -0.05476614, 0.01123634, 0, 1, 0.6352941, 1,
-0.1894624, -1.023648, -2.041991, 0, 1, 0.6392157, 1,
-0.1881864, -1.764569, -1.781317, 0, 1, 0.6470588, 1,
-0.1843803, 0.9245111, 0.9456558, 0, 1, 0.6509804, 1,
-0.1834333, -0.06845631, -1.399737, 0, 1, 0.6588235, 1,
-0.1741886, 0.3536001, -0.4519861, 0, 1, 0.6627451, 1,
-0.1736916, 2.44013, -0.4197555, 0, 1, 0.6705883, 1,
-0.1728694, -1.184147, -5.294906, 0, 1, 0.6745098, 1,
-0.1725097, -0.1876014, -0.8115471, 0, 1, 0.682353, 1,
-0.1690214, 1.271749, 0.5952158, 0, 1, 0.6862745, 1,
-0.1680852, -0.1987821, -3.480786, 0, 1, 0.6941177, 1,
-0.166091, -0.2744581, -2.395612, 0, 1, 0.7019608, 1,
-0.165669, -1.115415, -1.783955, 0, 1, 0.7058824, 1,
-0.1640261, -0.3838641, -2.300056, 0, 1, 0.7137255, 1,
-0.1633977, 0.2881988, -1.409934, 0, 1, 0.7176471, 1,
-0.1592259, -0.6280039, -2.457462, 0, 1, 0.7254902, 1,
-0.1577153, -0.4620981, -4.43325, 0, 1, 0.7294118, 1,
-0.1575896, -1.508744, -1.049723, 0, 1, 0.7372549, 1,
-0.1571411, -0.6328114, -2.153233, 0, 1, 0.7411765, 1,
-0.1567226, -1.073062, -2.594395, 0, 1, 0.7490196, 1,
-0.1563118, 0.09456208, -1.233493, 0, 1, 0.7529412, 1,
-0.1557664, 0.2599272, -1.233446, 0, 1, 0.7607843, 1,
-0.1544375, -1.555609, -3.342911, 0, 1, 0.7647059, 1,
-0.147103, 2.153212, 1.881771, 0, 1, 0.772549, 1,
-0.1414084, 0.2881128, 0.1060499, 0, 1, 0.7764706, 1,
-0.1368033, -0.7468953, -2.285378, 0, 1, 0.7843137, 1,
-0.1366247, -0.664708, -3.563145, 0, 1, 0.7882353, 1,
-0.1363969, 0.2792922, -1.290379, 0, 1, 0.7960784, 1,
-0.1341357, -0.09068932, -2.080955, 0, 1, 0.8039216, 1,
-0.1317215, -0.8539143, -2.184459, 0, 1, 0.8078431, 1,
-0.1227864, 0.2527797, -0.1550083, 0, 1, 0.8156863, 1,
-0.1196774, -0.2768019, -3.353105, 0, 1, 0.8196079, 1,
-0.1176317, 0.6068959, 1.361177, 0, 1, 0.827451, 1,
-0.1171353, -0.3802218, -4.516791, 0, 1, 0.8313726, 1,
-0.1128281, -0.4895269, -4.261353, 0, 1, 0.8392157, 1,
-0.1056882, 0.1903189, -1.11528, 0, 1, 0.8431373, 1,
-0.1035742, -0.2944232, -2.814919, 0, 1, 0.8509804, 1,
-0.1024684, 0.1608979, -0.1052939, 0, 1, 0.854902, 1,
-0.1016206, -2.292991, -2.78849, 0, 1, 0.8627451, 1,
-0.0984113, -1.566558, -5.044118, 0, 1, 0.8666667, 1,
-0.07913897, 0.9908336, 0.1039064, 0, 1, 0.8745098, 1,
-0.07436803, 1.315056, -0.5385476, 0, 1, 0.8784314, 1,
-0.06625126, 1.260712, -0.8757092, 0, 1, 0.8862745, 1,
-0.06290752, -0.1299537, -2.06667, 0, 1, 0.8901961, 1,
-0.06284396, 0.4389302, -0.1511545, 0, 1, 0.8980392, 1,
-0.06277725, 0.5863585, -0.9479434, 0, 1, 0.9058824, 1,
-0.06194548, -0.2441886, -4.49461, 0, 1, 0.9098039, 1,
-0.05884502, 1.937873, 0.08878244, 0, 1, 0.9176471, 1,
-0.05663694, 0.1645305, 0.1377338, 0, 1, 0.9215686, 1,
-0.05522121, 1.311576, 0.1712079, 0, 1, 0.9294118, 1,
-0.05381738, -0.05246726, -0.9949638, 0, 1, 0.9333333, 1,
-0.04867609, 0.2159929, -2.084897, 0, 1, 0.9411765, 1,
-0.04131455, -0.01370096, -0.7792202, 0, 1, 0.945098, 1,
-0.03858244, 2.038441, -0.7613178, 0, 1, 0.9529412, 1,
-0.03514796, -0.8401641, -2.533361, 0, 1, 0.9568627, 1,
-0.02743224, -0.3456003, -4.206334, 0, 1, 0.9647059, 1,
-0.01726402, 0.3454652, -0.1031919, 0, 1, 0.9686275, 1,
-0.0155899, 0.6084145, -1.47705, 0, 1, 0.9764706, 1,
-0.01424179, 0.3410036, -0.01031191, 0, 1, 0.9803922, 1,
-0.009155575, 0.1958249, 1.991717, 0, 1, 0.9882353, 1,
-0.007973409, 0.03456535, 0.07803495, 0, 1, 0.9921569, 1,
-0.007870967, 0.8121448, 1.235594, 0, 1, 1, 1,
-0.006663257, -0.5021807, -3.482679, 0, 0.9921569, 1, 1,
-0.002012067, 0.8846512, 1.150437, 0, 0.9882353, 1, 1,
-0.001125241, -0.1755063, -1.625219, 0, 0.9803922, 1, 1,
-0.0008868024, -0.9969088, -4.526421, 0, 0.9764706, 1, 1,
-0.0002808165, -0.4745855, -4.094862, 0, 0.9686275, 1, 1,
-0.0001154402, -0.6672438, -3.080742, 0, 0.9647059, 1, 1,
0.002303566, -0.5328394, 2.897806, 0, 0.9568627, 1, 1,
0.004685716, -0.47735, 4.788869, 0, 0.9529412, 1, 1,
0.006098993, 1.971222, -0.3269459, 0, 0.945098, 1, 1,
0.01018474, -0.05495852, 3.160984, 0, 0.9411765, 1, 1,
0.01062335, -0.7419968, 3.6272, 0, 0.9333333, 1, 1,
0.01215864, 0.1551577, 1.56977, 0, 0.9294118, 1, 1,
0.01349286, -0.8065235, 2.378166, 0, 0.9215686, 1, 1,
0.01499594, 1.706257, -0.161259, 0, 0.9176471, 1, 1,
0.01785913, 0.9058954, 0.8791938, 0, 0.9098039, 1, 1,
0.01815383, -0.3903582, 1.738698, 0, 0.9058824, 1, 1,
0.02059629, -1.77913, 3.700453, 0, 0.8980392, 1, 1,
0.02320233, 1.446666, -0.5484401, 0, 0.8901961, 1, 1,
0.02606099, 1.428437, 1.318161, 0, 0.8862745, 1, 1,
0.02812446, -0.1153599, 3.946418, 0, 0.8784314, 1, 1,
0.02987236, 0.5092993, -0.6210684, 0, 0.8745098, 1, 1,
0.03066786, -0.3413783, 2.218087, 0, 0.8666667, 1, 1,
0.03219206, -0.8406605, 2.816638, 0, 0.8627451, 1, 1,
0.03420158, 1.098905, -1.723306, 0, 0.854902, 1, 1,
0.03469259, 0.4739255, -0.7440864, 0, 0.8509804, 1, 1,
0.03581724, -0.1124598, 3.050609, 0, 0.8431373, 1, 1,
0.03782834, -2.254372, 3.53447, 0, 0.8392157, 1, 1,
0.04051456, 0.1028615, 0.167233, 0, 0.8313726, 1, 1,
0.04054199, 0.8415388, 0.2412172, 0, 0.827451, 1, 1,
0.04665795, 1.398504, -0.3108064, 0, 0.8196079, 1, 1,
0.05522257, -0.05798148, 2.203844, 0, 0.8156863, 1, 1,
0.05725957, 0.1129738, 0.5334329, 0, 0.8078431, 1, 1,
0.0573623, -0.2814032, 2.932151, 0, 0.8039216, 1, 1,
0.06392848, -1.871414, 2.892284, 0, 0.7960784, 1, 1,
0.06493343, 0.9069448, -1.271472, 0, 0.7882353, 1, 1,
0.06567553, 0.40146, 0.6333547, 0, 0.7843137, 1, 1,
0.06648233, 0.5706378, 0.368223, 0, 0.7764706, 1, 1,
0.06831984, -0.1361023, 3.260568, 0, 0.772549, 1, 1,
0.06889465, 0.7978007, -0.2044942, 0, 0.7647059, 1, 1,
0.06898852, -1.464884, 3.952914, 0, 0.7607843, 1, 1,
0.07567482, -1.115049, 3.260502, 0, 0.7529412, 1, 1,
0.07658226, 1.920312, 0.1161077, 0, 0.7490196, 1, 1,
0.08033718, -0.3740237, 1.492107, 0, 0.7411765, 1, 1,
0.08971489, -0.3992395, 2.41216, 0, 0.7372549, 1, 1,
0.08980916, -0.1805355, 4.203638, 0, 0.7294118, 1, 1,
0.09099481, 1.229553, -0.3150894, 0, 0.7254902, 1, 1,
0.0918605, -0.3911523, 4.836188, 0, 0.7176471, 1, 1,
0.09230946, -0.06696222, 1.331904, 0, 0.7137255, 1, 1,
0.09364454, -1.02479, 4.174623, 0, 0.7058824, 1, 1,
0.09540857, 0.6798987, -1.032305, 0, 0.6980392, 1, 1,
0.104662, 0.2440403, 0.4386314, 0, 0.6941177, 1, 1,
0.108092, 0.631299, 0.1103679, 0, 0.6862745, 1, 1,
0.1085231, -1.500845, 2.401997, 0, 0.682353, 1, 1,
0.1099453, 0.2689997, 1.196285, 0, 0.6745098, 1, 1,
0.1147192, -0.396472, 1.198297, 0, 0.6705883, 1, 1,
0.1175022, 0.3943832, 0.1454709, 0, 0.6627451, 1, 1,
0.1184435, -0.9604571, 2.812537, 0, 0.6588235, 1, 1,
0.1186495, -0.604149, 3.768761, 0, 0.6509804, 1, 1,
0.1186832, -0.3819823, 2.152243, 0, 0.6470588, 1, 1,
0.1223383, -1.211557, 3.004314, 0, 0.6392157, 1, 1,
0.1268264, -0.3418724, 2.735693, 0, 0.6352941, 1, 1,
0.1275202, -0.2466494, 2.429704, 0, 0.627451, 1, 1,
0.1300469, 1.066946, -1.469578, 0, 0.6235294, 1, 1,
0.1303364, 1.244546, 1.143075, 0, 0.6156863, 1, 1,
0.1307122, -0.7882066, 2.7586, 0, 0.6117647, 1, 1,
0.1317464, 0.5510654, 0.9816215, 0, 0.6039216, 1, 1,
0.1333574, 2.093557, 1.365427, 0, 0.5960785, 1, 1,
0.1351026, -1.164879, 3.047568, 0, 0.5921569, 1, 1,
0.1353967, 1.605336, -1.685603, 0, 0.5843138, 1, 1,
0.1369528, -0.3884426, 3.026699, 0, 0.5803922, 1, 1,
0.1374361, -1.972785, 3.873221, 0, 0.572549, 1, 1,
0.1383142, -1.173448, -0.173622, 0, 0.5686275, 1, 1,
0.1392534, 1.015499, -0.5507783, 0, 0.5607843, 1, 1,
0.1422533, 1.033761, 1.367391, 0, 0.5568628, 1, 1,
0.1449088, -1.236554, 2.058266, 0, 0.5490196, 1, 1,
0.1478163, -1.212651, 2.63017, 0, 0.5450981, 1, 1,
0.1480593, 0.4482428, 0.9229243, 0, 0.5372549, 1, 1,
0.1494497, 0.290811, 0.7878608, 0, 0.5333334, 1, 1,
0.1506372, -1.520717, 0.6722596, 0, 0.5254902, 1, 1,
0.1509716, 1.359865, -0.3183533, 0, 0.5215687, 1, 1,
0.1518069, 1.090019, -0.6251485, 0, 0.5137255, 1, 1,
0.1518681, 1.994781, 1.095005, 0, 0.509804, 1, 1,
0.1527488, 0.1145848, 1.408815, 0, 0.5019608, 1, 1,
0.1532754, 1.449174, -1.578533, 0, 0.4941176, 1, 1,
0.1550054, 0.2957751, -0.6425354, 0, 0.4901961, 1, 1,
0.1554672, 0.0122852, -0.5026729, 0, 0.4823529, 1, 1,
0.1598746, 0.866698, 1.587132, 0, 0.4784314, 1, 1,
0.1606149, -0.5116053, 3.59429, 0, 0.4705882, 1, 1,
0.1642974, 0.6870365, -0.9380046, 0, 0.4666667, 1, 1,
0.1658626, -2.393329, 2.046457, 0, 0.4588235, 1, 1,
0.1687926, 3.011841, 0.110753, 0, 0.454902, 1, 1,
0.1765116, -0.5082488, 2.097029, 0, 0.4470588, 1, 1,
0.1772057, 0.3195004, 1.995774, 0, 0.4431373, 1, 1,
0.1776363, -1.176744, 3.007656, 0, 0.4352941, 1, 1,
0.1821586, -1.244025, 2.992808, 0, 0.4313726, 1, 1,
0.1839652, -0.5837787, 0.8571, 0, 0.4235294, 1, 1,
0.1915157, -1.951666, 4.239299, 0, 0.4196078, 1, 1,
0.1923133, -1.478758, 1.896088, 0, 0.4117647, 1, 1,
0.1954023, 0.2403298, 0.9032441, 0, 0.4078431, 1, 1,
0.1959194, 0.7089054, -0.02976456, 0, 0.4, 1, 1,
0.1963516, 0.390525, 1.352692, 0, 0.3921569, 1, 1,
0.2017912, 0.5730657, 1.120641, 0, 0.3882353, 1, 1,
0.206572, -0.1302204, 3.502159, 0, 0.3803922, 1, 1,
0.2080262, 0.396968, 0.5349234, 0, 0.3764706, 1, 1,
0.2115785, -1.280716, 3.342083, 0, 0.3686275, 1, 1,
0.2134818, 0.8451889, 0.560809, 0, 0.3647059, 1, 1,
0.2150871, -0.233173, 3.773521, 0, 0.3568628, 1, 1,
0.2163616, -1.010195, 3.204039, 0, 0.3529412, 1, 1,
0.2165941, 1.93351, -1.417935, 0, 0.345098, 1, 1,
0.2174046, -1.310151, 4.297064, 0, 0.3411765, 1, 1,
0.2191119, 0.2756929, 1.345678, 0, 0.3333333, 1, 1,
0.2220812, 0.3076221, 1.995075, 0, 0.3294118, 1, 1,
0.2226862, -0.9838081, 3.275643, 0, 0.3215686, 1, 1,
0.222878, -0.2290557, 2.739088, 0, 0.3176471, 1, 1,
0.2235465, -0.9290557, 2.415626, 0, 0.3098039, 1, 1,
0.2239156, 1.326315, -0.1311052, 0, 0.3058824, 1, 1,
0.2252264, 0.02338722, 2.872581, 0, 0.2980392, 1, 1,
0.2259681, 0.09180145, 2.195731, 0, 0.2901961, 1, 1,
0.2259835, 0.3552375, 0.683841, 0, 0.2862745, 1, 1,
0.2282214, 0.7716637, 0.56431, 0, 0.2784314, 1, 1,
0.2285658, -0.8039067, 0.9827387, 0, 0.2745098, 1, 1,
0.2312889, -0.2295086, 3.51225, 0, 0.2666667, 1, 1,
0.2352335, 1.269865, -0.5987484, 0, 0.2627451, 1, 1,
0.235945, -0.01173961, 2.580305, 0, 0.254902, 1, 1,
0.2507501, 0.2530372, 1.490781, 0, 0.2509804, 1, 1,
0.2515799, 1.323858, 4.07242, 0, 0.2431373, 1, 1,
0.2521086, 0.8258059, 1.388061, 0, 0.2392157, 1, 1,
0.2535836, -0.9905148, 1.96311, 0, 0.2313726, 1, 1,
0.2547074, -1.086117, 5.1146, 0, 0.227451, 1, 1,
0.2547177, -0.7129737, 2.843321, 0, 0.2196078, 1, 1,
0.2588668, -1.847807, 3.084253, 0, 0.2156863, 1, 1,
0.2603741, -0.8055869, 4.147085, 0, 0.2078431, 1, 1,
0.2617336, -2.295743, 3.113756, 0, 0.2039216, 1, 1,
0.2637032, 0.08435231, 1.433205, 0, 0.1960784, 1, 1,
0.2656235, -1.226652, 3.168567, 0, 0.1882353, 1, 1,
0.2668468, 1.058144, -0.4103174, 0, 0.1843137, 1, 1,
0.2672637, 0.7158777, -0.08711772, 0, 0.1764706, 1, 1,
0.2682059, -0.4714246, 4.570251, 0, 0.172549, 1, 1,
0.2726051, -1.908003, 2.360227, 0, 0.1647059, 1, 1,
0.2731501, -0.8843423, 2.910331, 0, 0.1607843, 1, 1,
0.274275, 1.118311, -0.4173087, 0, 0.1529412, 1, 1,
0.2748462, 0.9486501, 0.5888116, 0, 0.1490196, 1, 1,
0.2754044, -0.2304548, 3.0674, 0, 0.1411765, 1, 1,
0.277394, -0.4478649, 2.275892, 0, 0.1372549, 1, 1,
0.2815522, 0.663936, 0.8109584, 0, 0.1294118, 1, 1,
0.2902197, 0.4294042, 2.527683, 0, 0.1254902, 1, 1,
0.2907974, -0.9095654, 2.981083, 0, 0.1176471, 1, 1,
0.2935259, -0.4797006, 2.711232, 0, 0.1137255, 1, 1,
0.2944514, 0.2292099, 1.159323, 0, 0.1058824, 1, 1,
0.2949524, 0.4945768, 0.6571724, 0, 0.09803922, 1, 1,
0.2954254, -0.5828023, 1.889856, 0, 0.09411765, 1, 1,
0.2978233, 0.3165374, 1.33264, 0, 0.08627451, 1, 1,
0.2990012, -1.772771, 1.852726, 0, 0.08235294, 1, 1,
0.3025312, 1.021128, -1.40039, 0, 0.07450981, 1, 1,
0.3051455, -0.8814142, 1.801877, 0, 0.07058824, 1, 1,
0.3074369, -1.106629, 1.734598, 0, 0.0627451, 1, 1,
0.3151269, -1.830535, 3.00021, 0, 0.05882353, 1, 1,
0.3164628, -0.2439592, 1.42947, 0, 0.05098039, 1, 1,
0.3189596, 0.7200949, 0.3432042, 0, 0.04705882, 1, 1,
0.3201871, -0.3751228, 3.712807, 0, 0.03921569, 1, 1,
0.320711, -0.06535319, 2.121259, 0, 0.03529412, 1, 1,
0.3216665, -0.3232236, 2.982462, 0, 0.02745098, 1, 1,
0.3261309, -0.3033142, 2.834633, 0, 0.02352941, 1, 1,
0.3267971, -0.6850091, 1.671871, 0, 0.01568628, 1, 1,
0.329997, 0.6018329, 1.0504, 0, 0.01176471, 1, 1,
0.3311949, 0.4813515, -1.133809, 0, 0.003921569, 1, 1,
0.3341487, -1.450753, 1.732075, 0.003921569, 0, 1, 1,
0.3379505, 0.2213915, 2.497723, 0.007843138, 0, 1, 1,
0.3466464, 1.668473, 0.8372177, 0.01568628, 0, 1, 1,
0.3467707, 1.68009, 0.2330931, 0.01960784, 0, 1, 1,
0.34678, 1.871008, -0.5065455, 0.02745098, 0, 1, 1,
0.3478123, 0.2307073, 1.50255, 0.03137255, 0, 1, 1,
0.3513681, 0.7984188, 0.6781105, 0.03921569, 0, 1, 1,
0.362805, 0.3451256, 2.004927, 0.04313726, 0, 1, 1,
0.3659698, -1.984461, 0.8615562, 0.05098039, 0, 1, 1,
0.3708769, 1.254378, 0.2538461, 0.05490196, 0, 1, 1,
0.3797117, -0.2677697, 1.186584, 0.0627451, 0, 1, 1,
0.3811409, -1.236252, 2.200447, 0.06666667, 0, 1, 1,
0.3815716, 1.461919, 1.39755, 0.07450981, 0, 1, 1,
0.383915, 0.8160381, 2.010188, 0.07843138, 0, 1, 1,
0.3972173, 0.8142969, -1.916314, 0.08627451, 0, 1, 1,
0.3978397, -1.157097, 4.971209, 0.09019608, 0, 1, 1,
0.4045221, 0.8076081, 0.2163087, 0.09803922, 0, 1, 1,
0.4067483, 0.9019589, 1.860782, 0.1058824, 0, 1, 1,
0.4077222, -0.5935053, 1.489057, 0.1098039, 0, 1, 1,
0.4103869, 0.7544742, 1.666979, 0.1176471, 0, 1, 1,
0.4204024, 0.5598808, 0.9453316, 0.1215686, 0, 1, 1,
0.4333979, 0.3515352, 0.7224548, 0.1294118, 0, 1, 1,
0.4342015, 1.22254, 0.8131317, 0.1333333, 0, 1, 1,
0.4351745, -0.3445796, 0.5170972, 0.1411765, 0, 1, 1,
0.4403403, 2.475596, -1.680779, 0.145098, 0, 1, 1,
0.4417764, 1.484565, 1.143074, 0.1529412, 0, 1, 1,
0.4422476, -0.2726932, 2.116367, 0.1568628, 0, 1, 1,
0.4469932, -0.6018139, 2.40582, 0.1647059, 0, 1, 1,
0.4517887, 0.9492112, 0.1404548, 0.1686275, 0, 1, 1,
0.4564339, -0.02537227, 2.056282, 0.1764706, 0, 1, 1,
0.4591378, 1.195071, 0.532756, 0.1803922, 0, 1, 1,
0.459755, 0.5701092, -0.9021513, 0.1882353, 0, 1, 1,
0.461772, 0.5179269, -0.2489768, 0.1921569, 0, 1, 1,
0.4630495, 0.06433608, 1.262209, 0.2, 0, 1, 1,
0.4666798, 0.3393366, 0.7073058, 0.2078431, 0, 1, 1,
0.4679683, 1.703342, 0.2610293, 0.2117647, 0, 1, 1,
0.4682604, 1.004298, 1.313002, 0.2196078, 0, 1, 1,
0.4685019, -2.128356, 3.143995, 0.2235294, 0, 1, 1,
0.4697476, 0.2020451, 0.7181999, 0.2313726, 0, 1, 1,
0.476069, -0.1593636, 1.736645, 0.2352941, 0, 1, 1,
0.4771538, -0.5570676, 2.22837, 0.2431373, 0, 1, 1,
0.4850814, -2.145451, 3.748765, 0.2470588, 0, 1, 1,
0.4853641, -2.146109, 2.37183, 0.254902, 0, 1, 1,
0.486205, 0.5470903, 1.622009, 0.2588235, 0, 1, 1,
0.4900676, -0.4576392, 2.242745, 0.2666667, 0, 1, 1,
0.5029093, -0.6317208, 2.982397, 0.2705882, 0, 1, 1,
0.5033489, 1.706021, 0.2935869, 0.2784314, 0, 1, 1,
0.5076706, 0.6939473, 0.8563403, 0.282353, 0, 1, 1,
0.5164918, -0.5000171, 1.406629, 0.2901961, 0, 1, 1,
0.5208193, -0.4033127, -0.1953176, 0.2941177, 0, 1, 1,
0.5257854, 1.191797, -0.2100829, 0.3019608, 0, 1, 1,
0.5264279, -0.4837705, 2.733442, 0.3098039, 0, 1, 1,
0.5281129, 1.554825, 1.964794, 0.3137255, 0, 1, 1,
0.534307, -0.7447177, 1.007778, 0.3215686, 0, 1, 1,
0.5353073, 0.03502341, 0.3057896, 0.3254902, 0, 1, 1,
0.5407898, 0.376476, -0.1178716, 0.3333333, 0, 1, 1,
0.5431964, 0.09219197, 1.724205, 0.3372549, 0, 1, 1,
0.5441628, 0.1268014, 0.08406302, 0.345098, 0, 1, 1,
0.544718, 0.7034138, 2.974458, 0.3490196, 0, 1, 1,
0.5455004, -0.4377843, 3.43937, 0.3568628, 0, 1, 1,
0.547433, 0.7761408, 1.765729, 0.3607843, 0, 1, 1,
0.5505822, 0.9182199, -0.1645579, 0.3686275, 0, 1, 1,
0.5545745, -0.3780201, 2.89856, 0.372549, 0, 1, 1,
0.5545822, 1.276197, 0.6669625, 0.3803922, 0, 1, 1,
0.5555751, 0.8965716, 0.3475046, 0.3843137, 0, 1, 1,
0.5576627, 1.060634, 1.558865, 0.3921569, 0, 1, 1,
0.5578066, -0.4336555, 1.769693, 0.3960784, 0, 1, 1,
0.5592026, 1.096332, 1.791736, 0.4039216, 0, 1, 1,
0.5645042, 1.095539, 0.9400564, 0.4117647, 0, 1, 1,
0.56601, -0.7492394, 3.37418, 0.4156863, 0, 1, 1,
0.5660254, -0.6951646, 4.079223, 0.4235294, 0, 1, 1,
0.569702, 0.2438917, 2.088979, 0.427451, 0, 1, 1,
0.5713298, 0.5853953, 1.374142, 0.4352941, 0, 1, 1,
0.573584, 1.220306, -1.173327, 0.4392157, 0, 1, 1,
0.5805788, 0.4036299, -0.3732219, 0.4470588, 0, 1, 1,
0.5834193, 0.7200699, 1.693294, 0.4509804, 0, 1, 1,
0.5836523, -0.2235775, 2.222091, 0.4588235, 0, 1, 1,
0.5897353, -0.4184178, 2.742636, 0.4627451, 0, 1, 1,
0.5903563, 0.3483822, 0.7283303, 0.4705882, 0, 1, 1,
0.5928567, 1.181784, 1.218591, 0.4745098, 0, 1, 1,
0.6138268, 0.7975037, 0.4232545, 0.4823529, 0, 1, 1,
0.6254373, -0.4019164, 2.206463, 0.4862745, 0, 1, 1,
0.6325526, 0.6674176, 1.202341, 0.4941176, 0, 1, 1,
0.6335083, 0.4246524, 1.044459, 0.5019608, 0, 1, 1,
0.6368475, -0.5262371, 2.53407, 0.5058824, 0, 1, 1,
0.6376434, -1.032604, 3.172737, 0.5137255, 0, 1, 1,
0.6455398, -0.6039832, 3.99297, 0.5176471, 0, 1, 1,
0.6466301, 0.1599979, 0.9574599, 0.5254902, 0, 1, 1,
0.6507078, 0.07042759, 1.471563, 0.5294118, 0, 1, 1,
0.6526529, 1.081696, 0.3366908, 0.5372549, 0, 1, 1,
0.6533384, 1.331214, 1.995287, 0.5411765, 0, 1, 1,
0.6561873, -1.015269, 3.329475, 0.5490196, 0, 1, 1,
0.6584027, 0.1802473, 2.170854, 0.5529412, 0, 1, 1,
0.660567, 0.3250222, 0.6949504, 0.5607843, 0, 1, 1,
0.6649762, 1.824149, 0.2331466, 0.5647059, 0, 1, 1,
0.6658957, 0.9850146, 1.982958, 0.572549, 0, 1, 1,
0.6689596, -1.367124, 2.941537, 0.5764706, 0, 1, 1,
0.6720982, 0.9329827, 0.9409152, 0.5843138, 0, 1, 1,
0.6728024, 1.230115, -0.4322344, 0.5882353, 0, 1, 1,
0.6805017, -0.0441031, 3.269925, 0.5960785, 0, 1, 1,
0.6934849, 0.02572099, 0.3827623, 0.6039216, 0, 1, 1,
0.6966237, -1.043617, 1.654431, 0.6078432, 0, 1, 1,
0.6974906, -1.61705, 1.583686, 0.6156863, 0, 1, 1,
0.709887, 2.062781, 0.2142429, 0.6196079, 0, 1, 1,
0.7150362, -0.3506476, 2.700711, 0.627451, 0, 1, 1,
0.7240375, 0.3901713, 2.057358, 0.6313726, 0, 1, 1,
0.7244938, 0.991267, 1.097916, 0.6392157, 0, 1, 1,
0.7254424, 0.8816435, 1.887945, 0.6431373, 0, 1, 1,
0.7266011, 0.9275649, -1.329306, 0.6509804, 0, 1, 1,
0.7282253, -1.041738, 1.659069, 0.654902, 0, 1, 1,
0.7309, -0.3928892, 3.537947, 0.6627451, 0, 1, 1,
0.7313387, 0.4086261, 1.18659, 0.6666667, 0, 1, 1,
0.7357624, 1.709858, -0.07920823, 0.6745098, 0, 1, 1,
0.736371, 0.9274228, 0.7530116, 0.6784314, 0, 1, 1,
0.737671, 1.374155, 0.8776148, 0.6862745, 0, 1, 1,
0.7443486, 2.118729, -1.693789, 0.6901961, 0, 1, 1,
0.7495653, -1.050538, 3.147669, 0.6980392, 0, 1, 1,
0.7527968, -0.6245716, 3.178925, 0.7058824, 0, 1, 1,
0.7545728, -0.2926062, 1.465042, 0.7098039, 0, 1, 1,
0.7559267, -1.247481, 2.370712, 0.7176471, 0, 1, 1,
0.7626087, 0.8649131, 0.9177919, 0.7215686, 0, 1, 1,
0.7671138, 1.493688, -0.358913, 0.7294118, 0, 1, 1,
0.7721257, -0.2522794, -0.8367956, 0.7333333, 0, 1, 1,
0.7722508, -0.1612351, 1.844102, 0.7411765, 0, 1, 1,
0.7800872, -1.328967, 2.073309, 0.7450981, 0, 1, 1,
0.780198, 1.254269, -1.079416, 0.7529412, 0, 1, 1,
0.784324, -1.272888, 2.686563, 0.7568628, 0, 1, 1,
0.7865763, 1.3042, 0.2669584, 0.7647059, 0, 1, 1,
0.7888055, -0.2503956, 1.208612, 0.7686275, 0, 1, 1,
0.7910384, -0.4505151, 0.4597297, 0.7764706, 0, 1, 1,
0.7950788, -0.5858158, 3.10122, 0.7803922, 0, 1, 1,
0.7955368, -0.7700289, 1.708896, 0.7882353, 0, 1, 1,
0.7961685, 1.630166, 0.7067225, 0.7921569, 0, 1, 1,
0.7988388, -0.3815035, 1.037899, 0.8, 0, 1, 1,
0.8041801, 0.6497232, 2.349634, 0.8078431, 0, 1, 1,
0.8116657, 0.5164086, 1.366107, 0.8117647, 0, 1, 1,
0.8155962, 0.09406183, 3.724169, 0.8196079, 0, 1, 1,
0.8196204, -0.005947995, 1.850647, 0.8235294, 0, 1, 1,
0.8237348, 0.8219519, 0.8412294, 0.8313726, 0, 1, 1,
0.8361511, -0.5165933, 2.752236, 0.8352941, 0, 1, 1,
0.838282, -0.8464118, 0.2879999, 0.8431373, 0, 1, 1,
0.8391967, -0.2446723, 1.139629, 0.8470588, 0, 1, 1,
0.8421162, -0.2003681, 2.084278, 0.854902, 0, 1, 1,
0.8583125, 0.487566, 1.187266, 0.8588235, 0, 1, 1,
0.8587598, -0.1645389, 2.022204, 0.8666667, 0, 1, 1,
0.8605686, -0.5430804, 1.234352, 0.8705882, 0, 1, 1,
0.8616209, -1.451968, -0.00249808, 0.8784314, 0, 1, 1,
0.8667254, -1.351309, 1.997157, 0.8823529, 0, 1, 1,
0.8744186, -0.7097612, 2.335862, 0.8901961, 0, 1, 1,
0.8810435, -2.349244, 3.419281, 0.8941177, 0, 1, 1,
0.8839553, -1.321243, 2.536571, 0.9019608, 0, 1, 1,
0.892274, -1.199593, 2.105628, 0.9098039, 0, 1, 1,
0.9035464, 0.2718365, 1.540259, 0.9137255, 0, 1, 1,
0.923363, 1.702692, -0.3219842, 0.9215686, 0, 1, 1,
0.9253895, 0.8832966, 0.7031618, 0.9254902, 0, 1, 1,
0.927125, 1.561999, 0.3810468, 0.9333333, 0, 1, 1,
0.9293604, 0.7569833, 0.3211251, 0.9372549, 0, 1, 1,
0.9336194, 0.8148416, 2.17374, 0.945098, 0, 1, 1,
0.9339236, -1.272674, 3.960704, 0.9490196, 0, 1, 1,
0.9416794, 0.3688224, 0.07158589, 0.9568627, 0, 1, 1,
0.9478816, -0.04622704, 0.459011, 0.9607843, 0, 1, 1,
0.9546402, -1.497117, 0.7556891, 0.9686275, 0, 1, 1,
0.9572669, 0.4206873, 0.03469639, 0.972549, 0, 1, 1,
0.9618949, 0.5961518, -0.4372963, 0.9803922, 0, 1, 1,
0.962207, 0.06988581, 2.070963, 0.9843137, 0, 1, 1,
0.9644271, -0.4028201, 3.195176, 0.9921569, 0, 1, 1,
0.9720639, 1.173308, 2.3109, 0.9960784, 0, 1, 1,
0.9751869, 0.7503694, 1.264933, 1, 0, 0.9960784, 1,
0.9789909, 2.812591, -0.6946734, 1, 0, 0.9882353, 1,
0.9842452, -1.216073, 1.547776, 1, 0, 0.9843137, 1,
0.985588, 0.3636398, 2.084388, 1, 0, 0.9764706, 1,
0.9855905, -0.6407384, 4.084183, 1, 0, 0.972549, 1,
0.9881206, -1.950467, 0.6628665, 1, 0, 0.9647059, 1,
0.9905987, 0.4244118, 2.914973, 1, 0, 0.9607843, 1,
0.9953955, -1.213172, 2.4299, 1, 0, 0.9529412, 1,
1.007451, -1.948033, 1.137253, 1, 0, 0.9490196, 1,
1.007666, -0.1621263, 1.68293, 1, 0, 0.9411765, 1,
1.01234, 0.824176, 0.5945034, 1, 0, 0.9372549, 1,
1.014691, -1.21564, 1.599755, 1, 0, 0.9294118, 1,
1.01777, 0.2605183, 1.474326, 1, 0, 0.9254902, 1,
1.017944, -0.9800745, 0.7046601, 1, 0, 0.9176471, 1,
1.019515, 0.4205741, 0.2051794, 1, 0, 0.9137255, 1,
1.019593, -0.8583832, 2.255276, 1, 0, 0.9058824, 1,
1.025053, -0.298117, 3.385847, 1, 0, 0.9019608, 1,
1.028179, 0.185485, 2.063209, 1, 0, 0.8941177, 1,
1.039176, 2.693494, -1.742196, 1, 0, 0.8862745, 1,
1.051458, 0.9044529, 1.712131, 1, 0, 0.8823529, 1,
1.06528, -0.5642067, 2.156579, 1, 0, 0.8745098, 1,
1.073392, -0.5072968, 2.477365, 1, 0, 0.8705882, 1,
1.080472, -0.04098613, 2.245205, 1, 0, 0.8627451, 1,
1.081664, 0.01545911, 1.487521, 1, 0, 0.8588235, 1,
1.082376, -0.6760225, 2.838365, 1, 0, 0.8509804, 1,
1.085143, -1.048241, 2.299055, 1, 0, 0.8470588, 1,
1.086116, -1.047623, 3.311952, 1, 0, 0.8392157, 1,
1.098979, -0.1722795, 1.053586, 1, 0, 0.8352941, 1,
1.101153, 0.5130118, 2.136267, 1, 0, 0.827451, 1,
1.102563, 0.09813824, 0.3298874, 1, 0, 0.8235294, 1,
1.108122, -0.5728011, 2.832067, 1, 0, 0.8156863, 1,
1.113143, 0.3970328, 1.340492, 1, 0, 0.8117647, 1,
1.114581, 2.666246, 1.058041, 1, 0, 0.8039216, 1,
1.118955, 0.3146475, 1.707678, 1, 0, 0.7960784, 1,
1.120162, 0.5430879, 1.801114, 1, 0, 0.7921569, 1,
1.122205, 1.455311, 0.4506123, 1, 0, 0.7843137, 1,
1.132561, -0.1826121, 0.9201021, 1, 0, 0.7803922, 1,
1.149877, 0.1314025, 0.4588856, 1, 0, 0.772549, 1,
1.157233, -0.7126403, 0.6276851, 1, 0, 0.7686275, 1,
1.160612, 0.1458759, 0.3431231, 1, 0, 0.7607843, 1,
1.161118, 0.2443711, 1.658234, 1, 0, 0.7568628, 1,
1.165605, -1.008699, 0.7296007, 1, 0, 0.7490196, 1,
1.174279, 0.4650034, -0.8227325, 1, 0, 0.7450981, 1,
1.174316, 0.6698855, 2.035401, 1, 0, 0.7372549, 1,
1.185509, 1.780314, 0.3908238, 1, 0, 0.7333333, 1,
1.190557, 0.7302612, 1.742676, 1, 0, 0.7254902, 1,
1.202957, 1.480877, 0.07737309, 1, 0, 0.7215686, 1,
1.204262, -1.523065, 1.670717, 1, 0, 0.7137255, 1,
1.206813, 1.193165, -1.081365, 1, 0, 0.7098039, 1,
1.209061, 0.7492329, 1.337014, 1, 0, 0.7019608, 1,
1.228852, -2.56511, 2.669494, 1, 0, 0.6941177, 1,
1.235037, -0.8271081, 0.2963987, 1, 0, 0.6901961, 1,
1.244175, 0.1697204, 1.455517, 1, 0, 0.682353, 1,
1.249032, 1.129182, -0.4504161, 1, 0, 0.6784314, 1,
1.25733, 0.08679747, 1.299803, 1, 0, 0.6705883, 1,
1.258306, -0.5654935, 0.9213471, 1, 0, 0.6666667, 1,
1.267418, -0.7051604, 3.212741, 1, 0, 0.6588235, 1,
1.268196, -0.7802337, 2.746608, 1, 0, 0.654902, 1,
1.283001, 0.5078475, 2.189149, 1, 0, 0.6470588, 1,
1.283008, -1.965542, 2.26458, 1, 0, 0.6431373, 1,
1.28336, -0.899975, 2.406133, 1, 0, 0.6352941, 1,
1.297228, -1.196993, 2.291695, 1, 0, 0.6313726, 1,
1.298389, 0.961664, 0.5171468, 1, 0, 0.6235294, 1,
1.301523, 1.465168, 0.9044424, 1, 0, 0.6196079, 1,
1.303252, 0.2460736, 1.204206, 1, 0, 0.6117647, 1,
1.322704, -1.662546, 2.379939, 1, 0, 0.6078432, 1,
1.326092, -1.695513, 2.244444, 1, 0, 0.6, 1,
1.333997, -1.556099, 2.078722, 1, 0, 0.5921569, 1,
1.335781, 1.282908, 0.8497447, 1, 0, 0.5882353, 1,
1.336232, 0.07532475, 0.4711755, 1, 0, 0.5803922, 1,
1.342026, -0.8028595, 1.414979, 1, 0, 0.5764706, 1,
1.344839, 0.0467453, 0.9332007, 1, 0, 0.5686275, 1,
1.357514, -0.4306986, 2.258247, 1, 0, 0.5647059, 1,
1.359827, 1.831733, 1.098157, 1, 0, 0.5568628, 1,
1.360183, 0.7937024, 2.081465, 1, 0, 0.5529412, 1,
1.361716, -1.224486, 2.351448, 1, 0, 0.5450981, 1,
1.363222, -0.08490324, 2.164952, 1, 0, 0.5411765, 1,
1.365362, 0.1527429, 1.341859, 1, 0, 0.5333334, 1,
1.373572, 1.229334, 0.8995693, 1, 0, 0.5294118, 1,
1.374189, 2.008561, -0.8700246, 1, 0, 0.5215687, 1,
1.381471, -0.05590547, 1.088394, 1, 0, 0.5176471, 1,
1.38293, -0.2448599, 0.4286782, 1, 0, 0.509804, 1,
1.394309, 0.8464938, 1.604558, 1, 0, 0.5058824, 1,
1.397242, -0.2574823, 2.956808, 1, 0, 0.4980392, 1,
1.427903, -3.207988, 1.2349, 1, 0, 0.4901961, 1,
1.470048, -0.8238739, 1.020555, 1, 0, 0.4862745, 1,
1.477751, -0.114775, 1.326133, 1, 0, 0.4784314, 1,
1.479315, -2.135538, 2.223877, 1, 0, 0.4745098, 1,
1.496633, -0.7015385, 2.493721, 1, 0, 0.4666667, 1,
1.498668, 0.9210051, -0.5245491, 1, 0, 0.4627451, 1,
1.505644, 1.526008, -0.3144284, 1, 0, 0.454902, 1,
1.511381, 0.4247563, 0.7891055, 1, 0, 0.4509804, 1,
1.520642, 1.061242, 0.468609, 1, 0, 0.4431373, 1,
1.53626, 0.6117062, 2.825477, 1, 0, 0.4392157, 1,
1.553505, 2.178858, 0.4202846, 1, 0, 0.4313726, 1,
1.555966, -0.9352944, 1.797728, 1, 0, 0.427451, 1,
1.565589, 0.799068, 1.914061, 1, 0, 0.4196078, 1,
1.567744, -0.6996228, 0.5511023, 1, 0, 0.4156863, 1,
1.577602, -0.4460284, 0.7603217, 1, 0, 0.4078431, 1,
1.578905, -0.4655405, 3.320216, 1, 0, 0.4039216, 1,
1.596988, -0.2989121, 2.560884, 1, 0, 0.3960784, 1,
1.610891, -0.9560986, 3.093377, 1, 0, 0.3882353, 1,
1.627223, -1.651471, 1.86419, 1, 0, 0.3843137, 1,
1.630201, -0.4419069, 1.845948, 1, 0, 0.3764706, 1,
1.635253, -2.263225, 1.61291, 1, 0, 0.372549, 1,
1.661597, -0.6570618, 2.084992, 1, 0, 0.3647059, 1,
1.66545, -1.251869, 2.274747, 1, 0, 0.3607843, 1,
1.696601, -1.495677, 1.93894, 1, 0, 0.3529412, 1,
1.697132, -0.674472, 2.726061, 1, 0, 0.3490196, 1,
1.697436, 0.3853773, 0.5237483, 1, 0, 0.3411765, 1,
1.702993, -1.063848, 1.277768, 1, 0, 0.3372549, 1,
1.71807, -2.019938, 2.077659, 1, 0, 0.3294118, 1,
1.737584, -0.518783, 1.924378, 1, 0, 0.3254902, 1,
1.751083, -1.620639, 3.291193, 1, 0, 0.3176471, 1,
1.759059, -1.120529, 1.436943, 1, 0, 0.3137255, 1,
1.766081, 1.62591, 1.397631, 1, 0, 0.3058824, 1,
1.772781, 0.1461882, 2.689522, 1, 0, 0.2980392, 1,
1.773795, -1.236836, 2.126764, 1, 0, 0.2941177, 1,
1.775804, -1.172202, 0.01947932, 1, 0, 0.2862745, 1,
1.791175, -0.1019216, 1.22858, 1, 0, 0.282353, 1,
1.791311, 1.514174, -1.080945, 1, 0, 0.2745098, 1,
1.793689, -0.5374503, 2.689132, 1, 0, 0.2705882, 1,
1.797044, -0.8071508, 1.227446, 1, 0, 0.2627451, 1,
1.799075, 0.1927049, 1.980906, 1, 0, 0.2588235, 1,
1.810299, 0.8258131, 1.174757, 1, 0, 0.2509804, 1,
1.823729, -0.7070635, 1.072548, 1, 0, 0.2470588, 1,
1.826792, 0.321619, 1.535304, 1, 0, 0.2392157, 1,
1.830754, 0.4017252, 1.772728, 1, 0, 0.2352941, 1,
1.844566, 1.242455, 1.799986, 1, 0, 0.227451, 1,
1.84553, -1.650707, 2.997427, 1, 0, 0.2235294, 1,
1.852564, 0.3165004, 1.526528, 1, 0, 0.2156863, 1,
1.867263, 0.4162036, 1.858084, 1, 0, 0.2117647, 1,
1.88122, -1.458327, 1.528217, 1, 0, 0.2039216, 1,
1.894132, -0.1904202, -0.5593179, 1, 0, 0.1960784, 1,
1.907945, -2.98191, 2.931072, 1, 0, 0.1921569, 1,
1.930643, 1.510504, 1.523129, 1, 0, 0.1843137, 1,
1.993231, 1.350041, 0.6893999, 1, 0, 0.1803922, 1,
1.994281, -0.6329628, 1.68564, 1, 0, 0.172549, 1,
1.998067, 0.8019122, -0.3810626, 1, 0, 0.1686275, 1,
2.011434, -0.3781335, 1.286046, 1, 0, 0.1607843, 1,
2.043579, 1.61259, 1.821548, 1, 0, 0.1568628, 1,
2.052238, -0.8881186, 0.3275776, 1, 0, 0.1490196, 1,
2.052476, 0.3002782, 1.026293, 1, 0, 0.145098, 1,
2.053822, -1.708868, 1.155368, 1, 0, 0.1372549, 1,
2.072005, 0.07832085, 2.252936, 1, 0, 0.1333333, 1,
2.092363, 1.060622, 2.593673, 1, 0, 0.1254902, 1,
2.131148, 0.5685087, 1.745468, 1, 0, 0.1215686, 1,
2.136616, 1.515388, 1.49631, 1, 0, 0.1137255, 1,
2.138858, 0.006104051, 0.4185529, 1, 0, 0.1098039, 1,
2.139149, -2.506755, 4.464607, 1, 0, 0.1019608, 1,
2.161052, 0.2020371, 2.054797, 1, 0, 0.09411765, 1,
2.163319, -0.1133364, -0.5050601, 1, 0, 0.09019608, 1,
2.167318, -0.4086713, 0.09548367, 1, 0, 0.08235294, 1,
2.203897, 1.865264, 1.429454, 1, 0, 0.07843138, 1,
2.239395, -0.1750751, 1.951714, 1, 0, 0.07058824, 1,
2.290802, -0.8548016, 0.7897489, 1, 0, 0.06666667, 1,
2.3031, 0.5077252, 1.167554, 1, 0, 0.05882353, 1,
2.408223, -0.9674577, 3.663468, 1, 0, 0.05490196, 1,
2.471789, -0.2735741, 2.167476, 1, 0, 0.04705882, 1,
2.518924, 0.5913798, 1.115614, 1, 0, 0.04313726, 1,
2.524196, 0.717742, 2.226271, 1, 0, 0.03529412, 1,
2.64506, 1.817484, 1.129127, 1, 0, 0.03137255, 1,
2.767192, 0.5621132, 1.540797, 1, 0, 0.02352941, 1,
2.876012, 0.1890188, 0.6498645, 1, 0, 0.01960784, 1,
2.973452, 0.7897109, -0.4121521, 1, 0, 0.01176471, 1,
3.229406, 1.499493, 2.276109, 1, 0, 0.007843138, 1
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
-0.06145144, -4.321893, -8.310242, 0, -0.5, 0.5, 0.5,
-0.06145144, -4.321893, -8.310242, 1, -0.5, 0.5, 0.5,
-0.06145144, -4.321893, -8.310242, 1, 1.5, 0.5, 0.5,
-0.06145144, -4.321893, -8.310242, 0, 1.5, 0.5, 0.5
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
-4.46791, 0.0778687, -8.310242, 0, -0.5, 0.5, 0.5,
-4.46791, 0.0778687, -8.310242, 1, -0.5, 0.5, 0.5,
-4.46791, 0.0778687, -8.310242, 1, 1.5, 0.5, 0.5,
-4.46791, 0.0778687, -8.310242, 0, 1.5, 0.5, 0.5
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
-4.46791, -4.321893, -0.6249645, 0, -0.5, 0.5, 0.5,
-4.46791, -4.321893, -0.6249645, 1, -0.5, 0.5, 0.5,
-4.46791, -4.321893, -0.6249645, 1, 1.5, 0.5, 0.5,
-4.46791, -4.321893, -0.6249645, 0, 1.5, 0.5, 0.5
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
-3, -3.306563, -6.536716,
3, -3.306563, -6.536716,
-3, -3.306563, -6.536716,
-3, -3.475785, -6.832304,
-2, -3.306563, -6.536716,
-2, -3.475785, -6.832304,
-1, -3.306563, -6.536716,
-1, -3.475785, -6.832304,
0, -3.306563, -6.536716,
0, -3.475785, -6.832304,
1, -3.306563, -6.536716,
1, -3.475785, -6.832304,
2, -3.306563, -6.536716,
2, -3.475785, -6.832304,
3, -3.306563, -6.536716,
3, -3.475785, -6.832304
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
-3, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
-3, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
-3, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
-3, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
-2, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
-2, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
-2, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
-2, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
-1, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
-1, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
-1, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
-1, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
0, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
0, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
0, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
0, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
1, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
1, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
1, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
1, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
2, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
2, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
2, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
2, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5,
3, -3.814228, -7.423479, 0, -0.5, 0.5, 0.5,
3, -3.814228, -7.423479, 1, -0.5, 0.5, 0.5,
3, -3.814228, -7.423479, 1, 1.5, 0.5, 0.5,
3, -3.814228, -7.423479, 0, 1.5, 0.5, 0.5
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
-3.451035, -3, -6.536716,
-3.451035, 3, -6.536716,
-3.451035, -3, -6.536716,
-3.620514, -3, -6.832304,
-3.451035, -2, -6.536716,
-3.620514, -2, -6.832304,
-3.451035, -1, -6.536716,
-3.620514, -1, -6.832304,
-3.451035, 0, -6.536716,
-3.620514, 0, -6.832304,
-3.451035, 1, -6.536716,
-3.620514, 1, -6.832304,
-3.451035, 2, -6.536716,
-3.620514, 2, -6.832304,
-3.451035, 3, -6.536716,
-3.620514, 3, -6.832304
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
-3.959472, -3, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, -3, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, -3, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, -3, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, -2, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, -2, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, -2, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, -2, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, -1, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, -1, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, -1, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, -1, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, 0, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, 0, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, 0, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, 0, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, 1, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, 1, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, 1, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, 1, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, 2, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, 2, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, 2, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, 2, -7.423479, 0, 1.5, 0.5, 0.5,
-3.959472, 3, -7.423479, 0, -0.5, 0.5, 0.5,
-3.959472, 3, -7.423479, 1, -0.5, 0.5, 0.5,
-3.959472, 3, -7.423479, 1, 1.5, 0.5, 0.5,
-3.959472, 3, -7.423479, 0, 1.5, 0.5, 0.5
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
-3.451035, -3.306563, -6,
-3.451035, -3.306563, 4,
-3.451035, -3.306563, -6,
-3.620514, -3.475785, -6,
-3.451035, -3.306563, -4,
-3.620514, -3.475785, -4,
-3.451035, -3.306563, -2,
-3.620514, -3.475785, -2,
-3.451035, -3.306563, 0,
-3.620514, -3.475785, 0,
-3.451035, -3.306563, 2,
-3.620514, -3.475785, 2,
-3.451035, -3.306563, 4,
-3.620514, -3.475785, 4
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
-3.959472, -3.814228, -6, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -6, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -6, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, -6, 0, 1.5, 0.5, 0.5,
-3.959472, -3.814228, -4, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -4, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -4, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, -4, 0, 1.5, 0.5, 0.5,
-3.959472, -3.814228, -2, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -2, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, -2, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, -2, 0, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 0, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 0, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 0, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 0, 0, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 2, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 2, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 2, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 2, 0, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 4, 0, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 4, 1, -0.5, 0.5, 0.5,
-3.959472, -3.814228, 4, 1, 1.5, 0.5, 0.5,
-3.959472, -3.814228, 4, 0, 1.5, 0.5, 0.5
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
-3.451035, -3.306563, -6.536716,
-3.451035, 3.462301, -6.536716,
-3.451035, -3.306563, 5.286787,
-3.451035, 3.462301, 5.286787,
-3.451035, -3.306563, -6.536716,
-3.451035, -3.306563, 5.286787,
-3.451035, 3.462301, -6.536716,
-3.451035, 3.462301, 5.286787,
-3.451035, -3.306563, -6.536716,
3.328132, -3.306563, -6.536716,
-3.451035, -3.306563, 5.286787,
3.328132, -3.306563, 5.286787,
-3.451035, 3.462301, -6.536716,
3.328132, 3.462301, -6.536716,
-3.451035, 3.462301, 5.286787,
3.328132, 3.462301, 5.286787,
3.328132, -3.306563, -6.536716,
3.328132, 3.462301, -6.536716,
3.328132, -3.306563, 5.286787,
3.328132, 3.462301, 5.286787,
3.328132, -3.306563, -6.536716,
3.328132, -3.306563, 5.286787,
3.328132, 3.462301, -6.536716,
3.328132, 3.462301, 5.286787
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
var radius = 8.125807;
var distance = 36.15263;
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
mvMatrix.translate( 0.06145144, -0.0778687, 0.6249645 );
mvMatrix.scale( 1.295997, 1.29797, 0.7430777 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15263);
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
Propargite<-read.table("Propargite.xyz")
```

```
## Error in read.table("Propargite.xyz"): no lines available in input
```

```r
x<-Propargite$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
y<-Propargite$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
z<-Propargite$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
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
-3.352309, 0.8074317, -1.82651, 0, 0, 1, 1, 1,
-3.015204, 0.3005233, 0.1358517, 1, 0, 0, 1, 1,
-2.897826, -0.4385807, -1.441059, 1, 0, 0, 1, 1,
-2.719991, -0.5873716, -1.037373, 1, 0, 0, 1, 1,
-2.627402, -0.4474339, -1.648612, 1, 0, 0, 1, 1,
-2.579584, -0.04187262, -0.1459882, 1, 0, 0, 1, 1,
-2.507495, 1.367213, 0.2399085, 0, 0, 0, 1, 1,
-2.330975, 0.04966044, -2.151319, 0, 0, 0, 1, 1,
-2.311684, 1.859462, -2.060572, 0, 0, 0, 1, 1,
-2.231386, -1.62815, -0.4489596, 0, 0, 0, 1, 1,
-2.210149, -0.4141838, -0.8507892, 0, 0, 0, 1, 1,
-2.195099, -0.4439617, -1.774903, 0, 0, 0, 1, 1,
-2.113343, 2.024787, -2.402174, 0, 0, 0, 1, 1,
-2.103594, 0.06010305, 1.343377, 1, 1, 1, 1, 1,
-2.09634, -0.2504161, -2.533516, 1, 1, 1, 1, 1,
-2.089459, 2.018552, 0.2747313, 1, 1, 1, 1, 1,
-2.08463, 0.643474, 0.4843481, 1, 1, 1, 1, 1,
-2.08078, 0.9172459, -2.010805, 1, 1, 1, 1, 1,
-2.059881, -0.3436732, -2.297532, 1, 1, 1, 1, 1,
-2.056083, 1.767386, -0.2217707, 1, 1, 1, 1, 1,
-2.053923, 0.8948523, -0.5779076, 1, 1, 1, 1, 1,
-2.050406, 0.4681994, -1.948793, 1, 1, 1, 1, 1,
-2.046325, 0.2638963, -1.924046, 1, 1, 1, 1, 1,
-1.989622, -1.059609, -2.623061, 1, 1, 1, 1, 1,
-1.957648, 0.07273523, -0.9142122, 1, 1, 1, 1, 1,
-1.954971, 1.082815, -0.7811503, 1, 1, 1, 1, 1,
-1.954793, 0.1176248, -2.282298, 1, 1, 1, 1, 1,
-1.94786, 0.2357184, -0.9983149, 1, 1, 1, 1, 1,
-1.927139, -0.6483667, -2.906682, 0, 0, 1, 1, 1,
-1.908372, -1.025633, -2.244576, 1, 0, 0, 1, 1,
-1.899615, -1.247965, -3.235644, 1, 0, 0, 1, 1,
-1.89238, -1.083128, -3.157377, 1, 0, 0, 1, 1,
-1.869636, 0.5102031, -0.02152532, 1, 0, 0, 1, 1,
-1.863256, 1.951458, -1.076715, 1, 0, 0, 1, 1,
-1.855539, -1.417857, -2.51486, 0, 0, 0, 1, 1,
-1.855405, -1.030268, -2.236236, 0, 0, 0, 1, 1,
-1.84029, 0.6553032, -0.7593203, 0, 0, 0, 1, 1,
-1.835957, 0.5008381, 0.132374, 0, 0, 0, 1, 1,
-1.831875, -0.02139634, -1.293267, 0, 0, 0, 1, 1,
-1.81942, 0.399705, -3.329152, 0, 0, 0, 1, 1,
-1.806096, -0.3990987, -1.588828, 0, 0, 0, 1, 1,
-1.794465, -0.3082107, 0.1032298, 1, 1, 1, 1, 1,
-1.791593, 0.2131205, -1.047418, 1, 1, 1, 1, 1,
-1.784479, 0.3562706, -0.6199145, 1, 1, 1, 1, 1,
-1.780977, -0.6028185, -1.437319, 1, 1, 1, 1, 1,
-1.737912, 2.284173, 0.4331613, 1, 1, 1, 1, 1,
-1.732002, 0.1562151, -0.1267751, 1, 1, 1, 1, 1,
-1.70167, 0.3082741, -1.875762, 1, 1, 1, 1, 1,
-1.69978, 0.2077435, -1.201772, 1, 1, 1, 1, 1,
-1.697186, -0.6747532, -2.631371, 1, 1, 1, 1, 1,
-1.683536, 1.021999, 0.09978802, 1, 1, 1, 1, 1,
-1.680884, -2.672543, -1.196879, 1, 1, 1, 1, 1,
-1.679466, -0.9503565, -2.507714, 1, 1, 1, 1, 1,
-1.657312, 0.06231749, -0.2103691, 1, 1, 1, 1, 1,
-1.649341, -1.178146, -1.769127, 1, 1, 1, 1, 1,
-1.630906, 0.7879028, -2.949453, 1, 1, 1, 1, 1,
-1.62293, -1.721257, -2.716169, 0, 0, 1, 1, 1,
-1.620586, 0.340603, -1.180692, 1, 0, 0, 1, 1,
-1.611894, 1.549227, -1.587452, 1, 0, 0, 1, 1,
-1.60854, 1.674197, -0.7522866, 1, 0, 0, 1, 1,
-1.608299, -0.1730189, -1.275008, 1, 0, 0, 1, 1,
-1.607831, 1.168534, -0.6196622, 1, 0, 0, 1, 1,
-1.603127, 0.03788354, -0.9702029, 0, 0, 0, 1, 1,
-1.601926, 0.8132612, -1.616559, 0, 0, 0, 1, 1,
-1.596466, 0.2201679, -1.636659, 0, 0, 0, 1, 1,
-1.591414, 0.9142565, -0.6163887, 0, 0, 0, 1, 1,
-1.581055, 0.1155843, -1.387345, 0, 0, 0, 1, 1,
-1.573962, -0.9212242, -3.273781, 0, 0, 0, 1, 1,
-1.572524, -1.650127, -4.402786, 0, 0, 0, 1, 1,
-1.566671, 2.035641, -0.9045734, 1, 1, 1, 1, 1,
-1.554427, 0.9333302, -0.1383875, 1, 1, 1, 1, 1,
-1.542345, -1.193855, -3.241225, 1, 1, 1, 1, 1,
-1.539214, -0.8899922, 0.1751209, 1, 1, 1, 1, 1,
-1.536597, -0.4394539, -2.069253, 1, 1, 1, 1, 1,
-1.535626, -0.1697101, -1.277139, 1, 1, 1, 1, 1,
-1.531838, -0.5247639, -1.461371, 1, 1, 1, 1, 1,
-1.52632, 0.5908308, -1.774873, 1, 1, 1, 1, 1,
-1.524882, 1.036291, 1.024918, 1, 1, 1, 1, 1,
-1.520864, 1.645909, -0.3192283, 1, 1, 1, 1, 1,
-1.517604, -0.6944947, -0.5729287, 1, 1, 1, 1, 1,
-1.507166, 0.5041715, -2.579722, 1, 1, 1, 1, 1,
-1.492837, -2.751747, -1.517936, 1, 1, 1, 1, 1,
-1.491115, -2.581001, -0.6985809, 1, 1, 1, 1, 1,
-1.483701, 0.9355538, -3.893305, 1, 1, 1, 1, 1,
-1.480282, 1.028203, -1.018744, 0, 0, 1, 1, 1,
-1.4777, 0.8432631, -1.167417, 1, 0, 0, 1, 1,
-1.470227, -0.1716395, -1.997057, 1, 0, 0, 1, 1,
-1.468667, 0.01519903, -1.802441, 1, 0, 0, 1, 1,
-1.437237, -0.1457694, -1.731223, 1, 0, 0, 1, 1,
-1.433318, -1.844066, -2.58337, 1, 0, 0, 1, 1,
-1.42698, 0.2899839, -1.424791, 0, 0, 0, 1, 1,
-1.422213, 0.8197817, -0.8852066, 0, 0, 0, 1, 1,
-1.416731, 0.4573949, -1.874983, 0, 0, 0, 1, 1,
-1.416446, -0.2505673, -1.668135, 0, 0, 0, 1, 1,
-1.412584, -1.166991, -3.008048, 0, 0, 0, 1, 1,
-1.411662, -0.2343995, -2.448092, 0, 0, 0, 1, 1,
-1.400314, 0.6382627, -3.633591, 0, 0, 0, 1, 1,
-1.395936, -0.7562979, -1.4117, 1, 1, 1, 1, 1,
-1.395338, 0.3125835, -2.247139, 1, 1, 1, 1, 1,
-1.390251, 1.518901, -0.08594899, 1, 1, 1, 1, 1,
-1.380397, -0.4041301, -1.786708, 1, 1, 1, 1, 1,
-1.378201, -1.08845, -1.342377, 1, 1, 1, 1, 1,
-1.377568, 0.7446884, -2.224931, 1, 1, 1, 1, 1,
-1.375155, 0.8650351, -1.184633, 1, 1, 1, 1, 1,
-1.358832, 0.9224733, -0.4057301, 1, 1, 1, 1, 1,
-1.339927, -1.469773, -1.885837, 1, 1, 1, 1, 1,
-1.33653, 1.161697, 0.6282381, 1, 1, 1, 1, 1,
-1.33548, 1.535189, -2.572171, 1, 1, 1, 1, 1,
-1.317443, -0.7435679, -0.3664806, 1, 1, 1, 1, 1,
-1.316849, -0.6987943, -1.554304, 1, 1, 1, 1, 1,
-1.313844, 1.18, -3.203475, 1, 1, 1, 1, 1,
-1.311267, -0.7259535, -1.152043, 1, 1, 1, 1, 1,
-1.297595, 0.5373456, -1.20202, 0, 0, 1, 1, 1,
-1.296268, 0.5305644, -2.174142, 1, 0, 0, 1, 1,
-1.292874, 0.5088281, -0.9317667, 1, 0, 0, 1, 1,
-1.289678, 0.07269081, -1.437918, 1, 0, 0, 1, 1,
-1.284967, 1.069157, -0.07538792, 1, 0, 0, 1, 1,
-1.28296, -1.440399, -3.054127, 1, 0, 0, 1, 1,
-1.280004, -0.4372986, -1.478073, 0, 0, 0, 1, 1,
-1.277972, 1.038574, 0.3555254, 0, 0, 0, 1, 1,
-1.268574, 0.3056752, -1.546823, 0, 0, 0, 1, 1,
-1.262607, 0.8604689, -1.933281, 0, 0, 0, 1, 1,
-1.262295, -0.3579741, -1.878166, 0, 0, 0, 1, 1,
-1.257927, 1.553834, -1.484027, 0, 0, 0, 1, 1,
-1.239758, 0.5944134, -1.268561, 0, 0, 0, 1, 1,
-1.235997, 0.9138357, -1.933658, 1, 1, 1, 1, 1,
-1.226754, 0.08500627, -2.279802, 1, 1, 1, 1, 1,
-1.211812, -0.3797891, -1.445981, 1, 1, 1, 1, 1,
-1.210312, 0.3233263, -0.496463, 1, 1, 1, 1, 1,
-1.205791, -0.7393531, -1.641067, 1, 1, 1, 1, 1,
-1.19851, -0.3082842, -2.509612, 1, 1, 1, 1, 1,
-1.196939, 1.42358, 0.276825, 1, 1, 1, 1, 1,
-1.191168, 0.1979581, -0.8459883, 1, 1, 1, 1, 1,
-1.188241, 1.495841, -1.710103, 1, 1, 1, 1, 1,
-1.174391, 0.2091781, -2.134948, 1, 1, 1, 1, 1,
-1.172967, 0.7080027, -0.5340828, 1, 1, 1, 1, 1,
-1.168239, 1.477449, -0.9704251, 1, 1, 1, 1, 1,
-1.158031, -0.9062021, -2.166958, 1, 1, 1, 1, 1,
-1.153414, 1.533456, 0.3461379, 1, 1, 1, 1, 1,
-1.147184, 0.7384704, -0.3093905, 1, 1, 1, 1, 1,
-1.134494, -0.08420461, -3.258134, 0, 0, 1, 1, 1,
-1.13242, 2.179436, -0.6893908, 1, 0, 0, 1, 1,
-1.131738, -1.379528, -3.998278, 1, 0, 0, 1, 1,
-1.117307, -0.4995877, -2.761791, 1, 0, 0, 1, 1,
-1.113416, 0.9193804, -2.456718, 1, 0, 0, 1, 1,
-1.112044, 0.5057802, -1.209148, 1, 0, 0, 1, 1,
-1.109861, 1.315046, -0.600964, 0, 0, 0, 1, 1,
-1.106917, 1.218747, -0.6420106, 0, 0, 0, 1, 1,
-1.099542, 0.02238927, -0.6407902, 0, 0, 0, 1, 1,
-1.099165, -1.603844, -2.04384, 0, 0, 0, 1, 1,
-1.091694, -0.3900706, -2.157146, 0, 0, 0, 1, 1,
-1.08863, -0.06472525, -1.363099, 0, 0, 0, 1, 1,
-1.08618, -0.4753709, -2.077677, 0, 0, 0, 1, 1,
-1.084854, 0.8180765, -2.167827, 1, 1, 1, 1, 1,
-1.082399, -0.5671462, -1.149471, 1, 1, 1, 1, 1,
-1.081894, 1.210839, -1.828817, 1, 1, 1, 1, 1,
-1.080564, 0.7775738, -0.9261821, 1, 1, 1, 1, 1,
-1.079827, 1.033392, -0.8724808, 1, 1, 1, 1, 1,
-1.073084, -1.044861, -1.346722, 1, 1, 1, 1, 1,
-1.071033, -1.60243, -2.446945, 1, 1, 1, 1, 1,
-1.064112, 0.4401397, -0.8077011, 1, 1, 1, 1, 1,
-1.061569, 0.04298477, -2.866148, 1, 1, 1, 1, 1,
-1.056033, -0.2217051, -1.956874, 1, 1, 1, 1, 1,
-1.053912, 0.1058341, -0.1102589, 1, 1, 1, 1, 1,
-1.041674, -0.2410753, -1.313532, 1, 1, 1, 1, 1,
-1.040212, -0.3371534, -1.628893, 1, 1, 1, 1, 1,
-1.039176, -0.2044792, -0.02481302, 1, 1, 1, 1, 1,
-1.027536, -0.6804191, -0.8001708, 1, 1, 1, 1, 1,
-1.025614, -0.09700473, -1.015092, 0, 0, 1, 1, 1,
-1.019588, 0.4701785, 1.054841, 1, 0, 0, 1, 1,
-1.008253, -0.6353796, -2.536274, 1, 0, 0, 1, 1,
-1.004735, -2.719146, -2.8389, 1, 0, 0, 1, 1,
-0.9912308, 2.332658, -1.53666, 1, 0, 0, 1, 1,
-0.9885628, -1.790405, -2.972258, 1, 0, 0, 1, 1,
-0.9857945, 1.285641, 0.438533, 0, 0, 0, 1, 1,
-0.9844516, -0.2509027, -1.981416, 0, 0, 0, 1, 1,
-0.9826566, -1.031752, -3.47876, 0, 0, 0, 1, 1,
-0.9727987, 0.8555768, -0.01295424, 0, 0, 0, 1, 1,
-0.9687282, -1.401225, -2.968954, 0, 0, 0, 1, 1,
-0.9669563, -1.481683, -3.089219, 0, 0, 0, 1, 1,
-0.9655796, 0.7620731, -1.483038, 0, 0, 0, 1, 1,
-0.9526952, 0.9519271, 0.09202944, 1, 1, 1, 1, 1,
-0.9506751, 0.01415615, -1.573884, 1, 1, 1, 1, 1,
-0.945749, 0.7177981, -2.064853, 1, 1, 1, 1, 1,
-0.9427186, 0.5449737, -3.014999, 1, 1, 1, 1, 1,
-0.9423659, 0.1349046, -2.337826, 1, 1, 1, 1, 1,
-0.9404252, -0.1913367, -0.2529514, 1, 1, 1, 1, 1,
-0.9352528, -1.642489, -3.582126, 1, 1, 1, 1, 1,
-0.9250616, -1.387425, -1.032488, 1, 1, 1, 1, 1,
-0.9244165, 0.6849757, 0.107444, 1, 1, 1, 1, 1,
-0.9166197, 0.2319524, -1.261187, 1, 1, 1, 1, 1,
-0.9048037, -1.129178, -1.583449, 1, 1, 1, 1, 1,
-0.904171, 2.392373, 0.7028201, 1, 1, 1, 1, 1,
-0.9005015, 0.80755, -1.990572, 1, 1, 1, 1, 1,
-0.8989235, 2.051565, -0.549849, 1, 1, 1, 1, 1,
-0.8927316, 0.5680733, -0.1594778, 1, 1, 1, 1, 1,
-0.8920898, 0.5033261, -0.4553262, 0, 0, 1, 1, 1,
-0.8901725, -0.7010903, -2.795914, 1, 0, 0, 1, 1,
-0.8901551, 1.208946, -1.060506, 1, 0, 0, 1, 1,
-0.8893117, -1.055858, -1.804847, 1, 0, 0, 1, 1,
-0.8861735, 0.4695019, -2.285961, 1, 0, 0, 1, 1,
-0.8848997, 0.8373114, -1.004881, 1, 0, 0, 1, 1,
-0.8797641, 0.2329757, -1.743848, 0, 0, 0, 1, 1,
-0.8772901, 0.8743581, -0.7882023, 0, 0, 0, 1, 1,
-0.8685958, 2.551736, 1.05607, 0, 0, 0, 1, 1,
-0.8653225, -1.125723, -2.267596, 0, 0, 0, 1, 1,
-0.8647791, -0.778683, -2.377349, 0, 0, 0, 1, 1,
-0.8638129, 2.104426, 1.207846, 0, 0, 0, 1, 1,
-0.8553057, 0.08706489, -2.016723, 0, 0, 0, 1, 1,
-0.8527285, -1.209519, -1.920558, 1, 1, 1, 1, 1,
-0.8491967, -2.097777, -3.412969, 1, 1, 1, 1, 1,
-0.848351, -0.1688199, -1.992685, 1, 1, 1, 1, 1,
-0.8416044, 0.5469223, -0.7128639, 1, 1, 1, 1, 1,
-0.8407992, 0.4974924, -1.698327, 1, 1, 1, 1, 1,
-0.8371093, -0.1866347, -3.513779, 1, 1, 1, 1, 1,
-0.8346381, -1.093695, -1.587564, 1, 1, 1, 1, 1,
-0.834564, -0.7257014, -1.293514, 1, 1, 1, 1, 1,
-0.8340501, -0.8375213, -0.103973, 1, 1, 1, 1, 1,
-0.8313993, -1.903029, -3.461775, 1, 1, 1, 1, 1,
-0.8238549, 0.007265507, -0.5714049, 1, 1, 1, 1, 1,
-0.8200486, -1.110546, -5.418313, 1, 1, 1, 1, 1,
-0.8188056, -1.047237, -1.580656, 1, 1, 1, 1, 1,
-0.8183918, -0.5496848, -2.767009, 1, 1, 1, 1, 1,
-0.8171225, -0.8442406, 0.3707639, 1, 1, 1, 1, 1,
-0.815798, -0.5267209, -1.266445, 0, 0, 1, 1, 1,
-0.8123843, -0.2129548, -1.596879, 1, 0, 0, 1, 1,
-0.8096608, -0.08123148, -2.137179, 1, 0, 0, 1, 1,
-0.8036349, -0.4912862, -1.268991, 1, 0, 0, 1, 1,
-0.801514, -0.556138, -1.58555, 1, 0, 0, 1, 1,
-0.801309, 0.1918167, -2.822132, 1, 0, 0, 1, 1,
-0.7876883, 0.8729526, -0.3022134, 0, 0, 0, 1, 1,
-0.7856801, 0.1523419, -0.8678546, 0, 0, 0, 1, 1,
-0.7792971, -1.806115, -2.555091, 0, 0, 0, 1, 1,
-0.7783899, 0.6865653, -0.5353971, 0, 0, 0, 1, 1,
-0.7735308, 0.1593764, -0.707095, 0, 0, 0, 1, 1,
-0.772631, 0.09204565, -1.314713, 0, 0, 0, 1, 1,
-0.7629492, 1.105435, -2.330816, 0, 0, 0, 1, 1,
-0.7621677, 1.224783, -1.631155, 1, 1, 1, 1, 1,
-0.7559262, 0.03612062, 0.03284977, 1, 1, 1, 1, 1,
-0.7508191, -0.2520241, -1.656782, 1, 1, 1, 1, 1,
-0.7483999, 0.9580257, -1.414025, 1, 1, 1, 1, 1,
-0.7464592, 0.821336, -2.145097, 1, 1, 1, 1, 1,
-0.7422681, -0.8322088, -2.508897, 1, 1, 1, 1, 1,
-0.7376816, 0.1663879, -1.926354, 1, 1, 1, 1, 1,
-0.7364195, -0.7844362, -2.526103, 1, 1, 1, 1, 1,
-0.7346069, -1.486883, -2.45755, 1, 1, 1, 1, 1,
-0.7342126, 1.423967, -0.4754136, 1, 1, 1, 1, 1,
-0.73232, 0.3705358, -2.783097, 1, 1, 1, 1, 1,
-0.7303993, 1.080097, 1.503606, 1, 1, 1, 1, 1,
-0.7302001, -0.5560157, -2.669562, 1, 1, 1, 1, 1,
-0.7225131, 1.252278, 0.6873193, 1, 1, 1, 1, 1,
-0.7222565, -1.373533, -3.015808, 1, 1, 1, 1, 1,
-0.7165811, 0.3593693, -0.3867227, 0, 0, 1, 1, 1,
-0.7165757, 1.915544, -0.9649071, 1, 0, 0, 1, 1,
-0.7159799, -1.397703, -5.1212, 1, 0, 0, 1, 1,
-0.7124894, 0.1071097, -1.626063, 1, 0, 0, 1, 1,
-0.7101237, 0.05581997, -1.995737, 1, 0, 0, 1, 1,
-0.7070515, -1.246773, -4.048661, 1, 0, 0, 1, 1,
-0.7067006, -1.269014, -2.887583, 0, 0, 0, 1, 1,
-0.6991402, 1.196679, -0.6552413, 0, 0, 0, 1, 1,
-0.6976447, 1.304667, -1.43293, 0, 0, 0, 1, 1,
-0.6971716, -0.720513, -3.76082, 0, 0, 0, 1, 1,
-0.6963142, -2.254816, -1.601063, 0, 0, 0, 1, 1,
-0.6953388, -0.4793485, -3.31175, 0, 0, 0, 1, 1,
-0.6931774, -0.5624208, -1.413664, 0, 0, 0, 1, 1,
-0.69149, -0.3771598, -3.42744, 1, 1, 1, 1, 1,
-0.6858653, -2.349953, -1.997206, 1, 1, 1, 1, 1,
-0.6801348, -2.581234, -2.831546, 1, 1, 1, 1, 1,
-0.6789771, -0.3447753, -0.844622, 1, 1, 1, 1, 1,
-0.6741969, 0.4035579, -1.473685, 1, 1, 1, 1, 1,
-0.6652963, -0.9416693, -4.335922, 1, 1, 1, 1, 1,
-0.66229, -1.520865, -3.653383, 1, 1, 1, 1, 1,
-0.6610578, 0.0140615, 0.02304981, 1, 1, 1, 1, 1,
-0.6605347, 0.4091588, -1.409328, 1, 1, 1, 1, 1,
-0.6567899, 1.175094, -0.1454395, 1, 1, 1, 1, 1,
-0.6495147, 0.0771291, -0.2643191, 1, 1, 1, 1, 1,
-0.6454738, 0.4967249, -0.01895236, 1, 1, 1, 1, 1,
-0.6361551, 0.6913546, -0.7763994, 1, 1, 1, 1, 1,
-0.6349068, -0.4764941, -3.561985, 1, 1, 1, 1, 1,
-0.6339174, 1.191041, -0.5061934, 1, 1, 1, 1, 1,
-0.6172978, 0.222197, 0.1820471, 0, 0, 1, 1, 1,
-0.6163781, -0.2846845, -1.304836, 1, 0, 0, 1, 1,
-0.6160489, 0.7841568, -0.2430406, 1, 0, 0, 1, 1,
-0.6153576, 0.5934969, -0.7506614, 1, 0, 0, 1, 1,
-0.612649, 0.1285297, -0.7768041, 1, 0, 0, 1, 1,
-0.6121166, -0.8446648, -1.79087, 1, 0, 0, 1, 1,
-0.6110928, 0.3161774, -0.2320242, 0, 0, 0, 1, 1,
-0.6070361, 1.398997, -0.01027956, 0, 0, 0, 1, 1,
-0.5923644, 0.3517488, -1.571059, 0, 0, 0, 1, 1,
-0.5911462, 3.363725, 0.7431903, 0, 0, 0, 1, 1,
-0.5874419, 0.1401217, -1.729632, 0, 0, 0, 1, 1,
-0.5842581, -1.270148, -3.782056, 0, 0, 0, 1, 1,
-0.5829025, 1.400634, 0.3717323, 0, 0, 0, 1, 1,
-0.5731971, 0.3600242, -1.694168, 1, 1, 1, 1, 1,
-0.5699179, -0.8241441, -1.246933, 1, 1, 1, 1, 1,
-0.5673077, 1.646944, 0.4624868, 1, 1, 1, 1, 1,
-0.5652437, -1.903992, -2.654715, 1, 1, 1, 1, 1,
-0.5562665, -0.1936566, -3.519052, 1, 1, 1, 1, 1,
-0.5559513, 0.3387528, -0.5622966, 1, 1, 1, 1, 1,
-0.5552168, -1.664545, -3.528507, 1, 1, 1, 1, 1,
-0.5529501, -0.2762113, -0.4691031, 1, 1, 1, 1, 1,
-0.5401478, -2.386533, -3.532087, 1, 1, 1, 1, 1,
-0.5336064, -0.8858937, -2.117468, 1, 1, 1, 1, 1,
-0.5283881, -1.644731, -1.872308, 1, 1, 1, 1, 1,
-0.5274943, 0.7642166, -0.7723447, 1, 1, 1, 1, 1,
-0.5221398, 0.2121828, -2.012698, 1, 1, 1, 1, 1,
-0.5218293, -0.8098527, -3.411011, 1, 1, 1, 1, 1,
-0.5152871, -0.5761741, -3.642641, 1, 1, 1, 1, 1,
-0.5142428, 1.134392, -1.638288, 0, 0, 1, 1, 1,
-0.5140062, -1.01611, -2.375751, 1, 0, 0, 1, 1,
-0.513721, -1.536677, 0.08975949, 1, 0, 0, 1, 1,
-0.5103466, -0.09051745, -2.765643, 1, 0, 0, 1, 1,
-0.5070842, -1.610848, -1.782491, 1, 0, 0, 1, 1,
-0.5052509, 0.2754541, 0.0534342, 1, 0, 0, 1, 1,
-0.5028657, -1.096662, -2.513604, 0, 0, 0, 1, 1,
-0.5019204, -0.1819354, -1.921911, 0, 0, 0, 1, 1,
-0.5002596, -1.862995, -3.479369, 0, 0, 0, 1, 1,
-0.4993158, -0.6841871, -3.883338, 0, 0, 0, 1, 1,
-0.4990964, 0.07008778, 0.1114905, 0, 0, 0, 1, 1,
-0.4965706, 0.02971553, -1.332644, 0, 0, 0, 1, 1,
-0.4925599, 0.9669952, -1.75099, 0, 0, 0, 1, 1,
-0.490595, -2.335276, -2.74452, 1, 1, 1, 1, 1,
-0.4890528, -0.2425523, -3.228101, 1, 1, 1, 1, 1,
-0.480263, -0.1101216, -1.405507, 1, 1, 1, 1, 1,
-0.4773998, -0.6751744, -2.383188, 1, 1, 1, 1, 1,
-0.474759, 0.9955812, -0.2923426, 1, 1, 1, 1, 1,
-0.4732325, -0.0193577, 0.236831, 1, 1, 1, 1, 1,
-0.4705577, -1.238487, -0.3154463, 1, 1, 1, 1, 1,
-0.4704269, -1.503761, -0.6365157, 1, 1, 1, 1, 1,
-0.4631312, 0.5016048, 0.555106, 1, 1, 1, 1, 1,
-0.4591275, -0.01825694, -2.453467, 1, 1, 1, 1, 1,
-0.4554131, -0.2613033, -1.408131, 1, 1, 1, 1, 1,
-0.4540524, 0.9668601, -1.288741, 1, 1, 1, 1, 1,
-0.4531804, 0.07041179, -0.5009646, 1, 1, 1, 1, 1,
-0.4528062, 0.2575542, -0.9241237, 1, 1, 1, 1, 1,
-0.4510242, -0.7505565, -6.364529, 1, 1, 1, 1, 1,
-0.4427621, 0.9938833, -1.340959, 0, 0, 1, 1, 1,
-0.4417244, -0.4366007, -3.91003, 1, 0, 0, 1, 1,
-0.4318653, 1.777246, -0.7835813, 1, 0, 0, 1, 1,
-0.4193259, 0.8163116, 0.4845793, 1, 0, 0, 1, 1,
-0.4171317, -0.0919813, -0.9582673, 1, 0, 0, 1, 1,
-0.4169008, 1.174636, -2.046662, 1, 0, 0, 1, 1,
-0.4136375, 1.082173, 1.173055, 0, 0, 0, 1, 1,
-0.4129686, -1.087414, -2.898199, 0, 0, 0, 1, 1,
-0.4109096, 1.413808, 2.277268, 0, 0, 0, 1, 1,
-0.4105434, -0.5416923, -2.918311, 0, 0, 0, 1, 1,
-0.4088533, 0.1945671, -0.9032027, 0, 0, 0, 1, 1,
-0.403702, -0.4025977, -2.469549, 0, 0, 0, 1, 1,
-0.4032458, -1.057329, -2.742698, 0, 0, 0, 1, 1,
-0.4019483, -0.6257517, -3.525243, 1, 1, 1, 1, 1,
-0.395359, 1.873951, 0.5239659, 1, 1, 1, 1, 1,
-0.3830628, 0.5828762, -1.940553, 1, 1, 1, 1, 1,
-0.3829439, 0.678677, -1.476938, 1, 1, 1, 1, 1,
-0.3797713, -0.7773176, -2.562559, 1, 1, 1, 1, 1,
-0.3794302, 0.02286225, -2.454036, 1, 1, 1, 1, 1,
-0.378672, -1.182487, -1.44132, 1, 1, 1, 1, 1,
-0.3722083, -0.2923267, 0.08602631, 1, 1, 1, 1, 1,
-0.3703712, 0.7926617, 1.461331, 1, 1, 1, 1, 1,
-0.3683962, 1.709231, 0.03983118, 1, 1, 1, 1, 1,
-0.3659489, -0.2564688, -3.646844, 1, 1, 1, 1, 1,
-0.3642077, 0.2512581, -2.433158, 1, 1, 1, 1, 1,
-0.3614874, -1.511281, -3.222052, 1, 1, 1, 1, 1,
-0.3612091, -0.2612802, -1.394563, 1, 1, 1, 1, 1,
-0.352637, 1.039697, -2.174902, 1, 1, 1, 1, 1,
-0.3522823, 0.8808243, -0.6762386, 0, 0, 1, 1, 1,
-0.3507017, 0.05990392, -0.4040685, 1, 0, 0, 1, 1,
-0.3494212, 1.281052, 1.390971, 1, 0, 0, 1, 1,
-0.3485004, -1.437523, -3.21115, 1, 0, 0, 1, 1,
-0.3450746, -0.5794116, -3.238402, 1, 0, 0, 1, 1,
-0.340919, 0.2317769, -2.125304, 1, 0, 0, 1, 1,
-0.3406034, -1.063152, -2.253667, 0, 0, 0, 1, 1,
-0.3389519, 1.548466, -1.287751, 0, 0, 0, 1, 1,
-0.3327875, 1.755366, -0.1839104, 0, 0, 0, 1, 1,
-0.3300981, 1.698327, -0.5055474, 0, 0, 0, 1, 1,
-0.3293783, 0.3315848, -0.301936, 0, 0, 0, 1, 1,
-0.3286678, -0.1176614, -1.669798, 0, 0, 0, 1, 1,
-0.3185124, -0.4449356, -3.130307, 0, 0, 0, 1, 1,
-0.3058583, -0.02757253, -1.045091, 1, 1, 1, 1, 1,
-0.3052648, 0.2242937, -1.027424, 1, 1, 1, 1, 1,
-0.3019634, 0.5195815, -0.8555226, 1, 1, 1, 1, 1,
-0.3015793, -0.8061922, -2.97891, 1, 1, 1, 1, 1,
-0.2936618, -0.5348095, -3.591907, 1, 1, 1, 1, 1,
-0.2918983, -0.6544533, -1.644701, 1, 1, 1, 1, 1,
-0.2918482, -1.197509, -2.498655, 1, 1, 1, 1, 1,
-0.290905, 2.915417, -0.5343332, 1, 1, 1, 1, 1,
-0.2892235, -1.654912, -4.196605, 1, 1, 1, 1, 1,
-0.2878146, 1.351076, -0.8069603, 1, 1, 1, 1, 1,
-0.2869184, 0.9456246, 0.992398, 1, 1, 1, 1, 1,
-0.2823832, 1.483791, -0.8363892, 1, 1, 1, 1, 1,
-0.2808531, 0.6421474, -0.6767122, 1, 1, 1, 1, 1,
-0.2808437, -0.1712197, -0.9419852, 1, 1, 1, 1, 1,
-0.2757924, 0.02991395, -1.52309, 1, 1, 1, 1, 1,
-0.2754011, -0.0645281, -2.223839, 0, 0, 1, 1, 1,
-0.2748005, -0.7474288, -2.771072, 1, 0, 0, 1, 1,
-0.27339, 1.566712, -1.460444, 1, 0, 0, 1, 1,
-0.2703458, -0.9956775, -1.740021, 1, 0, 0, 1, 1,
-0.2689043, 0.7872016, -1.404661, 1, 0, 0, 1, 1,
-0.268365, -0.6488423, -1.077941, 1, 0, 0, 1, 1,
-0.2664771, -0.8599312, -1.938239, 0, 0, 0, 1, 1,
-0.2646371, -0.9591543, -0.7457637, 0, 0, 0, 1, 1,
-0.2620058, 0.0166966, -0.2159048, 0, 0, 0, 1, 1,
-0.261614, -1.557729, -2.326491, 0, 0, 0, 1, 1,
-0.2551168, -1.788579, -1.639366, 0, 0, 0, 1, 1,
-0.2551113, 0.2474747, -1.860863, 0, 0, 0, 1, 1,
-0.2548591, -0.1012571, -0.7341714, 0, 0, 0, 1, 1,
-0.254517, -0.665727, -2.263395, 1, 1, 1, 1, 1,
-0.2535397, -0.6680272, -1.273067, 1, 1, 1, 1, 1,
-0.2532838, 0.08518135, -2.352685, 1, 1, 1, 1, 1,
-0.2508608, -0.3395, -4.300272, 1, 1, 1, 1, 1,
-0.2502009, -1.2837, -3.942753, 1, 1, 1, 1, 1,
-0.2447052, -2.161598, -5.705177, 1, 1, 1, 1, 1,
-0.2421084, -0.7855636, -1.96958, 1, 1, 1, 1, 1,
-0.2415085, 0.1678526, -2.158933, 1, 1, 1, 1, 1,
-0.2414423, -1.090839, -4.508414, 1, 1, 1, 1, 1,
-0.2396892, 0.3964126, 0.06612843, 1, 1, 1, 1, 1,
-0.2385968, 0.9886277, -1.244266, 1, 1, 1, 1, 1,
-0.2379799, -0.9615281, -3.225589, 1, 1, 1, 1, 1,
-0.2367611, -0.2396234, -4.254055, 1, 1, 1, 1, 1,
-0.234402, -1.123358, -2.549326, 1, 1, 1, 1, 1,
-0.2327613, -1.509897, -3.803654, 1, 1, 1, 1, 1,
-0.2317476, 0.1383049, -2.188893, 0, 0, 1, 1, 1,
-0.2303194, 0.5732716, -0.387236, 1, 0, 0, 1, 1,
-0.2260134, 0.1314708, -1.020076, 1, 0, 0, 1, 1,
-0.2235691, -0.3396528, -3.776856, 1, 0, 0, 1, 1,
-0.2181053, -0.3816984, -1.985499, 1, 0, 0, 1, 1,
-0.2169366, -0.172341, -2.7768, 1, 0, 0, 1, 1,
-0.21431, -0.6223769, -2.811914, 0, 0, 0, 1, 1,
-0.2130427, -0.224813, -2.459649, 0, 0, 0, 1, 1,
-0.2126345, 1.623124, -0.7088048, 0, 0, 0, 1, 1,
-0.2116507, -0.9430602, -4.155663, 0, 0, 0, 1, 1,
-0.2102605, -1.123498, -1.926217, 0, 0, 0, 1, 1,
-0.2094288, 1.57626, -0.7453484, 0, 0, 0, 1, 1,
-0.2079364, 0.2244074, 1.061697, 0, 0, 0, 1, 1,
-0.2042587, 0.1550335, -1.566554, 1, 1, 1, 1, 1,
-0.2024951, 0.3494109, -1.476912, 1, 1, 1, 1, 1,
-0.1996311, 0.1276217, -1.579138, 1, 1, 1, 1, 1,
-0.1991456, -0.3859377, -1.667955, 1, 1, 1, 1, 1,
-0.1962492, -0.09187197, -2.07996, 1, 1, 1, 1, 1,
-0.1934372, -1.32961, -0.8055661, 1, 1, 1, 1, 1,
-0.1902553, -0.05476614, 0.01123634, 1, 1, 1, 1, 1,
-0.1894624, -1.023648, -2.041991, 1, 1, 1, 1, 1,
-0.1881864, -1.764569, -1.781317, 1, 1, 1, 1, 1,
-0.1843803, 0.9245111, 0.9456558, 1, 1, 1, 1, 1,
-0.1834333, -0.06845631, -1.399737, 1, 1, 1, 1, 1,
-0.1741886, 0.3536001, -0.4519861, 1, 1, 1, 1, 1,
-0.1736916, 2.44013, -0.4197555, 1, 1, 1, 1, 1,
-0.1728694, -1.184147, -5.294906, 1, 1, 1, 1, 1,
-0.1725097, -0.1876014, -0.8115471, 1, 1, 1, 1, 1,
-0.1690214, 1.271749, 0.5952158, 0, 0, 1, 1, 1,
-0.1680852, -0.1987821, -3.480786, 1, 0, 0, 1, 1,
-0.166091, -0.2744581, -2.395612, 1, 0, 0, 1, 1,
-0.165669, -1.115415, -1.783955, 1, 0, 0, 1, 1,
-0.1640261, -0.3838641, -2.300056, 1, 0, 0, 1, 1,
-0.1633977, 0.2881988, -1.409934, 1, 0, 0, 1, 1,
-0.1592259, -0.6280039, -2.457462, 0, 0, 0, 1, 1,
-0.1577153, -0.4620981, -4.43325, 0, 0, 0, 1, 1,
-0.1575896, -1.508744, -1.049723, 0, 0, 0, 1, 1,
-0.1571411, -0.6328114, -2.153233, 0, 0, 0, 1, 1,
-0.1567226, -1.073062, -2.594395, 0, 0, 0, 1, 1,
-0.1563118, 0.09456208, -1.233493, 0, 0, 0, 1, 1,
-0.1557664, 0.2599272, -1.233446, 0, 0, 0, 1, 1,
-0.1544375, -1.555609, -3.342911, 1, 1, 1, 1, 1,
-0.147103, 2.153212, 1.881771, 1, 1, 1, 1, 1,
-0.1414084, 0.2881128, 0.1060499, 1, 1, 1, 1, 1,
-0.1368033, -0.7468953, -2.285378, 1, 1, 1, 1, 1,
-0.1366247, -0.664708, -3.563145, 1, 1, 1, 1, 1,
-0.1363969, 0.2792922, -1.290379, 1, 1, 1, 1, 1,
-0.1341357, -0.09068932, -2.080955, 1, 1, 1, 1, 1,
-0.1317215, -0.8539143, -2.184459, 1, 1, 1, 1, 1,
-0.1227864, 0.2527797, -0.1550083, 1, 1, 1, 1, 1,
-0.1196774, -0.2768019, -3.353105, 1, 1, 1, 1, 1,
-0.1176317, 0.6068959, 1.361177, 1, 1, 1, 1, 1,
-0.1171353, -0.3802218, -4.516791, 1, 1, 1, 1, 1,
-0.1128281, -0.4895269, -4.261353, 1, 1, 1, 1, 1,
-0.1056882, 0.1903189, -1.11528, 1, 1, 1, 1, 1,
-0.1035742, -0.2944232, -2.814919, 1, 1, 1, 1, 1,
-0.1024684, 0.1608979, -0.1052939, 0, 0, 1, 1, 1,
-0.1016206, -2.292991, -2.78849, 1, 0, 0, 1, 1,
-0.0984113, -1.566558, -5.044118, 1, 0, 0, 1, 1,
-0.07913897, 0.9908336, 0.1039064, 1, 0, 0, 1, 1,
-0.07436803, 1.315056, -0.5385476, 1, 0, 0, 1, 1,
-0.06625126, 1.260712, -0.8757092, 1, 0, 0, 1, 1,
-0.06290752, -0.1299537, -2.06667, 0, 0, 0, 1, 1,
-0.06284396, 0.4389302, -0.1511545, 0, 0, 0, 1, 1,
-0.06277725, 0.5863585, -0.9479434, 0, 0, 0, 1, 1,
-0.06194548, -0.2441886, -4.49461, 0, 0, 0, 1, 1,
-0.05884502, 1.937873, 0.08878244, 0, 0, 0, 1, 1,
-0.05663694, 0.1645305, 0.1377338, 0, 0, 0, 1, 1,
-0.05522121, 1.311576, 0.1712079, 0, 0, 0, 1, 1,
-0.05381738, -0.05246726, -0.9949638, 1, 1, 1, 1, 1,
-0.04867609, 0.2159929, -2.084897, 1, 1, 1, 1, 1,
-0.04131455, -0.01370096, -0.7792202, 1, 1, 1, 1, 1,
-0.03858244, 2.038441, -0.7613178, 1, 1, 1, 1, 1,
-0.03514796, -0.8401641, -2.533361, 1, 1, 1, 1, 1,
-0.02743224, -0.3456003, -4.206334, 1, 1, 1, 1, 1,
-0.01726402, 0.3454652, -0.1031919, 1, 1, 1, 1, 1,
-0.0155899, 0.6084145, -1.47705, 1, 1, 1, 1, 1,
-0.01424179, 0.3410036, -0.01031191, 1, 1, 1, 1, 1,
-0.009155575, 0.1958249, 1.991717, 1, 1, 1, 1, 1,
-0.007973409, 0.03456535, 0.07803495, 1, 1, 1, 1, 1,
-0.007870967, 0.8121448, 1.235594, 1, 1, 1, 1, 1,
-0.006663257, -0.5021807, -3.482679, 1, 1, 1, 1, 1,
-0.002012067, 0.8846512, 1.150437, 1, 1, 1, 1, 1,
-0.001125241, -0.1755063, -1.625219, 1, 1, 1, 1, 1,
-0.0008868024, -0.9969088, -4.526421, 0, 0, 1, 1, 1,
-0.0002808165, -0.4745855, -4.094862, 1, 0, 0, 1, 1,
-0.0001154402, -0.6672438, -3.080742, 1, 0, 0, 1, 1,
0.002303566, -0.5328394, 2.897806, 1, 0, 0, 1, 1,
0.004685716, -0.47735, 4.788869, 1, 0, 0, 1, 1,
0.006098993, 1.971222, -0.3269459, 1, 0, 0, 1, 1,
0.01018474, -0.05495852, 3.160984, 0, 0, 0, 1, 1,
0.01062335, -0.7419968, 3.6272, 0, 0, 0, 1, 1,
0.01215864, 0.1551577, 1.56977, 0, 0, 0, 1, 1,
0.01349286, -0.8065235, 2.378166, 0, 0, 0, 1, 1,
0.01499594, 1.706257, -0.161259, 0, 0, 0, 1, 1,
0.01785913, 0.9058954, 0.8791938, 0, 0, 0, 1, 1,
0.01815383, -0.3903582, 1.738698, 0, 0, 0, 1, 1,
0.02059629, -1.77913, 3.700453, 1, 1, 1, 1, 1,
0.02320233, 1.446666, -0.5484401, 1, 1, 1, 1, 1,
0.02606099, 1.428437, 1.318161, 1, 1, 1, 1, 1,
0.02812446, -0.1153599, 3.946418, 1, 1, 1, 1, 1,
0.02987236, 0.5092993, -0.6210684, 1, 1, 1, 1, 1,
0.03066786, -0.3413783, 2.218087, 1, 1, 1, 1, 1,
0.03219206, -0.8406605, 2.816638, 1, 1, 1, 1, 1,
0.03420158, 1.098905, -1.723306, 1, 1, 1, 1, 1,
0.03469259, 0.4739255, -0.7440864, 1, 1, 1, 1, 1,
0.03581724, -0.1124598, 3.050609, 1, 1, 1, 1, 1,
0.03782834, -2.254372, 3.53447, 1, 1, 1, 1, 1,
0.04051456, 0.1028615, 0.167233, 1, 1, 1, 1, 1,
0.04054199, 0.8415388, 0.2412172, 1, 1, 1, 1, 1,
0.04665795, 1.398504, -0.3108064, 1, 1, 1, 1, 1,
0.05522257, -0.05798148, 2.203844, 1, 1, 1, 1, 1,
0.05725957, 0.1129738, 0.5334329, 0, 0, 1, 1, 1,
0.0573623, -0.2814032, 2.932151, 1, 0, 0, 1, 1,
0.06392848, -1.871414, 2.892284, 1, 0, 0, 1, 1,
0.06493343, 0.9069448, -1.271472, 1, 0, 0, 1, 1,
0.06567553, 0.40146, 0.6333547, 1, 0, 0, 1, 1,
0.06648233, 0.5706378, 0.368223, 1, 0, 0, 1, 1,
0.06831984, -0.1361023, 3.260568, 0, 0, 0, 1, 1,
0.06889465, 0.7978007, -0.2044942, 0, 0, 0, 1, 1,
0.06898852, -1.464884, 3.952914, 0, 0, 0, 1, 1,
0.07567482, -1.115049, 3.260502, 0, 0, 0, 1, 1,
0.07658226, 1.920312, 0.1161077, 0, 0, 0, 1, 1,
0.08033718, -0.3740237, 1.492107, 0, 0, 0, 1, 1,
0.08971489, -0.3992395, 2.41216, 0, 0, 0, 1, 1,
0.08980916, -0.1805355, 4.203638, 1, 1, 1, 1, 1,
0.09099481, 1.229553, -0.3150894, 1, 1, 1, 1, 1,
0.0918605, -0.3911523, 4.836188, 1, 1, 1, 1, 1,
0.09230946, -0.06696222, 1.331904, 1, 1, 1, 1, 1,
0.09364454, -1.02479, 4.174623, 1, 1, 1, 1, 1,
0.09540857, 0.6798987, -1.032305, 1, 1, 1, 1, 1,
0.104662, 0.2440403, 0.4386314, 1, 1, 1, 1, 1,
0.108092, 0.631299, 0.1103679, 1, 1, 1, 1, 1,
0.1085231, -1.500845, 2.401997, 1, 1, 1, 1, 1,
0.1099453, 0.2689997, 1.196285, 1, 1, 1, 1, 1,
0.1147192, -0.396472, 1.198297, 1, 1, 1, 1, 1,
0.1175022, 0.3943832, 0.1454709, 1, 1, 1, 1, 1,
0.1184435, -0.9604571, 2.812537, 1, 1, 1, 1, 1,
0.1186495, -0.604149, 3.768761, 1, 1, 1, 1, 1,
0.1186832, -0.3819823, 2.152243, 1, 1, 1, 1, 1,
0.1223383, -1.211557, 3.004314, 0, 0, 1, 1, 1,
0.1268264, -0.3418724, 2.735693, 1, 0, 0, 1, 1,
0.1275202, -0.2466494, 2.429704, 1, 0, 0, 1, 1,
0.1300469, 1.066946, -1.469578, 1, 0, 0, 1, 1,
0.1303364, 1.244546, 1.143075, 1, 0, 0, 1, 1,
0.1307122, -0.7882066, 2.7586, 1, 0, 0, 1, 1,
0.1317464, 0.5510654, 0.9816215, 0, 0, 0, 1, 1,
0.1333574, 2.093557, 1.365427, 0, 0, 0, 1, 1,
0.1351026, -1.164879, 3.047568, 0, 0, 0, 1, 1,
0.1353967, 1.605336, -1.685603, 0, 0, 0, 1, 1,
0.1369528, -0.3884426, 3.026699, 0, 0, 0, 1, 1,
0.1374361, -1.972785, 3.873221, 0, 0, 0, 1, 1,
0.1383142, -1.173448, -0.173622, 0, 0, 0, 1, 1,
0.1392534, 1.015499, -0.5507783, 1, 1, 1, 1, 1,
0.1422533, 1.033761, 1.367391, 1, 1, 1, 1, 1,
0.1449088, -1.236554, 2.058266, 1, 1, 1, 1, 1,
0.1478163, -1.212651, 2.63017, 1, 1, 1, 1, 1,
0.1480593, 0.4482428, 0.9229243, 1, 1, 1, 1, 1,
0.1494497, 0.290811, 0.7878608, 1, 1, 1, 1, 1,
0.1506372, -1.520717, 0.6722596, 1, 1, 1, 1, 1,
0.1509716, 1.359865, -0.3183533, 1, 1, 1, 1, 1,
0.1518069, 1.090019, -0.6251485, 1, 1, 1, 1, 1,
0.1518681, 1.994781, 1.095005, 1, 1, 1, 1, 1,
0.1527488, 0.1145848, 1.408815, 1, 1, 1, 1, 1,
0.1532754, 1.449174, -1.578533, 1, 1, 1, 1, 1,
0.1550054, 0.2957751, -0.6425354, 1, 1, 1, 1, 1,
0.1554672, 0.0122852, -0.5026729, 1, 1, 1, 1, 1,
0.1598746, 0.866698, 1.587132, 1, 1, 1, 1, 1,
0.1606149, -0.5116053, 3.59429, 0, 0, 1, 1, 1,
0.1642974, 0.6870365, -0.9380046, 1, 0, 0, 1, 1,
0.1658626, -2.393329, 2.046457, 1, 0, 0, 1, 1,
0.1687926, 3.011841, 0.110753, 1, 0, 0, 1, 1,
0.1765116, -0.5082488, 2.097029, 1, 0, 0, 1, 1,
0.1772057, 0.3195004, 1.995774, 1, 0, 0, 1, 1,
0.1776363, -1.176744, 3.007656, 0, 0, 0, 1, 1,
0.1821586, -1.244025, 2.992808, 0, 0, 0, 1, 1,
0.1839652, -0.5837787, 0.8571, 0, 0, 0, 1, 1,
0.1915157, -1.951666, 4.239299, 0, 0, 0, 1, 1,
0.1923133, -1.478758, 1.896088, 0, 0, 0, 1, 1,
0.1954023, 0.2403298, 0.9032441, 0, 0, 0, 1, 1,
0.1959194, 0.7089054, -0.02976456, 0, 0, 0, 1, 1,
0.1963516, 0.390525, 1.352692, 1, 1, 1, 1, 1,
0.2017912, 0.5730657, 1.120641, 1, 1, 1, 1, 1,
0.206572, -0.1302204, 3.502159, 1, 1, 1, 1, 1,
0.2080262, 0.396968, 0.5349234, 1, 1, 1, 1, 1,
0.2115785, -1.280716, 3.342083, 1, 1, 1, 1, 1,
0.2134818, 0.8451889, 0.560809, 1, 1, 1, 1, 1,
0.2150871, -0.233173, 3.773521, 1, 1, 1, 1, 1,
0.2163616, -1.010195, 3.204039, 1, 1, 1, 1, 1,
0.2165941, 1.93351, -1.417935, 1, 1, 1, 1, 1,
0.2174046, -1.310151, 4.297064, 1, 1, 1, 1, 1,
0.2191119, 0.2756929, 1.345678, 1, 1, 1, 1, 1,
0.2220812, 0.3076221, 1.995075, 1, 1, 1, 1, 1,
0.2226862, -0.9838081, 3.275643, 1, 1, 1, 1, 1,
0.222878, -0.2290557, 2.739088, 1, 1, 1, 1, 1,
0.2235465, -0.9290557, 2.415626, 1, 1, 1, 1, 1,
0.2239156, 1.326315, -0.1311052, 0, 0, 1, 1, 1,
0.2252264, 0.02338722, 2.872581, 1, 0, 0, 1, 1,
0.2259681, 0.09180145, 2.195731, 1, 0, 0, 1, 1,
0.2259835, 0.3552375, 0.683841, 1, 0, 0, 1, 1,
0.2282214, 0.7716637, 0.56431, 1, 0, 0, 1, 1,
0.2285658, -0.8039067, 0.9827387, 1, 0, 0, 1, 1,
0.2312889, -0.2295086, 3.51225, 0, 0, 0, 1, 1,
0.2352335, 1.269865, -0.5987484, 0, 0, 0, 1, 1,
0.235945, -0.01173961, 2.580305, 0, 0, 0, 1, 1,
0.2507501, 0.2530372, 1.490781, 0, 0, 0, 1, 1,
0.2515799, 1.323858, 4.07242, 0, 0, 0, 1, 1,
0.2521086, 0.8258059, 1.388061, 0, 0, 0, 1, 1,
0.2535836, -0.9905148, 1.96311, 0, 0, 0, 1, 1,
0.2547074, -1.086117, 5.1146, 1, 1, 1, 1, 1,
0.2547177, -0.7129737, 2.843321, 1, 1, 1, 1, 1,
0.2588668, -1.847807, 3.084253, 1, 1, 1, 1, 1,
0.2603741, -0.8055869, 4.147085, 1, 1, 1, 1, 1,
0.2617336, -2.295743, 3.113756, 1, 1, 1, 1, 1,
0.2637032, 0.08435231, 1.433205, 1, 1, 1, 1, 1,
0.2656235, -1.226652, 3.168567, 1, 1, 1, 1, 1,
0.2668468, 1.058144, -0.4103174, 1, 1, 1, 1, 1,
0.2672637, 0.7158777, -0.08711772, 1, 1, 1, 1, 1,
0.2682059, -0.4714246, 4.570251, 1, 1, 1, 1, 1,
0.2726051, -1.908003, 2.360227, 1, 1, 1, 1, 1,
0.2731501, -0.8843423, 2.910331, 1, 1, 1, 1, 1,
0.274275, 1.118311, -0.4173087, 1, 1, 1, 1, 1,
0.2748462, 0.9486501, 0.5888116, 1, 1, 1, 1, 1,
0.2754044, -0.2304548, 3.0674, 1, 1, 1, 1, 1,
0.277394, -0.4478649, 2.275892, 0, 0, 1, 1, 1,
0.2815522, 0.663936, 0.8109584, 1, 0, 0, 1, 1,
0.2902197, 0.4294042, 2.527683, 1, 0, 0, 1, 1,
0.2907974, -0.9095654, 2.981083, 1, 0, 0, 1, 1,
0.2935259, -0.4797006, 2.711232, 1, 0, 0, 1, 1,
0.2944514, 0.2292099, 1.159323, 1, 0, 0, 1, 1,
0.2949524, 0.4945768, 0.6571724, 0, 0, 0, 1, 1,
0.2954254, -0.5828023, 1.889856, 0, 0, 0, 1, 1,
0.2978233, 0.3165374, 1.33264, 0, 0, 0, 1, 1,
0.2990012, -1.772771, 1.852726, 0, 0, 0, 1, 1,
0.3025312, 1.021128, -1.40039, 0, 0, 0, 1, 1,
0.3051455, -0.8814142, 1.801877, 0, 0, 0, 1, 1,
0.3074369, -1.106629, 1.734598, 0, 0, 0, 1, 1,
0.3151269, -1.830535, 3.00021, 1, 1, 1, 1, 1,
0.3164628, -0.2439592, 1.42947, 1, 1, 1, 1, 1,
0.3189596, 0.7200949, 0.3432042, 1, 1, 1, 1, 1,
0.3201871, -0.3751228, 3.712807, 1, 1, 1, 1, 1,
0.320711, -0.06535319, 2.121259, 1, 1, 1, 1, 1,
0.3216665, -0.3232236, 2.982462, 1, 1, 1, 1, 1,
0.3261309, -0.3033142, 2.834633, 1, 1, 1, 1, 1,
0.3267971, -0.6850091, 1.671871, 1, 1, 1, 1, 1,
0.329997, 0.6018329, 1.0504, 1, 1, 1, 1, 1,
0.3311949, 0.4813515, -1.133809, 1, 1, 1, 1, 1,
0.3341487, -1.450753, 1.732075, 1, 1, 1, 1, 1,
0.3379505, 0.2213915, 2.497723, 1, 1, 1, 1, 1,
0.3466464, 1.668473, 0.8372177, 1, 1, 1, 1, 1,
0.3467707, 1.68009, 0.2330931, 1, 1, 1, 1, 1,
0.34678, 1.871008, -0.5065455, 1, 1, 1, 1, 1,
0.3478123, 0.2307073, 1.50255, 0, 0, 1, 1, 1,
0.3513681, 0.7984188, 0.6781105, 1, 0, 0, 1, 1,
0.362805, 0.3451256, 2.004927, 1, 0, 0, 1, 1,
0.3659698, -1.984461, 0.8615562, 1, 0, 0, 1, 1,
0.3708769, 1.254378, 0.2538461, 1, 0, 0, 1, 1,
0.3797117, -0.2677697, 1.186584, 1, 0, 0, 1, 1,
0.3811409, -1.236252, 2.200447, 0, 0, 0, 1, 1,
0.3815716, 1.461919, 1.39755, 0, 0, 0, 1, 1,
0.383915, 0.8160381, 2.010188, 0, 0, 0, 1, 1,
0.3972173, 0.8142969, -1.916314, 0, 0, 0, 1, 1,
0.3978397, -1.157097, 4.971209, 0, 0, 0, 1, 1,
0.4045221, 0.8076081, 0.2163087, 0, 0, 0, 1, 1,
0.4067483, 0.9019589, 1.860782, 0, 0, 0, 1, 1,
0.4077222, -0.5935053, 1.489057, 1, 1, 1, 1, 1,
0.4103869, 0.7544742, 1.666979, 1, 1, 1, 1, 1,
0.4204024, 0.5598808, 0.9453316, 1, 1, 1, 1, 1,
0.4333979, 0.3515352, 0.7224548, 1, 1, 1, 1, 1,
0.4342015, 1.22254, 0.8131317, 1, 1, 1, 1, 1,
0.4351745, -0.3445796, 0.5170972, 1, 1, 1, 1, 1,
0.4403403, 2.475596, -1.680779, 1, 1, 1, 1, 1,
0.4417764, 1.484565, 1.143074, 1, 1, 1, 1, 1,
0.4422476, -0.2726932, 2.116367, 1, 1, 1, 1, 1,
0.4469932, -0.6018139, 2.40582, 1, 1, 1, 1, 1,
0.4517887, 0.9492112, 0.1404548, 1, 1, 1, 1, 1,
0.4564339, -0.02537227, 2.056282, 1, 1, 1, 1, 1,
0.4591378, 1.195071, 0.532756, 1, 1, 1, 1, 1,
0.459755, 0.5701092, -0.9021513, 1, 1, 1, 1, 1,
0.461772, 0.5179269, -0.2489768, 1, 1, 1, 1, 1,
0.4630495, 0.06433608, 1.262209, 0, 0, 1, 1, 1,
0.4666798, 0.3393366, 0.7073058, 1, 0, 0, 1, 1,
0.4679683, 1.703342, 0.2610293, 1, 0, 0, 1, 1,
0.4682604, 1.004298, 1.313002, 1, 0, 0, 1, 1,
0.4685019, -2.128356, 3.143995, 1, 0, 0, 1, 1,
0.4697476, 0.2020451, 0.7181999, 1, 0, 0, 1, 1,
0.476069, -0.1593636, 1.736645, 0, 0, 0, 1, 1,
0.4771538, -0.5570676, 2.22837, 0, 0, 0, 1, 1,
0.4850814, -2.145451, 3.748765, 0, 0, 0, 1, 1,
0.4853641, -2.146109, 2.37183, 0, 0, 0, 1, 1,
0.486205, 0.5470903, 1.622009, 0, 0, 0, 1, 1,
0.4900676, -0.4576392, 2.242745, 0, 0, 0, 1, 1,
0.5029093, -0.6317208, 2.982397, 0, 0, 0, 1, 1,
0.5033489, 1.706021, 0.2935869, 1, 1, 1, 1, 1,
0.5076706, 0.6939473, 0.8563403, 1, 1, 1, 1, 1,
0.5164918, -0.5000171, 1.406629, 1, 1, 1, 1, 1,
0.5208193, -0.4033127, -0.1953176, 1, 1, 1, 1, 1,
0.5257854, 1.191797, -0.2100829, 1, 1, 1, 1, 1,
0.5264279, -0.4837705, 2.733442, 1, 1, 1, 1, 1,
0.5281129, 1.554825, 1.964794, 1, 1, 1, 1, 1,
0.534307, -0.7447177, 1.007778, 1, 1, 1, 1, 1,
0.5353073, 0.03502341, 0.3057896, 1, 1, 1, 1, 1,
0.5407898, 0.376476, -0.1178716, 1, 1, 1, 1, 1,
0.5431964, 0.09219197, 1.724205, 1, 1, 1, 1, 1,
0.5441628, 0.1268014, 0.08406302, 1, 1, 1, 1, 1,
0.544718, 0.7034138, 2.974458, 1, 1, 1, 1, 1,
0.5455004, -0.4377843, 3.43937, 1, 1, 1, 1, 1,
0.547433, 0.7761408, 1.765729, 1, 1, 1, 1, 1,
0.5505822, 0.9182199, -0.1645579, 0, 0, 1, 1, 1,
0.5545745, -0.3780201, 2.89856, 1, 0, 0, 1, 1,
0.5545822, 1.276197, 0.6669625, 1, 0, 0, 1, 1,
0.5555751, 0.8965716, 0.3475046, 1, 0, 0, 1, 1,
0.5576627, 1.060634, 1.558865, 1, 0, 0, 1, 1,
0.5578066, -0.4336555, 1.769693, 1, 0, 0, 1, 1,
0.5592026, 1.096332, 1.791736, 0, 0, 0, 1, 1,
0.5645042, 1.095539, 0.9400564, 0, 0, 0, 1, 1,
0.56601, -0.7492394, 3.37418, 0, 0, 0, 1, 1,
0.5660254, -0.6951646, 4.079223, 0, 0, 0, 1, 1,
0.569702, 0.2438917, 2.088979, 0, 0, 0, 1, 1,
0.5713298, 0.5853953, 1.374142, 0, 0, 0, 1, 1,
0.573584, 1.220306, -1.173327, 0, 0, 0, 1, 1,
0.5805788, 0.4036299, -0.3732219, 1, 1, 1, 1, 1,
0.5834193, 0.7200699, 1.693294, 1, 1, 1, 1, 1,
0.5836523, -0.2235775, 2.222091, 1, 1, 1, 1, 1,
0.5897353, -0.4184178, 2.742636, 1, 1, 1, 1, 1,
0.5903563, 0.3483822, 0.7283303, 1, 1, 1, 1, 1,
0.5928567, 1.181784, 1.218591, 1, 1, 1, 1, 1,
0.6138268, 0.7975037, 0.4232545, 1, 1, 1, 1, 1,
0.6254373, -0.4019164, 2.206463, 1, 1, 1, 1, 1,
0.6325526, 0.6674176, 1.202341, 1, 1, 1, 1, 1,
0.6335083, 0.4246524, 1.044459, 1, 1, 1, 1, 1,
0.6368475, -0.5262371, 2.53407, 1, 1, 1, 1, 1,
0.6376434, -1.032604, 3.172737, 1, 1, 1, 1, 1,
0.6455398, -0.6039832, 3.99297, 1, 1, 1, 1, 1,
0.6466301, 0.1599979, 0.9574599, 1, 1, 1, 1, 1,
0.6507078, 0.07042759, 1.471563, 1, 1, 1, 1, 1,
0.6526529, 1.081696, 0.3366908, 0, 0, 1, 1, 1,
0.6533384, 1.331214, 1.995287, 1, 0, 0, 1, 1,
0.6561873, -1.015269, 3.329475, 1, 0, 0, 1, 1,
0.6584027, 0.1802473, 2.170854, 1, 0, 0, 1, 1,
0.660567, 0.3250222, 0.6949504, 1, 0, 0, 1, 1,
0.6649762, 1.824149, 0.2331466, 1, 0, 0, 1, 1,
0.6658957, 0.9850146, 1.982958, 0, 0, 0, 1, 1,
0.6689596, -1.367124, 2.941537, 0, 0, 0, 1, 1,
0.6720982, 0.9329827, 0.9409152, 0, 0, 0, 1, 1,
0.6728024, 1.230115, -0.4322344, 0, 0, 0, 1, 1,
0.6805017, -0.0441031, 3.269925, 0, 0, 0, 1, 1,
0.6934849, 0.02572099, 0.3827623, 0, 0, 0, 1, 1,
0.6966237, -1.043617, 1.654431, 0, 0, 0, 1, 1,
0.6974906, -1.61705, 1.583686, 1, 1, 1, 1, 1,
0.709887, 2.062781, 0.2142429, 1, 1, 1, 1, 1,
0.7150362, -0.3506476, 2.700711, 1, 1, 1, 1, 1,
0.7240375, 0.3901713, 2.057358, 1, 1, 1, 1, 1,
0.7244938, 0.991267, 1.097916, 1, 1, 1, 1, 1,
0.7254424, 0.8816435, 1.887945, 1, 1, 1, 1, 1,
0.7266011, 0.9275649, -1.329306, 1, 1, 1, 1, 1,
0.7282253, -1.041738, 1.659069, 1, 1, 1, 1, 1,
0.7309, -0.3928892, 3.537947, 1, 1, 1, 1, 1,
0.7313387, 0.4086261, 1.18659, 1, 1, 1, 1, 1,
0.7357624, 1.709858, -0.07920823, 1, 1, 1, 1, 1,
0.736371, 0.9274228, 0.7530116, 1, 1, 1, 1, 1,
0.737671, 1.374155, 0.8776148, 1, 1, 1, 1, 1,
0.7443486, 2.118729, -1.693789, 1, 1, 1, 1, 1,
0.7495653, -1.050538, 3.147669, 1, 1, 1, 1, 1,
0.7527968, -0.6245716, 3.178925, 0, 0, 1, 1, 1,
0.7545728, -0.2926062, 1.465042, 1, 0, 0, 1, 1,
0.7559267, -1.247481, 2.370712, 1, 0, 0, 1, 1,
0.7626087, 0.8649131, 0.9177919, 1, 0, 0, 1, 1,
0.7671138, 1.493688, -0.358913, 1, 0, 0, 1, 1,
0.7721257, -0.2522794, -0.8367956, 1, 0, 0, 1, 1,
0.7722508, -0.1612351, 1.844102, 0, 0, 0, 1, 1,
0.7800872, -1.328967, 2.073309, 0, 0, 0, 1, 1,
0.780198, 1.254269, -1.079416, 0, 0, 0, 1, 1,
0.784324, -1.272888, 2.686563, 0, 0, 0, 1, 1,
0.7865763, 1.3042, 0.2669584, 0, 0, 0, 1, 1,
0.7888055, -0.2503956, 1.208612, 0, 0, 0, 1, 1,
0.7910384, -0.4505151, 0.4597297, 0, 0, 0, 1, 1,
0.7950788, -0.5858158, 3.10122, 1, 1, 1, 1, 1,
0.7955368, -0.7700289, 1.708896, 1, 1, 1, 1, 1,
0.7961685, 1.630166, 0.7067225, 1, 1, 1, 1, 1,
0.7988388, -0.3815035, 1.037899, 1, 1, 1, 1, 1,
0.8041801, 0.6497232, 2.349634, 1, 1, 1, 1, 1,
0.8116657, 0.5164086, 1.366107, 1, 1, 1, 1, 1,
0.8155962, 0.09406183, 3.724169, 1, 1, 1, 1, 1,
0.8196204, -0.005947995, 1.850647, 1, 1, 1, 1, 1,
0.8237348, 0.8219519, 0.8412294, 1, 1, 1, 1, 1,
0.8361511, -0.5165933, 2.752236, 1, 1, 1, 1, 1,
0.838282, -0.8464118, 0.2879999, 1, 1, 1, 1, 1,
0.8391967, -0.2446723, 1.139629, 1, 1, 1, 1, 1,
0.8421162, -0.2003681, 2.084278, 1, 1, 1, 1, 1,
0.8583125, 0.487566, 1.187266, 1, 1, 1, 1, 1,
0.8587598, -0.1645389, 2.022204, 1, 1, 1, 1, 1,
0.8605686, -0.5430804, 1.234352, 0, 0, 1, 1, 1,
0.8616209, -1.451968, -0.00249808, 1, 0, 0, 1, 1,
0.8667254, -1.351309, 1.997157, 1, 0, 0, 1, 1,
0.8744186, -0.7097612, 2.335862, 1, 0, 0, 1, 1,
0.8810435, -2.349244, 3.419281, 1, 0, 0, 1, 1,
0.8839553, -1.321243, 2.536571, 1, 0, 0, 1, 1,
0.892274, -1.199593, 2.105628, 0, 0, 0, 1, 1,
0.9035464, 0.2718365, 1.540259, 0, 0, 0, 1, 1,
0.923363, 1.702692, -0.3219842, 0, 0, 0, 1, 1,
0.9253895, 0.8832966, 0.7031618, 0, 0, 0, 1, 1,
0.927125, 1.561999, 0.3810468, 0, 0, 0, 1, 1,
0.9293604, 0.7569833, 0.3211251, 0, 0, 0, 1, 1,
0.9336194, 0.8148416, 2.17374, 0, 0, 0, 1, 1,
0.9339236, -1.272674, 3.960704, 1, 1, 1, 1, 1,
0.9416794, 0.3688224, 0.07158589, 1, 1, 1, 1, 1,
0.9478816, -0.04622704, 0.459011, 1, 1, 1, 1, 1,
0.9546402, -1.497117, 0.7556891, 1, 1, 1, 1, 1,
0.9572669, 0.4206873, 0.03469639, 1, 1, 1, 1, 1,
0.9618949, 0.5961518, -0.4372963, 1, 1, 1, 1, 1,
0.962207, 0.06988581, 2.070963, 1, 1, 1, 1, 1,
0.9644271, -0.4028201, 3.195176, 1, 1, 1, 1, 1,
0.9720639, 1.173308, 2.3109, 1, 1, 1, 1, 1,
0.9751869, 0.7503694, 1.264933, 1, 1, 1, 1, 1,
0.9789909, 2.812591, -0.6946734, 1, 1, 1, 1, 1,
0.9842452, -1.216073, 1.547776, 1, 1, 1, 1, 1,
0.985588, 0.3636398, 2.084388, 1, 1, 1, 1, 1,
0.9855905, -0.6407384, 4.084183, 1, 1, 1, 1, 1,
0.9881206, -1.950467, 0.6628665, 1, 1, 1, 1, 1,
0.9905987, 0.4244118, 2.914973, 0, 0, 1, 1, 1,
0.9953955, -1.213172, 2.4299, 1, 0, 0, 1, 1,
1.007451, -1.948033, 1.137253, 1, 0, 0, 1, 1,
1.007666, -0.1621263, 1.68293, 1, 0, 0, 1, 1,
1.01234, 0.824176, 0.5945034, 1, 0, 0, 1, 1,
1.014691, -1.21564, 1.599755, 1, 0, 0, 1, 1,
1.01777, 0.2605183, 1.474326, 0, 0, 0, 1, 1,
1.017944, -0.9800745, 0.7046601, 0, 0, 0, 1, 1,
1.019515, 0.4205741, 0.2051794, 0, 0, 0, 1, 1,
1.019593, -0.8583832, 2.255276, 0, 0, 0, 1, 1,
1.025053, -0.298117, 3.385847, 0, 0, 0, 1, 1,
1.028179, 0.185485, 2.063209, 0, 0, 0, 1, 1,
1.039176, 2.693494, -1.742196, 0, 0, 0, 1, 1,
1.051458, 0.9044529, 1.712131, 1, 1, 1, 1, 1,
1.06528, -0.5642067, 2.156579, 1, 1, 1, 1, 1,
1.073392, -0.5072968, 2.477365, 1, 1, 1, 1, 1,
1.080472, -0.04098613, 2.245205, 1, 1, 1, 1, 1,
1.081664, 0.01545911, 1.487521, 1, 1, 1, 1, 1,
1.082376, -0.6760225, 2.838365, 1, 1, 1, 1, 1,
1.085143, -1.048241, 2.299055, 1, 1, 1, 1, 1,
1.086116, -1.047623, 3.311952, 1, 1, 1, 1, 1,
1.098979, -0.1722795, 1.053586, 1, 1, 1, 1, 1,
1.101153, 0.5130118, 2.136267, 1, 1, 1, 1, 1,
1.102563, 0.09813824, 0.3298874, 1, 1, 1, 1, 1,
1.108122, -0.5728011, 2.832067, 1, 1, 1, 1, 1,
1.113143, 0.3970328, 1.340492, 1, 1, 1, 1, 1,
1.114581, 2.666246, 1.058041, 1, 1, 1, 1, 1,
1.118955, 0.3146475, 1.707678, 1, 1, 1, 1, 1,
1.120162, 0.5430879, 1.801114, 0, 0, 1, 1, 1,
1.122205, 1.455311, 0.4506123, 1, 0, 0, 1, 1,
1.132561, -0.1826121, 0.9201021, 1, 0, 0, 1, 1,
1.149877, 0.1314025, 0.4588856, 1, 0, 0, 1, 1,
1.157233, -0.7126403, 0.6276851, 1, 0, 0, 1, 1,
1.160612, 0.1458759, 0.3431231, 1, 0, 0, 1, 1,
1.161118, 0.2443711, 1.658234, 0, 0, 0, 1, 1,
1.165605, -1.008699, 0.7296007, 0, 0, 0, 1, 1,
1.174279, 0.4650034, -0.8227325, 0, 0, 0, 1, 1,
1.174316, 0.6698855, 2.035401, 0, 0, 0, 1, 1,
1.185509, 1.780314, 0.3908238, 0, 0, 0, 1, 1,
1.190557, 0.7302612, 1.742676, 0, 0, 0, 1, 1,
1.202957, 1.480877, 0.07737309, 0, 0, 0, 1, 1,
1.204262, -1.523065, 1.670717, 1, 1, 1, 1, 1,
1.206813, 1.193165, -1.081365, 1, 1, 1, 1, 1,
1.209061, 0.7492329, 1.337014, 1, 1, 1, 1, 1,
1.228852, -2.56511, 2.669494, 1, 1, 1, 1, 1,
1.235037, -0.8271081, 0.2963987, 1, 1, 1, 1, 1,
1.244175, 0.1697204, 1.455517, 1, 1, 1, 1, 1,
1.249032, 1.129182, -0.4504161, 1, 1, 1, 1, 1,
1.25733, 0.08679747, 1.299803, 1, 1, 1, 1, 1,
1.258306, -0.5654935, 0.9213471, 1, 1, 1, 1, 1,
1.267418, -0.7051604, 3.212741, 1, 1, 1, 1, 1,
1.268196, -0.7802337, 2.746608, 1, 1, 1, 1, 1,
1.283001, 0.5078475, 2.189149, 1, 1, 1, 1, 1,
1.283008, -1.965542, 2.26458, 1, 1, 1, 1, 1,
1.28336, -0.899975, 2.406133, 1, 1, 1, 1, 1,
1.297228, -1.196993, 2.291695, 1, 1, 1, 1, 1,
1.298389, 0.961664, 0.5171468, 0, 0, 1, 1, 1,
1.301523, 1.465168, 0.9044424, 1, 0, 0, 1, 1,
1.303252, 0.2460736, 1.204206, 1, 0, 0, 1, 1,
1.322704, -1.662546, 2.379939, 1, 0, 0, 1, 1,
1.326092, -1.695513, 2.244444, 1, 0, 0, 1, 1,
1.333997, -1.556099, 2.078722, 1, 0, 0, 1, 1,
1.335781, 1.282908, 0.8497447, 0, 0, 0, 1, 1,
1.336232, 0.07532475, 0.4711755, 0, 0, 0, 1, 1,
1.342026, -0.8028595, 1.414979, 0, 0, 0, 1, 1,
1.344839, 0.0467453, 0.9332007, 0, 0, 0, 1, 1,
1.357514, -0.4306986, 2.258247, 0, 0, 0, 1, 1,
1.359827, 1.831733, 1.098157, 0, 0, 0, 1, 1,
1.360183, 0.7937024, 2.081465, 0, 0, 0, 1, 1,
1.361716, -1.224486, 2.351448, 1, 1, 1, 1, 1,
1.363222, -0.08490324, 2.164952, 1, 1, 1, 1, 1,
1.365362, 0.1527429, 1.341859, 1, 1, 1, 1, 1,
1.373572, 1.229334, 0.8995693, 1, 1, 1, 1, 1,
1.374189, 2.008561, -0.8700246, 1, 1, 1, 1, 1,
1.381471, -0.05590547, 1.088394, 1, 1, 1, 1, 1,
1.38293, -0.2448599, 0.4286782, 1, 1, 1, 1, 1,
1.394309, 0.8464938, 1.604558, 1, 1, 1, 1, 1,
1.397242, -0.2574823, 2.956808, 1, 1, 1, 1, 1,
1.427903, -3.207988, 1.2349, 1, 1, 1, 1, 1,
1.470048, -0.8238739, 1.020555, 1, 1, 1, 1, 1,
1.477751, -0.114775, 1.326133, 1, 1, 1, 1, 1,
1.479315, -2.135538, 2.223877, 1, 1, 1, 1, 1,
1.496633, -0.7015385, 2.493721, 1, 1, 1, 1, 1,
1.498668, 0.9210051, -0.5245491, 1, 1, 1, 1, 1,
1.505644, 1.526008, -0.3144284, 0, 0, 1, 1, 1,
1.511381, 0.4247563, 0.7891055, 1, 0, 0, 1, 1,
1.520642, 1.061242, 0.468609, 1, 0, 0, 1, 1,
1.53626, 0.6117062, 2.825477, 1, 0, 0, 1, 1,
1.553505, 2.178858, 0.4202846, 1, 0, 0, 1, 1,
1.555966, -0.9352944, 1.797728, 1, 0, 0, 1, 1,
1.565589, 0.799068, 1.914061, 0, 0, 0, 1, 1,
1.567744, -0.6996228, 0.5511023, 0, 0, 0, 1, 1,
1.577602, -0.4460284, 0.7603217, 0, 0, 0, 1, 1,
1.578905, -0.4655405, 3.320216, 0, 0, 0, 1, 1,
1.596988, -0.2989121, 2.560884, 0, 0, 0, 1, 1,
1.610891, -0.9560986, 3.093377, 0, 0, 0, 1, 1,
1.627223, -1.651471, 1.86419, 0, 0, 0, 1, 1,
1.630201, -0.4419069, 1.845948, 1, 1, 1, 1, 1,
1.635253, -2.263225, 1.61291, 1, 1, 1, 1, 1,
1.661597, -0.6570618, 2.084992, 1, 1, 1, 1, 1,
1.66545, -1.251869, 2.274747, 1, 1, 1, 1, 1,
1.696601, -1.495677, 1.93894, 1, 1, 1, 1, 1,
1.697132, -0.674472, 2.726061, 1, 1, 1, 1, 1,
1.697436, 0.3853773, 0.5237483, 1, 1, 1, 1, 1,
1.702993, -1.063848, 1.277768, 1, 1, 1, 1, 1,
1.71807, -2.019938, 2.077659, 1, 1, 1, 1, 1,
1.737584, -0.518783, 1.924378, 1, 1, 1, 1, 1,
1.751083, -1.620639, 3.291193, 1, 1, 1, 1, 1,
1.759059, -1.120529, 1.436943, 1, 1, 1, 1, 1,
1.766081, 1.62591, 1.397631, 1, 1, 1, 1, 1,
1.772781, 0.1461882, 2.689522, 1, 1, 1, 1, 1,
1.773795, -1.236836, 2.126764, 1, 1, 1, 1, 1,
1.775804, -1.172202, 0.01947932, 0, 0, 1, 1, 1,
1.791175, -0.1019216, 1.22858, 1, 0, 0, 1, 1,
1.791311, 1.514174, -1.080945, 1, 0, 0, 1, 1,
1.793689, -0.5374503, 2.689132, 1, 0, 0, 1, 1,
1.797044, -0.8071508, 1.227446, 1, 0, 0, 1, 1,
1.799075, 0.1927049, 1.980906, 1, 0, 0, 1, 1,
1.810299, 0.8258131, 1.174757, 0, 0, 0, 1, 1,
1.823729, -0.7070635, 1.072548, 0, 0, 0, 1, 1,
1.826792, 0.321619, 1.535304, 0, 0, 0, 1, 1,
1.830754, 0.4017252, 1.772728, 0, 0, 0, 1, 1,
1.844566, 1.242455, 1.799986, 0, 0, 0, 1, 1,
1.84553, -1.650707, 2.997427, 0, 0, 0, 1, 1,
1.852564, 0.3165004, 1.526528, 0, 0, 0, 1, 1,
1.867263, 0.4162036, 1.858084, 1, 1, 1, 1, 1,
1.88122, -1.458327, 1.528217, 1, 1, 1, 1, 1,
1.894132, -0.1904202, -0.5593179, 1, 1, 1, 1, 1,
1.907945, -2.98191, 2.931072, 1, 1, 1, 1, 1,
1.930643, 1.510504, 1.523129, 1, 1, 1, 1, 1,
1.993231, 1.350041, 0.6893999, 1, 1, 1, 1, 1,
1.994281, -0.6329628, 1.68564, 1, 1, 1, 1, 1,
1.998067, 0.8019122, -0.3810626, 1, 1, 1, 1, 1,
2.011434, -0.3781335, 1.286046, 1, 1, 1, 1, 1,
2.043579, 1.61259, 1.821548, 1, 1, 1, 1, 1,
2.052238, -0.8881186, 0.3275776, 1, 1, 1, 1, 1,
2.052476, 0.3002782, 1.026293, 1, 1, 1, 1, 1,
2.053822, -1.708868, 1.155368, 1, 1, 1, 1, 1,
2.072005, 0.07832085, 2.252936, 1, 1, 1, 1, 1,
2.092363, 1.060622, 2.593673, 1, 1, 1, 1, 1,
2.131148, 0.5685087, 1.745468, 0, 0, 1, 1, 1,
2.136616, 1.515388, 1.49631, 1, 0, 0, 1, 1,
2.138858, 0.006104051, 0.4185529, 1, 0, 0, 1, 1,
2.139149, -2.506755, 4.464607, 1, 0, 0, 1, 1,
2.161052, 0.2020371, 2.054797, 1, 0, 0, 1, 1,
2.163319, -0.1133364, -0.5050601, 1, 0, 0, 1, 1,
2.167318, -0.4086713, 0.09548367, 0, 0, 0, 1, 1,
2.203897, 1.865264, 1.429454, 0, 0, 0, 1, 1,
2.239395, -0.1750751, 1.951714, 0, 0, 0, 1, 1,
2.290802, -0.8548016, 0.7897489, 0, 0, 0, 1, 1,
2.3031, 0.5077252, 1.167554, 0, 0, 0, 1, 1,
2.408223, -0.9674577, 3.663468, 0, 0, 0, 1, 1,
2.471789, -0.2735741, 2.167476, 0, 0, 0, 1, 1,
2.518924, 0.5913798, 1.115614, 1, 1, 1, 1, 1,
2.524196, 0.717742, 2.226271, 1, 1, 1, 1, 1,
2.64506, 1.817484, 1.129127, 1, 1, 1, 1, 1,
2.767192, 0.5621132, 1.540797, 1, 1, 1, 1, 1,
2.876012, 0.1890188, 0.6498645, 1, 1, 1, 1, 1,
2.973452, 0.7897109, -0.4121521, 1, 1, 1, 1, 1,
3.229406, 1.499493, 2.276109, 1, 1, 1, 1, 1
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
var radius = 9.97317;
var distance = 35.03034;
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
mvMatrix.translate( 0.06145144, -0.0778687, 0.6249645 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.03034);
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
