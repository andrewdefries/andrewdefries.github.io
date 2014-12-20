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
-3.993795, -0.9853765, -2.276328, 1, 0, 0, 1,
-3.327474, 0.8062819, -0.3327296, 1, 0.007843138, 0, 1,
-3.280541, -0.4671488, -3.295932, 1, 0.01176471, 0, 1,
-2.743057, 0.2034676, -2.101173, 1, 0.01960784, 0, 1,
-2.741485, -0.3495138, -1.675057, 1, 0.02352941, 0, 1,
-2.691828, 0.8160442, -0.2341233, 1, 0.03137255, 0, 1,
-2.654114, -1.071435, -0.08401322, 1, 0.03529412, 0, 1,
-2.456396, -1.505465, -3.976329, 1, 0.04313726, 0, 1,
-2.434431, 0.5393789, -0.846581, 1, 0.04705882, 0, 1,
-2.425042, -0.6754982, -3.29659, 1, 0.05490196, 0, 1,
-2.393596, -0.8573071, -1.720859, 1, 0.05882353, 0, 1,
-2.312249, 0.4978076, -1.359477, 1, 0.06666667, 0, 1,
-2.297907, -0.9328871, -1.575462, 1, 0.07058824, 0, 1,
-2.272956, -1.14935, 0.1984628, 1, 0.07843138, 0, 1,
-2.254878, 0.356037, -1.202149, 1, 0.08235294, 0, 1,
-2.234967, -1.771403, -0.9431455, 1, 0.09019608, 0, 1,
-2.22689, -0.294076, 0.2725843, 1, 0.09411765, 0, 1,
-2.199216, 0.5962171, -1.28076, 1, 0.1019608, 0, 1,
-2.180146, -0.7586305, -2.580063, 1, 0.1098039, 0, 1,
-2.17729, -0.1028267, -1.519644, 1, 0.1137255, 0, 1,
-2.12045, -0.1396132, -0.8143949, 1, 0.1215686, 0, 1,
-2.09077, -1.173923, -2.374374, 1, 0.1254902, 0, 1,
-2.039669, -0.1665001, -3.101989, 1, 0.1333333, 0, 1,
-2.024524, 1.600509, -1.453449, 1, 0.1372549, 0, 1,
-2.007313, -0.9231822, -1.80358, 1, 0.145098, 0, 1,
-2.002858, -1.280194, -3.729239, 1, 0.1490196, 0, 1,
-2.002294, 0.4421641, -2.946431, 1, 0.1568628, 0, 1,
-1.998417, -0.9623647, -2.543041, 1, 0.1607843, 0, 1,
-1.997607, 1.339864, 0.4272023, 1, 0.1686275, 0, 1,
-1.984006, -0.8214234, -1.400735, 1, 0.172549, 0, 1,
-1.980324, 1.895378, 0.4042327, 1, 0.1803922, 0, 1,
-1.978101, -0.003176623, -0.5700297, 1, 0.1843137, 0, 1,
-1.972782, -1.28701, -2.374279, 1, 0.1921569, 0, 1,
-1.972172, 1.425307, -0.922613, 1, 0.1960784, 0, 1,
-1.94712, 1.867416, 0.6366038, 1, 0.2039216, 0, 1,
-1.944331, 1.271377, -1.976115, 1, 0.2117647, 0, 1,
-1.942395, -0.8201402, -2.025256, 1, 0.2156863, 0, 1,
-1.94105, -0.7543145, -1.217448, 1, 0.2235294, 0, 1,
-1.903089, 1.209281, -0.1221066, 1, 0.227451, 0, 1,
-1.890915, 1.105352, -0.8103608, 1, 0.2352941, 0, 1,
-1.875645, 0.9468712, -0.08091126, 1, 0.2392157, 0, 1,
-1.8499, -1.600802, -2.084199, 1, 0.2470588, 0, 1,
-1.802081, -0.3854427, -0.4467545, 1, 0.2509804, 0, 1,
-1.794627, 1.959776, -1.638949, 1, 0.2588235, 0, 1,
-1.764757, 1.29829, -0.3015912, 1, 0.2627451, 0, 1,
-1.762257, 0.6412784, -0.4590347, 1, 0.2705882, 0, 1,
-1.745945, -0.5095778, -0.6122507, 1, 0.2745098, 0, 1,
-1.740873, -1.134224, -2.016973, 1, 0.282353, 0, 1,
-1.729681, -0.6032586, -1.488407, 1, 0.2862745, 0, 1,
-1.719876, 1.656129, -0.1843241, 1, 0.2941177, 0, 1,
-1.707748, -1.377848, -1.92811, 1, 0.3019608, 0, 1,
-1.688546, -0.3852376, -2.202629, 1, 0.3058824, 0, 1,
-1.675652, 0.6605758, -1.92985, 1, 0.3137255, 0, 1,
-1.66386, -0.8085511, -0.6671751, 1, 0.3176471, 0, 1,
-1.650873, -0.4933435, -1.971112, 1, 0.3254902, 0, 1,
-1.64545, 0.1010189, 0.8090683, 1, 0.3294118, 0, 1,
-1.63664, 0.5511972, -2.576115, 1, 0.3372549, 0, 1,
-1.633487, 0.949405, -1.778946, 1, 0.3411765, 0, 1,
-1.626522, 0.4799442, -1.448606, 1, 0.3490196, 0, 1,
-1.617171, 0.692187, 0.01734376, 1, 0.3529412, 0, 1,
-1.603269, -1.844439, -2.256952, 1, 0.3607843, 0, 1,
-1.588143, -0.8908091, -3.68049, 1, 0.3647059, 0, 1,
-1.579731, -0.05643454, -2.52687, 1, 0.372549, 0, 1,
-1.578197, -1.14397, -1.354438, 1, 0.3764706, 0, 1,
-1.577162, -0.7777188, -1.882196, 1, 0.3843137, 0, 1,
-1.556603, 0.7858576, -0.7108473, 1, 0.3882353, 0, 1,
-1.544633, -1.812818, -1.480219, 1, 0.3960784, 0, 1,
-1.543747, 0.859255, 0.3923251, 1, 0.4039216, 0, 1,
-1.54127, 0.5630496, -0.9626351, 1, 0.4078431, 0, 1,
-1.541174, 1.703878, -1.765158, 1, 0.4156863, 0, 1,
-1.536225, -0.9857874, -1.756103, 1, 0.4196078, 0, 1,
-1.530319, -2.009199, -3.740097, 1, 0.427451, 0, 1,
-1.517402, 0.9139811, -1.680194, 1, 0.4313726, 0, 1,
-1.511239, -1.782942, -1.596219, 1, 0.4392157, 0, 1,
-1.506327, 0.2424914, 0.7862916, 1, 0.4431373, 0, 1,
-1.504069, 1.25836, -1.280218, 1, 0.4509804, 0, 1,
-1.496797, 3.22661, -0.9193118, 1, 0.454902, 0, 1,
-1.496529, 1.017261, -3.656125, 1, 0.4627451, 0, 1,
-1.49451, -0.3405544, -3.126048, 1, 0.4666667, 0, 1,
-1.485481, 1.134827, -0.01852028, 1, 0.4745098, 0, 1,
-1.481593, -1.701742, -2.143527, 1, 0.4784314, 0, 1,
-1.478433, -0.6061722, -2.277838, 1, 0.4862745, 0, 1,
-1.477344, -0.002367751, -1.224647, 1, 0.4901961, 0, 1,
-1.473641, -1.721042, -2.500857, 1, 0.4980392, 0, 1,
-1.456331, 0.4345475, -1.295946, 1, 0.5058824, 0, 1,
-1.446563, -0.181462, -2.762888, 1, 0.509804, 0, 1,
-1.445639, -0.5863916, -1.904053, 1, 0.5176471, 0, 1,
-1.427646, 0.01862913, -0.6653214, 1, 0.5215687, 0, 1,
-1.419667, -0.2550667, -1.077474, 1, 0.5294118, 0, 1,
-1.413366, 0.1575769, -1.701672, 1, 0.5333334, 0, 1,
-1.410723, -1.372572, -4.055467, 1, 0.5411765, 0, 1,
-1.400196, -0.171892, -1.574653, 1, 0.5450981, 0, 1,
-1.397541, -0.5709394, -2.016201, 1, 0.5529412, 0, 1,
-1.386155, 1.057577, 0.2084295, 1, 0.5568628, 0, 1,
-1.381277, -0.5324174, 0.08729463, 1, 0.5647059, 0, 1,
-1.377905, -0.7999092, -1.937122, 1, 0.5686275, 0, 1,
-1.36622, 0.4227717, -2.471355, 1, 0.5764706, 0, 1,
-1.356501, -0.2524588, -1.045275, 1, 0.5803922, 0, 1,
-1.323319, -1.63581, -2.222443, 1, 0.5882353, 0, 1,
-1.317713, -0.2496654, -2.547818, 1, 0.5921569, 0, 1,
-1.31462, -0.1786985, -0.3489515, 1, 0.6, 0, 1,
-1.308881, 0.8200972, 0.0006307229, 1, 0.6078432, 0, 1,
-1.301182, 0.5733982, -1.529906, 1, 0.6117647, 0, 1,
-1.294387, 0.5165923, -1.240232, 1, 0.6196079, 0, 1,
-1.291973, 0.1039458, -2.28966, 1, 0.6235294, 0, 1,
-1.291657, -0.3313971, -1.714003, 1, 0.6313726, 0, 1,
-1.282984, -2.04109, -3.052966, 1, 0.6352941, 0, 1,
-1.280895, -1.155415, -3.055301, 1, 0.6431373, 0, 1,
-1.270862, 1.534756, -1.524892, 1, 0.6470588, 0, 1,
-1.270106, -0.2301288, -0.8082258, 1, 0.654902, 0, 1,
-1.26822, -0.3000391, -1.377405, 1, 0.6588235, 0, 1,
-1.261448, 0.290965, -2.964008, 1, 0.6666667, 0, 1,
-1.258398, -0.8300537, -0.5456389, 1, 0.6705883, 0, 1,
-1.255654, -1.046077, -2.582778, 1, 0.6784314, 0, 1,
-1.25452, 1.332867, 0.3805748, 1, 0.682353, 0, 1,
-1.234001, -1.694356, -0.7604774, 1, 0.6901961, 0, 1,
-1.231516, 1.795329, -0.04588117, 1, 0.6941177, 0, 1,
-1.226461, -1.139234, -1.951177, 1, 0.7019608, 0, 1,
-1.218128, 0.412344, -1.406559, 1, 0.7098039, 0, 1,
-1.217443, -0.02771942, -0.8674485, 1, 0.7137255, 0, 1,
-1.214698, -0.6789719, -1.677541, 1, 0.7215686, 0, 1,
-1.210558, 0.2628375, -2.856131, 1, 0.7254902, 0, 1,
-1.209751, 1.214196, -2.271973, 1, 0.7333333, 0, 1,
-1.208529, 0.7390479, -2.288667, 1, 0.7372549, 0, 1,
-1.207215, 1.150174, -1.894358, 1, 0.7450981, 0, 1,
-1.20658, 0.6167189, 0.6680604, 1, 0.7490196, 0, 1,
-1.206547, -0.1037754, -1.961183, 1, 0.7568628, 0, 1,
-1.203691, -0.5021018, -2.6984, 1, 0.7607843, 0, 1,
-1.199775, 0.392343, -0.8484019, 1, 0.7686275, 0, 1,
-1.195639, 1.338108, -0.3011518, 1, 0.772549, 0, 1,
-1.191587, -0.9317421, -1.173655, 1, 0.7803922, 0, 1,
-1.191478, 0.1076896, -3.299483, 1, 0.7843137, 0, 1,
-1.186751, 0.347516, -1.12239, 1, 0.7921569, 0, 1,
-1.179221, -0.4842803, -1.396074, 1, 0.7960784, 0, 1,
-1.177536, 1.283588, -0.9512716, 1, 0.8039216, 0, 1,
-1.177243, -0.2799017, -1.755491, 1, 0.8117647, 0, 1,
-1.176871, 1.405974, -0.212831, 1, 0.8156863, 0, 1,
-1.175468, -0.8835849, -2.248902, 1, 0.8235294, 0, 1,
-1.171497, -0.4409941, -2.107362, 1, 0.827451, 0, 1,
-1.169486, -0.2973052, -3.35648, 1, 0.8352941, 0, 1,
-1.164663, -0.7216498, -2.820918, 1, 0.8392157, 0, 1,
-1.159772, -0.5955414, -3.087601, 1, 0.8470588, 0, 1,
-1.153846, -0.655743, -1.946178, 1, 0.8509804, 0, 1,
-1.151152, 0.5307708, 0.977764, 1, 0.8588235, 0, 1,
-1.140732, -0.1074822, -2.546643, 1, 0.8627451, 0, 1,
-1.137587, 0.4589472, -0.9303545, 1, 0.8705882, 0, 1,
-1.13413, 0.7242177, -0.5624489, 1, 0.8745098, 0, 1,
-1.126027, -0.1042124, -2.663515, 1, 0.8823529, 0, 1,
-1.112964, 0.307569, -1.113147, 1, 0.8862745, 0, 1,
-1.107578, -1.114487, -1.00417, 1, 0.8941177, 0, 1,
-1.103931, 0.772482, 0.07142549, 1, 0.8980392, 0, 1,
-1.100512, 0.4622094, -0.7016015, 1, 0.9058824, 0, 1,
-1.092644, -0.1350608, -2.477385, 1, 0.9137255, 0, 1,
-1.091723, -0.2642667, -0.9638689, 1, 0.9176471, 0, 1,
-1.090656, 0.007236154, -2.884102, 1, 0.9254902, 0, 1,
-1.08621, -0.7513286, -1.468896, 1, 0.9294118, 0, 1,
-1.08416, 0.6033691, -1.354577, 1, 0.9372549, 0, 1,
-1.081083, 0.1411617, -4.150834, 1, 0.9411765, 0, 1,
-1.079573, -1.519402, -1.71756, 1, 0.9490196, 0, 1,
-1.078942, -0.9856288, -1.332626, 1, 0.9529412, 0, 1,
-1.078901, 1.465986, -0.7037788, 1, 0.9607843, 0, 1,
-1.075698, 0.9761748, 0.394022, 1, 0.9647059, 0, 1,
-1.073461, -1.094088, -3.530135, 1, 0.972549, 0, 1,
-1.068428, -0.5405574, -2.16027, 1, 0.9764706, 0, 1,
-1.06562, 1.151245, -0.9761258, 1, 0.9843137, 0, 1,
-1.063371, -0.8162562, -1.505953, 1, 0.9882353, 0, 1,
-1.060992, 0.4820893, -1.758118, 1, 0.9960784, 0, 1,
-1.058974, -1.239442, -4.28934, 0.9960784, 1, 0, 1,
-1.057105, 1.187379, 1.385932, 0.9921569, 1, 0, 1,
-1.05325, -1.151603, -2.715739, 0.9843137, 1, 0, 1,
-1.038436, 0.3779433, -1.199579, 0.9803922, 1, 0, 1,
-1.03757, 0.8219826, -1.182135, 0.972549, 1, 0, 1,
-1.029373, -0.3550756, -3.191105, 0.9686275, 1, 0, 1,
-1.028639, 1.250837, -2.076313, 0.9607843, 1, 0, 1,
-1.019976, 1.564956, -1.09767, 0.9568627, 1, 0, 1,
-1.018149, 0.9354028, -1.398456, 0.9490196, 1, 0, 1,
-1.006732, -0.199382, -1.565657, 0.945098, 1, 0, 1,
-1.003801, -2.322037, -3.329367, 0.9372549, 1, 0, 1,
-1.002834, -0.0002768468, -2.926155, 0.9333333, 1, 0, 1,
-0.9847285, -0.7304909, -0.2524594, 0.9254902, 1, 0, 1,
-0.9802374, -0.8332172, -0.8155094, 0.9215686, 1, 0, 1,
-0.9795734, 0.2552889, -2.603167, 0.9137255, 1, 0, 1,
-0.9758668, -0.68694, -1.960712, 0.9098039, 1, 0, 1,
-0.9718489, 0.2521317, -0.702637, 0.9019608, 1, 0, 1,
-0.9649404, 1.351511, -0.685471, 0.8941177, 1, 0, 1,
-0.9559104, -0.3563885, -0.5046856, 0.8901961, 1, 0, 1,
-0.9509516, -0.01219579, -1.560262, 0.8823529, 1, 0, 1,
-0.9491315, 0.06252252, -1.255208, 0.8784314, 1, 0, 1,
-0.9486864, -1.39306, -3.094986, 0.8705882, 1, 0, 1,
-0.9475019, -0.8638175, -1.325085, 0.8666667, 1, 0, 1,
-0.9424638, 1.212256, -1.540064, 0.8588235, 1, 0, 1,
-0.9264413, 0.2373692, -3.147159, 0.854902, 1, 0, 1,
-0.9260894, 0.1026623, -2.073558, 0.8470588, 1, 0, 1,
-0.924316, -0.7371982, -1.395757, 0.8431373, 1, 0, 1,
-0.9213797, 0.1764454, -1.944817, 0.8352941, 1, 0, 1,
-0.9204631, 0.5224705, -1.290998, 0.8313726, 1, 0, 1,
-0.918705, -0.9068587, -2.017402, 0.8235294, 1, 0, 1,
-0.9089757, -0.9840257, -1.43925, 0.8196079, 1, 0, 1,
-0.9063597, -0.7238977, -3.024522, 0.8117647, 1, 0, 1,
-0.90018, -0.5293056, -2.679883, 0.8078431, 1, 0, 1,
-0.8970514, -0.445895, 0.4476244, 0.8, 1, 0, 1,
-0.894982, -0.7879674, -1.989254, 0.7921569, 1, 0, 1,
-0.8904716, 0.6841265, -1.584491, 0.7882353, 1, 0, 1,
-0.8883862, -0.8230959, -2.252322, 0.7803922, 1, 0, 1,
-0.8873695, 1.889113, 0.2114552, 0.7764706, 1, 0, 1,
-0.8859944, -1.906998, -3.971165, 0.7686275, 1, 0, 1,
-0.8854685, -0.3229405, -1.605284, 0.7647059, 1, 0, 1,
-0.8812336, 2.115821, -0.5338879, 0.7568628, 1, 0, 1,
-0.8794103, -0.8014641, -2.86687, 0.7529412, 1, 0, 1,
-0.8773489, -0.4270562, -1.106596, 0.7450981, 1, 0, 1,
-0.8752575, -0.3815327, -1.085455, 0.7411765, 1, 0, 1,
-0.8726137, 0.08728337, 0.4464089, 0.7333333, 1, 0, 1,
-0.8717768, 0.1473175, -2.272594, 0.7294118, 1, 0, 1,
-0.8713986, -0.5259252, -2.271113, 0.7215686, 1, 0, 1,
-0.867995, 0.4771046, -0.1539931, 0.7176471, 1, 0, 1,
-0.8566573, 1.484023, 0.6504143, 0.7098039, 1, 0, 1,
-0.8555792, 0.2720771, -1.800991, 0.7058824, 1, 0, 1,
-0.8546093, 0.4657096, -1.590837, 0.6980392, 1, 0, 1,
-0.8539333, -0.2812776, -0.6822507, 0.6901961, 1, 0, 1,
-0.850021, -0.8962336, -2.737223, 0.6862745, 1, 0, 1,
-0.8483213, 1.485759, -0.459565, 0.6784314, 1, 0, 1,
-0.8477927, 0.8902441, -0.1529105, 0.6745098, 1, 0, 1,
-0.8476163, -0.3758514, -1.593248, 0.6666667, 1, 0, 1,
-0.8444157, -0.1637278, -1.535838, 0.6627451, 1, 0, 1,
-0.8408996, 0.1891234, -1.644523, 0.654902, 1, 0, 1,
-0.8365252, 0.5381233, -0.2418902, 0.6509804, 1, 0, 1,
-0.8358201, 1.48172, -0.266318, 0.6431373, 1, 0, 1,
-0.8288281, 1.066543, -2.419595, 0.6392157, 1, 0, 1,
-0.8214639, -1.213024, -3.704256, 0.6313726, 1, 0, 1,
-0.8086318, 1.626742, -0.2487762, 0.627451, 1, 0, 1,
-0.803381, 1.248498, -1.88163, 0.6196079, 1, 0, 1,
-0.8022614, -0.2781703, -1.615953, 0.6156863, 1, 0, 1,
-0.8012515, -0.8370541, -2.334345, 0.6078432, 1, 0, 1,
-0.7990147, 0.7192816, -0.5477962, 0.6039216, 1, 0, 1,
-0.7943982, -0.3164949, -3.170865, 0.5960785, 1, 0, 1,
-0.792996, 0.3580853, -0.7120804, 0.5882353, 1, 0, 1,
-0.7907596, 0.731093, -2.354855, 0.5843138, 1, 0, 1,
-0.7866798, 1.89844, -0.564958, 0.5764706, 1, 0, 1,
-0.7686791, -1.828537, -3.715471, 0.572549, 1, 0, 1,
-0.7682468, 0.04643725, 0.820694, 0.5647059, 1, 0, 1,
-0.7633679, 0.3130978, -1.728127, 0.5607843, 1, 0, 1,
-0.7613233, -1.686463, -1.061569, 0.5529412, 1, 0, 1,
-0.751436, -0.9485326, -3.204921, 0.5490196, 1, 0, 1,
-0.7507837, -0.7568907, -1.683415, 0.5411765, 1, 0, 1,
-0.7494663, -0.3193593, -1.8103, 0.5372549, 1, 0, 1,
-0.7409228, 0.6214842, -3.432694, 0.5294118, 1, 0, 1,
-0.7356411, 0.8616125, -1.85063, 0.5254902, 1, 0, 1,
-0.7288366, -0.5712327, -1.52897, 0.5176471, 1, 0, 1,
-0.7261608, 1.284516, -0.4574246, 0.5137255, 1, 0, 1,
-0.7252985, 0.07475963, -0.1798574, 0.5058824, 1, 0, 1,
-0.7245944, 1.264315, 0.05940307, 0.5019608, 1, 0, 1,
-0.7216974, -2.141059, -5.179978, 0.4941176, 1, 0, 1,
-0.7215437, 0.9810826, -1.863171, 0.4862745, 1, 0, 1,
-0.7189309, -0.868417, -3.381389, 0.4823529, 1, 0, 1,
-0.716509, -0.6434427, -2.106896, 0.4745098, 1, 0, 1,
-0.7139447, -1.323579, -1.118528, 0.4705882, 1, 0, 1,
-0.7118875, 0.2284531, -1.032234, 0.4627451, 1, 0, 1,
-0.709957, -0.9664891, -3.116524, 0.4588235, 1, 0, 1,
-0.7094821, 0.3085256, -1.960758, 0.4509804, 1, 0, 1,
-0.7023332, 1.763964, 0.2588714, 0.4470588, 1, 0, 1,
-0.6982536, 0.2383925, -1.502087, 0.4392157, 1, 0, 1,
-0.6970856, -1.413038, -1.759235, 0.4352941, 1, 0, 1,
-0.6955211, -1.319408, -3.493717, 0.427451, 1, 0, 1,
-0.6929061, -0.6547127, -3.161433, 0.4235294, 1, 0, 1,
-0.6906764, 2.531984, 1.367903, 0.4156863, 1, 0, 1,
-0.6871175, -1.802906, -4.154649, 0.4117647, 1, 0, 1,
-0.6857498, -1.332499, -3.036245, 0.4039216, 1, 0, 1,
-0.6844646, -1.535896, -3.643139, 0.3960784, 1, 0, 1,
-0.6828333, -0.4176764, -1.964107, 0.3921569, 1, 0, 1,
-0.678834, -0.9912875, -2.127187, 0.3843137, 1, 0, 1,
-0.6779575, -0.5262807, -2.036419, 0.3803922, 1, 0, 1,
-0.6637263, 0.5587645, 0.2275325, 0.372549, 1, 0, 1,
-0.6629426, 0.006438237, -0.7863851, 0.3686275, 1, 0, 1,
-0.6600826, -0.6944943, -1.627904, 0.3607843, 1, 0, 1,
-0.6576352, -1.458491, -3.244125, 0.3568628, 1, 0, 1,
-0.6535508, -0.3196759, -1.011609, 0.3490196, 1, 0, 1,
-0.6457799, 0.2764163, -0.8492065, 0.345098, 1, 0, 1,
-0.6342635, 0.841316, -0.826761, 0.3372549, 1, 0, 1,
-0.6333363, 1.369436, -0.8141234, 0.3333333, 1, 0, 1,
-0.6322832, -0.8365114, -1.491487, 0.3254902, 1, 0, 1,
-0.6314746, 0.1955512, -2.393744, 0.3215686, 1, 0, 1,
-0.6278284, 0.02455959, -3.414598, 0.3137255, 1, 0, 1,
-0.6266037, -2.284129, -0.3586142, 0.3098039, 1, 0, 1,
-0.6255901, -0.9338536, -2.009201, 0.3019608, 1, 0, 1,
-0.6253622, 1.760437, -2.443357, 0.2941177, 1, 0, 1,
-0.6248034, 0.396265, -0.6462077, 0.2901961, 1, 0, 1,
-0.6162536, -1.568615, -2.879386, 0.282353, 1, 0, 1,
-0.6137593, 1.139224, -1.167367, 0.2784314, 1, 0, 1,
-0.6128824, 0.3651039, -2.163029, 0.2705882, 1, 0, 1,
-0.6049148, 1.000915, -1.578097, 0.2666667, 1, 0, 1,
-0.6025111, -0.6154261, -2.96892, 0.2588235, 1, 0, 1,
-0.6001109, 0.2328584, -0.8479069, 0.254902, 1, 0, 1,
-0.5968348, -1.431924, -3.13973, 0.2470588, 1, 0, 1,
-0.5886848, -0.8281286, -1.052444, 0.2431373, 1, 0, 1,
-0.5878832, -0.4405537, -2.658171, 0.2352941, 1, 0, 1,
-0.5853145, -0.01171486, -2.911784, 0.2313726, 1, 0, 1,
-0.583472, -0.7448509, -3.060781, 0.2235294, 1, 0, 1,
-0.5826643, -1.540419, -3.122071, 0.2196078, 1, 0, 1,
-0.5760011, -0.616084, -2.650978, 0.2117647, 1, 0, 1,
-0.5725551, -0.4745703, -4.161817, 0.2078431, 1, 0, 1,
-0.5676232, -0.9099305, -3.616367, 0.2, 1, 0, 1,
-0.5659271, 0.2212227, -0.2553882, 0.1921569, 1, 0, 1,
-0.565283, 1.30521, -1.376605, 0.1882353, 1, 0, 1,
-0.5649351, -0.6978383, -4.003905, 0.1803922, 1, 0, 1,
-0.5542561, -0.3616584, -2.594173, 0.1764706, 1, 0, 1,
-0.5487179, -0.1647881, -0.6773196, 0.1686275, 1, 0, 1,
-0.5459958, 1.816202, 1.021192, 0.1647059, 1, 0, 1,
-0.5458645, 0.1502621, -3.379532, 0.1568628, 1, 0, 1,
-0.5414421, -0.1219885, -2.420248, 0.1529412, 1, 0, 1,
-0.5380963, -0.3946886, -2.225825, 0.145098, 1, 0, 1,
-0.5373219, -0.03502962, -0.7937105, 0.1411765, 1, 0, 1,
-0.5369465, 0.2571217, -1.517936, 0.1333333, 1, 0, 1,
-0.5339395, 1.409375, 0.5511169, 0.1294118, 1, 0, 1,
-0.5338705, -1.188157, -1.431705, 0.1215686, 1, 0, 1,
-0.5289935, -1.980307, -2.323246, 0.1176471, 1, 0, 1,
-0.5159584, 0.4124803, -0.5577321, 0.1098039, 1, 0, 1,
-0.5120895, 0.6473431, 0.1740481, 0.1058824, 1, 0, 1,
-0.5084313, 0.5392713, -1.916897, 0.09803922, 1, 0, 1,
-0.5062535, -0.3255591, -2.327452, 0.09019608, 1, 0, 1,
-0.502586, 0.3738004, -0.3881555, 0.08627451, 1, 0, 1,
-0.5024824, -0.7497642, -2.641721, 0.07843138, 1, 0, 1,
-0.5016547, -0.1501492, -1.150999, 0.07450981, 1, 0, 1,
-0.5015723, 0.4581007, -0.8888867, 0.06666667, 1, 0, 1,
-0.5009529, -1.030926, -2.206626, 0.0627451, 1, 0, 1,
-0.5001205, 0.8102576, 0.1984241, 0.05490196, 1, 0, 1,
-0.4999237, 0.6619673, -0.8368803, 0.05098039, 1, 0, 1,
-0.4953131, 0.5991639, -0.7908614, 0.04313726, 1, 0, 1,
-0.4909578, 0.5466933, 0.472012, 0.03921569, 1, 0, 1,
-0.4886557, 0.4961889, -2.321658, 0.03137255, 1, 0, 1,
-0.4839181, 0.4591622, -1.195559, 0.02745098, 1, 0, 1,
-0.4835297, -0.8627477, -2.541425, 0.01960784, 1, 0, 1,
-0.4831643, 1.514797, -2.037317, 0.01568628, 1, 0, 1,
-0.4816082, 1.853803, -0.4181284, 0.007843138, 1, 0, 1,
-0.479514, -0.6358591, -4.461051, 0.003921569, 1, 0, 1,
-0.4772938, -0.9766467, -1.908209, 0, 1, 0.003921569, 1,
-0.4770456, 0.07959087, -1.175233, 0, 1, 0.01176471, 1,
-0.4750642, -0.2263869, -0.708205, 0, 1, 0.01568628, 1,
-0.4735905, -0.008450984, -1.132392, 0, 1, 0.02352941, 1,
-0.4735679, 0.5744439, -1.941866, 0, 1, 0.02745098, 1,
-0.4675905, -0.2169168, -1.965849, 0, 1, 0.03529412, 1,
-0.46731, 0.8886532, -0.378527, 0, 1, 0.03921569, 1,
-0.4642855, 1.007883, -0.06803756, 0, 1, 0.04705882, 1,
-0.4527549, -0.005889074, -1.55403, 0, 1, 0.05098039, 1,
-0.445916, -1.436568, -2.275723, 0, 1, 0.05882353, 1,
-0.4353079, 0.4385101, -1.443788, 0, 1, 0.0627451, 1,
-0.4330408, 0.6417302, 2.254545, 0, 1, 0.07058824, 1,
-0.4324648, -0.6547794, -2.606778, 0, 1, 0.07450981, 1,
-0.4291588, -0.006888964, -0.397682, 0, 1, 0.08235294, 1,
-0.4283931, 0.00205068, -1.812041, 0, 1, 0.08627451, 1,
-0.4276224, -0.3021125, -4.17294, 0, 1, 0.09411765, 1,
-0.4238912, -0.3817558, -1.992669, 0, 1, 0.1019608, 1,
-0.4223159, -0.7449543, -2.952981, 0, 1, 0.1058824, 1,
-0.4205556, 0.2841843, -0.6283661, 0, 1, 0.1137255, 1,
-0.4191794, 0.5739802, -0.01408712, 0, 1, 0.1176471, 1,
-0.4151416, -1.630808, -1.213681, 0, 1, 0.1254902, 1,
-0.4123287, 0.5669575, -1.533043, 0, 1, 0.1294118, 1,
-0.4093922, 0.1332073, -2.306267, 0, 1, 0.1372549, 1,
-0.4055786, -0.4899465, -3.565093, 0, 1, 0.1411765, 1,
-0.4055529, 1.331913, 0.6159412, 0, 1, 0.1490196, 1,
-0.4030221, -1.197488, -4.729147, 0, 1, 0.1529412, 1,
-0.4025913, -2.446451, -3.61695, 0, 1, 0.1607843, 1,
-0.4025702, 1.054985, 0.7429013, 0, 1, 0.1647059, 1,
-0.4013195, -0.1597035, -1.850382, 0, 1, 0.172549, 1,
-0.3997119, 1.495344, -0.3080441, 0, 1, 0.1764706, 1,
-0.395382, -0.2142547, -2.310689, 0, 1, 0.1843137, 1,
-0.3930155, 0.07327902, 0.4847216, 0, 1, 0.1882353, 1,
-0.391273, 0.2326199, -1.27589, 0, 1, 0.1960784, 1,
-0.3851951, 0.926379, -1.125309, 0, 1, 0.2039216, 1,
-0.3836233, -1.076242, -3.492549, 0, 1, 0.2078431, 1,
-0.3832172, -1.410077, -2.189171, 0, 1, 0.2156863, 1,
-0.3824663, -0.6632177, -2.540358, 0, 1, 0.2196078, 1,
-0.3822381, 1.452672, 0.9462568, 0, 1, 0.227451, 1,
-0.3812654, -2.257353, -3.389463, 0, 1, 0.2313726, 1,
-0.3791407, 1.205693, -2.163344, 0, 1, 0.2392157, 1,
-0.3783863, -0.4812849, -2.612354, 0, 1, 0.2431373, 1,
-0.3782198, -0.003959076, -1.653316, 0, 1, 0.2509804, 1,
-0.3774466, -1.880817, -2.443079, 0, 1, 0.254902, 1,
-0.375376, -0.9884426, -3.715837, 0, 1, 0.2627451, 1,
-0.3750508, -1.687634, -2.093444, 0, 1, 0.2666667, 1,
-0.3742739, 1.200609, -2.658607, 0, 1, 0.2745098, 1,
-0.3726692, 0.2993359, -1.573585, 0, 1, 0.2784314, 1,
-0.3720208, 1.252982, -1.009401, 0, 1, 0.2862745, 1,
-0.3710588, 0.1520474, -0.4244288, 0, 1, 0.2901961, 1,
-0.3660732, 1.207256, -0.6625477, 0, 1, 0.2980392, 1,
-0.3621741, -1.07012, -2.869854, 0, 1, 0.3058824, 1,
-0.3614452, 0.03597499, -1.269098, 0, 1, 0.3098039, 1,
-0.359663, -1.491595, -2.528298, 0, 1, 0.3176471, 1,
-0.3581783, -0.002881025, -1.105763, 0, 1, 0.3215686, 1,
-0.3564618, 0.2811806, 0.4821757, 0, 1, 0.3294118, 1,
-0.3474105, 0.8454239, -2.594656, 0, 1, 0.3333333, 1,
-0.3441937, -0.06686308, -2.328145, 0, 1, 0.3411765, 1,
-0.3411606, 0.0363677, -0.5426401, 0, 1, 0.345098, 1,
-0.3411055, -0.6366916, -3.995112, 0, 1, 0.3529412, 1,
-0.3368838, -1.903228, -3.214636, 0, 1, 0.3568628, 1,
-0.3353255, -0.9241088, -4.109648, 0, 1, 0.3647059, 1,
-0.3319227, 0.5844532, -0.07256537, 0, 1, 0.3686275, 1,
-0.3308805, 2.958257, 0.9347559, 0, 1, 0.3764706, 1,
-0.3237369, -0.607688, -2.461697, 0, 1, 0.3803922, 1,
-0.3215879, -0.6905596, -3.25887, 0, 1, 0.3882353, 1,
-0.3209353, -0.2424617, -3.347527, 0, 1, 0.3921569, 1,
-0.314114, 1.268295, 0.61927, 0, 1, 0.4, 1,
-0.3138982, -0.136411, -2.751636, 0, 1, 0.4078431, 1,
-0.3114143, 1.033585, -3.318746, 0, 1, 0.4117647, 1,
-0.3062708, 0.1327811, -0.9412943, 0, 1, 0.4196078, 1,
-0.3039178, 2.124507, 0.1576383, 0, 1, 0.4235294, 1,
-0.3023213, 0.5684325, -1.390758, 0, 1, 0.4313726, 1,
-0.3017119, -0.8369385, -4.031507, 0, 1, 0.4352941, 1,
-0.3010502, -0.4188101, -2.360774, 0, 1, 0.4431373, 1,
-0.2992247, 0.361248, -1.267638, 0, 1, 0.4470588, 1,
-0.2971816, -0.269783, -3.451301, 0, 1, 0.454902, 1,
-0.2957827, -0.6719865, -1.732502, 0, 1, 0.4588235, 1,
-0.2944619, 0.6705681, -1.661548, 0, 1, 0.4666667, 1,
-0.2944221, -2.131471, -4.246802, 0, 1, 0.4705882, 1,
-0.293512, -0.5373014, -0.2147864, 0, 1, 0.4784314, 1,
-0.2933078, 2.057437, -1.10003, 0, 1, 0.4823529, 1,
-0.2888871, 0.6960319, 0.5585369, 0, 1, 0.4901961, 1,
-0.287552, 1.155311, -0.6212479, 0, 1, 0.4941176, 1,
-0.2837605, 0.7115523, 0.328239, 0, 1, 0.5019608, 1,
-0.283042, -1.120375, -3.237292, 0, 1, 0.509804, 1,
-0.2798063, 1.275171, 1.543008, 0, 1, 0.5137255, 1,
-0.275382, -1.255371, -2.205709, 0, 1, 0.5215687, 1,
-0.2669544, -0.2492962, -2.085006, 0, 1, 0.5254902, 1,
-0.2663889, 0.5230924, -1.415059, 0, 1, 0.5333334, 1,
-0.2658114, -0.1877894, -1.704466, 0, 1, 0.5372549, 1,
-0.2658063, -0.6119447, -1.159065, 0, 1, 0.5450981, 1,
-0.2649963, -0.5897778, -2.468946, 0, 1, 0.5490196, 1,
-0.2649364, -0.5418743, -2.133339, 0, 1, 0.5568628, 1,
-0.2585687, 1.841787, 1.043168, 0, 1, 0.5607843, 1,
-0.2566147, 1.181504, 1.565872, 0, 1, 0.5686275, 1,
-0.2540421, -1.327034, -4.564501, 0, 1, 0.572549, 1,
-0.2484783, -1.703866, -2.849459, 0, 1, 0.5803922, 1,
-0.2474349, 1.73441, -0.8718451, 0, 1, 0.5843138, 1,
-0.2473903, -1.330353, -2.263453, 0, 1, 0.5921569, 1,
-0.2470071, 0.0176768, -0.2209262, 0, 1, 0.5960785, 1,
-0.2461245, 1.675338, -1.831093, 0, 1, 0.6039216, 1,
-0.2445931, -0.04218662, -2.5988, 0, 1, 0.6117647, 1,
-0.2445026, 0.1156768, -1.440885, 0, 1, 0.6156863, 1,
-0.2414, 0.7573786, 2.112818, 0, 1, 0.6235294, 1,
-0.2362375, -0.3662055, -3.502774, 0, 1, 0.627451, 1,
-0.2359571, 1.238715, -0.07593059, 0, 1, 0.6352941, 1,
-0.2340823, -0.6062294, -3.998788, 0, 1, 0.6392157, 1,
-0.230203, -3.260984, -2.965363, 0, 1, 0.6470588, 1,
-0.2293811, -1.349879, -3.119811, 0, 1, 0.6509804, 1,
-0.2231447, -0.01665745, -2.591708, 0, 1, 0.6588235, 1,
-0.221834, -1.964423, -1.373743, 0, 1, 0.6627451, 1,
-0.2216779, 0.8231228, -1.661683, 0, 1, 0.6705883, 1,
-0.2209474, -0.1247576, -3.086587, 0, 1, 0.6745098, 1,
-0.2088504, -0.2140794, -3.871183, 0, 1, 0.682353, 1,
-0.2078388, -1.052851, -3.882411, 0, 1, 0.6862745, 1,
-0.1995137, 0.07500903, -0.9812555, 0, 1, 0.6941177, 1,
-0.1966017, -0.3309978, -3.070554, 0, 1, 0.7019608, 1,
-0.1954201, -0.9269059, -1.196412, 0, 1, 0.7058824, 1,
-0.1946575, 0.6057789, 0.01609461, 0, 1, 0.7137255, 1,
-0.1907511, -0.5375229, -3.390179, 0, 1, 0.7176471, 1,
-0.1899997, 0.6549955, -0.2469127, 0, 1, 0.7254902, 1,
-0.1793481, -0.1530184, -2.915411, 0, 1, 0.7294118, 1,
-0.1782925, 0.1693092, -1.276136, 0, 1, 0.7372549, 1,
-0.1690711, -0.06297476, -1.4006, 0, 1, 0.7411765, 1,
-0.1641247, 0.1394719, -2.081123, 0, 1, 0.7490196, 1,
-0.163868, -0.9696223, -2.474644, 0, 1, 0.7529412, 1,
-0.1610291, 0.7681895, 0.704013, 0, 1, 0.7607843, 1,
-0.1582071, 1.015879, -1.360228, 0, 1, 0.7647059, 1,
-0.1555189, 1.804998, -0.864106, 0, 1, 0.772549, 1,
-0.1542272, -0.7298242, -0.8910576, 0, 1, 0.7764706, 1,
-0.1459544, 0.4974798, -1.1178, 0, 1, 0.7843137, 1,
-0.1423955, 1.020734, 1.528491, 0, 1, 0.7882353, 1,
-0.1376571, -0.5167361, -1.641963, 0, 1, 0.7960784, 1,
-0.1373264, 0.6065183, -0.7578774, 0, 1, 0.8039216, 1,
-0.1313242, -1.09306, -1.01782, 0, 1, 0.8078431, 1,
-0.1289388, 0.2112122, -2.343884, 0, 1, 0.8156863, 1,
-0.1277042, 1.148201, -0.2774909, 0, 1, 0.8196079, 1,
-0.1212657, 0.5739737, -0.1655073, 0, 1, 0.827451, 1,
-0.1133232, 0.9250105, -1.188312, 0, 1, 0.8313726, 1,
-0.1105045, 1.596859, 0.6308488, 0, 1, 0.8392157, 1,
-0.1092658, -0.3739107, -3.192203, 0, 1, 0.8431373, 1,
-0.08839448, 1.211105, 2.657762, 0, 1, 0.8509804, 1,
-0.08826144, 1.464399, -1.498255, 0, 1, 0.854902, 1,
-0.08775979, 0.2187487, -1.130796, 0, 1, 0.8627451, 1,
-0.085367, -0.6465839, -4.003193, 0, 1, 0.8666667, 1,
-0.08430369, 0.6741907, 0.9219956, 0, 1, 0.8745098, 1,
-0.08328319, -0.7844325, -3.558116, 0, 1, 0.8784314, 1,
-0.07889409, 0.9972462, 0.07976595, 0, 1, 0.8862745, 1,
-0.07020012, -0.9567559, -2.775227, 0, 1, 0.8901961, 1,
-0.06978676, 0.640923, -1.354433, 0, 1, 0.8980392, 1,
-0.06765868, 2.037262, 0.9864445, 0, 1, 0.9058824, 1,
-0.06439527, -0.384578, -2.448044, 0, 1, 0.9098039, 1,
-0.05862317, 0.03304008, -0.9882025, 0, 1, 0.9176471, 1,
-0.05856837, 1.149969, -1.407766, 0, 1, 0.9215686, 1,
-0.05381058, 0.62402, -0.65625, 0, 1, 0.9294118, 1,
-0.05344987, 0.6880025, 0.07304736, 0, 1, 0.9333333, 1,
-0.05049284, -1.085651, -3.011041, 0, 1, 0.9411765, 1,
-0.04954878, 0.2620256, 1.963177, 0, 1, 0.945098, 1,
-0.04629772, -0.5943103, -1.831225, 0, 1, 0.9529412, 1,
-0.04458557, 0.148224, -1.029065, 0, 1, 0.9568627, 1,
-0.04185197, -0.1617482, -2.146965, 0, 1, 0.9647059, 1,
-0.04110725, 0.4368284, 0.7909489, 0, 1, 0.9686275, 1,
-0.03386613, 0.06710033, 0.02746483, 0, 1, 0.9764706, 1,
-0.03097393, -0.1439431, -3.153611, 0, 1, 0.9803922, 1,
-0.02695392, 0.817091, -0.2498035, 0, 1, 0.9882353, 1,
-0.02604962, -0.3457198, -3.571026, 0, 1, 0.9921569, 1,
-0.02006145, 0.1081982, -1.483547, 0, 1, 1, 1,
-0.01058448, -0.9584554, -2.08631, 0, 0.9921569, 1, 1,
-0.01037926, -1.896639, -4.0397, 0, 0.9882353, 1, 1,
-0.006850412, -1.735031, -2.837905, 0, 0.9803922, 1, 1,
-0.001903595, 1.171041, -0.1113402, 0, 0.9764706, 1, 1,
-0.001240401, 1.773973, -0.4508854, 0, 0.9686275, 1, 1,
0.001803433, 0.3881898, -0.4829753, 0, 0.9647059, 1, 1,
0.003136571, 1.008549, -0.8410648, 0, 0.9568627, 1, 1,
0.004614434, -0.2197195, 2.00702, 0, 0.9529412, 1, 1,
0.008065833, 1.621141, 0.1566886, 0, 0.945098, 1, 1,
0.009498449, 0.9519393, 0.1867618, 0, 0.9411765, 1, 1,
0.01057958, 0.2481873, -0.3428863, 0, 0.9333333, 1, 1,
0.01153638, -0.4607333, 4.730957, 0, 0.9294118, 1, 1,
0.01628843, -1.58382, 2.58269, 0, 0.9215686, 1, 1,
0.01711076, -0.8900908, 2.84801, 0, 0.9176471, 1, 1,
0.02139313, 0.8295844, 0.1480527, 0, 0.9098039, 1, 1,
0.02184427, 0.06598953, 2.008237, 0, 0.9058824, 1, 1,
0.02470801, -0.9543271, 2.653916, 0, 0.8980392, 1, 1,
0.02472495, 0.4473625, -1.770409, 0, 0.8901961, 1, 1,
0.02552399, 1.328449, -1.192005, 0, 0.8862745, 1, 1,
0.03045924, -0.07679775, 3.188899, 0, 0.8784314, 1, 1,
0.03305187, -0.8218289, 1.577081, 0, 0.8745098, 1, 1,
0.03351954, 0.8574903, 0.1073731, 0, 0.8666667, 1, 1,
0.03420024, -0.5858042, 3.638504, 0, 0.8627451, 1, 1,
0.03807431, -0.166315, 2.207239, 0, 0.854902, 1, 1,
0.03859313, 1.397262, 0.7622827, 0, 0.8509804, 1, 1,
0.03871458, 1.076302, 0.1729287, 0, 0.8431373, 1, 1,
0.04128098, -1.082572, 1.850718, 0, 0.8392157, 1, 1,
0.04135484, 0.1703777, 0.7705899, 0, 0.8313726, 1, 1,
0.04159539, -0.8853031, 4.587873, 0, 0.827451, 1, 1,
0.04358212, -2.777922, 3.089546, 0, 0.8196079, 1, 1,
0.04882678, -0.6388578, 1.105346, 0, 0.8156863, 1, 1,
0.04940072, -0.2918722, 1.016784, 0, 0.8078431, 1, 1,
0.05282582, -2.34843, 2.745653, 0, 0.8039216, 1, 1,
0.05345736, -0.3387272, 3.557399, 0, 0.7960784, 1, 1,
0.05652601, 0.6029832, 1.68073, 0, 0.7882353, 1, 1,
0.05758271, -0.2192386, 1.804708, 0, 0.7843137, 1, 1,
0.06231346, -0.4706069, 3.766224, 0, 0.7764706, 1, 1,
0.06383206, 2.349556, -0.1024582, 0, 0.772549, 1, 1,
0.06503092, 1.039392, 0.02609372, 0, 0.7647059, 1, 1,
0.06792846, -1.409014, 3.533248, 0, 0.7607843, 1, 1,
0.07696951, -0.9846274, 3.10399, 0, 0.7529412, 1, 1,
0.08028292, 1.114069, 0.7131418, 0, 0.7490196, 1, 1,
0.08263584, 0.1467661, 0.8502731, 0, 0.7411765, 1, 1,
0.0847396, 1.53469, 0.2098029, 0, 0.7372549, 1, 1,
0.08573778, -1.140465, 5.182669, 0, 0.7294118, 1, 1,
0.0890775, -0.407803, 2.59774, 0, 0.7254902, 1, 1,
0.09261139, 0.9294347, 1.157484, 0, 0.7176471, 1, 1,
0.09494966, 0.4943887, 2.100717, 0, 0.7137255, 1, 1,
0.1012614, 1.508811, -1.284743, 0, 0.7058824, 1, 1,
0.1014425, 1.291099, 1.110587, 0, 0.6980392, 1, 1,
0.1024183, 0.3115375, 0.000475772, 0, 0.6941177, 1, 1,
0.1063025, 0.730274, -0.01582827, 0, 0.6862745, 1, 1,
0.114882, 1.189974, -0.2193422, 0, 0.682353, 1, 1,
0.1149897, 0.9237744, 0.8361863, 0, 0.6745098, 1, 1,
0.1156558, 0.4766198, -1.750328, 0, 0.6705883, 1, 1,
0.1173942, -1.768323, 2.530534, 0, 0.6627451, 1, 1,
0.1182136, -1.527397, 2.525367, 0, 0.6588235, 1, 1,
0.1187736, 0.2510138, 0.6359005, 0, 0.6509804, 1, 1,
0.1285345, -0.07515574, 2.188105, 0, 0.6470588, 1, 1,
0.1309998, 1.633404, 1.364091, 0, 0.6392157, 1, 1,
0.1320492, -0.009801816, 0.1004789, 0, 0.6352941, 1, 1,
0.1387926, -1.639718, 3.236457, 0, 0.627451, 1, 1,
0.1463335, 0.127085, 2.595665, 0, 0.6235294, 1, 1,
0.1510934, -0.8927284, 3.025959, 0, 0.6156863, 1, 1,
0.1543226, -2.293999, 3.957481, 0, 0.6117647, 1, 1,
0.1551325, -1.008064, 3.382025, 0, 0.6039216, 1, 1,
0.1589999, 0.618365, -0.9443719, 0, 0.5960785, 1, 1,
0.1627473, 0.5505717, 1.723113, 0, 0.5921569, 1, 1,
0.1635665, 0.2792576, 2.453072, 0, 0.5843138, 1, 1,
0.1691778, -2.272054, 2.38976, 0, 0.5803922, 1, 1,
0.1754747, 1.487432, 2.01581, 0, 0.572549, 1, 1,
0.1818159, 1.561303, -1.503637, 0, 0.5686275, 1, 1,
0.1880776, 0.6020374, 1.393039, 0, 0.5607843, 1, 1,
0.1892027, 1.150416, 1.408217, 0, 0.5568628, 1, 1,
0.1919126, -1.376629, 2.469555, 0, 0.5490196, 1, 1,
0.1948041, -0.9550498, 2.579728, 0, 0.5450981, 1, 1,
0.1979676, 1.028755, -0.3427498, 0, 0.5372549, 1, 1,
0.2009245, -0.2167388, 1.516347, 0, 0.5333334, 1, 1,
0.2023427, -1.403109, 1.883222, 0, 0.5254902, 1, 1,
0.2060149, -1.530992, 1.785835, 0, 0.5215687, 1, 1,
0.2111181, -0.2814075, 2.326279, 0, 0.5137255, 1, 1,
0.211165, 1.130682, 1.455158, 0, 0.509804, 1, 1,
0.2112201, 0.6838176, 0.6529241, 0, 0.5019608, 1, 1,
0.2113259, -0.1188442, 2.338211, 0, 0.4941176, 1, 1,
0.2114561, 1.78053, 1.486625, 0, 0.4901961, 1, 1,
0.2148097, 0.3094104, 1.04675, 0, 0.4823529, 1, 1,
0.2149043, -1.627132, 1.495741, 0, 0.4784314, 1, 1,
0.2174244, -0.390161, 4.050068, 0, 0.4705882, 1, 1,
0.2174799, 1.799913, 0.9159436, 0, 0.4666667, 1, 1,
0.218567, 1.523581, 0.9652961, 0, 0.4588235, 1, 1,
0.2186388, 1.541344, 1.502599, 0, 0.454902, 1, 1,
0.2417318, 0.1539255, 1.227312, 0, 0.4470588, 1, 1,
0.2459248, -0.5233164, 2.056428, 0, 0.4431373, 1, 1,
0.2522536, 2.451674, 0.706467, 0, 0.4352941, 1, 1,
0.2522754, 1.912266, 0.7302714, 0, 0.4313726, 1, 1,
0.2524191, 2.024685, 0.2745152, 0, 0.4235294, 1, 1,
0.2528066, 0.176521, 0.4445842, 0, 0.4196078, 1, 1,
0.2534691, -0.7328832, 2.703202, 0, 0.4117647, 1, 1,
0.2554937, 1.865161, 1.492967, 0, 0.4078431, 1, 1,
0.2566655, 0.1848986, -0.1529223, 0, 0.4, 1, 1,
0.2636016, 0.110652, 1.340302, 0, 0.3921569, 1, 1,
0.2659464, -1.063245, 2.447495, 0, 0.3882353, 1, 1,
0.2687953, 1.235988, -1.477749, 0, 0.3803922, 1, 1,
0.2770667, 0.4161012, -0.167691, 0, 0.3764706, 1, 1,
0.2815093, 0.2945724, 0.7301529, 0, 0.3686275, 1, 1,
0.2826337, 0.06173806, 1.759984, 0, 0.3647059, 1, 1,
0.2844472, -0.2049869, 1.205278, 0, 0.3568628, 1, 1,
0.2867441, -0.4103373, 3.849195, 0, 0.3529412, 1, 1,
0.2917289, 0.3280168, 0.2799427, 0, 0.345098, 1, 1,
0.2933856, 0.3317667, 2.921148, 0, 0.3411765, 1, 1,
0.2991668, 1.092384, -0.7193161, 0, 0.3333333, 1, 1,
0.3009569, 0.9184532, 0.05656655, 0, 0.3294118, 1, 1,
0.3026344, 1.790764, 0.1953804, 0, 0.3215686, 1, 1,
0.3029278, 0.6062077, 0.05724917, 0, 0.3176471, 1, 1,
0.3062334, 0.1459699, 1.901331, 0, 0.3098039, 1, 1,
0.3068191, 1.192359, 0.2340206, 0, 0.3058824, 1, 1,
0.3080686, -0.2179841, 1.797109, 0, 0.2980392, 1, 1,
0.3085887, -0.5112936, 1.275833, 0, 0.2901961, 1, 1,
0.3145816, 0.2389095, 0.08611988, 0, 0.2862745, 1, 1,
0.3194367, -0.8287247, 2.401516, 0, 0.2784314, 1, 1,
0.3199994, 0.7505035, -0.695738, 0, 0.2745098, 1, 1,
0.3205263, -0.972097, 3.322003, 0, 0.2666667, 1, 1,
0.3267654, -1.64118, 1.720915, 0, 0.2627451, 1, 1,
0.3276711, -1.262039, 2.05623, 0, 0.254902, 1, 1,
0.3330477, 0.313002, 0.1301764, 0, 0.2509804, 1, 1,
0.3341852, 0.9363144, -0.6204439, 0, 0.2431373, 1, 1,
0.3351863, 0.9592254, 0.1846795, 0, 0.2392157, 1, 1,
0.3397169, 1.037588, 2.224022, 0, 0.2313726, 1, 1,
0.3416615, -0.08546801, 2.506416, 0, 0.227451, 1, 1,
0.3488785, 0.577515, -1.070512, 0, 0.2196078, 1, 1,
0.3579593, -1.395362, 1.941081, 0, 0.2156863, 1, 1,
0.3615725, -0.4083846, 2.918217, 0, 0.2078431, 1, 1,
0.3616325, 0.9026862, 3.134747, 0, 0.2039216, 1, 1,
0.3618474, -0.6229691, 3.380117, 0, 0.1960784, 1, 1,
0.3661418, 1.830049, 0.9516345, 0, 0.1882353, 1, 1,
0.3662793, 1.743303, 0.214575, 0, 0.1843137, 1, 1,
0.3698154, -0.2027073, 2.139685, 0, 0.1764706, 1, 1,
0.3701696, -1.118488, 2.830726, 0, 0.172549, 1, 1,
0.3742455, -1.719484, 2.086998, 0, 0.1647059, 1, 1,
0.375401, -0.9744366, 2.767118, 0, 0.1607843, 1, 1,
0.3771966, 1.202668, -0.9375904, 0, 0.1529412, 1, 1,
0.3821441, -1.811638, 1.993052, 0, 0.1490196, 1, 1,
0.3828801, -1.801526, 2.492787, 0, 0.1411765, 1, 1,
0.3842782, -0.00704022, 1.380062, 0, 0.1372549, 1, 1,
0.3846697, 1.092141, 0.9994155, 0, 0.1294118, 1, 1,
0.3853376, -1.364686, 2.324912, 0, 0.1254902, 1, 1,
0.386583, 1.126392, 0.870195, 0, 0.1176471, 1, 1,
0.3874103, 0.05280465, 1.179136, 0, 0.1137255, 1, 1,
0.3900653, 0.08935285, 1.66308, 0, 0.1058824, 1, 1,
0.3960162, 0.5873007, 0.8946455, 0, 0.09803922, 1, 1,
0.401795, -0.8162788, 3.689864, 0, 0.09411765, 1, 1,
0.4030228, 0.4540796, 1.134486, 0, 0.08627451, 1, 1,
0.4059138, -0.3812334, 1.229166, 0, 0.08235294, 1, 1,
0.4076956, 0.433843, 1.503717, 0, 0.07450981, 1, 1,
0.4082841, 0.3286291, 0.8986536, 0, 0.07058824, 1, 1,
0.4099935, -1.671621, 2.110017, 0, 0.0627451, 1, 1,
0.4105693, 1.828441, -1.218938, 0, 0.05882353, 1, 1,
0.4222975, -1.42148, 3.636874, 0, 0.05098039, 1, 1,
0.4265542, 0.4299118, 1.013979, 0, 0.04705882, 1, 1,
0.427142, -0.9677507, 4.403477, 0, 0.03921569, 1, 1,
0.4320279, 0.1628377, 0.8024566, 0, 0.03529412, 1, 1,
0.4347093, 1.644083, 0.8776407, 0, 0.02745098, 1, 1,
0.4362033, 0.1517339, 0.2515479, 0, 0.02352941, 1, 1,
0.4363441, 1.243957, -1.951089, 0, 0.01568628, 1, 1,
0.4393696, 1.732138, 1.847673, 0, 0.01176471, 1, 1,
0.439598, -0.4308876, 1.909081, 0, 0.003921569, 1, 1,
0.4409546, -1.302904, 3.534887, 0.003921569, 0, 1, 1,
0.4444171, -0.7480103, 1.572542, 0.007843138, 0, 1, 1,
0.4500954, 0.4393237, 1.641382, 0.01568628, 0, 1, 1,
0.4594525, -0.6434686, 0.8603531, 0.01960784, 0, 1, 1,
0.4610541, -1.065382, 0.9823181, 0.02745098, 0, 1, 1,
0.4616059, 0.312273, 1.621293, 0.03137255, 0, 1, 1,
0.4682387, -0.1579122, 2.61439, 0.03921569, 0, 1, 1,
0.4684996, -1.269915, 3.147335, 0.04313726, 0, 1, 1,
0.471533, -0.347076, 1.932702, 0.05098039, 0, 1, 1,
0.4725417, 1.710758, 1.765549, 0.05490196, 0, 1, 1,
0.4732519, -1.176452, 1.816374, 0.0627451, 0, 1, 1,
0.4820087, -2.25691, 2.032514, 0.06666667, 0, 1, 1,
0.4831226, 0.3579517, -0.180012, 0.07450981, 0, 1, 1,
0.4843835, 2.324583, 0.9495373, 0.07843138, 0, 1, 1,
0.4854422, 1.315909, -0.4832317, 0.08627451, 0, 1, 1,
0.4970984, 0.5877392, 0.08538851, 0.09019608, 0, 1, 1,
0.5019493, -0.959673, 2.185158, 0.09803922, 0, 1, 1,
0.5090967, 0.683264, 0.3563321, 0.1058824, 0, 1, 1,
0.5144984, -2.472983, 3.373992, 0.1098039, 0, 1, 1,
0.5147191, 0.4061229, 1.587923, 0.1176471, 0, 1, 1,
0.5186492, -1.370582, 3.28187, 0.1215686, 0, 1, 1,
0.5186962, -0.750612, 3.086204, 0.1294118, 0, 1, 1,
0.530412, -0.681172, 2.905452, 0.1333333, 0, 1, 1,
0.5348254, 2.741582, 1.013616, 0.1411765, 0, 1, 1,
0.5374429, 0.9425166, -0.07856502, 0.145098, 0, 1, 1,
0.5375971, -0.5890568, 2.005217, 0.1529412, 0, 1, 1,
0.5473707, 1.478454, 0.3527629, 0.1568628, 0, 1, 1,
0.5501493, 0.870594, 1.559722, 0.1647059, 0, 1, 1,
0.5504055, -0.03259957, 1.190292, 0.1686275, 0, 1, 1,
0.5522459, 1.302103, -0.4665762, 0.1764706, 0, 1, 1,
0.5601642, 1.640509, 0.3990498, 0.1803922, 0, 1, 1,
0.5606586, -0.2830585, 1.261187, 0.1882353, 0, 1, 1,
0.5606709, 0.7535918, 0.05216107, 0.1921569, 0, 1, 1,
0.5635679, 0.4516265, 1.679726, 0.2, 0, 1, 1,
0.5661771, 0.1854079, 1.582736, 0.2078431, 0, 1, 1,
0.5726029, -0.923155, 1.404103, 0.2117647, 0, 1, 1,
0.573911, 0.3466954, 1.457465, 0.2196078, 0, 1, 1,
0.5740508, 0.8263121, 0.4177597, 0.2235294, 0, 1, 1,
0.5741942, 0.06206651, 1.063256, 0.2313726, 0, 1, 1,
0.5742785, 1.350577, 0.9842882, 0.2352941, 0, 1, 1,
0.5764182, -0.4439295, 1.378916, 0.2431373, 0, 1, 1,
0.5791036, 0.2851926, 1.128819, 0.2470588, 0, 1, 1,
0.5830762, 1.265124, 1.020419, 0.254902, 0, 1, 1,
0.5860792, -0.378752, 2.653041, 0.2588235, 0, 1, 1,
0.5877131, -0.0004089773, 1.090424, 0.2666667, 0, 1, 1,
0.5895705, -1.548247, 3.378642, 0.2705882, 0, 1, 1,
0.5906563, -1.16882, 3.730244, 0.2784314, 0, 1, 1,
0.5941554, -0.2227966, 0.4598469, 0.282353, 0, 1, 1,
0.594802, 1.257097, 1.789191, 0.2901961, 0, 1, 1,
0.595232, -1.027337, 2.280428, 0.2941177, 0, 1, 1,
0.5991136, 0.937951, 0.8905544, 0.3019608, 0, 1, 1,
0.600031, 0.5094517, 0.198721, 0.3098039, 0, 1, 1,
0.6004487, 0.1100207, 1.349092, 0.3137255, 0, 1, 1,
0.6062696, 1.025253, 2.057813, 0.3215686, 0, 1, 1,
0.6078349, 1.104397, 0.4543071, 0.3254902, 0, 1, 1,
0.6092039, 0.1816095, 0.8925259, 0.3333333, 0, 1, 1,
0.6112595, 1.448012, -0.358264, 0.3372549, 0, 1, 1,
0.6119094, 0.07714249, 2.231525, 0.345098, 0, 1, 1,
0.6121497, -0.2675112, 1.677903, 0.3490196, 0, 1, 1,
0.6129121, 1.521134, 0.7103465, 0.3568628, 0, 1, 1,
0.6131233, -0.517369, 1.587354, 0.3607843, 0, 1, 1,
0.6137305, 0.1545138, 2.003369, 0.3686275, 0, 1, 1,
0.6143125, -0.619705, 0.928778, 0.372549, 0, 1, 1,
0.6231772, -1.053563, 2.745897, 0.3803922, 0, 1, 1,
0.6259587, 0.2942501, 0.8336585, 0.3843137, 0, 1, 1,
0.6396152, -1.06247, 2.419765, 0.3921569, 0, 1, 1,
0.6397496, 0.04253098, -0.08351281, 0.3960784, 0, 1, 1,
0.6401201, 1.364896, 0.2410549, 0.4039216, 0, 1, 1,
0.6417295, -0.4536523, 1.230767, 0.4117647, 0, 1, 1,
0.6441926, 0.8020098, 2.42821, 0.4156863, 0, 1, 1,
0.6468961, 0.9229602, 0.2934521, 0.4235294, 0, 1, 1,
0.6501484, -0.2737955, 1.549702, 0.427451, 0, 1, 1,
0.6597155, 0.4471016, 0.271985, 0.4352941, 0, 1, 1,
0.6634365, 0.08625612, -0.8217239, 0.4392157, 0, 1, 1,
0.6733623, -0.5335296, 2.871121, 0.4470588, 0, 1, 1,
0.6741964, -0.2556885, 0.2658764, 0.4509804, 0, 1, 1,
0.6756283, 0.8132051, 0.519529, 0.4588235, 0, 1, 1,
0.6801556, -0.1671598, 2.000906, 0.4627451, 0, 1, 1,
0.6825587, 0.8374835, 0.1680657, 0.4705882, 0, 1, 1,
0.6831706, -0.2150524, 3.245351, 0.4745098, 0, 1, 1,
0.6903397, -0.8603033, 1.947559, 0.4823529, 0, 1, 1,
0.6923667, 0.8521214, 1.700733, 0.4862745, 0, 1, 1,
0.6954299, 0.08568074, 0.9029208, 0.4941176, 0, 1, 1,
0.6967986, -0.0955195, 3.623771, 0.5019608, 0, 1, 1,
0.7002931, -0.6030545, 2.226944, 0.5058824, 0, 1, 1,
0.7021077, 0.8274488, 1.673418, 0.5137255, 0, 1, 1,
0.7037345, -0.2483828, 0.636475, 0.5176471, 0, 1, 1,
0.7071627, 0.6234291, 2.3981, 0.5254902, 0, 1, 1,
0.7078342, -2.460071, -0.07111757, 0.5294118, 0, 1, 1,
0.708266, 0.7946177, -0.3209126, 0.5372549, 0, 1, 1,
0.7091891, 1.656793, -0.390109, 0.5411765, 0, 1, 1,
0.7112837, -0.160461, 1.562924, 0.5490196, 0, 1, 1,
0.7113432, -1.092633, 4.351828, 0.5529412, 0, 1, 1,
0.7152777, 0.1171262, 0.822955, 0.5607843, 0, 1, 1,
0.7155458, 0.2961079, 0.7805167, 0.5647059, 0, 1, 1,
0.7180455, 0.2025147, 2.780499, 0.572549, 0, 1, 1,
0.719205, -0.04058634, 2.876022, 0.5764706, 0, 1, 1,
0.7193264, 0.3514187, 3.307426, 0.5843138, 0, 1, 1,
0.7225683, -2.162575, 2.492392, 0.5882353, 0, 1, 1,
0.7239282, 0.4122413, 2.078548, 0.5960785, 0, 1, 1,
0.7261134, 1.340634, -0.4777036, 0.6039216, 0, 1, 1,
0.7263633, -2.157989, 1.791081, 0.6078432, 0, 1, 1,
0.7272266, -1.923802, 3.808095, 0.6156863, 0, 1, 1,
0.7337084, -0.4929456, 3.344473, 0.6196079, 0, 1, 1,
0.7397043, 0.6299936, 0.8074336, 0.627451, 0, 1, 1,
0.7409988, -0.1304719, 2.208222, 0.6313726, 0, 1, 1,
0.7430348, 0.1682439, 2.636922, 0.6392157, 0, 1, 1,
0.7436326, -0.09048889, 0.6837651, 0.6431373, 0, 1, 1,
0.7459809, -0.114678, 1.774583, 0.6509804, 0, 1, 1,
0.7497492, -0.4241936, 0.8918505, 0.654902, 0, 1, 1,
0.7516171, 0.4388263, 1.262352, 0.6627451, 0, 1, 1,
0.7517684, 0.6840575, 2.123092, 0.6666667, 0, 1, 1,
0.7522518, 0.3319319, 1.959097, 0.6745098, 0, 1, 1,
0.7546872, -2.149787, 1.21843, 0.6784314, 0, 1, 1,
0.7604137, 0.8938375, -0.3126544, 0.6862745, 0, 1, 1,
0.7617447, 1.505776, -1.23187, 0.6901961, 0, 1, 1,
0.771043, -0.6846722, 3.947397, 0.6980392, 0, 1, 1,
0.7754249, -0.1511302, 1.43298, 0.7058824, 0, 1, 1,
0.7804646, -0.1503128, 1.138081, 0.7098039, 0, 1, 1,
0.7815986, -0.992142, 2.61238, 0.7176471, 0, 1, 1,
0.7840183, -0.1350956, 1.404887, 0.7215686, 0, 1, 1,
0.789571, -0.08369384, 2.335654, 0.7294118, 0, 1, 1,
0.7916025, 1.701966, 1.502575, 0.7333333, 0, 1, 1,
0.7921361, 1.224672, 0.8064473, 0.7411765, 0, 1, 1,
0.7968897, 0.3456428, 0.9634647, 0.7450981, 0, 1, 1,
0.7974108, 0.03799476, 0.3842281, 0.7529412, 0, 1, 1,
0.7986152, -0.03881847, 2.461792, 0.7568628, 0, 1, 1,
0.8031766, 0.04435379, 0.1835764, 0.7647059, 0, 1, 1,
0.8094996, 0.1600436, 2.041071, 0.7686275, 0, 1, 1,
0.8107778, 0.1484562, 0.8237376, 0.7764706, 0, 1, 1,
0.8165374, -0.9681286, 2.718957, 0.7803922, 0, 1, 1,
0.8186737, 0.1445491, 2.500146, 0.7882353, 0, 1, 1,
0.8189592, 1.698178, 0.9520864, 0.7921569, 0, 1, 1,
0.8212153, -0.1160999, 1.297064, 0.8, 0, 1, 1,
0.8215692, -1.982313, 3.473118, 0.8078431, 0, 1, 1,
0.8223909, 0.228956, 1.190923, 0.8117647, 0, 1, 1,
0.8226058, -0.7739502, 1.847952, 0.8196079, 0, 1, 1,
0.8298731, -2.077198, 2.288928, 0.8235294, 0, 1, 1,
0.8332121, -0.9339097, 2.487949, 0.8313726, 0, 1, 1,
0.8366489, 0.6741475, 0.6605034, 0.8352941, 0, 1, 1,
0.8411384, 0.3538617, -0.5186476, 0.8431373, 0, 1, 1,
0.8445351, 0.1384731, 0.8715078, 0.8470588, 0, 1, 1,
0.8508507, -0.2536781, 1.218538, 0.854902, 0, 1, 1,
0.852837, -0.2822678, 2.286021, 0.8588235, 0, 1, 1,
0.855639, 0.01977718, 2.651869, 0.8666667, 0, 1, 1,
0.8578467, 1.069582, 2.020703, 0.8705882, 0, 1, 1,
0.8590248, 0.7080876, 0.8881206, 0.8784314, 0, 1, 1,
0.8637339, -0.3009278, 1.83863, 0.8823529, 0, 1, 1,
0.8640361, -1.877461, 2.417749, 0.8901961, 0, 1, 1,
0.8725428, -0.997255, 2.714322, 0.8941177, 0, 1, 1,
0.873412, 0.1292284, 2.292299, 0.9019608, 0, 1, 1,
0.8790529, 0.0335188, 1.984668, 0.9098039, 0, 1, 1,
0.8854614, 0.6873561, 1.033799, 0.9137255, 0, 1, 1,
0.8855495, 0.3382734, 0.4900797, 0.9215686, 0, 1, 1,
0.8932096, -0.5086601, 1.352531, 0.9254902, 0, 1, 1,
0.8960335, -0.07262898, 1.142879, 0.9333333, 0, 1, 1,
0.9042348, 1.120639, 0.05799871, 0.9372549, 0, 1, 1,
0.9085358, 0.7934396, 1.803693, 0.945098, 0, 1, 1,
0.9087571, -0.5144361, 3.351156, 0.9490196, 0, 1, 1,
0.9110219, 0.896715, 2.513173, 0.9568627, 0, 1, 1,
0.9226009, 0.2639303, 1.109139, 0.9607843, 0, 1, 1,
0.9227321, 0.3700562, 1.040215, 0.9686275, 0, 1, 1,
0.9245364, -1.166158, 2.149984, 0.972549, 0, 1, 1,
0.9336525, -0.8256437, 2.749957, 0.9803922, 0, 1, 1,
0.9403205, 0.7684764, 1.098991, 0.9843137, 0, 1, 1,
0.9413477, 0.3258116, -1.539347, 0.9921569, 0, 1, 1,
0.9540807, 0.1884249, 0.5035598, 0.9960784, 0, 1, 1,
0.9572426, 0.03192623, 0.006075509, 1, 0, 0.9960784, 1,
0.9591627, -1.260658, 4.805034, 1, 0, 0.9882353, 1,
0.9601785, 0.6934696, 1.013979, 1, 0, 0.9843137, 1,
0.9603712, -0.7930778, 0.5701457, 1, 0, 0.9764706, 1,
0.9605078, 0.008549974, 0.6587587, 1, 0, 0.972549, 1,
0.961687, -1.490901, 3.569578, 1, 0, 0.9647059, 1,
0.9646873, 0.4150038, 2.025593, 1, 0, 0.9607843, 1,
0.9674966, 0.8292388, 1.512513, 1, 0, 0.9529412, 1,
0.9679335, -1.113673, 2.202687, 1, 0, 0.9490196, 1,
0.9682207, 0.5927739, -0.231144, 1, 0, 0.9411765, 1,
0.9699806, 0.8941435, 1.944507, 1, 0, 0.9372549, 1,
0.970335, 1.414245, -1.194523, 1, 0, 0.9294118, 1,
0.9757999, -0.3696845, 1.665566, 1, 0, 0.9254902, 1,
0.9783131, 1.079034, 0.8149999, 1, 0, 0.9176471, 1,
0.9814692, -0.5346684, 1.056111, 1, 0, 0.9137255, 1,
0.9829658, -1.041362, 2.111538, 1, 0, 0.9058824, 1,
0.9933561, -0.2731612, 1.859674, 1, 0, 0.9019608, 1,
0.9968541, -0.3381585, 1.492879, 1, 0, 0.8941177, 1,
1.001675, -1.143347, 1.955227, 1, 0, 0.8862745, 1,
1.019857, -0.7607277, 2.383377, 1, 0, 0.8823529, 1,
1.022388, 0.5457164, 1.145204, 1, 0, 0.8745098, 1,
1.023329, 0.1640125, 1.329371, 1, 0, 0.8705882, 1,
1.026972, 0.508777, 2.079456, 1, 0, 0.8627451, 1,
1.027126, -0.2889346, 2.610953, 1, 0, 0.8588235, 1,
1.028011, -0.7152339, 0.9463748, 1, 0, 0.8509804, 1,
1.029887, 1.170222, -0.4384815, 1, 0, 0.8470588, 1,
1.035328, 0.3918486, 0.4381976, 1, 0, 0.8392157, 1,
1.044194, 1.457519, 0.7965281, 1, 0, 0.8352941, 1,
1.04756, -0.4777708, 0.7131594, 1, 0, 0.827451, 1,
1.053337, 0.524649, 1.371109, 1, 0, 0.8235294, 1,
1.055259, -0.1002211, 0.7752556, 1, 0, 0.8156863, 1,
1.057368, 1.315544, 1.251217, 1, 0, 0.8117647, 1,
1.057424, -1.464189, 4.155786, 1, 0, 0.8039216, 1,
1.066846, -0.3864088, 1.230319, 1, 0, 0.7960784, 1,
1.071305, 0.9838082, 0.8067755, 1, 0, 0.7921569, 1,
1.073855, -1.983998, 2.622067, 1, 0, 0.7843137, 1,
1.078657, 2.22311, 0.4339955, 1, 0, 0.7803922, 1,
1.082576, 1.895261, 1.330794, 1, 0, 0.772549, 1,
1.093017, -0.4813304, 3.953841, 1, 0, 0.7686275, 1,
1.0976, 1.115601, 1.189671, 1, 0, 0.7607843, 1,
1.103613, 1.552083, 0.9747605, 1, 0, 0.7568628, 1,
1.115156, -0.9982991, 1.770659, 1, 0, 0.7490196, 1,
1.125704, 0.590876, -0.7818744, 1, 0, 0.7450981, 1,
1.12585, -0.2086064, 3.263569, 1, 0, 0.7372549, 1,
1.126319, 1.184765, 2.42167, 1, 0, 0.7333333, 1,
1.128454, -0.336026, 2.124626, 1, 0, 0.7254902, 1,
1.128694, -0.9872195, 4.734189, 1, 0, 0.7215686, 1,
1.130101, 0.3118671, 2.106891, 1, 0, 0.7137255, 1,
1.135621, 0.5993857, 0.2925262, 1, 0, 0.7098039, 1,
1.14097, 1.312719, 1.553168, 1, 0, 0.7019608, 1,
1.144804, 1.641335, 0.02691052, 1, 0, 0.6941177, 1,
1.144988, 1.363613, 0.925251, 1, 0, 0.6901961, 1,
1.147887, 0.4744756, 0.3353384, 1, 0, 0.682353, 1,
1.150098, 1.465526, 0.150372, 1, 0, 0.6784314, 1,
1.151388, 0.9207904, -0.6943017, 1, 0, 0.6705883, 1,
1.152128, 0.2568828, 0.4030018, 1, 0, 0.6666667, 1,
1.154621, 0.7271088, 2.798179, 1, 0, 0.6588235, 1,
1.155445, 0.03107573, 2.135259, 1, 0, 0.654902, 1,
1.159541, 1.471662, 1.298785, 1, 0, 0.6470588, 1,
1.162662, 1.178069, 3.452764, 1, 0, 0.6431373, 1,
1.179819, 0.6421967, -0.6321785, 1, 0, 0.6352941, 1,
1.197384, -1.363921, 2.334791, 1, 0, 0.6313726, 1,
1.203478, -0.06799638, -0.8304516, 1, 0, 0.6235294, 1,
1.205713, -0.2396381, 2.327238, 1, 0, 0.6196079, 1,
1.214221, 1.2423, 0.5067051, 1, 0, 0.6117647, 1,
1.215235, -0.4376587, 3.091306, 1, 0, 0.6078432, 1,
1.21656, 0.3319519, 2.126524, 1, 0, 0.6, 1,
1.231887, 0.1739201, 0.8666274, 1, 0, 0.5921569, 1,
1.232074, -0.6512611, 1.280048, 1, 0, 0.5882353, 1,
1.234319, 1.263449, 2.60597, 1, 0, 0.5803922, 1,
1.236921, 0.3503636, 1.987601, 1, 0, 0.5764706, 1,
1.240435, -1.146753, 2.882596, 1, 0, 0.5686275, 1,
1.247452, 0.01563601, 1.98188, 1, 0, 0.5647059, 1,
1.247733, 0.3525132, 2.599406, 1, 0, 0.5568628, 1,
1.248447, -0.1551251, 0.7226584, 1, 0, 0.5529412, 1,
1.251092, 1.505624, 0.2382206, 1, 0, 0.5450981, 1,
1.251839, -1.471493, 1.911436, 1, 0, 0.5411765, 1,
1.262725, -0.7490774, 2.107234, 1, 0, 0.5333334, 1,
1.285933, 0.1956689, 0.9313373, 1, 0, 0.5294118, 1,
1.305237, 0.4312586, 1.907971, 1, 0, 0.5215687, 1,
1.312537, 0.6116865, 2.958553, 1, 0, 0.5176471, 1,
1.318187, -0.305178, 0.6716293, 1, 0, 0.509804, 1,
1.323571, -1.009073, 2.017402, 1, 0, 0.5058824, 1,
1.340266, -0.30391, 0.6570948, 1, 0, 0.4980392, 1,
1.348019, -0.1685297, 1.956447, 1, 0, 0.4901961, 1,
1.356615, 1.438207, 0.3990685, 1, 0, 0.4862745, 1,
1.359272, 0.1301368, -0.1015808, 1, 0, 0.4784314, 1,
1.359447, -0.4329506, 0.5092748, 1, 0, 0.4745098, 1,
1.364825, 0.1754168, 2.037597, 1, 0, 0.4666667, 1,
1.367463, 0.8610549, 0.9924129, 1, 0, 0.4627451, 1,
1.368265, -0.6914529, 3.054063, 1, 0, 0.454902, 1,
1.370266, 0.1248779, 1.896681, 1, 0, 0.4509804, 1,
1.370491, -0.6178566, 2.494574, 1, 0, 0.4431373, 1,
1.381172, 0.06902646, 2.258202, 1, 0, 0.4392157, 1,
1.381915, 1.378094, 0.6131257, 1, 0, 0.4313726, 1,
1.382106, -1.329098, 1.836882, 1, 0, 0.427451, 1,
1.3874, 1.012202, 0.8803784, 1, 0, 0.4196078, 1,
1.388189, 0.459251, 3.888338, 1, 0, 0.4156863, 1,
1.389073, -0.06730493, 3.676809, 1, 0, 0.4078431, 1,
1.395199, 0.8365367, -0.03386567, 1, 0, 0.4039216, 1,
1.407123, 1.379308, 1.664792, 1, 0, 0.3960784, 1,
1.408172, -1.923584, 2.386861, 1, 0, 0.3882353, 1,
1.411093, 0.2826666, 0.1431677, 1, 0, 0.3843137, 1,
1.44093, -0.8027134, 1.953485, 1, 0, 0.3764706, 1,
1.447077, 0.1707096, 2.440016, 1, 0, 0.372549, 1,
1.449929, -0.2175196, 1.270578, 1, 0, 0.3647059, 1,
1.457962, 0.2114027, 1.794393, 1, 0, 0.3607843, 1,
1.4816, -0.1843615, 2.262061, 1, 0, 0.3529412, 1,
1.4833, 1.701349, 1.853635, 1, 0, 0.3490196, 1,
1.493612, -1.268117, 0.6615681, 1, 0, 0.3411765, 1,
1.523301, -0.4037295, 2.733308, 1, 0, 0.3372549, 1,
1.532826, -2.093711, 4.037383, 1, 0, 0.3294118, 1,
1.535974, -0.1181182, 1.819501, 1, 0, 0.3254902, 1,
1.549081, -0.9372123, 1.319856, 1, 0, 0.3176471, 1,
1.567279, -1.170241, 3.685169, 1, 0, 0.3137255, 1,
1.573797, 1.880461, -1.295132, 1, 0, 0.3058824, 1,
1.592813, -0.1990368, 2.308868, 1, 0, 0.2980392, 1,
1.595987, -1.099463, 3.029978, 1, 0, 0.2941177, 1,
1.626458, -0.9601032, 1.78472, 1, 0, 0.2862745, 1,
1.635039, 0.06855085, 1.9518, 1, 0, 0.282353, 1,
1.6607, -1.780813, 2.24032, 1, 0, 0.2745098, 1,
1.675751, -1.077828, 2.91175, 1, 0, 0.2705882, 1,
1.685698, 0.4759499, 0.912003, 1, 0, 0.2627451, 1,
1.687924, -0.8174086, 2.392387, 1, 0, 0.2588235, 1,
1.720153, 0.7536484, 0.1425767, 1, 0, 0.2509804, 1,
1.737977, 0.9687613, -0.6698781, 1, 0, 0.2470588, 1,
1.76287, -1.335314, 1.571751, 1, 0, 0.2392157, 1,
1.775195, 2.557781, 1.301392, 1, 0, 0.2352941, 1,
1.796381, -1.29924, 1.007193, 1, 0, 0.227451, 1,
1.799935, -1.137207, 2.539993, 1, 0, 0.2235294, 1,
1.804534, -0.07399362, 1.05135, 1, 0, 0.2156863, 1,
1.819534, -1.005854, 3.532849, 1, 0, 0.2117647, 1,
1.85039, -0.6583289, 1.534948, 1, 0, 0.2039216, 1,
1.874624, 0.2940878, 1.698662, 1, 0, 0.1960784, 1,
1.87884, -1.363312, 1.314829, 1, 0, 0.1921569, 1,
1.891816, -0.1802042, 0.6242511, 1, 0, 0.1843137, 1,
1.893867, -1.354553, 1.745052, 1, 0, 0.1803922, 1,
1.909614, 1.640145, -0.6641892, 1, 0, 0.172549, 1,
1.911343, 0.2126324, 2.970682, 1, 0, 0.1686275, 1,
1.943692, -0.9041035, 2.230564, 1, 0, 0.1607843, 1,
1.948451, -1.140514, 0.4401752, 1, 0, 0.1568628, 1,
1.96439, 0.4784526, 2.360287, 1, 0, 0.1490196, 1,
1.976015, -1.171821, 3.170926, 1, 0, 0.145098, 1,
1.976812, 0.1520249, 0.4854861, 1, 0, 0.1372549, 1,
1.978028, 2.061215, 0.5178183, 1, 0, 0.1333333, 1,
2.000964, -0.2317851, 1.208583, 1, 0, 0.1254902, 1,
2.015331, -3.246622, 3.15205, 1, 0, 0.1215686, 1,
2.034226, -0.7622955, 1.879377, 1, 0, 0.1137255, 1,
2.038615, 0.3065515, 2.304548, 1, 0, 0.1098039, 1,
2.045892, -0.8722404, 4.076616, 1, 0, 0.1019608, 1,
2.047722, -0.4045854, 1.491027, 1, 0, 0.09411765, 1,
2.058242, 0.8600768, 1.186107, 1, 0, 0.09019608, 1,
2.083903, -0.2475962, 1.813314, 1, 0, 0.08235294, 1,
2.093809, -0.7028631, 4.307942, 1, 0, 0.07843138, 1,
2.143978, -0.2165103, 1.628376, 1, 0, 0.07058824, 1,
2.163823, 1.825472, 1.068949, 1, 0, 0.06666667, 1,
2.195534, -1.811552, 3.757534, 1, 0, 0.05882353, 1,
2.214875, -1.725604, 4.830193, 1, 0, 0.05490196, 1,
2.273328, -0.5510612, 2.124252, 1, 0, 0.04705882, 1,
2.285981, 1.364872, 1.925956, 1, 0, 0.04313726, 1,
2.370167, -0.8187181, 1.593249, 1, 0, 0.03529412, 1,
2.413209, -0.2744117, -0.3455387, 1, 0, 0.03137255, 1,
2.48967, -0.6823208, 0.4968545, 1, 0, 0.02352941, 1,
2.649642, -1.344487, 2.788604, 1, 0, 0.01960784, 1,
2.735377, 0.02759978, -0.3961713, 1, 0, 0.01176471, 1,
3.251546, 0.5037742, 1.188179, 1, 0, 0.007843138, 1
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
-0.3711245, -4.360631, -6.936447, 0, -0.5, 0.5, 0.5,
-0.3711245, -4.360631, -6.936447, 1, -0.5, 0.5, 0.5,
-0.3711245, -4.360631, -6.936447, 1, 1.5, 0.5, 0.5,
-0.3711245, -4.360631, -6.936447, 0, 1.5, 0.5, 0.5
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
-5.22188, -0.01718724, -6.936447, 0, -0.5, 0.5, 0.5,
-5.22188, -0.01718724, -6.936447, 1, -0.5, 0.5, 0.5,
-5.22188, -0.01718724, -6.936447, 1, 1.5, 0.5, 0.5,
-5.22188, -0.01718724, -6.936447, 0, 1.5, 0.5, 0.5
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
-5.22188, -4.360631, 0.001345396, 0, -0.5, 0.5, 0.5,
-5.22188, -4.360631, 0.001345396, 1, -0.5, 0.5, 0.5,
-5.22188, -4.360631, 0.001345396, 1, 1.5, 0.5, 0.5,
-5.22188, -4.360631, 0.001345396, 0, 1.5, 0.5, 0.5
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
-2, -3.358298, -5.335418,
2, -3.358298, -5.335418,
-2, -3.358298, -5.335418,
-2, -3.525354, -5.602256,
0, -3.358298, -5.335418,
0, -3.525354, -5.602256,
2, -3.358298, -5.335418,
2, -3.525354, -5.602256
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
-2, -3.859465, -6.135932, 0, -0.5, 0.5, 0.5,
-2, -3.859465, -6.135932, 1, -0.5, 0.5, 0.5,
-2, -3.859465, -6.135932, 1, 1.5, 0.5, 0.5,
-2, -3.859465, -6.135932, 0, 1.5, 0.5, 0.5,
0, -3.859465, -6.135932, 0, -0.5, 0.5, 0.5,
0, -3.859465, -6.135932, 1, -0.5, 0.5, 0.5,
0, -3.859465, -6.135932, 1, 1.5, 0.5, 0.5,
0, -3.859465, -6.135932, 0, 1.5, 0.5, 0.5,
2, -3.859465, -6.135932, 0, -0.5, 0.5, 0.5,
2, -3.859465, -6.135932, 1, -0.5, 0.5, 0.5,
2, -3.859465, -6.135932, 1, 1.5, 0.5, 0.5,
2, -3.859465, -6.135932, 0, 1.5, 0.5, 0.5
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
-4.102475, -3, -5.335418,
-4.102475, 3, -5.335418,
-4.102475, -3, -5.335418,
-4.289043, -3, -5.602256,
-4.102475, -2, -5.335418,
-4.289043, -2, -5.602256,
-4.102475, -1, -5.335418,
-4.289043, -1, -5.602256,
-4.102475, 0, -5.335418,
-4.289043, 0, -5.602256,
-4.102475, 1, -5.335418,
-4.289043, 1, -5.602256,
-4.102475, 2, -5.335418,
-4.289043, 2, -5.602256,
-4.102475, 3, -5.335418,
-4.289043, 3, -5.602256
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
-4.662178, -3, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, -3, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, -3, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, -3, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, -2, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, -2, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, -2, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, -2, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, -1, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, -1, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, -1, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, -1, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, 0, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, 0, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, 0, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, 0, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, 1, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, 1, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, 1, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, 1, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, 2, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, 2, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, 2, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, 2, -6.135932, 0, 1.5, 0.5, 0.5,
-4.662178, 3, -6.135932, 0, -0.5, 0.5, 0.5,
-4.662178, 3, -6.135932, 1, -0.5, 0.5, 0.5,
-4.662178, 3, -6.135932, 1, 1.5, 0.5, 0.5,
-4.662178, 3, -6.135932, 0, 1.5, 0.5, 0.5
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
-4.102475, -3.358298, -4,
-4.102475, -3.358298, 4,
-4.102475, -3.358298, -4,
-4.289043, -3.525354, -4,
-4.102475, -3.358298, -2,
-4.289043, -3.525354, -2,
-4.102475, -3.358298, 0,
-4.289043, -3.525354, 0,
-4.102475, -3.358298, 2,
-4.289043, -3.525354, 2,
-4.102475, -3.358298, 4,
-4.289043, -3.525354, 4
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
-4.662178, -3.859465, -4, 0, -0.5, 0.5, 0.5,
-4.662178, -3.859465, -4, 1, -0.5, 0.5, 0.5,
-4.662178, -3.859465, -4, 1, 1.5, 0.5, 0.5,
-4.662178, -3.859465, -4, 0, 1.5, 0.5, 0.5,
-4.662178, -3.859465, -2, 0, -0.5, 0.5, 0.5,
-4.662178, -3.859465, -2, 1, -0.5, 0.5, 0.5,
-4.662178, -3.859465, -2, 1, 1.5, 0.5, 0.5,
-4.662178, -3.859465, -2, 0, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 0, 0, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 0, 1, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 0, 1, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 0, 0, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 2, 0, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 2, 1, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 2, 1, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 2, 0, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 4, 0, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 4, 1, -0.5, 0.5, 0.5,
-4.662178, -3.859465, 4, 1, 1.5, 0.5, 0.5,
-4.662178, -3.859465, 4, 0, 1.5, 0.5, 0.5
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
-4.102475, -3.358298, -5.335418,
-4.102475, 3.323924, -5.335418,
-4.102475, -3.358298, 5.338109,
-4.102475, 3.323924, 5.338109,
-4.102475, -3.358298, -5.335418,
-4.102475, -3.358298, 5.338109,
-4.102475, 3.323924, -5.335418,
-4.102475, 3.323924, 5.338109,
-4.102475, -3.358298, -5.335418,
3.360226, -3.358298, -5.335418,
-4.102475, -3.358298, 5.338109,
3.360226, -3.358298, 5.338109,
-4.102475, 3.323924, -5.335418,
3.360226, 3.323924, -5.335418,
-4.102475, 3.323924, 5.338109,
3.360226, 3.323924, 5.338109,
3.360226, -3.358298, -5.335418,
3.360226, 3.323924, -5.335418,
3.360226, -3.358298, 5.338109,
3.360226, 3.323924, 5.338109,
3.360226, -3.358298, -5.335418,
3.360226, -3.358298, 5.338109,
3.360226, 3.323924, -5.335418,
3.360226, 3.323924, 5.338109
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
var radius = 7.816355;
var distance = 34.77585;
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
mvMatrix.translate( 0.3711245, 0.01718724, -0.001345396 );
mvMatrix.scale( 1.132458, 1.264728, 0.7917905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.77585);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Triadimenol<-read.table("Triadimenol.xyz")
```

```
## Error in read.table("Triadimenol.xyz"): no lines available in input
```

```r
x<-Triadimenol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
y<-Triadimenol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
```

```r
z<-Triadimenol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triadimenol' not found
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
-3.993795, -0.9853765, -2.276328, 0, 0, 1, 1, 1,
-3.327474, 0.8062819, -0.3327296, 1, 0, 0, 1, 1,
-3.280541, -0.4671488, -3.295932, 1, 0, 0, 1, 1,
-2.743057, 0.2034676, -2.101173, 1, 0, 0, 1, 1,
-2.741485, -0.3495138, -1.675057, 1, 0, 0, 1, 1,
-2.691828, 0.8160442, -0.2341233, 1, 0, 0, 1, 1,
-2.654114, -1.071435, -0.08401322, 0, 0, 0, 1, 1,
-2.456396, -1.505465, -3.976329, 0, 0, 0, 1, 1,
-2.434431, 0.5393789, -0.846581, 0, 0, 0, 1, 1,
-2.425042, -0.6754982, -3.29659, 0, 0, 0, 1, 1,
-2.393596, -0.8573071, -1.720859, 0, 0, 0, 1, 1,
-2.312249, 0.4978076, -1.359477, 0, 0, 0, 1, 1,
-2.297907, -0.9328871, -1.575462, 0, 0, 0, 1, 1,
-2.272956, -1.14935, 0.1984628, 1, 1, 1, 1, 1,
-2.254878, 0.356037, -1.202149, 1, 1, 1, 1, 1,
-2.234967, -1.771403, -0.9431455, 1, 1, 1, 1, 1,
-2.22689, -0.294076, 0.2725843, 1, 1, 1, 1, 1,
-2.199216, 0.5962171, -1.28076, 1, 1, 1, 1, 1,
-2.180146, -0.7586305, -2.580063, 1, 1, 1, 1, 1,
-2.17729, -0.1028267, -1.519644, 1, 1, 1, 1, 1,
-2.12045, -0.1396132, -0.8143949, 1, 1, 1, 1, 1,
-2.09077, -1.173923, -2.374374, 1, 1, 1, 1, 1,
-2.039669, -0.1665001, -3.101989, 1, 1, 1, 1, 1,
-2.024524, 1.600509, -1.453449, 1, 1, 1, 1, 1,
-2.007313, -0.9231822, -1.80358, 1, 1, 1, 1, 1,
-2.002858, -1.280194, -3.729239, 1, 1, 1, 1, 1,
-2.002294, 0.4421641, -2.946431, 1, 1, 1, 1, 1,
-1.998417, -0.9623647, -2.543041, 1, 1, 1, 1, 1,
-1.997607, 1.339864, 0.4272023, 0, 0, 1, 1, 1,
-1.984006, -0.8214234, -1.400735, 1, 0, 0, 1, 1,
-1.980324, 1.895378, 0.4042327, 1, 0, 0, 1, 1,
-1.978101, -0.003176623, -0.5700297, 1, 0, 0, 1, 1,
-1.972782, -1.28701, -2.374279, 1, 0, 0, 1, 1,
-1.972172, 1.425307, -0.922613, 1, 0, 0, 1, 1,
-1.94712, 1.867416, 0.6366038, 0, 0, 0, 1, 1,
-1.944331, 1.271377, -1.976115, 0, 0, 0, 1, 1,
-1.942395, -0.8201402, -2.025256, 0, 0, 0, 1, 1,
-1.94105, -0.7543145, -1.217448, 0, 0, 0, 1, 1,
-1.903089, 1.209281, -0.1221066, 0, 0, 0, 1, 1,
-1.890915, 1.105352, -0.8103608, 0, 0, 0, 1, 1,
-1.875645, 0.9468712, -0.08091126, 0, 0, 0, 1, 1,
-1.8499, -1.600802, -2.084199, 1, 1, 1, 1, 1,
-1.802081, -0.3854427, -0.4467545, 1, 1, 1, 1, 1,
-1.794627, 1.959776, -1.638949, 1, 1, 1, 1, 1,
-1.764757, 1.29829, -0.3015912, 1, 1, 1, 1, 1,
-1.762257, 0.6412784, -0.4590347, 1, 1, 1, 1, 1,
-1.745945, -0.5095778, -0.6122507, 1, 1, 1, 1, 1,
-1.740873, -1.134224, -2.016973, 1, 1, 1, 1, 1,
-1.729681, -0.6032586, -1.488407, 1, 1, 1, 1, 1,
-1.719876, 1.656129, -0.1843241, 1, 1, 1, 1, 1,
-1.707748, -1.377848, -1.92811, 1, 1, 1, 1, 1,
-1.688546, -0.3852376, -2.202629, 1, 1, 1, 1, 1,
-1.675652, 0.6605758, -1.92985, 1, 1, 1, 1, 1,
-1.66386, -0.8085511, -0.6671751, 1, 1, 1, 1, 1,
-1.650873, -0.4933435, -1.971112, 1, 1, 1, 1, 1,
-1.64545, 0.1010189, 0.8090683, 1, 1, 1, 1, 1,
-1.63664, 0.5511972, -2.576115, 0, 0, 1, 1, 1,
-1.633487, 0.949405, -1.778946, 1, 0, 0, 1, 1,
-1.626522, 0.4799442, -1.448606, 1, 0, 0, 1, 1,
-1.617171, 0.692187, 0.01734376, 1, 0, 0, 1, 1,
-1.603269, -1.844439, -2.256952, 1, 0, 0, 1, 1,
-1.588143, -0.8908091, -3.68049, 1, 0, 0, 1, 1,
-1.579731, -0.05643454, -2.52687, 0, 0, 0, 1, 1,
-1.578197, -1.14397, -1.354438, 0, 0, 0, 1, 1,
-1.577162, -0.7777188, -1.882196, 0, 0, 0, 1, 1,
-1.556603, 0.7858576, -0.7108473, 0, 0, 0, 1, 1,
-1.544633, -1.812818, -1.480219, 0, 0, 0, 1, 1,
-1.543747, 0.859255, 0.3923251, 0, 0, 0, 1, 1,
-1.54127, 0.5630496, -0.9626351, 0, 0, 0, 1, 1,
-1.541174, 1.703878, -1.765158, 1, 1, 1, 1, 1,
-1.536225, -0.9857874, -1.756103, 1, 1, 1, 1, 1,
-1.530319, -2.009199, -3.740097, 1, 1, 1, 1, 1,
-1.517402, 0.9139811, -1.680194, 1, 1, 1, 1, 1,
-1.511239, -1.782942, -1.596219, 1, 1, 1, 1, 1,
-1.506327, 0.2424914, 0.7862916, 1, 1, 1, 1, 1,
-1.504069, 1.25836, -1.280218, 1, 1, 1, 1, 1,
-1.496797, 3.22661, -0.9193118, 1, 1, 1, 1, 1,
-1.496529, 1.017261, -3.656125, 1, 1, 1, 1, 1,
-1.49451, -0.3405544, -3.126048, 1, 1, 1, 1, 1,
-1.485481, 1.134827, -0.01852028, 1, 1, 1, 1, 1,
-1.481593, -1.701742, -2.143527, 1, 1, 1, 1, 1,
-1.478433, -0.6061722, -2.277838, 1, 1, 1, 1, 1,
-1.477344, -0.002367751, -1.224647, 1, 1, 1, 1, 1,
-1.473641, -1.721042, -2.500857, 1, 1, 1, 1, 1,
-1.456331, 0.4345475, -1.295946, 0, 0, 1, 1, 1,
-1.446563, -0.181462, -2.762888, 1, 0, 0, 1, 1,
-1.445639, -0.5863916, -1.904053, 1, 0, 0, 1, 1,
-1.427646, 0.01862913, -0.6653214, 1, 0, 0, 1, 1,
-1.419667, -0.2550667, -1.077474, 1, 0, 0, 1, 1,
-1.413366, 0.1575769, -1.701672, 1, 0, 0, 1, 1,
-1.410723, -1.372572, -4.055467, 0, 0, 0, 1, 1,
-1.400196, -0.171892, -1.574653, 0, 0, 0, 1, 1,
-1.397541, -0.5709394, -2.016201, 0, 0, 0, 1, 1,
-1.386155, 1.057577, 0.2084295, 0, 0, 0, 1, 1,
-1.381277, -0.5324174, 0.08729463, 0, 0, 0, 1, 1,
-1.377905, -0.7999092, -1.937122, 0, 0, 0, 1, 1,
-1.36622, 0.4227717, -2.471355, 0, 0, 0, 1, 1,
-1.356501, -0.2524588, -1.045275, 1, 1, 1, 1, 1,
-1.323319, -1.63581, -2.222443, 1, 1, 1, 1, 1,
-1.317713, -0.2496654, -2.547818, 1, 1, 1, 1, 1,
-1.31462, -0.1786985, -0.3489515, 1, 1, 1, 1, 1,
-1.308881, 0.8200972, 0.0006307229, 1, 1, 1, 1, 1,
-1.301182, 0.5733982, -1.529906, 1, 1, 1, 1, 1,
-1.294387, 0.5165923, -1.240232, 1, 1, 1, 1, 1,
-1.291973, 0.1039458, -2.28966, 1, 1, 1, 1, 1,
-1.291657, -0.3313971, -1.714003, 1, 1, 1, 1, 1,
-1.282984, -2.04109, -3.052966, 1, 1, 1, 1, 1,
-1.280895, -1.155415, -3.055301, 1, 1, 1, 1, 1,
-1.270862, 1.534756, -1.524892, 1, 1, 1, 1, 1,
-1.270106, -0.2301288, -0.8082258, 1, 1, 1, 1, 1,
-1.26822, -0.3000391, -1.377405, 1, 1, 1, 1, 1,
-1.261448, 0.290965, -2.964008, 1, 1, 1, 1, 1,
-1.258398, -0.8300537, -0.5456389, 0, 0, 1, 1, 1,
-1.255654, -1.046077, -2.582778, 1, 0, 0, 1, 1,
-1.25452, 1.332867, 0.3805748, 1, 0, 0, 1, 1,
-1.234001, -1.694356, -0.7604774, 1, 0, 0, 1, 1,
-1.231516, 1.795329, -0.04588117, 1, 0, 0, 1, 1,
-1.226461, -1.139234, -1.951177, 1, 0, 0, 1, 1,
-1.218128, 0.412344, -1.406559, 0, 0, 0, 1, 1,
-1.217443, -0.02771942, -0.8674485, 0, 0, 0, 1, 1,
-1.214698, -0.6789719, -1.677541, 0, 0, 0, 1, 1,
-1.210558, 0.2628375, -2.856131, 0, 0, 0, 1, 1,
-1.209751, 1.214196, -2.271973, 0, 0, 0, 1, 1,
-1.208529, 0.7390479, -2.288667, 0, 0, 0, 1, 1,
-1.207215, 1.150174, -1.894358, 0, 0, 0, 1, 1,
-1.20658, 0.6167189, 0.6680604, 1, 1, 1, 1, 1,
-1.206547, -0.1037754, -1.961183, 1, 1, 1, 1, 1,
-1.203691, -0.5021018, -2.6984, 1, 1, 1, 1, 1,
-1.199775, 0.392343, -0.8484019, 1, 1, 1, 1, 1,
-1.195639, 1.338108, -0.3011518, 1, 1, 1, 1, 1,
-1.191587, -0.9317421, -1.173655, 1, 1, 1, 1, 1,
-1.191478, 0.1076896, -3.299483, 1, 1, 1, 1, 1,
-1.186751, 0.347516, -1.12239, 1, 1, 1, 1, 1,
-1.179221, -0.4842803, -1.396074, 1, 1, 1, 1, 1,
-1.177536, 1.283588, -0.9512716, 1, 1, 1, 1, 1,
-1.177243, -0.2799017, -1.755491, 1, 1, 1, 1, 1,
-1.176871, 1.405974, -0.212831, 1, 1, 1, 1, 1,
-1.175468, -0.8835849, -2.248902, 1, 1, 1, 1, 1,
-1.171497, -0.4409941, -2.107362, 1, 1, 1, 1, 1,
-1.169486, -0.2973052, -3.35648, 1, 1, 1, 1, 1,
-1.164663, -0.7216498, -2.820918, 0, 0, 1, 1, 1,
-1.159772, -0.5955414, -3.087601, 1, 0, 0, 1, 1,
-1.153846, -0.655743, -1.946178, 1, 0, 0, 1, 1,
-1.151152, 0.5307708, 0.977764, 1, 0, 0, 1, 1,
-1.140732, -0.1074822, -2.546643, 1, 0, 0, 1, 1,
-1.137587, 0.4589472, -0.9303545, 1, 0, 0, 1, 1,
-1.13413, 0.7242177, -0.5624489, 0, 0, 0, 1, 1,
-1.126027, -0.1042124, -2.663515, 0, 0, 0, 1, 1,
-1.112964, 0.307569, -1.113147, 0, 0, 0, 1, 1,
-1.107578, -1.114487, -1.00417, 0, 0, 0, 1, 1,
-1.103931, 0.772482, 0.07142549, 0, 0, 0, 1, 1,
-1.100512, 0.4622094, -0.7016015, 0, 0, 0, 1, 1,
-1.092644, -0.1350608, -2.477385, 0, 0, 0, 1, 1,
-1.091723, -0.2642667, -0.9638689, 1, 1, 1, 1, 1,
-1.090656, 0.007236154, -2.884102, 1, 1, 1, 1, 1,
-1.08621, -0.7513286, -1.468896, 1, 1, 1, 1, 1,
-1.08416, 0.6033691, -1.354577, 1, 1, 1, 1, 1,
-1.081083, 0.1411617, -4.150834, 1, 1, 1, 1, 1,
-1.079573, -1.519402, -1.71756, 1, 1, 1, 1, 1,
-1.078942, -0.9856288, -1.332626, 1, 1, 1, 1, 1,
-1.078901, 1.465986, -0.7037788, 1, 1, 1, 1, 1,
-1.075698, 0.9761748, 0.394022, 1, 1, 1, 1, 1,
-1.073461, -1.094088, -3.530135, 1, 1, 1, 1, 1,
-1.068428, -0.5405574, -2.16027, 1, 1, 1, 1, 1,
-1.06562, 1.151245, -0.9761258, 1, 1, 1, 1, 1,
-1.063371, -0.8162562, -1.505953, 1, 1, 1, 1, 1,
-1.060992, 0.4820893, -1.758118, 1, 1, 1, 1, 1,
-1.058974, -1.239442, -4.28934, 1, 1, 1, 1, 1,
-1.057105, 1.187379, 1.385932, 0, 0, 1, 1, 1,
-1.05325, -1.151603, -2.715739, 1, 0, 0, 1, 1,
-1.038436, 0.3779433, -1.199579, 1, 0, 0, 1, 1,
-1.03757, 0.8219826, -1.182135, 1, 0, 0, 1, 1,
-1.029373, -0.3550756, -3.191105, 1, 0, 0, 1, 1,
-1.028639, 1.250837, -2.076313, 1, 0, 0, 1, 1,
-1.019976, 1.564956, -1.09767, 0, 0, 0, 1, 1,
-1.018149, 0.9354028, -1.398456, 0, 0, 0, 1, 1,
-1.006732, -0.199382, -1.565657, 0, 0, 0, 1, 1,
-1.003801, -2.322037, -3.329367, 0, 0, 0, 1, 1,
-1.002834, -0.0002768468, -2.926155, 0, 0, 0, 1, 1,
-0.9847285, -0.7304909, -0.2524594, 0, 0, 0, 1, 1,
-0.9802374, -0.8332172, -0.8155094, 0, 0, 0, 1, 1,
-0.9795734, 0.2552889, -2.603167, 1, 1, 1, 1, 1,
-0.9758668, -0.68694, -1.960712, 1, 1, 1, 1, 1,
-0.9718489, 0.2521317, -0.702637, 1, 1, 1, 1, 1,
-0.9649404, 1.351511, -0.685471, 1, 1, 1, 1, 1,
-0.9559104, -0.3563885, -0.5046856, 1, 1, 1, 1, 1,
-0.9509516, -0.01219579, -1.560262, 1, 1, 1, 1, 1,
-0.9491315, 0.06252252, -1.255208, 1, 1, 1, 1, 1,
-0.9486864, -1.39306, -3.094986, 1, 1, 1, 1, 1,
-0.9475019, -0.8638175, -1.325085, 1, 1, 1, 1, 1,
-0.9424638, 1.212256, -1.540064, 1, 1, 1, 1, 1,
-0.9264413, 0.2373692, -3.147159, 1, 1, 1, 1, 1,
-0.9260894, 0.1026623, -2.073558, 1, 1, 1, 1, 1,
-0.924316, -0.7371982, -1.395757, 1, 1, 1, 1, 1,
-0.9213797, 0.1764454, -1.944817, 1, 1, 1, 1, 1,
-0.9204631, 0.5224705, -1.290998, 1, 1, 1, 1, 1,
-0.918705, -0.9068587, -2.017402, 0, 0, 1, 1, 1,
-0.9089757, -0.9840257, -1.43925, 1, 0, 0, 1, 1,
-0.9063597, -0.7238977, -3.024522, 1, 0, 0, 1, 1,
-0.90018, -0.5293056, -2.679883, 1, 0, 0, 1, 1,
-0.8970514, -0.445895, 0.4476244, 1, 0, 0, 1, 1,
-0.894982, -0.7879674, -1.989254, 1, 0, 0, 1, 1,
-0.8904716, 0.6841265, -1.584491, 0, 0, 0, 1, 1,
-0.8883862, -0.8230959, -2.252322, 0, 0, 0, 1, 1,
-0.8873695, 1.889113, 0.2114552, 0, 0, 0, 1, 1,
-0.8859944, -1.906998, -3.971165, 0, 0, 0, 1, 1,
-0.8854685, -0.3229405, -1.605284, 0, 0, 0, 1, 1,
-0.8812336, 2.115821, -0.5338879, 0, 0, 0, 1, 1,
-0.8794103, -0.8014641, -2.86687, 0, 0, 0, 1, 1,
-0.8773489, -0.4270562, -1.106596, 1, 1, 1, 1, 1,
-0.8752575, -0.3815327, -1.085455, 1, 1, 1, 1, 1,
-0.8726137, 0.08728337, 0.4464089, 1, 1, 1, 1, 1,
-0.8717768, 0.1473175, -2.272594, 1, 1, 1, 1, 1,
-0.8713986, -0.5259252, -2.271113, 1, 1, 1, 1, 1,
-0.867995, 0.4771046, -0.1539931, 1, 1, 1, 1, 1,
-0.8566573, 1.484023, 0.6504143, 1, 1, 1, 1, 1,
-0.8555792, 0.2720771, -1.800991, 1, 1, 1, 1, 1,
-0.8546093, 0.4657096, -1.590837, 1, 1, 1, 1, 1,
-0.8539333, -0.2812776, -0.6822507, 1, 1, 1, 1, 1,
-0.850021, -0.8962336, -2.737223, 1, 1, 1, 1, 1,
-0.8483213, 1.485759, -0.459565, 1, 1, 1, 1, 1,
-0.8477927, 0.8902441, -0.1529105, 1, 1, 1, 1, 1,
-0.8476163, -0.3758514, -1.593248, 1, 1, 1, 1, 1,
-0.8444157, -0.1637278, -1.535838, 1, 1, 1, 1, 1,
-0.8408996, 0.1891234, -1.644523, 0, 0, 1, 1, 1,
-0.8365252, 0.5381233, -0.2418902, 1, 0, 0, 1, 1,
-0.8358201, 1.48172, -0.266318, 1, 0, 0, 1, 1,
-0.8288281, 1.066543, -2.419595, 1, 0, 0, 1, 1,
-0.8214639, -1.213024, -3.704256, 1, 0, 0, 1, 1,
-0.8086318, 1.626742, -0.2487762, 1, 0, 0, 1, 1,
-0.803381, 1.248498, -1.88163, 0, 0, 0, 1, 1,
-0.8022614, -0.2781703, -1.615953, 0, 0, 0, 1, 1,
-0.8012515, -0.8370541, -2.334345, 0, 0, 0, 1, 1,
-0.7990147, 0.7192816, -0.5477962, 0, 0, 0, 1, 1,
-0.7943982, -0.3164949, -3.170865, 0, 0, 0, 1, 1,
-0.792996, 0.3580853, -0.7120804, 0, 0, 0, 1, 1,
-0.7907596, 0.731093, -2.354855, 0, 0, 0, 1, 1,
-0.7866798, 1.89844, -0.564958, 1, 1, 1, 1, 1,
-0.7686791, -1.828537, -3.715471, 1, 1, 1, 1, 1,
-0.7682468, 0.04643725, 0.820694, 1, 1, 1, 1, 1,
-0.7633679, 0.3130978, -1.728127, 1, 1, 1, 1, 1,
-0.7613233, -1.686463, -1.061569, 1, 1, 1, 1, 1,
-0.751436, -0.9485326, -3.204921, 1, 1, 1, 1, 1,
-0.7507837, -0.7568907, -1.683415, 1, 1, 1, 1, 1,
-0.7494663, -0.3193593, -1.8103, 1, 1, 1, 1, 1,
-0.7409228, 0.6214842, -3.432694, 1, 1, 1, 1, 1,
-0.7356411, 0.8616125, -1.85063, 1, 1, 1, 1, 1,
-0.7288366, -0.5712327, -1.52897, 1, 1, 1, 1, 1,
-0.7261608, 1.284516, -0.4574246, 1, 1, 1, 1, 1,
-0.7252985, 0.07475963, -0.1798574, 1, 1, 1, 1, 1,
-0.7245944, 1.264315, 0.05940307, 1, 1, 1, 1, 1,
-0.7216974, -2.141059, -5.179978, 1, 1, 1, 1, 1,
-0.7215437, 0.9810826, -1.863171, 0, 0, 1, 1, 1,
-0.7189309, -0.868417, -3.381389, 1, 0, 0, 1, 1,
-0.716509, -0.6434427, -2.106896, 1, 0, 0, 1, 1,
-0.7139447, -1.323579, -1.118528, 1, 0, 0, 1, 1,
-0.7118875, 0.2284531, -1.032234, 1, 0, 0, 1, 1,
-0.709957, -0.9664891, -3.116524, 1, 0, 0, 1, 1,
-0.7094821, 0.3085256, -1.960758, 0, 0, 0, 1, 1,
-0.7023332, 1.763964, 0.2588714, 0, 0, 0, 1, 1,
-0.6982536, 0.2383925, -1.502087, 0, 0, 0, 1, 1,
-0.6970856, -1.413038, -1.759235, 0, 0, 0, 1, 1,
-0.6955211, -1.319408, -3.493717, 0, 0, 0, 1, 1,
-0.6929061, -0.6547127, -3.161433, 0, 0, 0, 1, 1,
-0.6906764, 2.531984, 1.367903, 0, 0, 0, 1, 1,
-0.6871175, -1.802906, -4.154649, 1, 1, 1, 1, 1,
-0.6857498, -1.332499, -3.036245, 1, 1, 1, 1, 1,
-0.6844646, -1.535896, -3.643139, 1, 1, 1, 1, 1,
-0.6828333, -0.4176764, -1.964107, 1, 1, 1, 1, 1,
-0.678834, -0.9912875, -2.127187, 1, 1, 1, 1, 1,
-0.6779575, -0.5262807, -2.036419, 1, 1, 1, 1, 1,
-0.6637263, 0.5587645, 0.2275325, 1, 1, 1, 1, 1,
-0.6629426, 0.006438237, -0.7863851, 1, 1, 1, 1, 1,
-0.6600826, -0.6944943, -1.627904, 1, 1, 1, 1, 1,
-0.6576352, -1.458491, -3.244125, 1, 1, 1, 1, 1,
-0.6535508, -0.3196759, -1.011609, 1, 1, 1, 1, 1,
-0.6457799, 0.2764163, -0.8492065, 1, 1, 1, 1, 1,
-0.6342635, 0.841316, -0.826761, 1, 1, 1, 1, 1,
-0.6333363, 1.369436, -0.8141234, 1, 1, 1, 1, 1,
-0.6322832, -0.8365114, -1.491487, 1, 1, 1, 1, 1,
-0.6314746, 0.1955512, -2.393744, 0, 0, 1, 1, 1,
-0.6278284, 0.02455959, -3.414598, 1, 0, 0, 1, 1,
-0.6266037, -2.284129, -0.3586142, 1, 0, 0, 1, 1,
-0.6255901, -0.9338536, -2.009201, 1, 0, 0, 1, 1,
-0.6253622, 1.760437, -2.443357, 1, 0, 0, 1, 1,
-0.6248034, 0.396265, -0.6462077, 1, 0, 0, 1, 1,
-0.6162536, -1.568615, -2.879386, 0, 0, 0, 1, 1,
-0.6137593, 1.139224, -1.167367, 0, 0, 0, 1, 1,
-0.6128824, 0.3651039, -2.163029, 0, 0, 0, 1, 1,
-0.6049148, 1.000915, -1.578097, 0, 0, 0, 1, 1,
-0.6025111, -0.6154261, -2.96892, 0, 0, 0, 1, 1,
-0.6001109, 0.2328584, -0.8479069, 0, 0, 0, 1, 1,
-0.5968348, -1.431924, -3.13973, 0, 0, 0, 1, 1,
-0.5886848, -0.8281286, -1.052444, 1, 1, 1, 1, 1,
-0.5878832, -0.4405537, -2.658171, 1, 1, 1, 1, 1,
-0.5853145, -0.01171486, -2.911784, 1, 1, 1, 1, 1,
-0.583472, -0.7448509, -3.060781, 1, 1, 1, 1, 1,
-0.5826643, -1.540419, -3.122071, 1, 1, 1, 1, 1,
-0.5760011, -0.616084, -2.650978, 1, 1, 1, 1, 1,
-0.5725551, -0.4745703, -4.161817, 1, 1, 1, 1, 1,
-0.5676232, -0.9099305, -3.616367, 1, 1, 1, 1, 1,
-0.5659271, 0.2212227, -0.2553882, 1, 1, 1, 1, 1,
-0.565283, 1.30521, -1.376605, 1, 1, 1, 1, 1,
-0.5649351, -0.6978383, -4.003905, 1, 1, 1, 1, 1,
-0.5542561, -0.3616584, -2.594173, 1, 1, 1, 1, 1,
-0.5487179, -0.1647881, -0.6773196, 1, 1, 1, 1, 1,
-0.5459958, 1.816202, 1.021192, 1, 1, 1, 1, 1,
-0.5458645, 0.1502621, -3.379532, 1, 1, 1, 1, 1,
-0.5414421, -0.1219885, -2.420248, 0, 0, 1, 1, 1,
-0.5380963, -0.3946886, -2.225825, 1, 0, 0, 1, 1,
-0.5373219, -0.03502962, -0.7937105, 1, 0, 0, 1, 1,
-0.5369465, 0.2571217, -1.517936, 1, 0, 0, 1, 1,
-0.5339395, 1.409375, 0.5511169, 1, 0, 0, 1, 1,
-0.5338705, -1.188157, -1.431705, 1, 0, 0, 1, 1,
-0.5289935, -1.980307, -2.323246, 0, 0, 0, 1, 1,
-0.5159584, 0.4124803, -0.5577321, 0, 0, 0, 1, 1,
-0.5120895, 0.6473431, 0.1740481, 0, 0, 0, 1, 1,
-0.5084313, 0.5392713, -1.916897, 0, 0, 0, 1, 1,
-0.5062535, -0.3255591, -2.327452, 0, 0, 0, 1, 1,
-0.502586, 0.3738004, -0.3881555, 0, 0, 0, 1, 1,
-0.5024824, -0.7497642, -2.641721, 0, 0, 0, 1, 1,
-0.5016547, -0.1501492, -1.150999, 1, 1, 1, 1, 1,
-0.5015723, 0.4581007, -0.8888867, 1, 1, 1, 1, 1,
-0.5009529, -1.030926, -2.206626, 1, 1, 1, 1, 1,
-0.5001205, 0.8102576, 0.1984241, 1, 1, 1, 1, 1,
-0.4999237, 0.6619673, -0.8368803, 1, 1, 1, 1, 1,
-0.4953131, 0.5991639, -0.7908614, 1, 1, 1, 1, 1,
-0.4909578, 0.5466933, 0.472012, 1, 1, 1, 1, 1,
-0.4886557, 0.4961889, -2.321658, 1, 1, 1, 1, 1,
-0.4839181, 0.4591622, -1.195559, 1, 1, 1, 1, 1,
-0.4835297, -0.8627477, -2.541425, 1, 1, 1, 1, 1,
-0.4831643, 1.514797, -2.037317, 1, 1, 1, 1, 1,
-0.4816082, 1.853803, -0.4181284, 1, 1, 1, 1, 1,
-0.479514, -0.6358591, -4.461051, 1, 1, 1, 1, 1,
-0.4772938, -0.9766467, -1.908209, 1, 1, 1, 1, 1,
-0.4770456, 0.07959087, -1.175233, 1, 1, 1, 1, 1,
-0.4750642, -0.2263869, -0.708205, 0, 0, 1, 1, 1,
-0.4735905, -0.008450984, -1.132392, 1, 0, 0, 1, 1,
-0.4735679, 0.5744439, -1.941866, 1, 0, 0, 1, 1,
-0.4675905, -0.2169168, -1.965849, 1, 0, 0, 1, 1,
-0.46731, 0.8886532, -0.378527, 1, 0, 0, 1, 1,
-0.4642855, 1.007883, -0.06803756, 1, 0, 0, 1, 1,
-0.4527549, -0.005889074, -1.55403, 0, 0, 0, 1, 1,
-0.445916, -1.436568, -2.275723, 0, 0, 0, 1, 1,
-0.4353079, 0.4385101, -1.443788, 0, 0, 0, 1, 1,
-0.4330408, 0.6417302, 2.254545, 0, 0, 0, 1, 1,
-0.4324648, -0.6547794, -2.606778, 0, 0, 0, 1, 1,
-0.4291588, -0.006888964, -0.397682, 0, 0, 0, 1, 1,
-0.4283931, 0.00205068, -1.812041, 0, 0, 0, 1, 1,
-0.4276224, -0.3021125, -4.17294, 1, 1, 1, 1, 1,
-0.4238912, -0.3817558, -1.992669, 1, 1, 1, 1, 1,
-0.4223159, -0.7449543, -2.952981, 1, 1, 1, 1, 1,
-0.4205556, 0.2841843, -0.6283661, 1, 1, 1, 1, 1,
-0.4191794, 0.5739802, -0.01408712, 1, 1, 1, 1, 1,
-0.4151416, -1.630808, -1.213681, 1, 1, 1, 1, 1,
-0.4123287, 0.5669575, -1.533043, 1, 1, 1, 1, 1,
-0.4093922, 0.1332073, -2.306267, 1, 1, 1, 1, 1,
-0.4055786, -0.4899465, -3.565093, 1, 1, 1, 1, 1,
-0.4055529, 1.331913, 0.6159412, 1, 1, 1, 1, 1,
-0.4030221, -1.197488, -4.729147, 1, 1, 1, 1, 1,
-0.4025913, -2.446451, -3.61695, 1, 1, 1, 1, 1,
-0.4025702, 1.054985, 0.7429013, 1, 1, 1, 1, 1,
-0.4013195, -0.1597035, -1.850382, 1, 1, 1, 1, 1,
-0.3997119, 1.495344, -0.3080441, 1, 1, 1, 1, 1,
-0.395382, -0.2142547, -2.310689, 0, 0, 1, 1, 1,
-0.3930155, 0.07327902, 0.4847216, 1, 0, 0, 1, 1,
-0.391273, 0.2326199, -1.27589, 1, 0, 0, 1, 1,
-0.3851951, 0.926379, -1.125309, 1, 0, 0, 1, 1,
-0.3836233, -1.076242, -3.492549, 1, 0, 0, 1, 1,
-0.3832172, -1.410077, -2.189171, 1, 0, 0, 1, 1,
-0.3824663, -0.6632177, -2.540358, 0, 0, 0, 1, 1,
-0.3822381, 1.452672, 0.9462568, 0, 0, 0, 1, 1,
-0.3812654, -2.257353, -3.389463, 0, 0, 0, 1, 1,
-0.3791407, 1.205693, -2.163344, 0, 0, 0, 1, 1,
-0.3783863, -0.4812849, -2.612354, 0, 0, 0, 1, 1,
-0.3782198, -0.003959076, -1.653316, 0, 0, 0, 1, 1,
-0.3774466, -1.880817, -2.443079, 0, 0, 0, 1, 1,
-0.375376, -0.9884426, -3.715837, 1, 1, 1, 1, 1,
-0.3750508, -1.687634, -2.093444, 1, 1, 1, 1, 1,
-0.3742739, 1.200609, -2.658607, 1, 1, 1, 1, 1,
-0.3726692, 0.2993359, -1.573585, 1, 1, 1, 1, 1,
-0.3720208, 1.252982, -1.009401, 1, 1, 1, 1, 1,
-0.3710588, 0.1520474, -0.4244288, 1, 1, 1, 1, 1,
-0.3660732, 1.207256, -0.6625477, 1, 1, 1, 1, 1,
-0.3621741, -1.07012, -2.869854, 1, 1, 1, 1, 1,
-0.3614452, 0.03597499, -1.269098, 1, 1, 1, 1, 1,
-0.359663, -1.491595, -2.528298, 1, 1, 1, 1, 1,
-0.3581783, -0.002881025, -1.105763, 1, 1, 1, 1, 1,
-0.3564618, 0.2811806, 0.4821757, 1, 1, 1, 1, 1,
-0.3474105, 0.8454239, -2.594656, 1, 1, 1, 1, 1,
-0.3441937, -0.06686308, -2.328145, 1, 1, 1, 1, 1,
-0.3411606, 0.0363677, -0.5426401, 1, 1, 1, 1, 1,
-0.3411055, -0.6366916, -3.995112, 0, 0, 1, 1, 1,
-0.3368838, -1.903228, -3.214636, 1, 0, 0, 1, 1,
-0.3353255, -0.9241088, -4.109648, 1, 0, 0, 1, 1,
-0.3319227, 0.5844532, -0.07256537, 1, 0, 0, 1, 1,
-0.3308805, 2.958257, 0.9347559, 1, 0, 0, 1, 1,
-0.3237369, -0.607688, -2.461697, 1, 0, 0, 1, 1,
-0.3215879, -0.6905596, -3.25887, 0, 0, 0, 1, 1,
-0.3209353, -0.2424617, -3.347527, 0, 0, 0, 1, 1,
-0.314114, 1.268295, 0.61927, 0, 0, 0, 1, 1,
-0.3138982, -0.136411, -2.751636, 0, 0, 0, 1, 1,
-0.3114143, 1.033585, -3.318746, 0, 0, 0, 1, 1,
-0.3062708, 0.1327811, -0.9412943, 0, 0, 0, 1, 1,
-0.3039178, 2.124507, 0.1576383, 0, 0, 0, 1, 1,
-0.3023213, 0.5684325, -1.390758, 1, 1, 1, 1, 1,
-0.3017119, -0.8369385, -4.031507, 1, 1, 1, 1, 1,
-0.3010502, -0.4188101, -2.360774, 1, 1, 1, 1, 1,
-0.2992247, 0.361248, -1.267638, 1, 1, 1, 1, 1,
-0.2971816, -0.269783, -3.451301, 1, 1, 1, 1, 1,
-0.2957827, -0.6719865, -1.732502, 1, 1, 1, 1, 1,
-0.2944619, 0.6705681, -1.661548, 1, 1, 1, 1, 1,
-0.2944221, -2.131471, -4.246802, 1, 1, 1, 1, 1,
-0.293512, -0.5373014, -0.2147864, 1, 1, 1, 1, 1,
-0.2933078, 2.057437, -1.10003, 1, 1, 1, 1, 1,
-0.2888871, 0.6960319, 0.5585369, 1, 1, 1, 1, 1,
-0.287552, 1.155311, -0.6212479, 1, 1, 1, 1, 1,
-0.2837605, 0.7115523, 0.328239, 1, 1, 1, 1, 1,
-0.283042, -1.120375, -3.237292, 1, 1, 1, 1, 1,
-0.2798063, 1.275171, 1.543008, 1, 1, 1, 1, 1,
-0.275382, -1.255371, -2.205709, 0, 0, 1, 1, 1,
-0.2669544, -0.2492962, -2.085006, 1, 0, 0, 1, 1,
-0.2663889, 0.5230924, -1.415059, 1, 0, 0, 1, 1,
-0.2658114, -0.1877894, -1.704466, 1, 0, 0, 1, 1,
-0.2658063, -0.6119447, -1.159065, 1, 0, 0, 1, 1,
-0.2649963, -0.5897778, -2.468946, 1, 0, 0, 1, 1,
-0.2649364, -0.5418743, -2.133339, 0, 0, 0, 1, 1,
-0.2585687, 1.841787, 1.043168, 0, 0, 0, 1, 1,
-0.2566147, 1.181504, 1.565872, 0, 0, 0, 1, 1,
-0.2540421, -1.327034, -4.564501, 0, 0, 0, 1, 1,
-0.2484783, -1.703866, -2.849459, 0, 0, 0, 1, 1,
-0.2474349, 1.73441, -0.8718451, 0, 0, 0, 1, 1,
-0.2473903, -1.330353, -2.263453, 0, 0, 0, 1, 1,
-0.2470071, 0.0176768, -0.2209262, 1, 1, 1, 1, 1,
-0.2461245, 1.675338, -1.831093, 1, 1, 1, 1, 1,
-0.2445931, -0.04218662, -2.5988, 1, 1, 1, 1, 1,
-0.2445026, 0.1156768, -1.440885, 1, 1, 1, 1, 1,
-0.2414, 0.7573786, 2.112818, 1, 1, 1, 1, 1,
-0.2362375, -0.3662055, -3.502774, 1, 1, 1, 1, 1,
-0.2359571, 1.238715, -0.07593059, 1, 1, 1, 1, 1,
-0.2340823, -0.6062294, -3.998788, 1, 1, 1, 1, 1,
-0.230203, -3.260984, -2.965363, 1, 1, 1, 1, 1,
-0.2293811, -1.349879, -3.119811, 1, 1, 1, 1, 1,
-0.2231447, -0.01665745, -2.591708, 1, 1, 1, 1, 1,
-0.221834, -1.964423, -1.373743, 1, 1, 1, 1, 1,
-0.2216779, 0.8231228, -1.661683, 1, 1, 1, 1, 1,
-0.2209474, -0.1247576, -3.086587, 1, 1, 1, 1, 1,
-0.2088504, -0.2140794, -3.871183, 1, 1, 1, 1, 1,
-0.2078388, -1.052851, -3.882411, 0, 0, 1, 1, 1,
-0.1995137, 0.07500903, -0.9812555, 1, 0, 0, 1, 1,
-0.1966017, -0.3309978, -3.070554, 1, 0, 0, 1, 1,
-0.1954201, -0.9269059, -1.196412, 1, 0, 0, 1, 1,
-0.1946575, 0.6057789, 0.01609461, 1, 0, 0, 1, 1,
-0.1907511, -0.5375229, -3.390179, 1, 0, 0, 1, 1,
-0.1899997, 0.6549955, -0.2469127, 0, 0, 0, 1, 1,
-0.1793481, -0.1530184, -2.915411, 0, 0, 0, 1, 1,
-0.1782925, 0.1693092, -1.276136, 0, 0, 0, 1, 1,
-0.1690711, -0.06297476, -1.4006, 0, 0, 0, 1, 1,
-0.1641247, 0.1394719, -2.081123, 0, 0, 0, 1, 1,
-0.163868, -0.9696223, -2.474644, 0, 0, 0, 1, 1,
-0.1610291, 0.7681895, 0.704013, 0, 0, 0, 1, 1,
-0.1582071, 1.015879, -1.360228, 1, 1, 1, 1, 1,
-0.1555189, 1.804998, -0.864106, 1, 1, 1, 1, 1,
-0.1542272, -0.7298242, -0.8910576, 1, 1, 1, 1, 1,
-0.1459544, 0.4974798, -1.1178, 1, 1, 1, 1, 1,
-0.1423955, 1.020734, 1.528491, 1, 1, 1, 1, 1,
-0.1376571, -0.5167361, -1.641963, 1, 1, 1, 1, 1,
-0.1373264, 0.6065183, -0.7578774, 1, 1, 1, 1, 1,
-0.1313242, -1.09306, -1.01782, 1, 1, 1, 1, 1,
-0.1289388, 0.2112122, -2.343884, 1, 1, 1, 1, 1,
-0.1277042, 1.148201, -0.2774909, 1, 1, 1, 1, 1,
-0.1212657, 0.5739737, -0.1655073, 1, 1, 1, 1, 1,
-0.1133232, 0.9250105, -1.188312, 1, 1, 1, 1, 1,
-0.1105045, 1.596859, 0.6308488, 1, 1, 1, 1, 1,
-0.1092658, -0.3739107, -3.192203, 1, 1, 1, 1, 1,
-0.08839448, 1.211105, 2.657762, 1, 1, 1, 1, 1,
-0.08826144, 1.464399, -1.498255, 0, 0, 1, 1, 1,
-0.08775979, 0.2187487, -1.130796, 1, 0, 0, 1, 1,
-0.085367, -0.6465839, -4.003193, 1, 0, 0, 1, 1,
-0.08430369, 0.6741907, 0.9219956, 1, 0, 0, 1, 1,
-0.08328319, -0.7844325, -3.558116, 1, 0, 0, 1, 1,
-0.07889409, 0.9972462, 0.07976595, 1, 0, 0, 1, 1,
-0.07020012, -0.9567559, -2.775227, 0, 0, 0, 1, 1,
-0.06978676, 0.640923, -1.354433, 0, 0, 0, 1, 1,
-0.06765868, 2.037262, 0.9864445, 0, 0, 0, 1, 1,
-0.06439527, -0.384578, -2.448044, 0, 0, 0, 1, 1,
-0.05862317, 0.03304008, -0.9882025, 0, 0, 0, 1, 1,
-0.05856837, 1.149969, -1.407766, 0, 0, 0, 1, 1,
-0.05381058, 0.62402, -0.65625, 0, 0, 0, 1, 1,
-0.05344987, 0.6880025, 0.07304736, 1, 1, 1, 1, 1,
-0.05049284, -1.085651, -3.011041, 1, 1, 1, 1, 1,
-0.04954878, 0.2620256, 1.963177, 1, 1, 1, 1, 1,
-0.04629772, -0.5943103, -1.831225, 1, 1, 1, 1, 1,
-0.04458557, 0.148224, -1.029065, 1, 1, 1, 1, 1,
-0.04185197, -0.1617482, -2.146965, 1, 1, 1, 1, 1,
-0.04110725, 0.4368284, 0.7909489, 1, 1, 1, 1, 1,
-0.03386613, 0.06710033, 0.02746483, 1, 1, 1, 1, 1,
-0.03097393, -0.1439431, -3.153611, 1, 1, 1, 1, 1,
-0.02695392, 0.817091, -0.2498035, 1, 1, 1, 1, 1,
-0.02604962, -0.3457198, -3.571026, 1, 1, 1, 1, 1,
-0.02006145, 0.1081982, -1.483547, 1, 1, 1, 1, 1,
-0.01058448, -0.9584554, -2.08631, 1, 1, 1, 1, 1,
-0.01037926, -1.896639, -4.0397, 1, 1, 1, 1, 1,
-0.006850412, -1.735031, -2.837905, 1, 1, 1, 1, 1,
-0.001903595, 1.171041, -0.1113402, 0, 0, 1, 1, 1,
-0.001240401, 1.773973, -0.4508854, 1, 0, 0, 1, 1,
0.001803433, 0.3881898, -0.4829753, 1, 0, 0, 1, 1,
0.003136571, 1.008549, -0.8410648, 1, 0, 0, 1, 1,
0.004614434, -0.2197195, 2.00702, 1, 0, 0, 1, 1,
0.008065833, 1.621141, 0.1566886, 1, 0, 0, 1, 1,
0.009498449, 0.9519393, 0.1867618, 0, 0, 0, 1, 1,
0.01057958, 0.2481873, -0.3428863, 0, 0, 0, 1, 1,
0.01153638, -0.4607333, 4.730957, 0, 0, 0, 1, 1,
0.01628843, -1.58382, 2.58269, 0, 0, 0, 1, 1,
0.01711076, -0.8900908, 2.84801, 0, 0, 0, 1, 1,
0.02139313, 0.8295844, 0.1480527, 0, 0, 0, 1, 1,
0.02184427, 0.06598953, 2.008237, 0, 0, 0, 1, 1,
0.02470801, -0.9543271, 2.653916, 1, 1, 1, 1, 1,
0.02472495, 0.4473625, -1.770409, 1, 1, 1, 1, 1,
0.02552399, 1.328449, -1.192005, 1, 1, 1, 1, 1,
0.03045924, -0.07679775, 3.188899, 1, 1, 1, 1, 1,
0.03305187, -0.8218289, 1.577081, 1, 1, 1, 1, 1,
0.03351954, 0.8574903, 0.1073731, 1, 1, 1, 1, 1,
0.03420024, -0.5858042, 3.638504, 1, 1, 1, 1, 1,
0.03807431, -0.166315, 2.207239, 1, 1, 1, 1, 1,
0.03859313, 1.397262, 0.7622827, 1, 1, 1, 1, 1,
0.03871458, 1.076302, 0.1729287, 1, 1, 1, 1, 1,
0.04128098, -1.082572, 1.850718, 1, 1, 1, 1, 1,
0.04135484, 0.1703777, 0.7705899, 1, 1, 1, 1, 1,
0.04159539, -0.8853031, 4.587873, 1, 1, 1, 1, 1,
0.04358212, -2.777922, 3.089546, 1, 1, 1, 1, 1,
0.04882678, -0.6388578, 1.105346, 1, 1, 1, 1, 1,
0.04940072, -0.2918722, 1.016784, 0, 0, 1, 1, 1,
0.05282582, -2.34843, 2.745653, 1, 0, 0, 1, 1,
0.05345736, -0.3387272, 3.557399, 1, 0, 0, 1, 1,
0.05652601, 0.6029832, 1.68073, 1, 0, 0, 1, 1,
0.05758271, -0.2192386, 1.804708, 1, 0, 0, 1, 1,
0.06231346, -0.4706069, 3.766224, 1, 0, 0, 1, 1,
0.06383206, 2.349556, -0.1024582, 0, 0, 0, 1, 1,
0.06503092, 1.039392, 0.02609372, 0, 0, 0, 1, 1,
0.06792846, -1.409014, 3.533248, 0, 0, 0, 1, 1,
0.07696951, -0.9846274, 3.10399, 0, 0, 0, 1, 1,
0.08028292, 1.114069, 0.7131418, 0, 0, 0, 1, 1,
0.08263584, 0.1467661, 0.8502731, 0, 0, 0, 1, 1,
0.0847396, 1.53469, 0.2098029, 0, 0, 0, 1, 1,
0.08573778, -1.140465, 5.182669, 1, 1, 1, 1, 1,
0.0890775, -0.407803, 2.59774, 1, 1, 1, 1, 1,
0.09261139, 0.9294347, 1.157484, 1, 1, 1, 1, 1,
0.09494966, 0.4943887, 2.100717, 1, 1, 1, 1, 1,
0.1012614, 1.508811, -1.284743, 1, 1, 1, 1, 1,
0.1014425, 1.291099, 1.110587, 1, 1, 1, 1, 1,
0.1024183, 0.3115375, 0.000475772, 1, 1, 1, 1, 1,
0.1063025, 0.730274, -0.01582827, 1, 1, 1, 1, 1,
0.114882, 1.189974, -0.2193422, 1, 1, 1, 1, 1,
0.1149897, 0.9237744, 0.8361863, 1, 1, 1, 1, 1,
0.1156558, 0.4766198, -1.750328, 1, 1, 1, 1, 1,
0.1173942, -1.768323, 2.530534, 1, 1, 1, 1, 1,
0.1182136, -1.527397, 2.525367, 1, 1, 1, 1, 1,
0.1187736, 0.2510138, 0.6359005, 1, 1, 1, 1, 1,
0.1285345, -0.07515574, 2.188105, 1, 1, 1, 1, 1,
0.1309998, 1.633404, 1.364091, 0, 0, 1, 1, 1,
0.1320492, -0.009801816, 0.1004789, 1, 0, 0, 1, 1,
0.1387926, -1.639718, 3.236457, 1, 0, 0, 1, 1,
0.1463335, 0.127085, 2.595665, 1, 0, 0, 1, 1,
0.1510934, -0.8927284, 3.025959, 1, 0, 0, 1, 1,
0.1543226, -2.293999, 3.957481, 1, 0, 0, 1, 1,
0.1551325, -1.008064, 3.382025, 0, 0, 0, 1, 1,
0.1589999, 0.618365, -0.9443719, 0, 0, 0, 1, 1,
0.1627473, 0.5505717, 1.723113, 0, 0, 0, 1, 1,
0.1635665, 0.2792576, 2.453072, 0, 0, 0, 1, 1,
0.1691778, -2.272054, 2.38976, 0, 0, 0, 1, 1,
0.1754747, 1.487432, 2.01581, 0, 0, 0, 1, 1,
0.1818159, 1.561303, -1.503637, 0, 0, 0, 1, 1,
0.1880776, 0.6020374, 1.393039, 1, 1, 1, 1, 1,
0.1892027, 1.150416, 1.408217, 1, 1, 1, 1, 1,
0.1919126, -1.376629, 2.469555, 1, 1, 1, 1, 1,
0.1948041, -0.9550498, 2.579728, 1, 1, 1, 1, 1,
0.1979676, 1.028755, -0.3427498, 1, 1, 1, 1, 1,
0.2009245, -0.2167388, 1.516347, 1, 1, 1, 1, 1,
0.2023427, -1.403109, 1.883222, 1, 1, 1, 1, 1,
0.2060149, -1.530992, 1.785835, 1, 1, 1, 1, 1,
0.2111181, -0.2814075, 2.326279, 1, 1, 1, 1, 1,
0.211165, 1.130682, 1.455158, 1, 1, 1, 1, 1,
0.2112201, 0.6838176, 0.6529241, 1, 1, 1, 1, 1,
0.2113259, -0.1188442, 2.338211, 1, 1, 1, 1, 1,
0.2114561, 1.78053, 1.486625, 1, 1, 1, 1, 1,
0.2148097, 0.3094104, 1.04675, 1, 1, 1, 1, 1,
0.2149043, -1.627132, 1.495741, 1, 1, 1, 1, 1,
0.2174244, -0.390161, 4.050068, 0, 0, 1, 1, 1,
0.2174799, 1.799913, 0.9159436, 1, 0, 0, 1, 1,
0.218567, 1.523581, 0.9652961, 1, 0, 0, 1, 1,
0.2186388, 1.541344, 1.502599, 1, 0, 0, 1, 1,
0.2417318, 0.1539255, 1.227312, 1, 0, 0, 1, 1,
0.2459248, -0.5233164, 2.056428, 1, 0, 0, 1, 1,
0.2522536, 2.451674, 0.706467, 0, 0, 0, 1, 1,
0.2522754, 1.912266, 0.7302714, 0, 0, 0, 1, 1,
0.2524191, 2.024685, 0.2745152, 0, 0, 0, 1, 1,
0.2528066, 0.176521, 0.4445842, 0, 0, 0, 1, 1,
0.2534691, -0.7328832, 2.703202, 0, 0, 0, 1, 1,
0.2554937, 1.865161, 1.492967, 0, 0, 0, 1, 1,
0.2566655, 0.1848986, -0.1529223, 0, 0, 0, 1, 1,
0.2636016, 0.110652, 1.340302, 1, 1, 1, 1, 1,
0.2659464, -1.063245, 2.447495, 1, 1, 1, 1, 1,
0.2687953, 1.235988, -1.477749, 1, 1, 1, 1, 1,
0.2770667, 0.4161012, -0.167691, 1, 1, 1, 1, 1,
0.2815093, 0.2945724, 0.7301529, 1, 1, 1, 1, 1,
0.2826337, 0.06173806, 1.759984, 1, 1, 1, 1, 1,
0.2844472, -0.2049869, 1.205278, 1, 1, 1, 1, 1,
0.2867441, -0.4103373, 3.849195, 1, 1, 1, 1, 1,
0.2917289, 0.3280168, 0.2799427, 1, 1, 1, 1, 1,
0.2933856, 0.3317667, 2.921148, 1, 1, 1, 1, 1,
0.2991668, 1.092384, -0.7193161, 1, 1, 1, 1, 1,
0.3009569, 0.9184532, 0.05656655, 1, 1, 1, 1, 1,
0.3026344, 1.790764, 0.1953804, 1, 1, 1, 1, 1,
0.3029278, 0.6062077, 0.05724917, 1, 1, 1, 1, 1,
0.3062334, 0.1459699, 1.901331, 1, 1, 1, 1, 1,
0.3068191, 1.192359, 0.2340206, 0, 0, 1, 1, 1,
0.3080686, -0.2179841, 1.797109, 1, 0, 0, 1, 1,
0.3085887, -0.5112936, 1.275833, 1, 0, 0, 1, 1,
0.3145816, 0.2389095, 0.08611988, 1, 0, 0, 1, 1,
0.3194367, -0.8287247, 2.401516, 1, 0, 0, 1, 1,
0.3199994, 0.7505035, -0.695738, 1, 0, 0, 1, 1,
0.3205263, -0.972097, 3.322003, 0, 0, 0, 1, 1,
0.3267654, -1.64118, 1.720915, 0, 0, 0, 1, 1,
0.3276711, -1.262039, 2.05623, 0, 0, 0, 1, 1,
0.3330477, 0.313002, 0.1301764, 0, 0, 0, 1, 1,
0.3341852, 0.9363144, -0.6204439, 0, 0, 0, 1, 1,
0.3351863, 0.9592254, 0.1846795, 0, 0, 0, 1, 1,
0.3397169, 1.037588, 2.224022, 0, 0, 0, 1, 1,
0.3416615, -0.08546801, 2.506416, 1, 1, 1, 1, 1,
0.3488785, 0.577515, -1.070512, 1, 1, 1, 1, 1,
0.3579593, -1.395362, 1.941081, 1, 1, 1, 1, 1,
0.3615725, -0.4083846, 2.918217, 1, 1, 1, 1, 1,
0.3616325, 0.9026862, 3.134747, 1, 1, 1, 1, 1,
0.3618474, -0.6229691, 3.380117, 1, 1, 1, 1, 1,
0.3661418, 1.830049, 0.9516345, 1, 1, 1, 1, 1,
0.3662793, 1.743303, 0.214575, 1, 1, 1, 1, 1,
0.3698154, -0.2027073, 2.139685, 1, 1, 1, 1, 1,
0.3701696, -1.118488, 2.830726, 1, 1, 1, 1, 1,
0.3742455, -1.719484, 2.086998, 1, 1, 1, 1, 1,
0.375401, -0.9744366, 2.767118, 1, 1, 1, 1, 1,
0.3771966, 1.202668, -0.9375904, 1, 1, 1, 1, 1,
0.3821441, -1.811638, 1.993052, 1, 1, 1, 1, 1,
0.3828801, -1.801526, 2.492787, 1, 1, 1, 1, 1,
0.3842782, -0.00704022, 1.380062, 0, 0, 1, 1, 1,
0.3846697, 1.092141, 0.9994155, 1, 0, 0, 1, 1,
0.3853376, -1.364686, 2.324912, 1, 0, 0, 1, 1,
0.386583, 1.126392, 0.870195, 1, 0, 0, 1, 1,
0.3874103, 0.05280465, 1.179136, 1, 0, 0, 1, 1,
0.3900653, 0.08935285, 1.66308, 1, 0, 0, 1, 1,
0.3960162, 0.5873007, 0.8946455, 0, 0, 0, 1, 1,
0.401795, -0.8162788, 3.689864, 0, 0, 0, 1, 1,
0.4030228, 0.4540796, 1.134486, 0, 0, 0, 1, 1,
0.4059138, -0.3812334, 1.229166, 0, 0, 0, 1, 1,
0.4076956, 0.433843, 1.503717, 0, 0, 0, 1, 1,
0.4082841, 0.3286291, 0.8986536, 0, 0, 0, 1, 1,
0.4099935, -1.671621, 2.110017, 0, 0, 0, 1, 1,
0.4105693, 1.828441, -1.218938, 1, 1, 1, 1, 1,
0.4222975, -1.42148, 3.636874, 1, 1, 1, 1, 1,
0.4265542, 0.4299118, 1.013979, 1, 1, 1, 1, 1,
0.427142, -0.9677507, 4.403477, 1, 1, 1, 1, 1,
0.4320279, 0.1628377, 0.8024566, 1, 1, 1, 1, 1,
0.4347093, 1.644083, 0.8776407, 1, 1, 1, 1, 1,
0.4362033, 0.1517339, 0.2515479, 1, 1, 1, 1, 1,
0.4363441, 1.243957, -1.951089, 1, 1, 1, 1, 1,
0.4393696, 1.732138, 1.847673, 1, 1, 1, 1, 1,
0.439598, -0.4308876, 1.909081, 1, 1, 1, 1, 1,
0.4409546, -1.302904, 3.534887, 1, 1, 1, 1, 1,
0.4444171, -0.7480103, 1.572542, 1, 1, 1, 1, 1,
0.4500954, 0.4393237, 1.641382, 1, 1, 1, 1, 1,
0.4594525, -0.6434686, 0.8603531, 1, 1, 1, 1, 1,
0.4610541, -1.065382, 0.9823181, 1, 1, 1, 1, 1,
0.4616059, 0.312273, 1.621293, 0, 0, 1, 1, 1,
0.4682387, -0.1579122, 2.61439, 1, 0, 0, 1, 1,
0.4684996, -1.269915, 3.147335, 1, 0, 0, 1, 1,
0.471533, -0.347076, 1.932702, 1, 0, 0, 1, 1,
0.4725417, 1.710758, 1.765549, 1, 0, 0, 1, 1,
0.4732519, -1.176452, 1.816374, 1, 0, 0, 1, 1,
0.4820087, -2.25691, 2.032514, 0, 0, 0, 1, 1,
0.4831226, 0.3579517, -0.180012, 0, 0, 0, 1, 1,
0.4843835, 2.324583, 0.9495373, 0, 0, 0, 1, 1,
0.4854422, 1.315909, -0.4832317, 0, 0, 0, 1, 1,
0.4970984, 0.5877392, 0.08538851, 0, 0, 0, 1, 1,
0.5019493, -0.959673, 2.185158, 0, 0, 0, 1, 1,
0.5090967, 0.683264, 0.3563321, 0, 0, 0, 1, 1,
0.5144984, -2.472983, 3.373992, 1, 1, 1, 1, 1,
0.5147191, 0.4061229, 1.587923, 1, 1, 1, 1, 1,
0.5186492, -1.370582, 3.28187, 1, 1, 1, 1, 1,
0.5186962, -0.750612, 3.086204, 1, 1, 1, 1, 1,
0.530412, -0.681172, 2.905452, 1, 1, 1, 1, 1,
0.5348254, 2.741582, 1.013616, 1, 1, 1, 1, 1,
0.5374429, 0.9425166, -0.07856502, 1, 1, 1, 1, 1,
0.5375971, -0.5890568, 2.005217, 1, 1, 1, 1, 1,
0.5473707, 1.478454, 0.3527629, 1, 1, 1, 1, 1,
0.5501493, 0.870594, 1.559722, 1, 1, 1, 1, 1,
0.5504055, -0.03259957, 1.190292, 1, 1, 1, 1, 1,
0.5522459, 1.302103, -0.4665762, 1, 1, 1, 1, 1,
0.5601642, 1.640509, 0.3990498, 1, 1, 1, 1, 1,
0.5606586, -0.2830585, 1.261187, 1, 1, 1, 1, 1,
0.5606709, 0.7535918, 0.05216107, 1, 1, 1, 1, 1,
0.5635679, 0.4516265, 1.679726, 0, 0, 1, 1, 1,
0.5661771, 0.1854079, 1.582736, 1, 0, 0, 1, 1,
0.5726029, -0.923155, 1.404103, 1, 0, 0, 1, 1,
0.573911, 0.3466954, 1.457465, 1, 0, 0, 1, 1,
0.5740508, 0.8263121, 0.4177597, 1, 0, 0, 1, 1,
0.5741942, 0.06206651, 1.063256, 1, 0, 0, 1, 1,
0.5742785, 1.350577, 0.9842882, 0, 0, 0, 1, 1,
0.5764182, -0.4439295, 1.378916, 0, 0, 0, 1, 1,
0.5791036, 0.2851926, 1.128819, 0, 0, 0, 1, 1,
0.5830762, 1.265124, 1.020419, 0, 0, 0, 1, 1,
0.5860792, -0.378752, 2.653041, 0, 0, 0, 1, 1,
0.5877131, -0.0004089773, 1.090424, 0, 0, 0, 1, 1,
0.5895705, -1.548247, 3.378642, 0, 0, 0, 1, 1,
0.5906563, -1.16882, 3.730244, 1, 1, 1, 1, 1,
0.5941554, -0.2227966, 0.4598469, 1, 1, 1, 1, 1,
0.594802, 1.257097, 1.789191, 1, 1, 1, 1, 1,
0.595232, -1.027337, 2.280428, 1, 1, 1, 1, 1,
0.5991136, 0.937951, 0.8905544, 1, 1, 1, 1, 1,
0.600031, 0.5094517, 0.198721, 1, 1, 1, 1, 1,
0.6004487, 0.1100207, 1.349092, 1, 1, 1, 1, 1,
0.6062696, 1.025253, 2.057813, 1, 1, 1, 1, 1,
0.6078349, 1.104397, 0.4543071, 1, 1, 1, 1, 1,
0.6092039, 0.1816095, 0.8925259, 1, 1, 1, 1, 1,
0.6112595, 1.448012, -0.358264, 1, 1, 1, 1, 1,
0.6119094, 0.07714249, 2.231525, 1, 1, 1, 1, 1,
0.6121497, -0.2675112, 1.677903, 1, 1, 1, 1, 1,
0.6129121, 1.521134, 0.7103465, 1, 1, 1, 1, 1,
0.6131233, -0.517369, 1.587354, 1, 1, 1, 1, 1,
0.6137305, 0.1545138, 2.003369, 0, 0, 1, 1, 1,
0.6143125, -0.619705, 0.928778, 1, 0, 0, 1, 1,
0.6231772, -1.053563, 2.745897, 1, 0, 0, 1, 1,
0.6259587, 0.2942501, 0.8336585, 1, 0, 0, 1, 1,
0.6396152, -1.06247, 2.419765, 1, 0, 0, 1, 1,
0.6397496, 0.04253098, -0.08351281, 1, 0, 0, 1, 1,
0.6401201, 1.364896, 0.2410549, 0, 0, 0, 1, 1,
0.6417295, -0.4536523, 1.230767, 0, 0, 0, 1, 1,
0.6441926, 0.8020098, 2.42821, 0, 0, 0, 1, 1,
0.6468961, 0.9229602, 0.2934521, 0, 0, 0, 1, 1,
0.6501484, -0.2737955, 1.549702, 0, 0, 0, 1, 1,
0.6597155, 0.4471016, 0.271985, 0, 0, 0, 1, 1,
0.6634365, 0.08625612, -0.8217239, 0, 0, 0, 1, 1,
0.6733623, -0.5335296, 2.871121, 1, 1, 1, 1, 1,
0.6741964, -0.2556885, 0.2658764, 1, 1, 1, 1, 1,
0.6756283, 0.8132051, 0.519529, 1, 1, 1, 1, 1,
0.6801556, -0.1671598, 2.000906, 1, 1, 1, 1, 1,
0.6825587, 0.8374835, 0.1680657, 1, 1, 1, 1, 1,
0.6831706, -0.2150524, 3.245351, 1, 1, 1, 1, 1,
0.6903397, -0.8603033, 1.947559, 1, 1, 1, 1, 1,
0.6923667, 0.8521214, 1.700733, 1, 1, 1, 1, 1,
0.6954299, 0.08568074, 0.9029208, 1, 1, 1, 1, 1,
0.6967986, -0.0955195, 3.623771, 1, 1, 1, 1, 1,
0.7002931, -0.6030545, 2.226944, 1, 1, 1, 1, 1,
0.7021077, 0.8274488, 1.673418, 1, 1, 1, 1, 1,
0.7037345, -0.2483828, 0.636475, 1, 1, 1, 1, 1,
0.7071627, 0.6234291, 2.3981, 1, 1, 1, 1, 1,
0.7078342, -2.460071, -0.07111757, 1, 1, 1, 1, 1,
0.708266, 0.7946177, -0.3209126, 0, 0, 1, 1, 1,
0.7091891, 1.656793, -0.390109, 1, 0, 0, 1, 1,
0.7112837, -0.160461, 1.562924, 1, 0, 0, 1, 1,
0.7113432, -1.092633, 4.351828, 1, 0, 0, 1, 1,
0.7152777, 0.1171262, 0.822955, 1, 0, 0, 1, 1,
0.7155458, 0.2961079, 0.7805167, 1, 0, 0, 1, 1,
0.7180455, 0.2025147, 2.780499, 0, 0, 0, 1, 1,
0.719205, -0.04058634, 2.876022, 0, 0, 0, 1, 1,
0.7193264, 0.3514187, 3.307426, 0, 0, 0, 1, 1,
0.7225683, -2.162575, 2.492392, 0, 0, 0, 1, 1,
0.7239282, 0.4122413, 2.078548, 0, 0, 0, 1, 1,
0.7261134, 1.340634, -0.4777036, 0, 0, 0, 1, 1,
0.7263633, -2.157989, 1.791081, 0, 0, 0, 1, 1,
0.7272266, -1.923802, 3.808095, 1, 1, 1, 1, 1,
0.7337084, -0.4929456, 3.344473, 1, 1, 1, 1, 1,
0.7397043, 0.6299936, 0.8074336, 1, 1, 1, 1, 1,
0.7409988, -0.1304719, 2.208222, 1, 1, 1, 1, 1,
0.7430348, 0.1682439, 2.636922, 1, 1, 1, 1, 1,
0.7436326, -0.09048889, 0.6837651, 1, 1, 1, 1, 1,
0.7459809, -0.114678, 1.774583, 1, 1, 1, 1, 1,
0.7497492, -0.4241936, 0.8918505, 1, 1, 1, 1, 1,
0.7516171, 0.4388263, 1.262352, 1, 1, 1, 1, 1,
0.7517684, 0.6840575, 2.123092, 1, 1, 1, 1, 1,
0.7522518, 0.3319319, 1.959097, 1, 1, 1, 1, 1,
0.7546872, -2.149787, 1.21843, 1, 1, 1, 1, 1,
0.7604137, 0.8938375, -0.3126544, 1, 1, 1, 1, 1,
0.7617447, 1.505776, -1.23187, 1, 1, 1, 1, 1,
0.771043, -0.6846722, 3.947397, 1, 1, 1, 1, 1,
0.7754249, -0.1511302, 1.43298, 0, 0, 1, 1, 1,
0.7804646, -0.1503128, 1.138081, 1, 0, 0, 1, 1,
0.7815986, -0.992142, 2.61238, 1, 0, 0, 1, 1,
0.7840183, -0.1350956, 1.404887, 1, 0, 0, 1, 1,
0.789571, -0.08369384, 2.335654, 1, 0, 0, 1, 1,
0.7916025, 1.701966, 1.502575, 1, 0, 0, 1, 1,
0.7921361, 1.224672, 0.8064473, 0, 0, 0, 1, 1,
0.7968897, 0.3456428, 0.9634647, 0, 0, 0, 1, 1,
0.7974108, 0.03799476, 0.3842281, 0, 0, 0, 1, 1,
0.7986152, -0.03881847, 2.461792, 0, 0, 0, 1, 1,
0.8031766, 0.04435379, 0.1835764, 0, 0, 0, 1, 1,
0.8094996, 0.1600436, 2.041071, 0, 0, 0, 1, 1,
0.8107778, 0.1484562, 0.8237376, 0, 0, 0, 1, 1,
0.8165374, -0.9681286, 2.718957, 1, 1, 1, 1, 1,
0.8186737, 0.1445491, 2.500146, 1, 1, 1, 1, 1,
0.8189592, 1.698178, 0.9520864, 1, 1, 1, 1, 1,
0.8212153, -0.1160999, 1.297064, 1, 1, 1, 1, 1,
0.8215692, -1.982313, 3.473118, 1, 1, 1, 1, 1,
0.8223909, 0.228956, 1.190923, 1, 1, 1, 1, 1,
0.8226058, -0.7739502, 1.847952, 1, 1, 1, 1, 1,
0.8298731, -2.077198, 2.288928, 1, 1, 1, 1, 1,
0.8332121, -0.9339097, 2.487949, 1, 1, 1, 1, 1,
0.8366489, 0.6741475, 0.6605034, 1, 1, 1, 1, 1,
0.8411384, 0.3538617, -0.5186476, 1, 1, 1, 1, 1,
0.8445351, 0.1384731, 0.8715078, 1, 1, 1, 1, 1,
0.8508507, -0.2536781, 1.218538, 1, 1, 1, 1, 1,
0.852837, -0.2822678, 2.286021, 1, 1, 1, 1, 1,
0.855639, 0.01977718, 2.651869, 1, 1, 1, 1, 1,
0.8578467, 1.069582, 2.020703, 0, 0, 1, 1, 1,
0.8590248, 0.7080876, 0.8881206, 1, 0, 0, 1, 1,
0.8637339, -0.3009278, 1.83863, 1, 0, 0, 1, 1,
0.8640361, -1.877461, 2.417749, 1, 0, 0, 1, 1,
0.8725428, -0.997255, 2.714322, 1, 0, 0, 1, 1,
0.873412, 0.1292284, 2.292299, 1, 0, 0, 1, 1,
0.8790529, 0.0335188, 1.984668, 0, 0, 0, 1, 1,
0.8854614, 0.6873561, 1.033799, 0, 0, 0, 1, 1,
0.8855495, 0.3382734, 0.4900797, 0, 0, 0, 1, 1,
0.8932096, -0.5086601, 1.352531, 0, 0, 0, 1, 1,
0.8960335, -0.07262898, 1.142879, 0, 0, 0, 1, 1,
0.9042348, 1.120639, 0.05799871, 0, 0, 0, 1, 1,
0.9085358, 0.7934396, 1.803693, 0, 0, 0, 1, 1,
0.9087571, -0.5144361, 3.351156, 1, 1, 1, 1, 1,
0.9110219, 0.896715, 2.513173, 1, 1, 1, 1, 1,
0.9226009, 0.2639303, 1.109139, 1, 1, 1, 1, 1,
0.9227321, 0.3700562, 1.040215, 1, 1, 1, 1, 1,
0.9245364, -1.166158, 2.149984, 1, 1, 1, 1, 1,
0.9336525, -0.8256437, 2.749957, 1, 1, 1, 1, 1,
0.9403205, 0.7684764, 1.098991, 1, 1, 1, 1, 1,
0.9413477, 0.3258116, -1.539347, 1, 1, 1, 1, 1,
0.9540807, 0.1884249, 0.5035598, 1, 1, 1, 1, 1,
0.9572426, 0.03192623, 0.006075509, 1, 1, 1, 1, 1,
0.9591627, -1.260658, 4.805034, 1, 1, 1, 1, 1,
0.9601785, 0.6934696, 1.013979, 1, 1, 1, 1, 1,
0.9603712, -0.7930778, 0.5701457, 1, 1, 1, 1, 1,
0.9605078, 0.008549974, 0.6587587, 1, 1, 1, 1, 1,
0.961687, -1.490901, 3.569578, 1, 1, 1, 1, 1,
0.9646873, 0.4150038, 2.025593, 0, 0, 1, 1, 1,
0.9674966, 0.8292388, 1.512513, 1, 0, 0, 1, 1,
0.9679335, -1.113673, 2.202687, 1, 0, 0, 1, 1,
0.9682207, 0.5927739, -0.231144, 1, 0, 0, 1, 1,
0.9699806, 0.8941435, 1.944507, 1, 0, 0, 1, 1,
0.970335, 1.414245, -1.194523, 1, 0, 0, 1, 1,
0.9757999, -0.3696845, 1.665566, 0, 0, 0, 1, 1,
0.9783131, 1.079034, 0.8149999, 0, 0, 0, 1, 1,
0.9814692, -0.5346684, 1.056111, 0, 0, 0, 1, 1,
0.9829658, -1.041362, 2.111538, 0, 0, 0, 1, 1,
0.9933561, -0.2731612, 1.859674, 0, 0, 0, 1, 1,
0.9968541, -0.3381585, 1.492879, 0, 0, 0, 1, 1,
1.001675, -1.143347, 1.955227, 0, 0, 0, 1, 1,
1.019857, -0.7607277, 2.383377, 1, 1, 1, 1, 1,
1.022388, 0.5457164, 1.145204, 1, 1, 1, 1, 1,
1.023329, 0.1640125, 1.329371, 1, 1, 1, 1, 1,
1.026972, 0.508777, 2.079456, 1, 1, 1, 1, 1,
1.027126, -0.2889346, 2.610953, 1, 1, 1, 1, 1,
1.028011, -0.7152339, 0.9463748, 1, 1, 1, 1, 1,
1.029887, 1.170222, -0.4384815, 1, 1, 1, 1, 1,
1.035328, 0.3918486, 0.4381976, 1, 1, 1, 1, 1,
1.044194, 1.457519, 0.7965281, 1, 1, 1, 1, 1,
1.04756, -0.4777708, 0.7131594, 1, 1, 1, 1, 1,
1.053337, 0.524649, 1.371109, 1, 1, 1, 1, 1,
1.055259, -0.1002211, 0.7752556, 1, 1, 1, 1, 1,
1.057368, 1.315544, 1.251217, 1, 1, 1, 1, 1,
1.057424, -1.464189, 4.155786, 1, 1, 1, 1, 1,
1.066846, -0.3864088, 1.230319, 1, 1, 1, 1, 1,
1.071305, 0.9838082, 0.8067755, 0, 0, 1, 1, 1,
1.073855, -1.983998, 2.622067, 1, 0, 0, 1, 1,
1.078657, 2.22311, 0.4339955, 1, 0, 0, 1, 1,
1.082576, 1.895261, 1.330794, 1, 0, 0, 1, 1,
1.093017, -0.4813304, 3.953841, 1, 0, 0, 1, 1,
1.0976, 1.115601, 1.189671, 1, 0, 0, 1, 1,
1.103613, 1.552083, 0.9747605, 0, 0, 0, 1, 1,
1.115156, -0.9982991, 1.770659, 0, 0, 0, 1, 1,
1.125704, 0.590876, -0.7818744, 0, 0, 0, 1, 1,
1.12585, -0.2086064, 3.263569, 0, 0, 0, 1, 1,
1.126319, 1.184765, 2.42167, 0, 0, 0, 1, 1,
1.128454, -0.336026, 2.124626, 0, 0, 0, 1, 1,
1.128694, -0.9872195, 4.734189, 0, 0, 0, 1, 1,
1.130101, 0.3118671, 2.106891, 1, 1, 1, 1, 1,
1.135621, 0.5993857, 0.2925262, 1, 1, 1, 1, 1,
1.14097, 1.312719, 1.553168, 1, 1, 1, 1, 1,
1.144804, 1.641335, 0.02691052, 1, 1, 1, 1, 1,
1.144988, 1.363613, 0.925251, 1, 1, 1, 1, 1,
1.147887, 0.4744756, 0.3353384, 1, 1, 1, 1, 1,
1.150098, 1.465526, 0.150372, 1, 1, 1, 1, 1,
1.151388, 0.9207904, -0.6943017, 1, 1, 1, 1, 1,
1.152128, 0.2568828, 0.4030018, 1, 1, 1, 1, 1,
1.154621, 0.7271088, 2.798179, 1, 1, 1, 1, 1,
1.155445, 0.03107573, 2.135259, 1, 1, 1, 1, 1,
1.159541, 1.471662, 1.298785, 1, 1, 1, 1, 1,
1.162662, 1.178069, 3.452764, 1, 1, 1, 1, 1,
1.179819, 0.6421967, -0.6321785, 1, 1, 1, 1, 1,
1.197384, -1.363921, 2.334791, 1, 1, 1, 1, 1,
1.203478, -0.06799638, -0.8304516, 0, 0, 1, 1, 1,
1.205713, -0.2396381, 2.327238, 1, 0, 0, 1, 1,
1.214221, 1.2423, 0.5067051, 1, 0, 0, 1, 1,
1.215235, -0.4376587, 3.091306, 1, 0, 0, 1, 1,
1.21656, 0.3319519, 2.126524, 1, 0, 0, 1, 1,
1.231887, 0.1739201, 0.8666274, 1, 0, 0, 1, 1,
1.232074, -0.6512611, 1.280048, 0, 0, 0, 1, 1,
1.234319, 1.263449, 2.60597, 0, 0, 0, 1, 1,
1.236921, 0.3503636, 1.987601, 0, 0, 0, 1, 1,
1.240435, -1.146753, 2.882596, 0, 0, 0, 1, 1,
1.247452, 0.01563601, 1.98188, 0, 0, 0, 1, 1,
1.247733, 0.3525132, 2.599406, 0, 0, 0, 1, 1,
1.248447, -0.1551251, 0.7226584, 0, 0, 0, 1, 1,
1.251092, 1.505624, 0.2382206, 1, 1, 1, 1, 1,
1.251839, -1.471493, 1.911436, 1, 1, 1, 1, 1,
1.262725, -0.7490774, 2.107234, 1, 1, 1, 1, 1,
1.285933, 0.1956689, 0.9313373, 1, 1, 1, 1, 1,
1.305237, 0.4312586, 1.907971, 1, 1, 1, 1, 1,
1.312537, 0.6116865, 2.958553, 1, 1, 1, 1, 1,
1.318187, -0.305178, 0.6716293, 1, 1, 1, 1, 1,
1.323571, -1.009073, 2.017402, 1, 1, 1, 1, 1,
1.340266, -0.30391, 0.6570948, 1, 1, 1, 1, 1,
1.348019, -0.1685297, 1.956447, 1, 1, 1, 1, 1,
1.356615, 1.438207, 0.3990685, 1, 1, 1, 1, 1,
1.359272, 0.1301368, -0.1015808, 1, 1, 1, 1, 1,
1.359447, -0.4329506, 0.5092748, 1, 1, 1, 1, 1,
1.364825, 0.1754168, 2.037597, 1, 1, 1, 1, 1,
1.367463, 0.8610549, 0.9924129, 1, 1, 1, 1, 1,
1.368265, -0.6914529, 3.054063, 0, 0, 1, 1, 1,
1.370266, 0.1248779, 1.896681, 1, 0, 0, 1, 1,
1.370491, -0.6178566, 2.494574, 1, 0, 0, 1, 1,
1.381172, 0.06902646, 2.258202, 1, 0, 0, 1, 1,
1.381915, 1.378094, 0.6131257, 1, 0, 0, 1, 1,
1.382106, -1.329098, 1.836882, 1, 0, 0, 1, 1,
1.3874, 1.012202, 0.8803784, 0, 0, 0, 1, 1,
1.388189, 0.459251, 3.888338, 0, 0, 0, 1, 1,
1.389073, -0.06730493, 3.676809, 0, 0, 0, 1, 1,
1.395199, 0.8365367, -0.03386567, 0, 0, 0, 1, 1,
1.407123, 1.379308, 1.664792, 0, 0, 0, 1, 1,
1.408172, -1.923584, 2.386861, 0, 0, 0, 1, 1,
1.411093, 0.2826666, 0.1431677, 0, 0, 0, 1, 1,
1.44093, -0.8027134, 1.953485, 1, 1, 1, 1, 1,
1.447077, 0.1707096, 2.440016, 1, 1, 1, 1, 1,
1.449929, -0.2175196, 1.270578, 1, 1, 1, 1, 1,
1.457962, 0.2114027, 1.794393, 1, 1, 1, 1, 1,
1.4816, -0.1843615, 2.262061, 1, 1, 1, 1, 1,
1.4833, 1.701349, 1.853635, 1, 1, 1, 1, 1,
1.493612, -1.268117, 0.6615681, 1, 1, 1, 1, 1,
1.523301, -0.4037295, 2.733308, 1, 1, 1, 1, 1,
1.532826, -2.093711, 4.037383, 1, 1, 1, 1, 1,
1.535974, -0.1181182, 1.819501, 1, 1, 1, 1, 1,
1.549081, -0.9372123, 1.319856, 1, 1, 1, 1, 1,
1.567279, -1.170241, 3.685169, 1, 1, 1, 1, 1,
1.573797, 1.880461, -1.295132, 1, 1, 1, 1, 1,
1.592813, -0.1990368, 2.308868, 1, 1, 1, 1, 1,
1.595987, -1.099463, 3.029978, 1, 1, 1, 1, 1,
1.626458, -0.9601032, 1.78472, 0, 0, 1, 1, 1,
1.635039, 0.06855085, 1.9518, 1, 0, 0, 1, 1,
1.6607, -1.780813, 2.24032, 1, 0, 0, 1, 1,
1.675751, -1.077828, 2.91175, 1, 0, 0, 1, 1,
1.685698, 0.4759499, 0.912003, 1, 0, 0, 1, 1,
1.687924, -0.8174086, 2.392387, 1, 0, 0, 1, 1,
1.720153, 0.7536484, 0.1425767, 0, 0, 0, 1, 1,
1.737977, 0.9687613, -0.6698781, 0, 0, 0, 1, 1,
1.76287, -1.335314, 1.571751, 0, 0, 0, 1, 1,
1.775195, 2.557781, 1.301392, 0, 0, 0, 1, 1,
1.796381, -1.29924, 1.007193, 0, 0, 0, 1, 1,
1.799935, -1.137207, 2.539993, 0, 0, 0, 1, 1,
1.804534, -0.07399362, 1.05135, 0, 0, 0, 1, 1,
1.819534, -1.005854, 3.532849, 1, 1, 1, 1, 1,
1.85039, -0.6583289, 1.534948, 1, 1, 1, 1, 1,
1.874624, 0.2940878, 1.698662, 1, 1, 1, 1, 1,
1.87884, -1.363312, 1.314829, 1, 1, 1, 1, 1,
1.891816, -0.1802042, 0.6242511, 1, 1, 1, 1, 1,
1.893867, -1.354553, 1.745052, 1, 1, 1, 1, 1,
1.909614, 1.640145, -0.6641892, 1, 1, 1, 1, 1,
1.911343, 0.2126324, 2.970682, 1, 1, 1, 1, 1,
1.943692, -0.9041035, 2.230564, 1, 1, 1, 1, 1,
1.948451, -1.140514, 0.4401752, 1, 1, 1, 1, 1,
1.96439, 0.4784526, 2.360287, 1, 1, 1, 1, 1,
1.976015, -1.171821, 3.170926, 1, 1, 1, 1, 1,
1.976812, 0.1520249, 0.4854861, 1, 1, 1, 1, 1,
1.978028, 2.061215, 0.5178183, 1, 1, 1, 1, 1,
2.000964, -0.2317851, 1.208583, 1, 1, 1, 1, 1,
2.015331, -3.246622, 3.15205, 0, 0, 1, 1, 1,
2.034226, -0.7622955, 1.879377, 1, 0, 0, 1, 1,
2.038615, 0.3065515, 2.304548, 1, 0, 0, 1, 1,
2.045892, -0.8722404, 4.076616, 1, 0, 0, 1, 1,
2.047722, -0.4045854, 1.491027, 1, 0, 0, 1, 1,
2.058242, 0.8600768, 1.186107, 1, 0, 0, 1, 1,
2.083903, -0.2475962, 1.813314, 0, 0, 0, 1, 1,
2.093809, -0.7028631, 4.307942, 0, 0, 0, 1, 1,
2.143978, -0.2165103, 1.628376, 0, 0, 0, 1, 1,
2.163823, 1.825472, 1.068949, 0, 0, 0, 1, 1,
2.195534, -1.811552, 3.757534, 0, 0, 0, 1, 1,
2.214875, -1.725604, 4.830193, 0, 0, 0, 1, 1,
2.273328, -0.5510612, 2.124252, 0, 0, 0, 1, 1,
2.285981, 1.364872, 1.925956, 1, 1, 1, 1, 1,
2.370167, -0.8187181, 1.593249, 1, 1, 1, 1, 1,
2.413209, -0.2744117, -0.3455387, 1, 1, 1, 1, 1,
2.48967, -0.6823208, 0.4968545, 1, 1, 1, 1, 1,
2.649642, -1.344487, 2.788604, 1, 1, 1, 1, 1,
2.735377, 0.02759978, -0.3961713, 1, 1, 1, 1, 1,
3.251546, 0.5037742, 1.188179, 1, 1, 1, 1, 1
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
var radius = 9.689224;
var distance = 34.03299;
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
mvMatrix.translate( 0.3711247, 0.01718712, -0.001345396 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03299);
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
