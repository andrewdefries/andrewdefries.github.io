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
-3.233158, -0.5166938, -2.227277, 1, 0, 0, 1,
-3.117482, 0.1868113, -2.209587, 1, 0.007843138, 0, 1,
-3.036371, -0.5040531, -0.7947221, 1, 0.01176471, 0, 1,
-3.019222, -0.7894135, -0.4655836, 1, 0.01960784, 0, 1,
-2.978379, -0.7034289, -2.72562, 1, 0.02352941, 0, 1,
-2.72853, -0.2699095, -1.028778, 1, 0.03137255, 0, 1,
-2.688533, -1.235129, -0.7657223, 1, 0.03529412, 0, 1,
-2.640133, -0.3953722, -1.119756, 1, 0.04313726, 0, 1,
-2.553629, 1.805108, -0.110227, 1, 0.04705882, 0, 1,
-2.545827, -0.808817, -1.698745, 1, 0.05490196, 0, 1,
-2.399146, 0.5043139, -1.341081, 1, 0.05882353, 0, 1,
-2.385387, -0.6821432, -2.153269, 1, 0.06666667, 0, 1,
-2.350781, 1.27892, -0.9261897, 1, 0.07058824, 0, 1,
-2.332403, 0.9853685, -1.192706, 1, 0.07843138, 0, 1,
-2.32594, -0.4390884, -0.6336975, 1, 0.08235294, 0, 1,
-2.249259, -0.8230944, -2.466636, 1, 0.09019608, 0, 1,
-2.248583, -0.3096261, -3.307716, 1, 0.09411765, 0, 1,
-2.136466, 1.700643, -1.415965, 1, 0.1019608, 0, 1,
-2.096511, -0.4139405, -2.094389, 1, 0.1098039, 0, 1,
-2.095329, -2.010202, -3.362039, 1, 0.1137255, 0, 1,
-2.069152, 1.081359, -2.546659, 1, 0.1215686, 0, 1,
-2.062361, 1.976785, -0.7697801, 1, 0.1254902, 0, 1,
-2.043239, -0.1734901, -3.01847, 1, 0.1333333, 0, 1,
-2.021175, 0.4580131, -0.6991532, 1, 0.1372549, 0, 1,
-1.989236, -0.698435, -0.7025433, 1, 0.145098, 0, 1,
-1.976906, 0.2294966, -0.7760024, 1, 0.1490196, 0, 1,
-1.965669, 2.874099, -0.1722375, 1, 0.1568628, 0, 1,
-1.959824, -0.4294277, -3.222568, 1, 0.1607843, 0, 1,
-1.954348, -0.8530639, -1.40628, 1, 0.1686275, 0, 1,
-1.93659, -0.4254013, -2.879443, 1, 0.172549, 0, 1,
-1.889897, 1.84517, -0.5596184, 1, 0.1803922, 0, 1,
-1.886858, -0.06986099, -1.897536, 1, 0.1843137, 0, 1,
-1.877933, -0.325508, -0.2705675, 1, 0.1921569, 0, 1,
-1.873466, -0.2107694, -1.518912, 1, 0.1960784, 0, 1,
-1.857761, 0.4468814, -0.9499766, 1, 0.2039216, 0, 1,
-1.835375, -0.4321999, -2.092303, 1, 0.2117647, 0, 1,
-1.829936, 0.3511579, -1.692271, 1, 0.2156863, 0, 1,
-1.812547, -0.0939083, -1.32797, 1, 0.2235294, 0, 1,
-1.81075, 0.04069528, -1.669691, 1, 0.227451, 0, 1,
-1.801516, 0.652028, -0.8066936, 1, 0.2352941, 0, 1,
-1.783677, 0.7183614, -2.352839, 1, 0.2392157, 0, 1,
-1.777963, 1.451382, 0.78815, 1, 0.2470588, 0, 1,
-1.758943, -0.8517768, -0.5226996, 1, 0.2509804, 0, 1,
-1.758607, -0.2965563, -1.062494, 1, 0.2588235, 0, 1,
-1.751676, 0.3684271, -1.199701, 1, 0.2627451, 0, 1,
-1.729686, 1.668168, -0.4495673, 1, 0.2705882, 0, 1,
-1.723133, -0.01651854, -3.076503, 1, 0.2745098, 0, 1,
-1.716818, -0.1534148, -0.758979, 1, 0.282353, 0, 1,
-1.707332, -0.01368453, -2.191801, 1, 0.2862745, 0, 1,
-1.706868, 2.351744, -2.625233, 1, 0.2941177, 0, 1,
-1.673745, -1.363247, -1.684624, 1, 0.3019608, 0, 1,
-1.670909, -1.525106, -0.5212068, 1, 0.3058824, 0, 1,
-1.664051, 0.1779837, -0.6790444, 1, 0.3137255, 0, 1,
-1.65481, 0.4714566, -0.6425813, 1, 0.3176471, 0, 1,
-1.654097, 0.1315282, -1.198473, 1, 0.3254902, 0, 1,
-1.612037, 0.7145125, -2.082858, 1, 0.3294118, 0, 1,
-1.611199, -0.006667627, -2.149998, 1, 0.3372549, 0, 1,
-1.590338, 1.633741, -0.8947821, 1, 0.3411765, 0, 1,
-1.570213, 0.1720827, -1.195434, 1, 0.3490196, 0, 1,
-1.561609, 0.704432, -1.961036, 1, 0.3529412, 0, 1,
-1.561196, 2.8338, -0.2978209, 1, 0.3607843, 0, 1,
-1.560446, -0.1955046, -1.895427, 1, 0.3647059, 0, 1,
-1.551888, 1.378636, 0.1888119, 1, 0.372549, 0, 1,
-1.546466, -0.3569063, -0.9583364, 1, 0.3764706, 0, 1,
-1.534461, 1.207845, -1.168825, 1, 0.3843137, 0, 1,
-1.529993, 0.8843967, 0.6273754, 1, 0.3882353, 0, 1,
-1.524505, 0.8765155, -2.401421, 1, 0.3960784, 0, 1,
-1.524477, -0.01675879, -2.421923, 1, 0.4039216, 0, 1,
-1.520972, -0.6005702, -2.8893, 1, 0.4078431, 0, 1,
-1.516502, -0.9589111, -1.944041, 1, 0.4156863, 0, 1,
-1.509514, 0.9613023, -0.8083045, 1, 0.4196078, 0, 1,
-1.506643, 1.688763, -1.310759, 1, 0.427451, 0, 1,
-1.505122, -0.4133231, -1.509032, 1, 0.4313726, 0, 1,
-1.50337, 1.511526, 0.2666402, 1, 0.4392157, 0, 1,
-1.502866, 0.1098865, -2.322755, 1, 0.4431373, 0, 1,
-1.495402, 0.5634576, -1.968004, 1, 0.4509804, 0, 1,
-1.479186, -0.4526702, -2.93528, 1, 0.454902, 0, 1,
-1.468414, 0.01828528, -1.887335, 1, 0.4627451, 0, 1,
-1.46014, 0.1946912, -0.9256938, 1, 0.4666667, 0, 1,
-1.447297, 0.251843, -1.293367, 1, 0.4745098, 0, 1,
-1.429145, -1.532, -1.2172, 1, 0.4784314, 0, 1,
-1.423874, 1.76647, -1.124221, 1, 0.4862745, 0, 1,
-1.416589, 0.4912021, -0.8873822, 1, 0.4901961, 0, 1,
-1.41122, 0.3716835, -1.862106, 1, 0.4980392, 0, 1,
-1.410715, 0.8545442, -1.09808, 1, 0.5058824, 0, 1,
-1.409005, 0.9574764, -1.529365, 1, 0.509804, 0, 1,
-1.392564, 1.230543, -1.609232, 1, 0.5176471, 0, 1,
-1.390891, 0.09466045, -1.266294, 1, 0.5215687, 0, 1,
-1.383898, 1.295876, -0.7163084, 1, 0.5294118, 0, 1,
-1.377167, -1.081467, -2.824516, 1, 0.5333334, 0, 1,
-1.372561, -0.07630783, -0.6762652, 1, 0.5411765, 0, 1,
-1.363146, 0.1842549, -3.125248, 1, 0.5450981, 0, 1,
-1.360523, 1.893315, -0.5261644, 1, 0.5529412, 0, 1,
-1.360506, -0.5474815, 0.3240407, 1, 0.5568628, 0, 1,
-1.357242, -0.006720003, -2.590106, 1, 0.5647059, 0, 1,
-1.340935, -0.1138806, -2.446845, 1, 0.5686275, 0, 1,
-1.3405, 0.6151924, 1.569778, 1, 0.5764706, 0, 1,
-1.339883, 0.05625698, -4.581021, 1, 0.5803922, 0, 1,
-1.339189, -0.372998, -0.4294374, 1, 0.5882353, 0, 1,
-1.336555, -1.055007, -2.711142, 1, 0.5921569, 0, 1,
-1.332981, -0.3391061, -1.360668, 1, 0.6, 0, 1,
-1.332341, 1.058941, -1.949055, 1, 0.6078432, 0, 1,
-1.326524, -0.3781137, -0.8545503, 1, 0.6117647, 0, 1,
-1.322284, 0.2068558, 0.2116562, 1, 0.6196079, 0, 1,
-1.316388, -1.420768, -2.437874, 1, 0.6235294, 0, 1,
-1.315851, -0.5585042, -2.270652, 1, 0.6313726, 0, 1,
-1.310706, -0.2743112, -2.259835, 1, 0.6352941, 0, 1,
-1.296115, -1.889182, -3.264522, 1, 0.6431373, 0, 1,
-1.295324, -1.312749, -2.566323, 1, 0.6470588, 0, 1,
-1.290791, -1.185175, -2.843452, 1, 0.654902, 0, 1,
-1.276482, 0.9810076, -0.3189062, 1, 0.6588235, 0, 1,
-1.27629, 0.2330876, -2.923477, 1, 0.6666667, 0, 1,
-1.26954, 1.398552, -0.08482283, 1, 0.6705883, 0, 1,
-1.268073, 0.7262889, 0.9564535, 1, 0.6784314, 0, 1,
-1.264678, -0.6905417, -2.261318, 1, 0.682353, 0, 1,
-1.262772, -0.02737111, -1.483739, 1, 0.6901961, 0, 1,
-1.260989, 0.1733904, -3.682629, 1, 0.6941177, 0, 1,
-1.258415, 0.4573993, -2.430375, 1, 0.7019608, 0, 1,
-1.257881, -1.071208, -3.511791, 1, 0.7098039, 0, 1,
-1.246867, 0.5555356, -1.578298, 1, 0.7137255, 0, 1,
-1.246163, 1.148139, -0.9840276, 1, 0.7215686, 0, 1,
-1.230273, 1.600594, -2.819093, 1, 0.7254902, 0, 1,
-1.227627, -0.3370728, -1.513204, 1, 0.7333333, 0, 1,
-1.212975, -0.2235815, -0.08819098, 1, 0.7372549, 0, 1,
-1.212882, -0.4666875, -1.479092, 1, 0.7450981, 0, 1,
-1.209759, -0.9094504, -2.837456, 1, 0.7490196, 0, 1,
-1.201511, -0.2670822, -1.342324, 1, 0.7568628, 0, 1,
-1.193034, -1.637839, -1.494504, 1, 0.7607843, 0, 1,
-1.192856, 0.5555756, -1.869458, 1, 0.7686275, 0, 1,
-1.189202, 0.6181681, -1.931187, 1, 0.772549, 0, 1,
-1.171701, 0.371654, -1.301284, 1, 0.7803922, 0, 1,
-1.169252, 0.8815548, -0.4529715, 1, 0.7843137, 0, 1,
-1.166099, -1.842122, -1.390281, 1, 0.7921569, 0, 1,
-1.164331, -1.040995, -3.004066, 1, 0.7960784, 0, 1,
-1.163125, 0.7739353, -2.111357, 1, 0.8039216, 0, 1,
-1.153245, 1.306898, -1.824891, 1, 0.8117647, 0, 1,
-1.15151, 1.017276, 0.6761121, 1, 0.8156863, 0, 1,
-1.143934, -0.550249, 0.1515992, 1, 0.8235294, 0, 1,
-1.138479, -0.5765921, -3.355499, 1, 0.827451, 0, 1,
-1.129644, -0.8929868, -1.632746, 1, 0.8352941, 0, 1,
-1.129636, -0.7728139, -1.59217, 1, 0.8392157, 0, 1,
-1.128555, 1.097937, -1.458743, 1, 0.8470588, 0, 1,
-1.126143, 0.7555866, -0.9430397, 1, 0.8509804, 0, 1,
-1.122762, 0.3543578, -2.515545, 1, 0.8588235, 0, 1,
-1.117723, -0.8118838, -2.244652, 1, 0.8627451, 0, 1,
-1.117059, -0.9958463, -1.732499, 1, 0.8705882, 0, 1,
-1.110512, -0.9929168, -1.319796, 1, 0.8745098, 0, 1,
-1.104007, -0.9459023, -2.157681, 1, 0.8823529, 0, 1,
-1.102753, -0.1191302, -0.2868965, 1, 0.8862745, 0, 1,
-1.091131, 1.266179, -2.820024, 1, 0.8941177, 0, 1,
-1.08298, 1.768021, -0.09583878, 1, 0.8980392, 0, 1,
-1.079576, 0.7694113, -1.911116, 1, 0.9058824, 0, 1,
-1.078255, -1.846483, -3.403022, 1, 0.9137255, 0, 1,
-1.076053, 0.03402472, -2.936892, 1, 0.9176471, 0, 1,
-1.071118, -1.172701, -2.307992, 1, 0.9254902, 0, 1,
-1.066571, 1.22877, 1.531547, 1, 0.9294118, 0, 1,
-1.063655, -1.471092, -1.516283, 1, 0.9372549, 0, 1,
-1.058844, 0.6414979, -0.03047288, 1, 0.9411765, 0, 1,
-1.056915, -0.8124104, -1.732369, 1, 0.9490196, 0, 1,
-1.056455, -0.2842369, -1.546077, 1, 0.9529412, 0, 1,
-1.056272, 1.262023, -3.444863, 1, 0.9607843, 0, 1,
-1.055123, -0.1129986, -2.684907, 1, 0.9647059, 0, 1,
-1.054961, -0.1949651, -1.603044, 1, 0.972549, 0, 1,
-1.051751, 3.056563, -0.2420247, 1, 0.9764706, 0, 1,
-1.049317, 0.2511527, -1.300741, 1, 0.9843137, 0, 1,
-1.046969, -0.9548678, -2.250049, 1, 0.9882353, 0, 1,
-1.046334, -0.1472735, -1.669012, 1, 0.9960784, 0, 1,
-1.04612, 1.204057, -0.3449267, 0.9960784, 1, 0, 1,
-1.0439, 2.303868, 1.19766, 0.9921569, 1, 0, 1,
-1.035084, 1.009405, 1.117692, 0.9843137, 1, 0, 1,
-1.030924, -0.7085485, -2.752578, 0.9803922, 1, 0, 1,
-1.023435, 0.1315549, -3.100996, 0.972549, 1, 0, 1,
-1.023383, 2.239155, -2.236865, 0.9686275, 1, 0, 1,
-1.02281, -0.2917701, -1.831263, 0.9607843, 1, 0, 1,
-1.01338, -0.06402758, -2.579135, 0.9568627, 1, 0, 1,
-1.006792, -1.623545, -0.5994638, 0.9490196, 1, 0, 1,
-1.002837, -0.5000234, -0.6740426, 0.945098, 1, 0, 1,
-0.9932666, -0.0863508, -0.557492, 0.9372549, 1, 0, 1,
-0.9901377, -0.5006849, -3.610527, 0.9333333, 1, 0, 1,
-0.9793236, -0.6622199, -3.67222, 0.9254902, 1, 0, 1,
-0.9791502, -0.8313884, -4.048962, 0.9215686, 1, 0, 1,
-0.9783828, -0.1774458, -1.75714, 0.9137255, 1, 0, 1,
-0.9719321, -1.633731, -0.9993109, 0.9098039, 1, 0, 1,
-0.9698031, -0.6988474, -2.019615, 0.9019608, 1, 0, 1,
-0.9553115, -0.2094557, -0.5827888, 0.8941177, 1, 0, 1,
-0.9494213, -0.04624194, -1.574125, 0.8901961, 1, 0, 1,
-0.9407788, 0.3794778, -2.51462, 0.8823529, 1, 0, 1,
-0.9385747, 0.589218, -1.507433, 0.8784314, 1, 0, 1,
-0.9351103, -0.09477436, -2.96958, 0.8705882, 1, 0, 1,
-0.9171554, 0.5557807, -0.1260612, 0.8666667, 1, 0, 1,
-0.9108778, -0.2576774, 0.8900635, 0.8588235, 1, 0, 1,
-0.9014036, -1.382931, -3.110274, 0.854902, 1, 0, 1,
-0.8942173, -1.589519, -3.64414, 0.8470588, 1, 0, 1,
-0.8939134, -0.2542802, -2.134793, 0.8431373, 1, 0, 1,
-0.8937485, -0.58762, -2.7275, 0.8352941, 1, 0, 1,
-0.8916886, 1.146698, -0.6068748, 0.8313726, 1, 0, 1,
-0.8906147, -0.5543088, -3.54484, 0.8235294, 1, 0, 1,
-0.8902017, -0.455039, -1.104277, 0.8196079, 1, 0, 1,
-0.8850253, -0.05779276, -1.537951, 0.8117647, 1, 0, 1,
-0.884112, -0.3322949, -2.576736, 0.8078431, 1, 0, 1,
-0.8838084, 1.057686, -1.091878, 0.8, 1, 0, 1,
-0.883082, -0.3983479, -1.414459, 0.7921569, 1, 0, 1,
-0.8723857, -1.252529, -2.844684, 0.7882353, 1, 0, 1,
-0.8696616, -1.188963, -2.553454, 0.7803922, 1, 0, 1,
-0.8664777, 0.320007, -1.600412, 0.7764706, 1, 0, 1,
-0.8584516, -0.2997774, -0.28445, 0.7686275, 1, 0, 1,
-0.8559539, 0.1618402, -2.80219, 0.7647059, 1, 0, 1,
-0.8510057, -0.06391077, -1.895995, 0.7568628, 1, 0, 1,
-0.8461299, 0.2236489, -1.258668, 0.7529412, 1, 0, 1,
-0.8458099, -1.960572, -1.679275, 0.7450981, 1, 0, 1,
-0.8452881, 0.9545152, -0.1820065, 0.7411765, 1, 0, 1,
-0.8315737, 0.6829229, 0.3448382, 0.7333333, 1, 0, 1,
-0.8302801, 0.2046293, -1.685801, 0.7294118, 1, 0, 1,
-0.8286225, 0.9724994, -0.3210194, 0.7215686, 1, 0, 1,
-0.8281091, -2.152316, -2.104986, 0.7176471, 1, 0, 1,
-0.8218253, -0.1127414, -1.809355, 0.7098039, 1, 0, 1,
-0.821322, -0.02517378, -0.4366649, 0.7058824, 1, 0, 1,
-0.8148027, 1.322907, -0.4150947, 0.6980392, 1, 0, 1,
-0.8098074, -0.2404535, -3.535058, 0.6901961, 1, 0, 1,
-0.8086917, -2.06278, -3.719341, 0.6862745, 1, 0, 1,
-0.8032868, -0.6672617, -2.477127, 0.6784314, 1, 0, 1,
-0.8006971, 0.6503789, -0.673656, 0.6745098, 1, 0, 1,
-0.7980393, 0.4130405, 0.7139239, 0.6666667, 1, 0, 1,
-0.7955559, -1.186327, -2.804391, 0.6627451, 1, 0, 1,
-0.7952406, -0.9475901, -3.039698, 0.654902, 1, 0, 1,
-0.793821, -0.2813416, -2.857436, 0.6509804, 1, 0, 1,
-0.7926748, -0.9084209, -3.186063, 0.6431373, 1, 0, 1,
-0.7880161, -1.467887, -3.514128, 0.6392157, 1, 0, 1,
-0.7875725, 0.05236064, -2.087222, 0.6313726, 1, 0, 1,
-0.7858965, 2.185627, 0.4298455, 0.627451, 1, 0, 1,
-0.7841499, 0.5694644, -1.108422, 0.6196079, 1, 0, 1,
-0.781338, 0.5166362, -0.9809418, 0.6156863, 1, 0, 1,
-0.7806185, 0.7444732, -1.588009, 0.6078432, 1, 0, 1,
-0.7763892, -0.9905432, -3.272204, 0.6039216, 1, 0, 1,
-0.7762169, -0.1055941, -0.9176241, 0.5960785, 1, 0, 1,
-0.772669, 0.2156609, 0.4960586, 0.5882353, 1, 0, 1,
-0.768183, -0.1824296, -2.878666, 0.5843138, 1, 0, 1,
-0.7680987, -0.2949696, -2.466537, 0.5764706, 1, 0, 1,
-0.7674745, 1.78076, -0.5356228, 0.572549, 1, 0, 1,
-0.7666194, 0.01911968, -1.663522, 0.5647059, 1, 0, 1,
-0.7654589, -0.3244185, -2.255771, 0.5607843, 1, 0, 1,
-0.7526795, 1.013525, -0.7101711, 0.5529412, 1, 0, 1,
-0.7359933, -0.5209883, -3.053359, 0.5490196, 1, 0, 1,
-0.734672, -0.1814584, -1.876387, 0.5411765, 1, 0, 1,
-0.7307159, 0.6781499, -0.3331053, 0.5372549, 1, 0, 1,
-0.7296857, -1.066522, -4.555563, 0.5294118, 1, 0, 1,
-0.7277617, -0.1185211, -1.519632, 0.5254902, 1, 0, 1,
-0.7270312, 1.089013, -0.9552541, 0.5176471, 1, 0, 1,
-0.7248049, 0.9197236, -1.401317, 0.5137255, 1, 0, 1,
-0.7206694, 0.07353607, -1.609927, 0.5058824, 1, 0, 1,
-0.7198489, -1.450354, -3.430284, 0.5019608, 1, 0, 1,
-0.7184031, 0.8996978, -1.549504, 0.4941176, 1, 0, 1,
-0.7171307, 1.109279, -1.745365, 0.4862745, 1, 0, 1,
-0.7141057, -1.364139, -3.162619, 0.4823529, 1, 0, 1,
-0.7136316, 1.076845, -1.686159, 0.4745098, 1, 0, 1,
-0.7054533, -1.40069, -3.190084, 0.4705882, 1, 0, 1,
-0.6984441, 1.211569, -0.9584994, 0.4627451, 1, 0, 1,
-0.6965298, 1.415848, -1.41346, 0.4588235, 1, 0, 1,
-0.6956584, -0.5217537, -2.420673, 0.4509804, 1, 0, 1,
-0.6872084, 0.2557088, 0.4340169, 0.4470588, 1, 0, 1,
-0.6860164, 0.8709758, -0.9716008, 0.4392157, 1, 0, 1,
-0.6846549, 0.6802369, 0.04344111, 0.4352941, 1, 0, 1,
-0.6837029, -0.1008373, -1.04566, 0.427451, 1, 0, 1,
-0.6826598, 2.575077, -0.2236658, 0.4235294, 1, 0, 1,
-0.665373, -0.01574739, -2.755375, 0.4156863, 1, 0, 1,
-0.6644841, 1.045644, -0.875025, 0.4117647, 1, 0, 1,
-0.6590151, -0.7079476, -1.292979, 0.4039216, 1, 0, 1,
-0.6572715, 1.405395, -0.5826884, 0.3960784, 1, 0, 1,
-0.6469067, 2.704207, -1.675519, 0.3921569, 1, 0, 1,
-0.6427404, -0.2634023, -4.860008, 0.3843137, 1, 0, 1,
-0.6420481, -2.278311, -3.33295, 0.3803922, 1, 0, 1,
-0.6346487, 0.1814021, -1.060796, 0.372549, 1, 0, 1,
-0.6334772, -1.290565, -1.250729, 0.3686275, 1, 0, 1,
-0.63336, 1.009781, -2.249617, 0.3607843, 1, 0, 1,
-0.6325815, -0.5389593, -1.015302, 0.3568628, 1, 0, 1,
-0.6274662, -0.5845034, -3.247765, 0.3490196, 1, 0, 1,
-0.6255239, -0.3831153, -1.268972, 0.345098, 1, 0, 1,
-0.6235265, -1.848679, -3.112214, 0.3372549, 1, 0, 1,
-0.6191686, 1.07874, 0.1037215, 0.3333333, 1, 0, 1,
-0.6188674, -0.1953448, -3.437629, 0.3254902, 1, 0, 1,
-0.6137478, 0.397431, -0.6576843, 0.3215686, 1, 0, 1,
-0.608449, -0.2492367, -1.431342, 0.3137255, 1, 0, 1,
-0.6045985, 0.9843773, -0.9099581, 0.3098039, 1, 0, 1,
-0.6013287, -0.01566059, -3.423054, 0.3019608, 1, 0, 1,
-0.6001652, -0.1881834, -1.689423, 0.2941177, 1, 0, 1,
-0.5912626, 0.4100263, -3.031388, 0.2901961, 1, 0, 1,
-0.589851, -0.05576517, -1.072699, 0.282353, 1, 0, 1,
-0.5874456, 0.2761737, -2.774704, 0.2784314, 1, 0, 1,
-0.5856233, -0.4367605, -1.486875, 0.2705882, 1, 0, 1,
-0.5842206, -1.199584, -3.621068, 0.2666667, 1, 0, 1,
-0.5829772, -1.012397, -3.615226, 0.2588235, 1, 0, 1,
-0.5821984, -1.359405, -4.049993, 0.254902, 1, 0, 1,
-0.5821201, -1.633791, -1.612699, 0.2470588, 1, 0, 1,
-0.5797279, 0.09951165, -2.174187, 0.2431373, 1, 0, 1,
-0.5791857, -0.2780343, -1.892505, 0.2352941, 1, 0, 1,
-0.5770322, -1.498189, -1.67905, 0.2313726, 1, 0, 1,
-0.5756994, 0.2411454, -1.067542, 0.2235294, 1, 0, 1,
-0.5741856, -0.6867635, -1.861846, 0.2196078, 1, 0, 1,
-0.5696539, -0.05296148, -0.06271745, 0.2117647, 1, 0, 1,
-0.5664694, 0.0615368, -1.507327, 0.2078431, 1, 0, 1,
-0.5647361, 0.3865311, -1.983212, 0.2, 1, 0, 1,
-0.5614793, 0.8465934, -1.211506, 0.1921569, 1, 0, 1,
-0.5599589, 0.4925075, -0.2421888, 0.1882353, 1, 0, 1,
-0.559245, 1.577826, 0.07312447, 0.1803922, 1, 0, 1,
-0.5525055, 1.015866, -1.791587, 0.1764706, 1, 0, 1,
-0.5380009, 0.489553, -1.608783, 0.1686275, 1, 0, 1,
-0.5378353, 0.6350079, -0.0829143, 0.1647059, 1, 0, 1,
-0.5341412, -0.6165667, -1.997356, 0.1568628, 1, 0, 1,
-0.5341321, 0.3387366, 0.8565067, 0.1529412, 1, 0, 1,
-0.5324439, 0.6909392, 0.07925152, 0.145098, 1, 0, 1,
-0.5247492, 1.057144, -1.12952, 0.1411765, 1, 0, 1,
-0.5245196, -1.631684, -0.7286667, 0.1333333, 1, 0, 1,
-0.5235577, 0.6871669, -1.516398, 0.1294118, 1, 0, 1,
-0.5188958, -0.223174, -0.169607, 0.1215686, 1, 0, 1,
-0.5143651, 0.2688804, -2.0217, 0.1176471, 1, 0, 1,
-0.5130316, 2.059242, 0.855969, 0.1098039, 1, 0, 1,
-0.512389, 0.1850557, -1.486954, 0.1058824, 1, 0, 1,
-0.5081121, -1.556684, -1.934601, 0.09803922, 1, 0, 1,
-0.5016319, -0.6822272, -1.160666, 0.09019608, 1, 0, 1,
-0.4993832, 0.3325389, -0.001225537, 0.08627451, 1, 0, 1,
-0.4987636, 0.7434448, -1.571905, 0.07843138, 1, 0, 1,
-0.497218, -0.1548009, -3.159103, 0.07450981, 1, 0, 1,
-0.4917549, -1.715903, -3.275984, 0.06666667, 1, 0, 1,
-0.4915468, 0.07060069, -2.08378, 0.0627451, 1, 0, 1,
-0.4873498, 2.867969, 0.5069393, 0.05490196, 1, 0, 1,
-0.482764, 1.476712, 0.4132085, 0.05098039, 1, 0, 1,
-0.4801637, 0.5393777, 0.2053629, 0.04313726, 1, 0, 1,
-0.4755597, 0.3862053, -1.94427, 0.03921569, 1, 0, 1,
-0.4736931, -0.8387456, -1.567668, 0.03137255, 1, 0, 1,
-0.4676441, -2.876972, -1.709804, 0.02745098, 1, 0, 1,
-0.4672085, 0.1871042, -0.8230095, 0.01960784, 1, 0, 1,
-0.4660885, 0.9577467, -2.089185, 0.01568628, 1, 0, 1,
-0.460705, 0.8935114, -0.9215421, 0.007843138, 1, 0, 1,
-0.4569075, 0.3231898, -2.519877, 0.003921569, 1, 0, 1,
-0.4564188, 1.389749, 0.2533323, 0, 1, 0.003921569, 1,
-0.4505217, -0.1431802, -0.7732807, 0, 1, 0.01176471, 1,
-0.4489585, -0.6502867, -2.779941, 0, 1, 0.01568628, 1,
-0.4483052, -0.1297343, -2.038738, 0, 1, 0.02352941, 1,
-0.4446523, -1.431962, -1.439926, 0, 1, 0.02745098, 1,
-0.44363, 0.6130781, -0.8950832, 0, 1, 0.03529412, 1,
-0.4429892, 1.417607, 0.554241, 0, 1, 0.03921569, 1,
-0.4312128, -1.103013, -3.115712, 0, 1, 0.04705882, 1,
-0.4288929, -0.2936973, -2.301428, 0, 1, 0.05098039, 1,
-0.4237208, 0.1699585, -1.286345, 0, 1, 0.05882353, 1,
-0.4227396, -0.7721521, -3.468947, 0, 1, 0.0627451, 1,
-0.4198592, 0.7245442, -2.255502, 0, 1, 0.07058824, 1,
-0.4172904, 0.5934548, -0.4660343, 0, 1, 0.07450981, 1,
-0.4049815, 0.6870759, -0.4784549, 0, 1, 0.08235294, 1,
-0.4023167, -1.111246, -4.081135, 0, 1, 0.08627451, 1,
-0.3970738, -0.3424068, -4.425775, 0, 1, 0.09411765, 1,
-0.3888684, 0.7504154, -0.5425623, 0, 1, 0.1019608, 1,
-0.3880739, -0.2206631, -2.564764, 0, 1, 0.1058824, 1,
-0.3864025, -1.138764, -1.549282, 0, 1, 0.1137255, 1,
-0.3844233, 0.6302603, -0.7814857, 0, 1, 0.1176471, 1,
-0.3801106, 0.7031253, -1.13658, 0, 1, 0.1254902, 1,
-0.3763403, 0.6407882, -1.133694, 0, 1, 0.1294118, 1,
-0.3729925, -0.3655753, -3.037461, 0, 1, 0.1372549, 1,
-0.3728371, 0.7521974, -0.4010269, 0, 1, 0.1411765, 1,
-0.3727762, -0.04759029, -2.827622, 0, 1, 0.1490196, 1,
-0.3714405, -1.503689, -3.921523, 0, 1, 0.1529412, 1,
-0.3706751, 1.411337, -0.09641841, 0, 1, 0.1607843, 1,
-0.3673782, 0.8240628, -0.01075381, 0, 1, 0.1647059, 1,
-0.3655757, 1.051636, 0.4804446, 0, 1, 0.172549, 1,
-0.3640674, 0.3368596, -2.125516, 0, 1, 0.1764706, 1,
-0.3602363, 1.567025, -0.03374335, 0, 1, 0.1843137, 1,
-0.3563868, -1.147589, -1.968556, 0, 1, 0.1882353, 1,
-0.3546357, -1.220259, -2.938474, 0, 1, 0.1960784, 1,
-0.3509, 0.2382487, -0.845852, 0, 1, 0.2039216, 1,
-0.3483757, 0.2373286, -1.01951, 0, 1, 0.2078431, 1,
-0.347063, 1.683875, 0.7724586, 0, 1, 0.2156863, 1,
-0.3458994, -0.4881743, -1.835708, 0, 1, 0.2196078, 1,
-0.340546, -0.1969057, -2.885893, 0, 1, 0.227451, 1,
-0.3340952, 0.1310785, -0.9066485, 0, 1, 0.2313726, 1,
-0.3309439, -0.6043572, -1.630549, 0, 1, 0.2392157, 1,
-0.3307279, 0.7473921, 1.136766, 0, 1, 0.2431373, 1,
-0.3276004, 0.9223213, -2.374597, 0, 1, 0.2509804, 1,
-0.3245041, -1.56595, -2.830827, 0, 1, 0.254902, 1,
-0.3209959, 1.793326, 0.3330162, 0, 1, 0.2627451, 1,
-0.3193585, -1.510475, -0.5296305, 0, 1, 0.2666667, 1,
-0.317598, -0.03278049, -2.342596, 0, 1, 0.2745098, 1,
-0.3160975, 0.7492443, -0.7098941, 0, 1, 0.2784314, 1,
-0.3143253, 0.2111935, -1.792345, 0, 1, 0.2862745, 1,
-0.3108176, 1.419541, -0.7689215, 0, 1, 0.2901961, 1,
-0.3022, -0.5733963, -5.13729, 0, 1, 0.2980392, 1,
-0.3005511, 0.1651662, -1.667949, 0, 1, 0.3058824, 1,
-0.2972336, 0.619976, -1.363774, 0, 1, 0.3098039, 1,
-0.2939948, 0.8260058, -0.536684, 0, 1, 0.3176471, 1,
-0.2922385, 0.5761772, 1.099595, 0, 1, 0.3215686, 1,
-0.2894782, 1.77201, 0.7633777, 0, 1, 0.3294118, 1,
-0.2889377, -0.6547065, -1.774163, 0, 1, 0.3333333, 1,
-0.2888312, 0.9550452, -1.437796, 0, 1, 0.3411765, 1,
-0.2850733, -0.19063, -1.008671, 0, 1, 0.345098, 1,
-0.2833939, -0.237272, -2.001318, 0, 1, 0.3529412, 1,
-0.2785337, 0.4743732, -1.145082, 0, 1, 0.3568628, 1,
-0.2716834, -0.9432104, -1.964045, 0, 1, 0.3647059, 1,
-0.2714433, -0.4526072, -1.691916, 0, 1, 0.3686275, 1,
-0.2703933, 0.8104091, -0.6512653, 0, 1, 0.3764706, 1,
-0.2701041, -0.1936249, -1.098407, 0, 1, 0.3803922, 1,
-0.2693472, 1.602324, -0.6883317, 0, 1, 0.3882353, 1,
-0.2579995, -0.3305179, -0.6991111, 0, 1, 0.3921569, 1,
-0.2559477, 2.140765, 0.1459719, 0, 1, 0.4, 1,
-0.251255, 0.2758491, -0.5117949, 0, 1, 0.4078431, 1,
-0.2496663, 3.335545, -1.637103, 0, 1, 0.4117647, 1,
-0.2470371, 0.3186759, -1.366896, 0, 1, 0.4196078, 1,
-0.2455794, -0.5839137, -1.159727, 0, 1, 0.4235294, 1,
-0.2444801, 0.5770339, 1.845182, 0, 1, 0.4313726, 1,
-0.2439003, -1.077349, -2.37547, 0, 1, 0.4352941, 1,
-0.2429766, -1.216644, -3.030699, 0, 1, 0.4431373, 1,
-0.2408642, -0.4060931, -4.054967, 0, 1, 0.4470588, 1,
-0.2386328, 0.8419132, 0.6033062, 0, 1, 0.454902, 1,
-0.2384675, -0.8205243, -3.534934, 0, 1, 0.4588235, 1,
-0.2353048, -1.305629, -2.56659, 0, 1, 0.4666667, 1,
-0.2337511, -0.09609374, -2.639986, 0, 1, 0.4705882, 1,
-0.233109, 0.09830988, 0.6135293, 0, 1, 0.4784314, 1,
-0.2317412, -1.504796, -3.444223, 0, 1, 0.4823529, 1,
-0.2315479, 0.5490949, -1.518451, 0, 1, 0.4901961, 1,
-0.2291846, 0.4027964, 0.8657898, 0, 1, 0.4941176, 1,
-0.2227238, -2.616499, -4.705716, 0, 1, 0.5019608, 1,
-0.2187439, 0.3610865, -1.767184, 0, 1, 0.509804, 1,
-0.2175726, 1.408421, -1.076448, 0, 1, 0.5137255, 1,
-0.2172232, -0.4039333, -2.684539, 0, 1, 0.5215687, 1,
-0.2149008, 0.04027158, -0.5121616, 0, 1, 0.5254902, 1,
-0.212033, -1.435425, -4.328567, 0, 1, 0.5333334, 1,
-0.2093541, 0.04406705, -0.7395719, 0, 1, 0.5372549, 1,
-0.2057199, 0.5439377, -0.4374956, 0, 1, 0.5450981, 1,
-0.2008529, -0.5026343, -3.111059, 0, 1, 0.5490196, 1,
-0.2006101, 0.4691871, 1.048386, 0, 1, 0.5568628, 1,
-0.1972681, 0.02266208, -1.290773, 0, 1, 0.5607843, 1,
-0.1971939, 1.141308, 1.471639, 0, 1, 0.5686275, 1,
-0.1924383, 1.210471, -0.6636587, 0, 1, 0.572549, 1,
-0.1920945, 1.853171, -0.5612932, 0, 1, 0.5803922, 1,
-0.1918727, 0.7313144, -0.2734245, 0, 1, 0.5843138, 1,
-0.1911317, 0.3040546, -1.422644, 0, 1, 0.5921569, 1,
-0.1884768, -0.928273, -2.404248, 0, 1, 0.5960785, 1,
-0.1868634, -0.2642798, -1.249387, 0, 1, 0.6039216, 1,
-0.1865859, 1.549748, -0.7091185, 0, 1, 0.6117647, 1,
-0.1830806, -1.356073, -5.225224, 0, 1, 0.6156863, 1,
-0.1802417, -0.4137577, -3.512302, 0, 1, 0.6235294, 1,
-0.1749763, -2.03939, -3.729702, 0, 1, 0.627451, 1,
-0.1739073, -0.7130702, -2.060558, 0, 1, 0.6352941, 1,
-0.1738012, 0.2091478, -0.6128535, 0, 1, 0.6392157, 1,
-0.1691317, 1.20325, -1.215809, 0, 1, 0.6470588, 1,
-0.1679122, 1.291241, 0.2607837, 0, 1, 0.6509804, 1,
-0.1670749, -0.263629, -2.298416, 0, 1, 0.6588235, 1,
-0.1615091, -1.319631, -4.683651, 0, 1, 0.6627451, 1,
-0.1606265, -0.6451209, -3.160605, 0, 1, 0.6705883, 1,
-0.160543, -0.5977705, -3.306366, 0, 1, 0.6745098, 1,
-0.1512954, 0.5724056, 0.5476416, 0, 1, 0.682353, 1,
-0.1510253, -1.66436, -1.890464, 0, 1, 0.6862745, 1,
-0.1430411, 0.08041742, -1.624386, 0, 1, 0.6941177, 1,
-0.1425969, 1.393086, -2.395191, 0, 1, 0.7019608, 1,
-0.1401832, -1.807636, -3.729887, 0, 1, 0.7058824, 1,
-0.1371523, -0.9341275, -1.948603, 0, 1, 0.7137255, 1,
-0.1340025, -1.474477, -3.565579, 0, 1, 0.7176471, 1,
-0.1295957, 0.4473785, -1.204767, 0, 1, 0.7254902, 1,
-0.1255436, -1.204558, -2.375462, 0, 1, 0.7294118, 1,
-0.1237858, 0.4163788, 1.215565, 0, 1, 0.7372549, 1,
-0.1167829, -0.168862, -1.968387, 0, 1, 0.7411765, 1,
-0.1088817, -1.395892, -3.046239, 0, 1, 0.7490196, 1,
-0.1077006, 0.2406169, -1.569969, 0, 1, 0.7529412, 1,
-0.1069444, -0.9600921, -1.94589, 0, 1, 0.7607843, 1,
-0.1048988, 0.1611753, -0.5910728, 0, 1, 0.7647059, 1,
-0.1023955, 1.86977, 1.02488, 0, 1, 0.772549, 1,
-0.1000338, -0.8425291, -2.539263, 0, 1, 0.7764706, 1,
-0.0996271, -2.57563, -1.204927, 0, 1, 0.7843137, 1,
-0.09791, 1.077482, 0.04453314, 0, 1, 0.7882353, 1,
-0.09406625, -0.5808937, -1.577178, 0, 1, 0.7960784, 1,
-0.0930483, -0.7121404, -2.751005, 0, 1, 0.8039216, 1,
-0.0864465, 0.9637842, 0.2231131, 0, 1, 0.8078431, 1,
-0.08634942, 0.5369511, -0.2099064, 0, 1, 0.8156863, 1,
-0.08376627, 1.389945, -0.224351, 0, 1, 0.8196079, 1,
-0.0825255, -0.9728835, -5.19476, 0, 1, 0.827451, 1,
-0.08219381, 0.02613592, -1.666277, 0, 1, 0.8313726, 1,
-0.08165629, -0.518515, -2.241812, 0, 1, 0.8392157, 1,
-0.0760557, -1.077321, -2.471964, 0, 1, 0.8431373, 1,
-0.0723311, 1.346986, 1.43529, 0, 1, 0.8509804, 1,
-0.07173754, -0.4683267, -1.349527, 0, 1, 0.854902, 1,
-0.07034644, 0.4068382, -0.9387927, 0, 1, 0.8627451, 1,
-0.06264564, -0.05384412, -2.833635, 0, 1, 0.8666667, 1,
-0.06146932, -0.007626597, -1.157287, 0, 1, 0.8745098, 1,
-0.05971636, 2.173698, 1.14999, 0, 1, 0.8784314, 1,
-0.05698423, -1.346881, -3.345196, 0, 1, 0.8862745, 1,
-0.05472313, 0.8483536, -1.503994, 0, 1, 0.8901961, 1,
-0.05037358, -0.1872576, -2.342159, 0, 1, 0.8980392, 1,
-0.04890311, 2.110413, 0.506846, 0, 1, 0.9058824, 1,
-0.04768854, 0.2303463, -1.070759, 0, 1, 0.9098039, 1,
-0.04657415, -1.202073, -4.223532, 0, 1, 0.9176471, 1,
-0.04643794, 1.010538, 0.1656714, 0, 1, 0.9215686, 1,
-0.04574104, -1.334674, -3.944539, 0, 1, 0.9294118, 1,
-0.04476157, 1.119873, 0.5242224, 0, 1, 0.9333333, 1,
-0.04295724, -0.7208615, -3.344964, 0, 1, 0.9411765, 1,
-0.04195801, -0.8263806, -1.519417, 0, 1, 0.945098, 1,
-0.04141989, -0.3074066, -4.679724, 0, 1, 0.9529412, 1,
-0.03896448, 2.564626, 0.04327637, 0, 1, 0.9568627, 1,
-0.03629105, -0.3500498, -2.66902, 0, 1, 0.9647059, 1,
-0.03566901, -1.479164, -2.349993, 0, 1, 0.9686275, 1,
-0.03419045, -0.1943002, -3.471577, 0, 1, 0.9764706, 1,
-0.02295437, -0.5362266, -3.418483, 0, 1, 0.9803922, 1,
-0.02162386, 1.02198, 0.728645, 0, 1, 0.9882353, 1,
-0.02039577, -0.6612406, -2.682064, 0, 1, 0.9921569, 1,
-0.01984088, 1.301445, 1.45758, 0, 1, 1, 1,
-0.01946601, -0.5304561, -3.156856, 0, 0.9921569, 1, 1,
-0.01845523, -0.5109985, -2.576295, 0, 0.9882353, 1, 1,
-0.007126379, 0.5479933, 0.1927405, 0, 0.9803922, 1, 1,
-0.006309652, 0.9622784, 0.2151124, 0, 0.9764706, 1, 1,
-0.00313567, 0.2200635, -0.9569919, 0, 0.9686275, 1, 1,
0.001108396, -1.00502, 2.949336, 0, 0.9647059, 1, 1,
0.001667106, 0.3877508, 0.3175053, 0, 0.9568627, 1, 1,
0.008472388, 0.291009, 0.4474022, 0, 0.9529412, 1, 1,
0.01002678, -1.07072, 3.845419, 0, 0.945098, 1, 1,
0.01353043, 0.6020256, 0.867745, 0, 0.9411765, 1, 1,
0.01413708, -1.297177, 2.016778, 0, 0.9333333, 1, 1,
0.01653328, 0.6298168, -1.065419, 0, 0.9294118, 1, 1,
0.01866119, -0.5323365, 3.350789, 0, 0.9215686, 1, 1,
0.02287666, 0.1119334, -0.4995333, 0, 0.9176471, 1, 1,
0.02372278, -0.718356, 4.414572, 0, 0.9098039, 1, 1,
0.02392567, 0.4516655, 0.7007697, 0, 0.9058824, 1, 1,
0.02541465, -2.291018, 3.960568, 0, 0.8980392, 1, 1,
0.02659047, -0.0891582, 1.242511, 0, 0.8901961, 1, 1,
0.02668172, 0.7164361, 2.202167, 0, 0.8862745, 1, 1,
0.02681525, -0.4683838, 2.025836, 0, 0.8784314, 1, 1,
0.02721839, -1.434813, 1.948106, 0, 0.8745098, 1, 1,
0.02776022, 0.1176587, -1.411964, 0, 0.8666667, 1, 1,
0.02839846, 1.473519, 0.9669601, 0, 0.8627451, 1, 1,
0.03346992, -0.08961514, 2.785219, 0, 0.854902, 1, 1,
0.03509931, -0.5174044, 1.877558, 0, 0.8509804, 1, 1,
0.03710446, 0.1063935, 1.600772, 0, 0.8431373, 1, 1,
0.03908373, -0.4404912, 2.778268, 0, 0.8392157, 1, 1,
0.04058956, -0.1551583, 3.485515, 0, 0.8313726, 1, 1,
0.04091012, -0.2114739, 2.898911, 0, 0.827451, 1, 1,
0.04517915, 0.3831701, 0.5450619, 0, 0.8196079, 1, 1,
0.04530475, -0.2268893, 3.672115, 0, 0.8156863, 1, 1,
0.05001702, 0.5968181, 0.008793864, 0, 0.8078431, 1, 1,
0.05169016, -1.545074, 2.998364, 0, 0.8039216, 1, 1,
0.0557935, 0.8922604, 1.792631, 0, 0.7960784, 1, 1,
0.05775745, 0.08340102, 0.7749062, 0, 0.7882353, 1, 1,
0.06030653, -0.6220722, 3.945209, 0, 0.7843137, 1, 1,
0.06275231, 0.57818, 1.542739, 0, 0.7764706, 1, 1,
0.0656314, 1.581757, -0.3568717, 0, 0.772549, 1, 1,
0.06767429, 1.62236, -0.6175225, 0, 0.7647059, 1, 1,
0.06828443, -1.128709, 1.373909, 0, 0.7607843, 1, 1,
0.0738511, 0.5811771, -1.081602, 0, 0.7529412, 1, 1,
0.07470859, 1.697423, 0.06201878, 0, 0.7490196, 1, 1,
0.07802353, 0.499386, -1.264551, 0, 0.7411765, 1, 1,
0.08147865, 0.7736213, 0.1655211, 0, 0.7372549, 1, 1,
0.0840828, 0.5141492, 1.203171, 0, 0.7294118, 1, 1,
0.08438589, -0.158363, 3.225668, 0, 0.7254902, 1, 1,
0.09409132, -1.037321, 4.74865, 0, 0.7176471, 1, 1,
0.09527061, 1.816882, -1.600828, 0, 0.7137255, 1, 1,
0.09922597, -0.4130214, 2.435147, 0, 0.7058824, 1, 1,
0.1008482, 0.09033589, 0.4854517, 0, 0.6980392, 1, 1,
0.1127605, -1.639501, 1.720415, 0, 0.6941177, 1, 1,
0.1139483, 1.205113, 0.2963892, 0, 0.6862745, 1, 1,
0.1139532, 0.8648263, -1.042913, 0, 0.682353, 1, 1,
0.116785, -0.6987298, 2.664254, 0, 0.6745098, 1, 1,
0.1187137, -0.4565205, 3.297863, 0, 0.6705883, 1, 1,
0.1229316, -0.3306032, 3.732882, 0, 0.6627451, 1, 1,
0.1261636, -0.1709898, 3.843796, 0, 0.6588235, 1, 1,
0.1272867, -0.8142687, 4.635585, 0, 0.6509804, 1, 1,
0.1274378, -0.9749075, 2.542531, 0, 0.6470588, 1, 1,
0.1275707, 0.3635738, 1.861065, 0, 0.6392157, 1, 1,
0.1277496, 1.098655, 1.217587, 0, 0.6352941, 1, 1,
0.1278936, -0.6876294, 2.835017, 0, 0.627451, 1, 1,
0.1289575, -0.07865185, 2.243596, 0, 0.6235294, 1, 1,
0.1338475, -2.042528, 3.350917, 0, 0.6156863, 1, 1,
0.1394449, 2.240524, 0.07712153, 0, 0.6117647, 1, 1,
0.1426069, -0.6841239, 3.319884, 0, 0.6039216, 1, 1,
0.1439558, 0.583724, 1.347398, 0, 0.5960785, 1, 1,
0.1531134, 0.145142, 0.475844, 0, 0.5921569, 1, 1,
0.1613565, 0.1655363, 2.005336, 0, 0.5843138, 1, 1,
0.1651652, -0.408456, 2.048762, 0, 0.5803922, 1, 1,
0.1663729, -1.731171, 3.074376, 0, 0.572549, 1, 1,
0.1704475, 0.08153442, 2.474413, 0, 0.5686275, 1, 1,
0.1726624, 1.002492, -0.7085138, 0, 0.5607843, 1, 1,
0.1752365, 1.286931, 0.5521457, 0, 0.5568628, 1, 1,
0.1826848, -0.5342646, 1.757735, 0, 0.5490196, 1, 1,
0.1827484, 0.9668393, -1.392173, 0, 0.5450981, 1, 1,
0.1832651, 0.9192566, 1.624825, 0, 0.5372549, 1, 1,
0.1834289, -0.4297298, 3.303803, 0, 0.5333334, 1, 1,
0.1839398, -1.304792, 0.7324167, 0, 0.5254902, 1, 1,
0.1852841, -1.27095, 2.658832, 0, 0.5215687, 1, 1,
0.1856327, -1.29877, 3.463577, 0, 0.5137255, 1, 1,
0.1890976, 0.1627155, 1.145766, 0, 0.509804, 1, 1,
0.1900032, 0.6393598, -1.075947, 0, 0.5019608, 1, 1,
0.1906657, -1.190184, 3.305426, 0, 0.4941176, 1, 1,
0.1932442, -0.6698838, 0.7280821, 0, 0.4901961, 1, 1,
0.1941878, 0.6400943, 0.4459519, 0, 0.4823529, 1, 1,
0.1942886, 0.9184542, 0.2871968, 0, 0.4784314, 1, 1,
0.1972397, 0.3924602, 0.9575174, 0, 0.4705882, 1, 1,
0.1989182, -1.334375, 2.478884, 0, 0.4666667, 1, 1,
0.2033929, -0.1185291, 1.117085, 0, 0.4588235, 1, 1,
0.2042912, 0.2211988, 2.29351, 0, 0.454902, 1, 1,
0.2134301, -0.2795072, 3.019442, 0, 0.4470588, 1, 1,
0.2146421, -1.31989, 1.433883, 0, 0.4431373, 1, 1,
0.2183788, 0.06385301, -0.3205703, 0, 0.4352941, 1, 1,
0.2242173, 1.444944, 0.7522746, 0, 0.4313726, 1, 1,
0.2278427, -1.560194, 3.588272, 0, 0.4235294, 1, 1,
0.2301993, -0.8627462, 2.915303, 0, 0.4196078, 1, 1,
0.2336585, -1.202791, 2.57018, 0, 0.4117647, 1, 1,
0.2351068, 1.249591, -0.1017147, 0, 0.4078431, 1, 1,
0.2353648, 0.5443695, -1.199627, 0, 0.4, 1, 1,
0.2364585, -0.4260355, 2.539088, 0, 0.3921569, 1, 1,
0.2381091, -0.4834273, 3.147968, 0, 0.3882353, 1, 1,
0.2420733, -0.1255343, 2.523843, 0, 0.3803922, 1, 1,
0.2422922, -0.9293129, 2.000587, 0, 0.3764706, 1, 1,
0.2447493, -1.07624, 1.953589, 0, 0.3686275, 1, 1,
0.2468036, -0.7111736, 3.844799, 0, 0.3647059, 1, 1,
0.250982, 1.046725, 0.5521011, 0, 0.3568628, 1, 1,
0.2567804, -0.1347711, 1.984302, 0, 0.3529412, 1, 1,
0.257583, 0.2743727, 0.6377602, 0, 0.345098, 1, 1,
0.2576475, 2.146901, -0.9818437, 0, 0.3411765, 1, 1,
0.2600855, -1.820426, 2.312243, 0, 0.3333333, 1, 1,
0.261237, -1.304174, 1.631466, 0, 0.3294118, 1, 1,
0.2625175, -0.4727153, 2.45641, 0, 0.3215686, 1, 1,
0.2663717, 1.192464, -0.7437159, 0, 0.3176471, 1, 1,
0.2675503, -0.5285538, 3.255203, 0, 0.3098039, 1, 1,
0.2682576, 0.4100235, 1.151178, 0, 0.3058824, 1, 1,
0.2757796, 0.1638555, 2.172348, 0, 0.2980392, 1, 1,
0.2804684, 0.6931529, -0.03945025, 0, 0.2901961, 1, 1,
0.2910239, 0.8603267, 1.343971, 0, 0.2862745, 1, 1,
0.2913508, -1.915813, 2.955031, 0, 0.2784314, 1, 1,
0.2972117, 0.2230728, 2.62982, 0, 0.2745098, 1, 1,
0.2977747, -8.864077e-05, 0.9769326, 0, 0.2666667, 1, 1,
0.298614, 0.6203893, 0.5793912, 0, 0.2627451, 1, 1,
0.2989522, -0.8494672, 2.789012, 0, 0.254902, 1, 1,
0.3024344, -0.1237399, 2.966807, 0, 0.2509804, 1, 1,
0.3035322, -1.31685, 1.028358, 0, 0.2431373, 1, 1,
0.3042739, 1.269705, 0.7122518, 0, 0.2392157, 1, 1,
0.3058417, -0.7768886, 2.430533, 0, 0.2313726, 1, 1,
0.3174053, 0.5743083, 0.9688561, 0, 0.227451, 1, 1,
0.3213453, 1.457789, 0.09119688, 0, 0.2196078, 1, 1,
0.3221577, 1.227717, -0.374887, 0, 0.2156863, 1, 1,
0.3243707, 0.146887, 1.2386, 0, 0.2078431, 1, 1,
0.3252156, -0.5703735, 3.283796, 0, 0.2039216, 1, 1,
0.3280644, -0.3787195, -0.8429996, 0, 0.1960784, 1, 1,
0.3316232, 1.20081, -0.8467832, 0, 0.1882353, 1, 1,
0.3325993, -1.935296, 2.192827, 0, 0.1843137, 1, 1,
0.3327278, -0.537184, 2.120642, 0, 0.1764706, 1, 1,
0.3370152, -0.2682712, 2.838828, 0, 0.172549, 1, 1,
0.3393095, 0.3787232, 1.308789, 0, 0.1647059, 1, 1,
0.342402, 0.09509115, 2.391273, 0, 0.1607843, 1, 1,
0.3433384, -0.8888857, 1.644821, 0, 0.1529412, 1, 1,
0.3494169, -0.1125707, 2.855803, 0, 0.1490196, 1, 1,
0.3524948, -1.305956, 5.348109, 0, 0.1411765, 1, 1,
0.3530889, 0.6100943, 1.295161, 0, 0.1372549, 1, 1,
0.356295, 1.634717, -1.276439, 0, 0.1294118, 1, 1,
0.357763, -0.1548264, 0.8387323, 0, 0.1254902, 1, 1,
0.3593951, -2.647918, 3.335962, 0, 0.1176471, 1, 1,
0.3699827, -0.07992575, 1.199648, 0, 0.1137255, 1, 1,
0.3736438, -0.4553196, 1.637895, 0, 0.1058824, 1, 1,
0.3753345, 1.113894, 0.05822622, 0, 0.09803922, 1, 1,
0.3816858, 0.2896981, 0.04549592, 0, 0.09411765, 1, 1,
0.3873067, -1.745815, 3.430593, 0, 0.08627451, 1, 1,
0.3918473, 0.6118491, 2.469001, 0, 0.08235294, 1, 1,
0.3939512, -0.6978799, 1.469655, 0, 0.07450981, 1, 1,
0.3969167, -1.411439, 1.40361, 0, 0.07058824, 1, 1,
0.3974238, -0.4779871, 3.39561, 0, 0.0627451, 1, 1,
0.4005193, -0.8914782, 3.348444, 0, 0.05882353, 1, 1,
0.4014402, -0.4515566, 4.184636, 0, 0.05098039, 1, 1,
0.4025212, -0.7870026, 2.363695, 0, 0.04705882, 1, 1,
0.4035166, -0.213045, 3.941363, 0, 0.03921569, 1, 1,
0.4036995, -0.740062, 3.643483, 0, 0.03529412, 1, 1,
0.406711, 0.4676183, 1.819253, 0, 0.02745098, 1, 1,
0.4127283, 0.7423665, -0.5479182, 0, 0.02352941, 1, 1,
0.4132379, -0.3173999, 2.229535, 0, 0.01568628, 1, 1,
0.4144093, 0.1367476, 0.4967901, 0, 0.01176471, 1, 1,
0.4148922, 0.8897861, 1.042913, 0, 0.003921569, 1, 1,
0.4223657, -0.0404423, 2.059291, 0.003921569, 0, 1, 1,
0.4341794, 0.8759763, -0.597403, 0.007843138, 0, 1, 1,
0.434533, -1.581235, 2.626859, 0.01568628, 0, 1, 1,
0.4367031, 0.8504494, 2.875722, 0.01960784, 0, 1, 1,
0.4383021, 0.07213973, 0.5288594, 0.02745098, 0, 1, 1,
0.4395854, -0.9181989, 1.841049, 0.03137255, 0, 1, 1,
0.4413463, -0.7956235, 2.675081, 0.03921569, 0, 1, 1,
0.4465019, 0.5782696, 1.00933, 0.04313726, 0, 1, 1,
0.4467734, 0.7967663, 0.01653045, 0.05098039, 0, 1, 1,
0.4474685, -0.3982632, 2.035926, 0.05490196, 0, 1, 1,
0.4583054, 1.38939, 1.446894, 0.0627451, 0, 1, 1,
0.459851, 0.2413562, -0.1044817, 0.06666667, 0, 1, 1,
0.4678242, -0.3951296, 2.027469, 0.07450981, 0, 1, 1,
0.4687833, -1.011737, 2.15155, 0.07843138, 0, 1, 1,
0.4737509, -0.3425351, 3.459492, 0.08627451, 0, 1, 1,
0.4770681, 1.292919, 0.8927727, 0.09019608, 0, 1, 1,
0.4771412, -1.268795, 3.138063, 0.09803922, 0, 1, 1,
0.4772057, -1.871459, 4.18885, 0.1058824, 0, 1, 1,
0.4785372, -0.8197294, 3.647546, 0.1098039, 0, 1, 1,
0.4801424, 0.3996731, 0.3253423, 0.1176471, 0, 1, 1,
0.4847264, -1.706785, 1.263202, 0.1215686, 0, 1, 1,
0.4942704, -0.08782726, 2.778418, 0.1294118, 0, 1, 1,
0.4950117, 2.242397, 0.6145709, 0.1333333, 0, 1, 1,
0.4961867, 1.318907, 1.259079, 0.1411765, 0, 1, 1,
0.498803, -1.066303, 1.694993, 0.145098, 0, 1, 1,
0.5054385, 0.2753937, 1.83161, 0.1529412, 0, 1, 1,
0.5212718, -2.666517, 5.322569, 0.1568628, 0, 1, 1,
0.5229952, -0.9234664, 4.210159, 0.1647059, 0, 1, 1,
0.5246544, 0.5272496, 0.7189478, 0.1686275, 0, 1, 1,
0.5284804, 1.896, 1.318491, 0.1764706, 0, 1, 1,
0.5352421, -0.07140247, -0.01034181, 0.1803922, 0, 1, 1,
0.5405895, 0.8136992, 0.7265153, 0.1882353, 0, 1, 1,
0.540775, -0.1676396, 2.692164, 0.1921569, 0, 1, 1,
0.5420551, -0.7649885, 0.980473, 0.2, 0, 1, 1,
0.5431303, 0.5311815, -0.01390538, 0.2078431, 0, 1, 1,
0.5434028, -0.2406437, 1.684382, 0.2117647, 0, 1, 1,
0.5454723, 1.6444, 0.1042249, 0.2196078, 0, 1, 1,
0.5505261, 1.350546, 0.4272538, 0.2235294, 0, 1, 1,
0.5518453, 2.352254, -1.308845, 0.2313726, 0, 1, 1,
0.5537437, 0.1452534, 1.515757, 0.2352941, 0, 1, 1,
0.554486, 1.793946, 3.279353, 0.2431373, 0, 1, 1,
0.5553588, 0.7187251, 0.2918636, 0.2470588, 0, 1, 1,
0.5561764, 0.7072119, 2.037428, 0.254902, 0, 1, 1,
0.561079, -0.7843938, 1.701229, 0.2588235, 0, 1, 1,
0.5629667, -0.2572581, 1.791313, 0.2666667, 0, 1, 1,
0.5637289, -0.1522993, 3.145056, 0.2705882, 0, 1, 1,
0.5691004, -0.4397124, 3.324633, 0.2784314, 0, 1, 1,
0.572531, -0.0923481, 2.730489, 0.282353, 0, 1, 1,
0.5725791, -0.6580887, 2.867795, 0.2901961, 0, 1, 1,
0.5731108, 0.3213264, 2.63223, 0.2941177, 0, 1, 1,
0.5827256, 0.8814448, 0.5667554, 0.3019608, 0, 1, 1,
0.5830278, 0.7501085, -0.278402, 0.3098039, 0, 1, 1,
0.5859729, -1.052709, 3.445662, 0.3137255, 0, 1, 1,
0.5876154, 1.636201, 0.09065475, 0.3215686, 0, 1, 1,
0.5881596, -0.1822343, 2.758624, 0.3254902, 0, 1, 1,
0.5919087, -1.214271, 1.190831, 0.3333333, 0, 1, 1,
0.5975981, -0.05954868, 1.36538, 0.3372549, 0, 1, 1,
0.5995589, -0.6459602, 2.777805, 0.345098, 0, 1, 1,
0.6022559, -0.5961319, 2.659497, 0.3490196, 0, 1, 1,
0.602684, -0.05017922, 0.8483233, 0.3568628, 0, 1, 1,
0.6050812, -0.4919646, 1.544766, 0.3607843, 0, 1, 1,
0.6064542, -1.482057, 0.03152486, 0.3686275, 0, 1, 1,
0.6105694, 1.302977, 1.189148, 0.372549, 0, 1, 1,
0.6174109, -0.4329599, 2.797469, 0.3803922, 0, 1, 1,
0.626338, -1.45421, 2.119662, 0.3843137, 0, 1, 1,
0.6264413, -0.2362108, 2.275548, 0.3921569, 0, 1, 1,
0.6336932, -0.5374386, 4.913724, 0.3960784, 0, 1, 1,
0.6363685, 0.5490419, 1.318489, 0.4039216, 0, 1, 1,
0.6386192, 0.3893293, 3.008236, 0.4117647, 0, 1, 1,
0.6388337, -1.259404, 2.753983, 0.4156863, 0, 1, 1,
0.6405141, -1.497294, 3.471749, 0.4235294, 0, 1, 1,
0.6420848, -0.1661756, 1.978954, 0.427451, 0, 1, 1,
0.6445782, 0.2487121, 0.9669015, 0.4352941, 0, 1, 1,
0.6496195, -0.09073781, 2.657197, 0.4392157, 0, 1, 1,
0.6506052, 1.301583, 0.2112324, 0.4470588, 0, 1, 1,
0.6557733, 0.869247, -0.1437671, 0.4509804, 0, 1, 1,
0.6575026, 0.8578631, 0.238371, 0.4588235, 0, 1, 1,
0.6617262, 0.4562604, -0.9760109, 0.4627451, 0, 1, 1,
0.6618316, -0.1712344, 0.9708996, 0.4705882, 0, 1, 1,
0.6633002, 0.639553, 0.8267024, 0.4745098, 0, 1, 1,
0.6648439, 0.2308559, 1.517612, 0.4823529, 0, 1, 1,
0.6655731, -1.320375, 1.400917, 0.4862745, 0, 1, 1,
0.6663797, 0.06685277, 1.783018, 0.4941176, 0, 1, 1,
0.6779109, -0.1129084, 0.7940479, 0.5019608, 0, 1, 1,
0.6820687, -0.6374998, 2.948182, 0.5058824, 0, 1, 1,
0.6821557, -1.479148, 4.607851, 0.5137255, 0, 1, 1,
0.6911552, -0.005923063, -0.6948442, 0.5176471, 0, 1, 1,
0.7002421, -0.8391702, 2.329379, 0.5254902, 0, 1, 1,
0.7060272, -1.760468, 3.400991, 0.5294118, 0, 1, 1,
0.7185287, 0.008909308, 0.1633934, 0.5372549, 0, 1, 1,
0.7224235, 0.07574732, -0.2416536, 0.5411765, 0, 1, 1,
0.7248372, -0.1860369, 1.672487, 0.5490196, 0, 1, 1,
0.7285451, 1.126982, 0.7520515, 0.5529412, 0, 1, 1,
0.7314833, -0.1080367, 0.01782808, 0.5607843, 0, 1, 1,
0.736008, -1.460598, 1.972377, 0.5647059, 0, 1, 1,
0.7368063, -0.02866369, 2.515311, 0.572549, 0, 1, 1,
0.7379609, -2.955315, 2.51864, 0.5764706, 0, 1, 1,
0.7402542, 0.6513364, 0.7685112, 0.5843138, 0, 1, 1,
0.7492145, 0.07071066, 2.201775, 0.5882353, 0, 1, 1,
0.7493678, 0.229845, 0.1162951, 0.5960785, 0, 1, 1,
0.7531058, 0.5545235, 0.2105529, 0.6039216, 0, 1, 1,
0.7534235, -0.4297768, 3.278377, 0.6078432, 0, 1, 1,
0.7566375, 3.31989, 0.03750064, 0.6156863, 0, 1, 1,
0.7587181, -0.7199457, 2.890878, 0.6196079, 0, 1, 1,
0.7642307, 1.412377, -0.1795881, 0.627451, 0, 1, 1,
0.7681863, 1.355183, 0.4461288, 0.6313726, 0, 1, 1,
0.7704814, -0.04041501, 1.971034, 0.6392157, 0, 1, 1,
0.7708237, -1.139315, 3.425172, 0.6431373, 0, 1, 1,
0.7800536, -0.7476354, 2.751182, 0.6509804, 0, 1, 1,
0.783823, -0.8172979, 1.387219, 0.654902, 0, 1, 1,
0.7850088, -0.3735862, 2.91639, 0.6627451, 0, 1, 1,
0.7866558, 1.171865, 0.2652082, 0.6666667, 0, 1, 1,
0.7868017, 0.3329469, 0.2462257, 0.6745098, 0, 1, 1,
0.790202, 0.6976723, 0.05041672, 0.6784314, 0, 1, 1,
0.7921019, 0.5874637, 0.262383, 0.6862745, 0, 1, 1,
0.7942369, 0.7589876, 2.360512, 0.6901961, 0, 1, 1,
0.797599, -1.957228, 3.425936, 0.6980392, 0, 1, 1,
0.8022628, -0.9696863, 1.559816, 0.7058824, 0, 1, 1,
0.8076938, 0.2858921, 1.856125, 0.7098039, 0, 1, 1,
0.8086957, -1.89866, 1.250846, 0.7176471, 0, 1, 1,
0.8175936, 1.369747, -0.006171268, 0.7215686, 0, 1, 1,
0.8271763, -0.6625341, 1.916957, 0.7294118, 0, 1, 1,
0.8287846, 0.9414487, 0.02250194, 0.7333333, 0, 1, 1,
0.8381612, -1.44065, 1.609037, 0.7411765, 0, 1, 1,
0.8431073, -0.5231755, 3.3271, 0.7450981, 0, 1, 1,
0.8536177, 2.089741, 0.5097717, 0.7529412, 0, 1, 1,
0.8570126, -0.9773782, 4.054546, 0.7568628, 0, 1, 1,
0.8597698, 0.78549, -0.02900044, 0.7647059, 0, 1, 1,
0.8607427, -1.643456, 2.063596, 0.7686275, 0, 1, 1,
0.8608519, -0.4542881, 2.486541, 0.7764706, 0, 1, 1,
0.8632433, -0.4121874, 2.85459, 0.7803922, 0, 1, 1,
0.8655588, -0.1878521, 1.64694, 0.7882353, 0, 1, 1,
0.8712854, 0.3773094, 0.7960078, 0.7921569, 0, 1, 1,
0.8752736, 0.3781057, 2.050383, 0.8, 0, 1, 1,
0.8796199, -0.665163, 2.465434, 0.8078431, 0, 1, 1,
0.8816962, 1.247862, 0.5689462, 0.8117647, 0, 1, 1,
0.8850359, -0.09358505, 0.6579002, 0.8196079, 0, 1, 1,
0.8927981, 1.930001, -0.1745687, 0.8235294, 0, 1, 1,
0.8930078, 0.1234477, 1.444979, 0.8313726, 0, 1, 1,
0.9024244, -0.1474267, -0.1831885, 0.8352941, 0, 1, 1,
0.9140454, 0.8090663, 0.9787676, 0.8431373, 0, 1, 1,
0.9184003, 0.2906253, 0.9231862, 0.8470588, 0, 1, 1,
0.9196494, 1.34516, 0.4126462, 0.854902, 0, 1, 1,
0.9197822, 0.730647, -0.6466609, 0.8588235, 0, 1, 1,
0.9249621, -1.07807, 2.634891, 0.8666667, 0, 1, 1,
0.9267843, 0.2513656, 1.522627, 0.8705882, 0, 1, 1,
0.9271515, -1.21183, 2.716247, 0.8784314, 0, 1, 1,
0.9284397, 0.03477291, 2.346945, 0.8823529, 0, 1, 1,
0.9303042, -0.2229812, 0.9124873, 0.8901961, 0, 1, 1,
0.9315373, -0.3234501, 1.697811, 0.8941177, 0, 1, 1,
0.934319, -0.1321331, 1.763642, 0.9019608, 0, 1, 1,
0.9346789, -0.8566641, 0.9478837, 0.9098039, 0, 1, 1,
0.9424946, -0.3505388, 2.410192, 0.9137255, 0, 1, 1,
0.9441723, -0.7078576, 2.038005, 0.9215686, 0, 1, 1,
0.9443808, 1.982892, 1.118704, 0.9254902, 0, 1, 1,
0.9481153, 0.01845028, 2.193033, 0.9333333, 0, 1, 1,
0.9543599, -0.4141935, 1.636761, 0.9372549, 0, 1, 1,
0.9560723, -0.3036016, 2.184593, 0.945098, 0, 1, 1,
0.9609081, 0.9472408, 1.504678, 0.9490196, 0, 1, 1,
0.9631504, -0.5639109, 2.650292, 0.9568627, 0, 1, 1,
0.9704039, -1.66196, 3.286306, 0.9607843, 0, 1, 1,
0.9758844, 0.6221962, -0.3128968, 0.9686275, 0, 1, 1,
0.9868479, 1.899827, -0.3424483, 0.972549, 0, 1, 1,
0.9872971, -0.9925511, 2.091081, 0.9803922, 0, 1, 1,
0.9892132, -0.651959, 2.288724, 0.9843137, 0, 1, 1,
0.9911726, -0.815447, 3.103152, 0.9921569, 0, 1, 1,
0.9919883, -0.0293443, 0.2768221, 0.9960784, 0, 1, 1,
0.9976851, 0.6201474, 1.906582, 1, 0, 0.9960784, 1,
0.999284, 0.4274822, 1.382442, 1, 0, 0.9882353, 1,
1.001597, 1.317351, 0.9117515, 1, 0, 0.9843137, 1,
1.001771, -0.3674954, 2.275957, 1, 0, 0.9764706, 1,
1.00459, -1.959728, 2.278198, 1, 0, 0.972549, 1,
1.006793, -0.8158958, 0.5907555, 1, 0, 0.9647059, 1,
1.007252, -0.4607253, 3.392117, 1, 0, 0.9607843, 1,
1.014488, 1.485253, 0.9589686, 1, 0, 0.9529412, 1,
1.01632, 0.6715709, 0.718443, 1, 0, 0.9490196, 1,
1.016496, -1.546626, 2.435091, 1, 0, 0.9411765, 1,
1.018084, 0.6653111, -0.3094985, 1, 0, 0.9372549, 1,
1.018831, 1.953324, 2.010206, 1, 0, 0.9294118, 1,
1.020547, -0.332734, 1.760357, 1, 0, 0.9254902, 1,
1.021273, -2.072834, 0.966047, 1, 0, 0.9176471, 1,
1.025336, 0.4221523, 0.884499, 1, 0, 0.9137255, 1,
1.025523, 0.1487812, 3.265023, 1, 0, 0.9058824, 1,
1.025655, 2.566965, 1.657572, 1, 0, 0.9019608, 1,
1.032952, 0.5874875, 3.320544, 1, 0, 0.8941177, 1,
1.03557, -0.6653615, 0.8947519, 1, 0, 0.8862745, 1,
1.04432, 0.3682492, 0.963052, 1, 0, 0.8823529, 1,
1.045433, 1.273507, 1.557041, 1, 0, 0.8745098, 1,
1.052839, -0.944247, 3.087416, 1, 0, 0.8705882, 1,
1.055595, -0.6453224, 1.489894, 1, 0, 0.8627451, 1,
1.056294, -1.434933, 3.790231, 1, 0, 0.8588235, 1,
1.058281, -1.722629, 3.895716, 1, 0, 0.8509804, 1,
1.062953, -1.154876, 3.746621, 1, 0, 0.8470588, 1,
1.064803, 0.8040202, -0.1707744, 1, 0, 0.8392157, 1,
1.065686, -0.3609511, 2.826363, 1, 0, 0.8352941, 1,
1.067729, -0.6657361, 2.068166, 1, 0, 0.827451, 1,
1.083806, 1.375397, 0.06850076, 1, 0, 0.8235294, 1,
1.086922, -0.7920422, 1.669171, 1, 0, 0.8156863, 1,
1.093519, 0.2599163, 3.005069, 1, 0, 0.8117647, 1,
1.10694, -0.5398884, 2.933677, 1, 0, 0.8039216, 1,
1.118598, -0.4179123, 0.6185803, 1, 0, 0.7960784, 1,
1.119786, 0.04804119, 1.323183, 1, 0, 0.7921569, 1,
1.120829, 0.4923234, 1.81622, 1, 0, 0.7843137, 1,
1.121064, 0.4520195, 0.4712519, 1, 0, 0.7803922, 1,
1.127523, -0.4524042, 2.696921, 1, 0, 0.772549, 1,
1.128936, 1.692403, 1.497012, 1, 0, 0.7686275, 1,
1.139076, -0.05198922, 0.6913942, 1, 0, 0.7607843, 1,
1.147139, 0.1535311, 0.2809555, 1, 0, 0.7568628, 1,
1.149391, -1.382513, 4.926699, 1, 0, 0.7490196, 1,
1.151105, -1.248596, 0.3753718, 1, 0, 0.7450981, 1,
1.153363, 0.5243599, 2.936791, 1, 0, 0.7372549, 1,
1.156419, 1.664746, -0.4234113, 1, 0, 0.7333333, 1,
1.173394, -0.005964758, 1.731462, 1, 0, 0.7254902, 1,
1.17769, 1.267874, 0.7017029, 1, 0, 0.7215686, 1,
1.189271, -0.5721148, 3.38025, 1, 0, 0.7137255, 1,
1.196172, -1.178431, 1.987941, 1, 0, 0.7098039, 1,
1.198348, 1.398287, 0.888851, 1, 0, 0.7019608, 1,
1.198878, -0.6480631, 2.880062, 1, 0, 0.6941177, 1,
1.204496, 1.744281, 0.4311648, 1, 0, 0.6901961, 1,
1.205726, 0.6271563, -0.6455179, 1, 0, 0.682353, 1,
1.209063, 0.9397796, 0.6448188, 1, 0, 0.6784314, 1,
1.220069, -0.1523885, 1.716092, 1, 0, 0.6705883, 1,
1.226799, -1.467949, 2.29481, 1, 0, 0.6666667, 1,
1.230358, -0.2107861, 1.259352, 1, 0, 0.6588235, 1,
1.230642, 0.01731917, 0.8042144, 1, 0, 0.654902, 1,
1.23582, 0.6380396, 2.595609, 1, 0, 0.6470588, 1,
1.2393, -0.7943743, 2.89779, 1, 0, 0.6431373, 1,
1.244481, 0.09646446, 2.108965, 1, 0, 0.6352941, 1,
1.245997, 1.185149, -0.2168926, 1, 0, 0.6313726, 1,
1.256291, 1.180315, 1.691639, 1, 0, 0.6235294, 1,
1.262179, -0.0958793, 0.694063, 1, 0, 0.6196079, 1,
1.264954, 0.2857088, 1.168907, 1, 0, 0.6117647, 1,
1.265267, 0.1157078, 2.793981, 1, 0, 0.6078432, 1,
1.265483, -1.355838, 1.454815, 1, 0, 0.6, 1,
1.275175, -0.2301806, 2.037178, 1, 0, 0.5921569, 1,
1.307672, 0.8815563, 2.321064, 1, 0, 0.5882353, 1,
1.309496, -0.2546629, 2.802465, 1, 0, 0.5803922, 1,
1.310103, 0.3852453, 1.053169, 1, 0, 0.5764706, 1,
1.310508, -0.2409865, 2.864794, 1, 0, 0.5686275, 1,
1.311698, 2.094534, 0.4565099, 1, 0, 0.5647059, 1,
1.318525, 0.4550339, 0.5888071, 1, 0, 0.5568628, 1,
1.325596, 0.5193324, 0.5535498, 1, 0, 0.5529412, 1,
1.329042, 0.629176, -0.834957, 1, 0, 0.5450981, 1,
1.331986, -0.6100622, 2.62238, 1, 0, 0.5411765, 1,
1.342764, -0.1265278, 0.3309323, 1, 0, 0.5333334, 1,
1.345003, 0.08418811, 0.6316887, 1, 0, 0.5294118, 1,
1.349096, -1.743378, 0.8047593, 1, 0, 0.5215687, 1,
1.369195, -0.834983, 2.195936, 1, 0, 0.5176471, 1,
1.377351, -1.177209, 2.212066, 1, 0, 0.509804, 1,
1.378243, -0.1596896, 1.097971, 1, 0, 0.5058824, 1,
1.384839, 0.5711698, 2.485579, 1, 0, 0.4980392, 1,
1.390659, 0.2298721, 1.261809, 1, 0, 0.4901961, 1,
1.398045, 0.09862502, 1.782026, 1, 0, 0.4862745, 1,
1.400854, -0.7199274, 1.842578, 1, 0, 0.4784314, 1,
1.400954, -1.460949, 2.200193, 1, 0, 0.4745098, 1,
1.402393, 1.188287, 1.671097, 1, 0, 0.4666667, 1,
1.407505, 0.09942388, 1.528012, 1, 0, 0.4627451, 1,
1.413088, 0.4680338, 0.2465268, 1, 0, 0.454902, 1,
1.416635, 1.323384, -0.3454861, 1, 0, 0.4509804, 1,
1.466715, -1.145838, 4.008514, 1, 0, 0.4431373, 1,
1.467469, 1.975248, 0.5988593, 1, 0, 0.4392157, 1,
1.477233, -0.274232, 1.717598, 1, 0, 0.4313726, 1,
1.478926, -0.07306413, 0.6233706, 1, 0, 0.427451, 1,
1.485548, 1.058819, 0.7858957, 1, 0, 0.4196078, 1,
1.490965, 0.03665917, 1.116014, 1, 0, 0.4156863, 1,
1.503553, 1.458168, 1.35852, 1, 0, 0.4078431, 1,
1.514387, 0.1806435, -0.3242315, 1, 0, 0.4039216, 1,
1.515363, -2.012569, 2.973519, 1, 0, 0.3960784, 1,
1.535917, 1.465613, 1.467072, 1, 0, 0.3882353, 1,
1.550336, -0.7533199, 1.989218, 1, 0, 0.3843137, 1,
1.551887, -0.5817874, 1.884613, 1, 0, 0.3764706, 1,
1.556964, 0.1828114, 2.314634, 1, 0, 0.372549, 1,
1.561073, 1.212743, -0.6120856, 1, 0, 0.3647059, 1,
1.564747, -0.2666097, 3.236401, 1, 0, 0.3607843, 1,
1.571341, 0.947236, 1.117281, 1, 0, 0.3529412, 1,
1.577037, -0.5777522, 1.156731, 1, 0, 0.3490196, 1,
1.596532, -0.4828683, 3.347049, 1, 0, 0.3411765, 1,
1.611973, -0.6849273, 2.870742, 1, 0, 0.3372549, 1,
1.618717, -0.4589106, 2.931222, 1, 0, 0.3294118, 1,
1.639397, 0.660543, 0.4136303, 1, 0, 0.3254902, 1,
1.654239, 0.6837579, 1.122898, 1, 0, 0.3176471, 1,
1.695391, -0.5741372, 2.825707, 1, 0, 0.3137255, 1,
1.711903, -0.5378467, 1.653644, 1, 0, 0.3058824, 1,
1.721807, 0.9222243, 1.03855, 1, 0, 0.2980392, 1,
1.722499, -0.4675565, 1.266269, 1, 0, 0.2941177, 1,
1.725436, 0.5767151, 1.05804, 1, 0, 0.2862745, 1,
1.731581, -1.328234, 2.41501, 1, 0, 0.282353, 1,
1.736439, 0.03673309, 0.3556887, 1, 0, 0.2745098, 1,
1.739769, 0.2031754, 0.9041636, 1, 0, 0.2705882, 1,
1.753255, 0.6556419, 0.538445, 1, 0, 0.2627451, 1,
1.762935, 0.4914839, 1.230769, 1, 0, 0.2588235, 1,
1.782777, -1.32192, 3.3197, 1, 0, 0.2509804, 1,
1.790358, -0.3445572, 4.508417, 1, 0, 0.2470588, 1,
1.799905, 0.5539261, 1.334064, 1, 0, 0.2392157, 1,
1.822775, -0.5087411, 2.508273, 1, 0, 0.2352941, 1,
1.831794, -1.900612, 1.923669, 1, 0, 0.227451, 1,
1.838043, 0.3531544, 1.025889, 1, 0, 0.2235294, 1,
1.852102, -1.708097, 2.398883, 1, 0, 0.2156863, 1,
1.853282, 0.7079234, 2.431819, 1, 0, 0.2117647, 1,
1.864579, -0.04855216, 0.8784128, 1, 0, 0.2039216, 1,
1.865276, 0.3295402, 1.392733, 1, 0, 0.1960784, 1,
1.88178, -1.279302, 0.8668025, 1, 0, 0.1921569, 1,
1.897891, -1.008243, 2.151506, 1, 0, 0.1843137, 1,
1.918306, 1.303811, 0.6629105, 1, 0, 0.1803922, 1,
1.935392, -1.179516, 2.39042, 1, 0, 0.172549, 1,
1.937755, -0.7587987, 2.83065, 1, 0, 0.1686275, 1,
1.960078, 3.191377, -0.1383786, 1, 0, 0.1607843, 1,
1.98262, -0.7777291, 1.357066, 1, 0, 0.1568628, 1,
1.990039, 2.155416, 1.268389, 1, 0, 0.1490196, 1,
2.007151, -0.5907438, -0.1826985, 1, 0, 0.145098, 1,
2.019289, 0.09819196, 2.306113, 1, 0, 0.1372549, 1,
2.0288, -0.3314419, 1.960377, 1, 0, 0.1333333, 1,
2.080935, -1.246263, 0.5653135, 1, 0, 0.1254902, 1,
2.089663, 1.115883, 1.763783, 1, 0, 0.1215686, 1,
2.090597, -0.2498629, 1.809673, 1, 0, 0.1137255, 1,
2.095584, -0.1504627, 0.5734612, 1, 0, 0.1098039, 1,
2.101995, 0.07869391, 0.6568326, 1, 0, 0.1019608, 1,
2.115364, -1.186013, 0.4591724, 1, 0, 0.09411765, 1,
2.127414, -0.4856328, 1.874761, 1, 0, 0.09019608, 1,
2.129792, 0.9129251, 3.036069, 1, 0, 0.08235294, 1,
2.178256, 0.00989907, 2.285419, 1, 0, 0.07843138, 1,
2.222342, -0.2009953, 2.043945, 1, 0, 0.07058824, 1,
2.290552, -0.3696528, 0.3062107, 1, 0, 0.06666667, 1,
2.302874, 1.64394, 0.2819442, 1, 0, 0.05882353, 1,
2.303634, -1.797754, 0.8630875, 1, 0, 0.05490196, 1,
2.367188, 1.095082, 0.3635799, 1, 0, 0.04705882, 1,
2.377632, -0.4219719, 2.085158, 1, 0, 0.04313726, 1,
2.450821, 0.3657858, 1.157668, 1, 0, 0.03529412, 1,
2.490149, 0.03212528, 2.817462, 1, 0, 0.03137255, 1,
2.664818, -0.6990089, 0.5637819, 1, 0, 0.02352941, 1,
2.692273, 0.9515764, 0.1418011, 1, 0, 0.01960784, 1,
2.767411, -0.6686828, 2.525451, 1, 0, 0.01176471, 1,
3.120585, -1.122689, 2.016014, 1, 0, 0.007843138, 1
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
-0.05628669, -4.021616, -7.017404, 0, -0.5, 0.5, 0.5,
-0.05628669, -4.021616, -7.017404, 1, -0.5, 0.5, 0.5,
-0.05628669, -4.021616, -7.017404, 1, 1.5, 0.5, 0.5,
-0.05628669, -4.021616, -7.017404, 0, 1.5, 0.5, 0.5
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
-4.310118, 0.1901152, -7.017404, 0, -0.5, 0.5, 0.5,
-4.310118, 0.1901152, -7.017404, 1, -0.5, 0.5, 0.5,
-4.310118, 0.1901152, -7.017404, 1, 1.5, 0.5, 0.5,
-4.310118, 0.1901152, -7.017404, 0, 1.5, 0.5, 0.5
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
-4.310118, -4.021616, 0.06144261, 0, -0.5, 0.5, 0.5,
-4.310118, -4.021616, 0.06144261, 1, -0.5, 0.5, 0.5,
-4.310118, -4.021616, 0.06144261, 1, 1.5, 0.5, 0.5,
-4.310118, -4.021616, 0.06144261, 0, 1.5, 0.5, 0.5
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
-3, -3.049678, -5.383823,
3, -3.049678, -5.383823,
-3, -3.049678, -5.383823,
-3, -3.211667, -5.656087,
-2, -3.049678, -5.383823,
-2, -3.211667, -5.656087,
-1, -3.049678, -5.383823,
-1, -3.211667, -5.656087,
0, -3.049678, -5.383823,
0, -3.211667, -5.656087,
1, -3.049678, -5.383823,
1, -3.211667, -5.656087,
2, -3.049678, -5.383823,
2, -3.211667, -5.656087,
3, -3.049678, -5.383823,
3, -3.211667, -5.656087
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
-3, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
-3, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
-3, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
-3, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
-2, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
-2, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
-2, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
-2, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
-1, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
-1, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
-1, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
-1, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
0, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
0, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
0, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
0, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
1, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
1, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
1, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
1, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
2, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
2, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
2, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
2, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5,
3, -3.535646, -6.200613, 0, -0.5, 0.5, 0.5,
3, -3.535646, -6.200613, 1, -0.5, 0.5, 0.5,
3, -3.535646, -6.200613, 1, 1.5, 0.5, 0.5,
3, -3.535646, -6.200613, 0, 1.5, 0.5, 0.5
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
-3.328464, -2, -5.383823,
-3.328464, 3, -5.383823,
-3.328464, -2, -5.383823,
-3.492073, -2, -5.656087,
-3.328464, -1, -5.383823,
-3.492073, -1, -5.656087,
-3.328464, 0, -5.383823,
-3.492073, 0, -5.656087,
-3.328464, 1, -5.383823,
-3.492073, 1, -5.656087,
-3.328464, 2, -5.383823,
-3.492073, 2, -5.656087,
-3.328464, 3, -5.383823,
-3.492073, 3, -5.656087
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
-3.819291, -2, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, -2, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, -2, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, -2, -6.200613, 0, 1.5, 0.5, 0.5,
-3.819291, -1, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, -1, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, -1, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, -1, -6.200613, 0, 1.5, 0.5, 0.5,
-3.819291, 0, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, 0, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, 0, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, 0, -6.200613, 0, 1.5, 0.5, 0.5,
-3.819291, 1, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, 1, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, 1, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, 1, -6.200613, 0, 1.5, 0.5, 0.5,
-3.819291, 2, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, 2, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, 2, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, 2, -6.200613, 0, 1.5, 0.5, 0.5,
-3.819291, 3, -6.200613, 0, -0.5, 0.5, 0.5,
-3.819291, 3, -6.200613, 1, -0.5, 0.5, 0.5,
-3.819291, 3, -6.200613, 1, 1.5, 0.5, 0.5,
-3.819291, 3, -6.200613, 0, 1.5, 0.5, 0.5
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
-3.328464, -3.049678, -4,
-3.328464, -3.049678, 4,
-3.328464, -3.049678, -4,
-3.492073, -3.211667, -4,
-3.328464, -3.049678, -2,
-3.492073, -3.211667, -2,
-3.328464, -3.049678, 0,
-3.492073, -3.211667, 0,
-3.328464, -3.049678, 2,
-3.492073, -3.211667, 2,
-3.328464, -3.049678, 4,
-3.492073, -3.211667, 4
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
-3.819291, -3.535646, -4, 0, -0.5, 0.5, 0.5,
-3.819291, -3.535646, -4, 1, -0.5, 0.5, 0.5,
-3.819291, -3.535646, -4, 1, 1.5, 0.5, 0.5,
-3.819291, -3.535646, -4, 0, 1.5, 0.5, 0.5,
-3.819291, -3.535646, -2, 0, -0.5, 0.5, 0.5,
-3.819291, -3.535646, -2, 1, -0.5, 0.5, 0.5,
-3.819291, -3.535646, -2, 1, 1.5, 0.5, 0.5,
-3.819291, -3.535646, -2, 0, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 0, 0, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 0, 1, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 0, 1, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 0, 0, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 2, 0, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 2, 1, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 2, 1, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 2, 0, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 4, 0, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 4, 1, -0.5, 0.5, 0.5,
-3.819291, -3.535646, 4, 1, 1.5, 0.5, 0.5,
-3.819291, -3.535646, 4, 0, 1.5, 0.5, 0.5
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
-3.328464, -3.049678, -5.383823,
-3.328464, 3.429908, -5.383823,
-3.328464, -3.049678, 5.506709,
-3.328464, 3.429908, 5.506709,
-3.328464, -3.049678, -5.383823,
-3.328464, -3.049678, 5.506709,
-3.328464, 3.429908, -5.383823,
-3.328464, 3.429908, 5.506709,
-3.328464, -3.049678, -5.383823,
3.215891, -3.049678, -5.383823,
-3.328464, -3.049678, 5.506709,
3.215891, -3.049678, 5.506709,
-3.328464, 3.429908, -5.383823,
3.215891, 3.429908, -5.383823,
-3.328464, 3.429908, 5.506709,
3.215891, 3.429908, 5.506709,
3.215891, -3.049678, -5.383823,
3.215891, 3.429908, -5.383823,
3.215891, -3.049678, 5.506709,
3.215891, 3.429908, 5.506709,
3.215891, -3.049678, -5.383823,
3.215891, -3.049678, 5.506709,
3.215891, 3.429908, -5.383823,
3.215891, 3.429908, 5.506709
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
var radius = 7.615868;
var distance = 33.88385;
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
mvMatrix.translate( 0.05628669, -0.1901152, -0.06144261 );
mvMatrix.scale( 1.258249, 1.270826, 0.7561086 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.88385);
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
cartap_hydrochloride<-read.table("cartap_hydrochloride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cartap_hydrochloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'cartap_hydrochloride' not found
```

```r
y<-cartap_hydrochloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'cartap_hydrochloride' not found
```

```r
z<-cartap_hydrochloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'cartap_hydrochloride' not found
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
-3.233158, -0.5166938, -2.227277, 0, 0, 1, 1, 1,
-3.117482, 0.1868113, -2.209587, 1, 0, 0, 1, 1,
-3.036371, -0.5040531, -0.7947221, 1, 0, 0, 1, 1,
-3.019222, -0.7894135, -0.4655836, 1, 0, 0, 1, 1,
-2.978379, -0.7034289, -2.72562, 1, 0, 0, 1, 1,
-2.72853, -0.2699095, -1.028778, 1, 0, 0, 1, 1,
-2.688533, -1.235129, -0.7657223, 0, 0, 0, 1, 1,
-2.640133, -0.3953722, -1.119756, 0, 0, 0, 1, 1,
-2.553629, 1.805108, -0.110227, 0, 0, 0, 1, 1,
-2.545827, -0.808817, -1.698745, 0, 0, 0, 1, 1,
-2.399146, 0.5043139, -1.341081, 0, 0, 0, 1, 1,
-2.385387, -0.6821432, -2.153269, 0, 0, 0, 1, 1,
-2.350781, 1.27892, -0.9261897, 0, 0, 0, 1, 1,
-2.332403, 0.9853685, -1.192706, 1, 1, 1, 1, 1,
-2.32594, -0.4390884, -0.6336975, 1, 1, 1, 1, 1,
-2.249259, -0.8230944, -2.466636, 1, 1, 1, 1, 1,
-2.248583, -0.3096261, -3.307716, 1, 1, 1, 1, 1,
-2.136466, 1.700643, -1.415965, 1, 1, 1, 1, 1,
-2.096511, -0.4139405, -2.094389, 1, 1, 1, 1, 1,
-2.095329, -2.010202, -3.362039, 1, 1, 1, 1, 1,
-2.069152, 1.081359, -2.546659, 1, 1, 1, 1, 1,
-2.062361, 1.976785, -0.7697801, 1, 1, 1, 1, 1,
-2.043239, -0.1734901, -3.01847, 1, 1, 1, 1, 1,
-2.021175, 0.4580131, -0.6991532, 1, 1, 1, 1, 1,
-1.989236, -0.698435, -0.7025433, 1, 1, 1, 1, 1,
-1.976906, 0.2294966, -0.7760024, 1, 1, 1, 1, 1,
-1.965669, 2.874099, -0.1722375, 1, 1, 1, 1, 1,
-1.959824, -0.4294277, -3.222568, 1, 1, 1, 1, 1,
-1.954348, -0.8530639, -1.40628, 0, 0, 1, 1, 1,
-1.93659, -0.4254013, -2.879443, 1, 0, 0, 1, 1,
-1.889897, 1.84517, -0.5596184, 1, 0, 0, 1, 1,
-1.886858, -0.06986099, -1.897536, 1, 0, 0, 1, 1,
-1.877933, -0.325508, -0.2705675, 1, 0, 0, 1, 1,
-1.873466, -0.2107694, -1.518912, 1, 0, 0, 1, 1,
-1.857761, 0.4468814, -0.9499766, 0, 0, 0, 1, 1,
-1.835375, -0.4321999, -2.092303, 0, 0, 0, 1, 1,
-1.829936, 0.3511579, -1.692271, 0, 0, 0, 1, 1,
-1.812547, -0.0939083, -1.32797, 0, 0, 0, 1, 1,
-1.81075, 0.04069528, -1.669691, 0, 0, 0, 1, 1,
-1.801516, 0.652028, -0.8066936, 0, 0, 0, 1, 1,
-1.783677, 0.7183614, -2.352839, 0, 0, 0, 1, 1,
-1.777963, 1.451382, 0.78815, 1, 1, 1, 1, 1,
-1.758943, -0.8517768, -0.5226996, 1, 1, 1, 1, 1,
-1.758607, -0.2965563, -1.062494, 1, 1, 1, 1, 1,
-1.751676, 0.3684271, -1.199701, 1, 1, 1, 1, 1,
-1.729686, 1.668168, -0.4495673, 1, 1, 1, 1, 1,
-1.723133, -0.01651854, -3.076503, 1, 1, 1, 1, 1,
-1.716818, -0.1534148, -0.758979, 1, 1, 1, 1, 1,
-1.707332, -0.01368453, -2.191801, 1, 1, 1, 1, 1,
-1.706868, 2.351744, -2.625233, 1, 1, 1, 1, 1,
-1.673745, -1.363247, -1.684624, 1, 1, 1, 1, 1,
-1.670909, -1.525106, -0.5212068, 1, 1, 1, 1, 1,
-1.664051, 0.1779837, -0.6790444, 1, 1, 1, 1, 1,
-1.65481, 0.4714566, -0.6425813, 1, 1, 1, 1, 1,
-1.654097, 0.1315282, -1.198473, 1, 1, 1, 1, 1,
-1.612037, 0.7145125, -2.082858, 1, 1, 1, 1, 1,
-1.611199, -0.006667627, -2.149998, 0, 0, 1, 1, 1,
-1.590338, 1.633741, -0.8947821, 1, 0, 0, 1, 1,
-1.570213, 0.1720827, -1.195434, 1, 0, 0, 1, 1,
-1.561609, 0.704432, -1.961036, 1, 0, 0, 1, 1,
-1.561196, 2.8338, -0.2978209, 1, 0, 0, 1, 1,
-1.560446, -0.1955046, -1.895427, 1, 0, 0, 1, 1,
-1.551888, 1.378636, 0.1888119, 0, 0, 0, 1, 1,
-1.546466, -0.3569063, -0.9583364, 0, 0, 0, 1, 1,
-1.534461, 1.207845, -1.168825, 0, 0, 0, 1, 1,
-1.529993, 0.8843967, 0.6273754, 0, 0, 0, 1, 1,
-1.524505, 0.8765155, -2.401421, 0, 0, 0, 1, 1,
-1.524477, -0.01675879, -2.421923, 0, 0, 0, 1, 1,
-1.520972, -0.6005702, -2.8893, 0, 0, 0, 1, 1,
-1.516502, -0.9589111, -1.944041, 1, 1, 1, 1, 1,
-1.509514, 0.9613023, -0.8083045, 1, 1, 1, 1, 1,
-1.506643, 1.688763, -1.310759, 1, 1, 1, 1, 1,
-1.505122, -0.4133231, -1.509032, 1, 1, 1, 1, 1,
-1.50337, 1.511526, 0.2666402, 1, 1, 1, 1, 1,
-1.502866, 0.1098865, -2.322755, 1, 1, 1, 1, 1,
-1.495402, 0.5634576, -1.968004, 1, 1, 1, 1, 1,
-1.479186, -0.4526702, -2.93528, 1, 1, 1, 1, 1,
-1.468414, 0.01828528, -1.887335, 1, 1, 1, 1, 1,
-1.46014, 0.1946912, -0.9256938, 1, 1, 1, 1, 1,
-1.447297, 0.251843, -1.293367, 1, 1, 1, 1, 1,
-1.429145, -1.532, -1.2172, 1, 1, 1, 1, 1,
-1.423874, 1.76647, -1.124221, 1, 1, 1, 1, 1,
-1.416589, 0.4912021, -0.8873822, 1, 1, 1, 1, 1,
-1.41122, 0.3716835, -1.862106, 1, 1, 1, 1, 1,
-1.410715, 0.8545442, -1.09808, 0, 0, 1, 1, 1,
-1.409005, 0.9574764, -1.529365, 1, 0, 0, 1, 1,
-1.392564, 1.230543, -1.609232, 1, 0, 0, 1, 1,
-1.390891, 0.09466045, -1.266294, 1, 0, 0, 1, 1,
-1.383898, 1.295876, -0.7163084, 1, 0, 0, 1, 1,
-1.377167, -1.081467, -2.824516, 1, 0, 0, 1, 1,
-1.372561, -0.07630783, -0.6762652, 0, 0, 0, 1, 1,
-1.363146, 0.1842549, -3.125248, 0, 0, 0, 1, 1,
-1.360523, 1.893315, -0.5261644, 0, 0, 0, 1, 1,
-1.360506, -0.5474815, 0.3240407, 0, 0, 0, 1, 1,
-1.357242, -0.006720003, -2.590106, 0, 0, 0, 1, 1,
-1.340935, -0.1138806, -2.446845, 0, 0, 0, 1, 1,
-1.3405, 0.6151924, 1.569778, 0, 0, 0, 1, 1,
-1.339883, 0.05625698, -4.581021, 1, 1, 1, 1, 1,
-1.339189, -0.372998, -0.4294374, 1, 1, 1, 1, 1,
-1.336555, -1.055007, -2.711142, 1, 1, 1, 1, 1,
-1.332981, -0.3391061, -1.360668, 1, 1, 1, 1, 1,
-1.332341, 1.058941, -1.949055, 1, 1, 1, 1, 1,
-1.326524, -0.3781137, -0.8545503, 1, 1, 1, 1, 1,
-1.322284, 0.2068558, 0.2116562, 1, 1, 1, 1, 1,
-1.316388, -1.420768, -2.437874, 1, 1, 1, 1, 1,
-1.315851, -0.5585042, -2.270652, 1, 1, 1, 1, 1,
-1.310706, -0.2743112, -2.259835, 1, 1, 1, 1, 1,
-1.296115, -1.889182, -3.264522, 1, 1, 1, 1, 1,
-1.295324, -1.312749, -2.566323, 1, 1, 1, 1, 1,
-1.290791, -1.185175, -2.843452, 1, 1, 1, 1, 1,
-1.276482, 0.9810076, -0.3189062, 1, 1, 1, 1, 1,
-1.27629, 0.2330876, -2.923477, 1, 1, 1, 1, 1,
-1.26954, 1.398552, -0.08482283, 0, 0, 1, 1, 1,
-1.268073, 0.7262889, 0.9564535, 1, 0, 0, 1, 1,
-1.264678, -0.6905417, -2.261318, 1, 0, 0, 1, 1,
-1.262772, -0.02737111, -1.483739, 1, 0, 0, 1, 1,
-1.260989, 0.1733904, -3.682629, 1, 0, 0, 1, 1,
-1.258415, 0.4573993, -2.430375, 1, 0, 0, 1, 1,
-1.257881, -1.071208, -3.511791, 0, 0, 0, 1, 1,
-1.246867, 0.5555356, -1.578298, 0, 0, 0, 1, 1,
-1.246163, 1.148139, -0.9840276, 0, 0, 0, 1, 1,
-1.230273, 1.600594, -2.819093, 0, 0, 0, 1, 1,
-1.227627, -0.3370728, -1.513204, 0, 0, 0, 1, 1,
-1.212975, -0.2235815, -0.08819098, 0, 0, 0, 1, 1,
-1.212882, -0.4666875, -1.479092, 0, 0, 0, 1, 1,
-1.209759, -0.9094504, -2.837456, 1, 1, 1, 1, 1,
-1.201511, -0.2670822, -1.342324, 1, 1, 1, 1, 1,
-1.193034, -1.637839, -1.494504, 1, 1, 1, 1, 1,
-1.192856, 0.5555756, -1.869458, 1, 1, 1, 1, 1,
-1.189202, 0.6181681, -1.931187, 1, 1, 1, 1, 1,
-1.171701, 0.371654, -1.301284, 1, 1, 1, 1, 1,
-1.169252, 0.8815548, -0.4529715, 1, 1, 1, 1, 1,
-1.166099, -1.842122, -1.390281, 1, 1, 1, 1, 1,
-1.164331, -1.040995, -3.004066, 1, 1, 1, 1, 1,
-1.163125, 0.7739353, -2.111357, 1, 1, 1, 1, 1,
-1.153245, 1.306898, -1.824891, 1, 1, 1, 1, 1,
-1.15151, 1.017276, 0.6761121, 1, 1, 1, 1, 1,
-1.143934, -0.550249, 0.1515992, 1, 1, 1, 1, 1,
-1.138479, -0.5765921, -3.355499, 1, 1, 1, 1, 1,
-1.129644, -0.8929868, -1.632746, 1, 1, 1, 1, 1,
-1.129636, -0.7728139, -1.59217, 0, 0, 1, 1, 1,
-1.128555, 1.097937, -1.458743, 1, 0, 0, 1, 1,
-1.126143, 0.7555866, -0.9430397, 1, 0, 0, 1, 1,
-1.122762, 0.3543578, -2.515545, 1, 0, 0, 1, 1,
-1.117723, -0.8118838, -2.244652, 1, 0, 0, 1, 1,
-1.117059, -0.9958463, -1.732499, 1, 0, 0, 1, 1,
-1.110512, -0.9929168, -1.319796, 0, 0, 0, 1, 1,
-1.104007, -0.9459023, -2.157681, 0, 0, 0, 1, 1,
-1.102753, -0.1191302, -0.2868965, 0, 0, 0, 1, 1,
-1.091131, 1.266179, -2.820024, 0, 0, 0, 1, 1,
-1.08298, 1.768021, -0.09583878, 0, 0, 0, 1, 1,
-1.079576, 0.7694113, -1.911116, 0, 0, 0, 1, 1,
-1.078255, -1.846483, -3.403022, 0, 0, 0, 1, 1,
-1.076053, 0.03402472, -2.936892, 1, 1, 1, 1, 1,
-1.071118, -1.172701, -2.307992, 1, 1, 1, 1, 1,
-1.066571, 1.22877, 1.531547, 1, 1, 1, 1, 1,
-1.063655, -1.471092, -1.516283, 1, 1, 1, 1, 1,
-1.058844, 0.6414979, -0.03047288, 1, 1, 1, 1, 1,
-1.056915, -0.8124104, -1.732369, 1, 1, 1, 1, 1,
-1.056455, -0.2842369, -1.546077, 1, 1, 1, 1, 1,
-1.056272, 1.262023, -3.444863, 1, 1, 1, 1, 1,
-1.055123, -0.1129986, -2.684907, 1, 1, 1, 1, 1,
-1.054961, -0.1949651, -1.603044, 1, 1, 1, 1, 1,
-1.051751, 3.056563, -0.2420247, 1, 1, 1, 1, 1,
-1.049317, 0.2511527, -1.300741, 1, 1, 1, 1, 1,
-1.046969, -0.9548678, -2.250049, 1, 1, 1, 1, 1,
-1.046334, -0.1472735, -1.669012, 1, 1, 1, 1, 1,
-1.04612, 1.204057, -0.3449267, 1, 1, 1, 1, 1,
-1.0439, 2.303868, 1.19766, 0, 0, 1, 1, 1,
-1.035084, 1.009405, 1.117692, 1, 0, 0, 1, 1,
-1.030924, -0.7085485, -2.752578, 1, 0, 0, 1, 1,
-1.023435, 0.1315549, -3.100996, 1, 0, 0, 1, 1,
-1.023383, 2.239155, -2.236865, 1, 0, 0, 1, 1,
-1.02281, -0.2917701, -1.831263, 1, 0, 0, 1, 1,
-1.01338, -0.06402758, -2.579135, 0, 0, 0, 1, 1,
-1.006792, -1.623545, -0.5994638, 0, 0, 0, 1, 1,
-1.002837, -0.5000234, -0.6740426, 0, 0, 0, 1, 1,
-0.9932666, -0.0863508, -0.557492, 0, 0, 0, 1, 1,
-0.9901377, -0.5006849, -3.610527, 0, 0, 0, 1, 1,
-0.9793236, -0.6622199, -3.67222, 0, 0, 0, 1, 1,
-0.9791502, -0.8313884, -4.048962, 0, 0, 0, 1, 1,
-0.9783828, -0.1774458, -1.75714, 1, 1, 1, 1, 1,
-0.9719321, -1.633731, -0.9993109, 1, 1, 1, 1, 1,
-0.9698031, -0.6988474, -2.019615, 1, 1, 1, 1, 1,
-0.9553115, -0.2094557, -0.5827888, 1, 1, 1, 1, 1,
-0.9494213, -0.04624194, -1.574125, 1, 1, 1, 1, 1,
-0.9407788, 0.3794778, -2.51462, 1, 1, 1, 1, 1,
-0.9385747, 0.589218, -1.507433, 1, 1, 1, 1, 1,
-0.9351103, -0.09477436, -2.96958, 1, 1, 1, 1, 1,
-0.9171554, 0.5557807, -0.1260612, 1, 1, 1, 1, 1,
-0.9108778, -0.2576774, 0.8900635, 1, 1, 1, 1, 1,
-0.9014036, -1.382931, -3.110274, 1, 1, 1, 1, 1,
-0.8942173, -1.589519, -3.64414, 1, 1, 1, 1, 1,
-0.8939134, -0.2542802, -2.134793, 1, 1, 1, 1, 1,
-0.8937485, -0.58762, -2.7275, 1, 1, 1, 1, 1,
-0.8916886, 1.146698, -0.6068748, 1, 1, 1, 1, 1,
-0.8906147, -0.5543088, -3.54484, 0, 0, 1, 1, 1,
-0.8902017, -0.455039, -1.104277, 1, 0, 0, 1, 1,
-0.8850253, -0.05779276, -1.537951, 1, 0, 0, 1, 1,
-0.884112, -0.3322949, -2.576736, 1, 0, 0, 1, 1,
-0.8838084, 1.057686, -1.091878, 1, 0, 0, 1, 1,
-0.883082, -0.3983479, -1.414459, 1, 0, 0, 1, 1,
-0.8723857, -1.252529, -2.844684, 0, 0, 0, 1, 1,
-0.8696616, -1.188963, -2.553454, 0, 0, 0, 1, 1,
-0.8664777, 0.320007, -1.600412, 0, 0, 0, 1, 1,
-0.8584516, -0.2997774, -0.28445, 0, 0, 0, 1, 1,
-0.8559539, 0.1618402, -2.80219, 0, 0, 0, 1, 1,
-0.8510057, -0.06391077, -1.895995, 0, 0, 0, 1, 1,
-0.8461299, 0.2236489, -1.258668, 0, 0, 0, 1, 1,
-0.8458099, -1.960572, -1.679275, 1, 1, 1, 1, 1,
-0.8452881, 0.9545152, -0.1820065, 1, 1, 1, 1, 1,
-0.8315737, 0.6829229, 0.3448382, 1, 1, 1, 1, 1,
-0.8302801, 0.2046293, -1.685801, 1, 1, 1, 1, 1,
-0.8286225, 0.9724994, -0.3210194, 1, 1, 1, 1, 1,
-0.8281091, -2.152316, -2.104986, 1, 1, 1, 1, 1,
-0.8218253, -0.1127414, -1.809355, 1, 1, 1, 1, 1,
-0.821322, -0.02517378, -0.4366649, 1, 1, 1, 1, 1,
-0.8148027, 1.322907, -0.4150947, 1, 1, 1, 1, 1,
-0.8098074, -0.2404535, -3.535058, 1, 1, 1, 1, 1,
-0.8086917, -2.06278, -3.719341, 1, 1, 1, 1, 1,
-0.8032868, -0.6672617, -2.477127, 1, 1, 1, 1, 1,
-0.8006971, 0.6503789, -0.673656, 1, 1, 1, 1, 1,
-0.7980393, 0.4130405, 0.7139239, 1, 1, 1, 1, 1,
-0.7955559, -1.186327, -2.804391, 1, 1, 1, 1, 1,
-0.7952406, -0.9475901, -3.039698, 0, 0, 1, 1, 1,
-0.793821, -0.2813416, -2.857436, 1, 0, 0, 1, 1,
-0.7926748, -0.9084209, -3.186063, 1, 0, 0, 1, 1,
-0.7880161, -1.467887, -3.514128, 1, 0, 0, 1, 1,
-0.7875725, 0.05236064, -2.087222, 1, 0, 0, 1, 1,
-0.7858965, 2.185627, 0.4298455, 1, 0, 0, 1, 1,
-0.7841499, 0.5694644, -1.108422, 0, 0, 0, 1, 1,
-0.781338, 0.5166362, -0.9809418, 0, 0, 0, 1, 1,
-0.7806185, 0.7444732, -1.588009, 0, 0, 0, 1, 1,
-0.7763892, -0.9905432, -3.272204, 0, 0, 0, 1, 1,
-0.7762169, -0.1055941, -0.9176241, 0, 0, 0, 1, 1,
-0.772669, 0.2156609, 0.4960586, 0, 0, 0, 1, 1,
-0.768183, -0.1824296, -2.878666, 0, 0, 0, 1, 1,
-0.7680987, -0.2949696, -2.466537, 1, 1, 1, 1, 1,
-0.7674745, 1.78076, -0.5356228, 1, 1, 1, 1, 1,
-0.7666194, 0.01911968, -1.663522, 1, 1, 1, 1, 1,
-0.7654589, -0.3244185, -2.255771, 1, 1, 1, 1, 1,
-0.7526795, 1.013525, -0.7101711, 1, 1, 1, 1, 1,
-0.7359933, -0.5209883, -3.053359, 1, 1, 1, 1, 1,
-0.734672, -0.1814584, -1.876387, 1, 1, 1, 1, 1,
-0.7307159, 0.6781499, -0.3331053, 1, 1, 1, 1, 1,
-0.7296857, -1.066522, -4.555563, 1, 1, 1, 1, 1,
-0.7277617, -0.1185211, -1.519632, 1, 1, 1, 1, 1,
-0.7270312, 1.089013, -0.9552541, 1, 1, 1, 1, 1,
-0.7248049, 0.9197236, -1.401317, 1, 1, 1, 1, 1,
-0.7206694, 0.07353607, -1.609927, 1, 1, 1, 1, 1,
-0.7198489, -1.450354, -3.430284, 1, 1, 1, 1, 1,
-0.7184031, 0.8996978, -1.549504, 1, 1, 1, 1, 1,
-0.7171307, 1.109279, -1.745365, 0, 0, 1, 1, 1,
-0.7141057, -1.364139, -3.162619, 1, 0, 0, 1, 1,
-0.7136316, 1.076845, -1.686159, 1, 0, 0, 1, 1,
-0.7054533, -1.40069, -3.190084, 1, 0, 0, 1, 1,
-0.6984441, 1.211569, -0.9584994, 1, 0, 0, 1, 1,
-0.6965298, 1.415848, -1.41346, 1, 0, 0, 1, 1,
-0.6956584, -0.5217537, -2.420673, 0, 0, 0, 1, 1,
-0.6872084, 0.2557088, 0.4340169, 0, 0, 0, 1, 1,
-0.6860164, 0.8709758, -0.9716008, 0, 0, 0, 1, 1,
-0.6846549, 0.6802369, 0.04344111, 0, 0, 0, 1, 1,
-0.6837029, -0.1008373, -1.04566, 0, 0, 0, 1, 1,
-0.6826598, 2.575077, -0.2236658, 0, 0, 0, 1, 1,
-0.665373, -0.01574739, -2.755375, 0, 0, 0, 1, 1,
-0.6644841, 1.045644, -0.875025, 1, 1, 1, 1, 1,
-0.6590151, -0.7079476, -1.292979, 1, 1, 1, 1, 1,
-0.6572715, 1.405395, -0.5826884, 1, 1, 1, 1, 1,
-0.6469067, 2.704207, -1.675519, 1, 1, 1, 1, 1,
-0.6427404, -0.2634023, -4.860008, 1, 1, 1, 1, 1,
-0.6420481, -2.278311, -3.33295, 1, 1, 1, 1, 1,
-0.6346487, 0.1814021, -1.060796, 1, 1, 1, 1, 1,
-0.6334772, -1.290565, -1.250729, 1, 1, 1, 1, 1,
-0.63336, 1.009781, -2.249617, 1, 1, 1, 1, 1,
-0.6325815, -0.5389593, -1.015302, 1, 1, 1, 1, 1,
-0.6274662, -0.5845034, -3.247765, 1, 1, 1, 1, 1,
-0.6255239, -0.3831153, -1.268972, 1, 1, 1, 1, 1,
-0.6235265, -1.848679, -3.112214, 1, 1, 1, 1, 1,
-0.6191686, 1.07874, 0.1037215, 1, 1, 1, 1, 1,
-0.6188674, -0.1953448, -3.437629, 1, 1, 1, 1, 1,
-0.6137478, 0.397431, -0.6576843, 0, 0, 1, 1, 1,
-0.608449, -0.2492367, -1.431342, 1, 0, 0, 1, 1,
-0.6045985, 0.9843773, -0.9099581, 1, 0, 0, 1, 1,
-0.6013287, -0.01566059, -3.423054, 1, 0, 0, 1, 1,
-0.6001652, -0.1881834, -1.689423, 1, 0, 0, 1, 1,
-0.5912626, 0.4100263, -3.031388, 1, 0, 0, 1, 1,
-0.589851, -0.05576517, -1.072699, 0, 0, 0, 1, 1,
-0.5874456, 0.2761737, -2.774704, 0, 0, 0, 1, 1,
-0.5856233, -0.4367605, -1.486875, 0, 0, 0, 1, 1,
-0.5842206, -1.199584, -3.621068, 0, 0, 0, 1, 1,
-0.5829772, -1.012397, -3.615226, 0, 0, 0, 1, 1,
-0.5821984, -1.359405, -4.049993, 0, 0, 0, 1, 1,
-0.5821201, -1.633791, -1.612699, 0, 0, 0, 1, 1,
-0.5797279, 0.09951165, -2.174187, 1, 1, 1, 1, 1,
-0.5791857, -0.2780343, -1.892505, 1, 1, 1, 1, 1,
-0.5770322, -1.498189, -1.67905, 1, 1, 1, 1, 1,
-0.5756994, 0.2411454, -1.067542, 1, 1, 1, 1, 1,
-0.5741856, -0.6867635, -1.861846, 1, 1, 1, 1, 1,
-0.5696539, -0.05296148, -0.06271745, 1, 1, 1, 1, 1,
-0.5664694, 0.0615368, -1.507327, 1, 1, 1, 1, 1,
-0.5647361, 0.3865311, -1.983212, 1, 1, 1, 1, 1,
-0.5614793, 0.8465934, -1.211506, 1, 1, 1, 1, 1,
-0.5599589, 0.4925075, -0.2421888, 1, 1, 1, 1, 1,
-0.559245, 1.577826, 0.07312447, 1, 1, 1, 1, 1,
-0.5525055, 1.015866, -1.791587, 1, 1, 1, 1, 1,
-0.5380009, 0.489553, -1.608783, 1, 1, 1, 1, 1,
-0.5378353, 0.6350079, -0.0829143, 1, 1, 1, 1, 1,
-0.5341412, -0.6165667, -1.997356, 1, 1, 1, 1, 1,
-0.5341321, 0.3387366, 0.8565067, 0, 0, 1, 1, 1,
-0.5324439, 0.6909392, 0.07925152, 1, 0, 0, 1, 1,
-0.5247492, 1.057144, -1.12952, 1, 0, 0, 1, 1,
-0.5245196, -1.631684, -0.7286667, 1, 0, 0, 1, 1,
-0.5235577, 0.6871669, -1.516398, 1, 0, 0, 1, 1,
-0.5188958, -0.223174, -0.169607, 1, 0, 0, 1, 1,
-0.5143651, 0.2688804, -2.0217, 0, 0, 0, 1, 1,
-0.5130316, 2.059242, 0.855969, 0, 0, 0, 1, 1,
-0.512389, 0.1850557, -1.486954, 0, 0, 0, 1, 1,
-0.5081121, -1.556684, -1.934601, 0, 0, 0, 1, 1,
-0.5016319, -0.6822272, -1.160666, 0, 0, 0, 1, 1,
-0.4993832, 0.3325389, -0.001225537, 0, 0, 0, 1, 1,
-0.4987636, 0.7434448, -1.571905, 0, 0, 0, 1, 1,
-0.497218, -0.1548009, -3.159103, 1, 1, 1, 1, 1,
-0.4917549, -1.715903, -3.275984, 1, 1, 1, 1, 1,
-0.4915468, 0.07060069, -2.08378, 1, 1, 1, 1, 1,
-0.4873498, 2.867969, 0.5069393, 1, 1, 1, 1, 1,
-0.482764, 1.476712, 0.4132085, 1, 1, 1, 1, 1,
-0.4801637, 0.5393777, 0.2053629, 1, 1, 1, 1, 1,
-0.4755597, 0.3862053, -1.94427, 1, 1, 1, 1, 1,
-0.4736931, -0.8387456, -1.567668, 1, 1, 1, 1, 1,
-0.4676441, -2.876972, -1.709804, 1, 1, 1, 1, 1,
-0.4672085, 0.1871042, -0.8230095, 1, 1, 1, 1, 1,
-0.4660885, 0.9577467, -2.089185, 1, 1, 1, 1, 1,
-0.460705, 0.8935114, -0.9215421, 1, 1, 1, 1, 1,
-0.4569075, 0.3231898, -2.519877, 1, 1, 1, 1, 1,
-0.4564188, 1.389749, 0.2533323, 1, 1, 1, 1, 1,
-0.4505217, -0.1431802, -0.7732807, 1, 1, 1, 1, 1,
-0.4489585, -0.6502867, -2.779941, 0, 0, 1, 1, 1,
-0.4483052, -0.1297343, -2.038738, 1, 0, 0, 1, 1,
-0.4446523, -1.431962, -1.439926, 1, 0, 0, 1, 1,
-0.44363, 0.6130781, -0.8950832, 1, 0, 0, 1, 1,
-0.4429892, 1.417607, 0.554241, 1, 0, 0, 1, 1,
-0.4312128, -1.103013, -3.115712, 1, 0, 0, 1, 1,
-0.4288929, -0.2936973, -2.301428, 0, 0, 0, 1, 1,
-0.4237208, 0.1699585, -1.286345, 0, 0, 0, 1, 1,
-0.4227396, -0.7721521, -3.468947, 0, 0, 0, 1, 1,
-0.4198592, 0.7245442, -2.255502, 0, 0, 0, 1, 1,
-0.4172904, 0.5934548, -0.4660343, 0, 0, 0, 1, 1,
-0.4049815, 0.6870759, -0.4784549, 0, 0, 0, 1, 1,
-0.4023167, -1.111246, -4.081135, 0, 0, 0, 1, 1,
-0.3970738, -0.3424068, -4.425775, 1, 1, 1, 1, 1,
-0.3888684, 0.7504154, -0.5425623, 1, 1, 1, 1, 1,
-0.3880739, -0.2206631, -2.564764, 1, 1, 1, 1, 1,
-0.3864025, -1.138764, -1.549282, 1, 1, 1, 1, 1,
-0.3844233, 0.6302603, -0.7814857, 1, 1, 1, 1, 1,
-0.3801106, 0.7031253, -1.13658, 1, 1, 1, 1, 1,
-0.3763403, 0.6407882, -1.133694, 1, 1, 1, 1, 1,
-0.3729925, -0.3655753, -3.037461, 1, 1, 1, 1, 1,
-0.3728371, 0.7521974, -0.4010269, 1, 1, 1, 1, 1,
-0.3727762, -0.04759029, -2.827622, 1, 1, 1, 1, 1,
-0.3714405, -1.503689, -3.921523, 1, 1, 1, 1, 1,
-0.3706751, 1.411337, -0.09641841, 1, 1, 1, 1, 1,
-0.3673782, 0.8240628, -0.01075381, 1, 1, 1, 1, 1,
-0.3655757, 1.051636, 0.4804446, 1, 1, 1, 1, 1,
-0.3640674, 0.3368596, -2.125516, 1, 1, 1, 1, 1,
-0.3602363, 1.567025, -0.03374335, 0, 0, 1, 1, 1,
-0.3563868, -1.147589, -1.968556, 1, 0, 0, 1, 1,
-0.3546357, -1.220259, -2.938474, 1, 0, 0, 1, 1,
-0.3509, 0.2382487, -0.845852, 1, 0, 0, 1, 1,
-0.3483757, 0.2373286, -1.01951, 1, 0, 0, 1, 1,
-0.347063, 1.683875, 0.7724586, 1, 0, 0, 1, 1,
-0.3458994, -0.4881743, -1.835708, 0, 0, 0, 1, 1,
-0.340546, -0.1969057, -2.885893, 0, 0, 0, 1, 1,
-0.3340952, 0.1310785, -0.9066485, 0, 0, 0, 1, 1,
-0.3309439, -0.6043572, -1.630549, 0, 0, 0, 1, 1,
-0.3307279, 0.7473921, 1.136766, 0, 0, 0, 1, 1,
-0.3276004, 0.9223213, -2.374597, 0, 0, 0, 1, 1,
-0.3245041, -1.56595, -2.830827, 0, 0, 0, 1, 1,
-0.3209959, 1.793326, 0.3330162, 1, 1, 1, 1, 1,
-0.3193585, -1.510475, -0.5296305, 1, 1, 1, 1, 1,
-0.317598, -0.03278049, -2.342596, 1, 1, 1, 1, 1,
-0.3160975, 0.7492443, -0.7098941, 1, 1, 1, 1, 1,
-0.3143253, 0.2111935, -1.792345, 1, 1, 1, 1, 1,
-0.3108176, 1.419541, -0.7689215, 1, 1, 1, 1, 1,
-0.3022, -0.5733963, -5.13729, 1, 1, 1, 1, 1,
-0.3005511, 0.1651662, -1.667949, 1, 1, 1, 1, 1,
-0.2972336, 0.619976, -1.363774, 1, 1, 1, 1, 1,
-0.2939948, 0.8260058, -0.536684, 1, 1, 1, 1, 1,
-0.2922385, 0.5761772, 1.099595, 1, 1, 1, 1, 1,
-0.2894782, 1.77201, 0.7633777, 1, 1, 1, 1, 1,
-0.2889377, -0.6547065, -1.774163, 1, 1, 1, 1, 1,
-0.2888312, 0.9550452, -1.437796, 1, 1, 1, 1, 1,
-0.2850733, -0.19063, -1.008671, 1, 1, 1, 1, 1,
-0.2833939, -0.237272, -2.001318, 0, 0, 1, 1, 1,
-0.2785337, 0.4743732, -1.145082, 1, 0, 0, 1, 1,
-0.2716834, -0.9432104, -1.964045, 1, 0, 0, 1, 1,
-0.2714433, -0.4526072, -1.691916, 1, 0, 0, 1, 1,
-0.2703933, 0.8104091, -0.6512653, 1, 0, 0, 1, 1,
-0.2701041, -0.1936249, -1.098407, 1, 0, 0, 1, 1,
-0.2693472, 1.602324, -0.6883317, 0, 0, 0, 1, 1,
-0.2579995, -0.3305179, -0.6991111, 0, 0, 0, 1, 1,
-0.2559477, 2.140765, 0.1459719, 0, 0, 0, 1, 1,
-0.251255, 0.2758491, -0.5117949, 0, 0, 0, 1, 1,
-0.2496663, 3.335545, -1.637103, 0, 0, 0, 1, 1,
-0.2470371, 0.3186759, -1.366896, 0, 0, 0, 1, 1,
-0.2455794, -0.5839137, -1.159727, 0, 0, 0, 1, 1,
-0.2444801, 0.5770339, 1.845182, 1, 1, 1, 1, 1,
-0.2439003, -1.077349, -2.37547, 1, 1, 1, 1, 1,
-0.2429766, -1.216644, -3.030699, 1, 1, 1, 1, 1,
-0.2408642, -0.4060931, -4.054967, 1, 1, 1, 1, 1,
-0.2386328, 0.8419132, 0.6033062, 1, 1, 1, 1, 1,
-0.2384675, -0.8205243, -3.534934, 1, 1, 1, 1, 1,
-0.2353048, -1.305629, -2.56659, 1, 1, 1, 1, 1,
-0.2337511, -0.09609374, -2.639986, 1, 1, 1, 1, 1,
-0.233109, 0.09830988, 0.6135293, 1, 1, 1, 1, 1,
-0.2317412, -1.504796, -3.444223, 1, 1, 1, 1, 1,
-0.2315479, 0.5490949, -1.518451, 1, 1, 1, 1, 1,
-0.2291846, 0.4027964, 0.8657898, 1, 1, 1, 1, 1,
-0.2227238, -2.616499, -4.705716, 1, 1, 1, 1, 1,
-0.2187439, 0.3610865, -1.767184, 1, 1, 1, 1, 1,
-0.2175726, 1.408421, -1.076448, 1, 1, 1, 1, 1,
-0.2172232, -0.4039333, -2.684539, 0, 0, 1, 1, 1,
-0.2149008, 0.04027158, -0.5121616, 1, 0, 0, 1, 1,
-0.212033, -1.435425, -4.328567, 1, 0, 0, 1, 1,
-0.2093541, 0.04406705, -0.7395719, 1, 0, 0, 1, 1,
-0.2057199, 0.5439377, -0.4374956, 1, 0, 0, 1, 1,
-0.2008529, -0.5026343, -3.111059, 1, 0, 0, 1, 1,
-0.2006101, 0.4691871, 1.048386, 0, 0, 0, 1, 1,
-0.1972681, 0.02266208, -1.290773, 0, 0, 0, 1, 1,
-0.1971939, 1.141308, 1.471639, 0, 0, 0, 1, 1,
-0.1924383, 1.210471, -0.6636587, 0, 0, 0, 1, 1,
-0.1920945, 1.853171, -0.5612932, 0, 0, 0, 1, 1,
-0.1918727, 0.7313144, -0.2734245, 0, 0, 0, 1, 1,
-0.1911317, 0.3040546, -1.422644, 0, 0, 0, 1, 1,
-0.1884768, -0.928273, -2.404248, 1, 1, 1, 1, 1,
-0.1868634, -0.2642798, -1.249387, 1, 1, 1, 1, 1,
-0.1865859, 1.549748, -0.7091185, 1, 1, 1, 1, 1,
-0.1830806, -1.356073, -5.225224, 1, 1, 1, 1, 1,
-0.1802417, -0.4137577, -3.512302, 1, 1, 1, 1, 1,
-0.1749763, -2.03939, -3.729702, 1, 1, 1, 1, 1,
-0.1739073, -0.7130702, -2.060558, 1, 1, 1, 1, 1,
-0.1738012, 0.2091478, -0.6128535, 1, 1, 1, 1, 1,
-0.1691317, 1.20325, -1.215809, 1, 1, 1, 1, 1,
-0.1679122, 1.291241, 0.2607837, 1, 1, 1, 1, 1,
-0.1670749, -0.263629, -2.298416, 1, 1, 1, 1, 1,
-0.1615091, -1.319631, -4.683651, 1, 1, 1, 1, 1,
-0.1606265, -0.6451209, -3.160605, 1, 1, 1, 1, 1,
-0.160543, -0.5977705, -3.306366, 1, 1, 1, 1, 1,
-0.1512954, 0.5724056, 0.5476416, 1, 1, 1, 1, 1,
-0.1510253, -1.66436, -1.890464, 0, 0, 1, 1, 1,
-0.1430411, 0.08041742, -1.624386, 1, 0, 0, 1, 1,
-0.1425969, 1.393086, -2.395191, 1, 0, 0, 1, 1,
-0.1401832, -1.807636, -3.729887, 1, 0, 0, 1, 1,
-0.1371523, -0.9341275, -1.948603, 1, 0, 0, 1, 1,
-0.1340025, -1.474477, -3.565579, 1, 0, 0, 1, 1,
-0.1295957, 0.4473785, -1.204767, 0, 0, 0, 1, 1,
-0.1255436, -1.204558, -2.375462, 0, 0, 0, 1, 1,
-0.1237858, 0.4163788, 1.215565, 0, 0, 0, 1, 1,
-0.1167829, -0.168862, -1.968387, 0, 0, 0, 1, 1,
-0.1088817, -1.395892, -3.046239, 0, 0, 0, 1, 1,
-0.1077006, 0.2406169, -1.569969, 0, 0, 0, 1, 1,
-0.1069444, -0.9600921, -1.94589, 0, 0, 0, 1, 1,
-0.1048988, 0.1611753, -0.5910728, 1, 1, 1, 1, 1,
-0.1023955, 1.86977, 1.02488, 1, 1, 1, 1, 1,
-0.1000338, -0.8425291, -2.539263, 1, 1, 1, 1, 1,
-0.0996271, -2.57563, -1.204927, 1, 1, 1, 1, 1,
-0.09791, 1.077482, 0.04453314, 1, 1, 1, 1, 1,
-0.09406625, -0.5808937, -1.577178, 1, 1, 1, 1, 1,
-0.0930483, -0.7121404, -2.751005, 1, 1, 1, 1, 1,
-0.0864465, 0.9637842, 0.2231131, 1, 1, 1, 1, 1,
-0.08634942, 0.5369511, -0.2099064, 1, 1, 1, 1, 1,
-0.08376627, 1.389945, -0.224351, 1, 1, 1, 1, 1,
-0.0825255, -0.9728835, -5.19476, 1, 1, 1, 1, 1,
-0.08219381, 0.02613592, -1.666277, 1, 1, 1, 1, 1,
-0.08165629, -0.518515, -2.241812, 1, 1, 1, 1, 1,
-0.0760557, -1.077321, -2.471964, 1, 1, 1, 1, 1,
-0.0723311, 1.346986, 1.43529, 1, 1, 1, 1, 1,
-0.07173754, -0.4683267, -1.349527, 0, 0, 1, 1, 1,
-0.07034644, 0.4068382, -0.9387927, 1, 0, 0, 1, 1,
-0.06264564, -0.05384412, -2.833635, 1, 0, 0, 1, 1,
-0.06146932, -0.007626597, -1.157287, 1, 0, 0, 1, 1,
-0.05971636, 2.173698, 1.14999, 1, 0, 0, 1, 1,
-0.05698423, -1.346881, -3.345196, 1, 0, 0, 1, 1,
-0.05472313, 0.8483536, -1.503994, 0, 0, 0, 1, 1,
-0.05037358, -0.1872576, -2.342159, 0, 0, 0, 1, 1,
-0.04890311, 2.110413, 0.506846, 0, 0, 0, 1, 1,
-0.04768854, 0.2303463, -1.070759, 0, 0, 0, 1, 1,
-0.04657415, -1.202073, -4.223532, 0, 0, 0, 1, 1,
-0.04643794, 1.010538, 0.1656714, 0, 0, 0, 1, 1,
-0.04574104, -1.334674, -3.944539, 0, 0, 0, 1, 1,
-0.04476157, 1.119873, 0.5242224, 1, 1, 1, 1, 1,
-0.04295724, -0.7208615, -3.344964, 1, 1, 1, 1, 1,
-0.04195801, -0.8263806, -1.519417, 1, 1, 1, 1, 1,
-0.04141989, -0.3074066, -4.679724, 1, 1, 1, 1, 1,
-0.03896448, 2.564626, 0.04327637, 1, 1, 1, 1, 1,
-0.03629105, -0.3500498, -2.66902, 1, 1, 1, 1, 1,
-0.03566901, -1.479164, -2.349993, 1, 1, 1, 1, 1,
-0.03419045, -0.1943002, -3.471577, 1, 1, 1, 1, 1,
-0.02295437, -0.5362266, -3.418483, 1, 1, 1, 1, 1,
-0.02162386, 1.02198, 0.728645, 1, 1, 1, 1, 1,
-0.02039577, -0.6612406, -2.682064, 1, 1, 1, 1, 1,
-0.01984088, 1.301445, 1.45758, 1, 1, 1, 1, 1,
-0.01946601, -0.5304561, -3.156856, 1, 1, 1, 1, 1,
-0.01845523, -0.5109985, -2.576295, 1, 1, 1, 1, 1,
-0.007126379, 0.5479933, 0.1927405, 1, 1, 1, 1, 1,
-0.006309652, 0.9622784, 0.2151124, 0, 0, 1, 1, 1,
-0.00313567, 0.2200635, -0.9569919, 1, 0, 0, 1, 1,
0.001108396, -1.00502, 2.949336, 1, 0, 0, 1, 1,
0.001667106, 0.3877508, 0.3175053, 1, 0, 0, 1, 1,
0.008472388, 0.291009, 0.4474022, 1, 0, 0, 1, 1,
0.01002678, -1.07072, 3.845419, 1, 0, 0, 1, 1,
0.01353043, 0.6020256, 0.867745, 0, 0, 0, 1, 1,
0.01413708, -1.297177, 2.016778, 0, 0, 0, 1, 1,
0.01653328, 0.6298168, -1.065419, 0, 0, 0, 1, 1,
0.01866119, -0.5323365, 3.350789, 0, 0, 0, 1, 1,
0.02287666, 0.1119334, -0.4995333, 0, 0, 0, 1, 1,
0.02372278, -0.718356, 4.414572, 0, 0, 0, 1, 1,
0.02392567, 0.4516655, 0.7007697, 0, 0, 0, 1, 1,
0.02541465, -2.291018, 3.960568, 1, 1, 1, 1, 1,
0.02659047, -0.0891582, 1.242511, 1, 1, 1, 1, 1,
0.02668172, 0.7164361, 2.202167, 1, 1, 1, 1, 1,
0.02681525, -0.4683838, 2.025836, 1, 1, 1, 1, 1,
0.02721839, -1.434813, 1.948106, 1, 1, 1, 1, 1,
0.02776022, 0.1176587, -1.411964, 1, 1, 1, 1, 1,
0.02839846, 1.473519, 0.9669601, 1, 1, 1, 1, 1,
0.03346992, -0.08961514, 2.785219, 1, 1, 1, 1, 1,
0.03509931, -0.5174044, 1.877558, 1, 1, 1, 1, 1,
0.03710446, 0.1063935, 1.600772, 1, 1, 1, 1, 1,
0.03908373, -0.4404912, 2.778268, 1, 1, 1, 1, 1,
0.04058956, -0.1551583, 3.485515, 1, 1, 1, 1, 1,
0.04091012, -0.2114739, 2.898911, 1, 1, 1, 1, 1,
0.04517915, 0.3831701, 0.5450619, 1, 1, 1, 1, 1,
0.04530475, -0.2268893, 3.672115, 1, 1, 1, 1, 1,
0.05001702, 0.5968181, 0.008793864, 0, 0, 1, 1, 1,
0.05169016, -1.545074, 2.998364, 1, 0, 0, 1, 1,
0.0557935, 0.8922604, 1.792631, 1, 0, 0, 1, 1,
0.05775745, 0.08340102, 0.7749062, 1, 0, 0, 1, 1,
0.06030653, -0.6220722, 3.945209, 1, 0, 0, 1, 1,
0.06275231, 0.57818, 1.542739, 1, 0, 0, 1, 1,
0.0656314, 1.581757, -0.3568717, 0, 0, 0, 1, 1,
0.06767429, 1.62236, -0.6175225, 0, 0, 0, 1, 1,
0.06828443, -1.128709, 1.373909, 0, 0, 0, 1, 1,
0.0738511, 0.5811771, -1.081602, 0, 0, 0, 1, 1,
0.07470859, 1.697423, 0.06201878, 0, 0, 0, 1, 1,
0.07802353, 0.499386, -1.264551, 0, 0, 0, 1, 1,
0.08147865, 0.7736213, 0.1655211, 0, 0, 0, 1, 1,
0.0840828, 0.5141492, 1.203171, 1, 1, 1, 1, 1,
0.08438589, -0.158363, 3.225668, 1, 1, 1, 1, 1,
0.09409132, -1.037321, 4.74865, 1, 1, 1, 1, 1,
0.09527061, 1.816882, -1.600828, 1, 1, 1, 1, 1,
0.09922597, -0.4130214, 2.435147, 1, 1, 1, 1, 1,
0.1008482, 0.09033589, 0.4854517, 1, 1, 1, 1, 1,
0.1127605, -1.639501, 1.720415, 1, 1, 1, 1, 1,
0.1139483, 1.205113, 0.2963892, 1, 1, 1, 1, 1,
0.1139532, 0.8648263, -1.042913, 1, 1, 1, 1, 1,
0.116785, -0.6987298, 2.664254, 1, 1, 1, 1, 1,
0.1187137, -0.4565205, 3.297863, 1, 1, 1, 1, 1,
0.1229316, -0.3306032, 3.732882, 1, 1, 1, 1, 1,
0.1261636, -0.1709898, 3.843796, 1, 1, 1, 1, 1,
0.1272867, -0.8142687, 4.635585, 1, 1, 1, 1, 1,
0.1274378, -0.9749075, 2.542531, 1, 1, 1, 1, 1,
0.1275707, 0.3635738, 1.861065, 0, 0, 1, 1, 1,
0.1277496, 1.098655, 1.217587, 1, 0, 0, 1, 1,
0.1278936, -0.6876294, 2.835017, 1, 0, 0, 1, 1,
0.1289575, -0.07865185, 2.243596, 1, 0, 0, 1, 1,
0.1338475, -2.042528, 3.350917, 1, 0, 0, 1, 1,
0.1394449, 2.240524, 0.07712153, 1, 0, 0, 1, 1,
0.1426069, -0.6841239, 3.319884, 0, 0, 0, 1, 1,
0.1439558, 0.583724, 1.347398, 0, 0, 0, 1, 1,
0.1531134, 0.145142, 0.475844, 0, 0, 0, 1, 1,
0.1613565, 0.1655363, 2.005336, 0, 0, 0, 1, 1,
0.1651652, -0.408456, 2.048762, 0, 0, 0, 1, 1,
0.1663729, -1.731171, 3.074376, 0, 0, 0, 1, 1,
0.1704475, 0.08153442, 2.474413, 0, 0, 0, 1, 1,
0.1726624, 1.002492, -0.7085138, 1, 1, 1, 1, 1,
0.1752365, 1.286931, 0.5521457, 1, 1, 1, 1, 1,
0.1826848, -0.5342646, 1.757735, 1, 1, 1, 1, 1,
0.1827484, 0.9668393, -1.392173, 1, 1, 1, 1, 1,
0.1832651, 0.9192566, 1.624825, 1, 1, 1, 1, 1,
0.1834289, -0.4297298, 3.303803, 1, 1, 1, 1, 1,
0.1839398, -1.304792, 0.7324167, 1, 1, 1, 1, 1,
0.1852841, -1.27095, 2.658832, 1, 1, 1, 1, 1,
0.1856327, -1.29877, 3.463577, 1, 1, 1, 1, 1,
0.1890976, 0.1627155, 1.145766, 1, 1, 1, 1, 1,
0.1900032, 0.6393598, -1.075947, 1, 1, 1, 1, 1,
0.1906657, -1.190184, 3.305426, 1, 1, 1, 1, 1,
0.1932442, -0.6698838, 0.7280821, 1, 1, 1, 1, 1,
0.1941878, 0.6400943, 0.4459519, 1, 1, 1, 1, 1,
0.1942886, 0.9184542, 0.2871968, 1, 1, 1, 1, 1,
0.1972397, 0.3924602, 0.9575174, 0, 0, 1, 1, 1,
0.1989182, -1.334375, 2.478884, 1, 0, 0, 1, 1,
0.2033929, -0.1185291, 1.117085, 1, 0, 0, 1, 1,
0.2042912, 0.2211988, 2.29351, 1, 0, 0, 1, 1,
0.2134301, -0.2795072, 3.019442, 1, 0, 0, 1, 1,
0.2146421, -1.31989, 1.433883, 1, 0, 0, 1, 1,
0.2183788, 0.06385301, -0.3205703, 0, 0, 0, 1, 1,
0.2242173, 1.444944, 0.7522746, 0, 0, 0, 1, 1,
0.2278427, -1.560194, 3.588272, 0, 0, 0, 1, 1,
0.2301993, -0.8627462, 2.915303, 0, 0, 0, 1, 1,
0.2336585, -1.202791, 2.57018, 0, 0, 0, 1, 1,
0.2351068, 1.249591, -0.1017147, 0, 0, 0, 1, 1,
0.2353648, 0.5443695, -1.199627, 0, 0, 0, 1, 1,
0.2364585, -0.4260355, 2.539088, 1, 1, 1, 1, 1,
0.2381091, -0.4834273, 3.147968, 1, 1, 1, 1, 1,
0.2420733, -0.1255343, 2.523843, 1, 1, 1, 1, 1,
0.2422922, -0.9293129, 2.000587, 1, 1, 1, 1, 1,
0.2447493, -1.07624, 1.953589, 1, 1, 1, 1, 1,
0.2468036, -0.7111736, 3.844799, 1, 1, 1, 1, 1,
0.250982, 1.046725, 0.5521011, 1, 1, 1, 1, 1,
0.2567804, -0.1347711, 1.984302, 1, 1, 1, 1, 1,
0.257583, 0.2743727, 0.6377602, 1, 1, 1, 1, 1,
0.2576475, 2.146901, -0.9818437, 1, 1, 1, 1, 1,
0.2600855, -1.820426, 2.312243, 1, 1, 1, 1, 1,
0.261237, -1.304174, 1.631466, 1, 1, 1, 1, 1,
0.2625175, -0.4727153, 2.45641, 1, 1, 1, 1, 1,
0.2663717, 1.192464, -0.7437159, 1, 1, 1, 1, 1,
0.2675503, -0.5285538, 3.255203, 1, 1, 1, 1, 1,
0.2682576, 0.4100235, 1.151178, 0, 0, 1, 1, 1,
0.2757796, 0.1638555, 2.172348, 1, 0, 0, 1, 1,
0.2804684, 0.6931529, -0.03945025, 1, 0, 0, 1, 1,
0.2910239, 0.8603267, 1.343971, 1, 0, 0, 1, 1,
0.2913508, -1.915813, 2.955031, 1, 0, 0, 1, 1,
0.2972117, 0.2230728, 2.62982, 1, 0, 0, 1, 1,
0.2977747, -8.864077e-05, 0.9769326, 0, 0, 0, 1, 1,
0.298614, 0.6203893, 0.5793912, 0, 0, 0, 1, 1,
0.2989522, -0.8494672, 2.789012, 0, 0, 0, 1, 1,
0.3024344, -0.1237399, 2.966807, 0, 0, 0, 1, 1,
0.3035322, -1.31685, 1.028358, 0, 0, 0, 1, 1,
0.3042739, 1.269705, 0.7122518, 0, 0, 0, 1, 1,
0.3058417, -0.7768886, 2.430533, 0, 0, 0, 1, 1,
0.3174053, 0.5743083, 0.9688561, 1, 1, 1, 1, 1,
0.3213453, 1.457789, 0.09119688, 1, 1, 1, 1, 1,
0.3221577, 1.227717, -0.374887, 1, 1, 1, 1, 1,
0.3243707, 0.146887, 1.2386, 1, 1, 1, 1, 1,
0.3252156, -0.5703735, 3.283796, 1, 1, 1, 1, 1,
0.3280644, -0.3787195, -0.8429996, 1, 1, 1, 1, 1,
0.3316232, 1.20081, -0.8467832, 1, 1, 1, 1, 1,
0.3325993, -1.935296, 2.192827, 1, 1, 1, 1, 1,
0.3327278, -0.537184, 2.120642, 1, 1, 1, 1, 1,
0.3370152, -0.2682712, 2.838828, 1, 1, 1, 1, 1,
0.3393095, 0.3787232, 1.308789, 1, 1, 1, 1, 1,
0.342402, 0.09509115, 2.391273, 1, 1, 1, 1, 1,
0.3433384, -0.8888857, 1.644821, 1, 1, 1, 1, 1,
0.3494169, -0.1125707, 2.855803, 1, 1, 1, 1, 1,
0.3524948, -1.305956, 5.348109, 1, 1, 1, 1, 1,
0.3530889, 0.6100943, 1.295161, 0, 0, 1, 1, 1,
0.356295, 1.634717, -1.276439, 1, 0, 0, 1, 1,
0.357763, -0.1548264, 0.8387323, 1, 0, 0, 1, 1,
0.3593951, -2.647918, 3.335962, 1, 0, 0, 1, 1,
0.3699827, -0.07992575, 1.199648, 1, 0, 0, 1, 1,
0.3736438, -0.4553196, 1.637895, 1, 0, 0, 1, 1,
0.3753345, 1.113894, 0.05822622, 0, 0, 0, 1, 1,
0.3816858, 0.2896981, 0.04549592, 0, 0, 0, 1, 1,
0.3873067, -1.745815, 3.430593, 0, 0, 0, 1, 1,
0.3918473, 0.6118491, 2.469001, 0, 0, 0, 1, 1,
0.3939512, -0.6978799, 1.469655, 0, 0, 0, 1, 1,
0.3969167, -1.411439, 1.40361, 0, 0, 0, 1, 1,
0.3974238, -0.4779871, 3.39561, 0, 0, 0, 1, 1,
0.4005193, -0.8914782, 3.348444, 1, 1, 1, 1, 1,
0.4014402, -0.4515566, 4.184636, 1, 1, 1, 1, 1,
0.4025212, -0.7870026, 2.363695, 1, 1, 1, 1, 1,
0.4035166, -0.213045, 3.941363, 1, 1, 1, 1, 1,
0.4036995, -0.740062, 3.643483, 1, 1, 1, 1, 1,
0.406711, 0.4676183, 1.819253, 1, 1, 1, 1, 1,
0.4127283, 0.7423665, -0.5479182, 1, 1, 1, 1, 1,
0.4132379, -0.3173999, 2.229535, 1, 1, 1, 1, 1,
0.4144093, 0.1367476, 0.4967901, 1, 1, 1, 1, 1,
0.4148922, 0.8897861, 1.042913, 1, 1, 1, 1, 1,
0.4223657, -0.0404423, 2.059291, 1, 1, 1, 1, 1,
0.4341794, 0.8759763, -0.597403, 1, 1, 1, 1, 1,
0.434533, -1.581235, 2.626859, 1, 1, 1, 1, 1,
0.4367031, 0.8504494, 2.875722, 1, 1, 1, 1, 1,
0.4383021, 0.07213973, 0.5288594, 1, 1, 1, 1, 1,
0.4395854, -0.9181989, 1.841049, 0, 0, 1, 1, 1,
0.4413463, -0.7956235, 2.675081, 1, 0, 0, 1, 1,
0.4465019, 0.5782696, 1.00933, 1, 0, 0, 1, 1,
0.4467734, 0.7967663, 0.01653045, 1, 0, 0, 1, 1,
0.4474685, -0.3982632, 2.035926, 1, 0, 0, 1, 1,
0.4583054, 1.38939, 1.446894, 1, 0, 0, 1, 1,
0.459851, 0.2413562, -0.1044817, 0, 0, 0, 1, 1,
0.4678242, -0.3951296, 2.027469, 0, 0, 0, 1, 1,
0.4687833, -1.011737, 2.15155, 0, 0, 0, 1, 1,
0.4737509, -0.3425351, 3.459492, 0, 0, 0, 1, 1,
0.4770681, 1.292919, 0.8927727, 0, 0, 0, 1, 1,
0.4771412, -1.268795, 3.138063, 0, 0, 0, 1, 1,
0.4772057, -1.871459, 4.18885, 0, 0, 0, 1, 1,
0.4785372, -0.8197294, 3.647546, 1, 1, 1, 1, 1,
0.4801424, 0.3996731, 0.3253423, 1, 1, 1, 1, 1,
0.4847264, -1.706785, 1.263202, 1, 1, 1, 1, 1,
0.4942704, -0.08782726, 2.778418, 1, 1, 1, 1, 1,
0.4950117, 2.242397, 0.6145709, 1, 1, 1, 1, 1,
0.4961867, 1.318907, 1.259079, 1, 1, 1, 1, 1,
0.498803, -1.066303, 1.694993, 1, 1, 1, 1, 1,
0.5054385, 0.2753937, 1.83161, 1, 1, 1, 1, 1,
0.5212718, -2.666517, 5.322569, 1, 1, 1, 1, 1,
0.5229952, -0.9234664, 4.210159, 1, 1, 1, 1, 1,
0.5246544, 0.5272496, 0.7189478, 1, 1, 1, 1, 1,
0.5284804, 1.896, 1.318491, 1, 1, 1, 1, 1,
0.5352421, -0.07140247, -0.01034181, 1, 1, 1, 1, 1,
0.5405895, 0.8136992, 0.7265153, 1, 1, 1, 1, 1,
0.540775, -0.1676396, 2.692164, 1, 1, 1, 1, 1,
0.5420551, -0.7649885, 0.980473, 0, 0, 1, 1, 1,
0.5431303, 0.5311815, -0.01390538, 1, 0, 0, 1, 1,
0.5434028, -0.2406437, 1.684382, 1, 0, 0, 1, 1,
0.5454723, 1.6444, 0.1042249, 1, 0, 0, 1, 1,
0.5505261, 1.350546, 0.4272538, 1, 0, 0, 1, 1,
0.5518453, 2.352254, -1.308845, 1, 0, 0, 1, 1,
0.5537437, 0.1452534, 1.515757, 0, 0, 0, 1, 1,
0.554486, 1.793946, 3.279353, 0, 0, 0, 1, 1,
0.5553588, 0.7187251, 0.2918636, 0, 0, 0, 1, 1,
0.5561764, 0.7072119, 2.037428, 0, 0, 0, 1, 1,
0.561079, -0.7843938, 1.701229, 0, 0, 0, 1, 1,
0.5629667, -0.2572581, 1.791313, 0, 0, 0, 1, 1,
0.5637289, -0.1522993, 3.145056, 0, 0, 0, 1, 1,
0.5691004, -0.4397124, 3.324633, 1, 1, 1, 1, 1,
0.572531, -0.0923481, 2.730489, 1, 1, 1, 1, 1,
0.5725791, -0.6580887, 2.867795, 1, 1, 1, 1, 1,
0.5731108, 0.3213264, 2.63223, 1, 1, 1, 1, 1,
0.5827256, 0.8814448, 0.5667554, 1, 1, 1, 1, 1,
0.5830278, 0.7501085, -0.278402, 1, 1, 1, 1, 1,
0.5859729, -1.052709, 3.445662, 1, 1, 1, 1, 1,
0.5876154, 1.636201, 0.09065475, 1, 1, 1, 1, 1,
0.5881596, -0.1822343, 2.758624, 1, 1, 1, 1, 1,
0.5919087, -1.214271, 1.190831, 1, 1, 1, 1, 1,
0.5975981, -0.05954868, 1.36538, 1, 1, 1, 1, 1,
0.5995589, -0.6459602, 2.777805, 1, 1, 1, 1, 1,
0.6022559, -0.5961319, 2.659497, 1, 1, 1, 1, 1,
0.602684, -0.05017922, 0.8483233, 1, 1, 1, 1, 1,
0.6050812, -0.4919646, 1.544766, 1, 1, 1, 1, 1,
0.6064542, -1.482057, 0.03152486, 0, 0, 1, 1, 1,
0.6105694, 1.302977, 1.189148, 1, 0, 0, 1, 1,
0.6174109, -0.4329599, 2.797469, 1, 0, 0, 1, 1,
0.626338, -1.45421, 2.119662, 1, 0, 0, 1, 1,
0.6264413, -0.2362108, 2.275548, 1, 0, 0, 1, 1,
0.6336932, -0.5374386, 4.913724, 1, 0, 0, 1, 1,
0.6363685, 0.5490419, 1.318489, 0, 0, 0, 1, 1,
0.6386192, 0.3893293, 3.008236, 0, 0, 0, 1, 1,
0.6388337, -1.259404, 2.753983, 0, 0, 0, 1, 1,
0.6405141, -1.497294, 3.471749, 0, 0, 0, 1, 1,
0.6420848, -0.1661756, 1.978954, 0, 0, 0, 1, 1,
0.6445782, 0.2487121, 0.9669015, 0, 0, 0, 1, 1,
0.6496195, -0.09073781, 2.657197, 0, 0, 0, 1, 1,
0.6506052, 1.301583, 0.2112324, 1, 1, 1, 1, 1,
0.6557733, 0.869247, -0.1437671, 1, 1, 1, 1, 1,
0.6575026, 0.8578631, 0.238371, 1, 1, 1, 1, 1,
0.6617262, 0.4562604, -0.9760109, 1, 1, 1, 1, 1,
0.6618316, -0.1712344, 0.9708996, 1, 1, 1, 1, 1,
0.6633002, 0.639553, 0.8267024, 1, 1, 1, 1, 1,
0.6648439, 0.2308559, 1.517612, 1, 1, 1, 1, 1,
0.6655731, -1.320375, 1.400917, 1, 1, 1, 1, 1,
0.6663797, 0.06685277, 1.783018, 1, 1, 1, 1, 1,
0.6779109, -0.1129084, 0.7940479, 1, 1, 1, 1, 1,
0.6820687, -0.6374998, 2.948182, 1, 1, 1, 1, 1,
0.6821557, -1.479148, 4.607851, 1, 1, 1, 1, 1,
0.6911552, -0.005923063, -0.6948442, 1, 1, 1, 1, 1,
0.7002421, -0.8391702, 2.329379, 1, 1, 1, 1, 1,
0.7060272, -1.760468, 3.400991, 1, 1, 1, 1, 1,
0.7185287, 0.008909308, 0.1633934, 0, 0, 1, 1, 1,
0.7224235, 0.07574732, -0.2416536, 1, 0, 0, 1, 1,
0.7248372, -0.1860369, 1.672487, 1, 0, 0, 1, 1,
0.7285451, 1.126982, 0.7520515, 1, 0, 0, 1, 1,
0.7314833, -0.1080367, 0.01782808, 1, 0, 0, 1, 1,
0.736008, -1.460598, 1.972377, 1, 0, 0, 1, 1,
0.7368063, -0.02866369, 2.515311, 0, 0, 0, 1, 1,
0.7379609, -2.955315, 2.51864, 0, 0, 0, 1, 1,
0.7402542, 0.6513364, 0.7685112, 0, 0, 0, 1, 1,
0.7492145, 0.07071066, 2.201775, 0, 0, 0, 1, 1,
0.7493678, 0.229845, 0.1162951, 0, 0, 0, 1, 1,
0.7531058, 0.5545235, 0.2105529, 0, 0, 0, 1, 1,
0.7534235, -0.4297768, 3.278377, 0, 0, 0, 1, 1,
0.7566375, 3.31989, 0.03750064, 1, 1, 1, 1, 1,
0.7587181, -0.7199457, 2.890878, 1, 1, 1, 1, 1,
0.7642307, 1.412377, -0.1795881, 1, 1, 1, 1, 1,
0.7681863, 1.355183, 0.4461288, 1, 1, 1, 1, 1,
0.7704814, -0.04041501, 1.971034, 1, 1, 1, 1, 1,
0.7708237, -1.139315, 3.425172, 1, 1, 1, 1, 1,
0.7800536, -0.7476354, 2.751182, 1, 1, 1, 1, 1,
0.783823, -0.8172979, 1.387219, 1, 1, 1, 1, 1,
0.7850088, -0.3735862, 2.91639, 1, 1, 1, 1, 1,
0.7866558, 1.171865, 0.2652082, 1, 1, 1, 1, 1,
0.7868017, 0.3329469, 0.2462257, 1, 1, 1, 1, 1,
0.790202, 0.6976723, 0.05041672, 1, 1, 1, 1, 1,
0.7921019, 0.5874637, 0.262383, 1, 1, 1, 1, 1,
0.7942369, 0.7589876, 2.360512, 1, 1, 1, 1, 1,
0.797599, -1.957228, 3.425936, 1, 1, 1, 1, 1,
0.8022628, -0.9696863, 1.559816, 0, 0, 1, 1, 1,
0.8076938, 0.2858921, 1.856125, 1, 0, 0, 1, 1,
0.8086957, -1.89866, 1.250846, 1, 0, 0, 1, 1,
0.8175936, 1.369747, -0.006171268, 1, 0, 0, 1, 1,
0.8271763, -0.6625341, 1.916957, 1, 0, 0, 1, 1,
0.8287846, 0.9414487, 0.02250194, 1, 0, 0, 1, 1,
0.8381612, -1.44065, 1.609037, 0, 0, 0, 1, 1,
0.8431073, -0.5231755, 3.3271, 0, 0, 0, 1, 1,
0.8536177, 2.089741, 0.5097717, 0, 0, 0, 1, 1,
0.8570126, -0.9773782, 4.054546, 0, 0, 0, 1, 1,
0.8597698, 0.78549, -0.02900044, 0, 0, 0, 1, 1,
0.8607427, -1.643456, 2.063596, 0, 0, 0, 1, 1,
0.8608519, -0.4542881, 2.486541, 0, 0, 0, 1, 1,
0.8632433, -0.4121874, 2.85459, 1, 1, 1, 1, 1,
0.8655588, -0.1878521, 1.64694, 1, 1, 1, 1, 1,
0.8712854, 0.3773094, 0.7960078, 1, 1, 1, 1, 1,
0.8752736, 0.3781057, 2.050383, 1, 1, 1, 1, 1,
0.8796199, -0.665163, 2.465434, 1, 1, 1, 1, 1,
0.8816962, 1.247862, 0.5689462, 1, 1, 1, 1, 1,
0.8850359, -0.09358505, 0.6579002, 1, 1, 1, 1, 1,
0.8927981, 1.930001, -0.1745687, 1, 1, 1, 1, 1,
0.8930078, 0.1234477, 1.444979, 1, 1, 1, 1, 1,
0.9024244, -0.1474267, -0.1831885, 1, 1, 1, 1, 1,
0.9140454, 0.8090663, 0.9787676, 1, 1, 1, 1, 1,
0.9184003, 0.2906253, 0.9231862, 1, 1, 1, 1, 1,
0.9196494, 1.34516, 0.4126462, 1, 1, 1, 1, 1,
0.9197822, 0.730647, -0.6466609, 1, 1, 1, 1, 1,
0.9249621, -1.07807, 2.634891, 1, 1, 1, 1, 1,
0.9267843, 0.2513656, 1.522627, 0, 0, 1, 1, 1,
0.9271515, -1.21183, 2.716247, 1, 0, 0, 1, 1,
0.9284397, 0.03477291, 2.346945, 1, 0, 0, 1, 1,
0.9303042, -0.2229812, 0.9124873, 1, 0, 0, 1, 1,
0.9315373, -0.3234501, 1.697811, 1, 0, 0, 1, 1,
0.934319, -0.1321331, 1.763642, 1, 0, 0, 1, 1,
0.9346789, -0.8566641, 0.9478837, 0, 0, 0, 1, 1,
0.9424946, -0.3505388, 2.410192, 0, 0, 0, 1, 1,
0.9441723, -0.7078576, 2.038005, 0, 0, 0, 1, 1,
0.9443808, 1.982892, 1.118704, 0, 0, 0, 1, 1,
0.9481153, 0.01845028, 2.193033, 0, 0, 0, 1, 1,
0.9543599, -0.4141935, 1.636761, 0, 0, 0, 1, 1,
0.9560723, -0.3036016, 2.184593, 0, 0, 0, 1, 1,
0.9609081, 0.9472408, 1.504678, 1, 1, 1, 1, 1,
0.9631504, -0.5639109, 2.650292, 1, 1, 1, 1, 1,
0.9704039, -1.66196, 3.286306, 1, 1, 1, 1, 1,
0.9758844, 0.6221962, -0.3128968, 1, 1, 1, 1, 1,
0.9868479, 1.899827, -0.3424483, 1, 1, 1, 1, 1,
0.9872971, -0.9925511, 2.091081, 1, 1, 1, 1, 1,
0.9892132, -0.651959, 2.288724, 1, 1, 1, 1, 1,
0.9911726, -0.815447, 3.103152, 1, 1, 1, 1, 1,
0.9919883, -0.0293443, 0.2768221, 1, 1, 1, 1, 1,
0.9976851, 0.6201474, 1.906582, 1, 1, 1, 1, 1,
0.999284, 0.4274822, 1.382442, 1, 1, 1, 1, 1,
1.001597, 1.317351, 0.9117515, 1, 1, 1, 1, 1,
1.001771, -0.3674954, 2.275957, 1, 1, 1, 1, 1,
1.00459, -1.959728, 2.278198, 1, 1, 1, 1, 1,
1.006793, -0.8158958, 0.5907555, 1, 1, 1, 1, 1,
1.007252, -0.4607253, 3.392117, 0, 0, 1, 1, 1,
1.014488, 1.485253, 0.9589686, 1, 0, 0, 1, 1,
1.01632, 0.6715709, 0.718443, 1, 0, 0, 1, 1,
1.016496, -1.546626, 2.435091, 1, 0, 0, 1, 1,
1.018084, 0.6653111, -0.3094985, 1, 0, 0, 1, 1,
1.018831, 1.953324, 2.010206, 1, 0, 0, 1, 1,
1.020547, -0.332734, 1.760357, 0, 0, 0, 1, 1,
1.021273, -2.072834, 0.966047, 0, 0, 0, 1, 1,
1.025336, 0.4221523, 0.884499, 0, 0, 0, 1, 1,
1.025523, 0.1487812, 3.265023, 0, 0, 0, 1, 1,
1.025655, 2.566965, 1.657572, 0, 0, 0, 1, 1,
1.032952, 0.5874875, 3.320544, 0, 0, 0, 1, 1,
1.03557, -0.6653615, 0.8947519, 0, 0, 0, 1, 1,
1.04432, 0.3682492, 0.963052, 1, 1, 1, 1, 1,
1.045433, 1.273507, 1.557041, 1, 1, 1, 1, 1,
1.052839, -0.944247, 3.087416, 1, 1, 1, 1, 1,
1.055595, -0.6453224, 1.489894, 1, 1, 1, 1, 1,
1.056294, -1.434933, 3.790231, 1, 1, 1, 1, 1,
1.058281, -1.722629, 3.895716, 1, 1, 1, 1, 1,
1.062953, -1.154876, 3.746621, 1, 1, 1, 1, 1,
1.064803, 0.8040202, -0.1707744, 1, 1, 1, 1, 1,
1.065686, -0.3609511, 2.826363, 1, 1, 1, 1, 1,
1.067729, -0.6657361, 2.068166, 1, 1, 1, 1, 1,
1.083806, 1.375397, 0.06850076, 1, 1, 1, 1, 1,
1.086922, -0.7920422, 1.669171, 1, 1, 1, 1, 1,
1.093519, 0.2599163, 3.005069, 1, 1, 1, 1, 1,
1.10694, -0.5398884, 2.933677, 1, 1, 1, 1, 1,
1.118598, -0.4179123, 0.6185803, 1, 1, 1, 1, 1,
1.119786, 0.04804119, 1.323183, 0, 0, 1, 1, 1,
1.120829, 0.4923234, 1.81622, 1, 0, 0, 1, 1,
1.121064, 0.4520195, 0.4712519, 1, 0, 0, 1, 1,
1.127523, -0.4524042, 2.696921, 1, 0, 0, 1, 1,
1.128936, 1.692403, 1.497012, 1, 0, 0, 1, 1,
1.139076, -0.05198922, 0.6913942, 1, 0, 0, 1, 1,
1.147139, 0.1535311, 0.2809555, 0, 0, 0, 1, 1,
1.149391, -1.382513, 4.926699, 0, 0, 0, 1, 1,
1.151105, -1.248596, 0.3753718, 0, 0, 0, 1, 1,
1.153363, 0.5243599, 2.936791, 0, 0, 0, 1, 1,
1.156419, 1.664746, -0.4234113, 0, 0, 0, 1, 1,
1.173394, -0.005964758, 1.731462, 0, 0, 0, 1, 1,
1.17769, 1.267874, 0.7017029, 0, 0, 0, 1, 1,
1.189271, -0.5721148, 3.38025, 1, 1, 1, 1, 1,
1.196172, -1.178431, 1.987941, 1, 1, 1, 1, 1,
1.198348, 1.398287, 0.888851, 1, 1, 1, 1, 1,
1.198878, -0.6480631, 2.880062, 1, 1, 1, 1, 1,
1.204496, 1.744281, 0.4311648, 1, 1, 1, 1, 1,
1.205726, 0.6271563, -0.6455179, 1, 1, 1, 1, 1,
1.209063, 0.9397796, 0.6448188, 1, 1, 1, 1, 1,
1.220069, -0.1523885, 1.716092, 1, 1, 1, 1, 1,
1.226799, -1.467949, 2.29481, 1, 1, 1, 1, 1,
1.230358, -0.2107861, 1.259352, 1, 1, 1, 1, 1,
1.230642, 0.01731917, 0.8042144, 1, 1, 1, 1, 1,
1.23582, 0.6380396, 2.595609, 1, 1, 1, 1, 1,
1.2393, -0.7943743, 2.89779, 1, 1, 1, 1, 1,
1.244481, 0.09646446, 2.108965, 1, 1, 1, 1, 1,
1.245997, 1.185149, -0.2168926, 1, 1, 1, 1, 1,
1.256291, 1.180315, 1.691639, 0, 0, 1, 1, 1,
1.262179, -0.0958793, 0.694063, 1, 0, 0, 1, 1,
1.264954, 0.2857088, 1.168907, 1, 0, 0, 1, 1,
1.265267, 0.1157078, 2.793981, 1, 0, 0, 1, 1,
1.265483, -1.355838, 1.454815, 1, 0, 0, 1, 1,
1.275175, -0.2301806, 2.037178, 1, 0, 0, 1, 1,
1.307672, 0.8815563, 2.321064, 0, 0, 0, 1, 1,
1.309496, -0.2546629, 2.802465, 0, 0, 0, 1, 1,
1.310103, 0.3852453, 1.053169, 0, 0, 0, 1, 1,
1.310508, -0.2409865, 2.864794, 0, 0, 0, 1, 1,
1.311698, 2.094534, 0.4565099, 0, 0, 0, 1, 1,
1.318525, 0.4550339, 0.5888071, 0, 0, 0, 1, 1,
1.325596, 0.5193324, 0.5535498, 0, 0, 0, 1, 1,
1.329042, 0.629176, -0.834957, 1, 1, 1, 1, 1,
1.331986, -0.6100622, 2.62238, 1, 1, 1, 1, 1,
1.342764, -0.1265278, 0.3309323, 1, 1, 1, 1, 1,
1.345003, 0.08418811, 0.6316887, 1, 1, 1, 1, 1,
1.349096, -1.743378, 0.8047593, 1, 1, 1, 1, 1,
1.369195, -0.834983, 2.195936, 1, 1, 1, 1, 1,
1.377351, -1.177209, 2.212066, 1, 1, 1, 1, 1,
1.378243, -0.1596896, 1.097971, 1, 1, 1, 1, 1,
1.384839, 0.5711698, 2.485579, 1, 1, 1, 1, 1,
1.390659, 0.2298721, 1.261809, 1, 1, 1, 1, 1,
1.398045, 0.09862502, 1.782026, 1, 1, 1, 1, 1,
1.400854, -0.7199274, 1.842578, 1, 1, 1, 1, 1,
1.400954, -1.460949, 2.200193, 1, 1, 1, 1, 1,
1.402393, 1.188287, 1.671097, 1, 1, 1, 1, 1,
1.407505, 0.09942388, 1.528012, 1, 1, 1, 1, 1,
1.413088, 0.4680338, 0.2465268, 0, 0, 1, 1, 1,
1.416635, 1.323384, -0.3454861, 1, 0, 0, 1, 1,
1.466715, -1.145838, 4.008514, 1, 0, 0, 1, 1,
1.467469, 1.975248, 0.5988593, 1, 0, 0, 1, 1,
1.477233, -0.274232, 1.717598, 1, 0, 0, 1, 1,
1.478926, -0.07306413, 0.6233706, 1, 0, 0, 1, 1,
1.485548, 1.058819, 0.7858957, 0, 0, 0, 1, 1,
1.490965, 0.03665917, 1.116014, 0, 0, 0, 1, 1,
1.503553, 1.458168, 1.35852, 0, 0, 0, 1, 1,
1.514387, 0.1806435, -0.3242315, 0, 0, 0, 1, 1,
1.515363, -2.012569, 2.973519, 0, 0, 0, 1, 1,
1.535917, 1.465613, 1.467072, 0, 0, 0, 1, 1,
1.550336, -0.7533199, 1.989218, 0, 0, 0, 1, 1,
1.551887, -0.5817874, 1.884613, 1, 1, 1, 1, 1,
1.556964, 0.1828114, 2.314634, 1, 1, 1, 1, 1,
1.561073, 1.212743, -0.6120856, 1, 1, 1, 1, 1,
1.564747, -0.2666097, 3.236401, 1, 1, 1, 1, 1,
1.571341, 0.947236, 1.117281, 1, 1, 1, 1, 1,
1.577037, -0.5777522, 1.156731, 1, 1, 1, 1, 1,
1.596532, -0.4828683, 3.347049, 1, 1, 1, 1, 1,
1.611973, -0.6849273, 2.870742, 1, 1, 1, 1, 1,
1.618717, -0.4589106, 2.931222, 1, 1, 1, 1, 1,
1.639397, 0.660543, 0.4136303, 1, 1, 1, 1, 1,
1.654239, 0.6837579, 1.122898, 1, 1, 1, 1, 1,
1.695391, -0.5741372, 2.825707, 1, 1, 1, 1, 1,
1.711903, -0.5378467, 1.653644, 1, 1, 1, 1, 1,
1.721807, 0.9222243, 1.03855, 1, 1, 1, 1, 1,
1.722499, -0.4675565, 1.266269, 1, 1, 1, 1, 1,
1.725436, 0.5767151, 1.05804, 0, 0, 1, 1, 1,
1.731581, -1.328234, 2.41501, 1, 0, 0, 1, 1,
1.736439, 0.03673309, 0.3556887, 1, 0, 0, 1, 1,
1.739769, 0.2031754, 0.9041636, 1, 0, 0, 1, 1,
1.753255, 0.6556419, 0.538445, 1, 0, 0, 1, 1,
1.762935, 0.4914839, 1.230769, 1, 0, 0, 1, 1,
1.782777, -1.32192, 3.3197, 0, 0, 0, 1, 1,
1.790358, -0.3445572, 4.508417, 0, 0, 0, 1, 1,
1.799905, 0.5539261, 1.334064, 0, 0, 0, 1, 1,
1.822775, -0.5087411, 2.508273, 0, 0, 0, 1, 1,
1.831794, -1.900612, 1.923669, 0, 0, 0, 1, 1,
1.838043, 0.3531544, 1.025889, 0, 0, 0, 1, 1,
1.852102, -1.708097, 2.398883, 0, 0, 0, 1, 1,
1.853282, 0.7079234, 2.431819, 1, 1, 1, 1, 1,
1.864579, -0.04855216, 0.8784128, 1, 1, 1, 1, 1,
1.865276, 0.3295402, 1.392733, 1, 1, 1, 1, 1,
1.88178, -1.279302, 0.8668025, 1, 1, 1, 1, 1,
1.897891, -1.008243, 2.151506, 1, 1, 1, 1, 1,
1.918306, 1.303811, 0.6629105, 1, 1, 1, 1, 1,
1.935392, -1.179516, 2.39042, 1, 1, 1, 1, 1,
1.937755, -0.7587987, 2.83065, 1, 1, 1, 1, 1,
1.960078, 3.191377, -0.1383786, 1, 1, 1, 1, 1,
1.98262, -0.7777291, 1.357066, 1, 1, 1, 1, 1,
1.990039, 2.155416, 1.268389, 1, 1, 1, 1, 1,
2.007151, -0.5907438, -0.1826985, 1, 1, 1, 1, 1,
2.019289, 0.09819196, 2.306113, 1, 1, 1, 1, 1,
2.0288, -0.3314419, 1.960377, 1, 1, 1, 1, 1,
2.080935, -1.246263, 0.5653135, 1, 1, 1, 1, 1,
2.089663, 1.115883, 1.763783, 0, 0, 1, 1, 1,
2.090597, -0.2498629, 1.809673, 1, 0, 0, 1, 1,
2.095584, -0.1504627, 0.5734612, 1, 0, 0, 1, 1,
2.101995, 0.07869391, 0.6568326, 1, 0, 0, 1, 1,
2.115364, -1.186013, 0.4591724, 1, 0, 0, 1, 1,
2.127414, -0.4856328, 1.874761, 1, 0, 0, 1, 1,
2.129792, 0.9129251, 3.036069, 0, 0, 0, 1, 1,
2.178256, 0.00989907, 2.285419, 0, 0, 0, 1, 1,
2.222342, -0.2009953, 2.043945, 0, 0, 0, 1, 1,
2.290552, -0.3696528, 0.3062107, 0, 0, 0, 1, 1,
2.302874, 1.64394, 0.2819442, 0, 0, 0, 1, 1,
2.303634, -1.797754, 0.8630875, 0, 0, 0, 1, 1,
2.367188, 1.095082, 0.3635799, 0, 0, 0, 1, 1,
2.377632, -0.4219719, 2.085158, 1, 1, 1, 1, 1,
2.450821, 0.3657858, 1.157668, 1, 1, 1, 1, 1,
2.490149, 0.03212528, 2.817462, 1, 1, 1, 1, 1,
2.664818, -0.6990089, 0.5637819, 1, 1, 1, 1, 1,
2.692273, 0.9515764, 0.1418011, 1, 1, 1, 1, 1,
2.767411, -0.6686828, 2.525451, 1, 1, 1, 1, 1,
3.120585, -1.122689, 2.016014, 1, 1, 1, 1, 1
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
var radius = 9.472336;
var distance = 33.27118;
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
mvMatrix.translate( 0.05628681, -0.1901152, -0.06144261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27118);
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
