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
-3.005996, 0.03003658, -1.796038, 1, 0, 0, 1,
-2.720208, -1.290633, -1.229816, 1, 0.007843138, 0, 1,
-2.716753, 0.3444586, -0.8771378, 1, 0.01176471, 0, 1,
-2.706135, 1.244641, -0.632802, 1, 0.01960784, 0, 1,
-2.692746, -0.1655728, -2.008509, 1, 0.02352941, 0, 1,
-2.625921, -0.2493162, -0.4419402, 1, 0.03137255, 0, 1,
-2.491388, 0.1018485, -1.563486, 1, 0.03529412, 0, 1,
-2.42656, 0.3584055, -0.4750677, 1, 0.04313726, 0, 1,
-2.2758, -0.04365109, -1.55899, 1, 0.04705882, 0, 1,
-2.224128, -0.7492498, -0.3630414, 1, 0.05490196, 0, 1,
-2.217387, -1.949319, -1.547485, 1, 0.05882353, 0, 1,
-2.206062, -1.310736, -3.498539, 1, 0.06666667, 0, 1,
-2.195759, 0.991416, -1.210476, 1, 0.07058824, 0, 1,
-2.129971, 0.1870543, -3.058685, 1, 0.07843138, 0, 1,
-2.122508, 0.01503055, -0.9652312, 1, 0.08235294, 0, 1,
-2.117178, -1.326097, -0.1320314, 1, 0.09019608, 0, 1,
-2.10681, -0.2659539, -2.637924, 1, 0.09411765, 0, 1,
-2.098696, -0.6892431, -1.32118, 1, 0.1019608, 0, 1,
-2.093648, -1.387922, -3.238664, 1, 0.1098039, 0, 1,
-2.046281, 0.1679513, -0.04001723, 1, 0.1137255, 0, 1,
-2.028371, 0.3306081, -1.238538, 1, 0.1215686, 0, 1,
-2.01895, -0.8741363, -0.6559474, 1, 0.1254902, 0, 1,
-1.998585, 1.245785, -0.2896609, 1, 0.1333333, 0, 1,
-1.994869, -0.6077908, -2.300333, 1, 0.1372549, 0, 1,
-1.962615, 0.1594384, -2.830495, 1, 0.145098, 0, 1,
-1.959025, 1.364007, 0.1098084, 1, 0.1490196, 0, 1,
-1.934001, -0.1766065, -1.788396, 1, 0.1568628, 0, 1,
-1.892178, -1.073953, -3.817383, 1, 0.1607843, 0, 1,
-1.877636, 0.7940644, -3.801867, 1, 0.1686275, 0, 1,
-1.872793, 1.88917, -1.348509, 1, 0.172549, 0, 1,
-1.87246, -0.5641137, -2.676465, 1, 0.1803922, 0, 1,
-1.868485, -0.8665869, -0.2479344, 1, 0.1843137, 0, 1,
-1.843287, -0.4686232, -1.209201, 1, 0.1921569, 0, 1,
-1.830186, -0.8979064, -0.5246555, 1, 0.1960784, 0, 1,
-1.814804, 1.175167, -1.294773, 1, 0.2039216, 0, 1,
-1.813143, 0.4221976, -1.546176, 1, 0.2117647, 0, 1,
-1.809053, 0.1752833, -4.278536, 1, 0.2156863, 0, 1,
-1.800617, -0.2032365, -2.397712, 1, 0.2235294, 0, 1,
-1.799146, -0.2961354, -0.04064686, 1, 0.227451, 0, 1,
-1.7564, -0.1229649, -1.263211, 1, 0.2352941, 0, 1,
-1.732392, 0.6204938, -1.541811, 1, 0.2392157, 0, 1,
-1.727133, -0.1536311, -3.291762, 1, 0.2470588, 0, 1,
-1.726966, 0.1199488, -1.526438, 1, 0.2509804, 0, 1,
-1.706854, 0.4223329, -1.408261, 1, 0.2588235, 0, 1,
-1.691517, -2.652079, -1.175864, 1, 0.2627451, 0, 1,
-1.685985, 1.147685, -0.680223, 1, 0.2705882, 0, 1,
-1.685928, 0.1686718, -1.039625, 1, 0.2745098, 0, 1,
-1.677101, 0.9208257, -0.8003809, 1, 0.282353, 0, 1,
-1.657272, 0.6523115, -0.9715592, 1, 0.2862745, 0, 1,
-1.652111, 0.1655606, -0.6870042, 1, 0.2941177, 0, 1,
-1.644848, 0.2870484, -2.487165, 1, 0.3019608, 0, 1,
-1.644589, 0.7607426, 0.3431297, 1, 0.3058824, 0, 1,
-1.618247, 0.7920051, -1.598794, 1, 0.3137255, 0, 1,
-1.61449, -0.4105431, -0.979035, 1, 0.3176471, 0, 1,
-1.607532, -1.186387, -3.31753, 1, 0.3254902, 0, 1,
-1.602968, 1.100669, -0.8261971, 1, 0.3294118, 0, 1,
-1.600713, 0.6720457, -0.7744697, 1, 0.3372549, 0, 1,
-1.596085, -0.2286744, -0.7074013, 1, 0.3411765, 0, 1,
-1.584276, -2.840492, -3.540539, 1, 0.3490196, 0, 1,
-1.583814, 0.1740834, -1.497093, 1, 0.3529412, 0, 1,
-1.575385, 1.039791, 0.6490605, 1, 0.3607843, 0, 1,
-1.537152, -0.3901579, -1.081009, 1, 0.3647059, 0, 1,
-1.515361, -0.1041221, -1.369987, 1, 0.372549, 0, 1,
-1.497396, -0.8457067, -3.17471, 1, 0.3764706, 0, 1,
-1.488937, -0.9306283, -4.323288, 1, 0.3843137, 0, 1,
-1.479239, 1.001911, -1.100054, 1, 0.3882353, 0, 1,
-1.47486, 0.4371837, -0.8760905, 1, 0.3960784, 0, 1,
-1.47329, 0.2290426, -2.027238, 1, 0.4039216, 0, 1,
-1.471135, 0.1210337, -2.874365, 1, 0.4078431, 0, 1,
-1.444428, 0.5678711, -2.168369, 1, 0.4156863, 0, 1,
-1.443024, 1.791538, -0.1958276, 1, 0.4196078, 0, 1,
-1.442628, -0.1680918, -1.078098, 1, 0.427451, 0, 1,
-1.436903, 0.119482, -1.002282, 1, 0.4313726, 0, 1,
-1.426005, -0.842836, -2.987181, 1, 0.4392157, 0, 1,
-1.419267, -0.5055549, -2.478856, 1, 0.4431373, 0, 1,
-1.412817, 0.7245262, 0.02878986, 1, 0.4509804, 0, 1,
-1.402848, -0.7983497, -0.844115, 1, 0.454902, 0, 1,
-1.386642, -0.3577091, 0.4053082, 1, 0.4627451, 0, 1,
-1.385283, 1.083773, -0.8596185, 1, 0.4666667, 0, 1,
-1.367421, 1.43898, -1.889684, 1, 0.4745098, 0, 1,
-1.343035, 0.9316814, 0.2918773, 1, 0.4784314, 0, 1,
-1.342915, -0.1946435, -0.7236042, 1, 0.4862745, 0, 1,
-1.340935, 0.828248, -2.687162, 1, 0.4901961, 0, 1,
-1.34032, 0.9982846, -1.271215, 1, 0.4980392, 0, 1,
-1.327047, -1.271701, -3.361604, 1, 0.5058824, 0, 1,
-1.323341, -1.047303, -1.951505, 1, 0.509804, 0, 1,
-1.315255, -0.05469244, -0.881787, 1, 0.5176471, 0, 1,
-1.304154, 1.108567, -1.643433, 1, 0.5215687, 0, 1,
-1.30359, 0.7094344, -0.162577, 1, 0.5294118, 0, 1,
-1.302373, -0.0903722, -1.961985, 1, 0.5333334, 0, 1,
-1.298627, 0.4365093, -2.004546, 1, 0.5411765, 0, 1,
-1.280892, -0.1137379, -0.4004594, 1, 0.5450981, 0, 1,
-1.27416, 0.1180874, -0.7262914, 1, 0.5529412, 0, 1,
-1.267011, -0.979035, -1.632068, 1, 0.5568628, 0, 1,
-1.262562, 1.242351, -1.650034, 1, 0.5647059, 0, 1,
-1.261119, -0.4929773, -2.310067, 1, 0.5686275, 0, 1,
-1.252021, 0.7723952, -0.2081336, 1, 0.5764706, 0, 1,
-1.249811, -1.130888, -1.536065, 1, 0.5803922, 0, 1,
-1.246262, -0.03733469, -1.364179, 1, 0.5882353, 0, 1,
-1.24449, 1.243566, -2.335513, 1, 0.5921569, 0, 1,
-1.240655, -1.452536, -2.563145, 1, 0.6, 0, 1,
-1.233936, 0.4462917, -1.262377, 1, 0.6078432, 0, 1,
-1.232417, -1.31808, -2.669139, 1, 0.6117647, 0, 1,
-1.213773, -0.06447543, -2.542559, 1, 0.6196079, 0, 1,
-1.210436, -0.4309885, -1.060562, 1, 0.6235294, 0, 1,
-1.200693, 0.1267508, -1.066658, 1, 0.6313726, 0, 1,
-1.198241, 0.7006654, -1.262551, 1, 0.6352941, 0, 1,
-1.192895, 0.2607443, 0.7601452, 1, 0.6431373, 0, 1,
-1.192246, 0.5384678, -0.9053771, 1, 0.6470588, 0, 1,
-1.177962, -1.48628, -2.317106, 1, 0.654902, 0, 1,
-1.175107, -0.5105267, -1.956471, 1, 0.6588235, 0, 1,
-1.1704, 0.1404921, -0.1594065, 1, 0.6666667, 0, 1,
-1.168962, 1.565307, -1.046162, 1, 0.6705883, 0, 1,
-1.16532, 0.1270329, -2.739538, 1, 0.6784314, 0, 1,
-1.16489, 1.58304, -1.381555, 1, 0.682353, 0, 1,
-1.161593, -2.8051, -3.087651, 1, 0.6901961, 0, 1,
-1.159039, -1.454461, -2.917528, 1, 0.6941177, 0, 1,
-1.157133, 1.402772, 0.4885094, 1, 0.7019608, 0, 1,
-1.154243, -0.1783732, 0.01552317, 1, 0.7098039, 0, 1,
-1.148996, 0.9349394, -0.2311051, 1, 0.7137255, 0, 1,
-1.145128, 1.396367, -1.768085, 1, 0.7215686, 0, 1,
-1.143889, -0.7403122, -2.152127, 1, 0.7254902, 0, 1,
-1.138311, -1.107226, -2.354877, 1, 0.7333333, 0, 1,
-1.133398, -0.4813683, -1.72712, 1, 0.7372549, 0, 1,
-1.127097, -0.7333056, -2.362223, 1, 0.7450981, 0, 1,
-1.126725, -1.424037, -0.9113997, 1, 0.7490196, 0, 1,
-1.126501, -1.381241, -1.924628, 1, 0.7568628, 0, 1,
-1.118892, -0.9848637, -1.879983, 1, 0.7607843, 0, 1,
-1.095113, 0.02307453, -2.278682, 1, 0.7686275, 0, 1,
-1.091545, -1.162048, -2.282221, 1, 0.772549, 0, 1,
-1.084746, -0.9519656, -2.292052, 1, 0.7803922, 0, 1,
-1.077245, 0.7928551, -0.3110749, 1, 0.7843137, 0, 1,
-1.076917, 0.7659181, 1.267404, 1, 0.7921569, 0, 1,
-1.07595, -0.05433824, -1.805757, 1, 0.7960784, 0, 1,
-1.072141, -0.2398335, -1.817427, 1, 0.8039216, 0, 1,
-1.071694, -1.591867, -1.528866, 1, 0.8117647, 0, 1,
-1.066418, -1.598045, -1.514941, 1, 0.8156863, 0, 1,
-1.064545, -0.2066903, -1.505338, 1, 0.8235294, 0, 1,
-1.063568, 1.058689, -1.902401, 1, 0.827451, 0, 1,
-1.062487, -1.092736, -3.936707, 1, 0.8352941, 0, 1,
-1.056671, 1.58436, -0.4232369, 1, 0.8392157, 0, 1,
-1.047315, -2.364279, -0.892414, 1, 0.8470588, 0, 1,
-1.035522, 1.683744, -1.157727, 1, 0.8509804, 0, 1,
-1.031358, -1.049603, -1.834614, 1, 0.8588235, 0, 1,
-1.028051, 0.3465394, -1.179853, 1, 0.8627451, 0, 1,
-1.023339, 0.5076814, -0.8345253, 1, 0.8705882, 0, 1,
-1.02247, 0.4223763, -2.04515, 1, 0.8745098, 0, 1,
-1.015079, 1.663043, -0.6694494, 1, 0.8823529, 0, 1,
-1.011467, 0.7977084, -0.1667496, 1, 0.8862745, 0, 1,
-1.005176, -1.176967, -1.809779, 1, 0.8941177, 0, 1,
-1.005109, -0.7761059, -3.046899, 1, 0.8980392, 0, 1,
-0.9997921, -0.8943192, -1.653139, 1, 0.9058824, 0, 1,
-0.9984982, -0.8780909, -1.697197, 1, 0.9137255, 0, 1,
-0.9972855, 1.295167, 1.113114, 1, 0.9176471, 0, 1,
-0.9841086, 2.253902, 0.717764, 1, 0.9254902, 0, 1,
-0.9827424, -0.4723839, -3.172118, 1, 0.9294118, 0, 1,
-0.9824028, 0.3126811, 0.004019021, 1, 0.9372549, 0, 1,
-0.9807314, 0.6643298, 1.551806, 1, 0.9411765, 0, 1,
-0.9807031, 0.1877449, -3.048769, 1, 0.9490196, 0, 1,
-0.9780852, 0.7075525, -2.095731, 1, 0.9529412, 0, 1,
-0.9668012, -0.9896053, -3.035724, 1, 0.9607843, 0, 1,
-0.9611278, 0.07942013, -2.911846, 1, 0.9647059, 0, 1,
-0.9571025, -0.6367543, -1.442754, 1, 0.972549, 0, 1,
-0.952417, 0.1144973, -2.429233, 1, 0.9764706, 0, 1,
-0.9521579, 0.2230163, -1.433478, 1, 0.9843137, 0, 1,
-0.9503393, 2.131175, -0.4325254, 1, 0.9882353, 0, 1,
-0.9493169, 0.6794807, -1.130648, 1, 0.9960784, 0, 1,
-0.9429373, -0.6089747, -2.690631, 0.9960784, 1, 0, 1,
-0.9355776, -0.1568162, -1.888907, 0.9921569, 1, 0, 1,
-0.9316566, -0.9862354, -0.6424358, 0.9843137, 1, 0, 1,
-0.9296088, 0.8494318, -0.7042176, 0.9803922, 1, 0, 1,
-0.9281664, 0.8969464, -1.195369, 0.972549, 1, 0, 1,
-0.9254203, 0.3846772, -0.8882177, 0.9686275, 1, 0, 1,
-0.9248258, 0.8299592, 0.5434574, 0.9607843, 1, 0, 1,
-0.9218074, -0.5708356, -0.6588147, 0.9568627, 1, 0, 1,
-0.9195921, -0.8330325, -3.699377, 0.9490196, 1, 0, 1,
-0.9173011, 0.2105133, -0.7977502, 0.945098, 1, 0, 1,
-0.9156199, -0.5728968, -2.544841, 0.9372549, 1, 0, 1,
-0.9148744, -0.3567046, -0.5765772, 0.9333333, 1, 0, 1,
-0.9119469, -0.3460544, -2.395838, 0.9254902, 1, 0, 1,
-0.9093802, 0.6427804, -0.6853329, 0.9215686, 1, 0, 1,
-0.9079191, 0.543538, -0.8014954, 0.9137255, 1, 0, 1,
-0.9063099, 0.1789749, -0.6991775, 0.9098039, 1, 0, 1,
-0.9023395, 1.20121, -0.4385395, 0.9019608, 1, 0, 1,
-0.8959709, 2.098849, 0.8845928, 0.8941177, 1, 0, 1,
-0.894675, 0.3370869, -2.184687, 0.8901961, 1, 0, 1,
-0.8935077, -1.620309, -3.483491, 0.8823529, 1, 0, 1,
-0.8880947, -0.9729797, -2.865127, 0.8784314, 1, 0, 1,
-0.887401, -0.3278997, -2.954194, 0.8705882, 1, 0, 1,
-0.8871233, 0.02355576, -1.5406, 0.8666667, 1, 0, 1,
-0.8804426, -0.03206408, -1.017129, 0.8588235, 1, 0, 1,
-0.8800839, 0.8432525, -1.141716, 0.854902, 1, 0, 1,
-0.878631, 0.5606169, -0.2812143, 0.8470588, 1, 0, 1,
-0.8758001, -1.459286, -2.455003, 0.8431373, 1, 0, 1,
-0.8745257, 0.9895769, -0.0842934, 0.8352941, 1, 0, 1,
-0.8713161, -1.724506, -2.555621, 0.8313726, 1, 0, 1,
-0.8705753, -0.2462483, -3.822228, 0.8235294, 1, 0, 1,
-0.8687227, -0.4058964, -2.854488, 0.8196079, 1, 0, 1,
-0.8668756, 0.9765286, -1.834675, 0.8117647, 1, 0, 1,
-0.8641135, -0.349897, -1.485668, 0.8078431, 1, 0, 1,
-0.8640171, 0.6748982, -0.8452204, 0.8, 1, 0, 1,
-0.8620924, 1.399801, -1.544766, 0.7921569, 1, 0, 1,
-0.8612351, 0.3573735, -2.033141, 0.7882353, 1, 0, 1,
-0.8604767, 1.946577, -0.3170543, 0.7803922, 1, 0, 1,
-0.8559713, 0.0776171, -1.386696, 0.7764706, 1, 0, 1,
-0.8546512, 2.132744, 0.3675773, 0.7686275, 1, 0, 1,
-0.8535264, -0.2150934, -2.574442, 0.7647059, 1, 0, 1,
-0.8499072, 1.122245, -1.169694, 0.7568628, 1, 0, 1,
-0.8470886, -0.04465618, -1.304584, 0.7529412, 1, 0, 1,
-0.8438329, 1.182285, -1.405432, 0.7450981, 1, 0, 1,
-0.8396221, -0.8900749, -4.426658, 0.7411765, 1, 0, 1,
-0.836522, 0.1377783, -2.020777, 0.7333333, 1, 0, 1,
-0.8364271, 0.4534959, 1.177701, 0.7294118, 1, 0, 1,
-0.8357415, 0.9288496, -2.167862, 0.7215686, 1, 0, 1,
-0.831467, -1.226468, -3.848825, 0.7176471, 1, 0, 1,
-0.827004, -0.3306322, -3.113888, 0.7098039, 1, 0, 1,
-0.8198991, -0.3816306, -2.516041, 0.7058824, 1, 0, 1,
-0.8126224, 0.1956501, -2.427099, 0.6980392, 1, 0, 1,
-0.8094735, 0.06142796, -0.9591566, 0.6901961, 1, 0, 1,
-0.8054818, -0.4852147, -1.107165, 0.6862745, 1, 0, 1,
-0.8049434, 1.472212, 2.084061, 0.6784314, 1, 0, 1,
-0.8036538, -2.211064, -2.623067, 0.6745098, 1, 0, 1,
-0.8029739, -0.6497564, -2.655447, 0.6666667, 1, 0, 1,
-0.7996533, 0.9395968, -1.724038, 0.6627451, 1, 0, 1,
-0.7957289, -0.6313168, -1.318186, 0.654902, 1, 0, 1,
-0.7943341, -0.5882629, -3.303389, 0.6509804, 1, 0, 1,
-0.793466, 1.389481, -0.4732059, 0.6431373, 1, 0, 1,
-0.7922445, -1.194872, -1.257051, 0.6392157, 1, 0, 1,
-0.78757, -1.153225, -2.274453, 0.6313726, 1, 0, 1,
-0.7808706, 0.07185186, -2.314638, 0.627451, 1, 0, 1,
-0.7709888, -1.730338, -2.029211, 0.6196079, 1, 0, 1,
-0.7658603, -0.257621, -1.770232, 0.6156863, 1, 0, 1,
-0.7463555, 1.27702, -0.4020734, 0.6078432, 1, 0, 1,
-0.7444485, 0.2973216, -2.164563, 0.6039216, 1, 0, 1,
-0.743257, 1.66243, -1.672296, 0.5960785, 1, 0, 1,
-0.7389797, 0.8770487, 0.02725155, 0.5882353, 1, 0, 1,
-0.7337276, -1.144766, -3.89274, 0.5843138, 1, 0, 1,
-0.7249134, -0.1954074, -2.538107, 0.5764706, 1, 0, 1,
-0.7181256, 1.374234, -0.439824, 0.572549, 1, 0, 1,
-0.7147331, -0.3807743, -2.062784, 0.5647059, 1, 0, 1,
-0.7111097, -0.6203805, -1.255349, 0.5607843, 1, 0, 1,
-0.7043654, 1.358782, -0.02781344, 0.5529412, 1, 0, 1,
-0.6982104, 0.775739, 0.3890349, 0.5490196, 1, 0, 1,
-0.6889358, -1.909928, -1.282887, 0.5411765, 1, 0, 1,
-0.6878589, 0.5362085, 0.8673155, 0.5372549, 1, 0, 1,
-0.6877832, 0.7046449, -0.8686473, 0.5294118, 1, 0, 1,
-0.6861917, -0.371694, 0.8329983, 0.5254902, 1, 0, 1,
-0.683157, 1.209187, -1.258217, 0.5176471, 1, 0, 1,
-0.6830735, -1.312545, -2.308147, 0.5137255, 1, 0, 1,
-0.681648, 0.9497577, 0.4634059, 0.5058824, 1, 0, 1,
-0.6772153, -1.305107, -2.099781, 0.5019608, 1, 0, 1,
-0.6668887, -1.263001, -3.01419, 0.4941176, 1, 0, 1,
-0.6634682, 0.5345626, -0.336161, 0.4862745, 1, 0, 1,
-0.6597448, 0.2126304, -0.5112723, 0.4823529, 1, 0, 1,
-0.6575304, -0.07246546, -0.353757, 0.4745098, 1, 0, 1,
-0.6542906, 0.9599687, 0.09311745, 0.4705882, 1, 0, 1,
-0.6377046, 0.2659769, -2.189102, 0.4627451, 1, 0, 1,
-0.6376574, -1.235723, -2.66784, 0.4588235, 1, 0, 1,
-0.6373819, 0.5105289, -1.313223, 0.4509804, 1, 0, 1,
-0.6330683, -1.397016, -3.199256, 0.4470588, 1, 0, 1,
-0.6315293, -1.445935, -2.786402, 0.4392157, 1, 0, 1,
-0.6295562, 0.0730536, -2.68103, 0.4352941, 1, 0, 1,
-0.6248267, -0.5433711, -1.395897, 0.427451, 1, 0, 1,
-0.6235636, -0.08607163, -1.075657, 0.4235294, 1, 0, 1,
-0.6215573, 1.197196, 0.07327315, 0.4156863, 1, 0, 1,
-0.6169682, 0.7612147, -1.968587, 0.4117647, 1, 0, 1,
-0.6099237, -1.567305, -2.775177, 0.4039216, 1, 0, 1,
-0.60965, -0.5915599, -3.611632, 0.3960784, 1, 0, 1,
-0.6078726, -0.412254, -1.311297, 0.3921569, 1, 0, 1,
-0.606867, -0.3868821, -3.3614, 0.3843137, 1, 0, 1,
-0.6040725, -0.941272, -3.467088, 0.3803922, 1, 0, 1,
-0.6020642, -0.1515347, -1.885883, 0.372549, 1, 0, 1,
-0.5952356, -1.397016, -2.803801, 0.3686275, 1, 0, 1,
-0.5935738, -2.105502, -2.170435, 0.3607843, 1, 0, 1,
-0.5874113, 1.032424, 0.01687832, 0.3568628, 1, 0, 1,
-0.5848802, 0.04659105, -1.937429, 0.3490196, 1, 0, 1,
-0.5818556, -0.1314964, -3.04792, 0.345098, 1, 0, 1,
-0.5807287, 0.1779979, -0.6471359, 0.3372549, 1, 0, 1,
-0.5747886, -0.3498773, -1.571688, 0.3333333, 1, 0, 1,
-0.5687478, 0.06598147, -0.2597832, 0.3254902, 1, 0, 1,
-0.5604063, -0.7389107, -2.854795, 0.3215686, 1, 0, 1,
-0.5593668, -0.8683259, -3.038083, 0.3137255, 1, 0, 1,
-0.5591254, 0.2390775, -1.520584, 0.3098039, 1, 0, 1,
-0.5499161, -0.8535182, -1.59796, 0.3019608, 1, 0, 1,
-0.540459, 0.6235663, 0.08918604, 0.2941177, 1, 0, 1,
-0.5382931, 0.08555442, -0.7035229, 0.2901961, 1, 0, 1,
-0.5327252, 0.3424519, 0.0421799, 0.282353, 1, 0, 1,
-0.5292678, 1.483643, 0.5529324, 0.2784314, 1, 0, 1,
-0.5287581, 1.141271, -1.105435, 0.2705882, 1, 0, 1,
-0.5282221, -1.031292, -2.863632, 0.2666667, 1, 0, 1,
-0.5235618, -0.4676342, -1.842584, 0.2588235, 1, 0, 1,
-0.5191896, 0.1136282, -2.231637, 0.254902, 1, 0, 1,
-0.5131137, 0.942946, 0.1891284, 0.2470588, 1, 0, 1,
-0.5103788, -1.103021, -1.985176, 0.2431373, 1, 0, 1,
-0.5082951, 0.5649703, -1.457266, 0.2352941, 1, 0, 1,
-0.5036662, 0.0118653, -0.07410616, 0.2313726, 1, 0, 1,
-0.4975337, 0.7292787, 1.310622, 0.2235294, 1, 0, 1,
-0.497229, 1.231897, 0.3299404, 0.2196078, 1, 0, 1,
-0.4971353, -0.4160457, -0.1422757, 0.2117647, 1, 0, 1,
-0.4920984, 1.000638, -0.7345597, 0.2078431, 1, 0, 1,
-0.4883922, -0.2304561, -1.889437, 0.2, 1, 0, 1,
-0.4807519, -1.006316, -2.285304, 0.1921569, 1, 0, 1,
-0.4769921, 1.148492, -1.318231, 0.1882353, 1, 0, 1,
-0.4723508, 1.173554, 0.3978789, 0.1803922, 1, 0, 1,
-0.4700966, 1.182145, -0.03863346, 0.1764706, 1, 0, 1,
-0.4699224, 0.764225, 0.6958303, 0.1686275, 1, 0, 1,
-0.4641985, 0.3982926, -2.271354, 0.1647059, 1, 0, 1,
-0.4638528, 0.8761966, 1.382061, 0.1568628, 1, 0, 1,
-0.4582596, -0.9595972, -1.151916, 0.1529412, 1, 0, 1,
-0.4578715, 1.21604, -0.05366753, 0.145098, 1, 0, 1,
-0.4557368, -0.09523764, -1.783093, 0.1411765, 1, 0, 1,
-0.4539017, -0.9324244, -3.451673, 0.1333333, 1, 0, 1,
-0.4505038, -0.002120403, -0.2984267, 0.1294118, 1, 0, 1,
-0.4504139, 0.1598551, -1.526544, 0.1215686, 1, 0, 1,
-0.4482685, 0.7184374, 0.4023676, 0.1176471, 1, 0, 1,
-0.4460086, -0.7100219, -2.194455, 0.1098039, 1, 0, 1,
-0.4442474, -0.6447752, -3.641713, 0.1058824, 1, 0, 1,
-0.4441786, 1.317311, -0.01279818, 0.09803922, 1, 0, 1,
-0.4396294, -1.371706, -3.999852, 0.09019608, 1, 0, 1,
-0.4346558, 1.84731, -1.031262, 0.08627451, 1, 0, 1,
-0.4334275, 0.8969765, 0.1821413, 0.07843138, 1, 0, 1,
-0.4305596, 1.518248, -0.09220661, 0.07450981, 1, 0, 1,
-0.4261835, 0.2417186, -0.8254745, 0.06666667, 1, 0, 1,
-0.4220248, 0.2899369, -0.5887346, 0.0627451, 1, 0, 1,
-0.4214195, -0.5032837, -0.8870695, 0.05490196, 1, 0, 1,
-0.4196607, 0.08144507, -2.803187, 0.05098039, 1, 0, 1,
-0.4185571, 0.8280888, -1.160812, 0.04313726, 1, 0, 1,
-0.4123542, -0.8585426, -2.276818, 0.03921569, 1, 0, 1,
-0.412194, -1.423338, -2.855617, 0.03137255, 1, 0, 1,
-0.412149, 0.01462829, -0.7375017, 0.02745098, 1, 0, 1,
-0.4092775, -0.7179095, -1.598431, 0.01960784, 1, 0, 1,
-0.4078479, -0.1644659, -3.495317, 0.01568628, 1, 0, 1,
-0.401492, -1.299718, -2.054122, 0.007843138, 1, 0, 1,
-0.4011428, 1.962099, -0.7415811, 0.003921569, 1, 0, 1,
-0.4008866, -1.338325, -3.543204, 0, 1, 0.003921569, 1,
-0.3962975, -0.2488701, -2.131059, 0, 1, 0.01176471, 1,
-0.3938141, -1.82636, -3.023125, 0, 1, 0.01568628, 1,
-0.393392, -0.1910289, -3.29517, 0, 1, 0.02352941, 1,
-0.3929206, -0.3347984, -1.478478, 0, 1, 0.02745098, 1,
-0.3921991, 0.9533972, -0.3542011, 0, 1, 0.03529412, 1,
-0.3902927, 0.6679829, -1.198037, 0, 1, 0.03921569, 1,
-0.3876894, 0.9700743, -1.474935, 0, 1, 0.04705882, 1,
-0.3835933, -0.7612958, -2.713096, 0, 1, 0.05098039, 1,
-0.3788231, -1.151829, -4.083716, 0, 1, 0.05882353, 1,
-0.3779103, -1.362934, -2.375214, 0, 1, 0.0627451, 1,
-0.3758157, 1.23771, -2.038523, 0, 1, 0.07058824, 1,
-0.3754886, 0.6244311, -0.03674749, 0, 1, 0.07450981, 1,
-0.3727995, -2.26417, -2.974523, 0, 1, 0.08235294, 1,
-0.3722336, 3.720356, 1.072625, 0, 1, 0.08627451, 1,
-0.3686971, 2.043023, 0.08308195, 0, 1, 0.09411765, 1,
-0.3681173, 0.4700216, -2.084788, 0, 1, 0.1019608, 1,
-0.3581862, -0.4165525, -1.972504, 0, 1, 0.1058824, 1,
-0.3542246, 1.907948, -0.4575047, 0, 1, 0.1137255, 1,
-0.3536642, 1.032784, -0.744126, 0, 1, 0.1176471, 1,
-0.3508759, -0.6001118, -2.541899, 0, 1, 0.1254902, 1,
-0.3471517, 0.0804112, 1.338351, 0, 1, 0.1294118, 1,
-0.3363652, 0.005114696, -2.352234, 0, 1, 0.1372549, 1,
-0.3330875, 0.7204514, 0.7881561, 0, 1, 0.1411765, 1,
-0.3323294, 0.8483841, 0.1419567, 0, 1, 0.1490196, 1,
-0.3300713, 0.2059463, -1.118519, 0, 1, 0.1529412, 1,
-0.327673, 0.2160949, -1.016129, 0, 1, 0.1607843, 1,
-0.327173, -1.005798, -2.653077, 0, 1, 0.1647059, 1,
-0.3243626, 1.69827, -0.1206384, 0, 1, 0.172549, 1,
-0.320938, -0.4870996, -3.195946, 0, 1, 0.1764706, 1,
-0.3169945, 0.3179421, -2.469497, 0, 1, 0.1843137, 1,
-0.3124494, -1.829313, -2.530495, 0, 1, 0.1882353, 1,
-0.3083176, -0.686051, -1.563358, 0, 1, 0.1960784, 1,
-0.3081535, -0.4463544, -3.085192, 0, 1, 0.2039216, 1,
-0.3059333, 0.412405, -0.946153, 0, 1, 0.2078431, 1,
-0.3055201, 0.4975692, -1.196146, 0, 1, 0.2156863, 1,
-0.304566, 2.221864, 1.080549, 0, 1, 0.2196078, 1,
-0.3036152, -0.4066458, -5.094507, 0, 1, 0.227451, 1,
-0.3023674, -1.177715, -3.968292, 0, 1, 0.2313726, 1,
-0.2999766, 1.317069, -1.858789, 0, 1, 0.2392157, 1,
-0.2989796, -0.539782, -1.866708, 0, 1, 0.2431373, 1,
-0.2971936, 0.147881, -2.42475, 0, 1, 0.2509804, 1,
-0.2966484, 0.2908631, -3.127775, 0, 1, 0.254902, 1,
-0.2953986, -0.1686449, -2.8459, 0, 1, 0.2627451, 1,
-0.295283, -0.06965356, -2.963296, 0, 1, 0.2666667, 1,
-0.2917825, 0.1409153, 0.1350685, 0, 1, 0.2745098, 1,
-0.2896601, 1.822642, 0.6950018, 0, 1, 0.2784314, 1,
-0.2889277, 1.68425, 0.3120205, 0, 1, 0.2862745, 1,
-0.2851759, -0.01869756, -2.34935, 0, 1, 0.2901961, 1,
-0.2827586, 0.2336717, -0.4838748, 0, 1, 0.2980392, 1,
-0.2815908, -0.7502783, -3.312287, 0, 1, 0.3058824, 1,
-0.2810541, 0.2390154, 0.657155, 0, 1, 0.3098039, 1,
-0.2738102, -1.249618, -1.348242, 0, 1, 0.3176471, 1,
-0.2715599, -1.460071, -1.836864, 0, 1, 0.3215686, 1,
-0.2705704, 0.9716173, -1.425672, 0, 1, 0.3294118, 1,
-0.2690138, 1.188259, -0.8532125, 0, 1, 0.3333333, 1,
-0.2667292, 0.3384771, 0.1050708, 0, 1, 0.3411765, 1,
-0.2645665, -0.288112, -1.03195, 0, 1, 0.345098, 1,
-0.2573102, -0.02266036, -2.490684, 0, 1, 0.3529412, 1,
-0.2570475, 0.2018506, -0.6123686, 0, 1, 0.3568628, 1,
-0.2552206, 0.0957485, -1.553161, 0, 1, 0.3647059, 1,
-0.2525986, 0.7750422, 0.05250223, 0, 1, 0.3686275, 1,
-0.2511367, -0.3651493, -2.205644, 0, 1, 0.3764706, 1,
-0.2502051, -1.618646, -3.769145, 0, 1, 0.3803922, 1,
-0.2486392, -0.4766533, -2.409786, 0, 1, 0.3882353, 1,
-0.246461, -0.3418407, -0.5545516, 0, 1, 0.3921569, 1,
-0.2428405, 0.2201328, -1.204967, 0, 1, 0.4, 1,
-0.2387485, -1.683883, -4.449391, 0, 1, 0.4078431, 1,
-0.2383906, 0.1298473, -0.168915, 0, 1, 0.4117647, 1,
-0.2373665, -1.43133, -2.411357, 0, 1, 0.4196078, 1,
-0.2365391, 0.9874654, -1.405788, 0, 1, 0.4235294, 1,
-0.234929, 1.173542, -0.1719237, 0, 1, 0.4313726, 1,
-0.232854, -0.4624227, -3.67285, 0, 1, 0.4352941, 1,
-0.2308747, -0.5660086, -4.637896, 0, 1, 0.4431373, 1,
-0.2305011, 0.2820236, -0.8485995, 0, 1, 0.4470588, 1,
-0.2294284, -0.9105841, -3.050596, 0, 1, 0.454902, 1,
-0.2105909, -0.6965417, -4.760145, 0, 1, 0.4588235, 1,
-0.2063221, -1.019067, -4.212197, 0, 1, 0.4666667, 1,
-0.2059888, 0.5438657, 0.4113692, 0, 1, 0.4705882, 1,
-0.2058203, 0.9878633, -2.232561, 0, 1, 0.4784314, 1,
-0.2042321, 0.8601888, 0.4314676, 0, 1, 0.4823529, 1,
-0.203965, -1.488336, -3.227937, 0, 1, 0.4901961, 1,
-0.2010442, 0.9235098, -0.4484012, 0, 1, 0.4941176, 1,
-0.2002023, -1.556479, -2.273188, 0, 1, 0.5019608, 1,
-0.1958269, 0.7278223, -1.189266, 0, 1, 0.509804, 1,
-0.1942441, -0.7972727, -1.955291, 0, 1, 0.5137255, 1,
-0.1921099, 1.216194, -0.3097493, 0, 1, 0.5215687, 1,
-0.1860735, 1.801974, 0.4061024, 0, 1, 0.5254902, 1,
-0.1856648, 0.3823826, -1.397724, 0, 1, 0.5333334, 1,
-0.1856216, 0.1586988, -0.0690539, 0, 1, 0.5372549, 1,
-0.1820331, 0.8440315, 1.011168, 0, 1, 0.5450981, 1,
-0.1806427, -1.476458, -2.772223, 0, 1, 0.5490196, 1,
-0.1804951, -1.041542, -1.94515, 0, 1, 0.5568628, 1,
-0.1789328, -0.09607575, -1.922888, 0, 1, 0.5607843, 1,
-0.1777494, 2.095764, 0.3925332, 0, 1, 0.5686275, 1,
-0.1770522, -1.866748, -2.28159, 0, 1, 0.572549, 1,
-0.174563, -0.09826867, -0.7995808, 0, 1, 0.5803922, 1,
-0.1715336, -0.4852042, -0.6619632, 0, 1, 0.5843138, 1,
-0.1694466, -0.9929025, -2.302478, 0, 1, 0.5921569, 1,
-0.168962, -0.5366775, -2.480253, 0, 1, 0.5960785, 1,
-0.1627919, 0.4368377, -0.8326513, 0, 1, 0.6039216, 1,
-0.1615255, 0.8025101, -1.376853, 0, 1, 0.6117647, 1,
-0.1597745, -0.05505038, -1.612328, 0, 1, 0.6156863, 1,
-0.1569283, 1.7716, -1.018449, 0, 1, 0.6235294, 1,
-0.1557785, 0.4293008, -1.384164, 0, 1, 0.627451, 1,
-0.1552083, -0.5035319, -3.543263, 0, 1, 0.6352941, 1,
-0.1531615, -0.2958565, -2.004284, 0, 1, 0.6392157, 1,
-0.1504979, 1.435951, 0.03708872, 0, 1, 0.6470588, 1,
-0.1502983, -1.354496, -4.229558, 0, 1, 0.6509804, 1,
-0.1473367, 0.2684099, -1.529838, 0, 1, 0.6588235, 1,
-0.1471387, -0.6813619, -2.636634, 0, 1, 0.6627451, 1,
-0.145644, -1.36384, -4.626395, 0, 1, 0.6705883, 1,
-0.1417164, 0.06160469, -1.465297, 0, 1, 0.6745098, 1,
-0.1395747, -1.14448, -4.955391, 0, 1, 0.682353, 1,
-0.1361241, -0.2287359, -3.884573, 0, 1, 0.6862745, 1,
-0.1357125, -1.799902, -2.875006, 0, 1, 0.6941177, 1,
-0.1346574, -0.8269657, -2.001559, 0, 1, 0.7019608, 1,
-0.1342069, 0.211142, 0.8499298, 0, 1, 0.7058824, 1,
-0.1322984, -0.673088, -3.03606, 0, 1, 0.7137255, 1,
-0.1304886, -1.01022, -1.368542, 0, 1, 0.7176471, 1,
-0.1268393, 0.4529878, -0.1395394, 0, 1, 0.7254902, 1,
-0.1192107, -0.6023813, -2.803211, 0, 1, 0.7294118, 1,
-0.1162809, -0.9397237, -1.790877, 0, 1, 0.7372549, 1,
-0.1134999, 1.429818, 0.7189453, 0, 1, 0.7411765, 1,
-0.1094546, -0.03855419, -1.69606, 0, 1, 0.7490196, 1,
-0.1079769, 0.7785521, 0.9823406, 0, 1, 0.7529412, 1,
-0.1035629, 0.6146538, -0.6492598, 0, 1, 0.7607843, 1,
-0.09942831, 1.042106, -0.6637618, 0, 1, 0.7647059, 1,
-0.09476961, -0.3963122, -2.492157, 0, 1, 0.772549, 1,
-0.08913118, -0.3591182, -3.689267, 0, 1, 0.7764706, 1,
-0.08404386, -0.5659592, -1.553444, 0, 1, 0.7843137, 1,
-0.07863978, -1.647611, -4.501968, 0, 1, 0.7882353, 1,
-0.07763739, -0.4954791, -5.072267, 0, 1, 0.7960784, 1,
-0.0720897, 0.6852688, -0.6094963, 0, 1, 0.8039216, 1,
-0.07124738, 0.19569, -0.4203419, 0, 1, 0.8078431, 1,
-0.07104723, -1.10713, -4.29372, 0, 1, 0.8156863, 1,
-0.06937274, -1.498348, -3.678524, 0, 1, 0.8196079, 1,
-0.06852406, -1.609202, -2.2626, 0, 1, 0.827451, 1,
-0.06555599, 1.238252, -0.2714368, 0, 1, 0.8313726, 1,
-0.06455675, 0.5994347, -1.033449, 0, 1, 0.8392157, 1,
-0.06260666, -0.8990515, -3.604284, 0, 1, 0.8431373, 1,
-0.06102291, 0.07696126, -1.256309, 0, 1, 0.8509804, 1,
-0.05676303, -0.5656958, -2.922066, 0, 1, 0.854902, 1,
-0.05521362, 0.8698229, 0.6108092, 0, 1, 0.8627451, 1,
-0.05410463, 1.060245, 0.009616338, 0, 1, 0.8666667, 1,
-0.04529158, 0.1957607, 0.4228055, 0, 1, 0.8745098, 1,
-0.03763039, -1.673412, -1.59261, 0, 1, 0.8784314, 1,
-0.02918668, 0.4333954, 0.8151527, 0, 1, 0.8862745, 1,
-0.02799117, 1.326011, -1.079355, 0, 1, 0.8901961, 1,
-0.02716747, -0.7714632, -2.590866, 0, 1, 0.8980392, 1,
-0.02474269, 1.180082, -0.2102415, 0, 1, 0.9058824, 1,
-0.02428096, -1.171267, -1.218894, 0, 1, 0.9098039, 1,
-0.02261105, 1.355369, 0.80071, 0, 1, 0.9176471, 1,
-0.02101391, -1.888014, -1.683187, 0, 1, 0.9215686, 1,
-0.01958117, 0.450465, -1.517567, 0, 1, 0.9294118, 1,
-0.01605409, -1.486716, -4.028999, 0, 1, 0.9333333, 1,
-0.009430405, -0.2341601, -3.38945, 0, 1, 0.9411765, 1,
-0.006681411, -1.2697, -5.353746, 0, 1, 0.945098, 1,
-0.004996931, 0.5875632, 0.2715375, 0, 1, 0.9529412, 1,
-0.003118192, -0.6823012, -3.404093, 0, 1, 0.9568627, 1,
-0.001237964, -1.119173, -3.330235, 0, 1, 0.9647059, 1,
0.002098081, -1.978895, 4.431774, 0, 1, 0.9686275, 1,
0.003380516, 1.013931, -0.5815606, 0, 1, 0.9764706, 1,
0.00360561, -0.2688309, 1.305749, 0, 1, 0.9803922, 1,
0.007890575, 1.860619, -0.7496817, 0, 1, 0.9882353, 1,
0.01296546, 1.215961, 0.6115813, 0, 1, 0.9921569, 1,
0.01397728, 0.7581351, -0.2068938, 0, 1, 1, 1,
0.01989066, 0.07320797, 0.6473006, 0, 0.9921569, 1, 1,
0.03140656, -1.307973, 3.180691, 0, 0.9882353, 1, 1,
0.03685151, -0.7844004, 1.497108, 0, 0.9803922, 1, 1,
0.04221347, 0.2949656, 1.509843, 0, 0.9764706, 1, 1,
0.04684115, 0.5356328, -1.428923, 0, 0.9686275, 1, 1,
0.04755946, -0.4481412, 3.778106, 0, 0.9647059, 1, 1,
0.04894254, -2.253214, 2.723446, 0, 0.9568627, 1, 1,
0.04960587, -0.5845026, 1.424158, 0, 0.9529412, 1, 1,
0.05108666, 0.07369431, 0.07705136, 0, 0.945098, 1, 1,
0.05844062, -1.553625, 2.139394, 0, 0.9411765, 1, 1,
0.06098106, -1.525851, 4.435099, 0, 0.9333333, 1, 1,
0.06430507, 0.7920233, 0.9179163, 0, 0.9294118, 1, 1,
0.06601881, -0.842541, 4.394131, 0, 0.9215686, 1, 1,
0.06871552, 0.5736091, 3.993808, 0, 0.9176471, 1, 1,
0.07315885, 0.1853848, 1.190816, 0, 0.9098039, 1, 1,
0.07667968, -0.9114231, 1.798878, 0, 0.9058824, 1, 1,
0.0773855, 0.2634465, 0.1354433, 0, 0.8980392, 1, 1,
0.07837465, 0.7180857, -0.6522761, 0, 0.8901961, 1, 1,
0.08053518, 0.8944913, 0.481246, 0, 0.8862745, 1, 1,
0.08317242, 0.7854453, -0.936605, 0, 0.8784314, 1, 1,
0.08405423, -0.4759401, 4.311597, 0, 0.8745098, 1, 1,
0.08503543, -1.605418, 3.936403, 0, 0.8666667, 1, 1,
0.08753291, 0.7541464, 0.0965055, 0, 0.8627451, 1, 1,
0.08922292, 0.5529178, -0.06779962, 0, 0.854902, 1, 1,
0.09351009, -0.6124196, 4.307837, 0, 0.8509804, 1, 1,
0.09683121, -0.5918995, 1.786255, 0, 0.8431373, 1, 1,
0.1066064, -1.446274, 2.78741, 0, 0.8392157, 1, 1,
0.1085032, -0.6444904, 2.342544, 0, 0.8313726, 1, 1,
0.1099651, -1.057359, 3.066737, 0, 0.827451, 1, 1,
0.112859, -1.576662, 4.740702, 0, 0.8196079, 1, 1,
0.1132998, -0.6183234, 3.07134, 0, 0.8156863, 1, 1,
0.116538, -1.027699, 1.867148, 0, 0.8078431, 1, 1,
0.1170833, -0.5484548, 1.992342, 0, 0.8039216, 1, 1,
0.1213768, 0.02972076, 0.1263724, 0, 0.7960784, 1, 1,
0.1231515, 0.4442257, 0.939585, 0, 0.7882353, 1, 1,
0.1247815, 0.7044028, -0.4154133, 0, 0.7843137, 1, 1,
0.1284604, -2.057842, 3.789108, 0, 0.7764706, 1, 1,
0.1356337, -0.8379797, 3.419884, 0, 0.772549, 1, 1,
0.1357666, -0.9872665, 1.867358, 0, 0.7647059, 1, 1,
0.1362826, -0.04976075, 2.93123, 0, 0.7607843, 1, 1,
0.1373858, 1.430586, 1.644656, 0, 0.7529412, 1, 1,
0.1405908, 0.1370967, 1.021814, 0, 0.7490196, 1, 1,
0.1413007, 0.06273412, 0.7893158, 0, 0.7411765, 1, 1,
0.1420823, 1.779342, 0.1887677, 0, 0.7372549, 1, 1,
0.1448442, 1.289869, 1.858361, 0, 0.7294118, 1, 1,
0.1453504, 0.1925889, 1.531145, 0, 0.7254902, 1, 1,
0.150934, -0.9530928, 3.680841, 0, 0.7176471, 1, 1,
0.1518879, -0.4544468, 1.424641, 0, 0.7137255, 1, 1,
0.1534625, -0.9393651, 2.842514, 0, 0.7058824, 1, 1,
0.1544539, -0.8647538, 0.9889532, 0, 0.6980392, 1, 1,
0.1545139, 0.9608067, 0.364271, 0, 0.6941177, 1, 1,
0.15482, -1.35267, 3.15369, 0, 0.6862745, 1, 1,
0.1557125, 0.5437633, 0.7033076, 0, 0.682353, 1, 1,
0.1599664, 2.091783, -0.9835365, 0, 0.6745098, 1, 1,
0.1615044, 0.785792, 1.233997, 0, 0.6705883, 1, 1,
0.1641466, 0.5825024, 2.65079, 0, 0.6627451, 1, 1,
0.1660919, -0.4196899, 2.283652, 0, 0.6588235, 1, 1,
0.1683539, 0.7301109, -0.2223505, 0, 0.6509804, 1, 1,
0.169167, 0.6368369, 0.06024596, 0, 0.6470588, 1, 1,
0.170091, -0.8595505, 4.723339, 0, 0.6392157, 1, 1,
0.1738669, 1.716733, 0.6304354, 0, 0.6352941, 1, 1,
0.1762699, 0.9665808, 1.434725, 0, 0.627451, 1, 1,
0.1777314, 1.241952, 0.5458898, 0, 0.6235294, 1, 1,
0.1794068, 0.4448653, -2.120148, 0, 0.6156863, 1, 1,
0.1821335, -1.693105, 3.853474, 0, 0.6117647, 1, 1,
0.1840579, 0.8363898, 1.626089, 0, 0.6039216, 1, 1,
0.1861876, 0.4381143, 0.5920919, 0, 0.5960785, 1, 1,
0.1868974, -0.2544302, 3.919967, 0, 0.5921569, 1, 1,
0.1877501, -0.7809672, 2.14433, 0, 0.5843138, 1, 1,
0.1912542, -0.2036706, 4.256385, 0, 0.5803922, 1, 1,
0.1949929, 0.5159228, -0.4276658, 0, 0.572549, 1, 1,
0.1962319, 1.808558, -0.3962306, 0, 0.5686275, 1, 1,
0.1972201, 0.01635885, 2.881718, 0, 0.5607843, 1, 1,
0.1974437, 0.7204173, 0.2663567, 0, 0.5568628, 1, 1,
0.1998461, 0.331221, 2.932205, 0, 0.5490196, 1, 1,
0.2040853, -0.5460929, 3.765142, 0, 0.5450981, 1, 1,
0.2060865, 1.031522, 0.9349021, 0, 0.5372549, 1, 1,
0.2097666, -1.621953, 3.823993, 0, 0.5333334, 1, 1,
0.2132629, 0.06919318, 1.593892, 0, 0.5254902, 1, 1,
0.2178155, -0.8769821, 1.50491, 0, 0.5215687, 1, 1,
0.2223507, 0.1430415, -0.4711486, 0, 0.5137255, 1, 1,
0.2254295, 0.6374069, -1.394805, 0, 0.509804, 1, 1,
0.2261311, 0.1998322, -0.3585737, 0, 0.5019608, 1, 1,
0.2286759, 0.1431721, 1.339837, 0, 0.4941176, 1, 1,
0.2371487, 2.216895, 0.003922904, 0, 0.4901961, 1, 1,
0.2430403, 0.02117663, 2.815349, 0, 0.4823529, 1, 1,
0.2433091, -1.032697, 2.789932, 0, 0.4784314, 1, 1,
0.2450647, -0.2991547, 2.2569, 0, 0.4705882, 1, 1,
0.256029, 0.07499347, 1.710916, 0, 0.4666667, 1, 1,
0.2657632, 1.319404, 2.117261, 0, 0.4588235, 1, 1,
0.2668313, 0.5133771, 0.1800142, 0, 0.454902, 1, 1,
0.2678967, -0.4480833, 2.555522, 0, 0.4470588, 1, 1,
0.269908, 1.851235, 2.148464, 0, 0.4431373, 1, 1,
0.2745749, 1.33338, 0.2695142, 0, 0.4352941, 1, 1,
0.2750953, -0.1554257, 2.662249, 0, 0.4313726, 1, 1,
0.2756313, -1.56837, 2.729254, 0, 0.4235294, 1, 1,
0.2798465, 0.9704722, 0.8469064, 0, 0.4196078, 1, 1,
0.2800917, 0.1721544, 1.964901, 0, 0.4117647, 1, 1,
0.2807568, 1.426417, 0.3407824, 0, 0.4078431, 1, 1,
0.287273, -0.7498722, 3.860429, 0, 0.4, 1, 1,
0.2902313, -0.6276577, 2.615796, 0, 0.3921569, 1, 1,
0.292442, -0.626632, 2.641623, 0, 0.3882353, 1, 1,
0.293944, 0.3108633, 2.017986, 0, 0.3803922, 1, 1,
0.2994303, 1.024839, -0.01280803, 0, 0.3764706, 1, 1,
0.3046923, 1.251278, 0.7766372, 0, 0.3686275, 1, 1,
0.3076959, -0.0496778, 1.142751, 0, 0.3647059, 1, 1,
0.3101596, 0.1661262, -0.4929029, 0, 0.3568628, 1, 1,
0.3124086, 1.067868, 0.3154282, 0, 0.3529412, 1, 1,
0.3129546, -2.27126, 2.484363, 0, 0.345098, 1, 1,
0.3133371, 0.6590578, -0.7020771, 0, 0.3411765, 1, 1,
0.3145807, 0.9628365, 0.9157289, 0, 0.3333333, 1, 1,
0.3170874, 0.6716459, 2.396382, 0, 0.3294118, 1, 1,
0.3194695, 1.999901, -0.9753425, 0, 0.3215686, 1, 1,
0.3199061, 0.9771326, 1.886777, 0, 0.3176471, 1, 1,
0.3203162, -0.2914168, 1.098373, 0, 0.3098039, 1, 1,
0.3223724, 0.2905236, 0.9035044, 0, 0.3058824, 1, 1,
0.3314903, -0.2287664, 1.095956, 0, 0.2980392, 1, 1,
0.3406407, -0.7103515, 2.857149, 0, 0.2901961, 1, 1,
0.3433284, 0.424638, -0.765057, 0, 0.2862745, 1, 1,
0.3441516, 0.373055, -1.815607, 0, 0.2784314, 1, 1,
0.3468736, 0.5460761, -0.4337424, 0, 0.2745098, 1, 1,
0.3510686, 0.4229354, -0.3227261, 0, 0.2666667, 1, 1,
0.3520339, -0.3823248, 3.145655, 0, 0.2627451, 1, 1,
0.3583187, 1.531315, -0.2944008, 0, 0.254902, 1, 1,
0.3643383, 1.454045, 1.920263, 0, 0.2509804, 1, 1,
0.3666931, 0.6497413, 0.3802705, 0, 0.2431373, 1, 1,
0.3698021, -0.1931631, 1.628312, 0, 0.2392157, 1, 1,
0.3760246, 1.587961, 0.6945843, 0, 0.2313726, 1, 1,
0.37981, 0.9839507, 1.162831, 0, 0.227451, 1, 1,
0.3809776, 0.616785, 1.164607, 0, 0.2196078, 1, 1,
0.3849605, 0.7962277, 0.5576909, 0, 0.2156863, 1, 1,
0.3877934, -0.4342351, 3.822229, 0, 0.2078431, 1, 1,
0.390216, 1.326706, 0.1805351, 0, 0.2039216, 1, 1,
0.394484, 0.9618307, -1.801381, 0, 0.1960784, 1, 1,
0.3964441, -1.582657, 2.993729, 0, 0.1882353, 1, 1,
0.3967884, -0.3207247, 1.42704, 0, 0.1843137, 1, 1,
0.4075648, 1.096465, -0.6492739, 0, 0.1764706, 1, 1,
0.4095467, -0.927083, 4.107732, 0, 0.172549, 1, 1,
0.4115272, -1.16423, 3.033748, 0, 0.1647059, 1, 1,
0.4150724, -0.8940774, 2.315038, 0, 0.1607843, 1, 1,
0.4162665, -0.301671, 2.478576, 0, 0.1529412, 1, 1,
0.4174488, 0.2354292, 2.152788, 0, 0.1490196, 1, 1,
0.4191228, 0.4418127, 0.5004768, 0, 0.1411765, 1, 1,
0.4210506, 0.6591604, 1.079742, 0, 0.1372549, 1, 1,
0.4210837, -1.21347, 2.81393, 0, 0.1294118, 1, 1,
0.4270412, -1.170749, 3.639175, 0, 0.1254902, 1, 1,
0.4311825, 0.1232145, 1.22007, 0, 0.1176471, 1, 1,
0.4320325, 0.3215638, 2.936898, 0, 0.1137255, 1, 1,
0.4322444, -1.902923, 3.009372, 0, 0.1058824, 1, 1,
0.4371539, -0.5867395, 1.19924, 0, 0.09803922, 1, 1,
0.4372585, -0.0604543, 0.9532567, 0, 0.09411765, 1, 1,
0.4396956, 1.185829, 0.7085519, 0, 0.08627451, 1, 1,
0.441945, 0.02272898, 1.560423, 0, 0.08235294, 1, 1,
0.4436097, -1.337674, 4.132812, 0, 0.07450981, 1, 1,
0.4454821, -1.060885, 3.145997, 0, 0.07058824, 1, 1,
0.4457415, 0.3718942, 0.5593434, 0, 0.0627451, 1, 1,
0.4458219, 1.131038, -0.6156379, 0, 0.05882353, 1, 1,
0.4458258, 0.8760355, 1.188521, 0, 0.05098039, 1, 1,
0.4461605, 0.5446875, 0.5856987, 0, 0.04705882, 1, 1,
0.4479699, -0.2575975, 2.257002, 0, 0.03921569, 1, 1,
0.4488314, 0.8411338, 1.420842, 0, 0.03529412, 1, 1,
0.4528646, 0.4225059, 0.1363014, 0, 0.02745098, 1, 1,
0.4529876, -0.0417924, 0.7739269, 0, 0.02352941, 1, 1,
0.4554918, -0.621118, 3.293435, 0, 0.01568628, 1, 1,
0.4653984, 1.037118, 1.025767, 0, 0.01176471, 1, 1,
0.4687346, -1.799286, 1.762293, 0, 0.003921569, 1, 1,
0.4733903, -0.5614806, 2.218739, 0.003921569, 0, 1, 1,
0.4772573, -0.8259366, 1.819003, 0.007843138, 0, 1, 1,
0.4805407, -1.398541, 2.307332, 0.01568628, 0, 1, 1,
0.4887099, -1.024148, 2.371159, 0.01960784, 0, 1, 1,
0.493678, 0.2701431, -0.01702974, 0.02745098, 0, 1, 1,
0.5059037, -0.890075, 1.883273, 0.03137255, 0, 1, 1,
0.5078977, 0.5166357, 0.6119502, 0.03921569, 0, 1, 1,
0.5104184, 1.40642, 2.503835, 0.04313726, 0, 1, 1,
0.5119955, 1.175198, 0.8791165, 0.05098039, 0, 1, 1,
0.5180933, -0.5692682, 1.593621, 0.05490196, 0, 1, 1,
0.5186483, 0.3724673, 3.183533, 0.0627451, 0, 1, 1,
0.5213575, -0.4047368, 2.700315, 0.06666667, 0, 1, 1,
0.5234741, -1.119889, 0.9162058, 0.07450981, 0, 1, 1,
0.5254822, -0.2962722, 3.375316, 0.07843138, 0, 1, 1,
0.5298859, -0.4042679, 1.57033, 0.08627451, 0, 1, 1,
0.5321423, 0.7475538, -0.3965002, 0.09019608, 0, 1, 1,
0.5328131, -0.02962837, -0.1950289, 0.09803922, 0, 1, 1,
0.5352796, -0.08452397, 0.6153654, 0.1058824, 0, 1, 1,
0.5364125, 0.2783132, 1.084577, 0.1098039, 0, 1, 1,
0.5431127, -0.03718417, 0.08705002, 0.1176471, 0, 1, 1,
0.5447421, -0.03584085, 2.04992, 0.1215686, 0, 1, 1,
0.544787, 0.7327685, 0.760635, 0.1294118, 0, 1, 1,
0.5468498, 0.6064082, -0.8170058, 0.1333333, 0, 1, 1,
0.5500539, -0.7789836, 3.49927, 0.1411765, 0, 1, 1,
0.5502691, 0.6755621, 3.651559, 0.145098, 0, 1, 1,
0.5521585, -0.005594901, 0.4866474, 0.1529412, 0, 1, 1,
0.5530432, -0.9843519, 3.509345, 0.1568628, 0, 1, 1,
0.5573791, -0.5677168, 0.4781481, 0.1647059, 0, 1, 1,
0.5599957, -0.4410473, 3.943593, 0.1686275, 0, 1, 1,
0.5614971, 0.3396894, 1.475701, 0.1764706, 0, 1, 1,
0.5621221, 0.2584586, -0.2679822, 0.1803922, 0, 1, 1,
0.5627649, -0.3045589, -0.11778, 0.1882353, 0, 1, 1,
0.5773895, -1.31808, 3.669116, 0.1921569, 0, 1, 1,
0.5887437, -0.3253646, 1.598671, 0.2, 0, 1, 1,
0.5896645, 1.296835, -0.2822578, 0.2078431, 0, 1, 1,
0.602344, -0.469418, 2.603136, 0.2117647, 0, 1, 1,
0.6042182, -0.5417312, 2.155915, 0.2196078, 0, 1, 1,
0.6065997, 0.6373981, 1.849039, 0.2235294, 0, 1, 1,
0.606914, 0.3768693, 1.765622, 0.2313726, 0, 1, 1,
0.609385, -0.01658816, 4.149057, 0.2352941, 0, 1, 1,
0.6095247, -0.06877805, 2.482368, 0.2431373, 0, 1, 1,
0.6097683, 0.2339172, 0.5373513, 0.2470588, 0, 1, 1,
0.6100801, 2.196093, 0.9172236, 0.254902, 0, 1, 1,
0.6108168, -0.1417138, 1.187289, 0.2588235, 0, 1, 1,
0.6117513, 1.184485, -0.141997, 0.2666667, 0, 1, 1,
0.6168155, -0.05897916, 1.359794, 0.2705882, 0, 1, 1,
0.6194484, -0.5380464, 1.922869, 0.2784314, 0, 1, 1,
0.6230311, -1.418246, 2.853063, 0.282353, 0, 1, 1,
0.6254876, -0.8424906, 2.506022, 0.2901961, 0, 1, 1,
0.6261698, 0.3036525, 0.3599513, 0.2941177, 0, 1, 1,
0.6341272, 0.5662189, 2.44052, 0.3019608, 0, 1, 1,
0.6343476, -1.425005, 3.437834, 0.3098039, 0, 1, 1,
0.635189, 0.8867993, 2.245522, 0.3137255, 0, 1, 1,
0.6413271, -1.303017, 1.13651, 0.3215686, 0, 1, 1,
0.6420127, 0.4784375, 1.904371, 0.3254902, 0, 1, 1,
0.6431452, -0.1481265, 1.605227, 0.3333333, 0, 1, 1,
0.6436269, 1.347674, 0.6776928, 0.3372549, 0, 1, 1,
0.646259, -1.602872, 2.589864, 0.345098, 0, 1, 1,
0.6519055, 0.384581, 0.1828195, 0.3490196, 0, 1, 1,
0.6525872, 1.775363, -1.547822, 0.3568628, 0, 1, 1,
0.6536376, 0.4401649, 1.016748, 0.3607843, 0, 1, 1,
0.6546293, 0.6235308, 1.13889, 0.3686275, 0, 1, 1,
0.6617067, 0.1585366, 1.22285, 0.372549, 0, 1, 1,
0.6725462, 1.4301, 2.216127, 0.3803922, 0, 1, 1,
0.6727995, -0.8658702, 0.6907979, 0.3843137, 0, 1, 1,
0.673692, -0.4938943, 1.460242, 0.3921569, 0, 1, 1,
0.6756325, -0.7400732, 3.386021, 0.3960784, 0, 1, 1,
0.6776409, 0.03132405, 1.635995, 0.4039216, 0, 1, 1,
0.6803202, 0.4979241, 2.252414, 0.4117647, 0, 1, 1,
0.6875922, 0.5171772, 0.3586872, 0.4156863, 0, 1, 1,
0.6897837, 1.310747, 0.7495616, 0.4235294, 0, 1, 1,
0.6905042, 1.246102, -0.05096079, 0.427451, 0, 1, 1,
0.693711, 0.6339645, 0.635701, 0.4352941, 0, 1, 1,
0.6955491, -0.9484813, 3.018548, 0.4392157, 0, 1, 1,
0.7074586, 1.20866, 0.08666088, 0.4470588, 0, 1, 1,
0.7083498, 0.2540476, 2.216046, 0.4509804, 0, 1, 1,
0.7089083, 0.6103414, 2.339446, 0.4588235, 0, 1, 1,
0.709917, -1.163749, 4.04469, 0.4627451, 0, 1, 1,
0.7136821, -2.86459, 3.787032, 0.4705882, 0, 1, 1,
0.7194959, -1.575786, 2.936615, 0.4745098, 0, 1, 1,
0.7196009, 0.01404794, 2.326852, 0.4823529, 0, 1, 1,
0.7220852, 0.09137537, -0.1110112, 0.4862745, 0, 1, 1,
0.7302027, -1.226107, 2.983684, 0.4941176, 0, 1, 1,
0.7311051, 0.3222907, 0.955473, 0.5019608, 0, 1, 1,
0.7338101, 0.3993628, 1.344565, 0.5058824, 0, 1, 1,
0.7366965, 0.8634339, 0.3200685, 0.5137255, 0, 1, 1,
0.7367899, 1.497044, 2.662753, 0.5176471, 0, 1, 1,
0.7411774, -2.341097, 1.70401, 0.5254902, 0, 1, 1,
0.742336, 1.242516, 1.103598, 0.5294118, 0, 1, 1,
0.743991, 0.5669713, 1.343191, 0.5372549, 0, 1, 1,
0.7443956, 0.09596279, 2.691548, 0.5411765, 0, 1, 1,
0.7461042, 0.08053523, 0.07425556, 0.5490196, 0, 1, 1,
0.7481907, -0.1430919, 1.232297, 0.5529412, 0, 1, 1,
0.752133, 0.6918789, 1.769454, 0.5607843, 0, 1, 1,
0.7544429, 0.4704025, 0.7300163, 0.5647059, 0, 1, 1,
0.7604848, -0.8404382, 1.978513, 0.572549, 0, 1, 1,
0.7613875, 1.510843, 2.186672, 0.5764706, 0, 1, 1,
0.7621359, -0.9856392, 2.457669, 0.5843138, 0, 1, 1,
0.7666844, 1.332071, -0.2096765, 0.5882353, 0, 1, 1,
0.768428, 1.95115, 0.5265244, 0.5960785, 0, 1, 1,
0.7720481, 0.4945768, 1.119371, 0.6039216, 0, 1, 1,
0.7729204, 1.464131, 2.060452, 0.6078432, 0, 1, 1,
0.7732397, -0.2183494, -1.079342, 0.6156863, 0, 1, 1,
0.7748032, 0.9614561, 3.188426, 0.6196079, 0, 1, 1,
0.7778473, 1.806489, -0.4265767, 0.627451, 0, 1, 1,
0.7784969, 1.410629, 0.7147766, 0.6313726, 0, 1, 1,
0.781245, 2.32188, 0.8821078, 0.6392157, 0, 1, 1,
0.7812938, 0.1353121, 1.532128, 0.6431373, 0, 1, 1,
0.7849535, -0.7224023, 1.203403, 0.6509804, 0, 1, 1,
0.7896458, 0.4631315, 0.2854755, 0.654902, 0, 1, 1,
0.7899103, 0.1181219, 3.129732, 0.6627451, 0, 1, 1,
0.7961366, -1.174556, 2.038852, 0.6666667, 0, 1, 1,
0.7993726, 1.087736, 0.510774, 0.6745098, 0, 1, 1,
0.799996, -1.383104, 1.525934, 0.6784314, 0, 1, 1,
0.8044935, 1.088511, -0.5089903, 0.6862745, 0, 1, 1,
0.805766, 1.390927, 0.8552707, 0.6901961, 0, 1, 1,
0.8145961, 0.4958101, -0.008796151, 0.6980392, 0, 1, 1,
0.8263806, 1.679815, 0.571695, 0.7058824, 0, 1, 1,
0.8281736, -0.2829479, 3.085386, 0.7098039, 0, 1, 1,
0.831242, 0.6787206, 1.654436, 0.7176471, 0, 1, 1,
0.8358784, 1.393977, 0.9647267, 0.7215686, 0, 1, 1,
0.8413363, -0.2250286, 1.011536, 0.7294118, 0, 1, 1,
0.8428372, 0.07646229, 0.04800218, 0.7333333, 0, 1, 1,
0.8508916, -1.081985, 3.218354, 0.7411765, 0, 1, 1,
0.857233, 0.4810291, 1.362285, 0.7450981, 0, 1, 1,
0.8594622, -0.7743359, 2.86523, 0.7529412, 0, 1, 1,
0.8595784, 0.4861884, 0.8962576, 0.7568628, 0, 1, 1,
0.8604172, -1.017545, 1.808636, 0.7647059, 0, 1, 1,
0.861985, -0.9256429, 3.054452, 0.7686275, 0, 1, 1,
0.8623528, 0.04044463, 0.9247924, 0.7764706, 0, 1, 1,
0.8636279, -0.4921354, -0.1493876, 0.7803922, 0, 1, 1,
0.8642213, 0.4976337, 0.1556959, 0.7882353, 0, 1, 1,
0.8679404, -0.7986804, 1.530781, 0.7921569, 0, 1, 1,
0.8698627, -0.4844883, 1.040349, 0.8, 0, 1, 1,
0.8774267, 0.2468164, 1.13669, 0.8078431, 0, 1, 1,
0.8801409, 0.125687, 0.5497225, 0.8117647, 0, 1, 1,
0.8804433, 1.057971, 0.7167438, 0.8196079, 0, 1, 1,
0.8831919, 1.634349, -0.7455034, 0.8235294, 0, 1, 1,
0.8840875, -0.5542158, 1.618224, 0.8313726, 0, 1, 1,
0.8870022, 1.392579, 1.369795, 0.8352941, 0, 1, 1,
0.8949813, 0.7963721, 0.5097422, 0.8431373, 0, 1, 1,
0.8982055, 2.204659, -0.06495923, 0.8470588, 0, 1, 1,
0.8985385, -1.032305, 2.463168, 0.854902, 0, 1, 1,
0.901397, -2.210497, 2.41276, 0.8588235, 0, 1, 1,
0.9016725, 1.404155, -0.08830304, 0.8666667, 0, 1, 1,
0.9049809, -1.033782, 1.252522, 0.8705882, 0, 1, 1,
0.9085049, -1.056025, 3.151826, 0.8784314, 0, 1, 1,
0.9104672, -1.743435, 1.055593, 0.8823529, 0, 1, 1,
0.9130874, 0.3715832, 1.965696, 0.8901961, 0, 1, 1,
0.9190953, 0.05641701, 1.465723, 0.8941177, 0, 1, 1,
0.9210618, 0.9948372, 2.228058, 0.9019608, 0, 1, 1,
0.9226021, -2.131181, 3.55136, 0.9098039, 0, 1, 1,
0.9228727, 1.676241, 1.674819, 0.9137255, 0, 1, 1,
0.9267005, -1.858284, 2.900614, 0.9215686, 0, 1, 1,
0.9341093, 0.5795087, 0.3321398, 0.9254902, 0, 1, 1,
0.9347901, 0.7349611, 0.8627982, 0.9333333, 0, 1, 1,
0.9375573, 1.140354, 1.516869, 0.9372549, 0, 1, 1,
0.9384251, 0.4696654, 0.7654822, 0.945098, 0, 1, 1,
0.9403329, 1.58049, 0.05993219, 0.9490196, 0, 1, 1,
0.941825, -0.6598923, 1.738062, 0.9568627, 0, 1, 1,
0.9432735, 0.5554314, 2.558784, 0.9607843, 0, 1, 1,
0.9446863, -0.6994253, 2.174732, 0.9686275, 0, 1, 1,
0.9563041, 0.4921582, 0.8305606, 0.972549, 0, 1, 1,
0.9601491, -0.1394621, 1.153742, 0.9803922, 0, 1, 1,
0.9615107, -1.163403, 2.480451, 0.9843137, 0, 1, 1,
0.9651785, -0.6473011, 1.201364, 0.9921569, 0, 1, 1,
0.9683686, 1.11448, 2.189217, 0.9960784, 0, 1, 1,
0.9763686, 0.6095518, 0.9435296, 1, 0, 0.9960784, 1,
0.978075, -0.3192924, 1.352962, 1, 0, 0.9882353, 1,
0.9816612, -1.605175, 2.079003, 1, 0, 0.9843137, 1,
0.9889973, -0.6555648, 3.933542, 1, 0, 0.9764706, 1,
0.9902099, 1.21971, 2.473151, 1, 0, 0.972549, 1,
0.9967091, 0.1006924, 1.709191, 1, 0, 0.9647059, 1,
0.9997369, -0.9275634, 2.249545, 1, 0, 0.9607843, 1,
1.003295, 0.0316286, 2.991332, 1, 0, 0.9529412, 1,
1.005353, 0.4842048, 1.285236, 1, 0, 0.9490196, 1,
1.012822, -0.1038132, 0.02679867, 1, 0, 0.9411765, 1,
1.013048, 1.150756, 0.985437, 1, 0, 0.9372549, 1,
1.018192, -1.178005, 3.281626, 1, 0, 0.9294118, 1,
1.018349, 2.003327, -0.7748331, 1, 0, 0.9254902, 1,
1.020859, 1.459671, 0.7961211, 1, 0, 0.9176471, 1,
1.030816, -1.134003, 2.185404, 1, 0, 0.9137255, 1,
1.035744, -0.3677043, 2.683985, 1, 0, 0.9058824, 1,
1.04738, -1.089522, 2.125246, 1, 0, 0.9019608, 1,
1.04748, -1.67412, 1.102934, 1, 0, 0.8941177, 1,
1.049492, 2.139312, -0.4033265, 1, 0, 0.8862745, 1,
1.053731, 1.532236, 0.5753074, 1, 0, 0.8823529, 1,
1.058191, 1.371917, 2.033731, 1, 0, 0.8745098, 1,
1.063125, -0.1733662, -0.4210957, 1, 0, 0.8705882, 1,
1.066354, 0.444444, 0.6523769, 1, 0, 0.8627451, 1,
1.066457, 0.3444371, 1.446219, 1, 0, 0.8588235, 1,
1.07069, -1.011142, 2.803599, 1, 0, 0.8509804, 1,
1.073034, -2.766358, 2.885468, 1, 0, 0.8470588, 1,
1.075213, 0.9754368, 1.600579, 1, 0, 0.8392157, 1,
1.080979, 3.074343, -1.778651, 1, 0, 0.8352941, 1,
1.085904, -1.001539, 2.905356, 1, 0, 0.827451, 1,
1.09435, -0.07669038, 2.578438, 1, 0, 0.8235294, 1,
1.094723, 0.827484, 1.213933, 1, 0, 0.8156863, 1,
1.095371, -0.07417692, 2.567508, 1, 0, 0.8117647, 1,
1.104308, -0.7304894, 2.745424, 1, 0, 0.8039216, 1,
1.117577, 1.02423, 3.554768, 1, 0, 0.7960784, 1,
1.123153, 0.1567897, 1.851083, 1, 0, 0.7921569, 1,
1.124436, -0.4687949, 1.458527, 1, 0, 0.7843137, 1,
1.127532, 0.3886701, 1.376413, 1, 0, 0.7803922, 1,
1.131307, 0.8792697, -0.7587957, 1, 0, 0.772549, 1,
1.13278, -1.327382, 1.692421, 1, 0, 0.7686275, 1,
1.134597, -0.3733356, 2.493315, 1, 0, 0.7607843, 1,
1.147907, 0.7467854, 2.353633, 1, 0, 0.7568628, 1,
1.149878, 0.4953686, 2.771135, 1, 0, 0.7490196, 1,
1.154514, 0.1506896, 2.38684, 1, 0, 0.7450981, 1,
1.160249, 0.6500852, 2.13631, 1, 0, 0.7372549, 1,
1.170297, 0.84046, 1.775867, 1, 0, 0.7333333, 1,
1.17362, -1.127567, 1.526466, 1, 0, 0.7254902, 1,
1.173835, -1.339077, 3.270428, 1, 0, 0.7215686, 1,
1.183587, -1.188818, 2.382424, 1, 0, 0.7137255, 1,
1.187305, 0.9256908, 1.415161, 1, 0, 0.7098039, 1,
1.188444, -0.2230328, 1.829885, 1, 0, 0.7019608, 1,
1.18899, 0.6453645, -0.2322628, 1, 0, 0.6941177, 1,
1.192333, 1.505468, 0.2917781, 1, 0, 0.6901961, 1,
1.19738, 1.895706, -0.3709593, 1, 0, 0.682353, 1,
1.202072, -0.2409573, 1.774983, 1, 0, 0.6784314, 1,
1.204964, -0.3366399, 2.167006, 1, 0, 0.6705883, 1,
1.206521, 0.3340549, 2.214871, 1, 0, 0.6666667, 1,
1.212962, 0.1722898, 1.215706, 1, 0, 0.6588235, 1,
1.221124, 0.3922159, 1.421515, 1, 0, 0.654902, 1,
1.221716, 0.4345392, 0.5422682, 1, 0, 0.6470588, 1,
1.227544, -0.5826688, 4.411878, 1, 0, 0.6431373, 1,
1.228894, -0.182206, 2.098716, 1, 0, 0.6352941, 1,
1.235871, 1.429453, 0.274792, 1, 0, 0.6313726, 1,
1.242116, -0.008252718, 1.306275, 1, 0, 0.6235294, 1,
1.244642, 1.172609, 0.6634838, 1, 0, 0.6196079, 1,
1.247004, 1.181278, 2.727098, 1, 0, 0.6117647, 1,
1.254207, -0.332094, 2.117834, 1, 0, 0.6078432, 1,
1.254332, 1.068785, 1.506593, 1, 0, 0.6, 1,
1.257004, 1.823604, 1.079733, 1, 0, 0.5921569, 1,
1.259186, 0.4856117, 1.658554, 1, 0, 0.5882353, 1,
1.260016, 0.4633572, 2.443405, 1, 0, 0.5803922, 1,
1.26185, -0.3175478, 3.044551, 1, 0, 0.5764706, 1,
1.267231, 0.8669337, 0.3439533, 1, 0, 0.5686275, 1,
1.278576, 2.123115, -0.7230341, 1, 0, 0.5647059, 1,
1.28266, -1.261521, 4.318716, 1, 0, 0.5568628, 1,
1.285825, -0.2624459, 2.627548, 1, 0, 0.5529412, 1,
1.307974, 0.8259947, 1.002291, 1, 0, 0.5450981, 1,
1.311685, -0.8392921, 0.9657148, 1, 0, 0.5411765, 1,
1.328485, -1.495069, 1.388324, 1, 0, 0.5333334, 1,
1.3364, 0.4404848, 0.8233413, 1, 0, 0.5294118, 1,
1.355684, -0.3811352, 1.735615, 1, 0, 0.5215687, 1,
1.357547, -0.2557835, 1.929832, 1, 0, 0.5176471, 1,
1.371442, -0.576321, 2.727578, 1, 0, 0.509804, 1,
1.380842, -0.7497263, 2.566666, 1, 0, 0.5058824, 1,
1.382536, 0.5173523, 0.4225633, 1, 0, 0.4980392, 1,
1.38967, 1.033054, 1.384903, 1, 0, 0.4901961, 1,
1.393358, 0.4578198, 2.23471, 1, 0, 0.4862745, 1,
1.394302, -0.0191714, 0.1675726, 1, 0, 0.4784314, 1,
1.396135, -0.9204389, 3.145771, 1, 0, 0.4745098, 1,
1.413117, -0.06855719, 1.366108, 1, 0, 0.4666667, 1,
1.413566, 1.274395, -1.149042, 1, 0, 0.4627451, 1,
1.415236, 0.6203318, 1.354456, 1, 0, 0.454902, 1,
1.427741, -0.8049372, 3.836575, 1, 0, 0.4509804, 1,
1.435985, -0.8166533, 3.454929, 1, 0, 0.4431373, 1,
1.436296, 0.2402119, 2.223273, 1, 0, 0.4392157, 1,
1.440668, 0.6247904, 2.075566, 1, 0, 0.4313726, 1,
1.456873, -0.6669118, 2.241465, 1, 0, 0.427451, 1,
1.463772, -1.116359, 1.98104, 1, 0, 0.4196078, 1,
1.46415, 1.496877, 1.535551, 1, 0, 0.4156863, 1,
1.464442, 0.4719817, 1.60521, 1, 0, 0.4078431, 1,
1.468304, 0.5171556, 0.7373782, 1, 0, 0.4039216, 1,
1.48082, 0.8358153, 0.5867379, 1, 0, 0.3960784, 1,
1.487329, -0.268035, 1.587498, 1, 0, 0.3882353, 1,
1.491644, -0.1155669, 1.550121, 1, 0, 0.3843137, 1,
1.505204, 0.925041, 1.416659, 1, 0, 0.3764706, 1,
1.510296, -1.047848, 1.672994, 1, 0, 0.372549, 1,
1.511656, -0.5239046, 1.512634, 1, 0, 0.3647059, 1,
1.520905, 1.66003, -1.095905, 1, 0, 0.3607843, 1,
1.562732, -1.280447, 2.19768, 1, 0, 0.3529412, 1,
1.56636, 1.345922, -0.4617769, 1, 0, 0.3490196, 1,
1.575667, -0.08111103, 0.4076224, 1, 0, 0.3411765, 1,
1.578938, -0.2765818, 2.58843, 1, 0, 0.3372549, 1,
1.58353, -0.2588096, 0.7365757, 1, 0, 0.3294118, 1,
1.585763, -0.06400193, 1.99077, 1, 0, 0.3254902, 1,
1.597159, -0.3270247, 1.974395, 1, 0, 0.3176471, 1,
1.605453, 0.1043112, 1.590258, 1, 0, 0.3137255, 1,
1.625625, 0.4137294, -1.333833, 1, 0, 0.3058824, 1,
1.639091, 0.02634452, 1.800572, 1, 0, 0.2980392, 1,
1.643128, 0.4976097, 2.558333, 1, 0, 0.2941177, 1,
1.655141, -1.474739, 1.307687, 1, 0, 0.2862745, 1,
1.670487, 1.052539, 0.1862959, 1, 0, 0.282353, 1,
1.6882, 0.1013685, 2.771478, 1, 0, 0.2745098, 1,
1.694136, 0.3898419, 1.878262, 1, 0, 0.2705882, 1,
1.707117, 0.4390468, 2.720273, 1, 0, 0.2627451, 1,
1.71849, 0.01476428, 3.97296, 1, 0, 0.2588235, 1,
1.758403, 0.9091635, 1.72019, 1, 0, 0.2509804, 1,
1.774661, -0.8620654, 2.109528, 1, 0, 0.2470588, 1,
1.778846, 1.048555, 1.483071, 1, 0, 0.2392157, 1,
1.810253, -1.515418, 3.762091, 1, 0, 0.2352941, 1,
1.812355, 0.9446307, -0.07454867, 1, 0, 0.227451, 1,
1.829437, 2.145499, 1.332866, 1, 0, 0.2235294, 1,
1.846665, 1.378617, -0.4208469, 1, 0, 0.2156863, 1,
1.855406, 1.043693, -0.1909216, 1, 0, 0.2117647, 1,
1.868848, -0.3457974, 0.4491562, 1, 0, 0.2039216, 1,
1.891417, -0.7161548, 3.335357, 1, 0, 0.1960784, 1,
1.891751, -0.1236376, 1.279117, 1, 0, 0.1921569, 1,
1.894645, -1.000688, 2.288896, 1, 0, 0.1843137, 1,
1.899419, -1.609712, 2.248033, 1, 0, 0.1803922, 1,
1.900832, 0.1785573, 1.024749, 1, 0, 0.172549, 1,
1.903915, 1.277119, 0.6558679, 1, 0, 0.1686275, 1,
1.982607, -0.3413294, 3.253233, 1, 0, 0.1607843, 1,
2.028485, 2.192, -0.01268015, 1, 0, 0.1568628, 1,
2.028785, 0.3810346, 2.337537, 1, 0, 0.1490196, 1,
2.054797, 1.010722, 0.9008214, 1, 0, 0.145098, 1,
2.094766, -0.7037591, 2.883239, 1, 0, 0.1372549, 1,
2.103492, -0.2933109, 2.331582, 1, 0, 0.1333333, 1,
2.10523, 1.170404, 0.413679, 1, 0, 0.1254902, 1,
2.111389, -0.1378263, 1.643233, 1, 0, 0.1215686, 1,
2.120311, 0.2293742, 1.935829, 1, 0, 0.1137255, 1,
2.148217, 0.9832175, 2.038997, 1, 0, 0.1098039, 1,
2.151158, 0.1741289, 0.7566249, 1, 0, 0.1019608, 1,
2.160048, 0.9134539, 0.4281841, 1, 0, 0.09411765, 1,
2.205395, -1.107506, 2.335812, 1, 0, 0.09019608, 1,
2.2608, 0.2211463, 1.079529, 1, 0, 0.08235294, 1,
2.277288, 0.1051526, -0.09727208, 1, 0, 0.07843138, 1,
2.280145, -0.07030185, 1.911985, 1, 0, 0.07058824, 1,
2.342968, 0.9971747, -0.1562316, 1, 0, 0.06666667, 1,
2.360554, 1.947526, 0.3497706, 1, 0, 0.05882353, 1,
2.389873, 0.2026336, 1.102691, 1, 0, 0.05490196, 1,
2.413202, -1.675807, 0.9215026, 1, 0, 0.04705882, 1,
2.422124, 1.574144, 0.4578255, 1, 0, 0.04313726, 1,
2.47911, 0.6050599, -1.189129, 1, 0, 0.03529412, 1,
2.518007, 0.4316971, 1.010264, 1, 0, 0.03137255, 1,
2.717301, -0.4099044, 1.955061, 1, 0, 0.02352941, 1,
2.773739, 1.604496, 1.306175, 1, 0, 0.01960784, 1,
2.80977, 0.1859061, 0.664348, 1, 0, 0.01176471, 1,
2.811152, 0.3630042, 0.7103947, 1, 0, 0.007843138, 1
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
-0.09742177, -3.980738, -7.064755, 0, -0.5, 0.5, 0.5,
-0.09742177, -3.980738, -7.064755, 1, -0.5, 0.5, 0.5,
-0.09742177, -3.980738, -7.064755, 1, 1.5, 0.5, 0.5,
-0.09742177, -3.980738, -7.064755, 0, 1.5, 0.5, 0.5
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
-3.992002, 0.4278829, -7.064755, 0, -0.5, 0.5, 0.5,
-3.992002, 0.4278829, -7.064755, 1, -0.5, 0.5, 0.5,
-3.992002, 0.4278829, -7.064755, 1, 1.5, 0.5, 0.5,
-3.992002, 0.4278829, -7.064755, 0, 1.5, 0.5, 0.5
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
-3.992002, -3.980738, -0.3065221, 0, -0.5, 0.5, 0.5,
-3.992002, -3.980738, -0.3065221, 1, -0.5, 0.5, 0.5,
-3.992002, -3.980738, -0.3065221, 1, 1.5, 0.5, 0.5,
-3.992002, -3.980738, -0.3065221, 0, 1.5, 0.5, 0.5
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
-3, -2.963364, -5.505163,
2, -2.963364, -5.505163,
-3, -2.963364, -5.505163,
-3, -3.132926, -5.765095,
-2, -2.963364, -5.505163,
-2, -3.132926, -5.765095,
-1, -2.963364, -5.505163,
-1, -3.132926, -5.765095,
0, -2.963364, -5.505163,
0, -3.132926, -5.765095,
1, -2.963364, -5.505163,
1, -3.132926, -5.765095,
2, -2.963364, -5.505163,
2, -3.132926, -5.765095
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
-3, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
-3, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
-3, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
-3, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5,
-2, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
-2, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
-2, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
-2, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5,
-1, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
-1, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
-1, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
-1, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5,
0, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
0, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
0, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
0, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5,
1, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
1, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
1, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
1, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5,
2, -3.472051, -6.284959, 0, -0.5, 0.5, 0.5,
2, -3.472051, -6.284959, 1, -0.5, 0.5, 0.5,
2, -3.472051, -6.284959, 1, 1.5, 0.5, 0.5,
2, -3.472051, -6.284959, 0, 1.5, 0.5, 0.5
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
-3.093253, -2, -5.505163,
-3.093253, 3, -5.505163,
-3.093253, -2, -5.505163,
-3.243044, -2, -5.765095,
-3.093253, -1, -5.505163,
-3.243044, -1, -5.765095,
-3.093253, 0, -5.505163,
-3.243044, 0, -5.765095,
-3.093253, 1, -5.505163,
-3.243044, 1, -5.765095,
-3.093253, 2, -5.505163,
-3.243044, 2, -5.765095,
-3.093253, 3, -5.505163,
-3.243044, 3, -5.765095
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
-3.542627, -2, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, -2, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, -2, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, -2, -6.284959, 0, 1.5, 0.5, 0.5,
-3.542627, -1, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, -1, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, -1, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, -1, -6.284959, 0, 1.5, 0.5, 0.5,
-3.542627, 0, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, 0, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, 0, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, 0, -6.284959, 0, 1.5, 0.5, 0.5,
-3.542627, 1, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, 1, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, 1, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, 1, -6.284959, 0, 1.5, 0.5, 0.5,
-3.542627, 2, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, 2, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, 2, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, 2, -6.284959, 0, 1.5, 0.5, 0.5,
-3.542627, 3, -6.284959, 0, -0.5, 0.5, 0.5,
-3.542627, 3, -6.284959, 1, -0.5, 0.5, 0.5,
-3.542627, 3, -6.284959, 1, 1.5, 0.5, 0.5,
-3.542627, 3, -6.284959, 0, 1.5, 0.5, 0.5
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
-3.093253, -2.963364, -4,
-3.093253, -2.963364, 4,
-3.093253, -2.963364, -4,
-3.243044, -3.132926, -4,
-3.093253, -2.963364, -2,
-3.243044, -3.132926, -2,
-3.093253, -2.963364, 0,
-3.243044, -3.132926, 0,
-3.093253, -2.963364, 2,
-3.243044, -3.132926, 2,
-3.093253, -2.963364, 4,
-3.243044, -3.132926, 4
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
-3.542627, -3.472051, -4, 0, -0.5, 0.5, 0.5,
-3.542627, -3.472051, -4, 1, -0.5, 0.5, 0.5,
-3.542627, -3.472051, -4, 1, 1.5, 0.5, 0.5,
-3.542627, -3.472051, -4, 0, 1.5, 0.5, 0.5,
-3.542627, -3.472051, -2, 0, -0.5, 0.5, 0.5,
-3.542627, -3.472051, -2, 1, -0.5, 0.5, 0.5,
-3.542627, -3.472051, -2, 1, 1.5, 0.5, 0.5,
-3.542627, -3.472051, -2, 0, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 0, 0, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 0, 1, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 0, 1, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 0, 0, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 2, 0, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 2, 1, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 2, 1, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 2, 0, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 4, 0, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 4, 1, -0.5, 0.5, 0.5,
-3.542627, -3.472051, 4, 1, 1.5, 0.5, 0.5,
-3.542627, -3.472051, 4, 0, 1.5, 0.5, 0.5
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
-3.093253, -2.963364, -5.505163,
-3.093253, 3.81913, -5.505163,
-3.093253, -2.963364, 4.892118,
-3.093253, 3.81913, 4.892118,
-3.093253, -2.963364, -5.505163,
-3.093253, -2.963364, 4.892118,
-3.093253, 3.81913, -5.505163,
-3.093253, 3.81913, 4.892118,
-3.093253, -2.963364, -5.505163,
2.898409, -2.963364, -5.505163,
-3.093253, -2.963364, 4.892118,
2.898409, -2.963364, 4.892118,
-3.093253, 3.81913, -5.505163,
2.898409, 3.81913, -5.505163,
-3.093253, 3.81913, 4.892118,
2.898409, 3.81913, 4.892118,
2.898409, -2.963364, -5.505163,
2.898409, 3.81913, -5.505163,
2.898409, -2.963364, 4.892118,
2.898409, 3.81913, 4.892118,
2.898409, -2.963364, -5.505163,
2.898409, -2.963364, 4.892118,
2.898409, 3.81913, -5.505163,
2.898409, 3.81913, 4.892118
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
var radius = 7.360524;
var distance = 32.74781;
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
mvMatrix.translate( 0.09742177, -0.4278829, 0.3065221 );
mvMatrix.scale( 1.328236, 1.173365, 0.7654254 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.74781);
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
TCA<-read.table("TCA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-TCA$V2
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
```

```r
y<-TCA$V3
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
```

```r
z<-TCA$V4
```

```
## Error in eval(expr, envir, enclos): object 'TCA' not found
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
-3.005996, 0.03003658, -1.796038, 0, 0, 1, 1, 1,
-2.720208, -1.290633, -1.229816, 1, 0, 0, 1, 1,
-2.716753, 0.3444586, -0.8771378, 1, 0, 0, 1, 1,
-2.706135, 1.244641, -0.632802, 1, 0, 0, 1, 1,
-2.692746, -0.1655728, -2.008509, 1, 0, 0, 1, 1,
-2.625921, -0.2493162, -0.4419402, 1, 0, 0, 1, 1,
-2.491388, 0.1018485, -1.563486, 0, 0, 0, 1, 1,
-2.42656, 0.3584055, -0.4750677, 0, 0, 0, 1, 1,
-2.2758, -0.04365109, -1.55899, 0, 0, 0, 1, 1,
-2.224128, -0.7492498, -0.3630414, 0, 0, 0, 1, 1,
-2.217387, -1.949319, -1.547485, 0, 0, 0, 1, 1,
-2.206062, -1.310736, -3.498539, 0, 0, 0, 1, 1,
-2.195759, 0.991416, -1.210476, 0, 0, 0, 1, 1,
-2.129971, 0.1870543, -3.058685, 1, 1, 1, 1, 1,
-2.122508, 0.01503055, -0.9652312, 1, 1, 1, 1, 1,
-2.117178, -1.326097, -0.1320314, 1, 1, 1, 1, 1,
-2.10681, -0.2659539, -2.637924, 1, 1, 1, 1, 1,
-2.098696, -0.6892431, -1.32118, 1, 1, 1, 1, 1,
-2.093648, -1.387922, -3.238664, 1, 1, 1, 1, 1,
-2.046281, 0.1679513, -0.04001723, 1, 1, 1, 1, 1,
-2.028371, 0.3306081, -1.238538, 1, 1, 1, 1, 1,
-2.01895, -0.8741363, -0.6559474, 1, 1, 1, 1, 1,
-1.998585, 1.245785, -0.2896609, 1, 1, 1, 1, 1,
-1.994869, -0.6077908, -2.300333, 1, 1, 1, 1, 1,
-1.962615, 0.1594384, -2.830495, 1, 1, 1, 1, 1,
-1.959025, 1.364007, 0.1098084, 1, 1, 1, 1, 1,
-1.934001, -0.1766065, -1.788396, 1, 1, 1, 1, 1,
-1.892178, -1.073953, -3.817383, 1, 1, 1, 1, 1,
-1.877636, 0.7940644, -3.801867, 0, 0, 1, 1, 1,
-1.872793, 1.88917, -1.348509, 1, 0, 0, 1, 1,
-1.87246, -0.5641137, -2.676465, 1, 0, 0, 1, 1,
-1.868485, -0.8665869, -0.2479344, 1, 0, 0, 1, 1,
-1.843287, -0.4686232, -1.209201, 1, 0, 0, 1, 1,
-1.830186, -0.8979064, -0.5246555, 1, 0, 0, 1, 1,
-1.814804, 1.175167, -1.294773, 0, 0, 0, 1, 1,
-1.813143, 0.4221976, -1.546176, 0, 0, 0, 1, 1,
-1.809053, 0.1752833, -4.278536, 0, 0, 0, 1, 1,
-1.800617, -0.2032365, -2.397712, 0, 0, 0, 1, 1,
-1.799146, -0.2961354, -0.04064686, 0, 0, 0, 1, 1,
-1.7564, -0.1229649, -1.263211, 0, 0, 0, 1, 1,
-1.732392, 0.6204938, -1.541811, 0, 0, 0, 1, 1,
-1.727133, -0.1536311, -3.291762, 1, 1, 1, 1, 1,
-1.726966, 0.1199488, -1.526438, 1, 1, 1, 1, 1,
-1.706854, 0.4223329, -1.408261, 1, 1, 1, 1, 1,
-1.691517, -2.652079, -1.175864, 1, 1, 1, 1, 1,
-1.685985, 1.147685, -0.680223, 1, 1, 1, 1, 1,
-1.685928, 0.1686718, -1.039625, 1, 1, 1, 1, 1,
-1.677101, 0.9208257, -0.8003809, 1, 1, 1, 1, 1,
-1.657272, 0.6523115, -0.9715592, 1, 1, 1, 1, 1,
-1.652111, 0.1655606, -0.6870042, 1, 1, 1, 1, 1,
-1.644848, 0.2870484, -2.487165, 1, 1, 1, 1, 1,
-1.644589, 0.7607426, 0.3431297, 1, 1, 1, 1, 1,
-1.618247, 0.7920051, -1.598794, 1, 1, 1, 1, 1,
-1.61449, -0.4105431, -0.979035, 1, 1, 1, 1, 1,
-1.607532, -1.186387, -3.31753, 1, 1, 1, 1, 1,
-1.602968, 1.100669, -0.8261971, 1, 1, 1, 1, 1,
-1.600713, 0.6720457, -0.7744697, 0, 0, 1, 1, 1,
-1.596085, -0.2286744, -0.7074013, 1, 0, 0, 1, 1,
-1.584276, -2.840492, -3.540539, 1, 0, 0, 1, 1,
-1.583814, 0.1740834, -1.497093, 1, 0, 0, 1, 1,
-1.575385, 1.039791, 0.6490605, 1, 0, 0, 1, 1,
-1.537152, -0.3901579, -1.081009, 1, 0, 0, 1, 1,
-1.515361, -0.1041221, -1.369987, 0, 0, 0, 1, 1,
-1.497396, -0.8457067, -3.17471, 0, 0, 0, 1, 1,
-1.488937, -0.9306283, -4.323288, 0, 0, 0, 1, 1,
-1.479239, 1.001911, -1.100054, 0, 0, 0, 1, 1,
-1.47486, 0.4371837, -0.8760905, 0, 0, 0, 1, 1,
-1.47329, 0.2290426, -2.027238, 0, 0, 0, 1, 1,
-1.471135, 0.1210337, -2.874365, 0, 0, 0, 1, 1,
-1.444428, 0.5678711, -2.168369, 1, 1, 1, 1, 1,
-1.443024, 1.791538, -0.1958276, 1, 1, 1, 1, 1,
-1.442628, -0.1680918, -1.078098, 1, 1, 1, 1, 1,
-1.436903, 0.119482, -1.002282, 1, 1, 1, 1, 1,
-1.426005, -0.842836, -2.987181, 1, 1, 1, 1, 1,
-1.419267, -0.5055549, -2.478856, 1, 1, 1, 1, 1,
-1.412817, 0.7245262, 0.02878986, 1, 1, 1, 1, 1,
-1.402848, -0.7983497, -0.844115, 1, 1, 1, 1, 1,
-1.386642, -0.3577091, 0.4053082, 1, 1, 1, 1, 1,
-1.385283, 1.083773, -0.8596185, 1, 1, 1, 1, 1,
-1.367421, 1.43898, -1.889684, 1, 1, 1, 1, 1,
-1.343035, 0.9316814, 0.2918773, 1, 1, 1, 1, 1,
-1.342915, -0.1946435, -0.7236042, 1, 1, 1, 1, 1,
-1.340935, 0.828248, -2.687162, 1, 1, 1, 1, 1,
-1.34032, 0.9982846, -1.271215, 1, 1, 1, 1, 1,
-1.327047, -1.271701, -3.361604, 0, 0, 1, 1, 1,
-1.323341, -1.047303, -1.951505, 1, 0, 0, 1, 1,
-1.315255, -0.05469244, -0.881787, 1, 0, 0, 1, 1,
-1.304154, 1.108567, -1.643433, 1, 0, 0, 1, 1,
-1.30359, 0.7094344, -0.162577, 1, 0, 0, 1, 1,
-1.302373, -0.0903722, -1.961985, 1, 0, 0, 1, 1,
-1.298627, 0.4365093, -2.004546, 0, 0, 0, 1, 1,
-1.280892, -0.1137379, -0.4004594, 0, 0, 0, 1, 1,
-1.27416, 0.1180874, -0.7262914, 0, 0, 0, 1, 1,
-1.267011, -0.979035, -1.632068, 0, 0, 0, 1, 1,
-1.262562, 1.242351, -1.650034, 0, 0, 0, 1, 1,
-1.261119, -0.4929773, -2.310067, 0, 0, 0, 1, 1,
-1.252021, 0.7723952, -0.2081336, 0, 0, 0, 1, 1,
-1.249811, -1.130888, -1.536065, 1, 1, 1, 1, 1,
-1.246262, -0.03733469, -1.364179, 1, 1, 1, 1, 1,
-1.24449, 1.243566, -2.335513, 1, 1, 1, 1, 1,
-1.240655, -1.452536, -2.563145, 1, 1, 1, 1, 1,
-1.233936, 0.4462917, -1.262377, 1, 1, 1, 1, 1,
-1.232417, -1.31808, -2.669139, 1, 1, 1, 1, 1,
-1.213773, -0.06447543, -2.542559, 1, 1, 1, 1, 1,
-1.210436, -0.4309885, -1.060562, 1, 1, 1, 1, 1,
-1.200693, 0.1267508, -1.066658, 1, 1, 1, 1, 1,
-1.198241, 0.7006654, -1.262551, 1, 1, 1, 1, 1,
-1.192895, 0.2607443, 0.7601452, 1, 1, 1, 1, 1,
-1.192246, 0.5384678, -0.9053771, 1, 1, 1, 1, 1,
-1.177962, -1.48628, -2.317106, 1, 1, 1, 1, 1,
-1.175107, -0.5105267, -1.956471, 1, 1, 1, 1, 1,
-1.1704, 0.1404921, -0.1594065, 1, 1, 1, 1, 1,
-1.168962, 1.565307, -1.046162, 0, 0, 1, 1, 1,
-1.16532, 0.1270329, -2.739538, 1, 0, 0, 1, 1,
-1.16489, 1.58304, -1.381555, 1, 0, 0, 1, 1,
-1.161593, -2.8051, -3.087651, 1, 0, 0, 1, 1,
-1.159039, -1.454461, -2.917528, 1, 0, 0, 1, 1,
-1.157133, 1.402772, 0.4885094, 1, 0, 0, 1, 1,
-1.154243, -0.1783732, 0.01552317, 0, 0, 0, 1, 1,
-1.148996, 0.9349394, -0.2311051, 0, 0, 0, 1, 1,
-1.145128, 1.396367, -1.768085, 0, 0, 0, 1, 1,
-1.143889, -0.7403122, -2.152127, 0, 0, 0, 1, 1,
-1.138311, -1.107226, -2.354877, 0, 0, 0, 1, 1,
-1.133398, -0.4813683, -1.72712, 0, 0, 0, 1, 1,
-1.127097, -0.7333056, -2.362223, 0, 0, 0, 1, 1,
-1.126725, -1.424037, -0.9113997, 1, 1, 1, 1, 1,
-1.126501, -1.381241, -1.924628, 1, 1, 1, 1, 1,
-1.118892, -0.9848637, -1.879983, 1, 1, 1, 1, 1,
-1.095113, 0.02307453, -2.278682, 1, 1, 1, 1, 1,
-1.091545, -1.162048, -2.282221, 1, 1, 1, 1, 1,
-1.084746, -0.9519656, -2.292052, 1, 1, 1, 1, 1,
-1.077245, 0.7928551, -0.3110749, 1, 1, 1, 1, 1,
-1.076917, 0.7659181, 1.267404, 1, 1, 1, 1, 1,
-1.07595, -0.05433824, -1.805757, 1, 1, 1, 1, 1,
-1.072141, -0.2398335, -1.817427, 1, 1, 1, 1, 1,
-1.071694, -1.591867, -1.528866, 1, 1, 1, 1, 1,
-1.066418, -1.598045, -1.514941, 1, 1, 1, 1, 1,
-1.064545, -0.2066903, -1.505338, 1, 1, 1, 1, 1,
-1.063568, 1.058689, -1.902401, 1, 1, 1, 1, 1,
-1.062487, -1.092736, -3.936707, 1, 1, 1, 1, 1,
-1.056671, 1.58436, -0.4232369, 0, 0, 1, 1, 1,
-1.047315, -2.364279, -0.892414, 1, 0, 0, 1, 1,
-1.035522, 1.683744, -1.157727, 1, 0, 0, 1, 1,
-1.031358, -1.049603, -1.834614, 1, 0, 0, 1, 1,
-1.028051, 0.3465394, -1.179853, 1, 0, 0, 1, 1,
-1.023339, 0.5076814, -0.8345253, 1, 0, 0, 1, 1,
-1.02247, 0.4223763, -2.04515, 0, 0, 0, 1, 1,
-1.015079, 1.663043, -0.6694494, 0, 0, 0, 1, 1,
-1.011467, 0.7977084, -0.1667496, 0, 0, 0, 1, 1,
-1.005176, -1.176967, -1.809779, 0, 0, 0, 1, 1,
-1.005109, -0.7761059, -3.046899, 0, 0, 0, 1, 1,
-0.9997921, -0.8943192, -1.653139, 0, 0, 0, 1, 1,
-0.9984982, -0.8780909, -1.697197, 0, 0, 0, 1, 1,
-0.9972855, 1.295167, 1.113114, 1, 1, 1, 1, 1,
-0.9841086, 2.253902, 0.717764, 1, 1, 1, 1, 1,
-0.9827424, -0.4723839, -3.172118, 1, 1, 1, 1, 1,
-0.9824028, 0.3126811, 0.004019021, 1, 1, 1, 1, 1,
-0.9807314, 0.6643298, 1.551806, 1, 1, 1, 1, 1,
-0.9807031, 0.1877449, -3.048769, 1, 1, 1, 1, 1,
-0.9780852, 0.7075525, -2.095731, 1, 1, 1, 1, 1,
-0.9668012, -0.9896053, -3.035724, 1, 1, 1, 1, 1,
-0.9611278, 0.07942013, -2.911846, 1, 1, 1, 1, 1,
-0.9571025, -0.6367543, -1.442754, 1, 1, 1, 1, 1,
-0.952417, 0.1144973, -2.429233, 1, 1, 1, 1, 1,
-0.9521579, 0.2230163, -1.433478, 1, 1, 1, 1, 1,
-0.9503393, 2.131175, -0.4325254, 1, 1, 1, 1, 1,
-0.9493169, 0.6794807, -1.130648, 1, 1, 1, 1, 1,
-0.9429373, -0.6089747, -2.690631, 1, 1, 1, 1, 1,
-0.9355776, -0.1568162, -1.888907, 0, 0, 1, 1, 1,
-0.9316566, -0.9862354, -0.6424358, 1, 0, 0, 1, 1,
-0.9296088, 0.8494318, -0.7042176, 1, 0, 0, 1, 1,
-0.9281664, 0.8969464, -1.195369, 1, 0, 0, 1, 1,
-0.9254203, 0.3846772, -0.8882177, 1, 0, 0, 1, 1,
-0.9248258, 0.8299592, 0.5434574, 1, 0, 0, 1, 1,
-0.9218074, -0.5708356, -0.6588147, 0, 0, 0, 1, 1,
-0.9195921, -0.8330325, -3.699377, 0, 0, 0, 1, 1,
-0.9173011, 0.2105133, -0.7977502, 0, 0, 0, 1, 1,
-0.9156199, -0.5728968, -2.544841, 0, 0, 0, 1, 1,
-0.9148744, -0.3567046, -0.5765772, 0, 0, 0, 1, 1,
-0.9119469, -0.3460544, -2.395838, 0, 0, 0, 1, 1,
-0.9093802, 0.6427804, -0.6853329, 0, 0, 0, 1, 1,
-0.9079191, 0.543538, -0.8014954, 1, 1, 1, 1, 1,
-0.9063099, 0.1789749, -0.6991775, 1, 1, 1, 1, 1,
-0.9023395, 1.20121, -0.4385395, 1, 1, 1, 1, 1,
-0.8959709, 2.098849, 0.8845928, 1, 1, 1, 1, 1,
-0.894675, 0.3370869, -2.184687, 1, 1, 1, 1, 1,
-0.8935077, -1.620309, -3.483491, 1, 1, 1, 1, 1,
-0.8880947, -0.9729797, -2.865127, 1, 1, 1, 1, 1,
-0.887401, -0.3278997, -2.954194, 1, 1, 1, 1, 1,
-0.8871233, 0.02355576, -1.5406, 1, 1, 1, 1, 1,
-0.8804426, -0.03206408, -1.017129, 1, 1, 1, 1, 1,
-0.8800839, 0.8432525, -1.141716, 1, 1, 1, 1, 1,
-0.878631, 0.5606169, -0.2812143, 1, 1, 1, 1, 1,
-0.8758001, -1.459286, -2.455003, 1, 1, 1, 1, 1,
-0.8745257, 0.9895769, -0.0842934, 1, 1, 1, 1, 1,
-0.8713161, -1.724506, -2.555621, 1, 1, 1, 1, 1,
-0.8705753, -0.2462483, -3.822228, 0, 0, 1, 1, 1,
-0.8687227, -0.4058964, -2.854488, 1, 0, 0, 1, 1,
-0.8668756, 0.9765286, -1.834675, 1, 0, 0, 1, 1,
-0.8641135, -0.349897, -1.485668, 1, 0, 0, 1, 1,
-0.8640171, 0.6748982, -0.8452204, 1, 0, 0, 1, 1,
-0.8620924, 1.399801, -1.544766, 1, 0, 0, 1, 1,
-0.8612351, 0.3573735, -2.033141, 0, 0, 0, 1, 1,
-0.8604767, 1.946577, -0.3170543, 0, 0, 0, 1, 1,
-0.8559713, 0.0776171, -1.386696, 0, 0, 0, 1, 1,
-0.8546512, 2.132744, 0.3675773, 0, 0, 0, 1, 1,
-0.8535264, -0.2150934, -2.574442, 0, 0, 0, 1, 1,
-0.8499072, 1.122245, -1.169694, 0, 0, 0, 1, 1,
-0.8470886, -0.04465618, -1.304584, 0, 0, 0, 1, 1,
-0.8438329, 1.182285, -1.405432, 1, 1, 1, 1, 1,
-0.8396221, -0.8900749, -4.426658, 1, 1, 1, 1, 1,
-0.836522, 0.1377783, -2.020777, 1, 1, 1, 1, 1,
-0.8364271, 0.4534959, 1.177701, 1, 1, 1, 1, 1,
-0.8357415, 0.9288496, -2.167862, 1, 1, 1, 1, 1,
-0.831467, -1.226468, -3.848825, 1, 1, 1, 1, 1,
-0.827004, -0.3306322, -3.113888, 1, 1, 1, 1, 1,
-0.8198991, -0.3816306, -2.516041, 1, 1, 1, 1, 1,
-0.8126224, 0.1956501, -2.427099, 1, 1, 1, 1, 1,
-0.8094735, 0.06142796, -0.9591566, 1, 1, 1, 1, 1,
-0.8054818, -0.4852147, -1.107165, 1, 1, 1, 1, 1,
-0.8049434, 1.472212, 2.084061, 1, 1, 1, 1, 1,
-0.8036538, -2.211064, -2.623067, 1, 1, 1, 1, 1,
-0.8029739, -0.6497564, -2.655447, 1, 1, 1, 1, 1,
-0.7996533, 0.9395968, -1.724038, 1, 1, 1, 1, 1,
-0.7957289, -0.6313168, -1.318186, 0, 0, 1, 1, 1,
-0.7943341, -0.5882629, -3.303389, 1, 0, 0, 1, 1,
-0.793466, 1.389481, -0.4732059, 1, 0, 0, 1, 1,
-0.7922445, -1.194872, -1.257051, 1, 0, 0, 1, 1,
-0.78757, -1.153225, -2.274453, 1, 0, 0, 1, 1,
-0.7808706, 0.07185186, -2.314638, 1, 0, 0, 1, 1,
-0.7709888, -1.730338, -2.029211, 0, 0, 0, 1, 1,
-0.7658603, -0.257621, -1.770232, 0, 0, 0, 1, 1,
-0.7463555, 1.27702, -0.4020734, 0, 0, 0, 1, 1,
-0.7444485, 0.2973216, -2.164563, 0, 0, 0, 1, 1,
-0.743257, 1.66243, -1.672296, 0, 0, 0, 1, 1,
-0.7389797, 0.8770487, 0.02725155, 0, 0, 0, 1, 1,
-0.7337276, -1.144766, -3.89274, 0, 0, 0, 1, 1,
-0.7249134, -0.1954074, -2.538107, 1, 1, 1, 1, 1,
-0.7181256, 1.374234, -0.439824, 1, 1, 1, 1, 1,
-0.7147331, -0.3807743, -2.062784, 1, 1, 1, 1, 1,
-0.7111097, -0.6203805, -1.255349, 1, 1, 1, 1, 1,
-0.7043654, 1.358782, -0.02781344, 1, 1, 1, 1, 1,
-0.6982104, 0.775739, 0.3890349, 1, 1, 1, 1, 1,
-0.6889358, -1.909928, -1.282887, 1, 1, 1, 1, 1,
-0.6878589, 0.5362085, 0.8673155, 1, 1, 1, 1, 1,
-0.6877832, 0.7046449, -0.8686473, 1, 1, 1, 1, 1,
-0.6861917, -0.371694, 0.8329983, 1, 1, 1, 1, 1,
-0.683157, 1.209187, -1.258217, 1, 1, 1, 1, 1,
-0.6830735, -1.312545, -2.308147, 1, 1, 1, 1, 1,
-0.681648, 0.9497577, 0.4634059, 1, 1, 1, 1, 1,
-0.6772153, -1.305107, -2.099781, 1, 1, 1, 1, 1,
-0.6668887, -1.263001, -3.01419, 1, 1, 1, 1, 1,
-0.6634682, 0.5345626, -0.336161, 0, 0, 1, 1, 1,
-0.6597448, 0.2126304, -0.5112723, 1, 0, 0, 1, 1,
-0.6575304, -0.07246546, -0.353757, 1, 0, 0, 1, 1,
-0.6542906, 0.9599687, 0.09311745, 1, 0, 0, 1, 1,
-0.6377046, 0.2659769, -2.189102, 1, 0, 0, 1, 1,
-0.6376574, -1.235723, -2.66784, 1, 0, 0, 1, 1,
-0.6373819, 0.5105289, -1.313223, 0, 0, 0, 1, 1,
-0.6330683, -1.397016, -3.199256, 0, 0, 0, 1, 1,
-0.6315293, -1.445935, -2.786402, 0, 0, 0, 1, 1,
-0.6295562, 0.0730536, -2.68103, 0, 0, 0, 1, 1,
-0.6248267, -0.5433711, -1.395897, 0, 0, 0, 1, 1,
-0.6235636, -0.08607163, -1.075657, 0, 0, 0, 1, 1,
-0.6215573, 1.197196, 0.07327315, 0, 0, 0, 1, 1,
-0.6169682, 0.7612147, -1.968587, 1, 1, 1, 1, 1,
-0.6099237, -1.567305, -2.775177, 1, 1, 1, 1, 1,
-0.60965, -0.5915599, -3.611632, 1, 1, 1, 1, 1,
-0.6078726, -0.412254, -1.311297, 1, 1, 1, 1, 1,
-0.606867, -0.3868821, -3.3614, 1, 1, 1, 1, 1,
-0.6040725, -0.941272, -3.467088, 1, 1, 1, 1, 1,
-0.6020642, -0.1515347, -1.885883, 1, 1, 1, 1, 1,
-0.5952356, -1.397016, -2.803801, 1, 1, 1, 1, 1,
-0.5935738, -2.105502, -2.170435, 1, 1, 1, 1, 1,
-0.5874113, 1.032424, 0.01687832, 1, 1, 1, 1, 1,
-0.5848802, 0.04659105, -1.937429, 1, 1, 1, 1, 1,
-0.5818556, -0.1314964, -3.04792, 1, 1, 1, 1, 1,
-0.5807287, 0.1779979, -0.6471359, 1, 1, 1, 1, 1,
-0.5747886, -0.3498773, -1.571688, 1, 1, 1, 1, 1,
-0.5687478, 0.06598147, -0.2597832, 1, 1, 1, 1, 1,
-0.5604063, -0.7389107, -2.854795, 0, 0, 1, 1, 1,
-0.5593668, -0.8683259, -3.038083, 1, 0, 0, 1, 1,
-0.5591254, 0.2390775, -1.520584, 1, 0, 0, 1, 1,
-0.5499161, -0.8535182, -1.59796, 1, 0, 0, 1, 1,
-0.540459, 0.6235663, 0.08918604, 1, 0, 0, 1, 1,
-0.5382931, 0.08555442, -0.7035229, 1, 0, 0, 1, 1,
-0.5327252, 0.3424519, 0.0421799, 0, 0, 0, 1, 1,
-0.5292678, 1.483643, 0.5529324, 0, 0, 0, 1, 1,
-0.5287581, 1.141271, -1.105435, 0, 0, 0, 1, 1,
-0.5282221, -1.031292, -2.863632, 0, 0, 0, 1, 1,
-0.5235618, -0.4676342, -1.842584, 0, 0, 0, 1, 1,
-0.5191896, 0.1136282, -2.231637, 0, 0, 0, 1, 1,
-0.5131137, 0.942946, 0.1891284, 0, 0, 0, 1, 1,
-0.5103788, -1.103021, -1.985176, 1, 1, 1, 1, 1,
-0.5082951, 0.5649703, -1.457266, 1, 1, 1, 1, 1,
-0.5036662, 0.0118653, -0.07410616, 1, 1, 1, 1, 1,
-0.4975337, 0.7292787, 1.310622, 1, 1, 1, 1, 1,
-0.497229, 1.231897, 0.3299404, 1, 1, 1, 1, 1,
-0.4971353, -0.4160457, -0.1422757, 1, 1, 1, 1, 1,
-0.4920984, 1.000638, -0.7345597, 1, 1, 1, 1, 1,
-0.4883922, -0.2304561, -1.889437, 1, 1, 1, 1, 1,
-0.4807519, -1.006316, -2.285304, 1, 1, 1, 1, 1,
-0.4769921, 1.148492, -1.318231, 1, 1, 1, 1, 1,
-0.4723508, 1.173554, 0.3978789, 1, 1, 1, 1, 1,
-0.4700966, 1.182145, -0.03863346, 1, 1, 1, 1, 1,
-0.4699224, 0.764225, 0.6958303, 1, 1, 1, 1, 1,
-0.4641985, 0.3982926, -2.271354, 1, 1, 1, 1, 1,
-0.4638528, 0.8761966, 1.382061, 1, 1, 1, 1, 1,
-0.4582596, -0.9595972, -1.151916, 0, 0, 1, 1, 1,
-0.4578715, 1.21604, -0.05366753, 1, 0, 0, 1, 1,
-0.4557368, -0.09523764, -1.783093, 1, 0, 0, 1, 1,
-0.4539017, -0.9324244, -3.451673, 1, 0, 0, 1, 1,
-0.4505038, -0.002120403, -0.2984267, 1, 0, 0, 1, 1,
-0.4504139, 0.1598551, -1.526544, 1, 0, 0, 1, 1,
-0.4482685, 0.7184374, 0.4023676, 0, 0, 0, 1, 1,
-0.4460086, -0.7100219, -2.194455, 0, 0, 0, 1, 1,
-0.4442474, -0.6447752, -3.641713, 0, 0, 0, 1, 1,
-0.4441786, 1.317311, -0.01279818, 0, 0, 0, 1, 1,
-0.4396294, -1.371706, -3.999852, 0, 0, 0, 1, 1,
-0.4346558, 1.84731, -1.031262, 0, 0, 0, 1, 1,
-0.4334275, 0.8969765, 0.1821413, 0, 0, 0, 1, 1,
-0.4305596, 1.518248, -0.09220661, 1, 1, 1, 1, 1,
-0.4261835, 0.2417186, -0.8254745, 1, 1, 1, 1, 1,
-0.4220248, 0.2899369, -0.5887346, 1, 1, 1, 1, 1,
-0.4214195, -0.5032837, -0.8870695, 1, 1, 1, 1, 1,
-0.4196607, 0.08144507, -2.803187, 1, 1, 1, 1, 1,
-0.4185571, 0.8280888, -1.160812, 1, 1, 1, 1, 1,
-0.4123542, -0.8585426, -2.276818, 1, 1, 1, 1, 1,
-0.412194, -1.423338, -2.855617, 1, 1, 1, 1, 1,
-0.412149, 0.01462829, -0.7375017, 1, 1, 1, 1, 1,
-0.4092775, -0.7179095, -1.598431, 1, 1, 1, 1, 1,
-0.4078479, -0.1644659, -3.495317, 1, 1, 1, 1, 1,
-0.401492, -1.299718, -2.054122, 1, 1, 1, 1, 1,
-0.4011428, 1.962099, -0.7415811, 1, 1, 1, 1, 1,
-0.4008866, -1.338325, -3.543204, 1, 1, 1, 1, 1,
-0.3962975, -0.2488701, -2.131059, 1, 1, 1, 1, 1,
-0.3938141, -1.82636, -3.023125, 0, 0, 1, 1, 1,
-0.393392, -0.1910289, -3.29517, 1, 0, 0, 1, 1,
-0.3929206, -0.3347984, -1.478478, 1, 0, 0, 1, 1,
-0.3921991, 0.9533972, -0.3542011, 1, 0, 0, 1, 1,
-0.3902927, 0.6679829, -1.198037, 1, 0, 0, 1, 1,
-0.3876894, 0.9700743, -1.474935, 1, 0, 0, 1, 1,
-0.3835933, -0.7612958, -2.713096, 0, 0, 0, 1, 1,
-0.3788231, -1.151829, -4.083716, 0, 0, 0, 1, 1,
-0.3779103, -1.362934, -2.375214, 0, 0, 0, 1, 1,
-0.3758157, 1.23771, -2.038523, 0, 0, 0, 1, 1,
-0.3754886, 0.6244311, -0.03674749, 0, 0, 0, 1, 1,
-0.3727995, -2.26417, -2.974523, 0, 0, 0, 1, 1,
-0.3722336, 3.720356, 1.072625, 0, 0, 0, 1, 1,
-0.3686971, 2.043023, 0.08308195, 1, 1, 1, 1, 1,
-0.3681173, 0.4700216, -2.084788, 1, 1, 1, 1, 1,
-0.3581862, -0.4165525, -1.972504, 1, 1, 1, 1, 1,
-0.3542246, 1.907948, -0.4575047, 1, 1, 1, 1, 1,
-0.3536642, 1.032784, -0.744126, 1, 1, 1, 1, 1,
-0.3508759, -0.6001118, -2.541899, 1, 1, 1, 1, 1,
-0.3471517, 0.0804112, 1.338351, 1, 1, 1, 1, 1,
-0.3363652, 0.005114696, -2.352234, 1, 1, 1, 1, 1,
-0.3330875, 0.7204514, 0.7881561, 1, 1, 1, 1, 1,
-0.3323294, 0.8483841, 0.1419567, 1, 1, 1, 1, 1,
-0.3300713, 0.2059463, -1.118519, 1, 1, 1, 1, 1,
-0.327673, 0.2160949, -1.016129, 1, 1, 1, 1, 1,
-0.327173, -1.005798, -2.653077, 1, 1, 1, 1, 1,
-0.3243626, 1.69827, -0.1206384, 1, 1, 1, 1, 1,
-0.320938, -0.4870996, -3.195946, 1, 1, 1, 1, 1,
-0.3169945, 0.3179421, -2.469497, 0, 0, 1, 1, 1,
-0.3124494, -1.829313, -2.530495, 1, 0, 0, 1, 1,
-0.3083176, -0.686051, -1.563358, 1, 0, 0, 1, 1,
-0.3081535, -0.4463544, -3.085192, 1, 0, 0, 1, 1,
-0.3059333, 0.412405, -0.946153, 1, 0, 0, 1, 1,
-0.3055201, 0.4975692, -1.196146, 1, 0, 0, 1, 1,
-0.304566, 2.221864, 1.080549, 0, 0, 0, 1, 1,
-0.3036152, -0.4066458, -5.094507, 0, 0, 0, 1, 1,
-0.3023674, -1.177715, -3.968292, 0, 0, 0, 1, 1,
-0.2999766, 1.317069, -1.858789, 0, 0, 0, 1, 1,
-0.2989796, -0.539782, -1.866708, 0, 0, 0, 1, 1,
-0.2971936, 0.147881, -2.42475, 0, 0, 0, 1, 1,
-0.2966484, 0.2908631, -3.127775, 0, 0, 0, 1, 1,
-0.2953986, -0.1686449, -2.8459, 1, 1, 1, 1, 1,
-0.295283, -0.06965356, -2.963296, 1, 1, 1, 1, 1,
-0.2917825, 0.1409153, 0.1350685, 1, 1, 1, 1, 1,
-0.2896601, 1.822642, 0.6950018, 1, 1, 1, 1, 1,
-0.2889277, 1.68425, 0.3120205, 1, 1, 1, 1, 1,
-0.2851759, -0.01869756, -2.34935, 1, 1, 1, 1, 1,
-0.2827586, 0.2336717, -0.4838748, 1, 1, 1, 1, 1,
-0.2815908, -0.7502783, -3.312287, 1, 1, 1, 1, 1,
-0.2810541, 0.2390154, 0.657155, 1, 1, 1, 1, 1,
-0.2738102, -1.249618, -1.348242, 1, 1, 1, 1, 1,
-0.2715599, -1.460071, -1.836864, 1, 1, 1, 1, 1,
-0.2705704, 0.9716173, -1.425672, 1, 1, 1, 1, 1,
-0.2690138, 1.188259, -0.8532125, 1, 1, 1, 1, 1,
-0.2667292, 0.3384771, 0.1050708, 1, 1, 1, 1, 1,
-0.2645665, -0.288112, -1.03195, 1, 1, 1, 1, 1,
-0.2573102, -0.02266036, -2.490684, 0, 0, 1, 1, 1,
-0.2570475, 0.2018506, -0.6123686, 1, 0, 0, 1, 1,
-0.2552206, 0.0957485, -1.553161, 1, 0, 0, 1, 1,
-0.2525986, 0.7750422, 0.05250223, 1, 0, 0, 1, 1,
-0.2511367, -0.3651493, -2.205644, 1, 0, 0, 1, 1,
-0.2502051, -1.618646, -3.769145, 1, 0, 0, 1, 1,
-0.2486392, -0.4766533, -2.409786, 0, 0, 0, 1, 1,
-0.246461, -0.3418407, -0.5545516, 0, 0, 0, 1, 1,
-0.2428405, 0.2201328, -1.204967, 0, 0, 0, 1, 1,
-0.2387485, -1.683883, -4.449391, 0, 0, 0, 1, 1,
-0.2383906, 0.1298473, -0.168915, 0, 0, 0, 1, 1,
-0.2373665, -1.43133, -2.411357, 0, 0, 0, 1, 1,
-0.2365391, 0.9874654, -1.405788, 0, 0, 0, 1, 1,
-0.234929, 1.173542, -0.1719237, 1, 1, 1, 1, 1,
-0.232854, -0.4624227, -3.67285, 1, 1, 1, 1, 1,
-0.2308747, -0.5660086, -4.637896, 1, 1, 1, 1, 1,
-0.2305011, 0.2820236, -0.8485995, 1, 1, 1, 1, 1,
-0.2294284, -0.9105841, -3.050596, 1, 1, 1, 1, 1,
-0.2105909, -0.6965417, -4.760145, 1, 1, 1, 1, 1,
-0.2063221, -1.019067, -4.212197, 1, 1, 1, 1, 1,
-0.2059888, 0.5438657, 0.4113692, 1, 1, 1, 1, 1,
-0.2058203, 0.9878633, -2.232561, 1, 1, 1, 1, 1,
-0.2042321, 0.8601888, 0.4314676, 1, 1, 1, 1, 1,
-0.203965, -1.488336, -3.227937, 1, 1, 1, 1, 1,
-0.2010442, 0.9235098, -0.4484012, 1, 1, 1, 1, 1,
-0.2002023, -1.556479, -2.273188, 1, 1, 1, 1, 1,
-0.1958269, 0.7278223, -1.189266, 1, 1, 1, 1, 1,
-0.1942441, -0.7972727, -1.955291, 1, 1, 1, 1, 1,
-0.1921099, 1.216194, -0.3097493, 0, 0, 1, 1, 1,
-0.1860735, 1.801974, 0.4061024, 1, 0, 0, 1, 1,
-0.1856648, 0.3823826, -1.397724, 1, 0, 0, 1, 1,
-0.1856216, 0.1586988, -0.0690539, 1, 0, 0, 1, 1,
-0.1820331, 0.8440315, 1.011168, 1, 0, 0, 1, 1,
-0.1806427, -1.476458, -2.772223, 1, 0, 0, 1, 1,
-0.1804951, -1.041542, -1.94515, 0, 0, 0, 1, 1,
-0.1789328, -0.09607575, -1.922888, 0, 0, 0, 1, 1,
-0.1777494, 2.095764, 0.3925332, 0, 0, 0, 1, 1,
-0.1770522, -1.866748, -2.28159, 0, 0, 0, 1, 1,
-0.174563, -0.09826867, -0.7995808, 0, 0, 0, 1, 1,
-0.1715336, -0.4852042, -0.6619632, 0, 0, 0, 1, 1,
-0.1694466, -0.9929025, -2.302478, 0, 0, 0, 1, 1,
-0.168962, -0.5366775, -2.480253, 1, 1, 1, 1, 1,
-0.1627919, 0.4368377, -0.8326513, 1, 1, 1, 1, 1,
-0.1615255, 0.8025101, -1.376853, 1, 1, 1, 1, 1,
-0.1597745, -0.05505038, -1.612328, 1, 1, 1, 1, 1,
-0.1569283, 1.7716, -1.018449, 1, 1, 1, 1, 1,
-0.1557785, 0.4293008, -1.384164, 1, 1, 1, 1, 1,
-0.1552083, -0.5035319, -3.543263, 1, 1, 1, 1, 1,
-0.1531615, -0.2958565, -2.004284, 1, 1, 1, 1, 1,
-0.1504979, 1.435951, 0.03708872, 1, 1, 1, 1, 1,
-0.1502983, -1.354496, -4.229558, 1, 1, 1, 1, 1,
-0.1473367, 0.2684099, -1.529838, 1, 1, 1, 1, 1,
-0.1471387, -0.6813619, -2.636634, 1, 1, 1, 1, 1,
-0.145644, -1.36384, -4.626395, 1, 1, 1, 1, 1,
-0.1417164, 0.06160469, -1.465297, 1, 1, 1, 1, 1,
-0.1395747, -1.14448, -4.955391, 1, 1, 1, 1, 1,
-0.1361241, -0.2287359, -3.884573, 0, 0, 1, 1, 1,
-0.1357125, -1.799902, -2.875006, 1, 0, 0, 1, 1,
-0.1346574, -0.8269657, -2.001559, 1, 0, 0, 1, 1,
-0.1342069, 0.211142, 0.8499298, 1, 0, 0, 1, 1,
-0.1322984, -0.673088, -3.03606, 1, 0, 0, 1, 1,
-0.1304886, -1.01022, -1.368542, 1, 0, 0, 1, 1,
-0.1268393, 0.4529878, -0.1395394, 0, 0, 0, 1, 1,
-0.1192107, -0.6023813, -2.803211, 0, 0, 0, 1, 1,
-0.1162809, -0.9397237, -1.790877, 0, 0, 0, 1, 1,
-0.1134999, 1.429818, 0.7189453, 0, 0, 0, 1, 1,
-0.1094546, -0.03855419, -1.69606, 0, 0, 0, 1, 1,
-0.1079769, 0.7785521, 0.9823406, 0, 0, 0, 1, 1,
-0.1035629, 0.6146538, -0.6492598, 0, 0, 0, 1, 1,
-0.09942831, 1.042106, -0.6637618, 1, 1, 1, 1, 1,
-0.09476961, -0.3963122, -2.492157, 1, 1, 1, 1, 1,
-0.08913118, -0.3591182, -3.689267, 1, 1, 1, 1, 1,
-0.08404386, -0.5659592, -1.553444, 1, 1, 1, 1, 1,
-0.07863978, -1.647611, -4.501968, 1, 1, 1, 1, 1,
-0.07763739, -0.4954791, -5.072267, 1, 1, 1, 1, 1,
-0.0720897, 0.6852688, -0.6094963, 1, 1, 1, 1, 1,
-0.07124738, 0.19569, -0.4203419, 1, 1, 1, 1, 1,
-0.07104723, -1.10713, -4.29372, 1, 1, 1, 1, 1,
-0.06937274, -1.498348, -3.678524, 1, 1, 1, 1, 1,
-0.06852406, -1.609202, -2.2626, 1, 1, 1, 1, 1,
-0.06555599, 1.238252, -0.2714368, 1, 1, 1, 1, 1,
-0.06455675, 0.5994347, -1.033449, 1, 1, 1, 1, 1,
-0.06260666, -0.8990515, -3.604284, 1, 1, 1, 1, 1,
-0.06102291, 0.07696126, -1.256309, 1, 1, 1, 1, 1,
-0.05676303, -0.5656958, -2.922066, 0, 0, 1, 1, 1,
-0.05521362, 0.8698229, 0.6108092, 1, 0, 0, 1, 1,
-0.05410463, 1.060245, 0.009616338, 1, 0, 0, 1, 1,
-0.04529158, 0.1957607, 0.4228055, 1, 0, 0, 1, 1,
-0.03763039, -1.673412, -1.59261, 1, 0, 0, 1, 1,
-0.02918668, 0.4333954, 0.8151527, 1, 0, 0, 1, 1,
-0.02799117, 1.326011, -1.079355, 0, 0, 0, 1, 1,
-0.02716747, -0.7714632, -2.590866, 0, 0, 0, 1, 1,
-0.02474269, 1.180082, -0.2102415, 0, 0, 0, 1, 1,
-0.02428096, -1.171267, -1.218894, 0, 0, 0, 1, 1,
-0.02261105, 1.355369, 0.80071, 0, 0, 0, 1, 1,
-0.02101391, -1.888014, -1.683187, 0, 0, 0, 1, 1,
-0.01958117, 0.450465, -1.517567, 0, 0, 0, 1, 1,
-0.01605409, -1.486716, -4.028999, 1, 1, 1, 1, 1,
-0.009430405, -0.2341601, -3.38945, 1, 1, 1, 1, 1,
-0.006681411, -1.2697, -5.353746, 1, 1, 1, 1, 1,
-0.004996931, 0.5875632, 0.2715375, 1, 1, 1, 1, 1,
-0.003118192, -0.6823012, -3.404093, 1, 1, 1, 1, 1,
-0.001237964, -1.119173, -3.330235, 1, 1, 1, 1, 1,
0.002098081, -1.978895, 4.431774, 1, 1, 1, 1, 1,
0.003380516, 1.013931, -0.5815606, 1, 1, 1, 1, 1,
0.00360561, -0.2688309, 1.305749, 1, 1, 1, 1, 1,
0.007890575, 1.860619, -0.7496817, 1, 1, 1, 1, 1,
0.01296546, 1.215961, 0.6115813, 1, 1, 1, 1, 1,
0.01397728, 0.7581351, -0.2068938, 1, 1, 1, 1, 1,
0.01989066, 0.07320797, 0.6473006, 1, 1, 1, 1, 1,
0.03140656, -1.307973, 3.180691, 1, 1, 1, 1, 1,
0.03685151, -0.7844004, 1.497108, 1, 1, 1, 1, 1,
0.04221347, 0.2949656, 1.509843, 0, 0, 1, 1, 1,
0.04684115, 0.5356328, -1.428923, 1, 0, 0, 1, 1,
0.04755946, -0.4481412, 3.778106, 1, 0, 0, 1, 1,
0.04894254, -2.253214, 2.723446, 1, 0, 0, 1, 1,
0.04960587, -0.5845026, 1.424158, 1, 0, 0, 1, 1,
0.05108666, 0.07369431, 0.07705136, 1, 0, 0, 1, 1,
0.05844062, -1.553625, 2.139394, 0, 0, 0, 1, 1,
0.06098106, -1.525851, 4.435099, 0, 0, 0, 1, 1,
0.06430507, 0.7920233, 0.9179163, 0, 0, 0, 1, 1,
0.06601881, -0.842541, 4.394131, 0, 0, 0, 1, 1,
0.06871552, 0.5736091, 3.993808, 0, 0, 0, 1, 1,
0.07315885, 0.1853848, 1.190816, 0, 0, 0, 1, 1,
0.07667968, -0.9114231, 1.798878, 0, 0, 0, 1, 1,
0.0773855, 0.2634465, 0.1354433, 1, 1, 1, 1, 1,
0.07837465, 0.7180857, -0.6522761, 1, 1, 1, 1, 1,
0.08053518, 0.8944913, 0.481246, 1, 1, 1, 1, 1,
0.08317242, 0.7854453, -0.936605, 1, 1, 1, 1, 1,
0.08405423, -0.4759401, 4.311597, 1, 1, 1, 1, 1,
0.08503543, -1.605418, 3.936403, 1, 1, 1, 1, 1,
0.08753291, 0.7541464, 0.0965055, 1, 1, 1, 1, 1,
0.08922292, 0.5529178, -0.06779962, 1, 1, 1, 1, 1,
0.09351009, -0.6124196, 4.307837, 1, 1, 1, 1, 1,
0.09683121, -0.5918995, 1.786255, 1, 1, 1, 1, 1,
0.1066064, -1.446274, 2.78741, 1, 1, 1, 1, 1,
0.1085032, -0.6444904, 2.342544, 1, 1, 1, 1, 1,
0.1099651, -1.057359, 3.066737, 1, 1, 1, 1, 1,
0.112859, -1.576662, 4.740702, 1, 1, 1, 1, 1,
0.1132998, -0.6183234, 3.07134, 1, 1, 1, 1, 1,
0.116538, -1.027699, 1.867148, 0, 0, 1, 1, 1,
0.1170833, -0.5484548, 1.992342, 1, 0, 0, 1, 1,
0.1213768, 0.02972076, 0.1263724, 1, 0, 0, 1, 1,
0.1231515, 0.4442257, 0.939585, 1, 0, 0, 1, 1,
0.1247815, 0.7044028, -0.4154133, 1, 0, 0, 1, 1,
0.1284604, -2.057842, 3.789108, 1, 0, 0, 1, 1,
0.1356337, -0.8379797, 3.419884, 0, 0, 0, 1, 1,
0.1357666, -0.9872665, 1.867358, 0, 0, 0, 1, 1,
0.1362826, -0.04976075, 2.93123, 0, 0, 0, 1, 1,
0.1373858, 1.430586, 1.644656, 0, 0, 0, 1, 1,
0.1405908, 0.1370967, 1.021814, 0, 0, 0, 1, 1,
0.1413007, 0.06273412, 0.7893158, 0, 0, 0, 1, 1,
0.1420823, 1.779342, 0.1887677, 0, 0, 0, 1, 1,
0.1448442, 1.289869, 1.858361, 1, 1, 1, 1, 1,
0.1453504, 0.1925889, 1.531145, 1, 1, 1, 1, 1,
0.150934, -0.9530928, 3.680841, 1, 1, 1, 1, 1,
0.1518879, -0.4544468, 1.424641, 1, 1, 1, 1, 1,
0.1534625, -0.9393651, 2.842514, 1, 1, 1, 1, 1,
0.1544539, -0.8647538, 0.9889532, 1, 1, 1, 1, 1,
0.1545139, 0.9608067, 0.364271, 1, 1, 1, 1, 1,
0.15482, -1.35267, 3.15369, 1, 1, 1, 1, 1,
0.1557125, 0.5437633, 0.7033076, 1, 1, 1, 1, 1,
0.1599664, 2.091783, -0.9835365, 1, 1, 1, 1, 1,
0.1615044, 0.785792, 1.233997, 1, 1, 1, 1, 1,
0.1641466, 0.5825024, 2.65079, 1, 1, 1, 1, 1,
0.1660919, -0.4196899, 2.283652, 1, 1, 1, 1, 1,
0.1683539, 0.7301109, -0.2223505, 1, 1, 1, 1, 1,
0.169167, 0.6368369, 0.06024596, 1, 1, 1, 1, 1,
0.170091, -0.8595505, 4.723339, 0, 0, 1, 1, 1,
0.1738669, 1.716733, 0.6304354, 1, 0, 0, 1, 1,
0.1762699, 0.9665808, 1.434725, 1, 0, 0, 1, 1,
0.1777314, 1.241952, 0.5458898, 1, 0, 0, 1, 1,
0.1794068, 0.4448653, -2.120148, 1, 0, 0, 1, 1,
0.1821335, -1.693105, 3.853474, 1, 0, 0, 1, 1,
0.1840579, 0.8363898, 1.626089, 0, 0, 0, 1, 1,
0.1861876, 0.4381143, 0.5920919, 0, 0, 0, 1, 1,
0.1868974, -0.2544302, 3.919967, 0, 0, 0, 1, 1,
0.1877501, -0.7809672, 2.14433, 0, 0, 0, 1, 1,
0.1912542, -0.2036706, 4.256385, 0, 0, 0, 1, 1,
0.1949929, 0.5159228, -0.4276658, 0, 0, 0, 1, 1,
0.1962319, 1.808558, -0.3962306, 0, 0, 0, 1, 1,
0.1972201, 0.01635885, 2.881718, 1, 1, 1, 1, 1,
0.1974437, 0.7204173, 0.2663567, 1, 1, 1, 1, 1,
0.1998461, 0.331221, 2.932205, 1, 1, 1, 1, 1,
0.2040853, -0.5460929, 3.765142, 1, 1, 1, 1, 1,
0.2060865, 1.031522, 0.9349021, 1, 1, 1, 1, 1,
0.2097666, -1.621953, 3.823993, 1, 1, 1, 1, 1,
0.2132629, 0.06919318, 1.593892, 1, 1, 1, 1, 1,
0.2178155, -0.8769821, 1.50491, 1, 1, 1, 1, 1,
0.2223507, 0.1430415, -0.4711486, 1, 1, 1, 1, 1,
0.2254295, 0.6374069, -1.394805, 1, 1, 1, 1, 1,
0.2261311, 0.1998322, -0.3585737, 1, 1, 1, 1, 1,
0.2286759, 0.1431721, 1.339837, 1, 1, 1, 1, 1,
0.2371487, 2.216895, 0.003922904, 1, 1, 1, 1, 1,
0.2430403, 0.02117663, 2.815349, 1, 1, 1, 1, 1,
0.2433091, -1.032697, 2.789932, 1, 1, 1, 1, 1,
0.2450647, -0.2991547, 2.2569, 0, 0, 1, 1, 1,
0.256029, 0.07499347, 1.710916, 1, 0, 0, 1, 1,
0.2657632, 1.319404, 2.117261, 1, 0, 0, 1, 1,
0.2668313, 0.5133771, 0.1800142, 1, 0, 0, 1, 1,
0.2678967, -0.4480833, 2.555522, 1, 0, 0, 1, 1,
0.269908, 1.851235, 2.148464, 1, 0, 0, 1, 1,
0.2745749, 1.33338, 0.2695142, 0, 0, 0, 1, 1,
0.2750953, -0.1554257, 2.662249, 0, 0, 0, 1, 1,
0.2756313, -1.56837, 2.729254, 0, 0, 0, 1, 1,
0.2798465, 0.9704722, 0.8469064, 0, 0, 0, 1, 1,
0.2800917, 0.1721544, 1.964901, 0, 0, 0, 1, 1,
0.2807568, 1.426417, 0.3407824, 0, 0, 0, 1, 1,
0.287273, -0.7498722, 3.860429, 0, 0, 0, 1, 1,
0.2902313, -0.6276577, 2.615796, 1, 1, 1, 1, 1,
0.292442, -0.626632, 2.641623, 1, 1, 1, 1, 1,
0.293944, 0.3108633, 2.017986, 1, 1, 1, 1, 1,
0.2994303, 1.024839, -0.01280803, 1, 1, 1, 1, 1,
0.3046923, 1.251278, 0.7766372, 1, 1, 1, 1, 1,
0.3076959, -0.0496778, 1.142751, 1, 1, 1, 1, 1,
0.3101596, 0.1661262, -0.4929029, 1, 1, 1, 1, 1,
0.3124086, 1.067868, 0.3154282, 1, 1, 1, 1, 1,
0.3129546, -2.27126, 2.484363, 1, 1, 1, 1, 1,
0.3133371, 0.6590578, -0.7020771, 1, 1, 1, 1, 1,
0.3145807, 0.9628365, 0.9157289, 1, 1, 1, 1, 1,
0.3170874, 0.6716459, 2.396382, 1, 1, 1, 1, 1,
0.3194695, 1.999901, -0.9753425, 1, 1, 1, 1, 1,
0.3199061, 0.9771326, 1.886777, 1, 1, 1, 1, 1,
0.3203162, -0.2914168, 1.098373, 1, 1, 1, 1, 1,
0.3223724, 0.2905236, 0.9035044, 0, 0, 1, 1, 1,
0.3314903, -0.2287664, 1.095956, 1, 0, 0, 1, 1,
0.3406407, -0.7103515, 2.857149, 1, 0, 0, 1, 1,
0.3433284, 0.424638, -0.765057, 1, 0, 0, 1, 1,
0.3441516, 0.373055, -1.815607, 1, 0, 0, 1, 1,
0.3468736, 0.5460761, -0.4337424, 1, 0, 0, 1, 1,
0.3510686, 0.4229354, -0.3227261, 0, 0, 0, 1, 1,
0.3520339, -0.3823248, 3.145655, 0, 0, 0, 1, 1,
0.3583187, 1.531315, -0.2944008, 0, 0, 0, 1, 1,
0.3643383, 1.454045, 1.920263, 0, 0, 0, 1, 1,
0.3666931, 0.6497413, 0.3802705, 0, 0, 0, 1, 1,
0.3698021, -0.1931631, 1.628312, 0, 0, 0, 1, 1,
0.3760246, 1.587961, 0.6945843, 0, 0, 0, 1, 1,
0.37981, 0.9839507, 1.162831, 1, 1, 1, 1, 1,
0.3809776, 0.616785, 1.164607, 1, 1, 1, 1, 1,
0.3849605, 0.7962277, 0.5576909, 1, 1, 1, 1, 1,
0.3877934, -0.4342351, 3.822229, 1, 1, 1, 1, 1,
0.390216, 1.326706, 0.1805351, 1, 1, 1, 1, 1,
0.394484, 0.9618307, -1.801381, 1, 1, 1, 1, 1,
0.3964441, -1.582657, 2.993729, 1, 1, 1, 1, 1,
0.3967884, -0.3207247, 1.42704, 1, 1, 1, 1, 1,
0.4075648, 1.096465, -0.6492739, 1, 1, 1, 1, 1,
0.4095467, -0.927083, 4.107732, 1, 1, 1, 1, 1,
0.4115272, -1.16423, 3.033748, 1, 1, 1, 1, 1,
0.4150724, -0.8940774, 2.315038, 1, 1, 1, 1, 1,
0.4162665, -0.301671, 2.478576, 1, 1, 1, 1, 1,
0.4174488, 0.2354292, 2.152788, 1, 1, 1, 1, 1,
0.4191228, 0.4418127, 0.5004768, 1, 1, 1, 1, 1,
0.4210506, 0.6591604, 1.079742, 0, 0, 1, 1, 1,
0.4210837, -1.21347, 2.81393, 1, 0, 0, 1, 1,
0.4270412, -1.170749, 3.639175, 1, 0, 0, 1, 1,
0.4311825, 0.1232145, 1.22007, 1, 0, 0, 1, 1,
0.4320325, 0.3215638, 2.936898, 1, 0, 0, 1, 1,
0.4322444, -1.902923, 3.009372, 1, 0, 0, 1, 1,
0.4371539, -0.5867395, 1.19924, 0, 0, 0, 1, 1,
0.4372585, -0.0604543, 0.9532567, 0, 0, 0, 1, 1,
0.4396956, 1.185829, 0.7085519, 0, 0, 0, 1, 1,
0.441945, 0.02272898, 1.560423, 0, 0, 0, 1, 1,
0.4436097, -1.337674, 4.132812, 0, 0, 0, 1, 1,
0.4454821, -1.060885, 3.145997, 0, 0, 0, 1, 1,
0.4457415, 0.3718942, 0.5593434, 0, 0, 0, 1, 1,
0.4458219, 1.131038, -0.6156379, 1, 1, 1, 1, 1,
0.4458258, 0.8760355, 1.188521, 1, 1, 1, 1, 1,
0.4461605, 0.5446875, 0.5856987, 1, 1, 1, 1, 1,
0.4479699, -0.2575975, 2.257002, 1, 1, 1, 1, 1,
0.4488314, 0.8411338, 1.420842, 1, 1, 1, 1, 1,
0.4528646, 0.4225059, 0.1363014, 1, 1, 1, 1, 1,
0.4529876, -0.0417924, 0.7739269, 1, 1, 1, 1, 1,
0.4554918, -0.621118, 3.293435, 1, 1, 1, 1, 1,
0.4653984, 1.037118, 1.025767, 1, 1, 1, 1, 1,
0.4687346, -1.799286, 1.762293, 1, 1, 1, 1, 1,
0.4733903, -0.5614806, 2.218739, 1, 1, 1, 1, 1,
0.4772573, -0.8259366, 1.819003, 1, 1, 1, 1, 1,
0.4805407, -1.398541, 2.307332, 1, 1, 1, 1, 1,
0.4887099, -1.024148, 2.371159, 1, 1, 1, 1, 1,
0.493678, 0.2701431, -0.01702974, 1, 1, 1, 1, 1,
0.5059037, -0.890075, 1.883273, 0, 0, 1, 1, 1,
0.5078977, 0.5166357, 0.6119502, 1, 0, 0, 1, 1,
0.5104184, 1.40642, 2.503835, 1, 0, 0, 1, 1,
0.5119955, 1.175198, 0.8791165, 1, 0, 0, 1, 1,
0.5180933, -0.5692682, 1.593621, 1, 0, 0, 1, 1,
0.5186483, 0.3724673, 3.183533, 1, 0, 0, 1, 1,
0.5213575, -0.4047368, 2.700315, 0, 0, 0, 1, 1,
0.5234741, -1.119889, 0.9162058, 0, 0, 0, 1, 1,
0.5254822, -0.2962722, 3.375316, 0, 0, 0, 1, 1,
0.5298859, -0.4042679, 1.57033, 0, 0, 0, 1, 1,
0.5321423, 0.7475538, -0.3965002, 0, 0, 0, 1, 1,
0.5328131, -0.02962837, -0.1950289, 0, 0, 0, 1, 1,
0.5352796, -0.08452397, 0.6153654, 0, 0, 0, 1, 1,
0.5364125, 0.2783132, 1.084577, 1, 1, 1, 1, 1,
0.5431127, -0.03718417, 0.08705002, 1, 1, 1, 1, 1,
0.5447421, -0.03584085, 2.04992, 1, 1, 1, 1, 1,
0.544787, 0.7327685, 0.760635, 1, 1, 1, 1, 1,
0.5468498, 0.6064082, -0.8170058, 1, 1, 1, 1, 1,
0.5500539, -0.7789836, 3.49927, 1, 1, 1, 1, 1,
0.5502691, 0.6755621, 3.651559, 1, 1, 1, 1, 1,
0.5521585, -0.005594901, 0.4866474, 1, 1, 1, 1, 1,
0.5530432, -0.9843519, 3.509345, 1, 1, 1, 1, 1,
0.5573791, -0.5677168, 0.4781481, 1, 1, 1, 1, 1,
0.5599957, -0.4410473, 3.943593, 1, 1, 1, 1, 1,
0.5614971, 0.3396894, 1.475701, 1, 1, 1, 1, 1,
0.5621221, 0.2584586, -0.2679822, 1, 1, 1, 1, 1,
0.5627649, -0.3045589, -0.11778, 1, 1, 1, 1, 1,
0.5773895, -1.31808, 3.669116, 1, 1, 1, 1, 1,
0.5887437, -0.3253646, 1.598671, 0, 0, 1, 1, 1,
0.5896645, 1.296835, -0.2822578, 1, 0, 0, 1, 1,
0.602344, -0.469418, 2.603136, 1, 0, 0, 1, 1,
0.6042182, -0.5417312, 2.155915, 1, 0, 0, 1, 1,
0.6065997, 0.6373981, 1.849039, 1, 0, 0, 1, 1,
0.606914, 0.3768693, 1.765622, 1, 0, 0, 1, 1,
0.609385, -0.01658816, 4.149057, 0, 0, 0, 1, 1,
0.6095247, -0.06877805, 2.482368, 0, 0, 0, 1, 1,
0.6097683, 0.2339172, 0.5373513, 0, 0, 0, 1, 1,
0.6100801, 2.196093, 0.9172236, 0, 0, 0, 1, 1,
0.6108168, -0.1417138, 1.187289, 0, 0, 0, 1, 1,
0.6117513, 1.184485, -0.141997, 0, 0, 0, 1, 1,
0.6168155, -0.05897916, 1.359794, 0, 0, 0, 1, 1,
0.6194484, -0.5380464, 1.922869, 1, 1, 1, 1, 1,
0.6230311, -1.418246, 2.853063, 1, 1, 1, 1, 1,
0.6254876, -0.8424906, 2.506022, 1, 1, 1, 1, 1,
0.6261698, 0.3036525, 0.3599513, 1, 1, 1, 1, 1,
0.6341272, 0.5662189, 2.44052, 1, 1, 1, 1, 1,
0.6343476, -1.425005, 3.437834, 1, 1, 1, 1, 1,
0.635189, 0.8867993, 2.245522, 1, 1, 1, 1, 1,
0.6413271, -1.303017, 1.13651, 1, 1, 1, 1, 1,
0.6420127, 0.4784375, 1.904371, 1, 1, 1, 1, 1,
0.6431452, -0.1481265, 1.605227, 1, 1, 1, 1, 1,
0.6436269, 1.347674, 0.6776928, 1, 1, 1, 1, 1,
0.646259, -1.602872, 2.589864, 1, 1, 1, 1, 1,
0.6519055, 0.384581, 0.1828195, 1, 1, 1, 1, 1,
0.6525872, 1.775363, -1.547822, 1, 1, 1, 1, 1,
0.6536376, 0.4401649, 1.016748, 1, 1, 1, 1, 1,
0.6546293, 0.6235308, 1.13889, 0, 0, 1, 1, 1,
0.6617067, 0.1585366, 1.22285, 1, 0, 0, 1, 1,
0.6725462, 1.4301, 2.216127, 1, 0, 0, 1, 1,
0.6727995, -0.8658702, 0.6907979, 1, 0, 0, 1, 1,
0.673692, -0.4938943, 1.460242, 1, 0, 0, 1, 1,
0.6756325, -0.7400732, 3.386021, 1, 0, 0, 1, 1,
0.6776409, 0.03132405, 1.635995, 0, 0, 0, 1, 1,
0.6803202, 0.4979241, 2.252414, 0, 0, 0, 1, 1,
0.6875922, 0.5171772, 0.3586872, 0, 0, 0, 1, 1,
0.6897837, 1.310747, 0.7495616, 0, 0, 0, 1, 1,
0.6905042, 1.246102, -0.05096079, 0, 0, 0, 1, 1,
0.693711, 0.6339645, 0.635701, 0, 0, 0, 1, 1,
0.6955491, -0.9484813, 3.018548, 0, 0, 0, 1, 1,
0.7074586, 1.20866, 0.08666088, 1, 1, 1, 1, 1,
0.7083498, 0.2540476, 2.216046, 1, 1, 1, 1, 1,
0.7089083, 0.6103414, 2.339446, 1, 1, 1, 1, 1,
0.709917, -1.163749, 4.04469, 1, 1, 1, 1, 1,
0.7136821, -2.86459, 3.787032, 1, 1, 1, 1, 1,
0.7194959, -1.575786, 2.936615, 1, 1, 1, 1, 1,
0.7196009, 0.01404794, 2.326852, 1, 1, 1, 1, 1,
0.7220852, 0.09137537, -0.1110112, 1, 1, 1, 1, 1,
0.7302027, -1.226107, 2.983684, 1, 1, 1, 1, 1,
0.7311051, 0.3222907, 0.955473, 1, 1, 1, 1, 1,
0.7338101, 0.3993628, 1.344565, 1, 1, 1, 1, 1,
0.7366965, 0.8634339, 0.3200685, 1, 1, 1, 1, 1,
0.7367899, 1.497044, 2.662753, 1, 1, 1, 1, 1,
0.7411774, -2.341097, 1.70401, 1, 1, 1, 1, 1,
0.742336, 1.242516, 1.103598, 1, 1, 1, 1, 1,
0.743991, 0.5669713, 1.343191, 0, 0, 1, 1, 1,
0.7443956, 0.09596279, 2.691548, 1, 0, 0, 1, 1,
0.7461042, 0.08053523, 0.07425556, 1, 0, 0, 1, 1,
0.7481907, -0.1430919, 1.232297, 1, 0, 0, 1, 1,
0.752133, 0.6918789, 1.769454, 1, 0, 0, 1, 1,
0.7544429, 0.4704025, 0.7300163, 1, 0, 0, 1, 1,
0.7604848, -0.8404382, 1.978513, 0, 0, 0, 1, 1,
0.7613875, 1.510843, 2.186672, 0, 0, 0, 1, 1,
0.7621359, -0.9856392, 2.457669, 0, 0, 0, 1, 1,
0.7666844, 1.332071, -0.2096765, 0, 0, 0, 1, 1,
0.768428, 1.95115, 0.5265244, 0, 0, 0, 1, 1,
0.7720481, 0.4945768, 1.119371, 0, 0, 0, 1, 1,
0.7729204, 1.464131, 2.060452, 0, 0, 0, 1, 1,
0.7732397, -0.2183494, -1.079342, 1, 1, 1, 1, 1,
0.7748032, 0.9614561, 3.188426, 1, 1, 1, 1, 1,
0.7778473, 1.806489, -0.4265767, 1, 1, 1, 1, 1,
0.7784969, 1.410629, 0.7147766, 1, 1, 1, 1, 1,
0.781245, 2.32188, 0.8821078, 1, 1, 1, 1, 1,
0.7812938, 0.1353121, 1.532128, 1, 1, 1, 1, 1,
0.7849535, -0.7224023, 1.203403, 1, 1, 1, 1, 1,
0.7896458, 0.4631315, 0.2854755, 1, 1, 1, 1, 1,
0.7899103, 0.1181219, 3.129732, 1, 1, 1, 1, 1,
0.7961366, -1.174556, 2.038852, 1, 1, 1, 1, 1,
0.7993726, 1.087736, 0.510774, 1, 1, 1, 1, 1,
0.799996, -1.383104, 1.525934, 1, 1, 1, 1, 1,
0.8044935, 1.088511, -0.5089903, 1, 1, 1, 1, 1,
0.805766, 1.390927, 0.8552707, 1, 1, 1, 1, 1,
0.8145961, 0.4958101, -0.008796151, 1, 1, 1, 1, 1,
0.8263806, 1.679815, 0.571695, 0, 0, 1, 1, 1,
0.8281736, -0.2829479, 3.085386, 1, 0, 0, 1, 1,
0.831242, 0.6787206, 1.654436, 1, 0, 0, 1, 1,
0.8358784, 1.393977, 0.9647267, 1, 0, 0, 1, 1,
0.8413363, -0.2250286, 1.011536, 1, 0, 0, 1, 1,
0.8428372, 0.07646229, 0.04800218, 1, 0, 0, 1, 1,
0.8508916, -1.081985, 3.218354, 0, 0, 0, 1, 1,
0.857233, 0.4810291, 1.362285, 0, 0, 0, 1, 1,
0.8594622, -0.7743359, 2.86523, 0, 0, 0, 1, 1,
0.8595784, 0.4861884, 0.8962576, 0, 0, 0, 1, 1,
0.8604172, -1.017545, 1.808636, 0, 0, 0, 1, 1,
0.861985, -0.9256429, 3.054452, 0, 0, 0, 1, 1,
0.8623528, 0.04044463, 0.9247924, 0, 0, 0, 1, 1,
0.8636279, -0.4921354, -0.1493876, 1, 1, 1, 1, 1,
0.8642213, 0.4976337, 0.1556959, 1, 1, 1, 1, 1,
0.8679404, -0.7986804, 1.530781, 1, 1, 1, 1, 1,
0.8698627, -0.4844883, 1.040349, 1, 1, 1, 1, 1,
0.8774267, 0.2468164, 1.13669, 1, 1, 1, 1, 1,
0.8801409, 0.125687, 0.5497225, 1, 1, 1, 1, 1,
0.8804433, 1.057971, 0.7167438, 1, 1, 1, 1, 1,
0.8831919, 1.634349, -0.7455034, 1, 1, 1, 1, 1,
0.8840875, -0.5542158, 1.618224, 1, 1, 1, 1, 1,
0.8870022, 1.392579, 1.369795, 1, 1, 1, 1, 1,
0.8949813, 0.7963721, 0.5097422, 1, 1, 1, 1, 1,
0.8982055, 2.204659, -0.06495923, 1, 1, 1, 1, 1,
0.8985385, -1.032305, 2.463168, 1, 1, 1, 1, 1,
0.901397, -2.210497, 2.41276, 1, 1, 1, 1, 1,
0.9016725, 1.404155, -0.08830304, 1, 1, 1, 1, 1,
0.9049809, -1.033782, 1.252522, 0, 0, 1, 1, 1,
0.9085049, -1.056025, 3.151826, 1, 0, 0, 1, 1,
0.9104672, -1.743435, 1.055593, 1, 0, 0, 1, 1,
0.9130874, 0.3715832, 1.965696, 1, 0, 0, 1, 1,
0.9190953, 0.05641701, 1.465723, 1, 0, 0, 1, 1,
0.9210618, 0.9948372, 2.228058, 1, 0, 0, 1, 1,
0.9226021, -2.131181, 3.55136, 0, 0, 0, 1, 1,
0.9228727, 1.676241, 1.674819, 0, 0, 0, 1, 1,
0.9267005, -1.858284, 2.900614, 0, 0, 0, 1, 1,
0.9341093, 0.5795087, 0.3321398, 0, 0, 0, 1, 1,
0.9347901, 0.7349611, 0.8627982, 0, 0, 0, 1, 1,
0.9375573, 1.140354, 1.516869, 0, 0, 0, 1, 1,
0.9384251, 0.4696654, 0.7654822, 0, 0, 0, 1, 1,
0.9403329, 1.58049, 0.05993219, 1, 1, 1, 1, 1,
0.941825, -0.6598923, 1.738062, 1, 1, 1, 1, 1,
0.9432735, 0.5554314, 2.558784, 1, 1, 1, 1, 1,
0.9446863, -0.6994253, 2.174732, 1, 1, 1, 1, 1,
0.9563041, 0.4921582, 0.8305606, 1, 1, 1, 1, 1,
0.9601491, -0.1394621, 1.153742, 1, 1, 1, 1, 1,
0.9615107, -1.163403, 2.480451, 1, 1, 1, 1, 1,
0.9651785, -0.6473011, 1.201364, 1, 1, 1, 1, 1,
0.9683686, 1.11448, 2.189217, 1, 1, 1, 1, 1,
0.9763686, 0.6095518, 0.9435296, 1, 1, 1, 1, 1,
0.978075, -0.3192924, 1.352962, 1, 1, 1, 1, 1,
0.9816612, -1.605175, 2.079003, 1, 1, 1, 1, 1,
0.9889973, -0.6555648, 3.933542, 1, 1, 1, 1, 1,
0.9902099, 1.21971, 2.473151, 1, 1, 1, 1, 1,
0.9967091, 0.1006924, 1.709191, 1, 1, 1, 1, 1,
0.9997369, -0.9275634, 2.249545, 0, 0, 1, 1, 1,
1.003295, 0.0316286, 2.991332, 1, 0, 0, 1, 1,
1.005353, 0.4842048, 1.285236, 1, 0, 0, 1, 1,
1.012822, -0.1038132, 0.02679867, 1, 0, 0, 1, 1,
1.013048, 1.150756, 0.985437, 1, 0, 0, 1, 1,
1.018192, -1.178005, 3.281626, 1, 0, 0, 1, 1,
1.018349, 2.003327, -0.7748331, 0, 0, 0, 1, 1,
1.020859, 1.459671, 0.7961211, 0, 0, 0, 1, 1,
1.030816, -1.134003, 2.185404, 0, 0, 0, 1, 1,
1.035744, -0.3677043, 2.683985, 0, 0, 0, 1, 1,
1.04738, -1.089522, 2.125246, 0, 0, 0, 1, 1,
1.04748, -1.67412, 1.102934, 0, 0, 0, 1, 1,
1.049492, 2.139312, -0.4033265, 0, 0, 0, 1, 1,
1.053731, 1.532236, 0.5753074, 1, 1, 1, 1, 1,
1.058191, 1.371917, 2.033731, 1, 1, 1, 1, 1,
1.063125, -0.1733662, -0.4210957, 1, 1, 1, 1, 1,
1.066354, 0.444444, 0.6523769, 1, 1, 1, 1, 1,
1.066457, 0.3444371, 1.446219, 1, 1, 1, 1, 1,
1.07069, -1.011142, 2.803599, 1, 1, 1, 1, 1,
1.073034, -2.766358, 2.885468, 1, 1, 1, 1, 1,
1.075213, 0.9754368, 1.600579, 1, 1, 1, 1, 1,
1.080979, 3.074343, -1.778651, 1, 1, 1, 1, 1,
1.085904, -1.001539, 2.905356, 1, 1, 1, 1, 1,
1.09435, -0.07669038, 2.578438, 1, 1, 1, 1, 1,
1.094723, 0.827484, 1.213933, 1, 1, 1, 1, 1,
1.095371, -0.07417692, 2.567508, 1, 1, 1, 1, 1,
1.104308, -0.7304894, 2.745424, 1, 1, 1, 1, 1,
1.117577, 1.02423, 3.554768, 1, 1, 1, 1, 1,
1.123153, 0.1567897, 1.851083, 0, 0, 1, 1, 1,
1.124436, -0.4687949, 1.458527, 1, 0, 0, 1, 1,
1.127532, 0.3886701, 1.376413, 1, 0, 0, 1, 1,
1.131307, 0.8792697, -0.7587957, 1, 0, 0, 1, 1,
1.13278, -1.327382, 1.692421, 1, 0, 0, 1, 1,
1.134597, -0.3733356, 2.493315, 1, 0, 0, 1, 1,
1.147907, 0.7467854, 2.353633, 0, 0, 0, 1, 1,
1.149878, 0.4953686, 2.771135, 0, 0, 0, 1, 1,
1.154514, 0.1506896, 2.38684, 0, 0, 0, 1, 1,
1.160249, 0.6500852, 2.13631, 0, 0, 0, 1, 1,
1.170297, 0.84046, 1.775867, 0, 0, 0, 1, 1,
1.17362, -1.127567, 1.526466, 0, 0, 0, 1, 1,
1.173835, -1.339077, 3.270428, 0, 0, 0, 1, 1,
1.183587, -1.188818, 2.382424, 1, 1, 1, 1, 1,
1.187305, 0.9256908, 1.415161, 1, 1, 1, 1, 1,
1.188444, -0.2230328, 1.829885, 1, 1, 1, 1, 1,
1.18899, 0.6453645, -0.2322628, 1, 1, 1, 1, 1,
1.192333, 1.505468, 0.2917781, 1, 1, 1, 1, 1,
1.19738, 1.895706, -0.3709593, 1, 1, 1, 1, 1,
1.202072, -0.2409573, 1.774983, 1, 1, 1, 1, 1,
1.204964, -0.3366399, 2.167006, 1, 1, 1, 1, 1,
1.206521, 0.3340549, 2.214871, 1, 1, 1, 1, 1,
1.212962, 0.1722898, 1.215706, 1, 1, 1, 1, 1,
1.221124, 0.3922159, 1.421515, 1, 1, 1, 1, 1,
1.221716, 0.4345392, 0.5422682, 1, 1, 1, 1, 1,
1.227544, -0.5826688, 4.411878, 1, 1, 1, 1, 1,
1.228894, -0.182206, 2.098716, 1, 1, 1, 1, 1,
1.235871, 1.429453, 0.274792, 1, 1, 1, 1, 1,
1.242116, -0.008252718, 1.306275, 0, 0, 1, 1, 1,
1.244642, 1.172609, 0.6634838, 1, 0, 0, 1, 1,
1.247004, 1.181278, 2.727098, 1, 0, 0, 1, 1,
1.254207, -0.332094, 2.117834, 1, 0, 0, 1, 1,
1.254332, 1.068785, 1.506593, 1, 0, 0, 1, 1,
1.257004, 1.823604, 1.079733, 1, 0, 0, 1, 1,
1.259186, 0.4856117, 1.658554, 0, 0, 0, 1, 1,
1.260016, 0.4633572, 2.443405, 0, 0, 0, 1, 1,
1.26185, -0.3175478, 3.044551, 0, 0, 0, 1, 1,
1.267231, 0.8669337, 0.3439533, 0, 0, 0, 1, 1,
1.278576, 2.123115, -0.7230341, 0, 0, 0, 1, 1,
1.28266, -1.261521, 4.318716, 0, 0, 0, 1, 1,
1.285825, -0.2624459, 2.627548, 0, 0, 0, 1, 1,
1.307974, 0.8259947, 1.002291, 1, 1, 1, 1, 1,
1.311685, -0.8392921, 0.9657148, 1, 1, 1, 1, 1,
1.328485, -1.495069, 1.388324, 1, 1, 1, 1, 1,
1.3364, 0.4404848, 0.8233413, 1, 1, 1, 1, 1,
1.355684, -0.3811352, 1.735615, 1, 1, 1, 1, 1,
1.357547, -0.2557835, 1.929832, 1, 1, 1, 1, 1,
1.371442, -0.576321, 2.727578, 1, 1, 1, 1, 1,
1.380842, -0.7497263, 2.566666, 1, 1, 1, 1, 1,
1.382536, 0.5173523, 0.4225633, 1, 1, 1, 1, 1,
1.38967, 1.033054, 1.384903, 1, 1, 1, 1, 1,
1.393358, 0.4578198, 2.23471, 1, 1, 1, 1, 1,
1.394302, -0.0191714, 0.1675726, 1, 1, 1, 1, 1,
1.396135, -0.9204389, 3.145771, 1, 1, 1, 1, 1,
1.413117, -0.06855719, 1.366108, 1, 1, 1, 1, 1,
1.413566, 1.274395, -1.149042, 1, 1, 1, 1, 1,
1.415236, 0.6203318, 1.354456, 0, 0, 1, 1, 1,
1.427741, -0.8049372, 3.836575, 1, 0, 0, 1, 1,
1.435985, -0.8166533, 3.454929, 1, 0, 0, 1, 1,
1.436296, 0.2402119, 2.223273, 1, 0, 0, 1, 1,
1.440668, 0.6247904, 2.075566, 1, 0, 0, 1, 1,
1.456873, -0.6669118, 2.241465, 1, 0, 0, 1, 1,
1.463772, -1.116359, 1.98104, 0, 0, 0, 1, 1,
1.46415, 1.496877, 1.535551, 0, 0, 0, 1, 1,
1.464442, 0.4719817, 1.60521, 0, 0, 0, 1, 1,
1.468304, 0.5171556, 0.7373782, 0, 0, 0, 1, 1,
1.48082, 0.8358153, 0.5867379, 0, 0, 0, 1, 1,
1.487329, -0.268035, 1.587498, 0, 0, 0, 1, 1,
1.491644, -0.1155669, 1.550121, 0, 0, 0, 1, 1,
1.505204, 0.925041, 1.416659, 1, 1, 1, 1, 1,
1.510296, -1.047848, 1.672994, 1, 1, 1, 1, 1,
1.511656, -0.5239046, 1.512634, 1, 1, 1, 1, 1,
1.520905, 1.66003, -1.095905, 1, 1, 1, 1, 1,
1.562732, -1.280447, 2.19768, 1, 1, 1, 1, 1,
1.56636, 1.345922, -0.4617769, 1, 1, 1, 1, 1,
1.575667, -0.08111103, 0.4076224, 1, 1, 1, 1, 1,
1.578938, -0.2765818, 2.58843, 1, 1, 1, 1, 1,
1.58353, -0.2588096, 0.7365757, 1, 1, 1, 1, 1,
1.585763, -0.06400193, 1.99077, 1, 1, 1, 1, 1,
1.597159, -0.3270247, 1.974395, 1, 1, 1, 1, 1,
1.605453, 0.1043112, 1.590258, 1, 1, 1, 1, 1,
1.625625, 0.4137294, -1.333833, 1, 1, 1, 1, 1,
1.639091, 0.02634452, 1.800572, 1, 1, 1, 1, 1,
1.643128, 0.4976097, 2.558333, 1, 1, 1, 1, 1,
1.655141, -1.474739, 1.307687, 0, 0, 1, 1, 1,
1.670487, 1.052539, 0.1862959, 1, 0, 0, 1, 1,
1.6882, 0.1013685, 2.771478, 1, 0, 0, 1, 1,
1.694136, 0.3898419, 1.878262, 1, 0, 0, 1, 1,
1.707117, 0.4390468, 2.720273, 1, 0, 0, 1, 1,
1.71849, 0.01476428, 3.97296, 1, 0, 0, 1, 1,
1.758403, 0.9091635, 1.72019, 0, 0, 0, 1, 1,
1.774661, -0.8620654, 2.109528, 0, 0, 0, 1, 1,
1.778846, 1.048555, 1.483071, 0, 0, 0, 1, 1,
1.810253, -1.515418, 3.762091, 0, 0, 0, 1, 1,
1.812355, 0.9446307, -0.07454867, 0, 0, 0, 1, 1,
1.829437, 2.145499, 1.332866, 0, 0, 0, 1, 1,
1.846665, 1.378617, -0.4208469, 0, 0, 0, 1, 1,
1.855406, 1.043693, -0.1909216, 1, 1, 1, 1, 1,
1.868848, -0.3457974, 0.4491562, 1, 1, 1, 1, 1,
1.891417, -0.7161548, 3.335357, 1, 1, 1, 1, 1,
1.891751, -0.1236376, 1.279117, 1, 1, 1, 1, 1,
1.894645, -1.000688, 2.288896, 1, 1, 1, 1, 1,
1.899419, -1.609712, 2.248033, 1, 1, 1, 1, 1,
1.900832, 0.1785573, 1.024749, 1, 1, 1, 1, 1,
1.903915, 1.277119, 0.6558679, 1, 1, 1, 1, 1,
1.982607, -0.3413294, 3.253233, 1, 1, 1, 1, 1,
2.028485, 2.192, -0.01268015, 1, 1, 1, 1, 1,
2.028785, 0.3810346, 2.337537, 1, 1, 1, 1, 1,
2.054797, 1.010722, 0.9008214, 1, 1, 1, 1, 1,
2.094766, -0.7037591, 2.883239, 1, 1, 1, 1, 1,
2.103492, -0.2933109, 2.331582, 1, 1, 1, 1, 1,
2.10523, 1.170404, 0.413679, 1, 1, 1, 1, 1,
2.111389, -0.1378263, 1.643233, 0, 0, 1, 1, 1,
2.120311, 0.2293742, 1.935829, 1, 0, 0, 1, 1,
2.148217, 0.9832175, 2.038997, 1, 0, 0, 1, 1,
2.151158, 0.1741289, 0.7566249, 1, 0, 0, 1, 1,
2.160048, 0.9134539, 0.4281841, 1, 0, 0, 1, 1,
2.205395, -1.107506, 2.335812, 1, 0, 0, 1, 1,
2.2608, 0.2211463, 1.079529, 0, 0, 0, 1, 1,
2.277288, 0.1051526, -0.09727208, 0, 0, 0, 1, 1,
2.280145, -0.07030185, 1.911985, 0, 0, 0, 1, 1,
2.342968, 0.9971747, -0.1562316, 0, 0, 0, 1, 1,
2.360554, 1.947526, 0.3497706, 0, 0, 0, 1, 1,
2.389873, 0.2026336, 1.102691, 0, 0, 0, 1, 1,
2.413202, -1.675807, 0.9215026, 0, 0, 0, 1, 1,
2.422124, 1.574144, 0.4578255, 1, 1, 1, 1, 1,
2.47911, 0.6050599, -1.189129, 1, 1, 1, 1, 1,
2.518007, 0.4316971, 1.010264, 1, 1, 1, 1, 1,
2.717301, -0.4099044, 1.955061, 1, 1, 1, 1, 1,
2.773739, 1.604496, 1.306175, 1, 1, 1, 1, 1,
2.80977, 0.1859061, 0.664348, 1, 1, 1, 1, 1,
2.811152, 0.3630042, 0.7103947, 1, 1, 1, 1, 1
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
var radius = 9.22107;
var distance = 32.38862;
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
mvMatrix.translate( 0.09742188, -0.4278829, 0.3065221 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38862);
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