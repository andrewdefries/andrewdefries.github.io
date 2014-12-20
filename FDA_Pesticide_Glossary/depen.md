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
-3.430166, 1.42658, -2.132193, 1, 0, 0, 1,
-2.714478, 1.977973, -0.5626959, 1, 0.007843138, 0, 1,
-2.669868, -0.4717989, -1.873585, 1, 0.01176471, 0, 1,
-2.604283, -0.4414132, -0.836126, 1, 0.01960784, 0, 1,
-2.524693, 0.1681676, -0.009256847, 1, 0.02352941, 0, 1,
-2.497417, 0.7494247, -0.538065, 1, 0.03137255, 0, 1,
-2.458091, 1.632427, -1.391184, 1, 0.03529412, 0, 1,
-2.436071, 1.223597, -1.79317, 1, 0.04313726, 0, 1,
-2.407918, 0.2874188, -0.01896236, 1, 0.04705882, 0, 1,
-2.40385, 1.740997, -2.741855, 1, 0.05490196, 0, 1,
-2.398999, 0.4610257, -1.081787, 1, 0.05882353, 0, 1,
-2.297471, 0.349571, 1.168268, 1, 0.06666667, 0, 1,
-2.295696, 0.7257305, 0.820056, 1, 0.07058824, 0, 1,
-2.280624, 0.05120992, -1.147554, 1, 0.07843138, 0, 1,
-2.260097, 0.2301156, -0.1310908, 1, 0.08235294, 0, 1,
-2.250502, -1.715829, -4.539833, 1, 0.09019608, 0, 1,
-2.248352, -0.4854252, -1.886681, 1, 0.09411765, 0, 1,
-2.247442, -1.873849, -2.512184, 1, 0.1019608, 0, 1,
-2.230473, 0.2288923, -1.278309, 1, 0.1098039, 0, 1,
-2.191564, -0.2435103, -1.637685, 1, 0.1137255, 0, 1,
-2.134627, 0.03610582, -1.705076, 1, 0.1215686, 0, 1,
-2.126609, -0.4332379, -1.830065, 1, 0.1254902, 0, 1,
-2.122646, -0.5420055, -0.6139833, 1, 0.1333333, 0, 1,
-2.103651, -1.493005, -3.093172, 1, 0.1372549, 0, 1,
-2.037234, -0.400758, -2.122616, 1, 0.145098, 0, 1,
-2.000057, 2.031847, 0.1502483, 1, 0.1490196, 0, 1,
-1.957532, 1.881191, -0.1558545, 1, 0.1568628, 0, 1,
-1.942661, -0.08233101, -2.439348, 1, 0.1607843, 0, 1,
-1.938218, 0.4467092, -2.799728, 1, 0.1686275, 0, 1,
-1.931689, 0.6226948, -1.64106, 1, 0.172549, 0, 1,
-1.928173, 1.587247, -0.9147999, 1, 0.1803922, 0, 1,
-1.906359, 0.6134219, -1.49039, 1, 0.1843137, 0, 1,
-1.883503, 0.7846183, -1.633625, 1, 0.1921569, 0, 1,
-1.860493, -0.3802982, -1.390365, 1, 0.1960784, 0, 1,
-1.860391, 0.2071846, -2.66257, 1, 0.2039216, 0, 1,
-1.860212, -0.7354735, -1.228432, 1, 0.2117647, 0, 1,
-1.854643, -0.4348406, -0.9300916, 1, 0.2156863, 0, 1,
-1.841585, -1.077415, -1.314587, 1, 0.2235294, 0, 1,
-1.826791, -0.3391108, -2.422322, 1, 0.227451, 0, 1,
-1.822077, -1.520963, -2.267751, 1, 0.2352941, 0, 1,
-1.820343, -0.2895621, -1.827738, 1, 0.2392157, 0, 1,
-1.815099, 0.08946241, -0.4093756, 1, 0.2470588, 0, 1,
-1.741633, -1.170036, -3.775448, 1, 0.2509804, 0, 1,
-1.723927, 0.001176347, -2.954779, 1, 0.2588235, 0, 1,
-1.697233, -0.4667165, -1.634351, 1, 0.2627451, 0, 1,
-1.686416, 1.92176, 0.2187062, 1, 0.2705882, 0, 1,
-1.679182, 1.525911, -0.5188498, 1, 0.2745098, 0, 1,
-1.677103, 0.05234338, -1.980337, 1, 0.282353, 0, 1,
-1.674331, -1.472311, -3.699569, 1, 0.2862745, 0, 1,
-1.669667, -1.548617, -2.463808, 1, 0.2941177, 0, 1,
-1.654928, -0.1549502, -0.7789791, 1, 0.3019608, 0, 1,
-1.651827, -0.4085494, -1.654934, 1, 0.3058824, 0, 1,
-1.650064, -2.271379, -4.085774, 1, 0.3137255, 0, 1,
-1.642974, 1.329695, -3.131279, 1, 0.3176471, 0, 1,
-1.639003, -0.4738045, -1.413285, 1, 0.3254902, 0, 1,
-1.636609, -0.4343662, -2.261632, 1, 0.3294118, 0, 1,
-1.615644, -1.830372, -2.017697, 1, 0.3372549, 0, 1,
-1.612012, 1.200358, -2.755577, 1, 0.3411765, 0, 1,
-1.59568, -0.4437554, -2.009017, 1, 0.3490196, 0, 1,
-1.593022, 1.002358, -2.610665, 1, 0.3529412, 0, 1,
-1.573578, 1.630676, -0.5582044, 1, 0.3607843, 0, 1,
-1.562874, -2.021677, -2.855586, 1, 0.3647059, 0, 1,
-1.562178, 0.249827, -0.8248781, 1, 0.372549, 0, 1,
-1.558966, -0.8069456, -3.050093, 1, 0.3764706, 0, 1,
-1.553046, -0.1321272, -1.603777, 1, 0.3843137, 0, 1,
-1.539385, -0.4705162, -1.608078, 1, 0.3882353, 0, 1,
-1.537862, -0.4859678, -0.4190235, 1, 0.3960784, 0, 1,
-1.536051, -1.626158, -5.131848, 1, 0.4039216, 0, 1,
-1.52669, 2.30638, -1.79748, 1, 0.4078431, 0, 1,
-1.520959, 2.906301, -0.4786282, 1, 0.4156863, 0, 1,
-1.517882, 0.3406005, -1.912516, 1, 0.4196078, 0, 1,
-1.514236, -0.03813344, -1.713941, 1, 0.427451, 0, 1,
-1.497949, 0.3294204, -3.719371, 1, 0.4313726, 0, 1,
-1.486407, -0.522804, -2.570181, 1, 0.4392157, 0, 1,
-1.482667, 0.9986196, -1.226544, 1, 0.4431373, 0, 1,
-1.476807, -0.06292174, -1.513781, 1, 0.4509804, 0, 1,
-1.476396, 1.483459, 0.336446, 1, 0.454902, 0, 1,
-1.472983, -0.2461005, -2.882807, 1, 0.4627451, 0, 1,
-1.471854, 0.9795488, -1.441568, 1, 0.4666667, 0, 1,
-1.424183, -0.242816, -1.769994, 1, 0.4745098, 0, 1,
-1.415715, -1.305419, -1.789026, 1, 0.4784314, 0, 1,
-1.403968, -0.4013092, -1.007844, 1, 0.4862745, 0, 1,
-1.399405, 2.061191, -0.3532487, 1, 0.4901961, 0, 1,
-1.39905, -1.380552, -2.993704, 1, 0.4980392, 0, 1,
-1.393119, -2.198872, -4.072768, 1, 0.5058824, 0, 1,
-1.392857, 1.106681, -1.436107, 1, 0.509804, 0, 1,
-1.376838, -0.9835955, -1.83237, 1, 0.5176471, 0, 1,
-1.373276, -1.387958, -2.006908, 1, 0.5215687, 0, 1,
-1.372067, 0.5697565, -1.876148, 1, 0.5294118, 0, 1,
-1.365366, 1.219539, -0.7449637, 1, 0.5333334, 0, 1,
-1.352416, -0.7876481, -1.548663, 1, 0.5411765, 0, 1,
-1.350148, -0.3015989, -1.848135, 1, 0.5450981, 0, 1,
-1.342375, -0.1453997, -0.9367848, 1, 0.5529412, 0, 1,
-1.339384, 0.1753113, -1.08653, 1, 0.5568628, 0, 1,
-1.338783, -0.9258503, -2.263297, 1, 0.5647059, 0, 1,
-1.334446, 0.7116008, 0.259586, 1, 0.5686275, 0, 1,
-1.330866, -1.276052, -3.546647, 1, 0.5764706, 0, 1,
-1.327416, -0.2833733, -3.759637, 1, 0.5803922, 0, 1,
-1.304531, 0.6447147, -1.877758, 1, 0.5882353, 0, 1,
-1.301376, -0.4205137, -2.691872, 1, 0.5921569, 0, 1,
-1.290161, -0.375424, -0.5427203, 1, 0.6, 0, 1,
-1.28327, -0.2410782, -1.644668, 1, 0.6078432, 0, 1,
-1.282713, -1.576551, -0.7934676, 1, 0.6117647, 0, 1,
-1.282283, -0.2926359, -1.348426, 1, 0.6196079, 0, 1,
-1.278523, -1.830473, -2.716913, 1, 0.6235294, 0, 1,
-1.272363, -1.669419, -1.362605, 1, 0.6313726, 0, 1,
-1.264246, -0.5586794, -1.049961, 1, 0.6352941, 0, 1,
-1.263485, -0.3851924, -1.806774, 1, 0.6431373, 0, 1,
-1.254714, -0.4996255, -1.351092, 1, 0.6470588, 0, 1,
-1.249689, -0.04864381, -2.105275, 1, 0.654902, 0, 1,
-1.234832, -0.1491427, -1.427394, 1, 0.6588235, 0, 1,
-1.228574, 1.338559, -0.4186015, 1, 0.6666667, 0, 1,
-1.225486, 0.991236, -0.7389173, 1, 0.6705883, 0, 1,
-1.211612, -1.226613, -2.555231, 1, 0.6784314, 0, 1,
-1.204939, 0.5024089, -0.4679531, 1, 0.682353, 0, 1,
-1.200443, -0.2262471, -3.28865, 1, 0.6901961, 0, 1,
-1.196162, -0.4535388, -1.688513, 1, 0.6941177, 0, 1,
-1.187464, 2.049685, -0.4514976, 1, 0.7019608, 0, 1,
-1.179794, -0.2157566, -0.9361936, 1, 0.7098039, 0, 1,
-1.167253, 0.4429206, -0.3572501, 1, 0.7137255, 0, 1,
-1.164715, -0.3241198, -1.611997, 1, 0.7215686, 0, 1,
-1.162463, -1.243397, -0.7757801, 1, 0.7254902, 0, 1,
-1.159781, 0.4799006, 0.3754084, 1, 0.7333333, 0, 1,
-1.157069, 0.5763778, -2.626704, 1, 0.7372549, 0, 1,
-1.15315, -0.04879753, -1.44095, 1, 0.7450981, 0, 1,
-1.14522, -0.4763009, -0.3030313, 1, 0.7490196, 0, 1,
-1.14489, -0.8282098, -2.45949, 1, 0.7568628, 0, 1,
-1.144629, 0.3637444, 0.2190762, 1, 0.7607843, 0, 1,
-1.143559, -0.0390902, -3.559222, 1, 0.7686275, 0, 1,
-1.140847, 1.149765, -2.397343, 1, 0.772549, 0, 1,
-1.139849, -0.6726755, -0.5402345, 1, 0.7803922, 0, 1,
-1.136953, -0.506787, -0.3704808, 1, 0.7843137, 0, 1,
-1.134996, 0.5372583, -2.277107, 1, 0.7921569, 0, 1,
-1.133768, 0.2074652, -2.37875, 1, 0.7960784, 0, 1,
-1.126881, -1.421216, -4.173718, 1, 0.8039216, 0, 1,
-1.121076, -0.909266, -3.489864, 1, 0.8117647, 0, 1,
-1.118723, 0.7814442, 0.0709683, 1, 0.8156863, 0, 1,
-1.112863, -0.785511, -2.469761, 1, 0.8235294, 0, 1,
-1.105305, -0.4045425, -1.491721, 1, 0.827451, 0, 1,
-1.100999, 0.8239288, -0.3940809, 1, 0.8352941, 0, 1,
-1.08454, -0.5603516, -1.320975, 1, 0.8392157, 0, 1,
-1.079969, -0.06038313, -0.2522933, 1, 0.8470588, 0, 1,
-1.077382, -0.6925849, -2.134288, 1, 0.8509804, 0, 1,
-1.076932, -0.3174994, -1.313584, 1, 0.8588235, 0, 1,
-1.076406, -0.9713829, -2.227511, 1, 0.8627451, 0, 1,
-1.071272, -0.6497675, -3.105692, 1, 0.8705882, 0, 1,
-1.066921, 0.008139047, -2.084805, 1, 0.8745098, 0, 1,
-1.066804, -0.7955203, -2.400394, 1, 0.8823529, 0, 1,
-1.059756, 0.5984119, -1.434893, 1, 0.8862745, 0, 1,
-1.051253, 0.30227, -2.492885, 1, 0.8941177, 0, 1,
-1.036143, 1.95774, -0.7974594, 1, 0.8980392, 0, 1,
-1.031724, 0.5352384, 0.2216899, 1, 0.9058824, 0, 1,
-1.029076, 1.536186, -0.8959064, 1, 0.9137255, 0, 1,
-1.027979, 0.1115595, -1.549191, 1, 0.9176471, 0, 1,
-1.013198, 2.336738, 0.0007299681, 1, 0.9254902, 0, 1,
-1.008744, 0.7154127, -0.4581048, 1, 0.9294118, 0, 1,
-1.003842, 0.2017659, -3.800035, 1, 0.9372549, 0, 1,
-1.001576, 0.3758546, -1.983134, 1, 0.9411765, 0, 1,
-0.9983677, 0.6191794, 0.262213, 1, 0.9490196, 0, 1,
-0.9971933, 0.9949073, 1.147114, 1, 0.9529412, 0, 1,
-0.9966102, 0.7727058, -0.9159719, 1, 0.9607843, 0, 1,
-0.983944, -0.9303575, -3.875484, 1, 0.9647059, 0, 1,
-0.9823651, 2.046845, -0.5915229, 1, 0.972549, 0, 1,
-0.9792492, 1.251718, -1.390808, 1, 0.9764706, 0, 1,
-0.9753724, 0.27052, -1.1654, 1, 0.9843137, 0, 1,
-0.9662123, 0.4482939, -1.771136, 1, 0.9882353, 0, 1,
-0.9608577, 0.2868632, -0.3019861, 1, 0.9960784, 0, 1,
-0.959933, 0.5726324, -0.4876118, 0.9960784, 1, 0, 1,
-0.9582942, 0.2493368, -1.425184, 0.9921569, 1, 0, 1,
-0.9575346, -0.1792894, -2.188594, 0.9843137, 1, 0, 1,
-0.9570754, 0.3875189, -2.238949, 0.9803922, 1, 0, 1,
-0.9544486, -1.570233, -2.495492, 0.972549, 1, 0, 1,
-0.9531128, 0.4329778, -0.5858276, 0.9686275, 1, 0, 1,
-0.9492694, 0.5428324, -1.2375, 0.9607843, 1, 0, 1,
-0.9453129, -0.4255991, -2.926386, 0.9568627, 1, 0, 1,
-0.9369011, -0.6772122, -0.9640638, 0.9490196, 1, 0, 1,
-0.9336019, 0.8298486, -0.2040342, 0.945098, 1, 0, 1,
-0.9322994, 1.955835, -1.411818, 0.9372549, 1, 0, 1,
-0.9289542, 2.978301, 0.2636348, 0.9333333, 1, 0, 1,
-0.9261082, 0.492495, -0.8594955, 0.9254902, 1, 0, 1,
-0.9059902, 1.805418, 0.6991926, 0.9215686, 1, 0, 1,
-0.8986926, -0.5670466, -2.798526, 0.9137255, 1, 0, 1,
-0.8963828, -0.03136285, -2.044638, 0.9098039, 1, 0, 1,
-0.8958122, 0.1510118, -1.923379, 0.9019608, 1, 0, 1,
-0.8783844, -1.001326, -2.019132, 0.8941177, 1, 0, 1,
-0.8773011, -0.03763418, 0.3642579, 0.8901961, 1, 0, 1,
-0.8735757, 1.411363, -1.260068, 0.8823529, 1, 0, 1,
-0.8729068, -0.6655515, -2.353501, 0.8784314, 1, 0, 1,
-0.8710329, 3.073817, -0.3778409, 0.8705882, 1, 0, 1,
-0.861018, 1.769657, -1.983521, 0.8666667, 1, 0, 1,
-0.8597829, 1.623924, 0.239759, 0.8588235, 1, 0, 1,
-0.8558275, 1.336315, -0.1635472, 0.854902, 1, 0, 1,
-0.8464194, 1.956796, -0.6214141, 0.8470588, 1, 0, 1,
-0.8463181, -0.1679607, -1.487711, 0.8431373, 1, 0, 1,
-0.8431785, -0.9257149, -2.580395, 0.8352941, 1, 0, 1,
-0.8419583, -2.370052, -3.299278, 0.8313726, 1, 0, 1,
-0.8294149, -0.7459587, -3.542882, 0.8235294, 1, 0, 1,
-0.8291897, -0.02244765, -1.790358, 0.8196079, 1, 0, 1,
-0.8186358, -0.5509284, -2.724882, 0.8117647, 1, 0, 1,
-0.8152357, -0.673308, -4.385781, 0.8078431, 1, 0, 1,
-0.814411, -1.11186, -1.510987, 0.8, 1, 0, 1,
-0.8136951, -0.1725067, -0.3388813, 0.7921569, 1, 0, 1,
-0.8129015, 1.527991, -0.08986469, 0.7882353, 1, 0, 1,
-0.8114568, 0.8352606, 0.4596929, 0.7803922, 1, 0, 1,
-0.8099684, 0.5885193, 1.212687, 0.7764706, 1, 0, 1,
-0.8084685, -1.322054, -3.683959, 0.7686275, 1, 0, 1,
-0.8047056, 0.078624, -1.450499, 0.7647059, 1, 0, 1,
-0.8027105, -0.9283475, -0.8285285, 0.7568628, 1, 0, 1,
-0.8010024, -0.8057264, -1.84525, 0.7529412, 1, 0, 1,
-0.7985431, -0.09131137, -3.535743, 0.7450981, 1, 0, 1,
-0.7968504, 0.3066191, -2.316935, 0.7411765, 1, 0, 1,
-0.793866, -0.1947792, -0.900684, 0.7333333, 1, 0, 1,
-0.7918822, -1.721169, -2.454247, 0.7294118, 1, 0, 1,
-0.7905536, -1.471442, -1.060356, 0.7215686, 1, 0, 1,
-0.7869766, -1.882466, -2.172544, 0.7176471, 1, 0, 1,
-0.7864574, 0.1503351, -0.8395884, 0.7098039, 1, 0, 1,
-0.7864384, 0.5961145, -1.20924, 0.7058824, 1, 0, 1,
-0.7844524, -0.4862998, -3.084865, 0.6980392, 1, 0, 1,
-0.783978, -1.011082, -2.168555, 0.6901961, 1, 0, 1,
-0.781958, 0.2349358, -1.48749, 0.6862745, 1, 0, 1,
-0.7739276, 0.2049436, -1.153696, 0.6784314, 1, 0, 1,
-0.7715672, -0.05559143, -1.464385, 0.6745098, 1, 0, 1,
-0.765366, 0.388163, -2.76275, 0.6666667, 1, 0, 1,
-0.7631105, 0.7963806, -1.989684, 0.6627451, 1, 0, 1,
-0.7612395, 0.3346721, -0.9336969, 0.654902, 1, 0, 1,
-0.7582116, 0.4487698, -1.923179, 0.6509804, 1, 0, 1,
-0.7563496, 0.1145564, -1.2588, 0.6431373, 1, 0, 1,
-0.7555328, -1.132782, -1.448429, 0.6392157, 1, 0, 1,
-0.7542668, 0.7279223, -0.8744823, 0.6313726, 1, 0, 1,
-0.7539118, -0.1317704, -0.9426975, 0.627451, 1, 0, 1,
-0.7514445, -0.9282314, -2.292589, 0.6196079, 1, 0, 1,
-0.743075, -1.460979, -2.835194, 0.6156863, 1, 0, 1,
-0.7399508, -0.6458063, -2.94011, 0.6078432, 1, 0, 1,
-0.7347739, 1.158784, -0.3264188, 0.6039216, 1, 0, 1,
-0.7345625, 2.911734, 0.2266613, 0.5960785, 1, 0, 1,
-0.7335071, 1.014351, -1.635121, 0.5882353, 1, 0, 1,
-0.7334836, -0.04192885, 0.2789746, 0.5843138, 1, 0, 1,
-0.7283246, -1.467881, -2.844695, 0.5764706, 1, 0, 1,
-0.7274015, -1.452204, -2.159296, 0.572549, 1, 0, 1,
-0.7259739, -2.22911, -1.49384, 0.5647059, 1, 0, 1,
-0.7128317, -0.8174753, -4.69074, 0.5607843, 1, 0, 1,
-0.7079598, -0.04930117, -1.014682, 0.5529412, 1, 0, 1,
-0.706117, -1.125979, -1.82279, 0.5490196, 1, 0, 1,
-0.7044922, -0.04074257, -1.947812, 0.5411765, 1, 0, 1,
-0.6986089, -0.8650943, -2.537566, 0.5372549, 1, 0, 1,
-0.6978679, -0.2702167, -1.852631, 0.5294118, 1, 0, 1,
-0.6976525, 1.333952, -0.1868544, 0.5254902, 1, 0, 1,
-0.6963065, 1.074672, -1.393455, 0.5176471, 1, 0, 1,
-0.6952981, -0.9440418, -3.196221, 0.5137255, 1, 0, 1,
-0.6929806, 0.3854213, -1.148386, 0.5058824, 1, 0, 1,
-0.683207, -0.1319333, -2.089746, 0.5019608, 1, 0, 1,
-0.6820931, -0.3339238, -3.579345, 0.4941176, 1, 0, 1,
-0.6803755, 0.6244313, 0.2295609, 0.4862745, 1, 0, 1,
-0.6774045, 1.077915, -0.3309954, 0.4823529, 1, 0, 1,
-0.6773861, 1.200884, -1.893642, 0.4745098, 1, 0, 1,
-0.6694677, -0.4050457, -1.213341, 0.4705882, 1, 0, 1,
-0.6689922, 1.26803, 0.5643998, 0.4627451, 1, 0, 1,
-0.6665201, 1.475247, -0.7317094, 0.4588235, 1, 0, 1,
-0.6646005, 0.2490941, 0.7470362, 0.4509804, 1, 0, 1,
-0.6638678, -0.5646423, 0.106994, 0.4470588, 1, 0, 1,
-0.6563143, 0.6318921, -0.7670394, 0.4392157, 1, 0, 1,
-0.653122, -0.7166405, -3.406453, 0.4352941, 1, 0, 1,
-0.6523968, 0.7653129, -0.3675774, 0.427451, 1, 0, 1,
-0.6427947, 0.1450596, -2.436308, 0.4235294, 1, 0, 1,
-0.6421465, -1.443206, -3.002108, 0.4156863, 1, 0, 1,
-0.6420987, 0.5684988, -0.2111765, 0.4117647, 1, 0, 1,
-0.6381931, -0.1203253, -1.548657, 0.4039216, 1, 0, 1,
-0.6332265, -0.2695474, -2.81337, 0.3960784, 1, 0, 1,
-0.6306935, 0.7797122, 0.244685, 0.3921569, 1, 0, 1,
-0.6296704, -0.5937697, -0.7373632, 0.3843137, 1, 0, 1,
-0.6289993, 0.6397829, -0.04751942, 0.3803922, 1, 0, 1,
-0.6288136, 0.07372064, -2.588966, 0.372549, 1, 0, 1,
-0.6262226, -0.2063294, 0.3924469, 0.3686275, 1, 0, 1,
-0.6245819, 0.8741124, 1.318032, 0.3607843, 1, 0, 1,
-0.6211237, -0.2749871, -1.665578, 0.3568628, 1, 0, 1,
-0.6185285, 0.1688902, -3.258958, 0.3490196, 1, 0, 1,
-0.616829, 1.443719, 1.75545, 0.345098, 1, 0, 1,
-0.6138543, 0.4799061, -1.484359, 0.3372549, 1, 0, 1,
-0.6131399, 0.3260716, -1.295794, 0.3333333, 1, 0, 1,
-0.6127427, 1.63191, -0.8361642, 0.3254902, 1, 0, 1,
-0.6118481, 1.692821, -0.8109497, 0.3215686, 1, 0, 1,
-0.6092299, -1.647834, -1.342696, 0.3137255, 1, 0, 1,
-0.6049377, 0.7948597, -1.818256, 0.3098039, 1, 0, 1,
-0.604591, -0.2522212, -3.147064, 0.3019608, 1, 0, 1,
-0.6000984, -0.2958548, -1.690063, 0.2941177, 1, 0, 1,
-0.5972925, 0.7438527, -1.635662, 0.2901961, 1, 0, 1,
-0.5939795, 1.046122, -0.9146208, 0.282353, 1, 0, 1,
-0.5917552, 1.010671, -0.219032, 0.2784314, 1, 0, 1,
-0.5854492, 1.44865, 1.130115, 0.2705882, 1, 0, 1,
-0.5837412, -0.03804516, 1.173948, 0.2666667, 1, 0, 1,
-0.5830611, 1.587023, -0.4162128, 0.2588235, 1, 0, 1,
-0.5732243, -0.1632014, -0.630712, 0.254902, 1, 0, 1,
-0.5723801, -0.787387, -3.564639, 0.2470588, 1, 0, 1,
-0.5707726, 0.825703, -1.136823, 0.2431373, 1, 0, 1,
-0.5678812, 0.8808326, 0.5390612, 0.2352941, 1, 0, 1,
-0.5634729, 1.49155, -0.6714076, 0.2313726, 1, 0, 1,
-0.5625328, 0.8371388, 0.5487275, 0.2235294, 1, 0, 1,
-0.5622305, -0.4142394, -1.71996, 0.2196078, 1, 0, 1,
-0.5571567, -2.182164, -3.037651, 0.2117647, 1, 0, 1,
-0.5492668, -0.6040815, -1.851102, 0.2078431, 1, 0, 1,
-0.5467695, 1.352304, 0.2379386, 0.2, 1, 0, 1,
-0.5464841, -0.5085081, -2.814114, 0.1921569, 1, 0, 1,
-0.5462737, -2.161523, -2.948307, 0.1882353, 1, 0, 1,
-0.5420234, 0.8676826, -1.718545, 0.1803922, 1, 0, 1,
-0.5395792, -1.855868, -1.689832, 0.1764706, 1, 0, 1,
-0.5388263, -0.8662926, -0.8511195, 0.1686275, 1, 0, 1,
-0.535022, -0.243325, -2.249827, 0.1647059, 1, 0, 1,
-0.5332243, -0.7745199, -3.069759, 0.1568628, 1, 0, 1,
-0.5314795, 1.642514, -2.861231, 0.1529412, 1, 0, 1,
-0.5168152, 1.31176, -1.67307, 0.145098, 1, 0, 1,
-0.5146661, -1.076428, -3.028235, 0.1411765, 1, 0, 1,
-0.510947, 0.3824808, -0.7881955, 0.1333333, 1, 0, 1,
-0.5004601, -0.4539477, -1.681699, 0.1294118, 1, 0, 1,
-0.4969282, 0.4916739, -0.95214, 0.1215686, 1, 0, 1,
-0.4964339, 0.4488221, -0.08362143, 0.1176471, 1, 0, 1,
-0.4930794, 0.8556874, -1.090264, 0.1098039, 1, 0, 1,
-0.4897388, 0.1679722, -1.327284, 0.1058824, 1, 0, 1,
-0.488331, -1.602782, -3.845456, 0.09803922, 1, 0, 1,
-0.4819669, 0.9775112, 0.2531503, 0.09019608, 1, 0, 1,
-0.4811283, -0.8369138, -1.065172, 0.08627451, 1, 0, 1,
-0.4798468, -1.430432, -2.561731, 0.07843138, 1, 0, 1,
-0.4788146, 2.461077, 0.2702485, 0.07450981, 1, 0, 1,
-0.4735317, -0.7469076, -3.971721, 0.06666667, 1, 0, 1,
-0.4725538, -0.004887093, -1.490675, 0.0627451, 1, 0, 1,
-0.4711663, -0.7476192, -1.250668, 0.05490196, 1, 0, 1,
-0.4703344, 3.267779, -1.384231, 0.05098039, 1, 0, 1,
-0.4693103, 0.8305752, -0.3165555, 0.04313726, 1, 0, 1,
-0.4616885, 0.8333569, -0.9792774, 0.03921569, 1, 0, 1,
-0.4606097, -2.056726, -2.695103, 0.03137255, 1, 0, 1,
-0.4593924, 0.1759987, -2.566347, 0.02745098, 1, 0, 1,
-0.4557059, 0.8514451, -0.3155273, 0.01960784, 1, 0, 1,
-0.4546807, -1.391378, -2.579324, 0.01568628, 1, 0, 1,
-0.4543143, 0.4820734, -1.770769, 0.007843138, 1, 0, 1,
-0.4427909, -1.217359, -4.027981, 0.003921569, 1, 0, 1,
-0.4387107, 0.9586322, -0.3389151, 0, 1, 0.003921569, 1,
-0.4364286, 1.398107, -0.3744505, 0, 1, 0.01176471, 1,
-0.4315669, -0.5866769, -1.844778, 0, 1, 0.01568628, 1,
-0.4303492, 0.4904798, -0.913594, 0, 1, 0.02352941, 1,
-0.4112278, -1.140203, -3.184391, 0, 1, 0.02745098, 1,
-0.4110555, 1.117503, 0.2768118, 0, 1, 0.03529412, 1,
-0.4087745, 0.06372441, -0.7262107, 0, 1, 0.03921569, 1,
-0.4076274, 0.2178416, -2.229324, 0, 1, 0.04705882, 1,
-0.404817, 0.2984096, -1.500698, 0, 1, 0.05098039, 1,
-0.4007114, 0.4431705, -0.8185056, 0, 1, 0.05882353, 1,
-0.3949283, 0.4449292, -0.2432222, 0, 1, 0.0627451, 1,
-0.3922448, 0.6318336, -0.5902776, 0, 1, 0.07058824, 1,
-0.3921344, 1.062241, 0.3961076, 0, 1, 0.07450981, 1,
-0.3909592, -1.58401, -3.525966, 0, 1, 0.08235294, 1,
-0.3862724, -0.3305887, -3.675913, 0, 1, 0.08627451, 1,
-0.3742128, -0.2897078, -3.906239, 0, 1, 0.09411765, 1,
-0.3726085, 0.4620606, -0.8279968, 0, 1, 0.1019608, 1,
-0.3658655, 0.7481684, -0.05575159, 0, 1, 0.1058824, 1,
-0.3636812, 0.3036017, -2.705777, 0, 1, 0.1137255, 1,
-0.3625057, 0.8544974, 0.1639479, 0, 1, 0.1176471, 1,
-0.3600361, 1.835875, 0.7035415, 0, 1, 0.1254902, 1,
-0.3592361, 1.011386, -1.122095, 0, 1, 0.1294118, 1,
-0.3589392, 0.349394, -0.161392, 0, 1, 0.1372549, 1,
-0.3588136, 0.18991, -1.720911, 0, 1, 0.1411765, 1,
-0.3554679, 0.4492941, -0.4375445, 0, 1, 0.1490196, 1,
-0.3528565, -0.8588033, -3.029276, 0, 1, 0.1529412, 1,
-0.3499525, -0.576594, -1.542835, 0, 1, 0.1607843, 1,
-0.3427106, -0.8421077, -2.2831, 0, 1, 0.1647059, 1,
-0.3419408, -1.237176, -2.162451, 0, 1, 0.172549, 1,
-0.339768, -0.5927554, -3.586509, 0, 1, 0.1764706, 1,
-0.3388632, 0.6034566, -0.862774, 0, 1, 0.1843137, 1,
-0.3387064, 0.5376438, -1.098137, 0, 1, 0.1882353, 1,
-0.325586, -0.3540347, -1.511373, 0, 1, 0.1960784, 1,
-0.3245572, -0.7680105, -2.832191, 0, 1, 0.2039216, 1,
-0.3212143, -1.281228, -4.337051, 0, 1, 0.2078431, 1,
-0.3208655, 1.661388, -0.2397542, 0, 1, 0.2156863, 1,
-0.3122191, 0.8092064, 0.7644174, 0, 1, 0.2196078, 1,
-0.3089544, 1.936207, 0.05376263, 0, 1, 0.227451, 1,
-0.3077803, 0.4443355, -0.2338342, 0, 1, 0.2313726, 1,
-0.3056717, -0.3567131, -2.579273, 0, 1, 0.2392157, 1,
-0.30562, -0.4245401, -3.438693, 0, 1, 0.2431373, 1,
-0.3041075, 0.1835633, -1.166059, 0, 1, 0.2509804, 1,
-0.2964532, 0.4563181, -0.1192135, 0, 1, 0.254902, 1,
-0.2959211, -1.12762, -1.177841, 0, 1, 0.2627451, 1,
-0.295793, -1.46783, -3.340674, 0, 1, 0.2666667, 1,
-0.2957419, -0.03083625, -2.941233, 0, 1, 0.2745098, 1,
-0.2923219, 0.8250771, -1.675413, 0, 1, 0.2784314, 1,
-0.2922485, -0.9790837, -2.57161, 0, 1, 0.2862745, 1,
-0.2870289, 0.1360172, -2.359535, 0, 1, 0.2901961, 1,
-0.2855634, -0.3385435, -2.19426, 0, 1, 0.2980392, 1,
-0.2823065, 1.162645, 0.1846937, 0, 1, 0.3058824, 1,
-0.2807948, -0.207738, -0.789843, 0, 1, 0.3098039, 1,
-0.278962, 0.07452002, -0.0716031, 0, 1, 0.3176471, 1,
-0.2760101, -0.085953, -2.213696, 0, 1, 0.3215686, 1,
-0.2716829, -1.033438, -1.291121, 0, 1, 0.3294118, 1,
-0.2667679, -0.7189614, -3.314679, 0, 1, 0.3333333, 1,
-0.2662356, 0.8374134, -1.476997, 0, 1, 0.3411765, 1,
-0.2612529, 1.127789, 1.46621, 0, 1, 0.345098, 1,
-0.2610731, 0.6080732, 0.04190617, 0, 1, 0.3529412, 1,
-0.2587503, 1.59451, -0.2548026, 0, 1, 0.3568628, 1,
-0.2556667, 0.1884318, 0.760178, 0, 1, 0.3647059, 1,
-0.2536037, 0.8774254, -0.3292368, 0, 1, 0.3686275, 1,
-0.2518973, -2.004221, -3.889097, 0, 1, 0.3764706, 1,
-0.2477632, 0.3470019, -2.965283, 0, 1, 0.3803922, 1,
-0.2443036, -0.7575295, -3.177871, 0, 1, 0.3882353, 1,
-0.2438164, -1.023122, -3.093574, 0, 1, 0.3921569, 1,
-0.242078, -0.6567267, -1.498603, 0, 1, 0.4, 1,
-0.2395336, 1.411485, 1.028072, 0, 1, 0.4078431, 1,
-0.2372768, 0.8181992, 0.8344014, 0, 1, 0.4117647, 1,
-0.236334, 1.674078, -2.454335, 0, 1, 0.4196078, 1,
-0.2324685, 1.700017, -1.069979, 0, 1, 0.4235294, 1,
-0.2300814, -0.6227191, -3.915364, 0, 1, 0.4313726, 1,
-0.2294496, 0.2435476, -0.670997, 0, 1, 0.4352941, 1,
-0.2273422, 0.3297666, 0.1701225, 0, 1, 0.4431373, 1,
-0.222316, -1.902543, -3.538426, 0, 1, 0.4470588, 1,
-0.2215461, 0.8816119, -0.08456118, 0, 1, 0.454902, 1,
-0.2193731, -0.3318713, -2.106867, 0, 1, 0.4588235, 1,
-0.2176443, -0.7082762, -3.112849, 0, 1, 0.4666667, 1,
-0.2166361, -0.2849422, -2.692589, 0, 1, 0.4705882, 1,
-0.2163992, -0.6157249, -2.41755, 0, 1, 0.4784314, 1,
-0.2147894, 0.5471689, -0.9764557, 0, 1, 0.4823529, 1,
-0.2109777, -0.2054311, -3.551819, 0, 1, 0.4901961, 1,
-0.2105021, -1.515029, -3.159864, 0, 1, 0.4941176, 1,
-0.2080404, 0.112933, -1.93695, 0, 1, 0.5019608, 1,
-0.2078287, 1.022892, -0.02920823, 0, 1, 0.509804, 1,
-0.204376, 1.183981, -2.667136, 0, 1, 0.5137255, 1,
-0.2025552, -0.8625371, -4.958956, 0, 1, 0.5215687, 1,
-0.202181, -1.390569, -1.859287, 0, 1, 0.5254902, 1,
-0.2006149, -0.1064161, -3.459254, 0, 1, 0.5333334, 1,
-0.1964714, -0.7609382, -4.244481, 0, 1, 0.5372549, 1,
-0.1910624, -1.350692, -3.475976, 0, 1, 0.5450981, 1,
-0.1904006, 1.76129, -0.6506882, 0, 1, 0.5490196, 1,
-0.1866264, -0.1680838, -2.918491, 0, 1, 0.5568628, 1,
-0.1832785, -0.4718915, -2.03133, 0, 1, 0.5607843, 1,
-0.1801718, 0.09937475, -2.780214, 0, 1, 0.5686275, 1,
-0.1780286, -1.994198, -2.886479, 0, 1, 0.572549, 1,
-0.1729055, -0.5716344, -1.318858, 0, 1, 0.5803922, 1,
-0.1709628, 0.4810259, 1.197386, 0, 1, 0.5843138, 1,
-0.1657098, 0.679289, -0.2000471, 0, 1, 0.5921569, 1,
-0.1633979, 1.181598, -2.426003, 0, 1, 0.5960785, 1,
-0.1606235, -1.732057, -2.870229, 0, 1, 0.6039216, 1,
-0.1577429, 0.5260304, 1.677294, 0, 1, 0.6117647, 1,
-0.1515702, -0.5793964, -2.254625, 0, 1, 0.6156863, 1,
-0.1505812, -0.2597733, -0.2724581, 0, 1, 0.6235294, 1,
-0.149363, -0.8244198, -0.6354498, 0, 1, 0.627451, 1,
-0.146244, 0.01941899, -0.5822288, 0, 1, 0.6352941, 1,
-0.144341, -0.5182132, -3.814167, 0, 1, 0.6392157, 1,
-0.1404792, 0.4886151, 1.949333, 0, 1, 0.6470588, 1,
-0.1212913, -0.4795076, -3.862322, 0, 1, 0.6509804, 1,
-0.1180423, -1.311226, -3.352104, 0, 1, 0.6588235, 1,
-0.1152657, -0.5788953, -3.464379, 0, 1, 0.6627451, 1,
-0.1124191, 0.9876987, -0.8652898, 0, 1, 0.6705883, 1,
-0.1107943, -1.365994, -4.315699, 0, 1, 0.6745098, 1,
-0.1098254, 0.2461595, -1.76669, 0, 1, 0.682353, 1,
-0.1074494, 0.3004728, -0.812684, 0, 1, 0.6862745, 1,
-0.1054696, 0.220973, -0.1269009, 0, 1, 0.6941177, 1,
-0.1028412, 0.9614877, 0.4441603, 0, 1, 0.7019608, 1,
-0.0923036, 1.640613, 0.67706, 0, 1, 0.7058824, 1,
-0.0870136, 0.4744325, -1.796125, 0, 1, 0.7137255, 1,
-0.08599596, 0.9305201, -0.5541912, 0, 1, 0.7176471, 1,
-0.08269816, -1.089295, -4.298409, 0, 1, 0.7254902, 1,
-0.08193895, -1.866082, -3.758762, 0, 1, 0.7294118, 1,
-0.08093342, -3.220781, -3.39127, 0, 1, 0.7372549, 1,
-0.08018893, -1.194099, -2.992415, 0, 1, 0.7411765, 1,
-0.07906137, -2.554389, -3.268502, 0, 1, 0.7490196, 1,
-0.07284462, 1.587925, 0.8482698, 0, 1, 0.7529412, 1,
-0.06375768, 0.3232732, -1.695776, 0, 1, 0.7607843, 1,
-0.0609509, 0.01414527, -0.7594332, 0, 1, 0.7647059, 1,
-0.05704875, -0.1334726, -3.343309, 0, 1, 0.772549, 1,
-0.05528243, 1.834237, -0.5332738, 0, 1, 0.7764706, 1,
-0.05328969, -0.1358062, -2.480658, 0, 1, 0.7843137, 1,
-0.04826195, -0.2764361, -2.835445, 0, 1, 0.7882353, 1,
-0.04277317, -0.4051792, -2.7386, 0, 1, 0.7960784, 1,
-0.04213729, -1.130021, -2.771978, 0, 1, 0.8039216, 1,
-0.0392319, 1.679067, 1.179461, 0, 1, 0.8078431, 1,
-0.03839797, -0.8976627, -2.16627, 0, 1, 0.8156863, 1,
-0.03789908, 1.412135, 0.07755134, 0, 1, 0.8196079, 1,
-0.03691777, -0.3177954, -1.800847, 0, 1, 0.827451, 1,
-0.03404331, -1.763917, -3.555591, 0, 1, 0.8313726, 1,
-0.0319967, 0.2958677, 0.3104893, 0, 1, 0.8392157, 1,
-0.02860174, -0.3010469, -3.979915, 0, 1, 0.8431373, 1,
-0.02843425, 1.879947, -1.376986, 0, 1, 0.8509804, 1,
-0.02720586, -1.000947, -3.884525, 0, 1, 0.854902, 1,
-0.02048839, -1.095022, -4.271782, 0, 1, 0.8627451, 1,
-0.01952287, 0.7015048, -0.7180713, 0, 1, 0.8666667, 1,
-0.01759431, 1.592878, -1.619191, 0, 1, 0.8745098, 1,
-0.01708513, 0.8757252, 0.6021329, 0, 1, 0.8784314, 1,
-0.01701303, 1.70081, 0.6815526, 0, 1, 0.8862745, 1,
-0.01283161, -1.465324, -3.130415, 0, 1, 0.8901961, 1,
-0.006415369, 0.9234971, 1.352752, 0, 1, 0.8980392, 1,
-0.004257326, 0.9487726, -1.690794, 0, 1, 0.9058824, 1,
0.002735089, 0.914915, -0.3742763, 0, 1, 0.9098039, 1,
0.006400355, 0.2819783, -0.03049255, 0, 1, 0.9176471, 1,
0.01661206, 0.4618835, 1.980166, 0, 1, 0.9215686, 1,
0.01677601, 0.8171635, -0.5733908, 0, 1, 0.9294118, 1,
0.02132513, -0.4425768, 3.905838, 0, 1, 0.9333333, 1,
0.03130772, 0.6613678, 0.1782478, 0, 1, 0.9411765, 1,
0.03174025, 0.02826545, 2.058287, 0, 1, 0.945098, 1,
0.03946463, 0.3198518, -1.83561, 0, 1, 0.9529412, 1,
0.04062117, 0.06946202, -0.1493213, 0, 1, 0.9568627, 1,
0.04250671, -0.7997642, 4.227371, 0, 1, 0.9647059, 1,
0.04402361, 1.396021, -1.084112, 0, 1, 0.9686275, 1,
0.0440257, -0.9268618, 2.596101, 0, 1, 0.9764706, 1,
0.0445088, 0.2181403, -0.4477524, 0, 1, 0.9803922, 1,
0.04789055, -1.092151, 3.578904, 0, 1, 0.9882353, 1,
0.04991597, 2.775663, 0.299486, 0, 1, 0.9921569, 1,
0.05070522, 0.8497667, -0.389643, 0, 1, 1, 1,
0.05104151, -0.2434295, 2.970731, 0, 0.9921569, 1, 1,
0.05349418, 0.6326153, -0.08236919, 0, 0.9882353, 1, 1,
0.05681312, -2.534254, 3.177346, 0, 0.9803922, 1, 1,
0.05837983, -0.7462348, 1.930814, 0, 0.9764706, 1, 1,
0.05996317, -0.8980922, 2.861569, 0, 0.9686275, 1, 1,
0.06302353, -0.9219103, 1.734223, 0, 0.9647059, 1, 1,
0.06614438, -1.419361, 4.714147, 0, 0.9568627, 1, 1,
0.07093579, -0.2369345, 2.134078, 0, 0.9529412, 1, 1,
0.07167526, 0.9949154, 0.2932143, 0, 0.945098, 1, 1,
0.07459846, 0.03912381, 2.94281, 0, 0.9411765, 1, 1,
0.07497806, -1.293482, 3.178864, 0, 0.9333333, 1, 1,
0.07546028, 0.8572258, -1.198217, 0, 0.9294118, 1, 1,
0.0755312, 0.3570707, 0.200978, 0, 0.9215686, 1, 1,
0.07636753, 0.2101568, -0.8977898, 0, 0.9176471, 1, 1,
0.07894919, 0.8472242, 1.407739, 0, 0.9098039, 1, 1,
0.08231194, 0.6645858, 0.1077907, 0, 0.9058824, 1, 1,
0.08789069, 0.1104031, 1.374962, 0, 0.8980392, 1, 1,
0.0909764, 0.5449604, 0.8110349, 0, 0.8901961, 1, 1,
0.09114777, 0.1145103, -0.3711636, 0, 0.8862745, 1, 1,
0.09131892, -0.3345182, 5.187021, 0, 0.8784314, 1, 1,
0.09299359, -0.1946597, 1.599285, 0, 0.8745098, 1, 1,
0.09393645, -0.1240215, 3.448159, 0, 0.8666667, 1, 1,
0.09776479, 0.3597756, 0.6587322, 0, 0.8627451, 1, 1,
0.09942672, 0.2006683, 2.298491, 0, 0.854902, 1, 1,
0.1003852, -0.925506, 2.361485, 0, 0.8509804, 1, 1,
0.1048734, -0.506255, 2.727086, 0, 0.8431373, 1, 1,
0.1068902, 0.7971207, 0.5417098, 0, 0.8392157, 1, 1,
0.1070512, 0.194116, 3.431205, 0, 0.8313726, 1, 1,
0.1078817, 0.9337839, -0.1544322, 0, 0.827451, 1, 1,
0.1084496, 1.620719, 0.4212659, 0, 0.8196079, 1, 1,
0.1105365, 0.9037831, -0.4870888, 0, 0.8156863, 1, 1,
0.1114734, -0.64556, 2.677968, 0, 0.8078431, 1, 1,
0.1192408, 0.2685325, -1.173411, 0, 0.8039216, 1, 1,
0.1232504, 0.469206, -1.169894, 0, 0.7960784, 1, 1,
0.1251624, 0.1346249, 0.5836315, 0, 0.7882353, 1, 1,
0.1251994, 0.09263957, 0.6614406, 0, 0.7843137, 1, 1,
0.1262938, -2.149319, 3.485928, 0, 0.7764706, 1, 1,
0.1303874, -0.9901105, 2.188322, 0, 0.772549, 1, 1,
0.1306019, 1.122355, 3.094709, 0, 0.7647059, 1, 1,
0.1308994, -0.006053816, 2.562385, 0, 0.7607843, 1, 1,
0.1318384, 0.8513938, 1.770949, 0, 0.7529412, 1, 1,
0.1332643, -0.7325757, 2.941087, 0, 0.7490196, 1, 1,
0.1375853, -1.060739, 2.596501, 0, 0.7411765, 1, 1,
0.1376371, -0.459486, 2.313545, 0, 0.7372549, 1, 1,
0.1417692, 0.05076436, 0.5388728, 0, 0.7294118, 1, 1,
0.1479312, -0.1856793, 2.531136, 0, 0.7254902, 1, 1,
0.1487583, -0.8435432, 3.785262, 0, 0.7176471, 1, 1,
0.1507601, -0.1109428, 2.404619, 0, 0.7137255, 1, 1,
0.1509525, -0.516905, 3.203413, 0, 0.7058824, 1, 1,
0.154486, 0.1263659, 0.58437, 0, 0.6980392, 1, 1,
0.1559789, 0.8741035, -0.2784542, 0, 0.6941177, 1, 1,
0.156777, -1.640054, 3.018073, 0, 0.6862745, 1, 1,
0.1579936, -2.044717, 3.400069, 0, 0.682353, 1, 1,
0.1603207, 0.5506321, -0.7131785, 0, 0.6745098, 1, 1,
0.1621344, 0.3549979, -0.009583527, 0, 0.6705883, 1, 1,
0.1655688, 0.2183347, 1.602418, 0, 0.6627451, 1, 1,
0.1688356, -0.9754902, 3.227079, 0, 0.6588235, 1, 1,
0.1711708, -1.08044, 2.933559, 0, 0.6509804, 1, 1,
0.1729314, -1.276523, 1.615004, 0, 0.6470588, 1, 1,
0.173982, -0.9630144, 4.752677, 0, 0.6392157, 1, 1,
0.1746521, -0.5235023, 0.5042465, 0, 0.6352941, 1, 1,
0.1766528, 0.007378523, 2.599521, 0, 0.627451, 1, 1,
0.1771866, -0.2026557, 1.821798, 0, 0.6235294, 1, 1,
0.1822983, -0.07534268, -0.2503736, 0, 0.6156863, 1, 1,
0.184921, -0.05666516, 2.252106, 0, 0.6117647, 1, 1,
0.1865469, -0.5516055, 5.548167, 0, 0.6039216, 1, 1,
0.1910858, -0.1710525, 1.480877, 0, 0.5960785, 1, 1,
0.1934222, 0.9983969, -1.621813, 0, 0.5921569, 1, 1,
0.1949985, -0.6316946, 2.633031, 0, 0.5843138, 1, 1,
0.2006749, 1.604906, 1.158159, 0, 0.5803922, 1, 1,
0.2048545, -0.1421397, 2.820686, 0, 0.572549, 1, 1,
0.2052536, 1.107282, 1.289485, 0, 0.5686275, 1, 1,
0.2115219, 0.9032542, -0.8459938, 0, 0.5607843, 1, 1,
0.2128548, 0.8938779, -0.3403958, 0, 0.5568628, 1, 1,
0.2134487, -1.994945, 2.471868, 0, 0.5490196, 1, 1,
0.214077, 0.2947325, 0.7049194, 0, 0.5450981, 1, 1,
0.2185131, -1.027017, 3.725291, 0, 0.5372549, 1, 1,
0.2203158, -1.068508, 3.162673, 0, 0.5333334, 1, 1,
0.2210624, -1.085086, 3.663717, 0, 0.5254902, 1, 1,
0.229695, -1.616475, 1.100658, 0, 0.5215687, 1, 1,
0.2309961, -0.5056776, 1.014485, 0, 0.5137255, 1, 1,
0.2318519, -0.7045854, 1.233183, 0, 0.509804, 1, 1,
0.2344746, -0.2764243, 2.526948, 0, 0.5019608, 1, 1,
0.2399622, 0.9631489, 0.4656458, 0, 0.4941176, 1, 1,
0.2436349, 0.1500459, 1.517665, 0, 0.4901961, 1, 1,
0.2446513, 0.6675154, 2.036704, 0, 0.4823529, 1, 1,
0.2465349, 0.3981811, 0.3831214, 0, 0.4784314, 1, 1,
0.2486423, 0.8918914, -0.5691917, 0, 0.4705882, 1, 1,
0.2503995, 0.1910136, 0.6069891, 0, 0.4666667, 1, 1,
0.2584597, -2.006728, 3.500741, 0, 0.4588235, 1, 1,
0.2598217, 1.202166, 0.174956, 0, 0.454902, 1, 1,
0.2599334, -0.8217222, 2.813512, 0, 0.4470588, 1, 1,
0.2625334, -1.02647, 4.322505, 0, 0.4431373, 1, 1,
0.2658527, 1.337063, 2.42866, 0, 0.4352941, 1, 1,
0.267409, 2.479191, -0.8908749, 0, 0.4313726, 1, 1,
0.2718648, 0.03737872, 2.120437, 0, 0.4235294, 1, 1,
0.2726091, -0.7278938, 2.843205, 0, 0.4196078, 1, 1,
0.2741987, 0.05597828, 1.272497, 0, 0.4117647, 1, 1,
0.2770828, 1.569081, 2.912067, 0, 0.4078431, 1, 1,
0.2785963, 0.2870752, 2.458378, 0, 0.4, 1, 1,
0.2795807, -0.06890033, 2.24338, 0, 0.3921569, 1, 1,
0.28067, 0.5638308, 0.3590038, 0, 0.3882353, 1, 1,
0.2819051, -0.4742293, 2.678669, 0, 0.3803922, 1, 1,
0.2831293, -0.6010217, 1.46861, 0, 0.3764706, 1, 1,
0.2846421, 1.166218, 1.546221, 0, 0.3686275, 1, 1,
0.2866567, -1.097168, 3.531377, 0, 0.3647059, 1, 1,
0.2875826, -0.08059198, 0.2670035, 0, 0.3568628, 1, 1,
0.2893909, 0.8300231, -0.2229912, 0, 0.3529412, 1, 1,
0.29011, -0.1499045, 3.103863, 0, 0.345098, 1, 1,
0.2964196, -1.855511, 3.30787, 0, 0.3411765, 1, 1,
0.2987023, 0.8706897, -0.005188067, 0, 0.3333333, 1, 1,
0.3004255, 1.282905, -0.3462777, 0, 0.3294118, 1, 1,
0.3009332, -0.7185156, 3.763772, 0, 0.3215686, 1, 1,
0.3027135, 0.8979573, -1.784955, 0, 0.3176471, 1, 1,
0.3063472, -2.14207, 2.415419, 0, 0.3098039, 1, 1,
0.3077258, 0.01608073, 0.8713201, 0, 0.3058824, 1, 1,
0.3099334, -0.6225107, 1.238413, 0, 0.2980392, 1, 1,
0.3165829, -1.909592, 4.540313, 0, 0.2901961, 1, 1,
0.3202477, -0.1667209, 2.773657, 0, 0.2862745, 1, 1,
0.3221027, -1.03847, 0.8105776, 0, 0.2784314, 1, 1,
0.322198, 1.60874, -1.038455, 0, 0.2745098, 1, 1,
0.324649, -0.9431586, 3.290256, 0, 0.2666667, 1, 1,
0.3309599, -0.2919817, 2.578177, 0, 0.2627451, 1, 1,
0.332211, 0.08639863, 1.220274, 0, 0.254902, 1, 1,
0.3416609, 0.02712353, 0.3041896, 0, 0.2509804, 1, 1,
0.3440876, 0.5772349, 0.2219523, 0, 0.2431373, 1, 1,
0.3462572, -0.9502044, 3.359111, 0, 0.2392157, 1, 1,
0.346321, 2.253378, -0.505296, 0, 0.2313726, 1, 1,
0.3543129, -0.837951, 4.90696, 0, 0.227451, 1, 1,
0.3560111, -0.3656716, 2.841987, 0, 0.2196078, 1, 1,
0.3565251, 0.0827093, 1.277166, 0, 0.2156863, 1, 1,
0.3568379, -0.6882993, 2.698539, 0, 0.2078431, 1, 1,
0.3579092, -0.3524423, 1.595782, 0, 0.2039216, 1, 1,
0.3586223, 0.9506465, -0.6302168, 0, 0.1960784, 1, 1,
0.3590256, -0.7344319, 3.309555, 0, 0.1882353, 1, 1,
0.3612225, -0.4567058, 3.179023, 0, 0.1843137, 1, 1,
0.3679068, 1.264702, 1.81712, 0, 0.1764706, 1, 1,
0.3732099, 0.6783973, 0.7897375, 0, 0.172549, 1, 1,
0.3747212, 0.3056716, 1.658971, 0, 0.1647059, 1, 1,
0.3769765, -0.2437476, 0.6464939, 0, 0.1607843, 1, 1,
0.3774799, -0.1180617, 3.375736, 0, 0.1529412, 1, 1,
0.3798783, 0.2810245, -0.716749, 0, 0.1490196, 1, 1,
0.3840872, -1.484906, 3.353363, 0, 0.1411765, 1, 1,
0.3868639, -1.409034, 4.959881, 0, 0.1372549, 1, 1,
0.3880905, -1.266322, 3.133401, 0, 0.1294118, 1, 1,
0.3906601, 1.877684, -0.4253393, 0, 0.1254902, 1, 1,
0.3976098, 1.107474, 1.686894, 0, 0.1176471, 1, 1,
0.3981413, 0.51876, -1.008646, 0, 0.1137255, 1, 1,
0.4004593, 0.6386964, 0.1959961, 0, 0.1058824, 1, 1,
0.4024933, -0.08070827, 2.695842, 0, 0.09803922, 1, 1,
0.4033242, -0.08991811, 0.8806388, 0, 0.09411765, 1, 1,
0.404463, -0.03348315, 2.370783, 0, 0.08627451, 1, 1,
0.408899, -1.518053, 1.596839, 0, 0.08235294, 1, 1,
0.4146937, -1.035768, 3.873816, 0, 0.07450981, 1, 1,
0.418861, -0.02159218, 1.768026, 0, 0.07058824, 1, 1,
0.4199392, 0.5977905, 0.7302835, 0, 0.0627451, 1, 1,
0.426606, -1.902142, 3.18681, 0, 0.05882353, 1, 1,
0.4266089, -0.8548422, 2.710792, 0, 0.05098039, 1, 1,
0.4293862, 1.123565, -1.129426, 0, 0.04705882, 1, 1,
0.4316787, 1.057992, 0.2671449, 0, 0.03921569, 1, 1,
0.4331574, 1.265863, -0.1324959, 0, 0.03529412, 1, 1,
0.4343942, -0.05596766, 0.1533646, 0, 0.02745098, 1, 1,
0.4360292, 1.200134, -1.839332, 0, 0.02352941, 1, 1,
0.4416267, 2.174469, 2.03566, 0, 0.01568628, 1, 1,
0.4440778, -1.784022, 2.215395, 0, 0.01176471, 1, 1,
0.4449702, 0.7533292, 0.4232931, 0, 0.003921569, 1, 1,
0.4491385, -0.03344647, 1.014325, 0.003921569, 0, 1, 1,
0.4492474, -0.3481939, 1.580201, 0.007843138, 0, 1, 1,
0.4515648, 0.9603506, -0.1071326, 0.01568628, 0, 1, 1,
0.4518138, 0.4240584, 2.145369, 0.01960784, 0, 1, 1,
0.4524084, 1.80755, 1.064204, 0.02745098, 0, 1, 1,
0.4602357, -0.1168577, 1.511741, 0.03137255, 0, 1, 1,
0.4603746, 0.323258, 1.94747, 0.03921569, 0, 1, 1,
0.4632124, 0.07433543, 2.072166, 0.04313726, 0, 1, 1,
0.4639188, 1.306969, -0.8583732, 0.05098039, 0, 1, 1,
0.4658947, 1.822468, 0.1510227, 0.05490196, 0, 1, 1,
0.4662634, -0.4318996, 2.611292, 0.0627451, 0, 1, 1,
0.4783076, -0.8157424, 1.714617, 0.06666667, 0, 1, 1,
0.4826986, 1.160244, 1.395569, 0.07450981, 0, 1, 1,
0.4840171, -1.651157, 2.07937, 0.07843138, 0, 1, 1,
0.485873, -0.5034465, 2.566963, 0.08627451, 0, 1, 1,
0.4861668, 1.06449, 2.036792, 0.09019608, 0, 1, 1,
0.4863426, 1.428197, 0.1033153, 0.09803922, 0, 1, 1,
0.4876389, -0.5528845, 2.470929, 0.1058824, 0, 1, 1,
0.492175, 1.239669, 0.3960169, 0.1098039, 0, 1, 1,
0.4978104, -0.7128888, 2.572456, 0.1176471, 0, 1, 1,
0.498037, 0.292598, -1.071032, 0.1215686, 0, 1, 1,
0.5059407, 0.05955768, 3.020987, 0.1294118, 0, 1, 1,
0.5086576, -0.3373603, 1.613888, 0.1333333, 0, 1, 1,
0.5217508, 1.67506, 2.628391, 0.1411765, 0, 1, 1,
0.5316529, -0.1143017, 0.6864843, 0.145098, 0, 1, 1,
0.5338252, -0.4060113, 1.788279, 0.1529412, 0, 1, 1,
0.5375969, -1.265674, 1.889062, 0.1568628, 0, 1, 1,
0.5452602, 0.4010081, 0.4575645, 0.1647059, 0, 1, 1,
0.5461033, 1.936049, 0.3837222, 0.1686275, 0, 1, 1,
0.5491694, 1.852951, -0.3380719, 0.1764706, 0, 1, 1,
0.5503832, 1.30873, -0.4915549, 0.1803922, 0, 1, 1,
0.5517057, -1.054909, 2.914346, 0.1882353, 0, 1, 1,
0.5520467, -0.7739708, 1.863807, 0.1921569, 0, 1, 1,
0.5538672, -0.1567704, 1.604189, 0.2, 0, 1, 1,
0.5584765, -0.3779185, 1.229121, 0.2078431, 0, 1, 1,
0.5638316, 1.337348, -0.4235078, 0.2117647, 0, 1, 1,
0.5657995, 0.2600579, 0.2129232, 0.2196078, 0, 1, 1,
0.5676073, 1.764022, 0.3315747, 0.2235294, 0, 1, 1,
0.5676543, -0.9329716, 1.379917, 0.2313726, 0, 1, 1,
0.5694588, -1.817364, 4.294374, 0.2352941, 0, 1, 1,
0.5707387, -1.746513, 3.072126, 0.2431373, 0, 1, 1,
0.5764987, -0.2968652, 1.547436, 0.2470588, 0, 1, 1,
0.5771417, 0.2233281, 3.188335, 0.254902, 0, 1, 1,
0.5782048, 0.5517219, 0.6966321, 0.2588235, 0, 1, 1,
0.5785878, -0.03269554, 2.522995, 0.2666667, 0, 1, 1,
0.5839824, 0.03635959, 2.063423, 0.2705882, 0, 1, 1,
0.5889319, 0.8078617, 3.052383, 0.2784314, 0, 1, 1,
0.5909895, 0.1639234, 0.3984932, 0.282353, 0, 1, 1,
0.5915425, 1.532479, 0.7035675, 0.2901961, 0, 1, 1,
0.5929301, -0.2453867, 2.966038, 0.2941177, 0, 1, 1,
0.5942546, 1.293596, 2.16888, 0.3019608, 0, 1, 1,
0.5948488, -0.6331255, 2.291641, 0.3098039, 0, 1, 1,
0.6013775, 0.3310947, -0.08298224, 0.3137255, 0, 1, 1,
0.6035421, -1.126186, 2.375659, 0.3215686, 0, 1, 1,
0.6079872, -1.47019, 4.111609, 0.3254902, 0, 1, 1,
0.6120806, 1.536966, 1.604473, 0.3333333, 0, 1, 1,
0.614375, -0.1216966, 1.38592, 0.3372549, 0, 1, 1,
0.6150035, 1.520897, 0.08322197, 0.345098, 0, 1, 1,
0.6162126, -0.00379587, 2.434972, 0.3490196, 0, 1, 1,
0.6212813, -1.090219, 1.486729, 0.3568628, 0, 1, 1,
0.6231268, -0.6430911, 2.675948, 0.3607843, 0, 1, 1,
0.6231863, -0.6479411, 1.759216, 0.3686275, 0, 1, 1,
0.6238568, 0.1633143, 0.7218804, 0.372549, 0, 1, 1,
0.627911, 0.2590088, 1.948048, 0.3803922, 0, 1, 1,
0.6283163, -0.4290915, 3.289696, 0.3843137, 0, 1, 1,
0.628494, -0.1917887, 0.6127127, 0.3921569, 0, 1, 1,
0.6314471, 0.08946595, 2.068396, 0.3960784, 0, 1, 1,
0.6322625, -0.9507047, 3.165066, 0.4039216, 0, 1, 1,
0.63777, 1.50098, 1.450468, 0.4117647, 0, 1, 1,
0.6405617, -0.7631742, 1.249689, 0.4156863, 0, 1, 1,
0.6413639, 0.3881159, 1.460045, 0.4235294, 0, 1, 1,
0.6427996, -0.6368667, 2.131397, 0.427451, 0, 1, 1,
0.6438457, 0.1269855, 1.075224, 0.4352941, 0, 1, 1,
0.6457621, -0.07377626, 1.020823, 0.4392157, 0, 1, 1,
0.6520533, -0.8819702, 2.123755, 0.4470588, 0, 1, 1,
0.6536174, -0.9017008, 3.265792, 0.4509804, 0, 1, 1,
0.6588442, -0.02861131, 0.8964615, 0.4588235, 0, 1, 1,
0.6645148, -0.3546233, 3.025108, 0.4627451, 0, 1, 1,
0.6709141, 0.855009, 0.3778764, 0.4705882, 0, 1, 1,
0.6756817, 0.3593243, 3.559553, 0.4745098, 0, 1, 1,
0.6763999, -0.1768002, 0.6813166, 0.4823529, 0, 1, 1,
0.6783158, 0.4085385, 3.197119, 0.4862745, 0, 1, 1,
0.6819642, -0.1396276, 1.006741, 0.4941176, 0, 1, 1,
0.6831186, 0.9867086, 0.3697384, 0.5019608, 0, 1, 1,
0.6854376, 0.04184593, 0.6555669, 0.5058824, 0, 1, 1,
0.6878088, -0.1633965, 1.429529, 0.5137255, 0, 1, 1,
0.6906018, -1.704647, 1.955897, 0.5176471, 0, 1, 1,
0.6930655, -1.715307, 3.40057, 0.5254902, 0, 1, 1,
0.6931989, -0.6539223, 2.464337, 0.5294118, 0, 1, 1,
0.694226, 1.187394, 1.36681, 0.5372549, 0, 1, 1,
0.6990067, -1.217288, 2.525609, 0.5411765, 0, 1, 1,
0.6990916, -0.3378308, 3.804325, 0.5490196, 0, 1, 1,
0.7032043, -0.9094214, 1.748995, 0.5529412, 0, 1, 1,
0.7040682, 0.2923147, 1.5656, 0.5607843, 0, 1, 1,
0.7079663, 1.142123, 1.81892, 0.5647059, 0, 1, 1,
0.7109087, 0.1347058, 1.394357, 0.572549, 0, 1, 1,
0.717702, 0.8247892, 2.547933, 0.5764706, 0, 1, 1,
0.7183991, -0.2193964, 1.114463, 0.5843138, 0, 1, 1,
0.7189071, 1.039101, -0.001686197, 0.5882353, 0, 1, 1,
0.723203, 1.227434, 1.094309, 0.5960785, 0, 1, 1,
0.7291607, -0.5466409, 1.830105, 0.6039216, 0, 1, 1,
0.7318234, -0.1481725, 4.103068, 0.6078432, 0, 1, 1,
0.7404628, 0.6793119, 2.047932, 0.6156863, 0, 1, 1,
0.7436307, 0.1947908, 0.4823777, 0.6196079, 0, 1, 1,
0.7448331, 0.4129258, 1.204734, 0.627451, 0, 1, 1,
0.7487302, -0.6455705, 0.07566311, 0.6313726, 0, 1, 1,
0.7515828, 1.013683, 0.9483952, 0.6392157, 0, 1, 1,
0.7528571, -2.143724, 1.325436, 0.6431373, 0, 1, 1,
0.7534549, -1.011539, 1.987351, 0.6509804, 0, 1, 1,
0.7536365, -0.1813379, 3.874053, 0.654902, 0, 1, 1,
0.758712, -1.218969, 3.070341, 0.6627451, 0, 1, 1,
0.7662115, -1.316465, 1.689726, 0.6666667, 0, 1, 1,
0.7671703, -0.4386377, 2.979234, 0.6745098, 0, 1, 1,
0.7735835, 0.5297795, 1.60161, 0.6784314, 0, 1, 1,
0.7761588, -2.266847, 1.940516, 0.6862745, 0, 1, 1,
0.7764884, 0.2096876, 1.518909, 0.6901961, 0, 1, 1,
0.7817767, 1.640857, -0.193401, 0.6980392, 0, 1, 1,
0.7861065, -0.1184909, 1.978908, 0.7058824, 0, 1, 1,
0.7966657, 1.310336, 1.036532, 0.7098039, 0, 1, 1,
0.8023763, -1.009549, 0.8634975, 0.7176471, 0, 1, 1,
0.8027443, 0.6649178, -2.030723, 0.7215686, 0, 1, 1,
0.8125242, 0.6997039, 0.3161751, 0.7294118, 0, 1, 1,
0.8234749, -1.534675, 2.165945, 0.7333333, 0, 1, 1,
0.8273519, 1.861192, 0.1037072, 0.7411765, 0, 1, 1,
0.8282213, 0.1603305, 0.9062935, 0.7450981, 0, 1, 1,
0.8299555, 0.6505992, 0.9850051, 0.7529412, 0, 1, 1,
0.831131, -1.281697, 2.564161, 0.7568628, 0, 1, 1,
0.8312074, -1.365676, 2.64876, 0.7647059, 0, 1, 1,
0.8319368, -0.327565, 1.131125, 0.7686275, 0, 1, 1,
0.85005, -1.211233, 3.60052, 0.7764706, 0, 1, 1,
0.8513634, 0.2265649, 0.7803553, 0.7803922, 0, 1, 1,
0.8552395, -0.5597809, 3.525067, 0.7882353, 0, 1, 1,
0.8589421, 0.7743797, 0.01679588, 0.7921569, 0, 1, 1,
0.8667544, -0.02605834, 1.152215, 0.8, 0, 1, 1,
0.8675773, -0.6543807, 1.839774, 0.8078431, 0, 1, 1,
0.8677199, -0.4874968, 2.283396, 0.8117647, 0, 1, 1,
0.8679947, 0.6615304, 1.006353, 0.8196079, 0, 1, 1,
0.871643, 1.488707, -1.031216, 0.8235294, 0, 1, 1,
0.8736605, -1.327881, 3.171534, 0.8313726, 0, 1, 1,
0.8771954, 1.460656, -0.5022305, 0.8352941, 0, 1, 1,
0.8831135, 0.6956723, -1.209869, 0.8431373, 0, 1, 1,
0.889323, 1.446513, 1.134953, 0.8470588, 0, 1, 1,
0.8895888, 1.199059, 0.06021382, 0.854902, 0, 1, 1,
0.8926954, -1.446331, 2.495522, 0.8588235, 0, 1, 1,
0.8945586, -0.09233777, 0.2417711, 0.8666667, 0, 1, 1,
0.8952872, 0.8113695, -0.430131, 0.8705882, 0, 1, 1,
0.9005547, 0.6499967, 1.45879, 0.8784314, 0, 1, 1,
0.9062845, -1.663393, 1.635504, 0.8823529, 0, 1, 1,
0.9139407, -0.8797362, 2.488878, 0.8901961, 0, 1, 1,
0.914701, -1.05398, 2.034996, 0.8941177, 0, 1, 1,
0.918664, -0.6994373, 1.744467, 0.9019608, 0, 1, 1,
0.9201455, -0.1939681, 2.518875, 0.9098039, 0, 1, 1,
0.928866, -0.647656, 2.332241, 0.9137255, 0, 1, 1,
0.9397513, 0.4288015, 1.821914, 0.9215686, 0, 1, 1,
0.9459987, 1.450269, 0.3728726, 0.9254902, 0, 1, 1,
0.9507658, 0.8779566, 1.244519, 0.9333333, 0, 1, 1,
0.9585396, 1.210471, -0.4329878, 0.9372549, 0, 1, 1,
0.9633998, 0.5540815, 0.7717373, 0.945098, 0, 1, 1,
0.9650496, 0.5391859, -0.3355898, 0.9490196, 0, 1, 1,
0.9705454, 1.042103, -0.2454412, 0.9568627, 0, 1, 1,
0.9748669, 1.149662, 2.176855, 0.9607843, 0, 1, 1,
0.9773424, -0.997979, 1.902078, 0.9686275, 0, 1, 1,
0.9805525, 1.096444, 2.10771, 0.972549, 0, 1, 1,
0.9964728, 0.3043641, -0.7100689, 0.9803922, 0, 1, 1,
1.000124, 1.514131, 0.2450055, 0.9843137, 0, 1, 1,
1.002129, 0.6606535, 2.272554, 0.9921569, 0, 1, 1,
1.008332, -0.4114231, 1.233694, 0.9960784, 0, 1, 1,
1.008378, 0.1992498, 2.525436, 1, 0, 0.9960784, 1,
1.024501, 0.106538, 2.440795, 1, 0, 0.9882353, 1,
1.02698, 0.7740345, -0.6727804, 1, 0, 0.9843137, 1,
1.038377, -0.4370668, 1.922674, 1, 0, 0.9764706, 1,
1.05649, -0.9939223, 3.659448, 1, 0, 0.972549, 1,
1.057971, -1.268179, 2.328515, 1, 0, 0.9647059, 1,
1.061634, 0.3749868, 2.109224, 1, 0, 0.9607843, 1,
1.063752, -0.1546549, 2.700044, 1, 0, 0.9529412, 1,
1.068395, 1.23941, -1.272832, 1, 0, 0.9490196, 1,
1.072114, 0.639101, 1.372464, 1, 0, 0.9411765, 1,
1.074114, 0.2868885, 0.620898, 1, 0, 0.9372549, 1,
1.074326, 0.8612764, 1.381971, 1, 0, 0.9294118, 1,
1.075356, 0.47697, 0.5789027, 1, 0, 0.9254902, 1,
1.078356, 0.4374087, 2.177644, 1, 0, 0.9176471, 1,
1.084606, -0.3199636, 0.4010947, 1, 0, 0.9137255, 1,
1.095813, 0.2133721, 2.011353, 1, 0, 0.9058824, 1,
1.096074, 0.1324994, 1.944391, 1, 0, 0.9019608, 1,
1.097205, 0.1864087, 2.299006, 1, 0, 0.8941177, 1,
1.108115, -0.1806732, 1.338075, 1, 0, 0.8862745, 1,
1.116394, 0.5249926, 0.1544304, 1, 0, 0.8823529, 1,
1.116686, 1.308709, 0.6120819, 1, 0, 0.8745098, 1,
1.121794, -1.039527, 3.735974, 1, 0, 0.8705882, 1,
1.123055, 2.485643, -0.1646424, 1, 0, 0.8627451, 1,
1.123456, -0.004785951, 0.886521, 1, 0, 0.8588235, 1,
1.123871, 0.4668754, 1.362956, 1, 0, 0.8509804, 1,
1.128134, -1.259087, 2.943518, 1, 0, 0.8470588, 1,
1.132703, 0.4221519, 1.344018, 1, 0, 0.8392157, 1,
1.133945, -1.099564, 1.814409, 1, 0, 0.8352941, 1,
1.143121, -1.16278, 3.292361, 1, 0, 0.827451, 1,
1.144363, 1.680527, 1.072974, 1, 0, 0.8235294, 1,
1.145212, 0.2999204, -1.127481, 1, 0, 0.8156863, 1,
1.152048, -0.2889886, 2.193169, 1, 0, 0.8117647, 1,
1.154593, -0.8821737, 3.424226, 1, 0, 0.8039216, 1,
1.155898, 0.2839169, 2.307591, 1, 0, 0.7960784, 1,
1.159542, 1.347717, 2.183644, 1, 0, 0.7921569, 1,
1.161105, 0.08705982, 0.2396677, 1, 0, 0.7843137, 1,
1.166596, 0.3289461, 3.099413, 1, 0, 0.7803922, 1,
1.184158, -0.7602735, 2.226972, 1, 0, 0.772549, 1,
1.189581, 0.6661206, 2.02678, 1, 0, 0.7686275, 1,
1.195033, -0.3083418, 1.444738, 1, 0, 0.7607843, 1,
1.195635, -0.9817026, 0.986411, 1, 0, 0.7568628, 1,
1.199772, 0.2249128, 2.166723, 1, 0, 0.7490196, 1,
1.201288, 0.03753478, 0.5357089, 1, 0, 0.7450981, 1,
1.202107, -3.459624, 2.98169, 1, 0, 0.7372549, 1,
1.202283, -0.1117611, 0.7089857, 1, 0, 0.7333333, 1,
1.202525, -1.731633, 2.223144, 1, 0, 0.7254902, 1,
1.205679, -0.7483815, 2.715891, 1, 0, 0.7215686, 1,
1.212615, 0.8261507, 2.150883, 1, 0, 0.7137255, 1,
1.214115, 0.8882279, 1.928323, 1, 0, 0.7098039, 1,
1.214745, 0.2629668, 2.205973, 1, 0, 0.7019608, 1,
1.220481, -0.9799715, 2.221925, 1, 0, 0.6941177, 1,
1.222206, 0.8546929, 1.612579, 1, 0, 0.6901961, 1,
1.23204, -2.348782, 3.442288, 1, 0, 0.682353, 1,
1.233249, -1.810095, 4.219961, 1, 0, 0.6784314, 1,
1.237141, -0.3051945, 1.751894, 1, 0, 0.6705883, 1,
1.237521, 1.895917, 0.4873738, 1, 0, 0.6666667, 1,
1.242368, -0.125434, 1.935226, 1, 0, 0.6588235, 1,
1.243104, -0.418985, 1.136713, 1, 0, 0.654902, 1,
1.246573, 0.3742691, 0.9743404, 1, 0, 0.6470588, 1,
1.248134, -0.04694722, -0.36821, 1, 0, 0.6431373, 1,
1.249998, 0.7360988, -0.1088335, 1, 0, 0.6352941, 1,
1.252157, -1.097278, 0.962512, 1, 0, 0.6313726, 1,
1.264956, -1.034569, 2.20619, 1, 0, 0.6235294, 1,
1.271339, -0.8652962, 2.078509, 1, 0, 0.6196079, 1,
1.278985, 0.4523582, 1.530316, 1, 0, 0.6117647, 1,
1.279347, 0.3433609, 1.355502, 1, 0, 0.6078432, 1,
1.29171, -0.4664746, 2.720914, 1, 0, 0.6, 1,
1.296631, 0.1113278, 2.896836, 1, 0, 0.5921569, 1,
1.297395, 0.5440707, -0.555603, 1, 0, 0.5882353, 1,
1.309516, -0.4846241, 2.197228, 1, 0, 0.5803922, 1,
1.320437, 1.442783, 2.711187, 1, 0, 0.5764706, 1,
1.327049, 0.1868551, 0.1926893, 1, 0, 0.5686275, 1,
1.334967, -0.5035179, 2.055894, 1, 0, 0.5647059, 1,
1.335444, -0.04558254, 1.045319, 1, 0, 0.5568628, 1,
1.339515, 0.1867721, 1.064184, 1, 0, 0.5529412, 1,
1.339518, 0.1010271, 4.672632, 1, 0, 0.5450981, 1,
1.34206, 0.4715639, -0.5732995, 1, 0, 0.5411765, 1,
1.347131, 0.08550136, 0.6807873, 1, 0, 0.5333334, 1,
1.351713, 0.2686685, 2.312124, 1, 0, 0.5294118, 1,
1.359236, 1.316048, 0.9969561, 1, 0, 0.5215687, 1,
1.368121, 2.226449, 0.8434216, 1, 0, 0.5176471, 1,
1.368543, 0.02253308, 3.314452, 1, 0, 0.509804, 1,
1.379258, -0.773437, 2.807012, 1, 0, 0.5058824, 1,
1.379773, 0.8515726, 0.6002659, 1, 0, 0.4980392, 1,
1.382398, -0.6868396, 0.06598163, 1, 0, 0.4901961, 1,
1.382599, -0.4286221, 2.903897, 1, 0, 0.4862745, 1,
1.386312, 0.5802983, 1.545786, 1, 0, 0.4784314, 1,
1.404801, -1.584129, 2.156028, 1, 0, 0.4745098, 1,
1.405239, 0.7471821, 0.4034064, 1, 0, 0.4666667, 1,
1.408938, -1.038662, 2.609493, 1, 0, 0.4627451, 1,
1.41058, 2.50462, 0.1626489, 1, 0, 0.454902, 1,
1.428282, 2.485904, 1.602136, 1, 0, 0.4509804, 1,
1.439944, 1.32492, 2.728996, 1, 0, 0.4431373, 1,
1.451888, 1.468078, 1.506381, 1, 0, 0.4392157, 1,
1.461574, -0.1126958, 2.395505, 1, 0, 0.4313726, 1,
1.466524, 1.0588, 1.033567, 1, 0, 0.427451, 1,
1.471219, 0.5799007, 1.836658, 1, 0, 0.4196078, 1,
1.477066, 0.9351573, 1.915066, 1, 0, 0.4156863, 1,
1.481406, 1.011366, -0.08974638, 1, 0, 0.4078431, 1,
1.488448, -1.184163, 1.253916, 1, 0, 0.4039216, 1,
1.498395, 0.4510686, 1.738484, 1, 0, 0.3960784, 1,
1.519136, -0.3351495, 1.852563, 1, 0, 0.3882353, 1,
1.528349, 0.8686221, 1.26958, 1, 0, 0.3843137, 1,
1.536281, -0.1677742, 1.886473, 1, 0, 0.3764706, 1,
1.540521, -1.236604, 2.415566, 1, 0, 0.372549, 1,
1.542316, -0.08386756, 0.7500242, 1, 0, 0.3647059, 1,
1.554687, 1.01554, 2.532236, 1, 0, 0.3607843, 1,
1.573697, -0.6936896, 1.058415, 1, 0, 0.3529412, 1,
1.576691, 1.670577, 2.276956, 1, 0, 0.3490196, 1,
1.59219, -1.077687, 1.023257, 1, 0, 0.3411765, 1,
1.607433, 0.7146671, 1.509281, 1, 0, 0.3372549, 1,
1.638533, -0.2004014, 2.774462, 1, 0, 0.3294118, 1,
1.652608, 0.4568524, 1.623792, 1, 0, 0.3254902, 1,
1.658208, 1.549307, 2.236744, 1, 0, 0.3176471, 1,
1.661131, 1.165803, 0.1220456, 1, 0, 0.3137255, 1,
1.665285, -1.91401, 1.275931, 1, 0, 0.3058824, 1,
1.666623, -1.308005, 2.10022, 1, 0, 0.2980392, 1,
1.66781, -2.062357, 1.387547, 1, 0, 0.2941177, 1,
1.676544, -1.017828, 1.766207, 1, 0, 0.2862745, 1,
1.691741, 1.37133, 0.9892465, 1, 0, 0.282353, 1,
1.705197, -1.014691, 3.384312, 1, 0, 0.2745098, 1,
1.711494, -2.843696, 1.602708, 1, 0, 0.2705882, 1,
1.726234, -0.6612172, -0.2600001, 1, 0, 0.2627451, 1,
1.726302, 1.389664, -0.4942923, 1, 0, 0.2588235, 1,
1.734599, -0.04933383, 1.126591, 1, 0, 0.2509804, 1,
1.735209, -1.02231, 3.092832, 1, 0, 0.2470588, 1,
1.739052, 0.3350546, 2.424798, 1, 0, 0.2392157, 1,
1.752252, 0.5259867, 1.017913, 1, 0, 0.2352941, 1,
1.752728, 0.5229806, 2.736722, 1, 0, 0.227451, 1,
1.768912, -1.010504, 1.834479, 1, 0, 0.2235294, 1,
1.772479, 0.08661734, 1.384937, 1, 0, 0.2156863, 1,
1.790874, 0.5176706, 2.502117, 1, 0, 0.2117647, 1,
1.816534, -0.9174551, 0.9575895, 1, 0, 0.2039216, 1,
1.81657, 1.683893, -0.767933, 1, 0, 0.1960784, 1,
1.823863, -1.087817, 2.493307, 1, 0, 0.1921569, 1,
1.830418, -1.226806, 1.017398, 1, 0, 0.1843137, 1,
1.831876, -0.7997295, 2.026388, 1, 0, 0.1803922, 1,
1.842723, 0.8107257, 1.072873, 1, 0, 0.172549, 1,
1.852576, -0.4232038, 1.570387, 1, 0, 0.1686275, 1,
1.882174, 1.096144, 0.9158264, 1, 0, 0.1607843, 1,
1.892224, -1.237255, 2.582914, 1, 0, 0.1568628, 1,
1.978431, 0.1029508, 1.919512, 1, 0, 0.1490196, 1,
1.980926, 1.004581, 1.533999, 1, 0, 0.145098, 1,
1.987625, 1.266641, -0.0905688, 1, 0, 0.1372549, 1,
1.998072, -1.390513, 2.603763, 1, 0, 0.1333333, 1,
2.012328, -1.365653, 2.531258, 1, 0, 0.1254902, 1,
2.021051, -0.1006128, 2.970499, 1, 0, 0.1215686, 1,
2.022846, -0.4043032, 4.894606, 1, 0, 0.1137255, 1,
2.041932, 0.5557543, 2.36767, 1, 0, 0.1098039, 1,
2.062642, -0.8166709, 1.591991, 1, 0, 0.1019608, 1,
2.071528, 0.9757621, 0.5459218, 1, 0, 0.09411765, 1,
2.103001, -0.2561403, 1.967349, 1, 0, 0.09019608, 1,
2.214586, -0.5322567, 1.793768, 1, 0, 0.08235294, 1,
2.275126, 0.9414831, 3.584862, 1, 0, 0.07843138, 1,
2.298267, -0.8515172, 1.531395, 1, 0, 0.07058824, 1,
2.340851, 0.5607361, 0.5459422, 1, 0, 0.06666667, 1,
2.348325, -1.11587, 3.336518, 1, 0, 0.05882353, 1,
2.358673, -0.07073691, 1.704263, 1, 0, 0.05490196, 1,
2.378861, 0.4814337, 1.344997, 1, 0, 0.04705882, 1,
2.462767, 0.5814568, 1.759616, 1, 0, 0.04313726, 1,
2.472156, -0.789748, 0.4932813, 1, 0, 0.03529412, 1,
2.616777, -0.03035949, -0.1342047, 1, 0, 0.03137255, 1,
2.628708, 0.5892575, 2.648318, 1, 0, 0.02352941, 1,
2.718813, 1.057929, 1.154973, 1, 0, 0.01960784, 1,
3.043336, 0.4063307, 1.717942, 1, 0, 0.01176471, 1,
3.312362, 0.04234888, 0.5176708, 1, 0, 0.007843138, 1
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
-0.05890167, -4.599919, -6.942111, 0, -0.5, 0.5, 0.5,
-0.05890167, -4.599919, -6.942111, 1, -0.5, 0.5, 0.5,
-0.05890167, -4.599919, -6.942111, 1, 1.5, 0.5, 0.5,
-0.05890167, -4.599919, -6.942111, 0, 1.5, 0.5, 0.5
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
-4.573024, -0.09592247, -6.942111, 0, -0.5, 0.5, 0.5,
-4.573024, -0.09592247, -6.942111, 1, -0.5, 0.5, 0.5,
-4.573024, -0.09592247, -6.942111, 1, 1.5, 0.5, 0.5,
-4.573024, -0.09592247, -6.942111, 0, 1.5, 0.5, 0.5
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
-4.573024, -4.599919, 0.2081592, 0, -0.5, 0.5, 0.5,
-4.573024, -4.599919, 0.2081592, 1, -0.5, 0.5, 0.5,
-4.573024, -4.599919, 0.2081592, 1, 1.5, 0.5, 0.5,
-4.573024, -4.599919, 0.2081592, 0, 1.5, 0.5, 0.5
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
-3, -3.560535, -5.292048,
3, -3.560535, -5.292048,
-3, -3.560535, -5.292048,
-3, -3.733766, -5.567059,
-2, -3.560535, -5.292048,
-2, -3.733766, -5.567059,
-1, -3.560535, -5.292048,
-1, -3.733766, -5.567059,
0, -3.560535, -5.292048,
0, -3.733766, -5.567059,
1, -3.560535, -5.292048,
1, -3.733766, -5.567059,
2, -3.560535, -5.292048,
2, -3.733766, -5.567059,
3, -3.560535, -5.292048,
3, -3.733766, -5.567059
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
-3, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
-3, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
-3, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
-3, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
-2, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
-2, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
-2, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
-2, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
-1, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
-1, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
-1, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
-1, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
0, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
0, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
0, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
0, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
1, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
1, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
1, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
1, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
2, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
2, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
2, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
2, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5,
3, -4.080227, -6.11708, 0, -0.5, 0.5, 0.5,
3, -4.080227, -6.11708, 1, -0.5, 0.5, 0.5,
3, -4.080227, -6.11708, 1, 1.5, 0.5, 0.5,
3, -4.080227, -6.11708, 0, 1.5, 0.5, 0.5
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
-3.531303, -3, -5.292048,
-3.531303, 3, -5.292048,
-3.531303, -3, -5.292048,
-3.704924, -3, -5.567059,
-3.531303, -2, -5.292048,
-3.704924, -2, -5.567059,
-3.531303, -1, -5.292048,
-3.704924, -1, -5.567059,
-3.531303, 0, -5.292048,
-3.704924, 0, -5.567059,
-3.531303, 1, -5.292048,
-3.704924, 1, -5.567059,
-3.531303, 2, -5.292048,
-3.704924, 2, -5.567059,
-3.531303, 3, -5.292048,
-3.704924, 3, -5.567059
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
-4.052164, -3, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, -3, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, -3, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, -3, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, -2, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, -2, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, -2, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, -2, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, -1, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, -1, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, -1, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, -1, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, 0, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, 0, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, 0, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, 0, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, 1, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, 1, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, 1, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, 1, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, 2, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, 2, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, 2, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, 2, -6.11708, 0, 1.5, 0.5, 0.5,
-4.052164, 3, -6.11708, 0, -0.5, 0.5, 0.5,
-4.052164, 3, -6.11708, 1, -0.5, 0.5, 0.5,
-4.052164, 3, -6.11708, 1, 1.5, 0.5, 0.5,
-4.052164, 3, -6.11708, 0, 1.5, 0.5, 0.5
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
-3.531303, -3.560535, -4,
-3.531303, -3.560535, 4,
-3.531303, -3.560535, -4,
-3.704924, -3.733766, -4,
-3.531303, -3.560535, -2,
-3.704924, -3.733766, -2,
-3.531303, -3.560535, 0,
-3.704924, -3.733766, 0,
-3.531303, -3.560535, 2,
-3.704924, -3.733766, 2,
-3.531303, -3.560535, 4,
-3.704924, -3.733766, 4
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
-4.052164, -4.080227, -4, 0, -0.5, 0.5, 0.5,
-4.052164, -4.080227, -4, 1, -0.5, 0.5, 0.5,
-4.052164, -4.080227, -4, 1, 1.5, 0.5, 0.5,
-4.052164, -4.080227, -4, 0, 1.5, 0.5, 0.5,
-4.052164, -4.080227, -2, 0, -0.5, 0.5, 0.5,
-4.052164, -4.080227, -2, 1, -0.5, 0.5, 0.5,
-4.052164, -4.080227, -2, 1, 1.5, 0.5, 0.5,
-4.052164, -4.080227, -2, 0, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 0, 0, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 0, 1, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 0, 1, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 0, 0, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 2, 0, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 2, 1, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 2, 1, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 2, 0, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 4, 0, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 4, 1, -0.5, 0.5, 0.5,
-4.052164, -4.080227, 4, 1, 1.5, 0.5, 0.5,
-4.052164, -4.080227, 4, 0, 1.5, 0.5, 0.5
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
-3.531303, -3.560535, -5.292048,
-3.531303, 3.36869, -5.292048,
-3.531303, -3.560535, 5.708367,
-3.531303, 3.36869, 5.708367,
-3.531303, -3.560535, -5.292048,
-3.531303, -3.560535, 5.708367,
-3.531303, 3.36869, -5.292048,
-3.531303, 3.36869, 5.708367,
-3.531303, -3.560535, -5.292048,
3.4135, -3.560535, -5.292048,
-3.531303, -3.560535, 5.708367,
3.4135, -3.560535, 5.708367,
-3.531303, 3.36869, -5.292048,
3.4135, 3.36869, -5.292048,
-3.531303, 3.36869, 5.708367,
3.4135, 3.36869, 5.708367,
3.4135, -3.560535, -5.292048,
3.4135, 3.36869, -5.292048,
3.4135, -3.560535, 5.708367,
3.4135, 3.36869, 5.708367,
3.4135, -3.560535, -5.292048,
3.4135, -3.560535, 5.708367,
3.4135, 3.36869, -5.292048,
3.4135, 3.36869, 5.708367
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
var radius = 7.87062;
var distance = 35.01728;
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
mvMatrix.translate( 0.05890167, 0.09592247, -0.2081592 );
mvMatrix.scale( 1.225358, 1.228113, 0.7735952 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.01728);
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
depen<-read.table("depen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-depen$V2
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
y<-depen$V3
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
z<-depen$V4
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
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
-3.430166, 1.42658, -2.132193, 0, 0, 1, 1, 1,
-2.714478, 1.977973, -0.5626959, 1, 0, 0, 1, 1,
-2.669868, -0.4717989, -1.873585, 1, 0, 0, 1, 1,
-2.604283, -0.4414132, -0.836126, 1, 0, 0, 1, 1,
-2.524693, 0.1681676, -0.009256847, 1, 0, 0, 1, 1,
-2.497417, 0.7494247, -0.538065, 1, 0, 0, 1, 1,
-2.458091, 1.632427, -1.391184, 0, 0, 0, 1, 1,
-2.436071, 1.223597, -1.79317, 0, 0, 0, 1, 1,
-2.407918, 0.2874188, -0.01896236, 0, 0, 0, 1, 1,
-2.40385, 1.740997, -2.741855, 0, 0, 0, 1, 1,
-2.398999, 0.4610257, -1.081787, 0, 0, 0, 1, 1,
-2.297471, 0.349571, 1.168268, 0, 0, 0, 1, 1,
-2.295696, 0.7257305, 0.820056, 0, 0, 0, 1, 1,
-2.280624, 0.05120992, -1.147554, 1, 1, 1, 1, 1,
-2.260097, 0.2301156, -0.1310908, 1, 1, 1, 1, 1,
-2.250502, -1.715829, -4.539833, 1, 1, 1, 1, 1,
-2.248352, -0.4854252, -1.886681, 1, 1, 1, 1, 1,
-2.247442, -1.873849, -2.512184, 1, 1, 1, 1, 1,
-2.230473, 0.2288923, -1.278309, 1, 1, 1, 1, 1,
-2.191564, -0.2435103, -1.637685, 1, 1, 1, 1, 1,
-2.134627, 0.03610582, -1.705076, 1, 1, 1, 1, 1,
-2.126609, -0.4332379, -1.830065, 1, 1, 1, 1, 1,
-2.122646, -0.5420055, -0.6139833, 1, 1, 1, 1, 1,
-2.103651, -1.493005, -3.093172, 1, 1, 1, 1, 1,
-2.037234, -0.400758, -2.122616, 1, 1, 1, 1, 1,
-2.000057, 2.031847, 0.1502483, 1, 1, 1, 1, 1,
-1.957532, 1.881191, -0.1558545, 1, 1, 1, 1, 1,
-1.942661, -0.08233101, -2.439348, 1, 1, 1, 1, 1,
-1.938218, 0.4467092, -2.799728, 0, 0, 1, 1, 1,
-1.931689, 0.6226948, -1.64106, 1, 0, 0, 1, 1,
-1.928173, 1.587247, -0.9147999, 1, 0, 0, 1, 1,
-1.906359, 0.6134219, -1.49039, 1, 0, 0, 1, 1,
-1.883503, 0.7846183, -1.633625, 1, 0, 0, 1, 1,
-1.860493, -0.3802982, -1.390365, 1, 0, 0, 1, 1,
-1.860391, 0.2071846, -2.66257, 0, 0, 0, 1, 1,
-1.860212, -0.7354735, -1.228432, 0, 0, 0, 1, 1,
-1.854643, -0.4348406, -0.9300916, 0, 0, 0, 1, 1,
-1.841585, -1.077415, -1.314587, 0, 0, 0, 1, 1,
-1.826791, -0.3391108, -2.422322, 0, 0, 0, 1, 1,
-1.822077, -1.520963, -2.267751, 0, 0, 0, 1, 1,
-1.820343, -0.2895621, -1.827738, 0, 0, 0, 1, 1,
-1.815099, 0.08946241, -0.4093756, 1, 1, 1, 1, 1,
-1.741633, -1.170036, -3.775448, 1, 1, 1, 1, 1,
-1.723927, 0.001176347, -2.954779, 1, 1, 1, 1, 1,
-1.697233, -0.4667165, -1.634351, 1, 1, 1, 1, 1,
-1.686416, 1.92176, 0.2187062, 1, 1, 1, 1, 1,
-1.679182, 1.525911, -0.5188498, 1, 1, 1, 1, 1,
-1.677103, 0.05234338, -1.980337, 1, 1, 1, 1, 1,
-1.674331, -1.472311, -3.699569, 1, 1, 1, 1, 1,
-1.669667, -1.548617, -2.463808, 1, 1, 1, 1, 1,
-1.654928, -0.1549502, -0.7789791, 1, 1, 1, 1, 1,
-1.651827, -0.4085494, -1.654934, 1, 1, 1, 1, 1,
-1.650064, -2.271379, -4.085774, 1, 1, 1, 1, 1,
-1.642974, 1.329695, -3.131279, 1, 1, 1, 1, 1,
-1.639003, -0.4738045, -1.413285, 1, 1, 1, 1, 1,
-1.636609, -0.4343662, -2.261632, 1, 1, 1, 1, 1,
-1.615644, -1.830372, -2.017697, 0, 0, 1, 1, 1,
-1.612012, 1.200358, -2.755577, 1, 0, 0, 1, 1,
-1.59568, -0.4437554, -2.009017, 1, 0, 0, 1, 1,
-1.593022, 1.002358, -2.610665, 1, 0, 0, 1, 1,
-1.573578, 1.630676, -0.5582044, 1, 0, 0, 1, 1,
-1.562874, -2.021677, -2.855586, 1, 0, 0, 1, 1,
-1.562178, 0.249827, -0.8248781, 0, 0, 0, 1, 1,
-1.558966, -0.8069456, -3.050093, 0, 0, 0, 1, 1,
-1.553046, -0.1321272, -1.603777, 0, 0, 0, 1, 1,
-1.539385, -0.4705162, -1.608078, 0, 0, 0, 1, 1,
-1.537862, -0.4859678, -0.4190235, 0, 0, 0, 1, 1,
-1.536051, -1.626158, -5.131848, 0, 0, 0, 1, 1,
-1.52669, 2.30638, -1.79748, 0, 0, 0, 1, 1,
-1.520959, 2.906301, -0.4786282, 1, 1, 1, 1, 1,
-1.517882, 0.3406005, -1.912516, 1, 1, 1, 1, 1,
-1.514236, -0.03813344, -1.713941, 1, 1, 1, 1, 1,
-1.497949, 0.3294204, -3.719371, 1, 1, 1, 1, 1,
-1.486407, -0.522804, -2.570181, 1, 1, 1, 1, 1,
-1.482667, 0.9986196, -1.226544, 1, 1, 1, 1, 1,
-1.476807, -0.06292174, -1.513781, 1, 1, 1, 1, 1,
-1.476396, 1.483459, 0.336446, 1, 1, 1, 1, 1,
-1.472983, -0.2461005, -2.882807, 1, 1, 1, 1, 1,
-1.471854, 0.9795488, -1.441568, 1, 1, 1, 1, 1,
-1.424183, -0.242816, -1.769994, 1, 1, 1, 1, 1,
-1.415715, -1.305419, -1.789026, 1, 1, 1, 1, 1,
-1.403968, -0.4013092, -1.007844, 1, 1, 1, 1, 1,
-1.399405, 2.061191, -0.3532487, 1, 1, 1, 1, 1,
-1.39905, -1.380552, -2.993704, 1, 1, 1, 1, 1,
-1.393119, -2.198872, -4.072768, 0, 0, 1, 1, 1,
-1.392857, 1.106681, -1.436107, 1, 0, 0, 1, 1,
-1.376838, -0.9835955, -1.83237, 1, 0, 0, 1, 1,
-1.373276, -1.387958, -2.006908, 1, 0, 0, 1, 1,
-1.372067, 0.5697565, -1.876148, 1, 0, 0, 1, 1,
-1.365366, 1.219539, -0.7449637, 1, 0, 0, 1, 1,
-1.352416, -0.7876481, -1.548663, 0, 0, 0, 1, 1,
-1.350148, -0.3015989, -1.848135, 0, 0, 0, 1, 1,
-1.342375, -0.1453997, -0.9367848, 0, 0, 0, 1, 1,
-1.339384, 0.1753113, -1.08653, 0, 0, 0, 1, 1,
-1.338783, -0.9258503, -2.263297, 0, 0, 0, 1, 1,
-1.334446, 0.7116008, 0.259586, 0, 0, 0, 1, 1,
-1.330866, -1.276052, -3.546647, 0, 0, 0, 1, 1,
-1.327416, -0.2833733, -3.759637, 1, 1, 1, 1, 1,
-1.304531, 0.6447147, -1.877758, 1, 1, 1, 1, 1,
-1.301376, -0.4205137, -2.691872, 1, 1, 1, 1, 1,
-1.290161, -0.375424, -0.5427203, 1, 1, 1, 1, 1,
-1.28327, -0.2410782, -1.644668, 1, 1, 1, 1, 1,
-1.282713, -1.576551, -0.7934676, 1, 1, 1, 1, 1,
-1.282283, -0.2926359, -1.348426, 1, 1, 1, 1, 1,
-1.278523, -1.830473, -2.716913, 1, 1, 1, 1, 1,
-1.272363, -1.669419, -1.362605, 1, 1, 1, 1, 1,
-1.264246, -0.5586794, -1.049961, 1, 1, 1, 1, 1,
-1.263485, -0.3851924, -1.806774, 1, 1, 1, 1, 1,
-1.254714, -0.4996255, -1.351092, 1, 1, 1, 1, 1,
-1.249689, -0.04864381, -2.105275, 1, 1, 1, 1, 1,
-1.234832, -0.1491427, -1.427394, 1, 1, 1, 1, 1,
-1.228574, 1.338559, -0.4186015, 1, 1, 1, 1, 1,
-1.225486, 0.991236, -0.7389173, 0, 0, 1, 1, 1,
-1.211612, -1.226613, -2.555231, 1, 0, 0, 1, 1,
-1.204939, 0.5024089, -0.4679531, 1, 0, 0, 1, 1,
-1.200443, -0.2262471, -3.28865, 1, 0, 0, 1, 1,
-1.196162, -0.4535388, -1.688513, 1, 0, 0, 1, 1,
-1.187464, 2.049685, -0.4514976, 1, 0, 0, 1, 1,
-1.179794, -0.2157566, -0.9361936, 0, 0, 0, 1, 1,
-1.167253, 0.4429206, -0.3572501, 0, 0, 0, 1, 1,
-1.164715, -0.3241198, -1.611997, 0, 0, 0, 1, 1,
-1.162463, -1.243397, -0.7757801, 0, 0, 0, 1, 1,
-1.159781, 0.4799006, 0.3754084, 0, 0, 0, 1, 1,
-1.157069, 0.5763778, -2.626704, 0, 0, 0, 1, 1,
-1.15315, -0.04879753, -1.44095, 0, 0, 0, 1, 1,
-1.14522, -0.4763009, -0.3030313, 1, 1, 1, 1, 1,
-1.14489, -0.8282098, -2.45949, 1, 1, 1, 1, 1,
-1.144629, 0.3637444, 0.2190762, 1, 1, 1, 1, 1,
-1.143559, -0.0390902, -3.559222, 1, 1, 1, 1, 1,
-1.140847, 1.149765, -2.397343, 1, 1, 1, 1, 1,
-1.139849, -0.6726755, -0.5402345, 1, 1, 1, 1, 1,
-1.136953, -0.506787, -0.3704808, 1, 1, 1, 1, 1,
-1.134996, 0.5372583, -2.277107, 1, 1, 1, 1, 1,
-1.133768, 0.2074652, -2.37875, 1, 1, 1, 1, 1,
-1.126881, -1.421216, -4.173718, 1, 1, 1, 1, 1,
-1.121076, -0.909266, -3.489864, 1, 1, 1, 1, 1,
-1.118723, 0.7814442, 0.0709683, 1, 1, 1, 1, 1,
-1.112863, -0.785511, -2.469761, 1, 1, 1, 1, 1,
-1.105305, -0.4045425, -1.491721, 1, 1, 1, 1, 1,
-1.100999, 0.8239288, -0.3940809, 1, 1, 1, 1, 1,
-1.08454, -0.5603516, -1.320975, 0, 0, 1, 1, 1,
-1.079969, -0.06038313, -0.2522933, 1, 0, 0, 1, 1,
-1.077382, -0.6925849, -2.134288, 1, 0, 0, 1, 1,
-1.076932, -0.3174994, -1.313584, 1, 0, 0, 1, 1,
-1.076406, -0.9713829, -2.227511, 1, 0, 0, 1, 1,
-1.071272, -0.6497675, -3.105692, 1, 0, 0, 1, 1,
-1.066921, 0.008139047, -2.084805, 0, 0, 0, 1, 1,
-1.066804, -0.7955203, -2.400394, 0, 0, 0, 1, 1,
-1.059756, 0.5984119, -1.434893, 0, 0, 0, 1, 1,
-1.051253, 0.30227, -2.492885, 0, 0, 0, 1, 1,
-1.036143, 1.95774, -0.7974594, 0, 0, 0, 1, 1,
-1.031724, 0.5352384, 0.2216899, 0, 0, 0, 1, 1,
-1.029076, 1.536186, -0.8959064, 0, 0, 0, 1, 1,
-1.027979, 0.1115595, -1.549191, 1, 1, 1, 1, 1,
-1.013198, 2.336738, 0.0007299681, 1, 1, 1, 1, 1,
-1.008744, 0.7154127, -0.4581048, 1, 1, 1, 1, 1,
-1.003842, 0.2017659, -3.800035, 1, 1, 1, 1, 1,
-1.001576, 0.3758546, -1.983134, 1, 1, 1, 1, 1,
-0.9983677, 0.6191794, 0.262213, 1, 1, 1, 1, 1,
-0.9971933, 0.9949073, 1.147114, 1, 1, 1, 1, 1,
-0.9966102, 0.7727058, -0.9159719, 1, 1, 1, 1, 1,
-0.983944, -0.9303575, -3.875484, 1, 1, 1, 1, 1,
-0.9823651, 2.046845, -0.5915229, 1, 1, 1, 1, 1,
-0.9792492, 1.251718, -1.390808, 1, 1, 1, 1, 1,
-0.9753724, 0.27052, -1.1654, 1, 1, 1, 1, 1,
-0.9662123, 0.4482939, -1.771136, 1, 1, 1, 1, 1,
-0.9608577, 0.2868632, -0.3019861, 1, 1, 1, 1, 1,
-0.959933, 0.5726324, -0.4876118, 1, 1, 1, 1, 1,
-0.9582942, 0.2493368, -1.425184, 0, 0, 1, 1, 1,
-0.9575346, -0.1792894, -2.188594, 1, 0, 0, 1, 1,
-0.9570754, 0.3875189, -2.238949, 1, 0, 0, 1, 1,
-0.9544486, -1.570233, -2.495492, 1, 0, 0, 1, 1,
-0.9531128, 0.4329778, -0.5858276, 1, 0, 0, 1, 1,
-0.9492694, 0.5428324, -1.2375, 1, 0, 0, 1, 1,
-0.9453129, -0.4255991, -2.926386, 0, 0, 0, 1, 1,
-0.9369011, -0.6772122, -0.9640638, 0, 0, 0, 1, 1,
-0.9336019, 0.8298486, -0.2040342, 0, 0, 0, 1, 1,
-0.9322994, 1.955835, -1.411818, 0, 0, 0, 1, 1,
-0.9289542, 2.978301, 0.2636348, 0, 0, 0, 1, 1,
-0.9261082, 0.492495, -0.8594955, 0, 0, 0, 1, 1,
-0.9059902, 1.805418, 0.6991926, 0, 0, 0, 1, 1,
-0.8986926, -0.5670466, -2.798526, 1, 1, 1, 1, 1,
-0.8963828, -0.03136285, -2.044638, 1, 1, 1, 1, 1,
-0.8958122, 0.1510118, -1.923379, 1, 1, 1, 1, 1,
-0.8783844, -1.001326, -2.019132, 1, 1, 1, 1, 1,
-0.8773011, -0.03763418, 0.3642579, 1, 1, 1, 1, 1,
-0.8735757, 1.411363, -1.260068, 1, 1, 1, 1, 1,
-0.8729068, -0.6655515, -2.353501, 1, 1, 1, 1, 1,
-0.8710329, 3.073817, -0.3778409, 1, 1, 1, 1, 1,
-0.861018, 1.769657, -1.983521, 1, 1, 1, 1, 1,
-0.8597829, 1.623924, 0.239759, 1, 1, 1, 1, 1,
-0.8558275, 1.336315, -0.1635472, 1, 1, 1, 1, 1,
-0.8464194, 1.956796, -0.6214141, 1, 1, 1, 1, 1,
-0.8463181, -0.1679607, -1.487711, 1, 1, 1, 1, 1,
-0.8431785, -0.9257149, -2.580395, 1, 1, 1, 1, 1,
-0.8419583, -2.370052, -3.299278, 1, 1, 1, 1, 1,
-0.8294149, -0.7459587, -3.542882, 0, 0, 1, 1, 1,
-0.8291897, -0.02244765, -1.790358, 1, 0, 0, 1, 1,
-0.8186358, -0.5509284, -2.724882, 1, 0, 0, 1, 1,
-0.8152357, -0.673308, -4.385781, 1, 0, 0, 1, 1,
-0.814411, -1.11186, -1.510987, 1, 0, 0, 1, 1,
-0.8136951, -0.1725067, -0.3388813, 1, 0, 0, 1, 1,
-0.8129015, 1.527991, -0.08986469, 0, 0, 0, 1, 1,
-0.8114568, 0.8352606, 0.4596929, 0, 0, 0, 1, 1,
-0.8099684, 0.5885193, 1.212687, 0, 0, 0, 1, 1,
-0.8084685, -1.322054, -3.683959, 0, 0, 0, 1, 1,
-0.8047056, 0.078624, -1.450499, 0, 0, 0, 1, 1,
-0.8027105, -0.9283475, -0.8285285, 0, 0, 0, 1, 1,
-0.8010024, -0.8057264, -1.84525, 0, 0, 0, 1, 1,
-0.7985431, -0.09131137, -3.535743, 1, 1, 1, 1, 1,
-0.7968504, 0.3066191, -2.316935, 1, 1, 1, 1, 1,
-0.793866, -0.1947792, -0.900684, 1, 1, 1, 1, 1,
-0.7918822, -1.721169, -2.454247, 1, 1, 1, 1, 1,
-0.7905536, -1.471442, -1.060356, 1, 1, 1, 1, 1,
-0.7869766, -1.882466, -2.172544, 1, 1, 1, 1, 1,
-0.7864574, 0.1503351, -0.8395884, 1, 1, 1, 1, 1,
-0.7864384, 0.5961145, -1.20924, 1, 1, 1, 1, 1,
-0.7844524, -0.4862998, -3.084865, 1, 1, 1, 1, 1,
-0.783978, -1.011082, -2.168555, 1, 1, 1, 1, 1,
-0.781958, 0.2349358, -1.48749, 1, 1, 1, 1, 1,
-0.7739276, 0.2049436, -1.153696, 1, 1, 1, 1, 1,
-0.7715672, -0.05559143, -1.464385, 1, 1, 1, 1, 1,
-0.765366, 0.388163, -2.76275, 1, 1, 1, 1, 1,
-0.7631105, 0.7963806, -1.989684, 1, 1, 1, 1, 1,
-0.7612395, 0.3346721, -0.9336969, 0, 0, 1, 1, 1,
-0.7582116, 0.4487698, -1.923179, 1, 0, 0, 1, 1,
-0.7563496, 0.1145564, -1.2588, 1, 0, 0, 1, 1,
-0.7555328, -1.132782, -1.448429, 1, 0, 0, 1, 1,
-0.7542668, 0.7279223, -0.8744823, 1, 0, 0, 1, 1,
-0.7539118, -0.1317704, -0.9426975, 1, 0, 0, 1, 1,
-0.7514445, -0.9282314, -2.292589, 0, 0, 0, 1, 1,
-0.743075, -1.460979, -2.835194, 0, 0, 0, 1, 1,
-0.7399508, -0.6458063, -2.94011, 0, 0, 0, 1, 1,
-0.7347739, 1.158784, -0.3264188, 0, 0, 0, 1, 1,
-0.7345625, 2.911734, 0.2266613, 0, 0, 0, 1, 1,
-0.7335071, 1.014351, -1.635121, 0, 0, 0, 1, 1,
-0.7334836, -0.04192885, 0.2789746, 0, 0, 0, 1, 1,
-0.7283246, -1.467881, -2.844695, 1, 1, 1, 1, 1,
-0.7274015, -1.452204, -2.159296, 1, 1, 1, 1, 1,
-0.7259739, -2.22911, -1.49384, 1, 1, 1, 1, 1,
-0.7128317, -0.8174753, -4.69074, 1, 1, 1, 1, 1,
-0.7079598, -0.04930117, -1.014682, 1, 1, 1, 1, 1,
-0.706117, -1.125979, -1.82279, 1, 1, 1, 1, 1,
-0.7044922, -0.04074257, -1.947812, 1, 1, 1, 1, 1,
-0.6986089, -0.8650943, -2.537566, 1, 1, 1, 1, 1,
-0.6978679, -0.2702167, -1.852631, 1, 1, 1, 1, 1,
-0.6976525, 1.333952, -0.1868544, 1, 1, 1, 1, 1,
-0.6963065, 1.074672, -1.393455, 1, 1, 1, 1, 1,
-0.6952981, -0.9440418, -3.196221, 1, 1, 1, 1, 1,
-0.6929806, 0.3854213, -1.148386, 1, 1, 1, 1, 1,
-0.683207, -0.1319333, -2.089746, 1, 1, 1, 1, 1,
-0.6820931, -0.3339238, -3.579345, 1, 1, 1, 1, 1,
-0.6803755, 0.6244313, 0.2295609, 0, 0, 1, 1, 1,
-0.6774045, 1.077915, -0.3309954, 1, 0, 0, 1, 1,
-0.6773861, 1.200884, -1.893642, 1, 0, 0, 1, 1,
-0.6694677, -0.4050457, -1.213341, 1, 0, 0, 1, 1,
-0.6689922, 1.26803, 0.5643998, 1, 0, 0, 1, 1,
-0.6665201, 1.475247, -0.7317094, 1, 0, 0, 1, 1,
-0.6646005, 0.2490941, 0.7470362, 0, 0, 0, 1, 1,
-0.6638678, -0.5646423, 0.106994, 0, 0, 0, 1, 1,
-0.6563143, 0.6318921, -0.7670394, 0, 0, 0, 1, 1,
-0.653122, -0.7166405, -3.406453, 0, 0, 0, 1, 1,
-0.6523968, 0.7653129, -0.3675774, 0, 0, 0, 1, 1,
-0.6427947, 0.1450596, -2.436308, 0, 0, 0, 1, 1,
-0.6421465, -1.443206, -3.002108, 0, 0, 0, 1, 1,
-0.6420987, 0.5684988, -0.2111765, 1, 1, 1, 1, 1,
-0.6381931, -0.1203253, -1.548657, 1, 1, 1, 1, 1,
-0.6332265, -0.2695474, -2.81337, 1, 1, 1, 1, 1,
-0.6306935, 0.7797122, 0.244685, 1, 1, 1, 1, 1,
-0.6296704, -0.5937697, -0.7373632, 1, 1, 1, 1, 1,
-0.6289993, 0.6397829, -0.04751942, 1, 1, 1, 1, 1,
-0.6288136, 0.07372064, -2.588966, 1, 1, 1, 1, 1,
-0.6262226, -0.2063294, 0.3924469, 1, 1, 1, 1, 1,
-0.6245819, 0.8741124, 1.318032, 1, 1, 1, 1, 1,
-0.6211237, -0.2749871, -1.665578, 1, 1, 1, 1, 1,
-0.6185285, 0.1688902, -3.258958, 1, 1, 1, 1, 1,
-0.616829, 1.443719, 1.75545, 1, 1, 1, 1, 1,
-0.6138543, 0.4799061, -1.484359, 1, 1, 1, 1, 1,
-0.6131399, 0.3260716, -1.295794, 1, 1, 1, 1, 1,
-0.6127427, 1.63191, -0.8361642, 1, 1, 1, 1, 1,
-0.6118481, 1.692821, -0.8109497, 0, 0, 1, 1, 1,
-0.6092299, -1.647834, -1.342696, 1, 0, 0, 1, 1,
-0.6049377, 0.7948597, -1.818256, 1, 0, 0, 1, 1,
-0.604591, -0.2522212, -3.147064, 1, 0, 0, 1, 1,
-0.6000984, -0.2958548, -1.690063, 1, 0, 0, 1, 1,
-0.5972925, 0.7438527, -1.635662, 1, 0, 0, 1, 1,
-0.5939795, 1.046122, -0.9146208, 0, 0, 0, 1, 1,
-0.5917552, 1.010671, -0.219032, 0, 0, 0, 1, 1,
-0.5854492, 1.44865, 1.130115, 0, 0, 0, 1, 1,
-0.5837412, -0.03804516, 1.173948, 0, 0, 0, 1, 1,
-0.5830611, 1.587023, -0.4162128, 0, 0, 0, 1, 1,
-0.5732243, -0.1632014, -0.630712, 0, 0, 0, 1, 1,
-0.5723801, -0.787387, -3.564639, 0, 0, 0, 1, 1,
-0.5707726, 0.825703, -1.136823, 1, 1, 1, 1, 1,
-0.5678812, 0.8808326, 0.5390612, 1, 1, 1, 1, 1,
-0.5634729, 1.49155, -0.6714076, 1, 1, 1, 1, 1,
-0.5625328, 0.8371388, 0.5487275, 1, 1, 1, 1, 1,
-0.5622305, -0.4142394, -1.71996, 1, 1, 1, 1, 1,
-0.5571567, -2.182164, -3.037651, 1, 1, 1, 1, 1,
-0.5492668, -0.6040815, -1.851102, 1, 1, 1, 1, 1,
-0.5467695, 1.352304, 0.2379386, 1, 1, 1, 1, 1,
-0.5464841, -0.5085081, -2.814114, 1, 1, 1, 1, 1,
-0.5462737, -2.161523, -2.948307, 1, 1, 1, 1, 1,
-0.5420234, 0.8676826, -1.718545, 1, 1, 1, 1, 1,
-0.5395792, -1.855868, -1.689832, 1, 1, 1, 1, 1,
-0.5388263, -0.8662926, -0.8511195, 1, 1, 1, 1, 1,
-0.535022, -0.243325, -2.249827, 1, 1, 1, 1, 1,
-0.5332243, -0.7745199, -3.069759, 1, 1, 1, 1, 1,
-0.5314795, 1.642514, -2.861231, 0, 0, 1, 1, 1,
-0.5168152, 1.31176, -1.67307, 1, 0, 0, 1, 1,
-0.5146661, -1.076428, -3.028235, 1, 0, 0, 1, 1,
-0.510947, 0.3824808, -0.7881955, 1, 0, 0, 1, 1,
-0.5004601, -0.4539477, -1.681699, 1, 0, 0, 1, 1,
-0.4969282, 0.4916739, -0.95214, 1, 0, 0, 1, 1,
-0.4964339, 0.4488221, -0.08362143, 0, 0, 0, 1, 1,
-0.4930794, 0.8556874, -1.090264, 0, 0, 0, 1, 1,
-0.4897388, 0.1679722, -1.327284, 0, 0, 0, 1, 1,
-0.488331, -1.602782, -3.845456, 0, 0, 0, 1, 1,
-0.4819669, 0.9775112, 0.2531503, 0, 0, 0, 1, 1,
-0.4811283, -0.8369138, -1.065172, 0, 0, 0, 1, 1,
-0.4798468, -1.430432, -2.561731, 0, 0, 0, 1, 1,
-0.4788146, 2.461077, 0.2702485, 1, 1, 1, 1, 1,
-0.4735317, -0.7469076, -3.971721, 1, 1, 1, 1, 1,
-0.4725538, -0.004887093, -1.490675, 1, 1, 1, 1, 1,
-0.4711663, -0.7476192, -1.250668, 1, 1, 1, 1, 1,
-0.4703344, 3.267779, -1.384231, 1, 1, 1, 1, 1,
-0.4693103, 0.8305752, -0.3165555, 1, 1, 1, 1, 1,
-0.4616885, 0.8333569, -0.9792774, 1, 1, 1, 1, 1,
-0.4606097, -2.056726, -2.695103, 1, 1, 1, 1, 1,
-0.4593924, 0.1759987, -2.566347, 1, 1, 1, 1, 1,
-0.4557059, 0.8514451, -0.3155273, 1, 1, 1, 1, 1,
-0.4546807, -1.391378, -2.579324, 1, 1, 1, 1, 1,
-0.4543143, 0.4820734, -1.770769, 1, 1, 1, 1, 1,
-0.4427909, -1.217359, -4.027981, 1, 1, 1, 1, 1,
-0.4387107, 0.9586322, -0.3389151, 1, 1, 1, 1, 1,
-0.4364286, 1.398107, -0.3744505, 1, 1, 1, 1, 1,
-0.4315669, -0.5866769, -1.844778, 0, 0, 1, 1, 1,
-0.4303492, 0.4904798, -0.913594, 1, 0, 0, 1, 1,
-0.4112278, -1.140203, -3.184391, 1, 0, 0, 1, 1,
-0.4110555, 1.117503, 0.2768118, 1, 0, 0, 1, 1,
-0.4087745, 0.06372441, -0.7262107, 1, 0, 0, 1, 1,
-0.4076274, 0.2178416, -2.229324, 1, 0, 0, 1, 1,
-0.404817, 0.2984096, -1.500698, 0, 0, 0, 1, 1,
-0.4007114, 0.4431705, -0.8185056, 0, 0, 0, 1, 1,
-0.3949283, 0.4449292, -0.2432222, 0, 0, 0, 1, 1,
-0.3922448, 0.6318336, -0.5902776, 0, 0, 0, 1, 1,
-0.3921344, 1.062241, 0.3961076, 0, 0, 0, 1, 1,
-0.3909592, -1.58401, -3.525966, 0, 0, 0, 1, 1,
-0.3862724, -0.3305887, -3.675913, 0, 0, 0, 1, 1,
-0.3742128, -0.2897078, -3.906239, 1, 1, 1, 1, 1,
-0.3726085, 0.4620606, -0.8279968, 1, 1, 1, 1, 1,
-0.3658655, 0.7481684, -0.05575159, 1, 1, 1, 1, 1,
-0.3636812, 0.3036017, -2.705777, 1, 1, 1, 1, 1,
-0.3625057, 0.8544974, 0.1639479, 1, 1, 1, 1, 1,
-0.3600361, 1.835875, 0.7035415, 1, 1, 1, 1, 1,
-0.3592361, 1.011386, -1.122095, 1, 1, 1, 1, 1,
-0.3589392, 0.349394, -0.161392, 1, 1, 1, 1, 1,
-0.3588136, 0.18991, -1.720911, 1, 1, 1, 1, 1,
-0.3554679, 0.4492941, -0.4375445, 1, 1, 1, 1, 1,
-0.3528565, -0.8588033, -3.029276, 1, 1, 1, 1, 1,
-0.3499525, -0.576594, -1.542835, 1, 1, 1, 1, 1,
-0.3427106, -0.8421077, -2.2831, 1, 1, 1, 1, 1,
-0.3419408, -1.237176, -2.162451, 1, 1, 1, 1, 1,
-0.339768, -0.5927554, -3.586509, 1, 1, 1, 1, 1,
-0.3388632, 0.6034566, -0.862774, 0, 0, 1, 1, 1,
-0.3387064, 0.5376438, -1.098137, 1, 0, 0, 1, 1,
-0.325586, -0.3540347, -1.511373, 1, 0, 0, 1, 1,
-0.3245572, -0.7680105, -2.832191, 1, 0, 0, 1, 1,
-0.3212143, -1.281228, -4.337051, 1, 0, 0, 1, 1,
-0.3208655, 1.661388, -0.2397542, 1, 0, 0, 1, 1,
-0.3122191, 0.8092064, 0.7644174, 0, 0, 0, 1, 1,
-0.3089544, 1.936207, 0.05376263, 0, 0, 0, 1, 1,
-0.3077803, 0.4443355, -0.2338342, 0, 0, 0, 1, 1,
-0.3056717, -0.3567131, -2.579273, 0, 0, 0, 1, 1,
-0.30562, -0.4245401, -3.438693, 0, 0, 0, 1, 1,
-0.3041075, 0.1835633, -1.166059, 0, 0, 0, 1, 1,
-0.2964532, 0.4563181, -0.1192135, 0, 0, 0, 1, 1,
-0.2959211, -1.12762, -1.177841, 1, 1, 1, 1, 1,
-0.295793, -1.46783, -3.340674, 1, 1, 1, 1, 1,
-0.2957419, -0.03083625, -2.941233, 1, 1, 1, 1, 1,
-0.2923219, 0.8250771, -1.675413, 1, 1, 1, 1, 1,
-0.2922485, -0.9790837, -2.57161, 1, 1, 1, 1, 1,
-0.2870289, 0.1360172, -2.359535, 1, 1, 1, 1, 1,
-0.2855634, -0.3385435, -2.19426, 1, 1, 1, 1, 1,
-0.2823065, 1.162645, 0.1846937, 1, 1, 1, 1, 1,
-0.2807948, -0.207738, -0.789843, 1, 1, 1, 1, 1,
-0.278962, 0.07452002, -0.0716031, 1, 1, 1, 1, 1,
-0.2760101, -0.085953, -2.213696, 1, 1, 1, 1, 1,
-0.2716829, -1.033438, -1.291121, 1, 1, 1, 1, 1,
-0.2667679, -0.7189614, -3.314679, 1, 1, 1, 1, 1,
-0.2662356, 0.8374134, -1.476997, 1, 1, 1, 1, 1,
-0.2612529, 1.127789, 1.46621, 1, 1, 1, 1, 1,
-0.2610731, 0.6080732, 0.04190617, 0, 0, 1, 1, 1,
-0.2587503, 1.59451, -0.2548026, 1, 0, 0, 1, 1,
-0.2556667, 0.1884318, 0.760178, 1, 0, 0, 1, 1,
-0.2536037, 0.8774254, -0.3292368, 1, 0, 0, 1, 1,
-0.2518973, -2.004221, -3.889097, 1, 0, 0, 1, 1,
-0.2477632, 0.3470019, -2.965283, 1, 0, 0, 1, 1,
-0.2443036, -0.7575295, -3.177871, 0, 0, 0, 1, 1,
-0.2438164, -1.023122, -3.093574, 0, 0, 0, 1, 1,
-0.242078, -0.6567267, -1.498603, 0, 0, 0, 1, 1,
-0.2395336, 1.411485, 1.028072, 0, 0, 0, 1, 1,
-0.2372768, 0.8181992, 0.8344014, 0, 0, 0, 1, 1,
-0.236334, 1.674078, -2.454335, 0, 0, 0, 1, 1,
-0.2324685, 1.700017, -1.069979, 0, 0, 0, 1, 1,
-0.2300814, -0.6227191, -3.915364, 1, 1, 1, 1, 1,
-0.2294496, 0.2435476, -0.670997, 1, 1, 1, 1, 1,
-0.2273422, 0.3297666, 0.1701225, 1, 1, 1, 1, 1,
-0.222316, -1.902543, -3.538426, 1, 1, 1, 1, 1,
-0.2215461, 0.8816119, -0.08456118, 1, 1, 1, 1, 1,
-0.2193731, -0.3318713, -2.106867, 1, 1, 1, 1, 1,
-0.2176443, -0.7082762, -3.112849, 1, 1, 1, 1, 1,
-0.2166361, -0.2849422, -2.692589, 1, 1, 1, 1, 1,
-0.2163992, -0.6157249, -2.41755, 1, 1, 1, 1, 1,
-0.2147894, 0.5471689, -0.9764557, 1, 1, 1, 1, 1,
-0.2109777, -0.2054311, -3.551819, 1, 1, 1, 1, 1,
-0.2105021, -1.515029, -3.159864, 1, 1, 1, 1, 1,
-0.2080404, 0.112933, -1.93695, 1, 1, 1, 1, 1,
-0.2078287, 1.022892, -0.02920823, 1, 1, 1, 1, 1,
-0.204376, 1.183981, -2.667136, 1, 1, 1, 1, 1,
-0.2025552, -0.8625371, -4.958956, 0, 0, 1, 1, 1,
-0.202181, -1.390569, -1.859287, 1, 0, 0, 1, 1,
-0.2006149, -0.1064161, -3.459254, 1, 0, 0, 1, 1,
-0.1964714, -0.7609382, -4.244481, 1, 0, 0, 1, 1,
-0.1910624, -1.350692, -3.475976, 1, 0, 0, 1, 1,
-0.1904006, 1.76129, -0.6506882, 1, 0, 0, 1, 1,
-0.1866264, -0.1680838, -2.918491, 0, 0, 0, 1, 1,
-0.1832785, -0.4718915, -2.03133, 0, 0, 0, 1, 1,
-0.1801718, 0.09937475, -2.780214, 0, 0, 0, 1, 1,
-0.1780286, -1.994198, -2.886479, 0, 0, 0, 1, 1,
-0.1729055, -0.5716344, -1.318858, 0, 0, 0, 1, 1,
-0.1709628, 0.4810259, 1.197386, 0, 0, 0, 1, 1,
-0.1657098, 0.679289, -0.2000471, 0, 0, 0, 1, 1,
-0.1633979, 1.181598, -2.426003, 1, 1, 1, 1, 1,
-0.1606235, -1.732057, -2.870229, 1, 1, 1, 1, 1,
-0.1577429, 0.5260304, 1.677294, 1, 1, 1, 1, 1,
-0.1515702, -0.5793964, -2.254625, 1, 1, 1, 1, 1,
-0.1505812, -0.2597733, -0.2724581, 1, 1, 1, 1, 1,
-0.149363, -0.8244198, -0.6354498, 1, 1, 1, 1, 1,
-0.146244, 0.01941899, -0.5822288, 1, 1, 1, 1, 1,
-0.144341, -0.5182132, -3.814167, 1, 1, 1, 1, 1,
-0.1404792, 0.4886151, 1.949333, 1, 1, 1, 1, 1,
-0.1212913, -0.4795076, -3.862322, 1, 1, 1, 1, 1,
-0.1180423, -1.311226, -3.352104, 1, 1, 1, 1, 1,
-0.1152657, -0.5788953, -3.464379, 1, 1, 1, 1, 1,
-0.1124191, 0.9876987, -0.8652898, 1, 1, 1, 1, 1,
-0.1107943, -1.365994, -4.315699, 1, 1, 1, 1, 1,
-0.1098254, 0.2461595, -1.76669, 1, 1, 1, 1, 1,
-0.1074494, 0.3004728, -0.812684, 0, 0, 1, 1, 1,
-0.1054696, 0.220973, -0.1269009, 1, 0, 0, 1, 1,
-0.1028412, 0.9614877, 0.4441603, 1, 0, 0, 1, 1,
-0.0923036, 1.640613, 0.67706, 1, 0, 0, 1, 1,
-0.0870136, 0.4744325, -1.796125, 1, 0, 0, 1, 1,
-0.08599596, 0.9305201, -0.5541912, 1, 0, 0, 1, 1,
-0.08269816, -1.089295, -4.298409, 0, 0, 0, 1, 1,
-0.08193895, -1.866082, -3.758762, 0, 0, 0, 1, 1,
-0.08093342, -3.220781, -3.39127, 0, 0, 0, 1, 1,
-0.08018893, -1.194099, -2.992415, 0, 0, 0, 1, 1,
-0.07906137, -2.554389, -3.268502, 0, 0, 0, 1, 1,
-0.07284462, 1.587925, 0.8482698, 0, 0, 0, 1, 1,
-0.06375768, 0.3232732, -1.695776, 0, 0, 0, 1, 1,
-0.0609509, 0.01414527, -0.7594332, 1, 1, 1, 1, 1,
-0.05704875, -0.1334726, -3.343309, 1, 1, 1, 1, 1,
-0.05528243, 1.834237, -0.5332738, 1, 1, 1, 1, 1,
-0.05328969, -0.1358062, -2.480658, 1, 1, 1, 1, 1,
-0.04826195, -0.2764361, -2.835445, 1, 1, 1, 1, 1,
-0.04277317, -0.4051792, -2.7386, 1, 1, 1, 1, 1,
-0.04213729, -1.130021, -2.771978, 1, 1, 1, 1, 1,
-0.0392319, 1.679067, 1.179461, 1, 1, 1, 1, 1,
-0.03839797, -0.8976627, -2.16627, 1, 1, 1, 1, 1,
-0.03789908, 1.412135, 0.07755134, 1, 1, 1, 1, 1,
-0.03691777, -0.3177954, -1.800847, 1, 1, 1, 1, 1,
-0.03404331, -1.763917, -3.555591, 1, 1, 1, 1, 1,
-0.0319967, 0.2958677, 0.3104893, 1, 1, 1, 1, 1,
-0.02860174, -0.3010469, -3.979915, 1, 1, 1, 1, 1,
-0.02843425, 1.879947, -1.376986, 1, 1, 1, 1, 1,
-0.02720586, -1.000947, -3.884525, 0, 0, 1, 1, 1,
-0.02048839, -1.095022, -4.271782, 1, 0, 0, 1, 1,
-0.01952287, 0.7015048, -0.7180713, 1, 0, 0, 1, 1,
-0.01759431, 1.592878, -1.619191, 1, 0, 0, 1, 1,
-0.01708513, 0.8757252, 0.6021329, 1, 0, 0, 1, 1,
-0.01701303, 1.70081, 0.6815526, 1, 0, 0, 1, 1,
-0.01283161, -1.465324, -3.130415, 0, 0, 0, 1, 1,
-0.006415369, 0.9234971, 1.352752, 0, 0, 0, 1, 1,
-0.004257326, 0.9487726, -1.690794, 0, 0, 0, 1, 1,
0.002735089, 0.914915, -0.3742763, 0, 0, 0, 1, 1,
0.006400355, 0.2819783, -0.03049255, 0, 0, 0, 1, 1,
0.01661206, 0.4618835, 1.980166, 0, 0, 0, 1, 1,
0.01677601, 0.8171635, -0.5733908, 0, 0, 0, 1, 1,
0.02132513, -0.4425768, 3.905838, 1, 1, 1, 1, 1,
0.03130772, 0.6613678, 0.1782478, 1, 1, 1, 1, 1,
0.03174025, 0.02826545, 2.058287, 1, 1, 1, 1, 1,
0.03946463, 0.3198518, -1.83561, 1, 1, 1, 1, 1,
0.04062117, 0.06946202, -0.1493213, 1, 1, 1, 1, 1,
0.04250671, -0.7997642, 4.227371, 1, 1, 1, 1, 1,
0.04402361, 1.396021, -1.084112, 1, 1, 1, 1, 1,
0.0440257, -0.9268618, 2.596101, 1, 1, 1, 1, 1,
0.0445088, 0.2181403, -0.4477524, 1, 1, 1, 1, 1,
0.04789055, -1.092151, 3.578904, 1, 1, 1, 1, 1,
0.04991597, 2.775663, 0.299486, 1, 1, 1, 1, 1,
0.05070522, 0.8497667, -0.389643, 1, 1, 1, 1, 1,
0.05104151, -0.2434295, 2.970731, 1, 1, 1, 1, 1,
0.05349418, 0.6326153, -0.08236919, 1, 1, 1, 1, 1,
0.05681312, -2.534254, 3.177346, 1, 1, 1, 1, 1,
0.05837983, -0.7462348, 1.930814, 0, 0, 1, 1, 1,
0.05996317, -0.8980922, 2.861569, 1, 0, 0, 1, 1,
0.06302353, -0.9219103, 1.734223, 1, 0, 0, 1, 1,
0.06614438, -1.419361, 4.714147, 1, 0, 0, 1, 1,
0.07093579, -0.2369345, 2.134078, 1, 0, 0, 1, 1,
0.07167526, 0.9949154, 0.2932143, 1, 0, 0, 1, 1,
0.07459846, 0.03912381, 2.94281, 0, 0, 0, 1, 1,
0.07497806, -1.293482, 3.178864, 0, 0, 0, 1, 1,
0.07546028, 0.8572258, -1.198217, 0, 0, 0, 1, 1,
0.0755312, 0.3570707, 0.200978, 0, 0, 0, 1, 1,
0.07636753, 0.2101568, -0.8977898, 0, 0, 0, 1, 1,
0.07894919, 0.8472242, 1.407739, 0, 0, 0, 1, 1,
0.08231194, 0.6645858, 0.1077907, 0, 0, 0, 1, 1,
0.08789069, 0.1104031, 1.374962, 1, 1, 1, 1, 1,
0.0909764, 0.5449604, 0.8110349, 1, 1, 1, 1, 1,
0.09114777, 0.1145103, -0.3711636, 1, 1, 1, 1, 1,
0.09131892, -0.3345182, 5.187021, 1, 1, 1, 1, 1,
0.09299359, -0.1946597, 1.599285, 1, 1, 1, 1, 1,
0.09393645, -0.1240215, 3.448159, 1, 1, 1, 1, 1,
0.09776479, 0.3597756, 0.6587322, 1, 1, 1, 1, 1,
0.09942672, 0.2006683, 2.298491, 1, 1, 1, 1, 1,
0.1003852, -0.925506, 2.361485, 1, 1, 1, 1, 1,
0.1048734, -0.506255, 2.727086, 1, 1, 1, 1, 1,
0.1068902, 0.7971207, 0.5417098, 1, 1, 1, 1, 1,
0.1070512, 0.194116, 3.431205, 1, 1, 1, 1, 1,
0.1078817, 0.9337839, -0.1544322, 1, 1, 1, 1, 1,
0.1084496, 1.620719, 0.4212659, 1, 1, 1, 1, 1,
0.1105365, 0.9037831, -0.4870888, 1, 1, 1, 1, 1,
0.1114734, -0.64556, 2.677968, 0, 0, 1, 1, 1,
0.1192408, 0.2685325, -1.173411, 1, 0, 0, 1, 1,
0.1232504, 0.469206, -1.169894, 1, 0, 0, 1, 1,
0.1251624, 0.1346249, 0.5836315, 1, 0, 0, 1, 1,
0.1251994, 0.09263957, 0.6614406, 1, 0, 0, 1, 1,
0.1262938, -2.149319, 3.485928, 1, 0, 0, 1, 1,
0.1303874, -0.9901105, 2.188322, 0, 0, 0, 1, 1,
0.1306019, 1.122355, 3.094709, 0, 0, 0, 1, 1,
0.1308994, -0.006053816, 2.562385, 0, 0, 0, 1, 1,
0.1318384, 0.8513938, 1.770949, 0, 0, 0, 1, 1,
0.1332643, -0.7325757, 2.941087, 0, 0, 0, 1, 1,
0.1375853, -1.060739, 2.596501, 0, 0, 0, 1, 1,
0.1376371, -0.459486, 2.313545, 0, 0, 0, 1, 1,
0.1417692, 0.05076436, 0.5388728, 1, 1, 1, 1, 1,
0.1479312, -0.1856793, 2.531136, 1, 1, 1, 1, 1,
0.1487583, -0.8435432, 3.785262, 1, 1, 1, 1, 1,
0.1507601, -0.1109428, 2.404619, 1, 1, 1, 1, 1,
0.1509525, -0.516905, 3.203413, 1, 1, 1, 1, 1,
0.154486, 0.1263659, 0.58437, 1, 1, 1, 1, 1,
0.1559789, 0.8741035, -0.2784542, 1, 1, 1, 1, 1,
0.156777, -1.640054, 3.018073, 1, 1, 1, 1, 1,
0.1579936, -2.044717, 3.400069, 1, 1, 1, 1, 1,
0.1603207, 0.5506321, -0.7131785, 1, 1, 1, 1, 1,
0.1621344, 0.3549979, -0.009583527, 1, 1, 1, 1, 1,
0.1655688, 0.2183347, 1.602418, 1, 1, 1, 1, 1,
0.1688356, -0.9754902, 3.227079, 1, 1, 1, 1, 1,
0.1711708, -1.08044, 2.933559, 1, 1, 1, 1, 1,
0.1729314, -1.276523, 1.615004, 1, 1, 1, 1, 1,
0.173982, -0.9630144, 4.752677, 0, 0, 1, 1, 1,
0.1746521, -0.5235023, 0.5042465, 1, 0, 0, 1, 1,
0.1766528, 0.007378523, 2.599521, 1, 0, 0, 1, 1,
0.1771866, -0.2026557, 1.821798, 1, 0, 0, 1, 1,
0.1822983, -0.07534268, -0.2503736, 1, 0, 0, 1, 1,
0.184921, -0.05666516, 2.252106, 1, 0, 0, 1, 1,
0.1865469, -0.5516055, 5.548167, 0, 0, 0, 1, 1,
0.1910858, -0.1710525, 1.480877, 0, 0, 0, 1, 1,
0.1934222, 0.9983969, -1.621813, 0, 0, 0, 1, 1,
0.1949985, -0.6316946, 2.633031, 0, 0, 0, 1, 1,
0.2006749, 1.604906, 1.158159, 0, 0, 0, 1, 1,
0.2048545, -0.1421397, 2.820686, 0, 0, 0, 1, 1,
0.2052536, 1.107282, 1.289485, 0, 0, 0, 1, 1,
0.2115219, 0.9032542, -0.8459938, 1, 1, 1, 1, 1,
0.2128548, 0.8938779, -0.3403958, 1, 1, 1, 1, 1,
0.2134487, -1.994945, 2.471868, 1, 1, 1, 1, 1,
0.214077, 0.2947325, 0.7049194, 1, 1, 1, 1, 1,
0.2185131, -1.027017, 3.725291, 1, 1, 1, 1, 1,
0.2203158, -1.068508, 3.162673, 1, 1, 1, 1, 1,
0.2210624, -1.085086, 3.663717, 1, 1, 1, 1, 1,
0.229695, -1.616475, 1.100658, 1, 1, 1, 1, 1,
0.2309961, -0.5056776, 1.014485, 1, 1, 1, 1, 1,
0.2318519, -0.7045854, 1.233183, 1, 1, 1, 1, 1,
0.2344746, -0.2764243, 2.526948, 1, 1, 1, 1, 1,
0.2399622, 0.9631489, 0.4656458, 1, 1, 1, 1, 1,
0.2436349, 0.1500459, 1.517665, 1, 1, 1, 1, 1,
0.2446513, 0.6675154, 2.036704, 1, 1, 1, 1, 1,
0.2465349, 0.3981811, 0.3831214, 1, 1, 1, 1, 1,
0.2486423, 0.8918914, -0.5691917, 0, 0, 1, 1, 1,
0.2503995, 0.1910136, 0.6069891, 1, 0, 0, 1, 1,
0.2584597, -2.006728, 3.500741, 1, 0, 0, 1, 1,
0.2598217, 1.202166, 0.174956, 1, 0, 0, 1, 1,
0.2599334, -0.8217222, 2.813512, 1, 0, 0, 1, 1,
0.2625334, -1.02647, 4.322505, 1, 0, 0, 1, 1,
0.2658527, 1.337063, 2.42866, 0, 0, 0, 1, 1,
0.267409, 2.479191, -0.8908749, 0, 0, 0, 1, 1,
0.2718648, 0.03737872, 2.120437, 0, 0, 0, 1, 1,
0.2726091, -0.7278938, 2.843205, 0, 0, 0, 1, 1,
0.2741987, 0.05597828, 1.272497, 0, 0, 0, 1, 1,
0.2770828, 1.569081, 2.912067, 0, 0, 0, 1, 1,
0.2785963, 0.2870752, 2.458378, 0, 0, 0, 1, 1,
0.2795807, -0.06890033, 2.24338, 1, 1, 1, 1, 1,
0.28067, 0.5638308, 0.3590038, 1, 1, 1, 1, 1,
0.2819051, -0.4742293, 2.678669, 1, 1, 1, 1, 1,
0.2831293, -0.6010217, 1.46861, 1, 1, 1, 1, 1,
0.2846421, 1.166218, 1.546221, 1, 1, 1, 1, 1,
0.2866567, -1.097168, 3.531377, 1, 1, 1, 1, 1,
0.2875826, -0.08059198, 0.2670035, 1, 1, 1, 1, 1,
0.2893909, 0.8300231, -0.2229912, 1, 1, 1, 1, 1,
0.29011, -0.1499045, 3.103863, 1, 1, 1, 1, 1,
0.2964196, -1.855511, 3.30787, 1, 1, 1, 1, 1,
0.2987023, 0.8706897, -0.005188067, 1, 1, 1, 1, 1,
0.3004255, 1.282905, -0.3462777, 1, 1, 1, 1, 1,
0.3009332, -0.7185156, 3.763772, 1, 1, 1, 1, 1,
0.3027135, 0.8979573, -1.784955, 1, 1, 1, 1, 1,
0.3063472, -2.14207, 2.415419, 1, 1, 1, 1, 1,
0.3077258, 0.01608073, 0.8713201, 0, 0, 1, 1, 1,
0.3099334, -0.6225107, 1.238413, 1, 0, 0, 1, 1,
0.3165829, -1.909592, 4.540313, 1, 0, 0, 1, 1,
0.3202477, -0.1667209, 2.773657, 1, 0, 0, 1, 1,
0.3221027, -1.03847, 0.8105776, 1, 0, 0, 1, 1,
0.322198, 1.60874, -1.038455, 1, 0, 0, 1, 1,
0.324649, -0.9431586, 3.290256, 0, 0, 0, 1, 1,
0.3309599, -0.2919817, 2.578177, 0, 0, 0, 1, 1,
0.332211, 0.08639863, 1.220274, 0, 0, 0, 1, 1,
0.3416609, 0.02712353, 0.3041896, 0, 0, 0, 1, 1,
0.3440876, 0.5772349, 0.2219523, 0, 0, 0, 1, 1,
0.3462572, -0.9502044, 3.359111, 0, 0, 0, 1, 1,
0.346321, 2.253378, -0.505296, 0, 0, 0, 1, 1,
0.3543129, -0.837951, 4.90696, 1, 1, 1, 1, 1,
0.3560111, -0.3656716, 2.841987, 1, 1, 1, 1, 1,
0.3565251, 0.0827093, 1.277166, 1, 1, 1, 1, 1,
0.3568379, -0.6882993, 2.698539, 1, 1, 1, 1, 1,
0.3579092, -0.3524423, 1.595782, 1, 1, 1, 1, 1,
0.3586223, 0.9506465, -0.6302168, 1, 1, 1, 1, 1,
0.3590256, -0.7344319, 3.309555, 1, 1, 1, 1, 1,
0.3612225, -0.4567058, 3.179023, 1, 1, 1, 1, 1,
0.3679068, 1.264702, 1.81712, 1, 1, 1, 1, 1,
0.3732099, 0.6783973, 0.7897375, 1, 1, 1, 1, 1,
0.3747212, 0.3056716, 1.658971, 1, 1, 1, 1, 1,
0.3769765, -0.2437476, 0.6464939, 1, 1, 1, 1, 1,
0.3774799, -0.1180617, 3.375736, 1, 1, 1, 1, 1,
0.3798783, 0.2810245, -0.716749, 1, 1, 1, 1, 1,
0.3840872, -1.484906, 3.353363, 1, 1, 1, 1, 1,
0.3868639, -1.409034, 4.959881, 0, 0, 1, 1, 1,
0.3880905, -1.266322, 3.133401, 1, 0, 0, 1, 1,
0.3906601, 1.877684, -0.4253393, 1, 0, 0, 1, 1,
0.3976098, 1.107474, 1.686894, 1, 0, 0, 1, 1,
0.3981413, 0.51876, -1.008646, 1, 0, 0, 1, 1,
0.4004593, 0.6386964, 0.1959961, 1, 0, 0, 1, 1,
0.4024933, -0.08070827, 2.695842, 0, 0, 0, 1, 1,
0.4033242, -0.08991811, 0.8806388, 0, 0, 0, 1, 1,
0.404463, -0.03348315, 2.370783, 0, 0, 0, 1, 1,
0.408899, -1.518053, 1.596839, 0, 0, 0, 1, 1,
0.4146937, -1.035768, 3.873816, 0, 0, 0, 1, 1,
0.418861, -0.02159218, 1.768026, 0, 0, 0, 1, 1,
0.4199392, 0.5977905, 0.7302835, 0, 0, 0, 1, 1,
0.426606, -1.902142, 3.18681, 1, 1, 1, 1, 1,
0.4266089, -0.8548422, 2.710792, 1, 1, 1, 1, 1,
0.4293862, 1.123565, -1.129426, 1, 1, 1, 1, 1,
0.4316787, 1.057992, 0.2671449, 1, 1, 1, 1, 1,
0.4331574, 1.265863, -0.1324959, 1, 1, 1, 1, 1,
0.4343942, -0.05596766, 0.1533646, 1, 1, 1, 1, 1,
0.4360292, 1.200134, -1.839332, 1, 1, 1, 1, 1,
0.4416267, 2.174469, 2.03566, 1, 1, 1, 1, 1,
0.4440778, -1.784022, 2.215395, 1, 1, 1, 1, 1,
0.4449702, 0.7533292, 0.4232931, 1, 1, 1, 1, 1,
0.4491385, -0.03344647, 1.014325, 1, 1, 1, 1, 1,
0.4492474, -0.3481939, 1.580201, 1, 1, 1, 1, 1,
0.4515648, 0.9603506, -0.1071326, 1, 1, 1, 1, 1,
0.4518138, 0.4240584, 2.145369, 1, 1, 1, 1, 1,
0.4524084, 1.80755, 1.064204, 1, 1, 1, 1, 1,
0.4602357, -0.1168577, 1.511741, 0, 0, 1, 1, 1,
0.4603746, 0.323258, 1.94747, 1, 0, 0, 1, 1,
0.4632124, 0.07433543, 2.072166, 1, 0, 0, 1, 1,
0.4639188, 1.306969, -0.8583732, 1, 0, 0, 1, 1,
0.4658947, 1.822468, 0.1510227, 1, 0, 0, 1, 1,
0.4662634, -0.4318996, 2.611292, 1, 0, 0, 1, 1,
0.4783076, -0.8157424, 1.714617, 0, 0, 0, 1, 1,
0.4826986, 1.160244, 1.395569, 0, 0, 0, 1, 1,
0.4840171, -1.651157, 2.07937, 0, 0, 0, 1, 1,
0.485873, -0.5034465, 2.566963, 0, 0, 0, 1, 1,
0.4861668, 1.06449, 2.036792, 0, 0, 0, 1, 1,
0.4863426, 1.428197, 0.1033153, 0, 0, 0, 1, 1,
0.4876389, -0.5528845, 2.470929, 0, 0, 0, 1, 1,
0.492175, 1.239669, 0.3960169, 1, 1, 1, 1, 1,
0.4978104, -0.7128888, 2.572456, 1, 1, 1, 1, 1,
0.498037, 0.292598, -1.071032, 1, 1, 1, 1, 1,
0.5059407, 0.05955768, 3.020987, 1, 1, 1, 1, 1,
0.5086576, -0.3373603, 1.613888, 1, 1, 1, 1, 1,
0.5217508, 1.67506, 2.628391, 1, 1, 1, 1, 1,
0.5316529, -0.1143017, 0.6864843, 1, 1, 1, 1, 1,
0.5338252, -0.4060113, 1.788279, 1, 1, 1, 1, 1,
0.5375969, -1.265674, 1.889062, 1, 1, 1, 1, 1,
0.5452602, 0.4010081, 0.4575645, 1, 1, 1, 1, 1,
0.5461033, 1.936049, 0.3837222, 1, 1, 1, 1, 1,
0.5491694, 1.852951, -0.3380719, 1, 1, 1, 1, 1,
0.5503832, 1.30873, -0.4915549, 1, 1, 1, 1, 1,
0.5517057, -1.054909, 2.914346, 1, 1, 1, 1, 1,
0.5520467, -0.7739708, 1.863807, 1, 1, 1, 1, 1,
0.5538672, -0.1567704, 1.604189, 0, 0, 1, 1, 1,
0.5584765, -0.3779185, 1.229121, 1, 0, 0, 1, 1,
0.5638316, 1.337348, -0.4235078, 1, 0, 0, 1, 1,
0.5657995, 0.2600579, 0.2129232, 1, 0, 0, 1, 1,
0.5676073, 1.764022, 0.3315747, 1, 0, 0, 1, 1,
0.5676543, -0.9329716, 1.379917, 1, 0, 0, 1, 1,
0.5694588, -1.817364, 4.294374, 0, 0, 0, 1, 1,
0.5707387, -1.746513, 3.072126, 0, 0, 0, 1, 1,
0.5764987, -0.2968652, 1.547436, 0, 0, 0, 1, 1,
0.5771417, 0.2233281, 3.188335, 0, 0, 0, 1, 1,
0.5782048, 0.5517219, 0.6966321, 0, 0, 0, 1, 1,
0.5785878, -0.03269554, 2.522995, 0, 0, 0, 1, 1,
0.5839824, 0.03635959, 2.063423, 0, 0, 0, 1, 1,
0.5889319, 0.8078617, 3.052383, 1, 1, 1, 1, 1,
0.5909895, 0.1639234, 0.3984932, 1, 1, 1, 1, 1,
0.5915425, 1.532479, 0.7035675, 1, 1, 1, 1, 1,
0.5929301, -0.2453867, 2.966038, 1, 1, 1, 1, 1,
0.5942546, 1.293596, 2.16888, 1, 1, 1, 1, 1,
0.5948488, -0.6331255, 2.291641, 1, 1, 1, 1, 1,
0.6013775, 0.3310947, -0.08298224, 1, 1, 1, 1, 1,
0.6035421, -1.126186, 2.375659, 1, 1, 1, 1, 1,
0.6079872, -1.47019, 4.111609, 1, 1, 1, 1, 1,
0.6120806, 1.536966, 1.604473, 1, 1, 1, 1, 1,
0.614375, -0.1216966, 1.38592, 1, 1, 1, 1, 1,
0.6150035, 1.520897, 0.08322197, 1, 1, 1, 1, 1,
0.6162126, -0.00379587, 2.434972, 1, 1, 1, 1, 1,
0.6212813, -1.090219, 1.486729, 1, 1, 1, 1, 1,
0.6231268, -0.6430911, 2.675948, 1, 1, 1, 1, 1,
0.6231863, -0.6479411, 1.759216, 0, 0, 1, 1, 1,
0.6238568, 0.1633143, 0.7218804, 1, 0, 0, 1, 1,
0.627911, 0.2590088, 1.948048, 1, 0, 0, 1, 1,
0.6283163, -0.4290915, 3.289696, 1, 0, 0, 1, 1,
0.628494, -0.1917887, 0.6127127, 1, 0, 0, 1, 1,
0.6314471, 0.08946595, 2.068396, 1, 0, 0, 1, 1,
0.6322625, -0.9507047, 3.165066, 0, 0, 0, 1, 1,
0.63777, 1.50098, 1.450468, 0, 0, 0, 1, 1,
0.6405617, -0.7631742, 1.249689, 0, 0, 0, 1, 1,
0.6413639, 0.3881159, 1.460045, 0, 0, 0, 1, 1,
0.6427996, -0.6368667, 2.131397, 0, 0, 0, 1, 1,
0.6438457, 0.1269855, 1.075224, 0, 0, 0, 1, 1,
0.6457621, -0.07377626, 1.020823, 0, 0, 0, 1, 1,
0.6520533, -0.8819702, 2.123755, 1, 1, 1, 1, 1,
0.6536174, -0.9017008, 3.265792, 1, 1, 1, 1, 1,
0.6588442, -0.02861131, 0.8964615, 1, 1, 1, 1, 1,
0.6645148, -0.3546233, 3.025108, 1, 1, 1, 1, 1,
0.6709141, 0.855009, 0.3778764, 1, 1, 1, 1, 1,
0.6756817, 0.3593243, 3.559553, 1, 1, 1, 1, 1,
0.6763999, -0.1768002, 0.6813166, 1, 1, 1, 1, 1,
0.6783158, 0.4085385, 3.197119, 1, 1, 1, 1, 1,
0.6819642, -0.1396276, 1.006741, 1, 1, 1, 1, 1,
0.6831186, 0.9867086, 0.3697384, 1, 1, 1, 1, 1,
0.6854376, 0.04184593, 0.6555669, 1, 1, 1, 1, 1,
0.6878088, -0.1633965, 1.429529, 1, 1, 1, 1, 1,
0.6906018, -1.704647, 1.955897, 1, 1, 1, 1, 1,
0.6930655, -1.715307, 3.40057, 1, 1, 1, 1, 1,
0.6931989, -0.6539223, 2.464337, 1, 1, 1, 1, 1,
0.694226, 1.187394, 1.36681, 0, 0, 1, 1, 1,
0.6990067, -1.217288, 2.525609, 1, 0, 0, 1, 1,
0.6990916, -0.3378308, 3.804325, 1, 0, 0, 1, 1,
0.7032043, -0.9094214, 1.748995, 1, 0, 0, 1, 1,
0.7040682, 0.2923147, 1.5656, 1, 0, 0, 1, 1,
0.7079663, 1.142123, 1.81892, 1, 0, 0, 1, 1,
0.7109087, 0.1347058, 1.394357, 0, 0, 0, 1, 1,
0.717702, 0.8247892, 2.547933, 0, 0, 0, 1, 1,
0.7183991, -0.2193964, 1.114463, 0, 0, 0, 1, 1,
0.7189071, 1.039101, -0.001686197, 0, 0, 0, 1, 1,
0.723203, 1.227434, 1.094309, 0, 0, 0, 1, 1,
0.7291607, -0.5466409, 1.830105, 0, 0, 0, 1, 1,
0.7318234, -0.1481725, 4.103068, 0, 0, 0, 1, 1,
0.7404628, 0.6793119, 2.047932, 1, 1, 1, 1, 1,
0.7436307, 0.1947908, 0.4823777, 1, 1, 1, 1, 1,
0.7448331, 0.4129258, 1.204734, 1, 1, 1, 1, 1,
0.7487302, -0.6455705, 0.07566311, 1, 1, 1, 1, 1,
0.7515828, 1.013683, 0.9483952, 1, 1, 1, 1, 1,
0.7528571, -2.143724, 1.325436, 1, 1, 1, 1, 1,
0.7534549, -1.011539, 1.987351, 1, 1, 1, 1, 1,
0.7536365, -0.1813379, 3.874053, 1, 1, 1, 1, 1,
0.758712, -1.218969, 3.070341, 1, 1, 1, 1, 1,
0.7662115, -1.316465, 1.689726, 1, 1, 1, 1, 1,
0.7671703, -0.4386377, 2.979234, 1, 1, 1, 1, 1,
0.7735835, 0.5297795, 1.60161, 1, 1, 1, 1, 1,
0.7761588, -2.266847, 1.940516, 1, 1, 1, 1, 1,
0.7764884, 0.2096876, 1.518909, 1, 1, 1, 1, 1,
0.7817767, 1.640857, -0.193401, 1, 1, 1, 1, 1,
0.7861065, -0.1184909, 1.978908, 0, 0, 1, 1, 1,
0.7966657, 1.310336, 1.036532, 1, 0, 0, 1, 1,
0.8023763, -1.009549, 0.8634975, 1, 0, 0, 1, 1,
0.8027443, 0.6649178, -2.030723, 1, 0, 0, 1, 1,
0.8125242, 0.6997039, 0.3161751, 1, 0, 0, 1, 1,
0.8234749, -1.534675, 2.165945, 1, 0, 0, 1, 1,
0.8273519, 1.861192, 0.1037072, 0, 0, 0, 1, 1,
0.8282213, 0.1603305, 0.9062935, 0, 0, 0, 1, 1,
0.8299555, 0.6505992, 0.9850051, 0, 0, 0, 1, 1,
0.831131, -1.281697, 2.564161, 0, 0, 0, 1, 1,
0.8312074, -1.365676, 2.64876, 0, 0, 0, 1, 1,
0.8319368, -0.327565, 1.131125, 0, 0, 0, 1, 1,
0.85005, -1.211233, 3.60052, 0, 0, 0, 1, 1,
0.8513634, 0.2265649, 0.7803553, 1, 1, 1, 1, 1,
0.8552395, -0.5597809, 3.525067, 1, 1, 1, 1, 1,
0.8589421, 0.7743797, 0.01679588, 1, 1, 1, 1, 1,
0.8667544, -0.02605834, 1.152215, 1, 1, 1, 1, 1,
0.8675773, -0.6543807, 1.839774, 1, 1, 1, 1, 1,
0.8677199, -0.4874968, 2.283396, 1, 1, 1, 1, 1,
0.8679947, 0.6615304, 1.006353, 1, 1, 1, 1, 1,
0.871643, 1.488707, -1.031216, 1, 1, 1, 1, 1,
0.8736605, -1.327881, 3.171534, 1, 1, 1, 1, 1,
0.8771954, 1.460656, -0.5022305, 1, 1, 1, 1, 1,
0.8831135, 0.6956723, -1.209869, 1, 1, 1, 1, 1,
0.889323, 1.446513, 1.134953, 1, 1, 1, 1, 1,
0.8895888, 1.199059, 0.06021382, 1, 1, 1, 1, 1,
0.8926954, -1.446331, 2.495522, 1, 1, 1, 1, 1,
0.8945586, -0.09233777, 0.2417711, 1, 1, 1, 1, 1,
0.8952872, 0.8113695, -0.430131, 0, 0, 1, 1, 1,
0.9005547, 0.6499967, 1.45879, 1, 0, 0, 1, 1,
0.9062845, -1.663393, 1.635504, 1, 0, 0, 1, 1,
0.9139407, -0.8797362, 2.488878, 1, 0, 0, 1, 1,
0.914701, -1.05398, 2.034996, 1, 0, 0, 1, 1,
0.918664, -0.6994373, 1.744467, 1, 0, 0, 1, 1,
0.9201455, -0.1939681, 2.518875, 0, 0, 0, 1, 1,
0.928866, -0.647656, 2.332241, 0, 0, 0, 1, 1,
0.9397513, 0.4288015, 1.821914, 0, 0, 0, 1, 1,
0.9459987, 1.450269, 0.3728726, 0, 0, 0, 1, 1,
0.9507658, 0.8779566, 1.244519, 0, 0, 0, 1, 1,
0.9585396, 1.210471, -0.4329878, 0, 0, 0, 1, 1,
0.9633998, 0.5540815, 0.7717373, 0, 0, 0, 1, 1,
0.9650496, 0.5391859, -0.3355898, 1, 1, 1, 1, 1,
0.9705454, 1.042103, -0.2454412, 1, 1, 1, 1, 1,
0.9748669, 1.149662, 2.176855, 1, 1, 1, 1, 1,
0.9773424, -0.997979, 1.902078, 1, 1, 1, 1, 1,
0.9805525, 1.096444, 2.10771, 1, 1, 1, 1, 1,
0.9964728, 0.3043641, -0.7100689, 1, 1, 1, 1, 1,
1.000124, 1.514131, 0.2450055, 1, 1, 1, 1, 1,
1.002129, 0.6606535, 2.272554, 1, 1, 1, 1, 1,
1.008332, -0.4114231, 1.233694, 1, 1, 1, 1, 1,
1.008378, 0.1992498, 2.525436, 1, 1, 1, 1, 1,
1.024501, 0.106538, 2.440795, 1, 1, 1, 1, 1,
1.02698, 0.7740345, -0.6727804, 1, 1, 1, 1, 1,
1.038377, -0.4370668, 1.922674, 1, 1, 1, 1, 1,
1.05649, -0.9939223, 3.659448, 1, 1, 1, 1, 1,
1.057971, -1.268179, 2.328515, 1, 1, 1, 1, 1,
1.061634, 0.3749868, 2.109224, 0, 0, 1, 1, 1,
1.063752, -0.1546549, 2.700044, 1, 0, 0, 1, 1,
1.068395, 1.23941, -1.272832, 1, 0, 0, 1, 1,
1.072114, 0.639101, 1.372464, 1, 0, 0, 1, 1,
1.074114, 0.2868885, 0.620898, 1, 0, 0, 1, 1,
1.074326, 0.8612764, 1.381971, 1, 0, 0, 1, 1,
1.075356, 0.47697, 0.5789027, 0, 0, 0, 1, 1,
1.078356, 0.4374087, 2.177644, 0, 0, 0, 1, 1,
1.084606, -0.3199636, 0.4010947, 0, 0, 0, 1, 1,
1.095813, 0.2133721, 2.011353, 0, 0, 0, 1, 1,
1.096074, 0.1324994, 1.944391, 0, 0, 0, 1, 1,
1.097205, 0.1864087, 2.299006, 0, 0, 0, 1, 1,
1.108115, -0.1806732, 1.338075, 0, 0, 0, 1, 1,
1.116394, 0.5249926, 0.1544304, 1, 1, 1, 1, 1,
1.116686, 1.308709, 0.6120819, 1, 1, 1, 1, 1,
1.121794, -1.039527, 3.735974, 1, 1, 1, 1, 1,
1.123055, 2.485643, -0.1646424, 1, 1, 1, 1, 1,
1.123456, -0.004785951, 0.886521, 1, 1, 1, 1, 1,
1.123871, 0.4668754, 1.362956, 1, 1, 1, 1, 1,
1.128134, -1.259087, 2.943518, 1, 1, 1, 1, 1,
1.132703, 0.4221519, 1.344018, 1, 1, 1, 1, 1,
1.133945, -1.099564, 1.814409, 1, 1, 1, 1, 1,
1.143121, -1.16278, 3.292361, 1, 1, 1, 1, 1,
1.144363, 1.680527, 1.072974, 1, 1, 1, 1, 1,
1.145212, 0.2999204, -1.127481, 1, 1, 1, 1, 1,
1.152048, -0.2889886, 2.193169, 1, 1, 1, 1, 1,
1.154593, -0.8821737, 3.424226, 1, 1, 1, 1, 1,
1.155898, 0.2839169, 2.307591, 1, 1, 1, 1, 1,
1.159542, 1.347717, 2.183644, 0, 0, 1, 1, 1,
1.161105, 0.08705982, 0.2396677, 1, 0, 0, 1, 1,
1.166596, 0.3289461, 3.099413, 1, 0, 0, 1, 1,
1.184158, -0.7602735, 2.226972, 1, 0, 0, 1, 1,
1.189581, 0.6661206, 2.02678, 1, 0, 0, 1, 1,
1.195033, -0.3083418, 1.444738, 1, 0, 0, 1, 1,
1.195635, -0.9817026, 0.986411, 0, 0, 0, 1, 1,
1.199772, 0.2249128, 2.166723, 0, 0, 0, 1, 1,
1.201288, 0.03753478, 0.5357089, 0, 0, 0, 1, 1,
1.202107, -3.459624, 2.98169, 0, 0, 0, 1, 1,
1.202283, -0.1117611, 0.7089857, 0, 0, 0, 1, 1,
1.202525, -1.731633, 2.223144, 0, 0, 0, 1, 1,
1.205679, -0.7483815, 2.715891, 0, 0, 0, 1, 1,
1.212615, 0.8261507, 2.150883, 1, 1, 1, 1, 1,
1.214115, 0.8882279, 1.928323, 1, 1, 1, 1, 1,
1.214745, 0.2629668, 2.205973, 1, 1, 1, 1, 1,
1.220481, -0.9799715, 2.221925, 1, 1, 1, 1, 1,
1.222206, 0.8546929, 1.612579, 1, 1, 1, 1, 1,
1.23204, -2.348782, 3.442288, 1, 1, 1, 1, 1,
1.233249, -1.810095, 4.219961, 1, 1, 1, 1, 1,
1.237141, -0.3051945, 1.751894, 1, 1, 1, 1, 1,
1.237521, 1.895917, 0.4873738, 1, 1, 1, 1, 1,
1.242368, -0.125434, 1.935226, 1, 1, 1, 1, 1,
1.243104, -0.418985, 1.136713, 1, 1, 1, 1, 1,
1.246573, 0.3742691, 0.9743404, 1, 1, 1, 1, 1,
1.248134, -0.04694722, -0.36821, 1, 1, 1, 1, 1,
1.249998, 0.7360988, -0.1088335, 1, 1, 1, 1, 1,
1.252157, -1.097278, 0.962512, 1, 1, 1, 1, 1,
1.264956, -1.034569, 2.20619, 0, 0, 1, 1, 1,
1.271339, -0.8652962, 2.078509, 1, 0, 0, 1, 1,
1.278985, 0.4523582, 1.530316, 1, 0, 0, 1, 1,
1.279347, 0.3433609, 1.355502, 1, 0, 0, 1, 1,
1.29171, -0.4664746, 2.720914, 1, 0, 0, 1, 1,
1.296631, 0.1113278, 2.896836, 1, 0, 0, 1, 1,
1.297395, 0.5440707, -0.555603, 0, 0, 0, 1, 1,
1.309516, -0.4846241, 2.197228, 0, 0, 0, 1, 1,
1.320437, 1.442783, 2.711187, 0, 0, 0, 1, 1,
1.327049, 0.1868551, 0.1926893, 0, 0, 0, 1, 1,
1.334967, -0.5035179, 2.055894, 0, 0, 0, 1, 1,
1.335444, -0.04558254, 1.045319, 0, 0, 0, 1, 1,
1.339515, 0.1867721, 1.064184, 0, 0, 0, 1, 1,
1.339518, 0.1010271, 4.672632, 1, 1, 1, 1, 1,
1.34206, 0.4715639, -0.5732995, 1, 1, 1, 1, 1,
1.347131, 0.08550136, 0.6807873, 1, 1, 1, 1, 1,
1.351713, 0.2686685, 2.312124, 1, 1, 1, 1, 1,
1.359236, 1.316048, 0.9969561, 1, 1, 1, 1, 1,
1.368121, 2.226449, 0.8434216, 1, 1, 1, 1, 1,
1.368543, 0.02253308, 3.314452, 1, 1, 1, 1, 1,
1.379258, -0.773437, 2.807012, 1, 1, 1, 1, 1,
1.379773, 0.8515726, 0.6002659, 1, 1, 1, 1, 1,
1.382398, -0.6868396, 0.06598163, 1, 1, 1, 1, 1,
1.382599, -0.4286221, 2.903897, 1, 1, 1, 1, 1,
1.386312, 0.5802983, 1.545786, 1, 1, 1, 1, 1,
1.404801, -1.584129, 2.156028, 1, 1, 1, 1, 1,
1.405239, 0.7471821, 0.4034064, 1, 1, 1, 1, 1,
1.408938, -1.038662, 2.609493, 1, 1, 1, 1, 1,
1.41058, 2.50462, 0.1626489, 0, 0, 1, 1, 1,
1.428282, 2.485904, 1.602136, 1, 0, 0, 1, 1,
1.439944, 1.32492, 2.728996, 1, 0, 0, 1, 1,
1.451888, 1.468078, 1.506381, 1, 0, 0, 1, 1,
1.461574, -0.1126958, 2.395505, 1, 0, 0, 1, 1,
1.466524, 1.0588, 1.033567, 1, 0, 0, 1, 1,
1.471219, 0.5799007, 1.836658, 0, 0, 0, 1, 1,
1.477066, 0.9351573, 1.915066, 0, 0, 0, 1, 1,
1.481406, 1.011366, -0.08974638, 0, 0, 0, 1, 1,
1.488448, -1.184163, 1.253916, 0, 0, 0, 1, 1,
1.498395, 0.4510686, 1.738484, 0, 0, 0, 1, 1,
1.519136, -0.3351495, 1.852563, 0, 0, 0, 1, 1,
1.528349, 0.8686221, 1.26958, 0, 0, 0, 1, 1,
1.536281, -0.1677742, 1.886473, 1, 1, 1, 1, 1,
1.540521, -1.236604, 2.415566, 1, 1, 1, 1, 1,
1.542316, -0.08386756, 0.7500242, 1, 1, 1, 1, 1,
1.554687, 1.01554, 2.532236, 1, 1, 1, 1, 1,
1.573697, -0.6936896, 1.058415, 1, 1, 1, 1, 1,
1.576691, 1.670577, 2.276956, 1, 1, 1, 1, 1,
1.59219, -1.077687, 1.023257, 1, 1, 1, 1, 1,
1.607433, 0.7146671, 1.509281, 1, 1, 1, 1, 1,
1.638533, -0.2004014, 2.774462, 1, 1, 1, 1, 1,
1.652608, 0.4568524, 1.623792, 1, 1, 1, 1, 1,
1.658208, 1.549307, 2.236744, 1, 1, 1, 1, 1,
1.661131, 1.165803, 0.1220456, 1, 1, 1, 1, 1,
1.665285, -1.91401, 1.275931, 1, 1, 1, 1, 1,
1.666623, -1.308005, 2.10022, 1, 1, 1, 1, 1,
1.66781, -2.062357, 1.387547, 1, 1, 1, 1, 1,
1.676544, -1.017828, 1.766207, 0, 0, 1, 1, 1,
1.691741, 1.37133, 0.9892465, 1, 0, 0, 1, 1,
1.705197, -1.014691, 3.384312, 1, 0, 0, 1, 1,
1.711494, -2.843696, 1.602708, 1, 0, 0, 1, 1,
1.726234, -0.6612172, -0.2600001, 1, 0, 0, 1, 1,
1.726302, 1.389664, -0.4942923, 1, 0, 0, 1, 1,
1.734599, -0.04933383, 1.126591, 0, 0, 0, 1, 1,
1.735209, -1.02231, 3.092832, 0, 0, 0, 1, 1,
1.739052, 0.3350546, 2.424798, 0, 0, 0, 1, 1,
1.752252, 0.5259867, 1.017913, 0, 0, 0, 1, 1,
1.752728, 0.5229806, 2.736722, 0, 0, 0, 1, 1,
1.768912, -1.010504, 1.834479, 0, 0, 0, 1, 1,
1.772479, 0.08661734, 1.384937, 0, 0, 0, 1, 1,
1.790874, 0.5176706, 2.502117, 1, 1, 1, 1, 1,
1.816534, -0.9174551, 0.9575895, 1, 1, 1, 1, 1,
1.81657, 1.683893, -0.767933, 1, 1, 1, 1, 1,
1.823863, -1.087817, 2.493307, 1, 1, 1, 1, 1,
1.830418, -1.226806, 1.017398, 1, 1, 1, 1, 1,
1.831876, -0.7997295, 2.026388, 1, 1, 1, 1, 1,
1.842723, 0.8107257, 1.072873, 1, 1, 1, 1, 1,
1.852576, -0.4232038, 1.570387, 1, 1, 1, 1, 1,
1.882174, 1.096144, 0.9158264, 1, 1, 1, 1, 1,
1.892224, -1.237255, 2.582914, 1, 1, 1, 1, 1,
1.978431, 0.1029508, 1.919512, 1, 1, 1, 1, 1,
1.980926, 1.004581, 1.533999, 1, 1, 1, 1, 1,
1.987625, 1.266641, -0.0905688, 1, 1, 1, 1, 1,
1.998072, -1.390513, 2.603763, 1, 1, 1, 1, 1,
2.012328, -1.365653, 2.531258, 1, 1, 1, 1, 1,
2.021051, -0.1006128, 2.970499, 0, 0, 1, 1, 1,
2.022846, -0.4043032, 4.894606, 1, 0, 0, 1, 1,
2.041932, 0.5557543, 2.36767, 1, 0, 0, 1, 1,
2.062642, -0.8166709, 1.591991, 1, 0, 0, 1, 1,
2.071528, 0.9757621, 0.5459218, 1, 0, 0, 1, 1,
2.103001, -0.2561403, 1.967349, 1, 0, 0, 1, 1,
2.214586, -0.5322567, 1.793768, 0, 0, 0, 1, 1,
2.275126, 0.9414831, 3.584862, 0, 0, 0, 1, 1,
2.298267, -0.8515172, 1.531395, 0, 0, 0, 1, 1,
2.340851, 0.5607361, 0.5459422, 0, 0, 0, 1, 1,
2.348325, -1.11587, 3.336518, 0, 0, 0, 1, 1,
2.358673, -0.07073691, 1.704263, 0, 0, 0, 1, 1,
2.378861, 0.4814337, 1.344997, 0, 0, 0, 1, 1,
2.462767, 0.5814568, 1.759616, 1, 1, 1, 1, 1,
2.472156, -0.789748, 0.4932813, 1, 1, 1, 1, 1,
2.616777, -0.03035949, -0.1342047, 1, 1, 1, 1, 1,
2.628708, 0.5892575, 2.648318, 1, 1, 1, 1, 1,
2.718813, 1.057929, 1.154973, 1, 1, 1, 1, 1,
3.043336, 0.4063307, 1.717942, 1, 1, 1, 1, 1,
3.312362, 0.04234888, 0.5176708, 1, 1, 1, 1, 1
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
var radius = 9.736432;
var distance = 34.1988;
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
mvMatrix.translate( 0.05890155, 0.09592247, -0.2081592 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1988);
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
