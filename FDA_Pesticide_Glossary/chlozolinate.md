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
-3.156575, 0.1084865, -0.2310227, 1, 0, 0, 1,
-3.073286, 0.4911341, -1.693067, 1, 0.007843138, 0, 1,
-2.954766, -1.109146, -1.458857, 1, 0.01176471, 0, 1,
-2.60493, 0.9162073, -1.668441, 1, 0.01960784, 0, 1,
-2.60471, -1.550048, -1.339582, 1, 0.02352941, 0, 1,
-2.539381, -1.652107, -2.976373, 1, 0.03137255, 0, 1,
-2.493554, 0.08219017, -2.259427, 1, 0.03529412, 0, 1,
-2.478319, -1.479144, -0.2969064, 1, 0.04313726, 0, 1,
-2.456077, 0.3192175, 0.3352676, 1, 0.04705882, 0, 1,
-2.456067, 1.40127, -2.157029, 1, 0.05490196, 0, 1,
-2.434698, -0.3756458, -1.263946, 1, 0.05882353, 0, 1,
-2.402808, -1.025336, -2.066383, 1, 0.06666667, 0, 1,
-2.318482, -0.5426632, -2.577816, 1, 0.07058824, 0, 1,
-2.315561, 1.145104, -2.429396, 1, 0.07843138, 0, 1,
-2.300043, 0.3971113, -1.030413, 1, 0.08235294, 0, 1,
-2.288626, 1.166459, -0.8029592, 1, 0.09019608, 0, 1,
-2.233844, -1.058278, -3.576598, 1, 0.09411765, 0, 1,
-2.181609, -1.086957, -2.964301, 1, 0.1019608, 0, 1,
-2.181362, -0.09856044, -1.199186, 1, 0.1098039, 0, 1,
-2.155131, 0.7957373, -0.1273057, 1, 0.1137255, 0, 1,
-2.14901, 1.178607, -0.7810326, 1, 0.1215686, 0, 1,
-2.133289, 0.6840309, -0.4965771, 1, 0.1254902, 0, 1,
-2.12902, -0.07580264, -2.2174, 1, 0.1333333, 0, 1,
-2.125686, -0.3113528, -0.07312374, 1, 0.1372549, 0, 1,
-2.090123, 0.079688, -2.826587, 1, 0.145098, 0, 1,
-2.060136, 1.193113, -2.111181, 1, 0.1490196, 0, 1,
-1.977348, 1.811883, 0.2424292, 1, 0.1568628, 0, 1,
-1.966246, -0.1491914, 0.534791, 1, 0.1607843, 0, 1,
-1.944026, 1.051942, -0.9916958, 1, 0.1686275, 0, 1,
-1.935834, -0.7359982, -2.723433, 1, 0.172549, 0, 1,
-1.920969, 0.2078832, -1.372872, 1, 0.1803922, 0, 1,
-1.916328, -0.9940212, -2.076393, 1, 0.1843137, 0, 1,
-1.861, -2.086503, -2.735891, 1, 0.1921569, 0, 1,
-1.845054, 0.5878136, -1.888418, 1, 0.1960784, 0, 1,
-1.828983, -0.243048, -3.623317, 1, 0.2039216, 0, 1,
-1.812161, 0.8425188, -2.523332, 1, 0.2117647, 0, 1,
-1.807096, 0.7446477, -0.4612386, 1, 0.2156863, 0, 1,
-1.799586, -0.4284351, -2.696362, 1, 0.2235294, 0, 1,
-1.785056, -0.4397354, -2.190244, 1, 0.227451, 0, 1,
-1.782928, 0.2788922, -0.3744399, 1, 0.2352941, 0, 1,
-1.761999, 0.4021724, -1.830862, 1, 0.2392157, 0, 1,
-1.753057, -1.139998, -2.51959, 1, 0.2470588, 0, 1,
-1.728434, -0.3481407, -2.485855, 1, 0.2509804, 0, 1,
-1.690081, 1.10289, -0.9690582, 1, 0.2588235, 0, 1,
-1.689104, -1.116266, -2.250277, 1, 0.2627451, 0, 1,
-1.684532, 0.3863121, -1.955672, 1, 0.2705882, 0, 1,
-1.681218, 0.4651631, -1.158496, 1, 0.2745098, 0, 1,
-1.67535, 0.6841463, -1.679266, 1, 0.282353, 0, 1,
-1.67212, 0.9046928, 0.0512915, 1, 0.2862745, 0, 1,
-1.651005, 0.7756324, -0.7698094, 1, 0.2941177, 0, 1,
-1.64352, 0.3909602, -0.9060242, 1, 0.3019608, 0, 1,
-1.642427, -1.483704, -3.104006, 1, 0.3058824, 0, 1,
-1.630544, -1.261239, -3.447408, 1, 0.3137255, 0, 1,
-1.612037, 0.1913657, -1.428162, 1, 0.3176471, 0, 1,
-1.610349, -0.1528655, -1.961278, 1, 0.3254902, 0, 1,
-1.606006, 0.6481227, -0.5823718, 1, 0.3294118, 0, 1,
-1.605209, 0.8438378, -1.674728, 1, 0.3372549, 0, 1,
-1.596173, 1.454038, -1.206224, 1, 0.3411765, 0, 1,
-1.594721, 0.6429697, -1.778119, 1, 0.3490196, 0, 1,
-1.585708, 1.215138, -2.619939, 1, 0.3529412, 0, 1,
-1.56491, 0.6523955, -2.801898, 1, 0.3607843, 0, 1,
-1.563007, 2.118823, -0.1512257, 1, 0.3647059, 0, 1,
-1.545406, 0.4192347, -0.4988835, 1, 0.372549, 0, 1,
-1.536434, 1.095992, -3.410582, 1, 0.3764706, 0, 1,
-1.535546, 0.956257, -0.3422526, 1, 0.3843137, 0, 1,
-1.530261, -0.7158297, -1.327557, 1, 0.3882353, 0, 1,
-1.522663, 0.5213947, -1.511784, 1, 0.3960784, 0, 1,
-1.520645, 1.880576, -1.287591, 1, 0.4039216, 0, 1,
-1.51905, 2.187573, 0.2975476, 1, 0.4078431, 0, 1,
-1.518409, -1.015534, -2.711947, 1, 0.4156863, 0, 1,
-1.503299, -1.241446, -4.77386, 1, 0.4196078, 0, 1,
-1.497677, -0.5268711, -1.224012, 1, 0.427451, 0, 1,
-1.494622, 3.045595, 0.9512958, 1, 0.4313726, 0, 1,
-1.49043, 1.215907, -1.135165, 1, 0.4392157, 0, 1,
-1.484485, -0.6505426, -2.995175, 1, 0.4431373, 0, 1,
-1.477021, -0.3797773, -2.011999, 1, 0.4509804, 0, 1,
-1.451297, 0.4662281, -0.0391656, 1, 0.454902, 0, 1,
-1.451096, 0.767419, -0.9578452, 1, 0.4627451, 0, 1,
-1.445421, -0.003159605, -1.656178, 1, 0.4666667, 0, 1,
-1.435208, 0.08125525, -2.514865, 1, 0.4745098, 0, 1,
-1.43424, -0.5205204, -3.011556, 1, 0.4784314, 0, 1,
-1.428377, 1.150272, -2.673719, 1, 0.4862745, 0, 1,
-1.40412, -0.8659388, -2.852027, 1, 0.4901961, 0, 1,
-1.395458, 0.8860569, -0.1255842, 1, 0.4980392, 0, 1,
-1.394665, -0.03538568, -0.5615753, 1, 0.5058824, 0, 1,
-1.380137, -0.6557669, -2.588144, 1, 0.509804, 0, 1,
-1.375316, 0.1660044, 0.06446812, 1, 0.5176471, 0, 1,
-1.364261, -0.1529493, -3.209482, 1, 0.5215687, 0, 1,
-1.36296, -1.553972, -4.856188, 1, 0.5294118, 0, 1,
-1.362761, -0.3292446, -1.879624, 1, 0.5333334, 0, 1,
-1.358792, -0.4413848, -4.26156, 1, 0.5411765, 0, 1,
-1.355137, -0.9676585, -4.981278, 1, 0.5450981, 0, 1,
-1.354083, 0.7031503, -1.258889, 1, 0.5529412, 0, 1,
-1.343683, -0.8956527, -2.535469, 1, 0.5568628, 0, 1,
-1.338194, 0.6526939, -1.30422, 1, 0.5647059, 0, 1,
-1.33676, -1.20883, -2.664433, 1, 0.5686275, 0, 1,
-1.33224, -1.049997, -2.138556, 1, 0.5764706, 0, 1,
-1.323539, -0.4602271, -0.4410964, 1, 0.5803922, 0, 1,
-1.314284, 1.380872, -0.7231756, 1, 0.5882353, 0, 1,
-1.311041, 0.2731009, -2.050311, 1, 0.5921569, 0, 1,
-1.310438, -0.6528191, -2.832478, 1, 0.6, 0, 1,
-1.298578, -0.2060323, -2.254749, 1, 0.6078432, 0, 1,
-1.287869, -0.5786018, -2.022754, 1, 0.6117647, 0, 1,
-1.287799, -0.2850836, -2.502225, 1, 0.6196079, 0, 1,
-1.283905, 0.228978, -1.552833, 1, 0.6235294, 0, 1,
-1.281522, 0.3846357, -0.8042751, 1, 0.6313726, 0, 1,
-1.272185, -1.266397, -1.911472, 1, 0.6352941, 0, 1,
-1.262004, 0.276592, -1.07947, 1, 0.6431373, 0, 1,
-1.259206, -1.003914, -0.9446859, 1, 0.6470588, 0, 1,
-1.251196, 0.2739191, -2.309439, 1, 0.654902, 0, 1,
-1.248754, -0.5077407, -2.522196, 1, 0.6588235, 0, 1,
-1.247123, -0.03201736, -1.753898, 1, 0.6666667, 0, 1,
-1.243695, -0.4277952, -3.052195, 1, 0.6705883, 0, 1,
-1.235876, -0.9077838, -2.761906, 1, 0.6784314, 0, 1,
-1.231903, 0.9957019, -1.470276, 1, 0.682353, 0, 1,
-1.227868, -2.023845, -1.998641, 1, 0.6901961, 0, 1,
-1.227575, -0.2676709, -1.966999, 1, 0.6941177, 0, 1,
-1.222801, 1.942437, -0.6163865, 1, 0.7019608, 0, 1,
-1.213722, 0.2634254, -1.19314, 1, 0.7098039, 0, 1,
-1.207398, -1.386058, -3.060797, 1, 0.7137255, 0, 1,
-1.205743, -0.4728172, -2.200734, 1, 0.7215686, 0, 1,
-1.204412, -0.489345, 0.6192335, 1, 0.7254902, 0, 1,
-1.204078, 1.548222, -1.27023, 1, 0.7333333, 0, 1,
-1.203211, -1.468454, -1.350473, 1, 0.7372549, 0, 1,
-1.202238, 2.333991, -0.6499075, 1, 0.7450981, 0, 1,
-1.191378, -1.130319, -3.4644, 1, 0.7490196, 0, 1,
-1.187801, -0.5874234, -1.867006, 1, 0.7568628, 0, 1,
-1.175998, 1.269793, 0.6952484, 1, 0.7607843, 0, 1,
-1.163736, 0.5491236, -1.417474, 1, 0.7686275, 0, 1,
-1.161466, -1.58911, -3.909049, 1, 0.772549, 0, 1,
-1.15977, -0.2276329, -0.6026599, 1, 0.7803922, 0, 1,
-1.154898, -1.237689, -4.173466, 1, 0.7843137, 0, 1,
-1.153767, 0.9848028, -2.595061, 1, 0.7921569, 0, 1,
-1.151484, -0.3126125, -2.888978, 1, 0.7960784, 0, 1,
-1.15098, 1.265261, -1.72965, 1, 0.8039216, 0, 1,
-1.139238, -0.4671747, -2.460776, 1, 0.8117647, 0, 1,
-1.129275, 1.372065, -1.376293, 1, 0.8156863, 0, 1,
-1.128879, 0.9450586, -1.563165, 1, 0.8235294, 0, 1,
-1.124904, -1.216756, -2.202234, 1, 0.827451, 0, 1,
-1.118391, -1.591572, -3.689831, 1, 0.8352941, 0, 1,
-1.116637, 0.06129148, -1.837799, 1, 0.8392157, 0, 1,
-1.114612, 2.952287, -2.309827, 1, 0.8470588, 0, 1,
-1.109475, 1.143891, 0.0536189, 1, 0.8509804, 0, 1,
-1.10833, 0.2193627, -1.226483, 1, 0.8588235, 0, 1,
-1.104097, 0.5665355, -0.9491431, 1, 0.8627451, 0, 1,
-1.097782, 2.758341, 0.2411376, 1, 0.8705882, 0, 1,
-1.097547, -2.019594, -3.170411, 1, 0.8745098, 0, 1,
-1.094427, 0.1346659, 0.8271332, 1, 0.8823529, 0, 1,
-1.090285, 1.867273, -0.02826238, 1, 0.8862745, 0, 1,
-1.087443, -0.9324595, -1.855225, 1, 0.8941177, 0, 1,
-1.084713, -1.719808, -3.091723, 1, 0.8980392, 0, 1,
-1.078181, 0.3600295, 0.09873591, 1, 0.9058824, 0, 1,
-1.077151, 0.6501506, -0.08217013, 1, 0.9137255, 0, 1,
-1.076187, -0.4411459, -1.713469, 1, 0.9176471, 0, 1,
-1.073143, 0.4625874, -2.044086, 1, 0.9254902, 0, 1,
-1.060257, 0.6667566, -0.787929, 1, 0.9294118, 0, 1,
-1.052033, -0.8043732, -2.425443, 1, 0.9372549, 0, 1,
-1.045386, 0.5706186, -1.730838, 1, 0.9411765, 0, 1,
-1.035717, -0.114098, -2.372003, 1, 0.9490196, 0, 1,
-1.034646, 0.2839055, -2.991056, 1, 0.9529412, 0, 1,
-1.032805, 1.550031, -2.485835, 1, 0.9607843, 0, 1,
-1.025858, 0.9396952, -0.2075499, 1, 0.9647059, 0, 1,
-1.024982, 0.2881226, -2.492926, 1, 0.972549, 0, 1,
-1.022987, 1.378362, 0.2026296, 1, 0.9764706, 0, 1,
-1.013191, -0.7686393, -2.013096, 1, 0.9843137, 0, 1,
-1.000739, 0.6676852, -0.7388375, 1, 0.9882353, 0, 1,
-0.9962003, -0.4208952, -1.63247, 1, 0.9960784, 0, 1,
-0.9927099, -0.06947278, -1.606383, 0.9960784, 1, 0, 1,
-0.9883052, -0.01873996, -2.327039, 0.9921569, 1, 0, 1,
-0.9847757, 0.4725479, -2.888245, 0.9843137, 1, 0, 1,
-0.970243, -0.3517716, -2.600923, 0.9803922, 1, 0, 1,
-0.966764, -0.6693194, 0.2433448, 0.972549, 1, 0, 1,
-0.9595946, -0.8174754, -1.479005, 0.9686275, 1, 0, 1,
-0.9575174, -0.1734538, 0.2292717, 0.9607843, 1, 0, 1,
-0.9532156, -0.3027296, -1.970884, 0.9568627, 1, 0, 1,
-0.950739, -1.100675, -1.954342, 0.9490196, 1, 0, 1,
-0.9503484, 0.2776566, -1.771598, 0.945098, 1, 0, 1,
-0.9481573, -0.7316453, -1.783572, 0.9372549, 1, 0, 1,
-0.9450067, -1.934777, -3.362536, 0.9333333, 1, 0, 1,
-0.9387137, 0.2932192, -1.534034, 0.9254902, 1, 0, 1,
-0.9369836, 0.249523, -1.346766, 0.9215686, 1, 0, 1,
-0.9352603, 1.167283, -0.4895033, 0.9137255, 1, 0, 1,
-0.9337395, -0.7690092, -1.204619, 0.9098039, 1, 0, 1,
-0.9298707, -2.182522, -3.466116, 0.9019608, 1, 0, 1,
-0.9293137, 0.1830032, 0.52017, 0.8941177, 1, 0, 1,
-0.9274049, -0.8063755, -3.186157, 0.8901961, 1, 0, 1,
-0.9250528, 0.2608541, -2.637165, 0.8823529, 1, 0, 1,
-0.9241619, 0.3897544, -0.9589604, 0.8784314, 1, 0, 1,
-0.9202554, -1.157706, -3.092744, 0.8705882, 1, 0, 1,
-0.9195044, -1.576609, -4.058851, 0.8666667, 1, 0, 1,
-0.9186285, -0.1665429, -1.051249, 0.8588235, 1, 0, 1,
-0.911198, 0.1776426, -1.358565, 0.854902, 1, 0, 1,
-0.9108623, 1.156215, -0.02922057, 0.8470588, 1, 0, 1,
-0.8990707, 0.2986138, -2.60523, 0.8431373, 1, 0, 1,
-0.8952631, -0.7764465, -2.519572, 0.8352941, 1, 0, 1,
-0.8944762, 0.05922646, -0.551209, 0.8313726, 1, 0, 1,
-0.8838023, -0.3544979, -2.534053, 0.8235294, 1, 0, 1,
-0.877695, 0.750035, -1.82835, 0.8196079, 1, 0, 1,
-0.877256, -0.4894468, -1.987185, 0.8117647, 1, 0, 1,
-0.8768733, 1.537027, -0.7936459, 0.8078431, 1, 0, 1,
-0.8757558, 1.328871, -0.7773719, 0.8, 1, 0, 1,
-0.8735236, -0.09939482, -2.0865, 0.7921569, 1, 0, 1,
-0.8728076, -1.407723, -1.313458, 0.7882353, 1, 0, 1,
-0.8688599, -0.3137254, -0.9845081, 0.7803922, 1, 0, 1,
-0.8664703, 2.024958, -0.2182326, 0.7764706, 1, 0, 1,
-0.8664448, 0.8405257, 0.1145549, 0.7686275, 1, 0, 1,
-0.8641082, 2.010209, 0.5795253, 0.7647059, 1, 0, 1,
-0.8600162, -0.9307301, -2.624001, 0.7568628, 1, 0, 1,
-0.8518422, 0.9355609, -1.790682, 0.7529412, 1, 0, 1,
-0.8478971, -1.413405, -2.541245, 0.7450981, 1, 0, 1,
-0.8434244, 0.2653868, -1.969401, 0.7411765, 1, 0, 1,
-0.8413154, -0.4430018, -1.74354, 0.7333333, 1, 0, 1,
-0.8399656, -0.6252843, -3.355431, 0.7294118, 1, 0, 1,
-0.8397683, -0.1525727, -2.544619, 0.7215686, 1, 0, 1,
-0.8336614, -1.195103, -3.285322, 0.7176471, 1, 0, 1,
-0.8329076, -0.2113149, -2.22353, 0.7098039, 1, 0, 1,
-0.8321364, -0.4207685, -3.15194, 0.7058824, 1, 0, 1,
-0.8281292, 0.7841295, -1.578227, 0.6980392, 1, 0, 1,
-0.8278242, 0.273966, -1.770593, 0.6901961, 1, 0, 1,
-0.8237062, -0.04662227, -1.413884, 0.6862745, 1, 0, 1,
-0.8209826, -0.3791489, -2.549594, 0.6784314, 1, 0, 1,
-0.8142885, -1.195084, -2.72419, 0.6745098, 1, 0, 1,
-0.8129601, 0.7830474, -1.466826, 0.6666667, 1, 0, 1,
-0.7962908, 0.8824711, -1.025967, 0.6627451, 1, 0, 1,
-0.7943881, 1.808335, 0.6412093, 0.654902, 1, 0, 1,
-0.7881852, 1.062388, -0.06821573, 0.6509804, 1, 0, 1,
-0.7872505, 0.2456461, -0.3193579, 0.6431373, 1, 0, 1,
-0.7807834, 0.8546818, 0.06207759, 0.6392157, 1, 0, 1,
-0.7720163, 0.03350242, -0.722537, 0.6313726, 1, 0, 1,
-0.7710734, 0.1851428, -0.6116809, 0.627451, 1, 0, 1,
-0.7697938, 0.480423, -1.794986, 0.6196079, 1, 0, 1,
-0.7649545, 0.08236633, -1.056061, 0.6156863, 1, 0, 1,
-0.7612738, 0.2852467, -0.7360142, 0.6078432, 1, 0, 1,
-0.7567524, 1.027152, -1.083755, 0.6039216, 1, 0, 1,
-0.7527768, 0.07639708, -1.867175, 0.5960785, 1, 0, 1,
-0.7519746, -1.83619, -2.316494, 0.5882353, 1, 0, 1,
-0.7484012, 0.2555213, -1.170892, 0.5843138, 1, 0, 1,
-0.7376169, 0.8527502, -0.9659997, 0.5764706, 1, 0, 1,
-0.7362062, -0.6794226, -1.580049, 0.572549, 1, 0, 1,
-0.7358041, 0.05309156, 0.138337, 0.5647059, 1, 0, 1,
-0.7340179, 1.174263, -0.8095345, 0.5607843, 1, 0, 1,
-0.7293838, -0.5100941, -2.073166, 0.5529412, 1, 0, 1,
-0.7237492, -0.4456994, -1.006185, 0.5490196, 1, 0, 1,
-0.7231342, 1.980818, -0.5912656, 0.5411765, 1, 0, 1,
-0.7194895, -0.4799627, -2.273917, 0.5372549, 1, 0, 1,
-0.7192037, -1.962649, -3.935477, 0.5294118, 1, 0, 1,
-0.7091864, 0.42968, -0.6916184, 0.5254902, 1, 0, 1,
-0.7029911, -0.2534415, -1.94223, 0.5176471, 1, 0, 1,
-0.700554, -1.553944, -2.847398, 0.5137255, 1, 0, 1,
-0.6963964, -0.2265352, -1.387333, 0.5058824, 1, 0, 1,
-0.6928443, -0.1785028, -2.998482, 0.5019608, 1, 0, 1,
-0.6895236, -0.4054878, -1.706037, 0.4941176, 1, 0, 1,
-0.6877526, -0.4174549, -2.445652, 0.4862745, 1, 0, 1,
-0.6876701, -0.443556, -1.088978, 0.4823529, 1, 0, 1,
-0.6837807, -0.4643821, -2.04864, 0.4745098, 1, 0, 1,
-0.6827405, -0.9673989, -0.2307276, 0.4705882, 1, 0, 1,
-0.6779515, -1.728063, -3.560146, 0.4627451, 1, 0, 1,
-0.6742514, 1.87695, -0.6752872, 0.4588235, 1, 0, 1,
-0.6648998, -0.1709355, -2.036354, 0.4509804, 1, 0, 1,
-0.6638182, -1.144855, -2.032785, 0.4470588, 1, 0, 1,
-0.6560816, -0.6531687, -2.371797, 0.4392157, 1, 0, 1,
-0.6445524, -0.2103796, -0.8523958, 0.4352941, 1, 0, 1,
-0.6387007, 0.2733715, -1.571553, 0.427451, 1, 0, 1,
-0.6372738, 0.3445004, 0.1367128, 0.4235294, 1, 0, 1,
-0.6349062, 0.5035948, -1.628692, 0.4156863, 1, 0, 1,
-0.6338459, -1.620358, -2.230106, 0.4117647, 1, 0, 1,
-0.6317511, -1.120583, -3.672931, 0.4039216, 1, 0, 1,
-0.6292216, 0.3584855, -2.107705, 0.3960784, 1, 0, 1,
-0.623222, -1.637066, -2.012022, 0.3921569, 1, 0, 1,
-0.6196502, 0.3166657, -2.071993, 0.3843137, 1, 0, 1,
-0.6149258, -1.073885, -2.483921, 0.3803922, 1, 0, 1,
-0.6147453, 0.313884, -1.729752, 0.372549, 1, 0, 1,
-0.6112084, 0.9443139, -1.18036, 0.3686275, 1, 0, 1,
-0.6100461, 0.9301547, 1.099052, 0.3607843, 1, 0, 1,
-0.6082701, 0.8747201, 0.4785046, 0.3568628, 1, 0, 1,
-0.607383, 0.4071156, -1.385238, 0.3490196, 1, 0, 1,
-0.6026728, 0.2889982, -1.113973, 0.345098, 1, 0, 1,
-0.6023092, 0.4321296, -0.4570572, 0.3372549, 1, 0, 1,
-0.6020407, -0.07108661, -1.959642, 0.3333333, 1, 0, 1,
-0.6015978, -0.06560653, -0.5160013, 0.3254902, 1, 0, 1,
-0.6003097, -0.1972698, -0.297881, 0.3215686, 1, 0, 1,
-0.5988745, -1.110293, -4.221888, 0.3137255, 1, 0, 1,
-0.598807, -0.8361537, -2.048059, 0.3098039, 1, 0, 1,
-0.5971352, 1.146103, -0.2139099, 0.3019608, 1, 0, 1,
-0.5953971, -0.7508994, -1.8804, 0.2941177, 1, 0, 1,
-0.5935771, 0.5701641, -1.178556, 0.2901961, 1, 0, 1,
-0.5891333, 0.8764796, -2.852773, 0.282353, 1, 0, 1,
-0.5888781, -0.9094387, -1.140173, 0.2784314, 1, 0, 1,
-0.5873283, 0.5042691, -2.099488, 0.2705882, 1, 0, 1,
-0.585749, 0.8536656, -1.066184, 0.2666667, 1, 0, 1,
-0.5843994, 0.4706253, 0.5556021, 0.2588235, 1, 0, 1,
-0.5843837, -2.025317, -1.962574, 0.254902, 1, 0, 1,
-0.5783404, -0.8646276, -1.819082, 0.2470588, 1, 0, 1,
-0.5779921, 0.7574028, 0.00225256, 0.2431373, 1, 0, 1,
-0.5771071, -0.9757969, -2.568289, 0.2352941, 1, 0, 1,
-0.5766944, -0.6437688, -3.240376, 0.2313726, 1, 0, 1,
-0.5732735, 0.5460736, -2.924281, 0.2235294, 1, 0, 1,
-0.5727491, 1.371335, -2.004947, 0.2196078, 1, 0, 1,
-0.5712665, -0.6598551, -1.629647, 0.2117647, 1, 0, 1,
-0.5711602, 0.8529937, -0.8989207, 0.2078431, 1, 0, 1,
-0.5629693, 0.1319458, -2.446379, 0.2, 1, 0, 1,
-0.5617709, 0.09712508, -2.084561, 0.1921569, 1, 0, 1,
-0.5547982, 1.067792, -0.6851416, 0.1882353, 1, 0, 1,
-0.5510242, 0.7383969, -1.422517, 0.1803922, 1, 0, 1,
-0.5459399, -0.09355198, -0.4415511, 0.1764706, 1, 0, 1,
-0.5383065, -0.9276575, -2.206594, 0.1686275, 1, 0, 1,
-0.535696, 0.008710399, -1.504323, 0.1647059, 1, 0, 1,
-0.5349457, 0.1262183, -1.979716, 0.1568628, 1, 0, 1,
-0.5339653, -0.07488459, -1.524295, 0.1529412, 1, 0, 1,
-0.5271096, 0.8773066, -0.7713318, 0.145098, 1, 0, 1,
-0.5268754, 0.4458621, 0.2824185, 0.1411765, 1, 0, 1,
-0.5211881, 0.3803433, -0.6254352, 0.1333333, 1, 0, 1,
-0.5186655, 0.01797405, -2.497804, 0.1294118, 1, 0, 1,
-0.516706, -0.003115923, -2.086514, 0.1215686, 1, 0, 1,
-0.5161089, -0.728191, -2.060721, 0.1176471, 1, 0, 1,
-0.5151312, 0.0006500257, -1.349727, 0.1098039, 1, 0, 1,
-0.5116496, 0.8828468, -0.5443779, 0.1058824, 1, 0, 1,
-0.5088561, -0.239605, -1.543816, 0.09803922, 1, 0, 1,
-0.5088547, 1.612846, -0.6665699, 0.09019608, 1, 0, 1,
-0.5031862, 2.032017, -0.9214935, 0.08627451, 1, 0, 1,
-0.4989763, 1.139634, -1.471184, 0.07843138, 1, 0, 1,
-0.4977158, -0.9657182, -2.711374, 0.07450981, 1, 0, 1,
-0.494625, -1.282116, -0.9742424, 0.06666667, 1, 0, 1,
-0.4937378, -0.1298914, -1.72324, 0.0627451, 1, 0, 1,
-0.4892223, 0.5865777, -1.202849, 0.05490196, 1, 0, 1,
-0.4874477, 1.68385, -1.008599, 0.05098039, 1, 0, 1,
-0.4859285, 2.782504, -1.162002, 0.04313726, 1, 0, 1,
-0.4787502, -0.2773339, -1.643815, 0.03921569, 1, 0, 1,
-0.4719265, -1.086441, -0.9296705, 0.03137255, 1, 0, 1,
-0.4686105, 1.651025, -0.4670855, 0.02745098, 1, 0, 1,
-0.4678824, 0.3316185, -1.435087, 0.01960784, 1, 0, 1,
-0.4667464, 0.9748368, 0.7547413, 0.01568628, 1, 0, 1,
-0.4657668, -0.3957835, -2.070325, 0.007843138, 1, 0, 1,
-0.463469, -0.06607623, -2.785166, 0.003921569, 1, 0, 1,
-0.4628578, -0.364232, -2.261904, 0, 1, 0.003921569, 1,
-0.4623263, -0.534095, -0.4343754, 0, 1, 0.01176471, 1,
-0.4576391, -0.9302782, -2.196877, 0, 1, 0.01568628, 1,
-0.4544069, -0.9917883, -2.577281, 0, 1, 0.02352941, 1,
-0.4520191, 0.6254686, -1.167207, 0, 1, 0.02745098, 1,
-0.4511216, 0.2388092, -0.4664662, 0, 1, 0.03529412, 1,
-0.4502493, 0.6375731, 0.1742008, 0, 1, 0.03921569, 1,
-0.4495045, 0.5862536, -1.065315, 0, 1, 0.04705882, 1,
-0.4476057, 0.1750976, -1.298814, 0, 1, 0.05098039, 1,
-0.4466032, 0.2388632, -0.02140464, 0, 1, 0.05882353, 1,
-0.445082, -0.2889788, -0.9857354, 0, 1, 0.0627451, 1,
-0.4329119, -0.8875545, -2.91572, 0, 1, 0.07058824, 1,
-0.4300055, -0.9159459, -2.787062, 0, 1, 0.07450981, 1,
-0.4270131, -0.7980094, -2.731189, 0, 1, 0.08235294, 1,
-0.4240657, 0.2584661, -1.367691, 0, 1, 0.08627451, 1,
-0.4182064, -0.1014565, -1.567345, 0, 1, 0.09411765, 1,
-0.4169908, -0.5142409, -3.032607, 0, 1, 0.1019608, 1,
-0.4168342, -1.131305, -4.102083, 0, 1, 0.1058824, 1,
-0.4164858, -0.517125, -1.913683, 0, 1, 0.1137255, 1,
-0.4143796, -0.3825341, -3.765682, 0, 1, 0.1176471, 1,
-0.4112807, 0.3548746, 0.04434008, 0, 1, 0.1254902, 1,
-0.4109336, 1.831342, 0.621196, 0, 1, 0.1294118, 1,
-0.4093369, -0.2996823, -0.4797134, 0, 1, 0.1372549, 1,
-0.4072874, 0.2334704, -0.8633891, 0, 1, 0.1411765, 1,
-0.4059882, 0.06428733, -0.474829, 0, 1, 0.1490196, 1,
-0.4016871, -0.3290721, -3.184816, 0, 1, 0.1529412, 1,
-0.3939908, 0.1437997, -0.3758099, 0, 1, 0.1607843, 1,
-0.3887356, 0.9402139, -0.4340003, 0, 1, 0.1647059, 1,
-0.3866995, 0.39698, -1.138287, 0, 1, 0.172549, 1,
-0.3843077, -0.4553215, -2.559611, 0, 1, 0.1764706, 1,
-0.378866, -0.1924282, -1.754421, 0, 1, 0.1843137, 1,
-0.3774206, 1.725882, -0.5076758, 0, 1, 0.1882353, 1,
-0.3773064, 0.33858, -0.9606421, 0, 1, 0.1960784, 1,
-0.3771222, 0.2906092, -2.001023, 0, 1, 0.2039216, 1,
-0.373601, 1.603312, 0.1337941, 0, 1, 0.2078431, 1,
-0.3709145, -1.232055, -2.852655, 0, 1, 0.2156863, 1,
-0.3701618, 1.175936, 0.3086118, 0, 1, 0.2196078, 1,
-0.3690591, 0.6490238, -0.3503359, 0, 1, 0.227451, 1,
-0.3592072, 1.00658, -0.2054956, 0, 1, 0.2313726, 1,
-0.3568816, 0.04595707, -0.9433652, 0, 1, 0.2392157, 1,
-0.3563513, -0.7102352, -4.263621, 0, 1, 0.2431373, 1,
-0.3526931, 0.5618496, -1.071162, 0, 1, 0.2509804, 1,
-0.3511516, 0.2877909, -0.1104544, 0, 1, 0.254902, 1,
-0.3508693, -0.3036607, -3.032808, 0, 1, 0.2627451, 1,
-0.3493021, 0.1553909, -1.938489, 0, 1, 0.2666667, 1,
-0.3485107, -0.2354391, -3.489623, 0, 1, 0.2745098, 1,
-0.3484395, 0.9105755, -0.8096883, 0, 1, 0.2784314, 1,
-0.3482437, -0.4124704, -3.78902, 0, 1, 0.2862745, 1,
-0.3477872, -0.6043503, -3.218066, 0, 1, 0.2901961, 1,
-0.34394, 0.05645816, 0.3529978, 0, 1, 0.2980392, 1,
-0.3413379, 0.612515, -2.09016, 0, 1, 0.3058824, 1,
-0.3402013, -0.1885259, -2.184695, 0, 1, 0.3098039, 1,
-0.3397026, 1.519384, -0.8033723, 0, 1, 0.3176471, 1,
-0.3329634, -0.1682946, -2.972368, 0, 1, 0.3215686, 1,
-0.3310811, 0.6109618, -1.220027, 0, 1, 0.3294118, 1,
-0.3285354, 0.1479478, -0.9600493, 0, 1, 0.3333333, 1,
-0.3279925, 0.7131908, -1.185548, 0, 1, 0.3411765, 1,
-0.3276043, -0.4849597, -2.739743, 0, 1, 0.345098, 1,
-0.3213868, -1.625708, -3.735501, 0, 1, 0.3529412, 1,
-0.3192755, 0.4754708, -1.918955, 0, 1, 0.3568628, 1,
-0.3174324, 1.020792, 1.359202, 0, 1, 0.3647059, 1,
-0.3164031, -1.154504, -1.691015, 0, 1, 0.3686275, 1,
-0.3154442, -0.114087, -0.7444482, 0, 1, 0.3764706, 1,
-0.3144745, 1.151067, 1.07238, 0, 1, 0.3803922, 1,
-0.3142201, 0.1451606, -2.156959, 0, 1, 0.3882353, 1,
-0.3132882, 1.29137, -1.445143, 0, 1, 0.3921569, 1,
-0.311435, 0.1602619, -1.838296, 0, 1, 0.4, 1,
-0.3090965, 0.03461649, -1.952977, 0, 1, 0.4078431, 1,
-0.3085299, -2.291358, -2.468343, 0, 1, 0.4117647, 1,
-0.3054916, 1.197071, -0.4548734, 0, 1, 0.4196078, 1,
-0.3045358, 0.9721103, -1.470882, 0, 1, 0.4235294, 1,
-0.3041797, 1.11182, -0.3317448, 0, 1, 0.4313726, 1,
-0.3033965, -0.5941203, -2.782875, 0, 1, 0.4352941, 1,
-0.2987607, -0.1102131, -1.619619, 0, 1, 0.4431373, 1,
-0.2986932, -0.4130619, -2.412931, 0, 1, 0.4470588, 1,
-0.2983077, -1.430394, -2.413913, 0, 1, 0.454902, 1,
-0.2965053, 0.6412305, -1.162628, 0, 1, 0.4588235, 1,
-0.290965, 0.8964364, 0.9283462, 0, 1, 0.4666667, 1,
-0.2906604, 0.7945706, -0.9562, 0, 1, 0.4705882, 1,
-0.2903784, -0.5815008, -3.528213, 0, 1, 0.4784314, 1,
-0.2885741, -1.392929, -2.952056, 0, 1, 0.4823529, 1,
-0.283564, -0.512069, 0.2170257, 0, 1, 0.4901961, 1,
-0.2721891, 1.625392, 1.16439, 0, 1, 0.4941176, 1,
-0.2712947, -0.464592, -3.643111, 0, 1, 0.5019608, 1,
-0.2704405, 0.8545982, -0.7969874, 0, 1, 0.509804, 1,
-0.2688215, -0.4395307, -1.577685, 0, 1, 0.5137255, 1,
-0.2687933, 0.8375176, -1.853392, 0, 1, 0.5215687, 1,
-0.2670748, 2.524979, -0.09212923, 0, 1, 0.5254902, 1,
-0.2640961, -2.142944, -3.777209, 0, 1, 0.5333334, 1,
-0.2581361, 1.614609, 0.7084624, 0, 1, 0.5372549, 1,
-0.2541048, 0.07226026, -2.096652, 0, 1, 0.5450981, 1,
-0.2503472, -1.614469, -3.076573, 0, 1, 0.5490196, 1,
-0.2475473, 0.2342791, -0.2020156, 0, 1, 0.5568628, 1,
-0.2363873, -0.2319052, -1.456175, 0, 1, 0.5607843, 1,
-0.2352194, 0.5716574, -1.309572, 0, 1, 0.5686275, 1,
-0.2351455, -0.2663494, -2.020366, 0, 1, 0.572549, 1,
-0.2338079, -0.07759194, -3.148488, 0, 1, 0.5803922, 1,
-0.2185583, 1.441189, -1.221386, 0, 1, 0.5843138, 1,
-0.2137749, -0.594594, -1.695642, 0, 1, 0.5921569, 1,
-0.2132199, 0.5655202, -0.2159016, 0, 1, 0.5960785, 1,
-0.2072619, 0.07268, -0.4723379, 0, 1, 0.6039216, 1,
-0.2068657, -0.5939562, -3.563669, 0, 1, 0.6117647, 1,
-0.2061016, -2.887518, -1.590601, 0, 1, 0.6156863, 1,
-0.2051644, 0.824399, 1.822047, 0, 1, 0.6235294, 1,
-0.203763, 1.41244, 1.590216, 0, 1, 0.627451, 1,
-0.2036401, -2.149489, -2.104913, 0, 1, 0.6352941, 1,
-0.1921226, 0.03024429, -2.724381, 0, 1, 0.6392157, 1,
-0.1889934, 0.7347062, -1.422839, 0, 1, 0.6470588, 1,
-0.1828873, 2.265174, 0.00476804, 0, 1, 0.6509804, 1,
-0.18262, -0.6448485, -3.310125, 0, 1, 0.6588235, 1,
-0.1795986, -0.1341359, -2.233724, 0, 1, 0.6627451, 1,
-0.1721777, -0.6368662, -1.119382, 0, 1, 0.6705883, 1,
-0.1716029, 0.632254, -1.301921, 0, 1, 0.6745098, 1,
-0.1647213, 1.094785, -0.1405254, 0, 1, 0.682353, 1,
-0.1617182, 0.7620744, 0.3901432, 0, 1, 0.6862745, 1,
-0.1474944, -0.2454037, -3.217755, 0, 1, 0.6941177, 1,
-0.1407098, 1.113396, 0.4919844, 0, 1, 0.7019608, 1,
-0.1378103, -0.5165089, -0.6268588, 0, 1, 0.7058824, 1,
-0.1371666, 0.5038, -1.489158, 0, 1, 0.7137255, 1,
-0.1343221, -0.6284905, -3.656141, 0, 1, 0.7176471, 1,
-0.1299352, 0.7025596, 0.9750426, 0, 1, 0.7254902, 1,
-0.1229889, 0.4270985, -1.086505, 0, 1, 0.7294118, 1,
-0.114105, -0.6061824, -1.258497, 0, 1, 0.7372549, 1,
-0.1123645, 0.9082963, -0.2507644, 0, 1, 0.7411765, 1,
-0.110537, 1.030943, -0.8018386, 0, 1, 0.7490196, 1,
-0.1060302, -0.8737415, -3.326305, 0, 1, 0.7529412, 1,
-0.09881592, 1.040531, 0.128616, 0, 1, 0.7607843, 1,
-0.097549, -0.3425179, -3.206183, 0, 1, 0.7647059, 1,
-0.09291974, -0.007792449, -2.515835, 0, 1, 0.772549, 1,
-0.09079613, 1.62602, 0.5501385, 0, 1, 0.7764706, 1,
-0.09042575, 0.8281662, -0.3411359, 0, 1, 0.7843137, 1,
-0.08800592, -0.500319, -2.8323, 0, 1, 0.7882353, 1,
-0.08679318, 0.06258988, -0.5316409, 0, 1, 0.7960784, 1,
-0.08663583, -0.6450647, -1.137648, 0, 1, 0.8039216, 1,
-0.08646777, 0.163807, -1.262129, 0, 1, 0.8078431, 1,
-0.08421001, 0.1284808, 0.02511374, 0, 1, 0.8156863, 1,
-0.08416536, 1.35539, -0.8053679, 0, 1, 0.8196079, 1,
-0.08301892, 2.171097, 0.3615088, 0, 1, 0.827451, 1,
-0.07498125, 1.323259, 0.3271417, 0, 1, 0.8313726, 1,
-0.07404075, 1.609771, 0.9148144, 0, 1, 0.8392157, 1,
-0.07276211, 0.5536096, 1.662678, 0, 1, 0.8431373, 1,
-0.07153488, -1.976533, -6.344435, 0, 1, 0.8509804, 1,
-0.0711009, -0.2972101, -2.847584, 0, 1, 0.854902, 1,
-0.06847915, -1.228418, -2.858832, 0, 1, 0.8627451, 1,
-0.06136759, -0.3179973, -3.425836, 0, 1, 0.8666667, 1,
-0.06025087, 0.1312361, -0.9690693, 0, 1, 0.8745098, 1,
-0.05864069, -0.4960207, -2.470054, 0, 1, 0.8784314, 1,
-0.05581681, 0.1586527, 0.3911487, 0, 1, 0.8862745, 1,
-0.05536459, 1.080769, 0.07707597, 0, 1, 0.8901961, 1,
-0.05220413, 1.074613, -1.590306, 0, 1, 0.8980392, 1,
-0.05081363, 0.4601878, -0.632337, 0, 1, 0.9058824, 1,
-0.04995639, -0.2373435, -4.770415, 0, 1, 0.9098039, 1,
-0.04363249, 0.4157431, 0.03613051, 0, 1, 0.9176471, 1,
-0.041705, -1.51376, -4.761176, 0, 1, 0.9215686, 1,
-0.03959909, 0.8184543, -0.9157255, 0, 1, 0.9294118, 1,
-0.03429551, 0.7897515, -0.05296225, 0, 1, 0.9333333, 1,
-0.0286457, -0.3075289, -3.197821, 0, 1, 0.9411765, 1,
-0.02516934, 0.5429121, -0.4876929, 0, 1, 0.945098, 1,
-0.02287855, -0.5478984, -3.281901, 0, 1, 0.9529412, 1,
-0.01934634, -0.4365267, -4.551563, 0, 1, 0.9568627, 1,
-0.01174339, 0.7895961, 0.08547608, 0, 1, 0.9647059, 1,
-0.01132139, -1.434033, -2.178486, 0, 1, 0.9686275, 1,
-0.01109806, 1.177063, -2.752166, 0, 1, 0.9764706, 1,
-0.009475184, -1.179551, -2.685885, 0, 1, 0.9803922, 1,
-0.003254487, 0.8154094, 1.121708, 0, 1, 0.9882353, 1,
-0.002144628, -0.132431, -4.070281, 0, 1, 0.9921569, 1,
0.01115688, -0.6742084, 4.754433, 0, 1, 1, 1,
0.01166177, 0.6079271, 0.6634428, 0, 0.9921569, 1, 1,
0.01483935, 0.5196845, 1.346051, 0, 0.9882353, 1, 1,
0.01550733, -0.5789542, 1.065954, 0, 0.9803922, 1, 1,
0.0168058, 0.1914218, 0.04220819, 0, 0.9764706, 1, 1,
0.0175055, -0.2792542, 3.057998, 0, 0.9686275, 1, 1,
0.01858487, -0.5017117, 2.578561, 0, 0.9647059, 1, 1,
0.02168958, 0.276683, 0.2244753, 0, 0.9568627, 1, 1,
0.02240627, -1.203319, 3.453733, 0, 0.9529412, 1, 1,
0.0283655, -1.79716, 3.944949, 0, 0.945098, 1, 1,
0.02970318, 0.4627592, 0.2047668, 0, 0.9411765, 1, 1,
0.03221941, -1.142969, 2.072426, 0, 0.9333333, 1, 1,
0.03227118, 1.351371, -0.02648765, 0, 0.9294118, 1, 1,
0.03485616, 0.9849843, 0.69638, 0, 0.9215686, 1, 1,
0.03620222, 0.5408375, -2.190218, 0, 0.9176471, 1, 1,
0.03909725, 0.1449022, 1.992375, 0, 0.9098039, 1, 1,
0.04090213, -0.4208838, 3.416905, 0, 0.9058824, 1, 1,
0.04488627, -1.054384, 3.421438, 0, 0.8980392, 1, 1,
0.04561706, -0.8545699, 4.735639, 0, 0.8901961, 1, 1,
0.04664998, -0.1721206, 3.980071, 0, 0.8862745, 1, 1,
0.04765618, 0.09885638, 1.299765, 0, 0.8784314, 1, 1,
0.05107601, 0.2824807, 0.3947954, 0, 0.8745098, 1, 1,
0.05149791, -0.2365534, 3.833175, 0, 0.8666667, 1, 1,
0.05458752, 0.1142549, -1.299927, 0, 0.8627451, 1, 1,
0.05594053, -0.2282431, 3.382461, 0, 0.854902, 1, 1,
0.05808866, 0.7282749, 0.1983379, 0, 0.8509804, 1, 1,
0.06045314, 0.4704338, 1.148951, 0, 0.8431373, 1, 1,
0.06304707, 1.197848, 0.2297159, 0, 0.8392157, 1, 1,
0.06347325, -0.06578397, 0.9073502, 0, 0.8313726, 1, 1,
0.0638305, 1.193056, 0.815342, 0, 0.827451, 1, 1,
0.06682944, 0.7343002, -0.4374691, 0, 0.8196079, 1, 1,
0.06950116, -0.8574093, 3.801423, 0, 0.8156863, 1, 1,
0.07099148, -1.599281, 3.644724, 0, 0.8078431, 1, 1,
0.08033373, 2.346847, -0.1572767, 0, 0.8039216, 1, 1,
0.08044671, 0.2283707, -0.8870698, 0, 0.7960784, 1, 1,
0.08185318, 0.8066961, 0.2987808, 0, 0.7882353, 1, 1,
0.09008181, -0.2758619, 0.1910069, 0, 0.7843137, 1, 1,
0.09140936, -0.2092291, 0.8566728, 0, 0.7764706, 1, 1,
0.09608199, -0.9655253, 2.717777, 0, 0.772549, 1, 1,
0.0983408, 0.4283225, -1.521842, 0, 0.7647059, 1, 1,
0.1014096, 0.5317139, 1.26263, 0, 0.7607843, 1, 1,
0.1024346, 1.715257, -0.2959287, 0, 0.7529412, 1, 1,
0.1027258, -0.387195, 2.457358, 0, 0.7490196, 1, 1,
0.1037396, -0.1158572, 3.991276, 0, 0.7411765, 1, 1,
0.1038961, 0.9282855, 1.641071, 0, 0.7372549, 1, 1,
0.1042147, -0.9500962, 3.731633, 0, 0.7294118, 1, 1,
0.1121251, -1.334512, 3.721095, 0, 0.7254902, 1, 1,
0.1156346, -1.278486, 2.727635, 0, 0.7176471, 1, 1,
0.115718, 0.2031351, 2.267594, 0, 0.7137255, 1, 1,
0.1174782, -0.9656734, 1.901492, 0, 0.7058824, 1, 1,
0.1266867, 0.5506681, -0.1613247, 0, 0.6980392, 1, 1,
0.1272786, 1.305712, 0.4685792, 0, 0.6941177, 1, 1,
0.1289361, -0.4603591, 3.094611, 0, 0.6862745, 1, 1,
0.1318325, -0.5366273, 4.287976, 0, 0.682353, 1, 1,
0.1341318, 1.274211, 0.8367193, 0, 0.6745098, 1, 1,
0.1345085, 0.3266804, 0.08626646, 0, 0.6705883, 1, 1,
0.135401, -1.494235, 3.009527, 0, 0.6627451, 1, 1,
0.135877, 0.3903521, 2.889349, 0, 0.6588235, 1, 1,
0.1373575, -0.3912985, 3.438706, 0, 0.6509804, 1, 1,
0.1396133, -0.1660542, 6.090051, 0, 0.6470588, 1, 1,
0.1406011, 0.210842, 0.5232278, 0, 0.6392157, 1, 1,
0.1420962, -0.8330175, 1.575997, 0, 0.6352941, 1, 1,
0.1521998, -0.6658122, 3.069878, 0, 0.627451, 1, 1,
0.1551357, -1.888184, 2.363409, 0, 0.6235294, 1, 1,
0.1570713, 1.067347, 3.020129, 0, 0.6156863, 1, 1,
0.1638353, -0.04958905, 2.422638, 0, 0.6117647, 1, 1,
0.1675043, -1.179664, 3.945811, 0, 0.6039216, 1, 1,
0.1679654, -2.11631, 1.368397, 0, 0.5960785, 1, 1,
0.170652, 0.08923963, 1.211982, 0, 0.5921569, 1, 1,
0.1712689, -0.6088623, 2.604457, 0, 0.5843138, 1, 1,
0.1730628, 1.588558, 1.048347, 0, 0.5803922, 1, 1,
0.1735824, -0.5567704, 2.013868, 0, 0.572549, 1, 1,
0.1750986, 1.441037, -0.08156904, 0, 0.5686275, 1, 1,
0.1757051, 1.563231, 0.8871786, 0, 0.5607843, 1, 1,
0.1759305, -1.050911, 4.167589, 0, 0.5568628, 1, 1,
0.182142, -0.6349785, 4.020169, 0, 0.5490196, 1, 1,
0.1836831, 0.5511591, 1.816491, 0, 0.5450981, 1, 1,
0.1884435, -0.2053078, 2.605413, 0, 0.5372549, 1, 1,
0.1912353, 0.6341913, -0.5556662, 0, 0.5333334, 1, 1,
0.1915264, -0.311038, 3.03406, 0, 0.5254902, 1, 1,
0.1926013, 0.4962793, 0.06285409, 0, 0.5215687, 1, 1,
0.2010467, 2.344049, 1.001372, 0, 0.5137255, 1, 1,
0.2018158, -0.2287435, 4.074752, 0, 0.509804, 1, 1,
0.2043387, 0.9399228, 0.6465465, 0, 0.5019608, 1, 1,
0.2080967, -1.680945, 5.507988, 0, 0.4941176, 1, 1,
0.2139555, -1.131291, 3.174377, 0, 0.4901961, 1, 1,
0.2244603, 0.8416342, -0.6024061, 0, 0.4823529, 1, 1,
0.2262005, 0.32677, -0.1431127, 0, 0.4784314, 1, 1,
0.2262499, -0.06046315, 1.415446, 0, 0.4705882, 1, 1,
0.2296298, -1.286889, 4.253568, 0, 0.4666667, 1, 1,
0.2314803, -0.356301, 2.381453, 0, 0.4588235, 1, 1,
0.2323797, -0.4493248, 2.947706, 0, 0.454902, 1, 1,
0.2327769, 0.3147995, 1.329193, 0, 0.4470588, 1, 1,
0.2359148, -2.039598, 3.34346, 0, 0.4431373, 1, 1,
0.2407746, -2.228907, 4.205733, 0, 0.4352941, 1, 1,
0.2425773, 0.5893705, 0.4557624, 0, 0.4313726, 1, 1,
0.2427918, -0.2272541, 2.330091, 0, 0.4235294, 1, 1,
0.2515239, -0.04600401, 1.5154, 0, 0.4196078, 1, 1,
0.2523829, 1.10835, -0.2572851, 0, 0.4117647, 1, 1,
0.2572736, -0.2982659, 1.529711, 0, 0.4078431, 1, 1,
0.2581217, 0.2367629, 1.096216, 0, 0.4, 1, 1,
0.2583603, -1.476375, 3.088003, 0, 0.3921569, 1, 1,
0.2597851, -0.09442079, 1.549793, 0, 0.3882353, 1, 1,
0.2603559, -1.572746, 3.921929, 0, 0.3803922, 1, 1,
0.2720765, 0.9374393, -0.3577712, 0, 0.3764706, 1, 1,
0.2726125, -2.48318, 4.759638, 0, 0.3686275, 1, 1,
0.2767821, 1.405474, -0.3321631, 0, 0.3647059, 1, 1,
0.28263, -1.855714, 1.595519, 0, 0.3568628, 1, 1,
0.2841175, -0.3135511, 2.276169, 0, 0.3529412, 1, 1,
0.2865435, -1.20645, 3.100233, 0, 0.345098, 1, 1,
0.287735, 0.2932672, 1.379542, 0, 0.3411765, 1, 1,
0.2880735, 0.8491385, -0.2109382, 0, 0.3333333, 1, 1,
0.2898201, -0.307071, 2.291813, 0, 0.3294118, 1, 1,
0.2903028, 0.05339284, 2.316825, 0, 0.3215686, 1, 1,
0.2910297, 0.6421548, 0.1816368, 0, 0.3176471, 1, 1,
0.2932468, -0.1793522, 0.1486619, 0, 0.3098039, 1, 1,
0.299704, -0.542252, 2.626413, 0, 0.3058824, 1, 1,
0.3003749, 2.06479, 0.5930076, 0, 0.2980392, 1, 1,
0.3036006, -0.756333, 2.931293, 0, 0.2901961, 1, 1,
0.305587, -0.05238929, 0.7873743, 0, 0.2862745, 1, 1,
0.3086853, -0.1970062, -0.005370715, 0, 0.2784314, 1, 1,
0.3095479, 0.4125208, 1.315088, 0, 0.2745098, 1, 1,
0.3135917, 0.01205196, 1.712411, 0, 0.2666667, 1, 1,
0.3149597, -0.5301557, 2.311849, 0, 0.2627451, 1, 1,
0.3173639, -0.589887, 2.480399, 0, 0.254902, 1, 1,
0.3197754, 1.164979, -0.05384161, 0, 0.2509804, 1, 1,
0.3212467, -0.837956, 1.897403, 0, 0.2431373, 1, 1,
0.3219682, -0.5707905, 3.589122, 0, 0.2392157, 1, 1,
0.3221259, -0.4622052, 2.88545, 0, 0.2313726, 1, 1,
0.3232882, -0.1422316, 2.078916, 0, 0.227451, 1, 1,
0.3238759, -0.3486919, 3.507116, 0, 0.2196078, 1, 1,
0.3259801, -0.3177699, 2.042209, 0, 0.2156863, 1, 1,
0.3265068, -0.4679157, 2.705986, 0, 0.2078431, 1, 1,
0.3363184, 1.13272, 0.8714424, 0, 0.2039216, 1, 1,
0.3411866, -2.089711, 3.556096, 0, 0.1960784, 1, 1,
0.3452106, -1.351904, 3.331516, 0, 0.1882353, 1, 1,
0.3454125, 0.7184309, 2.642793, 0, 0.1843137, 1, 1,
0.3465723, -0.8827645, 2.298992, 0, 0.1764706, 1, 1,
0.349422, 0.03153678, 1.394551, 0, 0.172549, 1, 1,
0.3552881, -0.1718215, 2.416785, 0, 0.1647059, 1, 1,
0.3642445, 0.02032718, 2.458714, 0, 0.1607843, 1, 1,
0.3676074, 0.6725142, -0.2739463, 0, 0.1529412, 1, 1,
0.3689998, 0.1427729, 2.082759, 0, 0.1490196, 1, 1,
0.3708938, 1.541736, -0.7080363, 0, 0.1411765, 1, 1,
0.3721277, 0.629551, -1.745605, 0, 0.1372549, 1, 1,
0.3722202, 0.392339, -1.595074, 0, 0.1294118, 1, 1,
0.3737369, 0.2390625, 2.508103, 0, 0.1254902, 1, 1,
0.3752052, 0.6672869, -1.749853, 0, 0.1176471, 1, 1,
0.3788526, -0.02616393, 0.7095528, 0, 0.1137255, 1, 1,
0.3834857, 0.3168215, 0.9774963, 0, 0.1058824, 1, 1,
0.3868243, -0.2266165, 2.176645, 0, 0.09803922, 1, 1,
0.3911077, 0.2282688, 0.4687156, 0, 0.09411765, 1, 1,
0.3929381, -1.076367, 1.175705, 0, 0.08627451, 1, 1,
0.3961006, 1.833714, 1.74267, 0, 0.08235294, 1, 1,
0.3962297, 1.984517, 0.2710364, 0, 0.07450981, 1, 1,
0.3966645, -0.04717615, 1.996896, 0, 0.07058824, 1, 1,
0.4017937, 1.469635, 1.031288, 0, 0.0627451, 1, 1,
0.4027346, 0.08497042, 1.838593, 0, 0.05882353, 1, 1,
0.4098114, 1.050765, 1.214532, 0, 0.05098039, 1, 1,
0.4139291, 0.2334562, 2.21338, 0, 0.04705882, 1, 1,
0.4141451, 1.138953, -0.592019, 0, 0.03921569, 1, 1,
0.414782, 1.029808, 1.259906, 0, 0.03529412, 1, 1,
0.4201701, -0.9796429, 1.589022, 0, 0.02745098, 1, 1,
0.4241233, 0.7090772, 0.6268378, 0, 0.02352941, 1, 1,
0.4243715, 1.433154, 0.7225587, 0, 0.01568628, 1, 1,
0.4272322, -0.4250312, 1.454805, 0, 0.01176471, 1, 1,
0.4286601, -0.05178946, 1.714061, 0, 0.003921569, 1, 1,
0.4338847, 0.2222253, 1.116865, 0.003921569, 0, 1, 1,
0.4353507, 0.468474, 0.4798203, 0.007843138, 0, 1, 1,
0.4388835, 0.8188713, -0.3262808, 0.01568628, 0, 1, 1,
0.4409598, -0.3771852, 3.876256, 0.01960784, 0, 1, 1,
0.4419451, 0.228115, 0.5727387, 0.02745098, 0, 1, 1,
0.442486, -0.1241715, 1.922263, 0.03137255, 0, 1, 1,
0.4434804, -1.081133, 3.116821, 0.03921569, 0, 1, 1,
0.4445624, -0.6920273, 1.576976, 0.04313726, 0, 1, 1,
0.4465434, 0.7960976, 1.736887, 0.05098039, 0, 1, 1,
0.4469994, 2.465113, 0.617829, 0.05490196, 0, 1, 1,
0.4493957, -0.1419723, 3.854272, 0.0627451, 0, 1, 1,
0.4495672, -0.1040318, 0.08077462, 0.06666667, 0, 1, 1,
0.4517726, -0.9214016, 2.903439, 0.07450981, 0, 1, 1,
0.4563261, 0.2329119, 0.7577633, 0.07843138, 0, 1, 1,
0.4580985, 1.57787, -0.9378846, 0.08627451, 0, 1, 1,
0.458429, -0.7897272, 2.353358, 0.09019608, 0, 1, 1,
0.4586215, 0.8053413, -0.3075713, 0.09803922, 0, 1, 1,
0.4628268, -0.3972396, 1.961613, 0.1058824, 0, 1, 1,
0.4655566, 0.4785753, 0.8161783, 0.1098039, 0, 1, 1,
0.4659704, -0.5932459, 4.869956, 0.1176471, 0, 1, 1,
0.4690468, -0.407532, 4.054361, 0.1215686, 0, 1, 1,
0.4704777, 1.278006, -0.7047853, 0.1294118, 0, 1, 1,
0.4715416, -0.1553864, 0.6728567, 0.1333333, 0, 1, 1,
0.4722231, -1.072361, 4.304641, 0.1411765, 0, 1, 1,
0.47281, 1.003649, -1.304389, 0.145098, 0, 1, 1,
0.4738496, -2.339226, 2.765047, 0.1529412, 0, 1, 1,
0.4753605, -1.313149, 2.275332, 0.1568628, 0, 1, 1,
0.4774018, 0.7584032, 1.765167, 0.1647059, 0, 1, 1,
0.4798384, -0.1805358, 1.752887, 0.1686275, 0, 1, 1,
0.4864684, -1.256234, 3.195957, 0.1764706, 0, 1, 1,
0.4898002, 0.9427998, 0.7628994, 0.1803922, 0, 1, 1,
0.4937057, 0.9539459, 0.1374703, 0.1882353, 0, 1, 1,
0.4948718, 0.6550214, 0.6504835, 0.1921569, 0, 1, 1,
0.5010736, 0.8056244, -0.6483204, 0.2, 0, 1, 1,
0.5020894, -0.3468593, 2.031071, 0.2078431, 0, 1, 1,
0.5025274, 2.431323, 0.08315674, 0.2117647, 0, 1, 1,
0.5026045, 1.095525, 0.4418949, 0.2196078, 0, 1, 1,
0.5099596, 0.6576186, -1.868253, 0.2235294, 0, 1, 1,
0.5146963, -0.1503984, 1.257794, 0.2313726, 0, 1, 1,
0.5311541, -0.720189, 3.833878, 0.2352941, 0, 1, 1,
0.5333463, 1.336032, 2.449335, 0.2431373, 0, 1, 1,
0.5358261, -0.549315, 2.479966, 0.2470588, 0, 1, 1,
0.5375396, -1.43943, 5.189, 0.254902, 0, 1, 1,
0.5404784, -0.02797568, 1.687181, 0.2588235, 0, 1, 1,
0.5506465, -1.355124, 2.659204, 0.2666667, 0, 1, 1,
0.5540213, -0.542756, 2.190977, 0.2705882, 0, 1, 1,
0.5558048, 0.303657, 2.125762, 0.2784314, 0, 1, 1,
0.561975, 0.9658436, 1.736516, 0.282353, 0, 1, 1,
0.5640763, 1.419794, 0.3942534, 0.2901961, 0, 1, 1,
0.5690926, 2.152731, -0.4042578, 0.2941177, 0, 1, 1,
0.5693458, -0.3789073, 2.746928, 0.3019608, 0, 1, 1,
0.5694113, 0.626529, 0.2496811, 0.3098039, 0, 1, 1,
0.5754602, -0.9352417, 2.938252, 0.3137255, 0, 1, 1,
0.5776814, 2.489029, -0.9387419, 0.3215686, 0, 1, 1,
0.5811615, -0.1416386, 1.003944, 0.3254902, 0, 1, 1,
0.5838661, -1.049213, 3.160076, 0.3333333, 0, 1, 1,
0.5844694, -0.643691, 2.737941, 0.3372549, 0, 1, 1,
0.5920222, 0.7451105, -0.2274504, 0.345098, 0, 1, 1,
0.5946041, 1.85571, 1.952932, 0.3490196, 0, 1, 1,
0.596221, 1.272018, 0.05895185, 0.3568628, 0, 1, 1,
0.6000949, -0.120856, 2.096825, 0.3607843, 0, 1, 1,
0.6003155, -1.109633, 2.006228, 0.3686275, 0, 1, 1,
0.6048683, 0.7389307, 1.19613, 0.372549, 0, 1, 1,
0.6051772, 0.07867335, 0.5222772, 0.3803922, 0, 1, 1,
0.6074985, -2.381004, 2.161334, 0.3843137, 0, 1, 1,
0.6086186, -0.3300888, 2.463199, 0.3921569, 0, 1, 1,
0.6106771, -0.1825002, 2.872139, 0.3960784, 0, 1, 1,
0.612347, -2.790279, 2.437407, 0.4039216, 0, 1, 1,
0.6173995, -0.6222756, 1.741086, 0.4117647, 0, 1, 1,
0.6223766, -0.5666062, 2.191476, 0.4156863, 0, 1, 1,
0.6280015, 2.171123, 0.5727699, 0.4235294, 0, 1, 1,
0.6293637, 1.187029, 1.501816, 0.427451, 0, 1, 1,
0.6294849, 0.6530115, 1.840358, 0.4352941, 0, 1, 1,
0.6361219, -1.656733, 3.18993, 0.4392157, 0, 1, 1,
0.6426638, 1.76941, 0.2865227, 0.4470588, 0, 1, 1,
0.6442631, 1.713476, 0.1166803, 0.4509804, 0, 1, 1,
0.6572835, 0.9210191, -1.240203, 0.4588235, 0, 1, 1,
0.6644066, 1.409406, 0.401027, 0.4627451, 0, 1, 1,
0.6664153, 0.2070768, 2.25956, 0.4705882, 0, 1, 1,
0.666472, 1.016908, 0.2133311, 0.4745098, 0, 1, 1,
0.6695906, 0.4793949, 1.909582, 0.4823529, 0, 1, 1,
0.6757433, -1.277175, 3.951847, 0.4862745, 0, 1, 1,
0.6792483, -0.4045458, 2.81743, 0.4941176, 0, 1, 1,
0.679462, 0.6346948, -0.7902728, 0.5019608, 0, 1, 1,
0.6824986, -0.2916682, 3.553773, 0.5058824, 0, 1, 1,
0.6849146, 1.543934, -1.312459, 0.5137255, 0, 1, 1,
0.6852828, 0.109422, 1.750737, 0.5176471, 0, 1, 1,
0.6866961, -1.200277, 2.925576, 0.5254902, 0, 1, 1,
0.6916396, 0.8088279, 1.237841, 0.5294118, 0, 1, 1,
0.6949199, -0.07350903, 2.661433, 0.5372549, 0, 1, 1,
0.7025387, -1.166461, 3.36582, 0.5411765, 0, 1, 1,
0.708308, -1.379226, 1.50667, 0.5490196, 0, 1, 1,
0.7098121, 0.6033518, -0.7050335, 0.5529412, 0, 1, 1,
0.7173106, -0.4383321, 2.31565, 0.5607843, 0, 1, 1,
0.7196506, -1.470199, 3.290054, 0.5647059, 0, 1, 1,
0.7198224, -0.09597391, 3.516201, 0.572549, 0, 1, 1,
0.7237887, -0.568017, 2.329391, 0.5764706, 0, 1, 1,
0.7285621, 0.2251744, 1.529966, 0.5843138, 0, 1, 1,
0.7293044, 0.4016552, 0.4585902, 0.5882353, 0, 1, 1,
0.7336731, 0.5566698, 0.0557251, 0.5960785, 0, 1, 1,
0.7367731, -1.657012, 1.782873, 0.6039216, 0, 1, 1,
0.7407281, -0.9377842, 3.073468, 0.6078432, 0, 1, 1,
0.7433491, 0.3470428, 0.9401861, 0.6156863, 0, 1, 1,
0.7437167, 0.5835529, 0.1635807, 0.6196079, 0, 1, 1,
0.7459371, -0.2503746, 1.309306, 0.627451, 0, 1, 1,
0.7475421, -0.5170613, 3.129738, 0.6313726, 0, 1, 1,
0.7533638, 0.1005099, 0.3611197, 0.6392157, 0, 1, 1,
0.7539254, -0.9422841, 3.575282, 0.6431373, 0, 1, 1,
0.757136, -1.70747, 2.327919, 0.6509804, 0, 1, 1,
0.7598431, -0.3301305, 0.7902775, 0.654902, 0, 1, 1,
0.7600862, -1.0334, 3.478349, 0.6627451, 0, 1, 1,
0.7605111, -0.1651502, 2.537801, 0.6666667, 0, 1, 1,
0.7607561, -0.4491532, 1.78189, 0.6745098, 0, 1, 1,
0.7607791, 1.263246, 1.397926, 0.6784314, 0, 1, 1,
0.7621624, -1.403353, 1.306059, 0.6862745, 0, 1, 1,
0.7643643, -1.179661, 1.472398, 0.6901961, 0, 1, 1,
0.7654712, 2.418052, 2.024858, 0.6980392, 0, 1, 1,
0.7656446, 0.208692, 0.4933754, 0.7058824, 0, 1, 1,
0.7709984, -0.3927516, 2.813717, 0.7098039, 0, 1, 1,
0.7818198, -0.8885649, 1.4691, 0.7176471, 0, 1, 1,
0.7842127, -0.25602, 0.2274205, 0.7215686, 0, 1, 1,
0.7874753, -0.8546156, 3.120434, 0.7294118, 0, 1, 1,
0.7893769, -1.279852, 3.03463, 0.7333333, 0, 1, 1,
0.7922598, -0.2232354, 1.647918, 0.7411765, 0, 1, 1,
0.799611, -0.7251962, 2.514443, 0.7450981, 0, 1, 1,
0.8001637, 0.07805192, 1.363768, 0.7529412, 0, 1, 1,
0.8038117, 0.8579463, -0.3543838, 0.7568628, 0, 1, 1,
0.8060557, -1.092285, 1.305462, 0.7647059, 0, 1, 1,
0.8141276, -0.4157201, 2.450513, 0.7686275, 0, 1, 1,
0.8154707, 0.5482139, 1.822967, 0.7764706, 0, 1, 1,
0.8171934, 1.226726, 1.773782, 0.7803922, 0, 1, 1,
0.8202016, -0.4018861, 2.136386, 0.7882353, 0, 1, 1,
0.8212674, -0.269738, 0.9785107, 0.7921569, 0, 1, 1,
0.8213711, -1.669868, 2.756299, 0.8, 0, 1, 1,
0.8214457, -1.243187, 1.997472, 0.8078431, 0, 1, 1,
0.8246137, -1.423406, 3.976741, 0.8117647, 0, 1, 1,
0.8254839, -0.07989523, 2.325562, 0.8196079, 0, 1, 1,
0.8255534, -0.9455138, 4.550685, 0.8235294, 0, 1, 1,
0.8282782, -0.1448365, 2.185367, 0.8313726, 0, 1, 1,
0.8402149, -0.09085838, 1.010398, 0.8352941, 0, 1, 1,
0.8406119, 0.5705287, 0.7008629, 0.8431373, 0, 1, 1,
0.8445811, -1.702498, 2.137522, 0.8470588, 0, 1, 1,
0.8456946, 0.8111356, 1.131029, 0.854902, 0, 1, 1,
0.8481832, 0.3288659, 1.032289, 0.8588235, 0, 1, 1,
0.8599328, -1.456568, 2.372318, 0.8666667, 0, 1, 1,
0.8599834, -0.04956946, 2.378596, 0.8705882, 0, 1, 1,
0.8620482, 0.4884064, 1.497485, 0.8784314, 0, 1, 1,
0.8636048, -2.201828, 4.285431, 0.8823529, 0, 1, 1,
0.8665602, -0.7933179, 1.889269, 0.8901961, 0, 1, 1,
0.867283, -0.750795, 1.026307, 0.8941177, 0, 1, 1,
0.8714883, 0.2702323, 0.1181819, 0.9019608, 0, 1, 1,
0.8759788, 0.9555737, 0.51042, 0.9098039, 0, 1, 1,
0.8771808, 0.9994617, -0.9848248, 0.9137255, 0, 1, 1,
0.8786317, 0.1028287, 2.321944, 0.9215686, 0, 1, 1,
0.8851767, -0.02451915, 2.167147, 0.9254902, 0, 1, 1,
0.8877279, 0.7407922, -1.629548, 0.9333333, 0, 1, 1,
0.887951, 1.15262, 0.1593273, 0.9372549, 0, 1, 1,
0.8881035, -0.3525266, 3.25067, 0.945098, 0, 1, 1,
0.8889657, -0.1885916, 4.074383, 0.9490196, 0, 1, 1,
0.8923989, -0.5111297, 1.659336, 0.9568627, 0, 1, 1,
0.8933985, 0.1975005, 2.334385, 0.9607843, 0, 1, 1,
0.9056317, 1.199502, 3.587603, 0.9686275, 0, 1, 1,
0.9114345, 1.368422, 2.627399, 0.972549, 0, 1, 1,
0.9141946, -1.229403, 2.457957, 0.9803922, 0, 1, 1,
0.9198622, 0.3828846, -0.2535726, 0.9843137, 0, 1, 1,
0.9241616, -0.8349941, 2.595332, 0.9921569, 0, 1, 1,
0.9254141, 0.02566396, 0.2103281, 0.9960784, 0, 1, 1,
0.9280558, 0.7063597, -0.8816267, 1, 0, 0.9960784, 1,
0.9341592, 0.2473053, 0.4648369, 1, 0, 0.9882353, 1,
0.9342293, 1.046477, 3.113784, 1, 0, 0.9843137, 1,
0.9355819, -0.7763456, 1.497353, 1, 0, 0.9764706, 1,
0.9474416, -0.4464967, 3.978804, 1, 0, 0.972549, 1,
0.9503868, -0.440641, 0.3129558, 1, 0, 0.9647059, 1,
0.9510864, -0.52762, 1.467242, 1, 0, 0.9607843, 1,
0.9529334, -0.2928522, 3.534553, 1, 0, 0.9529412, 1,
0.9574454, 0.6615791, 0.9357677, 1, 0, 0.9490196, 1,
0.9733163, -0.4460005, 2.226739, 1, 0, 0.9411765, 1,
0.9868196, -0.2894502, 0.9904127, 1, 0, 0.9372549, 1,
0.9904094, -0.5133988, 1.325563, 1, 0, 0.9294118, 1,
0.9958953, -0.8465219, 2.358692, 1, 0, 0.9254902, 1,
1.01291, -1.181984, 1.599079, 1, 0, 0.9176471, 1,
1.016753, 0.248187, 1.590085, 1, 0, 0.9137255, 1,
1.017234, 1.009227, 1.000752, 1, 0, 0.9058824, 1,
1.023239, -2.155594, 2.497334, 1, 0, 0.9019608, 1,
1.028191, -0.7921959, 1.712973, 1, 0, 0.8941177, 1,
1.039775, 0.621587, 1.737817, 1, 0, 0.8862745, 1,
1.040228, -0.1555137, 2.819317, 1, 0, 0.8823529, 1,
1.042761, -0.9508263, 3.291132, 1, 0, 0.8745098, 1,
1.042955, 0.4273083, -0.04740675, 1, 0, 0.8705882, 1,
1.043504, 1.387283, 1.963096, 1, 0, 0.8627451, 1,
1.043888, 1.355624, 0.114933, 1, 0, 0.8588235, 1,
1.046405, 1.076336, -0.7725804, 1, 0, 0.8509804, 1,
1.047013, -0.3982901, 1.914541, 1, 0, 0.8470588, 1,
1.06143, -0.1489734, 2.185659, 1, 0, 0.8392157, 1,
1.065736, 0.9297996, 1.755471, 1, 0, 0.8352941, 1,
1.072491, -1.590335, 3.309977, 1, 0, 0.827451, 1,
1.074739, 0.184105, 0.7228757, 1, 0, 0.8235294, 1,
1.07551, 1.245657, 0.319897, 1, 0, 0.8156863, 1,
1.081902, -0.7819547, 4.081719, 1, 0, 0.8117647, 1,
1.086036, 0.0603812, 1.118118, 1, 0, 0.8039216, 1,
1.090091, -1.026634, 2.600594, 1, 0, 0.7960784, 1,
1.097163, 1.829744, 1.767737, 1, 0, 0.7921569, 1,
1.102895, 0.07040902, 3.161819, 1, 0, 0.7843137, 1,
1.114761, -1.559559, 1.75399, 1, 0, 0.7803922, 1,
1.114768, 1.157451, 2.124222, 1, 0, 0.772549, 1,
1.115035, -0.1997142, 1.10936, 1, 0, 0.7686275, 1,
1.115186, 1.275756, -0.2957053, 1, 0, 0.7607843, 1,
1.115611, -0.1083701, 0.8895417, 1, 0, 0.7568628, 1,
1.116276, -0.4595088, 3.420184, 1, 0, 0.7490196, 1,
1.126659, -0.02246751, 2.041464, 1, 0, 0.7450981, 1,
1.127721, 0.4895358, 1.325505, 1, 0, 0.7372549, 1,
1.143518, -0.758687, 2.359567, 1, 0, 0.7333333, 1,
1.146404, -1.674552, 3.76509, 1, 0, 0.7254902, 1,
1.149015, -0.1811062, 3.154045, 1, 0, 0.7215686, 1,
1.151255, -0.01951887, 1.72566, 1, 0, 0.7137255, 1,
1.174494, -1.365683, 0.8368743, 1, 0, 0.7098039, 1,
1.180523, 1.426428, 1.357438, 1, 0, 0.7019608, 1,
1.180844, -1.233012, 2.635053, 1, 0, 0.6941177, 1,
1.186395, 0.5682534, 1.211064, 1, 0, 0.6901961, 1,
1.188406, -0.2155257, 2.914015, 1, 0, 0.682353, 1,
1.18996, -0.7685316, 1.4004, 1, 0, 0.6784314, 1,
1.194424, -0.7375125, 2.542107, 1, 0, 0.6705883, 1,
1.199062, -0.164075, 1.511375, 1, 0, 0.6666667, 1,
1.201704, 0.4118149, 2.186948, 1, 0, 0.6588235, 1,
1.208259, -0.0344866, 1.354523, 1, 0, 0.654902, 1,
1.209423, -2.054032, 1.730852, 1, 0, 0.6470588, 1,
1.216917, 0.9735219, 0.9067616, 1, 0, 0.6431373, 1,
1.223164, 0.3213696, 1.401453, 1, 0, 0.6352941, 1,
1.223777, 0.2781295, 1.000429, 1, 0, 0.6313726, 1,
1.22673, -1.302326, 3.114743, 1, 0, 0.6235294, 1,
1.233761, -0.606842, 1.041728, 1, 0, 0.6196079, 1,
1.237564, 0.761989, 0.1967547, 1, 0, 0.6117647, 1,
1.242953, 0.6264914, 1.014453, 1, 0, 0.6078432, 1,
1.251008, -0.6016489, -0.1523926, 1, 0, 0.6, 1,
1.251769, -1.134373, 3.110154, 1, 0, 0.5921569, 1,
1.252025, -0.3024147, -0.1012364, 1, 0, 0.5882353, 1,
1.252127, 0.1907884, 2.027702, 1, 0, 0.5803922, 1,
1.255014, -0.2030343, 2.221496, 1, 0, 0.5764706, 1,
1.26256, 0.7401397, 2.224396, 1, 0, 0.5686275, 1,
1.271855, 0.6865637, 3.448335, 1, 0, 0.5647059, 1,
1.279074, -0.2809758, 3.514349, 1, 0, 0.5568628, 1,
1.293732, 0.8524958, 1.340682, 1, 0, 0.5529412, 1,
1.295374, 0.7918136, 2.403021, 1, 0, 0.5450981, 1,
1.296631, 0.3354928, 1.850756, 1, 0, 0.5411765, 1,
1.299414, 0.1753474, 0.1608077, 1, 0, 0.5333334, 1,
1.299497, -0.1848995, 1.807278, 1, 0, 0.5294118, 1,
1.300394, 0.141299, 0.871549, 1, 0, 0.5215687, 1,
1.306412, 0.3488611, 1.284879, 1, 0, 0.5176471, 1,
1.311404, 1.121695, 2.030944, 1, 0, 0.509804, 1,
1.324938, 0.6756331, -0.6141899, 1, 0, 0.5058824, 1,
1.330154, -0.2231656, 1.395317, 1, 0, 0.4980392, 1,
1.333405, 0.7383576, 0.1791439, 1, 0, 0.4901961, 1,
1.334605, 0.6807632, 1.192439, 1, 0, 0.4862745, 1,
1.341568, 1.357676, 1.908791, 1, 0, 0.4784314, 1,
1.355222, -0.7704264, 0.2903755, 1, 0, 0.4745098, 1,
1.358721, -0.1217709, 1.617383, 1, 0, 0.4666667, 1,
1.371127, -0.09094974, 0.9751688, 1, 0, 0.4627451, 1,
1.378259, 0.2567231, 1.872949, 1, 0, 0.454902, 1,
1.383231, 0.6506476, 1.703323, 1, 0, 0.4509804, 1,
1.384443, 0.103341, 0.3955016, 1, 0, 0.4431373, 1,
1.402625, -0.5595126, 2.855097, 1, 0, 0.4392157, 1,
1.403286, 0.2247621, 1.903888, 1, 0, 0.4313726, 1,
1.407583, -2.247521, 2.880577, 1, 0, 0.427451, 1,
1.446272, 0.3312885, 2.637357, 1, 0, 0.4196078, 1,
1.453995, -1.432959, 3.10981, 1, 0, 0.4156863, 1,
1.457347, -0.7080075, 1.262903, 1, 0, 0.4078431, 1,
1.464642, -0.2604075, 0.9375945, 1, 0, 0.4039216, 1,
1.470531, -1.974646, 2.012728, 1, 0, 0.3960784, 1,
1.474638, -1.053502, 1.034002, 1, 0, 0.3882353, 1,
1.475593, -0.39342, 2.225183, 1, 0, 0.3843137, 1,
1.476128, 1.394039, 0.8110012, 1, 0, 0.3764706, 1,
1.482439, -0.09707621, 1.764903, 1, 0, 0.372549, 1,
1.487098, -0.5731797, -1.590106, 1, 0, 0.3647059, 1,
1.497641, -0.947149, 1.251098, 1, 0, 0.3607843, 1,
1.497648, -1.23591, 3.185462, 1, 0, 0.3529412, 1,
1.502559, -0.2668428, 1.484044, 1, 0, 0.3490196, 1,
1.513427, -0.7373987, 0.2239687, 1, 0, 0.3411765, 1,
1.519305, -1.104564, 0.6682726, 1, 0, 0.3372549, 1,
1.526471, 1.269048, 1.443881, 1, 0, 0.3294118, 1,
1.542225, -1.24307, 3.680709, 1, 0, 0.3254902, 1,
1.54753, -0.09986927, 3.32036, 1, 0, 0.3176471, 1,
1.5504, -0.8703781, 2.151728, 1, 0, 0.3137255, 1,
1.576708, 2.253705, 1.840355, 1, 0, 0.3058824, 1,
1.582085, -1.990679, 2.151019, 1, 0, 0.2980392, 1,
1.589956, -0.06781197, 2.140568, 1, 0, 0.2941177, 1,
1.600405, -0.3077339, -0.6615195, 1, 0, 0.2862745, 1,
1.62872, -0.9571884, 3.393204, 1, 0, 0.282353, 1,
1.657489, 0.04335019, 3.217889, 1, 0, 0.2745098, 1,
1.704662, -0.6894071, 0.9649879, 1, 0, 0.2705882, 1,
1.705107, -0.5970833, 0.857421, 1, 0, 0.2627451, 1,
1.723628, 1.041686, -0.8431092, 1, 0, 0.2588235, 1,
1.740687, 0.6976799, 1.764857, 1, 0, 0.2509804, 1,
1.741573, -0.09796205, 1.199916, 1, 0, 0.2470588, 1,
1.744447, -1.218503, 3.062663, 1, 0, 0.2392157, 1,
1.760604, 1.474591, 2.060312, 1, 0, 0.2352941, 1,
1.773408, 1.467018, 2.39006, 1, 0, 0.227451, 1,
1.77553, 0.5713646, 1.019537, 1, 0, 0.2235294, 1,
1.795769, 0.6036574, 1.680577, 1, 0, 0.2156863, 1,
1.800056, 0.1271563, 2.866337, 1, 0, 0.2117647, 1,
1.800232, 1.243867, 1.706234, 1, 0, 0.2039216, 1,
1.82869, 0.3322391, 0.7063019, 1, 0, 0.1960784, 1,
1.834715, -0.928991, 2.376689, 1, 0, 0.1921569, 1,
1.879904, -0.9516707, 1.761541, 1, 0, 0.1843137, 1,
1.907386, 0.7333961, 1.412145, 1, 0, 0.1803922, 1,
1.91543, -0.3197722, 1.872159, 1, 0, 0.172549, 1,
1.925536, -0.2965785, 1.855873, 1, 0, 0.1686275, 1,
1.948977, 0.03024398, 0.3330974, 1, 0, 0.1607843, 1,
1.97915, -0.5252445, 0.1416694, 1, 0, 0.1568628, 1,
1.989879, -1.915097, 2.837405, 1, 0, 0.1490196, 1,
1.99013, 1.029826, 0.1125265, 1, 0, 0.145098, 1,
2.03969, -2.017448, 2.937809, 1, 0, 0.1372549, 1,
2.040514, 1.164251, 0.2538179, 1, 0, 0.1333333, 1,
2.083359, -0.2948955, 1.627524, 1, 0, 0.1254902, 1,
2.084042, 0.5584326, 1.224594, 1, 0, 0.1215686, 1,
2.098104, -0.2940656, 1.822999, 1, 0, 0.1137255, 1,
2.101211, -0.261709, -0.2648835, 1, 0, 0.1098039, 1,
2.101511, -0.9667208, 4.008665, 1, 0, 0.1019608, 1,
2.135798, 1.14866, 1.466809, 1, 0, 0.09411765, 1,
2.168841, 0.6779805, 3.237477, 1, 0, 0.09019608, 1,
2.184791, 0.1385365, 2.925782, 1, 0, 0.08235294, 1,
2.275755, 0.4874048, 0.1821001, 1, 0, 0.07843138, 1,
2.277986, 2.439312, 2.305381, 1, 0, 0.07058824, 1,
2.337806, -0.001311277, 1.677369, 1, 0, 0.06666667, 1,
2.361776, 0.8165095, 1.277468, 1, 0, 0.05882353, 1,
2.366894, -0.8920557, 2.259132, 1, 0, 0.05490196, 1,
2.422553, -0.8362988, 1.640961, 1, 0, 0.04705882, 1,
2.453639, -1.507136, 2.142503, 1, 0, 0.04313726, 1,
2.545371, 0.6039342, 1.318319, 1, 0, 0.03529412, 1,
2.614203, -1.22049, 1.254972, 1, 0, 0.03137255, 1,
2.615887, 0.07848361, 1.556219, 1, 0, 0.02352941, 1,
2.657885, -0.3421851, 1.495785, 1, 0, 0.01960784, 1,
2.779098, 0.3500505, 3.167926, 1, 0, 0.01176471, 1,
2.887702, -0.1650418, 2.11018, 1, 0, 0.007843138, 1
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
-0.1344365, -3.89318, -8.45208, 0, -0.5, 0.5, 0.5,
-0.1344365, -3.89318, -8.45208, 1, -0.5, 0.5, 0.5,
-0.1344365, -3.89318, -8.45208, 1, 1.5, 0.5, 0.5,
-0.1344365, -3.89318, -8.45208, 0, 1.5, 0.5, 0.5
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
-4.18108, 0.07903862, -8.45208, 0, -0.5, 0.5, 0.5,
-4.18108, 0.07903862, -8.45208, 1, -0.5, 0.5, 0.5,
-4.18108, 0.07903862, -8.45208, 1, 1.5, 0.5, 0.5,
-4.18108, 0.07903862, -8.45208, 0, 1.5, 0.5, 0.5
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
-4.18108, -3.89318, -0.127192, 0, -0.5, 0.5, 0.5,
-4.18108, -3.89318, -0.127192, 1, -0.5, 0.5, 0.5,
-4.18108, -3.89318, -0.127192, 1, 1.5, 0.5, 0.5,
-4.18108, -3.89318, -0.127192, 0, 1.5, 0.5, 0.5
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
-3, -2.976514, -6.530952,
2, -2.976514, -6.530952,
-3, -2.976514, -6.530952,
-3, -3.129292, -6.85114,
-2, -2.976514, -6.530952,
-2, -3.129292, -6.85114,
-1, -2.976514, -6.530952,
-1, -3.129292, -6.85114,
0, -2.976514, -6.530952,
0, -3.129292, -6.85114,
1, -2.976514, -6.530952,
1, -3.129292, -6.85114,
2, -2.976514, -6.530952,
2, -3.129292, -6.85114
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
-3, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
-3, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
-3, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
-3, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5,
-2, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
-2, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
-2, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
-2, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5,
-1, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
-1, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
-1, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
-1, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5,
0, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
0, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
0, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
0, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5,
1, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
1, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
1, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
1, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5,
2, -3.434847, -7.491516, 0, -0.5, 0.5, 0.5,
2, -3.434847, -7.491516, 1, -0.5, 0.5, 0.5,
2, -3.434847, -7.491516, 1, 1.5, 0.5, 0.5,
2, -3.434847, -7.491516, 0, 1.5, 0.5, 0.5
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
-3.247239, -2, -6.530952,
-3.247239, 3, -6.530952,
-3.247239, -2, -6.530952,
-3.402879, -2, -6.85114,
-3.247239, -1, -6.530952,
-3.402879, -1, -6.85114,
-3.247239, 0, -6.530952,
-3.402879, 0, -6.85114,
-3.247239, 1, -6.530952,
-3.402879, 1, -6.85114,
-3.247239, 2, -6.530952,
-3.402879, 2, -6.85114,
-3.247239, 3, -6.530952,
-3.402879, 3, -6.85114
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
-3.71416, -2, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, -2, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, -2, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, -2, -7.491516, 0, 1.5, 0.5, 0.5,
-3.71416, -1, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, -1, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, -1, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, -1, -7.491516, 0, 1.5, 0.5, 0.5,
-3.71416, 0, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, 0, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, 0, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, 0, -7.491516, 0, 1.5, 0.5, 0.5,
-3.71416, 1, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, 1, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, 1, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, 1, -7.491516, 0, 1.5, 0.5, 0.5,
-3.71416, 2, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, 2, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, 2, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, 2, -7.491516, 0, 1.5, 0.5, 0.5,
-3.71416, 3, -7.491516, 0, -0.5, 0.5, 0.5,
-3.71416, 3, -7.491516, 1, -0.5, 0.5, 0.5,
-3.71416, 3, -7.491516, 1, 1.5, 0.5, 0.5,
-3.71416, 3, -7.491516, 0, 1.5, 0.5, 0.5
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
-3.247239, -2.976514, -6,
-3.247239, -2.976514, 6,
-3.247239, -2.976514, -6,
-3.402879, -3.129292, -6,
-3.247239, -2.976514, -4,
-3.402879, -3.129292, -4,
-3.247239, -2.976514, -2,
-3.402879, -3.129292, -2,
-3.247239, -2.976514, 0,
-3.402879, -3.129292, 0,
-3.247239, -2.976514, 2,
-3.402879, -3.129292, 2,
-3.247239, -2.976514, 4,
-3.402879, -3.129292, 4,
-3.247239, -2.976514, 6,
-3.402879, -3.129292, 6
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
-3.71416, -3.434847, -6, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -6, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -6, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, -6, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, -4, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -4, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -4, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, -4, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, -2, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -2, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, -2, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, -2, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 0, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 0, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 0, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 0, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 2, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 2, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 2, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 2, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 4, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 4, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 4, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 4, 0, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 6, 0, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 6, 1, -0.5, 0.5, 0.5,
-3.71416, -3.434847, 6, 1, 1.5, 0.5, 0.5,
-3.71416, -3.434847, 6, 0, 1.5, 0.5, 0.5
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
-3.247239, -2.976514, -6.530952,
-3.247239, 3.134592, -6.530952,
-3.247239, -2.976514, 6.276568,
-3.247239, 3.134592, 6.276568,
-3.247239, -2.976514, -6.530952,
-3.247239, -2.976514, 6.276568,
-3.247239, 3.134592, -6.530952,
-3.247239, 3.134592, 6.276568,
-3.247239, -2.976514, -6.530952,
2.978366, -2.976514, -6.530952,
-3.247239, -2.976514, 6.276568,
2.978366, -2.976514, 6.276568,
-3.247239, 3.134592, -6.530952,
2.978366, 3.134592, -6.530952,
-3.247239, 3.134592, 6.276568,
2.978366, 3.134592, 6.276568,
2.978366, -2.976514, -6.530952,
2.978366, 3.134592, -6.530952,
2.978366, -2.976514, 6.276568,
2.978366, 3.134592, 6.276568,
2.978366, -2.976514, -6.530952,
2.978366, -2.976514, 6.276568,
2.978366, 3.134592, -6.530952,
2.978366, 3.134592, 6.276568
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
var radius = 8.274741;
var distance = 36.81526;
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
mvMatrix.translate( 0.1344365, -0.07903862, 0.127192 );
mvMatrix.scale( 1.437099, 1.464025, 0.6985593 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.81526);
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
chlozolinate<-read.table("chlozolinate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlozolinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
y<-chlozolinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
```

```r
z<-chlozolinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlozolinate' not found
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
-3.156575, 0.1084865, -0.2310227, 0, 0, 1, 1, 1,
-3.073286, 0.4911341, -1.693067, 1, 0, 0, 1, 1,
-2.954766, -1.109146, -1.458857, 1, 0, 0, 1, 1,
-2.60493, 0.9162073, -1.668441, 1, 0, 0, 1, 1,
-2.60471, -1.550048, -1.339582, 1, 0, 0, 1, 1,
-2.539381, -1.652107, -2.976373, 1, 0, 0, 1, 1,
-2.493554, 0.08219017, -2.259427, 0, 0, 0, 1, 1,
-2.478319, -1.479144, -0.2969064, 0, 0, 0, 1, 1,
-2.456077, 0.3192175, 0.3352676, 0, 0, 0, 1, 1,
-2.456067, 1.40127, -2.157029, 0, 0, 0, 1, 1,
-2.434698, -0.3756458, -1.263946, 0, 0, 0, 1, 1,
-2.402808, -1.025336, -2.066383, 0, 0, 0, 1, 1,
-2.318482, -0.5426632, -2.577816, 0, 0, 0, 1, 1,
-2.315561, 1.145104, -2.429396, 1, 1, 1, 1, 1,
-2.300043, 0.3971113, -1.030413, 1, 1, 1, 1, 1,
-2.288626, 1.166459, -0.8029592, 1, 1, 1, 1, 1,
-2.233844, -1.058278, -3.576598, 1, 1, 1, 1, 1,
-2.181609, -1.086957, -2.964301, 1, 1, 1, 1, 1,
-2.181362, -0.09856044, -1.199186, 1, 1, 1, 1, 1,
-2.155131, 0.7957373, -0.1273057, 1, 1, 1, 1, 1,
-2.14901, 1.178607, -0.7810326, 1, 1, 1, 1, 1,
-2.133289, 0.6840309, -0.4965771, 1, 1, 1, 1, 1,
-2.12902, -0.07580264, -2.2174, 1, 1, 1, 1, 1,
-2.125686, -0.3113528, -0.07312374, 1, 1, 1, 1, 1,
-2.090123, 0.079688, -2.826587, 1, 1, 1, 1, 1,
-2.060136, 1.193113, -2.111181, 1, 1, 1, 1, 1,
-1.977348, 1.811883, 0.2424292, 1, 1, 1, 1, 1,
-1.966246, -0.1491914, 0.534791, 1, 1, 1, 1, 1,
-1.944026, 1.051942, -0.9916958, 0, 0, 1, 1, 1,
-1.935834, -0.7359982, -2.723433, 1, 0, 0, 1, 1,
-1.920969, 0.2078832, -1.372872, 1, 0, 0, 1, 1,
-1.916328, -0.9940212, -2.076393, 1, 0, 0, 1, 1,
-1.861, -2.086503, -2.735891, 1, 0, 0, 1, 1,
-1.845054, 0.5878136, -1.888418, 1, 0, 0, 1, 1,
-1.828983, -0.243048, -3.623317, 0, 0, 0, 1, 1,
-1.812161, 0.8425188, -2.523332, 0, 0, 0, 1, 1,
-1.807096, 0.7446477, -0.4612386, 0, 0, 0, 1, 1,
-1.799586, -0.4284351, -2.696362, 0, 0, 0, 1, 1,
-1.785056, -0.4397354, -2.190244, 0, 0, 0, 1, 1,
-1.782928, 0.2788922, -0.3744399, 0, 0, 0, 1, 1,
-1.761999, 0.4021724, -1.830862, 0, 0, 0, 1, 1,
-1.753057, -1.139998, -2.51959, 1, 1, 1, 1, 1,
-1.728434, -0.3481407, -2.485855, 1, 1, 1, 1, 1,
-1.690081, 1.10289, -0.9690582, 1, 1, 1, 1, 1,
-1.689104, -1.116266, -2.250277, 1, 1, 1, 1, 1,
-1.684532, 0.3863121, -1.955672, 1, 1, 1, 1, 1,
-1.681218, 0.4651631, -1.158496, 1, 1, 1, 1, 1,
-1.67535, 0.6841463, -1.679266, 1, 1, 1, 1, 1,
-1.67212, 0.9046928, 0.0512915, 1, 1, 1, 1, 1,
-1.651005, 0.7756324, -0.7698094, 1, 1, 1, 1, 1,
-1.64352, 0.3909602, -0.9060242, 1, 1, 1, 1, 1,
-1.642427, -1.483704, -3.104006, 1, 1, 1, 1, 1,
-1.630544, -1.261239, -3.447408, 1, 1, 1, 1, 1,
-1.612037, 0.1913657, -1.428162, 1, 1, 1, 1, 1,
-1.610349, -0.1528655, -1.961278, 1, 1, 1, 1, 1,
-1.606006, 0.6481227, -0.5823718, 1, 1, 1, 1, 1,
-1.605209, 0.8438378, -1.674728, 0, 0, 1, 1, 1,
-1.596173, 1.454038, -1.206224, 1, 0, 0, 1, 1,
-1.594721, 0.6429697, -1.778119, 1, 0, 0, 1, 1,
-1.585708, 1.215138, -2.619939, 1, 0, 0, 1, 1,
-1.56491, 0.6523955, -2.801898, 1, 0, 0, 1, 1,
-1.563007, 2.118823, -0.1512257, 1, 0, 0, 1, 1,
-1.545406, 0.4192347, -0.4988835, 0, 0, 0, 1, 1,
-1.536434, 1.095992, -3.410582, 0, 0, 0, 1, 1,
-1.535546, 0.956257, -0.3422526, 0, 0, 0, 1, 1,
-1.530261, -0.7158297, -1.327557, 0, 0, 0, 1, 1,
-1.522663, 0.5213947, -1.511784, 0, 0, 0, 1, 1,
-1.520645, 1.880576, -1.287591, 0, 0, 0, 1, 1,
-1.51905, 2.187573, 0.2975476, 0, 0, 0, 1, 1,
-1.518409, -1.015534, -2.711947, 1, 1, 1, 1, 1,
-1.503299, -1.241446, -4.77386, 1, 1, 1, 1, 1,
-1.497677, -0.5268711, -1.224012, 1, 1, 1, 1, 1,
-1.494622, 3.045595, 0.9512958, 1, 1, 1, 1, 1,
-1.49043, 1.215907, -1.135165, 1, 1, 1, 1, 1,
-1.484485, -0.6505426, -2.995175, 1, 1, 1, 1, 1,
-1.477021, -0.3797773, -2.011999, 1, 1, 1, 1, 1,
-1.451297, 0.4662281, -0.0391656, 1, 1, 1, 1, 1,
-1.451096, 0.767419, -0.9578452, 1, 1, 1, 1, 1,
-1.445421, -0.003159605, -1.656178, 1, 1, 1, 1, 1,
-1.435208, 0.08125525, -2.514865, 1, 1, 1, 1, 1,
-1.43424, -0.5205204, -3.011556, 1, 1, 1, 1, 1,
-1.428377, 1.150272, -2.673719, 1, 1, 1, 1, 1,
-1.40412, -0.8659388, -2.852027, 1, 1, 1, 1, 1,
-1.395458, 0.8860569, -0.1255842, 1, 1, 1, 1, 1,
-1.394665, -0.03538568, -0.5615753, 0, 0, 1, 1, 1,
-1.380137, -0.6557669, -2.588144, 1, 0, 0, 1, 1,
-1.375316, 0.1660044, 0.06446812, 1, 0, 0, 1, 1,
-1.364261, -0.1529493, -3.209482, 1, 0, 0, 1, 1,
-1.36296, -1.553972, -4.856188, 1, 0, 0, 1, 1,
-1.362761, -0.3292446, -1.879624, 1, 0, 0, 1, 1,
-1.358792, -0.4413848, -4.26156, 0, 0, 0, 1, 1,
-1.355137, -0.9676585, -4.981278, 0, 0, 0, 1, 1,
-1.354083, 0.7031503, -1.258889, 0, 0, 0, 1, 1,
-1.343683, -0.8956527, -2.535469, 0, 0, 0, 1, 1,
-1.338194, 0.6526939, -1.30422, 0, 0, 0, 1, 1,
-1.33676, -1.20883, -2.664433, 0, 0, 0, 1, 1,
-1.33224, -1.049997, -2.138556, 0, 0, 0, 1, 1,
-1.323539, -0.4602271, -0.4410964, 1, 1, 1, 1, 1,
-1.314284, 1.380872, -0.7231756, 1, 1, 1, 1, 1,
-1.311041, 0.2731009, -2.050311, 1, 1, 1, 1, 1,
-1.310438, -0.6528191, -2.832478, 1, 1, 1, 1, 1,
-1.298578, -0.2060323, -2.254749, 1, 1, 1, 1, 1,
-1.287869, -0.5786018, -2.022754, 1, 1, 1, 1, 1,
-1.287799, -0.2850836, -2.502225, 1, 1, 1, 1, 1,
-1.283905, 0.228978, -1.552833, 1, 1, 1, 1, 1,
-1.281522, 0.3846357, -0.8042751, 1, 1, 1, 1, 1,
-1.272185, -1.266397, -1.911472, 1, 1, 1, 1, 1,
-1.262004, 0.276592, -1.07947, 1, 1, 1, 1, 1,
-1.259206, -1.003914, -0.9446859, 1, 1, 1, 1, 1,
-1.251196, 0.2739191, -2.309439, 1, 1, 1, 1, 1,
-1.248754, -0.5077407, -2.522196, 1, 1, 1, 1, 1,
-1.247123, -0.03201736, -1.753898, 1, 1, 1, 1, 1,
-1.243695, -0.4277952, -3.052195, 0, 0, 1, 1, 1,
-1.235876, -0.9077838, -2.761906, 1, 0, 0, 1, 1,
-1.231903, 0.9957019, -1.470276, 1, 0, 0, 1, 1,
-1.227868, -2.023845, -1.998641, 1, 0, 0, 1, 1,
-1.227575, -0.2676709, -1.966999, 1, 0, 0, 1, 1,
-1.222801, 1.942437, -0.6163865, 1, 0, 0, 1, 1,
-1.213722, 0.2634254, -1.19314, 0, 0, 0, 1, 1,
-1.207398, -1.386058, -3.060797, 0, 0, 0, 1, 1,
-1.205743, -0.4728172, -2.200734, 0, 0, 0, 1, 1,
-1.204412, -0.489345, 0.6192335, 0, 0, 0, 1, 1,
-1.204078, 1.548222, -1.27023, 0, 0, 0, 1, 1,
-1.203211, -1.468454, -1.350473, 0, 0, 0, 1, 1,
-1.202238, 2.333991, -0.6499075, 0, 0, 0, 1, 1,
-1.191378, -1.130319, -3.4644, 1, 1, 1, 1, 1,
-1.187801, -0.5874234, -1.867006, 1, 1, 1, 1, 1,
-1.175998, 1.269793, 0.6952484, 1, 1, 1, 1, 1,
-1.163736, 0.5491236, -1.417474, 1, 1, 1, 1, 1,
-1.161466, -1.58911, -3.909049, 1, 1, 1, 1, 1,
-1.15977, -0.2276329, -0.6026599, 1, 1, 1, 1, 1,
-1.154898, -1.237689, -4.173466, 1, 1, 1, 1, 1,
-1.153767, 0.9848028, -2.595061, 1, 1, 1, 1, 1,
-1.151484, -0.3126125, -2.888978, 1, 1, 1, 1, 1,
-1.15098, 1.265261, -1.72965, 1, 1, 1, 1, 1,
-1.139238, -0.4671747, -2.460776, 1, 1, 1, 1, 1,
-1.129275, 1.372065, -1.376293, 1, 1, 1, 1, 1,
-1.128879, 0.9450586, -1.563165, 1, 1, 1, 1, 1,
-1.124904, -1.216756, -2.202234, 1, 1, 1, 1, 1,
-1.118391, -1.591572, -3.689831, 1, 1, 1, 1, 1,
-1.116637, 0.06129148, -1.837799, 0, 0, 1, 1, 1,
-1.114612, 2.952287, -2.309827, 1, 0, 0, 1, 1,
-1.109475, 1.143891, 0.0536189, 1, 0, 0, 1, 1,
-1.10833, 0.2193627, -1.226483, 1, 0, 0, 1, 1,
-1.104097, 0.5665355, -0.9491431, 1, 0, 0, 1, 1,
-1.097782, 2.758341, 0.2411376, 1, 0, 0, 1, 1,
-1.097547, -2.019594, -3.170411, 0, 0, 0, 1, 1,
-1.094427, 0.1346659, 0.8271332, 0, 0, 0, 1, 1,
-1.090285, 1.867273, -0.02826238, 0, 0, 0, 1, 1,
-1.087443, -0.9324595, -1.855225, 0, 0, 0, 1, 1,
-1.084713, -1.719808, -3.091723, 0, 0, 0, 1, 1,
-1.078181, 0.3600295, 0.09873591, 0, 0, 0, 1, 1,
-1.077151, 0.6501506, -0.08217013, 0, 0, 0, 1, 1,
-1.076187, -0.4411459, -1.713469, 1, 1, 1, 1, 1,
-1.073143, 0.4625874, -2.044086, 1, 1, 1, 1, 1,
-1.060257, 0.6667566, -0.787929, 1, 1, 1, 1, 1,
-1.052033, -0.8043732, -2.425443, 1, 1, 1, 1, 1,
-1.045386, 0.5706186, -1.730838, 1, 1, 1, 1, 1,
-1.035717, -0.114098, -2.372003, 1, 1, 1, 1, 1,
-1.034646, 0.2839055, -2.991056, 1, 1, 1, 1, 1,
-1.032805, 1.550031, -2.485835, 1, 1, 1, 1, 1,
-1.025858, 0.9396952, -0.2075499, 1, 1, 1, 1, 1,
-1.024982, 0.2881226, -2.492926, 1, 1, 1, 1, 1,
-1.022987, 1.378362, 0.2026296, 1, 1, 1, 1, 1,
-1.013191, -0.7686393, -2.013096, 1, 1, 1, 1, 1,
-1.000739, 0.6676852, -0.7388375, 1, 1, 1, 1, 1,
-0.9962003, -0.4208952, -1.63247, 1, 1, 1, 1, 1,
-0.9927099, -0.06947278, -1.606383, 1, 1, 1, 1, 1,
-0.9883052, -0.01873996, -2.327039, 0, 0, 1, 1, 1,
-0.9847757, 0.4725479, -2.888245, 1, 0, 0, 1, 1,
-0.970243, -0.3517716, -2.600923, 1, 0, 0, 1, 1,
-0.966764, -0.6693194, 0.2433448, 1, 0, 0, 1, 1,
-0.9595946, -0.8174754, -1.479005, 1, 0, 0, 1, 1,
-0.9575174, -0.1734538, 0.2292717, 1, 0, 0, 1, 1,
-0.9532156, -0.3027296, -1.970884, 0, 0, 0, 1, 1,
-0.950739, -1.100675, -1.954342, 0, 0, 0, 1, 1,
-0.9503484, 0.2776566, -1.771598, 0, 0, 0, 1, 1,
-0.9481573, -0.7316453, -1.783572, 0, 0, 0, 1, 1,
-0.9450067, -1.934777, -3.362536, 0, 0, 0, 1, 1,
-0.9387137, 0.2932192, -1.534034, 0, 0, 0, 1, 1,
-0.9369836, 0.249523, -1.346766, 0, 0, 0, 1, 1,
-0.9352603, 1.167283, -0.4895033, 1, 1, 1, 1, 1,
-0.9337395, -0.7690092, -1.204619, 1, 1, 1, 1, 1,
-0.9298707, -2.182522, -3.466116, 1, 1, 1, 1, 1,
-0.9293137, 0.1830032, 0.52017, 1, 1, 1, 1, 1,
-0.9274049, -0.8063755, -3.186157, 1, 1, 1, 1, 1,
-0.9250528, 0.2608541, -2.637165, 1, 1, 1, 1, 1,
-0.9241619, 0.3897544, -0.9589604, 1, 1, 1, 1, 1,
-0.9202554, -1.157706, -3.092744, 1, 1, 1, 1, 1,
-0.9195044, -1.576609, -4.058851, 1, 1, 1, 1, 1,
-0.9186285, -0.1665429, -1.051249, 1, 1, 1, 1, 1,
-0.911198, 0.1776426, -1.358565, 1, 1, 1, 1, 1,
-0.9108623, 1.156215, -0.02922057, 1, 1, 1, 1, 1,
-0.8990707, 0.2986138, -2.60523, 1, 1, 1, 1, 1,
-0.8952631, -0.7764465, -2.519572, 1, 1, 1, 1, 1,
-0.8944762, 0.05922646, -0.551209, 1, 1, 1, 1, 1,
-0.8838023, -0.3544979, -2.534053, 0, 0, 1, 1, 1,
-0.877695, 0.750035, -1.82835, 1, 0, 0, 1, 1,
-0.877256, -0.4894468, -1.987185, 1, 0, 0, 1, 1,
-0.8768733, 1.537027, -0.7936459, 1, 0, 0, 1, 1,
-0.8757558, 1.328871, -0.7773719, 1, 0, 0, 1, 1,
-0.8735236, -0.09939482, -2.0865, 1, 0, 0, 1, 1,
-0.8728076, -1.407723, -1.313458, 0, 0, 0, 1, 1,
-0.8688599, -0.3137254, -0.9845081, 0, 0, 0, 1, 1,
-0.8664703, 2.024958, -0.2182326, 0, 0, 0, 1, 1,
-0.8664448, 0.8405257, 0.1145549, 0, 0, 0, 1, 1,
-0.8641082, 2.010209, 0.5795253, 0, 0, 0, 1, 1,
-0.8600162, -0.9307301, -2.624001, 0, 0, 0, 1, 1,
-0.8518422, 0.9355609, -1.790682, 0, 0, 0, 1, 1,
-0.8478971, -1.413405, -2.541245, 1, 1, 1, 1, 1,
-0.8434244, 0.2653868, -1.969401, 1, 1, 1, 1, 1,
-0.8413154, -0.4430018, -1.74354, 1, 1, 1, 1, 1,
-0.8399656, -0.6252843, -3.355431, 1, 1, 1, 1, 1,
-0.8397683, -0.1525727, -2.544619, 1, 1, 1, 1, 1,
-0.8336614, -1.195103, -3.285322, 1, 1, 1, 1, 1,
-0.8329076, -0.2113149, -2.22353, 1, 1, 1, 1, 1,
-0.8321364, -0.4207685, -3.15194, 1, 1, 1, 1, 1,
-0.8281292, 0.7841295, -1.578227, 1, 1, 1, 1, 1,
-0.8278242, 0.273966, -1.770593, 1, 1, 1, 1, 1,
-0.8237062, -0.04662227, -1.413884, 1, 1, 1, 1, 1,
-0.8209826, -0.3791489, -2.549594, 1, 1, 1, 1, 1,
-0.8142885, -1.195084, -2.72419, 1, 1, 1, 1, 1,
-0.8129601, 0.7830474, -1.466826, 1, 1, 1, 1, 1,
-0.7962908, 0.8824711, -1.025967, 1, 1, 1, 1, 1,
-0.7943881, 1.808335, 0.6412093, 0, 0, 1, 1, 1,
-0.7881852, 1.062388, -0.06821573, 1, 0, 0, 1, 1,
-0.7872505, 0.2456461, -0.3193579, 1, 0, 0, 1, 1,
-0.7807834, 0.8546818, 0.06207759, 1, 0, 0, 1, 1,
-0.7720163, 0.03350242, -0.722537, 1, 0, 0, 1, 1,
-0.7710734, 0.1851428, -0.6116809, 1, 0, 0, 1, 1,
-0.7697938, 0.480423, -1.794986, 0, 0, 0, 1, 1,
-0.7649545, 0.08236633, -1.056061, 0, 0, 0, 1, 1,
-0.7612738, 0.2852467, -0.7360142, 0, 0, 0, 1, 1,
-0.7567524, 1.027152, -1.083755, 0, 0, 0, 1, 1,
-0.7527768, 0.07639708, -1.867175, 0, 0, 0, 1, 1,
-0.7519746, -1.83619, -2.316494, 0, 0, 0, 1, 1,
-0.7484012, 0.2555213, -1.170892, 0, 0, 0, 1, 1,
-0.7376169, 0.8527502, -0.9659997, 1, 1, 1, 1, 1,
-0.7362062, -0.6794226, -1.580049, 1, 1, 1, 1, 1,
-0.7358041, 0.05309156, 0.138337, 1, 1, 1, 1, 1,
-0.7340179, 1.174263, -0.8095345, 1, 1, 1, 1, 1,
-0.7293838, -0.5100941, -2.073166, 1, 1, 1, 1, 1,
-0.7237492, -0.4456994, -1.006185, 1, 1, 1, 1, 1,
-0.7231342, 1.980818, -0.5912656, 1, 1, 1, 1, 1,
-0.7194895, -0.4799627, -2.273917, 1, 1, 1, 1, 1,
-0.7192037, -1.962649, -3.935477, 1, 1, 1, 1, 1,
-0.7091864, 0.42968, -0.6916184, 1, 1, 1, 1, 1,
-0.7029911, -0.2534415, -1.94223, 1, 1, 1, 1, 1,
-0.700554, -1.553944, -2.847398, 1, 1, 1, 1, 1,
-0.6963964, -0.2265352, -1.387333, 1, 1, 1, 1, 1,
-0.6928443, -0.1785028, -2.998482, 1, 1, 1, 1, 1,
-0.6895236, -0.4054878, -1.706037, 1, 1, 1, 1, 1,
-0.6877526, -0.4174549, -2.445652, 0, 0, 1, 1, 1,
-0.6876701, -0.443556, -1.088978, 1, 0, 0, 1, 1,
-0.6837807, -0.4643821, -2.04864, 1, 0, 0, 1, 1,
-0.6827405, -0.9673989, -0.2307276, 1, 0, 0, 1, 1,
-0.6779515, -1.728063, -3.560146, 1, 0, 0, 1, 1,
-0.6742514, 1.87695, -0.6752872, 1, 0, 0, 1, 1,
-0.6648998, -0.1709355, -2.036354, 0, 0, 0, 1, 1,
-0.6638182, -1.144855, -2.032785, 0, 0, 0, 1, 1,
-0.6560816, -0.6531687, -2.371797, 0, 0, 0, 1, 1,
-0.6445524, -0.2103796, -0.8523958, 0, 0, 0, 1, 1,
-0.6387007, 0.2733715, -1.571553, 0, 0, 0, 1, 1,
-0.6372738, 0.3445004, 0.1367128, 0, 0, 0, 1, 1,
-0.6349062, 0.5035948, -1.628692, 0, 0, 0, 1, 1,
-0.6338459, -1.620358, -2.230106, 1, 1, 1, 1, 1,
-0.6317511, -1.120583, -3.672931, 1, 1, 1, 1, 1,
-0.6292216, 0.3584855, -2.107705, 1, 1, 1, 1, 1,
-0.623222, -1.637066, -2.012022, 1, 1, 1, 1, 1,
-0.6196502, 0.3166657, -2.071993, 1, 1, 1, 1, 1,
-0.6149258, -1.073885, -2.483921, 1, 1, 1, 1, 1,
-0.6147453, 0.313884, -1.729752, 1, 1, 1, 1, 1,
-0.6112084, 0.9443139, -1.18036, 1, 1, 1, 1, 1,
-0.6100461, 0.9301547, 1.099052, 1, 1, 1, 1, 1,
-0.6082701, 0.8747201, 0.4785046, 1, 1, 1, 1, 1,
-0.607383, 0.4071156, -1.385238, 1, 1, 1, 1, 1,
-0.6026728, 0.2889982, -1.113973, 1, 1, 1, 1, 1,
-0.6023092, 0.4321296, -0.4570572, 1, 1, 1, 1, 1,
-0.6020407, -0.07108661, -1.959642, 1, 1, 1, 1, 1,
-0.6015978, -0.06560653, -0.5160013, 1, 1, 1, 1, 1,
-0.6003097, -0.1972698, -0.297881, 0, 0, 1, 1, 1,
-0.5988745, -1.110293, -4.221888, 1, 0, 0, 1, 1,
-0.598807, -0.8361537, -2.048059, 1, 0, 0, 1, 1,
-0.5971352, 1.146103, -0.2139099, 1, 0, 0, 1, 1,
-0.5953971, -0.7508994, -1.8804, 1, 0, 0, 1, 1,
-0.5935771, 0.5701641, -1.178556, 1, 0, 0, 1, 1,
-0.5891333, 0.8764796, -2.852773, 0, 0, 0, 1, 1,
-0.5888781, -0.9094387, -1.140173, 0, 0, 0, 1, 1,
-0.5873283, 0.5042691, -2.099488, 0, 0, 0, 1, 1,
-0.585749, 0.8536656, -1.066184, 0, 0, 0, 1, 1,
-0.5843994, 0.4706253, 0.5556021, 0, 0, 0, 1, 1,
-0.5843837, -2.025317, -1.962574, 0, 0, 0, 1, 1,
-0.5783404, -0.8646276, -1.819082, 0, 0, 0, 1, 1,
-0.5779921, 0.7574028, 0.00225256, 1, 1, 1, 1, 1,
-0.5771071, -0.9757969, -2.568289, 1, 1, 1, 1, 1,
-0.5766944, -0.6437688, -3.240376, 1, 1, 1, 1, 1,
-0.5732735, 0.5460736, -2.924281, 1, 1, 1, 1, 1,
-0.5727491, 1.371335, -2.004947, 1, 1, 1, 1, 1,
-0.5712665, -0.6598551, -1.629647, 1, 1, 1, 1, 1,
-0.5711602, 0.8529937, -0.8989207, 1, 1, 1, 1, 1,
-0.5629693, 0.1319458, -2.446379, 1, 1, 1, 1, 1,
-0.5617709, 0.09712508, -2.084561, 1, 1, 1, 1, 1,
-0.5547982, 1.067792, -0.6851416, 1, 1, 1, 1, 1,
-0.5510242, 0.7383969, -1.422517, 1, 1, 1, 1, 1,
-0.5459399, -0.09355198, -0.4415511, 1, 1, 1, 1, 1,
-0.5383065, -0.9276575, -2.206594, 1, 1, 1, 1, 1,
-0.535696, 0.008710399, -1.504323, 1, 1, 1, 1, 1,
-0.5349457, 0.1262183, -1.979716, 1, 1, 1, 1, 1,
-0.5339653, -0.07488459, -1.524295, 0, 0, 1, 1, 1,
-0.5271096, 0.8773066, -0.7713318, 1, 0, 0, 1, 1,
-0.5268754, 0.4458621, 0.2824185, 1, 0, 0, 1, 1,
-0.5211881, 0.3803433, -0.6254352, 1, 0, 0, 1, 1,
-0.5186655, 0.01797405, -2.497804, 1, 0, 0, 1, 1,
-0.516706, -0.003115923, -2.086514, 1, 0, 0, 1, 1,
-0.5161089, -0.728191, -2.060721, 0, 0, 0, 1, 1,
-0.5151312, 0.0006500257, -1.349727, 0, 0, 0, 1, 1,
-0.5116496, 0.8828468, -0.5443779, 0, 0, 0, 1, 1,
-0.5088561, -0.239605, -1.543816, 0, 0, 0, 1, 1,
-0.5088547, 1.612846, -0.6665699, 0, 0, 0, 1, 1,
-0.5031862, 2.032017, -0.9214935, 0, 0, 0, 1, 1,
-0.4989763, 1.139634, -1.471184, 0, 0, 0, 1, 1,
-0.4977158, -0.9657182, -2.711374, 1, 1, 1, 1, 1,
-0.494625, -1.282116, -0.9742424, 1, 1, 1, 1, 1,
-0.4937378, -0.1298914, -1.72324, 1, 1, 1, 1, 1,
-0.4892223, 0.5865777, -1.202849, 1, 1, 1, 1, 1,
-0.4874477, 1.68385, -1.008599, 1, 1, 1, 1, 1,
-0.4859285, 2.782504, -1.162002, 1, 1, 1, 1, 1,
-0.4787502, -0.2773339, -1.643815, 1, 1, 1, 1, 1,
-0.4719265, -1.086441, -0.9296705, 1, 1, 1, 1, 1,
-0.4686105, 1.651025, -0.4670855, 1, 1, 1, 1, 1,
-0.4678824, 0.3316185, -1.435087, 1, 1, 1, 1, 1,
-0.4667464, 0.9748368, 0.7547413, 1, 1, 1, 1, 1,
-0.4657668, -0.3957835, -2.070325, 1, 1, 1, 1, 1,
-0.463469, -0.06607623, -2.785166, 1, 1, 1, 1, 1,
-0.4628578, -0.364232, -2.261904, 1, 1, 1, 1, 1,
-0.4623263, -0.534095, -0.4343754, 1, 1, 1, 1, 1,
-0.4576391, -0.9302782, -2.196877, 0, 0, 1, 1, 1,
-0.4544069, -0.9917883, -2.577281, 1, 0, 0, 1, 1,
-0.4520191, 0.6254686, -1.167207, 1, 0, 0, 1, 1,
-0.4511216, 0.2388092, -0.4664662, 1, 0, 0, 1, 1,
-0.4502493, 0.6375731, 0.1742008, 1, 0, 0, 1, 1,
-0.4495045, 0.5862536, -1.065315, 1, 0, 0, 1, 1,
-0.4476057, 0.1750976, -1.298814, 0, 0, 0, 1, 1,
-0.4466032, 0.2388632, -0.02140464, 0, 0, 0, 1, 1,
-0.445082, -0.2889788, -0.9857354, 0, 0, 0, 1, 1,
-0.4329119, -0.8875545, -2.91572, 0, 0, 0, 1, 1,
-0.4300055, -0.9159459, -2.787062, 0, 0, 0, 1, 1,
-0.4270131, -0.7980094, -2.731189, 0, 0, 0, 1, 1,
-0.4240657, 0.2584661, -1.367691, 0, 0, 0, 1, 1,
-0.4182064, -0.1014565, -1.567345, 1, 1, 1, 1, 1,
-0.4169908, -0.5142409, -3.032607, 1, 1, 1, 1, 1,
-0.4168342, -1.131305, -4.102083, 1, 1, 1, 1, 1,
-0.4164858, -0.517125, -1.913683, 1, 1, 1, 1, 1,
-0.4143796, -0.3825341, -3.765682, 1, 1, 1, 1, 1,
-0.4112807, 0.3548746, 0.04434008, 1, 1, 1, 1, 1,
-0.4109336, 1.831342, 0.621196, 1, 1, 1, 1, 1,
-0.4093369, -0.2996823, -0.4797134, 1, 1, 1, 1, 1,
-0.4072874, 0.2334704, -0.8633891, 1, 1, 1, 1, 1,
-0.4059882, 0.06428733, -0.474829, 1, 1, 1, 1, 1,
-0.4016871, -0.3290721, -3.184816, 1, 1, 1, 1, 1,
-0.3939908, 0.1437997, -0.3758099, 1, 1, 1, 1, 1,
-0.3887356, 0.9402139, -0.4340003, 1, 1, 1, 1, 1,
-0.3866995, 0.39698, -1.138287, 1, 1, 1, 1, 1,
-0.3843077, -0.4553215, -2.559611, 1, 1, 1, 1, 1,
-0.378866, -0.1924282, -1.754421, 0, 0, 1, 1, 1,
-0.3774206, 1.725882, -0.5076758, 1, 0, 0, 1, 1,
-0.3773064, 0.33858, -0.9606421, 1, 0, 0, 1, 1,
-0.3771222, 0.2906092, -2.001023, 1, 0, 0, 1, 1,
-0.373601, 1.603312, 0.1337941, 1, 0, 0, 1, 1,
-0.3709145, -1.232055, -2.852655, 1, 0, 0, 1, 1,
-0.3701618, 1.175936, 0.3086118, 0, 0, 0, 1, 1,
-0.3690591, 0.6490238, -0.3503359, 0, 0, 0, 1, 1,
-0.3592072, 1.00658, -0.2054956, 0, 0, 0, 1, 1,
-0.3568816, 0.04595707, -0.9433652, 0, 0, 0, 1, 1,
-0.3563513, -0.7102352, -4.263621, 0, 0, 0, 1, 1,
-0.3526931, 0.5618496, -1.071162, 0, 0, 0, 1, 1,
-0.3511516, 0.2877909, -0.1104544, 0, 0, 0, 1, 1,
-0.3508693, -0.3036607, -3.032808, 1, 1, 1, 1, 1,
-0.3493021, 0.1553909, -1.938489, 1, 1, 1, 1, 1,
-0.3485107, -0.2354391, -3.489623, 1, 1, 1, 1, 1,
-0.3484395, 0.9105755, -0.8096883, 1, 1, 1, 1, 1,
-0.3482437, -0.4124704, -3.78902, 1, 1, 1, 1, 1,
-0.3477872, -0.6043503, -3.218066, 1, 1, 1, 1, 1,
-0.34394, 0.05645816, 0.3529978, 1, 1, 1, 1, 1,
-0.3413379, 0.612515, -2.09016, 1, 1, 1, 1, 1,
-0.3402013, -0.1885259, -2.184695, 1, 1, 1, 1, 1,
-0.3397026, 1.519384, -0.8033723, 1, 1, 1, 1, 1,
-0.3329634, -0.1682946, -2.972368, 1, 1, 1, 1, 1,
-0.3310811, 0.6109618, -1.220027, 1, 1, 1, 1, 1,
-0.3285354, 0.1479478, -0.9600493, 1, 1, 1, 1, 1,
-0.3279925, 0.7131908, -1.185548, 1, 1, 1, 1, 1,
-0.3276043, -0.4849597, -2.739743, 1, 1, 1, 1, 1,
-0.3213868, -1.625708, -3.735501, 0, 0, 1, 1, 1,
-0.3192755, 0.4754708, -1.918955, 1, 0, 0, 1, 1,
-0.3174324, 1.020792, 1.359202, 1, 0, 0, 1, 1,
-0.3164031, -1.154504, -1.691015, 1, 0, 0, 1, 1,
-0.3154442, -0.114087, -0.7444482, 1, 0, 0, 1, 1,
-0.3144745, 1.151067, 1.07238, 1, 0, 0, 1, 1,
-0.3142201, 0.1451606, -2.156959, 0, 0, 0, 1, 1,
-0.3132882, 1.29137, -1.445143, 0, 0, 0, 1, 1,
-0.311435, 0.1602619, -1.838296, 0, 0, 0, 1, 1,
-0.3090965, 0.03461649, -1.952977, 0, 0, 0, 1, 1,
-0.3085299, -2.291358, -2.468343, 0, 0, 0, 1, 1,
-0.3054916, 1.197071, -0.4548734, 0, 0, 0, 1, 1,
-0.3045358, 0.9721103, -1.470882, 0, 0, 0, 1, 1,
-0.3041797, 1.11182, -0.3317448, 1, 1, 1, 1, 1,
-0.3033965, -0.5941203, -2.782875, 1, 1, 1, 1, 1,
-0.2987607, -0.1102131, -1.619619, 1, 1, 1, 1, 1,
-0.2986932, -0.4130619, -2.412931, 1, 1, 1, 1, 1,
-0.2983077, -1.430394, -2.413913, 1, 1, 1, 1, 1,
-0.2965053, 0.6412305, -1.162628, 1, 1, 1, 1, 1,
-0.290965, 0.8964364, 0.9283462, 1, 1, 1, 1, 1,
-0.2906604, 0.7945706, -0.9562, 1, 1, 1, 1, 1,
-0.2903784, -0.5815008, -3.528213, 1, 1, 1, 1, 1,
-0.2885741, -1.392929, -2.952056, 1, 1, 1, 1, 1,
-0.283564, -0.512069, 0.2170257, 1, 1, 1, 1, 1,
-0.2721891, 1.625392, 1.16439, 1, 1, 1, 1, 1,
-0.2712947, -0.464592, -3.643111, 1, 1, 1, 1, 1,
-0.2704405, 0.8545982, -0.7969874, 1, 1, 1, 1, 1,
-0.2688215, -0.4395307, -1.577685, 1, 1, 1, 1, 1,
-0.2687933, 0.8375176, -1.853392, 0, 0, 1, 1, 1,
-0.2670748, 2.524979, -0.09212923, 1, 0, 0, 1, 1,
-0.2640961, -2.142944, -3.777209, 1, 0, 0, 1, 1,
-0.2581361, 1.614609, 0.7084624, 1, 0, 0, 1, 1,
-0.2541048, 0.07226026, -2.096652, 1, 0, 0, 1, 1,
-0.2503472, -1.614469, -3.076573, 1, 0, 0, 1, 1,
-0.2475473, 0.2342791, -0.2020156, 0, 0, 0, 1, 1,
-0.2363873, -0.2319052, -1.456175, 0, 0, 0, 1, 1,
-0.2352194, 0.5716574, -1.309572, 0, 0, 0, 1, 1,
-0.2351455, -0.2663494, -2.020366, 0, 0, 0, 1, 1,
-0.2338079, -0.07759194, -3.148488, 0, 0, 0, 1, 1,
-0.2185583, 1.441189, -1.221386, 0, 0, 0, 1, 1,
-0.2137749, -0.594594, -1.695642, 0, 0, 0, 1, 1,
-0.2132199, 0.5655202, -0.2159016, 1, 1, 1, 1, 1,
-0.2072619, 0.07268, -0.4723379, 1, 1, 1, 1, 1,
-0.2068657, -0.5939562, -3.563669, 1, 1, 1, 1, 1,
-0.2061016, -2.887518, -1.590601, 1, 1, 1, 1, 1,
-0.2051644, 0.824399, 1.822047, 1, 1, 1, 1, 1,
-0.203763, 1.41244, 1.590216, 1, 1, 1, 1, 1,
-0.2036401, -2.149489, -2.104913, 1, 1, 1, 1, 1,
-0.1921226, 0.03024429, -2.724381, 1, 1, 1, 1, 1,
-0.1889934, 0.7347062, -1.422839, 1, 1, 1, 1, 1,
-0.1828873, 2.265174, 0.00476804, 1, 1, 1, 1, 1,
-0.18262, -0.6448485, -3.310125, 1, 1, 1, 1, 1,
-0.1795986, -0.1341359, -2.233724, 1, 1, 1, 1, 1,
-0.1721777, -0.6368662, -1.119382, 1, 1, 1, 1, 1,
-0.1716029, 0.632254, -1.301921, 1, 1, 1, 1, 1,
-0.1647213, 1.094785, -0.1405254, 1, 1, 1, 1, 1,
-0.1617182, 0.7620744, 0.3901432, 0, 0, 1, 1, 1,
-0.1474944, -0.2454037, -3.217755, 1, 0, 0, 1, 1,
-0.1407098, 1.113396, 0.4919844, 1, 0, 0, 1, 1,
-0.1378103, -0.5165089, -0.6268588, 1, 0, 0, 1, 1,
-0.1371666, 0.5038, -1.489158, 1, 0, 0, 1, 1,
-0.1343221, -0.6284905, -3.656141, 1, 0, 0, 1, 1,
-0.1299352, 0.7025596, 0.9750426, 0, 0, 0, 1, 1,
-0.1229889, 0.4270985, -1.086505, 0, 0, 0, 1, 1,
-0.114105, -0.6061824, -1.258497, 0, 0, 0, 1, 1,
-0.1123645, 0.9082963, -0.2507644, 0, 0, 0, 1, 1,
-0.110537, 1.030943, -0.8018386, 0, 0, 0, 1, 1,
-0.1060302, -0.8737415, -3.326305, 0, 0, 0, 1, 1,
-0.09881592, 1.040531, 0.128616, 0, 0, 0, 1, 1,
-0.097549, -0.3425179, -3.206183, 1, 1, 1, 1, 1,
-0.09291974, -0.007792449, -2.515835, 1, 1, 1, 1, 1,
-0.09079613, 1.62602, 0.5501385, 1, 1, 1, 1, 1,
-0.09042575, 0.8281662, -0.3411359, 1, 1, 1, 1, 1,
-0.08800592, -0.500319, -2.8323, 1, 1, 1, 1, 1,
-0.08679318, 0.06258988, -0.5316409, 1, 1, 1, 1, 1,
-0.08663583, -0.6450647, -1.137648, 1, 1, 1, 1, 1,
-0.08646777, 0.163807, -1.262129, 1, 1, 1, 1, 1,
-0.08421001, 0.1284808, 0.02511374, 1, 1, 1, 1, 1,
-0.08416536, 1.35539, -0.8053679, 1, 1, 1, 1, 1,
-0.08301892, 2.171097, 0.3615088, 1, 1, 1, 1, 1,
-0.07498125, 1.323259, 0.3271417, 1, 1, 1, 1, 1,
-0.07404075, 1.609771, 0.9148144, 1, 1, 1, 1, 1,
-0.07276211, 0.5536096, 1.662678, 1, 1, 1, 1, 1,
-0.07153488, -1.976533, -6.344435, 1, 1, 1, 1, 1,
-0.0711009, -0.2972101, -2.847584, 0, 0, 1, 1, 1,
-0.06847915, -1.228418, -2.858832, 1, 0, 0, 1, 1,
-0.06136759, -0.3179973, -3.425836, 1, 0, 0, 1, 1,
-0.06025087, 0.1312361, -0.9690693, 1, 0, 0, 1, 1,
-0.05864069, -0.4960207, -2.470054, 1, 0, 0, 1, 1,
-0.05581681, 0.1586527, 0.3911487, 1, 0, 0, 1, 1,
-0.05536459, 1.080769, 0.07707597, 0, 0, 0, 1, 1,
-0.05220413, 1.074613, -1.590306, 0, 0, 0, 1, 1,
-0.05081363, 0.4601878, -0.632337, 0, 0, 0, 1, 1,
-0.04995639, -0.2373435, -4.770415, 0, 0, 0, 1, 1,
-0.04363249, 0.4157431, 0.03613051, 0, 0, 0, 1, 1,
-0.041705, -1.51376, -4.761176, 0, 0, 0, 1, 1,
-0.03959909, 0.8184543, -0.9157255, 0, 0, 0, 1, 1,
-0.03429551, 0.7897515, -0.05296225, 1, 1, 1, 1, 1,
-0.0286457, -0.3075289, -3.197821, 1, 1, 1, 1, 1,
-0.02516934, 0.5429121, -0.4876929, 1, 1, 1, 1, 1,
-0.02287855, -0.5478984, -3.281901, 1, 1, 1, 1, 1,
-0.01934634, -0.4365267, -4.551563, 1, 1, 1, 1, 1,
-0.01174339, 0.7895961, 0.08547608, 1, 1, 1, 1, 1,
-0.01132139, -1.434033, -2.178486, 1, 1, 1, 1, 1,
-0.01109806, 1.177063, -2.752166, 1, 1, 1, 1, 1,
-0.009475184, -1.179551, -2.685885, 1, 1, 1, 1, 1,
-0.003254487, 0.8154094, 1.121708, 1, 1, 1, 1, 1,
-0.002144628, -0.132431, -4.070281, 1, 1, 1, 1, 1,
0.01115688, -0.6742084, 4.754433, 1, 1, 1, 1, 1,
0.01166177, 0.6079271, 0.6634428, 1, 1, 1, 1, 1,
0.01483935, 0.5196845, 1.346051, 1, 1, 1, 1, 1,
0.01550733, -0.5789542, 1.065954, 1, 1, 1, 1, 1,
0.0168058, 0.1914218, 0.04220819, 0, 0, 1, 1, 1,
0.0175055, -0.2792542, 3.057998, 1, 0, 0, 1, 1,
0.01858487, -0.5017117, 2.578561, 1, 0, 0, 1, 1,
0.02168958, 0.276683, 0.2244753, 1, 0, 0, 1, 1,
0.02240627, -1.203319, 3.453733, 1, 0, 0, 1, 1,
0.0283655, -1.79716, 3.944949, 1, 0, 0, 1, 1,
0.02970318, 0.4627592, 0.2047668, 0, 0, 0, 1, 1,
0.03221941, -1.142969, 2.072426, 0, 0, 0, 1, 1,
0.03227118, 1.351371, -0.02648765, 0, 0, 0, 1, 1,
0.03485616, 0.9849843, 0.69638, 0, 0, 0, 1, 1,
0.03620222, 0.5408375, -2.190218, 0, 0, 0, 1, 1,
0.03909725, 0.1449022, 1.992375, 0, 0, 0, 1, 1,
0.04090213, -0.4208838, 3.416905, 0, 0, 0, 1, 1,
0.04488627, -1.054384, 3.421438, 1, 1, 1, 1, 1,
0.04561706, -0.8545699, 4.735639, 1, 1, 1, 1, 1,
0.04664998, -0.1721206, 3.980071, 1, 1, 1, 1, 1,
0.04765618, 0.09885638, 1.299765, 1, 1, 1, 1, 1,
0.05107601, 0.2824807, 0.3947954, 1, 1, 1, 1, 1,
0.05149791, -0.2365534, 3.833175, 1, 1, 1, 1, 1,
0.05458752, 0.1142549, -1.299927, 1, 1, 1, 1, 1,
0.05594053, -0.2282431, 3.382461, 1, 1, 1, 1, 1,
0.05808866, 0.7282749, 0.1983379, 1, 1, 1, 1, 1,
0.06045314, 0.4704338, 1.148951, 1, 1, 1, 1, 1,
0.06304707, 1.197848, 0.2297159, 1, 1, 1, 1, 1,
0.06347325, -0.06578397, 0.9073502, 1, 1, 1, 1, 1,
0.0638305, 1.193056, 0.815342, 1, 1, 1, 1, 1,
0.06682944, 0.7343002, -0.4374691, 1, 1, 1, 1, 1,
0.06950116, -0.8574093, 3.801423, 1, 1, 1, 1, 1,
0.07099148, -1.599281, 3.644724, 0, 0, 1, 1, 1,
0.08033373, 2.346847, -0.1572767, 1, 0, 0, 1, 1,
0.08044671, 0.2283707, -0.8870698, 1, 0, 0, 1, 1,
0.08185318, 0.8066961, 0.2987808, 1, 0, 0, 1, 1,
0.09008181, -0.2758619, 0.1910069, 1, 0, 0, 1, 1,
0.09140936, -0.2092291, 0.8566728, 1, 0, 0, 1, 1,
0.09608199, -0.9655253, 2.717777, 0, 0, 0, 1, 1,
0.0983408, 0.4283225, -1.521842, 0, 0, 0, 1, 1,
0.1014096, 0.5317139, 1.26263, 0, 0, 0, 1, 1,
0.1024346, 1.715257, -0.2959287, 0, 0, 0, 1, 1,
0.1027258, -0.387195, 2.457358, 0, 0, 0, 1, 1,
0.1037396, -0.1158572, 3.991276, 0, 0, 0, 1, 1,
0.1038961, 0.9282855, 1.641071, 0, 0, 0, 1, 1,
0.1042147, -0.9500962, 3.731633, 1, 1, 1, 1, 1,
0.1121251, -1.334512, 3.721095, 1, 1, 1, 1, 1,
0.1156346, -1.278486, 2.727635, 1, 1, 1, 1, 1,
0.115718, 0.2031351, 2.267594, 1, 1, 1, 1, 1,
0.1174782, -0.9656734, 1.901492, 1, 1, 1, 1, 1,
0.1266867, 0.5506681, -0.1613247, 1, 1, 1, 1, 1,
0.1272786, 1.305712, 0.4685792, 1, 1, 1, 1, 1,
0.1289361, -0.4603591, 3.094611, 1, 1, 1, 1, 1,
0.1318325, -0.5366273, 4.287976, 1, 1, 1, 1, 1,
0.1341318, 1.274211, 0.8367193, 1, 1, 1, 1, 1,
0.1345085, 0.3266804, 0.08626646, 1, 1, 1, 1, 1,
0.135401, -1.494235, 3.009527, 1, 1, 1, 1, 1,
0.135877, 0.3903521, 2.889349, 1, 1, 1, 1, 1,
0.1373575, -0.3912985, 3.438706, 1, 1, 1, 1, 1,
0.1396133, -0.1660542, 6.090051, 1, 1, 1, 1, 1,
0.1406011, 0.210842, 0.5232278, 0, 0, 1, 1, 1,
0.1420962, -0.8330175, 1.575997, 1, 0, 0, 1, 1,
0.1521998, -0.6658122, 3.069878, 1, 0, 0, 1, 1,
0.1551357, -1.888184, 2.363409, 1, 0, 0, 1, 1,
0.1570713, 1.067347, 3.020129, 1, 0, 0, 1, 1,
0.1638353, -0.04958905, 2.422638, 1, 0, 0, 1, 1,
0.1675043, -1.179664, 3.945811, 0, 0, 0, 1, 1,
0.1679654, -2.11631, 1.368397, 0, 0, 0, 1, 1,
0.170652, 0.08923963, 1.211982, 0, 0, 0, 1, 1,
0.1712689, -0.6088623, 2.604457, 0, 0, 0, 1, 1,
0.1730628, 1.588558, 1.048347, 0, 0, 0, 1, 1,
0.1735824, -0.5567704, 2.013868, 0, 0, 0, 1, 1,
0.1750986, 1.441037, -0.08156904, 0, 0, 0, 1, 1,
0.1757051, 1.563231, 0.8871786, 1, 1, 1, 1, 1,
0.1759305, -1.050911, 4.167589, 1, 1, 1, 1, 1,
0.182142, -0.6349785, 4.020169, 1, 1, 1, 1, 1,
0.1836831, 0.5511591, 1.816491, 1, 1, 1, 1, 1,
0.1884435, -0.2053078, 2.605413, 1, 1, 1, 1, 1,
0.1912353, 0.6341913, -0.5556662, 1, 1, 1, 1, 1,
0.1915264, -0.311038, 3.03406, 1, 1, 1, 1, 1,
0.1926013, 0.4962793, 0.06285409, 1, 1, 1, 1, 1,
0.2010467, 2.344049, 1.001372, 1, 1, 1, 1, 1,
0.2018158, -0.2287435, 4.074752, 1, 1, 1, 1, 1,
0.2043387, 0.9399228, 0.6465465, 1, 1, 1, 1, 1,
0.2080967, -1.680945, 5.507988, 1, 1, 1, 1, 1,
0.2139555, -1.131291, 3.174377, 1, 1, 1, 1, 1,
0.2244603, 0.8416342, -0.6024061, 1, 1, 1, 1, 1,
0.2262005, 0.32677, -0.1431127, 1, 1, 1, 1, 1,
0.2262499, -0.06046315, 1.415446, 0, 0, 1, 1, 1,
0.2296298, -1.286889, 4.253568, 1, 0, 0, 1, 1,
0.2314803, -0.356301, 2.381453, 1, 0, 0, 1, 1,
0.2323797, -0.4493248, 2.947706, 1, 0, 0, 1, 1,
0.2327769, 0.3147995, 1.329193, 1, 0, 0, 1, 1,
0.2359148, -2.039598, 3.34346, 1, 0, 0, 1, 1,
0.2407746, -2.228907, 4.205733, 0, 0, 0, 1, 1,
0.2425773, 0.5893705, 0.4557624, 0, 0, 0, 1, 1,
0.2427918, -0.2272541, 2.330091, 0, 0, 0, 1, 1,
0.2515239, -0.04600401, 1.5154, 0, 0, 0, 1, 1,
0.2523829, 1.10835, -0.2572851, 0, 0, 0, 1, 1,
0.2572736, -0.2982659, 1.529711, 0, 0, 0, 1, 1,
0.2581217, 0.2367629, 1.096216, 0, 0, 0, 1, 1,
0.2583603, -1.476375, 3.088003, 1, 1, 1, 1, 1,
0.2597851, -0.09442079, 1.549793, 1, 1, 1, 1, 1,
0.2603559, -1.572746, 3.921929, 1, 1, 1, 1, 1,
0.2720765, 0.9374393, -0.3577712, 1, 1, 1, 1, 1,
0.2726125, -2.48318, 4.759638, 1, 1, 1, 1, 1,
0.2767821, 1.405474, -0.3321631, 1, 1, 1, 1, 1,
0.28263, -1.855714, 1.595519, 1, 1, 1, 1, 1,
0.2841175, -0.3135511, 2.276169, 1, 1, 1, 1, 1,
0.2865435, -1.20645, 3.100233, 1, 1, 1, 1, 1,
0.287735, 0.2932672, 1.379542, 1, 1, 1, 1, 1,
0.2880735, 0.8491385, -0.2109382, 1, 1, 1, 1, 1,
0.2898201, -0.307071, 2.291813, 1, 1, 1, 1, 1,
0.2903028, 0.05339284, 2.316825, 1, 1, 1, 1, 1,
0.2910297, 0.6421548, 0.1816368, 1, 1, 1, 1, 1,
0.2932468, -0.1793522, 0.1486619, 1, 1, 1, 1, 1,
0.299704, -0.542252, 2.626413, 0, 0, 1, 1, 1,
0.3003749, 2.06479, 0.5930076, 1, 0, 0, 1, 1,
0.3036006, -0.756333, 2.931293, 1, 0, 0, 1, 1,
0.305587, -0.05238929, 0.7873743, 1, 0, 0, 1, 1,
0.3086853, -0.1970062, -0.005370715, 1, 0, 0, 1, 1,
0.3095479, 0.4125208, 1.315088, 1, 0, 0, 1, 1,
0.3135917, 0.01205196, 1.712411, 0, 0, 0, 1, 1,
0.3149597, -0.5301557, 2.311849, 0, 0, 0, 1, 1,
0.3173639, -0.589887, 2.480399, 0, 0, 0, 1, 1,
0.3197754, 1.164979, -0.05384161, 0, 0, 0, 1, 1,
0.3212467, -0.837956, 1.897403, 0, 0, 0, 1, 1,
0.3219682, -0.5707905, 3.589122, 0, 0, 0, 1, 1,
0.3221259, -0.4622052, 2.88545, 0, 0, 0, 1, 1,
0.3232882, -0.1422316, 2.078916, 1, 1, 1, 1, 1,
0.3238759, -0.3486919, 3.507116, 1, 1, 1, 1, 1,
0.3259801, -0.3177699, 2.042209, 1, 1, 1, 1, 1,
0.3265068, -0.4679157, 2.705986, 1, 1, 1, 1, 1,
0.3363184, 1.13272, 0.8714424, 1, 1, 1, 1, 1,
0.3411866, -2.089711, 3.556096, 1, 1, 1, 1, 1,
0.3452106, -1.351904, 3.331516, 1, 1, 1, 1, 1,
0.3454125, 0.7184309, 2.642793, 1, 1, 1, 1, 1,
0.3465723, -0.8827645, 2.298992, 1, 1, 1, 1, 1,
0.349422, 0.03153678, 1.394551, 1, 1, 1, 1, 1,
0.3552881, -0.1718215, 2.416785, 1, 1, 1, 1, 1,
0.3642445, 0.02032718, 2.458714, 1, 1, 1, 1, 1,
0.3676074, 0.6725142, -0.2739463, 1, 1, 1, 1, 1,
0.3689998, 0.1427729, 2.082759, 1, 1, 1, 1, 1,
0.3708938, 1.541736, -0.7080363, 1, 1, 1, 1, 1,
0.3721277, 0.629551, -1.745605, 0, 0, 1, 1, 1,
0.3722202, 0.392339, -1.595074, 1, 0, 0, 1, 1,
0.3737369, 0.2390625, 2.508103, 1, 0, 0, 1, 1,
0.3752052, 0.6672869, -1.749853, 1, 0, 0, 1, 1,
0.3788526, -0.02616393, 0.7095528, 1, 0, 0, 1, 1,
0.3834857, 0.3168215, 0.9774963, 1, 0, 0, 1, 1,
0.3868243, -0.2266165, 2.176645, 0, 0, 0, 1, 1,
0.3911077, 0.2282688, 0.4687156, 0, 0, 0, 1, 1,
0.3929381, -1.076367, 1.175705, 0, 0, 0, 1, 1,
0.3961006, 1.833714, 1.74267, 0, 0, 0, 1, 1,
0.3962297, 1.984517, 0.2710364, 0, 0, 0, 1, 1,
0.3966645, -0.04717615, 1.996896, 0, 0, 0, 1, 1,
0.4017937, 1.469635, 1.031288, 0, 0, 0, 1, 1,
0.4027346, 0.08497042, 1.838593, 1, 1, 1, 1, 1,
0.4098114, 1.050765, 1.214532, 1, 1, 1, 1, 1,
0.4139291, 0.2334562, 2.21338, 1, 1, 1, 1, 1,
0.4141451, 1.138953, -0.592019, 1, 1, 1, 1, 1,
0.414782, 1.029808, 1.259906, 1, 1, 1, 1, 1,
0.4201701, -0.9796429, 1.589022, 1, 1, 1, 1, 1,
0.4241233, 0.7090772, 0.6268378, 1, 1, 1, 1, 1,
0.4243715, 1.433154, 0.7225587, 1, 1, 1, 1, 1,
0.4272322, -0.4250312, 1.454805, 1, 1, 1, 1, 1,
0.4286601, -0.05178946, 1.714061, 1, 1, 1, 1, 1,
0.4338847, 0.2222253, 1.116865, 1, 1, 1, 1, 1,
0.4353507, 0.468474, 0.4798203, 1, 1, 1, 1, 1,
0.4388835, 0.8188713, -0.3262808, 1, 1, 1, 1, 1,
0.4409598, -0.3771852, 3.876256, 1, 1, 1, 1, 1,
0.4419451, 0.228115, 0.5727387, 1, 1, 1, 1, 1,
0.442486, -0.1241715, 1.922263, 0, 0, 1, 1, 1,
0.4434804, -1.081133, 3.116821, 1, 0, 0, 1, 1,
0.4445624, -0.6920273, 1.576976, 1, 0, 0, 1, 1,
0.4465434, 0.7960976, 1.736887, 1, 0, 0, 1, 1,
0.4469994, 2.465113, 0.617829, 1, 0, 0, 1, 1,
0.4493957, -0.1419723, 3.854272, 1, 0, 0, 1, 1,
0.4495672, -0.1040318, 0.08077462, 0, 0, 0, 1, 1,
0.4517726, -0.9214016, 2.903439, 0, 0, 0, 1, 1,
0.4563261, 0.2329119, 0.7577633, 0, 0, 0, 1, 1,
0.4580985, 1.57787, -0.9378846, 0, 0, 0, 1, 1,
0.458429, -0.7897272, 2.353358, 0, 0, 0, 1, 1,
0.4586215, 0.8053413, -0.3075713, 0, 0, 0, 1, 1,
0.4628268, -0.3972396, 1.961613, 0, 0, 0, 1, 1,
0.4655566, 0.4785753, 0.8161783, 1, 1, 1, 1, 1,
0.4659704, -0.5932459, 4.869956, 1, 1, 1, 1, 1,
0.4690468, -0.407532, 4.054361, 1, 1, 1, 1, 1,
0.4704777, 1.278006, -0.7047853, 1, 1, 1, 1, 1,
0.4715416, -0.1553864, 0.6728567, 1, 1, 1, 1, 1,
0.4722231, -1.072361, 4.304641, 1, 1, 1, 1, 1,
0.47281, 1.003649, -1.304389, 1, 1, 1, 1, 1,
0.4738496, -2.339226, 2.765047, 1, 1, 1, 1, 1,
0.4753605, -1.313149, 2.275332, 1, 1, 1, 1, 1,
0.4774018, 0.7584032, 1.765167, 1, 1, 1, 1, 1,
0.4798384, -0.1805358, 1.752887, 1, 1, 1, 1, 1,
0.4864684, -1.256234, 3.195957, 1, 1, 1, 1, 1,
0.4898002, 0.9427998, 0.7628994, 1, 1, 1, 1, 1,
0.4937057, 0.9539459, 0.1374703, 1, 1, 1, 1, 1,
0.4948718, 0.6550214, 0.6504835, 1, 1, 1, 1, 1,
0.5010736, 0.8056244, -0.6483204, 0, 0, 1, 1, 1,
0.5020894, -0.3468593, 2.031071, 1, 0, 0, 1, 1,
0.5025274, 2.431323, 0.08315674, 1, 0, 0, 1, 1,
0.5026045, 1.095525, 0.4418949, 1, 0, 0, 1, 1,
0.5099596, 0.6576186, -1.868253, 1, 0, 0, 1, 1,
0.5146963, -0.1503984, 1.257794, 1, 0, 0, 1, 1,
0.5311541, -0.720189, 3.833878, 0, 0, 0, 1, 1,
0.5333463, 1.336032, 2.449335, 0, 0, 0, 1, 1,
0.5358261, -0.549315, 2.479966, 0, 0, 0, 1, 1,
0.5375396, -1.43943, 5.189, 0, 0, 0, 1, 1,
0.5404784, -0.02797568, 1.687181, 0, 0, 0, 1, 1,
0.5506465, -1.355124, 2.659204, 0, 0, 0, 1, 1,
0.5540213, -0.542756, 2.190977, 0, 0, 0, 1, 1,
0.5558048, 0.303657, 2.125762, 1, 1, 1, 1, 1,
0.561975, 0.9658436, 1.736516, 1, 1, 1, 1, 1,
0.5640763, 1.419794, 0.3942534, 1, 1, 1, 1, 1,
0.5690926, 2.152731, -0.4042578, 1, 1, 1, 1, 1,
0.5693458, -0.3789073, 2.746928, 1, 1, 1, 1, 1,
0.5694113, 0.626529, 0.2496811, 1, 1, 1, 1, 1,
0.5754602, -0.9352417, 2.938252, 1, 1, 1, 1, 1,
0.5776814, 2.489029, -0.9387419, 1, 1, 1, 1, 1,
0.5811615, -0.1416386, 1.003944, 1, 1, 1, 1, 1,
0.5838661, -1.049213, 3.160076, 1, 1, 1, 1, 1,
0.5844694, -0.643691, 2.737941, 1, 1, 1, 1, 1,
0.5920222, 0.7451105, -0.2274504, 1, 1, 1, 1, 1,
0.5946041, 1.85571, 1.952932, 1, 1, 1, 1, 1,
0.596221, 1.272018, 0.05895185, 1, 1, 1, 1, 1,
0.6000949, -0.120856, 2.096825, 1, 1, 1, 1, 1,
0.6003155, -1.109633, 2.006228, 0, 0, 1, 1, 1,
0.6048683, 0.7389307, 1.19613, 1, 0, 0, 1, 1,
0.6051772, 0.07867335, 0.5222772, 1, 0, 0, 1, 1,
0.6074985, -2.381004, 2.161334, 1, 0, 0, 1, 1,
0.6086186, -0.3300888, 2.463199, 1, 0, 0, 1, 1,
0.6106771, -0.1825002, 2.872139, 1, 0, 0, 1, 1,
0.612347, -2.790279, 2.437407, 0, 0, 0, 1, 1,
0.6173995, -0.6222756, 1.741086, 0, 0, 0, 1, 1,
0.6223766, -0.5666062, 2.191476, 0, 0, 0, 1, 1,
0.6280015, 2.171123, 0.5727699, 0, 0, 0, 1, 1,
0.6293637, 1.187029, 1.501816, 0, 0, 0, 1, 1,
0.6294849, 0.6530115, 1.840358, 0, 0, 0, 1, 1,
0.6361219, -1.656733, 3.18993, 0, 0, 0, 1, 1,
0.6426638, 1.76941, 0.2865227, 1, 1, 1, 1, 1,
0.6442631, 1.713476, 0.1166803, 1, 1, 1, 1, 1,
0.6572835, 0.9210191, -1.240203, 1, 1, 1, 1, 1,
0.6644066, 1.409406, 0.401027, 1, 1, 1, 1, 1,
0.6664153, 0.2070768, 2.25956, 1, 1, 1, 1, 1,
0.666472, 1.016908, 0.2133311, 1, 1, 1, 1, 1,
0.6695906, 0.4793949, 1.909582, 1, 1, 1, 1, 1,
0.6757433, -1.277175, 3.951847, 1, 1, 1, 1, 1,
0.6792483, -0.4045458, 2.81743, 1, 1, 1, 1, 1,
0.679462, 0.6346948, -0.7902728, 1, 1, 1, 1, 1,
0.6824986, -0.2916682, 3.553773, 1, 1, 1, 1, 1,
0.6849146, 1.543934, -1.312459, 1, 1, 1, 1, 1,
0.6852828, 0.109422, 1.750737, 1, 1, 1, 1, 1,
0.6866961, -1.200277, 2.925576, 1, 1, 1, 1, 1,
0.6916396, 0.8088279, 1.237841, 1, 1, 1, 1, 1,
0.6949199, -0.07350903, 2.661433, 0, 0, 1, 1, 1,
0.7025387, -1.166461, 3.36582, 1, 0, 0, 1, 1,
0.708308, -1.379226, 1.50667, 1, 0, 0, 1, 1,
0.7098121, 0.6033518, -0.7050335, 1, 0, 0, 1, 1,
0.7173106, -0.4383321, 2.31565, 1, 0, 0, 1, 1,
0.7196506, -1.470199, 3.290054, 1, 0, 0, 1, 1,
0.7198224, -0.09597391, 3.516201, 0, 0, 0, 1, 1,
0.7237887, -0.568017, 2.329391, 0, 0, 0, 1, 1,
0.7285621, 0.2251744, 1.529966, 0, 0, 0, 1, 1,
0.7293044, 0.4016552, 0.4585902, 0, 0, 0, 1, 1,
0.7336731, 0.5566698, 0.0557251, 0, 0, 0, 1, 1,
0.7367731, -1.657012, 1.782873, 0, 0, 0, 1, 1,
0.7407281, -0.9377842, 3.073468, 0, 0, 0, 1, 1,
0.7433491, 0.3470428, 0.9401861, 1, 1, 1, 1, 1,
0.7437167, 0.5835529, 0.1635807, 1, 1, 1, 1, 1,
0.7459371, -0.2503746, 1.309306, 1, 1, 1, 1, 1,
0.7475421, -0.5170613, 3.129738, 1, 1, 1, 1, 1,
0.7533638, 0.1005099, 0.3611197, 1, 1, 1, 1, 1,
0.7539254, -0.9422841, 3.575282, 1, 1, 1, 1, 1,
0.757136, -1.70747, 2.327919, 1, 1, 1, 1, 1,
0.7598431, -0.3301305, 0.7902775, 1, 1, 1, 1, 1,
0.7600862, -1.0334, 3.478349, 1, 1, 1, 1, 1,
0.7605111, -0.1651502, 2.537801, 1, 1, 1, 1, 1,
0.7607561, -0.4491532, 1.78189, 1, 1, 1, 1, 1,
0.7607791, 1.263246, 1.397926, 1, 1, 1, 1, 1,
0.7621624, -1.403353, 1.306059, 1, 1, 1, 1, 1,
0.7643643, -1.179661, 1.472398, 1, 1, 1, 1, 1,
0.7654712, 2.418052, 2.024858, 1, 1, 1, 1, 1,
0.7656446, 0.208692, 0.4933754, 0, 0, 1, 1, 1,
0.7709984, -0.3927516, 2.813717, 1, 0, 0, 1, 1,
0.7818198, -0.8885649, 1.4691, 1, 0, 0, 1, 1,
0.7842127, -0.25602, 0.2274205, 1, 0, 0, 1, 1,
0.7874753, -0.8546156, 3.120434, 1, 0, 0, 1, 1,
0.7893769, -1.279852, 3.03463, 1, 0, 0, 1, 1,
0.7922598, -0.2232354, 1.647918, 0, 0, 0, 1, 1,
0.799611, -0.7251962, 2.514443, 0, 0, 0, 1, 1,
0.8001637, 0.07805192, 1.363768, 0, 0, 0, 1, 1,
0.8038117, 0.8579463, -0.3543838, 0, 0, 0, 1, 1,
0.8060557, -1.092285, 1.305462, 0, 0, 0, 1, 1,
0.8141276, -0.4157201, 2.450513, 0, 0, 0, 1, 1,
0.8154707, 0.5482139, 1.822967, 0, 0, 0, 1, 1,
0.8171934, 1.226726, 1.773782, 1, 1, 1, 1, 1,
0.8202016, -0.4018861, 2.136386, 1, 1, 1, 1, 1,
0.8212674, -0.269738, 0.9785107, 1, 1, 1, 1, 1,
0.8213711, -1.669868, 2.756299, 1, 1, 1, 1, 1,
0.8214457, -1.243187, 1.997472, 1, 1, 1, 1, 1,
0.8246137, -1.423406, 3.976741, 1, 1, 1, 1, 1,
0.8254839, -0.07989523, 2.325562, 1, 1, 1, 1, 1,
0.8255534, -0.9455138, 4.550685, 1, 1, 1, 1, 1,
0.8282782, -0.1448365, 2.185367, 1, 1, 1, 1, 1,
0.8402149, -0.09085838, 1.010398, 1, 1, 1, 1, 1,
0.8406119, 0.5705287, 0.7008629, 1, 1, 1, 1, 1,
0.8445811, -1.702498, 2.137522, 1, 1, 1, 1, 1,
0.8456946, 0.8111356, 1.131029, 1, 1, 1, 1, 1,
0.8481832, 0.3288659, 1.032289, 1, 1, 1, 1, 1,
0.8599328, -1.456568, 2.372318, 1, 1, 1, 1, 1,
0.8599834, -0.04956946, 2.378596, 0, 0, 1, 1, 1,
0.8620482, 0.4884064, 1.497485, 1, 0, 0, 1, 1,
0.8636048, -2.201828, 4.285431, 1, 0, 0, 1, 1,
0.8665602, -0.7933179, 1.889269, 1, 0, 0, 1, 1,
0.867283, -0.750795, 1.026307, 1, 0, 0, 1, 1,
0.8714883, 0.2702323, 0.1181819, 1, 0, 0, 1, 1,
0.8759788, 0.9555737, 0.51042, 0, 0, 0, 1, 1,
0.8771808, 0.9994617, -0.9848248, 0, 0, 0, 1, 1,
0.8786317, 0.1028287, 2.321944, 0, 0, 0, 1, 1,
0.8851767, -0.02451915, 2.167147, 0, 0, 0, 1, 1,
0.8877279, 0.7407922, -1.629548, 0, 0, 0, 1, 1,
0.887951, 1.15262, 0.1593273, 0, 0, 0, 1, 1,
0.8881035, -0.3525266, 3.25067, 0, 0, 0, 1, 1,
0.8889657, -0.1885916, 4.074383, 1, 1, 1, 1, 1,
0.8923989, -0.5111297, 1.659336, 1, 1, 1, 1, 1,
0.8933985, 0.1975005, 2.334385, 1, 1, 1, 1, 1,
0.9056317, 1.199502, 3.587603, 1, 1, 1, 1, 1,
0.9114345, 1.368422, 2.627399, 1, 1, 1, 1, 1,
0.9141946, -1.229403, 2.457957, 1, 1, 1, 1, 1,
0.9198622, 0.3828846, -0.2535726, 1, 1, 1, 1, 1,
0.9241616, -0.8349941, 2.595332, 1, 1, 1, 1, 1,
0.9254141, 0.02566396, 0.2103281, 1, 1, 1, 1, 1,
0.9280558, 0.7063597, -0.8816267, 1, 1, 1, 1, 1,
0.9341592, 0.2473053, 0.4648369, 1, 1, 1, 1, 1,
0.9342293, 1.046477, 3.113784, 1, 1, 1, 1, 1,
0.9355819, -0.7763456, 1.497353, 1, 1, 1, 1, 1,
0.9474416, -0.4464967, 3.978804, 1, 1, 1, 1, 1,
0.9503868, -0.440641, 0.3129558, 1, 1, 1, 1, 1,
0.9510864, -0.52762, 1.467242, 0, 0, 1, 1, 1,
0.9529334, -0.2928522, 3.534553, 1, 0, 0, 1, 1,
0.9574454, 0.6615791, 0.9357677, 1, 0, 0, 1, 1,
0.9733163, -0.4460005, 2.226739, 1, 0, 0, 1, 1,
0.9868196, -0.2894502, 0.9904127, 1, 0, 0, 1, 1,
0.9904094, -0.5133988, 1.325563, 1, 0, 0, 1, 1,
0.9958953, -0.8465219, 2.358692, 0, 0, 0, 1, 1,
1.01291, -1.181984, 1.599079, 0, 0, 0, 1, 1,
1.016753, 0.248187, 1.590085, 0, 0, 0, 1, 1,
1.017234, 1.009227, 1.000752, 0, 0, 0, 1, 1,
1.023239, -2.155594, 2.497334, 0, 0, 0, 1, 1,
1.028191, -0.7921959, 1.712973, 0, 0, 0, 1, 1,
1.039775, 0.621587, 1.737817, 0, 0, 0, 1, 1,
1.040228, -0.1555137, 2.819317, 1, 1, 1, 1, 1,
1.042761, -0.9508263, 3.291132, 1, 1, 1, 1, 1,
1.042955, 0.4273083, -0.04740675, 1, 1, 1, 1, 1,
1.043504, 1.387283, 1.963096, 1, 1, 1, 1, 1,
1.043888, 1.355624, 0.114933, 1, 1, 1, 1, 1,
1.046405, 1.076336, -0.7725804, 1, 1, 1, 1, 1,
1.047013, -0.3982901, 1.914541, 1, 1, 1, 1, 1,
1.06143, -0.1489734, 2.185659, 1, 1, 1, 1, 1,
1.065736, 0.9297996, 1.755471, 1, 1, 1, 1, 1,
1.072491, -1.590335, 3.309977, 1, 1, 1, 1, 1,
1.074739, 0.184105, 0.7228757, 1, 1, 1, 1, 1,
1.07551, 1.245657, 0.319897, 1, 1, 1, 1, 1,
1.081902, -0.7819547, 4.081719, 1, 1, 1, 1, 1,
1.086036, 0.0603812, 1.118118, 1, 1, 1, 1, 1,
1.090091, -1.026634, 2.600594, 1, 1, 1, 1, 1,
1.097163, 1.829744, 1.767737, 0, 0, 1, 1, 1,
1.102895, 0.07040902, 3.161819, 1, 0, 0, 1, 1,
1.114761, -1.559559, 1.75399, 1, 0, 0, 1, 1,
1.114768, 1.157451, 2.124222, 1, 0, 0, 1, 1,
1.115035, -0.1997142, 1.10936, 1, 0, 0, 1, 1,
1.115186, 1.275756, -0.2957053, 1, 0, 0, 1, 1,
1.115611, -0.1083701, 0.8895417, 0, 0, 0, 1, 1,
1.116276, -0.4595088, 3.420184, 0, 0, 0, 1, 1,
1.126659, -0.02246751, 2.041464, 0, 0, 0, 1, 1,
1.127721, 0.4895358, 1.325505, 0, 0, 0, 1, 1,
1.143518, -0.758687, 2.359567, 0, 0, 0, 1, 1,
1.146404, -1.674552, 3.76509, 0, 0, 0, 1, 1,
1.149015, -0.1811062, 3.154045, 0, 0, 0, 1, 1,
1.151255, -0.01951887, 1.72566, 1, 1, 1, 1, 1,
1.174494, -1.365683, 0.8368743, 1, 1, 1, 1, 1,
1.180523, 1.426428, 1.357438, 1, 1, 1, 1, 1,
1.180844, -1.233012, 2.635053, 1, 1, 1, 1, 1,
1.186395, 0.5682534, 1.211064, 1, 1, 1, 1, 1,
1.188406, -0.2155257, 2.914015, 1, 1, 1, 1, 1,
1.18996, -0.7685316, 1.4004, 1, 1, 1, 1, 1,
1.194424, -0.7375125, 2.542107, 1, 1, 1, 1, 1,
1.199062, -0.164075, 1.511375, 1, 1, 1, 1, 1,
1.201704, 0.4118149, 2.186948, 1, 1, 1, 1, 1,
1.208259, -0.0344866, 1.354523, 1, 1, 1, 1, 1,
1.209423, -2.054032, 1.730852, 1, 1, 1, 1, 1,
1.216917, 0.9735219, 0.9067616, 1, 1, 1, 1, 1,
1.223164, 0.3213696, 1.401453, 1, 1, 1, 1, 1,
1.223777, 0.2781295, 1.000429, 1, 1, 1, 1, 1,
1.22673, -1.302326, 3.114743, 0, 0, 1, 1, 1,
1.233761, -0.606842, 1.041728, 1, 0, 0, 1, 1,
1.237564, 0.761989, 0.1967547, 1, 0, 0, 1, 1,
1.242953, 0.6264914, 1.014453, 1, 0, 0, 1, 1,
1.251008, -0.6016489, -0.1523926, 1, 0, 0, 1, 1,
1.251769, -1.134373, 3.110154, 1, 0, 0, 1, 1,
1.252025, -0.3024147, -0.1012364, 0, 0, 0, 1, 1,
1.252127, 0.1907884, 2.027702, 0, 0, 0, 1, 1,
1.255014, -0.2030343, 2.221496, 0, 0, 0, 1, 1,
1.26256, 0.7401397, 2.224396, 0, 0, 0, 1, 1,
1.271855, 0.6865637, 3.448335, 0, 0, 0, 1, 1,
1.279074, -0.2809758, 3.514349, 0, 0, 0, 1, 1,
1.293732, 0.8524958, 1.340682, 0, 0, 0, 1, 1,
1.295374, 0.7918136, 2.403021, 1, 1, 1, 1, 1,
1.296631, 0.3354928, 1.850756, 1, 1, 1, 1, 1,
1.299414, 0.1753474, 0.1608077, 1, 1, 1, 1, 1,
1.299497, -0.1848995, 1.807278, 1, 1, 1, 1, 1,
1.300394, 0.141299, 0.871549, 1, 1, 1, 1, 1,
1.306412, 0.3488611, 1.284879, 1, 1, 1, 1, 1,
1.311404, 1.121695, 2.030944, 1, 1, 1, 1, 1,
1.324938, 0.6756331, -0.6141899, 1, 1, 1, 1, 1,
1.330154, -0.2231656, 1.395317, 1, 1, 1, 1, 1,
1.333405, 0.7383576, 0.1791439, 1, 1, 1, 1, 1,
1.334605, 0.6807632, 1.192439, 1, 1, 1, 1, 1,
1.341568, 1.357676, 1.908791, 1, 1, 1, 1, 1,
1.355222, -0.7704264, 0.2903755, 1, 1, 1, 1, 1,
1.358721, -0.1217709, 1.617383, 1, 1, 1, 1, 1,
1.371127, -0.09094974, 0.9751688, 1, 1, 1, 1, 1,
1.378259, 0.2567231, 1.872949, 0, 0, 1, 1, 1,
1.383231, 0.6506476, 1.703323, 1, 0, 0, 1, 1,
1.384443, 0.103341, 0.3955016, 1, 0, 0, 1, 1,
1.402625, -0.5595126, 2.855097, 1, 0, 0, 1, 1,
1.403286, 0.2247621, 1.903888, 1, 0, 0, 1, 1,
1.407583, -2.247521, 2.880577, 1, 0, 0, 1, 1,
1.446272, 0.3312885, 2.637357, 0, 0, 0, 1, 1,
1.453995, -1.432959, 3.10981, 0, 0, 0, 1, 1,
1.457347, -0.7080075, 1.262903, 0, 0, 0, 1, 1,
1.464642, -0.2604075, 0.9375945, 0, 0, 0, 1, 1,
1.470531, -1.974646, 2.012728, 0, 0, 0, 1, 1,
1.474638, -1.053502, 1.034002, 0, 0, 0, 1, 1,
1.475593, -0.39342, 2.225183, 0, 0, 0, 1, 1,
1.476128, 1.394039, 0.8110012, 1, 1, 1, 1, 1,
1.482439, -0.09707621, 1.764903, 1, 1, 1, 1, 1,
1.487098, -0.5731797, -1.590106, 1, 1, 1, 1, 1,
1.497641, -0.947149, 1.251098, 1, 1, 1, 1, 1,
1.497648, -1.23591, 3.185462, 1, 1, 1, 1, 1,
1.502559, -0.2668428, 1.484044, 1, 1, 1, 1, 1,
1.513427, -0.7373987, 0.2239687, 1, 1, 1, 1, 1,
1.519305, -1.104564, 0.6682726, 1, 1, 1, 1, 1,
1.526471, 1.269048, 1.443881, 1, 1, 1, 1, 1,
1.542225, -1.24307, 3.680709, 1, 1, 1, 1, 1,
1.54753, -0.09986927, 3.32036, 1, 1, 1, 1, 1,
1.5504, -0.8703781, 2.151728, 1, 1, 1, 1, 1,
1.576708, 2.253705, 1.840355, 1, 1, 1, 1, 1,
1.582085, -1.990679, 2.151019, 1, 1, 1, 1, 1,
1.589956, -0.06781197, 2.140568, 1, 1, 1, 1, 1,
1.600405, -0.3077339, -0.6615195, 0, 0, 1, 1, 1,
1.62872, -0.9571884, 3.393204, 1, 0, 0, 1, 1,
1.657489, 0.04335019, 3.217889, 1, 0, 0, 1, 1,
1.704662, -0.6894071, 0.9649879, 1, 0, 0, 1, 1,
1.705107, -0.5970833, 0.857421, 1, 0, 0, 1, 1,
1.723628, 1.041686, -0.8431092, 1, 0, 0, 1, 1,
1.740687, 0.6976799, 1.764857, 0, 0, 0, 1, 1,
1.741573, -0.09796205, 1.199916, 0, 0, 0, 1, 1,
1.744447, -1.218503, 3.062663, 0, 0, 0, 1, 1,
1.760604, 1.474591, 2.060312, 0, 0, 0, 1, 1,
1.773408, 1.467018, 2.39006, 0, 0, 0, 1, 1,
1.77553, 0.5713646, 1.019537, 0, 0, 0, 1, 1,
1.795769, 0.6036574, 1.680577, 0, 0, 0, 1, 1,
1.800056, 0.1271563, 2.866337, 1, 1, 1, 1, 1,
1.800232, 1.243867, 1.706234, 1, 1, 1, 1, 1,
1.82869, 0.3322391, 0.7063019, 1, 1, 1, 1, 1,
1.834715, -0.928991, 2.376689, 1, 1, 1, 1, 1,
1.879904, -0.9516707, 1.761541, 1, 1, 1, 1, 1,
1.907386, 0.7333961, 1.412145, 1, 1, 1, 1, 1,
1.91543, -0.3197722, 1.872159, 1, 1, 1, 1, 1,
1.925536, -0.2965785, 1.855873, 1, 1, 1, 1, 1,
1.948977, 0.03024398, 0.3330974, 1, 1, 1, 1, 1,
1.97915, -0.5252445, 0.1416694, 1, 1, 1, 1, 1,
1.989879, -1.915097, 2.837405, 1, 1, 1, 1, 1,
1.99013, 1.029826, 0.1125265, 1, 1, 1, 1, 1,
2.03969, -2.017448, 2.937809, 1, 1, 1, 1, 1,
2.040514, 1.164251, 0.2538179, 1, 1, 1, 1, 1,
2.083359, -0.2948955, 1.627524, 1, 1, 1, 1, 1,
2.084042, 0.5584326, 1.224594, 0, 0, 1, 1, 1,
2.098104, -0.2940656, 1.822999, 1, 0, 0, 1, 1,
2.101211, -0.261709, -0.2648835, 1, 0, 0, 1, 1,
2.101511, -0.9667208, 4.008665, 1, 0, 0, 1, 1,
2.135798, 1.14866, 1.466809, 1, 0, 0, 1, 1,
2.168841, 0.6779805, 3.237477, 1, 0, 0, 1, 1,
2.184791, 0.1385365, 2.925782, 0, 0, 0, 1, 1,
2.275755, 0.4874048, 0.1821001, 0, 0, 0, 1, 1,
2.277986, 2.439312, 2.305381, 0, 0, 0, 1, 1,
2.337806, -0.001311277, 1.677369, 0, 0, 0, 1, 1,
2.361776, 0.8165095, 1.277468, 0, 0, 0, 1, 1,
2.366894, -0.8920557, 2.259132, 0, 0, 0, 1, 1,
2.422553, -0.8362988, 1.640961, 0, 0, 0, 1, 1,
2.453639, -1.507136, 2.142503, 1, 1, 1, 1, 1,
2.545371, 0.6039342, 1.318319, 1, 1, 1, 1, 1,
2.614203, -1.22049, 1.254972, 1, 1, 1, 1, 1,
2.615887, 0.07848361, 1.556219, 1, 1, 1, 1, 1,
2.657885, -0.3421851, 1.495785, 1, 1, 1, 1, 1,
2.779098, 0.3500505, 3.167926, 1, 1, 1, 1, 1,
2.887702, -0.1650418, 2.11018, 1, 1, 1, 1, 1
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
var radius = 10.08165;
var distance = 35.41138;
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
mvMatrix.translate( 0.1344365, -0.07903874, 0.127192 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.41138);
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
