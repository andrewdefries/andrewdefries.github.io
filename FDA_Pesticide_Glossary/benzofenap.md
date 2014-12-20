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
-2.820917, 1.088406, -2.403446, 1, 0, 0, 1,
-2.702415, -0.5371279, -0.2299431, 1, 0.007843138, 0, 1,
-2.623744, -0.5370734, -1.793516, 1, 0.01176471, 0, 1,
-2.557816, 0.243658, -1.860231, 1, 0.01960784, 0, 1,
-2.504517, 0.8126262, -0.2839012, 1, 0.02352941, 0, 1,
-2.434208, 2.570426, -1.48441, 1, 0.03137255, 0, 1,
-2.381598, -0.7724951, -1.447164, 1, 0.03529412, 0, 1,
-2.275724, -0.3745126, -0.1037271, 1, 0.04313726, 0, 1,
-2.239138, 0.08679192, -0.4506859, 1, 0.04705882, 0, 1,
-2.124789, -2.339467, -2.626488, 1, 0.05490196, 0, 1,
-2.113194, -0.8748818, -1.365366, 1, 0.05882353, 0, 1,
-2.112426, -0.3996155, -0.7026479, 1, 0.06666667, 0, 1,
-2.005188, -0.2897369, -4.138023, 1, 0.07058824, 0, 1,
-1.999773, 0.7201815, -1.330243, 1, 0.07843138, 0, 1,
-1.944509, -2.123438, -1.816882, 1, 0.08235294, 0, 1,
-1.935592, 0.03206997, -0.6148106, 1, 0.09019608, 0, 1,
-1.929967, 0.02514204, 0.595988, 1, 0.09411765, 0, 1,
-1.924373, 0.3559809, -1.764482, 1, 0.1019608, 0, 1,
-1.92314, -0.8613994, -2.716645, 1, 0.1098039, 0, 1,
-1.876094, 1.344218, -0.9718772, 1, 0.1137255, 0, 1,
-1.852739, -0.9745574, -2.774735, 1, 0.1215686, 0, 1,
-1.822023, 0.07507473, -1.794895, 1, 0.1254902, 0, 1,
-1.800727, -0.7975731, -2.219808, 1, 0.1333333, 0, 1,
-1.795989, 0.4553366, -3.914618, 1, 0.1372549, 0, 1,
-1.788893, 0.1500278, -0.9028499, 1, 0.145098, 0, 1,
-1.770691, -2.630078, -2.94317, 1, 0.1490196, 0, 1,
-1.76283, 0.6455194, -0.7395001, 1, 0.1568628, 0, 1,
-1.748657, -1.795045, -0.6629336, 1, 0.1607843, 0, 1,
-1.685267, 0.2230326, -1.554258, 1, 0.1686275, 0, 1,
-1.682696, -0.8642713, -3.092361, 1, 0.172549, 0, 1,
-1.6698, -1.744074, -1.434836, 1, 0.1803922, 0, 1,
-1.645635, 0.5483279, -1.753448, 1, 0.1843137, 0, 1,
-1.642574, -1.377863, -0.7133483, 1, 0.1921569, 0, 1,
-1.633806, -1.473914, -3.078784, 1, 0.1960784, 0, 1,
-1.632723, -0.7751458, -1.709154, 1, 0.2039216, 0, 1,
-1.630338, 1.359801, -1.622902, 1, 0.2117647, 0, 1,
-1.628284, 0.6053499, -0.930011, 1, 0.2156863, 0, 1,
-1.620924, -0.9959496, -2.679693, 1, 0.2235294, 0, 1,
-1.606577, 0.7506312, -2.421624, 1, 0.227451, 0, 1,
-1.602755, 1.062672, -0.1542776, 1, 0.2352941, 0, 1,
-1.588212, 1.683276, -0.3992831, 1, 0.2392157, 0, 1,
-1.577243, -0.7232888, -1.176072, 1, 0.2470588, 0, 1,
-1.558934, 0.1352163, -1.557305, 1, 0.2509804, 0, 1,
-1.538915, 1.214307, 0.1468161, 1, 0.2588235, 0, 1,
-1.525956, 0.3960682, -2.519106, 1, 0.2627451, 0, 1,
-1.510559, 0.4573817, -2.361424, 1, 0.2705882, 0, 1,
-1.509915, 1.073719, -2.498847, 1, 0.2745098, 0, 1,
-1.508396, 1.546694, -1.258774, 1, 0.282353, 0, 1,
-1.505695, -1.317858, -2.808891, 1, 0.2862745, 0, 1,
-1.495382, -0.9127856, -1.454491, 1, 0.2941177, 0, 1,
-1.489751, 1.423203, -0.7295455, 1, 0.3019608, 0, 1,
-1.481089, -0.5529331, -1.052102, 1, 0.3058824, 0, 1,
-1.477329, -0.5073406, -1.595837, 1, 0.3137255, 0, 1,
-1.472053, -0.501341, -1.804267, 1, 0.3176471, 0, 1,
-1.467909, -0.8561773, -1.147822, 1, 0.3254902, 0, 1,
-1.466824, -0.313163, -1.368933, 1, 0.3294118, 0, 1,
-1.449479, 0.2445991, -2.099342, 1, 0.3372549, 0, 1,
-1.443046, -0.0912767, -0.8323891, 1, 0.3411765, 0, 1,
-1.436435, 0.02760369, -1.161832, 1, 0.3490196, 0, 1,
-1.421096, -0.3829349, -2.580103, 1, 0.3529412, 0, 1,
-1.420193, -0.06732461, -2.086012, 1, 0.3607843, 0, 1,
-1.397063, -1.01496, -3.300203, 1, 0.3647059, 0, 1,
-1.395124, -1.074047, -2.089157, 1, 0.372549, 0, 1,
-1.391145, 1.155891, -1.046025, 1, 0.3764706, 0, 1,
-1.38117, 0.6002875, -1.355059, 1, 0.3843137, 0, 1,
-1.375529, 0.5075898, -0.9140106, 1, 0.3882353, 0, 1,
-1.367177, -0.6369654, -4.050325, 1, 0.3960784, 0, 1,
-1.366308, -0.1797028, -1.070972, 1, 0.4039216, 0, 1,
-1.365448, -0.02296583, -2.312555, 1, 0.4078431, 0, 1,
-1.348913, 0.2462926, -0.8963805, 1, 0.4156863, 0, 1,
-1.340715, 0.2537915, -1.974279, 1, 0.4196078, 0, 1,
-1.339626, -0.372729, -2.610028, 1, 0.427451, 0, 1,
-1.32452, 0.7586209, -1.301079, 1, 0.4313726, 0, 1,
-1.323491, 0.4830575, -1.008523, 1, 0.4392157, 0, 1,
-1.319215, -1.84139, -3.291328, 1, 0.4431373, 0, 1,
-1.315408, 0.2960448, -2.618096, 1, 0.4509804, 0, 1,
-1.312672, -1.641605, -2.518204, 1, 0.454902, 0, 1,
-1.31126, 0.1108034, -2.17033, 1, 0.4627451, 0, 1,
-1.310897, -2.292456, -2.274955, 1, 0.4666667, 0, 1,
-1.309505, 0.4797307, -1.074875, 1, 0.4745098, 0, 1,
-1.306752, 0.9308808, -0.2562291, 1, 0.4784314, 0, 1,
-1.300364, 1.109704, -2.504437, 1, 0.4862745, 0, 1,
-1.295783, 0.8749067, -2.254357, 1, 0.4901961, 0, 1,
-1.293281, 1.701842, -1.499331, 1, 0.4980392, 0, 1,
-1.292093, 0.6067537, -2.18125, 1, 0.5058824, 0, 1,
-1.280352, 1.387007, -0.2544919, 1, 0.509804, 0, 1,
-1.276511, -0.764411, -3.423753, 1, 0.5176471, 0, 1,
-1.271715, -0.3717161, -2.495918, 1, 0.5215687, 0, 1,
-1.266279, 0.2416839, -1.922287, 1, 0.5294118, 0, 1,
-1.250534, 0.5883936, -0.8231867, 1, 0.5333334, 0, 1,
-1.249329, 0.2297625, -2.821905, 1, 0.5411765, 0, 1,
-1.246089, 0.1217452, -1.690276, 1, 0.5450981, 0, 1,
-1.239095, 0.1766553, -0.7227959, 1, 0.5529412, 0, 1,
-1.231023, 0.1458494, -2.031292, 1, 0.5568628, 0, 1,
-1.21869, 0.3975245, -1.596034, 1, 0.5647059, 0, 1,
-1.214984, 1.230416, -0.6496645, 1, 0.5686275, 0, 1,
-1.212192, 0.2203708, -2.575402, 1, 0.5764706, 0, 1,
-1.202078, -0.4221921, -2.115611, 1, 0.5803922, 0, 1,
-1.198544, -1.60622, -1.653876, 1, 0.5882353, 0, 1,
-1.197721, 0.6147947, 1.889914, 1, 0.5921569, 0, 1,
-1.196026, -1.539654, -2.491067, 1, 0.6, 0, 1,
-1.190034, -1.267446, -3.44258, 1, 0.6078432, 0, 1,
-1.1876, -0.4718097, -2.061248, 1, 0.6117647, 0, 1,
-1.186823, 0.1802362, -1.54393, 1, 0.6196079, 0, 1,
-1.184, -1.670153, -2.36346, 1, 0.6235294, 0, 1,
-1.182295, -1.708601, -2.392806, 1, 0.6313726, 0, 1,
-1.179213, 0.8403092, -0.3251885, 1, 0.6352941, 0, 1,
-1.178592, -0.2371651, -0.06931161, 1, 0.6431373, 0, 1,
-1.17576, 1.621584, 0.7962115, 1, 0.6470588, 0, 1,
-1.174388, -0.01737858, -0.9553935, 1, 0.654902, 0, 1,
-1.17406, 0.2713847, -1.501508, 1, 0.6588235, 0, 1,
-1.171928, -1.215016, -2.71536, 1, 0.6666667, 0, 1,
-1.170386, 0.6450864, 0.5229666, 1, 0.6705883, 0, 1,
-1.161884, 0.6634147, -2.099622, 1, 0.6784314, 0, 1,
-1.150015, -0.05751606, -1.733151, 1, 0.682353, 0, 1,
-1.146868, -0.878309, -2.648735, 1, 0.6901961, 0, 1,
-1.144816, 0.4379585, -0.6747017, 1, 0.6941177, 0, 1,
-1.139615, -0.3442916, -1.407886, 1, 0.7019608, 0, 1,
-1.137595, -0.996528, -1.942233, 1, 0.7098039, 0, 1,
-1.135609, -0.6438295, -2.909581, 1, 0.7137255, 0, 1,
-1.128517, -1.380095, -2.602357, 1, 0.7215686, 0, 1,
-1.122014, 0.16062, 0.1199427, 1, 0.7254902, 0, 1,
-1.118266, -1.627752, -1.611439, 1, 0.7333333, 0, 1,
-1.114725, -0.1472952, -1.053931, 1, 0.7372549, 0, 1,
-1.113103, -0.7236112, -2.211365, 1, 0.7450981, 0, 1,
-1.109719, -2.641049, -1.50018, 1, 0.7490196, 0, 1,
-1.097246, 0.2980224, -0.1470841, 1, 0.7568628, 0, 1,
-1.091213, 0.189219, -2.675203, 1, 0.7607843, 0, 1,
-1.084535, 0.3658001, -2.714178, 1, 0.7686275, 0, 1,
-1.078847, 0.3992536, -0.04213141, 1, 0.772549, 0, 1,
-1.078052, -0.103466, -3.546531, 1, 0.7803922, 0, 1,
-1.074149, -1.027297, -1.365555, 1, 0.7843137, 0, 1,
-1.068913, -1.0776, -3.288366, 1, 0.7921569, 0, 1,
-1.058607, 0.06542001, -1.596614, 1, 0.7960784, 0, 1,
-1.049611, 0.7303633, -1.568511, 1, 0.8039216, 0, 1,
-1.03593, 0.2114787, -0.3900245, 1, 0.8117647, 0, 1,
-1.032911, 0.6132157, -0.07079381, 1, 0.8156863, 0, 1,
-1.031095, -0.0849135, -1.000104, 1, 0.8235294, 0, 1,
-1.02996, 1.31107, -0.405816, 1, 0.827451, 0, 1,
-1.024979, -1.728336, -5.491966, 1, 0.8352941, 0, 1,
-1.02122, -0.5486908, -1.363166, 1, 0.8392157, 0, 1,
-1.016114, -0.828296, -0.7411907, 1, 0.8470588, 0, 1,
-1.010027, 0.0356956, -1.341685, 1, 0.8509804, 0, 1,
-1.00897, -0.8419049, -1.480173, 1, 0.8588235, 0, 1,
-1.001292, 0.4748475, -0.5421803, 1, 0.8627451, 0, 1,
-0.9980887, 1.542516, -0.7497503, 1, 0.8705882, 0, 1,
-0.9980654, -0.7683563, -3.448409, 1, 0.8745098, 0, 1,
-0.9979288, -1.3126, -2.946493, 1, 0.8823529, 0, 1,
-0.9961513, -0.2112871, -2.345452, 1, 0.8862745, 0, 1,
-0.9942263, -0.8560996, -2.953775, 1, 0.8941177, 0, 1,
-0.989992, -0.7234191, -0.4061, 1, 0.8980392, 0, 1,
-0.9879441, 1.391684, -0.7786517, 1, 0.9058824, 0, 1,
-0.987038, 0.008667634, -1.810527, 1, 0.9137255, 0, 1,
-0.9831518, -1.60923, -0.6826153, 1, 0.9176471, 0, 1,
-0.981302, 0.7446502, -0.1352303, 1, 0.9254902, 0, 1,
-0.9756141, 0.4031696, -2.324266, 1, 0.9294118, 0, 1,
-0.9735965, -0.4328407, -2.154498, 1, 0.9372549, 0, 1,
-0.9718988, 0.63998, -1.151955, 1, 0.9411765, 0, 1,
-0.9690005, -1.001968, -1.153541, 1, 0.9490196, 0, 1,
-0.966695, 0.01895957, -1.791422, 1, 0.9529412, 0, 1,
-0.9655908, -0.4691432, -2.825475, 1, 0.9607843, 0, 1,
-0.9649959, -2.479294, -2.335623, 1, 0.9647059, 0, 1,
-0.9642026, -0.5989203, -2.256893, 1, 0.972549, 0, 1,
-0.9621482, 1.822377, 0.006392113, 1, 0.9764706, 0, 1,
-0.9528205, -0.6642154, -1.869195, 1, 0.9843137, 0, 1,
-0.9492599, -0.09796869, -1.616977, 1, 0.9882353, 0, 1,
-0.9450057, 0.7952815, -0.4464042, 1, 0.9960784, 0, 1,
-0.9440259, 2.321297, 0.9576297, 0.9960784, 1, 0, 1,
-0.9370049, -0.4145728, -2.207584, 0.9921569, 1, 0, 1,
-0.9296134, -1.412397, -3.561349, 0.9843137, 1, 0, 1,
-0.9295894, 0.9244364, -1.926511, 0.9803922, 1, 0, 1,
-0.9264397, 1.510414, 0.3034851, 0.972549, 1, 0, 1,
-0.925693, -2.094163, -3.871938, 0.9686275, 1, 0, 1,
-0.9229131, -1.882175, -2.506585, 0.9607843, 1, 0, 1,
-0.9153632, -0.1713545, -0.8267615, 0.9568627, 1, 0, 1,
-0.9114825, -0.2647694, -3.091531, 0.9490196, 1, 0, 1,
-0.90955, 1.150671, -0.01481218, 0.945098, 1, 0, 1,
-0.9062603, -0.1063571, -2.066627, 0.9372549, 1, 0, 1,
-0.8999785, 1.675275, 1.059856, 0.9333333, 1, 0, 1,
-0.899659, 0.512081, 0.5171615, 0.9254902, 1, 0, 1,
-0.8961545, 0.8329376, -2.171545, 0.9215686, 1, 0, 1,
-0.8871523, -0.5408122, -3.11953, 0.9137255, 1, 0, 1,
-0.8848683, 0.8609306, -1.127409, 0.9098039, 1, 0, 1,
-0.884472, -0.7586102, -2.042936, 0.9019608, 1, 0, 1,
-0.88285, -2.111314, -2.149496, 0.8941177, 1, 0, 1,
-0.8823299, -2.196884, -1.728215, 0.8901961, 1, 0, 1,
-0.8818707, -0.2144419, -1.331235, 0.8823529, 1, 0, 1,
-0.8811842, -0.8266394, -2.81089, 0.8784314, 1, 0, 1,
-0.8805134, -1.698448, -0.4385931, 0.8705882, 1, 0, 1,
-0.8784201, -0.0972736, -3.171766, 0.8666667, 1, 0, 1,
-0.8779947, -0.6502619, -3.675552, 0.8588235, 1, 0, 1,
-0.8766069, 1.1914, 0.7012446, 0.854902, 1, 0, 1,
-0.8758542, -0.1482474, -0.9453217, 0.8470588, 1, 0, 1,
-0.8732958, 0.539013, -1.88945, 0.8431373, 1, 0, 1,
-0.8722669, -0.1274249, -3.252596, 0.8352941, 1, 0, 1,
-0.8605887, 3.012334, 0.4080857, 0.8313726, 1, 0, 1,
-0.8489402, -0.7064539, -2.509053, 0.8235294, 1, 0, 1,
-0.8420191, -1.043628, -1.797379, 0.8196079, 1, 0, 1,
-0.840286, 1.116718, -1.075088, 0.8117647, 1, 0, 1,
-0.8397635, 0.6091784, -1.405676, 0.8078431, 1, 0, 1,
-0.8392418, 0.4378632, -0.8477733, 0.8, 1, 0, 1,
-0.8390613, 0.1152847, 0.2173245, 0.7921569, 1, 0, 1,
-0.8359446, 0.9000452, -0.2453077, 0.7882353, 1, 0, 1,
-0.8306946, -1.044711, -3.458494, 0.7803922, 1, 0, 1,
-0.8277358, -0.2102345, -3.637994, 0.7764706, 1, 0, 1,
-0.8266144, -0.8120123, -1.991015, 0.7686275, 1, 0, 1,
-0.8205225, 0.3761508, -2.603412, 0.7647059, 1, 0, 1,
-0.8199265, -0.4227327, -2.874855, 0.7568628, 1, 0, 1,
-0.8182803, -0.8732698, -2.801146, 0.7529412, 1, 0, 1,
-0.815613, 0.3230243, 0.6032743, 0.7450981, 1, 0, 1,
-0.8146423, -1.512864, -4.755996, 0.7411765, 1, 0, 1,
-0.8133354, 0.2557595, -3.077623, 0.7333333, 1, 0, 1,
-0.8122815, -0.1607718, -2.802383, 0.7294118, 1, 0, 1,
-0.8086457, -1.413853, -1.732192, 0.7215686, 1, 0, 1,
-0.8056269, 0.8888155, -2.418429, 0.7176471, 1, 0, 1,
-0.805456, 0.04687831, -2.349787, 0.7098039, 1, 0, 1,
-0.804828, 1.122827, -1.506523, 0.7058824, 1, 0, 1,
-0.8044631, -1.137141, -0.9319522, 0.6980392, 1, 0, 1,
-0.7999337, 0.4491257, -1.021176, 0.6901961, 1, 0, 1,
-0.7929958, -1.068895, -1.638654, 0.6862745, 1, 0, 1,
-0.7885184, -0.08020385, -2.828737, 0.6784314, 1, 0, 1,
-0.7883254, -1.704557, -1.174463, 0.6745098, 1, 0, 1,
-0.7853357, -1.152225, -3.248783, 0.6666667, 1, 0, 1,
-0.7840794, -1.363126, -3.245559, 0.6627451, 1, 0, 1,
-0.782152, -1.089575, -2.733673, 0.654902, 1, 0, 1,
-0.7728414, -0.2665921, -1.757185, 0.6509804, 1, 0, 1,
-0.7662855, 0.2563614, -2.225065, 0.6431373, 1, 0, 1,
-0.7601522, 1.019284, 0.4021984, 0.6392157, 1, 0, 1,
-0.7545936, -0.3606111, -1.257625, 0.6313726, 1, 0, 1,
-0.7521709, -0.3817454, -1.246031, 0.627451, 1, 0, 1,
-0.7521563, -0.06938893, -3.328372, 0.6196079, 1, 0, 1,
-0.7505957, -0.4522178, -2.936939, 0.6156863, 1, 0, 1,
-0.7471481, -1.012533, -3.187176, 0.6078432, 1, 0, 1,
-0.7441443, -0.2497248, -4.023794, 0.6039216, 1, 0, 1,
-0.7391512, -0.1455487, -2.820427, 0.5960785, 1, 0, 1,
-0.7375932, -0.01858146, -0.4918626, 0.5882353, 1, 0, 1,
-0.7269099, 0.07545104, -1.809582, 0.5843138, 1, 0, 1,
-0.7217389, -1.601614, -3.52683, 0.5764706, 1, 0, 1,
-0.7148248, 1.39593, -0.2996364, 0.572549, 1, 0, 1,
-0.7133319, -1.400151, -2.168097, 0.5647059, 1, 0, 1,
-0.7128587, -0.3276654, -2.744443, 0.5607843, 1, 0, 1,
-0.7116852, -0.3403971, -2.859075, 0.5529412, 1, 0, 1,
-0.7080317, 0.1580911, -0.3748709, 0.5490196, 1, 0, 1,
-0.7060233, 2.08227, -1.603348, 0.5411765, 1, 0, 1,
-0.7037311, 0.4172034, -0.7854114, 0.5372549, 1, 0, 1,
-0.6920623, -1.093631, -3.154444, 0.5294118, 1, 0, 1,
-0.6845806, -0.4560218, -1.064543, 0.5254902, 1, 0, 1,
-0.6807626, 0.1627867, -0.157196, 0.5176471, 1, 0, 1,
-0.6787645, -0.5298489, -2.602146, 0.5137255, 1, 0, 1,
-0.6776351, -0.9883656, -1.105175, 0.5058824, 1, 0, 1,
-0.6763936, 0.2907903, 1.129749, 0.5019608, 1, 0, 1,
-0.671771, 0.1029874, -0.7684507, 0.4941176, 1, 0, 1,
-0.6699548, 0.6156303, -0.9465778, 0.4862745, 1, 0, 1,
-0.6673057, -0.3295719, -0.9640073, 0.4823529, 1, 0, 1,
-0.665851, -1.165232, -1.867545, 0.4745098, 1, 0, 1,
-0.6643412, -0.5663456, -2.742547, 0.4705882, 1, 0, 1,
-0.6630718, 1.339864, -1.120302, 0.4627451, 1, 0, 1,
-0.6586693, 0.6276584, 0.8355493, 0.4588235, 1, 0, 1,
-0.6540073, 0.8141007, -0.9846143, 0.4509804, 1, 0, 1,
-0.652784, 0.2091533, -2.413199, 0.4470588, 1, 0, 1,
-0.6459595, 0.2925113, -0.1850229, 0.4392157, 1, 0, 1,
-0.6455092, -1.320989, -3.41061, 0.4352941, 1, 0, 1,
-0.6410192, -0.070323, 0.342048, 0.427451, 1, 0, 1,
-0.6379464, -0.342706, -1.945052, 0.4235294, 1, 0, 1,
-0.6295109, -0.7444832, -1.799196, 0.4156863, 1, 0, 1,
-0.628243, -0.1788149, -0.1321579, 0.4117647, 1, 0, 1,
-0.6245295, 0.2775616, -1.875144, 0.4039216, 1, 0, 1,
-0.6148272, 0.4561355, -1.674802, 0.3960784, 1, 0, 1,
-0.6136356, 0.2350297, -0.7919686, 0.3921569, 1, 0, 1,
-0.6092616, 0.3520236, -0.4524354, 0.3843137, 1, 0, 1,
-0.6059092, -0.8688305, -2.475092, 0.3803922, 1, 0, 1,
-0.6051533, -0.5179363, -1.987853, 0.372549, 1, 0, 1,
-0.6042888, -0.7559021, -3.508044, 0.3686275, 1, 0, 1,
-0.5996602, -0.1553133, -2.623807, 0.3607843, 1, 0, 1,
-0.5991375, -1.676124, -2.628565, 0.3568628, 1, 0, 1,
-0.5943108, -0.1252275, -1.917736, 0.3490196, 1, 0, 1,
-0.5907378, -1.640029, -1.850164, 0.345098, 1, 0, 1,
-0.588452, -1.764239, -2.545472, 0.3372549, 1, 0, 1,
-0.5874447, -1.343194, -2.385529, 0.3333333, 1, 0, 1,
-0.5794532, 0.2593359, -1.990642, 0.3254902, 1, 0, 1,
-0.5727361, -0.6274482, -2.419547, 0.3215686, 1, 0, 1,
-0.5709065, -0.9233428, -1.510673, 0.3137255, 1, 0, 1,
-0.5645543, -0.1208626, -1.565851, 0.3098039, 1, 0, 1,
-0.5631974, -1.364412, -2.751073, 0.3019608, 1, 0, 1,
-0.561227, -0.2542056, -3.653162, 0.2941177, 1, 0, 1,
-0.5575523, -0.5626444, -3.814394, 0.2901961, 1, 0, 1,
-0.5540472, -0.3714873, -3.124136, 0.282353, 1, 0, 1,
-0.552938, -0.8709328, -1.660275, 0.2784314, 1, 0, 1,
-0.5430727, -0.5422105, -2.842089, 0.2705882, 1, 0, 1,
-0.5425139, 0.4224991, -1.526936, 0.2666667, 1, 0, 1,
-0.5374175, -0.5487085, -1.679546, 0.2588235, 1, 0, 1,
-0.535066, 0.1223721, -1.17416, 0.254902, 1, 0, 1,
-0.5343639, 1.205107, 0.733361, 0.2470588, 1, 0, 1,
-0.5329337, -0.4289025, -2.296698, 0.2431373, 1, 0, 1,
-0.5283746, 1.801738, -0.4531808, 0.2352941, 1, 0, 1,
-0.5177041, -0.3817076, -1.504762, 0.2313726, 1, 0, 1,
-0.5173066, -1.092338, -0.5521813, 0.2235294, 1, 0, 1,
-0.5078655, -0.4768821, -3.753004, 0.2196078, 1, 0, 1,
-0.5076577, 1.365846, -0.4867345, 0.2117647, 1, 0, 1,
-0.5072263, -0.242324, -1.644297, 0.2078431, 1, 0, 1,
-0.5016917, -0.6132105, -1.340114, 0.2, 1, 0, 1,
-0.5016911, 1.137847, -1.234409, 0.1921569, 1, 0, 1,
-0.4931106, -0.5299479, -1.266656, 0.1882353, 1, 0, 1,
-0.4919058, 1.074614, -0.4471211, 0.1803922, 1, 0, 1,
-0.4915586, -0.181174, -3.181115, 0.1764706, 1, 0, 1,
-0.4906892, 0.7612576, -0.5313528, 0.1686275, 1, 0, 1,
-0.4883139, -1.292269, -5.408567, 0.1647059, 1, 0, 1,
-0.4861245, -0.4867101, -2.160181, 0.1568628, 1, 0, 1,
-0.4833378, -2.213544, -2.325395, 0.1529412, 1, 0, 1,
-0.4746596, -0.3911185, -3.028423, 0.145098, 1, 0, 1,
-0.4727685, 1.202643, -0.8916041, 0.1411765, 1, 0, 1,
-0.4725134, 0.4555624, -1.44003, 0.1333333, 1, 0, 1,
-0.4714719, -0.5917225, -2.948152, 0.1294118, 1, 0, 1,
-0.4706194, -0.1467863, -1.499117, 0.1215686, 1, 0, 1,
-0.4675998, 0.5986626, -0.9036053, 0.1176471, 1, 0, 1,
-0.4657115, -1.508903, -2.719094, 0.1098039, 1, 0, 1,
-0.4653869, 0.9513665, 0.4556794, 0.1058824, 1, 0, 1,
-0.4644028, -1.105354, -1.731233, 0.09803922, 1, 0, 1,
-0.4631834, -0.6135451, -2.827616, 0.09019608, 1, 0, 1,
-0.4600613, -0.3302432, -3.344934, 0.08627451, 1, 0, 1,
-0.4597787, 0.537492, -0.9462705, 0.07843138, 1, 0, 1,
-0.4535958, 0.3770291, -1.139887, 0.07450981, 1, 0, 1,
-0.4460973, 0.6547021, 0.2376858, 0.06666667, 1, 0, 1,
-0.4438411, 0.9923338, 0.2666385, 0.0627451, 1, 0, 1,
-0.4419764, 1.066146, 0.1191471, 0.05490196, 1, 0, 1,
-0.4392241, 1.094185, 0.5534649, 0.05098039, 1, 0, 1,
-0.437864, -0.1156602, -1.02877, 0.04313726, 1, 0, 1,
-0.4378586, 1.005242, -0.1192554, 0.03921569, 1, 0, 1,
-0.4343606, 0.514475, -1.267269, 0.03137255, 1, 0, 1,
-0.4305898, -0.1270872, -1.046376, 0.02745098, 1, 0, 1,
-0.4305021, 1.404045, -1.061617, 0.01960784, 1, 0, 1,
-0.4297499, -0.5766357, -5.559705, 0.01568628, 1, 0, 1,
-0.4253165, 1.180128, 0.7744583, 0.007843138, 1, 0, 1,
-0.4220938, -1.081015, -2.961196, 0.003921569, 1, 0, 1,
-0.421815, 1.202845, -1.470971, 0, 1, 0.003921569, 1,
-0.4217437, 0.3341342, -2.313383, 0, 1, 0.01176471, 1,
-0.4217241, 0.4300361, -0.8421214, 0, 1, 0.01568628, 1,
-0.4205676, 0.7039678, 0.157757, 0, 1, 0.02352941, 1,
-0.4192901, 0.7508751, 0.8906943, 0, 1, 0.02745098, 1,
-0.4167322, 0.09890536, -1.875246, 0, 1, 0.03529412, 1,
-0.4138499, -0.7557812, -2.038992, 0, 1, 0.03921569, 1,
-0.4097938, -0.5967773, -3.05229, 0, 1, 0.04705882, 1,
-0.4054299, -0.6532558, -1.842773, 0, 1, 0.05098039, 1,
-0.4029757, 0.6080503, -1.081858, 0, 1, 0.05882353, 1,
-0.4008873, 0.5858443, 0.5278184, 0, 1, 0.0627451, 1,
-0.3891335, -0.6413934, -2.027664, 0, 1, 0.07058824, 1,
-0.3846568, 1.609562, -1.342659, 0, 1, 0.07450981, 1,
-0.3823631, -1.295526, -2.886076, 0, 1, 0.08235294, 1,
-0.3809366, 1.130495, -1.515035, 0, 1, 0.08627451, 1,
-0.3750739, 0.150894, 0.7111607, 0, 1, 0.09411765, 1,
-0.3747826, -0.2249414, -1.033358, 0, 1, 0.1019608, 1,
-0.3732066, -1.159528, -2.740396, 0, 1, 0.1058824, 1,
-0.3703562, 1.133903, -0.8004252, 0, 1, 0.1137255, 1,
-0.3699325, 0.6708841, 0.1348222, 0, 1, 0.1176471, 1,
-0.3696745, 0.2415737, -0.8617882, 0, 1, 0.1254902, 1,
-0.3677348, 1.486934, -0.2273731, 0, 1, 0.1294118, 1,
-0.3676338, 1.91651, 1.023334, 0, 1, 0.1372549, 1,
-0.366069, 0.5655333, -0.3420723, 0, 1, 0.1411765, 1,
-0.3618689, 1.081583, 0.1888402, 0, 1, 0.1490196, 1,
-0.361346, -1.260135, -2.075373, 0, 1, 0.1529412, 1,
-0.3606362, -0.3237593, -3.737393, 0, 1, 0.1607843, 1,
-0.3605131, 0.7813104, -0.08030949, 0, 1, 0.1647059, 1,
-0.3592233, 0.1400788, -1.841573, 0, 1, 0.172549, 1,
-0.3567008, -1.128593, -3.527343, 0, 1, 0.1764706, 1,
-0.3535608, -0.9557021, -1.93418, 0, 1, 0.1843137, 1,
-0.348451, -1.644649, -2.735077, 0, 1, 0.1882353, 1,
-0.3476318, 0.6184506, 0.3997584, 0, 1, 0.1960784, 1,
-0.344949, 1.24633, -0.5660707, 0, 1, 0.2039216, 1,
-0.3445361, 1.291374, -0.1476484, 0, 1, 0.2078431, 1,
-0.3442046, 1.878599, 0.547318, 0, 1, 0.2156863, 1,
-0.3441148, -1.456782, -2.18349, 0, 1, 0.2196078, 1,
-0.3425107, -0.2890822, -1.953478, 0, 1, 0.227451, 1,
-0.3392065, 1.592927, -0.7737697, 0, 1, 0.2313726, 1,
-0.3340657, 0.7538932, 0.6830283, 0, 1, 0.2392157, 1,
-0.332486, -0.3557818, -3.394925, 0, 1, 0.2431373, 1,
-0.3295705, -1.213365, -3.269848, 0, 1, 0.2509804, 1,
-0.3267881, 0.6354879, 0.2559195, 0, 1, 0.254902, 1,
-0.3261335, 1.476449, 0.5191303, 0, 1, 0.2627451, 1,
-0.3254524, -1.903912, -0.670692, 0, 1, 0.2666667, 1,
-0.3193795, -0.880311, -1.913365, 0, 1, 0.2745098, 1,
-0.3185432, -0.5510992, -3.084939, 0, 1, 0.2784314, 1,
-0.3153856, -0.5627661, -3.076141, 0, 1, 0.2862745, 1,
-0.3152494, 0.3559244, -0.6622896, 0, 1, 0.2901961, 1,
-0.3137253, 0.6539806, -0.2144304, 0, 1, 0.2980392, 1,
-0.3103132, -0.4447364, -2.968219, 0, 1, 0.3058824, 1,
-0.3030752, -2.074978, -3.58645, 0, 1, 0.3098039, 1,
-0.3008035, -0.3894833, -0.6841381, 0, 1, 0.3176471, 1,
-0.2952363, 0.7888197, -1.627158, 0, 1, 0.3215686, 1,
-0.2946101, 0.2061843, 0.5075986, 0, 1, 0.3294118, 1,
-0.2935943, 0.5498504, 1.246941, 0, 1, 0.3333333, 1,
-0.291332, 1.698133, -1.338016, 0, 1, 0.3411765, 1,
-0.2893289, 0.5621911, -0.07985868, 0, 1, 0.345098, 1,
-0.2882967, -1.203957, -2.373638, 0, 1, 0.3529412, 1,
-0.2863117, 1.700692, -0.4270764, 0, 1, 0.3568628, 1,
-0.2842405, 0.5593499, -0.03098138, 0, 1, 0.3647059, 1,
-0.2787256, -1.182727, -2.178532, 0, 1, 0.3686275, 1,
-0.2767095, -0.4374386, -2.89782, 0, 1, 0.3764706, 1,
-0.2766885, -0.0957434, 0.5824485, 0, 1, 0.3803922, 1,
-0.2765903, 0.5200543, -2.272472, 0, 1, 0.3882353, 1,
-0.274714, -1.480729, -3.334957, 0, 1, 0.3921569, 1,
-0.2742936, -0.5489892, -2.050398, 0, 1, 0.4, 1,
-0.2713611, 0.4968473, 0.6992562, 0, 1, 0.4078431, 1,
-0.2639565, 2.726127, -1.474106, 0, 1, 0.4117647, 1,
-0.2606932, 0.4202666, -0.3876383, 0, 1, 0.4196078, 1,
-0.260104, -1.232402, -2.900364, 0, 1, 0.4235294, 1,
-0.2590357, -0.4693313, -0.217002, 0, 1, 0.4313726, 1,
-0.2567451, 0.7556275, -1.118437, 0, 1, 0.4352941, 1,
-0.2566385, -1.460282, -4.662004, 0, 1, 0.4431373, 1,
-0.2564371, 0.4960189, 0.01013721, 0, 1, 0.4470588, 1,
-0.2544011, 0.2395997, -0.5235053, 0, 1, 0.454902, 1,
-0.2520057, -1.207291, -3.062688, 0, 1, 0.4588235, 1,
-0.2499391, -0.7375419, -1.04628, 0, 1, 0.4666667, 1,
-0.2489293, 1.749288, 0.005206715, 0, 1, 0.4705882, 1,
-0.2483839, -2.033633, -3.664774, 0, 1, 0.4784314, 1,
-0.2444266, -0.5296272, -3.534757, 0, 1, 0.4823529, 1,
-0.2430524, -1.616546, -3.177607, 0, 1, 0.4901961, 1,
-0.2345844, -1.342176, -1.88195, 0, 1, 0.4941176, 1,
-0.234033, -0.8825513, -2.707172, 0, 1, 0.5019608, 1,
-0.2330002, -0.07297184, -1.741671, 0, 1, 0.509804, 1,
-0.2325506, -0.650107, -2.402293, 0, 1, 0.5137255, 1,
-0.2322216, -1.391249, -2.23549, 0, 1, 0.5215687, 1,
-0.2308163, 1.463833, -0.1844154, 0, 1, 0.5254902, 1,
-0.230316, -1.131404, -5.072323, 0, 1, 0.5333334, 1,
-0.2258587, 2.219893, 1.04542, 0, 1, 0.5372549, 1,
-0.2248945, -0.4903949, -1.974788, 0, 1, 0.5450981, 1,
-0.2227785, 0.3543478, -0.8006247, 0, 1, 0.5490196, 1,
-0.2167334, -0.4508338, -4.241457, 0, 1, 0.5568628, 1,
-0.2157445, -1.768308, -4.365298, 0, 1, 0.5607843, 1,
-0.2141419, 0.2240717, -0.02780738, 0, 1, 0.5686275, 1,
-0.2128267, 1.298026, 0.7387694, 0, 1, 0.572549, 1,
-0.2115644, 0.04382411, -1.177992, 0, 1, 0.5803922, 1,
-0.2113611, 0.2460771, 1.083491, 0, 1, 0.5843138, 1,
-0.2013156, -2.333105, -3.859029, 0, 1, 0.5921569, 1,
-0.1958427, 0.6781573, -0.5518713, 0, 1, 0.5960785, 1,
-0.1940274, -0.4440582, -3.671653, 0, 1, 0.6039216, 1,
-0.1931656, -0.3547618, -2.945631, 0, 1, 0.6117647, 1,
-0.192658, -1.745096, -4.498842, 0, 1, 0.6156863, 1,
-0.1881523, 2.13716, -0.8525938, 0, 1, 0.6235294, 1,
-0.1769398, -0.1998514, -3.594141, 0, 1, 0.627451, 1,
-0.1739224, -0.4282014, -2.328462, 0, 1, 0.6352941, 1,
-0.1731697, 0.2262416, 0.8790567, 0, 1, 0.6392157, 1,
-0.1730737, 0.3162152, -2.809382, 0, 1, 0.6470588, 1,
-0.1694082, -0.5427459, -1.530886, 0, 1, 0.6509804, 1,
-0.1689651, -1.114038, -1.797066, 0, 1, 0.6588235, 1,
-0.1622463, 1.083208, -1.579657, 0, 1, 0.6627451, 1,
-0.1608954, 0.2789393, 0.2611202, 0, 1, 0.6705883, 1,
-0.158211, 0.6724525, -1.950596, 0, 1, 0.6745098, 1,
-0.1545327, 0.2360531, 0.01265201, 0, 1, 0.682353, 1,
-0.1538162, -1.794124, -3.080028, 0, 1, 0.6862745, 1,
-0.1531637, -1.130576, -3.166904, 0, 1, 0.6941177, 1,
-0.1456267, 0.6547512, -0.08535799, 0, 1, 0.7019608, 1,
-0.1440879, -0.2869317, -3.228414, 0, 1, 0.7058824, 1,
-0.1396991, 0.8137685, 0.08676533, 0, 1, 0.7137255, 1,
-0.1386705, 0.08474995, -1.171381, 0, 1, 0.7176471, 1,
-0.1369148, -0.287679, -1.957934, 0, 1, 0.7254902, 1,
-0.1360787, -0.1130412, -2.258327, 0, 1, 0.7294118, 1,
-0.1292525, -0.1248602, -2.50848, 0, 1, 0.7372549, 1,
-0.127804, 0.911778, 2.388519, 0, 1, 0.7411765, 1,
-0.126672, -0.6395488, -2.991605, 0, 1, 0.7490196, 1,
-0.1253982, -1.186405, -3.605, 0, 1, 0.7529412, 1,
-0.1249589, -1.117689, -1.625526, 0, 1, 0.7607843, 1,
-0.1209355, -0.8489027, -2.853006, 0, 1, 0.7647059, 1,
-0.1163281, -0.8633563, -3.399863, 0, 1, 0.772549, 1,
-0.1143413, -0.4124896, -2.354874, 0, 1, 0.7764706, 1,
-0.1141425, 0.4426461, -1.144904, 0, 1, 0.7843137, 1,
-0.1135061, -0.2411761, -3.111933, 0, 1, 0.7882353, 1,
-0.1131766, 2.565303, -0.430461, 0, 1, 0.7960784, 1,
-0.1124707, 0.6575882, -0.1060288, 0, 1, 0.8039216, 1,
-0.1102861, 0.3695842, -0.6113481, 0, 1, 0.8078431, 1,
-0.1067608, -0.1117301, -2.506853, 0, 1, 0.8156863, 1,
-0.1023759, 2.406317, -1.098221, 0, 1, 0.8196079, 1,
-0.09867319, -0.4983682, -3.048977, 0, 1, 0.827451, 1,
-0.0960207, 0.5930203, -0.04919374, 0, 1, 0.8313726, 1,
-0.09560037, 1.592203, 0.719001, 0, 1, 0.8392157, 1,
-0.09279554, 0.4158597, -1.245382, 0, 1, 0.8431373, 1,
-0.09171338, 0.03413649, -0.2568723, 0, 1, 0.8509804, 1,
-0.09015311, -0.3749454, -2.582623, 0, 1, 0.854902, 1,
-0.08857641, -0.6606648, -3.284478, 0, 1, 0.8627451, 1,
-0.08709811, 0.9941734, 0.9153278, 0, 1, 0.8666667, 1,
-0.08602065, 0.9256256, 0.8830718, 0, 1, 0.8745098, 1,
-0.07258257, -0.1027876, -1.52444, 0, 1, 0.8784314, 1,
-0.07063045, 0.9195749, -0.03455238, 0, 1, 0.8862745, 1,
-0.06970416, -1.730813, -5.003397, 0, 1, 0.8901961, 1,
-0.06898085, -1.848518, -0.624752, 0, 1, 0.8980392, 1,
-0.06871393, -0.1965992, -1.969533, 0, 1, 0.9058824, 1,
-0.06762248, 0.406335, -0.07651501, 0, 1, 0.9098039, 1,
-0.06574038, 2.203632, 2.019929, 0, 1, 0.9176471, 1,
-0.06028474, 0.7305431, 0.3576139, 0, 1, 0.9215686, 1,
-0.05762848, -2.124804, -3.752088, 0, 1, 0.9294118, 1,
-0.04863596, 0.542712, 0.09587535, 0, 1, 0.9333333, 1,
-0.0468533, -0.4334976, -1.851392, 0, 1, 0.9411765, 1,
-0.04576959, 0.1775413, 0.05215498, 0, 1, 0.945098, 1,
-0.04555786, 0.9146088, -0.4962203, 0, 1, 0.9529412, 1,
-0.04451065, 0.6044535, -0.321506, 0, 1, 0.9568627, 1,
-0.04408828, -0.1274178, -4.326185, 0, 1, 0.9647059, 1,
-0.04316909, 0.8834691, -0.8213165, 0, 1, 0.9686275, 1,
-0.0431018, -0.8965666, -3.585847, 0, 1, 0.9764706, 1,
-0.0428537, -1.682459, -1.775065, 0, 1, 0.9803922, 1,
-0.04280961, -0.3470304, -1.50689, 0, 1, 0.9882353, 1,
-0.02603365, -0.08916198, -2.887459, 0, 1, 0.9921569, 1,
-0.0252744, -1.287851, -1.870412, 0, 1, 1, 1,
-0.02520346, -0.5316743, -2.728363, 0, 0.9921569, 1, 1,
-0.02504316, -0.9653557, -3.12617, 0, 0.9882353, 1, 1,
-0.02159791, -0.2011385, -2.257878, 0, 0.9803922, 1, 1,
-0.01925511, 1.401542, 0.9753147, 0, 0.9764706, 1, 1,
-0.01332666, -1.385996, -3.584586, 0, 0.9686275, 1, 1,
-0.01283791, -0.8298232, -3.512312, 0, 0.9647059, 1, 1,
-0.008290251, 2.565858, 0.1540563, 0, 0.9568627, 1, 1,
-0.007627099, -0.905063, -1.928518, 0, 0.9529412, 1, 1,
-0.00736475, 1.225516, 0.8569227, 0, 0.945098, 1, 1,
-0.003120788, 0.7289072, 1.59055, 0, 0.9411765, 1, 1,
-0.001905968, -0.319339, -2.473524, 0, 0.9333333, 1, 1,
-0.000286499, -0.06023856, -4.167756, 0, 0.9294118, 1, 1,
0.002860031, -1.074812, 3.605433, 0, 0.9215686, 1, 1,
0.004207355, 0.9575833, -0.2367003, 0, 0.9176471, 1, 1,
0.005432274, -0.524826, 3.416499, 0, 0.9098039, 1, 1,
0.005514717, 0.480034, -1.928332, 0, 0.9058824, 1, 1,
0.007168876, 0.6304813, 0.3929867, 0, 0.8980392, 1, 1,
0.008583766, -0.08168527, 4.195267, 0, 0.8901961, 1, 1,
0.01071511, 0.1485936, 0.1428153, 0, 0.8862745, 1, 1,
0.01118381, -0.5045643, 4.087327, 0, 0.8784314, 1, 1,
0.01205549, 0.0241704, 1.377159, 0, 0.8745098, 1, 1,
0.01633077, -0.6781482, 3.879942, 0, 0.8666667, 1, 1,
0.01653587, 1.716666, 0.3064851, 0, 0.8627451, 1, 1,
0.01699598, 0.290862, 0.6054646, 0, 0.854902, 1, 1,
0.0176237, 0.2558022, 1.215298, 0, 0.8509804, 1, 1,
0.01869462, -1.396926, 3.726692, 0, 0.8431373, 1, 1,
0.02729434, -0.7345828, 2.072161, 0, 0.8392157, 1, 1,
0.02858254, -0.8810255, 3.85177, 0, 0.8313726, 1, 1,
0.02869742, -0.132091, 4.739816, 0, 0.827451, 1, 1,
0.02881522, 0.7639857, -1.125762, 0, 0.8196079, 1, 1,
0.03066585, -0.7978896, 2.561029, 0, 0.8156863, 1, 1,
0.03179292, 1.946925, 0.3034328, 0, 0.8078431, 1, 1,
0.03526142, -0.3973259, 3.114741, 0, 0.8039216, 1, 1,
0.03740329, 0.4806856, 0.4657097, 0, 0.7960784, 1, 1,
0.03953781, 0.6496885, -1.285883, 0, 0.7882353, 1, 1,
0.04258921, -0.7833613, 2.995726, 0, 0.7843137, 1, 1,
0.05135977, 1.863967, 0.9996222, 0, 0.7764706, 1, 1,
0.05424042, 0.4468015, -0.2550229, 0, 0.772549, 1, 1,
0.05668908, -0.8794304, 2.683648, 0, 0.7647059, 1, 1,
0.05670068, -0.833429, 2.276952, 0, 0.7607843, 1, 1,
0.06115445, -0.5678297, 1.415323, 0, 0.7529412, 1, 1,
0.06645119, 0.5569789, 0.08739522, 0, 0.7490196, 1, 1,
0.06936154, -1.304359, 1.14777, 0, 0.7411765, 1, 1,
0.06967936, 2.016382, 1.640177, 0, 0.7372549, 1, 1,
0.07027299, -0.8459258, 4.17166, 0, 0.7294118, 1, 1,
0.07056203, 0.6668311, 0.4796557, 0, 0.7254902, 1, 1,
0.07579182, -1.517804, 3.565851, 0, 0.7176471, 1, 1,
0.07641907, 1.074075, 0.3067067, 0, 0.7137255, 1, 1,
0.0812561, -0.848713, 2.701773, 0, 0.7058824, 1, 1,
0.08567577, 0.05250383, 0.1822602, 0, 0.6980392, 1, 1,
0.09105815, 0.07354938, 1.039947, 0, 0.6941177, 1, 1,
0.09539629, 0.1603192, -0.8402059, 0, 0.6862745, 1, 1,
0.09555365, -0.5403624, 1.906917, 0, 0.682353, 1, 1,
0.0969326, 0.1978378, -0.5513296, 0, 0.6745098, 1, 1,
0.09982668, 0.2595998, 0.9243442, 0, 0.6705883, 1, 1,
0.09997112, -0.1887922, 1.88651, 0, 0.6627451, 1, 1,
0.1016398, 1.890297, -0.2694871, 0, 0.6588235, 1, 1,
0.1046085, 0.5351192, 0.2330657, 0, 0.6509804, 1, 1,
0.1058017, 0.7197793, 0.5481473, 0, 0.6470588, 1, 1,
0.1058424, -0.9462352, 1.67208, 0, 0.6392157, 1, 1,
0.1135339, -1.382341, 3.554528, 0, 0.6352941, 1, 1,
0.1190596, 0.7052554, 0.9229015, 0, 0.627451, 1, 1,
0.1219432, -0.5418562, 1.656123, 0, 0.6235294, 1, 1,
0.1247001, 1.259547, -0.4900775, 0, 0.6156863, 1, 1,
0.1264994, 0.0459997, 1.034243, 0, 0.6117647, 1, 1,
0.1289574, -1.494964, 4.722302, 0, 0.6039216, 1, 1,
0.1297427, 1.290841, -0.5333133, 0, 0.5960785, 1, 1,
0.1309478, -0.3900726, 3.256716, 0, 0.5921569, 1, 1,
0.1377381, 0.3883575, -0.5408804, 0, 0.5843138, 1, 1,
0.1403266, -0.04940875, 1.703797, 0, 0.5803922, 1, 1,
0.1407481, 0.7951503, 0.6451646, 0, 0.572549, 1, 1,
0.1418427, 1.244193, -0.897242, 0, 0.5686275, 1, 1,
0.1422131, 0.1884141, 1.580428, 0, 0.5607843, 1, 1,
0.1482321, -0.9083633, 4.705005, 0, 0.5568628, 1, 1,
0.1534147, -0.3352228, 2.083984, 0, 0.5490196, 1, 1,
0.1534758, -1.889772, 5.192066, 0, 0.5450981, 1, 1,
0.1551723, -0.5926786, 3.585924, 0, 0.5372549, 1, 1,
0.1643771, -0.1612277, 2.595689, 0, 0.5333334, 1, 1,
0.1673281, -0.7839378, 3.579903, 0, 0.5254902, 1, 1,
0.1680748, -0.9819409, 1.916538, 0, 0.5215687, 1, 1,
0.17054, 1.489318, -0.5808564, 0, 0.5137255, 1, 1,
0.1716667, -1.031239, 5.049479, 0, 0.509804, 1, 1,
0.1718987, 0.8714045, -0.7870461, 0, 0.5019608, 1, 1,
0.1749983, -0.3500354, 3.343715, 0, 0.4941176, 1, 1,
0.1771599, 1.658168, 1.683118, 0, 0.4901961, 1, 1,
0.1777232, -2.192806, 4.189855, 0, 0.4823529, 1, 1,
0.18588, -0.2051471, 2.336441, 0, 0.4784314, 1, 1,
0.1869625, -0.64388, 3.986241, 0, 0.4705882, 1, 1,
0.1880642, -0.6053, 1.869832, 0, 0.4666667, 1, 1,
0.1892289, 0.4114678, 0.9837158, 0, 0.4588235, 1, 1,
0.1928431, 0.6799184, 0.57328, 0, 0.454902, 1, 1,
0.1995168, 0.06015587, 1.007011, 0, 0.4470588, 1, 1,
0.2036563, -1.137275, 2.168397, 0, 0.4431373, 1, 1,
0.2116432, 1.083434, 0.1530723, 0, 0.4352941, 1, 1,
0.2177694, 1.307745, 2.412004, 0, 0.4313726, 1, 1,
0.2185882, 2.485684, 0.04984842, 0, 0.4235294, 1, 1,
0.2202062, 0.1579249, 2.144528, 0, 0.4196078, 1, 1,
0.2214949, -0.6426216, 2.771476, 0, 0.4117647, 1, 1,
0.2287317, 1.264497, -0.5477269, 0, 0.4078431, 1, 1,
0.2293505, 0.7853857, 1.248588, 0, 0.4, 1, 1,
0.2381227, 0.1961306, 2.074265, 0, 0.3921569, 1, 1,
0.2467792, 0.2636228, -0.177643, 0, 0.3882353, 1, 1,
0.2499794, -0.1133039, 2.911886, 0, 0.3803922, 1, 1,
0.2564898, 1.92541, 0.4302233, 0, 0.3764706, 1, 1,
0.2635882, -0.9931673, 3.51861, 0, 0.3686275, 1, 1,
0.269197, 0.1328876, 1.839885, 0, 0.3647059, 1, 1,
0.2756779, 0.1696594, 1.002599, 0, 0.3568628, 1, 1,
0.2779618, -1.683086, 2.050868, 0, 0.3529412, 1, 1,
0.278713, -0.4622014, 2.586771, 0, 0.345098, 1, 1,
0.28065, 0.35207, -0.9791412, 0, 0.3411765, 1, 1,
0.2851024, 0.8522433, 0.2841126, 0, 0.3333333, 1, 1,
0.2851258, -0.4138975, 3.490199, 0, 0.3294118, 1, 1,
0.2881068, 0.782977, -0.4378805, 0, 0.3215686, 1, 1,
0.2946317, 1.193251, 1.057457, 0, 0.3176471, 1, 1,
0.2950639, 0.2931916, 1.119389, 0, 0.3098039, 1, 1,
0.2976102, -0.3207244, 0.8524943, 0, 0.3058824, 1, 1,
0.300136, 0.2755775, 0.9179104, 0, 0.2980392, 1, 1,
0.3018275, 0.2978829, 2.80795, 0, 0.2901961, 1, 1,
0.3051667, -1.406113, 1.71865, 0, 0.2862745, 1, 1,
0.3073912, 0.01204833, 0.199767, 0, 0.2784314, 1, 1,
0.3101993, -0.3866957, 2.922844, 0, 0.2745098, 1, 1,
0.3222407, -0.9771237, 3.237588, 0, 0.2666667, 1, 1,
0.3226135, -0.5500583, 3.334854, 0, 0.2627451, 1, 1,
0.3227409, 0.07467344, 3.725132, 0, 0.254902, 1, 1,
0.3259838, -1.016908, 1.948435, 0, 0.2509804, 1, 1,
0.3287386, 0.03565161, -0.7443053, 0, 0.2431373, 1, 1,
0.328832, -1.054551, 3.351241, 0, 0.2392157, 1, 1,
0.3289064, 0.3267433, 0.2011376, 0, 0.2313726, 1, 1,
0.3311208, 0.3371584, 0.3772651, 0, 0.227451, 1, 1,
0.3335818, 0.4543434, -1.127918, 0, 0.2196078, 1, 1,
0.3351968, -0.6335793, 1.711954, 0, 0.2156863, 1, 1,
0.3370996, 0.5368902, 1.252357, 0, 0.2078431, 1, 1,
0.3423984, -0.1656194, 2.082399, 0, 0.2039216, 1, 1,
0.3462409, -0.9700156, 3.072823, 0, 0.1960784, 1, 1,
0.3481609, -1.364108, 3.215508, 0, 0.1882353, 1, 1,
0.3527968, -0.8601636, 2.214087, 0, 0.1843137, 1, 1,
0.3554082, -0.970876, 3.069045, 0, 0.1764706, 1, 1,
0.3558435, -0.275057, 2.064991, 0, 0.172549, 1, 1,
0.3559398, 1.060916, -0.3885642, 0, 0.1647059, 1, 1,
0.3561549, -1.806075, 1.967147, 0, 0.1607843, 1, 1,
0.3594057, -1.51973, 3.713735, 0, 0.1529412, 1, 1,
0.3613918, -0.9142993, 3.061232, 0, 0.1490196, 1, 1,
0.3625952, 0.1713647, -0.5096002, 0, 0.1411765, 1, 1,
0.3659506, 0.5788669, 1.523647, 0, 0.1372549, 1, 1,
0.3693292, -0.3041053, 1.620288, 0, 0.1294118, 1, 1,
0.3698885, -0.1752819, 1.813434, 0, 0.1254902, 1, 1,
0.3714287, 0.7183771, 3.836566, 0, 0.1176471, 1, 1,
0.3734767, 0.6417119, 0.8493568, 0, 0.1137255, 1, 1,
0.3746157, 0.5952362, -1.341471, 0, 0.1058824, 1, 1,
0.3751837, -0.5964651, 2.559659, 0, 0.09803922, 1, 1,
0.3834984, -1.162673, 2.27489, 0, 0.09411765, 1, 1,
0.3903144, 1.072387, 0.6486709, 0, 0.08627451, 1, 1,
0.3913772, -0.964063, 3.341844, 0, 0.08235294, 1, 1,
0.3921665, 0.1917969, 2.501587, 0, 0.07450981, 1, 1,
0.3960024, 0.961446, -0.8665366, 0, 0.07058824, 1, 1,
0.3965207, -0.5325692, 3.508266, 0, 0.0627451, 1, 1,
0.3972426, -1.39705, 1.541937, 0, 0.05882353, 1, 1,
0.399404, 0.9278628, -0.4211476, 0, 0.05098039, 1, 1,
0.4002413, -0.4037345, 4.471966, 0, 0.04705882, 1, 1,
0.4014398, 0.7195621, 1.698836, 0, 0.03921569, 1, 1,
0.4024225, 1.277132, 1.327291, 0, 0.03529412, 1, 1,
0.4050591, -0.414238, 4.827414, 0, 0.02745098, 1, 1,
0.4062219, 0.2296142, 0.9064823, 0, 0.02352941, 1, 1,
0.4075319, -0.08586591, 3.066865, 0, 0.01568628, 1, 1,
0.4119529, 0.5921432, -0.06206956, 0, 0.01176471, 1, 1,
0.4145442, -1.686466, 4.502726, 0, 0.003921569, 1, 1,
0.4145631, 0.1203286, 2.077452, 0.003921569, 0, 1, 1,
0.4159742, 0.08430956, 1.424482, 0.007843138, 0, 1, 1,
0.4183727, 0.4249877, 2.555023, 0.01568628, 0, 1, 1,
0.4200068, 0.4788051, 0.2568599, 0.01960784, 0, 1, 1,
0.4216352, -0.4405884, 2.561814, 0.02745098, 0, 1, 1,
0.4297704, -1.604306, 3.359158, 0.03137255, 0, 1, 1,
0.4299853, 0.3033632, 1.652994, 0.03921569, 0, 1, 1,
0.4331135, 0.5018121, -1.083677, 0.04313726, 0, 1, 1,
0.4348188, 1.804396, 0.4445687, 0.05098039, 0, 1, 1,
0.4348191, 1.867517, 0.37089, 0.05490196, 0, 1, 1,
0.4400056, 2.082743, -0.179975, 0.0627451, 0, 1, 1,
0.4413179, 0.8545929, -0.4539727, 0.06666667, 0, 1, 1,
0.4441814, -0.6644346, 2.703439, 0.07450981, 0, 1, 1,
0.4450432, -0.6601576, 3.36584, 0.07843138, 0, 1, 1,
0.4459653, 1.040957, -0.02431977, 0.08627451, 0, 1, 1,
0.4541179, -0.7708945, 2.106157, 0.09019608, 0, 1, 1,
0.4550202, -0.7065699, 1.769057, 0.09803922, 0, 1, 1,
0.4586517, 0.7006131, 1.516957, 0.1058824, 0, 1, 1,
0.4606339, -1.864337, 3.762467, 0.1098039, 0, 1, 1,
0.4610656, 0.5609715, 0.5292409, 0.1176471, 0, 1, 1,
0.4637201, -1.408238, 1.32566, 0.1215686, 0, 1, 1,
0.466187, -0.4739023, 1.49546, 0.1294118, 0, 1, 1,
0.4668356, -2.275257, 2.693576, 0.1333333, 0, 1, 1,
0.4668427, 1.183332, 1.403612, 0.1411765, 0, 1, 1,
0.4680648, 0.7747951, -0.8978444, 0.145098, 0, 1, 1,
0.47176, 0.8663915, -0.4475806, 0.1529412, 0, 1, 1,
0.4736252, -0.727354, 1.796559, 0.1568628, 0, 1, 1,
0.479232, 0.08177777, 2.305974, 0.1647059, 0, 1, 1,
0.4814892, 1.038809, 0.3441965, 0.1686275, 0, 1, 1,
0.481611, 1.055026, -0.4221654, 0.1764706, 0, 1, 1,
0.4850416, 0.09946215, 2.231003, 0.1803922, 0, 1, 1,
0.4862149, 0.1380031, 2.488491, 0.1882353, 0, 1, 1,
0.4889865, -0.6182877, 1.627223, 0.1921569, 0, 1, 1,
0.4907557, -1.336441, 2.69257, 0.2, 0, 1, 1,
0.4957106, 0.716071, 0.9652593, 0.2078431, 0, 1, 1,
0.497313, 0.05191299, 1.701166, 0.2117647, 0, 1, 1,
0.5034617, 0.8006939, 0.2801382, 0.2196078, 0, 1, 1,
0.5040046, -1.368665, 2.117826, 0.2235294, 0, 1, 1,
0.5055653, 1.431147, -0.6092538, 0.2313726, 0, 1, 1,
0.5062959, -2.070498, 1.933546, 0.2352941, 0, 1, 1,
0.5116223, 0.327096, 2.451614, 0.2431373, 0, 1, 1,
0.5141709, -0.549493, 1.870147, 0.2470588, 0, 1, 1,
0.5167249, 0.5381377, 0.9531196, 0.254902, 0, 1, 1,
0.5218375, 0.04990276, 1.156285, 0.2588235, 0, 1, 1,
0.5238261, 0.4040559, 1.109375, 0.2666667, 0, 1, 1,
0.5257528, 0.6112638, -0.2572643, 0.2705882, 0, 1, 1,
0.5321835, 1.101163, -0.4184295, 0.2784314, 0, 1, 1,
0.5356401, 0.2031377, 0.5419592, 0.282353, 0, 1, 1,
0.5375526, -0.410071, 2.233643, 0.2901961, 0, 1, 1,
0.5413905, -0.1303277, 1.89097, 0.2941177, 0, 1, 1,
0.5463302, 1.094438, -1.906032, 0.3019608, 0, 1, 1,
0.5565978, 0.2451847, 1.341059, 0.3098039, 0, 1, 1,
0.5663131, 1.460885, 0.297644, 0.3137255, 0, 1, 1,
0.5670725, 0.3441851, -0.3736556, 0.3215686, 0, 1, 1,
0.5674418, -1.512792, 2.423342, 0.3254902, 0, 1, 1,
0.5739451, -1.396139, -0.7970366, 0.3333333, 0, 1, 1,
0.5753604, -0.3566359, 1.802853, 0.3372549, 0, 1, 1,
0.5805411, -1.17974, 3.613503, 0.345098, 0, 1, 1,
0.5820945, 1.71162, 0.01185841, 0.3490196, 0, 1, 1,
0.582803, -0.1976541, 3.557374, 0.3568628, 0, 1, 1,
0.5869552, 1.803828, 1.987251, 0.3607843, 0, 1, 1,
0.5869618, -0.1454799, 2.029836, 0.3686275, 0, 1, 1,
0.5875718, -1.089441, 2.432276, 0.372549, 0, 1, 1,
0.6000966, 0.4592035, 1.791445, 0.3803922, 0, 1, 1,
0.6014546, -0.6856397, 0.6472896, 0.3843137, 0, 1, 1,
0.6188248, -0.4553163, 1.622599, 0.3921569, 0, 1, 1,
0.6214737, -0.8285299, 3.342446, 0.3960784, 0, 1, 1,
0.6256133, 1.998162, 1.538635, 0.4039216, 0, 1, 1,
0.6285858, -1.094807, 1.747154, 0.4117647, 0, 1, 1,
0.630024, 0.449265, 1.958804, 0.4156863, 0, 1, 1,
0.6304286, 0.7214941, 1.217981, 0.4235294, 0, 1, 1,
0.6349763, 1.07884, 0.06419723, 0.427451, 0, 1, 1,
0.640029, -1.376843, 2.870314, 0.4352941, 0, 1, 1,
0.6438353, 0.8811786, 1.10532, 0.4392157, 0, 1, 1,
0.6479452, 0.6841528, -0.3769443, 0.4470588, 0, 1, 1,
0.6553138, -0.6206989, 2.254756, 0.4509804, 0, 1, 1,
0.6579728, -0.2584334, 2.655697, 0.4588235, 0, 1, 1,
0.6593923, 0.1660529, 1.476915, 0.4627451, 0, 1, 1,
0.6616729, -0.140981, 0.9434967, 0.4705882, 0, 1, 1,
0.6644558, 0.6624073, 1.511629, 0.4745098, 0, 1, 1,
0.6654314, -0.632122, 1.975574, 0.4823529, 0, 1, 1,
0.6666798, 0.1583182, 2.661094, 0.4862745, 0, 1, 1,
0.6688018, 0.6185286, 1.488203, 0.4941176, 0, 1, 1,
0.6717367, 0.7099259, -0.4559385, 0.5019608, 0, 1, 1,
0.6765619, 0.6346505, 1.541373, 0.5058824, 0, 1, 1,
0.679079, 1.72244, 0.2182424, 0.5137255, 0, 1, 1,
0.679669, 0.7783092, 0.4527444, 0.5176471, 0, 1, 1,
0.6813275, -0.6201682, 3.997196, 0.5254902, 0, 1, 1,
0.6820004, -0.3099508, 3.012186, 0.5294118, 0, 1, 1,
0.68218, -0.1469438, 2.998912, 0.5372549, 0, 1, 1,
0.6831267, -0.01643095, 0.274769, 0.5411765, 0, 1, 1,
0.6876605, -0.4057438, 1.9568, 0.5490196, 0, 1, 1,
0.6891587, -3.270881, 5.832242, 0.5529412, 0, 1, 1,
0.6936288, -1.037743, 2.858265, 0.5607843, 0, 1, 1,
0.6971768, -1.68756, 1.396194, 0.5647059, 0, 1, 1,
0.7049841, -1.434627, 1.388581, 0.572549, 0, 1, 1,
0.7064151, -0.9817842, 1.915684, 0.5764706, 0, 1, 1,
0.711332, 1.910425, 0.04131494, 0.5843138, 0, 1, 1,
0.7118899, 0.2946593, -0.4731458, 0.5882353, 0, 1, 1,
0.7130299, -0.5427817, 3.649113, 0.5960785, 0, 1, 1,
0.7155284, -1.402789, 3.469237, 0.6039216, 0, 1, 1,
0.7168633, 0.5035622, 1.205959, 0.6078432, 0, 1, 1,
0.7182163, -0.8075253, 1.783944, 0.6156863, 0, 1, 1,
0.720265, -0.9489754, 2.784341, 0.6196079, 0, 1, 1,
0.7247596, -2.951658, 3.563846, 0.627451, 0, 1, 1,
0.7265139, 0.8880611, 1.192982, 0.6313726, 0, 1, 1,
0.7335462, -0.83384, 2.282777, 0.6392157, 0, 1, 1,
0.7392358, -0.4307564, 0.02479808, 0.6431373, 0, 1, 1,
0.7398352, 0.003189747, 1.972412, 0.6509804, 0, 1, 1,
0.7454514, -1.922908, 3.448045, 0.654902, 0, 1, 1,
0.7494078, -0.4198731, 1.04477, 0.6627451, 0, 1, 1,
0.7505569, 0.04510862, 0.9164243, 0.6666667, 0, 1, 1,
0.7577893, -1.72815, 4.440279, 0.6745098, 0, 1, 1,
0.7628804, -1.437553, 1.950344, 0.6784314, 0, 1, 1,
0.7673559, 0.8387405, 2.126641, 0.6862745, 0, 1, 1,
0.7676904, -0.5819106, 2.451751, 0.6901961, 0, 1, 1,
0.7680922, 1.506658, -0.7622616, 0.6980392, 0, 1, 1,
0.7691457, -0.8914474, 1.310614, 0.7058824, 0, 1, 1,
0.7723098, 1.601181, 0.5256458, 0.7098039, 0, 1, 1,
0.7740558, -0.08366861, 2.971332, 0.7176471, 0, 1, 1,
0.7751715, -1.512184, 2.583138, 0.7215686, 0, 1, 1,
0.7793173, 0.1090602, 2.866106, 0.7294118, 0, 1, 1,
0.7809086, -0.6517263, 2.415403, 0.7333333, 0, 1, 1,
0.7816898, -1.298277, 0.285699, 0.7411765, 0, 1, 1,
0.7954969, 0.02105127, 3.811831, 0.7450981, 0, 1, 1,
0.801055, -0.09720913, 3.271385, 0.7529412, 0, 1, 1,
0.805796, 0.5156328, 0.07209344, 0.7568628, 0, 1, 1,
0.8064368, -1.110806, 3.588949, 0.7647059, 0, 1, 1,
0.8084805, -1.120802, 2.591668, 0.7686275, 0, 1, 1,
0.8101954, 1.569627, 0.1789961, 0.7764706, 0, 1, 1,
0.8143748, 0.3738945, 0.5593812, 0.7803922, 0, 1, 1,
0.8145108, -1.273967, 2.886743, 0.7882353, 0, 1, 1,
0.8160129, -0.3195089, 0.5727618, 0.7921569, 0, 1, 1,
0.8226518, -2.323786, 2.430376, 0.8, 0, 1, 1,
0.823719, 0.02749819, 1.886836, 0.8078431, 0, 1, 1,
0.8255222, -3.036144, 3.186339, 0.8117647, 0, 1, 1,
0.8273553, 0.05569651, 1.437544, 0.8196079, 0, 1, 1,
0.8289241, 1.280938, 0.4836786, 0.8235294, 0, 1, 1,
0.836488, 0.3907009, 1.553489, 0.8313726, 0, 1, 1,
0.8366864, -1.069133, 2.90709, 0.8352941, 0, 1, 1,
0.8367407, -0.467607, 1.552634, 0.8431373, 0, 1, 1,
0.8387581, -1.442995, 2.665597, 0.8470588, 0, 1, 1,
0.8410043, -0.9305026, 2.395866, 0.854902, 0, 1, 1,
0.8486499, 0.1212691, 0.9422753, 0.8588235, 0, 1, 1,
0.8498357, 0.8950968, 0.8309388, 0.8666667, 0, 1, 1,
0.8621542, 0.9159644, 2.827777, 0.8705882, 0, 1, 1,
0.8667433, -1.533144, 2.92991, 0.8784314, 0, 1, 1,
0.8700224, 0.09831669, 1.850703, 0.8823529, 0, 1, 1,
0.8713007, -1.178785, 1.851423, 0.8901961, 0, 1, 1,
0.8732509, 0.1356391, 2.330759, 0.8941177, 0, 1, 1,
0.8777269, -1.604851, 1.02795, 0.9019608, 0, 1, 1,
0.8868021, -2.703379, 2.256243, 0.9098039, 0, 1, 1,
0.8868547, -0.2316558, 0.7349352, 0.9137255, 0, 1, 1,
0.8870685, -0.7991751, 4.403227, 0.9215686, 0, 1, 1,
0.8874483, -0.393086, 2.343802, 0.9254902, 0, 1, 1,
0.888712, 0.02920447, 2.514103, 0.9333333, 0, 1, 1,
0.8900532, -0.8901719, 3.401658, 0.9372549, 0, 1, 1,
0.892734, 0.002746159, 3.14867, 0.945098, 0, 1, 1,
0.8930661, 0.6717556, 0.5056825, 0.9490196, 0, 1, 1,
0.8997551, -0.2947173, 3.211944, 0.9568627, 0, 1, 1,
0.9080578, -2.179434, 2.460782, 0.9607843, 0, 1, 1,
0.9160898, 0.9892441, 0.1601063, 0.9686275, 0, 1, 1,
0.9167336, -0.495627, 1.331936, 0.972549, 0, 1, 1,
0.9196853, -0.481036, 2.002964, 0.9803922, 0, 1, 1,
0.9267781, -1.201054, 4.055294, 0.9843137, 0, 1, 1,
0.9358296, -0.7672921, 2.430535, 0.9921569, 0, 1, 1,
0.9378403, 1.626849, -1.362418, 0.9960784, 0, 1, 1,
0.9391362, -0.6643513, 1.49644, 1, 0, 0.9960784, 1,
0.940548, -0.2153639, 2.652549, 1, 0, 0.9882353, 1,
0.9407278, 0.5561402, 3.310688, 1, 0, 0.9843137, 1,
0.9414227, 0.582343, 0.1499459, 1, 0, 0.9764706, 1,
0.9628254, -0.6127572, 0.7787031, 1, 0, 0.972549, 1,
0.9653296, 0.04545889, -0.001983736, 1, 0, 0.9647059, 1,
0.9717517, -0.08582346, 1.282558, 1, 0, 0.9607843, 1,
0.9774674, -2.02976, 1.678042, 1, 0, 0.9529412, 1,
0.979986, -0.6345543, 2.851599, 1, 0, 0.9490196, 1,
0.9834679, 0.1713666, 1.180098, 1, 0, 0.9411765, 1,
0.9867068, 0.4051625, 2.033484, 1, 0, 0.9372549, 1,
0.9873581, -2.276675, 1.165671, 1, 0, 0.9294118, 1,
0.9904952, 0.3297131, 1.742051, 1, 0, 0.9254902, 1,
0.9952537, -1.200391, 4.199513, 1, 0, 0.9176471, 1,
0.9954584, 2.585048, 0.5116746, 1, 0, 0.9137255, 1,
1.007485, 1.879817, 0.3145821, 1, 0, 0.9058824, 1,
1.012173, -0.1158875, 0.5048368, 1, 0, 0.9019608, 1,
1.014216, -0.2716184, 3.445805, 1, 0, 0.8941177, 1,
1.016921, 1.255427, 0.8622773, 1, 0, 0.8862745, 1,
1.018427, 2.027116, 1.780409, 1, 0, 0.8823529, 1,
1.01921, 0.0464471, 3.153542, 1, 0, 0.8745098, 1,
1.02001, -0.1305236, 1.629618, 1, 0, 0.8705882, 1,
1.020687, 0.6477253, 0.9588204, 1, 0, 0.8627451, 1,
1.026024, -1.120531, 3.093981, 1, 0, 0.8588235, 1,
1.03096, -0.1122799, 1.372457, 1, 0, 0.8509804, 1,
1.044257, -0.4176523, 0.8161632, 1, 0, 0.8470588, 1,
1.045113, 1.690783, 1.5201, 1, 0, 0.8392157, 1,
1.046443, -0.6095068, 1.983983, 1, 0, 0.8352941, 1,
1.049854, 1.294784, 0.7045319, 1, 0, 0.827451, 1,
1.060496, 0.437818, 0.5018515, 1, 0, 0.8235294, 1,
1.075491, -0.207556, -0.450147, 1, 0, 0.8156863, 1,
1.075577, 0.1678208, -0.8761049, 1, 0, 0.8117647, 1,
1.078629, 0.9921195, 0.491412, 1, 0, 0.8039216, 1,
1.088568, -0.5603496, 1.359358, 1, 0, 0.7960784, 1,
1.091497, -1.482634, 3.687027, 1, 0, 0.7921569, 1,
1.098905, 0.2897856, 1.153508, 1, 0, 0.7843137, 1,
1.104568, 0.4391233, 1.486783, 1, 0, 0.7803922, 1,
1.104839, -1.354124, 2.230265, 1, 0, 0.772549, 1,
1.12408, -0.5412621, 2.784347, 1, 0, 0.7686275, 1,
1.124666, 0.3398725, 0.5501312, 1, 0, 0.7607843, 1,
1.125128, -0.3144547, 2.300258, 1, 0, 0.7568628, 1,
1.137072, 0.8791777, 0.8731518, 1, 0, 0.7490196, 1,
1.140526, 0.2318135, 0.1924301, 1, 0, 0.7450981, 1,
1.148016, -1.167316, 2.401961, 1, 0, 0.7372549, 1,
1.148251, -0.3421344, 2.599467, 1, 0, 0.7333333, 1,
1.15145, -0.3492143, 1.348896, 1, 0, 0.7254902, 1,
1.15225, -0.6765449, 1.922677, 1, 0, 0.7215686, 1,
1.156663, 1.144435, -0.08159263, 1, 0, 0.7137255, 1,
1.158911, -0.324977, 0.3957711, 1, 0, 0.7098039, 1,
1.160074, -0.913355, 1.879814, 1, 0, 0.7019608, 1,
1.160327, -0.7460313, 1.77433, 1, 0, 0.6941177, 1,
1.167814, 0.6929727, -0.03058193, 1, 0, 0.6901961, 1,
1.171204, -0.006037361, 2.372554, 1, 0, 0.682353, 1,
1.176785, 0.9001179, -0.9911041, 1, 0, 0.6784314, 1,
1.178641, -0.3581563, 2.221785, 1, 0, 0.6705883, 1,
1.184402, -0.5573964, 2.130069, 1, 0, 0.6666667, 1,
1.190241, -1.15373, 2.00809, 1, 0, 0.6588235, 1,
1.193461, 0.05107437, 1.092525, 1, 0, 0.654902, 1,
1.200507, -1.120924, 2.767939, 1, 0, 0.6470588, 1,
1.20305, -0.3413405, 1.381041, 1, 0, 0.6431373, 1,
1.225539, 0.04498201, 2.164399, 1, 0, 0.6352941, 1,
1.246484, -0.3048442, 3.144964, 1, 0, 0.6313726, 1,
1.24651, -0.2645102, 1.549825, 1, 0, 0.6235294, 1,
1.248124, 0.3903817, -0.8329022, 1, 0, 0.6196079, 1,
1.255879, 0.6988274, 0.5481578, 1, 0, 0.6117647, 1,
1.259402, -0.6249231, 0.748822, 1, 0, 0.6078432, 1,
1.261148, 0.8925938, 0.6557158, 1, 0, 0.6, 1,
1.274474, -0.4154815, 1.681329, 1, 0, 0.5921569, 1,
1.277452, 1.248918, 0.5537078, 1, 0, 0.5882353, 1,
1.277983, 1.296344, 1.72687, 1, 0, 0.5803922, 1,
1.279308, 0.6025701, 1.365332, 1, 0, 0.5764706, 1,
1.286694, 0.4686645, 2.45577, 1, 0, 0.5686275, 1,
1.28757, -0.708567, 1.992198, 1, 0, 0.5647059, 1,
1.288203, 0.5245619, 2.771146, 1, 0, 0.5568628, 1,
1.299329, -0.6256601, 2.821691, 1, 0, 0.5529412, 1,
1.300569, -1.753652, 1.726729, 1, 0, 0.5450981, 1,
1.300755, -0.0703205, 1.091762, 1, 0, 0.5411765, 1,
1.300954, -0.1079286, -0.3426226, 1, 0, 0.5333334, 1,
1.304423, 1.67746, -0.1363907, 1, 0, 0.5294118, 1,
1.309606, -1.598119, 5.240845, 1, 0, 0.5215687, 1,
1.310096, -0.5347966, 0.1581632, 1, 0, 0.5176471, 1,
1.314499, 0.3983998, 2.047718, 1, 0, 0.509804, 1,
1.333805, -0.1312458, 1.008049, 1, 0, 0.5058824, 1,
1.334124, -1.396526, 2.852942, 1, 0, 0.4980392, 1,
1.347706, -2.173243, 4.158452, 1, 0, 0.4901961, 1,
1.34862, -0.3241653, 0.4227909, 1, 0, 0.4862745, 1,
1.349062, -1.820402, 2.289602, 1, 0, 0.4784314, 1,
1.356227, 1.203893, 0.0243469, 1, 0, 0.4745098, 1,
1.36735, 2.470337, -0.6476049, 1, 0, 0.4666667, 1,
1.395558, 0.3168854, 0.7579224, 1, 0, 0.4627451, 1,
1.395962, -1.594995, 1.400684, 1, 0, 0.454902, 1,
1.396149, 0.102285, 2.655794, 1, 0, 0.4509804, 1,
1.401698, -1.343262, 4.012384, 1, 0, 0.4431373, 1,
1.41238, 0.6949587, 0.8648062, 1, 0, 0.4392157, 1,
1.419924, -0.2879514, 1.168053, 1, 0, 0.4313726, 1,
1.422804, 0.2555414, 2.445063, 1, 0, 0.427451, 1,
1.424951, -0.03711704, 2.318909, 1, 0, 0.4196078, 1,
1.428488, 0.2813796, 1.8978, 1, 0, 0.4156863, 1,
1.435159, -1.521599, 3.75301, 1, 0, 0.4078431, 1,
1.447093, 0.3903258, 0.9062014, 1, 0, 0.4039216, 1,
1.452735, -1.243708, 3.086073, 1, 0, 0.3960784, 1,
1.470747, 1.403039, 2.050831, 1, 0, 0.3882353, 1,
1.47937, 0.12803, 1.172275, 1, 0, 0.3843137, 1,
1.480096, 1.142519, -1.425879, 1, 0, 0.3764706, 1,
1.496713, 0.2306207, 1.700792, 1, 0, 0.372549, 1,
1.50078, 2.330514, -0.823866, 1, 0, 0.3647059, 1,
1.505593, 1.665575, 0.6658878, 1, 0, 0.3607843, 1,
1.509674, 0.2630317, 2.07074, 1, 0, 0.3529412, 1,
1.515396, 1.933934, -0.04927441, 1, 0, 0.3490196, 1,
1.520039, -0.6826568, 2.229521, 1, 0, 0.3411765, 1,
1.523431, -0.01653284, 0.9771318, 1, 0, 0.3372549, 1,
1.524687, 2.152273, -0.2854732, 1, 0, 0.3294118, 1,
1.531309, 1.79592, 2.501305, 1, 0, 0.3254902, 1,
1.532722, 0.8483056, 0.001255164, 1, 0, 0.3176471, 1,
1.53786, -0.3996974, 3.259213, 1, 0, 0.3137255, 1,
1.540754, -1.41362, 0.6921818, 1, 0, 0.3058824, 1,
1.544043, 0.09423295, 1.709728, 1, 0, 0.2980392, 1,
1.549805, -0.1693299, 1.457662, 1, 0, 0.2941177, 1,
1.559652, -1.219921, 3.478258, 1, 0, 0.2862745, 1,
1.564626, -1.392896, 1.879123, 1, 0, 0.282353, 1,
1.566823, -0.6240439, 2.318266, 1, 0, 0.2745098, 1,
1.584576, -1.270579, 0.9890379, 1, 0, 0.2705882, 1,
1.585757, -2.291868, 4.693747, 1, 0, 0.2627451, 1,
1.589919, 0.3895923, 0.658577, 1, 0, 0.2588235, 1,
1.592436, 1.511536, 0.457355, 1, 0, 0.2509804, 1,
1.593187, -0.5133379, 1.280154, 1, 0, 0.2470588, 1,
1.619565, 0.6164936, 1.965503, 1, 0, 0.2392157, 1,
1.627552, -0.2931389, 1.899317, 1, 0, 0.2352941, 1,
1.651948, -0.7203233, 3.420631, 1, 0, 0.227451, 1,
1.655996, 1.637819, 0.9487881, 1, 0, 0.2235294, 1,
1.670585, 1.384326, 1.831941, 1, 0, 0.2156863, 1,
1.675948, 0.8128629, 2.506845, 1, 0, 0.2117647, 1,
1.67809, -0.2710863, 1.023411, 1, 0, 0.2039216, 1,
1.681721, 0.5969423, 1.491345, 1, 0, 0.1960784, 1,
1.709103, -0.2964197, 3.116103, 1, 0, 0.1921569, 1,
1.711317, 0.5241545, 0.918529, 1, 0, 0.1843137, 1,
1.718545, -1.260018, 2.919637, 1, 0, 0.1803922, 1,
1.731463, 0.002814548, 0.4504156, 1, 0, 0.172549, 1,
1.753885, 1.579917, 3.080208, 1, 0, 0.1686275, 1,
1.755269, 0.001654795, 2.225291, 1, 0, 0.1607843, 1,
1.790556, -0.7745151, 0.9912241, 1, 0, 0.1568628, 1,
1.834251, -1.522591, 1.636192, 1, 0, 0.1490196, 1,
1.84175, -1.154499, 3.827536, 1, 0, 0.145098, 1,
1.843262, 0.6223027, 1.042356, 1, 0, 0.1372549, 1,
1.851134, 0.249914, 0.967824, 1, 0, 0.1333333, 1,
1.878086, -0.4903898, 0.7653754, 1, 0, 0.1254902, 1,
1.923924, -0.2658691, 2.388436, 1, 0, 0.1215686, 1,
1.929662, 1.338977, 1.295375, 1, 0, 0.1137255, 1,
1.967832, -0.02637876, 1.072114, 1, 0, 0.1098039, 1,
1.999907, 0.272278, 1.704445, 1, 0, 0.1019608, 1,
2.004233, 1.423254, 1.205818, 1, 0, 0.09411765, 1,
2.005738, -1.189702, -0.3786067, 1, 0, 0.09019608, 1,
2.008741, -0.7549046, 0.5773916, 1, 0, 0.08235294, 1,
2.00925, 1.580504, 0.1445525, 1, 0, 0.07843138, 1,
2.018406, -0.5536289, 1.870456, 1, 0, 0.07058824, 1,
2.031704, 0.9621609, 1.460264, 1, 0, 0.06666667, 1,
2.04686, 1.403179, 1.501411, 1, 0, 0.05882353, 1,
2.082837, -0.5881169, 2.782933, 1, 0, 0.05490196, 1,
2.136771, -0.9958443, 1.284435, 1, 0, 0.04705882, 1,
2.212919, 0.9053105, 1.191452, 1, 0, 0.04313726, 1,
2.254677, -0.217357, 2.797625, 1, 0, 0.03529412, 1,
2.302625, -0.3451063, 4.074982, 1, 0, 0.03137255, 1,
2.356321, -0.5804912, 1.742888, 1, 0, 0.02352941, 1,
2.686546, 1.199875, 0.8531517, 1, 0, 0.01960784, 1,
2.726272, 1.320351, -0.1677148, 1, 0, 0.01176471, 1,
3.377844, -0.9760259, 1.355714, 1, 0, 0.007843138, 1
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
0.2784632, -4.335886, -7.49064, 0, -0.5, 0.5, 0.5,
0.2784632, -4.335886, -7.49064, 1, -0.5, 0.5, 0.5,
0.2784632, -4.335886, -7.49064, 1, 1.5, 0.5, 0.5,
0.2784632, -4.335886, -7.49064, 0, 1.5, 0.5, 0.5
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
-3.871607, -0.1292738, -7.49064, 0, -0.5, 0.5, 0.5,
-3.871607, -0.1292738, -7.49064, 1, -0.5, 0.5, 0.5,
-3.871607, -0.1292738, -7.49064, 1, 1.5, 0.5, 0.5,
-3.871607, -0.1292738, -7.49064, 0, 1.5, 0.5, 0.5
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
-3.871607, -4.335886, 0.1362681, 0, -0.5, 0.5, 0.5,
-3.871607, -4.335886, 0.1362681, 1, -0.5, 0.5, 0.5,
-3.871607, -4.335886, 0.1362681, 1, 1.5, 0.5, 0.5,
-3.871607, -4.335886, 0.1362681, 0, 1.5, 0.5, 0.5
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
-2, -3.365129, -5.730585,
3, -3.365129, -5.730585,
-2, -3.365129, -5.730585,
-2, -3.526922, -6.023927,
-1, -3.365129, -5.730585,
-1, -3.526922, -6.023927,
0, -3.365129, -5.730585,
0, -3.526922, -6.023927,
1, -3.365129, -5.730585,
1, -3.526922, -6.023927,
2, -3.365129, -5.730585,
2, -3.526922, -6.023927,
3, -3.365129, -5.730585,
3, -3.526922, -6.023927
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
-2, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
-2, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
-2, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
-2, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5,
-1, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
-1, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
-1, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
-1, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5,
0, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
0, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
0, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
0, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5,
1, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
1, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
1, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
1, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5,
2, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
2, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
2, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
2, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5,
3, -3.850508, -6.610612, 0, -0.5, 0.5, 0.5,
3, -3.850508, -6.610612, 1, -0.5, 0.5, 0.5,
3, -3.850508, -6.610612, 1, 1.5, 0.5, 0.5,
3, -3.850508, -6.610612, 0, 1.5, 0.5, 0.5
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
-2.913899, -3, -5.730585,
-2.913899, 3, -5.730585,
-2.913899, -3, -5.730585,
-3.073517, -3, -6.023927,
-2.913899, -2, -5.730585,
-3.073517, -2, -6.023927,
-2.913899, -1, -5.730585,
-3.073517, -1, -6.023927,
-2.913899, 0, -5.730585,
-3.073517, 0, -6.023927,
-2.913899, 1, -5.730585,
-3.073517, 1, -6.023927,
-2.913899, 2, -5.730585,
-3.073517, 2, -6.023927,
-2.913899, 3, -5.730585,
-3.073517, 3, -6.023927
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
-3.392753, -3, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, -3, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, -3, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, -3, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, -2, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, -2, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, -2, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, -2, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, -1, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, -1, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, -1, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, -1, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, 0, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, 0, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, 0, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, 0, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, 1, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, 1, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, 1, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, 1, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, 2, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, 2, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, 2, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, 2, -6.610612, 0, 1.5, 0.5, 0.5,
-3.392753, 3, -6.610612, 0, -0.5, 0.5, 0.5,
-3.392753, 3, -6.610612, 1, -0.5, 0.5, 0.5,
-3.392753, 3, -6.610612, 1, 1.5, 0.5, 0.5,
-3.392753, 3, -6.610612, 0, 1.5, 0.5, 0.5
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
-2.913899, -3.365129, -4,
-2.913899, -3.365129, 4,
-2.913899, -3.365129, -4,
-3.073517, -3.526922, -4,
-2.913899, -3.365129, -2,
-3.073517, -3.526922, -2,
-2.913899, -3.365129, 0,
-3.073517, -3.526922, 0,
-2.913899, -3.365129, 2,
-3.073517, -3.526922, 2,
-2.913899, -3.365129, 4,
-3.073517, -3.526922, 4
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
-3.392753, -3.850508, -4, 0, -0.5, 0.5, 0.5,
-3.392753, -3.850508, -4, 1, -0.5, 0.5, 0.5,
-3.392753, -3.850508, -4, 1, 1.5, 0.5, 0.5,
-3.392753, -3.850508, -4, 0, 1.5, 0.5, 0.5,
-3.392753, -3.850508, -2, 0, -0.5, 0.5, 0.5,
-3.392753, -3.850508, -2, 1, -0.5, 0.5, 0.5,
-3.392753, -3.850508, -2, 1, 1.5, 0.5, 0.5,
-3.392753, -3.850508, -2, 0, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 0, 0, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 0, 1, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 0, 1, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 0, 0, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 2, 0, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 2, 1, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 2, 1, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 2, 0, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 4, 0, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 4, 1, -0.5, 0.5, 0.5,
-3.392753, -3.850508, 4, 1, 1.5, 0.5, 0.5,
-3.392753, -3.850508, 4, 0, 1.5, 0.5, 0.5
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
-2.913899, -3.365129, -5.730585,
-2.913899, 3.106582, -5.730585,
-2.913899, -3.365129, 6.003121,
-2.913899, 3.106582, 6.003121,
-2.913899, -3.365129, -5.730585,
-2.913899, -3.365129, 6.003121,
-2.913899, 3.106582, -5.730585,
-2.913899, 3.106582, 6.003121,
-2.913899, -3.365129, -5.730585,
3.470825, -3.365129, -5.730585,
-2.913899, -3.365129, 6.003121,
3.470825, -3.365129, 6.003121,
-2.913899, 3.106582, -5.730585,
3.470825, 3.106582, -5.730585,
-2.913899, 3.106582, 6.003121,
3.470825, 3.106582, 6.003121,
3.470825, -3.365129, -5.730585,
3.470825, 3.106582, -5.730585,
3.470825, -3.365129, 6.003121,
3.470825, 3.106582, 6.003121,
3.470825, -3.365129, -5.730585,
3.470825, -3.365129, 6.003121,
3.470825, 3.106582, -5.730585,
3.470825, 3.106582, 6.003121
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
var radius = 7.926106;
var distance = 35.26414;
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
mvMatrix.translate( -0.2784632, 0.1292738, -0.1362681 );
mvMatrix.scale( 1.342245, 1.324203, 0.7303628 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26414);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
benzofenap<-read.table("benzofenap.xyz")
```

```
## Error in read.table("benzofenap.xyz"): no lines available in input
```

```r
x<-benzofenap$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzofenap' not found
```

```r
y<-benzofenap$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzofenap' not found
```

```r
z<-benzofenap$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzofenap' not found
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
-2.820917, 1.088406, -2.403446, 0, 0, 1, 1, 1,
-2.702415, -0.5371279, -0.2299431, 1, 0, 0, 1, 1,
-2.623744, -0.5370734, -1.793516, 1, 0, 0, 1, 1,
-2.557816, 0.243658, -1.860231, 1, 0, 0, 1, 1,
-2.504517, 0.8126262, -0.2839012, 1, 0, 0, 1, 1,
-2.434208, 2.570426, -1.48441, 1, 0, 0, 1, 1,
-2.381598, -0.7724951, -1.447164, 0, 0, 0, 1, 1,
-2.275724, -0.3745126, -0.1037271, 0, 0, 0, 1, 1,
-2.239138, 0.08679192, -0.4506859, 0, 0, 0, 1, 1,
-2.124789, -2.339467, -2.626488, 0, 0, 0, 1, 1,
-2.113194, -0.8748818, -1.365366, 0, 0, 0, 1, 1,
-2.112426, -0.3996155, -0.7026479, 0, 0, 0, 1, 1,
-2.005188, -0.2897369, -4.138023, 0, 0, 0, 1, 1,
-1.999773, 0.7201815, -1.330243, 1, 1, 1, 1, 1,
-1.944509, -2.123438, -1.816882, 1, 1, 1, 1, 1,
-1.935592, 0.03206997, -0.6148106, 1, 1, 1, 1, 1,
-1.929967, 0.02514204, 0.595988, 1, 1, 1, 1, 1,
-1.924373, 0.3559809, -1.764482, 1, 1, 1, 1, 1,
-1.92314, -0.8613994, -2.716645, 1, 1, 1, 1, 1,
-1.876094, 1.344218, -0.9718772, 1, 1, 1, 1, 1,
-1.852739, -0.9745574, -2.774735, 1, 1, 1, 1, 1,
-1.822023, 0.07507473, -1.794895, 1, 1, 1, 1, 1,
-1.800727, -0.7975731, -2.219808, 1, 1, 1, 1, 1,
-1.795989, 0.4553366, -3.914618, 1, 1, 1, 1, 1,
-1.788893, 0.1500278, -0.9028499, 1, 1, 1, 1, 1,
-1.770691, -2.630078, -2.94317, 1, 1, 1, 1, 1,
-1.76283, 0.6455194, -0.7395001, 1, 1, 1, 1, 1,
-1.748657, -1.795045, -0.6629336, 1, 1, 1, 1, 1,
-1.685267, 0.2230326, -1.554258, 0, 0, 1, 1, 1,
-1.682696, -0.8642713, -3.092361, 1, 0, 0, 1, 1,
-1.6698, -1.744074, -1.434836, 1, 0, 0, 1, 1,
-1.645635, 0.5483279, -1.753448, 1, 0, 0, 1, 1,
-1.642574, -1.377863, -0.7133483, 1, 0, 0, 1, 1,
-1.633806, -1.473914, -3.078784, 1, 0, 0, 1, 1,
-1.632723, -0.7751458, -1.709154, 0, 0, 0, 1, 1,
-1.630338, 1.359801, -1.622902, 0, 0, 0, 1, 1,
-1.628284, 0.6053499, -0.930011, 0, 0, 0, 1, 1,
-1.620924, -0.9959496, -2.679693, 0, 0, 0, 1, 1,
-1.606577, 0.7506312, -2.421624, 0, 0, 0, 1, 1,
-1.602755, 1.062672, -0.1542776, 0, 0, 0, 1, 1,
-1.588212, 1.683276, -0.3992831, 0, 0, 0, 1, 1,
-1.577243, -0.7232888, -1.176072, 1, 1, 1, 1, 1,
-1.558934, 0.1352163, -1.557305, 1, 1, 1, 1, 1,
-1.538915, 1.214307, 0.1468161, 1, 1, 1, 1, 1,
-1.525956, 0.3960682, -2.519106, 1, 1, 1, 1, 1,
-1.510559, 0.4573817, -2.361424, 1, 1, 1, 1, 1,
-1.509915, 1.073719, -2.498847, 1, 1, 1, 1, 1,
-1.508396, 1.546694, -1.258774, 1, 1, 1, 1, 1,
-1.505695, -1.317858, -2.808891, 1, 1, 1, 1, 1,
-1.495382, -0.9127856, -1.454491, 1, 1, 1, 1, 1,
-1.489751, 1.423203, -0.7295455, 1, 1, 1, 1, 1,
-1.481089, -0.5529331, -1.052102, 1, 1, 1, 1, 1,
-1.477329, -0.5073406, -1.595837, 1, 1, 1, 1, 1,
-1.472053, -0.501341, -1.804267, 1, 1, 1, 1, 1,
-1.467909, -0.8561773, -1.147822, 1, 1, 1, 1, 1,
-1.466824, -0.313163, -1.368933, 1, 1, 1, 1, 1,
-1.449479, 0.2445991, -2.099342, 0, 0, 1, 1, 1,
-1.443046, -0.0912767, -0.8323891, 1, 0, 0, 1, 1,
-1.436435, 0.02760369, -1.161832, 1, 0, 0, 1, 1,
-1.421096, -0.3829349, -2.580103, 1, 0, 0, 1, 1,
-1.420193, -0.06732461, -2.086012, 1, 0, 0, 1, 1,
-1.397063, -1.01496, -3.300203, 1, 0, 0, 1, 1,
-1.395124, -1.074047, -2.089157, 0, 0, 0, 1, 1,
-1.391145, 1.155891, -1.046025, 0, 0, 0, 1, 1,
-1.38117, 0.6002875, -1.355059, 0, 0, 0, 1, 1,
-1.375529, 0.5075898, -0.9140106, 0, 0, 0, 1, 1,
-1.367177, -0.6369654, -4.050325, 0, 0, 0, 1, 1,
-1.366308, -0.1797028, -1.070972, 0, 0, 0, 1, 1,
-1.365448, -0.02296583, -2.312555, 0, 0, 0, 1, 1,
-1.348913, 0.2462926, -0.8963805, 1, 1, 1, 1, 1,
-1.340715, 0.2537915, -1.974279, 1, 1, 1, 1, 1,
-1.339626, -0.372729, -2.610028, 1, 1, 1, 1, 1,
-1.32452, 0.7586209, -1.301079, 1, 1, 1, 1, 1,
-1.323491, 0.4830575, -1.008523, 1, 1, 1, 1, 1,
-1.319215, -1.84139, -3.291328, 1, 1, 1, 1, 1,
-1.315408, 0.2960448, -2.618096, 1, 1, 1, 1, 1,
-1.312672, -1.641605, -2.518204, 1, 1, 1, 1, 1,
-1.31126, 0.1108034, -2.17033, 1, 1, 1, 1, 1,
-1.310897, -2.292456, -2.274955, 1, 1, 1, 1, 1,
-1.309505, 0.4797307, -1.074875, 1, 1, 1, 1, 1,
-1.306752, 0.9308808, -0.2562291, 1, 1, 1, 1, 1,
-1.300364, 1.109704, -2.504437, 1, 1, 1, 1, 1,
-1.295783, 0.8749067, -2.254357, 1, 1, 1, 1, 1,
-1.293281, 1.701842, -1.499331, 1, 1, 1, 1, 1,
-1.292093, 0.6067537, -2.18125, 0, 0, 1, 1, 1,
-1.280352, 1.387007, -0.2544919, 1, 0, 0, 1, 1,
-1.276511, -0.764411, -3.423753, 1, 0, 0, 1, 1,
-1.271715, -0.3717161, -2.495918, 1, 0, 0, 1, 1,
-1.266279, 0.2416839, -1.922287, 1, 0, 0, 1, 1,
-1.250534, 0.5883936, -0.8231867, 1, 0, 0, 1, 1,
-1.249329, 0.2297625, -2.821905, 0, 0, 0, 1, 1,
-1.246089, 0.1217452, -1.690276, 0, 0, 0, 1, 1,
-1.239095, 0.1766553, -0.7227959, 0, 0, 0, 1, 1,
-1.231023, 0.1458494, -2.031292, 0, 0, 0, 1, 1,
-1.21869, 0.3975245, -1.596034, 0, 0, 0, 1, 1,
-1.214984, 1.230416, -0.6496645, 0, 0, 0, 1, 1,
-1.212192, 0.2203708, -2.575402, 0, 0, 0, 1, 1,
-1.202078, -0.4221921, -2.115611, 1, 1, 1, 1, 1,
-1.198544, -1.60622, -1.653876, 1, 1, 1, 1, 1,
-1.197721, 0.6147947, 1.889914, 1, 1, 1, 1, 1,
-1.196026, -1.539654, -2.491067, 1, 1, 1, 1, 1,
-1.190034, -1.267446, -3.44258, 1, 1, 1, 1, 1,
-1.1876, -0.4718097, -2.061248, 1, 1, 1, 1, 1,
-1.186823, 0.1802362, -1.54393, 1, 1, 1, 1, 1,
-1.184, -1.670153, -2.36346, 1, 1, 1, 1, 1,
-1.182295, -1.708601, -2.392806, 1, 1, 1, 1, 1,
-1.179213, 0.8403092, -0.3251885, 1, 1, 1, 1, 1,
-1.178592, -0.2371651, -0.06931161, 1, 1, 1, 1, 1,
-1.17576, 1.621584, 0.7962115, 1, 1, 1, 1, 1,
-1.174388, -0.01737858, -0.9553935, 1, 1, 1, 1, 1,
-1.17406, 0.2713847, -1.501508, 1, 1, 1, 1, 1,
-1.171928, -1.215016, -2.71536, 1, 1, 1, 1, 1,
-1.170386, 0.6450864, 0.5229666, 0, 0, 1, 1, 1,
-1.161884, 0.6634147, -2.099622, 1, 0, 0, 1, 1,
-1.150015, -0.05751606, -1.733151, 1, 0, 0, 1, 1,
-1.146868, -0.878309, -2.648735, 1, 0, 0, 1, 1,
-1.144816, 0.4379585, -0.6747017, 1, 0, 0, 1, 1,
-1.139615, -0.3442916, -1.407886, 1, 0, 0, 1, 1,
-1.137595, -0.996528, -1.942233, 0, 0, 0, 1, 1,
-1.135609, -0.6438295, -2.909581, 0, 0, 0, 1, 1,
-1.128517, -1.380095, -2.602357, 0, 0, 0, 1, 1,
-1.122014, 0.16062, 0.1199427, 0, 0, 0, 1, 1,
-1.118266, -1.627752, -1.611439, 0, 0, 0, 1, 1,
-1.114725, -0.1472952, -1.053931, 0, 0, 0, 1, 1,
-1.113103, -0.7236112, -2.211365, 0, 0, 0, 1, 1,
-1.109719, -2.641049, -1.50018, 1, 1, 1, 1, 1,
-1.097246, 0.2980224, -0.1470841, 1, 1, 1, 1, 1,
-1.091213, 0.189219, -2.675203, 1, 1, 1, 1, 1,
-1.084535, 0.3658001, -2.714178, 1, 1, 1, 1, 1,
-1.078847, 0.3992536, -0.04213141, 1, 1, 1, 1, 1,
-1.078052, -0.103466, -3.546531, 1, 1, 1, 1, 1,
-1.074149, -1.027297, -1.365555, 1, 1, 1, 1, 1,
-1.068913, -1.0776, -3.288366, 1, 1, 1, 1, 1,
-1.058607, 0.06542001, -1.596614, 1, 1, 1, 1, 1,
-1.049611, 0.7303633, -1.568511, 1, 1, 1, 1, 1,
-1.03593, 0.2114787, -0.3900245, 1, 1, 1, 1, 1,
-1.032911, 0.6132157, -0.07079381, 1, 1, 1, 1, 1,
-1.031095, -0.0849135, -1.000104, 1, 1, 1, 1, 1,
-1.02996, 1.31107, -0.405816, 1, 1, 1, 1, 1,
-1.024979, -1.728336, -5.491966, 1, 1, 1, 1, 1,
-1.02122, -0.5486908, -1.363166, 0, 0, 1, 1, 1,
-1.016114, -0.828296, -0.7411907, 1, 0, 0, 1, 1,
-1.010027, 0.0356956, -1.341685, 1, 0, 0, 1, 1,
-1.00897, -0.8419049, -1.480173, 1, 0, 0, 1, 1,
-1.001292, 0.4748475, -0.5421803, 1, 0, 0, 1, 1,
-0.9980887, 1.542516, -0.7497503, 1, 0, 0, 1, 1,
-0.9980654, -0.7683563, -3.448409, 0, 0, 0, 1, 1,
-0.9979288, -1.3126, -2.946493, 0, 0, 0, 1, 1,
-0.9961513, -0.2112871, -2.345452, 0, 0, 0, 1, 1,
-0.9942263, -0.8560996, -2.953775, 0, 0, 0, 1, 1,
-0.989992, -0.7234191, -0.4061, 0, 0, 0, 1, 1,
-0.9879441, 1.391684, -0.7786517, 0, 0, 0, 1, 1,
-0.987038, 0.008667634, -1.810527, 0, 0, 0, 1, 1,
-0.9831518, -1.60923, -0.6826153, 1, 1, 1, 1, 1,
-0.981302, 0.7446502, -0.1352303, 1, 1, 1, 1, 1,
-0.9756141, 0.4031696, -2.324266, 1, 1, 1, 1, 1,
-0.9735965, -0.4328407, -2.154498, 1, 1, 1, 1, 1,
-0.9718988, 0.63998, -1.151955, 1, 1, 1, 1, 1,
-0.9690005, -1.001968, -1.153541, 1, 1, 1, 1, 1,
-0.966695, 0.01895957, -1.791422, 1, 1, 1, 1, 1,
-0.9655908, -0.4691432, -2.825475, 1, 1, 1, 1, 1,
-0.9649959, -2.479294, -2.335623, 1, 1, 1, 1, 1,
-0.9642026, -0.5989203, -2.256893, 1, 1, 1, 1, 1,
-0.9621482, 1.822377, 0.006392113, 1, 1, 1, 1, 1,
-0.9528205, -0.6642154, -1.869195, 1, 1, 1, 1, 1,
-0.9492599, -0.09796869, -1.616977, 1, 1, 1, 1, 1,
-0.9450057, 0.7952815, -0.4464042, 1, 1, 1, 1, 1,
-0.9440259, 2.321297, 0.9576297, 1, 1, 1, 1, 1,
-0.9370049, -0.4145728, -2.207584, 0, 0, 1, 1, 1,
-0.9296134, -1.412397, -3.561349, 1, 0, 0, 1, 1,
-0.9295894, 0.9244364, -1.926511, 1, 0, 0, 1, 1,
-0.9264397, 1.510414, 0.3034851, 1, 0, 0, 1, 1,
-0.925693, -2.094163, -3.871938, 1, 0, 0, 1, 1,
-0.9229131, -1.882175, -2.506585, 1, 0, 0, 1, 1,
-0.9153632, -0.1713545, -0.8267615, 0, 0, 0, 1, 1,
-0.9114825, -0.2647694, -3.091531, 0, 0, 0, 1, 1,
-0.90955, 1.150671, -0.01481218, 0, 0, 0, 1, 1,
-0.9062603, -0.1063571, -2.066627, 0, 0, 0, 1, 1,
-0.8999785, 1.675275, 1.059856, 0, 0, 0, 1, 1,
-0.899659, 0.512081, 0.5171615, 0, 0, 0, 1, 1,
-0.8961545, 0.8329376, -2.171545, 0, 0, 0, 1, 1,
-0.8871523, -0.5408122, -3.11953, 1, 1, 1, 1, 1,
-0.8848683, 0.8609306, -1.127409, 1, 1, 1, 1, 1,
-0.884472, -0.7586102, -2.042936, 1, 1, 1, 1, 1,
-0.88285, -2.111314, -2.149496, 1, 1, 1, 1, 1,
-0.8823299, -2.196884, -1.728215, 1, 1, 1, 1, 1,
-0.8818707, -0.2144419, -1.331235, 1, 1, 1, 1, 1,
-0.8811842, -0.8266394, -2.81089, 1, 1, 1, 1, 1,
-0.8805134, -1.698448, -0.4385931, 1, 1, 1, 1, 1,
-0.8784201, -0.0972736, -3.171766, 1, 1, 1, 1, 1,
-0.8779947, -0.6502619, -3.675552, 1, 1, 1, 1, 1,
-0.8766069, 1.1914, 0.7012446, 1, 1, 1, 1, 1,
-0.8758542, -0.1482474, -0.9453217, 1, 1, 1, 1, 1,
-0.8732958, 0.539013, -1.88945, 1, 1, 1, 1, 1,
-0.8722669, -0.1274249, -3.252596, 1, 1, 1, 1, 1,
-0.8605887, 3.012334, 0.4080857, 1, 1, 1, 1, 1,
-0.8489402, -0.7064539, -2.509053, 0, 0, 1, 1, 1,
-0.8420191, -1.043628, -1.797379, 1, 0, 0, 1, 1,
-0.840286, 1.116718, -1.075088, 1, 0, 0, 1, 1,
-0.8397635, 0.6091784, -1.405676, 1, 0, 0, 1, 1,
-0.8392418, 0.4378632, -0.8477733, 1, 0, 0, 1, 1,
-0.8390613, 0.1152847, 0.2173245, 1, 0, 0, 1, 1,
-0.8359446, 0.9000452, -0.2453077, 0, 0, 0, 1, 1,
-0.8306946, -1.044711, -3.458494, 0, 0, 0, 1, 1,
-0.8277358, -0.2102345, -3.637994, 0, 0, 0, 1, 1,
-0.8266144, -0.8120123, -1.991015, 0, 0, 0, 1, 1,
-0.8205225, 0.3761508, -2.603412, 0, 0, 0, 1, 1,
-0.8199265, -0.4227327, -2.874855, 0, 0, 0, 1, 1,
-0.8182803, -0.8732698, -2.801146, 0, 0, 0, 1, 1,
-0.815613, 0.3230243, 0.6032743, 1, 1, 1, 1, 1,
-0.8146423, -1.512864, -4.755996, 1, 1, 1, 1, 1,
-0.8133354, 0.2557595, -3.077623, 1, 1, 1, 1, 1,
-0.8122815, -0.1607718, -2.802383, 1, 1, 1, 1, 1,
-0.8086457, -1.413853, -1.732192, 1, 1, 1, 1, 1,
-0.8056269, 0.8888155, -2.418429, 1, 1, 1, 1, 1,
-0.805456, 0.04687831, -2.349787, 1, 1, 1, 1, 1,
-0.804828, 1.122827, -1.506523, 1, 1, 1, 1, 1,
-0.8044631, -1.137141, -0.9319522, 1, 1, 1, 1, 1,
-0.7999337, 0.4491257, -1.021176, 1, 1, 1, 1, 1,
-0.7929958, -1.068895, -1.638654, 1, 1, 1, 1, 1,
-0.7885184, -0.08020385, -2.828737, 1, 1, 1, 1, 1,
-0.7883254, -1.704557, -1.174463, 1, 1, 1, 1, 1,
-0.7853357, -1.152225, -3.248783, 1, 1, 1, 1, 1,
-0.7840794, -1.363126, -3.245559, 1, 1, 1, 1, 1,
-0.782152, -1.089575, -2.733673, 0, 0, 1, 1, 1,
-0.7728414, -0.2665921, -1.757185, 1, 0, 0, 1, 1,
-0.7662855, 0.2563614, -2.225065, 1, 0, 0, 1, 1,
-0.7601522, 1.019284, 0.4021984, 1, 0, 0, 1, 1,
-0.7545936, -0.3606111, -1.257625, 1, 0, 0, 1, 1,
-0.7521709, -0.3817454, -1.246031, 1, 0, 0, 1, 1,
-0.7521563, -0.06938893, -3.328372, 0, 0, 0, 1, 1,
-0.7505957, -0.4522178, -2.936939, 0, 0, 0, 1, 1,
-0.7471481, -1.012533, -3.187176, 0, 0, 0, 1, 1,
-0.7441443, -0.2497248, -4.023794, 0, 0, 0, 1, 1,
-0.7391512, -0.1455487, -2.820427, 0, 0, 0, 1, 1,
-0.7375932, -0.01858146, -0.4918626, 0, 0, 0, 1, 1,
-0.7269099, 0.07545104, -1.809582, 0, 0, 0, 1, 1,
-0.7217389, -1.601614, -3.52683, 1, 1, 1, 1, 1,
-0.7148248, 1.39593, -0.2996364, 1, 1, 1, 1, 1,
-0.7133319, -1.400151, -2.168097, 1, 1, 1, 1, 1,
-0.7128587, -0.3276654, -2.744443, 1, 1, 1, 1, 1,
-0.7116852, -0.3403971, -2.859075, 1, 1, 1, 1, 1,
-0.7080317, 0.1580911, -0.3748709, 1, 1, 1, 1, 1,
-0.7060233, 2.08227, -1.603348, 1, 1, 1, 1, 1,
-0.7037311, 0.4172034, -0.7854114, 1, 1, 1, 1, 1,
-0.6920623, -1.093631, -3.154444, 1, 1, 1, 1, 1,
-0.6845806, -0.4560218, -1.064543, 1, 1, 1, 1, 1,
-0.6807626, 0.1627867, -0.157196, 1, 1, 1, 1, 1,
-0.6787645, -0.5298489, -2.602146, 1, 1, 1, 1, 1,
-0.6776351, -0.9883656, -1.105175, 1, 1, 1, 1, 1,
-0.6763936, 0.2907903, 1.129749, 1, 1, 1, 1, 1,
-0.671771, 0.1029874, -0.7684507, 1, 1, 1, 1, 1,
-0.6699548, 0.6156303, -0.9465778, 0, 0, 1, 1, 1,
-0.6673057, -0.3295719, -0.9640073, 1, 0, 0, 1, 1,
-0.665851, -1.165232, -1.867545, 1, 0, 0, 1, 1,
-0.6643412, -0.5663456, -2.742547, 1, 0, 0, 1, 1,
-0.6630718, 1.339864, -1.120302, 1, 0, 0, 1, 1,
-0.6586693, 0.6276584, 0.8355493, 1, 0, 0, 1, 1,
-0.6540073, 0.8141007, -0.9846143, 0, 0, 0, 1, 1,
-0.652784, 0.2091533, -2.413199, 0, 0, 0, 1, 1,
-0.6459595, 0.2925113, -0.1850229, 0, 0, 0, 1, 1,
-0.6455092, -1.320989, -3.41061, 0, 0, 0, 1, 1,
-0.6410192, -0.070323, 0.342048, 0, 0, 0, 1, 1,
-0.6379464, -0.342706, -1.945052, 0, 0, 0, 1, 1,
-0.6295109, -0.7444832, -1.799196, 0, 0, 0, 1, 1,
-0.628243, -0.1788149, -0.1321579, 1, 1, 1, 1, 1,
-0.6245295, 0.2775616, -1.875144, 1, 1, 1, 1, 1,
-0.6148272, 0.4561355, -1.674802, 1, 1, 1, 1, 1,
-0.6136356, 0.2350297, -0.7919686, 1, 1, 1, 1, 1,
-0.6092616, 0.3520236, -0.4524354, 1, 1, 1, 1, 1,
-0.6059092, -0.8688305, -2.475092, 1, 1, 1, 1, 1,
-0.6051533, -0.5179363, -1.987853, 1, 1, 1, 1, 1,
-0.6042888, -0.7559021, -3.508044, 1, 1, 1, 1, 1,
-0.5996602, -0.1553133, -2.623807, 1, 1, 1, 1, 1,
-0.5991375, -1.676124, -2.628565, 1, 1, 1, 1, 1,
-0.5943108, -0.1252275, -1.917736, 1, 1, 1, 1, 1,
-0.5907378, -1.640029, -1.850164, 1, 1, 1, 1, 1,
-0.588452, -1.764239, -2.545472, 1, 1, 1, 1, 1,
-0.5874447, -1.343194, -2.385529, 1, 1, 1, 1, 1,
-0.5794532, 0.2593359, -1.990642, 1, 1, 1, 1, 1,
-0.5727361, -0.6274482, -2.419547, 0, 0, 1, 1, 1,
-0.5709065, -0.9233428, -1.510673, 1, 0, 0, 1, 1,
-0.5645543, -0.1208626, -1.565851, 1, 0, 0, 1, 1,
-0.5631974, -1.364412, -2.751073, 1, 0, 0, 1, 1,
-0.561227, -0.2542056, -3.653162, 1, 0, 0, 1, 1,
-0.5575523, -0.5626444, -3.814394, 1, 0, 0, 1, 1,
-0.5540472, -0.3714873, -3.124136, 0, 0, 0, 1, 1,
-0.552938, -0.8709328, -1.660275, 0, 0, 0, 1, 1,
-0.5430727, -0.5422105, -2.842089, 0, 0, 0, 1, 1,
-0.5425139, 0.4224991, -1.526936, 0, 0, 0, 1, 1,
-0.5374175, -0.5487085, -1.679546, 0, 0, 0, 1, 1,
-0.535066, 0.1223721, -1.17416, 0, 0, 0, 1, 1,
-0.5343639, 1.205107, 0.733361, 0, 0, 0, 1, 1,
-0.5329337, -0.4289025, -2.296698, 1, 1, 1, 1, 1,
-0.5283746, 1.801738, -0.4531808, 1, 1, 1, 1, 1,
-0.5177041, -0.3817076, -1.504762, 1, 1, 1, 1, 1,
-0.5173066, -1.092338, -0.5521813, 1, 1, 1, 1, 1,
-0.5078655, -0.4768821, -3.753004, 1, 1, 1, 1, 1,
-0.5076577, 1.365846, -0.4867345, 1, 1, 1, 1, 1,
-0.5072263, -0.242324, -1.644297, 1, 1, 1, 1, 1,
-0.5016917, -0.6132105, -1.340114, 1, 1, 1, 1, 1,
-0.5016911, 1.137847, -1.234409, 1, 1, 1, 1, 1,
-0.4931106, -0.5299479, -1.266656, 1, 1, 1, 1, 1,
-0.4919058, 1.074614, -0.4471211, 1, 1, 1, 1, 1,
-0.4915586, -0.181174, -3.181115, 1, 1, 1, 1, 1,
-0.4906892, 0.7612576, -0.5313528, 1, 1, 1, 1, 1,
-0.4883139, -1.292269, -5.408567, 1, 1, 1, 1, 1,
-0.4861245, -0.4867101, -2.160181, 1, 1, 1, 1, 1,
-0.4833378, -2.213544, -2.325395, 0, 0, 1, 1, 1,
-0.4746596, -0.3911185, -3.028423, 1, 0, 0, 1, 1,
-0.4727685, 1.202643, -0.8916041, 1, 0, 0, 1, 1,
-0.4725134, 0.4555624, -1.44003, 1, 0, 0, 1, 1,
-0.4714719, -0.5917225, -2.948152, 1, 0, 0, 1, 1,
-0.4706194, -0.1467863, -1.499117, 1, 0, 0, 1, 1,
-0.4675998, 0.5986626, -0.9036053, 0, 0, 0, 1, 1,
-0.4657115, -1.508903, -2.719094, 0, 0, 0, 1, 1,
-0.4653869, 0.9513665, 0.4556794, 0, 0, 0, 1, 1,
-0.4644028, -1.105354, -1.731233, 0, 0, 0, 1, 1,
-0.4631834, -0.6135451, -2.827616, 0, 0, 0, 1, 1,
-0.4600613, -0.3302432, -3.344934, 0, 0, 0, 1, 1,
-0.4597787, 0.537492, -0.9462705, 0, 0, 0, 1, 1,
-0.4535958, 0.3770291, -1.139887, 1, 1, 1, 1, 1,
-0.4460973, 0.6547021, 0.2376858, 1, 1, 1, 1, 1,
-0.4438411, 0.9923338, 0.2666385, 1, 1, 1, 1, 1,
-0.4419764, 1.066146, 0.1191471, 1, 1, 1, 1, 1,
-0.4392241, 1.094185, 0.5534649, 1, 1, 1, 1, 1,
-0.437864, -0.1156602, -1.02877, 1, 1, 1, 1, 1,
-0.4378586, 1.005242, -0.1192554, 1, 1, 1, 1, 1,
-0.4343606, 0.514475, -1.267269, 1, 1, 1, 1, 1,
-0.4305898, -0.1270872, -1.046376, 1, 1, 1, 1, 1,
-0.4305021, 1.404045, -1.061617, 1, 1, 1, 1, 1,
-0.4297499, -0.5766357, -5.559705, 1, 1, 1, 1, 1,
-0.4253165, 1.180128, 0.7744583, 1, 1, 1, 1, 1,
-0.4220938, -1.081015, -2.961196, 1, 1, 1, 1, 1,
-0.421815, 1.202845, -1.470971, 1, 1, 1, 1, 1,
-0.4217437, 0.3341342, -2.313383, 1, 1, 1, 1, 1,
-0.4217241, 0.4300361, -0.8421214, 0, 0, 1, 1, 1,
-0.4205676, 0.7039678, 0.157757, 1, 0, 0, 1, 1,
-0.4192901, 0.7508751, 0.8906943, 1, 0, 0, 1, 1,
-0.4167322, 0.09890536, -1.875246, 1, 0, 0, 1, 1,
-0.4138499, -0.7557812, -2.038992, 1, 0, 0, 1, 1,
-0.4097938, -0.5967773, -3.05229, 1, 0, 0, 1, 1,
-0.4054299, -0.6532558, -1.842773, 0, 0, 0, 1, 1,
-0.4029757, 0.6080503, -1.081858, 0, 0, 0, 1, 1,
-0.4008873, 0.5858443, 0.5278184, 0, 0, 0, 1, 1,
-0.3891335, -0.6413934, -2.027664, 0, 0, 0, 1, 1,
-0.3846568, 1.609562, -1.342659, 0, 0, 0, 1, 1,
-0.3823631, -1.295526, -2.886076, 0, 0, 0, 1, 1,
-0.3809366, 1.130495, -1.515035, 0, 0, 0, 1, 1,
-0.3750739, 0.150894, 0.7111607, 1, 1, 1, 1, 1,
-0.3747826, -0.2249414, -1.033358, 1, 1, 1, 1, 1,
-0.3732066, -1.159528, -2.740396, 1, 1, 1, 1, 1,
-0.3703562, 1.133903, -0.8004252, 1, 1, 1, 1, 1,
-0.3699325, 0.6708841, 0.1348222, 1, 1, 1, 1, 1,
-0.3696745, 0.2415737, -0.8617882, 1, 1, 1, 1, 1,
-0.3677348, 1.486934, -0.2273731, 1, 1, 1, 1, 1,
-0.3676338, 1.91651, 1.023334, 1, 1, 1, 1, 1,
-0.366069, 0.5655333, -0.3420723, 1, 1, 1, 1, 1,
-0.3618689, 1.081583, 0.1888402, 1, 1, 1, 1, 1,
-0.361346, -1.260135, -2.075373, 1, 1, 1, 1, 1,
-0.3606362, -0.3237593, -3.737393, 1, 1, 1, 1, 1,
-0.3605131, 0.7813104, -0.08030949, 1, 1, 1, 1, 1,
-0.3592233, 0.1400788, -1.841573, 1, 1, 1, 1, 1,
-0.3567008, -1.128593, -3.527343, 1, 1, 1, 1, 1,
-0.3535608, -0.9557021, -1.93418, 0, 0, 1, 1, 1,
-0.348451, -1.644649, -2.735077, 1, 0, 0, 1, 1,
-0.3476318, 0.6184506, 0.3997584, 1, 0, 0, 1, 1,
-0.344949, 1.24633, -0.5660707, 1, 0, 0, 1, 1,
-0.3445361, 1.291374, -0.1476484, 1, 0, 0, 1, 1,
-0.3442046, 1.878599, 0.547318, 1, 0, 0, 1, 1,
-0.3441148, -1.456782, -2.18349, 0, 0, 0, 1, 1,
-0.3425107, -0.2890822, -1.953478, 0, 0, 0, 1, 1,
-0.3392065, 1.592927, -0.7737697, 0, 0, 0, 1, 1,
-0.3340657, 0.7538932, 0.6830283, 0, 0, 0, 1, 1,
-0.332486, -0.3557818, -3.394925, 0, 0, 0, 1, 1,
-0.3295705, -1.213365, -3.269848, 0, 0, 0, 1, 1,
-0.3267881, 0.6354879, 0.2559195, 0, 0, 0, 1, 1,
-0.3261335, 1.476449, 0.5191303, 1, 1, 1, 1, 1,
-0.3254524, -1.903912, -0.670692, 1, 1, 1, 1, 1,
-0.3193795, -0.880311, -1.913365, 1, 1, 1, 1, 1,
-0.3185432, -0.5510992, -3.084939, 1, 1, 1, 1, 1,
-0.3153856, -0.5627661, -3.076141, 1, 1, 1, 1, 1,
-0.3152494, 0.3559244, -0.6622896, 1, 1, 1, 1, 1,
-0.3137253, 0.6539806, -0.2144304, 1, 1, 1, 1, 1,
-0.3103132, -0.4447364, -2.968219, 1, 1, 1, 1, 1,
-0.3030752, -2.074978, -3.58645, 1, 1, 1, 1, 1,
-0.3008035, -0.3894833, -0.6841381, 1, 1, 1, 1, 1,
-0.2952363, 0.7888197, -1.627158, 1, 1, 1, 1, 1,
-0.2946101, 0.2061843, 0.5075986, 1, 1, 1, 1, 1,
-0.2935943, 0.5498504, 1.246941, 1, 1, 1, 1, 1,
-0.291332, 1.698133, -1.338016, 1, 1, 1, 1, 1,
-0.2893289, 0.5621911, -0.07985868, 1, 1, 1, 1, 1,
-0.2882967, -1.203957, -2.373638, 0, 0, 1, 1, 1,
-0.2863117, 1.700692, -0.4270764, 1, 0, 0, 1, 1,
-0.2842405, 0.5593499, -0.03098138, 1, 0, 0, 1, 1,
-0.2787256, -1.182727, -2.178532, 1, 0, 0, 1, 1,
-0.2767095, -0.4374386, -2.89782, 1, 0, 0, 1, 1,
-0.2766885, -0.0957434, 0.5824485, 1, 0, 0, 1, 1,
-0.2765903, 0.5200543, -2.272472, 0, 0, 0, 1, 1,
-0.274714, -1.480729, -3.334957, 0, 0, 0, 1, 1,
-0.2742936, -0.5489892, -2.050398, 0, 0, 0, 1, 1,
-0.2713611, 0.4968473, 0.6992562, 0, 0, 0, 1, 1,
-0.2639565, 2.726127, -1.474106, 0, 0, 0, 1, 1,
-0.2606932, 0.4202666, -0.3876383, 0, 0, 0, 1, 1,
-0.260104, -1.232402, -2.900364, 0, 0, 0, 1, 1,
-0.2590357, -0.4693313, -0.217002, 1, 1, 1, 1, 1,
-0.2567451, 0.7556275, -1.118437, 1, 1, 1, 1, 1,
-0.2566385, -1.460282, -4.662004, 1, 1, 1, 1, 1,
-0.2564371, 0.4960189, 0.01013721, 1, 1, 1, 1, 1,
-0.2544011, 0.2395997, -0.5235053, 1, 1, 1, 1, 1,
-0.2520057, -1.207291, -3.062688, 1, 1, 1, 1, 1,
-0.2499391, -0.7375419, -1.04628, 1, 1, 1, 1, 1,
-0.2489293, 1.749288, 0.005206715, 1, 1, 1, 1, 1,
-0.2483839, -2.033633, -3.664774, 1, 1, 1, 1, 1,
-0.2444266, -0.5296272, -3.534757, 1, 1, 1, 1, 1,
-0.2430524, -1.616546, -3.177607, 1, 1, 1, 1, 1,
-0.2345844, -1.342176, -1.88195, 1, 1, 1, 1, 1,
-0.234033, -0.8825513, -2.707172, 1, 1, 1, 1, 1,
-0.2330002, -0.07297184, -1.741671, 1, 1, 1, 1, 1,
-0.2325506, -0.650107, -2.402293, 1, 1, 1, 1, 1,
-0.2322216, -1.391249, -2.23549, 0, 0, 1, 1, 1,
-0.2308163, 1.463833, -0.1844154, 1, 0, 0, 1, 1,
-0.230316, -1.131404, -5.072323, 1, 0, 0, 1, 1,
-0.2258587, 2.219893, 1.04542, 1, 0, 0, 1, 1,
-0.2248945, -0.4903949, -1.974788, 1, 0, 0, 1, 1,
-0.2227785, 0.3543478, -0.8006247, 1, 0, 0, 1, 1,
-0.2167334, -0.4508338, -4.241457, 0, 0, 0, 1, 1,
-0.2157445, -1.768308, -4.365298, 0, 0, 0, 1, 1,
-0.2141419, 0.2240717, -0.02780738, 0, 0, 0, 1, 1,
-0.2128267, 1.298026, 0.7387694, 0, 0, 0, 1, 1,
-0.2115644, 0.04382411, -1.177992, 0, 0, 0, 1, 1,
-0.2113611, 0.2460771, 1.083491, 0, 0, 0, 1, 1,
-0.2013156, -2.333105, -3.859029, 0, 0, 0, 1, 1,
-0.1958427, 0.6781573, -0.5518713, 1, 1, 1, 1, 1,
-0.1940274, -0.4440582, -3.671653, 1, 1, 1, 1, 1,
-0.1931656, -0.3547618, -2.945631, 1, 1, 1, 1, 1,
-0.192658, -1.745096, -4.498842, 1, 1, 1, 1, 1,
-0.1881523, 2.13716, -0.8525938, 1, 1, 1, 1, 1,
-0.1769398, -0.1998514, -3.594141, 1, 1, 1, 1, 1,
-0.1739224, -0.4282014, -2.328462, 1, 1, 1, 1, 1,
-0.1731697, 0.2262416, 0.8790567, 1, 1, 1, 1, 1,
-0.1730737, 0.3162152, -2.809382, 1, 1, 1, 1, 1,
-0.1694082, -0.5427459, -1.530886, 1, 1, 1, 1, 1,
-0.1689651, -1.114038, -1.797066, 1, 1, 1, 1, 1,
-0.1622463, 1.083208, -1.579657, 1, 1, 1, 1, 1,
-0.1608954, 0.2789393, 0.2611202, 1, 1, 1, 1, 1,
-0.158211, 0.6724525, -1.950596, 1, 1, 1, 1, 1,
-0.1545327, 0.2360531, 0.01265201, 1, 1, 1, 1, 1,
-0.1538162, -1.794124, -3.080028, 0, 0, 1, 1, 1,
-0.1531637, -1.130576, -3.166904, 1, 0, 0, 1, 1,
-0.1456267, 0.6547512, -0.08535799, 1, 0, 0, 1, 1,
-0.1440879, -0.2869317, -3.228414, 1, 0, 0, 1, 1,
-0.1396991, 0.8137685, 0.08676533, 1, 0, 0, 1, 1,
-0.1386705, 0.08474995, -1.171381, 1, 0, 0, 1, 1,
-0.1369148, -0.287679, -1.957934, 0, 0, 0, 1, 1,
-0.1360787, -0.1130412, -2.258327, 0, 0, 0, 1, 1,
-0.1292525, -0.1248602, -2.50848, 0, 0, 0, 1, 1,
-0.127804, 0.911778, 2.388519, 0, 0, 0, 1, 1,
-0.126672, -0.6395488, -2.991605, 0, 0, 0, 1, 1,
-0.1253982, -1.186405, -3.605, 0, 0, 0, 1, 1,
-0.1249589, -1.117689, -1.625526, 0, 0, 0, 1, 1,
-0.1209355, -0.8489027, -2.853006, 1, 1, 1, 1, 1,
-0.1163281, -0.8633563, -3.399863, 1, 1, 1, 1, 1,
-0.1143413, -0.4124896, -2.354874, 1, 1, 1, 1, 1,
-0.1141425, 0.4426461, -1.144904, 1, 1, 1, 1, 1,
-0.1135061, -0.2411761, -3.111933, 1, 1, 1, 1, 1,
-0.1131766, 2.565303, -0.430461, 1, 1, 1, 1, 1,
-0.1124707, 0.6575882, -0.1060288, 1, 1, 1, 1, 1,
-0.1102861, 0.3695842, -0.6113481, 1, 1, 1, 1, 1,
-0.1067608, -0.1117301, -2.506853, 1, 1, 1, 1, 1,
-0.1023759, 2.406317, -1.098221, 1, 1, 1, 1, 1,
-0.09867319, -0.4983682, -3.048977, 1, 1, 1, 1, 1,
-0.0960207, 0.5930203, -0.04919374, 1, 1, 1, 1, 1,
-0.09560037, 1.592203, 0.719001, 1, 1, 1, 1, 1,
-0.09279554, 0.4158597, -1.245382, 1, 1, 1, 1, 1,
-0.09171338, 0.03413649, -0.2568723, 1, 1, 1, 1, 1,
-0.09015311, -0.3749454, -2.582623, 0, 0, 1, 1, 1,
-0.08857641, -0.6606648, -3.284478, 1, 0, 0, 1, 1,
-0.08709811, 0.9941734, 0.9153278, 1, 0, 0, 1, 1,
-0.08602065, 0.9256256, 0.8830718, 1, 0, 0, 1, 1,
-0.07258257, -0.1027876, -1.52444, 1, 0, 0, 1, 1,
-0.07063045, 0.9195749, -0.03455238, 1, 0, 0, 1, 1,
-0.06970416, -1.730813, -5.003397, 0, 0, 0, 1, 1,
-0.06898085, -1.848518, -0.624752, 0, 0, 0, 1, 1,
-0.06871393, -0.1965992, -1.969533, 0, 0, 0, 1, 1,
-0.06762248, 0.406335, -0.07651501, 0, 0, 0, 1, 1,
-0.06574038, 2.203632, 2.019929, 0, 0, 0, 1, 1,
-0.06028474, 0.7305431, 0.3576139, 0, 0, 0, 1, 1,
-0.05762848, -2.124804, -3.752088, 0, 0, 0, 1, 1,
-0.04863596, 0.542712, 0.09587535, 1, 1, 1, 1, 1,
-0.0468533, -0.4334976, -1.851392, 1, 1, 1, 1, 1,
-0.04576959, 0.1775413, 0.05215498, 1, 1, 1, 1, 1,
-0.04555786, 0.9146088, -0.4962203, 1, 1, 1, 1, 1,
-0.04451065, 0.6044535, -0.321506, 1, 1, 1, 1, 1,
-0.04408828, -0.1274178, -4.326185, 1, 1, 1, 1, 1,
-0.04316909, 0.8834691, -0.8213165, 1, 1, 1, 1, 1,
-0.0431018, -0.8965666, -3.585847, 1, 1, 1, 1, 1,
-0.0428537, -1.682459, -1.775065, 1, 1, 1, 1, 1,
-0.04280961, -0.3470304, -1.50689, 1, 1, 1, 1, 1,
-0.02603365, -0.08916198, -2.887459, 1, 1, 1, 1, 1,
-0.0252744, -1.287851, -1.870412, 1, 1, 1, 1, 1,
-0.02520346, -0.5316743, -2.728363, 1, 1, 1, 1, 1,
-0.02504316, -0.9653557, -3.12617, 1, 1, 1, 1, 1,
-0.02159791, -0.2011385, -2.257878, 1, 1, 1, 1, 1,
-0.01925511, 1.401542, 0.9753147, 0, 0, 1, 1, 1,
-0.01332666, -1.385996, -3.584586, 1, 0, 0, 1, 1,
-0.01283791, -0.8298232, -3.512312, 1, 0, 0, 1, 1,
-0.008290251, 2.565858, 0.1540563, 1, 0, 0, 1, 1,
-0.007627099, -0.905063, -1.928518, 1, 0, 0, 1, 1,
-0.00736475, 1.225516, 0.8569227, 1, 0, 0, 1, 1,
-0.003120788, 0.7289072, 1.59055, 0, 0, 0, 1, 1,
-0.001905968, -0.319339, -2.473524, 0, 0, 0, 1, 1,
-0.000286499, -0.06023856, -4.167756, 0, 0, 0, 1, 1,
0.002860031, -1.074812, 3.605433, 0, 0, 0, 1, 1,
0.004207355, 0.9575833, -0.2367003, 0, 0, 0, 1, 1,
0.005432274, -0.524826, 3.416499, 0, 0, 0, 1, 1,
0.005514717, 0.480034, -1.928332, 0, 0, 0, 1, 1,
0.007168876, 0.6304813, 0.3929867, 1, 1, 1, 1, 1,
0.008583766, -0.08168527, 4.195267, 1, 1, 1, 1, 1,
0.01071511, 0.1485936, 0.1428153, 1, 1, 1, 1, 1,
0.01118381, -0.5045643, 4.087327, 1, 1, 1, 1, 1,
0.01205549, 0.0241704, 1.377159, 1, 1, 1, 1, 1,
0.01633077, -0.6781482, 3.879942, 1, 1, 1, 1, 1,
0.01653587, 1.716666, 0.3064851, 1, 1, 1, 1, 1,
0.01699598, 0.290862, 0.6054646, 1, 1, 1, 1, 1,
0.0176237, 0.2558022, 1.215298, 1, 1, 1, 1, 1,
0.01869462, -1.396926, 3.726692, 1, 1, 1, 1, 1,
0.02729434, -0.7345828, 2.072161, 1, 1, 1, 1, 1,
0.02858254, -0.8810255, 3.85177, 1, 1, 1, 1, 1,
0.02869742, -0.132091, 4.739816, 1, 1, 1, 1, 1,
0.02881522, 0.7639857, -1.125762, 1, 1, 1, 1, 1,
0.03066585, -0.7978896, 2.561029, 1, 1, 1, 1, 1,
0.03179292, 1.946925, 0.3034328, 0, 0, 1, 1, 1,
0.03526142, -0.3973259, 3.114741, 1, 0, 0, 1, 1,
0.03740329, 0.4806856, 0.4657097, 1, 0, 0, 1, 1,
0.03953781, 0.6496885, -1.285883, 1, 0, 0, 1, 1,
0.04258921, -0.7833613, 2.995726, 1, 0, 0, 1, 1,
0.05135977, 1.863967, 0.9996222, 1, 0, 0, 1, 1,
0.05424042, 0.4468015, -0.2550229, 0, 0, 0, 1, 1,
0.05668908, -0.8794304, 2.683648, 0, 0, 0, 1, 1,
0.05670068, -0.833429, 2.276952, 0, 0, 0, 1, 1,
0.06115445, -0.5678297, 1.415323, 0, 0, 0, 1, 1,
0.06645119, 0.5569789, 0.08739522, 0, 0, 0, 1, 1,
0.06936154, -1.304359, 1.14777, 0, 0, 0, 1, 1,
0.06967936, 2.016382, 1.640177, 0, 0, 0, 1, 1,
0.07027299, -0.8459258, 4.17166, 1, 1, 1, 1, 1,
0.07056203, 0.6668311, 0.4796557, 1, 1, 1, 1, 1,
0.07579182, -1.517804, 3.565851, 1, 1, 1, 1, 1,
0.07641907, 1.074075, 0.3067067, 1, 1, 1, 1, 1,
0.0812561, -0.848713, 2.701773, 1, 1, 1, 1, 1,
0.08567577, 0.05250383, 0.1822602, 1, 1, 1, 1, 1,
0.09105815, 0.07354938, 1.039947, 1, 1, 1, 1, 1,
0.09539629, 0.1603192, -0.8402059, 1, 1, 1, 1, 1,
0.09555365, -0.5403624, 1.906917, 1, 1, 1, 1, 1,
0.0969326, 0.1978378, -0.5513296, 1, 1, 1, 1, 1,
0.09982668, 0.2595998, 0.9243442, 1, 1, 1, 1, 1,
0.09997112, -0.1887922, 1.88651, 1, 1, 1, 1, 1,
0.1016398, 1.890297, -0.2694871, 1, 1, 1, 1, 1,
0.1046085, 0.5351192, 0.2330657, 1, 1, 1, 1, 1,
0.1058017, 0.7197793, 0.5481473, 1, 1, 1, 1, 1,
0.1058424, -0.9462352, 1.67208, 0, 0, 1, 1, 1,
0.1135339, -1.382341, 3.554528, 1, 0, 0, 1, 1,
0.1190596, 0.7052554, 0.9229015, 1, 0, 0, 1, 1,
0.1219432, -0.5418562, 1.656123, 1, 0, 0, 1, 1,
0.1247001, 1.259547, -0.4900775, 1, 0, 0, 1, 1,
0.1264994, 0.0459997, 1.034243, 1, 0, 0, 1, 1,
0.1289574, -1.494964, 4.722302, 0, 0, 0, 1, 1,
0.1297427, 1.290841, -0.5333133, 0, 0, 0, 1, 1,
0.1309478, -0.3900726, 3.256716, 0, 0, 0, 1, 1,
0.1377381, 0.3883575, -0.5408804, 0, 0, 0, 1, 1,
0.1403266, -0.04940875, 1.703797, 0, 0, 0, 1, 1,
0.1407481, 0.7951503, 0.6451646, 0, 0, 0, 1, 1,
0.1418427, 1.244193, -0.897242, 0, 0, 0, 1, 1,
0.1422131, 0.1884141, 1.580428, 1, 1, 1, 1, 1,
0.1482321, -0.9083633, 4.705005, 1, 1, 1, 1, 1,
0.1534147, -0.3352228, 2.083984, 1, 1, 1, 1, 1,
0.1534758, -1.889772, 5.192066, 1, 1, 1, 1, 1,
0.1551723, -0.5926786, 3.585924, 1, 1, 1, 1, 1,
0.1643771, -0.1612277, 2.595689, 1, 1, 1, 1, 1,
0.1673281, -0.7839378, 3.579903, 1, 1, 1, 1, 1,
0.1680748, -0.9819409, 1.916538, 1, 1, 1, 1, 1,
0.17054, 1.489318, -0.5808564, 1, 1, 1, 1, 1,
0.1716667, -1.031239, 5.049479, 1, 1, 1, 1, 1,
0.1718987, 0.8714045, -0.7870461, 1, 1, 1, 1, 1,
0.1749983, -0.3500354, 3.343715, 1, 1, 1, 1, 1,
0.1771599, 1.658168, 1.683118, 1, 1, 1, 1, 1,
0.1777232, -2.192806, 4.189855, 1, 1, 1, 1, 1,
0.18588, -0.2051471, 2.336441, 1, 1, 1, 1, 1,
0.1869625, -0.64388, 3.986241, 0, 0, 1, 1, 1,
0.1880642, -0.6053, 1.869832, 1, 0, 0, 1, 1,
0.1892289, 0.4114678, 0.9837158, 1, 0, 0, 1, 1,
0.1928431, 0.6799184, 0.57328, 1, 0, 0, 1, 1,
0.1995168, 0.06015587, 1.007011, 1, 0, 0, 1, 1,
0.2036563, -1.137275, 2.168397, 1, 0, 0, 1, 1,
0.2116432, 1.083434, 0.1530723, 0, 0, 0, 1, 1,
0.2177694, 1.307745, 2.412004, 0, 0, 0, 1, 1,
0.2185882, 2.485684, 0.04984842, 0, 0, 0, 1, 1,
0.2202062, 0.1579249, 2.144528, 0, 0, 0, 1, 1,
0.2214949, -0.6426216, 2.771476, 0, 0, 0, 1, 1,
0.2287317, 1.264497, -0.5477269, 0, 0, 0, 1, 1,
0.2293505, 0.7853857, 1.248588, 0, 0, 0, 1, 1,
0.2381227, 0.1961306, 2.074265, 1, 1, 1, 1, 1,
0.2467792, 0.2636228, -0.177643, 1, 1, 1, 1, 1,
0.2499794, -0.1133039, 2.911886, 1, 1, 1, 1, 1,
0.2564898, 1.92541, 0.4302233, 1, 1, 1, 1, 1,
0.2635882, -0.9931673, 3.51861, 1, 1, 1, 1, 1,
0.269197, 0.1328876, 1.839885, 1, 1, 1, 1, 1,
0.2756779, 0.1696594, 1.002599, 1, 1, 1, 1, 1,
0.2779618, -1.683086, 2.050868, 1, 1, 1, 1, 1,
0.278713, -0.4622014, 2.586771, 1, 1, 1, 1, 1,
0.28065, 0.35207, -0.9791412, 1, 1, 1, 1, 1,
0.2851024, 0.8522433, 0.2841126, 1, 1, 1, 1, 1,
0.2851258, -0.4138975, 3.490199, 1, 1, 1, 1, 1,
0.2881068, 0.782977, -0.4378805, 1, 1, 1, 1, 1,
0.2946317, 1.193251, 1.057457, 1, 1, 1, 1, 1,
0.2950639, 0.2931916, 1.119389, 1, 1, 1, 1, 1,
0.2976102, -0.3207244, 0.8524943, 0, 0, 1, 1, 1,
0.300136, 0.2755775, 0.9179104, 1, 0, 0, 1, 1,
0.3018275, 0.2978829, 2.80795, 1, 0, 0, 1, 1,
0.3051667, -1.406113, 1.71865, 1, 0, 0, 1, 1,
0.3073912, 0.01204833, 0.199767, 1, 0, 0, 1, 1,
0.3101993, -0.3866957, 2.922844, 1, 0, 0, 1, 1,
0.3222407, -0.9771237, 3.237588, 0, 0, 0, 1, 1,
0.3226135, -0.5500583, 3.334854, 0, 0, 0, 1, 1,
0.3227409, 0.07467344, 3.725132, 0, 0, 0, 1, 1,
0.3259838, -1.016908, 1.948435, 0, 0, 0, 1, 1,
0.3287386, 0.03565161, -0.7443053, 0, 0, 0, 1, 1,
0.328832, -1.054551, 3.351241, 0, 0, 0, 1, 1,
0.3289064, 0.3267433, 0.2011376, 0, 0, 0, 1, 1,
0.3311208, 0.3371584, 0.3772651, 1, 1, 1, 1, 1,
0.3335818, 0.4543434, -1.127918, 1, 1, 1, 1, 1,
0.3351968, -0.6335793, 1.711954, 1, 1, 1, 1, 1,
0.3370996, 0.5368902, 1.252357, 1, 1, 1, 1, 1,
0.3423984, -0.1656194, 2.082399, 1, 1, 1, 1, 1,
0.3462409, -0.9700156, 3.072823, 1, 1, 1, 1, 1,
0.3481609, -1.364108, 3.215508, 1, 1, 1, 1, 1,
0.3527968, -0.8601636, 2.214087, 1, 1, 1, 1, 1,
0.3554082, -0.970876, 3.069045, 1, 1, 1, 1, 1,
0.3558435, -0.275057, 2.064991, 1, 1, 1, 1, 1,
0.3559398, 1.060916, -0.3885642, 1, 1, 1, 1, 1,
0.3561549, -1.806075, 1.967147, 1, 1, 1, 1, 1,
0.3594057, -1.51973, 3.713735, 1, 1, 1, 1, 1,
0.3613918, -0.9142993, 3.061232, 1, 1, 1, 1, 1,
0.3625952, 0.1713647, -0.5096002, 1, 1, 1, 1, 1,
0.3659506, 0.5788669, 1.523647, 0, 0, 1, 1, 1,
0.3693292, -0.3041053, 1.620288, 1, 0, 0, 1, 1,
0.3698885, -0.1752819, 1.813434, 1, 0, 0, 1, 1,
0.3714287, 0.7183771, 3.836566, 1, 0, 0, 1, 1,
0.3734767, 0.6417119, 0.8493568, 1, 0, 0, 1, 1,
0.3746157, 0.5952362, -1.341471, 1, 0, 0, 1, 1,
0.3751837, -0.5964651, 2.559659, 0, 0, 0, 1, 1,
0.3834984, -1.162673, 2.27489, 0, 0, 0, 1, 1,
0.3903144, 1.072387, 0.6486709, 0, 0, 0, 1, 1,
0.3913772, -0.964063, 3.341844, 0, 0, 0, 1, 1,
0.3921665, 0.1917969, 2.501587, 0, 0, 0, 1, 1,
0.3960024, 0.961446, -0.8665366, 0, 0, 0, 1, 1,
0.3965207, -0.5325692, 3.508266, 0, 0, 0, 1, 1,
0.3972426, -1.39705, 1.541937, 1, 1, 1, 1, 1,
0.399404, 0.9278628, -0.4211476, 1, 1, 1, 1, 1,
0.4002413, -0.4037345, 4.471966, 1, 1, 1, 1, 1,
0.4014398, 0.7195621, 1.698836, 1, 1, 1, 1, 1,
0.4024225, 1.277132, 1.327291, 1, 1, 1, 1, 1,
0.4050591, -0.414238, 4.827414, 1, 1, 1, 1, 1,
0.4062219, 0.2296142, 0.9064823, 1, 1, 1, 1, 1,
0.4075319, -0.08586591, 3.066865, 1, 1, 1, 1, 1,
0.4119529, 0.5921432, -0.06206956, 1, 1, 1, 1, 1,
0.4145442, -1.686466, 4.502726, 1, 1, 1, 1, 1,
0.4145631, 0.1203286, 2.077452, 1, 1, 1, 1, 1,
0.4159742, 0.08430956, 1.424482, 1, 1, 1, 1, 1,
0.4183727, 0.4249877, 2.555023, 1, 1, 1, 1, 1,
0.4200068, 0.4788051, 0.2568599, 1, 1, 1, 1, 1,
0.4216352, -0.4405884, 2.561814, 1, 1, 1, 1, 1,
0.4297704, -1.604306, 3.359158, 0, 0, 1, 1, 1,
0.4299853, 0.3033632, 1.652994, 1, 0, 0, 1, 1,
0.4331135, 0.5018121, -1.083677, 1, 0, 0, 1, 1,
0.4348188, 1.804396, 0.4445687, 1, 0, 0, 1, 1,
0.4348191, 1.867517, 0.37089, 1, 0, 0, 1, 1,
0.4400056, 2.082743, -0.179975, 1, 0, 0, 1, 1,
0.4413179, 0.8545929, -0.4539727, 0, 0, 0, 1, 1,
0.4441814, -0.6644346, 2.703439, 0, 0, 0, 1, 1,
0.4450432, -0.6601576, 3.36584, 0, 0, 0, 1, 1,
0.4459653, 1.040957, -0.02431977, 0, 0, 0, 1, 1,
0.4541179, -0.7708945, 2.106157, 0, 0, 0, 1, 1,
0.4550202, -0.7065699, 1.769057, 0, 0, 0, 1, 1,
0.4586517, 0.7006131, 1.516957, 0, 0, 0, 1, 1,
0.4606339, -1.864337, 3.762467, 1, 1, 1, 1, 1,
0.4610656, 0.5609715, 0.5292409, 1, 1, 1, 1, 1,
0.4637201, -1.408238, 1.32566, 1, 1, 1, 1, 1,
0.466187, -0.4739023, 1.49546, 1, 1, 1, 1, 1,
0.4668356, -2.275257, 2.693576, 1, 1, 1, 1, 1,
0.4668427, 1.183332, 1.403612, 1, 1, 1, 1, 1,
0.4680648, 0.7747951, -0.8978444, 1, 1, 1, 1, 1,
0.47176, 0.8663915, -0.4475806, 1, 1, 1, 1, 1,
0.4736252, -0.727354, 1.796559, 1, 1, 1, 1, 1,
0.479232, 0.08177777, 2.305974, 1, 1, 1, 1, 1,
0.4814892, 1.038809, 0.3441965, 1, 1, 1, 1, 1,
0.481611, 1.055026, -0.4221654, 1, 1, 1, 1, 1,
0.4850416, 0.09946215, 2.231003, 1, 1, 1, 1, 1,
0.4862149, 0.1380031, 2.488491, 1, 1, 1, 1, 1,
0.4889865, -0.6182877, 1.627223, 1, 1, 1, 1, 1,
0.4907557, -1.336441, 2.69257, 0, 0, 1, 1, 1,
0.4957106, 0.716071, 0.9652593, 1, 0, 0, 1, 1,
0.497313, 0.05191299, 1.701166, 1, 0, 0, 1, 1,
0.5034617, 0.8006939, 0.2801382, 1, 0, 0, 1, 1,
0.5040046, -1.368665, 2.117826, 1, 0, 0, 1, 1,
0.5055653, 1.431147, -0.6092538, 1, 0, 0, 1, 1,
0.5062959, -2.070498, 1.933546, 0, 0, 0, 1, 1,
0.5116223, 0.327096, 2.451614, 0, 0, 0, 1, 1,
0.5141709, -0.549493, 1.870147, 0, 0, 0, 1, 1,
0.5167249, 0.5381377, 0.9531196, 0, 0, 0, 1, 1,
0.5218375, 0.04990276, 1.156285, 0, 0, 0, 1, 1,
0.5238261, 0.4040559, 1.109375, 0, 0, 0, 1, 1,
0.5257528, 0.6112638, -0.2572643, 0, 0, 0, 1, 1,
0.5321835, 1.101163, -0.4184295, 1, 1, 1, 1, 1,
0.5356401, 0.2031377, 0.5419592, 1, 1, 1, 1, 1,
0.5375526, -0.410071, 2.233643, 1, 1, 1, 1, 1,
0.5413905, -0.1303277, 1.89097, 1, 1, 1, 1, 1,
0.5463302, 1.094438, -1.906032, 1, 1, 1, 1, 1,
0.5565978, 0.2451847, 1.341059, 1, 1, 1, 1, 1,
0.5663131, 1.460885, 0.297644, 1, 1, 1, 1, 1,
0.5670725, 0.3441851, -0.3736556, 1, 1, 1, 1, 1,
0.5674418, -1.512792, 2.423342, 1, 1, 1, 1, 1,
0.5739451, -1.396139, -0.7970366, 1, 1, 1, 1, 1,
0.5753604, -0.3566359, 1.802853, 1, 1, 1, 1, 1,
0.5805411, -1.17974, 3.613503, 1, 1, 1, 1, 1,
0.5820945, 1.71162, 0.01185841, 1, 1, 1, 1, 1,
0.582803, -0.1976541, 3.557374, 1, 1, 1, 1, 1,
0.5869552, 1.803828, 1.987251, 1, 1, 1, 1, 1,
0.5869618, -0.1454799, 2.029836, 0, 0, 1, 1, 1,
0.5875718, -1.089441, 2.432276, 1, 0, 0, 1, 1,
0.6000966, 0.4592035, 1.791445, 1, 0, 0, 1, 1,
0.6014546, -0.6856397, 0.6472896, 1, 0, 0, 1, 1,
0.6188248, -0.4553163, 1.622599, 1, 0, 0, 1, 1,
0.6214737, -0.8285299, 3.342446, 1, 0, 0, 1, 1,
0.6256133, 1.998162, 1.538635, 0, 0, 0, 1, 1,
0.6285858, -1.094807, 1.747154, 0, 0, 0, 1, 1,
0.630024, 0.449265, 1.958804, 0, 0, 0, 1, 1,
0.6304286, 0.7214941, 1.217981, 0, 0, 0, 1, 1,
0.6349763, 1.07884, 0.06419723, 0, 0, 0, 1, 1,
0.640029, -1.376843, 2.870314, 0, 0, 0, 1, 1,
0.6438353, 0.8811786, 1.10532, 0, 0, 0, 1, 1,
0.6479452, 0.6841528, -0.3769443, 1, 1, 1, 1, 1,
0.6553138, -0.6206989, 2.254756, 1, 1, 1, 1, 1,
0.6579728, -0.2584334, 2.655697, 1, 1, 1, 1, 1,
0.6593923, 0.1660529, 1.476915, 1, 1, 1, 1, 1,
0.6616729, -0.140981, 0.9434967, 1, 1, 1, 1, 1,
0.6644558, 0.6624073, 1.511629, 1, 1, 1, 1, 1,
0.6654314, -0.632122, 1.975574, 1, 1, 1, 1, 1,
0.6666798, 0.1583182, 2.661094, 1, 1, 1, 1, 1,
0.6688018, 0.6185286, 1.488203, 1, 1, 1, 1, 1,
0.6717367, 0.7099259, -0.4559385, 1, 1, 1, 1, 1,
0.6765619, 0.6346505, 1.541373, 1, 1, 1, 1, 1,
0.679079, 1.72244, 0.2182424, 1, 1, 1, 1, 1,
0.679669, 0.7783092, 0.4527444, 1, 1, 1, 1, 1,
0.6813275, -0.6201682, 3.997196, 1, 1, 1, 1, 1,
0.6820004, -0.3099508, 3.012186, 1, 1, 1, 1, 1,
0.68218, -0.1469438, 2.998912, 0, 0, 1, 1, 1,
0.6831267, -0.01643095, 0.274769, 1, 0, 0, 1, 1,
0.6876605, -0.4057438, 1.9568, 1, 0, 0, 1, 1,
0.6891587, -3.270881, 5.832242, 1, 0, 0, 1, 1,
0.6936288, -1.037743, 2.858265, 1, 0, 0, 1, 1,
0.6971768, -1.68756, 1.396194, 1, 0, 0, 1, 1,
0.7049841, -1.434627, 1.388581, 0, 0, 0, 1, 1,
0.7064151, -0.9817842, 1.915684, 0, 0, 0, 1, 1,
0.711332, 1.910425, 0.04131494, 0, 0, 0, 1, 1,
0.7118899, 0.2946593, -0.4731458, 0, 0, 0, 1, 1,
0.7130299, -0.5427817, 3.649113, 0, 0, 0, 1, 1,
0.7155284, -1.402789, 3.469237, 0, 0, 0, 1, 1,
0.7168633, 0.5035622, 1.205959, 0, 0, 0, 1, 1,
0.7182163, -0.8075253, 1.783944, 1, 1, 1, 1, 1,
0.720265, -0.9489754, 2.784341, 1, 1, 1, 1, 1,
0.7247596, -2.951658, 3.563846, 1, 1, 1, 1, 1,
0.7265139, 0.8880611, 1.192982, 1, 1, 1, 1, 1,
0.7335462, -0.83384, 2.282777, 1, 1, 1, 1, 1,
0.7392358, -0.4307564, 0.02479808, 1, 1, 1, 1, 1,
0.7398352, 0.003189747, 1.972412, 1, 1, 1, 1, 1,
0.7454514, -1.922908, 3.448045, 1, 1, 1, 1, 1,
0.7494078, -0.4198731, 1.04477, 1, 1, 1, 1, 1,
0.7505569, 0.04510862, 0.9164243, 1, 1, 1, 1, 1,
0.7577893, -1.72815, 4.440279, 1, 1, 1, 1, 1,
0.7628804, -1.437553, 1.950344, 1, 1, 1, 1, 1,
0.7673559, 0.8387405, 2.126641, 1, 1, 1, 1, 1,
0.7676904, -0.5819106, 2.451751, 1, 1, 1, 1, 1,
0.7680922, 1.506658, -0.7622616, 1, 1, 1, 1, 1,
0.7691457, -0.8914474, 1.310614, 0, 0, 1, 1, 1,
0.7723098, 1.601181, 0.5256458, 1, 0, 0, 1, 1,
0.7740558, -0.08366861, 2.971332, 1, 0, 0, 1, 1,
0.7751715, -1.512184, 2.583138, 1, 0, 0, 1, 1,
0.7793173, 0.1090602, 2.866106, 1, 0, 0, 1, 1,
0.7809086, -0.6517263, 2.415403, 1, 0, 0, 1, 1,
0.7816898, -1.298277, 0.285699, 0, 0, 0, 1, 1,
0.7954969, 0.02105127, 3.811831, 0, 0, 0, 1, 1,
0.801055, -0.09720913, 3.271385, 0, 0, 0, 1, 1,
0.805796, 0.5156328, 0.07209344, 0, 0, 0, 1, 1,
0.8064368, -1.110806, 3.588949, 0, 0, 0, 1, 1,
0.8084805, -1.120802, 2.591668, 0, 0, 0, 1, 1,
0.8101954, 1.569627, 0.1789961, 0, 0, 0, 1, 1,
0.8143748, 0.3738945, 0.5593812, 1, 1, 1, 1, 1,
0.8145108, -1.273967, 2.886743, 1, 1, 1, 1, 1,
0.8160129, -0.3195089, 0.5727618, 1, 1, 1, 1, 1,
0.8226518, -2.323786, 2.430376, 1, 1, 1, 1, 1,
0.823719, 0.02749819, 1.886836, 1, 1, 1, 1, 1,
0.8255222, -3.036144, 3.186339, 1, 1, 1, 1, 1,
0.8273553, 0.05569651, 1.437544, 1, 1, 1, 1, 1,
0.8289241, 1.280938, 0.4836786, 1, 1, 1, 1, 1,
0.836488, 0.3907009, 1.553489, 1, 1, 1, 1, 1,
0.8366864, -1.069133, 2.90709, 1, 1, 1, 1, 1,
0.8367407, -0.467607, 1.552634, 1, 1, 1, 1, 1,
0.8387581, -1.442995, 2.665597, 1, 1, 1, 1, 1,
0.8410043, -0.9305026, 2.395866, 1, 1, 1, 1, 1,
0.8486499, 0.1212691, 0.9422753, 1, 1, 1, 1, 1,
0.8498357, 0.8950968, 0.8309388, 1, 1, 1, 1, 1,
0.8621542, 0.9159644, 2.827777, 0, 0, 1, 1, 1,
0.8667433, -1.533144, 2.92991, 1, 0, 0, 1, 1,
0.8700224, 0.09831669, 1.850703, 1, 0, 0, 1, 1,
0.8713007, -1.178785, 1.851423, 1, 0, 0, 1, 1,
0.8732509, 0.1356391, 2.330759, 1, 0, 0, 1, 1,
0.8777269, -1.604851, 1.02795, 1, 0, 0, 1, 1,
0.8868021, -2.703379, 2.256243, 0, 0, 0, 1, 1,
0.8868547, -0.2316558, 0.7349352, 0, 0, 0, 1, 1,
0.8870685, -0.7991751, 4.403227, 0, 0, 0, 1, 1,
0.8874483, -0.393086, 2.343802, 0, 0, 0, 1, 1,
0.888712, 0.02920447, 2.514103, 0, 0, 0, 1, 1,
0.8900532, -0.8901719, 3.401658, 0, 0, 0, 1, 1,
0.892734, 0.002746159, 3.14867, 0, 0, 0, 1, 1,
0.8930661, 0.6717556, 0.5056825, 1, 1, 1, 1, 1,
0.8997551, -0.2947173, 3.211944, 1, 1, 1, 1, 1,
0.9080578, -2.179434, 2.460782, 1, 1, 1, 1, 1,
0.9160898, 0.9892441, 0.1601063, 1, 1, 1, 1, 1,
0.9167336, -0.495627, 1.331936, 1, 1, 1, 1, 1,
0.9196853, -0.481036, 2.002964, 1, 1, 1, 1, 1,
0.9267781, -1.201054, 4.055294, 1, 1, 1, 1, 1,
0.9358296, -0.7672921, 2.430535, 1, 1, 1, 1, 1,
0.9378403, 1.626849, -1.362418, 1, 1, 1, 1, 1,
0.9391362, -0.6643513, 1.49644, 1, 1, 1, 1, 1,
0.940548, -0.2153639, 2.652549, 1, 1, 1, 1, 1,
0.9407278, 0.5561402, 3.310688, 1, 1, 1, 1, 1,
0.9414227, 0.582343, 0.1499459, 1, 1, 1, 1, 1,
0.9628254, -0.6127572, 0.7787031, 1, 1, 1, 1, 1,
0.9653296, 0.04545889, -0.001983736, 1, 1, 1, 1, 1,
0.9717517, -0.08582346, 1.282558, 0, 0, 1, 1, 1,
0.9774674, -2.02976, 1.678042, 1, 0, 0, 1, 1,
0.979986, -0.6345543, 2.851599, 1, 0, 0, 1, 1,
0.9834679, 0.1713666, 1.180098, 1, 0, 0, 1, 1,
0.9867068, 0.4051625, 2.033484, 1, 0, 0, 1, 1,
0.9873581, -2.276675, 1.165671, 1, 0, 0, 1, 1,
0.9904952, 0.3297131, 1.742051, 0, 0, 0, 1, 1,
0.9952537, -1.200391, 4.199513, 0, 0, 0, 1, 1,
0.9954584, 2.585048, 0.5116746, 0, 0, 0, 1, 1,
1.007485, 1.879817, 0.3145821, 0, 0, 0, 1, 1,
1.012173, -0.1158875, 0.5048368, 0, 0, 0, 1, 1,
1.014216, -0.2716184, 3.445805, 0, 0, 0, 1, 1,
1.016921, 1.255427, 0.8622773, 0, 0, 0, 1, 1,
1.018427, 2.027116, 1.780409, 1, 1, 1, 1, 1,
1.01921, 0.0464471, 3.153542, 1, 1, 1, 1, 1,
1.02001, -0.1305236, 1.629618, 1, 1, 1, 1, 1,
1.020687, 0.6477253, 0.9588204, 1, 1, 1, 1, 1,
1.026024, -1.120531, 3.093981, 1, 1, 1, 1, 1,
1.03096, -0.1122799, 1.372457, 1, 1, 1, 1, 1,
1.044257, -0.4176523, 0.8161632, 1, 1, 1, 1, 1,
1.045113, 1.690783, 1.5201, 1, 1, 1, 1, 1,
1.046443, -0.6095068, 1.983983, 1, 1, 1, 1, 1,
1.049854, 1.294784, 0.7045319, 1, 1, 1, 1, 1,
1.060496, 0.437818, 0.5018515, 1, 1, 1, 1, 1,
1.075491, -0.207556, -0.450147, 1, 1, 1, 1, 1,
1.075577, 0.1678208, -0.8761049, 1, 1, 1, 1, 1,
1.078629, 0.9921195, 0.491412, 1, 1, 1, 1, 1,
1.088568, -0.5603496, 1.359358, 1, 1, 1, 1, 1,
1.091497, -1.482634, 3.687027, 0, 0, 1, 1, 1,
1.098905, 0.2897856, 1.153508, 1, 0, 0, 1, 1,
1.104568, 0.4391233, 1.486783, 1, 0, 0, 1, 1,
1.104839, -1.354124, 2.230265, 1, 0, 0, 1, 1,
1.12408, -0.5412621, 2.784347, 1, 0, 0, 1, 1,
1.124666, 0.3398725, 0.5501312, 1, 0, 0, 1, 1,
1.125128, -0.3144547, 2.300258, 0, 0, 0, 1, 1,
1.137072, 0.8791777, 0.8731518, 0, 0, 0, 1, 1,
1.140526, 0.2318135, 0.1924301, 0, 0, 0, 1, 1,
1.148016, -1.167316, 2.401961, 0, 0, 0, 1, 1,
1.148251, -0.3421344, 2.599467, 0, 0, 0, 1, 1,
1.15145, -0.3492143, 1.348896, 0, 0, 0, 1, 1,
1.15225, -0.6765449, 1.922677, 0, 0, 0, 1, 1,
1.156663, 1.144435, -0.08159263, 1, 1, 1, 1, 1,
1.158911, -0.324977, 0.3957711, 1, 1, 1, 1, 1,
1.160074, -0.913355, 1.879814, 1, 1, 1, 1, 1,
1.160327, -0.7460313, 1.77433, 1, 1, 1, 1, 1,
1.167814, 0.6929727, -0.03058193, 1, 1, 1, 1, 1,
1.171204, -0.006037361, 2.372554, 1, 1, 1, 1, 1,
1.176785, 0.9001179, -0.9911041, 1, 1, 1, 1, 1,
1.178641, -0.3581563, 2.221785, 1, 1, 1, 1, 1,
1.184402, -0.5573964, 2.130069, 1, 1, 1, 1, 1,
1.190241, -1.15373, 2.00809, 1, 1, 1, 1, 1,
1.193461, 0.05107437, 1.092525, 1, 1, 1, 1, 1,
1.200507, -1.120924, 2.767939, 1, 1, 1, 1, 1,
1.20305, -0.3413405, 1.381041, 1, 1, 1, 1, 1,
1.225539, 0.04498201, 2.164399, 1, 1, 1, 1, 1,
1.246484, -0.3048442, 3.144964, 1, 1, 1, 1, 1,
1.24651, -0.2645102, 1.549825, 0, 0, 1, 1, 1,
1.248124, 0.3903817, -0.8329022, 1, 0, 0, 1, 1,
1.255879, 0.6988274, 0.5481578, 1, 0, 0, 1, 1,
1.259402, -0.6249231, 0.748822, 1, 0, 0, 1, 1,
1.261148, 0.8925938, 0.6557158, 1, 0, 0, 1, 1,
1.274474, -0.4154815, 1.681329, 1, 0, 0, 1, 1,
1.277452, 1.248918, 0.5537078, 0, 0, 0, 1, 1,
1.277983, 1.296344, 1.72687, 0, 0, 0, 1, 1,
1.279308, 0.6025701, 1.365332, 0, 0, 0, 1, 1,
1.286694, 0.4686645, 2.45577, 0, 0, 0, 1, 1,
1.28757, -0.708567, 1.992198, 0, 0, 0, 1, 1,
1.288203, 0.5245619, 2.771146, 0, 0, 0, 1, 1,
1.299329, -0.6256601, 2.821691, 0, 0, 0, 1, 1,
1.300569, -1.753652, 1.726729, 1, 1, 1, 1, 1,
1.300755, -0.0703205, 1.091762, 1, 1, 1, 1, 1,
1.300954, -0.1079286, -0.3426226, 1, 1, 1, 1, 1,
1.304423, 1.67746, -0.1363907, 1, 1, 1, 1, 1,
1.309606, -1.598119, 5.240845, 1, 1, 1, 1, 1,
1.310096, -0.5347966, 0.1581632, 1, 1, 1, 1, 1,
1.314499, 0.3983998, 2.047718, 1, 1, 1, 1, 1,
1.333805, -0.1312458, 1.008049, 1, 1, 1, 1, 1,
1.334124, -1.396526, 2.852942, 1, 1, 1, 1, 1,
1.347706, -2.173243, 4.158452, 1, 1, 1, 1, 1,
1.34862, -0.3241653, 0.4227909, 1, 1, 1, 1, 1,
1.349062, -1.820402, 2.289602, 1, 1, 1, 1, 1,
1.356227, 1.203893, 0.0243469, 1, 1, 1, 1, 1,
1.36735, 2.470337, -0.6476049, 1, 1, 1, 1, 1,
1.395558, 0.3168854, 0.7579224, 1, 1, 1, 1, 1,
1.395962, -1.594995, 1.400684, 0, 0, 1, 1, 1,
1.396149, 0.102285, 2.655794, 1, 0, 0, 1, 1,
1.401698, -1.343262, 4.012384, 1, 0, 0, 1, 1,
1.41238, 0.6949587, 0.8648062, 1, 0, 0, 1, 1,
1.419924, -0.2879514, 1.168053, 1, 0, 0, 1, 1,
1.422804, 0.2555414, 2.445063, 1, 0, 0, 1, 1,
1.424951, -0.03711704, 2.318909, 0, 0, 0, 1, 1,
1.428488, 0.2813796, 1.8978, 0, 0, 0, 1, 1,
1.435159, -1.521599, 3.75301, 0, 0, 0, 1, 1,
1.447093, 0.3903258, 0.9062014, 0, 0, 0, 1, 1,
1.452735, -1.243708, 3.086073, 0, 0, 0, 1, 1,
1.470747, 1.403039, 2.050831, 0, 0, 0, 1, 1,
1.47937, 0.12803, 1.172275, 0, 0, 0, 1, 1,
1.480096, 1.142519, -1.425879, 1, 1, 1, 1, 1,
1.496713, 0.2306207, 1.700792, 1, 1, 1, 1, 1,
1.50078, 2.330514, -0.823866, 1, 1, 1, 1, 1,
1.505593, 1.665575, 0.6658878, 1, 1, 1, 1, 1,
1.509674, 0.2630317, 2.07074, 1, 1, 1, 1, 1,
1.515396, 1.933934, -0.04927441, 1, 1, 1, 1, 1,
1.520039, -0.6826568, 2.229521, 1, 1, 1, 1, 1,
1.523431, -0.01653284, 0.9771318, 1, 1, 1, 1, 1,
1.524687, 2.152273, -0.2854732, 1, 1, 1, 1, 1,
1.531309, 1.79592, 2.501305, 1, 1, 1, 1, 1,
1.532722, 0.8483056, 0.001255164, 1, 1, 1, 1, 1,
1.53786, -0.3996974, 3.259213, 1, 1, 1, 1, 1,
1.540754, -1.41362, 0.6921818, 1, 1, 1, 1, 1,
1.544043, 0.09423295, 1.709728, 1, 1, 1, 1, 1,
1.549805, -0.1693299, 1.457662, 1, 1, 1, 1, 1,
1.559652, -1.219921, 3.478258, 0, 0, 1, 1, 1,
1.564626, -1.392896, 1.879123, 1, 0, 0, 1, 1,
1.566823, -0.6240439, 2.318266, 1, 0, 0, 1, 1,
1.584576, -1.270579, 0.9890379, 1, 0, 0, 1, 1,
1.585757, -2.291868, 4.693747, 1, 0, 0, 1, 1,
1.589919, 0.3895923, 0.658577, 1, 0, 0, 1, 1,
1.592436, 1.511536, 0.457355, 0, 0, 0, 1, 1,
1.593187, -0.5133379, 1.280154, 0, 0, 0, 1, 1,
1.619565, 0.6164936, 1.965503, 0, 0, 0, 1, 1,
1.627552, -0.2931389, 1.899317, 0, 0, 0, 1, 1,
1.651948, -0.7203233, 3.420631, 0, 0, 0, 1, 1,
1.655996, 1.637819, 0.9487881, 0, 0, 0, 1, 1,
1.670585, 1.384326, 1.831941, 0, 0, 0, 1, 1,
1.675948, 0.8128629, 2.506845, 1, 1, 1, 1, 1,
1.67809, -0.2710863, 1.023411, 1, 1, 1, 1, 1,
1.681721, 0.5969423, 1.491345, 1, 1, 1, 1, 1,
1.709103, -0.2964197, 3.116103, 1, 1, 1, 1, 1,
1.711317, 0.5241545, 0.918529, 1, 1, 1, 1, 1,
1.718545, -1.260018, 2.919637, 1, 1, 1, 1, 1,
1.731463, 0.002814548, 0.4504156, 1, 1, 1, 1, 1,
1.753885, 1.579917, 3.080208, 1, 1, 1, 1, 1,
1.755269, 0.001654795, 2.225291, 1, 1, 1, 1, 1,
1.790556, -0.7745151, 0.9912241, 1, 1, 1, 1, 1,
1.834251, -1.522591, 1.636192, 1, 1, 1, 1, 1,
1.84175, -1.154499, 3.827536, 1, 1, 1, 1, 1,
1.843262, 0.6223027, 1.042356, 1, 1, 1, 1, 1,
1.851134, 0.249914, 0.967824, 1, 1, 1, 1, 1,
1.878086, -0.4903898, 0.7653754, 1, 1, 1, 1, 1,
1.923924, -0.2658691, 2.388436, 0, 0, 1, 1, 1,
1.929662, 1.338977, 1.295375, 1, 0, 0, 1, 1,
1.967832, -0.02637876, 1.072114, 1, 0, 0, 1, 1,
1.999907, 0.272278, 1.704445, 1, 0, 0, 1, 1,
2.004233, 1.423254, 1.205818, 1, 0, 0, 1, 1,
2.005738, -1.189702, -0.3786067, 1, 0, 0, 1, 1,
2.008741, -0.7549046, 0.5773916, 0, 0, 0, 1, 1,
2.00925, 1.580504, 0.1445525, 0, 0, 0, 1, 1,
2.018406, -0.5536289, 1.870456, 0, 0, 0, 1, 1,
2.031704, 0.9621609, 1.460264, 0, 0, 0, 1, 1,
2.04686, 1.403179, 1.501411, 0, 0, 0, 1, 1,
2.082837, -0.5881169, 2.782933, 0, 0, 0, 1, 1,
2.136771, -0.9958443, 1.284435, 0, 0, 0, 1, 1,
2.212919, 0.9053105, 1.191452, 1, 1, 1, 1, 1,
2.254677, -0.217357, 2.797625, 1, 1, 1, 1, 1,
2.302625, -0.3451063, 4.074982, 1, 1, 1, 1, 1,
2.356321, -0.5804912, 1.742888, 1, 1, 1, 1, 1,
2.686546, 1.199875, 0.8531517, 1, 1, 1, 1, 1,
2.726272, 1.320351, -0.1677148, 1, 1, 1, 1, 1,
3.377844, -0.9760259, 1.355714, 1, 1, 1, 1, 1
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
var radius = 9.764252;
var distance = 34.29652;
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
mvMatrix.translate( -0.2784632, 0.1292737, -0.1362681 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29652);
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
