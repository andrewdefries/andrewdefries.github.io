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
-2.951415, -1.826149, -3.109012, 1, 0, 0, 1,
-2.911284, -0.4738327, -0.3500378, 1, 0.007843138, 0, 1,
-2.747587, -0.8079295, -1.519943, 1, 0.01176471, 0, 1,
-2.435328, 0.1972509, -3.708351, 1, 0.01960784, 0, 1,
-2.371439, 0.5979776, -1.571742, 1, 0.02352941, 0, 1,
-2.367554, -0.4319883, -0.8258621, 1, 0.03137255, 0, 1,
-2.346057, -1.218198, -4.34146, 1, 0.03529412, 0, 1,
-2.307509, -0.5082704, -0.9287229, 1, 0.04313726, 0, 1,
-2.235782, -0.9594357, -2.368273, 1, 0.04705882, 0, 1,
-2.210626, -0.9001116, -2.513716, 1, 0.05490196, 0, 1,
-2.194762, -0.5325382, -1.709798, 1, 0.05882353, 0, 1,
-2.194639, -1.209782, -1.44046, 1, 0.06666667, 0, 1,
-2.156283, 0.1183273, -0.4918274, 1, 0.07058824, 0, 1,
-2.143468, -0.4962604, -1.635543, 1, 0.07843138, 0, 1,
-2.128465, -0.4324445, -1.343183, 1, 0.08235294, 0, 1,
-2.107749, -0.05303632, -0.5944948, 1, 0.09019608, 0, 1,
-2.058768, -0.5073641, -0.8397602, 1, 0.09411765, 0, 1,
-2.049274, -0.1086877, -0.2890874, 1, 0.1019608, 0, 1,
-2.038819, -1.76534, -2.960806, 1, 0.1098039, 0, 1,
-2.01916, 0.4501601, -2.081402, 1, 0.1137255, 0, 1,
-2.006338, -0.2183542, 0.9083552, 1, 0.1215686, 0, 1,
-1.962026, -1.670099, -2.30835, 1, 0.1254902, 0, 1,
-1.946822, -1.210222, -0.8562139, 1, 0.1333333, 0, 1,
-1.945864, 0.9824327, -1.123825, 1, 0.1372549, 0, 1,
-1.941914, 0.6227453, -2.191331, 1, 0.145098, 0, 1,
-1.940316, 0.6643707, -1.61733, 1, 0.1490196, 0, 1,
-1.937525, 0.5089367, -3.292994, 1, 0.1568628, 0, 1,
-1.901608, 0.09078642, -0.7523791, 1, 0.1607843, 0, 1,
-1.890873, 0.3014783, -2.462826, 1, 0.1686275, 0, 1,
-1.864003, 0.4382055, -2.23624, 1, 0.172549, 0, 1,
-1.857844, 0.1252249, -3.214137, 1, 0.1803922, 0, 1,
-1.830803, 0.465383, -0.7487582, 1, 0.1843137, 0, 1,
-1.821133, 0.2890605, -2.719033, 1, 0.1921569, 0, 1,
-1.815544, -0.8930516, -2.436514, 1, 0.1960784, 0, 1,
-1.797156, 0.3134576, -0.6573892, 1, 0.2039216, 0, 1,
-1.749471, 1.560304, -0.3348417, 1, 0.2117647, 0, 1,
-1.740968, -0.9546594, -3.881617, 1, 0.2156863, 0, 1,
-1.740682, 0.1384724, 0.3185809, 1, 0.2235294, 0, 1,
-1.739042, -1.468356, 0.2247811, 1, 0.227451, 0, 1,
-1.72552, 0.3339422, -1.035477, 1, 0.2352941, 0, 1,
-1.711033, 0.2372623, -1.640864, 1, 0.2392157, 0, 1,
-1.703138, 0.7159128, -1.198155, 1, 0.2470588, 0, 1,
-1.672199, -1.729015, -2.302734, 1, 0.2509804, 0, 1,
-1.66552, 0.3370098, 0.4788908, 1, 0.2588235, 0, 1,
-1.611268, 0.6881453, -0.2344232, 1, 0.2627451, 0, 1,
-1.603978, 0.9073468, -0.5482538, 1, 0.2705882, 0, 1,
-1.594212, -1.117877, -1.658544, 1, 0.2745098, 0, 1,
-1.589094, -0.09040653, -1.298692, 1, 0.282353, 0, 1,
-1.568922, 0.01419799, -3.243568, 1, 0.2862745, 0, 1,
-1.54994, 0.8505248, -1.700791, 1, 0.2941177, 0, 1,
-1.532301, 0.3947829, -1.159085, 1, 0.3019608, 0, 1,
-1.523913, -0.2244401, -1.411509, 1, 0.3058824, 0, 1,
-1.513774, -0.2986419, -0.4127015, 1, 0.3137255, 0, 1,
-1.494663, 0.8805143, 0.8848909, 1, 0.3176471, 0, 1,
-1.493598, 0.7035448, -2.878386, 1, 0.3254902, 0, 1,
-1.491059, -0.6885967, -3.086714, 1, 0.3294118, 0, 1,
-1.482653, 0.02509101, -1.250622, 1, 0.3372549, 0, 1,
-1.467883, -0.6411752, -1.678359, 1, 0.3411765, 0, 1,
-1.46495, 2.016682, 1.109196, 1, 0.3490196, 0, 1,
-1.455958, 2.424469, 0.5183519, 1, 0.3529412, 0, 1,
-1.453213, 2.346527, -0.9901684, 1, 0.3607843, 0, 1,
-1.453038, 0.6902155, -0.9885671, 1, 0.3647059, 0, 1,
-1.452983, -0.4070764, -2.399249, 1, 0.372549, 0, 1,
-1.452769, 2.219352, 0.04898997, 1, 0.3764706, 0, 1,
-1.451688, -0.4619675, -1.867309, 1, 0.3843137, 0, 1,
-1.44377, -0.1147632, -2.346616, 1, 0.3882353, 0, 1,
-1.440169, 0.2207668, -1.717177, 1, 0.3960784, 0, 1,
-1.429918, -0.6431751, -0.3175421, 1, 0.4039216, 0, 1,
-1.427869, -2.306364, -2.436756, 1, 0.4078431, 0, 1,
-1.427664, 1.554696, -0.899708, 1, 0.4156863, 0, 1,
-1.413828, -2.452049, -1.29195, 1, 0.4196078, 0, 1,
-1.4107, -0.3755602, -2.471253, 1, 0.427451, 0, 1,
-1.393878, 0.4473635, -1.017769, 1, 0.4313726, 0, 1,
-1.391948, -0.7113109, -1.102055, 1, 0.4392157, 0, 1,
-1.391536, 1.345446, -1.177565, 1, 0.4431373, 0, 1,
-1.391486, -0.08720986, -2.224804, 1, 0.4509804, 0, 1,
-1.37175, 0.4972682, 0.5125145, 1, 0.454902, 0, 1,
-1.371393, -0.8734602, -0.01929185, 1, 0.4627451, 0, 1,
-1.368611, 0.5016287, -1.305882, 1, 0.4666667, 0, 1,
-1.367119, 1.109494, -0.1094464, 1, 0.4745098, 0, 1,
-1.362522, 0.3219839, -0.772862, 1, 0.4784314, 0, 1,
-1.359169, -1.334499, -1.393853, 1, 0.4862745, 0, 1,
-1.352337, 0.2730033, -0.3878786, 1, 0.4901961, 0, 1,
-1.349928, -0.8022665, -2.704953, 1, 0.4980392, 0, 1,
-1.347957, -0.7021031, -1.153783, 1, 0.5058824, 0, 1,
-1.324002, -0.838919, -2.183091, 1, 0.509804, 0, 1,
-1.323627, 0.8727626, -1.56214, 1, 0.5176471, 0, 1,
-1.32296, -1.652361, -2.757414, 1, 0.5215687, 0, 1,
-1.317789, 1.148954, -1.727133, 1, 0.5294118, 0, 1,
-1.317644, 0.6023958, -0.7565702, 1, 0.5333334, 0, 1,
-1.315137, 0.5272085, -1.879901, 1, 0.5411765, 0, 1,
-1.308598, 0.6288501, -1.498268, 1, 0.5450981, 0, 1,
-1.298383, 2.076575, 0.8974028, 1, 0.5529412, 0, 1,
-1.296691, 1.871584, -0.8027832, 1, 0.5568628, 0, 1,
-1.287368, 0.6768069, 0.03160247, 1, 0.5647059, 0, 1,
-1.283043, 1.843973, -1.198419, 1, 0.5686275, 0, 1,
-1.276969, 0.3829104, -1.449631, 1, 0.5764706, 0, 1,
-1.272717, 0.02570346, -1.457455, 1, 0.5803922, 0, 1,
-1.272243, -1.384577, -2.450192, 1, 0.5882353, 0, 1,
-1.269723, -1.643102, -2.70446, 1, 0.5921569, 0, 1,
-1.263592, 0.4665876, -2.518986, 1, 0.6, 0, 1,
-1.251907, 0.8758239, 0.7779921, 1, 0.6078432, 0, 1,
-1.251557, 1.400977, -2.7647, 1, 0.6117647, 0, 1,
-1.240431, 2.030606, -0.1328096, 1, 0.6196079, 0, 1,
-1.231543, -0.3985785, -3.473794, 1, 0.6235294, 0, 1,
-1.218114, -0.4428795, -1.592179, 1, 0.6313726, 0, 1,
-1.209489, 0.6788296, -1.016679, 1, 0.6352941, 0, 1,
-1.207582, 0.3117384, -1.113046, 1, 0.6431373, 0, 1,
-1.205512, -0.4730315, -3.042942, 1, 0.6470588, 0, 1,
-1.205308, -0.4441697, -2.12012, 1, 0.654902, 0, 1,
-1.203933, 0.1646191, -2.000082, 1, 0.6588235, 0, 1,
-1.202554, -0.4505341, -1.58302, 1, 0.6666667, 0, 1,
-1.202087, -0.560915, -1.734525, 1, 0.6705883, 0, 1,
-1.200469, 0.7364879, -0.9141926, 1, 0.6784314, 0, 1,
-1.191006, -0.007849582, -1.100896, 1, 0.682353, 0, 1,
-1.188603, 1.602407, -0.4734274, 1, 0.6901961, 0, 1,
-1.186043, 1.116653, 1.501636, 1, 0.6941177, 0, 1,
-1.181255, 0.1387015, -1.897286, 1, 0.7019608, 0, 1,
-1.180952, -0.5383711, 0.407119, 1, 0.7098039, 0, 1,
-1.180241, 0.7496434, 1.319345, 1, 0.7137255, 0, 1,
-1.177382, 2.099567, 0.9703135, 1, 0.7215686, 0, 1,
-1.1762, -0.9776739, -2.316459, 1, 0.7254902, 0, 1,
-1.150763, -0.4382389, -3.157051, 1, 0.7333333, 0, 1,
-1.150269, -1.011599, -4.095648, 1, 0.7372549, 0, 1,
-1.146327, -0.6386791, -1.485104, 1, 0.7450981, 0, 1,
-1.137637, 1.582443, -1.834987, 1, 0.7490196, 0, 1,
-1.136315, -1.088536, -0.7406746, 1, 0.7568628, 0, 1,
-1.134907, 2.045945, 0.6902804, 1, 0.7607843, 0, 1,
-1.13484, -1.062096, -2.582791, 1, 0.7686275, 0, 1,
-1.130393, 0.4421475, -2.14915, 1, 0.772549, 0, 1,
-1.129092, 0.2737921, -1.403863, 1, 0.7803922, 0, 1,
-1.129086, 1.401736, -0.9182752, 1, 0.7843137, 0, 1,
-1.124397, 0.1697854, -0.7592288, 1, 0.7921569, 0, 1,
-1.11914, -0.2371396, -1.998227, 1, 0.7960784, 0, 1,
-1.11818, -0.1421781, -1.678491, 1, 0.8039216, 0, 1,
-1.117732, 2.075905, -0.2016777, 1, 0.8117647, 0, 1,
-1.11699, 1.587507, -0.04036078, 1, 0.8156863, 0, 1,
-1.115662, 1.768805, -2.185076, 1, 0.8235294, 0, 1,
-1.109164, -0.2389237, -3.086759, 1, 0.827451, 0, 1,
-1.107944, -0.3778531, -3.467469, 1, 0.8352941, 0, 1,
-1.094954, -1.232063, -2.474298, 1, 0.8392157, 0, 1,
-1.089884, -0.4635474, -1.438975, 1, 0.8470588, 0, 1,
-1.088808, -0.8424082, -2.080933, 1, 0.8509804, 0, 1,
-1.08396, -0.7324595, -3.181278, 1, 0.8588235, 0, 1,
-1.083576, -0.5647929, -4.480975, 1, 0.8627451, 0, 1,
-1.078569, 0.8987702, -0.8202528, 1, 0.8705882, 0, 1,
-1.073856, -1.188004, -4.652323, 1, 0.8745098, 0, 1,
-1.070611, 0.6184037, -0.3816049, 1, 0.8823529, 0, 1,
-1.054264, 0.7627595, 0.09245542, 1, 0.8862745, 0, 1,
-1.052789, 0.4389851, -2.428017, 1, 0.8941177, 0, 1,
-1.04625, 0.07540309, -1.561167, 1, 0.8980392, 0, 1,
-1.044603, 0.7669936, -0.7497087, 1, 0.9058824, 0, 1,
-1.041741, 0.4596644, 0.4402192, 1, 0.9137255, 0, 1,
-1.037215, 0.2814878, -0.3606686, 1, 0.9176471, 0, 1,
-1.027457, 0.3025614, -1.449863, 1, 0.9254902, 0, 1,
-1.017376, -1.089496, -5.099793, 1, 0.9294118, 0, 1,
-1.009817, 0.4785317, -1.68219, 1, 0.9372549, 0, 1,
-1.008484, 2.136394, -0.897698, 1, 0.9411765, 0, 1,
-1.004574, 0.4053737, -1.048129, 1, 0.9490196, 0, 1,
-0.9932483, 0.3145436, -1.99892, 1, 0.9529412, 0, 1,
-0.9930637, -1.531188, -2.33172, 1, 0.9607843, 0, 1,
-0.9917368, 0.07951146, -2.18052, 1, 0.9647059, 0, 1,
-0.9913864, 0.4379683, -0.1737709, 1, 0.972549, 0, 1,
-0.9875079, 0.1270656, -1.237446, 1, 0.9764706, 0, 1,
-0.9765878, 0.8670453, -0.04859718, 1, 0.9843137, 0, 1,
-0.9764336, 1.174543, -0.5443274, 1, 0.9882353, 0, 1,
-0.9755552, -0.7209504, -3.459827, 1, 0.9960784, 0, 1,
-0.9741639, -1.680747, -3.077317, 0.9960784, 1, 0, 1,
-0.9700493, 0.8816762, -1.005533, 0.9921569, 1, 0, 1,
-0.9677718, -0.9492149, -2.706602, 0.9843137, 1, 0, 1,
-0.9674752, -0.2944566, -1.084339, 0.9803922, 1, 0, 1,
-0.966115, -0.0401843, -1.841249, 0.972549, 1, 0, 1,
-0.9471104, -1.680469, -1.313571, 0.9686275, 1, 0, 1,
-0.9420393, 0.9623038, 0.3647501, 0.9607843, 1, 0, 1,
-0.9397555, 0.3794683, -2.409788, 0.9568627, 1, 0, 1,
-0.9379302, 1.323178, 0.4608665, 0.9490196, 1, 0, 1,
-0.9359167, -1.99497, -2.195205, 0.945098, 1, 0, 1,
-0.9311798, -0.341078, -0.9299808, 0.9372549, 1, 0, 1,
-0.9283454, 0.5401784, -0.9100096, 0.9333333, 1, 0, 1,
-0.9248153, -0.2134914, -2.583269, 0.9254902, 1, 0, 1,
-0.9246557, 1.452637, 1.473314, 0.9215686, 1, 0, 1,
-0.9226885, -2.090558, -2.507828, 0.9137255, 1, 0, 1,
-0.906139, -0.3660521, -1.167136, 0.9098039, 1, 0, 1,
-0.9024094, -0.2979794, -2.593271, 0.9019608, 1, 0, 1,
-0.8957551, 1.658861, -0.2271132, 0.8941177, 1, 0, 1,
-0.8928251, -0.7684255, -0.06551669, 0.8901961, 1, 0, 1,
-0.8891841, 0.9338115, -0.1053391, 0.8823529, 1, 0, 1,
-0.8890905, -0.5418891, -1.588557, 0.8784314, 1, 0, 1,
-0.8870739, 1.078133, 0.6766118, 0.8705882, 1, 0, 1,
-0.8834303, 0.404583, -0.2832619, 0.8666667, 1, 0, 1,
-0.8677143, 0.6058701, 0.03230126, 0.8588235, 1, 0, 1,
-0.8590856, 0.1970072, -2.03382, 0.854902, 1, 0, 1,
-0.8569238, 0.2613257, 0.05897429, 0.8470588, 1, 0, 1,
-0.8561487, 0.6793659, -2.256115, 0.8431373, 1, 0, 1,
-0.8545784, -0.1681654, -2.45433, 0.8352941, 1, 0, 1,
-0.8466206, -0.6794859, -2.579369, 0.8313726, 1, 0, 1,
-0.845234, -0.8568598, -3.245842, 0.8235294, 1, 0, 1,
-0.8447611, 0.8487001, -0.345626, 0.8196079, 1, 0, 1,
-0.8415234, 2.250082, -1.096246, 0.8117647, 1, 0, 1,
-0.8385089, -0.3759584, -1.255127, 0.8078431, 1, 0, 1,
-0.8328177, -0.7840768, -3.111068, 0.8, 1, 0, 1,
-0.8297054, -1.787301, -3.031828, 0.7921569, 1, 0, 1,
-0.8265823, 0.5657994, -1.688621, 0.7882353, 1, 0, 1,
-0.825942, 1.022014, -2.518894, 0.7803922, 1, 0, 1,
-0.8238351, -1.963827, -1.278262, 0.7764706, 1, 0, 1,
-0.8224595, -0.6111507, -4.611142, 0.7686275, 1, 0, 1,
-0.820601, 0.8760865, -0.7359974, 0.7647059, 1, 0, 1,
-0.8196416, -1.698192, -2.31283, 0.7568628, 1, 0, 1,
-0.8192201, 0.115552, -1.948073, 0.7529412, 1, 0, 1,
-0.8159858, 0.4151663, -0.938439, 0.7450981, 1, 0, 1,
-0.8071017, -0.3697231, -2.641539, 0.7411765, 1, 0, 1,
-0.802716, -2.516486, -3.878287, 0.7333333, 1, 0, 1,
-0.8026401, 0.2888294, -0.8560165, 0.7294118, 1, 0, 1,
-0.7971956, 0.09260309, -0.3044699, 0.7215686, 1, 0, 1,
-0.7956462, 0.4925323, 0.2512736, 0.7176471, 1, 0, 1,
-0.7891008, 1.402239, 0.03908022, 0.7098039, 1, 0, 1,
-0.7869448, 1.351919, 0.001484243, 0.7058824, 1, 0, 1,
-0.7860084, -0.07387555, -1.624793, 0.6980392, 1, 0, 1,
-0.7815485, -1.566471, -1.637228, 0.6901961, 1, 0, 1,
-0.780062, -0.07395353, -1.10161, 0.6862745, 1, 0, 1,
-0.7743972, -0.3123948, -0.9759241, 0.6784314, 1, 0, 1,
-0.7725868, 1.354987, -0.7054901, 0.6745098, 1, 0, 1,
-0.7680095, -0.8826649, -3.654209, 0.6666667, 1, 0, 1,
-0.76683, 0.263839, -0.4370746, 0.6627451, 1, 0, 1,
-0.7656755, -0.7975988, -1.381228, 0.654902, 1, 0, 1,
-0.7633566, 0.9318571, -1.760281, 0.6509804, 1, 0, 1,
-0.760132, -0.2385586, -2.515616, 0.6431373, 1, 0, 1,
-0.7575386, 0.213639, -2.398758, 0.6392157, 1, 0, 1,
-0.7562095, -0.633235, -1.681283, 0.6313726, 1, 0, 1,
-0.7561731, -0.4823464, -1.21243, 0.627451, 1, 0, 1,
-0.7538811, -0.4514124, -1.82145, 0.6196079, 1, 0, 1,
-0.7509644, -0.8221742, -1.846691, 0.6156863, 1, 0, 1,
-0.7506778, 1.427253, -2.003743, 0.6078432, 1, 0, 1,
-0.7482874, -0.2650905, -1.535244, 0.6039216, 1, 0, 1,
-0.7457646, -2.718678, -2.483303, 0.5960785, 1, 0, 1,
-0.7443049, -0.6208377, -3.452795, 0.5882353, 1, 0, 1,
-0.7420258, -1.342681, -0.9838927, 0.5843138, 1, 0, 1,
-0.7411579, 0.5269334, -1.422932, 0.5764706, 1, 0, 1,
-0.7339806, -0.6890755, -2.326029, 0.572549, 1, 0, 1,
-0.7258971, 0.3167531, -1.43209, 0.5647059, 1, 0, 1,
-0.7257375, -0.2169309, -0.7413806, 0.5607843, 1, 0, 1,
-0.7256791, -0.3442525, -3.582768, 0.5529412, 1, 0, 1,
-0.7241366, 0.1831445, -2.661271, 0.5490196, 1, 0, 1,
-0.7222404, -2.171288, -2.836008, 0.5411765, 1, 0, 1,
-0.7214606, -2.16969, -3.391637, 0.5372549, 1, 0, 1,
-0.7211898, 0.7744607, -1.667114, 0.5294118, 1, 0, 1,
-0.7180417, 1.557273, 0.528915, 0.5254902, 1, 0, 1,
-0.7130355, -0.142632, -2.613248, 0.5176471, 1, 0, 1,
-0.7099026, -0.1625817, -2.459962, 0.5137255, 1, 0, 1,
-0.6988854, 0.8276138, -1.200364, 0.5058824, 1, 0, 1,
-0.697071, 1.152792, -0.3173831, 0.5019608, 1, 0, 1,
-0.6962567, -0.5804061, -0.8744338, 0.4941176, 1, 0, 1,
-0.694533, 0.4462152, -2.442519, 0.4862745, 1, 0, 1,
-0.6859658, -1.254682, -0.8216261, 0.4823529, 1, 0, 1,
-0.6854122, 0.1158448, -2.412185, 0.4745098, 1, 0, 1,
-0.6741552, -0.0700461, -1.722647, 0.4705882, 1, 0, 1,
-0.6740361, 1.755843, -0.04117361, 0.4627451, 1, 0, 1,
-0.6734756, -0.4099346, -2.993977, 0.4588235, 1, 0, 1,
-0.6696079, 0.5444394, -1.549558, 0.4509804, 1, 0, 1,
-0.6675253, 1.669353, -0.6903106, 0.4470588, 1, 0, 1,
-0.6666131, 0.007085887, -0.8854572, 0.4392157, 1, 0, 1,
-0.6624934, 0.8193325, -0.3262503, 0.4352941, 1, 0, 1,
-0.6597098, 0.7087549, -1.686646, 0.427451, 1, 0, 1,
-0.6584029, -0.4287672, -0.4727172, 0.4235294, 1, 0, 1,
-0.657577, -0.495133, -1.856556, 0.4156863, 1, 0, 1,
-0.6550573, -0.2854454, -2.562975, 0.4117647, 1, 0, 1,
-0.652249, 0.01203972, -2.303741, 0.4039216, 1, 0, 1,
-0.63003, 0.3516454, -3.82692, 0.3960784, 1, 0, 1,
-0.628185, -0.5646812, -1.937841, 0.3921569, 1, 0, 1,
-0.6223236, 0.8974363, 1.588815, 0.3843137, 1, 0, 1,
-0.6219399, -0.9512272, -2.024846, 0.3803922, 1, 0, 1,
-0.621688, -0.3653521, -4.216561, 0.372549, 1, 0, 1,
-0.6149386, 2.37957, 0.1092311, 0.3686275, 1, 0, 1,
-0.6104133, -0.2377678, -3.199357, 0.3607843, 1, 0, 1,
-0.6076809, 0.02080466, -2.270781, 0.3568628, 1, 0, 1,
-0.5937019, 0.5850353, -1.604658, 0.3490196, 1, 0, 1,
-0.5935928, -0.9191119, -2.674522, 0.345098, 1, 0, 1,
-0.5907145, 0.3724829, -0.1402821, 0.3372549, 1, 0, 1,
-0.5885027, -0.3057684, -2.654129, 0.3333333, 1, 0, 1,
-0.5817011, 0.6812011, -1.111427, 0.3254902, 1, 0, 1,
-0.5772066, 0.7836517, -1.40299, 0.3215686, 1, 0, 1,
-0.5770851, -0.08627204, 0.5333299, 0.3137255, 1, 0, 1,
-0.5747696, 0.8811547, -0.4441581, 0.3098039, 1, 0, 1,
-0.5731833, -1.429056, -3.04221, 0.3019608, 1, 0, 1,
-0.5615697, 0.004353861, -2.428903, 0.2941177, 1, 0, 1,
-0.5545694, -1.240279, -0.8894387, 0.2901961, 1, 0, 1,
-0.5512297, 0.6611255, -1.055285, 0.282353, 1, 0, 1,
-0.5494292, -0.6112791, -1.350307, 0.2784314, 1, 0, 1,
-0.5488304, 0.3263983, -0.9384778, 0.2705882, 1, 0, 1,
-0.5477452, 2.746203, -0.9829549, 0.2666667, 1, 0, 1,
-0.5460668, 1.329209, -1.246871, 0.2588235, 1, 0, 1,
-0.5458977, -2.300218, -2.80221, 0.254902, 1, 0, 1,
-0.5432097, -1.326448, -2.529949, 0.2470588, 1, 0, 1,
-0.5430284, 0.3493803, -1.965228, 0.2431373, 1, 0, 1,
-0.5408319, 1.439304, 0.7685333, 0.2352941, 1, 0, 1,
-0.5392694, -0.06519639, -0.7219857, 0.2313726, 1, 0, 1,
-0.5349596, -1.597022, -2.752097, 0.2235294, 1, 0, 1,
-0.5330992, 1.75221, -0.5571019, 0.2196078, 1, 0, 1,
-0.5291114, -0.2499984, -2.724234, 0.2117647, 1, 0, 1,
-0.5288185, -0.6059183, -0.7850738, 0.2078431, 1, 0, 1,
-0.5279788, 0.7818648, -1.103376, 0.2, 1, 0, 1,
-0.5258286, 0.1101028, -2.862722, 0.1921569, 1, 0, 1,
-0.5241939, 0.7644025, -1.961765, 0.1882353, 1, 0, 1,
-0.5233075, 0.03852735, -0.1895315, 0.1803922, 1, 0, 1,
-0.5186542, -0.1668365, -1.636615, 0.1764706, 1, 0, 1,
-0.5183534, 1.066772, -0.7774514, 0.1686275, 1, 0, 1,
-0.5066994, 0.9039305, -0.3756939, 0.1647059, 1, 0, 1,
-0.502508, 2.218428, -1.021802, 0.1568628, 1, 0, 1,
-0.5000053, 1.19498, -0.7108747, 0.1529412, 1, 0, 1,
-0.4912326, -0.06435332, -2.319556, 0.145098, 1, 0, 1,
-0.4787112, -0.5010977, -1.404843, 0.1411765, 1, 0, 1,
-0.4731693, -0.6552722, -2.440441, 0.1333333, 1, 0, 1,
-0.465038, -1.012233, -2.615008, 0.1294118, 1, 0, 1,
-0.4632974, 0.1705106, -0.7556378, 0.1215686, 1, 0, 1,
-0.4602187, -0.598108, -3.626107, 0.1176471, 1, 0, 1,
-0.4588307, -0.6971015, -2.70224, 0.1098039, 1, 0, 1,
-0.4554279, 0.4060766, -0.8286253, 0.1058824, 1, 0, 1,
-0.4539501, 1.185691, 0.03847129, 0.09803922, 1, 0, 1,
-0.4527714, -0.4536443, -2.391303, 0.09019608, 1, 0, 1,
-0.4520031, 0.5386201, -1.054507, 0.08627451, 1, 0, 1,
-0.4519849, -1.957599, -1.400064, 0.07843138, 1, 0, 1,
-0.4515759, 0.5716054, -2.727355, 0.07450981, 1, 0, 1,
-0.4503095, 1.049272, 0.933104, 0.06666667, 1, 0, 1,
-0.4499382, -0.1329316, -1.457811, 0.0627451, 1, 0, 1,
-0.4486949, 0.1262292, -1.206116, 0.05490196, 1, 0, 1,
-0.4394629, -0.4194041, -2.538906, 0.05098039, 1, 0, 1,
-0.4347112, -1.073005, -1.990734, 0.04313726, 1, 0, 1,
-0.4297829, -1.146295, -3.211815, 0.03921569, 1, 0, 1,
-0.429299, -0.9012077, -1.564889, 0.03137255, 1, 0, 1,
-0.4285558, 0.01318316, -2.680875, 0.02745098, 1, 0, 1,
-0.4250349, -0.7224649, -0.9422824, 0.01960784, 1, 0, 1,
-0.4226378, 0.2889142, -1.363151, 0.01568628, 1, 0, 1,
-0.4213448, -0.1667581, -2.793365, 0.007843138, 1, 0, 1,
-0.4181578, 0.9005031, -0.738919, 0.003921569, 1, 0, 1,
-0.4179466, -1.802057, -3.475113, 0, 1, 0.003921569, 1,
-0.4177648, 0.7105669, 0.4145232, 0, 1, 0.01176471, 1,
-0.4172882, -0.1448197, -2.64617, 0, 1, 0.01568628, 1,
-0.4166943, -0.3515998, -0.8563128, 0, 1, 0.02352941, 1,
-0.4160883, 0.7926069, 1.038749, 0, 1, 0.02745098, 1,
-0.4139682, 2.054678, -1.046582, 0, 1, 0.03529412, 1,
-0.4027954, 2.044376, -1.160552, 0, 1, 0.03921569, 1,
-0.4021658, -0.3306879, -1.565402, 0, 1, 0.04705882, 1,
-0.3925357, 0.2791314, -1.835457, 0, 1, 0.05098039, 1,
-0.3901683, 0.3878075, 0.01847023, 0, 1, 0.05882353, 1,
-0.3859186, -0.49652, -4.062684, 0, 1, 0.0627451, 1,
-0.3843976, -0.1502009, -1.948088, 0, 1, 0.07058824, 1,
-0.3835125, -0.1743467, -2.829603, 0, 1, 0.07450981, 1,
-0.3775895, -0.1847804, -0.9553604, 0, 1, 0.08235294, 1,
-0.3734025, 0.2318962, -0.3885934, 0, 1, 0.08627451, 1,
-0.3691496, -0.3610686, -2.802827, 0, 1, 0.09411765, 1,
-0.3643359, -0.5726292, -2.022522, 0, 1, 0.1019608, 1,
-0.3643307, -1.398649, -5.294125, 0, 1, 0.1058824, 1,
-0.3617947, 1.442455, -0.6295371, 0, 1, 0.1137255, 1,
-0.3594744, -1.325246, -1.718244, 0, 1, 0.1176471, 1,
-0.3571558, 0.3547449, -2.82878, 0, 1, 0.1254902, 1,
-0.3562713, -0.3958403, -1.72129, 0, 1, 0.1294118, 1,
-0.3535796, -1.116066, -3.486, 0, 1, 0.1372549, 1,
-0.3524122, -0.8430787, -2.705606, 0, 1, 0.1411765, 1,
-0.3502991, -1.214637, -2.130162, 0, 1, 0.1490196, 1,
-0.3491147, -0.3542546, -3.607717, 0, 1, 0.1529412, 1,
-0.3469127, -1.839239, -3.793588, 0, 1, 0.1607843, 1,
-0.3465579, -1.026716, -0.8650841, 0, 1, 0.1647059, 1,
-0.345459, 1.121119, 0.2378513, 0, 1, 0.172549, 1,
-0.3452154, 0.4488845, 0.4941621, 0, 1, 0.1764706, 1,
-0.3432355, 0.9744204, 0.08323095, 0, 1, 0.1843137, 1,
-0.3352234, -0.3200747, -4.262283, 0, 1, 0.1882353, 1,
-0.3284218, -0.9912208, -1.362478, 0, 1, 0.1960784, 1,
-0.3278494, -0.09142037, -2.982342, 0, 1, 0.2039216, 1,
-0.3277873, -0.700645, -2.234816, 0, 1, 0.2078431, 1,
-0.3272442, 0.449446, -3.016682, 0, 1, 0.2156863, 1,
-0.321274, -0.558739, -1.822725, 0, 1, 0.2196078, 1,
-0.3137594, 0.8075356, -0.01418613, 0, 1, 0.227451, 1,
-0.3119843, 0.4433126, 0.06443889, 0, 1, 0.2313726, 1,
-0.3103336, -0.518589, -2.674574, 0, 1, 0.2392157, 1,
-0.3048174, -1.399991, -3.818647, 0, 1, 0.2431373, 1,
-0.3012896, -0.1342458, -0.810205, 0, 1, 0.2509804, 1,
-0.2994556, 0.09464201, -1.474509, 0, 1, 0.254902, 1,
-0.2994383, 0.1457237, -1.378099, 0, 1, 0.2627451, 1,
-0.2969837, -1.241279, -3.675196, 0, 1, 0.2666667, 1,
-0.2962362, -0.5110024, -3.608752, 0, 1, 0.2745098, 1,
-0.294768, -0.03671707, -4.412686, 0, 1, 0.2784314, 1,
-0.2939151, -1.45095, -4.140573, 0, 1, 0.2862745, 1,
-0.2933467, 0.3000789, -2.167726, 0, 1, 0.2901961, 1,
-0.2897621, -0.1549366, -1.902664, 0, 1, 0.2980392, 1,
-0.2884064, -2.018202, -2.458254, 0, 1, 0.3058824, 1,
-0.2811527, 1.117949, -0.7178937, 0, 1, 0.3098039, 1,
-0.2782415, -0.1160993, -0.5922175, 0, 1, 0.3176471, 1,
-0.2763516, 2.540757, -0.2295045, 0, 1, 0.3215686, 1,
-0.2718858, -0.01988737, -0.2382703, 0, 1, 0.3294118, 1,
-0.2690751, -0.4597731, -2.617004, 0, 1, 0.3333333, 1,
-0.268875, 1.047938, 0.2865796, 0, 1, 0.3411765, 1,
-0.2688217, 0.4456987, -0.8264025, 0, 1, 0.345098, 1,
-0.264785, -0.3319777, -1.214435, 0, 1, 0.3529412, 1,
-0.264585, 1.963075, -0.6822928, 0, 1, 0.3568628, 1,
-0.2629863, 0.9305675, -0.5831344, 0, 1, 0.3647059, 1,
-0.2629241, 1.01677, -1.178167, 0, 1, 0.3686275, 1,
-0.2568292, 0.4742224, -2.041847, 0, 1, 0.3764706, 1,
-0.2565276, 1.044641, 0.1431761, 0, 1, 0.3803922, 1,
-0.2547108, -0.7509885, -2.290165, 0, 1, 0.3882353, 1,
-0.2524547, -0.0762987, -1.064914, 0, 1, 0.3921569, 1,
-0.2506503, -0.2636323, -3.295825, 0, 1, 0.4, 1,
-0.2506119, -0.1544721, -2.453773, 0, 1, 0.4078431, 1,
-0.2504683, 1.23034, -1.811854, 0, 1, 0.4117647, 1,
-0.2454815, -0.5682848, -4.950747, 0, 1, 0.4196078, 1,
-0.2415491, 0.1028101, -0.1751815, 0, 1, 0.4235294, 1,
-0.2376612, -0.01824795, -0.7363513, 0, 1, 0.4313726, 1,
-0.2354629, 0.1223378, -3.24526, 0, 1, 0.4352941, 1,
-0.2320452, 0.9534319, -1.096156, 0, 1, 0.4431373, 1,
-0.229266, 0.7925301, 0.08632119, 0, 1, 0.4470588, 1,
-0.2246584, 0.7886818, -0.5047696, 0, 1, 0.454902, 1,
-0.2215534, 0.5230291, -0.03518937, 0, 1, 0.4588235, 1,
-0.221484, 0.2042305, -1.926047, 0, 1, 0.4666667, 1,
-0.2209743, -1.767822, -3.695872, 0, 1, 0.4705882, 1,
-0.2202153, -0.2729877, -3.3333, 0, 1, 0.4784314, 1,
-0.2195911, 0.8694752, -0.3503003, 0, 1, 0.4823529, 1,
-0.2121822, 0.120493, -0.2822332, 0, 1, 0.4901961, 1,
-0.2104787, 0.5757322, 0.3934795, 0, 1, 0.4941176, 1,
-0.2049594, 2.004945, 1.145889, 0, 1, 0.5019608, 1,
-0.2006323, 0.3849467, 2.045144, 0, 1, 0.509804, 1,
-0.1967309, -0.6540732, -3.313944, 0, 1, 0.5137255, 1,
-0.1899548, 0.1468121, -1.435816, 0, 1, 0.5215687, 1,
-0.1865172, -1.482986, -3.912097, 0, 1, 0.5254902, 1,
-0.1850767, -0.6431934, -2.224869, 0, 1, 0.5333334, 1,
-0.1829241, -0.224595, -2.171786, 0, 1, 0.5372549, 1,
-0.1813634, 1.451733, 0.02540219, 0, 1, 0.5450981, 1,
-0.1806325, -0.345367, -3.374624, 0, 1, 0.5490196, 1,
-0.1805814, 2.374658, 0.03542619, 0, 1, 0.5568628, 1,
-0.1788859, 0.3987375, -0.5174677, 0, 1, 0.5607843, 1,
-0.1788368, 0.6365734, 0.242126, 0, 1, 0.5686275, 1,
-0.1763896, -0.04443196, -1.263496, 0, 1, 0.572549, 1,
-0.1724901, 0.3037159, 0.05394041, 0, 1, 0.5803922, 1,
-0.1711402, -0.5393127, -5.596457, 0, 1, 0.5843138, 1,
-0.1700514, -1.140659, -5.089453, 0, 1, 0.5921569, 1,
-0.1692839, -0.2687531, -3.605543, 0, 1, 0.5960785, 1,
-0.1685836, 1.314221, 0.987116, 0, 1, 0.6039216, 1,
-0.1641731, -0.1065622, -2.237563, 0, 1, 0.6117647, 1,
-0.1420429, -0.792901, -4.658043, 0, 1, 0.6156863, 1,
-0.1403653, -1.301092, -1.610765, 0, 1, 0.6235294, 1,
-0.1380237, -0.7468965, -3.223001, 0, 1, 0.627451, 1,
-0.1379822, -1.440781, -2.657138, 0, 1, 0.6352941, 1,
-0.137422, -0.2216882, -2.431, 0, 1, 0.6392157, 1,
-0.1369313, 0.1565455, -3.33373, 0, 1, 0.6470588, 1,
-0.1359212, 1.082662, -0.3728479, 0, 1, 0.6509804, 1,
-0.1358093, -0.8980788, -3.124972, 0, 1, 0.6588235, 1,
-0.1351819, -0.5267521, -4.646561, 0, 1, 0.6627451, 1,
-0.1343628, 0.5743471, -0.4056519, 0, 1, 0.6705883, 1,
-0.1321688, -0.6991894, -2.722933, 0, 1, 0.6745098, 1,
-0.1275507, -0.7917168, -2.080146, 0, 1, 0.682353, 1,
-0.1263124, 0.02879453, -2.312806, 0, 1, 0.6862745, 1,
-0.1232057, 0.320333, 0.6804001, 0, 1, 0.6941177, 1,
-0.1197402, -1.036897, -3.724278, 0, 1, 0.7019608, 1,
-0.1117833, -0.8826237, -1.850871, 0, 1, 0.7058824, 1,
-0.1065318, 0.7431405, -0.928243, 0, 1, 0.7137255, 1,
-0.1040579, 0.9822838, -1.449924, 0, 1, 0.7176471, 1,
-0.1028361, 0.1151749, -1.511483, 0, 1, 0.7254902, 1,
-0.1010024, -1.362087, -2.587409, 0, 1, 0.7294118, 1,
-0.09985018, 0.6412921, 0.56925, 0, 1, 0.7372549, 1,
-0.09865937, 0.5804843, 0.02942685, 0, 1, 0.7411765, 1,
-0.09846462, 0.7099251, -0.3904212, 0, 1, 0.7490196, 1,
-0.09275127, -0.5488118, -2.334702, 0, 1, 0.7529412, 1,
-0.0891581, -0.2297916, -2.8716, 0, 1, 0.7607843, 1,
-0.08818777, -0.8491405, -1.954484, 0, 1, 0.7647059, 1,
-0.08710539, -0.4117858, -2.87405, 0, 1, 0.772549, 1,
-0.08450941, 2.633545, 0.4701601, 0, 1, 0.7764706, 1,
-0.08075465, 0.1871976, -0.5741379, 0, 1, 0.7843137, 1,
-0.08036617, 0.7978915, -0.9296932, 0, 1, 0.7882353, 1,
-0.08003979, 0.07957862, 0.5966416, 0, 1, 0.7960784, 1,
-0.07900504, -1.460569, -2.959626, 0, 1, 0.8039216, 1,
-0.07659351, 0.1739283, -0.3528552, 0, 1, 0.8078431, 1,
-0.07441448, -0.2891656, -3.693449, 0, 1, 0.8156863, 1,
-0.07413316, 0.6664603, -0.0005991885, 0, 1, 0.8196079, 1,
-0.06900867, 1.501516, 0.6869872, 0, 1, 0.827451, 1,
-0.06873938, -0.8974224, -2.439071, 0, 1, 0.8313726, 1,
-0.06705508, -0.9014044, -3.84103, 0, 1, 0.8392157, 1,
-0.06617012, -0.8306519, -2.454807, 0, 1, 0.8431373, 1,
-0.05623522, 0.4025015, -0.5558233, 0, 1, 0.8509804, 1,
-0.05460108, -0.6696859, -2.11463, 0, 1, 0.854902, 1,
-0.0492366, -0.8491623, -3.698074, 0, 1, 0.8627451, 1,
-0.04242158, 0.1965758, -0.9869674, 0, 1, 0.8666667, 1,
-0.04178086, -0.92004, -4.022754, 0, 1, 0.8745098, 1,
-0.04106008, 0.6506978, -1.406724, 0, 1, 0.8784314, 1,
-0.03852011, 0.5782488, -1.557502, 0, 1, 0.8862745, 1,
-0.03846634, -0.5795751, -2.267096, 0, 1, 0.8901961, 1,
-0.03763163, -1.580733, -2.329418, 0, 1, 0.8980392, 1,
-0.03685425, 2.164307, 0.5970342, 0, 1, 0.9058824, 1,
-0.03554987, -0.02531229, -0.6158898, 0, 1, 0.9098039, 1,
-0.03501897, -2.098915, -1.053325, 0, 1, 0.9176471, 1,
-0.03427344, 1.74963, 0.115376, 0, 1, 0.9215686, 1,
-0.03335949, -0.2960621, -2.177895, 0, 1, 0.9294118, 1,
-0.03265505, -1.299543, -3.890413, 0, 1, 0.9333333, 1,
-0.03069896, -0.1654374, -1.883592, 0, 1, 0.9411765, 1,
-0.03060803, -0.1096992, -1.854605, 0, 1, 0.945098, 1,
-0.02971355, 1.109739, -0.6861233, 0, 1, 0.9529412, 1,
-0.02584674, -0.3518055, -4.231236, 0, 1, 0.9568627, 1,
-0.0248594, -0.9527118, -2.702217, 0, 1, 0.9647059, 1,
-0.02341414, 0.6465701, 0.1040769, 0, 1, 0.9686275, 1,
-0.01852582, 0.9867344, 0.407377, 0, 1, 0.9764706, 1,
-0.009445525, 0.6563204, 0.4083882, 0, 1, 0.9803922, 1,
-0.004672468, -2.81881, -1.891057, 0, 1, 0.9882353, 1,
-0.00278839, 0.8407076, 0.4718769, 0, 1, 0.9921569, 1,
-0.0003189167, 0.03916601, 0.5166717, 0, 1, 1, 1,
0.002725089, 1.643198, 0.5069939, 0, 0.9921569, 1, 1,
0.01305716, -1.320574, 2.88603, 0, 0.9882353, 1, 1,
0.01776279, 0.03061949, 1.370929, 0, 0.9803922, 1, 1,
0.0211883, 0.4688913, 0.3001347, 0, 0.9764706, 1, 1,
0.02212926, 0.3507529, -0.3812568, 0, 0.9686275, 1, 1,
0.02377407, 0.2403838, 0.4111808, 0, 0.9647059, 1, 1,
0.02451598, -1.030006, 4.443035, 0, 0.9568627, 1, 1,
0.02946063, -0.07549983, 4.242578, 0, 0.9529412, 1, 1,
0.03458131, 1.473965, -0.5386104, 0, 0.945098, 1, 1,
0.03822196, -0.6965087, 4.544961, 0, 0.9411765, 1, 1,
0.03986316, 0.6788712, 0.8920627, 0, 0.9333333, 1, 1,
0.03987774, -0.3750824, 3.437844, 0, 0.9294118, 1, 1,
0.04236517, -0.682217, 2.182809, 0, 0.9215686, 1, 1,
0.04262988, -1.146401, 3.227549, 0, 0.9176471, 1, 1,
0.04555784, 0.4717724, 0.2053959, 0, 0.9098039, 1, 1,
0.05030509, 0.9912893, -0.4834109, 0, 0.9058824, 1, 1,
0.05905709, 0.5224014, 0.1531786, 0, 0.8980392, 1, 1,
0.06111178, -0.5344832, 2.45645, 0, 0.8901961, 1, 1,
0.06175859, -0.1061763, 3.071215, 0, 0.8862745, 1, 1,
0.06334217, -0.2382106, 4.400182, 0, 0.8784314, 1, 1,
0.06662609, 1.093816, -0.1233342, 0, 0.8745098, 1, 1,
0.06795205, 0.0636863, 2.202323, 0, 0.8666667, 1, 1,
0.06800808, 0.5378617, 2.285394, 0, 0.8627451, 1, 1,
0.06880824, -1.67313, 2.88967, 0, 0.854902, 1, 1,
0.07028413, -0.7062783, 3.330943, 0, 0.8509804, 1, 1,
0.07119987, 0.3315388, 2.388712, 0, 0.8431373, 1, 1,
0.07132249, -0.8336029, 2.147916, 0, 0.8392157, 1, 1,
0.0717588, 1.795045, 0.465092, 0, 0.8313726, 1, 1,
0.0725133, -1.749416, 3.405983, 0, 0.827451, 1, 1,
0.07635211, -1.375991, 3.028295, 0, 0.8196079, 1, 1,
0.07635505, 0.9902776, -0.2612444, 0, 0.8156863, 1, 1,
0.07668228, 2.414479, -1.410382, 0, 0.8078431, 1, 1,
0.07722764, -0.8090501, 3.060829, 0, 0.8039216, 1, 1,
0.07898071, 0.1700571, -0.05179568, 0, 0.7960784, 1, 1,
0.08278157, 0.7045606, -0.7559336, 0, 0.7882353, 1, 1,
0.08606017, 0.2745323, 0.6172377, 0, 0.7843137, 1, 1,
0.08848641, 0.3959683, -0.151726, 0, 0.7764706, 1, 1,
0.09032764, 0.5622645, -0.4192647, 0, 0.772549, 1, 1,
0.09107821, 0.3818292, 1.185756, 0, 0.7647059, 1, 1,
0.09164258, -1.526651, 2.820882, 0, 0.7607843, 1, 1,
0.09254143, 0.1139656, 0.2463445, 0, 0.7529412, 1, 1,
0.1005531, 0.09170058, -0.822374, 0, 0.7490196, 1, 1,
0.1010488, -1.706708, 4.592631, 0, 0.7411765, 1, 1,
0.1046217, -0.8731877, 1.789434, 0, 0.7372549, 1, 1,
0.1063232, -0.4151199, 3.580458, 0, 0.7294118, 1, 1,
0.1068156, 0.7342863, -0.1739624, 0, 0.7254902, 1, 1,
0.1072988, -0.3047227, 4.377082, 0, 0.7176471, 1, 1,
0.1094923, 0.2142867, 0.3642397, 0, 0.7137255, 1, 1,
0.1098934, 0.4398845, 0.5786796, 0, 0.7058824, 1, 1,
0.1119723, -1.601235, 3.135657, 0, 0.6980392, 1, 1,
0.1134094, -0.3029565, 1.510458, 0, 0.6941177, 1, 1,
0.1156807, -0.5423499, 2.874268, 0, 0.6862745, 1, 1,
0.1164524, 0.3185709, -0.8652748, 0, 0.682353, 1, 1,
0.1170518, -0.6690797, 2.716619, 0, 0.6745098, 1, 1,
0.1254281, -1.511045, 4.225616, 0, 0.6705883, 1, 1,
0.1259141, 0.131363, 1.03391, 0, 0.6627451, 1, 1,
0.129323, -1.491666, 1.863919, 0, 0.6588235, 1, 1,
0.1317527, -0.6133296, 0.1332123, 0, 0.6509804, 1, 1,
0.1332199, 1.299177, -1.248423, 0, 0.6470588, 1, 1,
0.1353825, -0.8163775, 2.451229, 0, 0.6392157, 1, 1,
0.137054, -1.090546, 2.412265, 0, 0.6352941, 1, 1,
0.13837, -1.592975, 2.77384, 0, 0.627451, 1, 1,
0.1393777, 0.7990769, 0.6672003, 0, 0.6235294, 1, 1,
0.1450878, -0.5906942, 3.228649, 0, 0.6156863, 1, 1,
0.1463006, 0.807952, -1.338677, 0, 0.6117647, 1, 1,
0.1576017, 0.8726996, -0.7955372, 0, 0.6039216, 1, 1,
0.1592465, -0.8040999, 2.728646, 0, 0.5960785, 1, 1,
0.1623451, -0.2002965, 0.98403, 0, 0.5921569, 1, 1,
0.1626298, -0.05647462, 2.640763, 0, 0.5843138, 1, 1,
0.1674252, -0.2541959, 2.202544, 0, 0.5803922, 1, 1,
0.1708162, -0.01888153, 1.130905, 0, 0.572549, 1, 1,
0.1748928, 0.5730799, -0.1701287, 0, 0.5686275, 1, 1,
0.1751254, 0.5940558, -0.07366577, 0, 0.5607843, 1, 1,
0.1802578, -1.305416, 2.178174, 0, 0.5568628, 1, 1,
0.1824463, -1.670146, 4.692992, 0, 0.5490196, 1, 1,
0.1824893, 1.049338, 0.2862461, 0, 0.5450981, 1, 1,
0.186222, -0.550344, 2.25645, 0, 0.5372549, 1, 1,
0.1866983, -0.8171631, 2.709818, 0, 0.5333334, 1, 1,
0.1913364, -0.3191764, 3.3645, 0, 0.5254902, 1, 1,
0.1918079, -1.065414, 3.463997, 0, 0.5215687, 1, 1,
0.1921922, -1.944384, 2.780925, 0, 0.5137255, 1, 1,
0.1932952, 0.03101002, 3.25189, 0, 0.509804, 1, 1,
0.194713, 0.6243149, 0.1482571, 0, 0.5019608, 1, 1,
0.1967771, -1.915605, 1.664955, 0, 0.4941176, 1, 1,
0.1987669, 0.9560059, -0.8658295, 0, 0.4901961, 1, 1,
0.2049873, -0.6609823, 1.14585, 0, 0.4823529, 1, 1,
0.2136477, 1.610463, 0.7838475, 0, 0.4784314, 1, 1,
0.2163556, -1.254989, 3.36168, 0, 0.4705882, 1, 1,
0.2166899, 2.39215, 1.028927, 0, 0.4666667, 1, 1,
0.2175236, 0.8826758, -0.04925342, 0, 0.4588235, 1, 1,
0.2179386, -0.3305405, 3.922693, 0, 0.454902, 1, 1,
0.2261951, -0.6650693, 2.498442, 0, 0.4470588, 1, 1,
0.2280702, -1.668506, 4.192699, 0, 0.4431373, 1, 1,
0.2282647, -0.009581084, -0.2192799, 0, 0.4352941, 1, 1,
0.2297161, -1.17373, 3.737417, 0, 0.4313726, 1, 1,
0.2314042, -1.333344, 2.188264, 0, 0.4235294, 1, 1,
0.233993, 0.7747163, 1.537564, 0, 0.4196078, 1, 1,
0.2340126, -0.6981289, 3.3359, 0, 0.4117647, 1, 1,
0.2352275, 0.279032, 2.0808, 0, 0.4078431, 1, 1,
0.235982, 0.2552236, 0.4706182, 0, 0.4, 1, 1,
0.2361037, -2.026586, 3.616521, 0, 0.3921569, 1, 1,
0.2369528, 0.4302497, 0.7557477, 0, 0.3882353, 1, 1,
0.237236, -0.2451102, 2.215703, 0, 0.3803922, 1, 1,
0.2423453, 0.5140084, -0.04685706, 0, 0.3764706, 1, 1,
0.2492618, 0.1098385, -0.7907935, 0, 0.3686275, 1, 1,
0.2496426, -1.678608, 2.75477, 0, 0.3647059, 1, 1,
0.2502414, 0.8523381, 2.555473, 0, 0.3568628, 1, 1,
0.2567247, 0.7326497, -0.3329136, 0, 0.3529412, 1, 1,
0.2625323, -1.299773, 1.966599, 0, 0.345098, 1, 1,
0.2628947, -0.5601743, 3.433863, 0, 0.3411765, 1, 1,
0.2671646, -0.7079245, 2.954638, 0, 0.3333333, 1, 1,
0.2674969, 0.3115196, -1.859992, 0, 0.3294118, 1, 1,
0.2751748, 0.1563463, 1.557727, 0, 0.3215686, 1, 1,
0.2752729, -0.2213863, 2.367866, 0, 0.3176471, 1, 1,
0.2760512, 0.5253109, 0.6430025, 0, 0.3098039, 1, 1,
0.2938586, -0.222288, 2.923851, 0, 0.3058824, 1, 1,
0.2949997, -1.30139, 2.662873, 0, 0.2980392, 1, 1,
0.2951224, -1.445667, 2.992378, 0, 0.2901961, 1, 1,
0.3003865, 0.4146447, -1.061318, 0, 0.2862745, 1, 1,
0.3046546, -1.12111, 1.327468, 0, 0.2784314, 1, 1,
0.312925, -0.5715719, 2.435922, 0, 0.2745098, 1, 1,
0.3216318, -0.3353348, 1.132194, 0, 0.2666667, 1, 1,
0.3232473, -0.5908343, 4.175008, 0, 0.2627451, 1, 1,
0.3257384, 0.1139234, -0.1609404, 0, 0.254902, 1, 1,
0.3258909, -0.2868001, 5.027326, 0, 0.2509804, 1, 1,
0.3263056, 0.8617968, -0.4375461, 0, 0.2431373, 1, 1,
0.326323, 0.4199069, 0.6829231, 0, 0.2392157, 1, 1,
0.3279314, -1.094533, 3.291209, 0, 0.2313726, 1, 1,
0.3284874, -1.007966, 1.178165, 0, 0.227451, 1, 1,
0.3285319, 0.233529, 1.823413, 0, 0.2196078, 1, 1,
0.3399784, 0.5646559, -0.304696, 0, 0.2156863, 1, 1,
0.3458066, 0.6646494, 0.765772, 0, 0.2078431, 1, 1,
0.3470493, -1.501879, 2.106398, 0, 0.2039216, 1, 1,
0.3472602, 0.02203868, 1.661705, 0, 0.1960784, 1, 1,
0.3504144, 1.008467, -0.3473082, 0, 0.1882353, 1, 1,
0.3529772, -1.87242, 2.757667, 0, 0.1843137, 1, 1,
0.3603334, -1.375718, 0.4429844, 0, 0.1764706, 1, 1,
0.3612695, -0.3474025, 1.754543, 0, 0.172549, 1, 1,
0.3619737, 0.7570392, 0.387425, 0, 0.1647059, 1, 1,
0.3633747, -1.284827, 2.692592, 0, 0.1607843, 1, 1,
0.3636496, -0.01067764, -0.9223065, 0, 0.1529412, 1, 1,
0.3648888, -2.429316, 2.282503, 0, 0.1490196, 1, 1,
0.3697211, -0.4612139, 2.477637, 0, 0.1411765, 1, 1,
0.3710303, -0.3580714, 2.259241, 0, 0.1372549, 1, 1,
0.3747684, -0.4927653, 3.423244, 0, 0.1294118, 1, 1,
0.3757486, 0.6463945, -0.163961, 0, 0.1254902, 1, 1,
0.3838215, 0.04600365, 0.8804234, 0, 0.1176471, 1, 1,
0.3886516, 1.570857, 0.05586524, 0, 0.1137255, 1, 1,
0.3965651, 0.2834368, 0.5531451, 0, 0.1058824, 1, 1,
0.4014556, -1.511861, 2.241615, 0, 0.09803922, 1, 1,
0.4050684, 0.6466291, -0.1389489, 0, 0.09411765, 1, 1,
0.4091512, -0.1790334, 3.062491, 0, 0.08627451, 1, 1,
0.4136181, -1.186472, 4.065234, 0, 0.08235294, 1, 1,
0.4161141, 0.1880573, 1.480699, 0, 0.07450981, 1, 1,
0.4171304, -1.041538, 3.075614, 0, 0.07058824, 1, 1,
0.4185455, -0.3247121, 2.754934, 0, 0.0627451, 1, 1,
0.4213041, 0.6799037, 1.791829, 0, 0.05882353, 1, 1,
0.4226426, -0.5883557, 2.250002, 0, 0.05098039, 1, 1,
0.4237837, -0.1817752, 4.401018, 0, 0.04705882, 1, 1,
0.4290812, -1.623564, 2.755385, 0, 0.03921569, 1, 1,
0.4366642, 0.5865213, 2.546937, 0, 0.03529412, 1, 1,
0.4399063, 0.4966397, 0.2825395, 0, 0.02745098, 1, 1,
0.4426283, 0.0296088, 1.468123, 0, 0.02352941, 1, 1,
0.4427081, 1.189813, 0.1582695, 0, 0.01568628, 1, 1,
0.4448353, -0.574376, 2.254482, 0, 0.01176471, 1, 1,
0.4488092, 0.2612266, 0.8892223, 0, 0.003921569, 1, 1,
0.4494025, -0.931207, 2.22848, 0.003921569, 0, 1, 1,
0.4514677, 0.8020188, 0.3561478, 0.007843138, 0, 1, 1,
0.4588254, -0.6934877, 2.888081, 0.01568628, 0, 1, 1,
0.4664738, -1.049492, 2.176398, 0.01960784, 0, 1, 1,
0.4695382, -1.132907, 2.526256, 0.02745098, 0, 1, 1,
0.469596, 0.8859518, -0.05553864, 0.03137255, 0, 1, 1,
0.4753006, 0.9779101, 0.5269278, 0.03921569, 0, 1, 1,
0.4765613, 1.598702, 1.094782, 0.04313726, 0, 1, 1,
0.4771434, 1.225112, 0.4112834, 0.05098039, 0, 1, 1,
0.47849, 1.55447, 0.9572196, 0.05490196, 0, 1, 1,
0.4834804, -0.7225828, 1.931098, 0.0627451, 0, 1, 1,
0.4883246, 0.3561188, -0.1870591, 0.06666667, 0, 1, 1,
0.4900945, 0.841001, 0.4375015, 0.07450981, 0, 1, 1,
0.4919061, -0.6166378, 4.125345, 0.07843138, 0, 1, 1,
0.4933201, 0.635718, 1.938104, 0.08627451, 0, 1, 1,
0.4966848, -1.31691, 1.692851, 0.09019608, 0, 1, 1,
0.4975865, 0.392293, 0.07320842, 0.09803922, 0, 1, 1,
0.5019418, -0.2224772, 2.349021, 0.1058824, 0, 1, 1,
0.509743, -0.5429543, 1.164106, 0.1098039, 0, 1, 1,
0.5220078, 0.3372641, 1.153404, 0.1176471, 0, 1, 1,
0.5277622, -0.4284727, 1.68041, 0.1215686, 0, 1, 1,
0.5338179, 0.9837187, 0.9991733, 0.1294118, 0, 1, 1,
0.5344384, 0.313823, -0.1442702, 0.1333333, 0, 1, 1,
0.5363685, -0.1993011, 0.7438986, 0.1411765, 0, 1, 1,
0.5379112, -0.1238216, -0.02944072, 0.145098, 0, 1, 1,
0.5432699, -0.4118815, 2.399392, 0.1529412, 0, 1, 1,
0.5446936, 0.1357348, 2.888388, 0.1568628, 0, 1, 1,
0.5453007, 0.4373449, 0.5209379, 0.1647059, 0, 1, 1,
0.5453824, -0.5643987, 1.591314, 0.1686275, 0, 1, 1,
0.5457676, -0.7406598, 2.528265, 0.1764706, 0, 1, 1,
0.5485712, -2.193733, 2.137663, 0.1803922, 0, 1, 1,
0.5510102, 1.646078, 0.1302987, 0.1882353, 0, 1, 1,
0.5548981, -1.554675, 3.81363, 0.1921569, 0, 1, 1,
0.558286, -0.3735115, 2.884238, 0.2, 0, 1, 1,
0.5589704, -0.5003723, 3.190043, 0.2078431, 0, 1, 1,
0.5653729, -2.145376, 0.2500665, 0.2117647, 0, 1, 1,
0.5715325, 0.003271329, 1.061605, 0.2196078, 0, 1, 1,
0.5724616, -1.658514, 3.132913, 0.2235294, 0, 1, 1,
0.5728387, 0.1033516, 2.732192, 0.2313726, 0, 1, 1,
0.5807573, 0.6171418, 0.3279715, 0.2352941, 0, 1, 1,
0.583133, -0.1722575, 1.410316, 0.2431373, 0, 1, 1,
0.5870762, 0.1791936, 2.605306, 0.2470588, 0, 1, 1,
0.5886326, -0.7305194, 0.9576399, 0.254902, 0, 1, 1,
0.5902128, -0.1037793, 1.770937, 0.2588235, 0, 1, 1,
0.600405, -0.2517737, 3.279885, 0.2666667, 0, 1, 1,
0.605684, -1.202564, 1.772699, 0.2705882, 0, 1, 1,
0.6115651, -0.2593149, 1.012461, 0.2784314, 0, 1, 1,
0.6119287, -0.2942283, 1.603864, 0.282353, 0, 1, 1,
0.6146048, -2.316201, 2.185747, 0.2901961, 0, 1, 1,
0.6198016, -0.767182, 2.906619, 0.2941177, 0, 1, 1,
0.6214631, -0.3136285, 1.373031, 0.3019608, 0, 1, 1,
0.6220394, 0.3720616, 1.383778, 0.3098039, 0, 1, 1,
0.6244117, -0.5948375, 0.8031071, 0.3137255, 0, 1, 1,
0.6266417, 0.1719499, -0.2988642, 0.3215686, 0, 1, 1,
0.6305321, -0.8384486, 1.006164, 0.3254902, 0, 1, 1,
0.6316977, -0.3577499, 1.043367, 0.3333333, 0, 1, 1,
0.6361579, 0.4171155, 1.644985, 0.3372549, 0, 1, 1,
0.6409749, -0.7384379, 2.483139, 0.345098, 0, 1, 1,
0.6417392, 0.1839179, 1.066988, 0.3490196, 0, 1, 1,
0.6445672, -0.09231028, 0.1926101, 0.3568628, 0, 1, 1,
0.6517919, -0.68163, 2.184039, 0.3607843, 0, 1, 1,
0.6525795, 0.3904937, 0.7911085, 0.3686275, 0, 1, 1,
0.6529523, 0.597688, 0.1891812, 0.372549, 0, 1, 1,
0.6540003, 0.7058295, -0.4825508, 0.3803922, 0, 1, 1,
0.6609116, 0.8931454, 0.6559232, 0.3843137, 0, 1, 1,
0.6719551, 0.2357718, 2.001668, 0.3921569, 0, 1, 1,
0.6730737, 1.073111, 0.9137253, 0.3960784, 0, 1, 1,
0.6761636, 0.1234275, 2.418645, 0.4039216, 0, 1, 1,
0.6804077, -1.21897, 5.17863, 0.4117647, 0, 1, 1,
0.6816897, -0.388679, 1.902603, 0.4156863, 0, 1, 1,
0.6822908, 0.9753875, -0.4915371, 0.4235294, 0, 1, 1,
0.6825413, 0.7775342, 0.8462927, 0.427451, 0, 1, 1,
0.6882447, -0.1627162, 2.217902, 0.4352941, 0, 1, 1,
0.6884593, 1.268326, 0.588905, 0.4392157, 0, 1, 1,
0.6916101, -0.03875303, 2.153161, 0.4470588, 0, 1, 1,
0.6919316, 2.858998, -0.4518183, 0.4509804, 0, 1, 1,
0.6921858, 1.356817, -0.01437088, 0.4588235, 0, 1, 1,
0.6936863, 0.34167, -0.1538464, 0.4627451, 0, 1, 1,
0.6939131, 0.9445016, -0.6031586, 0.4705882, 0, 1, 1,
0.7008555, 1.093456, -0.7574134, 0.4745098, 0, 1, 1,
0.7020764, 0.7960308, 0.7025774, 0.4823529, 0, 1, 1,
0.7162263, -0.5440228, 1.949875, 0.4862745, 0, 1, 1,
0.7174665, 1.204791, 0.9032101, 0.4941176, 0, 1, 1,
0.7175087, -0.8624871, 2.312838, 0.5019608, 0, 1, 1,
0.7187719, 1.189006, 0.2384396, 0.5058824, 0, 1, 1,
0.7191258, -0.2409822, 2.574316, 0.5137255, 0, 1, 1,
0.7205446, 0.7726273, 1.867108, 0.5176471, 0, 1, 1,
0.7206267, -1.475035, 1.379708, 0.5254902, 0, 1, 1,
0.7218632, -3.014726, 2.722657, 0.5294118, 0, 1, 1,
0.722889, 0.4178027, 1.869789, 0.5372549, 0, 1, 1,
0.7248992, -1.091981, 2.506329, 0.5411765, 0, 1, 1,
0.7264746, 0.2205339, 0.9024321, 0.5490196, 0, 1, 1,
0.7294139, -0.1265198, 0.2696556, 0.5529412, 0, 1, 1,
0.7300863, -1.718247, 5.209778, 0.5607843, 0, 1, 1,
0.7318876, -0.04384742, 2.573125, 0.5647059, 0, 1, 1,
0.7319551, -0.4840447, 3.945079, 0.572549, 0, 1, 1,
0.7328601, 0.4747611, 1.876394, 0.5764706, 0, 1, 1,
0.7394726, 0.3893524, 1.895293, 0.5843138, 0, 1, 1,
0.741514, -0.5851555, 1.118775, 0.5882353, 0, 1, 1,
0.7438139, -0.3044057, 0.8092682, 0.5960785, 0, 1, 1,
0.7452376, 0.6623417, -1.149513, 0.6039216, 0, 1, 1,
0.7461389, -1.768123, 2.638673, 0.6078432, 0, 1, 1,
0.7490293, -0.833418, 3.352919, 0.6156863, 0, 1, 1,
0.7526894, -1.154004, 1.658935, 0.6196079, 0, 1, 1,
0.755156, 0.5484391, 1.625383, 0.627451, 0, 1, 1,
0.75721, -0.8608111, 4.042689, 0.6313726, 0, 1, 1,
0.7675831, 0.07488132, -0.201148, 0.6392157, 0, 1, 1,
0.7679368, 0.6567822, 0.4877458, 0.6431373, 0, 1, 1,
0.7728491, -0.1136614, 0.3447605, 0.6509804, 0, 1, 1,
0.7734731, 0.4523263, 2.692458, 0.654902, 0, 1, 1,
0.7810356, -1.648816, 3.120562, 0.6627451, 0, 1, 1,
0.7900813, -0.4427949, 2.748227, 0.6666667, 0, 1, 1,
0.7903459, -2.036899, 1.575217, 0.6745098, 0, 1, 1,
0.7921467, -0.008359803, 2.074059, 0.6784314, 0, 1, 1,
0.7935616, -0.6783195, 2.340942, 0.6862745, 0, 1, 1,
0.7977967, -0.4279096, -0.167554, 0.6901961, 0, 1, 1,
0.7994416, 0.7321213, 1.882428, 0.6980392, 0, 1, 1,
0.8015285, -0.9489517, 1.559368, 0.7058824, 0, 1, 1,
0.803301, -0.5662362, 5.273974, 0.7098039, 0, 1, 1,
0.8048718, 1.081578, 1.289516, 0.7176471, 0, 1, 1,
0.8119491, -0.7796671, 0.580651, 0.7215686, 0, 1, 1,
0.8188537, 0.1023195, 0.4924629, 0.7294118, 0, 1, 1,
0.8201886, 0.4359185, 1.915672, 0.7333333, 0, 1, 1,
0.8278649, 1.015535, 0.08648217, 0.7411765, 0, 1, 1,
0.8343974, -1.692576, 3.302375, 0.7450981, 0, 1, 1,
0.8493665, -0.393912, 4.121605, 0.7529412, 0, 1, 1,
0.8508321, 0.210449, 1.632514, 0.7568628, 0, 1, 1,
0.8559188, -1.167035, 2.573618, 0.7647059, 0, 1, 1,
0.8628011, 0.4537484, 2.036546, 0.7686275, 0, 1, 1,
0.8646284, -0.38144, 3.315839, 0.7764706, 0, 1, 1,
0.8682471, 0.5294042, 0.1566659, 0.7803922, 0, 1, 1,
0.8705896, 0.2356951, 1.873761, 0.7882353, 0, 1, 1,
0.8727272, -0.03622899, 2.231251, 0.7921569, 0, 1, 1,
0.872816, -1.163899, 4.074747, 0.8, 0, 1, 1,
0.8731829, 1.23773, 1.863477, 0.8078431, 0, 1, 1,
0.8818774, -1.218022, 4.163456, 0.8117647, 0, 1, 1,
0.8911757, 0.6690105, 1.096524, 0.8196079, 0, 1, 1,
0.8984652, 0.9815205, 2.261397, 0.8235294, 0, 1, 1,
0.8987412, 0.8591872, 0.3046587, 0.8313726, 0, 1, 1,
0.9001283, 0.7833976, -0.07957921, 0.8352941, 0, 1, 1,
0.9013376, -0.5263997, 0.6484156, 0.8431373, 0, 1, 1,
0.9044248, 0.5402594, 0.7299409, 0.8470588, 0, 1, 1,
0.9112761, 0.29927, 1.61756, 0.854902, 0, 1, 1,
0.9223388, 1.528311, 0.7778625, 0.8588235, 0, 1, 1,
0.928438, -0.6653174, 3.292943, 0.8666667, 0, 1, 1,
0.9329865, 0.1087871, 2.257765, 0.8705882, 0, 1, 1,
0.935659, 0.174976, 1.903335, 0.8784314, 0, 1, 1,
0.941316, -0.2990775, 1.395368, 0.8823529, 0, 1, 1,
0.9423505, -0.6513787, 4.41591, 0.8901961, 0, 1, 1,
0.9459552, 0.3707498, 0.04221277, 0.8941177, 0, 1, 1,
0.9501222, -1.285772, 2.903775, 0.9019608, 0, 1, 1,
0.9610838, -2.000101, 3.504235, 0.9098039, 0, 1, 1,
0.9747543, 0.6675288, 0.01297635, 0.9137255, 0, 1, 1,
0.9766133, 1.851837, 0.3846599, 0.9215686, 0, 1, 1,
0.9835832, 0.2876676, 3.523439, 0.9254902, 0, 1, 1,
0.9897259, 0.2140899, 1.939327, 0.9333333, 0, 1, 1,
0.9925089, -0.2250224, 2.242873, 0.9372549, 0, 1, 1,
0.9931335, 0.467196, 1.859299, 0.945098, 0, 1, 1,
1.001036, -0.3245746, 2.307482, 0.9490196, 0, 1, 1,
1.001434, -1.244766, 4.696942, 0.9568627, 0, 1, 1,
1.005516, 0.3807228, 1.185017, 0.9607843, 0, 1, 1,
1.008408, 0.6056311, 1.186514, 0.9686275, 0, 1, 1,
1.010304, 2.649962, -0.7562146, 0.972549, 0, 1, 1,
1.01574, 0.064722, 3.000581, 0.9803922, 0, 1, 1,
1.016615, -0.6826395, 1.386443, 0.9843137, 0, 1, 1,
1.026654, 1.247991, -0.8036583, 0.9921569, 0, 1, 1,
1.027053, -0.4253806, 1.31368, 0.9960784, 0, 1, 1,
1.033806, -0.9185424, 1.689, 1, 0, 0.9960784, 1,
1.034644, 0.6078662, 2.145542, 1, 0, 0.9882353, 1,
1.037021, -0.08256572, 1.052445, 1, 0, 0.9843137, 1,
1.039824, 0.9927371, 0.3032154, 1, 0, 0.9764706, 1,
1.041547, -0.3294303, 2.378071, 1, 0, 0.972549, 1,
1.044698, -2.932226, 2.097693, 1, 0, 0.9647059, 1,
1.044916, -1.015631, 2.226282, 1, 0, 0.9607843, 1,
1.047868, 0.9110292, 0.9908312, 1, 0, 0.9529412, 1,
1.059722, -0.2308497, 1.290249, 1, 0, 0.9490196, 1,
1.059769, -0.06598286, 1.519687, 1, 0, 0.9411765, 1,
1.061384, -0.1993454, 1.327055, 1, 0, 0.9372549, 1,
1.062303, -0.5280676, 2.945992, 1, 0, 0.9294118, 1,
1.067223, -0.7448775, 1.010511, 1, 0, 0.9254902, 1,
1.069554, 0.596203, 0.6642111, 1, 0, 0.9176471, 1,
1.076311, 0.04006038, 1.495932, 1, 0, 0.9137255, 1,
1.079425, 0.8913491, 0.7858005, 1, 0, 0.9058824, 1,
1.081092, 0.2514383, 0.005752801, 1, 0, 0.9019608, 1,
1.08486, 0.2966609, 0.8591921, 1, 0, 0.8941177, 1,
1.085977, -0.4860548, 2.63258, 1, 0, 0.8862745, 1,
1.089558, -0.4087068, 2.01244, 1, 0, 0.8823529, 1,
1.091582, -1.03053, 2.340701, 1, 0, 0.8745098, 1,
1.104279, 2.4412, 0.4569047, 1, 0, 0.8705882, 1,
1.109263, 1.221297, 2.101579, 1, 0, 0.8627451, 1,
1.110287, 1.248588, 0.1527009, 1, 0, 0.8588235, 1,
1.112275, -1.979451, 2.0065, 1, 0, 0.8509804, 1,
1.112334, -0.3811091, 0.07436364, 1, 0, 0.8470588, 1,
1.116279, -1.046036, 1.861105, 1, 0, 0.8392157, 1,
1.122606, -0.06329775, 1.037242, 1, 0, 0.8352941, 1,
1.128305, -1.346728, 2.070742, 1, 0, 0.827451, 1,
1.132308, 2.332196, -0.2557391, 1, 0, 0.8235294, 1,
1.133531, 0.2478632, 0.1715459, 1, 0, 0.8156863, 1,
1.13468, 1.501242, 0.5958526, 1, 0, 0.8117647, 1,
1.13843, 0.1446235, 2.845344, 1, 0, 0.8039216, 1,
1.140649, -0.06004544, 0.6181289, 1, 0, 0.7960784, 1,
1.142001, -0.3758309, -0.164069, 1, 0, 0.7921569, 1,
1.161034, 0.8184939, 1.95769, 1, 0, 0.7843137, 1,
1.161295, -0.9101461, 0.7918409, 1, 0, 0.7803922, 1,
1.167533, 0.1266416, 1.201846, 1, 0, 0.772549, 1,
1.172114, 0.02190616, 1.363541, 1, 0, 0.7686275, 1,
1.173352, -0.06853765, -0.338838, 1, 0, 0.7607843, 1,
1.175187, 1.267123, 1.34, 1, 0, 0.7568628, 1,
1.179775, -1.724853, 2.109795, 1, 0, 0.7490196, 1,
1.180241, -0.50148, 3.54315, 1, 0, 0.7450981, 1,
1.181104, 0.460684, 0.3344981, 1, 0, 0.7372549, 1,
1.184418, 0.5093898, 0.1533971, 1, 0, 0.7333333, 1,
1.216414, -0.7694222, 0.5517418, 1, 0, 0.7254902, 1,
1.220486, -0.1865058, 1.788374, 1, 0, 0.7215686, 1,
1.229105, -1.543454, 3.926471, 1, 0, 0.7137255, 1,
1.230369, 0.8798234, 1.28345, 1, 0, 0.7098039, 1,
1.230596, 0.4036548, 0.7659523, 1, 0, 0.7019608, 1,
1.231542, 1.014226, -1.630955, 1, 0, 0.6941177, 1,
1.235181, 0.4627362, 2.648307, 1, 0, 0.6901961, 1,
1.241858, -0.09697554, 1.186407, 1, 0, 0.682353, 1,
1.244378, -0.8629388, 1.635142, 1, 0, 0.6784314, 1,
1.247486, 1.377277, 0.7154404, 1, 0, 0.6705883, 1,
1.248719, -0.05141403, 1.730041, 1, 0, 0.6666667, 1,
1.262951, -1.203656, 0.550707, 1, 0, 0.6588235, 1,
1.2665, -0.9512798, 3.191263, 1, 0, 0.654902, 1,
1.266571, 0.3483222, 2.623228, 1, 0, 0.6470588, 1,
1.270318, 0.7735834, 0.5866019, 1, 0, 0.6431373, 1,
1.27153, -0.890606, 0.8194219, 1, 0, 0.6352941, 1,
1.281365, -0.9645002, 2.900211, 1, 0, 0.6313726, 1,
1.28547, -0.6412309, 2.581956, 1, 0, 0.6235294, 1,
1.285944, 0.6645945, 0.8763382, 1, 0, 0.6196079, 1,
1.295276, 0.8854217, 2.901562, 1, 0, 0.6117647, 1,
1.297886, 0.4690748, 0.8463198, 1, 0, 0.6078432, 1,
1.298555, 1.27709, -0.288392, 1, 0, 0.6, 1,
1.298738, 0.6759828, -0.0527864, 1, 0, 0.5921569, 1,
1.30514, 0.0004047439, 1.438904, 1, 0, 0.5882353, 1,
1.310576, 0.8178427, 0.1642457, 1, 0, 0.5803922, 1,
1.316723, -1.621166, 4.786176, 1, 0, 0.5764706, 1,
1.31709, -0.2330995, 1.702271, 1, 0, 0.5686275, 1,
1.319786, -2.056573, 3.604185, 1, 0, 0.5647059, 1,
1.321772, 0.9223154, 2.341618, 1, 0, 0.5568628, 1,
1.323815, -0.374447, 2.716512, 1, 0, 0.5529412, 1,
1.325247, 0.5394552, 0.5992997, 1, 0, 0.5450981, 1,
1.326179, -1.243502, 1.766008, 1, 0, 0.5411765, 1,
1.331688, -0.8278523, 2.670082, 1, 0, 0.5333334, 1,
1.33932, 1.459007, 1.48653, 1, 0, 0.5294118, 1,
1.340212, 0.1994718, 0.4073268, 1, 0, 0.5215687, 1,
1.3412, 0.370829, 0.1728645, 1, 0, 0.5176471, 1,
1.347781, -1.924114, 3.842641, 1, 0, 0.509804, 1,
1.379063, -0.5963797, 1.390337, 1, 0, 0.5058824, 1,
1.379661, -0.3617442, 1.513839, 1, 0, 0.4980392, 1,
1.380625, -0.2253648, 1.60858, 1, 0, 0.4901961, 1,
1.395349, 0.6216987, 1.611361, 1, 0, 0.4862745, 1,
1.395884, -1.470602, 1.161805, 1, 0, 0.4784314, 1,
1.411334, 0.5111066, 2.737066, 1, 0, 0.4745098, 1,
1.426987, -2.185126, 2.590282, 1, 0, 0.4666667, 1,
1.430213, 0.1971488, 2.496782, 1, 0, 0.4627451, 1,
1.43364, 0.8294767, 0.1668132, 1, 0, 0.454902, 1,
1.435902, -0.8433723, 1.819349, 1, 0, 0.4509804, 1,
1.438872, 1.71745, 0.60844, 1, 0, 0.4431373, 1,
1.442359, -0.5914729, 2.179145, 1, 0, 0.4392157, 1,
1.447363, -1.616124, 1.990791, 1, 0, 0.4313726, 1,
1.452415, 1.794965, 0.8670216, 1, 0, 0.427451, 1,
1.462059, -1.447433, 1.110625, 1, 0, 0.4196078, 1,
1.462525, 0.3025567, 1.186703, 1, 0, 0.4156863, 1,
1.493131, -0.3909713, 0.7940626, 1, 0, 0.4078431, 1,
1.498382, 0.1484123, 3.149125, 1, 0, 0.4039216, 1,
1.538047, -0.8059815, 1.834524, 1, 0, 0.3960784, 1,
1.544122, 0.8063178, 1.258884, 1, 0, 0.3882353, 1,
1.55245, -1.226494, 2.992531, 1, 0, 0.3843137, 1,
1.554896, 1.344246, -0.864421, 1, 0, 0.3764706, 1,
1.559586, -1.250594, 1.076307, 1, 0, 0.372549, 1,
1.565961, -0.9755005, 3.031997, 1, 0, 0.3647059, 1,
1.581648, -0.1108828, 1.547903, 1, 0, 0.3607843, 1,
1.587895, -0.05203112, 2.061422, 1, 0, 0.3529412, 1,
1.59313, 0.8258087, 0.3581026, 1, 0, 0.3490196, 1,
1.601468, 0.1349721, -0.7122092, 1, 0, 0.3411765, 1,
1.607896, -0.2840162, 2.348935, 1, 0, 0.3372549, 1,
1.614474, 0.2100043, 4.371796, 1, 0, 0.3294118, 1,
1.618029, -1.69434, 3.616006, 1, 0, 0.3254902, 1,
1.620849, 1.310816, 2.274495, 1, 0, 0.3176471, 1,
1.622951, 0.7047257, 1.397019, 1, 0, 0.3137255, 1,
1.629825, 0.3595775, 1.04197, 1, 0, 0.3058824, 1,
1.634516, -0.5596999, 3.391144, 1, 0, 0.2980392, 1,
1.664736, -0.3526585, 0.9566908, 1, 0, 0.2941177, 1,
1.673984, -1.437575, 2.304249, 1, 0, 0.2862745, 1,
1.695001, -0.1282542, 3.90304, 1, 0, 0.282353, 1,
1.695299, 1.765238, 0.881054, 1, 0, 0.2745098, 1,
1.709103, 0.6908236, 2.155992, 1, 0, 0.2705882, 1,
1.715139, 2.030136, 0.2031122, 1, 0, 0.2627451, 1,
1.758115, 0.8076792, 2.000843, 1, 0, 0.2588235, 1,
1.761471, 0.7913013, 0.9509317, 1, 0, 0.2509804, 1,
1.797128, -1.112278, 1.509205, 1, 0, 0.2470588, 1,
1.820983, -1.1109, 3.690682, 1, 0, 0.2392157, 1,
1.866237, -1.11706, 0.9313529, 1, 0, 0.2352941, 1,
1.884672, -0.1123781, 1.89793, 1, 0, 0.227451, 1,
1.90928, 0.5227036, 3.164666, 1, 0, 0.2235294, 1,
1.928048, -0.3072421, 1.789545, 1, 0, 0.2156863, 1,
1.932477, 1.01802, 0.06529385, 1, 0, 0.2117647, 1,
1.937975, -1.041459, 3.053828, 1, 0, 0.2039216, 1,
1.948036, -0.9223102, 2.805896, 1, 0, 0.1960784, 1,
1.951197, 0.4096649, -0.6158999, 1, 0, 0.1921569, 1,
1.956614, 1.122378, -2.160386, 1, 0, 0.1843137, 1,
1.967874, -0.1339182, 1.522903, 1, 0, 0.1803922, 1,
1.978031, 1.56966, 1.41262, 1, 0, 0.172549, 1,
1.999743, -0.479229, 2.484807, 1, 0, 0.1686275, 1,
2.000136, -0.159295, 3.034099, 1, 0, 0.1607843, 1,
2.019381, -1.011518, 1.753752, 1, 0, 0.1568628, 1,
2.028059, 0.6592993, 0.5608811, 1, 0, 0.1490196, 1,
2.028376, -0.6194639, 1.943515, 1, 0, 0.145098, 1,
2.049363, -0.4366548, 3.06493, 1, 0, 0.1372549, 1,
2.06787, 1.367234, 2.733917, 1, 0, 0.1333333, 1,
2.071809, -0.01252333, 2.278549, 1, 0, 0.1254902, 1,
2.092807, 0.897112, 0.727357, 1, 0, 0.1215686, 1,
2.105361, 0.9579709, 0.9003872, 1, 0, 0.1137255, 1,
2.112114, -0.8503144, 2.200495, 1, 0, 0.1098039, 1,
2.119579, 0.2172713, 1.745526, 1, 0, 0.1019608, 1,
2.177797, -2.270523, 2.220934, 1, 0, 0.09411765, 1,
2.181578, -1.271745, -0.07173364, 1, 0, 0.09019608, 1,
2.194114, 0.3203392, 1.429519, 1, 0, 0.08235294, 1,
2.19843, 0.274974, 0.9865344, 1, 0, 0.07843138, 1,
2.217908, -0.2488655, 1.589132, 1, 0, 0.07058824, 1,
2.284975, 0.3311396, 1.77064, 1, 0, 0.06666667, 1,
2.305592, 1.091748, 0.9939756, 1, 0, 0.05882353, 1,
2.347632, -1.235089, 3.901008, 1, 0, 0.05490196, 1,
2.379941, 0.5322885, 0.2113258, 1, 0, 0.04705882, 1,
2.450521, -0.9077024, 1.639218, 1, 0, 0.04313726, 1,
2.465664, -1.208361, 1.614486, 1, 0, 0.03529412, 1,
2.64488, 0.6426445, -0.3379484, 1, 0, 0.03137255, 1,
2.934703, -0.4827645, 1.488539, 1, 0, 0.02352941, 1,
2.963464, 0.116801, 1.523932, 1, 0, 0.01960784, 1,
3.034508, 0.5857069, 1.211666, 1, 0, 0.01176471, 1,
3.364953, 0.822664, 0.5213366, 1, 0, 0.007843138, 1
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
0.2067692, -4.010323, -7.438995, 0, -0.5, 0.5, 0.5,
0.2067692, -4.010323, -7.438995, 1, -0.5, 0.5, 0.5,
0.2067692, -4.010323, -7.438995, 1, 1.5, 0.5, 0.5,
0.2067692, -4.010323, -7.438995, 0, 1.5, 0.5, 0.5
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
-4.022039, -0.07786441, -7.438995, 0, -0.5, 0.5, 0.5,
-4.022039, -0.07786441, -7.438995, 1, -0.5, 0.5, 0.5,
-4.022039, -0.07786441, -7.438995, 1, 1.5, 0.5, 0.5,
-4.022039, -0.07786441, -7.438995, 0, 1.5, 0.5, 0.5
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
-4.022039, -4.010323, -0.1612413, 0, -0.5, 0.5, 0.5,
-4.022039, -4.010323, -0.1612413, 1, -0.5, 0.5, 0.5,
-4.022039, -4.010323, -0.1612413, 1, 1.5, 0.5, 0.5,
-4.022039, -4.010323, -0.1612413, 0, 1.5, 0.5, 0.5
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
-2, -3.102832, -5.759513,
3, -3.102832, -5.759513,
-2, -3.102832, -5.759513,
-2, -3.254081, -6.039427,
-1, -3.102832, -5.759513,
-1, -3.254081, -6.039427,
0, -3.102832, -5.759513,
0, -3.254081, -6.039427,
1, -3.102832, -5.759513,
1, -3.254081, -6.039427,
2, -3.102832, -5.759513,
2, -3.254081, -6.039427,
3, -3.102832, -5.759513,
3, -3.254081, -6.039427
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
-2, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
-2, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
-2, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
-2, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5,
-1, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
-1, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
-1, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
-1, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5,
0, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
0, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
0, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
0, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5,
1, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
1, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
1, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
1, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5,
2, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
2, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
2, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
2, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5,
3, -3.556577, -6.599254, 0, -0.5, 0.5, 0.5,
3, -3.556577, -6.599254, 1, -0.5, 0.5, 0.5,
3, -3.556577, -6.599254, 1, 1.5, 0.5, 0.5,
3, -3.556577, -6.599254, 0, 1.5, 0.5, 0.5
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
-3.04616, -3, -5.759513,
-3.04616, 2, -5.759513,
-3.04616, -3, -5.759513,
-3.208807, -3, -6.039427,
-3.04616, -2, -5.759513,
-3.208807, -2, -6.039427,
-3.04616, -1, -5.759513,
-3.208807, -1, -6.039427,
-3.04616, 0, -5.759513,
-3.208807, 0, -6.039427,
-3.04616, 1, -5.759513,
-3.208807, 1, -6.039427,
-3.04616, 2, -5.759513,
-3.208807, 2, -6.039427
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
-3.5341, -3, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, -3, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, -3, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, -3, -6.599254, 0, 1.5, 0.5, 0.5,
-3.5341, -2, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, -2, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, -2, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, -2, -6.599254, 0, 1.5, 0.5, 0.5,
-3.5341, -1, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, -1, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, -1, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, -1, -6.599254, 0, 1.5, 0.5, 0.5,
-3.5341, 0, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, 0, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, 0, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, 0, -6.599254, 0, 1.5, 0.5, 0.5,
-3.5341, 1, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, 1, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, 1, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, 1, -6.599254, 0, 1.5, 0.5, 0.5,
-3.5341, 2, -6.599254, 0, -0.5, 0.5, 0.5,
-3.5341, 2, -6.599254, 1, -0.5, 0.5, 0.5,
-3.5341, 2, -6.599254, 1, 1.5, 0.5, 0.5,
-3.5341, 2, -6.599254, 0, 1.5, 0.5, 0.5
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
-3.04616, -3.102832, -4,
-3.04616, -3.102832, 4,
-3.04616, -3.102832, -4,
-3.208807, -3.254081, -4,
-3.04616, -3.102832, -2,
-3.208807, -3.254081, -2,
-3.04616, -3.102832, 0,
-3.208807, -3.254081, 0,
-3.04616, -3.102832, 2,
-3.208807, -3.254081, 2,
-3.04616, -3.102832, 4,
-3.208807, -3.254081, 4
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
-3.5341, -3.556577, -4, 0, -0.5, 0.5, 0.5,
-3.5341, -3.556577, -4, 1, -0.5, 0.5, 0.5,
-3.5341, -3.556577, -4, 1, 1.5, 0.5, 0.5,
-3.5341, -3.556577, -4, 0, 1.5, 0.5, 0.5,
-3.5341, -3.556577, -2, 0, -0.5, 0.5, 0.5,
-3.5341, -3.556577, -2, 1, -0.5, 0.5, 0.5,
-3.5341, -3.556577, -2, 1, 1.5, 0.5, 0.5,
-3.5341, -3.556577, -2, 0, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 0, 0, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 0, 1, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 0, 1, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 0, 0, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 2, 0, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 2, 1, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 2, 1, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 2, 0, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 4, 0, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 4, 1, -0.5, 0.5, 0.5,
-3.5341, -3.556577, 4, 1, 1.5, 0.5, 0.5,
-3.5341, -3.556577, 4, 0, 1.5, 0.5, 0.5
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
-3.04616, -3.102832, -5.759513,
-3.04616, 2.947104, -5.759513,
-3.04616, -3.102832, 5.437031,
-3.04616, 2.947104, 5.437031,
-3.04616, -3.102832, -5.759513,
-3.04616, -3.102832, 5.437031,
-3.04616, 2.947104, -5.759513,
-3.04616, 2.947104, 5.437031,
-3.04616, -3.102832, -5.759513,
3.459699, -3.102832, -5.759513,
-3.04616, -3.102832, 5.437031,
3.459699, -3.102832, 5.437031,
-3.04616, 2.947104, -5.759513,
3.459699, 2.947104, -5.759513,
-3.04616, 2.947104, 5.437031,
3.459699, 2.947104, 5.437031,
3.459699, -3.102832, -5.759513,
3.459699, 2.947104, -5.759513,
3.459699, -3.102832, 5.437031,
3.459699, 2.947104, 5.437031,
3.459699, -3.102832, -5.759513,
3.459699, -3.102832, 5.437031,
3.459699, 2.947104, -5.759513,
3.459699, 2.947104, 5.437031
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
var radius = 7.632197;
var distance = 33.9565;
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
mvMatrix.translate( -0.2067692, 0.07786441, 0.1612413 );
mvMatrix.scale( 1.268408, 1.363995, 0.7370204 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9565);
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
cyclopropyloxycarbon<-read.table("cyclopropyloxycarbon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclopropyloxycarbon$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
y<-cyclopropyloxycarbon$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
```

```r
z<-cyclopropyloxycarbon$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropyloxycarbon' not found
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
-2.951415, -1.826149, -3.109012, 0, 0, 1, 1, 1,
-2.911284, -0.4738327, -0.3500378, 1, 0, 0, 1, 1,
-2.747587, -0.8079295, -1.519943, 1, 0, 0, 1, 1,
-2.435328, 0.1972509, -3.708351, 1, 0, 0, 1, 1,
-2.371439, 0.5979776, -1.571742, 1, 0, 0, 1, 1,
-2.367554, -0.4319883, -0.8258621, 1, 0, 0, 1, 1,
-2.346057, -1.218198, -4.34146, 0, 0, 0, 1, 1,
-2.307509, -0.5082704, -0.9287229, 0, 0, 0, 1, 1,
-2.235782, -0.9594357, -2.368273, 0, 0, 0, 1, 1,
-2.210626, -0.9001116, -2.513716, 0, 0, 0, 1, 1,
-2.194762, -0.5325382, -1.709798, 0, 0, 0, 1, 1,
-2.194639, -1.209782, -1.44046, 0, 0, 0, 1, 1,
-2.156283, 0.1183273, -0.4918274, 0, 0, 0, 1, 1,
-2.143468, -0.4962604, -1.635543, 1, 1, 1, 1, 1,
-2.128465, -0.4324445, -1.343183, 1, 1, 1, 1, 1,
-2.107749, -0.05303632, -0.5944948, 1, 1, 1, 1, 1,
-2.058768, -0.5073641, -0.8397602, 1, 1, 1, 1, 1,
-2.049274, -0.1086877, -0.2890874, 1, 1, 1, 1, 1,
-2.038819, -1.76534, -2.960806, 1, 1, 1, 1, 1,
-2.01916, 0.4501601, -2.081402, 1, 1, 1, 1, 1,
-2.006338, -0.2183542, 0.9083552, 1, 1, 1, 1, 1,
-1.962026, -1.670099, -2.30835, 1, 1, 1, 1, 1,
-1.946822, -1.210222, -0.8562139, 1, 1, 1, 1, 1,
-1.945864, 0.9824327, -1.123825, 1, 1, 1, 1, 1,
-1.941914, 0.6227453, -2.191331, 1, 1, 1, 1, 1,
-1.940316, 0.6643707, -1.61733, 1, 1, 1, 1, 1,
-1.937525, 0.5089367, -3.292994, 1, 1, 1, 1, 1,
-1.901608, 0.09078642, -0.7523791, 1, 1, 1, 1, 1,
-1.890873, 0.3014783, -2.462826, 0, 0, 1, 1, 1,
-1.864003, 0.4382055, -2.23624, 1, 0, 0, 1, 1,
-1.857844, 0.1252249, -3.214137, 1, 0, 0, 1, 1,
-1.830803, 0.465383, -0.7487582, 1, 0, 0, 1, 1,
-1.821133, 0.2890605, -2.719033, 1, 0, 0, 1, 1,
-1.815544, -0.8930516, -2.436514, 1, 0, 0, 1, 1,
-1.797156, 0.3134576, -0.6573892, 0, 0, 0, 1, 1,
-1.749471, 1.560304, -0.3348417, 0, 0, 0, 1, 1,
-1.740968, -0.9546594, -3.881617, 0, 0, 0, 1, 1,
-1.740682, 0.1384724, 0.3185809, 0, 0, 0, 1, 1,
-1.739042, -1.468356, 0.2247811, 0, 0, 0, 1, 1,
-1.72552, 0.3339422, -1.035477, 0, 0, 0, 1, 1,
-1.711033, 0.2372623, -1.640864, 0, 0, 0, 1, 1,
-1.703138, 0.7159128, -1.198155, 1, 1, 1, 1, 1,
-1.672199, -1.729015, -2.302734, 1, 1, 1, 1, 1,
-1.66552, 0.3370098, 0.4788908, 1, 1, 1, 1, 1,
-1.611268, 0.6881453, -0.2344232, 1, 1, 1, 1, 1,
-1.603978, 0.9073468, -0.5482538, 1, 1, 1, 1, 1,
-1.594212, -1.117877, -1.658544, 1, 1, 1, 1, 1,
-1.589094, -0.09040653, -1.298692, 1, 1, 1, 1, 1,
-1.568922, 0.01419799, -3.243568, 1, 1, 1, 1, 1,
-1.54994, 0.8505248, -1.700791, 1, 1, 1, 1, 1,
-1.532301, 0.3947829, -1.159085, 1, 1, 1, 1, 1,
-1.523913, -0.2244401, -1.411509, 1, 1, 1, 1, 1,
-1.513774, -0.2986419, -0.4127015, 1, 1, 1, 1, 1,
-1.494663, 0.8805143, 0.8848909, 1, 1, 1, 1, 1,
-1.493598, 0.7035448, -2.878386, 1, 1, 1, 1, 1,
-1.491059, -0.6885967, -3.086714, 1, 1, 1, 1, 1,
-1.482653, 0.02509101, -1.250622, 0, 0, 1, 1, 1,
-1.467883, -0.6411752, -1.678359, 1, 0, 0, 1, 1,
-1.46495, 2.016682, 1.109196, 1, 0, 0, 1, 1,
-1.455958, 2.424469, 0.5183519, 1, 0, 0, 1, 1,
-1.453213, 2.346527, -0.9901684, 1, 0, 0, 1, 1,
-1.453038, 0.6902155, -0.9885671, 1, 0, 0, 1, 1,
-1.452983, -0.4070764, -2.399249, 0, 0, 0, 1, 1,
-1.452769, 2.219352, 0.04898997, 0, 0, 0, 1, 1,
-1.451688, -0.4619675, -1.867309, 0, 0, 0, 1, 1,
-1.44377, -0.1147632, -2.346616, 0, 0, 0, 1, 1,
-1.440169, 0.2207668, -1.717177, 0, 0, 0, 1, 1,
-1.429918, -0.6431751, -0.3175421, 0, 0, 0, 1, 1,
-1.427869, -2.306364, -2.436756, 0, 0, 0, 1, 1,
-1.427664, 1.554696, -0.899708, 1, 1, 1, 1, 1,
-1.413828, -2.452049, -1.29195, 1, 1, 1, 1, 1,
-1.4107, -0.3755602, -2.471253, 1, 1, 1, 1, 1,
-1.393878, 0.4473635, -1.017769, 1, 1, 1, 1, 1,
-1.391948, -0.7113109, -1.102055, 1, 1, 1, 1, 1,
-1.391536, 1.345446, -1.177565, 1, 1, 1, 1, 1,
-1.391486, -0.08720986, -2.224804, 1, 1, 1, 1, 1,
-1.37175, 0.4972682, 0.5125145, 1, 1, 1, 1, 1,
-1.371393, -0.8734602, -0.01929185, 1, 1, 1, 1, 1,
-1.368611, 0.5016287, -1.305882, 1, 1, 1, 1, 1,
-1.367119, 1.109494, -0.1094464, 1, 1, 1, 1, 1,
-1.362522, 0.3219839, -0.772862, 1, 1, 1, 1, 1,
-1.359169, -1.334499, -1.393853, 1, 1, 1, 1, 1,
-1.352337, 0.2730033, -0.3878786, 1, 1, 1, 1, 1,
-1.349928, -0.8022665, -2.704953, 1, 1, 1, 1, 1,
-1.347957, -0.7021031, -1.153783, 0, 0, 1, 1, 1,
-1.324002, -0.838919, -2.183091, 1, 0, 0, 1, 1,
-1.323627, 0.8727626, -1.56214, 1, 0, 0, 1, 1,
-1.32296, -1.652361, -2.757414, 1, 0, 0, 1, 1,
-1.317789, 1.148954, -1.727133, 1, 0, 0, 1, 1,
-1.317644, 0.6023958, -0.7565702, 1, 0, 0, 1, 1,
-1.315137, 0.5272085, -1.879901, 0, 0, 0, 1, 1,
-1.308598, 0.6288501, -1.498268, 0, 0, 0, 1, 1,
-1.298383, 2.076575, 0.8974028, 0, 0, 0, 1, 1,
-1.296691, 1.871584, -0.8027832, 0, 0, 0, 1, 1,
-1.287368, 0.6768069, 0.03160247, 0, 0, 0, 1, 1,
-1.283043, 1.843973, -1.198419, 0, 0, 0, 1, 1,
-1.276969, 0.3829104, -1.449631, 0, 0, 0, 1, 1,
-1.272717, 0.02570346, -1.457455, 1, 1, 1, 1, 1,
-1.272243, -1.384577, -2.450192, 1, 1, 1, 1, 1,
-1.269723, -1.643102, -2.70446, 1, 1, 1, 1, 1,
-1.263592, 0.4665876, -2.518986, 1, 1, 1, 1, 1,
-1.251907, 0.8758239, 0.7779921, 1, 1, 1, 1, 1,
-1.251557, 1.400977, -2.7647, 1, 1, 1, 1, 1,
-1.240431, 2.030606, -0.1328096, 1, 1, 1, 1, 1,
-1.231543, -0.3985785, -3.473794, 1, 1, 1, 1, 1,
-1.218114, -0.4428795, -1.592179, 1, 1, 1, 1, 1,
-1.209489, 0.6788296, -1.016679, 1, 1, 1, 1, 1,
-1.207582, 0.3117384, -1.113046, 1, 1, 1, 1, 1,
-1.205512, -0.4730315, -3.042942, 1, 1, 1, 1, 1,
-1.205308, -0.4441697, -2.12012, 1, 1, 1, 1, 1,
-1.203933, 0.1646191, -2.000082, 1, 1, 1, 1, 1,
-1.202554, -0.4505341, -1.58302, 1, 1, 1, 1, 1,
-1.202087, -0.560915, -1.734525, 0, 0, 1, 1, 1,
-1.200469, 0.7364879, -0.9141926, 1, 0, 0, 1, 1,
-1.191006, -0.007849582, -1.100896, 1, 0, 0, 1, 1,
-1.188603, 1.602407, -0.4734274, 1, 0, 0, 1, 1,
-1.186043, 1.116653, 1.501636, 1, 0, 0, 1, 1,
-1.181255, 0.1387015, -1.897286, 1, 0, 0, 1, 1,
-1.180952, -0.5383711, 0.407119, 0, 0, 0, 1, 1,
-1.180241, 0.7496434, 1.319345, 0, 0, 0, 1, 1,
-1.177382, 2.099567, 0.9703135, 0, 0, 0, 1, 1,
-1.1762, -0.9776739, -2.316459, 0, 0, 0, 1, 1,
-1.150763, -0.4382389, -3.157051, 0, 0, 0, 1, 1,
-1.150269, -1.011599, -4.095648, 0, 0, 0, 1, 1,
-1.146327, -0.6386791, -1.485104, 0, 0, 0, 1, 1,
-1.137637, 1.582443, -1.834987, 1, 1, 1, 1, 1,
-1.136315, -1.088536, -0.7406746, 1, 1, 1, 1, 1,
-1.134907, 2.045945, 0.6902804, 1, 1, 1, 1, 1,
-1.13484, -1.062096, -2.582791, 1, 1, 1, 1, 1,
-1.130393, 0.4421475, -2.14915, 1, 1, 1, 1, 1,
-1.129092, 0.2737921, -1.403863, 1, 1, 1, 1, 1,
-1.129086, 1.401736, -0.9182752, 1, 1, 1, 1, 1,
-1.124397, 0.1697854, -0.7592288, 1, 1, 1, 1, 1,
-1.11914, -0.2371396, -1.998227, 1, 1, 1, 1, 1,
-1.11818, -0.1421781, -1.678491, 1, 1, 1, 1, 1,
-1.117732, 2.075905, -0.2016777, 1, 1, 1, 1, 1,
-1.11699, 1.587507, -0.04036078, 1, 1, 1, 1, 1,
-1.115662, 1.768805, -2.185076, 1, 1, 1, 1, 1,
-1.109164, -0.2389237, -3.086759, 1, 1, 1, 1, 1,
-1.107944, -0.3778531, -3.467469, 1, 1, 1, 1, 1,
-1.094954, -1.232063, -2.474298, 0, 0, 1, 1, 1,
-1.089884, -0.4635474, -1.438975, 1, 0, 0, 1, 1,
-1.088808, -0.8424082, -2.080933, 1, 0, 0, 1, 1,
-1.08396, -0.7324595, -3.181278, 1, 0, 0, 1, 1,
-1.083576, -0.5647929, -4.480975, 1, 0, 0, 1, 1,
-1.078569, 0.8987702, -0.8202528, 1, 0, 0, 1, 1,
-1.073856, -1.188004, -4.652323, 0, 0, 0, 1, 1,
-1.070611, 0.6184037, -0.3816049, 0, 0, 0, 1, 1,
-1.054264, 0.7627595, 0.09245542, 0, 0, 0, 1, 1,
-1.052789, 0.4389851, -2.428017, 0, 0, 0, 1, 1,
-1.04625, 0.07540309, -1.561167, 0, 0, 0, 1, 1,
-1.044603, 0.7669936, -0.7497087, 0, 0, 0, 1, 1,
-1.041741, 0.4596644, 0.4402192, 0, 0, 0, 1, 1,
-1.037215, 0.2814878, -0.3606686, 1, 1, 1, 1, 1,
-1.027457, 0.3025614, -1.449863, 1, 1, 1, 1, 1,
-1.017376, -1.089496, -5.099793, 1, 1, 1, 1, 1,
-1.009817, 0.4785317, -1.68219, 1, 1, 1, 1, 1,
-1.008484, 2.136394, -0.897698, 1, 1, 1, 1, 1,
-1.004574, 0.4053737, -1.048129, 1, 1, 1, 1, 1,
-0.9932483, 0.3145436, -1.99892, 1, 1, 1, 1, 1,
-0.9930637, -1.531188, -2.33172, 1, 1, 1, 1, 1,
-0.9917368, 0.07951146, -2.18052, 1, 1, 1, 1, 1,
-0.9913864, 0.4379683, -0.1737709, 1, 1, 1, 1, 1,
-0.9875079, 0.1270656, -1.237446, 1, 1, 1, 1, 1,
-0.9765878, 0.8670453, -0.04859718, 1, 1, 1, 1, 1,
-0.9764336, 1.174543, -0.5443274, 1, 1, 1, 1, 1,
-0.9755552, -0.7209504, -3.459827, 1, 1, 1, 1, 1,
-0.9741639, -1.680747, -3.077317, 1, 1, 1, 1, 1,
-0.9700493, 0.8816762, -1.005533, 0, 0, 1, 1, 1,
-0.9677718, -0.9492149, -2.706602, 1, 0, 0, 1, 1,
-0.9674752, -0.2944566, -1.084339, 1, 0, 0, 1, 1,
-0.966115, -0.0401843, -1.841249, 1, 0, 0, 1, 1,
-0.9471104, -1.680469, -1.313571, 1, 0, 0, 1, 1,
-0.9420393, 0.9623038, 0.3647501, 1, 0, 0, 1, 1,
-0.9397555, 0.3794683, -2.409788, 0, 0, 0, 1, 1,
-0.9379302, 1.323178, 0.4608665, 0, 0, 0, 1, 1,
-0.9359167, -1.99497, -2.195205, 0, 0, 0, 1, 1,
-0.9311798, -0.341078, -0.9299808, 0, 0, 0, 1, 1,
-0.9283454, 0.5401784, -0.9100096, 0, 0, 0, 1, 1,
-0.9248153, -0.2134914, -2.583269, 0, 0, 0, 1, 1,
-0.9246557, 1.452637, 1.473314, 0, 0, 0, 1, 1,
-0.9226885, -2.090558, -2.507828, 1, 1, 1, 1, 1,
-0.906139, -0.3660521, -1.167136, 1, 1, 1, 1, 1,
-0.9024094, -0.2979794, -2.593271, 1, 1, 1, 1, 1,
-0.8957551, 1.658861, -0.2271132, 1, 1, 1, 1, 1,
-0.8928251, -0.7684255, -0.06551669, 1, 1, 1, 1, 1,
-0.8891841, 0.9338115, -0.1053391, 1, 1, 1, 1, 1,
-0.8890905, -0.5418891, -1.588557, 1, 1, 1, 1, 1,
-0.8870739, 1.078133, 0.6766118, 1, 1, 1, 1, 1,
-0.8834303, 0.404583, -0.2832619, 1, 1, 1, 1, 1,
-0.8677143, 0.6058701, 0.03230126, 1, 1, 1, 1, 1,
-0.8590856, 0.1970072, -2.03382, 1, 1, 1, 1, 1,
-0.8569238, 0.2613257, 0.05897429, 1, 1, 1, 1, 1,
-0.8561487, 0.6793659, -2.256115, 1, 1, 1, 1, 1,
-0.8545784, -0.1681654, -2.45433, 1, 1, 1, 1, 1,
-0.8466206, -0.6794859, -2.579369, 1, 1, 1, 1, 1,
-0.845234, -0.8568598, -3.245842, 0, 0, 1, 1, 1,
-0.8447611, 0.8487001, -0.345626, 1, 0, 0, 1, 1,
-0.8415234, 2.250082, -1.096246, 1, 0, 0, 1, 1,
-0.8385089, -0.3759584, -1.255127, 1, 0, 0, 1, 1,
-0.8328177, -0.7840768, -3.111068, 1, 0, 0, 1, 1,
-0.8297054, -1.787301, -3.031828, 1, 0, 0, 1, 1,
-0.8265823, 0.5657994, -1.688621, 0, 0, 0, 1, 1,
-0.825942, 1.022014, -2.518894, 0, 0, 0, 1, 1,
-0.8238351, -1.963827, -1.278262, 0, 0, 0, 1, 1,
-0.8224595, -0.6111507, -4.611142, 0, 0, 0, 1, 1,
-0.820601, 0.8760865, -0.7359974, 0, 0, 0, 1, 1,
-0.8196416, -1.698192, -2.31283, 0, 0, 0, 1, 1,
-0.8192201, 0.115552, -1.948073, 0, 0, 0, 1, 1,
-0.8159858, 0.4151663, -0.938439, 1, 1, 1, 1, 1,
-0.8071017, -0.3697231, -2.641539, 1, 1, 1, 1, 1,
-0.802716, -2.516486, -3.878287, 1, 1, 1, 1, 1,
-0.8026401, 0.2888294, -0.8560165, 1, 1, 1, 1, 1,
-0.7971956, 0.09260309, -0.3044699, 1, 1, 1, 1, 1,
-0.7956462, 0.4925323, 0.2512736, 1, 1, 1, 1, 1,
-0.7891008, 1.402239, 0.03908022, 1, 1, 1, 1, 1,
-0.7869448, 1.351919, 0.001484243, 1, 1, 1, 1, 1,
-0.7860084, -0.07387555, -1.624793, 1, 1, 1, 1, 1,
-0.7815485, -1.566471, -1.637228, 1, 1, 1, 1, 1,
-0.780062, -0.07395353, -1.10161, 1, 1, 1, 1, 1,
-0.7743972, -0.3123948, -0.9759241, 1, 1, 1, 1, 1,
-0.7725868, 1.354987, -0.7054901, 1, 1, 1, 1, 1,
-0.7680095, -0.8826649, -3.654209, 1, 1, 1, 1, 1,
-0.76683, 0.263839, -0.4370746, 1, 1, 1, 1, 1,
-0.7656755, -0.7975988, -1.381228, 0, 0, 1, 1, 1,
-0.7633566, 0.9318571, -1.760281, 1, 0, 0, 1, 1,
-0.760132, -0.2385586, -2.515616, 1, 0, 0, 1, 1,
-0.7575386, 0.213639, -2.398758, 1, 0, 0, 1, 1,
-0.7562095, -0.633235, -1.681283, 1, 0, 0, 1, 1,
-0.7561731, -0.4823464, -1.21243, 1, 0, 0, 1, 1,
-0.7538811, -0.4514124, -1.82145, 0, 0, 0, 1, 1,
-0.7509644, -0.8221742, -1.846691, 0, 0, 0, 1, 1,
-0.7506778, 1.427253, -2.003743, 0, 0, 0, 1, 1,
-0.7482874, -0.2650905, -1.535244, 0, 0, 0, 1, 1,
-0.7457646, -2.718678, -2.483303, 0, 0, 0, 1, 1,
-0.7443049, -0.6208377, -3.452795, 0, 0, 0, 1, 1,
-0.7420258, -1.342681, -0.9838927, 0, 0, 0, 1, 1,
-0.7411579, 0.5269334, -1.422932, 1, 1, 1, 1, 1,
-0.7339806, -0.6890755, -2.326029, 1, 1, 1, 1, 1,
-0.7258971, 0.3167531, -1.43209, 1, 1, 1, 1, 1,
-0.7257375, -0.2169309, -0.7413806, 1, 1, 1, 1, 1,
-0.7256791, -0.3442525, -3.582768, 1, 1, 1, 1, 1,
-0.7241366, 0.1831445, -2.661271, 1, 1, 1, 1, 1,
-0.7222404, -2.171288, -2.836008, 1, 1, 1, 1, 1,
-0.7214606, -2.16969, -3.391637, 1, 1, 1, 1, 1,
-0.7211898, 0.7744607, -1.667114, 1, 1, 1, 1, 1,
-0.7180417, 1.557273, 0.528915, 1, 1, 1, 1, 1,
-0.7130355, -0.142632, -2.613248, 1, 1, 1, 1, 1,
-0.7099026, -0.1625817, -2.459962, 1, 1, 1, 1, 1,
-0.6988854, 0.8276138, -1.200364, 1, 1, 1, 1, 1,
-0.697071, 1.152792, -0.3173831, 1, 1, 1, 1, 1,
-0.6962567, -0.5804061, -0.8744338, 1, 1, 1, 1, 1,
-0.694533, 0.4462152, -2.442519, 0, 0, 1, 1, 1,
-0.6859658, -1.254682, -0.8216261, 1, 0, 0, 1, 1,
-0.6854122, 0.1158448, -2.412185, 1, 0, 0, 1, 1,
-0.6741552, -0.0700461, -1.722647, 1, 0, 0, 1, 1,
-0.6740361, 1.755843, -0.04117361, 1, 0, 0, 1, 1,
-0.6734756, -0.4099346, -2.993977, 1, 0, 0, 1, 1,
-0.6696079, 0.5444394, -1.549558, 0, 0, 0, 1, 1,
-0.6675253, 1.669353, -0.6903106, 0, 0, 0, 1, 1,
-0.6666131, 0.007085887, -0.8854572, 0, 0, 0, 1, 1,
-0.6624934, 0.8193325, -0.3262503, 0, 0, 0, 1, 1,
-0.6597098, 0.7087549, -1.686646, 0, 0, 0, 1, 1,
-0.6584029, -0.4287672, -0.4727172, 0, 0, 0, 1, 1,
-0.657577, -0.495133, -1.856556, 0, 0, 0, 1, 1,
-0.6550573, -0.2854454, -2.562975, 1, 1, 1, 1, 1,
-0.652249, 0.01203972, -2.303741, 1, 1, 1, 1, 1,
-0.63003, 0.3516454, -3.82692, 1, 1, 1, 1, 1,
-0.628185, -0.5646812, -1.937841, 1, 1, 1, 1, 1,
-0.6223236, 0.8974363, 1.588815, 1, 1, 1, 1, 1,
-0.6219399, -0.9512272, -2.024846, 1, 1, 1, 1, 1,
-0.621688, -0.3653521, -4.216561, 1, 1, 1, 1, 1,
-0.6149386, 2.37957, 0.1092311, 1, 1, 1, 1, 1,
-0.6104133, -0.2377678, -3.199357, 1, 1, 1, 1, 1,
-0.6076809, 0.02080466, -2.270781, 1, 1, 1, 1, 1,
-0.5937019, 0.5850353, -1.604658, 1, 1, 1, 1, 1,
-0.5935928, -0.9191119, -2.674522, 1, 1, 1, 1, 1,
-0.5907145, 0.3724829, -0.1402821, 1, 1, 1, 1, 1,
-0.5885027, -0.3057684, -2.654129, 1, 1, 1, 1, 1,
-0.5817011, 0.6812011, -1.111427, 1, 1, 1, 1, 1,
-0.5772066, 0.7836517, -1.40299, 0, 0, 1, 1, 1,
-0.5770851, -0.08627204, 0.5333299, 1, 0, 0, 1, 1,
-0.5747696, 0.8811547, -0.4441581, 1, 0, 0, 1, 1,
-0.5731833, -1.429056, -3.04221, 1, 0, 0, 1, 1,
-0.5615697, 0.004353861, -2.428903, 1, 0, 0, 1, 1,
-0.5545694, -1.240279, -0.8894387, 1, 0, 0, 1, 1,
-0.5512297, 0.6611255, -1.055285, 0, 0, 0, 1, 1,
-0.5494292, -0.6112791, -1.350307, 0, 0, 0, 1, 1,
-0.5488304, 0.3263983, -0.9384778, 0, 0, 0, 1, 1,
-0.5477452, 2.746203, -0.9829549, 0, 0, 0, 1, 1,
-0.5460668, 1.329209, -1.246871, 0, 0, 0, 1, 1,
-0.5458977, -2.300218, -2.80221, 0, 0, 0, 1, 1,
-0.5432097, -1.326448, -2.529949, 0, 0, 0, 1, 1,
-0.5430284, 0.3493803, -1.965228, 1, 1, 1, 1, 1,
-0.5408319, 1.439304, 0.7685333, 1, 1, 1, 1, 1,
-0.5392694, -0.06519639, -0.7219857, 1, 1, 1, 1, 1,
-0.5349596, -1.597022, -2.752097, 1, 1, 1, 1, 1,
-0.5330992, 1.75221, -0.5571019, 1, 1, 1, 1, 1,
-0.5291114, -0.2499984, -2.724234, 1, 1, 1, 1, 1,
-0.5288185, -0.6059183, -0.7850738, 1, 1, 1, 1, 1,
-0.5279788, 0.7818648, -1.103376, 1, 1, 1, 1, 1,
-0.5258286, 0.1101028, -2.862722, 1, 1, 1, 1, 1,
-0.5241939, 0.7644025, -1.961765, 1, 1, 1, 1, 1,
-0.5233075, 0.03852735, -0.1895315, 1, 1, 1, 1, 1,
-0.5186542, -0.1668365, -1.636615, 1, 1, 1, 1, 1,
-0.5183534, 1.066772, -0.7774514, 1, 1, 1, 1, 1,
-0.5066994, 0.9039305, -0.3756939, 1, 1, 1, 1, 1,
-0.502508, 2.218428, -1.021802, 1, 1, 1, 1, 1,
-0.5000053, 1.19498, -0.7108747, 0, 0, 1, 1, 1,
-0.4912326, -0.06435332, -2.319556, 1, 0, 0, 1, 1,
-0.4787112, -0.5010977, -1.404843, 1, 0, 0, 1, 1,
-0.4731693, -0.6552722, -2.440441, 1, 0, 0, 1, 1,
-0.465038, -1.012233, -2.615008, 1, 0, 0, 1, 1,
-0.4632974, 0.1705106, -0.7556378, 1, 0, 0, 1, 1,
-0.4602187, -0.598108, -3.626107, 0, 0, 0, 1, 1,
-0.4588307, -0.6971015, -2.70224, 0, 0, 0, 1, 1,
-0.4554279, 0.4060766, -0.8286253, 0, 0, 0, 1, 1,
-0.4539501, 1.185691, 0.03847129, 0, 0, 0, 1, 1,
-0.4527714, -0.4536443, -2.391303, 0, 0, 0, 1, 1,
-0.4520031, 0.5386201, -1.054507, 0, 0, 0, 1, 1,
-0.4519849, -1.957599, -1.400064, 0, 0, 0, 1, 1,
-0.4515759, 0.5716054, -2.727355, 1, 1, 1, 1, 1,
-0.4503095, 1.049272, 0.933104, 1, 1, 1, 1, 1,
-0.4499382, -0.1329316, -1.457811, 1, 1, 1, 1, 1,
-0.4486949, 0.1262292, -1.206116, 1, 1, 1, 1, 1,
-0.4394629, -0.4194041, -2.538906, 1, 1, 1, 1, 1,
-0.4347112, -1.073005, -1.990734, 1, 1, 1, 1, 1,
-0.4297829, -1.146295, -3.211815, 1, 1, 1, 1, 1,
-0.429299, -0.9012077, -1.564889, 1, 1, 1, 1, 1,
-0.4285558, 0.01318316, -2.680875, 1, 1, 1, 1, 1,
-0.4250349, -0.7224649, -0.9422824, 1, 1, 1, 1, 1,
-0.4226378, 0.2889142, -1.363151, 1, 1, 1, 1, 1,
-0.4213448, -0.1667581, -2.793365, 1, 1, 1, 1, 1,
-0.4181578, 0.9005031, -0.738919, 1, 1, 1, 1, 1,
-0.4179466, -1.802057, -3.475113, 1, 1, 1, 1, 1,
-0.4177648, 0.7105669, 0.4145232, 1, 1, 1, 1, 1,
-0.4172882, -0.1448197, -2.64617, 0, 0, 1, 1, 1,
-0.4166943, -0.3515998, -0.8563128, 1, 0, 0, 1, 1,
-0.4160883, 0.7926069, 1.038749, 1, 0, 0, 1, 1,
-0.4139682, 2.054678, -1.046582, 1, 0, 0, 1, 1,
-0.4027954, 2.044376, -1.160552, 1, 0, 0, 1, 1,
-0.4021658, -0.3306879, -1.565402, 1, 0, 0, 1, 1,
-0.3925357, 0.2791314, -1.835457, 0, 0, 0, 1, 1,
-0.3901683, 0.3878075, 0.01847023, 0, 0, 0, 1, 1,
-0.3859186, -0.49652, -4.062684, 0, 0, 0, 1, 1,
-0.3843976, -0.1502009, -1.948088, 0, 0, 0, 1, 1,
-0.3835125, -0.1743467, -2.829603, 0, 0, 0, 1, 1,
-0.3775895, -0.1847804, -0.9553604, 0, 0, 0, 1, 1,
-0.3734025, 0.2318962, -0.3885934, 0, 0, 0, 1, 1,
-0.3691496, -0.3610686, -2.802827, 1, 1, 1, 1, 1,
-0.3643359, -0.5726292, -2.022522, 1, 1, 1, 1, 1,
-0.3643307, -1.398649, -5.294125, 1, 1, 1, 1, 1,
-0.3617947, 1.442455, -0.6295371, 1, 1, 1, 1, 1,
-0.3594744, -1.325246, -1.718244, 1, 1, 1, 1, 1,
-0.3571558, 0.3547449, -2.82878, 1, 1, 1, 1, 1,
-0.3562713, -0.3958403, -1.72129, 1, 1, 1, 1, 1,
-0.3535796, -1.116066, -3.486, 1, 1, 1, 1, 1,
-0.3524122, -0.8430787, -2.705606, 1, 1, 1, 1, 1,
-0.3502991, -1.214637, -2.130162, 1, 1, 1, 1, 1,
-0.3491147, -0.3542546, -3.607717, 1, 1, 1, 1, 1,
-0.3469127, -1.839239, -3.793588, 1, 1, 1, 1, 1,
-0.3465579, -1.026716, -0.8650841, 1, 1, 1, 1, 1,
-0.345459, 1.121119, 0.2378513, 1, 1, 1, 1, 1,
-0.3452154, 0.4488845, 0.4941621, 1, 1, 1, 1, 1,
-0.3432355, 0.9744204, 0.08323095, 0, 0, 1, 1, 1,
-0.3352234, -0.3200747, -4.262283, 1, 0, 0, 1, 1,
-0.3284218, -0.9912208, -1.362478, 1, 0, 0, 1, 1,
-0.3278494, -0.09142037, -2.982342, 1, 0, 0, 1, 1,
-0.3277873, -0.700645, -2.234816, 1, 0, 0, 1, 1,
-0.3272442, 0.449446, -3.016682, 1, 0, 0, 1, 1,
-0.321274, -0.558739, -1.822725, 0, 0, 0, 1, 1,
-0.3137594, 0.8075356, -0.01418613, 0, 0, 0, 1, 1,
-0.3119843, 0.4433126, 0.06443889, 0, 0, 0, 1, 1,
-0.3103336, -0.518589, -2.674574, 0, 0, 0, 1, 1,
-0.3048174, -1.399991, -3.818647, 0, 0, 0, 1, 1,
-0.3012896, -0.1342458, -0.810205, 0, 0, 0, 1, 1,
-0.2994556, 0.09464201, -1.474509, 0, 0, 0, 1, 1,
-0.2994383, 0.1457237, -1.378099, 1, 1, 1, 1, 1,
-0.2969837, -1.241279, -3.675196, 1, 1, 1, 1, 1,
-0.2962362, -0.5110024, -3.608752, 1, 1, 1, 1, 1,
-0.294768, -0.03671707, -4.412686, 1, 1, 1, 1, 1,
-0.2939151, -1.45095, -4.140573, 1, 1, 1, 1, 1,
-0.2933467, 0.3000789, -2.167726, 1, 1, 1, 1, 1,
-0.2897621, -0.1549366, -1.902664, 1, 1, 1, 1, 1,
-0.2884064, -2.018202, -2.458254, 1, 1, 1, 1, 1,
-0.2811527, 1.117949, -0.7178937, 1, 1, 1, 1, 1,
-0.2782415, -0.1160993, -0.5922175, 1, 1, 1, 1, 1,
-0.2763516, 2.540757, -0.2295045, 1, 1, 1, 1, 1,
-0.2718858, -0.01988737, -0.2382703, 1, 1, 1, 1, 1,
-0.2690751, -0.4597731, -2.617004, 1, 1, 1, 1, 1,
-0.268875, 1.047938, 0.2865796, 1, 1, 1, 1, 1,
-0.2688217, 0.4456987, -0.8264025, 1, 1, 1, 1, 1,
-0.264785, -0.3319777, -1.214435, 0, 0, 1, 1, 1,
-0.264585, 1.963075, -0.6822928, 1, 0, 0, 1, 1,
-0.2629863, 0.9305675, -0.5831344, 1, 0, 0, 1, 1,
-0.2629241, 1.01677, -1.178167, 1, 0, 0, 1, 1,
-0.2568292, 0.4742224, -2.041847, 1, 0, 0, 1, 1,
-0.2565276, 1.044641, 0.1431761, 1, 0, 0, 1, 1,
-0.2547108, -0.7509885, -2.290165, 0, 0, 0, 1, 1,
-0.2524547, -0.0762987, -1.064914, 0, 0, 0, 1, 1,
-0.2506503, -0.2636323, -3.295825, 0, 0, 0, 1, 1,
-0.2506119, -0.1544721, -2.453773, 0, 0, 0, 1, 1,
-0.2504683, 1.23034, -1.811854, 0, 0, 0, 1, 1,
-0.2454815, -0.5682848, -4.950747, 0, 0, 0, 1, 1,
-0.2415491, 0.1028101, -0.1751815, 0, 0, 0, 1, 1,
-0.2376612, -0.01824795, -0.7363513, 1, 1, 1, 1, 1,
-0.2354629, 0.1223378, -3.24526, 1, 1, 1, 1, 1,
-0.2320452, 0.9534319, -1.096156, 1, 1, 1, 1, 1,
-0.229266, 0.7925301, 0.08632119, 1, 1, 1, 1, 1,
-0.2246584, 0.7886818, -0.5047696, 1, 1, 1, 1, 1,
-0.2215534, 0.5230291, -0.03518937, 1, 1, 1, 1, 1,
-0.221484, 0.2042305, -1.926047, 1, 1, 1, 1, 1,
-0.2209743, -1.767822, -3.695872, 1, 1, 1, 1, 1,
-0.2202153, -0.2729877, -3.3333, 1, 1, 1, 1, 1,
-0.2195911, 0.8694752, -0.3503003, 1, 1, 1, 1, 1,
-0.2121822, 0.120493, -0.2822332, 1, 1, 1, 1, 1,
-0.2104787, 0.5757322, 0.3934795, 1, 1, 1, 1, 1,
-0.2049594, 2.004945, 1.145889, 1, 1, 1, 1, 1,
-0.2006323, 0.3849467, 2.045144, 1, 1, 1, 1, 1,
-0.1967309, -0.6540732, -3.313944, 1, 1, 1, 1, 1,
-0.1899548, 0.1468121, -1.435816, 0, 0, 1, 1, 1,
-0.1865172, -1.482986, -3.912097, 1, 0, 0, 1, 1,
-0.1850767, -0.6431934, -2.224869, 1, 0, 0, 1, 1,
-0.1829241, -0.224595, -2.171786, 1, 0, 0, 1, 1,
-0.1813634, 1.451733, 0.02540219, 1, 0, 0, 1, 1,
-0.1806325, -0.345367, -3.374624, 1, 0, 0, 1, 1,
-0.1805814, 2.374658, 0.03542619, 0, 0, 0, 1, 1,
-0.1788859, 0.3987375, -0.5174677, 0, 0, 0, 1, 1,
-0.1788368, 0.6365734, 0.242126, 0, 0, 0, 1, 1,
-0.1763896, -0.04443196, -1.263496, 0, 0, 0, 1, 1,
-0.1724901, 0.3037159, 0.05394041, 0, 0, 0, 1, 1,
-0.1711402, -0.5393127, -5.596457, 0, 0, 0, 1, 1,
-0.1700514, -1.140659, -5.089453, 0, 0, 0, 1, 1,
-0.1692839, -0.2687531, -3.605543, 1, 1, 1, 1, 1,
-0.1685836, 1.314221, 0.987116, 1, 1, 1, 1, 1,
-0.1641731, -0.1065622, -2.237563, 1, 1, 1, 1, 1,
-0.1420429, -0.792901, -4.658043, 1, 1, 1, 1, 1,
-0.1403653, -1.301092, -1.610765, 1, 1, 1, 1, 1,
-0.1380237, -0.7468965, -3.223001, 1, 1, 1, 1, 1,
-0.1379822, -1.440781, -2.657138, 1, 1, 1, 1, 1,
-0.137422, -0.2216882, -2.431, 1, 1, 1, 1, 1,
-0.1369313, 0.1565455, -3.33373, 1, 1, 1, 1, 1,
-0.1359212, 1.082662, -0.3728479, 1, 1, 1, 1, 1,
-0.1358093, -0.8980788, -3.124972, 1, 1, 1, 1, 1,
-0.1351819, -0.5267521, -4.646561, 1, 1, 1, 1, 1,
-0.1343628, 0.5743471, -0.4056519, 1, 1, 1, 1, 1,
-0.1321688, -0.6991894, -2.722933, 1, 1, 1, 1, 1,
-0.1275507, -0.7917168, -2.080146, 1, 1, 1, 1, 1,
-0.1263124, 0.02879453, -2.312806, 0, 0, 1, 1, 1,
-0.1232057, 0.320333, 0.6804001, 1, 0, 0, 1, 1,
-0.1197402, -1.036897, -3.724278, 1, 0, 0, 1, 1,
-0.1117833, -0.8826237, -1.850871, 1, 0, 0, 1, 1,
-0.1065318, 0.7431405, -0.928243, 1, 0, 0, 1, 1,
-0.1040579, 0.9822838, -1.449924, 1, 0, 0, 1, 1,
-0.1028361, 0.1151749, -1.511483, 0, 0, 0, 1, 1,
-0.1010024, -1.362087, -2.587409, 0, 0, 0, 1, 1,
-0.09985018, 0.6412921, 0.56925, 0, 0, 0, 1, 1,
-0.09865937, 0.5804843, 0.02942685, 0, 0, 0, 1, 1,
-0.09846462, 0.7099251, -0.3904212, 0, 0, 0, 1, 1,
-0.09275127, -0.5488118, -2.334702, 0, 0, 0, 1, 1,
-0.0891581, -0.2297916, -2.8716, 0, 0, 0, 1, 1,
-0.08818777, -0.8491405, -1.954484, 1, 1, 1, 1, 1,
-0.08710539, -0.4117858, -2.87405, 1, 1, 1, 1, 1,
-0.08450941, 2.633545, 0.4701601, 1, 1, 1, 1, 1,
-0.08075465, 0.1871976, -0.5741379, 1, 1, 1, 1, 1,
-0.08036617, 0.7978915, -0.9296932, 1, 1, 1, 1, 1,
-0.08003979, 0.07957862, 0.5966416, 1, 1, 1, 1, 1,
-0.07900504, -1.460569, -2.959626, 1, 1, 1, 1, 1,
-0.07659351, 0.1739283, -0.3528552, 1, 1, 1, 1, 1,
-0.07441448, -0.2891656, -3.693449, 1, 1, 1, 1, 1,
-0.07413316, 0.6664603, -0.0005991885, 1, 1, 1, 1, 1,
-0.06900867, 1.501516, 0.6869872, 1, 1, 1, 1, 1,
-0.06873938, -0.8974224, -2.439071, 1, 1, 1, 1, 1,
-0.06705508, -0.9014044, -3.84103, 1, 1, 1, 1, 1,
-0.06617012, -0.8306519, -2.454807, 1, 1, 1, 1, 1,
-0.05623522, 0.4025015, -0.5558233, 1, 1, 1, 1, 1,
-0.05460108, -0.6696859, -2.11463, 0, 0, 1, 1, 1,
-0.0492366, -0.8491623, -3.698074, 1, 0, 0, 1, 1,
-0.04242158, 0.1965758, -0.9869674, 1, 0, 0, 1, 1,
-0.04178086, -0.92004, -4.022754, 1, 0, 0, 1, 1,
-0.04106008, 0.6506978, -1.406724, 1, 0, 0, 1, 1,
-0.03852011, 0.5782488, -1.557502, 1, 0, 0, 1, 1,
-0.03846634, -0.5795751, -2.267096, 0, 0, 0, 1, 1,
-0.03763163, -1.580733, -2.329418, 0, 0, 0, 1, 1,
-0.03685425, 2.164307, 0.5970342, 0, 0, 0, 1, 1,
-0.03554987, -0.02531229, -0.6158898, 0, 0, 0, 1, 1,
-0.03501897, -2.098915, -1.053325, 0, 0, 0, 1, 1,
-0.03427344, 1.74963, 0.115376, 0, 0, 0, 1, 1,
-0.03335949, -0.2960621, -2.177895, 0, 0, 0, 1, 1,
-0.03265505, -1.299543, -3.890413, 1, 1, 1, 1, 1,
-0.03069896, -0.1654374, -1.883592, 1, 1, 1, 1, 1,
-0.03060803, -0.1096992, -1.854605, 1, 1, 1, 1, 1,
-0.02971355, 1.109739, -0.6861233, 1, 1, 1, 1, 1,
-0.02584674, -0.3518055, -4.231236, 1, 1, 1, 1, 1,
-0.0248594, -0.9527118, -2.702217, 1, 1, 1, 1, 1,
-0.02341414, 0.6465701, 0.1040769, 1, 1, 1, 1, 1,
-0.01852582, 0.9867344, 0.407377, 1, 1, 1, 1, 1,
-0.009445525, 0.6563204, 0.4083882, 1, 1, 1, 1, 1,
-0.004672468, -2.81881, -1.891057, 1, 1, 1, 1, 1,
-0.00278839, 0.8407076, 0.4718769, 1, 1, 1, 1, 1,
-0.0003189167, 0.03916601, 0.5166717, 1, 1, 1, 1, 1,
0.002725089, 1.643198, 0.5069939, 1, 1, 1, 1, 1,
0.01305716, -1.320574, 2.88603, 1, 1, 1, 1, 1,
0.01776279, 0.03061949, 1.370929, 1, 1, 1, 1, 1,
0.0211883, 0.4688913, 0.3001347, 0, 0, 1, 1, 1,
0.02212926, 0.3507529, -0.3812568, 1, 0, 0, 1, 1,
0.02377407, 0.2403838, 0.4111808, 1, 0, 0, 1, 1,
0.02451598, -1.030006, 4.443035, 1, 0, 0, 1, 1,
0.02946063, -0.07549983, 4.242578, 1, 0, 0, 1, 1,
0.03458131, 1.473965, -0.5386104, 1, 0, 0, 1, 1,
0.03822196, -0.6965087, 4.544961, 0, 0, 0, 1, 1,
0.03986316, 0.6788712, 0.8920627, 0, 0, 0, 1, 1,
0.03987774, -0.3750824, 3.437844, 0, 0, 0, 1, 1,
0.04236517, -0.682217, 2.182809, 0, 0, 0, 1, 1,
0.04262988, -1.146401, 3.227549, 0, 0, 0, 1, 1,
0.04555784, 0.4717724, 0.2053959, 0, 0, 0, 1, 1,
0.05030509, 0.9912893, -0.4834109, 0, 0, 0, 1, 1,
0.05905709, 0.5224014, 0.1531786, 1, 1, 1, 1, 1,
0.06111178, -0.5344832, 2.45645, 1, 1, 1, 1, 1,
0.06175859, -0.1061763, 3.071215, 1, 1, 1, 1, 1,
0.06334217, -0.2382106, 4.400182, 1, 1, 1, 1, 1,
0.06662609, 1.093816, -0.1233342, 1, 1, 1, 1, 1,
0.06795205, 0.0636863, 2.202323, 1, 1, 1, 1, 1,
0.06800808, 0.5378617, 2.285394, 1, 1, 1, 1, 1,
0.06880824, -1.67313, 2.88967, 1, 1, 1, 1, 1,
0.07028413, -0.7062783, 3.330943, 1, 1, 1, 1, 1,
0.07119987, 0.3315388, 2.388712, 1, 1, 1, 1, 1,
0.07132249, -0.8336029, 2.147916, 1, 1, 1, 1, 1,
0.0717588, 1.795045, 0.465092, 1, 1, 1, 1, 1,
0.0725133, -1.749416, 3.405983, 1, 1, 1, 1, 1,
0.07635211, -1.375991, 3.028295, 1, 1, 1, 1, 1,
0.07635505, 0.9902776, -0.2612444, 1, 1, 1, 1, 1,
0.07668228, 2.414479, -1.410382, 0, 0, 1, 1, 1,
0.07722764, -0.8090501, 3.060829, 1, 0, 0, 1, 1,
0.07898071, 0.1700571, -0.05179568, 1, 0, 0, 1, 1,
0.08278157, 0.7045606, -0.7559336, 1, 0, 0, 1, 1,
0.08606017, 0.2745323, 0.6172377, 1, 0, 0, 1, 1,
0.08848641, 0.3959683, -0.151726, 1, 0, 0, 1, 1,
0.09032764, 0.5622645, -0.4192647, 0, 0, 0, 1, 1,
0.09107821, 0.3818292, 1.185756, 0, 0, 0, 1, 1,
0.09164258, -1.526651, 2.820882, 0, 0, 0, 1, 1,
0.09254143, 0.1139656, 0.2463445, 0, 0, 0, 1, 1,
0.1005531, 0.09170058, -0.822374, 0, 0, 0, 1, 1,
0.1010488, -1.706708, 4.592631, 0, 0, 0, 1, 1,
0.1046217, -0.8731877, 1.789434, 0, 0, 0, 1, 1,
0.1063232, -0.4151199, 3.580458, 1, 1, 1, 1, 1,
0.1068156, 0.7342863, -0.1739624, 1, 1, 1, 1, 1,
0.1072988, -0.3047227, 4.377082, 1, 1, 1, 1, 1,
0.1094923, 0.2142867, 0.3642397, 1, 1, 1, 1, 1,
0.1098934, 0.4398845, 0.5786796, 1, 1, 1, 1, 1,
0.1119723, -1.601235, 3.135657, 1, 1, 1, 1, 1,
0.1134094, -0.3029565, 1.510458, 1, 1, 1, 1, 1,
0.1156807, -0.5423499, 2.874268, 1, 1, 1, 1, 1,
0.1164524, 0.3185709, -0.8652748, 1, 1, 1, 1, 1,
0.1170518, -0.6690797, 2.716619, 1, 1, 1, 1, 1,
0.1254281, -1.511045, 4.225616, 1, 1, 1, 1, 1,
0.1259141, 0.131363, 1.03391, 1, 1, 1, 1, 1,
0.129323, -1.491666, 1.863919, 1, 1, 1, 1, 1,
0.1317527, -0.6133296, 0.1332123, 1, 1, 1, 1, 1,
0.1332199, 1.299177, -1.248423, 1, 1, 1, 1, 1,
0.1353825, -0.8163775, 2.451229, 0, 0, 1, 1, 1,
0.137054, -1.090546, 2.412265, 1, 0, 0, 1, 1,
0.13837, -1.592975, 2.77384, 1, 0, 0, 1, 1,
0.1393777, 0.7990769, 0.6672003, 1, 0, 0, 1, 1,
0.1450878, -0.5906942, 3.228649, 1, 0, 0, 1, 1,
0.1463006, 0.807952, -1.338677, 1, 0, 0, 1, 1,
0.1576017, 0.8726996, -0.7955372, 0, 0, 0, 1, 1,
0.1592465, -0.8040999, 2.728646, 0, 0, 0, 1, 1,
0.1623451, -0.2002965, 0.98403, 0, 0, 0, 1, 1,
0.1626298, -0.05647462, 2.640763, 0, 0, 0, 1, 1,
0.1674252, -0.2541959, 2.202544, 0, 0, 0, 1, 1,
0.1708162, -0.01888153, 1.130905, 0, 0, 0, 1, 1,
0.1748928, 0.5730799, -0.1701287, 0, 0, 0, 1, 1,
0.1751254, 0.5940558, -0.07366577, 1, 1, 1, 1, 1,
0.1802578, -1.305416, 2.178174, 1, 1, 1, 1, 1,
0.1824463, -1.670146, 4.692992, 1, 1, 1, 1, 1,
0.1824893, 1.049338, 0.2862461, 1, 1, 1, 1, 1,
0.186222, -0.550344, 2.25645, 1, 1, 1, 1, 1,
0.1866983, -0.8171631, 2.709818, 1, 1, 1, 1, 1,
0.1913364, -0.3191764, 3.3645, 1, 1, 1, 1, 1,
0.1918079, -1.065414, 3.463997, 1, 1, 1, 1, 1,
0.1921922, -1.944384, 2.780925, 1, 1, 1, 1, 1,
0.1932952, 0.03101002, 3.25189, 1, 1, 1, 1, 1,
0.194713, 0.6243149, 0.1482571, 1, 1, 1, 1, 1,
0.1967771, -1.915605, 1.664955, 1, 1, 1, 1, 1,
0.1987669, 0.9560059, -0.8658295, 1, 1, 1, 1, 1,
0.2049873, -0.6609823, 1.14585, 1, 1, 1, 1, 1,
0.2136477, 1.610463, 0.7838475, 1, 1, 1, 1, 1,
0.2163556, -1.254989, 3.36168, 0, 0, 1, 1, 1,
0.2166899, 2.39215, 1.028927, 1, 0, 0, 1, 1,
0.2175236, 0.8826758, -0.04925342, 1, 0, 0, 1, 1,
0.2179386, -0.3305405, 3.922693, 1, 0, 0, 1, 1,
0.2261951, -0.6650693, 2.498442, 1, 0, 0, 1, 1,
0.2280702, -1.668506, 4.192699, 1, 0, 0, 1, 1,
0.2282647, -0.009581084, -0.2192799, 0, 0, 0, 1, 1,
0.2297161, -1.17373, 3.737417, 0, 0, 0, 1, 1,
0.2314042, -1.333344, 2.188264, 0, 0, 0, 1, 1,
0.233993, 0.7747163, 1.537564, 0, 0, 0, 1, 1,
0.2340126, -0.6981289, 3.3359, 0, 0, 0, 1, 1,
0.2352275, 0.279032, 2.0808, 0, 0, 0, 1, 1,
0.235982, 0.2552236, 0.4706182, 0, 0, 0, 1, 1,
0.2361037, -2.026586, 3.616521, 1, 1, 1, 1, 1,
0.2369528, 0.4302497, 0.7557477, 1, 1, 1, 1, 1,
0.237236, -0.2451102, 2.215703, 1, 1, 1, 1, 1,
0.2423453, 0.5140084, -0.04685706, 1, 1, 1, 1, 1,
0.2492618, 0.1098385, -0.7907935, 1, 1, 1, 1, 1,
0.2496426, -1.678608, 2.75477, 1, 1, 1, 1, 1,
0.2502414, 0.8523381, 2.555473, 1, 1, 1, 1, 1,
0.2567247, 0.7326497, -0.3329136, 1, 1, 1, 1, 1,
0.2625323, -1.299773, 1.966599, 1, 1, 1, 1, 1,
0.2628947, -0.5601743, 3.433863, 1, 1, 1, 1, 1,
0.2671646, -0.7079245, 2.954638, 1, 1, 1, 1, 1,
0.2674969, 0.3115196, -1.859992, 1, 1, 1, 1, 1,
0.2751748, 0.1563463, 1.557727, 1, 1, 1, 1, 1,
0.2752729, -0.2213863, 2.367866, 1, 1, 1, 1, 1,
0.2760512, 0.5253109, 0.6430025, 1, 1, 1, 1, 1,
0.2938586, -0.222288, 2.923851, 0, 0, 1, 1, 1,
0.2949997, -1.30139, 2.662873, 1, 0, 0, 1, 1,
0.2951224, -1.445667, 2.992378, 1, 0, 0, 1, 1,
0.3003865, 0.4146447, -1.061318, 1, 0, 0, 1, 1,
0.3046546, -1.12111, 1.327468, 1, 0, 0, 1, 1,
0.312925, -0.5715719, 2.435922, 1, 0, 0, 1, 1,
0.3216318, -0.3353348, 1.132194, 0, 0, 0, 1, 1,
0.3232473, -0.5908343, 4.175008, 0, 0, 0, 1, 1,
0.3257384, 0.1139234, -0.1609404, 0, 0, 0, 1, 1,
0.3258909, -0.2868001, 5.027326, 0, 0, 0, 1, 1,
0.3263056, 0.8617968, -0.4375461, 0, 0, 0, 1, 1,
0.326323, 0.4199069, 0.6829231, 0, 0, 0, 1, 1,
0.3279314, -1.094533, 3.291209, 0, 0, 0, 1, 1,
0.3284874, -1.007966, 1.178165, 1, 1, 1, 1, 1,
0.3285319, 0.233529, 1.823413, 1, 1, 1, 1, 1,
0.3399784, 0.5646559, -0.304696, 1, 1, 1, 1, 1,
0.3458066, 0.6646494, 0.765772, 1, 1, 1, 1, 1,
0.3470493, -1.501879, 2.106398, 1, 1, 1, 1, 1,
0.3472602, 0.02203868, 1.661705, 1, 1, 1, 1, 1,
0.3504144, 1.008467, -0.3473082, 1, 1, 1, 1, 1,
0.3529772, -1.87242, 2.757667, 1, 1, 1, 1, 1,
0.3603334, -1.375718, 0.4429844, 1, 1, 1, 1, 1,
0.3612695, -0.3474025, 1.754543, 1, 1, 1, 1, 1,
0.3619737, 0.7570392, 0.387425, 1, 1, 1, 1, 1,
0.3633747, -1.284827, 2.692592, 1, 1, 1, 1, 1,
0.3636496, -0.01067764, -0.9223065, 1, 1, 1, 1, 1,
0.3648888, -2.429316, 2.282503, 1, 1, 1, 1, 1,
0.3697211, -0.4612139, 2.477637, 1, 1, 1, 1, 1,
0.3710303, -0.3580714, 2.259241, 0, 0, 1, 1, 1,
0.3747684, -0.4927653, 3.423244, 1, 0, 0, 1, 1,
0.3757486, 0.6463945, -0.163961, 1, 0, 0, 1, 1,
0.3838215, 0.04600365, 0.8804234, 1, 0, 0, 1, 1,
0.3886516, 1.570857, 0.05586524, 1, 0, 0, 1, 1,
0.3965651, 0.2834368, 0.5531451, 1, 0, 0, 1, 1,
0.4014556, -1.511861, 2.241615, 0, 0, 0, 1, 1,
0.4050684, 0.6466291, -0.1389489, 0, 0, 0, 1, 1,
0.4091512, -0.1790334, 3.062491, 0, 0, 0, 1, 1,
0.4136181, -1.186472, 4.065234, 0, 0, 0, 1, 1,
0.4161141, 0.1880573, 1.480699, 0, 0, 0, 1, 1,
0.4171304, -1.041538, 3.075614, 0, 0, 0, 1, 1,
0.4185455, -0.3247121, 2.754934, 0, 0, 0, 1, 1,
0.4213041, 0.6799037, 1.791829, 1, 1, 1, 1, 1,
0.4226426, -0.5883557, 2.250002, 1, 1, 1, 1, 1,
0.4237837, -0.1817752, 4.401018, 1, 1, 1, 1, 1,
0.4290812, -1.623564, 2.755385, 1, 1, 1, 1, 1,
0.4366642, 0.5865213, 2.546937, 1, 1, 1, 1, 1,
0.4399063, 0.4966397, 0.2825395, 1, 1, 1, 1, 1,
0.4426283, 0.0296088, 1.468123, 1, 1, 1, 1, 1,
0.4427081, 1.189813, 0.1582695, 1, 1, 1, 1, 1,
0.4448353, -0.574376, 2.254482, 1, 1, 1, 1, 1,
0.4488092, 0.2612266, 0.8892223, 1, 1, 1, 1, 1,
0.4494025, -0.931207, 2.22848, 1, 1, 1, 1, 1,
0.4514677, 0.8020188, 0.3561478, 1, 1, 1, 1, 1,
0.4588254, -0.6934877, 2.888081, 1, 1, 1, 1, 1,
0.4664738, -1.049492, 2.176398, 1, 1, 1, 1, 1,
0.4695382, -1.132907, 2.526256, 1, 1, 1, 1, 1,
0.469596, 0.8859518, -0.05553864, 0, 0, 1, 1, 1,
0.4753006, 0.9779101, 0.5269278, 1, 0, 0, 1, 1,
0.4765613, 1.598702, 1.094782, 1, 0, 0, 1, 1,
0.4771434, 1.225112, 0.4112834, 1, 0, 0, 1, 1,
0.47849, 1.55447, 0.9572196, 1, 0, 0, 1, 1,
0.4834804, -0.7225828, 1.931098, 1, 0, 0, 1, 1,
0.4883246, 0.3561188, -0.1870591, 0, 0, 0, 1, 1,
0.4900945, 0.841001, 0.4375015, 0, 0, 0, 1, 1,
0.4919061, -0.6166378, 4.125345, 0, 0, 0, 1, 1,
0.4933201, 0.635718, 1.938104, 0, 0, 0, 1, 1,
0.4966848, -1.31691, 1.692851, 0, 0, 0, 1, 1,
0.4975865, 0.392293, 0.07320842, 0, 0, 0, 1, 1,
0.5019418, -0.2224772, 2.349021, 0, 0, 0, 1, 1,
0.509743, -0.5429543, 1.164106, 1, 1, 1, 1, 1,
0.5220078, 0.3372641, 1.153404, 1, 1, 1, 1, 1,
0.5277622, -0.4284727, 1.68041, 1, 1, 1, 1, 1,
0.5338179, 0.9837187, 0.9991733, 1, 1, 1, 1, 1,
0.5344384, 0.313823, -0.1442702, 1, 1, 1, 1, 1,
0.5363685, -0.1993011, 0.7438986, 1, 1, 1, 1, 1,
0.5379112, -0.1238216, -0.02944072, 1, 1, 1, 1, 1,
0.5432699, -0.4118815, 2.399392, 1, 1, 1, 1, 1,
0.5446936, 0.1357348, 2.888388, 1, 1, 1, 1, 1,
0.5453007, 0.4373449, 0.5209379, 1, 1, 1, 1, 1,
0.5453824, -0.5643987, 1.591314, 1, 1, 1, 1, 1,
0.5457676, -0.7406598, 2.528265, 1, 1, 1, 1, 1,
0.5485712, -2.193733, 2.137663, 1, 1, 1, 1, 1,
0.5510102, 1.646078, 0.1302987, 1, 1, 1, 1, 1,
0.5548981, -1.554675, 3.81363, 1, 1, 1, 1, 1,
0.558286, -0.3735115, 2.884238, 0, 0, 1, 1, 1,
0.5589704, -0.5003723, 3.190043, 1, 0, 0, 1, 1,
0.5653729, -2.145376, 0.2500665, 1, 0, 0, 1, 1,
0.5715325, 0.003271329, 1.061605, 1, 0, 0, 1, 1,
0.5724616, -1.658514, 3.132913, 1, 0, 0, 1, 1,
0.5728387, 0.1033516, 2.732192, 1, 0, 0, 1, 1,
0.5807573, 0.6171418, 0.3279715, 0, 0, 0, 1, 1,
0.583133, -0.1722575, 1.410316, 0, 0, 0, 1, 1,
0.5870762, 0.1791936, 2.605306, 0, 0, 0, 1, 1,
0.5886326, -0.7305194, 0.9576399, 0, 0, 0, 1, 1,
0.5902128, -0.1037793, 1.770937, 0, 0, 0, 1, 1,
0.600405, -0.2517737, 3.279885, 0, 0, 0, 1, 1,
0.605684, -1.202564, 1.772699, 0, 0, 0, 1, 1,
0.6115651, -0.2593149, 1.012461, 1, 1, 1, 1, 1,
0.6119287, -0.2942283, 1.603864, 1, 1, 1, 1, 1,
0.6146048, -2.316201, 2.185747, 1, 1, 1, 1, 1,
0.6198016, -0.767182, 2.906619, 1, 1, 1, 1, 1,
0.6214631, -0.3136285, 1.373031, 1, 1, 1, 1, 1,
0.6220394, 0.3720616, 1.383778, 1, 1, 1, 1, 1,
0.6244117, -0.5948375, 0.8031071, 1, 1, 1, 1, 1,
0.6266417, 0.1719499, -0.2988642, 1, 1, 1, 1, 1,
0.6305321, -0.8384486, 1.006164, 1, 1, 1, 1, 1,
0.6316977, -0.3577499, 1.043367, 1, 1, 1, 1, 1,
0.6361579, 0.4171155, 1.644985, 1, 1, 1, 1, 1,
0.6409749, -0.7384379, 2.483139, 1, 1, 1, 1, 1,
0.6417392, 0.1839179, 1.066988, 1, 1, 1, 1, 1,
0.6445672, -0.09231028, 0.1926101, 1, 1, 1, 1, 1,
0.6517919, -0.68163, 2.184039, 1, 1, 1, 1, 1,
0.6525795, 0.3904937, 0.7911085, 0, 0, 1, 1, 1,
0.6529523, 0.597688, 0.1891812, 1, 0, 0, 1, 1,
0.6540003, 0.7058295, -0.4825508, 1, 0, 0, 1, 1,
0.6609116, 0.8931454, 0.6559232, 1, 0, 0, 1, 1,
0.6719551, 0.2357718, 2.001668, 1, 0, 0, 1, 1,
0.6730737, 1.073111, 0.9137253, 1, 0, 0, 1, 1,
0.6761636, 0.1234275, 2.418645, 0, 0, 0, 1, 1,
0.6804077, -1.21897, 5.17863, 0, 0, 0, 1, 1,
0.6816897, -0.388679, 1.902603, 0, 0, 0, 1, 1,
0.6822908, 0.9753875, -0.4915371, 0, 0, 0, 1, 1,
0.6825413, 0.7775342, 0.8462927, 0, 0, 0, 1, 1,
0.6882447, -0.1627162, 2.217902, 0, 0, 0, 1, 1,
0.6884593, 1.268326, 0.588905, 0, 0, 0, 1, 1,
0.6916101, -0.03875303, 2.153161, 1, 1, 1, 1, 1,
0.6919316, 2.858998, -0.4518183, 1, 1, 1, 1, 1,
0.6921858, 1.356817, -0.01437088, 1, 1, 1, 1, 1,
0.6936863, 0.34167, -0.1538464, 1, 1, 1, 1, 1,
0.6939131, 0.9445016, -0.6031586, 1, 1, 1, 1, 1,
0.7008555, 1.093456, -0.7574134, 1, 1, 1, 1, 1,
0.7020764, 0.7960308, 0.7025774, 1, 1, 1, 1, 1,
0.7162263, -0.5440228, 1.949875, 1, 1, 1, 1, 1,
0.7174665, 1.204791, 0.9032101, 1, 1, 1, 1, 1,
0.7175087, -0.8624871, 2.312838, 1, 1, 1, 1, 1,
0.7187719, 1.189006, 0.2384396, 1, 1, 1, 1, 1,
0.7191258, -0.2409822, 2.574316, 1, 1, 1, 1, 1,
0.7205446, 0.7726273, 1.867108, 1, 1, 1, 1, 1,
0.7206267, -1.475035, 1.379708, 1, 1, 1, 1, 1,
0.7218632, -3.014726, 2.722657, 1, 1, 1, 1, 1,
0.722889, 0.4178027, 1.869789, 0, 0, 1, 1, 1,
0.7248992, -1.091981, 2.506329, 1, 0, 0, 1, 1,
0.7264746, 0.2205339, 0.9024321, 1, 0, 0, 1, 1,
0.7294139, -0.1265198, 0.2696556, 1, 0, 0, 1, 1,
0.7300863, -1.718247, 5.209778, 1, 0, 0, 1, 1,
0.7318876, -0.04384742, 2.573125, 1, 0, 0, 1, 1,
0.7319551, -0.4840447, 3.945079, 0, 0, 0, 1, 1,
0.7328601, 0.4747611, 1.876394, 0, 0, 0, 1, 1,
0.7394726, 0.3893524, 1.895293, 0, 0, 0, 1, 1,
0.741514, -0.5851555, 1.118775, 0, 0, 0, 1, 1,
0.7438139, -0.3044057, 0.8092682, 0, 0, 0, 1, 1,
0.7452376, 0.6623417, -1.149513, 0, 0, 0, 1, 1,
0.7461389, -1.768123, 2.638673, 0, 0, 0, 1, 1,
0.7490293, -0.833418, 3.352919, 1, 1, 1, 1, 1,
0.7526894, -1.154004, 1.658935, 1, 1, 1, 1, 1,
0.755156, 0.5484391, 1.625383, 1, 1, 1, 1, 1,
0.75721, -0.8608111, 4.042689, 1, 1, 1, 1, 1,
0.7675831, 0.07488132, -0.201148, 1, 1, 1, 1, 1,
0.7679368, 0.6567822, 0.4877458, 1, 1, 1, 1, 1,
0.7728491, -0.1136614, 0.3447605, 1, 1, 1, 1, 1,
0.7734731, 0.4523263, 2.692458, 1, 1, 1, 1, 1,
0.7810356, -1.648816, 3.120562, 1, 1, 1, 1, 1,
0.7900813, -0.4427949, 2.748227, 1, 1, 1, 1, 1,
0.7903459, -2.036899, 1.575217, 1, 1, 1, 1, 1,
0.7921467, -0.008359803, 2.074059, 1, 1, 1, 1, 1,
0.7935616, -0.6783195, 2.340942, 1, 1, 1, 1, 1,
0.7977967, -0.4279096, -0.167554, 1, 1, 1, 1, 1,
0.7994416, 0.7321213, 1.882428, 1, 1, 1, 1, 1,
0.8015285, -0.9489517, 1.559368, 0, 0, 1, 1, 1,
0.803301, -0.5662362, 5.273974, 1, 0, 0, 1, 1,
0.8048718, 1.081578, 1.289516, 1, 0, 0, 1, 1,
0.8119491, -0.7796671, 0.580651, 1, 0, 0, 1, 1,
0.8188537, 0.1023195, 0.4924629, 1, 0, 0, 1, 1,
0.8201886, 0.4359185, 1.915672, 1, 0, 0, 1, 1,
0.8278649, 1.015535, 0.08648217, 0, 0, 0, 1, 1,
0.8343974, -1.692576, 3.302375, 0, 0, 0, 1, 1,
0.8493665, -0.393912, 4.121605, 0, 0, 0, 1, 1,
0.8508321, 0.210449, 1.632514, 0, 0, 0, 1, 1,
0.8559188, -1.167035, 2.573618, 0, 0, 0, 1, 1,
0.8628011, 0.4537484, 2.036546, 0, 0, 0, 1, 1,
0.8646284, -0.38144, 3.315839, 0, 0, 0, 1, 1,
0.8682471, 0.5294042, 0.1566659, 1, 1, 1, 1, 1,
0.8705896, 0.2356951, 1.873761, 1, 1, 1, 1, 1,
0.8727272, -0.03622899, 2.231251, 1, 1, 1, 1, 1,
0.872816, -1.163899, 4.074747, 1, 1, 1, 1, 1,
0.8731829, 1.23773, 1.863477, 1, 1, 1, 1, 1,
0.8818774, -1.218022, 4.163456, 1, 1, 1, 1, 1,
0.8911757, 0.6690105, 1.096524, 1, 1, 1, 1, 1,
0.8984652, 0.9815205, 2.261397, 1, 1, 1, 1, 1,
0.8987412, 0.8591872, 0.3046587, 1, 1, 1, 1, 1,
0.9001283, 0.7833976, -0.07957921, 1, 1, 1, 1, 1,
0.9013376, -0.5263997, 0.6484156, 1, 1, 1, 1, 1,
0.9044248, 0.5402594, 0.7299409, 1, 1, 1, 1, 1,
0.9112761, 0.29927, 1.61756, 1, 1, 1, 1, 1,
0.9223388, 1.528311, 0.7778625, 1, 1, 1, 1, 1,
0.928438, -0.6653174, 3.292943, 1, 1, 1, 1, 1,
0.9329865, 0.1087871, 2.257765, 0, 0, 1, 1, 1,
0.935659, 0.174976, 1.903335, 1, 0, 0, 1, 1,
0.941316, -0.2990775, 1.395368, 1, 0, 0, 1, 1,
0.9423505, -0.6513787, 4.41591, 1, 0, 0, 1, 1,
0.9459552, 0.3707498, 0.04221277, 1, 0, 0, 1, 1,
0.9501222, -1.285772, 2.903775, 1, 0, 0, 1, 1,
0.9610838, -2.000101, 3.504235, 0, 0, 0, 1, 1,
0.9747543, 0.6675288, 0.01297635, 0, 0, 0, 1, 1,
0.9766133, 1.851837, 0.3846599, 0, 0, 0, 1, 1,
0.9835832, 0.2876676, 3.523439, 0, 0, 0, 1, 1,
0.9897259, 0.2140899, 1.939327, 0, 0, 0, 1, 1,
0.9925089, -0.2250224, 2.242873, 0, 0, 0, 1, 1,
0.9931335, 0.467196, 1.859299, 0, 0, 0, 1, 1,
1.001036, -0.3245746, 2.307482, 1, 1, 1, 1, 1,
1.001434, -1.244766, 4.696942, 1, 1, 1, 1, 1,
1.005516, 0.3807228, 1.185017, 1, 1, 1, 1, 1,
1.008408, 0.6056311, 1.186514, 1, 1, 1, 1, 1,
1.010304, 2.649962, -0.7562146, 1, 1, 1, 1, 1,
1.01574, 0.064722, 3.000581, 1, 1, 1, 1, 1,
1.016615, -0.6826395, 1.386443, 1, 1, 1, 1, 1,
1.026654, 1.247991, -0.8036583, 1, 1, 1, 1, 1,
1.027053, -0.4253806, 1.31368, 1, 1, 1, 1, 1,
1.033806, -0.9185424, 1.689, 1, 1, 1, 1, 1,
1.034644, 0.6078662, 2.145542, 1, 1, 1, 1, 1,
1.037021, -0.08256572, 1.052445, 1, 1, 1, 1, 1,
1.039824, 0.9927371, 0.3032154, 1, 1, 1, 1, 1,
1.041547, -0.3294303, 2.378071, 1, 1, 1, 1, 1,
1.044698, -2.932226, 2.097693, 1, 1, 1, 1, 1,
1.044916, -1.015631, 2.226282, 0, 0, 1, 1, 1,
1.047868, 0.9110292, 0.9908312, 1, 0, 0, 1, 1,
1.059722, -0.2308497, 1.290249, 1, 0, 0, 1, 1,
1.059769, -0.06598286, 1.519687, 1, 0, 0, 1, 1,
1.061384, -0.1993454, 1.327055, 1, 0, 0, 1, 1,
1.062303, -0.5280676, 2.945992, 1, 0, 0, 1, 1,
1.067223, -0.7448775, 1.010511, 0, 0, 0, 1, 1,
1.069554, 0.596203, 0.6642111, 0, 0, 0, 1, 1,
1.076311, 0.04006038, 1.495932, 0, 0, 0, 1, 1,
1.079425, 0.8913491, 0.7858005, 0, 0, 0, 1, 1,
1.081092, 0.2514383, 0.005752801, 0, 0, 0, 1, 1,
1.08486, 0.2966609, 0.8591921, 0, 0, 0, 1, 1,
1.085977, -0.4860548, 2.63258, 0, 0, 0, 1, 1,
1.089558, -0.4087068, 2.01244, 1, 1, 1, 1, 1,
1.091582, -1.03053, 2.340701, 1, 1, 1, 1, 1,
1.104279, 2.4412, 0.4569047, 1, 1, 1, 1, 1,
1.109263, 1.221297, 2.101579, 1, 1, 1, 1, 1,
1.110287, 1.248588, 0.1527009, 1, 1, 1, 1, 1,
1.112275, -1.979451, 2.0065, 1, 1, 1, 1, 1,
1.112334, -0.3811091, 0.07436364, 1, 1, 1, 1, 1,
1.116279, -1.046036, 1.861105, 1, 1, 1, 1, 1,
1.122606, -0.06329775, 1.037242, 1, 1, 1, 1, 1,
1.128305, -1.346728, 2.070742, 1, 1, 1, 1, 1,
1.132308, 2.332196, -0.2557391, 1, 1, 1, 1, 1,
1.133531, 0.2478632, 0.1715459, 1, 1, 1, 1, 1,
1.13468, 1.501242, 0.5958526, 1, 1, 1, 1, 1,
1.13843, 0.1446235, 2.845344, 1, 1, 1, 1, 1,
1.140649, -0.06004544, 0.6181289, 1, 1, 1, 1, 1,
1.142001, -0.3758309, -0.164069, 0, 0, 1, 1, 1,
1.161034, 0.8184939, 1.95769, 1, 0, 0, 1, 1,
1.161295, -0.9101461, 0.7918409, 1, 0, 0, 1, 1,
1.167533, 0.1266416, 1.201846, 1, 0, 0, 1, 1,
1.172114, 0.02190616, 1.363541, 1, 0, 0, 1, 1,
1.173352, -0.06853765, -0.338838, 1, 0, 0, 1, 1,
1.175187, 1.267123, 1.34, 0, 0, 0, 1, 1,
1.179775, -1.724853, 2.109795, 0, 0, 0, 1, 1,
1.180241, -0.50148, 3.54315, 0, 0, 0, 1, 1,
1.181104, 0.460684, 0.3344981, 0, 0, 0, 1, 1,
1.184418, 0.5093898, 0.1533971, 0, 0, 0, 1, 1,
1.216414, -0.7694222, 0.5517418, 0, 0, 0, 1, 1,
1.220486, -0.1865058, 1.788374, 0, 0, 0, 1, 1,
1.229105, -1.543454, 3.926471, 1, 1, 1, 1, 1,
1.230369, 0.8798234, 1.28345, 1, 1, 1, 1, 1,
1.230596, 0.4036548, 0.7659523, 1, 1, 1, 1, 1,
1.231542, 1.014226, -1.630955, 1, 1, 1, 1, 1,
1.235181, 0.4627362, 2.648307, 1, 1, 1, 1, 1,
1.241858, -0.09697554, 1.186407, 1, 1, 1, 1, 1,
1.244378, -0.8629388, 1.635142, 1, 1, 1, 1, 1,
1.247486, 1.377277, 0.7154404, 1, 1, 1, 1, 1,
1.248719, -0.05141403, 1.730041, 1, 1, 1, 1, 1,
1.262951, -1.203656, 0.550707, 1, 1, 1, 1, 1,
1.2665, -0.9512798, 3.191263, 1, 1, 1, 1, 1,
1.266571, 0.3483222, 2.623228, 1, 1, 1, 1, 1,
1.270318, 0.7735834, 0.5866019, 1, 1, 1, 1, 1,
1.27153, -0.890606, 0.8194219, 1, 1, 1, 1, 1,
1.281365, -0.9645002, 2.900211, 1, 1, 1, 1, 1,
1.28547, -0.6412309, 2.581956, 0, 0, 1, 1, 1,
1.285944, 0.6645945, 0.8763382, 1, 0, 0, 1, 1,
1.295276, 0.8854217, 2.901562, 1, 0, 0, 1, 1,
1.297886, 0.4690748, 0.8463198, 1, 0, 0, 1, 1,
1.298555, 1.27709, -0.288392, 1, 0, 0, 1, 1,
1.298738, 0.6759828, -0.0527864, 1, 0, 0, 1, 1,
1.30514, 0.0004047439, 1.438904, 0, 0, 0, 1, 1,
1.310576, 0.8178427, 0.1642457, 0, 0, 0, 1, 1,
1.316723, -1.621166, 4.786176, 0, 0, 0, 1, 1,
1.31709, -0.2330995, 1.702271, 0, 0, 0, 1, 1,
1.319786, -2.056573, 3.604185, 0, 0, 0, 1, 1,
1.321772, 0.9223154, 2.341618, 0, 0, 0, 1, 1,
1.323815, -0.374447, 2.716512, 0, 0, 0, 1, 1,
1.325247, 0.5394552, 0.5992997, 1, 1, 1, 1, 1,
1.326179, -1.243502, 1.766008, 1, 1, 1, 1, 1,
1.331688, -0.8278523, 2.670082, 1, 1, 1, 1, 1,
1.33932, 1.459007, 1.48653, 1, 1, 1, 1, 1,
1.340212, 0.1994718, 0.4073268, 1, 1, 1, 1, 1,
1.3412, 0.370829, 0.1728645, 1, 1, 1, 1, 1,
1.347781, -1.924114, 3.842641, 1, 1, 1, 1, 1,
1.379063, -0.5963797, 1.390337, 1, 1, 1, 1, 1,
1.379661, -0.3617442, 1.513839, 1, 1, 1, 1, 1,
1.380625, -0.2253648, 1.60858, 1, 1, 1, 1, 1,
1.395349, 0.6216987, 1.611361, 1, 1, 1, 1, 1,
1.395884, -1.470602, 1.161805, 1, 1, 1, 1, 1,
1.411334, 0.5111066, 2.737066, 1, 1, 1, 1, 1,
1.426987, -2.185126, 2.590282, 1, 1, 1, 1, 1,
1.430213, 0.1971488, 2.496782, 1, 1, 1, 1, 1,
1.43364, 0.8294767, 0.1668132, 0, 0, 1, 1, 1,
1.435902, -0.8433723, 1.819349, 1, 0, 0, 1, 1,
1.438872, 1.71745, 0.60844, 1, 0, 0, 1, 1,
1.442359, -0.5914729, 2.179145, 1, 0, 0, 1, 1,
1.447363, -1.616124, 1.990791, 1, 0, 0, 1, 1,
1.452415, 1.794965, 0.8670216, 1, 0, 0, 1, 1,
1.462059, -1.447433, 1.110625, 0, 0, 0, 1, 1,
1.462525, 0.3025567, 1.186703, 0, 0, 0, 1, 1,
1.493131, -0.3909713, 0.7940626, 0, 0, 0, 1, 1,
1.498382, 0.1484123, 3.149125, 0, 0, 0, 1, 1,
1.538047, -0.8059815, 1.834524, 0, 0, 0, 1, 1,
1.544122, 0.8063178, 1.258884, 0, 0, 0, 1, 1,
1.55245, -1.226494, 2.992531, 0, 0, 0, 1, 1,
1.554896, 1.344246, -0.864421, 1, 1, 1, 1, 1,
1.559586, -1.250594, 1.076307, 1, 1, 1, 1, 1,
1.565961, -0.9755005, 3.031997, 1, 1, 1, 1, 1,
1.581648, -0.1108828, 1.547903, 1, 1, 1, 1, 1,
1.587895, -0.05203112, 2.061422, 1, 1, 1, 1, 1,
1.59313, 0.8258087, 0.3581026, 1, 1, 1, 1, 1,
1.601468, 0.1349721, -0.7122092, 1, 1, 1, 1, 1,
1.607896, -0.2840162, 2.348935, 1, 1, 1, 1, 1,
1.614474, 0.2100043, 4.371796, 1, 1, 1, 1, 1,
1.618029, -1.69434, 3.616006, 1, 1, 1, 1, 1,
1.620849, 1.310816, 2.274495, 1, 1, 1, 1, 1,
1.622951, 0.7047257, 1.397019, 1, 1, 1, 1, 1,
1.629825, 0.3595775, 1.04197, 1, 1, 1, 1, 1,
1.634516, -0.5596999, 3.391144, 1, 1, 1, 1, 1,
1.664736, -0.3526585, 0.9566908, 1, 1, 1, 1, 1,
1.673984, -1.437575, 2.304249, 0, 0, 1, 1, 1,
1.695001, -0.1282542, 3.90304, 1, 0, 0, 1, 1,
1.695299, 1.765238, 0.881054, 1, 0, 0, 1, 1,
1.709103, 0.6908236, 2.155992, 1, 0, 0, 1, 1,
1.715139, 2.030136, 0.2031122, 1, 0, 0, 1, 1,
1.758115, 0.8076792, 2.000843, 1, 0, 0, 1, 1,
1.761471, 0.7913013, 0.9509317, 0, 0, 0, 1, 1,
1.797128, -1.112278, 1.509205, 0, 0, 0, 1, 1,
1.820983, -1.1109, 3.690682, 0, 0, 0, 1, 1,
1.866237, -1.11706, 0.9313529, 0, 0, 0, 1, 1,
1.884672, -0.1123781, 1.89793, 0, 0, 0, 1, 1,
1.90928, 0.5227036, 3.164666, 0, 0, 0, 1, 1,
1.928048, -0.3072421, 1.789545, 0, 0, 0, 1, 1,
1.932477, 1.01802, 0.06529385, 1, 1, 1, 1, 1,
1.937975, -1.041459, 3.053828, 1, 1, 1, 1, 1,
1.948036, -0.9223102, 2.805896, 1, 1, 1, 1, 1,
1.951197, 0.4096649, -0.6158999, 1, 1, 1, 1, 1,
1.956614, 1.122378, -2.160386, 1, 1, 1, 1, 1,
1.967874, -0.1339182, 1.522903, 1, 1, 1, 1, 1,
1.978031, 1.56966, 1.41262, 1, 1, 1, 1, 1,
1.999743, -0.479229, 2.484807, 1, 1, 1, 1, 1,
2.000136, -0.159295, 3.034099, 1, 1, 1, 1, 1,
2.019381, -1.011518, 1.753752, 1, 1, 1, 1, 1,
2.028059, 0.6592993, 0.5608811, 1, 1, 1, 1, 1,
2.028376, -0.6194639, 1.943515, 1, 1, 1, 1, 1,
2.049363, -0.4366548, 3.06493, 1, 1, 1, 1, 1,
2.06787, 1.367234, 2.733917, 1, 1, 1, 1, 1,
2.071809, -0.01252333, 2.278549, 1, 1, 1, 1, 1,
2.092807, 0.897112, 0.727357, 0, 0, 1, 1, 1,
2.105361, 0.9579709, 0.9003872, 1, 0, 0, 1, 1,
2.112114, -0.8503144, 2.200495, 1, 0, 0, 1, 1,
2.119579, 0.2172713, 1.745526, 1, 0, 0, 1, 1,
2.177797, -2.270523, 2.220934, 1, 0, 0, 1, 1,
2.181578, -1.271745, -0.07173364, 1, 0, 0, 1, 1,
2.194114, 0.3203392, 1.429519, 0, 0, 0, 1, 1,
2.19843, 0.274974, 0.9865344, 0, 0, 0, 1, 1,
2.217908, -0.2488655, 1.589132, 0, 0, 0, 1, 1,
2.284975, 0.3311396, 1.77064, 0, 0, 0, 1, 1,
2.305592, 1.091748, 0.9939756, 0, 0, 0, 1, 1,
2.347632, -1.235089, 3.901008, 0, 0, 0, 1, 1,
2.379941, 0.5322885, 0.2113258, 0, 0, 0, 1, 1,
2.450521, -0.9077024, 1.639218, 1, 1, 1, 1, 1,
2.465664, -1.208361, 1.614486, 1, 1, 1, 1, 1,
2.64488, 0.6426445, -0.3379484, 1, 1, 1, 1, 1,
2.934703, -0.4827645, 1.488539, 1, 1, 1, 1, 1,
2.963464, 0.116801, 1.523932, 1, 1, 1, 1, 1,
3.034508, 0.5857069, 1.211666, 1, 1, 1, 1, 1,
3.364953, 0.822664, 0.5213366, 1, 1, 1, 1, 1
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
var radius = 9.475424;
var distance = 33.28203;
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
mvMatrix.translate( -0.2067691, 0.07786453, 0.1612413 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28203);
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
