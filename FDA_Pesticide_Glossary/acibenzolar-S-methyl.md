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
-3.260632, -0.634251, -1.970298, 1, 0, 0, 1,
-3.079113, -0.7862554, -3.820405, 1, 0.007843138, 0, 1,
-3.069632, 0.752885, 0.535023, 1, 0.01176471, 0, 1,
-2.871621, -1.034924, -3.149916, 1, 0.01960784, 0, 1,
-2.835189, -0.858885, -1.647049, 1, 0.02352941, 0, 1,
-2.770543, -0.4045356, -0.5178587, 1, 0.03137255, 0, 1,
-2.539591, -1.008541, -1.246733, 1, 0.03529412, 0, 1,
-2.469287, 0.1589579, -1.080597, 1, 0.04313726, 0, 1,
-2.440534, 0.5676843, -0.8543676, 1, 0.04705882, 0, 1,
-2.414729, -0.9034283, -2.824749, 1, 0.05490196, 0, 1,
-2.367723, 0.921171, -0.7226909, 1, 0.05882353, 0, 1,
-2.326844, -1.417831, -3.878314, 1, 0.06666667, 0, 1,
-2.235431, -1.6521, -1.00986, 1, 0.07058824, 0, 1,
-2.127199, 2.061773, -1.042778, 1, 0.07843138, 0, 1,
-2.121938, 1.620778, -0.6725212, 1, 0.08235294, 0, 1,
-2.104543, -0.01789899, -1.97456, 1, 0.09019608, 0, 1,
-2.07171, 0.2614369, -2.25207, 1, 0.09411765, 0, 1,
-2.063984, 0.4246982, -0.5641619, 1, 0.1019608, 0, 1,
-2.055464, 0.6538324, -2.170519, 1, 0.1098039, 0, 1,
-2.051418, 1.625311, -3.59537, 1, 0.1137255, 0, 1,
-1.999901, 0.05019203, -2.158035, 1, 0.1215686, 0, 1,
-1.994612, -0.7233075, -0.1225199, 1, 0.1254902, 0, 1,
-1.976439, 1.026574, -1.231516, 1, 0.1333333, 0, 1,
-1.949843, -1.030219, -2.720784, 1, 0.1372549, 0, 1,
-1.946904, -1.346493, -1.991961, 1, 0.145098, 0, 1,
-1.942938, -1.452744, -5.052124, 1, 0.1490196, 0, 1,
-1.926237, 1.016674, 0.1827151, 1, 0.1568628, 0, 1,
-1.909158, -1.31778, -2.106401, 1, 0.1607843, 0, 1,
-1.904403, -0.06891614, -2.100358, 1, 0.1686275, 0, 1,
-1.903124, -0.7340099, -1.947704, 1, 0.172549, 0, 1,
-1.898905, -0.3207392, -2.613503, 1, 0.1803922, 0, 1,
-1.894763, -2.744237, -2.186689, 1, 0.1843137, 0, 1,
-1.894111, -0.8963286, -2.702758, 1, 0.1921569, 0, 1,
-1.893883, -1.607709, -1.833831, 1, 0.1960784, 0, 1,
-1.893648, 0.08120266, -1.184417, 1, 0.2039216, 0, 1,
-1.890752, 0.7343587, -0.3989726, 1, 0.2117647, 0, 1,
-1.863626, 0.1595781, -1.559055, 1, 0.2156863, 0, 1,
-1.825742, 1.992, -1.488415, 1, 0.2235294, 0, 1,
-1.817203, -0.3231151, -1.186641, 1, 0.227451, 0, 1,
-1.80951, -0.9674482, -3.094796, 1, 0.2352941, 0, 1,
-1.798671, -0.4323666, -1.626054, 1, 0.2392157, 0, 1,
-1.794932, -0.491544, -0.850318, 1, 0.2470588, 0, 1,
-1.752497, -0.8253803, -1.961171, 1, 0.2509804, 0, 1,
-1.747954, 0.03131459, -1.723639, 1, 0.2588235, 0, 1,
-1.74698, -1.12893, -2.905104, 1, 0.2627451, 0, 1,
-1.743806, 1.669619, -0.1471732, 1, 0.2705882, 0, 1,
-1.70225, 1.372937, -1.522593, 1, 0.2745098, 0, 1,
-1.700231, -1.277608, -1.141515, 1, 0.282353, 0, 1,
-1.661345, -0.563775, -2.47045, 1, 0.2862745, 0, 1,
-1.644878, 0.2687904, -1.70589, 1, 0.2941177, 0, 1,
-1.640015, -0.4655521, -2.590714, 1, 0.3019608, 0, 1,
-1.636316, -0.8316091, -3.604228, 1, 0.3058824, 0, 1,
-1.612679, 0.3058442, -3.03, 1, 0.3137255, 0, 1,
-1.609519, -0.5408093, -3.00684, 1, 0.3176471, 0, 1,
-1.609406, 0.2810677, -1.884911, 1, 0.3254902, 0, 1,
-1.599333, -0.7940461, -2.267844, 1, 0.3294118, 0, 1,
-1.590782, 1.481899, -1.347177, 1, 0.3372549, 0, 1,
-1.572914, -0.08857056, -0.5752764, 1, 0.3411765, 0, 1,
-1.570393, -0.2101894, -2.521511, 1, 0.3490196, 0, 1,
-1.56275, 1.078786, -0.7077718, 1, 0.3529412, 0, 1,
-1.561649, -1.193757, -1.21942, 1, 0.3607843, 0, 1,
-1.559773, -0.4676776, -0.6279969, 1, 0.3647059, 0, 1,
-1.558782, 1.51663, -0.5674548, 1, 0.372549, 0, 1,
-1.534475, -0.364487, 0.6361943, 1, 0.3764706, 0, 1,
-1.52642, 2.205324, 0.4794534, 1, 0.3843137, 0, 1,
-1.510505, -0.8423399, -0.88965, 1, 0.3882353, 0, 1,
-1.489186, 2.601991, -1.357263, 1, 0.3960784, 0, 1,
-1.482695, -0.6470273, -0.7866294, 1, 0.4039216, 0, 1,
-1.474657, 0.4400908, -1.817282, 1, 0.4078431, 0, 1,
-1.471812, -0.02627255, -2.898549, 1, 0.4156863, 0, 1,
-1.467726, 0.9830959, -0.3643581, 1, 0.4196078, 0, 1,
-1.465923, -0.1165777, -0.2730844, 1, 0.427451, 0, 1,
-1.446147, -0.5693713, -0.06068399, 1, 0.4313726, 0, 1,
-1.439178, 0.2368411, -1.19328, 1, 0.4392157, 0, 1,
-1.435812, 0.2385096, -2.965667, 1, 0.4431373, 0, 1,
-1.425308, -0.1621403, -1.456453, 1, 0.4509804, 0, 1,
-1.418793, 0.9559436, -1.606501, 1, 0.454902, 0, 1,
-1.407841, -2.308132, -3.855698, 1, 0.4627451, 0, 1,
-1.398465, -0.5723257, -3.484708, 1, 0.4666667, 0, 1,
-1.392218, 0.7318872, 0.2331837, 1, 0.4745098, 0, 1,
-1.384928, 1.242565, -1.100599, 1, 0.4784314, 0, 1,
-1.382152, 0.319277, -1.180475, 1, 0.4862745, 0, 1,
-1.371786, 0.8942258, -2.265507, 1, 0.4901961, 0, 1,
-1.36922, -1.037721, -0.4488415, 1, 0.4980392, 0, 1,
-1.354809, 0.9651455, -0.4850506, 1, 0.5058824, 0, 1,
-1.343617, 2.195575, -0.9632093, 1, 0.509804, 0, 1,
-1.342956, 1.458034, -0.3414758, 1, 0.5176471, 0, 1,
-1.342469, -0.7522354, -1.141962, 1, 0.5215687, 0, 1,
-1.335897, 0.1001506, -2.480241, 1, 0.5294118, 0, 1,
-1.32585, -1.044099, -0.1491531, 1, 0.5333334, 0, 1,
-1.324707, -2.985339, -2.434432, 1, 0.5411765, 0, 1,
-1.322243, -1.108185, -4.308479, 1, 0.5450981, 0, 1,
-1.321306, 1.378076, -1.246217, 1, 0.5529412, 0, 1,
-1.309302, -0.8511099, -1.283138, 1, 0.5568628, 0, 1,
-1.308138, 0.3811423, -0.3846875, 1, 0.5647059, 0, 1,
-1.289361, 0.2165237, -0.5660693, 1, 0.5686275, 0, 1,
-1.263503, 0.6922413, -2.230145, 1, 0.5764706, 0, 1,
-1.256769, -0.5639528, -0.3791277, 1, 0.5803922, 0, 1,
-1.2284, 0.6468453, -0.9341694, 1, 0.5882353, 0, 1,
-1.224394, -0.2254082, -0.8025649, 1, 0.5921569, 0, 1,
-1.220888, 0.6889694, -2.560967, 1, 0.6, 0, 1,
-1.212272, -1.864774, -4.325084, 1, 0.6078432, 0, 1,
-1.20256, -1.048934, -3.568157, 1, 0.6117647, 0, 1,
-1.193391, -0.2256344, -2.212166, 1, 0.6196079, 0, 1,
-1.19251, -0.2214529, 0.9751102, 1, 0.6235294, 0, 1,
-1.187724, -0.07854018, -0.672589, 1, 0.6313726, 0, 1,
-1.18483, 0.2110544, -1.399662, 1, 0.6352941, 0, 1,
-1.180189, -2.354514, -3.966213, 1, 0.6431373, 0, 1,
-1.176467, -0.4557636, -5.569544, 1, 0.6470588, 0, 1,
-1.163223, -0.7285933, -2.556103, 1, 0.654902, 0, 1,
-1.161475, 0.1932485, -2.282464, 1, 0.6588235, 0, 1,
-1.153313, 0.8231513, -1.057519, 1, 0.6666667, 0, 1,
-1.152788, -0.7202485, -4.514641, 1, 0.6705883, 0, 1,
-1.150181, 0.9469324, -0.8914201, 1, 0.6784314, 0, 1,
-1.149494, -0.5267906, -0.9752973, 1, 0.682353, 0, 1,
-1.149372, 0.2932247, -1.080009, 1, 0.6901961, 0, 1,
-1.145944, -0.663389, -2.269786, 1, 0.6941177, 0, 1,
-1.145499, -0.4074974, -1.455513, 1, 0.7019608, 0, 1,
-1.142957, -2.306976, -1.96471, 1, 0.7098039, 0, 1,
-1.142954, -1.367805, -1.634476, 1, 0.7137255, 0, 1,
-1.140326, 0.07542883, 1.48403, 1, 0.7215686, 0, 1,
-1.136612, 0.5066804, -1.11222, 1, 0.7254902, 0, 1,
-1.131194, 2.151742, -0.4243301, 1, 0.7333333, 0, 1,
-1.113839, 0.2723423, -0.838919, 1, 0.7372549, 0, 1,
-1.10955, 0.5121086, 1.424892, 1, 0.7450981, 0, 1,
-1.106696, 1.435783, 0.158176, 1, 0.7490196, 0, 1,
-1.101529, 0.1847267, -2.242798, 1, 0.7568628, 0, 1,
-1.100349, 0.6501536, -0.7558832, 1, 0.7607843, 0, 1,
-1.100218, -1.547016, -3.876748, 1, 0.7686275, 0, 1,
-1.097594, -0.4054994, -2.818342, 1, 0.772549, 0, 1,
-1.09417, -0.4581253, -2.884346, 1, 0.7803922, 0, 1,
-1.081005, 0.03336493, -2.066194, 1, 0.7843137, 0, 1,
-1.076408, 0.1297827, -0.1512765, 1, 0.7921569, 0, 1,
-1.075934, -0.5151327, -1.034984, 1, 0.7960784, 0, 1,
-1.075913, 1.37787, 0.7931905, 1, 0.8039216, 0, 1,
-1.075854, -0.8372632, -1.251689, 1, 0.8117647, 0, 1,
-1.075337, 0.4606676, -0.5804525, 1, 0.8156863, 0, 1,
-1.074349, 0.1105834, -1.083136, 1, 0.8235294, 0, 1,
-1.069426, -0.8345398, 0.1707229, 1, 0.827451, 0, 1,
-1.06908, -0.4406588, -0.7111127, 1, 0.8352941, 0, 1,
-1.065712, 1.440348, -1.678667, 1, 0.8392157, 0, 1,
-1.054918, 0.05264612, -2.852976, 1, 0.8470588, 0, 1,
-1.0454, -0.1431947, -4.530619, 1, 0.8509804, 0, 1,
-1.043298, 0.1818358, -0.6913759, 1, 0.8588235, 0, 1,
-1.043241, -0.2874587, -2.132445, 1, 0.8627451, 0, 1,
-1.040684, -0.005438193, -0.4786211, 1, 0.8705882, 0, 1,
-1.036523, 1.645639, -0.2904374, 1, 0.8745098, 0, 1,
-1.032688, -0.201133, -2.597417, 1, 0.8823529, 0, 1,
-1.030531, 0.3049231, -1.081892, 1, 0.8862745, 0, 1,
-1.030167, -0.235642, -1.927911, 1, 0.8941177, 0, 1,
-1.024656, -0.2677912, -3.087671, 1, 0.8980392, 0, 1,
-1.024032, -0.8517787, -1.748887, 1, 0.9058824, 0, 1,
-0.9897608, 0.9627945, -0.7812217, 1, 0.9137255, 0, 1,
-0.9850053, 0.1321593, -0.8636662, 1, 0.9176471, 0, 1,
-0.978876, -0.2178625, -2.48452, 1, 0.9254902, 0, 1,
-0.9748631, 0.5587003, -1.003506, 1, 0.9294118, 0, 1,
-0.9711815, 1.260461, -0.2127475, 1, 0.9372549, 0, 1,
-0.9664367, 2.285578, -1.261683, 1, 0.9411765, 0, 1,
-0.9642056, 1.051466, -1.279917, 1, 0.9490196, 0, 1,
-0.9558446, 0.4539605, -1.080876, 1, 0.9529412, 0, 1,
-0.9549305, 1.599752, 0.1071608, 1, 0.9607843, 0, 1,
-0.9510481, 0.3526446, -2.226046, 1, 0.9647059, 0, 1,
-0.9498619, -1.328169, -4.247092, 1, 0.972549, 0, 1,
-0.9463732, -0.8791575, -0.1561499, 1, 0.9764706, 0, 1,
-0.9388609, -1.741347, -2.118285, 1, 0.9843137, 0, 1,
-0.9269033, 1.181291, -1.475524, 1, 0.9882353, 0, 1,
-0.9205965, 1.780414, -0.6952037, 1, 0.9960784, 0, 1,
-0.9156557, 0.6299026, -0.7578615, 0.9960784, 1, 0, 1,
-0.9137698, -3.059413, -0.7957163, 0.9921569, 1, 0, 1,
-0.9135729, -0.7824294, -1.37083, 0.9843137, 1, 0, 1,
-0.9100667, 0.5050114, -0.6726767, 0.9803922, 1, 0, 1,
-0.9092719, -0.9550792, -3.022393, 0.972549, 1, 0, 1,
-0.9091869, -0.04846025, -0.9638347, 0.9686275, 1, 0, 1,
-0.902276, -0.300838, 0.1405558, 0.9607843, 1, 0, 1,
-0.9019089, 0.8575697, -1.012343, 0.9568627, 1, 0, 1,
-0.8957663, -1.832776, -2.024971, 0.9490196, 1, 0, 1,
-0.8915948, 0.3742147, -1.714771, 0.945098, 1, 0, 1,
-0.8904278, -0.7626519, -2.143196, 0.9372549, 1, 0, 1,
-0.8866047, -0.879373, -2.855782, 0.9333333, 1, 0, 1,
-0.8861874, 0.9147066, -2.348467, 0.9254902, 1, 0, 1,
-0.8834018, -0.8796223, -1.633723, 0.9215686, 1, 0, 1,
-0.8799792, -1.5618, -2.764524, 0.9137255, 1, 0, 1,
-0.8789219, -1.247872, -3.517879, 0.9098039, 1, 0, 1,
-0.876354, -1.007368, -2.739778, 0.9019608, 1, 0, 1,
-0.8752181, 1.219449, -0.7746046, 0.8941177, 1, 0, 1,
-0.8715175, 1.033821, 0.4501379, 0.8901961, 1, 0, 1,
-0.8667648, -0.5221876, -4.268314, 0.8823529, 1, 0, 1,
-0.8609392, 2.039654, -1.235479, 0.8784314, 1, 0, 1,
-0.8565865, 0.8830342, -0.1832592, 0.8705882, 1, 0, 1,
-0.8562932, -0.9975227, -2.296786, 0.8666667, 1, 0, 1,
-0.8543189, -0.4048178, -1.734988, 0.8588235, 1, 0, 1,
-0.848774, -0.06984892, -2.267898, 0.854902, 1, 0, 1,
-0.8386513, 0.3718796, -1.603802, 0.8470588, 1, 0, 1,
-0.8305081, 0.5041627, -0.4430169, 0.8431373, 1, 0, 1,
-0.827675, -0.7942009, -2.021356, 0.8352941, 1, 0, 1,
-0.8187411, 0.4076183, -1.257348, 0.8313726, 1, 0, 1,
-0.8134078, 1.969157, -0.3741599, 0.8235294, 1, 0, 1,
-0.8127035, 0.9404224, -0.7598907, 0.8196079, 1, 0, 1,
-0.8050507, 0.2802809, -1.28086, 0.8117647, 1, 0, 1,
-0.7973134, 0.7781575, -1.926711, 0.8078431, 1, 0, 1,
-0.7957756, 0.4404594, -2.136737, 0.8, 1, 0, 1,
-0.7871277, -0.2449943, -1.161996, 0.7921569, 1, 0, 1,
-0.7838602, 1.312942, -2.286087, 0.7882353, 1, 0, 1,
-0.7825719, 1.376881, 0.03125082, 0.7803922, 1, 0, 1,
-0.7799681, 0.3597614, -1.858639, 0.7764706, 1, 0, 1,
-0.7761093, 0.6824889, 0.1694931, 0.7686275, 1, 0, 1,
-0.7757443, 0.4119879, -1.970452, 0.7647059, 1, 0, 1,
-0.774783, 1.056229, -0.1604955, 0.7568628, 1, 0, 1,
-0.7745435, -0.1642426, -1.931865, 0.7529412, 1, 0, 1,
-0.7744353, 1.199444, -2.325632, 0.7450981, 1, 0, 1,
-0.7590693, -0.3184419, -2.348542, 0.7411765, 1, 0, 1,
-0.7508021, -1.049918, -2.681592, 0.7333333, 1, 0, 1,
-0.7502554, -0.1092837, -0.7920541, 0.7294118, 1, 0, 1,
-0.7479389, 1.204499, -1.991908, 0.7215686, 1, 0, 1,
-0.7371739, 0.1827631, -1.230649, 0.7176471, 1, 0, 1,
-0.7353273, 0.5102857, -0.8325475, 0.7098039, 1, 0, 1,
-0.7337688, -0.2875271, -2.817187, 0.7058824, 1, 0, 1,
-0.7273974, -1.060387, -3.227159, 0.6980392, 1, 0, 1,
-0.7206624, 0.02137043, 0.437676, 0.6901961, 1, 0, 1,
-0.7158723, 1.921441, -1.2181, 0.6862745, 1, 0, 1,
-0.7155299, -1.217149, -2.635519, 0.6784314, 1, 0, 1,
-0.7154676, 0.7076513, -1.199816, 0.6745098, 1, 0, 1,
-0.709743, 1.678512, -1.730456, 0.6666667, 1, 0, 1,
-0.7093616, 0.7202002, -1.257471, 0.6627451, 1, 0, 1,
-0.7087174, 0.8049099, -2.58079, 0.654902, 1, 0, 1,
-0.7058955, -1.54721, -1.336808, 0.6509804, 1, 0, 1,
-0.7030706, 0.6040632, -1.679098, 0.6431373, 1, 0, 1,
-0.6963214, 0.6147807, -1.49218, 0.6392157, 1, 0, 1,
-0.691823, 0.07082654, 0.1180012, 0.6313726, 1, 0, 1,
-0.6868852, 0.02305028, -2.341902, 0.627451, 1, 0, 1,
-0.6864687, 1.457444, -1.420754, 0.6196079, 1, 0, 1,
-0.6836927, 1.833097, -1.004685, 0.6156863, 1, 0, 1,
-0.6835636, 2.687476, 0.4904209, 0.6078432, 1, 0, 1,
-0.6817802, 1.157209, 0.1797907, 0.6039216, 1, 0, 1,
-0.6765805, -0.579735, -1.638842, 0.5960785, 1, 0, 1,
-0.6761702, -1.492108, -3.084073, 0.5882353, 1, 0, 1,
-0.6747087, 0.9470564, -0.4915041, 0.5843138, 1, 0, 1,
-0.6746205, 0.5528052, -2.54535, 0.5764706, 1, 0, 1,
-0.6700916, 0.2589126, -2.282652, 0.572549, 1, 0, 1,
-0.6595035, -1.568858, -1.205715, 0.5647059, 1, 0, 1,
-0.6555876, -1.543768, -3.496994, 0.5607843, 1, 0, 1,
-0.6554705, 0.4548587, -0.1675985, 0.5529412, 1, 0, 1,
-0.6529925, 0.7020615, -1.809309, 0.5490196, 1, 0, 1,
-0.6513699, 0.4808462, -0.7879075, 0.5411765, 1, 0, 1,
-0.6465371, -0.0695442, -1.028288, 0.5372549, 1, 0, 1,
-0.644982, -2.828737, -2.803286, 0.5294118, 1, 0, 1,
-0.6432996, -0.7912996, -2.242088, 0.5254902, 1, 0, 1,
-0.634333, 0.3510857, -0.3328942, 0.5176471, 1, 0, 1,
-0.633686, 1.452297, -1.718654, 0.5137255, 1, 0, 1,
-0.6281186, -0.2592569, -1.190788, 0.5058824, 1, 0, 1,
-0.6278811, 1.519937, -1.570409, 0.5019608, 1, 0, 1,
-0.6258104, -0.6194094, -2.563576, 0.4941176, 1, 0, 1,
-0.6242808, 1.314287, -1.508262, 0.4862745, 1, 0, 1,
-0.6183355, -1.284105, -1.808907, 0.4823529, 1, 0, 1,
-0.6159868, -1.056613, -1.976938, 0.4745098, 1, 0, 1,
-0.6111715, 0.5249207, -0.8681817, 0.4705882, 1, 0, 1,
-0.6053035, 0.1756034, -2.19417, 0.4627451, 1, 0, 1,
-0.5974779, 0.03775813, -1.534882, 0.4588235, 1, 0, 1,
-0.5972359, -1.065207, -3.375123, 0.4509804, 1, 0, 1,
-0.5918082, 2.206402, 0.2081865, 0.4470588, 1, 0, 1,
-0.5883443, -0.4361557, -1.001066, 0.4392157, 1, 0, 1,
-0.5864912, -0.3127469, -2.880808, 0.4352941, 1, 0, 1,
-0.584334, 1.489722, 0.550829, 0.427451, 1, 0, 1,
-0.5826635, 0.3496983, -1.143182, 0.4235294, 1, 0, 1,
-0.5760945, -2.845205, -2.36646, 0.4156863, 1, 0, 1,
-0.5633491, 0.6851287, 0.3710376, 0.4117647, 1, 0, 1,
-0.5630548, -1.572163, -4.635579, 0.4039216, 1, 0, 1,
-0.5603465, -0.6015282, -2.833076, 0.3960784, 1, 0, 1,
-0.5600558, -2.062524, -2.496917, 0.3921569, 1, 0, 1,
-0.5568562, -0.4872023, -1.133141, 0.3843137, 1, 0, 1,
-0.5567998, -0.7756035, -1.550548, 0.3803922, 1, 0, 1,
-0.5523417, 0.7822819, 0.702109, 0.372549, 1, 0, 1,
-0.5517394, -0.5980114, -2.85132, 0.3686275, 1, 0, 1,
-0.5514387, 0.8927555, -0.5300133, 0.3607843, 1, 0, 1,
-0.5513186, -1.599769, -3.067235, 0.3568628, 1, 0, 1,
-0.5509282, -1.082162, -1.081617, 0.3490196, 1, 0, 1,
-0.5492495, 0.5987654, -0.7192466, 0.345098, 1, 0, 1,
-0.5456297, -1.300471, -3.051906, 0.3372549, 1, 0, 1,
-0.538302, 1.202764, 0.6768834, 0.3333333, 1, 0, 1,
-0.5373626, -0.05898093, -2.13242, 0.3254902, 1, 0, 1,
-0.5321856, 2.03158, -0.7983774, 0.3215686, 1, 0, 1,
-0.5319363, -0.4006393, -2.399081, 0.3137255, 1, 0, 1,
-0.5299619, -0.1463735, -2.4546, 0.3098039, 1, 0, 1,
-0.5233551, 0.9767581, 1.11935, 0.3019608, 1, 0, 1,
-0.5215214, -0.1853035, -1.534141, 0.2941177, 1, 0, 1,
-0.5133325, -1.113333, -0.6394125, 0.2901961, 1, 0, 1,
-0.5079474, 0.2592935, -0.3813874, 0.282353, 1, 0, 1,
-0.5065727, 0.1828935, -2.217326, 0.2784314, 1, 0, 1,
-0.5060223, -0.4592735, -2.718755, 0.2705882, 1, 0, 1,
-0.5054231, 0.6919317, -1.998581, 0.2666667, 1, 0, 1,
-0.5029539, -0.3205954, -2.878873, 0.2588235, 1, 0, 1,
-0.501286, 1.304372, -2.363255, 0.254902, 1, 0, 1,
-0.4932469, 0.007439491, -2.076357, 0.2470588, 1, 0, 1,
-0.4876862, 1.004902, 0.1049525, 0.2431373, 1, 0, 1,
-0.4863426, -0.3101901, -1.990429, 0.2352941, 1, 0, 1,
-0.4843179, -1.301076, -3.339576, 0.2313726, 1, 0, 1,
-0.4812129, 0.9170185, 0.6701129, 0.2235294, 1, 0, 1,
-0.4809282, -0.438425, -1.536616, 0.2196078, 1, 0, 1,
-0.4770384, -0.9946464, -2.945308, 0.2117647, 1, 0, 1,
-0.4741018, -0.1602434, -3.315548, 0.2078431, 1, 0, 1,
-0.4697126, -0.1191634, -0.6943108, 0.2, 1, 0, 1,
-0.4691735, 0.6012738, -1.531136, 0.1921569, 1, 0, 1,
-0.4682828, 0.3128012, -2.118779, 0.1882353, 1, 0, 1,
-0.4628881, -1.611016, -2.267016, 0.1803922, 1, 0, 1,
-0.4608309, 0.7872378, 1.262577, 0.1764706, 1, 0, 1,
-0.4598041, 2.451222, -0.590184, 0.1686275, 1, 0, 1,
-0.4581243, 1.722942, -0.078931, 0.1647059, 1, 0, 1,
-0.4532864, -0.03863482, -3.245107, 0.1568628, 1, 0, 1,
-0.4506729, 0.9592726, -1.166343, 0.1529412, 1, 0, 1,
-0.4482037, -1.094622, -2.770758, 0.145098, 1, 0, 1,
-0.4463255, 0.425295, -1.994423, 0.1411765, 1, 0, 1,
-0.4459476, -1.021706, -1.087672, 0.1333333, 1, 0, 1,
-0.44391, -0.8334513, -2.925064, 0.1294118, 1, 0, 1,
-0.4430692, -0.675879, -2.45345, 0.1215686, 1, 0, 1,
-0.4389502, -0.07263585, -2.627292, 0.1176471, 1, 0, 1,
-0.4355992, -0.7091423, -3.757938, 0.1098039, 1, 0, 1,
-0.4322004, 0.6682032, -0.2886678, 0.1058824, 1, 0, 1,
-0.4286278, 1.473709, -0.9874707, 0.09803922, 1, 0, 1,
-0.4230196, -0.9528973, -4.125471, 0.09019608, 1, 0, 1,
-0.4221149, 1.053177, -0.1629713, 0.08627451, 1, 0, 1,
-0.4183733, 0.2891101, -1.453383, 0.07843138, 1, 0, 1,
-0.4129795, -0.364643, -1.03149, 0.07450981, 1, 0, 1,
-0.4127649, -1.038801, -2.719097, 0.06666667, 1, 0, 1,
-0.4100156, 1.037451, -0.672944, 0.0627451, 1, 0, 1,
-0.4086336, -0.9163202, -2.56554, 0.05490196, 1, 0, 1,
-0.4061564, -0.8562054, -4.337346, 0.05098039, 1, 0, 1,
-0.4057539, -0.3187667, -3.907741, 0.04313726, 1, 0, 1,
-0.4032539, 2.554973, -1.708635, 0.03921569, 1, 0, 1,
-0.400669, -1.45119, -1.803407, 0.03137255, 1, 0, 1,
-0.3980039, 1.717065, -0.8061239, 0.02745098, 1, 0, 1,
-0.3937252, -1.09756, -0.9789633, 0.01960784, 1, 0, 1,
-0.3917253, -0.2385222, -1.327272, 0.01568628, 1, 0, 1,
-0.3904106, 1.455978, -1.110976, 0.007843138, 1, 0, 1,
-0.3849533, 1.104347, -0.2363117, 0.003921569, 1, 0, 1,
-0.3843655, -1.632554, -2.043462, 0, 1, 0.003921569, 1,
-0.3833681, -0.9371886, -3.363235, 0, 1, 0.01176471, 1,
-0.3778578, -0.5335989, -1.481645, 0, 1, 0.01568628, 1,
-0.3776191, -2.221962, -3.343727, 0, 1, 0.02352941, 1,
-0.3748409, 0.1524788, -2.263068, 0, 1, 0.02745098, 1,
-0.3739775, -0.2883047, -2.985148, 0, 1, 0.03529412, 1,
-0.3715171, -0.4557051, -2.914725, 0, 1, 0.03921569, 1,
-0.3704557, 0.3399287, -0.4027393, 0, 1, 0.04705882, 1,
-0.3704106, -0.2605259, -0.7931846, 0, 1, 0.05098039, 1,
-0.3692406, 0.8040516, -0.1147326, 0, 1, 0.05882353, 1,
-0.3557849, 1.970505, 1.853374, 0, 1, 0.0627451, 1,
-0.3480524, 0.2219312, -1.313252, 0, 1, 0.07058824, 1,
-0.3468606, 0.05274907, -2.266294, 0, 1, 0.07450981, 1,
-0.3446444, 0.9373738, -0.8929309, 0, 1, 0.08235294, 1,
-0.3426801, -0.7534432, -2.66823, 0, 1, 0.08627451, 1,
-0.3412335, 2.625651, 1.391274, 0, 1, 0.09411765, 1,
-0.3358642, -1.187752, -2.661025, 0, 1, 0.1019608, 1,
-0.3345156, -0.04772123, -3.208753, 0, 1, 0.1058824, 1,
-0.3344197, 0.7051336, 0.5733687, 0, 1, 0.1137255, 1,
-0.3343484, -0.426274, -2.795827, 0, 1, 0.1176471, 1,
-0.3340432, -1.454363, -2.360132, 0, 1, 0.1254902, 1,
-0.3328061, 0.7792471, 0.07485852, 0, 1, 0.1294118, 1,
-0.3315915, -0.330755, -2.636599, 0, 1, 0.1372549, 1,
-0.3293051, 1.331029, 0.54831, 0, 1, 0.1411765, 1,
-0.3266739, 1.151252, -0.06952498, 0, 1, 0.1490196, 1,
-0.3258702, -1.002089, -3.806374, 0, 1, 0.1529412, 1,
-0.3240404, 0.2432496, -1.820715, 0, 1, 0.1607843, 1,
-0.3223554, 0.5987447, 0.08587749, 0, 1, 0.1647059, 1,
-0.3155978, 1.026738, 0.06376263, 0, 1, 0.172549, 1,
-0.3068267, -1.682833, -3.371536, 0, 1, 0.1764706, 1,
-0.3038773, -0.2856807, -3.956875, 0, 1, 0.1843137, 1,
-0.3038342, -0.8375854, -2.520052, 0, 1, 0.1882353, 1,
-0.3031535, -0.9442717, -4.426744, 0, 1, 0.1960784, 1,
-0.2943716, 0.2215948, -2.496694, 0, 1, 0.2039216, 1,
-0.2929572, -0.7744563, -2.694769, 0, 1, 0.2078431, 1,
-0.2894213, -2.558138, -3.948824, 0, 1, 0.2156863, 1,
-0.2874005, -0.2514863, -1.930583, 0, 1, 0.2196078, 1,
-0.2870181, -0.228742, -1.395772, 0, 1, 0.227451, 1,
-0.2855161, 0.2822662, -1.009984, 0, 1, 0.2313726, 1,
-0.2846489, 1.096387, -0.1096974, 0, 1, 0.2392157, 1,
-0.2844757, 2.128038, -2.204804, 0, 1, 0.2431373, 1,
-0.2831866, 0.00497827, -2.269571, 0, 1, 0.2509804, 1,
-0.2830524, -0.3177022, -4.455739, 0, 1, 0.254902, 1,
-0.2798293, -0.3420524, -3.485095, 0, 1, 0.2627451, 1,
-0.2782953, 0.6900908, -0.7984698, 0, 1, 0.2666667, 1,
-0.2753995, 0.3153242, -1.959043, 0, 1, 0.2745098, 1,
-0.2748224, 0.299436, -2.756404, 0, 1, 0.2784314, 1,
-0.2741264, 0.3428797, -0.8410815, 0, 1, 0.2862745, 1,
-0.269872, -0.08963951, -1.814743, 0, 1, 0.2901961, 1,
-0.2696174, 0.2461358, -0.7324467, 0, 1, 0.2980392, 1,
-0.2597866, -0.2473947, -2.399016, 0, 1, 0.3058824, 1,
-0.2567144, 1.481142, -0.4120272, 0, 1, 0.3098039, 1,
-0.2563851, 0.2350187, -1.038567, 0, 1, 0.3176471, 1,
-0.2529327, 0.2481782, -0.4658909, 0, 1, 0.3215686, 1,
-0.2522203, -0.7372873, -1.862634, 0, 1, 0.3294118, 1,
-0.2520747, -0.6199266, -3.160828, 0, 1, 0.3333333, 1,
-0.2479406, 0.6366565, 0.2853187, 0, 1, 0.3411765, 1,
-0.2472769, -1.046157, -4.331038, 0, 1, 0.345098, 1,
-0.2462611, -1.46374, -3.674719, 0, 1, 0.3529412, 1,
-0.2446426, 0.8181568, 0.3086049, 0, 1, 0.3568628, 1,
-0.2438076, 1.521, -0.6876984, 0, 1, 0.3647059, 1,
-0.2425729, 2.124409, -0.6185957, 0, 1, 0.3686275, 1,
-0.2385495, 0.7625434, -0.765399, 0, 1, 0.3764706, 1,
-0.2384495, 0.4110543, -0.4227754, 0, 1, 0.3803922, 1,
-0.2361128, 0.4659604, -1.469446, 0, 1, 0.3882353, 1,
-0.2354131, 0.9446197, -0.2142458, 0, 1, 0.3921569, 1,
-0.2351128, 0.04882167, -1.163152, 0, 1, 0.4, 1,
-0.2349894, 0.7357522, -1.678476, 0, 1, 0.4078431, 1,
-0.234653, 1.018841, -0.6110831, 0, 1, 0.4117647, 1,
-0.2334836, -1.80488, -3.326914, 0, 1, 0.4196078, 1,
-0.2273947, -1.456522, -3.023318, 0, 1, 0.4235294, 1,
-0.2270501, 1.072172, 1.71994, 0, 1, 0.4313726, 1,
-0.2200532, -1.164202, -3.095712, 0, 1, 0.4352941, 1,
-0.2182972, 0.5589196, -1.22315, 0, 1, 0.4431373, 1,
-0.2121702, 0.1412297, -1.985054, 0, 1, 0.4470588, 1,
-0.2117008, -1.759447, -2.377845, 0, 1, 0.454902, 1,
-0.2069712, -0.3925082, -3.453785, 0, 1, 0.4588235, 1,
-0.2061768, -0.7715729, -3.21325, 0, 1, 0.4666667, 1,
-0.2060496, 0.7621843, -1.382196, 0, 1, 0.4705882, 1,
-0.2040187, -0.4068093, -3.921559, 0, 1, 0.4784314, 1,
-0.2020726, -1.328016, -1.722423, 0, 1, 0.4823529, 1,
-0.1955645, -0.1658471, -2.202764, 0, 1, 0.4901961, 1,
-0.1953529, 0.394393, -1.351494, 0, 1, 0.4941176, 1,
-0.1948476, 0.09990412, -1.991808, 0, 1, 0.5019608, 1,
-0.1931989, 0.977074, -1.604337, 0, 1, 0.509804, 1,
-0.1928888, -0.5764374, -0.8264464, 0, 1, 0.5137255, 1,
-0.1927191, -1.187191, -3.866838, 0, 1, 0.5215687, 1,
-0.1925824, 0.4389242, -0.5998027, 0, 1, 0.5254902, 1,
-0.1846112, -0.3789378, -4.167039, 0, 1, 0.5333334, 1,
-0.184213, 0.3100497, -2.373841, 0, 1, 0.5372549, 1,
-0.1836744, 1.368116, -0.9436808, 0, 1, 0.5450981, 1,
-0.1816362, -0.379996, -2.519006, 0, 1, 0.5490196, 1,
-0.1809615, -0.38201, -3.231614, 0, 1, 0.5568628, 1,
-0.1806236, -1.204704, -2.198661, 0, 1, 0.5607843, 1,
-0.1790049, -0.06433811, -1.424863, 0, 1, 0.5686275, 1,
-0.1747619, 0.2606969, -0.9468974, 0, 1, 0.572549, 1,
-0.1718618, 0.7338172, 1.040173, 0, 1, 0.5803922, 1,
-0.1694279, -2.366822, -3.307401, 0, 1, 0.5843138, 1,
-0.1652784, 1.321577, -1.761269, 0, 1, 0.5921569, 1,
-0.1623246, 0.9255288, -0.8299835, 0, 1, 0.5960785, 1,
-0.160951, 0.7660652, 0.9950497, 0, 1, 0.6039216, 1,
-0.1606375, 0.2363181, -1.208817, 0, 1, 0.6117647, 1,
-0.1515935, 0.3480687, 0.0353832, 0, 1, 0.6156863, 1,
-0.1490722, 0.8746262, -1.46551, 0, 1, 0.6235294, 1,
-0.1453679, -1.748959, -3.10085, 0, 1, 0.627451, 1,
-0.1450278, 0.4497333, -0.8280595, 0, 1, 0.6352941, 1,
-0.1419739, -0.01570724, -2.355203, 0, 1, 0.6392157, 1,
-0.1413834, -1.170883, -2.223949, 0, 1, 0.6470588, 1,
-0.1314642, -1.072317, -3.025754, 0, 1, 0.6509804, 1,
-0.1296785, 0.5419611, -0.2449873, 0, 1, 0.6588235, 1,
-0.1279599, -0.518142, -3.902709, 0, 1, 0.6627451, 1,
-0.1200109, -1.518905, -2.617424, 0, 1, 0.6705883, 1,
-0.115179, 0.1260613, -1.730513, 0, 1, 0.6745098, 1,
-0.1088375, 0.02492896, -0.8102964, 0, 1, 0.682353, 1,
-0.1086135, -0.3429049, -2.189909, 0, 1, 0.6862745, 1,
-0.1078852, 1.197527, 0.2903512, 0, 1, 0.6941177, 1,
-0.1035688, 0.6165282, -1.25874, 0, 1, 0.7019608, 1,
-0.1030171, -0.3006397, -3.015123, 0, 1, 0.7058824, 1,
-0.1025649, 0.04246324, -0.3448674, 0, 1, 0.7137255, 1,
-0.1018516, 0.901883, 0.3660612, 0, 1, 0.7176471, 1,
-0.1017118, -1.204542, -1.857442, 0, 1, 0.7254902, 1,
-0.1010779, -0.0185317, -1.564336, 0, 1, 0.7294118, 1,
-0.09620592, 0.6372164, -0.5924485, 0, 1, 0.7372549, 1,
-0.09556125, -0.1421781, -3.118698, 0, 1, 0.7411765, 1,
-0.09523194, 0.2398601, -1.616008, 0, 1, 0.7490196, 1,
-0.09007028, -0.3430564, -1.855302, 0, 1, 0.7529412, 1,
-0.08345462, 0.7855682, -0.8723533, 0, 1, 0.7607843, 1,
-0.07915558, 1.005681, 0.3386069, 0, 1, 0.7647059, 1,
-0.07914103, -2.201239, -2.934779, 0, 1, 0.772549, 1,
-0.07765827, -1.431315, -1.510707, 0, 1, 0.7764706, 1,
-0.07613201, 0.8018157, 1.0639, 0, 1, 0.7843137, 1,
-0.07390053, -0.9503305, -4.809102, 0, 1, 0.7882353, 1,
-0.07300973, 0.173938, 0.9485286, 0, 1, 0.7960784, 1,
-0.07263312, -0.2015584, -3.368223, 0, 1, 0.8039216, 1,
-0.07166775, -0.2150074, -2.517106, 0, 1, 0.8078431, 1,
-0.06688225, 2.358941, 0.5134233, 0, 1, 0.8156863, 1,
-0.0666315, -1.957968, -4.10521, 0, 1, 0.8196079, 1,
-0.06317335, 0.4149464, 1.588064, 0, 1, 0.827451, 1,
-0.05999034, 0.1992061, -1.586584, 0, 1, 0.8313726, 1,
-0.05653296, -0.2790993, -3.672284, 0, 1, 0.8392157, 1,
-0.05596781, 0.9172207, -0.3048816, 0, 1, 0.8431373, 1,
-0.05244175, 1.84007, 0.6867647, 0, 1, 0.8509804, 1,
-0.0523381, -0.3084652, -2.591996, 0, 1, 0.854902, 1,
-0.04775614, 2.194241, 1.649059, 0, 1, 0.8627451, 1,
-0.04266655, -0.2913051, -2.429559, 0, 1, 0.8666667, 1,
-0.0421052, -0.05322333, -1.00692, 0, 1, 0.8745098, 1,
-0.04111075, 0.24062, 0.9951817, 0, 1, 0.8784314, 1,
-0.03789926, -0.5035204, -1.53318, 0, 1, 0.8862745, 1,
-0.03635906, 0.1118595, -0.375338, 0, 1, 0.8901961, 1,
-0.0351386, 3.381225, -0.873472, 0, 1, 0.8980392, 1,
-0.03342134, 0.7062455, -0.5510779, 0, 1, 0.9058824, 1,
-0.02494648, -0.2725812, -3.620326, 0, 1, 0.9098039, 1,
-0.02334982, 0.5999314, -1.124288, 0, 1, 0.9176471, 1,
-0.02052752, -0.007611479, 0.09290294, 0, 1, 0.9215686, 1,
-0.01771187, 0.06248853, -0.3175717, 0, 1, 0.9294118, 1,
-0.0170439, 0.5040957, -0.5378697, 0, 1, 0.9333333, 1,
-0.01445213, -0.05737313, -1.946258, 0, 1, 0.9411765, 1,
-0.01152439, 1.891862, 0.1158328, 0, 1, 0.945098, 1,
-0.01073982, 0.1208188, 1.57549, 0, 1, 0.9529412, 1,
-0.009657438, 0.8527755, -0.02950444, 0, 1, 0.9568627, 1,
-0.008037898, 0.5169941, 0.8247865, 0, 1, 0.9647059, 1,
-0.00780215, -0.1736637, -1.313609, 0, 1, 0.9686275, 1,
-0.006390622, 0.3135042, -1.216438, 0, 1, 0.9764706, 1,
-0.005804353, 0.4783918, -1.224813, 0, 1, 0.9803922, 1,
-0.004390857, -1.524494, -3.560769, 0, 1, 0.9882353, 1,
-0.002651622, -0.739996, -0.7994831, 0, 1, 0.9921569, 1,
-0.00238401, 0.3936027, -0.9029483, 0, 1, 1, 1,
-0.001850045, -1.00991, -5.51215, 0, 0.9921569, 1, 1,
0.001016511, -0.156355, 0.9918864, 0, 0.9882353, 1, 1,
0.001982447, 0.4668038, 1.68999, 0, 0.9803922, 1, 1,
0.002231843, 0.850038, 0.7411464, 0, 0.9764706, 1, 1,
0.007775056, -1.239341, 2.406281, 0, 0.9686275, 1, 1,
0.0111093, 2.910169, -0.3643932, 0, 0.9647059, 1, 1,
0.01264589, 0.569676, 0.2884763, 0, 0.9568627, 1, 1,
0.01303416, 0.5567977, 0.782186, 0, 0.9529412, 1, 1,
0.01414602, -0.9708786, 3.021983, 0, 0.945098, 1, 1,
0.01507824, -1.207035, 1.373589, 0, 0.9411765, 1, 1,
0.02022131, -0.2997625, 3.004109, 0, 0.9333333, 1, 1,
0.02307529, -1.265131, 3.50178, 0, 0.9294118, 1, 1,
0.0231381, -0.02868616, 2.964306, 0, 0.9215686, 1, 1,
0.02919277, -1.081835, 4.070763, 0, 0.9176471, 1, 1,
0.02971515, 1.341853, 0.1315198, 0, 0.9098039, 1, 1,
0.0334242, 1.171331, -0.4014029, 0, 0.9058824, 1, 1,
0.03402907, 0.2767448, 1.063436, 0, 0.8980392, 1, 1,
0.03668511, -1.320179, 4.525696, 0, 0.8901961, 1, 1,
0.03734412, -0.2961461, 1.834446, 0, 0.8862745, 1, 1,
0.03787763, 0.8967229, 0.3314351, 0, 0.8784314, 1, 1,
0.04074663, -0.5561462, 4.854342, 0, 0.8745098, 1, 1,
0.04133653, -0.6420931, 2.72518, 0, 0.8666667, 1, 1,
0.0414453, -0.7103344, 3.679575, 0, 0.8627451, 1, 1,
0.04162317, 1.414368, 0.07491873, 0, 0.854902, 1, 1,
0.04372393, -0.9425464, 2.694585, 0, 0.8509804, 1, 1,
0.04543401, -0.9428464, 1.982035, 0, 0.8431373, 1, 1,
0.0482315, -0.9224187, 4.53871, 0, 0.8392157, 1, 1,
0.05350234, 1.959184, -0.1716629, 0, 0.8313726, 1, 1,
0.05357311, -0.5651206, 2.131616, 0, 0.827451, 1, 1,
0.05505722, 0.5104634, -0.9699126, 0, 0.8196079, 1, 1,
0.05615054, 1.458285, -1.172744, 0, 0.8156863, 1, 1,
0.0612912, -0.7332024, 3.677726, 0, 0.8078431, 1, 1,
0.06454754, 0.9206221, -0.8215606, 0, 0.8039216, 1, 1,
0.06462751, -0.9637466, 2.52936, 0, 0.7960784, 1, 1,
0.06531073, -0.3545606, 3.692285, 0, 0.7882353, 1, 1,
0.06655522, -0.7001925, 2.143905, 0, 0.7843137, 1, 1,
0.06964429, 0.007323404, 0.1716323, 0, 0.7764706, 1, 1,
0.07122091, 0.8207257, 0.3824216, 0, 0.772549, 1, 1,
0.07547613, 0.7174115, -0.05617674, 0, 0.7647059, 1, 1,
0.07675909, 0.5940635, -0.6672996, 0, 0.7607843, 1, 1,
0.07682236, -0.3813461, 4.86419, 0, 0.7529412, 1, 1,
0.07988286, 0.8755035, -0.9804473, 0, 0.7490196, 1, 1,
0.08285714, -1.10242, 3.627223, 0, 0.7411765, 1, 1,
0.08513755, -1.017372, 1.249553, 0, 0.7372549, 1, 1,
0.09010849, -0.822289, 4.391482, 0, 0.7294118, 1, 1,
0.09362455, 0.3675654, 0.7973622, 0, 0.7254902, 1, 1,
0.09386568, 0.7555916, -0.7067007, 0, 0.7176471, 1, 1,
0.09537229, 0.4750398, -1.061771, 0, 0.7137255, 1, 1,
0.09600822, -1.697573, 2.530452, 0, 0.7058824, 1, 1,
0.1004366, -1.093998, 4.498467, 0, 0.6980392, 1, 1,
0.10178, -1.779045, 3.78931, 0, 0.6941177, 1, 1,
0.1017995, 1.020053, -0.6930224, 0, 0.6862745, 1, 1,
0.1027925, 0.7910709, 0.7948144, 0, 0.682353, 1, 1,
0.1049414, 0.1772559, 0.1003297, 0, 0.6745098, 1, 1,
0.1135635, -1.343343, 2.908559, 0, 0.6705883, 1, 1,
0.1165056, 1.903123, 0.3689889, 0, 0.6627451, 1, 1,
0.117642, 2.555363, -0.4400057, 0, 0.6588235, 1, 1,
0.1190456, -2.061996, 4.614429, 0, 0.6509804, 1, 1,
0.1236168, 1.334424, 0.1456317, 0, 0.6470588, 1, 1,
0.1240367, 0.3571254, -1.532615, 0, 0.6392157, 1, 1,
0.1244382, 0.8094363, -1.460839, 0, 0.6352941, 1, 1,
0.1326338, -2.032676, 1.87268, 0, 0.627451, 1, 1,
0.1336052, 1.854513, -0.1768895, 0, 0.6235294, 1, 1,
0.1439811, 0.1607379, 0.830019, 0, 0.6156863, 1, 1,
0.1506501, 1.271905, 0.3680837, 0, 0.6117647, 1, 1,
0.1605529, 0.6679916, 0.6419574, 0, 0.6039216, 1, 1,
0.1609164, 0.5745161, 1.464306, 0, 0.5960785, 1, 1,
0.1659603, 1.253526, 0.4362206, 0, 0.5921569, 1, 1,
0.1669448, 0.7358952, -1.122638, 0, 0.5843138, 1, 1,
0.1679937, -0.8780584, 0.2899418, 0, 0.5803922, 1, 1,
0.1688691, 0.5851735, -0.3051001, 0, 0.572549, 1, 1,
0.1714768, 0.250049, 2.423759, 0, 0.5686275, 1, 1,
0.1781311, 1.593172, 1.869394, 0, 0.5607843, 1, 1,
0.179969, 0.8747425, -0.0146471, 0, 0.5568628, 1, 1,
0.1808066, 0.1772561, -0.2458123, 0, 0.5490196, 1, 1,
0.188264, 0.1169962, 1.142095, 0, 0.5450981, 1, 1,
0.1883832, -1.51892, 2.69368, 0, 0.5372549, 1, 1,
0.2059769, -2.310476, 3.592232, 0, 0.5333334, 1, 1,
0.2095331, 0.03533319, 1.325723, 0, 0.5254902, 1, 1,
0.2127306, 0.2158684, 1.648317, 0, 0.5215687, 1, 1,
0.2145784, 2.232092, 0.1803457, 0, 0.5137255, 1, 1,
0.2152782, -0.9076716, 1.908212, 0, 0.509804, 1, 1,
0.2153822, 1.775673, -1.262495, 0, 0.5019608, 1, 1,
0.2160811, 2.232097, 0.0510086, 0, 0.4941176, 1, 1,
0.2165583, 1.512457, 0.7923838, 0, 0.4901961, 1, 1,
0.2191748, -0.8747472, 3.852043, 0, 0.4823529, 1, 1,
0.2219325, -0.7107157, 3.757293, 0, 0.4784314, 1, 1,
0.2221408, 0.1250285, 2.662183, 0, 0.4705882, 1, 1,
0.2240795, -2.260999, 3.600775, 0, 0.4666667, 1, 1,
0.2258064, -0.5195851, 3.167401, 0, 0.4588235, 1, 1,
0.2272797, -1.521854, 3.595307, 0, 0.454902, 1, 1,
0.2277771, -0.5954149, 4.265347, 0, 0.4470588, 1, 1,
0.2314533, 1.976435, -0.3461296, 0, 0.4431373, 1, 1,
0.2330138, 1.648459, -0.2991723, 0, 0.4352941, 1, 1,
0.2368265, 1.166435, -0.3356531, 0, 0.4313726, 1, 1,
0.2381895, -2.126883, 1.333374, 0, 0.4235294, 1, 1,
0.2385664, 1.546772, -1.120284, 0, 0.4196078, 1, 1,
0.2395235, 0.293851, 0.1318723, 0, 0.4117647, 1, 1,
0.2408003, -2.313974, 2.144841, 0, 0.4078431, 1, 1,
0.2446371, 0.06928784, 1.287321, 0, 0.4, 1, 1,
0.246001, 0.3516612, 1.225949, 0, 0.3921569, 1, 1,
0.2525134, 0.5649891, 0.9571249, 0, 0.3882353, 1, 1,
0.2590336, -1.122723, 1.417119, 0, 0.3803922, 1, 1,
0.2598979, -0.7432554, 3.24768, 0, 0.3764706, 1, 1,
0.2622229, 1.068915, 0.3325647, 0, 0.3686275, 1, 1,
0.2637497, 0.5987654, 1.798709, 0, 0.3647059, 1, 1,
0.2638865, -1.712244, 3.029112, 0, 0.3568628, 1, 1,
0.2645983, 0.1140831, 1.385125, 0, 0.3529412, 1, 1,
0.2650615, 0.4217798, -0.49768, 0, 0.345098, 1, 1,
0.270183, -0.806632, 2.489483, 0, 0.3411765, 1, 1,
0.2726625, -1.668327, 1.385448, 0, 0.3333333, 1, 1,
0.2749712, -0.4367109, 2.544943, 0, 0.3294118, 1, 1,
0.2758209, -0.313127, 1.040622, 0, 0.3215686, 1, 1,
0.2765293, -0.539067, 3.483874, 0, 0.3176471, 1, 1,
0.2766984, 0.3173727, 0.796349, 0, 0.3098039, 1, 1,
0.2805933, 0.5288568, -0.7016515, 0, 0.3058824, 1, 1,
0.2830837, 0.7349024, -0.9647575, 0, 0.2980392, 1, 1,
0.284297, -1.111095, 1.999686, 0, 0.2901961, 1, 1,
0.2896934, 1.171989, -0.09891593, 0, 0.2862745, 1, 1,
0.2945271, -0.0559748, 3.052849, 0, 0.2784314, 1, 1,
0.300864, 1.151061, -0.04732833, 0, 0.2745098, 1, 1,
0.3043272, 1.800947, 0.6743892, 0, 0.2666667, 1, 1,
0.3104969, -0.9873297, 2.94508, 0, 0.2627451, 1, 1,
0.312526, 0.3327179, 0.4314059, 0, 0.254902, 1, 1,
0.3135197, 0.5289767, 0.9898978, 0, 0.2509804, 1, 1,
0.3163102, 0.6589921, 0.7575405, 0, 0.2431373, 1, 1,
0.3166061, 0.0479372, 2.013211, 0, 0.2392157, 1, 1,
0.3173071, 1.105351, -1.705282, 0, 0.2313726, 1, 1,
0.3239022, 0.9605626, 0.652748, 0, 0.227451, 1, 1,
0.3239363, -0.04917986, 2.143179, 0, 0.2196078, 1, 1,
0.3250738, -0.6229358, 1.570701, 0, 0.2156863, 1, 1,
0.3327124, 1.314825, 0.2879627, 0, 0.2078431, 1, 1,
0.3368693, -0.5882353, 3.168986, 0, 0.2039216, 1, 1,
0.3388497, -0.7757446, 2.727155, 0, 0.1960784, 1, 1,
0.3405254, 0.5791429, 1.190147, 0, 0.1882353, 1, 1,
0.3428011, -0.3659443, 2.080178, 0, 0.1843137, 1, 1,
0.3463922, -0.4486758, 3.549892, 0, 0.1764706, 1, 1,
0.3468407, 0.2973062, 1.139909, 0, 0.172549, 1, 1,
0.3521003, 0.9149861, 1.111652, 0, 0.1647059, 1, 1,
0.3523872, -0.2814983, 2.857665, 0, 0.1607843, 1, 1,
0.3527693, -0.1724782, 3.417916, 0, 0.1529412, 1, 1,
0.3576389, 1.497475, -0.2022551, 0, 0.1490196, 1, 1,
0.3617328, 1.513875, 0.9709508, 0, 0.1411765, 1, 1,
0.3696117, -0.4772574, 3.137912, 0, 0.1372549, 1, 1,
0.3696473, 0.7350819, 1.670984, 0, 0.1294118, 1, 1,
0.3701913, 0.9137844, 1.036032, 0, 0.1254902, 1, 1,
0.3718129, -0.6777036, 1.749598, 0, 0.1176471, 1, 1,
0.3730301, -0.8413791, 3.152867, 0, 0.1137255, 1, 1,
0.3730939, -0.3303504, 1.546532, 0, 0.1058824, 1, 1,
0.3769883, 0.808596, -0.2044408, 0, 0.09803922, 1, 1,
0.3796598, 0.2167754, 1.930485, 0, 0.09411765, 1, 1,
0.3805627, -0.4454766, 2.237386, 0, 0.08627451, 1, 1,
0.3806901, 0.05227341, 0.982353, 0, 0.08235294, 1, 1,
0.3842481, 0.8618658, -0.2731984, 0, 0.07450981, 1, 1,
0.3858733, -0.2707354, 4.574508, 0, 0.07058824, 1, 1,
0.3908215, -0.3188996, 0.8917258, 0, 0.0627451, 1, 1,
0.3924531, 0.3649539, 0.5528204, 0, 0.05882353, 1, 1,
0.396744, 1.048617, 0.998372, 0, 0.05098039, 1, 1,
0.3996119, 0.5473391, -0.8639956, 0, 0.04705882, 1, 1,
0.4046061, -1.02642, 2.921781, 0, 0.03921569, 1, 1,
0.4051267, 0.8734139, 0.1409027, 0, 0.03529412, 1, 1,
0.4066271, -1.376345, 4.136596, 0, 0.02745098, 1, 1,
0.4122797, -1.548425, 3.179382, 0, 0.02352941, 1, 1,
0.4142081, -0.8921336, 2.145301, 0, 0.01568628, 1, 1,
0.4154378, -0.8915632, 2.723022, 0, 0.01176471, 1, 1,
0.4182271, 0.3061528, -1.045418, 0, 0.003921569, 1, 1,
0.4225051, 0.2595035, 1.188368, 0.003921569, 0, 1, 1,
0.4236058, -1.51276, 4.578902, 0.007843138, 0, 1, 1,
0.4243743, -0.2328394, 1.004262, 0.01568628, 0, 1, 1,
0.4287294, 0.8453803, -0.5145382, 0.01960784, 0, 1, 1,
0.4304102, -0.7057333, 2.951234, 0.02745098, 0, 1, 1,
0.4315725, 0.4969507, 1.798753, 0.03137255, 0, 1, 1,
0.4317699, -0.4421574, 4.122139, 0.03921569, 0, 1, 1,
0.4324673, -0.140027, 2.759394, 0.04313726, 0, 1, 1,
0.4392832, 1.500372, 2.412336, 0.05098039, 0, 1, 1,
0.4405285, -1.883205, 3.495471, 0.05490196, 0, 1, 1,
0.4411747, 0.2890384, 1.153562, 0.0627451, 0, 1, 1,
0.4518833, 0.7516832, 0.5123266, 0.06666667, 0, 1, 1,
0.45352, 0.5425676, 1.054272, 0.07450981, 0, 1, 1,
0.4544258, -1.900047, 3.400124, 0.07843138, 0, 1, 1,
0.4564756, -1.474103, 3.348927, 0.08627451, 0, 1, 1,
0.4593363, 0.9472196, 0.9158966, 0.09019608, 0, 1, 1,
0.4603456, 0.8699244, 0.8246576, 0.09803922, 0, 1, 1,
0.4606622, -2.229087, 0.6273128, 0.1058824, 0, 1, 1,
0.4618586, 0.2160143, 0.08817735, 0.1098039, 0, 1, 1,
0.4621129, -0.4424716, 1.645644, 0.1176471, 0, 1, 1,
0.4629599, 2.098652, 0.6964274, 0.1215686, 0, 1, 1,
0.4648755, 1.057445, -1.224552, 0.1294118, 0, 1, 1,
0.4681071, 0.4091425, 3.042044, 0.1333333, 0, 1, 1,
0.4725406, -0.195621, 2.493673, 0.1411765, 0, 1, 1,
0.4725769, 0.3503244, 2.222279, 0.145098, 0, 1, 1,
0.4784911, -1.394276, 2.267508, 0.1529412, 0, 1, 1,
0.4786864, 0.7443131, -0.3043767, 0.1568628, 0, 1, 1,
0.481363, 1.928838, 0.6316655, 0.1647059, 0, 1, 1,
0.4845962, -1.147428, 3.83542, 0.1686275, 0, 1, 1,
0.4902411, -0.2006225, 1.696337, 0.1764706, 0, 1, 1,
0.4920966, -0.9374513, 2.17329, 0.1803922, 0, 1, 1,
0.4977678, -2.901584, 4.36826, 0.1882353, 0, 1, 1,
0.4996212, 0.8622265, 0.2557708, 0.1921569, 0, 1, 1,
0.5017765, -1.660838, 2.566328, 0.2, 0, 1, 1,
0.5055973, -1.400051, 3.393493, 0.2078431, 0, 1, 1,
0.5073582, 0.8503064, -0.5082883, 0.2117647, 0, 1, 1,
0.5099199, 1.918918, -0.4592442, 0.2196078, 0, 1, 1,
0.5132748, 2.013069, -0.009245213, 0.2235294, 0, 1, 1,
0.5137952, -0.924623, 2.100685, 0.2313726, 0, 1, 1,
0.5149397, -0.1821341, 1.586307, 0.2352941, 0, 1, 1,
0.5279166, 0.02607036, 1.610444, 0.2431373, 0, 1, 1,
0.5335997, 1.644026, 0.01211611, 0.2470588, 0, 1, 1,
0.5360696, 0.2349464, 1.225529, 0.254902, 0, 1, 1,
0.5370992, -1.856293, 1.531495, 0.2588235, 0, 1, 1,
0.5377096, -0.305504, 0.992368, 0.2666667, 0, 1, 1,
0.5407918, 0.3417881, 1.827211, 0.2705882, 0, 1, 1,
0.5442139, 2.110331, 1.192077, 0.2784314, 0, 1, 1,
0.5457348, -0.4824472, 2.787184, 0.282353, 0, 1, 1,
0.5462289, 0.2411548, 1.187738, 0.2901961, 0, 1, 1,
0.5465511, 0.6551641, 0.1753103, 0.2941177, 0, 1, 1,
0.5491315, 0.444465, 0.6390328, 0.3019608, 0, 1, 1,
0.5501534, -1.045438, 2.677709, 0.3098039, 0, 1, 1,
0.5515145, 0.6071436, 2.329385, 0.3137255, 0, 1, 1,
0.559201, -0.04172745, 0.8388955, 0.3215686, 0, 1, 1,
0.5680944, -0.5941447, 2.278582, 0.3254902, 0, 1, 1,
0.5697185, -0.1454688, 2.798259, 0.3333333, 0, 1, 1,
0.5707722, -0.03129474, 1.294357, 0.3372549, 0, 1, 1,
0.5735776, 1.617174, 0.7238674, 0.345098, 0, 1, 1,
0.574358, 1.675196, 1.433963, 0.3490196, 0, 1, 1,
0.5827802, 0.3282537, 0.7327528, 0.3568628, 0, 1, 1,
0.5840467, -0.3626046, 0.6742105, 0.3607843, 0, 1, 1,
0.5855846, -0.6091637, 2.841365, 0.3686275, 0, 1, 1,
0.5859446, 1.68557, 0.8066822, 0.372549, 0, 1, 1,
0.6004227, -0.4761533, 0.595944, 0.3803922, 0, 1, 1,
0.6004562, 0.670245, 2.204532, 0.3843137, 0, 1, 1,
0.6014723, -0.3659491, 1.833214, 0.3921569, 0, 1, 1,
0.6040416, -0.5532142, 0.5645732, 0.3960784, 0, 1, 1,
0.6065083, 0.7845161, 1.139511, 0.4039216, 0, 1, 1,
0.6103827, 0.7351723, 0.9666166, 0.4117647, 0, 1, 1,
0.6106396, 0.01395815, 3.303828, 0.4156863, 0, 1, 1,
0.6121209, 1.20259, 2.297947, 0.4235294, 0, 1, 1,
0.6136652, 0.01176688, 1.812284, 0.427451, 0, 1, 1,
0.6138631, -1.475428, 4.363423, 0.4352941, 0, 1, 1,
0.6141775, -1.410058, 2.102793, 0.4392157, 0, 1, 1,
0.6144485, -0.1498215, 1.284169, 0.4470588, 0, 1, 1,
0.6149226, -0.6866674, 3.169507, 0.4509804, 0, 1, 1,
0.6195272, -1.164434, 2.27811, 0.4588235, 0, 1, 1,
0.6268662, 1.845145, -0.5283463, 0.4627451, 0, 1, 1,
0.6278736, -0.6553593, 3.127382, 0.4705882, 0, 1, 1,
0.631374, 0.9009108, 1.61005, 0.4745098, 0, 1, 1,
0.6325555, -1.028975, 3.066291, 0.4823529, 0, 1, 1,
0.6343691, -1.29405, 3.717499, 0.4862745, 0, 1, 1,
0.6360268, 0.2025266, -0.04968753, 0.4941176, 0, 1, 1,
0.6361803, 0.6396143, 0.3527173, 0.5019608, 0, 1, 1,
0.6380625, -0.9808339, 1.241276, 0.5058824, 0, 1, 1,
0.6410504, 1.808398, 0.4917285, 0.5137255, 0, 1, 1,
0.642383, 0.7648743, -0.9844053, 0.5176471, 0, 1, 1,
0.6521684, -0.6183326, -0.9974415, 0.5254902, 0, 1, 1,
0.654273, -1.152999, 1.589909, 0.5294118, 0, 1, 1,
0.6544144, 1.191878, 1.085049, 0.5372549, 0, 1, 1,
0.6612543, -0.564822, 2.63777, 0.5411765, 0, 1, 1,
0.6615333, -0.7527238, -1.026986, 0.5490196, 0, 1, 1,
0.6691512, 0.449418, 1.988687, 0.5529412, 0, 1, 1,
0.6697663, 0.4816329, 0.8043336, 0.5607843, 0, 1, 1,
0.6868092, -0.9723126, 4.721664, 0.5647059, 0, 1, 1,
0.6883297, 0.9896492, 0.5106626, 0.572549, 0, 1, 1,
0.6951177, 0.2289195, -0.2940382, 0.5764706, 0, 1, 1,
0.7066079, 0.006094262, 2.547809, 0.5843138, 0, 1, 1,
0.708652, -0.296623, 3.905082, 0.5882353, 0, 1, 1,
0.7089942, -1.480849, 3.945584, 0.5960785, 0, 1, 1,
0.7143298, 1.287634, 1.433469, 0.6039216, 0, 1, 1,
0.7231132, 0.7646814, -0.4533736, 0.6078432, 0, 1, 1,
0.7324592, 2.817643, 1.006123, 0.6156863, 0, 1, 1,
0.7325348, 0.52674, 1.873231, 0.6196079, 0, 1, 1,
0.7325352, 0.2813666, 1.830846, 0.627451, 0, 1, 1,
0.7330889, -2.249114, 4.346544, 0.6313726, 0, 1, 1,
0.7426319, 0.7074005, 0.5860326, 0.6392157, 0, 1, 1,
0.7533347, -0.2818751, 1.740981, 0.6431373, 0, 1, 1,
0.7547816, -0.8767338, 2.803199, 0.6509804, 0, 1, 1,
0.7571772, -1.12608, 1.832757, 0.654902, 0, 1, 1,
0.7596832, -0.06541757, 2.873423, 0.6627451, 0, 1, 1,
0.7610619, 0.2620185, 1.948906, 0.6666667, 0, 1, 1,
0.7682755, 0.5474988, 1.935459, 0.6745098, 0, 1, 1,
0.7685958, -0.330221, 1.797995, 0.6784314, 0, 1, 1,
0.7704288, 1.1575, 0.4587598, 0.6862745, 0, 1, 1,
0.7721007, 1.841908, 0.196553, 0.6901961, 0, 1, 1,
0.7782094, 0.6101955, 1.721297, 0.6980392, 0, 1, 1,
0.7841327, 0.6966831, 0.275807, 0.7058824, 0, 1, 1,
0.7848536, -0.1825724, 0.6276231, 0.7098039, 0, 1, 1,
0.7870877, -1.790817, 1.55584, 0.7176471, 0, 1, 1,
0.7893664, 0.8156415, 1.110339, 0.7215686, 0, 1, 1,
0.8011075, 0.429044, 1.930422, 0.7294118, 0, 1, 1,
0.8034987, -0.7643146, 2.137259, 0.7333333, 0, 1, 1,
0.8115428, -1.734134, 1.798571, 0.7411765, 0, 1, 1,
0.8125293, 1.598814, 1.992029, 0.7450981, 0, 1, 1,
0.8228573, -0.1997845, -0.5916843, 0.7529412, 0, 1, 1,
0.8242863, -0.1540659, 2.660851, 0.7568628, 0, 1, 1,
0.8251931, 1.551431, 0.2836166, 0.7647059, 0, 1, 1,
0.838764, 1.48352, 1.428014, 0.7686275, 0, 1, 1,
0.8413908, -0.5583748, 2.90124, 0.7764706, 0, 1, 1,
0.8417546, 0.7015446, 0.3121069, 0.7803922, 0, 1, 1,
0.8440043, 0.2956279, 2.419528, 0.7882353, 0, 1, 1,
0.8450854, -1.006133, 1.81567, 0.7921569, 0, 1, 1,
0.8488391, -1.845708, 2.709036, 0.8, 0, 1, 1,
0.8497151, 0.06547177, 1.746015, 0.8078431, 0, 1, 1,
0.8513123, -1.304184, 3.453775, 0.8117647, 0, 1, 1,
0.8517166, 0.2713254, 2.555696, 0.8196079, 0, 1, 1,
0.8522425, -0.04135447, 0.7991383, 0.8235294, 0, 1, 1,
0.8575343, 1.657784, -1.037685, 0.8313726, 0, 1, 1,
0.8580794, 1.686992, 0.8637968, 0.8352941, 0, 1, 1,
0.8604532, 0.175708, 1.751379, 0.8431373, 0, 1, 1,
0.8632951, 2.614567, 2.442352, 0.8470588, 0, 1, 1,
0.8653626, -0.6606461, 2.023177, 0.854902, 0, 1, 1,
0.8670275, -0.834765, 3.90095, 0.8588235, 0, 1, 1,
0.8678282, -1.0222, 2.715594, 0.8666667, 0, 1, 1,
0.8724772, 0.3243511, 1.522487, 0.8705882, 0, 1, 1,
0.8829238, 0.9679545, 1.466703, 0.8784314, 0, 1, 1,
0.8855852, -1.33062, 3.409721, 0.8823529, 0, 1, 1,
0.8874733, -1.079769, 2.571786, 0.8901961, 0, 1, 1,
0.8878417, 1.014157, 3.190569, 0.8941177, 0, 1, 1,
0.8911284, -0.06719393, 3.316213, 0.9019608, 0, 1, 1,
0.896329, -0.8713933, 2.062918, 0.9098039, 0, 1, 1,
0.8996813, -1.110537, 1.371539, 0.9137255, 0, 1, 1,
0.9043103, -0.06546728, 1.899792, 0.9215686, 0, 1, 1,
0.907401, 0.7792121, 1.06547, 0.9254902, 0, 1, 1,
0.9142972, -0.5808349, 1.115329, 0.9333333, 0, 1, 1,
0.9145753, 1.075884, -0.8400358, 0.9372549, 0, 1, 1,
0.9185682, 1.754623, 0.6218723, 0.945098, 0, 1, 1,
0.9189793, -0.2845269, 0.6171726, 0.9490196, 0, 1, 1,
0.9239923, -0.1807793, 2.174619, 0.9568627, 0, 1, 1,
0.9310524, 1.337883, 1.438658, 0.9607843, 0, 1, 1,
0.9397472, 0.7276958, 0.9144088, 0.9686275, 0, 1, 1,
0.939823, 1.689335, -0.6173182, 0.972549, 0, 1, 1,
0.9407964, 0.09348762, 1.519303, 0.9803922, 0, 1, 1,
0.946867, 0.4061328, 1.948058, 0.9843137, 0, 1, 1,
0.9478382, 0.2023458, 2.423322, 0.9921569, 0, 1, 1,
0.9518492, 1.730605, 0.169946, 0.9960784, 0, 1, 1,
0.9526143, -0.05871382, 0.7380521, 1, 0, 0.9960784, 1,
0.9544076, -0.7606348, 0.8303757, 1, 0, 0.9882353, 1,
0.9630094, -0.9894221, 2.189419, 1, 0, 0.9843137, 1,
0.9645547, 1.448945, 1.036574, 1, 0, 0.9764706, 1,
0.9809402, -0.8536187, 4.356698, 1, 0, 0.972549, 1,
0.981195, -1.790318, 3.914479, 1, 0, 0.9647059, 1,
0.9822963, 0.08961397, 2.123709, 1, 0, 0.9607843, 1,
0.9826478, 0.5237992, 1.971389, 1, 0, 0.9529412, 1,
0.9839431, -0.8216377, 1.047923, 1, 0, 0.9490196, 1,
0.9918581, 0.8727574, 1.468269, 1, 0, 0.9411765, 1,
1.005988, -1.859524, 3.237234, 1, 0, 0.9372549, 1,
1.01533, 0.3969666, 0.6542345, 1, 0, 0.9294118, 1,
1.017853, 1.693024, 2.590375, 1, 0, 0.9254902, 1,
1.019453, 2.287956, 0.3167986, 1, 0, 0.9176471, 1,
1.021151, -1.441302, 3.719091, 1, 0, 0.9137255, 1,
1.022947, 0.838415, 1.074917, 1, 0, 0.9058824, 1,
1.026344, 0.7906306, 2.878097, 1, 0, 0.9019608, 1,
1.029787, 0.7583006, 1.170174, 1, 0, 0.8941177, 1,
1.033086, -0.4344035, 1.393925, 1, 0, 0.8862745, 1,
1.041873, -0.08974472, 1.021695, 1, 0, 0.8823529, 1,
1.045183, 1.003235, 1.920073, 1, 0, 0.8745098, 1,
1.046166, 0.1019119, 1.093427, 1, 0, 0.8705882, 1,
1.049571, -0.2576702, 0.7862408, 1, 0, 0.8627451, 1,
1.065545, 0.1000399, 0.9666926, 1, 0, 0.8588235, 1,
1.06772, -0.7071964, 0.8022488, 1, 0, 0.8509804, 1,
1.069459, -1.436117, 1.568654, 1, 0, 0.8470588, 1,
1.076394, 0.8648467, 0.7235676, 1, 0, 0.8392157, 1,
1.077164, 1.428771, 2.700425, 1, 0, 0.8352941, 1,
1.083498, -0.8225552, 2.145409, 1, 0, 0.827451, 1,
1.083542, -0.3393296, 2.642476, 1, 0, 0.8235294, 1,
1.085728, 2.496762, 0.2476072, 1, 0, 0.8156863, 1,
1.093212, -0.8089249, 1.768365, 1, 0, 0.8117647, 1,
1.09346, -1.705674, 2.00247, 1, 0, 0.8039216, 1,
1.103205, -0.3965738, 0.4890992, 1, 0, 0.7960784, 1,
1.103272, 0.3745708, 0.8050103, 1, 0, 0.7921569, 1,
1.105713, 1.644751, 0.6375815, 1, 0, 0.7843137, 1,
1.109324, -1.143689, 3.271739, 1, 0, 0.7803922, 1,
1.109756, -0.8788832, 1.615963, 1, 0, 0.772549, 1,
1.111744, -0.5763534, 1.372317, 1, 0, 0.7686275, 1,
1.11177, 1.030183, 1.182478, 1, 0, 0.7607843, 1,
1.112053, 0.227251, 1.669586, 1, 0, 0.7568628, 1,
1.113517, 1.377701, -0.6969267, 1, 0, 0.7490196, 1,
1.114524, 1.08341, 0.634254, 1, 0, 0.7450981, 1,
1.115262, -1.88091, 3.712792, 1, 0, 0.7372549, 1,
1.117272, -0.7220062, 2.103754, 1, 0, 0.7333333, 1,
1.120467, -1.11794, 1.80502, 1, 0, 0.7254902, 1,
1.122179, -1.90813, 1.147686, 1, 0, 0.7215686, 1,
1.123049, -0.5331835, 1.56113, 1, 0, 0.7137255, 1,
1.125929, -0.5033611, 1.92555, 1, 0, 0.7098039, 1,
1.127689, 0.5888726, 2.179494, 1, 0, 0.7019608, 1,
1.137334, 2.282032, -1.952769, 1, 0, 0.6941177, 1,
1.139151, -0.5852906, 0.5666121, 1, 0, 0.6901961, 1,
1.143025, 0.6334359, 1.012571, 1, 0, 0.682353, 1,
1.144583, -0.7183766, 1.266827, 1, 0, 0.6784314, 1,
1.154948, -0.07195495, 0.554655, 1, 0, 0.6705883, 1,
1.162574, -0.2983469, 1.571456, 1, 0, 0.6666667, 1,
1.169413, -0.6989193, 3.115908, 1, 0, 0.6588235, 1,
1.17197, 0.0362598, 0.7778443, 1, 0, 0.654902, 1,
1.173835, 0.6676699, 1.541443, 1, 0, 0.6470588, 1,
1.179176, 0.4234687, 2.343117, 1, 0, 0.6431373, 1,
1.186532, 0.007806502, -0.1092305, 1, 0, 0.6352941, 1,
1.19398, -0.3735635, 2.800981, 1, 0, 0.6313726, 1,
1.196198, 1.037451, 1.09272, 1, 0, 0.6235294, 1,
1.202668, 2.104534, -0.3330631, 1, 0, 0.6196079, 1,
1.207376, 0.3126836, 1.019511, 1, 0, 0.6117647, 1,
1.210275, -1.974675, 3.236574, 1, 0, 0.6078432, 1,
1.211892, 0.2723671, 2.255258, 1, 0, 0.6, 1,
1.212571, -0.5768012, 1.510753, 1, 0, 0.5921569, 1,
1.216726, -0.1054258, 1.367017, 1, 0, 0.5882353, 1,
1.220096, 0.2845224, 3.648531, 1, 0, 0.5803922, 1,
1.226259, 0.9358001, -1.030104, 1, 0, 0.5764706, 1,
1.226702, 1.006131, 1.535859, 1, 0, 0.5686275, 1,
1.237081, -0.7822928, 1.543561, 1, 0, 0.5647059, 1,
1.237955, 0.1973641, 1.340426, 1, 0, 0.5568628, 1,
1.2391, -0.01242192, 1.568285, 1, 0, 0.5529412, 1,
1.249018, -0.4166124, 1.586769, 1, 0, 0.5450981, 1,
1.259866, 0.1204153, 0.8895161, 1, 0, 0.5411765, 1,
1.260903, -1.394466, 3.503851, 1, 0, 0.5333334, 1,
1.274981, -0.1912768, 3.1538, 1, 0, 0.5294118, 1,
1.307982, -0.3952043, 3.717468, 1, 0, 0.5215687, 1,
1.329791, 1.811085, 1.769809, 1, 0, 0.5176471, 1,
1.333007, -0.7043019, 4.026125, 1, 0, 0.509804, 1,
1.340998, -0.6397229, 2.219048, 1, 0, 0.5058824, 1,
1.348369, -2.258977, 1.637891, 1, 0, 0.4980392, 1,
1.351264, -0.6742113, 2.338926, 1, 0, 0.4901961, 1,
1.360983, -0.2977569, 0.4474659, 1, 0, 0.4862745, 1,
1.361645, -0.1988643, 1.319951, 1, 0, 0.4784314, 1,
1.363461, -0.7819974, 1.006249, 1, 0, 0.4745098, 1,
1.371156, -0.770687, 3.001104, 1, 0, 0.4666667, 1,
1.376976, -0.89815, 1.138883, 1, 0, 0.4627451, 1,
1.378412, -0.4055281, 2.194097, 1, 0, 0.454902, 1,
1.38384, -0.5951508, 3.451109, 1, 0, 0.4509804, 1,
1.38717, 0.3625035, 0.4056442, 1, 0, 0.4431373, 1,
1.38835, -0.409281, 1.514985, 1, 0, 0.4392157, 1,
1.390217, -0.4834936, 2.366043, 1, 0, 0.4313726, 1,
1.392557, -0.398349, 2.337113, 1, 0, 0.427451, 1,
1.393657, 1.63149, -0.9984767, 1, 0, 0.4196078, 1,
1.403324, 0.006185783, 1.978855, 1, 0, 0.4156863, 1,
1.408119, -0.03158267, 1.186581, 1, 0, 0.4078431, 1,
1.40996, 0.1611525, 0.6878694, 1, 0, 0.4039216, 1,
1.410639, -1.356951, 1.581733, 1, 0, 0.3960784, 1,
1.41455, -0.5503724, 0.9979348, 1, 0, 0.3882353, 1,
1.421908, 0.8086703, 0.4442439, 1, 0, 0.3843137, 1,
1.425725, 0.003218172, 2.373885, 1, 0, 0.3764706, 1,
1.430565, -0.1019772, 0.004571304, 1, 0, 0.372549, 1,
1.433836, -2.218483, 2.744149, 1, 0, 0.3647059, 1,
1.441916, -1.575311, 1.635997, 1, 0, 0.3607843, 1,
1.445593, -1.505911, 2.247567, 1, 0, 0.3529412, 1,
1.458841, -0.2564007, 1.404814, 1, 0, 0.3490196, 1,
1.462474, -0.7386888, 2.006498, 1, 0, 0.3411765, 1,
1.505317, -0.258104, 0.2684215, 1, 0, 0.3372549, 1,
1.506025, 0.3186599, 0.07409301, 1, 0, 0.3294118, 1,
1.509742, -0.9733204, 2.778245, 1, 0, 0.3254902, 1,
1.524677, -0.9949085, 2.695132, 1, 0, 0.3176471, 1,
1.528783, 0.8113171, 0.5131632, 1, 0, 0.3137255, 1,
1.534667, 0.5755677, 1.850449, 1, 0, 0.3058824, 1,
1.535794, -0.875955, 3.122281, 1, 0, 0.2980392, 1,
1.560367, -1.154451, 4.395648, 1, 0, 0.2941177, 1,
1.563062, -1.153795, 3.821746, 1, 0, 0.2862745, 1,
1.574248, 0.9714796, -0.1183095, 1, 0, 0.282353, 1,
1.574328, -0.8704119, 2.599126, 1, 0, 0.2745098, 1,
1.580847, 1.17139, 1.099705, 1, 0, 0.2705882, 1,
1.59476, 1.080675, 0.1777575, 1, 0, 0.2627451, 1,
1.600248, -0.8894909, 2.82333, 1, 0, 0.2588235, 1,
1.600965, 0.4894239, 2.656807, 1, 0, 0.2509804, 1,
1.605855, -0.4069866, 1.759505, 1, 0, 0.2470588, 1,
1.631256, 0.8767158, 0.7893252, 1, 0, 0.2392157, 1,
1.635524, 0.1924416, 1.750871, 1, 0, 0.2352941, 1,
1.641055, 0.1090581, 3.077751, 1, 0, 0.227451, 1,
1.651496, -0.3592927, 1.529781, 1, 0, 0.2235294, 1,
1.651831, -0.4701835, 1.491556, 1, 0, 0.2156863, 1,
1.663232, 0.1749309, -0.1348449, 1, 0, 0.2117647, 1,
1.670049, -1.244304, -0.2463306, 1, 0, 0.2039216, 1,
1.70829, -0.5291774, 1.585, 1, 0, 0.1960784, 1,
1.713179, -0.2101368, 3.312931, 1, 0, 0.1921569, 1,
1.714378, -0.9275026, -0.01285146, 1, 0, 0.1843137, 1,
1.728007, 0.5669696, 1.817891, 1, 0, 0.1803922, 1,
1.72971, -1.186539, 1.683814, 1, 0, 0.172549, 1,
1.752692, 0.4341529, 1.495643, 1, 0, 0.1686275, 1,
1.773099, 0.5291396, 1.769072, 1, 0, 0.1607843, 1,
1.773632, 0.05296159, 1.410145, 1, 0, 0.1568628, 1,
1.8105, 0.8434839, 3.136663, 1, 0, 0.1490196, 1,
1.817312, -2.179015, 3.392085, 1, 0, 0.145098, 1,
1.836793, -0.3587279, 1.000954, 1, 0, 0.1372549, 1,
1.85707, -0.5306524, 2.296974, 1, 0, 0.1333333, 1,
1.858179, -0.7302973, 1.530657, 1, 0, 0.1254902, 1,
1.87754, -1.880756, 0.9853148, 1, 0, 0.1215686, 1,
1.921222, -1.899693, 3.692284, 1, 0, 0.1137255, 1,
1.964977, -0.09734455, 1.090798, 1, 0, 0.1098039, 1,
1.968383, 0.7488239, 0.9780499, 1, 0, 0.1019608, 1,
1.987161, 0.8805478, 0.4462408, 1, 0, 0.09411765, 1,
2.00409, 1.626537, 1.411454, 1, 0, 0.09019608, 1,
2.03229, 0.0746495, 2.753291, 1, 0, 0.08235294, 1,
2.074615, 0.7115954, 0.7338262, 1, 0, 0.07843138, 1,
2.13522, 0.4740664, -0.4814947, 1, 0, 0.07058824, 1,
2.324113, 0.02874253, 0.8848053, 1, 0, 0.06666667, 1,
2.35795, 1.454254, 2.322618, 1, 0, 0.05882353, 1,
2.35921, 0.7410887, -0.2088149, 1, 0, 0.05490196, 1,
2.39827, 0.1520406, 1.929407, 1, 0, 0.04705882, 1,
2.481813, 0.4082684, 0.6154253, 1, 0, 0.04313726, 1,
2.587041, 0.3467076, 2.819986, 1, 0, 0.03529412, 1,
2.596089, 0.5712997, 1.750145, 1, 0, 0.03137255, 1,
2.853914, 0.7243129, 2.309219, 1, 0, 0.02352941, 1,
2.874634, 0.5033144, 1.863334, 1, 0, 0.01960784, 1,
3.007243, 1.843593, 1.356836, 1, 0, 0.01176471, 1,
3.230091, 0.4360377, 1.567283, 1, 0, 0.007843138, 1
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
-0.01527047, -4.151101, -7.338062, 0, -0.5, 0.5, 0.5,
-0.01527047, -4.151101, -7.338062, 1, -0.5, 0.5, 0.5,
-0.01527047, -4.151101, -7.338062, 1, 1.5, 0.5, 0.5,
-0.01527047, -4.151101, -7.338062, 0, 1.5, 0.5, 0.5
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
-4.360809, 0.1609061, -7.338062, 0, -0.5, 0.5, 0.5,
-4.360809, 0.1609061, -7.338062, 1, -0.5, 0.5, 0.5,
-4.360809, 0.1609061, -7.338062, 1, 1.5, 0.5, 0.5,
-4.360809, 0.1609061, -7.338062, 0, 1.5, 0.5, 0.5
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
-4.360809, -4.151101, -0.3526771, 0, -0.5, 0.5, 0.5,
-4.360809, -4.151101, -0.3526771, 1, -0.5, 0.5, 0.5,
-4.360809, -4.151101, -0.3526771, 1, 1.5, 0.5, 0.5,
-4.360809, -4.151101, -0.3526771, 0, 1.5, 0.5, 0.5
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
-3, -3.156022, -5.72605,
3, -3.156022, -5.72605,
-3, -3.156022, -5.72605,
-3, -3.321869, -5.994719,
-2, -3.156022, -5.72605,
-2, -3.321869, -5.994719,
-1, -3.156022, -5.72605,
-1, -3.321869, -5.994719,
0, -3.156022, -5.72605,
0, -3.321869, -5.994719,
1, -3.156022, -5.72605,
1, -3.321869, -5.994719,
2, -3.156022, -5.72605,
2, -3.321869, -5.994719,
3, -3.156022, -5.72605,
3, -3.321869, -5.994719
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
-3, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
-3, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
-3, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
-3, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
-2, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
-2, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
-2, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
-2, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
-1, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
-1, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
-1, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
-1, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
0, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
0, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
0, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
0, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
1, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
1, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
1, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
1, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
2, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
2, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
2, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
2, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5,
3, -3.653562, -6.532056, 0, -0.5, 0.5, 0.5,
3, -3.653562, -6.532056, 1, -0.5, 0.5, 0.5,
3, -3.653562, -6.532056, 1, 1.5, 0.5, 0.5,
3, -3.653562, -6.532056, 0, 1.5, 0.5, 0.5
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
-3.357992, -3, -5.72605,
-3.357992, 3, -5.72605,
-3.357992, -3, -5.72605,
-3.525129, -3, -5.994719,
-3.357992, -2, -5.72605,
-3.525129, -2, -5.994719,
-3.357992, -1, -5.72605,
-3.525129, -1, -5.994719,
-3.357992, 0, -5.72605,
-3.525129, 0, -5.994719,
-3.357992, 1, -5.72605,
-3.525129, 1, -5.994719,
-3.357992, 2, -5.72605,
-3.525129, 2, -5.994719,
-3.357992, 3, -5.72605,
-3.525129, 3, -5.994719
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
-3.859401, -3, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, -3, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, -3, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, -3, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, -2, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, -2, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, -2, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, -2, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, -1, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, -1, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, -1, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, -1, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, 0, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, 0, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, 0, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, 0, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, 1, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, 1, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, 1, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, 1, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, 2, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, 2, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, 2, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, 2, -6.532056, 0, 1.5, 0.5, 0.5,
-3.859401, 3, -6.532056, 0, -0.5, 0.5, 0.5,
-3.859401, 3, -6.532056, 1, -0.5, 0.5, 0.5,
-3.859401, 3, -6.532056, 1, 1.5, 0.5, 0.5,
-3.859401, 3, -6.532056, 0, 1.5, 0.5, 0.5
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
-3.357992, -3.156022, -4,
-3.357992, -3.156022, 4,
-3.357992, -3.156022, -4,
-3.525129, -3.321869, -4,
-3.357992, -3.156022, -2,
-3.525129, -3.321869, -2,
-3.357992, -3.156022, 0,
-3.525129, -3.321869, 0,
-3.357992, -3.156022, 2,
-3.525129, -3.321869, 2,
-3.357992, -3.156022, 4,
-3.525129, -3.321869, 4
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
-3.859401, -3.653562, -4, 0, -0.5, 0.5, 0.5,
-3.859401, -3.653562, -4, 1, -0.5, 0.5, 0.5,
-3.859401, -3.653562, -4, 1, 1.5, 0.5, 0.5,
-3.859401, -3.653562, -4, 0, 1.5, 0.5, 0.5,
-3.859401, -3.653562, -2, 0, -0.5, 0.5, 0.5,
-3.859401, -3.653562, -2, 1, -0.5, 0.5, 0.5,
-3.859401, -3.653562, -2, 1, 1.5, 0.5, 0.5,
-3.859401, -3.653562, -2, 0, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 0, 0, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 0, 1, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 0, 1, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 0, 0, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 2, 0, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 2, 1, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 2, 1, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 2, 0, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 4, 0, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 4, 1, -0.5, 0.5, 0.5,
-3.859401, -3.653562, 4, 1, 1.5, 0.5, 0.5,
-3.859401, -3.653562, 4, 0, 1.5, 0.5, 0.5
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
-3.357992, -3.156022, -5.72605,
-3.357992, 3.477834, -5.72605,
-3.357992, -3.156022, 5.020696,
-3.357992, 3.477834, 5.020696,
-3.357992, -3.156022, -5.72605,
-3.357992, -3.156022, 5.020696,
-3.357992, 3.477834, -5.72605,
-3.357992, 3.477834, 5.020696,
-3.357992, -3.156022, -5.72605,
3.327451, -3.156022, -5.72605,
-3.357992, -3.156022, 5.020696,
3.327451, -3.156022, 5.020696,
-3.357992, 3.477834, -5.72605,
3.327451, 3.477834, -5.72605,
-3.357992, 3.477834, 5.020696,
3.327451, 3.477834, 5.020696,
3.327451, -3.156022, -5.72605,
3.327451, 3.477834, -5.72605,
3.327451, -3.156022, 5.020696,
3.327451, 3.477834, 5.020696,
3.327451, -3.156022, -5.72605,
3.327451, -3.156022, 5.020696,
3.327451, 3.477834, -5.72605,
3.327451, 3.477834, 5.020696
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
var radius = 7.630427;
var distance = 33.94863;
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
mvMatrix.translate( 0.01527047, -0.1609061, 0.3526771 );
mvMatrix.scale( 1.234049, 1.243646, 0.7676898 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94863);
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
acibenzolar-S-methyl<-read.table("acibenzolar-S-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acibenzolar-S-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'acibenzolar' not found
```

```r
y<-acibenzolar-S-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'acibenzolar' not found
```

```r
z<-acibenzolar-S-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'acibenzolar' not found
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
-3.260632, -0.634251, -1.970298, 0, 0, 1, 1, 1,
-3.079113, -0.7862554, -3.820405, 1, 0, 0, 1, 1,
-3.069632, 0.752885, 0.535023, 1, 0, 0, 1, 1,
-2.871621, -1.034924, -3.149916, 1, 0, 0, 1, 1,
-2.835189, -0.858885, -1.647049, 1, 0, 0, 1, 1,
-2.770543, -0.4045356, -0.5178587, 1, 0, 0, 1, 1,
-2.539591, -1.008541, -1.246733, 0, 0, 0, 1, 1,
-2.469287, 0.1589579, -1.080597, 0, 0, 0, 1, 1,
-2.440534, 0.5676843, -0.8543676, 0, 0, 0, 1, 1,
-2.414729, -0.9034283, -2.824749, 0, 0, 0, 1, 1,
-2.367723, 0.921171, -0.7226909, 0, 0, 0, 1, 1,
-2.326844, -1.417831, -3.878314, 0, 0, 0, 1, 1,
-2.235431, -1.6521, -1.00986, 0, 0, 0, 1, 1,
-2.127199, 2.061773, -1.042778, 1, 1, 1, 1, 1,
-2.121938, 1.620778, -0.6725212, 1, 1, 1, 1, 1,
-2.104543, -0.01789899, -1.97456, 1, 1, 1, 1, 1,
-2.07171, 0.2614369, -2.25207, 1, 1, 1, 1, 1,
-2.063984, 0.4246982, -0.5641619, 1, 1, 1, 1, 1,
-2.055464, 0.6538324, -2.170519, 1, 1, 1, 1, 1,
-2.051418, 1.625311, -3.59537, 1, 1, 1, 1, 1,
-1.999901, 0.05019203, -2.158035, 1, 1, 1, 1, 1,
-1.994612, -0.7233075, -0.1225199, 1, 1, 1, 1, 1,
-1.976439, 1.026574, -1.231516, 1, 1, 1, 1, 1,
-1.949843, -1.030219, -2.720784, 1, 1, 1, 1, 1,
-1.946904, -1.346493, -1.991961, 1, 1, 1, 1, 1,
-1.942938, -1.452744, -5.052124, 1, 1, 1, 1, 1,
-1.926237, 1.016674, 0.1827151, 1, 1, 1, 1, 1,
-1.909158, -1.31778, -2.106401, 1, 1, 1, 1, 1,
-1.904403, -0.06891614, -2.100358, 0, 0, 1, 1, 1,
-1.903124, -0.7340099, -1.947704, 1, 0, 0, 1, 1,
-1.898905, -0.3207392, -2.613503, 1, 0, 0, 1, 1,
-1.894763, -2.744237, -2.186689, 1, 0, 0, 1, 1,
-1.894111, -0.8963286, -2.702758, 1, 0, 0, 1, 1,
-1.893883, -1.607709, -1.833831, 1, 0, 0, 1, 1,
-1.893648, 0.08120266, -1.184417, 0, 0, 0, 1, 1,
-1.890752, 0.7343587, -0.3989726, 0, 0, 0, 1, 1,
-1.863626, 0.1595781, -1.559055, 0, 0, 0, 1, 1,
-1.825742, 1.992, -1.488415, 0, 0, 0, 1, 1,
-1.817203, -0.3231151, -1.186641, 0, 0, 0, 1, 1,
-1.80951, -0.9674482, -3.094796, 0, 0, 0, 1, 1,
-1.798671, -0.4323666, -1.626054, 0, 0, 0, 1, 1,
-1.794932, -0.491544, -0.850318, 1, 1, 1, 1, 1,
-1.752497, -0.8253803, -1.961171, 1, 1, 1, 1, 1,
-1.747954, 0.03131459, -1.723639, 1, 1, 1, 1, 1,
-1.74698, -1.12893, -2.905104, 1, 1, 1, 1, 1,
-1.743806, 1.669619, -0.1471732, 1, 1, 1, 1, 1,
-1.70225, 1.372937, -1.522593, 1, 1, 1, 1, 1,
-1.700231, -1.277608, -1.141515, 1, 1, 1, 1, 1,
-1.661345, -0.563775, -2.47045, 1, 1, 1, 1, 1,
-1.644878, 0.2687904, -1.70589, 1, 1, 1, 1, 1,
-1.640015, -0.4655521, -2.590714, 1, 1, 1, 1, 1,
-1.636316, -0.8316091, -3.604228, 1, 1, 1, 1, 1,
-1.612679, 0.3058442, -3.03, 1, 1, 1, 1, 1,
-1.609519, -0.5408093, -3.00684, 1, 1, 1, 1, 1,
-1.609406, 0.2810677, -1.884911, 1, 1, 1, 1, 1,
-1.599333, -0.7940461, -2.267844, 1, 1, 1, 1, 1,
-1.590782, 1.481899, -1.347177, 0, 0, 1, 1, 1,
-1.572914, -0.08857056, -0.5752764, 1, 0, 0, 1, 1,
-1.570393, -0.2101894, -2.521511, 1, 0, 0, 1, 1,
-1.56275, 1.078786, -0.7077718, 1, 0, 0, 1, 1,
-1.561649, -1.193757, -1.21942, 1, 0, 0, 1, 1,
-1.559773, -0.4676776, -0.6279969, 1, 0, 0, 1, 1,
-1.558782, 1.51663, -0.5674548, 0, 0, 0, 1, 1,
-1.534475, -0.364487, 0.6361943, 0, 0, 0, 1, 1,
-1.52642, 2.205324, 0.4794534, 0, 0, 0, 1, 1,
-1.510505, -0.8423399, -0.88965, 0, 0, 0, 1, 1,
-1.489186, 2.601991, -1.357263, 0, 0, 0, 1, 1,
-1.482695, -0.6470273, -0.7866294, 0, 0, 0, 1, 1,
-1.474657, 0.4400908, -1.817282, 0, 0, 0, 1, 1,
-1.471812, -0.02627255, -2.898549, 1, 1, 1, 1, 1,
-1.467726, 0.9830959, -0.3643581, 1, 1, 1, 1, 1,
-1.465923, -0.1165777, -0.2730844, 1, 1, 1, 1, 1,
-1.446147, -0.5693713, -0.06068399, 1, 1, 1, 1, 1,
-1.439178, 0.2368411, -1.19328, 1, 1, 1, 1, 1,
-1.435812, 0.2385096, -2.965667, 1, 1, 1, 1, 1,
-1.425308, -0.1621403, -1.456453, 1, 1, 1, 1, 1,
-1.418793, 0.9559436, -1.606501, 1, 1, 1, 1, 1,
-1.407841, -2.308132, -3.855698, 1, 1, 1, 1, 1,
-1.398465, -0.5723257, -3.484708, 1, 1, 1, 1, 1,
-1.392218, 0.7318872, 0.2331837, 1, 1, 1, 1, 1,
-1.384928, 1.242565, -1.100599, 1, 1, 1, 1, 1,
-1.382152, 0.319277, -1.180475, 1, 1, 1, 1, 1,
-1.371786, 0.8942258, -2.265507, 1, 1, 1, 1, 1,
-1.36922, -1.037721, -0.4488415, 1, 1, 1, 1, 1,
-1.354809, 0.9651455, -0.4850506, 0, 0, 1, 1, 1,
-1.343617, 2.195575, -0.9632093, 1, 0, 0, 1, 1,
-1.342956, 1.458034, -0.3414758, 1, 0, 0, 1, 1,
-1.342469, -0.7522354, -1.141962, 1, 0, 0, 1, 1,
-1.335897, 0.1001506, -2.480241, 1, 0, 0, 1, 1,
-1.32585, -1.044099, -0.1491531, 1, 0, 0, 1, 1,
-1.324707, -2.985339, -2.434432, 0, 0, 0, 1, 1,
-1.322243, -1.108185, -4.308479, 0, 0, 0, 1, 1,
-1.321306, 1.378076, -1.246217, 0, 0, 0, 1, 1,
-1.309302, -0.8511099, -1.283138, 0, 0, 0, 1, 1,
-1.308138, 0.3811423, -0.3846875, 0, 0, 0, 1, 1,
-1.289361, 0.2165237, -0.5660693, 0, 0, 0, 1, 1,
-1.263503, 0.6922413, -2.230145, 0, 0, 0, 1, 1,
-1.256769, -0.5639528, -0.3791277, 1, 1, 1, 1, 1,
-1.2284, 0.6468453, -0.9341694, 1, 1, 1, 1, 1,
-1.224394, -0.2254082, -0.8025649, 1, 1, 1, 1, 1,
-1.220888, 0.6889694, -2.560967, 1, 1, 1, 1, 1,
-1.212272, -1.864774, -4.325084, 1, 1, 1, 1, 1,
-1.20256, -1.048934, -3.568157, 1, 1, 1, 1, 1,
-1.193391, -0.2256344, -2.212166, 1, 1, 1, 1, 1,
-1.19251, -0.2214529, 0.9751102, 1, 1, 1, 1, 1,
-1.187724, -0.07854018, -0.672589, 1, 1, 1, 1, 1,
-1.18483, 0.2110544, -1.399662, 1, 1, 1, 1, 1,
-1.180189, -2.354514, -3.966213, 1, 1, 1, 1, 1,
-1.176467, -0.4557636, -5.569544, 1, 1, 1, 1, 1,
-1.163223, -0.7285933, -2.556103, 1, 1, 1, 1, 1,
-1.161475, 0.1932485, -2.282464, 1, 1, 1, 1, 1,
-1.153313, 0.8231513, -1.057519, 1, 1, 1, 1, 1,
-1.152788, -0.7202485, -4.514641, 0, 0, 1, 1, 1,
-1.150181, 0.9469324, -0.8914201, 1, 0, 0, 1, 1,
-1.149494, -0.5267906, -0.9752973, 1, 0, 0, 1, 1,
-1.149372, 0.2932247, -1.080009, 1, 0, 0, 1, 1,
-1.145944, -0.663389, -2.269786, 1, 0, 0, 1, 1,
-1.145499, -0.4074974, -1.455513, 1, 0, 0, 1, 1,
-1.142957, -2.306976, -1.96471, 0, 0, 0, 1, 1,
-1.142954, -1.367805, -1.634476, 0, 0, 0, 1, 1,
-1.140326, 0.07542883, 1.48403, 0, 0, 0, 1, 1,
-1.136612, 0.5066804, -1.11222, 0, 0, 0, 1, 1,
-1.131194, 2.151742, -0.4243301, 0, 0, 0, 1, 1,
-1.113839, 0.2723423, -0.838919, 0, 0, 0, 1, 1,
-1.10955, 0.5121086, 1.424892, 0, 0, 0, 1, 1,
-1.106696, 1.435783, 0.158176, 1, 1, 1, 1, 1,
-1.101529, 0.1847267, -2.242798, 1, 1, 1, 1, 1,
-1.100349, 0.6501536, -0.7558832, 1, 1, 1, 1, 1,
-1.100218, -1.547016, -3.876748, 1, 1, 1, 1, 1,
-1.097594, -0.4054994, -2.818342, 1, 1, 1, 1, 1,
-1.09417, -0.4581253, -2.884346, 1, 1, 1, 1, 1,
-1.081005, 0.03336493, -2.066194, 1, 1, 1, 1, 1,
-1.076408, 0.1297827, -0.1512765, 1, 1, 1, 1, 1,
-1.075934, -0.5151327, -1.034984, 1, 1, 1, 1, 1,
-1.075913, 1.37787, 0.7931905, 1, 1, 1, 1, 1,
-1.075854, -0.8372632, -1.251689, 1, 1, 1, 1, 1,
-1.075337, 0.4606676, -0.5804525, 1, 1, 1, 1, 1,
-1.074349, 0.1105834, -1.083136, 1, 1, 1, 1, 1,
-1.069426, -0.8345398, 0.1707229, 1, 1, 1, 1, 1,
-1.06908, -0.4406588, -0.7111127, 1, 1, 1, 1, 1,
-1.065712, 1.440348, -1.678667, 0, 0, 1, 1, 1,
-1.054918, 0.05264612, -2.852976, 1, 0, 0, 1, 1,
-1.0454, -0.1431947, -4.530619, 1, 0, 0, 1, 1,
-1.043298, 0.1818358, -0.6913759, 1, 0, 0, 1, 1,
-1.043241, -0.2874587, -2.132445, 1, 0, 0, 1, 1,
-1.040684, -0.005438193, -0.4786211, 1, 0, 0, 1, 1,
-1.036523, 1.645639, -0.2904374, 0, 0, 0, 1, 1,
-1.032688, -0.201133, -2.597417, 0, 0, 0, 1, 1,
-1.030531, 0.3049231, -1.081892, 0, 0, 0, 1, 1,
-1.030167, -0.235642, -1.927911, 0, 0, 0, 1, 1,
-1.024656, -0.2677912, -3.087671, 0, 0, 0, 1, 1,
-1.024032, -0.8517787, -1.748887, 0, 0, 0, 1, 1,
-0.9897608, 0.9627945, -0.7812217, 0, 0, 0, 1, 1,
-0.9850053, 0.1321593, -0.8636662, 1, 1, 1, 1, 1,
-0.978876, -0.2178625, -2.48452, 1, 1, 1, 1, 1,
-0.9748631, 0.5587003, -1.003506, 1, 1, 1, 1, 1,
-0.9711815, 1.260461, -0.2127475, 1, 1, 1, 1, 1,
-0.9664367, 2.285578, -1.261683, 1, 1, 1, 1, 1,
-0.9642056, 1.051466, -1.279917, 1, 1, 1, 1, 1,
-0.9558446, 0.4539605, -1.080876, 1, 1, 1, 1, 1,
-0.9549305, 1.599752, 0.1071608, 1, 1, 1, 1, 1,
-0.9510481, 0.3526446, -2.226046, 1, 1, 1, 1, 1,
-0.9498619, -1.328169, -4.247092, 1, 1, 1, 1, 1,
-0.9463732, -0.8791575, -0.1561499, 1, 1, 1, 1, 1,
-0.9388609, -1.741347, -2.118285, 1, 1, 1, 1, 1,
-0.9269033, 1.181291, -1.475524, 1, 1, 1, 1, 1,
-0.9205965, 1.780414, -0.6952037, 1, 1, 1, 1, 1,
-0.9156557, 0.6299026, -0.7578615, 1, 1, 1, 1, 1,
-0.9137698, -3.059413, -0.7957163, 0, 0, 1, 1, 1,
-0.9135729, -0.7824294, -1.37083, 1, 0, 0, 1, 1,
-0.9100667, 0.5050114, -0.6726767, 1, 0, 0, 1, 1,
-0.9092719, -0.9550792, -3.022393, 1, 0, 0, 1, 1,
-0.9091869, -0.04846025, -0.9638347, 1, 0, 0, 1, 1,
-0.902276, -0.300838, 0.1405558, 1, 0, 0, 1, 1,
-0.9019089, 0.8575697, -1.012343, 0, 0, 0, 1, 1,
-0.8957663, -1.832776, -2.024971, 0, 0, 0, 1, 1,
-0.8915948, 0.3742147, -1.714771, 0, 0, 0, 1, 1,
-0.8904278, -0.7626519, -2.143196, 0, 0, 0, 1, 1,
-0.8866047, -0.879373, -2.855782, 0, 0, 0, 1, 1,
-0.8861874, 0.9147066, -2.348467, 0, 0, 0, 1, 1,
-0.8834018, -0.8796223, -1.633723, 0, 0, 0, 1, 1,
-0.8799792, -1.5618, -2.764524, 1, 1, 1, 1, 1,
-0.8789219, -1.247872, -3.517879, 1, 1, 1, 1, 1,
-0.876354, -1.007368, -2.739778, 1, 1, 1, 1, 1,
-0.8752181, 1.219449, -0.7746046, 1, 1, 1, 1, 1,
-0.8715175, 1.033821, 0.4501379, 1, 1, 1, 1, 1,
-0.8667648, -0.5221876, -4.268314, 1, 1, 1, 1, 1,
-0.8609392, 2.039654, -1.235479, 1, 1, 1, 1, 1,
-0.8565865, 0.8830342, -0.1832592, 1, 1, 1, 1, 1,
-0.8562932, -0.9975227, -2.296786, 1, 1, 1, 1, 1,
-0.8543189, -0.4048178, -1.734988, 1, 1, 1, 1, 1,
-0.848774, -0.06984892, -2.267898, 1, 1, 1, 1, 1,
-0.8386513, 0.3718796, -1.603802, 1, 1, 1, 1, 1,
-0.8305081, 0.5041627, -0.4430169, 1, 1, 1, 1, 1,
-0.827675, -0.7942009, -2.021356, 1, 1, 1, 1, 1,
-0.8187411, 0.4076183, -1.257348, 1, 1, 1, 1, 1,
-0.8134078, 1.969157, -0.3741599, 0, 0, 1, 1, 1,
-0.8127035, 0.9404224, -0.7598907, 1, 0, 0, 1, 1,
-0.8050507, 0.2802809, -1.28086, 1, 0, 0, 1, 1,
-0.7973134, 0.7781575, -1.926711, 1, 0, 0, 1, 1,
-0.7957756, 0.4404594, -2.136737, 1, 0, 0, 1, 1,
-0.7871277, -0.2449943, -1.161996, 1, 0, 0, 1, 1,
-0.7838602, 1.312942, -2.286087, 0, 0, 0, 1, 1,
-0.7825719, 1.376881, 0.03125082, 0, 0, 0, 1, 1,
-0.7799681, 0.3597614, -1.858639, 0, 0, 0, 1, 1,
-0.7761093, 0.6824889, 0.1694931, 0, 0, 0, 1, 1,
-0.7757443, 0.4119879, -1.970452, 0, 0, 0, 1, 1,
-0.774783, 1.056229, -0.1604955, 0, 0, 0, 1, 1,
-0.7745435, -0.1642426, -1.931865, 0, 0, 0, 1, 1,
-0.7744353, 1.199444, -2.325632, 1, 1, 1, 1, 1,
-0.7590693, -0.3184419, -2.348542, 1, 1, 1, 1, 1,
-0.7508021, -1.049918, -2.681592, 1, 1, 1, 1, 1,
-0.7502554, -0.1092837, -0.7920541, 1, 1, 1, 1, 1,
-0.7479389, 1.204499, -1.991908, 1, 1, 1, 1, 1,
-0.7371739, 0.1827631, -1.230649, 1, 1, 1, 1, 1,
-0.7353273, 0.5102857, -0.8325475, 1, 1, 1, 1, 1,
-0.7337688, -0.2875271, -2.817187, 1, 1, 1, 1, 1,
-0.7273974, -1.060387, -3.227159, 1, 1, 1, 1, 1,
-0.7206624, 0.02137043, 0.437676, 1, 1, 1, 1, 1,
-0.7158723, 1.921441, -1.2181, 1, 1, 1, 1, 1,
-0.7155299, -1.217149, -2.635519, 1, 1, 1, 1, 1,
-0.7154676, 0.7076513, -1.199816, 1, 1, 1, 1, 1,
-0.709743, 1.678512, -1.730456, 1, 1, 1, 1, 1,
-0.7093616, 0.7202002, -1.257471, 1, 1, 1, 1, 1,
-0.7087174, 0.8049099, -2.58079, 0, 0, 1, 1, 1,
-0.7058955, -1.54721, -1.336808, 1, 0, 0, 1, 1,
-0.7030706, 0.6040632, -1.679098, 1, 0, 0, 1, 1,
-0.6963214, 0.6147807, -1.49218, 1, 0, 0, 1, 1,
-0.691823, 0.07082654, 0.1180012, 1, 0, 0, 1, 1,
-0.6868852, 0.02305028, -2.341902, 1, 0, 0, 1, 1,
-0.6864687, 1.457444, -1.420754, 0, 0, 0, 1, 1,
-0.6836927, 1.833097, -1.004685, 0, 0, 0, 1, 1,
-0.6835636, 2.687476, 0.4904209, 0, 0, 0, 1, 1,
-0.6817802, 1.157209, 0.1797907, 0, 0, 0, 1, 1,
-0.6765805, -0.579735, -1.638842, 0, 0, 0, 1, 1,
-0.6761702, -1.492108, -3.084073, 0, 0, 0, 1, 1,
-0.6747087, 0.9470564, -0.4915041, 0, 0, 0, 1, 1,
-0.6746205, 0.5528052, -2.54535, 1, 1, 1, 1, 1,
-0.6700916, 0.2589126, -2.282652, 1, 1, 1, 1, 1,
-0.6595035, -1.568858, -1.205715, 1, 1, 1, 1, 1,
-0.6555876, -1.543768, -3.496994, 1, 1, 1, 1, 1,
-0.6554705, 0.4548587, -0.1675985, 1, 1, 1, 1, 1,
-0.6529925, 0.7020615, -1.809309, 1, 1, 1, 1, 1,
-0.6513699, 0.4808462, -0.7879075, 1, 1, 1, 1, 1,
-0.6465371, -0.0695442, -1.028288, 1, 1, 1, 1, 1,
-0.644982, -2.828737, -2.803286, 1, 1, 1, 1, 1,
-0.6432996, -0.7912996, -2.242088, 1, 1, 1, 1, 1,
-0.634333, 0.3510857, -0.3328942, 1, 1, 1, 1, 1,
-0.633686, 1.452297, -1.718654, 1, 1, 1, 1, 1,
-0.6281186, -0.2592569, -1.190788, 1, 1, 1, 1, 1,
-0.6278811, 1.519937, -1.570409, 1, 1, 1, 1, 1,
-0.6258104, -0.6194094, -2.563576, 1, 1, 1, 1, 1,
-0.6242808, 1.314287, -1.508262, 0, 0, 1, 1, 1,
-0.6183355, -1.284105, -1.808907, 1, 0, 0, 1, 1,
-0.6159868, -1.056613, -1.976938, 1, 0, 0, 1, 1,
-0.6111715, 0.5249207, -0.8681817, 1, 0, 0, 1, 1,
-0.6053035, 0.1756034, -2.19417, 1, 0, 0, 1, 1,
-0.5974779, 0.03775813, -1.534882, 1, 0, 0, 1, 1,
-0.5972359, -1.065207, -3.375123, 0, 0, 0, 1, 1,
-0.5918082, 2.206402, 0.2081865, 0, 0, 0, 1, 1,
-0.5883443, -0.4361557, -1.001066, 0, 0, 0, 1, 1,
-0.5864912, -0.3127469, -2.880808, 0, 0, 0, 1, 1,
-0.584334, 1.489722, 0.550829, 0, 0, 0, 1, 1,
-0.5826635, 0.3496983, -1.143182, 0, 0, 0, 1, 1,
-0.5760945, -2.845205, -2.36646, 0, 0, 0, 1, 1,
-0.5633491, 0.6851287, 0.3710376, 1, 1, 1, 1, 1,
-0.5630548, -1.572163, -4.635579, 1, 1, 1, 1, 1,
-0.5603465, -0.6015282, -2.833076, 1, 1, 1, 1, 1,
-0.5600558, -2.062524, -2.496917, 1, 1, 1, 1, 1,
-0.5568562, -0.4872023, -1.133141, 1, 1, 1, 1, 1,
-0.5567998, -0.7756035, -1.550548, 1, 1, 1, 1, 1,
-0.5523417, 0.7822819, 0.702109, 1, 1, 1, 1, 1,
-0.5517394, -0.5980114, -2.85132, 1, 1, 1, 1, 1,
-0.5514387, 0.8927555, -0.5300133, 1, 1, 1, 1, 1,
-0.5513186, -1.599769, -3.067235, 1, 1, 1, 1, 1,
-0.5509282, -1.082162, -1.081617, 1, 1, 1, 1, 1,
-0.5492495, 0.5987654, -0.7192466, 1, 1, 1, 1, 1,
-0.5456297, -1.300471, -3.051906, 1, 1, 1, 1, 1,
-0.538302, 1.202764, 0.6768834, 1, 1, 1, 1, 1,
-0.5373626, -0.05898093, -2.13242, 1, 1, 1, 1, 1,
-0.5321856, 2.03158, -0.7983774, 0, 0, 1, 1, 1,
-0.5319363, -0.4006393, -2.399081, 1, 0, 0, 1, 1,
-0.5299619, -0.1463735, -2.4546, 1, 0, 0, 1, 1,
-0.5233551, 0.9767581, 1.11935, 1, 0, 0, 1, 1,
-0.5215214, -0.1853035, -1.534141, 1, 0, 0, 1, 1,
-0.5133325, -1.113333, -0.6394125, 1, 0, 0, 1, 1,
-0.5079474, 0.2592935, -0.3813874, 0, 0, 0, 1, 1,
-0.5065727, 0.1828935, -2.217326, 0, 0, 0, 1, 1,
-0.5060223, -0.4592735, -2.718755, 0, 0, 0, 1, 1,
-0.5054231, 0.6919317, -1.998581, 0, 0, 0, 1, 1,
-0.5029539, -0.3205954, -2.878873, 0, 0, 0, 1, 1,
-0.501286, 1.304372, -2.363255, 0, 0, 0, 1, 1,
-0.4932469, 0.007439491, -2.076357, 0, 0, 0, 1, 1,
-0.4876862, 1.004902, 0.1049525, 1, 1, 1, 1, 1,
-0.4863426, -0.3101901, -1.990429, 1, 1, 1, 1, 1,
-0.4843179, -1.301076, -3.339576, 1, 1, 1, 1, 1,
-0.4812129, 0.9170185, 0.6701129, 1, 1, 1, 1, 1,
-0.4809282, -0.438425, -1.536616, 1, 1, 1, 1, 1,
-0.4770384, -0.9946464, -2.945308, 1, 1, 1, 1, 1,
-0.4741018, -0.1602434, -3.315548, 1, 1, 1, 1, 1,
-0.4697126, -0.1191634, -0.6943108, 1, 1, 1, 1, 1,
-0.4691735, 0.6012738, -1.531136, 1, 1, 1, 1, 1,
-0.4682828, 0.3128012, -2.118779, 1, 1, 1, 1, 1,
-0.4628881, -1.611016, -2.267016, 1, 1, 1, 1, 1,
-0.4608309, 0.7872378, 1.262577, 1, 1, 1, 1, 1,
-0.4598041, 2.451222, -0.590184, 1, 1, 1, 1, 1,
-0.4581243, 1.722942, -0.078931, 1, 1, 1, 1, 1,
-0.4532864, -0.03863482, -3.245107, 1, 1, 1, 1, 1,
-0.4506729, 0.9592726, -1.166343, 0, 0, 1, 1, 1,
-0.4482037, -1.094622, -2.770758, 1, 0, 0, 1, 1,
-0.4463255, 0.425295, -1.994423, 1, 0, 0, 1, 1,
-0.4459476, -1.021706, -1.087672, 1, 0, 0, 1, 1,
-0.44391, -0.8334513, -2.925064, 1, 0, 0, 1, 1,
-0.4430692, -0.675879, -2.45345, 1, 0, 0, 1, 1,
-0.4389502, -0.07263585, -2.627292, 0, 0, 0, 1, 1,
-0.4355992, -0.7091423, -3.757938, 0, 0, 0, 1, 1,
-0.4322004, 0.6682032, -0.2886678, 0, 0, 0, 1, 1,
-0.4286278, 1.473709, -0.9874707, 0, 0, 0, 1, 1,
-0.4230196, -0.9528973, -4.125471, 0, 0, 0, 1, 1,
-0.4221149, 1.053177, -0.1629713, 0, 0, 0, 1, 1,
-0.4183733, 0.2891101, -1.453383, 0, 0, 0, 1, 1,
-0.4129795, -0.364643, -1.03149, 1, 1, 1, 1, 1,
-0.4127649, -1.038801, -2.719097, 1, 1, 1, 1, 1,
-0.4100156, 1.037451, -0.672944, 1, 1, 1, 1, 1,
-0.4086336, -0.9163202, -2.56554, 1, 1, 1, 1, 1,
-0.4061564, -0.8562054, -4.337346, 1, 1, 1, 1, 1,
-0.4057539, -0.3187667, -3.907741, 1, 1, 1, 1, 1,
-0.4032539, 2.554973, -1.708635, 1, 1, 1, 1, 1,
-0.400669, -1.45119, -1.803407, 1, 1, 1, 1, 1,
-0.3980039, 1.717065, -0.8061239, 1, 1, 1, 1, 1,
-0.3937252, -1.09756, -0.9789633, 1, 1, 1, 1, 1,
-0.3917253, -0.2385222, -1.327272, 1, 1, 1, 1, 1,
-0.3904106, 1.455978, -1.110976, 1, 1, 1, 1, 1,
-0.3849533, 1.104347, -0.2363117, 1, 1, 1, 1, 1,
-0.3843655, -1.632554, -2.043462, 1, 1, 1, 1, 1,
-0.3833681, -0.9371886, -3.363235, 1, 1, 1, 1, 1,
-0.3778578, -0.5335989, -1.481645, 0, 0, 1, 1, 1,
-0.3776191, -2.221962, -3.343727, 1, 0, 0, 1, 1,
-0.3748409, 0.1524788, -2.263068, 1, 0, 0, 1, 1,
-0.3739775, -0.2883047, -2.985148, 1, 0, 0, 1, 1,
-0.3715171, -0.4557051, -2.914725, 1, 0, 0, 1, 1,
-0.3704557, 0.3399287, -0.4027393, 1, 0, 0, 1, 1,
-0.3704106, -0.2605259, -0.7931846, 0, 0, 0, 1, 1,
-0.3692406, 0.8040516, -0.1147326, 0, 0, 0, 1, 1,
-0.3557849, 1.970505, 1.853374, 0, 0, 0, 1, 1,
-0.3480524, 0.2219312, -1.313252, 0, 0, 0, 1, 1,
-0.3468606, 0.05274907, -2.266294, 0, 0, 0, 1, 1,
-0.3446444, 0.9373738, -0.8929309, 0, 0, 0, 1, 1,
-0.3426801, -0.7534432, -2.66823, 0, 0, 0, 1, 1,
-0.3412335, 2.625651, 1.391274, 1, 1, 1, 1, 1,
-0.3358642, -1.187752, -2.661025, 1, 1, 1, 1, 1,
-0.3345156, -0.04772123, -3.208753, 1, 1, 1, 1, 1,
-0.3344197, 0.7051336, 0.5733687, 1, 1, 1, 1, 1,
-0.3343484, -0.426274, -2.795827, 1, 1, 1, 1, 1,
-0.3340432, -1.454363, -2.360132, 1, 1, 1, 1, 1,
-0.3328061, 0.7792471, 0.07485852, 1, 1, 1, 1, 1,
-0.3315915, -0.330755, -2.636599, 1, 1, 1, 1, 1,
-0.3293051, 1.331029, 0.54831, 1, 1, 1, 1, 1,
-0.3266739, 1.151252, -0.06952498, 1, 1, 1, 1, 1,
-0.3258702, -1.002089, -3.806374, 1, 1, 1, 1, 1,
-0.3240404, 0.2432496, -1.820715, 1, 1, 1, 1, 1,
-0.3223554, 0.5987447, 0.08587749, 1, 1, 1, 1, 1,
-0.3155978, 1.026738, 0.06376263, 1, 1, 1, 1, 1,
-0.3068267, -1.682833, -3.371536, 1, 1, 1, 1, 1,
-0.3038773, -0.2856807, -3.956875, 0, 0, 1, 1, 1,
-0.3038342, -0.8375854, -2.520052, 1, 0, 0, 1, 1,
-0.3031535, -0.9442717, -4.426744, 1, 0, 0, 1, 1,
-0.2943716, 0.2215948, -2.496694, 1, 0, 0, 1, 1,
-0.2929572, -0.7744563, -2.694769, 1, 0, 0, 1, 1,
-0.2894213, -2.558138, -3.948824, 1, 0, 0, 1, 1,
-0.2874005, -0.2514863, -1.930583, 0, 0, 0, 1, 1,
-0.2870181, -0.228742, -1.395772, 0, 0, 0, 1, 1,
-0.2855161, 0.2822662, -1.009984, 0, 0, 0, 1, 1,
-0.2846489, 1.096387, -0.1096974, 0, 0, 0, 1, 1,
-0.2844757, 2.128038, -2.204804, 0, 0, 0, 1, 1,
-0.2831866, 0.00497827, -2.269571, 0, 0, 0, 1, 1,
-0.2830524, -0.3177022, -4.455739, 0, 0, 0, 1, 1,
-0.2798293, -0.3420524, -3.485095, 1, 1, 1, 1, 1,
-0.2782953, 0.6900908, -0.7984698, 1, 1, 1, 1, 1,
-0.2753995, 0.3153242, -1.959043, 1, 1, 1, 1, 1,
-0.2748224, 0.299436, -2.756404, 1, 1, 1, 1, 1,
-0.2741264, 0.3428797, -0.8410815, 1, 1, 1, 1, 1,
-0.269872, -0.08963951, -1.814743, 1, 1, 1, 1, 1,
-0.2696174, 0.2461358, -0.7324467, 1, 1, 1, 1, 1,
-0.2597866, -0.2473947, -2.399016, 1, 1, 1, 1, 1,
-0.2567144, 1.481142, -0.4120272, 1, 1, 1, 1, 1,
-0.2563851, 0.2350187, -1.038567, 1, 1, 1, 1, 1,
-0.2529327, 0.2481782, -0.4658909, 1, 1, 1, 1, 1,
-0.2522203, -0.7372873, -1.862634, 1, 1, 1, 1, 1,
-0.2520747, -0.6199266, -3.160828, 1, 1, 1, 1, 1,
-0.2479406, 0.6366565, 0.2853187, 1, 1, 1, 1, 1,
-0.2472769, -1.046157, -4.331038, 1, 1, 1, 1, 1,
-0.2462611, -1.46374, -3.674719, 0, 0, 1, 1, 1,
-0.2446426, 0.8181568, 0.3086049, 1, 0, 0, 1, 1,
-0.2438076, 1.521, -0.6876984, 1, 0, 0, 1, 1,
-0.2425729, 2.124409, -0.6185957, 1, 0, 0, 1, 1,
-0.2385495, 0.7625434, -0.765399, 1, 0, 0, 1, 1,
-0.2384495, 0.4110543, -0.4227754, 1, 0, 0, 1, 1,
-0.2361128, 0.4659604, -1.469446, 0, 0, 0, 1, 1,
-0.2354131, 0.9446197, -0.2142458, 0, 0, 0, 1, 1,
-0.2351128, 0.04882167, -1.163152, 0, 0, 0, 1, 1,
-0.2349894, 0.7357522, -1.678476, 0, 0, 0, 1, 1,
-0.234653, 1.018841, -0.6110831, 0, 0, 0, 1, 1,
-0.2334836, -1.80488, -3.326914, 0, 0, 0, 1, 1,
-0.2273947, -1.456522, -3.023318, 0, 0, 0, 1, 1,
-0.2270501, 1.072172, 1.71994, 1, 1, 1, 1, 1,
-0.2200532, -1.164202, -3.095712, 1, 1, 1, 1, 1,
-0.2182972, 0.5589196, -1.22315, 1, 1, 1, 1, 1,
-0.2121702, 0.1412297, -1.985054, 1, 1, 1, 1, 1,
-0.2117008, -1.759447, -2.377845, 1, 1, 1, 1, 1,
-0.2069712, -0.3925082, -3.453785, 1, 1, 1, 1, 1,
-0.2061768, -0.7715729, -3.21325, 1, 1, 1, 1, 1,
-0.2060496, 0.7621843, -1.382196, 1, 1, 1, 1, 1,
-0.2040187, -0.4068093, -3.921559, 1, 1, 1, 1, 1,
-0.2020726, -1.328016, -1.722423, 1, 1, 1, 1, 1,
-0.1955645, -0.1658471, -2.202764, 1, 1, 1, 1, 1,
-0.1953529, 0.394393, -1.351494, 1, 1, 1, 1, 1,
-0.1948476, 0.09990412, -1.991808, 1, 1, 1, 1, 1,
-0.1931989, 0.977074, -1.604337, 1, 1, 1, 1, 1,
-0.1928888, -0.5764374, -0.8264464, 1, 1, 1, 1, 1,
-0.1927191, -1.187191, -3.866838, 0, 0, 1, 1, 1,
-0.1925824, 0.4389242, -0.5998027, 1, 0, 0, 1, 1,
-0.1846112, -0.3789378, -4.167039, 1, 0, 0, 1, 1,
-0.184213, 0.3100497, -2.373841, 1, 0, 0, 1, 1,
-0.1836744, 1.368116, -0.9436808, 1, 0, 0, 1, 1,
-0.1816362, -0.379996, -2.519006, 1, 0, 0, 1, 1,
-0.1809615, -0.38201, -3.231614, 0, 0, 0, 1, 1,
-0.1806236, -1.204704, -2.198661, 0, 0, 0, 1, 1,
-0.1790049, -0.06433811, -1.424863, 0, 0, 0, 1, 1,
-0.1747619, 0.2606969, -0.9468974, 0, 0, 0, 1, 1,
-0.1718618, 0.7338172, 1.040173, 0, 0, 0, 1, 1,
-0.1694279, -2.366822, -3.307401, 0, 0, 0, 1, 1,
-0.1652784, 1.321577, -1.761269, 0, 0, 0, 1, 1,
-0.1623246, 0.9255288, -0.8299835, 1, 1, 1, 1, 1,
-0.160951, 0.7660652, 0.9950497, 1, 1, 1, 1, 1,
-0.1606375, 0.2363181, -1.208817, 1, 1, 1, 1, 1,
-0.1515935, 0.3480687, 0.0353832, 1, 1, 1, 1, 1,
-0.1490722, 0.8746262, -1.46551, 1, 1, 1, 1, 1,
-0.1453679, -1.748959, -3.10085, 1, 1, 1, 1, 1,
-0.1450278, 0.4497333, -0.8280595, 1, 1, 1, 1, 1,
-0.1419739, -0.01570724, -2.355203, 1, 1, 1, 1, 1,
-0.1413834, -1.170883, -2.223949, 1, 1, 1, 1, 1,
-0.1314642, -1.072317, -3.025754, 1, 1, 1, 1, 1,
-0.1296785, 0.5419611, -0.2449873, 1, 1, 1, 1, 1,
-0.1279599, -0.518142, -3.902709, 1, 1, 1, 1, 1,
-0.1200109, -1.518905, -2.617424, 1, 1, 1, 1, 1,
-0.115179, 0.1260613, -1.730513, 1, 1, 1, 1, 1,
-0.1088375, 0.02492896, -0.8102964, 1, 1, 1, 1, 1,
-0.1086135, -0.3429049, -2.189909, 0, 0, 1, 1, 1,
-0.1078852, 1.197527, 0.2903512, 1, 0, 0, 1, 1,
-0.1035688, 0.6165282, -1.25874, 1, 0, 0, 1, 1,
-0.1030171, -0.3006397, -3.015123, 1, 0, 0, 1, 1,
-0.1025649, 0.04246324, -0.3448674, 1, 0, 0, 1, 1,
-0.1018516, 0.901883, 0.3660612, 1, 0, 0, 1, 1,
-0.1017118, -1.204542, -1.857442, 0, 0, 0, 1, 1,
-0.1010779, -0.0185317, -1.564336, 0, 0, 0, 1, 1,
-0.09620592, 0.6372164, -0.5924485, 0, 0, 0, 1, 1,
-0.09556125, -0.1421781, -3.118698, 0, 0, 0, 1, 1,
-0.09523194, 0.2398601, -1.616008, 0, 0, 0, 1, 1,
-0.09007028, -0.3430564, -1.855302, 0, 0, 0, 1, 1,
-0.08345462, 0.7855682, -0.8723533, 0, 0, 0, 1, 1,
-0.07915558, 1.005681, 0.3386069, 1, 1, 1, 1, 1,
-0.07914103, -2.201239, -2.934779, 1, 1, 1, 1, 1,
-0.07765827, -1.431315, -1.510707, 1, 1, 1, 1, 1,
-0.07613201, 0.8018157, 1.0639, 1, 1, 1, 1, 1,
-0.07390053, -0.9503305, -4.809102, 1, 1, 1, 1, 1,
-0.07300973, 0.173938, 0.9485286, 1, 1, 1, 1, 1,
-0.07263312, -0.2015584, -3.368223, 1, 1, 1, 1, 1,
-0.07166775, -0.2150074, -2.517106, 1, 1, 1, 1, 1,
-0.06688225, 2.358941, 0.5134233, 1, 1, 1, 1, 1,
-0.0666315, -1.957968, -4.10521, 1, 1, 1, 1, 1,
-0.06317335, 0.4149464, 1.588064, 1, 1, 1, 1, 1,
-0.05999034, 0.1992061, -1.586584, 1, 1, 1, 1, 1,
-0.05653296, -0.2790993, -3.672284, 1, 1, 1, 1, 1,
-0.05596781, 0.9172207, -0.3048816, 1, 1, 1, 1, 1,
-0.05244175, 1.84007, 0.6867647, 1, 1, 1, 1, 1,
-0.0523381, -0.3084652, -2.591996, 0, 0, 1, 1, 1,
-0.04775614, 2.194241, 1.649059, 1, 0, 0, 1, 1,
-0.04266655, -0.2913051, -2.429559, 1, 0, 0, 1, 1,
-0.0421052, -0.05322333, -1.00692, 1, 0, 0, 1, 1,
-0.04111075, 0.24062, 0.9951817, 1, 0, 0, 1, 1,
-0.03789926, -0.5035204, -1.53318, 1, 0, 0, 1, 1,
-0.03635906, 0.1118595, -0.375338, 0, 0, 0, 1, 1,
-0.0351386, 3.381225, -0.873472, 0, 0, 0, 1, 1,
-0.03342134, 0.7062455, -0.5510779, 0, 0, 0, 1, 1,
-0.02494648, -0.2725812, -3.620326, 0, 0, 0, 1, 1,
-0.02334982, 0.5999314, -1.124288, 0, 0, 0, 1, 1,
-0.02052752, -0.007611479, 0.09290294, 0, 0, 0, 1, 1,
-0.01771187, 0.06248853, -0.3175717, 0, 0, 0, 1, 1,
-0.0170439, 0.5040957, -0.5378697, 1, 1, 1, 1, 1,
-0.01445213, -0.05737313, -1.946258, 1, 1, 1, 1, 1,
-0.01152439, 1.891862, 0.1158328, 1, 1, 1, 1, 1,
-0.01073982, 0.1208188, 1.57549, 1, 1, 1, 1, 1,
-0.009657438, 0.8527755, -0.02950444, 1, 1, 1, 1, 1,
-0.008037898, 0.5169941, 0.8247865, 1, 1, 1, 1, 1,
-0.00780215, -0.1736637, -1.313609, 1, 1, 1, 1, 1,
-0.006390622, 0.3135042, -1.216438, 1, 1, 1, 1, 1,
-0.005804353, 0.4783918, -1.224813, 1, 1, 1, 1, 1,
-0.004390857, -1.524494, -3.560769, 1, 1, 1, 1, 1,
-0.002651622, -0.739996, -0.7994831, 1, 1, 1, 1, 1,
-0.00238401, 0.3936027, -0.9029483, 1, 1, 1, 1, 1,
-0.001850045, -1.00991, -5.51215, 1, 1, 1, 1, 1,
0.001016511, -0.156355, 0.9918864, 1, 1, 1, 1, 1,
0.001982447, 0.4668038, 1.68999, 1, 1, 1, 1, 1,
0.002231843, 0.850038, 0.7411464, 0, 0, 1, 1, 1,
0.007775056, -1.239341, 2.406281, 1, 0, 0, 1, 1,
0.0111093, 2.910169, -0.3643932, 1, 0, 0, 1, 1,
0.01264589, 0.569676, 0.2884763, 1, 0, 0, 1, 1,
0.01303416, 0.5567977, 0.782186, 1, 0, 0, 1, 1,
0.01414602, -0.9708786, 3.021983, 1, 0, 0, 1, 1,
0.01507824, -1.207035, 1.373589, 0, 0, 0, 1, 1,
0.02022131, -0.2997625, 3.004109, 0, 0, 0, 1, 1,
0.02307529, -1.265131, 3.50178, 0, 0, 0, 1, 1,
0.0231381, -0.02868616, 2.964306, 0, 0, 0, 1, 1,
0.02919277, -1.081835, 4.070763, 0, 0, 0, 1, 1,
0.02971515, 1.341853, 0.1315198, 0, 0, 0, 1, 1,
0.0334242, 1.171331, -0.4014029, 0, 0, 0, 1, 1,
0.03402907, 0.2767448, 1.063436, 1, 1, 1, 1, 1,
0.03668511, -1.320179, 4.525696, 1, 1, 1, 1, 1,
0.03734412, -0.2961461, 1.834446, 1, 1, 1, 1, 1,
0.03787763, 0.8967229, 0.3314351, 1, 1, 1, 1, 1,
0.04074663, -0.5561462, 4.854342, 1, 1, 1, 1, 1,
0.04133653, -0.6420931, 2.72518, 1, 1, 1, 1, 1,
0.0414453, -0.7103344, 3.679575, 1, 1, 1, 1, 1,
0.04162317, 1.414368, 0.07491873, 1, 1, 1, 1, 1,
0.04372393, -0.9425464, 2.694585, 1, 1, 1, 1, 1,
0.04543401, -0.9428464, 1.982035, 1, 1, 1, 1, 1,
0.0482315, -0.9224187, 4.53871, 1, 1, 1, 1, 1,
0.05350234, 1.959184, -0.1716629, 1, 1, 1, 1, 1,
0.05357311, -0.5651206, 2.131616, 1, 1, 1, 1, 1,
0.05505722, 0.5104634, -0.9699126, 1, 1, 1, 1, 1,
0.05615054, 1.458285, -1.172744, 1, 1, 1, 1, 1,
0.0612912, -0.7332024, 3.677726, 0, 0, 1, 1, 1,
0.06454754, 0.9206221, -0.8215606, 1, 0, 0, 1, 1,
0.06462751, -0.9637466, 2.52936, 1, 0, 0, 1, 1,
0.06531073, -0.3545606, 3.692285, 1, 0, 0, 1, 1,
0.06655522, -0.7001925, 2.143905, 1, 0, 0, 1, 1,
0.06964429, 0.007323404, 0.1716323, 1, 0, 0, 1, 1,
0.07122091, 0.8207257, 0.3824216, 0, 0, 0, 1, 1,
0.07547613, 0.7174115, -0.05617674, 0, 0, 0, 1, 1,
0.07675909, 0.5940635, -0.6672996, 0, 0, 0, 1, 1,
0.07682236, -0.3813461, 4.86419, 0, 0, 0, 1, 1,
0.07988286, 0.8755035, -0.9804473, 0, 0, 0, 1, 1,
0.08285714, -1.10242, 3.627223, 0, 0, 0, 1, 1,
0.08513755, -1.017372, 1.249553, 0, 0, 0, 1, 1,
0.09010849, -0.822289, 4.391482, 1, 1, 1, 1, 1,
0.09362455, 0.3675654, 0.7973622, 1, 1, 1, 1, 1,
0.09386568, 0.7555916, -0.7067007, 1, 1, 1, 1, 1,
0.09537229, 0.4750398, -1.061771, 1, 1, 1, 1, 1,
0.09600822, -1.697573, 2.530452, 1, 1, 1, 1, 1,
0.1004366, -1.093998, 4.498467, 1, 1, 1, 1, 1,
0.10178, -1.779045, 3.78931, 1, 1, 1, 1, 1,
0.1017995, 1.020053, -0.6930224, 1, 1, 1, 1, 1,
0.1027925, 0.7910709, 0.7948144, 1, 1, 1, 1, 1,
0.1049414, 0.1772559, 0.1003297, 1, 1, 1, 1, 1,
0.1135635, -1.343343, 2.908559, 1, 1, 1, 1, 1,
0.1165056, 1.903123, 0.3689889, 1, 1, 1, 1, 1,
0.117642, 2.555363, -0.4400057, 1, 1, 1, 1, 1,
0.1190456, -2.061996, 4.614429, 1, 1, 1, 1, 1,
0.1236168, 1.334424, 0.1456317, 1, 1, 1, 1, 1,
0.1240367, 0.3571254, -1.532615, 0, 0, 1, 1, 1,
0.1244382, 0.8094363, -1.460839, 1, 0, 0, 1, 1,
0.1326338, -2.032676, 1.87268, 1, 0, 0, 1, 1,
0.1336052, 1.854513, -0.1768895, 1, 0, 0, 1, 1,
0.1439811, 0.1607379, 0.830019, 1, 0, 0, 1, 1,
0.1506501, 1.271905, 0.3680837, 1, 0, 0, 1, 1,
0.1605529, 0.6679916, 0.6419574, 0, 0, 0, 1, 1,
0.1609164, 0.5745161, 1.464306, 0, 0, 0, 1, 1,
0.1659603, 1.253526, 0.4362206, 0, 0, 0, 1, 1,
0.1669448, 0.7358952, -1.122638, 0, 0, 0, 1, 1,
0.1679937, -0.8780584, 0.2899418, 0, 0, 0, 1, 1,
0.1688691, 0.5851735, -0.3051001, 0, 0, 0, 1, 1,
0.1714768, 0.250049, 2.423759, 0, 0, 0, 1, 1,
0.1781311, 1.593172, 1.869394, 1, 1, 1, 1, 1,
0.179969, 0.8747425, -0.0146471, 1, 1, 1, 1, 1,
0.1808066, 0.1772561, -0.2458123, 1, 1, 1, 1, 1,
0.188264, 0.1169962, 1.142095, 1, 1, 1, 1, 1,
0.1883832, -1.51892, 2.69368, 1, 1, 1, 1, 1,
0.2059769, -2.310476, 3.592232, 1, 1, 1, 1, 1,
0.2095331, 0.03533319, 1.325723, 1, 1, 1, 1, 1,
0.2127306, 0.2158684, 1.648317, 1, 1, 1, 1, 1,
0.2145784, 2.232092, 0.1803457, 1, 1, 1, 1, 1,
0.2152782, -0.9076716, 1.908212, 1, 1, 1, 1, 1,
0.2153822, 1.775673, -1.262495, 1, 1, 1, 1, 1,
0.2160811, 2.232097, 0.0510086, 1, 1, 1, 1, 1,
0.2165583, 1.512457, 0.7923838, 1, 1, 1, 1, 1,
0.2191748, -0.8747472, 3.852043, 1, 1, 1, 1, 1,
0.2219325, -0.7107157, 3.757293, 1, 1, 1, 1, 1,
0.2221408, 0.1250285, 2.662183, 0, 0, 1, 1, 1,
0.2240795, -2.260999, 3.600775, 1, 0, 0, 1, 1,
0.2258064, -0.5195851, 3.167401, 1, 0, 0, 1, 1,
0.2272797, -1.521854, 3.595307, 1, 0, 0, 1, 1,
0.2277771, -0.5954149, 4.265347, 1, 0, 0, 1, 1,
0.2314533, 1.976435, -0.3461296, 1, 0, 0, 1, 1,
0.2330138, 1.648459, -0.2991723, 0, 0, 0, 1, 1,
0.2368265, 1.166435, -0.3356531, 0, 0, 0, 1, 1,
0.2381895, -2.126883, 1.333374, 0, 0, 0, 1, 1,
0.2385664, 1.546772, -1.120284, 0, 0, 0, 1, 1,
0.2395235, 0.293851, 0.1318723, 0, 0, 0, 1, 1,
0.2408003, -2.313974, 2.144841, 0, 0, 0, 1, 1,
0.2446371, 0.06928784, 1.287321, 0, 0, 0, 1, 1,
0.246001, 0.3516612, 1.225949, 1, 1, 1, 1, 1,
0.2525134, 0.5649891, 0.9571249, 1, 1, 1, 1, 1,
0.2590336, -1.122723, 1.417119, 1, 1, 1, 1, 1,
0.2598979, -0.7432554, 3.24768, 1, 1, 1, 1, 1,
0.2622229, 1.068915, 0.3325647, 1, 1, 1, 1, 1,
0.2637497, 0.5987654, 1.798709, 1, 1, 1, 1, 1,
0.2638865, -1.712244, 3.029112, 1, 1, 1, 1, 1,
0.2645983, 0.1140831, 1.385125, 1, 1, 1, 1, 1,
0.2650615, 0.4217798, -0.49768, 1, 1, 1, 1, 1,
0.270183, -0.806632, 2.489483, 1, 1, 1, 1, 1,
0.2726625, -1.668327, 1.385448, 1, 1, 1, 1, 1,
0.2749712, -0.4367109, 2.544943, 1, 1, 1, 1, 1,
0.2758209, -0.313127, 1.040622, 1, 1, 1, 1, 1,
0.2765293, -0.539067, 3.483874, 1, 1, 1, 1, 1,
0.2766984, 0.3173727, 0.796349, 1, 1, 1, 1, 1,
0.2805933, 0.5288568, -0.7016515, 0, 0, 1, 1, 1,
0.2830837, 0.7349024, -0.9647575, 1, 0, 0, 1, 1,
0.284297, -1.111095, 1.999686, 1, 0, 0, 1, 1,
0.2896934, 1.171989, -0.09891593, 1, 0, 0, 1, 1,
0.2945271, -0.0559748, 3.052849, 1, 0, 0, 1, 1,
0.300864, 1.151061, -0.04732833, 1, 0, 0, 1, 1,
0.3043272, 1.800947, 0.6743892, 0, 0, 0, 1, 1,
0.3104969, -0.9873297, 2.94508, 0, 0, 0, 1, 1,
0.312526, 0.3327179, 0.4314059, 0, 0, 0, 1, 1,
0.3135197, 0.5289767, 0.9898978, 0, 0, 0, 1, 1,
0.3163102, 0.6589921, 0.7575405, 0, 0, 0, 1, 1,
0.3166061, 0.0479372, 2.013211, 0, 0, 0, 1, 1,
0.3173071, 1.105351, -1.705282, 0, 0, 0, 1, 1,
0.3239022, 0.9605626, 0.652748, 1, 1, 1, 1, 1,
0.3239363, -0.04917986, 2.143179, 1, 1, 1, 1, 1,
0.3250738, -0.6229358, 1.570701, 1, 1, 1, 1, 1,
0.3327124, 1.314825, 0.2879627, 1, 1, 1, 1, 1,
0.3368693, -0.5882353, 3.168986, 1, 1, 1, 1, 1,
0.3388497, -0.7757446, 2.727155, 1, 1, 1, 1, 1,
0.3405254, 0.5791429, 1.190147, 1, 1, 1, 1, 1,
0.3428011, -0.3659443, 2.080178, 1, 1, 1, 1, 1,
0.3463922, -0.4486758, 3.549892, 1, 1, 1, 1, 1,
0.3468407, 0.2973062, 1.139909, 1, 1, 1, 1, 1,
0.3521003, 0.9149861, 1.111652, 1, 1, 1, 1, 1,
0.3523872, -0.2814983, 2.857665, 1, 1, 1, 1, 1,
0.3527693, -0.1724782, 3.417916, 1, 1, 1, 1, 1,
0.3576389, 1.497475, -0.2022551, 1, 1, 1, 1, 1,
0.3617328, 1.513875, 0.9709508, 1, 1, 1, 1, 1,
0.3696117, -0.4772574, 3.137912, 0, 0, 1, 1, 1,
0.3696473, 0.7350819, 1.670984, 1, 0, 0, 1, 1,
0.3701913, 0.9137844, 1.036032, 1, 0, 0, 1, 1,
0.3718129, -0.6777036, 1.749598, 1, 0, 0, 1, 1,
0.3730301, -0.8413791, 3.152867, 1, 0, 0, 1, 1,
0.3730939, -0.3303504, 1.546532, 1, 0, 0, 1, 1,
0.3769883, 0.808596, -0.2044408, 0, 0, 0, 1, 1,
0.3796598, 0.2167754, 1.930485, 0, 0, 0, 1, 1,
0.3805627, -0.4454766, 2.237386, 0, 0, 0, 1, 1,
0.3806901, 0.05227341, 0.982353, 0, 0, 0, 1, 1,
0.3842481, 0.8618658, -0.2731984, 0, 0, 0, 1, 1,
0.3858733, -0.2707354, 4.574508, 0, 0, 0, 1, 1,
0.3908215, -0.3188996, 0.8917258, 0, 0, 0, 1, 1,
0.3924531, 0.3649539, 0.5528204, 1, 1, 1, 1, 1,
0.396744, 1.048617, 0.998372, 1, 1, 1, 1, 1,
0.3996119, 0.5473391, -0.8639956, 1, 1, 1, 1, 1,
0.4046061, -1.02642, 2.921781, 1, 1, 1, 1, 1,
0.4051267, 0.8734139, 0.1409027, 1, 1, 1, 1, 1,
0.4066271, -1.376345, 4.136596, 1, 1, 1, 1, 1,
0.4122797, -1.548425, 3.179382, 1, 1, 1, 1, 1,
0.4142081, -0.8921336, 2.145301, 1, 1, 1, 1, 1,
0.4154378, -0.8915632, 2.723022, 1, 1, 1, 1, 1,
0.4182271, 0.3061528, -1.045418, 1, 1, 1, 1, 1,
0.4225051, 0.2595035, 1.188368, 1, 1, 1, 1, 1,
0.4236058, -1.51276, 4.578902, 1, 1, 1, 1, 1,
0.4243743, -0.2328394, 1.004262, 1, 1, 1, 1, 1,
0.4287294, 0.8453803, -0.5145382, 1, 1, 1, 1, 1,
0.4304102, -0.7057333, 2.951234, 1, 1, 1, 1, 1,
0.4315725, 0.4969507, 1.798753, 0, 0, 1, 1, 1,
0.4317699, -0.4421574, 4.122139, 1, 0, 0, 1, 1,
0.4324673, -0.140027, 2.759394, 1, 0, 0, 1, 1,
0.4392832, 1.500372, 2.412336, 1, 0, 0, 1, 1,
0.4405285, -1.883205, 3.495471, 1, 0, 0, 1, 1,
0.4411747, 0.2890384, 1.153562, 1, 0, 0, 1, 1,
0.4518833, 0.7516832, 0.5123266, 0, 0, 0, 1, 1,
0.45352, 0.5425676, 1.054272, 0, 0, 0, 1, 1,
0.4544258, -1.900047, 3.400124, 0, 0, 0, 1, 1,
0.4564756, -1.474103, 3.348927, 0, 0, 0, 1, 1,
0.4593363, 0.9472196, 0.9158966, 0, 0, 0, 1, 1,
0.4603456, 0.8699244, 0.8246576, 0, 0, 0, 1, 1,
0.4606622, -2.229087, 0.6273128, 0, 0, 0, 1, 1,
0.4618586, 0.2160143, 0.08817735, 1, 1, 1, 1, 1,
0.4621129, -0.4424716, 1.645644, 1, 1, 1, 1, 1,
0.4629599, 2.098652, 0.6964274, 1, 1, 1, 1, 1,
0.4648755, 1.057445, -1.224552, 1, 1, 1, 1, 1,
0.4681071, 0.4091425, 3.042044, 1, 1, 1, 1, 1,
0.4725406, -0.195621, 2.493673, 1, 1, 1, 1, 1,
0.4725769, 0.3503244, 2.222279, 1, 1, 1, 1, 1,
0.4784911, -1.394276, 2.267508, 1, 1, 1, 1, 1,
0.4786864, 0.7443131, -0.3043767, 1, 1, 1, 1, 1,
0.481363, 1.928838, 0.6316655, 1, 1, 1, 1, 1,
0.4845962, -1.147428, 3.83542, 1, 1, 1, 1, 1,
0.4902411, -0.2006225, 1.696337, 1, 1, 1, 1, 1,
0.4920966, -0.9374513, 2.17329, 1, 1, 1, 1, 1,
0.4977678, -2.901584, 4.36826, 1, 1, 1, 1, 1,
0.4996212, 0.8622265, 0.2557708, 1, 1, 1, 1, 1,
0.5017765, -1.660838, 2.566328, 0, 0, 1, 1, 1,
0.5055973, -1.400051, 3.393493, 1, 0, 0, 1, 1,
0.5073582, 0.8503064, -0.5082883, 1, 0, 0, 1, 1,
0.5099199, 1.918918, -0.4592442, 1, 0, 0, 1, 1,
0.5132748, 2.013069, -0.009245213, 1, 0, 0, 1, 1,
0.5137952, -0.924623, 2.100685, 1, 0, 0, 1, 1,
0.5149397, -0.1821341, 1.586307, 0, 0, 0, 1, 1,
0.5279166, 0.02607036, 1.610444, 0, 0, 0, 1, 1,
0.5335997, 1.644026, 0.01211611, 0, 0, 0, 1, 1,
0.5360696, 0.2349464, 1.225529, 0, 0, 0, 1, 1,
0.5370992, -1.856293, 1.531495, 0, 0, 0, 1, 1,
0.5377096, -0.305504, 0.992368, 0, 0, 0, 1, 1,
0.5407918, 0.3417881, 1.827211, 0, 0, 0, 1, 1,
0.5442139, 2.110331, 1.192077, 1, 1, 1, 1, 1,
0.5457348, -0.4824472, 2.787184, 1, 1, 1, 1, 1,
0.5462289, 0.2411548, 1.187738, 1, 1, 1, 1, 1,
0.5465511, 0.6551641, 0.1753103, 1, 1, 1, 1, 1,
0.5491315, 0.444465, 0.6390328, 1, 1, 1, 1, 1,
0.5501534, -1.045438, 2.677709, 1, 1, 1, 1, 1,
0.5515145, 0.6071436, 2.329385, 1, 1, 1, 1, 1,
0.559201, -0.04172745, 0.8388955, 1, 1, 1, 1, 1,
0.5680944, -0.5941447, 2.278582, 1, 1, 1, 1, 1,
0.5697185, -0.1454688, 2.798259, 1, 1, 1, 1, 1,
0.5707722, -0.03129474, 1.294357, 1, 1, 1, 1, 1,
0.5735776, 1.617174, 0.7238674, 1, 1, 1, 1, 1,
0.574358, 1.675196, 1.433963, 1, 1, 1, 1, 1,
0.5827802, 0.3282537, 0.7327528, 1, 1, 1, 1, 1,
0.5840467, -0.3626046, 0.6742105, 1, 1, 1, 1, 1,
0.5855846, -0.6091637, 2.841365, 0, 0, 1, 1, 1,
0.5859446, 1.68557, 0.8066822, 1, 0, 0, 1, 1,
0.6004227, -0.4761533, 0.595944, 1, 0, 0, 1, 1,
0.6004562, 0.670245, 2.204532, 1, 0, 0, 1, 1,
0.6014723, -0.3659491, 1.833214, 1, 0, 0, 1, 1,
0.6040416, -0.5532142, 0.5645732, 1, 0, 0, 1, 1,
0.6065083, 0.7845161, 1.139511, 0, 0, 0, 1, 1,
0.6103827, 0.7351723, 0.9666166, 0, 0, 0, 1, 1,
0.6106396, 0.01395815, 3.303828, 0, 0, 0, 1, 1,
0.6121209, 1.20259, 2.297947, 0, 0, 0, 1, 1,
0.6136652, 0.01176688, 1.812284, 0, 0, 0, 1, 1,
0.6138631, -1.475428, 4.363423, 0, 0, 0, 1, 1,
0.6141775, -1.410058, 2.102793, 0, 0, 0, 1, 1,
0.6144485, -0.1498215, 1.284169, 1, 1, 1, 1, 1,
0.6149226, -0.6866674, 3.169507, 1, 1, 1, 1, 1,
0.6195272, -1.164434, 2.27811, 1, 1, 1, 1, 1,
0.6268662, 1.845145, -0.5283463, 1, 1, 1, 1, 1,
0.6278736, -0.6553593, 3.127382, 1, 1, 1, 1, 1,
0.631374, 0.9009108, 1.61005, 1, 1, 1, 1, 1,
0.6325555, -1.028975, 3.066291, 1, 1, 1, 1, 1,
0.6343691, -1.29405, 3.717499, 1, 1, 1, 1, 1,
0.6360268, 0.2025266, -0.04968753, 1, 1, 1, 1, 1,
0.6361803, 0.6396143, 0.3527173, 1, 1, 1, 1, 1,
0.6380625, -0.9808339, 1.241276, 1, 1, 1, 1, 1,
0.6410504, 1.808398, 0.4917285, 1, 1, 1, 1, 1,
0.642383, 0.7648743, -0.9844053, 1, 1, 1, 1, 1,
0.6521684, -0.6183326, -0.9974415, 1, 1, 1, 1, 1,
0.654273, -1.152999, 1.589909, 1, 1, 1, 1, 1,
0.6544144, 1.191878, 1.085049, 0, 0, 1, 1, 1,
0.6612543, -0.564822, 2.63777, 1, 0, 0, 1, 1,
0.6615333, -0.7527238, -1.026986, 1, 0, 0, 1, 1,
0.6691512, 0.449418, 1.988687, 1, 0, 0, 1, 1,
0.6697663, 0.4816329, 0.8043336, 1, 0, 0, 1, 1,
0.6868092, -0.9723126, 4.721664, 1, 0, 0, 1, 1,
0.6883297, 0.9896492, 0.5106626, 0, 0, 0, 1, 1,
0.6951177, 0.2289195, -0.2940382, 0, 0, 0, 1, 1,
0.7066079, 0.006094262, 2.547809, 0, 0, 0, 1, 1,
0.708652, -0.296623, 3.905082, 0, 0, 0, 1, 1,
0.7089942, -1.480849, 3.945584, 0, 0, 0, 1, 1,
0.7143298, 1.287634, 1.433469, 0, 0, 0, 1, 1,
0.7231132, 0.7646814, -0.4533736, 0, 0, 0, 1, 1,
0.7324592, 2.817643, 1.006123, 1, 1, 1, 1, 1,
0.7325348, 0.52674, 1.873231, 1, 1, 1, 1, 1,
0.7325352, 0.2813666, 1.830846, 1, 1, 1, 1, 1,
0.7330889, -2.249114, 4.346544, 1, 1, 1, 1, 1,
0.7426319, 0.7074005, 0.5860326, 1, 1, 1, 1, 1,
0.7533347, -0.2818751, 1.740981, 1, 1, 1, 1, 1,
0.7547816, -0.8767338, 2.803199, 1, 1, 1, 1, 1,
0.7571772, -1.12608, 1.832757, 1, 1, 1, 1, 1,
0.7596832, -0.06541757, 2.873423, 1, 1, 1, 1, 1,
0.7610619, 0.2620185, 1.948906, 1, 1, 1, 1, 1,
0.7682755, 0.5474988, 1.935459, 1, 1, 1, 1, 1,
0.7685958, -0.330221, 1.797995, 1, 1, 1, 1, 1,
0.7704288, 1.1575, 0.4587598, 1, 1, 1, 1, 1,
0.7721007, 1.841908, 0.196553, 1, 1, 1, 1, 1,
0.7782094, 0.6101955, 1.721297, 1, 1, 1, 1, 1,
0.7841327, 0.6966831, 0.275807, 0, 0, 1, 1, 1,
0.7848536, -0.1825724, 0.6276231, 1, 0, 0, 1, 1,
0.7870877, -1.790817, 1.55584, 1, 0, 0, 1, 1,
0.7893664, 0.8156415, 1.110339, 1, 0, 0, 1, 1,
0.8011075, 0.429044, 1.930422, 1, 0, 0, 1, 1,
0.8034987, -0.7643146, 2.137259, 1, 0, 0, 1, 1,
0.8115428, -1.734134, 1.798571, 0, 0, 0, 1, 1,
0.8125293, 1.598814, 1.992029, 0, 0, 0, 1, 1,
0.8228573, -0.1997845, -0.5916843, 0, 0, 0, 1, 1,
0.8242863, -0.1540659, 2.660851, 0, 0, 0, 1, 1,
0.8251931, 1.551431, 0.2836166, 0, 0, 0, 1, 1,
0.838764, 1.48352, 1.428014, 0, 0, 0, 1, 1,
0.8413908, -0.5583748, 2.90124, 0, 0, 0, 1, 1,
0.8417546, 0.7015446, 0.3121069, 1, 1, 1, 1, 1,
0.8440043, 0.2956279, 2.419528, 1, 1, 1, 1, 1,
0.8450854, -1.006133, 1.81567, 1, 1, 1, 1, 1,
0.8488391, -1.845708, 2.709036, 1, 1, 1, 1, 1,
0.8497151, 0.06547177, 1.746015, 1, 1, 1, 1, 1,
0.8513123, -1.304184, 3.453775, 1, 1, 1, 1, 1,
0.8517166, 0.2713254, 2.555696, 1, 1, 1, 1, 1,
0.8522425, -0.04135447, 0.7991383, 1, 1, 1, 1, 1,
0.8575343, 1.657784, -1.037685, 1, 1, 1, 1, 1,
0.8580794, 1.686992, 0.8637968, 1, 1, 1, 1, 1,
0.8604532, 0.175708, 1.751379, 1, 1, 1, 1, 1,
0.8632951, 2.614567, 2.442352, 1, 1, 1, 1, 1,
0.8653626, -0.6606461, 2.023177, 1, 1, 1, 1, 1,
0.8670275, -0.834765, 3.90095, 1, 1, 1, 1, 1,
0.8678282, -1.0222, 2.715594, 1, 1, 1, 1, 1,
0.8724772, 0.3243511, 1.522487, 0, 0, 1, 1, 1,
0.8829238, 0.9679545, 1.466703, 1, 0, 0, 1, 1,
0.8855852, -1.33062, 3.409721, 1, 0, 0, 1, 1,
0.8874733, -1.079769, 2.571786, 1, 0, 0, 1, 1,
0.8878417, 1.014157, 3.190569, 1, 0, 0, 1, 1,
0.8911284, -0.06719393, 3.316213, 1, 0, 0, 1, 1,
0.896329, -0.8713933, 2.062918, 0, 0, 0, 1, 1,
0.8996813, -1.110537, 1.371539, 0, 0, 0, 1, 1,
0.9043103, -0.06546728, 1.899792, 0, 0, 0, 1, 1,
0.907401, 0.7792121, 1.06547, 0, 0, 0, 1, 1,
0.9142972, -0.5808349, 1.115329, 0, 0, 0, 1, 1,
0.9145753, 1.075884, -0.8400358, 0, 0, 0, 1, 1,
0.9185682, 1.754623, 0.6218723, 0, 0, 0, 1, 1,
0.9189793, -0.2845269, 0.6171726, 1, 1, 1, 1, 1,
0.9239923, -0.1807793, 2.174619, 1, 1, 1, 1, 1,
0.9310524, 1.337883, 1.438658, 1, 1, 1, 1, 1,
0.9397472, 0.7276958, 0.9144088, 1, 1, 1, 1, 1,
0.939823, 1.689335, -0.6173182, 1, 1, 1, 1, 1,
0.9407964, 0.09348762, 1.519303, 1, 1, 1, 1, 1,
0.946867, 0.4061328, 1.948058, 1, 1, 1, 1, 1,
0.9478382, 0.2023458, 2.423322, 1, 1, 1, 1, 1,
0.9518492, 1.730605, 0.169946, 1, 1, 1, 1, 1,
0.9526143, -0.05871382, 0.7380521, 1, 1, 1, 1, 1,
0.9544076, -0.7606348, 0.8303757, 1, 1, 1, 1, 1,
0.9630094, -0.9894221, 2.189419, 1, 1, 1, 1, 1,
0.9645547, 1.448945, 1.036574, 1, 1, 1, 1, 1,
0.9809402, -0.8536187, 4.356698, 1, 1, 1, 1, 1,
0.981195, -1.790318, 3.914479, 1, 1, 1, 1, 1,
0.9822963, 0.08961397, 2.123709, 0, 0, 1, 1, 1,
0.9826478, 0.5237992, 1.971389, 1, 0, 0, 1, 1,
0.9839431, -0.8216377, 1.047923, 1, 0, 0, 1, 1,
0.9918581, 0.8727574, 1.468269, 1, 0, 0, 1, 1,
1.005988, -1.859524, 3.237234, 1, 0, 0, 1, 1,
1.01533, 0.3969666, 0.6542345, 1, 0, 0, 1, 1,
1.017853, 1.693024, 2.590375, 0, 0, 0, 1, 1,
1.019453, 2.287956, 0.3167986, 0, 0, 0, 1, 1,
1.021151, -1.441302, 3.719091, 0, 0, 0, 1, 1,
1.022947, 0.838415, 1.074917, 0, 0, 0, 1, 1,
1.026344, 0.7906306, 2.878097, 0, 0, 0, 1, 1,
1.029787, 0.7583006, 1.170174, 0, 0, 0, 1, 1,
1.033086, -0.4344035, 1.393925, 0, 0, 0, 1, 1,
1.041873, -0.08974472, 1.021695, 1, 1, 1, 1, 1,
1.045183, 1.003235, 1.920073, 1, 1, 1, 1, 1,
1.046166, 0.1019119, 1.093427, 1, 1, 1, 1, 1,
1.049571, -0.2576702, 0.7862408, 1, 1, 1, 1, 1,
1.065545, 0.1000399, 0.9666926, 1, 1, 1, 1, 1,
1.06772, -0.7071964, 0.8022488, 1, 1, 1, 1, 1,
1.069459, -1.436117, 1.568654, 1, 1, 1, 1, 1,
1.076394, 0.8648467, 0.7235676, 1, 1, 1, 1, 1,
1.077164, 1.428771, 2.700425, 1, 1, 1, 1, 1,
1.083498, -0.8225552, 2.145409, 1, 1, 1, 1, 1,
1.083542, -0.3393296, 2.642476, 1, 1, 1, 1, 1,
1.085728, 2.496762, 0.2476072, 1, 1, 1, 1, 1,
1.093212, -0.8089249, 1.768365, 1, 1, 1, 1, 1,
1.09346, -1.705674, 2.00247, 1, 1, 1, 1, 1,
1.103205, -0.3965738, 0.4890992, 1, 1, 1, 1, 1,
1.103272, 0.3745708, 0.8050103, 0, 0, 1, 1, 1,
1.105713, 1.644751, 0.6375815, 1, 0, 0, 1, 1,
1.109324, -1.143689, 3.271739, 1, 0, 0, 1, 1,
1.109756, -0.8788832, 1.615963, 1, 0, 0, 1, 1,
1.111744, -0.5763534, 1.372317, 1, 0, 0, 1, 1,
1.11177, 1.030183, 1.182478, 1, 0, 0, 1, 1,
1.112053, 0.227251, 1.669586, 0, 0, 0, 1, 1,
1.113517, 1.377701, -0.6969267, 0, 0, 0, 1, 1,
1.114524, 1.08341, 0.634254, 0, 0, 0, 1, 1,
1.115262, -1.88091, 3.712792, 0, 0, 0, 1, 1,
1.117272, -0.7220062, 2.103754, 0, 0, 0, 1, 1,
1.120467, -1.11794, 1.80502, 0, 0, 0, 1, 1,
1.122179, -1.90813, 1.147686, 0, 0, 0, 1, 1,
1.123049, -0.5331835, 1.56113, 1, 1, 1, 1, 1,
1.125929, -0.5033611, 1.92555, 1, 1, 1, 1, 1,
1.127689, 0.5888726, 2.179494, 1, 1, 1, 1, 1,
1.137334, 2.282032, -1.952769, 1, 1, 1, 1, 1,
1.139151, -0.5852906, 0.5666121, 1, 1, 1, 1, 1,
1.143025, 0.6334359, 1.012571, 1, 1, 1, 1, 1,
1.144583, -0.7183766, 1.266827, 1, 1, 1, 1, 1,
1.154948, -0.07195495, 0.554655, 1, 1, 1, 1, 1,
1.162574, -0.2983469, 1.571456, 1, 1, 1, 1, 1,
1.169413, -0.6989193, 3.115908, 1, 1, 1, 1, 1,
1.17197, 0.0362598, 0.7778443, 1, 1, 1, 1, 1,
1.173835, 0.6676699, 1.541443, 1, 1, 1, 1, 1,
1.179176, 0.4234687, 2.343117, 1, 1, 1, 1, 1,
1.186532, 0.007806502, -0.1092305, 1, 1, 1, 1, 1,
1.19398, -0.3735635, 2.800981, 1, 1, 1, 1, 1,
1.196198, 1.037451, 1.09272, 0, 0, 1, 1, 1,
1.202668, 2.104534, -0.3330631, 1, 0, 0, 1, 1,
1.207376, 0.3126836, 1.019511, 1, 0, 0, 1, 1,
1.210275, -1.974675, 3.236574, 1, 0, 0, 1, 1,
1.211892, 0.2723671, 2.255258, 1, 0, 0, 1, 1,
1.212571, -0.5768012, 1.510753, 1, 0, 0, 1, 1,
1.216726, -0.1054258, 1.367017, 0, 0, 0, 1, 1,
1.220096, 0.2845224, 3.648531, 0, 0, 0, 1, 1,
1.226259, 0.9358001, -1.030104, 0, 0, 0, 1, 1,
1.226702, 1.006131, 1.535859, 0, 0, 0, 1, 1,
1.237081, -0.7822928, 1.543561, 0, 0, 0, 1, 1,
1.237955, 0.1973641, 1.340426, 0, 0, 0, 1, 1,
1.2391, -0.01242192, 1.568285, 0, 0, 0, 1, 1,
1.249018, -0.4166124, 1.586769, 1, 1, 1, 1, 1,
1.259866, 0.1204153, 0.8895161, 1, 1, 1, 1, 1,
1.260903, -1.394466, 3.503851, 1, 1, 1, 1, 1,
1.274981, -0.1912768, 3.1538, 1, 1, 1, 1, 1,
1.307982, -0.3952043, 3.717468, 1, 1, 1, 1, 1,
1.329791, 1.811085, 1.769809, 1, 1, 1, 1, 1,
1.333007, -0.7043019, 4.026125, 1, 1, 1, 1, 1,
1.340998, -0.6397229, 2.219048, 1, 1, 1, 1, 1,
1.348369, -2.258977, 1.637891, 1, 1, 1, 1, 1,
1.351264, -0.6742113, 2.338926, 1, 1, 1, 1, 1,
1.360983, -0.2977569, 0.4474659, 1, 1, 1, 1, 1,
1.361645, -0.1988643, 1.319951, 1, 1, 1, 1, 1,
1.363461, -0.7819974, 1.006249, 1, 1, 1, 1, 1,
1.371156, -0.770687, 3.001104, 1, 1, 1, 1, 1,
1.376976, -0.89815, 1.138883, 1, 1, 1, 1, 1,
1.378412, -0.4055281, 2.194097, 0, 0, 1, 1, 1,
1.38384, -0.5951508, 3.451109, 1, 0, 0, 1, 1,
1.38717, 0.3625035, 0.4056442, 1, 0, 0, 1, 1,
1.38835, -0.409281, 1.514985, 1, 0, 0, 1, 1,
1.390217, -0.4834936, 2.366043, 1, 0, 0, 1, 1,
1.392557, -0.398349, 2.337113, 1, 0, 0, 1, 1,
1.393657, 1.63149, -0.9984767, 0, 0, 0, 1, 1,
1.403324, 0.006185783, 1.978855, 0, 0, 0, 1, 1,
1.408119, -0.03158267, 1.186581, 0, 0, 0, 1, 1,
1.40996, 0.1611525, 0.6878694, 0, 0, 0, 1, 1,
1.410639, -1.356951, 1.581733, 0, 0, 0, 1, 1,
1.41455, -0.5503724, 0.9979348, 0, 0, 0, 1, 1,
1.421908, 0.8086703, 0.4442439, 0, 0, 0, 1, 1,
1.425725, 0.003218172, 2.373885, 1, 1, 1, 1, 1,
1.430565, -0.1019772, 0.004571304, 1, 1, 1, 1, 1,
1.433836, -2.218483, 2.744149, 1, 1, 1, 1, 1,
1.441916, -1.575311, 1.635997, 1, 1, 1, 1, 1,
1.445593, -1.505911, 2.247567, 1, 1, 1, 1, 1,
1.458841, -0.2564007, 1.404814, 1, 1, 1, 1, 1,
1.462474, -0.7386888, 2.006498, 1, 1, 1, 1, 1,
1.505317, -0.258104, 0.2684215, 1, 1, 1, 1, 1,
1.506025, 0.3186599, 0.07409301, 1, 1, 1, 1, 1,
1.509742, -0.9733204, 2.778245, 1, 1, 1, 1, 1,
1.524677, -0.9949085, 2.695132, 1, 1, 1, 1, 1,
1.528783, 0.8113171, 0.5131632, 1, 1, 1, 1, 1,
1.534667, 0.5755677, 1.850449, 1, 1, 1, 1, 1,
1.535794, -0.875955, 3.122281, 1, 1, 1, 1, 1,
1.560367, -1.154451, 4.395648, 1, 1, 1, 1, 1,
1.563062, -1.153795, 3.821746, 0, 0, 1, 1, 1,
1.574248, 0.9714796, -0.1183095, 1, 0, 0, 1, 1,
1.574328, -0.8704119, 2.599126, 1, 0, 0, 1, 1,
1.580847, 1.17139, 1.099705, 1, 0, 0, 1, 1,
1.59476, 1.080675, 0.1777575, 1, 0, 0, 1, 1,
1.600248, -0.8894909, 2.82333, 1, 0, 0, 1, 1,
1.600965, 0.4894239, 2.656807, 0, 0, 0, 1, 1,
1.605855, -0.4069866, 1.759505, 0, 0, 0, 1, 1,
1.631256, 0.8767158, 0.7893252, 0, 0, 0, 1, 1,
1.635524, 0.1924416, 1.750871, 0, 0, 0, 1, 1,
1.641055, 0.1090581, 3.077751, 0, 0, 0, 1, 1,
1.651496, -0.3592927, 1.529781, 0, 0, 0, 1, 1,
1.651831, -0.4701835, 1.491556, 0, 0, 0, 1, 1,
1.663232, 0.1749309, -0.1348449, 1, 1, 1, 1, 1,
1.670049, -1.244304, -0.2463306, 1, 1, 1, 1, 1,
1.70829, -0.5291774, 1.585, 1, 1, 1, 1, 1,
1.713179, -0.2101368, 3.312931, 1, 1, 1, 1, 1,
1.714378, -0.9275026, -0.01285146, 1, 1, 1, 1, 1,
1.728007, 0.5669696, 1.817891, 1, 1, 1, 1, 1,
1.72971, -1.186539, 1.683814, 1, 1, 1, 1, 1,
1.752692, 0.4341529, 1.495643, 1, 1, 1, 1, 1,
1.773099, 0.5291396, 1.769072, 1, 1, 1, 1, 1,
1.773632, 0.05296159, 1.410145, 1, 1, 1, 1, 1,
1.8105, 0.8434839, 3.136663, 1, 1, 1, 1, 1,
1.817312, -2.179015, 3.392085, 1, 1, 1, 1, 1,
1.836793, -0.3587279, 1.000954, 1, 1, 1, 1, 1,
1.85707, -0.5306524, 2.296974, 1, 1, 1, 1, 1,
1.858179, -0.7302973, 1.530657, 1, 1, 1, 1, 1,
1.87754, -1.880756, 0.9853148, 0, 0, 1, 1, 1,
1.921222, -1.899693, 3.692284, 1, 0, 0, 1, 1,
1.964977, -0.09734455, 1.090798, 1, 0, 0, 1, 1,
1.968383, 0.7488239, 0.9780499, 1, 0, 0, 1, 1,
1.987161, 0.8805478, 0.4462408, 1, 0, 0, 1, 1,
2.00409, 1.626537, 1.411454, 1, 0, 0, 1, 1,
2.03229, 0.0746495, 2.753291, 0, 0, 0, 1, 1,
2.074615, 0.7115954, 0.7338262, 0, 0, 0, 1, 1,
2.13522, 0.4740664, -0.4814947, 0, 0, 0, 1, 1,
2.324113, 0.02874253, 0.8848053, 0, 0, 0, 1, 1,
2.35795, 1.454254, 2.322618, 0, 0, 0, 1, 1,
2.35921, 0.7410887, -0.2088149, 0, 0, 0, 1, 1,
2.39827, 0.1520406, 1.929407, 0, 0, 0, 1, 1,
2.481813, 0.4082684, 0.6154253, 1, 1, 1, 1, 1,
2.587041, 0.3467076, 2.819986, 1, 1, 1, 1, 1,
2.596089, 0.5712997, 1.750145, 1, 1, 1, 1, 1,
2.853914, 0.7243129, 2.309219, 1, 1, 1, 1, 1,
2.874634, 0.5033144, 1.863334, 1, 1, 1, 1, 1,
3.007243, 1.843593, 1.356836, 1, 1, 1, 1, 1,
3.230091, 0.4360377, 1.567283, 1, 1, 1, 1, 1
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
var radius = 9.493428;
var distance = 33.34527;
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
mvMatrix.translate( 0.01527047, -0.1609058, 0.3526771 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.34527);
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
