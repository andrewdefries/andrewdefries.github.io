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
-3.425595, -0.7470348, -0.7526248, 1, 0, 0, 1,
-3.166536, -0.08175466, -1.258527, 1, 0.007843138, 0, 1,
-3.147704, -0.08217298, -2.362031, 1, 0.01176471, 0, 1,
-2.883832, -0.0673208, -3.690669, 1, 0.01960784, 0, 1,
-2.725672, -2.008751, -3.27214, 1, 0.02352941, 0, 1,
-2.658899, 0.9350914, -2.139406, 1, 0.03137255, 0, 1,
-2.639323, 1.836107, -1.033533, 1, 0.03529412, 0, 1,
-2.612361, 1.103783, -1.896505, 1, 0.04313726, 0, 1,
-2.573107, -0.618289, 1.314629, 1, 0.04705882, 0, 1,
-2.538944, -0.3200525, -1.451294, 1, 0.05490196, 0, 1,
-2.536908, -1.286814, -4.060838, 1, 0.05882353, 0, 1,
-2.491114, -1.615106, -3.705539, 1, 0.06666667, 0, 1,
-2.478102, -0.4649617, -1.517892, 1, 0.07058824, 0, 1,
-2.437775, 0.6789942, -0.755632, 1, 0.07843138, 0, 1,
-2.367235, -0.3059991, -1.470784, 1, 0.08235294, 0, 1,
-2.284335, 0.08886644, -0.7460631, 1, 0.09019608, 0, 1,
-2.23727, 0.8543981, -0.3720936, 1, 0.09411765, 0, 1,
-2.207611, -0.4171504, -2.929604, 1, 0.1019608, 0, 1,
-2.15244, 0.2850156, -0.3649743, 1, 0.1098039, 0, 1,
-2.150234, -0.3792028, -1.774137, 1, 0.1137255, 0, 1,
-2.127351, -0.03608662, -2.191044, 1, 0.1215686, 0, 1,
-2.090922, 0.1595794, -1.019596, 1, 0.1254902, 0, 1,
-2.069162, -1.060223, -3.662507, 1, 0.1333333, 0, 1,
-2.050149, 0.09491669, -0.5252365, 1, 0.1372549, 0, 1,
-2.049792, -1.0813, -1.518383, 1, 0.145098, 0, 1,
-2.049704, 0.1781299, -0.437571, 1, 0.1490196, 0, 1,
-2.039957, 0.1734954, -2.399124, 1, 0.1568628, 0, 1,
-2.034453, -2.123643, -4.82009, 1, 0.1607843, 0, 1,
-2.019034, -1.535014, -2.190447, 1, 0.1686275, 0, 1,
-1.993046, 0.5176522, 0.9691693, 1, 0.172549, 0, 1,
-1.991336, 0.731083, -1.646942, 1, 0.1803922, 0, 1,
-1.966424, -0.5067797, -1.941904, 1, 0.1843137, 0, 1,
-1.958758, 0.4494061, -0.5929356, 1, 0.1921569, 0, 1,
-1.957548, -0.4622297, 0.619225, 1, 0.1960784, 0, 1,
-1.92586, -0.1082045, -1.681925, 1, 0.2039216, 0, 1,
-1.924529, 1.698308, -0.9964523, 1, 0.2117647, 0, 1,
-1.884741, 1.003797, 1.82689, 1, 0.2156863, 0, 1,
-1.87885, 0.7021509, -1.908029, 1, 0.2235294, 0, 1,
-1.876145, 1.041596, -2.976593, 1, 0.227451, 0, 1,
-1.860482, 0.02513967, -3.11899, 1, 0.2352941, 0, 1,
-1.844935, -0.0005512869, -1.047333, 1, 0.2392157, 0, 1,
-1.829044, 0.6500823, -0.07146822, 1, 0.2470588, 0, 1,
-1.821295, -0.8354527, -2.345946, 1, 0.2509804, 0, 1,
-1.814298, -0.5525851, -0.2652823, 1, 0.2588235, 0, 1,
-1.807912, 0.8764993, -2.39769, 1, 0.2627451, 0, 1,
-1.806647, 0.379367, -1.456422, 1, 0.2705882, 0, 1,
-1.802966, 1.423446, -2.04814, 1, 0.2745098, 0, 1,
-1.791206, -0.5412788, -1.256187, 1, 0.282353, 0, 1,
-1.772607, -0.01960936, -1.02915, 1, 0.2862745, 0, 1,
-1.771673, 0.7597141, -1.103889, 1, 0.2941177, 0, 1,
-1.757562, 0.5050497, -1.698172, 1, 0.3019608, 0, 1,
-1.744705, -1.605075, -1.834863, 1, 0.3058824, 0, 1,
-1.743951, -0.5042701, -3.546569, 1, 0.3137255, 0, 1,
-1.730397, -0.8883632, -1.701946, 1, 0.3176471, 0, 1,
-1.6981, -0.7422935, -2.843144, 1, 0.3254902, 0, 1,
-1.687593, -1.31418, -2.089109, 1, 0.3294118, 0, 1,
-1.671171, -0.9029281, -2.358461, 1, 0.3372549, 0, 1,
-1.636503, 0.04573946, -1.830309, 1, 0.3411765, 0, 1,
-1.629566, 0.1167841, -1.807898, 1, 0.3490196, 0, 1,
-1.617476, -1.240576, -4.347864, 1, 0.3529412, 0, 1,
-1.613143, -0.04176616, -2.082029, 1, 0.3607843, 0, 1,
-1.574943, 1.342469, -1.789315, 1, 0.3647059, 0, 1,
-1.570961, 2.097414, 0.8687518, 1, 0.372549, 0, 1,
-1.550774, 1.077177, -1.111289, 1, 0.3764706, 0, 1,
-1.523873, -0.3625949, -3.130871, 1, 0.3843137, 0, 1,
-1.50189, 0.7025003, -0.3481717, 1, 0.3882353, 0, 1,
-1.499763, 0.6330472, -1.494649, 1, 0.3960784, 0, 1,
-1.479591, -0.3701605, -3.434046, 1, 0.4039216, 0, 1,
-1.478552, -1.040062, -0.2135045, 1, 0.4078431, 0, 1,
-1.455448, -0.6165092, -3.296129, 1, 0.4156863, 0, 1,
-1.425683, 0.5495123, -2.164081, 1, 0.4196078, 0, 1,
-1.413728, 1.072471, 0.0752074, 1, 0.427451, 0, 1,
-1.412322, -0.6738385, -0.7611948, 1, 0.4313726, 0, 1,
-1.402897, -0.2688476, 1.681516, 1, 0.4392157, 0, 1,
-1.402285, 0.5905719, -0.7303114, 1, 0.4431373, 0, 1,
-1.401095, -1.119337, -1.778894, 1, 0.4509804, 0, 1,
-1.395557, 0.2929969, -3.40391, 1, 0.454902, 0, 1,
-1.390165, -0.803319, -0.3829344, 1, 0.4627451, 0, 1,
-1.383313, -1.016277, -1.555099, 1, 0.4666667, 0, 1,
-1.37845, -0.8934922, -2.822047, 1, 0.4745098, 0, 1,
-1.368327, 0.7182595, -1.517902, 1, 0.4784314, 0, 1,
-1.357317, -2.499675, -3.860227, 1, 0.4862745, 0, 1,
-1.351058, -0.4550444, -2.772562, 1, 0.4901961, 0, 1,
-1.342104, -1.131712, -1.601532, 1, 0.4980392, 0, 1,
-1.3355, -1.122869, -3.167976, 1, 0.5058824, 0, 1,
-1.318893, -0.2659496, -1.936149, 1, 0.509804, 0, 1,
-1.314717, -0.8646015, -4.427113, 1, 0.5176471, 0, 1,
-1.308856, 0.4278151, -3.149673, 1, 0.5215687, 0, 1,
-1.30685, 0.2772863, -1.761571, 1, 0.5294118, 0, 1,
-1.300651, 0.9212705, -1.15537, 1, 0.5333334, 0, 1,
-1.29359, 1.134728, -0.349123, 1, 0.5411765, 0, 1,
-1.290467, -0.8085231, -0.4827149, 1, 0.5450981, 0, 1,
-1.288475, 0.9045397, -1.230431, 1, 0.5529412, 0, 1,
-1.282453, -1.092225, -2.068504, 1, 0.5568628, 0, 1,
-1.276322, -0.1282132, -2.207315, 1, 0.5647059, 0, 1,
-1.271309, -0.4702638, -3.14656, 1, 0.5686275, 0, 1,
-1.266131, -2.403379, -4.593269, 1, 0.5764706, 0, 1,
-1.26328, -0.9570157, -3.538991, 1, 0.5803922, 0, 1,
-1.256567, 0.4074175, -1.321635, 1, 0.5882353, 0, 1,
-1.249465, 1.578353, -0.3737473, 1, 0.5921569, 0, 1,
-1.24306, 2.494061, 0.9613816, 1, 0.6, 0, 1,
-1.230578, 0.1482749, -1.680847, 1, 0.6078432, 0, 1,
-1.225708, 0.7016895, -0.6356481, 1, 0.6117647, 0, 1,
-1.218902, -0.2999325, -0.7472826, 1, 0.6196079, 0, 1,
-1.214433, 1.766129, -1.508944, 1, 0.6235294, 0, 1,
-1.206674, 0.1531908, -2.432118, 1, 0.6313726, 0, 1,
-1.199218, 1.594108, -0.8978799, 1, 0.6352941, 0, 1,
-1.192581, 0.0146746, -1.589735, 1, 0.6431373, 0, 1,
-1.188748, 2.007183, -0.3478107, 1, 0.6470588, 0, 1,
-1.181756, -0.09629051, 0.1076535, 1, 0.654902, 0, 1,
-1.181416, -0.7459942, -2.164374, 1, 0.6588235, 0, 1,
-1.180603, -2.743018, -1.810436, 1, 0.6666667, 0, 1,
-1.176351, -1.385056, -3.503688, 1, 0.6705883, 0, 1,
-1.175942, 1.146615, 1.767169, 1, 0.6784314, 0, 1,
-1.170551, 0.1045644, -2.047164, 1, 0.682353, 0, 1,
-1.16901, -1.29052, -1.639398, 1, 0.6901961, 0, 1,
-1.167676, 0.8102297, -1.230824, 1, 0.6941177, 0, 1,
-1.16603, 1.644707, 3.224874, 1, 0.7019608, 0, 1,
-1.155817, 0.8583851, -0.2815115, 1, 0.7098039, 0, 1,
-1.154166, -0.7139624, -3.205498, 1, 0.7137255, 0, 1,
-1.139156, -1.519008, -2.60023, 1, 0.7215686, 0, 1,
-1.138489, 0.2009181, -1.368498, 1, 0.7254902, 0, 1,
-1.117999, 1.238268, 0.6704993, 1, 0.7333333, 0, 1,
-1.113507, 1.672596, -0.06604274, 1, 0.7372549, 0, 1,
-1.113466, -0.2943484, -0.6245732, 1, 0.7450981, 0, 1,
-1.111678, -0.2504285, -0.3650448, 1, 0.7490196, 0, 1,
-1.109307, 0.1429526, 0.7004713, 1, 0.7568628, 0, 1,
-1.098835, -0.421325, -1.679102, 1, 0.7607843, 0, 1,
-1.091161, 0.695332, -0.473215, 1, 0.7686275, 0, 1,
-1.089571, -0.02285157, -4.546107, 1, 0.772549, 0, 1,
-1.086717, -1.28008, -3.61064, 1, 0.7803922, 0, 1,
-1.086439, -1.298759, -3.074692, 1, 0.7843137, 0, 1,
-1.07711, 0.2641857, -1.708857, 1, 0.7921569, 0, 1,
-1.066843, 0.1659899, -0.1879292, 1, 0.7960784, 0, 1,
-1.065654, 0.08806773, -2.04072, 1, 0.8039216, 0, 1,
-1.065642, -0.5550599, -1.139322, 1, 0.8117647, 0, 1,
-1.058947, 0.5464519, 0.4073136, 1, 0.8156863, 0, 1,
-1.057898, -0.3453944, -2.019517, 1, 0.8235294, 0, 1,
-1.057608, -0.5610552, -1.700576, 1, 0.827451, 0, 1,
-1.052004, -2.856333, -2.909171, 1, 0.8352941, 0, 1,
-1.045853, 0.5932171, -2.654379, 1, 0.8392157, 0, 1,
-1.044993, -0.3551946, -3.350823, 1, 0.8470588, 0, 1,
-1.03276, 0.0882227, -2.48492, 1, 0.8509804, 0, 1,
-1.029562, 1.1756, -2.218385, 1, 0.8588235, 0, 1,
-1.013634, 0.2286364, -2.097048, 1, 0.8627451, 0, 1,
-1.00788, -2.476387, -2.996282, 1, 0.8705882, 0, 1,
-1.006578, -0.2606527, -1.46857, 1, 0.8745098, 0, 1,
-0.9967298, 0.9632082, -2.189105, 1, 0.8823529, 0, 1,
-0.9954028, -1.115327, -4.076083, 1, 0.8862745, 0, 1,
-0.9922934, -0.6545565, -2.628824, 1, 0.8941177, 0, 1,
-0.9884394, 0.8615978, -0.9681028, 1, 0.8980392, 0, 1,
-0.980593, -0.6675641, -1.063159, 1, 0.9058824, 0, 1,
-0.9733205, 1.193066, -0.9464319, 1, 0.9137255, 0, 1,
-0.9693589, -0.01896577, -2.031849, 1, 0.9176471, 0, 1,
-0.9680403, 0.607431, -1.707331, 1, 0.9254902, 0, 1,
-0.9618186, -0.587842, -2.468984, 1, 0.9294118, 0, 1,
-0.9605678, 1.610811, -0.5850961, 1, 0.9372549, 0, 1,
-0.9544344, -0.0652945, -1.243857, 1, 0.9411765, 0, 1,
-0.944656, 0.7720222, -2.608155, 1, 0.9490196, 0, 1,
-0.9444056, -0.4481987, -1.619734, 1, 0.9529412, 0, 1,
-0.9407607, 2.198134, 0.2937835, 1, 0.9607843, 0, 1,
-0.9375453, -0.3287066, -2.373895, 1, 0.9647059, 0, 1,
-0.9362593, 2.654274, -0.3228758, 1, 0.972549, 0, 1,
-0.9355491, 0.9106439, -0.9942589, 1, 0.9764706, 0, 1,
-0.935437, -0.1985039, -0.7389243, 1, 0.9843137, 0, 1,
-0.9309182, -1.004653, -2.87959, 1, 0.9882353, 0, 1,
-0.930205, -1.583897, -1.728635, 1, 0.9960784, 0, 1,
-0.9284922, 0.3248047, -0.6096212, 0.9960784, 1, 0, 1,
-0.9148799, -0.5774493, -3.528398, 0.9921569, 1, 0, 1,
-0.9130401, 0.05807299, -2.96612, 0.9843137, 1, 0, 1,
-0.9117796, 0.7520577, -0.1750036, 0.9803922, 1, 0, 1,
-0.9093091, 1.935801, -0.05602164, 0.972549, 1, 0, 1,
-0.9082478, 0.8272165, 0.4545529, 0.9686275, 1, 0, 1,
-0.9052927, -3.066359, -0.8385695, 0.9607843, 1, 0, 1,
-0.9047856, -2.02987, -2.372131, 0.9568627, 1, 0, 1,
-0.9005944, -0.6562659, -2.420808, 0.9490196, 1, 0, 1,
-0.9001025, -0.06765962, -1.911063, 0.945098, 1, 0, 1,
-0.8967504, -0.7800756, -1.905734, 0.9372549, 1, 0, 1,
-0.8936892, 0.3506688, -2.143832, 0.9333333, 1, 0, 1,
-0.8908542, -0.2738283, -3.540001, 0.9254902, 1, 0, 1,
-0.8906413, -1.257673, -1.261278, 0.9215686, 1, 0, 1,
-0.8868319, 0.6802731, -1.102786, 0.9137255, 1, 0, 1,
-0.8847879, 0.9261524, -0.525306, 0.9098039, 1, 0, 1,
-0.8840129, -0.8542949, -2.560421, 0.9019608, 1, 0, 1,
-0.8782837, 0.02044454, -1.095562, 0.8941177, 1, 0, 1,
-0.8733128, 0.05180292, -1.728619, 0.8901961, 1, 0, 1,
-0.868602, 1.792229, -0.8125025, 0.8823529, 1, 0, 1,
-0.8667977, 0.2730911, -1.95712, 0.8784314, 1, 0, 1,
-0.8600032, -0.6649203, -1.434077, 0.8705882, 1, 0, 1,
-0.8571748, 1.271886, -0.993062, 0.8666667, 1, 0, 1,
-0.8556201, 1.631501, -2.201586, 0.8588235, 1, 0, 1,
-0.8486605, -0.2287413, -2.02623, 0.854902, 1, 0, 1,
-0.838497, 1.869464, -0.151821, 0.8470588, 1, 0, 1,
-0.8348553, 0.8771375, -1.468903, 0.8431373, 1, 0, 1,
-0.8323753, -2.214209, -2.468642, 0.8352941, 1, 0, 1,
-0.8318768, 1.859978, 2.359185, 0.8313726, 1, 0, 1,
-0.8272818, -0.6626199, -3.329135, 0.8235294, 1, 0, 1,
-0.8229493, 0.5423929, 0.1502773, 0.8196079, 1, 0, 1,
-0.8213251, 1.344785, -0.69613, 0.8117647, 1, 0, 1,
-0.817692, -1.620987, -2.856932, 0.8078431, 1, 0, 1,
-0.8139914, -1.982018, -2.86229, 0.8, 1, 0, 1,
-0.8076169, 0.2613047, 0.7250403, 0.7921569, 1, 0, 1,
-0.8070958, -0.1216624, -1.063461, 0.7882353, 1, 0, 1,
-0.8067855, 2.607317, -1.147308, 0.7803922, 1, 0, 1,
-0.8052529, -2.052122, -3.28436, 0.7764706, 1, 0, 1,
-0.8045428, 0.3732518, -0.3583246, 0.7686275, 1, 0, 1,
-0.7987679, -1.070237, -2.625208, 0.7647059, 1, 0, 1,
-0.7987552, -0.9747602, -1.227228, 0.7568628, 1, 0, 1,
-0.7868047, 0.2526779, -2.221279, 0.7529412, 1, 0, 1,
-0.7830049, -0.09352056, -2.15518, 0.7450981, 1, 0, 1,
-0.7818753, 0.3104554, -1.795617, 0.7411765, 1, 0, 1,
-0.7813146, 1.015421, -0.4631671, 0.7333333, 1, 0, 1,
-0.7672151, 0.5351092, -2.236436, 0.7294118, 1, 0, 1,
-0.7655171, -0.4836199, -1.340302, 0.7215686, 1, 0, 1,
-0.7654722, 0.5559403, -1.481849, 0.7176471, 1, 0, 1,
-0.7623867, -2.130914, -2.627988, 0.7098039, 1, 0, 1,
-0.7604437, 0.4573177, -0.7539238, 0.7058824, 1, 0, 1,
-0.7589194, 1.092, -0.7233573, 0.6980392, 1, 0, 1,
-0.755676, 0.3387201, -1.534055, 0.6901961, 1, 0, 1,
-0.74787, 1.217919, -1.133526, 0.6862745, 1, 0, 1,
-0.7448732, -0.7155595, -3.169892, 0.6784314, 1, 0, 1,
-0.7420827, -0.5324296, -2.207324, 0.6745098, 1, 0, 1,
-0.7311653, 0.8338873, -0.7292092, 0.6666667, 1, 0, 1,
-0.7292258, 2.371859, 1.897073, 0.6627451, 1, 0, 1,
-0.7248751, 0.5962782, -1.836694, 0.654902, 1, 0, 1,
-0.7237816, 0.5937657, -1.817453, 0.6509804, 1, 0, 1,
-0.7168735, -0.9215702, -2.712836, 0.6431373, 1, 0, 1,
-0.7111424, -0.2875363, -3.255677, 0.6392157, 1, 0, 1,
-0.7081744, 0.2538398, -1.566898, 0.6313726, 1, 0, 1,
-0.7071165, 1.16054, -0.6336791, 0.627451, 1, 0, 1,
-0.700622, -0.4622485, -2.560005, 0.6196079, 1, 0, 1,
-0.6904235, -0.2055509, -1.786653, 0.6156863, 1, 0, 1,
-0.6902652, 1.240105, -1.435448, 0.6078432, 1, 0, 1,
-0.6847852, 1.162183, -1.326971, 0.6039216, 1, 0, 1,
-0.6838502, -1.652733, -4.58721, 0.5960785, 1, 0, 1,
-0.6825492, 0.07562628, -1.585061, 0.5882353, 1, 0, 1,
-0.6760504, -0.1842744, -1.881043, 0.5843138, 1, 0, 1,
-0.6649321, 0.326993, -0.7425981, 0.5764706, 1, 0, 1,
-0.6486128, 0.7335211, 0.6522205, 0.572549, 1, 0, 1,
-0.6469282, 1.048057, -1.304717, 0.5647059, 1, 0, 1,
-0.6443172, -1.556938, -3.748781, 0.5607843, 1, 0, 1,
-0.6440462, -0.45981, -1.235692, 0.5529412, 1, 0, 1,
-0.6423447, 0.6158519, -1.48338, 0.5490196, 1, 0, 1,
-0.6404079, 0.1383111, -2.176087, 0.5411765, 1, 0, 1,
-0.6392964, 0.2042563, -2.009279, 0.5372549, 1, 0, 1,
-0.6368613, 0.08074279, -0.9564537, 0.5294118, 1, 0, 1,
-0.6359749, -1.185469, -2.610641, 0.5254902, 1, 0, 1,
-0.6353093, -2.141749, -2.14993, 0.5176471, 1, 0, 1,
-0.6351058, 0.5203465, -2.307733, 0.5137255, 1, 0, 1,
-0.6322966, 1.148186, 0.6392939, 0.5058824, 1, 0, 1,
-0.6278045, -0.6565321, -4.973409, 0.5019608, 1, 0, 1,
-0.6249022, 0.4820775, -2.476328, 0.4941176, 1, 0, 1,
-0.6242467, 0.5744812, -0.9321488, 0.4862745, 1, 0, 1,
-0.6179684, -0.1528357, -2.753733, 0.4823529, 1, 0, 1,
-0.6176082, -0.7480372, -1.809531, 0.4745098, 1, 0, 1,
-0.6174021, -0.8403536, -2.984375, 0.4705882, 1, 0, 1,
-0.6158003, -0.1471342, -0.9968872, 0.4627451, 1, 0, 1,
-0.6127545, -2.267025, -2.226752, 0.4588235, 1, 0, 1,
-0.611537, 0.1603088, -2.49005, 0.4509804, 1, 0, 1,
-0.6104999, 0.9727299, 0.1480058, 0.4470588, 1, 0, 1,
-0.6079196, 2.180559, -0.558327, 0.4392157, 1, 0, 1,
-0.6070028, -0.346496, -0.2516211, 0.4352941, 1, 0, 1,
-0.6068697, 1.357623, -0.6045783, 0.427451, 1, 0, 1,
-0.6066694, -0.3665765, -0.09927733, 0.4235294, 1, 0, 1,
-0.6021687, 2.249709, -1.348647, 0.4156863, 1, 0, 1,
-0.6015436, -2.476727, -1.356264, 0.4117647, 1, 0, 1,
-0.5971549, 0.8312762, -0.7425603, 0.4039216, 1, 0, 1,
-0.591585, -0.8272381, -0.6036037, 0.3960784, 1, 0, 1,
-0.5897142, -0.3000701, -4.204311, 0.3921569, 1, 0, 1,
-0.5874336, -1.20442, -2.633389, 0.3843137, 1, 0, 1,
-0.5863945, 0.1226612, -0.269296, 0.3803922, 1, 0, 1,
-0.5863649, 0.1554936, -2.21647, 0.372549, 1, 0, 1,
-0.5819042, 0.4937563, -1.494049, 0.3686275, 1, 0, 1,
-0.5786784, -0.2948501, -2.864956, 0.3607843, 1, 0, 1,
-0.5780752, 1.142354, -1.580989, 0.3568628, 1, 0, 1,
-0.5703734, -0.2951952, -2.216231, 0.3490196, 1, 0, 1,
-0.5653643, -0.5927172, -1.600976, 0.345098, 1, 0, 1,
-0.5609913, 0.3092715, 0.9446809, 0.3372549, 1, 0, 1,
-0.558546, -0.7505404, -1.526902, 0.3333333, 1, 0, 1,
-0.5560535, 0.6509527, -0.02021377, 0.3254902, 1, 0, 1,
-0.5549726, -1.703411, -3.253853, 0.3215686, 1, 0, 1,
-0.5516641, 0.05760301, -1.051501, 0.3137255, 1, 0, 1,
-0.5505677, -0.2921992, -2.949536, 0.3098039, 1, 0, 1,
-0.544807, 0.6880517, -1.56876, 0.3019608, 1, 0, 1,
-0.5424659, 0.3262379, -0.9147687, 0.2941177, 1, 0, 1,
-0.5375308, 1.46258, 0.5515325, 0.2901961, 1, 0, 1,
-0.5351881, 0.916041, 0.01176752, 0.282353, 1, 0, 1,
-0.534329, 0.6114786, -0.7004121, 0.2784314, 1, 0, 1,
-0.5324066, 0.1701279, 0.6614822, 0.2705882, 1, 0, 1,
-0.5313947, 0.4617322, -0.7500284, 0.2666667, 1, 0, 1,
-0.5274922, -0.9005324, -1.03541, 0.2588235, 1, 0, 1,
-0.5196118, -0.3219377, -3.062045, 0.254902, 1, 0, 1,
-0.518451, 0.1169715, 0.6573216, 0.2470588, 1, 0, 1,
-0.5174028, -0.5512429, -2.856995, 0.2431373, 1, 0, 1,
-0.5099269, 0.9643345, -0.3091658, 0.2352941, 1, 0, 1,
-0.5067656, 0.1776559, -0.3171186, 0.2313726, 1, 0, 1,
-0.5055875, 0.0231287, -1.76957, 0.2235294, 1, 0, 1,
-0.5042726, 0.489507, -0.004301709, 0.2196078, 1, 0, 1,
-0.5037462, -1.324513, -3.492456, 0.2117647, 1, 0, 1,
-0.4945923, 2.424384, 0.08569477, 0.2078431, 1, 0, 1,
-0.4914365, 0.5229826, 0.4383274, 0.2, 1, 0, 1,
-0.4909421, 1.124193, -1.591789, 0.1921569, 1, 0, 1,
-0.4863448, 0.4255455, -2.031497, 0.1882353, 1, 0, 1,
-0.4849795, 0.6152748, -0.7246425, 0.1803922, 1, 0, 1,
-0.4789328, 0.7301276, -1.036083, 0.1764706, 1, 0, 1,
-0.4748255, 0.7178757, -0.09515783, 0.1686275, 1, 0, 1,
-0.4675532, 0.2896628, 0.05363266, 0.1647059, 1, 0, 1,
-0.4668102, 0.5828879, -0.7692993, 0.1568628, 1, 0, 1,
-0.4638205, -1.51985, -1.671876, 0.1529412, 1, 0, 1,
-0.4627046, 0.118578, 0.9260937, 0.145098, 1, 0, 1,
-0.4593817, -1.342996, -2.648981, 0.1411765, 1, 0, 1,
-0.4571922, 0.7565706, -1.448987, 0.1333333, 1, 0, 1,
-0.4559277, 0.08861426, -1.105404, 0.1294118, 1, 0, 1,
-0.4473506, -1.584731, -3.814464, 0.1215686, 1, 0, 1,
-0.4460238, -0.2598314, -0.5815456, 0.1176471, 1, 0, 1,
-0.4441876, -0.8282917, -2.263804, 0.1098039, 1, 0, 1,
-0.4393936, 0.8707379, -0.09297728, 0.1058824, 1, 0, 1,
-0.4383996, -0.9327978, -2.542606, 0.09803922, 1, 0, 1,
-0.4367549, 1.742995, 0.5833406, 0.09019608, 1, 0, 1,
-0.4345945, 0.4579297, -1.683009, 0.08627451, 1, 0, 1,
-0.4341155, 0.07625844, -0.02807383, 0.07843138, 1, 0, 1,
-0.4308227, -0.6569671, -3.11166, 0.07450981, 1, 0, 1,
-0.4193135, 0.9181123, -0.3889467, 0.06666667, 1, 0, 1,
-0.4164936, -1.148394, -4.069486, 0.0627451, 1, 0, 1,
-0.408757, 0.8667051, -0.9432729, 0.05490196, 1, 0, 1,
-0.4068768, 1.406841, 1.128216, 0.05098039, 1, 0, 1,
-0.4042709, -1.707829, -2.891471, 0.04313726, 1, 0, 1,
-0.4034874, 0.336127, -1.118213, 0.03921569, 1, 0, 1,
-0.4010101, -0.730957, -1.943624, 0.03137255, 1, 0, 1,
-0.4002393, -0.6051368, -0.3987621, 0.02745098, 1, 0, 1,
-0.3989272, -0.4446364, -2.356079, 0.01960784, 1, 0, 1,
-0.3970173, -0.9716408, -2.976391, 0.01568628, 1, 0, 1,
-0.396207, 1.397583, -1.344746, 0.007843138, 1, 0, 1,
-0.3945142, 0.228997, -0.2698167, 0.003921569, 1, 0, 1,
-0.3911279, -1.569603, -3.853042, 0, 1, 0.003921569, 1,
-0.3891833, 0.3650068, -0.9338319, 0, 1, 0.01176471, 1,
-0.3852623, -0.8742126, -3.307807, 0, 1, 0.01568628, 1,
-0.3850624, 0.5235742, 0.7954018, 0, 1, 0.02352941, 1,
-0.3822115, 2.762425, -0.979142, 0, 1, 0.02745098, 1,
-0.3810681, -0.8294209, -2.842795, 0, 1, 0.03529412, 1,
-0.378409, 0.696963, 0.01898732, 0, 1, 0.03921569, 1,
-0.3698649, 0.5429827, -0.02175952, 0, 1, 0.04705882, 1,
-0.3675696, -0.7947093, -2.880931, 0, 1, 0.05098039, 1,
-0.3672215, -1.114758, -3.789541, 0, 1, 0.05882353, 1,
-0.3648024, -0.6090131, -3.385139, 0, 1, 0.0627451, 1,
-0.3644186, 0.9007388, 0.1195945, 0, 1, 0.07058824, 1,
-0.3641196, -0.7774862, -2.228063, 0, 1, 0.07450981, 1,
-0.3639128, 0.2377357, -1.664911, 0, 1, 0.08235294, 1,
-0.3629249, 2.03549, 0.4033849, 0, 1, 0.08627451, 1,
-0.3535002, 1.420719, 0.5347298, 0, 1, 0.09411765, 1,
-0.353082, 1.185548, -0.7830418, 0, 1, 0.1019608, 1,
-0.349148, -0.3608855, -0.308268, 0, 1, 0.1058824, 1,
-0.3488538, -0.2483042, -2.143708, 0, 1, 0.1137255, 1,
-0.3470209, 0.7845293, -1.70193, 0, 1, 0.1176471, 1,
-0.3439397, -0.8768538, -1.640496, 0, 1, 0.1254902, 1,
-0.3435419, -0.3468561, -2.552588, 0, 1, 0.1294118, 1,
-0.3417656, 0.9070469, 0.3403853, 0, 1, 0.1372549, 1,
-0.3414255, -2.290962, -3.236999, 0, 1, 0.1411765, 1,
-0.3410485, -1.639123, -4.058127, 0, 1, 0.1490196, 1,
-0.3391739, -0.9557172, -3.126614, 0, 1, 0.1529412, 1,
-0.3321741, -0.3916937, -2.155328, 0, 1, 0.1607843, 1,
-0.3301659, -1.311146, -3.470256, 0, 1, 0.1647059, 1,
-0.3276851, -1.498395, -3.32304, 0, 1, 0.172549, 1,
-0.3271807, 0.5569479, -0.4856642, 0, 1, 0.1764706, 1,
-0.3259898, 1.082457, 0.2462776, 0, 1, 0.1843137, 1,
-0.3244543, 1.995321, -1.06851, 0, 1, 0.1882353, 1,
-0.3237987, -0.02669106, -2.084581, 0, 1, 0.1960784, 1,
-0.3227126, 0.6434733, 0.582716, 0, 1, 0.2039216, 1,
-0.3206653, -0.3986294, -2.70691, 0, 1, 0.2078431, 1,
-0.3199749, -0.3227224, -2.732471, 0, 1, 0.2156863, 1,
-0.3190048, -0.9380135, -1.600524, 0, 1, 0.2196078, 1,
-0.3158186, 0.9681937, -0.1761645, 0, 1, 0.227451, 1,
-0.3036205, -1.188608, -3.2469, 0, 1, 0.2313726, 1,
-0.3032689, 1.264048, 0.2870192, 0, 1, 0.2392157, 1,
-0.3015657, 0.1779419, -2.937978, 0, 1, 0.2431373, 1,
-0.2893103, -0.3481817, -2.753617, 0, 1, 0.2509804, 1,
-0.2885289, 1.772512, 0.4364265, 0, 1, 0.254902, 1,
-0.2864332, 1.776057, 0.8024737, 0, 1, 0.2627451, 1,
-0.2844127, 0.8851708, 0.6001245, 0, 1, 0.2666667, 1,
-0.281261, -0.520075, -2.902633, 0, 1, 0.2745098, 1,
-0.2793696, -1.549155, -2.534863, 0, 1, 0.2784314, 1,
-0.2763857, 0.9728336, -2.14805, 0, 1, 0.2862745, 1,
-0.2731271, -0.2908268, -0.5371069, 0, 1, 0.2901961, 1,
-0.2729659, -1.403669, -3.566874, 0, 1, 0.2980392, 1,
-0.2711595, 0.1057028, -0.5238936, 0, 1, 0.3058824, 1,
-0.2672882, -0.6339152, -3.158203, 0, 1, 0.3098039, 1,
-0.2632984, 1.400625, 1.191606, 0, 1, 0.3176471, 1,
-0.2625745, 1.565796, 0.5461279, 0, 1, 0.3215686, 1,
-0.2581162, 0.8106851, 1.216421, 0, 1, 0.3294118, 1,
-0.2567768, 1.476395, -0.1229877, 0, 1, 0.3333333, 1,
-0.2567019, -1.099441, -2.934042, 0, 1, 0.3411765, 1,
-0.2529781, 0.304879, -2.300443, 0, 1, 0.345098, 1,
-0.2521657, -0.4374721, -2.528957, 0, 1, 0.3529412, 1,
-0.2428587, 0.3817255, -2.384509, 0, 1, 0.3568628, 1,
-0.2425765, -0.8022548, -3.175933, 0, 1, 0.3647059, 1,
-0.2420674, 1.455599, 0.595776, 0, 1, 0.3686275, 1,
-0.2369888, -2.125282, -2.935957, 0, 1, 0.3764706, 1,
-0.2312413, 2.029603, -1.186572, 0, 1, 0.3803922, 1,
-0.2280385, 0.007609904, -1.674403, 0, 1, 0.3882353, 1,
-0.2241145, 0.3816528, -0.5494614, 0, 1, 0.3921569, 1,
-0.2226368, -0.11906, -2.822251, 0, 1, 0.4, 1,
-0.219396, -1.839241, -2.273002, 0, 1, 0.4078431, 1,
-0.2164866, -0.5718024, -4.772197, 0, 1, 0.4117647, 1,
-0.2125715, 1.061463, 1.131361, 0, 1, 0.4196078, 1,
-0.2065079, -0.9110786, -1.243847, 0, 1, 0.4235294, 1,
-0.2022657, -0.03757713, -2.042199, 0, 1, 0.4313726, 1,
-0.199785, -1.107581, -3.701308, 0, 1, 0.4352941, 1,
-0.1963692, 0.4904257, -0.1729462, 0, 1, 0.4431373, 1,
-0.1936841, 0.7254503, 0.6933511, 0, 1, 0.4470588, 1,
-0.1932655, 0.6750315, 0.7568842, 0, 1, 0.454902, 1,
-0.1877712, -0.4214632, -2.496455, 0, 1, 0.4588235, 1,
-0.186077, 0.0432062, 0.2854425, 0, 1, 0.4666667, 1,
-0.1843957, -0.2661329, -0.5219998, 0, 1, 0.4705882, 1,
-0.1804669, -0.2771456, -2.730493, 0, 1, 0.4784314, 1,
-0.1772757, -1.86042, -1.554732, 0, 1, 0.4823529, 1,
-0.1762831, 1.748142, -2.25183, 0, 1, 0.4901961, 1,
-0.1759077, -1.245393, -2.604921, 0, 1, 0.4941176, 1,
-0.172803, 0.2374072, -0.3638427, 0, 1, 0.5019608, 1,
-0.1665349, 0.3703898, -0.2570638, 0, 1, 0.509804, 1,
-0.1644334, 0.3646866, -2.10694, 0, 1, 0.5137255, 1,
-0.1629008, -0.6789075, -3.229579, 0, 1, 0.5215687, 1,
-0.1616286, -0.2877446, -3.585794, 0, 1, 0.5254902, 1,
-0.1605786, -0.02188267, -1.277384, 0, 1, 0.5333334, 1,
-0.1586572, 0.4557382, 0.4108691, 0, 1, 0.5372549, 1,
-0.1573194, -0.3177536, -3.121702, 0, 1, 0.5450981, 1,
-0.1567722, -0.2186604, -2.563502, 0, 1, 0.5490196, 1,
-0.1545278, 1.088378, -0.5677468, 0, 1, 0.5568628, 1,
-0.1499291, 1.200678, -0.1028678, 0, 1, 0.5607843, 1,
-0.1483595, -0.4222432, -0.9643613, 0, 1, 0.5686275, 1,
-0.1476136, -0.9805616, -4.077392, 0, 1, 0.572549, 1,
-0.1473294, 0.7166066, -0.4580538, 0, 1, 0.5803922, 1,
-0.1456419, 1.64671, -1.083791, 0, 1, 0.5843138, 1,
-0.14502, -0.587559, -2.275362, 0, 1, 0.5921569, 1,
-0.1439884, -0.7625445, -2.518239, 0, 1, 0.5960785, 1,
-0.1386805, -0.1804033, -1.813615, 0, 1, 0.6039216, 1,
-0.1366707, 0.1630174, -0.989662, 0, 1, 0.6117647, 1,
-0.1348782, -0.3558038, -2.494076, 0, 1, 0.6156863, 1,
-0.1345903, 1.39378, -2.01635, 0, 1, 0.6235294, 1,
-0.1336509, -1.581808, -4.879141, 0, 1, 0.627451, 1,
-0.1203595, 0.9244285, 1.041254, 0, 1, 0.6352941, 1,
-0.1142947, 0.3966233, 1.178403, 0, 1, 0.6392157, 1,
-0.1127397, 0.4296267, 2.172384, 0, 1, 0.6470588, 1,
-0.1116202, -0.3665641, -4.878067, 0, 1, 0.6509804, 1,
-0.1098563, 0.3339188, 0.5609799, 0, 1, 0.6588235, 1,
-0.1093586, -0.03693748, -2.327032, 0, 1, 0.6627451, 1,
-0.105937, 0.931114, -1.403802, 0, 1, 0.6705883, 1,
-0.1021805, -1.556142, -1.043549, 0, 1, 0.6745098, 1,
-0.101233, 0.6654583, -0.9605678, 0, 1, 0.682353, 1,
-0.1011172, -0.09044744, -2.024588, 0, 1, 0.6862745, 1,
-0.1005144, -1.342136, -2.758124, 0, 1, 0.6941177, 1,
-0.09803346, -1.228035, -2.230757, 0, 1, 0.7019608, 1,
-0.09463987, 1.272248, -0.3735747, 0, 1, 0.7058824, 1,
-0.09203675, 0.2695302, -0.7572965, 0, 1, 0.7137255, 1,
-0.08610301, 0.0947547, -0.8013378, 0, 1, 0.7176471, 1,
-0.08462006, -0.1118833, -2.693196, 0, 1, 0.7254902, 1,
-0.07492283, 0.2511554, -0.5256204, 0, 1, 0.7294118, 1,
-0.07351156, -0.5415998, -1.928073, 0, 1, 0.7372549, 1,
-0.07280897, -2.21279, -4.306005, 0, 1, 0.7411765, 1,
-0.06989583, -0.9770464, -2.74747, 0, 1, 0.7490196, 1,
-0.06826151, 1.26145, -2.084105, 0, 1, 0.7529412, 1,
-0.06567916, 1.634633, 0.08242816, 0, 1, 0.7607843, 1,
-0.05560098, -0.8605709, -3.407082, 0, 1, 0.7647059, 1,
-0.05230772, -2.321237, -2.080024, 0, 1, 0.772549, 1,
-0.05155779, 0.7245672, -0.3300407, 0, 1, 0.7764706, 1,
-0.04360282, -0.3264548, -2.336489, 0, 1, 0.7843137, 1,
-0.03998126, 1.101, 0.8022513, 0, 1, 0.7882353, 1,
-0.03475148, 0.5590975, 0.05206039, 0, 1, 0.7960784, 1,
-0.03357451, 0.212966, -0.2426032, 0, 1, 0.8039216, 1,
-0.03207326, -1.531715, -3.13834, 0, 1, 0.8078431, 1,
-0.03139805, -1.461566, -1.616865, 0, 1, 0.8156863, 1,
-0.03079506, -0.1159337, -1.092284, 0, 1, 0.8196079, 1,
-0.0298668, 0.2280015, 0.01724431, 0, 1, 0.827451, 1,
-0.02879366, 0.6921864, 0.4510542, 0, 1, 0.8313726, 1,
-0.02703417, -0.1559815, -2.5062, 0, 1, 0.8392157, 1,
-0.02592003, -1.177436, -1.782694, 0, 1, 0.8431373, 1,
-0.02530895, 0.6279711, -1.483519, 0, 1, 0.8509804, 1,
-0.01860526, 0.5437644, -0.0132944, 0, 1, 0.854902, 1,
-0.01574888, 0.7854792, 0.6846374, 0, 1, 0.8627451, 1,
-0.01546674, 1.323392, -0.06021504, 0, 1, 0.8666667, 1,
-0.0130224, 1.30753, -0.440318, 0, 1, 0.8745098, 1,
-0.005000641, -0.1447445, -3.602088, 0, 1, 0.8784314, 1,
-0.001330918, -0.6563316, -3.067102, 0, 1, 0.8862745, 1,
-0.000455888, -0.04718557, -1.891101, 0, 1, 0.8901961, 1,
-0.0004539708, 0.4803968, -1.075839, 0, 1, 0.8980392, 1,
0.005164964, -0.9568393, 3.116288, 0, 1, 0.9058824, 1,
0.006174665, -0.6586701, 3.097299, 0, 1, 0.9098039, 1,
0.006401822, 0.4786767, 0.8843532, 0, 1, 0.9176471, 1,
0.007326446, 1.05522, 1.311713, 0, 1, 0.9215686, 1,
0.009917155, -0.8608592, 2.323068, 0, 1, 0.9294118, 1,
0.0103464, 1.333607, 0.05814621, 0, 1, 0.9333333, 1,
0.01208944, 1.206181, -1.531978, 0, 1, 0.9411765, 1,
0.01246814, 0.3878707, 0.7612029, 0, 1, 0.945098, 1,
0.01812064, -0.3782661, 3.10964, 0, 1, 0.9529412, 1,
0.0196916, -1.341641, 2.941602, 0, 1, 0.9568627, 1,
0.02116094, 1.862132, 0.8482699, 0, 1, 0.9647059, 1,
0.02219828, 1.523753, 0.4073254, 0, 1, 0.9686275, 1,
0.0260317, -0.07747774, 3.236395, 0, 1, 0.9764706, 1,
0.02675151, 0.502917, 0.634778, 0, 1, 0.9803922, 1,
0.0318356, 0.2820632, -1.186897, 0, 1, 0.9882353, 1,
0.0337297, -0.6824395, 2.978258, 0, 1, 0.9921569, 1,
0.03450737, 1.466058, 1.148314, 0, 1, 1, 1,
0.03676756, -0.8330541, 3.268718, 0, 0.9921569, 1, 1,
0.03850095, 0.2056373, -0.774177, 0, 0.9882353, 1, 1,
0.04180675, -0.3303062, 4.72535, 0, 0.9803922, 1, 1,
0.0420302, -0.4856578, 2.483237, 0, 0.9764706, 1, 1,
0.0458164, 0.5041372, 0.3921141, 0, 0.9686275, 1, 1,
0.04724628, -0.898016, 4.378679, 0, 0.9647059, 1, 1,
0.04739314, -1.730673, 4.548188, 0, 0.9568627, 1, 1,
0.04803072, 0.08411007, 0.3648408, 0, 0.9529412, 1, 1,
0.05393491, -0.5925711, 3.617375, 0, 0.945098, 1, 1,
0.05420128, 0.4312396, 0.131415, 0, 0.9411765, 1, 1,
0.05581572, -0.5177096, 2.910866, 0, 0.9333333, 1, 1,
0.05688689, 1.119923, -0.1169463, 0, 0.9294118, 1, 1,
0.06599033, -0.9740605, 2.744403, 0, 0.9215686, 1, 1,
0.06689422, 0.8742725, -1.756054, 0, 0.9176471, 1, 1,
0.06875835, 0.9454254, 2.196025, 0, 0.9098039, 1, 1,
0.07490458, -0.5751465, 2.073974, 0, 0.9058824, 1, 1,
0.07751793, 2.330415, -0.1162342, 0, 0.8980392, 1, 1,
0.07777821, 0.3338038, 1.186382, 0, 0.8901961, 1, 1,
0.07840256, 0.2086546, -0.9280779, 0, 0.8862745, 1, 1,
0.0793405, 0.009203955, 2.189374, 0, 0.8784314, 1, 1,
0.08892068, -1.062354, 2.8666, 0, 0.8745098, 1, 1,
0.08893052, -0.57662, 3.039619, 0, 0.8666667, 1, 1,
0.09038644, 0.346724, 1.13412, 0, 0.8627451, 1, 1,
0.09073388, -0.9161795, 2.726377, 0, 0.854902, 1, 1,
0.09130812, -0.2867099, 4.019958, 0, 0.8509804, 1, 1,
0.0922058, -0.4661349, 2.026022, 0, 0.8431373, 1, 1,
0.1030337, -0.04473714, 2.265445, 0, 0.8392157, 1, 1,
0.1031876, -0.2679343, 2.49304, 0, 0.8313726, 1, 1,
0.1053781, 0.6111366, -0.196606, 0, 0.827451, 1, 1,
0.1056202, -0.5460829, 3.654851, 0, 0.8196079, 1, 1,
0.106202, -0.01498266, 1.999642, 0, 0.8156863, 1, 1,
0.1070613, 0.734885, 0.1641862, 0, 0.8078431, 1, 1,
0.1101298, 1.63632, 0.8465108, 0, 0.8039216, 1, 1,
0.1104333, -2.986039, 3.1416, 0, 0.7960784, 1, 1,
0.1114157, -1.653158, 4.612803, 0, 0.7882353, 1, 1,
0.1123142, -1.146102, 4.866433, 0, 0.7843137, 1, 1,
0.1138782, -0.9271578, 4.00324, 0, 0.7764706, 1, 1,
0.1152182, -1.740255, 2.547676, 0, 0.772549, 1, 1,
0.1186674, -2.291035, 1.141312, 0, 0.7647059, 1, 1,
0.1208381, 0.3896039, 0.9795141, 0, 0.7607843, 1, 1,
0.1211665, -1.160502, 1.166031, 0, 0.7529412, 1, 1,
0.1225984, -1.628921, 3.473447, 0, 0.7490196, 1, 1,
0.1251144, -0.9233816, 2.614867, 0, 0.7411765, 1, 1,
0.1257535, 0.1599239, 2.192359, 0, 0.7372549, 1, 1,
0.1289543, 0.7919319, 0.08367965, 0, 0.7294118, 1, 1,
0.129765, 0.820103, -0.3429123, 0, 0.7254902, 1, 1,
0.1316396, 0.1299997, 1.542528, 0, 0.7176471, 1, 1,
0.1331015, 0.3546835, 0.3257638, 0, 0.7137255, 1, 1,
0.1335582, 0.9170952, 0.4783675, 0, 0.7058824, 1, 1,
0.1352234, -1.069301, 4.727597, 0, 0.6980392, 1, 1,
0.1365078, 1.337991, -1.970251, 0, 0.6941177, 1, 1,
0.143089, 0.1648591, 2.521252, 0, 0.6862745, 1, 1,
0.147867, -0.7439166, 3.281549, 0, 0.682353, 1, 1,
0.148559, -0.9481305, 4.303275, 0, 0.6745098, 1, 1,
0.1494476, -0.7906486, 2.567758, 0, 0.6705883, 1, 1,
0.1498851, 0.5961259, -0.21413, 0, 0.6627451, 1, 1,
0.1584495, -0.6215216, 2.661723, 0, 0.6588235, 1, 1,
0.1610119, -1.579448, 5.084461, 0, 0.6509804, 1, 1,
0.1623777, 1.496309, 0.5329171, 0, 0.6470588, 1, 1,
0.1639654, 0.1903868, 1.713364, 0, 0.6392157, 1, 1,
0.1641422, -1.052365, 2.466485, 0, 0.6352941, 1, 1,
0.1664598, -0.9680495, 0.03318693, 0, 0.627451, 1, 1,
0.1678724, -0.7456253, 5.35703, 0, 0.6235294, 1, 1,
0.1679983, -0.7991694, 2.104499, 0, 0.6156863, 1, 1,
0.1710766, 0.1914878, 1.919186, 0, 0.6117647, 1, 1,
0.1772785, 1.408121, 1.212414, 0, 0.6039216, 1, 1,
0.1806699, -0.2553352, 1.370067, 0, 0.5960785, 1, 1,
0.1812864, 0.3434455, 1.042043, 0, 0.5921569, 1, 1,
0.1845363, -0.4404681, 1.546858, 0, 0.5843138, 1, 1,
0.1861599, -1.334511, 3.064951, 0, 0.5803922, 1, 1,
0.1862993, -0.7437742, 2.928053, 0, 0.572549, 1, 1,
0.1884389, -0.2435017, 2.549877, 0, 0.5686275, 1, 1,
0.189797, 0.08512451, 1.113747, 0, 0.5607843, 1, 1,
0.1915344, -0.6102377, 3.553545, 0, 0.5568628, 1, 1,
0.1919792, -0.3942766, 2.333635, 0, 0.5490196, 1, 1,
0.1920458, 1.933963, 1.021924, 0, 0.5450981, 1, 1,
0.1924831, 1.517757, 1.530945, 0, 0.5372549, 1, 1,
0.1959584, 1.316319, 1.515798, 0, 0.5333334, 1, 1,
0.1964685, -0.2247036, 0.7067275, 0, 0.5254902, 1, 1,
0.1967697, 0.8881136, -1.54237, 0, 0.5215687, 1, 1,
0.2019854, 1.068756, 0.573789, 0, 0.5137255, 1, 1,
0.2038359, 0.1477489, 0.712124, 0, 0.509804, 1, 1,
0.2045346, 0.07026129, 2.079437, 0, 0.5019608, 1, 1,
0.2045526, 0.4807699, -1.391325, 0, 0.4941176, 1, 1,
0.2084294, 1.558694, -1.426627, 0, 0.4901961, 1, 1,
0.2095069, -1.069848, 2.870259, 0, 0.4823529, 1, 1,
0.2121933, 0.518485, 1.53228, 0, 0.4784314, 1, 1,
0.2140152, 2.699603, -0.06936742, 0, 0.4705882, 1, 1,
0.2169416, -0.08509595, 1.48113, 0, 0.4666667, 1, 1,
0.217429, -0.4161642, 3.596981, 0, 0.4588235, 1, 1,
0.2175619, -0.1973078, 3.777999, 0, 0.454902, 1, 1,
0.2177386, 0.8796407, 0.3394383, 0, 0.4470588, 1, 1,
0.2230034, 0.8079845, -1.741964, 0, 0.4431373, 1, 1,
0.2243501, 0.5791699, 0.4830639, 0, 0.4352941, 1, 1,
0.2249725, -0.416348, 2.920421, 0, 0.4313726, 1, 1,
0.2292547, 0.8641655, 1.043264, 0, 0.4235294, 1, 1,
0.2321444, 0.06564347, -0.0667044, 0, 0.4196078, 1, 1,
0.2378791, -0.08506436, 1.67237, 0, 0.4117647, 1, 1,
0.2398981, -0.8721087, 2.808664, 0, 0.4078431, 1, 1,
0.2449164, -0.09841966, 2.82104, 0, 0.4, 1, 1,
0.2474475, 0.27681, -0.2914613, 0, 0.3921569, 1, 1,
0.2511834, 2.085413, -0.02661663, 0, 0.3882353, 1, 1,
0.2575879, 0.1482877, 1.352839, 0, 0.3803922, 1, 1,
0.2581117, -0.5759501, 2.422085, 0, 0.3764706, 1, 1,
0.2608345, 1.459106, -1.558864, 0, 0.3686275, 1, 1,
0.2623038, 0.3059947, 1.524519, 0, 0.3647059, 1, 1,
0.2629634, 0.5920048, -0.1535375, 0, 0.3568628, 1, 1,
0.2657968, -1.202232, 4.125956, 0, 0.3529412, 1, 1,
0.2664477, 0.08905037, 1.007909, 0, 0.345098, 1, 1,
0.2665724, -0.1546091, 2.95327, 0, 0.3411765, 1, 1,
0.2680537, -0.8717577, 3.776907, 0, 0.3333333, 1, 1,
0.2697518, 0.3687165, 2.645947, 0, 0.3294118, 1, 1,
0.2712629, -1.080811, 4.010329, 0, 0.3215686, 1, 1,
0.2718566, 0.7457035, -1.689324, 0, 0.3176471, 1, 1,
0.2744497, 1.38798, 0.4176969, 0, 0.3098039, 1, 1,
0.2760577, -0.7872996, 2.347189, 0, 0.3058824, 1, 1,
0.2775967, -0.8407601, 2.981317, 0, 0.2980392, 1, 1,
0.2837624, 1.021501, 0.642873, 0, 0.2901961, 1, 1,
0.284601, 0.5777678, -0.2811109, 0, 0.2862745, 1, 1,
0.2851806, 0.2545072, 0.2552286, 0, 0.2784314, 1, 1,
0.2857755, 0.1999298, 0.7717833, 0, 0.2745098, 1, 1,
0.2865948, 0.4347538, 1.436321, 0, 0.2666667, 1, 1,
0.2870894, -0.8375431, 3.061359, 0, 0.2627451, 1, 1,
0.292006, 0.5061282, -0.09117172, 0, 0.254902, 1, 1,
0.2920254, -1.711585, 1.945971, 0, 0.2509804, 1, 1,
0.2944425, -0.9027488, 2.187503, 0, 0.2431373, 1, 1,
0.2954377, 0.1487342, 1.405107, 0, 0.2392157, 1, 1,
0.2959841, 0.03899914, 1.907465, 0, 0.2313726, 1, 1,
0.2982153, -1.397059, 1.374049, 0, 0.227451, 1, 1,
0.3001452, 1.409991, -1.546092, 0, 0.2196078, 1, 1,
0.3012402, 1.174775, 0.7681052, 0, 0.2156863, 1, 1,
0.3040189, -0.3649129, 2.012854, 0, 0.2078431, 1, 1,
0.3052292, -0.5650322, 0.4355448, 0, 0.2039216, 1, 1,
0.3090304, -0.5223538, 3.239439, 0, 0.1960784, 1, 1,
0.3101917, 0.3522008, 0.3649125, 0, 0.1882353, 1, 1,
0.3112002, 1.534602, -0.6183851, 0, 0.1843137, 1, 1,
0.3277462, -0.191277, 3.343239, 0, 0.1764706, 1, 1,
0.3332305, -0.2405992, 1.778166, 0, 0.172549, 1, 1,
0.3334648, -1.450357, 3.417475, 0, 0.1647059, 1, 1,
0.3375388, -1.165471, 2.948915, 0, 0.1607843, 1, 1,
0.3414, -0.1055735, 1.205148, 0, 0.1529412, 1, 1,
0.3433959, 0.07056427, -0.8027986, 0, 0.1490196, 1, 1,
0.346316, 0.792785, -0.470266, 0, 0.1411765, 1, 1,
0.3467852, -0.9268818, 1.909572, 0, 0.1372549, 1, 1,
0.3611611, 0.2648915, 0.7589356, 0, 0.1294118, 1, 1,
0.362164, 0.02356923, 2.544428, 0, 0.1254902, 1, 1,
0.3636394, 0.5185927, -0.6504684, 0, 0.1176471, 1, 1,
0.3653993, -0.8356224, 2.361463, 0, 0.1137255, 1, 1,
0.365622, -1.523021, 4.133219, 0, 0.1058824, 1, 1,
0.3696361, 1.559637, -0.2969589, 0, 0.09803922, 1, 1,
0.3697073, 0.08385529, 2.343487, 0, 0.09411765, 1, 1,
0.3756366, -0.07859343, 1.480695, 0, 0.08627451, 1, 1,
0.376966, -0.7824631, 1.31298, 0, 0.08235294, 1, 1,
0.3776461, -0.644114, 1.956282, 0, 0.07450981, 1, 1,
0.3794304, 1.307178, -1.143084, 0, 0.07058824, 1, 1,
0.3818208, -1.72822, 5.146235, 0, 0.0627451, 1, 1,
0.3902698, -0.2895771, 2.079491, 0, 0.05882353, 1, 1,
0.3945013, 0.8384914, -0.3907057, 0, 0.05098039, 1, 1,
0.3965716, 0.8890924, -0.3386413, 0, 0.04705882, 1, 1,
0.4015788, 0.07213306, 0.9560058, 0, 0.03921569, 1, 1,
0.4033566, -0.7462749, 2.112237, 0, 0.03529412, 1, 1,
0.4046589, -0.8365479, 2.81178, 0, 0.02745098, 1, 1,
0.4048392, 0.5085075, 0.5041324, 0, 0.02352941, 1, 1,
0.4074406, 1.234846, -1.390676, 0, 0.01568628, 1, 1,
0.4100976, 1.83672, -0.1853118, 0, 0.01176471, 1, 1,
0.4162265, -0.6869045, 1.743116, 0, 0.003921569, 1, 1,
0.4262277, 0.5774706, 0.6903225, 0.003921569, 0, 1, 1,
0.4269673, -0.7448601, 2.271258, 0.007843138, 0, 1, 1,
0.4282924, -0.598847, 1.663181, 0.01568628, 0, 1, 1,
0.4309276, 0.4465935, -0.2773638, 0.01960784, 0, 1, 1,
0.4326855, 1.324515, 0.6375185, 0.02745098, 0, 1, 1,
0.4352586, -0.5657544, 1.343564, 0.03137255, 0, 1, 1,
0.4382248, 1.353888, 1.328564, 0.03921569, 0, 1, 1,
0.4390936, -0.6735753, 2.578175, 0.04313726, 0, 1, 1,
0.4428005, -1.278817, 1.843408, 0.05098039, 0, 1, 1,
0.4448815, -1.087969, 4.068541, 0.05490196, 0, 1, 1,
0.4464382, -0.008423798, 1.234188, 0.0627451, 0, 1, 1,
0.4545781, -1.545612, 1.508255, 0.06666667, 0, 1, 1,
0.4570025, 0.6024735, 0.8765067, 0.07450981, 0, 1, 1,
0.4584897, 0.4896778, 0.218129, 0.07843138, 0, 1, 1,
0.4596889, -0.2270001, 1.863009, 0.08627451, 0, 1, 1,
0.461273, -0.8536205, 2.898512, 0.09019608, 0, 1, 1,
0.4651737, 1.723151, 0.9224914, 0.09803922, 0, 1, 1,
0.468938, 0.3790915, 2.059797, 0.1058824, 0, 1, 1,
0.4750523, -1.526138, 2.347587, 0.1098039, 0, 1, 1,
0.4754929, -0.1331886, 4.400003, 0.1176471, 0, 1, 1,
0.4780915, 1.182434, 1.077965, 0.1215686, 0, 1, 1,
0.4805053, 0.7225645, 1.532994, 0.1294118, 0, 1, 1,
0.4819051, -0.3828322, 2.956483, 0.1333333, 0, 1, 1,
0.4832748, -0.0844349, 2.839701, 0.1411765, 0, 1, 1,
0.4839197, -1.051892, 1.308219, 0.145098, 0, 1, 1,
0.4931179, 0.9880347, 0.8796358, 0.1529412, 0, 1, 1,
0.4947911, 0.4627831, 1.950235, 0.1568628, 0, 1, 1,
0.5000889, 2.193827, -0.2336478, 0.1647059, 0, 1, 1,
0.5013183, 0.3857246, 2.171053, 0.1686275, 0, 1, 1,
0.5030314, -0.6187295, 3.398602, 0.1764706, 0, 1, 1,
0.5039381, 0.5370747, 2.063575, 0.1803922, 0, 1, 1,
0.5099978, 0.1085777, 0.06558163, 0.1882353, 0, 1, 1,
0.5168493, 0.5979844, 2.808575, 0.1921569, 0, 1, 1,
0.5203139, -1.607856, 2.149977, 0.2, 0, 1, 1,
0.5211691, -0.8117869, 2.842985, 0.2078431, 0, 1, 1,
0.5231125, -1.051263, 3.282054, 0.2117647, 0, 1, 1,
0.524442, 0.4464173, 1.808849, 0.2196078, 0, 1, 1,
0.5252264, 0.7450452, 1.337614, 0.2235294, 0, 1, 1,
0.5271543, -1.359563, 2.115669, 0.2313726, 0, 1, 1,
0.5293262, -0.02647889, 1.519486, 0.2352941, 0, 1, 1,
0.5310512, -0.104276, 1.68729, 0.2431373, 0, 1, 1,
0.5413674, 0.5830666, 1.833325, 0.2470588, 0, 1, 1,
0.5418993, -0.1813616, 2.568773, 0.254902, 0, 1, 1,
0.5440735, -0.2355895, 0.8896825, 0.2588235, 0, 1, 1,
0.544991, -0.6126546, 4.708788, 0.2666667, 0, 1, 1,
0.545875, -0.03821632, 2.677118, 0.2705882, 0, 1, 1,
0.5472304, -0.01398433, 0.1960239, 0.2784314, 0, 1, 1,
0.5513149, -0.4726392, 2.235785, 0.282353, 0, 1, 1,
0.5513719, -0.287, 3.091637, 0.2901961, 0, 1, 1,
0.5541845, 0.6120425, -0.3811911, 0.2941177, 0, 1, 1,
0.5574746, -1.630234, 1.977992, 0.3019608, 0, 1, 1,
0.5579047, -0.4585928, 2.390328, 0.3098039, 0, 1, 1,
0.5585049, 0.6105137, 2.100486, 0.3137255, 0, 1, 1,
0.5624358, 0.4628854, 1.520388, 0.3215686, 0, 1, 1,
0.5642977, -0.07150801, 1.990307, 0.3254902, 0, 1, 1,
0.5689201, 1.925526, 0.9350146, 0.3333333, 0, 1, 1,
0.5699802, 0.899009, 1.548104, 0.3372549, 0, 1, 1,
0.5756527, -1.099112, 2.528946, 0.345098, 0, 1, 1,
0.5805697, -0.5201589, 2.536165, 0.3490196, 0, 1, 1,
0.5828295, -0.43751, 2.176525, 0.3568628, 0, 1, 1,
0.5842421, -0.5274366, 1.166827, 0.3607843, 0, 1, 1,
0.5849761, 1.801387, -0.0239289, 0.3686275, 0, 1, 1,
0.5879903, -1.48342, 1.545647, 0.372549, 0, 1, 1,
0.5954513, 0.06773281, 1.428924, 0.3803922, 0, 1, 1,
0.6001976, 0.21205, 1.262256, 0.3843137, 0, 1, 1,
0.6035839, 0.07295988, 2.077121, 0.3921569, 0, 1, 1,
0.6039386, 1.52471, 0.1915231, 0.3960784, 0, 1, 1,
0.6065528, -0.4258295, 3.183534, 0.4039216, 0, 1, 1,
0.6068119, 1.849987, 0.2923259, 0.4117647, 0, 1, 1,
0.6114692, 2.422943, -0.3601945, 0.4156863, 0, 1, 1,
0.6123341, 1.708017, 0.09750387, 0.4235294, 0, 1, 1,
0.6125661, 0.2092305, -1.033325, 0.427451, 0, 1, 1,
0.6176937, 1.262076, 0.4768105, 0.4352941, 0, 1, 1,
0.6251431, 0.8306708, 0.6439556, 0.4392157, 0, 1, 1,
0.6292367, 0.2185981, 1.644726, 0.4470588, 0, 1, 1,
0.6292705, -0.6297469, 3.392419, 0.4509804, 0, 1, 1,
0.6316032, 1.6154, 1.40802, 0.4588235, 0, 1, 1,
0.6319224, -0.4072014, 3.156907, 0.4627451, 0, 1, 1,
0.6321813, 0.9664147, 1.563398, 0.4705882, 0, 1, 1,
0.6396949, 0.3274218, 2.812801, 0.4745098, 0, 1, 1,
0.6484814, 1.434589, 2.186727, 0.4823529, 0, 1, 1,
0.6493989, -0.3473044, 1.887272, 0.4862745, 0, 1, 1,
0.65711, 0.6485341, -0.9006014, 0.4941176, 0, 1, 1,
0.6637232, 0.6342534, 0.2343198, 0.5019608, 0, 1, 1,
0.6641544, -1.471136, 2.149246, 0.5058824, 0, 1, 1,
0.6687056, -0.616991, 0.5721329, 0.5137255, 0, 1, 1,
0.6711968, -1.157321, 2.887732, 0.5176471, 0, 1, 1,
0.6816246, 2.634243, -1.614421, 0.5254902, 0, 1, 1,
0.68645, 0.04890382, 2.589988, 0.5294118, 0, 1, 1,
0.6872755, 0.6930825, -0.02148313, 0.5372549, 0, 1, 1,
0.6920939, 0.494218, 2.178488, 0.5411765, 0, 1, 1,
0.693717, 2.736545, -0.4045581, 0.5490196, 0, 1, 1,
0.7022012, -0.2269928, 1.555512, 0.5529412, 0, 1, 1,
0.7050772, 0.8591897, -0.6699095, 0.5607843, 0, 1, 1,
0.7169703, -0.080153, 1.063069, 0.5647059, 0, 1, 1,
0.7185892, 0.8737847, 2.459532, 0.572549, 0, 1, 1,
0.7212223, 1.292692, 1.990577, 0.5764706, 0, 1, 1,
0.7223714, -0.4007114, 0.05795987, 0.5843138, 0, 1, 1,
0.7279918, -0.7488853, 3.353196, 0.5882353, 0, 1, 1,
0.7301765, -1.68941, 3.927338, 0.5960785, 0, 1, 1,
0.7317363, 0.9036406, 0.1427316, 0.6039216, 0, 1, 1,
0.7341329, 0.5180525, -0.1433298, 0.6078432, 0, 1, 1,
0.7431, 0.09948427, 1.192937, 0.6156863, 0, 1, 1,
0.7445387, 1.665715, -0.9457278, 0.6196079, 0, 1, 1,
0.7472365, 1.311625, 0.1572902, 0.627451, 0, 1, 1,
0.7477587, 0.9124798, 0.5054665, 0.6313726, 0, 1, 1,
0.7489957, -0.316927, 2.762697, 0.6392157, 0, 1, 1,
0.750598, -1.509763, 2.076369, 0.6431373, 0, 1, 1,
0.7516217, 1.571009, 0.4183804, 0.6509804, 0, 1, 1,
0.7561417, -0.6489665, 2.395677, 0.654902, 0, 1, 1,
0.7569215, -1.123694, 2.941051, 0.6627451, 0, 1, 1,
0.7585674, 2.454855, 0.2179267, 0.6666667, 0, 1, 1,
0.7598804, -0.8806696, 1.961195, 0.6745098, 0, 1, 1,
0.7603584, -0.2680118, 2.358524, 0.6784314, 0, 1, 1,
0.7620445, 0.2280626, 2.979876, 0.6862745, 0, 1, 1,
0.7629025, 0.1137981, -0.1869723, 0.6901961, 0, 1, 1,
0.7645712, 1.30868, 0.9013453, 0.6980392, 0, 1, 1,
0.7653171, -1.45771, 1.649259, 0.7058824, 0, 1, 1,
0.7753825, -0.07198471, 1.376481, 0.7098039, 0, 1, 1,
0.7813534, 0.1243611, 0.7308096, 0.7176471, 0, 1, 1,
0.7861106, 0.2236122, 2.233254, 0.7215686, 0, 1, 1,
0.7884684, 1.2073, -1.778719, 0.7294118, 0, 1, 1,
0.7930683, 0.494092, 0.2453922, 0.7333333, 0, 1, 1,
0.7945142, 1.175908, 1.146819, 0.7411765, 0, 1, 1,
0.7963941, -0.9644001, 1.449109, 0.7450981, 0, 1, 1,
0.8000765, 0.6205872, 1.489346, 0.7529412, 0, 1, 1,
0.8012726, 0.390172, 0.2479292, 0.7568628, 0, 1, 1,
0.8052875, -0.05672495, 2.019422, 0.7647059, 0, 1, 1,
0.8067927, 0.63034, 0.1896286, 0.7686275, 0, 1, 1,
0.8089606, -0.5072908, 1.856251, 0.7764706, 0, 1, 1,
0.8115419, 0.6946549, 1.737065, 0.7803922, 0, 1, 1,
0.8122481, -0.7121109, 1.77161, 0.7882353, 0, 1, 1,
0.814276, -0.03223157, 0.7941056, 0.7921569, 0, 1, 1,
0.8149943, 0.1062998, 1.88969, 0.8, 0, 1, 1,
0.8160067, 1.301509, 0.2427845, 0.8078431, 0, 1, 1,
0.8222831, -1.450826, 3.009269, 0.8117647, 0, 1, 1,
0.8224589, 1.25644, 1.410761, 0.8196079, 0, 1, 1,
0.8239182, 0.3217146, 1.196033, 0.8235294, 0, 1, 1,
0.8290263, 0.1028824, 0.6398129, 0.8313726, 0, 1, 1,
0.8373512, 0.01931301, 2.329978, 0.8352941, 0, 1, 1,
0.8395519, -0.07841599, 1.943905, 0.8431373, 0, 1, 1,
0.8400785, -1.092944, 2.901035, 0.8470588, 0, 1, 1,
0.8442161, 1.620159, -1.541887, 0.854902, 0, 1, 1,
0.845611, 1.008971, 0.4439854, 0.8588235, 0, 1, 1,
0.8472652, -2.22532, 3.094705, 0.8666667, 0, 1, 1,
0.8512863, 1.549707, 0.5492243, 0.8705882, 0, 1, 1,
0.8527755, 1.290515, 0.5462337, 0.8784314, 0, 1, 1,
0.8638771, -0.06590088, 0.4867696, 0.8823529, 0, 1, 1,
0.8712785, 0.5853121, 0.5910128, 0.8901961, 0, 1, 1,
0.8881284, -1.012161, 2.742011, 0.8941177, 0, 1, 1,
0.8903903, 0.3060876, 0.7558227, 0.9019608, 0, 1, 1,
0.8949382, -0.9798636, 2.98612, 0.9098039, 0, 1, 1,
0.8982222, 0.1569867, 2.083854, 0.9137255, 0, 1, 1,
0.9010958, -2.663978, 2.421819, 0.9215686, 0, 1, 1,
0.902907, -0.8963957, 1.277057, 0.9254902, 0, 1, 1,
0.9038734, -0.7166795, 3.443211, 0.9333333, 0, 1, 1,
0.9047585, -0.3890056, 1.890821, 0.9372549, 0, 1, 1,
0.9107378, -1.485316, 1.606389, 0.945098, 0, 1, 1,
0.9120201, 0.4351602, -0.5403697, 0.9490196, 0, 1, 1,
0.9131866, -1.242222, 3.84868, 0.9568627, 0, 1, 1,
0.9170017, 0.1327539, 0.9065726, 0.9607843, 0, 1, 1,
0.9209277, 1.293475, 1.140357, 0.9686275, 0, 1, 1,
0.92508, -0.8615664, 3.363151, 0.972549, 0, 1, 1,
0.92948, -2.300009, 2.56099, 0.9803922, 0, 1, 1,
0.9362968, 1.11351, -0.08686627, 0.9843137, 0, 1, 1,
0.939334, 0.1474956, 1.899573, 0.9921569, 0, 1, 1,
0.9484331, 0.9994669, 0.9045169, 0.9960784, 0, 1, 1,
0.9629802, -1.160061, 2.485394, 1, 0, 0.9960784, 1,
0.9630126, -0.4779465, 2.877104, 1, 0, 0.9882353, 1,
0.9636907, 0.3372891, 1.207572, 1, 0, 0.9843137, 1,
0.9682598, -1.848199, 2.31986, 1, 0, 0.9764706, 1,
0.9758421, 1.570836, 1.396343, 1, 0, 0.972549, 1,
0.97982, -0.02231515, 1.86075, 1, 0, 0.9647059, 1,
0.9801649, 0.37764, 1.176581, 1, 0, 0.9607843, 1,
0.9837022, -1.324125, 1.234544, 1, 0, 0.9529412, 1,
0.9913046, 0.4939769, -0.1463366, 1, 0, 0.9490196, 1,
0.9953148, -0.5674174, 2.268486, 1, 0, 0.9411765, 1,
0.997519, -0.6465484, 2.664536, 1, 0, 0.9372549, 1,
0.9975386, -0.3450294, 2.427178, 1, 0, 0.9294118, 1,
0.9981126, 1.043406, 0.4973474, 1, 0, 0.9254902, 1,
0.9995289, 1.198929, 0.2531599, 1, 0, 0.9176471, 1,
1.00002, -0.1393323, 1.657844, 1, 0, 0.9137255, 1,
1.003491, 0.5096051, 1.181333, 1, 0, 0.9058824, 1,
1.004155, 0.7778564, 0.7536895, 1, 0, 0.9019608, 1,
1.012944, 0.8899062, -0.2588508, 1, 0, 0.8941177, 1,
1.014889, 2.213823, 1.029144, 1, 0, 0.8862745, 1,
1.023879, 0.08967941, 0.5359498, 1, 0, 0.8823529, 1,
1.026868, 0.3815744, 1.835463, 1, 0, 0.8745098, 1,
1.046567, 0.352816, 1.735504, 1, 0, 0.8705882, 1,
1.049335, 1.57343, -0.233327, 1, 0, 0.8627451, 1,
1.052028, 0.01998962, 0.5603835, 1, 0, 0.8588235, 1,
1.053426, -1.24936, 0.7304819, 1, 0, 0.8509804, 1,
1.053816, 0.3408823, 0.6711367, 1, 0, 0.8470588, 1,
1.055735, -0.9422269, 2.10182, 1, 0, 0.8392157, 1,
1.056393, 0.4085703, 1.257036, 1, 0, 0.8352941, 1,
1.057656, 0.118247, 2.455595, 1, 0, 0.827451, 1,
1.071255, -1.38121, 2.560685, 1, 0, 0.8235294, 1,
1.075672, 0.2114699, 3.169204, 1, 0, 0.8156863, 1,
1.075769, 1.280501, 0.08839849, 1, 0, 0.8117647, 1,
1.086085, -0.226447, 3.25065, 1, 0, 0.8039216, 1,
1.087395, 0.1472399, 1.553005, 1, 0, 0.7960784, 1,
1.089232, -2.122283, 3.157804, 1, 0, 0.7921569, 1,
1.089283, -0.400835, 2.087655, 1, 0, 0.7843137, 1,
1.092132, -1.54814, 2.420186, 1, 0, 0.7803922, 1,
1.092981, -0.3081499, 0.4900287, 1, 0, 0.772549, 1,
1.105354, 1.903918, 1.21575, 1, 0, 0.7686275, 1,
1.109088, 0.9607028, 0.317398, 1, 0, 0.7607843, 1,
1.111554, 1.32503, -0.7459694, 1, 0, 0.7568628, 1,
1.128431, 0.05618454, 1.167326, 1, 0, 0.7490196, 1,
1.131097, 0.8827171, 0.2025621, 1, 0, 0.7450981, 1,
1.140873, 0.5403755, 0.6706797, 1, 0, 0.7372549, 1,
1.145829, -2.095364, 3.750948, 1, 0, 0.7333333, 1,
1.152876, 0.01986383, 1.182353, 1, 0, 0.7254902, 1,
1.165765, 0.1825273, 2.293467, 1, 0, 0.7215686, 1,
1.16769, 0.2601808, 0.9317337, 1, 0, 0.7137255, 1,
1.168499, 0.8064955, 0.3681642, 1, 0, 0.7098039, 1,
1.173678, -0.7271177, 2.534265, 1, 0, 0.7019608, 1,
1.178285, 0.3135305, 0.573428, 1, 0, 0.6941177, 1,
1.178913, 1.188374, 0.8399204, 1, 0, 0.6901961, 1,
1.201307, -0.595053, 1.61009, 1, 0, 0.682353, 1,
1.202709, 0.4485851, 1.409023, 1, 0, 0.6784314, 1,
1.21716, -0.06817944, 1.990663, 1, 0, 0.6705883, 1,
1.221535, 1.124678, 2.055134, 1, 0, 0.6666667, 1,
1.224122, -0.5729994, 0.3694943, 1, 0, 0.6588235, 1,
1.233037, 0.9246897, 1.302929, 1, 0, 0.654902, 1,
1.240654, 0.177736, 1.527179, 1, 0, 0.6470588, 1,
1.255354, -0.6649549, -0.08865763, 1, 0, 0.6431373, 1,
1.259467, 0.9066606, 2.439482, 1, 0, 0.6352941, 1,
1.266587, 0.2546669, 1.740442, 1, 0, 0.6313726, 1,
1.269164, -0.756032, 1.004027, 1, 0, 0.6235294, 1,
1.270419, -0.9478605, 0.4694593, 1, 0, 0.6196079, 1,
1.270581, 0.08195136, -0.1247998, 1, 0, 0.6117647, 1,
1.279971, 0.8573775, 0.7199498, 1, 0, 0.6078432, 1,
1.282433, -1.333995, 1.865092, 1, 0, 0.6, 1,
1.299308, 0.3279506, 1.38675, 1, 0, 0.5921569, 1,
1.301589, 0.8882955, 0.4012565, 1, 0, 0.5882353, 1,
1.303169, -1.647602, 1.529013, 1, 0, 0.5803922, 1,
1.305292, -1.599185, 1.491366, 1, 0, 0.5764706, 1,
1.306394, -1.546549, 2.293985, 1, 0, 0.5686275, 1,
1.311333, -0.1777931, 3.604702, 1, 0, 0.5647059, 1,
1.313301, -1.068525, 1.999864, 1, 0, 0.5568628, 1,
1.317908, 0.3056632, 2.209617, 1, 0, 0.5529412, 1,
1.318059, -0.3123609, -0.3576827, 1, 0, 0.5450981, 1,
1.32356, 0.4349547, 1.421081, 1, 0, 0.5411765, 1,
1.324909, 0.8383737, 1.838667, 1, 0, 0.5333334, 1,
1.324933, -0.2044683, 0.334235, 1, 0, 0.5294118, 1,
1.32873, -1.081791, 3.44412, 1, 0, 0.5215687, 1,
1.331768, -0.1640714, 2.422077, 1, 0, 0.5176471, 1,
1.333984, -1.06319, 1.909526, 1, 0, 0.509804, 1,
1.335422, 1.16504, 1.816701, 1, 0, 0.5058824, 1,
1.339637, -0.3192542, 2.473557, 1, 0, 0.4980392, 1,
1.353294, -0.9127825, 0.8750823, 1, 0, 0.4901961, 1,
1.354061, -1.190099, 3.075098, 1, 0, 0.4862745, 1,
1.365506, -0.9245378, 2.814314, 1, 0, 0.4784314, 1,
1.365554, 0.364969, 1.942636, 1, 0, 0.4745098, 1,
1.37677, -0.8424255, 1.576716, 1, 0, 0.4666667, 1,
1.380205, -1.038717, 1.806759, 1, 0, 0.4627451, 1,
1.397723, 0.07214846, 0.6699637, 1, 0, 0.454902, 1,
1.399949, -1.492814, 2.530612, 1, 0, 0.4509804, 1,
1.424016, -0.915697, 2.138286, 1, 0, 0.4431373, 1,
1.427358, -0.6899049, 1.869396, 1, 0, 0.4392157, 1,
1.428412, -0.8394163, 2.40201, 1, 0, 0.4313726, 1,
1.433163, 1.083987, 0.8729855, 1, 0, 0.427451, 1,
1.440299, -0.05501624, 0.5843319, 1, 0, 0.4196078, 1,
1.447024, 1.424713, 0.7762844, 1, 0, 0.4156863, 1,
1.449183, 0.765202, 1.299422, 1, 0, 0.4078431, 1,
1.464435, -0.3352724, 1.960707, 1, 0, 0.4039216, 1,
1.48102, -1.807216, 4.041482, 1, 0, 0.3960784, 1,
1.500438, -0.1509536, 2.489558, 1, 0, 0.3882353, 1,
1.502619, 0.09806009, 1.518673, 1, 0, 0.3843137, 1,
1.509209, -1.346546, 2.115261, 1, 0, 0.3764706, 1,
1.509622, -0.5525849, 0.7184309, 1, 0, 0.372549, 1,
1.522512, 0.9799914, 2.098575, 1, 0, 0.3647059, 1,
1.533288, 0.8071938, 1.914496, 1, 0, 0.3607843, 1,
1.543023, 0.43915, 0.1318117, 1, 0, 0.3529412, 1,
1.54311, -1.057466, 2.06708, 1, 0, 0.3490196, 1,
1.546704, 0.9592953, 1.81883, 1, 0, 0.3411765, 1,
1.549017, -1.000711, 2.34005, 1, 0, 0.3372549, 1,
1.565487, 1.961355, 1.49283, 1, 0, 0.3294118, 1,
1.585917, -0.2925265, 0.9503455, 1, 0, 0.3254902, 1,
1.607016, 1.52728, 0.7137312, 1, 0, 0.3176471, 1,
1.611187, 1.532132, -0.1249591, 1, 0, 0.3137255, 1,
1.623835, 1.729746, 1.394909, 1, 0, 0.3058824, 1,
1.628138, 0.8282985, 1.850752, 1, 0, 0.2980392, 1,
1.628878, 1.794694, 2.46399, 1, 0, 0.2941177, 1,
1.62945, 0.1045278, 1.586951, 1, 0, 0.2862745, 1,
1.637599, -0.2794476, 1.676908, 1, 0, 0.282353, 1,
1.642669, 1.346484, -0.07560106, 1, 0, 0.2745098, 1,
1.643821, -0.07757206, 2.532668, 1, 0, 0.2705882, 1,
1.648099, 1.36579, -1.65028, 1, 0, 0.2627451, 1,
1.648275, -0.5666364, 2.616514, 1, 0, 0.2588235, 1,
1.664986, -0.7980786, 1.568497, 1, 0, 0.2509804, 1,
1.683173, -0.7016059, 3.12995, 1, 0, 0.2470588, 1,
1.683733, -1.670674, 2.226276, 1, 0, 0.2392157, 1,
1.684662, 0.3136313, 1.245136, 1, 0, 0.2352941, 1,
1.690528, -1.377133, 1.382788, 1, 0, 0.227451, 1,
1.698503, 0.2840685, 1.380312, 1, 0, 0.2235294, 1,
1.70822, -0.3416229, 1.040814, 1, 0, 0.2156863, 1,
1.72126, -1.995937, 1.901045, 1, 0, 0.2117647, 1,
1.75471, 0.533245, 1.484415, 1, 0, 0.2039216, 1,
1.756091, -0.7130236, 2.570147, 1, 0, 0.1960784, 1,
1.760111, 0.123495, 1.11605, 1, 0, 0.1921569, 1,
1.778071, 0.2196735, 2.966752, 1, 0, 0.1843137, 1,
1.779333, -0.3434224, 2.165549, 1, 0, 0.1803922, 1,
1.81185, 0.4376569, 2.512854, 1, 0, 0.172549, 1,
1.812061, 0.1118841, 0.3879078, 1, 0, 0.1686275, 1,
1.832866, 0.03199622, 0.6910941, 1, 0, 0.1607843, 1,
1.83478, -0.07258647, 1.142994, 1, 0, 0.1568628, 1,
1.843922, 0.3272359, 1.459793, 1, 0, 0.1490196, 1,
1.866841, -0.1002266, 2.260834, 1, 0, 0.145098, 1,
1.868191, 1.9951, 0.7438868, 1, 0, 0.1372549, 1,
1.903169, -1.161459, 1.951938, 1, 0, 0.1333333, 1,
1.930441, 0.4326137, 1.860884, 1, 0, 0.1254902, 1,
1.981825, -1.822193, 1.657331, 1, 0, 0.1215686, 1,
2.024655, 0.3299613, 1.91005, 1, 0, 0.1137255, 1,
2.051149, 1.107568, 0.8007058, 1, 0, 0.1098039, 1,
2.096324, -0.8779027, -0.8851377, 1, 0, 0.1019608, 1,
2.104109, 1.279815, 0.9386916, 1, 0, 0.09411765, 1,
2.122372, -0.09397636, 0.8006826, 1, 0, 0.09019608, 1,
2.123393, 0.5814061, 3.522469, 1, 0, 0.08235294, 1,
2.162971, -1.501007, 2.565363, 1, 0, 0.07843138, 1,
2.165923, 0.7656612, 1.429969, 1, 0, 0.07058824, 1,
2.243166, 0.4107614, 1.910394, 1, 0, 0.06666667, 1,
2.311571, -1.471133, 1.302839, 1, 0, 0.05882353, 1,
2.316571, -0.5628543, 1.017271, 1, 0, 0.05490196, 1,
2.348352, 0.7089393, 1.448158, 1, 0, 0.04705882, 1,
2.383888, 1.11702, 2.187446, 1, 0, 0.04313726, 1,
2.406671, -1.048952, 2.386573, 1, 0, 0.03529412, 1,
2.488217, 1.475607, 1.886738, 1, 0, 0.03137255, 1,
2.580172, 0.1037835, 2.000083, 1, 0, 0.02352941, 1,
2.793685, 1.203511, 0.5115713, 1, 0, 0.01960784, 1,
2.912508, 0.890734, 2.325761, 1, 0, 0.01176471, 1,
3.653293, 1.810203, -0.2532629, 1, 0, 0.007843138, 1
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
0.1138489, -4.054338, -6.724419, 0, -0.5, 0.5, 0.5,
0.1138489, -4.054338, -6.724419, 1, -0.5, 0.5, 0.5,
0.1138489, -4.054338, -6.724419, 1, 1.5, 0.5, 0.5,
0.1138489, -4.054338, -6.724419, 0, 1.5, 0.5, 0.5
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
-4.625467, -0.1519673, -6.724419, 0, -0.5, 0.5, 0.5,
-4.625467, -0.1519673, -6.724419, 1, -0.5, 0.5, 0.5,
-4.625467, -0.1519673, -6.724419, 1, 1.5, 0.5, 0.5,
-4.625467, -0.1519673, -6.724419, 0, 1.5, 0.5, 0.5
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
-4.625467, -4.054338, 0.1918106, 0, -0.5, 0.5, 0.5,
-4.625467, -4.054338, 0.1918106, 1, -0.5, 0.5, 0.5,
-4.625467, -4.054338, 0.1918106, 1, 1.5, 0.5, 0.5,
-4.625467, -4.054338, 0.1918106, 0, 1.5, 0.5, 0.5
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
-2, -3.153791, -5.128366,
2, -3.153791, -5.128366,
-2, -3.153791, -5.128366,
-2, -3.303882, -5.394374,
0, -3.153791, -5.128366,
0, -3.303882, -5.394374,
2, -3.153791, -5.128366,
2, -3.303882, -5.394374
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
-2, -3.604065, -5.926392, 0, -0.5, 0.5, 0.5,
-2, -3.604065, -5.926392, 1, -0.5, 0.5, 0.5,
-2, -3.604065, -5.926392, 1, 1.5, 0.5, 0.5,
-2, -3.604065, -5.926392, 0, 1.5, 0.5, 0.5,
0, -3.604065, -5.926392, 0, -0.5, 0.5, 0.5,
0, -3.604065, -5.926392, 1, -0.5, 0.5, 0.5,
0, -3.604065, -5.926392, 1, 1.5, 0.5, 0.5,
0, -3.604065, -5.926392, 0, 1.5, 0.5, 0.5,
2, -3.604065, -5.926392, 0, -0.5, 0.5, 0.5,
2, -3.604065, -5.926392, 1, -0.5, 0.5, 0.5,
2, -3.604065, -5.926392, 1, 1.5, 0.5, 0.5,
2, -3.604065, -5.926392, 0, 1.5, 0.5, 0.5
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
-3.531779, -3, -5.128366,
-3.531779, 2, -5.128366,
-3.531779, -3, -5.128366,
-3.71406, -3, -5.394374,
-3.531779, -2, -5.128366,
-3.71406, -2, -5.394374,
-3.531779, -1, -5.128366,
-3.71406, -1, -5.394374,
-3.531779, 0, -5.128366,
-3.71406, 0, -5.394374,
-3.531779, 1, -5.128366,
-3.71406, 1, -5.394374,
-3.531779, 2, -5.128366,
-3.71406, 2, -5.394374
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
-4.078623, -3, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, -3, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, -3, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, -3, -5.926392, 0, 1.5, 0.5, 0.5,
-4.078623, -2, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, -2, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, -2, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, -2, -5.926392, 0, 1.5, 0.5, 0.5,
-4.078623, -1, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, -1, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, -1, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, -1, -5.926392, 0, 1.5, 0.5, 0.5,
-4.078623, 0, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, 0, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, 0, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, 0, -5.926392, 0, 1.5, 0.5, 0.5,
-4.078623, 1, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, 1, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, 1, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, 1, -5.926392, 0, 1.5, 0.5, 0.5,
-4.078623, 2, -5.926392, 0, -0.5, 0.5, 0.5,
-4.078623, 2, -5.926392, 1, -0.5, 0.5, 0.5,
-4.078623, 2, -5.926392, 1, 1.5, 0.5, 0.5,
-4.078623, 2, -5.926392, 0, 1.5, 0.5, 0.5
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
-3.531779, -3.153791, -4,
-3.531779, -3.153791, 4,
-3.531779, -3.153791, -4,
-3.71406, -3.303882, -4,
-3.531779, -3.153791, -2,
-3.71406, -3.303882, -2,
-3.531779, -3.153791, 0,
-3.71406, -3.303882, 0,
-3.531779, -3.153791, 2,
-3.71406, -3.303882, 2,
-3.531779, -3.153791, 4,
-3.71406, -3.303882, 4
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
-4.078623, -3.604065, -4, 0, -0.5, 0.5, 0.5,
-4.078623, -3.604065, -4, 1, -0.5, 0.5, 0.5,
-4.078623, -3.604065, -4, 1, 1.5, 0.5, 0.5,
-4.078623, -3.604065, -4, 0, 1.5, 0.5, 0.5,
-4.078623, -3.604065, -2, 0, -0.5, 0.5, 0.5,
-4.078623, -3.604065, -2, 1, -0.5, 0.5, 0.5,
-4.078623, -3.604065, -2, 1, 1.5, 0.5, 0.5,
-4.078623, -3.604065, -2, 0, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 0, 0, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 0, 1, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 0, 1, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 0, 0, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 2, 0, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 2, 1, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 2, 1, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 2, 0, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 4, 0, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 4, 1, -0.5, 0.5, 0.5,
-4.078623, -3.604065, 4, 1, 1.5, 0.5, 0.5,
-4.078623, -3.604065, 4, 0, 1.5, 0.5, 0.5
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
-3.531779, -3.153791, -5.128366,
-3.531779, 2.849856, -5.128366,
-3.531779, -3.153791, 5.511987,
-3.531779, 2.849856, 5.511987,
-3.531779, -3.153791, -5.128366,
-3.531779, -3.153791, 5.511987,
-3.531779, 2.849856, -5.128366,
-3.531779, 2.849856, 5.511987,
-3.531779, -3.153791, -5.128366,
3.759476, -3.153791, -5.128366,
-3.531779, -3.153791, 5.511987,
3.759476, -3.153791, 5.511987,
-3.531779, 2.849856, -5.128366,
3.759476, 2.849856, -5.128366,
-3.531779, 2.849856, 5.511987,
3.759476, 2.849856, 5.511987,
3.759476, -3.153791, -5.128366,
3.759476, 2.849856, -5.128366,
3.759476, -3.153791, 5.511987,
3.759476, 2.849856, 5.511987,
3.759476, -3.153791, -5.128366,
3.759476, -3.153791, 5.511987,
3.759476, 2.849856, -5.128366,
3.759476, 2.849856, 5.511987
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
var radius = 7.597237;
var distance = 33.80097;
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
mvMatrix.translate( -0.1138489, 0.1519673, -0.1918106 );
mvMatrix.scale( 1.126594, 1.368215, 0.7719934 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80097);
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
S-bioallethrin<-read.table("S-bioallethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-bioallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-bioallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-bioallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.425595, -0.7470348, -0.7526248, 0, 0, 1, 1, 1,
-3.166536, -0.08175466, -1.258527, 1, 0, 0, 1, 1,
-3.147704, -0.08217298, -2.362031, 1, 0, 0, 1, 1,
-2.883832, -0.0673208, -3.690669, 1, 0, 0, 1, 1,
-2.725672, -2.008751, -3.27214, 1, 0, 0, 1, 1,
-2.658899, 0.9350914, -2.139406, 1, 0, 0, 1, 1,
-2.639323, 1.836107, -1.033533, 0, 0, 0, 1, 1,
-2.612361, 1.103783, -1.896505, 0, 0, 0, 1, 1,
-2.573107, -0.618289, 1.314629, 0, 0, 0, 1, 1,
-2.538944, -0.3200525, -1.451294, 0, 0, 0, 1, 1,
-2.536908, -1.286814, -4.060838, 0, 0, 0, 1, 1,
-2.491114, -1.615106, -3.705539, 0, 0, 0, 1, 1,
-2.478102, -0.4649617, -1.517892, 0, 0, 0, 1, 1,
-2.437775, 0.6789942, -0.755632, 1, 1, 1, 1, 1,
-2.367235, -0.3059991, -1.470784, 1, 1, 1, 1, 1,
-2.284335, 0.08886644, -0.7460631, 1, 1, 1, 1, 1,
-2.23727, 0.8543981, -0.3720936, 1, 1, 1, 1, 1,
-2.207611, -0.4171504, -2.929604, 1, 1, 1, 1, 1,
-2.15244, 0.2850156, -0.3649743, 1, 1, 1, 1, 1,
-2.150234, -0.3792028, -1.774137, 1, 1, 1, 1, 1,
-2.127351, -0.03608662, -2.191044, 1, 1, 1, 1, 1,
-2.090922, 0.1595794, -1.019596, 1, 1, 1, 1, 1,
-2.069162, -1.060223, -3.662507, 1, 1, 1, 1, 1,
-2.050149, 0.09491669, -0.5252365, 1, 1, 1, 1, 1,
-2.049792, -1.0813, -1.518383, 1, 1, 1, 1, 1,
-2.049704, 0.1781299, -0.437571, 1, 1, 1, 1, 1,
-2.039957, 0.1734954, -2.399124, 1, 1, 1, 1, 1,
-2.034453, -2.123643, -4.82009, 1, 1, 1, 1, 1,
-2.019034, -1.535014, -2.190447, 0, 0, 1, 1, 1,
-1.993046, 0.5176522, 0.9691693, 1, 0, 0, 1, 1,
-1.991336, 0.731083, -1.646942, 1, 0, 0, 1, 1,
-1.966424, -0.5067797, -1.941904, 1, 0, 0, 1, 1,
-1.958758, 0.4494061, -0.5929356, 1, 0, 0, 1, 1,
-1.957548, -0.4622297, 0.619225, 1, 0, 0, 1, 1,
-1.92586, -0.1082045, -1.681925, 0, 0, 0, 1, 1,
-1.924529, 1.698308, -0.9964523, 0, 0, 0, 1, 1,
-1.884741, 1.003797, 1.82689, 0, 0, 0, 1, 1,
-1.87885, 0.7021509, -1.908029, 0, 0, 0, 1, 1,
-1.876145, 1.041596, -2.976593, 0, 0, 0, 1, 1,
-1.860482, 0.02513967, -3.11899, 0, 0, 0, 1, 1,
-1.844935, -0.0005512869, -1.047333, 0, 0, 0, 1, 1,
-1.829044, 0.6500823, -0.07146822, 1, 1, 1, 1, 1,
-1.821295, -0.8354527, -2.345946, 1, 1, 1, 1, 1,
-1.814298, -0.5525851, -0.2652823, 1, 1, 1, 1, 1,
-1.807912, 0.8764993, -2.39769, 1, 1, 1, 1, 1,
-1.806647, 0.379367, -1.456422, 1, 1, 1, 1, 1,
-1.802966, 1.423446, -2.04814, 1, 1, 1, 1, 1,
-1.791206, -0.5412788, -1.256187, 1, 1, 1, 1, 1,
-1.772607, -0.01960936, -1.02915, 1, 1, 1, 1, 1,
-1.771673, 0.7597141, -1.103889, 1, 1, 1, 1, 1,
-1.757562, 0.5050497, -1.698172, 1, 1, 1, 1, 1,
-1.744705, -1.605075, -1.834863, 1, 1, 1, 1, 1,
-1.743951, -0.5042701, -3.546569, 1, 1, 1, 1, 1,
-1.730397, -0.8883632, -1.701946, 1, 1, 1, 1, 1,
-1.6981, -0.7422935, -2.843144, 1, 1, 1, 1, 1,
-1.687593, -1.31418, -2.089109, 1, 1, 1, 1, 1,
-1.671171, -0.9029281, -2.358461, 0, 0, 1, 1, 1,
-1.636503, 0.04573946, -1.830309, 1, 0, 0, 1, 1,
-1.629566, 0.1167841, -1.807898, 1, 0, 0, 1, 1,
-1.617476, -1.240576, -4.347864, 1, 0, 0, 1, 1,
-1.613143, -0.04176616, -2.082029, 1, 0, 0, 1, 1,
-1.574943, 1.342469, -1.789315, 1, 0, 0, 1, 1,
-1.570961, 2.097414, 0.8687518, 0, 0, 0, 1, 1,
-1.550774, 1.077177, -1.111289, 0, 0, 0, 1, 1,
-1.523873, -0.3625949, -3.130871, 0, 0, 0, 1, 1,
-1.50189, 0.7025003, -0.3481717, 0, 0, 0, 1, 1,
-1.499763, 0.6330472, -1.494649, 0, 0, 0, 1, 1,
-1.479591, -0.3701605, -3.434046, 0, 0, 0, 1, 1,
-1.478552, -1.040062, -0.2135045, 0, 0, 0, 1, 1,
-1.455448, -0.6165092, -3.296129, 1, 1, 1, 1, 1,
-1.425683, 0.5495123, -2.164081, 1, 1, 1, 1, 1,
-1.413728, 1.072471, 0.0752074, 1, 1, 1, 1, 1,
-1.412322, -0.6738385, -0.7611948, 1, 1, 1, 1, 1,
-1.402897, -0.2688476, 1.681516, 1, 1, 1, 1, 1,
-1.402285, 0.5905719, -0.7303114, 1, 1, 1, 1, 1,
-1.401095, -1.119337, -1.778894, 1, 1, 1, 1, 1,
-1.395557, 0.2929969, -3.40391, 1, 1, 1, 1, 1,
-1.390165, -0.803319, -0.3829344, 1, 1, 1, 1, 1,
-1.383313, -1.016277, -1.555099, 1, 1, 1, 1, 1,
-1.37845, -0.8934922, -2.822047, 1, 1, 1, 1, 1,
-1.368327, 0.7182595, -1.517902, 1, 1, 1, 1, 1,
-1.357317, -2.499675, -3.860227, 1, 1, 1, 1, 1,
-1.351058, -0.4550444, -2.772562, 1, 1, 1, 1, 1,
-1.342104, -1.131712, -1.601532, 1, 1, 1, 1, 1,
-1.3355, -1.122869, -3.167976, 0, 0, 1, 1, 1,
-1.318893, -0.2659496, -1.936149, 1, 0, 0, 1, 1,
-1.314717, -0.8646015, -4.427113, 1, 0, 0, 1, 1,
-1.308856, 0.4278151, -3.149673, 1, 0, 0, 1, 1,
-1.30685, 0.2772863, -1.761571, 1, 0, 0, 1, 1,
-1.300651, 0.9212705, -1.15537, 1, 0, 0, 1, 1,
-1.29359, 1.134728, -0.349123, 0, 0, 0, 1, 1,
-1.290467, -0.8085231, -0.4827149, 0, 0, 0, 1, 1,
-1.288475, 0.9045397, -1.230431, 0, 0, 0, 1, 1,
-1.282453, -1.092225, -2.068504, 0, 0, 0, 1, 1,
-1.276322, -0.1282132, -2.207315, 0, 0, 0, 1, 1,
-1.271309, -0.4702638, -3.14656, 0, 0, 0, 1, 1,
-1.266131, -2.403379, -4.593269, 0, 0, 0, 1, 1,
-1.26328, -0.9570157, -3.538991, 1, 1, 1, 1, 1,
-1.256567, 0.4074175, -1.321635, 1, 1, 1, 1, 1,
-1.249465, 1.578353, -0.3737473, 1, 1, 1, 1, 1,
-1.24306, 2.494061, 0.9613816, 1, 1, 1, 1, 1,
-1.230578, 0.1482749, -1.680847, 1, 1, 1, 1, 1,
-1.225708, 0.7016895, -0.6356481, 1, 1, 1, 1, 1,
-1.218902, -0.2999325, -0.7472826, 1, 1, 1, 1, 1,
-1.214433, 1.766129, -1.508944, 1, 1, 1, 1, 1,
-1.206674, 0.1531908, -2.432118, 1, 1, 1, 1, 1,
-1.199218, 1.594108, -0.8978799, 1, 1, 1, 1, 1,
-1.192581, 0.0146746, -1.589735, 1, 1, 1, 1, 1,
-1.188748, 2.007183, -0.3478107, 1, 1, 1, 1, 1,
-1.181756, -0.09629051, 0.1076535, 1, 1, 1, 1, 1,
-1.181416, -0.7459942, -2.164374, 1, 1, 1, 1, 1,
-1.180603, -2.743018, -1.810436, 1, 1, 1, 1, 1,
-1.176351, -1.385056, -3.503688, 0, 0, 1, 1, 1,
-1.175942, 1.146615, 1.767169, 1, 0, 0, 1, 1,
-1.170551, 0.1045644, -2.047164, 1, 0, 0, 1, 1,
-1.16901, -1.29052, -1.639398, 1, 0, 0, 1, 1,
-1.167676, 0.8102297, -1.230824, 1, 0, 0, 1, 1,
-1.16603, 1.644707, 3.224874, 1, 0, 0, 1, 1,
-1.155817, 0.8583851, -0.2815115, 0, 0, 0, 1, 1,
-1.154166, -0.7139624, -3.205498, 0, 0, 0, 1, 1,
-1.139156, -1.519008, -2.60023, 0, 0, 0, 1, 1,
-1.138489, 0.2009181, -1.368498, 0, 0, 0, 1, 1,
-1.117999, 1.238268, 0.6704993, 0, 0, 0, 1, 1,
-1.113507, 1.672596, -0.06604274, 0, 0, 0, 1, 1,
-1.113466, -0.2943484, -0.6245732, 0, 0, 0, 1, 1,
-1.111678, -0.2504285, -0.3650448, 1, 1, 1, 1, 1,
-1.109307, 0.1429526, 0.7004713, 1, 1, 1, 1, 1,
-1.098835, -0.421325, -1.679102, 1, 1, 1, 1, 1,
-1.091161, 0.695332, -0.473215, 1, 1, 1, 1, 1,
-1.089571, -0.02285157, -4.546107, 1, 1, 1, 1, 1,
-1.086717, -1.28008, -3.61064, 1, 1, 1, 1, 1,
-1.086439, -1.298759, -3.074692, 1, 1, 1, 1, 1,
-1.07711, 0.2641857, -1.708857, 1, 1, 1, 1, 1,
-1.066843, 0.1659899, -0.1879292, 1, 1, 1, 1, 1,
-1.065654, 0.08806773, -2.04072, 1, 1, 1, 1, 1,
-1.065642, -0.5550599, -1.139322, 1, 1, 1, 1, 1,
-1.058947, 0.5464519, 0.4073136, 1, 1, 1, 1, 1,
-1.057898, -0.3453944, -2.019517, 1, 1, 1, 1, 1,
-1.057608, -0.5610552, -1.700576, 1, 1, 1, 1, 1,
-1.052004, -2.856333, -2.909171, 1, 1, 1, 1, 1,
-1.045853, 0.5932171, -2.654379, 0, 0, 1, 1, 1,
-1.044993, -0.3551946, -3.350823, 1, 0, 0, 1, 1,
-1.03276, 0.0882227, -2.48492, 1, 0, 0, 1, 1,
-1.029562, 1.1756, -2.218385, 1, 0, 0, 1, 1,
-1.013634, 0.2286364, -2.097048, 1, 0, 0, 1, 1,
-1.00788, -2.476387, -2.996282, 1, 0, 0, 1, 1,
-1.006578, -0.2606527, -1.46857, 0, 0, 0, 1, 1,
-0.9967298, 0.9632082, -2.189105, 0, 0, 0, 1, 1,
-0.9954028, -1.115327, -4.076083, 0, 0, 0, 1, 1,
-0.9922934, -0.6545565, -2.628824, 0, 0, 0, 1, 1,
-0.9884394, 0.8615978, -0.9681028, 0, 0, 0, 1, 1,
-0.980593, -0.6675641, -1.063159, 0, 0, 0, 1, 1,
-0.9733205, 1.193066, -0.9464319, 0, 0, 0, 1, 1,
-0.9693589, -0.01896577, -2.031849, 1, 1, 1, 1, 1,
-0.9680403, 0.607431, -1.707331, 1, 1, 1, 1, 1,
-0.9618186, -0.587842, -2.468984, 1, 1, 1, 1, 1,
-0.9605678, 1.610811, -0.5850961, 1, 1, 1, 1, 1,
-0.9544344, -0.0652945, -1.243857, 1, 1, 1, 1, 1,
-0.944656, 0.7720222, -2.608155, 1, 1, 1, 1, 1,
-0.9444056, -0.4481987, -1.619734, 1, 1, 1, 1, 1,
-0.9407607, 2.198134, 0.2937835, 1, 1, 1, 1, 1,
-0.9375453, -0.3287066, -2.373895, 1, 1, 1, 1, 1,
-0.9362593, 2.654274, -0.3228758, 1, 1, 1, 1, 1,
-0.9355491, 0.9106439, -0.9942589, 1, 1, 1, 1, 1,
-0.935437, -0.1985039, -0.7389243, 1, 1, 1, 1, 1,
-0.9309182, -1.004653, -2.87959, 1, 1, 1, 1, 1,
-0.930205, -1.583897, -1.728635, 1, 1, 1, 1, 1,
-0.9284922, 0.3248047, -0.6096212, 1, 1, 1, 1, 1,
-0.9148799, -0.5774493, -3.528398, 0, 0, 1, 1, 1,
-0.9130401, 0.05807299, -2.96612, 1, 0, 0, 1, 1,
-0.9117796, 0.7520577, -0.1750036, 1, 0, 0, 1, 1,
-0.9093091, 1.935801, -0.05602164, 1, 0, 0, 1, 1,
-0.9082478, 0.8272165, 0.4545529, 1, 0, 0, 1, 1,
-0.9052927, -3.066359, -0.8385695, 1, 0, 0, 1, 1,
-0.9047856, -2.02987, -2.372131, 0, 0, 0, 1, 1,
-0.9005944, -0.6562659, -2.420808, 0, 0, 0, 1, 1,
-0.9001025, -0.06765962, -1.911063, 0, 0, 0, 1, 1,
-0.8967504, -0.7800756, -1.905734, 0, 0, 0, 1, 1,
-0.8936892, 0.3506688, -2.143832, 0, 0, 0, 1, 1,
-0.8908542, -0.2738283, -3.540001, 0, 0, 0, 1, 1,
-0.8906413, -1.257673, -1.261278, 0, 0, 0, 1, 1,
-0.8868319, 0.6802731, -1.102786, 1, 1, 1, 1, 1,
-0.8847879, 0.9261524, -0.525306, 1, 1, 1, 1, 1,
-0.8840129, -0.8542949, -2.560421, 1, 1, 1, 1, 1,
-0.8782837, 0.02044454, -1.095562, 1, 1, 1, 1, 1,
-0.8733128, 0.05180292, -1.728619, 1, 1, 1, 1, 1,
-0.868602, 1.792229, -0.8125025, 1, 1, 1, 1, 1,
-0.8667977, 0.2730911, -1.95712, 1, 1, 1, 1, 1,
-0.8600032, -0.6649203, -1.434077, 1, 1, 1, 1, 1,
-0.8571748, 1.271886, -0.993062, 1, 1, 1, 1, 1,
-0.8556201, 1.631501, -2.201586, 1, 1, 1, 1, 1,
-0.8486605, -0.2287413, -2.02623, 1, 1, 1, 1, 1,
-0.838497, 1.869464, -0.151821, 1, 1, 1, 1, 1,
-0.8348553, 0.8771375, -1.468903, 1, 1, 1, 1, 1,
-0.8323753, -2.214209, -2.468642, 1, 1, 1, 1, 1,
-0.8318768, 1.859978, 2.359185, 1, 1, 1, 1, 1,
-0.8272818, -0.6626199, -3.329135, 0, 0, 1, 1, 1,
-0.8229493, 0.5423929, 0.1502773, 1, 0, 0, 1, 1,
-0.8213251, 1.344785, -0.69613, 1, 0, 0, 1, 1,
-0.817692, -1.620987, -2.856932, 1, 0, 0, 1, 1,
-0.8139914, -1.982018, -2.86229, 1, 0, 0, 1, 1,
-0.8076169, 0.2613047, 0.7250403, 1, 0, 0, 1, 1,
-0.8070958, -0.1216624, -1.063461, 0, 0, 0, 1, 1,
-0.8067855, 2.607317, -1.147308, 0, 0, 0, 1, 1,
-0.8052529, -2.052122, -3.28436, 0, 0, 0, 1, 1,
-0.8045428, 0.3732518, -0.3583246, 0, 0, 0, 1, 1,
-0.7987679, -1.070237, -2.625208, 0, 0, 0, 1, 1,
-0.7987552, -0.9747602, -1.227228, 0, 0, 0, 1, 1,
-0.7868047, 0.2526779, -2.221279, 0, 0, 0, 1, 1,
-0.7830049, -0.09352056, -2.15518, 1, 1, 1, 1, 1,
-0.7818753, 0.3104554, -1.795617, 1, 1, 1, 1, 1,
-0.7813146, 1.015421, -0.4631671, 1, 1, 1, 1, 1,
-0.7672151, 0.5351092, -2.236436, 1, 1, 1, 1, 1,
-0.7655171, -0.4836199, -1.340302, 1, 1, 1, 1, 1,
-0.7654722, 0.5559403, -1.481849, 1, 1, 1, 1, 1,
-0.7623867, -2.130914, -2.627988, 1, 1, 1, 1, 1,
-0.7604437, 0.4573177, -0.7539238, 1, 1, 1, 1, 1,
-0.7589194, 1.092, -0.7233573, 1, 1, 1, 1, 1,
-0.755676, 0.3387201, -1.534055, 1, 1, 1, 1, 1,
-0.74787, 1.217919, -1.133526, 1, 1, 1, 1, 1,
-0.7448732, -0.7155595, -3.169892, 1, 1, 1, 1, 1,
-0.7420827, -0.5324296, -2.207324, 1, 1, 1, 1, 1,
-0.7311653, 0.8338873, -0.7292092, 1, 1, 1, 1, 1,
-0.7292258, 2.371859, 1.897073, 1, 1, 1, 1, 1,
-0.7248751, 0.5962782, -1.836694, 0, 0, 1, 1, 1,
-0.7237816, 0.5937657, -1.817453, 1, 0, 0, 1, 1,
-0.7168735, -0.9215702, -2.712836, 1, 0, 0, 1, 1,
-0.7111424, -0.2875363, -3.255677, 1, 0, 0, 1, 1,
-0.7081744, 0.2538398, -1.566898, 1, 0, 0, 1, 1,
-0.7071165, 1.16054, -0.6336791, 1, 0, 0, 1, 1,
-0.700622, -0.4622485, -2.560005, 0, 0, 0, 1, 1,
-0.6904235, -0.2055509, -1.786653, 0, 0, 0, 1, 1,
-0.6902652, 1.240105, -1.435448, 0, 0, 0, 1, 1,
-0.6847852, 1.162183, -1.326971, 0, 0, 0, 1, 1,
-0.6838502, -1.652733, -4.58721, 0, 0, 0, 1, 1,
-0.6825492, 0.07562628, -1.585061, 0, 0, 0, 1, 1,
-0.6760504, -0.1842744, -1.881043, 0, 0, 0, 1, 1,
-0.6649321, 0.326993, -0.7425981, 1, 1, 1, 1, 1,
-0.6486128, 0.7335211, 0.6522205, 1, 1, 1, 1, 1,
-0.6469282, 1.048057, -1.304717, 1, 1, 1, 1, 1,
-0.6443172, -1.556938, -3.748781, 1, 1, 1, 1, 1,
-0.6440462, -0.45981, -1.235692, 1, 1, 1, 1, 1,
-0.6423447, 0.6158519, -1.48338, 1, 1, 1, 1, 1,
-0.6404079, 0.1383111, -2.176087, 1, 1, 1, 1, 1,
-0.6392964, 0.2042563, -2.009279, 1, 1, 1, 1, 1,
-0.6368613, 0.08074279, -0.9564537, 1, 1, 1, 1, 1,
-0.6359749, -1.185469, -2.610641, 1, 1, 1, 1, 1,
-0.6353093, -2.141749, -2.14993, 1, 1, 1, 1, 1,
-0.6351058, 0.5203465, -2.307733, 1, 1, 1, 1, 1,
-0.6322966, 1.148186, 0.6392939, 1, 1, 1, 1, 1,
-0.6278045, -0.6565321, -4.973409, 1, 1, 1, 1, 1,
-0.6249022, 0.4820775, -2.476328, 1, 1, 1, 1, 1,
-0.6242467, 0.5744812, -0.9321488, 0, 0, 1, 1, 1,
-0.6179684, -0.1528357, -2.753733, 1, 0, 0, 1, 1,
-0.6176082, -0.7480372, -1.809531, 1, 0, 0, 1, 1,
-0.6174021, -0.8403536, -2.984375, 1, 0, 0, 1, 1,
-0.6158003, -0.1471342, -0.9968872, 1, 0, 0, 1, 1,
-0.6127545, -2.267025, -2.226752, 1, 0, 0, 1, 1,
-0.611537, 0.1603088, -2.49005, 0, 0, 0, 1, 1,
-0.6104999, 0.9727299, 0.1480058, 0, 0, 0, 1, 1,
-0.6079196, 2.180559, -0.558327, 0, 0, 0, 1, 1,
-0.6070028, -0.346496, -0.2516211, 0, 0, 0, 1, 1,
-0.6068697, 1.357623, -0.6045783, 0, 0, 0, 1, 1,
-0.6066694, -0.3665765, -0.09927733, 0, 0, 0, 1, 1,
-0.6021687, 2.249709, -1.348647, 0, 0, 0, 1, 1,
-0.6015436, -2.476727, -1.356264, 1, 1, 1, 1, 1,
-0.5971549, 0.8312762, -0.7425603, 1, 1, 1, 1, 1,
-0.591585, -0.8272381, -0.6036037, 1, 1, 1, 1, 1,
-0.5897142, -0.3000701, -4.204311, 1, 1, 1, 1, 1,
-0.5874336, -1.20442, -2.633389, 1, 1, 1, 1, 1,
-0.5863945, 0.1226612, -0.269296, 1, 1, 1, 1, 1,
-0.5863649, 0.1554936, -2.21647, 1, 1, 1, 1, 1,
-0.5819042, 0.4937563, -1.494049, 1, 1, 1, 1, 1,
-0.5786784, -0.2948501, -2.864956, 1, 1, 1, 1, 1,
-0.5780752, 1.142354, -1.580989, 1, 1, 1, 1, 1,
-0.5703734, -0.2951952, -2.216231, 1, 1, 1, 1, 1,
-0.5653643, -0.5927172, -1.600976, 1, 1, 1, 1, 1,
-0.5609913, 0.3092715, 0.9446809, 1, 1, 1, 1, 1,
-0.558546, -0.7505404, -1.526902, 1, 1, 1, 1, 1,
-0.5560535, 0.6509527, -0.02021377, 1, 1, 1, 1, 1,
-0.5549726, -1.703411, -3.253853, 0, 0, 1, 1, 1,
-0.5516641, 0.05760301, -1.051501, 1, 0, 0, 1, 1,
-0.5505677, -0.2921992, -2.949536, 1, 0, 0, 1, 1,
-0.544807, 0.6880517, -1.56876, 1, 0, 0, 1, 1,
-0.5424659, 0.3262379, -0.9147687, 1, 0, 0, 1, 1,
-0.5375308, 1.46258, 0.5515325, 1, 0, 0, 1, 1,
-0.5351881, 0.916041, 0.01176752, 0, 0, 0, 1, 1,
-0.534329, 0.6114786, -0.7004121, 0, 0, 0, 1, 1,
-0.5324066, 0.1701279, 0.6614822, 0, 0, 0, 1, 1,
-0.5313947, 0.4617322, -0.7500284, 0, 0, 0, 1, 1,
-0.5274922, -0.9005324, -1.03541, 0, 0, 0, 1, 1,
-0.5196118, -0.3219377, -3.062045, 0, 0, 0, 1, 1,
-0.518451, 0.1169715, 0.6573216, 0, 0, 0, 1, 1,
-0.5174028, -0.5512429, -2.856995, 1, 1, 1, 1, 1,
-0.5099269, 0.9643345, -0.3091658, 1, 1, 1, 1, 1,
-0.5067656, 0.1776559, -0.3171186, 1, 1, 1, 1, 1,
-0.5055875, 0.0231287, -1.76957, 1, 1, 1, 1, 1,
-0.5042726, 0.489507, -0.004301709, 1, 1, 1, 1, 1,
-0.5037462, -1.324513, -3.492456, 1, 1, 1, 1, 1,
-0.4945923, 2.424384, 0.08569477, 1, 1, 1, 1, 1,
-0.4914365, 0.5229826, 0.4383274, 1, 1, 1, 1, 1,
-0.4909421, 1.124193, -1.591789, 1, 1, 1, 1, 1,
-0.4863448, 0.4255455, -2.031497, 1, 1, 1, 1, 1,
-0.4849795, 0.6152748, -0.7246425, 1, 1, 1, 1, 1,
-0.4789328, 0.7301276, -1.036083, 1, 1, 1, 1, 1,
-0.4748255, 0.7178757, -0.09515783, 1, 1, 1, 1, 1,
-0.4675532, 0.2896628, 0.05363266, 1, 1, 1, 1, 1,
-0.4668102, 0.5828879, -0.7692993, 1, 1, 1, 1, 1,
-0.4638205, -1.51985, -1.671876, 0, 0, 1, 1, 1,
-0.4627046, 0.118578, 0.9260937, 1, 0, 0, 1, 1,
-0.4593817, -1.342996, -2.648981, 1, 0, 0, 1, 1,
-0.4571922, 0.7565706, -1.448987, 1, 0, 0, 1, 1,
-0.4559277, 0.08861426, -1.105404, 1, 0, 0, 1, 1,
-0.4473506, -1.584731, -3.814464, 1, 0, 0, 1, 1,
-0.4460238, -0.2598314, -0.5815456, 0, 0, 0, 1, 1,
-0.4441876, -0.8282917, -2.263804, 0, 0, 0, 1, 1,
-0.4393936, 0.8707379, -0.09297728, 0, 0, 0, 1, 1,
-0.4383996, -0.9327978, -2.542606, 0, 0, 0, 1, 1,
-0.4367549, 1.742995, 0.5833406, 0, 0, 0, 1, 1,
-0.4345945, 0.4579297, -1.683009, 0, 0, 0, 1, 1,
-0.4341155, 0.07625844, -0.02807383, 0, 0, 0, 1, 1,
-0.4308227, -0.6569671, -3.11166, 1, 1, 1, 1, 1,
-0.4193135, 0.9181123, -0.3889467, 1, 1, 1, 1, 1,
-0.4164936, -1.148394, -4.069486, 1, 1, 1, 1, 1,
-0.408757, 0.8667051, -0.9432729, 1, 1, 1, 1, 1,
-0.4068768, 1.406841, 1.128216, 1, 1, 1, 1, 1,
-0.4042709, -1.707829, -2.891471, 1, 1, 1, 1, 1,
-0.4034874, 0.336127, -1.118213, 1, 1, 1, 1, 1,
-0.4010101, -0.730957, -1.943624, 1, 1, 1, 1, 1,
-0.4002393, -0.6051368, -0.3987621, 1, 1, 1, 1, 1,
-0.3989272, -0.4446364, -2.356079, 1, 1, 1, 1, 1,
-0.3970173, -0.9716408, -2.976391, 1, 1, 1, 1, 1,
-0.396207, 1.397583, -1.344746, 1, 1, 1, 1, 1,
-0.3945142, 0.228997, -0.2698167, 1, 1, 1, 1, 1,
-0.3911279, -1.569603, -3.853042, 1, 1, 1, 1, 1,
-0.3891833, 0.3650068, -0.9338319, 1, 1, 1, 1, 1,
-0.3852623, -0.8742126, -3.307807, 0, 0, 1, 1, 1,
-0.3850624, 0.5235742, 0.7954018, 1, 0, 0, 1, 1,
-0.3822115, 2.762425, -0.979142, 1, 0, 0, 1, 1,
-0.3810681, -0.8294209, -2.842795, 1, 0, 0, 1, 1,
-0.378409, 0.696963, 0.01898732, 1, 0, 0, 1, 1,
-0.3698649, 0.5429827, -0.02175952, 1, 0, 0, 1, 1,
-0.3675696, -0.7947093, -2.880931, 0, 0, 0, 1, 1,
-0.3672215, -1.114758, -3.789541, 0, 0, 0, 1, 1,
-0.3648024, -0.6090131, -3.385139, 0, 0, 0, 1, 1,
-0.3644186, 0.9007388, 0.1195945, 0, 0, 0, 1, 1,
-0.3641196, -0.7774862, -2.228063, 0, 0, 0, 1, 1,
-0.3639128, 0.2377357, -1.664911, 0, 0, 0, 1, 1,
-0.3629249, 2.03549, 0.4033849, 0, 0, 0, 1, 1,
-0.3535002, 1.420719, 0.5347298, 1, 1, 1, 1, 1,
-0.353082, 1.185548, -0.7830418, 1, 1, 1, 1, 1,
-0.349148, -0.3608855, -0.308268, 1, 1, 1, 1, 1,
-0.3488538, -0.2483042, -2.143708, 1, 1, 1, 1, 1,
-0.3470209, 0.7845293, -1.70193, 1, 1, 1, 1, 1,
-0.3439397, -0.8768538, -1.640496, 1, 1, 1, 1, 1,
-0.3435419, -0.3468561, -2.552588, 1, 1, 1, 1, 1,
-0.3417656, 0.9070469, 0.3403853, 1, 1, 1, 1, 1,
-0.3414255, -2.290962, -3.236999, 1, 1, 1, 1, 1,
-0.3410485, -1.639123, -4.058127, 1, 1, 1, 1, 1,
-0.3391739, -0.9557172, -3.126614, 1, 1, 1, 1, 1,
-0.3321741, -0.3916937, -2.155328, 1, 1, 1, 1, 1,
-0.3301659, -1.311146, -3.470256, 1, 1, 1, 1, 1,
-0.3276851, -1.498395, -3.32304, 1, 1, 1, 1, 1,
-0.3271807, 0.5569479, -0.4856642, 1, 1, 1, 1, 1,
-0.3259898, 1.082457, 0.2462776, 0, 0, 1, 1, 1,
-0.3244543, 1.995321, -1.06851, 1, 0, 0, 1, 1,
-0.3237987, -0.02669106, -2.084581, 1, 0, 0, 1, 1,
-0.3227126, 0.6434733, 0.582716, 1, 0, 0, 1, 1,
-0.3206653, -0.3986294, -2.70691, 1, 0, 0, 1, 1,
-0.3199749, -0.3227224, -2.732471, 1, 0, 0, 1, 1,
-0.3190048, -0.9380135, -1.600524, 0, 0, 0, 1, 1,
-0.3158186, 0.9681937, -0.1761645, 0, 0, 0, 1, 1,
-0.3036205, -1.188608, -3.2469, 0, 0, 0, 1, 1,
-0.3032689, 1.264048, 0.2870192, 0, 0, 0, 1, 1,
-0.3015657, 0.1779419, -2.937978, 0, 0, 0, 1, 1,
-0.2893103, -0.3481817, -2.753617, 0, 0, 0, 1, 1,
-0.2885289, 1.772512, 0.4364265, 0, 0, 0, 1, 1,
-0.2864332, 1.776057, 0.8024737, 1, 1, 1, 1, 1,
-0.2844127, 0.8851708, 0.6001245, 1, 1, 1, 1, 1,
-0.281261, -0.520075, -2.902633, 1, 1, 1, 1, 1,
-0.2793696, -1.549155, -2.534863, 1, 1, 1, 1, 1,
-0.2763857, 0.9728336, -2.14805, 1, 1, 1, 1, 1,
-0.2731271, -0.2908268, -0.5371069, 1, 1, 1, 1, 1,
-0.2729659, -1.403669, -3.566874, 1, 1, 1, 1, 1,
-0.2711595, 0.1057028, -0.5238936, 1, 1, 1, 1, 1,
-0.2672882, -0.6339152, -3.158203, 1, 1, 1, 1, 1,
-0.2632984, 1.400625, 1.191606, 1, 1, 1, 1, 1,
-0.2625745, 1.565796, 0.5461279, 1, 1, 1, 1, 1,
-0.2581162, 0.8106851, 1.216421, 1, 1, 1, 1, 1,
-0.2567768, 1.476395, -0.1229877, 1, 1, 1, 1, 1,
-0.2567019, -1.099441, -2.934042, 1, 1, 1, 1, 1,
-0.2529781, 0.304879, -2.300443, 1, 1, 1, 1, 1,
-0.2521657, -0.4374721, -2.528957, 0, 0, 1, 1, 1,
-0.2428587, 0.3817255, -2.384509, 1, 0, 0, 1, 1,
-0.2425765, -0.8022548, -3.175933, 1, 0, 0, 1, 1,
-0.2420674, 1.455599, 0.595776, 1, 0, 0, 1, 1,
-0.2369888, -2.125282, -2.935957, 1, 0, 0, 1, 1,
-0.2312413, 2.029603, -1.186572, 1, 0, 0, 1, 1,
-0.2280385, 0.007609904, -1.674403, 0, 0, 0, 1, 1,
-0.2241145, 0.3816528, -0.5494614, 0, 0, 0, 1, 1,
-0.2226368, -0.11906, -2.822251, 0, 0, 0, 1, 1,
-0.219396, -1.839241, -2.273002, 0, 0, 0, 1, 1,
-0.2164866, -0.5718024, -4.772197, 0, 0, 0, 1, 1,
-0.2125715, 1.061463, 1.131361, 0, 0, 0, 1, 1,
-0.2065079, -0.9110786, -1.243847, 0, 0, 0, 1, 1,
-0.2022657, -0.03757713, -2.042199, 1, 1, 1, 1, 1,
-0.199785, -1.107581, -3.701308, 1, 1, 1, 1, 1,
-0.1963692, 0.4904257, -0.1729462, 1, 1, 1, 1, 1,
-0.1936841, 0.7254503, 0.6933511, 1, 1, 1, 1, 1,
-0.1932655, 0.6750315, 0.7568842, 1, 1, 1, 1, 1,
-0.1877712, -0.4214632, -2.496455, 1, 1, 1, 1, 1,
-0.186077, 0.0432062, 0.2854425, 1, 1, 1, 1, 1,
-0.1843957, -0.2661329, -0.5219998, 1, 1, 1, 1, 1,
-0.1804669, -0.2771456, -2.730493, 1, 1, 1, 1, 1,
-0.1772757, -1.86042, -1.554732, 1, 1, 1, 1, 1,
-0.1762831, 1.748142, -2.25183, 1, 1, 1, 1, 1,
-0.1759077, -1.245393, -2.604921, 1, 1, 1, 1, 1,
-0.172803, 0.2374072, -0.3638427, 1, 1, 1, 1, 1,
-0.1665349, 0.3703898, -0.2570638, 1, 1, 1, 1, 1,
-0.1644334, 0.3646866, -2.10694, 1, 1, 1, 1, 1,
-0.1629008, -0.6789075, -3.229579, 0, 0, 1, 1, 1,
-0.1616286, -0.2877446, -3.585794, 1, 0, 0, 1, 1,
-0.1605786, -0.02188267, -1.277384, 1, 0, 0, 1, 1,
-0.1586572, 0.4557382, 0.4108691, 1, 0, 0, 1, 1,
-0.1573194, -0.3177536, -3.121702, 1, 0, 0, 1, 1,
-0.1567722, -0.2186604, -2.563502, 1, 0, 0, 1, 1,
-0.1545278, 1.088378, -0.5677468, 0, 0, 0, 1, 1,
-0.1499291, 1.200678, -0.1028678, 0, 0, 0, 1, 1,
-0.1483595, -0.4222432, -0.9643613, 0, 0, 0, 1, 1,
-0.1476136, -0.9805616, -4.077392, 0, 0, 0, 1, 1,
-0.1473294, 0.7166066, -0.4580538, 0, 0, 0, 1, 1,
-0.1456419, 1.64671, -1.083791, 0, 0, 0, 1, 1,
-0.14502, -0.587559, -2.275362, 0, 0, 0, 1, 1,
-0.1439884, -0.7625445, -2.518239, 1, 1, 1, 1, 1,
-0.1386805, -0.1804033, -1.813615, 1, 1, 1, 1, 1,
-0.1366707, 0.1630174, -0.989662, 1, 1, 1, 1, 1,
-0.1348782, -0.3558038, -2.494076, 1, 1, 1, 1, 1,
-0.1345903, 1.39378, -2.01635, 1, 1, 1, 1, 1,
-0.1336509, -1.581808, -4.879141, 1, 1, 1, 1, 1,
-0.1203595, 0.9244285, 1.041254, 1, 1, 1, 1, 1,
-0.1142947, 0.3966233, 1.178403, 1, 1, 1, 1, 1,
-0.1127397, 0.4296267, 2.172384, 1, 1, 1, 1, 1,
-0.1116202, -0.3665641, -4.878067, 1, 1, 1, 1, 1,
-0.1098563, 0.3339188, 0.5609799, 1, 1, 1, 1, 1,
-0.1093586, -0.03693748, -2.327032, 1, 1, 1, 1, 1,
-0.105937, 0.931114, -1.403802, 1, 1, 1, 1, 1,
-0.1021805, -1.556142, -1.043549, 1, 1, 1, 1, 1,
-0.101233, 0.6654583, -0.9605678, 1, 1, 1, 1, 1,
-0.1011172, -0.09044744, -2.024588, 0, 0, 1, 1, 1,
-0.1005144, -1.342136, -2.758124, 1, 0, 0, 1, 1,
-0.09803346, -1.228035, -2.230757, 1, 0, 0, 1, 1,
-0.09463987, 1.272248, -0.3735747, 1, 0, 0, 1, 1,
-0.09203675, 0.2695302, -0.7572965, 1, 0, 0, 1, 1,
-0.08610301, 0.0947547, -0.8013378, 1, 0, 0, 1, 1,
-0.08462006, -0.1118833, -2.693196, 0, 0, 0, 1, 1,
-0.07492283, 0.2511554, -0.5256204, 0, 0, 0, 1, 1,
-0.07351156, -0.5415998, -1.928073, 0, 0, 0, 1, 1,
-0.07280897, -2.21279, -4.306005, 0, 0, 0, 1, 1,
-0.06989583, -0.9770464, -2.74747, 0, 0, 0, 1, 1,
-0.06826151, 1.26145, -2.084105, 0, 0, 0, 1, 1,
-0.06567916, 1.634633, 0.08242816, 0, 0, 0, 1, 1,
-0.05560098, -0.8605709, -3.407082, 1, 1, 1, 1, 1,
-0.05230772, -2.321237, -2.080024, 1, 1, 1, 1, 1,
-0.05155779, 0.7245672, -0.3300407, 1, 1, 1, 1, 1,
-0.04360282, -0.3264548, -2.336489, 1, 1, 1, 1, 1,
-0.03998126, 1.101, 0.8022513, 1, 1, 1, 1, 1,
-0.03475148, 0.5590975, 0.05206039, 1, 1, 1, 1, 1,
-0.03357451, 0.212966, -0.2426032, 1, 1, 1, 1, 1,
-0.03207326, -1.531715, -3.13834, 1, 1, 1, 1, 1,
-0.03139805, -1.461566, -1.616865, 1, 1, 1, 1, 1,
-0.03079506, -0.1159337, -1.092284, 1, 1, 1, 1, 1,
-0.0298668, 0.2280015, 0.01724431, 1, 1, 1, 1, 1,
-0.02879366, 0.6921864, 0.4510542, 1, 1, 1, 1, 1,
-0.02703417, -0.1559815, -2.5062, 1, 1, 1, 1, 1,
-0.02592003, -1.177436, -1.782694, 1, 1, 1, 1, 1,
-0.02530895, 0.6279711, -1.483519, 1, 1, 1, 1, 1,
-0.01860526, 0.5437644, -0.0132944, 0, 0, 1, 1, 1,
-0.01574888, 0.7854792, 0.6846374, 1, 0, 0, 1, 1,
-0.01546674, 1.323392, -0.06021504, 1, 0, 0, 1, 1,
-0.0130224, 1.30753, -0.440318, 1, 0, 0, 1, 1,
-0.005000641, -0.1447445, -3.602088, 1, 0, 0, 1, 1,
-0.001330918, -0.6563316, -3.067102, 1, 0, 0, 1, 1,
-0.000455888, -0.04718557, -1.891101, 0, 0, 0, 1, 1,
-0.0004539708, 0.4803968, -1.075839, 0, 0, 0, 1, 1,
0.005164964, -0.9568393, 3.116288, 0, 0, 0, 1, 1,
0.006174665, -0.6586701, 3.097299, 0, 0, 0, 1, 1,
0.006401822, 0.4786767, 0.8843532, 0, 0, 0, 1, 1,
0.007326446, 1.05522, 1.311713, 0, 0, 0, 1, 1,
0.009917155, -0.8608592, 2.323068, 0, 0, 0, 1, 1,
0.0103464, 1.333607, 0.05814621, 1, 1, 1, 1, 1,
0.01208944, 1.206181, -1.531978, 1, 1, 1, 1, 1,
0.01246814, 0.3878707, 0.7612029, 1, 1, 1, 1, 1,
0.01812064, -0.3782661, 3.10964, 1, 1, 1, 1, 1,
0.0196916, -1.341641, 2.941602, 1, 1, 1, 1, 1,
0.02116094, 1.862132, 0.8482699, 1, 1, 1, 1, 1,
0.02219828, 1.523753, 0.4073254, 1, 1, 1, 1, 1,
0.0260317, -0.07747774, 3.236395, 1, 1, 1, 1, 1,
0.02675151, 0.502917, 0.634778, 1, 1, 1, 1, 1,
0.0318356, 0.2820632, -1.186897, 1, 1, 1, 1, 1,
0.0337297, -0.6824395, 2.978258, 1, 1, 1, 1, 1,
0.03450737, 1.466058, 1.148314, 1, 1, 1, 1, 1,
0.03676756, -0.8330541, 3.268718, 1, 1, 1, 1, 1,
0.03850095, 0.2056373, -0.774177, 1, 1, 1, 1, 1,
0.04180675, -0.3303062, 4.72535, 1, 1, 1, 1, 1,
0.0420302, -0.4856578, 2.483237, 0, 0, 1, 1, 1,
0.0458164, 0.5041372, 0.3921141, 1, 0, 0, 1, 1,
0.04724628, -0.898016, 4.378679, 1, 0, 0, 1, 1,
0.04739314, -1.730673, 4.548188, 1, 0, 0, 1, 1,
0.04803072, 0.08411007, 0.3648408, 1, 0, 0, 1, 1,
0.05393491, -0.5925711, 3.617375, 1, 0, 0, 1, 1,
0.05420128, 0.4312396, 0.131415, 0, 0, 0, 1, 1,
0.05581572, -0.5177096, 2.910866, 0, 0, 0, 1, 1,
0.05688689, 1.119923, -0.1169463, 0, 0, 0, 1, 1,
0.06599033, -0.9740605, 2.744403, 0, 0, 0, 1, 1,
0.06689422, 0.8742725, -1.756054, 0, 0, 0, 1, 1,
0.06875835, 0.9454254, 2.196025, 0, 0, 0, 1, 1,
0.07490458, -0.5751465, 2.073974, 0, 0, 0, 1, 1,
0.07751793, 2.330415, -0.1162342, 1, 1, 1, 1, 1,
0.07777821, 0.3338038, 1.186382, 1, 1, 1, 1, 1,
0.07840256, 0.2086546, -0.9280779, 1, 1, 1, 1, 1,
0.0793405, 0.009203955, 2.189374, 1, 1, 1, 1, 1,
0.08892068, -1.062354, 2.8666, 1, 1, 1, 1, 1,
0.08893052, -0.57662, 3.039619, 1, 1, 1, 1, 1,
0.09038644, 0.346724, 1.13412, 1, 1, 1, 1, 1,
0.09073388, -0.9161795, 2.726377, 1, 1, 1, 1, 1,
0.09130812, -0.2867099, 4.019958, 1, 1, 1, 1, 1,
0.0922058, -0.4661349, 2.026022, 1, 1, 1, 1, 1,
0.1030337, -0.04473714, 2.265445, 1, 1, 1, 1, 1,
0.1031876, -0.2679343, 2.49304, 1, 1, 1, 1, 1,
0.1053781, 0.6111366, -0.196606, 1, 1, 1, 1, 1,
0.1056202, -0.5460829, 3.654851, 1, 1, 1, 1, 1,
0.106202, -0.01498266, 1.999642, 1, 1, 1, 1, 1,
0.1070613, 0.734885, 0.1641862, 0, 0, 1, 1, 1,
0.1101298, 1.63632, 0.8465108, 1, 0, 0, 1, 1,
0.1104333, -2.986039, 3.1416, 1, 0, 0, 1, 1,
0.1114157, -1.653158, 4.612803, 1, 0, 0, 1, 1,
0.1123142, -1.146102, 4.866433, 1, 0, 0, 1, 1,
0.1138782, -0.9271578, 4.00324, 1, 0, 0, 1, 1,
0.1152182, -1.740255, 2.547676, 0, 0, 0, 1, 1,
0.1186674, -2.291035, 1.141312, 0, 0, 0, 1, 1,
0.1208381, 0.3896039, 0.9795141, 0, 0, 0, 1, 1,
0.1211665, -1.160502, 1.166031, 0, 0, 0, 1, 1,
0.1225984, -1.628921, 3.473447, 0, 0, 0, 1, 1,
0.1251144, -0.9233816, 2.614867, 0, 0, 0, 1, 1,
0.1257535, 0.1599239, 2.192359, 0, 0, 0, 1, 1,
0.1289543, 0.7919319, 0.08367965, 1, 1, 1, 1, 1,
0.129765, 0.820103, -0.3429123, 1, 1, 1, 1, 1,
0.1316396, 0.1299997, 1.542528, 1, 1, 1, 1, 1,
0.1331015, 0.3546835, 0.3257638, 1, 1, 1, 1, 1,
0.1335582, 0.9170952, 0.4783675, 1, 1, 1, 1, 1,
0.1352234, -1.069301, 4.727597, 1, 1, 1, 1, 1,
0.1365078, 1.337991, -1.970251, 1, 1, 1, 1, 1,
0.143089, 0.1648591, 2.521252, 1, 1, 1, 1, 1,
0.147867, -0.7439166, 3.281549, 1, 1, 1, 1, 1,
0.148559, -0.9481305, 4.303275, 1, 1, 1, 1, 1,
0.1494476, -0.7906486, 2.567758, 1, 1, 1, 1, 1,
0.1498851, 0.5961259, -0.21413, 1, 1, 1, 1, 1,
0.1584495, -0.6215216, 2.661723, 1, 1, 1, 1, 1,
0.1610119, -1.579448, 5.084461, 1, 1, 1, 1, 1,
0.1623777, 1.496309, 0.5329171, 1, 1, 1, 1, 1,
0.1639654, 0.1903868, 1.713364, 0, 0, 1, 1, 1,
0.1641422, -1.052365, 2.466485, 1, 0, 0, 1, 1,
0.1664598, -0.9680495, 0.03318693, 1, 0, 0, 1, 1,
0.1678724, -0.7456253, 5.35703, 1, 0, 0, 1, 1,
0.1679983, -0.7991694, 2.104499, 1, 0, 0, 1, 1,
0.1710766, 0.1914878, 1.919186, 1, 0, 0, 1, 1,
0.1772785, 1.408121, 1.212414, 0, 0, 0, 1, 1,
0.1806699, -0.2553352, 1.370067, 0, 0, 0, 1, 1,
0.1812864, 0.3434455, 1.042043, 0, 0, 0, 1, 1,
0.1845363, -0.4404681, 1.546858, 0, 0, 0, 1, 1,
0.1861599, -1.334511, 3.064951, 0, 0, 0, 1, 1,
0.1862993, -0.7437742, 2.928053, 0, 0, 0, 1, 1,
0.1884389, -0.2435017, 2.549877, 0, 0, 0, 1, 1,
0.189797, 0.08512451, 1.113747, 1, 1, 1, 1, 1,
0.1915344, -0.6102377, 3.553545, 1, 1, 1, 1, 1,
0.1919792, -0.3942766, 2.333635, 1, 1, 1, 1, 1,
0.1920458, 1.933963, 1.021924, 1, 1, 1, 1, 1,
0.1924831, 1.517757, 1.530945, 1, 1, 1, 1, 1,
0.1959584, 1.316319, 1.515798, 1, 1, 1, 1, 1,
0.1964685, -0.2247036, 0.7067275, 1, 1, 1, 1, 1,
0.1967697, 0.8881136, -1.54237, 1, 1, 1, 1, 1,
0.2019854, 1.068756, 0.573789, 1, 1, 1, 1, 1,
0.2038359, 0.1477489, 0.712124, 1, 1, 1, 1, 1,
0.2045346, 0.07026129, 2.079437, 1, 1, 1, 1, 1,
0.2045526, 0.4807699, -1.391325, 1, 1, 1, 1, 1,
0.2084294, 1.558694, -1.426627, 1, 1, 1, 1, 1,
0.2095069, -1.069848, 2.870259, 1, 1, 1, 1, 1,
0.2121933, 0.518485, 1.53228, 1, 1, 1, 1, 1,
0.2140152, 2.699603, -0.06936742, 0, 0, 1, 1, 1,
0.2169416, -0.08509595, 1.48113, 1, 0, 0, 1, 1,
0.217429, -0.4161642, 3.596981, 1, 0, 0, 1, 1,
0.2175619, -0.1973078, 3.777999, 1, 0, 0, 1, 1,
0.2177386, 0.8796407, 0.3394383, 1, 0, 0, 1, 1,
0.2230034, 0.8079845, -1.741964, 1, 0, 0, 1, 1,
0.2243501, 0.5791699, 0.4830639, 0, 0, 0, 1, 1,
0.2249725, -0.416348, 2.920421, 0, 0, 0, 1, 1,
0.2292547, 0.8641655, 1.043264, 0, 0, 0, 1, 1,
0.2321444, 0.06564347, -0.0667044, 0, 0, 0, 1, 1,
0.2378791, -0.08506436, 1.67237, 0, 0, 0, 1, 1,
0.2398981, -0.8721087, 2.808664, 0, 0, 0, 1, 1,
0.2449164, -0.09841966, 2.82104, 0, 0, 0, 1, 1,
0.2474475, 0.27681, -0.2914613, 1, 1, 1, 1, 1,
0.2511834, 2.085413, -0.02661663, 1, 1, 1, 1, 1,
0.2575879, 0.1482877, 1.352839, 1, 1, 1, 1, 1,
0.2581117, -0.5759501, 2.422085, 1, 1, 1, 1, 1,
0.2608345, 1.459106, -1.558864, 1, 1, 1, 1, 1,
0.2623038, 0.3059947, 1.524519, 1, 1, 1, 1, 1,
0.2629634, 0.5920048, -0.1535375, 1, 1, 1, 1, 1,
0.2657968, -1.202232, 4.125956, 1, 1, 1, 1, 1,
0.2664477, 0.08905037, 1.007909, 1, 1, 1, 1, 1,
0.2665724, -0.1546091, 2.95327, 1, 1, 1, 1, 1,
0.2680537, -0.8717577, 3.776907, 1, 1, 1, 1, 1,
0.2697518, 0.3687165, 2.645947, 1, 1, 1, 1, 1,
0.2712629, -1.080811, 4.010329, 1, 1, 1, 1, 1,
0.2718566, 0.7457035, -1.689324, 1, 1, 1, 1, 1,
0.2744497, 1.38798, 0.4176969, 1, 1, 1, 1, 1,
0.2760577, -0.7872996, 2.347189, 0, 0, 1, 1, 1,
0.2775967, -0.8407601, 2.981317, 1, 0, 0, 1, 1,
0.2837624, 1.021501, 0.642873, 1, 0, 0, 1, 1,
0.284601, 0.5777678, -0.2811109, 1, 0, 0, 1, 1,
0.2851806, 0.2545072, 0.2552286, 1, 0, 0, 1, 1,
0.2857755, 0.1999298, 0.7717833, 1, 0, 0, 1, 1,
0.2865948, 0.4347538, 1.436321, 0, 0, 0, 1, 1,
0.2870894, -0.8375431, 3.061359, 0, 0, 0, 1, 1,
0.292006, 0.5061282, -0.09117172, 0, 0, 0, 1, 1,
0.2920254, -1.711585, 1.945971, 0, 0, 0, 1, 1,
0.2944425, -0.9027488, 2.187503, 0, 0, 0, 1, 1,
0.2954377, 0.1487342, 1.405107, 0, 0, 0, 1, 1,
0.2959841, 0.03899914, 1.907465, 0, 0, 0, 1, 1,
0.2982153, -1.397059, 1.374049, 1, 1, 1, 1, 1,
0.3001452, 1.409991, -1.546092, 1, 1, 1, 1, 1,
0.3012402, 1.174775, 0.7681052, 1, 1, 1, 1, 1,
0.3040189, -0.3649129, 2.012854, 1, 1, 1, 1, 1,
0.3052292, -0.5650322, 0.4355448, 1, 1, 1, 1, 1,
0.3090304, -0.5223538, 3.239439, 1, 1, 1, 1, 1,
0.3101917, 0.3522008, 0.3649125, 1, 1, 1, 1, 1,
0.3112002, 1.534602, -0.6183851, 1, 1, 1, 1, 1,
0.3277462, -0.191277, 3.343239, 1, 1, 1, 1, 1,
0.3332305, -0.2405992, 1.778166, 1, 1, 1, 1, 1,
0.3334648, -1.450357, 3.417475, 1, 1, 1, 1, 1,
0.3375388, -1.165471, 2.948915, 1, 1, 1, 1, 1,
0.3414, -0.1055735, 1.205148, 1, 1, 1, 1, 1,
0.3433959, 0.07056427, -0.8027986, 1, 1, 1, 1, 1,
0.346316, 0.792785, -0.470266, 1, 1, 1, 1, 1,
0.3467852, -0.9268818, 1.909572, 0, 0, 1, 1, 1,
0.3611611, 0.2648915, 0.7589356, 1, 0, 0, 1, 1,
0.362164, 0.02356923, 2.544428, 1, 0, 0, 1, 1,
0.3636394, 0.5185927, -0.6504684, 1, 0, 0, 1, 1,
0.3653993, -0.8356224, 2.361463, 1, 0, 0, 1, 1,
0.365622, -1.523021, 4.133219, 1, 0, 0, 1, 1,
0.3696361, 1.559637, -0.2969589, 0, 0, 0, 1, 1,
0.3697073, 0.08385529, 2.343487, 0, 0, 0, 1, 1,
0.3756366, -0.07859343, 1.480695, 0, 0, 0, 1, 1,
0.376966, -0.7824631, 1.31298, 0, 0, 0, 1, 1,
0.3776461, -0.644114, 1.956282, 0, 0, 0, 1, 1,
0.3794304, 1.307178, -1.143084, 0, 0, 0, 1, 1,
0.3818208, -1.72822, 5.146235, 0, 0, 0, 1, 1,
0.3902698, -0.2895771, 2.079491, 1, 1, 1, 1, 1,
0.3945013, 0.8384914, -0.3907057, 1, 1, 1, 1, 1,
0.3965716, 0.8890924, -0.3386413, 1, 1, 1, 1, 1,
0.4015788, 0.07213306, 0.9560058, 1, 1, 1, 1, 1,
0.4033566, -0.7462749, 2.112237, 1, 1, 1, 1, 1,
0.4046589, -0.8365479, 2.81178, 1, 1, 1, 1, 1,
0.4048392, 0.5085075, 0.5041324, 1, 1, 1, 1, 1,
0.4074406, 1.234846, -1.390676, 1, 1, 1, 1, 1,
0.4100976, 1.83672, -0.1853118, 1, 1, 1, 1, 1,
0.4162265, -0.6869045, 1.743116, 1, 1, 1, 1, 1,
0.4262277, 0.5774706, 0.6903225, 1, 1, 1, 1, 1,
0.4269673, -0.7448601, 2.271258, 1, 1, 1, 1, 1,
0.4282924, -0.598847, 1.663181, 1, 1, 1, 1, 1,
0.4309276, 0.4465935, -0.2773638, 1, 1, 1, 1, 1,
0.4326855, 1.324515, 0.6375185, 1, 1, 1, 1, 1,
0.4352586, -0.5657544, 1.343564, 0, 0, 1, 1, 1,
0.4382248, 1.353888, 1.328564, 1, 0, 0, 1, 1,
0.4390936, -0.6735753, 2.578175, 1, 0, 0, 1, 1,
0.4428005, -1.278817, 1.843408, 1, 0, 0, 1, 1,
0.4448815, -1.087969, 4.068541, 1, 0, 0, 1, 1,
0.4464382, -0.008423798, 1.234188, 1, 0, 0, 1, 1,
0.4545781, -1.545612, 1.508255, 0, 0, 0, 1, 1,
0.4570025, 0.6024735, 0.8765067, 0, 0, 0, 1, 1,
0.4584897, 0.4896778, 0.218129, 0, 0, 0, 1, 1,
0.4596889, -0.2270001, 1.863009, 0, 0, 0, 1, 1,
0.461273, -0.8536205, 2.898512, 0, 0, 0, 1, 1,
0.4651737, 1.723151, 0.9224914, 0, 0, 0, 1, 1,
0.468938, 0.3790915, 2.059797, 0, 0, 0, 1, 1,
0.4750523, -1.526138, 2.347587, 1, 1, 1, 1, 1,
0.4754929, -0.1331886, 4.400003, 1, 1, 1, 1, 1,
0.4780915, 1.182434, 1.077965, 1, 1, 1, 1, 1,
0.4805053, 0.7225645, 1.532994, 1, 1, 1, 1, 1,
0.4819051, -0.3828322, 2.956483, 1, 1, 1, 1, 1,
0.4832748, -0.0844349, 2.839701, 1, 1, 1, 1, 1,
0.4839197, -1.051892, 1.308219, 1, 1, 1, 1, 1,
0.4931179, 0.9880347, 0.8796358, 1, 1, 1, 1, 1,
0.4947911, 0.4627831, 1.950235, 1, 1, 1, 1, 1,
0.5000889, 2.193827, -0.2336478, 1, 1, 1, 1, 1,
0.5013183, 0.3857246, 2.171053, 1, 1, 1, 1, 1,
0.5030314, -0.6187295, 3.398602, 1, 1, 1, 1, 1,
0.5039381, 0.5370747, 2.063575, 1, 1, 1, 1, 1,
0.5099978, 0.1085777, 0.06558163, 1, 1, 1, 1, 1,
0.5168493, 0.5979844, 2.808575, 1, 1, 1, 1, 1,
0.5203139, -1.607856, 2.149977, 0, 0, 1, 1, 1,
0.5211691, -0.8117869, 2.842985, 1, 0, 0, 1, 1,
0.5231125, -1.051263, 3.282054, 1, 0, 0, 1, 1,
0.524442, 0.4464173, 1.808849, 1, 0, 0, 1, 1,
0.5252264, 0.7450452, 1.337614, 1, 0, 0, 1, 1,
0.5271543, -1.359563, 2.115669, 1, 0, 0, 1, 1,
0.5293262, -0.02647889, 1.519486, 0, 0, 0, 1, 1,
0.5310512, -0.104276, 1.68729, 0, 0, 0, 1, 1,
0.5413674, 0.5830666, 1.833325, 0, 0, 0, 1, 1,
0.5418993, -0.1813616, 2.568773, 0, 0, 0, 1, 1,
0.5440735, -0.2355895, 0.8896825, 0, 0, 0, 1, 1,
0.544991, -0.6126546, 4.708788, 0, 0, 0, 1, 1,
0.545875, -0.03821632, 2.677118, 0, 0, 0, 1, 1,
0.5472304, -0.01398433, 0.1960239, 1, 1, 1, 1, 1,
0.5513149, -0.4726392, 2.235785, 1, 1, 1, 1, 1,
0.5513719, -0.287, 3.091637, 1, 1, 1, 1, 1,
0.5541845, 0.6120425, -0.3811911, 1, 1, 1, 1, 1,
0.5574746, -1.630234, 1.977992, 1, 1, 1, 1, 1,
0.5579047, -0.4585928, 2.390328, 1, 1, 1, 1, 1,
0.5585049, 0.6105137, 2.100486, 1, 1, 1, 1, 1,
0.5624358, 0.4628854, 1.520388, 1, 1, 1, 1, 1,
0.5642977, -0.07150801, 1.990307, 1, 1, 1, 1, 1,
0.5689201, 1.925526, 0.9350146, 1, 1, 1, 1, 1,
0.5699802, 0.899009, 1.548104, 1, 1, 1, 1, 1,
0.5756527, -1.099112, 2.528946, 1, 1, 1, 1, 1,
0.5805697, -0.5201589, 2.536165, 1, 1, 1, 1, 1,
0.5828295, -0.43751, 2.176525, 1, 1, 1, 1, 1,
0.5842421, -0.5274366, 1.166827, 1, 1, 1, 1, 1,
0.5849761, 1.801387, -0.0239289, 0, 0, 1, 1, 1,
0.5879903, -1.48342, 1.545647, 1, 0, 0, 1, 1,
0.5954513, 0.06773281, 1.428924, 1, 0, 0, 1, 1,
0.6001976, 0.21205, 1.262256, 1, 0, 0, 1, 1,
0.6035839, 0.07295988, 2.077121, 1, 0, 0, 1, 1,
0.6039386, 1.52471, 0.1915231, 1, 0, 0, 1, 1,
0.6065528, -0.4258295, 3.183534, 0, 0, 0, 1, 1,
0.6068119, 1.849987, 0.2923259, 0, 0, 0, 1, 1,
0.6114692, 2.422943, -0.3601945, 0, 0, 0, 1, 1,
0.6123341, 1.708017, 0.09750387, 0, 0, 0, 1, 1,
0.6125661, 0.2092305, -1.033325, 0, 0, 0, 1, 1,
0.6176937, 1.262076, 0.4768105, 0, 0, 0, 1, 1,
0.6251431, 0.8306708, 0.6439556, 0, 0, 0, 1, 1,
0.6292367, 0.2185981, 1.644726, 1, 1, 1, 1, 1,
0.6292705, -0.6297469, 3.392419, 1, 1, 1, 1, 1,
0.6316032, 1.6154, 1.40802, 1, 1, 1, 1, 1,
0.6319224, -0.4072014, 3.156907, 1, 1, 1, 1, 1,
0.6321813, 0.9664147, 1.563398, 1, 1, 1, 1, 1,
0.6396949, 0.3274218, 2.812801, 1, 1, 1, 1, 1,
0.6484814, 1.434589, 2.186727, 1, 1, 1, 1, 1,
0.6493989, -0.3473044, 1.887272, 1, 1, 1, 1, 1,
0.65711, 0.6485341, -0.9006014, 1, 1, 1, 1, 1,
0.6637232, 0.6342534, 0.2343198, 1, 1, 1, 1, 1,
0.6641544, -1.471136, 2.149246, 1, 1, 1, 1, 1,
0.6687056, -0.616991, 0.5721329, 1, 1, 1, 1, 1,
0.6711968, -1.157321, 2.887732, 1, 1, 1, 1, 1,
0.6816246, 2.634243, -1.614421, 1, 1, 1, 1, 1,
0.68645, 0.04890382, 2.589988, 1, 1, 1, 1, 1,
0.6872755, 0.6930825, -0.02148313, 0, 0, 1, 1, 1,
0.6920939, 0.494218, 2.178488, 1, 0, 0, 1, 1,
0.693717, 2.736545, -0.4045581, 1, 0, 0, 1, 1,
0.7022012, -0.2269928, 1.555512, 1, 0, 0, 1, 1,
0.7050772, 0.8591897, -0.6699095, 1, 0, 0, 1, 1,
0.7169703, -0.080153, 1.063069, 1, 0, 0, 1, 1,
0.7185892, 0.8737847, 2.459532, 0, 0, 0, 1, 1,
0.7212223, 1.292692, 1.990577, 0, 0, 0, 1, 1,
0.7223714, -0.4007114, 0.05795987, 0, 0, 0, 1, 1,
0.7279918, -0.7488853, 3.353196, 0, 0, 0, 1, 1,
0.7301765, -1.68941, 3.927338, 0, 0, 0, 1, 1,
0.7317363, 0.9036406, 0.1427316, 0, 0, 0, 1, 1,
0.7341329, 0.5180525, -0.1433298, 0, 0, 0, 1, 1,
0.7431, 0.09948427, 1.192937, 1, 1, 1, 1, 1,
0.7445387, 1.665715, -0.9457278, 1, 1, 1, 1, 1,
0.7472365, 1.311625, 0.1572902, 1, 1, 1, 1, 1,
0.7477587, 0.9124798, 0.5054665, 1, 1, 1, 1, 1,
0.7489957, -0.316927, 2.762697, 1, 1, 1, 1, 1,
0.750598, -1.509763, 2.076369, 1, 1, 1, 1, 1,
0.7516217, 1.571009, 0.4183804, 1, 1, 1, 1, 1,
0.7561417, -0.6489665, 2.395677, 1, 1, 1, 1, 1,
0.7569215, -1.123694, 2.941051, 1, 1, 1, 1, 1,
0.7585674, 2.454855, 0.2179267, 1, 1, 1, 1, 1,
0.7598804, -0.8806696, 1.961195, 1, 1, 1, 1, 1,
0.7603584, -0.2680118, 2.358524, 1, 1, 1, 1, 1,
0.7620445, 0.2280626, 2.979876, 1, 1, 1, 1, 1,
0.7629025, 0.1137981, -0.1869723, 1, 1, 1, 1, 1,
0.7645712, 1.30868, 0.9013453, 1, 1, 1, 1, 1,
0.7653171, -1.45771, 1.649259, 0, 0, 1, 1, 1,
0.7753825, -0.07198471, 1.376481, 1, 0, 0, 1, 1,
0.7813534, 0.1243611, 0.7308096, 1, 0, 0, 1, 1,
0.7861106, 0.2236122, 2.233254, 1, 0, 0, 1, 1,
0.7884684, 1.2073, -1.778719, 1, 0, 0, 1, 1,
0.7930683, 0.494092, 0.2453922, 1, 0, 0, 1, 1,
0.7945142, 1.175908, 1.146819, 0, 0, 0, 1, 1,
0.7963941, -0.9644001, 1.449109, 0, 0, 0, 1, 1,
0.8000765, 0.6205872, 1.489346, 0, 0, 0, 1, 1,
0.8012726, 0.390172, 0.2479292, 0, 0, 0, 1, 1,
0.8052875, -0.05672495, 2.019422, 0, 0, 0, 1, 1,
0.8067927, 0.63034, 0.1896286, 0, 0, 0, 1, 1,
0.8089606, -0.5072908, 1.856251, 0, 0, 0, 1, 1,
0.8115419, 0.6946549, 1.737065, 1, 1, 1, 1, 1,
0.8122481, -0.7121109, 1.77161, 1, 1, 1, 1, 1,
0.814276, -0.03223157, 0.7941056, 1, 1, 1, 1, 1,
0.8149943, 0.1062998, 1.88969, 1, 1, 1, 1, 1,
0.8160067, 1.301509, 0.2427845, 1, 1, 1, 1, 1,
0.8222831, -1.450826, 3.009269, 1, 1, 1, 1, 1,
0.8224589, 1.25644, 1.410761, 1, 1, 1, 1, 1,
0.8239182, 0.3217146, 1.196033, 1, 1, 1, 1, 1,
0.8290263, 0.1028824, 0.6398129, 1, 1, 1, 1, 1,
0.8373512, 0.01931301, 2.329978, 1, 1, 1, 1, 1,
0.8395519, -0.07841599, 1.943905, 1, 1, 1, 1, 1,
0.8400785, -1.092944, 2.901035, 1, 1, 1, 1, 1,
0.8442161, 1.620159, -1.541887, 1, 1, 1, 1, 1,
0.845611, 1.008971, 0.4439854, 1, 1, 1, 1, 1,
0.8472652, -2.22532, 3.094705, 1, 1, 1, 1, 1,
0.8512863, 1.549707, 0.5492243, 0, 0, 1, 1, 1,
0.8527755, 1.290515, 0.5462337, 1, 0, 0, 1, 1,
0.8638771, -0.06590088, 0.4867696, 1, 0, 0, 1, 1,
0.8712785, 0.5853121, 0.5910128, 1, 0, 0, 1, 1,
0.8881284, -1.012161, 2.742011, 1, 0, 0, 1, 1,
0.8903903, 0.3060876, 0.7558227, 1, 0, 0, 1, 1,
0.8949382, -0.9798636, 2.98612, 0, 0, 0, 1, 1,
0.8982222, 0.1569867, 2.083854, 0, 0, 0, 1, 1,
0.9010958, -2.663978, 2.421819, 0, 0, 0, 1, 1,
0.902907, -0.8963957, 1.277057, 0, 0, 0, 1, 1,
0.9038734, -0.7166795, 3.443211, 0, 0, 0, 1, 1,
0.9047585, -0.3890056, 1.890821, 0, 0, 0, 1, 1,
0.9107378, -1.485316, 1.606389, 0, 0, 0, 1, 1,
0.9120201, 0.4351602, -0.5403697, 1, 1, 1, 1, 1,
0.9131866, -1.242222, 3.84868, 1, 1, 1, 1, 1,
0.9170017, 0.1327539, 0.9065726, 1, 1, 1, 1, 1,
0.9209277, 1.293475, 1.140357, 1, 1, 1, 1, 1,
0.92508, -0.8615664, 3.363151, 1, 1, 1, 1, 1,
0.92948, -2.300009, 2.56099, 1, 1, 1, 1, 1,
0.9362968, 1.11351, -0.08686627, 1, 1, 1, 1, 1,
0.939334, 0.1474956, 1.899573, 1, 1, 1, 1, 1,
0.9484331, 0.9994669, 0.9045169, 1, 1, 1, 1, 1,
0.9629802, -1.160061, 2.485394, 1, 1, 1, 1, 1,
0.9630126, -0.4779465, 2.877104, 1, 1, 1, 1, 1,
0.9636907, 0.3372891, 1.207572, 1, 1, 1, 1, 1,
0.9682598, -1.848199, 2.31986, 1, 1, 1, 1, 1,
0.9758421, 1.570836, 1.396343, 1, 1, 1, 1, 1,
0.97982, -0.02231515, 1.86075, 1, 1, 1, 1, 1,
0.9801649, 0.37764, 1.176581, 0, 0, 1, 1, 1,
0.9837022, -1.324125, 1.234544, 1, 0, 0, 1, 1,
0.9913046, 0.4939769, -0.1463366, 1, 0, 0, 1, 1,
0.9953148, -0.5674174, 2.268486, 1, 0, 0, 1, 1,
0.997519, -0.6465484, 2.664536, 1, 0, 0, 1, 1,
0.9975386, -0.3450294, 2.427178, 1, 0, 0, 1, 1,
0.9981126, 1.043406, 0.4973474, 0, 0, 0, 1, 1,
0.9995289, 1.198929, 0.2531599, 0, 0, 0, 1, 1,
1.00002, -0.1393323, 1.657844, 0, 0, 0, 1, 1,
1.003491, 0.5096051, 1.181333, 0, 0, 0, 1, 1,
1.004155, 0.7778564, 0.7536895, 0, 0, 0, 1, 1,
1.012944, 0.8899062, -0.2588508, 0, 0, 0, 1, 1,
1.014889, 2.213823, 1.029144, 0, 0, 0, 1, 1,
1.023879, 0.08967941, 0.5359498, 1, 1, 1, 1, 1,
1.026868, 0.3815744, 1.835463, 1, 1, 1, 1, 1,
1.046567, 0.352816, 1.735504, 1, 1, 1, 1, 1,
1.049335, 1.57343, -0.233327, 1, 1, 1, 1, 1,
1.052028, 0.01998962, 0.5603835, 1, 1, 1, 1, 1,
1.053426, -1.24936, 0.7304819, 1, 1, 1, 1, 1,
1.053816, 0.3408823, 0.6711367, 1, 1, 1, 1, 1,
1.055735, -0.9422269, 2.10182, 1, 1, 1, 1, 1,
1.056393, 0.4085703, 1.257036, 1, 1, 1, 1, 1,
1.057656, 0.118247, 2.455595, 1, 1, 1, 1, 1,
1.071255, -1.38121, 2.560685, 1, 1, 1, 1, 1,
1.075672, 0.2114699, 3.169204, 1, 1, 1, 1, 1,
1.075769, 1.280501, 0.08839849, 1, 1, 1, 1, 1,
1.086085, -0.226447, 3.25065, 1, 1, 1, 1, 1,
1.087395, 0.1472399, 1.553005, 1, 1, 1, 1, 1,
1.089232, -2.122283, 3.157804, 0, 0, 1, 1, 1,
1.089283, -0.400835, 2.087655, 1, 0, 0, 1, 1,
1.092132, -1.54814, 2.420186, 1, 0, 0, 1, 1,
1.092981, -0.3081499, 0.4900287, 1, 0, 0, 1, 1,
1.105354, 1.903918, 1.21575, 1, 0, 0, 1, 1,
1.109088, 0.9607028, 0.317398, 1, 0, 0, 1, 1,
1.111554, 1.32503, -0.7459694, 0, 0, 0, 1, 1,
1.128431, 0.05618454, 1.167326, 0, 0, 0, 1, 1,
1.131097, 0.8827171, 0.2025621, 0, 0, 0, 1, 1,
1.140873, 0.5403755, 0.6706797, 0, 0, 0, 1, 1,
1.145829, -2.095364, 3.750948, 0, 0, 0, 1, 1,
1.152876, 0.01986383, 1.182353, 0, 0, 0, 1, 1,
1.165765, 0.1825273, 2.293467, 0, 0, 0, 1, 1,
1.16769, 0.2601808, 0.9317337, 1, 1, 1, 1, 1,
1.168499, 0.8064955, 0.3681642, 1, 1, 1, 1, 1,
1.173678, -0.7271177, 2.534265, 1, 1, 1, 1, 1,
1.178285, 0.3135305, 0.573428, 1, 1, 1, 1, 1,
1.178913, 1.188374, 0.8399204, 1, 1, 1, 1, 1,
1.201307, -0.595053, 1.61009, 1, 1, 1, 1, 1,
1.202709, 0.4485851, 1.409023, 1, 1, 1, 1, 1,
1.21716, -0.06817944, 1.990663, 1, 1, 1, 1, 1,
1.221535, 1.124678, 2.055134, 1, 1, 1, 1, 1,
1.224122, -0.5729994, 0.3694943, 1, 1, 1, 1, 1,
1.233037, 0.9246897, 1.302929, 1, 1, 1, 1, 1,
1.240654, 0.177736, 1.527179, 1, 1, 1, 1, 1,
1.255354, -0.6649549, -0.08865763, 1, 1, 1, 1, 1,
1.259467, 0.9066606, 2.439482, 1, 1, 1, 1, 1,
1.266587, 0.2546669, 1.740442, 1, 1, 1, 1, 1,
1.269164, -0.756032, 1.004027, 0, 0, 1, 1, 1,
1.270419, -0.9478605, 0.4694593, 1, 0, 0, 1, 1,
1.270581, 0.08195136, -0.1247998, 1, 0, 0, 1, 1,
1.279971, 0.8573775, 0.7199498, 1, 0, 0, 1, 1,
1.282433, -1.333995, 1.865092, 1, 0, 0, 1, 1,
1.299308, 0.3279506, 1.38675, 1, 0, 0, 1, 1,
1.301589, 0.8882955, 0.4012565, 0, 0, 0, 1, 1,
1.303169, -1.647602, 1.529013, 0, 0, 0, 1, 1,
1.305292, -1.599185, 1.491366, 0, 0, 0, 1, 1,
1.306394, -1.546549, 2.293985, 0, 0, 0, 1, 1,
1.311333, -0.1777931, 3.604702, 0, 0, 0, 1, 1,
1.313301, -1.068525, 1.999864, 0, 0, 0, 1, 1,
1.317908, 0.3056632, 2.209617, 0, 0, 0, 1, 1,
1.318059, -0.3123609, -0.3576827, 1, 1, 1, 1, 1,
1.32356, 0.4349547, 1.421081, 1, 1, 1, 1, 1,
1.324909, 0.8383737, 1.838667, 1, 1, 1, 1, 1,
1.324933, -0.2044683, 0.334235, 1, 1, 1, 1, 1,
1.32873, -1.081791, 3.44412, 1, 1, 1, 1, 1,
1.331768, -0.1640714, 2.422077, 1, 1, 1, 1, 1,
1.333984, -1.06319, 1.909526, 1, 1, 1, 1, 1,
1.335422, 1.16504, 1.816701, 1, 1, 1, 1, 1,
1.339637, -0.3192542, 2.473557, 1, 1, 1, 1, 1,
1.353294, -0.9127825, 0.8750823, 1, 1, 1, 1, 1,
1.354061, -1.190099, 3.075098, 1, 1, 1, 1, 1,
1.365506, -0.9245378, 2.814314, 1, 1, 1, 1, 1,
1.365554, 0.364969, 1.942636, 1, 1, 1, 1, 1,
1.37677, -0.8424255, 1.576716, 1, 1, 1, 1, 1,
1.380205, -1.038717, 1.806759, 1, 1, 1, 1, 1,
1.397723, 0.07214846, 0.6699637, 0, 0, 1, 1, 1,
1.399949, -1.492814, 2.530612, 1, 0, 0, 1, 1,
1.424016, -0.915697, 2.138286, 1, 0, 0, 1, 1,
1.427358, -0.6899049, 1.869396, 1, 0, 0, 1, 1,
1.428412, -0.8394163, 2.40201, 1, 0, 0, 1, 1,
1.433163, 1.083987, 0.8729855, 1, 0, 0, 1, 1,
1.440299, -0.05501624, 0.5843319, 0, 0, 0, 1, 1,
1.447024, 1.424713, 0.7762844, 0, 0, 0, 1, 1,
1.449183, 0.765202, 1.299422, 0, 0, 0, 1, 1,
1.464435, -0.3352724, 1.960707, 0, 0, 0, 1, 1,
1.48102, -1.807216, 4.041482, 0, 0, 0, 1, 1,
1.500438, -0.1509536, 2.489558, 0, 0, 0, 1, 1,
1.502619, 0.09806009, 1.518673, 0, 0, 0, 1, 1,
1.509209, -1.346546, 2.115261, 1, 1, 1, 1, 1,
1.509622, -0.5525849, 0.7184309, 1, 1, 1, 1, 1,
1.522512, 0.9799914, 2.098575, 1, 1, 1, 1, 1,
1.533288, 0.8071938, 1.914496, 1, 1, 1, 1, 1,
1.543023, 0.43915, 0.1318117, 1, 1, 1, 1, 1,
1.54311, -1.057466, 2.06708, 1, 1, 1, 1, 1,
1.546704, 0.9592953, 1.81883, 1, 1, 1, 1, 1,
1.549017, -1.000711, 2.34005, 1, 1, 1, 1, 1,
1.565487, 1.961355, 1.49283, 1, 1, 1, 1, 1,
1.585917, -0.2925265, 0.9503455, 1, 1, 1, 1, 1,
1.607016, 1.52728, 0.7137312, 1, 1, 1, 1, 1,
1.611187, 1.532132, -0.1249591, 1, 1, 1, 1, 1,
1.623835, 1.729746, 1.394909, 1, 1, 1, 1, 1,
1.628138, 0.8282985, 1.850752, 1, 1, 1, 1, 1,
1.628878, 1.794694, 2.46399, 1, 1, 1, 1, 1,
1.62945, 0.1045278, 1.586951, 0, 0, 1, 1, 1,
1.637599, -0.2794476, 1.676908, 1, 0, 0, 1, 1,
1.642669, 1.346484, -0.07560106, 1, 0, 0, 1, 1,
1.643821, -0.07757206, 2.532668, 1, 0, 0, 1, 1,
1.648099, 1.36579, -1.65028, 1, 0, 0, 1, 1,
1.648275, -0.5666364, 2.616514, 1, 0, 0, 1, 1,
1.664986, -0.7980786, 1.568497, 0, 0, 0, 1, 1,
1.683173, -0.7016059, 3.12995, 0, 0, 0, 1, 1,
1.683733, -1.670674, 2.226276, 0, 0, 0, 1, 1,
1.684662, 0.3136313, 1.245136, 0, 0, 0, 1, 1,
1.690528, -1.377133, 1.382788, 0, 0, 0, 1, 1,
1.698503, 0.2840685, 1.380312, 0, 0, 0, 1, 1,
1.70822, -0.3416229, 1.040814, 0, 0, 0, 1, 1,
1.72126, -1.995937, 1.901045, 1, 1, 1, 1, 1,
1.75471, 0.533245, 1.484415, 1, 1, 1, 1, 1,
1.756091, -0.7130236, 2.570147, 1, 1, 1, 1, 1,
1.760111, 0.123495, 1.11605, 1, 1, 1, 1, 1,
1.778071, 0.2196735, 2.966752, 1, 1, 1, 1, 1,
1.779333, -0.3434224, 2.165549, 1, 1, 1, 1, 1,
1.81185, 0.4376569, 2.512854, 1, 1, 1, 1, 1,
1.812061, 0.1118841, 0.3879078, 1, 1, 1, 1, 1,
1.832866, 0.03199622, 0.6910941, 1, 1, 1, 1, 1,
1.83478, -0.07258647, 1.142994, 1, 1, 1, 1, 1,
1.843922, 0.3272359, 1.459793, 1, 1, 1, 1, 1,
1.866841, -0.1002266, 2.260834, 1, 1, 1, 1, 1,
1.868191, 1.9951, 0.7438868, 1, 1, 1, 1, 1,
1.903169, -1.161459, 1.951938, 1, 1, 1, 1, 1,
1.930441, 0.4326137, 1.860884, 1, 1, 1, 1, 1,
1.981825, -1.822193, 1.657331, 0, 0, 1, 1, 1,
2.024655, 0.3299613, 1.91005, 1, 0, 0, 1, 1,
2.051149, 1.107568, 0.8007058, 1, 0, 0, 1, 1,
2.096324, -0.8779027, -0.8851377, 1, 0, 0, 1, 1,
2.104109, 1.279815, 0.9386916, 1, 0, 0, 1, 1,
2.122372, -0.09397636, 0.8006826, 1, 0, 0, 1, 1,
2.123393, 0.5814061, 3.522469, 0, 0, 0, 1, 1,
2.162971, -1.501007, 2.565363, 0, 0, 0, 1, 1,
2.165923, 0.7656612, 1.429969, 0, 0, 0, 1, 1,
2.243166, 0.4107614, 1.910394, 0, 0, 0, 1, 1,
2.311571, -1.471133, 1.302839, 0, 0, 0, 1, 1,
2.316571, -0.5628543, 1.017271, 0, 0, 0, 1, 1,
2.348352, 0.7089393, 1.448158, 0, 0, 0, 1, 1,
2.383888, 1.11702, 2.187446, 1, 1, 1, 1, 1,
2.406671, -1.048952, 2.386573, 1, 1, 1, 1, 1,
2.488217, 1.475607, 1.886738, 1, 1, 1, 1, 1,
2.580172, 0.1037835, 2.000083, 1, 1, 1, 1, 1,
2.793685, 1.203511, 0.5115713, 1, 1, 1, 1, 1,
2.912508, 0.890734, 2.325761, 1, 1, 1, 1, 1,
3.653293, 1.810203, -0.2532629, 1, 1, 1, 1, 1
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
var radius = 9.458654;
var distance = 33.22312;
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
mvMatrix.translate( -0.1138489, 0.1519674, -0.1918106 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22312);
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
