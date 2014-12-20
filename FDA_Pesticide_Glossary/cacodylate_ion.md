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
-4.316404, -2.3726, -2.12067, 1, 0, 0, 1,
-3.322609, -0.0646112, -3.501848, 1, 0.007843138, 0, 1,
-2.692288, 1.185591, -0.6011246, 1, 0.01176471, 0, 1,
-2.679257, 1.256819, -1.681896, 1, 0.01960784, 0, 1,
-2.594826, -0.6706289, -0.331714, 1, 0.02352941, 0, 1,
-2.565501, -0.8357191, -1.809348, 1, 0.03137255, 0, 1,
-2.550072, -0.54844, -1.340411, 1, 0.03529412, 0, 1,
-2.439728, -1.941271, -2.38957, 1, 0.04313726, 0, 1,
-2.408954, -0.7130239, -1.393418, 1, 0.04705882, 0, 1,
-2.400221, -0.5363259, -2.962608, 1, 0.05490196, 0, 1,
-2.389897, -0.9775666, -2.436317, 1, 0.05882353, 0, 1,
-2.340543, 0.2385589, -1.743847, 1, 0.06666667, 0, 1,
-2.297931, -1.066066, -0.824648, 1, 0.07058824, 0, 1,
-2.250465, -1.39172, -2.312093, 1, 0.07843138, 0, 1,
-2.245283, -1.880109, -0.0617872, 1, 0.08235294, 0, 1,
-2.1969, 0.2576605, -1.211939, 1, 0.09019608, 0, 1,
-2.148653, 0.2922882, -0.5749676, 1, 0.09411765, 0, 1,
-2.145113, 0.2488604, -1.155856, 1, 0.1019608, 0, 1,
-2.093029, -0.6163623, -1.722568, 1, 0.1098039, 0, 1,
-2.088531, -1.121055, -2.019049, 1, 0.1137255, 0, 1,
-2.075465, -1.006847, -2.952584, 1, 0.1215686, 0, 1,
-2.051366, -1.615915, -0.7782388, 1, 0.1254902, 0, 1,
-2.004103, 0.5552365, -2.356028, 1, 0.1333333, 0, 1,
-1.996323, -1.347793, -2.519288, 1, 0.1372549, 0, 1,
-1.99228, 2.393759, -0.8129326, 1, 0.145098, 0, 1,
-1.962495, 0.6987732, -1.282573, 1, 0.1490196, 0, 1,
-1.944225, 1.433345, -0.1469673, 1, 0.1568628, 0, 1,
-1.9351, 0.8756772, -0.4222009, 1, 0.1607843, 0, 1,
-1.911295, 0.959447, -1.046099, 1, 0.1686275, 0, 1,
-1.902581, 0.1067556, -0.8220459, 1, 0.172549, 0, 1,
-1.884825, -0.6165203, -2.651493, 1, 0.1803922, 0, 1,
-1.879155, 0.08089387, -0.7759878, 1, 0.1843137, 0, 1,
-1.874217, 0.003421752, -0.8534667, 1, 0.1921569, 0, 1,
-1.852281, -0.3941403, -2.092558, 1, 0.1960784, 0, 1,
-1.840233, -0.07781115, -2.798762, 1, 0.2039216, 0, 1,
-1.833824, 2.112816, -2.033403, 1, 0.2117647, 0, 1,
-1.831228, 0.2336342, -2.712287, 1, 0.2156863, 0, 1,
-1.821633, 1.873856, -1.302412, 1, 0.2235294, 0, 1,
-1.796245, -0.5404927, -2.909769, 1, 0.227451, 0, 1,
-1.789698, -2.424122, -2.721604, 1, 0.2352941, 0, 1,
-1.783708, 2.418861, -0.2367417, 1, 0.2392157, 0, 1,
-1.771461, -1.580847, -1.393294, 1, 0.2470588, 0, 1,
-1.745012, 0.2698803, -1.175447, 1, 0.2509804, 0, 1,
-1.738266, -0.8209519, -3.903199, 1, 0.2588235, 0, 1,
-1.72557, -0.7497295, -1.658611, 1, 0.2627451, 0, 1,
-1.689691, 1.614105, -0.9538831, 1, 0.2705882, 0, 1,
-1.688264, -1.578344, -1.341958, 1, 0.2745098, 0, 1,
-1.673647, -0.379477, 0.1514188, 1, 0.282353, 0, 1,
-1.672718, 0.5034107, -1.474397, 1, 0.2862745, 0, 1,
-1.659313, -0.644521, -2.894181, 1, 0.2941177, 0, 1,
-1.65887, 1.378869, -2.553782, 1, 0.3019608, 0, 1,
-1.652928, 0.5416254, -1.683978, 1, 0.3058824, 0, 1,
-1.628117, -0.4078341, -2.754462, 1, 0.3137255, 0, 1,
-1.616516, -2.526217, -2.100707, 1, 0.3176471, 0, 1,
-1.593494, 0.8535511, -2.09951, 1, 0.3254902, 0, 1,
-1.588764, -0.2983094, -1.81469, 1, 0.3294118, 0, 1,
-1.588036, 0.5633268, -2.385331, 1, 0.3372549, 0, 1,
-1.579769, -1.868742, -0.09986803, 1, 0.3411765, 0, 1,
-1.575145, 0.8875051, -1.136257, 1, 0.3490196, 0, 1,
-1.570889, 1.163381, -1.493378, 1, 0.3529412, 0, 1,
-1.570403, -1.01082, -1.453415, 1, 0.3607843, 0, 1,
-1.566863, -0.3053928, -1.585453, 1, 0.3647059, 0, 1,
-1.556528, -2.009451, -2.364732, 1, 0.372549, 0, 1,
-1.554053, -1.112114, -0.654539, 1, 0.3764706, 0, 1,
-1.55401, -0.004459875, -3.025759, 1, 0.3843137, 0, 1,
-1.53855, -0.2809781, -2.255844, 1, 0.3882353, 0, 1,
-1.535337, -0.6964414, -1.942217, 1, 0.3960784, 0, 1,
-1.532874, 1.172137, 0.1404867, 1, 0.4039216, 0, 1,
-1.532458, 0.5664012, 0.7070639, 1, 0.4078431, 0, 1,
-1.526489, 0.87143, -3.082391, 1, 0.4156863, 0, 1,
-1.52193, 0.05897164, -0.2592631, 1, 0.4196078, 0, 1,
-1.511964, -0.9859182, -0.2924262, 1, 0.427451, 0, 1,
-1.503796, -1.098711, -1.791664, 1, 0.4313726, 0, 1,
-1.50303, -0.02554426, -1.178819, 1, 0.4392157, 0, 1,
-1.50025, 2.091364, -2.322374, 1, 0.4431373, 0, 1,
-1.49049, -0.6910817, -3.887271, 1, 0.4509804, 0, 1,
-1.478605, -1.379327, -2.180904, 1, 0.454902, 0, 1,
-1.476924, 0.3428847, -1.243167, 1, 0.4627451, 0, 1,
-1.464607, 1.167511, -1.399355, 1, 0.4666667, 0, 1,
-1.45423, -1.310011, -2.831094, 1, 0.4745098, 0, 1,
-1.451659, 0.3366313, -1.501834, 1, 0.4784314, 0, 1,
-1.451652, -0.5194494, -2.466372, 1, 0.4862745, 0, 1,
-1.44884, -0.6562226, -3.862217, 1, 0.4901961, 0, 1,
-1.43604, -0.3488614, -1.872456, 1, 0.4980392, 0, 1,
-1.433067, -0.2748611, 0.07502995, 1, 0.5058824, 0, 1,
-1.423862, 0.8011997, -1.489259, 1, 0.509804, 0, 1,
-1.416172, -0.07825188, -1.177814, 1, 0.5176471, 0, 1,
-1.413726, 0.5790504, -1.038275, 1, 0.5215687, 0, 1,
-1.412792, -0.7278682, -1.842455, 1, 0.5294118, 0, 1,
-1.410054, -0.8690802, -0.8946044, 1, 0.5333334, 0, 1,
-1.407573, -0.1031894, -2.540257, 1, 0.5411765, 0, 1,
-1.406993, -0.4811637, -2.55921, 1, 0.5450981, 0, 1,
-1.398268, -0.8006536, -1.361705, 1, 0.5529412, 0, 1,
-1.390943, -0.0252643, -2.541728, 1, 0.5568628, 0, 1,
-1.387576, -0.1559913, -2.125069, 1, 0.5647059, 0, 1,
-1.38583, -0.06182786, -1.568709, 1, 0.5686275, 0, 1,
-1.365627, 0.4050284, -0.6440105, 1, 0.5764706, 0, 1,
-1.352107, -1.365057, -2.371265, 1, 0.5803922, 0, 1,
-1.351822, -0.1687295, -2.871248, 1, 0.5882353, 0, 1,
-1.341679, 0.3177462, -1.135395, 1, 0.5921569, 0, 1,
-1.34104, 2.059292, -1.21818, 1, 0.6, 0, 1,
-1.333954, 1.864519, -0.3262543, 1, 0.6078432, 0, 1,
-1.316199, 0.2749784, -1.115335, 1, 0.6117647, 0, 1,
-1.311767, 0.1985776, -1.974509, 1, 0.6196079, 0, 1,
-1.311127, 0.7900982, -0.9173382, 1, 0.6235294, 0, 1,
-1.311051, -0.2682469, -0.8406371, 1, 0.6313726, 0, 1,
-1.309797, -0.7666268, -2.973899, 1, 0.6352941, 0, 1,
-1.309585, -1.348037, -3.345743, 1, 0.6431373, 0, 1,
-1.307854, 0.932384, 0.9884961, 1, 0.6470588, 0, 1,
-1.306176, -0.9482996, -0.9562491, 1, 0.654902, 0, 1,
-1.294372, -0.909242, -3.063526, 1, 0.6588235, 0, 1,
-1.293721, 0.9175943, -1.479979, 1, 0.6666667, 0, 1,
-1.29361, -0.08567801, 0.6605296, 1, 0.6705883, 0, 1,
-1.292551, 0.263583, 0.08349405, 1, 0.6784314, 0, 1,
-1.291496, 1.500161, -1.673772, 1, 0.682353, 0, 1,
-1.290522, 1.310963, -1.043565, 1, 0.6901961, 0, 1,
-1.280894, 0.8609994, -1.136986, 1, 0.6941177, 0, 1,
-1.273712, -0.1371773, -0.4853796, 1, 0.7019608, 0, 1,
-1.264545, 1.49601, 1.122319, 1, 0.7098039, 0, 1,
-1.253881, 0.5129638, -0.6608168, 1, 0.7137255, 0, 1,
-1.236232, 0.5674824, -3.035157, 1, 0.7215686, 0, 1,
-1.230698, -0.03252411, -1.39502, 1, 0.7254902, 0, 1,
-1.22897, -2.541802, -2.839178, 1, 0.7333333, 0, 1,
-1.227271, -2.22182, -3.845977, 1, 0.7372549, 0, 1,
-1.224162, -0.2611122, -2.069078, 1, 0.7450981, 0, 1,
-1.217068, 1.698802, 0.7353932, 1, 0.7490196, 0, 1,
-1.211705, 0.8683639, -1.833929, 1, 0.7568628, 0, 1,
-1.203672, 1.005038, -1.768351, 1, 0.7607843, 0, 1,
-1.201891, 0.6105185, 0.6137714, 1, 0.7686275, 0, 1,
-1.19887, -0.4822962, 0.02353128, 1, 0.772549, 0, 1,
-1.198548, 0.1370724, -0.9841478, 1, 0.7803922, 0, 1,
-1.194364, -0.008098922, -1.540825, 1, 0.7843137, 0, 1,
-1.190472, 1.407336, 0.05503553, 1, 0.7921569, 0, 1,
-1.18181, -2.205226, -2.027869, 1, 0.7960784, 0, 1,
-1.176523, -0.4216998, -1.645186, 1, 0.8039216, 0, 1,
-1.174625, 0.8061724, -1.42451, 1, 0.8117647, 0, 1,
-1.171096, -0.8783959, -3.379545, 1, 0.8156863, 0, 1,
-1.168946, 1.828782, -1.322458, 1, 0.8235294, 0, 1,
-1.162433, 1.200652, -2.576874, 1, 0.827451, 0, 1,
-1.160998, -0.8199049, -2.723295, 1, 0.8352941, 0, 1,
-1.139276, 1.199221, -0.5918171, 1, 0.8392157, 0, 1,
-1.138486, -0.3430153, -1.684957, 1, 0.8470588, 0, 1,
-1.133844, 0.774511, 0.1762684, 1, 0.8509804, 0, 1,
-1.132321, 0.3638746, -1.331694, 1, 0.8588235, 0, 1,
-1.123389, 0.761453, -2.151062, 1, 0.8627451, 0, 1,
-1.118726, 0.1967253, -1.545516, 1, 0.8705882, 0, 1,
-1.113655, -0.691408, -2.963241, 1, 0.8745098, 0, 1,
-1.11175, -1.341339, -1.180571, 1, 0.8823529, 0, 1,
-1.110298, -0.5918202, -0.679531, 1, 0.8862745, 0, 1,
-1.104632, 1.628116, -0.4538909, 1, 0.8941177, 0, 1,
-1.100769, 0.1662007, -1.842818, 1, 0.8980392, 0, 1,
-1.100613, -0.2229995, -1.533825, 1, 0.9058824, 0, 1,
-1.097159, -0.142529, -2.306892, 1, 0.9137255, 0, 1,
-1.096296, 1.54502, 0.4720343, 1, 0.9176471, 0, 1,
-1.095412, 0.400994, 0.1045971, 1, 0.9254902, 0, 1,
-1.09435, -0.2565731, -1.541226, 1, 0.9294118, 0, 1,
-1.093628, 1.200203, 0.3957986, 1, 0.9372549, 0, 1,
-1.077051, 0.6018858, -1.695135, 1, 0.9411765, 0, 1,
-1.07214, -1.044329, -3.870351, 1, 0.9490196, 0, 1,
-1.067722, 1.834297, -0.1462924, 1, 0.9529412, 0, 1,
-1.065789, -1.198471, -2.582205, 1, 0.9607843, 0, 1,
-1.059193, -0.2789637, -2.219156, 1, 0.9647059, 0, 1,
-1.05787, 0.8443595, -0.07645085, 1, 0.972549, 0, 1,
-1.052934, 0.3384184, -1.229258, 1, 0.9764706, 0, 1,
-1.050902, -0.7135859, -2.719874, 1, 0.9843137, 0, 1,
-1.046186, -0.4032716, -2.005738, 1, 0.9882353, 0, 1,
-1.045478, -1.135871, -3.095281, 1, 0.9960784, 0, 1,
-1.037193, 0.577214, -0.8592002, 0.9960784, 1, 0, 1,
-1.031585, 0.05117302, -3.983677, 0.9921569, 1, 0, 1,
-1.030607, 1.233715, 1.233263, 0.9843137, 1, 0, 1,
-1.022532, -1.056489, -3.303161, 0.9803922, 1, 0, 1,
-1.022157, -0.2384426, -2.495384, 0.972549, 1, 0, 1,
-1.020627, -0.2920018, -1.752762, 0.9686275, 1, 0, 1,
-1.015791, 1.050832, 0.8738213, 0.9607843, 1, 0, 1,
-1.014048, -1.202868, -2.36817, 0.9568627, 1, 0, 1,
-1.004712, -0.8189265, -0.6737351, 0.9490196, 1, 0, 1,
-1.003289, 0.5486382, -0.72395, 0.945098, 1, 0, 1,
-0.9940637, 0.1857648, -1.937744, 0.9372549, 1, 0, 1,
-0.9909698, -1.084613, -3.125849, 0.9333333, 1, 0, 1,
-0.9858716, 1.627599, 0.8560961, 0.9254902, 1, 0, 1,
-0.9855418, 0.8998416, -2.990236, 0.9215686, 1, 0, 1,
-0.9829859, -0.5761931, -2.874309, 0.9137255, 1, 0, 1,
-0.9541909, -1.654686, -3.808156, 0.9098039, 1, 0, 1,
-0.9537069, 0.2758219, -0.8653885, 0.9019608, 1, 0, 1,
-0.9483592, -1.860754, -2.539695, 0.8941177, 1, 0, 1,
-0.9470698, -1.119717, -3.579594, 0.8901961, 1, 0, 1,
-0.9427575, 0.121378, -1.664662, 0.8823529, 1, 0, 1,
-0.9413987, -0.0430175, -3.681681, 0.8784314, 1, 0, 1,
-0.9388054, -0.2971542, -1.567512, 0.8705882, 1, 0, 1,
-0.9341701, -1.632959, -2.406242, 0.8666667, 1, 0, 1,
-0.9244751, -0.3304895, -3.011915, 0.8588235, 1, 0, 1,
-0.9122981, -0.7079631, -0.9301249, 0.854902, 1, 0, 1,
-0.9076306, 0.4780883, -2.022541, 0.8470588, 1, 0, 1,
-0.9068775, 0.6341069, 1.022954, 0.8431373, 1, 0, 1,
-0.9031739, 0.805204, -1.89165, 0.8352941, 1, 0, 1,
-0.9009156, 0.9110274, -0.2350389, 0.8313726, 1, 0, 1,
-0.8992521, -0.4728803, -1.404176, 0.8235294, 1, 0, 1,
-0.8929364, -1.622257, -3.169521, 0.8196079, 1, 0, 1,
-0.8864251, 0.0880558, -0.4239396, 0.8117647, 1, 0, 1,
-0.8840269, 0.1395951, -2.582911, 0.8078431, 1, 0, 1,
-0.8736835, -1.288398, -2.275783, 0.8, 1, 0, 1,
-0.8701341, 0.2109092, -0.7449709, 0.7921569, 1, 0, 1,
-0.8698894, 0.071304, -2.493329, 0.7882353, 1, 0, 1,
-0.8651657, -1.705185, -1.910521, 0.7803922, 1, 0, 1,
-0.856959, 0.5500284, -1.645899, 0.7764706, 1, 0, 1,
-0.8532332, -0.08643819, -2.533815, 0.7686275, 1, 0, 1,
-0.8480241, -2.062553, -1.874892, 0.7647059, 1, 0, 1,
-0.8477405, -0.7376133, -2.036136, 0.7568628, 1, 0, 1,
-0.8473554, -0.06628198, -1.126344, 0.7529412, 1, 0, 1,
-0.8421136, -0.5855817, -1.514802, 0.7450981, 1, 0, 1,
-0.8408593, -1.680276, -2.478188, 0.7411765, 1, 0, 1,
-0.8407045, -1.38393, -4.26283, 0.7333333, 1, 0, 1,
-0.8333632, -1.515275, -2.471965, 0.7294118, 1, 0, 1,
-0.8332316, 0.9701913, 0.1104127, 0.7215686, 1, 0, 1,
-0.8325888, -0.3786387, -0.8134354, 0.7176471, 1, 0, 1,
-0.8238533, -0.3041769, -3.012956, 0.7098039, 1, 0, 1,
-0.8225719, 0.4426025, -0.9992501, 0.7058824, 1, 0, 1,
-0.8211418, -0.5647, -1.018685, 0.6980392, 1, 0, 1,
-0.8134779, -0.3105575, -2.452569, 0.6901961, 1, 0, 1,
-0.811084, 0.08260176, 0.1765957, 0.6862745, 1, 0, 1,
-0.8097802, 0.3847458, -0.5706182, 0.6784314, 1, 0, 1,
-0.8082678, 0.6212038, -0.6534152, 0.6745098, 1, 0, 1,
-0.8040492, 0.07647534, -2.188656, 0.6666667, 1, 0, 1,
-0.8026613, -0.4879079, -2.040887, 0.6627451, 1, 0, 1,
-0.7958142, -1.456086, -2.167294, 0.654902, 1, 0, 1,
-0.7951248, -0.5234707, -3.502608, 0.6509804, 1, 0, 1,
-0.7917283, -0.06170072, -2.308047, 0.6431373, 1, 0, 1,
-0.787253, -0.7647099, -1.016747, 0.6392157, 1, 0, 1,
-0.7852691, -0.4005284, -0.4404346, 0.6313726, 1, 0, 1,
-0.779488, -0.2317639, -2.079186, 0.627451, 1, 0, 1,
-0.7739362, 0.1384408, -1.039466, 0.6196079, 1, 0, 1,
-0.7719566, -0.3858367, -2.064687, 0.6156863, 1, 0, 1,
-0.7713022, 0.519694, 0.3336262, 0.6078432, 1, 0, 1,
-0.7710872, -0.8049883, -1.891471, 0.6039216, 1, 0, 1,
-0.7710595, -0.4901825, -1.73278, 0.5960785, 1, 0, 1,
-0.7694582, 0.09083784, -0.6169338, 0.5882353, 1, 0, 1,
-0.7680013, -1.012328, -2.39991, 0.5843138, 1, 0, 1,
-0.7656192, -0.2908646, -0.2928845, 0.5764706, 1, 0, 1,
-0.7620311, 0.5922499, 0.9291028, 0.572549, 1, 0, 1,
-0.7581182, -1.085546, -2.949337, 0.5647059, 1, 0, 1,
-0.7557822, 0.07126433, -2.950558, 0.5607843, 1, 0, 1,
-0.7551027, 1.0799, 0.2665848, 0.5529412, 1, 0, 1,
-0.7540537, 0.3637874, -1.022728, 0.5490196, 1, 0, 1,
-0.7495646, -1.43565, -2.406018, 0.5411765, 1, 0, 1,
-0.7405045, 1.620599, 0.823572, 0.5372549, 1, 0, 1,
-0.7400507, 0.2513177, -1.179609, 0.5294118, 1, 0, 1,
-0.739887, 0.2021891, -1.733448, 0.5254902, 1, 0, 1,
-0.7370359, 0.836079, -0.4831238, 0.5176471, 1, 0, 1,
-0.7368279, 0.4988298, -1.312696, 0.5137255, 1, 0, 1,
-0.7339365, -0.444598, -3.031106, 0.5058824, 1, 0, 1,
-0.7321758, -2.727061, -0.09005187, 0.5019608, 1, 0, 1,
-0.7278035, 0.4583975, -1.176815, 0.4941176, 1, 0, 1,
-0.7275657, 0.824658, -0.7097539, 0.4862745, 1, 0, 1,
-0.7269221, -0.114224, 0.1124815, 0.4823529, 1, 0, 1,
-0.7235336, -0.6661308, -2.792662, 0.4745098, 1, 0, 1,
-0.7230145, -0.8707717, -2.457602, 0.4705882, 1, 0, 1,
-0.7228085, -1.588762, -3.353175, 0.4627451, 1, 0, 1,
-0.722519, -1.007155, -1.166192, 0.4588235, 1, 0, 1,
-0.719367, 0.5866135, -2.092843, 0.4509804, 1, 0, 1,
-0.7101117, -0.4423902, -1.081214, 0.4470588, 1, 0, 1,
-0.7091094, -0.8770803, -2.004687, 0.4392157, 1, 0, 1,
-0.7088786, -0.3791224, -2.820725, 0.4352941, 1, 0, 1,
-0.7084813, 1.687941, -0.9552437, 0.427451, 1, 0, 1,
-0.7045657, -0.827154, -3.538837, 0.4235294, 1, 0, 1,
-0.7038112, -1.367132, -3.675061, 0.4156863, 1, 0, 1,
-0.7037025, -1.507667, -0.3248894, 0.4117647, 1, 0, 1,
-0.7030289, -1.520304, -4.928495, 0.4039216, 1, 0, 1,
-0.692665, 1.23397, 0.1270208, 0.3960784, 1, 0, 1,
-0.683432, -0.4101383, -1.62268, 0.3921569, 1, 0, 1,
-0.6829425, -0.007118766, -1.522084, 0.3843137, 1, 0, 1,
-0.6825687, 1.291351, 0.6083452, 0.3803922, 1, 0, 1,
-0.6771542, 2.331978, -0.02127125, 0.372549, 1, 0, 1,
-0.6753491, 0.8132924, -1.49172, 0.3686275, 1, 0, 1,
-0.6736733, 0.6404215, -1.137551, 0.3607843, 1, 0, 1,
-0.6713938, -0.1228746, -2.537539, 0.3568628, 1, 0, 1,
-0.6688546, -0.3189189, -1.871765, 0.3490196, 1, 0, 1,
-0.6681221, -0.5699248, -2.394934, 0.345098, 1, 0, 1,
-0.6649929, -1.023702, -3.842762, 0.3372549, 1, 0, 1,
-0.6649405, 1.940626, -0.7541151, 0.3333333, 1, 0, 1,
-0.6645619, 0.08200756, -1.90372, 0.3254902, 1, 0, 1,
-0.6639737, 0.921482, -2.467647, 0.3215686, 1, 0, 1,
-0.6450151, 0.4467505, -1.699653, 0.3137255, 1, 0, 1,
-0.6419271, -0.6154205, -3.300692, 0.3098039, 1, 0, 1,
-0.6390412, -0.1216356, -0.9277906, 0.3019608, 1, 0, 1,
-0.6235405, 0.4654175, 0.07630301, 0.2941177, 1, 0, 1,
-0.6207445, 1.285174, 0.2823343, 0.2901961, 1, 0, 1,
-0.6202289, -0.5044318, -1.380158, 0.282353, 1, 0, 1,
-0.6131604, 0.6321422, -0.6728232, 0.2784314, 1, 0, 1,
-0.6119561, 1.530554, -1.061094, 0.2705882, 1, 0, 1,
-0.6072135, -0.5795134, -3.91301, 0.2666667, 1, 0, 1,
-0.6063398, 0.3825257, 0.1391535, 0.2588235, 1, 0, 1,
-0.6019425, 0.3900201, -0.7283319, 0.254902, 1, 0, 1,
-0.5974922, 0.3303201, -1.714136, 0.2470588, 1, 0, 1,
-0.5969347, 0.5921216, -0.5933844, 0.2431373, 1, 0, 1,
-0.5913225, -1.158399, -2.130111, 0.2352941, 1, 0, 1,
-0.5880302, 0.8772234, -0.9985107, 0.2313726, 1, 0, 1,
-0.5762032, 0.2251964, -2.553412, 0.2235294, 1, 0, 1,
-0.5737011, -1.175615, -1.847278, 0.2196078, 1, 0, 1,
-0.5732604, -1.585165, -2.051401, 0.2117647, 1, 0, 1,
-0.5728131, 0.08373699, 0.6429901, 0.2078431, 1, 0, 1,
-0.5684366, -0.7769824, -2.742884, 0.2, 1, 0, 1,
-0.566797, 0.5959578, -0.5486104, 0.1921569, 1, 0, 1,
-0.5654055, 0.9287198, 0.6438847, 0.1882353, 1, 0, 1,
-0.5613876, 0.5648637, -2.457876, 0.1803922, 1, 0, 1,
-0.559093, 0.6711234, -0.4210584, 0.1764706, 1, 0, 1,
-0.5520461, 1.244688, -0.3677107, 0.1686275, 1, 0, 1,
-0.5519816, 0.1015656, -1.424029, 0.1647059, 1, 0, 1,
-0.5483998, 0.01137875, -1.155267, 0.1568628, 1, 0, 1,
-0.5469315, -0.2466894, -2.713073, 0.1529412, 1, 0, 1,
-0.546193, -1.203991, -3.766435, 0.145098, 1, 0, 1,
-0.544079, 1.110592, -0.9697769, 0.1411765, 1, 0, 1,
-0.5412329, -0.8676521, -3.274927, 0.1333333, 1, 0, 1,
-0.5388132, -0.17242, -1.389323, 0.1294118, 1, 0, 1,
-0.5384355, 0.9163196, -0.2341199, 0.1215686, 1, 0, 1,
-0.5381696, -2.426897, -3.869622, 0.1176471, 1, 0, 1,
-0.5308942, -4.281803, -3.723101, 0.1098039, 1, 0, 1,
-0.5301263, -1.098465, -2.377736, 0.1058824, 1, 0, 1,
-0.5233091, 0.2703364, -2.277874, 0.09803922, 1, 0, 1,
-0.5209095, 2.131928, 0.143395, 0.09019608, 1, 0, 1,
-0.5167823, 0.4234806, -1.014518, 0.08627451, 1, 0, 1,
-0.5128332, -0.2952443, -2.625214, 0.07843138, 1, 0, 1,
-0.5109583, 0.3358393, -1.106729, 0.07450981, 1, 0, 1,
-0.5040384, 0.879574, 0.2789957, 0.06666667, 1, 0, 1,
-0.5020958, -1.081273, -2.868238, 0.0627451, 1, 0, 1,
-0.4990435, 0.7141827, -0.8313883, 0.05490196, 1, 0, 1,
-0.4966153, -0.6184795, -2.476819, 0.05098039, 1, 0, 1,
-0.4948873, -1.350507, -2.862066, 0.04313726, 1, 0, 1,
-0.4936161, 0.006633182, -2.205667, 0.03921569, 1, 0, 1,
-0.4930358, -0.02180029, -2.203668, 0.03137255, 1, 0, 1,
-0.4915714, -0.4091457, -3.43434, 0.02745098, 1, 0, 1,
-0.4915229, -1.325059, -3.419604, 0.01960784, 1, 0, 1,
-0.4872581, 0.1322901, -1.007254, 0.01568628, 1, 0, 1,
-0.4851512, -0.166142, -1.710081, 0.007843138, 1, 0, 1,
-0.4811736, 0.3204497, -1.655545, 0.003921569, 1, 0, 1,
-0.4781391, 0.3766854, -0.7115507, 0, 1, 0.003921569, 1,
-0.4749431, -0.529368, -3.075934, 0, 1, 0.01176471, 1,
-0.4713549, 0.3046262, -1.734286, 0, 1, 0.01568628, 1,
-0.4699769, -3.276329, -3.78047, 0, 1, 0.02352941, 1,
-0.46824, 0.971363, -1.303718, 0, 1, 0.02745098, 1,
-0.4638474, -0.9067342, -3.059686, 0, 1, 0.03529412, 1,
-0.4630331, 0.9144668, -1.31731, 0, 1, 0.03921569, 1,
-0.4614537, 0.2552161, -1.943793, 0, 1, 0.04705882, 1,
-0.460707, 0.5963119, -2.083365, 0, 1, 0.05098039, 1,
-0.4596513, 0.5581338, 0.3361094, 0, 1, 0.05882353, 1,
-0.4589744, -0.7407712, -3.610465, 0, 1, 0.0627451, 1,
-0.4559297, -1.600908, -2.9011, 0, 1, 0.07058824, 1,
-0.4554367, -0.2668576, -2.212676, 0, 1, 0.07450981, 1,
-0.4540249, 1.199098, -1.060995, 0, 1, 0.08235294, 1,
-0.4508668, -0.1287825, -0.9794248, 0, 1, 0.08627451, 1,
-0.4469306, -0.9002951, -2.626067, 0, 1, 0.09411765, 1,
-0.4442241, -0.3517441, -2.975497, 0, 1, 0.1019608, 1,
-0.4409204, -0.420756, -2.598609, 0, 1, 0.1058824, 1,
-0.4394882, 0.4381466, -1.701861, 0, 1, 0.1137255, 1,
-0.4391659, 0.2427349, -0.2453319, 0, 1, 0.1176471, 1,
-0.438403, 0.4575917, -1.722934, 0, 1, 0.1254902, 1,
-0.4332879, -2.178246, -3.771196, 0, 1, 0.1294118, 1,
-0.429159, -0.2139287, -0.4657836, 0, 1, 0.1372549, 1,
-0.4246542, -0.4669193, -2.418126, 0, 1, 0.1411765, 1,
-0.424456, -0.5314555, -3.390687, 0, 1, 0.1490196, 1,
-0.4243887, -0.4790607, -1.778111, 0, 1, 0.1529412, 1,
-0.423551, -1.546129, -2.7784, 0, 1, 0.1607843, 1,
-0.4160971, 0.7947406, -1.571396, 0, 1, 0.1647059, 1,
-0.4102294, -0.9409627, -2.447889, 0, 1, 0.172549, 1,
-0.4053442, 0.01180105, -1.909748, 0, 1, 0.1764706, 1,
-0.4034206, -0.3075666, -2.339413, 0, 1, 0.1843137, 1,
-0.402877, 0.7177258, -1.261714, 0, 1, 0.1882353, 1,
-0.4010352, -0.3474808, -1.32032, 0, 1, 0.1960784, 1,
-0.3974175, -0.9075488, -1.859542, 0, 1, 0.2039216, 1,
-0.3915712, 0.8298656, -2.603181, 0, 1, 0.2078431, 1,
-0.3915395, 0.5350216, -0.2578032, 0, 1, 0.2156863, 1,
-0.3901149, -0.2826956, -2.050713, 0, 1, 0.2196078, 1,
-0.3879685, -0.009288093, -2.180943, 0, 1, 0.227451, 1,
-0.3873535, 0.6473071, 0.003162761, 0, 1, 0.2313726, 1,
-0.3845035, 0.8775927, 0.5974519, 0, 1, 0.2392157, 1,
-0.3819534, 0.4544324, -1.280571, 0, 1, 0.2431373, 1,
-0.379284, -0.5801136, -3.262036, 0, 1, 0.2509804, 1,
-0.3791358, 1.159824, 0.7519167, 0, 1, 0.254902, 1,
-0.3749142, 0.8018226, 0.8953618, 0, 1, 0.2627451, 1,
-0.3729791, -2.305041, -3.933957, 0, 1, 0.2666667, 1,
-0.3706072, -0.2503905, -0.9055099, 0, 1, 0.2745098, 1,
-0.3697096, 1.391201, 0.7413751, 0, 1, 0.2784314, 1,
-0.3693572, 1.371641, -0.280624, 0, 1, 0.2862745, 1,
-0.3689264, 1.993928, -1.871681, 0, 1, 0.2901961, 1,
-0.3666963, -0.4909722, -3.103343, 0, 1, 0.2980392, 1,
-0.3664017, -0.495965, -0.2562437, 0, 1, 0.3058824, 1,
-0.3635669, -1.114681, -1.83918, 0, 1, 0.3098039, 1,
-0.3584966, -0.363946, -2.233423, 0, 1, 0.3176471, 1,
-0.3541677, 2.2501, -0.06904472, 0, 1, 0.3215686, 1,
-0.3514192, -1.253835, -3.456352, 0, 1, 0.3294118, 1,
-0.3475268, -0.320667, -2.597853, 0, 1, 0.3333333, 1,
-0.3448773, 0.669422, 0.1333598, 0, 1, 0.3411765, 1,
-0.341777, -1.070751, -2.785744, 0, 1, 0.345098, 1,
-0.339404, 0.5939735, -1.607722, 0, 1, 0.3529412, 1,
-0.3386408, -1.038146, -2.371773, 0, 1, 0.3568628, 1,
-0.338063, -0.5348882, -3.454266, 0, 1, 0.3647059, 1,
-0.3351569, -0.9355747, -2.222229, 0, 1, 0.3686275, 1,
-0.3346975, -1.9692, -2.466334, 0, 1, 0.3764706, 1,
-0.3331718, 0.5740193, 0.2701586, 0, 1, 0.3803922, 1,
-0.3320765, 0.9361941, -1.298424, 0, 1, 0.3882353, 1,
-0.3314943, -0.3881754, -2.280133, 0, 1, 0.3921569, 1,
-0.3287756, -0.4099911, -3.975975, 0, 1, 0.4, 1,
-0.3194589, -1.024264, -3.216017, 0, 1, 0.4078431, 1,
-0.3172572, 0.1216846, -1.358059, 0, 1, 0.4117647, 1,
-0.3156001, 0.09577082, 1.056622, 0, 1, 0.4196078, 1,
-0.3151775, -0.3043545, -1.705256, 0, 1, 0.4235294, 1,
-0.3141782, -0.7464576, -1.142512, 0, 1, 0.4313726, 1,
-0.3133183, 0.367171, -0.7526777, 0, 1, 0.4352941, 1,
-0.3129874, 0.4029008, 0.4375679, 0, 1, 0.4431373, 1,
-0.3105463, -1.813295, -3.348466, 0, 1, 0.4470588, 1,
-0.309728, 0.253847, -0.09610832, 0, 1, 0.454902, 1,
-0.3080193, -0.9597909, -2.576495, 0, 1, 0.4588235, 1,
-0.3038101, -0.5613394, -2.04745, 0, 1, 0.4666667, 1,
-0.2923468, -0.6773759, -4.228845, 0, 1, 0.4705882, 1,
-0.2918541, 0.209572, -1.157952, 0, 1, 0.4784314, 1,
-0.2911405, 0.4336388, -0.8079459, 0, 1, 0.4823529, 1,
-0.284188, 1.201224, -1.785626, 0, 1, 0.4901961, 1,
-0.2825258, -0.3626393, -0.05072535, 0, 1, 0.4941176, 1,
-0.2762292, 1.661701, 1.105224, 0, 1, 0.5019608, 1,
-0.275384, 1.40421, 1.031523, 0, 1, 0.509804, 1,
-0.2695582, -0.1035784, -3.572803, 0, 1, 0.5137255, 1,
-0.2644022, -1.801832, -4.277603, 0, 1, 0.5215687, 1,
-0.2584786, 0.5783775, -1.602452, 0, 1, 0.5254902, 1,
-0.2570575, 0.2520198, -1.957165, 0, 1, 0.5333334, 1,
-0.2399974, -0.6910019, -2.808761, 0, 1, 0.5372549, 1,
-0.2361838, -1.274758, -2.057151, 0, 1, 0.5450981, 1,
-0.2344769, -0.03717547, -1.573395, 0, 1, 0.5490196, 1,
-0.2328151, -0.2184103, -2.861098, 0, 1, 0.5568628, 1,
-0.2308917, -0.7499709, -2.05282, 0, 1, 0.5607843, 1,
-0.2296469, 0.723379, -1.208979, 0, 1, 0.5686275, 1,
-0.2248933, -0.9805004, -3.153985, 0, 1, 0.572549, 1,
-0.2236145, -1.233014, -2.776506, 0, 1, 0.5803922, 1,
-0.2232823, 0.410962, -2.964434, 0, 1, 0.5843138, 1,
-0.2204092, -1.100101, -1.979797, 0, 1, 0.5921569, 1,
-0.2130333, 0.662762, -0.7086414, 0, 1, 0.5960785, 1,
-0.2129025, 0.7076002, 0.04016659, 0, 1, 0.6039216, 1,
-0.2091948, 1.114241, -1.407018, 0, 1, 0.6117647, 1,
-0.2012549, -0.8398272, -1.095536, 0, 1, 0.6156863, 1,
-0.1952743, -0.006456648, -0.5532001, 0, 1, 0.6235294, 1,
-0.1914653, -1.052461, -2.924305, 0, 1, 0.627451, 1,
-0.1910291, -0.9840992, -2.171758, 0, 1, 0.6352941, 1,
-0.1903532, 0.5118126, -0.1644804, 0, 1, 0.6392157, 1,
-0.1897864, -0.9986833, -2.765917, 0, 1, 0.6470588, 1,
-0.1882018, 0.1136335, -0.5680742, 0, 1, 0.6509804, 1,
-0.1879238, -0.6011835, -2.413007, 0, 1, 0.6588235, 1,
-0.1869981, 0.04875138, -1.651222, 0, 1, 0.6627451, 1,
-0.1867101, 0.8133122, 1.07486, 0, 1, 0.6705883, 1,
-0.1818545, -0.1787773, -2.571428, 0, 1, 0.6745098, 1,
-0.1795212, 0.9004266, -1.124932, 0, 1, 0.682353, 1,
-0.1764003, -0.4444152, -4.360114, 0, 1, 0.6862745, 1,
-0.1761755, 0.326386, -0.7827095, 0, 1, 0.6941177, 1,
-0.1753228, 0.3744484, -0.9744486, 0, 1, 0.7019608, 1,
-0.1731835, -0.5410396, -3.119027, 0, 1, 0.7058824, 1,
-0.1638198, 1.317281, -0.1321275, 0, 1, 0.7137255, 1,
-0.162966, -0.4612058, -3.221954, 0, 1, 0.7176471, 1,
-0.1584363, -0.3785428, -1.867922, 0, 1, 0.7254902, 1,
-0.1566423, 1.401127, 0.03476036, 0, 1, 0.7294118, 1,
-0.1565666, -1.628269, -3.466971, 0, 1, 0.7372549, 1,
-0.1532082, -0.74469, -2.149839, 0, 1, 0.7411765, 1,
-0.1529904, -1.226666, -3.095281, 0, 1, 0.7490196, 1,
-0.150727, 2.463776, -1.763584, 0, 1, 0.7529412, 1,
-0.1502735, 1.599384, -1.570469, 0, 1, 0.7607843, 1,
-0.1481627, 0.1118133, 1.093852, 0, 1, 0.7647059, 1,
-0.145582, 0.4105487, -0.2226799, 0, 1, 0.772549, 1,
-0.1368704, 1.456829, -1.159417, 0, 1, 0.7764706, 1,
-0.1299318, 1.658329, 0.6066187, 0, 1, 0.7843137, 1,
-0.1273965, 1.254979, 1.015252, 0, 1, 0.7882353, 1,
-0.1248993, -0.2924989, -4.500458, 0, 1, 0.7960784, 1,
-0.1241509, 3.680009, -1.151651, 0, 1, 0.8039216, 1,
-0.1239919, -1.10662, -2.256094, 0, 1, 0.8078431, 1,
-0.1193274, -0.1307858, -3.038522, 0, 1, 0.8156863, 1,
-0.1154783, -0.1164739, -2.018417, 0, 1, 0.8196079, 1,
-0.1146385, -0.4205722, -3.469568, 0, 1, 0.827451, 1,
-0.1069328, -1.093827, -2.617146, 0, 1, 0.8313726, 1,
-0.1048867, -0.1321385, -3.377196, 0, 1, 0.8392157, 1,
-0.1044652, 0.2072739, -2.081459, 0, 1, 0.8431373, 1,
-0.1037369, 0.8966456, -0.08381739, 0, 1, 0.8509804, 1,
-0.1024563, -0.6066738, -2.610467, 0, 1, 0.854902, 1,
-0.1013252, 1.527523, -0.9439462, 0, 1, 0.8627451, 1,
-0.1007471, -1.350759, -2.513735, 0, 1, 0.8666667, 1,
-0.09921081, -0.500716, -2.427847, 0, 1, 0.8745098, 1,
-0.09803282, 0.9274344, 0.5173364, 0, 1, 0.8784314, 1,
-0.09745325, 1.727818, 0.8599768, 0, 1, 0.8862745, 1,
-0.09722076, 0.9189726, -0.9508983, 0, 1, 0.8901961, 1,
-0.09590938, -0.1547363, -2.496716, 0, 1, 0.8980392, 1,
-0.09051447, -1.84846, -3.764482, 0, 1, 0.9058824, 1,
-0.08850247, 2.112925, -0.08605618, 0, 1, 0.9098039, 1,
-0.08781775, 0.6006787, -1.257918, 0, 1, 0.9176471, 1,
-0.08671302, 0.2084285, 1.220469, 0, 1, 0.9215686, 1,
-0.08664109, -1.391752, -3.061291, 0, 1, 0.9294118, 1,
-0.08539867, 0.9760863, -1.77176, 0, 1, 0.9333333, 1,
-0.08472053, -0.8067557, -3.381016, 0, 1, 0.9411765, 1,
-0.08267661, 0.2017882, -0.5346801, 0, 1, 0.945098, 1,
-0.08116014, -0.6720781, -3.662472, 0, 1, 0.9529412, 1,
-0.07990699, 0.08236779, 0.9511324, 0, 1, 0.9568627, 1,
-0.07914161, 0.5648918, -0.7122119, 0, 1, 0.9647059, 1,
-0.0748095, -1.634766, -3.93671, 0, 1, 0.9686275, 1,
-0.07203318, -0.1896403, -2.311343, 0, 1, 0.9764706, 1,
-0.06652177, 0.3979247, 1.02724, 0, 1, 0.9803922, 1,
-0.06130542, 1.686277, -0.998352, 0, 1, 0.9882353, 1,
-0.05986481, -0.5750486, -2.80103, 0, 1, 0.9921569, 1,
-0.0594289, 0.1230406, 0.9790483, 0, 1, 1, 1,
-0.05758566, 2.271973, 0.02114586, 0, 0.9921569, 1, 1,
-0.05515023, 1.479721, -0.008384293, 0, 0.9882353, 1, 1,
-0.05147016, 0.222338, -1.14009, 0, 0.9803922, 1, 1,
-0.04824663, -1.534976, -2.70204, 0, 0.9764706, 1, 1,
-0.04786464, -0.2481961, -3.286191, 0, 0.9686275, 1, 1,
-0.0473522, 0.4165625, 1.237341, 0, 0.9647059, 1, 1,
-0.04612514, -0.2417398, -3.866076, 0, 0.9568627, 1, 1,
-0.04349104, 0.9346225, 0.5871388, 0, 0.9529412, 1, 1,
-0.03781344, 0.3910288, 1.301563, 0, 0.945098, 1, 1,
-0.03612104, -0.6080027, -2.849819, 0, 0.9411765, 1, 1,
-0.02511643, 1.905611, -0.5073038, 0, 0.9333333, 1, 1,
-0.02262731, -0.4700756, -2.927101, 0, 0.9294118, 1, 1,
-0.02141754, 0.4172988, -0.6495152, 0, 0.9215686, 1, 1,
-0.01841404, -1.155006, -2.646066, 0, 0.9176471, 1, 1,
-0.01471206, 0.957555, -1.485611, 0, 0.9098039, 1, 1,
-0.01037156, 0.2838783, -1.261069, 0, 0.9058824, 1, 1,
-0.009546978, 1.578073, -0.01052171, 0, 0.8980392, 1, 1,
-0.009389204, -0.2386163, -1.991539, 0, 0.8901961, 1, 1,
-0.008778317, -1.049988, -4.127709, 0, 0.8862745, 1, 1,
-0.007949628, 1.121347, -0.9641247, 0, 0.8784314, 1, 1,
-0.006547181, 1.198413, -0.48094, 0, 0.8745098, 1, 1,
-0.0005988951, -0.3556161, -4.556492, 0, 0.8666667, 1, 1,
-0.0003881793, 0.7786806, -0.5981948, 0, 0.8627451, 1, 1,
0.00347159, -0.03853297, 2.733134, 0, 0.854902, 1, 1,
0.006181864, 1.931934, -2.121477, 0, 0.8509804, 1, 1,
0.009403339, -1.251421, 2.408275, 0, 0.8431373, 1, 1,
0.0155924, 0.05528475, -0.5273239, 0, 0.8392157, 1, 1,
0.0159541, 1.18987, -1.435212, 0, 0.8313726, 1, 1,
0.01783479, 0.0149071, 1.131984, 0, 0.827451, 1, 1,
0.02517701, 1.321838, 1.796331, 0, 0.8196079, 1, 1,
0.0259506, 1.579705, 0.4633533, 0, 0.8156863, 1, 1,
0.02601826, 0.7700783, 2.130158, 0, 0.8078431, 1, 1,
0.03500769, -0.2104481, 2.51324, 0, 0.8039216, 1, 1,
0.03545453, -1.221466, 3.383818, 0, 0.7960784, 1, 1,
0.03786053, -0.8369854, 3.48897, 0, 0.7882353, 1, 1,
0.04151586, 1.36485, -1.573356, 0, 0.7843137, 1, 1,
0.04500193, -0.02187934, 1.680451, 0, 0.7764706, 1, 1,
0.04789367, 1.233784, -0.5329913, 0, 0.772549, 1, 1,
0.04854105, -0.2409706, 3.880752, 0, 0.7647059, 1, 1,
0.05145448, -1.568264, 3.481667, 0, 0.7607843, 1, 1,
0.05271658, 0.9638656, 0.9092572, 0, 0.7529412, 1, 1,
0.05719641, 1.726369, -0.1695192, 0, 0.7490196, 1, 1,
0.05997187, 1.521653, 0.1932575, 0, 0.7411765, 1, 1,
0.06707806, -0.03606121, 2.000877, 0, 0.7372549, 1, 1,
0.07241204, -0.2916695, 1.970074, 0, 0.7294118, 1, 1,
0.07393017, 0.2994645, 0.1057127, 0, 0.7254902, 1, 1,
0.0743481, 0.3699892, 1.181527, 0, 0.7176471, 1, 1,
0.07538684, -1.207699, 3.417425, 0, 0.7137255, 1, 1,
0.07821675, 0.03790753, 1.307952, 0, 0.7058824, 1, 1,
0.08902585, -0.1254084, 2.536533, 0, 0.6980392, 1, 1,
0.09064762, -1.63408, 5.019585, 0, 0.6941177, 1, 1,
0.0935509, 0.3858978, 0.7227541, 0, 0.6862745, 1, 1,
0.09584994, 0.972496, -0.3370068, 0, 0.682353, 1, 1,
0.09870797, -0.6216123, 1.533006, 0, 0.6745098, 1, 1,
0.1008571, 1.457149, 1.212906, 0, 0.6705883, 1, 1,
0.1010345, -0.6337754, 3.133839, 0, 0.6627451, 1, 1,
0.1021582, 2.725176, -0.3976591, 0, 0.6588235, 1, 1,
0.1043051, -0.04465525, 0.3503179, 0, 0.6509804, 1, 1,
0.1048426, -0.2632946, 2.923789, 0, 0.6470588, 1, 1,
0.111711, -1.017346, 1.562711, 0, 0.6392157, 1, 1,
0.1119373, 0.08618324, 1.36026, 0, 0.6352941, 1, 1,
0.1194448, 0.09229058, -0.2563609, 0, 0.627451, 1, 1,
0.1195908, 1.123497, -1.098214, 0, 0.6235294, 1, 1,
0.1209564, 0.0996954, 0.3914305, 0, 0.6156863, 1, 1,
0.12423, -0.2739477, 3.18715, 0, 0.6117647, 1, 1,
0.1262454, 0.04287104, 0.9579965, 0, 0.6039216, 1, 1,
0.1297101, 0.00892486, 2.245272, 0, 0.5960785, 1, 1,
0.1306883, 0.7742127, 0.7930506, 0, 0.5921569, 1, 1,
0.1322131, -1.046186, 4.826286, 0, 0.5843138, 1, 1,
0.1384246, -0.3703821, 1.832976, 0, 0.5803922, 1, 1,
0.1442925, 1.159967, 0.1650936, 0, 0.572549, 1, 1,
0.1479909, 0.7248417, 1.169671, 0, 0.5686275, 1, 1,
0.151591, 0.1869685, 1.591335, 0, 0.5607843, 1, 1,
0.1533949, 0.2841185, -2.450434, 0, 0.5568628, 1, 1,
0.1557494, -0.6173937, 2.6087, 0, 0.5490196, 1, 1,
0.1609116, 2.23019, 1.592828, 0, 0.5450981, 1, 1,
0.1631845, -0.127896, 1.082161, 0, 0.5372549, 1, 1,
0.1669801, -0.3567774, 2.229244, 0, 0.5333334, 1, 1,
0.1690538, 1.244523, 1.388608, 0, 0.5254902, 1, 1,
0.1731565, 0.03623233, 1.62878, 0, 0.5215687, 1, 1,
0.1732722, -0.06086059, 2.196119, 0, 0.5137255, 1, 1,
0.1780858, 0.1555981, 1.326899, 0, 0.509804, 1, 1,
0.1798654, 1.2223, 0.3530269, 0, 0.5019608, 1, 1,
0.1854847, -1.529518, 0.379272, 0, 0.4941176, 1, 1,
0.1869913, -0.02122277, 2.113261, 0, 0.4901961, 1, 1,
0.1873501, 0.4228517, -0.519982, 0, 0.4823529, 1, 1,
0.1901392, 1.1625, 0.1201828, 0, 0.4784314, 1, 1,
0.1941503, 1.225646, 1.432276, 0, 0.4705882, 1, 1,
0.1953187, -0.6149327, 3.679255, 0, 0.4666667, 1, 1,
0.2011705, 1.794158, 1.425273, 0, 0.4588235, 1, 1,
0.2027147, 0.2647476, -0.8095202, 0, 0.454902, 1, 1,
0.2035037, 0.07303819, 1.231945, 0, 0.4470588, 1, 1,
0.2036039, 0.06310116, 1.445115, 0, 0.4431373, 1, 1,
0.2062064, 0.3258323, 1.62131, 0, 0.4352941, 1, 1,
0.2065752, 0.643257, -1.073206, 0, 0.4313726, 1, 1,
0.2094488, 0.4672868, -0.1234348, 0, 0.4235294, 1, 1,
0.2108797, -0.3984867, 2.02645, 0, 0.4196078, 1, 1,
0.2122416, -0.8453135, 3.95843, 0, 0.4117647, 1, 1,
0.2155283, -0.01016801, 1.993434, 0, 0.4078431, 1, 1,
0.2163561, -0.5587636, 1.678859, 0, 0.4, 1, 1,
0.2272687, -0.5091438, 2.139493, 0, 0.3921569, 1, 1,
0.229185, -1.157241, 2.548852, 0, 0.3882353, 1, 1,
0.2388007, -0.8790344, 1.649612, 0, 0.3803922, 1, 1,
0.2432247, -0.3723261, 2.097764, 0, 0.3764706, 1, 1,
0.2459397, 0.01157334, 2.648504, 0, 0.3686275, 1, 1,
0.257677, 1.607353, 0.4258369, 0, 0.3647059, 1, 1,
0.2591679, 1.002861, -0.1612452, 0, 0.3568628, 1, 1,
0.2598189, 0.850615, 1.82648, 0, 0.3529412, 1, 1,
0.2628326, 1.290389, 2.210397, 0, 0.345098, 1, 1,
0.2635108, -0.8079292, 1.34298, 0, 0.3411765, 1, 1,
0.2639717, 0.5927119, 0.5674487, 0, 0.3333333, 1, 1,
0.265687, -0.008281733, 2.8599, 0, 0.3294118, 1, 1,
0.2678346, -1.208073, 3.366276, 0, 0.3215686, 1, 1,
0.2726133, -0.9623418, 0.7361502, 0, 0.3176471, 1, 1,
0.2728063, 0.6157386, 0.2226796, 0, 0.3098039, 1, 1,
0.2743099, 1.721975, 0.01165515, 0, 0.3058824, 1, 1,
0.2755443, -0.7448594, 3.96151, 0, 0.2980392, 1, 1,
0.2773531, 0.5147005, 0.2730463, 0, 0.2901961, 1, 1,
0.2857015, 1.773552, -0.7393923, 0, 0.2862745, 1, 1,
0.2859845, -0.6771159, 3.957898, 0, 0.2784314, 1, 1,
0.2881384, -1.122641, 2.688565, 0, 0.2745098, 1, 1,
0.289946, 0.9804515, 1.440806, 0, 0.2666667, 1, 1,
0.2901004, -0.2457182, 1.302407, 0, 0.2627451, 1, 1,
0.2906777, -0.5879012, 3.60698, 0, 0.254902, 1, 1,
0.2916312, -1.068836, 1.892944, 0, 0.2509804, 1, 1,
0.2930672, 1.536534, -0.2777022, 0, 0.2431373, 1, 1,
0.2957633, 1.396962, -2.351969, 0, 0.2392157, 1, 1,
0.2982025, -0.04231637, 1.993381, 0, 0.2313726, 1, 1,
0.3167382, 0.08024316, 2.543836, 0, 0.227451, 1, 1,
0.3206988, 0.1804251, 1.342866, 0, 0.2196078, 1, 1,
0.3223855, 0.9176133, -0.2944161, 0, 0.2156863, 1, 1,
0.324316, 1.590964, 1.88021, 0, 0.2078431, 1, 1,
0.3262967, 0.9855519, 1.897104, 0, 0.2039216, 1, 1,
0.3283882, 1.467797, -0.503239, 0, 0.1960784, 1, 1,
0.3296853, -2.34756, 3.369414, 0, 0.1882353, 1, 1,
0.3303318, 0.02189201, 1.707325, 0, 0.1843137, 1, 1,
0.3303837, 0.08024123, 2.252216, 0, 0.1764706, 1, 1,
0.3358134, 1.860552, 1.12272, 0, 0.172549, 1, 1,
0.3378364, 1.915584, -0.770602, 0, 0.1647059, 1, 1,
0.3537067, 1.45248, 0.1248844, 0, 0.1607843, 1, 1,
0.3574258, -0.5203962, 3.628736, 0, 0.1529412, 1, 1,
0.3595767, -0.05648264, 2.737522, 0, 0.1490196, 1, 1,
0.3629354, -1.207369, 1.774503, 0, 0.1411765, 1, 1,
0.3710812, 2.173979, 0.08451946, 0, 0.1372549, 1, 1,
0.3742828, -0.3469858, 1.207403, 0, 0.1294118, 1, 1,
0.3792612, 0.2599462, 2.20951, 0, 0.1254902, 1, 1,
0.3818789, 1.021884, 1.06934, 0, 0.1176471, 1, 1,
0.3843027, 0.1722439, 1.573362, 0, 0.1137255, 1, 1,
0.3951318, -1.079886, 3.570646, 0, 0.1058824, 1, 1,
0.3956265, 0.2629569, -1.169037, 0, 0.09803922, 1, 1,
0.3982117, -0.7032787, 3.889632, 0, 0.09411765, 1, 1,
0.3993622, 0.5944491, 0.6409166, 0, 0.08627451, 1, 1,
0.4021779, -0.8297846, 2.366618, 0, 0.08235294, 1, 1,
0.407513, 1.178459, 1.461014, 0, 0.07450981, 1, 1,
0.4117716, 1.32907, 0.3578417, 0, 0.07058824, 1, 1,
0.4119413, -0.6935465, 2.833651, 0, 0.0627451, 1, 1,
0.4126307, -1.389759, 3.38063, 0, 0.05882353, 1, 1,
0.4155557, -0.226604, 2.366103, 0, 0.05098039, 1, 1,
0.4168559, 0.8645085, -0.8903662, 0, 0.04705882, 1, 1,
0.4224456, -0.9866589, 3.698452, 0, 0.03921569, 1, 1,
0.423082, -1.475496, 1.155091, 0, 0.03529412, 1, 1,
0.4278537, 1.069254, -0.4005292, 0, 0.02745098, 1, 1,
0.4321766, -2.461742, 3.342221, 0, 0.02352941, 1, 1,
0.4326605, -1.322733, 2.066833, 0, 0.01568628, 1, 1,
0.4353119, 1.163773, -0.4294326, 0, 0.01176471, 1, 1,
0.440699, 0.5810351, 1.616274, 0, 0.003921569, 1, 1,
0.441154, -0.2261462, 1.477937, 0.003921569, 0, 1, 1,
0.4426033, 0.07891823, 1.748445, 0.007843138, 0, 1, 1,
0.4426562, -1.397982, 2.518156, 0.01568628, 0, 1, 1,
0.4474944, 0.7690398, 0.5708258, 0.01960784, 0, 1, 1,
0.4494337, 0.6652672, 0.239613, 0.02745098, 0, 1, 1,
0.4511503, -1.584117, 2.613071, 0.03137255, 0, 1, 1,
0.4516473, -0.3046609, 2.031696, 0.03921569, 0, 1, 1,
0.4516741, 1.009221, 1.28985, 0.04313726, 0, 1, 1,
0.4576842, 0.4077392, -0.8553447, 0.05098039, 0, 1, 1,
0.4592457, 0.4888046, 1.274789, 0.05490196, 0, 1, 1,
0.4598229, 0.7465255, 1.03865, 0.0627451, 0, 1, 1,
0.4620701, 0.8644902, -1.283262, 0.06666667, 0, 1, 1,
0.4681532, 1.792518, 0.1536347, 0.07450981, 0, 1, 1,
0.4725273, 0.008951696, 2.94912, 0.07843138, 0, 1, 1,
0.4730355, -0.216124, 1.505309, 0.08627451, 0, 1, 1,
0.4733913, 0.5133657, -1.2781, 0.09019608, 0, 1, 1,
0.4736889, -1.12237, 2.754284, 0.09803922, 0, 1, 1,
0.4793722, -3.053403, 3.35722, 0.1058824, 0, 1, 1,
0.4796121, 0.01075231, 3.783377, 0.1098039, 0, 1, 1,
0.486332, -0.7953286, 4.487381, 0.1176471, 0, 1, 1,
0.4928471, 2.002943, -0.6650052, 0.1215686, 0, 1, 1,
0.4940086, 0.2198831, -0.0002378136, 0.1294118, 0, 1, 1,
0.4952787, -0.7108959, 2.661989, 0.1333333, 0, 1, 1,
0.4973497, -0.6620479, 2.812734, 0.1411765, 0, 1, 1,
0.5027764, 0.3088046, 0.8498608, 0.145098, 0, 1, 1,
0.5043709, 0.7295306, 1.025962, 0.1529412, 0, 1, 1,
0.5117709, 0.7078736, -0.2749823, 0.1568628, 0, 1, 1,
0.5159866, -0.8627569, 3.503419, 0.1647059, 0, 1, 1,
0.5166068, 0.7963512, 0.7625827, 0.1686275, 0, 1, 1,
0.5204369, -0.662994, 2.993756, 0.1764706, 0, 1, 1,
0.521269, -0.5389312, 4.382842, 0.1803922, 0, 1, 1,
0.5263738, -2.168879, 2.523882, 0.1882353, 0, 1, 1,
0.5267227, 0.808972, -1.34931, 0.1921569, 0, 1, 1,
0.535146, 0.4629566, 0.2978574, 0.2, 0, 1, 1,
0.5358313, -2.919123, 1.979224, 0.2078431, 0, 1, 1,
0.5358833, 0.1336827, 1.327489, 0.2117647, 0, 1, 1,
0.5495799, 0.9503385, -1.056531, 0.2196078, 0, 1, 1,
0.5512655, 0.2372973, 1.998034, 0.2235294, 0, 1, 1,
0.5539832, 1.524438, 0.1137488, 0.2313726, 0, 1, 1,
0.5669037, 2.909968, 1.089843, 0.2352941, 0, 1, 1,
0.5675741, 0.9004862, 1.581493, 0.2431373, 0, 1, 1,
0.5684201, -0.1906937, 2.618921, 0.2470588, 0, 1, 1,
0.5688753, -0.7099662, 1.72471, 0.254902, 0, 1, 1,
0.574423, 1.699549, 1.288116, 0.2588235, 0, 1, 1,
0.5825525, 0.07157218, 1.589052, 0.2666667, 0, 1, 1,
0.5825553, 0.07817101, 0.426845, 0.2705882, 0, 1, 1,
0.5825692, -0.6400833, 2.955849, 0.2784314, 0, 1, 1,
0.5836616, 0.3575946, 0.9949098, 0.282353, 0, 1, 1,
0.5851572, -0.7790393, 3.492775, 0.2901961, 0, 1, 1,
0.586175, 0.7212852, -1.309854, 0.2941177, 0, 1, 1,
0.5942001, -0.6466016, 1.942231, 0.3019608, 0, 1, 1,
0.5966021, 1.24425, 2.328626, 0.3098039, 0, 1, 1,
0.5996087, 0.6121458, -1.147704, 0.3137255, 0, 1, 1,
0.6008471, 0.8532419, -0.6825348, 0.3215686, 0, 1, 1,
0.6034586, 0.7352578, 1.741894, 0.3254902, 0, 1, 1,
0.6133353, -0.5254585, 2.569443, 0.3333333, 0, 1, 1,
0.6157402, 1.049664, -0.05589548, 0.3372549, 0, 1, 1,
0.620077, 0.1226367, 0.3908463, 0.345098, 0, 1, 1,
0.6213135, 2.885594, 0.8118634, 0.3490196, 0, 1, 1,
0.6238461, 0.1796934, 1.340309, 0.3568628, 0, 1, 1,
0.6242167, 0.1194479, 0.3077146, 0.3607843, 0, 1, 1,
0.6355292, 0.4366032, 2.624002, 0.3686275, 0, 1, 1,
0.6359746, -0.008041233, -0.2170276, 0.372549, 0, 1, 1,
0.6382567, -0.7637071, 1.880709, 0.3803922, 0, 1, 1,
0.6388221, -0.3218102, 0.8244628, 0.3843137, 0, 1, 1,
0.642741, 0.7146754, -2.008856, 0.3921569, 0, 1, 1,
0.6474594, 0.170377, 2.622753, 0.3960784, 0, 1, 1,
0.6496808, -0.3720907, 1.531694, 0.4039216, 0, 1, 1,
0.6529948, 0.1936484, 1.93406, 0.4117647, 0, 1, 1,
0.6552612, 1.731111, -0.1429097, 0.4156863, 0, 1, 1,
0.6572548, 1.129472, 1.807347, 0.4235294, 0, 1, 1,
0.6663634, 1.203607, -1.18563, 0.427451, 0, 1, 1,
0.672192, -0.7158841, 1.00438, 0.4352941, 0, 1, 1,
0.6760567, -2.138943, 2.343881, 0.4392157, 0, 1, 1,
0.6761367, 0.6869724, 1.032277, 0.4470588, 0, 1, 1,
0.6792144, 2.022672, -0.05339287, 0.4509804, 0, 1, 1,
0.6793309, -0.8532296, 2.528895, 0.4588235, 0, 1, 1,
0.6853323, -0.591743, 1.869526, 0.4627451, 0, 1, 1,
0.6883739, -0.4215559, 3.238342, 0.4705882, 0, 1, 1,
0.6893292, -0.6990371, 2.078047, 0.4745098, 0, 1, 1,
0.690139, -0.7317483, 1.996585, 0.4823529, 0, 1, 1,
0.6952266, 0.6392232, 2.02218, 0.4862745, 0, 1, 1,
0.6955962, -1.033091, 2.692012, 0.4941176, 0, 1, 1,
0.6980874, -0.7211359, 3.380163, 0.5019608, 0, 1, 1,
0.7006884, -0.09585331, 2.199021, 0.5058824, 0, 1, 1,
0.702253, -1.586204, 1.555318, 0.5137255, 0, 1, 1,
0.702301, -2.050058, 3.969807, 0.5176471, 0, 1, 1,
0.7026957, -0.4148253, 2.483778, 0.5254902, 0, 1, 1,
0.7077291, -0.246497, 1.905003, 0.5294118, 0, 1, 1,
0.7126135, 0.3592006, 2.465786, 0.5372549, 0, 1, 1,
0.7126279, -2.591811, 2.324941, 0.5411765, 0, 1, 1,
0.7162527, -0.9899088, 2.358715, 0.5490196, 0, 1, 1,
0.7186781, -0.2706877, 1.750352, 0.5529412, 0, 1, 1,
0.7198628, -0.2160814, 0.7031579, 0.5607843, 0, 1, 1,
0.7266499, -0.7636483, 2.758818, 0.5647059, 0, 1, 1,
0.7278765, 0.09119964, 1.351601, 0.572549, 0, 1, 1,
0.7288409, 0.1402905, 1.398703, 0.5764706, 0, 1, 1,
0.7305185, -0.03899848, 1.260213, 0.5843138, 0, 1, 1,
0.736932, -0.1957174, 2.03232, 0.5882353, 0, 1, 1,
0.7382228, -0.3588116, 0.9322058, 0.5960785, 0, 1, 1,
0.740121, -0.127255, 2.085183, 0.6039216, 0, 1, 1,
0.740717, 1.17658, 1.601385, 0.6078432, 0, 1, 1,
0.7468671, -0.5735738, 3.543505, 0.6156863, 0, 1, 1,
0.7528686, -0.1947607, 0.3656408, 0.6196079, 0, 1, 1,
0.755554, 0.1187283, 1.383846, 0.627451, 0, 1, 1,
0.7612454, -0.419859, 2.287222, 0.6313726, 0, 1, 1,
0.7644195, 0.4294001, -1.113763, 0.6392157, 0, 1, 1,
0.7644355, -0.677692, 2.484477, 0.6431373, 0, 1, 1,
0.7644848, 0.007221899, 1.772266, 0.6509804, 0, 1, 1,
0.7683986, -2.053215, 2.563278, 0.654902, 0, 1, 1,
0.7706144, 0.9490447, 2.303672, 0.6627451, 0, 1, 1,
0.7712722, -1.797203, 2.63492, 0.6666667, 0, 1, 1,
0.7719641, -0.4501885, 2.344066, 0.6745098, 0, 1, 1,
0.7770109, -0.3274141, 3.035515, 0.6784314, 0, 1, 1,
0.7770628, -1.016377, 1.477471, 0.6862745, 0, 1, 1,
0.7784634, 0.3356543, 1.628792, 0.6901961, 0, 1, 1,
0.78366, 0.36088, 2.057856, 0.6980392, 0, 1, 1,
0.7837664, -2.415098, 3.936271, 0.7058824, 0, 1, 1,
0.7908086, -1.551355, 1.343397, 0.7098039, 0, 1, 1,
0.793187, -0.8763908, 3.74767, 0.7176471, 0, 1, 1,
0.7953546, 1.164429, 1.366213, 0.7215686, 0, 1, 1,
0.7954451, -1.327381, 3.310838, 0.7294118, 0, 1, 1,
0.8012449, 0.7651863, 0.5849531, 0.7333333, 0, 1, 1,
0.8047958, -0.2858016, 1.351481, 0.7411765, 0, 1, 1,
0.8107391, 0.1141195, 0.7714428, 0.7450981, 0, 1, 1,
0.8114682, -1.43751, 3.204089, 0.7529412, 0, 1, 1,
0.8228254, 0.05869094, -0.09397738, 0.7568628, 0, 1, 1,
0.8230662, 1.093135, 0.02548541, 0.7647059, 0, 1, 1,
0.8303434, 0.3304357, 1.308156, 0.7686275, 0, 1, 1,
0.8328605, -0.4710706, 1.983569, 0.7764706, 0, 1, 1,
0.834808, 0.954451, -0.02065163, 0.7803922, 0, 1, 1,
0.8357433, -0.6278447, 1.049746, 0.7882353, 0, 1, 1,
0.8375881, 0.5812571, 0.8349112, 0.7921569, 0, 1, 1,
0.8384277, 0.3439927, 2.358428, 0.8, 0, 1, 1,
0.8473837, 0.6154972, 0.7559276, 0.8078431, 0, 1, 1,
0.8486258, 0.412717, 0.2638927, 0.8117647, 0, 1, 1,
0.8564358, -0.7715721, 2.030656, 0.8196079, 0, 1, 1,
0.8566985, -1.138793, 2.128673, 0.8235294, 0, 1, 1,
0.8656705, 0.08178893, 0.6991851, 0.8313726, 0, 1, 1,
0.8688968, 0.1046227, 2.289306, 0.8352941, 0, 1, 1,
0.8719078, 0.7206215, 3.301406, 0.8431373, 0, 1, 1,
0.8796544, 0.8890069, -0.04695219, 0.8470588, 0, 1, 1,
0.8838065, 0.001336463, 0.1522358, 0.854902, 0, 1, 1,
0.8852388, -0.3375675, 2.838573, 0.8588235, 0, 1, 1,
0.8875679, 0.503406, 0.8610359, 0.8666667, 0, 1, 1,
0.8890127, -0.7524583, 3.272855, 0.8705882, 0, 1, 1,
0.8908613, 0.1082489, 2.667343, 0.8784314, 0, 1, 1,
0.8956003, 1.313914, 0.5922549, 0.8823529, 0, 1, 1,
0.8956575, 0.2930437, 1.302588, 0.8901961, 0, 1, 1,
0.9023297, 0.07241941, 2.308592, 0.8941177, 0, 1, 1,
0.9083101, 1.718349, 1.287835, 0.9019608, 0, 1, 1,
0.9119258, 1.046755, 1.524697, 0.9098039, 0, 1, 1,
0.914089, -1.179055, 2.537734, 0.9137255, 0, 1, 1,
0.9300264, 1.275295, -1.986573, 0.9215686, 0, 1, 1,
0.9338487, 0.4564358, 1.012094, 0.9254902, 0, 1, 1,
0.9354346, -0.9831521, 1.926512, 0.9333333, 0, 1, 1,
0.9369742, -0.1379112, 0.7865922, 0.9372549, 0, 1, 1,
0.9489766, 0.07137688, 1.366265, 0.945098, 0, 1, 1,
0.9609939, 0.4957861, 2.244328, 0.9490196, 0, 1, 1,
0.9633958, 1.227536, 1.561459, 0.9568627, 0, 1, 1,
0.9682252, 0.8332744, 0.1083971, 0.9607843, 0, 1, 1,
0.9714472, -0.4152374, 1.692104, 0.9686275, 0, 1, 1,
0.9729804, -0.2881811, 2.399887, 0.972549, 0, 1, 1,
0.9738591, -0.4950474, 2.364344, 0.9803922, 0, 1, 1,
0.9745063, -0.7676986, 1.27258, 0.9843137, 0, 1, 1,
0.9746187, 0.07610961, 3.683117, 0.9921569, 0, 1, 1,
0.9758916, -1.222418, 1.61447, 0.9960784, 0, 1, 1,
0.9801826, -1.648845, 0.913214, 1, 0, 0.9960784, 1,
0.9868424, -0.1027203, 2.637589, 1, 0, 0.9882353, 1,
0.9880117, -0.6807614, 2.95269, 1, 0, 0.9843137, 1,
0.9923238, -0.2673274, 1.772921, 1, 0, 0.9764706, 1,
0.9950666, -0.01860928, 0.8985231, 1, 0, 0.972549, 1,
1.002212, -2.371987, 3.226761, 1, 0, 0.9647059, 1,
1.002649, -0.3504556, 2.901542, 1, 0, 0.9607843, 1,
1.005951, 0.2653238, 0.6979203, 1, 0, 0.9529412, 1,
1.008065, 0.7464458, -0.6176507, 1, 0, 0.9490196, 1,
1.008563, 1.952303, -0.631366, 1, 0, 0.9411765, 1,
1.014942, 1.13137, 1.356449, 1, 0, 0.9372549, 1,
1.021119, 0.6177092, 1.313443, 1, 0, 0.9294118, 1,
1.029785, -0.2050465, 2.681785, 1, 0, 0.9254902, 1,
1.032781, -0.6130379, 1.266059, 1, 0, 0.9176471, 1,
1.033126, 1.518829, 0.1342233, 1, 0, 0.9137255, 1,
1.034884, -1.481184, 3.044628, 1, 0, 0.9058824, 1,
1.037171, -1.814233, 1.691811, 1, 0, 0.9019608, 1,
1.04507, 0.1060511, 2.246172, 1, 0, 0.8941177, 1,
1.055494, -0.9417466, 3.593093, 1, 0, 0.8862745, 1,
1.05814, -0.5582885, 4.2521, 1, 0, 0.8823529, 1,
1.060681, -0.5186256, 2.068522, 1, 0, 0.8745098, 1,
1.061895, 0.6083059, 0.5196467, 1, 0, 0.8705882, 1,
1.064355, -1.074396, 2.781165, 1, 0, 0.8627451, 1,
1.069234, 1.35734, 0.3594346, 1, 0, 0.8588235, 1,
1.069386, -0.763101, 2.676658, 1, 0, 0.8509804, 1,
1.071656, -2.072895, 3.642165, 1, 0, 0.8470588, 1,
1.076478, -1.619042, 2.357562, 1, 0, 0.8392157, 1,
1.077778, 1.332472, 0.6120518, 1, 0, 0.8352941, 1,
1.081698, -0.1952281, 1.159834, 1, 0, 0.827451, 1,
1.091005, 0.8856384, 3.539474, 1, 0, 0.8235294, 1,
1.091565, -0.3886051, 3.126107, 1, 0, 0.8156863, 1,
1.092826, -0.115945, 2.316413, 1, 0, 0.8117647, 1,
1.09712, 0.6721657, 0.4443564, 1, 0, 0.8039216, 1,
1.098493, -1.202022, 0.07833229, 1, 0, 0.7960784, 1,
1.102081, -2.769033, 2.469483, 1, 0, 0.7921569, 1,
1.105189, -0.01365425, 2.754347, 1, 0, 0.7843137, 1,
1.112978, 0.3473987, 0.6762546, 1, 0, 0.7803922, 1,
1.113223, -1.744116, 4.336423, 1, 0, 0.772549, 1,
1.121767, -0.3275883, 1.188165, 1, 0, 0.7686275, 1,
1.12743, -0.7485586, 1.848754, 1, 0, 0.7607843, 1,
1.129547, -0.4606648, 1.029631, 1, 0, 0.7568628, 1,
1.130483, -0.4570555, 1.775622, 1, 0, 0.7490196, 1,
1.130666, -0.3816355, 0.8807684, 1, 0, 0.7450981, 1,
1.134592, 0.43577, 1.312874, 1, 0, 0.7372549, 1,
1.149242, 1.491028, -0.9916255, 1, 0, 0.7333333, 1,
1.151651, 1.035917, 0.7110324, 1, 0, 0.7254902, 1,
1.153418, 0.8639132, -0.5160971, 1, 0, 0.7215686, 1,
1.153817, -1.824351, 2.950609, 1, 0, 0.7137255, 1,
1.153852, 0.2075484, 0.3759049, 1, 0, 0.7098039, 1,
1.15478, 1.037794, 0.8978047, 1, 0, 0.7019608, 1,
1.161792, 0.2044567, 1.706162, 1, 0, 0.6941177, 1,
1.175732, 1.567966, 2.011056, 1, 0, 0.6901961, 1,
1.176641, 0.5989445, 0.2028845, 1, 0, 0.682353, 1,
1.188372, 1.29537, 0.1017808, 1, 0, 0.6784314, 1,
1.18922, 0.8281406, 2.409289, 1, 0, 0.6705883, 1,
1.189276, -1.129943, 3.718023, 1, 0, 0.6666667, 1,
1.198055, -1.272222, 3.003276, 1, 0, 0.6588235, 1,
1.201475, -0.4679765, 1.604364, 1, 0, 0.654902, 1,
1.208567, -0.1610899, 1.07278, 1, 0, 0.6470588, 1,
1.219048, 2.350565, 1.158773, 1, 0, 0.6431373, 1,
1.219186, -0.7276552, 3.618905, 1, 0, 0.6352941, 1,
1.22233, -0.09962158, 3.412216, 1, 0, 0.6313726, 1,
1.224136, -0.6012749, -0.04358345, 1, 0, 0.6235294, 1,
1.226331, 0.6916493, -0.6004106, 1, 0, 0.6196079, 1,
1.228729, 0.65734, 2.270006, 1, 0, 0.6117647, 1,
1.230157, -0.002865832, -0.01002423, 1, 0, 0.6078432, 1,
1.231081, 1.739383, 0.7644781, 1, 0, 0.6, 1,
1.240861, -1.34638, 3.363088, 1, 0, 0.5921569, 1,
1.241017, 0.4496852, 1.458402, 1, 0, 0.5882353, 1,
1.241401, -0.6478575, 0.3567594, 1, 0, 0.5803922, 1,
1.253816, -0.6199818, 2.26365, 1, 0, 0.5764706, 1,
1.260219, -1.973854, 2.36659, 1, 0, 0.5686275, 1,
1.264663, 0.7988978, 0.3522015, 1, 0, 0.5647059, 1,
1.271243, -0.4322087, -0.1157585, 1, 0, 0.5568628, 1,
1.274817, -0.2358292, 0.399814, 1, 0, 0.5529412, 1,
1.278445, -1.206012, 0.8552343, 1, 0, 0.5450981, 1,
1.278595, 1.951856, 0.9555625, 1, 0, 0.5411765, 1,
1.278818, 0.21524, 2.548723, 1, 0, 0.5333334, 1,
1.284035, -0.1630728, 3.548098, 1, 0, 0.5294118, 1,
1.289251, 1.494287, -1.048718, 1, 0, 0.5215687, 1,
1.319079, 0.6385811, -0.6836979, 1, 0, 0.5176471, 1,
1.337641, 0.7352968, 1.104337, 1, 0, 0.509804, 1,
1.338019, 1.349197, 2.334627, 1, 0, 0.5058824, 1,
1.345075, -0.4935112, 1.421307, 1, 0, 0.4980392, 1,
1.346817, -0.2179054, 3.131443, 1, 0, 0.4901961, 1,
1.362303, -1.083424, 1.139662, 1, 0, 0.4862745, 1,
1.369527, -0.8506384, 0.9993985, 1, 0, 0.4784314, 1,
1.377625, -0.5131298, 0.6316876, 1, 0, 0.4745098, 1,
1.387304, 0.05399896, 2.377395, 1, 0, 0.4666667, 1,
1.392442, 0.2901805, 0.4984924, 1, 0, 0.4627451, 1,
1.404655, 2.386289, -0.06307533, 1, 0, 0.454902, 1,
1.406739, 1.102865, 1.874745, 1, 0, 0.4509804, 1,
1.413392, -1.155619, 2.831532, 1, 0, 0.4431373, 1,
1.417869, -0.3486057, 0.7317477, 1, 0, 0.4392157, 1,
1.419839, -0.6200958, 2.593365, 1, 0, 0.4313726, 1,
1.439597, -1.168298, 3.126776, 1, 0, 0.427451, 1,
1.444786, -0.9871848, 1.474281, 1, 0, 0.4196078, 1,
1.448829, 0.04081955, 1.709459, 1, 0, 0.4156863, 1,
1.459215, 0.512856, 2.132737, 1, 0, 0.4078431, 1,
1.461338, 0.06596008, 2.383172, 1, 0, 0.4039216, 1,
1.46419, -0.3627329, 1.90403, 1, 0, 0.3960784, 1,
1.467518, 0.5382985, 0.736305, 1, 0, 0.3882353, 1,
1.479426, 1.999568, 1.689234, 1, 0, 0.3843137, 1,
1.483488, -1.749187, 5.125451, 1, 0, 0.3764706, 1,
1.488108, -1.532306, 3.255482, 1, 0, 0.372549, 1,
1.499744, 0.9603783, 0.5111489, 1, 0, 0.3647059, 1,
1.501907, 0.4118601, 2.070848, 1, 0, 0.3607843, 1,
1.511207, -0.745111, 1.956748, 1, 0, 0.3529412, 1,
1.553535, 0.4441645, 1.26865, 1, 0, 0.3490196, 1,
1.56537, -0.9203351, 3.395548, 1, 0, 0.3411765, 1,
1.568745, 0.9423056, 0.5866197, 1, 0, 0.3372549, 1,
1.569391, -0.2246896, 1.842691, 1, 0, 0.3294118, 1,
1.580405, -0.03134023, 1.789031, 1, 0, 0.3254902, 1,
1.59045, -1.106605, 2.832115, 1, 0, 0.3176471, 1,
1.590885, -0.276993, 1.502318, 1, 0, 0.3137255, 1,
1.603094, 0.9148907, 2.321862, 1, 0, 0.3058824, 1,
1.604771, -0.8169863, 2.60026, 1, 0, 0.2980392, 1,
1.613968, 0.4895871, 2.697092, 1, 0, 0.2941177, 1,
1.635512, 0.258346, 2.262686, 1, 0, 0.2862745, 1,
1.636196, -0.8473933, 2.122138, 1, 0, 0.282353, 1,
1.637876, 2.131554, 2.009497, 1, 0, 0.2745098, 1,
1.654208, 0.07584459, 2.07773, 1, 0, 0.2705882, 1,
1.657841, 1.434614, 2.610306, 1, 0, 0.2627451, 1,
1.660794, -0.5880005, 2.540056, 1, 0, 0.2588235, 1,
1.663713, -0.3655703, 2.393826, 1, 0, 0.2509804, 1,
1.672257, -0.6400062, 2.262146, 1, 0, 0.2470588, 1,
1.686297, 1.419035, 1.531962, 1, 0, 0.2392157, 1,
1.69041, 1.18462, 1.550408, 1, 0, 0.2352941, 1,
1.694328, 2.197026, 1.200512, 1, 0, 0.227451, 1,
1.708104, 0.9292347, 1.808977, 1, 0, 0.2235294, 1,
1.711119, 2.240695, -1.680675, 1, 0, 0.2156863, 1,
1.731294, 0.7475937, 1.088388, 1, 0, 0.2117647, 1,
1.749034, -0.9587865, 1.343022, 1, 0, 0.2039216, 1,
1.754646, -0.3613401, 3.159328, 1, 0, 0.1960784, 1,
1.766674, -0.848816, 1.438028, 1, 0, 0.1921569, 1,
1.772708, 0.4549387, 1.414503, 1, 0, 0.1843137, 1,
1.799617, -0.479991, 0.4627787, 1, 0, 0.1803922, 1,
1.811967, -0.009257697, 0.5923895, 1, 0, 0.172549, 1,
1.831328, -1.804589, 3.016339, 1, 0, 0.1686275, 1,
1.84697, 0.5598366, 1.099328, 1, 0, 0.1607843, 1,
1.917398, 0.2831325, 1.954803, 1, 0, 0.1568628, 1,
1.924535, 2.14701, 1.146787, 1, 0, 0.1490196, 1,
1.927666, -0.1315894, 2.00655, 1, 0, 0.145098, 1,
1.938858, -1.209417, 2.256828, 1, 0, 0.1372549, 1,
1.941563, 1.415804, -1.073077, 1, 0, 0.1333333, 1,
1.994061, -1.61471, 1.34734, 1, 0, 0.1254902, 1,
1.994265, -0.08895525, 1.661296, 1, 0, 0.1215686, 1,
2.007849, 0.04622822, 2.398946, 1, 0, 0.1137255, 1,
2.011421, -0.1437886, 1.46482, 1, 0, 0.1098039, 1,
2.012385, -0.7073724, -0.08378372, 1, 0, 0.1019608, 1,
2.013402, 1.637195, -0.4105545, 1, 0, 0.09411765, 1,
2.075167, 0.1754631, 2.117761, 1, 0, 0.09019608, 1,
2.078128, -1.784854, 2.406951, 1, 0, 0.08235294, 1,
2.142292, -2.055279, 2.698646, 1, 0, 0.07843138, 1,
2.177931, 1.002637, 1.836963, 1, 0, 0.07058824, 1,
2.228548, -0.5216287, 0.7401136, 1, 0, 0.06666667, 1,
2.232481, 0.9860218, 2.230452, 1, 0, 0.05882353, 1,
2.271048, -0.7560867, 2.379667, 1, 0, 0.05490196, 1,
2.311852, 0.2443471, 1.042169, 1, 0, 0.04705882, 1,
2.331696, -1.857648, 3.225242, 1, 0, 0.04313726, 1,
2.400006, -0.2030656, 1.421827, 1, 0, 0.03529412, 1,
2.458466, -0.541137, 0.6608623, 1, 0, 0.03137255, 1,
2.497156, 0.2012255, 1.741649, 1, 0, 0.02352941, 1,
2.577411, -0.8380643, 3.515381, 1, 0, 0.01960784, 1,
3.163967, 1.717925, 2.045264, 1, 0, 0.01176471, 1,
3.221123, -1.34413, 4.154523, 1, 0, 0.007843138, 1
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
-0.5476404, -5.63133, -6.632639, 0, -0.5, 0.5, 0.5,
-0.5476404, -5.63133, -6.632639, 1, -0.5, 0.5, 0.5,
-0.5476404, -5.63133, -6.632639, 1, 1.5, 0.5, 0.5,
-0.5476404, -5.63133, -6.632639, 0, 1.5, 0.5, 0.5
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
-5.594015, -0.3008969, -6.632639, 0, -0.5, 0.5, 0.5,
-5.594015, -0.3008969, -6.632639, 1, -0.5, 0.5, 0.5,
-5.594015, -0.3008969, -6.632639, 1, 1.5, 0.5, 0.5,
-5.594015, -0.3008969, -6.632639, 0, 1.5, 0.5, 0.5
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
-5.594015, -5.63133, 0.09847808, 0, -0.5, 0.5, 0.5,
-5.594015, -5.63133, 0.09847808, 1, -0.5, 0.5, 0.5,
-5.594015, -5.63133, 0.09847808, 1, 1.5, 0.5, 0.5,
-5.594015, -5.63133, 0.09847808, 0, 1.5, 0.5, 0.5
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
-4, -4.40123, -5.079304,
2, -4.40123, -5.079304,
-4, -4.40123, -5.079304,
-4, -4.606246, -5.338193,
-2, -4.40123, -5.079304,
-2, -4.606246, -5.338193,
0, -4.40123, -5.079304,
0, -4.606246, -5.338193,
2, -4.40123, -5.079304,
2, -4.606246, -5.338193
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
"-4",
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
-4, -5.01628, -5.855971, 0, -0.5, 0.5, 0.5,
-4, -5.01628, -5.855971, 1, -0.5, 0.5, 0.5,
-4, -5.01628, -5.855971, 1, 1.5, 0.5, 0.5,
-4, -5.01628, -5.855971, 0, 1.5, 0.5, 0.5,
-2, -5.01628, -5.855971, 0, -0.5, 0.5, 0.5,
-2, -5.01628, -5.855971, 1, -0.5, 0.5, 0.5,
-2, -5.01628, -5.855971, 1, 1.5, 0.5, 0.5,
-2, -5.01628, -5.855971, 0, 1.5, 0.5, 0.5,
0, -5.01628, -5.855971, 0, -0.5, 0.5, 0.5,
0, -5.01628, -5.855971, 1, -0.5, 0.5, 0.5,
0, -5.01628, -5.855971, 1, 1.5, 0.5, 0.5,
0, -5.01628, -5.855971, 0, 1.5, 0.5, 0.5,
2, -5.01628, -5.855971, 0, -0.5, 0.5, 0.5,
2, -5.01628, -5.855971, 1, -0.5, 0.5, 0.5,
2, -5.01628, -5.855971, 1, 1.5, 0.5, 0.5,
2, -5.01628, -5.855971, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.429467, -4, -5.079304,
-4.429467, 2, -5.079304,
-4.429467, -4, -5.079304,
-4.623559, -4, -5.338193,
-4.429467, -2, -5.079304,
-4.623559, -2, -5.338193,
-4.429467, 0, -5.079304,
-4.623559, 0, -5.338193,
-4.429467, 2, -5.079304,
-4.623559, 2, -5.338193
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
"-4",
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
-5.011741, -4, -5.855971, 0, -0.5, 0.5, 0.5,
-5.011741, -4, -5.855971, 1, -0.5, 0.5, 0.5,
-5.011741, -4, -5.855971, 1, 1.5, 0.5, 0.5,
-5.011741, -4, -5.855971, 0, 1.5, 0.5, 0.5,
-5.011741, -2, -5.855971, 0, -0.5, 0.5, 0.5,
-5.011741, -2, -5.855971, 1, -0.5, 0.5, 0.5,
-5.011741, -2, -5.855971, 1, 1.5, 0.5, 0.5,
-5.011741, -2, -5.855971, 0, 1.5, 0.5, 0.5,
-5.011741, 0, -5.855971, 0, -0.5, 0.5, 0.5,
-5.011741, 0, -5.855971, 1, -0.5, 0.5, 0.5,
-5.011741, 0, -5.855971, 1, 1.5, 0.5, 0.5,
-5.011741, 0, -5.855971, 0, 1.5, 0.5, 0.5,
-5.011741, 2, -5.855971, 0, -0.5, 0.5, 0.5,
-5.011741, 2, -5.855971, 1, -0.5, 0.5, 0.5,
-5.011741, 2, -5.855971, 1, 1.5, 0.5, 0.5,
-5.011741, 2, -5.855971, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.429467, -4.40123, -4,
-4.429467, -4.40123, 4,
-4.429467, -4.40123, -4,
-4.623559, -4.606246, -4,
-4.429467, -4.40123, -2,
-4.623559, -4.606246, -2,
-4.429467, -4.40123, 0,
-4.623559, -4.606246, 0,
-4.429467, -4.40123, 2,
-4.623559, -4.606246, 2,
-4.429467, -4.40123, 4,
-4.623559, -4.606246, 4
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
-5.011741, -5.01628, -4, 0, -0.5, 0.5, 0.5,
-5.011741, -5.01628, -4, 1, -0.5, 0.5, 0.5,
-5.011741, -5.01628, -4, 1, 1.5, 0.5, 0.5,
-5.011741, -5.01628, -4, 0, 1.5, 0.5, 0.5,
-5.011741, -5.01628, -2, 0, -0.5, 0.5, 0.5,
-5.011741, -5.01628, -2, 1, -0.5, 0.5, 0.5,
-5.011741, -5.01628, -2, 1, 1.5, 0.5, 0.5,
-5.011741, -5.01628, -2, 0, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 0, 0, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 0, 1, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 0, 1, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 0, 0, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 2, 0, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 2, 1, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 2, 1, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 2, 0, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 4, 0, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 4, 1, -0.5, 0.5, 0.5,
-5.011741, -5.01628, 4, 1, 1.5, 0.5, 0.5,
-5.011741, -5.01628, 4, 0, 1.5, 0.5, 0.5
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
-4.429467, -4.40123, -5.079304,
-4.429467, 3.799436, -5.079304,
-4.429467, -4.40123, 5.27626,
-4.429467, 3.799436, 5.27626,
-4.429467, -4.40123, -5.079304,
-4.429467, -4.40123, 5.27626,
-4.429467, 3.799436, -5.079304,
-4.429467, 3.799436, 5.27626,
-4.429467, -4.40123, -5.079304,
3.334186, -4.40123, -5.079304,
-4.429467, -4.40123, 5.27626,
3.334186, -4.40123, 5.27626,
-4.429467, 3.799436, -5.079304,
3.334186, 3.799436, -5.079304,
-4.429467, 3.799436, 5.27626,
3.334186, 3.799436, 5.27626,
3.334186, -4.40123, -5.079304,
3.334186, 3.799436, -5.079304,
3.334186, -4.40123, 5.27626,
3.334186, 3.799436, 5.27626,
3.334186, -4.40123, -5.079304,
3.334186, -4.40123, 5.27626,
3.334186, 3.799436, -5.079304,
3.334186, 3.799436, 5.27626
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
var radius = 8.181638;
var distance = 36.40103;
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
mvMatrix.translate( 0.5476404, 0.3008969, -0.09847808 );
mvMatrix.scale( 1.139431, 1.078711, 0.854241 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.40103);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
cacodylate_ion<-read.table("cacodylate_ion.xyz")
```

```
## Error in read.table("cacodylate_ion.xyz"): no lines available in input
```

```r
x<-cacodylate_ion$V2
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
```

```r
y<-cacodylate_ion$V3
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
```

```r
z<-cacodylate_ion$V4
```

```
## Error in eval(expr, envir, enclos): object 'cacodylate_ion' not found
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
-4.316404, -2.3726, -2.12067, 0, 0, 1, 1, 1,
-3.322609, -0.0646112, -3.501848, 1, 0, 0, 1, 1,
-2.692288, 1.185591, -0.6011246, 1, 0, 0, 1, 1,
-2.679257, 1.256819, -1.681896, 1, 0, 0, 1, 1,
-2.594826, -0.6706289, -0.331714, 1, 0, 0, 1, 1,
-2.565501, -0.8357191, -1.809348, 1, 0, 0, 1, 1,
-2.550072, -0.54844, -1.340411, 0, 0, 0, 1, 1,
-2.439728, -1.941271, -2.38957, 0, 0, 0, 1, 1,
-2.408954, -0.7130239, -1.393418, 0, 0, 0, 1, 1,
-2.400221, -0.5363259, -2.962608, 0, 0, 0, 1, 1,
-2.389897, -0.9775666, -2.436317, 0, 0, 0, 1, 1,
-2.340543, 0.2385589, -1.743847, 0, 0, 0, 1, 1,
-2.297931, -1.066066, -0.824648, 0, 0, 0, 1, 1,
-2.250465, -1.39172, -2.312093, 1, 1, 1, 1, 1,
-2.245283, -1.880109, -0.0617872, 1, 1, 1, 1, 1,
-2.1969, 0.2576605, -1.211939, 1, 1, 1, 1, 1,
-2.148653, 0.2922882, -0.5749676, 1, 1, 1, 1, 1,
-2.145113, 0.2488604, -1.155856, 1, 1, 1, 1, 1,
-2.093029, -0.6163623, -1.722568, 1, 1, 1, 1, 1,
-2.088531, -1.121055, -2.019049, 1, 1, 1, 1, 1,
-2.075465, -1.006847, -2.952584, 1, 1, 1, 1, 1,
-2.051366, -1.615915, -0.7782388, 1, 1, 1, 1, 1,
-2.004103, 0.5552365, -2.356028, 1, 1, 1, 1, 1,
-1.996323, -1.347793, -2.519288, 1, 1, 1, 1, 1,
-1.99228, 2.393759, -0.8129326, 1, 1, 1, 1, 1,
-1.962495, 0.6987732, -1.282573, 1, 1, 1, 1, 1,
-1.944225, 1.433345, -0.1469673, 1, 1, 1, 1, 1,
-1.9351, 0.8756772, -0.4222009, 1, 1, 1, 1, 1,
-1.911295, 0.959447, -1.046099, 0, 0, 1, 1, 1,
-1.902581, 0.1067556, -0.8220459, 1, 0, 0, 1, 1,
-1.884825, -0.6165203, -2.651493, 1, 0, 0, 1, 1,
-1.879155, 0.08089387, -0.7759878, 1, 0, 0, 1, 1,
-1.874217, 0.003421752, -0.8534667, 1, 0, 0, 1, 1,
-1.852281, -0.3941403, -2.092558, 1, 0, 0, 1, 1,
-1.840233, -0.07781115, -2.798762, 0, 0, 0, 1, 1,
-1.833824, 2.112816, -2.033403, 0, 0, 0, 1, 1,
-1.831228, 0.2336342, -2.712287, 0, 0, 0, 1, 1,
-1.821633, 1.873856, -1.302412, 0, 0, 0, 1, 1,
-1.796245, -0.5404927, -2.909769, 0, 0, 0, 1, 1,
-1.789698, -2.424122, -2.721604, 0, 0, 0, 1, 1,
-1.783708, 2.418861, -0.2367417, 0, 0, 0, 1, 1,
-1.771461, -1.580847, -1.393294, 1, 1, 1, 1, 1,
-1.745012, 0.2698803, -1.175447, 1, 1, 1, 1, 1,
-1.738266, -0.8209519, -3.903199, 1, 1, 1, 1, 1,
-1.72557, -0.7497295, -1.658611, 1, 1, 1, 1, 1,
-1.689691, 1.614105, -0.9538831, 1, 1, 1, 1, 1,
-1.688264, -1.578344, -1.341958, 1, 1, 1, 1, 1,
-1.673647, -0.379477, 0.1514188, 1, 1, 1, 1, 1,
-1.672718, 0.5034107, -1.474397, 1, 1, 1, 1, 1,
-1.659313, -0.644521, -2.894181, 1, 1, 1, 1, 1,
-1.65887, 1.378869, -2.553782, 1, 1, 1, 1, 1,
-1.652928, 0.5416254, -1.683978, 1, 1, 1, 1, 1,
-1.628117, -0.4078341, -2.754462, 1, 1, 1, 1, 1,
-1.616516, -2.526217, -2.100707, 1, 1, 1, 1, 1,
-1.593494, 0.8535511, -2.09951, 1, 1, 1, 1, 1,
-1.588764, -0.2983094, -1.81469, 1, 1, 1, 1, 1,
-1.588036, 0.5633268, -2.385331, 0, 0, 1, 1, 1,
-1.579769, -1.868742, -0.09986803, 1, 0, 0, 1, 1,
-1.575145, 0.8875051, -1.136257, 1, 0, 0, 1, 1,
-1.570889, 1.163381, -1.493378, 1, 0, 0, 1, 1,
-1.570403, -1.01082, -1.453415, 1, 0, 0, 1, 1,
-1.566863, -0.3053928, -1.585453, 1, 0, 0, 1, 1,
-1.556528, -2.009451, -2.364732, 0, 0, 0, 1, 1,
-1.554053, -1.112114, -0.654539, 0, 0, 0, 1, 1,
-1.55401, -0.004459875, -3.025759, 0, 0, 0, 1, 1,
-1.53855, -0.2809781, -2.255844, 0, 0, 0, 1, 1,
-1.535337, -0.6964414, -1.942217, 0, 0, 0, 1, 1,
-1.532874, 1.172137, 0.1404867, 0, 0, 0, 1, 1,
-1.532458, 0.5664012, 0.7070639, 0, 0, 0, 1, 1,
-1.526489, 0.87143, -3.082391, 1, 1, 1, 1, 1,
-1.52193, 0.05897164, -0.2592631, 1, 1, 1, 1, 1,
-1.511964, -0.9859182, -0.2924262, 1, 1, 1, 1, 1,
-1.503796, -1.098711, -1.791664, 1, 1, 1, 1, 1,
-1.50303, -0.02554426, -1.178819, 1, 1, 1, 1, 1,
-1.50025, 2.091364, -2.322374, 1, 1, 1, 1, 1,
-1.49049, -0.6910817, -3.887271, 1, 1, 1, 1, 1,
-1.478605, -1.379327, -2.180904, 1, 1, 1, 1, 1,
-1.476924, 0.3428847, -1.243167, 1, 1, 1, 1, 1,
-1.464607, 1.167511, -1.399355, 1, 1, 1, 1, 1,
-1.45423, -1.310011, -2.831094, 1, 1, 1, 1, 1,
-1.451659, 0.3366313, -1.501834, 1, 1, 1, 1, 1,
-1.451652, -0.5194494, -2.466372, 1, 1, 1, 1, 1,
-1.44884, -0.6562226, -3.862217, 1, 1, 1, 1, 1,
-1.43604, -0.3488614, -1.872456, 1, 1, 1, 1, 1,
-1.433067, -0.2748611, 0.07502995, 0, 0, 1, 1, 1,
-1.423862, 0.8011997, -1.489259, 1, 0, 0, 1, 1,
-1.416172, -0.07825188, -1.177814, 1, 0, 0, 1, 1,
-1.413726, 0.5790504, -1.038275, 1, 0, 0, 1, 1,
-1.412792, -0.7278682, -1.842455, 1, 0, 0, 1, 1,
-1.410054, -0.8690802, -0.8946044, 1, 0, 0, 1, 1,
-1.407573, -0.1031894, -2.540257, 0, 0, 0, 1, 1,
-1.406993, -0.4811637, -2.55921, 0, 0, 0, 1, 1,
-1.398268, -0.8006536, -1.361705, 0, 0, 0, 1, 1,
-1.390943, -0.0252643, -2.541728, 0, 0, 0, 1, 1,
-1.387576, -0.1559913, -2.125069, 0, 0, 0, 1, 1,
-1.38583, -0.06182786, -1.568709, 0, 0, 0, 1, 1,
-1.365627, 0.4050284, -0.6440105, 0, 0, 0, 1, 1,
-1.352107, -1.365057, -2.371265, 1, 1, 1, 1, 1,
-1.351822, -0.1687295, -2.871248, 1, 1, 1, 1, 1,
-1.341679, 0.3177462, -1.135395, 1, 1, 1, 1, 1,
-1.34104, 2.059292, -1.21818, 1, 1, 1, 1, 1,
-1.333954, 1.864519, -0.3262543, 1, 1, 1, 1, 1,
-1.316199, 0.2749784, -1.115335, 1, 1, 1, 1, 1,
-1.311767, 0.1985776, -1.974509, 1, 1, 1, 1, 1,
-1.311127, 0.7900982, -0.9173382, 1, 1, 1, 1, 1,
-1.311051, -0.2682469, -0.8406371, 1, 1, 1, 1, 1,
-1.309797, -0.7666268, -2.973899, 1, 1, 1, 1, 1,
-1.309585, -1.348037, -3.345743, 1, 1, 1, 1, 1,
-1.307854, 0.932384, 0.9884961, 1, 1, 1, 1, 1,
-1.306176, -0.9482996, -0.9562491, 1, 1, 1, 1, 1,
-1.294372, -0.909242, -3.063526, 1, 1, 1, 1, 1,
-1.293721, 0.9175943, -1.479979, 1, 1, 1, 1, 1,
-1.29361, -0.08567801, 0.6605296, 0, 0, 1, 1, 1,
-1.292551, 0.263583, 0.08349405, 1, 0, 0, 1, 1,
-1.291496, 1.500161, -1.673772, 1, 0, 0, 1, 1,
-1.290522, 1.310963, -1.043565, 1, 0, 0, 1, 1,
-1.280894, 0.8609994, -1.136986, 1, 0, 0, 1, 1,
-1.273712, -0.1371773, -0.4853796, 1, 0, 0, 1, 1,
-1.264545, 1.49601, 1.122319, 0, 0, 0, 1, 1,
-1.253881, 0.5129638, -0.6608168, 0, 0, 0, 1, 1,
-1.236232, 0.5674824, -3.035157, 0, 0, 0, 1, 1,
-1.230698, -0.03252411, -1.39502, 0, 0, 0, 1, 1,
-1.22897, -2.541802, -2.839178, 0, 0, 0, 1, 1,
-1.227271, -2.22182, -3.845977, 0, 0, 0, 1, 1,
-1.224162, -0.2611122, -2.069078, 0, 0, 0, 1, 1,
-1.217068, 1.698802, 0.7353932, 1, 1, 1, 1, 1,
-1.211705, 0.8683639, -1.833929, 1, 1, 1, 1, 1,
-1.203672, 1.005038, -1.768351, 1, 1, 1, 1, 1,
-1.201891, 0.6105185, 0.6137714, 1, 1, 1, 1, 1,
-1.19887, -0.4822962, 0.02353128, 1, 1, 1, 1, 1,
-1.198548, 0.1370724, -0.9841478, 1, 1, 1, 1, 1,
-1.194364, -0.008098922, -1.540825, 1, 1, 1, 1, 1,
-1.190472, 1.407336, 0.05503553, 1, 1, 1, 1, 1,
-1.18181, -2.205226, -2.027869, 1, 1, 1, 1, 1,
-1.176523, -0.4216998, -1.645186, 1, 1, 1, 1, 1,
-1.174625, 0.8061724, -1.42451, 1, 1, 1, 1, 1,
-1.171096, -0.8783959, -3.379545, 1, 1, 1, 1, 1,
-1.168946, 1.828782, -1.322458, 1, 1, 1, 1, 1,
-1.162433, 1.200652, -2.576874, 1, 1, 1, 1, 1,
-1.160998, -0.8199049, -2.723295, 1, 1, 1, 1, 1,
-1.139276, 1.199221, -0.5918171, 0, 0, 1, 1, 1,
-1.138486, -0.3430153, -1.684957, 1, 0, 0, 1, 1,
-1.133844, 0.774511, 0.1762684, 1, 0, 0, 1, 1,
-1.132321, 0.3638746, -1.331694, 1, 0, 0, 1, 1,
-1.123389, 0.761453, -2.151062, 1, 0, 0, 1, 1,
-1.118726, 0.1967253, -1.545516, 1, 0, 0, 1, 1,
-1.113655, -0.691408, -2.963241, 0, 0, 0, 1, 1,
-1.11175, -1.341339, -1.180571, 0, 0, 0, 1, 1,
-1.110298, -0.5918202, -0.679531, 0, 0, 0, 1, 1,
-1.104632, 1.628116, -0.4538909, 0, 0, 0, 1, 1,
-1.100769, 0.1662007, -1.842818, 0, 0, 0, 1, 1,
-1.100613, -0.2229995, -1.533825, 0, 0, 0, 1, 1,
-1.097159, -0.142529, -2.306892, 0, 0, 0, 1, 1,
-1.096296, 1.54502, 0.4720343, 1, 1, 1, 1, 1,
-1.095412, 0.400994, 0.1045971, 1, 1, 1, 1, 1,
-1.09435, -0.2565731, -1.541226, 1, 1, 1, 1, 1,
-1.093628, 1.200203, 0.3957986, 1, 1, 1, 1, 1,
-1.077051, 0.6018858, -1.695135, 1, 1, 1, 1, 1,
-1.07214, -1.044329, -3.870351, 1, 1, 1, 1, 1,
-1.067722, 1.834297, -0.1462924, 1, 1, 1, 1, 1,
-1.065789, -1.198471, -2.582205, 1, 1, 1, 1, 1,
-1.059193, -0.2789637, -2.219156, 1, 1, 1, 1, 1,
-1.05787, 0.8443595, -0.07645085, 1, 1, 1, 1, 1,
-1.052934, 0.3384184, -1.229258, 1, 1, 1, 1, 1,
-1.050902, -0.7135859, -2.719874, 1, 1, 1, 1, 1,
-1.046186, -0.4032716, -2.005738, 1, 1, 1, 1, 1,
-1.045478, -1.135871, -3.095281, 1, 1, 1, 1, 1,
-1.037193, 0.577214, -0.8592002, 1, 1, 1, 1, 1,
-1.031585, 0.05117302, -3.983677, 0, 0, 1, 1, 1,
-1.030607, 1.233715, 1.233263, 1, 0, 0, 1, 1,
-1.022532, -1.056489, -3.303161, 1, 0, 0, 1, 1,
-1.022157, -0.2384426, -2.495384, 1, 0, 0, 1, 1,
-1.020627, -0.2920018, -1.752762, 1, 0, 0, 1, 1,
-1.015791, 1.050832, 0.8738213, 1, 0, 0, 1, 1,
-1.014048, -1.202868, -2.36817, 0, 0, 0, 1, 1,
-1.004712, -0.8189265, -0.6737351, 0, 0, 0, 1, 1,
-1.003289, 0.5486382, -0.72395, 0, 0, 0, 1, 1,
-0.9940637, 0.1857648, -1.937744, 0, 0, 0, 1, 1,
-0.9909698, -1.084613, -3.125849, 0, 0, 0, 1, 1,
-0.9858716, 1.627599, 0.8560961, 0, 0, 0, 1, 1,
-0.9855418, 0.8998416, -2.990236, 0, 0, 0, 1, 1,
-0.9829859, -0.5761931, -2.874309, 1, 1, 1, 1, 1,
-0.9541909, -1.654686, -3.808156, 1, 1, 1, 1, 1,
-0.9537069, 0.2758219, -0.8653885, 1, 1, 1, 1, 1,
-0.9483592, -1.860754, -2.539695, 1, 1, 1, 1, 1,
-0.9470698, -1.119717, -3.579594, 1, 1, 1, 1, 1,
-0.9427575, 0.121378, -1.664662, 1, 1, 1, 1, 1,
-0.9413987, -0.0430175, -3.681681, 1, 1, 1, 1, 1,
-0.9388054, -0.2971542, -1.567512, 1, 1, 1, 1, 1,
-0.9341701, -1.632959, -2.406242, 1, 1, 1, 1, 1,
-0.9244751, -0.3304895, -3.011915, 1, 1, 1, 1, 1,
-0.9122981, -0.7079631, -0.9301249, 1, 1, 1, 1, 1,
-0.9076306, 0.4780883, -2.022541, 1, 1, 1, 1, 1,
-0.9068775, 0.6341069, 1.022954, 1, 1, 1, 1, 1,
-0.9031739, 0.805204, -1.89165, 1, 1, 1, 1, 1,
-0.9009156, 0.9110274, -0.2350389, 1, 1, 1, 1, 1,
-0.8992521, -0.4728803, -1.404176, 0, 0, 1, 1, 1,
-0.8929364, -1.622257, -3.169521, 1, 0, 0, 1, 1,
-0.8864251, 0.0880558, -0.4239396, 1, 0, 0, 1, 1,
-0.8840269, 0.1395951, -2.582911, 1, 0, 0, 1, 1,
-0.8736835, -1.288398, -2.275783, 1, 0, 0, 1, 1,
-0.8701341, 0.2109092, -0.7449709, 1, 0, 0, 1, 1,
-0.8698894, 0.071304, -2.493329, 0, 0, 0, 1, 1,
-0.8651657, -1.705185, -1.910521, 0, 0, 0, 1, 1,
-0.856959, 0.5500284, -1.645899, 0, 0, 0, 1, 1,
-0.8532332, -0.08643819, -2.533815, 0, 0, 0, 1, 1,
-0.8480241, -2.062553, -1.874892, 0, 0, 0, 1, 1,
-0.8477405, -0.7376133, -2.036136, 0, 0, 0, 1, 1,
-0.8473554, -0.06628198, -1.126344, 0, 0, 0, 1, 1,
-0.8421136, -0.5855817, -1.514802, 1, 1, 1, 1, 1,
-0.8408593, -1.680276, -2.478188, 1, 1, 1, 1, 1,
-0.8407045, -1.38393, -4.26283, 1, 1, 1, 1, 1,
-0.8333632, -1.515275, -2.471965, 1, 1, 1, 1, 1,
-0.8332316, 0.9701913, 0.1104127, 1, 1, 1, 1, 1,
-0.8325888, -0.3786387, -0.8134354, 1, 1, 1, 1, 1,
-0.8238533, -0.3041769, -3.012956, 1, 1, 1, 1, 1,
-0.8225719, 0.4426025, -0.9992501, 1, 1, 1, 1, 1,
-0.8211418, -0.5647, -1.018685, 1, 1, 1, 1, 1,
-0.8134779, -0.3105575, -2.452569, 1, 1, 1, 1, 1,
-0.811084, 0.08260176, 0.1765957, 1, 1, 1, 1, 1,
-0.8097802, 0.3847458, -0.5706182, 1, 1, 1, 1, 1,
-0.8082678, 0.6212038, -0.6534152, 1, 1, 1, 1, 1,
-0.8040492, 0.07647534, -2.188656, 1, 1, 1, 1, 1,
-0.8026613, -0.4879079, -2.040887, 1, 1, 1, 1, 1,
-0.7958142, -1.456086, -2.167294, 0, 0, 1, 1, 1,
-0.7951248, -0.5234707, -3.502608, 1, 0, 0, 1, 1,
-0.7917283, -0.06170072, -2.308047, 1, 0, 0, 1, 1,
-0.787253, -0.7647099, -1.016747, 1, 0, 0, 1, 1,
-0.7852691, -0.4005284, -0.4404346, 1, 0, 0, 1, 1,
-0.779488, -0.2317639, -2.079186, 1, 0, 0, 1, 1,
-0.7739362, 0.1384408, -1.039466, 0, 0, 0, 1, 1,
-0.7719566, -0.3858367, -2.064687, 0, 0, 0, 1, 1,
-0.7713022, 0.519694, 0.3336262, 0, 0, 0, 1, 1,
-0.7710872, -0.8049883, -1.891471, 0, 0, 0, 1, 1,
-0.7710595, -0.4901825, -1.73278, 0, 0, 0, 1, 1,
-0.7694582, 0.09083784, -0.6169338, 0, 0, 0, 1, 1,
-0.7680013, -1.012328, -2.39991, 0, 0, 0, 1, 1,
-0.7656192, -0.2908646, -0.2928845, 1, 1, 1, 1, 1,
-0.7620311, 0.5922499, 0.9291028, 1, 1, 1, 1, 1,
-0.7581182, -1.085546, -2.949337, 1, 1, 1, 1, 1,
-0.7557822, 0.07126433, -2.950558, 1, 1, 1, 1, 1,
-0.7551027, 1.0799, 0.2665848, 1, 1, 1, 1, 1,
-0.7540537, 0.3637874, -1.022728, 1, 1, 1, 1, 1,
-0.7495646, -1.43565, -2.406018, 1, 1, 1, 1, 1,
-0.7405045, 1.620599, 0.823572, 1, 1, 1, 1, 1,
-0.7400507, 0.2513177, -1.179609, 1, 1, 1, 1, 1,
-0.739887, 0.2021891, -1.733448, 1, 1, 1, 1, 1,
-0.7370359, 0.836079, -0.4831238, 1, 1, 1, 1, 1,
-0.7368279, 0.4988298, -1.312696, 1, 1, 1, 1, 1,
-0.7339365, -0.444598, -3.031106, 1, 1, 1, 1, 1,
-0.7321758, -2.727061, -0.09005187, 1, 1, 1, 1, 1,
-0.7278035, 0.4583975, -1.176815, 1, 1, 1, 1, 1,
-0.7275657, 0.824658, -0.7097539, 0, 0, 1, 1, 1,
-0.7269221, -0.114224, 0.1124815, 1, 0, 0, 1, 1,
-0.7235336, -0.6661308, -2.792662, 1, 0, 0, 1, 1,
-0.7230145, -0.8707717, -2.457602, 1, 0, 0, 1, 1,
-0.7228085, -1.588762, -3.353175, 1, 0, 0, 1, 1,
-0.722519, -1.007155, -1.166192, 1, 0, 0, 1, 1,
-0.719367, 0.5866135, -2.092843, 0, 0, 0, 1, 1,
-0.7101117, -0.4423902, -1.081214, 0, 0, 0, 1, 1,
-0.7091094, -0.8770803, -2.004687, 0, 0, 0, 1, 1,
-0.7088786, -0.3791224, -2.820725, 0, 0, 0, 1, 1,
-0.7084813, 1.687941, -0.9552437, 0, 0, 0, 1, 1,
-0.7045657, -0.827154, -3.538837, 0, 0, 0, 1, 1,
-0.7038112, -1.367132, -3.675061, 0, 0, 0, 1, 1,
-0.7037025, -1.507667, -0.3248894, 1, 1, 1, 1, 1,
-0.7030289, -1.520304, -4.928495, 1, 1, 1, 1, 1,
-0.692665, 1.23397, 0.1270208, 1, 1, 1, 1, 1,
-0.683432, -0.4101383, -1.62268, 1, 1, 1, 1, 1,
-0.6829425, -0.007118766, -1.522084, 1, 1, 1, 1, 1,
-0.6825687, 1.291351, 0.6083452, 1, 1, 1, 1, 1,
-0.6771542, 2.331978, -0.02127125, 1, 1, 1, 1, 1,
-0.6753491, 0.8132924, -1.49172, 1, 1, 1, 1, 1,
-0.6736733, 0.6404215, -1.137551, 1, 1, 1, 1, 1,
-0.6713938, -0.1228746, -2.537539, 1, 1, 1, 1, 1,
-0.6688546, -0.3189189, -1.871765, 1, 1, 1, 1, 1,
-0.6681221, -0.5699248, -2.394934, 1, 1, 1, 1, 1,
-0.6649929, -1.023702, -3.842762, 1, 1, 1, 1, 1,
-0.6649405, 1.940626, -0.7541151, 1, 1, 1, 1, 1,
-0.6645619, 0.08200756, -1.90372, 1, 1, 1, 1, 1,
-0.6639737, 0.921482, -2.467647, 0, 0, 1, 1, 1,
-0.6450151, 0.4467505, -1.699653, 1, 0, 0, 1, 1,
-0.6419271, -0.6154205, -3.300692, 1, 0, 0, 1, 1,
-0.6390412, -0.1216356, -0.9277906, 1, 0, 0, 1, 1,
-0.6235405, 0.4654175, 0.07630301, 1, 0, 0, 1, 1,
-0.6207445, 1.285174, 0.2823343, 1, 0, 0, 1, 1,
-0.6202289, -0.5044318, -1.380158, 0, 0, 0, 1, 1,
-0.6131604, 0.6321422, -0.6728232, 0, 0, 0, 1, 1,
-0.6119561, 1.530554, -1.061094, 0, 0, 0, 1, 1,
-0.6072135, -0.5795134, -3.91301, 0, 0, 0, 1, 1,
-0.6063398, 0.3825257, 0.1391535, 0, 0, 0, 1, 1,
-0.6019425, 0.3900201, -0.7283319, 0, 0, 0, 1, 1,
-0.5974922, 0.3303201, -1.714136, 0, 0, 0, 1, 1,
-0.5969347, 0.5921216, -0.5933844, 1, 1, 1, 1, 1,
-0.5913225, -1.158399, -2.130111, 1, 1, 1, 1, 1,
-0.5880302, 0.8772234, -0.9985107, 1, 1, 1, 1, 1,
-0.5762032, 0.2251964, -2.553412, 1, 1, 1, 1, 1,
-0.5737011, -1.175615, -1.847278, 1, 1, 1, 1, 1,
-0.5732604, -1.585165, -2.051401, 1, 1, 1, 1, 1,
-0.5728131, 0.08373699, 0.6429901, 1, 1, 1, 1, 1,
-0.5684366, -0.7769824, -2.742884, 1, 1, 1, 1, 1,
-0.566797, 0.5959578, -0.5486104, 1, 1, 1, 1, 1,
-0.5654055, 0.9287198, 0.6438847, 1, 1, 1, 1, 1,
-0.5613876, 0.5648637, -2.457876, 1, 1, 1, 1, 1,
-0.559093, 0.6711234, -0.4210584, 1, 1, 1, 1, 1,
-0.5520461, 1.244688, -0.3677107, 1, 1, 1, 1, 1,
-0.5519816, 0.1015656, -1.424029, 1, 1, 1, 1, 1,
-0.5483998, 0.01137875, -1.155267, 1, 1, 1, 1, 1,
-0.5469315, -0.2466894, -2.713073, 0, 0, 1, 1, 1,
-0.546193, -1.203991, -3.766435, 1, 0, 0, 1, 1,
-0.544079, 1.110592, -0.9697769, 1, 0, 0, 1, 1,
-0.5412329, -0.8676521, -3.274927, 1, 0, 0, 1, 1,
-0.5388132, -0.17242, -1.389323, 1, 0, 0, 1, 1,
-0.5384355, 0.9163196, -0.2341199, 1, 0, 0, 1, 1,
-0.5381696, -2.426897, -3.869622, 0, 0, 0, 1, 1,
-0.5308942, -4.281803, -3.723101, 0, 0, 0, 1, 1,
-0.5301263, -1.098465, -2.377736, 0, 0, 0, 1, 1,
-0.5233091, 0.2703364, -2.277874, 0, 0, 0, 1, 1,
-0.5209095, 2.131928, 0.143395, 0, 0, 0, 1, 1,
-0.5167823, 0.4234806, -1.014518, 0, 0, 0, 1, 1,
-0.5128332, -0.2952443, -2.625214, 0, 0, 0, 1, 1,
-0.5109583, 0.3358393, -1.106729, 1, 1, 1, 1, 1,
-0.5040384, 0.879574, 0.2789957, 1, 1, 1, 1, 1,
-0.5020958, -1.081273, -2.868238, 1, 1, 1, 1, 1,
-0.4990435, 0.7141827, -0.8313883, 1, 1, 1, 1, 1,
-0.4966153, -0.6184795, -2.476819, 1, 1, 1, 1, 1,
-0.4948873, -1.350507, -2.862066, 1, 1, 1, 1, 1,
-0.4936161, 0.006633182, -2.205667, 1, 1, 1, 1, 1,
-0.4930358, -0.02180029, -2.203668, 1, 1, 1, 1, 1,
-0.4915714, -0.4091457, -3.43434, 1, 1, 1, 1, 1,
-0.4915229, -1.325059, -3.419604, 1, 1, 1, 1, 1,
-0.4872581, 0.1322901, -1.007254, 1, 1, 1, 1, 1,
-0.4851512, -0.166142, -1.710081, 1, 1, 1, 1, 1,
-0.4811736, 0.3204497, -1.655545, 1, 1, 1, 1, 1,
-0.4781391, 0.3766854, -0.7115507, 1, 1, 1, 1, 1,
-0.4749431, -0.529368, -3.075934, 1, 1, 1, 1, 1,
-0.4713549, 0.3046262, -1.734286, 0, 0, 1, 1, 1,
-0.4699769, -3.276329, -3.78047, 1, 0, 0, 1, 1,
-0.46824, 0.971363, -1.303718, 1, 0, 0, 1, 1,
-0.4638474, -0.9067342, -3.059686, 1, 0, 0, 1, 1,
-0.4630331, 0.9144668, -1.31731, 1, 0, 0, 1, 1,
-0.4614537, 0.2552161, -1.943793, 1, 0, 0, 1, 1,
-0.460707, 0.5963119, -2.083365, 0, 0, 0, 1, 1,
-0.4596513, 0.5581338, 0.3361094, 0, 0, 0, 1, 1,
-0.4589744, -0.7407712, -3.610465, 0, 0, 0, 1, 1,
-0.4559297, -1.600908, -2.9011, 0, 0, 0, 1, 1,
-0.4554367, -0.2668576, -2.212676, 0, 0, 0, 1, 1,
-0.4540249, 1.199098, -1.060995, 0, 0, 0, 1, 1,
-0.4508668, -0.1287825, -0.9794248, 0, 0, 0, 1, 1,
-0.4469306, -0.9002951, -2.626067, 1, 1, 1, 1, 1,
-0.4442241, -0.3517441, -2.975497, 1, 1, 1, 1, 1,
-0.4409204, -0.420756, -2.598609, 1, 1, 1, 1, 1,
-0.4394882, 0.4381466, -1.701861, 1, 1, 1, 1, 1,
-0.4391659, 0.2427349, -0.2453319, 1, 1, 1, 1, 1,
-0.438403, 0.4575917, -1.722934, 1, 1, 1, 1, 1,
-0.4332879, -2.178246, -3.771196, 1, 1, 1, 1, 1,
-0.429159, -0.2139287, -0.4657836, 1, 1, 1, 1, 1,
-0.4246542, -0.4669193, -2.418126, 1, 1, 1, 1, 1,
-0.424456, -0.5314555, -3.390687, 1, 1, 1, 1, 1,
-0.4243887, -0.4790607, -1.778111, 1, 1, 1, 1, 1,
-0.423551, -1.546129, -2.7784, 1, 1, 1, 1, 1,
-0.4160971, 0.7947406, -1.571396, 1, 1, 1, 1, 1,
-0.4102294, -0.9409627, -2.447889, 1, 1, 1, 1, 1,
-0.4053442, 0.01180105, -1.909748, 1, 1, 1, 1, 1,
-0.4034206, -0.3075666, -2.339413, 0, 0, 1, 1, 1,
-0.402877, 0.7177258, -1.261714, 1, 0, 0, 1, 1,
-0.4010352, -0.3474808, -1.32032, 1, 0, 0, 1, 1,
-0.3974175, -0.9075488, -1.859542, 1, 0, 0, 1, 1,
-0.3915712, 0.8298656, -2.603181, 1, 0, 0, 1, 1,
-0.3915395, 0.5350216, -0.2578032, 1, 0, 0, 1, 1,
-0.3901149, -0.2826956, -2.050713, 0, 0, 0, 1, 1,
-0.3879685, -0.009288093, -2.180943, 0, 0, 0, 1, 1,
-0.3873535, 0.6473071, 0.003162761, 0, 0, 0, 1, 1,
-0.3845035, 0.8775927, 0.5974519, 0, 0, 0, 1, 1,
-0.3819534, 0.4544324, -1.280571, 0, 0, 0, 1, 1,
-0.379284, -0.5801136, -3.262036, 0, 0, 0, 1, 1,
-0.3791358, 1.159824, 0.7519167, 0, 0, 0, 1, 1,
-0.3749142, 0.8018226, 0.8953618, 1, 1, 1, 1, 1,
-0.3729791, -2.305041, -3.933957, 1, 1, 1, 1, 1,
-0.3706072, -0.2503905, -0.9055099, 1, 1, 1, 1, 1,
-0.3697096, 1.391201, 0.7413751, 1, 1, 1, 1, 1,
-0.3693572, 1.371641, -0.280624, 1, 1, 1, 1, 1,
-0.3689264, 1.993928, -1.871681, 1, 1, 1, 1, 1,
-0.3666963, -0.4909722, -3.103343, 1, 1, 1, 1, 1,
-0.3664017, -0.495965, -0.2562437, 1, 1, 1, 1, 1,
-0.3635669, -1.114681, -1.83918, 1, 1, 1, 1, 1,
-0.3584966, -0.363946, -2.233423, 1, 1, 1, 1, 1,
-0.3541677, 2.2501, -0.06904472, 1, 1, 1, 1, 1,
-0.3514192, -1.253835, -3.456352, 1, 1, 1, 1, 1,
-0.3475268, -0.320667, -2.597853, 1, 1, 1, 1, 1,
-0.3448773, 0.669422, 0.1333598, 1, 1, 1, 1, 1,
-0.341777, -1.070751, -2.785744, 1, 1, 1, 1, 1,
-0.339404, 0.5939735, -1.607722, 0, 0, 1, 1, 1,
-0.3386408, -1.038146, -2.371773, 1, 0, 0, 1, 1,
-0.338063, -0.5348882, -3.454266, 1, 0, 0, 1, 1,
-0.3351569, -0.9355747, -2.222229, 1, 0, 0, 1, 1,
-0.3346975, -1.9692, -2.466334, 1, 0, 0, 1, 1,
-0.3331718, 0.5740193, 0.2701586, 1, 0, 0, 1, 1,
-0.3320765, 0.9361941, -1.298424, 0, 0, 0, 1, 1,
-0.3314943, -0.3881754, -2.280133, 0, 0, 0, 1, 1,
-0.3287756, -0.4099911, -3.975975, 0, 0, 0, 1, 1,
-0.3194589, -1.024264, -3.216017, 0, 0, 0, 1, 1,
-0.3172572, 0.1216846, -1.358059, 0, 0, 0, 1, 1,
-0.3156001, 0.09577082, 1.056622, 0, 0, 0, 1, 1,
-0.3151775, -0.3043545, -1.705256, 0, 0, 0, 1, 1,
-0.3141782, -0.7464576, -1.142512, 1, 1, 1, 1, 1,
-0.3133183, 0.367171, -0.7526777, 1, 1, 1, 1, 1,
-0.3129874, 0.4029008, 0.4375679, 1, 1, 1, 1, 1,
-0.3105463, -1.813295, -3.348466, 1, 1, 1, 1, 1,
-0.309728, 0.253847, -0.09610832, 1, 1, 1, 1, 1,
-0.3080193, -0.9597909, -2.576495, 1, 1, 1, 1, 1,
-0.3038101, -0.5613394, -2.04745, 1, 1, 1, 1, 1,
-0.2923468, -0.6773759, -4.228845, 1, 1, 1, 1, 1,
-0.2918541, 0.209572, -1.157952, 1, 1, 1, 1, 1,
-0.2911405, 0.4336388, -0.8079459, 1, 1, 1, 1, 1,
-0.284188, 1.201224, -1.785626, 1, 1, 1, 1, 1,
-0.2825258, -0.3626393, -0.05072535, 1, 1, 1, 1, 1,
-0.2762292, 1.661701, 1.105224, 1, 1, 1, 1, 1,
-0.275384, 1.40421, 1.031523, 1, 1, 1, 1, 1,
-0.2695582, -0.1035784, -3.572803, 1, 1, 1, 1, 1,
-0.2644022, -1.801832, -4.277603, 0, 0, 1, 1, 1,
-0.2584786, 0.5783775, -1.602452, 1, 0, 0, 1, 1,
-0.2570575, 0.2520198, -1.957165, 1, 0, 0, 1, 1,
-0.2399974, -0.6910019, -2.808761, 1, 0, 0, 1, 1,
-0.2361838, -1.274758, -2.057151, 1, 0, 0, 1, 1,
-0.2344769, -0.03717547, -1.573395, 1, 0, 0, 1, 1,
-0.2328151, -0.2184103, -2.861098, 0, 0, 0, 1, 1,
-0.2308917, -0.7499709, -2.05282, 0, 0, 0, 1, 1,
-0.2296469, 0.723379, -1.208979, 0, 0, 0, 1, 1,
-0.2248933, -0.9805004, -3.153985, 0, 0, 0, 1, 1,
-0.2236145, -1.233014, -2.776506, 0, 0, 0, 1, 1,
-0.2232823, 0.410962, -2.964434, 0, 0, 0, 1, 1,
-0.2204092, -1.100101, -1.979797, 0, 0, 0, 1, 1,
-0.2130333, 0.662762, -0.7086414, 1, 1, 1, 1, 1,
-0.2129025, 0.7076002, 0.04016659, 1, 1, 1, 1, 1,
-0.2091948, 1.114241, -1.407018, 1, 1, 1, 1, 1,
-0.2012549, -0.8398272, -1.095536, 1, 1, 1, 1, 1,
-0.1952743, -0.006456648, -0.5532001, 1, 1, 1, 1, 1,
-0.1914653, -1.052461, -2.924305, 1, 1, 1, 1, 1,
-0.1910291, -0.9840992, -2.171758, 1, 1, 1, 1, 1,
-0.1903532, 0.5118126, -0.1644804, 1, 1, 1, 1, 1,
-0.1897864, -0.9986833, -2.765917, 1, 1, 1, 1, 1,
-0.1882018, 0.1136335, -0.5680742, 1, 1, 1, 1, 1,
-0.1879238, -0.6011835, -2.413007, 1, 1, 1, 1, 1,
-0.1869981, 0.04875138, -1.651222, 1, 1, 1, 1, 1,
-0.1867101, 0.8133122, 1.07486, 1, 1, 1, 1, 1,
-0.1818545, -0.1787773, -2.571428, 1, 1, 1, 1, 1,
-0.1795212, 0.9004266, -1.124932, 1, 1, 1, 1, 1,
-0.1764003, -0.4444152, -4.360114, 0, 0, 1, 1, 1,
-0.1761755, 0.326386, -0.7827095, 1, 0, 0, 1, 1,
-0.1753228, 0.3744484, -0.9744486, 1, 0, 0, 1, 1,
-0.1731835, -0.5410396, -3.119027, 1, 0, 0, 1, 1,
-0.1638198, 1.317281, -0.1321275, 1, 0, 0, 1, 1,
-0.162966, -0.4612058, -3.221954, 1, 0, 0, 1, 1,
-0.1584363, -0.3785428, -1.867922, 0, 0, 0, 1, 1,
-0.1566423, 1.401127, 0.03476036, 0, 0, 0, 1, 1,
-0.1565666, -1.628269, -3.466971, 0, 0, 0, 1, 1,
-0.1532082, -0.74469, -2.149839, 0, 0, 0, 1, 1,
-0.1529904, -1.226666, -3.095281, 0, 0, 0, 1, 1,
-0.150727, 2.463776, -1.763584, 0, 0, 0, 1, 1,
-0.1502735, 1.599384, -1.570469, 0, 0, 0, 1, 1,
-0.1481627, 0.1118133, 1.093852, 1, 1, 1, 1, 1,
-0.145582, 0.4105487, -0.2226799, 1, 1, 1, 1, 1,
-0.1368704, 1.456829, -1.159417, 1, 1, 1, 1, 1,
-0.1299318, 1.658329, 0.6066187, 1, 1, 1, 1, 1,
-0.1273965, 1.254979, 1.015252, 1, 1, 1, 1, 1,
-0.1248993, -0.2924989, -4.500458, 1, 1, 1, 1, 1,
-0.1241509, 3.680009, -1.151651, 1, 1, 1, 1, 1,
-0.1239919, -1.10662, -2.256094, 1, 1, 1, 1, 1,
-0.1193274, -0.1307858, -3.038522, 1, 1, 1, 1, 1,
-0.1154783, -0.1164739, -2.018417, 1, 1, 1, 1, 1,
-0.1146385, -0.4205722, -3.469568, 1, 1, 1, 1, 1,
-0.1069328, -1.093827, -2.617146, 1, 1, 1, 1, 1,
-0.1048867, -0.1321385, -3.377196, 1, 1, 1, 1, 1,
-0.1044652, 0.2072739, -2.081459, 1, 1, 1, 1, 1,
-0.1037369, 0.8966456, -0.08381739, 1, 1, 1, 1, 1,
-0.1024563, -0.6066738, -2.610467, 0, 0, 1, 1, 1,
-0.1013252, 1.527523, -0.9439462, 1, 0, 0, 1, 1,
-0.1007471, -1.350759, -2.513735, 1, 0, 0, 1, 1,
-0.09921081, -0.500716, -2.427847, 1, 0, 0, 1, 1,
-0.09803282, 0.9274344, 0.5173364, 1, 0, 0, 1, 1,
-0.09745325, 1.727818, 0.8599768, 1, 0, 0, 1, 1,
-0.09722076, 0.9189726, -0.9508983, 0, 0, 0, 1, 1,
-0.09590938, -0.1547363, -2.496716, 0, 0, 0, 1, 1,
-0.09051447, -1.84846, -3.764482, 0, 0, 0, 1, 1,
-0.08850247, 2.112925, -0.08605618, 0, 0, 0, 1, 1,
-0.08781775, 0.6006787, -1.257918, 0, 0, 0, 1, 1,
-0.08671302, 0.2084285, 1.220469, 0, 0, 0, 1, 1,
-0.08664109, -1.391752, -3.061291, 0, 0, 0, 1, 1,
-0.08539867, 0.9760863, -1.77176, 1, 1, 1, 1, 1,
-0.08472053, -0.8067557, -3.381016, 1, 1, 1, 1, 1,
-0.08267661, 0.2017882, -0.5346801, 1, 1, 1, 1, 1,
-0.08116014, -0.6720781, -3.662472, 1, 1, 1, 1, 1,
-0.07990699, 0.08236779, 0.9511324, 1, 1, 1, 1, 1,
-0.07914161, 0.5648918, -0.7122119, 1, 1, 1, 1, 1,
-0.0748095, -1.634766, -3.93671, 1, 1, 1, 1, 1,
-0.07203318, -0.1896403, -2.311343, 1, 1, 1, 1, 1,
-0.06652177, 0.3979247, 1.02724, 1, 1, 1, 1, 1,
-0.06130542, 1.686277, -0.998352, 1, 1, 1, 1, 1,
-0.05986481, -0.5750486, -2.80103, 1, 1, 1, 1, 1,
-0.0594289, 0.1230406, 0.9790483, 1, 1, 1, 1, 1,
-0.05758566, 2.271973, 0.02114586, 1, 1, 1, 1, 1,
-0.05515023, 1.479721, -0.008384293, 1, 1, 1, 1, 1,
-0.05147016, 0.222338, -1.14009, 1, 1, 1, 1, 1,
-0.04824663, -1.534976, -2.70204, 0, 0, 1, 1, 1,
-0.04786464, -0.2481961, -3.286191, 1, 0, 0, 1, 1,
-0.0473522, 0.4165625, 1.237341, 1, 0, 0, 1, 1,
-0.04612514, -0.2417398, -3.866076, 1, 0, 0, 1, 1,
-0.04349104, 0.9346225, 0.5871388, 1, 0, 0, 1, 1,
-0.03781344, 0.3910288, 1.301563, 1, 0, 0, 1, 1,
-0.03612104, -0.6080027, -2.849819, 0, 0, 0, 1, 1,
-0.02511643, 1.905611, -0.5073038, 0, 0, 0, 1, 1,
-0.02262731, -0.4700756, -2.927101, 0, 0, 0, 1, 1,
-0.02141754, 0.4172988, -0.6495152, 0, 0, 0, 1, 1,
-0.01841404, -1.155006, -2.646066, 0, 0, 0, 1, 1,
-0.01471206, 0.957555, -1.485611, 0, 0, 0, 1, 1,
-0.01037156, 0.2838783, -1.261069, 0, 0, 0, 1, 1,
-0.009546978, 1.578073, -0.01052171, 1, 1, 1, 1, 1,
-0.009389204, -0.2386163, -1.991539, 1, 1, 1, 1, 1,
-0.008778317, -1.049988, -4.127709, 1, 1, 1, 1, 1,
-0.007949628, 1.121347, -0.9641247, 1, 1, 1, 1, 1,
-0.006547181, 1.198413, -0.48094, 1, 1, 1, 1, 1,
-0.0005988951, -0.3556161, -4.556492, 1, 1, 1, 1, 1,
-0.0003881793, 0.7786806, -0.5981948, 1, 1, 1, 1, 1,
0.00347159, -0.03853297, 2.733134, 1, 1, 1, 1, 1,
0.006181864, 1.931934, -2.121477, 1, 1, 1, 1, 1,
0.009403339, -1.251421, 2.408275, 1, 1, 1, 1, 1,
0.0155924, 0.05528475, -0.5273239, 1, 1, 1, 1, 1,
0.0159541, 1.18987, -1.435212, 1, 1, 1, 1, 1,
0.01783479, 0.0149071, 1.131984, 1, 1, 1, 1, 1,
0.02517701, 1.321838, 1.796331, 1, 1, 1, 1, 1,
0.0259506, 1.579705, 0.4633533, 1, 1, 1, 1, 1,
0.02601826, 0.7700783, 2.130158, 0, 0, 1, 1, 1,
0.03500769, -0.2104481, 2.51324, 1, 0, 0, 1, 1,
0.03545453, -1.221466, 3.383818, 1, 0, 0, 1, 1,
0.03786053, -0.8369854, 3.48897, 1, 0, 0, 1, 1,
0.04151586, 1.36485, -1.573356, 1, 0, 0, 1, 1,
0.04500193, -0.02187934, 1.680451, 1, 0, 0, 1, 1,
0.04789367, 1.233784, -0.5329913, 0, 0, 0, 1, 1,
0.04854105, -0.2409706, 3.880752, 0, 0, 0, 1, 1,
0.05145448, -1.568264, 3.481667, 0, 0, 0, 1, 1,
0.05271658, 0.9638656, 0.9092572, 0, 0, 0, 1, 1,
0.05719641, 1.726369, -0.1695192, 0, 0, 0, 1, 1,
0.05997187, 1.521653, 0.1932575, 0, 0, 0, 1, 1,
0.06707806, -0.03606121, 2.000877, 0, 0, 0, 1, 1,
0.07241204, -0.2916695, 1.970074, 1, 1, 1, 1, 1,
0.07393017, 0.2994645, 0.1057127, 1, 1, 1, 1, 1,
0.0743481, 0.3699892, 1.181527, 1, 1, 1, 1, 1,
0.07538684, -1.207699, 3.417425, 1, 1, 1, 1, 1,
0.07821675, 0.03790753, 1.307952, 1, 1, 1, 1, 1,
0.08902585, -0.1254084, 2.536533, 1, 1, 1, 1, 1,
0.09064762, -1.63408, 5.019585, 1, 1, 1, 1, 1,
0.0935509, 0.3858978, 0.7227541, 1, 1, 1, 1, 1,
0.09584994, 0.972496, -0.3370068, 1, 1, 1, 1, 1,
0.09870797, -0.6216123, 1.533006, 1, 1, 1, 1, 1,
0.1008571, 1.457149, 1.212906, 1, 1, 1, 1, 1,
0.1010345, -0.6337754, 3.133839, 1, 1, 1, 1, 1,
0.1021582, 2.725176, -0.3976591, 1, 1, 1, 1, 1,
0.1043051, -0.04465525, 0.3503179, 1, 1, 1, 1, 1,
0.1048426, -0.2632946, 2.923789, 1, 1, 1, 1, 1,
0.111711, -1.017346, 1.562711, 0, 0, 1, 1, 1,
0.1119373, 0.08618324, 1.36026, 1, 0, 0, 1, 1,
0.1194448, 0.09229058, -0.2563609, 1, 0, 0, 1, 1,
0.1195908, 1.123497, -1.098214, 1, 0, 0, 1, 1,
0.1209564, 0.0996954, 0.3914305, 1, 0, 0, 1, 1,
0.12423, -0.2739477, 3.18715, 1, 0, 0, 1, 1,
0.1262454, 0.04287104, 0.9579965, 0, 0, 0, 1, 1,
0.1297101, 0.00892486, 2.245272, 0, 0, 0, 1, 1,
0.1306883, 0.7742127, 0.7930506, 0, 0, 0, 1, 1,
0.1322131, -1.046186, 4.826286, 0, 0, 0, 1, 1,
0.1384246, -0.3703821, 1.832976, 0, 0, 0, 1, 1,
0.1442925, 1.159967, 0.1650936, 0, 0, 0, 1, 1,
0.1479909, 0.7248417, 1.169671, 0, 0, 0, 1, 1,
0.151591, 0.1869685, 1.591335, 1, 1, 1, 1, 1,
0.1533949, 0.2841185, -2.450434, 1, 1, 1, 1, 1,
0.1557494, -0.6173937, 2.6087, 1, 1, 1, 1, 1,
0.1609116, 2.23019, 1.592828, 1, 1, 1, 1, 1,
0.1631845, -0.127896, 1.082161, 1, 1, 1, 1, 1,
0.1669801, -0.3567774, 2.229244, 1, 1, 1, 1, 1,
0.1690538, 1.244523, 1.388608, 1, 1, 1, 1, 1,
0.1731565, 0.03623233, 1.62878, 1, 1, 1, 1, 1,
0.1732722, -0.06086059, 2.196119, 1, 1, 1, 1, 1,
0.1780858, 0.1555981, 1.326899, 1, 1, 1, 1, 1,
0.1798654, 1.2223, 0.3530269, 1, 1, 1, 1, 1,
0.1854847, -1.529518, 0.379272, 1, 1, 1, 1, 1,
0.1869913, -0.02122277, 2.113261, 1, 1, 1, 1, 1,
0.1873501, 0.4228517, -0.519982, 1, 1, 1, 1, 1,
0.1901392, 1.1625, 0.1201828, 1, 1, 1, 1, 1,
0.1941503, 1.225646, 1.432276, 0, 0, 1, 1, 1,
0.1953187, -0.6149327, 3.679255, 1, 0, 0, 1, 1,
0.2011705, 1.794158, 1.425273, 1, 0, 0, 1, 1,
0.2027147, 0.2647476, -0.8095202, 1, 0, 0, 1, 1,
0.2035037, 0.07303819, 1.231945, 1, 0, 0, 1, 1,
0.2036039, 0.06310116, 1.445115, 1, 0, 0, 1, 1,
0.2062064, 0.3258323, 1.62131, 0, 0, 0, 1, 1,
0.2065752, 0.643257, -1.073206, 0, 0, 0, 1, 1,
0.2094488, 0.4672868, -0.1234348, 0, 0, 0, 1, 1,
0.2108797, -0.3984867, 2.02645, 0, 0, 0, 1, 1,
0.2122416, -0.8453135, 3.95843, 0, 0, 0, 1, 1,
0.2155283, -0.01016801, 1.993434, 0, 0, 0, 1, 1,
0.2163561, -0.5587636, 1.678859, 0, 0, 0, 1, 1,
0.2272687, -0.5091438, 2.139493, 1, 1, 1, 1, 1,
0.229185, -1.157241, 2.548852, 1, 1, 1, 1, 1,
0.2388007, -0.8790344, 1.649612, 1, 1, 1, 1, 1,
0.2432247, -0.3723261, 2.097764, 1, 1, 1, 1, 1,
0.2459397, 0.01157334, 2.648504, 1, 1, 1, 1, 1,
0.257677, 1.607353, 0.4258369, 1, 1, 1, 1, 1,
0.2591679, 1.002861, -0.1612452, 1, 1, 1, 1, 1,
0.2598189, 0.850615, 1.82648, 1, 1, 1, 1, 1,
0.2628326, 1.290389, 2.210397, 1, 1, 1, 1, 1,
0.2635108, -0.8079292, 1.34298, 1, 1, 1, 1, 1,
0.2639717, 0.5927119, 0.5674487, 1, 1, 1, 1, 1,
0.265687, -0.008281733, 2.8599, 1, 1, 1, 1, 1,
0.2678346, -1.208073, 3.366276, 1, 1, 1, 1, 1,
0.2726133, -0.9623418, 0.7361502, 1, 1, 1, 1, 1,
0.2728063, 0.6157386, 0.2226796, 1, 1, 1, 1, 1,
0.2743099, 1.721975, 0.01165515, 0, 0, 1, 1, 1,
0.2755443, -0.7448594, 3.96151, 1, 0, 0, 1, 1,
0.2773531, 0.5147005, 0.2730463, 1, 0, 0, 1, 1,
0.2857015, 1.773552, -0.7393923, 1, 0, 0, 1, 1,
0.2859845, -0.6771159, 3.957898, 1, 0, 0, 1, 1,
0.2881384, -1.122641, 2.688565, 1, 0, 0, 1, 1,
0.289946, 0.9804515, 1.440806, 0, 0, 0, 1, 1,
0.2901004, -0.2457182, 1.302407, 0, 0, 0, 1, 1,
0.2906777, -0.5879012, 3.60698, 0, 0, 0, 1, 1,
0.2916312, -1.068836, 1.892944, 0, 0, 0, 1, 1,
0.2930672, 1.536534, -0.2777022, 0, 0, 0, 1, 1,
0.2957633, 1.396962, -2.351969, 0, 0, 0, 1, 1,
0.2982025, -0.04231637, 1.993381, 0, 0, 0, 1, 1,
0.3167382, 0.08024316, 2.543836, 1, 1, 1, 1, 1,
0.3206988, 0.1804251, 1.342866, 1, 1, 1, 1, 1,
0.3223855, 0.9176133, -0.2944161, 1, 1, 1, 1, 1,
0.324316, 1.590964, 1.88021, 1, 1, 1, 1, 1,
0.3262967, 0.9855519, 1.897104, 1, 1, 1, 1, 1,
0.3283882, 1.467797, -0.503239, 1, 1, 1, 1, 1,
0.3296853, -2.34756, 3.369414, 1, 1, 1, 1, 1,
0.3303318, 0.02189201, 1.707325, 1, 1, 1, 1, 1,
0.3303837, 0.08024123, 2.252216, 1, 1, 1, 1, 1,
0.3358134, 1.860552, 1.12272, 1, 1, 1, 1, 1,
0.3378364, 1.915584, -0.770602, 1, 1, 1, 1, 1,
0.3537067, 1.45248, 0.1248844, 1, 1, 1, 1, 1,
0.3574258, -0.5203962, 3.628736, 1, 1, 1, 1, 1,
0.3595767, -0.05648264, 2.737522, 1, 1, 1, 1, 1,
0.3629354, -1.207369, 1.774503, 1, 1, 1, 1, 1,
0.3710812, 2.173979, 0.08451946, 0, 0, 1, 1, 1,
0.3742828, -0.3469858, 1.207403, 1, 0, 0, 1, 1,
0.3792612, 0.2599462, 2.20951, 1, 0, 0, 1, 1,
0.3818789, 1.021884, 1.06934, 1, 0, 0, 1, 1,
0.3843027, 0.1722439, 1.573362, 1, 0, 0, 1, 1,
0.3951318, -1.079886, 3.570646, 1, 0, 0, 1, 1,
0.3956265, 0.2629569, -1.169037, 0, 0, 0, 1, 1,
0.3982117, -0.7032787, 3.889632, 0, 0, 0, 1, 1,
0.3993622, 0.5944491, 0.6409166, 0, 0, 0, 1, 1,
0.4021779, -0.8297846, 2.366618, 0, 0, 0, 1, 1,
0.407513, 1.178459, 1.461014, 0, 0, 0, 1, 1,
0.4117716, 1.32907, 0.3578417, 0, 0, 0, 1, 1,
0.4119413, -0.6935465, 2.833651, 0, 0, 0, 1, 1,
0.4126307, -1.389759, 3.38063, 1, 1, 1, 1, 1,
0.4155557, -0.226604, 2.366103, 1, 1, 1, 1, 1,
0.4168559, 0.8645085, -0.8903662, 1, 1, 1, 1, 1,
0.4224456, -0.9866589, 3.698452, 1, 1, 1, 1, 1,
0.423082, -1.475496, 1.155091, 1, 1, 1, 1, 1,
0.4278537, 1.069254, -0.4005292, 1, 1, 1, 1, 1,
0.4321766, -2.461742, 3.342221, 1, 1, 1, 1, 1,
0.4326605, -1.322733, 2.066833, 1, 1, 1, 1, 1,
0.4353119, 1.163773, -0.4294326, 1, 1, 1, 1, 1,
0.440699, 0.5810351, 1.616274, 1, 1, 1, 1, 1,
0.441154, -0.2261462, 1.477937, 1, 1, 1, 1, 1,
0.4426033, 0.07891823, 1.748445, 1, 1, 1, 1, 1,
0.4426562, -1.397982, 2.518156, 1, 1, 1, 1, 1,
0.4474944, 0.7690398, 0.5708258, 1, 1, 1, 1, 1,
0.4494337, 0.6652672, 0.239613, 1, 1, 1, 1, 1,
0.4511503, -1.584117, 2.613071, 0, 0, 1, 1, 1,
0.4516473, -0.3046609, 2.031696, 1, 0, 0, 1, 1,
0.4516741, 1.009221, 1.28985, 1, 0, 0, 1, 1,
0.4576842, 0.4077392, -0.8553447, 1, 0, 0, 1, 1,
0.4592457, 0.4888046, 1.274789, 1, 0, 0, 1, 1,
0.4598229, 0.7465255, 1.03865, 1, 0, 0, 1, 1,
0.4620701, 0.8644902, -1.283262, 0, 0, 0, 1, 1,
0.4681532, 1.792518, 0.1536347, 0, 0, 0, 1, 1,
0.4725273, 0.008951696, 2.94912, 0, 0, 0, 1, 1,
0.4730355, -0.216124, 1.505309, 0, 0, 0, 1, 1,
0.4733913, 0.5133657, -1.2781, 0, 0, 0, 1, 1,
0.4736889, -1.12237, 2.754284, 0, 0, 0, 1, 1,
0.4793722, -3.053403, 3.35722, 0, 0, 0, 1, 1,
0.4796121, 0.01075231, 3.783377, 1, 1, 1, 1, 1,
0.486332, -0.7953286, 4.487381, 1, 1, 1, 1, 1,
0.4928471, 2.002943, -0.6650052, 1, 1, 1, 1, 1,
0.4940086, 0.2198831, -0.0002378136, 1, 1, 1, 1, 1,
0.4952787, -0.7108959, 2.661989, 1, 1, 1, 1, 1,
0.4973497, -0.6620479, 2.812734, 1, 1, 1, 1, 1,
0.5027764, 0.3088046, 0.8498608, 1, 1, 1, 1, 1,
0.5043709, 0.7295306, 1.025962, 1, 1, 1, 1, 1,
0.5117709, 0.7078736, -0.2749823, 1, 1, 1, 1, 1,
0.5159866, -0.8627569, 3.503419, 1, 1, 1, 1, 1,
0.5166068, 0.7963512, 0.7625827, 1, 1, 1, 1, 1,
0.5204369, -0.662994, 2.993756, 1, 1, 1, 1, 1,
0.521269, -0.5389312, 4.382842, 1, 1, 1, 1, 1,
0.5263738, -2.168879, 2.523882, 1, 1, 1, 1, 1,
0.5267227, 0.808972, -1.34931, 1, 1, 1, 1, 1,
0.535146, 0.4629566, 0.2978574, 0, 0, 1, 1, 1,
0.5358313, -2.919123, 1.979224, 1, 0, 0, 1, 1,
0.5358833, 0.1336827, 1.327489, 1, 0, 0, 1, 1,
0.5495799, 0.9503385, -1.056531, 1, 0, 0, 1, 1,
0.5512655, 0.2372973, 1.998034, 1, 0, 0, 1, 1,
0.5539832, 1.524438, 0.1137488, 1, 0, 0, 1, 1,
0.5669037, 2.909968, 1.089843, 0, 0, 0, 1, 1,
0.5675741, 0.9004862, 1.581493, 0, 0, 0, 1, 1,
0.5684201, -0.1906937, 2.618921, 0, 0, 0, 1, 1,
0.5688753, -0.7099662, 1.72471, 0, 0, 0, 1, 1,
0.574423, 1.699549, 1.288116, 0, 0, 0, 1, 1,
0.5825525, 0.07157218, 1.589052, 0, 0, 0, 1, 1,
0.5825553, 0.07817101, 0.426845, 0, 0, 0, 1, 1,
0.5825692, -0.6400833, 2.955849, 1, 1, 1, 1, 1,
0.5836616, 0.3575946, 0.9949098, 1, 1, 1, 1, 1,
0.5851572, -0.7790393, 3.492775, 1, 1, 1, 1, 1,
0.586175, 0.7212852, -1.309854, 1, 1, 1, 1, 1,
0.5942001, -0.6466016, 1.942231, 1, 1, 1, 1, 1,
0.5966021, 1.24425, 2.328626, 1, 1, 1, 1, 1,
0.5996087, 0.6121458, -1.147704, 1, 1, 1, 1, 1,
0.6008471, 0.8532419, -0.6825348, 1, 1, 1, 1, 1,
0.6034586, 0.7352578, 1.741894, 1, 1, 1, 1, 1,
0.6133353, -0.5254585, 2.569443, 1, 1, 1, 1, 1,
0.6157402, 1.049664, -0.05589548, 1, 1, 1, 1, 1,
0.620077, 0.1226367, 0.3908463, 1, 1, 1, 1, 1,
0.6213135, 2.885594, 0.8118634, 1, 1, 1, 1, 1,
0.6238461, 0.1796934, 1.340309, 1, 1, 1, 1, 1,
0.6242167, 0.1194479, 0.3077146, 1, 1, 1, 1, 1,
0.6355292, 0.4366032, 2.624002, 0, 0, 1, 1, 1,
0.6359746, -0.008041233, -0.2170276, 1, 0, 0, 1, 1,
0.6382567, -0.7637071, 1.880709, 1, 0, 0, 1, 1,
0.6388221, -0.3218102, 0.8244628, 1, 0, 0, 1, 1,
0.642741, 0.7146754, -2.008856, 1, 0, 0, 1, 1,
0.6474594, 0.170377, 2.622753, 1, 0, 0, 1, 1,
0.6496808, -0.3720907, 1.531694, 0, 0, 0, 1, 1,
0.6529948, 0.1936484, 1.93406, 0, 0, 0, 1, 1,
0.6552612, 1.731111, -0.1429097, 0, 0, 0, 1, 1,
0.6572548, 1.129472, 1.807347, 0, 0, 0, 1, 1,
0.6663634, 1.203607, -1.18563, 0, 0, 0, 1, 1,
0.672192, -0.7158841, 1.00438, 0, 0, 0, 1, 1,
0.6760567, -2.138943, 2.343881, 0, 0, 0, 1, 1,
0.6761367, 0.6869724, 1.032277, 1, 1, 1, 1, 1,
0.6792144, 2.022672, -0.05339287, 1, 1, 1, 1, 1,
0.6793309, -0.8532296, 2.528895, 1, 1, 1, 1, 1,
0.6853323, -0.591743, 1.869526, 1, 1, 1, 1, 1,
0.6883739, -0.4215559, 3.238342, 1, 1, 1, 1, 1,
0.6893292, -0.6990371, 2.078047, 1, 1, 1, 1, 1,
0.690139, -0.7317483, 1.996585, 1, 1, 1, 1, 1,
0.6952266, 0.6392232, 2.02218, 1, 1, 1, 1, 1,
0.6955962, -1.033091, 2.692012, 1, 1, 1, 1, 1,
0.6980874, -0.7211359, 3.380163, 1, 1, 1, 1, 1,
0.7006884, -0.09585331, 2.199021, 1, 1, 1, 1, 1,
0.702253, -1.586204, 1.555318, 1, 1, 1, 1, 1,
0.702301, -2.050058, 3.969807, 1, 1, 1, 1, 1,
0.7026957, -0.4148253, 2.483778, 1, 1, 1, 1, 1,
0.7077291, -0.246497, 1.905003, 1, 1, 1, 1, 1,
0.7126135, 0.3592006, 2.465786, 0, 0, 1, 1, 1,
0.7126279, -2.591811, 2.324941, 1, 0, 0, 1, 1,
0.7162527, -0.9899088, 2.358715, 1, 0, 0, 1, 1,
0.7186781, -0.2706877, 1.750352, 1, 0, 0, 1, 1,
0.7198628, -0.2160814, 0.7031579, 1, 0, 0, 1, 1,
0.7266499, -0.7636483, 2.758818, 1, 0, 0, 1, 1,
0.7278765, 0.09119964, 1.351601, 0, 0, 0, 1, 1,
0.7288409, 0.1402905, 1.398703, 0, 0, 0, 1, 1,
0.7305185, -0.03899848, 1.260213, 0, 0, 0, 1, 1,
0.736932, -0.1957174, 2.03232, 0, 0, 0, 1, 1,
0.7382228, -0.3588116, 0.9322058, 0, 0, 0, 1, 1,
0.740121, -0.127255, 2.085183, 0, 0, 0, 1, 1,
0.740717, 1.17658, 1.601385, 0, 0, 0, 1, 1,
0.7468671, -0.5735738, 3.543505, 1, 1, 1, 1, 1,
0.7528686, -0.1947607, 0.3656408, 1, 1, 1, 1, 1,
0.755554, 0.1187283, 1.383846, 1, 1, 1, 1, 1,
0.7612454, -0.419859, 2.287222, 1, 1, 1, 1, 1,
0.7644195, 0.4294001, -1.113763, 1, 1, 1, 1, 1,
0.7644355, -0.677692, 2.484477, 1, 1, 1, 1, 1,
0.7644848, 0.007221899, 1.772266, 1, 1, 1, 1, 1,
0.7683986, -2.053215, 2.563278, 1, 1, 1, 1, 1,
0.7706144, 0.9490447, 2.303672, 1, 1, 1, 1, 1,
0.7712722, -1.797203, 2.63492, 1, 1, 1, 1, 1,
0.7719641, -0.4501885, 2.344066, 1, 1, 1, 1, 1,
0.7770109, -0.3274141, 3.035515, 1, 1, 1, 1, 1,
0.7770628, -1.016377, 1.477471, 1, 1, 1, 1, 1,
0.7784634, 0.3356543, 1.628792, 1, 1, 1, 1, 1,
0.78366, 0.36088, 2.057856, 1, 1, 1, 1, 1,
0.7837664, -2.415098, 3.936271, 0, 0, 1, 1, 1,
0.7908086, -1.551355, 1.343397, 1, 0, 0, 1, 1,
0.793187, -0.8763908, 3.74767, 1, 0, 0, 1, 1,
0.7953546, 1.164429, 1.366213, 1, 0, 0, 1, 1,
0.7954451, -1.327381, 3.310838, 1, 0, 0, 1, 1,
0.8012449, 0.7651863, 0.5849531, 1, 0, 0, 1, 1,
0.8047958, -0.2858016, 1.351481, 0, 0, 0, 1, 1,
0.8107391, 0.1141195, 0.7714428, 0, 0, 0, 1, 1,
0.8114682, -1.43751, 3.204089, 0, 0, 0, 1, 1,
0.8228254, 0.05869094, -0.09397738, 0, 0, 0, 1, 1,
0.8230662, 1.093135, 0.02548541, 0, 0, 0, 1, 1,
0.8303434, 0.3304357, 1.308156, 0, 0, 0, 1, 1,
0.8328605, -0.4710706, 1.983569, 0, 0, 0, 1, 1,
0.834808, 0.954451, -0.02065163, 1, 1, 1, 1, 1,
0.8357433, -0.6278447, 1.049746, 1, 1, 1, 1, 1,
0.8375881, 0.5812571, 0.8349112, 1, 1, 1, 1, 1,
0.8384277, 0.3439927, 2.358428, 1, 1, 1, 1, 1,
0.8473837, 0.6154972, 0.7559276, 1, 1, 1, 1, 1,
0.8486258, 0.412717, 0.2638927, 1, 1, 1, 1, 1,
0.8564358, -0.7715721, 2.030656, 1, 1, 1, 1, 1,
0.8566985, -1.138793, 2.128673, 1, 1, 1, 1, 1,
0.8656705, 0.08178893, 0.6991851, 1, 1, 1, 1, 1,
0.8688968, 0.1046227, 2.289306, 1, 1, 1, 1, 1,
0.8719078, 0.7206215, 3.301406, 1, 1, 1, 1, 1,
0.8796544, 0.8890069, -0.04695219, 1, 1, 1, 1, 1,
0.8838065, 0.001336463, 0.1522358, 1, 1, 1, 1, 1,
0.8852388, -0.3375675, 2.838573, 1, 1, 1, 1, 1,
0.8875679, 0.503406, 0.8610359, 1, 1, 1, 1, 1,
0.8890127, -0.7524583, 3.272855, 0, 0, 1, 1, 1,
0.8908613, 0.1082489, 2.667343, 1, 0, 0, 1, 1,
0.8956003, 1.313914, 0.5922549, 1, 0, 0, 1, 1,
0.8956575, 0.2930437, 1.302588, 1, 0, 0, 1, 1,
0.9023297, 0.07241941, 2.308592, 1, 0, 0, 1, 1,
0.9083101, 1.718349, 1.287835, 1, 0, 0, 1, 1,
0.9119258, 1.046755, 1.524697, 0, 0, 0, 1, 1,
0.914089, -1.179055, 2.537734, 0, 0, 0, 1, 1,
0.9300264, 1.275295, -1.986573, 0, 0, 0, 1, 1,
0.9338487, 0.4564358, 1.012094, 0, 0, 0, 1, 1,
0.9354346, -0.9831521, 1.926512, 0, 0, 0, 1, 1,
0.9369742, -0.1379112, 0.7865922, 0, 0, 0, 1, 1,
0.9489766, 0.07137688, 1.366265, 0, 0, 0, 1, 1,
0.9609939, 0.4957861, 2.244328, 1, 1, 1, 1, 1,
0.9633958, 1.227536, 1.561459, 1, 1, 1, 1, 1,
0.9682252, 0.8332744, 0.1083971, 1, 1, 1, 1, 1,
0.9714472, -0.4152374, 1.692104, 1, 1, 1, 1, 1,
0.9729804, -0.2881811, 2.399887, 1, 1, 1, 1, 1,
0.9738591, -0.4950474, 2.364344, 1, 1, 1, 1, 1,
0.9745063, -0.7676986, 1.27258, 1, 1, 1, 1, 1,
0.9746187, 0.07610961, 3.683117, 1, 1, 1, 1, 1,
0.9758916, -1.222418, 1.61447, 1, 1, 1, 1, 1,
0.9801826, -1.648845, 0.913214, 1, 1, 1, 1, 1,
0.9868424, -0.1027203, 2.637589, 1, 1, 1, 1, 1,
0.9880117, -0.6807614, 2.95269, 1, 1, 1, 1, 1,
0.9923238, -0.2673274, 1.772921, 1, 1, 1, 1, 1,
0.9950666, -0.01860928, 0.8985231, 1, 1, 1, 1, 1,
1.002212, -2.371987, 3.226761, 1, 1, 1, 1, 1,
1.002649, -0.3504556, 2.901542, 0, 0, 1, 1, 1,
1.005951, 0.2653238, 0.6979203, 1, 0, 0, 1, 1,
1.008065, 0.7464458, -0.6176507, 1, 0, 0, 1, 1,
1.008563, 1.952303, -0.631366, 1, 0, 0, 1, 1,
1.014942, 1.13137, 1.356449, 1, 0, 0, 1, 1,
1.021119, 0.6177092, 1.313443, 1, 0, 0, 1, 1,
1.029785, -0.2050465, 2.681785, 0, 0, 0, 1, 1,
1.032781, -0.6130379, 1.266059, 0, 0, 0, 1, 1,
1.033126, 1.518829, 0.1342233, 0, 0, 0, 1, 1,
1.034884, -1.481184, 3.044628, 0, 0, 0, 1, 1,
1.037171, -1.814233, 1.691811, 0, 0, 0, 1, 1,
1.04507, 0.1060511, 2.246172, 0, 0, 0, 1, 1,
1.055494, -0.9417466, 3.593093, 0, 0, 0, 1, 1,
1.05814, -0.5582885, 4.2521, 1, 1, 1, 1, 1,
1.060681, -0.5186256, 2.068522, 1, 1, 1, 1, 1,
1.061895, 0.6083059, 0.5196467, 1, 1, 1, 1, 1,
1.064355, -1.074396, 2.781165, 1, 1, 1, 1, 1,
1.069234, 1.35734, 0.3594346, 1, 1, 1, 1, 1,
1.069386, -0.763101, 2.676658, 1, 1, 1, 1, 1,
1.071656, -2.072895, 3.642165, 1, 1, 1, 1, 1,
1.076478, -1.619042, 2.357562, 1, 1, 1, 1, 1,
1.077778, 1.332472, 0.6120518, 1, 1, 1, 1, 1,
1.081698, -0.1952281, 1.159834, 1, 1, 1, 1, 1,
1.091005, 0.8856384, 3.539474, 1, 1, 1, 1, 1,
1.091565, -0.3886051, 3.126107, 1, 1, 1, 1, 1,
1.092826, -0.115945, 2.316413, 1, 1, 1, 1, 1,
1.09712, 0.6721657, 0.4443564, 1, 1, 1, 1, 1,
1.098493, -1.202022, 0.07833229, 1, 1, 1, 1, 1,
1.102081, -2.769033, 2.469483, 0, 0, 1, 1, 1,
1.105189, -0.01365425, 2.754347, 1, 0, 0, 1, 1,
1.112978, 0.3473987, 0.6762546, 1, 0, 0, 1, 1,
1.113223, -1.744116, 4.336423, 1, 0, 0, 1, 1,
1.121767, -0.3275883, 1.188165, 1, 0, 0, 1, 1,
1.12743, -0.7485586, 1.848754, 1, 0, 0, 1, 1,
1.129547, -0.4606648, 1.029631, 0, 0, 0, 1, 1,
1.130483, -0.4570555, 1.775622, 0, 0, 0, 1, 1,
1.130666, -0.3816355, 0.8807684, 0, 0, 0, 1, 1,
1.134592, 0.43577, 1.312874, 0, 0, 0, 1, 1,
1.149242, 1.491028, -0.9916255, 0, 0, 0, 1, 1,
1.151651, 1.035917, 0.7110324, 0, 0, 0, 1, 1,
1.153418, 0.8639132, -0.5160971, 0, 0, 0, 1, 1,
1.153817, -1.824351, 2.950609, 1, 1, 1, 1, 1,
1.153852, 0.2075484, 0.3759049, 1, 1, 1, 1, 1,
1.15478, 1.037794, 0.8978047, 1, 1, 1, 1, 1,
1.161792, 0.2044567, 1.706162, 1, 1, 1, 1, 1,
1.175732, 1.567966, 2.011056, 1, 1, 1, 1, 1,
1.176641, 0.5989445, 0.2028845, 1, 1, 1, 1, 1,
1.188372, 1.29537, 0.1017808, 1, 1, 1, 1, 1,
1.18922, 0.8281406, 2.409289, 1, 1, 1, 1, 1,
1.189276, -1.129943, 3.718023, 1, 1, 1, 1, 1,
1.198055, -1.272222, 3.003276, 1, 1, 1, 1, 1,
1.201475, -0.4679765, 1.604364, 1, 1, 1, 1, 1,
1.208567, -0.1610899, 1.07278, 1, 1, 1, 1, 1,
1.219048, 2.350565, 1.158773, 1, 1, 1, 1, 1,
1.219186, -0.7276552, 3.618905, 1, 1, 1, 1, 1,
1.22233, -0.09962158, 3.412216, 1, 1, 1, 1, 1,
1.224136, -0.6012749, -0.04358345, 0, 0, 1, 1, 1,
1.226331, 0.6916493, -0.6004106, 1, 0, 0, 1, 1,
1.228729, 0.65734, 2.270006, 1, 0, 0, 1, 1,
1.230157, -0.002865832, -0.01002423, 1, 0, 0, 1, 1,
1.231081, 1.739383, 0.7644781, 1, 0, 0, 1, 1,
1.240861, -1.34638, 3.363088, 1, 0, 0, 1, 1,
1.241017, 0.4496852, 1.458402, 0, 0, 0, 1, 1,
1.241401, -0.6478575, 0.3567594, 0, 0, 0, 1, 1,
1.253816, -0.6199818, 2.26365, 0, 0, 0, 1, 1,
1.260219, -1.973854, 2.36659, 0, 0, 0, 1, 1,
1.264663, 0.7988978, 0.3522015, 0, 0, 0, 1, 1,
1.271243, -0.4322087, -0.1157585, 0, 0, 0, 1, 1,
1.274817, -0.2358292, 0.399814, 0, 0, 0, 1, 1,
1.278445, -1.206012, 0.8552343, 1, 1, 1, 1, 1,
1.278595, 1.951856, 0.9555625, 1, 1, 1, 1, 1,
1.278818, 0.21524, 2.548723, 1, 1, 1, 1, 1,
1.284035, -0.1630728, 3.548098, 1, 1, 1, 1, 1,
1.289251, 1.494287, -1.048718, 1, 1, 1, 1, 1,
1.319079, 0.6385811, -0.6836979, 1, 1, 1, 1, 1,
1.337641, 0.7352968, 1.104337, 1, 1, 1, 1, 1,
1.338019, 1.349197, 2.334627, 1, 1, 1, 1, 1,
1.345075, -0.4935112, 1.421307, 1, 1, 1, 1, 1,
1.346817, -0.2179054, 3.131443, 1, 1, 1, 1, 1,
1.362303, -1.083424, 1.139662, 1, 1, 1, 1, 1,
1.369527, -0.8506384, 0.9993985, 1, 1, 1, 1, 1,
1.377625, -0.5131298, 0.6316876, 1, 1, 1, 1, 1,
1.387304, 0.05399896, 2.377395, 1, 1, 1, 1, 1,
1.392442, 0.2901805, 0.4984924, 1, 1, 1, 1, 1,
1.404655, 2.386289, -0.06307533, 0, 0, 1, 1, 1,
1.406739, 1.102865, 1.874745, 1, 0, 0, 1, 1,
1.413392, -1.155619, 2.831532, 1, 0, 0, 1, 1,
1.417869, -0.3486057, 0.7317477, 1, 0, 0, 1, 1,
1.419839, -0.6200958, 2.593365, 1, 0, 0, 1, 1,
1.439597, -1.168298, 3.126776, 1, 0, 0, 1, 1,
1.444786, -0.9871848, 1.474281, 0, 0, 0, 1, 1,
1.448829, 0.04081955, 1.709459, 0, 0, 0, 1, 1,
1.459215, 0.512856, 2.132737, 0, 0, 0, 1, 1,
1.461338, 0.06596008, 2.383172, 0, 0, 0, 1, 1,
1.46419, -0.3627329, 1.90403, 0, 0, 0, 1, 1,
1.467518, 0.5382985, 0.736305, 0, 0, 0, 1, 1,
1.479426, 1.999568, 1.689234, 0, 0, 0, 1, 1,
1.483488, -1.749187, 5.125451, 1, 1, 1, 1, 1,
1.488108, -1.532306, 3.255482, 1, 1, 1, 1, 1,
1.499744, 0.9603783, 0.5111489, 1, 1, 1, 1, 1,
1.501907, 0.4118601, 2.070848, 1, 1, 1, 1, 1,
1.511207, -0.745111, 1.956748, 1, 1, 1, 1, 1,
1.553535, 0.4441645, 1.26865, 1, 1, 1, 1, 1,
1.56537, -0.9203351, 3.395548, 1, 1, 1, 1, 1,
1.568745, 0.9423056, 0.5866197, 1, 1, 1, 1, 1,
1.569391, -0.2246896, 1.842691, 1, 1, 1, 1, 1,
1.580405, -0.03134023, 1.789031, 1, 1, 1, 1, 1,
1.59045, -1.106605, 2.832115, 1, 1, 1, 1, 1,
1.590885, -0.276993, 1.502318, 1, 1, 1, 1, 1,
1.603094, 0.9148907, 2.321862, 1, 1, 1, 1, 1,
1.604771, -0.8169863, 2.60026, 1, 1, 1, 1, 1,
1.613968, 0.4895871, 2.697092, 1, 1, 1, 1, 1,
1.635512, 0.258346, 2.262686, 0, 0, 1, 1, 1,
1.636196, -0.8473933, 2.122138, 1, 0, 0, 1, 1,
1.637876, 2.131554, 2.009497, 1, 0, 0, 1, 1,
1.654208, 0.07584459, 2.07773, 1, 0, 0, 1, 1,
1.657841, 1.434614, 2.610306, 1, 0, 0, 1, 1,
1.660794, -0.5880005, 2.540056, 1, 0, 0, 1, 1,
1.663713, -0.3655703, 2.393826, 0, 0, 0, 1, 1,
1.672257, -0.6400062, 2.262146, 0, 0, 0, 1, 1,
1.686297, 1.419035, 1.531962, 0, 0, 0, 1, 1,
1.69041, 1.18462, 1.550408, 0, 0, 0, 1, 1,
1.694328, 2.197026, 1.200512, 0, 0, 0, 1, 1,
1.708104, 0.9292347, 1.808977, 0, 0, 0, 1, 1,
1.711119, 2.240695, -1.680675, 0, 0, 0, 1, 1,
1.731294, 0.7475937, 1.088388, 1, 1, 1, 1, 1,
1.749034, -0.9587865, 1.343022, 1, 1, 1, 1, 1,
1.754646, -0.3613401, 3.159328, 1, 1, 1, 1, 1,
1.766674, -0.848816, 1.438028, 1, 1, 1, 1, 1,
1.772708, 0.4549387, 1.414503, 1, 1, 1, 1, 1,
1.799617, -0.479991, 0.4627787, 1, 1, 1, 1, 1,
1.811967, -0.009257697, 0.5923895, 1, 1, 1, 1, 1,
1.831328, -1.804589, 3.016339, 1, 1, 1, 1, 1,
1.84697, 0.5598366, 1.099328, 1, 1, 1, 1, 1,
1.917398, 0.2831325, 1.954803, 1, 1, 1, 1, 1,
1.924535, 2.14701, 1.146787, 1, 1, 1, 1, 1,
1.927666, -0.1315894, 2.00655, 1, 1, 1, 1, 1,
1.938858, -1.209417, 2.256828, 1, 1, 1, 1, 1,
1.941563, 1.415804, -1.073077, 1, 1, 1, 1, 1,
1.994061, -1.61471, 1.34734, 1, 1, 1, 1, 1,
1.994265, -0.08895525, 1.661296, 0, 0, 1, 1, 1,
2.007849, 0.04622822, 2.398946, 1, 0, 0, 1, 1,
2.011421, -0.1437886, 1.46482, 1, 0, 0, 1, 1,
2.012385, -0.7073724, -0.08378372, 1, 0, 0, 1, 1,
2.013402, 1.637195, -0.4105545, 1, 0, 0, 1, 1,
2.075167, 0.1754631, 2.117761, 1, 0, 0, 1, 1,
2.078128, -1.784854, 2.406951, 0, 0, 0, 1, 1,
2.142292, -2.055279, 2.698646, 0, 0, 0, 1, 1,
2.177931, 1.002637, 1.836963, 0, 0, 0, 1, 1,
2.228548, -0.5216287, 0.7401136, 0, 0, 0, 1, 1,
2.232481, 0.9860218, 2.230452, 0, 0, 0, 1, 1,
2.271048, -0.7560867, 2.379667, 0, 0, 0, 1, 1,
2.311852, 0.2443471, 1.042169, 0, 0, 0, 1, 1,
2.331696, -1.857648, 3.225242, 1, 1, 1, 1, 1,
2.400006, -0.2030656, 1.421827, 1, 1, 1, 1, 1,
2.458466, -0.541137, 0.6608623, 1, 1, 1, 1, 1,
2.497156, 0.2012255, 1.741649, 1, 1, 1, 1, 1,
2.577411, -0.8380643, 3.515381, 1, 1, 1, 1, 1,
3.163967, 1.717925, 2.045264, 1, 1, 1, 1, 1,
3.221123, -1.34413, 4.154523, 1, 1, 1, 1, 1
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
var radius = 10.07416;
var distance = 35.38506;
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
mvMatrix.translate( 0.5476403, 0.3008969, -0.09847808 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.38506);
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
