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
-3.110021, -0.23727, -1.051186, 1, 0, 0, 1,
-3.031178, -2.637966, -1.897773, 1, 0.007843138, 0, 1,
-3.02598, -1.161309, -0.8432962, 1, 0.01176471, 0, 1,
-2.888324, 0.9304329, -1.236506, 1, 0.01960784, 0, 1,
-2.866254, -1.226893, -0.9230185, 1, 0.02352941, 0, 1,
-2.509721, 1.427463, -2.086958, 1, 0.03137255, 0, 1,
-2.494422, 0.767058, -1.25361, 1, 0.03529412, 0, 1,
-2.47163, 0.2658042, -0.5359485, 1, 0.04313726, 0, 1,
-2.444362, -1.414431, -3.225734, 1, 0.04705882, 0, 1,
-2.38597, 0.3457468, -0.4903802, 1, 0.05490196, 0, 1,
-2.356682, -0.8729931, -0.01730777, 1, 0.05882353, 0, 1,
-2.353344, 2.084002, -0.9794168, 1, 0.06666667, 0, 1,
-2.298566, -0.2856815, -2.572545, 1, 0.07058824, 0, 1,
-2.257948, 0.2885022, -2.13154, 1, 0.07843138, 0, 1,
-2.255148, -0.1122481, -1.203533, 1, 0.08235294, 0, 1,
-2.229865, 1.728425, 2.202497, 1, 0.09019608, 0, 1,
-2.217344, -1.852405, -3.437573, 1, 0.09411765, 0, 1,
-2.158271, 0.9336041, -1.651857, 1, 0.1019608, 0, 1,
-2.134923, -0.3411631, -2.085693, 1, 0.1098039, 0, 1,
-2.11818, -1.187179, -1.896897, 1, 0.1137255, 0, 1,
-2.105005, -1.326141, -1.848069, 1, 0.1215686, 0, 1,
-2.066281, -1.396063, -1.643558, 1, 0.1254902, 0, 1,
-2.047928, -2.071508, -2.215919, 1, 0.1333333, 0, 1,
-2.041399, -0.8307604, -3.92594, 1, 0.1372549, 0, 1,
-2.035896, -0.2390331, -0.670544, 1, 0.145098, 0, 1,
-1.993909, -0.4139711, -2.357679, 1, 0.1490196, 0, 1,
-1.975674, -0.3254628, -2.016719, 1, 0.1568628, 0, 1,
-1.971903, 0.4611158, -0.168883, 1, 0.1607843, 0, 1,
-1.930277, 1.04443, -0.6411446, 1, 0.1686275, 0, 1,
-1.924226, 0.3156636, -1.677987, 1, 0.172549, 0, 1,
-1.908442, -1.605189, -1.605104, 1, 0.1803922, 0, 1,
-1.860794, -0.1665716, -2.939696, 1, 0.1843137, 0, 1,
-1.851067, -0.1330788, -2.679961, 1, 0.1921569, 0, 1,
-1.8404, -0.209783, -2.776593, 1, 0.1960784, 0, 1,
-1.831348, 0.2747419, -2.144554, 1, 0.2039216, 0, 1,
-1.821997, 0.3939803, -0.8595421, 1, 0.2117647, 0, 1,
-1.77485, 0.05212111, 0.1005752, 1, 0.2156863, 0, 1,
-1.765712, 0.23642, -3.043592, 1, 0.2235294, 0, 1,
-1.764361, -1.777004, -3.670394, 1, 0.227451, 0, 1,
-1.734552, 0.1262682, -2.159134, 1, 0.2352941, 0, 1,
-1.729245, -0.2432312, -2.369972, 1, 0.2392157, 0, 1,
-1.7097, -0.2454836, -2.691875, 1, 0.2470588, 0, 1,
-1.697813, -0.8630167, -1.468787, 1, 0.2509804, 0, 1,
-1.690672, -1.477383, -1.168643, 1, 0.2588235, 0, 1,
-1.68935, 0.4186065, -0.5810431, 1, 0.2627451, 0, 1,
-1.674773, 0.9590805, -0.3031827, 1, 0.2705882, 0, 1,
-1.668302, -0.2012141, -0.6094871, 1, 0.2745098, 0, 1,
-1.66403, 0.1907714, -3.32758, 1, 0.282353, 0, 1,
-1.663435, -0.5798881, -2.129496, 1, 0.2862745, 0, 1,
-1.657998, -0.1889353, -0.7938338, 1, 0.2941177, 0, 1,
-1.653635, -0.4744627, -2.632212, 1, 0.3019608, 0, 1,
-1.647904, 1.888912, -0.8766946, 1, 0.3058824, 0, 1,
-1.645674, 0.122, -1.252665, 1, 0.3137255, 0, 1,
-1.643604, 0.5972525, -2.081139, 1, 0.3176471, 0, 1,
-1.625795, -1.030141, -1.491689, 1, 0.3254902, 0, 1,
-1.619061, 0.5067426, -2.110564, 1, 0.3294118, 0, 1,
-1.612067, 1.28142, -1.290323, 1, 0.3372549, 0, 1,
-1.611052, -0.5354081, -1.052129, 1, 0.3411765, 0, 1,
-1.586593, 0.02027921, -2.448334, 1, 0.3490196, 0, 1,
-1.581023, -0.09524789, -1.513443, 1, 0.3529412, 0, 1,
-1.577328, 0.7922291, 0.8835563, 1, 0.3607843, 0, 1,
-1.567127, -0.04463928, -0.357158, 1, 0.3647059, 0, 1,
-1.547441, 0.1953024, -0.2401199, 1, 0.372549, 0, 1,
-1.542606, -0.7298448, -3.325578, 1, 0.3764706, 0, 1,
-1.541682, -1.06936, -2.041222, 1, 0.3843137, 0, 1,
-1.519022, 2.614364, -1.585729, 1, 0.3882353, 0, 1,
-1.509081, 1.107908, -1.874252, 1, 0.3960784, 0, 1,
-1.508692, 0.4489591, -1.459335, 1, 0.4039216, 0, 1,
-1.504719, -1.571993, -2.339978, 1, 0.4078431, 0, 1,
-1.497489, -0.7790709, -1.403058, 1, 0.4156863, 0, 1,
-1.477328, -0.106176, -1.69725, 1, 0.4196078, 0, 1,
-1.471878, -1.673008, -0.6803499, 1, 0.427451, 0, 1,
-1.467962, 0.9932886, -1.606862, 1, 0.4313726, 0, 1,
-1.464964, 2.379056, -1.350151, 1, 0.4392157, 0, 1,
-1.46351, -0.3376188, -1.273817, 1, 0.4431373, 0, 1,
-1.460843, -0.528536, -2.023407, 1, 0.4509804, 0, 1,
-1.458574, 0.97658, -0.9010844, 1, 0.454902, 0, 1,
-1.438873, 1.653857, -0.7251481, 1, 0.4627451, 0, 1,
-1.436816, -0.7153807, -1.803021, 1, 0.4666667, 0, 1,
-1.436211, 0.5720487, -1.868777, 1, 0.4745098, 0, 1,
-1.432974, 0.3671598, -1.815797, 1, 0.4784314, 0, 1,
-1.429435, -0.03512906, -1.88066, 1, 0.4862745, 0, 1,
-1.427845, 2.315101, 0.759622, 1, 0.4901961, 0, 1,
-1.423736, 0.557667, -0.2093727, 1, 0.4980392, 0, 1,
-1.420292, -0.08186595, -2.044785, 1, 0.5058824, 0, 1,
-1.398332, 0.2932503, -1.327008, 1, 0.509804, 0, 1,
-1.393418, -0.4929273, -3.1882, 1, 0.5176471, 0, 1,
-1.387538, 0.9950652, -1.798197, 1, 0.5215687, 0, 1,
-1.385897, 1.350861, -0.2977887, 1, 0.5294118, 0, 1,
-1.369885, 2.506945, -0.2124468, 1, 0.5333334, 0, 1,
-1.366424, 2.027724, -2.130201, 1, 0.5411765, 0, 1,
-1.356892, -0.7438872, -1.688517, 1, 0.5450981, 0, 1,
-1.353561, 0.5428836, -1.776518, 1, 0.5529412, 0, 1,
-1.345165, -1.00368, -3.841029, 1, 0.5568628, 0, 1,
-1.344314, 0.8714616, -1.582067, 1, 0.5647059, 0, 1,
-1.343498, -0.3861124, -1.236229, 1, 0.5686275, 0, 1,
-1.339175, -0.9864477, -1.254556, 1, 0.5764706, 0, 1,
-1.334532, 0.1112833, -2.832588, 1, 0.5803922, 0, 1,
-1.330878, 1.030956, -0.9699733, 1, 0.5882353, 0, 1,
-1.330461, 1.097554, 0.03690169, 1, 0.5921569, 0, 1,
-1.320873, 0.4868444, -1.994012, 1, 0.6, 0, 1,
-1.310582, -1.905282, -3.518758, 1, 0.6078432, 0, 1,
-1.308619, 0.251349, -0.616338, 1, 0.6117647, 0, 1,
-1.306713, -1.219783, -2.884872, 1, 0.6196079, 0, 1,
-1.302872, 0.2482317, -0.1644188, 1, 0.6235294, 0, 1,
-1.292161, 0.9002715, -0.0397688, 1, 0.6313726, 0, 1,
-1.291815, 0.4374235, -1.38979, 1, 0.6352941, 0, 1,
-1.290619, 1.212487, 0.4875458, 1, 0.6431373, 0, 1,
-1.287804, -0.1357104, -0.4957793, 1, 0.6470588, 0, 1,
-1.286974, -0.4645337, 0.422076, 1, 0.654902, 0, 1,
-1.280011, -0.02670157, -1.048163, 1, 0.6588235, 0, 1,
-1.266189, -0.02240518, 0.7562376, 1, 0.6666667, 0, 1,
-1.257274, 0.8233338, -1.278149, 1, 0.6705883, 0, 1,
-1.248776, -0.709758, -2.532114, 1, 0.6784314, 0, 1,
-1.242683, -1.513039, -1.492549, 1, 0.682353, 0, 1,
-1.241133, -0.5309874, -2.147614, 1, 0.6901961, 0, 1,
-1.220487, 0.5390388, -0.1848618, 1, 0.6941177, 0, 1,
-1.215125, -0.3659196, -1.500817, 1, 0.7019608, 0, 1,
-1.21064, -0.3969906, -3.589816, 1, 0.7098039, 0, 1,
-1.206427, 0.391071, -0.09436766, 1, 0.7137255, 0, 1,
-1.205728, 0.162672, 0.116056, 1, 0.7215686, 0, 1,
-1.205475, -0.4350976, -2.509901, 1, 0.7254902, 0, 1,
-1.194442, -1.70775, -1.895335, 1, 0.7333333, 0, 1,
-1.194026, 1.740811, -0.9089442, 1, 0.7372549, 0, 1,
-1.193883, 0.3491905, 0.02807353, 1, 0.7450981, 0, 1,
-1.192651, -0.03776856, -0.275346, 1, 0.7490196, 0, 1,
-1.178518, 0.01008684, -3.241043, 1, 0.7568628, 0, 1,
-1.177376, 0.382971, -0.7537626, 1, 0.7607843, 0, 1,
-1.168929, 2.202527, -0.1638004, 1, 0.7686275, 0, 1,
-1.165892, 1.585375, -0.6562046, 1, 0.772549, 0, 1,
-1.161704, -1.187688, -1.34522, 1, 0.7803922, 0, 1,
-1.158435, 0.5463699, 0.177479, 1, 0.7843137, 0, 1,
-1.153233, 0.508587, -1.406859, 1, 0.7921569, 0, 1,
-1.151691, 0.3577248, -2.015514, 1, 0.7960784, 0, 1,
-1.149768, 1.82982, -1.231541, 1, 0.8039216, 0, 1,
-1.136272, -1.67935, -3.789397, 1, 0.8117647, 0, 1,
-1.131685, -0.8578109, -3.171273, 1, 0.8156863, 0, 1,
-1.116943, -1.087197, -3.999669, 1, 0.8235294, 0, 1,
-1.114431, 2.426705, -1.608716, 1, 0.827451, 0, 1,
-1.110187, 1.079009, -0.8932717, 1, 0.8352941, 0, 1,
-1.109677, -0.06202852, -1.202402, 1, 0.8392157, 0, 1,
-1.099317, 0.9169334, -1.397009, 1, 0.8470588, 0, 1,
-1.098961, -1.194032, -1.314599, 1, 0.8509804, 0, 1,
-1.097941, -0.6497702, -2.700731, 1, 0.8588235, 0, 1,
-1.097337, 0.400634, -2.267866, 1, 0.8627451, 0, 1,
-1.094893, -0.168739, -1.15869, 1, 0.8705882, 0, 1,
-1.094457, 0.5559778, -1.488704, 1, 0.8745098, 0, 1,
-1.091285, -0.5998974, -2.00435, 1, 0.8823529, 0, 1,
-1.089494, -0.01222775, -1.697969, 1, 0.8862745, 0, 1,
-1.085368, 0.4429148, -2.145169, 1, 0.8941177, 0, 1,
-1.08362, 0.07456572, -2.35102, 1, 0.8980392, 0, 1,
-1.081183, 0.3278756, -2.407884, 1, 0.9058824, 0, 1,
-1.079975, 0.4345668, -1.544297, 1, 0.9137255, 0, 1,
-1.076811, -0.4125941, -2.830815, 1, 0.9176471, 0, 1,
-1.075911, -0.7367445, -3.178867, 1, 0.9254902, 0, 1,
-1.075909, 0.7574861, 1.367502, 1, 0.9294118, 0, 1,
-1.074849, 2.621669, 0.02084017, 1, 0.9372549, 0, 1,
-1.073635, -0.8234546, -1.692462, 1, 0.9411765, 0, 1,
-1.059691, -0.4584213, -0.8943, 1, 0.9490196, 0, 1,
-1.055343, -1.556033, -3.478879, 1, 0.9529412, 0, 1,
-1.046447, 0.6829298, -0.6835349, 1, 0.9607843, 0, 1,
-1.045607, -0.7747827, -2.695349, 1, 0.9647059, 0, 1,
-1.041035, -0.9166679, -3.047833, 1, 0.972549, 0, 1,
-1.036363, 1.072032, -0.1529782, 1, 0.9764706, 0, 1,
-1.035774, -0.6676446, -1.678186, 1, 0.9843137, 0, 1,
-1.031488, 1.895609, -1.097725, 1, 0.9882353, 0, 1,
-1.02779, -0.04608754, -1.230198, 1, 0.9960784, 0, 1,
-1.020843, 0.3147592, -1.090318, 0.9960784, 1, 0, 1,
-1.011048, -0.6334493, -1.54273, 0.9921569, 1, 0, 1,
-0.9974383, 0.7283129, -0.3886552, 0.9843137, 1, 0, 1,
-0.9971053, 0.3138463, -2.087014, 0.9803922, 1, 0, 1,
-0.9926713, -0.8915794, -1.327511, 0.972549, 1, 0, 1,
-0.9909289, -0.2781713, 0.3937603, 0.9686275, 1, 0, 1,
-0.9894882, -0.09189217, -2.299586, 0.9607843, 1, 0, 1,
-0.9864742, 1.302445, 2.515613, 0.9568627, 1, 0, 1,
-0.9822966, -0.548732, -2.249901, 0.9490196, 1, 0, 1,
-0.9792781, -2.070116, -3.119215, 0.945098, 1, 0, 1,
-0.9781371, -0.483861, -1.027792, 0.9372549, 1, 0, 1,
-0.9774373, 0.0475959, -2.610585, 0.9333333, 1, 0, 1,
-0.9723793, 1.089481, -1.111918, 0.9254902, 1, 0, 1,
-0.9699394, -0.1801716, -1.767939, 0.9215686, 1, 0, 1,
-0.9671329, 0.01106886, -0.3594497, 0.9137255, 1, 0, 1,
-0.9634772, -0.1255889, -1.638944, 0.9098039, 1, 0, 1,
-0.9595849, 0.1977132, -1.456385, 0.9019608, 1, 0, 1,
-0.955124, -1.04543, -3.164374, 0.8941177, 1, 0, 1,
-0.9501132, -1.721408, -1.534994, 0.8901961, 1, 0, 1,
-0.9493701, -1.555124, -2.125576, 0.8823529, 1, 0, 1,
-0.9457859, 0.9994739, -0.8575799, 0.8784314, 1, 0, 1,
-0.9455646, 0.1739634, -1.565271, 0.8705882, 1, 0, 1,
-0.9256277, -0.03738586, -0.9767094, 0.8666667, 1, 0, 1,
-0.9254347, 0.3992763, -0.650431, 0.8588235, 1, 0, 1,
-0.9241543, 0.3781091, -0.6718844, 0.854902, 1, 0, 1,
-0.92037, -0.6478379, -2.155502, 0.8470588, 1, 0, 1,
-0.9178948, 1.267334, -1.238348, 0.8431373, 1, 0, 1,
-0.9167016, 1.542557, -1.377794, 0.8352941, 1, 0, 1,
-0.9142802, 0.1311422, -3.171444, 0.8313726, 1, 0, 1,
-0.9138377, -1.873058, -3.647332, 0.8235294, 1, 0, 1,
-0.9111199, -0.216881, -1.413432, 0.8196079, 1, 0, 1,
-0.9110661, -0.1710876, -1.577291, 0.8117647, 1, 0, 1,
-0.9102728, -1.205594, -0.716256, 0.8078431, 1, 0, 1,
-0.9056353, -0.8645839, -1.867427, 0.8, 1, 0, 1,
-0.9036903, 0.2856225, -2.180205, 0.7921569, 1, 0, 1,
-0.8999696, 0.6697568, -1.246547, 0.7882353, 1, 0, 1,
-0.8917137, -0.2361297, -1.52554, 0.7803922, 1, 0, 1,
-0.8900843, 0.5332065, -2.131655, 0.7764706, 1, 0, 1,
-0.8882993, -1.251758, -3.868173, 0.7686275, 1, 0, 1,
-0.8839958, 0.1751758, -2.12621, 0.7647059, 1, 0, 1,
-0.8822499, 0.7206718, -1.273099, 0.7568628, 1, 0, 1,
-0.8739488, -0.3429574, 0.2386601, 0.7529412, 1, 0, 1,
-0.8712201, 2.248124, 1.057866, 0.7450981, 1, 0, 1,
-0.8686628, -0.6993526, -1.025214, 0.7411765, 1, 0, 1,
-0.8676566, -0.4690541, -2.147849, 0.7333333, 1, 0, 1,
-0.8639501, 0.5864894, -1.248477, 0.7294118, 1, 0, 1,
-0.857957, 0.003115645, -0.480998, 0.7215686, 1, 0, 1,
-0.8554133, -0.2504044, -0.2300523, 0.7176471, 1, 0, 1,
-0.8545344, 2.803831, 0.4908587, 0.7098039, 1, 0, 1,
-0.8535908, -0.4248143, -2.04083, 0.7058824, 1, 0, 1,
-0.8471983, -0.7864184, -2.605501, 0.6980392, 1, 0, 1,
-0.8469041, -0.722649, -3.139038, 0.6901961, 1, 0, 1,
-0.8353208, 0.08548272, -0.8521864, 0.6862745, 1, 0, 1,
-0.8276132, 0.3443003, -0.9753803, 0.6784314, 1, 0, 1,
-0.8229997, 0.2091831, -1.397452, 0.6745098, 1, 0, 1,
-0.8224979, 0.6503836, -1.361292, 0.6666667, 1, 0, 1,
-0.8002735, 0.578454, -0.05927243, 0.6627451, 1, 0, 1,
-0.7991273, -0.07798808, -1.921393, 0.654902, 1, 0, 1,
-0.7968853, -1.326407, -2.785604, 0.6509804, 1, 0, 1,
-0.7955123, 1.542594, -0.6367725, 0.6431373, 1, 0, 1,
-0.794659, -0.5091921, -2.389143, 0.6392157, 1, 0, 1,
-0.7861093, -0.06850959, -2.789699, 0.6313726, 1, 0, 1,
-0.7853066, -0.2185841, -0.7707854, 0.627451, 1, 0, 1,
-0.7849271, -0.6593654, -2.76914, 0.6196079, 1, 0, 1,
-0.7809492, 0.2986412, -2.783958, 0.6156863, 1, 0, 1,
-0.7791654, -2.379428, -2.145691, 0.6078432, 1, 0, 1,
-0.7775115, 0.4576371, 1.219928, 0.6039216, 1, 0, 1,
-0.771015, -0.9524891, -2.818228, 0.5960785, 1, 0, 1,
-0.7599236, 1.012411, -0.04047839, 0.5882353, 1, 0, 1,
-0.7597717, -0.6239788, -3.488295, 0.5843138, 1, 0, 1,
-0.7534284, -1.044957, -2.442353, 0.5764706, 1, 0, 1,
-0.7506123, -0.0434613, -1.609326, 0.572549, 1, 0, 1,
-0.7496951, 0.1544716, -2.219645, 0.5647059, 1, 0, 1,
-0.7452549, 1.001651, -1.165621, 0.5607843, 1, 0, 1,
-0.742357, 1.590514, -1.750231, 0.5529412, 1, 0, 1,
-0.7365183, 0.3115813, -1.405099, 0.5490196, 1, 0, 1,
-0.732991, 0.6383034, -1.828115, 0.5411765, 1, 0, 1,
-0.7239413, -0.1977083, -1.960261, 0.5372549, 1, 0, 1,
-0.7224144, -0.1793478, -1.466095, 0.5294118, 1, 0, 1,
-0.7222996, 0.5259344, -1.291602, 0.5254902, 1, 0, 1,
-0.7154925, 2.070048, 0.1811577, 0.5176471, 1, 0, 1,
-0.7143183, 0.603281, 0.09749169, 0.5137255, 1, 0, 1,
-0.7137183, 0.1494291, -1.036477, 0.5058824, 1, 0, 1,
-0.7130544, 0.2644418, -0.7689897, 0.5019608, 1, 0, 1,
-0.7124594, 1.244314, -0.9389988, 0.4941176, 1, 0, 1,
-0.71047, -0.6500179, -4.70977, 0.4862745, 1, 0, 1,
-0.7085363, -0.47911, -3.369736, 0.4823529, 1, 0, 1,
-0.6991307, 0.428805, -1.439705, 0.4745098, 1, 0, 1,
-0.6973937, 0.3103707, -2.295068, 0.4705882, 1, 0, 1,
-0.6929956, -3.093907, -2.721332, 0.4627451, 1, 0, 1,
-0.6915256, -1.156612, -2.857468, 0.4588235, 1, 0, 1,
-0.6892099, -1.497318, 0.1448842, 0.4509804, 1, 0, 1,
-0.6874614, 1.771883, 0.8859965, 0.4470588, 1, 0, 1,
-0.6853074, -1.762094, -3.043003, 0.4392157, 1, 0, 1,
-0.6842359, 0.9997829, -1.135217, 0.4352941, 1, 0, 1,
-0.6832653, 0.6503628, -2.419497, 0.427451, 1, 0, 1,
-0.6828497, 0.1957097, -2.018435, 0.4235294, 1, 0, 1,
-0.6737074, 1.404732, 0.686163, 0.4156863, 1, 0, 1,
-0.6703283, 0.3958398, -1.36667, 0.4117647, 1, 0, 1,
-0.6682875, -0.5492253, -2.855904, 0.4039216, 1, 0, 1,
-0.6653225, -1.037641, -3.156492, 0.3960784, 1, 0, 1,
-0.6612276, 1.840988, 0.08197793, 0.3921569, 1, 0, 1,
-0.6591732, 0.08880236, -0.4356738, 0.3843137, 1, 0, 1,
-0.6588992, 0.7937564, -0.6763449, 0.3803922, 1, 0, 1,
-0.6512371, -1.215895, -3.70484, 0.372549, 1, 0, 1,
-0.6452551, -0.3864354, -2.148828, 0.3686275, 1, 0, 1,
-0.6431851, 0.1288799, -1.456061, 0.3607843, 1, 0, 1,
-0.6388351, 0.5926777, -0.107465, 0.3568628, 1, 0, 1,
-0.634033, 0.2425499, -2.174809, 0.3490196, 1, 0, 1,
-0.6330699, -0.02127115, -1.247581, 0.345098, 1, 0, 1,
-0.6307544, 0.9043405, -1.0827, 0.3372549, 1, 0, 1,
-0.6212841, 1.037751, -1.11218, 0.3333333, 1, 0, 1,
-0.6153364, 0.5701228, -1.919809, 0.3254902, 1, 0, 1,
-0.6121569, -0.854407, -4.775449, 0.3215686, 1, 0, 1,
-0.6099151, 1.326121, 0.07527902, 0.3137255, 1, 0, 1,
-0.6029875, 0.1464726, -1.630518, 0.3098039, 1, 0, 1,
-0.6013824, -0.28013, -1.392852, 0.3019608, 1, 0, 1,
-0.5988562, -1.417251, -1.630962, 0.2941177, 1, 0, 1,
-0.5956913, 0.7935611, -0.2814518, 0.2901961, 1, 0, 1,
-0.5951008, -0.1229557, -2.276452, 0.282353, 1, 0, 1,
-0.5936123, -1.105968, -1.861257, 0.2784314, 1, 0, 1,
-0.5902777, 0.8551265, 0.3148746, 0.2705882, 1, 0, 1,
-0.5901369, 0.02598955, 0.5341496, 0.2666667, 1, 0, 1,
-0.5884996, -0.6905669, -2.262052, 0.2588235, 1, 0, 1,
-0.5869363, -0.30488, -2.064734, 0.254902, 1, 0, 1,
-0.5850726, -0.0006359208, -1.809916, 0.2470588, 1, 0, 1,
-0.5827945, 0.2728947, -1.325041, 0.2431373, 1, 0, 1,
-0.5824528, -1.87261, -3.029644, 0.2352941, 1, 0, 1,
-0.5813165, -0.7546279, -2.202985, 0.2313726, 1, 0, 1,
-0.5795959, 1.558402, -1.049985, 0.2235294, 1, 0, 1,
-0.572478, 1.22279, -0.2661247, 0.2196078, 1, 0, 1,
-0.5687981, 2.864318, 0.9775807, 0.2117647, 1, 0, 1,
-0.567606, 0.2123104, -0.864256, 0.2078431, 1, 0, 1,
-0.5665985, -0.283811, -3.052701, 0.2, 1, 0, 1,
-0.566237, 0.02069302, -2.13435, 0.1921569, 1, 0, 1,
-0.56212, -0.3431825, -1.517738, 0.1882353, 1, 0, 1,
-0.5615532, 0.08393474, -2.515615, 0.1803922, 1, 0, 1,
-0.5583681, -0.7437763, -4.360542, 0.1764706, 1, 0, 1,
-0.5556315, -0.2383823, -1.685483, 0.1686275, 1, 0, 1,
-0.5555371, -1.422951, -4.040914, 0.1647059, 1, 0, 1,
-0.5516218, 0.8922949, 0.5155864, 0.1568628, 1, 0, 1,
-0.5507934, -1.139152, -3.566244, 0.1529412, 1, 0, 1,
-0.5504022, -0.9394153, -4.609197, 0.145098, 1, 0, 1,
-0.5439456, 1.029675, -0.1397262, 0.1411765, 1, 0, 1,
-0.5410285, 1.511461, 0.6427151, 0.1333333, 1, 0, 1,
-0.5384182, 0.05773113, -0.2239784, 0.1294118, 1, 0, 1,
-0.5377262, -1.636817, -0.7080067, 0.1215686, 1, 0, 1,
-0.535673, 1.126066, -0.6246547, 0.1176471, 1, 0, 1,
-0.5278651, 0.2920539, -2.208686, 0.1098039, 1, 0, 1,
-0.5260418, 0.4373946, -2.500871, 0.1058824, 1, 0, 1,
-0.5188144, -0.8407259, -2.096962, 0.09803922, 1, 0, 1,
-0.517801, -0.4501008, -1.721527, 0.09019608, 1, 0, 1,
-0.5167726, -0.1296449, -1.779263, 0.08627451, 1, 0, 1,
-0.5150288, 0.4614957, 0.05329374, 0.07843138, 1, 0, 1,
-0.5139804, -1.625338, -1.563092, 0.07450981, 1, 0, 1,
-0.5110134, -0.2228812, -1.728024, 0.06666667, 1, 0, 1,
-0.5104647, 0.5245105, -1.312105, 0.0627451, 1, 0, 1,
-0.5090832, -0.7227049, -2.38035, 0.05490196, 1, 0, 1,
-0.5077612, -0.5681052, -4.093699, 0.05098039, 1, 0, 1,
-0.5072519, 0.8890597, 0.1373084, 0.04313726, 1, 0, 1,
-0.5032174, -0.3689672, -3.908827, 0.03921569, 1, 0, 1,
-0.5003406, 0.2989361, -0.3658776, 0.03137255, 1, 0, 1,
-0.4997441, 1.208158, -1.863673, 0.02745098, 1, 0, 1,
-0.4878402, -1.350365, -3.104081, 0.01960784, 1, 0, 1,
-0.4864489, -1.057642, -3.12657, 0.01568628, 1, 0, 1,
-0.4858503, 0.09130922, -0.3732055, 0.007843138, 1, 0, 1,
-0.4841515, 1.029793, -2.162291, 0.003921569, 1, 0, 1,
-0.4829172, -2.339224, -2.677121, 0, 1, 0.003921569, 1,
-0.4826492, -1.111254, -2.509167, 0, 1, 0.01176471, 1,
-0.4814873, 1.096224, 0.3752575, 0, 1, 0.01568628, 1,
-0.4799265, -0.913183, -2.305579, 0, 1, 0.02352941, 1,
-0.4780842, -1.355593, -3.94842, 0, 1, 0.02745098, 1,
-0.4774086, 0.6115291, -0.8377557, 0, 1, 0.03529412, 1,
-0.4752133, -0.9035442, -0.878967, 0, 1, 0.03921569, 1,
-0.4703356, 0.4546628, -3.503444, 0, 1, 0.04705882, 1,
-0.4696682, 0.7772288, -1.985136, 0, 1, 0.05098039, 1,
-0.4655832, 0.7926993, 1.091342, 0, 1, 0.05882353, 1,
-0.4632071, 0.6027815, -0.4229752, 0, 1, 0.0627451, 1,
-0.4600927, 0.6769771, -1.877186, 0, 1, 0.07058824, 1,
-0.4588008, 1.560688, -0.4599065, 0, 1, 0.07450981, 1,
-0.4587962, -0.8965791, -2.545197, 0, 1, 0.08235294, 1,
-0.4569583, -1.59693, -3.307503, 0, 1, 0.08627451, 1,
-0.4560966, -0.1220959, -3.227488, 0, 1, 0.09411765, 1,
-0.455561, -0.005144365, -0.4005869, 0, 1, 0.1019608, 1,
-0.4430224, 0.08396542, -3.080826, 0, 1, 0.1058824, 1,
-0.4184339, -0.1266685, -1.469679, 0, 1, 0.1137255, 1,
-0.4147022, 2.052769, 0.7976741, 0, 1, 0.1176471, 1,
-0.4030734, -1.583641, -3.346852, 0, 1, 0.1254902, 1,
-0.4008459, -1.455833, -2.824018, 0, 1, 0.1294118, 1,
-0.3981127, 1.248609, -1.413876, 0, 1, 0.1372549, 1,
-0.3875433, -0.2049835, -3.790703, 0, 1, 0.1411765, 1,
-0.3832788, 1.247247, 0.06075909, 0, 1, 0.1490196, 1,
-0.3778455, -0.2151149, -0.5387179, 0, 1, 0.1529412, 1,
-0.3725004, 0.4812922, -1.160453, 0, 1, 0.1607843, 1,
-0.371435, -0.7012638, -1.705948, 0, 1, 0.1647059, 1,
-0.3583813, 0.1366543, -2.272818, 0, 1, 0.172549, 1,
-0.3563032, -0.9693717, -3.526408, 0, 1, 0.1764706, 1,
-0.3528198, 0.7737826, -1.355, 0, 1, 0.1843137, 1,
-0.3447575, 1.046883, -0.6991041, 0, 1, 0.1882353, 1,
-0.3382145, -0.8377839, -2.987853, 0, 1, 0.1960784, 1,
-0.3365015, 1.166099, 0.7830764, 0, 1, 0.2039216, 1,
-0.3257696, -0.3648885, -3.771621, 0, 1, 0.2078431, 1,
-0.323902, -2.202414, -4.6304, 0, 1, 0.2156863, 1,
-0.3238519, -0.9083779, -3.478345, 0, 1, 0.2196078, 1,
-0.3226825, -1.30283, -3.591496, 0, 1, 0.227451, 1,
-0.3215468, 0.1786044, 0.04662869, 0, 1, 0.2313726, 1,
-0.3203457, -0.3118745, -1.816796, 0, 1, 0.2392157, 1,
-0.3147598, 0.2321233, -2.086856, 0, 1, 0.2431373, 1,
-0.3135566, 0.3360602, 0.6153587, 0, 1, 0.2509804, 1,
-0.3126113, -1.034244, -3.139699, 0, 1, 0.254902, 1,
-0.3109162, 0.4634795, -2.631309, 0, 1, 0.2627451, 1,
-0.3106294, -0.3417985, -2.240152, 0, 1, 0.2666667, 1,
-0.3080124, -0.6351626, -3.251893, 0, 1, 0.2745098, 1,
-0.3052894, -0.8389055, -1.753808, 0, 1, 0.2784314, 1,
-0.2993067, -0.8651034, -2.401999, 0, 1, 0.2862745, 1,
-0.2955195, 0.8312802, 0.1762723, 0, 1, 0.2901961, 1,
-0.295328, -1.204799, -1.04235, 0, 1, 0.2980392, 1,
-0.2921397, 2.440537, 0.9146165, 0, 1, 0.3058824, 1,
-0.2903167, -0.312734, -3.035154, 0, 1, 0.3098039, 1,
-0.2901577, -0.7695165, -1.072654, 0, 1, 0.3176471, 1,
-0.2876284, -2.275407, -2.993032, 0, 1, 0.3215686, 1,
-0.2858358, 0.3838347, -1.057915, 0, 1, 0.3294118, 1,
-0.2839437, -0.4407584, -4.321403, 0, 1, 0.3333333, 1,
-0.2825336, 0.9496924, 0.1039082, 0, 1, 0.3411765, 1,
-0.2824408, 0.7309667, -1.561333, 0, 1, 0.345098, 1,
-0.2820337, 0.5738804, -0.3104901, 0, 1, 0.3529412, 1,
-0.2810627, 0.7509342, 0.8776648, 0, 1, 0.3568628, 1,
-0.2793452, -0.8764635, -2.289181, 0, 1, 0.3647059, 1,
-0.2749805, 1.789167, 1.023943, 0, 1, 0.3686275, 1,
-0.2690441, -0.04874417, -1.698986, 0, 1, 0.3764706, 1,
-0.2681471, 1.448016, -1.472039, 0, 1, 0.3803922, 1,
-0.2663995, -0.6547199, -3.406577, 0, 1, 0.3882353, 1,
-0.2662284, -1.302127, -2.012044, 0, 1, 0.3921569, 1,
-0.2609381, 0.9149348, -0.8727484, 0, 1, 0.4, 1,
-0.2593108, 2.090262, -0.7358662, 0, 1, 0.4078431, 1,
-0.2586016, 0.9318205, 0.6710603, 0, 1, 0.4117647, 1,
-0.2493196, -0.4222552, -2.97982, 0, 1, 0.4196078, 1,
-0.2482203, -0.6913848, -2.589681, 0, 1, 0.4235294, 1,
-0.2471405, -1.487294, -1.552108, 0, 1, 0.4313726, 1,
-0.2455292, -0.9794795, -2.231029, 0, 1, 0.4352941, 1,
-0.2431123, -0.2939367, -1.556414, 0, 1, 0.4431373, 1,
-0.2419414, -1.083465, -1.676454, 0, 1, 0.4470588, 1,
-0.239789, -1.745273, -2.368992, 0, 1, 0.454902, 1,
-0.2308843, 2.107618, -1.025149, 0, 1, 0.4588235, 1,
-0.228446, 0.6460309, -0.2382854, 0, 1, 0.4666667, 1,
-0.2267889, 0.2064252, -0.1262516, 0, 1, 0.4705882, 1,
-0.2264727, -1.451933, -3.569, 0, 1, 0.4784314, 1,
-0.2227796, -0.724294, -0.7104014, 0, 1, 0.4823529, 1,
-0.2183196, 1.699341, -1.499323, 0, 1, 0.4901961, 1,
-0.2170584, 0.8250023, -0.9854109, 0, 1, 0.4941176, 1,
-0.2145646, -0.08015799, -0.5342581, 0, 1, 0.5019608, 1,
-0.213564, -2.280923, -3.918693, 0, 1, 0.509804, 1,
-0.2125217, 1.515694, -0.3348857, 0, 1, 0.5137255, 1,
-0.2117192, 0.3209039, 0.3221823, 0, 1, 0.5215687, 1,
-0.2070576, -0.296022, -3.58995, 0, 1, 0.5254902, 1,
-0.2044531, 1.319787, -0.6479314, 0, 1, 0.5333334, 1,
-0.2043118, 1.728593, 1.217792, 0, 1, 0.5372549, 1,
-0.2031911, -0.9451419, -2.146388, 0, 1, 0.5450981, 1,
-0.2008219, 1.725246, 0.2918515, 0, 1, 0.5490196, 1,
-0.2006721, 0.5857724, -1.104938, 0, 1, 0.5568628, 1,
-0.2000605, 0.3978607, 0.9949296, 0, 1, 0.5607843, 1,
-0.1994987, 0.8312208, -0.1969501, 0, 1, 0.5686275, 1,
-0.1967138, -1.302104, -2.592302, 0, 1, 0.572549, 1,
-0.1956721, -0.1257186, 0.9125028, 0, 1, 0.5803922, 1,
-0.1951613, -2.60832, -2.307058, 0, 1, 0.5843138, 1,
-0.1948622, -0.69282, -2.40066, 0, 1, 0.5921569, 1,
-0.1893768, 2.081483, -1.370145, 0, 1, 0.5960785, 1,
-0.184767, 0.9409203, -1.045594, 0, 1, 0.6039216, 1,
-0.1838037, -1.884213, -2.500128, 0, 1, 0.6117647, 1,
-0.181957, 0.03662468, 0.1566471, 0, 1, 0.6156863, 1,
-0.1784856, -0.8551452, -4.752334, 0, 1, 0.6235294, 1,
-0.1764866, -0.04191758, -3.015255, 0, 1, 0.627451, 1,
-0.1753408, 0.8162208, 0.3491319, 0, 1, 0.6352941, 1,
-0.1745001, -0.2615544, -3.508054, 0, 1, 0.6392157, 1,
-0.1731248, 0.6530533, -2.910534, 0, 1, 0.6470588, 1,
-0.169861, 0.8049926, -0.2206538, 0, 1, 0.6509804, 1,
-0.1627048, -0.04884553, -0.7260203, 0, 1, 0.6588235, 1,
-0.157178, -0.2750958, -3.371907, 0, 1, 0.6627451, 1,
-0.1555001, 0.3846145, 0.4714718, 0, 1, 0.6705883, 1,
-0.1544492, 0.383477, -2.264174, 0, 1, 0.6745098, 1,
-0.153822, 0.0416302, -0.4925986, 0, 1, 0.682353, 1,
-0.1533878, -0.2834535, -1.83868, 0, 1, 0.6862745, 1,
-0.1518281, -0.2236571, -2.804654, 0, 1, 0.6941177, 1,
-0.1489991, 1.412592, -0.1852829, 0, 1, 0.7019608, 1,
-0.1468999, 0.9196391, 0.6436715, 0, 1, 0.7058824, 1,
-0.1452025, 2.113875, -1.73204, 0, 1, 0.7137255, 1,
-0.1446323, -1.484357, -2.049249, 0, 1, 0.7176471, 1,
-0.1439182, -0.3665472, -2.358647, 0, 1, 0.7254902, 1,
-0.1438435, -1.030568, -4.132998, 0, 1, 0.7294118, 1,
-0.1431309, -0.8331324, -1.966259, 0, 1, 0.7372549, 1,
-0.1425837, 0.1122457, -0.01020248, 0, 1, 0.7411765, 1,
-0.1356372, 0.9988464, -0.3230717, 0, 1, 0.7490196, 1,
-0.1322366, -0.2549349, -3.43308, 0, 1, 0.7529412, 1,
-0.1313307, -0.2899524, -1.21952, 0, 1, 0.7607843, 1,
-0.1295529, 0.8588568, 0.6251206, 0, 1, 0.7647059, 1,
-0.1266807, 1.698853, -1.380224, 0, 1, 0.772549, 1,
-0.1262573, 0.07261083, -1.143101, 0, 1, 0.7764706, 1,
-0.1228693, 1.25275, -1.623669, 0, 1, 0.7843137, 1,
-0.1224111, -0.497003, -2.970661, 0, 1, 0.7882353, 1,
-0.1211923, 0.5311016, -0.5771501, 0, 1, 0.7960784, 1,
-0.1204456, 1.764384, 0.08992659, 0, 1, 0.8039216, 1,
-0.1174409, 1.581647, 0.2893982, 0, 1, 0.8078431, 1,
-0.1174041, -1.231818, -2.90407, 0, 1, 0.8156863, 1,
-0.1149203, -0.7523553, -4.127499, 0, 1, 0.8196079, 1,
-0.11378, 0.8317412, -0.7530649, 0, 1, 0.827451, 1,
-0.1133698, -0.2335562, -1.603914, 0, 1, 0.8313726, 1,
-0.1100583, -0.4588448, -2.616419, 0, 1, 0.8392157, 1,
-0.1059339, 0.2012712, -1.655171, 0, 1, 0.8431373, 1,
-0.09990547, 1.20673, 0.720526, 0, 1, 0.8509804, 1,
-0.09447746, -0.7829176, -2.661191, 0, 1, 0.854902, 1,
-0.09372598, 0.5596246, -0.7427693, 0, 1, 0.8627451, 1,
-0.09274132, 0.7584234, 1.53727, 0, 1, 0.8666667, 1,
-0.09266439, 0.09317575, -2.727998, 0, 1, 0.8745098, 1,
-0.08842838, -0.9119342, -1.473049, 0, 1, 0.8784314, 1,
-0.08753921, -0.4196109, -3.756159, 0, 1, 0.8862745, 1,
-0.0839505, 0.1525386, -0.2135608, 0, 1, 0.8901961, 1,
-0.08241227, -0.1638749, -2.673747, 0, 1, 0.8980392, 1,
-0.08179114, 0.2512758, -1.232899, 0, 1, 0.9058824, 1,
-0.08067778, -0.4754944, -3.109729, 0, 1, 0.9098039, 1,
-0.07770591, 0.7907909, -2.105322, 0, 1, 0.9176471, 1,
-0.07365706, -0.009323739, -0.6627834, 0, 1, 0.9215686, 1,
-0.06769663, -0.977708, -2.441743, 0, 1, 0.9294118, 1,
-0.06726383, -0.9421356, -2.573334, 0, 1, 0.9333333, 1,
-0.0663496, 1.168186, -0.9480479, 0, 1, 0.9411765, 1,
-0.06334801, -1.265783, -3.416624, 0, 1, 0.945098, 1,
-0.0554059, -1.438704, -2.39649, 0, 1, 0.9529412, 1,
-0.05438428, -0.7836367, -1.448315, 0, 1, 0.9568627, 1,
-0.05402562, 0.1130913, -1.681921, 0, 1, 0.9647059, 1,
-0.05060086, -0.9794846, -3.069362, 0, 1, 0.9686275, 1,
-0.05032398, 0.4406249, 1.495857, 0, 1, 0.9764706, 1,
-0.04984013, -0.7275435, -0.9829723, 0, 1, 0.9803922, 1,
-0.04898054, 2.332597, -1.850692, 0, 1, 0.9882353, 1,
-0.0487612, -0.6588157, -3.501453, 0, 1, 0.9921569, 1,
-0.04745192, 0.9754081, 0.8355844, 0, 1, 1, 1,
-0.04220466, -0.8043109, -1.569183, 0, 0.9921569, 1, 1,
-0.04076852, 2.23208, 0.3285871, 0, 0.9882353, 1, 1,
-0.04001853, 0.113122, -1.50679, 0, 0.9803922, 1, 1,
-0.03973491, 1.042458, 1.61936, 0, 0.9764706, 1, 1,
-0.03631939, 0.3302651, 1.142766, 0, 0.9686275, 1, 1,
-0.03369815, 2.076555, -0.7459257, 0, 0.9647059, 1, 1,
-0.02603379, -0.3518658, -3.635234, 0, 0.9568627, 1, 1,
-0.02418676, 1.238904, -0.9422797, 0, 0.9529412, 1, 1,
-0.01832437, 2.106926, 1.527586, 0, 0.945098, 1, 1,
-0.01715881, 0.958515, 1.589768, 0, 0.9411765, 1, 1,
-0.0160276, 0.6480362, -0.06882984, 0, 0.9333333, 1, 1,
-0.01441083, -1.885354, -4.035899, 0, 0.9294118, 1, 1,
-0.01362318, -0.6856654, -3.149379, 0, 0.9215686, 1, 1,
-0.01165491, 2.950638, -0.1477454, 0, 0.9176471, 1, 1,
-0.00835913, -1.910718, -2.451468, 0, 0.9098039, 1, 1,
-0.00672203, -1.599322, -3.947489, 0, 0.9058824, 1, 1,
-0.005147461, -0.5308235, -4.149168, 0, 0.8980392, 1, 1,
-0.004871419, 0.2258784, 0.418103, 0, 0.8901961, 1, 1,
-0.002929881, 2.350878, 0.3103176, 0, 0.8862745, 1, 1,
-0.002073203, -1.345532, -3.017863, 0, 0.8784314, 1, 1,
-0.001732607, 1.202996, -0.2436158, 0, 0.8745098, 1, 1,
0.0006535433, 0.7228038, 0.004639113, 0, 0.8666667, 1, 1,
0.001056532, 1.268233, -0.5712304, 0, 0.8627451, 1, 1,
0.00758854, 0.2467115, 0.6422344, 0, 0.854902, 1, 1,
0.01162925, 0.3275378, 0.1825869, 0, 0.8509804, 1, 1,
0.01928963, -0.454437, 4.270609, 0, 0.8431373, 1, 1,
0.02231251, -0.7886992, 3.940361, 0, 0.8392157, 1, 1,
0.02490576, 0.7956364, 0.2186791, 0, 0.8313726, 1, 1,
0.02575433, 1.65036, -1.899133, 0, 0.827451, 1, 1,
0.03032546, -0.01485746, 3.369486, 0, 0.8196079, 1, 1,
0.03169339, 0.009622568, -0.9262307, 0, 0.8156863, 1, 1,
0.03362586, -0.0703662, 4.716697, 0, 0.8078431, 1, 1,
0.0393438, 1.356317, -0.4982257, 0, 0.8039216, 1, 1,
0.04293201, -0.7336731, 0.8366463, 0, 0.7960784, 1, 1,
0.04354205, -0.2940882, 5.105609, 0, 0.7882353, 1, 1,
0.04438875, 0.4570556, 1.428032, 0, 0.7843137, 1, 1,
0.0459385, -1.235653, 4.703427, 0, 0.7764706, 1, 1,
0.05470518, -1.081709, 2.70015, 0, 0.772549, 1, 1,
0.05516326, 0.2727919, -0.5925288, 0, 0.7647059, 1, 1,
0.05710835, 0.6335659, -0.1364486, 0, 0.7607843, 1, 1,
0.05727604, -0.5674855, 4.16884, 0, 0.7529412, 1, 1,
0.06262597, -0.4765103, 2.362399, 0, 0.7490196, 1, 1,
0.06396859, 1.336182, 0.4521064, 0, 0.7411765, 1, 1,
0.07319741, 0.06585214, 1.222901, 0, 0.7372549, 1, 1,
0.0743934, 1.003043, 0.7197129, 0, 0.7294118, 1, 1,
0.07598514, -1.434536, 4.034974, 0, 0.7254902, 1, 1,
0.07704917, 0.6461369, -0.8255181, 0, 0.7176471, 1, 1,
0.07999144, 1.165241, 0.1743978, 0, 0.7137255, 1, 1,
0.08143515, 1.121487, -0.1410429, 0, 0.7058824, 1, 1,
0.08381035, 1.190566, -0.8639213, 0, 0.6980392, 1, 1,
0.08493164, 1.351539, -1.987373, 0, 0.6941177, 1, 1,
0.09142614, 1.01077, -0.3782538, 0, 0.6862745, 1, 1,
0.09388289, -0.06364805, 1.594117, 0, 0.682353, 1, 1,
0.1000741, -0.2862625, 2.059696, 0, 0.6745098, 1, 1,
0.100593, 0.3318446, -1.274123, 0, 0.6705883, 1, 1,
0.1015574, 0.1294303, 1.465753, 0, 0.6627451, 1, 1,
0.102008, -1.325881, 2.135005, 0, 0.6588235, 1, 1,
0.1035126, -1.628016, 0.5157255, 0, 0.6509804, 1, 1,
0.1043883, 0.03980662, -0.3570186, 0, 0.6470588, 1, 1,
0.1096914, 0.1633702, -0.008388944, 0, 0.6392157, 1, 1,
0.1158281, -0.9292582, 5.025513, 0, 0.6352941, 1, 1,
0.1166156, 2.082471, -1.178274, 0, 0.627451, 1, 1,
0.1260645, -0.50066, 2.200546, 0, 0.6235294, 1, 1,
0.1289281, 0.3122526, 1.357204, 0, 0.6156863, 1, 1,
0.1366343, 0.1729661, -0.2084602, 0, 0.6117647, 1, 1,
0.137921, -0.8244528, 2.060585, 0, 0.6039216, 1, 1,
0.1379298, 0.6638367, -1.101028, 0, 0.5960785, 1, 1,
0.1391339, 0.3136663, 2.522907, 0, 0.5921569, 1, 1,
0.1496941, 0.7382571, 1.759016, 0, 0.5843138, 1, 1,
0.1500806, -0.0104158, 0.9301508, 0, 0.5803922, 1, 1,
0.1500819, 1.05032, -1.669474, 0, 0.572549, 1, 1,
0.1555537, 1.781185, 0.03650472, 0, 0.5686275, 1, 1,
0.1564428, -0.9873421, 1.775155, 0, 0.5607843, 1, 1,
0.1621211, -0.7735794, 1.215421, 0, 0.5568628, 1, 1,
0.1625711, -0.730542, 2.99941, 0, 0.5490196, 1, 1,
0.1633631, -0.2810953, 2.163095, 0, 0.5450981, 1, 1,
0.1672417, 0.51982, -0.07300493, 0, 0.5372549, 1, 1,
0.1714491, 0.8720863, 1.847573, 0, 0.5333334, 1, 1,
0.1727738, 0.5557786, -0.5116276, 0, 0.5254902, 1, 1,
0.1741759, -0.5742696, 2.14114, 0, 0.5215687, 1, 1,
0.1743009, -0.6075712, 2.569303, 0, 0.5137255, 1, 1,
0.1780539, 0.5260036, 0.1679995, 0, 0.509804, 1, 1,
0.1787928, 0.06560852, 1.434305, 0, 0.5019608, 1, 1,
0.1792736, -0.5785642, 3.476913, 0, 0.4941176, 1, 1,
0.1811249, -0.6693308, 2.146696, 0, 0.4901961, 1, 1,
0.1842901, 1.018452, -0.4003493, 0, 0.4823529, 1, 1,
0.1915386, -1.208033, 3.307048, 0, 0.4784314, 1, 1,
0.1921341, 1.191547, 0.2083185, 0, 0.4705882, 1, 1,
0.203201, -0.4195834, 2.553698, 0, 0.4666667, 1, 1,
0.2064581, 0.2871517, 1.4463, 0, 0.4588235, 1, 1,
0.2087424, 0.4241184, -0.3521609, 0, 0.454902, 1, 1,
0.2113022, -0.1540346, 3.297905, 0, 0.4470588, 1, 1,
0.2126974, 1.091251, 0.8727095, 0, 0.4431373, 1, 1,
0.213294, 0.2600828, 1.676412, 0, 0.4352941, 1, 1,
0.2217364, -0.4872344, 3.010545, 0, 0.4313726, 1, 1,
0.2221172, 0.3165288, 1.716312, 0, 0.4235294, 1, 1,
0.2239256, 0.7854493, 1.174427, 0, 0.4196078, 1, 1,
0.2280945, -0.003550597, 0.1414173, 0, 0.4117647, 1, 1,
0.2338085, -1.963181, 3.450848, 0, 0.4078431, 1, 1,
0.2350518, -1.214068, 3.868749, 0, 0.4, 1, 1,
0.2354827, 1.935618, -1.697243, 0, 0.3921569, 1, 1,
0.2401933, -0.2611777, 2.507445, 0, 0.3882353, 1, 1,
0.2430959, -2.524618, 1.969091, 0, 0.3803922, 1, 1,
0.2457929, -0.2401958, 3.776074, 0, 0.3764706, 1, 1,
0.2468875, 0.3207974, 1.590623, 0, 0.3686275, 1, 1,
0.2483715, -1.196267, 1.88739, 0, 0.3647059, 1, 1,
0.2490553, -0.6603283, 2.624964, 0, 0.3568628, 1, 1,
0.2507431, -0.6367565, 2.810802, 0, 0.3529412, 1, 1,
0.2587218, 0.333915, 1.315956, 0, 0.345098, 1, 1,
0.2587445, 0.9514349, 0.4169138, 0, 0.3411765, 1, 1,
0.2665314, 0.1131804, 0.5287294, 0, 0.3333333, 1, 1,
0.2696098, 0.3527054, 0.2226262, 0, 0.3294118, 1, 1,
0.2703114, 1.845456, 0.2351321, 0, 0.3215686, 1, 1,
0.2741758, 1.055612, 0.5817403, 0, 0.3176471, 1, 1,
0.2750371, 0.6227686, 1.631475, 0, 0.3098039, 1, 1,
0.2810131, -0.7606126, 4.139536, 0, 0.3058824, 1, 1,
0.289926, -0.6015424, 1.256734, 0, 0.2980392, 1, 1,
0.2915431, -0.2577071, 2.506836, 0, 0.2901961, 1, 1,
0.2928582, 0.8187762, 1.808783, 0, 0.2862745, 1, 1,
0.2939989, -0.4173913, 2.121667, 0, 0.2784314, 1, 1,
0.2951015, 2.115108, -0.9023494, 0, 0.2745098, 1, 1,
0.3018183, -0.8492206, 1.154704, 0, 0.2666667, 1, 1,
0.3022084, 1.098927, -0.8194787, 0, 0.2627451, 1, 1,
0.3086731, -1.177024, 5.347854, 0, 0.254902, 1, 1,
0.3138297, -0.5131947, 1.221236, 0, 0.2509804, 1, 1,
0.3185888, 0.2926225, 1.40937, 0, 0.2431373, 1, 1,
0.3225198, -1.030116, 3.727273, 0, 0.2392157, 1, 1,
0.3239548, -1.106631, 0.2176665, 0, 0.2313726, 1, 1,
0.3316316, 0.8744406, -0.2260842, 0, 0.227451, 1, 1,
0.3364702, -0.5627485, 1.652717, 0, 0.2196078, 1, 1,
0.3395982, -1.516294, 2.157173, 0, 0.2156863, 1, 1,
0.3399475, 0.2490565, -0.6358767, 0, 0.2078431, 1, 1,
0.3413535, 0.2773725, 1.028916, 0, 0.2039216, 1, 1,
0.3421069, 0.0758815, 2.298304, 0, 0.1960784, 1, 1,
0.3438346, 0.3210379, 0.8369493, 0, 0.1882353, 1, 1,
0.3458629, -1.757751, 2.912305, 0, 0.1843137, 1, 1,
0.35387, 0.03691268, 1.455396, 0, 0.1764706, 1, 1,
0.360824, 1.310024, 1.014965, 0, 0.172549, 1, 1,
0.3612685, 0.9223614, 0.2938989, 0, 0.1647059, 1, 1,
0.3620814, -0.7294315, 2.195864, 0, 0.1607843, 1, 1,
0.3642341, -1.790906, 3.368792, 0, 0.1529412, 1, 1,
0.3820294, -0.320922, 2.562396, 0, 0.1490196, 1, 1,
0.3831594, -0.5127037, 4.330871, 0, 0.1411765, 1, 1,
0.384451, -1.20886, 2.457083, 0, 0.1372549, 1, 1,
0.3925023, 0.6435975, 0.02209885, 0, 0.1294118, 1, 1,
0.392564, -0.753745, 3.581605, 0, 0.1254902, 1, 1,
0.392971, -1.038416, 3.097471, 0, 0.1176471, 1, 1,
0.3948219, 1.421776, 0.1685225, 0, 0.1137255, 1, 1,
0.4011317, 0.3157848, -1.127327, 0, 0.1058824, 1, 1,
0.4042042, 0.1033734, 1.585721, 0, 0.09803922, 1, 1,
0.4044687, 1.804228, -0.05540806, 0, 0.09411765, 1, 1,
0.405586, 0.6813307, 1.156368, 0, 0.08627451, 1, 1,
0.4058185, -0.8299929, 2.699006, 0, 0.08235294, 1, 1,
0.4063158, -0.4460084, 1.783449, 0, 0.07450981, 1, 1,
0.4078242, -1.409567, 3.047115, 0, 0.07058824, 1, 1,
0.4169234, -1.116215, 2.020871, 0, 0.0627451, 1, 1,
0.4210193, -0.5826029, 3.931364, 0, 0.05882353, 1, 1,
0.4226637, -0.1327957, 1.500174, 0, 0.05098039, 1, 1,
0.42646, -0.04370465, 1.374478, 0, 0.04705882, 1, 1,
0.4294177, -0.7738581, 1.179549, 0, 0.03921569, 1, 1,
0.4331727, 1.659441, 0.670073, 0, 0.03529412, 1, 1,
0.438377, -1.607815, 2.644555, 0, 0.02745098, 1, 1,
0.4409015, 0.2722179, 3.473838, 0, 0.02352941, 1, 1,
0.4415739, 0.3290841, 1.937946, 0, 0.01568628, 1, 1,
0.4455885, -0.06089123, 2.015772, 0, 0.01176471, 1, 1,
0.4495017, 0.8689469, -0.345965, 0, 0.003921569, 1, 1,
0.4571183, -2.082524, 2.975965, 0.003921569, 0, 1, 1,
0.4630627, 0.04698657, 1.584548, 0.007843138, 0, 1, 1,
0.4636524, 0.05651573, 0.01835844, 0.01568628, 0, 1, 1,
0.4655368, 0.3624154, 1.95512, 0.01960784, 0, 1, 1,
0.4671567, 1.475361, -0.6067924, 0.02745098, 0, 1, 1,
0.4690984, -1.530117, 1.922506, 0.03137255, 0, 1, 1,
0.4698875, 0.3136226, 1.248694, 0.03921569, 0, 1, 1,
0.4738743, -1.346195, 2.154701, 0.04313726, 0, 1, 1,
0.4760009, 0.556801, 1.043402, 0.05098039, 0, 1, 1,
0.4819941, 0.4289685, -0.3302776, 0.05490196, 0, 1, 1,
0.4858786, -0.2671712, 1.892067, 0.0627451, 0, 1, 1,
0.4879073, -0.2391624, 2.213006, 0.06666667, 0, 1, 1,
0.4893176, -0.3249075, 2.698914, 0.07450981, 0, 1, 1,
0.4905245, -0.3328484, 2.966928, 0.07843138, 0, 1, 1,
0.4909502, 1.507, -0.5773031, 0.08627451, 0, 1, 1,
0.4915444, -0.7349681, 4.541149, 0.09019608, 0, 1, 1,
0.4928196, 0.1665075, 0.8636688, 0.09803922, 0, 1, 1,
0.494262, -0.2267019, 1.611425, 0.1058824, 0, 1, 1,
0.4956761, 0.4158337, -0.7757047, 0.1098039, 0, 1, 1,
0.5088611, 1.378072, -0.1111024, 0.1176471, 0, 1, 1,
0.5094505, 0.05737915, 1.85029, 0.1215686, 0, 1, 1,
0.5111427, 0.7502505, 0.5282971, 0.1294118, 0, 1, 1,
0.5114984, -0.06931736, 0.3986436, 0.1333333, 0, 1, 1,
0.5117495, 0.4026615, -0.3936304, 0.1411765, 0, 1, 1,
0.5128902, -0.2411698, 3.104978, 0.145098, 0, 1, 1,
0.516548, -0.4029476, 3.650068, 0.1529412, 0, 1, 1,
0.5252482, -0.6133314, 3.342417, 0.1568628, 0, 1, 1,
0.5322128, -0.04578169, 2.210117, 0.1647059, 0, 1, 1,
0.5392958, -0.3491725, 2.061485, 0.1686275, 0, 1, 1,
0.5416006, -1.262474, 2.408228, 0.1764706, 0, 1, 1,
0.5442796, 0.7827613, 0.7933291, 0.1803922, 0, 1, 1,
0.5451297, 0.2506255, 0.023787, 0.1882353, 0, 1, 1,
0.5464648, 0.2496889, 0.05644995, 0.1921569, 0, 1, 1,
0.5515662, 2.010617, -1.146124, 0.2, 0, 1, 1,
0.5531536, -0.3558657, 2.016518, 0.2078431, 0, 1, 1,
0.5532668, 0.5417519, 0.5679572, 0.2117647, 0, 1, 1,
0.5545478, 1.979091, 0.5137105, 0.2196078, 0, 1, 1,
0.5551894, 0.2220002, 0.7597311, 0.2235294, 0, 1, 1,
0.5580018, -0.008046501, 0.5172884, 0.2313726, 0, 1, 1,
0.559423, -1.160074, 1.380272, 0.2352941, 0, 1, 1,
0.5670567, 0.6585771, 1.318533, 0.2431373, 0, 1, 1,
0.5676058, 0.5388438, 2.088406, 0.2470588, 0, 1, 1,
0.5696011, -0.4674466, 1.389994, 0.254902, 0, 1, 1,
0.5702776, 0.5143954, -0.93716, 0.2588235, 0, 1, 1,
0.5713886, 0.826576, 0.3160385, 0.2666667, 0, 1, 1,
0.5744473, 0.2164375, -0.192818, 0.2705882, 0, 1, 1,
0.5841509, -0.952036, 1.939232, 0.2784314, 0, 1, 1,
0.5844606, -0.2239167, 1.089932, 0.282353, 0, 1, 1,
0.5845974, -0.1908984, 3.001953, 0.2901961, 0, 1, 1,
0.5867646, 1.361955, 0.6873133, 0.2941177, 0, 1, 1,
0.5925336, 0.3357944, 0.9416012, 0.3019608, 0, 1, 1,
0.5957784, -0.1752625, 2.443016, 0.3098039, 0, 1, 1,
0.6000517, -0.4232798, 2.433979, 0.3137255, 0, 1, 1,
0.6001995, 0.6412715, 0.6285027, 0.3215686, 0, 1, 1,
0.6032524, 0.5133757, 0.04994531, 0.3254902, 0, 1, 1,
0.6034075, -0.3050227, 3.979182, 0.3333333, 0, 1, 1,
0.6105787, -0.5177888, 1.895223, 0.3372549, 0, 1, 1,
0.6132683, 1.414864, -0.7156875, 0.345098, 0, 1, 1,
0.6196698, 0.4473604, 0.6646284, 0.3490196, 0, 1, 1,
0.6215169, -0.6873215, 4.151868, 0.3568628, 0, 1, 1,
0.6277027, -0.2476082, 3.025984, 0.3607843, 0, 1, 1,
0.6278414, -0.7964191, 4.550489, 0.3686275, 0, 1, 1,
0.6285386, -1.245592, 2.396574, 0.372549, 0, 1, 1,
0.6345964, 0.05662434, 1.892739, 0.3803922, 0, 1, 1,
0.6423109, -1.127103, 2.823088, 0.3843137, 0, 1, 1,
0.6437451, 1.202091, 2.489717, 0.3921569, 0, 1, 1,
0.6438454, 0.4758119, 1.652135, 0.3960784, 0, 1, 1,
0.6452135, -0.1639803, 1.013778, 0.4039216, 0, 1, 1,
0.6454288, 1.03238, 1.345172, 0.4117647, 0, 1, 1,
0.650113, -0.4962189, 0.8043491, 0.4156863, 0, 1, 1,
0.6540378, -2.345232, 2.462027, 0.4235294, 0, 1, 1,
0.6560955, 0.1173774, 1.57186, 0.427451, 0, 1, 1,
0.6589437, 2.103981, 0.6538523, 0.4352941, 0, 1, 1,
0.6636613, 0.1811876, 0.3394173, 0.4392157, 0, 1, 1,
0.6654381, -0.705743, 2.710189, 0.4470588, 0, 1, 1,
0.6675102, 0.7709274, 0.9351768, 0.4509804, 0, 1, 1,
0.6732256, 1.386485, 1.471523, 0.4588235, 0, 1, 1,
0.6778758, -0.7042872, 4.092926, 0.4627451, 0, 1, 1,
0.6788321, -0.6577917, 3.206918, 0.4705882, 0, 1, 1,
0.6864281, -1.459579, 2.969064, 0.4745098, 0, 1, 1,
0.6895122, 2.539938, 0.03814406, 0.4823529, 0, 1, 1,
0.6933354, -1.119856, 2.861622, 0.4862745, 0, 1, 1,
0.6938179, 0.2031162, 1.595623, 0.4941176, 0, 1, 1,
0.6949891, -0.9913726, 2.17664, 0.5019608, 0, 1, 1,
0.6951907, 0.9445578, -0.126064, 0.5058824, 0, 1, 1,
0.6973445, -0.5634454, 1.881482, 0.5137255, 0, 1, 1,
0.7063515, -0.07392112, 2.193891, 0.5176471, 0, 1, 1,
0.7084927, -0.6436909, 1.180532, 0.5254902, 0, 1, 1,
0.708654, 0.07690063, 1.380158, 0.5294118, 0, 1, 1,
0.7090904, -1.292475, 1.134015, 0.5372549, 0, 1, 1,
0.7099152, -0.8313037, 2.006737, 0.5411765, 0, 1, 1,
0.7113252, 0.04527432, 1.359159, 0.5490196, 0, 1, 1,
0.714021, -1.987534, 2.907358, 0.5529412, 0, 1, 1,
0.7141163, 0.2053518, 0.971079, 0.5607843, 0, 1, 1,
0.714195, 0.1506906, 4.333291, 0.5647059, 0, 1, 1,
0.7160057, 0.9945682, 1.729796, 0.572549, 0, 1, 1,
0.7198945, -0.7164165, 1.178496, 0.5764706, 0, 1, 1,
0.7212316, -0.1089743, 1.392431, 0.5843138, 0, 1, 1,
0.7281555, -0.6077859, 2.681832, 0.5882353, 0, 1, 1,
0.7394011, 1.418161, 1.040708, 0.5960785, 0, 1, 1,
0.7472991, 1.061761, 0.5485372, 0.6039216, 0, 1, 1,
0.7475023, 1.133676, 1.600126, 0.6078432, 0, 1, 1,
0.7499544, 0.3972232, 1.955794, 0.6156863, 0, 1, 1,
0.7552211, -0.5005795, 1.167368, 0.6196079, 0, 1, 1,
0.7591799, 0.02959528, 0.4807834, 0.627451, 0, 1, 1,
0.7620655, -0.09293458, 1.072605, 0.6313726, 0, 1, 1,
0.7685432, 0.04685045, 2.460773, 0.6392157, 0, 1, 1,
0.7702591, -0.3131001, 2.067937, 0.6431373, 0, 1, 1,
0.7785099, -0.1671931, 2.287304, 0.6509804, 0, 1, 1,
0.7829134, 0.4220051, 1.336483, 0.654902, 0, 1, 1,
0.7874415, -1.23565, 0.7320928, 0.6627451, 0, 1, 1,
0.7899052, 1.183924, 0.06121581, 0.6666667, 0, 1, 1,
0.7976441, -0.831929, 2.139362, 0.6745098, 0, 1, 1,
0.7980333, 0.5803146, 0.2324956, 0.6784314, 0, 1, 1,
0.80518, -2.57597, 2.191632, 0.6862745, 0, 1, 1,
0.8053396, 1.241116, -1.056168, 0.6901961, 0, 1, 1,
0.8082806, 1.980331, 0.7654355, 0.6980392, 0, 1, 1,
0.8143438, -1.016285, 3.063686, 0.7058824, 0, 1, 1,
0.815519, -1.133327, 3.116781, 0.7098039, 0, 1, 1,
0.8165596, 0.3063526, 1.601896, 0.7176471, 0, 1, 1,
0.8166606, -1.448644, 3.229141, 0.7215686, 0, 1, 1,
0.8198448, 1.905415, 1.194718, 0.7294118, 0, 1, 1,
0.8240281, -0.1343801, 2.208419, 0.7333333, 0, 1, 1,
0.8258928, -0.1059581, 1.948297, 0.7411765, 0, 1, 1,
0.8290496, 0.6861126, 0.947128, 0.7450981, 0, 1, 1,
0.8294299, -0.5866274, 0.9846923, 0.7529412, 0, 1, 1,
0.832136, -0.4358527, 2.444482, 0.7568628, 0, 1, 1,
0.8398331, -1.793651, 3.092573, 0.7647059, 0, 1, 1,
0.8399931, -0.7649757, 2.969079, 0.7686275, 0, 1, 1,
0.840943, -0.1041023, 1.312393, 0.7764706, 0, 1, 1,
0.8413531, -0.3868198, 2.577227, 0.7803922, 0, 1, 1,
0.8424029, 0.1659593, 1.128447, 0.7882353, 0, 1, 1,
0.8480535, 0.7152042, 1.716021, 0.7921569, 0, 1, 1,
0.8497828, 0.4062488, 2.274313, 0.8, 0, 1, 1,
0.8543625, 0.04292796, 2.664431, 0.8078431, 0, 1, 1,
0.8574309, 0.2398701, 2.032046, 0.8117647, 0, 1, 1,
0.860311, -0.03399492, -0.2064505, 0.8196079, 0, 1, 1,
0.8617392, -1.487155, 2.809194, 0.8235294, 0, 1, 1,
0.8623367, 2.235928, 1.931452, 0.8313726, 0, 1, 1,
0.8627003, -0.06692005, 1.812667, 0.8352941, 0, 1, 1,
0.8685439, 0.186198, 0.8248703, 0.8431373, 0, 1, 1,
0.8698781, 0.3024171, 0.963863, 0.8470588, 0, 1, 1,
0.8711006, -1.60025, 3.202785, 0.854902, 0, 1, 1,
0.8766144, 0.6202025, -0.5093001, 0.8588235, 0, 1, 1,
0.8870893, -0.4647136, 3.279066, 0.8666667, 0, 1, 1,
0.8887607, 0.9677681, 0.9492991, 0.8705882, 0, 1, 1,
0.899019, 1.05287, 0.07783972, 0.8784314, 0, 1, 1,
0.9003128, -0.07748315, 2.346346, 0.8823529, 0, 1, 1,
0.9004515, -0.5632067, 1.249499, 0.8901961, 0, 1, 1,
0.904101, -0.3053558, 1.918099, 0.8941177, 0, 1, 1,
0.9162322, 0.2813041, -0.5465164, 0.9019608, 0, 1, 1,
0.9162651, 0.2718049, 0.3783162, 0.9098039, 0, 1, 1,
0.9203756, -0.6971367, 4.375924, 0.9137255, 0, 1, 1,
0.9209307, 0.08642734, 1.197408, 0.9215686, 0, 1, 1,
0.9224067, 0.4085427, 1.959144, 0.9254902, 0, 1, 1,
0.922628, 1.245945, 0.7624186, 0.9333333, 0, 1, 1,
0.9248358, -0.3552218, 1.27234, 0.9372549, 0, 1, 1,
0.9262025, -0.00221533, 1.506112, 0.945098, 0, 1, 1,
0.9374946, -2.547153, 2.966992, 0.9490196, 0, 1, 1,
0.9375266, -0.6019058, 2.926935, 0.9568627, 0, 1, 1,
0.9398474, -1.222343, 2.149243, 0.9607843, 0, 1, 1,
0.9400306, 1.51044, -0.200048, 0.9686275, 0, 1, 1,
0.9409437, -0.3987942, 4.586649, 0.972549, 0, 1, 1,
0.9500929, 0.1807947, 3.998124, 0.9803922, 0, 1, 1,
0.9579485, -1.641036, 3.988351, 0.9843137, 0, 1, 1,
0.9631909, -2.429818, 3.006224, 0.9921569, 0, 1, 1,
0.967813, -1.155637, 2.072555, 0.9960784, 0, 1, 1,
0.9682355, 1.019453, 0.377311, 1, 0, 0.9960784, 1,
0.9701037, 0.9839334, 0.5638391, 1, 0, 0.9882353, 1,
0.9735234, 0.2993906, 1.827983, 1, 0, 0.9843137, 1,
0.9784873, -0.06064828, 2.273419, 1, 0, 0.9764706, 1,
0.9842911, -0.1935484, 4.27678, 1, 0, 0.972549, 1,
0.9891184, -0.03724657, 2.158299, 1, 0, 0.9647059, 1,
1.000023, -1.684931, 2.824897, 1, 0, 0.9607843, 1,
1.000432, -0.8505252, 2.663249, 1, 0, 0.9529412, 1,
1.005076, 0.7827621, 0.4294721, 1, 0, 0.9490196, 1,
1.019543, -0.02555552, 1.13432, 1, 0, 0.9411765, 1,
1.022875, 0.9635292, -0.4587118, 1, 0, 0.9372549, 1,
1.025743, -0.06918105, 2.000015, 1, 0, 0.9294118, 1,
1.025904, 0.8933957, 2.742973, 1, 0, 0.9254902, 1,
1.027417, -0.7704633, 2.280641, 1, 0, 0.9176471, 1,
1.03191, 0.5015756, 1.351216, 1, 0, 0.9137255, 1,
1.034797, 1.242396, 2.081385, 1, 0, 0.9058824, 1,
1.039219, 2.648778, 0.719576, 1, 0, 0.9019608, 1,
1.041292, 0.6863739, 1.855924, 1, 0, 0.8941177, 1,
1.046151, 1.099198, 0.1873205, 1, 0, 0.8862745, 1,
1.05226, -0.5915658, 3.243558, 1, 0, 0.8823529, 1,
1.055213, -0.9885996, 1.925318, 1, 0, 0.8745098, 1,
1.064667, -0.985133, 1.613843, 1, 0, 0.8705882, 1,
1.069947, 0.9640506, 2.185895, 1, 0, 0.8627451, 1,
1.072228, -0.5045018, 1.544486, 1, 0, 0.8588235, 1,
1.079453, -1.107448, 2.50145, 1, 0, 0.8509804, 1,
1.0819, -0.01318029, 1.860979, 1, 0, 0.8470588, 1,
1.082149, 1.321367, -0.07631218, 1, 0, 0.8392157, 1,
1.083615, -0.9723493, 1.528811, 1, 0, 0.8352941, 1,
1.090589, 0.9428164, 0.7062807, 1, 0, 0.827451, 1,
1.094557, -1.423756, 2.394041, 1, 0, 0.8235294, 1,
1.096104, -0.3806017, 2.24346, 1, 0, 0.8156863, 1,
1.099997, 1.276597, 0.9541863, 1, 0, 0.8117647, 1,
1.101045, 0.7083912, 0.5008003, 1, 0, 0.8039216, 1,
1.105192, -2.398901, 2.821166, 1, 0, 0.7960784, 1,
1.114178, -0.7653385, 0.8100441, 1, 0, 0.7921569, 1,
1.121849, -0.006462011, 2.714505, 1, 0, 0.7843137, 1,
1.12411, 2.596344, 1.114988, 1, 0, 0.7803922, 1,
1.125876, 0.4904795, 0.01556341, 1, 0, 0.772549, 1,
1.126049, -0.6585201, 1.438901, 1, 0, 0.7686275, 1,
1.127597, -0.6513815, 0.8262203, 1, 0, 0.7607843, 1,
1.137493, 0.1706842, 2.175226, 1, 0, 0.7568628, 1,
1.141587, 0.1564501, 1.949196, 1, 0, 0.7490196, 1,
1.145502, -1.487107, 1.206994, 1, 0, 0.7450981, 1,
1.147135, -0.01962438, 0.6470326, 1, 0, 0.7372549, 1,
1.154338, 0.6524849, 0.3683843, 1, 0, 0.7333333, 1,
1.157615, 0.8908108, 2.671137, 1, 0, 0.7254902, 1,
1.161069, -0.04336875, 2.347093, 1, 0, 0.7215686, 1,
1.170651, 1.276474, -1.350483, 1, 0, 0.7137255, 1,
1.176209, 1.939057, 1.03785, 1, 0, 0.7098039, 1,
1.184572, -0.8134604, 1.222195, 1, 0, 0.7019608, 1,
1.186653, 0.2730163, 1.590697, 1, 0, 0.6941177, 1,
1.186837, 1.933753, 1.791935, 1, 0, 0.6901961, 1,
1.199899, 1.631256, 0.4215979, 1, 0, 0.682353, 1,
1.201777, -1.111047, 1.606004, 1, 0, 0.6784314, 1,
1.203804, -1.960591, 2.79, 1, 0, 0.6705883, 1,
1.204675, 0.3651894, 1.372114, 1, 0, 0.6666667, 1,
1.205426, -0.05964514, 2.077405, 1, 0, 0.6588235, 1,
1.206044, 1.914499, 1.070504, 1, 0, 0.654902, 1,
1.206191, -0.5383738, 2.192035, 1, 0, 0.6470588, 1,
1.207579, -0.2942441, 2.156089, 1, 0, 0.6431373, 1,
1.226406, -0.6150177, 3.387697, 1, 0, 0.6352941, 1,
1.243857, -0.4125771, 2.373617, 1, 0, 0.6313726, 1,
1.244634, -0.9663039, 1.747176, 1, 0, 0.6235294, 1,
1.248117, -0.5887778, 1.461283, 1, 0, 0.6196079, 1,
1.252124, -0.7772512, 1.326185, 1, 0, 0.6117647, 1,
1.26159, 0.1955705, -0.4056969, 1, 0, 0.6078432, 1,
1.272872, -1.066951, 1.921506, 1, 0, 0.6, 1,
1.276905, -1.470814, 2.05705, 1, 0, 0.5921569, 1,
1.277565, -0.1330023, 1.129789, 1, 0, 0.5882353, 1,
1.286934, 0.559403, 0.6501091, 1, 0, 0.5803922, 1,
1.302234, 0.7514161, 1.743177, 1, 0, 0.5764706, 1,
1.303197, 0.4471968, 1.523636, 1, 0, 0.5686275, 1,
1.305068, -1.718607, 4.09103, 1, 0, 0.5647059, 1,
1.310007, 1.076516, -0.1046203, 1, 0, 0.5568628, 1,
1.312545, -0.2651837, 3.157295, 1, 0, 0.5529412, 1,
1.312591, -0.9644572, 2.238198, 1, 0, 0.5450981, 1,
1.312765, -0.581172, 2.373993, 1, 0, 0.5411765, 1,
1.313831, -0.8644999, 2.140221, 1, 0, 0.5333334, 1,
1.32015, -1.577903, 3.893841, 1, 0, 0.5294118, 1,
1.323237, -1.244729, 1.448405, 1, 0, 0.5215687, 1,
1.373134, 0.6500307, 0.3136338, 1, 0, 0.5176471, 1,
1.389434, 0.05214389, 2.77705, 1, 0, 0.509804, 1,
1.392066, 1.009325, 0.007144763, 1, 0, 0.5058824, 1,
1.409891, -0.3353549, 0.4163007, 1, 0, 0.4980392, 1,
1.413258, -1.443428, 2.244286, 1, 0, 0.4901961, 1,
1.414358, 0.8958133, -0.3547458, 1, 0, 0.4862745, 1,
1.41498, -0.6408926, 2.776222, 1, 0, 0.4784314, 1,
1.42662, -0.02519245, 1.38782, 1, 0, 0.4745098, 1,
1.427365, 0.6550561, 1.379887, 1, 0, 0.4666667, 1,
1.439972, 0.5312976, 1.241753, 1, 0, 0.4627451, 1,
1.450801, 0.3566491, -0.5925967, 1, 0, 0.454902, 1,
1.457727, -1.611654, 1.617388, 1, 0, 0.4509804, 1,
1.463563, -0.01749349, 2.182356, 1, 0, 0.4431373, 1,
1.464374, -0.7116317, 1.53238, 1, 0, 0.4392157, 1,
1.471331, 1.58126, 0.9619028, 1, 0, 0.4313726, 1,
1.478495, -0.7450555, 3.407666, 1, 0, 0.427451, 1,
1.489276, -0.4373895, 0.5440633, 1, 0, 0.4196078, 1,
1.500141, -0.06535466, 1.708553, 1, 0, 0.4156863, 1,
1.504031, 0.07510421, 2.519202, 1, 0, 0.4078431, 1,
1.509106, 0.8029489, 1.652633, 1, 0, 0.4039216, 1,
1.511298, 0.7334094, 0.7612655, 1, 0, 0.3960784, 1,
1.514464, -0.5630208, 1.659647, 1, 0, 0.3882353, 1,
1.514656, 0.8518962, 1.10171, 1, 0, 0.3843137, 1,
1.522936, 1.706653, -0.8588741, 1, 0, 0.3764706, 1,
1.538995, 0.4352877, 0.9521807, 1, 0, 0.372549, 1,
1.557377, 1.980771, -0.4915693, 1, 0, 0.3647059, 1,
1.558114, 1.441278, -0.1214109, 1, 0, 0.3607843, 1,
1.624304, 0.1700219, 2.361764, 1, 0, 0.3529412, 1,
1.624796, -1.987429, 2.11602, 1, 0, 0.3490196, 1,
1.626022, -1.436327, 3.680838, 1, 0, 0.3411765, 1,
1.628772, 0.2900591, 1.186733, 1, 0, 0.3372549, 1,
1.651783, -0.4455745, 1.354099, 1, 0, 0.3294118, 1,
1.685521, -0.5627242, 0.8282308, 1, 0, 0.3254902, 1,
1.687448, 0.6905714, 0.7904925, 1, 0, 0.3176471, 1,
1.689539, -0.645628, 1.855821, 1, 0, 0.3137255, 1,
1.689702, 0.3924447, 0.1751087, 1, 0, 0.3058824, 1,
1.726131, 0.222972, 2.84356, 1, 0, 0.2980392, 1,
1.727379, -1.383397, 1.485782, 1, 0, 0.2941177, 1,
1.727679, 1.348026, 1.621753, 1, 0, 0.2862745, 1,
1.729849, -1.966224, 3.024448, 1, 0, 0.282353, 1,
1.730455, -0.08925884, 2.446937, 1, 0, 0.2745098, 1,
1.733845, -0.5903292, 2.427958, 1, 0, 0.2705882, 1,
1.741064, -0.1852785, 1.769568, 1, 0, 0.2627451, 1,
1.749218, 1.92566, -0.4774295, 1, 0, 0.2588235, 1,
1.758626, 0.1887472, 1.423665, 1, 0, 0.2509804, 1,
1.775414, 0.9318766, 0.5470479, 1, 0, 0.2470588, 1,
1.776132, 0.5288124, 2.389035, 1, 0, 0.2392157, 1,
1.780964, 0.1615355, 2.905682, 1, 0, 0.2352941, 1,
1.790509, -0.0256108, 3.396584, 1, 0, 0.227451, 1,
1.798057, 0.9829841, -0.6125015, 1, 0, 0.2235294, 1,
1.810741, -2.306785, 3.523943, 1, 0, 0.2156863, 1,
1.82312, -0.3618028, 1.888446, 1, 0, 0.2117647, 1,
1.82417, -0.7199988, 1.378391, 1, 0, 0.2039216, 1,
1.835493, -0.7484356, 0.6768954, 1, 0, 0.1960784, 1,
1.858418, -1.135091, 2.659385, 1, 0, 0.1921569, 1,
1.865436, -0.8269517, 1.216545, 1, 0, 0.1843137, 1,
1.874978, 0.5887927, 1.68062, 1, 0, 0.1803922, 1,
1.877613, 0.4417835, -0.1520674, 1, 0, 0.172549, 1,
1.912371, 2.38573, 1.689996, 1, 0, 0.1686275, 1,
1.912549, -0.8214672, 3.028169, 1, 0, 0.1607843, 1,
1.924112, -1.78181, 1.956485, 1, 0, 0.1568628, 1,
1.964456, 1.308427, 0.2407041, 1, 0, 0.1490196, 1,
2.002479, -0.7857994, 2.2539, 1, 0, 0.145098, 1,
2.016532, -1.224582, 2.05208, 1, 0, 0.1372549, 1,
2.057022, 0.2626115, 1.141189, 1, 0, 0.1333333, 1,
2.086329, 0.4646634, 1.296029, 1, 0, 0.1254902, 1,
2.096065, -0.4385959, 1.828247, 1, 0, 0.1215686, 1,
2.100281, 0.4451062, 3.086597, 1, 0, 0.1137255, 1,
2.156664, 1.471703, 0.9327367, 1, 0, 0.1098039, 1,
2.229614, 1.242688, 1.844668, 1, 0, 0.1019608, 1,
2.303879, 0.9432376, 0.7925183, 1, 0, 0.09411765, 1,
2.31593, 0.3457566, 1.900784, 1, 0, 0.09019608, 1,
2.356862, -0.3657278, 1.058552, 1, 0, 0.08235294, 1,
2.375111, 0.3441074, 1.168802, 1, 0, 0.07843138, 1,
2.378434, -1.156123, 2.420657, 1, 0, 0.07058824, 1,
2.391091, 1.784567, 1.650438, 1, 0, 0.06666667, 1,
2.400935, -0.008779624, 1.384438, 1, 0, 0.05882353, 1,
2.638084, 0.07729039, 2.237083, 1, 0, 0.05490196, 1,
2.705487, 0.2236438, 0.06146715, 1, 0, 0.04705882, 1,
2.760056, -0.04412313, 1.944302, 1, 0, 0.04313726, 1,
2.829588, -0.3026363, 2.820078, 1, 0, 0.03529412, 1,
2.858709, -0.4718475, 2.426403, 1, 0, 0.03137255, 1,
3.018363, -0.7260934, 1.159704, 1, 0, 0.02352941, 1,
3.061893, 0.5189354, 1.863647, 1, 0, 0.01960784, 1,
3.084426, -1.848739, 1.522684, 1, 0, 0.01176471, 1,
3.437806, 0.8697199, 3.377057, 1, 0, 0.007843138, 1
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
0.1638926, -4.118457, -6.491349, 0, -0.5, 0.5, 0.5,
0.1638926, -4.118457, -6.491349, 1, -0.5, 0.5, 0.5,
0.1638926, -4.118457, -6.491349, 1, 1.5, 0.5, 0.5,
0.1638926, -4.118457, -6.491349, 0, 1.5, 0.5, 0.5
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
-4.219878, -0.07163465, -6.491349, 0, -0.5, 0.5, 0.5,
-4.219878, -0.07163465, -6.491349, 1, -0.5, 0.5, 0.5,
-4.219878, -0.07163465, -6.491349, 1, 1.5, 0.5, 0.5,
-4.219878, -0.07163465, -6.491349, 0, 1.5, 0.5, 0.5
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
-4.219878, -4.118457, 0.2862022, 0, -0.5, 0.5, 0.5,
-4.219878, -4.118457, 0.2862022, 1, -0.5, 0.5, 0.5,
-4.219878, -4.118457, 0.2862022, 1, 1.5, 0.5, 0.5,
-4.219878, -4.118457, 0.2862022, 0, 1.5, 0.5, 0.5
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
-3, -3.184575, -4.927299,
3, -3.184575, -4.927299,
-3, -3.184575, -4.927299,
-3, -3.340222, -5.187974,
-2, -3.184575, -4.927299,
-2, -3.340222, -5.187974,
-1, -3.184575, -4.927299,
-1, -3.340222, -5.187974,
0, -3.184575, -4.927299,
0, -3.340222, -5.187974,
1, -3.184575, -4.927299,
1, -3.340222, -5.187974,
2, -3.184575, -4.927299,
2, -3.340222, -5.187974,
3, -3.184575, -4.927299,
3, -3.340222, -5.187974
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
-3, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
-3, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
-3, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
-3, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
-2, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
-2, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
-2, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
-2, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
-1, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
-1, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
-1, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
-1, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
0, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
0, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
0, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
0, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
1, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
1, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
1, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
1, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
2, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
2, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
2, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
2, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5,
3, -3.651516, -5.709324, 0, -0.5, 0.5, 0.5,
3, -3.651516, -5.709324, 1, -0.5, 0.5, 0.5,
3, -3.651516, -5.709324, 1, 1.5, 0.5, 0.5,
3, -3.651516, -5.709324, 0, 1.5, 0.5, 0.5
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
-3.208239, -3, -4.927299,
-3.208239, 2, -4.927299,
-3.208239, -3, -4.927299,
-3.376845, -3, -5.187974,
-3.208239, -2, -4.927299,
-3.376845, -2, -5.187974,
-3.208239, -1, -4.927299,
-3.376845, -1, -5.187974,
-3.208239, 0, -4.927299,
-3.376845, 0, -5.187974,
-3.208239, 1, -4.927299,
-3.376845, 1, -5.187974,
-3.208239, 2, -4.927299,
-3.376845, 2, -5.187974
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
-3.714058, -3, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, -3, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, -3, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, -3, -5.709324, 0, 1.5, 0.5, 0.5,
-3.714058, -2, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, -2, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, -2, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, -2, -5.709324, 0, 1.5, 0.5, 0.5,
-3.714058, -1, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, -1, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, -1, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, -1, -5.709324, 0, 1.5, 0.5, 0.5,
-3.714058, 0, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, 0, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, 0, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, 0, -5.709324, 0, 1.5, 0.5, 0.5,
-3.714058, 1, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, 1, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, 1, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, 1, -5.709324, 0, 1.5, 0.5, 0.5,
-3.714058, 2, -5.709324, 0, -0.5, 0.5, 0.5,
-3.714058, 2, -5.709324, 1, -0.5, 0.5, 0.5,
-3.714058, 2, -5.709324, 1, 1.5, 0.5, 0.5,
-3.714058, 2, -5.709324, 0, 1.5, 0.5, 0.5
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
-3.208239, -3.184575, -4,
-3.208239, -3.184575, 4,
-3.208239, -3.184575, -4,
-3.376845, -3.340222, -4,
-3.208239, -3.184575, -2,
-3.376845, -3.340222, -2,
-3.208239, -3.184575, 0,
-3.376845, -3.340222, 0,
-3.208239, -3.184575, 2,
-3.376845, -3.340222, 2,
-3.208239, -3.184575, 4,
-3.376845, -3.340222, 4
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
-3.714058, -3.651516, -4, 0, -0.5, 0.5, 0.5,
-3.714058, -3.651516, -4, 1, -0.5, 0.5, 0.5,
-3.714058, -3.651516, -4, 1, 1.5, 0.5, 0.5,
-3.714058, -3.651516, -4, 0, 1.5, 0.5, 0.5,
-3.714058, -3.651516, -2, 0, -0.5, 0.5, 0.5,
-3.714058, -3.651516, -2, 1, -0.5, 0.5, 0.5,
-3.714058, -3.651516, -2, 1, 1.5, 0.5, 0.5,
-3.714058, -3.651516, -2, 0, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 0, 0, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 0, 1, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 0, 1, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 0, 0, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 2, 0, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 2, 1, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 2, 1, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 2, 0, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 4, 0, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 4, 1, -0.5, 0.5, 0.5,
-3.714058, -3.651516, 4, 1, 1.5, 0.5, 0.5,
-3.714058, -3.651516, 4, 0, 1.5, 0.5, 0.5
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
-3.208239, -3.184575, -4.927299,
-3.208239, 3.041306, -4.927299,
-3.208239, -3.184575, 5.499703,
-3.208239, 3.041306, 5.499703,
-3.208239, -3.184575, -4.927299,
-3.208239, -3.184575, 5.499703,
-3.208239, 3.041306, -4.927299,
-3.208239, 3.041306, 5.499703,
-3.208239, -3.184575, -4.927299,
3.536024, -3.184575, -4.927299,
-3.208239, -3.184575, 5.499703,
3.536024, -3.184575, 5.499703,
-3.208239, 3.041306, -4.927299,
3.536024, 3.041306, -4.927299,
-3.208239, 3.041306, 5.499703,
3.536024, 3.041306, 5.499703,
3.536024, -3.184575, -4.927299,
3.536024, 3.041306, -4.927299,
3.536024, -3.184575, 5.499703,
3.536024, 3.041306, 5.499703,
3.536024, -3.184575, -4.927299,
3.536024, -3.184575, 5.499703,
3.536024, 3.041306, -4.927299,
3.536024, 3.041306, 5.499703
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
var radius = 7.4177;
var distance = 33.00219;
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
mvMatrix.translate( -0.1638926, 0.07163465, -0.2862022 );
mvMatrix.scale( 1.189183, 1.288197, 0.7691725 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.00219);
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
diepoxybutane<-read.table("diepoxybutane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diepoxybutane$V2
```

```
## Error in eval(expr, envir, enclos): object 'diepoxybutane' not found
```

```r
y<-diepoxybutane$V3
```

```
## Error in eval(expr, envir, enclos): object 'diepoxybutane' not found
```

```r
z<-diepoxybutane$V4
```

```
## Error in eval(expr, envir, enclos): object 'diepoxybutane' not found
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
-3.110021, -0.23727, -1.051186, 0, 0, 1, 1, 1,
-3.031178, -2.637966, -1.897773, 1, 0, 0, 1, 1,
-3.02598, -1.161309, -0.8432962, 1, 0, 0, 1, 1,
-2.888324, 0.9304329, -1.236506, 1, 0, 0, 1, 1,
-2.866254, -1.226893, -0.9230185, 1, 0, 0, 1, 1,
-2.509721, 1.427463, -2.086958, 1, 0, 0, 1, 1,
-2.494422, 0.767058, -1.25361, 0, 0, 0, 1, 1,
-2.47163, 0.2658042, -0.5359485, 0, 0, 0, 1, 1,
-2.444362, -1.414431, -3.225734, 0, 0, 0, 1, 1,
-2.38597, 0.3457468, -0.4903802, 0, 0, 0, 1, 1,
-2.356682, -0.8729931, -0.01730777, 0, 0, 0, 1, 1,
-2.353344, 2.084002, -0.9794168, 0, 0, 0, 1, 1,
-2.298566, -0.2856815, -2.572545, 0, 0, 0, 1, 1,
-2.257948, 0.2885022, -2.13154, 1, 1, 1, 1, 1,
-2.255148, -0.1122481, -1.203533, 1, 1, 1, 1, 1,
-2.229865, 1.728425, 2.202497, 1, 1, 1, 1, 1,
-2.217344, -1.852405, -3.437573, 1, 1, 1, 1, 1,
-2.158271, 0.9336041, -1.651857, 1, 1, 1, 1, 1,
-2.134923, -0.3411631, -2.085693, 1, 1, 1, 1, 1,
-2.11818, -1.187179, -1.896897, 1, 1, 1, 1, 1,
-2.105005, -1.326141, -1.848069, 1, 1, 1, 1, 1,
-2.066281, -1.396063, -1.643558, 1, 1, 1, 1, 1,
-2.047928, -2.071508, -2.215919, 1, 1, 1, 1, 1,
-2.041399, -0.8307604, -3.92594, 1, 1, 1, 1, 1,
-2.035896, -0.2390331, -0.670544, 1, 1, 1, 1, 1,
-1.993909, -0.4139711, -2.357679, 1, 1, 1, 1, 1,
-1.975674, -0.3254628, -2.016719, 1, 1, 1, 1, 1,
-1.971903, 0.4611158, -0.168883, 1, 1, 1, 1, 1,
-1.930277, 1.04443, -0.6411446, 0, 0, 1, 1, 1,
-1.924226, 0.3156636, -1.677987, 1, 0, 0, 1, 1,
-1.908442, -1.605189, -1.605104, 1, 0, 0, 1, 1,
-1.860794, -0.1665716, -2.939696, 1, 0, 0, 1, 1,
-1.851067, -0.1330788, -2.679961, 1, 0, 0, 1, 1,
-1.8404, -0.209783, -2.776593, 1, 0, 0, 1, 1,
-1.831348, 0.2747419, -2.144554, 0, 0, 0, 1, 1,
-1.821997, 0.3939803, -0.8595421, 0, 0, 0, 1, 1,
-1.77485, 0.05212111, 0.1005752, 0, 0, 0, 1, 1,
-1.765712, 0.23642, -3.043592, 0, 0, 0, 1, 1,
-1.764361, -1.777004, -3.670394, 0, 0, 0, 1, 1,
-1.734552, 0.1262682, -2.159134, 0, 0, 0, 1, 1,
-1.729245, -0.2432312, -2.369972, 0, 0, 0, 1, 1,
-1.7097, -0.2454836, -2.691875, 1, 1, 1, 1, 1,
-1.697813, -0.8630167, -1.468787, 1, 1, 1, 1, 1,
-1.690672, -1.477383, -1.168643, 1, 1, 1, 1, 1,
-1.68935, 0.4186065, -0.5810431, 1, 1, 1, 1, 1,
-1.674773, 0.9590805, -0.3031827, 1, 1, 1, 1, 1,
-1.668302, -0.2012141, -0.6094871, 1, 1, 1, 1, 1,
-1.66403, 0.1907714, -3.32758, 1, 1, 1, 1, 1,
-1.663435, -0.5798881, -2.129496, 1, 1, 1, 1, 1,
-1.657998, -0.1889353, -0.7938338, 1, 1, 1, 1, 1,
-1.653635, -0.4744627, -2.632212, 1, 1, 1, 1, 1,
-1.647904, 1.888912, -0.8766946, 1, 1, 1, 1, 1,
-1.645674, 0.122, -1.252665, 1, 1, 1, 1, 1,
-1.643604, 0.5972525, -2.081139, 1, 1, 1, 1, 1,
-1.625795, -1.030141, -1.491689, 1, 1, 1, 1, 1,
-1.619061, 0.5067426, -2.110564, 1, 1, 1, 1, 1,
-1.612067, 1.28142, -1.290323, 0, 0, 1, 1, 1,
-1.611052, -0.5354081, -1.052129, 1, 0, 0, 1, 1,
-1.586593, 0.02027921, -2.448334, 1, 0, 0, 1, 1,
-1.581023, -0.09524789, -1.513443, 1, 0, 0, 1, 1,
-1.577328, 0.7922291, 0.8835563, 1, 0, 0, 1, 1,
-1.567127, -0.04463928, -0.357158, 1, 0, 0, 1, 1,
-1.547441, 0.1953024, -0.2401199, 0, 0, 0, 1, 1,
-1.542606, -0.7298448, -3.325578, 0, 0, 0, 1, 1,
-1.541682, -1.06936, -2.041222, 0, 0, 0, 1, 1,
-1.519022, 2.614364, -1.585729, 0, 0, 0, 1, 1,
-1.509081, 1.107908, -1.874252, 0, 0, 0, 1, 1,
-1.508692, 0.4489591, -1.459335, 0, 0, 0, 1, 1,
-1.504719, -1.571993, -2.339978, 0, 0, 0, 1, 1,
-1.497489, -0.7790709, -1.403058, 1, 1, 1, 1, 1,
-1.477328, -0.106176, -1.69725, 1, 1, 1, 1, 1,
-1.471878, -1.673008, -0.6803499, 1, 1, 1, 1, 1,
-1.467962, 0.9932886, -1.606862, 1, 1, 1, 1, 1,
-1.464964, 2.379056, -1.350151, 1, 1, 1, 1, 1,
-1.46351, -0.3376188, -1.273817, 1, 1, 1, 1, 1,
-1.460843, -0.528536, -2.023407, 1, 1, 1, 1, 1,
-1.458574, 0.97658, -0.9010844, 1, 1, 1, 1, 1,
-1.438873, 1.653857, -0.7251481, 1, 1, 1, 1, 1,
-1.436816, -0.7153807, -1.803021, 1, 1, 1, 1, 1,
-1.436211, 0.5720487, -1.868777, 1, 1, 1, 1, 1,
-1.432974, 0.3671598, -1.815797, 1, 1, 1, 1, 1,
-1.429435, -0.03512906, -1.88066, 1, 1, 1, 1, 1,
-1.427845, 2.315101, 0.759622, 1, 1, 1, 1, 1,
-1.423736, 0.557667, -0.2093727, 1, 1, 1, 1, 1,
-1.420292, -0.08186595, -2.044785, 0, 0, 1, 1, 1,
-1.398332, 0.2932503, -1.327008, 1, 0, 0, 1, 1,
-1.393418, -0.4929273, -3.1882, 1, 0, 0, 1, 1,
-1.387538, 0.9950652, -1.798197, 1, 0, 0, 1, 1,
-1.385897, 1.350861, -0.2977887, 1, 0, 0, 1, 1,
-1.369885, 2.506945, -0.2124468, 1, 0, 0, 1, 1,
-1.366424, 2.027724, -2.130201, 0, 0, 0, 1, 1,
-1.356892, -0.7438872, -1.688517, 0, 0, 0, 1, 1,
-1.353561, 0.5428836, -1.776518, 0, 0, 0, 1, 1,
-1.345165, -1.00368, -3.841029, 0, 0, 0, 1, 1,
-1.344314, 0.8714616, -1.582067, 0, 0, 0, 1, 1,
-1.343498, -0.3861124, -1.236229, 0, 0, 0, 1, 1,
-1.339175, -0.9864477, -1.254556, 0, 0, 0, 1, 1,
-1.334532, 0.1112833, -2.832588, 1, 1, 1, 1, 1,
-1.330878, 1.030956, -0.9699733, 1, 1, 1, 1, 1,
-1.330461, 1.097554, 0.03690169, 1, 1, 1, 1, 1,
-1.320873, 0.4868444, -1.994012, 1, 1, 1, 1, 1,
-1.310582, -1.905282, -3.518758, 1, 1, 1, 1, 1,
-1.308619, 0.251349, -0.616338, 1, 1, 1, 1, 1,
-1.306713, -1.219783, -2.884872, 1, 1, 1, 1, 1,
-1.302872, 0.2482317, -0.1644188, 1, 1, 1, 1, 1,
-1.292161, 0.9002715, -0.0397688, 1, 1, 1, 1, 1,
-1.291815, 0.4374235, -1.38979, 1, 1, 1, 1, 1,
-1.290619, 1.212487, 0.4875458, 1, 1, 1, 1, 1,
-1.287804, -0.1357104, -0.4957793, 1, 1, 1, 1, 1,
-1.286974, -0.4645337, 0.422076, 1, 1, 1, 1, 1,
-1.280011, -0.02670157, -1.048163, 1, 1, 1, 1, 1,
-1.266189, -0.02240518, 0.7562376, 1, 1, 1, 1, 1,
-1.257274, 0.8233338, -1.278149, 0, 0, 1, 1, 1,
-1.248776, -0.709758, -2.532114, 1, 0, 0, 1, 1,
-1.242683, -1.513039, -1.492549, 1, 0, 0, 1, 1,
-1.241133, -0.5309874, -2.147614, 1, 0, 0, 1, 1,
-1.220487, 0.5390388, -0.1848618, 1, 0, 0, 1, 1,
-1.215125, -0.3659196, -1.500817, 1, 0, 0, 1, 1,
-1.21064, -0.3969906, -3.589816, 0, 0, 0, 1, 1,
-1.206427, 0.391071, -0.09436766, 0, 0, 0, 1, 1,
-1.205728, 0.162672, 0.116056, 0, 0, 0, 1, 1,
-1.205475, -0.4350976, -2.509901, 0, 0, 0, 1, 1,
-1.194442, -1.70775, -1.895335, 0, 0, 0, 1, 1,
-1.194026, 1.740811, -0.9089442, 0, 0, 0, 1, 1,
-1.193883, 0.3491905, 0.02807353, 0, 0, 0, 1, 1,
-1.192651, -0.03776856, -0.275346, 1, 1, 1, 1, 1,
-1.178518, 0.01008684, -3.241043, 1, 1, 1, 1, 1,
-1.177376, 0.382971, -0.7537626, 1, 1, 1, 1, 1,
-1.168929, 2.202527, -0.1638004, 1, 1, 1, 1, 1,
-1.165892, 1.585375, -0.6562046, 1, 1, 1, 1, 1,
-1.161704, -1.187688, -1.34522, 1, 1, 1, 1, 1,
-1.158435, 0.5463699, 0.177479, 1, 1, 1, 1, 1,
-1.153233, 0.508587, -1.406859, 1, 1, 1, 1, 1,
-1.151691, 0.3577248, -2.015514, 1, 1, 1, 1, 1,
-1.149768, 1.82982, -1.231541, 1, 1, 1, 1, 1,
-1.136272, -1.67935, -3.789397, 1, 1, 1, 1, 1,
-1.131685, -0.8578109, -3.171273, 1, 1, 1, 1, 1,
-1.116943, -1.087197, -3.999669, 1, 1, 1, 1, 1,
-1.114431, 2.426705, -1.608716, 1, 1, 1, 1, 1,
-1.110187, 1.079009, -0.8932717, 1, 1, 1, 1, 1,
-1.109677, -0.06202852, -1.202402, 0, 0, 1, 1, 1,
-1.099317, 0.9169334, -1.397009, 1, 0, 0, 1, 1,
-1.098961, -1.194032, -1.314599, 1, 0, 0, 1, 1,
-1.097941, -0.6497702, -2.700731, 1, 0, 0, 1, 1,
-1.097337, 0.400634, -2.267866, 1, 0, 0, 1, 1,
-1.094893, -0.168739, -1.15869, 1, 0, 0, 1, 1,
-1.094457, 0.5559778, -1.488704, 0, 0, 0, 1, 1,
-1.091285, -0.5998974, -2.00435, 0, 0, 0, 1, 1,
-1.089494, -0.01222775, -1.697969, 0, 0, 0, 1, 1,
-1.085368, 0.4429148, -2.145169, 0, 0, 0, 1, 1,
-1.08362, 0.07456572, -2.35102, 0, 0, 0, 1, 1,
-1.081183, 0.3278756, -2.407884, 0, 0, 0, 1, 1,
-1.079975, 0.4345668, -1.544297, 0, 0, 0, 1, 1,
-1.076811, -0.4125941, -2.830815, 1, 1, 1, 1, 1,
-1.075911, -0.7367445, -3.178867, 1, 1, 1, 1, 1,
-1.075909, 0.7574861, 1.367502, 1, 1, 1, 1, 1,
-1.074849, 2.621669, 0.02084017, 1, 1, 1, 1, 1,
-1.073635, -0.8234546, -1.692462, 1, 1, 1, 1, 1,
-1.059691, -0.4584213, -0.8943, 1, 1, 1, 1, 1,
-1.055343, -1.556033, -3.478879, 1, 1, 1, 1, 1,
-1.046447, 0.6829298, -0.6835349, 1, 1, 1, 1, 1,
-1.045607, -0.7747827, -2.695349, 1, 1, 1, 1, 1,
-1.041035, -0.9166679, -3.047833, 1, 1, 1, 1, 1,
-1.036363, 1.072032, -0.1529782, 1, 1, 1, 1, 1,
-1.035774, -0.6676446, -1.678186, 1, 1, 1, 1, 1,
-1.031488, 1.895609, -1.097725, 1, 1, 1, 1, 1,
-1.02779, -0.04608754, -1.230198, 1, 1, 1, 1, 1,
-1.020843, 0.3147592, -1.090318, 1, 1, 1, 1, 1,
-1.011048, -0.6334493, -1.54273, 0, 0, 1, 1, 1,
-0.9974383, 0.7283129, -0.3886552, 1, 0, 0, 1, 1,
-0.9971053, 0.3138463, -2.087014, 1, 0, 0, 1, 1,
-0.9926713, -0.8915794, -1.327511, 1, 0, 0, 1, 1,
-0.9909289, -0.2781713, 0.3937603, 1, 0, 0, 1, 1,
-0.9894882, -0.09189217, -2.299586, 1, 0, 0, 1, 1,
-0.9864742, 1.302445, 2.515613, 0, 0, 0, 1, 1,
-0.9822966, -0.548732, -2.249901, 0, 0, 0, 1, 1,
-0.9792781, -2.070116, -3.119215, 0, 0, 0, 1, 1,
-0.9781371, -0.483861, -1.027792, 0, 0, 0, 1, 1,
-0.9774373, 0.0475959, -2.610585, 0, 0, 0, 1, 1,
-0.9723793, 1.089481, -1.111918, 0, 0, 0, 1, 1,
-0.9699394, -0.1801716, -1.767939, 0, 0, 0, 1, 1,
-0.9671329, 0.01106886, -0.3594497, 1, 1, 1, 1, 1,
-0.9634772, -0.1255889, -1.638944, 1, 1, 1, 1, 1,
-0.9595849, 0.1977132, -1.456385, 1, 1, 1, 1, 1,
-0.955124, -1.04543, -3.164374, 1, 1, 1, 1, 1,
-0.9501132, -1.721408, -1.534994, 1, 1, 1, 1, 1,
-0.9493701, -1.555124, -2.125576, 1, 1, 1, 1, 1,
-0.9457859, 0.9994739, -0.8575799, 1, 1, 1, 1, 1,
-0.9455646, 0.1739634, -1.565271, 1, 1, 1, 1, 1,
-0.9256277, -0.03738586, -0.9767094, 1, 1, 1, 1, 1,
-0.9254347, 0.3992763, -0.650431, 1, 1, 1, 1, 1,
-0.9241543, 0.3781091, -0.6718844, 1, 1, 1, 1, 1,
-0.92037, -0.6478379, -2.155502, 1, 1, 1, 1, 1,
-0.9178948, 1.267334, -1.238348, 1, 1, 1, 1, 1,
-0.9167016, 1.542557, -1.377794, 1, 1, 1, 1, 1,
-0.9142802, 0.1311422, -3.171444, 1, 1, 1, 1, 1,
-0.9138377, -1.873058, -3.647332, 0, 0, 1, 1, 1,
-0.9111199, -0.216881, -1.413432, 1, 0, 0, 1, 1,
-0.9110661, -0.1710876, -1.577291, 1, 0, 0, 1, 1,
-0.9102728, -1.205594, -0.716256, 1, 0, 0, 1, 1,
-0.9056353, -0.8645839, -1.867427, 1, 0, 0, 1, 1,
-0.9036903, 0.2856225, -2.180205, 1, 0, 0, 1, 1,
-0.8999696, 0.6697568, -1.246547, 0, 0, 0, 1, 1,
-0.8917137, -0.2361297, -1.52554, 0, 0, 0, 1, 1,
-0.8900843, 0.5332065, -2.131655, 0, 0, 0, 1, 1,
-0.8882993, -1.251758, -3.868173, 0, 0, 0, 1, 1,
-0.8839958, 0.1751758, -2.12621, 0, 0, 0, 1, 1,
-0.8822499, 0.7206718, -1.273099, 0, 0, 0, 1, 1,
-0.8739488, -0.3429574, 0.2386601, 0, 0, 0, 1, 1,
-0.8712201, 2.248124, 1.057866, 1, 1, 1, 1, 1,
-0.8686628, -0.6993526, -1.025214, 1, 1, 1, 1, 1,
-0.8676566, -0.4690541, -2.147849, 1, 1, 1, 1, 1,
-0.8639501, 0.5864894, -1.248477, 1, 1, 1, 1, 1,
-0.857957, 0.003115645, -0.480998, 1, 1, 1, 1, 1,
-0.8554133, -0.2504044, -0.2300523, 1, 1, 1, 1, 1,
-0.8545344, 2.803831, 0.4908587, 1, 1, 1, 1, 1,
-0.8535908, -0.4248143, -2.04083, 1, 1, 1, 1, 1,
-0.8471983, -0.7864184, -2.605501, 1, 1, 1, 1, 1,
-0.8469041, -0.722649, -3.139038, 1, 1, 1, 1, 1,
-0.8353208, 0.08548272, -0.8521864, 1, 1, 1, 1, 1,
-0.8276132, 0.3443003, -0.9753803, 1, 1, 1, 1, 1,
-0.8229997, 0.2091831, -1.397452, 1, 1, 1, 1, 1,
-0.8224979, 0.6503836, -1.361292, 1, 1, 1, 1, 1,
-0.8002735, 0.578454, -0.05927243, 1, 1, 1, 1, 1,
-0.7991273, -0.07798808, -1.921393, 0, 0, 1, 1, 1,
-0.7968853, -1.326407, -2.785604, 1, 0, 0, 1, 1,
-0.7955123, 1.542594, -0.6367725, 1, 0, 0, 1, 1,
-0.794659, -0.5091921, -2.389143, 1, 0, 0, 1, 1,
-0.7861093, -0.06850959, -2.789699, 1, 0, 0, 1, 1,
-0.7853066, -0.2185841, -0.7707854, 1, 0, 0, 1, 1,
-0.7849271, -0.6593654, -2.76914, 0, 0, 0, 1, 1,
-0.7809492, 0.2986412, -2.783958, 0, 0, 0, 1, 1,
-0.7791654, -2.379428, -2.145691, 0, 0, 0, 1, 1,
-0.7775115, 0.4576371, 1.219928, 0, 0, 0, 1, 1,
-0.771015, -0.9524891, -2.818228, 0, 0, 0, 1, 1,
-0.7599236, 1.012411, -0.04047839, 0, 0, 0, 1, 1,
-0.7597717, -0.6239788, -3.488295, 0, 0, 0, 1, 1,
-0.7534284, -1.044957, -2.442353, 1, 1, 1, 1, 1,
-0.7506123, -0.0434613, -1.609326, 1, 1, 1, 1, 1,
-0.7496951, 0.1544716, -2.219645, 1, 1, 1, 1, 1,
-0.7452549, 1.001651, -1.165621, 1, 1, 1, 1, 1,
-0.742357, 1.590514, -1.750231, 1, 1, 1, 1, 1,
-0.7365183, 0.3115813, -1.405099, 1, 1, 1, 1, 1,
-0.732991, 0.6383034, -1.828115, 1, 1, 1, 1, 1,
-0.7239413, -0.1977083, -1.960261, 1, 1, 1, 1, 1,
-0.7224144, -0.1793478, -1.466095, 1, 1, 1, 1, 1,
-0.7222996, 0.5259344, -1.291602, 1, 1, 1, 1, 1,
-0.7154925, 2.070048, 0.1811577, 1, 1, 1, 1, 1,
-0.7143183, 0.603281, 0.09749169, 1, 1, 1, 1, 1,
-0.7137183, 0.1494291, -1.036477, 1, 1, 1, 1, 1,
-0.7130544, 0.2644418, -0.7689897, 1, 1, 1, 1, 1,
-0.7124594, 1.244314, -0.9389988, 1, 1, 1, 1, 1,
-0.71047, -0.6500179, -4.70977, 0, 0, 1, 1, 1,
-0.7085363, -0.47911, -3.369736, 1, 0, 0, 1, 1,
-0.6991307, 0.428805, -1.439705, 1, 0, 0, 1, 1,
-0.6973937, 0.3103707, -2.295068, 1, 0, 0, 1, 1,
-0.6929956, -3.093907, -2.721332, 1, 0, 0, 1, 1,
-0.6915256, -1.156612, -2.857468, 1, 0, 0, 1, 1,
-0.6892099, -1.497318, 0.1448842, 0, 0, 0, 1, 1,
-0.6874614, 1.771883, 0.8859965, 0, 0, 0, 1, 1,
-0.6853074, -1.762094, -3.043003, 0, 0, 0, 1, 1,
-0.6842359, 0.9997829, -1.135217, 0, 0, 0, 1, 1,
-0.6832653, 0.6503628, -2.419497, 0, 0, 0, 1, 1,
-0.6828497, 0.1957097, -2.018435, 0, 0, 0, 1, 1,
-0.6737074, 1.404732, 0.686163, 0, 0, 0, 1, 1,
-0.6703283, 0.3958398, -1.36667, 1, 1, 1, 1, 1,
-0.6682875, -0.5492253, -2.855904, 1, 1, 1, 1, 1,
-0.6653225, -1.037641, -3.156492, 1, 1, 1, 1, 1,
-0.6612276, 1.840988, 0.08197793, 1, 1, 1, 1, 1,
-0.6591732, 0.08880236, -0.4356738, 1, 1, 1, 1, 1,
-0.6588992, 0.7937564, -0.6763449, 1, 1, 1, 1, 1,
-0.6512371, -1.215895, -3.70484, 1, 1, 1, 1, 1,
-0.6452551, -0.3864354, -2.148828, 1, 1, 1, 1, 1,
-0.6431851, 0.1288799, -1.456061, 1, 1, 1, 1, 1,
-0.6388351, 0.5926777, -0.107465, 1, 1, 1, 1, 1,
-0.634033, 0.2425499, -2.174809, 1, 1, 1, 1, 1,
-0.6330699, -0.02127115, -1.247581, 1, 1, 1, 1, 1,
-0.6307544, 0.9043405, -1.0827, 1, 1, 1, 1, 1,
-0.6212841, 1.037751, -1.11218, 1, 1, 1, 1, 1,
-0.6153364, 0.5701228, -1.919809, 1, 1, 1, 1, 1,
-0.6121569, -0.854407, -4.775449, 0, 0, 1, 1, 1,
-0.6099151, 1.326121, 0.07527902, 1, 0, 0, 1, 1,
-0.6029875, 0.1464726, -1.630518, 1, 0, 0, 1, 1,
-0.6013824, -0.28013, -1.392852, 1, 0, 0, 1, 1,
-0.5988562, -1.417251, -1.630962, 1, 0, 0, 1, 1,
-0.5956913, 0.7935611, -0.2814518, 1, 0, 0, 1, 1,
-0.5951008, -0.1229557, -2.276452, 0, 0, 0, 1, 1,
-0.5936123, -1.105968, -1.861257, 0, 0, 0, 1, 1,
-0.5902777, 0.8551265, 0.3148746, 0, 0, 0, 1, 1,
-0.5901369, 0.02598955, 0.5341496, 0, 0, 0, 1, 1,
-0.5884996, -0.6905669, -2.262052, 0, 0, 0, 1, 1,
-0.5869363, -0.30488, -2.064734, 0, 0, 0, 1, 1,
-0.5850726, -0.0006359208, -1.809916, 0, 0, 0, 1, 1,
-0.5827945, 0.2728947, -1.325041, 1, 1, 1, 1, 1,
-0.5824528, -1.87261, -3.029644, 1, 1, 1, 1, 1,
-0.5813165, -0.7546279, -2.202985, 1, 1, 1, 1, 1,
-0.5795959, 1.558402, -1.049985, 1, 1, 1, 1, 1,
-0.572478, 1.22279, -0.2661247, 1, 1, 1, 1, 1,
-0.5687981, 2.864318, 0.9775807, 1, 1, 1, 1, 1,
-0.567606, 0.2123104, -0.864256, 1, 1, 1, 1, 1,
-0.5665985, -0.283811, -3.052701, 1, 1, 1, 1, 1,
-0.566237, 0.02069302, -2.13435, 1, 1, 1, 1, 1,
-0.56212, -0.3431825, -1.517738, 1, 1, 1, 1, 1,
-0.5615532, 0.08393474, -2.515615, 1, 1, 1, 1, 1,
-0.5583681, -0.7437763, -4.360542, 1, 1, 1, 1, 1,
-0.5556315, -0.2383823, -1.685483, 1, 1, 1, 1, 1,
-0.5555371, -1.422951, -4.040914, 1, 1, 1, 1, 1,
-0.5516218, 0.8922949, 0.5155864, 1, 1, 1, 1, 1,
-0.5507934, -1.139152, -3.566244, 0, 0, 1, 1, 1,
-0.5504022, -0.9394153, -4.609197, 1, 0, 0, 1, 1,
-0.5439456, 1.029675, -0.1397262, 1, 0, 0, 1, 1,
-0.5410285, 1.511461, 0.6427151, 1, 0, 0, 1, 1,
-0.5384182, 0.05773113, -0.2239784, 1, 0, 0, 1, 1,
-0.5377262, -1.636817, -0.7080067, 1, 0, 0, 1, 1,
-0.535673, 1.126066, -0.6246547, 0, 0, 0, 1, 1,
-0.5278651, 0.2920539, -2.208686, 0, 0, 0, 1, 1,
-0.5260418, 0.4373946, -2.500871, 0, 0, 0, 1, 1,
-0.5188144, -0.8407259, -2.096962, 0, 0, 0, 1, 1,
-0.517801, -0.4501008, -1.721527, 0, 0, 0, 1, 1,
-0.5167726, -0.1296449, -1.779263, 0, 0, 0, 1, 1,
-0.5150288, 0.4614957, 0.05329374, 0, 0, 0, 1, 1,
-0.5139804, -1.625338, -1.563092, 1, 1, 1, 1, 1,
-0.5110134, -0.2228812, -1.728024, 1, 1, 1, 1, 1,
-0.5104647, 0.5245105, -1.312105, 1, 1, 1, 1, 1,
-0.5090832, -0.7227049, -2.38035, 1, 1, 1, 1, 1,
-0.5077612, -0.5681052, -4.093699, 1, 1, 1, 1, 1,
-0.5072519, 0.8890597, 0.1373084, 1, 1, 1, 1, 1,
-0.5032174, -0.3689672, -3.908827, 1, 1, 1, 1, 1,
-0.5003406, 0.2989361, -0.3658776, 1, 1, 1, 1, 1,
-0.4997441, 1.208158, -1.863673, 1, 1, 1, 1, 1,
-0.4878402, -1.350365, -3.104081, 1, 1, 1, 1, 1,
-0.4864489, -1.057642, -3.12657, 1, 1, 1, 1, 1,
-0.4858503, 0.09130922, -0.3732055, 1, 1, 1, 1, 1,
-0.4841515, 1.029793, -2.162291, 1, 1, 1, 1, 1,
-0.4829172, -2.339224, -2.677121, 1, 1, 1, 1, 1,
-0.4826492, -1.111254, -2.509167, 1, 1, 1, 1, 1,
-0.4814873, 1.096224, 0.3752575, 0, 0, 1, 1, 1,
-0.4799265, -0.913183, -2.305579, 1, 0, 0, 1, 1,
-0.4780842, -1.355593, -3.94842, 1, 0, 0, 1, 1,
-0.4774086, 0.6115291, -0.8377557, 1, 0, 0, 1, 1,
-0.4752133, -0.9035442, -0.878967, 1, 0, 0, 1, 1,
-0.4703356, 0.4546628, -3.503444, 1, 0, 0, 1, 1,
-0.4696682, 0.7772288, -1.985136, 0, 0, 0, 1, 1,
-0.4655832, 0.7926993, 1.091342, 0, 0, 0, 1, 1,
-0.4632071, 0.6027815, -0.4229752, 0, 0, 0, 1, 1,
-0.4600927, 0.6769771, -1.877186, 0, 0, 0, 1, 1,
-0.4588008, 1.560688, -0.4599065, 0, 0, 0, 1, 1,
-0.4587962, -0.8965791, -2.545197, 0, 0, 0, 1, 1,
-0.4569583, -1.59693, -3.307503, 0, 0, 0, 1, 1,
-0.4560966, -0.1220959, -3.227488, 1, 1, 1, 1, 1,
-0.455561, -0.005144365, -0.4005869, 1, 1, 1, 1, 1,
-0.4430224, 0.08396542, -3.080826, 1, 1, 1, 1, 1,
-0.4184339, -0.1266685, -1.469679, 1, 1, 1, 1, 1,
-0.4147022, 2.052769, 0.7976741, 1, 1, 1, 1, 1,
-0.4030734, -1.583641, -3.346852, 1, 1, 1, 1, 1,
-0.4008459, -1.455833, -2.824018, 1, 1, 1, 1, 1,
-0.3981127, 1.248609, -1.413876, 1, 1, 1, 1, 1,
-0.3875433, -0.2049835, -3.790703, 1, 1, 1, 1, 1,
-0.3832788, 1.247247, 0.06075909, 1, 1, 1, 1, 1,
-0.3778455, -0.2151149, -0.5387179, 1, 1, 1, 1, 1,
-0.3725004, 0.4812922, -1.160453, 1, 1, 1, 1, 1,
-0.371435, -0.7012638, -1.705948, 1, 1, 1, 1, 1,
-0.3583813, 0.1366543, -2.272818, 1, 1, 1, 1, 1,
-0.3563032, -0.9693717, -3.526408, 1, 1, 1, 1, 1,
-0.3528198, 0.7737826, -1.355, 0, 0, 1, 1, 1,
-0.3447575, 1.046883, -0.6991041, 1, 0, 0, 1, 1,
-0.3382145, -0.8377839, -2.987853, 1, 0, 0, 1, 1,
-0.3365015, 1.166099, 0.7830764, 1, 0, 0, 1, 1,
-0.3257696, -0.3648885, -3.771621, 1, 0, 0, 1, 1,
-0.323902, -2.202414, -4.6304, 1, 0, 0, 1, 1,
-0.3238519, -0.9083779, -3.478345, 0, 0, 0, 1, 1,
-0.3226825, -1.30283, -3.591496, 0, 0, 0, 1, 1,
-0.3215468, 0.1786044, 0.04662869, 0, 0, 0, 1, 1,
-0.3203457, -0.3118745, -1.816796, 0, 0, 0, 1, 1,
-0.3147598, 0.2321233, -2.086856, 0, 0, 0, 1, 1,
-0.3135566, 0.3360602, 0.6153587, 0, 0, 0, 1, 1,
-0.3126113, -1.034244, -3.139699, 0, 0, 0, 1, 1,
-0.3109162, 0.4634795, -2.631309, 1, 1, 1, 1, 1,
-0.3106294, -0.3417985, -2.240152, 1, 1, 1, 1, 1,
-0.3080124, -0.6351626, -3.251893, 1, 1, 1, 1, 1,
-0.3052894, -0.8389055, -1.753808, 1, 1, 1, 1, 1,
-0.2993067, -0.8651034, -2.401999, 1, 1, 1, 1, 1,
-0.2955195, 0.8312802, 0.1762723, 1, 1, 1, 1, 1,
-0.295328, -1.204799, -1.04235, 1, 1, 1, 1, 1,
-0.2921397, 2.440537, 0.9146165, 1, 1, 1, 1, 1,
-0.2903167, -0.312734, -3.035154, 1, 1, 1, 1, 1,
-0.2901577, -0.7695165, -1.072654, 1, 1, 1, 1, 1,
-0.2876284, -2.275407, -2.993032, 1, 1, 1, 1, 1,
-0.2858358, 0.3838347, -1.057915, 1, 1, 1, 1, 1,
-0.2839437, -0.4407584, -4.321403, 1, 1, 1, 1, 1,
-0.2825336, 0.9496924, 0.1039082, 1, 1, 1, 1, 1,
-0.2824408, 0.7309667, -1.561333, 1, 1, 1, 1, 1,
-0.2820337, 0.5738804, -0.3104901, 0, 0, 1, 1, 1,
-0.2810627, 0.7509342, 0.8776648, 1, 0, 0, 1, 1,
-0.2793452, -0.8764635, -2.289181, 1, 0, 0, 1, 1,
-0.2749805, 1.789167, 1.023943, 1, 0, 0, 1, 1,
-0.2690441, -0.04874417, -1.698986, 1, 0, 0, 1, 1,
-0.2681471, 1.448016, -1.472039, 1, 0, 0, 1, 1,
-0.2663995, -0.6547199, -3.406577, 0, 0, 0, 1, 1,
-0.2662284, -1.302127, -2.012044, 0, 0, 0, 1, 1,
-0.2609381, 0.9149348, -0.8727484, 0, 0, 0, 1, 1,
-0.2593108, 2.090262, -0.7358662, 0, 0, 0, 1, 1,
-0.2586016, 0.9318205, 0.6710603, 0, 0, 0, 1, 1,
-0.2493196, -0.4222552, -2.97982, 0, 0, 0, 1, 1,
-0.2482203, -0.6913848, -2.589681, 0, 0, 0, 1, 1,
-0.2471405, -1.487294, -1.552108, 1, 1, 1, 1, 1,
-0.2455292, -0.9794795, -2.231029, 1, 1, 1, 1, 1,
-0.2431123, -0.2939367, -1.556414, 1, 1, 1, 1, 1,
-0.2419414, -1.083465, -1.676454, 1, 1, 1, 1, 1,
-0.239789, -1.745273, -2.368992, 1, 1, 1, 1, 1,
-0.2308843, 2.107618, -1.025149, 1, 1, 1, 1, 1,
-0.228446, 0.6460309, -0.2382854, 1, 1, 1, 1, 1,
-0.2267889, 0.2064252, -0.1262516, 1, 1, 1, 1, 1,
-0.2264727, -1.451933, -3.569, 1, 1, 1, 1, 1,
-0.2227796, -0.724294, -0.7104014, 1, 1, 1, 1, 1,
-0.2183196, 1.699341, -1.499323, 1, 1, 1, 1, 1,
-0.2170584, 0.8250023, -0.9854109, 1, 1, 1, 1, 1,
-0.2145646, -0.08015799, -0.5342581, 1, 1, 1, 1, 1,
-0.213564, -2.280923, -3.918693, 1, 1, 1, 1, 1,
-0.2125217, 1.515694, -0.3348857, 1, 1, 1, 1, 1,
-0.2117192, 0.3209039, 0.3221823, 0, 0, 1, 1, 1,
-0.2070576, -0.296022, -3.58995, 1, 0, 0, 1, 1,
-0.2044531, 1.319787, -0.6479314, 1, 0, 0, 1, 1,
-0.2043118, 1.728593, 1.217792, 1, 0, 0, 1, 1,
-0.2031911, -0.9451419, -2.146388, 1, 0, 0, 1, 1,
-0.2008219, 1.725246, 0.2918515, 1, 0, 0, 1, 1,
-0.2006721, 0.5857724, -1.104938, 0, 0, 0, 1, 1,
-0.2000605, 0.3978607, 0.9949296, 0, 0, 0, 1, 1,
-0.1994987, 0.8312208, -0.1969501, 0, 0, 0, 1, 1,
-0.1967138, -1.302104, -2.592302, 0, 0, 0, 1, 1,
-0.1956721, -0.1257186, 0.9125028, 0, 0, 0, 1, 1,
-0.1951613, -2.60832, -2.307058, 0, 0, 0, 1, 1,
-0.1948622, -0.69282, -2.40066, 0, 0, 0, 1, 1,
-0.1893768, 2.081483, -1.370145, 1, 1, 1, 1, 1,
-0.184767, 0.9409203, -1.045594, 1, 1, 1, 1, 1,
-0.1838037, -1.884213, -2.500128, 1, 1, 1, 1, 1,
-0.181957, 0.03662468, 0.1566471, 1, 1, 1, 1, 1,
-0.1784856, -0.8551452, -4.752334, 1, 1, 1, 1, 1,
-0.1764866, -0.04191758, -3.015255, 1, 1, 1, 1, 1,
-0.1753408, 0.8162208, 0.3491319, 1, 1, 1, 1, 1,
-0.1745001, -0.2615544, -3.508054, 1, 1, 1, 1, 1,
-0.1731248, 0.6530533, -2.910534, 1, 1, 1, 1, 1,
-0.169861, 0.8049926, -0.2206538, 1, 1, 1, 1, 1,
-0.1627048, -0.04884553, -0.7260203, 1, 1, 1, 1, 1,
-0.157178, -0.2750958, -3.371907, 1, 1, 1, 1, 1,
-0.1555001, 0.3846145, 0.4714718, 1, 1, 1, 1, 1,
-0.1544492, 0.383477, -2.264174, 1, 1, 1, 1, 1,
-0.153822, 0.0416302, -0.4925986, 1, 1, 1, 1, 1,
-0.1533878, -0.2834535, -1.83868, 0, 0, 1, 1, 1,
-0.1518281, -0.2236571, -2.804654, 1, 0, 0, 1, 1,
-0.1489991, 1.412592, -0.1852829, 1, 0, 0, 1, 1,
-0.1468999, 0.9196391, 0.6436715, 1, 0, 0, 1, 1,
-0.1452025, 2.113875, -1.73204, 1, 0, 0, 1, 1,
-0.1446323, -1.484357, -2.049249, 1, 0, 0, 1, 1,
-0.1439182, -0.3665472, -2.358647, 0, 0, 0, 1, 1,
-0.1438435, -1.030568, -4.132998, 0, 0, 0, 1, 1,
-0.1431309, -0.8331324, -1.966259, 0, 0, 0, 1, 1,
-0.1425837, 0.1122457, -0.01020248, 0, 0, 0, 1, 1,
-0.1356372, 0.9988464, -0.3230717, 0, 0, 0, 1, 1,
-0.1322366, -0.2549349, -3.43308, 0, 0, 0, 1, 1,
-0.1313307, -0.2899524, -1.21952, 0, 0, 0, 1, 1,
-0.1295529, 0.8588568, 0.6251206, 1, 1, 1, 1, 1,
-0.1266807, 1.698853, -1.380224, 1, 1, 1, 1, 1,
-0.1262573, 0.07261083, -1.143101, 1, 1, 1, 1, 1,
-0.1228693, 1.25275, -1.623669, 1, 1, 1, 1, 1,
-0.1224111, -0.497003, -2.970661, 1, 1, 1, 1, 1,
-0.1211923, 0.5311016, -0.5771501, 1, 1, 1, 1, 1,
-0.1204456, 1.764384, 0.08992659, 1, 1, 1, 1, 1,
-0.1174409, 1.581647, 0.2893982, 1, 1, 1, 1, 1,
-0.1174041, -1.231818, -2.90407, 1, 1, 1, 1, 1,
-0.1149203, -0.7523553, -4.127499, 1, 1, 1, 1, 1,
-0.11378, 0.8317412, -0.7530649, 1, 1, 1, 1, 1,
-0.1133698, -0.2335562, -1.603914, 1, 1, 1, 1, 1,
-0.1100583, -0.4588448, -2.616419, 1, 1, 1, 1, 1,
-0.1059339, 0.2012712, -1.655171, 1, 1, 1, 1, 1,
-0.09990547, 1.20673, 0.720526, 1, 1, 1, 1, 1,
-0.09447746, -0.7829176, -2.661191, 0, 0, 1, 1, 1,
-0.09372598, 0.5596246, -0.7427693, 1, 0, 0, 1, 1,
-0.09274132, 0.7584234, 1.53727, 1, 0, 0, 1, 1,
-0.09266439, 0.09317575, -2.727998, 1, 0, 0, 1, 1,
-0.08842838, -0.9119342, -1.473049, 1, 0, 0, 1, 1,
-0.08753921, -0.4196109, -3.756159, 1, 0, 0, 1, 1,
-0.0839505, 0.1525386, -0.2135608, 0, 0, 0, 1, 1,
-0.08241227, -0.1638749, -2.673747, 0, 0, 0, 1, 1,
-0.08179114, 0.2512758, -1.232899, 0, 0, 0, 1, 1,
-0.08067778, -0.4754944, -3.109729, 0, 0, 0, 1, 1,
-0.07770591, 0.7907909, -2.105322, 0, 0, 0, 1, 1,
-0.07365706, -0.009323739, -0.6627834, 0, 0, 0, 1, 1,
-0.06769663, -0.977708, -2.441743, 0, 0, 0, 1, 1,
-0.06726383, -0.9421356, -2.573334, 1, 1, 1, 1, 1,
-0.0663496, 1.168186, -0.9480479, 1, 1, 1, 1, 1,
-0.06334801, -1.265783, -3.416624, 1, 1, 1, 1, 1,
-0.0554059, -1.438704, -2.39649, 1, 1, 1, 1, 1,
-0.05438428, -0.7836367, -1.448315, 1, 1, 1, 1, 1,
-0.05402562, 0.1130913, -1.681921, 1, 1, 1, 1, 1,
-0.05060086, -0.9794846, -3.069362, 1, 1, 1, 1, 1,
-0.05032398, 0.4406249, 1.495857, 1, 1, 1, 1, 1,
-0.04984013, -0.7275435, -0.9829723, 1, 1, 1, 1, 1,
-0.04898054, 2.332597, -1.850692, 1, 1, 1, 1, 1,
-0.0487612, -0.6588157, -3.501453, 1, 1, 1, 1, 1,
-0.04745192, 0.9754081, 0.8355844, 1, 1, 1, 1, 1,
-0.04220466, -0.8043109, -1.569183, 1, 1, 1, 1, 1,
-0.04076852, 2.23208, 0.3285871, 1, 1, 1, 1, 1,
-0.04001853, 0.113122, -1.50679, 1, 1, 1, 1, 1,
-0.03973491, 1.042458, 1.61936, 0, 0, 1, 1, 1,
-0.03631939, 0.3302651, 1.142766, 1, 0, 0, 1, 1,
-0.03369815, 2.076555, -0.7459257, 1, 0, 0, 1, 1,
-0.02603379, -0.3518658, -3.635234, 1, 0, 0, 1, 1,
-0.02418676, 1.238904, -0.9422797, 1, 0, 0, 1, 1,
-0.01832437, 2.106926, 1.527586, 1, 0, 0, 1, 1,
-0.01715881, 0.958515, 1.589768, 0, 0, 0, 1, 1,
-0.0160276, 0.6480362, -0.06882984, 0, 0, 0, 1, 1,
-0.01441083, -1.885354, -4.035899, 0, 0, 0, 1, 1,
-0.01362318, -0.6856654, -3.149379, 0, 0, 0, 1, 1,
-0.01165491, 2.950638, -0.1477454, 0, 0, 0, 1, 1,
-0.00835913, -1.910718, -2.451468, 0, 0, 0, 1, 1,
-0.00672203, -1.599322, -3.947489, 0, 0, 0, 1, 1,
-0.005147461, -0.5308235, -4.149168, 1, 1, 1, 1, 1,
-0.004871419, 0.2258784, 0.418103, 1, 1, 1, 1, 1,
-0.002929881, 2.350878, 0.3103176, 1, 1, 1, 1, 1,
-0.002073203, -1.345532, -3.017863, 1, 1, 1, 1, 1,
-0.001732607, 1.202996, -0.2436158, 1, 1, 1, 1, 1,
0.0006535433, 0.7228038, 0.004639113, 1, 1, 1, 1, 1,
0.001056532, 1.268233, -0.5712304, 1, 1, 1, 1, 1,
0.00758854, 0.2467115, 0.6422344, 1, 1, 1, 1, 1,
0.01162925, 0.3275378, 0.1825869, 1, 1, 1, 1, 1,
0.01928963, -0.454437, 4.270609, 1, 1, 1, 1, 1,
0.02231251, -0.7886992, 3.940361, 1, 1, 1, 1, 1,
0.02490576, 0.7956364, 0.2186791, 1, 1, 1, 1, 1,
0.02575433, 1.65036, -1.899133, 1, 1, 1, 1, 1,
0.03032546, -0.01485746, 3.369486, 1, 1, 1, 1, 1,
0.03169339, 0.009622568, -0.9262307, 1, 1, 1, 1, 1,
0.03362586, -0.0703662, 4.716697, 0, 0, 1, 1, 1,
0.0393438, 1.356317, -0.4982257, 1, 0, 0, 1, 1,
0.04293201, -0.7336731, 0.8366463, 1, 0, 0, 1, 1,
0.04354205, -0.2940882, 5.105609, 1, 0, 0, 1, 1,
0.04438875, 0.4570556, 1.428032, 1, 0, 0, 1, 1,
0.0459385, -1.235653, 4.703427, 1, 0, 0, 1, 1,
0.05470518, -1.081709, 2.70015, 0, 0, 0, 1, 1,
0.05516326, 0.2727919, -0.5925288, 0, 0, 0, 1, 1,
0.05710835, 0.6335659, -0.1364486, 0, 0, 0, 1, 1,
0.05727604, -0.5674855, 4.16884, 0, 0, 0, 1, 1,
0.06262597, -0.4765103, 2.362399, 0, 0, 0, 1, 1,
0.06396859, 1.336182, 0.4521064, 0, 0, 0, 1, 1,
0.07319741, 0.06585214, 1.222901, 0, 0, 0, 1, 1,
0.0743934, 1.003043, 0.7197129, 1, 1, 1, 1, 1,
0.07598514, -1.434536, 4.034974, 1, 1, 1, 1, 1,
0.07704917, 0.6461369, -0.8255181, 1, 1, 1, 1, 1,
0.07999144, 1.165241, 0.1743978, 1, 1, 1, 1, 1,
0.08143515, 1.121487, -0.1410429, 1, 1, 1, 1, 1,
0.08381035, 1.190566, -0.8639213, 1, 1, 1, 1, 1,
0.08493164, 1.351539, -1.987373, 1, 1, 1, 1, 1,
0.09142614, 1.01077, -0.3782538, 1, 1, 1, 1, 1,
0.09388289, -0.06364805, 1.594117, 1, 1, 1, 1, 1,
0.1000741, -0.2862625, 2.059696, 1, 1, 1, 1, 1,
0.100593, 0.3318446, -1.274123, 1, 1, 1, 1, 1,
0.1015574, 0.1294303, 1.465753, 1, 1, 1, 1, 1,
0.102008, -1.325881, 2.135005, 1, 1, 1, 1, 1,
0.1035126, -1.628016, 0.5157255, 1, 1, 1, 1, 1,
0.1043883, 0.03980662, -0.3570186, 1, 1, 1, 1, 1,
0.1096914, 0.1633702, -0.008388944, 0, 0, 1, 1, 1,
0.1158281, -0.9292582, 5.025513, 1, 0, 0, 1, 1,
0.1166156, 2.082471, -1.178274, 1, 0, 0, 1, 1,
0.1260645, -0.50066, 2.200546, 1, 0, 0, 1, 1,
0.1289281, 0.3122526, 1.357204, 1, 0, 0, 1, 1,
0.1366343, 0.1729661, -0.2084602, 1, 0, 0, 1, 1,
0.137921, -0.8244528, 2.060585, 0, 0, 0, 1, 1,
0.1379298, 0.6638367, -1.101028, 0, 0, 0, 1, 1,
0.1391339, 0.3136663, 2.522907, 0, 0, 0, 1, 1,
0.1496941, 0.7382571, 1.759016, 0, 0, 0, 1, 1,
0.1500806, -0.0104158, 0.9301508, 0, 0, 0, 1, 1,
0.1500819, 1.05032, -1.669474, 0, 0, 0, 1, 1,
0.1555537, 1.781185, 0.03650472, 0, 0, 0, 1, 1,
0.1564428, -0.9873421, 1.775155, 1, 1, 1, 1, 1,
0.1621211, -0.7735794, 1.215421, 1, 1, 1, 1, 1,
0.1625711, -0.730542, 2.99941, 1, 1, 1, 1, 1,
0.1633631, -0.2810953, 2.163095, 1, 1, 1, 1, 1,
0.1672417, 0.51982, -0.07300493, 1, 1, 1, 1, 1,
0.1714491, 0.8720863, 1.847573, 1, 1, 1, 1, 1,
0.1727738, 0.5557786, -0.5116276, 1, 1, 1, 1, 1,
0.1741759, -0.5742696, 2.14114, 1, 1, 1, 1, 1,
0.1743009, -0.6075712, 2.569303, 1, 1, 1, 1, 1,
0.1780539, 0.5260036, 0.1679995, 1, 1, 1, 1, 1,
0.1787928, 0.06560852, 1.434305, 1, 1, 1, 1, 1,
0.1792736, -0.5785642, 3.476913, 1, 1, 1, 1, 1,
0.1811249, -0.6693308, 2.146696, 1, 1, 1, 1, 1,
0.1842901, 1.018452, -0.4003493, 1, 1, 1, 1, 1,
0.1915386, -1.208033, 3.307048, 1, 1, 1, 1, 1,
0.1921341, 1.191547, 0.2083185, 0, 0, 1, 1, 1,
0.203201, -0.4195834, 2.553698, 1, 0, 0, 1, 1,
0.2064581, 0.2871517, 1.4463, 1, 0, 0, 1, 1,
0.2087424, 0.4241184, -0.3521609, 1, 0, 0, 1, 1,
0.2113022, -0.1540346, 3.297905, 1, 0, 0, 1, 1,
0.2126974, 1.091251, 0.8727095, 1, 0, 0, 1, 1,
0.213294, 0.2600828, 1.676412, 0, 0, 0, 1, 1,
0.2217364, -0.4872344, 3.010545, 0, 0, 0, 1, 1,
0.2221172, 0.3165288, 1.716312, 0, 0, 0, 1, 1,
0.2239256, 0.7854493, 1.174427, 0, 0, 0, 1, 1,
0.2280945, -0.003550597, 0.1414173, 0, 0, 0, 1, 1,
0.2338085, -1.963181, 3.450848, 0, 0, 0, 1, 1,
0.2350518, -1.214068, 3.868749, 0, 0, 0, 1, 1,
0.2354827, 1.935618, -1.697243, 1, 1, 1, 1, 1,
0.2401933, -0.2611777, 2.507445, 1, 1, 1, 1, 1,
0.2430959, -2.524618, 1.969091, 1, 1, 1, 1, 1,
0.2457929, -0.2401958, 3.776074, 1, 1, 1, 1, 1,
0.2468875, 0.3207974, 1.590623, 1, 1, 1, 1, 1,
0.2483715, -1.196267, 1.88739, 1, 1, 1, 1, 1,
0.2490553, -0.6603283, 2.624964, 1, 1, 1, 1, 1,
0.2507431, -0.6367565, 2.810802, 1, 1, 1, 1, 1,
0.2587218, 0.333915, 1.315956, 1, 1, 1, 1, 1,
0.2587445, 0.9514349, 0.4169138, 1, 1, 1, 1, 1,
0.2665314, 0.1131804, 0.5287294, 1, 1, 1, 1, 1,
0.2696098, 0.3527054, 0.2226262, 1, 1, 1, 1, 1,
0.2703114, 1.845456, 0.2351321, 1, 1, 1, 1, 1,
0.2741758, 1.055612, 0.5817403, 1, 1, 1, 1, 1,
0.2750371, 0.6227686, 1.631475, 1, 1, 1, 1, 1,
0.2810131, -0.7606126, 4.139536, 0, 0, 1, 1, 1,
0.289926, -0.6015424, 1.256734, 1, 0, 0, 1, 1,
0.2915431, -0.2577071, 2.506836, 1, 0, 0, 1, 1,
0.2928582, 0.8187762, 1.808783, 1, 0, 0, 1, 1,
0.2939989, -0.4173913, 2.121667, 1, 0, 0, 1, 1,
0.2951015, 2.115108, -0.9023494, 1, 0, 0, 1, 1,
0.3018183, -0.8492206, 1.154704, 0, 0, 0, 1, 1,
0.3022084, 1.098927, -0.8194787, 0, 0, 0, 1, 1,
0.3086731, -1.177024, 5.347854, 0, 0, 0, 1, 1,
0.3138297, -0.5131947, 1.221236, 0, 0, 0, 1, 1,
0.3185888, 0.2926225, 1.40937, 0, 0, 0, 1, 1,
0.3225198, -1.030116, 3.727273, 0, 0, 0, 1, 1,
0.3239548, -1.106631, 0.2176665, 0, 0, 0, 1, 1,
0.3316316, 0.8744406, -0.2260842, 1, 1, 1, 1, 1,
0.3364702, -0.5627485, 1.652717, 1, 1, 1, 1, 1,
0.3395982, -1.516294, 2.157173, 1, 1, 1, 1, 1,
0.3399475, 0.2490565, -0.6358767, 1, 1, 1, 1, 1,
0.3413535, 0.2773725, 1.028916, 1, 1, 1, 1, 1,
0.3421069, 0.0758815, 2.298304, 1, 1, 1, 1, 1,
0.3438346, 0.3210379, 0.8369493, 1, 1, 1, 1, 1,
0.3458629, -1.757751, 2.912305, 1, 1, 1, 1, 1,
0.35387, 0.03691268, 1.455396, 1, 1, 1, 1, 1,
0.360824, 1.310024, 1.014965, 1, 1, 1, 1, 1,
0.3612685, 0.9223614, 0.2938989, 1, 1, 1, 1, 1,
0.3620814, -0.7294315, 2.195864, 1, 1, 1, 1, 1,
0.3642341, -1.790906, 3.368792, 1, 1, 1, 1, 1,
0.3820294, -0.320922, 2.562396, 1, 1, 1, 1, 1,
0.3831594, -0.5127037, 4.330871, 1, 1, 1, 1, 1,
0.384451, -1.20886, 2.457083, 0, 0, 1, 1, 1,
0.3925023, 0.6435975, 0.02209885, 1, 0, 0, 1, 1,
0.392564, -0.753745, 3.581605, 1, 0, 0, 1, 1,
0.392971, -1.038416, 3.097471, 1, 0, 0, 1, 1,
0.3948219, 1.421776, 0.1685225, 1, 0, 0, 1, 1,
0.4011317, 0.3157848, -1.127327, 1, 0, 0, 1, 1,
0.4042042, 0.1033734, 1.585721, 0, 0, 0, 1, 1,
0.4044687, 1.804228, -0.05540806, 0, 0, 0, 1, 1,
0.405586, 0.6813307, 1.156368, 0, 0, 0, 1, 1,
0.4058185, -0.8299929, 2.699006, 0, 0, 0, 1, 1,
0.4063158, -0.4460084, 1.783449, 0, 0, 0, 1, 1,
0.4078242, -1.409567, 3.047115, 0, 0, 0, 1, 1,
0.4169234, -1.116215, 2.020871, 0, 0, 0, 1, 1,
0.4210193, -0.5826029, 3.931364, 1, 1, 1, 1, 1,
0.4226637, -0.1327957, 1.500174, 1, 1, 1, 1, 1,
0.42646, -0.04370465, 1.374478, 1, 1, 1, 1, 1,
0.4294177, -0.7738581, 1.179549, 1, 1, 1, 1, 1,
0.4331727, 1.659441, 0.670073, 1, 1, 1, 1, 1,
0.438377, -1.607815, 2.644555, 1, 1, 1, 1, 1,
0.4409015, 0.2722179, 3.473838, 1, 1, 1, 1, 1,
0.4415739, 0.3290841, 1.937946, 1, 1, 1, 1, 1,
0.4455885, -0.06089123, 2.015772, 1, 1, 1, 1, 1,
0.4495017, 0.8689469, -0.345965, 1, 1, 1, 1, 1,
0.4571183, -2.082524, 2.975965, 1, 1, 1, 1, 1,
0.4630627, 0.04698657, 1.584548, 1, 1, 1, 1, 1,
0.4636524, 0.05651573, 0.01835844, 1, 1, 1, 1, 1,
0.4655368, 0.3624154, 1.95512, 1, 1, 1, 1, 1,
0.4671567, 1.475361, -0.6067924, 1, 1, 1, 1, 1,
0.4690984, -1.530117, 1.922506, 0, 0, 1, 1, 1,
0.4698875, 0.3136226, 1.248694, 1, 0, 0, 1, 1,
0.4738743, -1.346195, 2.154701, 1, 0, 0, 1, 1,
0.4760009, 0.556801, 1.043402, 1, 0, 0, 1, 1,
0.4819941, 0.4289685, -0.3302776, 1, 0, 0, 1, 1,
0.4858786, -0.2671712, 1.892067, 1, 0, 0, 1, 1,
0.4879073, -0.2391624, 2.213006, 0, 0, 0, 1, 1,
0.4893176, -0.3249075, 2.698914, 0, 0, 0, 1, 1,
0.4905245, -0.3328484, 2.966928, 0, 0, 0, 1, 1,
0.4909502, 1.507, -0.5773031, 0, 0, 0, 1, 1,
0.4915444, -0.7349681, 4.541149, 0, 0, 0, 1, 1,
0.4928196, 0.1665075, 0.8636688, 0, 0, 0, 1, 1,
0.494262, -0.2267019, 1.611425, 0, 0, 0, 1, 1,
0.4956761, 0.4158337, -0.7757047, 1, 1, 1, 1, 1,
0.5088611, 1.378072, -0.1111024, 1, 1, 1, 1, 1,
0.5094505, 0.05737915, 1.85029, 1, 1, 1, 1, 1,
0.5111427, 0.7502505, 0.5282971, 1, 1, 1, 1, 1,
0.5114984, -0.06931736, 0.3986436, 1, 1, 1, 1, 1,
0.5117495, 0.4026615, -0.3936304, 1, 1, 1, 1, 1,
0.5128902, -0.2411698, 3.104978, 1, 1, 1, 1, 1,
0.516548, -0.4029476, 3.650068, 1, 1, 1, 1, 1,
0.5252482, -0.6133314, 3.342417, 1, 1, 1, 1, 1,
0.5322128, -0.04578169, 2.210117, 1, 1, 1, 1, 1,
0.5392958, -0.3491725, 2.061485, 1, 1, 1, 1, 1,
0.5416006, -1.262474, 2.408228, 1, 1, 1, 1, 1,
0.5442796, 0.7827613, 0.7933291, 1, 1, 1, 1, 1,
0.5451297, 0.2506255, 0.023787, 1, 1, 1, 1, 1,
0.5464648, 0.2496889, 0.05644995, 1, 1, 1, 1, 1,
0.5515662, 2.010617, -1.146124, 0, 0, 1, 1, 1,
0.5531536, -0.3558657, 2.016518, 1, 0, 0, 1, 1,
0.5532668, 0.5417519, 0.5679572, 1, 0, 0, 1, 1,
0.5545478, 1.979091, 0.5137105, 1, 0, 0, 1, 1,
0.5551894, 0.2220002, 0.7597311, 1, 0, 0, 1, 1,
0.5580018, -0.008046501, 0.5172884, 1, 0, 0, 1, 1,
0.559423, -1.160074, 1.380272, 0, 0, 0, 1, 1,
0.5670567, 0.6585771, 1.318533, 0, 0, 0, 1, 1,
0.5676058, 0.5388438, 2.088406, 0, 0, 0, 1, 1,
0.5696011, -0.4674466, 1.389994, 0, 0, 0, 1, 1,
0.5702776, 0.5143954, -0.93716, 0, 0, 0, 1, 1,
0.5713886, 0.826576, 0.3160385, 0, 0, 0, 1, 1,
0.5744473, 0.2164375, -0.192818, 0, 0, 0, 1, 1,
0.5841509, -0.952036, 1.939232, 1, 1, 1, 1, 1,
0.5844606, -0.2239167, 1.089932, 1, 1, 1, 1, 1,
0.5845974, -0.1908984, 3.001953, 1, 1, 1, 1, 1,
0.5867646, 1.361955, 0.6873133, 1, 1, 1, 1, 1,
0.5925336, 0.3357944, 0.9416012, 1, 1, 1, 1, 1,
0.5957784, -0.1752625, 2.443016, 1, 1, 1, 1, 1,
0.6000517, -0.4232798, 2.433979, 1, 1, 1, 1, 1,
0.6001995, 0.6412715, 0.6285027, 1, 1, 1, 1, 1,
0.6032524, 0.5133757, 0.04994531, 1, 1, 1, 1, 1,
0.6034075, -0.3050227, 3.979182, 1, 1, 1, 1, 1,
0.6105787, -0.5177888, 1.895223, 1, 1, 1, 1, 1,
0.6132683, 1.414864, -0.7156875, 1, 1, 1, 1, 1,
0.6196698, 0.4473604, 0.6646284, 1, 1, 1, 1, 1,
0.6215169, -0.6873215, 4.151868, 1, 1, 1, 1, 1,
0.6277027, -0.2476082, 3.025984, 1, 1, 1, 1, 1,
0.6278414, -0.7964191, 4.550489, 0, 0, 1, 1, 1,
0.6285386, -1.245592, 2.396574, 1, 0, 0, 1, 1,
0.6345964, 0.05662434, 1.892739, 1, 0, 0, 1, 1,
0.6423109, -1.127103, 2.823088, 1, 0, 0, 1, 1,
0.6437451, 1.202091, 2.489717, 1, 0, 0, 1, 1,
0.6438454, 0.4758119, 1.652135, 1, 0, 0, 1, 1,
0.6452135, -0.1639803, 1.013778, 0, 0, 0, 1, 1,
0.6454288, 1.03238, 1.345172, 0, 0, 0, 1, 1,
0.650113, -0.4962189, 0.8043491, 0, 0, 0, 1, 1,
0.6540378, -2.345232, 2.462027, 0, 0, 0, 1, 1,
0.6560955, 0.1173774, 1.57186, 0, 0, 0, 1, 1,
0.6589437, 2.103981, 0.6538523, 0, 0, 0, 1, 1,
0.6636613, 0.1811876, 0.3394173, 0, 0, 0, 1, 1,
0.6654381, -0.705743, 2.710189, 1, 1, 1, 1, 1,
0.6675102, 0.7709274, 0.9351768, 1, 1, 1, 1, 1,
0.6732256, 1.386485, 1.471523, 1, 1, 1, 1, 1,
0.6778758, -0.7042872, 4.092926, 1, 1, 1, 1, 1,
0.6788321, -0.6577917, 3.206918, 1, 1, 1, 1, 1,
0.6864281, -1.459579, 2.969064, 1, 1, 1, 1, 1,
0.6895122, 2.539938, 0.03814406, 1, 1, 1, 1, 1,
0.6933354, -1.119856, 2.861622, 1, 1, 1, 1, 1,
0.6938179, 0.2031162, 1.595623, 1, 1, 1, 1, 1,
0.6949891, -0.9913726, 2.17664, 1, 1, 1, 1, 1,
0.6951907, 0.9445578, -0.126064, 1, 1, 1, 1, 1,
0.6973445, -0.5634454, 1.881482, 1, 1, 1, 1, 1,
0.7063515, -0.07392112, 2.193891, 1, 1, 1, 1, 1,
0.7084927, -0.6436909, 1.180532, 1, 1, 1, 1, 1,
0.708654, 0.07690063, 1.380158, 1, 1, 1, 1, 1,
0.7090904, -1.292475, 1.134015, 0, 0, 1, 1, 1,
0.7099152, -0.8313037, 2.006737, 1, 0, 0, 1, 1,
0.7113252, 0.04527432, 1.359159, 1, 0, 0, 1, 1,
0.714021, -1.987534, 2.907358, 1, 0, 0, 1, 1,
0.7141163, 0.2053518, 0.971079, 1, 0, 0, 1, 1,
0.714195, 0.1506906, 4.333291, 1, 0, 0, 1, 1,
0.7160057, 0.9945682, 1.729796, 0, 0, 0, 1, 1,
0.7198945, -0.7164165, 1.178496, 0, 0, 0, 1, 1,
0.7212316, -0.1089743, 1.392431, 0, 0, 0, 1, 1,
0.7281555, -0.6077859, 2.681832, 0, 0, 0, 1, 1,
0.7394011, 1.418161, 1.040708, 0, 0, 0, 1, 1,
0.7472991, 1.061761, 0.5485372, 0, 0, 0, 1, 1,
0.7475023, 1.133676, 1.600126, 0, 0, 0, 1, 1,
0.7499544, 0.3972232, 1.955794, 1, 1, 1, 1, 1,
0.7552211, -0.5005795, 1.167368, 1, 1, 1, 1, 1,
0.7591799, 0.02959528, 0.4807834, 1, 1, 1, 1, 1,
0.7620655, -0.09293458, 1.072605, 1, 1, 1, 1, 1,
0.7685432, 0.04685045, 2.460773, 1, 1, 1, 1, 1,
0.7702591, -0.3131001, 2.067937, 1, 1, 1, 1, 1,
0.7785099, -0.1671931, 2.287304, 1, 1, 1, 1, 1,
0.7829134, 0.4220051, 1.336483, 1, 1, 1, 1, 1,
0.7874415, -1.23565, 0.7320928, 1, 1, 1, 1, 1,
0.7899052, 1.183924, 0.06121581, 1, 1, 1, 1, 1,
0.7976441, -0.831929, 2.139362, 1, 1, 1, 1, 1,
0.7980333, 0.5803146, 0.2324956, 1, 1, 1, 1, 1,
0.80518, -2.57597, 2.191632, 1, 1, 1, 1, 1,
0.8053396, 1.241116, -1.056168, 1, 1, 1, 1, 1,
0.8082806, 1.980331, 0.7654355, 1, 1, 1, 1, 1,
0.8143438, -1.016285, 3.063686, 0, 0, 1, 1, 1,
0.815519, -1.133327, 3.116781, 1, 0, 0, 1, 1,
0.8165596, 0.3063526, 1.601896, 1, 0, 0, 1, 1,
0.8166606, -1.448644, 3.229141, 1, 0, 0, 1, 1,
0.8198448, 1.905415, 1.194718, 1, 0, 0, 1, 1,
0.8240281, -0.1343801, 2.208419, 1, 0, 0, 1, 1,
0.8258928, -0.1059581, 1.948297, 0, 0, 0, 1, 1,
0.8290496, 0.6861126, 0.947128, 0, 0, 0, 1, 1,
0.8294299, -0.5866274, 0.9846923, 0, 0, 0, 1, 1,
0.832136, -0.4358527, 2.444482, 0, 0, 0, 1, 1,
0.8398331, -1.793651, 3.092573, 0, 0, 0, 1, 1,
0.8399931, -0.7649757, 2.969079, 0, 0, 0, 1, 1,
0.840943, -0.1041023, 1.312393, 0, 0, 0, 1, 1,
0.8413531, -0.3868198, 2.577227, 1, 1, 1, 1, 1,
0.8424029, 0.1659593, 1.128447, 1, 1, 1, 1, 1,
0.8480535, 0.7152042, 1.716021, 1, 1, 1, 1, 1,
0.8497828, 0.4062488, 2.274313, 1, 1, 1, 1, 1,
0.8543625, 0.04292796, 2.664431, 1, 1, 1, 1, 1,
0.8574309, 0.2398701, 2.032046, 1, 1, 1, 1, 1,
0.860311, -0.03399492, -0.2064505, 1, 1, 1, 1, 1,
0.8617392, -1.487155, 2.809194, 1, 1, 1, 1, 1,
0.8623367, 2.235928, 1.931452, 1, 1, 1, 1, 1,
0.8627003, -0.06692005, 1.812667, 1, 1, 1, 1, 1,
0.8685439, 0.186198, 0.8248703, 1, 1, 1, 1, 1,
0.8698781, 0.3024171, 0.963863, 1, 1, 1, 1, 1,
0.8711006, -1.60025, 3.202785, 1, 1, 1, 1, 1,
0.8766144, 0.6202025, -0.5093001, 1, 1, 1, 1, 1,
0.8870893, -0.4647136, 3.279066, 1, 1, 1, 1, 1,
0.8887607, 0.9677681, 0.9492991, 0, 0, 1, 1, 1,
0.899019, 1.05287, 0.07783972, 1, 0, 0, 1, 1,
0.9003128, -0.07748315, 2.346346, 1, 0, 0, 1, 1,
0.9004515, -0.5632067, 1.249499, 1, 0, 0, 1, 1,
0.904101, -0.3053558, 1.918099, 1, 0, 0, 1, 1,
0.9162322, 0.2813041, -0.5465164, 1, 0, 0, 1, 1,
0.9162651, 0.2718049, 0.3783162, 0, 0, 0, 1, 1,
0.9203756, -0.6971367, 4.375924, 0, 0, 0, 1, 1,
0.9209307, 0.08642734, 1.197408, 0, 0, 0, 1, 1,
0.9224067, 0.4085427, 1.959144, 0, 0, 0, 1, 1,
0.922628, 1.245945, 0.7624186, 0, 0, 0, 1, 1,
0.9248358, -0.3552218, 1.27234, 0, 0, 0, 1, 1,
0.9262025, -0.00221533, 1.506112, 0, 0, 0, 1, 1,
0.9374946, -2.547153, 2.966992, 1, 1, 1, 1, 1,
0.9375266, -0.6019058, 2.926935, 1, 1, 1, 1, 1,
0.9398474, -1.222343, 2.149243, 1, 1, 1, 1, 1,
0.9400306, 1.51044, -0.200048, 1, 1, 1, 1, 1,
0.9409437, -0.3987942, 4.586649, 1, 1, 1, 1, 1,
0.9500929, 0.1807947, 3.998124, 1, 1, 1, 1, 1,
0.9579485, -1.641036, 3.988351, 1, 1, 1, 1, 1,
0.9631909, -2.429818, 3.006224, 1, 1, 1, 1, 1,
0.967813, -1.155637, 2.072555, 1, 1, 1, 1, 1,
0.9682355, 1.019453, 0.377311, 1, 1, 1, 1, 1,
0.9701037, 0.9839334, 0.5638391, 1, 1, 1, 1, 1,
0.9735234, 0.2993906, 1.827983, 1, 1, 1, 1, 1,
0.9784873, -0.06064828, 2.273419, 1, 1, 1, 1, 1,
0.9842911, -0.1935484, 4.27678, 1, 1, 1, 1, 1,
0.9891184, -0.03724657, 2.158299, 1, 1, 1, 1, 1,
1.000023, -1.684931, 2.824897, 0, 0, 1, 1, 1,
1.000432, -0.8505252, 2.663249, 1, 0, 0, 1, 1,
1.005076, 0.7827621, 0.4294721, 1, 0, 0, 1, 1,
1.019543, -0.02555552, 1.13432, 1, 0, 0, 1, 1,
1.022875, 0.9635292, -0.4587118, 1, 0, 0, 1, 1,
1.025743, -0.06918105, 2.000015, 1, 0, 0, 1, 1,
1.025904, 0.8933957, 2.742973, 0, 0, 0, 1, 1,
1.027417, -0.7704633, 2.280641, 0, 0, 0, 1, 1,
1.03191, 0.5015756, 1.351216, 0, 0, 0, 1, 1,
1.034797, 1.242396, 2.081385, 0, 0, 0, 1, 1,
1.039219, 2.648778, 0.719576, 0, 0, 0, 1, 1,
1.041292, 0.6863739, 1.855924, 0, 0, 0, 1, 1,
1.046151, 1.099198, 0.1873205, 0, 0, 0, 1, 1,
1.05226, -0.5915658, 3.243558, 1, 1, 1, 1, 1,
1.055213, -0.9885996, 1.925318, 1, 1, 1, 1, 1,
1.064667, -0.985133, 1.613843, 1, 1, 1, 1, 1,
1.069947, 0.9640506, 2.185895, 1, 1, 1, 1, 1,
1.072228, -0.5045018, 1.544486, 1, 1, 1, 1, 1,
1.079453, -1.107448, 2.50145, 1, 1, 1, 1, 1,
1.0819, -0.01318029, 1.860979, 1, 1, 1, 1, 1,
1.082149, 1.321367, -0.07631218, 1, 1, 1, 1, 1,
1.083615, -0.9723493, 1.528811, 1, 1, 1, 1, 1,
1.090589, 0.9428164, 0.7062807, 1, 1, 1, 1, 1,
1.094557, -1.423756, 2.394041, 1, 1, 1, 1, 1,
1.096104, -0.3806017, 2.24346, 1, 1, 1, 1, 1,
1.099997, 1.276597, 0.9541863, 1, 1, 1, 1, 1,
1.101045, 0.7083912, 0.5008003, 1, 1, 1, 1, 1,
1.105192, -2.398901, 2.821166, 1, 1, 1, 1, 1,
1.114178, -0.7653385, 0.8100441, 0, 0, 1, 1, 1,
1.121849, -0.006462011, 2.714505, 1, 0, 0, 1, 1,
1.12411, 2.596344, 1.114988, 1, 0, 0, 1, 1,
1.125876, 0.4904795, 0.01556341, 1, 0, 0, 1, 1,
1.126049, -0.6585201, 1.438901, 1, 0, 0, 1, 1,
1.127597, -0.6513815, 0.8262203, 1, 0, 0, 1, 1,
1.137493, 0.1706842, 2.175226, 0, 0, 0, 1, 1,
1.141587, 0.1564501, 1.949196, 0, 0, 0, 1, 1,
1.145502, -1.487107, 1.206994, 0, 0, 0, 1, 1,
1.147135, -0.01962438, 0.6470326, 0, 0, 0, 1, 1,
1.154338, 0.6524849, 0.3683843, 0, 0, 0, 1, 1,
1.157615, 0.8908108, 2.671137, 0, 0, 0, 1, 1,
1.161069, -0.04336875, 2.347093, 0, 0, 0, 1, 1,
1.170651, 1.276474, -1.350483, 1, 1, 1, 1, 1,
1.176209, 1.939057, 1.03785, 1, 1, 1, 1, 1,
1.184572, -0.8134604, 1.222195, 1, 1, 1, 1, 1,
1.186653, 0.2730163, 1.590697, 1, 1, 1, 1, 1,
1.186837, 1.933753, 1.791935, 1, 1, 1, 1, 1,
1.199899, 1.631256, 0.4215979, 1, 1, 1, 1, 1,
1.201777, -1.111047, 1.606004, 1, 1, 1, 1, 1,
1.203804, -1.960591, 2.79, 1, 1, 1, 1, 1,
1.204675, 0.3651894, 1.372114, 1, 1, 1, 1, 1,
1.205426, -0.05964514, 2.077405, 1, 1, 1, 1, 1,
1.206044, 1.914499, 1.070504, 1, 1, 1, 1, 1,
1.206191, -0.5383738, 2.192035, 1, 1, 1, 1, 1,
1.207579, -0.2942441, 2.156089, 1, 1, 1, 1, 1,
1.226406, -0.6150177, 3.387697, 1, 1, 1, 1, 1,
1.243857, -0.4125771, 2.373617, 1, 1, 1, 1, 1,
1.244634, -0.9663039, 1.747176, 0, 0, 1, 1, 1,
1.248117, -0.5887778, 1.461283, 1, 0, 0, 1, 1,
1.252124, -0.7772512, 1.326185, 1, 0, 0, 1, 1,
1.26159, 0.1955705, -0.4056969, 1, 0, 0, 1, 1,
1.272872, -1.066951, 1.921506, 1, 0, 0, 1, 1,
1.276905, -1.470814, 2.05705, 1, 0, 0, 1, 1,
1.277565, -0.1330023, 1.129789, 0, 0, 0, 1, 1,
1.286934, 0.559403, 0.6501091, 0, 0, 0, 1, 1,
1.302234, 0.7514161, 1.743177, 0, 0, 0, 1, 1,
1.303197, 0.4471968, 1.523636, 0, 0, 0, 1, 1,
1.305068, -1.718607, 4.09103, 0, 0, 0, 1, 1,
1.310007, 1.076516, -0.1046203, 0, 0, 0, 1, 1,
1.312545, -0.2651837, 3.157295, 0, 0, 0, 1, 1,
1.312591, -0.9644572, 2.238198, 1, 1, 1, 1, 1,
1.312765, -0.581172, 2.373993, 1, 1, 1, 1, 1,
1.313831, -0.8644999, 2.140221, 1, 1, 1, 1, 1,
1.32015, -1.577903, 3.893841, 1, 1, 1, 1, 1,
1.323237, -1.244729, 1.448405, 1, 1, 1, 1, 1,
1.373134, 0.6500307, 0.3136338, 1, 1, 1, 1, 1,
1.389434, 0.05214389, 2.77705, 1, 1, 1, 1, 1,
1.392066, 1.009325, 0.007144763, 1, 1, 1, 1, 1,
1.409891, -0.3353549, 0.4163007, 1, 1, 1, 1, 1,
1.413258, -1.443428, 2.244286, 1, 1, 1, 1, 1,
1.414358, 0.8958133, -0.3547458, 1, 1, 1, 1, 1,
1.41498, -0.6408926, 2.776222, 1, 1, 1, 1, 1,
1.42662, -0.02519245, 1.38782, 1, 1, 1, 1, 1,
1.427365, 0.6550561, 1.379887, 1, 1, 1, 1, 1,
1.439972, 0.5312976, 1.241753, 1, 1, 1, 1, 1,
1.450801, 0.3566491, -0.5925967, 0, 0, 1, 1, 1,
1.457727, -1.611654, 1.617388, 1, 0, 0, 1, 1,
1.463563, -0.01749349, 2.182356, 1, 0, 0, 1, 1,
1.464374, -0.7116317, 1.53238, 1, 0, 0, 1, 1,
1.471331, 1.58126, 0.9619028, 1, 0, 0, 1, 1,
1.478495, -0.7450555, 3.407666, 1, 0, 0, 1, 1,
1.489276, -0.4373895, 0.5440633, 0, 0, 0, 1, 1,
1.500141, -0.06535466, 1.708553, 0, 0, 0, 1, 1,
1.504031, 0.07510421, 2.519202, 0, 0, 0, 1, 1,
1.509106, 0.8029489, 1.652633, 0, 0, 0, 1, 1,
1.511298, 0.7334094, 0.7612655, 0, 0, 0, 1, 1,
1.514464, -0.5630208, 1.659647, 0, 0, 0, 1, 1,
1.514656, 0.8518962, 1.10171, 0, 0, 0, 1, 1,
1.522936, 1.706653, -0.8588741, 1, 1, 1, 1, 1,
1.538995, 0.4352877, 0.9521807, 1, 1, 1, 1, 1,
1.557377, 1.980771, -0.4915693, 1, 1, 1, 1, 1,
1.558114, 1.441278, -0.1214109, 1, 1, 1, 1, 1,
1.624304, 0.1700219, 2.361764, 1, 1, 1, 1, 1,
1.624796, -1.987429, 2.11602, 1, 1, 1, 1, 1,
1.626022, -1.436327, 3.680838, 1, 1, 1, 1, 1,
1.628772, 0.2900591, 1.186733, 1, 1, 1, 1, 1,
1.651783, -0.4455745, 1.354099, 1, 1, 1, 1, 1,
1.685521, -0.5627242, 0.8282308, 1, 1, 1, 1, 1,
1.687448, 0.6905714, 0.7904925, 1, 1, 1, 1, 1,
1.689539, -0.645628, 1.855821, 1, 1, 1, 1, 1,
1.689702, 0.3924447, 0.1751087, 1, 1, 1, 1, 1,
1.726131, 0.222972, 2.84356, 1, 1, 1, 1, 1,
1.727379, -1.383397, 1.485782, 1, 1, 1, 1, 1,
1.727679, 1.348026, 1.621753, 0, 0, 1, 1, 1,
1.729849, -1.966224, 3.024448, 1, 0, 0, 1, 1,
1.730455, -0.08925884, 2.446937, 1, 0, 0, 1, 1,
1.733845, -0.5903292, 2.427958, 1, 0, 0, 1, 1,
1.741064, -0.1852785, 1.769568, 1, 0, 0, 1, 1,
1.749218, 1.92566, -0.4774295, 1, 0, 0, 1, 1,
1.758626, 0.1887472, 1.423665, 0, 0, 0, 1, 1,
1.775414, 0.9318766, 0.5470479, 0, 0, 0, 1, 1,
1.776132, 0.5288124, 2.389035, 0, 0, 0, 1, 1,
1.780964, 0.1615355, 2.905682, 0, 0, 0, 1, 1,
1.790509, -0.0256108, 3.396584, 0, 0, 0, 1, 1,
1.798057, 0.9829841, -0.6125015, 0, 0, 0, 1, 1,
1.810741, -2.306785, 3.523943, 0, 0, 0, 1, 1,
1.82312, -0.3618028, 1.888446, 1, 1, 1, 1, 1,
1.82417, -0.7199988, 1.378391, 1, 1, 1, 1, 1,
1.835493, -0.7484356, 0.6768954, 1, 1, 1, 1, 1,
1.858418, -1.135091, 2.659385, 1, 1, 1, 1, 1,
1.865436, -0.8269517, 1.216545, 1, 1, 1, 1, 1,
1.874978, 0.5887927, 1.68062, 1, 1, 1, 1, 1,
1.877613, 0.4417835, -0.1520674, 1, 1, 1, 1, 1,
1.912371, 2.38573, 1.689996, 1, 1, 1, 1, 1,
1.912549, -0.8214672, 3.028169, 1, 1, 1, 1, 1,
1.924112, -1.78181, 1.956485, 1, 1, 1, 1, 1,
1.964456, 1.308427, 0.2407041, 1, 1, 1, 1, 1,
2.002479, -0.7857994, 2.2539, 1, 1, 1, 1, 1,
2.016532, -1.224582, 2.05208, 1, 1, 1, 1, 1,
2.057022, 0.2626115, 1.141189, 1, 1, 1, 1, 1,
2.086329, 0.4646634, 1.296029, 1, 1, 1, 1, 1,
2.096065, -0.4385959, 1.828247, 0, 0, 1, 1, 1,
2.100281, 0.4451062, 3.086597, 1, 0, 0, 1, 1,
2.156664, 1.471703, 0.9327367, 1, 0, 0, 1, 1,
2.229614, 1.242688, 1.844668, 1, 0, 0, 1, 1,
2.303879, 0.9432376, 0.7925183, 1, 0, 0, 1, 1,
2.31593, 0.3457566, 1.900784, 1, 0, 0, 1, 1,
2.356862, -0.3657278, 1.058552, 0, 0, 0, 1, 1,
2.375111, 0.3441074, 1.168802, 0, 0, 0, 1, 1,
2.378434, -1.156123, 2.420657, 0, 0, 0, 1, 1,
2.391091, 1.784567, 1.650438, 0, 0, 0, 1, 1,
2.400935, -0.008779624, 1.384438, 0, 0, 0, 1, 1,
2.638084, 0.07729039, 2.237083, 0, 0, 0, 1, 1,
2.705487, 0.2236438, 0.06146715, 0, 0, 0, 1, 1,
2.760056, -0.04412313, 1.944302, 1, 1, 1, 1, 1,
2.829588, -0.3026363, 2.820078, 1, 1, 1, 1, 1,
2.858709, -0.4718475, 2.426403, 1, 1, 1, 1, 1,
3.018363, -0.7260934, 1.159704, 1, 1, 1, 1, 1,
3.061893, 0.5189354, 1.863647, 1, 1, 1, 1, 1,
3.084426, -1.848739, 1.522684, 1, 1, 1, 1, 1,
3.437806, 0.8697199, 3.377057, 1, 1, 1, 1, 1
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
var radius = 9.281069;
var distance = 32.59936;
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
mvMatrix.translate( -0.1638925, 0.07163477, -0.2862022 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.59936);
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
