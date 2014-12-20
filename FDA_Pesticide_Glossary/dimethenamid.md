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
-3.892568, -0.8413164, -0.9200926, 1, 0, 0, 1,
-3.244626, 0.2848922, -0.9434426, 1, 0.007843138, 0, 1,
-2.649161, -0.9815806, -1.072973, 1, 0.01176471, 0, 1,
-2.579875, 0.8449671, -0.227383, 1, 0.01960784, 0, 1,
-2.479518, -0.6857908, -3.239986, 1, 0.02352941, 0, 1,
-2.44049, 0.4682069, -4.24129, 1, 0.03137255, 0, 1,
-2.390293, 0.01869051, -1.202359, 1, 0.03529412, 0, 1,
-2.306795, -0.9792272, -1.846534, 1, 0.04313726, 0, 1,
-2.233358, -0.07205297, -1.407436, 1, 0.04705882, 0, 1,
-2.21624, -1.632413, -1.135524, 1, 0.05490196, 0, 1,
-2.215352, -0.2126268, -0.7046667, 1, 0.05882353, 0, 1,
-2.187023, 1.819293, -1.769329, 1, 0.06666667, 0, 1,
-2.184724, 1.661154, 0.2366899, 1, 0.07058824, 0, 1,
-2.175564, -0.04734408, -0.9709556, 1, 0.07843138, 0, 1,
-2.145628, 0.2658381, -2.967124, 1, 0.08235294, 0, 1,
-2.059555, -0.7019197, -1.372063, 1, 0.09019608, 0, 1,
-2.052059, 0.7250874, -1.575729, 1, 0.09411765, 0, 1,
-2.031685, 0.01528759, -2.2361, 1, 0.1019608, 0, 1,
-2.030786, 1.651639, -0.4208946, 1, 0.1098039, 0, 1,
-2.010235, -0.5049083, -1.926119, 1, 0.1137255, 0, 1,
-2.009117, 0.8831937, -3.07404, 1, 0.1215686, 0, 1,
-1.986215, -2.810233, -3.579656, 1, 0.1254902, 0, 1,
-1.97148, 0.1874939, -1.789143, 1, 0.1333333, 0, 1,
-1.89006, 1.574298, -1.419922, 1, 0.1372549, 0, 1,
-1.869092, 0.5381879, -2.322766, 1, 0.145098, 0, 1,
-1.867893, -1.503216, -0.4551264, 1, 0.1490196, 0, 1,
-1.842619, 0.9848343, -0.8927086, 1, 0.1568628, 0, 1,
-1.79922, 0.3889845, -0.1257424, 1, 0.1607843, 0, 1,
-1.799212, 0.4871184, -1.595572, 1, 0.1686275, 0, 1,
-1.771641, -0.8599352, -0.5447955, 1, 0.172549, 0, 1,
-1.771036, -0.03705306, -1.286065, 1, 0.1803922, 0, 1,
-1.764387, 0.1287182, -3.411644, 1, 0.1843137, 0, 1,
-1.759184, -0.8127226, -3.432882, 1, 0.1921569, 0, 1,
-1.703478, 0.7610833, -1.490593, 1, 0.1960784, 0, 1,
-1.692926, 0.3480984, -1.284166, 1, 0.2039216, 0, 1,
-1.685173, 0.07246488, 0.3005621, 1, 0.2117647, 0, 1,
-1.670988, -0.7509289, -2.441886, 1, 0.2156863, 0, 1,
-1.662755, 1.675076, -1.270597, 1, 0.2235294, 0, 1,
-1.64676, -0.5001255, -2.195615, 1, 0.227451, 0, 1,
-1.626419, 2.080387, -0.9164515, 1, 0.2352941, 0, 1,
-1.619044, 0.3796877, -2.037265, 1, 0.2392157, 0, 1,
-1.60229, 0.7301466, -2.126616, 1, 0.2470588, 0, 1,
-1.575105, 1.416315, 0.5760644, 1, 0.2509804, 0, 1,
-1.55257, -0.9063758, -2.893942, 1, 0.2588235, 0, 1,
-1.550807, -0.8626036, 0.6927207, 1, 0.2627451, 0, 1,
-1.536037, 0.2434798, -0.1497462, 1, 0.2705882, 0, 1,
-1.517472, 0.6630164, 1.119221, 1, 0.2745098, 0, 1,
-1.501647, 0.2674552, -0.1432058, 1, 0.282353, 0, 1,
-1.471975, 0.2101468, -1.930536, 1, 0.2862745, 0, 1,
-1.453359, -1.411393, -3.793514, 1, 0.2941177, 0, 1,
-1.445004, 0.9852508, -2.312469, 1, 0.3019608, 0, 1,
-1.439084, -0.3646348, -2.341757, 1, 0.3058824, 0, 1,
-1.438477, -1.467274, -1.946186, 1, 0.3137255, 0, 1,
-1.434836, -2.172281, -2.833738, 1, 0.3176471, 0, 1,
-1.431773, 0.156597, -1.915436, 1, 0.3254902, 0, 1,
-1.427828, 1.039519, -0.9975584, 1, 0.3294118, 0, 1,
-1.417824, 0.04000606, -2.187183, 1, 0.3372549, 0, 1,
-1.416525, -1.030652, -2.194627, 1, 0.3411765, 0, 1,
-1.402421, -1.099232, -3.187621, 1, 0.3490196, 0, 1,
-1.394371, -0.6479939, 0.8983127, 1, 0.3529412, 0, 1,
-1.393397, 0.07346524, -1.097731, 1, 0.3607843, 0, 1,
-1.364635, 1.316363, -0.3397299, 1, 0.3647059, 0, 1,
-1.35318, -0.1577553, -0.8111413, 1, 0.372549, 0, 1,
-1.340705, 0.5765989, -0.47689, 1, 0.3764706, 0, 1,
-1.332749, 0.7900881, -0.4190594, 1, 0.3843137, 0, 1,
-1.325487, -1.299504, -5.012681, 1, 0.3882353, 0, 1,
-1.316049, 0.7558129, -2.925845, 1, 0.3960784, 0, 1,
-1.302251, -0.42102, -2.337096, 1, 0.4039216, 0, 1,
-1.300566, 0.9283484, -0.3023704, 1, 0.4078431, 0, 1,
-1.299178, 1.228697, 0.1205504, 1, 0.4156863, 0, 1,
-1.298491, -0.5973949, -3.108685, 1, 0.4196078, 0, 1,
-1.289498, 1.679756, 0.6608608, 1, 0.427451, 0, 1,
-1.272365, -0.7276321, -2.632589, 1, 0.4313726, 0, 1,
-1.267928, -0.2438279, -2.827021, 1, 0.4392157, 0, 1,
-1.256658, -0.07735097, -1.792759, 1, 0.4431373, 0, 1,
-1.249375, 0.3284631, -2.215887, 1, 0.4509804, 0, 1,
-1.248899, 0.8626122, -1.960013, 1, 0.454902, 0, 1,
-1.236797, 1.231184, -0.9659012, 1, 0.4627451, 0, 1,
-1.236548, -0.2754434, -3.227102, 1, 0.4666667, 0, 1,
-1.234591, -0.8111483, -2.553378, 1, 0.4745098, 0, 1,
-1.232294, -0.3461806, -1.036912, 1, 0.4784314, 0, 1,
-1.226914, 0.4426111, 0.443601, 1, 0.4862745, 0, 1,
-1.225901, -1.161715, -1.856772, 1, 0.4901961, 0, 1,
-1.20692, 3.197022, -0.7202246, 1, 0.4980392, 0, 1,
-1.203601, -0.391129, -0.2489491, 1, 0.5058824, 0, 1,
-1.201833, 0.3719609, -0.516158, 1, 0.509804, 0, 1,
-1.197711, 0.9776125, -0.2240972, 1, 0.5176471, 0, 1,
-1.19705, 0.8682615, -0.7295641, 1, 0.5215687, 0, 1,
-1.185258, -0.8497414, -1.546599, 1, 0.5294118, 0, 1,
-1.184812, 0.002310699, -1.298745, 1, 0.5333334, 0, 1,
-1.171832, 0.2542499, -1.123543, 1, 0.5411765, 0, 1,
-1.170776, 0.410957, -1.599176, 1, 0.5450981, 0, 1,
-1.167769, 1.612114, 0.9633323, 1, 0.5529412, 0, 1,
-1.166952, 1.469607, -0.7210551, 1, 0.5568628, 0, 1,
-1.163377, -0.2899638, -1.56319, 1, 0.5647059, 0, 1,
-1.160256, -0.4020728, -3.036374, 1, 0.5686275, 0, 1,
-1.152446, 1.099974, -0.9832101, 1, 0.5764706, 0, 1,
-1.147234, -0.5400799, -1.701673, 1, 0.5803922, 0, 1,
-1.142565, -1.150897, -1.978818, 1, 0.5882353, 0, 1,
-1.136644, -0.7062174, -2.920381, 1, 0.5921569, 0, 1,
-1.136337, -1.91751, -3.182747, 1, 0.6, 0, 1,
-1.134225, 0.8892936, -2.074283, 1, 0.6078432, 0, 1,
-1.120737, -1.451048, -1.907069, 1, 0.6117647, 0, 1,
-1.115001, 0.392746, -0.8783852, 1, 0.6196079, 0, 1,
-1.113938, 1.439423, -1.832341, 1, 0.6235294, 0, 1,
-1.111718, -0.5985961, -2.229819, 1, 0.6313726, 0, 1,
-1.109595, 1.03317, -0.5515307, 1, 0.6352941, 0, 1,
-1.097284, 0.2764799, -2.001618, 1, 0.6431373, 0, 1,
-1.090357, -1.371666, -3.039352, 1, 0.6470588, 0, 1,
-1.081228, 1.601745, -1.710207, 1, 0.654902, 0, 1,
-1.078742, 0.2412429, -2.126393, 1, 0.6588235, 0, 1,
-1.068068, 0.3060541, -0.7611247, 1, 0.6666667, 0, 1,
-1.066975, 0.4644051, -0.3209068, 1, 0.6705883, 0, 1,
-1.06587, -0.4484806, -2.558813, 1, 0.6784314, 0, 1,
-1.061522, 0.1632521, -1.561041, 1, 0.682353, 0, 1,
-1.05793, -0.351078, -3.134394, 1, 0.6901961, 0, 1,
-1.053406, -0.1909758, -0.9517309, 1, 0.6941177, 0, 1,
-1.052829, 1.334227, -0.282443, 1, 0.7019608, 0, 1,
-1.052805, 0.4220673, 0.4532332, 1, 0.7098039, 0, 1,
-1.050486, 1.642459, -0.09109787, 1, 0.7137255, 0, 1,
-1.044174, -1.306443, -2.97381, 1, 0.7215686, 0, 1,
-1.043662, -1.407667, -3.844175, 1, 0.7254902, 0, 1,
-1.039673, 0.3051302, -0.9849344, 1, 0.7333333, 0, 1,
-1.028448, -0.7606787, -2.802432, 1, 0.7372549, 0, 1,
-1.025993, -0.004608641, -2.565154, 1, 0.7450981, 0, 1,
-1.024878, -0.498657, -4.263537, 1, 0.7490196, 0, 1,
-1.020373, 0.1551301, -2.388507, 1, 0.7568628, 0, 1,
-1.01758, 1.220822, -0.3723417, 1, 0.7607843, 0, 1,
-1.010259, 0.1630657, -1.58533, 1, 0.7686275, 0, 1,
-1.010221, -1.205205, -0.9317037, 1, 0.772549, 0, 1,
-1.004355, -0.8069328, -1.078698, 1, 0.7803922, 0, 1,
-0.9870293, 0.6316777, -3.111341, 1, 0.7843137, 0, 1,
-0.9858096, -0.8653083, -3.976556, 1, 0.7921569, 0, 1,
-0.9819083, -0.842316, -1.322045, 1, 0.7960784, 0, 1,
-0.9743051, -0.6315004, -0.2475703, 1, 0.8039216, 0, 1,
-0.9727883, 0.8955389, -0.005761693, 1, 0.8117647, 0, 1,
-0.9715415, 0.6792368, -0.2304802, 1, 0.8156863, 0, 1,
-0.9713238, -1.159976, -2.701277, 1, 0.8235294, 0, 1,
-0.9664267, 1.315559, -0.339964, 1, 0.827451, 0, 1,
-0.964685, 0.4481802, -1.541582, 1, 0.8352941, 0, 1,
-0.9579756, 0.7234104, -0.390013, 1, 0.8392157, 0, 1,
-0.9562313, 0.5615842, -3.046402, 1, 0.8470588, 0, 1,
-0.9544025, -0.1799135, -2.356857, 1, 0.8509804, 0, 1,
-0.9536282, 0.1965389, -1.262161, 1, 0.8588235, 0, 1,
-0.9492632, 0.03892076, -0.5568397, 1, 0.8627451, 0, 1,
-0.948876, 1.040499, -0.2303521, 1, 0.8705882, 0, 1,
-0.9430419, -0.05035691, -0.7490937, 1, 0.8745098, 0, 1,
-0.9421728, -0.3901317, -2.005138, 1, 0.8823529, 0, 1,
-0.9409527, -0.2765737, -1.354842, 1, 0.8862745, 0, 1,
-0.9371938, -1.892065, -2.158711, 1, 0.8941177, 0, 1,
-0.9260512, 0.8076057, -1.065089, 1, 0.8980392, 0, 1,
-0.9256639, -1.160399, -1.567104, 1, 0.9058824, 0, 1,
-0.923321, 0.5764424, 0.9072849, 1, 0.9137255, 0, 1,
-0.9218358, 0.9369021, -3.44719, 1, 0.9176471, 0, 1,
-0.9191787, -0.5475239, -1.944547, 1, 0.9254902, 0, 1,
-0.9176466, -1.517624, -2.778927, 1, 0.9294118, 0, 1,
-0.9076677, 0.0494452, -2.535573, 1, 0.9372549, 0, 1,
-0.9016551, -0.8570023, -2.169983, 1, 0.9411765, 0, 1,
-0.8923832, 1.546958, -1.159824, 1, 0.9490196, 0, 1,
-0.8847096, 0.01451329, -1.676618, 1, 0.9529412, 0, 1,
-0.8798504, -0.9510776, -3.794884, 1, 0.9607843, 0, 1,
-0.8768606, 1.228106, -1.204829, 1, 0.9647059, 0, 1,
-0.876702, 0.1523317, -1.111352, 1, 0.972549, 0, 1,
-0.8611576, -2.089056, -1.253902, 1, 0.9764706, 0, 1,
-0.8580676, -1.40158, -1.524584, 1, 0.9843137, 0, 1,
-0.8557369, -0.3238747, -1.721207, 1, 0.9882353, 0, 1,
-0.8547467, -0.2723543, -2.660536, 1, 0.9960784, 0, 1,
-0.8498001, 0.7808177, -2.3413, 0.9960784, 1, 0, 1,
-0.848628, 1.254491, -0.289473, 0.9921569, 1, 0, 1,
-0.8462095, -0.2544963, -0.444987, 0.9843137, 1, 0, 1,
-0.8439897, 0.4735643, -1.948466, 0.9803922, 1, 0, 1,
-0.8439248, -0.8115426, -1.914345, 0.972549, 1, 0, 1,
-0.8380975, -0.05663411, -2.490628, 0.9686275, 1, 0, 1,
-0.8347769, -1.470843, -1.242947, 0.9607843, 1, 0, 1,
-0.8334368, 0.0178284, -0.8516323, 0.9568627, 1, 0, 1,
-0.8320631, 0.253454, 0.3908232, 0.9490196, 1, 0, 1,
-0.8257514, 0.2584278, -3.23842, 0.945098, 1, 0, 1,
-0.8199923, -0.541575, -1.647151, 0.9372549, 1, 0, 1,
-0.8118025, 0.3596835, -1.766169, 0.9333333, 1, 0, 1,
-0.8077513, -0.2021999, -1.227847, 0.9254902, 1, 0, 1,
-0.807594, 0.1025646, -1.754938, 0.9215686, 1, 0, 1,
-0.8001506, -1.637148, -4.300693, 0.9137255, 1, 0, 1,
-0.7985753, 1.874035, -0.8750522, 0.9098039, 1, 0, 1,
-0.7953243, 1.416509, -0.8268307, 0.9019608, 1, 0, 1,
-0.7928778, 0.1695552, -1.254592, 0.8941177, 1, 0, 1,
-0.7928525, 0.4070478, -2.310474, 0.8901961, 1, 0, 1,
-0.7925092, -0.5460838, -0.3750469, 0.8823529, 1, 0, 1,
-0.7878361, 0.1753294, -0.07443557, 0.8784314, 1, 0, 1,
-0.7850212, 1.194888, 0.06876544, 0.8705882, 1, 0, 1,
-0.7794886, -0.8452088, -1.565927, 0.8666667, 1, 0, 1,
-0.7770513, 0.3151233, -1.664912, 0.8588235, 1, 0, 1,
-0.7755374, 0.7180605, 0.1417602, 0.854902, 1, 0, 1,
-0.7731333, -0.8710825, -4.074063, 0.8470588, 1, 0, 1,
-0.7704189, 0.6394818, -0.7337138, 0.8431373, 1, 0, 1,
-0.7701994, -0.3677822, -3.457651, 0.8352941, 1, 0, 1,
-0.768361, -1.546984, -3.545841, 0.8313726, 1, 0, 1,
-0.7565604, 0.6918237, -1.247143, 0.8235294, 1, 0, 1,
-0.7525727, -0.02873568, -0.285124, 0.8196079, 1, 0, 1,
-0.7456048, 0.2648926, -0.4962491, 0.8117647, 1, 0, 1,
-0.7445889, 0.8172001, -0.5954845, 0.8078431, 1, 0, 1,
-0.7427413, 0.8889037, -1.334556, 0.8, 1, 0, 1,
-0.7398888, -1.680033, -1.516437, 0.7921569, 1, 0, 1,
-0.7340114, 0.414772, -0.3894855, 0.7882353, 1, 0, 1,
-0.7303175, 1.194306, 0.2902051, 0.7803922, 1, 0, 1,
-0.7285145, -0.280736, -2.45363, 0.7764706, 1, 0, 1,
-0.7280457, 0.1641974, -1.965158, 0.7686275, 1, 0, 1,
-0.7272767, -0.6088464, -0.5021008, 0.7647059, 1, 0, 1,
-0.7208413, -0.7735077, -2.817965, 0.7568628, 1, 0, 1,
-0.7129577, 2.224175, -0.6542368, 0.7529412, 1, 0, 1,
-0.7123826, -0.09071309, -1.269685, 0.7450981, 1, 0, 1,
-0.7097538, 0.1176276, -0.1270212, 0.7411765, 1, 0, 1,
-0.7041032, -1.403287, -3.261745, 0.7333333, 1, 0, 1,
-0.7033476, 0.5135731, -1.299826, 0.7294118, 1, 0, 1,
-0.7007445, 1.34912, 0.4793352, 0.7215686, 1, 0, 1,
-0.6901144, 0.619987, -0.0186384, 0.7176471, 1, 0, 1,
-0.6897517, -0.2471372, -2.045885, 0.7098039, 1, 0, 1,
-0.6861753, -2.038904, -1.731713, 0.7058824, 1, 0, 1,
-0.6821558, -0.6132392, -2.368825, 0.6980392, 1, 0, 1,
-0.6818737, 1.631934, 0.1574496, 0.6901961, 1, 0, 1,
-0.6805072, -0.6313382, -2.119423, 0.6862745, 1, 0, 1,
-0.6763536, 0.1522158, -1.263082, 0.6784314, 1, 0, 1,
-0.6751422, -0.1785845, -1.863683, 0.6745098, 1, 0, 1,
-0.6741496, -0.4816689, -2.031565, 0.6666667, 1, 0, 1,
-0.6720572, -0.1566345, -1.758788, 0.6627451, 1, 0, 1,
-0.671742, -2.044508, -4.172565, 0.654902, 1, 0, 1,
-0.6704639, 0.8224759, -0.3300458, 0.6509804, 1, 0, 1,
-0.66632, -0.6902763, -2.148775, 0.6431373, 1, 0, 1,
-0.6647394, -0.9742659, -3.981656, 0.6392157, 1, 0, 1,
-0.6561791, -0.5831604, -0.9845362, 0.6313726, 1, 0, 1,
-0.6559152, 0.1549173, -1.219017, 0.627451, 1, 0, 1,
-0.6557637, 0.5693873, -0.8590849, 0.6196079, 1, 0, 1,
-0.6468967, 0.3466831, -1.735146, 0.6156863, 1, 0, 1,
-0.6424827, 0.1587161, -1.214923, 0.6078432, 1, 0, 1,
-0.6416541, 2.305791, 1.243703, 0.6039216, 1, 0, 1,
-0.6401339, 0.5586047, -3.977356, 0.5960785, 1, 0, 1,
-0.6389139, -1.37428, -2.199386, 0.5882353, 1, 0, 1,
-0.6382952, 1.205722, -0.1657286, 0.5843138, 1, 0, 1,
-0.636246, -0.5055832, -2.161448, 0.5764706, 1, 0, 1,
-0.6361234, -0.7439247, -2.342057, 0.572549, 1, 0, 1,
-0.6349376, -0.5817112, -1.60023, 0.5647059, 1, 0, 1,
-0.6319948, 0.9576194, -2.438035, 0.5607843, 1, 0, 1,
-0.630483, 1.290048, 1.249479, 0.5529412, 1, 0, 1,
-0.6272675, 0.471896, -0.6903607, 0.5490196, 1, 0, 1,
-0.6270375, -1.56467, -1.428857, 0.5411765, 1, 0, 1,
-0.6268882, -1.223457, -4.173813, 0.5372549, 1, 0, 1,
-0.626721, 0.3893139, -0.8621675, 0.5294118, 1, 0, 1,
-0.623513, -1.628622, -4.390557, 0.5254902, 1, 0, 1,
-0.6219119, 0.7952266, -0.7289513, 0.5176471, 1, 0, 1,
-0.6163728, -0.1016841, -1.523684, 0.5137255, 1, 0, 1,
-0.6151035, 0.4152163, -0.003863923, 0.5058824, 1, 0, 1,
-0.6133643, -0.1352788, -0.8661289, 0.5019608, 1, 0, 1,
-0.6122366, 0.4301218, -1.629111, 0.4941176, 1, 0, 1,
-0.6091488, 1.569133, 0.09016902, 0.4862745, 1, 0, 1,
-0.6056266, -1.272286, -2.34031, 0.4823529, 1, 0, 1,
-0.60048, -0.3280805, -1.492266, 0.4745098, 1, 0, 1,
-0.6003835, 0.7378461, -0.721218, 0.4705882, 1, 0, 1,
-0.5985923, -0.2088561, 0.4469645, 0.4627451, 1, 0, 1,
-0.5888273, 1.261035, -1.704682, 0.4588235, 1, 0, 1,
-0.5870908, 0.6589642, 0.1008513, 0.4509804, 1, 0, 1,
-0.5859728, -2.325468, -3.900908, 0.4470588, 1, 0, 1,
-0.5850419, -1.628594, -3.418173, 0.4392157, 1, 0, 1,
-0.5834405, 0.003710426, -2.685078, 0.4352941, 1, 0, 1,
-0.5784842, -0.08727821, -0.7735907, 0.427451, 1, 0, 1,
-0.574477, 0.8784446, 1.327784, 0.4235294, 1, 0, 1,
-0.572262, 0.6488465, 0.2181829, 0.4156863, 1, 0, 1,
-0.5708255, -0.282975, -2.791052, 0.4117647, 1, 0, 1,
-0.5707853, 2.031085, 1.720023, 0.4039216, 1, 0, 1,
-0.5632105, -1.092793, -2.171527, 0.3960784, 1, 0, 1,
-0.5532808, -0.8808702, -3.208795, 0.3921569, 1, 0, 1,
-0.5520841, 1.169468, -0.7536489, 0.3843137, 1, 0, 1,
-0.5475329, -0.2555981, -1.407956, 0.3803922, 1, 0, 1,
-0.5462244, -0.03155744, -3.192425, 0.372549, 1, 0, 1,
-0.5456527, 0.4899058, -0.3249689, 0.3686275, 1, 0, 1,
-0.5453374, -0.9023436, -0.4515863, 0.3607843, 1, 0, 1,
-0.5437423, -2.036132, -2.474481, 0.3568628, 1, 0, 1,
-0.5385975, 0.5895071, 1.274308, 0.3490196, 1, 0, 1,
-0.5357657, 0.4424974, -1.045424, 0.345098, 1, 0, 1,
-0.5357389, 0.1467277, -1.307737, 0.3372549, 1, 0, 1,
-0.5330566, 0.437572, 0.344478, 0.3333333, 1, 0, 1,
-0.5329779, -1.509811, -4.165987, 0.3254902, 1, 0, 1,
-0.5320629, -0.2042881, -1.166099, 0.3215686, 1, 0, 1,
-0.5317396, 0.7374074, -1.771237, 0.3137255, 1, 0, 1,
-0.5292129, -0.06941947, -1.984993, 0.3098039, 1, 0, 1,
-0.5282387, 1.05842, -0.9300333, 0.3019608, 1, 0, 1,
-0.5277284, 0.8904177, -0.4423786, 0.2941177, 1, 0, 1,
-0.5229343, -0.9480026, -3.463815, 0.2901961, 1, 0, 1,
-0.5211009, -1.227827, -3.145789, 0.282353, 1, 0, 1,
-0.5202364, 0.1528689, -1.771634, 0.2784314, 1, 0, 1,
-0.5200266, 0.03176088, -2.135973, 0.2705882, 1, 0, 1,
-0.5189131, -1.13864, -3.213977, 0.2666667, 1, 0, 1,
-0.5180256, 0.1662142, -0.8351949, 0.2588235, 1, 0, 1,
-0.5152974, 0.5485032, 0.6091164, 0.254902, 1, 0, 1,
-0.514236, -1.285507, -2.192824, 0.2470588, 1, 0, 1,
-0.508803, 0.3178537, -1.896617, 0.2431373, 1, 0, 1,
-0.5037544, 0.9256121, -1.715489, 0.2352941, 1, 0, 1,
-0.5004854, -1.516958, -2.544591, 0.2313726, 1, 0, 1,
-0.4992418, -0.1453386, 0.09136745, 0.2235294, 1, 0, 1,
-0.4983391, -1.395911, -2.646361, 0.2196078, 1, 0, 1,
-0.4954844, 0.7615178, 1.379238, 0.2117647, 1, 0, 1,
-0.4945385, 0.07509772, -2.369602, 0.2078431, 1, 0, 1,
-0.4937798, -0.6230532, -2.282548, 0.2, 1, 0, 1,
-0.4935452, 0.1957203, -1.660196, 0.1921569, 1, 0, 1,
-0.4929591, 0.3427231, 0.07230048, 0.1882353, 1, 0, 1,
-0.4929271, 0.1463305, -0.6045891, 0.1803922, 1, 0, 1,
-0.4917227, -0.05180062, -1.848271, 0.1764706, 1, 0, 1,
-0.4905876, 0.1984907, -0.4922535, 0.1686275, 1, 0, 1,
-0.4874449, -1.02185, -3.4748, 0.1647059, 1, 0, 1,
-0.4852127, 2.389407, 0.4736922, 0.1568628, 1, 0, 1,
-0.4840582, 0.0008734853, -3.69744, 0.1529412, 1, 0, 1,
-0.4814841, 0.6623659, -2.464707, 0.145098, 1, 0, 1,
-0.4802937, -0.4121233, -1.094383, 0.1411765, 1, 0, 1,
-0.4757706, 0.1864541, -2.036035, 0.1333333, 1, 0, 1,
-0.4714227, 0.03756527, -3.132696, 0.1294118, 1, 0, 1,
-0.4706047, 0.4662821, -2.306134, 0.1215686, 1, 0, 1,
-0.470203, 0.8786649, -0.5741771, 0.1176471, 1, 0, 1,
-0.46668, 0.3052849, -0.8707018, 0.1098039, 1, 0, 1,
-0.4639012, 0.2775809, -1.157668, 0.1058824, 1, 0, 1,
-0.4631662, -0.5020214, -2.599763, 0.09803922, 1, 0, 1,
-0.4595452, -1.233939, -1.394722, 0.09019608, 1, 0, 1,
-0.4471663, -0.5450917, -3.872515, 0.08627451, 1, 0, 1,
-0.446426, 0.03334031, -0.5160784, 0.07843138, 1, 0, 1,
-0.4463097, 0.8247533, -0.7159553, 0.07450981, 1, 0, 1,
-0.4460811, 0.2748334, -1.353753, 0.06666667, 1, 0, 1,
-0.4452198, 0.602172, -0.1520566, 0.0627451, 1, 0, 1,
-0.4440721, 0.498356, -1.966582, 0.05490196, 1, 0, 1,
-0.4330731, -0.5918629, -2.317251, 0.05098039, 1, 0, 1,
-0.4305905, -1.282905, -3.368747, 0.04313726, 1, 0, 1,
-0.428962, 0.3543201, 1.339858, 0.03921569, 1, 0, 1,
-0.4236098, 0.1844786, -0.6397122, 0.03137255, 1, 0, 1,
-0.423167, 0.2642992, -2.060989, 0.02745098, 1, 0, 1,
-0.4197648, -0.3195418, -2.794634, 0.01960784, 1, 0, 1,
-0.4184673, 1.569485, -0.4175092, 0.01568628, 1, 0, 1,
-0.4170421, 0.4805578, -0.4223634, 0.007843138, 1, 0, 1,
-0.4121632, -0.4667855, -1.547805, 0.003921569, 1, 0, 1,
-0.4079936, -0.3467948, -3.303463, 0, 1, 0.003921569, 1,
-0.4067762, -1.011574, -2.317269, 0, 1, 0.01176471, 1,
-0.4048841, 0.3734137, -0.04518837, 0, 1, 0.01568628, 1,
-0.4039216, -0.06804544, -2.521442, 0, 1, 0.02352941, 1,
-0.3999573, -0.4099116, -4.083488, 0, 1, 0.02745098, 1,
-0.3998963, 0.4675002, -0.7056049, 0, 1, 0.03529412, 1,
-0.3982094, -0.9432989, -2.158447, 0, 1, 0.03921569, 1,
-0.3976443, -0.03047284, -2.639778, 0, 1, 0.04705882, 1,
-0.3948771, 0.1997601, -0.2910888, 0, 1, 0.05098039, 1,
-0.3925007, 2.929235, -0.3096282, 0, 1, 0.05882353, 1,
-0.3879794, 0.2402522, 0.33131, 0, 1, 0.0627451, 1,
-0.3832859, 0.08141797, -1.585219, 0, 1, 0.07058824, 1,
-0.38283, 0.6724855, -1.096971, 0, 1, 0.07450981, 1,
-0.3723434, -0.4835163, -2.092711, 0, 1, 0.08235294, 1,
-0.3675511, -2.056938, -2.980781, 0, 1, 0.08627451, 1,
-0.3633734, 0.1244653, -3.911675, 0, 1, 0.09411765, 1,
-0.3548056, -0.3998274, -1.534197, 0, 1, 0.1019608, 1,
-0.3542502, -1.381769, -4.524422, 0, 1, 0.1058824, 1,
-0.3526039, 0.5459669, -0.8194937, 0, 1, 0.1137255, 1,
-0.3466036, 2.482306, 0.5375125, 0, 1, 0.1176471, 1,
-0.3460938, -0.3175586, -2.732117, 0, 1, 0.1254902, 1,
-0.341262, 1.838135, -0.2923534, 0, 1, 0.1294118, 1,
-0.3384846, -0.4852463, 0.06334876, 0, 1, 0.1372549, 1,
-0.3376172, 0.8260039, -0.3195925, 0, 1, 0.1411765, 1,
-0.3320407, -0.1390944, -2.061142, 0, 1, 0.1490196, 1,
-0.3316453, -1.893448, -1.815085, 0, 1, 0.1529412, 1,
-0.3311818, -0.9530859, -2.509224, 0, 1, 0.1607843, 1,
-0.3309629, -1.112671, -2.858153, 0, 1, 0.1647059, 1,
-0.3262571, -0.1725694, -2.337303, 0, 1, 0.172549, 1,
-0.319021, 0.03169671, -1.801874, 0, 1, 0.1764706, 1,
-0.3162879, 0.4577274, -0.9542419, 0, 1, 0.1843137, 1,
-0.3124404, -0.1516088, -2.531852, 0, 1, 0.1882353, 1,
-0.3107752, 0.9725682, 0.01443119, 0, 1, 0.1960784, 1,
-0.3105929, 1.911344, -0.09727219, 0, 1, 0.2039216, 1,
-0.3102675, -2.560932, -2.698653, 0, 1, 0.2078431, 1,
-0.3066467, -1.472381, -3.232784, 0, 1, 0.2156863, 1,
-0.3054003, 0.2621329, 1.599901, 0, 1, 0.2196078, 1,
-0.2990945, 0.9448839, -0.9252573, 0, 1, 0.227451, 1,
-0.2983817, -0.774184, -2.579146, 0, 1, 0.2313726, 1,
-0.2967817, 0.1764621, -2.966228, 0, 1, 0.2392157, 1,
-0.2956814, -1.346289, -4.243071, 0, 1, 0.2431373, 1,
-0.2940615, 0.1944477, -2.17996, 0, 1, 0.2509804, 1,
-0.2931588, 0.3702172, 0.6878342, 0, 1, 0.254902, 1,
-0.291527, -0.6017689, -1.879967, 0, 1, 0.2627451, 1,
-0.2915022, 1.964373, 0.4167066, 0, 1, 0.2666667, 1,
-0.2891178, -0.2742709, -1.98424, 0, 1, 0.2745098, 1,
-0.2881982, -0.1079567, -1.20798, 0, 1, 0.2784314, 1,
-0.2873641, 0.4999027, 0.7062004, 0, 1, 0.2862745, 1,
-0.2821622, 0.539099, -0.3409219, 0, 1, 0.2901961, 1,
-0.2808852, 0.5351889, 0.9117655, 0, 1, 0.2980392, 1,
-0.2769245, 0.9178218, -0.3452207, 0, 1, 0.3058824, 1,
-0.2732313, -0.6521732, 0.006396909, 0, 1, 0.3098039, 1,
-0.2728388, 2.613282, 1.524043, 0, 1, 0.3176471, 1,
-0.2717781, -2.590678, -1.705095, 0, 1, 0.3215686, 1,
-0.2690025, 1.032556, -1.134856, 0, 1, 0.3294118, 1,
-0.2688584, 0.673806, -0.8592978, 0, 1, 0.3333333, 1,
-0.266762, 0.8504944, 0.1687011, 0, 1, 0.3411765, 1,
-0.2664471, 0.323094, -0.6598852, 0, 1, 0.345098, 1,
-0.2643312, 1.148152, 1.196022, 0, 1, 0.3529412, 1,
-0.2635962, -1.031054, -3.742303, 0, 1, 0.3568628, 1,
-0.2626681, -0.5912428, -2.753986, 0, 1, 0.3647059, 1,
-0.2602921, 1.16387, -1.148875, 0, 1, 0.3686275, 1,
-0.2587805, 0.5387543, -1.348246, 0, 1, 0.3764706, 1,
-0.257377, -0.9305531, -1.551871, 0, 1, 0.3803922, 1,
-0.2567531, -1.679645, -2.506152, 0, 1, 0.3882353, 1,
-0.2546717, 1.894907, -0.5224659, 0, 1, 0.3921569, 1,
-0.2545972, 0.8142016, -0.8686373, 0, 1, 0.4, 1,
-0.2494321, -0.5953088, -2.791908, 0, 1, 0.4078431, 1,
-0.2443372, 0.77715, 0.8041358, 0, 1, 0.4117647, 1,
-0.2415907, -1.733542, -1.750807, 0, 1, 0.4196078, 1,
-0.2411715, -0.9223711, -0.2080173, 0, 1, 0.4235294, 1,
-0.2380694, -0.9908772, -3.383907, 0, 1, 0.4313726, 1,
-0.2358373, -0.9257171, -2.601173, 0, 1, 0.4352941, 1,
-0.2344415, 0.9486078, -1.239932, 0, 1, 0.4431373, 1,
-0.2323875, 0.7380747, 0.02137796, 0, 1, 0.4470588, 1,
-0.2288089, -0.8722938, -3.674201, 0, 1, 0.454902, 1,
-0.2283851, -0.3532489, -1.424081, 0, 1, 0.4588235, 1,
-0.2263486, 0.8736936, 0.7322181, 0, 1, 0.4666667, 1,
-0.2202902, 1.385537, 1.427119, 0, 1, 0.4705882, 1,
-0.2122453, -0.6933709, -3.481547, 0, 1, 0.4784314, 1,
-0.2120922, -0.4322807, -2.831656, 0, 1, 0.4823529, 1,
-0.205326, -1.133282, -2.343844, 0, 1, 0.4901961, 1,
-0.2041927, -2.281769, -3.366241, 0, 1, 0.4941176, 1,
-0.1984986, -0.5648233, -0.6012464, 0, 1, 0.5019608, 1,
-0.1975818, -1.741424, -2.111475, 0, 1, 0.509804, 1,
-0.196617, -0.06234166, -3.769191, 0, 1, 0.5137255, 1,
-0.1964131, -0.6593724, -2.183658, 0, 1, 0.5215687, 1,
-0.1961472, 0.8009552, -0.1983504, 0, 1, 0.5254902, 1,
-0.1895895, 0.1879106, -1.696915, 0, 1, 0.5333334, 1,
-0.18953, -0.3045092, -4.225339, 0, 1, 0.5372549, 1,
-0.1888876, 0.3946281, -0.4538267, 0, 1, 0.5450981, 1,
-0.1862773, -0.4765058, -3.4639, 0, 1, 0.5490196, 1,
-0.1810734, 2.59816, 0.202302, 0, 1, 0.5568628, 1,
-0.1785845, -0.002680585, -1.663835, 0, 1, 0.5607843, 1,
-0.1751833, 0.3821633, -0.2829561, 0, 1, 0.5686275, 1,
-0.1743783, -0.0674722, -0.4219445, 0, 1, 0.572549, 1,
-0.1742909, 1.285906, 1.296865, 0, 1, 0.5803922, 1,
-0.1734976, 0.3209077, 0.4240804, 0, 1, 0.5843138, 1,
-0.1715277, -1.150287, -3.016604, 0, 1, 0.5921569, 1,
-0.1708586, 1.666817, -0.1342365, 0, 1, 0.5960785, 1,
-0.1697736, -1.065996, -3.537251, 0, 1, 0.6039216, 1,
-0.1622322, -0.1698066, -2.649345, 0, 1, 0.6117647, 1,
-0.160748, -0.4730338, -3.432705, 0, 1, 0.6156863, 1,
-0.1603635, -0.1365295, -2.440299, 0, 1, 0.6235294, 1,
-0.156933, -0.006130381, -1.32523, 0, 1, 0.627451, 1,
-0.1540904, -0.2742037, -2.888983, 0, 1, 0.6352941, 1,
-0.1524942, -1.845347, -4.27846, 0, 1, 0.6392157, 1,
-0.1519082, 0.5819507, 1.445557, 0, 1, 0.6470588, 1,
-0.1479295, -1.450836, -2.37868, 0, 1, 0.6509804, 1,
-0.14516, -0.2215879, -1.964178, 0, 1, 0.6588235, 1,
-0.143164, -0.04913768, -2.200601, 0, 1, 0.6627451, 1,
-0.1428253, 0.001451136, -2.047608, 0, 1, 0.6705883, 1,
-0.1401288, -1.420316, -2.5915, 0, 1, 0.6745098, 1,
-0.1384751, 1.019784, -0.715502, 0, 1, 0.682353, 1,
-0.1301088, 0.3103607, 0.7743142, 0, 1, 0.6862745, 1,
-0.1267966, -0.3165202, -2.96558, 0, 1, 0.6941177, 1,
-0.1239681, -1.499321, -3.088737, 0, 1, 0.7019608, 1,
-0.1169513, -0.024239, -2.523328, 0, 1, 0.7058824, 1,
-0.113424, 1.557645, 0.4808001, 0, 1, 0.7137255, 1,
-0.1090414, 0.2166904, -0.9820077, 0, 1, 0.7176471, 1,
-0.1073781, -2.03347, -2.825596, 0, 1, 0.7254902, 1,
-0.1018219, 0.9678717, 0.2696638, 0, 1, 0.7294118, 1,
-0.09830074, -1.169411, -4.944886, 0, 1, 0.7372549, 1,
-0.09809412, 1.240481, -0.2606011, 0, 1, 0.7411765, 1,
-0.09793752, 1.455866, -0.2737208, 0, 1, 0.7490196, 1,
-0.09786326, -1.096897, -3.109368, 0, 1, 0.7529412, 1,
-0.09459128, -1.257494, -3.931559, 0, 1, 0.7607843, 1,
-0.09267141, 0.3307725, -0.870917, 0, 1, 0.7647059, 1,
-0.08991632, 1.011826, 0.00420689, 0, 1, 0.772549, 1,
-0.08981538, -1.16537, -2.826076, 0, 1, 0.7764706, 1,
-0.08845648, 0.7747782, -1.041467, 0, 1, 0.7843137, 1,
-0.0865121, 0.04870098, -0.02534193, 0, 1, 0.7882353, 1,
-0.07940982, 0.8860193, -0.3195651, 0, 1, 0.7960784, 1,
-0.07859883, 0.529531, -0.6645026, 0, 1, 0.8039216, 1,
-0.0772919, 0.05960045, -0.4523067, 0, 1, 0.8078431, 1,
-0.07550967, 2.45317, -1.761711, 0, 1, 0.8156863, 1,
-0.07203947, 0.2977434, 0.6988068, 0, 1, 0.8196079, 1,
-0.06809284, -0.36541, -2.788981, 0, 1, 0.827451, 1,
-0.06524914, 0.07323235, 0.258743, 0, 1, 0.8313726, 1,
-0.06491213, -1.077364, -3.942518, 0, 1, 0.8392157, 1,
-0.06419574, 0.2462594, 0.7734438, 0, 1, 0.8431373, 1,
-0.057879, 0.2062652, -1.693594, 0, 1, 0.8509804, 1,
-0.05479149, 0.802807, 0.1815483, 0, 1, 0.854902, 1,
-0.05087551, 0.2113371, 1.092392, 0, 1, 0.8627451, 1,
-0.05071454, 0.9265802, 1.269389, 0, 1, 0.8666667, 1,
-0.03954342, -0.7443484, -3.859632, 0, 1, 0.8745098, 1,
-0.03108291, 1.417704, 0.7618452, 0, 1, 0.8784314, 1,
-0.03093996, -0.6856587, -4.192482, 0, 1, 0.8862745, 1,
-0.02972709, -0.1964357, -3.788495, 0, 1, 0.8901961, 1,
-0.02467586, -0.692735, -2.212727, 0, 1, 0.8980392, 1,
-0.02033673, 0.5392327, -0.4683287, 0, 1, 0.9058824, 1,
-0.01979297, -0.3029206, -2.764305, 0, 1, 0.9098039, 1,
-0.01256793, -0.1170933, -3.234466, 0, 1, 0.9176471, 1,
-0.009625234, 1.365432, -0.1939429, 0, 1, 0.9215686, 1,
-0.002318936, 0.2345808, -0.3742507, 0, 1, 0.9294118, 1,
0.00738271, 2.198596, -1.292044, 0, 1, 0.9333333, 1,
0.008859923, 0.9323148, 0.04226856, 0, 1, 0.9411765, 1,
0.01251388, -0.9177064, 3.092181, 0, 1, 0.945098, 1,
0.02234985, -0.2240797, 4.388255, 0, 1, 0.9529412, 1,
0.022966, 1.668598, -0.1421518, 0, 1, 0.9568627, 1,
0.02626637, 0.0951589, 0.5665041, 0, 1, 0.9647059, 1,
0.02647104, -1.303954, 4.217729, 0, 1, 0.9686275, 1,
0.02834256, -0.09821782, 2.265888, 0, 1, 0.9764706, 1,
0.03021578, 0.6842641, -0.237272, 0, 1, 0.9803922, 1,
0.0311051, 0.08921163, 2.353086, 0, 1, 0.9882353, 1,
0.03181706, 0.5316735, -1.847016, 0, 1, 0.9921569, 1,
0.03336533, -1.367492, 3.268135, 0, 1, 1, 1,
0.03576538, 1.746699, -0.5392501, 0, 0.9921569, 1, 1,
0.03757015, 1.108694, 1.142696, 0, 0.9882353, 1, 1,
0.04035084, 0.5556678, -1.641691, 0, 0.9803922, 1, 1,
0.04318413, -1.710918, 3.299103, 0, 0.9764706, 1, 1,
0.04757212, 0.1819106, 1.12714, 0, 0.9686275, 1, 1,
0.05127197, 1.437508, -1.980127, 0, 0.9647059, 1, 1,
0.05226231, -0.8289016, 2.647805, 0, 0.9568627, 1, 1,
0.05508768, -0.6892872, 2.784699, 0, 0.9529412, 1, 1,
0.05929454, -0.03464973, 1.02184, 0, 0.945098, 1, 1,
0.06081236, -1.536091, 2.135177, 0, 0.9411765, 1, 1,
0.06090591, 1.051526, -1.467537, 0, 0.9333333, 1, 1,
0.06378578, -0.9070208, 4.242489, 0, 0.9294118, 1, 1,
0.06392264, 0.1579259, 1.321247, 0, 0.9215686, 1, 1,
0.06424566, 1.583724, 0.9785703, 0, 0.9176471, 1, 1,
0.06433631, 0.07355067, 1.746169, 0, 0.9098039, 1, 1,
0.06694451, -0.09041227, 2.656648, 0, 0.9058824, 1, 1,
0.06823228, -0.2368872, 3.110935, 0, 0.8980392, 1, 1,
0.07100023, -0.4760213, 2.898875, 0, 0.8901961, 1, 1,
0.07256688, 1.294458, 0.6507663, 0, 0.8862745, 1, 1,
0.07260355, -1.154236, 4.537809, 0, 0.8784314, 1, 1,
0.07289379, -0.02577001, 2.586668, 0, 0.8745098, 1, 1,
0.07384316, -0.2554912, 2.328343, 0, 0.8666667, 1, 1,
0.07678237, 0.7868647, 0.4014646, 0, 0.8627451, 1, 1,
0.08462841, 1.386446, -1.132558, 0, 0.854902, 1, 1,
0.08599542, -1.069684, 1.606835, 0, 0.8509804, 1, 1,
0.08635712, -0.03349122, 3.022754, 0, 0.8431373, 1, 1,
0.08835109, -0.274635, 3.648244, 0, 0.8392157, 1, 1,
0.09060741, 0.9189786, 0.6485235, 0, 0.8313726, 1, 1,
0.09102026, -1.435411, 2.800035, 0, 0.827451, 1, 1,
0.09570676, -0.5996997, 3.674438, 0, 0.8196079, 1, 1,
0.0983343, -0.04553503, 2.451299, 0, 0.8156863, 1, 1,
0.09995171, -0.3381888, 2.948483, 0, 0.8078431, 1, 1,
0.1001959, 0.431101, 0.3332655, 0, 0.8039216, 1, 1,
0.100767, 0.2601981, -0.5675776, 0, 0.7960784, 1, 1,
0.1027646, 0.3135902, 0.1828159, 0, 0.7882353, 1, 1,
0.102937, 0.4819232, -1.935704, 0, 0.7843137, 1, 1,
0.1045062, 0.4203905, -0.3788261, 0, 0.7764706, 1, 1,
0.107146, 0.004203451, 0.4215567, 0, 0.772549, 1, 1,
0.1075776, -0.850305, 4.455143, 0, 0.7647059, 1, 1,
0.1102768, 0.2475835, 0.4645754, 0, 0.7607843, 1, 1,
0.1109937, 0.87268, 0.8115795, 0, 0.7529412, 1, 1,
0.1112998, 1.968273, 1.050257, 0, 0.7490196, 1, 1,
0.1116858, -0.5724456, 2.101201, 0, 0.7411765, 1, 1,
0.1126011, -1.058331, 4.059939, 0, 0.7372549, 1, 1,
0.1159127, -0.7593505, 1.728085, 0, 0.7294118, 1, 1,
0.1185476, 0.3356954, 3.804924, 0, 0.7254902, 1, 1,
0.1224015, -0.6632245, 3.055383, 0, 0.7176471, 1, 1,
0.123178, -1.567721, 3.157279, 0, 0.7137255, 1, 1,
0.1233218, -0.01961548, 0.9784229, 0, 0.7058824, 1, 1,
0.1274594, -0.9742469, 2.83038, 0, 0.6980392, 1, 1,
0.1295108, -3.338529, 3.306839, 0, 0.6941177, 1, 1,
0.1318193, 0.3505514, -0.7589137, 0, 0.6862745, 1, 1,
0.1323669, -1.219914, 3.572095, 0, 0.682353, 1, 1,
0.1355134, -1.687039, 1.181793, 0, 0.6745098, 1, 1,
0.1435374, -0.5797712, 1.955389, 0, 0.6705883, 1, 1,
0.1488845, -1.060023, 2.610991, 0, 0.6627451, 1, 1,
0.149911, -0.5504971, 2.417521, 0, 0.6588235, 1, 1,
0.1541608, 0.1996275, 1.632944, 0, 0.6509804, 1, 1,
0.1565191, -1.008124, 3.111592, 0, 0.6470588, 1, 1,
0.1620777, 0.2395287, 0.402889, 0, 0.6392157, 1, 1,
0.1644345, -0.6446629, 2.769641, 0, 0.6352941, 1, 1,
0.1766159, 0.4744495, 0.5372687, 0, 0.627451, 1, 1,
0.1775284, -0.8704098, 2.065741, 0, 0.6235294, 1, 1,
0.1779324, -0.3284778, 2.699246, 0, 0.6156863, 1, 1,
0.1805154, 0.3872355, 1.959001, 0, 0.6117647, 1, 1,
0.1831839, -0.3361029, 0.5085386, 0, 0.6039216, 1, 1,
0.1874673, 0.6833954, 0.9844556, 0, 0.5960785, 1, 1,
0.1894324, 0.8299221, 0.6850196, 0, 0.5921569, 1, 1,
0.1911798, -0.6313839, 3.774484, 0, 0.5843138, 1, 1,
0.1916091, 0.08190007, 0.8065314, 0, 0.5803922, 1, 1,
0.1917437, 1.276332, 0.4788405, 0, 0.572549, 1, 1,
0.1929052, -0.06519589, 2.381987, 0, 0.5686275, 1, 1,
0.1943596, 1.214859, -1.043543, 0, 0.5607843, 1, 1,
0.1966317, -1.193404, 3.036897, 0, 0.5568628, 1, 1,
0.1966995, 0.5601327, 1.015466, 0, 0.5490196, 1, 1,
0.2017887, 0.8794997, 1.091589, 0, 0.5450981, 1, 1,
0.2067191, -0.9635007, 1.989318, 0, 0.5372549, 1, 1,
0.2101351, 0.7624681, 1.95982, 0, 0.5333334, 1, 1,
0.2128918, -0.3628672, 3.985317, 0, 0.5254902, 1, 1,
0.2142854, -0.358588, 4.393113, 0, 0.5215687, 1, 1,
0.215917, -0.4108435, 2.83053, 0, 0.5137255, 1, 1,
0.2161124, 0.5967077, 0.06356924, 0, 0.509804, 1, 1,
0.2201839, 0.121074, 1.703623, 0, 0.5019608, 1, 1,
0.2205757, 1.022298, 1.037025, 0, 0.4941176, 1, 1,
0.2291116, -1.15023, 4.522967, 0, 0.4901961, 1, 1,
0.2291473, 0.7634863, 0.9954418, 0, 0.4823529, 1, 1,
0.2302093, -0.9998327, 3.069214, 0, 0.4784314, 1, 1,
0.2349536, 0.4184395, 0.1572639, 0, 0.4705882, 1, 1,
0.2360128, -1.297707, 3.723857, 0, 0.4666667, 1, 1,
0.2373888, -2.592657, 0.8185927, 0, 0.4588235, 1, 1,
0.2456233, -1.766326, 1.786456, 0, 0.454902, 1, 1,
0.2460064, 0.6537443, 1.04847, 0, 0.4470588, 1, 1,
0.2462168, 0.7682956, 1.061767, 0, 0.4431373, 1, 1,
0.2477062, 1.666921, -0.2175653, 0, 0.4352941, 1, 1,
0.2502797, 0.7210761, 0.305966, 0, 0.4313726, 1, 1,
0.2529405, -2.353791, 2.843917, 0, 0.4235294, 1, 1,
0.2573404, 0.7038495, 1.164035, 0, 0.4196078, 1, 1,
0.2601002, 0.4155923, 0.179218, 0, 0.4117647, 1, 1,
0.2662904, 1.115452, -0.5966743, 0, 0.4078431, 1, 1,
0.2691466, -0.1120765, 2.975745, 0, 0.4, 1, 1,
0.269592, 0.601906, 0.3484611, 0, 0.3921569, 1, 1,
0.2717926, 0.3092354, 0.1061856, 0, 0.3882353, 1, 1,
0.2728579, -2.885422, 2.154669, 0, 0.3803922, 1, 1,
0.2734398, -0.8272827, 3.103485, 0, 0.3764706, 1, 1,
0.2753154, -1.022062, 2.287691, 0, 0.3686275, 1, 1,
0.2755807, -1.860795, 2.429434, 0, 0.3647059, 1, 1,
0.2809635, 0.1330626, 0.1575556, 0, 0.3568628, 1, 1,
0.2810894, -1.384681, 1.220467, 0, 0.3529412, 1, 1,
0.2825489, -0.4677083, 3.951882, 0, 0.345098, 1, 1,
0.2868779, -0.9683412, 4.079557, 0, 0.3411765, 1, 1,
0.2920125, -0.508402, 1.172092, 0, 0.3333333, 1, 1,
0.2935943, -1.14439, 2.001769, 0, 0.3294118, 1, 1,
0.2961275, -0.2622958, 2.894412, 0, 0.3215686, 1, 1,
0.2985571, 1.557997, 0.889623, 0, 0.3176471, 1, 1,
0.2988651, -1.491457, 1.94519, 0, 0.3098039, 1, 1,
0.3061343, 0.4967326, -0.7007723, 0, 0.3058824, 1, 1,
0.3073245, -1.099737, 3.112796, 0, 0.2980392, 1, 1,
0.30964, 0.08004441, 1.302875, 0, 0.2901961, 1, 1,
0.3134284, -1.493452, 2.984739, 0, 0.2862745, 1, 1,
0.3152142, -0.5856956, 2.538377, 0, 0.2784314, 1, 1,
0.3183848, 0.8382292, 0.8573109, 0, 0.2745098, 1, 1,
0.3198966, -0.4869139, 2.945034, 0, 0.2666667, 1, 1,
0.3228573, 1.845493, 0.0309425, 0, 0.2627451, 1, 1,
0.3250324, 1.39054, 0.09770401, 0, 0.254902, 1, 1,
0.3260013, -0.6798018, 1.58484, 0, 0.2509804, 1, 1,
0.3275033, -1.065737, 2.172874, 0, 0.2431373, 1, 1,
0.3279469, 0.5280284, 0.6492117, 0, 0.2392157, 1, 1,
0.331458, 0.3016719, -0.04125569, 0, 0.2313726, 1, 1,
0.3362344, -0.9424745, 3.63383, 0, 0.227451, 1, 1,
0.3369887, -0.7742952, 3.674199, 0, 0.2196078, 1, 1,
0.3379933, -0.4117117, 2.261453, 0, 0.2156863, 1, 1,
0.3399893, -0.9066457, 3.641353, 0, 0.2078431, 1, 1,
0.3430368, 0.5321307, 0.1260339, 0, 0.2039216, 1, 1,
0.3431034, -1.53392, 2.918563, 0, 0.1960784, 1, 1,
0.3492895, 0.4590611, 0.9169629, 0, 0.1882353, 1, 1,
0.3520442, -0.1042599, 1.038161, 0, 0.1843137, 1, 1,
0.3581714, 1.946728, 0.2825263, 0, 0.1764706, 1, 1,
0.3597814, -1.260659, 1.782524, 0, 0.172549, 1, 1,
0.363206, -0.2165691, 2.940409, 0, 0.1647059, 1, 1,
0.3720256, -1.133157, 2.991066, 0, 0.1607843, 1, 1,
0.3749343, -0.9299133, 1.568482, 0, 0.1529412, 1, 1,
0.3759043, 1.451041, -1.311803, 0, 0.1490196, 1, 1,
0.3857382, 0.5130172, 1.176055, 0, 0.1411765, 1, 1,
0.3857404, 0.6376482, 1.404508, 0, 0.1372549, 1, 1,
0.3858854, 0.166265, -0.7284826, 0, 0.1294118, 1, 1,
0.3876512, 0.01876684, 2.260963, 0, 0.1254902, 1, 1,
0.3972357, 0.4364923, 0.9181868, 0, 0.1176471, 1, 1,
0.3990809, -0.1875393, 0.4450767, 0, 0.1137255, 1, 1,
0.4008548, 1.218222, -0.08585884, 0, 0.1058824, 1, 1,
0.4030368, 1.179716, 0.4184502, 0, 0.09803922, 1, 1,
0.4061512, 0.7094968, 0.2433831, 0, 0.09411765, 1, 1,
0.4121309, 0.05915108, -0.4354693, 0, 0.08627451, 1, 1,
0.4219208, 0.24682, 0.5292704, 0, 0.08235294, 1, 1,
0.4245022, -0.8722984, 3.186932, 0, 0.07450981, 1, 1,
0.4245226, 0.2569983, 0.8230832, 0, 0.07058824, 1, 1,
0.4273877, 0.7325232, -0.4329488, 0, 0.0627451, 1, 1,
0.4299675, -0.1420189, 0.2573012, 0, 0.05882353, 1, 1,
0.4329022, -1.886439, 2.254284, 0, 0.05098039, 1, 1,
0.4347552, 0.4559365, 1.50801, 0, 0.04705882, 1, 1,
0.4387307, 1.132099, 1.110604, 0, 0.03921569, 1, 1,
0.4397951, -1.454142, 2.155827, 0, 0.03529412, 1, 1,
0.4412537, -0.06354924, 1.163273, 0, 0.02745098, 1, 1,
0.4427334, -1.44328, 2.905796, 0, 0.02352941, 1, 1,
0.445142, 0.5987561, -1.510832, 0, 0.01568628, 1, 1,
0.4483681, 0.392769, 0.02990547, 0, 0.01176471, 1, 1,
0.4495928, -1.199271, 2.425403, 0, 0.003921569, 1, 1,
0.4555981, -0.3713858, 3.601857, 0.003921569, 0, 1, 1,
0.459478, -0.721562, 4.886132, 0.007843138, 0, 1, 1,
0.4601526, -0.2265581, 2.138616, 0.01568628, 0, 1, 1,
0.4626547, 1.226022, 0.4972767, 0.01960784, 0, 1, 1,
0.4642482, 0.3694783, 2.654544, 0.02745098, 0, 1, 1,
0.4659521, 0.5738752, 1.515827, 0.03137255, 0, 1, 1,
0.4678536, 0.5334157, 1.594523, 0.03921569, 0, 1, 1,
0.470317, -0.2989677, 1.719074, 0.04313726, 0, 1, 1,
0.4735627, 1.268072, 0.1686688, 0.05098039, 0, 1, 1,
0.4770615, -2.112087, 3.311825, 0.05490196, 0, 1, 1,
0.4771735, 0.04658617, 1.528723, 0.0627451, 0, 1, 1,
0.4797679, 0.9897823, 1.674113, 0.06666667, 0, 1, 1,
0.4815104, -1.075626, 3.04503, 0.07450981, 0, 1, 1,
0.4849096, 0.3307798, 0.7456506, 0.07843138, 0, 1, 1,
0.4947537, -0.3177208, 3.425102, 0.08627451, 0, 1, 1,
0.4955125, -0.09597234, 1.863465, 0.09019608, 0, 1, 1,
0.497848, 0.34414, 2.128854, 0.09803922, 0, 1, 1,
0.4990703, -0.4700689, 2.885461, 0.1058824, 0, 1, 1,
0.4993079, 0.1051612, 2.003182, 0.1098039, 0, 1, 1,
0.5026375, 0.6401151, 0.08091555, 0.1176471, 0, 1, 1,
0.503134, -0.1834681, 1.851011, 0.1215686, 0, 1, 1,
0.5103314, -0.7928101, 2.68445, 0.1294118, 0, 1, 1,
0.5105786, 1.149425, 2.387759, 0.1333333, 0, 1, 1,
0.5149888, 1.95908, -0.8999967, 0.1411765, 0, 1, 1,
0.5162002, -0.6332807, 2.030665, 0.145098, 0, 1, 1,
0.5177943, 0.1863243, 0.1626661, 0.1529412, 0, 1, 1,
0.5210907, -1.044153, 1.159372, 0.1568628, 0, 1, 1,
0.5226797, 1.694642, -1.485824, 0.1647059, 0, 1, 1,
0.525234, -1.17796, 1.722595, 0.1686275, 0, 1, 1,
0.5414841, 0.1147478, 1.855015, 0.1764706, 0, 1, 1,
0.5420448, -0.2562074, 0.6911369, 0.1803922, 0, 1, 1,
0.5424173, 0.2473029, 1.366918, 0.1882353, 0, 1, 1,
0.544062, -0.4361328, 3.189231, 0.1921569, 0, 1, 1,
0.5505592, -0.1982311, 2.265105, 0.2, 0, 1, 1,
0.5528023, 0.8352733, 0.5052978, 0.2078431, 0, 1, 1,
0.5548089, -1.059059, 2.273592, 0.2117647, 0, 1, 1,
0.5584077, 0.4233522, 0.7073275, 0.2196078, 0, 1, 1,
0.5603212, -0.04977234, 0.8707333, 0.2235294, 0, 1, 1,
0.5621125, 1.123513, 0.7551261, 0.2313726, 0, 1, 1,
0.5630241, -1.661139, 1.852927, 0.2352941, 0, 1, 1,
0.5735838, -0.008891858, 1.921931, 0.2431373, 0, 1, 1,
0.574195, 0.5630547, -0.02407105, 0.2470588, 0, 1, 1,
0.5745147, 0.0433861, 2.889639, 0.254902, 0, 1, 1,
0.5745828, 0.8675352, -0.3430583, 0.2588235, 0, 1, 1,
0.5762821, -0.480904, 3.254766, 0.2666667, 0, 1, 1,
0.5766126, -0.3205282, 4.029531, 0.2705882, 0, 1, 1,
0.5842936, -0.2603991, 3.230868, 0.2784314, 0, 1, 1,
0.5896509, 0.2563418, 2.230437, 0.282353, 0, 1, 1,
0.5917912, 0.4665875, 1.540144, 0.2901961, 0, 1, 1,
0.5919051, 1.138565, 1.117655, 0.2941177, 0, 1, 1,
0.5927122, 0.8692769, 0.517364, 0.3019608, 0, 1, 1,
0.5956003, 0.367706, -1.341096, 0.3098039, 0, 1, 1,
0.6016657, -0.439856, 2.638698, 0.3137255, 0, 1, 1,
0.6084166, 1.645308, -0.25703, 0.3215686, 0, 1, 1,
0.6136279, -0.3880593, 1.185568, 0.3254902, 0, 1, 1,
0.616468, 0.9144499, 1.419342, 0.3333333, 0, 1, 1,
0.6184307, 0.02280729, 0.8200759, 0.3372549, 0, 1, 1,
0.6241945, -0.3708776, 2.779212, 0.345098, 0, 1, 1,
0.6254518, 0.1370725, 1.835055, 0.3490196, 0, 1, 1,
0.6276295, 0.3293452, 1.199807, 0.3568628, 0, 1, 1,
0.6354001, -2.060986, 2.982425, 0.3607843, 0, 1, 1,
0.6390754, 0.162817, 1.420601, 0.3686275, 0, 1, 1,
0.6392491, -1.388698, 1.761556, 0.372549, 0, 1, 1,
0.6414779, 0.7303384, 0.1235771, 0.3803922, 0, 1, 1,
0.6429508, -0.7745161, 1.972942, 0.3843137, 0, 1, 1,
0.6448723, -0.7508214, -0.5317828, 0.3921569, 0, 1, 1,
0.6470692, 0.03940411, 1.369179, 0.3960784, 0, 1, 1,
0.6523291, 0.0509023, 2.25967, 0.4039216, 0, 1, 1,
0.6534593, 0.7535177, 1.362839, 0.4117647, 0, 1, 1,
0.6536986, -1.094363, 1.775854, 0.4156863, 0, 1, 1,
0.6561006, 0.4350834, 0.6229736, 0.4235294, 0, 1, 1,
0.6595702, 1.24114, -0.8488231, 0.427451, 0, 1, 1,
0.6597158, -0.90591, 2.163072, 0.4352941, 0, 1, 1,
0.6678109, -0.5149271, 1.409608, 0.4392157, 0, 1, 1,
0.66969, -0.06592565, 1.813913, 0.4470588, 0, 1, 1,
0.6703485, 0.9908273, 0.2862521, 0.4509804, 0, 1, 1,
0.6798993, -1.085489, 2.555581, 0.4588235, 0, 1, 1,
0.6843154, -0.4641541, 3.39232, 0.4627451, 0, 1, 1,
0.6868731, -0.5380034, 2.175753, 0.4705882, 0, 1, 1,
0.6958788, -0.6792151, 4.355453, 0.4745098, 0, 1, 1,
0.7008409, 0.6859817, 0.2519943, 0.4823529, 0, 1, 1,
0.7034588, -1.585587, 3.283263, 0.4862745, 0, 1, 1,
0.7038998, -0.4950996, 0.8250312, 0.4941176, 0, 1, 1,
0.7042604, 0.1699138, 3.003638, 0.5019608, 0, 1, 1,
0.7049879, 1.612536, 0.1997778, 0.5058824, 0, 1, 1,
0.7103276, 2.404736, -1.326657, 0.5137255, 0, 1, 1,
0.7120667, 0.7630243, 0.06090962, 0.5176471, 0, 1, 1,
0.7122009, -0.5512616, 1.278675, 0.5254902, 0, 1, 1,
0.7197017, 0.948339, 2.33449, 0.5294118, 0, 1, 1,
0.7285827, -1.101764, 1.948765, 0.5372549, 0, 1, 1,
0.7316239, -0.3846333, 1.880963, 0.5411765, 0, 1, 1,
0.7355924, 0.5903687, 1.832812, 0.5490196, 0, 1, 1,
0.7400219, -0.08679693, 0.610864, 0.5529412, 0, 1, 1,
0.7452052, -0.6512247, 3.121478, 0.5607843, 0, 1, 1,
0.7476602, 0.2936344, -1.324899, 0.5647059, 0, 1, 1,
0.7552167, 0.3473589, 2.170597, 0.572549, 0, 1, 1,
0.755528, 0.7276153, -0.7543216, 0.5764706, 0, 1, 1,
0.7556196, 1.016286, 0.3412721, 0.5843138, 0, 1, 1,
0.7567725, 0.5355688, 1.030234, 0.5882353, 0, 1, 1,
0.7587696, -0.1429937, -0.1800911, 0.5960785, 0, 1, 1,
0.7626258, -1.696027, 1.663663, 0.6039216, 0, 1, 1,
0.765658, -0.9591046, 1.412519, 0.6078432, 0, 1, 1,
0.7675037, -0.9240193, 0.5186068, 0.6156863, 0, 1, 1,
0.7677581, -1.245992, 2.383819, 0.6196079, 0, 1, 1,
0.7693555, -1.057895, 0.9036416, 0.627451, 0, 1, 1,
0.7724237, 2.336967, -0.422592, 0.6313726, 0, 1, 1,
0.7739855, -0.2162671, 2.423578, 0.6392157, 0, 1, 1,
0.7790608, -0.3242992, 1.158811, 0.6431373, 0, 1, 1,
0.7816743, 0.9159853, 0.9010219, 0.6509804, 0, 1, 1,
0.7818412, -1.0322, 3.317581, 0.654902, 0, 1, 1,
0.790884, 0.2569187, -0.04246075, 0.6627451, 0, 1, 1,
0.7923855, -1.163722, 2.119274, 0.6666667, 0, 1, 1,
0.7943459, 0.3100471, 2.334889, 0.6745098, 0, 1, 1,
0.7963631, -0.3113368, 3.229222, 0.6784314, 0, 1, 1,
0.7980254, -1.016929, 4.076858, 0.6862745, 0, 1, 1,
0.7986246, -0.08243848, 1.064998, 0.6901961, 0, 1, 1,
0.8004175, 0.2791491, 2.960925, 0.6980392, 0, 1, 1,
0.8090039, -0.2641869, 2.939932, 0.7058824, 0, 1, 1,
0.8167838, 0.3762383, 0.4055507, 0.7098039, 0, 1, 1,
0.8191662, -0.6557871, 1.956984, 0.7176471, 0, 1, 1,
0.8202198, -1.707086, 2.167914, 0.7215686, 0, 1, 1,
0.8210898, 0.6806216, 0.6864524, 0.7294118, 0, 1, 1,
0.8236073, 0.4980295, 0.5406878, 0.7333333, 0, 1, 1,
0.8246115, -0.2087623, 1.206883, 0.7411765, 0, 1, 1,
0.8256377, 0.09281395, 1.907597, 0.7450981, 0, 1, 1,
0.8257645, -0.3855045, 2.489411, 0.7529412, 0, 1, 1,
0.8265206, -0.5030712, 0.4511387, 0.7568628, 0, 1, 1,
0.8298493, -0.7940305, 2.295531, 0.7647059, 0, 1, 1,
0.8310322, 2.769988, -1.520762, 0.7686275, 0, 1, 1,
0.8336799, -0.02011027, 1.613876, 0.7764706, 0, 1, 1,
0.8378795, -1.740918, 3.937109, 0.7803922, 0, 1, 1,
0.8398879, 1.000759, 0.5982264, 0.7882353, 0, 1, 1,
0.8404262, 0.4475924, 1.871821, 0.7921569, 0, 1, 1,
0.8412747, 0.2733583, 3.780782, 0.8, 0, 1, 1,
0.8487238, 0.04802974, 2.328066, 0.8078431, 0, 1, 1,
0.8531011, 0.730042, -0.3430656, 0.8117647, 0, 1, 1,
0.8536287, -0.2417603, 1.655318, 0.8196079, 0, 1, 1,
0.8536744, 0.1921028, 2.468249, 0.8235294, 0, 1, 1,
0.8633816, 0.7011458, 1.54212, 0.8313726, 0, 1, 1,
0.8656583, -0.985229, 3.631299, 0.8352941, 0, 1, 1,
0.8795992, -0.7697839, 2.165778, 0.8431373, 0, 1, 1,
0.8807378, 0.04931017, 1.418174, 0.8470588, 0, 1, 1,
0.8808779, 1.122836, 0.08166905, 0.854902, 0, 1, 1,
0.8818622, -0.04163368, 1.364974, 0.8588235, 0, 1, 1,
0.8854894, -0.1089544, 2.834308, 0.8666667, 0, 1, 1,
0.8906982, 0.2679512, 1.102965, 0.8705882, 0, 1, 1,
0.8951399, 0.851189, 0.7219853, 0.8784314, 0, 1, 1,
0.8989626, -0.6911994, 0.7690906, 0.8823529, 0, 1, 1,
0.9025635, 0.1333973, 2.064326, 0.8901961, 0, 1, 1,
0.9027222, 1.248653, 0.9253432, 0.8941177, 0, 1, 1,
0.9085681, -0.1994728, -0.132963, 0.9019608, 0, 1, 1,
0.9088158, 0.9972522, -1.096361, 0.9098039, 0, 1, 1,
0.9097481, -0.7068753, 0.6120036, 0.9137255, 0, 1, 1,
0.9120138, -0.5136991, 1.985893, 0.9215686, 0, 1, 1,
0.9185351, 0.3668604, 0.9303314, 0.9254902, 0, 1, 1,
0.9226008, -0.01924105, 0.9111912, 0.9333333, 0, 1, 1,
0.9297238, -0.8425307, 2.041595, 0.9372549, 0, 1, 1,
0.931522, -0.254222, 2.214525, 0.945098, 0, 1, 1,
0.9362645, 1.451325, 0.6067261, 0.9490196, 0, 1, 1,
0.9470257, -0.05355373, 1.267766, 0.9568627, 0, 1, 1,
0.9474124, -1.246237, 1.947204, 0.9607843, 0, 1, 1,
0.948569, -0.5961446, 3.043721, 0.9686275, 0, 1, 1,
0.9567295, -1.502585, 1.939699, 0.972549, 0, 1, 1,
0.959637, 1.141696, -0.6856164, 0.9803922, 0, 1, 1,
0.9718885, 1.903101, 0.6847546, 0.9843137, 0, 1, 1,
0.9727654, -0.01192921, -0.3218524, 0.9921569, 0, 1, 1,
0.9769545, -0.03403109, 3.117287, 0.9960784, 0, 1, 1,
0.981185, 0.7096257, -0.5899394, 1, 0, 0.9960784, 1,
0.9814962, -0.5164488, 2.620773, 1, 0, 0.9882353, 1,
0.9820043, 0.03141199, 0.3462265, 1, 0, 0.9843137, 1,
0.9847025, 0.3561407, 0.9509101, 1, 0, 0.9764706, 1,
0.9871954, 1.486111, -0.1736215, 1, 0, 0.972549, 1,
1.001302, 0.8469828, 1.918395, 1, 0, 0.9647059, 1,
1.00228, -1.926203, 3.372101, 1, 0, 0.9607843, 1,
1.004275, 0.3307855, 1.479901, 1, 0, 0.9529412, 1,
1.005322, 0.1672806, 1.479838, 1, 0, 0.9490196, 1,
1.008113, 0.9102251, 0.655718, 1, 0, 0.9411765, 1,
1.026199, -0.04659478, 1.654659, 1, 0, 0.9372549, 1,
1.031109, 0.8310259, 0.6584218, 1, 0, 0.9294118, 1,
1.033168, -0.5367232, 1.492614, 1, 0, 0.9254902, 1,
1.038848, -1.292513, 2.230111, 1, 0, 0.9176471, 1,
1.043167, -0.2969549, 2.597855, 1, 0, 0.9137255, 1,
1.047533, 1.530797, 0.1536578, 1, 0, 0.9058824, 1,
1.051122, 0.4159031, 2.122431, 1, 0, 0.9019608, 1,
1.063821, -1.476478, 0.474818, 1, 0, 0.8941177, 1,
1.067584, -0.877365, 2.829026, 1, 0, 0.8862745, 1,
1.073012, -0.8679709, 0.7864131, 1, 0, 0.8823529, 1,
1.073174, 1.328035, 1.36109, 1, 0, 0.8745098, 1,
1.076119, 1.244178, -0.5549083, 1, 0, 0.8705882, 1,
1.076687, -1.592741, 2.989957, 1, 0, 0.8627451, 1,
1.078948, -0.5223116, 0.1837492, 1, 0, 0.8588235, 1,
1.079253, -0.4399135, 3.020092, 1, 0, 0.8509804, 1,
1.085148, -0.9113859, 2.605083, 1, 0, 0.8470588, 1,
1.086154, 0.1088016, 0.8965571, 1, 0, 0.8392157, 1,
1.09579, -1.054623, 0.8895554, 1, 0, 0.8352941, 1,
1.098098, -2.357115, 2.850878, 1, 0, 0.827451, 1,
1.108153, 0.05508365, 1.862528, 1, 0, 0.8235294, 1,
1.116301, 0.6636313, 1.072639, 1, 0, 0.8156863, 1,
1.11804, 1.701719, 1.557747, 1, 0, 0.8117647, 1,
1.122873, -0.5080702, 1.547351, 1, 0, 0.8039216, 1,
1.129172, 0.0344544, -0.1539236, 1, 0, 0.7960784, 1,
1.129932, -0.1158872, 0.6260265, 1, 0, 0.7921569, 1,
1.134539, -0.2761331, 0.7116346, 1, 0, 0.7843137, 1,
1.141447, -1.469585, 3.87854, 1, 0, 0.7803922, 1,
1.144626, 0.963565, 0.8345704, 1, 0, 0.772549, 1,
1.145841, 0.38311, 0.7106277, 1, 0, 0.7686275, 1,
1.147102, -0.2486797, 1.639021, 1, 0, 0.7607843, 1,
1.151287, 1.351737, 0.7054008, 1, 0, 0.7568628, 1,
1.151751, -1.032918, 4.02014, 1, 0, 0.7490196, 1,
1.152391, 0.3596655, 0.1213101, 1, 0, 0.7450981, 1,
1.155305, 2.280126, 0.6621366, 1, 0, 0.7372549, 1,
1.158867, -0.9404504, 2.157304, 1, 0, 0.7333333, 1,
1.160901, -0.9612786, 2.719174, 1, 0, 0.7254902, 1,
1.162937, -1.477546, 4.530505, 1, 0, 0.7215686, 1,
1.164635, 0.06572646, 0.143909, 1, 0, 0.7137255, 1,
1.169653, 0.5381292, 0.6191435, 1, 0, 0.7098039, 1,
1.17237, -1.454812, 1.237576, 1, 0, 0.7019608, 1,
1.189488, -0.6288435, 2.352222, 1, 0, 0.6941177, 1,
1.192324, -0.2989744, 1.956323, 1, 0, 0.6901961, 1,
1.198689, 1.635642, 2.172385, 1, 0, 0.682353, 1,
1.19969, -1.13599, 1.682585, 1, 0, 0.6784314, 1,
1.206185, -1.321411, 1.894978, 1, 0, 0.6705883, 1,
1.208117, -0.864919, 3.688703, 1, 0, 0.6666667, 1,
1.21174, -0.5058514, 0.5828937, 1, 0, 0.6588235, 1,
1.224688, 1.656891, 1.480677, 1, 0, 0.654902, 1,
1.22725, 0.6112064, 0.3553136, 1, 0, 0.6470588, 1,
1.230568, 0.6563234, 1.688595, 1, 0, 0.6431373, 1,
1.238133, -1.135749, 1.936908, 1, 0, 0.6352941, 1,
1.240282, -1.321669, 1.780805, 1, 0, 0.6313726, 1,
1.24554, 0.7309882, 1.105652, 1, 0, 0.6235294, 1,
1.269933, -0.1656686, 2.43502, 1, 0, 0.6196079, 1,
1.273203, 0.9618055, 2.346403, 1, 0, 0.6117647, 1,
1.285602, 0.7116626, 0.03232808, 1, 0, 0.6078432, 1,
1.289053, -0.6979612, 3.299338, 1, 0, 0.6, 1,
1.289979, -0.182072, 3.288861, 1, 0, 0.5921569, 1,
1.290524, 2.049878, 1.278619, 1, 0, 0.5882353, 1,
1.291147, -0.152138, 1.888541, 1, 0, 0.5803922, 1,
1.292874, -0.5045092, 2.314309, 1, 0, 0.5764706, 1,
1.295747, -1.312679, 1.55223, 1, 0, 0.5686275, 1,
1.301129, -2.182865, 3.04492, 1, 0, 0.5647059, 1,
1.304949, 0.3907343, 0.6922049, 1, 0, 0.5568628, 1,
1.305696, 1.177381, 2.695936, 1, 0, 0.5529412, 1,
1.314154, 0.580874, -1.426338, 1, 0, 0.5450981, 1,
1.331651, -0.8730106, 1.842832, 1, 0, 0.5411765, 1,
1.332638, -0.6970625, 3.28888, 1, 0, 0.5333334, 1,
1.345113, -0.6815168, 1.129169, 1, 0, 0.5294118, 1,
1.361256, -1.050188, 1.813637, 1, 0, 0.5215687, 1,
1.383683, 0.338702, -0.4865543, 1, 0, 0.5176471, 1,
1.391102, -1.262249, 3.180478, 1, 0, 0.509804, 1,
1.403805, 1.008756, 1.383943, 1, 0, 0.5058824, 1,
1.414903, 1.194914, 0.2503679, 1, 0, 0.4980392, 1,
1.41779, 0.674366, 2.828384, 1, 0, 0.4901961, 1,
1.420369, 0.1548908, 1.135612, 1, 0, 0.4862745, 1,
1.425594, 0.9656747, 1.212726, 1, 0, 0.4784314, 1,
1.425895, -0.143982, 2.70565, 1, 0, 0.4745098, 1,
1.434477, -0.6606712, 2.131036, 1, 0, 0.4666667, 1,
1.434627, -1.584373, 2.604568, 1, 0, 0.4627451, 1,
1.438667, 1.106527, 0.3809261, 1, 0, 0.454902, 1,
1.442694, 0.891317, 2.129826, 1, 0, 0.4509804, 1,
1.445342, 0.04609854, 1.08967, 1, 0, 0.4431373, 1,
1.452658, -0.5551258, 0.6494957, 1, 0, 0.4392157, 1,
1.453724, -0.1112712, 0.9627505, 1, 0, 0.4313726, 1,
1.469225, 0.3813813, 1.4117, 1, 0, 0.427451, 1,
1.479459, 0.4093485, 1.459237, 1, 0, 0.4196078, 1,
1.482203, -0.9215257, 2.278613, 1, 0, 0.4156863, 1,
1.499849, -0.8771181, 1.119695, 1, 0, 0.4078431, 1,
1.500195, 1.396317, 1.108637, 1, 0, 0.4039216, 1,
1.500861, 0.3695579, 1.554782, 1, 0, 0.3960784, 1,
1.518188, 1.21629, 0.853938, 1, 0, 0.3882353, 1,
1.525278, 2.047605, 1.449909, 1, 0, 0.3843137, 1,
1.525936, -0.1157054, 1.342878, 1, 0, 0.3764706, 1,
1.534461, 0.1146761, 1.041813, 1, 0, 0.372549, 1,
1.537958, 0.7732564, 0.5861766, 1, 0, 0.3647059, 1,
1.538669, -0.9444089, 0.7875773, 1, 0, 0.3607843, 1,
1.544247, 1.467852, 1.261085, 1, 0, 0.3529412, 1,
1.544299, -0.6603464, 2.139576, 1, 0, 0.3490196, 1,
1.577936, -0.4247193, 1.949639, 1, 0, 0.3411765, 1,
1.579041, 0.4465667, 1.103917, 1, 0, 0.3372549, 1,
1.590747, -1.007013, 1.43007, 1, 0, 0.3294118, 1,
1.593134, -0.02571111, 0.197247, 1, 0, 0.3254902, 1,
1.600664, 0.01980226, 0.6671651, 1, 0, 0.3176471, 1,
1.601578, -1.128425, 0.2559506, 1, 0, 0.3137255, 1,
1.601936, -0.06577164, 2.442908, 1, 0, 0.3058824, 1,
1.608021, 0.466266, 0.08001719, 1, 0, 0.2980392, 1,
1.634944, 0.2605965, 0.9404123, 1, 0, 0.2941177, 1,
1.636649, -1.315298, 1.813277, 1, 0, 0.2862745, 1,
1.641533, 0.011195, 2.572279, 1, 0, 0.282353, 1,
1.642303, -0.03052024, 3.392749, 1, 0, 0.2745098, 1,
1.645356, 0.4375128, -0.2319682, 1, 0, 0.2705882, 1,
1.683599, 1.26994, 2.789956, 1, 0, 0.2627451, 1,
1.683647, -0.05753458, 0.6786225, 1, 0, 0.2588235, 1,
1.691276, -0.143389, 2.171535, 1, 0, 0.2509804, 1,
1.716497, -0.4685871, 3.124715, 1, 0, 0.2470588, 1,
1.762383, 0.06972509, 0.4131558, 1, 0, 0.2392157, 1,
1.765595, -0.2855282, -0.0436862, 1, 0, 0.2352941, 1,
1.767194, 0.1094615, 2.326622, 1, 0, 0.227451, 1,
1.774304, 1.475153, 2.444327, 1, 0, 0.2235294, 1,
1.791875, -0.812249, 1.594927, 1, 0, 0.2156863, 1,
1.808525, -0.5115527, 2.652222, 1, 0, 0.2117647, 1,
1.824322, 0.8411993, 1.252755, 1, 0, 0.2039216, 1,
1.833966, -0.02415203, 0.8261654, 1, 0, 0.1960784, 1,
1.852651, -0.9308249, 1.828866, 1, 0, 0.1921569, 1,
1.858283, 1.301591, 2.217555, 1, 0, 0.1843137, 1,
1.879131, -1.406778, 1.073413, 1, 0, 0.1803922, 1,
1.881179, -0.909085, 3.634765, 1, 0, 0.172549, 1,
1.886802, 0.2826028, 1.566087, 1, 0, 0.1686275, 1,
1.899725, 0.3437862, 0.7866494, 1, 0, 0.1607843, 1,
1.916881, 0.4230988, 0.4068809, 1, 0, 0.1568628, 1,
1.926504, -0.07858925, 2.46137, 1, 0, 0.1490196, 1,
1.92955, 0.924218, 0.966722, 1, 0, 0.145098, 1,
1.930961, -1.32452, 2.337509, 1, 0, 0.1372549, 1,
1.944353, 0.5000714, 2.761864, 1, 0, 0.1333333, 1,
1.96604, -0.3417251, 2.490552, 1, 0, 0.1254902, 1,
1.989136, -1.082914, 1.744037, 1, 0, 0.1215686, 1,
2.045887, 1.880518, 2.026552, 1, 0, 0.1137255, 1,
2.063934, 0.2340611, 1.641269, 1, 0, 0.1098039, 1,
2.087049, -0.899387, 2.376819, 1, 0, 0.1019608, 1,
2.161624, 0.3484081, 2.208136, 1, 0, 0.09411765, 1,
2.169907, 1.72718, 1.496147, 1, 0, 0.09019608, 1,
2.186685, 0.5877613, 0.5755489, 1, 0, 0.08235294, 1,
2.210762, -0.3757625, -0.1772102, 1, 0, 0.07843138, 1,
2.230651, 2.356024, 0.721421, 1, 0, 0.07058824, 1,
2.279646, -0.690122, 2.476909, 1, 0, 0.06666667, 1,
2.29013, 0.3803072, 1.544701, 1, 0, 0.05882353, 1,
2.293526, 1.803267, 2.419301, 1, 0, 0.05490196, 1,
2.344215, -0.2879646, 1.513957, 1, 0, 0.04705882, 1,
2.444356, 0.9955311, 2.326763, 1, 0, 0.04313726, 1,
2.522199, -1.578721, 2.793616, 1, 0, 0.03529412, 1,
2.556669, 1.026714, 1.651194, 1, 0, 0.03137255, 1,
2.666228, -0.4628387, 1.42035, 1, 0, 0.02352941, 1,
2.701334, 0.3708518, 1.065612, 1, 0, 0.01960784, 1,
2.75282, 1.200391, 0.1122071, 1, 0, 0.01176471, 1,
2.794171, -2.390749, 1.111013, 1, 0, 0.007843138, 1
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
-0.5491986, -4.446305, -6.69053, 0, -0.5, 0.5, 0.5,
-0.5491986, -4.446305, -6.69053, 1, -0.5, 0.5, 0.5,
-0.5491986, -4.446305, -6.69053, 1, 1.5, 0.5, 0.5,
-0.5491986, -4.446305, -6.69053, 0, 1.5, 0.5, 0.5
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
-5.02597, -0.07075357, -6.69053, 0, -0.5, 0.5, 0.5,
-5.02597, -0.07075357, -6.69053, 1, -0.5, 0.5, 0.5,
-5.02597, -0.07075357, -6.69053, 1, 1.5, 0.5, 0.5,
-5.02597, -0.07075357, -6.69053, 0, 1.5, 0.5, 0.5
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
-5.02597, -4.446305, -0.06327486, 0, -0.5, 0.5, 0.5,
-5.02597, -4.446305, -0.06327486, 1, -0.5, 0.5, 0.5,
-5.02597, -4.446305, -0.06327486, 1, 1.5, 0.5, 0.5,
-5.02597, -4.446305, -0.06327486, 0, 1.5, 0.5, 0.5
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
-3, -3.436562, -5.161164,
2, -3.436562, -5.161164,
-3, -3.436562, -5.161164,
-3, -3.604853, -5.416058,
-2, -3.436562, -5.161164,
-2, -3.604853, -5.416058,
-1, -3.436562, -5.161164,
-1, -3.604853, -5.416058,
0, -3.436562, -5.161164,
0, -3.604853, -5.416058,
1, -3.436562, -5.161164,
1, -3.604853, -5.416058,
2, -3.436562, -5.161164,
2, -3.604853, -5.416058
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
-3, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
-3, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
-3, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
-3, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5,
-2, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
-2, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
-2, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
-2, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5,
-1, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
-1, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
-1, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
-1, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5,
0, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
0, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
0, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
0, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5,
1, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
1, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
1, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
1, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5,
2, -3.941434, -5.925847, 0, -0.5, 0.5, 0.5,
2, -3.941434, -5.925847, 1, -0.5, 0.5, 0.5,
2, -3.941434, -5.925847, 1, 1.5, 0.5, 0.5,
2, -3.941434, -5.925847, 0, 1.5, 0.5, 0.5
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
-3.992869, -3, -5.161164,
-3.992869, 3, -5.161164,
-3.992869, -3, -5.161164,
-4.165053, -3, -5.416058,
-3.992869, -2, -5.161164,
-4.165053, -2, -5.416058,
-3.992869, -1, -5.161164,
-4.165053, -1, -5.416058,
-3.992869, 0, -5.161164,
-4.165053, 0, -5.416058,
-3.992869, 1, -5.161164,
-4.165053, 1, -5.416058,
-3.992869, 2, -5.161164,
-4.165053, 2, -5.416058,
-3.992869, 3, -5.161164,
-4.165053, 3, -5.416058
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
-4.50942, -3, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, -3, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, -3, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, -3, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, -2, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, -2, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, -2, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, -2, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, -1, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, -1, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, -1, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, -1, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, 0, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, 0, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, 0, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, 0, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, 1, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, 1, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, 1, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, 1, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, 2, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, 2, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, 2, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, 2, -5.925847, 0, 1.5, 0.5, 0.5,
-4.50942, 3, -5.925847, 0, -0.5, 0.5, 0.5,
-4.50942, 3, -5.925847, 1, -0.5, 0.5, 0.5,
-4.50942, 3, -5.925847, 1, 1.5, 0.5, 0.5,
-4.50942, 3, -5.925847, 0, 1.5, 0.5, 0.5
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
-3.992869, -3.436562, -4,
-3.992869, -3.436562, 4,
-3.992869, -3.436562, -4,
-4.165053, -3.604853, -4,
-3.992869, -3.436562, -2,
-4.165053, -3.604853, -2,
-3.992869, -3.436562, 0,
-4.165053, -3.604853, 0,
-3.992869, -3.436562, 2,
-4.165053, -3.604853, 2,
-3.992869, -3.436562, 4,
-4.165053, -3.604853, 4
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
-4.50942, -3.941434, -4, 0, -0.5, 0.5, 0.5,
-4.50942, -3.941434, -4, 1, -0.5, 0.5, 0.5,
-4.50942, -3.941434, -4, 1, 1.5, 0.5, 0.5,
-4.50942, -3.941434, -4, 0, 1.5, 0.5, 0.5,
-4.50942, -3.941434, -2, 0, -0.5, 0.5, 0.5,
-4.50942, -3.941434, -2, 1, -0.5, 0.5, 0.5,
-4.50942, -3.941434, -2, 1, 1.5, 0.5, 0.5,
-4.50942, -3.941434, -2, 0, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 0, 0, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 0, 1, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 0, 1, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 0, 0, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 2, 0, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 2, 1, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 2, 1, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 2, 0, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 4, 0, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 4, 1, -0.5, 0.5, 0.5,
-4.50942, -3.941434, 4, 1, 1.5, 0.5, 0.5,
-4.50942, -3.941434, 4, 0, 1.5, 0.5, 0.5
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
-3.992869, -3.436562, -5.161164,
-3.992869, 3.295055, -5.161164,
-3.992869, -3.436562, 5.034614,
-3.992869, 3.295055, 5.034614,
-3.992869, -3.436562, -5.161164,
-3.992869, -3.436562, 5.034614,
-3.992869, 3.295055, -5.161164,
-3.992869, 3.295055, 5.034614,
-3.992869, -3.436562, -5.161164,
2.894472, -3.436562, -5.161164,
-3.992869, -3.436562, 5.034614,
2.894472, -3.436562, 5.034614,
-3.992869, 3.295055, -5.161164,
2.894472, 3.295055, -5.161164,
-3.992869, 3.295055, 5.034614,
2.894472, 3.295055, 5.034614,
2.894472, -3.436562, -5.161164,
2.894472, 3.295055, -5.161164,
2.894472, -3.436562, 5.034614,
2.894472, 3.295055, 5.034614,
2.894472, -3.436562, -5.161164,
2.894472, -3.436562, 5.034614,
2.894472, 3.295055, -5.161164,
2.894472, 3.295055, 5.034614
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
var radius = 7.489142;
var distance = 33.32004;
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
mvMatrix.translate( 0.5491986, 0.07075357, 0.06327486 );
mvMatrix.scale( 1.175694, 1.202892, 0.7941923 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32004);
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
dimethenamid<-read.table("dimethenamid.xyz")
```

```
## Error in read.table("dimethenamid.xyz"): no lines available in input
```

```r
x<-dimethenamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
```

```r
y<-dimethenamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
```

```r
z<-dimethenamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethenamid' not found
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
-3.892568, -0.8413164, -0.9200926, 0, 0, 1, 1, 1,
-3.244626, 0.2848922, -0.9434426, 1, 0, 0, 1, 1,
-2.649161, -0.9815806, -1.072973, 1, 0, 0, 1, 1,
-2.579875, 0.8449671, -0.227383, 1, 0, 0, 1, 1,
-2.479518, -0.6857908, -3.239986, 1, 0, 0, 1, 1,
-2.44049, 0.4682069, -4.24129, 1, 0, 0, 1, 1,
-2.390293, 0.01869051, -1.202359, 0, 0, 0, 1, 1,
-2.306795, -0.9792272, -1.846534, 0, 0, 0, 1, 1,
-2.233358, -0.07205297, -1.407436, 0, 0, 0, 1, 1,
-2.21624, -1.632413, -1.135524, 0, 0, 0, 1, 1,
-2.215352, -0.2126268, -0.7046667, 0, 0, 0, 1, 1,
-2.187023, 1.819293, -1.769329, 0, 0, 0, 1, 1,
-2.184724, 1.661154, 0.2366899, 0, 0, 0, 1, 1,
-2.175564, -0.04734408, -0.9709556, 1, 1, 1, 1, 1,
-2.145628, 0.2658381, -2.967124, 1, 1, 1, 1, 1,
-2.059555, -0.7019197, -1.372063, 1, 1, 1, 1, 1,
-2.052059, 0.7250874, -1.575729, 1, 1, 1, 1, 1,
-2.031685, 0.01528759, -2.2361, 1, 1, 1, 1, 1,
-2.030786, 1.651639, -0.4208946, 1, 1, 1, 1, 1,
-2.010235, -0.5049083, -1.926119, 1, 1, 1, 1, 1,
-2.009117, 0.8831937, -3.07404, 1, 1, 1, 1, 1,
-1.986215, -2.810233, -3.579656, 1, 1, 1, 1, 1,
-1.97148, 0.1874939, -1.789143, 1, 1, 1, 1, 1,
-1.89006, 1.574298, -1.419922, 1, 1, 1, 1, 1,
-1.869092, 0.5381879, -2.322766, 1, 1, 1, 1, 1,
-1.867893, -1.503216, -0.4551264, 1, 1, 1, 1, 1,
-1.842619, 0.9848343, -0.8927086, 1, 1, 1, 1, 1,
-1.79922, 0.3889845, -0.1257424, 1, 1, 1, 1, 1,
-1.799212, 0.4871184, -1.595572, 0, 0, 1, 1, 1,
-1.771641, -0.8599352, -0.5447955, 1, 0, 0, 1, 1,
-1.771036, -0.03705306, -1.286065, 1, 0, 0, 1, 1,
-1.764387, 0.1287182, -3.411644, 1, 0, 0, 1, 1,
-1.759184, -0.8127226, -3.432882, 1, 0, 0, 1, 1,
-1.703478, 0.7610833, -1.490593, 1, 0, 0, 1, 1,
-1.692926, 0.3480984, -1.284166, 0, 0, 0, 1, 1,
-1.685173, 0.07246488, 0.3005621, 0, 0, 0, 1, 1,
-1.670988, -0.7509289, -2.441886, 0, 0, 0, 1, 1,
-1.662755, 1.675076, -1.270597, 0, 0, 0, 1, 1,
-1.64676, -0.5001255, -2.195615, 0, 0, 0, 1, 1,
-1.626419, 2.080387, -0.9164515, 0, 0, 0, 1, 1,
-1.619044, 0.3796877, -2.037265, 0, 0, 0, 1, 1,
-1.60229, 0.7301466, -2.126616, 1, 1, 1, 1, 1,
-1.575105, 1.416315, 0.5760644, 1, 1, 1, 1, 1,
-1.55257, -0.9063758, -2.893942, 1, 1, 1, 1, 1,
-1.550807, -0.8626036, 0.6927207, 1, 1, 1, 1, 1,
-1.536037, 0.2434798, -0.1497462, 1, 1, 1, 1, 1,
-1.517472, 0.6630164, 1.119221, 1, 1, 1, 1, 1,
-1.501647, 0.2674552, -0.1432058, 1, 1, 1, 1, 1,
-1.471975, 0.2101468, -1.930536, 1, 1, 1, 1, 1,
-1.453359, -1.411393, -3.793514, 1, 1, 1, 1, 1,
-1.445004, 0.9852508, -2.312469, 1, 1, 1, 1, 1,
-1.439084, -0.3646348, -2.341757, 1, 1, 1, 1, 1,
-1.438477, -1.467274, -1.946186, 1, 1, 1, 1, 1,
-1.434836, -2.172281, -2.833738, 1, 1, 1, 1, 1,
-1.431773, 0.156597, -1.915436, 1, 1, 1, 1, 1,
-1.427828, 1.039519, -0.9975584, 1, 1, 1, 1, 1,
-1.417824, 0.04000606, -2.187183, 0, 0, 1, 1, 1,
-1.416525, -1.030652, -2.194627, 1, 0, 0, 1, 1,
-1.402421, -1.099232, -3.187621, 1, 0, 0, 1, 1,
-1.394371, -0.6479939, 0.8983127, 1, 0, 0, 1, 1,
-1.393397, 0.07346524, -1.097731, 1, 0, 0, 1, 1,
-1.364635, 1.316363, -0.3397299, 1, 0, 0, 1, 1,
-1.35318, -0.1577553, -0.8111413, 0, 0, 0, 1, 1,
-1.340705, 0.5765989, -0.47689, 0, 0, 0, 1, 1,
-1.332749, 0.7900881, -0.4190594, 0, 0, 0, 1, 1,
-1.325487, -1.299504, -5.012681, 0, 0, 0, 1, 1,
-1.316049, 0.7558129, -2.925845, 0, 0, 0, 1, 1,
-1.302251, -0.42102, -2.337096, 0, 0, 0, 1, 1,
-1.300566, 0.9283484, -0.3023704, 0, 0, 0, 1, 1,
-1.299178, 1.228697, 0.1205504, 1, 1, 1, 1, 1,
-1.298491, -0.5973949, -3.108685, 1, 1, 1, 1, 1,
-1.289498, 1.679756, 0.6608608, 1, 1, 1, 1, 1,
-1.272365, -0.7276321, -2.632589, 1, 1, 1, 1, 1,
-1.267928, -0.2438279, -2.827021, 1, 1, 1, 1, 1,
-1.256658, -0.07735097, -1.792759, 1, 1, 1, 1, 1,
-1.249375, 0.3284631, -2.215887, 1, 1, 1, 1, 1,
-1.248899, 0.8626122, -1.960013, 1, 1, 1, 1, 1,
-1.236797, 1.231184, -0.9659012, 1, 1, 1, 1, 1,
-1.236548, -0.2754434, -3.227102, 1, 1, 1, 1, 1,
-1.234591, -0.8111483, -2.553378, 1, 1, 1, 1, 1,
-1.232294, -0.3461806, -1.036912, 1, 1, 1, 1, 1,
-1.226914, 0.4426111, 0.443601, 1, 1, 1, 1, 1,
-1.225901, -1.161715, -1.856772, 1, 1, 1, 1, 1,
-1.20692, 3.197022, -0.7202246, 1, 1, 1, 1, 1,
-1.203601, -0.391129, -0.2489491, 0, 0, 1, 1, 1,
-1.201833, 0.3719609, -0.516158, 1, 0, 0, 1, 1,
-1.197711, 0.9776125, -0.2240972, 1, 0, 0, 1, 1,
-1.19705, 0.8682615, -0.7295641, 1, 0, 0, 1, 1,
-1.185258, -0.8497414, -1.546599, 1, 0, 0, 1, 1,
-1.184812, 0.002310699, -1.298745, 1, 0, 0, 1, 1,
-1.171832, 0.2542499, -1.123543, 0, 0, 0, 1, 1,
-1.170776, 0.410957, -1.599176, 0, 0, 0, 1, 1,
-1.167769, 1.612114, 0.9633323, 0, 0, 0, 1, 1,
-1.166952, 1.469607, -0.7210551, 0, 0, 0, 1, 1,
-1.163377, -0.2899638, -1.56319, 0, 0, 0, 1, 1,
-1.160256, -0.4020728, -3.036374, 0, 0, 0, 1, 1,
-1.152446, 1.099974, -0.9832101, 0, 0, 0, 1, 1,
-1.147234, -0.5400799, -1.701673, 1, 1, 1, 1, 1,
-1.142565, -1.150897, -1.978818, 1, 1, 1, 1, 1,
-1.136644, -0.7062174, -2.920381, 1, 1, 1, 1, 1,
-1.136337, -1.91751, -3.182747, 1, 1, 1, 1, 1,
-1.134225, 0.8892936, -2.074283, 1, 1, 1, 1, 1,
-1.120737, -1.451048, -1.907069, 1, 1, 1, 1, 1,
-1.115001, 0.392746, -0.8783852, 1, 1, 1, 1, 1,
-1.113938, 1.439423, -1.832341, 1, 1, 1, 1, 1,
-1.111718, -0.5985961, -2.229819, 1, 1, 1, 1, 1,
-1.109595, 1.03317, -0.5515307, 1, 1, 1, 1, 1,
-1.097284, 0.2764799, -2.001618, 1, 1, 1, 1, 1,
-1.090357, -1.371666, -3.039352, 1, 1, 1, 1, 1,
-1.081228, 1.601745, -1.710207, 1, 1, 1, 1, 1,
-1.078742, 0.2412429, -2.126393, 1, 1, 1, 1, 1,
-1.068068, 0.3060541, -0.7611247, 1, 1, 1, 1, 1,
-1.066975, 0.4644051, -0.3209068, 0, 0, 1, 1, 1,
-1.06587, -0.4484806, -2.558813, 1, 0, 0, 1, 1,
-1.061522, 0.1632521, -1.561041, 1, 0, 0, 1, 1,
-1.05793, -0.351078, -3.134394, 1, 0, 0, 1, 1,
-1.053406, -0.1909758, -0.9517309, 1, 0, 0, 1, 1,
-1.052829, 1.334227, -0.282443, 1, 0, 0, 1, 1,
-1.052805, 0.4220673, 0.4532332, 0, 0, 0, 1, 1,
-1.050486, 1.642459, -0.09109787, 0, 0, 0, 1, 1,
-1.044174, -1.306443, -2.97381, 0, 0, 0, 1, 1,
-1.043662, -1.407667, -3.844175, 0, 0, 0, 1, 1,
-1.039673, 0.3051302, -0.9849344, 0, 0, 0, 1, 1,
-1.028448, -0.7606787, -2.802432, 0, 0, 0, 1, 1,
-1.025993, -0.004608641, -2.565154, 0, 0, 0, 1, 1,
-1.024878, -0.498657, -4.263537, 1, 1, 1, 1, 1,
-1.020373, 0.1551301, -2.388507, 1, 1, 1, 1, 1,
-1.01758, 1.220822, -0.3723417, 1, 1, 1, 1, 1,
-1.010259, 0.1630657, -1.58533, 1, 1, 1, 1, 1,
-1.010221, -1.205205, -0.9317037, 1, 1, 1, 1, 1,
-1.004355, -0.8069328, -1.078698, 1, 1, 1, 1, 1,
-0.9870293, 0.6316777, -3.111341, 1, 1, 1, 1, 1,
-0.9858096, -0.8653083, -3.976556, 1, 1, 1, 1, 1,
-0.9819083, -0.842316, -1.322045, 1, 1, 1, 1, 1,
-0.9743051, -0.6315004, -0.2475703, 1, 1, 1, 1, 1,
-0.9727883, 0.8955389, -0.005761693, 1, 1, 1, 1, 1,
-0.9715415, 0.6792368, -0.2304802, 1, 1, 1, 1, 1,
-0.9713238, -1.159976, -2.701277, 1, 1, 1, 1, 1,
-0.9664267, 1.315559, -0.339964, 1, 1, 1, 1, 1,
-0.964685, 0.4481802, -1.541582, 1, 1, 1, 1, 1,
-0.9579756, 0.7234104, -0.390013, 0, 0, 1, 1, 1,
-0.9562313, 0.5615842, -3.046402, 1, 0, 0, 1, 1,
-0.9544025, -0.1799135, -2.356857, 1, 0, 0, 1, 1,
-0.9536282, 0.1965389, -1.262161, 1, 0, 0, 1, 1,
-0.9492632, 0.03892076, -0.5568397, 1, 0, 0, 1, 1,
-0.948876, 1.040499, -0.2303521, 1, 0, 0, 1, 1,
-0.9430419, -0.05035691, -0.7490937, 0, 0, 0, 1, 1,
-0.9421728, -0.3901317, -2.005138, 0, 0, 0, 1, 1,
-0.9409527, -0.2765737, -1.354842, 0, 0, 0, 1, 1,
-0.9371938, -1.892065, -2.158711, 0, 0, 0, 1, 1,
-0.9260512, 0.8076057, -1.065089, 0, 0, 0, 1, 1,
-0.9256639, -1.160399, -1.567104, 0, 0, 0, 1, 1,
-0.923321, 0.5764424, 0.9072849, 0, 0, 0, 1, 1,
-0.9218358, 0.9369021, -3.44719, 1, 1, 1, 1, 1,
-0.9191787, -0.5475239, -1.944547, 1, 1, 1, 1, 1,
-0.9176466, -1.517624, -2.778927, 1, 1, 1, 1, 1,
-0.9076677, 0.0494452, -2.535573, 1, 1, 1, 1, 1,
-0.9016551, -0.8570023, -2.169983, 1, 1, 1, 1, 1,
-0.8923832, 1.546958, -1.159824, 1, 1, 1, 1, 1,
-0.8847096, 0.01451329, -1.676618, 1, 1, 1, 1, 1,
-0.8798504, -0.9510776, -3.794884, 1, 1, 1, 1, 1,
-0.8768606, 1.228106, -1.204829, 1, 1, 1, 1, 1,
-0.876702, 0.1523317, -1.111352, 1, 1, 1, 1, 1,
-0.8611576, -2.089056, -1.253902, 1, 1, 1, 1, 1,
-0.8580676, -1.40158, -1.524584, 1, 1, 1, 1, 1,
-0.8557369, -0.3238747, -1.721207, 1, 1, 1, 1, 1,
-0.8547467, -0.2723543, -2.660536, 1, 1, 1, 1, 1,
-0.8498001, 0.7808177, -2.3413, 1, 1, 1, 1, 1,
-0.848628, 1.254491, -0.289473, 0, 0, 1, 1, 1,
-0.8462095, -0.2544963, -0.444987, 1, 0, 0, 1, 1,
-0.8439897, 0.4735643, -1.948466, 1, 0, 0, 1, 1,
-0.8439248, -0.8115426, -1.914345, 1, 0, 0, 1, 1,
-0.8380975, -0.05663411, -2.490628, 1, 0, 0, 1, 1,
-0.8347769, -1.470843, -1.242947, 1, 0, 0, 1, 1,
-0.8334368, 0.0178284, -0.8516323, 0, 0, 0, 1, 1,
-0.8320631, 0.253454, 0.3908232, 0, 0, 0, 1, 1,
-0.8257514, 0.2584278, -3.23842, 0, 0, 0, 1, 1,
-0.8199923, -0.541575, -1.647151, 0, 0, 0, 1, 1,
-0.8118025, 0.3596835, -1.766169, 0, 0, 0, 1, 1,
-0.8077513, -0.2021999, -1.227847, 0, 0, 0, 1, 1,
-0.807594, 0.1025646, -1.754938, 0, 0, 0, 1, 1,
-0.8001506, -1.637148, -4.300693, 1, 1, 1, 1, 1,
-0.7985753, 1.874035, -0.8750522, 1, 1, 1, 1, 1,
-0.7953243, 1.416509, -0.8268307, 1, 1, 1, 1, 1,
-0.7928778, 0.1695552, -1.254592, 1, 1, 1, 1, 1,
-0.7928525, 0.4070478, -2.310474, 1, 1, 1, 1, 1,
-0.7925092, -0.5460838, -0.3750469, 1, 1, 1, 1, 1,
-0.7878361, 0.1753294, -0.07443557, 1, 1, 1, 1, 1,
-0.7850212, 1.194888, 0.06876544, 1, 1, 1, 1, 1,
-0.7794886, -0.8452088, -1.565927, 1, 1, 1, 1, 1,
-0.7770513, 0.3151233, -1.664912, 1, 1, 1, 1, 1,
-0.7755374, 0.7180605, 0.1417602, 1, 1, 1, 1, 1,
-0.7731333, -0.8710825, -4.074063, 1, 1, 1, 1, 1,
-0.7704189, 0.6394818, -0.7337138, 1, 1, 1, 1, 1,
-0.7701994, -0.3677822, -3.457651, 1, 1, 1, 1, 1,
-0.768361, -1.546984, -3.545841, 1, 1, 1, 1, 1,
-0.7565604, 0.6918237, -1.247143, 0, 0, 1, 1, 1,
-0.7525727, -0.02873568, -0.285124, 1, 0, 0, 1, 1,
-0.7456048, 0.2648926, -0.4962491, 1, 0, 0, 1, 1,
-0.7445889, 0.8172001, -0.5954845, 1, 0, 0, 1, 1,
-0.7427413, 0.8889037, -1.334556, 1, 0, 0, 1, 1,
-0.7398888, -1.680033, -1.516437, 1, 0, 0, 1, 1,
-0.7340114, 0.414772, -0.3894855, 0, 0, 0, 1, 1,
-0.7303175, 1.194306, 0.2902051, 0, 0, 0, 1, 1,
-0.7285145, -0.280736, -2.45363, 0, 0, 0, 1, 1,
-0.7280457, 0.1641974, -1.965158, 0, 0, 0, 1, 1,
-0.7272767, -0.6088464, -0.5021008, 0, 0, 0, 1, 1,
-0.7208413, -0.7735077, -2.817965, 0, 0, 0, 1, 1,
-0.7129577, 2.224175, -0.6542368, 0, 0, 0, 1, 1,
-0.7123826, -0.09071309, -1.269685, 1, 1, 1, 1, 1,
-0.7097538, 0.1176276, -0.1270212, 1, 1, 1, 1, 1,
-0.7041032, -1.403287, -3.261745, 1, 1, 1, 1, 1,
-0.7033476, 0.5135731, -1.299826, 1, 1, 1, 1, 1,
-0.7007445, 1.34912, 0.4793352, 1, 1, 1, 1, 1,
-0.6901144, 0.619987, -0.0186384, 1, 1, 1, 1, 1,
-0.6897517, -0.2471372, -2.045885, 1, 1, 1, 1, 1,
-0.6861753, -2.038904, -1.731713, 1, 1, 1, 1, 1,
-0.6821558, -0.6132392, -2.368825, 1, 1, 1, 1, 1,
-0.6818737, 1.631934, 0.1574496, 1, 1, 1, 1, 1,
-0.6805072, -0.6313382, -2.119423, 1, 1, 1, 1, 1,
-0.6763536, 0.1522158, -1.263082, 1, 1, 1, 1, 1,
-0.6751422, -0.1785845, -1.863683, 1, 1, 1, 1, 1,
-0.6741496, -0.4816689, -2.031565, 1, 1, 1, 1, 1,
-0.6720572, -0.1566345, -1.758788, 1, 1, 1, 1, 1,
-0.671742, -2.044508, -4.172565, 0, 0, 1, 1, 1,
-0.6704639, 0.8224759, -0.3300458, 1, 0, 0, 1, 1,
-0.66632, -0.6902763, -2.148775, 1, 0, 0, 1, 1,
-0.6647394, -0.9742659, -3.981656, 1, 0, 0, 1, 1,
-0.6561791, -0.5831604, -0.9845362, 1, 0, 0, 1, 1,
-0.6559152, 0.1549173, -1.219017, 1, 0, 0, 1, 1,
-0.6557637, 0.5693873, -0.8590849, 0, 0, 0, 1, 1,
-0.6468967, 0.3466831, -1.735146, 0, 0, 0, 1, 1,
-0.6424827, 0.1587161, -1.214923, 0, 0, 0, 1, 1,
-0.6416541, 2.305791, 1.243703, 0, 0, 0, 1, 1,
-0.6401339, 0.5586047, -3.977356, 0, 0, 0, 1, 1,
-0.6389139, -1.37428, -2.199386, 0, 0, 0, 1, 1,
-0.6382952, 1.205722, -0.1657286, 0, 0, 0, 1, 1,
-0.636246, -0.5055832, -2.161448, 1, 1, 1, 1, 1,
-0.6361234, -0.7439247, -2.342057, 1, 1, 1, 1, 1,
-0.6349376, -0.5817112, -1.60023, 1, 1, 1, 1, 1,
-0.6319948, 0.9576194, -2.438035, 1, 1, 1, 1, 1,
-0.630483, 1.290048, 1.249479, 1, 1, 1, 1, 1,
-0.6272675, 0.471896, -0.6903607, 1, 1, 1, 1, 1,
-0.6270375, -1.56467, -1.428857, 1, 1, 1, 1, 1,
-0.6268882, -1.223457, -4.173813, 1, 1, 1, 1, 1,
-0.626721, 0.3893139, -0.8621675, 1, 1, 1, 1, 1,
-0.623513, -1.628622, -4.390557, 1, 1, 1, 1, 1,
-0.6219119, 0.7952266, -0.7289513, 1, 1, 1, 1, 1,
-0.6163728, -0.1016841, -1.523684, 1, 1, 1, 1, 1,
-0.6151035, 0.4152163, -0.003863923, 1, 1, 1, 1, 1,
-0.6133643, -0.1352788, -0.8661289, 1, 1, 1, 1, 1,
-0.6122366, 0.4301218, -1.629111, 1, 1, 1, 1, 1,
-0.6091488, 1.569133, 0.09016902, 0, 0, 1, 1, 1,
-0.6056266, -1.272286, -2.34031, 1, 0, 0, 1, 1,
-0.60048, -0.3280805, -1.492266, 1, 0, 0, 1, 1,
-0.6003835, 0.7378461, -0.721218, 1, 0, 0, 1, 1,
-0.5985923, -0.2088561, 0.4469645, 1, 0, 0, 1, 1,
-0.5888273, 1.261035, -1.704682, 1, 0, 0, 1, 1,
-0.5870908, 0.6589642, 0.1008513, 0, 0, 0, 1, 1,
-0.5859728, -2.325468, -3.900908, 0, 0, 0, 1, 1,
-0.5850419, -1.628594, -3.418173, 0, 0, 0, 1, 1,
-0.5834405, 0.003710426, -2.685078, 0, 0, 0, 1, 1,
-0.5784842, -0.08727821, -0.7735907, 0, 0, 0, 1, 1,
-0.574477, 0.8784446, 1.327784, 0, 0, 0, 1, 1,
-0.572262, 0.6488465, 0.2181829, 0, 0, 0, 1, 1,
-0.5708255, -0.282975, -2.791052, 1, 1, 1, 1, 1,
-0.5707853, 2.031085, 1.720023, 1, 1, 1, 1, 1,
-0.5632105, -1.092793, -2.171527, 1, 1, 1, 1, 1,
-0.5532808, -0.8808702, -3.208795, 1, 1, 1, 1, 1,
-0.5520841, 1.169468, -0.7536489, 1, 1, 1, 1, 1,
-0.5475329, -0.2555981, -1.407956, 1, 1, 1, 1, 1,
-0.5462244, -0.03155744, -3.192425, 1, 1, 1, 1, 1,
-0.5456527, 0.4899058, -0.3249689, 1, 1, 1, 1, 1,
-0.5453374, -0.9023436, -0.4515863, 1, 1, 1, 1, 1,
-0.5437423, -2.036132, -2.474481, 1, 1, 1, 1, 1,
-0.5385975, 0.5895071, 1.274308, 1, 1, 1, 1, 1,
-0.5357657, 0.4424974, -1.045424, 1, 1, 1, 1, 1,
-0.5357389, 0.1467277, -1.307737, 1, 1, 1, 1, 1,
-0.5330566, 0.437572, 0.344478, 1, 1, 1, 1, 1,
-0.5329779, -1.509811, -4.165987, 1, 1, 1, 1, 1,
-0.5320629, -0.2042881, -1.166099, 0, 0, 1, 1, 1,
-0.5317396, 0.7374074, -1.771237, 1, 0, 0, 1, 1,
-0.5292129, -0.06941947, -1.984993, 1, 0, 0, 1, 1,
-0.5282387, 1.05842, -0.9300333, 1, 0, 0, 1, 1,
-0.5277284, 0.8904177, -0.4423786, 1, 0, 0, 1, 1,
-0.5229343, -0.9480026, -3.463815, 1, 0, 0, 1, 1,
-0.5211009, -1.227827, -3.145789, 0, 0, 0, 1, 1,
-0.5202364, 0.1528689, -1.771634, 0, 0, 0, 1, 1,
-0.5200266, 0.03176088, -2.135973, 0, 0, 0, 1, 1,
-0.5189131, -1.13864, -3.213977, 0, 0, 0, 1, 1,
-0.5180256, 0.1662142, -0.8351949, 0, 0, 0, 1, 1,
-0.5152974, 0.5485032, 0.6091164, 0, 0, 0, 1, 1,
-0.514236, -1.285507, -2.192824, 0, 0, 0, 1, 1,
-0.508803, 0.3178537, -1.896617, 1, 1, 1, 1, 1,
-0.5037544, 0.9256121, -1.715489, 1, 1, 1, 1, 1,
-0.5004854, -1.516958, -2.544591, 1, 1, 1, 1, 1,
-0.4992418, -0.1453386, 0.09136745, 1, 1, 1, 1, 1,
-0.4983391, -1.395911, -2.646361, 1, 1, 1, 1, 1,
-0.4954844, 0.7615178, 1.379238, 1, 1, 1, 1, 1,
-0.4945385, 0.07509772, -2.369602, 1, 1, 1, 1, 1,
-0.4937798, -0.6230532, -2.282548, 1, 1, 1, 1, 1,
-0.4935452, 0.1957203, -1.660196, 1, 1, 1, 1, 1,
-0.4929591, 0.3427231, 0.07230048, 1, 1, 1, 1, 1,
-0.4929271, 0.1463305, -0.6045891, 1, 1, 1, 1, 1,
-0.4917227, -0.05180062, -1.848271, 1, 1, 1, 1, 1,
-0.4905876, 0.1984907, -0.4922535, 1, 1, 1, 1, 1,
-0.4874449, -1.02185, -3.4748, 1, 1, 1, 1, 1,
-0.4852127, 2.389407, 0.4736922, 1, 1, 1, 1, 1,
-0.4840582, 0.0008734853, -3.69744, 0, 0, 1, 1, 1,
-0.4814841, 0.6623659, -2.464707, 1, 0, 0, 1, 1,
-0.4802937, -0.4121233, -1.094383, 1, 0, 0, 1, 1,
-0.4757706, 0.1864541, -2.036035, 1, 0, 0, 1, 1,
-0.4714227, 0.03756527, -3.132696, 1, 0, 0, 1, 1,
-0.4706047, 0.4662821, -2.306134, 1, 0, 0, 1, 1,
-0.470203, 0.8786649, -0.5741771, 0, 0, 0, 1, 1,
-0.46668, 0.3052849, -0.8707018, 0, 0, 0, 1, 1,
-0.4639012, 0.2775809, -1.157668, 0, 0, 0, 1, 1,
-0.4631662, -0.5020214, -2.599763, 0, 0, 0, 1, 1,
-0.4595452, -1.233939, -1.394722, 0, 0, 0, 1, 1,
-0.4471663, -0.5450917, -3.872515, 0, 0, 0, 1, 1,
-0.446426, 0.03334031, -0.5160784, 0, 0, 0, 1, 1,
-0.4463097, 0.8247533, -0.7159553, 1, 1, 1, 1, 1,
-0.4460811, 0.2748334, -1.353753, 1, 1, 1, 1, 1,
-0.4452198, 0.602172, -0.1520566, 1, 1, 1, 1, 1,
-0.4440721, 0.498356, -1.966582, 1, 1, 1, 1, 1,
-0.4330731, -0.5918629, -2.317251, 1, 1, 1, 1, 1,
-0.4305905, -1.282905, -3.368747, 1, 1, 1, 1, 1,
-0.428962, 0.3543201, 1.339858, 1, 1, 1, 1, 1,
-0.4236098, 0.1844786, -0.6397122, 1, 1, 1, 1, 1,
-0.423167, 0.2642992, -2.060989, 1, 1, 1, 1, 1,
-0.4197648, -0.3195418, -2.794634, 1, 1, 1, 1, 1,
-0.4184673, 1.569485, -0.4175092, 1, 1, 1, 1, 1,
-0.4170421, 0.4805578, -0.4223634, 1, 1, 1, 1, 1,
-0.4121632, -0.4667855, -1.547805, 1, 1, 1, 1, 1,
-0.4079936, -0.3467948, -3.303463, 1, 1, 1, 1, 1,
-0.4067762, -1.011574, -2.317269, 1, 1, 1, 1, 1,
-0.4048841, 0.3734137, -0.04518837, 0, 0, 1, 1, 1,
-0.4039216, -0.06804544, -2.521442, 1, 0, 0, 1, 1,
-0.3999573, -0.4099116, -4.083488, 1, 0, 0, 1, 1,
-0.3998963, 0.4675002, -0.7056049, 1, 0, 0, 1, 1,
-0.3982094, -0.9432989, -2.158447, 1, 0, 0, 1, 1,
-0.3976443, -0.03047284, -2.639778, 1, 0, 0, 1, 1,
-0.3948771, 0.1997601, -0.2910888, 0, 0, 0, 1, 1,
-0.3925007, 2.929235, -0.3096282, 0, 0, 0, 1, 1,
-0.3879794, 0.2402522, 0.33131, 0, 0, 0, 1, 1,
-0.3832859, 0.08141797, -1.585219, 0, 0, 0, 1, 1,
-0.38283, 0.6724855, -1.096971, 0, 0, 0, 1, 1,
-0.3723434, -0.4835163, -2.092711, 0, 0, 0, 1, 1,
-0.3675511, -2.056938, -2.980781, 0, 0, 0, 1, 1,
-0.3633734, 0.1244653, -3.911675, 1, 1, 1, 1, 1,
-0.3548056, -0.3998274, -1.534197, 1, 1, 1, 1, 1,
-0.3542502, -1.381769, -4.524422, 1, 1, 1, 1, 1,
-0.3526039, 0.5459669, -0.8194937, 1, 1, 1, 1, 1,
-0.3466036, 2.482306, 0.5375125, 1, 1, 1, 1, 1,
-0.3460938, -0.3175586, -2.732117, 1, 1, 1, 1, 1,
-0.341262, 1.838135, -0.2923534, 1, 1, 1, 1, 1,
-0.3384846, -0.4852463, 0.06334876, 1, 1, 1, 1, 1,
-0.3376172, 0.8260039, -0.3195925, 1, 1, 1, 1, 1,
-0.3320407, -0.1390944, -2.061142, 1, 1, 1, 1, 1,
-0.3316453, -1.893448, -1.815085, 1, 1, 1, 1, 1,
-0.3311818, -0.9530859, -2.509224, 1, 1, 1, 1, 1,
-0.3309629, -1.112671, -2.858153, 1, 1, 1, 1, 1,
-0.3262571, -0.1725694, -2.337303, 1, 1, 1, 1, 1,
-0.319021, 0.03169671, -1.801874, 1, 1, 1, 1, 1,
-0.3162879, 0.4577274, -0.9542419, 0, 0, 1, 1, 1,
-0.3124404, -0.1516088, -2.531852, 1, 0, 0, 1, 1,
-0.3107752, 0.9725682, 0.01443119, 1, 0, 0, 1, 1,
-0.3105929, 1.911344, -0.09727219, 1, 0, 0, 1, 1,
-0.3102675, -2.560932, -2.698653, 1, 0, 0, 1, 1,
-0.3066467, -1.472381, -3.232784, 1, 0, 0, 1, 1,
-0.3054003, 0.2621329, 1.599901, 0, 0, 0, 1, 1,
-0.2990945, 0.9448839, -0.9252573, 0, 0, 0, 1, 1,
-0.2983817, -0.774184, -2.579146, 0, 0, 0, 1, 1,
-0.2967817, 0.1764621, -2.966228, 0, 0, 0, 1, 1,
-0.2956814, -1.346289, -4.243071, 0, 0, 0, 1, 1,
-0.2940615, 0.1944477, -2.17996, 0, 0, 0, 1, 1,
-0.2931588, 0.3702172, 0.6878342, 0, 0, 0, 1, 1,
-0.291527, -0.6017689, -1.879967, 1, 1, 1, 1, 1,
-0.2915022, 1.964373, 0.4167066, 1, 1, 1, 1, 1,
-0.2891178, -0.2742709, -1.98424, 1, 1, 1, 1, 1,
-0.2881982, -0.1079567, -1.20798, 1, 1, 1, 1, 1,
-0.2873641, 0.4999027, 0.7062004, 1, 1, 1, 1, 1,
-0.2821622, 0.539099, -0.3409219, 1, 1, 1, 1, 1,
-0.2808852, 0.5351889, 0.9117655, 1, 1, 1, 1, 1,
-0.2769245, 0.9178218, -0.3452207, 1, 1, 1, 1, 1,
-0.2732313, -0.6521732, 0.006396909, 1, 1, 1, 1, 1,
-0.2728388, 2.613282, 1.524043, 1, 1, 1, 1, 1,
-0.2717781, -2.590678, -1.705095, 1, 1, 1, 1, 1,
-0.2690025, 1.032556, -1.134856, 1, 1, 1, 1, 1,
-0.2688584, 0.673806, -0.8592978, 1, 1, 1, 1, 1,
-0.266762, 0.8504944, 0.1687011, 1, 1, 1, 1, 1,
-0.2664471, 0.323094, -0.6598852, 1, 1, 1, 1, 1,
-0.2643312, 1.148152, 1.196022, 0, 0, 1, 1, 1,
-0.2635962, -1.031054, -3.742303, 1, 0, 0, 1, 1,
-0.2626681, -0.5912428, -2.753986, 1, 0, 0, 1, 1,
-0.2602921, 1.16387, -1.148875, 1, 0, 0, 1, 1,
-0.2587805, 0.5387543, -1.348246, 1, 0, 0, 1, 1,
-0.257377, -0.9305531, -1.551871, 1, 0, 0, 1, 1,
-0.2567531, -1.679645, -2.506152, 0, 0, 0, 1, 1,
-0.2546717, 1.894907, -0.5224659, 0, 0, 0, 1, 1,
-0.2545972, 0.8142016, -0.8686373, 0, 0, 0, 1, 1,
-0.2494321, -0.5953088, -2.791908, 0, 0, 0, 1, 1,
-0.2443372, 0.77715, 0.8041358, 0, 0, 0, 1, 1,
-0.2415907, -1.733542, -1.750807, 0, 0, 0, 1, 1,
-0.2411715, -0.9223711, -0.2080173, 0, 0, 0, 1, 1,
-0.2380694, -0.9908772, -3.383907, 1, 1, 1, 1, 1,
-0.2358373, -0.9257171, -2.601173, 1, 1, 1, 1, 1,
-0.2344415, 0.9486078, -1.239932, 1, 1, 1, 1, 1,
-0.2323875, 0.7380747, 0.02137796, 1, 1, 1, 1, 1,
-0.2288089, -0.8722938, -3.674201, 1, 1, 1, 1, 1,
-0.2283851, -0.3532489, -1.424081, 1, 1, 1, 1, 1,
-0.2263486, 0.8736936, 0.7322181, 1, 1, 1, 1, 1,
-0.2202902, 1.385537, 1.427119, 1, 1, 1, 1, 1,
-0.2122453, -0.6933709, -3.481547, 1, 1, 1, 1, 1,
-0.2120922, -0.4322807, -2.831656, 1, 1, 1, 1, 1,
-0.205326, -1.133282, -2.343844, 1, 1, 1, 1, 1,
-0.2041927, -2.281769, -3.366241, 1, 1, 1, 1, 1,
-0.1984986, -0.5648233, -0.6012464, 1, 1, 1, 1, 1,
-0.1975818, -1.741424, -2.111475, 1, 1, 1, 1, 1,
-0.196617, -0.06234166, -3.769191, 1, 1, 1, 1, 1,
-0.1964131, -0.6593724, -2.183658, 0, 0, 1, 1, 1,
-0.1961472, 0.8009552, -0.1983504, 1, 0, 0, 1, 1,
-0.1895895, 0.1879106, -1.696915, 1, 0, 0, 1, 1,
-0.18953, -0.3045092, -4.225339, 1, 0, 0, 1, 1,
-0.1888876, 0.3946281, -0.4538267, 1, 0, 0, 1, 1,
-0.1862773, -0.4765058, -3.4639, 1, 0, 0, 1, 1,
-0.1810734, 2.59816, 0.202302, 0, 0, 0, 1, 1,
-0.1785845, -0.002680585, -1.663835, 0, 0, 0, 1, 1,
-0.1751833, 0.3821633, -0.2829561, 0, 0, 0, 1, 1,
-0.1743783, -0.0674722, -0.4219445, 0, 0, 0, 1, 1,
-0.1742909, 1.285906, 1.296865, 0, 0, 0, 1, 1,
-0.1734976, 0.3209077, 0.4240804, 0, 0, 0, 1, 1,
-0.1715277, -1.150287, -3.016604, 0, 0, 0, 1, 1,
-0.1708586, 1.666817, -0.1342365, 1, 1, 1, 1, 1,
-0.1697736, -1.065996, -3.537251, 1, 1, 1, 1, 1,
-0.1622322, -0.1698066, -2.649345, 1, 1, 1, 1, 1,
-0.160748, -0.4730338, -3.432705, 1, 1, 1, 1, 1,
-0.1603635, -0.1365295, -2.440299, 1, 1, 1, 1, 1,
-0.156933, -0.006130381, -1.32523, 1, 1, 1, 1, 1,
-0.1540904, -0.2742037, -2.888983, 1, 1, 1, 1, 1,
-0.1524942, -1.845347, -4.27846, 1, 1, 1, 1, 1,
-0.1519082, 0.5819507, 1.445557, 1, 1, 1, 1, 1,
-0.1479295, -1.450836, -2.37868, 1, 1, 1, 1, 1,
-0.14516, -0.2215879, -1.964178, 1, 1, 1, 1, 1,
-0.143164, -0.04913768, -2.200601, 1, 1, 1, 1, 1,
-0.1428253, 0.001451136, -2.047608, 1, 1, 1, 1, 1,
-0.1401288, -1.420316, -2.5915, 1, 1, 1, 1, 1,
-0.1384751, 1.019784, -0.715502, 1, 1, 1, 1, 1,
-0.1301088, 0.3103607, 0.7743142, 0, 0, 1, 1, 1,
-0.1267966, -0.3165202, -2.96558, 1, 0, 0, 1, 1,
-0.1239681, -1.499321, -3.088737, 1, 0, 0, 1, 1,
-0.1169513, -0.024239, -2.523328, 1, 0, 0, 1, 1,
-0.113424, 1.557645, 0.4808001, 1, 0, 0, 1, 1,
-0.1090414, 0.2166904, -0.9820077, 1, 0, 0, 1, 1,
-0.1073781, -2.03347, -2.825596, 0, 0, 0, 1, 1,
-0.1018219, 0.9678717, 0.2696638, 0, 0, 0, 1, 1,
-0.09830074, -1.169411, -4.944886, 0, 0, 0, 1, 1,
-0.09809412, 1.240481, -0.2606011, 0, 0, 0, 1, 1,
-0.09793752, 1.455866, -0.2737208, 0, 0, 0, 1, 1,
-0.09786326, -1.096897, -3.109368, 0, 0, 0, 1, 1,
-0.09459128, -1.257494, -3.931559, 0, 0, 0, 1, 1,
-0.09267141, 0.3307725, -0.870917, 1, 1, 1, 1, 1,
-0.08991632, 1.011826, 0.00420689, 1, 1, 1, 1, 1,
-0.08981538, -1.16537, -2.826076, 1, 1, 1, 1, 1,
-0.08845648, 0.7747782, -1.041467, 1, 1, 1, 1, 1,
-0.0865121, 0.04870098, -0.02534193, 1, 1, 1, 1, 1,
-0.07940982, 0.8860193, -0.3195651, 1, 1, 1, 1, 1,
-0.07859883, 0.529531, -0.6645026, 1, 1, 1, 1, 1,
-0.0772919, 0.05960045, -0.4523067, 1, 1, 1, 1, 1,
-0.07550967, 2.45317, -1.761711, 1, 1, 1, 1, 1,
-0.07203947, 0.2977434, 0.6988068, 1, 1, 1, 1, 1,
-0.06809284, -0.36541, -2.788981, 1, 1, 1, 1, 1,
-0.06524914, 0.07323235, 0.258743, 1, 1, 1, 1, 1,
-0.06491213, -1.077364, -3.942518, 1, 1, 1, 1, 1,
-0.06419574, 0.2462594, 0.7734438, 1, 1, 1, 1, 1,
-0.057879, 0.2062652, -1.693594, 1, 1, 1, 1, 1,
-0.05479149, 0.802807, 0.1815483, 0, 0, 1, 1, 1,
-0.05087551, 0.2113371, 1.092392, 1, 0, 0, 1, 1,
-0.05071454, 0.9265802, 1.269389, 1, 0, 0, 1, 1,
-0.03954342, -0.7443484, -3.859632, 1, 0, 0, 1, 1,
-0.03108291, 1.417704, 0.7618452, 1, 0, 0, 1, 1,
-0.03093996, -0.6856587, -4.192482, 1, 0, 0, 1, 1,
-0.02972709, -0.1964357, -3.788495, 0, 0, 0, 1, 1,
-0.02467586, -0.692735, -2.212727, 0, 0, 0, 1, 1,
-0.02033673, 0.5392327, -0.4683287, 0, 0, 0, 1, 1,
-0.01979297, -0.3029206, -2.764305, 0, 0, 0, 1, 1,
-0.01256793, -0.1170933, -3.234466, 0, 0, 0, 1, 1,
-0.009625234, 1.365432, -0.1939429, 0, 0, 0, 1, 1,
-0.002318936, 0.2345808, -0.3742507, 0, 0, 0, 1, 1,
0.00738271, 2.198596, -1.292044, 1, 1, 1, 1, 1,
0.008859923, 0.9323148, 0.04226856, 1, 1, 1, 1, 1,
0.01251388, -0.9177064, 3.092181, 1, 1, 1, 1, 1,
0.02234985, -0.2240797, 4.388255, 1, 1, 1, 1, 1,
0.022966, 1.668598, -0.1421518, 1, 1, 1, 1, 1,
0.02626637, 0.0951589, 0.5665041, 1, 1, 1, 1, 1,
0.02647104, -1.303954, 4.217729, 1, 1, 1, 1, 1,
0.02834256, -0.09821782, 2.265888, 1, 1, 1, 1, 1,
0.03021578, 0.6842641, -0.237272, 1, 1, 1, 1, 1,
0.0311051, 0.08921163, 2.353086, 1, 1, 1, 1, 1,
0.03181706, 0.5316735, -1.847016, 1, 1, 1, 1, 1,
0.03336533, -1.367492, 3.268135, 1, 1, 1, 1, 1,
0.03576538, 1.746699, -0.5392501, 1, 1, 1, 1, 1,
0.03757015, 1.108694, 1.142696, 1, 1, 1, 1, 1,
0.04035084, 0.5556678, -1.641691, 1, 1, 1, 1, 1,
0.04318413, -1.710918, 3.299103, 0, 0, 1, 1, 1,
0.04757212, 0.1819106, 1.12714, 1, 0, 0, 1, 1,
0.05127197, 1.437508, -1.980127, 1, 0, 0, 1, 1,
0.05226231, -0.8289016, 2.647805, 1, 0, 0, 1, 1,
0.05508768, -0.6892872, 2.784699, 1, 0, 0, 1, 1,
0.05929454, -0.03464973, 1.02184, 1, 0, 0, 1, 1,
0.06081236, -1.536091, 2.135177, 0, 0, 0, 1, 1,
0.06090591, 1.051526, -1.467537, 0, 0, 0, 1, 1,
0.06378578, -0.9070208, 4.242489, 0, 0, 0, 1, 1,
0.06392264, 0.1579259, 1.321247, 0, 0, 0, 1, 1,
0.06424566, 1.583724, 0.9785703, 0, 0, 0, 1, 1,
0.06433631, 0.07355067, 1.746169, 0, 0, 0, 1, 1,
0.06694451, -0.09041227, 2.656648, 0, 0, 0, 1, 1,
0.06823228, -0.2368872, 3.110935, 1, 1, 1, 1, 1,
0.07100023, -0.4760213, 2.898875, 1, 1, 1, 1, 1,
0.07256688, 1.294458, 0.6507663, 1, 1, 1, 1, 1,
0.07260355, -1.154236, 4.537809, 1, 1, 1, 1, 1,
0.07289379, -0.02577001, 2.586668, 1, 1, 1, 1, 1,
0.07384316, -0.2554912, 2.328343, 1, 1, 1, 1, 1,
0.07678237, 0.7868647, 0.4014646, 1, 1, 1, 1, 1,
0.08462841, 1.386446, -1.132558, 1, 1, 1, 1, 1,
0.08599542, -1.069684, 1.606835, 1, 1, 1, 1, 1,
0.08635712, -0.03349122, 3.022754, 1, 1, 1, 1, 1,
0.08835109, -0.274635, 3.648244, 1, 1, 1, 1, 1,
0.09060741, 0.9189786, 0.6485235, 1, 1, 1, 1, 1,
0.09102026, -1.435411, 2.800035, 1, 1, 1, 1, 1,
0.09570676, -0.5996997, 3.674438, 1, 1, 1, 1, 1,
0.0983343, -0.04553503, 2.451299, 1, 1, 1, 1, 1,
0.09995171, -0.3381888, 2.948483, 0, 0, 1, 1, 1,
0.1001959, 0.431101, 0.3332655, 1, 0, 0, 1, 1,
0.100767, 0.2601981, -0.5675776, 1, 0, 0, 1, 1,
0.1027646, 0.3135902, 0.1828159, 1, 0, 0, 1, 1,
0.102937, 0.4819232, -1.935704, 1, 0, 0, 1, 1,
0.1045062, 0.4203905, -0.3788261, 1, 0, 0, 1, 1,
0.107146, 0.004203451, 0.4215567, 0, 0, 0, 1, 1,
0.1075776, -0.850305, 4.455143, 0, 0, 0, 1, 1,
0.1102768, 0.2475835, 0.4645754, 0, 0, 0, 1, 1,
0.1109937, 0.87268, 0.8115795, 0, 0, 0, 1, 1,
0.1112998, 1.968273, 1.050257, 0, 0, 0, 1, 1,
0.1116858, -0.5724456, 2.101201, 0, 0, 0, 1, 1,
0.1126011, -1.058331, 4.059939, 0, 0, 0, 1, 1,
0.1159127, -0.7593505, 1.728085, 1, 1, 1, 1, 1,
0.1185476, 0.3356954, 3.804924, 1, 1, 1, 1, 1,
0.1224015, -0.6632245, 3.055383, 1, 1, 1, 1, 1,
0.123178, -1.567721, 3.157279, 1, 1, 1, 1, 1,
0.1233218, -0.01961548, 0.9784229, 1, 1, 1, 1, 1,
0.1274594, -0.9742469, 2.83038, 1, 1, 1, 1, 1,
0.1295108, -3.338529, 3.306839, 1, 1, 1, 1, 1,
0.1318193, 0.3505514, -0.7589137, 1, 1, 1, 1, 1,
0.1323669, -1.219914, 3.572095, 1, 1, 1, 1, 1,
0.1355134, -1.687039, 1.181793, 1, 1, 1, 1, 1,
0.1435374, -0.5797712, 1.955389, 1, 1, 1, 1, 1,
0.1488845, -1.060023, 2.610991, 1, 1, 1, 1, 1,
0.149911, -0.5504971, 2.417521, 1, 1, 1, 1, 1,
0.1541608, 0.1996275, 1.632944, 1, 1, 1, 1, 1,
0.1565191, -1.008124, 3.111592, 1, 1, 1, 1, 1,
0.1620777, 0.2395287, 0.402889, 0, 0, 1, 1, 1,
0.1644345, -0.6446629, 2.769641, 1, 0, 0, 1, 1,
0.1766159, 0.4744495, 0.5372687, 1, 0, 0, 1, 1,
0.1775284, -0.8704098, 2.065741, 1, 0, 0, 1, 1,
0.1779324, -0.3284778, 2.699246, 1, 0, 0, 1, 1,
0.1805154, 0.3872355, 1.959001, 1, 0, 0, 1, 1,
0.1831839, -0.3361029, 0.5085386, 0, 0, 0, 1, 1,
0.1874673, 0.6833954, 0.9844556, 0, 0, 0, 1, 1,
0.1894324, 0.8299221, 0.6850196, 0, 0, 0, 1, 1,
0.1911798, -0.6313839, 3.774484, 0, 0, 0, 1, 1,
0.1916091, 0.08190007, 0.8065314, 0, 0, 0, 1, 1,
0.1917437, 1.276332, 0.4788405, 0, 0, 0, 1, 1,
0.1929052, -0.06519589, 2.381987, 0, 0, 0, 1, 1,
0.1943596, 1.214859, -1.043543, 1, 1, 1, 1, 1,
0.1966317, -1.193404, 3.036897, 1, 1, 1, 1, 1,
0.1966995, 0.5601327, 1.015466, 1, 1, 1, 1, 1,
0.2017887, 0.8794997, 1.091589, 1, 1, 1, 1, 1,
0.2067191, -0.9635007, 1.989318, 1, 1, 1, 1, 1,
0.2101351, 0.7624681, 1.95982, 1, 1, 1, 1, 1,
0.2128918, -0.3628672, 3.985317, 1, 1, 1, 1, 1,
0.2142854, -0.358588, 4.393113, 1, 1, 1, 1, 1,
0.215917, -0.4108435, 2.83053, 1, 1, 1, 1, 1,
0.2161124, 0.5967077, 0.06356924, 1, 1, 1, 1, 1,
0.2201839, 0.121074, 1.703623, 1, 1, 1, 1, 1,
0.2205757, 1.022298, 1.037025, 1, 1, 1, 1, 1,
0.2291116, -1.15023, 4.522967, 1, 1, 1, 1, 1,
0.2291473, 0.7634863, 0.9954418, 1, 1, 1, 1, 1,
0.2302093, -0.9998327, 3.069214, 1, 1, 1, 1, 1,
0.2349536, 0.4184395, 0.1572639, 0, 0, 1, 1, 1,
0.2360128, -1.297707, 3.723857, 1, 0, 0, 1, 1,
0.2373888, -2.592657, 0.8185927, 1, 0, 0, 1, 1,
0.2456233, -1.766326, 1.786456, 1, 0, 0, 1, 1,
0.2460064, 0.6537443, 1.04847, 1, 0, 0, 1, 1,
0.2462168, 0.7682956, 1.061767, 1, 0, 0, 1, 1,
0.2477062, 1.666921, -0.2175653, 0, 0, 0, 1, 1,
0.2502797, 0.7210761, 0.305966, 0, 0, 0, 1, 1,
0.2529405, -2.353791, 2.843917, 0, 0, 0, 1, 1,
0.2573404, 0.7038495, 1.164035, 0, 0, 0, 1, 1,
0.2601002, 0.4155923, 0.179218, 0, 0, 0, 1, 1,
0.2662904, 1.115452, -0.5966743, 0, 0, 0, 1, 1,
0.2691466, -0.1120765, 2.975745, 0, 0, 0, 1, 1,
0.269592, 0.601906, 0.3484611, 1, 1, 1, 1, 1,
0.2717926, 0.3092354, 0.1061856, 1, 1, 1, 1, 1,
0.2728579, -2.885422, 2.154669, 1, 1, 1, 1, 1,
0.2734398, -0.8272827, 3.103485, 1, 1, 1, 1, 1,
0.2753154, -1.022062, 2.287691, 1, 1, 1, 1, 1,
0.2755807, -1.860795, 2.429434, 1, 1, 1, 1, 1,
0.2809635, 0.1330626, 0.1575556, 1, 1, 1, 1, 1,
0.2810894, -1.384681, 1.220467, 1, 1, 1, 1, 1,
0.2825489, -0.4677083, 3.951882, 1, 1, 1, 1, 1,
0.2868779, -0.9683412, 4.079557, 1, 1, 1, 1, 1,
0.2920125, -0.508402, 1.172092, 1, 1, 1, 1, 1,
0.2935943, -1.14439, 2.001769, 1, 1, 1, 1, 1,
0.2961275, -0.2622958, 2.894412, 1, 1, 1, 1, 1,
0.2985571, 1.557997, 0.889623, 1, 1, 1, 1, 1,
0.2988651, -1.491457, 1.94519, 1, 1, 1, 1, 1,
0.3061343, 0.4967326, -0.7007723, 0, 0, 1, 1, 1,
0.3073245, -1.099737, 3.112796, 1, 0, 0, 1, 1,
0.30964, 0.08004441, 1.302875, 1, 0, 0, 1, 1,
0.3134284, -1.493452, 2.984739, 1, 0, 0, 1, 1,
0.3152142, -0.5856956, 2.538377, 1, 0, 0, 1, 1,
0.3183848, 0.8382292, 0.8573109, 1, 0, 0, 1, 1,
0.3198966, -0.4869139, 2.945034, 0, 0, 0, 1, 1,
0.3228573, 1.845493, 0.0309425, 0, 0, 0, 1, 1,
0.3250324, 1.39054, 0.09770401, 0, 0, 0, 1, 1,
0.3260013, -0.6798018, 1.58484, 0, 0, 0, 1, 1,
0.3275033, -1.065737, 2.172874, 0, 0, 0, 1, 1,
0.3279469, 0.5280284, 0.6492117, 0, 0, 0, 1, 1,
0.331458, 0.3016719, -0.04125569, 0, 0, 0, 1, 1,
0.3362344, -0.9424745, 3.63383, 1, 1, 1, 1, 1,
0.3369887, -0.7742952, 3.674199, 1, 1, 1, 1, 1,
0.3379933, -0.4117117, 2.261453, 1, 1, 1, 1, 1,
0.3399893, -0.9066457, 3.641353, 1, 1, 1, 1, 1,
0.3430368, 0.5321307, 0.1260339, 1, 1, 1, 1, 1,
0.3431034, -1.53392, 2.918563, 1, 1, 1, 1, 1,
0.3492895, 0.4590611, 0.9169629, 1, 1, 1, 1, 1,
0.3520442, -0.1042599, 1.038161, 1, 1, 1, 1, 1,
0.3581714, 1.946728, 0.2825263, 1, 1, 1, 1, 1,
0.3597814, -1.260659, 1.782524, 1, 1, 1, 1, 1,
0.363206, -0.2165691, 2.940409, 1, 1, 1, 1, 1,
0.3720256, -1.133157, 2.991066, 1, 1, 1, 1, 1,
0.3749343, -0.9299133, 1.568482, 1, 1, 1, 1, 1,
0.3759043, 1.451041, -1.311803, 1, 1, 1, 1, 1,
0.3857382, 0.5130172, 1.176055, 1, 1, 1, 1, 1,
0.3857404, 0.6376482, 1.404508, 0, 0, 1, 1, 1,
0.3858854, 0.166265, -0.7284826, 1, 0, 0, 1, 1,
0.3876512, 0.01876684, 2.260963, 1, 0, 0, 1, 1,
0.3972357, 0.4364923, 0.9181868, 1, 0, 0, 1, 1,
0.3990809, -0.1875393, 0.4450767, 1, 0, 0, 1, 1,
0.4008548, 1.218222, -0.08585884, 1, 0, 0, 1, 1,
0.4030368, 1.179716, 0.4184502, 0, 0, 0, 1, 1,
0.4061512, 0.7094968, 0.2433831, 0, 0, 0, 1, 1,
0.4121309, 0.05915108, -0.4354693, 0, 0, 0, 1, 1,
0.4219208, 0.24682, 0.5292704, 0, 0, 0, 1, 1,
0.4245022, -0.8722984, 3.186932, 0, 0, 0, 1, 1,
0.4245226, 0.2569983, 0.8230832, 0, 0, 0, 1, 1,
0.4273877, 0.7325232, -0.4329488, 0, 0, 0, 1, 1,
0.4299675, -0.1420189, 0.2573012, 1, 1, 1, 1, 1,
0.4329022, -1.886439, 2.254284, 1, 1, 1, 1, 1,
0.4347552, 0.4559365, 1.50801, 1, 1, 1, 1, 1,
0.4387307, 1.132099, 1.110604, 1, 1, 1, 1, 1,
0.4397951, -1.454142, 2.155827, 1, 1, 1, 1, 1,
0.4412537, -0.06354924, 1.163273, 1, 1, 1, 1, 1,
0.4427334, -1.44328, 2.905796, 1, 1, 1, 1, 1,
0.445142, 0.5987561, -1.510832, 1, 1, 1, 1, 1,
0.4483681, 0.392769, 0.02990547, 1, 1, 1, 1, 1,
0.4495928, -1.199271, 2.425403, 1, 1, 1, 1, 1,
0.4555981, -0.3713858, 3.601857, 1, 1, 1, 1, 1,
0.459478, -0.721562, 4.886132, 1, 1, 1, 1, 1,
0.4601526, -0.2265581, 2.138616, 1, 1, 1, 1, 1,
0.4626547, 1.226022, 0.4972767, 1, 1, 1, 1, 1,
0.4642482, 0.3694783, 2.654544, 1, 1, 1, 1, 1,
0.4659521, 0.5738752, 1.515827, 0, 0, 1, 1, 1,
0.4678536, 0.5334157, 1.594523, 1, 0, 0, 1, 1,
0.470317, -0.2989677, 1.719074, 1, 0, 0, 1, 1,
0.4735627, 1.268072, 0.1686688, 1, 0, 0, 1, 1,
0.4770615, -2.112087, 3.311825, 1, 0, 0, 1, 1,
0.4771735, 0.04658617, 1.528723, 1, 0, 0, 1, 1,
0.4797679, 0.9897823, 1.674113, 0, 0, 0, 1, 1,
0.4815104, -1.075626, 3.04503, 0, 0, 0, 1, 1,
0.4849096, 0.3307798, 0.7456506, 0, 0, 0, 1, 1,
0.4947537, -0.3177208, 3.425102, 0, 0, 0, 1, 1,
0.4955125, -0.09597234, 1.863465, 0, 0, 0, 1, 1,
0.497848, 0.34414, 2.128854, 0, 0, 0, 1, 1,
0.4990703, -0.4700689, 2.885461, 0, 0, 0, 1, 1,
0.4993079, 0.1051612, 2.003182, 1, 1, 1, 1, 1,
0.5026375, 0.6401151, 0.08091555, 1, 1, 1, 1, 1,
0.503134, -0.1834681, 1.851011, 1, 1, 1, 1, 1,
0.5103314, -0.7928101, 2.68445, 1, 1, 1, 1, 1,
0.5105786, 1.149425, 2.387759, 1, 1, 1, 1, 1,
0.5149888, 1.95908, -0.8999967, 1, 1, 1, 1, 1,
0.5162002, -0.6332807, 2.030665, 1, 1, 1, 1, 1,
0.5177943, 0.1863243, 0.1626661, 1, 1, 1, 1, 1,
0.5210907, -1.044153, 1.159372, 1, 1, 1, 1, 1,
0.5226797, 1.694642, -1.485824, 1, 1, 1, 1, 1,
0.525234, -1.17796, 1.722595, 1, 1, 1, 1, 1,
0.5414841, 0.1147478, 1.855015, 1, 1, 1, 1, 1,
0.5420448, -0.2562074, 0.6911369, 1, 1, 1, 1, 1,
0.5424173, 0.2473029, 1.366918, 1, 1, 1, 1, 1,
0.544062, -0.4361328, 3.189231, 1, 1, 1, 1, 1,
0.5505592, -0.1982311, 2.265105, 0, 0, 1, 1, 1,
0.5528023, 0.8352733, 0.5052978, 1, 0, 0, 1, 1,
0.5548089, -1.059059, 2.273592, 1, 0, 0, 1, 1,
0.5584077, 0.4233522, 0.7073275, 1, 0, 0, 1, 1,
0.5603212, -0.04977234, 0.8707333, 1, 0, 0, 1, 1,
0.5621125, 1.123513, 0.7551261, 1, 0, 0, 1, 1,
0.5630241, -1.661139, 1.852927, 0, 0, 0, 1, 1,
0.5735838, -0.008891858, 1.921931, 0, 0, 0, 1, 1,
0.574195, 0.5630547, -0.02407105, 0, 0, 0, 1, 1,
0.5745147, 0.0433861, 2.889639, 0, 0, 0, 1, 1,
0.5745828, 0.8675352, -0.3430583, 0, 0, 0, 1, 1,
0.5762821, -0.480904, 3.254766, 0, 0, 0, 1, 1,
0.5766126, -0.3205282, 4.029531, 0, 0, 0, 1, 1,
0.5842936, -0.2603991, 3.230868, 1, 1, 1, 1, 1,
0.5896509, 0.2563418, 2.230437, 1, 1, 1, 1, 1,
0.5917912, 0.4665875, 1.540144, 1, 1, 1, 1, 1,
0.5919051, 1.138565, 1.117655, 1, 1, 1, 1, 1,
0.5927122, 0.8692769, 0.517364, 1, 1, 1, 1, 1,
0.5956003, 0.367706, -1.341096, 1, 1, 1, 1, 1,
0.6016657, -0.439856, 2.638698, 1, 1, 1, 1, 1,
0.6084166, 1.645308, -0.25703, 1, 1, 1, 1, 1,
0.6136279, -0.3880593, 1.185568, 1, 1, 1, 1, 1,
0.616468, 0.9144499, 1.419342, 1, 1, 1, 1, 1,
0.6184307, 0.02280729, 0.8200759, 1, 1, 1, 1, 1,
0.6241945, -0.3708776, 2.779212, 1, 1, 1, 1, 1,
0.6254518, 0.1370725, 1.835055, 1, 1, 1, 1, 1,
0.6276295, 0.3293452, 1.199807, 1, 1, 1, 1, 1,
0.6354001, -2.060986, 2.982425, 1, 1, 1, 1, 1,
0.6390754, 0.162817, 1.420601, 0, 0, 1, 1, 1,
0.6392491, -1.388698, 1.761556, 1, 0, 0, 1, 1,
0.6414779, 0.7303384, 0.1235771, 1, 0, 0, 1, 1,
0.6429508, -0.7745161, 1.972942, 1, 0, 0, 1, 1,
0.6448723, -0.7508214, -0.5317828, 1, 0, 0, 1, 1,
0.6470692, 0.03940411, 1.369179, 1, 0, 0, 1, 1,
0.6523291, 0.0509023, 2.25967, 0, 0, 0, 1, 1,
0.6534593, 0.7535177, 1.362839, 0, 0, 0, 1, 1,
0.6536986, -1.094363, 1.775854, 0, 0, 0, 1, 1,
0.6561006, 0.4350834, 0.6229736, 0, 0, 0, 1, 1,
0.6595702, 1.24114, -0.8488231, 0, 0, 0, 1, 1,
0.6597158, -0.90591, 2.163072, 0, 0, 0, 1, 1,
0.6678109, -0.5149271, 1.409608, 0, 0, 0, 1, 1,
0.66969, -0.06592565, 1.813913, 1, 1, 1, 1, 1,
0.6703485, 0.9908273, 0.2862521, 1, 1, 1, 1, 1,
0.6798993, -1.085489, 2.555581, 1, 1, 1, 1, 1,
0.6843154, -0.4641541, 3.39232, 1, 1, 1, 1, 1,
0.6868731, -0.5380034, 2.175753, 1, 1, 1, 1, 1,
0.6958788, -0.6792151, 4.355453, 1, 1, 1, 1, 1,
0.7008409, 0.6859817, 0.2519943, 1, 1, 1, 1, 1,
0.7034588, -1.585587, 3.283263, 1, 1, 1, 1, 1,
0.7038998, -0.4950996, 0.8250312, 1, 1, 1, 1, 1,
0.7042604, 0.1699138, 3.003638, 1, 1, 1, 1, 1,
0.7049879, 1.612536, 0.1997778, 1, 1, 1, 1, 1,
0.7103276, 2.404736, -1.326657, 1, 1, 1, 1, 1,
0.7120667, 0.7630243, 0.06090962, 1, 1, 1, 1, 1,
0.7122009, -0.5512616, 1.278675, 1, 1, 1, 1, 1,
0.7197017, 0.948339, 2.33449, 1, 1, 1, 1, 1,
0.7285827, -1.101764, 1.948765, 0, 0, 1, 1, 1,
0.7316239, -0.3846333, 1.880963, 1, 0, 0, 1, 1,
0.7355924, 0.5903687, 1.832812, 1, 0, 0, 1, 1,
0.7400219, -0.08679693, 0.610864, 1, 0, 0, 1, 1,
0.7452052, -0.6512247, 3.121478, 1, 0, 0, 1, 1,
0.7476602, 0.2936344, -1.324899, 1, 0, 0, 1, 1,
0.7552167, 0.3473589, 2.170597, 0, 0, 0, 1, 1,
0.755528, 0.7276153, -0.7543216, 0, 0, 0, 1, 1,
0.7556196, 1.016286, 0.3412721, 0, 0, 0, 1, 1,
0.7567725, 0.5355688, 1.030234, 0, 0, 0, 1, 1,
0.7587696, -0.1429937, -0.1800911, 0, 0, 0, 1, 1,
0.7626258, -1.696027, 1.663663, 0, 0, 0, 1, 1,
0.765658, -0.9591046, 1.412519, 0, 0, 0, 1, 1,
0.7675037, -0.9240193, 0.5186068, 1, 1, 1, 1, 1,
0.7677581, -1.245992, 2.383819, 1, 1, 1, 1, 1,
0.7693555, -1.057895, 0.9036416, 1, 1, 1, 1, 1,
0.7724237, 2.336967, -0.422592, 1, 1, 1, 1, 1,
0.7739855, -0.2162671, 2.423578, 1, 1, 1, 1, 1,
0.7790608, -0.3242992, 1.158811, 1, 1, 1, 1, 1,
0.7816743, 0.9159853, 0.9010219, 1, 1, 1, 1, 1,
0.7818412, -1.0322, 3.317581, 1, 1, 1, 1, 1,
0.790884, 0.2569187, -0.04246075, 1, 1, 1, 1, 1,
0.7923855, -1.163722, 2.119274, 1, 1, 1, 1, 1,
0.7943459, 0.3100471, 2.334889, 1, 1, 1, 1, 1,
0.7963631, -0.3113368, 3.229222, 1, 1, 1, 1, 1,
0.7980254, -1.016929, 4.076858, 1, 1, 1, 1, 1,
0.7986246, -0.08243848, 1.064998, 1, 1, 1, 1, 1,
0.8004175, 0.2791491, 2.960925, 1, 1, 1, 1, 1,
0.8090039, -0.2641869, 2.939932, 0, 0, 1, 1, 1,
0.8167838, 0.3762383, 0.4055507, 1, 0, 0, 1, 1,
0.8191662, -0.6557871, 1.956984, 1, 0, 0, 1, 1,
0.8202198, -1.707086, 2.167914, 1, 0, 0, 1, 1,
0.8210898, 0.6806216, 0.6864524, 1, 0, 0, 1, 1,
0.8236073, 0.4980295, 0.5406878, 1, 0, 0, 1, 1,
0.8246115, -0.2087623, 1.206883, 0, 0, 0, 1, 1,
0.8256377, 0.09281395, 1.907597, 0, 0, 0, 1, 1,
0.8257645, -0.3855045, 2.489411, 0, 0, 0, 1, 1,
0.8265206, -0.5030712, 0.4511387, 0, 0, 0, 1, 1,
0.8298493, -0.7940305, 2.295531, 0, 0, 0, 1, 1,
0.8310322, 2.769988, -1.520762, 0, 0, 0, 1, 1,
0.8336799, -0.02011027, 1.613876, 0, 0, 0, 1, 1,
0.8378795, -1.740918, 3.937109, 1, 1, 1, 1, 1,
0.8398879, 1.000759, 0.5982264, 1, 1, 1, 1, 1,
0.8404262, 0.4475924, 1.871821, 1, 1, 1, 1, 1,
0.8412747, 0.2733583, 3.780782, 1, 1, 1, 1, 1,
0.8487238, 0.04802974, 2.328066, 1, 1, 1, 1, 1,
0.8531011, 0.730042, -0.3430656, 1, 1, 1, 1, 1,
0.8536287, -0.2417603, 1.655318, 1, 1, 1, 1, 1,
0.8536744, 0.1921028, 2.468249, 1, 1, 1, 1, 1,
0.8633816, 0.7011458, 1.54212, 1, 1, 1, 1, 1,
0.8656583, -0.985229, 3.631299, 1, 1, 1, 1, 1,
0.8795992, -0.7697839, 2.165778, 1, 1, 1, 1, 1,
0.8807378, 0.04931017, 1.418174, 1, 1, 1, 1, 1,
0.8808779, 1.122836, 0.08166905, 1, 1, 1, 1, 1,
0.8818622, -0.04163368, 1.364974, 1, 1, 1, 1, 1,
0.8854894, -0.1089544, 2.834308, 1, 1, 1, 1, 1,
0.8906982, 0.2679512, 1.102965, 0, 0, 1, 1, 1,
0.8951399, 0.851189, 0.7219853, 1, 0, 0, 1, 1,
0.8989626, -0.6911994, 0.7690906, 1, 0, 0, 1, 1,
0.9025635, 0.1333973, 2.064326, 1, 0, 0, 1, 1,
0.9027222, 1.248653, 0.9253432, 1, 0, 0, 1, 1,
0.9085681, -0.1994728, -0.132963, 1, 0, 0, 1, 1,
0.9088158, 0.9972522, -1.096361, 0, 0, 0, 1, 1,
0.9097481, -0.7068753, 0.6120036, 0, 0, 0, 1, 1,
0.9120138, -0.5136991, 1.985893, 0, 0, 0, 1, 1,
0.9185351, 0.3668604, 0.9303314, 0, 0, 0, 1, 1,
0.9226008, -0.01924105, 0.9111912, 0, 0, 0, 1, 1,
0.9297238, -0.8425307, 2.041595, 0, 0, 0, 1, 1,
0.931522, -0.254222, 2.214525, 0, 0, 0, 1, 1,
0.9362645, 1.451325, 0.6067261, 1, 1, 1, 1, 1,
0.9470257, -0.05355373, 1.267766, 1, 1, 1, 1, 1,
0.9474124, -1.246237, 1.947204, 1, 1, 1, 1, 1,
0.948569, -0.5961446, 3.043721, 1, 1, 1, 1, 1,
0.9567295, -1.502585, 1.939699, 1, 1, 1, 1, 1,
0.959637, 1.141696, -0.6856164, 1, 1, 1, 1, 1,
0.9718885, 1.903101, 0.6847546, 1, 1, 1, 1, 1,
0.9727654, -0.01192921, -0.3218524, 1, 1, 1, 1, 1,
0.9769545, -0.03403109, 3.117287, 1, 1, 1, 1, 1,
0.981185, 0.7096257, -0.5899394, 1, 1, 1, 1, 1,
0.9814962, -0.5164488, 2.620773, 1, 1, 1, 1, 1,
0.9820043, 0.03141199, 0.3462265, 1, 1, 1, 1, 1,
0.9847025, 0.3561407, 0.9509101, 1, 1, 1, 1, 1,
0.9871954, 1.486111, -0.1736215, 1, 1, 1, 1, 1,
1.001302, 0.8469828, 1.918395, 1, 1, 1, 1, 1,
1.00228, -1.926203, 3.372101, 0, 0, 1, 1, 1,
1.004275, 0.3307855, 1.479901, 1, 0, 0, 1, 1,
1.005322, 0.1672806, 1.479838, 1, 0, 0, 1, 1,
1.008113, 0.9102251, 0.655718, 1, 0, 0, 1, 1,
1.026199, -0.04659478, 1.654659, 1, 0, 0, 1, 1,
1.031109, 0.8310259, 0.6584218, 1, 0, 0, 1, 1,
1.033168, -0.5367232, 1.492614, 0, 0, 0, 1, 1,
1.038848, -1.292513, 2.230111, 0, 0, 0, 1, 1,
1.043167, -0.2969549, 2.597855, 0, 0, 0, 1, 1,
1.047533, 1.530797, 0.1536578, 0, 0, 0, 1, 1,
1.051122, 0.4159031, 2.122431, 0, 0, 0, 1, 1,
1.063821, -1.476478, 0.474818, 0, 0, 0, 1, 1,
1.067584, -0.877365, 2.829026, 0, 0, 0, 1, 1,
1.073012, -0.8679709, 0.7864131, 1, 1, 1, 1, 1,
1.073174, 1.328035, 1.36109, 1, 1, 1, 1, 1,
1.076119, 1.244178, -0.5549083, 1, 1, 1, 1, 1,
1.076687, -1.592741, 2.989957, 1, 1, 1, 1, 1,
1.078948, -0.5223116, 0.1837492, 1, 1, 1, 1, 1,
1.079253, -0.4399135, 3.020092, 1, 1, 1, 1, 1,
1.085148, -0.9113859, 2.605083, 1, 1, 1, 1, 1,
1.086154, 0.1088016, 0.8965571, 1, 1, 1, 1, 1,
1.09579, -1.054623, 0.8895554, 1, 1, 1, 1, 1,
1.098098, -2.357115, 2.850878, 1, 1, 1, 1, 1,
1.108153, 0.05508365, 1.862528, 1, 1, 1, 1, 1,
1.116301, 0.6636313, 1.072639, 1, 1, 1, 1, 1,
1.11804, 1.701719, 1.557747, 1, 1, 1, 1, 1,
1.122873, -0.5080702, 1.547351, 1, 1, 1, 1, 1,
1.129172, 0.0344544, -0.1539236, 1, 1, 1, 1, 1,
1.129932, -0.1158872, 0.6260265, 0, 0, 1, 1, 1,
1.134539, -0.2761331, 0.7116346, 1, 0, 0, 1, 1,
1.141447, -1.469585, 3.87854, 1, 0, 0, 1, 1,
1.144626, 0.963565, 0.8345704, 1, 0, 0, 1, 1,
1.145841, 0.38311, 0.7106277, 1, 0, 0, 1, 1,
1.147102, -0.2486797, 1.639021, 1, 0, 0, 1, 1,
1.151287, 1.351737, 0.7054008, 0, 0, 0, 1, 1,
1.151751, -1.032918, 4.02014, 0, 0, 0, 1, 1,
1.152391, 0.3596655, 0.1213101, 0, 0, 0, 1, 1,
1.155305, 2.280126, 0.6621366, 0, 0, 0, 1, 1,
1.158867, -0.9404504, 2.157304, 0, 0, 0, 1, 1,
1.160901, -0.9612786, 2.719174, 0, 0, 0, 1, 1,
1.162937, -1.477546, 4.530505, 0, 0, 0, 1, 1,
1.164635, 0.06572646, 0.143909, 1, 1, 1, 1, 1,
1.169653, 0.5381292, 0.6191435, 1, 1, 1, 1, 1,
1.17237, -1.454812, 1.237576, 1, 1, 1, 1, 1,
1.189488, -0.6288435, 2.352222, 1, 1, 1, 1, 1,
1.192324, -0.2989744, 1.956323, 1, 1, 1, 1, 1,
1.198689, 1.635642, 2.172385, 1, 1, 1, 1, 1,
1.19969, -1.13599, 1.682585, 1, 1, 1, 1, 1,
1.206185, -1.321411, 1.894978, 1, 1, 1, 1, 1,
1.208117, -0.864919, 3.688703, 1, 1, 1, 1, 1,
1.21174, -0.5058514, 0.5828937, 1, 1, 1, 1, 1,
1.224688, 1.656891, 1.480677, 1, 1, 1, 1, 1,
1.22725, 0.6112064, 0.3553136, 1, 1, 1, 1, 1,
1.230568, 0.6563234, 1.688595, 1, 1, 1, 1, 1,
1.238133, -1.135749, 1.936908, 1, 1, 1, 1, 1,
1.240282, -1.321669, 1.780805, 1, 1, 1, 1, 1,
1.24554, 0.7309882, 1.105652, 0, 0, 1, 1, 1,
1.269933, -0.1656686, 2.43502, 1, 0, 0, 1, 1,
1.273203, 0.9618055, 2.346403, 1, 0, 0, 1, 1,
1.285602, 0.7116626, 0.03232808, 1, 0, 0, 1, 1,
1.289053, -0.6979612, 3.299338, 1, 0, 0, 1, 1,
1.289979, -0.182072, 3.288861, 1, 0, 0, 1, 1,
1.290524, 2.049878, 1.278619, 0, 0, 0, 1, 1,
1.291147, -0.152138, 1.888541, 0, 0, 0, 1, 1,
1.292874, -0.5045092, 2.314309, 0, 0, 0, 1, 1,
1.295747, -1.312679, 1.55223, 0, 0, 0, 1, 1,
1.301129, -2.182865, 3.04492, 0, 0, 0, 1, 1,
1.304949, 0.3907343, 0.6922049, 0, 0, 0, 1, 1,
1.305696, 1.177381, 2.695936, 0, 0, 0, 1, 1,
1.314154, 0.580874, -1.426338, 1, 1, 1, 1, 1,
1.331651, -0.8730106, 1.842832, 1, 1, 1, 1, 1,
1.332638, -0.6970625, 3.28888, 1, 1, 1, 1, 1,
1.345113, -0.6815168, 1.129169, 1, 1, 1, 1, 1,
1.361256, -1.050188, 1.813637, 1, 1, 1, 1, 1,
1.383683, 0.338702, -0.4865543, 1, 1, 1, 1, 1,
1.391102, -1.262249, 3.180478, 1, 1, 1, 1, 1,
1.403805, 1.008756, 1.383943, 1, 1, 1, 1, 1,
1.414903, 1.194914, 0.2503679, 1, 1, 1, 1, 1,
1.41779, 0.674366, 2.828384, 1, 1, 1, 1, 1,
1.420369, 0.1548908, 1.135612, 1, 1, 1, 1, 1,
1.425594, 0.9656747, 1.212726, 1, 1, 1, 1, 1,
1.425895, -0.143982, 2.70565, 1, 1, 1, 1, 1,
1.434477, -0.6606712, 2.131036, 1, 1, 1, 1, 1,
1.434627, -1.584373, 2.604568, 1, 1, 1, 1, 1,
1.438667, 1.106527, 0.3809261, 0, 0, 1, 1, 1,
1.442694, 0.891317, 2.129826, 1, 0, 0, 1, 1,
1.445342, 0.04609854, 1.08967, 1, 0, 0, 1, 1,
1.452658, -0.5551258, 0.6494957, 1, 0, 0, 1, 1,
1.453724, -0.1112712, 0.9627505, 1, 0, 0, 1, 1,
1.469225, 0.3813813, 1.4117, 1, 0, 0, 1, 1,
1.479459, 0.4093485, 1.459237, 0, 0, 0, 1, 1,
1.482203, -0.9215257, 2.278613, 0, 0, 0, 1, 1,
1.499849, -0.8771181, 1.119695, 0, 0, 0, 1, 1,
1.500195, 1.396317, 1.108637, 0, 0, 0, 1, 1,
1.500861, 0.3695579, 1.554782, 0, 0, 0, 1, 1,
1.518188, 1.21629, 0.853938, 0, 0, 0, 1, 1,
1.525278, 2.047605, 1.449909, 0, 0, 0, 1, 1,
1.525936, -0.1157054, 1.342878, 1, 1, 1, 1, 1,
1.534461, 0.1146761, 1.041813, 1, 1, 1, 1, 1,
1.537958, 0.7732564, 0.5861766, 1, 1, 1, 1, 1,
1.538669, -0.9444089, 0.7875773, 1, 1, 1, 1, 1,
1.544247, 1.467852, 1.261085, 1, 1, 1, 1, 1,
1.544299, -0.6603464, 2.139576, 1, 1, 1, 1, 1,
1.577936, -0.4247193, 1.949639, 1, 1, 1, 1, 1,
1.579041, 0.4465667, 1.103917, 1, 1, 1, 1, 1,
1.590747, -1.007013, 1.43007, 1, 1, 1, 1, 1,
1.593134, -0.02571111, 0.197247, 1, 1, 1, 1, 1,
1.600664, 0.01980226, 0.6671651, 1, 1, 1, 1, 1,
1.601578, -1.128425, 0.2559506, 1, 1, 1, 1, 1,
1.601936, -0.06577164, 2.442908, 1, 1, 1, 1, 1,
1.608021, 0.466266, 0.08001719, 1, 1, 1, 1, 1,
1.634944, 0.2605965, 0.9404123, 1, 1, 1, 1, 1,
1.636649, -1.315298, 1.813277, 0, 0, 1, 1, 1,
1.641533, 0.011195, 2.572279, 1, 0, 0, 1, 1,
1.642303, -0.03052024, 3.392749, 1, 0, 0, 1, 1,
1.645356, 0.4375128, -0.2319682, 1, 0, 0, 1, 1,
1.683599, 1.26994, 2.789956, 1, 0, 0, 1, 1,
1.683647, -0.05753458, 0.6786225, 1, 0, 0, 1, 1,
1.691276, -0.143389, 2.171535, 0, 0, 0, 1, 1,
1.716497, -0.4685871, 3.124715, 0, 0, 0, 1, 1,
1.762383, 0.06972509, 0.4131558, 0, 0, 0, 1, 1,
1.765595, -0.2855282, -0.0436862, 0, 0, 0, 1, 1,
1.767194, 0.1094615, 2.326622, 0, 0, 0, 1, 1,
1.774304, 1.475153, 2.444327, 0, 0, 0, 1, 1,
1.791875, -0.812249, 1.594927, 0, 0, 0, 1, 1,
1.808525, -0.5115527, 2.652222, 1, 1, 1, 1, 1,
1.824322, 0.8411993, 1.252755, 1, 1, 1, 1, 1,
1.833966, -0.02415203, 0.8261654, 1, 1, 1, 1, 1,
1.852651, -0.9308249, 1.828866, 1, 1, 1, 1, 1,
1.858283, 1.301591, 2.217555, 1, 1, 1, 1, 1,
1.879131, -1.406778, 1.073413, 1, 1, 1, 1, 1,
1.881179, -0.909085, 3.634765, 1, 1, 1, 1, 1,
1.886802, 0.2826028, 1.566087, 1, 1, 1, 1, 1,
1.899725, 0.3437862, 0.7866494, 1, 1, 1, 1, 1,
1.916881, 0.4230988, 0.4068809, 1, 1, 1, 1, 1,
1.926504, -0.07858925, 2.46137, 1, 1, 1, 1, 1,
1.92955, 0.924218, 0.966722, 1, 1, 1, 1, 1,
1.930961, -1.32452, 2.337509, 1, 1, 1, 1, 1,
1.944353, 0.5000714, 2.761864, 1, 1, 1, 1, 1,
1.96604, -0.3417251, 2.490552, 1, 1, 1, 1, 1,
1.989136, -1.082914, 1.744037, 0, 0, 1, 1, 1,
2.045887, 1.880518, 2.026552, 1, 0, 0, 1, 1,
2.063934, 0.2340611, 1.641269, 1, 0, 0, 1, 1,
2.087049, -0.899387, 2.376819, 1, 0, 0, 1, 1,
2.161624, 0.3484081, 2.208136, 1, 0, 0, 1, 1,
2.169907, 1.72718, 1.496147, 1, 0, 0, 1, 1,
2.186685, 0.5877613, 0.5755489, 0, 0, 0, 1, 1,
2.210762, -0.3757625, -0.1772102, 0, 0, 0, 1, 1,
2.230651, 2.356024, 0.721421, 0, 0, 0, 1, 1,
2.279646, -0.690122, 2.476909, 0, 0, 0, 1, 1,
2.29013, 0.3803072, 1.544701, 0, 0, 0, 1, 1,
2.293526, 1.803267, 2.419301, 0, 0, 0, 1, 1,
2.344215, -0.2879646, 1.513957, 0, 0, 0, 1, 1,
2.444356, 0.9955311, 2.326763, 1, 1, 1, 1, 1,
2.522199, -1.578721, 2.793616, 1, 1, 1, 1, 1,
2.556669, 1.026714, 1.651194, 1, 1, 1, 1, 1,
2.666228, -0.4628387, 1.42035, 1, 1, 1, 1, 1,
2.701334, 0.3708518, 1.065612, 1, 1, 1, 1, 1,
2.75282, 1.200391, 0.1122071, 1, 1, 1, 1, 1,
2.794171, -2.390749, 1.111013, 1, 1, 1, 1, 1
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
var radius = 9.364496;
var distance = 32.8924;
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
mvMatrix.translate( 0.5491986, 0.07075357, 0.06327486 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.8924);
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
