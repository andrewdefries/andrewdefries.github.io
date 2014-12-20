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
-3.426269, 0.6375294, -2.899726, 1, 0, 0, 1,
-3.405964, -0.01493964, -2.075773, 1, 0.007843138, 0, 1,
-3.023262, 1.745675, 0.3080828, 1, 0.01176471, 0, 1,
-2.930155, -2.440963, -1.272906, 1, 0.01960784, 0, 1,
-2.914939, -0.9319767, -1.428747, 1, 0.02352941, 0, 1,
-2.777008, 0.1386394, -2.645349, 1, 0.03137255, 0, 1,
-2.683477, 0.4100661, 0.03397781, 1, 0.03529412, 0, 1,
-2.649556, 0.9956196, -2.124085, 1, 0.04313726, 0, 1,
-2.534792, 0.6557272, -2.064861, 1, 0.04705882, 0, 1,
-2.505196, 1.882323, -1.391278, 1, 0.05490196, 0, 1,
-2.502706, 0.6445951, -1.184647, 1, 0.05882353, 0, 1,
-2.484345, -0.776209, -1.338918, 1, 0.06666667, 0, 1,
-2.478477, 0.577074, -0.2028618, 1, 0.07058824, 0, 1,
-2.440356, -0.01857465, 0.674027, 1, 0.07843138, 0, 1,
-2.417915, -0.8697428, -1.84083, 1, 0.08235294, 0, 1,
-2.412508, -1.290612, -0.7299452, 1, 0.09019608, 0, 1,
-2.376606, 0.5564365, -1.28736, 1, 0.09411765, 0, 1,
-2.199646, -0.1987333, -1.491569, 1, 0.1019608, 0, 1,
-2.183141, 0.6603669, -0.9326324, 1, 0.1098039, 0, 1,
-2.158291, 3.126496, -1.307476, 1, 0.1137255, 0, 1,
-2.146151, 0.3066646, -1.016807, 1, 0.1215686, 0, 1,
-2.131087, -1.058561, -1.586707, 1, 0.1254902, 0, 1,
-2.123119, -0.3998847, -2.654592, 1, 0.1333333, 0, 1,
-2.063501, 0.08730829, -2.491535, 1, 0.1372549, 0, 1,
-2.059449, -1.56094, -2.374716, 1, 0.145098, 0, 1,
-2.053385, -0.3744298, -2.459586, 1, 0.1490196, 0, 1,
-2.046253, -0.02706726, -1.363101, 1, 0.1568628, 0, 1,
-2.026875, 0.3708, -1.172801, 1, 0.1607843, 0, 1,
-2.013968, 0.7605854, -1.016512, 1, 0.1686275, 0, 1,
-2.011404, -0.08801652, -1.100176, 1, 0.172549, 0, 1,
-2.01005, -1.26924, -0.2349321, 1, 0.1803922, 0, 1,
-2.008491, -0.5012956, -1.323355, 1, 0.1843137, 0, 1,
-1.954281, -0.772631, -2.256069, 1, 0.1921569, 0, 1,
-1.94797, -0.6146251, -3.759357, 1, 0.1960784, 0, 1,
-1.884269, 1.294227, -0.2347754, 1, 0.2039216, 0, 1,
-1.876991, -0.03212865, -4.121951, 1, 0.2117647, 0, 1,
-1.837051, -0.3327701, -1.622323, 1, 0.2156863, 0, 1,
-1.831593, -0.2359372, -2.130969, 1, 0.2235294, 0, 1,
-1.820585, 0.8614391, -1.63764, 1, 0.227451, 0, 1,
-1.819118, 0.2337107, -1.191725, 1, 0.2352941, 0, 1,
-1.802902, 0.2478386, -2.20843, 1, 0.2392157, 0, 1,
-1.793529, 0.7052965, 0.9268128, 1, 0.2470588, 0, 1,
-1.793238, -1.469456, -1.338084, 1, 0.2509804, 0, 1,
-1.785426, -0.1625622, -1.779849, 1, 0.2588235, 0, 1,
-1.783676, -1.389332, -3.10751, 1, 0.2627451, 0, 1,
-1.775385, -0.3648204, -0.2602789, 1, 0.2705882, 0, 1,
-1.766217, -0.6058077, -2.157916, 1, 0.2745098, 0, 1,
-1.759378, 0.406158, -0.6665245, 1, 0.282353, 0, 1,
-1.75254, -0.6764982, -1.927036, 1, 0.2862745, 0, 1,
-1.749651, -0.1561937, -2.148101, 1, 0.2941177, 0, 1,
-1.746573, 1.29493, -0.1671118, 1, 0.3019608, 0, 1,
-1.723738, -0.2238646, -0.9570037, 1, 0.3058824, 0, 1,
-1.721349, 1.308568, -1.671678, 1, 0.3137255, 0, 1,
-1.721121, 1.564803, -0.01415208, 1, 0.3176471, 0, 1,
-1.718391, 0.7476928, -2.60593, 1, 0.3254902, 0, 1,
-1.666849, 0.01380745, -0.6375968, 1, 0.3294118, 0, 1,
-1.658223, -0.1472465, -2.555615, 1, 0.3372549, 0, 1,
-1.652746, -0.8036567, -1.43867, 1, 0.3411765, 0, 1,
-1.649099, 0.3888373, -3.240142, 1, 0.3490196, 0, 1,
-1.647831, -1.124229, -1.45337, 1, 0.3529412, 0, 1,
-1.636384, 0.8317819, 0.04151715, 1, 0.3607843, 0, 1,
-1.636364, 0.8754261, -3.255192, 1, 0.3647059, 0, 1,
-1.591581, 0.1029498, -1.51945, 1, 0.372549, 0, 1,
-1.582613, -0.2347133, -0.8385251, 1, 0.3764706, 0, 1,
-1.567017, 0.5590892, -1.542814, 1, 0.3843137, 0, 1,
-1.555215, -0.5605358, -1.910467, 1, 0.3882353, 0, 1,
-1.550398, -1.568599, -1.783156, 1, 0.3960784, 0, 1,
-1.547122, -0.9934567, -0.1489069, 1, 0.4039216, 0, 1,
-1.540933, -0.8180479, -2.115707, 1, 0.4078431, 0, 1,
-1.533078, 0.5465286, -2.86099, 1, 0.4156863, 0, 1,
-1.532527, 0.3840337, -0.2045575, 1, 0.4196078, 0, 1,
-1.516395, 1.666391, -1.920218, 1, 0.427451, 0, 1,
-1.51249, -0.6288313, -1.504237, 1, 0.4313726, 0, 1,
-1.453364, 0.5946565, -1.356107, 1, 0.4392157, 0, 1,
-1.451743, 0.762071, -1.538369, 1, 0.4431373, 0, 1,
-1.440992, -0.1702293, -0.3790268, 1, 0.4509804, 0, 1,
-1.438355, 0.2943944, -2.863893, 1, 0.454902, 0, 1,
-1.434784, 0.3585984, -0.8541657, 1, 0.4627451, 0, 1,
-1.432722, -1.575881, -2.161157, 1, 0.4666667, 0, 1,
-1.42232, 1.586234, -0.8732417, 1, 0.4745098, 0, 1,
-1.420769, -0.4218133, -2.457531, 1, 0.4784314, 0, 1,
-1.417885, -1.225533, -2.252996, 1, 0.4862745, 0, 1,
-1.412661, 0.5469409, -0.166559, 1, 0.4901961, 0, 1,
-1.41106, 0.5278301, -4.09152, 1, 0.4980392, 0, 1,
-1.402458, -1.900361, -2.248738, 1, 0.5058824, 0, 1,
-1.40017, 0.3629415, -3.595376, 1, 0.509804, 0, 1,
-1.395643, 1.383487, -0.8959062, 1, 0.5176471, 0, 1,
-1.389989, -0.8083622, -1.228714, 1, 0.5215687, 0, 1,
-1.383975, -1.11849, -2.952412, 1, 0.5294118, 0, 1,
-1.380117, -0.9624771, -1.975846, 1, 0.5333334, 0, 1,
-1.373603, 0.2573215, -1.456985, 1, 0.5411765, 0, 1,
-1.364499, 1.19979, -1.50707, 1, 0.5450981, 0, 1,
-1.362276, -1.427425, -0.6234561, 1, 0.5529412, 0, 1,
-1.361718, 0.5052708, -1.851042, 1, 0.5568628, 0, 1,
-1.358287, 0.5847705, -0.6809534, 1, 0.5647059, 0, 1,
-1.353107, 0.021572, -1.092478, 1, 0.5686275, 0, 1,
-1.349477, 0.4973363, -0.4914887, 1, 0.5764706, 0, 1,
-1.347562, -1.288183, -4.518204, 1, 0.5803922, 0, 1,
-1.337072, -1.447819, -1.383011, 1, 0.5882353, 0, 1,
-1.333925, -0.5452775, -2.369473, 1, 0.5921569, 0, 1,
-1.333878, 0.4805026, -1.622736, 1, 0.6, 0, 1,
-1.333871, -0.9364457, -3.378685, 1, 0.6078432, 0, 1,
-1.328004, -0.5261717, -3.0653, 1, 0.6117647, 0, 1,
-1.326444, 0.3345362, 0.04201322, 1, 0.6196079, 0, 1,
-1.323006, -0.2032881, -0.2383767, 1, 0.6235294, 0, 1,
-1.322361, 0.08616536, -2.84677, 1, 0.6313726, 0, 1,
-1.318889, -0.005631689, -1.44469, 1, 0.6352941, 0, 1,
-1.304334, 0.5415857, -0.08603536, 1, 0.6431373, 0, 1,
-1.297485, 1.079286, -1.263833, 1, 0.6470588, 0, 1,
-1.292873, 0.2699927, 0.1552394, 1, 0.654902, 0, 1,
-1.270104, -0.8156536, -0.5621076, 1, 0.6588235, 0, 1,
-1.263063, 1.853904, -2.231549, 1, 0.6666667, 0, 1,
-1.256617, -1.012267, -2.89651, 1, 0.6705883, 0, 1,
-1.254333, -1.592591, -1.524634, 1, 0.6784314, 0, 1,
-1.252325, 0.3579428, -0.8693527, 1, 0.682353, 0, 1,
-1.249972, -0.1383894, -2.220639, 1, 0.6901961, 0, 1,
-1.239336, 0.4495017, -0.6165813, 1, 0.6941177, 0, 1,
-1.237637, -0.03506447, -3.085762, 1, 0.7019608, 0, 1,
-1.21881, -1.477383, -1.455532, 1, 0.7098039, 0, 1,
-1.218548, 2.22585, -0.8153061, 1, 0.7137255, 0, 1,
-1.214825, -2.283986, -3.388804, 1, 0.7215686, 0, 1,
-1.21109, 1.456437, 1.150182, 1, 0.7254902, 0, 1,
-1.208505, 0.09912231, -2.009099, 1, 0.7333333, 0, 1,
-1.208372, -0.3833036, -2.684223, 1, 0.7372549, 0, 1,
-1.203412, 0.9355164, -1.646644, 1, 0.7450981, 0, 1,
-1.193593, -0.07301052, -0.5098881, 1, 0.7490196, 0, 1,
-1.192789, 0.8005454, -2.457771, 1, 0.7568628, 0, 1,
-1.1885, -0.1255558, -3.029795, 1, 0.7607843, 0, 1,
-1.186251, -0.2197306, -0.7980402, 1, 0.7686275, 0, 1,
-1.185137, -0.8967895, -0.5015246, 1, 0.772549, 0, 1,
-1.185022, 0.6260357, -2.247267, 1, 0.7803922, 0, 1,
-1.18085, -2.614246, -1.713199, 1, 0.7843137, 0, 1,
-1.170009, -0.1957056, -0.5707951, 1, 0.7921569, 0, 1,
-1.164106, 0.4290661, -0.4148311, 1, 0.7960784, 0, 1,
-1.159359, 1.509194, -0.2321453, 1, 0.8039216, 0, 1,
-1.154425, -0.5772977, -2.01813, 1, 0.8117647, 0, 1,
-1.15011, 0.315049, -0.4562235, 1, 0.8156863, 0, 1,
-1.136745, -1.020281, -0.9083697, 1, 0.8235294, 0, 1,
-1.135464, 0.5872639, -0.7833984, 1, 0.827451, 0, 1,
-1.133917, -0.05168214, 0.5460156, 1, 0.8352941, 0, 1,
-1.133317, -0.07514338, -2.021444, 1, 0.8392157, 0, 1,
-1.128768, 1.679994, -1.337125, 1, 0.8470588, 0, 1,
-1.115671, -1.516589, -2.279891, 1, 0.8509804, 0, 1,
-1.114944, -1.53222, -2.3579, 1, 0.8588235, 0, 1,
-1.112183, 0.5830982, -0.06809419, 1, 0.8627451, 0, 1,
-1.091896, 1.149913, -0.4173816, 1, 0.8705882, 0, 1,
-1.086276, -2.089827, -3.002503, 1, 0.8745098, 0, 1,
-1.082022, -0.4690115, -1.994388, 1, 0.8823529, 0, 1,
-1.079717, 3.295978, -0.2838399, 1, 0.8862745, 0, 1,
-1.07475, 1.093533, -0.5586669, 1, 0.8941177, 0, 1,
-1.071765, 0.7797736, -2.135211, 1, 0.8980392, 0, 1,
-1.070996, -1.227443, -1.16472, 1, 0.9058824, 0, 1,
-1.070266, 0.8556347, -3.177804, 1, 0.9137255, 0, 1,
-1.064596, 2.057702, -1.735252, 1, 0.9176471, 0, 1,
-1.060465, 0.0007723787, -0.8755314, 1, 0.9254902, 0, 1,
-1.060433, 0.9108334, 0.5049664, 1, 0.9294118, 0, 1,
-1.058892, 0.3539731, -2.173229, 1, 0.9372549, 0, 1,
-1.055159, -0.903891, -1.615219, 1, 0.9411765, 0, 1,
-1.051827, 1.19537, -0.3638523, 1, 0.9490196, 0, 1,
-1.048933, -1.905004, -3.109721, 1, 0.9529412, 0, 1,
-1.041141, 0.4837907, -1.463055, 1, 0.9607843, 0, 1,
-1.034822, -1.513796, -2.513001, 1, 0.9647059, 0, 1,
-1.024792, -1.122913, -4.14975, 1, 0.972549, 0, 1,
-1.003112, 2.36497, -2.38329, 1, 0.9764706, 0, 1,
-0.9932551, 1.203291, -1.964379, 1, 0.9843137, 0, 1,
-0.9844155, 0.9373416, 0.2715142, 1, 0.9882353, 0, 1,
-0.9832193, -2.753855, -3.100246, 1, 0.9960784, 0, 1,
-0.981171, 0.4514561, -1.473714, 0.9960784, 1, 0, 1,
-0.9702723, 1.310355, -1.037283, 0.9921569, 1, 0, 1,
-0.9689725, 0.05825247, -2.63506, 0.9843137, 1, 0, 1,
-0.9685982, 0.4943379, 0.3050652, 0.9803922, 1, 0, 1,
-0.960059, -0.1401139, -1.333241, 0.972549, 1, 0, 1,
-0.958073, -1.001996, -2.442694, 0.9686275, 1, 0, 1,
-0.9523036, -0.4305142, -1.19858, 0.9607843, 1, 0, 1,
-0.946844, -2.374455, -2.685194, 0.9568627, 1, 0, 1,
-0.9458187, 0.8814892, -0.6150755, 0.9490196, 1, 0, 1,
-0.9414529, 0.3137708, -1.491567, 0.945098, 1, 0, 1,
-0.9296236, 1.949974, -0.1912219, 0.9372549, 1, 0, 1,
-0.9182581, -1.715828, -3.402118, 0.9333333, 1, 0, 1,
-0.9158136, -0.9878417, -1.566625, 0.9254902, 1, 0, 1,
-0.9131644, 0.9185756, 0.04713173, 0.9215686, 1, 0, 1,
-0.9098314, 0.03949708, -1.373436, 0.9137255, 1, 0, 1,
-0.9073528, -2.147332, -2.622905, 0.9098039, 1, 0, 1,
-0.9008493, -1.767665, -2.577477, 0.9019608, 1, 0, 1,
-0.9006178, 0.3431458, -1.099988, 0.8941177, 1, 0, 1,
-0.8982426, 0.04682864, -1.174634, 0.8901961, 1, 0, 1,
-0.8980116, -0.05350142, -1.587261, 0.8823529, 1, 0, 1,
-0.8943361, -0.108532, -2.479139, 0.8784314, 1, 0, 1,
-0.8898438, -1.708921, -2.276688, 0.8705882, 1, 0, 1,
-0.8856701, -0.05966594, -1.116883, 0.8666667, 1, 0, 1,
-0.8836668, -0.6082532, -0.7316119, 0.8588235, 1, 0, 1,
-0.8674639, 0.2670969, -0.581346, 0.854902, 1, 0, 1,
-0.8614196, -1.031536, -0.7751601, 0.8470588, 1, 0, 1,
-0.8611917, 0.6206425, -0.568986, 0.8431373, 1, 0, 1,
-0.859109, 0.4554627, -1.547962, 0.8352941, 1, 0, 1,
-0.8544974, 0.3133278, -1.837222, 0.8313726, 1, 0, 1,
-0.849798, -2.129455, -2.213071, 0.8235294, 1, 0, 1,
-0.8466538, 0.09436017, -2.562477, 0.8196079, 1, 0, 1,
-0.8451383, 0.9582758, -0.5035279, 0.8117647, 1, 0, 1,
-0.8396482, -0.4482417, -3.081778, 0.8078431, 1, 0, 1,
-0.8377079, 0.23598, -1.358476, 0.8, 1, 0, 1,
-0.8374801, -0.5889081, -2.6535, 0.7921569, 1, 0, 1,
-0.8329026, 0.9068829, -1.057086, 0.7882353, 1, 0, 1,
-0.8294501, 0.5953318, -1.282942, 0.7803922, 1, 0, 1,
-0.8289098, 1.047583, -0.8107918, 0.7764706, 1, 0, 1,
-0.8219846, -0.3182192, -1.55446, 0.7686275, 1, 0, 1,
-0.8212249, -0.06304006, -3.334571, 0.7647059, 1, 0, 1,
-0.8199045, -1.600127, -3.441539, 0.7568628, 1, 0, 1,
-0.8167662, 1.606778, -1.034979, 0.7529412, 1, 0, 1,
-0.8141112, -0.09220228, -1.359196, 0.7450981, 1, 0, 1,
-0.8126054, 1.089356, 1.312732, 0.7411765, 1, 0, 1,
-0.8112701, 0.6743984, 0.7985645, 0.7333333, 1, 0, 1,
-0.8100193, 0.8049974, -0.4627377, 0.7294118, 1, 0, 1,
-0.7997347, 0.3653792, -1.321339, 0.7215686, 1, 0, 1,
-0.7974653, 0.06421503, -1.364949, 0.7176471, 1, 0, 1,
-0.7941348, 0.8968405, -2.404108, 0.7098039, 1, 0, 1,
-0.7881421, 2.082468, 0.7289928, 0.7058824, 1, 0, 1,
-0.780636, 0.1278234, -1.362992, 0.6980392, 1, 0, 1,
-0.7761241, 0.9238206, -1.998804, 0.6901961, 1, 0, 1,
-0.774524, -0.1136425, -2.339631, 0.6862745, 1, 0, 1,
-0.7744595, 0.3185453, -2.242403, 0.6784314, 1, 0, 1,
-0.7740123, -0.7231269, -3.330878, 0.6745098, 1, 0, 1,
-0.7681417, -0.8201112, -5.169416, 0.6666667, 1, 0, 1,
-0.7653001, -0.9630449, -1.838446, 0.6627451, 1, 0, 1,
-0.7618875, -1.430013, -3.987526, 0.654902, 1, 0, 1,
-0.7617909, 0.07012203, -1.354754, 0.6509804, 1, 0, 1,
-0.7606593, 1.610421, -1.934788, 0.6431373, 1, 0, 1,
-0.756067, 0.04605028, -0.7544774, 0.6392157, 1, 0, 1,
-0.7526823, 1.301888, -0.005972629, 0.6313726, 1, 0, 1,
-0.7476208, -0.9726983, -2.265605, 0.627451, 1, 0, 1,
-0.7475076, -1.754444, -3.442479, 0.6196079, 1, 0, 1,
-0.7412398, 0.4489579, -0.6163224, 0.6156863, 1, 0, 1,
-0.7376536, -0.3268915, -2.212169, 0.6078432, 1, 0, 1,
-0.7376295, -0.06736534, -2.051361, 0.6039216, 1, 0, 1,
-0.7357979, 0.2344431, -1.214514, 0.5960785, 1, 0, 1,
-0.7344938, -0.4258457, -3.621119, 0.5882353, 1, 0, 1,
-0.7228908, -0.8748499, -2.658205, 0.5843138, 1, 0, 1,
-0.7223255, -0.3247961, -2.628947, 0.5764706, 1, 0, 1,
-0.7222121, -0.6259962, -2.619599, 0.572549, 1, 0, 1,
-0.7182806, -0.1188304, -2.192027, 0.5647059, 1, 0, 1,
-0.7140145, -1.290118, -2.377146, 0.5607843, 1, 0, 1,
-0.7064034, 0.0307725, -1.939358, 0.5529412, 1, 0, 1,
-0.7018372, 0.2429322, -0.9489964, 0.5490196, 1, 0, 1,
-0.7017511, 0.6880708, -0.4123414, 0.5411765, 1, 0, 1,
-0.7016374, -0.04308167, -1.005645, 0.5372549, 1, 0, 1,
-0.6924948, 0.4003336, -0.8122342, 0.5294118, 1, 0, 1,
-0.6905156, 1.153003, 0.4070857, 0.5254902, 1, 0, 1,
-0.6865429, 0.1704985, -1.252773, 0.5176471, 1, 0, 1,
-0.6837659, 0.4282966, -1.559298, 0.5137255, 1, 0, 1,
-0.678334, -0.04468009, -0.2070999, 0.5058824, 1, 0, 1,
-0.6781086, -0.1349606, 0.1120967, 0.5019608, 1, 0, 1,
-0.6726946, -0.2539001, -0.6312623, 0.4941176, 1, 0, 1,
-0.669633, -0.5607373, -3.836582, 0.4862745, 1, 0, 1,
-0.6676697, -0.2551509, -2.322646, 0.4823529, 1, 0, 1,
-0.6674536, -0.09642863, 0.2995078, 0.4745098, 1, 0, 1,
-0.6639416, 0.07739121, -1.481164, 0.4705882, 1, 0, 1,
-0.6632256, 0.4320516, -0.7727987, 0.4627451, 1, 0, 1,
-0.6586881, -1.827628, -3.23125, 0.4588235, 1, 0, 1,
-0.6577694, -0.9265215, -3.592557, 0.4509804, 1, 0, 1,
-0.6484121, -0.3872996, -1.215665, 0.4470588, 1, 0, 1,
-0.6359527, -1.151094, -2.647896, 0.4392157, 1, 0, 1,
-0.63469, -0.6742152, -2.122758, 0.4352941, 1, 0, 1,
-0.6344326, 0.4964058, -2.725804, 0.427451, 1, 0, 1,
-0.6282114, -0.4489893, -2.957209, 0.4235294, 1, 0, 1,
-0.6281212, 2.143559, -2.000952, 0.4156863, 1, 0, 1,
-0.6263621, -0.3162225, -1.594533, 0.4117647, 1, 0, 1,
-0.6260796, 1.56345, 0.5438281, 0.4039216, 1, 0, 1,
-0.6245952, 0.3262419, -1.601294, 0.3960784, 1, 0, 1,
-0.6235638, 0.9976498, -1.366035, 0.3921569, 1, 0, 1,
-0.6226446, -0.1275525, -1.10359, 0.3843137, 1, 0, 1,
-0.6221802, -0.2369375, -1.487455, 0.3803922, 1, 0, 1,
-0.6219363, 0.4108886, -2.43097, 0.372549, 1, 0, 1,
-0.6214099, -0.8143451, -2.764361, 0.3686275, 1, 0, 1,
-0.6195985, 0.1144595, -1.259712, 0.3607843, 1, 0, 1,
-0.6094703, -0.2964814, -1.339641, 0.3568628, 1, 0, 1,
-0.6084701, 1.356206, 1.550287, 0.3490196, 1, 0, 1,
-0.6026934, -0.440871, -2.530019, 0.345098, 1, 0, 1,
-0.600343, -0.3468724, -1.73316, 0.3372549, 1, 0, 1,
-0.5983056, 0.2226089, -1.380135, 0.3333333, 1, 0, 1,
-0.5955258, 0.3190185, -1.043616, 0.3254902, 1, 0, 1,
-0.5936806, -1.587294, -3.749353, 0.3215686, 1, 0, 1,
-0.5789765, -0.3435111, -1.921007, 0.3137255, 1, 0, 1,
-0.5787875, 0.1314471, -1.789069, 0.3098039, 1, 0, 1,
-0.5767115, 0.5887631, -1.562592, 0.3019608, 1, 0, 1,
-0.5700685, 1.606808, -0.09793312, 0.2941177, 1, 0, 1,
-0.5662336, 1.431843, -0.331349, 0.2901961, 1, 0, 1,
-0.5658364, -0.3482146, -1.828704, 0.282353, 1, 0, 1,
-0.5624716, 1.536462, 0.5088608, 0.2784314, 1, 0, 1,
-0.5611221, -0.06188581, -1.209798, 0.2705882, 1, 0, 1,
-0.5608653, -0.6502868, -3.744746, 0.2666667, 1, 0, 1,
-0.5579726, 1.580057, -0.4203093, 0.2588235, 1, 0, 1,
-0.5569364, -1.782668, -3.867599, 0.254902, 1, 0, 1,
-0.5537473, 0.05895892, -1.969495, 0.2470588, 1, 0, 1,
-0.5504302, 0.9409899, -0.2186844, 0.2431373, 1, 0, 1,
-0.5361696, 0.3688574, -0.5148931, 0.2352941, 1, 0, 1,
-0.5320833, 2.129986, -2.408757, 0.2313726, 1, 0, 1,
-0.5249165, 1.035005, -0.9941064, 0.2235294, 1, 0, 1,
-0.5203139, 0.6227983, -0.08618256, 0.2196078, 1, 0, 1,
-0.519551, 0.603398, -1.787243, 0.2117647, 1, 0, 1,
-0.5191548, -0.87583, -2.880029, 0.2078431, 1, 0, 1,
-0.5180021, 0.2681046, -2.843204, 0.2, 1, 0, 1,
-0.515195, 0.8396661, -0.5457779, 0.1921569, 1, 0, 1,
-0.5150909, -1.202185, -2.420221, 0.1882353, 1, 0, 1,
-0.5148969, 1.903241, 0.8598573, 0.1803922, 1, 0, 1,
-0.5131523, -0.9745693, -3.047591, 0.1764706, 1, 0, 1,
-0.5099517, 0.4586342, -1.581203, 0.1686275, 1, 0, 1,
-0.5082496, -0.5353997, -2.445479, 0.1647059, 1, 0, 1,
-0.5081379, 0.3058567, -2.113985, 0.1568628, 1, 0, 1,
-0.5058382, 1.197163, 0.2817795, 0.1529412, 1, 0, 1,
-0.5037996, 0.9477845, -0.7796574, 0.145098, 1, 0, 1,
-0.5008285, -0.5605881, -1.545173, 0.1411765, 1, 0, 1,
-0.4986959, 0.5340586, 0.9319316, 0.1333333, 1, 0, 1,
-0.4976497, 1.641174, 0.006054159, 0.1294118, 1, 0, 1,
-0.4935703, 2.257329, -2.746727, 0.1215686, 1, 0, 1,
-0.4932746, -2.410757, -4.404296, 0.1176471, 1, 0, 1,
-0.4930504, -0.9555831, -2.909169, 0.1098039, 1, 0, 1,
-0.4912799, 0.7507922, -1.699525, 0.1058824, 1, 0, 1,
-0.4884233, -1.962696, -1.791976, 0.09803922, 1, 0, 1,
-0.486856, 0.8060938, -1.46107, 0.09019608, 1, 0, 1,
-0.4852577, -0.4039589, -3.462738, 0.08627451, 1, 0, 1,
-0.4825435, -0.9444826, -1.287897, 0.07843138, 1, 0, 1,
-0.4815833, -0.5917569, -0.1951934, 0.07450981, 1, 0, 1,
-0.4764615, 0.1736248, -2.219407, 0.06666667, 1, 0, 1,
-0.4672218, -1.050626, -1.697116, 0.0627451, 1, 0, 1,
-0.4628897, 0.2096049, -0.5750053, 0.05490196, 1, 0, 1,
-0.4595484, 0.1622017, -1.214322, 0.05098039, 1, 0, 1,
-0.4586389, 0.1905526, -0.08165665, 0.04313726, 1, 0, 1,
-0.4565945, -0.06666587, -0.4867561, 0.03921569, 1, 0, 1,
-0.4563045, 1.041213, -0.7274124, 0.03137255, 1, 0, 1,
-0.4561245, -0.6922573, -0.8877944, 0.02745098, 1, 0, 1,
-0.4555019, 0.2467469, -0.7160808, 0.01960784, 1, 0, 1,
-0.4491693, 0.4736207, -0.2308388, 0.01568628, 1, 0, 1,
-0.4394491, 0.6786731, 0.3023772, 0.007843138, 1, 0, 1,
-0.4373386, -0.4554713, -1.520183, 0.003921569, 1, 0, 1,
-0.436323, -0.07558631, -3.363288, 0, 1, 0.003921569, 1,
-0.4359478, 0.05056981, -0.8939583, 0, 1, 0.01176471, 1,
-0.4209455, 0.8024381, 0.4420656, 0, 1, 0.01568628, 1,
-0.4168726, 0.03071698, -0.5088173, 0, 1, 0.02352941, 1,
-0.4164325, -1.444085, -2.973098, 0, 1, 0.02745098, 1,
-0.412883, -0.2643917, -2.714527, 0, 1, 0.03529412, 1,
-0.4113989, -0.6501761, -2.080603, 0, 1, 0.03921569, 1,
-0.4050739, 0.231955, -1.517333, 0, 1, 0.04705882, 1,
-0.4050129, 1.021788, 0.1018919, 0, 1, 0.05098039, 1,
-0.3933188, 0.8505896, -1.810859, 0, 1, 0.05882353, 1,
-0.3932235, -1.39477, -3.301498, 0, 1, 0.0627451, 1,
-0.392672, 1.322879, -0.5572127, 0, 1, 0.07058824, 1,
-0.3895797, -0.6446092, -3.907192, 0, 1, 0.07450981, 1,
-0.3854512, -0.2263027, -1.527481, 0, 1, 0.08235294, 1,
-0.3836949, -1.343198, -1.236609, 0, 1, 0.08627451, 1,
-0.3834627, -0.4713853, -3.727736, 0, 1, 0.09411765, 1,
-0.3757606, -1.856133, -3.399582, 0, 1, 0.1019608, 1,
-0.3751668, -0.1276462, -1.752717, 0, 1, 0.1058824, 1,
-0.37488, 0.4237941, -3.387766, 0, 1, 0.1137255, 1,
-0.3727234, 0.1990438, -3.215001, 0, 1, 0.1176471, 1,
-0.3723198, -1.915372, -2.331062, 0, 1, 0.1254902, 1,
-0.3723092, 0.869123, -0.6503202, 0, 1, 0.1294118, 1,
-0.372035, 0.7043927, -0.4125078, 0, 1, 0.1372549, 1,
-0.3718463, 1.08773, -2.119369, 0, 1, 0.1411765, 1,
-0.3709234, 1.501161, 1.3579, 0, 1, 0.1490196, 1,
-0.3688563, -0.6213325, -3.10901, 0, 1, 0.1529412, 1,
-0.3660118, -1.390795, -3.275895, 0, 1, 0.1607843, 1,
-0.364935, -0.2442833, -3.228858, 0, 1, 0.1647059, 1,
-0.3649194, -0.262969, -1.717232, 0, 1, 0.172549, 1,
-0.363927, -0.2882241, -2.688085, 0, 1, 0.1764706, 1,
-0.3626898, 0.3506229, -1.216183, 0, 1, 0.1843137, 1,
-0.3626091, -2.531338, -4.322069, 0, 1, 0.1882353, 1,
-0.3559684, 0.6379651, -1.361025, 0, 1, 0.1960784, 1,
-0.3508866, -0.1699889, -5.193996, 0, 1, 0.2039216, 1,
-0.3452667, 0.01539718, -0.6829002, 0, 1, 0.2078431, 1,
-0.3432417, 0.1708227, -1.140925, 0, 1, 0.2156863, 1,
-0.3427109, 2.076661, -0.5132518, 0, 1, 0.2196078, 1,
-0.3424365, 0.2611178, -0.1606896, 0, 1, 0.227451, 1,
-0.3414678, -0.2108773, -2.406791, 0, 1, 0.2313726, 1,
-0.3405254, -0.8630522, -2.346079, 0, 1, 0.2392157, 1,
-0.3399616, 1.208782, 2.212282, 0, 1, 0.2431373, 1,
-0.3394197, -0.6804922, -3.648131, 0, 1, 0.2509804, 1,
-0.3374301, -0.7551174, -3.017365, 0, 1, 0.254902, 1,
-0.3266324, 0.2029386, -0.09666003, 0, 1, 0.2627451, 1,
-0.3258475, -0.3885238, -1.487741, 0, 1, 0.2666667, 1,
-0.3218528, 0.7035189, -1.393458, 0, 1, 0.2745098, 1,
-0.3185404, 0.8653548, -0.02674517, 0, 1, 0.2784314, 1,
-0.3178523, -0.4474589, -1.926121, 0, 1, 0.2862745, 1,
-0.3165013, 0.7856665, 0.1165056, 0, 1, 0.2901961, 1,
-0.3109472, -0.04830924, -0.6238761, 0, 1, 0.2980392, 1,
-0.3102706, 0.7737997, 0.4199369, 0, 1, 0.3058824, 1,
-0.3079028, -0.563724, -1.876421, 0, 1, 0.3098039, 1,
-0.3068606, -0.4455484, -1.76177, 0, 1, 0.3176471, 1,
-0.3055234, -0.4878854, -2.083285, 0, 1, 0.3215686, 1,
-0.3034147, 0.5938185, -1.579545, 0, 1, 0.3294118, 1,
-0.2968226, 0.3294357, -1.76545, 0, 1, 0.3333333, 1,
-0.284507, 0.07948145, -0.3093158, 0, 1, 0.3411765, 1,
-0.2838162, -0.8156506, -4.201225, 0, 1, 0.345098, 1,
-0.2835251, -1.525272, -1.412626, 0, 1, 0.3529412, 1,
-0.2816962, 0.5931419, -0.5707374, 0, 1, 0.3568628, 1,
-0.2815071, 0.09207328, -1.441071, 0, 1, 0.3647059, 1,
-0.2748957, -0.1330399, -3.821747, 0, 1, 0.3686275, 1,
-0.2725287, -0.6875283, -3.438549, 0, 1, 0.3764706, 1,
-0.2721386, 1.094359, -0.6298308, 0, 1, 0.3803922, 1,
-0.2704484, -0.2083315, -1.67812, 0, 1, 0.3882353, 1,
-0.2699363, 0.2382522, 0.2976052, 0, 1, 0.3921569, 1,
-0.2687699, 2.057823, -0.4913612, 0, 1, 0.4, 1,
-0.2684923, -0.7492191, -3.211509, 0, 1, 0.4078431, 1,
-0.2607172, 0.4911262, 0.3328611, 0, 1, 0.4117647, 1,
-0.2606632, 2.017657, -1.413331, 0, 1, 0.4196078, 1,
-0.2575694, -0.4155142, -3.021384, 0, 1, 0.4235294, 1,
-0.2544283, -0.858256, -3.401157, 0, 1, 0.4313726, 1,
-0.2518987, -1.195746, -1.508268, 0, 1, 0.4352941, 1,
-0.248522, 1.208917, -1.067847, 0, 1, 0.4431373, 1,
-0.2466723, -0.04276245, 0.3740737, 0, 1, 0.4470588, 1,
-0.2450385, 1.548026, 0.2786823, 0, 1, 0.454902, 1,
-0.2440653, 0.2561586, -1.786115, 0, 1, 0.4588235, 1,
-0.242406, 0.7564796, -0.7459443, 0, 1, 0.4666667, 1,
-0.2390803, 0.3323081, 1.050876, 0, 1, 0.4705882, 1,
-0.2389447, -0.7585418, -3.459484, 0, 1, 0.4784314, 1,
-0.2368177, 1.224585, 0.3679893, 0, 1, 0.4823529, 1,
-0.23526, 0.179901, -2.493129, 0, 1, 0.4901961, 1,
-0.2342399, 0.2938931, 0.1790634, 0, 1, 0.4941176, 1,
-0.2312481, -1.697549, -2.963668, 0, 1, 0.5019608, 1,
-0.2296495, -1.057083, -3.150522, 0, 1, 0.509804, 1,
-0.2292708, 1.269647, 0.1869701, 0, 1, 0.5137255, 1,
-0.2277787, 0.356174, -0.4965849, 0, 1, 0.5215687, 1,
-0.2187676, -0.9102933, -1.547005, 0, 1, 0.5254902, 1,
-0.2145733, 0.4858291, 0.4573497, 0, 1, 0.5333334, 1,
-0.2144334, -2.234125, -3.455753, 0, 1, 0.5372549, 1,
-0.2091031, 0.5101022, 0.906181, 0, 1, 0.5450981, 1,
-0.2088076, 1.169286, -1.324092, 0, 1, 0.5490196, 1,
-0.203697, 0.4870178, 0.2654113, 0, 1, 0.5568628, 1,
-0.2019302, 0.6327294, -0.8396339, 0, 1, 0.5607843, 1,
-0.1923794, 0.794087, -0.2410715, 0, 1, 0.5686275, 1,
-0.191902, 0.995267, 1.053428, 0, 1, 0.572549, 1,
-0.1899265, 0.9318939, 1.095836, 0, 1, 0.5803922, 1,
-0.1838254, 0.009662899, -3.180636, 0, 1, 0.5843138, 1,
-0.1800544, 1.763011, 0.1221771, 0, 1, 0.5921569, 1,
-0.1799754, -0.7375854, -0.9424952, 0, 1, 0.5960785, 1,
-0.1788393, 0.565312, -0.122642, 0, 1, 0.6039216, 1,
-0.1730703, 0.01636644, -2.604221, 0, 1, 0.6117647, 1,
-0.1688189, -0.3947573, -3.631268, 0, 1, 0.6156863, 1,
-0.1647686, -0.02467915, -3.001056, 0, 1, 0.6235294, 1,
-0.1634165, -0.9049675, -2.242598, 0, 1, 0.627451, 1,
-0.1625578, 1.190007, 2.00036, 0, 1, 0.6352941, 1,
-0.1622905, 0.09703463, -1.309766, 0, 1, 0.6392157, 1,
-0.1604976, -0.1239264, -2.608656, 0, 1, 0.6470588, 1,
-0.1595671, -0.4101565, -2.534604, 0, 1, 0.6509804, 1,
-0.1534063, -0.2177232, -2.170858, 0, 1, 0.6588235, 1,
-0.1508418, 0.2802202, -0.8599995, 0, 1, 0.6627451, 1,
-0.1474061, -0.4218764, -1.791058, 0, 1, 0.6705883, 1,
-0.1436005, 1.178163, -0.2674806, 0, 1, 0.6745098, 1,
-0.1366061, -0.8214406, -4.00417, 0, 1, 0.682353, 1,
-0.1277022, 1.292333, 0.2167208, 0, 1, 0.6862745, 1,
-0.1232854, 0.07965943, 0.3506751, 0, 1, 0.6941177, 1,
-0.1170664, 1.93005, -0.2980253, 0, 1, 0.7019608, 1,
-0.1150539, 0.4126546, -1.823385, 0, 1, 0.7058824, 1,
-0.114757, 0.8966984, 0.7683581, 0, 1, 0.7137255, 1,
-0.1132701, -0.8356211, -2.72033, 0, 1, 0.7176471, 1,
-0.1115999, -1.017595, -3.307466, 0, 1, 0.7254902, 1,
-0.1100922, 1.161172, -0.2221668, 0, 1, 0.7294118, 1,
-0.1035287, 1.445111, 0.07210965, 0, 1, 0.7372549, 1,
-0.1020159, -0.9873341, -1.64488, 0, 1, 0.7411765, 1,
-0.1016721, -3.216343, -3.014031, 0, 1, 0.7490196, 1,
-0.1016413, -1.128484, -6.140674, 0, 1, 0.7529412, 1,
-0.1016109, 0.5693521, 0.9244788, 0, 1, 0.7607843, 1,
-0.1011471, 0.6352298, -1.682617, 0, 1, 0.7647059, 1,
-0.1001776, -0.8241329, -2.462061, 0, 1, 0.772549, 1,
-0.09206805, 0.1928257, -0.2259255, 0, 1, 0.7764706, 1,
-0.09156191, -1.311371, -3.389946, 0, 1, 0.7843137, 1,
-0.0829629, 1.801471, 0.3643343, 0, 1, 0.7882353, 1,
-0.07985473, 0.5402452, 0.2719792, 0, 1, 0.7960784, 1,
-0.07946785, -0.7675066, -1.046605, 0, 1, 0.8039216, 1,
-0.07931134, -1.19823, -3.331983, 0, 1, 0.8078431, 1,
-0.0781548, -0.275507, -4.324079, 0, 1, 0.8156863, 1,
-0.07422203, 2.46812, -0.9680658, 0, 1, 0.8196079, 1,
-0.07135288, -0.279699, -2.257147, 0, 1, 0.827451, 1,
-0.07009121, -0.1658504, -3.758235, 0, 1, 0.8313726, 1,
-0.06703019, -1.322188, -4.881677, 0, 1, 0.8392157, 1,
-0.06571545, 0.6357243, 1.374086, 0, 1, 0.8431373, 1,
-0.06525099, -1.005286, -2.790323, 0, 1, 0.8509804, 1,
-0.05453474, 0.2880609, -1.405408, 0, 1, 0.854902, 1,
-0.05214555, -0.1960634, -3.214798, 0, 1, 0.8627451, 1,
-0.05120064, -0.1227143, -3.1443, 0, 1, 0.8666667, 1,
-0.05054191, -0.6859636, -1.761384, 0, 1, 0.8745098, 1,
-0.0504129, 0.2352361, -2.12926, 0, 1, 0.8784314, 1,
-0.05037668, -0.8781419, -2.513105, 0, 1, 0.8862745, 1,
-0.04686353, 0.1086092, -1.8582, 0, 1, 0.8901961, 1,
-0.04162825, 0.2164472, -0.7370522, 0, 1, 0.8980392, 1,
-0.03617351, 2.910212, -0.3998819, 0, 1, 0.9058824, 1,
-0.02799395, 0.7995842, -0.06164358, 0, 1, 0.9098039, 1,
-0.02103473, -1.531436, -3.122286, 0, 1, 0.9176471, 1,
-0.019301, -0.1548952, -3.596619, 0, 1, 0.9215686, 1,
-0.01638293, -0.8192016, -2.993813, 0, 1, 0.9294118, 1,
-0.01433882, -1.295482, -3.455907, 0, 1, 0.9333333, 1,
-0.01393266, 0.6157611, -0.4253189, 0, 1, 0.9411765, 1,
-0.0121972, 0.7891148, 2.007279, 0, 1, 0.945098, 1,
-0.01144577, -1.139711, -1.83407, 0, 1, 0.9529412, 1,
-0.009697859, 0.5008627, -0.8729489, 0, 1, 0.9568627, 1,
-0.007774221, 0.6257329, -0.3630281, 0, 1, 0.9647059, 1,
-0.006541088, -0.3334615, -2.420912, 0, 1, 0.9686275, 1,
-0.003337895, -0.4029311, -2.789203, 0, 1, 0.9764706, 1,
-0.002200487, -0.3977366, -3.946819, 0, 1, 0.9803922, 1,
0.000761649, -0.5367333, 2.300326, 0, 1, 0.9882353, 1,
0.003009723, -1.46166, 4.524001, 0, 1, 0.9921569, 1,
0.006157844, -1.392499, 2.643779, 0, 1, 1, 1,
0.01111759, 0.4791805, -1.292011, 0, 0.9921569, 1, 1,
0.01378732, 0.008347639, 0.1104354, 0, 0.9882353, 1, 1,
0.01464261, 1.088506, -1.006353, 0, 0.9803922, 1, 1,
0.01635397, 1.127281, 1.191815, 0, 0.9764706, 1, 1,
0.01765264, 0.2599821, 1.13037, 0, 0.9686275, 1, 1,
0.02534377, -0.811381, 2.446506, 0, 0.9647059, 1, 1,
0.02791756, -0.5922711, 2.5202, 0, 0.9568627, 1, 1,
0.02906045, 1.604001, 1.025624, 0, 0.9529412, 1, 1,
0.03173088, -0.5461608, 4.072912, 0, 0.945098, 1, 1,
0.03271898, -0.5793889, 4.267826, 0, 0.9411765, 1, 1,
0.03702597, -0.07121215, 2.694861, 0, 0.9333333, 1, 1,
0.03836999, -0.6541622, 1.635947, 0, 0.9294118, 1, 1,
0.04106312, -1.567748, 3.822118, 0, 0.9215686, 1, 1,
0.04771031, 0.07412688, 0.5296155, 0, 0.9176471, 1, 1,
0.05872931, 1.970847, 0.3837368, 0, 0.9098039, 1, 1,
0.06507806, 1.023416, 0.183777, 0, 0.9058824, 1, 1,
0.06657001, 2.563378, 1.257906, 0, 0.8980392, 1, 1,
0.06684379, 1.641027, -1.512057, 0, 0.8901961, 1, 1,
0.06702661, -0.1588868, 1.825392, 0, 0.8862745, 1, 1,
0.06850667, 0.5989473, 0.1994841, 0, 0.8784314, 1, 1,
0.06893134, -0.1063953, 3.948116, 0, 0.8745098, 1, 1,
0.07090969, -1.04407, 3.398738, 0, 0.8666667, 1, 1,
0.07100478, 1.636401, 1.856075, 0, 0.8627451, 1, 1,
0.0799289, 0.1744068, -0.7564079, 0, 0.854902, 1, 1,
0.08492269, -1.886796, 3.5487, 0, 0.8509804, 1, 1,
0.08609887, -0.2573828, 2.020374, 0, 0.8431373, 1, 1,
0.09350833, -0.7753619, 3.58547, 0, 0.8392157, 1, 1,
0.09807428, 0.39576, 0.1013952, 0, 0.8313726, 1, 1,
0.1005733, -0.9951206, 2.965054, 0, 0.827451, 1, 1,
0.1021378, 0.660446, -0.7388706, 0, 0.8196079, 1, 1,
0.1027287, 0.2253521, 0.243876, 0, 0.8156863, 1, 1,
0.1040579, -0.358449, 3.122658, 0, 0.8078431, 1, 1,
0.1075169, 1.377436, -0.3930408, 0, 0.8039216, 1, 1,
0.1130738, 0.2368188, -1.043397, 0, 0.7960784, 1, 1,
0.1144186, 1.5505, 0.9233871, 0, 0.7882353, 1, 1,
0.1211195, 0.5205694, 1.972819, 0, 0.7843137, 1, 1,
0.1216462, -1.577407, 3.480692, 0, 0.7764706, 1, 1,
0.1226418, -0.4894808, 1.703497, 0, 0.772549, 1, 1,
0.1300988, -1.88716, 2.692384, 0, 0.7647059, 1, 1,
0.131133, -0.07485094, 0.5734761, 0, 0.7607843, 1, 1,
0.1341423, -0.3913192, 3.112318, 0, 0.7529412, 1, 1,
0.1390768, -0.124562, 3.873023, 0, 0.7490196, 1, 1,
0.1531157, 1.752354, 0.01359575, 0, 0.7411765, 1, 1,
0.1545519, 0.3248383, 1.677484, 0, 0.7372549, 1, 1,
0.1573157, -1.63947, 1.992256, 0, 0.7294118, 1, 1,
0.160537, 0.3264232, 0.6883126, 0, 0.7254902, 1, 1,
0.1678279, 0.2425387, 0.6331118, 0, 0.7176471, 1, 1,
0.1689016, 0.7676087, 2.986505, 0, 0.7137255, 1, 1,
0.1706572, -1.796069, 2.569569, 0, 0.7058824, 1, 1,
0.1714874, 0.6993172, 0.9895623, 0, 0.6980392, 1, 1,
0.1737554, -0.5988134, 3.512127, 0, 0.6941177, 1, 1,
0.1757555, -0.2486613, 2.365198, 0, 0.6862745, 1, 1,
0.1777712, 1.444368, -0.6489944, 0, 0.682353, 1, 1,
0.181065, 0.3915377, -0.2188506, 0, 0.6745098, 1, 1,
0.1818454, 0.9152719, -1.324196, 0, 0.6705883, 1, 1,
0.1830896, 0.935433, 1.60506, 0, 0.6627451, 1, 1,
0.1842429, -0.4165765, 3.024044, 0, 0.6588235, 1, 1,
0.1917686, -0.4003155, 3.218707, 0, 0.6509804, 1, 1,
0.1934117, -0.252209, 1.951289, 0, 0.6470588, 1, 1,
0.195045, 0.2419841, 0.3414738, 0, 0.6392157, 1, 1,
0.1962759, 0.3996582, 0.08973106, 0, 0.6352941, 1, 1,
0.1967582, 0.2941785, 1.236666, 0, 0.627451, 1, 1,
0.1998372, -0.7908576, 2.879693, 0, 0.6235294, 1, 1,
0.2027539, 1.379837, 0.9250674, 0, 0.6156863, 1, 1,
0.2032977, 2.049942, 0.9526517, 0, 0.6117647, 1, 1,
0.2043189, 1.676716, -0.4623821, 0, 0.6039216, 1, 1,
0.206164, 0.3861519, 0.07767026, 0, 0.5960785, 1, 1,
0.2067087, -1.048654, 2.792491, 0, 0.5921569, 1, 1,
0.2080306, -0.4414, 2.631319, 0, 0.5843138, 1, 1,
0.2088357, -0.9341504, 2.253175, 0, 0.5803922, 1, 1,
0.210197, -1.454221, 3.518442, 0, 0.572549, 1, 1,
0.2132157, 0.3275859, 1.651581, 0, 0.5686275, 1, 1,
0.2150015, -0.8387623, 4.249738, 0, 0.5607843, 1, 1,
0.2188678, 0.2480139, 0.2937693, 0, 0.5568628, 1, 1,
0.2222045, -1.12321, 3.477101, 0, 0.5490196, 1, 1,
0.2225086, 0.04205953, 1.909167, 0, 0.5450981, 1, 1,
0.223904, 1.511191, -1.002023, 0, 0.5372549, 1, 1,
0.2278835, -0.5581523, 3.577534, 0, 0.5333334, 1, 1,
0.2281121, 0.01624434, 2.689605, 0, 0.5254902, 1, 1,
0.2296046, 0.4428829, 0.8800548, 0, 0.5215687, 1, 1,
0.234264, -0.8131199, 1.487919, 0, 0.5137255, 1, 1,
0.2343479, -1.507835, 4.262509, 0, 0.509804, 1, 1,
0.2346688, -1.31856, 2.823087, 0, 0.5019608, 1, 1,
0.2354233, -0.696258, 2.892473, 0, 0.4941176, 1, 1,
0.2373439, 0.3132892, 0.2558708, 0, 0.4901961, 1, 1,
0.2375366, 0.406632, -0.7200976, 0, 0.4823529, 1, 1,
0.2409962, -0.080334, 2.486289, 0, 0.4784314, 1, 1,
0.2423404, 0.32132, 1.31858, 0, 0.4705882, 1, 1,
0.2424981, 0.5080071, -1.74288, 0, 0.4666667, 1, 1,
0.2428183, 2.336684, 1.595921, 0, 0.4588235, 1, 1,
0.2477438, 1.552561, 2.26767, 0, 0.454902, 1, 1,
0.2482023, 0.6675381, -0.1054584, 0, 0.4470588, 1, 1,
0.249393, 0.6047745, 0.5070828, 0, 0.4431373, 1, 1,
0.2511905, 0.6018246, 1.081335, 0, 0.4352941, 1, 1,
0.2521635, -0.1068721, 2.853971, 0, 0.4313726, 1, 1,
0.2525134, -1.813732, 4.227265, 0, 0.4235294, 1, 1,
0.253528, 0.02304843, 1.719205, 0, 0.4196078, 1, 1,
0.2541648, 0.5767056, -0.01376833, 0, 0.4117647, 1, 1,
0.2582132, 1.420812, -0.1384402, 0, 0.4078431, 1, 1,
0.2622864, -0.7349365, 2.185198, 0, 0.4, 1, 1,
0.2634599, -0.6842589, 2.592798, 0, 0.3921569, 1, 1,
0.2649144, 0.2092762, 0.7856928, 0, 0.3882353, 1, 1,
0.2662676, 0.2032671, 1.364792, 0, 0.3803922, 1, 1,
0.2692868, -0.4395772, 3.160589, 0, 0.3764706, 1, 1,
0.2716719, -0.9430379, 4.212554, 0, 0.3686275, 1, 1,
0.2726952, 0.8062556, -0.02577746, 0, 0.3647059, 1, 1,
0.2731857, -0.859392, 2.586937, 0, 0.3568628, 1, 1,
0.2763624, -0.4511877, 2.123166, 0, 0.3529412, 1, 1,
0.2775317, -0.8241414, 3.149814, 0, 0.345098, 1, 1,
0.2775566, -0.2614226, 2.715632, 0, 0.3411765, 1, 1,
0.2794181, -0.3077435, 1.704466, 0, 0.3333333, 1, 1,
0.2803972, 0.1843198, 1.773975, 0, 0.3294118, 1, 1,
0.2815759, 0.6822206, -0.4700317, 0, 0.3215686, 1, 1,
0.2842328, 0.05553837, 0.8862569, 0, 0.3176471, 1, 1,
0.2862902, -0.2413356, 2.795372, 0, 0.3098039, 1, 1,
0.291254, 0.4775944, -1.25211, 0, 0.3058824, 1, 1,
0.2934851, -0.5054501, 3.010168, 0, 0.2980392, 1, 1,
0.2939379, 1.316022, 0.719586, 0, 0.2901961, 1, 1,
0.294338, -1.420562, 3.003742, 0, 0.2862745, 1, 1,
0.2943994, -0.248471, 2.038296, 0, 0.2784314, 1, 1,
0.2978082, -1.658264, 2.635518, 0, 0.2745098, 1, 1,
0.297864, -1.66632, 4.325555, 0, 0.2666667, 1, 1,
0.2994214, -0.6267713, 3.812549, 0, 0.2627451, 1, 1,
0.3052267, 0.02427706, 0.9824967, 0, 0.254902, 1, 1,
0.3060766, -0.7284799, 3.455023, 0, 0.2509804, 1, 1,
0.3067901, 0.906132, 1.740688, 0, 0.2431373, 1, 1,
0.3096833, 0.3620492, -0.05371119, 0, 0.2392157, 1, 1,
0.3151111, 0.1687859, 0.8797314, 0, 0.2313726, 1, 1,
0.3182341, -0.9980702, 2.554411, 0, 0.227451, 1, 1,
0.3216301, 0.9937591, 0.9574535, 0, 0.2196078, 1, 1,
0.3220027, 1.303054, 0.8265353, 0, 0.2156863, 1, 1,
0.3226283, -1.630857, 3.094655, 0, 0.2078431, 1, 1,
0.3254629, -0.7810354, 2.724792, 0, 0.2039216, 1, 1,
0.3367106, -0.2483792, 1.957501, 0, 0.1960784, 1, 1,
0.3444669, -1.476065, 1.9278, 0, 0.1882353, 1, 1,
0.3498919, 0.8679072, 1.227281, 0, 0.1843137, 1, 1,
0.3507761, -1.174407, 2.760419, 0, 0.1764706, 1, 1,
0.3508478, -1.714889, 2.757484, 0, 0.172549, 1, 1,
0.3524291, 1.763752, -0.4829533, 0, 0.1647059, 1, 1,
0.3531114, -0.4780428, 3.62991, 0, 0.1607843, 1, 1,
0.3565497, -1.53429, 5.336454, 0, 0.1529412, 1, 1,
0.3601835, -0.08744511, 1.480421, 0, 0.1490196, 1, 1,
0.3609276, -0.6977974, 1.892424, 0, 0.1411765, 1, 1,
0.3627216, -2.227174, 2.851727, 0, 0.1372549, 1, 1,
0.3698198, 1.298081, 2.425948, 0, 0.1294118, 1, 1,
0.3704408, -2.627931, 3.384695, 0, 0.1254902, 1, 1,
0.3735651, 1.891259, 1.010565, 0, 0.1176471, 1, 1,
0.3804117, 1.540407, 0.6069517, 0, 0.1137255, 1, 1,
0.3820768, -1.784384, 3.230518, 0, 0.1058824, 1, 1,
0.3865884, 0.5541552, 1.308828, 0, 0.09803922, 1, 1,
0.3885769, -0.2721306, 2.951627, 0, 0.09411765, 1, 1,
0.3887026, -1.301777, 3.306084, 0, 0.08627451, 1, 1,
0.3926001, 0.562226, 0.9747106, 0, 0.08235294, 1, 1,
0.3944665, -0.6501138, 1.730383, 0, 0.07450981, 1, 1,
0.3961884, -2.078326, 2.003939, 0, 0.07058824, 1, 1,
0.4039965, 0.539776, 2.156233, 0, 0.0627451, 1, 1,
0.4045808, -0.4998232, 3.233735, 0, 0.05882353, 1, 1,
0.4066553, 0.9324294, 1.311749, 0, 0.05098039, 1, 1,
0.4071788, 0.5183713, 0.9672189, 0, 0.04705882, 1, 1,
0.4098304, 0.4492835, 1.185655, 0, 0.03921569, 1, 1,
0.4114901, 0.8509869, -0.02403275, 0, 0.03529412, 1, 1,
0.4125649, 0.1836981, 1.502487, 0, 0.02745098, 1, 1,
0.4144163, 1.158168, -0.2941155, 0, 0.02352941, 1, 1,
0.415225, 0.419378, 1.715116, 0, 0.01568628, 1, 1,
0.4168337, 0.1154268, 0.7949646, 0, 0.01176471, 1, 1,
0.4201342, -0.45877, 3.68368, 0, 0.003921569, 1, 1,
0.4219606, 0.9460465, -0.1682668, 0.003921569, 0, 1, 1,
0.422267, 0.3712141, 0.2411007, 0.007843138, 0, 1, 1,
0.4284446, -0.9663467, 3.543367, 0.01568628, 0, 1, 1,
0.4288515, -0.9273189, 1.988892, 0.01960784, 0, 1, 1,
0.4320202, 0.6161991, -0.1370548, 0.02745098, 0, 1, 1,
0.4335857, 0.7017955, -0.6917166, 0.03137255, 0, 1, 1,
0.4350748, 0.2378359, 1.645153, 0.03921569, 0, 1, 1,
0.4350981, -0.7016311, 0.890488, 0.04313726, 0, 1, 1,
0.4383397, 0.4848237, -0.02540946, 0.05098039, 0, 1, 1,
0.4407836, 2.231814, 0.9432167, 0.05490196, 0, 1, 1,
0.4476512, -0.1104408, 3.549578, 0.0627451, 0, 1, 1,
0.4485111, -1.706865, 1.568146, 0.06666667, 0, 1, 1,
0.4491849, 1.802517, 0.4491996, 0.07450981, 0, 1, 1,
0.4530096, 0.2910246, 0.5568552, 0.07843138, 0, 1, 1,
0.4576017, 0.1391564, 0.3071632, 0.08627451, 0, 1, 1,
0.4703105, -0.2697462, 1.893765, 0.09019608, 0, 1, 1,
0.4798448, -0.1455091, 2.987186, 0.09803922, 0, 1, 1,
0.4806262, 0.01222876, 0.8568093, 0.1058824, 0, 1, 1,
0.480696, 1.097314, 2.032195, 0.1098039, 0, 1, 1,
0.4836507, -0.1992493, 3.586909, 0.1176471, 0, 1, 1,
0.4836581, 0.9349436, 1.580223, 0.1215686, 0, 1, 1,
0.4868511, -2.055939, 1.962231, 0.1294118, 0, 1, 1,
0.4873774, 0.2182458, 1.337279, 0.1333333, 0, 1, 1,
0.4894428, 1.740033, 0.6076778, 0.1411765, 0, 1, 1,
0.4899021, -0.5419725, 0.651146, 0.145098, 0, 1, 1,
0.4946019, 1.036136, 1.788288, 0.1529412, 0, 1, 1,
0.4953168, 0.4176904, 2.011964, 0.1568628, 0, 1, 1,
0.4958614, 0.8909085, 1.813338, 0.1647059, 0, 1, 1,
0.5008581, 1.288494, -0.07298118, 0.1686275, 0, 1, 1,
0.5010882, 0.004903244, 1.90923, 0.1764706, 0, 1, 1,
0.5047177, -0.2203705, 1.692161, 0.1803922, 0, 1, 1,
0.5081505, -1.0395, 1.841644, 0.1882353, 0, 1, 1,
0.5111345, 0.2425653, -0.362202, 0.1921569, 0, 1, 1,
0.5126377, -3.054923, 4.098913, 0.2, 0, 1, 1,
0.5153113, -1.071774, 0.8129406, 0.2078431, 0, 1, 1,
0.5217052, 1.383849, 0.6083694, 0.2117647, 0, 1, 1,
0.5232123, -1.562073, 2.071467, 0.2196078, 0, 1, 1,
0.5234879, 0.9967175, 0.4319565, 0.2235294, 0, 1, 1,
0.5256759, -0.9172551, 2.823108, 0.2313726, 0, 1, 1,
0.5311956, -1.193344, 2.051691, 0.2352941, 0, 1, 1,
0.5352593, -0.00872363, 1.163842, 0.2431373, 0, 1, 1,
0.5400705, -0.9206185, 2.527903, 0.2470588, 0, 1, 1,
0.5441824, -0.2688843, 2.089283, 0.254902, 0, 1, 1,
0.5476086, 1.239642, -0.9329294, 0.2588235, 0, 1, 1,
0.5487722, -1.061524, 2.093736, 0.2666667, 0, 1, 1,
0.5528286, -0.05724091, -0.09239124, 0.2705882, 0, 1, 1,
0.5560104, 0.1034777, 0.07412615, 0.2784314, 0, 1, 1,
0.5607705, -1.356624, 2.854011, 0.282353, 0, 1, 1,
0.5640863, -0.3197975, 2.561262, 0.2901961, 0, 1, 1,
0.564563, 0.9598371, 0.7538193, 0.2941177, 0, 1, 1,
0.5645881, 0.2458688, 2.401052, 0.3019608, 0, 1, 1,
0.5661403, 1.097148, 0.7617767, 0.3098039, 0, 1, 1,
0.5674059, -1.099289, 3.067487, 0.3137255, 0, 1, 1,
0.5728165, 1.139209, -0.5931708, 0.3215686, 0, 1, 1,
0.5743417, 0.4998997, 0.4344171, 0.3254902, 0, 1, 1,
0.5744351, 0.1186981, 1.760074, 0.3333333, 0, 1, 1,
0.5764387, -0.119228, 2.73115, 0.3372549, 0, 1, 1,
0.5792704, 1.959503, -1.368372, 0.345098, 0, 1, 1,
0.5852826, -0.08691666, 1.542126, 0.3490196, 0, 1, 1,
0.5865772, 0.2790343, 0.6473234, 0.3568628, 0, 1, 1,
0.5877941, -0.8950117, 3.02096, 0.3607843, 0, 1, 1,
0.5957608, 1.544381, 1.326734, 0.3686275, 0, 1, 1,
0.601936, 0.4175627, -1.746425, 0.372549, 0, 1, 1,
0.6054215, -0.4227537, 2.676709, 0.3803922, 0, 1, 1,
0.6103378, -0.4429022, 2.25058, 0.3843137, 0, 1, 1,
0.6106016, 1.333915, 0.1227342, 0.3921569, 0, 1, 1,
0.6126493, -1.922584, 2.001623, 0.3960784, 0, 1, 1,
0.6133415, -0.8908311, 6.009848, 0.4039216, 0, 1, 1,
0.6211582, -1.147755, 3.550691, 0.4117647, 0, 1, 1,
0.6231359, 0.2061274, 2.049588, 0.4156863, 0, 1, 1,
0.6238849, 0.4015336, 2.042462, 0.4235294, 0, 1, 1,
0.6245326, 1.223759, 0.7461523, 0.427451, 0, 1, 1,
0.6298045, 0.4741425, 1.341137, 0.4352941, 0, 1, 1,
0.6324764, -1.260927, 3.452459, 0.4392157, 0, 1, 1,
0.6343222, 0.8365428, 0.5124509, 0.4470588, 0, 1, 1,
0.63471, -0.1418794, 1.270492, 0.4509804, 0, 1, 1,
0.635532, 2.091754, 0.2058767, 0.4588235, 0, 1, 1,
0.6360621, 0.202393, 2.145717, 0.4627451, 0, 1, 1,
0.6427734, 0.4187187, 0.7379785, 0.4705882, 0, 1, 1,
0.6533749, -1.437063, 1.966507, 0.4745098, 0, 1, 1,
0.6556114, 1.692471, 0.7774802, 0.4823529, 0, 1, 1,
0.6562498, 0.8645411, 2.092942, 0.4862745, 0, 1, 1,
0.6711027, -1.915957, 2.54077, 0.4941176, 0, 1, 1,
0.6742766, 0.2125193, 1.43805, 0.5019608, 0, 1, 1,
0.6752678, -1.067846, 0.6309945, 0.5058824, 0, 1, 1,
0.6778401, 1.044587, -0.09406571, 0.5137255, 0, 1, 1,
0.6809512, 0.179638, 1.623946, 0.5176471, 0, 1, 1,
0.6833247, 0.1111917, 1.198192, 0.5254902, 0, 1, 1,
0.6925188, -0.2069618, 2.18805, 0.5294118, 0, 1, 1,
0.7060298, -1.528655, 1.866145, 0.5372549, 0, 1, 1,
0.709129, -0.6472555, 3.382838, 0.5411765, 0, 1, 1,
0.715273, -0.8570966, 1.498556, 0.5490196, 0, 1, 1,
0.7203958, -1.129828, 3.856006, 0.5529412, 0, 1, 1,
0.7226323, 0.5090066, 1.38995, 0.5607843, 0, 1, 1,
0.7239673, 0.6165336, -0.02001, 0.5647059, 0, 1, 1,
0.7247187, 0.9639279, 1.073074, 0.572549, 0, 1, 1,
0.7254909, -2.550754, 2.797192, 0.5764706, 0, 1, 1,
0.7256978, -0.8130121, 2.959111, 0.5843138, 0, 1, 1,
0.7269604, 0.1104391, 2.048623, 0.5882353, 0, 1, 1,
0.728334, -1.071956, 2.909305, 0.5960785, 0, 1, 1,
0.7382725, -0.6463105, 1.827013, 0.6039216, 0, 1, 1,
0.7382836, -0.2894094, 1.656639, 0.6078432, 0, 1, 1,
0.7409763, -0.03482298, 2.805038, 0.6156863, 0, 1, 1,
0.7476266, 0.8193847, -0.9302163, 0.6196079, 0, 1, 1,
0.7505519, -0.5765831, 3.822724, 0.627451, 0, 1, 1,
0.7508636, 0.7457201, 0.08297632, 0.6313726, 0, 1, 1,
0.7518435, -0.6303532, 3.944968, 0.6392157, 0, 1, 1,
0.7547667, 0.6354424, -0.2011224, 0.6431373, 0, 1, 1,
0.7558597, -1.609046, 4.082761, 0.6509804, 0, 1, 1,
0.7563567, 0.8721206, 0.849036, 0.654902, 0, 1, 1,
0.7568652, -0.721656, 3.225529, 0.6627451, 0, 1, 1,
0.7686533, -0.2431429, 3.157986, 0.6666667, 0, 1, 1,
0.7740834, -1.453993, 1.352549, 0.6745098, 0, 1, 1,
0.7828556, -0.7583232, 1.935855, 0.6784314, 0, 1, 1,
0.7903304, 0.08448646, 1.030184, 0.6862745, 0, 1, 1,
0.7978168, 1.046798, 1.539566, 0.6901961, 0, 1, 1,
0.7990052, -0.3791518, 1.875983, 0.6980392, 0, 1, 1,
0.8048435, 1.494943, -0.5679891, 0.7058824, 0, 1, 1,
0.8062725, 0.5255754, 1.153383, 0.7098039, 0, 1, 1,
0.8107269, -0.3087994, 3.700064, 0.7176471, 0, 1, 1,
0.8114888, 1.296687, 0.2374308, 0.7215686, 0, 1, 1,
0.8175421, -0.4791241, 3.411004, 0.7294118, 0, 1, 1,
0.819536, 0.6967655, 0.7623232, 0.7333333, 0, 1, 1,
0.8230029, 0.9877503, 0.9014418, 0.7411765, 0, 1, 1,
0.8230473, -2.291021, 2.406047, 0.7450981, 0, 1, 1,
0.8249466, -0.1839107, 0.5142968, 0.7529412, 0, 1, 1,
0.8250052, 0.3196283, 1.252817, 0.7568628, 0, 1, 1,
0.826516, -1.362203, 3.154534, 0.7647059, 0, 1, 1,
0.8279818, -1.821015, 2.143132, 0.7686275, 0, 1, 1,
0.8311428, -0.7680054, 1.493749, 0.7764706, 0, 1, 1,
0.8395092, 0.7493485, 3.039265, 0.7803922, 0, 1, 1,
0.8422859, 1.607457, 0.6809325, 0.7882353, 0, 1, 1,
0.8458798, -0.5712, 1.454778, 0.7921569, 0, 1, 1,
0.8519306, 1.715889, -3.418209, 0.8, 0, 1, 1,
0.8578747, -0.8128328, 2.09419, 0.8078431, 0, 1, 1,
0.8600237, 0.3684376, 2.212883, 0.8117647, 0, 1, 1,
0.8657588, -0.08568063, 1.549338, 0.8196079, 0, 1, 1,
0.8659427, 0.4578753, 0.7103778, 0.8235294, 0, 1, 1,
0.8676433, 0.1348745, 1.724299, 0.8313726, 0, 1, 1,
0.8738207, -0.5154822, 0.75699, 0.8352941, 0, 1, 1,
0.8890446, 0.4137737, 0.005037061, 0.8431373, 0, 1, 1,
0.8892593, -0.1849647, 2.200232, 0.8470588, 0, 1, 1,
0.8966653, 0.07137393, 2.219021, 0.854902, 0, 1, 1,
0.8967467, -0.4919537, 2.11991, 0.8588235, 0, 1, 1,
0.897745, -1.238308, 3.840339, 0.8666667, 0, 1, 1,
0.9011757, -0.5611942, 0.2595117, 0.8705882, 0, 1, 1,
0.9016147, 1.536195, 0.7731846, 0.8784314, 0, 1, 1,
0.9033107, 0.4326543, 1.840181, 0.8823529, 0, 1, 1,
0.9072483, 0.6673793, 1.552727, 0.8901961, 0, 1, 1,
0.9105367, 0.5312571, 1.240419, 0.8941177, 0, 1, 1,
0.9110996, 0.3169509, 0.7551879, 0.9019608, 0, 1, 1,
0.9111146, 1.392638, 0.4429444, 0.9098039, 0, 1, 1,
0.91911, -0.8465192, 2.582145, 0.9137255, 0, 1, 1,
0.9204422, 0.9846897, 1.78531, 0.9215686, 0, 1, 1,
0.9267808, -0.2659712, 3.465075, 0.9254902, 0, 1, 1,
0.9283217, -1.183193, 2.75863, 0.9333333, 0, 1, 1,
0.9310206, 1.035451, -1.162711, 0.9372549, 0, 1, 1,
0.9327445, 1.272656, 2.031727, 0.945098, 0, 1, 1,
0.9356903, -0.04182699, -0.09385722, 0.9490196, 0, 1, 1,
0.9386572, 0.9309475, -1.439477, 0.9568627, 0, 1, 1,
0.9394609, 0.3548075, -0.246313, 0.9607843, 0, 1, 1,
0.939832, 0.0885685, 1.508512, 0.9686275, 0, 1, 1,
0.94067, -0.5958772, 2.750498, 0.972549, 0, 1, 1,
0.9462555, -0.2344738, 1.98197, 0.9803922, 0, 1, 1,
0.950736, 0.6896815, 0.9918484, 0.9843137, 0, 1, 1,
0.9510794, 1.599078, 0.904943, 0.9921569, 0, 1, 1,
0.9575696, 1.646908, -0.8145724, 0.9960784, 0, 1, 1,
0.9630281, 0.4496681, 0.6262497, 1, 0, 0.9960784, 1,
0.9655943, 0.6269123, 0.9245207, 1, 0, 0.9882353, 1,
0.9684798, 0.6017198, 1.701364, 1, 0, 0.9843137, 1,
0.9851446, 0.08618987, 2.003005, 1, 0, 0.9764706, 1,
0.9889676, 1.006192, -0.2831167, 1, 0, 0.972549, 1,
0.9899325, 0.5842186, 0.8336922, 1, 0, 0.9647059, 1,
0.9906548, -0.2583291, 1.796275, 1, 0, 0.9607843, 1,
0.993207, -0.01151515, 0.7591679, 1, 0, 0.9529412, 1,
0.9972757, 0.401311, 0.8712041, 1, 0, 0.9490196, 1,
1.00751, -0.251998, 1.651347, 1, 0, 0.9411765, 1,
1.01041, -1.915556, 4.586669, 1, 0, 0.9372549, 1,
1.015218, 0.2754039, 1.744354, 1, 0, 0.9294118, 1,
1.021082, 0.9291237, 0.9139879, 1, 0, 0.9254902, 1,
1.023993, -0.3305673, 3.349135, 1, 0, 0.9176471, 1,
1.024385, -0.008623656, -0.227721, 1, 0, 0.9137255, 1,
1.028286, -0.3953687, 2.396591, 1, 0, 0.9058824, 1,
1.029301, -0.5078971, 2.295235, 1, 0, 0.9019608, 1,
1.038699, 1.805277, -2.537989, 1, 0, 0.8941177, 1,
1.040026, -0.5386921, 2.116768, 1, 0, 0.8862745, 1,
1.048261, -2.032774, 3.44766, 1, 0, 0.8823529, 1,
1.065247, 0.3504978, 1.168395, 1, 0, 0.8745098, 1,
1.066418, 0.8252504, 1.397658, 1, 0, 0.8705882, 1,
1.078126, -1.955628, 3.100008, 1, 0, 0.8627451, 1,
1.080817, -1.556678, 1.427995, 1, 0, 0.8588235, 1,
1.087273, 0.6755813, 2.032596, 1, 0, 0.8509804, 1,
1.091511, -0.9682667, 3.735853, 1, 0, 0.8470588, 1,
1.095617, -1.5559, 2.479521, 1, 0, 0.8392157, 1,
1.097691, -0.7490234, 2.144417, 1, 0, 0.8352941, 1,
1.111992, 1.327527, 0.2885053, 1, 0, 0.827451, 1,
1.12067, 0.9897673, -0.0512999, 1, 0, 0.8235294, 1,
1.123265, -0.1332716, 1.825184, 1, 0, 0.8156863, 1,
1.127909, 0.6653872, 1.275954, 1, 0, 0.8117647, 1,
1.130335, -0.6245943, 2.33041, 1, 0, 0.8039216, 1,
1.140607, -1.575618, 4.430269, 1, 0, 0.7960784, 1,
1.14193, 0.3848056, 0.8288659, 1, 0, 0.7921569, 1,
1.145113, 1.117535, 0.8328199, 1, 0, 0.7843137, 1,
1.145143, 1.347528, -0.6551657, 1, 0, 0.7803922, 1,
1.153721, 0.9589638, 0.3264363, 1, 0, 0.772549, 1,
1.180169, 0.8959579, 1.211093, 1, 0, 0.7686275, 1,
1.19097, 1.521936, -0.2459398, 1, 0, 0.7607843, 1,
1.191413, -0.1860417, 1.613093, 1, 0, 0.7568628, 1,
1.191437, 1.277186, -0.1484184, 1, 0, 0.7490196, 1,
1.196319, -2.370397, 1.641523, 1, 0, 0.7450981, 1,
1.196936, -0.6539182, 0.6170954, 1, 0, 0.7372549, 1,
1.200769, 0.7184401, 3.212479, 1, 0, 0.7333333, 1,
1.205031, 0.1217209, 1.666785, 1, 0, 0.7254902, 1,
1.20722, -1.042511, 3.063638, 1, 0, 0.7215686, 1,
1.207576, 0.2951753, 0.1958189, 1, 0, 0.7137255, 1,
1.214159, 0.7402913, 0.8321513, 1, 0, 0.7098039, 1,
1.217414, 0.1318427, 1.224347, 1, 0, 0.7019608, 1,
1.218159, 0.1979069, 0.1214464, 1, 0, 0.6941177, 1,
1.22809, 0.2588989, 2.944409, 1, 0, 0.6901961, 1,
1.229661, 0.03212239, 1.574687, 1, 0, 0.682353, 1,
1.250589, 1.015379, 0.6025898, 1, 0, 0.6784314, 1,
1.25304, 0.541304, 2.906863, 1, 0, 0.6705883, 1,
1.255523, 1.277517, 0.6512678, 1, 0, 0.6666667, 1,
1.264846, 1.941029, 1.043836, 1, 0, 0.6588235, 1,
1.278146, -0.7584801, 4.366659, 1, 0, 0.654902, 1,
1.278233, 1.057497, 1.137061, 1, 0, 0.6470588, 1,
1.285591, -1.192207, 2.439669, 1, 0, 0.6431373, 1,
1.287743, -0.1700264, 3.560922, 1, 0, 0.6352941, 1,
1.288892, -1.211319, 3.681006, 1, 0, 0.6313726, 1,
1.294972, 1.390223, 1.173951, 1, 0, 0.6235294, 1,
1.294986, -0.6646208, 3.967519, 1, 0, 0.6196079, 1,
1.29749, 0.5098907, 3.14923, 1, 0, 0.6117647, 1,
1.299643, -0.717383, 2.288365, 1, 0, 0.6078432, 1,
1.313517, 1.462367, 0.8518533, 1, 0, 0.6, 1,
1.316232, 0.4673203, 0.154576, 1, 0, 0.5921569, 1,
1.318714, -1.204526, 1.963866, 1, 0, 0.5882353, 1,
1.328639, -0.8668389, 1.861166, 1, 0, 0.5803922, 1,
1.373247, 0.4428009, -0.768347, 1, 0, 0.5764706, 1,
1.377701, 0.1136693, 1.421932, 1, 0, 0.5686275, 1,
1.377893, -0.4958827, 1.550192, 1, 0, 0.5647059, 1,
1.382337, 1.798877, 3.124126, 1, 0, 0.5568628, 1,
1.382509, 0.09049411, 0.8085665, 1, 0, 0.5529412, 1,
1.395702, -1.634315, 2.356002, 1, 0, 0.5450981, 1,
1.399213, 1.011683, -0.6978283, 1, 0, 0.5411765, 1,
1.414531, 0.9800897, 2.151495, 1, 0, 0.5333334, 1,
1.415012, 0.8457038, -0.2965536, 1, 0, 0.5294118, 1,
1.418116, 1.567739, 2.430256, 1, 0, 0.5215687, 1,
1.419023, -0.7355773, 2.557675, 1, 0, 0.5176471, 1,
1.427327, 0.8992481, 0.2260564, 1, 0, 0.509804, 1,
1.434541, -1.34295, 2.606959, 1, 0, 0.5058824, 1,
1.459798, 1.118484, 1.470237, 1, 0, 0.4980392, 1,
1.464054, 0.387215, 3.139649, 1, 0, 0.4901961, 1,
1.475961, 0.3682075, 2.274501, 1, 0, 0.4862745, 1,
1.481583, -0.7223048, 1.500519, 1, 0, 0.4784314, 1,
1.482899, -1.544691, 2.582964, 1, 0, 0.4745098, 1,
1.483145, -0.8999915, 0.4794085, 1, 0, 0.4666667, 1,
1.485977, -1.97518, 2.915139, 1, 0, 0.4627451, 1,
1.494348, 1.575024, 2.172318, 1, 0, 0.454902, 1,
1.531685, 1.324464, 0.564689, 1, 0, 0.4509804, 1,
1.557474, -1.741196, 3.494807, 1, 0, 0.4431373, 1,
1.564464, 0.01785903, 0.299619, 1, 0, 0.4392157, 1,
1.567288, 0.7245301, 1.251042, 1, 0, 0.4313726, 1,
1.568205, 0.08155142, 2.321748, 1, 0, 0.427451, 1,
1.572761, 0.7998864, 1.34754, 1, 0, 0.4196078, 1,
1.574247, -0.3521768, 1.884741, 1, 0, 0.4156863, 1,
1.578159, -0.8080826, 0.8034354, 1, 0, 0.4078431, 1,
1.581658, 0.4811754, 0.6571749, 1, 0, 0.4039216, 1,
1.601257, 0.4457492, 0.5527945, 1, 0, 0.3960784, 1,
1.604439, 0.9142846, 2.011928, 1, 0, 0.3882353, 1,
1.607292, 0.7328241, 0.5266752, 1, 0, 0.3843137, 1,
1.607546, 0.7450398, 2.197663, 1, 0, 0.3764706, 1,
1.611129, -0.4700982, 1.4416, 1, 0, 0.372549, 1,
1.611563, -1.300514, 3.542153, 1, 0, 0.3647059, 1,
1.613706, 0.01779148, 2.732665, 1, 0, 0.3607843, 1,
1.614019, -2.364572, 1.481277, 1, 0, 0.3529412, 1,
1.614649, 0.5260661, 2.165308, 1, 0, 0.3490196, 1,
1.619378, -0.3864022, 2.099921, 1, 0, 0.3411765, 1,
1.626008, 0.5003601, 1.248174, 1, 0, 0.3372549, 1,
1.628236, 0.2101457, 0.4947151, 1, 0, 0.3294118, 1,
1.645669, 0.3494483, 1.544629, 1, 0, 0.3254902, 1,
1.659196, -0.01286861, 2.686509, 1, 0, 0.3176471, 1,
1.664231, 0.1103027, 0.5075769, 1, 0, 0.3137255, 1,
1.695002, -0.3437533, 1.998186, 1, 0, 0.3058824, 1,
1.69907, 0.5367347, -1.284134, 1, 0, 0.2980392, 1,
1.699099, -0.4598767, 1.919528, 1, 0, 0.2941177, 1,
1.722511, 0.4647519, 1.400934, 1, 0, 0.2862745, 1,
1.723374, 1.73252, -0.4302916, 1, 0, 0.282353, 1,
1.742687, 0.01955748, 2.114467, 1, 0, 0.2745098, 1,
1.75715, 0.2969811, 2.264824, 1, 0, 0.2705882, 1,
1.781425, 1.340869, 1.908784, 1, 0, 0.2627451, 1,
1.789016, 0.2581502, 1.295502, 1, 0, 0.2588235, 1,
1.789053, -1.034949, 1.522607, 1, 0, 0.2509804, 1,
1.789249, -0.08481712, 2.022938, 1, 0, 0.2470588, 1,
1.794871, -0.130393, 1.254187, 1, 0, 0.2392157, 1,
1.804906, 0.3040529, 0.770784, 1, 0, 0.2352941, 1,
1.816269, -2.382788, 3.624511, 1, 0, 0.227451, 1,
1.816489, -0.6328647, 2.21938, 1, 0, 0.2235294, 1,
1.842464, -0.3514727, 1.385004, 1, 0, 0.2156863, 1,
1.844931, 0.93528, 1.091242, 1, 0, 0.2117647, 1,
1.849522, 1.560551, -0.2194543, 1, 0, 0.2039216, 1,
1.883608, -0.8710055, 1.90301, 1, 0, 0.1960784, 1,
1.885572, -0.08033862, 2.059281, 1, 0, 0.1921569, 1,
1.910604, -0.8097221, 3.67202, 1, 0, 0.1843137, 1,
1.916302, -0.6942635, 2.085343, 1, 0, 0.1803922, 1,
1.916915, -0.2122142, 1.395138, 1, 0, 0.172549, 1,
1.928362, 0.2081021, 1.947207, 1, 0, 0.1686275, 1,
1.964262, -0.2404082, 1.575763, 1, 0, 0.1607843, 1,
1.9754, 0.7677056, 2.116438, 1, 0, 0.1568628, 1,
2.007549, -0.4651016, 0.3549065, 1, 0, 0.1490196, 1,
2.036842, 0.250042, 2.232034, 1, 0, 0.145098, 1,
2.044863, 1.745986, 0.0297621, 1, 0, 0.1372549, 1,
2.050194, 0.009950761, 0.6792289, 1, 0, 0.1333333, 1,
2.094064, 1.501703, -0.3856688, 1, 0, 0.1254902, 1,
2.117126, 0.6382536, 1.033924, 1, 0, 0.1215686, 1,
2.12152, -1.625968, 1.478442, 1, 0, 0.1137255, 1,
2.133589, 0.20435, 1.641332, 1, 0, 0.1098039, 1,
2.145006, -1.011908, 4.019483, 1, 0, 0.1019608, 1,
2.201935, -1.09725, 2.223368, 1, 0, 0.09411765, 1,
2.264829, -1.032323, 0.5213339, 1, 0, 0.09019608, 1,
2.27767, -0.2312714, 3.819864, 1, 0, 0.08235294, 1,
2.331949, -0.3919729, 1.935912, 1, 0, 0.07843138, 1,
2.353547, -0.4888865, 1.187143, 1, 0, 0.07058824, 1,
2.358607, 0.1210261, 3.450814, 1, 0, 0.06666667, 1,
2.366944, -0.3099992, 2.088206, 1, 0, 0.05882353, 1,
2.395496, 0.07652053, 1.995651, 1, 0, 0.05490196, 1,
2.511906, -0.7902083, 1.055165, 1, 0, 0.04705882, 1,
2.546729, 0.7489992, 3.084651, 1, 0, 0.04313726, 1,
2.573573, -1.047705, 1.434453, 1, 0, 0.03529412, 1,
2.79185, 0.3432666, 0.8768668, 1, 0, 0.03137255, 1,
2.796504, 1.369534, 2.309455, 1, 0, 0.02352941, 1,
3.026885, 0.148979, 4.063742, 1, 0, 0.01960784, 1,
3.083295, -0.7477996, 2.79851, 1, 0, 0.01176471, 1,
3.488511, -0.2366193, 1.05609, 1, 0, 0.007843138, 1
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
0.03112113, -4.320182, -8.200188, 0, -0.5, 0.5, 0.5,
0.03112113, -4.320182, -8.200188, 1, -0.5, 0.5, 0.5,
0.03112113, -4.320182, -8.200188, 1, 1.5, 0.5, 0.5,
0.03112113, -4.320182, -8.200188, 0, 1.5, 0.5, 0.5
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
-4.598324, 0.03981733, -8.200188, 0, -0.5, 0.5, 0.5,
-4.598324, 0.03981733, -8.200188, 1, -0.5, 0.5, 0.5,
-4.598324, 0.03981733, -8.200188, 1, 1.5, 0.5, 0.5,
-4.598324, 0.03981733, -8.200188, 0, 1.5, 0.5, 0.5
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
-4.598324, -4.320182, -0.06541324, 0, -0.5, 0.5, 0.5,
-4.598324, -4.320182, -0.06541324, 1, -0.5, 0.5, 0.5,
-4.598324, -4.320182, -0.06541324, 1, 1.5, 0.5, 0.5,
-4.598324, -4.320182, -0.06541324, 0, 1.5, 0.5, 0.5
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
-3, -3.314028, -6.322932,
3, -3.314028, -6.322932,
-3, -3.314028, -6.322932,
-3, -3.48172, -6.635808,
-2, -3.314028, -6.322932,
-2, -3.48172, -6.635808,
-1, -3.314028, -6.322932,
-1, -3.48172, -6.635808,
0, -3.314028, -6.322932,
0, -3.48172, -6.635808,
1, -3.314028, -6.322932,
1, -3.48172, -6.635808,
2, -3.314028, -6.322932,
2, -3.48172, -6.635808,
3, -3.314028, -6.322932,
3, -3.48172, -6.635808
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
-3, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
-3, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
-3, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
-3, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
-2, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
-2, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
-2, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
-2, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
-1, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
-1, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
-1, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
-1, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
0, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
0, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
0, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
0, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
1, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
1, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
1, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
1, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
2, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
2, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
2, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
2, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5,
3, -3.817105, -7.26156, 0, -0.5, 0.5, 0.5,
3, -3.817105, -7.26156, 1, -0.5, 0.5, 0.5,
3, -3.817105, -7.26156, 1, 1.5, 0.5, 0.5,
3, -3.817105, -7.26156, 0, 1.5, 0.5, 0.5
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
-3.529991, -3, -6.322932,
-3.529991, 3, -6.322932,
-3.529991, -3, -6.322932,
-3.708046, -3, -6.635808,
-3.529991, -2, -6.322932,
-3.708046, -2, -6.635808,
-3.529991, -1, -6.322932,
-3.708046, -1, -6.635808,
-3.529991, 0, -6.322932,
-3.708046, 0, -6.635808,
-3.529991, 1, -6.322932,
-3.708046, 1, -6.635808,
-3.529991, 2, -6.322932,
-3.708046, 2, -6.635808,
-3.529991, 3, -6.322932,
-3.708046, 3, -6.635808
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
-4.064157, -3, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, -3, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, -3, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, -3, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, -2, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, -2, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, -2, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, -2, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, -1, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, -1, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, -1, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, -1, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, 0, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, 0, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, 0, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, 0, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, 1, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, 1, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, 1, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, 1, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, 2, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, 2, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, 2, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, 2, -7.26156, 0, 1.5, 0.5, 0.5,
-4.064157, 3, -7.26156, 0, -0.5, 0.5, 0.5,
-4.064157, 3, -7.26156, 1, -0.5, 0.5, 0.5,
-4.064157, 3, -7.26156, 1, 1.5, 0.5, 0.5,
-4.064157, 3, -7.26156, 0, 1.5, 0.5, 0.5
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
-3.529991, -3.314028, -6,
-3.529991, -3.314028, 6,
-3.529991, -3.314028, -6,
-3.708046, -3.48172, -6,
-3.529991, -3.314028, -4,
-3.708046, -3.48172, -4,
-3.529991, -3.314028, -2,
-3.708046, -3.48172, -2,
-3.529991, -3.314028, 0,
-3.708046, -3.48172, 0,
-3.529991, -3.314028, 2,
-3.708046, -3.48172, 2,
-3.529991, -3.314028, 4,
-3.708046, -3.48172, 4,
-3.529991, -3.314028, 6,
-3.708046, -3.48172, 6
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
-4.064157, -3.817105, -6, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -6, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -6, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, -6, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, -4, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -4, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -4, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, -4, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, -2, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -2, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, -2, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, -2, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 0, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 0, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 0, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 0, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 2, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 2, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 2, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 2, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 4, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 4, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 4, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 4, 0, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 6, 0, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 6, 1, -0.5, 0.5, 0.5,
-4.064157, -3.817105, 6, 1, 1.5, 0.5, 0.5,
-4.064157, -3.817105, 6, 0, 1.5, 0.5, 0.5
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
-3.529991, -3.314028, -6.322932,
-3.529991, 3.393663, -6.322932,
-3.529991, -3.314028, 6.192105,
-3.529991, 3.393663, 6.192105,
-3.529991, -3.314028, -6.322932,
-3.529991, -3.314028, 6.192105,
-3.529991, 3.393663, -6.322932,
-3.529991, 3.393663, 6.192105,
-3.529991, -3.314028, -6.322932,
3.592233, -3.314028, -6.322932,
-3.529991, -3.314028, 6.192105,
3.592233, -3.314028, 6.192105,
-3.529991, 3.393663, -6.322932,
3.592233, 3.393663, -6.322932,
-3.529991, 3.393663, 6.192105,
3.592233, 3.393663, 6.192105,
3.592233, -3.314028, -6.322932,
3.592233, 3.393663, -6.322932,
3.592233, -3.314028, 6.192105,
3.592233, 3.393663, 6.192105,
3.592233, -3.314028, -6.322932,
3.592233, -3.314028, 6.192105,
3.592233, 3.393663, -6.322932,
3.592233, 3.393663, 6.192105
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
var radius = 8.482486;
var distance = 37.73954;
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
mvMatrix.translate( -0.03112113, -0.03981733, 0.06541324 );
mvMatrix.scale( 1.28772, 1.367301, 0.7328328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.73954);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Zineb<-read.table("Zineb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Zineb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
```

```r
y<-Zineb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
```

```r
z<-Zineb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zineb' not found
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
-3.426269, 0.6375294, -2.899726, 0, 0, 1, 1, 1,
-3.405964, -0.01493964, -2.075773, 1, 0, 0, 1, 1,
-3.023262, 1.745675, 0.3080828, 1, 0, 0, 1, 1,
-2.930155, -2.440963, -1.272906, 1, 0, 0, 1, 1,
-2.914939, -0.9319767, -1.428747, 1, 0, 0, 1, 1,
-2.777008, 0.1386394, -2.645349, 1, 0, 0, 1, 1,
-2.683477, 0.4100661, 0.03397781, 0, 0, 0, 1, 1,
-2.649556, 0.9956196, -2.124085, 0, 0, 0, 1, 1,
-2.534792, 0.6557272, -2.064861, 0, 0, 0, 1, 1,
-2.505196, 1.882323, -1.391278, 0, 0, 0, 1, 1,
-2.502706, 0.6445951, -1.184647, 0, 0, 0, 1, 1,
-2.484345, -0.776209, -1.338918, 0, 0, 0, 1, 1,
-2.478477, 0.577074, -0.2028618, 0, 0, 0, 1, 1,
-2.440356, -0.01857465, 0.674027, 1, 1, 1, 1, 1,
-2.417915, -0.8697428, -1.84083, 1, 1, 1, 1, 1,
-2.412508, -1.290612, -0.7299452, 1, 1, 1, 1, 1,
-2.376606, 0.5564365, -1.28736, 1, 1, 1, 1, 1,
-2.199646, -0.1987333, -1.491569, 1, 1, 1, 1, 1,
-2.183141, 0.6603669, -0.9326324, 1, 1, 1, 1, 1,
-2.158291, 3.126496, -1.307476, 1, 1, 1, 1, 1,
-2.146151, 0.3066646, -1.016807, 1, 1, 1, 1, 1,
-2.131087, -1.058561, -1.586707, 1, 1, 1, 1, 1,
-2.123119, -0.3998847, -2.654592, 1, 1, 1, 1, 1,
-2.063501, 0.08730829, -2.491535, 1, 1, 1, 1, 1,
-2.059449, -1.56094, -2.374716, 1, 1, 1, 1, 1,
-2.053385, -0.3744298, -2.459586, 1, 1, 1, 1, 1,
-2.046253, -0.02706726, -1.363101, 1, 1, 1, 1, 1,
-2.026875, 0.3708, -1.172801, 1, 1, 1, 1, 1,
-2.013968, 0.7605854, -1.016512, 0, 0, 1, 1, 1,
-2.011404, -0.08801652, -1.100176, 1, 0, 0, 1, 1,
-2.01005, -1.26924, -0.2349321, 1, 0, 0, 1, 1,
-2.008491, -0.5012956, -1.323355, 1, 0, 0, 1, 1,
-1.954281, -0.772631, -2.256069, 1, 0, 0, 1, 1,
-1.94797, -0.6146251, -3.759357, 1, 0, 0, 1, 1,
-1.884269, 1.294227, -0.2347754, 0, 0, 0, 1, 1,
-1.876991, -0.03212865, -4.121951, 0, 0, 0, 1, 1,
-1.837051, -0.3327701, -1.622323, 0, 0, 0, 1, 1,
-1.831593, -0.2359372, -2.130969, 0, 0, 0, 1, 1,
-1.820585, 0.8614391, -1.63764, 0, 0, 0, 1, 1,
-1.819118, 0.2337107, -1.191725, 0, 0, 0, 1, 1,
-1.802902, 0.2478386, -2.20843, 0, 0, 0, 1, 1,
-1.793529, 0.7052965, 0.9268128, 1, 1, 1, 1, 1,
-1.793238, -1.469456, -1.338084, 1, 1, 1, 1, 1,
-1.785426, -0.1625622, -1.779849, 1, 1, 1, 1, 1,
-1.783676, -1.389332, -3.10751, 1, 1, 1, 1, 1,
-1.775385, -0.3648204, -0.2602789, 1, 1, 1, 1, 1,
-1.766217, -0.6058077, -2.157916, 1, 1, 1, 1, 1,
-1.759378, 0.406158, -0.6665245, 1, 1, 1, 1, 1,
-1.75254, -0.6764982, -1.927036, 1, 1, 1, 1, 1,
-1.749651, -0.1561937, -2.148101, 1, 1, 1, 1, 1,
-1.746573, 1.29493, -0.1671118, 1, 1, 1, 1, 1,
-1.723738, -0.2238646, -0.9570037, 1, 1, 1, 1, 1,
-1.721349, 1.308568, -1.671678, 1, 1, 1, 1, 1,
-1.721121, 1.564803, -0.01415208, 1, 1, 1, 1, 1,
-1.718391, 0.7476928, -2.60593, 1, 1, 1, 1, 1,
-1.666849, 0.01380745, -0.6375968, 1, 1, 1, 1, 1,
-1.658223, -0.1472465, -2.555615, 0, 0, 1, 1, 1,
-1.652746, -0.8036567, -1.43867, 1, 0, 0, 1, 1,
-1.649099, 0.3888373, -3.240142, 1, 0, 0, 1, 1,
-1.647831, -1.124229, -1.45337, 1, 0, 0, 1, 1,
-1.636384, 0.8317819, 0.04151715, 1, 0, 0, 1, 1,
-1.636364, 0.8754261, -3.255192, 1, 0, 0, 1, 1,
-1.591581, 0.1029498, -1.51945, 0, 0, 0, 1, 1,
-1.582613, -0.2347133, -0.8385251, 0, 0, 0, 1, 1,
-1.567017, 0.5590892, -1.542814, 0, 0, 0, 1, 1,
-1.555215, -0.5605358, -1.910467, 0, 0, 0, 1, 1,
-1.550398, -1.568599, -1.783156, 0, 0, 0, 1, 1,
-1.547122, -0.9934567, -0.1489069, 0, 0, 0, 1, 1,
-1.540933, -0.8180479, -2.115707, 0, 0, 0, 1, 1,
-1.533078, 0.5465286, -2.86099, 1, 1, 1, 1, 1,
-1.532527, 0.3840337, -0.2045575, 1, 1, 1, 1, 1,
-1.516395, 1.666391, -1.920218, 1, 1, 1, 1, 1,
-1.51249, -0.6288313, -1.504237, 1, 1, 1, 1, 1,
-1.453364, 0.5946565, -1.356107, 1, 1, 1, 1, 1,
-1.451743, 0.762071, -1.538369, 1, 1, 1, 1, 1,
-1.440992, -0.1702293, -0.3790268, 1, 1, 1, 1, 1,
-1.438355, 0.2943944, -2.863893, 1, 1, 1, 1, 1,
-1.434784, 0.3585984, -0.8541657, 1, 1, 1, 1, 1,
-1.432722, -1.575881, -2.161157, 1, 1, 1, 1, 1,
-1.42232, 1.586234, -0.8732417, 1, 1, 1, 1, 1,
-1.420769, -0.4218133, -2.457531, 1, 1, 1, 1, 1,
-1.417885, -1.225533, -2.252996, 1, 1, 1, 1, 1,
-1.412661, 0.5469409, -0.166559, 1, 1, 1, 1, 1,
-1.41106, 0.5278301, -4.09152, 1, 1, 1, 1, 1,
-1.402458, -1.900361, -2.248738, 0, 0, 1, 1, 1,
-1.40017, 0.3629415, -3.595376, 1, 0, 0, 1, 1,
-1.395643, 1.383487, -0.8959062, 1, 0, 0, 1, 1,
-1.389989, -0.8083622, -1.228714, 1, 0, 0, 1, 1,
-1.383975, -1.11849, -2.952412, 1, 0, 0, 1, 1,
-1.380117, -0.9624771, -1.975846, 1, 0, 0, 1, 1,
-1.373603, 0.2573215, -1.456985, 0, 0, 0, 1, 1,
-1.364499, 1.19979, -1.50707, 0, 0, 0, 1, 1,
-1.362276, -1.427425, -0.6234561, 0, 0, 0, 1, 1,
-1.361718, 0.5052708, -1.851042, 0, 0, 0, 1, 1,
-1.358287, 0.5847705, -0.6809534, 0, 0, 0, 1, 1,
-1.353107, 0.021572, -1.092478, 0, 0, 0, 1, 1,
-1.349477, 0.4973363, -0.4914887, 0, 0, 0, 1, 1,
-1.347562, -1.288183, -4.518204, 1, 1, 1, 1, 1,
-1.337072, -1.447819, -1.383011, 1, 1, 1, 1, 1,
-1.333925, -0.5452775, -2.369473, 1, 1, 1, 1, 1,
-1.333878, 0.4805026, -1.622736, 1, 1, 1, 1, 1,
-1.333871, -0.9364457, -3.378685, 1, 1, 1, 1, 1,
-1.328004, -0.5261717, -3.0653, 1, 1, 1, 1, 1,
-1.326444, 0.3345362, 0.04201322, 1, 1, 1, 1, 1,
-1.323006, -0.2032881, -0.2383767, 1, 1, 1, 1, 1,
-1.322361, 0.08616536, -2.84677, 1, 1, 1, 1, 1,
-1.318889, -0.005631689, -1.44469, 1, 1, 1, 1, 1,
-1.304334, 0.5415857, -0.08603536, 1, 1, 1, 1, 1,
-1.297485, 1.079286, -1.263833, 1, 1, 1, 1, 1,
-1.292873, 0.2699927, 0.1552394, 1, 1, 1, 1, 1,
-1.270104, -0.8156536, -0.5621076, 1, 1, 1, 1, 1,
-1.263063, 1.853904, -2.231549, 1, 1, 1, 1, 1,
-1.256617, -1.012267, -2.89651, 0, 0, 1, 1, 1,
-1.254333, -1.592591, -1.524634, 1, 0, 0, 1, 1,
-1.252325, 0.3579428, -0.8693527, 1, 0, 0, 1, 1,
-1.249972, -0.1383894, -2.220639, 1, 0, 0, 1, 1,
-1.239336, 0.4495017, -0.6165813, 1, 0, 0, 1, 1,
-1.237637, -0.03506447, -3.085762, 1, 0, 0, 1, 1,
-1.21881, -1.477383, -1.455532, 0, 0, 0, 1, 1,
-1.218548, 2.22585, -0.8153061, 0, 0, 0, 1, 1,
-1.214825, -2.283986, -3.388804, 0, 0, 0, 1, 1,
-1.21109, 1.456437, 1.150182, 0, 0, 0, 1, 1,
-1.208505, 0.09912231, -2.009099, 0, 0, 0, 1, 1,
-1.208372, -0.3833036, -2.684223, 0, 0, 0, 1, 1,
-1.203412, 0.9355164, -1.646644, 0, 0, 0, 1, 1,
-1.193593, -0.07301052, -0.5098881, 1, 1, 1, 1, 1,
-1.192789, 0.8005454, -2.457771, 1, 1, 1, 1, 1,
-1.1885, -0.1255558, -3.029795, 1, 1, 1, 1, 1,
-1.186251, -0.2197306, -0.7980402, 1, 1, 1, 1, 1,
-1.185137, -0.8967895, -0.5015246, 1, 1, 1, 1, 1,
-1.185022, 0.6260357, -2.247267, 1, 1, 1, 1, 1,
-1.18085, -2.614246, -1.713199, 1, 1, 1, 1, 1,
-1.170009, -0.1957056, -0.5707951, 1, 1, 1, 1, 1,
-1.164106, 0.4290661, -0.4148311, 1, 1, 1, 1, 1,
-1.159359, 1.509194, -0.2321453, 1, 1, 1, 1, 1,
-1.154425, -0.5772977, -2.01813, 1, 1, 1, 1, 1,
-1.15011, 0.315049, -0.4562235, 1, 1, 1, 1, 1,
-1.136745, -1.020281, -0.9083697, 1, 1, 1, 1, 1,
-1.135464, 0.5872639, -0.7833984, 1, 1, 1, 1, 1,
-1.133917, -0.05168214, 0.5460156, 1, 1, 1, 1, 1,
-1.133317, -0.07514338, -2.021444, 0, 0, 1, 1, 1,
-1.128768, 1.679994, -1.337125, 1, 0, 0, 1, 1,
-1.115671, -1.516589, -2.279891, 1, 0, 0, 1, 1,
-1.114944, -1.53222, -2.3579, 1, 0, 0, 1, 1,
-1.112183, 0.5830982, -0.06809419, 1, 0, 0, 1, 1,
-1.091896, 1.149913, -0.4173816, 1, 0, 0, 1, 1,
-1.086276, -2.089827, -3.002503, 0, 0, 0, 1, 1,
-1.082022, -0.4690115, -1.994388, 0, 0, 0, 1, 1,
-1.079717, 3.295978, -0.2838399, 0, 0, 0, 1, 1,
-1.07475, 1.093533, -0.5586669, 0, 0, 0, 1, 1,
-1.071765, 0.7797736, -2.135211, 0, 0, 0, 1, 1,
-1.070996, -1.227443, -1.16472, 0, 0, 0, 1, 1,
-1.070266, 0.8556347, -3.177804, 0, 0, 0, 1, 1,
-1.064596, 2.057702, -1.735252, 1, 1, 1, 1, 1,
-1.060465, 0.0007723787, -0.8755314, 1, 1, 1, 1, 1,
-1.060433, 0.9108334, 0.5049664, 1, 1, 1, 1, 1,
-1.058892, 0.3539731, -2.173229, 1, 1, 1, 1, 1,
-1.055159, -0.903891, -1.615219, 1, 1, 1, 1, 1,
-1.051827, 1.19537, -0.3638523, 1, 1, 1, 1, 1,
-1.048933, -1.905004, -3.109721, 1, 1, 1, 1, 1,
-1.041141, 0.4837907, -1.463055, 1, 1, 1, 1, 1,
-1.034822, -1.513796, -2.513001, 1, 1, 1, 1, 1,
-1.024792, -1.122913, -4.14975, 1, 1, 1, 1, 1,
-1.003112, 2.36497, -2.38329, 1, 1, 1, 1, 1,
-0.9932551, 1.203291, -1.964379, 1, 1, 1, 1, 1,
-0.9844155, 0.9373416, 0.2715142, 1, 1, 1, 1, 1,
-0.9832193, -2.753855, -3.100246, 1, 1, 1, 1, 1,
-0.981171, 0.4514561, -1.473714, 1, 1, 1, 1, 1,
-0.9702723, 1.310355, -1.037283, 0, 0, 1, 1, 1,
-0.9689725, 0.05825247, -2.63506, 1, 0, 0, 1, 1,
-0.9685982, 0.4943379, 0.3050652, 1, 0, 0, 1, 1,
-0.960059, -0.1401139, -1.333241, 1, 0, 0, 1, 1,
-0.958073, -1.001996, -2.442694, 1, 0, 0, 1, 1,
-0.9523036, -0.4305142, -1.19858, 1, 0, 0, 1, 1,
-0.946844, -2.374455, -2.685194, 0, 0, 0, 1, 1,
-0.9458187, 0.8814892, -0.6150755, 0, 0, 0, 1, 1,
-0.9414529, 0.3137708, -1.491567, 0, 0, 0, 1, 1,
-0.9296236, 1.949974, -0.1912219, 0, 0, 0, 1, 1,
-0.9182581, -1.715828, -3.402118, 0, 0, 0, 1, 1,
-0.9158136, -0.9878417, -1.566625, 0, 0, 0, 1, 1,
-0.9131644, 0.9185756, 0.04713173, 0, 0, 0, 1, 1,
-0.9098314, 0.03949708, -1.373436, 1, 1, 1, 1, 1,
-0.9073528, -2.147332, -2.622905, 1, 1, 1, 1, 1,
-0.9008493, -1.767665, -2.577477, 1, 1, 1, 1, 1,
-0.9006178, 0.3431458, -1.099988, 1, 1, 1, 1, 1,
-0.8982426, 0.04682864, -1.174634, 1, 1, 1, 1, 1,
-0.8980116, -0.05350142, -1.587261, 1, 1, 1, 1, 1,
-0.8943361, -0.108532, -2.479139, 1, 1, 1, 1, 1,
-0.8898438, -1.708921, -2.276688, 1, 1, 1, 1, 1,
-0.8856701, -0.05966594, -1.116883, 1, 1, 1, 1, 1,
-0.8836668, -0.6082532, -0.7316119, 1, 1, 1, 1, 1,
-0.8674639, 0.2670969, -0.581346, 1, 1, 1, 1, 1,
-0.8614196, -1.031536, -0.7751601, 1, 1, 1, 1, 1,
-0.8611917, 0.6206425, -0.568986, 1, 1, 1, 1, 1,
-0.859109, 0.4554627, -1.547962, 1, 1, 1, 1, 1,
-0.8544974, 0.3133278, -1.837222, 1, 1, 1, 1, 1,
-0.849798, -2.129455, -2.213071, 0, 0, 1, 1, 1,
-0.8466538, 0.09436017, -2.562477, 1, 0, 0, 1, 1,
-0.8451383, 0.9582758, -0.5035279, 1, 0, 0, 1, 1,
-0.8396482, -0.4482417, -3.081778, 1, 0, 0, 1, 1,
-0.8377079, 0.23598, -1.358476, 1, 0, 0, 1, 1,
-0.8374801, -0.5889081, -2.6535, 1, 0, 0, 1, 1,
-0.8329026, 0.9068829, -1.057086, 0, 0, 0, 1, 1,
-0.8294501, 0.5953318, -1.282942, 0, 0, 0, 1, 1,
-0.8289098, 1.047583, -0.8107918, 0, 0, 0, 1, 1,
-0.8219846, -0.3182192, -1.55446, 0, 0, 0, 1, 1,
-0.8212249, -0.06304006, -3.334571, 0, 0, 0, 1, 1,
-0.8199045, -1.600127, -3.441539, 0, 0, 0, 1, 1,
-0.8167662, 1.606778, -1.034979, 0, 0, 0, 1, 1,
-0.8141112, -0.09220228, -1.359196, 1, 1, 1, 1, 1,
-0.8126054, 1.089356, 1.312732, 1, 1, 1, 1, 1,
-0.8112701, 0.6743984, 0.7985645, 1, 1, 1, 1, 1,
-0.8100193, 0.8049974, -0.4627377, 1, 1, 1, 1, 1,
-0.7997347, 0.3653792, -1.321339, 1, 1, 1, 1, 1,
-0.7974653, 0.06421503, -1.364949, 1, 1, 1, 1, 1,
-0.7941348, 0.8968405, -2.404108, 1, 1, 1, 1, 1,
-0.7881421, 2.082468, 0.7289928, 1, 1, 1, 1, 1,
-0.780636, 0.1278234, -1.362992, 1, 1, 1, 1, 1,
-0.7761241, 0.9238206, -1.998804, 1, 1, 1, 1, 1,
-0.774524, -0.1136425, -2.339631, 1, 1, 1, 1, 1,
-0.7744595, 0.3185453, -2.242403, 1, 1, 1, 1, 1,
-0.7740123, -0.7231269, -3.330878, 1, 1, 1, 1, 1,
-0.7681417, -0.8201112, -5.169416, 1, 1, 1, 1, 1,
-0.7653001, -0.9630449, -1.838446, 1, 1, 1, 1, 1,
-0.7618875, -1.430013, -3.987526, 0, 0, 1, 1, 1,
-0.7617909, 0.07012203, -1.354754, 1, 0, 0, 1, 1,
-0.7606593, 1.610421, -1.934788, 1, 0, 0, 1, 1,
-0.756067, 0.04605028, -0.7544774, 1, 0, 0, 1, 1,
-0.7526823, 1.301888, -0.005972629, 1, 0, 0, 1, 1,
-0.7476208, -0.9726983, -2.265605, 1, 0, 0, 1, 1,
-0.7475076, -1.754444, -3.442479, 0, 0, 0, 1, 1,
-0.7412398, 0.4489579, -0.6163224, 0, 0, 0, 1, 1,
-0.7376536, -0.3268915, -2.212169, 0, 0, 0, 1, 1,
-0.7376295, -0.06736534, -2.051361, 0, 0, 0, 1, 1,
-0.7357979, 0.2344431, -1.214514, 0, 0, 0, 1, 1,
-0.7344938, -0.4258457, -3.621119, 0, 0, 0, 1, 1,
-0.7228908, -0.8748499, -2.658205, 0, 0, 0, 1, 1,
-0.7223255, -0.3247961, -2.628947, 1, 1, 1, 1, 1,
-0.7222121, -0.6259962, -2.619599, 1, 1, 1, 1, 1,
-0.7182806, -0.1188304, -2.192027, 1, 1, 1, 1, 1,
-0.7140145, -1.290118, -2.377146, 1, 1, 1, 1, 1,
-0.7064034, 0.0307725, -1.939358, 1, 1, 1, 1, 1,
-0.7018372, 0.2429322, -0.9489964, 1, 1, 1, 1, 1,
-0.7017511, 0.6880708, -0.4123414, 1, 1, 1, 1, 1,
-0.7016374, -0.04308167, -1.005645, 1, 1, 1, 1, 1,
-0.6924948, 0.4003336, -0.8122342, 1, 1, 1, 1, 1,
-0.6905156, 1.153003, 0.4070857, 1, 1, 1, 1, 1,
-0.6865429, 0.1704985, -1.252773, 1, 1, 1, 1, 1,
-0.6837659, 0.4282966, -1.559298, 1, 1, 1, 1, 1,
-0.678334, -0.04468009, -0.2070999, 1, 1, 1, 1, 1,
-0.6781086, -0.1349606, 0.1120967, 1, 1, 1, 1, 1,
-0.6726946, -0.2539001, -0.6312623, 1, 1, 1, 1, 1,
-0.669633, -0.5607373, -3.836582, 0, 0, 1, 1, 1,
-0.6676697, -0.2551509, -2.322646, 1, 0, 0, 1, 1,
-0.6674536, -0.09642863, 0.2995078, 1, 0, 0, 1, 1,
-0.6639416, 0.07739121, -1.481164, 1, 0, 0, 1, 1,
-0.6632256, 0.4320516, -0.7727987, 1, 0, 0, 1, 1,
-0.6586881, -1.827628, -3.23125, 1, 0, 0, 1, 1,
-0.6577694, -0.9265215, -3.592557, 0, 0, 0, 1, 1,
-0.6484121, -0.3872996, -1.215665, 0, 0, 0, 1, 1,
-0.6359527, -1.151094, -2.647896, 0, 0, 0, 1, 1,
-0.63469, -0.6742152, -2.122758, 0, 0, 0, 1, 1,
-0.6344326, 0.4964058, -2.725804, 0, 0, 0, 1, 1,
-0.6282114, -0.4489893, -2.957209, 0, 0, 0, 1, 1,
-0.6281212, 2.143559, -2.000952, 0, 0, 0, 1, 1,
-0.6263621, -0.3162225, -1.594533, 1, 1, 1, 1, 1,
-0.6260796, 1.56345, 0.5438281, 1, 1, 1, 1, 1,
-0.6245952, 0.3262419, -1.601294, 1, 1, 1, 1, 1,
-0.6235638, 0.9976498, -1.366035, 1, 1, 1, 1, 1,
-0.6226446, -0.1275525, -1.10359, 1, 1, 1, 1, 1,
-0.6221802, -0.2369375, -1.487455, 1, 1, 1, 1, 1,
-0.6219363, 0.4108886, -2.43097, 1, 1, 1, 1, 1,
-0.6214099, -0.8143451, -2.764361, 1, 1, 1, 1, 1,
-0.6195985, 0.1144595, -1.259712, 1, 1, 1, 1, 1,
-0.6094703, -0.2964814, -1.339641, 1, 1, 1, 1, 1,
-0.6084701, 1.356206, 1.550287, 1, 1, 1, 1, 1,
-0.6026934, -0.440871, -2.530019, 1, 1, 1, 1, 1,
-0.600343, -0.3468724, -1.73316, 1, 1, 1, 1, 1,
-0.5983056, 0.2226089, -1.380135, 1, 1, 1, 1, 1,
-0.5955258, 0.3190185, -1.043616, 1, 1, 1, 1, 1,
-0.5936806, -1.587294, -3.749353, 0, 0, 1, 1, 1,
-0.5789765, -0.3435111, -1.921007, 1, 0, 0, 1, 1,
-0.5787875, 0.1314471, -1.789069, 1, 0, 0, 1, 1,
-0.5767115, 0.5887631, -1.562592, 1, 0, 0, 1, 1,
-0.5700685, 1.606808, -0.09793312, 1, 0, 0, 1, 1,
-0.5662336, 1.431843, -0.331349, 1, 0, 0, 1, 1,
-0.5658364, -0.3482146, -1.828704, 0, 0, 0, 1, 1,
-0.5624716, 1.536462, 0.5088608, 0, 0, 0, 1, 1,
-0.5611221, -0.06188581, -1.209798, 0, 0, 0, 1, 1,
-0.5608653, -0.6502868, -3.744746, 0, 0, 0, 1, 1,
-0.5579726, 1.580057, -0.4203093, 0, 0, 0, 1, 1,
-0.5569364, -1.782668, -3.867599, 0, 0, 0, 1, 1,
-0.5537473, 0.05895892, -1.969495, 0, 0, 0, 1, 1,
-0.5504302, 0.9409899, -0.2186844, 1, 1, 1, 1, 1,
-0.5361696, 0.3688574, -0.5148931, 1, 1, 1, 1, 1,
-0.5320833, 2.129986, -2.408757, 1, 1, 1, 1, 1,
-0.5249165, 1.035005, -0.9941064, 1, 1, 1, 1, 1,
-0.5203139, 0.6227983, -0.08618256, 1, 1, 1, 1, 1,
-0.519551, 0.603398, -1.787243, 1, 1, 1, 1, 1,
-0.5191548, -0.87583, -2.880029, 1, 1, 1, 1, 1,
-0.5180021, 0.2681046, -2.843204, 1, 1, 1, 1, 1,
-0.515195, 0.8396661, -0.5457779, 1, 1, 1, 1, 1,
-0.5150909, -1.202185, -2.420221, 1, 1, 1, 1, 1,
-0.5148969, 1.903241, 0.8598573, 1, 1, 1, 1, 1,
-0.5131523, -0.9745693, -3.047591, 1, 1, 1, 1, 1,
-0.5099517, 0.4586342, -1.581203, 1, 1, 1, 1, 1,
-0.5082496, -0.5353997, -2.445479, 1, 1, 1, 1, 1,
-0.5081379, 0.3058567, -2.113985, 1, 1, 1, 1, 1,
-0.5058382, 1.197163, 0.2817795, 0, 0, 1, 1, 1,
-0.5037996, 0.9477845, -0.7796574, 1, 0, 0, 1, 1,
-0.5008285, -0.5605881, -1.545173, 1, 0, 0, 1, 1,
-0.4986959, 0.5340586, 0.9319316, 1, 0, 0, 1, 1,
-0.4976497, 1.641174, 0.006054159, 1, 0, 0, 1, 1,
-0.4935703, 2.257329, -2.746727, 1, 0, 0, 1, 1,
-0.4932746, -2.410757, -4.404296, 0, 0, 0, 1, 1,
-0.4930504, -0.9555831, -2.909169, 0, 0, 0, 1, 1,
-0.4912799, 0.7507922, -1.699525, 0, 0, 0, 1, 1,
-0.4884233, -1.962696, -1.791976, 0, 0, 0, 1, 1,
-0.486856, 0.8060938, -1.46107, 0, 0, 0, 1, 1,
-0.4852577, -0.4039589, -3.462738, 0, 0, 0, 1, 1,
-0.4825435, -0.9444826, -1.287897, 0, 0, 0, 1, 1,
-0.4815833, -0.5917569, -0.1951934, 1, 1, 1, 1, 1,
-0.4764615, 0.1736248, -2.219407, 1, 1, 1, 1, 1,
-0.4672218, -1.050626, -1.697116, 1, 1, 1, 1, 1,
-0.4628897, 0.2096049, -0.5750053, 1, 1, 1, 1, 1,
-0.4595484, 0.1622017, -1.214322, 1, 1, 1, 1, 1,
-0.4586389, 0.1905526, -0.08165665, 1, 1, 1, 1, 1,
-0.4565945, -0.06666587, -0.4867561, 1, 1, 1, 1, 1,
-0.4563045, 1.041213, -0.7274124, 1, 1, 1, 1, 1,
-0.4561245, -0.6922573, -0.8877944, 1, 1, 1, 1, 1,
-0.4555019, 0.2467469, -0.7160808, 1, 1, 1, 1, 1,
-0.4491693, 0.4736207, -0.2308388, 1, 1, 1, 1, 1,
-0.4394491, 0.6786731, 0.3023772, 1, 1, 1, 1, 1,
-0.4373386, -0.4554713, -1.520183, 1, 1, 1, 1, 1,
-0.436323, -0.07558631, -3.363288, 1, 1, 1, 1, 1,
-0.4359478, 0.05056981, -0.8939583, 1, 1, 1, 1, 1,
-0.4209455, 0.8024381, 0.4420656, 0, 0, 1, 1, 1,
-0.4168726, 0.03071698, -0.5088173, 1, 0, 0, 1, 1,
-0.4164325, -1.444085, -2.973098, 1, 0, 0, 1, 1,
-0.412883, -0.2643917, -2.714527, 1, 0, 0, 1, 1,
-0.4113989, -0.6501761, -2.080603, 1, 0, 0, 1, 1,
-0.4050739, 0.231955, -1.517333, 1, 0, 0, 1, 1,
-0.4050129, 1.021788, 0.1018919, 0, 0, 0, 1, 1,
-0.3933188, 0.8505896, -1.810859, 0, 0, 0, 1, 1,
-0.3932235, -1.39477, -3.301498, 0, 0, 0, 1, 1,
-0.392672, 1.322879, -0.5572127, 0, 0, 0, 1, 1,
-0.3895797, -0.6446092, -3.907192, 0, 0, 0, 1, 1,
-0.3854512, -0.2263027, -1.527481, 0, 0, 0, 1, 1,
-0.3836949, -1.343198, -1.236609, 0, 0, 0, 1, 1,
-0.3834627, -0.4713853, -3.727736, 1, 1, 1, 1, 1,
-0.3757606, -1.856133, -3.399582, 1, 1, 1, 1, 1,
-0.3751668, -0.1276462, -1.752717, 1, 1, 1, 1, 1,
-0.37488, 0.4237941, -3.387766, 1, 1, 1, 1, 1,
-0.3727234, 0.1990438, -3.215001, 1, 1, 1, 1, 1,
-0.3723198, -1.915372, -2.331062, 1, 1, 1, 1, 1,
-0.3723092, 0.869123, -0.6503202, 1, 1, 1, 1, 1,
-0.372035, 0.7043927, -0.4125078, 1, 1, 1, 1, 1,
-0.3718463, 1.08773, -2.119369, 1, 1, 1, 1, 1,
-0.3709234, 1.501161, 1.3579, 1, 1, 1, 1, 1,
-0.3688563, -0.6213325, -3.10901, 1, 1, 1, 1, 1,
-0.3660118, -1.390795, -3.275895, 1, 1, 1, 1, 1,
-0.364935, -0.2442833, -3.228858, 1, 1, 1, 1, 1,
-0.3649194, -0.262969, -1.717232, 1, 1, 1, 1, 1,
-0.363927, -0.2882241, -2.688085, 1, 1, 1, 1, 1,
-0.3626898, 0.3506229, -1.216183, 0, 0, 1, 1, 1,
-0.3626091, -2.531338, -4.322069, 1, 0, 0, 1, 1,
-0.3559684, 0.6379651, -1.361025, 1, 0, 0, 1, 1,
-0.3508866, -0.1699889, -5.193996, 1, 0, 0, 1, 1,
-0.3452667, 0.01539718, -0.6829002, 1, 0, 0, 1, 1,
-0.3432417, 0.1708227, -1.140925, 1, 0, 0, 1, 1,
-0.3427109, 2.076661, -0.5132518, 0, 0, 0, 1, 1,
-0.3424365, 0.2611178, -0.1606896, 0, 0, 0, 1, 1,
-0.3414678, -0.2108773, -2.406791, 0, 0, 0, 1, 1,
-0.3405254, -0.8630522, -2.346079, 0, 0, 0, 1, 1,
-0.3399616, 1.208782, 2.212282, 0, 0, 0, 1, 1,
-0.3394197, -0.6804922, -3.648131, 0, 0, 0, 1, 1,
-0.3374301, -0.7551174, -3.017365, 0, 0, 0, 1, 1,
-0.3266324, 0.2029386, -0.09666003, 1, 1, 1, 1, 1,
-0.3258475, -0.3885238, -1.487741, 1, 1, 1, 1, 1,
-0.3218528, 0.7035189, -1.393458, 1, 1, 1, 1, 1,
-0.3185404, 0.8653548, -0.02674517, 1, 1, 1, 1, 1,
-0.3178523, -0.4474589, -1.926121, 1, 1, 1, 1, 1,
-0.3165013, 0.7856665, 0.1165056, 1, 1, 1, 1, 1,
-0.3109472, -0.04830924, -0.6238761, 1, 1, 1, 1, 1,
-0.3102706, 0.7737997, 0.4199369, 1, 1, 1, 1, 1,
-0.3079028, -0.563724, -1.876421, 1, 1, 1, 1, 1,
-0.3068606, -0.4455484, -1.76177, 1, 1, 1, 1, 1,
-0.3055234, -0.4878854, -2.083285, 1, 1, 1, 1, 1,
-0.3034147, 0.5938185, -1.579545, 1, 1, 1, 1, 1,
-0.2968226, 0.3294357, -1.76545, 1, 1, 1, 1, 1,
-0.284507, 0.07948145, -0.3093158, 1, 1, 1, 1, 1,
-0.2838162, -0.8156506, -4.201225, 1, 1, 1, 1, 1,
-0.2835251, -1.525272, -1.412626, 0, 0, 1, 1, 1,
-0.2816962, 0.5931419, -0.5707374, 1, 0, 0, 1, 1,
-0.2815071, 0.09207328, -1.441071, 1, 0, 0, 1, 1,
-0.2748957, -0.1330399, -3.821747, 1, 0, 0, 1, 1,
-0.2725287, -0.6875283, -3.438549, 1, 0, 0, 1, 1,
-0.2721386, 1.094359, -0.6298308, 1, 0, 0, 1, 1,
-0.2704484, -0.2083315, -1.67812, 0, 0, 0, 1, 1,
-0.2699363, 0.2382522, 0.2976052, 0, 0, 0, 1, 1,
-0.2687699, 2.057823, -0.4913612, 0, 0, 0, 1, 1,
-0.2684923, -0.7492191, -3.211509, 0, 0, 0, 1, 1,
-0.2607172, 0.4911262, 0.3328611, 0, 0, 0, 1, 1,
-0.2606632, 2.017657, -1.413331, 0, 0, 0, 1, 1,
-0.2575694, -0.4155142, -3.021384, 0, 0, 0, 1, 1,
-0.2544283, -0.858256, -3.401157, 1, 1, 1, 1, 1,
-0.2518987, -1.195746, -1.508268, 1, 1, 1, 1, 1,
-0.248522, 1.208917, -1.067847, 1, 1, 1, 1, 1,
-0.2466723, -0.04276245, 0.3740737, 1, 1, 1, 1, 1,
-0.2450385, 1.548026, 0.2786823, 1, 1, 1, 1, 1,
-0.2440653, 0.2561586, -1.786115, 1, 1, 1, 1, 1,
-0.242406, 0.7564796, -0.7459443, 1, 1, 1, 1, 1,
-0.2390803, 0.3323081, 1.050876, 1, 1, 1, 1, 1,
-0.2389447, -0.7585418, -3.459484, 1, 1, 1, 1, 1,
-0.2368177, 1.224585, 0.3679893, 1, 1, 1, 1, 1,
-0.23526, 0.179901, -2.493129, 1, 1, 1, 1, 1,
-0.2342399, 0.2938931, 0.1790634, 1, 1, 1, 1, 1,
-0.2312481, -1.697549, -2.963668, 1, 1, 1, 1, 1,
-0.2296495, -1.057083, -3.150522, 1, 1, 1, 1, 1,
-0.2292708, 1.269647, 0.1869701, 1, 1, 1, 1, 1,
-0.2277787, 0.356174, -0.4965849, 0, 0, 1, 1, 1,
-0.2187676, -0.9102933, -1.547005, 1, 0, 0, 1, 1,
-0.2145733, 0.4858291, 0.4573497, 1, 0, 0, 1, 1,
-0.2144334, -2.234125, -3.455753, 1, 0, 0, 1, 1,
-0.2091031, 0.5101022, 0.906181, 1, 0, 0, 1, 1,
-0.2088076, 1.169286, -1.324092, 1, 0, 0, 1, 1,
-0.203697, 0.4870178, 0.2654113, 0, 0, 0, 1, 1,
-0.2019302, 0.6327294, -0.8396339, 0, 0, 0, 1, 1,
-0.1923794, 0.794087, -0.2410715, 0, 0, 0, 1, 1,
-0.191902, 0.995267, 1.053428, 0, 0, 0, 1, 1,
-0.1899265, 0.9318939, 1.095836, 0, 0, 0, 1, 1,
-0.1838254, 0.009662899, -3.180636, 0, 0, 0, 1, 1,
-0.1800544, 1.763011, 0.1221771, 0, 0, 0, 1, 1,
-0.1799754, -0.7375854, -0.9424952, 1, 1, 1, 1, 1,
-0.1788393, 0.565312, -0.122642, 1, 1, 1, 1, 1,
-0.1730703, 0.01636644, -2.604221, 1, 1, 1, 1, 1,
-0.1688189, -0.3947573, -3.631268, 1, 1, 1, 1, 1,
-0.1647686, -0.02467915, -3.001056, 1, 1, 1, 1, 1,
-0.1634165, -0.9049675, -2.242598, 1, 1, 1, 1, 1,
-0.1625578, 1.190007, 2.00036, 1, 1, 1, 1, 1,
-0.1622905, 0.09703463, -1.309766, 1, 1, 1, 1, 1,
-0.1604976, -0.1239264, -2.608656, 1, 1, 1, 1, 1,
-0.1595671, -0.4101565, -2.534604, 1, 1, 1, 1, 1,
-0.1534063, -0.2177232, -2.170858, 1, 1, 1, 1, 1,
-0.1508418, 0.2802202, -0.8599995, 1, 1, 1, 1, 1,
-0.1474061, -0.4218764, -1.791058, 1, 1, 1, 1, 1,
-0.1436005, 1.178163, -0.2674806, 1, 1, 1, 1, 1,
-0.1366061, -0.8214406, -4.00417, 1, 1, 1, 1, 1,
-0.1277022, 1.292333, 0.2167208, 0, 0, 1, 1, 1,
-0.1232854, 0.07965943, 0.3506751, 1, 0, 0, 1, 1,
-0.1170664, 1.93005, -0.2980253, 1, 0, 0, 1, 1,
-0.1150539, 0.4126546, -1.823385, 1, 0, 0, 1, 1,
-0.114757, 0.8966984, 0.7683581, 1, 0, 0, 1, 1,
-0.1132701, -0.8356211, -2.72033, 1, 0, 0, 1, 1,
-0.1115999, -1.017595, -3.307466, 0, 0, 0, 1, 1,
-0.1100922, 1.161172, -0.2221668, 0, 0, 0, 1, 1,
-0.1035287, 1.445111, 0.07210965, 0, 0, 0, 1, 1,
-0.1020159, -0.9873341, -1.64488, 0, 0, 0, 1, 1,
-0.1016721, -3.216343, -3.014031, 0, 0, 0, 1, 1,
-0.1016413, -1.128484, -6.140674, 0, 0, 0, 1, 1,
-0.1016109, 0.5693521, 0.9244788, 0, 0, 0, 1, 1,
-0.1011471, 0.6352298, -1.682617, 1, 1, 1, 1, 1,
-0.1001776, -0.8241329, -2.462061, 1, 1, 1, 1, 1,
-0.09206805, 0.1928257, -0.2259255, 1, 1, 1, 1, 1,
-0.09156191, -1.311371, -3.389946, 1, 1, 1, 1, 1,
-0.0829629, 1.801471, 0.3643343, 1, 1, 1, 1, 1,
-0.07985473, 0.5402452, 0.2719792, 1, 1, 1, 1, 1,
-0.07946785, -0.7675066, -1.046605, 1, 1, 1, 1, 1,
-0.07931134, -1.19823, -3.331983, 1, 1, 1, 1, 1,
-0.0781548, -0.275507, -4.324079, 1, 1, 1, 1, 1,
-0.07422203, 2.46812, -0.9680658, 1, 1, 1, 1, 1,
-0.07135288, -0.279699, -2.257147, 1, 1, 1, 1, 1,
-0.07009121, -0.1658504, -3.758235, 1, 1, 1, 1, 1,
-0.06703019, -1.322188, -4.881677, 1, 1, 1, 1, 1,
-0.06571545, 0.6357243, 1.374086, 1, 1, 1, 1, 1,
-0.06525099, -1.005286, -2.790323, 1, 1, 1, 1, 1,
-0.05453474, 0.2880609, -1.405408, 0, 0, 1, 1, 1,
-0.05214555, -0.1960634, -3.214798, 1, 0, 0, 1, 1,
-0.05120064, -0.1227143, -3.1443, 1, 0, 0, 1, 1,
-0.05054191, -0.6859636, -1.761384, 1, 0, 0, 1, 1,
-0.0504129, 0.2352361, -2.12926, 1, 0, 0, 1, 1,
-0.05037668, -0.8781419, -2.513105, 1, 0, 0, 1, 1,
-0.04686353, 0.1086092, -1.8582, 0, 0, 0, 1, 1,
-0.04162825, 0.2164472, -0.7370522, 0, 0, 0, 1, 1,
-0.03617351, 2.910212, -0.3998819, 0, 0, 0, 1, 1,
-0.02799395, 0.7995842, -0.06164358, 0, 0, 0, 1, 1,
-0.02103473, -1.531436, -3.122286, 0, 0, 0, 1, 1,
-0.019301, -0.1548952, -3.596619, 0, 0, 0, 1, 1,
-0.01638293, -0.8192016, -2.993813, 0, 0, 0, 1, 1,
-0.01433882, -1.295482, -3.455907, 1, 1, 1, 1, 1,
-0.01393266, 0.6157611, -0.4253189, 1, 1, 1, 1, 1,
-0.0121972, 0.7891148, 2.007279, 1, 1, 1, 1, 1,
-0.01144577, -1.139711, -1.83407, 1, 1, 1, 1, 1,
-0.009697859, 0.5008627, -0.8729489, 1, 1, 1, 1, 1,
-0.007774221, 0.6257329, -0.3630281, 1, 1, 1, 1, 1,
-0.006541088, -0.3334615, -2.420912, 1, 1, 1, 1, 1,
-0.003337895, -0.4029311, -2.789203, 1, 1, 1, 1, 1,
-0.002200487, -0.3977366, -3.946819, 1, 1, 1, 1, 1,
0.000761649, -0.5367333, 2.300326, 1, 1, 1, 1, 1,
0.003009723, -1.46166, 4.524001, 1, 1, 1, 1, 1,
0.006157844, -1.392499, 2.643779, 1, 1, 1, 1, 1,
0.01111759, 0.4791805, -1.292011, 1, 1, 1, 1, 1,
0.01378732, 0.008347639, 0.1104354, 1, 1, 1, 1, 1,
0.01464261, 1.088506, -1.006353, 1, 1, 1, 1, 1,
0.01635397, 1.127281, 1.191815, 0, 0, 1, 1, 1,
0.01765264, 0.2599821, 1.13037, 1, 0, 0, 1, 1,
0.02534377, -0.811381, 2.446506, 1, 0, 0, 1, 1,
0.02791756, -0.5922711, 2.5202, 1, 0, 0, 1, 1,
0.02906045, 1.604001, 1.025624, 1, 0, 0, 1, 1,
0.03173088, -0.5461608, 4.072912, 1, 0, 0, 1, 1,
0.03271898, -0.5793889, 4.267826, 0, 0, 0, 1, 1,
0.03702597, -0.07121215, 2.694861, 0, 0, 0, 1, 1,
0.03836999, -0.6541622, 1.635947, 0, 0, 0, 1, 1,
0.04106312, -1.567748, 3.822118, 0, 0, 0, 1, 1,
0.04771031, 0.07412688, 0.5296155, 0, 0, 0, 1, 1,
0.05872931, 1.970847, 0.3837368, 0, 0, 0, 1, 1,
0.06507806, 1.023416, 0.183777, 0, 0, 0, 1, 1,
0.06657001, 2.563378, 1.257906, 1, 1, 1, 1, 1,
0.06684379, 1.641027, -1.512057, 1, 1, 1, 1, 1,
0.06702661, -0.1588868, 1.825392, 1, 1, 1, 1, 1,
0.06850667, 0.5989473, 0.1994841, 1, 1, 1, 1, 1,
0.06893134, -0.1063953, 3.948116, 1, 1, 1, 1, 1,
0.07090969, -1.04407, 3.398738, 1, 1, 1, 1, 1,
0.07100478, 1.636401, 1.856075, 1, 1, 1, 1, 1,
0.0799289, 0.1744068, -0.7564079, 1, 1, 1, 1, 1,
0.08492269, -1.886796, 3.5487, 1, 1, 1, 1, 1,
0.08609887, -0.2573828, 2.020374, 1, 1, 1, 1, 1,
0.09350833, -0.7753619, 3.58547, 1, 1, 1, 1, 1,
0.09807428, 0.39576, 0.1013952, 1, 1, 1, 1, 1,
0.1005733, -0.9951206, 2.965054, 1, 1, 1, 1, 1,
0.1021378, 0.660446, -0.7388706, 1, 1, 1, 1, 1,
0.1027287, 0.2253521, 0.243876, 1, 1, 1, 1, 1,
0.1040579, -0.358449, 3.122658, 0, 0, 1, 1, 1,
0.1075169, 1.377436, -0.3930408, 1, 0, 0, 1, 1,
0.1130738, 0.2368188, -1.043397, 1, 0, 0, 1, 1,
0.1144186, 1.5505, 0.9233871, 1, 0, 0, 1, 1,
0.1211195, 0.5205694, 1.972819, 1, 0, 0, 1, 1,
0.1216462, -1.577407, 3.480692, 1, 0, 0, 1, 1,
0.1226418, -0.4894808, 1.703497, 0, 0, 0, 1, 1,
0.1300988, -1.88716, 2.692384, 0, 0, 0, 1, 1,
0.131133, -0.07485094, 0.5734761, 0, 0, 0, 1, 1,
0.1341423, -0.3913192, 3.112318, 0, 0, 0, 1, 1,
0.1390768, -0.124562, 3.873023, 0, 0, 0, 1, 1,
0.1531157, 1.752354, 0.01359575, 0, 0, 0, 1, 1,
0.1545519, 0.3248383, 1.677484, 0, 0, 0, 1, 1,
0.1573157, -1.63947, 1.992256, 1, 1, 1, 1, 1,
0.160537, 0.3264232, 0.6883126, 1, 1, 1, 1, 1,
0.1678279, 0.2425387, 0.6331118, 1, 1, 1, 1, 1,
0.1689016, 0.7676087, 2.986505, 1, 1, 1, 1, 1,
0.1706572, -1.796069, 2.569569, 1, 1, 1, 1, 1,
0.1714874, 0.6993172, 0.9895623, 1, 1, 1, 1, 1,
0.1737554, -0.5988134, 3.512127, 1, 1, 1, 1, 1,
0.1757555, -0.2486613, 2.365198, 1, 1, 1, 1, 1,
0.1777712, 1.444368, -0.6489944, 1, 1, 1, 1, 1,
0.181065, 0.3915377, -0.2188506, 1, 1, 1, 1, 1,
0.1818454, 0.9152719, -1.324196, 1, 1, 1, 1, 1,
0.1830896, 0.935433, 1.60506, 1, 1, 1, 1, 1,
0.1842429, -0.4165765, 3.024044, 1, 1, 1, 1, 1,
0.1917686, -0.4003155, 3.218707, 1, 1, 1, 1, 1,
0.1934117, -0.252209, 1.951289, 1, 1, 1, 1, 1,
0.195045, 0.2419841, 0.3414738, 0, 0, 1, 1, 1,
0.1962759, 0.3996582, 0.08973106, 1, 0, 0, 1, 1,
0.1967582, 0.2941785, 1.236666, 1, 0, 0, 1, 1,
0.1998372, -0.7908576, 2.879693, 1, 0, 0, 1, 1,
0.2027539, 1.379837, 0.9250674, 1, 0, 0, 1, 1,
0.2032977, 2.049942, 0.9526517, 1, 0, 0, 1, 1,
0.2043189, 1.676716, -0.4623821, 0, 0, 0, 1, 1,
0.206164, 0.3861519, 0.07767026, 0, 0, 0, 1, 1,
0.2067087, -1.048654, 2.792491, 0, 0, 0, 1, 1,
0.2080306, -0.4414, 2.631319, 0, 0, 0, 1, 1,
0.2088357, -0.9341504, 2.253175, 0, 0, 0, 1, 1,
0.210197, -1.454221, 3.518442, 0, 0, 0, 1, 1,
0.2132157, 0.3275859, 1.651581, 0, 0, 0, 1, 1,
0.2150015, -0.8387623, 4.249738, 1, 1, 1, 1, 1,
0.2188678, 0.2480139, 0.2937693, 1, 1, 1, 1, 1,
0.2222045, -1.12321, 3.477101, 1, 1, 1, 1, 1,
0.2225086, 0.04205953, 1.909167, 1, 1, 1, 1, 1,
0.223904, 1.511191, -1.002023, 1, 1, 1, 1, 1,
0.2278835, -0.5581523, 3.577534, 1, 1, 1, 1, 1,
0.2281121, 0.01624434, 2.689605, 1, 1, 1, 1, 1,
0.2296046, 0.4428829, 0.8800548, 1, 1, 1, 1, 1,
0.234264, -0.8131199, 1.487919, 1, 1, 1, 1, 1,
0.2343479, -1.507835, 4.262509, 1, 1, 1, 1, 1,
0.2346688, -1.31856, 2.823087, 1, 1, 1, 1, 1,
0.2354233, -0.696258, 2.892473, 1, 1, 1, 1, 1,
0.2373439, 0.3132892, 0.2558708, 1, 1, 1, 1, 1,
0.2375366, 0.406632, -0.7200976, 1, 1, 1, 1, 1,
0.2409962, -0.080334, 2.486289, 1, 1, 1, 1, 1,
0.2423404, 0.32132, 1.31858, 0, 0, 1, 1, 1,
0.2424981, 0.5080071, -1.74288, 1, 0, 0, 1, 1,
0.2428183, 2.336684, 1.595921, 1, 0, 0, 1, 1,
0.2477438, 1.552561, 2.26767, 1, 0, 0, 1, 1,
0.2482023, 0.6675381, -0.1054584, 1, 0, 0, 1, 1,
0.249393, 0.6047745, 0.5070828, 1, 0, 0, 1, 1,
0.2511905, 0.6018246, 1.081335, 0, 0, 0, 1, 1,
0.2521635, -0.1068721, 2.853971, 0, 0, 0, 1, 1,
0.2525134, -1.813732, 4.227265, 0, 0, 0, 1, 1,
0.253528, 0.02304843, 1.719205, 0, 0, 0, 1, 1,
0.2541648, 0.5767056, -0.01376833, 0, 0, 0, 1, 1,
0.2582132, 1.420812, -0.1384402, 0, 0, 0, 1, 1,
0.2622864, -0.7349365, 2.185198, 0, 0, 0, 1, 1,
0.2634599, -0.6842589, 2.592798, 1, 1, 1, 1, 1,
0.2649144, 0.2092762, 0.7856928, 1, 1, 1, 1, 1,
0.2662676, 0.2032671, 1.364792, 1, 1, 1, 1, 1,
0.2692868, -0.4395772, 3.160589, 1, 1, 1, 1, 1,
0.2716719, -0.9430379, 4.212554, 1, 1, 1, 1, 1,
0.2726952, 0.8062556, -0.02577746, 1, 1, 1, 1, 1,
0.2731857, -0.859392, 2.586937, 1, 1, 1, 1, 1,
0.2763624, -0.4511877, 2.123166, 1, 1, 1, 1, 1,
0.2775317, -0.8241414, 3.149814, 1, 1, 1, 1, 1,
0.2775566, -0.2614226, 2.715632, 1, 1, 1, 1, 1,
0.2794181, -0.3077435, 1.704466, 1, 1, 1, 1, 1,
0.2803972, 0.1843198, 1.773975, 1, 1, 1, 1, 1,
0.2815759, 0.6822206, -0.4700317, 1, 1, 1, 1, 1,
0.2842328, 0.05553837, 0.8862569, 1, 1, 1, 1, 1,
0.2862902, -0.2413356, 2.795372, 1, 1, 1, 1, 1,
0.291254, 0.4775944, -1.25211, 0, 0, 1, 1, 1,
0.2934851, -0.5054501, 3.010168, 1, 0, 0, 1, 1,
0.2939379, 1.316022, 0.719586, 1, 0, 0, 1, 1,
0.294338, -1.420562, 3.003742, 1, 0, 0, 1, 1,
0.2943994, -0.248471, 2.038296, 1, 0, 0, 1, 1,
0.2978082, -1.658264, 2.635518, 1, 0, 0, 1, 1,
0.297864, -1.66632, 4.325555, 0, 0, 0, 1, 1,
0.2994214, -0.6267713, 3.812549, 0, 0, 0, 1, 1,
0.3052267, 0.02427706, 0.9824967, 0, 0, 0, 1, 1,
0.3060766, -0.7284799, 3.455023, 0, 0, 0, 1, 1,
0.3067901, 0.906132, 1.740688, 0, 0, 0, 1, 1,
0.3096833, 0.3620492, -0.05371119, 0, 0, 0, 1, 1,
0.3151111, 0.1687859, 0.8797314, 0, 0, 0, 1, 1,
0.3182341, -0.9980702, 2.554411, 1, 1, 1, 1, 1,
0.3216301, 0.9937591, 0.9574535, 1, 1, 1, 1, 1,
0.3220027, 1.303054, 0.8265353, 1, 1, 1, 1, 1,
0.3226283, -1.630857, 3.094655, 1, 1, 1, 1, 1,
0.3254629, -0.7810354, 2.724792, 1, 1, 1, 1, 1,
0.3367106, -0.2483792, 1.957501, 1, 1, 1, 1, 1,
0.3444669, -1.476065, 1.9278, 1, 1, 1, 1, 1,
0.3498919, 0.8679072, 1.227281, 1, 1, 1, 1, 1,
0.3507761, -1.174407, 2.760419, 1, 1, 1, 1, 1,
0.3508478, -1.714889, 2.757484, 1, 1, 1, 1, 1,
0.3524291, 1.763752, -0.4829533, 1, 1, 1, 1, 1,
0.3531114, -0.4780428, 3.62991, 1, 1, 1, 1, 1,
0.3565497, -1.53429, 5.336454, 1, 1, 1, 1, 1,
0.3601835, -0.08744511, 1.480421, 1, 1, 1, 1, 1,
0.3609276, -0.6977974, 1.892424, 1, 1, 1, 1, 1,
0.3627216, -2.227174, 2.851727, 0, 0, 1, 1, 1,
0.3698198, 1.298081, 2.425948, 1, 0, 0, 1, 1,
0.3704408, -2.627931, 3.384695, 1, 0, 0, 1, 1,
0.3735651, 1.891259, 1.010565, 1, 0, 0, 1, 1,
0.3804117, 1.540407, 0.6069517, 1, 0, 0, 1, 1,
0.3820768, -1.784384, 3.230518, 1, 0, 0, 1, 1,
0.3865884, 0.5541552, 1.308828, 0, 0, 0, 1, 1,
0.3885769, -0.2721306, 2.951627, 0, 0, 0, 1, 1,
0.3887026, -1.301777, 3.306084, 0, 0, 0, 1, 1,
0.3926001, 0.562226, 0.9747106, 0, 0, 0, 1, 1,
0.3944665, -0.6501138, 1.730383, 0, 0, 0, 1, 1,
0.3961884, -2.078326, 2.003939, 0, 0, 0, 1, 1,
0.4039965, 0.539776, 2.156233, 0, 0, 0, 1, 1,
0.4045808, -0.4998232, 3.233735, 1, 1, 1, 1, 1,
0.4066553, 0.9324294, 1.311749, 1, 1, 1, 1, 1,
0.4071788, 0.5183713, 0.9672189, 1, 1, 1, 1, 1,
0.4098304, 0.4492835, 1.185655, 1, 1, 1, 1, 1,
0.4114901, 0.8509869, -0.02403275, 1, 1, 1, 1, 1,
0.4125649, 0.1836981, 1.502487, 1, 1, 1, 1, 1,
0.4144163, 1.158168, -0.2941155, 1, 1, 1, 1, 1,
0.415225, 0.419378, 1.715116, 1, 1, 1, 1, 1,
0.4168337, 0.1154268, 0.7949646, 1, 1, 1, 1, 1,
0.4201342, -0.45877, 3.68368, 1, 1, 1, 1, 1,
0.4219606, 0.9460465, -0.1682668, 1, 1, 1, 1, 1,
0.422267, 0.3712141, 0.2411007, 1, 1, 1, 1, 1,
0.4284446, -0.9663467, 3.543367, 1, 1, 1, 1, 1,
0.4288515, -0.9273189, 1.988892, 1, 1, 1, 1, 1,
0.4320202, 0.6161991, -0.1370548, 1, 1, 1, 1, 1,
0.4335857, 0.7017955, -0.6917166, 0, 0, 1, 1, 1,
0.4350748, 0.2378359, 1.645153, 1, 0, 0, 1, 1,
0.4350981, -0.7016311, 0.890488, 1, 0, 0, 1, 1,
0.4383397, 0.4848237, -0.02540946, 1, 0, 0, 1, 1,
0.4407836, 2.231814, 0.9432167, 1, 0, 0, 1, 1,
0.4476512, -0.1104408, 3.549578, 1, 0, 0, 1, 1,
0.4485111, -1.706865, 1.568146, 0, 0, 0, 1, 1,
0.4491849, 1.802517, 0.4491996, 0, 0, 0, 1, 1,
0.4530096, 0.2910246, 0.5568552, 0, 0, 0, 1, 1,
0.4576017, 0.1391564, 0.3071632, 0, 0, 0, 1, 1,
0.4703105, -0.2697462, 1.893765, 0, 0, 0, 1, 1,
0.4798448, -0.1455091, 2.987186, 0, 0, 0, 1, 1,
0.4806262, 0.01222876, 0.8568093, 0, 0, 0, 1, 1,
0.480696, 1.097314, 2.032195, 1, 1, 1, 1, 1,
0.4836507, -0.1992493, 3.586909, 1, 1, 1, 1, 1,
0.4836581, 0.9349436, 1.580223, 1, 1, 1, 1, 1,
0.4868511, -2.055939, 1.962231, 1, 1, 1, 1, 1,
0.4873774, 0.2182458, 1.337279, 1, 1, 1, 1, 1,
0.4894428, 1.740033, 0.6076778, 1, 1, 1, 1, 1,
0.4899021, -0.5419725, 0.651146, 1, 1, 1, 1, 1,
0.4946019, 1.036136, 1.788288, 1, 1, 1, 1, 1,
0.4953168, 0.4176904, 2.011964, 1, 1, 1, 1, 1,
0.4958614, 0.8909085, 1.813338, 1, 1, 1, 1, 1,
0.5008581, 1.288494, -0.07298118, 1, 1, 1, 1, 1,
0.5010882, 0.004903244, 1.90923, 1, 1, 1, 1, 1,
0.5047177, -0.2203705, 1.692161, 1, 1, 1, 1, 1,
0.5081505, -1.0395, 1.841644, 1, 1, 1, 1, 1,
0.5111345, 0.2425653, -0.362202, 1, 1, 1, 1, 1,
0.5126377, -3.054923, 4.098913, 0, 0, 1, 1, 1,
0.5153113, -1.071774, 0.8129406, 1, 0, 0, 1, 1,
0.5217052, 1.383849, 0.6083694, 1, 0, 0, 1, 1,
0.5232123, -1.562073, 2.071467, 1, 0, 0, 1, 1,
0.5234879, 0.9967175, 0.4319565, 1, 0, 0, 1, 1,
0.5256759, -0.9172551, 2.823108, 1, 0, 0, 1, 1,
0.5311956, -1.193344, 2.051691, 0, 0, 0, 1, 1,
0.5352593, -0.00872363, 1.163842, 0, 0, 0, 1, 1,
0.5400705, -0.9206185, 2.527903, 0, 0, 0, 1, 1,
0.5441824, -0.2688843, 2.089283, 0, 0, 0, 1, 1,
0.5476086, 1.239642, -0.9329294, 0, 0, 0, 1, 1,
0.5487722, -1.061524, 2.093736, 0, 0, 0, 1, 1,
0.5528286, -0.05724091, -0.09239124, 0, 0, 0, 1, 1,
0.5560104, 0.1034777, 0.07412615, 1, 1, 1, 1, 1,
0.5607705, -1.356624, 2.854011, 1, 1, 1, 1, 1,
0.5640863, -0.3197975, 2.561262, 1, 1, 1, 1, 1,
0.564563, 0.9598371, 0.7538193, 1, 1, 1, 1, 1,
0.5645881, 0.2458688, 2.401052, 1, 1, 1, 1, 1,
0.5661403, 1.097148, 0.7617767, 1, 1, 1, 1, 1,
0.5674059, -1.099289, 3.067487, 1, 1, 1, 1, 1,
0.5728165, 1.139209, -0.5931708, 1, 1, 1, 1, 1,
0.5743417, 0.4998997, 0.4344171, 1, 1, 1, 1, 1,
0.5744351, 0.1186981, 1.760074, 1, 1, 1, 1, 1,
0.5764387, -0.119228, 2.73115, 1, 1, 1, 1, 1,
0.5792704, 1.959503, -1.368372, 1, 1, 1, 1, 1,
0.5852826, -0.08691666, 1.542126, 1, 1, 1, 1, 1,
0.5865772, 0.2790343, 0.6473234, 1, 1, 1, 1, 1,
0.5877941, -0.8950117, 3.02096, 1, 1, 1, 1, 1,
0.5957608, 1.544381, 1.326734, 0, 0, 1, 1, 1,
0.601936, 0.4175627, -1.746425, 1, 0, 0, 1, 1,
0.6054215, -0.4227537, 2.676709, 1, 0, 0, 1, 1,
0.6103378, -0.4429022, 2.25058, 1, 0, 0, 1, 1,
0.6106016, 1.333915, 0.1227342, 1, 0, 0, 1, 1,
0.6126493, -1.922584, 2.001623, 1, 0, 0, 1, 1,
0.6133415, -0.8908311, 6.009848, 0, 0, 0, 1, 1,
0.6211582, -1.147755, 3.550691, 0, 0, 0, 1, 1,
0.6231359, 0.2061274, 2.049588, 0, 0, 0, 1, 1,
0.6238849, 0.4015336, 2.042462, 0, 0, 0, 1, 1,
0.6245326, 1.223759, 0.7461523, 0, 0, 0, 1, 1,
0.6298045, 0.4741425, 1.341137, 0, 0, 0, 1, 1,
0.6324764, -1.260927, 3.452459, 0, 0, 0, 1, 1,
0.6343222, 0.8365428, 0.5124509, 1, 1, 1, 1, 1,
0.63471, -0.1418794, 1.270492, 1, 1, 1, 1, 1,
0.635532, 2.091754, 0.2058767, 1, 1, 1, 1, 1,
0.6360621, 0.202393, 2.145717, 1, 1, 1, 1, 1,
0.6427734, 0.4187187, 0.7379785, 1, 1, 1, 1, 1,
0.6533749, -1.437063, 1.966507, 1, 1, 1, 1, 1,
0.6556114, 1.692471, 0.7774802, 1, 1, 1, 1, 1,
0.6562498, 0.8645411, 2.092942, 1, 1, 1, 1, 1,
0.6711027, -1.915957, 2.54077, 1, 1, 1, 1, 1,
0.6742766, 0.2125193, 1.43805, 1, 1, 1, 1, 1,
0.6752678, -1.067846, 0.6309945, 1, 1, 1, 1, 1,
0.6778401, 1.044587, -0.09406571, 1, 1, 1, 1, 1,
0.6809512, 0.179638, 1.623946, 1, 1, 1, 1, 1,
0.6833247, 0.1111917, 1.198192, 1, 1, 1, 1, 1,
0.6925188, -0.2069618, 2.18805, 1, 1, 1, 1, 1,
0.7060298, -1.528655, 1.866145, 0, 0, 1, 1, 1,
0.709129, -0.6472555, 3.382838, 1, 0, 0, 1, 1,
0.715273, -0.8570966, 1.498556, 1, 0, 0, 1, 1,
0.7203958, -1.129828, 3.856006, 1, 0, 0, 1, 1,
0.7226323, 0.5090066, 1.38995, 1, 0, 0, 1, 1,
0.7239673, 0.6165336, -0.02001, 1, 0, 0, 1, 1,
0.7247187, 0.9639279, 1.073074, 0, 0, 0, 1, 1,
0.7254909, -2.550754, 2.797192, 0, 0, 0, 1, 1,
0.7256978, -0.8130121, 2.959111, 0, 0, 0, 1, 1,
0.7269604, 0.1104391, 2.048623, 0, 0, 0, 1, 1,
0.728334, -1.071956, 2.909305, 0, 0, 0, 1, 1,
0.7382725, -0.6463105, 1.827013, 0, 0, 0, 1, 1,
0.7382836, -0.2894094, 1.656639, 0, 0, 0, 1, 1,
0.7409763, -0.03482298, 2.805038, 1, 1, 1, 1, 1,
0.7476266, 0.8193847, -0.9302163, 1, 1, 1, 1, 1,
0.7505519, -0.5765831, 3.822724, 1, 1, 1, 1, 1,
0.7508636, 0.7457201, 0.08297632, 1, 1, 1, 1, 1,
0.7518435, -0.6303532, 3.944968, 1, 1, 1, 1, 1,
0.7547667, 0.6354424, -0.2011224, 1, 1, 1, 1, 1,
0.7558597, -1.609046, 4.082761, 1, 1, 1, 1, 1,
0.7563567, 0.8721206, 0.849036, 1, 1, 1, 1, 1,
0.7568652, -0.721656, 3.225529, 1, 1, 1, 1, 1,
0.7686533, -0.2431429, 3.157986, 1, 1, 1, 1, 1,
0.7740834, -1.453993, 1.352549, 1, 1, 1, 1, 1,
0.7828556, -0.7583232, 1.935855, 1, 1, 1, 1, 1,
0.7903304, 0.08448646, 1.030184, 1, 1, 1, 1, 1,
0.7978168, 1.046798, 1.539566, 1, 1, 1, 1, 1,
0.7990052, -0.3791518, 1.875983, 1, 1, 1, 1, 1,
0.8048435, 1.494943, -0.5679891, 0, 0, 1, 1, 1,
0.8062725, 0.5255754, 1.153383, 1, 0, 0, 1, 1,
0.8107269, -0.3087994, 3.700064, 1, 0, 0, 1, 1,
0.8114888, 1.296687, 0.2374308, 1, 0, 0, 1, 1,
0.8175421, -0.4791241, 3.411004, 1, 0, 0, 1, 1,
0.819536, 0.6967655, 0.7623232, 1, 0, 0, 1, 1,
0.8230029, 0.9877503, 0.9014418, 0, 0, 0, 1, 1,
0.8230473, -2.291021, 2.406047, 0, 0, 0, 1, 1,
0.8249466, -0.1839107, 0.5142968, 0, 0, 0, 1, 1,
0.8250052, 0.3196283, 1.252817, 0, 0, 0, 1, 1,
0.826516, -1.362203, 3.154534, 0, 0, 0, 1, 1,
0.8279818, -1.821015, 2.143132, 0, 0, 0, 1, 1,
0.8311428, -0.7680054, 1.493749, 0, 0, 0, 1, 1,
0.8395092, 0.7493485, 3.039265, 1, 1, 1, 1, 1,
0.8422859, 1.607457, 0.6809325, 1, 1, 1, 1, 1,
0.8458798, -0.5712, 1.454778, 1, 1, 1, 1, 1,
0.8519306, 1.715889, -3.418209, 1, 1, 1, 1, 1,
0.8578747, -0.8128328, 2.09419, 1, 1, 1, 1, 1,
0.8600237, 0.3684376, 2.212883, 1, 1, 1, 1, 1,
0.8657588, -0.08568063, 1.549338, 1, 1, 1, 1, 1,
0.8659427, 0.4578753, 0.7103778, 1, 1, 1, 1, 1,
0.8676433, 0.1348745, 1.724299, 1, 1, 1, 1, 1,
0.8738207, -0.5154822, 0.75699, 1, 1, 1, 1, 1,
0.8890446, 0.4137737, 0.005037061, 1, 1, 1, 1, 1,
0.8892593, -0.1849647, 2.200232, 1, 1, 1, 1, 1,
0.8966653, 0.07137393, 2.219021, 1, 1, 1, 1, 1,
0.8967467, -0.4919537, 2.11991, 1, 1, 1, 1, 1,
0.897745, -1.238308, 3.840339, 1, 1, 1, 1, 1,
0.9011757, -0.5611942, 0.2595117, 0, 0, 1, 1, 1,
0.9016147, 1.536195, 0.7731846, 1, 0, 0, 1, 1,
0.9033107, 0.4326543, 1.840181, 1, 0, 0, 1, 1,
0.9072483, 0.6673793, 1.552727, 1, 0, 0, 1, 1,
0.9105367, 0.5312571, 1.240419, 1, 0, 0, 1, 1,
0.9110996, 0.3169509, 0.7551879, 1, 0, 0, 1, 1,
0.9111146, 1.392638, 0.4429444, 0, 0, 0, 1, 1,
0.91911, -0.8465192, 2.582145, 0, 0, 0, 1, 1,
0.9204422, 0.9846897, 1.78531, 0, 0, 0, 1, 1,
0.9267808, -0.2659712, 3.465075, 0, 0, 0, 1, 1,
0.9283217, -1.183193, 2.75863, 0, 0, 0, 1, 1,
0.9310206, 1.035451, -1.162711, 0, 0, 0, 1, 1,
0.9327445, 1.272656, 2.031727, 0, 0, 0, 1, 1,
0.9356903, -0.04182699, -0.09385722, 1, 1, 1, 1, 1,
0.9386572, 0.9309475, -1.439477, 1, 1, 1, 1, 1,
0.9394609, 0.3548075, -0.246313, 1, 1, 1, 1, 1,
0.939832, 0.0885685, 1.508512, 1, 1, 1, 1, 1,
0.94067, -0.5958772, 2.750498, 1, 1, 1, 1, 1,
0.9462555, -0.2344738, 1.98197, 1, 1, 1, 1, 1,
0.950736, 0.6896815, 0.9918484, 1, 1, 1, 1, 1,
0.9510794, 1.599078, 0.904943, 1, 1, 1, 1, 1,
0.9575696, 1.646908, -0.8145724, 1, 1, 1, 1, 1,
0.9630281, 0.4496681, 0.6262497, 1, 1, 1, 1, 1,
0.9655943, 0.6269123, 0.9245207, 1, 1, 1, 1, 1,
0.9684798, 0.6017198, 1.701364, 1, 1, 1, 1, 1,
0.9851446, 0.08618987, 2.003005, 1, 1, 1, 1, 1,
0.9889676, 1.006192, -0.2831167, 1, 1, 1, 1, 1,
0.9899325, 0.5842186, 0.8336922, 1, 1, 1, 1, 1,
0.9906548, -0.2583291, 1.796275, 0, 0, 1, 1, 1,
0.993207, -0.01151515, 0.7591679, 1, 0, 0, 1, 1,
0.9972757, 0.401311, 0.8712041, 1, 0, 0, 1, 1,
1.00751, -0.251998, 1.651347, 1, 0, 0, 1, 1,
1.01041, -1.915556, 4.586669, 1, 0, 0, 1, 1,
1.015218, 0.2754039, 1.744354, 1, 0, 0, 1, 1,
1.021082, 0.9291237, 0.9139879, 0, 0, 0, 1, 1,
1.023993, -0.3305673, 3.349135, 0, 0, 0, 1, 1,
1.024385, -0.008623656, -0.227721, 0, 0, 0, 1, 1,
1.028286, -0.3953687, 2.396591, 0, 0, 0, 1, 1,
1.029301, -0.5078971, 2.295235, 0, 0, 0, 1, 1,
1.038699, 1.805277, -2.537989, 0, 0, 0, 1, 1,
1.040026, -0.5386921, 2.116768, 0, 0, 0, 1, 1,
1.048261, -2.032774, 3.44766, 1, 1, 1, 1, 1,
1.065247, 0.3504978, 1.168395, 1, 1, 1, 1, 1,
1.066418, 0.8252504, 1.397658, 1, 1, 1, 1, 1,
1.078126, -1.955628, 3.100008, 1, 1, 1, 1, 1,
1.080817, -1.556678, 1.427995, 1, 1, 1, 1, 1,
1.087273, 0.6755813, 2.032596, 1, 1, 1, 1, 1,
1.091511, -0.9682667, 3.735853, 1, 1, 1, 1, 1,
1.095617, -1.5559, 2.479521, 1, 1, 1, 1, 1,
1.097691, -0.7490234, 2.144417, 1, 1, 1, 1, 1,
1.111992, 1.327527, 0.2885053, 1, 1, 1, 1, 1,
1.12067, 0.9897673, -0.0512999, 1, 1, 1, 1, 1,
1.123265, -0.1332716, 1.825184, 1, 1, 1, 1, 1,
1.127909, 0.6653872, 1.275954, 1, 1, 1, 1, 1,
1.130335, -0.6245943, 2.33041, 1, 1, 1, 1, 1,
1.140607, -1.575618, 4.430269, 1, 1, 1, 1, 1,
1.14193, 0.3848056, 0.8288659, 0, 0, 1, 1, 1,
1.145113, 1.117535, 0.8328199, 1, 0, 0, 1, 1,
1.145143, 1.347528, -0.6551657, 1, 0, 0, 1, 1,
1.153721, 0.9589638, 0.3264363, 1, 0, 0, 1, 1,
1.180169, 0.8959579, 1.211093, 1, 0, 0, 1, 1,
1.19097, 1.521936, -0.2459398, 1, 0, 0, 1, 1,
1.191413, -0.1860417, 1.613093, 0, 0, 0, 1, 1,
1.191437, 1.277186, -0.1484184, 0, 0, 0, 1, 1,
1.196319, -2.370397, 1.641523, 0, 0, 0, 1, 1,
1.196936, -0.6539182, 0.6170954, 0, 0, 0, 1, 1,
1.200769, 0.7184401, 3.212479, 0, 0, 0, 1, 1,
1.205031, 0.1217209, 1.666785, 0, 0, 0, 1, 1,
1.20722, -1.042511, 3.063638, 0, 0, 0, 1, 1,
1.207576, 0.2951753, 0.1958189, 1, 1, 1, 1, 1,
1.214159, 0.7402913, 0.8321513, 1, 1, 1, 1, 1,
1.217414, 0.1318427, 1.224347, 1, 1, 1, 1, 1,
1.218159, 0.1979069, 0.1214464, 1, 1, 1, 1, 1,
1.22809, 0.2588989, 2.944409, 1, 1, 1, 1, 1,
1.229661, 0.03212239, 1.574687, 1, 1, 1, 1, 1,
1.250589, 1.015379, 0.6025898, 1, 1, 1, 1, 1,
1.25304, 0.541304, 2.906863, 1, 1, 1, 1, 1,
1.255523, 1.277517, 0.6512678, 1, 1, 1, 1, 1,
1.264846, 1.941029, 1.043836, 1, 1, 1, 1, 1,
1.278146, -0.7584801, 4.366659, 1, 1, 1, 1, 1,
1.278233, 1.057497, 1.137061, 1, 1, 1, 1, 1,
1.285591, -1.192207, 2.439669, 1, 1, 1, 1, 1,
1.287743, -0.1700264, 3.560922, 1, 1, 1, 1, 1,
1.288892, -1.211319, 3.681006, 1, 1, 1, 1, 1,
1.294972, 1.390223, 1.173951, 0, 0, 1, 1, 1,
1.294986, -0.6646208, 3.967519, 1, 0, 0, 1, 1,
1.29749, 0.5098907, 3.14923, 1, 0, 0, 1, 1,
1.299643, -0.717383, 2.288365, 1, 0, 0, 1, 1,
1.313517, 1.462367, 0.8518533, 1, 0, 0, 1, 1,
1.316232, 0.4673203, 0.154576, 1, 0, 0, 1, 1,
1.318714, -1.204526, 1.963866, 0, 0, 0, 1, 1,
1.328639, -0.8668389, 1.861166, 0, 0, 0, 1, 1,
1.373247, 0.4428009, -0.768347, 0, 0, 0, 1, 1,
1.377701, 0.1136693, 1.421932, 0, 0, 0, 1, 1,
1.377893, -0.4958827, 1.550192, 0, 0, 0, 1, 1,
1.382337, 1.798877, 3.124126, 0, 0, 0, 1, 1,
1.382509, 0.09049411, 0.8085665, 0, 0, 0, 1, 1,
1.395702, -1.634315, 2.356002, 1, 1, 1, 1, 1,
1.399213, 1.011683, -0.6978283, 1, 1, 1, 1, 1,
1.414531, 0.9800897, 2.151495, 1, 1, 1, 1, 1,
1.415012, 0.8457038, -0.2965536, 1, 1, 1, 1, 1,
1.418116, 1.567739, 2.430256, 1, 1, 1, 1, 1,
1.419023, -0.7355773, 2.557675, 1, 1, 1, 1, 1,
1.427327, 0.8992481, 0.2260564, 1, 1, 1, 1, 1,
1.434541, -1.34295, 2.606959, 1, 1, 1, 1, 1,
1.459798, 1.118484, 1.470237, 1, 1, 1, 1, 1,
1.464054, 0.387215, 3.139649, 1, 1, 1, 1, 1,
1.475961, 0.3682075, 2.274501, 1, 1, 1, 1, 1,
1.481583, -0.7223048, 1.500519, 1, 1, 1, 1, 1,
1.482899, -1.544691, 2.582964, 1, 1, 1, 1, 1,
1.483145, -0.8999915, 0.4794085, 1, 1, 1, 1, 1,
1.485977, -1.97518, 2.915139, 1, 1, 1, 1, 1,
1.494348, 1.575024, 2.172318, 0, 0, 1, 1, 1,
1.531685, 1.324464, 0.564689, 1, 0, 0, 1, 1,
1.557474, -1.741196, 3.494807, 1, 0, 0, 1, 1,
1.564464, 0.01785903, 0.299619, 1, 0, 0, 1, 1,
1.567288, 0.7245301, 1.251042, 1, 0, 0, 1, 1,
1.568205, 0.08155142, 2.321748, 1, 0, 0, 1, 1,
1.572761, 0.7998864, 1.34754, 0, 0, 0, 1, 1,
1.574247, -0.3521768, 1.884741, 0, 0, 0, 1, 1,
1.578159, -0.8080826, 0.8034354, 0, 0, 0, 1, 1,
1.581658, 0.4811754, 0.6571749, 0, 0, 0, 1, 1,
1.601257, 0.4457492, 0.5527945, 0, 0, 0, 1, 1,
1.604439, 0.9142846, 2.011928, 0, 0, 0, 1, 1,
1.607292, 0.7328241, 0.5266752, 0, 0, 0, 1, 1,
1.607546, 0.7450398, 2.197663, 1, 1, 1, 1, 1,
1.611129, -0.4700982, 1.4416, 1, 1, 1, 1, 1,
1.611563, -1.300514, 3.542153, 1, 1, 1, 1, 1,
1.613706, 0.01779148, 2.732665, 1, 1, 1, 1, 1,
1.614019, -2.364572, 1.481277, 1, 1, 1, 1, 1,
1.614649, 0.5260661, 2.165308, 1, 1, 1, 1, 1,
1.619378, -0.3864022, 2.099921, 1, 1, 1, 1, 1,
1.626008, 0.5003601, 1.248174, 1, 1, 1, 1, 1,
1.628236, 0.2101457, 0.4947151, 1, 1, 1, 1, 1,
1.645669, 0.3494483, 1.544629, 1, 1, 1, 1, 1,
1.659196, -0.01286861, 2.686509, 1, 1, 1, 1, 1,
1.664231, 0.1103027, 0.5075769, 1, 1, 1, 1, 1,
1.695002, -0.3437533, 1.998186, 1, 1, 1, 1, 1,
1.69907, 0.5367347, -1.284134, 1, 1, 1, 1, 1,
1.699099, -0.4598767, 1.919528, 1, 1, 1, 1, 1,
1.722511, 0.4647519, 1.400934, 0, 0, 1, 1, 1,
1.723374, 1.73252, -0.4302916, 1, 0, 0, 1, 1,
1.742687, 0.01955748, 2.114467, 1, 0, 0, 1, 1,
1.75715, 0.2969811, 2.264824, 1, 0, 0, 1, 1,
1.781425, 1.340869, 1.908784, 1, 0, 0, 1, 1,
1.789016, 0.2581502, 1.295502, 1, 0, 0, 1, 1,
1.789053, -1.034949, 1.522607, 0, 0, 0, 1, 1,
1.789249, -0.08481712, 2.022938, 0, 0, 0, 1, 1,
1.794871, -0.130393, 1.254187, 0, 0, 0, 1, 1,
1.804906, 0.3040529, 0.770784, 0, 0, 0, 1, 1,
1.816269, -2.382788, 3.624511, 0, 0, 0, 1, 1,
1.816489, -0.6328647, 2.21938, 0, 0, 0, 1, 1,
1.842464, -0.3514727, 1.385004, 0, 0, 0, 1, 1,
1.844931, 0.93528, 1.091242, 1, 1, 1, 1, 1,
1.849522, 1.560551, -0.2194543, 1, 1, 1, 1, 1,
1.883608, -0.8710055, 1.90301, 1, 1, 1, 1, 1,
1.885572, -0.08033862, 2.059281, 1, 1, 1, 1, 1,
1.910604, -0.8097221, 3.67202, 1, 1, 1, 1, 1,
1.916302, -0.6942635, 2.085343, 1, 1, 1, 1, 1,
1.916915, -0.2122142, 1.395138, 1, 1, 1, 1, 1,
1.928362, 0.2081021, 1.947207, 1, 1, 1, 1, 1,
1.964262, -0.2404082, 1.575763, 1, 1, 1, 1, 1,
1.9754, 0.7677056, 2.116438, 1, 1, 1, 1, 1,
2.007549, -0.4651016, 0.3549065, 1, 1, 1, 1, 1,
2.036842, 0.250042, 2.232034, 1, 1, 1, 1, 1,
2.044863, 1.745986, 0.0297621, 1, 1, 1, 1, 1,
2.050194, 0.009950761, 0.6792289, 1, 1, 1, 1, 1,
2.094064, 1.501703, -0.3856688, 1, 1, 1, 1, 1,
2.117126, 0.6382536, 1.033924, 0, 0, 1, 1, 1,
2.12152, -1.625968, 1.478442, 1, 0, 0, 1, 1,
2.133589, 0.20435, 1.641332, 1, 0, 0, 1, 1,
2.145006, -1.011908, 4.019483, 1, 0, 0, 1, 1,
2.201935, -1.09725, 2.223368, 1, 0, 0, 1, 1,
2.264829, -1.032323, 0.5213339, 1, 0, 0, 1, 1,
2.27767, -0.2312714, 3.819864, 0, 0, 0, 1, 1,
2.331949, -0.3919729, 1.935912, 0, 0, 0, 1, 1,
2.353547, -0.4888865, 1.187143, 0, 0, 0, 1, 1,
2.358607, 0.1210261, 3.450814, 0, 0, 0, 1, 1,
2.366944, -0.3099992, 2.088206, 0, 0, 0, 1, 1,
2.395496, 0.07652053, 1.995651, 0, 0, 0, 1, 1,
2.511906, -0.7902083, 1.055165, 0, 0, 0, 1, 1,
2.546729, 0.7489992, 3.084651, 1, 1, 1, 1, 1,
2.573573, -1.047705, 1.434453, 1, 1, 1, 1, 1,
2.79185, 0.3432666, 0.8768668, 1, 1, 1, 1, 1,
2.796504, 1.369534, 2.309455, 1, 1, 1, 1, 1,
3.026885, 0.148979, 4.063742, 1, 1, 1, 1, 1,
3.083295, -0.7477996, 2.79851, 1, 1, 1, 1, 1,
3.488511, -0.2366193, 1.05609, 1, 1, 1, 1, 1
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
var radius = 10.32141;
var distance = 36.25351;
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
mvMatrix.translate( -0.03112102, -0.03981733, 0.06541324 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.25351);
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
