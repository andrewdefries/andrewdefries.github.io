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
-2.77634, 0.04975904, -1.568612, 1, 0, 0, 1,
-2.607049, 0.2002811, -1.734373, 1, 0.007843138, 0, 1,
-2.494676, 1.798347, -0.3356773, 1, 0.01176471, 0, 1,
-2.491967, -0.5810343, -2.600126, 1, 0.01960784, 0, 1,
-2.489496, 0.7480826, -0.4069063, 1, 0.02352941, 0, 1,
-2.435989, 0.3128412, -1.726662, 1, 0.03137255, 0, 1,
-2.422408, -0.2992881, -3.618278, 1, 0.03529412, 0, 1,
-2.415114, -0.3585904, -2.443431, 1, 0.04313726, 0, 1,
-2.410762, -0.05383808, -1.87656, 1, 0.04705882, 0, 1,
-2.369209, -1.408091, -2.265558, 1, 0.05490196, 0, 1,
-2.358594, 0.7723294, -1.891789, 1, 0.05882353, 0, 1,
-2.35254, 0.1436097, -1.745624, 1, 0.06666667, 0, 1,
-2.335191, 0.03555117, -2.825291, 1, 0.07058824, 0, 1,
-2.306029, 0.4821467, -2.054083, 1, 0.07843138, 0, 1,
-2.304372, 1.262534, 0.8928725, 1, 0.08235294, 0, 1,
-2.19762, -0.9226087, -1.875652, 1, 0.09019608, 0, 1,
-2.185295, 0.2116126, -2.733169, 1, 0.09411765, 0, 1,
-2.157697, 1.710781, -0.5192493, 1, 0.1019608, 0, 1,
-2.149693, -0.4067658, -1.438398, 1, 0.1098039, 0, 1,
-2.109232, 0.3637343, -0.870578, 1, 0.1137255, 0, 1,
-2.108577, 0.1980816, -0.05493892, 1, 0.1215686, 0, 1,
-2.038568, -1.367545, -2.771529, 1, 0.1254902, 0, 1,
-2.011901, -0.7556632, -2.857435, 1, 0.1333333, 0, 1,
-1.999922, -1.70559, -0.3904825, 1, 0.1372549, 0, 1,
-1.994041, -1.262411, -3.784538, 1, 0.145098, 0, 1,
-1.952061, 2.441114, -1.513068, 1, 0.1490196, 0, 1,
-1.934717, -0.1876326, -1.418535, 1, 0.1568628, 0, 1,
-1.903394, 0.1922552, 0.8620908, 1, 0.1607843, 0, 1,
-1.896717, 0.6186357, -0.4473888, 1, 0.1686275, 0, 1,
-1.848778, 0.3705212, -1.916722, 1, 0.172549, 0, 1,
-1.842865, -0.3892566, -2.753612, 1, 0.1803922, 0, 1,
-1.820337, -0.5085912, -0.5874182, 1, 0.1843137, 0, 1,
-1.814061, -0.2538347, -1.395237, 1, 0.1921569, 0, 1,
-1.806839, 0.3891682, -1.147664, 1, 0.1960784, 0, 1,
-1.800245, -0.9282527, -4.387766, 1, 0.2039216, 0, 1,
-1.785383, -0.04029461, -1.024346, 1, 0.2117647, 0, 1,
-1.780836, -1.221482, -3.552507, 1, 0.2156863, 0, 1,
-1.776754, -2.072684, -2.495419, 1, 0.2235294, 0, 1,
-1.765723, 1.731867, -0.300106, 1, 0.227451, 0, 1,
-1.735349, 1.619153, -0.78088, 1, 0.2352941, 0, 1,
-1.734398, 0.03657983, -0.2445666, 1, 0.2392157, 0, 1,
-1.734079, 0.5088975, -1.288198, 1, 0.2470588, 0, 1,
-1.714785, -1.137405, -0.3148873, 1, 0.2509804, 0, 1,
-1.701593, -0.271843, -1.743122, 1, 0.2588235, 0, 1,
-1.695911, 0.5247375, -0.847489, 1, 0.2627451, 0, 1,
-1.686891, -0.1848269, -2.769038, 1, 0.2705882, 0, 1,
-1.658185, 2.188191, -0.7224264, 1, 0.2745098, 0, 1,
-1.654577, 0.1305047, 0.2401984, 1, 0.282353, 0, 1,
-1.646769, -0.847888, -1.014288, 1, 0.2862745, 0, 1,
-1.633504, -1.290793, -2.344248, 1, 0.2941177, 0, 1,
-1.633474, 0.9479895, -0.1927488, 1, 0.3019608, 0, 1,
-1.630301, 0.5143923, -1.186061, 1, 0.3058824, 0, 1,
-1.619177, -0.3076763, -1.030135, 1, 0.3137255, 0, 1,
-1.617375, 1.097447, -0.2446964, 1, 0.3176471, 0, 1,
-1.616387, -0.7030094, -3.086295, 1, 0.3254902, 0, 1,
-1.61534, 0.9012543, -0.9974953, 1, 0.3294118, 0, 1,
-1.606624, 0.3357952, -0.2887744, 1, 0.3372549, 0, 1,
-1.605304, 0.1901634, -2.022292, 1, 0.3411765, 0, 1,
-1.598471, -0.6504804, -2.947037, 1, 0.3490196, 0, 1,
-1.588133, 1.244427, -1.001559, 1, 0.3529412, 0, 1,
-1.587959, -0.2955969, -2.714841, 1, 0.3607843, 0, 1,
-1.556618, 0.5799547, -2.280907, 1, 0.3647059, 0, 1,
-1.549953, 0.1598456, -4.12558, 1, 0.372549, 0, 1,
-1.542117, -0.1839155, -0.2939176, 1, 0.3764706, 0, 1,
-1.536399, 1.216036, -0.3161228, 1, 0.3843137, 0, 1,
-1.534146, -1.484416, -3.381508, 1, 0.3882353, 0, 1,
-1.525896, -1.45481, -2.194774, 1, 0.3960784, 0, 1,
-1.50338, 1.109142, -1.405307, 1, 0.4039216, 0, 1,
-1.492008, -1.930582, -1.815104, 1, 0.4078431, 0, 1,
-1.491591, -0.2708747, -1.274253, 1, 0.4156863, 0, 1,
-1.485104, 0.2079845, -1.74758, 1, 0.4196078, 0, 1,
-1.472104, -0.5430019, -0.3648779, 1, 0.427451, 0, 1,
-1.45888, 0.03670136, -2.604705, 1, 0.4313726, 0, 1,
-1.458279, -0.1482417, -1.151926, 1, 0.4392157, 0, 1,
-1.432861, -1.7652, -4.078124, 1, 0.4431373, 0, 1,
-1.432665, 1.3033, -2.919434, 1, 0.4509804, 0, 1,
-1.421499, -1.979837, -2.742316, 1, 0.454902, 0, 1,
-1.41979, -0.9925081, -4.713737, 1, 0.4627451, 0, 1,
-1.418959, -1.156292, -1.284621, 1, 0.4666667, 0, 1,
-1.418294, -0.09301074, -2.436699, 1, 0.4745098, 0, 1,
-1.399742, -0.2972579, -2.573152, 1, 0.4784314, 0, 1,
-1.399181, -1.831716, -1.867116, 1, 0.4862745, 0, 1,
-1.392008, -0.4363107, -1.298317, 1, 0.4901961, 0, 1,
-1.389633, 1.408383, -1.42685, 1, 0.4980392, 0, 1,
-1.381026, 0.5646375, -2.685287, 1, 0.5058824, 0, 1,
-1.379796, 0.3203422, -0.5572578, 1, 0.509804, 0, 1,
-1.37347, -0.8213727, -3.920736, 1, 0.5176471, 0, 1,
-1.370961, -0.3706304, -0.2405894, 1, 0.5215687, 0, 1,
-1.359179, 1.158173, -1.815496, 1, 0.5294118, 0, 1,
-1.358712, -0.1687079, -2.397663, 1, 0.5333334, 0, 1,
-1.330469, -0.3550919, -2.290774, 1, 0.5411765, 0, 1,
-1.325087, -0.9542063, -1.219956, 1, 0.5450981, 0, 1,
-1.321105, 0.070671, -1.569874, 1, 0.5529412, 0, 1,
-1.318834, -2.030265, -2.331251, 1, 0.5568628, 0, 1,
-1.315717, -0.643977, -0.5953639, 1, 0.5647059, 0, 1,
-1.309952, -1.82397, -2.601043, 1, 0.5686275, 0, 1,
-1.301833, -0.8831438, -3.418618, 1, 0.5764706, 0, 1,
-1.277542, 0.20452, -0.4175644, 1, 0.5803922, 0, 1,
-1.275745, -0.8713243, -2.343387, 1, 0.5882353, 0, 1,
-1.273937, -0.7634055, -2.602112, 1, 0.5921569, 0, 1,
-1.27241, 1.795044, -0.3166143, 1, 0.6, 0, 1,
-1.255623, -1.376345, -2.676633, 1, 0.6078432, 0, 1,
-1.247983, 1.950148, -0.5795217, 1, 0.6117647, 0, 1,
-1.245541, -1.327524, -2.000924, 1, 0.6196079, 0, 1,
-1.23749, -0.06865422, -1.556242, 1, 0.6235294, 0, 1,
-1.235911, 1.22159, -1.59493, 1, 0.6313726, 0, 1,
-1.231426, 0.7076046, -0.159166, 1, 0.6352941, 0, 1,
-1.23124, -0.2304479, -2.475376, 1, 0.6431373, 0, 1,
-1.228041, -1.138533, -5.527185, 1, 0.6470588, 0, 1,
-1.225748, 1.349629, -1.920982, 1, 0.654902, 0, 1,
-1.223751, 1.133842, -1.004016, 1, 0.6588235, 0, 1,
-1.221352, -1.406948, -0.6961378, 1, 0.6666667, 0, 1,
-1.217181, 0.5359165, -0.7546353, 1, 0.6705883, 0, 1,
-1.215754, -1.355227, -3.30163, 1, 0.6784314, 0, 1,
-1.214105, 0.9758268, -1.091354, 1, 0.682353, 0, 1,
-1.208538, 0.292372, -1.20124, 1, 0.6901961, 0, 1,
-1.206744, -0.693067, -1.712585, 1, 0.6941177, 0, 1,
-1.205941, -0.5461575, -1.391973, 1, 0.7019608, 0, 1,
-1.199547, -0.8252195, -1.59985, 1, 0.7098039, 0, 1,
-1.192284, -1.332321, -0.9188313, 1, 0.7137255, 0, 1,
-1.185396, -0.5837513, -1.300564, 1, 0.7215686, 0, 1,
-1.170141, 0.2851308, -0.915466, 1, 0.7254902, 0, 1,
-1.168159, -1.787218, -2.896703, 1, 0.7333333, 0, 1,
-1.164272, -0.7858382, -3.826542, 1, 0.7372549, 0, 1,
-1.158936, 1.279675, -1.175755, 1, 0.7450981, 0, 1,
-1.157367, 0.4248011, 0.259214, 1, 0.7490196, 0, 1,
-1.148409, -0.9765664, -4.144203, 1, 0.7568628, 0, 1,
-1.129139, -0.3752978, -1.112427, 1, 0.7607843, 0, 1,
-1.125115, 0.09257191, -2.4341, 1, 0.7686275, 0, 1,
-1.115318, 0.1296905, -1.022352, 1, 0.772549, 0, 1,
-1.11101, 1.745162, -0.7298433, 1, 0.7803922, 0, 1,
-1.10878, 0.5870407, -0.5917203, 1, 0.7843137, 0, 1,
-1.09982, 1.514868, 0.7845946, 1, 0.7921569, 0, 1,
-1.096494, 0.8240391, -1.890852, 1, 0.7960784, 0, 1,
-1.088785, -0.2616571, -0.8575515, 1, 0.8039216, 0, 1,
-1.085444, 2.00181, -0.3575025, 1, 0.8117647, 0, 1,
-1.079595, -1.095804, -1.833234, 1, 0.8156863, 0, 1,
-1.079338, 0.1158787, -0.1126089, 1, 0.8235294, 0, 1,
-1.078444, 0.7312726, -2.354027, 1, 0.827451, 0, 1,
-1.07818, -0.675733, -0.2793744, 1, 0.8352941, 0, 1,
-1.075352, -0.6935207, -2.655418, 1, 0.8392157, 0, 1,
-1.074231, 1.495059, 0.8503605, 1, 0.8470588, 0, 1,
-1.07411, -0.02251474, -1.763691, 1, 0.8509804, 0, 1,
-1.071144, 1.192628, 0.9915273, 1, 0.8588235, 0, 1,
-1.067758, 0.07473141, -2.605213, 1, 0.8627451, 0, 1,
-1.067308, -0.05093507, -2.044845, 1, 0.8705882, 0, 1,
-1.061665, 0.3260218, -0.9662971, 1, 0.8745098, 0, 1,
-1.039812, 1.43628, -0.3018266, 1, 0.8823529, 0, 1,
-1.038246, -0.3359869, -1.844759, 1, 0.8862745, 0, 1,
-1.035973, -0.1991806, -2.810289, 1, 0.8941177, 0, 1,
-1.028597, 0.7103093, 0.0550919, 1, 0.8980392, 0, 1,
-1.019837, -1.313678, -1.319586, 1, 0.9058824, 0, 1,
-1.007779, -0.236475, -1.29168, 1, 0.9137255, 0, 1,
-1.000903, -0.5073887, -0.617083, 1, 0.9176471, 0, 1,
-1.000186, 1.138974, -0.5372118, 1, 0.9254902, 0, 1,
-0.9989711, -0.6183863, -0.2237131, 1, 0.9294118, 0, 1,
-0.9986458, 2.471562, 1.892242, 1, 0.9372549, 0, 1,
-0.9938928, 0.799679, -0.9138058, 1, 0.9411765, 0, 1,
-0.9928705, -0.9328709, -2.628991, 1, 0.9490196, 0, 1,
-0.9902518, -0.1153006, -1.933416, 1, 0.9529412, 0, 1,
-0.9866223, -0.9683752, -1.159044, 1, 0.9607843, 0, 1,
-0.9839142, 1.281624, -2.312254, 1, 0.9647059, 0, 1,
-0.9831812, -0.7373623, -0.2607882, 1, 0.972549, 0, 1,
-0.9828193, -0.5101025, -1.801558, 1, 0.9764706, 0, 1,
-0.980425, -0.9548191, -3.210612, 1, 0.9843137, 0, 1,
-0.9780691, -0.5561981, -2.978024, 1, 0.9882353, 0, 1,
-0.9777516, 1.516307, -1.124518, 1, 0.9960784, 0, 1,
-0.9723164, 0.06295639, -0.1787917, 0.9960784, 1, 0, 1,
-0.966336, -1.40065, -3.781755, 0.9921569, 1, 0, 1,
-0.9503721, 0.395952, -0.03866168, 0.9843137, 1, 0, 1,
-0.9486572, -0.3427002, -2.978926, 0.9803922, 1, 0, 1,
-0.9458822, -0.7122573, -3.116874, 0.972549, 1, 0, 1,
-0.9395638, 0.9141821, 0.2248952, 0.9686275, 1, 0, 1,
-0.9395598, -1.928854, -1.326883, 0.9607843, 1, 0, 1,
-0.938632, 0.8559688, -0.9960747, 0.9568627, 1, 0, 1,
-0.932297, 0.5723715, -0.5861112, 0.9490196, 1, 0, 1,
-0.9280252, -2.270841, -3.274849, 0.945098, 1, 0, 1,
-0.9275228, -0.05789651, -0.931088, 0.9372549, 1, 0, 1,
-0.9190912, 0.5747792, -0.3215426, 0.9333333, 1, 0, 1,
-0.9184488, -1.622221, -1.621795, 0.9254902, 1, 0, 1,
-0.9170921, -0.3161829, -1.153572, 0.9215686, 1, 0, 1,
-0.9060807, 1.015091, 1.046974, 0.9137255, 1, 0, 1,
-0.9000497, 0.9898408, -0.442018, 0.9098039, 1, 0, 1,
-0.8951078, 0.1171489, -0.1596113, 0.9019608, 1, 0, 1,
-0.8949972, 0.9251308, -1.423004, 0.8941177, 1, 0, 1,
-0.8947852, 0.4779526, -0.7700841, 0.8901961, 1, 0, 1,
-0.891269, 0.03785685, -0.424565, 0.8823529, 1, 0, 1,
-0.8882948, -0.1424273, -3.498454, 0.8784314, 1, 0, 1,
-0.8841264, -1.079909, -3.524328, 0.8705882, 1, 0, 1,
-0.8831034, 0.6453062, -0.8674901, 0.8666667, 1, 0, 1,
-0.8809496, 1.460754, -0.9860207, 0.8588235, 1, 0, 1,
-0.8786374, -0.7174711, -2.621222, 0.854902, 1, 0, 1,
-0.8786151, -0.294789, -5.164098, 0.8470588, 1, 0, 1,
-0.8767216, 1.264535, -1.485536, 0.8431373, 1, 0, 1,
-0.8696459, -1.046434, -0.7113143, 0.8352941, 1, 0, 1,
-0.8647916, 1.379746, -1.796099, 0.8313726, 1, 0, 1,
-0.8541245, -1.360905, -1.336992, 0.8235294, 1, 0, 1,
-0.8497353, 1.037575, -4.089982, 0.8196079, 1, 0, 1,
-0.8455298, 0.4633383, 0.1018865, 0.8117647, 1, 0, 1,
-0.8404279, -1.080873, -1.583637, 0.8078431, 1, 0, 1,
-0.834931, 1.358348, -0.0221404, 0.8, 1, 0, 1,
-0.8341987, 0.7204445, 0.3167086, 0.7921569, 1, 0, 1,
-0.8331082, -0.6213955, -0.7861493, 0.7882353, 1, 0, 1,
-0.832119, -1.833295, -4.025603, 0.7803922, 1, 0, 1,
-0.8285788, -1.037409, -1.888652, 0.7764706, 1, 0, 1,
-0.8228481, 0.159466, -1.676385, 0.7686275, 1, 0, 1,
-0.8225895, 0.1087593, -1.607231, 0.7647059, 1, 0, 1,
-0.8211155, 0.6093867, -1.20767, 0.7568628, 1, 0, 1,
-0.8207193, 0.8614271, -0.6074401, 0.7529412, 1, 0, 1,
-0.819444, -0.1270504, -1.077134, 0.7450981, 1, 0, 1,
-0.819156, -0.4300767, -2.057919, 0.7411765, 1, 0, 1,
-0.8183817, -1.245886, -1.12491, 0.7333333, 1, 0, 1,
-0.8110201, -0.3793971, -2.805225, 0.7294118, 1, 0, 1,
-0.8053951, -0.3806394, -0.890285, 0.7215686, 1, 0, 1,
-0.8041852, -0.09693604, -2.455917, 0.7176471, 1, 0, 1,
-0.7862318, -0.9054083, -2.380089, 0.7098039, 1, 0, 1,
-0.7834151, 0.8756596, -0.8963344, 0.7058824, 1, 0, 1,
-0.782288, -1.966839, -4.463412, 0.6980392, 1, 0, 1,
-0.7813578, 1.255905, 0.4583154, 0.6901961, 1, 0, 1,
-0.7806008, 0.6723763, -0.4957846, 0.6862745, 1, 0, 1,
-0.7802169, -0.7850417, -2.86138, 0.6784314, 1, 0, 1,
-0.7715272, -0.3651297, -2.815821, 0.6745098, 1, 0, 1,
-0.7679483, 1.067226, -1.344156, 0.6666667, 1, 0, 1,
-0.7670137, 0.542281, -1.149023, 0.6627451, 1, 0, 1,
-0.7569066, -0.4472814, -1.929441, 0.654902, 1, 0, 1,
-0.7520401, -0.6293033, -2.231608, 0.6509804, 1, 0, 1,
-0.7459573, -0.8726575, -3.514662, 0.6431373, 1, 0, 1,
-0.7452227, 0.4402442, -0.4329499, 0.6392157, 1, 0, 1,
-0.7434763, 0.7663192, -0.7059465, 0.6313726, 1, 0, 1,
-0.7406432, 0.2656886, -0.5619033, 0.627451, 1, 0, 1,
-0.7382751, -1.688907, -2.882066, 0.6196079, 1, 0, 1,
-0.7251958, -1.247279, -2.687289, 0.6156863, 1, 0, 1,
-0.7229288, -0.8212703, -3.169928, 0.6078432, 1, 0, 1,
-0.7211661, -0.40005, -2.920901, 0.6039216, 1, 0, 1,
-0.7198159, -1.586049, -2.007878, 0.5960785, 1, 0, 1,
-0.7178901, -0.2083174, -3.2285, 0.5882353, 1, 0, 1,
-0.710031, 1.164533, -0.5292783, 0.5843138, 1, 0, 1,
-0.708542, 0.7325383, -1.878404, 0.5764706, 1, 0, 1,
-0.7047849, 1.313447, 1.039887, 0.572549, 1, 0, 1,
-0.7040963, 1.523976, -0.2525532, 0.5647059, 1, 0, 1,
-0.6973416, 1.450189, -0.2231047, 0.5607843, 1, 0, 1,
-0.6956198, 0.7037747, 1.172434, 0.5529412, 1, 0, 1,
-0.6895326, 0.9277962, -1.204094, 0.5490196, 1, 0, 1,
-0.6882599, -0.8788431, -3.926977, 0.5411765, 1, 0, 1,
-0.6849873, -0.7213836, -2.506772, 0.5372549, 1, 0, 1,
-0.6811315, -0.1497747, -3.495894, 0.5294118, 1, 0, 1,
-0.6800917, 1.004465, 0.02073466, 0.5254902, 1, 0, 1,
-0.6780546, -1.640149, -4.757193, 0.5176471, 1, 0, 1,
-0.6773505, 0.007992142, -3.300899, 0.5137255, 1, 0, 1,
-0.6745955, 0.2863872, -1.590162, 0.5058824, 1, 0, 1,
-0.673906, -1.346248, -2.241462, 0.5019608, 1, 0, 1,
-0.6723458, -0.86858, -2.358264, 0.4941176, 1, 0, 1,
-0.669952, -0.01686999, -0.9749066, 0.4862745, 1, 0, 1,
-0.6676526, -1.324623, -1.63148, 0.4823529, 1, 0, 1,
-0.661548, -1.102428, -3.094813, 0.4745098, 1, 0, 1,
-0.6504474, -0.2691892, -1.550155, 0.4705882, 1, 0, 1,
-0.6492094, 2.056523, -0.2535897, 0.4627451, 1, 0, 1,
-0.6481071, 1.929187, -1.253364, 0.4588235, 1, 0, 1,
-0.6480521, -0.1700006, -3.207761, 0.4509804, 1, 0, 1,
-0.6458128, 1.199947, 1.414623, 0.4470588, 1, 0, 1,
-0.6458068, -0.1249808, -3.522448, 0.4392157, 1, 0, 1,
-0.6457359, -0.1244527, -2.517861, 0.4352941, 1, 0, 1,
-0.6364453, 0.5762258, -0.8767234, 0.427451, 1, 0, 1,
-0.634019, 0.323301, -0.5780061, 0.4235294, 1, 0, 1,
-0.6336144, -1.038497, -1.983567, 0.4156863, 1, 0, 1,
-0.6300654, -1.556851, -3.049185, 0.4117647, 1, 0, 1,
-0.6269264, 0.04028933, -1.688817, 0.4039216, 1, 0, 1,
-0.6261268, -1.97956, -2.369612, 0.3960784, 1, 0, 1,
-0.6258277, -0.7379499, -3.908137, 0.3921569, 1, 0, 1,
-0.6238402, -0.6187238, -2.215432, 0.3843137, 1, 0, 1,
-0.6229144, 1.68447, -2.09295, 0.3803922, 1, 0, 1,
-0.6202425, 0.2417183, 0.8297122, 0.372549, 1, 0, 1,
-0.6200254, 0.363675, 0.03522021, 0.3686275, 1, 0, 1,
-0.6154299, -1.014393, -3.32264, 0.3607843, 1, 0, 1,
-0.6129357, -0.5318595, -3.831842, 0.3568628, 1, 0, 1,
-0.6124122, 0.140504, -2.346937, 0.3490196, 1, 0, 1,
-0.6101315, -1.535477, -4.673105, 0.345098, 1, 0, 1,
-0.6062572, 0.5398622, 0.1476768, 0.3372549, 1, 0, 1,
-0.6024105, -0.0906742, -2.522169, 0.3333333, 1, 0, 1,
-0.600489, -1.688229, -2.435609, 0.3254902, 1, 0, 1,
-0.598425, 2.197081, 0.8127546, 0.3215686, 1, 0, 1,
-0.5949389, -0.4311278, -3.0543, 0.3137255, 1, 0, 1,
-0.5858474, 0.3287713, -1.774648, 0.3098039, 1, 0, 1,
-0.5772333, 1.298875, -1.768358, 0.3019608, 1, 0, 1,
-0.5760263, -1.118181, -1.645031, 0.2941177, 1, 0, 1,
-0.5695534, 0.08061509, -0.8977267, 0.2901961, 1, 0, 1,
-0.568593, 2.139285, -0.7936791, 0.282353, 1, 0, 1,
-0.5656502, 1.216005, -1.050753, 0.2784314, 1, 0, 1,
-0.5647119, 0.755178, -0.9147954, 0.2705882, 1, 0, 1,
-0.5640055, -1.771332, -3.163269, 0.2666667, 1, 0, 1,
-0.5559252, 0.5581139, -1.395215, 0.2588235, 1, 0, 1,
-0.5556942, -0.6608038, -2.307789, 0.254902, 1, 0, 1,
-0.5538969, 0.004089145, -2.528764, 0.2470588, 1, 0, 1,
-0.5504838, 0.1016037, -1.029298, 0.2431373, 1, 0, 1,
-0.5497119, 0.5360932, -0.9148961, 0.2352941, 1, 0, 1,
-0.5475227, -0.06046206, -0.8097242, 0.2313726, 1, 0, 1,
-0.5449365, -1.626957, -2.726777, 0.2235294, 1, 0, 1,
-0.5419494, -2.299505, -2.834242, 0.2196078, 1, 0, 1,
-0.5413657, -0.3604293, -1.456882, 0.2117647, 1, 0, 1,
-0.5401953, -1.120949, -1.734039, 0.2078431, 1, 0, 1,
-0.538302, -0.6482754, -3.160841, 0.2, 1, 0, 1,
-0.5375407, -0.4463888, -1.480219, 0.1921569, 1, 0, 1,
-0.5365505, -0.3479263, -2.706339, 0.1882353, 1, 0, 1,
-0.5333503, -0.2980607, -2.505274, 0.1803922, 1, 0, 1,
-0.5308734, 1.315119, -1.078772, 0.1764706, 1, 0, 1,
-0.5295073, 0.1412458, -1.967638, 0.1686275, 1, 0, 1,
-0.5255884, -1.015285, -3.16575, 0.1647059, 1, 0, 1,
-0.5242801, 0.4251533, 0.2645627, 0.1568628, 1, 0, 1,
-0.5228727, -0.5982124, -3.935663, 0.1529412, 1, 0, 1,
-0.5191563, 0.4455858, -1.521051, 0.145098, 1, 0, 1,
-0.5120776, 2.054248, -1.520757, 0.1411765, 1, 0, 1,
-0.5051649, 0.07449772, -1.637767, 0.1333333, 1, 0, 1,
-0.4979919, 0.2738306, 0.4336896, 0.1294118, 1, 0, 1,
-0.4890534, -0.5885264, -3.025177, 0.1215686, 1, 0, 1,
-0.4837424, 1.353122, -0.0724805, 0.1176471, 1, 0, 1,
-0.4795487, -0.4391415, -1.900222, 0.1098039, 1, 0, 1,
-0.4789385, -0.1761389, -3.21183, 0.1058824, 1, 0, 1,
-0.4752176, 0.02601612, -0.6702409, 0.09803922, 1, 0, 1,
-0.4719789, 0.7178493, -0.6132447, 0.09019608, 1, 0, 1,
-0.4683692, 1.068738, -1.709541, 0.08627451, 1, 0, 1,
-0.4675952, -3.140391, -2.150182, 0.07843138, 1, 0, 1,
-0.4660336, 1.192019, -2.82385, 0.07450981, 1, 0, 1,
-0.460593, 0.07362231, -1.215189, 0.06666667, 1, 0, 1,
-0.4591675, 0.5349166, -2.47591, 0.0627451, 1, 0, 1,
-0.4541132, 0.759331, 0.5034592, 0.05490196, 1, 0, 1,
-0.4514717, -1.576127, -1.850871, 0.05098039, 1, 0, 1,
-0.4507113, -1.60829, -1.443405, 0.04313726, 1, 0, 1,
-0.4504926, -0.0542979, -2.296967, 0.03921569, 1, 0, 1,
-0.4480061, -0.3370127, -3.558285, 0.03137255, 1, 0, 1,
-0.446095, 0.6661527, -0.2600489, 0.02745098, 1, 0, 1,
-0.4436837, -0.2903118, -2.422613, 0.01960784, 1, 0, 1,
-0.4405107, 0.3738264, -0.8565739, 0.01568628, 1, 0, 1,
-0.4366015, -0.7133468, -1.941456, 0.007843138, 1, 0, 1,
-0.4191484, 1.254023, -0.4307207, 0.003921569, 1, 0, 1,
-0.4182365, -0.8196636, -3.093822, 0, 1, 0.003921569, 1,
-0.4165087, 1.610669, 0.413999, 0, 1, 0.01176471, 1,
-0.4142534, -1.316981, -2.742359, 0, 1, 0.01568628, 1,
-0.4135159, 0.7257358, 0.9795582, 0, 1, 0.02352941, 1,
-0.410938, -0.1854835, -2.767725, 0, 1, 0.02745098, 1,
-0.4079594, 0.450342, -2.444031, 0, 1, 0.03529412, 1,
-0.4077089, -2.060158, -3.149741, 0, 1, 0.03921569, 1,
-0.4067497, -0.9119203, -2.382431, 0, 1, 0.04705882, 1,
-0.4034997, 0.6186972, -2.556801, 0, 1, 0.05098039, 1,
-0.3988791, 0.4071758, -1.02083, 0, 1, 0.05882353, 1,
-0.394985, 0.3682048, -1.533163, 0, 1, 0.0627451, 1,
-0.3939216, -0.6920422, -3.275708, 0, 1, 0.07058824, 1,
-0.3811348, -0.665118, -3.929206, 0, 1, 0.07450981, 1,
-0.3808925, -0.3504469, -1.889217, 0, 1, 0.08235294, 1,
-0.380472, -0.2913876, -0.5982104, 0, 1, 0.08627451, 1,
-0.3795755, -0.2468638, -2.48736, 0, 1, 0.09411765, 1,
-0.3764481, 2.174767, -0.4256036, 0, 1, 0.1019608, 1,
-0.3761441, -1.561732, -2.503412, 0, 1, 0.1058824, 1,
-0.3717681, -0.7373832, -3.457551, 0, 1, 0.1137255, 1,
-0.3637522, 0.2125875, -0.2059636, 0, 1, 0.1176471, 1,
-0.3586834, 1.405079, -1.405977, 0, 1, 0.1254902, 1,
-0.3570305, 0.3268562, -2.823808, 0, 1, 0.1294118, 1,
-0.3540455, -0.2711724, -0.7908771, 0, 1, 0.1372549, 1,
-0.3536942, -0.8701221, -3.9663, 0, 1, 0.1411765, 1,
-0.3525695, 0.7441309, -0.4517705, 0, 1, 0.1490196, 1,
-0.3513055, -0.07316898, -0.8688768, 0, 1, 0.1529412, 1,
-0.3499615, 0.7965503, -0.1353159, 0, 1, 0.1607843, 1,
-0.3472907, -0.2795634, -1.71346, 0, 1, 0.1647059, 1,
-0.3458361, -1.430743, -4.987688, 0, 1, 0.172549, 1,
-0.3443405, 1.22219, 1.005101, 0, 1, 0.1764706, 1,
-0.3433575, -0.1244043, -1.684453, 0, 1, 0.1843137, 1,
-0.3419956, -0.7196195, -2.902151, 0, 1, 0.1882353, 1,
-0.3381702, 1.265085, -0.1451154, 0, 1, 0.1960784, 1,
-0.3371367, 0.04313755, -1.176221, 0, 1, 0.2039216, 1,
-0.3263166, -0.661257, -2.719082, 0, 1, 0.2078431, 1,
-0.3238344, -0.2849828, -1.776477, 0, 1, 0.2156863, 1,
-0.3216926, 0.3734947, -2.770926, 0, 1, 0.2196078, 1,
-0.3179132, -0.286984, -1.017859, 0, 1, 0.227451, 1,
-0.3170162, -0.6694487, -2.064044, 0, 1, 0.2313726, 1,
-0.3122283, -0.2016042, -3.342151, 0, 1, 0.2392157, 1,
-0.3104895, -2.462672, -2.67734, 0, 1, 0.2431373, 1,
-0.3078666, -0.4176031, -2.887707, 0, 1, 0.2509804, 1,
-0.3075836, -2.059809, -2.873478, 0, 1, 0.254902, 1,
-0.3074583, -0.1855804, -2.380517, 0, 1, 0.2627451, 1,
-0.3042928, 1.823242, 0.7453752, 0, 1, 0.2666667, 1,
-0.2999062, 1.79199, -0.8553425, 0, 1, 0.2745098, 1,
-0.296689, -1.043878, -2.960758, 0, 1, 0.2784314, 1,
-0.2961365, -0.1742763, -1.757723, 0, 1, 0.2862745, 1,
-0.2938742, 1.102467, 0.09978037, 0, 1, 0.2901961, 1,
-0.2925302, -1.320039, -1.741758, 0, 1, 0.2980392, 1,
-0.2924193, -1.016876, -3.968468, 0, 1, 0.3058824, 1,
-0.2914212, 1.080587, 0.9955223, 0, 1, 0.3098039, 1,
-0.2894985, 0.8854368, -0.09897412, 0, 1, 0.3176471, 1,
-0.2891491, 0.1750968, -0.8406475, 0, 1, 0.3215686, 1,
-0.2886873, -0.3870657, -1.912414, 0, 1, 0.3294118, 1,
-0.2882735, 1.381656, 0.8987175, 0, 1, 0.3333333, 1,
-0.2876876, -0.3651127, -2.421919, 0, 1, 0.3411765, 1,
-0.2826022, -0.6612551, -3.196141, 0, 1, 0.345098, 1,
-0.2802894, 1.168963, -2.99309, 0, 1, 0.3529412, 1,
-0.275615, -0.3149586, -1.163326, 0, 1, 0.3568628, 1,
-0.2748452, 0.5111359, 0.6680262, 0, 1, 0.3647059, 1,
-0.2726305, 1.634876, -2.149975, 0, 1, 0.3686275, 1,
-0.2698243, -0.9099503, -2.671743, 0, 1, 0.3764706, 1,
-0.2670369, -1.054278, -3.506951, 0, 1, 0.3803922, 1,
-0.2662295, -1.016845, -1.988539, 0, 1, 0.3882353, 1,
-0.2638319, -1.164419, -2.63212, 0, 1, 0.3921569, 1,
-0.2609535, -0.6368378, -2.513789, 0, 1, 0.4, 1,
-0.2601141, 0.1957407, -0.3789311, 0, 1, 0.4078431, 1,
-0.2594799, -0.5429853, -2.545666, 0, 1, 0.4117647, 1,
-0.2553614, -0.0832167, -2.154366, 0, 1, 0.4196078, 1,
-0.2547255, 2.373372, -0.6020994, 0, 1, 0.4235294, 1,
-0.248792, 0.04336618, -1.258837, 0, 1, 0.4313726, 1,
-0.2487157, -1.784368, -3.364164, 0, 1, 0.4352941, 1,
-0.2484102, -0.7461221, -2.850859, 0, 1, 0.4431373, 1,
-0.2437568, 0.9634905, -1.363258, 0, 1, 0.4470588, 1,
-0.2410486, -1.160525, -4.811486, 0, 1, 0.454902, 1,
-0.2407613, 0.2373559, -1.162284, 0, 1, 0.4588235, 1,
-0.2406583, -1.898037, -2.969986, 0, 1, 0.4666667, 1,
-0.235326, -1.514454, -3.390908, 0, 1, 0.4705882, 1,
-0.2352129, 0.05645939, 1.056884, 0, 1, 0.4784314, 1,
-0.2345906, 0.553389, 0.4018027, 0, 1, 0.4823529, 1,
-0.2342614, 1.047144, 0.03024433, 0, 1, 0.4901961, 1,
-0.2304564, -1.134967, -4.866212, 0, 1, 0.4941176, 1,
-0.2300647, -0.3091338, -1.636017, 0, 1, 0.5019608, 1,
-0.2298754, 1.024328, 0.0396419, 0, 1, 0.509804, 1,
-0.2289316, 1.971791, 0.8225297, 0, 1, 0.5137255, 1,
-0.2224087, -0.2185915, -1.654824, 0, 1, 0.5215687, 1,
-0.2213453, -1.00309, -2.36671, 0, 1, 0.5254902, 1,
-0.2210594, 1.259248, -0.2403162, 0, 1, 0.5333334, 1,
-0.2188199, -2.299543, -2.201704, 0, 1, 0.5372549, 1,
-0.2182844, 0.4549242, 0.8982451, 0, 1, 0.5450981, 1,
-0.2170089, -0.06780229, -1.894943, 0, 1, 0.5490196, 1,
-0.2159255, -1.15009, -1.7045, 0, 1, 0.5568628, 1,
-0.2141692, 0.5249339, -3.401531, 0, 1, 0.5607843, 1,
-0.212857, 1.207453, 0.7595529, 0, 1, 0.5686275, 1,
-0.2110452, 1.138351, 1.78793, 0, 1, 0.572549, 1,
-0.2035477, -0.3086038, -2.875928, 0, 1, 0.5803922, 1,
-0.2032676, 1.110016, -1.437747, 0, 1, 0.5843138, 1,
-0.2031807, -0.3676071, -0.3380209, 0, 1, 0.5921569, 1,
-0.2001783, 2.09634, -0.3856532, 0, 1, 0.5960785, 1,
-0.1974803, 2.21163, 0.6907442, 0, 1, 0.6039216, 1,
-0.1932502, 1.653185, -0.3776779, 0, 1, 0.6117647, 1,
-0.1921574, 0.455602, -0.6046184, 0, 1, 0.6156863, 1,
-0.1802906, 1.207639, -0.2054562, 0, 1, 0.6235294, 1,
-0.179263, -0.539003, -2.558354, 0, 1, 0.627451, 1,
-0.1766862, 1.778598, 1.88226, 0, 1, 0.6352941, 1,
-0.1750804, -0.967522, -3.099147, 0, 1, 0.6392157, 1,
-0.1749754, 0.5165649, 1.442453, 0, 1, 0.6470588, 1,
-0.1737741, -0.1609264, -4.146835, 0, 1, 0.6509804, 1,
-0.1657851, -0.1147427, -0.8080441, 0, 1, 0.6588235, 1,
-0.1522435, -0.8701993, -1.478531, 0, 1, 0.6627451, 1,
-0.1495919, -0.06897167, -2.71453, 0, 1, 0.6705883, 1,
-0.1486325, 0.309172, -2.221464, 0, 1, 0.6745098, 1,
-0.147266, -0.2973337, -3.000753, 0, 1, 0.682353, 1,
-0.1439669, 0.6447809, 0.8825791, 0, 1, 0.6862745, 1,
-0.1416299, 0.8366595, -0.8938805, 0, 1, 0.6941177, 1,
-0.13818, 1.624797, -0.2331583, 0, 1, 0.7019608, 1,
-0.1355104, 0.6158912, -0.7136151, 0, 1, 0.7058824, 1,
-0.1289983, -0.9477775, -4.100534, 0, 1, 0.7137255, 1,
-0.1248938, 0.5129433, -1.103033, 0, 1, 0.7176471, 1,
-0.1178023, -0.3667421, -1.603696, 0, 1, 0.7254902, 1,
-0.1174618, -0.6290761, -4.457064, 0, 1, 0.7294118, 1,
-0.1154551, -1.109225, -1.781732, 0, 1, 0.7372549, 1,
-0.1143489, 0.7377419, -0.4992439, 0, 1, 0.7411765, 1,
-0.1069788, -0.4400553, -3.822097, 0, 1, 0.7490196, 1,
-0.1007229, -0.7973922, -2.343363, 0, 1, 0.7529412, 1,
-0.0975348, 0.9618359, 0.9677286, 0, 1, 0.7607843, 1,
-0.094496, -0.6371289, -2.476462, 0, 1, 0.7647059, 1,
-0.093946, -1.023183, -2.461974, 0, 1, 0.772549, 1,
-0.09301467, -0.134266, -2.665963, 0, 1, 0.7764706, 1,
-0.08989043, 0.6596258, -1.997281, 0, 1, 0.7843137, 1,
-0.0870515, 0.1223078, -1.711134, 0, 1, 0.7882353, 1,
-0.08576841, -0.2071831, -3.96008, 0, 1, 0.7960784, 1,
-0.07990398, 0.5618491, -1.870713, 0, 1, 0.8039216, 1,
-0.07986237, 0.899759, 0.8216273, 0, 1, 0.8078431, 1,
-0.0793631, 0.2921281, -1.539289, 0, 1, 0.8156863, 1,
-0.0765923, -1.632839, -2.876488, 0, 1, 0.8196079, 1,
-0.0735609, 0.9112607, -0.2985407, 0, 1, 0.827451, 1,
-0.06389031, 1.124867, 0.8921304, 0, 1, 0.8313726, 1,
-0.06370506, -0.1737085, -2.199545, 0, 1, 0.8392157, 1,
-0.06260341, 1.224999, 0.5934379, 0, 1, 0.8431373, 1,
-0.05920985, -0.1910282, -2.206076, 0, 1, 0.8509804, 1,
-0.05762601, 0.1398869, -0.7247485, 0, 1, 0.854902, 1,
-0.05356094, 0.3536857, -2.080539, 0, 1, 0.8627451, 1,
-0.05245294, -0.8757564, -3.986008, 0, 1, 0.8666667, 1,
-0.05207983, -0.8544505, -0.9661436, 0, 1, 0.8745098, 1,
-0.05179333, 0.1588974, -2.462048, 0, 1, 0.8784314, 1,
-0.05091268, 0.2917072, -0.6751619, 0, 1, 0.8862745, 1,
-0.04901486, -1.414471, -1.479861, 0, 1, 0.8901961, 1,
-0.04730732, -0.8682086, -2.105448, 0, 1, 0.8980392, 1,
-0.04204061, 0.2788772, -1.146401, 0, 1, 0.9058824, 1,
-0.04189001, 0.274196, 0.4033011, 0, 1, 0.9098039, 1,
-0.03406861, -0.3101189, -2.046867, 0, 1, 0.9176471, 1,
-0.02858265, -1.001825, -2.608204, 0, 1, 0.9215686, 1,
-0.02673414, -0.9990678, -2.919549, 0, 1, 0.9294118, 1,
-0.02356688, -0.573965, -3.184459, 0, 1, 0.9333333, 1,
-0.02044918, 0.8333399, 1.354623, 0, 1, 0.9411765, 1,
-0.01908368, 0.1315494, 0.1465451, 0, 1, 0.945098, 1,
-0.01852087, 1.075571, -1.450832, 0, 1, 0.9529412, 1,
-0.01617575, -1.471601, -2.066228, 0, 1, 0.9568627, 1,
-0.01487934, -1.081704, -3.443419, 0, 1, 0.9647059, 1,
-0.006713311, 0.1383492, -0.5596609, 0, 1, 0.9686275, 1,
-0.006132375, 0.3820068, -1.217949, 0, 1, 0.9764706, 1,
-0.005925183, 0.4350763, -0.4864532, 0, 1, 0.9803922, 1,
-0.00302546, 0.7212421, -1.386051, 0, 1, 0.9882353, 1,
-0.002884355, 1.370412, 0.8988716, 0, 1, 0.9921569, 1,
-0.001971426, 0.3345515, -2.032194, 0, 1, 1, 1,
-0.0009857236, -0.1822628, -5.557404, 0, 0.9921569, 1, 1,
0.005194955, -0.5333595, 2.615444, 0, 0.9882353, 1, 1,
0.01268485, -1.287595, 2.587708, 0, 0.9803922, 1, 1,
0.01457415, 0.4975189, 1.085207, 0, 0.9764706, 1, 1,
0.01599181, -0.1777103, 1.638379, 0, 0.9686275, 1, 1,
0.01702247, 0.08009587, 2.214084, 0, 0.9647059, 1, 1,
0.0183929, -1.668463, 3.601018, 0, 0.9568627, 1, 1,
0.01907198, 0.445962, 0.5803089, 0, 0.9529412, 1, 1,
0.02060147, -0.7179795, 3.889483, 0, 0.945098, 1, 1,
0.02155809, -0.9274608, 1.120857, 0, 0.9411765, 1, 1,
0.02226699, 0.3344283, 0.2910499, 0, 0.9333333, 1, 1,
0.0223275, 2.299842, 0.5483012, 0, 0.9294118, 1, 1,
0.02323473, -0.01136282, 0.6656848, 0, 0.9215686, 1, 1,
0.02501733, 0.1058889, -0.3353721, 0, 0.9176471, 1, 1,
0.0271728, 0.1253333, -1.321309, 0, 0.9098039, 1, 1,
0.02774134, 1.421283, -0.3528475, 0, 0.9058824, 1, 1,
0.04521886, -0.8515235, 3.005873, 0, 0.8980392, 1, 1,
0.04896883, -0.3630592, 3.253288, 0, 0.8901961, 1, 1,
0.05006618, 0.02033401, 1.979362, 0, 0.8862745, 1, 1,
0.05051535, -0.1364776, 2.129607, 0, 0.8784314, 1, 1,
0.05515106, -0.2845747, 2.327788, 0, 0.8745098, 1, 1,
0.05529844, -1.094086, 3.284047, 0, 0.8666667, 1, 1,
0.05562941, -0.09529144, 2.283522, 0, 0.8627451, 1, 1,
0.06099921, -0.2143049, 3.338892, 0, 0.854902, 1, 1,
0.06256054, 0.1747565, 0.2558121, 0, 0.8509804, 1, 1,
0.0636699, 1.296051, -1.577449, 0, 0.8431373, 1, 1,
0.06535968, -0.6619477, 0.9703315, 0, 0.8392157, 1, 1,
0.06728332, -0.2591059, 2.006262, 0, 0.8313726, 1, 1,
0.06844951, 0.4262786, -0.7654682, 0, 0.827451, 1, 1,
0.06963778, 0.3160372, 0.456115, 0, 0.8196079, 1, 1,
0.07033074, 0.7173024, 0.4349738, 0, 0.8156863, 1, 1,
0.07326337, 0.5794013, 0.09904493, 0, 0.8078431, 1, 1,
0.07453042, -1.946802, 3.625985, 0, 0.8039216, 1, 1,
0.07626644, 1.209525, -0.106251, 0, 0.7960784, 1, 1,
0.07858951, -1.290742, 3.328795, 0, 0.7882353, 1, 1,
0.08198444, 0.6673391, 1.447252, 0, 0.7843137, 1, 1,
0.08218524, -0.4750222, 1.751642, 0, 0.7764706, 1, 1,
0.08590855, -1.021283, 2.8736, 0, 0.772549, 1, 1,
0.08829831, 1.148614, -0.2374296, 0, 0.7647059, 1, 1,
0.08923087, -0.4671174, 2.759444, 0, 0.7607843, 1, 1,
0.0944181, -0.2131588, 2.095711, 0, 0.7529412, 1, 1,
0.09811884, 0.9305902, -0.924781, 0, 0.7490196, 1, 1,
0.09901595, 0.180528, 0.5418532, 0, 0.7411765, 1, 1,
0.1022199, -0.641103, 3.63709, 0, 0.7372549, 1, 1,
0.1035911, 0.2968694, -0.7101206, 0, 0.7294118, 1, 1,
0.1039702, 0.7508488, 0.48212, 0, 0.7254902, 1, 1,
0.1066568, -0.424418, 2.907948, 0, 0.7176471, 1, 1,
0.1105686, -1.097482, 2.178787, 0, 0.7137255, 1, 1,
0.1145011, 1.396803, 1.070024, 0, 0.7058824, 1, 1,
0.1167823, -2.35837, 3.143568, 0, 0.6980392, 1, 1,
0.1232778, -0.4704242, 2.525554, 0, 0.6941177, 1, 1,
0.1265376, 0.4461871, 0.6696392, 0, 0.6862745, 1, 1,
0.1266613, -1.113568, 1.699847, 0, 0.682353, 1, 1,
0.129504, 0.2628698, 1.141831, 0, 0.6745098, 1, 1,
0.1295928, 0.08531892, -1.341525, 0, 0.6705883, 1, 1,
0.1300915, 1.482373, 1.031781, 0, 0.6627451, 1, 1,
0.1305449, -0.5198021, 3.457198, 0, 0.6588235, 1, 1,
0.1319581, -0.517653, 3.040774, 0, 0.6509804, 1, 1,
0.1333124, -0.1060145, 3.795547, 0, 0.6470588, 1, 1,
0.1351471, 1.130829, 0.07961378, 0, 0.6392157, 1, 1,
0.1433748, -1.286475, 2.622802, 0, 0.6352941, 1, 1,
0.1567222, -0.0582395, 2.059963, 0, 0.627451, 1, 1,
0.1631349, -0.2565893, 3.641289, 0, 0.6235294, 1, 1,
0.1636307, 0.5814902, -0.7838401, 0, 0.6156863, 1, 1,
0.1684412, -1.077499, 2.956142, 0, 0.6117647, 1, 1,
0.1715799, 1.967631, -0.6687642, 0, 0.6039216, 1, 1,
0.1736943, -0.2859032, 2.946985, 0, 0.5960785, 1, 1,
0.1782133, 0.7740089, -1.258803, 0, 0.5921569, 1, 1,
0.1852304, 2.237208, -2.262092, 0, 0.5843138, 1, 1,
0.1868939, -0.9690633, 3.835487, 0, 0.5803922, 1, 1,
0.1921558, -0.4603646, 1.552645, 0, 0.572549, 1, 1,
0.1932874, -0.984799, 1.709197, 0, 0.5686275, 1, 1,
0.1987315, -1.026146, 3.266703, 0, 0.5607843, 1, 1,
0.2000838, -1.60542, 3.326639, 0, 0.5568628, 1, 1,
0.2011597, -0.01729801, 2.42674, 0, 0.5490196, 1, 1,
0.2097525, 1.722724, -0.7487772, 0, 0.5450981, 1, 1,
0.2102545, 0.1778546, 1.931573, 0, 0.5372549, 1, 1,
0.2142684, 0.8233698, -0.680261, 0, 0.5333334, 1, 1,
0.2173253, 0.1835877, -0.3825138, 0, 0.5254902, 1, 1,
0.2278571, -0.2191867, 1.87873, 0, 0.5215687, 1, 1,
0.22787, 0.7247669, -1.240143, 0, 0.5137255, 1, 1,
0.2281257, -0.8046546, 4.503109, 0, 0.509804, 1, 1,
0.2301697, 1.10321, -1.315416, 0, 0.5019608, 1, 1,
0.2306666, 0.3595014, 0.424969, 0, 0.4941176, 1, 1,
0.2311469, 0.005858056, 1.600787, 0, 0.4901961, 1, 1,
0.2315707, 0.08845456, 1.212577, 0, 0.4823529, 1, 1,
0.2318612, -0.341514, 3.327053, 0, 0.4784314, 1, 1,
0.2334589, -1.098502, 3.312112, 0, 0.4705882, 1, 1,
0.2344159, 0.9415354, 0.3868469, 0, 0.4666667, 1, 1,
0.236649, -0.9826498, 3.605804, 0, 0.4588235, 1, 1,
0.2389175, 0.2015061, 1.33051, 0, 0.454902, 1, 1,
0.2410343, 0.9987599, -0.378199, 0, 0.4470588, 1, 1,
0.2417526, 0.9362799, -0.5143725, 0, 0.4431373, 1, 1,
0.2440993, -0.1614899, 3.324811, 0, 0.4352941, 1, 1,
0.2655553, -0.3261958, 0.8249107, 0, 0.4313726, 1, 1,
0.265565, 0.5898252, -1.694331, 0, 0.4235294, 1, 1,
0.2686888, 0.04372077, 2.020213, 0, 0.4196078, 1, 1,
0.2691374, 0.1759828, -0.5847898, 0, 0.4117647, 1, 1,
0.2704364, -0.5136399, 3.01996, 0, 0.4078431, 1, 1,
0.2723164, -1.41392, 1.349458, 0, 0.4, 1, 1,
0.2724905, -2.32328, 4.683047, 0, 0.3921569, 1, 1,
0.273189, 0.6284869, 1.917051, 0, 0.3882353, 1, 1,
0.2817163, -0.2632442, 2.461573, 0, 0.3803922, 1, 1,
0.2847892, -0.5988457, 1.814419, 0, 0.3764706, 1, 1,
0.2915148, 0.3030506, 3.253433, 0, 0.3686275, 1, 1,
0.2918772, -1.352681, 3.07114, 0, 0.3647059, 1, 1,
0.2922826, -1.388851, 3.36493, 0, 0.3568628, 1, 1,
0.2926567, 0.07897718, 1.058413, 0, 0.3529412, 1, 1,
0.2936668, 0.4189277, -0.4099584, 0, 0.345098, 1, 1,
0.2989247, -0.2637249, 1.883871, 0, 0.3411765, 1, 1,
0.3018667, 0.1093418, 0.6416687, 0, 0.3333333, 1, 1,
0.3032826, 0.2975043, -0.2085738, 0, 0.3294118, 1, 1,
0.3074012, -1.400176, 3.04355, 0, 0.3215686, 1, 1,
0.308874, 0.6579037, -0.6174983, 0, 0.3176471, 1, 1,
0.3101484, 1.660998, -1.064803, 0, 0.3098039, 1, 1,
0.3162253, 0.6570019, 0.02598359, 0, 0.3058824, 1, 1,
0.3178244, -0.1241739, 2.633595, 0, 0.2980392, 1, 1,
0.3257375, -0.06324022, 1.467069, 0, 0.2901961, 1, 1,
0.3291664, 0.1171356, 0.5688962, 0, 0.2862745, 1, 1,
0.3314562, -0.5381102, 2.736082, 0, 0.2784314, 1, 1,
0.3338577, 0.2888505, -0.1499905, 0, 0.2745098, 1, 1,
0.3374625, 1.693342, -1.156439, 0, 0.2666667, 1, 1,
0.3442357, 1.498932, 0.4892145, 0, 0.2627451, 1, 1,
0.3469776, 0.2575873, 1.768865, 0, 0.254902, 1, 1,
0.347054, 0.946784, 0.9399002, 0, 0.2509804, 1, 1,
0.3547544, 0.4004953, 1.782232, 0, 0.2431373, 1, 1,
0.3568762, -1.380072, 1.566262, 0, 0.2392157, 1, 1,
0.3604408, 0.5793179, -1.291023, 0, 0.2313726, 1, 1,
0.3621761, 0.2113069, 1.013687, 0, 0.227451, 1, 1,
0.3648761, -2.8094, 3.61793, 0, 0.2196078, 1, 1,
0.3657078, -0.2588168, 3.264084, 0, 0.2156863, 1, 1,
0.369803, -1.124283, 3.207419, 0, 0.2078431, 1, 1,
0.3700036, 1.664845, -0.1619193, 0, 0.2039216, 1, 1,
0.3719316, -0.03191882, 1.741517, 0, 0.1960784, 1, 1,
0.3741395, 1.263554, 0.3104106, 0, 0.1882353, 1, 1,
0.3748015, 1.237311, -0.8193852, 0, 0.1843137, 1, 1,
0.3757412, 1.620434, 0.5302315, 0, 0.1764706, 1, 1,
0.3792079, 0.1245061, 2.073033, 0, 0.172549, 1, 1,
0.3849121, 1.444766, 0.2578812, 0, 0.1647059, 1, 1,
0.386924, -0.6492696, 1.989574, 0, 0.1607843, 1, 1,
0.3942918, 0.4638907, 2.558659, 0, 0.1529412, 1, 1,
0.3962805, -0.06484079, 2.354332, 0, 0.1490196, 1, 1,
0.3970891, 2.669305, 0.8871376, 0, 0.1411765, 1, 1,
0.3977894, -1.265339, 2.309724, 0, 0.1372549, 1, 1,
0.4041286, -1.115977, 3.321999, 0, 0.1294118, 1, 1,
0.4059951, -0.340475, 3.203079, 0, 0.1254902, 1, 1,
0.4061313, 0.570769, 0.05443489, 0, 0.1176471, 1, 1,
0.4073488, 0.8010231, -0.1356495, 0, 0.1137255, 1, 1,
0.4214628, 0.2369859, 0.8747891, 0, 0.1058824, 1, 1,
0.4221811, -1.622562, 3.431897, 0, 0.09803922, 1, 1,
0.4244958, 2.092419, -1.908892, 0, 0.09411765, 1, 1,
0.4285166, 0.4619272, -0.8964477, 0, 0.08627451, 1, 1,
0.4289661, -1.740924, 3.711697, 0, 0.08235294, 1, 1,
0.4293287, 0.03133648, 0.5976769, 0, 0.07450981, 1, 1,
0.4310406, -0.7914615, 1.355791, 0, 0.07058824, 1, 1,
0.4322313, -2.445855, 4.744919, 0, 0.0627451, 1, 1,
0.4330897, -0.6332564, 1.333094, 0, 0.05882353, 1, 1,
0.433202, 1.330292, 1.688655, 0, 0.05098039, 1, 1,
0.4341089, -0.9067562, 3.33286, 0, 0.04705882, 1, 1,
0.435492, 0.429525, 0.6083658, 0, 0.03921569, 1, 1,
0.440456, 1.396812, -0.285223, 0, 0.03529412, 1, 1,
0.4414629, -0.7744341, 0.9543164, 0, 0.02745098, 1, 1,
0.4444985, 0.03855046, 1.026016, 0, 0.02352941, 1, 1,
0.4483814, -1.047993, 3.516772, 0, 0.01568628, 1, 1,
0.4545071, 0.8471407, 0.6400452, 0, 0.01176471, 1, 1,
0.4628662, -0.8846824, 2.381953, 0, 0.003921569, 1, 1,
0.4724187, -1.498065, 1.790951, 0.003921569, 0, 1, 1,
0.4741043, -0.9632921, 2.422524, 0.007843138, 0, 1, 1,
0.4820137, 0.07726399, -0.5332028, 0.01568628, 0, 1, 1,
0.4877802, -0.008852218, 3.325733, 0.01960784, 0, 1, 1,
0.4896836, 0.7741691, -1.111436, 0.02745098, 0, 1, 1,
0.4916537, -1.651741, 2.624515, 0.03137255, 0, 1, 1,
0.4923345, -2.328304, 3.67032, 0.03921569, 0, 1, 1,
0.4937144, 0.4974218, 2.060345, 0.04313726, 0, 1, 1,
0.4945871, -1.740372, 3.700644, 0.05098039, 0, 1, 1,
0.5046062, -0.8541717, 3.650142, 0.05490196, 0, 1, 1,
0.5057444, 2.067656, -0.3437394, 0.0627451, 0, 1, 1,
0.5075568, -0.5260677, 2.931342, 0.06666667, 0, 1, 1,
0.5083231, 0.1523491, 1.444389, 0.07450981, 0, 1, 1,
0.5127689, 0.2273984, 1.249197, 0.07843138, 0, 1, 1,
0.513949, -0.7041551, 1.783333, 0.08627451, 0, 1, 1,
0.5208643, -0.2983819, 2.497921, 0.09019608, 0, 1, 1,
0.525934, 0.4463481, 0.9066013, 0.09803922, 0, 1, 1,
0.5288208, -0.4078732, 2.584643, 0.1058824, 0, 1, 1,
0.528963, -0.5999811, 3.407205, 0.1098039, 0, 1, 1,
0.5299978, -0.456181, 3.068124, 0.1176471, 0, 1, 1,
0.5312862, -1.967865, 3.597537, 0.1215686, 0, 1, 1,
0.538831, 0.9996611, 1.10349, 0.1294118, 0, 1, 1,
0.5430909, -0.6818776, 1.660208, 0.1333333, 0, 1, 1,
0.544259, 1.052263, 0.863339, 0.1411765, 0, 1, 1,
0.5445467, 0.111818, 0.4109231, 0.145098, 0, 1, 1,
0.5447022, -1.640722, 2.496253, 0.1529412, 0, 1, 1,
0.5473366, -0.548283, 2.19451, 0.1568628, 0, 1, 1,
0.5529569, 0.5586928, -0.8249315, 0.1647059, 0, 1, 1,
0.554192, -0.2140614, 1.372885, 0.1686275, 0, 1, 1,
0.5580455, -0.5292674, 1.666831, 0.1764706, 0, 1, 1,
0.5716416, -0.06912237, 1.660604, 0.1803922, 0, 1, 1,
0.5719045, 1.716606, 0.2632967, 0.1882353, 0, 1, 1,
0.5761038, 0.4102924, 3.087292, 0.1921569, 0, 1, 1,
0.5780469, 0.4390059, 0.1686374, 0.2, 0, 1, 1,
0.5792718, -1.431296, 2.903355, 0.2078431, 0, 1, 1,
0.5801011, -0.1804861, 2.541162, 0.2117647, 0, 1, 1,
0.5852038, 0.6753182, 1.962462, 0.2196078, 0, 1, 1,
0.5908551, -0.4845424, 2.709009, 0.2235294, 0, 1, 1,
0.5922584, 1.384632, -1.338187, 0.2313726, 0, 1, 1,
0.5927896, 1.466555, 0.3583791, 0.2352941, 0, 1, 1,
0.5944344, -1.058362, 1.02102, 0.2431373, 0, 1, 1,
0.5946652, 1.553024, 0.8831022, 0.2470588, 0, 1, 1,
0.6015121, 0.5649301, -0.1862426, 0.254902, 0, 1, 1,
0.6031423, -0.6656188, 1.795602, 0.2588235, 0, 1, 1,
0.604316, -1.330614, 1.025126, 0.2666667, 0, 1, 1,
0.6074261, 0.4526567, 2.415981, 0.2705882, 0, 1, 1,
0.6159486, -0.3794517, 3.548875, 0.2784314, 0, 1, 1,
0.6184441, 0.3696603, 1.316294, 0.282353, 0, 1, 1,
0.6192812, 0.5414125, -0.3125749, 0.2901961, 0, 1, 1,
0.6208403, 0.8797511, 0.9340575, 0.2941177, 0, 1, 1,
0.6220762, 0.918939, 0.08903579, 0.3019608, 0, 1, 1,
0.6263918, 0.2355496, 1.863733, 0.3098039, 0, 1, 1,
0.6272121, 0.6558758, -2.178849, 0.3137255, 0, 1, 1,
0.6281505, -0.867962, 2.340043, 0.3215686, 0, 1, 1,
0.6304659, 0.8101873, -0.22884, 0.3254902, 0, 1, 1,
0.632701, 1.022748, 1.883041, 0.3333333, 0, 1, 1,
0.6337914, 0.1747729, 2.640109, 0.3372549, 0, 1, 1,
0.6339332, 0.4231244, -0.1347848, 0.345098, 0, 1, 1,
0.6369968, 1.822716, -0.6510601, 0.3490196, 0, 1, 1,
0.6376065, 1.180593, -1.641086, 0.3568628, 0, 1, 1,
0.6405176, 1.266907, 0.2601486, 0.3607843, 0, 1, 1,
0.6437436, 0.06436053, 0.342553, 0.3686275, 0, 1, 1,
0.6476347, -0.845176, 2.156242, 0.372549, 0, 1, 1,
0.6598675, 2.109663, -1.373424, 0.3803922, 0, 1, 1,
0.6601266, 0.2045747, 1.545719, 0.3843137, 0, 1, 1,
0.6652665, -0.6401452, 1.741941, 0.3921569, 0, 1, 1,
0.6664087, 0.9009314, 1.375743, 0.3960784, 0, 1, 1,
0.6691652, -1.278899, 0.6141154, 0.4039216, 0, 1, 1,
0.6723369, -1.143543, 4.440848, 0.4117647, 0, 1, 1,
0.6783209, -1.820508, 4.153544, 0.4156863, 0, 1, 1,
0.6802829, -0.3600424, 2.337484, 0.4235294, 0, 1, 1,
0.6847069, -1.52131, 2.898277, 0.427451, 0, 1, 1,
0.6883441, -1.027908, 2.939344, 0.4352941, 0, 1, 1,
0.688529, -0.3527597, 4.032791, 0.4392157, 0, 1, 1,
0.689149, -0.08404404, 3.634953, 0.4470588, 0, 1, 1,
0.6901274, 0.04360402, 1.194964, 0.4509804, 0, 1, 1,
0.6902919, 0.8898718, 1.519632, 0.4588235, 0, 1, 1,
0.6931166, 1.185956, -1.064721, 0.4627451, 0, 1, 1,
0.6939938, 1.055865, 1.551875, 0.4705882, 0, 1, 1,
0.6957689, -1.534018, 3.208795, 0.4745098, 0, 1, 1,
0.6994734, 0.6777162, -0.1172352, 0.4823529, 0, 1, 1,
0.7000158, -0.06280942, 1.85139, 0.4862745, 0, 1, 1,
0.7030691, 1.07609, 1.110579, 0.4941176, 0, 1, 1,
0.7042661, -0.8892713, 0.5088199, 0.5019608, 0, 1, 1,
0.7058929, -1.250578, 2.762958, 0.5058824, 0, 1, 1,
0.7067741, 0.427283, 0.1802505, 0.5137255, 0, 1, 1,
0.7211565, 1.879087, -1.106557, 0.5176471, 0, 1, 1,
0.7244843, 2.167689, 0.5995526, 0.5254902, 0, 1, 1,
0.7246281, -0.4088497, 0.3578882, 0.5294118, 0, 1, 1,
0.7359058, 0.5355564, 0.8916829, 0.5372549, 0, 1, 1,
0.7375377, -0.01660247, 1.569689, 0.5411765, 0, 1, 1,
0.741921, 0.7917417, 1.09633, 0.5490196, 0, 1, 1,
0.7493752, -1.063501, 3.496532, 0.5529412, 0, 1, 1,
0.7523844, 0.2590734, 1.029766, 0.5607843, 0, 1, 1,
0.7536711, 0.06759305, 1.963882, 0.5647059, 0, 1, 1,
0.7587313, 0.5675875, 0.3999256, 0.572549, 0, 1, 1,
0.7607321, 0.4718172, 0.1354649, 0.5764706, 0, 1, 1,
0.7655848, 1.252721, 2.312204, 0.5843138, 0, 1, 1,
0.7729763, -0.7333831, 2.380239, 0.5882353, 0, 1, 1,
0.7743568, -0.3724925, 3.308484, 0.5960785, 0, 1, 1,
0.776967, -0.8784955, 1.640961, 0.6039216, 0, 1, 1,
0.7787071, 0.4126341, 2.612797, 0.6078432, 0, 1, 1,
0.7814605, 0.7933682, 2.076972, 0.6156863, 0, 1, 1,
0.7836754, 1.157522, 3.086939, 0.6196079, 0, 1, 1,
0.7840848, 0.9289656, -0.7312337, 0.627451, 0, 1, 1,
0.7882105, -0.4916591, 2.348703, 0.6313726, 0, 1, 1,
0.7940016, 0.1971291, 3.700715, 0.6392157, 0, 1, 1,
0.7942022, -0.209619, 0.7789763, 0.6431373, 0, 1, 1,
0.7984051, 0.6797173, 1.202487, 0.6509804, 0, 1, 1,
0.7994824, 0.5802003, 3.128638, 0.654902, 0, 1, 1,
0.8021411, -1.239378, 1.42508, 0.6627451, 0, 1, 1,
0.8033812, 0.6031963, 1.540492, 0.6666667, 0, 1, 1,
0.8045722, -0.8626265, 3.211825, 0.6745098, 0, 1, 1,
0.8059221, 0.9296144, 0.5221924, 0.6784314, 0, 1, 1,
0.8059595, -0.6589324, 3.516963, 0.6862745, 0, 1, 1,
0.8065227, 0.8980637, -0.9801325, 0.6901961, 0, 1, 1,
0.8067729, -0.1139987, 2.809937, 0.6980392, 0, 1, 1,
0.8112909, -1.541488, 5.07631, 0.7058824, 0, 1, 1,
0.8139529, 1.059514, 1.041647, 0.7098039, 0, 1, 1,
0.8179513, 1.418465, 1.390624, 0.7176471, 0, 1, 1,
0.8192917, -1.367214, 2.51698, 0.7215686, 0, 1, 1,
0.8249464, 0.9541466, 0.7142831, 0.7294118, 0, 1, 1,
0.8315812, -1.055267, 3.315022, 0.7333333, 0, 1, 1,
0.8317115, 1.125507, -0.1439598, 0.7411765, 0, 1, 1,
0.8319485, 0.8647118, 0.08762033, 0.7450981, 0, 1, 1,
0.8325294, -0.2552177, 1.38074, 0.7529412, 0, 1, 1,
0.834141, 0.06269115, 1.914438, 0.7568628, 0, 1, 1,
0.8350134, 0.5491589, -0.1502782, 0.7647059, 0, 1, 1,
0.8367027, 0.4104685, 2.069047, 0.7686275, 0, 1, 1,
0.8395645, -0.4375403, 1.331674, 0.7764706, 0, 1, 1,
0.8400215, -0.06841131, 1.848169, 0.7803922, 0, 1, 1,
0.8424601, 0.3371295, 1.50467, 0.7882353, 0, 1, 1,
0.845323, -0.5264786, 1.746097, 0.7921569, 0, 1, 1,
0.8480138, -0.05696485, 1.71325, 0.8, 0, 1, 1,
0.8535701, 0.2748005, 1.909277, 0.8078431, 0, 1, 1,
0.8539773, -0.07025604, 1.5867, 0.8117647, 0, 1, 1,
0.8561953, -2.026739, 3.908166, 0.8196079, 0, 1, 1,
0.8583751, 0.8958901, 1.677329, 0.8235294, 0, 1, 1,
0.8607777, -0.4030314, 2.482796, 0.8313726, 0, 1, 1,
0.8616146, -0.4355161, 0.4478962, 0.8352941, 0, 1, 1,
0.8648108, -0.3174005, 2.735253, 0.8431373, 0, 1, 1,
0.8662803, -0.7400454, 3.448937, 0.8470588, 0, 1, 1,
0.8668653, -0.01730673, 2.496248, 0.854902, 0, 1, 1,
0.8681908, -0.5372835, 2.783518, 0.8588235, 0, 1, 1,
0.8805926, 0.7172648, 2.447707, 0.8666667, 0, 1, 1,
0.883454, 0.9526905, 1.530313, 0.8705882, 0, 1, 1,
0.8922295, 0.1447024, 1.837185, 0.8784314, 0, 1, 1,
0.897355, 0.05041989, 1.37079, 0.8823529, 0, 1, 1,
0.8975574, 1.227312, -1.010861, 0.8901961, 0, 1, 1,
0.8993525, 0.9911943, -0.9116315, 0.8941177, 0, 1, 1,
0.9039446, 1.562176, 1.022094, 0.9019608, 0, 1, 1,
0.9077581, -0.6697678, 2.325471, 0.9098039, 0, 1, 1,
0.9084609, 0.7795936, 1.113997, 0.9137255, 0, 1, 1,
0.9158024, -0.3960964, 1.277706, 0.9215686, 0, 1, 1,
0.9162962, 1.127353, 0.7396154, 0.9254902, 0, 1, 1,
0.9180462, -1.462362, 3.348183, 0.9333333, 0, 1, 1,
0.9204597, -1.479963, 3.115148, 0.9372549, 0, 1, 1,
0.9225902, -1.03688, 2.73384, 0.945098, 0, 1, 1,
0.9246904, 1.167208, -1.185338, 0.9490196, 0, 1, 1,
0.9252628, 0.8243263, 0.1508559, 0.9568627, 0, 1, 1,
0.9274569, -0.4865986, 2.800197, 0.9607843, 0, 1, 1,
0.9277833, -0.8307338, 2.098046, 0.9686275, 0, 1, 1,
0.930221, 0.2364918, 0.7581574, 0.972549, 0, 1, 1,
0.931077, 0.8289409, -0.0001784772, 0.9803922, 0, 1, 1,
0.9340832, 0.09132241, 1.363147, 0.9843137, 0, 1, 1,
0.9413684, 0.1991729, 1.051303, 0.9921569, 0, 1, 1,
0.9448094, -1.983931, 1.621378, 0.9960784, 0, 1, 1,
0.9468118, 0.215484, -0.2719029, 1, 0, 0.9960784, 1,
0.9521676, 0.106032, 2.129773, 1, 0, 0.9882353, 1,
0.9532498, 0.6065831, -0.516711, 1, 0, 0.9843137, 1,
0.957365, -0.532065, 4.49894, 1, 0, 0.9764706, 1,
0.9592512, 2.309606, 1.122966, 1, 0, 0.972549, 1,
0.9672838, 1.793198, 0.01178371, 1, 0, 0.9647059, 1,
0.9678373, -0.6139128, 2.066723, 1, 0, 0.9607843, 1,
0.9699289, 0.2237986, 2.698203, 1, 0, 0.9529412, 1,
0.9735336, 0.9681515, 1.333706, 1, 0, 0.9490196, 1,
0.97907, -0.965179, 1.869728, 1, 0, 0.9411765, 1,
0.9812403, 0.6910056, -0.1291564, 1, 0, 0.9372549, 1,
0.9846262, 1.549746, -0.8524888, 1, 0, 0.9294118, 1,
0.9990445, -0.4528889, -0.5561465, 1, 0, 0.9254902, 1,
1.000006, 0.9038193, 0.4176392, 1, 0, 0.9176471, 1,
1.000132, -0.9880822, 1.893946, 1, 0, 0.9137255, 1,
1.014268, -0.4427256, 2.351207, 1, 0, 0.9058824, 1,
1.018874, 1.820071, 0.1507258, 1, 0, 0.9019608, 1,
1.027308, -0.5645534, 2.303298, 1, 0, 0.8941177, 1,
1.027817, -0.7538555, 2.57311, 1, 0, 0.8862745, 1,
1.033266, -0.783281, 1.077676, 1, 0, 0.8823529, 1,
1.03515, -0.6492757, 0.2628978, 1, 0, 0.8745098, 1,
1.038407, -0.4892895, 1.644455, 1, 0, 0.8705882, 1,
1.050088, -0.5533296, 1.120153, 1, 0, 0.8627451, 1,
1.052339, -2.296144, 3.44719, 1, 0, 0.8588235, 1,
1.054735, -1.278459, 4.686539, 1, 0, 0.8509804, 1,
1.064175, -0.3938033, 0.915509, 1, 0, 0.8470588, 1,
1.065275, -1.288391, 1.300168, 1, 0, 0.8392157, 1,
1.069154, 0.4824225, 2.064009, 1, 0, 0.8352941, 1,
1.069454, -0.3484708, 0.1341348, 1, 0, 0.827451, 1,
1.081693, -1.619174, 2.431949, 1, 0, 0.8235294, 1,
1.085338, 0.9552972, 1.99457, 1, 0, 0.8156863, 1,
1.089196, -1.375809, 3.027288, 1, 0, 0.8117647, 1,
1.093163, -0.9329485, 2.218014, 1, 0, 0.8039216, 1,
1.093723, -1.021706, 2.912848, 1, 0, 0.7960784, 1,
1.094831, 0.7758582, 2.23797, 1, 0, 0.7921569, 1,
1.09696, -0.03170343, 2.253343, 1, 0, 0.7843137, 1,
1.1055, 1.084533, 1.51962, 1, 0, 0.7803922, 1,
1.109732, -0.1321299, 2.402188, 1, 0, 0.772549, 1,
1.118588, 1.531668, 0.5117885, 1, 0, 0.7686275, 1,
1.119846, 2.08497, 1.227729, 1, 0, 0.7607843, 1,
1.122228, 0.04037987, 2.227321, 1, 0, 0.7568628, 1,
1.124447, -0.4633719, 2.610094, 1, 0, 0.7490196, 1,
1.127003, 0.7800536, 2.438794, 1, 0, 0.7450981, 1,
1.133392, 2.653858, 0.4225727, 1, 0, 0.7372549, 1,
1.135098, -0.2334257, 2.258065, 1, 0, 0.7333333, 1,
1.138862, 0.2801407, 2.433256, 1, 0, 0.7254902, 1,
1.143246, 0.1264297, 2.261747, 1, 0, 0.7215686, 1,
1.146285, 0.1012862, 1.513829, 1, 0, 0.7137255, 1,
1.146527, -0.1237216, 3.652448, 1, 0, 0.7098039, 1,
1.149587, 0.08171573, 2.629566, 1, 0, 0.7019608, 1,
1.155048, -0.5628624, 1.151779, 1, 0, 0.6941177, 1,
1.155762, 0.4473674, 1.611372, 1, 0, 0.6901961, 1,
1.157687, -0.2021228, 0.9330903, 1, 0, 0.682353, 1,
1.163694, 1.781643, 1.349488, 1, 0, 0.6784314, 1,
1.163885, 1.09199, 2.051144, 1, 0, 0.6705883, 1,
1.165221, -0.007194626, 0.8442773, 1, 0, 0.6666667, 1,
1.170644, 1.046644, 0.7988492, 1, 0, 0.6588235, 1,
1.181156, 0.5028503, -0.009233013, 1, 0, 0.654902, 1,
1.182242, -0.2457946, 4.32978, 1, 0, 0.6470588, 1,
1.186897, -1.084821, 2.156589, 1, 0, 0.6431373, 1,
1.200592, -0.3905181, 2.606392, 1, 0, 0.6352941, 1,
1.211478, -1.440379, 3.358266, 1, 0, 0.6313726, 1,
1.215325, 1.825883, -0.6113203, 1, 0, 0.6235294, 1,
1.224124, 0.3040339, 1.804313, 1, 0, 0.6196079, 1,
1.228316, -1.415344, 2.13658, 1, 0, 0.6117647, 1,
1.22866, 0.2201304, 0.8047356, 1, 0, 0.6078432, 1,
1.272323, -0.0970166, 2.511435, 1, 0, 0.6, 1,
1.277164, -0.2182238, 1.889032, 1, 0, 0.5921569, 1,
1.280778, 1.08618, 0.5836015, 1, 0, 0.5882353, 1,
1.284198, 0.5034546, 0.3422373, 1, 0, 0.5803922, 1,
1.29014, 1.03744, 2.359046, 1, 0, 0.5764706, 1,
1.291988, -0.227384, 0.8108367, 1, 0, 0.5686275, 1,
1.299395, -0.1927446, 1.884434, 1, 0, 0.5647059, 1,
1.321866, 0.1681344, 2.761228, 1, 0, 0.5568628, 1,
1.330581, -1.205261, 1.006834, 1, 0, 0.5529412, 1,
1.352464, -0.9411296, 2.186194, 1, 0, 0.5450981, 1,
1.356471, -1.337179, 3.247159, 1, 0, 0.5411765, 1,
1.371019, 1.0525, -0.3902714, 1, 0, 0.5333334, 1,
1.374706, -0.2789972, 1.648605, 1, 0, 0.5294118, 1,
1.375347, 1.017708, 0.7882871, 1, 0, 0.5215687, 1,
1.37931, 1.246544, 1.062776, 1, 0, 0.5176471, 1,
1.384674, -0.3126518, 1.364997, 1, 0, 0.509804, 1,
1.386952, 0.2281654, 0.5528205, 1, 0, 0.5058824, 1,
1.386966, -1.491336, 3.606925, 1, 0, 0.4980392, 1,
1.417828, 0.05661521, 1.968715, 1, 0, 0.4901961, 1,
1.421101, 3.402147, -0.2940337, 1, 0, 0.4862745, 1,
1.429345, -0.3920691, 1.785785, 1, 0, 0.4784314, 1,
1.43216, 2.008631, -0.3177586, 1, 0, 0.4745098, 1,
1.438121, 0.2188873, 2.572961, 1, 0, 0.4666667, 1,
1.447937, 2.933311, -2.182608, 1, 0, 0.4627451, 1,
1.461846, -1.417468, 2.195532, 1, 0, 0.454902, 1,
1.46857, -0.5839735, 2.301565, 1, 0, 0.4509804, 1,
1.469944, 0.7842141, 0.5879757, 1, 0, 0.4431373, 1,
1.475855, -0.02748768, 1.198047, 1, 0, 0.4392157, 1,
1.49088, 1.465058, 0.9296545, 1, 0, 0.4313726, 1,
1.507267, 0.855876, 2.411882, 1, 0, 0.427451, 1,
1.521412, -0.8987001, 1.510078, 1, 0, 0.4196078, 1,
1.522862, 0.9279852, -0.6332807, 1, 0, 0.4156863, 1,
1.524204, -0.06608094, 1.536195, 1, 0, 0.4078431, 1,
1.524304, -0.6304241, 1.38649, 1, 0, 0.4039216, 1,
1.547605, -0.1868734, 3.104394, 1, 0, 0.3960784, 1,
1.553699, 0.1945748, 2.124092, 1, 0, 0.3882353, 1,
1.564403, 0.5338417, -0.07464508, 1, 0, 0.3843137, 1,
1.564511, -0.1637103, 0.4364224, 1, 0, 0.3764706, 1,
1.568201, -0.5897846, 2.538517, 1, 0, 0.372549, 1,
1.588566, 0.5744841, 0.2241321, 1, 0, 0.3647059, 1,
1.607412, 1.178378, -0.4387203, 1, 0, 0.3607843, 1,
1.608388, -0.9154311, 2.101761, 1, 0, 0.3529412, 1,
1.612196, 0.04490475, 2.248666, 1, 0, 0.3490196, 1,
1.613135, 1.085274, 0.6486394, 1, 0, 0.3411765, 1,
1.637918, 0.6959208, 0.2156564, 1, 0, 0.3372549, 1,
1.65745, 1.277784, 1.248645, 1, 0, 0.3294118, 1,
1.66459, -0.09853055, 2.10615, 1, 0, 0.3254902, 1,
1.668061, -0.7485538, 2.993156, 1, 0, 0.3176471, 1,
1.675362, 0.1941818, 0.6880172, 1, 0, 0.3137255, 1,
1.694809, 0.7799248, 3.11975, 1, 0, 0.3058824, 1,
1.702328, -2.39661, 3.140457, 1, 0, 0.2980392, 1,
1.711452, -0.8725219, 2.968398, 1, 0, 0.2941177, 1,
1.71488, -0.1218057, 1.917538, 1, 0, 0.2862745, 1,
1.734066, 1.271256, 1.499701, 1, 0, 0.282353, 1,
1.768357, -0.3380402, 3.373526, 1, 0, 0.2745098, 1,
1.770128, -0.4013836, 2.131469, 1, 0, 0.2705882, 1,
1.770647, -1.750525, 3.114447, 1, 0, 0.2627451, 1,
1.794368, 0.4894285, -0.4366765, 1, 0, 0.2588235, 1,
1.798257, -0.2482774, 0.8849822, 1, 0, 0.2509804, 1,
1.805557, 0.2514398, 0.3512467, 1, 0, 0.2470588, 1,
1.81291, 0.7767215, 1.271464, 1, 0, 0.2392157, 1,
1.858772, -1.236979, 2.550226, 1, 0, 0.2352941, 1,
1.888742, -0.8646998, 0.4663602, 1, 0, 0.227451, 1,
1.892881, 2.45087, 0.02401915, 1, 0, 0.2235294, 1,
1.90207, -0.9607466, 2.001091, 1, 0, 0.2156863, 1,
1.902199, -1.481129, 1.618107, 1, 0, 0.2117647, 1,
1.919402, 0.4605184, 1.032077, 1, 0, 0.2039216, 1,
1.94324, -0.6611055, 2.753485, 1, 0, 0.1960784, 1,
1.949595, 1.452572, -0.05584097, 1, 0, 0.1921569, 1,
1.953178, 2.141986, -0.09833021, 1, 0, 0.1843137, 1,
1.98027, -1.520122, 4.133609, 1, 0, 0.1803922, 1,
2.004562, -1.798902, 2.863845, 1, 0, 0.172549, 1,
2.05677, 0.9421454, 2.921436, 1, 0, 0.1686275, 1,
2.060822, 0.5023902, 0.4888274, 1, 0, 0.1607843, 1,
2.06874, 0.0416753, 1.918306, 1, 0, 0.1568628, 1,
2.090732, 0.02278263, 1.678204, 1, 0, 0.1490196, 1,
2.090918, -0.01094954, 1.583112, 1, 0, 0.145098, 1,
2.092429, 0.4922356, 0.5412724, 1, 0, 0.1372549, 1,
2.099784, 1.476265, 2.536416, 1, 0, 0.1333333, 1,
2.12319, -0.1513888, 2.294832, 1, 0, 0.1254902, 1,
2.136283, -0.2901444, 0.2510833, 1, 0, 0.1215686, 1,
2.14443, 1.500869, 1.120178, 1, 0, 0.1137255, 1,
2.154774, -0.7999852, 0.5084247, 1, 0, 0.1098039, 1,
2.162778, 0.6397854, 0.4167929, 1, 0, 0.1019608, 1,
2.176042, 0.9682865, 0.03326877, 1, 0, 0.09411765, 1,
2.214856, -0.7082062, 2.952358, 1, 0, 0.09019608, 1,
2.260293, -0.5122278, 1.55334, 1, 0, 0.08235294, 1,
2.28676, -0.3373204, 2.127664, 1, 0, 0.07843138, 1,
2.286763, -0.2373828, 1.979464, 1, 0, 0.07058824, 1,
2.291667, 0.7507721, 0.3868353, 1, 0, 0.06666667, 1,
2.301026, -1.773387, 2.685076, 1, 0, 0.05882353, 1,
2.307016, -1.414775, 2.923163, 1, 0, 0.05490196, 1,
2.338182, -0.02991142, 1.603067, 1, 0, 0.04705882, 1,
2.384976, -2.046965, 1.155403, 1, 0, 0.04313726, 1,
2.462285, 0.5098763, -0.5702474, 1, 0, 0.03529412, 1,
2.64871, -0.3381821, 1.191101, 1, 0, 0.03137255, 1,
2.689433, 0.653125, 1.408888, 1, 0, 0.02352941, 1,
2.705548, 0.566576, 1.679239, 1, 0, 0.01960784, 1,
2.722538, 0.2918823, 3.51129, 1, 0, 0.01176471, 1,
2.847828, 0.2327482, 0.1015812, 1, 0, 0.007843138, 1
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
0.03574431, -4.249351, -7.359818, 0, -0.5, 0.5, 0.5,
0.03574431, -4.249351, -7.359818, 1, -0.5, 0.5, 0.5,
0.03574431, -4.249351, -7.359818, 1, 1.5, 0.5, 0.5,
0.03574431, -4.249351, -7.359818, 0, 1.5, 0.5, 0.5
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
-3.729636, 0.1308781, -7.359818, 0, -0.5, 0.5, 0.5,
-3.729636, 0.1308781, -7.359818, 1, -0.5, 0.5, 0.5,
-3.729636, 0.1308781, -7.359818, 1, 1.5, 0.5, 0.5,
-3.729636, 0.1308781, -7.359818, 0, 1.5, 0.5, 0.5
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
-3.729636, -4.249351, -0.2405469, 0, -0.5, 0.5, 0.5,
-3.729636, -4.249351, -0.2405469, 1, -0.5, 0.5, 0.5,
-3.729636, -4.249351, -0.2405469, 1, 1.5, 0.5, 0.5,
-3.729636, -4.249351, -0.2405469, 0, 1.5, 0.5, 0.5
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
-2, -3.238529, -5.716909,
2, -3.238529, -5.716909,
-2, -3.238529, -5.716909,
-2, -3.406999, -5.990727,
-1, -3.238529, -5.716909,
-1, -3.406999, -5.990727,
0, -3.238529, -5.716909,
0, -3.406999, -5.990727,
1, -3.238529, -5.716909,
1, -3.406999, -5.990727,
2, -3.238529, -5.716909,
2, -3.406999, -5.990727
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
-2, -3.74394, -6.538363, 0, -0.5, 0.5, 0.5,
-2, -3.74394, -6.538363, 1, -0.5, 0.5, 0.5,
-2, -3.74394, -6.538363, 1, 1.5, 0.5, 0.5,
-2, -3.74394, -6.538363, 0, 1.5, 0.5, 0.5,
-1, -3.74394, -6.538363, 0, -0.5, 0.5, 0.5,
-1, -3.74394, -6.538363, 1, -0.5, 0.5, 0.5,
-1, -3.74394, -6.538363, 1, 1.5, 0.5, 0.5,
-1, -3.74394, -6.538363, 0, 1.5, 0.5, 0.5,
0, -3.74394, -6.538363, 0, -0.5, 0.5, 0.5,
0, -3.74394, -6.538363, 1, -0.5, 0.5, 0.5,
0, -3.74394, -6.538363, 1, 1.5, 0.5, 0.5,
0, -3.74394, -6.538363, 0, 1.5, 0.5, 0.5,
1, -3.74394, -6.538363, 0, -0.5, 0.5, 0.5,
1, -3.74394, -6.538363, 1, -0.5, 0.5, 0.5,
1, -3.74394, -6.538363, 1, 1.5, 0.5, 0.5,
1, -3.74394, -6.538363, 0, 1.5, 0.5, 0.5,
2, -3.74394, -6.538363, 0, -0.5, 0.5, 0.5,
2, -3.74394, -6.538363, 1, -0.5, 0.5, 0.5,
2, -3.74394, -6.538363, 1, 1.5, 0.5, 0.5,
2, -3.74394, -6.538363, 0, 1.5, 0.5, 0.5
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
-2.860702, -3, -5.716909,
-2.860702, 3, -5.716909,
-2.860702, -3, -5.716909,
-3.005525, -3, -5.990727,
-2.860702, -2, -5.716909,
-3.005525, -2, -5.990727,
-2.860702, -1, -5.716909,
-3.005525, -1, -5.990727,
-2.860702, 0, -5.716909,
-3.005525, 0, -5.990727,
-2.860702, 1, -5.716909,
-3.005525, 1, -5.990727,
-2.860702, 2, -5.716909,
-3.005525, 2, -5.990727,
-2.860702, 3, -5.716909,
-3.005525, 3, -5.990727
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
-3.295169, -3, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, -3, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, -3, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, -3, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, -2, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, -2, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, -2, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, -2, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, -1, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, -1, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, -1, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, -1, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, 0, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, 0, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, 0, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, 0, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, 1, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, 1, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, 1, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, 1, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, 2, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, 2, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, 2, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, 2, -6.538363, 0, 1.5, 0.5, 0.5,
-3.295169, 3, -6.538363, 0, -0.5, 0.5, 0.5,
-3.295169, 3, -6.538363, 1, -0.5, 0.5, 0.5,
-3.295169, 3, -6.538363, 1, 1.5, 0.5, 0.5,
-3.295169, 3, -6.538363, 0, 1.5, 0.5, 0.5
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
-2.860702, -3.238529, -4,
-2.860702, -3.238529, 4,
-2.860702, -3.238529, -4,
-3.005525, -3.406999, -4,
-2.860702, -3.238529, -2,
-3.005525, -3.406999, -2,
-2.860702, -3.238529, 0,
-3.005525, -3.406999, 0,
-2.860702, -3.238529, 2,
-3.005525, -3.406999, 2,
-2.860702, -3.238529, 4,
-3.005525, -3.406999, 4
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
-3.295169, -3.74394, -4, 0, -0.5, 0.5, 0.5,
-3.295169, -3.74394, -4, 1, -0.5, 0.5, 0.5,
-3.295169, -3.74394, -4, 1, 1.5, 0.5, 0.5,
-3.295169, -3.74394, -4, 0, 1.5, 0.5, 0.5,
-3.295169, -3.74394, -2, 0, -0.5, 0.5, 0.5,
-3.295169, -3.74394, -2, 1, -0.5, 0.5, 0.5,
-3.295169, -3.74394, -2, 1, 1.5, 0.5, 0.5,
-3.295169, -3.74394, -2, 0, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 0, 0, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 0, 1, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 0, 1, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 0, 0, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 2, 0, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 2, 1, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 2, 1, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 2, 0, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 4, 0, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 4, 1, -0.5, 0.5, 0.5,
-3.295169, -3.74394, 4, 1, 1.5, 0.5, 0.5,
-3.295169, -3.74394, 4, 0, 1.5, 0.5, 0.5
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
-2.860702, -3.238529, -5.716909,
-2.860702, 3.500285, -5.716909,
-2.860702, -3.238529, 5.235816,
-2.860702, 3.500285, 5.235816,
-2.860702, -3.238529, -5.716909,
-2.860702, -3.238529, 5.235816,
-2.860702, 3.500285, -5.716909,
-2.860702, 3.500285, 5.235816,
-2.860702, -3.238529, -5.716909,
2.932191, -3.238529, -5.716909,
-2.860702, -3.238529, 5.235816,
2.932191, -3.238529, 5.235816,
-2.860702, 3.500285, -5.716909,
2.932191, 3.500285, -5.716909,
-2.860702, 3.500285, 5.235816,
2.932191, 3.500285, 5.235816,
2.932191, -3.238529, -5.716909,
2.932191, 3.500285, -5.716909,
2.932191, -3.238529, 5.235816,
2.932191, 3.500285, 5.235816,
2.932191, -3.238529, -5.716909,
2.932191, -3.238529, 5.235816,
2.932191, 3.500285, -5.716909,
2.932191, 3.500285, 5.235816
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
var radius = 7.531424;
var distance = 33.50816;
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
mvMatrix.translate( -0.03574431, -0.1308781, 0.2405469 );
mvMatrix.scale( 1.405709, 1.208391, 0.7434793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50816);
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
copper_arsenate_copp<-read.table("copper_arsenate_copp.xyz")
```

```
## Error in read.table("copper_arsenate_copp.xyz"): no lines available in input
```

```r
x<-copper_arsenate_copp$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
y<-copper_arsenate_copp$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
```

```r
z<-copper_arsenate_copp$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_arsenate_copp' not found
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
-2.77634, 0.04975904, -1.568612, 0, 0, 1, 1, 1,
-2.607049, 0.2002811, -1.734373, 1, 0, 0, 1, 1,
-2.494676, 1.798347, -0.3356773, 1, 0, 0, 1, 1,
-2.491967, -0.5810343, -2.600126, 1, 0, 0, 1, 1,
-2.489496, 0.7480826, -0.4069063, 1, 0, 0, 1, 1,
-2.435989, 0.3128412, -1.726662, 1, 0, 0, 1, 1,
-2.422408, -0.2992881, -3.618278, 0, 0, 0, 1, 1,
-2.415114, -0.3585904, -2.443431, 0, 0, 0, 1, 1,
-2.410762, -0.05383808, -1.87656, 0, 0, 0, 1, 1,
-2.369209, -1.408091, -2.265558, 0, 0, 0, 1, 1,
-2.358594, 0.7723294, -1.891789, 0, 0, 0, 1, 1,
-2.35254, 0.1436097, -1.745624, 0, 0, 0, 1, 1,
-2.335191, 0.03555117, -2.825291, 0, 0, 0, 1, 1,
-2.306029, 0.4821467, -2.054083, 1, 1, 1, 1, 1,
-2.304372, 1.262534, 0.8928725, 1, 1, 1, 1, 1,
-2.19762, -0.9226087, -1.875652, 1, 1, 1, 1, 1,
-2.185295, 0.2116126, -2.733169, 1, 1, 1, 1, 1,
-2.157697, 1.710781, -0.5192493, 1, 1, 1, 1, 1,
-2.149693, -0.4067658, -1.438398, 1, 1, 1, 1, 1,
-2.109232, 0.3637343, -0.870578, 1, 1, 1, 1, 1,
-2.108577, 0.1980816, -0.05493892, 1, 1, 1, 1, 1,
-2.038568, -1.367545, -2.771529, 1, 1, 1, 1, 1,
-2.011901, -0.7556632, -2.857435, 1, 1, 1, 1, 1,
-1.999922, -1.70559, -0.3904825, 1, 1, 1, 1, 1,
-1.994041, -1.262411, -3.784538, 1, 1, 1, 1, 1,
-1.952061, 2.441114, -1.513068, 1, 1, 1, 1, 1,
-1.934717, -0.1876326, -1.418535, 1, 1, 1, 1, 1,
-1.903394, 0.1922552, 0.8620908, 1, 1, 1, 1, 1,
-1.896717, 0.6186357, -0.4473888, 0, 0, 1, 1, 1,
-1.848778, 0.3705212, -1.916722, 1, 0, 0, 1, 1,
-1.842865, -0.3892566, -2.753612, 1, 0, 0, 1, 1,
-1.820337, -0.5085912, -0.5874182, 1, 0, 0, 1, 1,
-1.814061, -0.2538347, -1.395237, 1, 0, 0, 1, 1,
-1.806839, 0.3891682, -1.147664, 1, 0, 0, 1, 1,
-1.800245, -0.9282527, -4.387766, 0, 0, 0, 1, 1,
-1.785383, -0.04029461, -1.024346, 0, 0, 0, 1, 1,
-1.780836, -1.221482, -3.552507, 0, 0, 0, 1, 1,
-1.776754, -2.072684, -2.495419, 0, 0, 0, 1, 1,
-1.765723, 1.731867, -0.300106, 0, 0, 0, 1, 1,
-1.735349, 1.619153, -0.78088, 0, 0, 0, 1, 1,
-1.734398, 0.03657983, -0.2445666, 0, 0, 0, 1, 1,
-1.734079, 0.5088975, -1.288198, 1, 1, 1, 1, 1,
-1.714785, -1.137405, -0.3148873, 1, 1, 1, 1, 1,
-1.701593, -0.271843, -1.743122, 1, 1, 1, 1, 1,
-1.695911, 0.5247375, -0.847489, 1, 1, 1, 1, 1,
-1.686891, -0.1848269, -2.769038, 1, 1, 1, 1, 1,
-1.658185, 2.188191, -0.7224264, 1, 1, 1, 1, 1,
-1.654577, 0.1305047, 0.2401984, 1, 1, 1, 1, 1,
-1.646769, -0.847888, -1.014288, 1, 1, 1, 1, 1,
-1.633504, -1.290793, -2.344248, 1, 1, 1, 1, 1,
-1.633474, 0.9479895, -0.1927488, 1, 1, 1, 1, 1,
-1.630301, 0.5143923, -1.186061, 1, 1, 1, 1, 1,
-1.619177, -0.3076763, -1.030135, 1, 1, 1, 1, 1,
-1.617375, 1.097447, -0.2446964, 1, 1, 1, 1, 1,
-1.616387, -0.7030094, -3.086295, 1, 1, 1, 1, 1,
-1.61534, 0.9012543, -0.9974953, 1, 1, 1, 1, 1,
-1.606624, 0.3357952, -0.2887744, 0, 0, 1, 1, 1,
-1.605304, 0.1901634, -2.022292, 1, 0, 0, 1, 1,
-1.598471, -0.6504804, -2.947037, 1, 0, 0, 1, 1,
-1.588133, 1.244427, -1.001559, 1, 0, 0, 1, 1,
-1.587959, -0.2955969, -2.714841, 1, 0, 0, 1, 1,
-1.556618, 0.5799547, -2.280907, 1, 0, 0, 1, 1,
-1.549953, 0.1598456, -4.12558, 0, 0, 0, 1, 1,
-1.542117, -0.1839155, -0.2939176, 0, 0, 0, 1, 1,
-1.536399, 1.216036, -0.3161228, 0, 0, 0, 1, 1,
-1.534146, -1.484416, -3.381508, 0, 0, 0, 1, 1,
-1.525896, -1.45481, -2.194774, 0, 0, 0, 1, 1,
-1.50338, 1.109142, -1.405307, 0, 0, 0, 1, 1,
-1.492008, -1.930582, -1.815104, 0, 0, 0, 1, 1,
-1.491591, -0.2708747, -1.274253, 1, 1, 1, 1, 1,
-1.485104, 0.2079845, -1.74758, 1, 1, 1, 1, 1,
-1.472104, -0.5430019, -0.3648779, 1, 1, 1, 1, 1,
-1.45888, 0.03670136, -2.604705, 1, 1, 1, 1, 1,
-1.458279, -0.1482417, -1.151926, 1, 1, 1, 1, 1,
-1.432861, -1.7652, -4.078124, 1, 1, 1, 1, 1,
-1.432665, 1.3033, -2.919434, 1, 1, 1, 1, 1,
-1.421499, -1.979837, -2.742316, 1, 1, 1, 1, 1,
-1.41979, -0.9925081, -4.713737, 1, 1, 1, 1, 1,
-1.418959, -1.156292, -1.284621, 1, 1, 1, 1, 1,
-1.418294, -0.09301074, -2.436699, 1, 1, 1, 1, 1,
-1.399742, -0.2972579, -2.573152, 1, 1, 1, 1, 1,
-1.399181, -1.831716, -1.867116, 1, 1, 1, 1, 1,
-1.392008, -0.4363107, -1.298317, 1, 1, 1, 1, 1,
-1.389633, 1.408383, -1.42685, 1, 1, 1, 1, 1,
-1.381026, 0.5646375, -2.685287, 0, 0, 1, 1, 1,
-1.379796, 0.3203422, -0.5572578, 1, 0, 0, 1, 1,
-1.37347, -0.8213727, -3.920736, 1, 0, 0, 1, 1,
-1.370961, -0.3706304, -0.2405894, 1, 0, 0, 1, 1,
-1.359179, 1.158173, -1.815496, 1, 0, 0, 1, 1,
-1.358712, -0.1687079, -2.397663, 1, 0, 0, 1, 1,
-1.330469, -0.3550919, -2.290774, 0, 0, 0, 1, 1,
-1.325087, -0.9542063, -1.219956, 0, 0, 0, 1, 1,
-1.321105, 0.070671, -1.569874, 0, 0, 0, 1, 1,
-1.318834, -2.030265, -2.331251, 0, 0, 0, 1, 1,
-1.315717, -0.643977, -0.5953639, 0, 0, 0, 1, 1,
-1.309952, -1.82397, -2.601043, 0, 0, 0, 1, 1,
-1.301833, -0.8831438, -3.418618, 0, 0, 0, 1, 1,
-1.277542, 0.20452, -0.4175644, 1, 1, 1, 1, 1,
-1.275745, -0.8713243, -2.343387, 1, 1, 1, 1, 1,
-1.273937, -0.7634055, -2.602112, 1, 1, 1, 1, 1,
-1.27241, 1.795044, -0.3166143, 1, 1, 1, 1, 1,
-1.255623, -1.376345, -2.676633, 1, 1, 1, 1, 1,
-1.247983, 1.950148, -0.5795217, 1, 1, 1, 1, 1,
-1.245541, -1.327524, -2.000924, 1, 1, 1, 1, 1,
-1.23749, -0.06865422, -1.556242, 1, 1, 1, 1, 1,
-1.235911, 1.22159, -1.59493, 1, 1, 1, 1, 1,
-1.231426, 0.7076046, -0.159166, 1, 1, 1, 1, 1,
-1.23124, -0.2304479, -2.475376, 1, 1, 1, 1, 1,
-1.228041, -1.138533, -5.527185, 1, 1, 1, 1, 1,
-1.225748, 1.349629, -1.920982, 1, 1, 1, 1, 1,
-1.223751, 1.133842, -1.004016, 1, 1, 1, 1, 1,
-1.221352, -1.406948, -0.6961378, 1, 1, 1, 1, 1,
-1.217181, 0.5359165, -0.7546353, 0, 0, 1, 1, 1,
-1.215754, -1.355227, -3.30163, 1, 0, 0, 1, 1,
-1.214105, 0.9758268, -1.091354, 1, 0, 0, 1, 1,
-1.208538, 0.292372, -1.20124, 1, 0, 0, 1, 1,
-1.206744, -0.693067, -1.712585, 1, 0, 0, 1, 1,
-1.205941, -0.5461575, -1.391973, 1, 0, 0, 1, 1,
-1.199547, -0.8252195, -1.59985, 0, 0, 0, 1, 1,
-1.192284, -1.332321, -0.9188313, 0, 0, 0, 1, 1,
-1.185396, -0.5837513, -1.300564, 0, 0, 0, 1, 1,
-1.170141, 0.2851308, -0.915466, 0, 0, 0, 1, 1,
-1.168159, -1.787218, -2.896703, 0, 0, 0, 1, 1,
-1.164272, -0.7858382, -3.826542, 0, 0, 0, 1, 1,
-1.158936, 1.279675, -1.175755, 0, 0, 0, 1, 1,
-1.157367, 0.4248011, 0.259214, 1, 1, 1, 1, 1,
-1.148409, -0.9765664, -4.144203, 1, 1, 1, 1, 1,
-1.129139, -0.3752978, -1.112427, 1, 1, 1, 1, 1,
-1.125115, 0.09257191, -2.4341, 1, 1, 1, 1, 1,
-1.115318, 0.1296905, -1.022352, 1, 1, 1, 1, 1,
-1.11101, 1.745162, -0.7298433, 1, 1, 1, 1, 1,
-1.10878, 0.5870407, -0.5917203, 1, 1, 1, 1, 1,
-1.09982, 1.514868, 0.7845946, 1, 1, 1, 1, 1,
-1.096494, 0.8240391, -1.890852, 1, 1, 1, 1, 1,
-1.088785, -0.2616571, -0.8575515, 1, 1, 1, 1, 1,
-1.085444, 2.00181, -0.3575025, 1, 1, 1, 1, 1,
-1.079595, -1.095804, -1.833234, 1, 1, 1, 1, 1,
-1.079338, 0.1158787, -0.1126089, 1, 1, 1, 1, 1,
-1.078444, 0.7312726, -2.354027, 1, 1, 1, 1, 1,
-1.07818, -0.675733, -0.2793744, 1, 1, 1, 1, 1,
-1.075352, -0.6935207, -2.655418, 0, 0, 1, 1, 1,
-1.074231, 1.495059, 0.8503605, 1, 0, 0, 1, 1,
-1.07411, -0.02251474, -1.763691, 1, 0, 0, 1, 1,
-1.071144, 1.192628, 0.9915273, 1, 0, 0, 1, 1,
-1.067758, 0.07473141, -2.605213, 1, 0, 0, 1, 1,
-1.067308, -0.05093507, -2.044845, 1, 0, 0, 1, 1,
-1.061665, 0.3260218, -0.9662971, 0, 0, 0, 1, 1,
-1.039812, 1.43628, -0.3018266, 0, 0, 0, 1, 1,
-1.038246, -0.3359869, -1.844759, 0, 0, 0, 1, 1,
-1.035973, -0.1991806, -2.810289, 0, 0, 0, 1, 1,
-1.028597, 0.7103093, 0.0550919, 0, 0, 0, 1, 1,
-1.019837, -1.313678, -1.319586, 0, 0, 0, 1, 1,
-1.007779, -0.236475, -1.29168, 0, 0, 0, 1, 1,
-1.000903, -0.5073887, -0.617083, 1, 1, 1, 1, 1,
-1.000186, 1.138974, -0.5372118, 1, 1, 1, 1, 1,
-0.9989711, -0.6183863, -0.2237131, 1, 1, 1, 1, 1,
-0.9986458, 2.471562, 1.892242, 1, 1, 1, 1, 1,
-0.9938928, 0.799679, -0.9138058, 1, 1, 1, 1, 1,
-0.9928705, -0.9328709, -2.628991, 1, 1, 1, 1, 1,
-0.9902518, -0.1153006, -1.933416, 1, 1, 1, 1, 1,
-0.9866223, -0.9683752, -1.159044, 1, 1, 1, 1, 1,
-0.9839142, 1.281624, -2.312254, 1, 1, 1, 1, 1,
-0.9831812, -0.7373623, -0.2607882, 1, 1, 1, 1, 1,
-0.9828193, -0.5101025, -1.801558, 1, 1, 1, 1, 1,
-0.980425, -0.9548191, -3.210612, 1, 1, 1, 1, 1,
-0.9780691, -0.5561981, -2.978024, 1, 1, 1, 1, 1,
-0.9777516, 1.516307, -1.124518, 1, 1, 1, 1, 1,
-0.9723164, 0.06295639, -0.1787917, 1, 1, 1, 1, 1,
-0.966336, -1.40065, -3.781755, 0, 0, 1, 1, 1,
-0.9503721, 0.395952, -0.03866168, 1, 0, 0, 1, 1,
-0.9486572, -0.3427002, -2.978926, 1, 0, 0, 1, 1,
-0.9458822, -0.7122573, -3.116874, 1, 0, 0, 1, 1,
-0.9395638, 0.9141821, 0.2248952, 1, 0, 0, 1, 1,
-0.9395598, -1.928854, -1.326883, 1, 0, 0, 1, 1,
-0.938632, 0.8559688, -0.9960747, 0, 0, 0, 1, 1,
-0.932297, 0.5723715, -0.5861112, 0, 0, 0, 1, 1,
-0.9280252, -2.270841, -3.274849, 0, 0, 0, 1, 1,
-0.9275228, -0.05789651, -0.931088, 0, 0, 0, 1, 1,
-0.9190912, 0.5747792, -0.3215426, 0, 0, 0, 1, 1,
-0.9184488, -1.622221, -1.621795, 0, 0, 0, 1, 1,
-0.9170921, -0.3161829, -1.153572, 0, 0, 0, 1, 1,
-0.9060807, 1.015091, 1.046974, 1, 1, 1, 1, 1,
-0.9000497, 0.9898408, -0.442018, 1, 1, 1, 1, 1,
-0.8951078, 0.1171489, -0.1596113, 1, 1, 1, 1, 1,
-0.8949972, 0.9251308, -1.423004, 1, 1, 1, 1, 1,
-0.8947852, 0.4779526, -0.7700841, 1, 1, 1, 1, 1,
-0.891269, 0.03785685, -0.424565, 1, 1, 1, 1, 1,
-0.8882948, -0.1424273, -3.498454, 1, 1, 1, 1, 1,
-0.8841264, -1.079909, -3.524328, 1, 1, 1, 1, 1,
-0.8831034, 0.6453062, -0.8674901, 1, 1, 1, 1, 1,
-0.8809496, 1.460754, -0.9860207, 1, 1, 1, 1, 1,
-0.8786374, -0.7174711, -2.621222, 1, 1, 1, 1, 1,
-0.8786151, -0.294789, -5.164098, 1, 1, 1, 1, 1,
-0.8767216, 1.264535, -1.485536, 1, 1, 1, 1, 1,
-0.8696459, -1.046434, -0.7113143, 1, 1, 1, 1, 1,
-0.8647916, 1.379746, -1.796099, 1, 1, 1, 1, 1,
-0.8541245, -1.360905, -1.336992, 0, 0, 1, 1, 1,
-0.8497353, 1.037575, -4.089982, 1, 0, 0, 1, 1,
-0.8455298, 0.4633383, 0.1018865, 1, 0, 0, 1, 1,
-0.8404279, -1.080873, -1.583637, 1, 0, 0, 1, 1,
-0.834931, 1.358348, -0.0221404, 1, 0, 0, 1, 1,
-0.8341987, 0.7204445, 0.3167086, 1, 0, 0, 1, 1,
-0.8331082, -0.6213955, -0.7861493, 0, 0, 0, 1, 1,
-0.832119, -1.833295, -4.025603, 0, 0, 0, 1, 1,
-0.8285788, -1.037409, -1.888652, 0, 0, 0, 1, 1,
-0.8228481, 0.159466, -1.676385, 0, 0, 0, 1, 1,
-0.8225895, 0.1087593, -1.607231, 0, 0, 0, 1, 1,
-0.8211155, 0.6093867, -1.20767, 0, 0, 0, 1, 1,
-0.8207193, 0.8614271, -0.6074401, 0, 0, 0, 1, 1,
-0.819444, -0.1270504, -1.077134, 1, 1, 1, 1, 1,
-0.819156, -0.4300767, -2.057919, 1, 1, 1, 1, 1,
-0.8183817, -1.245886, -1.12491, 1, 1, 1, 1, 1,
-0.8110201, -0.3793971, -2.805225, 1, 1, 1, 1, 1,
-0.8053951, -0.3806394, -0.890285, 1, 1, 1, 1, 1,
-0.8041852, -0.09693604, -2.455917, 1, 1, 1, 1, 1,
-0.7862318, -0.9054083, -2.380089, 1, 1, 1, 1, 1,
-0.7834151, 0.8756596, -0.8963344, 1, 1, 1, 1, 1,
-0.782288, -1.966839, -4.463412, 1, 1, 1, 1, 1,
-0.7813578, 1.255905, 0.4583154, 1, 1, 1, 1, 1,
-0.7806008, 0.6723763, -0.4957846, 1, 1, 1, 1, 1,
-0.7802169, -0.7850417, -2.86138, 1, 1, 1, 1, 1,
-0.7715272, -0.3651297, -2.815821, 1, 1, 1, 1, 1,
-0.7679483, 1.067226, -1.344156, 1, 1, 1, 1, 1,
-0.7670137, 0.542281, -1.149023, 1, 1, 1, 1, 1,
-0.7569066, -0.4472814, -1.929441, 0, 0, 1, 1, 1,
-0.7520401, -0.6293033, -2.231608, 1, 0, 0, 1, 1,
-0.7459573, -0.8726575, -3.514662, 1, 0, 0, 1, 1,
-0.7452227, 0.4402442, -0.4329499, 1, 0, 0, 1, 1,
-0.7434763, 0.7663192, -0.7059465, 1, 0, 0, 1, 1,
-0.7406432, 0.2656886, -0.5619033, 1, 0, 0, 1, 1,
-0.7382751, -1.688907, -2.882066, 0, 0, 0, 1, 1,
-0.7251958, -1.247279, -2.687289, 0, 0, 0, 1, 1,
-0.7229288, -0.8212703, -3.169928, 0, 0, 0, 1, 1,
-0.7211661, -0.40005, -2.920901, 0, 0, 0, 1, 1,
-0.7198159, -1.586049, -2.007878, 0, 0, 0, 1, 1,
-0.7178901, -0.2083174, -3.2285, 0, 0, 0, 1, 1,
-0.710031, 1.164533, -0.5292783, 0, 0, 0, 1, 1,
-0.708542, 0.7325383, -1.878404, 1, 1, 1, 1, 1,
-0.7047849, 1.313447, 1.039887, 1, 1, 1, 1, 1,
-0.7040963, 1.523976, -0.2525532, 1, 1, 1, 1, 1,
-0.6973416, 1.450189, -0.2231047, 1, 1, 1, 1, 1,
-0.6956198, 0.7037747, 1.172434, 1, 1, 1, 1, 1,
-0.6895326, 0.9277962, -1.204094, 1, 1, 1, 1, 1,
-0.6882599, -0.8788431, -3.926977, 1, 1, 1, 1, 1,
-0.6849873, -0.7213836, -2.506772, 1, 1, 1, 1, 1,
-0.6811315, -0.1497747, -3.495894, 1, 1, 1, 1, 1,
-0.6800917, 1.004465, 0.02073466, 1, 1, 1, 1, 1,
-0.6780546, -1.640149, -4.757193, 1, 1, 1, 1, 1,
-0.6773505, 0.007992142, -3.300899, 1, 1, 1, 1, 1,
-0.6745955, 0.2863872, -1.590162, 1, 1, 1, 1, 1,
-0.673906, -1.346248, -2.241462, 1, 1, 1, 1, 1,
-0.6723458, -0.86858, -2.358264, 1, 1, 1, 1, 1,
-0.669952, -0.01686999, -0.9749066, 0, 0, 1, 1, 1,
-0.6676526, -1.324623, -1.63148, 1, 0, 0, 1, 1,
-0.661548, -1.102428, -3.094813, 1, 0, 0, 1, 1,
-0.6504474, -0.2691892, -1.550155, 1, 0, 0, 1, 1,
-0.6492094, 2.056523, -0.2535897, 1, 0, 0, 1, 1,
-0.6481071, 1.929187, -1.253364, 1, 0, 0, 1, 1,
-0.6480521, -0.1700006, -3.207761, 0, 0, 0, 1, 1,
-0.6458128, 1.199947, 1.414623, 0, 0, 0, 1, 1,
-0.6458068, -0.1249808, -3.522448, 0, 0, 0, 1, 1,
-0.6457359, -0.1244527, -2.517861, 0, 0, 0, 1, 1,
-0.6364453, 0.5762258, -0.8767234, 0, 0, 0, 1, 1,
-0.634019, 0.323301, -0.5780061, 0, 0, 0, 1, 1,
-0.6336144, -1.038497, -1.983567, 0, 0, 0, 1, 1,
-0.6300654, -1.556851, -3.049185, 1, 1, 1, 1, 1,
-0.6269264, 0.04028933, -1.688817, 1, 1, 1, 1, 1,
-0.6261268, -1.97956, -2.369612, 1, 1, 1, 1, 1,
-0.6258277, -0.7379499, -3.908137, 1, 1, 1, 1, 1,
-0.6238402, -0.6187238, -2.215432, 1, 1, 1, 1, 1,
-0.6229144, 1.68447, -2.09295, 1, 1, 1, 1, 1,
-0.6202425, 0.2417183, 0.8297122, 1, 1, 1, 1, 1,
-0.6200254, 0.363675, 0.03522021, 1, 1, 1, 1, 1,
-0.6154299, -1.014393, -3.32264, 1, 1, 1, 1, 1,
-0.6129357, -0.5318595, -3.831842, 1, 1, 1, 1, 1,
-0.6124122, 0.140504, -2.346937, 1, 1, 1, 1, 1,
-0.6101315, -1.535477, -4.673105, 1, 1, 1, 1, 1,
-0.6062572, 0.5398622, 0.1476768, 1, 1, 1, 1, 1,
-0.6024105, -0.0906742, -2.522169, 1, 1, 1, 1, 1,
-0.600489, -1.688229, -2.435609, 1, 1, 1, 1, 1,
-0.598425, 2.197081, 0.8127546, 0, 0, 1, 1, 1,
-0.5949389, -0.4311278, -3.0543, 1, 0, 0, 1, 1,
-0.5858474, 0.3287713, -1.774648, 1, 0, 0, 1, 1,
-0.5772333, 1.298875, -1.768358, 1, 0, 0, 1, 1,
-0.5760263, -1.118181, -1.645031, 1, 0, 0, 1, 1,
-0.5695534, 0.08061509, -0.8977267, 1, 0, 0, 1, 1,
-0.568593, 2.139285, -0.7936791, 0, 0, 0, 1, 1,
-0.5656502, 1.216005, -1.050753, 0, 0, 0, 1, 1,
-0.5647119, 0.755178, -0.9147954, 0, 0, 0, 1, 1,
-0.5640055, -1.771332, -3.163269, 0, 0, 0, 1, 1,
-0.5559252, 0.5581139, -1.395215, 0, 0, 0, 1, 1,
-0.5556942, -0.6608038, -2.307789, 0, 0, 0, 1, 1,
-0.5538969, 0.004089145, -2.528764, 0, 0, 0, 1, 1,
-0.5504838, 0.1016037, -1.029298, 1, 1, 1, 1, 1,
-0.5497119, 0.5360932, -0.9148961, 1, 1, 1, 1, 1,
-0.5475227, -0.06046206, -0.8097242, 1, 1, 1, 1, 1,
-0.5449365, -1.626957, -2.726777, 1, 1, 1, 1, 1,
-0.5419494, -2.299505, -2.834242, 1, 1, 1, 1, 1,
-0.5413657, -0.3604293, -1.456882, 1, 1, 1, 1, 1,
-0.5401953, -1.120949, -1.734039, 1, 1, 1, 1, 1,
-0.538302, -0.6482754, -3.160841, 1, 1, 1, 1, 1,
-0.5375407, -0.4463888, -1.480219, 1, 1, 1, 1, 1,
-0.5365505, -0.3479263, -2.706339, 1, 1, 1, 1, 1,
-0.5333503, -0.2980607, -2.505274, 1, 1, 1, 1, 1,
-0.5308734, 1.315119, -1.078772, 1, 1, 1, 1, 1,
-0.5295073, 0.1412458, -1.967638, 1, 1, 1, 1, 1,
-0.5255884, -1.015285, -3.16575, 1, 1, 1, 1, 1,
-0.5242801, 0.4251533, 0.2645627, 1, 1, 1, 1, 1,
-0.5228727, -0.5982124, -3.935663, 0, 0, 1, 1, 1,
-0.5191563, 0.4455858, -1.521051, 1, 0, 0, 1, 1,
-0.5120776, 2.054248, -1.520757, 1, 0, 0, 1, 1,
-0.5051649, 0.07449772, -1.637767, 1, 0, 0, 1, 1,
-0.4979919, 0.2738306, 0.4336896, 1, 0, 0, 1, 1,
-0.4890534, -0.5885264, -3.025177, 1, 0, 0, 1, 1,
-0.4837424, 1.353122, -0.0724805, 0, 0, 0, 1, 1,
-0.4795487, -0.4391415, -1.900222, 0, 0, 0, 1, 1,
-0.4789385, -0.1761389, -3.21183, 0, 0, 0, 1, 1,
-0.4752176, 0.02601612, -0.6702409, 0, 0, 0, 1, 1,
-0.4719789, 0.7178493, -0.6132447, 0, 0, 0, 1, 1,
-0.4683692, 1.068738, -1.709541, 0, 0, 0, 1, 1,
-0.4675952, -3.140391, -2.150182, 0, 0, 0, 1, 1,
-0.4660336, 1.192019, -2.82385, 1, 1, 1, 1, 1,
-0.460593, 0.07362231, -1.215189, 1, 1, 1, 1, 1,
-0.4591675, 0.5349166, -2.47591, 1, 1, 1, 1, 1,
-0.4541132, 0.759331, 0.5034592, 1, 1, 1, 1, 1,
-0.4514717, -1.576127, -1.850871, 1, 1, 1, 1, 1,
-0.4507113, -1.60829, -1.443405, 1, 1, 1, 1, 1,
-0.4504926, -0.0542979, -2.296967, 1, 1, 1, 1, 1,
-0.4480061, -0.3370127, -3.558285, 1, 1, 1, 1, 1,
-0.446095, 0.6661527, -0.2600489, 1, 1, 1, 1, 1,
-0.4436837, -0.2903118, -2.422613, 1, 1, 1, 1, 1,
-0.4405107, 0.3738264, -0.8565739, 1, 1, 1, 1, 1,
-0.4366015, -0.7133468, -1.941456, 1, 1, 1, 1, 1,
-0.4191484, 1.254023, -0.4307207, 1, 1, 1, 1, 1,
-0.4182365, -0.8196636, -3.093822, 1, 1, 1, 1, 1,
-0.4165087, 1.610669, 0.413999, 1, 1, 1, 1, 1,
-0.4142534, -1.316981, -2.742359, 0, 0, 1, 1, 1,
-0.4135159, 0.7257358, 0.9795582, 1, 0, 0, 1, 1,
-0.410938, -0.1854835, -2.767725, 1, 0, 0, 1, 1,
-0.4079594, 0.450342, -2.444031, 1, 0, 0, 1, 1,
-0.4077089, -2.060158, -3.149741, 1, 0, 0, 1, 1,
-0.4067497, -0.9119203, -2.382431, 1, 0, 0, 1, 1,
-0.4034997, 0.6186972, -2.556801, 0, 0, 0, 1, 1,
-0.3988791, 0.4071758, -1.02083, 0, 0, 0, 1, 1,
-0.394985, 0.3682048, -1.533163, 0, 0, 0, 1, 1,
-0.3939216, -0.6920422, -3.275708, 0, 0, 0, 1, 1,
-0.3811348, -0.665118, -3.929206, 0, 0, 0, 1, 1,
-0.3808925, -0.3504469, -1.889217, 0, 0, 0, 1, 1,
-0.380472, -0.2913876, -0.5982104, 0, 0, 0, 1, 1,
-0.3795755, -0.2468638, -2.48736, 1, 1, 1, 1, 1,
-0.3764481, 2.174767, -0.4256036, 1, 1, 1, 1, 1,
-0.3761441, -1.561732, -2.503412, 1, 1, 1, 1, 1,
-0.3717681, -0.7373832, -3.457551, 1, 1, 1, 1, 1,
-0.3637522, 0.2125875, -0.2059636, 1, 1, 1, 1, 1,
-0.3586834, 1.405079, -1.405977, 1, 1, 1, 1, 1,
-0.3570305, 0.3268562, -2.823808, 1, 1, 1, 1, 1,
-0.3540455, -0.2711724, -0.7908771, 1, 1, 1, 1, 1,
-0.3536942, -0.8701221, -3.9663, 1, 1, 1, 1, 1,
-0.3525695, 0.7441309, -0.4517705, 1, 1, 1, 1, 1,
-0.3513055, -0.07316898, -0.8688768, 1, 1, 1, 1, 1,
-0.3499615, 0.7965503, -0.1353159, 1, 1, 1, 1, 1,
-0.3472907, -0.2795634, -1.71346, 1, 1, 1, 1, 1,
-0.3458361, -1.430743, -4.987688, 1, 1, 1, 1, 1,
-0.3443405, 1.22219, 1.005101, 1, 1, 1, 1, 1,
-0.3433575, -0.1244043, -1.684453, 0, 0, 1, 1, 1,
-0.3419956, -0.7196195, -2.902151, 1, 0, 0, 1, 1,
-0.3381702, 1.265085, -0.1451154, 1, 0, 0, 1, 1,
-0.3371367, 0.04313755, -1.176221, 1, 0, 0, 1, 1,
-0.3263166, -0.661257, -2.719082, 1, 0, 0, 1, 1,
-0.3238344, -0.2849828, -1.776477, 1, 0, 0, 1, 1,
-0.3216926, 0.3734947, -2.770926, 0, 0, 0, 1, 1,
-0.3179132, -0.286984, -1.017859, 0, 0, 0, 1, 1,
-0.3170162, -0.6694487, -2.064044, 0, 0, 0, 1, 1,
-0.3122283, -0.2016042, -3.342151, 0, 0, 0, 1, 1,
-0.3104895, -2.462672, -2.67734, 0, 0, 0, 1, 1,
-0.3078666, -0.4176031, -2.887707, 0, 0, 0, 1, 1,
-0.3075836, -2.059809, -2.873478, 0, 0, 0, 1, 1,
-0.3074583, -0.1855804, -2.380517, 1, 1, 1, 1, 1,
-0.3042928, 1.823242, 0.7453752, 1, 1, 1, 1, 1,
-0.2999062, 1.79199, -0.8553425, 1, 1, 1, 1, 1,
-0.296689, -1.043878, -2.960758, 1, 1, 1, 1, 1,
-0.2961365, -0.1742763, -1.757723, 1, 1, 1, 1, 1,
-0.2938742, 1.102467, 0.09978037, 1, 1, 1, 1, 1,
-0.2925302, -1.320039, -1.741758, 1, 1, 1, 1, 1,
-0.2924193, -1.016876, -3.968468, 1, 1, 1, 1, 1,
-0.2914212, 1.080587, 0.9955223, 1, 1, 1, 1, 1,
-0.2894985, 0.8854368, -0.09897412, 1, 1, 1, 1, 1,
-0.2891491, 0.1750968, -0.8406475, 1, 1, 1, 1, 1,
-0.2886873, -0.3870657, -1.912414, 1, 1, 1, 1, 1,
-0.2882735, 1.381656, 0.8987175, 1, 1, 1, 1, 1,
-0.2876876, -0.3651127, -2.421919, 1, 1, 1, 1, 1,
-0.2826022, -0.6612551, -3.196141, 1, 1, 1, 1, 1,
-0.2802894, 1.168963, -2.99309, 0, 0, 1, 1, 1,
-0.275615, -0.3149586, -1.163326, 1, 0, 0, 1, 1,
-0.2748452, 0.5111359, 0.6680262, 1, 0, 0, 1, 1,
-0.2726305, 1.634876, -2.149975, 1, 0, 0, 1, 1,
-0.2698243, -0.9099503, -2.671743, 1, 0, 0, 1, 1,
-0.2670369, -1.054278, -3.506951, 1, 0, 0, 1, 1,
-0.2662295, -1.016845, -1.988539, 0, 0, 0, 1, 1,
-0.2638319, -1.164419, -2.63212, 0, 0, 0, 1, 1,
-0.2609535, -0.6368378, -2.513789, 0, 0, 0, 1, 1,
-0.2601141, 0.1957407, -0.3789311, 0, 0, 0, 1, 1,
-0.2594799, -0.5429853, -2.545666, 0, 0, 0, 1, 1,
-0.2553614, -0.0832167, -2.154366, 0, 0, 0, 1, 1,
-0.2547255, 2.373372, -0.6020994, 0, 0, 0, 1, 1,
-0.248792, 0.04336618, -1.258837, 1, 1, 1, 1, 1,
-0.2487157, -1.784368, -3.364164, 1, 1, 1, 1, 1,
-0.2484102, -0.7461221, -2.850859, 1, 1, 1, 1, 1,
-0.2437568, 0.9634905, -1.363258, 1, 1, 1, 1, 1,
-0.2410486, -1.160525, -4.811486, 1, 1, 1, 1, 1,
-0.2407613, 0.2373559, -1.162284, 1, 1, 1, 1, 1,
-0.2406583, -1.898037, -2.969986, 1, 1, 1, 1, 1,
-0.235326, -1.514454, -3.390908, 1, 1, 1, 1, 1,
-0.2352129, 0.05645939, 1.056884, 1, 1, 1, 1, 1,
-0.2345906, 0.553389, 0.4018027, 1, 1, 1, 1, 1,
-0.2342614, 1.047144, 0.03024433, 1, 1, 1, 1, 1,
-0.2304564, -1.134967, -4.866212, 1, 1, 1, 1, 1,
-0.2300647, -0.3091338, -1.636017, 1, 1, 1, 1, 1,
-0.2298754, 1.024328, 0.0396419, 1, 1, 1, 1, 1,
-0.2289316, 1.971791, 0.8225297, 1, 1, 1, 1, 1,
-0.2224087, -0.2185915, -1.654824, 0, 0, 1, 1, 1,
-0.2213453, -1.00309, -2.36671, 1, 0, 0, 1, 1,
-0.2210594, 1.259248, -0.2403162, 1, 0, 0, 1, 1,
-0.2188199, -2.299543, -2.201704, 1, 0, 0, 1, 1,
-0.2182844, 0.4549242, 0.8982451, 1, 0, 0, 1, 1,
-0.2170089, -0.06780229, -1.894943, 1, 0, 0, 1, 1,
-0.2159255, -1.15009, -1.7045, 0, 0, 0, 1, 1,
-0.2141692, 0.5249339, -3.401531, 0, 0, 0, 1, 1,
-0.212857, 1.207453, 0.7595529, 0, 0, 0, 1, 1,
-0.2110452, 1.138351, 1.78793, 0, 0, 0, 1, 1,
-0.2035477, -0.3086038, -2.875928, 0, 0, 0, 1, 1,
-0.2032676, 1.110016, -1.437747, 0, 0, 0, 1, 1,
-0.2031807, -0.3676071, -0.3380209, 0, 0, 0, 1, 1,
-0.2001783, 2.09634, -0.3856532, 1, 1, 1, 1, 1,
-0.1974803, 2.21163, 0.6907442, 1, 1, 1, 1, 1,
-0.1932502, 1.653185, -0.3776779, 1, 1, 1, 1, 1,
-0.1921574, 0.455602, -0.6046184, 1, 1, 1, 1, 1,
-0.1802906, 1.207639, -0.2054562, 1, 1, 1, 1, 1,
-0.179263, -0.539003, -2.558354, 1, 1, 1, 1, 1,
-0.1766862, 1.778598, 1.88226, 1, 1, 1, 1, 1,
-0.1750804, -0.967522, -3.099147, 1, 1, 1, 1, 1,
-0.1749754, 0.5165649, 1.442453, 1, 1, 1, 1, 1,
-0.1737741, -0.1609264, -4.146835, 1, 1, 1, 1, 1,
-0.1657851, -0.1147427, -0.8080441, 1, 1, 1, 1, 1,
-0.1522435, -0.8701993, -1.478531, 1, 1, 1, 1, 1,
-0.1495919, -0.06897167, -2.71453, 1, 1, 1, 1, 1,
-0.1486325, 0.309172, -2.221464, 1, 1, 1, 1, 1,
-0.147266, -0.2973337, -3.000753, 1, 1, 1, 1, 1,
-0.1439669, 0.6447809, 0.8825791, 0, 0, 1, 1, 1,
-0.1416299, 0.8366595, -0.8938805, 1, 0, 0, 1, 1,
-0.13818, 1.624797, -0.2331583, 1, 0, 0, 1, 1,
-0.1355104, 0.6158912, -0.7136151, 1, 0, 0, 1, 1,
-0.1289983, -0.9477775, -4.100534, 1, 0, 0, 1, 1,
-0.1248938, 0.5129433, -1.103033, 1, 0, 0, 1, 1,
-0.1178023, -0.3667421, -1.603696, 0, 0, 0, 1, 1,
-0.1174618, -0.6290761, -4.457064, 0, 0, 0, 1, 1,
-0.1154551, -1.109225, -1.781732, 0, 0, 0, 1, 1,
-0.1143489, 0.7377419, -0.4992439, 0, 0, 0, 1, 1,
-0.1069788, -0.4400553, -3.822097, 0, 0, 0, 1, 1,
-0.1007229, -0.7973922, -2.343363, 0, 0, 0, 1, 1,
-0.0975348, 0.9618359, 0.9677286, 0, 0, 0, 1, 1,
-0.094496, -0.6371289, -2.476462, 1, 1, 1, 1, 1,
-0.093946, -1.023183, -2.461974, 1, 1, 1, 1, 1,
-0.09301467, -0.134266, -2.665963, 1, 1, 1, 1, 1,
-0.08989043, 0.6596258, -1.997281, 1, 1, 1, 1, 1,
-0.0870515, 0.1223078, -1.711134, 1, 1, 1, 1, 1,
-0.08576841, -0.2071831, -3.96008, 1, 1, 1, 1, 1,
-0.07990398, 0.5618491, -1.870713, 1, 1, 1, 1, 1,
-0.07986237, 0.899759, 0.8216273, 1, 1, 1, 1, 1,
-0.0793631, 0.2921281, -1.539289, 1, 1, 1, 1, 1,
-0.0765923, -1.632839, -2.876488, 1, 1, 1, 1, 1,
-0.0735609, 0.9112607, -0.2985407, 1, 1, 1, 1, 1,
-0.06389031, 1.124867, 0.8921304, 1, 1, 1, 1, 1,
-0.06370506, -0.1737085, -2.199545, 1, 1, 1, 1, 1,
-0.06260341, 1.224999, 0.5934379, 1, 1, 1, 1, 1,
-0.05920985, -0.1910282, -2.206076, 1, 1, 1, 1, 1,
-0.05762601, 0.1398869, -0.7247485, 0, 0, 1, 1, 1,
-0.05356094, 0.3536857, -2.080539, 1, 0, 0, 1, 1,
-0.05245294, -0.8757564, -3.986008, 1, 0, 0, 1, 1,
-0.05207983, -0.8544505, -0.9661436, 1, 0, 0, 1, 1,
-0.05179333, 0.1588974, -2.462048, 1, 0, 0, 1, 1,
-0.05091268, 0.2917072, -0.6751619, 1, 0, 0, 1, 1,
-0.04901486, -1.414471, -1.479861, 0, 0, 0, 1, 1,
-0.04730732, -0.8682086, -2.105448, 0, 0, 0, 1, 1,
-0.04204061, 0.2788772, -1.146401, 0, 0, 0, 1, 1,
-0.04189001, 0.274196, 0.4033011, 0, 0, 0, 1, 1,
-0.03406861, -0.3101189, -2.046867, 0, 0, 0, 1, 1,
-0.02858265, -1.001825, -2.608204, 0, 0, 0, 1, 1,
-0.02673414, -0.9990678, -2.919549, 0, 0, 0, 1, 1,
-0.02356688, -0.573965, -3.184459, 1, 1, 1, 1, 1,
-0.02044918, 0.8333399, 1.354623, 1, 1, 1, 1, 1,
-0.01908368, 0.1315494, 0.1465451, 1, 1, 1, 1, 1,
-0.01852087, 1.075571, -1.450832, 1, 1, 1, 1, 1,
-0.01617575, -1.471601, -2.066228, 1, 1, 1, 1, 1,
-0.01487934, -1.081704, -3.443419, 1, 1, 1, 1, 1,
-0.006713311, 0.1383492, -0.5596609, 1, 1, 1, 1, 1,
-0.006132375, 0.3820068, -1.217949, 1, 1, 1, 1, 1,
-0.005925183, 0.4350763, -0.4864532, 1, 1, 1, 1, 1,
-0.00302546, 0.7212421, -1.386051, 1, 1, 1, 1, 1,
-0.002884355, 1.370412, 0.8988716, 1, 1, 1, 1, 1,
-0.001971426, 0.3345515, -2.032194, 1, 1, 1, 1, 1,
-0.0009857236, -0.1822628, -5.557404, 1, 1, 1, 1, 1,
0.005194955, -0.5333595, 2.615444, 1, 1, 1, 1, 1,
0.01268485, -1.287595, 2.587708, 1, 1, 1, 1, 1,
0.01457415, 0.4975189, 1.085207, 0, 0, 1, 1, 1,
0.01599181, -0.1777103, 1.638379, 1, 0, 0, 1, 1,
0.01702247, 0.08009587, 2.214084, 1, 0, 0, 1, 1,
0.0183929, -1.668463, 3.601018, 1, 0, 0, 1, 1,
0.01907198, 0.445962, 0.5803089, 1, 0, 0, 1, 1,
0.02060147, -0.7179795, 3.889483, 1, 0, 0, 1, 1,
0.02155809, -0.9274608, 1.120857, 0, 0, 0, 1, 1,
0.02226699, 0.3344283, 0.2910499, 0, 0, 0, 1, 1,
0.0223275, 2.299842, 0.5483012, 0, 0, 0, 1, 1,
0.02323473, -0.01136282, 0.6656848, 0, 0, 0, 1, 1,
0.02501733, 0.1058889, -0.3353721, 0, 0, 0, 1, 1,
0.0271728, 0.1253333, -1.321309, 0, 0, 0, 1, 1,
0.02774134, 1.421283, -0.3528475, 0, 0, 0, 1, 1,
0.04521886, -0.8515235, 3.005873, 1, 1, 1, 1, 1,
0.04896883, -0.3630592, 3.253288, 1, 1, 1, 1, 1,
0.05006618, 0.02033401, 1.979362, 1, 1, 1, 1, 1,
0.05051535, -0.1364776, 2.129607, 1, 1, 1, 1, 1,
0.05515106, -0.2845747, 2.327788, 1, 1, 1, 1, 1,
0.05529844, -1.094086, 3.284047, 1, 1, 1, 1, 1,
0.05562941, -0.09529144, 2.283522, 1, 1, 1, 1, 1,
0.06099921, -0.2143049, 3.338892, 1, 1, 1, 1, 1,
0.06256054, 0.1747565, 0.2558121, 1, 1, 1, 1, 1,
0.0636699, 1.296051, -1.577449, 1, 1, 1, 1, 1,
0.06535968, -0.6619477, 0.9703315, 1, 1, 1, 1, 1,
0.06728332, -0.2591059, 2.006262, 1, 1, 1, 1, 1,
0.06844951, 0.4262786, -0.7654682, 1, 1, 1, 1, 1,
0.06963778, 0.3160372, 0.456115, 1, 1, 1, 1, 1,
0.07033074, 0.7173024, 0.4349738, 1, 1, 1, 1, 1,
0.07326337, 0.5794013, 0.09904493, 0, 0, 1, 1, 1,
0.07453042, -1.946802, 3.625985, 1, 0, 0, 1, 1,
0.07626644, 1.209525, -0.106251, 1, 0, 0, 1, 1,
0.07858951, -1.290742, 3.328795, 1, 0, 0, 1, 1,
0.08198444, 0.6673391, 1.447252, 1, 0, 0, 1, 1,
0.08218524, -0.4750222, 1.751642, 1, 0, 0, 1, 1,
0.08590855, -1.021283, 2.8736, 0, 0, 0, 1, 1,
0.08829831, 1.148614, -0.2374296, 0, 0, 0, 1, 1,
0.08923087, -0.4671174, 2.759444, 0, 0, 0, 1, 1,
0.0944181, -0.2131588, 2.095711, 0, 0, 0, 1, 1,
0.09811884, 0.9305902, -0.924781, 0, 0, 0, 1, 1,
0.09901595, 0.180528, 0.5418532, 0, 0, 0, 1, 1,
0.1022199, -0.641103, 3.63709, 0, 0, 0, 1, 1,
0.1035911, 0.2968694, -0.7101206, 1, 1, 1, 1, 1,
0.1039702, 0.7508488, 0.48212, 1, 1, 1, 1, 1,
0.1066568, -0.424418, 2.907948, 1, 1, 1, 1, 1,
0.1105686, -1.097482, 2.178787, 1, 1, 1, 1, 1,
0.1145011, 1.396803, 1.070024, 1, 1, 1, 1, 1,
0.1167823, -2.35837, 3.143568, 1, 1, 1, 1, 1,
0.1232778, -0.4704242, 2.525554, 1, 1, 1, 1, 1,
0.1265376, 0.4461871, 0.6696392, 1, 1, 1, 1, 1,
0.1266613, -1.113568, 1.699847, 1, 1, 1, 1, 1,
0.129504, 0.2628698, 1.141831, 1, 1, 1, 1, 1,
0.1295928, 0.08531892, -1.341525, 1, 1, 1, 1, 1,
0.1300915, 1.482373, 1.031781, 1, 1, 1, 1, 1,
0.1305449, -0.5198021, 3.457198, 1, 1, 1, 1, 1,
0.1319581, -0.517653, 3.040774, 1, 1, 1, 1, 1,
0.1333124, -0.1060145, 3.795547, 1, 1, 1, 1, 1,
0.1351471, 1.130829, 0.07961378, 0, 0, 1, 1, 1,
0.1433748, -1.286475, 2.622802, 1, 0, 0, 1, 1,
0.1567222, -0.0582395, 2.059963, 1, 0, 0, 1, 1,
0.1631349, -0.2565893, 3.641289, 1, 0, 0, 1, 1,
0.1636307, 0.5814902, -0.7838401, 1, 0, 0, 1, 1,
0.1684412, -1.077499, 2.956142, 1, 0, 0, 1, 1,
0.1715799, 1.967631, -0.6687642, 0, 0, 0, 1, 1,
0.1736943, -0.2859032, 2.946985, 0, 0, 0, 1, 1,
0.1782133, 0.7740089, -1.258803, 0, 0, 0, 1, 1,
0.1852304, 2.237208, -2.262092, 0, 0, 0, 1, 1,
0.1868939, -0.9690633, 3.835487, 0, 0, 0, 1, 1,
0.1921558, -0.4603646, 1.552645, 0, 0, 0, 1, 1,
0.1932874, -0.984799, 1.709197, 0, 0, 0, 1, 1,
0.1987315, -1.026146, 3.266703, 1, 1, 1, 1, 1,
0.2000838, -1.60542, 3.326639, 1, 1, 1, 1, 1,
0.2011597, -0.01729801, 2.42674, 1, 1, 1, 1, 1,
0.2097525, 1.722724, -0.7487772, 1, 1, 1, 1, 1,
0.2102545, 0.1778546, 1.931573, 1, 1, 1, 1, 1,
0.2142684, 0.8233698, -0.680261, 1, 1, 1, 1, 1,
0.2173253, 0.1835877, -0.3825138, 1, 1, 1, 1, 1,
0.2278571, -0.2191867, 1.87873, 1, 1, 1, 1, 1,
0.22787, 0.7247669, -1.240143, 1, 1, 1, 1, 1,
0.2281257, -0.8046546, 4.503109, 1, 1, 1, 1, 1,
0.2301697, 1.10321, -1.315416, 1, 1, 1, 1, 1,
0.2306666, 0.3595014, 0.424969, 1, 1, 1, 1, 1,
0.2311469, 0.005858056, 1.600787, 1, 1, 1, 1, 1,
0.2315707, 0.08845456, 1.212577, 1, 1, 1, 1, 1,
0.2318612, -0.341514, 3.327053, 1, 1, 1, 1, 1,
0.2334589, -1.098502, 3.312112, 0, 0, 1, 1, 1,
0.2344159, 0.9415354, 0.3868469, 1, 0, 0, 1, 1,
0.236649, -0.9826498, 3.605804, 1, 0, 0, 1, 1,
0.2389175, 0.2015061, 1.33051, 1, 0, 0, 1, 1,
0.2410343, 0.9987599, -0.378199, 1, 0, 0, 1, 1,
0.2417526, 0.9362799, -0.5143725, 1, 0, 0, 1, 1,
0.2440993, -0.1614899, 3.324811, 0, 0, 0, 1, 1,
0.2655553, -0.3261958, 0.8249107, 0, 0, 0, 1, 1,
0.265565, 0.5898252, -1.694331, 0, 0, 0, 1, 1,
0.2686888, 0.04372077, 2.020213, 0, 0, 0, 1, 1,
0.2691374, 0.1759828, -0.5847898, 0, 0, 0, 1, 1,
0.2704364, -0.5136399, 3.01996, 0, 0, 0, 1, 1,
0.2723164, -1.41392, 1.349458, 0, 0, 0, 1, 1,
0.2724905, -2.32328, 4.683047, 1, 1, 1, 1, 1,
0.273189, 0.6284869, 1.917051, 1, 1, 1, 1, 1,
0.2817163, -0.2632442, 2.461573, 1, 1, 1, 1, 1,
0.2847892, -0.5988457, 1.814419, 1, 1, 1, 1, 1,
0.2915148, 0.3030506, 3.253433, 1, 1, 1, 1, 1,
0.2918772, -1.352681, 3.07114, 1, 1, 1, 1, 1,
0.2922826, -1.388851, 3.36493, 1, 1, 1, 1, 1,
0.2926567, 0.07897718, 1.058413, 1, 1, 1, 1, 1,
0.2936668, 0.4189277, -0.4099584, 1, 1, 1, 1, 1,
0.2989247, -0.2637249, 1.883871, 1, 1, 1, 1, 1,
0.3018667, 0.1093418, 0.6416687, 1, 1, 1, 1, 1,
0.3032826, 0.2975043, -0.2085738, 1, 1, 1, 1, 1,
0.3074012, -1.400176, 3.04355, 1, 1, 1, 1, 1,
0.308874, 0.6579037, -0.6174983, 1, 1, 1, 1, 1,
0.3101484, 1.660998, -1.064803, 1, 1, 1, 1, 1,
0.3162253, 0.6570019, 0.02598359, 0, 0, 1, 1, 1,
0.3178244, -0.1241739, 2.633595, 1, 0, 0, 1, 1,
0.3257375, -0.06324022, 1.467069, 1, 0, 0, 1, 1,
0.3291664, 0.1171356, 0.5688962, 1, 0, 0, 1, 1,
0.3314562, -0.5381102, 2.736082, 1, 0, 0, 1, 1,
0.3338577, 0.2888505, -0.1499905, 1, 0, 0, 1, 1,
0.3374625, 1.693342, -1.156439, 0, 0, 0, 1, 1,
0.3442357, 1.498932, 0.4892145, 0, 0, 0, 1, 1,
0.3469776, 0.2575873, 1.768865, 0, 0, 0, 1, 1,
0.347054, 0.946784, 0.9399002, 0, 0, 0, 1, 1,
0.3547544, 0.4004953, 1.782232, 0, 0, 0, 1, 1,
0.3568762, -1.380072, 1.566262, 0, 0, 0, 1, 1,
0.3604408, 0.5793179, -1.291023, 0, 0, 0, 1, 1,
0.3621761, 0.2113069, 1.013687, 1, 1, 1, 1, 1,
0.3648761, -2.8094, 3.61793, 1, 1, 1, 1, 1,
0.3657078, -0.2588168, 3.264084, 1, 1, 1, 1, 1,
0.369803, -1.124283, 3.207419, 1, 1, 1, 1, 1,
0.3700036, 1.664845, -0.1619193, 1, 1, 1, 1, 1,
0.3719316, -0.03191882, 1.741517, 1, 1, 1, 1, 1,
0.3741395, 1.263554, 0.3104106, 1, 1, 1, 1, 1,
0.3748015, 1.237311, -0.8193852, 1, 1, 1, 1, 1,
0.3757412, 1.620434, 0.5302315, 1, 1, 1, 1, 1,
0.3792079, 0.1245061, 2.073033, 1, 1, 1, 1, 1,
0.3849121, 1.444766, 0.2578812, 1, 1, 1, 1, 1,
0.386924, -0.6492696, 1.989574, 1, 1, 1, 1, 1,
0.3942918, 0.4638907, 2.558659, 1, 1, 1, 1, 1,
0.3962805, -0.06484079, 2.354332, 1, 1, 1, 1, 1,
0.3970891, 2.669305, 0.8871376, 1, 1, 1, 1, 1,
0.3977894, -1.265339, 2.309724, 0, 0, 1, 1, 1,
0.4041286, -1.115977, 3.321999, 1, 0, 0, 1, 1,
0.4059951, -0.340475, 3.203079, 1, 0, 0, 1, 1,
0.4061313, 0.570769, 0.05443489, 1, 0, 0, 1, 1,
0.4073488, 0.8010231, -0.1356495, 1, 0, 0, 1, 1,
0.4214628, 0.2369859, 0.8747891, 1, 0, 0, 1, 1,
0.4221811, -1.622562, 3.431897, 0, 0, 0, 1, 1,
0.4244958, 2.092419, -1.908892, 0, 0, 0, 1, 1,
0.4285166, 0.4619272, -0.8964477, 0, 0, 0, 1, 1,
0.4289661, -1.740924, 3.711697, 0, 0, 0, 1, 1,
0.4293287, 0.03133648, 0.5976769, 0, 0, 0, 1, 1,
0.4310406, -0.7914615, 1.355791, 0, 0, 0, 1, 1,
0.4322313, -2.445855, 4.744919, 0, 0, 0, 1, 1,
0.4330897, -0.6332564, 1.333094, 1, 1, 1, 1, 1,
0.433202, 1.330292, 1.688655, 1, 1, 1, 1, 1,
0.4341089, -0.9067562, 3.33286, 1, 1, 1, 1, 1,
0.435492, 0.429525, 0.6083658, 1, 1, 1, 1, 1,
0.440456, 1.396812, -0.285223, 1, 1, 1, 1, 1,
0.4414629, -0.7744341, 0.9543164, 1, 1, 1, 1, 1,
0.4444985, 0.03855046, 1.026016, 1, 1, 1, 1, 1,
0.4483814, -1.047993, 3.516772, 1, 1, 1, 1, 1,
0.4545071, 0.8471407, 0.6400452, 1, 1, 1, 1, 1,
0.4628662, -0.8846824, 2.381953, 1, 1, 1, 1, 1,
0.4724187, -1.498065, 1.790951, 1, 1, 1, 1, 1,
0.4741043, -0.9632921, 2.422524, 1, 1, 1, 1, 1,
0.4820137, 0.07726399, -0.5332028, 1, 1, 1, 1, 1,
0.4877802, -0.008852218, 3.325733, 1, 1, 1, 1, 1,
0.4896836, 0.7741691, -1.111436, 1, 1, 1, 1, 1,
0.4916537, -1.651741, 2.624515, 0, 0, 1, 1, 1,
0.4923345, -2.328304, 3.67032, 1, 0, 0, 1, 1,
0.4937144, 0.4974218, 2.060345, 1, 0, 0, 1, 1,
0.4945871, -1.740372, 3.700644, 1, 0, 0, 1, 1,
0.5046062, -0.8541717, 3.650142, 1, 0, 0, 1, 1,
0.5057444, 2.067656, -0.3437394, 1, 0, 0, 1, 1,
0.5075568, -0.5260677, 2.931342, 0, 0, 0, 1, 1,
0.5083231, 0.1523491, 1.444389, 0, 0, 0, 1, 1,
0.5127689, 0.2273984, 1.249197, 0, 0, 0, 1, 1,
0.513949, -0.7041551, 1.783333, 0, 0, 0, 1, 1,
0.5208643, -0.2983819, 2.497921, 0, 0, 0, 1, 1,
0.525934, 0.4463481, 0.9066013, 0, 0, 0, 1, 1,
0.5288208, -0.4078732, 2.584643, 0, 0, 0, 1, 1,
0.528963, -0.5999811, 3.407205, 1, 1, 1, 1, 1,
0.5299978, -0.456181, 3.068124, 1, 1, 1, 1, 1,
0.5312862, -1.967865, 3.597537, 1, 1, 1, 1, 1,
0.538831, 0.9996611, 1.10349, 1, 1, 1, 1, 1,
0.5430909, -0.6818776, 1.660208, 1, 1, 1, 1, 1,
0.544259, 1.052263, 0.863339, 1, 1, 1, 1, 1,
0.5445467, 0.111818, 0.4109231, 1, 1, 1, 1, 1,
0.5447022, -1.640722, 2.496253, 1, 1, 1, 1, 1,
0.5473366, -0.548283, 2.19451, 1, 1, 1, 1, 1,
0.5529569, 0.5586928, -0.8249315, 1, 1, 1, 1, 1,
0.554192, -0.2140614, 1.372885, 1, 1, 1, 1, 1,
0.5580455, -0.5292674, 1.666831, 1, 1, 1, 1, 1,
0.5716416, -0.06912237, 1.660604, 1, 1, 1, 1, 1,
0.5719045, 1.716606, 0.2632967, 1, 1, 1, 1, 1,
0.5761038, 0.4102924, 3.087292, 1, 1, 1, 1, 1,
0.5780469, 0.4390059, 0.1686374, 0, 0, 1, 1, 1,
0.5792718, -1.431296, 2.903355, 1, 0, 0, 1, 1,
0.5801011, -0.1804861, 2.541162, 1, 0, 0, 1, 1,
0.5852038, 0.6753182, 1.962462, 1, 0, 0, 1, 1,
0.5908551, -0.4845424, 2.709009, 1, 0, 0, 1, 1,
0.5922584, 1.384632, -1.338187, 1, 0, 0, 1, 1,
0.5927896, 1.466555, 0.3583791, 0, 0, 0, 1, 1,
0.5944344, -1.058362, 1.02102, 0, 0, 0, 1, 1,
0.5946652, 1.553024, 0.8831022, 0, 0, 0, 1, 1,
0.6015121, 0.5649301, -0.1862426, 0, 0, 0, 1, 1,
0.6031423, -0.6656188, 1.795602, 0, 0, 0, 1, 1,
0.604316, -1.330614, 1.025126, 0, 0, 0, 1, 1,
0.6074261, 0.4526567, 2.415981, 0, 0, 0, 1, 1,
0.6159486, -0.3794517, 3.548875, 1, 1, 1, 1, 1,
0.6184441, 0.3696603, 1.316294, 1, 1, 1, 1, 1,
0.6192812, 0.5414125, -0.3125749, 1, 1, 1, 1, 1,
0.6208403, 0.8797511, 0.9340575, 1, 1, 1, 1, 1,
0.6220762, 0.918939, 0.08903579, 1, 1, 1, 1, 1,
0.6263918, 0.2355496, 1.863733, 1, 1, 1, 1, 1,
0.6272121, 0.6558758, -2.178849, 1, 1, 1, 1, 1,
0.6281505, -0.867962, 2.340043, 1, 1, 1, 1, 1,
0.6304659, 0.8101873, -0.22884, 1, 1, 1, 1, 1,
0.632701, 1.022748, 1.883041, 1, 1, 1, 1, 1,
0.6337914, 0.1747729, 2.640109, 1, 1, 1, 1, 1,
0.6339332, 0.4231244, -0.1347848, 1, 1, 1, 1, 1,
0.6369968, 1.822716, -0.6510601, 1, 1, 1, 1, 1,
0.6376065, 1.180593, -1.641086, 1, 1, 1, 1, 1,
0.6405176, 1.266907, 0.2601486, 1, 1, 1, 1, 1,
0.6437436, 0.06436053, 0.342553, 0, 0, 1, 1, 1,
0.6476347, -0.845176, 2.156242, 1, 0, 0, 1, 1,
0.6598675, 2.109663, -1.373424, 1, 0, 0, 1, 1,
0.6601266, 0.2045747, 1.545719, 1, 0, 0, 1, 1,
0.6652665, -0.6401452, 1.741941, 1, 0, 0, 1, 1,
0.6664087, 0.9009314, 1.375743, 1, 0, 0, 1, 1,
0.6691652, -1.278899, 0.6141154, 0, 0, 0, 1, 1,
0.6723369, -1.143543, 4.440848, 0, 0, 0, 1, 1,
0.6783209, -1.820508, 4.153544, 0, 0, 0, 1, 1,
0.6802829, -0.3600424, 2.337484, 0, 0, 0, 1, 1,
0.6847069, -1.52131, 2.898277, 0, 0, 0, 1, 1,
0.6883441, -1.027908, 2.939344, 0, 0, 0, 1, 1,
0.688529, -0.3527597, 4.032791, 0, 0, 0, 1, 1,
0.689149, -0.08404404, 3.634953, 1, 1, 1, 1, 1,
0.6901274, 0.04360402, 1.194964, 1, 1, 1, 1, 1,
0.6902919, 0.8898718, 1.519632, 1, 1, 1, 1, 1,
0.6931166, 1.185956, -1.064721, 1, 1, 1, 1, 1,
0.6939938, 1.055865, 1.551875, 1, 1, 1, 1, 1,
0.6957689, -1.534018, 3.208795, 1, 1, 1, 1, 1,
0.6994734, 0.6777162, -0.1172352, 1, 1, 1, 1, 1,
0.7000158, -0.06280942, 1.85139, 1, 1, 1, 1, 1,
0.7030691, 1.07609, 1.110579, 1, 1, 1, 1, 1,
0.7042661, -0.8892713, 0.5088199, 1, 1, 1, 1, 1,
0.7058929, -1.250578, 2.762958, 1, 1, 1, 1, 1,
0.7067741, 0.427283, 0.1802505, 1, 1, 1, 1, 1,
0.7211565, 1.879087, -1.106557, 1, 1, 1, 1, 1,
0.7244843, 2.167689, 0.5995526, 1, 1, 1, 1, 1,
0.7246281, -0.4088497, 0.3578882, 1, 1, 1, 1, 1,
0.7359058, 0.5355564, 0.8916829, 0, 0, 1, 1, 1,
0.7375377, -0.01660247, 1.569689, 1, 0, 0, 1, 1,
0.741921, 0.7917417, 1.09633, 1, 0, 0, 1, 1,
0.7493752, -1.063501, 3.496532, 1, 0, 0, 1, 1,
0.7523844, 0.2590734, 1.029766, 1, 0, 0, 1, 1,
0.7536711, 0.06759305, 1.963882, 1, 0, 0, 1, 1,
0.7587313, 0.5675875, 0.3999256, 0, 0, 0, 1, 1,
0.7607321, 0.4718172, 0.1354649, 0, 0, 0, 1, 1,
0.7655848, 1.252721, 2.312204, 0, 0, 0, 1, 1,
0.7729763, -0.7333831, 2.380239, 0, 0, 0, 1, 1,
0.7743568, -0.3724925, 3.308484, 0, 0, 0, 1, 1,
0.776967, -0.8784955, 1.640961, 0, 0, 0, 1, 1,
0.7787071, 0.4126341, 2.612797, 0, 0, 0, 1, 1,
0.7814605, 0.7933682, 2.076972, 1, 1, 1, 1, 1,
0.7836754, 1.157522, 3.086939, 1, 1, 1, 1, 1,
0.7840848, 0.9289656, -0.7312337, 1, 1, 1, 1, 1,
0.7882105, -0.4916591, 2.348703, 1, 1, 1, 1, 1,
0.7940016, 0.1971291, 3.700715, 1, 1, 1, 1, 1,
0.7942022, -0.209619, 0.7789763, 1, 1, 1, 1, 1,
0.7984051, 0.6797173, 1.202487, 1, 1, 1, 1, 1,
0.7994824, 0.5802003, 3.128638, 1, 1, 1, 1, 1,
0.8021411, -1.239378, 1.42508, 1, 1, 1, 1, 1,
0.8033812, 0.6031963, 1.540492, 1, 1, 1, 1, 1,
0.8045722, -0.8626265, 3.211825, 1, 1, 1, 1, 1,
0.8059221, 0.9296144, 0.5221924, 1, 1, 1, 1, 1,
0.8059595, -0.6589324, 3.516963, 1, 1, 1, 1, 1,
0.8065227, 0.8980637, -0.9801325, 1, 1, 1, 1, 1,
0.8067729, -0.1139987, 2.809937, 1, 1, 1, 1, 1,
0.8112909, -1.541488, 5.07631, 0, 0, 1, 1, 1,
0.8139529, 1.059514, 1.041647, 1, 0, 0, 1, 1,
0.8179513, 1.418465, 1.390624, 1, 0, 0, 1, 1,
0.8192917, -1.367214, 2.51698, 1, 0, 0, 1, 1,
0.8249464, 0.9541466, 0.7142831, 1, 0, 0, 1, 1,
0.8315812, -1.055267, 3.315022, 1, 0, 0, 1, 1,
0.8317115, 1.125507, -0.1439598, 0, 0, 0, 1, 1,
0.8319485, 0.8647118, 0.08762033, 0, 0, 0, 1, 1,
0.8325294, -0.2552177, 1.38074, 0, 0, 0, 1, 1,
0.834141, 0.06269115, 1.914438, 0, 0, 0, 1, 1,
0.8350134, 0.5491589, -0.1502782, 0, 0, 0, 1, 1,
0.8367027, 0.4104685, 2.069047, 0, 0, 0, 1, 1,
0.8395645, -0.4375403, 1.331674, 0, 0, 0, 1, 1,
0.8400215, -0.06841131, 1.848169, 1, 1, 1, 1, 1,
0.8424601, 0.3371295, 1.50467, 1, 1, 1, 1, 1,
0.845323, -0.5264786, 1.746097, 1, 1, 1, 1, 1,
0.8480138, -0.05696485, 1.71325, 1, 1, 1, 1, 1,
0.8535701, 0.2748005, 1.909277, 1, 1, 1, 1, 1,
0.8539773, -0.07025604, 1.5867, 1, 1, 1, 1, 1,
0.8561953, -2.026739, 3.908166, 1, 1, 1, 1, 1,
0.8583751, 0.8958901, 1.677329, 1, 1, 1, 1, 1,
0.8607777, -0.4030314, 2.482796, 1, 1, 1, 1, 1,
0.8616146, -0.4355161, 0.4478962, 1, 1, 1, 1, 1,
0.8648108, -0.3174005, 2.735253, 1, 1, 1, 1, 1,
0.8662803, -0.7400454, 3.448937, 1, 1, 1, 1, 1,
0.8668653, -0.01730673, 2.496248, 1, 1, 1, 1, 1,
0.8681908, -0.5372835, 2.783518, 1, 1, 1, 1, 1,
0.8805926, 0.7172648, 2.447707, 1, 1, 1, 1, 1,
0.883454, 0.9526905, 1.530313, 0, 0, 1, 1, 1,
0.8922295, 0.1447024, 1.837185, 1, 0, 0, 1, 1,
0.897355, 0.05041989, 1.37079, 1, 0, 0, 1, 1,
0.8975574, 1.227312, -1.010861, 1, 0, 0, 1, 1,
0.8993525, 0.9911943, -0.9116315, 1, 0, 0, 1, 1,
0.9039446, 1.562176, 1.022094, 1, 0, 0, 1, 1,
0.9077581, -0.6697678, 2.325471, 0, 0, 0, 1, 1,
0.9084609, 0.7795936, 1.113997, 0, 0, 0, 1, 1,
0.9158024, -0.3960964, 1.277706, 0, 0, 0, 1, 1,
0.9162962, 1.127353, 0.7396154, 0, 0, 0, 1, 1,
0.9180462, -1.462362, 3.348183, 0, 0, 0, 1, 1,
0.9204597, -1.479963, 3.115148, 0, 0, 0, 1, 1,
0.9225902, -1.03688, 2.73384, 0, 0, 0, 1, 1,
0.9246904, 1.167208, -1.185338, 1, 1, 1, 1, 1,
0.9252628, 0.8243263, 0.1508559, 1, 1, 1, 1, 1,
0.9274569, -0.4865986, 2.800197, 1, 1, 1, 1, 1,
0.9277833, -0.8307338, 2.098046, 1, 1, 1, 1, 1,
0.930221, 0.2364918, 0.7581574, 1, 1, 1, 1, 1,
0.931077, 0.8289409, -0.0001784772, 1, 1, 1, 1, 1,
0.9340832, 0.09132241, 1.363147, 1, 1, 1, 1, 1,
0.9413684, 0.1991729, 1.051303, 1, 1, 1, 1, 1,
0.9448094, -1.983931, 1.621378, 1, 1, 1, 1, 1,
0.9468118, 0.215484, -0.2719029, 1, 1, 1, 1, 1,
0.9521676, 0.106032, 2.129773, 1, 1, 1, 1, 1,
0.9532498, 0.6065831, -0.516711, 1, 1, 1, 1, 1,
0.957365, -0.532065, 4.49894, 1, 1, 1, 1, 1,
0.9592512, 2.309606, 1.122966, 1, 1, 1, 1, 1,
0.9672838, 1.793198, 0.01178371, 1, 1, 1, 1, 1,
0.9678373, -0.6139128, 2.066723, 0, 0, 1, 1, 1,
0.9699289, 0.2237986, 2.698203, 1, 0, 0, 1, 1,
0.9735336, 0.9681515, 1.333706, 1, 0, 0, 1, 1,
0.97907, -0.965179, 1.869728, 1, 0, 0, 1, 1,
0.9812403, 0.6910056, -0.1291564, 1, 0, 0, 1, 1,
0.9846262, 1.549746, -0.8524888, 1, 0, 0, 1, 1,
0.9990445, -0.4528889, -0.5561465, 0, 0, 0, 1, 1,
1.000006, 0.9038193, 0.4176392, 0, 0, 0, 1, 1,
1.000132, -0.9880822, 1.893946, 0, 0, 0, 1, 1,
1.014268, -0.4427256, 2.351207, 0, 0, 0, 1, 1,
1.018874, 1.820071, 0.1507258, 0, 0, 0, 1, 1,
1.027308, -0.5645534, 2.303298, 0, 0, 0, 1, 1,
1.027817, -0.7538555, 2.57311, 0, 0, 0, 1, 1,
1.033266, -0.783281, 1.077676, 1, 1, 1, 1, 1,
1.03515, -0.6492757, 0.2628978, 1, 1, 1, 1, 1,
1.038407, -0.4892895, 1.644455, 1, 1, 1, 1, 1,
1.050088, -0.5533296, 1.120153, 1, 1, 1, 1, 1,
1.052339, -2.296144, 3.44719, 1, 1, 1, 1, 1,
1.054735, -1.278459, 4.686539, 1, 1, 1, 1, 1,
1.064175, -0.3938033, 0.915509, 1, 1, 1, 1, 1,
1.065275, -1.288391, 1.300168, 1, 1, 1, 1, 1,
1.069154, 0.4824225, 2.064009, 1, 1, 1, 1, 1,
1.069454, -0.3484708, 0.1341348, 1, 1, 1, 1, 1,
1.081693, -1.619174, 2.431949, 1, 1, 1, 1, 1,
1.085338, 0.9552972, 1.99457, 1, 1, 1, 1, 1,
1.089196, -1.375809, 3.027288, 1, 1, 1, 1, 1,
1.093163, -0.9329485, 2.218014, 1, 1, 1, 1, 1,
1.093723, -1.021706, 2.912848, 1, 1, 1, 1, 1,
1.094831, 0.7758582, 2.23797, 0, 0, 1, 1, 1,
1.09696, -0.03170343, 2.253343, 1, 0, 0, 1, 1,
1.1055, 1.084533, 1.51962, 1, 0, 0, 1, 1,
1.109732, -0.1321299, 2.402188, 1, 0, 0, 1, 1,
1.118588, 1.531668, 0.5117885, 1, 0, 0, 1, 1,
1.119846, 2.08497, 1.227729, 1, 0, 0, 1, 1,
1.122228, 0.04037987, 2.227321, 0, 0, 0, 1, 1,
1.124447, -0.4633719, 2.610094, 0, 0, 0, 1, 1,
1.127003, 0.7800536, 2.438794, 0, 0, 0, 1, 1,
1.133392, 2.653858, 0.4225727, 0, 0, 0, 1, 1,
1.135098, -0.2334257, 2.258065, 0, 0, 0, 1, 1,
1.138862, 0.2801407, 2.433256, 0, 0, 0, 1, 1,
1.143246, 0.1264297, 2.261747, 0, 0, 0, 1, 1,
1.146285, 0.1012862, 1.513829, 1, 1, 1, 1, 1,
1.146527, -0.1237216, 3.652448, 1, 1, 1, 1, 1,
1.149587, 0.08171573, 2.629566, 1, 1, 1, 1, 1,
1.155048, -0.5628624, 1.151779, 1, 1, 1, 1, 1,
1.155762, 0.4473674, 1.611372, 1, 1, 1, 1, 1,
1.157687, -0.2021228, 0.9330903, 1, 1, 1, 1, 1,
1.163694, 1.781643, 1.349488, 1, 1, 1, 1, 1,
1.163885, 1.09199, 2.051144, 1, 1, 1, 1, 1,
1.165221, -0.007194626, 0.8442773, 1, 1, 1, 1, 1,
1.170644, 1.046644, 0.7988492, 1, 1, 1, 1, 1,
1.181156, 0.5028503, -0.009233013, 1, 1, 1, 1, 1,
1.182242, -0.2457946, 4.32978, 1, 1, 1, 1, 1,
1.186897, -1.084821, 2.156589, 1, 1, 1, 1, 1,
1.200592, -0.3905181, 2.606392, 1, 1, 1, 1, 1,
1.211478, -1.440379, 3.358266, 1, 1, 1, 1, 1,
1.215325, 1.825883, -0.6113203, 0, 0, 1, 1, 1,
1.224124, 0.3040339, 1.804313, 1, 0, 0, 1, 1,
1.228316, -1.415344, 2.13658, 1, 0, 0, 1, 1,
1.22866, 0.2201304, 0.8047356, 1, 0, 0, 1, 1,
1.272323, -0.0970166, 2.511435, 1, 0, 0, 1, 1,
1.277164, -0.2182238, 1.889032, 1, 0, 0, 1, 1,
1.280778, 1.08618, 0.5836015, 0, 0, 0, 1, 1,
1.284198, 0.5034546, 0.3422373, 0, 0, 0, 1, 1,
1.29014, 1.03744, 2.359046, 0, 0, 0, 1, 1,
1.291988, -0.227384, 0.8108367, 0, 0, 0, 1, 1,
1.299395, -0.1927446, 1.884434, 0, 0, 0, 1, 1,
1.321866, 0.1681344, 2.761228, 0, 0, 0, 1, 1,
1.330581, -1.205261, 1.006834, 0, 0, 0, 1, 1,
1.352464, -0.9411296, 2.186194, 1, 1, 1, 1, 1,
1.356471, -1.337179, 3.247159, 1, 1, 1, 1, 1,
1.371019, 1.0525, -0.3902714, 1, 1, 1, 1, 1,
1.374706, -0.2789972, 1.648605, 1, 1, 1, 1, 1,
1.375347, 1.017708, 0.7882871, 1, 1, 1, 1, 1,
1.37931, 1.246544, 1.062776, 1, 1, 1, 1, 1,
1.384674, -0.3126518, 1.364997, 1, 1, 1, 1, 1,
1.386952, 0.2281654, 0.5528205, 1, 1, 1, 1, 1,
1.386966, -1.491336, 3.606925, 1, 1, 1, 1, 1,
1.417828, 0.05661521, 1.968715, 1, 1, 1, 1, 1,
1.421101, 3.402147, -0.2940337, 1, 1, 1, 1, 1,
1.429345, -0.3920691, 1.785785, 1, 1, 1, 1, 1,
1.43216, 2.008631, -0.3177586, 1, 1, 1, 1, 1,
1.438121, 0.2188873, 2.572961, 1, 1, 1, 1, 1,
1.447937, 2.933311, -2.182608, 1, 1, 1, 1, 1,
1.461846, -1.417468, 2.195532, 0, 0, 1, 1, 1,
1.46857, -0.5839735, 2.301565, 1, 0, 0, 1, 1,
1.469944, 0.7842141, 0.5879757, 1, 0, 0, 1, 1,
1.475855, -0.02748768, 1.198047, 1, 0, 0, 1, 1,
1.49088, 1.465058, 0.9296545, 1, 0, 0, 1, 1,
1.507267, 0.855876, 2.411882, 1, 0, 0, 1, 1,
1.521412, -0.8987001, 1.510078, 0, 0, 0, 1, 1,
1.522862, 0.9279852, -0.6332807, 0, 0, 0, 1, 1,
1.524204, -0.06608094, 1.536195, 0, 0, 0, 1, 1,
1.524304, -0.6304241, 1.38649, 0, 0, 0, 1, 1,
1.547605, -0.1868734, 3.104394, 0, 0, 0, 1, 1,
1.553699, 0.1945748, 2.124092, 0, 0, 0, 1, 1,
1.564403, 0.5338417, -0.07464508, 0, 0, 0, 1, 1,
1.564511, -0.1637103, 0.4364224, 1, 1, 1, 1, 1,
1.568201, -0.5897846, 2.538517, 1, 1, 1, 1, 1,
1.588566, 0.5744841, 0.2241321, 1, 1, 1, 1, 1,
1.607412, 1.178378, -0.4387203, 1, 1, 1, 1, 1,
1.608388, -0.9154311, 2.101761, 1, 1, 1, 1, 1,
1.612196, 0.04490475, 2.248666, 1, 1, 1, 1, 1,
1.613135, 1.085274, 0.6486394, 1, 1, 1, 1, 1,
1.637918, 0.6959208, 0.2156564, 1, 1, 1, 1, 1,
1.65745, 1.277784, 1.248645, 1, 1, 1, 1, 1,
1.66459, -0.09853055, 2.10615, 1, 1, 1, 1, 1,
1.668061, -0.7485538, 2.993156, 1, 1, 1, 1, 1,
1.675362, 0.1941818, 0.6880172, 1, 1, 1, 1, 1,
1.694809, 0.7799248, 3.11975, 1, 1, 1, 1, 1,
1.702328, -2.39661, 3.140457, 1, 1, 1, 1, 1,
1.711452, -0.8725219, 2.968398, 1, 1, 1, 1, 1,
1.71488, -0.1218057, 1.917538, 0, 0, 1, 1, 1,
1.734066, 1.271256, 1.499701, 1, 0, 0, 1, 1,
1.768357, -0.3380402, 3.373526, 1, 0, 0, 1, 1,
1.770128, -0.4013836, 2.131469, 1, 0, 0, 1, 1,
1.770647, -1.750525, 3.114447, 1, 0, 0, 1, 1,
1.794368, 0.4894285, -0.4366765, 1, 0, 0, 1, 1,
1.798257, -0.2482774, 0.8849822, 0, 0, 0, 1, 1,
1.805557, 0.2514398, 0.3512467, 0, 0, 0, 1, 1,
1.81291, 0.7767215, 1.271464, 0, 0, 0, 1, 1,
1.858772, -1.236979, 2.550226, 0, 0, 0, 1, 1,
1.888742, -0.8646998, 0.4663602, 0, 0, 0, 1, 1,
1.892881, 2.45087, 0.02401915, 0, 0, 0, 1, 1,
1.90207, -0.9607466, 2.001091, 0, 0, 0, 1, 1,
1.902199, -1.481129, 1.618107, 1, 1, 1, 1, 1,
1.919402, 0.4605184, 1.032077, 1, 1, 1, 1, 1,
1.94324, -0.6611055, 2.753485, 1, 1, 1, 1, 1,
1.949595, 1.452572, -0.05584097, 1, 1, 1, 1, 1,
1.953178, 2.141986, -0.09833021, 1, 1, 1, 1, 1,
1.98027, -1.520122, 4.133609, 1, 1, 1, 1, 1,
2.004562, -1.798902, 2.863845, 1, 1, 1, 1, 1,
2.05677, 0.9421454, 2.921436, 1, 1, 1, 1, 1,
2.060822, 0.5023902, 0.4888274, 1, 1, 1, 1, 1,
2.06874, 0.0416753, 1.918306, 1, 1, 1, 1, 1,
2.090732, 0.02278263, 1.678204, 1, 1, 1, 1, 1,
2.090918, -0.01094954, 1.583112, 1, 1, 1, 1, 1,
2.092429, 0.4922356, 0.5412724, 1, 1, 1, 1, 1,
2.099784, 1.476265, 2.536416, 1, 1, 1, 1, 1,
2.12319, -0.1513888, 2.294832, 1, 1, 1, 1, 1,
2.136283, -0.2901444, 0.2510833, 0, 0, 1, 1, 1,
2.14443, 1.500869, 1.120178, 1, 0, 0, 1, 1,
2.154774, -0.7999852, 0.5084247, 1, 0, 0, 1, 1,
2.162778, 0.6397854, 0.4167929, 1, 0, 0, 1, 1,
2.176042, 0.9682865, 0.03326877, 1, 0, 0, 1, 1,
2.214856, -0.7082062, 2.952358, 1, 0, 0, 1, 1,
2.260293, -0.5122278, 1.55334, 0, 0, 0, 1, 1,
2.28676, -0.3373204, 2.127664, 0, 0, 0, 1, 1,
2.286763, -0.2373828, 1.979464, 0, 0, 0, 1, 1,
2.291667, 0.7507721, 0.3868353, 0, 0, 0, 1, 1,
2.301026, -1.773387, 2.685076, 0, 0, 0, 1, 1,
2.307016, -1.414775, 2.923163, 0, 0, 0, 1, 1,
2.338182, -0.02991142, 1.603067, 0, 0, 0, 1, 1,
2.384976, -2.046965, 1.155403, 1, 1, 1, 1, 1,
2.462285, 0.5098763, -0.5702474, 1, 1, 1, 1, 1,
2.64871, -0.3381821, 1.191101, 1, 1, 1, 1, 1,
2.689433, 0.653125, 1.408888, 1, 1, 1, 1, 1,
2.705548, 0.566576, 1.679239, 1, 1, 1, 1, 1,
2.722538, 0.2918823, 3.51129, 1, 1, 1, 1, 1,
2.847828, 0.2327482, 0.1015812, 1, 1, 1, 1, 1
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
var radius = 9.377679;
var distance = 32.9387;
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
mvMatrix.translate( -0.03574431, -0.1308782, 0.2405469 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9387);
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
