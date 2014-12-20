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
-2.995802, -1.01218, -2.328933, 1, 0, 0, 1,
-2.873378, -1.138299, 0.004282676, 1, 0.007843138, 0, 1,
-2.859893, 0.8918245, -1.716741, 1, 0.01176471, 0, 1,
-2.847723, 0.6966574, -1.511072, 1, 0.01960784, 0, 1,
-2.801798, -0.009442206, 0.0753058, 1, 0.02352941, 0, 1,
-2.674765, 0.244014, -1.28167, 1, 0.03137255, 0, 1,
-2.652398, 0.7662354, -0.8717845, 1, 0.03529412, 0, 1,
-2.492511, 1.762604, -2.33487, 1, 0.04313726, 0, 1,
-2.488378, -0.4317541, -2.446907, 1, 0.04705882, 0, 1,
-2.451603, -0.4713524, -3.181859, 1, 0.05490196, 0, 1,
-2.429749, 0.7406114, -0.5760757, 1, 0.05882353, 0, 1,
-2.323906, -1.431204, -2.940177, 1, 0.06666667, 0, 1,
-2.281659, 0.06327339, -1.646832, 1, 0.07058824, 0, 1,
-2.277932, -1.558104, -2.203309, 1, 0.07843138, 0, 1,
-2.265149, 0.4626685, -2.288953, 1, 0.08235294, 0, 1,
-2.260874, 0.7688439, -2.631787, 1, 0.09019608, 0, 1,
-2.220397, -0.5757318, -3.117259, 1, 0.09411765, 0, 1,
-2.179814, -0.4181807, -3.893565, 1, 0.1019608, 0, 1,
-2.106174, 0.2341775, -1.843351, 1, 0.1098039, 0, 1,
-2.104156, -1.510563, -3.810924, 1, 0.1137255, 0, 1,
-2.077592, -1.661883, -4.156375, 1, 0.1215686, 0, 1,
-2.077202, -0.4109635, -1.781366, 1, 0.1254902, 0, 1,
-2.056077, 0.2046047, -0.1917787, 1, 0.1333333, 0, 1,
-2.045809, 0.1406307, -1.571941, 1, 0.1372549, 0, 1,
-2.041914, 0.3108789, -1.524799, 1, 0.145098, 0, 1,
-2.030608, 0.2919318, -1.130562, 1, 0.1490196, 0, 1,
-2.030145, -1.759589, -0.7790846, 1, 0.1568628, 0, 1,
-1.986379, 0.5222793, -1.698829, 1, 0.1607843, 0, 1,
-1.889187, -1.151723, -2.330085, 1, 0.1686275, 0, 1,
-1.870194, -0.6575607, -3.754678, 1, 0.172549, 0, 1,
-1.852046, 0.1095985, -0.5588715, 1, 0.1803922, 0, 1,
-1.845342, -1.031587, -0.7872276, 1, 0.1843137, 0, 1,
-1.832116, -0.578877, -2.217237, 1, 0.1921569, 0, 1,
-1.828297, 0.1054941, -1.300575, 1, 0.1960784, 0, 1,
-1.811669, -0.1703247, -1.641196, 1, 0.2039216, 0, 1,
-1.79105, 0.2758921, -1.77647, 1, 0.2117647, 0, 1,
-1.790328, 0.3099144, -1.914496, 1, 0.2156863, 0, 1,
-1.768762, 0.6505211, -0.8753023, 1, 0.2235294, 0, 1,
-1.763212, 0.1813173, -1.84116, 1, 0.227451, 0, 1,
-1.723014, -0.3613392, -2.099332, 1, 0.2352941, 0, 1,
-1.721059, -1.134246, -2.669082, 1, 0.2392157, 0, 1,
-1.710671, 3.118797, 0.01474862, 1, 0.2470588, 0, 1,
-1.700856, 1.422816, -1.100544, 1, 0.2509804, 0, 1,
-1.673729, -0.8026677, -2.411287, 1, 0.2588235, 0, 1,
-1.638815, 0.2331444, -2.335571, 1, 0.2627451, 0, 1,
-1.631299, 0.7461564, -2.060209, 1, 0.2705882, 0, 1,
-1.62506, -0.6124794, -2.054954, 1, 0.2745098, 0, 1,
-1.617181, 0.2377659, -1.829034, 1, 0.282353, 0, 1,
-1.602949, 0.5275559, 0.7220008, 1, 0.2862745, 0, 1,
-1.592827, 1.409254, -1.36246, 1, 0.2941177, 0, 1,
-1.584086, -0.9993003, -3.53815, 1, 0.3019608, 0, 1,
-1.572369, 0.03697212, -1.383878, 1, 0.3058824, 0, 1,
-1.57033, -0.5362139, -4.419463, 1, 0.3137255, 0, 1,
-1.55491, 0.1454776, -0.7895521, 1, 0.3176471, 0, 1,
-1.534464, -0.8186684, -3.839727, 1, 0.3254902, 0, 1,
-1.525653, -0.1312288, -0.1565299, 1, 0.3294118, 0, 1,
-1.525216, 1.505789, -0.8220508, 1, 0.3372549, 0, 1,
-1.524111, 1.091088, -2.938704, 1, 0.3411765, 0, 1,
-1.513369, -0.6474763, -2.200948, 1, 0.3490196, 0, 1,
-1.511121, 0.4090792, -0.3679059, 1, 0.3529412, 0, 1,
-1.492891, -0.04433837, -1.283478, 1, 0.3607843, 0, 1,
-1.490797, 2.171381, -0.9989412, 1, 0.3647059, 0, 1,
-1.488381, -0.366998, -1.576442, 1, 0.372549, 0, 1,
-1.483126, -0.3119305, -0.5525486, 1, 0.3764706, 0, 1,
-1.470477, 1.946816, -1.716165, 1, 0.3843137, 0, 1,
-1.469073, 1.045414, -0.9863734, 1, 0.3882353, 0, 1,
-1.463336, -1.567133, -1.547567, 1, 0.3960784, 0, 1,
-1.445239, -0.7803396, -0.7752914, 1, 0.4039216, 0, 1,
-1.443786, -0.7068895, -2.937773, 1, 0.4078431, 0, 1,
-1.443773, 0.4861071, -2.6172, 1, 0.4156863, 0, 1,
-1.439606, 1.153435, -1.600921, 1, 0.4196078, 0, 1,
-1.438689, 0.8957428, -1.632487, 1, 0.427451, 0, 1,
-1.431308, -1.984494, -2.736623, 1, 0.4313726, 0, 1,
-1.426664, -0.151893, -1.838155, 1, 0.4392157, 0, 1,
-1.405489, -1.712928, -2.150568, 1, 0.4431373, 0, 1,
-1.402633, -0.8294504, -3.45573, 1, 0.4509804, 0, 1,
-1.396668, -0.9603798, -2.136168, 1, 0.454902, 0, 1,
-1.379905, 1.123995, -0.3296573, 1, 0.4627451, 0, 1,
-1.376101, 1.235641, 0.695906, 1, 0.4666667, 0, 1,
-1.361653, -1.761375, -2.977091, 1, 0.4745098, 0, 1,
-1.353586, 1.77599, 0.9975864, 1, 0.4784314, 0, 1,
-1.350388, 0.7237819, -2.483477, 1, 0.4862745, 0, 1,
-1.346539, 0.7731116, -1.95163, 1, 0.4901961, 0, 1,
-1.330949, 1.586201, 0.1819929, 1, 0.4980392, 0, 1,
-1.330071, 2.656167, 0.2276894, 1, 0.5058824, 0, 1,
-1.314184, -1.133783, -1.537849, 1, 0.509804, 0, 1,
-1.309445, 1.842564, -1.02781, 1, 0.5176471, 0, 1,
-1.304998, 0.6462432, -0.5059531, 1, 0.5215687, 0, 1,
-1.296901, 0.3884011, -0.3884999, 1, 0.5294118, 0, 1,
-1.278723, 1.972202, -1.01314, 1, 0.5333334, 0, 1,
-1.277062, -0.02063048, -1.872986, 1, 0.5411765, 0, 1,
-1.276861, -0.9669143, -1.619903, 1, 0.5450981, 0, 1,
-1.276168, -0.4645214, -2.289899, 1, 0.5529412, 0, 1,
-1.271865, 1.803888, -0.9905166, 1, 0.5568628, 0, 1,
-1.260982, -1.124967, -2.407069, 1, 0.5647059, 0, 1,
-1.24847, -1.312346, -0.6901386, 1, 0.5686275, 0, 1,
-1.24472, -0.7735218, -1.048621, 1, 0.5764706, 0, 1,
-1.229334, -0.05279958, -0.4463014, 1, 0.5803922, 0, 1,
-1.228697, 0.08001994, -2.662418, 1, 0.5882353, 0, 1,
-1.220036, 1.812852, 0.2986642, 1, 0.5921569, 0, 1,
-1.217438, 0.4701414, -1.118875, 1, 0.6, 0, 1,
-1.213895, -0.07376219, -1.223242, 1, 0.6078432, 0, 1,
-1.212366, -0.6331823, -2.109003, 1, 0.6117647, 0, 1,
-1.210431, 0.043205, -2.153532, 1, 0.6196079, 0, 1,
-1.209155, 0.6581558, -0.9711593, 1, 0.6235294, 0, 1,
-1.204036, -0.007943021, -1.582627, 1, 0.6313726, 0, 1,
-1.193017, -1.219737, -4.508396, 1, 0.6352941, 0, 1,
-1.191452, 0.6942675, -0.2244895, 1, 0.6431373, 0, 1,
-1.187482, -0.4648457, -2.787229, 1, 0.6470588, 0, 1,
-1.184109, 0.4119782, 1.048934, 1, 0.654902, 0, 1,
-1.181622, -0.6994066, -1.3721, 1, 0.6588235, 0, 1,
-1.179691, 0.3976854, -3.211489, 1, 0.6666667, 0, 1,
-1.162844, -0.9382064, -2.567654, 1, 0.6705883, 0, 1,
-1.150824, -0.5711528, -1.236429, 1, 0.6784314, 0, 1,
-1.146231, 0.2681031, -1.302021, 1, 0.682353, 0, 1,
-1.143323, 1.449687, -0.4420479, 1, 0.6901961, 0, 1,
-1.140355, -0.07386893, -2.808703, 1, 0.6941177, 0, 1,
-1.129916, 0.2755939, -3.080504, 1, 0.7019608, 0, 1,
-1.129328, -0.2567193, -0.5335141, 1, 0.7098039, 0, 1,
-1.126378, 0.1427733, -1.742859, 1, 0.7137255, 0, 1,
-1.114014, -0.5284186, -0.924228, 1, 0.7215686, 0, 1,
-1.107907, -1.103979, -3.285642, 1, 0.7254902, 0, 1,
-1.104255, 1.68052, -0.4491709, 1, 0.7333333, 0, 1,
-1.102086, 0.4329966, -0.6814778, 1, 0.7372549, 0, 1,
-1.101985, 0.1917389, -1.687259, 1, 0.7450981, 0, 1,
-1.1005, 0.8495202, 1.136938, 1, 0.7490196, 0, 1,
-1.090829, -0.201632, -1.480233, 1, 0.7568628, 0, 1,
-1.083778, 0.1771888, -2.428472, 1, 0.7607843, 0, 1,
-1.083181, 2.690091, 0.2963615, 1, 0.7686275, 0, 1,
-1.077072, -0.3541802, -1.536443, 1, 0.772549, 0, 1,
-1.075725, 0.687842, -0.7251331, 1, 0.7803922, 0, 1,
-1.072263, -1.044263, -3.481679, 1, 0.7843137, 0, 1,
-1.070781, -0.04170245, -0.9711002, 1, 0.7921569, 0, 1,
-1.06597, 0.7241667, -1.493127, 1, 0.7960784, 0, 1,
-1.065002, 0.2617668, -1.676033, 1, 0.8039216, 0, 1,
-1.057063, 0.2977113, -2.374951, 1, 0.8117647, 0, 1,
-1.051027, -0.09841967, -1.043173, 1, 0.8156863, 0, 1,
-1.049607, -0.2641942, -1.894117, 1, 0.8235294, 0, 1,
-1.049335, -0.02928845, -2.751322, 1, 0.827451, 0, 1,
-1.047819, 0.2820499, -1.896781, 1, 0.8352941, 0, 1,
-1.034211, 3.333193, 0.8809857, 1, 0.8392157, 0, 1,
-1.029403, 1.202026, -0.2866015, 1, 0.8470588, 0, 1,
-1.02524, -0.6001824, -4.357766, 1, 0.8509804, 0, 1,
-1.022699, 2.167005, 1.11731, 1, 0.8588235, 0, 1,
-1.021962, 0.3167724, -2.142776, 1, 0.8627451, 0, 1,
-1.020529, 1.011974, -1.239041, 1, 0.8705882, 0, 1,
-1.018026, -1.18815, -2.825447, 1, 0.8745098, 0, 1,
-1.017475, 0.7481986, -1.405099, 1, 0.8823529, 0, 1,
-1.011243, 0.6494131, -0.9626763, 1, 0.8862745, 0, 1,
-1.009214, 0.005390746, -2.232655, 1, 0.8941177, 0, 1,
-1.006185, 0.4035991, -2.340713, 1, 0.8980392, 0, 1,
-1.005236, -0.160109, -0.02818819, 1, 0.9058824, 0, 1,
-1.004355, -0.6668903, -1.375543, 1, 0.9137255, 0, 1,
-1.001181, -0.6597776, -2.599747, 1, 0.9176471, 0, 1,
-1.000026, 1.473294, 0.4833221, 1, 0.9254902, 0, 1,
-0.9938594, -0.6287619, -2.331754, 1, 0.9294118, 0, 1,
-0.988376, -0.1234312, -3.043069, 1, 0.9372549, 0, 1,
-0.9731097, 1.447596, 0.2584988, 1, 0.9411765, 0, 1,
-0.9728369, -0.02252439, -1.91444, 1, 0.9490196, 0, 1,
-0.97271, -0.9902033, -1.465185, 1, 0.9529412, 0, 1,
-0.9657751, -0.8731749, -1.068857, 1, 0.9607843, 0, 1,
-0.9648886, 0.04490364, -0.4392325, 1, 0.9647059, 0, 1,
-0.9638516, 1.668254, -2.045537, 1, 0.972549, 0, 1,
-0.9528797, 1.180875, -2.587905, 1, 0.9764706, 0, 1,
-0.9497698, 1.244622, 0.9051551, 1, 0.9843137, 0, 1,
-0.9496479, -0.3740545, -2.006835, 1, 0.9882353, 0, 1,
-0.9473966, -0.4581878, -1.795615, 1, 0.9960784, 0, 1,
-0.9456299, -0.3588452, -1.381069, 0.9960784, 1, 0, 1,
-0.9402083, -0.5120556, -3.228816, 0.9921569, 1, 0, 1,
-0.9389041, -0.881824, -4.113339, 0.9843137, 1, 0, 1,
-0.9382839, 0.1101329, -1.260804, 0.9803922, 1, 0, 1,
-0.9380267, -0.008923953, -2.054802, 0.972549, 1, 0, 1,
-0.9352168, 1.273459, -1.419942, 0.9686275, 1, 0, 1,
-0.9339699, 0.7489444, -2.102385, 0.9607843, 1, 0, 1,
-0.9284544, -0.5337144, -1.412223, 0.9568627, 1, 0, 1,
-0.9250927, -1.704743, -1.670944, 0.9490196, 1, 0, 1,
-0.9232745, -1.106939, -2.256548, 0.945098, 1, 0, 1,
-0.9204561, -0.8826073, -0.1246179, 0.9372549, 1, 0, 1,
-0.9165603, -0.4408194, -2.020512, 0.9333333, 1, 0, 1,
-0.9162971, 0.455158, -1.258218, 0.9254902, 1, 0, 1,
-0.9156477, 0.3915254, -2.238709, 0.9215686, 1, 0, 1,
-0.9124713, 1.068213, 0.3748547, 0.9137255, 1, 0, 1,
-0.9054008, -0.3057654, -1.101057, 0.9098039, 1, 0, 1,
-0.8953577, 0.4901721, 0.9900178, 0.9019608, 1, 0, 1,
-0.8953221, -0.1521388, -3.408537, 0.8941177, 1, 0, 1,
-0.8943012, 0.0549115, -0.1964277, 0.8901961, 1, 0, 1,
-0.888546, 0.2030582, -0.7277222, 0.8823529, 1, 0, 1,
-0.8858991, 0.57355, -0.7820378, 0.8784314, 1, 0, 1,
-0.8844397, -0.1549382, -2.29836, 0.8705882, 1, 0, 1,
-0.8719586, -2.484779, -1.625263, 0.8666667, 1, 0, 1,
-0.8716617, -1.043808, -4.175629, 0.8588235, 1, 0, 1,
-0.8610888, -0.2802829, -1.533319, 0.854902, 1, 0, 1,
-0.8593263, 0.6689667, -1.849432, 0.8470588, 1, 0, 1,
-0.8550433, 0.9397736, -0.2811997, 0.8431373, 1, 0, 1,
-0.8535525, -0.9462978, -3.378414, 0.8352941, 1, 0, 1,
-0.8491086, 0.3329732, -1.418467, 0.8313726, 1, 0, 1,
-0.8455687, -0.3484505, -0.8859858, 0.8235294, 1, 0, 1,
-0.8448859, 0.9688928, -0.9490527, 0.8196079, 1, 0, 1,
-0.8410025, -1.68359, -3.372366, 0.8117647, 1, 0, 1,
-0.8309315, 0.2038114, -1.389482, 0.8078431, 1, 0, 1,
-0.828439, 1.54276, 0.6286137, 0.8, 1, 0, 1,
-0.8273123, 0.6401879, -0.5890586, 0.7921569, 1, 0, 1,
-0.8254102, 0.4225378, -1.519417, 0.7882353, 1, 0, 1,
-0.8225255, -0.3378223, -2.075846, 0.7803922, 1, 0, 1,
-0.8210223, -0.5819277, -2.608063, 0.7764706, 1, 0, 1,
-0.8206755, -0.216829, -0.5767706, 0.7686275, 1, 0, 1,
-0.819508, 1.194782, 1.031888, 0.7647059, 1, 0, 1,
-0.8147159, 1.755432, -2.556597, 0.7568628, 1, 0, 1,
-0.8142112, 0.5867627, -1.99008, 0.7529412, 1, 0, 1,
-0.8081695, -0.5900084, -1.562785, 0.7450981, 1, 0, 1,
-0.8043916, 0.5186491, 0.3687599, 0.7411765, 1, 0, 1,
-0.8036126, 0.02907998, -1.964712, 0.7333333, 1, 0, 1,
-0.8034765, 0.6168525, -0.8080181, 0.7294118, 1, 0, 1,
-0.8028334, 0.29957, 0.06352424, 0.7215686, 1, 0, 1,
-0.799038, -0.7143046, -1.3304, 0.7176471, 1, 0, 1,
-0.799027, -0.5300803, -2.104555, 0.7098039, 1, 0, 1,
-0.7911024, -1.076746, -4.156041, 0.7058824, 1, 0, 1,
-0.7861954, -1.08369, -1.503422, 0.6980392, 1, 0, 1,
-0.783735, 0.9142526, -0.1121802, 0.6901961, 1, 0, 1,
-0.7810402, -0.1483495, -0.3688243, 0.6862745, 1, 0, 1,
-0.776419, -0.2079367, 0.03704916, 0.6784314, 1, 0, 1,
-0.7742318, -0.1288317, -2.24271, 0.6745098, 1, 0, 1,
-0.7693025, -1.540285, -1.85938, 0.6666667, 1, 0, 1,
-0.7646852, 0.8677402, -0.8698989, 0.6627451, 1, 0, 1,
-0.7629163, 1.971324, -0.8721809, 0.654902, 1, 0, 1,
-0.7572446, -0.2679162, -1.79227, 0.6509804, 1, 0, 1,
-0.7499844, 0.5222033, -2.66575, 0.6431373, 1, 0, 1,
-0.7427277, -1.584362, -1.379593, 0.6392157, 1, 0, 1,
-0.7356719, -0.2264235, -2.186996, 0.6313726, 1, 0, 1,
-0.7349297, 1.227846, -0.9505241, 0.627451, 1, 0, 1,
-0.7305755, 0.2302872, -1.350723, 0.6196079, 1, 0, 1,
-0.7300885, 0.2295192, -2.344145, 0.6156863, 1, 0, 1,
-0.7270666, 0.5220802, -0.6187339, 0.6078432, 1, 0, 1,
-0.7262781, 1.082942, 0.04180087, 0.6039216, 1, 0, 1,
-0.7226854, 1.256018, -1.326663, 0.5960785, 1, 0, 1,
-0.7225467, 0.1715401, -2.037065, 0.5882353, 1, 0, 1,
-0.7182583, -1.098266, -1.985957, 0.5843138, 1, 0, 1,
-0.7154974, -0.9857336, -2.259902, 0.5764706, 1, 0, 1,
-0.7147174, -1.377999, -3.338984, 0.572549, 1, 0, 1,
-0.7143592, 0.600832, -1.139953, 0.5647059, 1, 0, 1,
-0.7110212, 0.257669, -0.8912788, 0.5607843, 1, 0, 1,
-0.7038339, -0.6997033, -1.579722, 0.5529412, 1, 0, 1,
-0.6936911, -0.7634581, -2.047428, 0.5490196, 1, 0, 1,
-0.6902263, -0.456704, -2.655767, 0.5411765, 1, 0, 1,
-0.6867223, -0.08183499, -1.663801, 0.5372549, 1, 0, 1,
-0.6859922, -1.820147, -3.711437, 0.5294118, 1, 0, 1,
-0.6843462, -0.3926678, -2.661575, 0.5254902, 1, 0, 1,
-0.6689786, -0.6946492, -2.976272, 0.5176471, 1, 0, 1,
-0.6688207, -0.710033, -4.043887, 0.5137255, 1, 0, 1,
-0.6653783, 1.335303, 0.3812083, 0.5058824, 1, 0, 1,
-0.6636804, 0.06971139, -1.588498, 0.5019608, 1, 0, 1,
-0.6635537, -0.454911, -2.241907, 0.4941176, 1, 0, 1,
-0.6590913, 0.9590912, -0.7174243, 0.4862745, 1, 0, 1,
-0.656621, -0.130322, -4.538912, 0.4823529, 1, 0, 1,
-0.6565426, 1.180468, -0.3885411, 0.4745098, 1, 0, 1,
-0.6560085, 1.618303, -0.6535447, 0.4705882, 1, 0, 1,
-0.6518492, 0.9411091, -0.6171566, 0.4627451, 1, 0, 1,
-0.651381, -0.4680463, -1.537377, 0.4588235, 1, 0, 1,
-0.6512101, -0.4830505, -3.080478, 0.4509804, 1, 0, 1,
-0.6490437, -1.905421, -1.948615, 0.4470588, 1, 0, 1,
-0.64463, -0.8665932, 0.02210865, 0.4392157, 1, 0, 1,
-0.6424227, 1.941577, -1.329614, 0.4352941, 1, 0, 1,
-0.6394547, -1.569794, -2.760571, 0.427451, 1, 0, 1,
-0.6322052, -1.355824, -2.735253, 0.4235294, 1, 0, 1,
-0.6317726, -0.3155158, -2.408536, 0.4156863, 1, 0, 1,
-0.6309088, -1.325757, -2.669197, 0.4117647, 1, 0, 1,
-0.6290101, 0.7108572, -2.353731, 0.4039216, 1, 0, 1,
-0.6282134, 0.584374, -1.337571, 0.3960784, 1, 0, 1,
-0.6242958, 0.7521859, -0.3659576, 0.3921569, 1, 0, 1,
-0.621721, 1.202063, 1.072185, 0.3843137, 1, 0, 1,
-0.6202319, 0.3769783, -0.01884603, 0.3803922, 1, 0, 1,
-0.6184471, -1.227338, -2.387641, 0.372549, 1, 0, 1,
-0.6171646, 0.0131866, -2.830543, 0.3686275, 1, 0, 1,
-0.6170577, 0.1264514, -0.11462, 0.3607843, 1, 0, 1,
-0.6124136, -1.999439, -3.030355, 0.3568628, 1, 0, 1,
-0.6077506, -1.13772, -1.833888, 0.3490196, 1, 0, 1,
-0.6036525, 0.4626569, -0.9494208, 0.345098, 1, 0, 1,
-0.6026632, 0.307483, -1.167216, 0.3372549, 1, 0, 1,
-0.5944428, -0.7893956, -3.599262, 0.3333333, 1, 0, 1,
-0.5900834, 1.489504, -1.123244, 0.3254902, 1, 0, 1,
-0.5835398, 0.4510662, -0.9371846, 0.3215686, 1, 0, 1,
-0.5798386, -1.194382, -2.023053, 0.3137255, 1, 0, 1,
-0.5788063, 1.22611, 1.142999, 0.3098039, 1, 0, 1,
-0.5781341, -0.4992945, -1.903635, 0.3019608, 1, 0, 1,
-0.5760942, -1.197645, -1.298166, 0.2941177, 1, 0, 1,
-0.5755016, -0.1008472, -1.698604, 0.2901961, 1, 0, 1,
-0.5738252, 0.3040567, -1.000968, 0.282353, 1, 0, 1,
-0.5708247, 1.665425, -0.6834594, 0.2784314, 1, 0, 1,
-0.5683227, 0.3237988, -1.827458, 0.2705882, 1, 0, 1,
-0.5657684, -0.8290369, -2.481703, 0.2666667, 1, 0, 1,
-0.5649614, -1.003387, -3.56188, 0.2588235, 1, 0, 1,
-0.5649183, -1.578474, -2.434983, 0.254902, 1, 0, 1,
-0.5634558, 2.00725, -2.057832, 0.2470588, 1, 0, 1,
-0.5613365, 0.9392778, -1.069461, 0.2431373, 1, 0, 1,
-0.5612527, -0.6728451, -3.345064, 0.2352941, 1, 0, 1,
-0.5606925, -1.433053, -2.565353, 0.2313726, 1, 0, 1,
-0.5595078, -0.01892068, -1.30354, 0.2235294, 1, 0, 1,
-0.5552871, 0.6789563, -1.973081, 0.2196078, 1, 0, 1,
-0.5544144, -0.03989019, -3.022303, 0.2117647, 1, 0, 1,
-0.5525274, -0.3659933, -4.198675, 0.2078431, 1, 0, 1,
-0.5518857, 0.6576716, 0.9946566, 0.2, 1, 0, 1,
-0.5511243, -0.3224952, -2.504354, 0.1921569, 1, 0, 1,
-0.5491772, 0.4556118, -1.015469, 0.1882353, 1, 0, 1,
-0.5476145, -1.417702, -2.117157, 0.1803922, 1, 0, 1,
-0.5462602, 0.8135767, -1.470221, 0.1764706, 1, 0, 1,
-0.5458072, -0.06993628, -1.379138, 0.1686275, 1, 0, 1,
-0.5453181, 1.120304, -0.525624, 0.1647059, 1, 0, 1,
-0.5269599, 0.1832407, -3.026242, 0.1568628, 1, 0, 1,
-0.5268552, 0.03044813, -2.813191, 0.1529412, 1, 0, 1,
-0.5257689, 1.3824, -0.4847469, 0.145098, 1, 0, 1,
-0.5238891, -0.1396281, -2.170848, 0.1411765, 1, 0, 1,
-0.5141281, -0.1807056, -0.7010868, 0.1333333, 1, 0, 1,
-0.5140895, 0.03884084, -1.822665, 0.1294118, 1, 0, 1,
-0.5135522, -0.211422, -0.6737196, 0.1215686, 1, 0, 1,
-0.5113497, 0.3704889, -1.356088, 0.1176471, 1, 0, 1,
-0.5107965, -0.3034362, -1.621966, 0.1098039, 1, 0, 1,
-0.5091023, -0.6722943, -2.835945, 0.1058824, 1, 0, 1,
-0.5085697, -0.9757198, -1.695937, 0.09803922, 1, 0, 1,
-0.5072417, -0.2166207, -1.541571, 0.09019608, 1, 0, 1,
-0.507119, 0.5770924, -0.7367654, 0.08627451, 1, 0, 1,
-0.5060349, 0.4536008, -0.02411104, 0.07843138, 1, 0, 1,
-0.504217, 0.5169098, -0.08634662, 0.07450981, 1, 0, 1,
-0.4968673, 2.211695, -0.4533236, 0.06666667, 1, 0, 1,
-0.4959083, 1.296083, -0.1217091, 0.0627451, 1, 0, 1,
-0.4934702, -0.2890964, 0.6034727, 0.05490196, 1, 0, 1,
-0.488253, 0.8115399, 1.417831, 0.05098039, 1, 0, 1,
-0.4749277, 0.4527479, -1.491536, 0.04313726, 1, 0, 1,
-0.4742216, -0.3723065, -3.253181, 0.03921569, 1, 0, 1,
-0.4656336, -1.847369, -2.026521, 0.03137255, 1, 0, 1,
-0.4648328, -1.642115, -2.01309, 0.02745098, 1, 0, 1,
-0.4636301, -0.5672609, -1.865502, 0.01960784, 1, 0, 1,
-0.4620062, 0.5536867, -2.150205, 0.01568628, 1, 0, 1,
-0.4503719, -0.1930821, -1.374816, 0.007843138, 1, 0, 1,
-0.444737, 1.098698, -0.6060684, 0.003921569, 1, 0, 1,
-0.4430606, -0.2722251, -3.174528, 0, 1, 0.003921569, 1,
-0.4410909, -0.01970035, -2.88312, 0, 1, 0.01176471, 1,
-0.4372503, 0.268407, -2.678494, 0, 1, 0.01568628, 1,
-0.4359732, 1.401429, -0.3105454, 0, 1, 0.02352941, 1,
-0.4284866, -0.14338, -0.3212356, 0, 1, 0.02745098, 1,
-0.4272812, -0.9037531, -2.713248, 0, 1, 0.03529412, 1,
-0.4259919, -1.125221, -2.472119, 0, 1, 0.03921569, 1,
-0.4227601, 0.3329362, -0.462515, 0, 1, 0.04705882, 1,
-0.421027, 0.3655012, -0.579183, 0, 1, 0.05098039, 1,
-0.4155556, 1.22813, -0.8392674, 0, 1, 0.05882353, 1,
-0.4107268, -0.5372879, -3.795695, 0, 1, 0.0627451, 1,
-0.408164, -1.41136, -3.30591, 0, 1, 0.07058824, 1,
-0.4041418, 0.1004869, -1.96742, 0, 1, 0.07450981, 1,
-0.4040398, -0.1942905, -0.1443317, 0, 1, 0.08235294, 1,
-0.4017041, -0.05910697, -2.449747, 0, 1, 0.08627451, 1,
-0.3973358, 0.4361641, -1.694757, 0, 1, 0.09411765, 1,
-0.3961735, -0.6666906, -1.454877, 0, 1, 0.1019608, 1,
-0.3935735, 0.01395101, -0.9363, 0, 1, 0.1058824, 1,
-0.3914917, 1.845299, -2.205426, 0, 1, 0.1137255, 1,
-0.3896955, 1.852867, -0.02111082, 0, 1, 0.1176471, 1,
-0.3896679, -0.04900346, -1.377769, 0, 1, 0.1254902, 1,
-0.3886555, 2.139393, 0.02238037, 0, 1, 0.1294118, 1,
-0.3884145, -0.2841751, -2.046645, 0, 1, 0.1372549, 1,
-0.3873833, 0.09856477, 0.4494256, 0, 1, 0.1411765, 1,
-0.3869759, 0.07312302, -0.2906989, 0, 1, 0.1490196, 1,
-0.3851644, 1.420912, -1.774342, 0, 1, 0.1529412, 1,
-0.3845052, 1.368248, -1.177241, 0, 1, 0.1607843, 1,
-0.3839136, -1.092617, -1.514499, 0, 1, 0.1647059, 1,
-0.3834576, -0.6420858, -3.014559, 0, 1, 0.172549, 1,
-0.3817311, 0.204389, -0.3265991, 0, 1, 0.1764706, 1,
-0.3715492, 0.8361641, 0.5048026, 0, 1, 0.1843137, 1,
-0.3704994, -0.5304616, -2.121918, 0, 1, 0.1882353, 1,
-0.368378, 0.4911401, -0.5808017, 0, 1, 0.1960784, 1,
-0.3661089, 0.8800016, -1.407736, 0, 1, 0.2039216, 1,
-0.3593598, 0.1543213, 1.247462, 0, 1, 0.2078431, 1,
-0.3580249, 0.1643096, -2.788712, 0, 1, 0.2156863, 1,
-0.3540397, -0.1275266, -2.868098, 0, 1, 0.2196078, 1,
-0.3536544, 1.245486, 0.04696305, 0, 1, 0.227451, 1,
-0.3527342, 0.3206509, -2.522083, 0, 1, 0.2313726, 1,
-0.3526114, -0.6573023, -1.726864, 0, 1, 0.2392157, 1,
-0.3521766, 1.104723, -1.945442, 0, 1, 0.2431373, 1,
-0.3517327, 0.06738292, -2.911673, 0, 1, 0.2509804, 1,
-0.3407091, -0.686372, -3.463539, 0, 1, 0.254902, 1,
-0.3396657, 0.6886207, -0.7503602, 0, 1, 0.2627451, 1,
-0.3378411, -0.1639429, -0.03116957, 0, 1, 0.2666667, 1,
-0.3357209, 0.4151091, -1.520162, 0, 1, 0.2745098, 1,
-0.3333226, 0.4923919, -0.475953, 0, 1, 0.2784314, 1,
-0.3319688, -1.397293, -1.66702, 0, 1, 0.2862745, 1,
-0.3314969, 0.08251525, -1.71521, 0, 1, 0.2901961, 1,
-0.3283989, -1.095022, -3.640685, 0, 1, 0.2980392, 1,
-0.3272246, -0.1531713, -1.581885, 0, 1, 0.3058824, 1,
-0.3197747, -0.7375053, -3.719486, 0, 1, 0.3098039, 1,
-0.3149081, -0.7251818, -2.691908, 0, 1, 0.3176471, 1,
-0.3139153, 0.3210405, -1.040775, 0, 1, 0.3215686, 1,
-0.3136235, -0.818898, -2.750294, 0, 1, 0.3294118, 1,
-0.3133726, 0.4526396, 0.01252344, 0, 1, 0.3333333, 1,
-0.3127555, 1.32187, -0.883391, 0, 1, 0.3411765, 1,
-0.3125066, -1.282507, -2.784739, 0, 1, 0.345098, 1,
-0.311666, -0.3404757, -3.518584, 0, 1, 0.3529412, 1,
-0.3051338, 0.5764835, -0.2756002, 0, 1, 0.3568628, 1,
-0.3043984, 0.714004, 1.391093, 0, 1, 0.3647059, 1,
-0.3038434, -0.2661642, -3.452363, 0, 1, 0.3686275, 1,
-0.3019326, 0.2313628, -2.14013, 0, 1, 0.3764706, 1,
-0.2970778, -2.225069, -3.980986, 0, 1, 0.3803922, 1,
-0.2944746, -1.242666, -3.394128, 0, 1, 0.3882353, 1,
-0.2934332, 0.8233514, -1.202191, 0, 1, 0.3921569, 1,
-0.2896149, -1.265156, -2.170015, 0, 1, 0.4, 1,
-0.2846087, -0.2862122, -2.091359, 0, 1, 0.4078431, 1,
-0.280811, -1.189453, -3.516217, 0, 1, 0.4117647, 1,
-0.2806345, -0.008047065, -2.730898, 0, 1, 0.4196078, 1,
-0.2800994, -0.6634057, -3.922229, 0, 1, 0.4235294, 1,
-0.2742842, 0.5233561, -0.735196, 0, 1, 0.4313726, 1,
-0.2687391, 0.3892664, -0.9644872, 0, 1, 0.4352941, 1,
-0.2677676, 1.057773, -2.163598, 0, 1, 0.4431373, 1,
-0.2669649, 0.2371969, -1.046179, 0, 1, 0.4470588, 1,
-0.260609, -0.5881775, -3.175832, 0, 1, 0.454902, 1,
-0.2546959, -1.308664, -3.103636, 0, 1, 0.4588235, 1,
-0.2496348, 2.909923, -0.2920746, 0, 1, 0.4666667, 1,
-0.2422265, -0.3933297, -2.991618, 0, 1, 0.4705882, 1,
-0.23818, -1.269936, -4.322373, 0, 1, 0.4784314, 1,
-0.2318117, 0.6731282, 0.2134819, 0, 1, 0.4823529, 1,
-0.23116, -0.2210401, -1.956123, 0, 1, 0.4901961, 1,
-0.2302797, 0.3452418, -1.078732, 0, 1, 0.4941176, 1,
-0.2285216, -0.6829681, -3.490566, 0, 1, 0.5019608, 1,
-0.2203293, 0.681779, -1.156761, 0, 1, 0.509804, 1,
-0.2128482, -0.4232114, -2.918136, 0, 1, 0.5137255, 1,
-0.2121454, 1.119551, -0.8882801, 0, 1, 0.5215687, 1,
-0.204264, -0.6290717, -4.777754, 0, 1, 0.5254902, 1,
-0.2037539, 1.327543, -0.2650965, 0, 1, 0.5333334, 1,
-0.20159, 0.1719921, -0.97705, 0, 1, 0.5372549, 1,
-0.1975601, 0.7156148, 0.08980013, 0, 1, 0.5450981, 1,
-0.1961901, -0.5638115, -1.51944, 0, 1, 0.5490196, 1,
-0.1960576, -0.1698886, -1.931117, 0, 1, 0.5568628, 1,
-0.1956322, -2.271129, -4.505394, 0, 1, 0.5607843, 1,
-0.1891132, 1.069084, -0.7541727, 0, 1, 0.5686275, 1,
-0.1885296, 1.427099, -1.092189, 0, 1, 0.572549, 1,
-0.1881194, 0.3696036, -2.063241, 0, 1, 0.5803922, 1,
-0.1869667, 2.160181, 0.029478, 0, 1, 0.5843138, 1,
-0.1863672, -1.12506, -1.382992, 0, 1, 0.5921569, 1,
-0.183759, -0.8808115, -3.368452, 0, 1, 0.5960785, 1,
-0.1743136, -0.9586954, -4.766377, 0, 1, 0.6039216, 1,
-0.165934, -0.4672395, -3.037995, 0, 1, 0.6117647, 1,
-0.1599987, -0.5148003, -2.810723, 0, 1, 0.6156863, 1,
-0.1563847, 0.8081667, 0.04923658, 0, 1, 0.6235294, 1,
-0.1522303, -0.1014331, -0.1232022, 0, 1, 0.627451, 1,
-0.150559, 0.4776394, -0.7834395, 0, 1, 0.6352941, 1,
-0.1477833, 0.4602927, 0.7201016, 0, 1, 0.6392157, 1,
-0.1472209, 1.050687, 0.4074787, 0, 1, 0.6470588, 1,
-0.1425193, -0.3639342, -4.546318, 0, 1, 0.6509804, 1,
-0.1421684, -0.429133, -5.169053, 0, 1, 0.6588235, 1,
-0.1399331, -0.4971022, -2.582844, 0, 1, 0.6627451, 1,
-0.1378094, 0.7205051, -1.684199, 0, 1, 0.6705883, 1,
-0.1376333, -0.6317697, -1.911677, 0, 1, 0.6745098, 1,
-0.1320662, -0.9440395, -4.514501, 0, 1, 0.682353, 1,
-0.1309411, 1.055892, -0.7403549, 0, 1, 0.6862745, 1,
-0.1284221, 1.364244, -1.68446, 0, 1, 0.6941177, 1,
-0.1264803, -0.6010212, -2.234219, 0, 1, 0.7019608, 1,
-0.1203339, -1.120504, -4.800899, 0, 1, 0.7058824, 1,
-0.12013, -0.7159196, -2.833411, 0, 1, 0.7137255, 1,
-0.1173573, 0.5487357, -1.144852, 0, 1, 0.7176471, 1,
-0.1157749, -0.02547259, -2.774869, 0, 1, 0.7254902, 1,
-0.1118287, 0.3823243, -0.4805404, 0, 1, 0.7294118, 1,
-0.1037113, 0.9595758, 0.7194181, 0, 1, 0.7372549, 1,
-0.09709679, -1.237155, -3.301, 0, 1, 0.7411765, 1,
-0.09654157, 0.230808, 0.3804367, 0, 1, 0.7490196, 1,
-0.09536161, 0.6719264, -0.6521367, 0, 1, 0.7529412, 1,
-0.09184128, 1.268801, 0.2770773, 0, 1, 0.7607843, 1,
-0.09166511, 1.285587, 0.1075975, 0, 1, 0.7647059, 1,
-0.09147947, -0.3160282, -1.708969, 0, 1, 0.772549, 1,
-0.08823754, 0.7413281, 1.869035, 0, 1, 0.7764706, 1,
-0.08798151, -0.8627428, -2.546759, 0, 1, 0.7843137, 1,
-0.08255294, -1.96584, -3.4563, 0, 1, 0.7882353, 1,
-0.07338701, 0.06613617, -1.344018, 0, 1, 0.7960784, 1,
-0.06730645, 0.3641694, -0.05987953, 0, 1, 0.8039216, 1,
-0.06316088, 1.93572, -0.3918791, 0, 1, 0.8078431, 1,
-0.05880313, -0.28037, -3.045638, 0, 1, 0.8156863, 1,
-0.0549702, -0.367273, -3.374751, 0, 1, 0.8196079, 1,
-0.05179752, -1.940724, -3.782826, 0, 1, 0.827451, 1,
-0.04924488, 0.9668804, 0.689398, 0, 1, 0.8313726, 1,
-0.04851867, -0.9999179, -5.372882, 0, 1, 0.8392157, 1,
-0.04813029, 0.267169, -0.5418856, 0, 1, 0.8431373, 1,
-0.04707378, 1.264964, -0.5693055, 0, 1, 0.8509804, 1,
-0.04343533, 0.01352242, -0.08778048, 0, 1, 0.854902, 1,
-0.04273394, 0.3664428, -0.7866971, 0, 1, 0.8627451, 1,
-0.04001771, 0.146622, 0.839586, 0, 1, 0.8666667, 1,
-0.03995245, 0.2494255, -1.331412, 0, 1, 0.8745098, 1,
-0.03773523, 0.8755221, 1.484873, 0, 1, 0.8784314, 1,
-0.03301458, -0.07190899, -3.750387, 0, 1, 0.8862745, 1,
-0.03051445, 1.499967, 0.1420237, 0, 1, 0.8901961, 1,
-0.02945732, -0.5094881, -4.680426, 0, 1, 0.8980392, 1,
-0.02665986, 2.306861, -0.3388134, 0, 1, 0.9058824, 1,
-0.02404986, 0.6016958, -0.2812223, 0, 1, 0.9098039, 1,
-0.02393472, 0.2669685, -2.284747, 0, 1, 0.9176471, 1,
-0.02362479, 0.6442976, 1.017637, 0, 1, 0.9215686, 1,
-0.02334145, -0.9920026, -3.958775, 0, 1, 0.9294118, 1,
-0.0118763, 0.5255851, 0.9830226, 0, 1, 0.9333333, 1,
-0.006062001, 0.2339007, 0.1716379, 0, 1, 0.9411765, 1,
-0.004209611, -0.6643109, -2.716137, 0, 1, 0.945098, 1,
0.003939566, 0.3504458, 0.6010387, 0, 1, 0.9529412, 1,
0.009524853, 0.1514426, 0.272202, 0, 1, 0.9568627, 1,
0.01192995, -1.826962, 2.996275, 0, 1, 0.9647059, 1,
0.01260856, 0.7761802, 1.150087, 0, 1, 0.9686275, 1,
0.01263576, -0.9645904, 4.683818, 0, 1, 0.9764706, 1,
0.01421296, 1.424393, -0.6677247, 0, 1, 0.9803922, 1,
0.01494793, 0.9669705, 0.4499448, 0, 1, 0.9882353, 1,
0.01580299, -1.589055, 2.029397, 0, 1, 0.9921569, 1,
0.01653762, -0.5526707, 2.195925, 0, 1, 1, 1,
0.02114566, -0.01050445, 1.807695, 0, 0.9921569, 1, 1,
0.0218752, -0.5424712, 2.91459, 0, 0.9882353, 1, 1,
0.02518032, -0.4419385, 2.891247, 0, 0.9803922, 1, 1,
0.0273154, -0.1841005, 3.050794, 0, 0.9764706, 1, 1,
0.04029985, -0.5028527, 3.422394, 0, 0.9686275, 1, 1,
0.04329314, -0.5969906, 1.644342, 0, 0.9647059, 1, 1,
0.04605505, 0.510106, -1.922662, 0, 0.9568627, 1, 1,
0.04719609, -0.7363266, 2.272883, 0, 0.9529412, 1, 1,
0.04744324, -0.457395, 3.822818, 0, 0.945098, 1, 1,
0.04942526, 2.084384, 1.996247, 0, 0.9411765, 1, 1,
0.05350481, -0.2158177, 3.52465, 0, 0.9333333, 1, 1,
0.0540986, 0.182026, -1.040632, 0, 0.9294118, 1, 1,
0.05569614, 0.01198014, 5.343158, 0, 0.9215686, 1, 1,
0.06648998, 0.7511418, 0.4637408, 0, 0.9176471, 1, 1,
0.06715889, -0.460495, 2.77352, 0, 0.9098039, 1, 1,
0.06739522, -0.37145, 2.049657, 0, 0.9058824, 1, 1,
0.06785052, 1.761528, 1.248842, 0, 0.8980392, 1, 1,
0.07001054, -0.5858246, 4.067268, 0, 0.8901961, 1, 1,
0.07350002, -0.7083849, 1.189987, 0, 0.8862745, 1, 1,
0.07858633, -1.012859, 3.92949, 0, 0.8784314, 1, 1,
0.08190522, 0.154326, -1.047259, 0, 0.8745098, 1, 1,
0.08225399, 2.43839, 0.05410862, 0, 0.8666667, 1, 1,
0.08268319, 1.440532, -1.135932, 0, 0.8627451, 1, 1,
0.08284959, -1.022654, 3.48921, 0, 0.854902, 1, 1,
0.08327664, -0.07268727, 1.315403, 0, 0.8509804, 1, 1,
0.08617689, 1.29749, 0.3052795, 0, 0.8431373, 1, 1,
0.08649653, -0.7408183, 3.018636, 0, 0.8392157, 1, 1,
0.08783149, -0.07397641, 2.166487, 0, 0.8313726, 1, 1,
0.089907, 0.1286185, 0.3318468, 0, 0.827451, 1, 1,
0.09005869, -0.1900617, 2.981252, 0, 0.8196079, 1, 1,
0.09639117, 0.9865308, 1.127022, 0, 0.8156863, 1, 1,
0.09674008, -0.8888003, 3.382113, 0, 0.8078431, 1, 1,
0.09717339, -0.2698899, 1.809119, 0, 0.8039216, 1, 1,
0.1000262, -1.214635, 3.885259, 0, 0.7960784, 1, 1,
0.1054842, -0.803649, 1.223537, 0, 0.7882353, 1, 1,
0.1064583, 0.7927188, 0.7004392, 0, 0.7843137, 1, 1,
0.1078786, 0.4267228, -0.1543836, 0, 0.7764706, 1, 1,
0.1095148, 1.188243, 1.159516, 0, 0.772549, 1, 1,
0.1114962, -0.3810042, 3.310483, 0, 0.7647059, 1, 1,
0.1187392, -1.398989, 2.867545, 0, 0.7607843, 1, 1,
0.1198266, -1.252646, 2.964229, 0, 0.7529412, 1, 1,
0.121756, -1.78878, 3.450343, 0, 0.7490196, 1, 1,
0.126123, 1.64413, -0.0466736, 0, 0.7411765, 1, 1,
0.1299521, 0.03814961, 3.431942, 0, 0.7372549, 1, 1,
0.1312082, 0.1444467, 2.076733, 0, 0.7294118, 1, 1,
0.1320478, -1.496536, 2.690178, 0, 0.7254902, 1, 1,
0.1376556, -0.2237749, 2.023489, 0, 0.7176471, 1, 1,
0.1378655, 0.2682777, 0.8200971, 0, 0.7137255, 1, 1,
0.1409347, -0.8837589, 1.638704, 0, 0.7058824, 1, 1,
0.1418737, 2.059527, -1.347455, 0, 0.6980392, 1, 1,
0.1443898, -1.379441, 3.305378, 0, 0.6941177, 1, 1,
0.1449756, 0.9959002, 0.07292572, 0, 0.6862745, 1, 1,
0.1476818, 1.19371, -0.6788591, 0, 0.682353, 1, 1,
0.1480303, -0.365571, 3.513667, 0, 0.6745098, 1, 1,
0.1498322, -0.06633128, 0.7058063, 0, 0.6705883, 1, 1,
0.1499656, 1.113644, 0.4410302, 0, 0.6627451, 1, 1,
0.1517964, 0.5111571, 0.9576349, 0, 0.6588235, 1, 1,
0.1606255, 0.3877333, 1.188915, 0, 0.6509804, 1, 1,
0.1657743, -2.025836, 2.474192, 0, 0.6470588, 1, 1,
0.1681647, 0.7135551, 0.5711263, 0, 0.6392157, 1, 1,
0.1731362, 0.7903446, 1.859655, 0, 0.6352941, 1, 1,
0.1758086, -1.391558, 1.532717, 0, 0.627451, 1, 1,
0.1763575, 1.261009, -0.6817598, 0, 0.6235294, 1, 1,
0.1817124, -1.404508, 1.416981, 0, 0.6156863, 1, 1,
0.1928615, 1.400941, 0.7847983, 0, 0.6117647, 1, 1,
0.195794, -0.006168534, 1.945158, 0, 0.6039216, 1, 1,
0.1960632, 0.2638545, 0.8888944, 0, 0.5960785, 1, 1,
0.197095, -0.5577878, 2.428877, 0, 0.5921569, 1, 1,
0.202373, -2.158048, 2.4166, 0, 0.5843138, 1, 1,
0.2024563, 0.4700229, 0.4874767, 0, 0.5803922, 1, 1,
0.2051419, 1.342845, 0.8509942, 0, 0.572549, 1, 1,
0.2110135, 0.2198969, 1.215566, 0, 0.5686275, 1, 1,
0.2148044, 0.8657303, -0.4672317, 0, 0.5607843, 1, 1,
0.2167995, 0.4787646, 2.033333, 0, 0.5568628, 1, 1,
0.226928, -2.633348, 3.067456, 0, 0.5490196, 1, 1,
0.2284078, -1.314937, 2.290308, 0, 0.5450981, 1, 1,
0.2284081, 0.1472233, 1.389136, 0, 0.5372549, 1, 1,
0.2290559, -0.3304973, 0.9872188, 0, 0.5333334, 1, 1,
0.2291596, 1.261043, 0.4761486, 0, 0.5254902, 1, 1,
0.2332036, 0.3616981, 1.943362, 0, 0.5215687, 1, 1,
0.2334779, 0.545962, -0.641684, 0, 0.5137255, 1, 1,
0.2337154, -0.6431866, 0.910538, 0, 0.509804, 1, 1,
0.2359188, 0.4737754, -0.2258721, 0, 0.5019608, 1, 1,
0.2365431, -2.401548, 1.671206, 0, 0.4941176, 1, 1,
0.2413175, 0.1195337, 0.6299316, 0, 0.4901961, 1, 1,
0.2430036, 1.356387, 0.6907837, 0, 0.4823529, 1, 1,
0.2439343, 0.2581465, 1.743575, 0, 0.4784314, 1, 1,
0.2495791, -0.07064829, 2.249731, 0, 0.4705882, 1, 1,
0.2496485, 1.874125, 0.2540351, 0, 0.4666667, 1, 1,
0.2498324, -0.06711935, 2.522306, 0, 0.4588235, 1, 1,
0.2520378, 0.8956596, 0.01335368, 0, 0.454902, 1, 1,
0.2537856, -0.1494744, 3.033811, 0, 0.4470588, 1, 1,
0.2565156, -1.260661, 4.442884, 0, 0.4431373, 1, 1,
0.258032, 0.9063162, -0.2624254, 0, 0.4352941, 1, 1,
0.2632222, 0.06125762, 1.368571, 0, 0.4313726, 1, 1,
0.2635971, -0.3216862, 3.160261, 0, 0.4235294, 1, 1,
0.2643326, -0.1003859, 0.8001668, 0, 0.4196078, 1, 1,
0.2703498, -0.4720485, 4.434608, 0, 0.4117647, 1, 1,
0.2713364, -0.78459, 2.297959, 0, 0.4078431, 1, 1,
0.2714624, -0.569101, 2.341083, 0, 0.4, 1, 1,
0.2832411, 1.012957, 0.6750127, 0, 0.3921569, 1, 1,
0.2883243, 1.37266, -0.5584614, 0, 0.3882353, 1, 1,
0.2888038, 1.190888, -0.09398545, 0, 0.3803922, 1, 1,
0.2891528, 0.9683962, -0.0103454, 0, 0.3764706, 1, 1,
0.2895773, -1.118802, 3.476377, 0, 0.3686275, 1, 1,
0.2939212, -1.041728, 2.52213, 0, 0.3647059, 1, 1,
0.2973244, -0.4505455, 3.121245, 0, 0.3568628, 1, 1,
0.2990374, 0.01640636, -0.1098473, 0, 0.3529412, 1, 1,
0.3020455, 0.4833511, 1.964605, 0, 0.345098, 1, 1,
0.3021498, -0.2164083, 2.304994, 0, 0.3411765, 1, 1,
0.3050176, 0.4251234, -0.1457853, 0, 0.3333333, 1, 1,
0.3060254, 0.3141586, 0.9375725, 0, 0.3294118, 1, 1,
0.3080261, -0.3952169, 2.906565, 0, 0.3215686, 1, 1,
0.309137, -0.6255155, 2.807616, 0, 0.3176471, 1, 1,
0.3105782, 0.03174341, 1.274814, 0, 0.3098039, 1, 1,
0.3109054, -0.4944124, 3.292924, 0, 0.3058824, 1, 1,
0.3109728, 0.5048527, 0.5247687, 0, 0.2980392, 1, 1,
0.3209964, 1.772737, 0.905535, 0, 0.2901961, 1, 1,
0.3278061, -0.905485, 1.977013, 0, 0.2862745, 1, 1,
0.3289811, 0.2109073, 0.2468426, 0, 0.2784314, 1, 1,
0.3312174, 0.9855762, 0.7793622, 0, 0.2745098, 1, 1,
0.3313044, 0.3908947, 1.276022, 0, 0.2666667, 1, 1,
0.3445147, 0.04850812, 1.656151, 0, 0.2627451, 1, 1,
0.3464188, 0.3946823, 0.3836547, 0, 0.254902, 1, 1,
0.3469522, -1.44567, 2.599909, 0, 0.2509804, 1, 1,
0.3496703, -1.299067, 4.583973, 0, 0.2431373, 1, 1,
0.3513486, -0.904774, 2.719489, 0, 0.2392157, 1, 1,
0.3528187, 0.9979967, 1.68592, 0, 0.2313726, 1, 1,
0.353046, 0.1381393, 1.712611, 0, 0.227451, 1, 1,
0.3585339, 0.6201274, 0.5940443, 0, 0.2196078, 1, 1,
0.3633739, 1.284801, 0.4373388, 0, 0.2156863, 1, 1,
0.3642292, 0.4983255, 0.7981497, 0, 0.2078431, 1, 1,
0.3763853, -0.02866711, 2.898409, 0, 0.2039216, 1, 1,
0.3898779, -0.2485132, 2.600919, 0, 0.1960784, 1, 1,
0.3914989, 0.5009277, 1.500261, 0, 0.1882353, 1, 1,
0.3922954, -0.5744106, 1.646502, 0, 0.1843137, 1, 1,
0.3964857, 0.320211, 0.1986702, 0, 0.1764706, 1, 1,
0.3975723, -1.009424, 2.179303, 0, 0.172549, 1, 1,
0.4002578, -0.3878334, 1.933645, 0, 0.1647059, 1, 1,
0.4040751, -0.1891736, 3.4501, 0, 0.1607843, 1, 1,
0.4078166, 1.585897, 0.8477356, 0, 0.1529412, 1, 1,
0.4214764, -0.2836281, 3.365733, 0, 0.1490196, 1, 1,
0.4223998, -0.6075234, 0.7022232, 0, 0.1411765, 1, 1,
0.4260688, -0.7147558, 2.152601, 0, 0.1372549, 1, 1,
0.4266033, -1.07572, 3.574135, 0, 0.1294118, 1, 1,
0.4334867, 0.4832326, 0.9599529, 0, 0.1254902, 1, 1,
0.4360999, 1.65655, 0.6345184, 0, 0.1176471, 1, 1,
0.4374347, 0.5152934, -0.2859835, 0, 0.1137255, 1, 1,
0.4410461, 0.4007908, 0.7371309, 0, 0.1058824, 1, 1,
0.4507282, -1.358562, 3.830179, 0, 0.09803922, 1, 1,
0.4541741, -0.2263833, 0.5410744, 0, 0.09411765, 1, 1,
0.4612378, -1.049036, 2.796326, 0, 0.08627451, 1, 1,
0.4619801, 0.9509094, -0.07568492, 0, 0.08235294, 1, 1,
0.4644406, 0.2634132, 0.9089906, 0, 0.07450981, 1, 1,
0.4670707, -0.7007603, 4.72458, 0, 0.07058824, 1, 1,
0.4681653, 0.8830684, 1.135986, 0, 0.0627451, 1, 1,
0.4705605, -2.193435, 3.19753, 0, 0.05882353, 1, 1,
0.473235, -0.7106827, 2.322106, 0, 0.05098039, 1, 1,
0.4777039, 0.5939639, 0.8476715, 0, 0.04705882, 1, 1,
0.4812562, 0.7623866, 0.5365099, 0, 0.03921569, 1, 1,
0.4828628, 0.1348398, 1.317289, 0, 0.03529412, 1, 1,
0.4849845, -0.8712961, 2.381004, 0, 0.02745098, 1, 1,
0.4885582, -2.204352, 2.138992, 0, 0.02352941, 1, 1,
0.4947527, 1.234966, 0.4111253, 0, 0.01568628, 1, 1,
0.4966322, 0.4838481, -1.188641, 0, 0.01176471, 1, 1,
0.4977171, 1.500105, -0.7428558, 0, 0.003921569, 1, 1,
0.4979257, 0.5473147, 1.768209, 0.003921569, 0, 1, 1,
0.5000341, -0.1749223, 2.362381, 0.007843138, 0, 1, 1,
0.5001599, -0.6355191, 3.371879, 0.01568628, 0, 1, 1,
0.5008495, 1.355311, 1.047199, 0.01960784, 0, 1, 1,
0.5011643, -1.789756, 3.730556, 0.02745098, 0, 1, 1,
0.5039769, -0.09249692, 1.277767, 0.03137255, 0, 1, 1,
0.5090569, -0.2599845, 2.396784, 0.03921569, 0, 1, 1,
0.5098596, -0.5574734, 1.359143, 0.04313726, 0, 1, 1,
0.5179176, -0.3134021, 2.74087, 0.05098039, 0, 1, 1,
0.5206282, 0.9657866, -0.4347637, 0.05490196, 0, 1, 1,
0.5207877, -1.440532, 2.589616, 0.0627451, 0, 1, 1,
0.521583, -0.2247609, 1.270074, 0.06666667, 0, 1, 1,
0.5267726, 0.4010289, -0.3974881, 0.07450981, 0, 1, 1,
0.5295932, -0.4021125, 1.945123, 0.07843138, 0, 1, 1,
0.5335886, -0.2296294, 1.85083, 0.08627451, 0, 1, 1,
0.533609, 1.01978, 1.733288, 0.09019608, 0, 1, 1,
0.5337936, 0.1788765, 1.548311, 0.09803922, 0, 1, 1,
0.5394369, 0.6290299, 2.201334, 0.1058824, 0, 1, 1,
0.542779, -0.6030327, 3.022224, 0.1098039, 0, 1, 1,
0.5429316, 0.7183703, -0.3144626, 0.1176471, 0, 1, 1,
0.5476808, 1.296076, 1.337611, 0.1215686, 0, 1, 1,
0.5511709, -0.578611, 3.763984, 0.1294118, 0, 1, 1,
0.5522386, -0.3863813, 1.119289, 0.1333333, 0, 1, 1,
0.5523881, 0.8046175, 1.556875, 0.1411765, 0, 1, 1,
0.5529352, 0.1988561, 2.921781, 0.145098, 0, 1, 1,
0.5532013, 2.220387, -0.2444313, 0.1529412, 0, 1, 1,
0.5548522, 0.8281972, 0.08439658, 0.1568628, 0, 1, 1,
0.5577109, 1.298077, -0.4726227, 0.1647059, 0, 1, 1,
0.5636185, 0.05175113, 1.252387, 0.1686275, 0, 1, 1,
0.5642689, 0.7925565, 0.7384349, 0.1764706, 0, 1, 1,
0.5644896, 0.5251813, 2.026687, 0.1803922, 0, 1, 1,
0.5649875, 0.5046946, 0.3445241, 0.1882353, 0, 1, 1,
0.56521, -0.07469682, 2.760333, 0.1921569, 0, 1, 1,
0.5666064, -0.6511848, 2.094126, 0.2, 0, 1, 1,
0.5669191, -0.4015899, 2.073413, 0.2078431, 0, 1, 1,
0.5711489, -0.9129642, 1.885908, 0.2117647, 0, 1, 1,
0.575597, -1.188941, 2.885767, 0.2196078, 0, 1, 1,
0.5756776, 0.3153945, 0.8538805, 0.2235294, 0, 1, 1,
0.5801294, -0.2170967, 1.513087, 0.2313726, 0, 1, 1,
0.5807298, -0.5469874, 3.226616, 0.2352941, 0, 1, 1,
0.5821581, -0.7543263, 2.479462, 0.2431373, 0, 1, 1,
0.5853881, -1.202523, 2.625319, 0.2470588, 0, 1, 1,
0.5902113, 0.6709047, 0.6250159, 0.254902, 0, 1, 1,
0.5916484, 1.117654, 1.904437, 0.2588235, 0, 1, 1,
0.5926281, -0.1260473, 1.641555, 0.2666667, 0, 1, 1,
0.5927464, 1.282163, -0.7599542, 0.2705882, 0, 1, 1,
0.5946779, -0.9277835, 2.34677, 0.2784314, 0, 1, 1,
0.5956864, -1.17243, 1.818617, 0.282353, 0, 1, 1,
0.5969632, -1.135729, 2.517876, 0.2901961, 0, 1, 1,
0.6036276, 0.0195065, 1.862247, 0.2941177, 0, 1, 1,
0.6045842, -0.5598849, 1.085631, 0.3019608, 0, 1, 1,
0.6085558, 1.10971, 0.8680613, 0.3098039, 0, 1, 1,
0.6127976, 0.2737211, -0.02298666, 0.3137255, 0, 1, 1,
0.6144894, -0.01243801, 2.481934, 0.3215686, 0, 1, 1,
0.616111, -0.03288338, -0.171473, 0.3254902, 0, 1, 1,
0.6204273, -0.7603028, 1.748307, 0.3333333, 0, 1, 1,
0.6219421, 2.238382, 0.7075713, 0.3372549, 0, 1, 1,
0.6227407, 0.555728, 0.725469, 0.345098, 0, 1, 1,
0.6240612, 1.206775, 0.132361, 0.3490196, 0, 1, 1,
0.6317598, -0.03853459, -0.009932188, 0.3568628, 0, 1, 1,
0.6403834, 1.440542, 0.9942225, 0.3607843, 0, 1, 1,
0.6407675, -0.4490967, 2.384608, 0.3686275, 0, 1, 1,
0.6422585, -0.1135542, 3.028338, 0.372549, 0, 1, 1,
0.6426497, 0.1481664, 4.287204, 0.3803922, 0, 1, 1,
0.6431156, -1.503354, 4.233718, 0.3843137, 0, 1, 1,
0.6436248, 1.429114, 0.5571117, 0.3921569, 0, 1, 1,
0.6442465, 0.3346792, -0.3930489, 0.3960784, 0, 1, 1,
0.6507613, 1.010625, 1.118871, 0.4039216, 0, 1, 1,
0.6547136, 0.0587027, 1.50312, 0.4117647, 0, 1, 1,
0.6608632, 0.5602764, 0.8638934, 0.4156863, 0, 1, 1,
0.6608762, 0.125865, 2.371666, 0.4235294, 0, 1, 1,
0.6611213, 1.249054, -0.304496, 0.427451, 0, 1, 1,
0.6621093, 1.094307, 3.083772, 0.4352941, 0, 1, 1,
0.6711875, 0.995556, -1.130349, 0.4392157, 0, 1, 1,
0.6730939, 0.6225117, 1.164312, 0.4470588, 0, 1, 1,
0.685829, 0.4224935, 0.1674631, 0.4509804, 0, 1, 1,
0.6858314, 0.7398325, 0.9067912, 0.4588235, 0, 1, 1,
0.6860816, -0.39621, 2.187983, 0.4627451, 0, 1, 1,
0.6926973, 0.06562141, 2.257096, 0.4705882, 0, 1, 1,
0.6930884, -0.04939665, 1.378439, 0.4745098, 0, 1, 1,
0.6936578, 1.414692, 0.6675386, 0.4823529, 0, 1, 1,
0.6946451, -0.1497987, 2.159996, 0.4862745, 0, 1, 1,
0.6957915, 0.1655894, 0.8605868, 0.4941176, 0, 1, 1,
0.6972091, -1.468113, 2.093182, 0.5019608, 0, 1, 1,
0.6993837, -1.633788, 2.481565, 0.5058824, 0, 1, 1,
0.7003899, -0.3203541, 0.4364019, 0.5137255, 0, 1, 1,
0.7065184, 2.72715, 1.807728, 0.5176471, 0, 1, 1,
0.7067934, 0.4836426, 0.2719766, 0.5254902, 0, 1, 1,
0.7122282, 0.1693565, 0.9249593, 0.5294118, 0, 1, 1,
0.7126935, 1.344018, -0.2788424, 0.5372549, 0, 1, 1,
0.7171223, -0.9747594, 2.098807, 0.5411765, 0, 1, 1,
0.7171957, -0.5830733, 1.446678, 0.5490196, 0, 1, 1,
0.7226862, 0.03365605, -0.2606526, 0.5529412, 0, 1, 1,
0.7232304, -1.288225, 4.36465, 0.5607843, 0, 1, 1,
0.7232837, 0.1957203, 1.570663, 0.5647059, 0, 1, 1,
0.7257689, -0.2948349, 0.9586891, 0.572549, 0, 1, 1,
0.727266, 0.6145452, 0.1536396, 0.5764706, 0, 1, 1,
0.7281724, 0.8165528, 1.950473, 0.5843138, 0, 1, 1,
0.7291535, 0.2942784, 1.346462, 0.5882353, 0, 1, 1,
0.7342973, 0.2470686, 1.114964, 0.5960785, 0, 1, 1,
0.7353527, -0.2044907, 2.069427, 0.6039216, 0, 1, 1,
0.7371628, 0.9184131, -0.3986746, 0.6078432, 0, 1, 1,
0.7437028, -1.732677, 2.354163, 0.6156863, 0, 1, 1,
0.7460402, -0.6933522, 0.9269478, 0.6196079, 0, 1, 1,
0.7489721, -0.4213064, 1.441958, 0.627451, 0, 1, 1,
0.7538455, -0.3909262, 0.399264, 0.6313726, 0, 1, 1,
0.7557692, -0.7331747, 2.964649, 0.6392157, 0, 1, 1,
0.7562372, -1.134108, 3.48836, 0.6431373, 0, 1, 1,
0.761851, 1.904558, 0.04302943, 0.6509804, 0, 1, 1,
0.762145, -0.8959323, 2.39031, 0.654902, 0, 1, 1,
0.7640271, -0.7096038, 1.765931, 0.6627451, 0, 1, 1,
0.7651212, 0.8175042, -0.6811659, 0.6666667, 0, 1, 1,
0.7710825, 1.749609, 3.268967, 0.6745098, 0, 1, 1,
0.7740555, 0.8026816, 0.4293694, 0.6784314, 0, 1, 1,
0.7746065, -0.2681386, 1.869762, 0.6862745, 0, 1, 1,
0.7808626, -0.9239931, 4.323427, 0.6901961, 0, 1, 1,
0.7869542, 0.814858, 0.2731762, 0.6980392, 0, 1, 1,
0.7899353, -1.387672, 2.604624, 0.7058824, 0, 1, 1,
0.7921079, -0.1527017, 0.5126133, 0.7098039, 0, 1, 1,
0.7953398, -0.2239758, 2.794456, 0.7176471, 0, 1, 1,
0.7987862, 1.089595, 1.818576, 0.7215686, 0, 1, 1,
0.8018019, -1.650881, 2.092445, 0.7294118, 0, 1, 1,
0.8102118, -0.0974199, 1.574502, 0.7333333, 0, 1, 1,
0.8164639, -1.460045, 1.99716, 0.7411765, 0, 1, 1,
0.8187692, 1.739964, -0.1541203, 0.7450981, 0, 1, 1,
0.8226003, -0.1551759, 1.409923, 0.7529412, 0, 1, 1,
0.8288203, 1.180149, 1.306558, 0.7568628, 0, 1, 1,
0.8308905, 1.47255, 0.9920155, 0.7647059, 0, 1, 1,
0.8311894, -1.022958, 1.407997, 0.7686275, 0, 1, 1,
0.8339218, -1.203368, 3.811104, 0.7764706, 0, 1, 1,
0.8366197, -1.364275, 3.662214, 0.7803922, 0, 1, 1,
0.8372874, -0.3981797, 3.076769, 0.7882353, 0, 1, 1,
0.8679615, 0.07699253, 2.467335, 0.7921569, 0, 1, 1,
0.8684894, -0.02747413, 2.667969, 0.8, 0, 1, 1,
0.8702444, -1.033757, 1.051861, 0.8078431, 0, 1, 1,
0.8721061, 1.365063, 2.471622, 0.8117647, 0, 1, 1,
0.8764169, 0.2338915, 2.464379, 0.8196079, 0, 1, 1,
0.8773844, -0.1288054, 1.090852, 0.8235294, 0, 1, 1,
0.8841178, 0.2678429, 1.972315, 0.8313726, 0, 1, 1,
0.8872149, -2.102147, 0.5827083, 0.8352941, 0, 1, 1,
0.8912072, 0.6416036, 2.442498, 0.8431373, 0, 1, 1,
0.8947265, 0.6041479, 1.877433, 0.8470588, 0, 1, 1,
0.8962572, 0.751695, 1.188263, 0.854902, 0, 1, 1,
0.8983377, -0.3644133, 0.7940428, 0.8588235, 0, 1, 1,
0.9022849, 1.397814, 2.09054, 0.8666667, 0, 1, 1,
0.9052458, 0.7222363, 1.550389, 0.8705882, 0, 1, 1,
0.9063728, 2.000249, 1.798684, 0.8784314, 0, 1, 1,
0.9076798, -0.0786109, 2.275947, 0.8823529, 0, 1, 1,
0.9085374, 0.4516914, 0.5591385, 0.8901961, 0, 1, 1,
0.9096181, -0.3933949, 2.815694, 0.8941177, 0, 1, 1,
0.9124537, 0.184814, 0.676926, 0.9019608, 0, 1, 1,
0.9142444, 1.310465, 1.386024, 0.9098039, 0, 1, 1,
0.9182705, -0.02722342, 0.5524848, 0.9137255, 0, 1, 1,
0.9202284, 0.2120963, 0.6235594, 0.9215686, 0, 1, 1,
0.9203692, -0.5886818, 3.649351, 0.9254902, 0, 1, 1,
0.9215965, 0.9490464, 1.353728, 0.9333333, 0, 1, 1,
0.9243737, -0.1270178, 1.319741, 0.9372549, 0, 1, 1,
0.9250349, -0.3075496, 0.4904379, 0.945098, 0, 1, 1,
0.9367878, 1.050422, 0.4465768, 0.9490196, 0, 1, 1,
0.9395965, -2.105418, 2.220295, 0.9568627, 0, 1, 1,
0.9404349, 1.580386, 1.358572, 0.9607843, 0, 1, 1,
0.9431191, -1.067898, 1.226373, 0.9686275, 0, 1, 1,
0.9474887, -0.6260442, 1.669528, 0.972549, 0, 1, 1,
0.948976, -0.5848847, 1.952014, 0.9803922, 0, 1, 1,
0.9499903, -0.08965337, 0.4734431, 0.9843137, 0, 1, 1,
0.9523706, 0.6582361, 1.072642, 0.9921569, 0, 1, 1,
0.9581668, -0.8636217, 1.949091, 0.9960784, 0, 1, 1,
0.9610585, -0.8254238, 3.563517, 1, 0, 0.9960784, 1,
0.9649727, 0.9498617, 2.869263, 1, 0, 0.9882353, 1,
0.966301, 0.7533628, 0.9964895, 1, 0, 0.9843137, 1,
0.9671487, -0.3612395, 2.351609, 1, 0, 0.9764706, 1,
0.9814665, 0.1096094, 1.989543, 1, 0, 0.972549, 1,
0.9821939, -1.275288, 3.308125, 1, 0, 0.9647059, 1,
0.9847171, 1.151018, -1.196114, 1, 0, 0.9607843, 1,
0.988561, 0.3790268, 0.7930334, 1, 0, 0.9529412, 1,
0.9898964, 1.410796, 1.25262, 1, 0, 0.9490196, 1,
0.9957487, 1.518953, 0.9969913, 1, 0, 0.9411765, 1,
0.9983495, -1.07504, 2.248772, 1, 0, 0.9372549, 1,
1.004205, -1.157441, 3.207599, 1, 0, 0.9294118, 1,
1.00806, 1.443874, -1.062644, 1, 0, 0.9254902, 1,
1.023294, -1.605329, 2.242182, 1, 0, 0.9176471, 1,
1.023862, -1.119897, 2.637776, 1, 0, 0.9137255, 1,
1.032566, -0.9717982, 2.146548, 1, 0, 0.9058824, 1,
1.033408, 0.5955302, -0.7306876, 1, 0, 0.9019608, 1,
1.048841, 1.084111, 0.2250713, 1, 0, 0.8941177, 1,
1.057103, -1.978478, 2.525535, 1, 0, 0.8862745, 1,
1.068426, -0.358144, 2.526014, 1, 0, 0.8823529, 1,
1.070815, 0.5632715, 0.287757, 1, 0, 0.8745098, 1,
1.072407, -0.4343973, 1.92604, 1, 0, 0.8705882, 1,
1.072788, -0.8348485, 2.29108, 1, 0, 0.8627451, 1,
1.07393, 0.2523793, 2.047032, 1, 0, 0.8588235, 1,
1.078564, 0.7773477, 1.598673, 1, 0, 0.8509804, 1,
1.083781, 0.1987925, 1.27808, 1, 0, 0.8470588, 1,
1.086795, -1.026722, 2.037762, 1, 0, 0.8392157, 1,
1.093771, 0.2749819, -0.08800063, 1, 0, 0.8352941, 1,
1.095889, 0.2101959, 0.5942608, 1, 0, 0.827451, 1,
1.104369, 0.9672189, 0.8751417, 1, 0, 0.8235294, 1,
1.117008, -1.327537, 2.769705, 1, 0, 0.8156863, 1,
1.124914, 0.5127295, 1.349077, 1, 0, 0.8117647, 1,
1.127307, 0.116005, 1.056653, 1, 0, 0.8039216, 1,
1.135593, -0.5535029, 0.8251317, 1, 0, 0.7960784, 1,
1.135985, 0.2402715, 2.422695, 1, 0, 0.7921569, 1,
1.140938, -0.07257359, 0.3904817, 1, 0, 0.7843137, 1,
1.142782, -0.296413, 2.059744, 1, 0, 0.7803922, 1,
1.14465, -1.287222, 2.133769, 1, 0, 0.772549, 1,
1.148728, -3.239958, 1.903118, 1, 0, 0.7686275, 1,
1.150292, 2.203912, 0.2347334, 1, 0, 0.7607843, 1,
1.157111, -0.7940697, 0.348911, 1, 0, 0.7568628, 1,
1.162471, 0.2737941, 1.499089, 1, 0, 0.7490196, 1,
1.170188, -0.9565777, 1.683142, 1, 0, 0.7450981, 1,
1.180411, 0.6670341, 2.032765, 1, 0, 0.7372549, 1,
1.195854, 2.241638, 0.01368974, 1, 0, 0.7333333, 1,
1.196851, -0.4859653, 3.14456, 1, 0, 0.7254902, 1,
1.199757, 1.207798, -0.1870175, 1, 0, 0.7215686, 1,
1.2012, -0.9878562, 2.757008, 1, 0, 0.7137255, 1,
1.207273, 0.122798, 4.364628, 1, 0, 0.7098039, 1,
1.21455, 0.6149256, 2.545126, 1, 0, 0.7019608, 1,
1.217788, -0.8718879, 2.10868, 1, 0, 0.6941177, 1,
1.218733, 0.02203948, 1.828729, 1, 0, 0.6901961, 1,
1.222435, -1.285327, 1.757261, 1, 0, 0.682353, 1,
1.225616, 1.134027, 1.401678, 1, 0, 0.6784314, 1,
1.226485, -0.0878237, 2.90722, 1, 0, 0.6705883, 1,
1.229887, 0.2931853, 0.08401612, 1, 0, 0.6666667, 1,
1.237984, 1.342805, 1.243948, 1, 0, 0.6588235, 1,
1.23899, -0.4900632, 1.150113, 1, 0, 0.654902, 1,
1.245384, 0.1571696, 2.195208, 1, 0, 0.6470588, 1,
1.250908, -0.3801055, 1.064142, 1, 0, 0.6431373, 1,
1.251067, 0.4683873, -0.06363685, 1, 0, 0.6352941, 1,
1.254776, 0.7325097, 2.322402, 1, 0, 0.6313726, 1,
1.259047, -3.464035, 3.593156, 1, 0, 0.6235294, 1,
1.261726, -0.3705162, 0.9046434, 1, 0, 0.6196079, 1,
1.267798, 0.07378696, 0.1433576, 1, 0, 0.6117647, 1,
1.267903, 0.9592339, 1.565911, 1, 0, 0.6078432, 1,
1.273653, -0.6321276, 1.334278, 1, 0, 0.6, 1,
1.274275, 1.133551, -0.6252807, 1, 0, 0.5921569, 1,
1.297389, 0.7788318, 1.609131, 1, 0, 0.5882353, 1,
1.319047, -0.1599094, 4.154676, 1, 0, 0.5803922, 1,
1.3212, 0.8348635, 2.321322, 1, 0, 0.5764706, 1,
1.326712, -1.239612, 2.177147, 1, 0, 0.5686275, 1,
1.328294, 1.406722, -0.7769436, 1, 0, 0.5647059, 1,
1.333058, -1.38262, 2.657775, 1, 0, 0.5568628, 1,
1.334407, 0.3346753, 1.071571, 1, 0, 0.5529412, 1,
1.343247, 0.1434746, 1.441867, 1, 0, 0.5450981, 1,
1.349651, -0.9256206, 2.693589, 1, 0, 0.5411765, 1,
1.352541, -0.367944, 2.791729, 1, 0, 0.5333334, 1,
1.353035, -1.064296, 2.397079, 1, 0, 0.5294118, 1,
1.37001, -0.2820837, 2.814053, 1, 0, 0.5215687, 1,
1.373579, 1.676214, 1.561398, 1, 0, 0.5176471, 1,
1.379958, -0.7392418, 1.121636, 1, 0, 0.509804, 1,
1.380759, -0.412584, 1.755919, 1, 0, 0.5058824, 1,
1.381495, 1.825407, 0.9776697, 1, 0, 0.4980392, 1,
1.384894, -0.385447, 1.266027, 1, 0, 0.4901961, 1,
1.385938, -0.5075257, -0.3372055, 1, 0, 0.4862745, 1,
1.390359, -0.8108487, 2.054427, 1, 0, 0.4784314, 1,
1.397857, 1.005636, 2.230659, 1, 0, 0.4745098, 1,
1.427883, -0.8927421, 1.456224, 1, 0, 0.4666667, 1,
1.44567, 0.195626, 1.034117, 1, 0, 0.4627451, 1,
1.448155, -0.2468887, 1.651521, 1, 0, 0.454902, 1,
1.471829, -2.336825, 0.8468911, 1, 0, 0.4509804, 1,
1.47382, -0.7126962, 3.902291, 1, 0, 0.4431373, 1,
1.474386, 0.4260255, 1.352182, 1, 0, 0.4392157, 1,
1.505415, -0.1724093, 1.534445, 1, 0, 0.4313726, 1,
1.505945, -1.259469, 3.304568, 1, 0, 0.427451, 1,
1.507064, -0.9403686, 0.7403744, 1, 0, 0.4196078, 1,
1.515373, 1.178327, 0.228146, 1, 0, 0.4156863, 1,
1.517354, 1.513999, 1.17606, 1, 0, 0.4078431, 1,
1.545743, -1.059449, 2.177855, 1, 0, 0.4039216, 1,
1.554912, 0.7685939, 2.847632, 1, 0, 0.3960784, 1,
1.555718, 0.1345728, 0.06312235, 1, 0, 0.3882353, 1,
1.556783, 1.646228, 0.03819734, 1, 0, 0.3843137, 1,
1.564186, -0.5024981, 1.990429, 1, 0, 0.3764706, 1,
1.598463, -0.3574256, 1.513477, 1, 0, 0.372549, 1,
1.605034, -1.461773, 2.25089, 1, 0, 0.3647059, 1,
1.616563, 0.52218, 1.79373, 1, 0, 0.3607843, 1,
1.626767, 1.247632, 1.16675, 1, 0, 0.3529412, 1,
1.633778, -1.449394, 2.21013, 1, 0, 0.3490196, 1,
1.634321, 0.12384, 1.700808, 1, 0, 0.3411765, 1,
1.636476, -0.6022906, 2.520264, 1, 0, 0.3372549, 1,
1.645737, 0.7314286, 0.2555714, 1, 0, 0.3294118, 1,
1.665476, -0.7032448, 1.839924, 1, 0, 0.3254902, 1,
1.672112, -0.6249278, 1.930887, 1, 0, 0.3176471, 1,
1.684559, -1.485002, 2.297262, 1, 0, 0.3137255, 1,
1.694246, -0.130516, 2.066121, 1, 0, 0.3058824, 1,
1.720354, -0.5957028, 0.3302246, 1, 0, 0.2980392, 1,
1.725376, 0.5526637, 1.7645, 1, 0, 0.2941177, 1,
1.765795, 0.419339, 0.5194027, 1, 0, 0.2862745, 1,
1.772596, -0.710337, 1.263314, 1, 0, 0.282353, 1,
1.792367, 0.2439425, -0.3913445, 1, 0, 0.2745098, 1,
1.793788, 1.258362, 2.553987, 1, 0, 0.2705882, 1,
1.79648, -1.02605, 1.42632, 1, 0, 0.2627451, 1,
1.80311, -0.8534917, 1.777392, 1, 0, 0.2588235, 1,
1.811689, -0.03934625, 2.713406, 1, 0, 0.2509804, 1,
1.824327, 1.777858, -0.4798872, 1, 0, 0.2470588, 1,
1.828793, -1.099783, 2.033043, 1, 0, 0.2392157, 1,
1.831876, 0.3435078, 0.431158, 1, 0, 0.2352941, 1,
1.833645, 0.9393628, 1.022259, 1, 0, 0.227451, 1,
1.846726, -0.1347494, 2.587067, 1, 0, 0.2235294, 1,
1.876767, 1.77691, 0.919311, 1, 0, 0.2156863, 1,
1.884707, -0.2575266, 2.900962, 1, 0, 0.2117647, 1,
1.893095, 2.596132, 0.2488979, 1, 0, 0.2039216, 1,
1.901583, 0.07312639, 0.9915883, 1, 0, 0.1960784, 1,
1.902498, 0.122248, 0.3963102, 1, 0, 0.1921569, 1,
1.933487, 0.6414933, 0.2159733, 1, 0, 0.1843137, 1,
1.952076, 0.1226267, 2.955645, 1, 0, 0.1803922, 1,
1.996341, 0.6501918, 0.3630026, 1, 0, 0.172549, 1,
2.0441, -0.8984078, 1.416525, 1, 0, 0.1686275, 1,
2.052128, 2.68701, 0.1848139, 1, 0, 0.1607843, 1,
2.078598, 0.2884335, 1.613018, 1, 0, 0.1568628, 1,
2.107899, 0.2790619, 0.8202751, 1, 0, 0.1490196, 1,
2.112425, 0.7813411, 1.236863, 1, 0, 0.145098, 1,
2.114279, 0.003300709, 3.149133, 1, 0, 0.1372549, 1,
2.138882, -0.4184557, 0.75058, 1, 0, 0.1333333, 1,
2.155823, 0.1251891, 1.222609, 1, 0, 0.1254902, 1,
2.186711, 0.8102187, 0.5509401, 1, 0, 0.1215686, 1,
2.189193, 0.4836104, 1.966432, 1, 0, 0.1137255, 1,
2.215917, 0.3130095, 0.2333395, 1, 0, 0.1098039, 1,
2.233811, 1.428172, 1.099434, 1, 0, 0.1019608, 1,
2.259556, -0.5230632, 2.970233, 1, 0, 0.09411765, 1,
2.277151, 1.601119, 2.478054, 1, 0, 0.09019608, 1,
2.323495, -0.3360674, 2.262965, 1, 0, 0.08235294, 1,
2.346226, 0.4506932, 2.991785, 1, 0, 0.07843138, 1,
2.348023, 0.2973732, 4.235589, 1, 0, 0.07058824, 1,
2.349667, -0.8512292, 1.386361, 1, 0, 0.06666667, 1,
2.35514, -0.2755724, 4.090408, 1, 0, 0.05882353, 1,
2.365633, 0.6602831, 3.183073, 1, 0, 0.05490196, 1,
2.412779, -0.4574675, 2.180649, 1, 0, 0.04705882, 1,
2.428361, 1.282885, 0.2204625, 1, 0, 0.04313726, 1,
2.458349, -1.473385, 2.448315, 1, 0, 0.03529412, 1,
2.48375, -0.0345409, 0.6180212, 1, 0, 0.03137255, 1,
2.527153, -1.579292, 1.615842, 1, 0, 0.02352941, 1,
2.543782, -2.264007, 1.200192, 1, 0, 0.01960784, 1,
2.60937, 1.654216, 0.2929311, 1, 0, 0.01176471, 1,
2.989614, -1.743095, 0.0844257, 1, 0, 0.007843138, 1
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
-0.003093958, -4.616165, -7.18925, 0, -0.5, 0.5, 0.5,
-0.003093958, -4.616165, -7.18925, 1, -0.5, 0.5, 0.5,
-0.003093958, -4.616165, -7.18925, 1, 1.5, 0.5, 0.5,
-0.003093958, -4.616165, -7.18925, 0, 1.5, 0.5, 0.5
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
-4.01033, -0.06542134, -7.18925, 0, -0.5, 0.5, 0.5,
-4.01033, -0.06542134, -7.18925, 1, -0.5, 0.5, 0.5,
-4.01033, -0.06542134, -7.18925, 1, 1.5, 0.5, 0.5,
-4.01033, -0.06542134, -7.18925, 0, 1.5, 0.5, 0.5
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
-4.01033, -4.616165, -0.01486206, 0, -0.5, 0.5, 0.5,
-4.01033, -4.616165, -0.01486206, 1, -0.5, 0.5, 0.5,
-4.01033, -4.616165, -0.01486206, 1, 1.5, 0.5, 0.5,
-4.01033, -4.616165, -0.01486206, 0, 1.5, 0.5, 0.5
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
-2, -3.565994, -5.533622,
2, -3.565994, -5.533622,
-2, -3.565994, -5.533622,
-2, -3.741022, -5.80956,
-1, -3.565994, -5.533622,
-1, -3.741022, -5.80956,
0, -3.565994, -5.533622,
0, -3.741022, -5.80956,
1, -3.565994, -5.533622,
1, -3.741022, -5.80956,
2, -3.565994, -5.533622,
2, -3.741022, -5.80956
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
-2, -4.09108, -6.361436, 0, -0.5, 0.5, 0.5,
-2, -4.09108, -6.361436, 1, -0.5, 0.5, 0.5,
-2, -4.09108, -6.361436, 1, 1.5, 0.5, 0.5,
-2, -4.09108, -6.361436, 0, 1.5, 0.5, 0.5,
-1, -4.09108, -6.361436, 0, -0.5, 0.5, 0.5,
-1, -4.09108, -6.361436, 1, -0.5, 0.5, 0.5,
-1, -4.09108, -6.361436, 1, 1.5, 0.5, 0.5,
-1, -4.09108, -6.361436, 0, 1.5, 0.5, 0.5,
0, -4.09108, -6.361436, 0, -0.5, 0.5, 0.5,
0, -4.09108, -6.361436, 1, -0.5, 0.5, 0.5,
0, -4.09108, -6.361436, 1, 1.5, 0.5, 0.5,
0, -4.09108, -6.361436, 0, 1.5, 0.5, 0.5,
1, -4.09108, -6.361436, 0, -0.5, 0.5, 0.5,
1, -4.09108, -6.361436, 1, -0.5, 0.5, 0.5,
1, -4.09108, -6.361436, 1, 1.5, 0.5, 0.5,
1, -4.09108, -6.361436, 0, 1.5, 0.5, 0.5,
2, -4.09108, -6.361436, 0, -0.5, 0.5, 0.5,
2, -4.09108, -6.361436, 1, -0.5, 0.5, 0.5,
2, -4.09108, -6.361436, 1, 1.5, 0.5, 0.5,
2, -4.09108, -6.361436, 0, 1.5, 0.5, 0.5
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
-3.085583, -3, -5.533622,
-3.085583, 3, -5.533622,
-3.085583, -3, -5.533622,
-3.239708, -3, -5.80956,
-3.085583, -2, -5.533622,
-3.239708, -2, -5.80956,
-3.085583, -1, -5.533622,
-3.239708, -1, -5.80956,
-3.085583, 0, -5.533622,
-3.239708, 0, -5.80956,
-3.085583, 1, -5.533622,
-3.239708, 1, -5.80956,
-3.085583, 2, -5.533622,
-3.239708, 2, -5.80956,
-3.085583, 3, -5.533622,
-3.239708, 3, -5.80956
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
-3.547956, -3, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, -3, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, -3, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, -3, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, -2, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, -2, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, -2, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, -2, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, -1, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, -1, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, -1, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, -1, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, 0, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, 0, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, 0, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, 0, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, 1, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, 1, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, 1, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, 1, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, 2, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, 2, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, 2, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, 2, -6.361436, 0, 1.5, 0.5, 0.5,
-3.547956, 3, -6.361436, 0, -0.5, 0.5, 0.5,
-3.547956, 3, -6.361436, 1, -0.5, 0.5, 0.5,
-3.547956, 3, -6.361436, 1, 1.5, 0.5, 0.5,
-3.547956, 3, -6.361436, 0, 1.5, 0.5, 0.5
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
-3.085583, -3.565994, -4,
-3.085583, -3.565994, 4,
-3.085583, -3.565994, -4,
-3.239708, -3.741022, -4,
-3.085583, -3.565994, -2,
-3.239708, -3.741022, -2,
-3.085583, -3.565994, 0,
-3.239708, -3.741022, 0,
-3.085583, -3.565994, 2,
-3.239708, -3.741022, 2,
-3.085583, -3.565994, 4,
-3.239708, -3.741022, 4
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
-3.547956, -4.09108, -4, 0, -0.5, 0.5, 0.5,
-3.547956, -4.09108, -4, 1, -0.5, 0.5, 0.5,
-3.547956, -4.09108, -4, 1, 1.5, 0.5, 0.5,
-3.547956, -4.09108, -4, 0, 1.5, 0.5, 0.5,
-3.547956, -4.09108, -2, 0, -0.5, 0.5, 0.5,
-3.547956, -4.09108, -2, 1, -0.5, 0.5, 0.5,
-3.547956, -4.09108, -2, 1, 1.5, 0.5, 0.5,
-3.547956, -4.09108, -2, 0, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 0, 0, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 0, 1, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 0, 1, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 0, 0, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 2, 0, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 2, 1, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 2, 1, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 2, 0, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 4, 0, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 4, 1, -0.5, 0.5, 0.5,
-3.547956, -4.09108, 4, 1, 1.5, 0.5, 0.5,
-3.547956, -4.09108, 4, 0, 1.5, 0.5, 0.5
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
-3.085583, -3.565994, -5.533622,
-3.085583, 3.435151, -5.533622,
-3.085583, -3.565994, 5.503898,
-3.085583, 3.435151, 5.503898,
-3.085583, -3.565994, -5.533622,
-3.085583, -3.565994, 5.503898,
-3.085583, 3.435151, -5.533622,
-3.085583, 3.435151, 5.503898,
-3.085583, -3.565994, -5.533622,
3.079395, -3.565994, -5.533622,
-3.085583, -3.565994, 5.503898,
3.079395, -3.565994, 5.503898,
-3.085583, 3.435151, -5.533622,
3.079395, 3.435151, -5.533622,
-3.085583, 3.435151, 5.503898,
3.079395, 3.435151, 5.503898,
3.079395, -3.565994, -5.533622,
3.079395, 3.435151, -5.533622,
3.079395, -3.565994, 5.503898,
3.079395, 3.435151, 5.503898,
3.079395, -3.565994, -5.533622,
3.079395, -3.565994, 5.503898,
3.079395, 3.435151, -5.533622,
3.079395, 3.435151, 5.503898
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
var radius = 7.716894;
var distance = 34.33334;
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
mvMatrix.translate( 0.003093958, 0.06542134, 0.01486206 );
mvMatrix.scale( 1.353396, 1.191756, 0.7559358 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33334);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
avermectin_B1b<-read.table("avermectin_B1b.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-avermectin_B1b$V2
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
```

```r
y<-avermectin_B1b$V3
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
```

```r
z<-avermectin_B1b$V4
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1b' not found
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
-2.995802, -1.01218, -2.328933, 0, 0, 1, 1, 1,
-2.873378, -1.138299, 0.004282676, 1, 0, 0, 1, 1,
-2.859893, 0.8918245, -1.716741, 1, 0, 0, 1, 1,
-2.847723, 0.6966574, -1.511072, 1, 0, 0, 1, 1,
-2.801798, -0.009442206, 0.0753058, 1, 0, 0, 1, 1,
-2.674765, 0.244014, -1.28167, 1, 0, 0, 1, 1,
-2.652398, 0.7662354, -0.8717845, 0, 0, 0, 1, 1,
-2.492511, 1.762604, -2.33487, 0, 0, 0, 1, 1,
-2.488378, -0.4317541, -2.446907, 0, 0, 0, 1, 1,
-2.451603, -0.4713524, -3.181859, 0, 0, 0, 1, 1,
-2.429749, 0.7406114, -0.5760757, 0, 0, 0, 1, 1,
-2.323906, -1.431204, -2.940177, 0, 0, 0, 1, 1,
-2.281659, 0.06327339, -1.646832, 0, 0, 0, 1, 1,
-2.277932, -1.558104, -2.203309, 1, 1, 1, 1, 1,
-2.265149, 0.4626685, -2.288953, 1, 1, 1, 1, 1,
-2.260874, 0.7688439, -2.631787, 1, 1, 1, 1, 1,
-2.220397, -0.5757318, -3.117259, 1, 1, 1, 1, 1,
-2.179814, -0.4181807, -3.893565, 1, 1, 1, 1, 1,
-2.106174, 0.2341775, -1.843351, 1, 1, 1, 1, 1,
-2.104156, -1.510563, -3.810924, 1, 1, 1, 1, 1,
-2.077592, -1.661883, -4.156375, 1, 1, 1, 1, 1,
-2.077202, -0.4109635, -1.781366, 1, 1, 1, 1, 1,
-2.056077, 0.2046047, -0.1917787, 1, 1, 1, 1, 1,
-2.045809, 0.1406307, -1.571941, 1, 1, 1, 1, 1,
-2.041914, 0.3108789, -1.524799, 1, 1, 1, 1, 1,
-2.030608, 0.2919318, -1.130562, 1, 1, 1, 1, 1,
-2.030145, -1.759589, -0.7790846, 1, 1, 1, 1, 1,
-1.986379, 0.5222793, -1.698829, 1, 1, 1, 1, 1,
-1.889187, -1.151723, -2.330085, 0, 0, 1, 1, 1,
-1.870194, -0.6575607, -3.754678, 1, 0, 0, 1, 1,
-1.852046, 0.1095985, -0.5588715, 1, 0, 0, 1, 1,
-1.845342, -1.031587, -0.7872276, 1, 0, 0, 1, 1,
-1.832116, -0.578877, -2.217237, 1, 0, 0, 1, 1,
-1.828297, 0.1054941, -1.300575, 1, 0, 0, 1, 1,
-1.811669, -0.1703247, -1.641196, 0, 0, 0, 1, 1,
-1.79105, 0.2758921, -1.77647, 0, 0, 0, 1, 1,
-1.790328, 0.3099144, -1.914496, 0, 0, 0, 1, 1,
-1.768762, 0.6505211, -0.8753023, 0, 0, 0, 1, 1,
-1.763212, 0.1813173, -1.84116, 0, 0, 0, 1, 1,
-1.723014, -0.3613392, -2.099332, 0, 0, 0, 1, 1,
-1.721059, -1.134246, -2.669082, 0, 0, 0, 1, 1,
-1.710671, 3.118797, 0.01474862, 1, 1, 1, 1, 1,
-1.700856, 1.422816, -1.100544, 1, 1, 1, 1, 1,
-1.673729, -0.8026677, -2.411287, 1, 1, 1, 1, 1,
-1.638815, 0.2331444, -2.335571, 1, 1, 1, 1, 1,
-1.631299, 0.7461564, -2.060209, 1, 1, 1, 1, 1,
-1.62506, -0.6124794, -2.054954, 1, 1, 1, 1, 1,
-1.617181, 0.2377659, -1.829034, 1, 1, 1, 1, 1,
-1.602949, 0.5275559, 0.7220008, 1, 1, 1, 1, 1,
-1.592827, 1.409254, -1.36246, 1, 1, 1, 1, 1,
-1.584086, -0.9993003, -3.53815, 1, 1, 1, 1, 1,
-1.572369, 0.03697212, -1.383878, 1, 1, 1, 1, 1,
-1.57033, -0.5362139, -4.419463, 1, 1, 1, 1, 1,
-1.55491, 0.1454776, -0.7895521, 1, 1, 1, 1, 1,
-1.534464, -0.8186684, -3.839727, 1, 1, 1, 1, 1,
-1.525653, -0.1312288, -0.1565299, 1, 1, 1, 1, 1,
-1.525216, 1.505789, -0.8220508, 0, 0, 1, 1, 1,
-1.524111, 1.091088, -2.938704, 1, 0, 0, 1, 1,
-1.513369, -0.6474763, -2.200948, 1, 0, 0, 1, 1,
-1.511121, 0.4090792, -0.3679059, 1, 0, 0, 1, 1,
-1.492891, -0.04433837, -1.283478, 1, 0, 0, 1, 1,
-1.490797, 2.171381, -0.9989412, 1, 0, 0, 1, 1,
-1.488381, -0.366998, -1.576442, 0, 0, 0, 1, 1,
-1.483126, -0.3119305, -0.5525486, 0, 0, 0, 1, 1,
-1.470477, 1.946816, -1.716165, 0, 0, 0, 1, 1,
-1.469073, 1.045414, -0.9863734, 0, 0, 0, 1, 1,
-1.463336, -1.567133, -1.547567, 0, 0, 0, 1, 1,
-1.445239, -0.7803396, -0.7752914, 0, 0, 0, 1, 1,
-1.443786, -0.7068895, -2.937773, 0, 0, 0, 1, 1,
-1.443773, 0.4861071, -2.6172, 1, 1, 1, 1, 1,
-1.439606, 1.153435, -1.600921, 1, 1, 1, 1, 1,
-1.438689, 0.8957428, -1.632487, 1, 1, 1, 1, 1,
-1.431308, -1.984494, -2.736623, 1, 1, 1, 1, 1,
-1.426664, -0.151893, -1.838155, 1, 1, 1, 1, 1,
-1.405489, -1.712928, -2.150568, 1, 1, 1, 1, 1,
-1.402633, -0.8294504, -3.45573, 1, 1, 1, 1, 1,
-1.396668, -0.9603798, -2.136168, 1, 1, 1, 1, 1,
-1.379905, 1.123995, -0.3296573, 1, 1, 1, 1, 1,
-1.376101, 1.235641, 0.695906, 1, 1, 1, 1, 1,
-1.361653, -1.761375, -2.977091, 1, 1, 1, 1, 1,
-1.353586, 1.77599, 0.9975864, 1, 1, 1, 1, 1,
-1.350388, 0.7237819, -2.483477, 1, 1, 1, 1, 1,
-1.346539, 0.7731116, -1.95163, 1, 1, 1, 1, 1,
-1.330949, 1.586201, 0.1819929, 1, 1, 1, 1, 1,
-1.330071, 2.656167, 0.2276894, 0, 0, 1, 1, 1,
-1.314184, -1.133783, -1.537849, 1, 0, 0, 1, 1,
-1.309445, 1.842564, -1.02781, 1, 0, 0, 1, 1,
-1.304998, 0.6462432, -0.5059531, 1, 0, 0, 1, 1,
-1.296901, 0.3884011, -0.3884999, 1, 0, 0, 1, 1,
-1.278723, 1.972202, -1.01314, 1, 0, 0, 1, 1,
-1.277062, -0.02063048, -1.872986, 0, 0, 0, 1, 1,
-1.276861, -0.9669143, -1.619903, 0, 0, 0, 1, 1,
-1.276168, -0.4645214, -2.289899, 0, 0, 0, 1, 1,
-1.271865, 1.803888, -0.9905166, 0, 0, 0, 1, 1,
-1.260982, -1.124967, -2.407069, 0, 0, 0, 1, 1,
-1.24847, -1.312346, -0.6901386, 0, 0, 0, 1, 1,
-1.24472, -0.7735218, -1.048621, 0, 0, 0, 1, 1,
-1.229334, -0.05279958, -0.4463014, 1, 1, 1, 1, 1,
-1.228697, 0.08001994, -2.662418, 1, 1, 1, 1, 1,
-1.220036, 1.812852, 0.2986642, 1, 1, 1, 1, 1,
-1.217438, 0.4701414, -1.118875, 1, 1, 1, 1, 1,
-1.213895, -0.07376219, -1.223242, 1, 1, 1, 1, 1,
-1.212366, -0.6331823, -2.109003, 1, 1, 1, 1, 1,
-1.210431, 0.043205, -2.153532, 1, 1, 1, 1, 1,
-1.209155, 0.6581558, -0.9711593, 1, 1, 1, 1, 1,
-1.204036, -0.007943021, -1.582627, 1, 1, 1, 1, 1,
-1.193017, -1.219737, -4.508396, 1, 1, 1, 1, 1,
-1.191452, 0.6942675, -0.2244895, 1, 1, 1, 1, 1,
-1.187482, -0.4648457, -2.787229, 1, 1, 1, 1, 1,
-1.184109, 0.4119782, 1.048934, 1, 1, 1, 1, 1,
-1.181622, -0.6994066, -1.3721, 1, 1, 1, 1, 1,
-1.179691, 0.3976854, -3.211489, 1, 1, 1, 1, 1,
-1.162844, -0.9382064, -2.567654, 0, 0, 1, 1, 1,
-1.150824, -0.5711528, -1.236429, 1, 0, 0, 1, 1,
-1.146231, 0.2681031, -1.302021, 1, 0, 0, 1, 1,
-1.143323, 1.449687, -0.4420479, 1, 0, 0, 1, 1,
-1.140355, -0.07386893, -2.808703, 1, 0, 0, 1, 1,
-1.129916, 0.2755939, -3.080504, 1, 0, 0, 1, 1,
-1.129328, -0.2567193, -0.5335141, 0, 0, 0, 1, 1,
-1.126378, 0.1427733, -1.742859, 0, 0, 0, 1, 1,
-1.114014, -0.5284186, -0.924228, 0, 0, 0, 1, 1,
-1.107907, -1.103979, -3.285642, 0, 0, 0, 1, 1,
-1.104255, 1.68052, -0.4491709, 0, 0, 0, 1, 1,
-1.102086, 0.4329966, -0.6814778, 0, 0, 0, 1, 1,
-1.101985, 0.1917389, -1.687259, 0, 0, 0, 1, 1,
-1.1005, 0.8495202, 1.136938, 1, 1, 1, 1, 1,
-1.090829, -0.201632, -1.480233, 1, 1, 1, 1, 1,
-1.083778, 0.1771888, -2.428472, 1, 1, 1, 1, 1,
-1.083181, 2.690091, 0.2963615, 1, 1, 1, 1, 1,
-1.077072, -0.3541802, -1.536443, 1, 1, 1, 1, 1,
-1.075725, 0.687842, -0.7251331, 1, 1, 1, 1, 1,
-1.072263, -1.044263, -3.481679, 1, 1, 1, 1, 1,
-1.070781, -0.04170245, -0.9711002, 1, 1, 1, 1, 1,
-1.06597, 0.7241667, -1.493127, 1, 1, 1, 1, 1,
-1.065002, 0.2617668, -1.676033, 1, 1, 1, 1, 1,
-1.057063, 0.2977113, -2.374951, 1, 1, 1, 1, 1,
-1.051027, -0.09841967, -1.043173, 1, 1, 1, 1, 1,
-1.049607, -0.2641942, -1.894117, 1, 1, 1, 1, 1,
-1.049335, -0.02928845, -2.751322, 1, 1, 1, 1, 1,
-1.047819, 0.2820499, -1.896781, 1, 1, 1, 1, 1,
-1.034211, 3.333193, 0.8809857, 0, 0, 1, 1, 1,
-1.029403, 1.202026, -0.2866015, 1, 0, 0, 1, 1,
-1.02524, -0.6001824, -4.357766, 1, 0, 0, 1, 1,
-1.022699, 2.167005, 1.11731, 1, 0, 0, 1, 1,
-1.021962, 0.3167724, -2.142776, 1, 0, 0, 1, 1,
-1.020529, 1.011974, -1.239041, 1, 0, 0, 1, 1,
-1.018026, -1.18815, -2.825447, 0, 0, 0, 1, 1,
-1.017475, 0.7481986, -1.405099, 0, 0, 0, 1, 1,
-1.011243, 0.6494131, -0.9626763, 0, 0, 0, 1, 1,
-1.009214, 0.005390746, -2.232655, 0, 0, 0, 1, 1,
-1.006185, 0.4035991, -2.340713, 0, 0, 0, 1, 1,
-1.005236, -0.160109, -0.02818819, 0, 0, 0, 1, 1,
-1.004355, -0.6668903, -1.375543, 0, 0, 0, 1, 1,
-1.001181, -0.6597776, -2.599747, 1, 1, 1, 1, 1,
-1.000026, 1.473294, 0.4833221, 1, 1, 1, 1, 1,
-0.9938594, -0.6287619, -2.331754, 1, 1, 1, 1, 1,
-0.988376, -0.1234312, -3.043069, 1, 1, 1, 1, 1,
-0.9731097, 1.447596, 0.2584988, 1, 1, 1, 1, 1,
-0.9728369, -0.02252439, -1.91444, 1, 1, 1, 1, 1,
-0.97271, -0.9902033, -1.465185, 1, 1, 1, 1, 1,
-0.9657751, -0.8731749, -1.068857, 1, 1, 1, 1, 1,
-0.9648886, 0.04490364, -0.4392325, 1, 1, 1, 1, 1,
-0.9638516, 1.668254, -2.045537, 1, 1, 1, 1, 1,
-0.9528797, 1.180875, -2.587905, 1, 1, 1, 1, 1,
-0.9497698, 1.244622, 0.9051551, 1, 1, 1, 1, 1,
-0.9496479, -0.3740545, -2.006835, 1, 1, 1, 1, 1,
-0.9473966, -0.4581878, -1.795615, 1, 1, 1, 1, 1,
-0.9456299, -0.3588452, -1.381069, 1, 1, 1, 1, 1,
-0.9402083, -0.5120556, -3.228816, 0, 0, 1, 1, 1,
-0.9389041, -0.881824, -4.113339, 1, 0, 0, 1, 1,
-0.9382839, 0.1101329, -1.260804, 1, 0, 0, 1, 1,
-0.9380267, -0.008923953, -2.054802, 1, 0, 0, 1, 1,
-0.9352168, 1.273459, -1.419942, 1, 0, 0, 1, 1,
-0.9339699, 0.7489444, -2.102385, 1, 0, 0, 1, 1,
-0.9284544, -0.5337144, -1.412223, 0, 0, 0, 1, 1,
-0.9250927, -1.704743, -1.670944, 0, 0, 0, 1, 1,
-0.9232745, -1.106939, -2.256548, 0, 0, 0, 1, 1,
-0.9204561, -0.8826073, -0.1246179, 0, 0, 0, 1, 1,
-0.9165603, -0.4408194, -2.020512, 0, 0, 0, 1, 1,
-0.9162971, 0.455158, -1.258218, 0, 0, 0, 1, 1,
-0.9156477, 0.3915254, -2.238709, 0, 0, 0, 1, 1,
-0.9124713, 1.068213, 0.3748547, 1, 1, 1, 1, 1,
-0.9054008, -0.3057654, -1.101057, 1, 1, 1, 1, 1,
-0.8953577, 0.4901721, 0.9900178, 1, 1, 1, 1, 1,
-0.8953221, -0.1521388, -3.408537, 1, 1, 1, 1, 1,
-0.8943012, 0.0549115, -0.1964277, 1, 1, 1, 1, 1,
-0.888546, 0.2030582, -0.7277222, 1, 1, 1, 1, 1,
-0.8858991, 0.57355, -0.7820378, 1, 1, 1, 1, 1,
-0.8844397, -0.1549382, -2.29836, 1, 1, 1, 1, 1,
-0.8719586, -2.484779, -1.625263, 1, 1, 1, 1, 1,
-0.8716617, -1.043808, -4.175629, 1, 1, 1, 1, 1,
-0.8610888, -0.2802829, -1.533319, 1, 1, 1, 1, 1,
-0.8593263, 0.6689667, -1.849432, 1, 1, 1, 1, 1,
-0.8550433, 0.9397736, -0.2811997, 1, 1, 1, 1, 1,
-0.8535525, -0.9462978, -3.378414, 1, 1, 1, 1, 1,
-0.8491086, 0.3329732, -1.418467, 1, 1, 1, 1, 1,
-0.8455687, -0.3484505, -0.8859858, 0, 0, 1, 1, 1,
-0.8448859, 0.9688928, -0.9490527, 1, 0, 0, 1, 1,
-0.8410025, -1.68359, -3.372366, 1, 0, 0, 1, 1,
-0.8309315, 0.2038114, -1.389482, 1, 0, 0, 1, 1,
-0.828439, 1.54276, 0.6286137, 1, 0, 0, 1, 1,
-0.8273123, 0.6401879, -0.5890586, 1, 0, 0, 1, 1,
-0.8254102, 0.4225378, -1.519417, 0, 0, 0, 1, 1,
-0.8225255, -0.3378223, -2.075846, 0, 0, 0, 1, 1,
-0.8210223, -0.5819277, -2.608063, 0, 0, 0, 1, 1,
-0.8206755, -0.216829, -0.5767706, 0, 0, 0, 1, 1,
-0.819508, 1.194782, 1.031888, 0, 0, 0, 1, 1,
-0.8147159, 1.755432, -2.556597, 0, 0, 0, 1, 1,
-0.8142112, 0.5867627, -1.99008, 0, 0, 0, 1, 1,
-0.8081695, -0.5900084, -1.562785, 1, 1, 1, 1, 1,
-0.8043916, 0.5186491, 0.3687599, 1, 1, 1, 1, 1,
-0.8036126, 0.02907998, -1.964712, 1, 1, 1, 1, 1,
-0.8034765, 0.6168525, -0.8080181, 1, 1, 1, 1, 1,
-0.8028334, 0.29957, 0.06352424, 1, 1, 1, 1, 1,
-0.799038, -0.7143046, -1.3304, 1, 1, 1, 1, 1,
-0.799027, -0.5300803, -2.104555, 1, 1, 1, 1, 1,
-0.7911024, -1.076746, -4.156041, 1, 1, 1, 1, 1,
-0.7861954, -1.08369, -1.503422, 1, 1, 1, 1, 1,
-0.783735, 0.9142526, -0.1121802, 1, 1, 1, 1, 1,
-0.7810402, -0.1483495, -0.3688243, 1, 1, 1, 1, 1,
-0.776419, -0.2079367, 0.03704916, 1, 1, 1, 1, 1,
-0.7742318, -0.1288317, -2.24271, 1, 1, 1, 1, 1,
-0.7693025, -1.540285, -1.85938, 1, 1, 1, 1, 1,
-0.7646852, 0.8677402, -0.8698989, 1, 1, 1, 1, 1,
-0.7629163, 1.971324, -0.8721809, 0, 0, 1, 1, 1,
-0.7572446, -0.2679162, -1.79227, 1, 0, 0, 1, 1,
-0.7499844, 0.5222033, -2.66575, 1, 0, 0, 1, 1,
-0.7427277, -1.584362, -1.379593, 1, 0, 0, 1, 1,
-0.7356719, -0.2264235, -2.186996, 1, 0, 0, 1, 1,
-0.7349297, 1.227846, -0.9505241, 1, 0, 0, 1, 1,
-0.7305755, 0.2302872, -1.350723, 0, 0, 0, 1, 1,
-0.7300885, 0.2295192, -2.344145, 0, 0, 0, 1, 1,
-0.7270666, 0.5220802, -0.6187339, 0, 0, 0, 1, 1,
-0.7262781, 1.082942, 0.04180087, 0, 0, 0, 1, 1,
-0.7226854, 1.256018, -1.326663, 0, 0, 0, 1, 1,
-0.7225467, 0.1715401, -2.037065, 0, 0, 0, 1, 1,
-0.7182583, -1.098266, -1.985957, 0, 0, 0, 1, 1,
-0.7154974, -0.9857336, -2.259902, 1, 1, 1, 1, 1,
-0.7147174, -1.377999, -3.338984, 1, 1, 1, 1, 1,
-0.7143592, 0.600832, -1.139953, 1, 1, 1, 1, 1,
-0.7110212, 0.257669, -0.8912788, 1, 1, 1, 1, 1,
-0.7038339, -0.6997033, -1.579722, 1, 1, 1, 1, 1,
-0.6936911, -0.7634581, -2.047428, 1, 1, 1, 1, 1,
-0.6902263, -0.456704, -2.655767, 1, 1, 1, 1, 1,
-0.6867223, -0.08183499, -1.663801, 1, 1, 1, 1, 1,
-0.6859922, -1.820147, -3.711437, 1, 1, 1, 1, 1,
-0.6843462, -0.3926678, -2.661575, 1, 1, 1, 1, 1,
-0.6689786, -0.6946492, -2.976272, 1, 1, 1, 1, 1,
-0.6688207, -0.710033, -4.043887, 1, 1, 1, 1, 1,
-0.6653783, 1.335303, 0.3812083, 1, 1, 1, 1, 1,
-0.6636804, 0.06971139, -1.588498, 1, 1, 1, 1, 1,
-0.6635537, -0.454911, -2.241907, 1, 1, 1, 1, 1,
-0.6590913, 0.9590912, -0.7174243, 0, 0, 1, 1, 1,
-0.656621, -0.130322, -4.538912, 1, 0, 0, 1, 1,
-0.6565426, 1.180468, -0.3885411, 1, 0, 0, 1, 1,
-0.6560085, 1.618303, -0.6535447, 1, 0, 0, 1, 1,
-0.6518492, 0.9411091, -0.6171566, 1, 0, 0, 1, 1,
-0.651381, -0.4680463, -1.537377, 1, 0, 0, 1, 1,
-0.6512101, -0.4830505, -3.080478, 0, 0, 0, 1, 1,
-0.6490437, -1.905421, -1.948615, 0, 0, 0, 1, 1,
-0.64463, -0.8665932, 0.02210865, 0, 0, 0, 1, 1,
-0.6424227, 1.941577, -1.329614, 0, 0, 0, 1, 1,
-0.6394547, -1.569794, -2.760571, 0, 0, 0, 1, 1,
-0.6322052, -1.355824, -2.735253, 0, 0, 0, 1, 1,
-0.6317726, -0.3155158, -2.408536, 0, 0, 0, 1, 1,
-0.6309088, -1.325757, -2.669197, 1, 1, 1, 1, 1,
-0.6290101, 0.7108572, -2.353731, 1, 1, 1, 1, 1,
-0.6282134, 0.584374, -1.337571, 1, 1, 1, 1, 1,
-0.6242958, 0.7521859, -0.3659576, 1, 1, 1, 1, 1,
-0.621721, 1.202063, 1.072185, 1, 1, 1, 1, 1,
-0.6202319, 0.3769783, -0.01884603, 1, 1, 1, 1, 1,
-0.6184471, -1.227338, -2.387641, 1, 1, 1, 1, 1,
-0.6171646, 0.0131866, -2.830543, 1, 1, 1, 1, 1,
-0.6170577, 0.1264514, -0.11462, 1, 1, 1, 1, 1,
-0.6124136, -1.999439, -3.030355, 1, 1, 1, 1, 1,
-0.6077506, -1.13772, -1.833888, 1, 1, 1, 1, 1,
-0.6036525, 0.4626569, -0.9494208, 1, 1, 1, 1, 1,
-0.6026632, 0.307483, -1.167216, 1, 1, 1, 1, 1,
-0.5944428, -0.7893956, -3.599262, 1, 1, 1, 1, 1,
-0.5900834, 1.489504, -1.123244, 1, 1, 1, 1, 1,
-0.5835398, 0.4510662, -0.9371846, 0, 0, 1, 1, 1,
-0.5798386, -1.194382, -2.023053, 1, 0, 0, 1, 1,
-0.5788063, 1.22611, 1.142999, 1, 0, 0, 1, 1,
-0.5781341, -0.4992945, -1.903635, 1, 0, 0, 1, 1,
-0.5760942, -1.197645, -1.298166, 1, 0, 0, 1, 1,
-0.5755016, -0.1008472, -1.698604, 1, 0, 0, 1, 1,
-0.5738252, 0.3040567, -1.000968, 0, 0, 0, 1, 1,
-0.5708247, 1.665425, -0.6834594, 0, 0, 0, 1, 1,
-0.5683227, 0.3237988, -1.827458, 0, 0, 0, 1, 1,
-0.5657684, -0.8290369, -2.481703, 0, 0, 0, 1, 1,
-0.5649614, -1.003387, -3.56188, 0, 0, 0, 1, 1,
-0.5649183, -1.578474, -2.434983, 0, 0, 0, 1, 1,
-0.5634558, 2.00725, -2.057832, 0, 0, 0, 1, 1,
-0.5613365, 0.9392778, -1.069461, 1, 1, 1, 1, 1,
-0.5612527, -0.6728451, -3.345064, 1, 1, 1, 1, 1,
-0.5606925, -1.433053, -2.565353, 1, 1, 1, 1, 1,
-0.5595078, -0.01892068, -1.30354, 1, 1, 1, 1, 1,
-0.5552871, 0.6789563, -1.973081, 1, 1, 1, 1, 1,
-0.5544144, -0.03989019, -3.022303, 1, 1, 1, 1, 1,
-0.5525274, -0.3659933, -4.198675, 1, 1, 1, 1, 1,
-0.5518857, 0.6576716, 0.9946566, 1, 1, 1, 1, 1,
-0.5511243, -0.3224952, -2.504354, 1, 1, 1, 1, 1,
-0.5491772, 0.4556118, -1.015469, 1, 1, 1, 1, 1,
-0.5476145, -1.417702, -2.117157, 1, 1, 1, 1, 1,
-0.5462602, 0.8135767, -1.470221, 1, 1, 1, 1, 1,
-0.5458072, -0.06993628, -1.379138, 1, 1, 1, 1, 1,
-0.5453181, 1.120304, -0.525624, 1, 1, 1, 1, 1,
-0.5269599, 0.1832407, -3.026242, 1, 1, 1, 1, 1,
-0.5268552, 0.03044813, -2.813191, 0, 0, 1, 1, 1,
-0.5257689, 1.3824, -0.4847469, 1, 0, 0, 1, 1,
-0.5238891, -0.1396281, -2.170848, 1, 0, 0, 1, 1,
-0.5141281, -0.1807056, -0.7010868, 1, 0, 0, 1, 1,
-0.5140895, 0.03884084, -1.822665, 1, 0, 0, 1, 1,
-0.5135522, -0.211422, -0.6737196, 1, 0, 0, 1, 1,
-0.5113497, 0.3704889, -1.356088, 0, 0, 0, 1, 1,
-0.5107965, -0.3034362, -1.621966, 0, 0, 0, 1, 1,
-0.5091023, -0.6722943, -2.835945, 0, 0, 0, 1, 1,
-0.5085697, -0.9757198, -1.695937, 0, 0, 0, 1, 1,
-0.5072417, -0.2166207, -1.541571, 0, 0, 0, 1, 1,
-0.507119, 0.5770924, -0.7367654, 0, 0, 0, 1, 1,
-0.5060349, 0.4536008, -0.02411104, 0, 0, 0, 1, 1,
-0.504217, 0.5169098, -0.08634662, 1, 1, 1, 1, 1,
-0.4968673, 2.211695, -0.4533236, 1, 1, 1, 1, 1,
-0.4959083, 1.296083, -0.1217091, 1, 1, 1, 1, 1,
-0.4934702, -0.2890964, 0.6034727, 1, 1, 1, 1, 1,
-0.488253, 0.8115399, 1.417831, 1, 1, 1, 1, 1,
-0.4749277, 0.4527479, -1.491536, 1, 1, 1, 1, 1,
-0.4742216, -0.3723065, -3.253181, 1, 1, 1, 1, 1,
-0.4656336, -1.847369, -2.026521, 1, 1, 1, 1, 1,
-0.4648328, -1.642115, -2.01309, 1, 1, 1, 1, 1,
-0.4636301, -0.5672609, -1.865502, 1, 1, 1, 1, 1,
-0.4620062, 0.5536867, -2.150205, 1, 1, 1, 1, 1,
-0.4503719, -0.1930821, -1.374816, 1, 1, 1, 1, 1,
-0.444737, 1.098698, -0.6060684, 1, 1, 1, 1, 1,
-0.4430606, -0.2722251, -3.174528, 1, 1, 1, 1, 1,
-0.4410909, -0.01970035, -2.88312, 1, 1, 1, 1, 1,
-0.4372503, 0.268407, -2.678494, 0, 0, 1, 1, 1,
-0.4359732, 1.401429, -0.3105454, 1, 0, 0, 1, 1,
-0.4284866, -0.14338, -0.3212356, 1, 0, 0, 1, 1,
-0.4272812, -0.9037531, -2.713248, 1, 0, 0, 1, 1,
-0.4259919, -1.125221, -2.472119, 1, 0, 0, 1, 1,
-0.4227601, 0.3329362, -0.462515, 1, 0, 0, 1, 1,
-0.421027, 0.3655012, -0.579183, 0, 0, 0, 1, 1,
-0.4155556, 1.22813, -0.8392674, 0, 0, 0, 1, 1,
-0.4107268, -0.5372879, -3.795695, 0, 0, 0, 1, 1,
-0.408164, -1.41136, -3.30591, 0, 0, 0, 1, 1,
-0.4041418, 0.1004869, -1.96742, 0, 0, 0, 1, 1,
-0.4040398, -0.1942905, -0.1443317, 0, 0, 0, 1, 1,
-0.4017041, -0.05910697, -2.449747, 0, 0, 0, 1, 1,
-0.3973358, 0.4361641, -1.694757, 1, 1, 1, 1, 1,
-0.3961735, -0.6666906, -1.454877, 1, 1, 1, 1, 1,
-0.3935735, 0.01395101, -0.9363, 1, 1, 1, 1, 1,
-0.3914917, 1.845299, -2.205426, 1, 1, 1, 1, 1,
-0.3896955, 1.852867, -0.02111082, 1, 1, 1, 1, 1,
-0.3896679, -0.04900346, -1.377769, 1, 1, 1, 1, 1,
-0.3886555, 2.139393, 0.02238037, 1, 1, 1, 1, 1,
-0.3884145, -0.2841751, -2.046645, 1, 1, 1, 1, 1,
-0.3873833, 0.09856477, 0.4494256, 1, 1, 1, 1, 1,
-0.3869759, 0.07312302, -0.2906989, 1, 1, 1, 1, 1,
-0.3851644, 1.420912, -1.774342, 1, 1, 1, 1, 1,
-0.3845052, 1.368248, -1.177241, 1, 1, 1, 1, 1,
-0.3839136, -1.092617, -1.514499, 1, 1, 1, 1, 1,
-0.3834576, -0.6420858, -3.014559, 1, 1, 1, 1, 1,
-0.3817311, 0.204389, -0.3265991, 1, 1, 1, 1, 1,
-0.3715492, 0.8361641, 0.5048026, 0, 0, 1, 1, 1,
-0.3704994, -0.5304616, -2.121918, 1, 0, 0, 1, 1,
-0.368378, 0.4911401, -0.5808017, 1, 0, 0, 1, 1,
-0.3661089, 0.8800016, -1.407736, 1, 0, 0, 1, 1,
-0.3593598, 0.1543213, 1.247462, 1, 0, 0, 1, 1,
-0.3580249, 0.1643096, -2.788712, 1, 0, 0, 1, 1,
-0.3540397, -0.1275266, -2.868098, 0, 0, 0, 1, 1,
-0.3536544, 1.245486, 0.04696305, 0, 0, 0, 1, 1,
-0.3527342, 0.3206509, -2.522083, 0, 0, 0, 1, 1,
-0.3526114, -0.6573023, -1.726864, 0, 0, 0, 1, 1,
-0.3521766, 1.104723, -1.945442, 0, 0, 0, 1, 1,
-0.3517327, 0.06738292, -2.911673, 0, 0, 0, 1, 1,
-0.3407091, -0.686372, -3.463539, 0, 0, 0, 1, 1,
-0.3396657, 0.6886207, -0.7503602, 1, 1, 1, 1, 1,
-0.3378411, -0.1639429, -0.03116957, 1, 1, 1, 1, 1,
-0.3357209, 0.4151091, -1.520162, 1, 1, 1, 1, 1,
-0.3333226, 0.4923919, -0.475953, 1, 1, 1, 1, 1,
-0.3319688, -1.397293, -1.66702, 1, 1, 1, 1, 1,
-0.3314969, 0.08251525, -1.71521, 1, 1, 1, 1, 1,
-0.3283989, -1.095022, -3.640685, 1, 1, 1, 1, 1,
-0.3272246, -0.1531713, -1.581885, 1, 1, 1, 1, 1,
-0.3197747, -0.7375053, -3.719486, 1, 1, 1, 1, 1,
-0.3149081, -0.7251818, -2.691908, 1, 1, 1, 1, 1,
-0.3139153, 0.3210405, -1.040775, 1, 1, 1, 1, 1,
-0.3136235, -0.818898, -2.750294, 1, 1, 1, 1, 1,
-0.3133726, 0.4526396, 0.01252344, 1, 1, 1, 1, 1,
-0.3127555, 1.32187, -0.883391, 1, 1, 1, 1, 1,
-0.3125066, -1.282507, -2.784739, 1, 1, 1, 1, 1,
-0.311666, -0.3404757, -3.518584, 0, 0, 1, 1, 1,
-0.3051338, 0.5764835, -0.2756002, 1, 0, 0, 1, 1,
-0.3043984, 0.714004, 1.391093, 1, 0, 0, 1, 1,
-0.3038434, -0.2661642, -3.452363, 1, 0, 0, 1, 1,
-0.3019326, 0.2313628, -2.14013, 1, 0, 0, 1, 1,
-0.2970778, -2.225069, -3.980986, 1, 0, 0, 1, 1,
-0.2944746, -1.242666, -3.394128, 0, 0, 0, 1, 1,
-0.2934332, 0.8233514, -1.202191, 0, 0, 0, 1, 1,
-0.2896149, -1.265156, -2.170015, 0, 0, 0, 1, 1,
-0.2846087, -0.2862122, -2.091359, 0, 0, 0, 1, 1,
-0.280811, -1.189453, -3.516217, 0, 0, 0, 1, 1,
-0.2806345, -0.008047065, -2.730898, 0, 0, 0, 1, 1,
-0.2800994, -0.6634057, -3.922229, 0, 0, 0, 1, 1,
-0.2742842, 0.5233561, -0.735196, 1, 1, 1, 1, 1,
-0.2687391, 0.3892664, -0.9644872, 1, 1, 1, 1, 1,
-0.2677676, 1.057773, -2.163598, 1, 1, 1, 1, 1,
-0.2669649, 0.2371969, -1.046179, 1, 1, 1, 1, 1,
-0.260609, -0.5881775, -3.175832, 1, 1, 1, 1, 1,
-0.2546959, -1.308664, -3.103636, 1, 1, 1, 1, 1,
-0.2496348, 2.909923, -0.2920746, 1, 1, 1, 1, 1,
-0.2422265, -0.3933297, -2.991618, 1, 1, 1, 1, 1,
-0.23818, -1.269936, -4.322373, 1, 1, 1, 1, 1,
-0.2318117, 0.6731282, 0.2134819, 1, 1, 1, 1, 1,
-0.23116, -0.2210401, -1.956123, 1, 1, 1, 1, 1,
-0.2302797, 0.3452418, -1.078732, 1, 1, 1, 1, 1,
-0.2285216, -0.6829681, -3.490566, 1, 1, 1, 1, 1,
-0.2203293, 0.681779, -1.156761, 1, 1, 1, 1, 1,
-0.2128482, -0.4232114, -2.918136, 1, 1, 1, 1, 1,
-0.2121454, 1.119551, -0.8882801, 0, 0, 1, 1, 1,
-0.204264, -0.6290717, -4.777754, 1, 0, 0, 1, 1,
-0.2037539, 1.327543, -0.2650965, 1, 0, 0, 1, 1,
-0.20159, 0.1719921, -0.97705, 1, 0, 0, 1, 1,
-0.1975601, 0.7156148, 0.08980013, 1, 0, 0, 1, 1,
-0.1961901, -0.5638115, -1.51944, 1, 0, 0, 1, 1,
-0.1960576, -0.1698886, -1.931117, 0, 0, 0, 1, 1,
-0.1956322, -2.271129, -4.505394, 0, 0, 0, 1, 1,
-0.1891132, 1.069084, -0.7541727, 0, 0, 0, 1, 1,
-0.1885296, 1.427099, -1.092189, 0, 0, 0, 1, 1,
-0.1881194, 0.3696036, -2.063241, 0, 0, 0, 1, 1,
-0.1869667, 2.160181, 0.029478, 0, 0, 0, 1, 1,
-0.1863672, -1.12506, -1.382992, 0, 0, 0, 1, 1,
-0.183759, -0.8808115, -3.368452, 1, 1, 1, 1, 1,
-0.1743136, -0.9586954, -4.766377, 1, 1, 1, 1, 1,
-0.165934, -0.4672395, -3.037995, 1, 1, 1, 1, 1,
-0.1599987, -0.5148003, -2.810723, 1, 1, 1, 1, 1,
-0.1563847, 0.8081667, 0.04923658, 1, 1, 1, 1, 1,
-0.1522303, -0.1014331, -0.1232022, 1, 1, 1, 1, 1,
-0.150559, 0.4776394, -0.7834395, 1, 1, 1, 1, 1,
-0.1477833, 0.4602927, 0.7201016, 1, 1, 1, 1, 1,
-0.1472209, 1.050687, 0.4074787, 1, 1, 1, 1, 1,
-0.1425193, -0.3639342, -4.546318, 1, 1, 1, 1, 1,
-0.1421684, -0.429133, -5.169053, 1, 1, 1, 1, 1,
-0.1399331, -0.4971022, -2.582844, 1, 1, 1, 1, 1,
-0.1378094, 0.7205051, -1.684199, 1, 1, 1, 1, 1,
-0.1376333, -0.6317697, -1.911677, 1, 1, 1, 1, 1,
-0.1320662, -0.9440395, -4.514501, 1, 1, 1, 1, 1,
-0.1309411, 1.055892, -0.7403549, 0, 0, 1, 1, 1,
-0.1284221, 1.364244, -1.68446, 1, 0, 0, 1, 1,
-0.1264803, -0.6010212, -2.234219, 1, 0, 0, 1, 1,
-0.1203339, -1.120504, -4.800899, 1, 0, 0, 1, 1,
-0.12013, -0.7159196, -2.833411, 1, 0, 0, 1, 1,
-0.1173573, 0.5487357, -1.144852, 1, 0, 0, 1, 1,
-0.1157749, -0.02547259, -2.774869, 0, 0, 0, 1, 1,
-0.1118287, 0.3823243, -0.4805404, 0, 0, 0, 1, 1,
-0.1037113, 0.9595758, 0.7194181, 0, 0, 0, 1, 1,
-0.09709679, -1.237155, -3.301, 0, 0, 0, 1, 1,
-0.09654157, 0.230808, 0.3804367, 0, 0, 0, 1, 1,
-0.09536161, 0.6719264, -0.6521367, 0, 0, 0, 1, 1,
-0.09184128, 1.268801, 0.2770773, 0, 0, 0, 1, 1,
-0.09166511, 1.285587, 0.1075975, 1, 1, 1, 1, 1,
-0.09147947, -0.3160282, -1.708969, 1, 1, 1, 1, 1,
-0.08823754, 0.7413281, 1.869035, 1, 1, 1, 1, 1,
-0.08798151, -0.8627428, -2.546759, 1, 1, 1, 1, 1,
-0.08255294, -1.96584, -3.4563, 1, 1, 1, 1, 1,
-0.07338701, 0.06613617, -1.344018, 1, 1, 1, 1, 1,
-0.06730645, 0.3641694, -0.05987953, 1, 1, 1, 1, 1,
-0.06316088, 1.93572, -0.3918791, 1, 1, 1, 1, 1,
-0.05880313, -0.28037, -3.045638, 1, 1, 1, 1, 1,
-0.0549702, -0.367273, -3.374751, 1, 1, 1, 1, 1,
-0.05179752, -1.940724, -3.782826, 1, 1, 1, 1, 1,
-0.04924488, 0.9668804, 0.689398, 1, 1, 1, 1, 1,
-0.04851867, -0.9999179, -5.372882, 1, 1, 1, 1, 1,
-0.04813029, 0.267169, -0.5418856, 1, 1, 1, 1, 1,
-0.04707378, 1.264964, -0.5693055, 1, 1, 1, 1, 1,
-0.04343533, 0.01352242, -0.08778048, 0, 0, 1, 1, 1,
-0.04273394, 0.3664428, -0.7866971, 1, 0, 0, 1, 1,
-0.04001771, 0.146622, 0.839586, 1, 0, 0, 1, 1,
-0.03995245, 0.2494255, -1.331412, 1, 0, 0, 1, 1,
-0.03773523, 0.8755221, 1.484873, 1, 0, 0, 1, 1,
-0.03301458, -0.07190899, -3.750387, 1, 0, 0, 1, 1,
-0.03051445, 1.499967, 0.1420237, 0, 0, 0, 1, 1,
-0.02945732, -0.5094881, -4.680426, 0, 0, 0, 1, 1,
-0.02665986, 2.306861, -0.3388134, 0, 0, 0, 1, 1,
-0.02404986, 0.6016958, -0.2812223, 0, 0, 0, 1, 1,
-0.02393472, 0.2669685, -2.284747, 0, 0, 0, 1, 1,
-0.02362479, 0.6442976, 1.017637, 0, 0, 0, 1, 1,
-0.02334145, -0.9920026, -3.958775, 0, 0, 0, 1, 1,
-0.0118763, 0.5255851, 0.9830226, 1, 1, 1, 1, 1,
-0.006062001, 0.2339007, 0.1716379, 1, 1, 1, 1, 1,
-0.004209611, -0.6643109, -2.716137, 1, 1, 1, 1, 1,
0.003939566, 0.3504458, 0.6010387, 1, 1, 1, 1, 1,
0.009524853, 0.1514426, 0.272202, 1, 1, 1, 1, 1,
0.01192995, -1.826962, 2.996275, 1, 1, 1, 1, 1,
0.01260856, 0.7761802, 1.150087, 1, 1, 1, 1, 1,
0.01263576, -0.9645904, 4.683818, 1, 1, 1, 1, 1,
0.01421296, 1.424393, -0.6677247, 1, 1, 1, 1, 1,
0.01494793, 0.9669705, 0.4499448, 1, 1, 1, 1, 1,
0.01580299, -1.589055, 2.029397, 1, 1, 1, 1, 1,
0.01653762, -0.5526707, 2.195925, 1, 1, 1, 1, 1,
0.02114566, -0.01050445, 1.807695, 1, 1, 1, 1, 1,
0.0218752, -0.5424712, 2.91459, 1, 1, 1, 1, 1,
0.02518032, -0.4419385, 2.891247, 1, 1, 1, 1, 1,
0.0273154, -0.1841005, 3.050794, 0, 0, 1, 1, 1,
0.04029985, -0.5028527, 3.422394, 1, 0, 0, 1, 1,
0.04329314, -0.5969906, 1.644342, 1, 0, 0, 1, 1,
0.04605505, 0.510106, -1.922662, 1, 0, 0, 1, 1,
0.04719609, -0.7363266, 2.272883, 1, 0, 0, 1, 1,
0.04744324, -0.457395, 3.822818, 1, 0, 0, 1, 1,
0.04942526, 2.084384, 1.996247, 0, 0, 0, 1, 1,
0.05350481, -0.2158177, 3.52465, 0, 0, 0, 1, 1,
0.0540986, 0.182026, -1.040632, 0, 0, 0, 1, 1,
0.05569614, 0.01198014, 5.343158, 0, 0, 0, 1, 1,
0.06648998, 0.7511418, 0.4637408, 0, 0, 0, 1, 1,
0.06715889, -0.460495, 2.77352, 0, 0, 0, 1, 1,
0.06739522, -0.37145, 2.049657, 0, 0, 0, 1, 1,
0.06785052, 1.761528, 1.248842, 1, 1, 1, 1, 1,
0.07001054, -0.5858246, 4.067268, 1, 1, 1, 1, 1,
0.07350002, -0.7083849, 1.189987, 1, 1, 1, 1, 1,
0.07858633, -1.012859, 3.92949, 1, 1, 1, 1, 1,
0.08190522, 0.154326, -1.047259, 1, 1, 1, 1, 1,
0.08225399, 2.43839, 0.05410862, 1, 1, 1, 1, 1,
0.08268319, 1.440532, -1.135932, 1, 1, 1, 1, 1,
0.08284959, -1.022654, 3.48921, 1, 1, 1, 1, 1,
0.08327664, -0.07268727, 1.315403, 1, 1, 1, 1, 1,
0.08617689, 1.29749, 0.3052795, 1, 1, 1, 1, 1,
0.08649653, -0.7408183, 3.018636, 1, 1, 1, 1, 1,
0.08783149, -0.07397641, 2.166487, 1, 1, 1, 1, 1,
0.089907, 0.1286185, 0.3318468, 1, 1, 1, 1, 1,
0.09005869, -0.1900617, 2.981252, 1, 1, 1, 1, 1,
0.09639117, 0.9865308, 1.127022, 1, 1, 1, 1, 1,
0.09674008, -0.8888003, 3.382113, 0, 0, 1, 1, 1,
0.09717339, -0.2698899, 1.809119, 1, 0, 0, 1, 1,
0.1000262, -1.214635, 3.885259, 1, 0, 0, 1, 1,
0.1054842, -0.803649, 1.223537, 1, 0, 0, 1, 1,
0.1064583, 0.7927188, 0.7004392, 1, 0, 0, 1, 1,
0.1078786, 0.4267228, -0.1543836, 1, 0, 0, 1, 1,
0.1095148, 1.188243, 1.159516, 0, 0, 0, 1, 1,
0.1114962, -0.3810042, 3.310483, 0, 0, 0, 1, 1,
0.1187392, -1.398989, 2.867545, 0, 0, 0, 1, 1,
0.1198266, -1.252646, 2.964229, 0, 0, 0, 1, 1,
0.121756, -1.78878, 3.450343, 0, 0, 0, 1, 1,
0.126123, 1.64413, -0.0466736, 0, 0, 0, 1, 1,
0.1299521, 0.03814961, 3.431942, 0, 0, 0, 1, 1,
0.1312082, 0.1444467, 2.076733, 1, 1, 1, 1, 1,
0.1320478, -1.496536, 2.690178, 1, 1, 1, 1, 1,
0.1376556, -0.2237749, 2.023489, 1, 1, 1, 1, 1,
0.1378655, 0.2682777, 0.8200971, 1, 1, 1, 1, 1,
0.1409347, -0.8837589, 1.638704, 1, 1, 1, 1, 1,
0.1418737, 2.059527, -1.347455, 1, 1, 1, 1, 1,
0.1443898, -1.379441, 3.305378, 1, 1, 1, 1, 1,
0.1449756, 0.9959002, 0.07292572, 1, 1, 1, 1, 1,
0.1476818, 1.19371, -0.6788591, 1, 1, 1, 1, 1,
0.1480303, -0.365571, 3.513667, 1, 1, 1, 1, 1,
0.1498322, -0.06633128, 0.7058063, 1, 1, 1, 1, 1,
0.1499656, 1.113644, 0.4410302, 1, 1, 1, 1, 1,
0.1517964, 0.5111571, 0.9576349, 1, 1, 1, 1, 1,
0.1606255, 0.3877333, 1.188915, 1, 1, 1, 1, 1,
0.1657743, -2.025836, 2.474192, 1, 1, 1, 1, 1,
0.1681647, 0.7135551, 0.5711263, 0, 0, 1, 1, 1,
0.1731362, 0.7903446, 1.859655, 1, 0, 0, 1, 1,
0.1758086, -1.391558, 1.532717, 1, 0, 0, 1, 1,
0.1763575, 1.261009, -0.6817598, 1, 0, 0, 1, 1,
0.1817124, -1.404508, 1.416981, 1, 0, 0, 1, 1,
0.1928615, 1.400941, 0.7847983, 1, 0, 0, 1, 1,
0.195794, -0.006168534, 1.945158, 0, 0, 0, 1, 1,
0.1960632, 0.2638545, 0.8888944, 0, 0, 0, 1, 1,
0.197095, -0.5577878, 2.428877, 0, 0, 0, 1, 1,
0.202373, -2.158048, 2.4166, 0, 0, 0, 1, 1,
0.2024563, 0.4700229, 0.4874767, 0, 0, 0, 1, 1,
0.2051419, 1.342845, 0.8509942, 0, 0, 0, 1, 1,
0.2110135, 0.2198969, 1.215566, 0, 0, 0, 1, 1,
0.2148044, 0.8657303, -0.4672317, 1, 1, 1, 1, 1,
0.2167995, 0.4787646, 2.033333, 1, 1, 1, 1, 1,
0.226928, -2.633348, 3.067456, 1, 1, 1, 1, 1,
0.2284078, -1.314937, 2.290308, 1, 1, 1, 1, 1,
0.2284081, 0.1472233, 1.389136, 1, 1, 1, 1, 1,
0.2290559, -0.3304973, 0.9872188, 1, 1, 1, 1, 1,
0.2291596, 1.261043, 0.4761486, 1, 1, 1, 1, 1,
0.2332036, 0.3616981, 1.943362, 1, 1, 1, 1, 1,
0.2334779, 0.545962, -0.641684, 1, 1, 1, 1, 1,
0.2337154, -0.6431866, 0.910538, 1, 1, 1, 1, 1,
0.2359188, 0.4737754, -0.2258721, 1, 1, 1, 1, 1,
0.2365431, -2.401548, 1.671206, 1, 1, 1, 1, 1,
0.2413175, 0.1195337, 0.6299316, 1, 1, 1, 1, 1,
0.2430036, 1.356387, 0.6907837, 1, 1, 1, 1, 1,
0.2439343, 0.2581465, 1.743575, 1, 1, 1, 1, 1,
0.2495791, -0.07064829, 2.249731, 0, 0, 1, 1, 1,
0.2496485, 1.874125, 0.2540351, 1, 0, 0, 1, 1,
0.2498324, -0.06711935, 2.522306, 1, 0, 0, 1, 1,
0.2520378, 0.8956596, 0.01335368, 1, 0, 0, 1, 1,
0.2537856, -0.1494744, 3.033811, 1, 0, 0, 1, 1,
0.2565156, -1.260661, 4.442884, 1, 0, 0, 1, 1,
0.258032, 0.9063162, -0.2624254, 0, 0, 0, 1, 1,
0.2632222, 0.06125762, 1.368571, 0, 0, 0, 1, 1,
0.2635971, -0.3216862, 3.160261, 0, 0, 0, 1, 1,
0.2643326, -0.1003859, 0.8001668, 0, 0, 0, 1, 1,
0.2703498, -0.4720485, 4.434608, 0, 0, 0, 1, 1,
0.2713364, -0.78459, 2.297959, 0, 0, 0, 1, 1,
0.2714624, -0.569101, 2.341083, 0, 0, 0, 1, 1,
0.2832411, 1.012957, 0.6750127, 1, 1, 1, 1, 1,
0.2883243, 1.37266, -0.5584614, 1, 1, 1, 1, 1,
0.2888038, 1.190888, -0.09398545, 1, 1, 1, 1, 1,
0.2891528, 0.9683962, -0.0103454, 1, 1, 1, 1, 1,
0.2895773, -1.118802, 3.476377, 1, 1, 1, 1, 1,
0.2939212, -1.041728, 2.52213, 1, 1, 1, 1, 1,
0.2973244, -0.4505455, 3.121245, 1, 1, 1, 1, 1,
0.2990374, 0.01640636, -0.1098473, 1, 1, 1, 1, 1,
0.3020455, 0.4833511, 1.964605, 1, 1, 1, 1, 1,
0.3021498, -0.2164083, 2.304994, 1, 1, 1, 1, 1,
0.3050176, 0.4251234, -0.1457853, 1, 1, 1, 1, 1,
0.3060254, 0.3141586, 0.9375725, 1, 1, 1, 1, 1,
0.3080261, -0.3952169, 2.906565, 1, 1, 1, 1, 1,
0.309137, -0.6255155, 2.807616, 1, 1, 1, 1, 1,
0.3105782, 0.03174341, 1.274814, 1, 1, 1, 1, 1,
0.3109054, -0.4944124, 3.292924, 0, 0, 1, 1, 1,
0.3109728, 0.5048527, 0.5247687, 1, 0, 0, 1, 1,
0.3209964, 1.772737, 0.905535, 1, 0, 0, 1, 1,
0.3278061, -0.905485, 1.977013, 1, 0, 0, 1, 1,
0.3289811, 0.2109073, 0.2468426, 1, 0, 0, 1, 1,
0.3312174, 0.9855762, 0.7793622, 1, 0, 0, 1, 1,
0.3313044, 0.3908947, 1.276022, 0, 0, 0, 1, 1,
0.3445147, 0.04850812, 1.656151, 0, 0, 0, 1, 1,
0.3464188, 0.3946823, 0.3836547, 0, 0, 0, 1, 1,
0.3469522, -1.44567, 2.599909, 0, 0, 0, 1, 1,
0.3496703, -1.299067, 4.583973, 0, 0, 0, 1, 1,
0.3513486, -0.904774, 2.719489, 0, 0, 0, 1, 1,
0.3528187, 0.9979967, 1.68592, 0, 0, 0, 1, 1,
0.353046, 0.1381393, 1.712611, 1, 1, 1, 1, 1,
0.3585339, 0.6201274, 0.5940443, 1, 1, 1, 1, 1,
0.3633739, 1.284801, 0.4373388, 1, 1, 1, 1, 1,
0.3642292, 0.4983255, 0.7981497, 1, 1, 1, 1, 1,
0.3763853, -0.02866711, 2.898409, 1, 1, 1, 1, 1,
0.3898779, -0.2485132, 2.600919, 1, 1, 1, 1, 1,
0.3914989, 0.5009277, 1.500261, 1, 1, 1, 1, 1,
0.3922954, -0.5744106, 1.646502, 1, 1, 1, 1, 1,
0.3964857, 0.320211, 0.1986702, 1, 1, 1, 1, 1,
0.3975723, -1.009424, 2.179303, 1, 1, 1, 1, 1,
0.4002578, -0.3878334, 1.933645, 1, 1, 1, 1, 1,
0.4040751, -0.1891736, 3.4501, 1, 1, 1, 1, 1,
0.4078166, 1.585897, 0.8477356, 1, 1, 1, 1, 1,
0.4214764, -0.2836281, 3.365733, 1, 1, 1, 1, 1,
0.4223998, -0.6075234, 0.7022232, 1, 1, 1, 1, 1,
0.4260688, -0.7147558, 2.152601, 0, 0, 1, 1, 1,
0.4266033, -1.07572, 3.574135, 1, 0, 0, 1, 1,
0.4334867, 0.4832326, 0.9599529, 1, 0, 0, 1, 1,
0.4360999, 1.65655, 0.6345184, 1, 0, 0, 1, 1,
0.4374347, 0.5152934, -0.2859835, 1, 0, 0, 1, 1,
0.4410461, 0.4007908, 0.7371309, 1, 0, 0, 1, 1,
0.4507282, -1.358562, 3.830179, 0, 0, 0, 1, 1,
0.4541741, -0.2263833, 0.5410744, 0, 0, 0, 1, 1,
0.4612378, -1.049036, 2.796326, 0, 0, 0, 1, 1,
0.4619801, 0.9509094, -0.07568492, 0, 0, 0, 1, 1,
0.4644406, 0.2634132, 0.9089906, 0, 0, 0, 1, 1,
0.4670707, -0.7007603, 4.72458, 0, 0, 0, 1, 1,
0.4681653, 0.8830684, 1.135986, 0, 0, 0, 1, 1,
0.4705605, -2.193435, 3.19753, 1, 1, 1, 1, 1,
0.473235, -0.7106827, 2.322106, 1, 1, 1, 1, 1,
0.4777039, 0.5939639, 0.8476715, 1, 1, 1, 1, 1,
0.4812562, 0.7623866, 0.5365099, 1, 1, 1, 1, 1,
0.4828628, 0.1348398, 1.317289, 1, 1, 1, 1, 1,
0.4849845, -0.8712961, 2.381004, 1, 1, 1, 1, 1,
0.4885582, -2.204352, 2.138992, 1, 1, 1, 1, 1,
0.4947527, 1.234966, 0.4111253, 1, 1, 1, 1, 1,
0.4966322, 0.4838481, -1.188641, 1, 1, 1, 1, 1,
0.4977171, 1.500105, -0.7428558, 1, 1, 1, 1, 1,
0.4979257, 0.5473147, 1.768209, 1, 1, 1, 1, 1,
0.5000341, -0.1749223, 2.362381, 1, 1, 1, 1, 1,
0.5001599, -0.6355191, 3.371879, 1, 1, 1, 1, 1,
0.5008495, 1.355311, 1.047199, 1, 1, 1, 1, 1,
0.5011643, -1.789756, 3.730556, 1, 1, 1, 1, 1,
0.5039769, -0.09249692, 1.277767, 0, 0, 1, 1, 1,
0.5090569, -0.2599845, 2.396784, 1, 0, 0, 1, 1,
0.5098596, -0.5574734, 1.359143, 1, 0, 0, 1, 1,
0.5179176, -0.3134021, 2.74087, 1, 0, 0, 1, 1,
0.5206282, 0.9657866, -0.4347637, 1, 0, 0, 1, 1,
0.5207877, -1.440532, 2.589616, 1, 0, 0, 1, 1,
0.521583, -0.2247609, 1.270074, 0, 0, 0, 1, 1,
0.5267726, 0.4010289, -0.3974881, 0, 0, 0, 1, 1,
0.5295932, -0.4021125, 1.945123, 0, 0, 0, 1, 1,
0.5335886, -0.2296294, 1.85083, 0, 0, 0, 1, 1,
0.533609, 1.01978, 1.733288, 0, 0, 0, 1, 1,
0.5337936, 0.1788765, 1.548311, 0, 0, 0, 1, 1,
0.5394369, 0.6290299, 2.201334, 0, 0, 0, 1, 1,
0.542779, -0.6030327, 3.022224, 1, 1, 1, 1, 1,
0.5429316, 0.7183703, -0.3144626, 1, 1, 1, 1, 1,
0.5476808, 1.296076, 1.337611, 1, 1, 1, 1, 1,
0.5511709, -0.578611, 3.763984, 1, 1, 1, 1, 1,
0.5522386, -0.3863813, 1.119289, 1, 1, 1, 1, 1,
0.5523881, 0.8046175, 1.556875, 1, 1, 1, 1, 1,
0.5529352, 0.1988561, 2.921781, 1, 1, 1, 1, 1,
0.5532013, 2.220387, -0.2444313, 1, 1, 1, 1, 1,
0.5548522, 0.8281972, 0.08439658, 1, 1, 1, 1, 1,
0.5577109, 1.298077, -0.4726227, 1, 1, 1, 1, 1,
0.5636185, 0.05175113, 1.252387, 1, 1, 1, 1, 1,
0.5642689, 0.7925565, 0.7384349, 1, 1, 1, 1, 1,
0.5644896, 0.5251813, 2.026687, 1, 1, 1, 1, 1,
0.5649875, 0.5046946, 0.3445241, 1, 1, 1, 1, 1,
0.56521, -0.07469682, 2.760333, 1, 1, 1, 1, 1,
0.5666064, -0.6511848, 2.094126, 0, 0, 1, 1, 1,
0.5669191, -0.4015899, 2.073413, 1, 0, 0, 1, 1,
0.5711489, -0.9129642, 1.885908, 1, 0, 0, 1, 1,
0.575597, -1.188941, 2.885767, 1, 0, 0, 1, 1,
0.5756776, 0.3153945, 0.8538805, 1, 0, 0, 1, 1,
0.5801294, -0.2170967, 1.513087, 1, 0, 0, 1, 1,
0.5807298, -0.5469874, 3.226616, 0, 0, 0, 1, 1,
0.5821581, -0.7543263, 2.479462, 0, 0, 0, 1, 1,
0.5853881, -1.202523, 2.625319, 0, 0, 0, 1, 1,
0.5902113, 0.6709047, 0.6250159, 0, 0, 0, 1, 1,
0.5916484, 1.117654, 1.904437, 0, 0, 0, 1, 1,
0.5926281, -0.1260473, 1.641555, 0, 0, 0, 1, 1,
0.5927464, 1.282163, -0.7599542, 0, 0, 0, 1, 1,
0.5946779, -0.9277835, 2.34677, 1, 1, 1, 1, 1,
0.5956864, -1.17243, 1.818617, 1, 1, 1, 1, 1,
0.5969632, -1.135729, 2.517876, 1, 1, 1, 1, 1,
0.6036276, 0.0195065, 1.862247, 1, 1, 1, 1, 1,
0.6045842, -0.5598849, 1.085631, 1, 1, 1, 1, 1,
0.6085558, 1.10971, 0.8680613, 1, 1, 1, 1, 1,
0.6127976, 0.2737211, -0.02298666, 1, 1, 1, 1, 1,
0.6144894, -0.01243801, 2.481934, 1, 1, 1, 1, 1,
0.616111, -0.03288338, -0.171473, 1, 1, 1, 1, 1,
0.6204273, -0.7603028, 1.748307, 1, 1, 1, 1, 1,
0.6219421, 2.238382, 0.7075713, 1, 1, 1, 1, 1,
0.6227407, 0.555728, 0.725469, 1, 1, 1, 1, 1,
0.6240612, 1.206775, 0.132361, 1, 1, 1, 1, 1,
0.6317598, -0.03853459, -0.009932188, 1, 1, 1, 1, 1,
0.6403834, 1.440542, 0.9942225, 1, 1, 1, 1, 1,
0.6407675, -0.4490967, 2.384608, 0, 0, 1, 1, 1,
0.6422585, -0.1135542, 3.028338, 1, 0, 0, 1, 1,
0.6426497, 0.1481664, 4.287204, 1, 0, 0, 1, 1,
0.6431156, -1.503354, 4.233718, 1, 0, 0, 1, 1,
0.6436248, 1.429114, 0.5571117, 1, 0, 0, 1, 1,
0.6442465, 0.3346792, -0.3930489, 1, 0, 0, 1, 1,
0.6507613, 1.010625, 1.118871, 0, 0, 0, 1, 1,
0.6547136, 0.0587027, 1.50312, 0, 0, 0, 1, 1,
0.6608632, 0.5602764, 0.8638934, 0, 0, 0, 1, 1,
0.6608762, 0.125865, 2.371666, 0, 0, 0, 1, 1,
0.6611213, 1.249054, -0.304496, 0, 0, 0, 1, 1,
0.6621093, 1.094307, 3.083772, 0, 0, 0, 1, 1,
0.6711875, 0.995556, -1.130349, 0, 0, 0, 1, 1,
0.6730939, 0.6225117, 1.164312, 1, 1, 1, 1, 1,
0.685829, 0.4224935, 0.1674631, 1, 1, 1, 1, 1,
0.6858314, 0.7398325, 0.9067912, 1, 1, 1, 1, 1,
0.6860816, -0.39621, 2.187983, 1, 1, 1, 1, 1,
0.6926973, 0.06562141, 2.257096, 1, 1, 1, 1, 1,
0.6930884, -0.04939665, 1.378439, 1, 1, 1, 1, 1,
0.6936578, 1.414692, 0.6675386, 1, 1, 1, 1, 1,
0.6946451, -0.1497987, 2.159996, 1, 1, 1, 1, 1,
0.6957915, 0.1655894, 0.8605868, 1, 1, 1, 1, 1,
0.6972091, -1.468113, 2.093182, 1, 1, 1, 1, 1,
0.6993837, -1.633788, 2.481565, 1, 1, 1, 1, 1,
0.7003899, -0.3203541, 0.4364019, 1, 1, 1, 1, 1,
0.7065184, 2.72715, 1.807728, 1, 1, 1, 1, 1,
0.7067934, 0.4836426, 0.2719766, 1, 1, 1, 1, 1,
0.7122282, 0.1693565, 0.9249593, 1, 1, 1, 1, 1,
0.7126935, 1.344018, -0.2788424, 0, 0, 1, 1, 1,
0.7171223, -0.9747594, 2.098807, 1, 0, 0, 1, 1,
0.7171957, -0.5830733, 1.446678, 1, 0, 0, 1, 1,
0.7226862, 0.03365605, -0.2606526, 1, 0, 0, 1, 1,
0.7232304, -1.288225, 4.36465, 1, 0, 0, 1, 1,
0.7232837, 0.1957203, 1.570663, 1, 0, 0, 1, 1,
0.7257689, -0.2948349, 0.9586891, 0, 0, 0, 1, 1,
0.727266, 0.6145452, 0.1536396, 0, 0, 0, 1, 1,
0.7281724, 0.8165528, 1.950473, 0, 0, 0, 1, 1,
0.7291535, 0.2942784, 1.346462, 0, 0, 0, 1, 1,
0.7342973, 0.2470686, 1.114964, 0, 0, 0, 1, 1,
0.7353527, -0.2044907, 2.069427, 0, 0, 0, 1, 1,
0.7371628, 0.9184131, -0.3986746, 0, 0, 0, 1, 1,
0.7437028, -1.732677, 2.354163, 1, 1, 1, 1, 1,
0.7460402, -0.6933522, 0.9269478, 1, 1, 1, 1, 1,
0.7489721, -0.4213064, 1.441958, 1, 1, 1, 1, 1,
0.7538455, -0.3909262, 0.399264, 1, 1, 1, 1, 1,
0.7557692, -0.7331747, 2.964649, 1, 1, 1, 1, 1,
0.7562372, -1.134108, 3.48836, 1, 1, 1, 1, 1,
0.761851, 1.904558, 0.04302943, 1, 1, 1, 1, 1,
0.762145, -0.8959323, 2.39031, 1, 1, 1, 1, 1,
0.7640271, -0.7096038, 1.765931, 1, 1, 1, 1, 1,
0.7651212, 0.8175042, -0.6811659, 1, 1, 1, 1, 1,
0.7710825, 1.749609, 3.268967, 1, 1, 1, 1, 1,
0.7740555, 0.8026816, 0.4293694, 1, 1, 1, 1, 1,
0.7746065, -0.2681386, 1.869762, 1, 1, 1, 1, 1,
0.7808626, -0.9239931, 4.323427, 1, 1, 1, 1, 1,
0.7869542, 0.814858, 0.2731762, 1, 1, 1, 1, 1,
0.7899353, -1.387672, 2.604624, 0, 0, 1, 1, 1,
0.7921079, -0.1527017, 0.5126133, 1, 0, 0, 1, 1,
0.7953398, -0.2239758, 2.794456, 1, 0, 0, 1, 1,
0.7987862, 1.089595, 1.818576, 1, 0, 0, 1, 1,
0.8018019, -1.650881, 2.092445, 1, 0, 0, 1, 1,
0.8102118, -0.0974199, 1.574502, 1, 0, 0, 1, 1,
0.8164639, -1.460045, 1.99716, 0, 0, 0, 1, 1,
0.8187692, 1.739964, -0.1541203, 0, 0, 0, 1, 1,
0.8226003, -0.1551759, 1.409923, 0, 0, 0, 1, 1,
0.8288203, 1.180149, 1.306558, 0, 0, 0, 1, 1,
0.8308905, 1.47255, 0.9920155, 0, 0, 0, 1, 1,
0.8311894, -1.022958, 1.407997, 0, 0, 0, 1, 1,
0.8339218, -1.203368, 3.811104, 0, 0, 0, 1, 1,
0.8366197, -1.364275, 3.662214, 1, 1, 1, 1, 1,
0.8372874, -0.3981797, 3.076769, 1, 1, 1, 1, 1,
0.8679615, 0.07699253, 2.467335, 1, 1, 1, 1, 1,
0.8684894, -0.02747413, 2.667969, 1, 1, 1, 1, 1,
0.8702444, -1.033757, 1.051861, 1, 1, 1, 1, 1,
0.8721061, 1.365063, 2.471622, 1, 1, 1, 1, 1,
0.8764169, 0.2338915, 2.464379, 1, 1, 1, 1, 1,
0.8773844, -0.1288054, 1.090852, 1, 1, 1, 1, 1,
0.8841178, 0.2678429, 1.972315, 1, 1, 1, 1, 1,
0.8872149, -2.102147, 0.5827083, 1, 1, 1, 1, 1,
0.8912072, 0.6416036, 2.442498, 1, 1, 1, 1, 1,
0.8947265, 0.6041479, 1.877433, 1, 1, 1, 1, 1,
0.8962572, 0.751695, 1.188263, 1, 1, 1, 1, 1,
0.8983377, -0.3644133, 0.7940428, 1, 1, 1, 1, 1,
0.9022849, 1.397814, 2.09054, 1, 1, 1, 1, 1,
0.9052458, 0.7222363, 1.550389, 0, 0, 1, 1, 1,
0.9063728, 2.000249, 1.798684, 1, 0, 0, 1, 1,
0.9076798, -0.0786109, 2.275947, 1, 0, 0, 1, 1,
0.9085374, 0.4516914, 0.5591385, 1, 0, 0, 1, 1,
0.9096181, -0.3933949, 2.815694, 1, 0, 0, 1, 1,
0.9124537, 0.184814, 0.676926, 1, 0, 0, 1, 1,
0.9142444, 1.310465, 1.386024, 0, 0, 0, 1, 1,
0.9182705, -0.02722342, 0.5524848, 0, 0, 0, 1, 1,
0.9202284, 0.2120963, 0.6235594, 0, 0, 0, 1, 1,
0.9203692, -0.5886818, 3.649351, 0, 0, 0, 1, 1,
0.9215965, 0.9490464, 1.353728, 0, 0, 0, 1, 1,
0.9243737, -0.1270178, 1.319741, 0, 0, 0, 1, 1,
0.9250349, -0.3075496, 0.4904379, 0, 0, 0, 1, 1,
0.9367878, 1.050422, 0.4465768, 1, 1, 1, 1, 1,
0.9395965, -2.105418, 2.220295, 1, 1, 1, 1, 1,
0.9404349, 1.580386, 1.358572, 1, 1, 1, 1, 1,
0.9431191, -1.067898, 1.226373, 1, 1, 1, 1, 1,
0.9474887, -0.6260442, 1.669528, 1, 1, 1, 1, 1,
0.948976, -0.5848847, 1.952014, 1, 1, 1, 1, 1,
0.9499903, -0.08965337, 0.4734431, 1, 1, 1, 1, 1,
0.9523706, 0.6582361, 1.072642, 1, 1, 1, 1, 1,
0.9581668, -0.8636217, 1.949091, 1, 1, 1, 1, 1,
0.9610585, -0.8254238, 3.563517, 1, 1, 1, 1, 1,
0.9649727, 0.9498617, 2.869263, 1, 1, 1, 1, 1,
0.966301, 0.7533628, 0.9964895, 1, 1, 1, 1, 1,
0.9671487, -0.3612395, 2.351609, 1, 1, 1, 1, 1,
0.9814665, 0.1096094, 1.989543, 1, 1, 1, 1, 1,
0.9821939, -1.275288, 3.308125, 1, 1, 1, 1, 1,
0.9847171, 1.151018, -1.196114, 0, 0, 1, 1, 1,
0.988561, 0.3790268, 0.7930334, 1, 0, 0, 1, 1,
0.9898964, 1.410796, 1.25262, 1, 0, 0, 1, 1,
0.9957487, 1.518953, 0.9969913, 1, 0, 0, 1, 1,
0.9983495, -1.07504, 2.248772, 1, 0, 0, 1, 1,
1.004205, -1.157441, 3.207599, 1, 0, 0, 1, 1,
1.00806, 1.443874, -1.062644, 0, 0, 0, 1, 1,
1.023294, -1.605329, 2.242182, 0, 0, 0, 1, 1,
1.023862, -1.119897, 2.637776, 0, 0, 0, 1, 1,
1.032566, -0.9717982, 2.146548, 0, 0, 0, 1, 1,
1.033408, 0.5955302, -0.7306876, 0, 0, 0, 1, 1,
1.048841, 1.084111, 0.2250713, 0, 0, 0, 1, 1,
1.057103, -1.978478, 2.525535, 0, 0, 0, 1, 1,
1.068426, -0.358144, 2.526014, 1, 1, 1, 1, 1,
1.070815, 0.5632715, 0.287757, 1, 1, 1, 1, 1,
1.072407, -0.4343973, 1.92604, 1, 1, 1, 1, 1,
1.072788, -0.8348485, 2.29108, 1, 1, 1, 1, 1,
1.07393, 0.2523793, 2.047032, 1, 1, 1, 1, 1,
1.078564, 0.7773477, 1.598673, 1, 1, 1, 1, 1,
1.083781, 0.1987925, 1.27808, 1, 1, 1, 1, 1,
1.086795, -1.026722, 2.037762, 1, 1, 1, 1, 1,
1.093771, 0.2749819, -0.08800063, 1, 1, 1, 1, 1,
1.095889, 0.2101959, 0.5942608, 1, 1, 1, 1, 1,
1.104369, 0.9672189, 0.8751417, 1, 1, 1, 1, 1,
1.117008, -1.327537, 2.769705, 1, 1, 1, 1, 1,
1.124914, 0.5127295, 1.349077, 1, 1, 1, 1, 1,
1.127307, 0.116005, 1.056653, 1, 1, 1, 1, 1,
1.135593, -0.5535029, 0.8251317, 1, 1, 1, 1, 1,
1.135985, 0.2402715, 2.422695, 0, 0, 1, 1, 1,
1.140938, -0.07257359, 0.3904817, 1, 0, 0, 1, 1,
1.142782, -0.296413, 2.059744, 1, 0, 0, 1, 1,
1.14465, -1.287222, 2.133769, 1, 0, 0, 1, 1,
1.148728, -3.239958, 1.903118, 1, 0, 0, 1, 1,
1.150292, 2.203912, 0.2347334, 1, 0, 0, 1, 1,
1.157111, -0.7940697, 0.348911, 0, 0, 0, 1, 1,
1.162471, 0.2737941, 1.499089, 0, 0, 0, 1, 1,
1.170188, -0.9565777, 1.683142, 0, 0, 0, 1, 1,
1.180411, 0.6670341, 2.032765, 0, 0, 0, 1, 1,
1.195854, 2.241638, 0.01368974, 0, 0, 0, 1, 1,
1.196851, -0.4859653, 3.14456, 0, 0, 0, 1, 1,
1.199757, 1.207798, -0.1870175, 0, 0, 0, 1, 1,
1.2012, -0.9878562, 2.757008, 1, 1, 1, 1, 1,
1.207273, 0.122798, 4.364628, 1, 1, 1, 1, 1,
1.21455, 0.6149256, 2.545126, 1, 1, 1, 1, 1,
1.217788, -0.8718879, 2.10868, 1, 1, 1, 1, 1,
1.218733, 0.02203948, 1.828729, 1, 1, 1, 1, 1,
1.222435, -1.285327, 1.757261, 1, 1, 1, 1, 1,
1.225616, 1.134027, 1.401678, 1, 1, 1, 1, 1,
1.226485, -0.0878237, 2.90722, 1, 1, 1, 1, 1,
1.229887, 0.2931853, 0.08401612, 1, 1, 1, 1, 1,
1.237984, 1.342805, 1.243948, 1, 1, 1, 1, 1,
1.23899, -0.4900632, 1.150113, 1, 1, 1, 1, 1,
1.245384, 0.1571696, 2.195208, 1, 1, 1, 1, 1,
1.250908, -0.3801055, 1.064142, 1, 1, 1, 1, 1,
1.251067, 0.4683873, -0.06363685, 1, 1, 1, 1, 1,
1.254776, 0.7325097, 2.322402, 1, 1, 1, 1, 1,
1.259047, -3.464035, 3.593156, 0, 0, 1, 1, 1,
1.261726, -0.3705162, 0.9046434, 1, 0, 0, 1, 1,
1.267798, 0.07378696, 0.1433576, 1, 0, 0, 1, 1,
1.267903, 0.9592339, 1.565911, 1, 0, 0, 1, 1,
1.273653, -0.6321276, 1.334278, 1, 0, 0, 1, 1,
1.274275, 1.133551, -0.6252807, 1, 0, 0, 1, 1,
1.297389, 0.7788318, 1.609131, 0, 0, 0, 1, 1,
1.319047, -0.1599094, 4.154676, 0, 0, 0, 1, 1,
1.3212, 0.8348635, 2.321322, 0, 0, 0, 1, 1,
1.326712, -1.239612, 2.177147, 0, 0, 0, 1, 1,
1.328294, 1.406722, -0.7769436, 0, 0, 0, 1, 1,
1.333058, -1.38262, 2.657775, 0, 0, 0, 1, 1,
1.334407, 0.3346753, 1.071571, 0, 0, 0, 1, 1,
1.343247, 0.1434746, 1.441867, 1, 1, 1, 1, 1,
1.349651, -0.9256206, 2.693589, 1, 1, 1, 1, 1,
1.352541, -0.367944, 2.791729, 1, 1, 1, 1, 1,
1.353035, -1.064296, 2.397079, 1, 1, 1, 1, 1,
1.37001, -0.2820837, 2.814053, 1, 1, 1, 1, 1,
1.373579, 1.676214, 1.561398, 1, 1, 1, 1, 1,
1.379958, -0.7392418, 1.121636, 1, 1, 1, 1, 1,
1.380759, -0.412584, 1.755919, 1, 1, 1, 1, 1,
1.381495, 1.825407, 0.9776697, 1, 1, 1, 1, 1,
1.384894, -0.385447, 1.266027, 1, 1, 1, 1, 1,
1.385938, -0.5075257, -0.3372055, 1, 1, 1, 1, 1,
1.390359, -0.8108487, 2.054427, 1, 1, 1, 1, 1,
1.397857, 1.005636, 2.230659, 1, 1, 1, 1, 1,
1.427883, -0.8927421, 1.456224, 1, 1, 1, 1, 1,
1.44567, 0.195626, 1.034117, 1, 1, 1, 1, 1,
1.448155, -0.2468887, 1.651521, 0, 0, 1, 1, 1,
1.471829, -2.336825, 0.8468911, 1, 0, 0, 1, 1,
1.47382, -0.7126962, 3.902291, 1, 0, 0, 1, 1,
1.474386, 0.4260255, 1.352182, 1, 0, 0, 1, 1,
1.505415, -0.1724093, 1.534445, 1, 0, 0, 1, 1,
1.505945, -1.259469, 3.304568, 1, 0, 0, 1, 1,
1.507064, -0.9403686, 0.7403744, 0, 0, 0, 1, 1,
1.515373, 1.178327, 0.228146, 0, 0, 0, 1, 1,
1.517354, 1.513999, 1.17606, 0, 0, 0, 1, 1,
1.545743, -1.059449, 2.177855, 0, 0, 0, 1, 1,
1.554912, 0.7685939, 2.847632, 0, 0, 0, 1, 1,
1.555718, 0.1345728, 0.06312235, 0, 0, 0, 1, 1,
1.556783, 1.646228, 0.03819734, 0, 0, 0, 1, 1,
1.564186, -0.5024981, 1.990429, 1, 1, 1, 1, 1,
1.598463, -0.3574256, 1.513477, 1, 1, 1, 1, 1,
1.605034, -1.461773, 2.25089, 1, 1, 1, 1, 1,
1.616563, 0.52218, 1.79373, 1, 1, 1, 1, 1,
1.626767, 1.247632, 1.16675, 1, 1, 1, 1, 1,
1.633778, -1.449394, 2.21013, 1, 1, 1, 1, 1,
1.634321, 0.12384, 1.700808, 1, 1, 1, 1, 1,
1.636476, -0.6022906, 2.520264, 1, 1, 1, 1, 1,
1.645737, 0.7314286, 0.2555714, 1, 1, 1, 1, 1,
1.665476, -0.7032448, 1.839924, 1, 1, 1, 1, 1,
1.672112, -0.6249278, 1.930887, 1, 1, 1, 1, 1,
1.684559, -1.485002, 2.297262, 1, 1, 1, 1, 1,
1.694246, -0.130516, 2.066121, 1, 1, 1, 1, 1,
1.720354, -0.5957028, 0.3302246, 1, 1, 1, 1, 1,
1.725376, 0.5526637, 1.7645, 1, 1, 1, 1, 1,
1.765795, 0.419339, 0.5194027, 0, 0, 1, 1, 1,
1.772596, -0.710337, 1.263314, 1, 0, 0, 1, 1,
1.792367, 0.2439425, -0.3913445, 1, 0, 0, 1, 1,
1.793788, 1.258362, 2.553987, 1, 0, 0, 1, 1,
1.79648, -1.02605, 1.42632, 1, 0, 0, 1, 1,
1.80311, -0.8534917, 1.777392, 1, 0, 0, 1, 1,
1.811689, -0.03934625, 2.713406, 0, 0, 0, 1, 1,
1.824327, 1.777858, -0.4798872, 0, 0, 0, 1, 1,
1.828793, -1.099783, 2.033043, 0, 0, 0, 1, 1,
1.831876, 0.3435078, 0.431158, 0, 0, 0, 1, 1,
1.833645, 0.9393628, 1.022259, 0, 0, 0, 1, 1,
1.846726, -0.1347494, 2.587067, 0, 0, 0, 1, 1,
1.876767, 1.77691, 0.919311, 0, 0, 0, 1, 1,
1.884707, -0.2575266, 2.900962, 1, 1, 1, 1, 1,
1.893095, 2.596132, 0.2488979, 1, 1, 1, 1, 1,
1.901583, 0.07312639, 0.9915883, 1, 1, 1, 1, 1,
1.902498, 0.122248, 0.3963102, 1, 1, 1, 1, 1,
1.933487, 0.6414933, 0.2159733, 1, 1, 1, 1, 1,
1.952076, 0.1226267, 2.955645, 1, 1, 1, 1, 1,
1.996341, 0.6501918, 0.3630026, 1, 1, 1, 1, 1,
2.0441, -0.8984078, 1.416525, 1, 1, 1, 1, 1,
2.052128, 2.68701, 0.1848139, 1, 1, 1, 1, 1,
2.078598, 0.2884335, 1.613018, 1, 1, 1, 1, 1,
2.107899, 0.2790619, 0.8202751, 1, 1, 1, 1, 1,
2.112425, 0.7813411, 1.236863, 1, 1, 1, 1, 1,
2.114279, 0.003300709, 3.149133, 1, 1, 1, 1, 1,
2.138882, -0.4184557, 0.75058, 1, 1, 1, 1, 1,
2.155823, 0.1251891, 1.222609, 1, 1, 1, 1, 1,
2.186711, 0.8102187, 0.5509401, 0, 0, 1, 1, 1,
2.189193, 0.4836104, 1.966432, 1, 0, 0, 1, 1,
2.215917, 0.3130095, 0.2333395, 1, 0, 0, 1, 1,
2.233811, 1.428172, 1.099434, 1, 0, 0, 1, 1,
2.259556, -0.5230632, 2.970233, 1, 0, 0, 1, 1,
2.277151, 1.601119, 2.478054, 1, 0, 0, 1, 1,
2.323495, -0.3360674, 2.262965, 0, 0, 0, 1, 1,
2.346226, 0.4506932, 2.991785, 0, 0, 0, 1, 1,
2.348023, 0.2973732, 4.235589, 0, 0, 0, 1, 1,
2.349667, -0.8512292, 1.386361, 0, 0, 0, 1, 1,
2.35514, -0.2755724, 4.090408, 0, 0, 0, 1, 1,
2.365633, 0.6602831, 3.183073, 0, 0, 0, 1, 1,
2.412779, -0.4574675, 2.180649, 0, 0, 0, 1, 1,
2.428361, 1.282885, 0.2204625, 1, 1, 1, 1, 1,
2.458349, -1.473385, 2.448315, 1, 1, 1, 1, 1,
2.48375, -0.0345409, 0.6180212, 1, 1, 1, 1, 1,
2.527153, -1.579292, 1.615842, 1, 1, 1, 1, 1,
2.543782, -2.264007, 1.200192, 1, 1, 1, 1, 1,
2.60937, 1.654216, 0.2929311, 1, 1, 1, 1, 1,
2.989614, -1.743095, 0.0844257, 1, 1, 1, 1, 1
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
var radius = 9.571513;
var distance = 33.61953;
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
mvMatrix.translate( 0.003093958, 0.0654211, 0.01486206 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61953);
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
