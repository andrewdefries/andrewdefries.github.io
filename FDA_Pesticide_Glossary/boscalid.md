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
-2.93893, -0.621407, -1.705156, 1, 0, 0, 1,
-2.804492, -0.664009, -3.060717, 1, 0.007843138, 0, 1,
-2.798685, -0.167643, -1.550558, 1, 0.01176471, 0, 1,
-2.665355, 0.1310997, -2.273601, 1, 0.01960784, 0, 1,
-2.633628, -0.6128167, 0.299684, 1, 0.02352941, 0, 1,
-2.60775, -1.279886, -0.472671, 1, 0.03137255, 0, 1,
-2.547423, 0.5914717, -1.274333, 1, 0.03529412, 0, 1,
-2.543963, -1.015257, -1.672894, 1, 0.04313726, 0, 1,
-2.514038, 0.4625196, -0.728413, 1, 0.04705882, 0, 1,
-2.495893, -1.034516, -0.2856583, 1, 0.05490196, 0, 1,
-2.480184, -1.349607, -2.870712, 1, 0.05882353, 0, 1,
-2.456763, -1.495806, -1.262277, 1, 0.06666667, 0, 1,
-2.391447, 2.002909, -0.9059335, 1, 0.07058824, 0, 1,
-2.338884, -0.1934719, 0.5086141, 1, 0.07843138, 0, 1,
-2.303948, -0.3319768, -1.28148, 1, 0.08235294, 0, 1,
-2.263479, -0.4105994, -0.369837, 1, 0.09019608, 0, 1,
-2.262533, 1.242532, -0.03357306, 1, 0.09411765, 0, 1,
-2.215827, -0.794389, -2.03673, 1, 0.1019608, 0, 1,
-2.20689, -0.1114948, -0.3848782, 1, 0.1098039, 0, 1,
-2.198632, 0.615537, -3.072711, 1, 0.1137255, 0, 1,
-2.159364, 2.193908, 0.3523147, 1, 0.1215686, 0, 1,
-2.154501, -0.6848727, -1.069581, 1, 0.1254902, 0, 1,
-2.150877, -0.5823306, -2.521311, 1, 0.1333333, 0, 1,
-2.136443, 0.6754792, -2.329157, 1, 0.1372549, 0, 1,
-2.078637, -0.4264597, -2.013541, 1, 0.145098, 0, 1,
-2.07714, -0.7090079, -2.399843, 1, 0.1490196, 0, 1,
-2.074529, -0.3226299, -3.273785, 1, 0.1568628, 0, 1,
-2.056259, -0.03194997, -0.5678391, 1, 0.1607843, 0, 1,
-2.055949, -0.08626515, -0.3040524, 1, 0.1686275, 0, 1,
-2.054095, 1.053088, -2.330305, 1, 0.172549, 0, 1,
-2.047018, -0.3327577, -0.8117725, 1, 0.1803922, 0, 1,
-2.02446, 1.249117, -1.668379, 1, 0.1843137, 0, 1,
-1.993885, 0.5842138, 1.602516, 1, 0.1921569, 0, 1,
-1.989501, 0.4648871, -2.878808, 1, 0.1960784, 0, 1,
-1.938043, 0.5779144, -0.640521, 1, 0.2039216, 0, 1,
-1.889423, 2.776633, 0.5863035, 1, 0.2117647, 0, 1,
-1.886005, 0.1626733, -1.357194, 1, 0.2156863, 0, 1,
-1.862644, 0.0465203, -2.042074, 1, 0.2235294, 0, 1,
-1.845081, 1.934421, -0.800678, 1, 0.227451, 0, 1,
-1.842265, -0.2445447, -1.668396, 1, 0.2352941, 0, 1,
-1.831879, -2.49567, -0.5334747, 1, 0.2392157, 0, 1,
-1.769263, 0.1719415, -1.891719, 1, 0.2470588, 0, 1,
-1.760584, -1.40592, -4.035343, 1, 0.2509804, 0, 1,
-1.746763, 0.5340311, -0.6982181, 1, 0.2588235, 0, 1,
-1.736233, 0.7648233, -0.5357547, 1, 0.2627451, 0, 1,
-1.709125, 0.9298514, -0.5199988, 1, 0.2705882, 0, 1,
-1.700973, -0.9324327, -0.8301135, 1, 0.2745098, 0, 1,
-1.69617, 0.2905612, -2.141789, 1, 0.282353, 0, 1,
-1.695146, -1.101734, -4.276187, 1, 0.2862745, 0, 1,
-1.694394, 0.3164301, -1.849638, 1, 0.2941177, 0, 1,
-1.68328, 1.497482, 0.4509049, 1, 0.3019608, 0, 1,
-1.67787, -0.03780217, -2.870426, 1, 0.3058824, 0, 1,
-1.677078, -1.298542, -0.7997006, 1, 0.3137255, 0, 1,
-1.659625, 0.5934746, -0.4648873, 1, 0.3176471, 0, 1,
-1.658379, 0.6910602, -2.110808, 1, 0.3254902, 0, 1,
-1.653268, 0.7237111, -0.548694, 1, 0.3294118, 0, 1,
-1.651566, 0.2852819, -0.6538919, 1, 0.3372549, 0, 1,
-1.641995, -0.9403262, -2.496176, 1, 0.3411765, 0, 1,
-1.629551, 0.9839194, -0.3256578, 1, 0.3490196, 0, 1,
-1.62576, 0.5933779, -1.094656, 1, 0.3529412, 0, 1,
-1.609857, 0.889604, 0.2345118, 1, 0.3607843, 0, 1,
-1.601437, 0.6361563, -1.857063, 1, 0.3647059, 0, 1,
-1.600971, -0.1830282, -0.3496339, 1, 0.372549, 0, 1,
-1.59757, -0.6098279, -1.647089, 1, 0.3764706, 0, 1,
-1.588796, -1.025759, -2.129782, 1, 0.3843137, 0, 1,
-1.573566, -1.915883, -2.354035, 1, 0.3882353, 0, 1,
-1.559937, -0.669457, -2.276825, 1, 0.3960784, 0, 1,
-1.555582, -0.2346206, -1.261574, 1, 0.4039216, 0, 1,
-1.544897, -1.126342, -2.694023, 1, 0.4078431, 0, 1,
-1.53677, 0.4253395, -0.488381, 1, 0.4156863, 0, 1,
-1.535197, 1.020208, -0.6353207, 1, 0.4196078, 0, 1,
-1.506496, 1.235359, -0.8628643, 1, 0.427451, 0, 1,
-1.466271, 1.460728, -1.525643, 1, 0.4313726, 0, 1,
-1.457099, -0.7040011, -0.6976895, 1, 0.4392157, 0, 1,
-1.453779, -1.198873, -1.856168, 1, 0.4431373, 0, 1,
-1.44854, -1.768358, -3.263068, 1, 0.4509804, 0, 1,
-1.442558, -0.2350381, -2.590759, 1, 0.454902, 0, 1,
-1.439142, 1.344268, -0.7218249, 1, 0.4627451, 0, 1,
-1.437977, 0.964848, -2.65373, 1, 0.4666667, 0, 1,
-1.435622, -1.140802, -1.240576, 1, 0.4745098, 0, 1,
-1.430813, -0.6776193, -3.682249, 1, 0.4784314, 0, 1,
-1.420974, -1.394695, -3.155954, 1, 0.4862745, 0, 1,
-1.414307, 1.926924, -1.233304, 1, 0.4901961, 0, 1,
-1.409703, -0.3068979, -2.478069, 1, 0.4980392, 0, 1,
-1.40751, -0.6097637, -1.144416, 1, 0.5058824, 0, 1,
-1.400645, -0.837899, -2.487114, 1, 0.509804, 0, 1,
-1.40032, 1.441523, 0.6132889, 1, 0.5176471, 0, 1,
-1.394189, 0.8008221, -1.496456, 1, 0.5215687, 0, 1,
-1.393882, 0.4973283, -2.384136, 1, 0.5294118, 0, 1,
-1.391937, -2.019757, -2.338907, 1, 0.5333334, 0, 1,
-1.379923, 1.89721, -1.58668, 1, 0.5411765, 0, 1,
-1.369944, 1.74028, -1.485234, 1, 0.5450981, 0, 1,
-1.361817, -0.9208457, -3.9188, 1, 0.5529412, 0, 1,
-1.342559, 1.065946, 0.6553797, 1, 0.5568628, 0, 1,
-1.339987, 0.8266849, -0.1882106, 1, 0.5647059, 0, 1,
-1.336486, -1.995793, -3.012419, 1, 0.5686275, 0, 1,
-1.327839, -0.2110103, -1.090849, 1, 0.5764706, 0, 1,
-1.327713, -1.506304, -1.140122, 1, 0.5803922, 0, 1,
-1.324059, -2.006767, -3.061988, 1, 0.5882353, 0, 1,
-1.282608, 2.206396, 0.8842335, 1, 0.5921569, 0, 1,
-1.272988, 0.05256787, 0.3850406, 1, 0.6, 0, 1,
-1.270799, -0.6180483, -1.365152, 1, 0.6078432, 0, 1,
-1.263159, -0.7048255, -1.482577, 1, 0.6117647, 0, 1,
-1.250016, 1.722228, -1.856227, 1, 0.6196079, 0, 1,
-1.243671, -0.02506576, -1.163126, 1, 0.6235294, 0, 1,
-1.236066, -1.289442, -2.577952, 1, 0.6313726, 0, 1,
-1.233056, 1.028993, -1.208092, 1, 0.6352941, 0, 1,
-1.230392, -1.13541, -1.025737, 1, 0.6431373, 0, 1,
-1.226158, -1.012605, -2.324201, 1, 0.6470588, 0, 1,
-1.224542, -0.8230605, -3.358474, 1, 0.654902, 0, 1,
-1.21809, -0.2462042, -1.017839, 1, 0.6588235, 0, 1,
-1.217058, -0.4962764, -2.99818, 1, 0.6666667, 0, 1,
-1.216569, -0.4395461, -2.210867, 1, 0.6705883, 0, 1,
-1.207178, -0.2411213, -3.448578, 1, 0.6784314, 0, 1,
-1.205922, 0.1504047, -1.759532, 1, 0.682353, 0, 1,
-1.200521, 0.1213794, -1.517775, 1, 0.6901961, 0, 1,
-1.191889, 1.336543, 0.4903407, 1, 0.6941177, 0, 1,
-1.191645, 0.6446207, -0.3850245, 1, 0.7019608, 0, 1,
-1.177348, -0.6165256, -2.461355, 1, 0.7098039, 0, 1,
-1.17664, -2.588605, -2.857614, 1, 0.7137255, 0, 1,
-1.164673, 0.9845595, -0.2690226, 1, 0.7215686, 0, 1,
-1.152562, 0.8267862, -2.114629, 1, 0.7254902, 0, 1,
-1.144117, -0.04496954, -1.726147, 1, 0.7333333, 0, 1,
-1.125857, -0.008836376, -0.2930058, 1, 0.7372549, 0, 1,
-1.11918, -0.2875618, -2.055487, 1, 0.7450981, 0, 1,
-1.119142, -0.3411243, 0.6339422, 1, 0.7490196, 0, 1,
-1.108275, -0.8263495, -1.654558, 1, 0.7568628, 0, 1,
-1.10793, 0.8050664, -1.079765, 1, 0.7607843, 0, 1,
-1.105895, 0.3488432, -0.9054462, 1, 0.7686275, 0, 1,
-1.104378, 0.770898, -2.048734, 1, 0.772549, 0, 1,
-1.103062, 0.3136472, -1.643888, 1, 0.7803922, 0, 1,
-1.098448, -0.4631384, -2.582029, 1, 0.7843137, 0, 1,
-1.095081, 0.005877142, -2.585551, 1, 0.7921569, 0, 1,
-1.0944, -0.9625943, -3.258539, 1, 0.7960784, 0, 1,
-1.087676, -0.9866946, -1.163813, 1, 0.8039216, 0, 1,
-1.085138, 0.800641, 0.5615946, 1, 0.8117647, 0, 1,
-1.080781, -0.98345, -3.38781, 1, 0.8156863, 0, 1,
-1.078927, -1.87055, -1.989503, 1, 0.8235294, 0, 1,
-1.070983, -0.1563098, -1.042111, 1, 0.827451, 0, 1,
-1.067137, 1.431711, -2.032558, 1, 0.8352941, 0, 1,
-1.066391, -1.350217, -2.159498, 1, 0.8392157, 0, 1,
-1.066293, -0.2835931, -2.590725, 1, 0.8470588, 0, 1,
-1.061046, 0.838227, -0.3002678, 1, 0.8509804, 0, 1,
-1.058785, -0.7123872, -2.113846, 1, 0.8588235, 0, 1,
-1.057599, -0.820807, 0.03555203, 1, 0.8627451, 0, 1,
-1.048813, 1.114864, -0.7058539, 1, 0.8705882, 0, 1,
-1.045705, 0.6028954, -0.2549369, 1, 0.8745098, 0, 1,
-1.031277, 1.034624, -0.87687, 1, 0.8823529, 0, 1,
-1.023188, -0.06220452, -1.670115, 1, 0.8862745, 0, 1,
-1.01633, -2.876803, -1.752721, 1, 0.8941177, 0, 1,
-1.011634, 1.958482, 0.07035235, 1, 0.8980392, 0, 1,
-1.011226, -0.9653148, -1.554133, 1, 0.9058824, 0, 1,
-1.000413, -2.146504, -1.951355, 1, 0.9137255, 0, 1,
-0.9992956, 1.375946, -0.1133352, 1, 0.9176471, 0, 1,
-0.9980949, 0.182026, -0.4763954, 1, 0.9254902, 0, 1,
-0.9979864, 0.4517673, 0.09419046, 1, 0.9294118, 0, 1,
-0.9974585, -0.2932508, -0.8128236, 1, 0.9372549, 0, 1,
-0.9942916, -0.7470154, -0.8116452, 1, 0.9411765, 0, 1,
-0.9931303, 0.1821054, -0.2373856, 1, 0.9490196, 0, 1,
-0.9877204, 0.4853594, -2.134508, 1, 0.9529412, 0, 1,
-0.984601, 0.005594353, -1.834681, 1, 0.9607843, 0, 1,
-0.9826837, -1.541484, -1.868081, 1, 0.9647059, 0, 1,
-0.981894, -1.043163, -3.401789, 1, 0.972549, 0, 1,
-0.9805191, 0.9845232, 0.305687, 1, 0.9764706, 0, 1,
-0.9800388, -0.08813481, -2.388307, 1, 0.9843137, 0, 1,
-0.9788769, 0.7881531, -1.788828, 1, 0.9882353, 0, 1,
-0.974709, -1.00826, -1.653768, 1, 0.9960784, 0, 1,
-0.9717661, -0.6116816, -1.128528, 0.9960784, 1, 0, 1,
-0.9704236, 0.185486, -2.250818, 0.9921569, 1, 0, 1,
-0.9683246, 0.7866279, -1.387472, 0.9843137, 1, 0, 1,
-0.9591279, 0.3646452, -0.452339, 0.9803922, 1, 0, 1,
-0.9562749, -0.2697498, -2.356926, 0.972549, 1, 0, 1,
-0.9539609, -1.002138, -2.035785, 0.9686275, 1, 0, 1,
-0.9534533, 0.3516239, -2.458111, 0.9607843, 1, 0, 1,
-0.9528361, -0.4515395, -1.290194, 0.9568627, 1, 0, 1,
-0.9502634, 0.8780606, -1.45986, 0.9490196, 1, 0, 1,
-0.9479306, -2.091207, -2.286512, 0.945098, 1, 0, 1,
-0.9446753, -0.3844393, -1.806103, 0.9372549, 1, 0, 1,
-0.9408446, -1.265878, -2.915139, 0.9333333, 1, 0, 1,
-0.9403941, 1.414788, -2.430836, 0.9254902, 1, 0, 1,
-0.9350798, -1.03733, -1.717096, 0.9215686, 1, 0, 1,
-0.9330248, -0.007985732, -1.477302, 0.9137255, 1, 0, 1,
-0.9325385, 0.9613476, -1.250738, 0.9098039, 1, 0, 1,
-0.9325242, 0.5957764, -0.7815653, 0.9019608, 1, 0, 1,
-0.9314151, -0.5580822, -1.613743, 0.8941177, 1, 0, 1,
-0.9304683, -0.1163132, -1.849882, 0.8901961, 1, 0, 1,
-0.9260306, 0.6307066, -1.491566, 0.8823529, 1, 0, 1,
-0.9233205, 0.5739305, 0.759831, 0.8784314, 1, 0, 1,
-0.922317, -0.6924167, -1.591398, 0.8705882, 1, 0, 1,
-0.9219337, 0.5841829, 0.4262534, 0.8666667, 1, 0, 1,
-0.9213693, 0.4407483, 0.1048132, 0.8588235, 1, 0, 1,
-0.9162741, -1.521294, -3.017718, 0.854902, 1, 0, 1,
-0.9119046, 1.549262, -2.014584, 0.8470588, 1, 0, 1,
-0.9058179, -0.631219, -2.810733, 0.8431373, 1, 0, 1,
-0.9057747, 1.055164, -1.076, 0.8352941, 1, 0, 1,
-0.9047337, 0.1186394, -0.593033, 0.8313726, 1, 0, 1,
-0.9036674, 0.1798837, -0.5853643, 0.8235294, 1, 0, 1,
-0.9020298, 0.6247836, -2.071054, 0.8196079, 1, 0, 1,
-0.8939552, -0.7611989, -3.409445, 0.8117647, 1, 0, 1,
-0.8903189, -1.386666, -1.42188, 0.8078431, 1, 0, 1,
-0.8898919, -0.5283753, -2.915386, 0.8, 1, 0, 1,
-0.8839389, 2.450226, -0.3985695, 0.7921569, 1, 0, 1,
-0.8692203, -0.4269353, -2.47695, 0.7882353, 1, 0, 1,
-0.8674992, -0.6403169, -4.134783, 0.7803922, 1, 0, 1,
-0.860944, 0.1836368, -2.317957, 0.7764706, 1, 0, 1,
-0.8594904, 1.346158, -1.165312, 0.7686275, 1, 0, 1,
-0.8594589, 0.2530451, -2.344289, 0.7647059, 1, 0, 1,
-0.8545296, 0.6555009, -0.9069286, 0.7568628, 1, 0, 1,
-0.8514243, 0.299809, -0.9027091, 0.7529412, 1, 0, 1,
-0.8474031, -0.8075608, -1.889593, 0.7450981, 1, 0, 1,
-0.8373744, 0.2570715, -1.461054, 0.7411765, 1, 0, 1,
-0.833452, 1.698218, 1.178521, 0.7333333, 1, 0, 1,
-0.8288425, 0.05682372, -1.575618, 0.7294118, 1, 0, 1,
-0.8281168, 0.7335086, -2.250787, 0.7215686, 1, 0, 1,
-0.8218169, -0.6209378, -2.664971, 0.7176471, 1, 0, 1,
-0.8211061, 0.05536791, -0.9645236, 0.7098039, 1, 0, 1,
-0.8120109, 0.3571153, -1.392233, 0.7058824, 1, 0, 1,
-0.809503, 0.6211191, -1.872954, 0.6980392, 1, 0, 1,
-0.8044733, -0.4857075, -0.9068684, 0.6901961, 1, 0, 1,
-0.8042939, 0.8669957, -1.417022, 0.6862745, 1, 0, 1,
-0.8037848, 0.5901, -1.52989, 0.6784314, 1, 0, 1,
-0.7993813, -0.6107861, -2.051237, 0.6745098, 1, 0, 1,
-0.7983185, 0.009053728, -1.293754, 0.6666667, 1, 0, 1,
-0.7942989, -2.084366, -2.3931, 0.6627451, 1, 0, 1,
-0.7921714, -1.082169, -3.031868, 0.654902, 1, 0, 1,
-0.7910265, -1.246291, -2.554817, 0.6509804, 1, 0, 1,
-0.7893391, -0.1300673, -0.8039421, 0.6431373, 1, 0, 1,
-0.7870943, 0.5179374, -0.4394405, 0.6392157, 1, 0, 1,
-0.7768086, -0.2197212, -2.55638, 0.6313726, 1, 0, 1,
-0.7744213, -1.556835, -2.022561, 0.627451, 1, 0, 1,
-0.7511172, -1.460377, -2.878646, 0.6196079, 1, 0, 1,
-0.7391955, 1.03175, 0.2497916, 0.6156863, 1, 0, 1,
-0.7389274, 1.984147, -0.5190628, 0.6078432, 1, 0, 1,
-0.7385619, -1.59157, -1.996007, 0.6039216, 1, 0, 1,
-0.7368153, -0.1676038, -0.8700637, 0.5960785, 1, 0, 1,
-0.7364683, 0.5130635, -0.9209459, 0.5882353, 1, 0, 1,
-0.7347102, 0.8654007, 0.1440781, 0.5843138, 1, 0, 1,
-0.7259493, -0.4589001, -4.541349, 0.5764706, 1, 0, 1,
-0.7249928, -0.1727504, -0.896462, 0.572549, 1, 0, 1,
-0.7193714, -0.8518007, -0.6428232, 0.5647059, 1, 0, 1,
-0.7188898, -0.4557769, -3.307012, 0.5607843, 1, 0, 1,
-0.7100704, -0.9558276, -1.788883, 0.5529412, 1, 0, 1,
-0.7057199, 0.3116775, -1.04094, 0.5490196, 1, 0, 1,
-0.7052634, 0.1785376, -0.5805483, 0.5411765, 1, 0, 1,
-0.697816, -0.5825943, -2.725373, 0.5372549, 1, 0, 1,
-0.6976122, 0.7537853, -0.1200427, 0.5294118, 1, 0, 1,
-0.6919461, 0.3095831, -1.554715, 0.5254902, 1, 0, 1,
-0.6900343, -0.1704422, -2.984318, 0.5176471, 1, 0, 1,
-0.6884986, 0.02892837, -1.854473, 0.5137255, 1, 0, 1,
-0.6870799, 0.5098764, -1.695009, 0.5058824, 1, 0, 1,
-0.6806991, 0.9365343, 0.4739448, 0.5019608, 1, 0, 1,
-0.6783435, -0.2618743, -1.224342, 0.4941176, 1, 0, 1,
-0.6753709, 0.2498097, -2.108784, 0.4862745, 1, 0, 1,
-0.6711836, -0.8987597, -2.988995, 0.4823529, 1, 0, 1,
-0.6674829, 0.9192468, -0.9387231, 0.4745098, 1, 0, 1,
-0.6667226, 1.08375, 0.6775362, 0.4705882, 1, 0, 1,
-0.656129, 1.043977, -0.4853265, 0.4627451, 1, 0, 1,
-0.6557223, -0.7364326, -2.24379, 0.4588235, 1, 0, 1,
-0.6534542, 0.8898208, -2.027594, 0.4509804, 1, 0, 1,
-0.6515231, 0.2442815, -1.531001, 0.4470588, 1, 0, 1,
-0.6362466, 0.008658078, -1.945145, 0.4392157, 1, 0, 1,
-0.6177528, 0.7878118, 1.627661, 0.4352941, 1, 0, 1,
-0.6177116, 0.6452061, 1.663618, 0.427451, 1, 0, 1,
-0.6139641, -0.4123544, -2.068014, 0.4235294, 1, 0, 1,
-0.6108974, 1.268333, -0.1339302, 0.4156863, 1, 0, 1,
-0.6096042, -0.590894, -1.811017, 0.4117647, 1, 0, 1,
-0.6050401, -0.3997636, -3.438814, 0.4039216, 1, 0, 1,
-0.6010169, 1.499146, -1.364974, 0.3960784, 1, 0, 1,
-0.5989829, 1.707713, -1.78154, 0.3921569, 1, 0, 1,
-0.5968905, 0.367518, 0.1679046, 0.3843137, 1, 0, 1,
-0.5961505, 0.2182488, -1.369194, 0.3803922, 1, 0, 1,
-0.5958028, -0.1322818, -1.83086, 0.372549, 1, 0, 1,
-0.5952464, 0.8964824, -1.195994, 0.3686275, 1, 0, 1,
-0.5948712, -1.233401, -3.508628, 0.3607843, 1, 0, 1,
-0.5930095, -0.1227464, -3.572805, 0.3568628, 1, 0, 1,
-0.5916541, -2.12535, -3.442235, 0.3490196, 1, 0, 1,
-0.5885243, 0.3753658, -1.513489, 0.345098, 1, 0, 1,
-0.5816303, -1.265213, -0.5678561, 0.3372549, 1, 0, 1,
-0.5798998, -1.258962, -3.981867, 0.3333333, 1, 0, 1,
-0.5740797, 0.4032228, 0.5418807, 0.3254902, 1, 0, 1,
-0.5722805, 0.1667062, -0.4102182, 0.3215686, 1, 0, 1,
-0.5708334, 0.6012095, -0.2406845, 0.3137255, 1, 0, 1,
-0.5639639, -2.313791, -1.636672, 0.3098039, 1, 0, 1,
-0.562598, -1.795643, -0.8401988, 0.3019608, 1, 0, 1,
-0.5492482, -0.0851978, -0.489244, 0.2941177, 1, 0, 1,
-0.5486551, -0.03903587, -1.293066, 0.2901961, 1, 0, 1,
-0.5468739, -1.083472, -1.966368, 0.282353, 1, 0, 1,
-0.5413483, -1.185802, -1.717218, 0.2784314, 1, 0, 1,
-0.5412825, 0.2976589, -1.174033, 0.2705882, 1, 0, 1,
-0.5398403, 0.3445776, 0.8038698, 0.2666667, 1, 0, 1,
-0.5312291, 0.4721684, -1.105871, 0.2588235, 1, 0, 1,
-0.530396, 0.01936117, -1.008171, 0.254902, 1, 0, 1,
-0.5265291, -0.3890601, -2.640356, 0.2470588, 1, 0, 1,
-0.5178037, 0.6709059, -1.051278, 0.2431373, 1, 0, 1,
-0.5158463, 0.8583609, 2.187195, 0.2352941, 1, 0, 1,
-0.5073071, 0.7538991, -0.04699821, 0.2313726, 1, 0, 1,
-0.5062121, 0.980013, -0.7062919, 0.2235294, 1, 0, 1,
-0.4999305, -1.256938, -0.5961782, 0.2196078, 1, 0, 1,
-0.4953248, -0.1146395, -3.453608, 0.2117647, 1, 0, 1,
-0.4915211, -1.011612, -3.348702, 0.2078431, 1, 0, 1,
-0.4909652, -0.3101922, -0.4453096, 0.2, 1, 0, 1,
-0.4907251, 1.251917, 1.178414, 0.1921569, 1, 0, 1,
-0.4880931, 0.3798507, -2.770247, 0.1882353, 1, 0, 1,
-0.4866053, -2.337476, -3.308719, 0.1803922, 1, 0, 1,
-0.4845111, -0.2578452, -1.778723, 0.1764706, 1, 0, 1,
-0.4844488, 0.2236513, -1.224796, 0.1686275, 1, 0, 1,
-0.4830347, 0.3935045, -0.5640011, 0.1647059, 1, 0, 1,
-0.4742722, 0.1910218, -2.707187, 0.1568628, 1, 0, 1,
-0.473471, -0.02912378, 2.225089, 0.1529412, 1, 0, 1,
-0.4715054, 0.188361, -1.310213, 0.145098, 1, 0, 1,
-0.4701796, 0.1522301, -2.128417, 0.1411765, 1, 0, 1,
-0.4630604, -0.1523044, -1.554859, 0.1333333, 1, 0, 1,
-0.4543022, -0.3048469, -2.906357, 0.1294118, 1, 0, 1,
-0.4536667, -0.4370377, -2.191755, 0.1215686, 1, 0, 1,
-0.4488573, 0.9791299, -1.448476, 0.1176471, 1, 0, 1,
-0.448071, -0.2804147, -3.924147, 0.1098039, 1, 0, 1,
-0.4457791, -1.652231, -4.162872, 0.1058824, 1, 0, 1,
-0.4357685, -0.7249266, -1.987854, 0.09803922, 1, 0, 1,
-0.4357482, -0.7709263, -2.857898, 0.09019608, 1, 0, 1,
-0.4339317, 0.8061661, 0.3451007, 0.08627451, 1, 0, 1,
-0.4331698, 0.7182376, -0.83922, 0.07843138, 1, 0, 1,
-0.4313873, -2.230124, -2.467281, 0.07450981, 1, 0, 1,
-0.4293599, 1.883767, 0.8694817, 0.06666667, 1, 0, 1,
-0.4283216, 1.571017, -1.92549, 0.0627451, 1, 0, 1,
-0.4280168, -1.228295, -2.543289, 0.05490196, 1, 0, 1,
-0.4265285, 0.3896267, 0.2331505, 0.05098039, 1, 0, 1,
-0.4258178, 1.067564, -0.4634122, 0.04313726, 1, 0, 1,
-0.4256408, -0.4725812, -2.212017, 0.03921569, 1, 0, 1,
-0.4249064, 0.5019191, -1.921798, 0.03137255, 1, 0, 1,
-0.422701, 0.4526457, -1.545487, 0.02745098, 1, 0, 1,
-0.4166916, 0.5869776, 0.07570225, 0.01960784, 1, 0, 1,
-0.4163254, -0.1453174, -2.07008, 0.01568628, 1, 0, 1,
-0.4134524, -1.359398, -1.918716, 0.007843138, 1, 0, 1,
-0.4114101, -0.05714225, -0.6277561, 0.003921569, 1, 0, 1,
-0.4076008, -0.7076105, -3.903618, 0, 1, 0.003921569, 1,
-0.4047561, -0.2429042, -1.291154, 0, 1, 0.01176471, 1,
-0.4040389, -0.09057561, -3.039184, 0, 1, 0.01568628, 1,
-0.4033121, -1.060369, -4.356695, 0, 1, 0.02352941, 1,
-0.4001459, -1.036888, -3.547743, 0, 1, 0.02745098, 1,
-0.3971447, -0.6023751, -2.405866, 0, 1, 0.03529412, 1,
-0.3920815, -1.212783, -3.45106, 0, 1, 0.03921569, 1,
-0.3896046, -1.536778, -3.922651, 0, 1, 0.04705882, 1,
-0.3866718, 0.8940246, -0.02014786, 0, 1, 0.05098039, 1,
-0.3854131, 2.319179, -2.398045, 0, 1, 0.05882353, 1,
-0.3838512, 0.9982551, 0.4915756, 0, 1, 0.0627451, 1,
-0.3799865, -0.4530552, -3.542511, 0, 1, 0.07058824, 1,
-0.37341, 0.6332638, 0.558961, 0, 1, 0.07450981, 1,
-0.3707563, 1.058462, -1.258181, 0, 1, 0.08235294, 1,
-0.3687006, 2.222824, -1.740139, 0, 1, 0.08627451, 1,
-0.3628782, 0.7512719, -0.879811, 0, 1, 0.09411765, 1,
-0.3615467, -1.389405, -2.258456, 0, 1, 0.1019608, 1,
-0.3580454, -0.4935257, -2.787101, 0, 1, 0.1058824, 1,
-0.3560612, 0.247492, -0.8418983, 0, 1, 0.1137255, 1,
-0.3514873, -2.148994, -3.950351, 0, 1, 0.1176471, 1,
-0.3496569, -1.244301, -2.326311, 0, 1, 0.1254902, 1,
-0.3469268, -1.063945, -3.449124, 0, 1, 0.1294118, 1,
-0.3468136, 0.6960353, -1.056215, 0, 1, 0.1372549, 1,
-0.3464947, -0.6443125, -2.732988, 0, 1, 0.1411765, 1,
-0.3424039, -1.378, -3.335992, 0, 1, 0.1490196, 1,
-0.3417265, 0.5876418, -1.938918, 0, 1, 0.1529412, 1,
-0.339984, 0.129217, -3.999077, 0, 1, 0.1607843, 1,
-0.3396589, 0.09276722, -0.779284, 0, 1, 0.1647059, 1,
-0.3367481, -0.2498988, -2.109016, 0, 1, 0.172549, 1,
-0.3322631, -0.4120005, -1.704396, 0, 1, 0.1764706, 1,
-0.3299627, 2.769925, -0.02126907, 0, 1, 0.1843137, 1,
-0.3280731, 1.113891, -0.06546512, 0, 1, 0.1882353, 1,
-0.3270928, 0.4500832, -1.879103, 0, 1, 0.1960784, 1,
-0.3258426, 0.3483061, 0.2564927, 0, 1, 0.2039216, 1,
-0.3255596, -0.4231458, -2.968565, 0, 1, 0.2078431, 1,
-0.3231589, 1.371253, 1.203556, 0, 1, 0.2156863, 1,
-0.3216633, 0.3926363, -0.6518557, 0, 1, 0.2196078, 1,
-0.3215151, 0.9245467, -1.936048, 0, 1, 0.227451, 1,
-0.3212627, 0.7057971, 0.2921624, 0, 1, 0.2313726, 1,
-0.3191521, 0.181743, -0.6729184, 0, 1, 0.2392157, 1,
-0.3132413, 0.788323, -0.570706, 0, 1, 0.2431373, 1,
-0.3099752, 0.5690196, -1.153786, 0, 1, 0.2509804, 1,
-0.3088117, 0.8574451, -2.127521, 0, 1, 0.254902, 1,
-0.3068552, -0.08768379, -1.769897, 0, 1, 0.2627451, 1,
-0.2967899, -0.4871078, -3.313995, 0, 1, 0.2666667, 1,
-0.2897367, 0.9490299, 1.235631, 0, 1, 0.2745098, 1,
-0.2870665, -0.5484913, -3.19819, 0, 1, 0.2784314, 1,
-0.2831027, -1.064858, -2.928533, 0, 1, 0.2862745, 1,
-0.282, 1.523335, -0.04985827, 0, 1, 0.2901961, 1,
-0.2804032, 0.9989051, -1.075807, 0, 1, 0.2980392, 1,
-0.2755718, -1.33873, -2.246723, 0, 1, 0.3058824, 1,
-0.2718383, 0.2729702, -2.485756, 0, 1, 0.3098039, 1,
-0.2709472, 0.2489397, 0.3850866, 0, 1, 0.3176471, 1,
-0.2709217, 0.1961409, -1.578385, 0, 1, 0.3215686, 1,
-0.2691947, 0.2207372, -1.199054, 0, 1, 0.3294118, 1,
-0.2600894, -0.660062, -3.043814, 0, 1, 0.3333333, 1,
-0.2565614, -0.2569445, -1.152906, 0, 1, 0.3411765, 1,
-0.253031, 1.189197, -1.517516, 0, 1, 0.345098, 1,
-0.2496011, 1.620831, 0.0006845821, 0, 1, 0.3529412, 1,
-0.2473715, 0.6721206, -2.43145, 0, 1, 0.3568628, 1,
-0.2431856, -0.3356823, -2.789309, 0, 1, 0.3647059, 1,
-0.2403274, 1.192678, -0.6159677, 0, 1, 0.3686275, 1,
-0.2378138, -0.02060486, -0.9499369, 0, 1, 0.3764706, 1,
-0.2324801, 0.02176002, -1.978619, 0, 1, 0.3803922, 1,
-0.2314929, -0.1879227, -3.136853, 0, 1, 0.3882353, 1,
-0.2303514, 0.1725546, 0.827859, 0, 1, 0.3921569, 1,
-0.2201216, -0.1447465, -1.017794, 0, 1, 0.4, 1,
-0.2177789, -0.1955364, -1.672964, 0, 1, 0.4078431, 1,
-0.2164605, 0.02856694, -3.161136, 0, 1, 0.4117647, 1,
-0.21596, -0.9802626, -2.379408, 0, 1, 0.4196078, 1,
-0.2116277, -1.372984, -5.153961, 0, 1, 0.4235294, 1,
-0.2083232, 0.6746842, 0.001860608, 0, 1, 0.4313726, 1,
-0.2021232, 0.3114992, 0.8119815, 0, 1, 0.4352941, 1,
-0.2016397, 0.08470339, -0.3505968, 0, 1, 0.4431373, 1,
-0.1992221, -0.7887531, -2.721597, 0, 1, 0.4470588, 1,
-0.194291, 2.454608, -1.101875, 0, 1, 0.454902, 1,
-0.1903443, 1.39601, 0.05750091, 0, 1, 0.4588235, 1,
-0.1891037, 0.393354, -0.2753685, 0, 1, 0.4666667, 1,
-0.1885913, 0.3806027, 0.9907985, 0, 1, 0.4705882, 1,
-0.1865401, -1.410431, -2.303797, 0, 1, 0.4784314, 1,
-0.185372, -0.1170261, -1.425864, 0, 1, 0.4823529, 1,
-0.1826185, 0.200773, -2.143233, 0, 1, 0.4901961, 1,
-0.1810589, -0.4084612, -2.942666, 0, 1, 0.4941176, 1,
-0.1777859, -0.5832487, -2.805069, 0, 1, 0.5019608, 1,
-0.1750224, -1.130803, -2.459852, 0, 1, 0.509804, 1,
-0.1737726, 0.6400508, -0.5369511, 0, 1, 0.5137255, 1,
-0.1699224, 0.8412147, -0.03498205, 0, 1, 0.5215687, 1,
-0.1639593, -0.3784372, -2.629204, 0, 1, 0.5254902, 1,
-0.1632035, -1.656911, -4.00669, 0, 1, 0.5333334, 1,
-0.1630141, -0.1623319, -2.411305, 0, 1, 0.5372549, 1,
-0.162525, 0.4417724, -0.2109411, 0, 1, 0.5450981, 1,
-0.1623741, -0.3002745, -3.098427, 0, 1, 0.5490196, 1,
-0.1622318, -0.9732361, -3.611788, 0, 1, 0.5568628, 1,
-0.1609707, -0.2041802, -2.452765, 0, 1, 0.5607843, 1,
-0.1543199, -1.915263, -3.330853, 0, 1, 0.5686275, 1,
-0.1479066, -0.07970767, -3.542736, 0, 1, 0.572549, 1,
-0.1470955, 0.7663894, -0.2836838, 0, 1, 0.5803922, 1,
-0.1467278, -0.4171787, -3.561249, 0, 1, 0.5843138, 1,
-0.1448278, 0.1939112, -1.603707, 0, 1, 0.5921569, 1,
-0.1403163, 2.212816, -0.8256325, 0, 1, 0.5960785, 1,
-0.1383555, 0.7304606, 0.2402103, 0, 1, 0.6039216, 1,
-0.1379266, -2.547633, -4.061237, 0, 1, 0.6117647, 1,
-0.1371238, 1.269453, 0.7239857, 0, 1, 0.6156863, 1,
-0.1321458, 0.2645026, -1.219753, 0, 1, 0.6235294, 1,
-0.1302563, -1.578605, -2.050856, 0, 1, 0.627451, 1,
-0.1301367, -1.857941, -1.975798, 0, 1, 0.6352941, 1,
-0.1255116, -0.8997765, -2.694098, 0, 1, 0.6392157, 1,
-0.1254508, 0.3058561, -0.7699031, 0, 1, 0.6470588, 1,
-0.1253983, 0.08560613, -2.377978, 0, 1, 0.6509804, 1,
-0.1220831, -0.4201472, -3.32516, 0, 1, 0.6588235, 1,
-0.1205093, -0.5501645, -3.580981, 0, 1, 0.6627451, 1,
-0.119125, 0.939378, 0.5988389, 0, 1, 0.6705883, 1,
-0.1185193, 1.109479, -1.231968, 0, 1, 0.6745098, 1,
-0.1109998, -0.4719456, -3.136961, 0, 1, 0.682353, 1,
-0.1086, -0.5669827, -4.33352, 0, 1, 0.6862745, 1,
-0.1079334, 1.471159, 1.172261, 0, 1, 0.6941177, 1,
-0.1078944, -0.5143482, -3.243959, 0, 1, 0.7019608, 1,
-0.1065168, 1.698627, -1.817536, 0, 1, 0.7058824, 1,
-0.1033197, 0.2883766, 1.929491, 0, 1, 0.7137255, 1,
-0.1025922, 1.739104, -0.9214023, 0, 1, 0.7176471, 1,
-0.09814807, -0.487209, -1.885389, 0, 1, 0.7254902, 1,
-0.09592766, -0.0311489, -2.619088, 0, 1, 0.7294118, 1,
-0.09566615, -0.2697265, -2.30791, 0, 1, 0.7372549, 1,
-0.09281954, 0.3849746, -0.9515927, 0, 1, 0.7411765, 1,
-0.08666512, 0.3920609, -1.022382, 0, 1, 0.7490196, 1,
-0.08660363, 1.555196, 0.3292174, 0, 1, 0.7529412, 1,
-0.08340272, -0.3223877, -1.87347, 0, 1, 0.7607843, 1,
-0.08195535, 0.02275608, -1.50554, 0, 1, 0.7647059, 1,
-0.08117817, -0.1072203, -3.442782, 0, 1, 0.772549, 1,
-0.08005843, -0.3107753, -2.851695, 0, 1, 0.7764706, 1,
-0.07801257, 0.8091442, 0.5339105, 0, 1, 0.7843137, 1,
-0.07572044, 1.001057, 1.293384, 0, 1, 0.7882353, 1,
-0.07142264, 0.6782393, 0.9286572, 0, 1, 0.7960784, 1,
-0.06869591, -0.4680903, -3.652719, 0, 1, 0.8039216, 1,
-0.06795123, 0.2023332, -0.2543699, 0, 1, 0.8078431, 1,
-0.06683648, -0.2108505, -0.8946536, 0, 1, 0.8156863, 1,
-0.06614238, 0.9997476, 0.9619197, 0, 1, 0.8196079, 1,
-0.06573525, -0.04689172, -2.18687, 0, 1, 0.827451, 1,
-0.061699, -0.5531994, -3.019001, 0, 1, 0.8313726, 1,
-0.06019397, 0.7622402, 0.480425, 0, 1, 0.8392157, 1,
-0.05384174, -0.5897533, -3.606772, 0, 1, 0.8431373, 1,
-0.04967803, 0.7415959, -0.1719303, 0, 1, 0.8509804, 1,
-0.04216221, 1.874807, -0.6311318, 0, 1, 0.854902, 1,
-0.03936752, 0.2283526, -1.56323, 0, 1, 0.8627451, 1,
-0.03834866, -0.08419456, -2.419873, 0, 1, 0.8666667, 1,
-0.03793935, 0.5540836, -0.2357501, 0, 1, 0.8745098, 1,
-0.03722913, 2.937957, -1.469514, 0, 1, 0.8784314, 1,
-0.03660401, 0.7573368, -0.01332065, 0, 1, 0.8862745, 1,
-0.02768863, -1.258004, -1.217184, 0, 1, 0.8901961, 1,
-0.02648883, 0.4580929, 0.9406589, 0, 1, 0.8980392, 1,
-0.02590436, -1.532266, -3.595125, 0, 1, 0.9058824, 1,
-0.02273061, -0.8485642, -4.31474, 0, 1, 0.9098039, 1,
-0.02045914, 0.5270929, -0.3942143, 0, 1, 0.9176471, 1,
-0.01881128, 0.2151296, -0.3779234, 0, 1, 0.9215686, 1,
-0.01599161, -0.4453632, -4.414585, 0, 1, 0.9294118, 1,
-0.01353071, 0.270754, -0.03552495, 0, 1, 0.9333333, 1,
-0.0133382, 0.4381953, 0.04364316, 0, 1, 0.9411765, 1,
-0.01226095, 0.5073812, 1.188328, 0, 1, 0.945098, 1,
-0.009657528, -0.04612736, -2.531006, 0, 1, 0.9529412, 1,
-0.008512862, 0.8086628, -0.2586545, 0, 1, 0.9568627, 1,
-0.003315255, 1.907314, 0.1549365, 0, 1, 0.9647059, 1,
-0.0008303419, 0.255966, -0.6664154, 0, 1, 0.9686275, 1,
-2.825263e-05, 1.365059, 1.423699, 0, 1, 0.9764706, 1,
0.001947297, -1.739918, 2.878254, 0, 1, 0.9803922, 1,
0.002313992, 1.207827, -0.3331651, 0, 1, 0.9882353, 1,
0.003490333, 1.996495, -0.2911379, 0, 1, 0.9921569, 1,
0.005125989, -0.6352842, 2.472805, 0, 1, 1, 1,
0.005250201, 0.6553906, -0.1759896, 0, 0.9921569, 1, 1,
0.006788472, 0.5632399, -1.011782, 0, 0.9882353, 1, 1,
0.008939519, 0.9144068, 0.4279112, 0, 0.9803922, 1, 1,
0.01570726, 0.01237156, 2.041054, 0, 0.9764706, 1, 1,
0.01638274, -1.186018, 3.213075, 0, 0.9686275, 1, 1,
0.01984789, 2.050512, -0.4170558, 0, 0.9647059, 1, 1,
0.02250982, 0.08550881, 0.1030362, 0, 0.9568627, 1, 1,
0.02270473, -0.0004916704, 2.042635, 0, 0.9529412, 1, 1,
0.0298044, 0.7735946, 1.813772, 0, 0.945098, 1, 1,
0.02984404, 1.163814, -0.3575875, 0, 0.9411765, 1, 1,
0.03044823, -0.7278863, 4.219328, 0, 0.9333333, 1, 1,
0.03155543, 0.9878384, -0.0370672, 0, 0.9294118, 1, 1,
0.03929299, -0.5601482, 2.404317, 0, 0.9215686, 1, 1,
0.04100383, 0.7838712, -1.00569, 0, 0.9176471, 1, 1,
0.0425447, 2.341917, -0.8631137, 0, 0.9098039, 1, 1,
0.04424054, 0.4536054, 0.09752653, 0, 0.9058824, 1, 1,
0.04489907, -1.750917, 3.307714, 0, 0.8980392, 1, 1,
0.0449511, 0.9492484, -0.6978966, 0, 0.8901961, 1, 1,
0.04799758, 1.752158, -0.2564974, 0, 0.8862745, 1, 1,
0.05063865, 0.04140611, 0.7098021, 0, 0.8784314, 1, 1,
0.05178563, -1.172744, 3.885559, 0, 0.8745098, 1, 1,
0.05811743, 0.5368366, 1.318599, 0, 0.8666667, 1, 1,
0.0585066, 0.7167222, 0.2928481, 0, 0.8627451, 1, 1,
0.05943182, 0.8273562, 0.5492826, 0, 0.854902, 1, 1,
0.06501242, 0.5103749, 0.8693236, 0, 0.8509804, 1, 1,
0.06554811, 0.8646687, -0.3687891, 0, 0.8431373, 1, 1,
0.06617762, -0.133334, 3.305084, 0, 0.8392157, 1, 1,
0.06643771, -0.905837, 4.185696, 0, 0.8313726, 1, 1,
0.06827268, 1.623776, 1.854469, 0, 0.827451, 1, 1,
0.07312846, -0.7707603, 4.027005, 0, 0.8196079, 1, 1,
0.07561158, -0.7079287, 3.052402, 0, 0.8156863, 1, 1,
0.07771651, 0.1124404, 0.1751702, 0, 0.8078431, 1, 1,
0.0811278, -1.396307, 3.009765, 0, 0.8039216, 1, 1,
0.08473934, -0.0956769, 1.837717, 0, 0.7960784, 1, 1,
0.08669612, -1.14965, 3.303004, 0, 0.7882353, 1, 1,
0.08778492, 0.2403781, -1.16387, 0, 0.7843137, 1, 1,
0.09388901, -1.155257, 3.373683, 0, 0.7764706, 1, 1,
0.09471712, 1.41937, 0.609731, 0, 0.772549, 1, 1,
0.1090232, -0.4613543, 0.3388999, 0, 0.7647059, 1, 1,
0.1102743, 0.4096637, -0.284622, 0, 0.7607843, 1, 1,
0.1143561, 1.004154, 0.8389763, 0, 0.7529412, 1, 1,
0.1163882, 0.5198901, 0.9202631, 0, 0.7490196, 1, 1,
0.1223471, -1.673258, 3.61195, 0, 0.7411765, 1, 1,
0.122863, 0.3267569, -0.4637949, 0, 0.7372549, 1, 1,
0.1237593, -0.6038433, 1.861241, 0, 0.7294118, 1, 1,
0.1273841, -1.393252, 1.398847, 0, 0.7254902, 1, 1,
0.127717, -1.2318, 4.712375, 0, 0.7176471, 1, 1,
0.129135, 0.7400084, -0.9217986, 0, 0.7137255, 1, 1,
0.1308028, 1.432266, 0.8486894, 0, 0.7058824, 1, 1,
0.1316411, -0.04905599, 2.700525, 0, 0.6980392, 1, 1,
0.13165, 1.393675, -0.245413, 0, 0.6941177, 1, 1,
0.1330486, -1.273409, 2.027182, 0, 0.6862745, 1, 1,
0.1368847, -1.227237, 3.899085, 0, 0.682353, 1, 1,
0.1373617, 1.714419, 1.995534, 0, 0.6745098, 1, 1,
0.1391996, 1.484823, -0.5839673, 0, 0.6705883, 1, 1,
0.1394226, 0.8608909, -0.18378, 0, 0.6627451, 1, 1,
0.1399262, -0.3325842, 3.177264, 0, 0.6588235, 1, 1,
0.1401533, -1.210741, 1.44678, 0, 0.6509804, 1, 1,
0.1417175, -0.5145102, 2.362123, 0, 0.6470588, 1, 1,
0.1515403, 1.581136, -1.840338, 0, 0.6392157, 1, 1,
0.1550316, -1.438903, 3.163473, 0, 0.6352941, 1, 1,
0.1554775, 0.1341413, 1.431708, 0, 0.627451, 1, 1,
0.1601348, -2.098861, 4.236252, 0, 0.6235294, 1, 1,
0.1610519, -1.609445, 2.303119, 0, 0.6156863, 1, 1,
0.1625764, -1.819872, 1.491595, 0, 0.6117647, 1, 1,
0.1729038, 1.929076, 1.561236, 0, 0.6039216, 1, 1,
0.1754841, -1.65061, 1.374014, 0, 0.5960785, 1, 1,
0.1799124, -1.91126, 4.327696, 0, 0.5921569, 1, 1,
0.1804524, 0.3765523, -0.7271355, 0, 0.5843138, 1, 1,
0.1828793, 0.9349524, 0.6299979, 0, 0.5803922, 1, 1,
0.1849878, 1.667783, -0.5842027, 0, 0.572549, 1, 1,
0.1875425, -0.8757871, 3.24366, 0, 0.5686275, 1, 1,
0.193321, -0.4322602, 3.229222, 0, 0.5607843, 1, 1,
0.1972252, -0.163017, 2.178958, 0, 0.5568628, 1, 1,
0.1998702, -0.0484313, -0.1176439, 0, 0.5490196, 1, 1,
0.1999608, 0.9551486, -1.2835, 0, 0.5450981, 1, 1,
0.2000255, 0.8938188, -0.1336285, 0, 0.5372549, 1, 1,
0.20359, 1.722785, -0.6580189, 0, 0.5333334, 1, 1,
0.2044192, -0.2777289, 2.078339, 0, 0.5254902, 1, 1,
0.204927, -0.8941848, 3.159285, 0, 0.5215687, 1, 1,
0.205986, 0.7815114, 1.946023, 0, 0.5137255, 1, 1,
0.2091609, 0.000776689, 2.311839, 0, 0.509804, 1, 1,
0.212926, 1.933519, 0.767132, 0, 0.5019608, 1, 1,
0.2157769, -1.952948, 1.391145, 0, 0.4941176, 1, 1,
0.2259029, 1.091292, -0.0004454685, 0, 0.4901961, 1, 1,
0.2322904, -0.5583447, 3.674059, 0, 0.4823529, 1, 1,
0.2338566, 0.8516724, 0.5390175, 0, 0.4784314, 1, 1,
0.2352747, 0.1327074, 0.5692777, 0, 0.4705882, 1, 1,
0.240514, 1.721753, 1.216951, 0, 0.4666667, 1, 1,
0.2419922, -0.5376898, 5.170431, 0, 0.4588235, 1, 1,
0.2448445, 1.241375, 1.352644, 0, 0.454902, 1, 1,
0.2482076, 1.232758, 0.8559434, 0, 0.4470588, 1, 1,
0.25296, -0.814561, 3.326074, 0, 0.4431373, 1, 1,
0.2532434, -0.3017847, 2.661706, 0, 0.4352941, 1, 1,
0.2575098, -0.858496, 3.957922, 0, 0.4313726, 1, 1,
0.2579362, 0.1676188, 0.4910502, 0, 0.4235294, 1, 1,
0.2605046, 1.960015, 0.3971755, 0, 0.4196078, 1, 1,
0.2607251, -0.5355536, 1.84122, 0, 0.4117647, 1, 1,
0.2609771, -1.154538, 1.353771, 0, 0.4078431, 1, 1,
0.2619462, 0.1154454, -0.130818, 0, 0.4, 1, 1,
0.2623056, -1.161226, 2.256777, 0, 0.3921569, 1, 1,
0.2627257, 0.7001793, 1.200524, 0, 0.3882353, 1, 1,
0.2637197, -0.3788016, 1.748361, 0, 0.3803922, 1, 1,
0.2646802, 0.8380699, 1.513182, 0, 0.3764706, 1, 1,
0.2646949, 1.805411, 0.8330917, 0, 0.3686275, 1, 1,
0.2660938, 0.3362899, 0.9115332, 0, 0.3647059, 1, 1,
0.274349, -0.4681192, 1.365556, 0, 0.3568628, 1, 1,
0.2748175, 0.1409427, -0.06320236, 0, 0.3529412, 1, 1,
0.2760115, -2.070805, 2.568668, 0, 0.345098, 1, 1,
0.2834736, -0.4157988, 3.32107, 0, 0.3411765, 1, 1,
0.2835614, -0.3231049, 1.712576, 0, 0.3333333, 1, 1,
0.285245, -0.6800374, 2.81018, 0, 0.3294118, 1, 1,
0.2857767, -0.3155263, 1.416403, 0, 0.3215686, 1, 1,
0.2858573, 2.490891, 1.152172, 0, 0.3176471, 1, 1,
0.2913216, 0.7729365, -0.3625374, 0, 0.3098039, 1, 1,
0.2981272, 0.1302371, 1.914793, 0, 0.3058824, 1, 1,
0.3034772, -0.1261677, 2.746982, 0, 0.2980392, 1, 1,
0.3046501, -2.550245, 3.516121, 0, 0.2901961, 1, 1,
0.3149909, -0.6601523, 2.470314, 0, 0.2862745, 1, 1,
0.3150902, -0.8885249, 3.282214, 0, 0.2784314, 1, 1,
0.3178737, 1.083932, 0.4335901, 0, 0.2745098, 1, 1,
0.3250564, 1.611095, -0.1675474, 0, 0.2666667, 1, 1,
0.3281692, -1.318194, 1.917079, 0, 0.2627451, 1, 1,
0.3306215, 0.07878686, 1.609881, 0, 0.254902, 1, 1,
0.3329197, -0.693477, 2.70951, 0, 0.2509804, 1, 1,
0.3410584, 0.8335794, 0.6221911, 0, 0.2431373, 1, 1,
0.3425897, 0.2646969, -0.09861541, 0, 0.2392157, 1, 1,
0.3431186, -0.9332818, 3.266922, 0, 0.2313726, 1, 1,
0.3481325, 1.195841, -1.402457, 0, 0.227451, 1, 1,
0.3493297, -0.8643858, 2.750805, 0, 0.2196078, 1, 1,
0.353934, 1.391273, 1.568387, 0, 0.2156863, 1, 1,
0.3546323, 0.2357913, -0.1407906, 0, 0.2078431, 1, 1,
0.3615209, -0.1047296, 3.210357, 0, 0.2039216, 1, 1,
0.3621414, -0.1364156, 1.336826, 0, 0.1960784, 1, 1,
0.3642129, 1.359719, 0.6924503, 0, 0.1882353, 1, 1,
0.365064, 1.650924, 0.4078308, 0, 0.1843137, 1, 1,
0.3696467, -0.1979592, 3.46993, 0, 0.1764706, 1, 1,
0.3699206, -0.3856897, 0.05264689, 0, 0.172549, 1, 1,
0.3706886, 0.8366459, 0.7502056, 0, 0.1647059, 1, 1,
0.3737408, -1.223791, 3.548633, 0, 0.1607843, 1, 1,
0.3783213, 0.4883586, -0.887287, 0, 0.1529412, 1, 1,
0.3789079, -0.9135579, 0.9345619, 0, 0.1490196, 1, 1,
0.3813581, 0.9178063, 0.2054571, 0, 0.1411765, 1, 1,
0.3821653, 1.796933, 1.553829, 0, 0.1372549, 1, 1,
0.3843332, 0.9925334, -0.004799406, 0, 0.1294118, 1, 1,
0.3844362, 1.544205, 0.3640566, 0, 0.1254902, 1, 1,
0.3916728, -0.002423831, 1.810744, 0, 0.1176471, 1, 1,
0.3975271, 1.883489, -1.52439, 0, 0.1137255, 1, 1,
0.3981075, -0.1149693, -0.6141564, 0, 0.1058824, 1, 1,
0.3995745, -0.9601881, 1.91116, 0, 0.09803922, 1, 1,
0.4043197, 1.139644, 0.2643702, 0, 0.09411765, 1, 1,
0.4109686, 0.09134465, 2.527388, 0, 0.08627451, 1, 1,
0.4129875, -1.07558, 3.203989, 0, 0.08235294, 1, 1,
0.4149545, 1.070659, 0.4527444, 0, 0.07450981, 1, 1,
0.4179851, -0.5396905, 4.390622, 0, 0.07058824, 1, 1,
0.4184659, 0.473078, 0.7926536, 0, 0.0627451, 1, 1,
0.4228638, 1.061853, -0.6585604, 0, 0.05882353, 1, 1,
0.423337, 0.2272007, 1.155882, 0, 0.05098039, 1, 1,
0.4298732, -0.5991224, 2.153898, 0, 0.04705882, 1, 1,
0.4323677, -0.752894, 3.298296, 0, 0.03921569, 1, 1,
0.4329485, -0.1435015, 2.756727, 0, 0.03529412, 1, 1,
0.4336149, 1.946406, 0.5149324, 0, 0.02745098, 1, 1,
0.43415, -0.5299097, 2.233551, 0, 0.02352941, 1, 1,
0.4366776, -0.7521138, 4.017844, 0, 0.01568628, 1, 1,
0.4424515, -0.4576879, 3.645874, 0, 0.01176471, 1, 1,
0.4465864, 0.7707219, 0.6109444, 0, 0.003921569, 1, 1,
0.4466591, -1.782913, 5.193247, 0.003921569, 0, 1, 1,
0.4484649, -1.445735, 2.405546, 0.007843138, 0, 1, 1,
0.4508257, 0.3845273, 0.1693287, 0.01568628, 0, 1, 1,
0.4524729, -0.9714837, 2.744457, 0.01960784, 0, 1, 1,
0.4534734, -0.38008, 1.486714, 0.02745098, 0, 1, 1,
0.4541594, 0.802591, -1.591586, 0.03137255, 0, 1, 1,
0.463311, 0.2532856, 1.061648, 0.03921569, 0, 1, 1,
0.4649731, -0.3110155, 2.318053, 0.04313726, 0, 1, 1,
0.4672124, -0.2233745, 1.627881, 0.05098039, 0, 1, 1,
0.4702161, 0.214844, 1.215285, 0.05490196, 0, 1, 1,
0.4732654, 0.4178836, 0.2636025, 0.0627451, 0, 1, 1,
0.4751853, 0.6425543, 1.591541, 0.06666667, 0, 1, 1,
0.4763944, -1.131802, 2.017143, 0.07450981, 0, 1, 1,
0.4840301, -1.742185, 3.457417, 0.07843138, 0, 1, 1,
0.488222, 1.140424, -1.198218, 0.08627451, 0, 1, 1,
0.4988625, 2.25352, 0.3169546, 0.09019608, 0, 1, 1,
0.4993873, 0.6764237, 0.8806623, 0.09803922, 0, 1, 1,
0.5043685, -1.547706, 4.105681, 0.1058824, 0, 1, 1,
0.5168821, -0.2411815, 1.826803, 0.1098039, 0, 1, 1,
0.5207499, -0.5224831, 2.805744, 0.1176471, 0, 1, 1,
0.5311091, -0.7858171, 2.480241, 0.1215686, 0, 1, 1,
0.5336024, 0.5826768, 1.295751, 0.1294118, 0, 1, 1,
0.5352412, -1.814049, 2.181199, 0.1333333, 0, 1, 1,
0.5369658, -1.226319, 3.386012, 0.1411765, 0, 1, 1,
0.5398039, 0.7479653, 1.508089, 0.145098, 0, 1, 1,
0.5398098, -1.844594, 2.155294, 0.1529412, 0, 1, 1,
0.5414088, 0.6046923, 1.387904, 0.1568628, 0, 1, 1,
0.5425906, 0.5686774, 2.709865, 0.1647059, 0, 1, 1,
0.5465176, 1.412193, 0.9012607, 0.1686275, 0, 1, 1,
0.5476343, -0.07668804, 2.249321, 0.1764706, 0, 1, 1,
0.5517359, -1.196461, 1.009926, 0.1803922, 0, 1, 1,
0.5575162, 0.7991716, -0.6954405, 0.1882353, 0, 1, 1,
0.5593676, 0.3838171, 2.01565, 0.1921569, 0, 1, 1,
0.5597412, 1.760974, -0.5849803, 0.2, 0, 1, 1,
0.5608276, -0.7630536, 2.321733, 0.2078431, 0, 1, 1,
0.5649527, 2.000902, -0.0006291841, 0.2117647, 0, 1, 1,
0.5656813, -0.6833234, 0.6088251, 0.2196078, 0, 1, 1,
0.5667109, -0.8463259, 2.377706, 0.2235294, 0, 1, 1,
0.5686285, 0.1870033, 3.400287, 0.2313726, 0, 1, 1,
0.5772172, -1.089968, 3.987751, 0.2352941, 0, 1, 1,
0.58302, 0.4526512, 1.23774, 0.2431373, 0, 1, 1,
0.5888891, 0.6988124, 1.104382, 0.2470588, 0, 1, 1,
0.5902292, 0.2530251, 0.3725494, 0.254902, 0, 1, 1,
0.594371, 1.185257, 2.488386, 0.2588235, 0, 1, 1,
0.5952831, 0.7465473, -1.419669, 0.2666667, 0, 1, 1,
0.6013639, -0.8255726, 3.652027, 0.2705882, 0, 1, 1,
0.6016247, -1.155387, 2.199857, 0.2784314, 0, 1, 1,
0.6017825, -0.2066028, 4.040755, 0.282353, 0, 1, 1,
0.6027671, 1.205386, 0.2555002, 0.2901961, 0, 1, 1,
0.6074101, 0.1286659, 0.3573194, 0.2941177, 0, 1, 1,
0.6090366, 0.154254, 1.798791, 0.3019608, 0, 1, 1,
0.6124505, 0.9433957, 0.008162417, 0.3098039, 0, 1, 1,
0.6134311, 0.6677422, -0.8426645, 0.3137255, 0, 1, 1,
0.6142952, -0.8467197, 3.315773, 0.3215686, 0, 1, 1,
0.617135, -0.5998154, 1.656848, 0.3254902, 0, 1, 1,
0.6172003, 0.3768733, 0.4415704, 0.3333333, 0, 1, 1,
0.624114, -0.3472233, 2.137104, 0.3372549, 0, 1, 1,
0.6309174, 0.1675384, 1.534272, 0.345098, 0, 1, 1,
0.6362213, 2.505919, -0.003401241, 0.3490196, 0, 1, 1,
0.6368564, 0.09385075, 2.084656, 0.3568628, 0, 1, 1,
0.6414034, 2.547704, 1.758301, 0.3607843, 0, 1, 1,
0.6471004, 1.017129, 0.9693014, 0.3686275, 0, 1, 1,
0.6501305, 0.2143877, 1.464651, 0.372549, 0, 1, 1,
0.6534067, -0.1482383, 4.021679, 0.3803922, 0, 1, 1,
0.6565428, -0.1502413, 2.611094, 0.3843137, 0, 1, 1,
0.6569307, -0.8460299, 3.766091, 0.3921569, 0, 1, 1,
0.664123, -0.354603, 2.445905, 0.3960784, 0, 1, 1,
0.6743206, -1.099503, 4.82812, 0.4039216, 0, 1, 1,
0.6787974, -0.5524657, 1.737809, 0.4117647, 0, 1, 1,
0.680186, 1.587557, 1.418098, 0.4156863, 0, 1, 1,
0.6869547, -1.612355, 1.493046, 0.4235294, 0, 1, 1,
0.688088, 0.2583552, 0.2317998, 0.427451, 0, 1, 1,
0.6905575, 0.3783996, 0.7517048, 0.4352941, 0, 1, 1,
0.6913932, 0.693127, 0.9757552, 0.4392157, 0, 1, 1,
0.6924286, 2.397732, -1.081898, 0.4470588, 0, 1, 1,
0.6973117, 0.3664797, 1.739126, 0.4509804, 0, 1, 1,
0.6983669, -1.286114, 2.875703, 0.4588235, 0, 1, 1,
0.6990942, -0.8337905, 2.37036, 0.4627451, 0, 1, 1,
0.7005756, -0.3399641, 0.8957165, 0.4705882, 0, 1, 1,
0.7042167, -0.246563, 1.680774, 0.4745098, 0, 1, 1,
0.704246, -1.192021, 1.749799, 0.4823529, 0, 1, 1,
0.7044492, -0.04073447, 0.7528762, 0.4862745, 0, 1, 1,
0.7069076, 1.158983, 1.463214, 0.4941176, 0, 1, 1,
0.7074714, 0.09260407, -0.593739, 0.5019608, 0, 1, 1,
0.7084411, -0.6574752, 3.493178, 0.5058824, 0, 1, 1,
0.712763, -0.545814, 2.474469, 0.5137255, 0, 1, 1,
0.7167853, -0.3287116, 1.033714, 0.5176471, 0, 1, 1,
0.7174533, 0.3264287, 3.166245, 0.5254902, 0, 1, 1,
0.7336445, 0.9979042, 0.03670301, 0.5294118, 0, 1, 1,
0.7359819, -0.789781, 2.084062, 0.5372549, 0, 1, 1,
0.7360141, -1.619126, 1.986758, 0.5411765, 0, 1, 1,
0.7375322, -0.2780667, 1.354319, 0.5490196, 0, 1, 1,
0.7380099, -0.4133906, 2.597665, 0.5529412, 0, 1, 1,
0.7522931, -0.6444759, 1.530979, 0.5607843, 0, 1, 1,
0.7578245, 0.8559201, 1.575331, 0.5647059, 0, 1, 1,
0.7588446, 1.381948, -0.4947431, 0.572549, 0, 1, 1,
0.7611078, -0.7233673, 3.286187, 0.5764706, 0, 1, 1,
0.7642564, -0.8730037, 2.996598, 0.5843138, 0, 1, 1,
0.765309, 0.5970824, 1.400428, 0.5882353, 0, 1, 1,
0.7662307, -1.76637, 3.401667, 0.5960785, 0, 1, 1,
0.7719411, 0.0105078, 1.562478, 0.6039216, 0, 1, 1,
0.7719532, -0.4313188, 1.511532, 0.6078432, 0, 1, 1,
0.7749278, 1.503152, 2.256062, 0.6156863, 0, 1, 1,
0.7798329, -1.391366, 1.680925, 0.6196079, 0, 1, 1,
0.7801744, -0.5276017, 1.788371, 0.627451, 0, 1, 1,
0.7822911, 0.5069309, 1.425418, 0.6313726, 0, 1, 1,
0.7823147, 0.08505423, 1.355767, 0.6392157, 0, 1, 1,
0.7889524, -0.9169372, 3.783159, 0.6431373, 0, 1, 1,
0.7918801, 1.231842, -0.2763611, 0.6509804, 0, 1, 1,
0.7919888, 0.3524244, 1.092011, 0.654902, 0, 1, 1,
0.7946303, 1.316387, 1.944827, 0.6627451, 0, 1, 1,
0.8005477, 0.5398515, 1.13293, 0.6666667, 0, 1, 1,
0.8045864, -0.7290766, 2.740248, 0.6745098, 0, 1, 1,
0.8071288, 0.3620527, -1.139763, 0.6784314, 0, 1, 1,
0.8091029, 0.3192556, 2.074552, 0.6862745, 0, 1, 1,
0.8091554, -0.5886918, 2.487611, 0.6901961, 0, 1, 1,
0.8103529, -2.52089, 3.295415, 0.6980392, 0, 1, 1,
0.8118989, 1.104962, -0.5045351, 0.7058824, 0, 1, 1,
0.8150346, 0.440464, 0.776704, 0.7098039, 0, 1, 1,
0.8162474, -2.471505, 0.6092107, 0.7176471, 0, 1, 1,
0.8177779, -2.017492, 1.746575, 0.7215686, 0, 1, 1,
0.8177819, -1.024434, 2.767062, 0.7294118, 0, 1, 1,
0.8215849, 0.1871339, 1.955583, 0.7333333, 0, 1, 1,
0.8263915, -0.06831447, 0.2887031, 0.7411765, 0, 1, 1,
0.8281482, 0.5273536, 1.616508, 0.7450981, 0, 1, 1,
0.8285328, -0.4618618, 1.30126, 0.7529412, 0, 1, 1,
0.8294847, -0.4938089, 1.529543, 0.7568628, 0, 1, 1,
0.830825, 0.3397394, 1.76588, 0.7647059, 0, 1, 1,
0.8344499, -0.1415717, 1.790305, 0.7686275, 0, 1, 1,
0.8348101, -0.5915422, 2.109318, 0.7764706, 0, 1, 1,
0.835821, -0.2032221, 2.113594, 0.7803922, 0, 1, 1,
0.8403102, 0.2445969, 1.632613, 0.7882353, 0, 1, 1,
0.8425116, -0.1258927, 2.735971, 0.7921569, 0, 1, 1,
0.8499475, -1.143669, 2.749688, 0.8, 0, 1, 1,
0.8499866, -0.1830157, 2.407929, 0.8078431, 0, 1, 1,
0.8530709, 0.2248654, 1.363668, 0.8117647, 0, 1, 1,
0.860575, 0.07546052, 2.681248, 0.8196079, 0, 1, 1,
0.8623248, 1.160026, 0.1391921, 0.8235294, 0, 1, 1,
0.8661187, 0.3895502, 0.6391158, 0.8313726, 0, 1, 1,
0.8692752, 0.274736, 2.708212, 0.8352941, 0, 1, 1,
0.8698444, 0.708289, -1.74912, 0.8431373, 0, 1, 1,
0.8732, -0.01648699, 1.447048, 0.8470588, 0, 1, 1,
0.873639, 0.01890303, 1.10227, 0.854902, 0, 1, 1,
0.8738174, -0.6381739, 2.169135, 0.8588235, 0, 1, 1,
0.8876202, -0.06202884, 2.298085, 0.8666667, 0, 1, 1,
0.8902268, -0.8816304, 1.979354, 0.8705882, 0, 1, 1,
0.8911213, 1.568295, -0.3791834, 0.8784314, 0, 1, 1,
0.8966639, 0.6971826, 0.738853, 0.8823529, 0, 1, 1,
0.9007149, -2.389303, 3.280821, 0.8901961, 0, 1, 1,
0.9036651, -0.3543901, 2.834439, 0.8941177, 0, 1, 1,
0.9119491, 1.083496, 1.801974, 0.9019608, 0, 1, 1,
0.9205782, -0.4421071, 2.432153, 0.9098039, 0, 1, 1,
0.9234829, 0.7327413, 0.033489, 0.9137255, 0, 1, 1,
0.9240535, 0.5899698, 0.113801, 0.9215686, 0, 1, 1,
0.9243129, 0.4414277, 0.873453, 0.9254902, 0, 1, 1,
0.9261498, 0.8884719, 0.9529611, 0.9333333, 0, 1, 1,
0.9282647, -0.9509624, 2.293402, 0.9372549, 0, 1, 1,
0.9390883, -0.7988291, 1.114862, 0.945098, 0, 1, 1,
0.941727, 1.54428, 1.322389, 0.9490196, 0, 1, 1,
0.9438121, -0.6944258, 2.491778, 0.9568627, 0, 1, 1,
0.9475839, -0.2540039, 2.075641, 0.9607843, 0, 1, 1,
0.9524017, 1.434517, 2.04982, 0.9686275, 0, 1, 1,
0.9691576, 1.203714, 1.786426, 0.972549, 0, 1, 1,
0.9695634, -0.3161916, 3.755895, 0.9803922, 0, 1, 1,
0.9794643, -1.651318, 1.632609, 0.9843137, 0, 1, 1,
0.9801124, -0.03546012, 2.312269, 0.9921569, 0, 1, 1,
0.9861308, 2.634163, -0.01320675, 0.9960784, 0, 1, 1,
0.9872584, 0.317436, 0.8009078, 1, 0, 0.9960784, 1,
0.9960186, -0.2670484, 1.993737, 1, 0, 0.9882353, 1,
0.9970995, -0.1089823, 0.4058715, 1, 0, 0.9843137, 1,
0.9988756, -0.5841056, 2.174988, 1, 0, 0.9764706, 1,
0.9990557, -0.9904256, 3.49067, 1, 0, 0.972549, 1,
1.002412, 2.206047, 0.5953921, 1, 0, 0.9647059, 1,
1.004811, 0.8409741, 1.991668, 1, 0, 0.9607843, 1,
1.013079, 0.6794865, 0.7149023, 1, 0, 0.9529412, 1,
1.014861, 0.6538274, 0.9894843, 1, 0, 0.9490196, 1,
1.020415, -0.1686325, 2.865551, 1, 0, 0.9411765, 1,
1.025566, 0.2624185, 1.193518, 1, 0, 0.9372549, 1,
1.027926, 0.3869934, 0.5218815, 1, 0, 0.9294118, 1,
1.029022, -0.9798905, 2.653687, 1, 0, 0.9254902, 1,
1.03025, 1.085845, 0.2815162, 1, 0, 0.9176471, 1,
1.037429, 0.1812849, 3.59943, 1, 0, 0.9137255, 1,
1.037783, -1.120938, 1.510709, 1, 0, 0.9058824, 1,
1.041844, -1.447977, 2.625054, 1, 0, 0.9019608, 1,
1.04219, 0.478622, 1.19662, 1, 0, 0.8941177, 1,
1.044357, 0.9337453, 0.3813198, 1, 0, 0.8862745, 1,
1.048359, -0.6122879, 2.68627, 1, 0, 0.8823529, 1,
1.049166, 0.8250811, 1.987875, 1, 0, 0.8745098, 1,
1.063136, -0.3732418, 1.034959, 1, 0, 0.8705882, 1,
1.068666, -0.8034452, 0.9860988, 1, 0, 0.8627451, 1,
1.068942, 0.5214416, 1.594512, 1, 0, 0.8588235, 1,
1.075106, -0.1608554, 1.588821, 1, 0, 0.8509804, 1,
1.079116, 2.670536, 1.833498, 1, 0, 0.8470588, 1,
1.08359, 1.428661, -0.3927428, 1, 0, 0.8392157, 1,
1.09651, 0.295012, -0.00404532, 1, 0, 0.8352941, 1,
1.098359, -0.4645597, 3.145838, 1, 0, 0.827451, 1,
1.098764, 0.1021437, 0.7193007, 1, 0, 0.8235294, 1,
1.09963, 1.212464, -0.1127162, 1, 0, 0.8156863, 1,
1.105908, -0.1545313, 2.477485, 1, 0, 0.8117647, 1,
1.108117, -1.37231, 1.836505, 1, 0, 0.8039216, 1,
1.108195, 0.01903559, 2.10664, 1, 0, 0.7960784, 1,
1.109434, -0.745944, 2.500103, 1, 0, 0.7921569, 1,
1.119281, 0.465262, -1.007857, 1, 0, 0.7843137, 1,
1.1193, -0.3449546, 0.2751063, 1, 0, 0.7803922, 1,
1.123558, 0.2205962, 1.494601, 1, 0, 0.772549, 1,
1.124593, -2.361062, 3.615929, 1, 0, 0.7686275, 1,
1.132619, 0.9326687, 0.809583, 1, 0, 0.7607843, 1,
1.133905, -0.6437919, 3.20893, 1, 0, 0.7568628, 1,
1.137298, -0.6245204, 2.348004, 1, 0, 0.7490196, 1,
1.139427, -1.047857, 2.455969, 1, 0, 0.7450981, 1,
1.140161, -1.2747, 2.611898, 1, 0, 0.7372549, 1,
1.144444, -0.4672745, 3.634267, 1, 0, 0.7333333, 1,
1.144647, -0.5963109, 2.54547, 1, 0, 0.7254902, 1,
1.145349, 2.656055, -0.1341618, 1, 0, 0.7215686, 1,
1.152542, 1.332147, -0.5324557, 1, 0, 0.7137255, 1,
1.156797, 1.451275, 0.2183717, 1, 0, 0.7098039, 1,
1.159523, -0.3974314, 3.889739, 1, 0, 0.7019608, 1,
1.16082, -0.1287419, 1.606192, 1, 0, 0.6941177, 1,
1.161273, 0.5470146, 1.934128, 1, 0, 0.6901961, 1,
1.165797, -1.230492, 2.901877, 1, 0, 0.682353, 1,
1.169456, 0.736189, 1.126204, 1, 0, 0.6784314, 1,
1.17973, 0.9960361, 2.040185, 1, 0, 0.6705883, 1,
1.180951, -0.4319924, 0.9090515, 1, 0, 0.6666667, 1,
1.183742, 0.6510051, 1.31475, 1, 0, 0.6588235, 1,
1.197247, -1.491871, 3.452866, 1, 0, 0.654902, 1,
1.197728, 1.996022, 2.215871, 1, 0, 0.6470588, 1,
1.207367, 0.1194865, 0.6234218, 1, 0, 0.6431373, 1,
1.216632, 0.8719758, 0.4547051, 1, 0, 0.6352941, 1,
1.226001, 1.067454, 0.8430441, 1, 0, 0.6313726, 1,
1.226766, -0.6957394, 3.617803, 1, 0, 0.6235294, 1,
1.246411, 0.712019, 2.140992, 1, 0, 0.6196079, 1,
1.249754, 0.2273743, 1.643299, 1, 0, 0.6117647, 1,
1.250349, 0.642876, 1.243914, 1, 0, 0.6078432, 1,
1.253163, -0.2660836, 1.812593, 1, 0, 0.6, 1,
1.255178, -0.05733736, 0.8578917, 1, 0, 0.5921569, 1,
1.259679, -1.036403, 3.216202, 1, 0, 0.5882353, 1,
1.261945, -1.114989, 1.259156, 1, 0, 0.5803922, 1,
1.263067, -0.1219064, 1.34872, 1, 0, 0.5764706, 1,
1.27099, -0.4627195, 0.8058311, 1, 0, 0.5686275, 1,
1.278032, -0.2842106, 1.911052, 1, 0, 0.5647059, 1,
1.278491, 0.7584485, 2.256012, 1, 0, 0.5568628, 1,
1.281879, -1.297652, 3.583159, 1, 0, 0.5529412, 1,
1.289064, -0.5170873, 2.780324, 1, 0, 0.5450981, 1,
1.2967, -0.8911629, 3.798358, 1, 0, 0.5411765, 1,
1.30052, 0.1201093, -0.9228472, 1, 0, 0.5333334, 1,
1.306347, 1.51651, 1.853878, 1, 0, 0.5294118, 1,
1.310922, -0.02780957, 2.697324, 1, 0, 0.5215687, 1,
1.316762, -0.6555609, 2.45184, 1, 0, 0.5176471, 1,
1.321205, 0.6985465, 0.7767355, 1, 0, 0.509804, 1,
1.324086, -0.4447314, 3.237446, 1, 0, 0.5058824, 1,
1.332412, 1.623384, 1.654722, 1, 0, 0.4980392, 1,
1.347739, 0.1463316, -0.6042834, 1, 0, 0.4901961, 1,
1.349657, 0.08179651, 1.39689, 1, 0, 0.4862745, 1,
1.355093, 1.004136, 0.4128745, 1, 0, 0.4784314, 1,
1.357551, 0.02600177, -0.7679131, 1, 0, 0.4745098, 1,
1.359467, 0.7121056, 2.337592, 1, 0, 0.4666667, 1,
1.372723, -0.5028348, 2.945061, 1, 0, 0.4627451, 1,
1.384165, 1.529012, -0.5749726, 1, 0, 0.454902, 1,
1.390385, -1.622722, 4.026852, 1, 0, 0.4509804, 1,
1.392391, -0.6319796, 0.342395, 1, 0, 0.4431373, 1,
1.395867, 0.8928879, 1.457398, 1, 0, 0.4392157, 1,
1.401903, 1.515401, 0.9143822, 1, 0, 0.4313726, 1,
1.402938, 1.599297, 1.358222, 1, 0, 0.427451, 1,
1.403606, -0.2626747, 1.10707, 1, 0, 0.4196078, 1,
1.405491, 0.4707982, 0.7873275, 1, 0, 0.4156863, 1,
1.410975, 1.0206, 2.282101, 1, 0, 0.4078431, 1,
1.411979, 0.3255503, 1.18023, 1, 0, 0.4039216, 1,
1.427961, 1.336029, -0.4150345, 1, 0, 0.3960784, 1,
1.434701, 0.6009123, 2.017982, 1, 0, 0.3882353, 1,
1.434897, 1.025865, 1.419887, 1, 0, 0.3843137, 1,
1.441855, -0.6156942, 1.764139, 1, 0, 0.3764706, 1,
1.445085, -0.7755082, 1.883226, 1, 0, 0.372549, 1,
1.449742, 0.3478028, 0.3819192, 1, 0, 0.3647059, 1,
1.466393, -1.45252, 4.869334, 1, 0, 0.3607843, 1,
1.474477, -0.3918111, 1.374339, 1, 0, 0.3529412, 1,
1.488377, 0.2457075, 1.368277, 1, 0, 0.3490196, 1,
1.49286, 0.4246086, 0.3664212, 1, 0, 0.3411765, 1,
1.4953, -0.9072828, 1.567255, 1, 0, 0.3372549, 1,
1.497504, 0.3150133, 0.5843819, 1, 0, 0.3294118, 1,
1.501156, -0.1500888, 1.313677, 1, 0, 0.3254902, 1,
1.507396, 0.7903873, 0.5205163, 1, 0, 0.3176471, 1,
1.52794, 0.3672782, 0.8972493, 1, 0, 0.3137255, 1,
1.528124, -0.485079, 0.6297851, 1, 0, 0.3058824, 1,
1.535167, -0.2632724, 1.079678, 1, 0, 0.2980392, 1,
1.538198, 0.3124897, 2.85232, 1, 0, 0.2941177, 1,
1.553142, -1.594364, 1.964175, 1, 0, 0.2862745, 1,
1.563542, 0.4495848, 1.305995, 1, 0, 0.282353, 1,
1.595814, 0.2127659, 1.049989, 1, 0, 0.2745098, 1,
1.617909, 0.2654366, 0.2388535, 1, 0, 0.2705882, 1,
1.639607, 1.156275, -0.5165525, 1, 0, 0.2627451, 1,
1.672142, -0.5093249, 2.87138, 1, 0, 0.2588235, 1,
1.67609, 0.563444, 1.442338, 1, 0, 0.2509804, 1,
1.676778, 0.3836476, 2.191929, 1, 0, 0.2470588, 1,
1.686819, 0.4787897, 1.64749, 1, 0, 0.2392157, 1,
1.697922, 0.8804438, 1.072308, 1, 0, 0.2352941, 1,
1.69966, 0.6047707, 2.094863, 1, 0, 0.227451, 1,
1.702297, 0.3846504, 1.850084, 1, 0, 0.2235294, 1,
1.724737, 0.179653, 0.716996, 1, 0, 0.2156863, 1,
1.736716, -1.563231, 4.016022, 1, 0, 0.2117647, 1,
1.752365, -0.1246551, 2.378397, 1, 0, 0.2039216, 1,
1.755201, -0.7155816, 2.999704, 1, 0, 0.1960784, 1,
1.759603, -0.8641164, 2.471421, 1, 0, 0.1921569, 1,
1.772699, -1.384547, 3.494987, 1, 0, 0.1843137, 1,
1.788986, 0.6072429, 1.300094, 1, 0, 0.1803922, 1,
1.793581, 0.6338316, -0.6633622, 1, 0, 0.172549, 1,
1.822278, 0.9486195, 1.350436, 1, 0, 0.1686275, 1,
1.829146, -1.198936, 2.230586, 1, 0, 0.1607843, 1,
1.849605, 1.521914, 1.717035, 1, 0, 0.1568628, 1,
1.857197, -0.6289259, 2.146631, 1, 0, 0.1490196, 1,
1.88257, 0.01530374, 1.725862, 1, 0, 0.145098, 1,
1.974175, 1.256887, 0.7791588, 1, 0, 0.1372549, 1,
1.981458, 0.3348075, 2.049, 1, 0, 0.1333333, 1,
1.995755, 1.043578, 0.2799489, 1, 0, 0.1254902, 1,
2.086899, 1.523239, -0.05738951, 1, 0, 0.1215686, 1,
2.090189, -1.191686, 1.459006, 1, 0, 0.1137255, 1,
2.11277, 0.4415055, 1.520176, 1, 0, 0.1098039, 1,
2.196551, -0.1865045, -0.3727161, 1, 0, 0.1019608, 1,
2.243061, 0.5891101, 2.141811, 1, 0, 0.09411765, 1,
2.331278, 0.1187465, -0.1542146, 1, 0, 0.09019608, 1,
2.334633, -0.01560832, -0.5107877, 1, 0, 0.08235294, 1,
2.348529, 0.5451509, 0.6278289, 1, 0, 0.07843138, 1,
2.35866, -0.5123895, 1.362876, 1, 0, 0.07058824, 1,
2.362667, 0.3382609, 1.044128, 1, 0, 0.06666667, 1,
2.404837, -0.9795972, 1.144882, 1, 0, 0.05882353, 1,
2.411422, 1.771591, 0.5147531, 1, 0, 0.05490196, 1,
2.412271, -0.2836275, 3.023843, 1, 0, 0.04705882, 1,
2.434755, -1.384772, 3.659898, 1, 0, 0.04313726, 1,
2.469901, 0.2752181, 2.278205, 1, 0, 0.03529412, 1,
2.476155, 0.8008142, 2.404333, 1, 0, 0.03137255, 1,
2.483422, 0.2792444, 1.104058, 1, 0, 0.02352941, 1,
2.567227, 1.616544, -0.03142878, 1, 0, 0.01960784, 1,
2.615572, 0.9110389, 2.073228, 1, 0, 0.01176471, 1,
2.688439, 0.1850243, 1.72999, 1, 0, 0.007843138, 1
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
-0.1252456, -3.862405, -6.907813, 0, -0.5, 0.5, 0.5,
-0.1252456, -3.862405, -6.907813, 1, -0.5, 0.5, 0.5,
-0.1252456, -3.862405, -6.907813, 1, 1.5, 0.5, 0.5,
-0.1252456, -3.862405, -6.907813, 0, 1.5, 0.5, 0.5
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
-3.892769, 0.03057718, -6.907813, 0, -0.5, 0.5, 0.5,
-3.892769, 0.03057718, -6.907813, 1, -0.5, 0.5, 0.5,
-3.892769, 0.03057718, -6.907813, 1, 1.5, 0.5, 0.5,
-3.892769, 0.03057718, -6.907813, 0, 1.5, 0.5, 0.5
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
-3.892769, -3.862405, 0.01964307, 0, -0.5, 0.5, 0.5,
-3.892769, -3.862405, 0.01964307, 1, -0.5, 0.5, 0.5,
-3.892769, -3.862405, 0.01964307, 1, 1.5, 0.5, 0.5,
-3.892769, -3.862405, 0.01964307, 0, 1.5, 0.5, 0.5
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
-2, -2.964024, -5.309169,
2, -2.964024, -5.309169,
-2, -2.964024, -5.309169,
-2, -3.113755, -5.575609,
-1, -2.964024, -5.309169,
-1, -3.113755, -5.575609,
0, -2.964024, -5.309169,
0, -3.113755, -5.575609,
1, -2.964024, -5.309169,
1, -3.113755, -5.575609,
2, -2.964024, -5.309169,
2, -3.113755, -5.575609
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
-2, -3.413214, -6.10849, 0, -0.5, 0.5, 0.5,
-2, -3.413214, -6.10849, 1, -0.5, 0.5, 0.5,
-2, -3.413214, -6.10849, 1, 1.5, 0.5, 0.5,
-2, -3.413214, -6.10849, 0, 1.5, 0.5, 0.5,
-1, -3.413214, -6.10849, 0, -0.5, 0.5, 0.5,
-1, -3.413214, -6.10849, 1, -0.5, 0.5, 0.5,
-1, -3.413214, -6.10849, 1, 1.5, 0.5, 0.5,
-1, -3.413214, -6.10849, 0, 1.5, 0.5, 0.5,
0, -3.413214, -6.10849, 0, -0.5, 0.5, 0.5,
0, -3.413214, -6.10849, 1, -0.5, 0.5, 0.5,
0, -3.413214, -6.10849, 1, 1.5, 0.5, 0.5,
0, -3.413214, -6.10849, 0, 1.5, 0.5, 0.5,
1, -3.413214, -6.10849, 0, -0.5, 0.5, 0.5,
1, -3.413214, -6.10849, 1, -0.5, 0.5, 0.5,
1, -3.413214, -6.10849, 1, 1.5, 0.5, 0.5,
1, -3.413214, -6.10849, 0, 1.5, 0.5, 0.5,
2, -3.413214, -6.10849, 0, -0.5, 0.5, 0.5,
2, -3.413214, -6.10849, 1, -0.5, 0.5, 0.5,
2, -3.413214, -6.10849, 1, 1.5, 0.5, 0.5,
2, -3.413214, -6.10849, 0, 1.5, 0.5, 0.5
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
-3.023341, -2, -5.309169,
-3.023341, 2, -5.309169,
-3.023341, -2, -5.309169,
-3.168246, -2, -5.575609,
-3.023341, -1, -5.309169,
-3.168246, -1, -5.575609,
-3.023341, 0, -5.309169,
-3.168246, 0, -5.575609,
-3.023341, 1, -5.309169,
-3.168246, 1, -5.575609,
-3.023341, 2, -5.309169,
-3.168246, 2, -5.575609
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
-3.458055, -2, -6.10849, 0, -0.5, 0.5, 0.5,
-3.458055, -2, -6.10849, 1, -0.5, 0.5, 0.5,
-3.458055, -2, -6.10849, 1, 1.5, 0.5, 0.5,
-3.458055, -2, -6.10849, 0, 1.5, 0.5, 0.5,
-3.458055, -1, -6.10849, 0, -0.5, 0.5, 0.5,
-3.458055, -1, -6.10849, 1, -0.5, 0.5, 0.5,
-3.458055, -1, -6.10849, 1, 1.5, 0.5, 0.5,
-3.458055, -1, -6.10849, 0, 1.5, 0.5, 0.5,
-3.458055, 0, -6.10849, 0, -0.5, 0.5, 0.5,
-3.458055, 0, -6.10849, 1, -0.5, 0.5, 0.5,
-3.458055, 0, -6.10849, 1, 1.5, 0.5, 0.5,
-3.458055, 0, -6.10849, 0, 1.5, 0.5, 0.5,
-3.458055, 1, -6.10849, 0, -0.5, 0.5, 0.5,
-3.458055, 1, -6.10849, 1, -0.5, 0.5, 0.5,
-3.458055, 1, -6.10849, 1, 1.5, 0.5, 0.5,
-3.458055, 1, -6.10849, 0, 1.5, 0.5, 0.5,
-3.458055, 2, -6.10849, 0, -0.5, 0.5, 0.5,
-3.458055, 2, -6.10849, 1, -0.5, 0.5, 0.5,
-3.458055, 2, -6.10849, 1, 1.5, 0.5, 0.5,
-3.458055, 2, -6.10849, 0, 1.5, 0.5, 0.5
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
-3.023341, -2.964024, -4,
-3.023341, -2.964024, 4,
-3.023341, -2.964024, -4,
-3.168246, -3.113755, -4,
-3.023341, -2.964024, -2,
-3.168246, -3.113755, -2,
-3.023341, -2.964024, 0,
-3.168246, -3.113755, 0,
-3.023341, -2.964024, 2,
-3.168246, -3.113755, 2,
-3.023341, -2.964024, 4,
-3.168246, -3.113755, 4
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
-3.458055, -3.413214, -4, 0, -0.5, 0.5, 0.5,
-3.458055, -3.413214, -4, 1, -0.5, 0.5, 0.5,
-3.458055, -3.413214, -4, 1, 1.5, 0.5, 0.5,
-3.458055, -3.413214, -4, 0, 1.5, 0.5, 0.5,
-3.458055, -3.413214, -2, 0, -0.5, 0.5, 0.5,
-3.458055, -3.413214, -2, 1, -0.5, 0.5, 0.5,
-3.458055, -3.413214, -2, 1, 1.5, 0.5, 0.5,
-3.458055, -3.413214, -2, 0, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 0, 0, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 0, 1, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 0, 1, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 0, 0, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 2, 0, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 2, 1, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 2, 1, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 2, 0, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 4, 0, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 4, 1, -0.5, 0.5, 0.5,
-3.458055, -3.413214, 4, 1, 1.5, 0.5, 0.5,
-3.458055, -3.413214, 4, 0, 1.5, 0.5, 0.5
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
-3.023341, -2.964024, -5.309169,
-3.023341, 3.025179, -5.309169,
-3.023341, -2.964024, 5.348455,
-3.023341, 3.025179, 5.348455,
-3.023341, -2.964024, -5.309169,
-3.023341, -2.964024, 5.348455,
-3.023341, 3.025179, -5.309169,
-3.023341, 3.025179, 5.348455,
-3.023341, -2.964024, -5.309169,
2.77285, -2.964024, -5.309169,
-3.023341, -2.964024, 5.348455,
2.77285, -2.964024, 5.348455,
-3.023341, 3.025179, -5.309169,
2.77285, 3.025179, -5.309169,
-3.023341, 3.025179, 5.348455,
2.77285, 3.025179, 5.348455,
2.77285, -2.964024, -5.309169,
2.77285, 3.025179, -5.309169,
2.77285, -2.964024, 5.348455,
2.77285, 3.025179, 5.348455,
2.77285, -2.964024, -5.309169,
2.77285, -2.964024, 5.348455,
2.77285, 3.025179, -5.309169,
2.77285, 3.025179, 5.348455
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
var radius = 7.224568;
var distance = 32.14292;
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
mvMatrix.translate( 0.1252456, -0.03057718, -0.01964307 );
mvMatrix.scale( 1.347669, 1.304238, 0.732935 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.14292);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
boscalid<-read.table("boscalid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-boscalid$V2
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
```

```r
y<-boscalid$V3
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
```

```r
z<-boscalid$V4
```

```
## Error in eval(expr, envir, enclos): object 'boscalid' not found
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
-2.93893, -0.621407, -1.705156, 0, 0, 1, 1, 1,
-2.804492, -0.664009, -3.060717, 1, 0, 0, 1, 1,
-2.798685, -0.167643, -1.550558, 1, 0, 0, 1, 1,
-2.665355, 0.1310997, -2.273601, 1, 0, 0, 1, 1,
-2.633628, -0.6128167, 0.299684, 1, 0, 0, 1, 1,
-2.60775, -1.279886, -0.472671, 1, 0, 0, 1, 1,
-2.547423, 0.5914717, -1.274333, 0, 0, 0, 1, 1,
-2.543963, -1.015257, -1.672894, 0, 0, 0, 1, 1,
-2.514038, 0.4625196, -0.728413, 0, 0, 0, 1, 1,
-2.495893, -1.034516, -0.2856583, 0, 0, 0, 1, 1,
-2.480184, -1.349607, -2.870712, 0, 0, 0, 1, 1,
-2.456763, -1.495806, -1.262277, 0, 0, 0, 1, 1,
-2.391447, 2.002909, -0.9059335, 0, 0, 0, 1, 1,
-2.338884, -0.1934719, 0.5086141, 1, 1, 1, 1, 1,
-2.303948, -0.3319768, -1.28148, 1, 1, 1, 1, 1,
-2.263479, -0.4105994, -0.369837, 1, 1, 1, 1, 1,
-2.262533, 1.242532, -0.03357306, 1, 1, 1, 1, 1,
-2.215827, -0.794389, -2.03673, 1, 1, 1, 1, 1,
-2.20689, -0.1114948, -0.3848782, 1, 1, 1, 1, 1,
-2.198632, 0.615537, -3.072711, 1, 1, 1, 1, 1,
-2.159364, 2.193908, 0.3523147, 1, 1, 1, 1, 1,
-2.154501, -0.6848727, -1.069581, 1, 1, 1, 1, 1,
-2.150877, -0.5823306, -2.521311, 1, 1, 1, 1, 1,
-2.136443, 0.6754792, -2.329157, 1, 1, 1, 1, 1,
-2.078637, -0.4264597, -2.013541, 1, 1, 1, 1, 1,
-2.07714, -0.7090079, -2.399843, 1, 1, 1, 1, 1,
-2.074529, -0.3226299, -3.273785, 1, 1, 1, 1, 1,
-2.056259, -0.03194997, -0.5678391, 1, 1, 1, 1, 1,
-2.055949, -0.08626515, -0.3040524, 0, 0, 1, 1, 1,
-2.054095, 1.053088, -2.330305, 1, 0, 0, 1, 1,
-2.047018, -0.3327577, -0.8117725, 1, 0, 0, 1, 1,
-2.02446, 1.249117, -1.668379, 1, 0, 0, 1, 1,
-1.993885, 0.5842138, 1.602516, 1, 0, 0, 1, 1,
-1.989501, 0.4648871, -2.878808, 1, 0, 0, 1, 1,
-1.938043, 0.5779144, -0.640521, 0, 0, 0, 1, 1,
-1.889423, 2.776633, 0.5863035, 0, 0, 0, 1, 1,
-1.886005, 0.1626733, -1.357194, 0, 0, 0, 1, 1,
-1.862644, 0.0465203, -2.042074, 0, 0, 0, 1, 1,
-1.845081, 1.934421, -0.800678, 0, 0, 0, 1, 1,
-1.842265, -0.2445447, -1.668396, 0, 0, 0, 1, 1,
-1.831879, -2.49567, -0.5334747, 0, 0, 0, 1, 1,
-1.769263, 0.1719415, -1.891719, 1, 1, 1, 1, 1,
-1.760584, -1.40592, -4.035343, 1, 1, 1, 1, 1,
-1.746763, 0.5340311, -0.6982181, 1, 1, 1, 1, 1,
-1.736233, 0.7648233, -0.5357547, 1, 1, 1, 1, 1,
-1.709125, 0.9298514, -0.5199988, 1, 1, 1, 1, 1,
-1.700973, -0.9324327, -0.8301135, 1, 1, 1, 1, 1,
-1.69617, 0.2905612, -2.141789, 1, 1, 1, 1, 1,
-1.695146, -1.101734, -4.276187, 1, 1, 1, 1, 1,
-1.694394, 0.3164301, -1.849638, 1, 1, 1, 1, 1,
-1.68328, 1.497482, 0.4509049, 1, 1, 1, 1, 1,
-1.67787, -0.03780217, -2.870426, 1, 1, 1, 1, 1,
-1.677078, -1.298542, -0.7997006, 1, 1, 1, 1, 1,
-1.659625, 0.5934746, -0.4648873, 1, 1, 1, 1, 1,
-1.658379, 0.6910602, -2.110808, 1, 1, 1, 1, 1,
-1.653268, 0.7237111, -0.548694, 1, 1, 1, 1, 1,
-1.651566, 0.2852819, -0.6538919, 0, 0, 1, 1, 1,
-1.641995, -0.9403262, -2.496176, 1, 0, 0, 1, 1,
-1.629551, 0.9839194, -0.3256578, 1, 0, 0, 1, 1,
-1.62576, 0.5933779, -1.094656, 1, 0, 0, 1, 1,
-1.609857, 0.889604, 0.2345118, 1, 0, 0, 1, 1,
-1.601437, 0.6361563, -1.857063, 1, 0, 0, 1, 1,
-1.600971, -0.1830282, -0.3496339, 0, 0, 0, 1, 1,
-1.59757, -0.6098279, -1.647089, 0, 0, 0, 1, 1,
-1.588796, -1.025759, -2.129782, 0, 0, 0, 1, 1,
-1.573566, -1.915883, -2.354035, 0, 0, 0, 1, 1,
-1.559937, -0.669457, -2.276825, 0, 0, 0, 1, 1,
-1.555582, -0.2346206, -1.261574, 0, 0, 0, 1, 1,
-1.544897, -1.126342, -2.694023, 0, 0, 0, 1, 1,
-1.53677, 0.4253395, -0.488381, 1, 1, 1, 1, 1,
-1.535197, 1.020208, -0.6353207, 1, 1, 1, 1, 1,
-1.506496, 1.235359, -0.8628643, 1, 1, 1, 1, 1,
-1.466271, 1.460728, -1.525643, 1, 1, 1, 1, 1,
-1.457099, -0.7040011, -0.6976895, 1, 1, 1, 1, 1,
-1.453779, -1.198873, -1.856168, 1, 1, 1, 1, 1,
-1.44854, -1.768358, -3.263068, 1, 1, 1, 1, 1,
-1.442558, -0.2350381, -2.590759, 1, 1, 1, 1, 1,
-1.439142, 1.344268, -0.7218249, 1, 1, 1, 1, 1,
-1.437977, 0.964848, -2.65373, 1, 1, 1, 1, 1,
-1.435622, -1.140802, -1.240576, 1, 1, 1, 1, 1,
-1.430813, -0.6776193, -3.682249, 1, 1, 1, 1, 1,
-1.420974, -1.394695, -3.155954, 1, 1, 1, 1, 1,
-1.414307, 1.926924, -1.233304, 1, 1, 1, 1, 1,
-1.409703, -0.3068979, -2.478069, 1, 1, 1, 1, 1,
-1.40751, -0.6097637, -1.144416, 0, 0, 1, 1, 1,
-1.400645, -0.837899, -2.487114, 1, 0, 0, 1, 1,
-1.40032, 1.441523, 0.6132889, 1, 0, 0, 1, 1,
-1.394189, 0.8008221, -1.496456, 1, 0, 0, 1, 1,
-1.393882, 0.4973283, -2.384136, 1, 0, 0, 1, 1,
-1.391937, -2.019757, -2.338907, 1, 0, 0, 1, 1,
-1.379923, 1.89721, -1.58668, 0, 0, 0, 1, 1,
-1.369944, 1.74028, -1.485234, 0, 0, 0, 1, 1,
-1.361817, -0.9208457, -3.9188, 0, 0, 0, 1, 1,
-1.342559, 1.065946, 0.6553797, 0, 0, 0, 1, 1,
-1.339987, 0.8266849, -0.1882106, 0, 0, 0, 1, 1,
-1.336486, -1.995793, -3.012419, 0, 0, 0, 1, 1,
-1.327839, -0.2110103, -1.090849, 0, 0, 0, 1, 1,
-1.327713, -1.506304, -1.140122, 1, 1, 1, 1, 1,
-1.324059, -2.006767, -3.061988, 1, 1, 1, 1, 1,
-1.282608, 2.206396, 0.8842335, 1, 1, 1, 1, 1,
-1.272988, 0.05256787, 0.3850406, 1, 1, 1, 1, 1,
-1.270799, -0.6180483, -1.365152, 1, 1, 1, 1, 1,
-1.263159, -0.7048255, -1.482577, 1, 1, 1, 1, 1,
-1.250016, 1.722228, -1.856227, 1, 1, 1, 1, 1,
-1.243671, -0.02506576, -1.163126, 1, 1, 1, 1, 1,
-1.236066, -1.289442, -2.577952, 1, 1, 1, 1, 1,
-1.233056, 1.028993, -1.208092, 1, 1, 1, 1, 1,
-1.230392, -1.13541, -1.025737, 1, 1, 1, 1, 1,
-1.226158, -1.012605, -2.324201, 1, 1, 1, 1, 1,
-1.224542, -0.8230605, -3.358474, 1, 1, 1, 1, 1,
-1.21809, -0.2462042, -1.017839, 1, 1, 1, 1, 1,
-1.217058, -0.4962764, -2.99818, 1, 1, 1, 1, 1,
-1.216569, -0.4395461, -2.210867, 0, 0, 1, 1, 1,
-1.207178, -0.2411213, -3.448578, 1, 0, 0, 1, 1,
-1.205922, 0.1504047, -1.759532, 1, 0, 0, 1, 1,
-1.200521, 0.1213794, -1.517775, 1, 0, 0, 1, 1,
-1.191889, 1.336543, 0.4903407, 1, 0, 0, 1, 1,
-1.191645, 0.6446207, -0.3850245, 1, 0, 0, 1, 1,
-1.177348, -0.6165256, -2.461355, 0, 0, 0, 1, 1,
-1.17664, -2.588605, -2.857614, 0, 0, 0, 1, 1,
-1.164673, 0.9845595, -0.2690226, 0, 0, 0, 1, 1,
-1.152562, 0.8267862, -2.114629, 0, 0, 0, 1, 1,
-1.144117, -0.04496954, -1.726147, 0, 0, 0, 1, 1,
-1.125857, -0.008836376, -0.2930058, 0, 0, 0, 1, 1,
-1.11918, -0.2875618, -2.055487, 0, 0, 0, 1, 1,
-1.119142, -0.3411243, 0.6339422, 1, 1, 1, 1, 1,
-1.108275, -0.8263495, -1.654558, 1, 1, 1, 1, 1,
-1.10793, 0.8050664, -1.079765, 1, 1, 1, 1, 1,
-1.105895, 0.3488432, -0.9054462, 1, 1, 1, 1, 1,
-1.104378, 0.770898, -2.048734, 1, 1, 1, 1, 1,
-1.103062, 0.3136472, -1.643888, 1, 1, 1, 1, 1,
-1.098448, -0.4631384, -2.582029, 1, 1, 1, 1, 1,
-1.095081, 0.005877142, -2.585551, 1, 1, 1, 1, 1,
-1.0944, -0.9625943, -3.258539, 1, 1, 1, 1, 1,
-1.087676, -0.9866946, -1.163813, 1, 1, 1, 1, 1,
-1.085138, 0.800641, 0.5615946, 1, 1, 1, 1, 1,
-1.080781, -0.98345, -3.38781, 1, 1, 1, 1, 1,
-1.078927, -1.87055, -1.989503, 1, 1, 1, 1, 1,
-1.070983, -0.1563098, -1.042111, 1, 1, 1, 1, 1,
-1.067137, 1.431711, -2.032558, 1, 1, 1, 1, 1,
-1.066391, -1.350217, -2.159498, 0, 0, 1, 1, 1,
-1.066293, -0.2835931, -2.590725, 1, 0, 0, 1, 1,
-1.061046, 0.838227, -0.3002678, 1, 0, 0, 1, 1,
-1.058785, -0.7123872, -2.113846, 1, 0, 0, 1, 1,
-1.057599, -0.820807, 0.03555203, 1, 0, 0, 1, 1,
-1.048813, 1.114864, -0.7058539, 1, 0, 0, 1, 1,
-1.045705, 0.6028954, -0.2549369, 0, 0, 0, 1, 1,
-1.031277, 1.034624, -0.87687, 0, 0, 0, 1, 1,
-1.023188, -0.06220452, -1.670115, 0, 0, 0, 1, 1,
-1.01633, -2.876803, -1.752721, 0, 0, 0, 1, 1,
-1.011634, 1.958482, 0.07035235, 0, 0, 0, 1, 1,
-1.011226, -0.9653148, -1.554133, 0, 0, 0, 1, 1,
-1.000413, -2.146504, -1.951355, 0, 0, 0, 1, 1,
-0.9992956, 1.375946, -0.1133352, 1, 1, 1, 1, 1,
-0.9980949, 0.182026, -0.4763954, 1, 1, 1, 1, 1,
-0.9979864, 0.4517673, 0.09419046, 1, 1, 1, 1, 1,
-0.9974585, -0.2932508, -0.8128236, 1, 1, 1, 1, 1,
-0.9942916, -0.7470154, -0.8116452, 1, 1, 1, 1, 1,
-0.9931303, 0.1821054, -0.2373856, 1, 1, 1, 1, 1,
-0.9877204, 0.4853594, -2.134508, 1, 1, 1, 1, 1,
-0.984601, 0.005594353, -1.834681, 1, 1, 1, 1, 1,
-0.9826837, -1.541484, -1.868081, 1, 1, 1, 1, 1,
-0.981894, -1.043163, -3.401789, 1, 1, 1, 1, 1,
-0.9805191, 0.9845232, 0.305687, 1, 1, 1, 1, 1,
-0.9800388, -0.08813481, -2.388307, 1, 1, 1, 1, 1,
-0.9788769, 0.7881531, -1.788828, 1, 1, 1, 1, 1,
-0.974709, -1.00826, -1.653768, 1, 1, 1, 1, 1,
-0.9717661, -0.6116816, -1.128528, 1, 1, 1, 1, 1,
-0.9704236, 0.185486, -2.250818, 0, 0, 1, 1, 1,
-0.9683246, 0.7866279, -1.387472, 1, 0, 0, 1, 1,
-0.9591279, 0.3646452, -0.452339, 1, 0, 0, 1, 1,
-0.9562749, -0.2697498, -2.356926, 1, 0, 0, 1, 1,
-0.9539609, -1.002138, -2.035785, 1, 0, 0, 1, 1,
-0.9534533, 0.3516239, -2.458111, 1, 0, 0, 1, 1,
-0.9528361, -0.4515395, -1.290194, 0, 0, 0, 1, 1,
-0.9502634, 0.8780606, -1.45986, 0, 0, 0, 1, 1,
-0.9479306, -2.091207, -2.286512, 0, 0, 0, 1, 1,
-0.9446753, -0.3844393, -1.806103, 0, 0, 0, 1, 1,
-0.9408446, -1.265878, -2.915139, 0, 0, 0, 1, 1,
-0.9403941, 1.414788, -2.430836, 0, 0, 0, 1, 1,
-0.9350798, -1.03733, -1.717096, 0, 0, 0, 1, 1,
-0.9330248, -0.007985732, -1.477302, 1, 1, 1, 1, 1,
-0.9325385, 0.9613476, -1.250738, 1, 1, 1, 1, 1,
-0.9325242, 0.5957764, -0.7815653, 1, 1, 1, 1, 1,
-0.9314151, -0.5580822, -1.613743, 1, 1, 1, 1, 1,
-0.9304683, -0.1163132, -1.849882, 1, 1, 1, 1, 1,
-0.9260306, 0.6307066, -1.491566, 1, 1, 1, 1, 1,
-0.9233205, 0.5739305, 0.759831, 1, 1, 1, 1, 1,
-0.922317, -0.6924167, -1.591398, 1, 1, 1, 1, 1,
-0.9219337, 0.5841829, 0.4262534, 1, 1, 1, 1, 1,
-0.9213693, 0.4407483, 0.1048132, 1, 1, 1, 1, 1,
-0.9162741, -1.521294, -3.017718, 1, 1, 1, 1, 1,
-0.9119046, 1.549262, -2.014584, 1, 1, 1, 1, 1,
-0.9058179, -0.631219, -2.810733, 1, 1, 1, 1, 1,
-0.9057747, 1.055164, -1.076, 1, 1, 1, 1, 1,
-0.9047337, 0.1186394, -0.593033, 1, 1, 1, 1, 1,
-0.9036674, 0.1798837, -0.5853643, 0, 0, 1, 1, 1,
-0.9020298, 0.6247836, -2.071054, 1, 0, 0, 1, 1,
-0.8939552, -0.7611989, -3.409445, 1, 0, 0, 1, 1,
-0.8903189, -1.386666, -1.42188, 1, 0, 0, 1, 1,
-0.8898919, -0.5283753, -2.915386, 1, 0, 0, 1, 1,
-0.8839389, 2.450226, -0.3985695, 1, 0, 0, 1, 1,
-0.8692203, -0.4269353, -2.47695, 0, 0, 0, 1, 1,
-0.8674992, -0.6403169, -4.134783, 0, 0, 0, 1, 1,
-0.860944, 0.1836368, -2.317957, 0, 0, 0, 1, 1,
-0.8594904, 1.346158, -1.165312, 0, 0, 0, 1, 1,
-0.8594589, 0.2530451, -2.344289, 0, 0, 0, 1, 1,
-0.8545296, 0.6555009, -0.9069286, 0, 0, 0, 1, 1,
-0.8514243, 0.299809, -0.9027091, 0, 0, 0, 1, 1,
-0.8474031, -0.8075608, -1.889593, 1, 1, 1, 1, 1,
-0.8373744, 0.2570715, -1.461054, 1, 1, 1, 1, 1,
-0.833452, 1.698218, 1.178521, 1, 1, 1, 1, 1,
-0.8288425, 0.05682372, -1.575618, 1, 1, 1, 1, 1,
-0.8281168, 0.7335086, -2.250787, 1, 1, 1, 1, 1,
-0.8218169, -0.6209378, -2.664971, 1, 1, 1, 1, 1,
-0.8211061, 0.05536791, -0.9645236, 1, 1, 1, 1, 1,
-0.8120109, 0.3571153, -1.392233, 1, 1, 1, 1, 1,
-0.809503, 0.6211191, -1.872954, 1, 1, 1, 1, 1,
-0.8044733, -0.4857075, -0.9068684, 1, 1, 1, 1, 1,
-0.8042939, 0.8669957, -1.417022, 1, 1, 1, 1, 1,
-0.8037848, 0.5901, -1.52989, 1, 1, 1, 1, 1,
-0.7993813, -0.6107861, -2.051237, 1, 1, 1, 1, 1,
-0.7983185, 0.009053728, -1.293754, 1, 1, 1, 1, 1,
-0.7942989, -2.084366, -2.3931, 1, 1, 1, 1, 1,
-0.7921714, -1.082169, -3.031868, 0, 0, 1, 1, 1,
-0.7910265, -1.246291, -2.554817, 1, 0, 0, 1, 1,
-0.7893391, -0.1300673, -0.8039421, 1, 0, 0, 1, 1,
-0.7870943, 0.5179374, -0.4394405, 1, 0, 0, 1, 1,
-0.7768086, -0.2197212, -2.55638, 1, 0, 0, 1, 1,
-0.7744213, -1.556835, -2.022561, 1, 0, 0, 1, 1,
-0.7511172, -1.460377, -2.878646, 0, 0, 0, 1, 1,
-0.7391955, 1.03175, 0.2497916, 0, 0, 0, 1, 1,
-0.7389274, 1.984147, -0.5190628, 0, 0, 0, 1, 1,
-0.7385619, -1.59157, -1.996007, 0, 0, 0, 1, 1,
-0.7368153, -0.1676038, -0.8700637, 0, 0, 0, 1, 1,
-0.7364683, 0.5130635, -0.9209459, 0, 0, 0, 1, 1,
-0.7347102, 0.8654007, 0.1440781, 0, 0, 0, 1, 1,
-0.7259493, -0.4589001, -4.541349, 1, 1, 1, 1, 1,
-0.7249928, -0.1727504, -0.896462, 1, 1, 1, 1, 1,
-0.7193714, -0.8518007, -0.6428232, 1, 1, 1, 1, 1,
-0.7188898, -0.4557769, -3.307012, 1, 1, 1, 1, 1,
-0.7100704, -0.9558276, -1.788883, 1, 1, 1, 1, 1,
-0.7057199, 0.3116775, -1.04094, 1, 1, 1, 1, 1,
-0.7052634, 0.1785376, -0.5805483, 1, 1, 1, 1, 1,
-0.697816, -0.5825943, -2.725373, 1, 1, 1, 1, 1,
-0.6976122, 0.7537853, -0.1200427, 1, 1, 1, 1, 1,
-0.6919461, 0.3095831, -1.554715, 1, 1, 1, 1, 1,
-0.6900343, -0.1704422, -2.984318, 1, 1, 1, 1, 1,
-0.6884986, 0.02892837, -1.854473, 1, 1, 1, 1, 1,
-0.6870799, 0.5098764, -1.695009, 1, 1, 1, 1, 1,
-0.6806991, 0.9365343, 0.4739448, 1, 1, 1, 1, 1,
-0.6783435, -0.2618743, -1.224342, 1, 1, 1, 1, 1,
-0.6753709, 0.2498097, -2.108784, 0, 0, 1, 1, 1,
-0.6711836, -0.8987597, -2.988995, 1, 0, 0, 1, 1,
-0.6674829, 0.9192468, -0.9387231, 1, 0, 0, 1, 1,
-0.6667226, 1.08375, 0.6775362, 1, 0, 0, 1, 1,
-0.656129, 1.043977, -0.4853265, 1, 0, 0, 1, 1,
-0.6557223, -0.7364326, -2.24379, 1, 0, 0, 1, 1,
-0.6534542, 0.8898208, -2.027594, 0, 0, 0, 1, 1,
-0.6515231, 0.2442815, -1.531001, 0, 0, 0, 1, 1,
-0.6362466, 0.008658078, -1.945145, 0, 0, 0, 1, 1,
-0.6177528, 0.7878118, 1.627661, 0, 0, 0, 1, 1,
-0.6177116, 0.6452061, 1.663618, 0, 0, 0, 1, 1,
-0.6139641, -0.4123544, -2.068014, 0, 0, 0, 1, 1,
-0.6108974, 1.268333, -0.1339302, 0, 0, 0, 1, 1,
-0.6096042, -0.590894, -1.811017, 1, 1, 1, 1, 1,
-0.6050401, -0.3997636, -3.438814, 1, 1, 1, 1, 1,
-0.6010169, 1.499146, -1.364974, 1, 1, 1, 1, 1,
-0.5989829, 1.707713, -1.78154, 1, 1, 1, 1, 1,
-0.5968905, 0.367518, 0.1679046, 1, 1, 1, 1, 1,
-0.5961505, 0.2182488, -1.369194, 1, 1, 1, 1, 1,
-0.5958028, -0.1322818, -1.83086, 1, 1, 1, 1, 1,
-0.5952464, 0.8964824, -1.195994, 1, 1, 1, 1, 1,
-0.5948712, -1.233401, -3.508628, 1, 1, 1, 1, 1,
-0.5930095, -0.1227464, -3.572805, 1, 1, 1, 1, 1,
-0.5916541, -2.12535, -3.442235, 1, 1, 1, 1, 1,
-0.5885243, 0.3753658, -1.513489, 1, 1, 1, 1, 1,
-0.5816303, -1.265213, -0.5678561, 1, 1, 1, 1, 1,
-0.5798998, -1.258962, -3.981867, 1, 1, 1, 1, 1,
-0.5740797, 0.4032228, 0.5418807, 1, 1, 1, 1, 1,
-0.5722805, 0.1667062, -0.4102182, 0, 0, 1, 1, 1,
-0.5708334, 0.6012095, -0.2406845, 1, 0, 0, 1, 1,
-0.5639639, -2.313791, -1.636672, 1, 0, 0, 1, 1,
-0.562598, -1.795643, -0.8401988, 1, 0, 0, 1, 1,
-0.5492482, -0.0851978, -0.489244, 1, 0, 0, 1, 1,
-0.5486551, -0.03903587, -1.293066, 1, 0, 0, 1, 1,
-0.5468739, -1.083472, -1.966368, 0, 0, 0, 1, 1,
-0.5413483, -1.185802, -1.717218, 0, 0, 0, 1, 1,
-0.5412825, 0.2976589, -1.174033, 0, 0, 0, 1, 1,
-0.5398403, 0.3445776, 0.8038698, 0, 0, 0, 1, 1,
-0.5312291, 0.4721684, -1.105871, 0, 0, 0, 1, 1,
-0.530396, 0.01936117, -1.008171, 0, 0, 0, 1, 1,
-0.5265291, -0.3890601, -2.640356, 0, 0, 0, 1, 1,
-0.5178037, 0.6709059, -1.051278, 1, 1, 1, 1, 1,
-0.5158463, 0.8583609, 2.187195, 1, 1, 1, 1, 1,
-0.5073071, 0.7538991, -0.04699821, 1, 1, 1, 1, 1,
-0.5062121, 0.980013, -0.7062919, 1, 1, 1, 1, 1,
-0.4999305, -1.256938, -0.5961782, 1, 1, 1, 1, 1,
-0.4953248, -0.1146395, -3.453608, 1, 1, 1, 1, 1,
-0.4915211, -1.011612, -3.348702, 1, 1, 1, 1, 1,
-0.4909652, -0.3101922, -0.4453096, 1, 1, 1, 1, 1,
-0.4907251, 1.251917, 1.178414, 1, 1, 1, 1, 1,
-0.4880931, 0.3798507, -2.770247, 1, 1, 1, 1, 1,
-0.4866053, -2.337476, -3.308719, 1, 1, 1, 1, 1,
-0.4845111, -0.2578452, -1.778723, 1, 1, 1, 1, 1,
-0.4844488, 0.2236513, -1.224796, 1, 1, 1, 1, 1,
-0.4830347, 0.3935045, -0.5640011, 1, 1, 1, 1, 1,
-0.4742722, 0.1910218, -2.707187, 1, 1, 1, 1, 1,
-0.473471, -0.02912378, 2.225089, 0, 0, 1, 1, 1,
-0.4715054, 0.188361, -1.310213, 1, 0, 0, 1, 1,
-0.4701796, 0.1522301, -2.128417, 1, 0, 0, 1, 1,
-0.4630604, -0.1523044, -1.554859, 1, 0, 0, 1, 1,
-0.4543022, -0.3048469, -2.906357, 1, 0, 0, 1, 1,
-0.4536667, -0.4370377, -2.191755, 1, 0, 0, 1, 1,
-0.4488573, 0.9791299, -1.448476, 0, 0, 0, 1, 1,
-0.448071, -0.2804147, -3.924147, 0, 0, 0, 1, 1,
-0.4457791, -1.652231, -4.162872, 0, 0, 0, 1, 1,
-0.4357685, -0.7249266, -1.987854, 0, 0, 0, 1, 1,
-0.4357482, -0.7709263, -2.857898, 0, 0, 0, 1, 1,
-0.4339317, 0.8061661, 0.3451007, 0, 0, 0, 1, 1,
-0.4331698, 0.7182376, -0.83922, 0, 0, 0, 1, 1,
-0.4313873, -2.230124, -2.467281, 1, 1, 1, 1, 1,
-0.4293599, 1.883767, 0.8694817, 1, 1, 1, 1, 1,
-0.4283216, 1.571017, -1.92549, 1, 1, 1, 1, 1,
-0.4280168, -1.228295, -2.543289, 1, 1, 1, 1, 1,
-0.4265285, 0.3896267, 0.2331505, 1, 1, 1, 1, 1,
-0.4258178, 1.067564, -0.4634122, 1, 1, 1, 1, 1,
-0.4256408, -0.4725812, -2.212017, 1, 1, 1, 1, 1,
-0.4249064, 0.5019191, -1.921798, 1, 1, 1, 1, 1,
-0.422701, 0.4526457, -1.545487, 1, 1, 1, 1, 1,
-0.4166916, 0.5869776, 0.07570225, 1, 1, 1, 1, 1,
-0.4163254, -0.1453174, -2.07008, 1, 1, 1, 1, 1,
-0.4134524, -1.359398, -1.918716, 1, 1, 1, 1, 1,
-0.4114101, -0.05714225, -0.6277561, 1, 1, 1, 1, 1,
-0.4076008, -0.7076105, -3.903618, 1, 1, 1, 1, 1,
-0.4047561, -0.2429042, -1.291154, 1, 1, 1, 1, 1,
-0.4040389, -0.09057561, -3.039184, 0, 0, 1, 1, 1,
-0.4033121, -1.060369, -4.356695, 1, 0, 0, 1, 1,
-0.4001459, -1.036888, -3.547743, 1, 0, 0, 1, 1,
-0.3971447, -0.6023751, -2.405866, 1, 0, 0, 1, 1,
-0.3920815, -1.212783, -3.45106, 1, 0, 0, 1, 1,
-0.3896046, -1.536778, -3.922651, 1, 0, 0, 1, 1,
-0.3866718, 0.8940246, -0.02014786, 0, 0, 0, 1, 1,
-0.3854131, 2.319179, -2.398045, 0, 0, 0, 1, 1,
-0.3838512, 0.9982551, 0.4915756, 0, 0, 0, 1, 1,
-0.3799865, -0.4530552, -3.542511, 0, 0, 0, 1, 1,
-0.37341, 0.6332638, 0.558961, 0, 0, 0, 1, 1,
-0.3707563, 1.058462, -1.258181, 0, 0, 0, 1, 1,
-0.3687006, 2.222824, -1.740139, 0, 0, 0, 1, 1,
-0.3628782, 0.7512719, -0.879811, 1, 1, 1, 1, 1,
-0.3615467, -1.389405, -2.258456, 1, 1, 1, 1, 1,
-0.3580454, -0.4935257, -2.787101, 1, 1, 1, 1, 1,
-0.3560612, 0.247492, -0.8418983, 1, 1, 1, 1, 1,
-0.3514873, -2.148994, -3.950351, 1, 1, 1, 1, 1,
-0.3496569, -1.244301, -2.326311, 1, 1, 1, 1, 1,
-0.3469268, -1.063945, -3.449124, 1, 1, 1, 1, 1,
-0.3468136, 0.6960353, -1.056215, 1, 1, 1, 1, 1,
-0.3464947, -0.6443125, -2.732988, 1, 1, 1, 1, 1,
-0.3424039, -1.378, -3.335992, 1, 1, 1, 1, 1,
-0.3417265, 0.5876418, -1.938918, 1, 1, 1, 1, 1,
-0.339984, 0.129217, -3.999077, 1, 1, 1, 1, 1,
-0.3396589, 0.09276722, -0.779284, 1, 1, 1, 1, 1,
-0.3367481, -0.2498988, -2.109016, 1, 1, 1, 1, 1,
-0.3322631, -0.4120005, -1.704396, 1, 1, 1, 1, 1,
-0.3299627, 2.769925, -0.02126907, 0, 0, 1, 1, 1,
-0.3280731, 1.113891, -0.06546512, 1, 0, 0, 1, 1,
-0.3270928, 0.4500832, -1.879103, 1, 0, 0, 1, 1,
-0.3258426, 0.3483061, 0.2564927, 1, 0, 0, 1, 1,
-0.3255596, -0.4231458, -2.968565, 1, 0, 0, 1, 1,
-0.3231589, 1.371253, 1.203556, 1, 0, 0, 1, 1,
-0.3216633, 0.3926363, -0.6518557, 0, 0, 0, 1, 1,
-0.3215151, 0.9245467, -1.936048, 0, 0, 0, 1, 1,
-0.3212627, 0.7057971, 0.2921624, 0, 0, 0, 1, 1,
-0.3191521, 0.181743, -0.6729184, 0, 0, 0, 1, 1,
-0.3132413, 0.788323, -0.570706, 0, 0, 0, 1, 1,
-0.3099752, 0.5690196, -1.153786, 0, 0, 0, 1, 1,
-0.3088117, 0.8574451, -2.127521, 0, 0, 0, 1, 1,
-0.3068552, -0.08768379, -1.769897, 1, 1, 1, 1, 1,
-0.2967899, -0.4871078, -3.313995, 1, 1, 1, 1, 1,
-0.2897367, 0.9490299, 1.235631, 1, 1, 1, 1, 1,
-0.2870665, -0.5484913, -3.19819, 1, 1, 1, 1, 1,
-0.2831027, -1.064858, -2.928533, 1, 1, 1, 1, 1,
-0.282, 1.523335, -0.04985827, 1, 1, 1, 1, 1,
-0.2804032, 0.9989051, -1.075807, 1, 1, 1, 1, 1,
-0.2755718, -1.33873, -2.246723, 1, 1, 1, 1, 1,
-0.2718383, 0.2729702, -2.485756, 1, 1, 1, 1, 1,
-0.2709472, 0.2489397, 0.3850866, 1, 1, 1, 1, 1,
-0.2709217, 0.1961409, -1.578385, 1, 1, 1, 1, 1,
-0.2691947, 0.2207372, -1.199054, 1, 1, 1, 1, 1,
-0.2600894, -0.660062, -3.043814, 1, 1, 1, 1, 1,
-0.2565614, -0.2569445, -1.152906, 1, 1, 1, 1, 1,
-0.253031, 1.189197, -1.517516, 1, 1, 1, 1, 1,
-0.2496011, 1.620831, 0.0006845821, 0, 0, 1, 1, 1,
-0.2473715, 0.6721206, -2.43145, 1, 0, 0, 1, 1,
-0.2431856, -0.3356823, -2.789309, 1, 0, 0, 1, 1,
-0.2403274, 1.192678, -0.6159677, 1, 0, 0, 1, 1,
-0.2378138, -0.02060486, -0.9499369, 1, 0, 0, 1, 1,
-0.2324801, 0.02176002, -1.978619, 1, 0, 0, 1, 1,
-0.2314929, -0.1879227, -3.136853, 0, 0, 0, 1, 1,
-0.2303514, 0.1725546, 0.827859, 0, 0, 0, 1, 1,
-0.2201216, -0.1447465, -1.017794, 0, 0, 0, 1, 1,
-0.2177789, -0.1955364, -1.672964, 0, 0, 0, 1, 1,
-0.2164605, 0.02856694, -3.161136, 0, 0, 0, 1, 1,
-0.21596, -0.9802626, -2.379408, 0, 0, 0, 1, 1,
-0.2116277, -1.372984, -5.153961, 0, 0, 0, 1, 1,
-0.2083232, 0.6746842, 0.001860608, 1, 1, 1, 1, 1,
-0.2021232, 0.3114992, 0.8119815, 1, 1, 1, 1, 1,
-0.2016397, 0.08470339, -0.3505968, 1, 1, 1, 1, 1,
-0.1992221, -0.7887531, -2.721597, 1, 1, 1, 1, 1,
-0.194291, 2.454608, -1.101875, 1, 1, 1, 1, 1,
-0.1903443, 1.39601, 0.05750091, 1, 1, 1, 1, 1,
-0.1891037, 0.393354, -0.2753685, 1, 1, 1, 1, 1,
-0.1885913, 0.3806027, 0.9907985, 1, 1, 1, 1, 1,
-0.1865401, -1.410431, -2.303797, 1, 1, 1, 1, 1,
-0.185372, -0.1170261, -1.425864, 1, 1, 1, 1, 1,
-0.1826185, 0.200773, -2.143233, 1, 1, 1, 1, 1,
-0.1810589, -0.4084612, -2.942666, 1, 1, 1, 1, 1,
-0.1777859, -0.5832487, -2.805069, 1, 1, 1, 1, 1,
-0.1750224, -1.130803, -2.459852, 1, 1, 1, 1, 1,
-0.1737726, 0.6400508, -0.5369511, 1, 1, 1, 1, 1,
-0.1699224, 0.8412147, -0.03498205, 0, 0, 1, 1, 1,
-0.1639593, -0.3784372, -2.629204, 1, 0, 0, 1, 1,
-0.1632035, -1.656911, -4.00669, 1, 0, 0, 1, 1,
-0.1630141, -0.1623319, -2.411305, 1, 0, 0, 1, 1,
-0.162525, 0.4417724, -0.2109411, 1, 0, 0, 1, 1,
-0.1623741, -0.3002745, -3.098427, 1, 0, 0, 1, 1,
-0.1622318, -0.9732361, -3.611788, 0, 0, 0, 1, 1,
-0.1609707, -0.2041802, -2.452765, 0, 0, 0, 1, 1,
-0.1543199, -1.915263, -3.330853, 0, 0, 0, 1, 1,
-0.1479066, -0.07970767, -3.542736, 0, 0, 0, 1, 1,
-0.1470955, 0.7663894, -0.2836838, 0, 0, 0, 1, 1,
-0.1467278, -0.4171787, -3.561249, 0, 0, 0, 1, 1,
-0.1448278, 0.1939112, -1.603707, 0, 0, 0, 1, 1,
-0.1403163, 2.212816, -0.8256325, 1, 1, 1, 1, 1,
-0.1383555, 0.7304606, 0.2402103, 1, 1, 1, 1, 1,
-0.1379266, -2.547633, -4.061237, 1, 1, 1, 1, 1,
-0.1371238, 1.269453, 0.7239857, 1, 1, 1, 1, 1,
-0.1321458, 0.2645026, -1.219753, 1, 1, 1, 1, 1,
-0.1302563, -1.578605, -2.050856, 1, 1, 1, 1, 1,
-0.1301367, -1.857941, -1.975798, 1, 1, 1, 1, 1,
-0.1255116, -0.8997765, -2.694098, 1, 1, 1, 1, 1,
-0.1254508, 0.3058561, -0.7699031, 1, 1, 1, 1, 1,
-0.1253983, 0.08560613, -2.377978, 1, 1, 1, 1, 1,
-0.1220831, -0.4201472, -3.32516, 1, 1, 1, 1, 1,
-0.1205093, -0.5501645, -3.580981, 1, 1, 1, 1, 1,
-0.119125, 0.939378, 0.5988389, 1, 1, 1, 1, 1,
-0.1185193, 1.109479, -1.231968, 1, 1, 1, 1, 1,
-0.1109998, -0.4719456, -3.136961, 1, 1, 1, 1, 1,
-0.1086, -0.5669827, -4.33352, 0, 0, 1, 1, 1,
-0.1079334, 1.471159, 1.172261, 1, 0, 0, 1, 1,
-0.1078944, -0.5143482, -3.243959, 1, 0, 0, 1, 1,
-0.1065168, 1.698627, -1.817536, 1, 0, 0, 1, 1,
-0.1033197, 0.2883766, 1.929491, 1, 0, 0, 1, 1,
-0.1025922, 1.739104, -0.9214023, 1, 0, 0, 1, 1,
-0.09814807, -0.487209, -1.885389, 0, 0, 0, 1, 1,
-0.09592766, -0.0311489, -2.619088, 0, 0, 0, 1, 1,
-0.09566615, -0.2697265, -2.30791, 0, 0, 0, 1, 1,
-0.09281954, 0.3849746, -0.9515927, 0, 0, 0, 1, 1,
-0.08666512, 0.3920609, -1.022382, 0, 0, 0, 1, 1,
-0.08660363, 1.555196, 0.3292174, 0, 0, 0, 1, 1,
-0.08340272, -0.3223877, -1.87347, 0, 0, 0, 1, 1,
-0.08195535, 0.02275608, -1.50554, 1, 1, 1, 1, 1,
-0.08117817, -0.1072203, -3.442782, 1, 1, 1, 1, 1,
-0.08005843, -0.3107753, -2.851695, 1, 1, 1, 1, 1,
-0.07801257, 0.8091442, 0.5339105, 1, 1, 1, 1, 1,
-0.07572044, 1.001057, 1.293384, 1, 1, 1, 1, 1,
-0.07142264, 0.6782393, 0.9286572, 1, 1, 1, 1, 1,
-0.06869591, -0.4680903, -3.652719, 1, 1, 1, 1, 1,
-0.06795123, 0.2023332, -0.2543699, 1, 1, 1, 1, 1,
-0.06683648, -0.2108505, -0.8946536, 1, 1, 1, 1, 1,
-0.06614238, 0.9997476, 0.9619197, 1, 1, 1, 1, 1,
-0.06573525, -0.04689172, -2.18687, 1, 1, 1, 1, 1,
-0.061699, -0.5531994, -3.019001, 1, 1, 1, 1, 1,
-0.06019397, 0.7622402, 0.480425, 1, 1, 1, 1, 1,
-0.05384174, -0.5897533, -3.606772, 1, 1, 1, 1, 1,
-0.04967803, 0.7415959, -0.1719303, 1, 1, 1, 1, 1,
-0.04216221, 1.874807, -0.6311318, 0, 0, 1, 1, 1,
-0.03936752, 0.2283526, -1.56323, 1, 0, 0, 1, 1,
-0.03834866, -0.08419456, -2.419873, 1, 0, 0, 1, 1,
-0.03793935, 0.5540836, -0.2357501, 1, 0, 0, 1, 1,
-0.03722913, 2.937957, -1.469514, 1, 0, 0, 1, 1,
-0.03660401, 0.7573368, -0.01332065, 1, 0, 0, 1, 1,
-0.02768863, -1.258004, -1.217184, 0, 0, 0, 1, 1,
-0.02648883, 0.4580929, 0.9406589, 0, 0, 0, 1, 1,
-0.02590436, -1.532266, -3.595125, 0, 0, 0, 1, 1,
-0.02273061, -0.8485642, -4.31474, 0, 0, 0, 1, 1,
-0.02045914, 0.5270929, -0.3942143, 0, 0, 0, 1, 1,
-0.01881128, 0.2151296, -0.3779234, 0, 0, 0, 1, 1,
-0.01599161, -0.4453632, -4.414585, 0, 0, 0, 1, 1,
-0.01353071, 0.270754, -0.03552495, 1, 1, 1, 1, 1,
-0.0133382, 0.4381953, 0.04364316, 1, 1, 1, 1, 1,
-0.01226095, 0.5073812, 1.188328, 1, 1, 1, 1, 1,
-0.009657528, -0.04612736, -2.531006, 1, 1, 1, 1, 1,
-0.008512862, 0.8086628, -0.2586545, 1, 1, 1, 1, 1,
-0.003315255, 1.907314, 0.1549365, 1, 1, 1, 1, 1,
-0.0008303419, 0.255966, -0.6664154, 1, 1, 1, 1, 1,
-2.825263e-05, 1.365059, 1.423699, 1, 1, 1, 1, 1,
0.001947297, -1.739918, 2.878254, 1, 1, 1, 1, 1,
0.002313992, 1.207827, -0.3331651, 1, 1, 1, 1, 1,
0.003490333, 1.996495, -0.2911379, 1, 1, 1, 1, 1,
0.005125989, -0.6352842, 2.472805, 1, 1, 1, 1, 1,
0.005250201, 0.6553906, -0.1759896, 1, 1, 1, 1, 1,
0.006788472, 0.5632399, -1.011782, 1, 1, 1, 1, 1,
0.008939519, 0.9144068, 0.4279112, 1, 1, 1, 1, 1,
0.01570726, 0.01237156, 2.041054, 0, 0, 1, 1, 1,
0.01638274, -1.186018, 3.213075, 1, 0, 0, 1, 1,
0.01984789, 2.050512, -0.4170558, 1, 0, 0, 1, 1,
0.02250982, 0.08550881, 0.1030362, 1, 0, 0, 1, 1,
0.02270473, -0.0004916704, 2.042635, 1, 0, 0, 1, 1,
0.0298044, 0.7735946, 1.813772, 1, 0, 0, 1, 1,
0.02984404, 1.163814, -0.3575875, 0, 0, 0, 1, 1,
0.03044823, -0.7278863, 4.219328, 0, 0, 0, 1, 1,
0.03155543, 0.9878384, -0.0370672, 0, 0, 0, 1, 1,
0.03929299, -0.5601482, 2.404317, 0, 0, 0, 1, 1,
0.04100383, 0.7838712, -1.00569, 0, 0, 0, 1, 1,
0.0425447, 2.341917, -0.8631137, 0, 0, 0, 1, 1,
0.04424054, 0.4536054, 0.09752653, 0, 0, 0, 1, 1,
0.04489907, -1.750917, 3.307714, 1, 1, 1, 1, 1,
0.0449511, 0.9492484, -0.6978966, 1, 1, 1, 1, 1,
0.04799758, 1.752158, -0.2564974, 1, 1, 1, 1, 1,
0.05063865, 0.04140611, 0.7098021, 1, 1, 1, 1, 1,
0.05178563, -1.172744, 3.885559, 1, 1, 1, 1, 1,
0.05811743, 0.5368366, 1.318599, 1, 1, 1, 1, 1,
0.0585066, 0.7167222, 0.2928481, 1, 1, 1, 1, 1,
0.05943182, 0.8273562, 0.5492826, 1, 1, 1, 1, 1,
0.06501242, 0.5103749, 0.8693236, 1, 1, 1, 1, 1,
0.06554811, 0.8646687, -0.3687891, 1, 1, 1, 1, 1,
0.06617762, -0.133334, 3.305084, 1, 1, 1, 1, 1,
0.06643771, -0.905837, 4.185696, 1, 1, 1, 1, 1,
0.06827268, 1.623776, 1.854469, 1, 1, 1, 1, 1,
0.07312846, -0.7707603, 4.027005, 1, 1, 1, 1, 1,
0.07561158, -0.7079287, 3.052402, 1, 1, 1, 1, 1,
0.07771651, 0.1124404, 0.1751702, 0, 0, 1, 1, 1,
0.0811278, -1.396307, 3.009765, 1, 0, 0, 1, 1,
0.08473934, -0.0956769, 1.837717, 1, 0, 0, 1, 1,
0.08669612, -1.14965, 3.303004, 1, 0, 0, 1, 1,
0.08778492, 0.2403781, -1.16387, 1, 0, 0, 1, 1,
0.09388901, -1.155257, 3.373683, 1, 0, 0, 1, 1,
0.09471712, 1.41937, 0.609731, 0, 0, 0, 1, 1,
0.1090232, -0.4613543, 0.3388999, 0, 0, 0, 1, 1,
0.1102743, 0.4096637, -0.284622, 0, 0, 0, 1, 1,
0.1143561, 1.004154, 0.8389763, 0, 0, 0, 1, 1,
0.1163882, 0.5198901, 0.9202631, 0, 0, 0, 1, 1,
0.1223471, -1.673258, 3.61195, 0, 0, 0, 1, 1,
0.122863, 0.3267569, -0.4637949, 0, 0, 0, 1, 1,
0.1237593, -0.6038433, 1.861241, 1, 1, 1, 1, 1,
0.1273841, -1.393252, 1.398847, 1, 1, 1, 1, 1,
0.127717, -1.2318, 4.712375, 1, 1, 1, 1, 1,
0.129135, 0.7400084, -0.9217986, 1, 1, 1, 1, 1,
0.1308028, 1.432266, 0.8486894, 1, 1, 1, 1, 1,
0.1316411, -0.04905599, 2.700525, 1, 1, 1, 1, 1,
0.13165, 1.393675, -0.245413, 1, 1, 1, 1, 1,
0.1330486, -1.273409, 2.027182, 1, 1, 1, 1, 1,
0.1368847, -1.227237, 3.899085, 1, 1, 1, 1, 1,
0.1373617, 1.714419, 1.995534, 1, 1, 1, 1, 1,
0.1391996, 1.484823, -0.5839673, 1, 1, 1, 1, 1,
0.1394226, 0.8608909, -0.18378, 1, 1, 1, 1, 1,
0.1399262, -0.3325842, 3.177264, 1, 1, 1, 1, 1,
0.1401533, -1.210741, 1.44678, 1, 1, 1, 1, 1,
0.1417175, -0.5145102, 2.362123, 1, 1, 1, 1, 1,
0.1515403, 1.581136, -1.840338, 0, 0, 1, 1, 1,
0.1550316, -1.438903, 3.163473, 1, 0, 0, 1, 1,
0.1554775, 0.1341413, 1.431708, 1, 0, 0, 1, 1,
0.1601348, -2.098861, 4.236252, 1, 0, 0, 1, 1,
0.1610519, -1.609445, 2.303119, 1, 0, 0, 1, 1,
0.1625764, -1.819872, 1.491595, 1, 0, 0, 1, 1,
0.1729038, 1.929076, 1.561236, 0, 0, 0, 1, 1,
0.1754841, -1.65061, 1.374014, 0, 0, 0, 1, 1,
0.1799124, -1.91126, 4.327696, 0, 0, 0, 1, 1,
0.1804524, 0.3765523, -0.7271355, 0, 0, 0, 1, 1,
0.1828793, 0.9349524, 0.6299979, 0, 0, 0, 1, 1,
0.1849878, 1.667783, -0.5842027, 0, 0, 0, 1, 1,
0.1875425, -0.8757871, 3.24366, 0, 0, 0, 1, 1,
0.193321, -0.4322602, 3.229222, 1, 1, 1, 1, 1,
0.1972252, -0.163017, 2.178958, 1, 1, 1, 1, 1,
0.1998702, -0.0484313, -0.1176439, 1, 1, 1, 1, 1,
0.1999608, 0.9551486, -1.2835, 1, 1, 1, 1, 1,
0.2000255, 0.8938188, -0.1336285, 1, 1, 1, 1, 1,
0.20359, 1.722785, -0.6580189, 1, 1, 1, 1, 1,
0.2044192, -0.2777289, 2.078339, 1, 1, 1, 1, 1,
0.204927, -0.8941848, 3.159285, 1, 1, 1, 1, 1,
0.205986, 0.7815114, 1.946023, 1, 1, 1, 1, 1,
0.2091609, 0.000776689, 2.311839, 1, 1, 1, 1, 1,
0.212926, 1.933519, 0.767132, 1, 1, 1, 1, 1,
0.2157769, -1.952948, 1.391145, 1, 1, 1, 1, 1,
0.2259029, 1.091292, -0.0004454685, 1, 1, 1, 1, 1,
0.2322904, -0.5583447, 3.674059, 1, 1, 1, 1, 1,
0.2338566, 0.8516724, 0.5390175, 1, 1, 1, 1, 1,
0.2352747, 0.1327074, 0.5692777, 0, 0, 1, 1, 1,
0.240514, 1.721753, 1.216951, 1, 0, 0, 1, 1,
0.2419922, -0.5376898, 5.170431, 1, 0, 0, 1, 1,
0.2448445, 1.241375, 1.352644, 1, 0, 0, 1, 1,
0.2482076, 1.232758, 0.8559434, 1, 0, 0, 1, 1,
0.25296, -0.814561, 3.326074, 1, 0, 0, 1, 1,
0.2532434, -0.3017847, 2.661706, 0, 0, 0, 1, 1,
0.2575098, -0.858496, 3.957922, 0, 0, 0, 1, 1,
0.2579362, 0.1676188, 0.4910502, 0, 0, 0, 1, 1,
0.2605046, 1.960015, 0.3971755, 0, 0, 0, 1, 1,
0.2607251, -0.5355536, 1.84122, 0, 0, 0, 1, 1,
0.2609771, -1.154538, 1.353771, 0, 0, 0, 1, 1,
0.2619462, 0.1154454, -0.130818, 0, 0, 0, 1, 1,
0.2623056, -1.161226, 2.256777, 1, 1, 1, 1, 1,
0.2627257, 0.7001793, 1.200524, 1, 1, 1, 1, 1,
0.2637197, -0.3788016, 1.748361, 1, 1, 1, 1, 1,
0.2646802, 0.8380699, 1.513182, 1, 1, 1, 1, 1,
0.2646949, 1.805411, 0.8330917, 1, 1, 1, 1, 1,
0.2660938, 0.3362899, 0.9115332, 1, 1, 1, 1, 1,
0.274349, -0.4681192, 1.365556, 1, 1, 1, 1, 1,
0.2748175, 0.1409427, -0.06320236, 1, 1, 1, 1, 1,
0.2760115, -2.070805, 2.568668, 1, 1, 1, 1, 1,
0.2834736, -0.4157988, 3.32107, 1, 1, 1, 1, 1,
0.2835614, -0.3231049, 1.712576, 1, 1, 1, 1, 1,
0.285245, -0.6800374, 2.81018, 1, 1, 1, 1, 1,
0.2857767, -0.3155263, 1.416403, 1, 1, 1, 1, 1,
0.2858573, 2.490891, 1.152172, 1, 1, 1, 1, 1,
0.2913216, 0.7729365, -0.3625374, 1, 1, 1, 1, 1,
0.2981272, 0.1302371, 1.914793, 0, 0, 1, 1, 1,
0.3034772, -0.1261677, 2.746982, 1, 0, 0, 1, 1,
0.3046501, -2.550245, 3.516121, 1, 0, 0, 1, 1,
0.3149909, -0.6601523, 2.470314, 1, 0, 0, 1, 1,
0.3150902, -0.8885249, 3.282214, 1, 0, 0, 1, 1,
0.3178737, 1.083932, 0.4335901, 1, 0, 0, 1, 1,
0.3250564, 1.611095, -0.1675474, 0, 0, 0, 1, 1,
0.3281692, -1.318194, 1.917079, 0, 0, 0, 1, 1,
0.3306215, 0.07878686, 1.609881, 0, 0, 0, 1, 1,
0.3329197, -0.693477, 2.70951, 0, 0, 0, 1, 1,
0.3410584, 0.8335794, 0.6221911, 0, 0, 0, 1, 1,
0.3425897, 0.2646969, -0.09861541, 0, 0, 0, 1, 1,
0.3431186, -0.9332818, 3.266922, 0, 0, 0, 1, 1,
0.3481325, 1.195841, -1.402457, 1, 1, 1, 1, 1,
0.3493297, -0.8643858, 2.750805, 1, 1, 1, 1, 1,
0.353934, 1.391273, 1.568387, 1, 1, 1, 1, 1,
0.3546323, 0.2357913, -0.1407906, 1, 1, 1, 1, 1,
0.3615209, -0.1047296, 3.210357, 1, 1, 1, 1, 1,
0.3621414, -0.1364156, 1.336826, 1, 1, 1, 1, 1,
0.3642129, 1.359719, 0.6924503, 1, 1, 1, 1, 1,
0.365064, 1.650924, 0.4078308, 1, 1, 1, 1, 1,
0.3696467, -0.1979592, 3.46993, 1, 1, 1, 1, 1,
0.3699206, -0.3856897, 0.05264689, 1, 1, 1, 1, 1,
0.3706886, 0.8366459, 0.7502056, 1, 1, 1, 1, 1,
0.3737408, -1.223791, 3.548633, 1, 1, 1, 1, 1,
0.3783213, 0.4883586, -0.887287, 1, 1, 1, 1, 1,
0.3789079, -0.9135579, 0.9345619, 1, 1, 1, 1, 1,
0.3813581, 0.9178063, 0.2054571, 1, 1, 1, 1, 1,
0.3821653, 1.796933, 1.553829, 0, 0, 1, 1, 1,
0.3843332, 0.9925334, -0.004799406, 1, 0, 0, 1, 1,
0.3844362, 1.544205, 0.3640566, 1, 0, 0, 1, 1,
0.3916728, -0.002423831, 1.810744, 1, 0, 0, 1, 1,
0.3975271, 1.883489, -1.52439, 1, 0, 0, 1, 1,
0.3981075, -0.1149693, -0.6141564, 1, 0, 0, 1, 1,
0.3995745, -0.9601881, 1.91116, 0, 0, 0, 1, 1,
0.4043197, 1.139644, 0.2643702, 0, 0, 0, 1, 1,
0.4109686, 0.09134465, 2.527388, 0, 0, 0, 1, 1,
0.4129875, -1.07558, 3.203989, 0, 0, 0, 1, 1,
0.4149545, 1.070659, 0.4527444, 0, 0, 0, 1, 1,
0.4179851, -0.5396905, 4.390622, 0, 0, 0, 1, 1,
0.4184659, 0.473078, 0.7926536, 0, 0, 0, 1, 1,
0.4228638, 1.061853, -0.6585604, 1, 1, 1, 1, 1,
0.423337, 0.2272007, 1.155882, 1, 1, 1, 1, 1,
0.4298732, -0.5991224, 2.153898, 1, 1, 1, 1, 1,
0.4323677, -0.752894, 3.298296, 1, 1, 1, 1, 1,
0.4329485, -0.1435015, 2.756727, 1, 1, 1, 1, 1,
0.4336149, 1.946406, 0.5149324, 1, 1, 1, 1, 1,
0.43415, -0.5299097, 2.233551, 1, 1, 1, 1, 1,
0.4366776, -0.7521138, 4.017844, 1, 1, 1, 1, 1,
0.4424515, -0.4576879, 3.645874, 1, 1, 1, 1, 1,
0.4465864, 0.7707219, 0.6109444, 1, 1, 1, 1, 1,
0.4466591, -1.782913, 5.193247, 1, 1, 1, 1, 1,
0.4484649, -1.445735, 2.405546, 1, 1, 1, 1, 1,
0.4508257, 0.3845273, 0.1693287, 1, 1, 1, 1, 1,
0.4524729, -0.9714837, 2.744457, 1, 1, 1, 1, 1,
0.4534734, -0.38008, 1.486714, 1, 1, 1, 1, 1,
0.4541594, 0.802591, -1.591586, 0, 0, 1, 1, 1,
0.463311, 0.2532856, 1.061648, 1, 0, 0, 1, 1,
0.4649731, -0.3110155, 2.318053, 1, 0, 0, 1, 1,
0.4672124, -0.2233745, 1.627881, 1, 0, 0, 1, 1,
0.4702161, 0.214844, 1.215285, 1, 0, 0, 1, 1,
0.4732654, 0.4178836, 0.2636025, 1, 0, 0, 1, 1,
0.4751853, 0.6425543, 1.591541, 0, 0, 0, 1, 1,
0.4763944, -1.131802, 2.017143, 0, 0, 0, 1, 1,
0.4840301, -1.742185, 3.457417, 0, 0, 0, 1, 1,
0.488222, 1.140424, -1.198218, 0, 0, 0, 1, 1,
0.4988625, 2.25352, 0.3169546, 0, 0, 0, 1, 1,
0.4993873, 0.6764237, 0.8806623, 0, 0, 0, 1, 1,
0.5043685, -1.547706, 4.105681, 0, 0, 0, 1, 1,
0.5168821, -0.2411815, 1.826803, 1, 1, 1, 1, 1,
0.5207499, -0.5224831, 2.805744, 1, 1, 1, 1, 1,
0.5311091, -0.7858171, 2.480241, 1, 1, 1, 1, 1,
0.5336024, 0.5826768, 1.295751, 1, 1, 1, 1, 1,
0.5352412, -1.814049, 2.181199, 1, 1, 1, 1, 1,
0.5369658, -1.226319, 3.386012, 1, 1, 1, 1, 1,
0.5398039, 0.7479653, 1.508089, 1, 1, 1, 1, 1,
0.5398098, -1.844594, 2.155294, 1, 1, 1, 1, 1,
0.5414088, 0.6046923, 1.387904, 1, 1, 1, 1, 1,
0.5425906, 0.5686774, 2.709865, 1, 1, 1, 1, 1,
0.5465176, 1.412193, 0.9012607, 1, 1, 1, 1, 1,
0.5476343, -0.07668804, 2.249321, 1, 1, 1, 1, 1,
0.5517359, -1.196461, 1.009926, 1, 1, 1, 1, 1,
0.5575162, 0.7991716, -0.6954405, 1, 1, 1, 1, 1,
0.5593676, 0.3838171, 2.01565, 1, 1, 1, 1, 1,
0.5597412, 1.760974, -0.5849803, 0, 0, 1, 1, 1,
0.5608276, -0.7630536, 2.321733, 1, 0, 0, 1, 1,
0.5649527, 2.000902, -0.0006291841, 1, 0, 0, 1, 1,
0.5656813, -0.6833234, 0.6088251, 1, 0, 0, 1, 1,
0.5667109, -0.8463259, 2.377706, 1, 0, 0, 1, 1,
0.5686285, 0.1870033, 3.400287, 1, 0, 0, 1, 1,
0.5772172, -1.089968, 3.987751, 0, 0, 0, 1, 1,
0.58302, 0.4526512, 1.23774, 0, 0, 0, 1, 1,
0.5888891, 0.6988124, 1.104382, 0, 0, 0, 1, 1,
0.5902292, 0.2530251, 0.3725494, 0, 0, 0, 1, 1,
0.594371, 1.185257, 2.488386, 0, 0, 0, 1, 1,
0.5952831, 0.7465473, -1.419669, 0, 0, 0, 1, 1,
0.6013639, -0.8255726, 3.652027, 0, 0, 0, 1, 1,
0.6016247, -1.155387, 2.199857, 1, 1, 1, 1, 1,
0.6017825, -0.2066028, 4.040755, 1, 1, 1, 1, 1,
0.6027671, 1.205386, 0.2555002, 1, 1, 1, 1, 1,
0.6074101, 0.1286659, 0.3573194, 1, 1, 1, 1, 1,
0.6090366, 0.154254, 1.798791, 1, 1, 1, 1, 1,
0.6124505, 0.9433957, 0.008162417, 1, 1, 1, 1, 1,
0.6134311, 0.6677422, -0.8426645, 1, 1, 1, 1, 1,
0.6142952, -0.8467197, 3.315773, 1, 1, 1, 1, 1,
0.617135, -0.5998154, 1.656848, 1, 1, 1, 1, 1,
0.6172003, 0.3768733, 0.4415704, 1, 1, 1, 1, 1,
0.624114, -0.3472233, 2.137104, 1, 1, 1, 1, 1,
0.6309174, 0.1675384, 1.534272, 1, 1, 1, 1, 1,
0.6362213, 2.505919, -0.003401241, 1, 1, 1, 1, 1,
0.6368564, 0.09385075, 2.084656, 1, 1, 1, 1, 1,
0.6414034, 2.547704, 1.758301, 1, 1, 1, 1, 1,
0.6471004, 1.017129, 0.9693014, 0, 0, 1, 1, 1,
0.6501305, 0.2143877, 1.464651, 1, 0, 0, 1, 1,
0.6534067, -0.1482383, 4.021679, 1, 0, 0, 1, 1,
0.6565428, -0.1502413, 2.611094, 1, 0, 0, 1, 1,
0.6569307, -0.8460299, 3.766091, 1, 0, 0, 1, 1,
0.664123, -0.354603, 2.445905, 1, 0, 0, 1, 1,
0.6743206, -1.099503, 4.82812, 0, 0, 0, 1, 1,
0.6787974, -0.5524657, 1.737809, 0, 0, 0, 1, 1,
0.680186, 1.587557, 1.418098, 0, 0, 0, 1, 1,
0.6869547, -1.612355, 1.493046, 0, 0, 0, 1, 1,
0.688088, 0.2583552, 0.2317998, 0, 0, 0, 1, 1,
0.6905575, 0.3783996, 0.7517048, 0, 0, 0, 1, 1,
0.6913932, 0.693127, 0.9757552, 0, 0, 0, 1, 1,
0.6924286, 2.397732, -1.081898, 1, 1, 1, 1, 1,
0.6973117, 0.3664797, 1.739126, 1, 1, 1, 1, 1,
0.6983669, -1.286114, 2.875703, 1, 1, 1, 1, 1,
0.6990942, -0.8337905, 2.37036, 1, 1, 1, 1, 1,
0.7005756, -0.3399641, 0.8957165, 1, 1, 1, 1, 1,
0.7042167, -0.246563, 1.680774, 1, 1, 1, 1, 1,
0.704246, -1.192021, 1.749799, 1, 1, 1, 1, 1,
0.7044492, -0.04073447, 0.7528762, 1, 1, 1, 1, 1,
0.7069076, 1.158983, 1.463214, 1, 1, 1, 1, 1,
0.7074714, 0.09260407, -0.593739, 1, 1, 1, 1, 1,
0.7084411, -0.6574752, 3.493178, 1, 1, 1, 1, 1,
0.712763, -0.545814, 2.474469, 1, 1, 1, 1, 1,
0.7167853, -0.3287116, 1.033714, 1, 1, 1, 1, 1,
0.7174533, 0.3264287, 3.166245, 1, 1, 1, 1, 1,
0.7336445, 0.9979042, 0.03670301, 1, 1, 1, 1, 1,
0.7359819, -0.789781, 2.084062, 0, 0, 1, 1, 1,
0.7360141, -1.619126, 1.986758, 1, 0, 0, 1, 1,
0.7375322, -0.2780667, 1.354319, 1, 0, 0, 1, 1,
0.7380099, -0.4133906, 2.597665, 1, 0, 0, 1, 1,
0.7522931, -0.6444759, 1.530979, 1, 0, 0, 1, 1,
0.7578245, 0.8559201, 1.575331, 1, 0, 0, 1, 1,
0.7588446, 1.381948, -0.4947431, 0, 0, 0, 1, 1,
0.7611078, -0.7233673, 3.286187, 0, 0, 0, 1, 1,
0.7642564, -0.8730037, 2.996598, 0, 0, 0, 1, 1,
0.765309, 0.5970824, 1.400428, 0, 0, 0, 1, 1,
0.7662307, -1.76637, 3.401667, 0, 0, 0, 1, 1,
0.7719411, 0.0105078, 1.562478, 0, 0, 0, 1, 1,
0.7719532, -0.4313188, 1.511532, 0, 0, 0, 1, 1,
0.7749278, 1.503152, 2.256062, 1, 1, 1, 1, 1,
0.7798329, -1.391366, 1.680925, 1, 1, 1, 1, 1,
0.7801744, -0.5276017, 1.788371, 1, 1, 1, 1, 1,
0.7822911, 0.5069309, 1.425418, 1, 1, 1, 1, 1,
0.7823147, 0.08505423, 1.355767, 1, 1, 1, 1, 1,
0.7889524, -0.9169372, 3.783159, 1, 1, 1, 1, 1,
0.7918801, 1.231842, -0.2763611, 1, 1, 1, 1, 1,
0.7919888, 0.3524244, 1.092011, 1, 1, 1, 1, 1,
0.7946303, 1.316387, 1.944827, 1, 1, 1, 1, 1,
0.8005477, 0.5398515, 1.13293, 1, 1, 1, 1, 1,
0.8045864, -0.7290766, 2.740248, 1, 1, 1, 1, 1,
0.8071288, 0.3620527, -1.139763, 1, 1, 1, 1, 1,
0.8091029, 0.3192556, 2.074552, 1, 1, 1, 1, 1,
0.8091554, -0.5886918, 2.487611, 1, 1, 1, 1, 1,
0.8103529, -2.52089, 3.295415, 1, 1, 1, 1, 1,
0.8118989, 1.104962, -0.5045351, 0, 0, 1, 1, 1,
0.8150346, 0.440464, 0.776704, 1, 0, 0, 1, 1,
0.8162474, -2.471505, 0.6092107, 1, 0, 0, 1, 1,
0.8177779, -2.017492, 1.746575, 1, 0, 0, 1, 1,
0.8177819, -1.024434, 2.767062, 1, 0, 0, 1, 1,
0.8215849, 0.1871339, 1.955583, 1, 0, 0, 1, 1,
0.8263915, -0.06831447, 0.2887031, 0, 0, 0, 1, 1,
0.8281482, 0.5273536, 1.616508, 0, 0, 0, 1, 1,
0.8285328, -0.4618618, 1.30126, 0, 0, 0, 1, 1,
0.8294847, -0.4938089, 1.529543, 0, 0, 0, 1, 1,
0.830825, 0.3397394, 1.76588, 0, 0, 0, 1, 1,
0.8344499, -0.1415717, 1.790305, 0, 0, 0, 1, 1,
0.8348101, -0.5915422, 2.109318, 0, 0, 0, 1, 1,
0.835821, -0.2032221, 2.113594, 1, 1, 1, 1, 1,
0.8403102, 0.2445969, 1.632613, 1, 1, 1, 1, 1,
0.8425116, -0.1258927, 2.735971, 1, 1, 1, 1, 1,
0.8499475, -1.143669, 2.749688, 1, 1, 1, 1, 1,
0.8499866, -0.1830157, 2.407929, 1, 1, 1, 1, 1,
0.8530709, 0.2248654, 1.363668, 1, 1, 1, 1, 1,
0.860575, 0.07546052, 2.681248, 1, 1, 1, 1, 1,
0.8623248, 1.160026, 0.1391921, 1, 1, 1, 1, 1,
0.8661187, 0.3895502, 0.6391158, 1, 1, 1, 1, 1,
0.8692752, 0.274736, 2.708212, 1, 1, 1, 1, 1,
0.8698444, 0.708289, -1.74912, 1, 1, 1, 1, 1,
0.8732, -0.01648699, 1.447048, 1, 1, 1, 1, 1,
0.873639, 0.01890303, 1.10227, 1, 1, 1, 1, 1,
0.8738174, -0.6381739, 2.169135, 1, 1, 1, 1, 1,
0.8876202, -0.06202884, 2.298085, 1, 1, 1, 1, 1,
0.8902268, -0.8816304, 1.979354, 0, 0, 1, 1, 1,
0.8911213, 1.568295, -0.3791834, 1, 0, 0, 1, 1,
0.8966639, 0.6971826, 0.738853, 1, 0, 0, 1, 1,
0.9007149, -2.389303, 3.280821, 1, 0, 0, 1, 1,
0.9036651, -0.3543901, 2.834439, 1, 0, 0, 1, 1,
0.9119491, 1.083496, 1.801974, 1, 0, 0, 1, 1,
0.9205782, -0.4421071, 2.432153, 0, 0, 0, 1, 1,
0.9234829, 0.7327413, 0.033489, 0, 0, 0, 1, 1,
0.9240535, 0.5899698, 0.113801, 0, 0, 0, 1, 1,
0.9243129, 0.4414277, 0.873453, 0, 0, 0, 1, 1,
0.9261498, 0.8884719, 0.9529611, 0, 0, 0, 1, 1,
0.9282647, -0.9509624, 2.293402, 0, 0, 0, 1, 1,
0.9390883, -0.7988291, 1.114862, 0, 0, 0, 1, 1,
0.941727, 1.54428, 1.322389, 1, 1, 1, 1, 1,
0.9438121, -0.6944258, 2.491778, 1, 1, 1, 1, 1,
0.9475839, -0.2540039, 2.075641, 1, 1, 1, 1, 1,
0.9524017, 1.434517, 2.04982, 1, 1, 1, 1, 1,
0.9691576, 1.203714, 1.786426, 1, 1, 1, 1, 1,
0.9695634, -0.3161916, 3.755895, 1, 1, 1, 1, 1,
0.9794643, -1.651318, 1.632609, 1, 1, 1, 1, 1,
0.9801124, -0.03546012, 2.312269, 1, 1, 1, 1, 1,
0.9861308, 2.634163, -0.01320675, 1, 1, 1, 1, 1,
0.9872584, 0.317436, 0.8009078, 1, 1, 1, 1, 1,
0.9960186, -0.2670484, 1.993737, 1, 1, 1, 1, 1,
0.9970995, -0.1089823, 0.4058715, 1, 1, 1, 1, 1,
0.9988756, -0.5841056, 2.174988, 1, 1, 1, 1, 1,
0.9990557, -0.9904256, 3.49067, 1, 1, 1, 1, 1,
1.002412, 2.206047, 0.5953921, 1, 1, 1, 1, 1,
1.004811, 0.8409741, 1.991668, 0, 0, 1, 1, 1,
1.013079, 0.6794865, 0.7149023, 1, 0, 0, 1, 1,
1.014861, 0.6538274, 0.9894843, 1, 0, 0, 1, 1,
1.020415, -0.1686325, 2.865551, 1, 0, 0, 1, 1,
1.025566, 0.2624185, 1.193518, 1, 0, 0, 1, 1,
1.027926, 0.3869934, 0.5218815, 1, 0, 0, 1, 1,
1.029022, -0.9798905, 2.653687, 0, 0, 0, 1, 1,
1.03025, 1.085845, 0.2815162, 0, 0, 0, 1, 1,
1.037429, 0.1812849, 3.59943, 0, 0, 0, 1, 1,
1.037783, -1.120938, 1.510709, 0, 0, 0, 1, 1,
1.041844, -1.447977, 2.625054, 0, 0, 0, 1, 1,
1.04219, 0.478622, 1.19662, 0, 0, 0, 1, 1,
1.044357, 0.9337453, 0.3813198, 0, 0, 0, 1, 1,
1.048359, -0.6122879, 2.68627, 1, 1, 1, 1, 1,
1.049166, 0.8250811, 1.987875, 1, 1, 1, 1, 1,
1.063136, -0.3732418, 1.034959, 1, 1, 1, 1, 1,
1.068666, -0.8034452, 0.9860988, 1, 1, 1, 1, 1,
1.068942, 0.5214416, 1.594512, 1, 1, 1, 1, 1,
1.075106, -0.1608554, 1.588821, 1, 1, 1, 1, 1,
1.079116, 2.670536, 1.833498, 1, 1, 1, 1, 1,
1.08359, 1.428661, -0.3927428, 1, 1, 1, 1, 1,
1.09651, 0.295012, -0.00404532, 1, 1, 1, 1, 1,
1.098359, -0.4645597, 3.145838, 1, 1, 1, 1, 1,
1.098764, 0.1021437, 0.7193007, 1, 1, 1, 1, 1,
1.09963, 1.212464, -0.1127162, 1, 1, 1, 1, 1,
1.105908, -0.1545313, 2.477485, 1, 1, 1, 1, 1,
1.108117, -1.37231, 1.836505, 1, 1, 1, 1, 1,
1.108195, 0.01903559, 2.10664, 1, 1, 1, 1, 1,
1.109434, -0.745944, 2.500103, 0, 0, 1, 1, 1,
1.119281, 0.465262, -1.007857, 1, 0, 0, 1, 1,
1.1193, -0.3449546, 0.2751063, 1, 0, 0, 1, 1,
1.123558, 0.2205962, 1.494601, 1, 0, 0, 1, 1,
1.124593, -2.361062, 3.615929, 1, 0, 0, 1, 1,
1.132619, 0.9326687, 0.809583, 1, 0, 0, 1, 1,
1.133905, -0.6437919, 3.20893, 0, 0, 0, 1, 1,
1.137298, -0.6245204, 2.348004, 0, 0, 0, 1, 1,
1.139427, -1.047857, 2.455969, 0, 0, 0, 1, 1,
1.140161, -1.2747, 2.611898, 0, 0, 0, 1, 1,
1.144444, -0.4672745, 3.634267, 0, 0, 0, 1, 1,
1.144647, -0.5963109, 2.54547, 0, 0, 0, 1, 1,
1.145349, 2.656055, -0.1341618, 0, 0, 0, 1, 1,
1.152542, 1.332147, -0.5324557, 1, 1, 1, 1, 1,
1.156797, 1.451275, 0.2183717, 1, 1, 1, 1, 1,
1.159523, -0.3974314, 3.889739, 1, 1, 1, 1, 1,
1.16082, -0.1287419, 1.606192, 1, 1, 1, 1, 1,
1.161273, 0.5470146, 1.934128, 1, 1, 1, 1, 1,
1.165797, -1.230492, 2.901877, 1, 1, 1, 1, 1,
1.169456, 0.736189, 1.126204, 1, 1, 1, 1, 1,
1.17973, 0.9960361, 2.040185, 1, 1, 1, 1, 1,
1.180951, -0.4319924, 0.9090515, 1, 1, 1, 1, 1,
1.183742, 0.6510051, 1.31475, 1, 1, 1, 1, 1,
1.197247, -1.491871, 3.452866, 1, 1, 1, 1, 1,
1.197728, 1.996022, 2.215871, 1, 1, 1, 1, 1,
1.207367, 0.1194865, 0.6234218, 1, 1, 1, 1, 1,
1.216632, 0.8719758, 0.4547051, 1, 1, 1, 1, 1,
1.226001, 1.067454, 0.8430441, 1, 1, 1, 1, 1,
1.226766, -0.6957394, 3.617803, 0, 0, 1, 1, 1,
1.246411, 0.712019, 2.140992, 1, 0, 0, 1, 1,
1.249754, 0.2273743, 1.643299, 1, 0, 0, 1, 1,
1.250349, 0.642876, 1.243914, 1, 0, 0, 1, 1,
1.253163, -0.2660836, 1.812593, 1, 0, 0, 1, 1,
1.255178, -0.05733736, 0.8578917, 1, 0, 0, 1, 1,
1.259679, -1.036403, 3.216202, 0, 0, 0, 1, 1,
1.261945, -1.114989, 1.259156, 0, 0, 0, 1, 1,
1.263067, -0.1219064, 1.34872, 0, 0, 0, 1, 1,
1.27099, -0.4627195, 0.8058311, 0, 0, 0, 1, 1,
1.278032, -0.2842106, 1.911052, 0, 0, 0, 1, 1,
1.278491, 0.7584485, 2.256012, 0, 0, 0, 1, 1,
1.281879, -1.297652, 3.583159, 0, 0, 0, 1, 1,
1.289064, -0.5170873, 2.780324, 1, 1, 1, 1, 1,
1.2967, -0.8911629, 3.798358, 1, 1, 1, 1, 1,
1.30052, 0.1201093, -0.9228472, 1, 1, 1, 1, 1,
1.306347, 1.51651, 1.853878, 1, 1, 1, 1, 1,
1.310922, -0.02780957, 2.697324, 1, 1, 1, 1, 1,
1.316762, -0.6555609, 2.45184, 1, 1, 1, 1, 1,
1.321205, 0.6985465, 0.7767355, 1, 1, 1, 1, 1,
1.324086, -0.4447314, 3.237446, 1, 1, 1, 1, 1,
1.332412, 1.623384, 1.654722, 1, 1, 1, 1, 1,
1.347739, 0.1463316, -0.6042834, 1, 1, 1, 1, 1,
1.349657, 0.08179651, 1.39689, 1, 1, 1, 1, 1,
1.355093, 1.004136, 0.4128745, 1, 1, 1, 1, 1,
1.357551, 0.02600177, -0.7679131, 1, 1, 1, 1, 1,
1.359467, 0.7121056, 2.337592, 1, 1, 1, 1, 1,
1.372723, -0.5028348, 2.945061, 1, 1, 1, 1, 1,
1.384165, 1.529012, -0.5749726, 0, 0, 1, 1, 1,
1.390385, -1.622722, 4.026852, 1, 0, 0, 1, 1,
1.392391, -0.6319796, 0.342395, 1, 0, 0, 1, 1,
1.395867, 0.8928879, 1.457398, 1, 0, 0, 1, 1,
1.401903, 1.515401, 0.9143822, 1, 0, 0, 1, 1,
1.402938, 1.599297, 1.358222, 1, 0, 0, 1, 1,
1.403606, -0.2626747, 1.10707, 0, 0, 0, 1, 1,
1.405491, 0.4707982, 0.7873275, 0, 0, 0, 1, 1,
1.410975, 1.0206, 2.282101, 0, 0, 0, 1, 1,
1.411979, 0.3255503, 1.18023, 0, 0, 0, 1, 1,
1.427961, 1.336029, -0.4150345, 0, 0, 0, 1, 1,
1.434701, 0.6009123, 2.017982, 0, 0, 0, 1, 1,
1.434897, 1.025865, 1.419887, 0, 0, 0, 1, 1,
1.441855, -0.6156942, 1.764139, 1, 1, 1, 1, 1,
1.445085, -0.7755082, 1.883226, 1, 1, 1, 1, 1,
1.449742, 0.3478028, 0.3819192, 1, 1, 1, 1, 1,
1.466393, -1.45252, 4.869334, 1, 1, 1, 1, 1,
1.474477, -0.3918111, 1.374339, 1, 1, 1, 1, 1,
1.488377, 0.2457075, 1.368277, 1, 1, 1, 1, 1,
1.49286, 0.4246086, 0.3664212, 1, 1, 1, 1, 1,
1.4953, -0.9072828, 1.567255, 1, 1, 1, 1, 1,
1.497504, 0.3150133, 0.5843819, 1, 1, 1, 1, 1,
1.501156, -0.1500888, 1.313677, 1, 1, 1, 1, 1,
1.507396, 0.7903873, 0.5205163, 1, 1, 1, 1, 1,
1.52794, 0.3672782, 0.8972493, 1, 1, 1, 1, 1,
1.528124, -0.485079, 0.6297851, 1, 1, 1, 1, 1,
1.535167, -0.2632724, 1.079678, 1, 1, 1, 1, 1,
1.538198, 0.3124897, 2.85232, 1, 1, 1, 1, 1,
1.553142, -1.594364, 1.964175, 0, 0, 1, 1, 1,
1.563542, 0.4495848, 1.305995, 1, 0, 0, 1, 1,
1.595814, 0.2127659, 1.049989, 1, 0, 0, 1, 1,
1.617909, 0.2654366, 0.2388535, 1, 0, 0, 1, 1,
1.639607, 1.156275, -0.5165525, 1, 0, 0, 1, 1,
1.672142, -0.5093249, 2.87138, 1, 0, 0, 1, 1,
1.67609, 0.563444, 1.442338, 0, 0, 0, 1, 1,
1.676778, 0.3836476, 2.191929, 0, 0, 0, 1, 1,
1.686819, 0.4787897, 1.64749, 0, 0, 0, 1, 1,
1.697922, 0.8804438, 1.072308, 0, 0, 0, 1, 1,
1.69966, 0.6047707, 2.094863, 0, 0, 0, 1, 1,
1.702297, 0.3846504, 1.850084, 0, 0, 0, 1, 1,
1.724737, 0.179653, 0.716996, 0, 0, 0, 1, 1,
1.736716, -1.563231, 4.016022, 1, 1, 1, 1, 1,
1.752365, -0.1246551, 2.378397, 1, 1, 1, 1, 1,
1.755201, -0.7155816, 2.999704, 1, 1, 1, 1, 1,
1.759603, -0.8641164, 2.471421, 1, 1, 1, 1, 1,
1.772699, -1.384547, 3.494987, 1, 1, 1, 1, 1,
1.788986, 0.6072429, 1.300094, 1, 1, 1, 1, 1,
1.793581, 0.6338316, -0.6633622, 1, 1, 1, 1, 1,
1.822278, 0.9486195, 1.350436, 1, 1, 1, 1, 1,
1.829146, -1.198936, 2.230586, 1, 1, 1, 1, 1,
1.849605, 1.521914, 1.717035, 1, 1, 1, 1, 1,
1.857197, -0.6289259, 2.146631, 1, 1, 1, 1, 1,
1.88257, 0.01530374, 1.725862, 1, 1, 1, 1, 1,
1.974175, 1.256887, 0.7791588, 1, 1, 1, 1, 1,
1.981458, 0.3348075, 2.049, 1, 1, 1, 1, 1,
1.995755, 1.043578, 0.2799489, 1, 1, 1, 1, 1,
2.086899, 1.523239, -0.05738951, 0, 0, 1, 1, 1,
2.090189, -1.191686, 1.459006, 1, 0, 0, 1, 1,
2.11277, 0.4415055, 1.520176, 1, 0, 0, 1, 1,
2.196551, -0.1865045, -0.3727161, 1, 0, 0, 1, 1,
2.243061, 0.5891101, 2.141811, 1, 0, 0, 1, 1,
2.331278, 0.1187465, -0.1542146, 1, 0, 0, 1, 1,
2.334633, -0.01560832, -0.5107877, 0, 0, 0, 1, 1,
2.348529, 0.5451509, 0.6278289, 0, 0, 0, 1, 1,
2.35866, -0.5123895, 1.362876, 0, 0, 0, 1, 1,
2.362667, 0.3382609, 1.044128, 0, 0, 0, 1, 1,
2.404837, -0.9795972, 1.144882, 0, 0, 0, 1, 1,
2.411422, 1.771591, 0.5147531, 0, 0, 0, 1, 1,
2.412271, -0.2836275, 3.023843, 0, 0, 0, 1, 1,
2.434755, -1.384772, 3.659898, 1, 1, 1, 1, 1,
2.469901, 0.2752181, 2.278205, 1, 1, 1, 1, 1,
2.476155, 0.8008142, 2.404333, 1, 1, 1, 1, 1,
2.483422, 0.2792444, 1.104058, 1, 1, 1, 1, 1,
2.567227, 1.616544, -0.03142878, 1, 1, 1, 1, 1,
2.615572, 0.9110389, 2.073228, 1, 1, 1, 1, 1,
2.688439, 0.1850243, 1.72999, 1, 1, 1, 1, 1
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
var radius = 9.065842;
var distance = 31.84339;
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
mvMatrix.translate( 0.1252456, -0.03057718, -0.01964307 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.84339);
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
