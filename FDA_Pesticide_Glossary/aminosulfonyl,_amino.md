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
-2.765571, -0.9791409, -1.402819, 1, 0, 0, 1,
-2.716165, -0.8067297, -2.383806, 1, 0.007843138, 0, 1,
-2.523789, 0.08418909, -1.278167, 1, 0.01176471, 0, 1,
-2.471969, 0.9183063, 0.1828429, 1, 0.01960784, 0, 1,
-2.4344, -0.6430897, -2.12743, 1, 0.02352941, 0, 1,
-2.364645, -0.1704169, -1.902377, 1, 0.03137255, 0, 1,
-2.364263, 1.204612, -2.217148, 1, 0.03529412, 0, 1,
-2.288529, 0.7787491, -0.07837013, 1, 0.04313726, 0, 1,
-2.252871, -1.604945, -4.135252, 1, 0.04705882, 0, 1,
-2.192398, 0.5072476, -1.307102, 1, 0.05490196, 0, 1,
-2.116823, 1.089506, -1.476732, 1, 0.05882353, 0, 1,
-2.086029, 0.6291126, -2.911086, 1, 0.06666667, 0, 1,
-2.060306, -0.8665363, -2.655876, 1, 0.07058824, 0, 1,
-2.036896, 2.445438, -0.9188871, 1, 0.07843138, 0, 1,
-2.036376, -0.1439126, -1.494075, 1, 0.08235294, 0, 1,
-2.030397, -1.788471, -2.661697, 1, 0.09019608, 0, 1,
-2.02694, 0.09337829, -1.142114, 1, 0.09411765, 0, 1,
-2.004508, 1.783599, -1.364999, 1, 0.1019608, 0, 1,
-2.002353, -1.215092, -1.594386, 1, 0.1098039, 0, 1,
-1.980068, 1.678975, -0.375618, 1, 0.1137255, 0, 1,
-1.976506, -0.6549767, -2.680682, 1, 0.1215686, 0, 1,
-1.966211, 1.276949, 0.3440416, 1, 0.1254902, 0, 1,
-1.953087, -0.9308414, -2.671419, 1, 0.1333333, 0, 1,
-1.948253, 0.2324348, -0.7148833, 1, 0.1372549, 0, 1,
-1.914919, 0.07561948, -2.90654, 1, 0.145098, 0, 1,
-1.914199, 1.084212, 1.304826, 1, 0.1490196, 0, 1,
-1.8969, 0.5098614, -1.906216, 1, 0.1568628, 0, 1,
-1.89448, 0.3300934, -1.818537, 1, 0.1607843, 0, 1,
-1.885321, 0.0889968, -1.698438, 1, 0.1686275, 0, 1,
-1.856602, 0.2040767, 0.9680107, 1, 0.172549, 0, 1,
-1.841071, 0.4680823, -0.2967473, 1, 0.1803922, 0, 1,
-1.834913, -0.3836905, -1.614905, 1, 0.1843137, 0, 1,
-1.805162, -0.6925613, -2.694404, 1, 0.1921569, 0, 1,
-1.803863, -0.1459284, -1.46818, 1, 0.1960784, 0, 1,
-1.796307, 2.173052, -0.9177223, 1, 0.2039216, 0, 1,
-1.796285, 0.4814604, 0.4989379, 1, 0.2117647, 0, 1,
-1.787403, -1.181462, -0.7874582, 1, 0.2156863, 0, 1,
-1.781178, 0.3345041, -1.684983, 1, 0.2235294, 0, 1,
-1.772557, -0.2052293, -1.45156, 1, 0.227451, 0, 1,
-1.742116, 0.6551731, -1.531276, 1, 0.2352941, 0, 1,
-1.727191, 0.3823551, -2.623896, 1, 0.2392157, 0, 1,
-1.699924, 1.224228, -2.429561, 1, 0.2470588, 0, 1,
-1.697615, 0.8866747, 0.6500049, 1, 0.2509804, 0, 1,
-1.672862, -0.1902958, -2.786657, 1, 0.2588235, 0, 1,
-1.655945, -0.5413959, -2.52924, 1, 0.2627451, 0, 1,
-1.635096, -3.298781, -2.246967, 1, 0.2705882, 0, 1,
-1.632367, 0.7263654, 0.9185844, 1, 0.2745098, 0, 1,
-1.626425, -1.508418, -2.222393, 1, 0.282353, 0, 1,
-1.624395, 0.3758396, -1.308811, 1, 0.2862745, 0, 1,
-1.610926, -0.7454047, 0.02109015, 1, 0.2941177, 0, 1,
-1.598142, -0.606195, -0.8637353, 1, 0.3019608, 0, 1,
-1.596546, 2.270589, 0.7620296, 1, 0.3058824, 0, 1,
-1.594884, -0.8582974, -2.186892, 1, 0.3137255, 0, 1,
-1.593687, 1.093465, -1.243328, 1, 0.3176471, 0, 1,
-1.586655, -0.9795529, -2.201337, 1, 0.3254902, 0, 1,
-1.58602, 0.3313575, 0.1136686, 1, 0.3294118, 0, 1,
-1.581268, 0.2041528, -0.385926, 1, 0.3372549, 0, 1,
-1.557174, -0.3267445, -1.921215, 1, 0.3411765, 0, 1,
-1.548252, 0.4224769, -1.352361, 1, 0.3490196, 0, 1,
-1.547817, -0.242642, -0.006215643, 1, 0.3529412, 0, 1,
-1.494066, 1.643149, 0.3661924, 1, 0.3607843, 0, 1,
-1.485812, 0.006949955, -1.284333, 1, 0.3647059, 0, 1,
-1.477339, 1.163644, -1.640911, 1, 0.372549, 0, 1,
-1.471021, -0.2864209, -0.666464, 1, 0.3764706, 0, 1,
-1.467516, -0.6555126, -1.464822, 1, 0.3843137, 0, 1,
-1.463974, -0.1189719, -1.134445, 1, 0.3882353, 0, 1,
-1.446182, -1.623783, -2.028354, 1, 0.3960784, 0, 1,
-1.436004, -0.3868147, -2.797091, 1, 0.4039216, 0, 1,
-1.435114, 0.8726363, -3.043162, 1, 0.4078431, 0, 1,
-1.432773, -0.1717232, -1.8475, 1, 0.4156863, 0, 1,
-1.428876, 1.427072, 2.028343, 1, 0.4196078, 0, 1,
-1.426427, -0.4900231, -0.4308306, 1, 0.427451, 0, 1,
-1.419228, 0.4501921, -2.950936, 1, 0.4313726, 0, 1,
-1.401571, 0.2201607, -2.1462, 1, 0.4392157, 0, 1,
-1.40141, 1.80346, 0.7195804, 1, 0.4431373, 0, 1,
-1.397938, -0.7839241, -0.9829227, 1, 0.4509804, 0, 1,
-1.39394, -2.043689, -1.953504, 1, 0.454902, 0, 1,
-1.392405, -1.501779, -1.905136, 1, 0.4627451, 0, 1,
-1.38946, 1.306435, -0.4999102, 1, 0.4666667, 0, 1,
-1.387542, 1.293787, -1.656525, 1, 0.4745098, 0, 1,
-1.381597, -1.88316, -0.4711749, 1, 0.4784314, 0, 1,
-1.378261, -0.5843994, -3.847352, 1, 0.4862745, 0, 1,
-1.375135, 0.2797267, -3.244552, 1, 0.4901961, 0, 1,
-1.374953, -0.01525076, -3.020639, 1, 0.4980392, 0, 1,
-1.374797, 0.3678607, 0.7849374, 1, 0.5058824, 0, 1,
-1.371062, 0.834313, -0.02232118, 1, 0.509804, 0, 1,
-1.357186, 0.04640642, -2.016698, 1, 0.5176471, 0, 1,
-1.354114, -0.4943442, -1.612347, 1, 0.5215687, 0, 1,
-1.341849, -0.4346179, -2.867876, 1, 0.5294118, 0, 1,
-1.323826, 0.6861765, -1.915154, 1, 0.5333334, 0, 1,
-1.32251, -0.6471438, -2.633995, 1, 0.5411765, 0, 1,
-1.322248, 0.4411395, -1.748187, 1, 0.5450981, 0, 1,
-1.317219, -0.5807696, -2.122445, 1, 0.5529412, 0, 1,
-1.314144, 0.9317976, -1.664663, 1, 0.5568628, 0, 1,
-1.311226, 0.7300155, -0.2904981, 1, 0.5647059, 0, 1,
-1.306265, 0.7113655, -1.266447, 1, 0.5686275, 0, 1,
-1.304055, -2.05935, -4.082342, 1, 0.5764706, 0, 1,
-1.29569, 0.01710405, 0.1082382, 1, 0.5803922, 0, 1,
-1.294251, 0.2849247, -2.469396, 1, 0.5882353, 0, 1,
-1.29037, 0.2618783, -2.226069, 1, 0.5921569, 0, 1,
-1.281954, 1.018988, -1.130423, 1, 0.6, 0, 1,
-1.281864, -0.2310711, -1.075811, 1, 0.6078432, 0, 1,
-1.275354, 0.5898441, -2.00727, 1, 0.6117647, 0, 1,
-1.275347, 1.340033, -0.1376835, 1, 0.6196079, 0, 1,
-1.272704, -1.855922, -1.354381, 1, 0.6235294, 0, 1,
-1.27072, 0.3424006, 1.276562, 1, 0.6313726, 0, 1,
-1.269576, -1.296712, -2.112534, 1, 0.6352941, 0, 1,
-1.26161, 0.2676689, -1.951863, 1, 0.6431373, 0, 1,
-1.257065, 0.9479029, -2.229339, 1, 0.6470588, 0, 1,
-1.253272, -0.5496105, -3.989531, 1, 0.654902, 0, 1,
-1.249152, 1.534493, -1.415531, 1, 0.6588235, 0, 1,
-1.240445, 0.5696504, -0.5491447, 1, 0.6666667, 0, 1,
-1.238279, 0.8201445, -1.216517, 1, 0.6705883, 0, 1,
-1.23788, -0.0117999, -0.1139452, 1, 0.6784314, 0, 1,
-1.235018, -0.3537962, -1.922401, 1, 0.682353, 0, 1,
-1.227927, -0.3917933, -2.435936, 1, 0.6901961, 0, 1,
-1.214535, 0.06123206, -3.643228, 1, 0.6941177, 0, 1,
-1.200517, -1.75618, -3.363817, 1, 0.7019608, 0, 1,
-1.186867, -0.5608879, -1.223867, 1, 0.7098039, 0, 1,
-1.18365, 1.371866, -0.2131298, 1, 0.7137255, 0, 1,
-1.182849, -0.1865293, -1.900656, 1, 0.7215686, 0, 1,
-1.178573, 1.064623, -1.300231, 1, 0.7254902, 0, 1,
-1.16522, -0.7654763, -3.588145, 1, 0.7333333, 0, 1,
-1.16169, -0.1920062, -2.480654, 1, 0.7372549, 0, 1,
-1.157718, 2.061903, 0.01063924, 1, 0.7450981, 0, 1,
-1.152793, 0.5642695, -1.654928, 1, 0.7490196, 0, 1,
-1.151678, -1.752315, -2.247099, 1, 0.7568628, 0, 1,
-1.150375, -0.9964291, -1.672636, 1, 0.7607843, 0, 1,
-1.146526, 1.476381, -1.449228, 1, 0.7686275, 0, 1,
-1.139904, -0.4842466, -2.193887, 1, 0.772549, 0, 1,
-1.137278, 0.08357759, 0.3914887, 1, 0.7803922, 0, 1,
-1.129878, -0.910578, -2.554147, 1, 0.7843137, 0, 1,
-1.122393, -1.280152, -2.145826, 1, 0.7921569, 0, 1,
-1.110616, 0.09677506, -1.276049, 1, 0.7960784, 0, 1,
-1.107893, -0.07435211, 0.2862046, 1, 0.8039216, 0, 1,
-1.107601, 1.839117, 0.6576709, 1, 0.8117647, 0, 1,
-1.09957, -0.4563392, -1.629181, 1, 0.8156863, 0, 1,
-1.096608, -0.7084909, -3.52912, 1, 0.8235294, 0, 1,
-1.088361, 0.3019219, -0.5531029, 1, 0.827451, 0, 1,
-1.073187, 0.1957039, -3.387965, 1, 0.8352941, 0, 1,
-1.072565, -1.006959, -4.066622, 1, 0.8392157, 0, 1,
-1.071078, -0.4621515, -0.8894603, 1, 0.8470588, 0, 1,
-1.06956, -0.4630109, -1.777529, 1, 0.8509804, 0, 1,
-1.068719, -0.070412, -3.205796, 1, 0.8588235, 0, 1,
-1.065434, 1.252096, -0.1813448, 1, 0.8627451, 0, 1,
-1.064747, 0.5918764, -0.9889529, 1, 0.8705882, 0, 1,
-1.058102, -0.3846909, -1.914845, 1, 0.8745098, 0, 1,
-1.053026, 0.2944118, -1.680421, 1, 0.8823529, 0, 1,
-1.050255, -0.6187449, -1.911564, 1, 0.8862745, 0, 1,
-1.049711, -2.026429, -2.782992, 1, 0.8941177, 0, 1,
-1.048603, -0.141959, -1.414727, 1, 0.8980392, 0, 1,
-1.046048, -0.4452857, -0.8449332, 1, 0.9058824, 0, 1,
-1.045676, 0.2723705, -0.1677282, 1, 0.9137255, 0, 1,
-1.043628, -0.555882, -3.019302, 1, 0.9176471, 0, 1,
-1.034729, -0.084562, -1.13914, 1, 0.9254902, 0, 1,
-1.032556, -1.336925, -3.303277, 1, 0.9294118, 0, 1,
-1.03179, 0.6131576, -1.218973, 1, 0.9372549, 0, 1,
-1.024342, -0.6444343, -3.212148, 1, 0.9411765, 0, 1,
-1.021837, 0.6531752, -3.147547, 1, 0.9490196, 0, 1,
-1.018307, -0.7549258, -4.294032, 1, 0.9529412, 0, 1,
-1.008605, 1.249719, 0.4901327, 1, 0.9607843, 0, 1,
-1.007882, 0.01650126, -2.285621, 1, 0.9647059, 0, 1,
-1.003584, 0.4102767, -0.5047173, 1, 0.972549, 0, 1,
-1.002523, 1.656039, -0.6800908, 1, 0.9764706, 0, 1,
-0.9971339, 1.960665, -0.3793136, 1, 0.9843137, 0, 1,
-0.9907246, 0.3739114, 0.3100645, 1, 0.9882353, 0, 1,
-0.9767596, -0.02250121, -2.537754, 1, 0.9960784, 0, 1,
-0.9753115, -0.9377886, -2.236039, 0.9960784, 1, 0, 1,
-0.9745837, -0.1961332, -2.547132, 0.9921569, 1, 0, 1,
-0.9722129, -0.02760614, 0.8801811, 0.9843137, 1, 0, 1,
-0.9694843, -0.1088525, -3.984355, 0.9803922, 1, 0, 1,
-0.9693383, -0.03331888, -3.275962, 0.972549, 1, 0, 1,
-0.9675804, 0.7958338, -2.413594, 0.9686275, 1, 0, 1,
-0.9664607, 0.4978729, -3.11731, 0.9607843, 1, 0, 1,
-0.9602476, -0.2665128, -1.586893, 0.9568627, 1, 0, 1,
-0.9601917, 1.19119, -1.229625, 0.9490196, 1, 0, 1,
-0.9583956, -0.4407313, -0.6596559, 0.945098, 1, 0, 1,
-0.9581739, 0.2820235, -0.8117372, 0.9372549, 1, 0, 1,
-0.9522455, -1.044864, -0.9470773, 0.9333333, 1, 0, 1,
-0.9497668, 0.04167778, -0.9088167, 0.9254902, 1, 0, 1,
-0.9495172, 1.433874, -2.285887, 0.9215686, 1, 0, 1,
-0.9469604, -0.8083024, -2.355337, 0.9137255, 1, 0, 1,
-0.9335524, 0.8868378, -1.222809, 0.9098039, 1, 0, 1,
-0.9333287, -0.948324, -1.93813, 0.9019608, 1, 0, 1,
-0.9308771, 0.2326979, -1.15379, 0.8941177, 1, 0, 1,
-0.9229501, -1.28437, -3.503275, 0.8901961, 1, 0, 1,
-0.9157013, -0.3759862, -2.229739, 0.8823529, 1, 0, 1,
-0.9123494, -0.588612, -3.254038, 0.8784314, 1, 0, 1,
-0.9103127, -0.8768885, -2.84514, 0.8705882, 1, 0, 1,
-0.9091665, 0.04149553, -1.676063, 0.8666667, 1, 0, 1,
-0.9079008, 1.706211, 1.183652, 0.8588235, 1, 0, 1,
-0.9042429, -0.1398204, -0.8004816, 0.854902, 1, 0, 1,
-0.8958274, 0.6760967, -0.2171221, 0.8470588, 1, 0, 1,
-0.8948035, -1.162022, -3.339744, 0.8431373, 1, 0, 1,
-0.8933311, -0.4032938, -3.758709, 0.8352941, 1, 0, 1,
-0.8885712, -0.4804958, -2.931532, 0.8313726, 1, 0, 1,
-0.8739789, -0.3116475, -1.895582, 0.8235294, 1, 0, 1,
-0.8704578, 0.8127214, -0.8667502, 0.8196079, 1, 0, 1,
-0.8704435, 0.03265899, -1.580817, 0.8117647, 1, 0, 1,
-0.8685348, -1.394724, -1.068254, 0.8078431, 1, 0, 1,
-0.8670625, 0.268234, -1.661569, 0.8, 1, 0, 1,
-0.8631808, 0.6279545, -1.760668, 0.7921569, 1, 0, 1,
-0.8558355, -0.6915163, -2.85049, 0.7882353, 1, 0, 1,
-0.8502673, 0.2126124, -1.311406, 0.7803922, 1, 0, 1,
-0.8476033, 1.007816, 0.4045275, 0.7764706, 1, 0, 1,
-0.8464049, 0.9723527, 0.03910895, 0.7686275, 1, 0, 1,
-0.8427095, -1.293547, -2.436864, 0.7647059, 1, 0, 1,
-0.841702, -0.9672821, -1.798863, 0.7568628, 1, 0, 1,
-0.840156, 0.5266048, -1.52581, 0.7529412, 1, 0, 1,
-0.83941, -1.08072, -3.025321, 0.7450981, 1, 0, 1,
-0.8274032, -1.142912, -3.17185, 0.7411765, 1, 0, 1,
-0.8152121, 1.412724, -0.2689293, 0.7333333, 1, 0, 1,
-0.8145322, -0.13114, 0.08950999, 0.7294118, 1, 0, 1,
-0.8037177, 0.2699432, -1.369267, 0.7215686, 1, 0, 1,
-0.8036292, -1.007159, -4.725696, 0.7176471, 1, 0, 1,
-0.8034598, 3.737907, -0.5971106, 0.7098039, 1, 0, 1,
-0.7998455, -0.1114279, -2.1095, 0.7058824, 1, 0, 1,
-0.7997054, 2.876047, 0.614703, 0.6980392, 1, 0, 1,
-0.7814069, 0.124137, -2.703683, 0.6901961, 1, 0, 1,
-0.7707307, 0.3421798, 0.1817449, 0.6862745, 1, 0, 1,
-0.7664982, 0.09231964, -1.633805, 0.6784314, 1, 0, 1,
-0.7643875, -0.3556413, -2.201517, 0.6745098, 1, 0, 1,
-0.7600266, 0.3809296, -0.9303209, 0.6666667, 1, 0, 1,
-0.7567203, -0.7700075, -2.468243, 0.6627451, 1, 0, 1,
-0.7532616, -1.285405, -3.076496, 0.654902, 1, 0, 1,
-0.7477783, 0.7871044, -1.375339, 0.6509804, 1, 0, 1,
-0.7471837, -0.1940042, -3.314068, 0.6431373, 1, 0, 1,
-0.742473, 0.1831136, -1.246942, 0.6392157, 1, 0, 1,
-0.7421791, -0.7536992, -1.550051, 0.6313726, 1, 0, 1,
-0.7374741, 0.06430615, -2.849481, 0.627451, 1, 0, 1,
-0.7368702, 0.9846449, -0.6180304, 0.6196079, 1, 0, 1,
-0.727642, 1.549004, 0.8074746, 0.6156863, 1, 0, 1,
-0.7205685, 0.9377243, -0.8928963, 0.6078432, 1, 0, 1,
-0.7153534, -1.023959, -1.994498, 0.6039216, 1, 0, 1,
-0.7111294, 1.066531, -0.80327, 0.5960785, 1, 0, 1,
-0.7089815, -0.4093892, -2.323887, 0.5882353, 1, 0, 1,
-0.7055841, -0.9162292, -3.7572, 0.5843138, 1, 0, 1,
-0.6924071, 1.241524, -2.070696, 0.5764706, 1, 0, 1,
-0.6879799, -0.5099326, -1.683403, 0.572549, 1, 0, 1,
-0.6841282, 0.1389393, -0.3621802, 0.5647059, 1, 0, 1,
-0.6823848, 1.323259, -0.2440035, 0.5607843, 1, 0, 1,
-0.6804304, 0.1989977, -3.199381, 0.5529412, 1, 0, 1,
-0.6802762, -0.9559109, -3.836593, 0.5490196, 1, 0, 1,
-0.6766585, -1.101813, -2.590072, 0.5411765, 1, 0, 1,
-0.6725761, 0.01227169, -3.080382, 0.5372549, 1, 0, 1,
-0.6654242, 0.3318713, -2.586877, 0.5294118, 1, 0, 1,
-0.6585439, 0.5575463, -1.70799, 0.5254902, 1, 0, 1,
-0.6581456, -0.9001321, 0.2854863, 0.5176471, 1, 0, 1,
-0.6571437, -0.136552, -3.212958, 0.5137255, 1, 0, 1,
-0.6454957, 1.122339, -0.5893416, 0.5058824, 1, 0, 1,
-0.6448008, 0.178977, -0.8910078, 0.5019608, 1, 0, 1,
-0.6412395, 1.006469, 0.5211168, 0.4941176, 1, 0, 1,
-0.6395338, 0.02601483, -0.4728584, 0.4862745, 1, 0, 1,
-0.6385983, -0.9000425, -3.136753, 0.4823529, 1, 0, 1,
-0.6375933, -1.554333, -2.796545, 0.4745098, 1, 0, 1,
-0.6357832, 0.009620354, -0.8206509, 0.4705882, 1, 0, 1,
-0.6344059, 0.8193023, 0.8170087, 0.4627451, 1, 0, 1,
-0.6312326, 0.7575501, 0.7447492, 0.4588235, 1, 0, 1,
-0.6280812, -0.5262725, -2.853192, 0.4509804, 1, 0, 1,
-0.6274136, -0.07970237, -0.9030163, 0.4470588, 1, 0, 1,
-0.6224142, -0.9888647, -1.712025, 0.4392157, 1, 0, 1,
-0.6194771, -0.1050528, -1.913973, 0.4352941, 1, 0, 1,
-0.6192818, -0.108396, -1.078561, 0.427451, 1, 0, 1,
-0.6103904, -0.08670916, -1.886423, 0.4235294, 1, 0, 1,
-0.6095417, 0.2664311, -0.2727489, 0.4156863, 1, 0, 1,
-0.6078604, 1.50871, -0.3461441, 0.4117647, 1, 0, 1,
-0.6045985, -0.01191318, -1.58524, 0.4039216, 1, 0, 1,
-0.6029682, 0.8341336, 0.5221109, 0.3960784, 1, 0, 1,
-0.6019268, -1.022016, -1.933327, 0.3921569, 1, 0, 1,
-0.6004321, -1.162272, -4.459946, 0.3843137, 1, 0, 1,
-0.5976275, 0.2676508, -1.436696, 0.3803922, 1, 0, 1,
-0.5936147, 0.05581185, -0.9972918, 0.372549, 1, 0, 1,
-0.5909193, -0.4099979, -1.497305, 0.3686275, 1, 0, 1,
-0.5897056, -1.240655, -3.224731, 0.3607843, 1, 0, 1,
-0.5853972, 1.413212, -1.593924, 0.3568628, 1, 0, 1,
-0.5843987, -0.7927209, -1.738036, 0.3490196, 1, 0, 1,
-0.5843211, 1.046932, 0.4161138, 0.345098, 1, 0, 1,
-0.5842781, 1.301205, -0.1580216, 0.3372549, 1, 0, 1,
-0.5836637, 1.173834, -1.671536, 0.3333333, 1, 0, 1,
-0.5804014, 1.365819, -1.745657, 0.3254902, 1, 0, 1,
-0.5787683, -0.5084888, -2.69147, 0.3215686, 1, 0, 1,
-0.578433, 0.003783018, -2.149169, 0.3137255, 1, 0, 1,
-0.5732017, 0.9867915, -0.7917412, 0.3098039, 1, 0, 1,
-0.5709648, -1.538288, -2.397711, 0.3019608, 1, 0, 1,
-0.5640163, 0.2256562, -2.042033, 0.2941177, 1, 0, 1,
-0.5633425, -0.26134, -2.508957, 0.2901961, 1, 0, 1,
-0.5598119, 1.804357, 0.1334414, 0.282353, 1, 0, 1,
-0.5555248, 0.6690198, -1.342732, 0.2784314, 1, 0, 1,
-0.5552973, 2.488634, -0.2646368, 0.2705882, 1, 0, 1,
-0.551551, -1.494565, -2.572137, 0.2666667, 1, 0, 1,
-0.5502899, 1.769284, -2.060868, 0.2588235, 1, 0, 1,
-0.5460232, 1.054364, -2.280804, 0.254902, 1, 0, 1,
-0.5420675, 0.7780815, -0.1912775, 0.2470588, 1, 0, 1,
-0.5403839, -0.2863559, -3.360989, 0.2431373, 1, 0, 1,
-0.5360144, -0.9885226, -2.328778, 0.2352941, 1, 0, 1,
-0.5353202, 0.8201519, -0.6030963, 0.2313726, 1, 0, 1,
-0.5284522, -0.161903, -3.327074, 0.2235294, 1, 0, 1,
-0.5250912, -1.035243, -3.100989, 0.2196078, 1, 0, 1,
-0.5250825, 0.7733756, -1.98092, 0.2117647, 1, 0, 1,
-0.5234722, -1.445206, -4.993016, 0.2078431, 1, 0, 1,
-0.5111596, 0.4129417, -1.276464, 0.2, 1, 0, 1,
-0.5086541, -0.3556244, -4.811158, 0.1921569, 1, 0, 1,
-0.5024492, 0.6258004, -1.834026, 0.1882353, 1, 0, 1,
-0.4953313, 0.8311719, -0.02583355, 0.1803922, 1, 0, 1,
-0.488339, -0.8884328, -2.806254, 0.1764706, 1, 0, 1,
-0.4872299, 0.6146316, -0.9875113, 0.1686275, 1, 0, 1,
-0.4851105, 1.674413, -0.1006028, 0.1647059, 1, 0, 1,
-0.4844475, -0.6119689, -4.886674, 0.1568628, 1, 0, 1,
-0.4833477, 0.3364074, 0.3194697, 0.1529412, 1, 0, 1,
-0.4743321, 1.639855, -1.252877, 0.145098, 1, 0, 1,
-0.4736483, 2.615088, 0.6477336, 0.1411765, 1, 0, 1,
-0.4725931, 1.280526, 0.9765226, 0.1333333, 1, 0, 1,
-0.4701297, -0.6100968, -4.204489, 0.1294118, 1, 0, 1,
-0.4483632, -0.8680087, 0.7622266, 0.1215686, 1, 0, 1,
-0.4481099, -0.8073381, -4.681241, 0.1176471, 1, 0, 1,
-0.4459664, -0.9273779, -3.344725, 0.1098039, 1, 0, 1,
-0.4458804, -0.201834, -2.460767, 0.1058824, 1, 0, 1,
-0.4427651, -1.423988, -2.949675, 0.09803922, 1, 0, 1,
-0.4393807, -1.459527, -2.321576, 0.09019608, 1, 0, 1,
-0.4348728, 0.657427, -2.386242, 0.08627451, 1, 0, 1,
-0.4338211, 0.1500228, -2.63912, 0.07843138, 1, 0, 1,
-0.433633, -1.296581, -3.342556, 0.07450981, 1, 0, 1,
-0.4335902, -0.8232829, -2.242085, 0.06666667, 1, 0, 1,
-0.4317088, 1.590697, -0.4242347, 0.0627451, 1, 0, 1,
-0.431278, 1.38424, -0.391857, 0.05490196, 1, 0, 1,
-0.4303448, -1.518131, -1.926925, 0.05098039, 1, 0, 1,
-0.425748, 1.449711, -1.922756, 0.04313726, 1, 0, 1,
-0.4251919, 0.7192138, -1.158898, 0.03921569, 1, 0, 1,
-0.4238687, -0.3809721, -2.542251, 0.03137255, 1, 0, 1,
-0.4234146, 0.09141272, -0.09617643, 0.02745098, 1, 0, 1,
-0.4190386, 0.1548068, -1.071643, 0.01960784, 1, 0, 1,
-0.4174663, 0.01061149, -0.09539409, 0.01568628, 1, 0, 1,
-0.405483, -1.064186, -1.677058, 0.007843138, 1, 0, 1,
-0.4007947, 0.2928397, -0.971522, 0.003921569, 1, 0, 1,
-0.3982465, 1.249917, -2.27528, 0, 1, 0.003921569, 1,
-0.3981605, 0.133044, -2.06266, 0, 1, 0.01176471, 1,
-0.3975087, -0.3665712, -2.397866, 0, 1, 0.01568628, 1,
-0.394034, -0.308815, -1.025968, 0, 1, 0.02352941, 1,
-0.3939997, -1.1222, -3.531811, 0, 1, 0.02745098, 1,
-0.3934112, -2.963516, -2.176876, 0, 1, 0.03529412, 1,
-0.3887395, -0.1548637, -2.236332, 0, 1, 0.03921569, 1,
-0.3885358, 0.1361803, -2.028015, 0, 1, 0.04705882, 1,
-0.3865875, 0.3345767, -0.2540355, 0, 1, 0.05098039, 1,
-0.3816981, -0.495617, -2.649445, 0, 1, 0.05882353, 1,
-0.3768017, -0.1965109, -3.720048, 0, 1, 0.0627451, 1,
-0.3764621, 0.852265, -0.7692109, 0, 1, 0.07058824, 1,
-0.3749653, 0.6738946, -0.7710824, 0, 1, 0.07450981, 1,
-0.373822, 0.4032825, -1.839584, 0, 1, 0.08235294, 1,
-0.3696413, -0.3459947, -1.066148, 0, 1, 0.08627451, 1,
-0.3671163, 0.6933441, -0.6824027, 0, 1, 0.09411765, 1,
-0.3667309, 0.07051289, -1.305107, 0, 1, 0.1019608, 1,
-0.3653195, 0.9708086, 1.127948, 0, 1, 0.1058824, 1,
-0.3639679, 2.126976, -1.440478, 0, 1, 0.1137255, 1,
-0.3608765, -0.2857993, -1.678318, 0, 1, 0.1176471, 1,
-0.355935, 0.7211746, -1.352557, 0, 1, 0.1254902, 1,
-0.3523796, -0.3527568, -4.217564, 0, 1, 0.1294118, 1,
-0.3507935, 2.124295, 0.02174827, 0, 1, 0.1372549, 1,
-0.3475109, 0.7227226, -1.44395, 0, 1, 0.1411765, 1,
-0.3387327, -0.2040072, -2.139083, 0, 1, 0.1490196, 1,
-0.3387055, 0.9237762, -1.910152, 0, 1, 0.1529412, 1,
-0.3379221, -1.148314, -3.142824, 0, 1, 0.1607843, 1,
-0.3347751, -0.7522154, -3.087483, 0, 1, 0.1647059, 1,
-0.3344042, 0.6727328, 1.449989, 0, 1, 0.172549, 1,
-0.3327453, -0.4763335, -2.876266, 0, 1, 0.1764706, 1,
-0.3241999, -0.2784453, -1.957503, 0, 1, 0.1843137, 1,
-0.3152371, 0.5995933, -0.6195258, 0, 1, 0.1882353, 1,
-0.3102507, -1.232923, -2.177894, 0, 1, 0.1960784, 1,
-0.3098101, 0.04396286, -1.730802, 0, 1, 0.2039216, 1,
-0.3096766, -0.3377812, -1.514758, 0, 1, 0.2078431, 1,
-0.3092194, -0.647107, -3.569069, 0, 1, 0.2156863, 1,
-0.3073406, 0.6369075, -0.9834967, 0, 1, 0.2196078, 1,
-0.3069128, 1.067129, -1.34397, 0, 1, 0.227451, 1,
-0.3063689, 1.636483, -0.786572, 0, 1, 0.2313726, 1,
-0.3050137, 0.3289866, -0.7969899, 0, 1, 0.2392157, 1,
-0.304739, 0.1318696, -2.024638, 0, 1, 0.2431373, 1,
-0.3029553, -0.4180642, -1.784733, 0, 1, 0.2509804, 1,
-0.3029417, -1.937235, -1.990521, 0, 1, 0.254902, 1,
-0.3025509, 2.313198, -0.08538155, 0, 1, 0.2627451, 1,
-0.2979407, 0.4288465, -1.668474, 0, 1, 0.2666667, 1,
-0.2965463, -0.5350994, -1.626421, 0, 1, 0.2745098, 1,
-0.2960808, -0.8840778, -3.098781, 0, 1, 0.2784314, 1,
-0.2958229, 0.152123, -0.6119897, 0, 1, 0.2862745, 1,
-0.2956376, -0.6132333, -2.666511, 0, 1, 0.2901961, 1,
-0.293936, 1.229306, 0.5149954, 0, 1, 0.2980392, 1,
-0.2903087, -0.8260406, 0.1834323, 0, 1, 0.3058824, 1,
-0.2892402, -0.04509151, -3.376543, 0, 1, 0.3098039, 1,
-0.2885949, -0.6645017, -1.70482, 0, 1, 0.3176471, 1,
-0.2857187, -0.5517724, -2.538841, 0, 1, 0.3215686, 1,
-0.2819827, 0.9209177, -0.04775288, 0, 1, 0.3294118, 1,
-0.2808954, -0.03437636, -1.276984, 0, 1, 0.3333333, 1,
-0.2796403, 0.2148723, -0.7954282, 0, 1, 0.3411765, 1,
-0.2754273, -0.425259, -3.993313, 0, 1, 0.345098, 1,
-0.2725381, 1.892512, -0.4819391, 0, 1, 0.3529412, 1,
-0.2671728, 0.1035805, -3.066884, 0, 1, 0.3568628, 1,
-0.267004, -2.476015, -1.690086, 0, 1, 0.3647059, 1,
-0.2615609, -0.6319888, -3.602033, 0, 1, 0.3686275, 1,
-0.2579222, 1.18061, 0.07320827, 0, 1, 0.3764706, 1,
-0.2520037, -0.2419579, -3.023181, 0, 1, 0.3803922, 1,
-0.250352, -1.140163, -2.758074, 0, 1, 0.3882353, 1,
-0.2491514, 0.130967, -1.604627, 0, 1, 0.3921569, 1,
-0.2481896, 0.3307613, -0.6033485, 0, 1, 0.4, 1,
-0.2441772, 0.4983394, -0.1119501, 0, 1, 0.4078431, 1,
-0.2400695, -1.005101, -4.994263, 0, 1, 0.4117647, 1,
-0.2394534, 0.335629, -0.01257166, 0, 1, 0.4196078, 1,
-0.2387991, -0.2458864, -4.169096, 0, 1, 0.4235294, 1,
-0.2365783, -0.8946926, -1.95132, 0, 1, 0.4313726, 1,
-0.2353958, 0.8824759, 0.2748677, 0, 1, 0.4352941, 1,
-0.2353717, -1.460653, -3.963154, 0, 1, 0.4431373, 1,
-0.2307931, 0.7822098, 0.8297105, 0, 1, 0.4470588, 1,
-0.2279631, 0.8728964, -0.4827943, 0, 1, 0.454902, 1,
-0.2253282, -0.3104849, -2.39144, 0, 1, 0.4588235, 1,
-0.2247171, -0.449997, -3.158873, 0, 1, 0.4666667, 1,
-0.2235063, 1.309829, -0.9030441, 0, 1, 0.4705882, 1,
-0.2208615, 1.186565, 0.374204, 0, 1, 0.4784314, 1,
-0.2206123, -0.3349341, -3.005191, 0, 1, 0.4823529, 1,
-0.218983, -0.4249098, -2.572009, 0, 1, 0.4901961, 1,
-0.2158595, 0.3977421, -0.6430062, 0, 1, 0.4941176, 1,
-0.214619, 1.908739, 0.6703098, 0, 1, 0.5019608, 1,
-0.2145591, -0.6377676, -3.763609, 0, 1, 0.509804, 1,
-0.2070751, 1.533474, 0.05179185, 0, 1, 0.5137255, 1,
-0.2067456, 1.74935, 1.632228, 0, 1, 0.5215687, 1,
-0.2049447, 1.294341, 0.2885306, 0, 1, 0.5254902, 1,
-0.1996539, 0.8790959, 0.8965998, 0, 1, 0.5333334, 1,
-0.1918485, 0.6468291, 0.5027096, 0, 1, 0.5372549, 1,
-0.1886662, 1.226719, 0.3868858, 0, 1, 0.5450981, 1,
-0.183309, -0.2584481, -3.22261, 0, 1, 0.5490196, 1,
-0.1833065, 0.4615172, -0.522662, 0, 1, 0.5568628, 1,
-0.178477, 1.573531, -1.13588, 0, 1, 0.5607843, 1,
-0.1737928, 1.464788, 1.063283, 0, 1, 0.5686275, 1,
-0.1733423, -0.8532462, -3.745442, 0, 1, 0.572549, 1,
-0.1717902, 1.520484, 0.7322994, 0, 1, 0.5803922, 1,
-0.1707035, 0.06094075, -1.899276, 0, 1, 0.5843138, 1,
-0.167539, -0.9309493, -4.12607, 0, 1, 0.5921569, 1,
-0.1633981, -0.8768561, -4.082582, 0, 1, 0.5960785, 1,
-0.1587803, -0.5941274, -1.586221, 0, 1, 0.6039216, 1,
-0.1577998, -0.5004637, -3.017138, 0, 1, 0.6117647, 1,
-0.155551, 0.3035527, -1.197773, 0, 1, 0.6156863, 1,
-0.1540447, -0.4985988, -4.086335, 0, 1, 0.6235294, 1,
-0.1497887, 1.157276, 0.7715678, 0, 1, 0.627451, 1,
-0.1465572, 0.235764, -0.5930229, 0, 1, 0.6352941, 1,
-0.1416894, 0.5729206, 0.9373914, 0, 1, 0.6392157, 1,
-0.1403439, 0.04061382, -1.370629, 0, 1, 0.6470588, 1,
-0.1333278, -0.06031964, -0.3419216, 0, 1, 0.6509804, 1,
-0.1277181, 0.8916797, -0.6442775, 0, 1, 0.6588235, 1,
-0.1265561, 0.9924374, 0.4497358, 0, 1, 0.6627451, 1,
-0.1219368, 0.6186124, 0.2156504, 0, 1, 0.6705883, 1,
-0.1213549, -0.417022, -2.595388, 0, 1, 0.6745098, 1,
-0.1212594, -1.033372, -2.007879, 0, 1, 0.682353, 1,
-0.1202303, -0.8446015, -2.057547, 0, 1, 0.6862745, 1,
-0.1156128, -1.326203, -3.346255, 0, 1, 0.6941177, 1,
-0.1129614, 0.2712353, 2.074997, 0, 1, 0.7019608, 1,
-0.1123269, 0.5220079, -1.147354, 0, 1, 0.7058824, 1,
-0.099597, 0.2184167, 0.09028247, 0, 1, 0.7137255, 1,
-0.09928505, 2.817064, -1.935461, 0, 1, 0.7176471, 1,
-0.09920851, 0.8181004, -0.7056122, 0, 1, 0.7254902, 1,
-0.09794886, 2.062607, -2.88872, 0, 1, 0.7294118, 1,
-0.09300077, 0.6106389, -1.482882, 0, 1, 0.7372549, 1,
-0.09178136, 1.246664, -1.774329, 0, 1, 0.7411765, 1,
-0.08362816, 1.534321, -0.5097606, 0, 1, 0.7490196, 1,
-0.08301118, 1.051577, -0.01793686, 0, 1, 0.7529412, 1,
-0.08135781, -0.3890103, -2.148318, 0, 1, 0.7607843, 1,
-0.0812914, -0.4878995, -1.693557, 0, 1, 0.7647059, 1,
-0.08042856, 0.6421511, 2.069834, 0, 1, 0.772549, 1,
-0.07840144, 0.9914114, 0.8221781, 0, 1, 0.7764706, 1,
-0.0773864, -0.04962735, -2.778987, 0, 1, 0.7843137, 1,
-0.07399951, -1.695977, -4.545457, 0, 1, 0.7882353, 1,
-0.07333885, -0.9922032, -2.719342, 0, 1, 0.7960784, 1,
-0.07239167, 0.6061581, -1.090525, 0, 1, 0.8039216, 1,
-0.07051234, -0.4465573, -4.134066, 0, 1, 0.8078431, 1,
-0.0693524, 0.9145979, -1.786454, 0, 1, 0.8156863, 1,
-0.06763764, 1.155938, -0.206695, 0, 1, 0.8196079, 1,
-0.06759677, 0.3377094, 2.163859, 0, 1, 0.827451, 1,
-0.06670639, 1.730908, -0.6325271, 0, 1, 0.8313726, 1,
-0.06203055, 0.09978651, 0.1500098, 0, 1, 0.8392157, 1,
-0.06002575, 0.380811, 0.8281801, 0, 1, 0.8431373, 1,
-0.05684656, -0.1091677, -2.527244, 0, 1, 0.8509804, 1,
-0.05680835, 0.7650286, 0.7313248, 0, 1, 0.854902, 1,
-0.05625329, 0.9595432, -0.9073893, 0, 1, 0.8627451, 1,
-0.05191743, 0.9633459, -1.316281, 0, 1, 0.8666667, 1,
-0.05132956, 0.8684219, -0.4114437, 0, 1, 0.8745098, 1,
-0.05131518, 0.1497936, -0.02419339, 0, 1, 0.8784314, 1,
-0.05078737, -1.431538, -2.62736, 0, 1, 0.8862745, 1,
-0.05006357, 0.004979023, -0.478718, 0, 1, 0.8901961, 1,
-0.04271183, 0.7433579, -0.01356082, 0, 1, 0.8980392, 1,
-0.04093989, -1.440168, -3.98544, 0, 1, 0.9058824, 1,
-0.03509505, -0.9394478, -2.706037, 0, 1, 0.9098039, 1,
-0.02892229, -0.1890227, -2.112497, 0, 1, 0.9176471, 1,
-0.02724616, 0.03666704, -0.6710056, 0, 1, 0.9215686, 1,
-0.02699079, -1.133308, -3.727885, 0, 1, 0.9294118, 1,
-0.02197682, 0.9961817, -0.9424519, 0, 1, 0.9333333, 1,
-0.01582065, -0.2422402, -3.810217, 0, 1, 0.9411765, 1,
-0.01514753, -1.783338, -4.085447, 0, 1, 0.945098, 1,
-0.01506763, -0.1779438, -4.10645, 0, 1, 0.9529412, 1,
-0.01352228, -0.8789743, -2.033631, 0, 1, 0.9568627, 1,
-0.01037792, 0.05226267, 0.100891, 0, 1, 0.9647059, 1,
-0.009688344, 1.343872, -0.282968, 0, 1, 0.9686275, 1,
-0.009168126, 1.634937, -2.419041, 0, 1, 0.9764706, 1,
-0.0008948612, -0.6723608, -3.3409, 0, 1, 0.9803922, 1,
-0.0002602979, -0.0187065, -3.940763, 0, 1, 0.9882353, 1,
0.00350552, 1.326154, -0.6045566, 0, 1, 0.9921569, 1,
0.004081832, -2.285041, 2.725416, 0, 1, 1, 1,
0.007645631, 2.152678, 0.3068702, 0, 0.9921569, 1, 1,
0.008417338, -2.420667, 2.268479, 0, 0.9882353, 1, 1,
0.009633691, 0.5612534, 0.7703801, 0, 0.9803922, 1, 1,
0.00988869, 0.6081072, 0.5475428, 0, 0.9764706, 1, 1,
0.01100668, 0.6144618, 0.2034022, 0, 0.9686275, 1, 1,
0.01175248, -0.2838999, 2.499736, 0, 0.9647059, 1, 1,
0.01266509, 0.8907482, -1.66943, 0, 0.9568627, 1, 1,
0.01360099, 0.1509007, -1.572546, 0, 0.9529412, 1, 1,
0.01405532, 0.895152, -0.8122303, 0, 0.945098, 1, 1,
0.01565201, 0.5261984, 0.569097, 0, 0.9411765, 1, 1,
0.02100488, 1.093825, -0.000703692, 0, 0.9333333, 1, 1,
0.02201317, 0.7270814, -0.8535892, 0, 0.9294118, 1, 1,
0.02396203, 0.4860671, -0.206731, 0, 0.9215686, 1, 1,
0.02723447, -0.4271587, 3.592514, 0, 0.9176471, 1, 1,
0.02917307, 0.508772, -2.008839, 0, 0.9098039, 1, 1,
0.03028719, 0.9155736, 0.5261794, 0, 0.9058824, 1, 1,
0.03078892, 1.784199, 0.8195105, 0, 0.8980392, 1, 1,
0.03572536, -0.4349106, 3.035773, 0, 0.8901961, 1, 1,
0.03655404, 2.569076, -0.4146584, 0, 0.8862745, 1, 1,
0.03789404, -0.3706657, 1.282411, 0, 0.8784314, 1, 1,
0.03911498, -0.4514969, 1.587393, 0, 0.8745098, 1, 1,
0.03996076, -1.822089, 2.464748, 0, 0.8666667, 1, 1,
0.04083502, 0.889926, -0.3015454, 0, 0.8627451, 1, 1,
0.04920451, -0.1517309, 2.520734, 0, 0.854902, 1, 1,
0.05029149, 0.4969015, -0.3850124, 0, 0.8509804, 1, 1,
0.05084493, -0.08507749, 1.923372, 0, 0.8431373, 1, 1,
0.05551295, -0.005502685, 1.576036, 0, 0.8392157, 1, 1,
0.0571614, -0.9099182, 2.601951, 0, 0.8313726, 1, 1,
0.05729307, -1.765337, 4.100631, 0, 0.827451, 1, 1,
0.05943843, -0.2512251, 3.061054, 0, 0.8196079, 1, 1,
0.05973348, 0.4693398, 0.7127895, 0, 0.8156863, 1, 1,
0.06235527, 0.9905192, 0.9257237, 0, 0.8078431, 1, 1,
0.0739185, 0.2678379, 0.1824168, 0, 0.8039216, 1, 1,
0.07724703, -1.030254, 2.926624, 0, 0.7960784, 1, 1,
0.07936456, 0.6062867, -0.531945, 0, 0.7882353, 1, 1,
0.08232045, 1.201201, 0.0381602, 0, 0.7843137, 1, 1,
0.08631384, -0.02727188, 0.6141348, 0, 0.7764706, 1, 1,
0.08850438, -0.3629194, 2.846083, 0, 0.772549, 1, 1,
0.09332328, -0.1225351, 1.747219, 0, 0.7647059, 1, 1,
0.09582512, 0.3202104, -0.9822909, 0, 0.7607843, 1, 1,
0.09923156, -0.2879956, 1.892537, 0, 0.7529412, 1, 1,
0.1041519, -1.488798, 1.891219, 0, 0.7490196, 1, 1,
0.1070257, -1.161585, 2.772005, 0, 0.7411765, 1, 1,
0.1073717, -1.386772, 3.364835, 0, 0.7372549, 1, 1,
0.1090148, -0.3693968, 1.940633, 0, 0.7294118, 1, 1,
0.1128281, 1.238667, 0.1807139, 0, 0.7254902, 1, 1,
0.115501, 2.95363, -0.879248, 0, 0.7176471, 1, 1,
0.1180648, -0.1633905, 1.98118, 0, 0.7137255, 1, 1,
0.1186174, -0.9032047, 2.999316, 0, 0.7058824, 1, 1,
0.1217892, -1.506576, 4.167103, 0, 0.6980392, 1, 1,
0.1219418, 0.2535123, 1.637613, 0, 0.6941177, 1, 1,
0.1225035, 0.9335101, -1.50498, 0, 0.6862745, 1, 1,
0.1231304, 0.2048994, -0.4686329, 0, 0.682353, 1, 1,
0.1270647, -0.8223354, 2.799714, 0, 0.6745098, 1, 1,
0.1276295, 0.4012937, -0.4486933, 0, 0.6705883, 1, 1,
0.1301854, 0.5301553, 3.198324, 0, 0.6627451, 1, 1,
0.1323389, 0.8523531, 0.2355269, 0, 0.6588235, 1, 1,
0.1384564, 0.3029193, 0.3278255, 0, 0.6509804, 1, 1,
0.1433529, -0.9055567, 3.277194, 0, 0.6470588, 1, 1,
0.144327, -0.3022162, 2.294136, 0, 0.6392157, 1, 1,
0.1486335, 0.5414762, -0.2068435, 0, 0.6352941, 1, 1,
0.1491263, -0.4276531, 3.510717, 0, 0.627451, 1, 1,
0.1504968, 1.093292, 0.4678661, 0, 0.6235294, 1, 1,
0.1565144, -1.437566, 3.825592, 0, 0.6156863, 1, 1,
0.1601887, 0.04795307, 2.52422, 0, 0.6117647, 1, 1,
0.1604927, 0.8067175, 0.7143888, 0, 0.6039216, 1, 1,
0.160832, -0.6507967, 2.230616, 0, 0.5960785, 1, 1,
0.1609041, -1.222193, 1.990364, 0, 0.5921569, 1, 1,
0.1640449, 0.3058913, 1.109702, 0, 0.5843138, 1, 1,
0.1642229, 0.6420757, -0.4975219, 0, 0.5803922, 1, 1,
0.1678449, -1.512419, 2.166486, 0, 0.572549, 1, 1,
0.1694796, -2.134184, 3.772876, 0, 0.5686275, 1, 1,
0.1738817, -3.44226, 1.771808, 0, 0.5607843, 1, 1,
0.1782414, -2.583244, 3.883838, 0, 0.5568628, 1, 1,
0.1868353, -2.264645, 4.544547, 0, 0.5490196, 1, 1,
0.1869925, 1.469604, -0.4144422, 0, 0.5450981, 1, 1,
0.1973638, -0.7155454, 0.8922389, 0, 0.5372549, 1, 1,
0.197536, -1.787559, 3.506663, 0, 0.5333334, 1, 1,
0.1978007, -0.8433434, 4.244244, 0, 0.5254902, 1, 1,
0.200733, -0.2529358, 1.58797, 0, 0.5215687, 1, 1,
0.203338, 0.2059601, 0.1372759, 0, 0.5137255, 1, 1,
0.2035488, -1.648144, 3.273173, 0, 0.509804, 1, 1,
0.2066187, -1.515849, 4.347352, 0, 0.5019608, 1, 1,
0.2076523, 0.30551, -0.640814, 0, 0.4941176, 1, 1,
0.2132344, 0.4562561, -0.5841432, 0, 0.4901961, 1, 1,
0.2179714, 1.800249, 0.1140499, 0, 0.4823529, 1, 1,
0.2180661, 1.635172, 0.4218908, 0, 0.4784314, 1, 1,
0.2201001, 2.171372, 0.7153832, 0, 0.4705882, 1, 1,
0.2215052, -0.6858056, 3.376791, 0, 0.4666667, 1, 1,
0.2275046, 0.7340922, -2.046719, 0, 0.4588235, 1, 1,
0.229274, -1.467846, 3.775831, 0, 0.454902, 1, 1,
0.2301003, 0.3659812, 0.6265512, 0, 0.4470588, 1, 1,
0.2320021, -0.03235942, 2.135414, 0, 0.4431373, 1, 1,
0.233064, -0.234685, 2.616785, 0, 0.4352941, 1, 1,
0.233154, -0.5828437, 2.087902, 0, 0.4313726, 1, 1,
0.2370444, 0.04308962, 0.4379026, 0, 0.4235294, 1, 1,
0.2388355, -0.1663945, 2.401506, 0, 0.4196078, 1, 1,
0.2399836, 0.8041019, 2.081908, 0, 0.4117647, 1, 1,
0.2414266, 0.8213318, 0.4100099, 0, 0.4078431, 1, 1,
0.2473316, 1.161084, -0.03179275, 0, 0.4, 1, 1,
0.2483136, 0.3307418, 0.7314222, 0, 0.3921569, 1, 1,
0.257867, 0.04178105, 0.53013, 0, 0.3882353, 1, 1,
0.2590231, -0.9124658, 1.585128, 0, 0.3803922, 1, 1,
0.2601057, 0.977062, -0.498921, 0, 0.3764706, 1, 1,
0.2635835, -1.378174, 1.356156, 0, 0.3686275, 1, 1,
0.2649599, -1.023275, 3.030324, 0, 0.3647059, 1, 1,
0.2673069, 0.4688397, 0.8096926, 0, 0.3568628, 1, 1,
0.2683336, -0.9903382, 2.058969, 0, 0.3529412, 1, 1,
0.2711044, 0.3691193, 0.7547847, 0, 0.345098, 1, 1,
0.272215, -0.1750152, 2.117592, 0, 0.3411765, 1, 1,
0.2731671, 1.466399, 0.2065572, 0, 0.3333333, 1, 1,
0.2739818, -0.4276839, 1.358761, 0, 0.3294118, 1, 1,
0.2745455, 0.2511981, -0.5519483, 0, 0.3215686, 1, 1,
0.2796093, -0.941842, 3.64269, 0, 0.3176471, 1, 1,
0.2818755, -1.699342, 3.04044, 0, 0.3098039, 1, 1,
0.2825069, 1.007525, 1.131961, 0, 0.3058824, 1, 1,
0.2839951, -1.175244, 3.893629, 0, 0.2980392, 1, 1,
0.2858953, -0.38883, 2.142171, 0, 0.2901961, 1, 1,
0.2864016, -1.102756, 1.915533, 0, 0.2862745, 1, 1,
0.2864392, 1.454693, 1.014284, 0, 0.2784314, 1, 1,
0.2878856, -0.9189678, 2.667579, 0, 0.2745098, 1, 1,
0.2901634, -0.5938247, 1.052001, 0, 0.2666667, 1, 1,
0.2914814, 2.165816, -0.6670062, 0, 0.2627451, 1, 1,
0.2941198, 0.6341543, -0.6536108, 0, 0.254902, 1, 1,
0.2956447, -0.3083001, 2.733761, 0, 0.2509804, 1, 1,
0.2975618, -1.48754, 1.016472, 0, 0.2431373, 1, 1,
0.2979744, -0.3231221, 1.473959, 0, 0.2392157, 1, 1,
0.2988083, -2.619715, 4.257351, 0, 0.2313726, 1, 1,
0.3054004, 1.792619, 3.939501, 0, 0.227451, 1, 1,
0.3089836, 0.8009285, -1.069403, 0, 0.2196078, 1, 1,
0.3111401, -2.160615, 3.214777, 0, 0.2156863, 1, 1,
0.312504, 0.3870494, -1.109004, 0, 0.2078431, 1, 1,
0.3172396, 0.2104108, 3.284546, 0, 0.2039216, 1, 1,
0.3203158, -0.6331977, 1.662854, 0, 0.1960784, 1, 1,
0.3229508, -1.270947, 0.1736477, 0, 0.1882353, 1, 1,
0.3234875, 0.8897219, 0.0185322, 0, 0.1843137, 1, 1,
0.3266611, -0.6341971, 2.222615, 0, 0.1764706, 1, 1,
0.3280213, 0.4812431, -0.6865326, 0, 0.172549, 1, 1,
0.3313338, -1.468101, 3.296096, 0, 0.1647059, 1, 1,
0.3360232, 0.2569872, 0.4194359, 0, 0.1607843, 1, 1,
0.3375582, 0.0548841, 0.5306802, 0, 0.1529412, 1, 1,
0.3388655, -0.7739871, 3.364973, 0, 0.1490196, 1, 1,
0.3428327, 0.7952352, 1.208594, 0, 0.1411765, 1, 1,
0.3442163, 0.3474406, 1.401471, 0, 0.1372549, 1, 1,
0.3460295, 2.118679, 0.04041252, 0, 0.1294118, 1, 1,
0.3460589, 1.312849, 0.2725003, 0, 0.1254902, 1, 1,
0.3492544, -0.6427656, 2.530699, 0, 0.1176471, 1, 1,
0.3541932, 0.6689846, -0.04824246, 0, 0.1137255, 1, 1,
0.3607073, 0.8955989, 1.079566, 0, 0.1058824, 1, 1,
0.3610217, -0.6219919, 3.13433, 0, 0.09803922, 1, 1,
0.3631336, 0.2690454, 0.9587807, 0, 0.09411765, 1, 1,
0.3633947, -1.718872, 2.849898, 0, 0.08627451, 1, 1,
0.3650444, 0.03945866, 2.927983, 0, 0.08235294, 1, 1,
0.3720258, -0.6281466, 3.003636, 0, 0.07450981, 1, 1,
0.3754997, -0.6397408, 3.606736, 0, 0.07058824, 1, 1,
0.3817536, 0.8142719, 0.699477, 0, 0.0627451, 1, 1,
0.3824421, -0.1968906, 2.434117, 0, 0.05882353, 1, 1,
0.3826206, 0.01151928, 1.616444, 0, 0.05098039, 1, 1,
0.3881437, 0.06838945, 1.265783, 0, 0.04705882, 1, 1,
0.3904248, 0.8566182, 0.3611607, 0, 0.03921569, 1, 1,
0.3911019, -0.8894122, 2.55812, 0, 0.03529412, 1, 1,
0.3963344, 1.344842, 1.585337, 0, 0.02745098, 1, 1,
0.3974302, 1.77412, -1.79844, 0, 0.02352941, 1, 1,
0.4033314, -1.156312, 3.444626, 0, 0.01568628, 1, 1,
0.4099842, -0.4041966, 3.284227, 0, 0.01176471, 1, 1,
0.4113289, -0.1850746, 3.082332, 0, 0.003921569, 1, 1,
0.4145154, -0.7865003, 4.354565, 0.003921569, 0, 1, 1,
0.4162689, -1.412976, 2.772833, 0.007843138, 0, 1, 1,
0.4200864, 0.9153107, 1.00783, 0.01568628, 0, 1, 1,
0.4203998, 1.406839, 0.3689407, 0.01960784, 0, 1, 1,
0.4205658, 1.020718, -0.415454, 0.02745098, 0, 1, 1,
0.4206431, 0.3261299, 2.263962, 0.03137255, 0, 1, 1,
0.4206732, 0.2802811, 1.267156, 0.03921569, 0, 1, 1,
0.4230851, 0.2941293, 0.7873429, 0.04313726, 0, 1, 1,
0.4265018, 0.5562673, -0.7209029, 0.05098039, 0, 1, 1,
0.4333836, -0.05774043, 1.284578, 0.05490196, 0, 1, 1,
0.4367178, -0.6492655, 2.031442, 0.0627451, 0, 1, 1,
0.4378041, -0.4378936, 1.995087, 0.06666667, 0, 1, 1,
0.4435355, -0.4475295, 3.461519, 0.07450981, 0, 1, 1,
0.4502126, 0.5758025, 0.8117264, 0.07843138, 0, 1, 1,
0.4513956, -0.6231526, 0.101941, 0.08627451, 0, 1, 1,
0.4515624, 1.665707, -0.8103666, 0.09019608, 0, 1, 1,
0.4538005, 1.668522, 0.05292624, 0.09803922, 0, 1, 1,
0.4549502, 1.532774, -0.4482146, 0.1058824, 0, 1, 1,
0.4553474, 0.1619487, 1.362011, 0.1098039, 0, 1, 1,
0.4559375, 0.4037783, 1.002166, 0.1176471, 0, 1, 1,
0.4566206, -0.7546231, 3.00986, 0.1215686, 0, 1, 1,
0.4600004, -0.006438651, 3.546381, 0.1294118, 0, 1, 1,
0.4612037, -1.128809, 2.212753, 0.1333333, 0, 1, 1,
0.4620551, -0.1742395, 0.09298371, 0.1411765, 0, 1, 1,
0.4621108, 0.1403795, 1.929856, 0.145098, 0, 1, 1,
0.4631424, -1.751053, 2.820574, 0.1529412, 0, 1, 1,
0.4677135, -0.6814403, 2.093175, 0.1568628, 0, 1, 1,
0.4702081, 0.385461, -0.4974667, 0.1647059, 0, 1, 1,
0.4759315, -0.5112026, 1.648577, 0.1686275, 0, 1, 1,
0.4768095, 1.02054, -0.5175793, 0.1764706, 0, 1, 1,
0.4769712, 1.076039, 0.9803782, 0.1803922, 0, 1, 1,
0.4813628, 1.781212, 0.4956695, 0.1882353, 0, 1, 1,
0.4836873, 0.3099016, 2.00127, 0.1921569, 0, 1, 1,
0.4847915, 2.255038, -0.3981543, 0.2, 0, 1, 1,
0.4887598, 0.7721419, 0.7666011, 0.2078431, 0, 1, 1,
0.4915238, 1.230028, 0.8427587, 0.2117647, 0, 1, 1,
0.4938423, 0.212325, 1.814204, 0.2196078, 0, 1, 1,
0.495754, -0.6929932, 2.80152, 0.2235294, 0, 1, 1,
0.4959447, -0.1641949, 2.396239, 0.2313726, 0, 1, 1,
0.498854, 1.963009, -2.215076, 0.2352941, 0, 1, 1,
0.5031945, 1.271434, 1.650811, 0.2431373, 0, 1, 1,
0.5046244, -1.482559, 2.128147, 0.2470588, 0, 1, 1,
0.5057724, 0.7686773, 2.038527, 0.254902, 0, 1, 1,
0.5058688, 1.180713, 0.4012871, 0.2588235, 0, 1, 1,
0.5090744, -1.173015, 2.770913, 0.2666667, 0, 1, 1,
0.5097572, -0.3484128, 2.62751, 0.2705882, 0, 1, 1,
0.5098076, -0.5090065, 1.338233, 0.2784314, 0, 1, 1,
0.5120491, 1.427208, -0.01083791, 0.282353, 0, 1, 1,
0.5212553, -0.0832722, -0.09595921, 0.2901961, 0, 1, 1,
0.5239908, 0.04776569, 3.195498, 0.2941177, 0, 1, 1,
0.5261804, -0.2775012, 3.398227, 0.3019608, 0, 1, 1,
0.5297241, -2.016668, 2.873453, 0.3098039, 0, 1, 1,
0.5298915, -1.369828, 2.535944, 0.3137255, 0, 1, 1,
0.532381, 1.92227, 0.3287993, 0.3215686, 0, 1, 1,
0.5325893, 0.5785193, 0.4478837, 0.3254902, 0, 1, 1,
0.5333257, -1.352598, 1.466802, 0.3333333, 0, 1, 1,
0.5374302, -0.3266648, 1.206805, 0.3372549, 0, 1, 1,
0.5390362, -0.5943661, 1.915634, 0.345098, 0, 1, 1,
0.5398942, 1.067371, 2.108588, 0.3490196, 0, 1, 1,
0.5462904, 0.7372589, 1.019213, 0.3568628, 0, 1, 1,
0.5468099, 0.4937214, 3.455304, 0.3607843, 0, 1, 1,
0.5526912, 0.05875039, 1.50834, 0.3686275, 0, 1, 1,
0.5528643, -1.750078, 3.224588, 0.372549, 0, 1, 1,
0.5544829, -0.3208145, -0.1316897, 0.3803922, 0, 1, 1,
0.5568896, 0.01601221, 0.9767025, 0.3843137, 0, 1, 1,
0.5654727, -0.9875981, 3.118367, 0.3921569, 0, 1, 1,
0.5661144, 2.078347, 1.276454, 0.3960784, 0, 1, 1,
0.5704826, -0.7622448, 3.31033, 0.4039216, 0, 1, 1,
0.5724123, -0.2047482, 2.599355, 0.4117647, 0, 1, 1,
0.575249, 0.3086251, 1.624243, 0.4156863, 0, 1, 1,
0.5757999, 0.6734543, 2.043236, 0.4235294, 0, 1, 1,
0.5875236, 3.170987, -0.5654411, 0.427451, 0, 1, 1,
0.597863, -0.5835887, 3.190768, 0.4352941, 0, 1, 1,
0.6020913, -1.835051, -0.08672652, 0.4392157, 0, 1, 1,
0.6042636, -1.658064, 2.901762, 0.4470588, 0, 1, 1,
0.6045564, -0.2589396, 1.385031, 0.4509804, 0, 1, 1,
0.6063067, -0.9016851, 2.201288, 0.4588235, 0, 1, 1,
0.6130811, 0.7950982, 1.210927, 0.4627451, 0, 1, 1,
0.6141612, 0.3567311, 0.4722322, 0.4705882, 0, 1, 1,
0.624956, 0.8856687, 0.6569104, 0.4745098, 0, 1, 1,
0.6261556, -0.2815617, 0.443628, 0.4823529, 0, 1, 1,
0.6293008, -0.4797996, 1.201588, 0.4862745, 0, 1, 1,
0.6334464, 1.137328, -0.1486921, 0.4941176, 0, 1, 1,
0.633448, 0.5355155, 2.113723, 0.5019608, 0, 1, 1,
0.6348717, 0.2125328, 0.8858234, 0.5058824, 0, 1, 1,
0.6362695, -0.271569, 2.918238, 0.5137255, 0, 1, 1,
0.6364062, 0.4359983, -0.0730467, 0.5176471, 0, 1, 1,
0.6396276, -0.7897469, 3.845841, 0.5254902, 0, 1, 1,
0.6407147, -0.6560192, 2.750145, 0.5294118, 0, 1, 1,
0.6500592, 0.08020201, 1.280139, 0.5372549, 0, 1, 1,
0.6529043, 0.4177217, 0.8959627, 0.5411765, 0, 1, 1,
0.6568381, 0.912434, 1.475685, 0.5490196, 0, 1, 1,
0.6577744, -0.8474933, 2.524781, 0.5529412, 0, 1, 1,
0.6591994, -1.212533, 2.118136, 0.5607843, 0, 1, 1,
0.6598731, -1.493852, 3.944385, 0.5647059, 0, 1, 1,
0.6620126, 0.1849393, 2.207565, 0.572549, 0, 1, 1,
0.66747, 0.7522771, 0.5090591, 0.5764706, 0, 1, 1,
0.6685667, -0.8637794, 3.766985, 0.5843138, 0, 1, 1,
0.6760903, -0.6531152, 2.175605, 0.5882353, 0, 1, 1,
0.6795065, -1.060636, 2.181649, 0.5960785, 0, 1, 1,
0.6850359, 0.1868359, 0.3273366, 0.6039216, 0, 1, 1,
0.6856295, 1.465243, 0.3678119, 0.6078432, 0, 1, 1,
0.6885842, 0.9711296, 0.5330706, 0.6156863, 0, 1, 1,
0.6916919, -1.184113, 3.263227, 0.6196079, 0, 1, 1,
0.69701, -0.03324595, 1.340791, 0.627451, 0, 1, 1,
0.7025565, 0.9041004, 0.5072185, 0.6313726, 0, 1, 1,
0.7051574, 0.3258376, 0.7003365, 0.6392157, 0, 1, 1,
0.7066939, 2.298259, 1.046585, 0.6431373, 0, 1, 1,
0.7099779, 1.91591, -0.4793115, 0.6509804, 0, 1, 1,
0.7102259, -0.602598, 2.175266, 0.654902, 0, 1, 1,
0.7102679, 1.367656, 1.508482, 0.6627451, 0, 1, 1,
0.7136588, -1.936176, 2.640767, 0.6666667, 0, 1, 1,
0.7167207, -1.835519, 2.236927, 0.6745098, 0, 1, 1,
0.7171057, 0.241624, 0.8383726, 0.6784314, 0, 1, 1,
0.7174245, -0.7732545, 2.722774, 0.6862745, 0, 1, 1,
0.7205025, 0.833984, 1.11412, 0.6901961, 0, 1, 1,
0.7213652, -0.6919798, 2.554624, 0.6980392, 0, 1, 1,
0.7302811, -1.310215, 2.304665, 0.7058824, 0, 1, 1,
0.7347276, 1.705918, -1.533842, 0.7098039, 0, 1, 1,
0.7359837, 0.5617727, -0.6191418, 0.7176471, 0, 1, 1,
0.7369226, 0.7439845, 1.467179, 0.7215686, 0, 1, 1,
0.738619, -0.05789137, 1.758534, 0.7294118, 0, 1, 1,
0.7398854, 0.4368761, 0.435869, 0.7333333, 0, 1, 1,
0.7416671, -0.907584, 5.048771, 0.7411765, 0, 1, 1,
0.7417817, 0.3087909, 0.7216434, 0.7450981, 0, 1, 1,
0.7442588, -1.86257, 1.67442, 0.7529412, 0, 1, 1,
0.7593607, 0.7329026, 1.419652, 0.7568628, 0, 1, 1,
0.7602456, -1.65334, 0.8503634, 0.7647059, 0, 1, 1,
0.7607616, -1.733926, 2.736576, 0.7686275, 0, 1, 1,
0.770473, 0.1739508, 3.027697, 0.7764706, 0, 1, 1,
0.7720685, 0.6459542, -0.5964423, 0.7803922, 0, 1, 1,
0.7732599, 1.289489, 0.303311, 0.7882353, 0, 1, 1,
0.7740318, -0.3848242, 5.062504, 0.7921569, 0, 1, 1,
0.7744401, 0.9403275, -0.001721368, 0.8, 0, 1, 1,
0.7750424, -0.460301, 2.173952, 0.8078431, 0, 1, 1,
0.7825613, -0.8542349, 2.743427, 0.8117647, 0, 1, 1,
0.7839654, -0.6753837, 1.768948, 0.8196079, 0, 1, 1,
0.7842986, 0.3715194, 1.748215, 0.8235294, 0, 1, 1,
0.7862443, -0.5017926, 2.428202, 0.8313726, 0, 1, 1,
0.7948137, 2.02985, 0.3312728, 0.8352941, 0, 1, 1,
0.7967236, -1.264459, 3.726563, 0.8431373, 0, 1, 1,
0.8037744, 0.9979028, 0.5753562, 0.8470588, 0, 1, 1,
0.8046852, 1.06824, -0.3197027, 0.854902, 0, 1, 1,
0.8063553, -0.8120153, 1.388153, 0.8588235, 0, 1, 1,
0.8112507, -0.3675533, 0.7036768, 0.8666667, 0, 1, 1,
0.8141798, 1.655188, 2.878361, 0.8705882, 0, 1, 1,
0.8191172, 0.8226577, 3.024523, 0.8784314, 0, 1, 1,
0.8251067, 0.7443339, -0.1137286, 0.8823529, 0, 1, 1,
0.8382226, -2.06689, 2.503713, 0.8901961, 0, 1, 1,
0.8409107, -0.7806009, 0.8440372, 0.8941177, 0, 1, 1,
0.8442402, 0.2204864, 1.090325, 0.9019608, 0, 1, 1,
0.8470414, -0.9814391, 2.746183, 0.9098039, 0, 1, 1,
0.8526406, 0.8602874, -0.8298149, 0.9137255, 0, 1, 1,
0.8598351, -1.320721, 2.717156, 0.9215686, 0, 1, 1,
0.8627844, -0.00688562, 4.252356, 0.9254902, 0, 1, 1,
0.8629906, -0.2669531, 1.506546, 0.9333333, 0, 1, 1,
0.8631794, 0.5251493, 1.793086, 0.9372549, 0, 1, 1,
0.8718657, 0.2353738, 1.461275, 0.945098, 0, 1, 1,
0.8734542, 0.8412302, -1.49477, 0.9490196, 0, 1, 1,
0.8773557, 1.785701, 1.135558, 0.9568627, 0, 1, 1,
0.8889402, 0.8218216, -0.8572475, 0.9607843, 0, 1, 1,
0.8958299, -2.608862, 1.449366, 0.9686275, 0, 1, 1,
0.9033255, 0.8778954, 0.1938477, 0.972549, 0, 1, 1,
0.9155774, 0.950705, 1.228854, 0.9803922, 0, 1, 1,
0.9166428, 0.6650571, 0.3982153, 0.9843137, 0, 1, 1,
0.9236769, 0.1155274, 1.771159, 0.9921569, 0, 1, 1,
0.9239794, -0.3631627, 1.260995, 0.9960784, 0, 1, 1,
0.9258021, 0.7624214, 0.4219027, 1, 0, 0.9960784, 1,
0.9322065, 0.3164663, 1.068901, 1, 0, 0.9882353, 1,
0.9353449, -1.541872, 0.2603922, 1, 0, 0.9843137, 1,
0.9476367, 0.7038549, 2.028445, 1, 0, 0.9764706, 1,
0.9482201, -0.21493, 0.6963207, 1, 0, 0.972549, 1,
0.9583583, 1.115142, 1.815563, 1, 0, 0.9647059, 1,
0.9714497, 0.07954384, 2.064316, 1, 0, 0.9607843, 1,
0.9737777, -0.01522704, 1.744329, 1, 0, 0.9529412, 1,
0.9739501, 0.187406, 1.687557, 1, 0, 0.9490196, 1,
0.9797723, -0.6537352, 2.363852, 1, 0, 0.9411765, 1,
0.9867239, -0.3825294, 1.270876, 1, 0, 0.9372549, 1,
0.9873376, -0.1834564, 3.3013, 1, 0, 0.9294118, 1,
0.9909804, 1.301719, -0.01151636, 1, 0, 0.9254902, 1,
0.9976773, -0.1027093, 2.374519, 1, 0, 0.9176471, 1,
0.9984328, -1.434446, 3.592573, 1, 0, 0.9137255, 1,
1.001351, 1.044558, 2.701521, 1, 0, 0.9058824, 1,
1.00508, 0.5309733, 2.813487, 1, 0, 0.9019608, 1,
1.005615, 0.9322525, 1.068999, 1, 0, 0.8941177, 1,
1.009678, 0.5695887, 0.6203158, 1, 0, 0.8862745, 1,
1.012559, -0.8062652, 0.9945737, 1, 0, 0.8823529, 1,
1.016336, 1.277044, 0.1530338, 1, 0, 0.8745098, 1,
1.016542, 0.1861518, 1.142887, 1, 0, 0.8705882, 1,
1.018639, -0.5629627, 2.352584, 1, 0, 0.8627451, 1,
1.018958, 1.497586, 0.02577033, 1, 0, 0.8588235, 1,
1.021953, 0.01233263, 1.338014, 1, 0, 0.8509804, 1,
1.042181, 0.2685855, 0.2412125, 1, 0, 0.8470588, 1,
1.043569, 2.101113, 1.1566, 1, 0, 0.8392157, 1,
1.046456, -0.945123, 2.698874, 1, 0, 0.8352941, 1,
1.051316, -2.861719, 1.547213, 1, 0, 0.827451, 1,
1.055196, 0.6989247, -2.176504, 1, 0, 0.8235294, 1,
1.057258, -0.9633889, 2.818514, 1, 0, 0.8156863, 1,
1.067066, -0.7212321, 1.378924, 1, 0, 0.8117647, 1,
1.07401, -0.07334672, 1.784632, 1, 0, 0.8039216, 1,
1.080201, 1.04646, -0.3178502, 1, 0, 0.7960784, 1,
1.084701, -0.5815406, 1.952524, 1, 0, 0.7921569, 1,
1.08522, 0.9148219, 0.3472415, 1, 0, 0.7843137, 1,
1.086176, 0.9586979, 2.216557, 1, 0, 0.7803922, 1,
1.086295, -0.5134904, 3.037378, 1, 0, 0.772549, 1,
1.094361, -0.6673307, 1.533454, 1, 0, 0.7686275, 1,
1.095785, -0.9056832, 2.396892, 1, 0, 0.7607843, 1,
1.101853, 0.08478268, 0.5457315, 1, 0, 0.7568628, 1,
1.108628, 0.4199245, 1.183661, 1, 0, 0.7490196, 1,
1.111328, -1.290583, 2.291214, 1, 0, 0.7450981, 1,
1.112002, 0.5431639, -0.357923, 1, 0, 0.7372549, 1,
1.112586, -0.3792626, 3.181901, 1, 0, 0.7333333, 1,
1.114734, 1.158375, 0.04090915, 1, 0, 0.7254902, 1,
1.1218, -1.45547, 4.399315, 1, 0, 0.7215686, 1,
1.139611, 1.540479, 1.485271, 1, 0, 0.7137255, 1,
1.140442, -0.1787291, 0.7263564, 1, 0, 0.7098039, 1,
1.149497, -1.467977, 3.811781, 1, 0, 0.7019608, 1,
1.161977, 0.4692783, 0.569732, 1, 0, 0.6941177, 1,
1.166186, -1.508184, 2.484896, 1, 0, 0.6901961, 1,
1.171205, -0.1015646, 0.7900534, 1, 0, 0.682353, 1,
1.172009, 2.786553, 1.867079, 1, 0, 0.6784314, 1,
1.18403, -0.3174618, -0.4088332, 1, 0, 0.6705883, 1,
1.205037, 0.1838179, 0.8349233, 1, 0, 0.6666667, 1,
1.20754, 0.6827138, 1.558692, 1, 0, 0.6588235, 1,
1.218229, 0.5935261, 0.3915031, 1, 0, 0.654902, 1,
1.224219, 1.100186, 1.072989, 1, 0, 0.6470588, 1,
1.226835, 1.140148, 0.6047639, 1, 0, 0.6431373, 1,
1.227244, -0.6400112, 1.741647, 1, 0, 0.6352941, 1,
1.229824, -0.9097211, 2.953949, 1, 0, 0.6313726, 1,
1.232652, -0.2497829, 1.448615, 1, 0, 0.6235294, 1,
1.240545, 1.169076, 2.519351, 1, 0, 0.6196079, 1,
1.249354, 1.615495, -0.2193077, 1, 0, 0.6117647, 1,
1.254219, -0.2305743, 1.000131, 1, 0, 0.6078432, 1,
1.254755, -1.529278, 2.980202, 1, 0, 0.6, 1,
1.271294, 1.395516, -0.0007384174, 1, 0, 0.5921569, 1,
1.283971, -2.355551, 2.51889, 1, 0, 0.5882353, 1,
1.293151, 1.686854, -0.3074591, 1, 0, 0.5803922, 1,
1.294249, -1.114055, 2.876394, 1, 0, 0.5764706, 1,
1.299703, 0.1875542, 1.683387, 1, 0, 0.5686275, 1,
1.317217, -0.04200834, 1.02996, 1, 0, 0.5647059, 1,
1.328564, 0.8906116, 1.275132, 1, 0, 0.5568628, 1,
1.336536, -2.386984, 1.763861, 1, 0, 0.5529412, 1,
1.341697, -0.008892768, 1.22903, 1, 0, 0.5450981, 1,
1.347884, 0.8772941, 0.5161868, 1, 0, 0.5411765, 1,
1.365306, -0.3128423, 0.3370368, 1, 0, 0.5333334, 1,
1.372206, -0.3361173, 0.8703231, 1, 0, 0.5294118, 1,
1.375703, 0.03973721, 2.463221, 1, 0, 0.5215687, 1,
1.380722, -0.3547617, 2.678436, 1, 0, 0.5176471, 1,
1.395529, 1.136197, 0.2594481, 1, 0, 0.509804, 1,
1.404461, 1.759165, 0.5088416, 1, 0, 0.5058824, 1,
1.406862, 1.236111, 0.4986458, 1, 0, 0.4980392, 1,
1.411782, -0.019267, 1.878928, 1, 0, 0.4901961, 1,
1.424007, 2.144983, 0.4405668, 1, 0, 0.4862745, 1,
1.434701, 0.3907207, 0.1586969, 1, 0, 0.4784314, 1,
1.435227, 1.309384, 1.124021, 1, 0, 0.4745098, 1,
1.437086, -0.4929885, 2.296349, 1, 0, 0.4666667, 1,
1.437663, 1.000166, 1.262146, 1, 0, 0.4627451, 1,
1.45601, 0.3807929, -0.7192578, 1, 0, 0.454902, 1,
1.457142, 1.376867, 2.753722, 1, 0, 0.4509804, 1,
1.460164, -1.581843, 0.678955, 1, 0, 0.4431373, 1,
1.471646, 1.165077, 1.760671, 1, 0, 0.4392157, 1,
1.471699, -0.7610136, 2.678704, 1, 0, 0.4313726, 1,
1.472528, -1.587728, -0.09499534, 1, 0, 0.427451, 1,
1.477154, -0.4677982, 2.384784, 1, 0, 0.4196078, 1,
1.510686, -0.03477414, 1.841179, 1, 0, 0.4156863, 1,
1.52234, -0.819665, 1.844202, 1, 0, 0.4078431, 1,
1.524742, 0.9865638, 0.9608361, 1, 0, 0.4039216, 1,
1.533562, -0.7685694, 1.920697, 1, 0, 0.3960784, 1,
1.564326, -0.4798007, 0.8110893, 1, 0, 0.3882353, 1,
1.570279, -0.7365419, 3.026911, 1, 0, 0.3843137, 1,
1.583416, 0.2347804, 1.088373, 1, 0, 0.3764706, 1,
1.583763, -1.906391, 4.176123, 1, 0, 0.372549, 1,
1.5921, -1.213641, 2.889828, 1, 0, 0.3647059, 1,
1.599, -0.4983509, 2.803761, 1, 0, 0.3607843, 1,
1.607201, -0.6185274, 1.995385, 1, 0, 0.3529412, 1,
1.612057, -1.302969, 1.812217, 1, 0, 0.3490196, 1,
1.612604, -0.7326518, 3.597293, 1, 0, 0.3411765, 1,
1.622994, -0.8964088, 2.23875, 1, 0, 0.3372549, 1,
1.643424, -0.7537332, 1.517225, 1, 0, 0.3294118, 1,
1.649908, -0.8163258, 1.285376, 1, 0, 0.3254902, 1,
1.659072, 0.6450388, 2.135442, 1, 0, 0.3176471, 1,
1.661097, -0.378092, 0.7628781, 1, 0, 0.3137255, 1,
1.680076, 2.324976, -1.161256, 1, 0, 0.3058824, 1,
1.681133, -0.8014565, 3.522568, 1, 0, 0.2980392, 1,
1.698751, 0.7111937, 2.005545, 1, 0, 0.2941177, 1,
1.707803, -0.125406, 1.798415, 1, 0, 0.2862745, 1,
1.708215, 1.515058, 1.225343, 1, 0, 0.282353, 1,
1.729965, -0.61338, 3.520464, 1, 0, 0.2745098, 1,
1.740185, 1.222571, 1.918979, 1, 0, 0.2705882, 1,
1.760993, 1.360386, 1.83765, 1, 0, 0.2627451, 1,
1.761462, -0.5591542, 1.751422, 1, 0, 0.2588235, 1,
1.776849, 1.08564, 3.328648, 1, 0, 0.2509804, 1,
1.793321, -0.7513881, 2.697554, 1, 0, 0.2470588, 1,
1.795542, -0.8160616, 3.495613, 1, 0, 0.2392157, 1,
1.809463, -1.05246, 2.828402, 1, 0, 0.2352941, 1,
1.820072, 0.9057413, 1.324377, 1, 0, 0.227451, 1,
1.833557, -0.5921379, 1.659617, 1, 0, 0.2235294, 1,
1.840503, 2.074978, 1.824226, 1, 0, 0.2156863, 1,
1.843088, 1.35546, 1.16719, 1, 0, 0.2117647, 1,
1.876805, -0.441595, 1.584729, 1, 0, 0.2039216, 1,
1.921514, -0.1298811, 1.26803, 1, 0, 0.1960784, 1,
1.947944, 0.2775623, 2.076849, 1, 0, 0.1921569, 1,
1.962914, 0.6434208, 0.7476327, 1, 0, 0.1843137, 1,
1.964333, 0.1016355, 0.2227178, 1, 0, 0.1803922, 1,
1.973697, -0.0722409, 0.6791123, 1, 0, 0.172549, 1,
2.006145, 1.24925, 2.537416, 1, 0, 0.1686275, 1,
2.018285, -0.1306688, 0.559247, 1, 0, 0.1607843, 1,
2.046424, 0.7128469, 1.839406, 1, 0, 0.1568628, 1,
2.055573, 0.1764771, 0.6765505, 1, 0, 0.1490196, 1,
2.074679, -0.363033, 3.932781, 1, 0, 0.145098, 1,
2.09082, -1.611745, 2.675199, 1, 0, 0.1372549, 1,
2.111632, 0.786285, 1.888404, 1, 0, 0.1333333, 1,
2.141504, -0.7379591, 1.206581, 1, 0, 0.1254902, 1,
2.169701, -0.7576712, 1.99351, 1, 0, 0.1215686, 1,
2.185612, -1.181828, 3.022712, 1, 0, 0.1137255, 1,
2.193206, 0.5735036, -0.9734586, 1, 0, 0.1098039, 1,
2.201977, 0.4378529, 2.684591, 1, 0, 0.1019608, 1,
2.216807, 2.832911, 0.7310719, 1, 0, 0.09411765, 1,
2.288928, -0.3131847, 2.971861, 1, 0, 0.09019608, 1,
2.310014, 0.9393664, -0.05319546, 1, 0, 0.08235294, 1,
2.36237, 0.6118101, 1.633476, 1, 0, 0.07843138, 1,
2.377395, 0.4627968, 1.850579, 1, 0, 0.07058824, 1,
2.392557, 1.196905, 0.9699613, 1, 0, 0.06666667, 1,
2.394337, -0.8283221, 0.09343041, 1, 0, 0.05882353, 1,
2.476674, -0.5799645, 0.7172017, 1, 0, 0.05490196, 1,
2.486597, 1.661759, 0.4985147, 1, 0, 0.04705882, 1,
2.487717, 0.3079199, 1.35554, 1, 0, 0.04313726, 1,
2.608841, 1.200982, 1.101294, 1, 0, 0.03529412, 1,
2.641143, -0.6719926, 2.443969, 1, 0, 0.03137255, 1,
2.686127, -0.4718453, 0.3882366, 1, 0, 0.02352941, 1,
2.792486, -0.1058993, 1.202717, 1, 0, 0.01960784, 1,
3.037163, -0.1282717, 1.396806, 1, 0, 0.01176471, 1,
3.371244, -0.7978395, 3.082652, 1, 0, 0.007843138, 1
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
0.3028368, -4.659298, -6.698884, 0, -0.5, 0.5, 0.5,
0.3028368, -4.659298, -6.698884, 1, -0.5, 0.5, 0.5,
0.3028368, -4.659298, -6.698884, 1, 1.5, 0.5, 0.5,
0.3028368, -4.659298, -6.698884, 0, 1.5, 0.5, 0.5
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
-3.805761, 0.1478238, -6.698884, 0, -0.5, 0.5, 0.5,
-3.805761, 0.1478238, -6.698884, 1, -0.5, 0.5, 0.5,
-3.805761, 0.1478238, -6.698884, 1, 1.5, 0.5, 0.5,
-3.805761, 0.1478238, -6.698884, 0, 1.5, 0.5, 0.5
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
-3.805761, -4.659298, 0.03412056, 0, -0.5, 0.5, 0.5,
-3.805761, -4.659298, 0.03412056, 1, -0.5, 0.5, 0.5,
-3.805761, -4.659298, 0.03412056, 1, 1.5, 0.5, 0.5,
-3.805761, -4.659298, 0.03412056, 0, 1.5, 0.5, 0.5
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
-2, -3.549962, -5.145114,
3, -3.549962, -5.145114,
-2, -3.549962, -5.145114,
-2, -3.734852, -5.404076,
-1, -3.549962, -5.145114,
-1, -3.734852, -5.404076,
0, -3.549962, -5.145114,
0, -3.734852, -5.404076,
1, -3.549962, -5.145114,
1, -3.734852, -5.404076,
2, -3.549962, -5.145114,
2, -3.734852, -5.404076,
3, -3.549962, -5.145114,
3, -3.734852, -5.404076
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
-2, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
-2, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
-2, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
-2, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5,
-1, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
-1, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
-1, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
-1, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5,
0, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
0, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
0, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
0, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5,
1, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
1, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
1, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
1, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5,
2, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
2, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
2, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
2, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5,
3, -4.10463, -5.921999, 0, -0.5, 0.5, 0.5,
3, -4.10463, -5.921999, 1, -0.5, 0.5, 0.5,
3, -4.10463, -5.921999, 1, 1.5, 0.5, 0.5,
3, -4.10463, -5.921999, 0, 1.5, 0.5, 0.5
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
-2.857623, -2, -5.145114,
-2.857623, 2, -5.145114,
-2.857623, -2, -5.145114,
-3.015646, -2, -5.404076,
-2.857623, 0, -5.145114,
-3.015646, 0, -5.404076,
-2.857623, 2, -5.145114,
-3.015646, 2, -5.404076
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
"0",
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
-3.331692, -2, -5.921999, 0, -0.5, 0.5, 0.5,
-3.331692, -2, -5.921999, 1, -0.5, 0.5, 0.5,
-3.331692, -2, -5.921999, 1, 1.5, 0.5, 0.5,
-3.331692, -2, -5.921999, 0, 1.5, 0.5, 0.5,
-3.331692, 0, -5.921999, 0, -0.5, 0.5, 0.5,
-3.331692, 0, -5.921999, 1, -0.5, 0.5, 0.5,
-3.331692, 0, -5.921999, 1, 1.5, 0.5, 0.5,
-3.331692, 0, -5.921999, 0, 1.5, 0.5, 0.5,
-3.331692, 2, -5.921999, 0, -0.5, 0.5, 0.5,
-3.331692, 2, -5.921999, 1, -0.5, 0.5, 0.5,
-3.331692, 2, -5.921999, 1, 1.5, 0.5, 0.5,
-3.331692, 2, -5.921999, 0, 1.5, 0.5, 0.5
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
-2.857623, -3.549962, -4,
-2.857623, -3.549962, 4,
-2.857623, -3.549962, -4,
-3.015646, -3.734852, -4,
-2.857623, -3.549962, -2,
-3.015646, -3.734852, -2,
-2.857623, -3.549962, 0,
-3.015646, -3.734852, 0,
-2.857623, -3.549962, 2,
-3.015646, -3.734852, 2,
-2.857623, -3.549962, 4,
-3.015646, -3.734852, 4
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
-3.331692, -4.10463, -4, 0, -0.5, 0.5, 0.5,
-3.331692, -4.10463, -4, 1, -0.5, 0.5, 0.5,
-3.331692, -4.10463, -4, 1, 1.5, 0.5, 0.5,
-3.331692, -4.10463, -4, 0, 1.5, 0.5, 0.5,
-3.331692, -4.10463, -2, 0, -0.5, 0.5, 0.5,
-3.331692, -4.10463, -2, 1, -0.5, 0.5, 0.5,
-3.331692, -4.10463, -2, 1, 1.5, 0.5, 0.5,
-3.331692, -4.10463, -2, 0, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 0, 0, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 0, 1, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 0, 1, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 0, 0, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 2, 0, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 2, 1, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 2, 1, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 2, 0, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 4, 0, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 4, 1, -0.5, 0.5, 0.5,
-3.331692, -4.10463, 4, 1, 1.5, 0.5, 0.5,
-3.331692, -4.10463, 4, 0, 1.5, 0.5, 0.5
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
-2.857623, -3.549962, -5.145114,
-2.857623, 3.84561, -5.145114,
-2.857623, -3.549962, 5.213356,
-2.857623, 3.84561, 5.213356,
-2.857623, -3.549962, -5.145114,
-2.857623, -3.549962, 5.213356,
-2.857623, 3.84561, -5.145114,
-2.857623, 3.84561, 5.213356,
-2.857623, -3.549962, -5.145114,
3.463297, -3.549962, -5.145114,
-2.857623, -3.549962, 5.213356,
3.463297, -3.549962, 5.213356,
-2.857623, 3.84561, -5.145114,
3.463297, 3.84561, -5.145114,
-2.857623, 3.84561, 5.213356,
3.463297, 3.84561, 5.213356,
3.463297, -3.549962, -5.145114,
3.463297, 3.84561, -5.145114,
3.463297, -3.549962, 5.213356,
3.463297, 3.84561, 5.213356,
3.463297, -3.549962, -5.145114,
3.463297, -3.549962, 5.213356,
3.463297, 3.84561, -5.145114,
3.463297, 3.84561, 5.213356
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
var radius = 7.588283;
var distance = 33.76113;
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
mvMatrix.translate( -0.3028368, -0.1478238, -0.03412056 );
mvMatrix.scale( 1.298007, 1.109394, 0.7920669 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76113);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


