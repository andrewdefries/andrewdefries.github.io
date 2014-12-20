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
-3.580122, -0.3445283, 0.7899758, 1, 0, 0, 1,
-2.888971, 1.219417, -0.3571693, 1, 0.007843138, 0, 1,
-2.823908, -0.8927535, -2.957707, 1, 0.01176471, 0, 1,
-2.775756, -0.6795779, -1.280162, 1, 0.01960784, 0, 1,
-2.746717, -2.272377, -2.113534, 1, 0.02352941, 0, 1,
-2.690587, 0.5529065, -0.4966744, 1, 0.03137255, 0, 1,
-2.500463, 0.667348, -1.532922, 1, 0.03529412, 0, 1,
-2.470665, 0.5350713, -1.008203, 1, 0.04313726, 0, 1,
-2.44155, -0.06461867, -2.161454, 1, 0.04705882, 0, 1,
-2.424705, -0.3690394, -1.939328, 1, 0.05490196, 0, 1,
-2.389014, 0.1317094, -0.9302418, 1, 0.05882353, 0, 1,
-2.358139, 2.063329, -0.8627392, 1, 0.06666667, 0, 1,
-2.285665, 0.3875095, -1.276541, 1, 0.07058824, 0, 1,
-2.258125, -1.079093, -2.349011, 1, 0.07843138, 0, 1,
-2.172319, 1.194356, 0.209425, 1, 0.08235294, 0, 1,
-2.169921, -0.6660835, -2.225568, 1, 0.09019608, 0, 1,
-2.166678, 1.100387, -1.601772, 1, 0.09411765, 0, 1,
-2.118349, 0.2458296, -2.312126, 1, 0.1019608, 0, 1,
-2.116249, -0.2758103, -3.751329, 1, 0.1098039, 0, 1,
-2.09799, 1.100147, -0.7196509, 1, 0.1137255, 0, 1,
-2.063363, -1.352921, -3.676828, 1, 0.1215686, 0, 1,
-2.035683, -1.64219, -2.243256, 1, 0.1254902, 0, 1,
-2.033891, -0.04666591, -1.973662, 1, 0.1333333, 0, 1,
-1.989719, 0.1429114, -2.356347, 1, 0.1372549, 0, 1,
-1.971613, 0.7618513, -2.111949, 1, 0.145098, 0, 1,
-1.970326, 1.317132, -0.3895327, 1, 0.1490196, 0, 1,
-1.968818, -0.1860003, -1.511373, 1, 0.1568628, 0, 1,
-1.941808, 0.5791579, -1.892922, 1, 0.1607843, 0, 1,
-1.922193, -1.543734, -2.046804, 1, 0.1686275, 0, 1,
-1.899448, -0.5582971, -1.796582, 1, 0.172549, 0, 1,
-1.896365, -0.05774352, -1.434821, 1, 0.1803922, 0, 1,
-1.892483, 1.300603, -1.209523, 1, 0.1843137, 0, 1,
-1.891929, -0.7659832, -1.796881, 1, 0.1921569, 0, 1,
-1.873599, 1.570072, -1.009343, 1, 0.1960784, 0, 1,
-1.869225, 1.057432, -0.8102416, 1, 0.2039216, 0, 1,
-1.868644, 1.210297, -0.9187065, 1, 0.2117647, 0, 1,
-1.858636, -0.52368, -4.479348, 1, 0.2156863, 0, 1,
-1.857237, 0.2401387, -0.8431743, 1, 0.2235294, 0, 1,
-1.851693, -0.03078849, -2.052514, 1, 0.227451, 0, 1,
-1.849757, 0.3757619, -1.103498, 1, 0.2352941, 0, 1,
-1.836074, -0.4892145, -2.543267, 1, 0.2392157, 0, 1,
-1.793605, -1.495123, -1.393509, 1, 0.2470588, 0, 1,
-1.791303, 0.533264, -0.8077091, 1, 0.2509804, 0, 1,
-1.786253, -0.3818751, -1.405135, 1, 0.2588235, 0, 1,
-1.7849, 1.267212, -0.8550119, 1, 0.2627451, 0, 1,
-1.779855, -0.01024555, -0.8423455, 1, 0.2705882, 0, 1,
-1.778306, -0.1434023, -3.804811, 1, 0.2745098, 0, 1,
-1.776893, -1.635703, -1.276373, 1, 0.282353, 0, 1,
-1.759588, -1.851726, -2.393701, 1, 0.2862745, 0, 1,
-1.758346, 1.160199, -0.1376157, 1, 0.2941177, 0, 1,
-1.746179, 0.1255756, -0.8541418, 1, 0.3019608, 0, 1,
-1.728426, 0.07540091, -2.368153, 1, 0.3058824, 0, 1,
-1.717813, -0.6293377, -0.4653153, 1, 0.3137255, 0, 1,
-1.703331, -0.9720692, -2.329033, 1, 0.3176471, 0, 1,
-1.702606, -0.1735952, -1.546762, 1, 0.3254902, 0, 1,
-1.695989, -0.03417866, -3.145275, 1, 0.3294118, 0, 1,
-1.677117, 0.5456907, -0.8873778, 1, 0.3372549, 0, 1,
-1.675392, -1.534767, -3.978601, 1, 0.3411765, 0, 1,
-1.675383, -1.591964, -2.433676, 1, 0.3490196, 0, 1,
-1.664842, -0.446099, -1.462941, 1, 0.3529412, 0, 1,
-1.645854, -0.4757839, -1.453657, 1, 0.3607843, 0, 1,
-1.6355, -0.2450874, -0.9655588, 1, 0.3647059, 0, 1,
-1.622953, 0.667865, -1.194818, 1, 0.372549, 0, 1,
-1.61911, 0.290042, -1.185803, 1, 0.3764706, 0, 1,
-1.609799, 0.02114451, -1.44903, 1, 0.3843137, 0, 1,
-1.605901, 1.240145, -2.594538, 1, 0.3882353, 0, 1,
-1.580983, 0.6264107, -2.258556, 1, 0.3960784, 0, 1,
-1.567249, 0.4395272, -2.783969, 1, 0.4039216, 0, 1,
-1.557889, -0.2958527, -2.565251, 1, 0.4078431, 0, 1,
-1.534525, 1.229632, 0.8207923, 1, 0.4156863, 0, 1,
-1.531937, 0.4163143, -1.773466, 1, 0.4196078, 0, 1,
-1.516126, -0.7645698, -2.977896, 1, 0.427451, 0, 1,
-1.494333, -0.5515586, -1.748571, 1, 0.4313726, 0, 1,
-1.493281, -0.0630388, -2.769993, 1, 0.4392157, 0, 1,
-1.490744, 1.278298, -0.3402227, 1, 0.4431373, 0, 1,
-1.489418, 0.7401911, -1.584543, 1, 0.4509804, 0, 1,
-1.478504, 1.437703, -1.582724, 1, 0.454902, 0, 1,
-1.477659, 0.6158389, -2.929801, 1, 0.4627451, 0, 1,
-1.476302, 0.4724862, -1.389756, 1, 0.4666667, 0, 1,
-1.475438, -0.6999797, -2.440785, 1, 0.4745098, 0, 1,
-1.4638, -0.9246151, -1.873581, 1, 0.4784314, 0, 1,
-1.459253, -0.7390275, -0.5358621, 1, 0.4862745, 0, 1,
-1.441762, -0.5819744, -2.51157, 1, 0.4901961, 0, 1,
-1.436784, -0.7936769, -2.047838, 1, 0.4980392, 0, 1,
-1.431583, -0.367588, -0.3556921, 1, 0.5058824, 0, 1,
-1.423676, -0.332544, -0.934744, 1, 0.509804, 0, 1,
-1.413693, -0.7514912, -1.298656, 1, 0.5176471, 0, 1,
-1.413309, 1.233618, -1.225398, 1, 0.5215687, 0, 1,
-1.409256, 0.7246842, -1.066465, 1, 0.5294118, 0, 1,
-1.404091, -0.5061896, -2.253232, 1, 0.5333334, 0, 1,
-1.390668, 0.8781345, -0.08752023, 1, 0.5411765, 0, 1,
-1.371835, 1.735106, -0.143421, 1, 0.5450981, 0, 1,
-1.371744, 0.04212308, -0.3125885, 1, 0.5529412, 0, 1,
-1.368059, -1.230479, -3.26445, 1, 0.5568628, 0, 1,
-1.362789, 1.367045, -3.051802, 1, 0.5647059, 0, 1,
-1.354111, -0.521156, -0.5606359, 1, 0.5686275, 0, 1,
-1.341072, -0.2423411, -1.646678, 1, 0.5764706, 0, 1,
-1.338168, -0.2318172, -3.070494, 1, 0.5803922, 0, 1,
-1.329399, 0.9407955, -2.639749, 1, 0.5882353, 0, 1,
-1.327995, -0.4726138, -0.9822377, 1, 0.5921569, 0, 1,
-1.325952, 1.347116, 1.012413, 1, 0.6, 0, 1,
-1.325894, 0.6408738, 0.6131067, 1, 0.6078432, 0, 1,
-1.32554, -1.290083, -1.96657, 1, 0.6117647, 0, 1,
-1.307767, 0.6536368, 0.009626525, 1, 0.6196079, 0, 1,
-1.304078, -0.8380199, -2.396236, 1, 0.6235294, 0, 1,
-1.301601, 0.3593798, -1.77269, 1, 0.6313726, 0, 1,
-1.301197, -0.1783013, -1.670106, 1, 0.6352941, 0, 1,
-1.300419, -0.3098936, 0.5978923, 1, 0.6431373, 0, 1,
-1.287992, 0.7061704, -0.3998228, 1, 0.6470588, 0, 1,
-1.27704, 0.8735374, -1.776066, 1, 0.654902, 0, 1,
-1.273742, -1.232839, -0.7260351, 1, 0.6588235, 0, 1,
-1.265972, -0.5473431, -1.563179, 1, 0.6666667, 0, 1,
-1.263981, -1.017102, -2.979095, 1, 0.6705883, 0, 1,
-1.258824, 0.8303849, -1.993901, 1, 0.6784314, 0, 1,
-1.258547, -1.215393, -1.417459, 1, 0.682353, 0, 1,
-1.252326, -0.8702826, -2.200093, 1, 0.6901961, 0, 1,
-1.245771, -1.303584, -1.239798, 1, 0.6941177, 0, 1,
-1.243593, -1.285215, -1.724162, 1, 0.7019608, 0, 1,
-1.242951, 1.3453, -1.131425, 1, 0.7098039, 0, 1,
-1.242658, -0.3257509, -2.347938, 1, 0.7137255, 0, 1,
-1.237633, 0.8052169, -2.707738, 1, 0.7215686, 0, 1,
-1.232539, 0.3340677, -0.1316387, 1, 0.7254902, 0, 1,
-1.224472, 1.21994, -0.1921267, 1, 0.7333333, 0, 1,
-1.223617, 1.159991, 0.1662277, 1, 0.7372549, 0, 1,
-1.219148, 0.06164487, -3.287521, 1, 0.7450981, 0, 1,
-1.215736, 1.133804, -1.702108, 1, 0.7490196, 0, 1,
-1.213345, -0.9238247, -1.396728, 1, 0.7568628, 0, 1,
-1.198814, 0.6217347, -0.7356727, 1, 0.7607843, 0, 1,
-1.193815, 0.1046739, -2.182326, 1, 0.7686275, 0, 1,
-1.178823, -0.9032343, -1.82095, 1, 0.772549, 0, 1,
-1.171917, -1.417358, -3.714875, 1, 0.7803922, 0, 1,
-1.167749, -1.120834, -1.42988, 1, 0.7843137, 0, 1,
-1.167623, 0.4211833, -1.560469, 1, 0.7921569, 0, 1,
-1.154263, -0.3194906, -2.807801, 1, 0.7960784, 0, 1,
-1.149903, -0.3065614, -2.231422, 1, 0.8039216, 0, 1,
-1.149358, 0.4501057, -1.597381, 1, 0.8117647, 0, 1,
-1.149235, 1.672518, 0.07608753, 1, 0.8156863, 0, 1,
-1.147684, -0.3771296, -0.6953766, 1, 0.8235294, 0, 1,
-1.142159, -0.348712, -2.394749, 1, 0.827451, 0, 1,
-1.141184, 0.9184452, -2.382675, 1, 0.8352941, 0, 1,
-1.132431, 0.5699483, -0.5360966, 1, 0.8392157, 0, 1,
-1.12674, 0.1751629, -1.214612, 1, 0.8470588, 0, 1,
-1.108076, 0.3556927, -1.513367, 1, 0.8509804, 0, 1,
-1.106823, -0.4954769, -2.412937, 1, 0.8588235, 0, 1,
-1.101608, -0.5573111, -3.081355, 1, 0.8627451, 0, 1,
-1.094913, 2.526638, -0.4806354, 1, 0.8705882, 0, 1,
-1.094691, -1.845931, -3.545748, 1, 0.8745098, 0, 1,
-1.094608, 1.237117, -0.937023, 1, 0.8823529, 0, 1,
-1.092706, 1.02754, 0.4056941, 1, 0.8862745, 0, 1,
-1.090354, 2.646958, -0.6662059, 1, 0.8941177, 0, 1,
-1.083853, -0.5731353, -3.145665, 1, 0.8980392, 0, 1,
-1.078966, -2.091773, -2.24747, 1, 0.9058824, 0, 1,
-1.063642, -0.07375961, 0.02300817, 1, 0.9137255, 0, 1,
-1.058239, 1.705863, -1.315274, 1, 0.9176471, 0, 1,
-1.057114, -0.6361209, -1.218863, 1, 0.9254902, 0, 1,
-1.05574, 1.591068, 1.207832, 1, 0.9294118, 0, 1,
-1.053519, -0.6459397, -2.232445, 1, 0.9372549, 0, 1,
-1.045693, -0.7050901, -1.041564, 1, 0.9411765, 0, 1,
-1.036551, 0.3886497, -0.3819323, 1, 0.9490196, 0, 1,
-1.035947, 0.7605345, -1.540536, 1, 0.9529412, 0, 1,
-1.035481, -2.33506, -3.491099, 1, 0.9607843, 0, 1,
-1.034604, 1.011424, -1.288472, 1, 0.9647059, 0, 1,
-1.030736, 0.1111967, -1.386584, 1, 0.972549, 0, 1,
-1.027007, 1.05335, -3.57146, 1, 0.9764706, 0, 1,
-1.023543, 0.8754095, 1.136844, 1, 0.9843137, 0, 1,
-1.021538, -0.01546805, -2.160711, 1, 0.9882353, 0, 1,
-1.017807, -0.8128357, -1.652436, 1, 0.9960784, 0, 1,
-1.013308, -1.669702, -2.546862, 0.9960784, 1, 0, 1,
-1.013187, -0.2664649, -2.172212, 0.9921569, 1, 0, 1,
-0.999193, 1.080492, 1.57062, 0.9843137, 1, 0, 1,
-0.9977487, 1.379802, 0.8313505, 0.9803922, 1, 0, 1,
-0.9961694, 0.4441581, -1.528353, 0.972549, 1, 0, 1,
-0.9942873, 0.01496599, -0.8942767, 0.9686275, 1, 0, 1,
-0.9922069, 0.1009543, -1.923495, 0.9607843, 1, 0, 1,
-0.9884461, 0.2708877, -2.677819, 0.9568627, 1, 0, 1,
-0.9843674, 0.3827994, -1.707421, 0.9490196, 1, 0, 1,
-0.9835849, -1.973842, -4.300534, 0.945098, 1, 0, 1,
-0.978443, -0.001634199, 0.04259276, 0.9372549, 1, 0, 1,
-0.9767761, 0.1898828, -0.8531933, 0.9333333, 1, 0, 1,
-0.9762189, 1.264865, -0.1291536, 0.9254902, 1, 0, 1,
-0.9735754, 1.237228, -0.3875009, 0.9215686, 1, 0, 1,
-0.9732144, -0.436411, -0.8067791, 0.9137255, 1, 0, 1,
-0.9705901, 1.378373, -1.295768, 0.9098039, 1, 0, 1,
-0.9644426, -1.143274, -3.440581, 0.9019608, 1, 0, 1,
-0.9632568, -0.8113414, -2.561765, 0.8941177, 1, 0, 1,
-0.9630038, -0.8586333, -3.227464, 0.8901961, 1, 0, 1,
-0.9617027, 1.400799, -0.1276275, 0.8823529, 1, 0, 1,
-0.9589821, -0.1151788, -0.9608706, 0.8784314, 1, 0, 1,
-0.9543802, -1.648433, -2.59886, 0.8705882, 1, 0, 1,
-0.9491, 0.01401704, -2.559484, 0.8666667, 1, 0, 1,
-0.9353904, -0.2353382, -2.903955, 0.8588235, 1, 0, 1,
-0.9337186, 1.452992, 0.0124378, 0.854902, 1, 0, 1,
-0.9287964, -0.07364439, -1.856715, 0.8470588, 1, 0, 1,
-0.928785, 1.85711, -1.802704, 0.8431373, 1, 0, 1,
-0.9227398, -1.815792, -0.8213668, 0.8352941, 1, 0, 1,
-0.9156418, 0.5657149, -1.167183, 0.8313726, 1, 0, 1,
-0.9078813, 0.5953653, -2.139684, 0.8235294, 1, 0, 1,
-0.905174, 1.733917, 0.4481653, 0.8196079, 1, 0, 1,
-0.9034517, -0.6661641, -4.183675, 0.8117647, 1, 0, 1,
-0.9001863, 2.028569, 0.434158, 0.8078431, 1, 0, 1,
-0.8928734, -0.2180035, -2.988273, 0.8, 1, 0, 1,
-0.8920135, -0.5954097, -1.432176, 0.7921569, 1, 0, 1,
-0.8889775, 1.25236, -1.831156, 0.7882353, 1, 0, 1,
-0.888721, 1.684458, -1.591334, 0.7803922, 1, 0, 1,
-0.8879703, 0.1278145, -1.29086, 0.7764706, 1, 0, 1,
-0.8879071, -1.531648, -2.126304, 0.7686275, 1, 0, 1,
-0.8865386, 0.2421914, -1.647367, 0.7647059, 1, 0, 1,
-0.8862731, -0.3104355, -2.850976, 0.7568628, 1, 0, 1,
-0.8834894, -0.4503086, -2.445561, 0.7529412, 1, 0, 1,
-0.8831297, -0.5251232, -3.502426, 0.7450981, 1, 0, 1,
-0.877575, 1.205114, -1.71023, 0.7411765, 1, 0, 1,
-0.8714442, -1.205204, -2.379295, 0.7333333, 1, 0, 1,
-0.8682093, 1.194516, -1.460256, 0.7294118, 1, 0, 1,
-0.8551102, -1.967351, -2.482789, 0.7215686, 1, 0, 1,
-0.8543054, 0.9691178, 0.8132166, 0.7176471, 1, 0, 1,
-0.8516055, -0.4601711, -3.104363, 0.7098039, 1, 0, 1,
-0.8385689, -0.09917822, -1.461628, 0.7058824, 1, 0, 1,
-0.8345969, -0.2690694, -2.922945, 0.6980392, 1, 0, 1,
-0.8340645, 0.7617232, -1.974486, 0.6901961, 1, 0, 1,
-0.8336951, 1.994063, -0.03501942, 0.6862745, 1, 0, 1,
-0.831314, -0.04864094, -1.402782, 0.6784314, 1, 0, 1,
-0.8264829, 0.2704735, -0.7835776, 0.6745098, 1, 0, 1,
-0.8217455, 1.38341, 0.01861563, 0.6666667, 1, 0, 1,
-0.8210545, 1.369811, -2.411843, 0.6627451, 1, 0, 1,
-0.8167209, -0.522739, -1.962247, 0.654902, 1, 0, 1,
-0.8125091, -0.2023269, -2.153919, 0.6509804, 1, 0, 1,
-0.807745, 0.09172041, -1.675033, 0.6431373, 1, 0, 1,
-0.8064058, -1.474012, -3.987429, 0.6392157, 1, 0, 1,
-0.798913, -0.7350798, -2.863024, 0.6313726, 1, 0, 1,
-0.7965734, 0.8465852, -0.6469429, 0.627451, 1, 0, 1,
-0.7964497, 0.5789381, -0.8950505, 0.6196079, 1, 0, 1,
-0.7908136, 0.6621178, -1.940542, 0.6156863, 1, 0, 1,
-0.7843615, 0.2095136, -1.562566, 0.6078432, 1, 0, 1,
-0.7832543, 1.222994, -1.162682, 0.6039216, 1, 0, 1,
-0.7809275, 0.7825673, -0.2747249, 0.5960785, 1, 0, 1,
-0.7794308, 0.1994895, -0.4719362, 0.5882353, 1, 0, 1,
-0.7744856, 0.2322418, -0.8836456, 0.5843138, 1, 0, 1,
-0.7737806, 0.6006445, 0.6493306, 0.5764706, 1, 0, 1,
-0.7670258, -1.238645, -1.281804, 0.572549, 1, 0, 1,
-0.7593714, -1.363025, -2.805483, 0.5647059, 1, 0, 1,
-0.7588102, -0.2154498, -1.201578, 0.5607843, 1, 0, 1,
-0.7575814, -0.9346915, -3.098584, 0.5529412, 1, 0, 1,
-0.7568774, 1.309509, -0.75621, 0.5490196, 1, 0, 1,
-0.7561347, -0.08123104, -2.664884, 0.5411765, 1, 0, 1,
-0.7548247, -0.3672085, -3.969988, 0.5372549, 1, 0, 1,
-0.75432, 0.5230214, -0.3470083, 0.5294118, 1, 0, 1,
-0.7541088, -1.718094, -4.854528, 0.5254902, 1, 0, 1,
-0.7533311, 1.514358, -2.013987, 0.5176471, 1, 0, 1,
-0.7525996, 0.9017076, -0.6224077, 0.5137255, 1, 0, 1,
-0.7520322, 0.061611, -1.380876, 0.5058824, 1, 0, 1,
-0.7515092, 0.5036017, -1.593699, 0.5019608, 1, 0, 1,
-0.7502124, 0.8647857, -1.240679, 0.4941176, 1, 0, 1,
-0.7487962, 0.1304964, -0.9997267, 0.4862745, 1, 0, 1,
-0.7480572, 1.335535, -1.216433, 0.4823529, 1, 0, 1,
-0.7479313, 0.7688916, 0.7312232, 0.4745098, 1, 0, 1,
-0.7431267, 1.194088, -1.119148, 0.4705882, 1, 0, 1,
-0.7298468, 0.158631, -0.356032, 0.4627451, 1, 0, 1,
-0.7286971, 1.254619, 1.916511, 0.4588235, 1, 0, 1,
-0.7280285, -0.2172712, -1.947441, 0.4509804, 1, 0, 1,
-0.724114, 0.4636934, -0.436742, 0.4470588, 1, 0, 1,
-0.7164935, -0.658811, -3.222716, 0.4392157, 1, 0, 1,
-0.7142936, -1.442885, -2.670861, 0.4352941, 1, 0, 1,
-0.7115243, -0.1408848, -1.499198, 0.427451, 1, 0, 1,
-0.7001085, -1.524991, -2.182182, 0.4235294, 1, 0, 1,
-0.6961537, 0.8429995, -2.981891, 0.4156863, 1, 0, 1,
-0.693574, 0.1393562, -0.6512769, 0.4117647, 1, 0, 1,
-0.6935189, 1.133989, -0.906718, 0.4039216, 1, 0, 1,
-0.68487, 0.01264603, -2.384125, 0.3960784, 1, 0, 1,
-0.6815257, -1.653388, -2.713779, 0.3921569, 1, 0, 1,
-0.6753958, -1.012306, -1.900007, 0.3843137, 1, 0, 1,
-0.6750048, 1.637629, 1.654962, 0.3803922, 1, 0, 1,
-0.6742715, -0.1821199, -0.05401111, 0.372549, 1, 0, 1,
-0.6716554, 1.854372, 0.06897724, 0.3686275, 1, 0, 1,
-0.6710677, -0.3492922, -3.155288, 0.3607843, 1, 0, 1,
-0.6700028, -0.3315943, 0.4401995, 0.3568628, 1, 0, 1,
-0.6601927, -1.105921, -3.143886, 0.3490196, 1, 0, 1,
-0.6595876, 0.09844834, -1.023367, 0.345098, 1, 0, 1,
-0.6581694, -0.2693734, -1.443463, 0.3372549, 1, 0, 1,
-0.6548169, -0.2751709, -2.49356, 0.3333333, 1, 0, 1,
-0.6454065, 1.67686, -0.9939545, 0.3254902, 1, 0, 1,
-0.6346768, -0.2382959, -1.223246, 0.3215686, 1, 0, 1,
-0.6340488, -0.3986616, -3.775772, 0.3137255, 1, 0, 1,
-0.6340287, 0.0122427, -2.276847, 0.3098039, 1, 0, 1,
-0.627845, 0.8792247, -1.016526, 0.3019608, 1, 0, 1,
-0.6269841, -0.2283403, -1.590629, 0.2941177, 1, 0, 1,
-0.6255339, -0.1251759, -2.393096, 0.2901961, 1, 0, 1,
-0.6229207, -0.3131246, -2.186744, 0.282353, 1, 0, 1,
-0.6206053, 0.05706638, -3.231128, 0.2784314, 1, 0, 1,
-0.6205391, 1.949784, 0.4314481, 0.2705882, 1, 0, 1,
-0.6187144, -1.551886, -4.430655, 0.2666667, 1, 0, 1,
-0.6182288, -0.3961851, -1.532942, 0.2588235, 1, 0, 1,
-0.6177367, -0.4035071, -2.266793, 0.254902, 1, 0, 1,
-0.6153687, 0.006992009, -2.801583, 0.2470588, 1, 0, 1,
-0.6125075, 0.8006667, -1.652647, 0.2431373, 1, 0, 1,
-0.6109018, 1.836862, -1.782698, 0.2352941, 1, 0, 1,
-0.6097199, -0.6475407, -3.273503, 0.2313726, 1, 0, 1,
-0.6094158, 0.5191032, -1.155768, 0.2235294, 1, 0, 1,
-0.6069069, -0.7734495, -1.900039, 0.2196078, 1, 0, 1,
-0.6013339, 1.404541, -0.6431193, 0.2117647, 1, 0, 1,
-0.6002252, -0.7256893, -3.447858, 0.2078431, 1, 0, 1,
-0.60001, -1.627897, -1.37865, 0.2, 1, 0, 1,
-0.5983937, -0.006978118, -2.524833, 0.1921569, 1, 0, 1,
-0.5977922, -0.09430049, -1.174859, 0.1882353, 1, 0, 1,
-0.5967298, -0.002940586, -1.960503, 0.1803922, 1, 0, 1,
-0.5949617, -0.9402242, -1.933474, 0.1764706, 1, 0, 1,
-0.5885018, -0.9351447, -2.978531, 0.1686275, 1, 0, 1,
-0.5883215, -0.2445808, -2.005129, 0.1647059, 1, 0, 1,
-0.588213, -1.716312, -0.5864519, 0.1568628, 1, 0, 1,
-0.5803655, -0.3752357, -2.404161, 0.1529412, 1, 0, 1,
-0.580063, 2.34832, -0.5724242, 0.145098, 1, 0, 1,
-0.5786459, 0.09383115, -2.635836, 0.1411765, 1, 0, 1,
-0.5774949, 1.711434, -0.5695048, 0.1333333, 1, 0, 1,
-0.574396, 0.2647955, -0.556079, 0.1294118, 1, 0, 1,
-0.5712377, -0.9185262, -3.360964, 0.1215686, 1, 0, 1,
-0.5710083, 0.4042659, -0.3015788, 0.1176471, 1, 0, 1,
-0.5650095, -0.2000342, -3.778801, 0.1098039, 1, 0, 1,
-0.561569, -0.3511768, -3.137235, 0.1058824, 1, 0, 1,
-0.5558444, 0.2671127, -1.417606, 0.09803922, 1, 0, 1,
-0.550246, 1.71989, -1.696462, 0.09019608, 1, 0, 1,
-0.5432437, 0.4911914, -3.024997, 0.08627451, 1, 0, 1,
-0.5425529, 1.192713, -0.6849692, 0.07843138, 1, 0, 1,
-0.5420973, -0.187775, -1.089898, 0.07450981, 1, 0, 1,
-0.5392442, -1.244568, -3.83326, 0.06666667, 1, 0, 1,
-0.5328103, 0.7312205, -0.6705926, 0.0627451, 1, 0, 1,
-0.5292782, 1.201134, 0.5003068, 0.05490196, 1, 0, 1,
-0.5274827, -0.6179399, -3.059151, 0.05098039, 1, 0, 1,
-0.5226212, -0.347795, -2.487531, 0.04313726, 1, 0, 1,
-0.5201337, 0.3742521, -1.256022, 0.03921569, 1, 0, 1,
-0.5152007, 0.2899907, -1.756645, 0.03137255, 1, 0, 1,
-0.5113508, 0.1262817, -1.878429, 0.02745098, 1, 0, 1,
-0.5065677, 0.579453, -3.444389, 0.01960784, 1, 0, 1,
-0.500841, 0.2303334, -2.838869, 0.01568628, 1, 0, 1,
-0.4967964, -1.55792, -2.925449, 0.007843138, 1, 0, 1,
-0.4900708, -0.4861705, -0.9342465, 0.003921569, 1, 0, 1,
-0.490061, -2.291747, -4.365203, 0, 1, 0.003921569, 1,
-0.4895698, 0.3436328, -2.277375, 0, 1, 0.01176471, 1,
-0.4890931, -2.616626, -1.94989, 0, 1, 0.01568628, 1,
-0.4795183, 0.2777665, 0.1145874, 0, 1, 0.02352941, 1,
-0.478163, 1.795096, 1.891657, 0, 1, 0.02745098, 1,
-0.4766041, 0.5558957, -1.281196, 0, 1, 0.03529412, 1,
-0.4756377, -1.42002, -2.40971, 0, 1, 0.03921569, 1,
-0.4742422, 0.3589996, -1.69777, 0, 1, 0.04705882, 1,
-0.4730847, 2.502844, -0.1901321, 0, 1, 0.05098039, 1,
-0.4703848, -1.165683, -4.407699, 0, 1, 0.05882353, 1,
-0.4701854, 0.6398414, -0.3711368, 0, 1, 0.0627451, 1,
-0.4642826, 0.6794317, -0.7914198, 0, 1, 0.07058824, 1,
-0.4628474, -0.6662328, -2.284747, 0, 1, 0.07450981, 1,
-0.4622186, -1.15493, -2.27094, 0, 1, 0.08235294, 1,
-0.4612872, 0.5199766, 0.03333688, 0, 1, 0.08627451, 1,
-0.4600504, -0.1143452, -1.640757, 0, 1, 0.09411765, 1,
-0.4573801, -0.6048266, -2.734655, 0, 1, 0.1019608, 1,
-0.4569352, -0.8118852, -2.236342, 0, 1, 0.1058824, 1,
-0.4565133, -1.276403, -1.733906, 0, 1, 0.1137255, 1,
-0.4492907, -0.1717188, -1.494703, 0, 1, 0.1176471, 1,
-0.4430549, 1.617145, -0.4150051, 0, 1, 0.1254902, 1,
-0.4423626, -0.3923019, -2.802358, 0, 1, 0.1294118, 1,
-0.4410923, -0.7547759, -3.696585, 0, 1, 0.1372549, 1,
-0.434776, 1.186515, 0.0425851, 0, 1, 0.1411765, 1,
-0.433456, -1.394403, -3.814397, 0, 1, 0.1490196, 1,
-0.4331112, 0.04376514, -1.566363, 0, 1, 0.1529412, 1,
-0.4301552, 0.7438905, 0.6306449, 0, 1, 0.1607843, 1,
-0.4213209, 0.604999, -2.154403, 0, 1, 0.1647059, 1,
-0.4211135, -1.510638, -4.498693, 0, 1, 0.172549, 1,
-0.41927, -1.219132, -1.981358, 0, 1, 0.1764706, 1,
-0.4192149, -0.5732315, -2.409675, 0, 1, 0.1843137, 1,
-0.4187376, -0.1060537, -0.955223, 0, 1, 0.1882353, 1,
-0.4185165, 0.9605324, -1.351865, 0, 1, 0.1960784, 1,
-0.4168151, -0.4736018, -2.354132, 0, 1, 0.2039216, 1,
-0.4164728, 0.3485826, -0.1819261, 0, 1, 0.2078431, 1,
-0.4161672, 0.06353125, -1.950843, 0, 1, 0.2156863, 1,
-0.412328, -0.2634043, -1.784517, 0, 1, 0.2196078, 1,
-0.405373, 0.2096777, -0.3685035, 0, 1, 0.227451, 1,
-0.3993177, -0.6166491, -2.800933, 0, 1, 0.2313726, 1,
-0.3987789, -1.359636, -2.76311, 0, 1, 0.2392157, 1,
-0.3853433, 0.1990334, -0.7828103, 0, 1, 0.2431373, 1,
-0.3850242, -0.4939474, -1.142254, 0, 1, 0.2509804, 1,
-0.3847053, -1.04557, -2.624832, 0, 1, 0.254902, 1,
-0.3836914, -1.276502, -3.508512, 0, 1, 0.2627451, 1,
-0.3836527, 0.3568249, -0.4494274, 0, 1, 0.2666667, 1,
-0.3835811, -0.1751422, -1.736758, 0, 1, 0.2745098, 1,
-0.3827374, -0.02005027, -2.908686, 0, 1, 0.2784314, 1,
-0.3766764, -0.1948727, -3.045716, 0, 1, 0.2862745, 1,
-0.3723948, 0.3606083, 0.1484269, 0, 1, 0.2901961, 1,
-0.3704518, 0.5440202, -1.107666, 0, 1, 0.2980392, 1,
-0.3682655, 0.2915877, -0.381597, 0, 1, 0.3058824, 1,
-0.368, -0.6160147, -3.967839, 0, 1, 0.3098039, 1,
-0.3644387, -0.5140497, -0.3264322, 0, 1, 0.3176471, 1,
-0.3636425, -0.5990722, -3.247367, 0, 1, 0.3215686, 1,
-0.3617329, -1.097372, -2.953349, 0, 1, 0.3294118, 1,
-0.3593097, -1.155601, -2.313092, 0, 1, 0.3333333, 1,
-0.3591568, -0.5107986, -3.269732, 0, 1, 0.3411765, 1,
-0.3581133, -0.1014196, -1.946873, 0, 1, 0.345098, 1,
-0.3549767, -1.57716, -2.454201, 0, 1, 0.3529412, 1,
-0.3544412, 0.2905594, -0.4461724, 0, 1, 0.3568628, 1,
-0.3520721, -0.7580723, -0.9044932, 0, 1, 0.3647059, 1,
-0.3489573, -0.6410856, -1.451727, 0, 1, 0.3686275, 1,
-0.3486136, 0.9459772, -0.8548498, 0, 1, 0.3764706, 1,
-0.3415104, 0.2738089, -1.226766, 0, 1, 0.3803922, 1,
-0.3409444, -2.139023, -4.245611, 0, 1, 0.3882353, 1,
-0.3400989, -0.07153154, -3.192001, 0, 1, 0.3921569, 1,
-0.339846, -0.3183611, -1.553364, 0, 1, 0.4, 1,
-0.339592, 0.5134442, -0.5713453, 0, 1, 0.4078431, 1,
-0.338366, 0.7557376, -1.042715, 0, 1, 0.4117647, 1,
-0.3380115, 0.01009267, 0.4626838, 0, 1, 0.4196078, 1,
-0.3379354, 0.860037, 0.03021992, 0, 1, 0.4235294, 1,
-0.3312719, 0.786834, 0.06589466, 0, 1, 0.4313726, 1,
-0.331019, -0.1785999, -2.505513, 0, 1, 0.4352941, 1,
-0.3305877, 0.8098706, 1.566025, 0, 1, 0.4431373, 1,
-0.3300926, -1.59333, -5.252669, 0, 1, 0.4470588, 1,
-0.3299654, 2.052698, 1.007116, 0, 1, 0.454902, 1,
-0.3293453, 0.381585, -0.7064494, 0, 1, 0.4588235, 1,
-0.329268, -1.17164, -1.920185, 0, 1, 0.4666667, 1,
-0.3264097, -0.4155652, -2.716573, 0, 1, 0.4705882, 1,
-0.3258079, 2.428012, 0.6546456, 0, 1, 0.4784314, 1,
-0.3201395, 1.242958, -0.3920114, 0, 1, 0.4823529, 1,
-0.3178899, -0.9735752, -2.747682, 0, 1, 0.4901961, 1,
-0.3150017, 1.106627, -1.04428, 0, 1, 0.4941176, 1,
-0.3090899, -0.3473642, -2.477328, 0, 1, 0.5019608, 1,
-0.3079612, -0.4536869, -1.757611, 0, 1, 0.509804, 1,
-0.3071971, -0.4776103, -1.206205, 0, 1, 0.5137255, 1,
-0.3067541, -1.88845, -3.690373, 0, 1, 0.5215687, 1,
-0.3016492, 0.03912732, -2.002635, 0, 1, 0.5254902, 1,
-0.3002675, 1.461694, -0.3597492, 0, 1, 0.5333334, 1,
-0.2960925, -1.403731, -1.723056, 0, 1, 0.5372549, 1,
-0.2951057, 1.579929, 0.6197487, 0, 1, 0.5450981, 1,
-0.2912479, 0.7577806, -0.4976236, 0, 1, 0.5490196, 1,
-0.2879259, 1.701223, -0.4519863, 0, 1, 0.5568628, 1,
-0.287274, -0.7574919, -1.340422, 0, 1, 0.5607843, 1,
-0.2865205, 2.146697, -0.604188, 0, 1, 0.5686275, 1,
-0.285085, 1.175074, -1.09187, 0, 1, 0.572549, 1,
-0.2831239, 1.204878, -1.564444, 0, 1, 0.5803922, 1,
-0.282381, 0.2968558, -0.9992512, 0, 1, 0.5843138, 1,
-0.2802386, 1.18343, -1.184071, 0, 1, 0.5921569, 1,
-0.2761169, -1.306703, -3.960944, 0, 1, 0.5960785, 1,
-0.2713297, 0.1601072, -0.4419696, 0, 1, 0.6039216, 1,
-0.2643346, -0.3803771, -2.574965, 0, 1, 0.6117647, 1,
-0.2580653, -1.233823, -4.981752, 0, 1, 0.6156863, 1,
-0.2568029, -0.03359955, -3.543873, 0, 1, 0.6235294, 1,
-0.2556837, -0.1482932, -1.514637, 0, 1, 0.627451, 1,
-0.246898, -1.227355, -2.736543, 0, 1, 0.6352941, 1,
-0.2417682, 0.01726814, -0.01116235, 0, 1, 0.6392157, 1,
-0.2366484, 1.490329, -1.395393, 0, 1, 0.6470588, 1,
-0.2337364, 0.09272385, -0.1603672, 0, 1, 0.6509804, 1,
-0.2330237, 0.0642364, -1.099586, 0, 1, 0.6588235, 1,
-0.2325697, 0.9935777, -0.006007842, 0, 1, 0.6627451, 1,
-0.2325241, 1.881835, 0.9737102, 0, 1, 0.6705883, 1,
-0.2323469, 0.1379043, 0.59557, 0, 1, 0.6745098, 1,
-0.2315178, 0.6268232, -0.5290412, 0, 1, 0.682353, 1,
-0.2286121, 0.8929883, 1.089785, 0, 1, 0.6862745, 1,
-0.2275092, -0.4165732, -1.662891, 0, 1, 0.6941177, 1,
-0.2251366, -0.4812165, -1.03137, 0, 1, 0.7019608, 1,
-0.2188004, 0.5840725, -2.029527, 0, 1, 0.7058824, 1,
-0.2163037, -0.4513668, -1.178245, 0, 1, 0.7137255, 1,
-0.2127389, 0.3932672, 0.5268841, 0, 1, 0.7176471, 1,
-0.2125246, -0.4061725, -1.513549, 0, 1, 0.7254902, 1,
-0.2123152, -0.6375098, -4.737216, 0, 1, 0.7294118, 1,
-0.2071514, -0.1849731, -2.959817, 0, 1, 0.7372549, 1,
-0.2057061, 1.059388, 1.405337, 0, 1, 0.7411765, 1,
-0.205637, -0.4971076, -1.36908, 0, 1, 0.7490196, 1,
-0.2044428, -0.01755526, -2.390866, 0, 1, 0.7529412, 1,
-0.2006862, -1.026363, -2.624324, 0, 1, 0.7607843, 1,
-0.2005634, -1.36903, -2.285724, 0, 1, 0.7647059, 1,
-0.1941875, 0.5521454, -0.4853567, 0, 1, 0.772549, 1,
-0.1936468, 1.218375, -0.01981283, 0, 1, 0.7764706, 1,
-0.1935501, -0.1164134, -2.465446, 0, 1, 0.7843137, 1,
-0.1874053, 0.0406737, -0.8985955, 0, 1, 0.7882353, 1,
-0.1847984, -0.5794162, -3.047552, 0, 1, 0.7960784, 1,
-0.1840988, 1.295352, 1.044303, 0, 1, 0.8039216, 1,
-0.1826286, 0.112644, -0.9979076, 0, 1, 0.8078431, 1,
-0.1799044, 0.1047173, -1.054873, 0, 1, 0.8156863, 1,
-0.1741919, 0.2061043, -0.5484331, 0, 1, 0.8196079, 1,
-0.1731887, -0.5117787, -3.288338, 0, 1, 0.827451, 1,
-0.1718618, 0.4208667, -1.030185, 0, 1, 0.8313726, 1,
-0.1693492, -0.7814743, -2.209816, 0, 1, 0.8392157, 1,
-0.1651693, -0.008451303, -2.227411, 0, 1, 0.8431373, 1,
-0.1641727, -0.1569951, -3.546032, 0, 1, 0.8509804, 1,
-0.1619963, 1.116264, 0.7990697, 0, 1, 0.854902, 1,
-0.1619905, -0.6508241, -3.367899, 0, 1, 0.8627451, 1,
-0.1596395, 0.7083378, -1.953279, 0, 1, 0.8666667, 1,
-0.1525148, -0.6146737, -3.387796, 0, 1, 0.8745098, 1,
-0.1512097, -1.567779, -2.861339, 0, 1, 0.8784314, 1,
-0.1422437, 0.4097377, -0.8651825, 0, 1, 0.8862745, 1,
-0.1400908, -0.436306, -1.788533, 0, 1, 0.8901961, 1,
-0.1387874, -0.0970218, -3.912702, 0, 1, 0.8980392, 1,
-0.1384273, -1.639561, -3.508734, 0, 1, 0.9058824, 1,
-0.13071, 0.2647435, -2.060344, 0, 1, 0.9098039, 1,
-0.1289598, 0.9267246, -0.2679887, 0, 1, 0.9176471, 1,
-0.1284975, -0.4807281, -3.066811, 0, 1, 0.9215686, 1,
-0.1270701, -0.7869486, -2.476334, 0, 1, 0.9294118, 1,
-0.1236324, 0.1612092, -2.903156, 0, 1, 0.9333333, 1,
-0.1215825, 0.3863177, -2.004042, 0, 1, 0.9411765, 1,
-0.1168078, 0.4811192, -0.9010344, 0, 1, 0.945098, 1,
-0.1157372, -1.405425, -2.527148, 0, 1, 0.9529412, 1,
-0.1129515, 0.987685, 0.7735833, 0, 1, 0.9568627, 1,
-0.1128097, -0.2976984, -2.995427, 0, 1, 0.9647059, 1,
-0.1125767, -1.78965, -2.616921, 0, 1, 0.9686275, 1,
-0.1102283, -0.583787, -3.719786, 0, 1, 0.9764706, 1,
-0.1085243, 1.374787, 1.218496, 0, 1, 0.9803922, 1,
-0.1059982, 0.9575768, -1.892647, 0, 1, 0.9882353, 1,
-0.1037569, 0.05968453, -1.602256, 0, 1, 0.9921569, 1,
-0.0975332, -0.2942976, -2.245179, 0, 1, 1, 1,
-0.08928153, -0.9892341, -2.760882, 0, 0.9921569, 1, 1,
-0.08847964, 0.6474875, 1.223953, 0, 0.9882353, 1, 1,
-0.08370645, 0.3277855, -0.0992403, 0, 0.9803922, 1, 1,
-0.08261864, -0.3866356, -2.193897, 0, 0.9764706, 1, 1,
-0.08137265, 0.5769491, 0.05745562, 0, 0.9686275, 1, 1,
-0.08085537, -0.3546236, -2.16968, 0, 0.9647059, 1, 1,
-0.06913403, -0.102047, -2.864798, 0, 0.9568627, 1, 1,
-0.06514791, -0.7744723, -1.742786, 0, 0.9529412, 1, 1,
-0.0644931, 1.14273, 2.570209, 0, 0.945098, 1, 1,
-0.06447861, -0.8897262, -4.594171, 0, 0.9411765, 1, 1,
-0.06093898, -0.9440784, -2.853576, 0, 0.9333333, 1, 1,
-0.05832638, -0.03071505, -2.101902, 0, 0.9294118, 1, 1,
-0.05705768, 0.3834296, -1.036428, 0, 0.9215686, 1, 1,
-0.05238642, 0.5242962, -0.4634748, 0, 0.9176471, 1, 1,
-0.05026855, 0.4669304, 0.5336725, 0, 0.9098039, 1, 1,
-0.04635867, -0.3717572, -4.197293, 0, 0.9058824, 1, 1,
-0.04590228, 2.159036, 1.20059, 0, 0.8980392, 1, 1,
-0.0453106, 0.4349722, 0.7098492, 0, 0.8901961, 1, 1,
-0.04385836, 1.400792, -0.6945497, 0, 0.8862745, 1, 1,
-0.0437439, 0.8264807, 0.002104758, 0, 0.8784314, 1, 1,
-0.04361021, 0.5892, 1.538583, 0, 0.8745098, 1, 1,
-0.03888608, 1.08685, 0.3523002, 0, 0.8666667, 1, 1,
-0.03814736, -1.72813, -2.32823, 0, 0.8627451, 1, 1,
-0.03551365, -0.740645, -3.641916, 0, 0.854902, 1, 1,
-0.03382009, -0.9213257, -5.028975, 0, 0.8509804, 1, 1,
-0.02394685, 0.9552816, 0.925488, 0, 0.8431373, 1, 1,
-0.0231571, -1.247995, -2.933434, 0, 0.8392157, 1, 1,
-0.01713903, -1.624084, -1.580917, 0, 0.8313726, 1, 1,
-0.01663647, 0.2501089, -0.04883842, 0, 0.827451, 1, 1,
-0.01551816, 0.9836786, -0.1001318, 0, 0.8196079, 1, 1,
-0.01262865, -1.665052, -3.138717, 0, 0.8156863, 1, 1,
-0.007267051, 0.3460214, -0.5260153, 0, 0.8078431, 1, 1,
-0.005289197, 0.3314069, -0.90453, 0, 0.8039216, 1, 1,
-0.003858722, 1.356757, 0.1222532, 0, 0.7960784, 1, 1,
-0.001178826, -0.4531254, -2.603461, 0, 0.7882353, 1, 1,
-0.0007013276, -0.8308081, -3.81073, 0, 0.7843137, 1, 1,
-0.000497882, -0.6099033, -4.232008, 0, 0.7764706, 1, 1,
4.175129e-05, 0.4743235, -1.134581, 0, 0.772549, 1, 1,
0.0008275357, -0.8848585, 2.135008, 0, 0.7647059, 1, 1,
0.001959219, 0.3943371, 0.8565753, 0, 0.7607843, 1, 1,
0.003190755, 0.7192608, 1.107945, 0, 0.7529412, 1, 1,
0.005779037, -0.5032362, 2.865464, 0, 0.7490196, 1, 1,
0.00911329, 1.534083, -0.3654339, 0, 0.7411765, 1, 1,
0.01249652, 0.8287284, -2.286186, 0, 0.7372549, 1, 1,
0.01722717, 0.08150113, 0.5816641, 0, 0.7294118, 1, 1,
0.02333932, 1.719458, -1.338234, 0, 0.7254902, 1, 1,
0.02999643, -0.9753578, 3.436932, 0, 0.7176471, 1, 1,
0.03135436, 0.9695344, -0.7114995, 0, 0.7137255, 1, 1,
0.03603478, -0.3945046, 4.214234, 0, 0.7058824, 1, 1,
0.03728272, 0.6929501, 0.6200945, 0, 0.6980392, 1, 1,
0.0386806, 0.4587725, -0.7885163, 0, 0.6941177, 1, 1,
0.03995358, -0.6843876, 4.146771, 0, 0.6862745, 1, 1,
0.04247573, 0.9173572, -0.5765696, 0, 0.682353, 1, 1,
0.04502709, -0.7093677, 1.939699, 0, 0.6745098, 1, 1,
0.04790686, -0.9044946, 1.060514, 0, 0.6705883, 1, 1,
0.05016364, -0.9974061, 3.060292, 0, 0.6627451, 1, 1,
0.05040885, -1.928441, 1.73631, 0, 0.6588235, 1, 1,
0.05239015, -0.729807, 2.588547, 0, 0.6509804, 1, 1,
0.05548603, 0.8585685, 0.2519795, 0, 0.6470588, 1, 1,
0.05734783, 1.37734, 0.1996856, 0, 0.6392157, 1, 1,
0.06049226, 0.01892148, 1.317124, 0, 0.6352941, 1, 1,
0.0608931, 0.4203604, 0.5200686, 0, 0.627451, 1, 1,
0.06124788, 1.528328, -0.4836384, 0, 0.6235294, 1, 1,
0.06246223, -0.6987215, 2.871154, 0, 0.6156863, 1, 1,
0.06392954, 1.596738, 0.3955865, 0, 0.6117647, 1, 1,
0.07157913, -2.27017, 2.355035, 0, 0.6039216, 1, 1,
0.07592354, 1.288233, 0.7955559, 0, 0.5960785, 1, 1,
0.07798784, -1.705157, 1.318323, 0, 0.5921569, 1, 1,
0.07844275, -0.3503178, 2.655437, 0, 0.5843138, 1, 1,
0.0793152, -0.7915066, 3.855134, 0, 0.5803922, 1, 1,
0.08121441, -0.5625985, 3.110637, 0, 0.572549, 1, 1,
0.0827909, 0.2486384, 0.1531364, 0, 0.5686275, 1, 1,
0.08357719, -0.8405887, 0.7699592, 0, 0.5607843, 1, 1,
0.08670127, 1.14379, 0.5774949, 0, 0.5568628, 1, 1,
0.09196375, 1.309763, -0.2974273, 0, 0.5490196, 1, 1,
0.09697204, 0.1451883, -0.2974885, 0, 0.5450981, 1, 1,
0.1006292, 0.5042106, 1.480916, 0, 0.5372549, 1, 1,
0.1010684, 0.308069, 0.9444522, 0, 0.5333334, 1, 1,
0.1021034, -0.8688291, 4.815996, 0, 0.5254902, 1, 1,
0.1033751, 1.914022, -0.6666697, 0, 0.5215687, 1, 1,
0.1037463, -0.4132821, 2.287754, 0, 0.5137255, 1, 1,
0.1047989, -0.1068036, 3.31427, 0, 0.509804, 1, 1,
0.1085869, -0.1099021, 1.828435, 0, 0.5019608, 1, 1,
0.109454, -0.01706794, 1.536366, 0, 0.4941176, 1, 1,
0.1140083, 0.2945142, 0.2862262, 0, 0.4901961, 1, 1,
0.1142639, -1.39886, 2.650861, 0, 0.4823529, 1, 1,
0.1167385, 1.570004, -2.903779, 0, 0.4784314, 1, 1,
0.1167842, 1.479989, 0.1874821, 0, 0.4705882, 1, 1,
0.1215823, 0.9423484, -0.640281, 0, 0.4666667, 1, 1,
0.1243778, -1.302511, 3.045686, 0, 0.4588235, 1, 1,
0.1314523, -0.2163114, 2.535456, 0, 0.454902, 1, 1,
0.1315361, -0.8751673, 3.037404, 0, 0.4470588, 1, 1,
0.1412292, 2.125286, 1.548554, 0, 0.4431373, 1, 1,
0.1426051, -0.5516277, 2.943891, 0, 0.4352941, 1, 1,
0.1430476, 0.3692712, -0.2407381, 0, 0.4313726, 1, 1,
0.1478342, 1.581179, 0.01432184, 0, 0.4235294, 1, 1,
0.1561651, 0.4558056, -0.2556514, 0, 0.4196078, 1, 1,
0.1600731, 0.6071686, -0.04848431, 0, 0.4117647, 1, 1,
0.1613735, -0.1220889, 3.193928, 0, 0.4078431, 1, 1,
0.1618064, -0.07069552, 1.483157, 0, 0.4, 1, 1,
0.1712986, -2.756547, 2.951075, 0, 0.3921569, 1, 1,
0.1723835, -0.1232809, 1.99217, 0, 0.3882353, 1, 1,
0.1741177, 0.02315248, 0.9707947, 0, 0.3803922, 1, 1,
0.1769469, -0.3427753, 3.190329, 0, 0.3764706, 1, 1,
0.1805256, 0.6470154, 1.469202, 0, 0.3686275, 1, 1,
0.1821936, 1.013526, -0.6355959, 0, 0.3647059, 1, 1,
0.1852551, 1.330037, 0.173591, 0, 0.3568628, 1, 1,
0.1870048, -0.1665958, 0.139677, 0, 0.3529412, 1, 1,
0.1985279, 0.04742569, 2.728382, 0, 0.345098, 1, 1,
0.203033, -0.2141637, 0.9789456, 0, 0.3411765, 1, 1,
0.2069933, 2.022401, -1.538945, 0, 0.3333333, 1, 1,
0.2097275, -0.4595324, 2.875896, 0, 0.3294118, 1, 1,
0.2098585, -0.494187, 3.613861, 0, 0.3215686, 1, 1,
0.211848, 1.475992, -0.04546607, 0, 0.3176471, 1, 1,
0.21497, -0.4204091, 3.882963, 0, 0.3098039, 1, 1,
0.2176528, -0.7538183, 3.503629, 0, 0.3058824, 1, 1,
0.2198093, -1.615675, 3.744873, 0, 0.2980392, 1, 1,
0.2314995, -0.5144389, 3.663051, 0, 0.2901961, 1, 1,
0.2323912, 0.7278626, -0.9938042, 0, 0.2862745, 1, 1,
0.2385109, 1.089698, -0.08356913, 0, 0.2784314, 1, 1,
0.2424074, -0.5456899, 3.660924, 0, 0.2745098, 1, 1,
0.2425046, -0.6776968, 2.141463, 0, 0.2666667, 1, 1,
0.2442317, -1.99054, 2.615807, 0, 0.2627451, 1, 1,
0.2471876, -1.136529, 2.132686, 0, 0.254902, 1, 1,
0.2499629, 0.4250672, -0.5402971, 0, 0.2509804, 1, 1,
0.2545569, -0.009591031, 3.258261, 0, 0.2431373, 1, 1,
0.2545596, 0.2138347, 1.858669, 0, 0.2392157, 1, 1,
0.2550237, -0.2351461, 2.318883, 0, 0.2313726, 1, 1,
0.2622231, -1.244852, 1.581159, 0, 0.227451, 1, 1,
0.262991, 0.4632319, -1.111533, 0, 0.2196078, 1, 1,
0.2650712, -0.7404408, 2.378517, 0, 0.2156863, 1, 1,
0.2664525, 0.4861528, 0.3100679, 0, 0.2078431, 1, 1,
0.2666297, -1.437955, 3.054823, 0, 0.2039216, 1, 1,
0.2674539, -0.05718868, 1.529613, 0, 0.1960784, 1, 1,
0.268657, 1.056231, 0.8985896, 0, 0.1882353, 1, 1,
0.2715875, 1.435696, -1.060427, 0, 0.1843137, 1, 1,
0.274779, -0.08837248, 3.831517, 0, 0.1764706, 1, 1,
0.2785817, -0.4117237, 3.354373, 0, 0.172549, 1, 1,
0.2826961, -0.5970265, 3.095256, 0, 0.1647059, 1, 1,
0.2885491, -1.783106, 2.805512, 0, 0.1607843, 1, 1,
0.2886285, -0.6348106, 1.142289, 0, 0.1529412, 1, 1,
0.2957762, -0.2195873, 3.034701, 0, 0.1490196, 1, 1,
0.2996519, 0.5404104, 0.2814023, 0, 0.1411765, 1, 1,
0.3033539, 0.2100645, 0.5800717, 0, 0.1372549, 1, 1,
0.3041136, 0.6874563, -0.9640644, 0, 0.1294118, 1, 1,
0.3075968, 0.1946062, -1.054133, 0, 0.1254902, 1, 1,
0.3080213, -0.111395, 1.695371, 0, 0.1176471, 1, 1,
0.3128084, -0.7633396, 2.879531, 0, 0.1137255, 1, 1,
0.3184164, 0.03152523, 1.137798, 0, 0.1058824, 1, 1,
0.3208077, 1.833485, -1.574956, 0, 0.09803922, 1, 1,
0.3222784, -0.9709442, 2.6398, 0, 0.09411765, 1, 1,
0.3286495, 0.9638255, 0.2328801, 0, 0.08627451, 1, 1,
0.3292584, 0.8683782, 1.952794, 0, 0.08235294, 1, 1,
0.3323965, -0.3519908, 3.187376, 0, 0.07450981, 1, 1,
0.3340162, -1.735191, 2.057489, 0, 0.07058824, 1, 1,
0.3401288, -1.887232, 2.637573, 0, 0.0627451, 1, 1,
0.3408997, 1.267649, -0.459913, 0, 0.05882353, 1, 1,
0.3447836, 1.349855, 0.2477767, 0, 0.05098039, 1, 1,
0.3476195, -1.026585, 2.99654, 0, 0.04705882, 1, 1,
0.3476839, -1.614584, 5.097141, 0, 0.03921569, 1, 1,
0.3493301, -1.348211, 4.387578, 0, 0.03529412, 1, 1,
0.3516667, -0.3939484, 0.7305578, 0, 0.02745098, 1, 1,
0.3568705, 1.186335, 2.061969, 0, 0.02352941, 1, 1,
0.3572722, 0.1826776, 2.700353, 0, 0.01568628, 1, 1,
0.3584689, 0.31625, 0.7737055, 0, 0.01176471, 1, 1,
0.3657141, 0.4181513, 0.9411559, 0, 0.003921569, 1, 1,
0.367447, -0.7414542, 3.388278, 0.003921569, 0, 1, 1,
0.367874, -1.777653, 2.367815, 0.007843138, 0, 1, 1,
0.3680615, -0.9071468, 3.772489, 0.01568628, 0, 1, 1,
0.3694238, 0.234823, 1.353214, 0.01960784, 0, 1, 1,
0.3727348, 0.1158897, 0.4501844, 0.02745098, 0, 1, 1,
0.3735547, 0.3205726, 0.7207082, 0.03137255, 0, 1, 1,
0.3801788, -0.6177797, 3.11273, 0.03921569, 0, 1, 1,
0.3806517, 1.277275, 0.4066786, 0.04313726, 0, 1, 1,
0.3826595, 1.480047, 0.04622826, 0.05098039, 0, 1, 1,
0.3834144, -0.4765714, 3.794777, 0.05490196, 0, 1, 1,
0.3840859, -0.03170494, 1.403429, 0.0627451, 0, 1, 1,
0.3857254, 0.1149069, 1.05023, 0.06666667, 0, 1, 1,
0.3885264, -0.5177311, 4.266917, 0.07450981, 0, 1, 1,
0.3894722, 0.2382019, 0.8535976, 0.07843138, 0, 1, 1,
0.3959699, -0.7750668, 3.332966, 0.08627451, 0, 1, 1,
0.3984179, -1.702547, 1.904802, 0.09019608, 0, 1, 1,
0.3994185, 0.4287263, -1.432006, 0.09803922, 0, 1, 1,
0.4051586, 0.3416556, -1.282768, 0.1058824, 0, 1, 1,
0.4059406, 1.205777, -1.556076, 0.1098039, 0, 1, 1,
0.4137046, -0.2237101, 1.820747, 0.1176471, 0, 1, 1,
0.4153038, 1.762953, 1.154367, 0.1215686, 0, 1, 1,
0.41697, -0.3991244, 0.8862094, 0.1294118, 0, 1, 1,
0.4171206, -1.800629, 3.133197, 0.1333333, 0, 1, 1,
0.4198353, -0.8932261, 4.038062, 0.1411765, 0, 1, 1,
0.4205662, 1.252969, -0.3682485, 0.145098, 0, 1, 1,
0.4227129, -0.308609, 1.020835, 0.1529412, 0, 1, 1,
0.4268617, -0.3437127, 3.230578, 0.1568628, 0, 1, 1,
0.4317358, 0.6943894, 2.423548, 0.1647059, 0, 1, 1,
0.4375995, -1.687746, 4.190362, 0.1686275, 0, 1, 1,
0.43846, -1.480491, 2.448917, 0.1764706, 0, 1, 1,
0.4414283, -1.826826, 1.919426, 0.1803922, 0, 1, 1,
0.4438941, -1.045334, 2.270491, 0.1882353, 0, 1, 1,
0.4474036, 0.4616409, 1.686008, 0.1921569, 0, 1, 1,
0.4491305, 0.2432646, -1.335547, 0.2, 0, 1, 1,
0.4499472, -1.099064, 4.679625, 0.2078431, 0, 1, 1,
0.4567938, 0.5134265, -0.9404657, 0.2117647, 0, 1, 1,
0.4581448, -0.5767292, 0.8032902, 0.2196078, 0, 1, 1,
0.4594659, -0.534888, 2.787849, 0.2235294, 0, 1, 1,
0.4620022, -0.3071117, 2.01499, 0.2313726, 0, 1, 1,
0.4629156, -0.00891785, 1.825048, 0.2352941, 0, 1, 1,
0.4631234, -0.2687512, 2.555087, 0.2431373, 0, 1, 1,
0.4770529, 0.3997564, 0.8910438, 0.2470588, 0, 1, 1,
0.4787873, 0.3264774, 0.3320065, 0.254902, 0, 1, 1,
0.4826882, -0.9228907, 3.125543, 0.2588235, 0, 1, 1,
0.4855193, -0.04931588, 1.731302, 0.2666667, 0, 1, 1,
0.4909062, 0.468075, -0.07536349, 0.2705882, 0, 1, 1,
0.4928605, -0.7280676, 4.280844, 0.2784314, 0, 1, 1,
0.5019979, -0.0739517, 2.439833, 0.282353, 0, 1, 1,
0.5049652, 0.61169, 1.523788, 0.2901961, 0, 1, 1,
0.5076123, -0.7138982, 1.746367, 0.2941177, 0, 1, 1,
0.5105977, -1.245758, 3.422638, 0.3019608, 0, 1, 1,
0.5115232, -0.173097, 2.110822, 0.3098039, 0, 1, 1,
0.5120945, 0.08050754, 1.971111, 0.3137255, 0, 1, 1,
0.5137862, -1.451854, 1.474737, 0.3215686, 0, 1, 1,
0.5164949, -1.050721, 0.6742075, 0.3254902, 0, 1, 1,
0.5166304, 0.5615129, -0.04842479, 0.3333333, 0, 1, 1,
0.5188479, -0.5817805, 4.904481, 0.3372549, 0, 1, 1,
0.5202094, -0.0436249, 1.754525, 0.345098, 0, 1, 1,
0.5212901, -2.239851, 2.342414, 0.3490196, 0, 1, 1,
0.525371, -1.270269, 2.547215, 0.3568628, 0, 1, 1,
0.5310153, -0.5180828, 3.534865, 0.3607843, 0, 1, 1,
0.5351986, -2.541217, 2.88197, 0.3686275, 0, 1, 1,
0.5362653, 1.390679, 0.4966334, 0.372549, 0, 1, 1,
0.5407673, -0.1914905, 1.530418, 0.3803922, 0, 1, 1,
0.5409343, -0.8442633, 3.595416, 0.3843137, 0, 1, 1,
0.5495375, -0.2694981, 2.344623, 0.3921569, 0, 1, 1,
0.5513453, -0.07850531, 0.2452543, 0.3960784, 0, 1, 1,
0.5558559, -1.275207, 3.931025, 0.4039216, 0, 1, 1,
0.5616852, 0.2571745, 0.3220601, 0.4117647, 0, 1, 1,
0.574816, -0.4885793, 3.132912, 0.4156863, 0, 1, 1,
0.5785593, -0.1786834, 2.737502, 0.4235294, 0, 1, 1,
0.5788819, -0.1239016, -0.2451258, 0.427451, 0, 1, 1,
0.58008, 0.1136136, 1.596867, 0.4352941, 0, 1, 1,
0.5818124, -0.8204071, 1.349163, 0.4392157, 0, 1, 1,
0.5889148, 0.4182122, -0.2233013, 0.4470588, 0, 1, 1,
0.58943, 1.880226, -0.4756793, 0.4509804, 0, 1, 1,
0.6009052, -2.257555, 2.147131, 0.4588235, 0, 1, 1,
0.6020873, 0.2520167, 0.960961, 0.4627451, 0, 1, 1,
0.6110147, 1.506678, 0.6100422, 0.4705882, 0, 1, 1,
0.6236449, 1.854993, 1.168398, 0.4745098, 0, 1, 1,
0.6247352, -2.280957, 1.722034, 0.4823529, 0, 1, 1,
0.6254977, -0.4296433, 1.391692, 0.4862745, 0, 1, 1,
0.6353325, -0.9452462, 2.048178, 0.4941176, 0, 1, 1,
0.6359733, -0.1217276, 3.454457, 0.5019608, 0, 1, 1,
0.6394807, 0.54389, 0.08123009, 0.5058824, 0, 1, 1,
0.6419974, -0.1863548, 1.413956, 0.5137255, 0, 1, 1,
0.6495879, 0.9075108, -0.7245224, 0.5176471, 0, 1, 1,
0.652841, 0.9280509, 1.515935, 0.5254902, 0, 1, 1,
0.6529769, 0.7385609, 1.040556, 0.5294118, 0, 1, 1,
0.6598089, -1.492092, 4.104945, 0.5372549, 0, 1, 1,
0.6601602, -0.2966168, 4.794388, 0.5411765, 0, 1, 1,
0.665504, 0.9799767, 2.242238, 0.5490196, 0, 1, 1,
0.6709581, -0.1282463, 3.02915, 0.5529412, 0, 1, 1,
0.6726639, -0.3034361, 1.457793, 0.5607843, 0, 1, 1,
0.672823, -0.2861272, 1.625566, 0.5647059, 0, 1, 1,
0.6757476, -0.4083877, 2.040206, 0.572549, 0, 1, 1,
0.6823558, -0.6318449, 1.327566, 0.5764706, 0, 1, 1,
0.6968206, -1.200539, 3.096501, 0.5843138, 0, 1, 1,
0.6993651, -0.7488446, 1.804581, 0.5882353, 0, 1, 1,
0.7000116, -1.11698, 1.403071, 0.5960785, 0, 1, 1,
0.7021706, 0.2365231, 2.986183, 0.6039216, 0, 1, 1,
0.7026332, -0.8583237, 1.631741, 0.6078432, 0, 1, 1,
0.7065949, -0.3682498, 3.147466, 0.6156863, 0, 1, 1,
0.710584, -0.1266812, 1.882164, 0.6196079, 0, 1, 1,
0.7148833, 0.5692828, 0.8441415, 0.627451, 0, 1, 1,
0.7301672, -0.3257702, 2.887925, 0.6313726, 0, 1, 1,
0.7320971, 0.6209178, 0.03920814, 0.6392157, 0, 1, 1,
0.73794, 0.9911698, 1.736577, 0.6431373, 0, 1, 1,
0.7390843, -0.2404869, 2.982852, 0.6509804, 0, 1, 1,
0.741232, 1.537842, 0.4452812, 0.654902, 0, 1, 1,
0.7431026, 1.028785, 0.2806398, 0.6627451, 0, 1, 1,
0.749401, -0.8303778, 1.414152, 0.6666667, 0, 1, 1,
0.7498946, 0.7794186, 1.2361, 0.6745098, 0, 1, 1,
0.7524345, 0.393717, 1.133187, 0.6784314, 0, 1, 1,
0.7542713, -0.6476322, 1.125091, 0.6862745, 0, 1, 1,
0.7618746, -0.08399729, 1.387525, 0.6901961, 0, 1, 1,
0.7660711, -0.8020344, 3.402089, 0.6980392, 0, 1, 1,
0.7666939, -1.633837, 2.665204, 0.7058824, 0, 1, 1,
0.7735055, -0.8367219, 2.904005, 0.7098039, 0, 1, 1,
0.7754667, -1.148696, 1.89513, 0.7176471, 0, 1, 1,
0.7930254, 0.03326668, 1.848858, 0.7215686, 0, 1, 1,
0.7941024, -0.6771826, 2.650363, 0.7294118, 0, 1, 1,
0.7992124, -0.4133242, 1.918937, 0.7333333, 0, 1, 1,
0.8007545, -0.8691404, 2.467376, 0.7411765, 0, 1, 1,
0.8028288, -2.32617, 3.341761, 0.7450981, 0, 1, 1,
0.8114106, 1.04424, 0.9176657, 0.7529412, 0, 1, 1,
0.8171012, 1.225359, 1.260377, 0.7568628, 0, 1, 1,
0.8174726, -0.0928091, 3.343244, 0.7647059, 0, 1, 1,
0.8226107, 1.963752, 0.5830737, 0.7686275, 0, 1, 1,
0.8244559, -0.3681726, 0.6464619, 0.7764706, 0, 1, 1,
0.8322114, -1.644997, 3.555821, 0.7803922, 0, 1, 1,
0.8365886, -1.936192, 2.637464, 0.7882353, 0, 1, 1,
0.8381734, -0.5657245, 1.390043, 0.7921569, 0, 1, 1,
0.8382843, -0.9090044, 1.747192, 0.8, 0, 1, 1,
0.8441059, -0.2103871, 2.197285, 0.8078431, 0, 1, 1,
0.8517639, 1.60429, 2.196904, 0.8117647, 0, 1, 1,
0.8622258, -1.207337, 1.632269, 0.8196079, 0, 1, 1,
0.865176, 0.4099857, 1.601056, 0.8235294, 0, 1, 1,
0.8657025, -1.296694, 1.647848, 0.8313726, 0, 1, 1,
0.8709723, -1.788797, 2.150986, 0.8352941, 0, 1, 1,
0.8768513, 0.488259, 1.062773, 0.8431373, 0, 1, 1,
0.8796226, -0.219788, 0.6761407, 0.8470588, 0, 1, 1,
0.8864434, -0.2026698, 2.502787, 0.854902, 0, 1, 1,
0.887512, -2.07787, 2.22798, 0.8588235, 0, 1, 1,
0.8878177, -0.9516802, 2.316572, 0.8666667, 0, 1, 1,
0.8880605, 1.087387, -0.2524016, 0.8705882, 0, 1, 1,
0.8886149, 0.1458226, 0.48961, 0.8784314, 0, 1, 1,
0.8886628, 0.0567079, 2.037837, 0.8823529, 0, 1, 1,
0.8914262, 0.9178562, 2.002198, 0.8901961, 0, 1, 1,
0.8922603, 2.615386, -0.8660114, 0.8941177, 0, 1, 1,
0.8952036, 0.2132019, 1.366402, 0.9019608, 0, 1, 1,
0.8972315, 0.2439902, 1.998049, 0.9098039, 0, 1, 1,
0.898841, 0.3973739, 1.192549, 0.9137255, 0, 1, 1,
0.9030286, 1.603307, 1.494397, 0.9215686, 0, 1, 1,
0.9041216, 0.03539129, 0.853411, 0.9254902, 0, 1, 1,
0.9117489, 0.455301, 1.514418, 0.9333333, 0, 1, 1,
0.9209124, 1.102161, 1.557114, 0.9372549, 0, 1, 1,
0.9330902, -0.6525039, 2.243624, 0.945098, 0, 1, 1,
0.9419596, 1.707459, 0.8602785, 0.9490196, 0, 1, 1,
0.9499537, 1.863495, 0.7551645, 0.9568627, 0, 1, 1,
0.9667224, 0.4335121, -0.1620487, 0.9607843, 0, 1, 1,
0.9674854, -0.9934692, 2.377468, 0.9686275, 0, 1, 1,
0.9702199, 0.1592429, 2.13408, 0.972549, 0, 1, 1,
0.9715593, 1.447143, -0.9244803, 0.9803922, 0, 1, 1,
0.9755385, 0.3444332, 1.646345, 0.9843137, 0, 1, 1,
0.976056, -0.5367011, 2.321584, 0.9921569, 0, 1, 1,
0.9809433, -0.1941857, 1.447991, 0.9960784, 0, 1, 1,
0.981012, -0.7691832, 2.819265, 1, 0, 0.9960784, 1,
0.9842353, -1.49241, 2.675823, 1, 0, 0.9882353, 1,
0.9856002, 0.5602688, -0.2400043, 1, 0, 0.9843137, 1,
0.9856383, -1.274874, 2.470294, 1, 0, 0.9764706, 1,
0.9875653, -0.5492795, 1.82144, 1, 0, 0.972549, 1,
0.9886267, -0.1060677, 1.76795, 1, 0, 0.9647059, 1,
0.9891539, 1.85069, 0.2925102, 1, 0, 0.9607843, 1,
0.9903119, 0.3490066, 1.849075, 1, 0, 0.9529412, 1,
0.9922279, 1.670508, -0.5414052, 1, 0, 0.9490196, 1,
0.9954103, -0.05963865, 3.452582, 1, 0, 0.9411765, 1,
1.009451, -0.4976589, 1.081587, 1, 0, 0.9372549, 1,
1.013255, 0.1716641, 1.593117, 1, 0, 0.9294118, 1,
1.013471, 1.183912, 2.378925, 1, 0, 0.9254902, 1,
1.017765, 0.3280187, 0.6998579, 1, 0, 0.9176471, 1,
1.02649, 0.5737155, -1.328186, 1, 0, 0.9137255, 1,
1.029579, -1.045079, 2.719995, 1, 0, 0.9058824, 1,
1.034829, 0.9035548, 1.017436, 1, 0, 0.9019608, 1,
1.03485, 0.1788043, 1.199816, 1, 0, 0.8941177, 1,
1.036794, 0.4160374, 0.4021259, 1, 0, 0.8862745, 1,
1.038771, 0.554985, 0.6574906, 1, 0, 0.8823529, 1,
1.043564, -0.7403651, 3.171535, 1, 0, 0.8745098, 1,
1.050261, 0.7978656, 2.434499, 1, 0, 0.8705882, 1,
1.050423, -2.190711, 2.465647, 1, 0, 0.8627451, 1,
1.05738, 2.047357, 1.068858, 1, 0, 0.8588235, 1,
1.060781, -0.4416445, 1.014188, 1, 0, 0.8509804, 1,
1.071007, 1.007235, 0.4244737, 1, 0, 0.8470588, 1,
1.073971, 2.085683, -0.5406746, 1, 0, 0.8392157, 1,
1.076931, -0.1671476, 0.6058973, 1, 0, 0.8352941, 1,
1.09123, 0.1005762, 2.705539, 1, 0, 0.827451, 1,
1.092333, -0.138705, 4.278195, 1, 0, 0.8235294, 1,
1.093337, 0.4340487, 0.2959061, 1, 0, 0.8156863, 1,
1.093576, -1.135764, 1.772243, 1, 0, 0.8117647, 1,
1.095493, 0.1811521, 0.5918015, 1, 0, 0.8039216, 1,
1.096852, -0.6323681, 4.923804, 1, 0, 0.7960784, 1,
1.106029, -0.1202852, 2.18442, 1, 0, 0.7921569, 1,
1.106635, 1.600169, -0.1762655, 1, 0, 0.7843137, 1,
1.114463, 0.2798331, 1.253275, 1, 0, 0.7803922, 1,
1.121103, 0.2174895, 0.1358888, 1, 0, 0.772549, 1,
1.122383, -0.6828305, 0.6150928, 1, 0, 0.7686275, 1,
1.129334, 0.2827895, 0.636786, 1, 0, 0.7607843, 1,
1.129676, 0.01483482, -0.4661982, 1, 0, 0.7568628, 1,
1.129997, -0.01881827, 1.815064, 1, 0, 0.7490196, 1,
1.147217, 0.7201982, 2.053639, 1, 0, 0.7450981, 1,
1.148335, -0.9698331, 2.089645, 1, 0, 0.7372549, 1,
1.168192, -0.4783698, -0.4054536, 1, 0, 0.7333333, 1,
1.178513, -0.1181778, 2.08412, 1, 0, 0.7254902, 1,
1.185416, -0.1854776, -1.366129, 1, 0, 0.7215686, 1,
1.18872, -0.1235956, -0.2495084, 1, 0, 0.7137255, 1,
1.192716, 0.3901065, 1.43094, 1, 0, 0.7098039, 1,
1.193541, 1.902011, 1.89955, 1, 0, 0.7019608, 1,
1.193623, -0.1847929, 1.316813, 1, 0, 0.6941177, 1,
1.208123, -0.1097402, 1.577821, 1, 0, 0.6901961, 1,
1.211569, 0.06947893, 1.109539, 1, 0, 0.682353, 1,
1.213182, 1.165599, 1.175518, 1, 0, 0.6784314, 1,
1.21453, -0.5968102, 3.052164, 1, 0, 0.6705883, 1,
1.220389, 0.7511656, 1.096705, 1, 0, 0.6666667, 1,
1.221671, 0.9950603, -0.6532152, 1, 0, 0.6588235, 1,
1.225667, 1.197432, -1.48188, 1, 0, 0.654902, 1,
1.230916, 0.1310741, -0.0943807, 1, 0, 0.6470588, 1,
1.232031, 1.086391, 0.01584747, 1, 0, 0.6431373, 1,
1.234675, -1.110263, 1.520564, 1, 0, 0.6352941, 1,
1.241363, 0.537794, -0.2593257, 1, 0, 0.6313726, 1,
1.244376, -0.3025531, 1.462165, 1, 0, 0.6235294, 1,
1.262554, -1.455327, 3.150746, 1, 0, 0.6196079, 1,
1.26332, -0.9761284, 0.6798514, 1, 0, 0.6117647, 1,
1.26395, -2.154716, 2.805213, 1, 0, 0.6078432, 1,
1.266696, 0.3828904, 1.949112, 1, 0, 0.6, 1,
1.282766, -1.079554, 2.836025, 1, 0, 0.5921569, 1,
1.287998, -0.6614262, 2.880978, 1, 0, 0.5882353, 1,
1.292459, 0.2408677, 0.7954012, 1, 0, 0.5803922, 1,
1.294869, 1.771758, 1.835479, 1, 0, 0.5764706, 1,
1.295829, -0.3434541, 1.479456, 1, 0, 0.5686275, 1,
1.315898, -1.765657, 2.878555, 1, 0, 0.5647059, 1,
1.316936, -0.1108412, 1.410322, 1, 0, 0.5568628, 1,
1.318653, -0.9996384, 3.58222, 1, 0, 0.5529412, 1,
1.31996, -0.07564136, 1.18938, 1, 0, 0.5450981, 1,
1.321581, -0.6183091, 2.099201, 1, 0, 0.5411765, 1,
1.327364, 0.3850903, 1.461975, 1, 0, 0.5333334, 1,
1.333655, -0.830534, 3.254182, 1, 0, 0.5294118, 1,
1.333782, -0.7977782, 1.783519, 1, 0, 0.5215687, 1,
1.334983, -0.9861473, 0.5892538, 1, 0, 0.5176471, 1,
1.343914, -1.168941, 1.714327, 1, 0, 0.509804, 1,
1.34811, 0.3584081, 3.322401, 1, 0, 0.5058824, 1,
1.348308, 0.1549104, 0.6527141, 1, 0, 0.4980392, 1,
1.371892, 2.131487, 0.3341222, 1, 0, 0.4901961, 1,
1.37855, 0.8671986, -0.1702736, 1, 0, 0.4862745, 1,
1.388749, -0.620579, 2.524013, 1, 0, 0.4784314, 1,
1.395689, -0.5405936, -0.3674778, 1, 0, 0.4745098, 1,
1.401134, 0.2127244, 2.944842, 1, 0, 0.4666667, 1,
1.411485, 0.5820256, 0.4055067, 1, 0, 0.4627451, 1,
1.431229, -0.6887691, 0.6575282, 1, 0, 0.454902, 1,
1.434626, 0.11001, 2.535326, 1, 0, 0.4509804, 1,
1.440554, -1.195109, 2.747169, 1, 0, 0.4431373, 1,
1.442274, 0.1094378, 1.533931, 1, 0, 0.4392157, 1,
1.445943, -1.553259, 4.877278, 1, 0, 0.4313726, 1,
1.448244, 0.8356445, 1.318007, 1, 0, 0.427451, 1,
1.463884, 0.8495946, 2.052267, 1, 0, 0.4196078, 1,
1.468316, -0.9967606, 1.907692, 1, 0, 0.4156863, 1,
1.482744, 0.9133518, -0.09529549, 1, 0, 0.4078431, 1,
1.489729, 1.780484, -0.3145004, 1, 0, 0.4039216, 1,
1.49398, 1.106475, 1.518927, 1, 0, 0.3960784, 1,
1.502427, 0.3549526, 0.8582291, 1, 0, 0.3882353, 1,
1.521549, -0.4606846, 3.581134, 1, 0, 0.3843137, 1,
1.544278, -0.399123, 1.213049, 1, 0, 0.3764706, 1,
1.545767, 0.9699975, 1.633436, 1, 0, 0.372549, 1,
1.560528, -0.05792688, 1.984867, 1, 0, 0.3647059, 1,
1.566779, -0.4122321, 1.060492, 1, 0, 0.3607843, 1,
1.568219, -1.240197, 2.06038, 1, 0, 0.3529412, 1,
1.568812, -0.1989139, 2.360332, 1, 0, 0.3490196, 1,
1.569491, 0.6732311, 1.073777, 1, 0, 0.3411765, 1,
1.597351, 0.5598769, 1.620826, 1, 0, 0.3372549, 1,
1.598219, 0.3288143, 1.202307, 1, 0, 0.3294118, 1,
1.603149, 0.4748668, 0.4129447, 1, 0, 0.3254902, 1,
1.633455, -0.5774846, 0.7679052, 1, 0, 0.3176471, 1,
1.645604, -0.009962629, 1.9971, 1, 0, 0.3137255, 1,
1.646152, -0.430662, 3.938797, 1, 0, 0.3058824, 1,
1.646262, -0.7069243, 2.495742, 1, 0, 0.2980392, 1,
1.669509, -1.058446, 3.241008, 1, 0, 0.2941177, 1,
1.672241, -0.003286489, 1.644274, 1, 0, 0.2862745, 1,
1.674816, 0.2370124, 0.9273385, 1, 0, 0.282353, 1,
1.683589, -0.5845234, 0.9698346, 1, 0, 0.2745098, 1,
1.684134, -0.8594502, 3.353022, 1, 0, 0.2705882, 1,
1.689721, 0.8455582, 2.425949, 1, 0, 0.2627451, 1,
1.691113, -1.223593, 1.669583, 1, 0, 0.2588235, 1,
1.696787, 0.4437916, 0.2824357, 1, 0, 0.2509804, 1,
1.697119, 1.657762, -0.07970773, 1, 0, 0.2470588, 1,
1.732118, -1.806855, 2.854702, 1, 0, 0.2392157, 1,
1.748018, -2.050624, 2.750219, 1, 0, 0.2352941, 1,
1.751999, 0.793863, 0.1674214, 1, 0, 0.227451, 1,
1.780161, 2.334966, 2.070473, 1, 0, 0.2235294, 1,
1.792307, -0.5914323, 2.543084, 1, 0, 0.2156863, 1,
1.825989, -0.241233, 1.117574, 1, 0, 0.2117647, 1,
1.83094, -1.506216, 3.037876, 1, 0, 0.2039216, 1,
1.839221, 0.78233, 1.687012, 1, 0, 0.1960784, 1,
1.859616, -2.173554, 2.260408, 1, 0, 0.1921569, 1,
1.866198, 2.780077, 0.7430607, 1, 0, 0.1843137, 1,
1.881664, -1.224213, 2.344416, 1, 0, 0.1803922, 1,
1.882481, -0.8662037, 1.223108, 1, 0, 0.172549, 1,
1.88567, 0.6029373, 2.62644, 1, 0, 0.1686275, 1,
1.895368, 0.0401264, 3.17655, 1, 0, 0.1607843, 1,
1.913497, 1.932293, 0.3870833, 1, 0, 0.1568628, 1,
1.927266, 1.852279, 1.565993, 1, 0, 0.1490196, 1,
1.93467, 1.758943, 1.021009, 1, 0, 0.145098, 1,
1.953276, 0.8511875, 2.388111, 1, 0, 0.1372549, 1,
1.980475, -0.3017473, 1.077653, 1, 0, 0.1333333, 1,
2.005217, -0.8071076, 3.898866, 1, 0, 0.1254902, 1,
2.033554, 0.635789, 1.524614, 1, 0, 0.1215686, 1,
2.046914, 0.2721411, 2.73693, 1, 0, 0.1137255, 1,
2.047221, 0.07314718, 0.4835621, 1, 0, 0.1098039, 1,
2.053056, -0.719381, 1.823422, 1, 0, 0.1019608, 1,
2.058462, 1.085029, -0.3589545, 1, 0, 0.09411765, 1,
2.099521, -1.539801, -0.177735, 1, 0, 0.09019608, 1,
2.11789, 1.082321, 1.978581, 1, 0, 0.08235294, 1,
2.153599, -2.158368, 3.44324, 1, 0, 0.07843138, 1,
2.168577, -0.8787414, 0.9302111, 1, 0, 0.07058824, 1,
2.237228, 0.0666021, -0.1731522, 1, 0, 0.06666667, 1,
2.288939, -0.02114476, 2.829405, 1, 0, 0.05882353, 1,
2.3227, -1.013145, 3.168159, 1, 0, 0.05490196, 1,
2.438125, 0.3066847, 1.210792, 1, 0, 0.04705882, 1,
2.47292, -0.3038538, 1.849914, 1, 0, 0.04313726, 1,
2.619329, 0.4705583, 0.5211157, 1, 0, 0.03529412, 1,
2.750342, -0.8834769, 2.832249, 1, 0, 0.03137255, 1,
2.872879, -0.5561609, 2.440481, 1, 0, 0.02352941, 1,
2.900455, 0.3032703, 1.921911, 1, 0, 0.01960784, 1,
3.051043, 2.205549, -0.3496269, 1, 0, 0.01176471, 1,
3.20628, 1.10337, 0.6199786, 1, 0, 0.007843138, 1
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
-0.1869208, -3.695004, -7.006962, 0, -0.5, 0.5, 0.5,
-0.1869208, -3.695004, -7.006962, 1, -0.5, 0.5, 0.5,
-0.1869208, -3.695004, -7.006962, 1, 1.5, 0.5, 0.5,
-0.1869208, -3.695004, -7.006962, 0, 1.5, 0.5, 0.5
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
-4.730417, 0.01176536, -7.006962, 0, -0.5, 0.5, 0.5,
-4.730417, 0.01176536, -7.006962, 1, -0.5, 0.5, 0.5,
-4.730417, 0.01176536, -7.006962, 1, 1.5, 0.5, 0.5,
-4.730417, 0.01176536, -7.006962, 0, 1.5, 0.5, 0.5
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
-4.730417, -3.695004, -0.0777638, 0, -0.5, 0.5, 0.5,
-4.730417, -3.695004, -0.0777638, 1, -0.5, 0.5, 0.5,
-4.730417, -3.695004, -0.0777638, 1, 1.5, 0.5, 0.5,
-4.730417, -3.695004, -0.0777638, 0, 1.5, 0.5, 0.5
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
-3, -2.839596, -5.407916,
3, -2.839596, -5.407916,
-3, -2.839596, -5.407916,
-3, -2.982164, -5.674424,
-2, -2.839596, -5.407916,
-2, -2.982164, -5.674424,
-1, -2.839596, -5.407916,
-1, -2.982164, -5.674424,
0, -2.839596, -5.407916,
0, -2.982164, -5.674424,
1, -2.839596, -5.407916,
1, -2.982164, -5.674424,
2, -2.839596, -5.407916,
2, -2.982164, -5.674424,
3, -2.839596, -5.407916,
3, -2.982164, -5.674424
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
-3, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
-3, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
-3, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
-3, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
-2, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
-2, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
-2, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
-2, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
-1, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
-1, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
-1, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
-1, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
0, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
0, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
0, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
0, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
1, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
1, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
1, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
1, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
2, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
2, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
2, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
2, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5,
3, -3.2673, -6.207439, 0, -0.5, 0.5, 0.5,
3, -3.2673, -6.207439, 1, -0.5, 0.5, 0.5,
3, -3.2673, -6.207439, 1, 1.5, 0.5, 0.5,
3, -3.2673, -6.207439, 0, 1.5, 0.5, 0.5
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
-3.681917, -2, -5.407916,
-3.681917, 2, -5.407916,
-3.681917, -2, -5.407916,
-3.856667, -2, -5.674424,
-3.681917, -1, -5.407916,
-3.856667, -1, -5.674424,
-3.681917, 0, -5.407916,
-3.856667, 0, -5.674424,
-3.681917, 1, -5.407916,
-3.856667, 1, -5.674424,
-3.681917, 2, -5.407916,
-3.856667, 2, -5.674424
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
-4.206167, -2, -6.207439, 0, -0.5, 0.5, 0.5,
-4.206167, -2, -6.207439, 1, -0.5, 0.5, 0.5,
-4.206167, -2, -6.207439, 1, 1.5, 0.5, 0.5,
-4.206167, -2, -6.207439, 0, 1.5, 0.5, 0.5,
-4.206167, -1, -6.207439, 0, -0.5, 0.5, 0.5,
-4.206167, -1, -6.207439, 1, -0.5, 0.5, 0.5,
-4.206167, -1, -6.207439, 1, 1.5, 0.5, 0.5,
-4.206167, -1, -6.207439, 0, 1.5, 0.5, 0.5,
-4.206167, 0, -6.207439, 0, -0.5, 0.5, 0.5,
-4.206167, 0, -6.207439, 1, -0.5, 0.5, 0.5,
-4.206167, 0, -6.207439, 1, 1.5, 0.5, 0.5,
-4.206167, 0, -6.207439, 0, 1.5, 0.5, 0.5,
-4.206167, 1, -6.207439, 0, -0.5, 0.5, 0.5,
-4.206167, 1, -6.207439, 1, -0.5, 0.5, 0.5,
-4.206167, 1, -6.207439, 1, 1.5, 0.5, 0.5,
-4.206167, 1, -6.207439, 0, 1.5, 0.5, 0.5,
-4.206167, 2, -6.207439, 0, -0.5, 0.5, 0.5,
-4.206167, 2, -6.207439, 1, -0.5, 0.5, 0.5,
-4.206167, 2, -6.207439, 1, 1.5, 0.5, 0.5,
-4.206167, 2, -6.207439, 0, 1.5, 0.5, 0.5
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
-3.681917, -2.839596, -4,
-3.681917, -2.839596, 4,
-3.681917, -2.839596, -4,
-3.856667, -2.982164, -4,
-3.681917, -2.839596, -2,
-3.856667, -2.982164, -2,
-3.681917, -2.839596, 0,
-3.856667, -2.982164, 0,
-3.681917, -2.839596, 2,
-3.856667, -2.982164, 2,
-3.681917, -2.839596, 4,
-3.856667, -2.982164, 4
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
-4.206167, -3.2673, -4, 0, -0.5, 0.5, 0.5,
-4.206167, -3.2673, -4, 1, -0.5, 0.5, 0.5,
-4.206167, -3.2673, -4, 1, 1.5, 0.5, 0.5,
-4.206167, -3.2673, -4, 0, 1.5, 0.5, 0.5,
-4.206167, -3.2673, -2, 0, -0.5, 0.5, 0.5,
-4.206167, -3.2673, -2, 1, -0.5, 0.5, 0.5,
-4.206167, -3.2673, -2, 1, 1.5, 0.5, 0.5,
-4.206167, -3.2673, -2, 0, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 0, 0, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 0, 1, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 0, 1, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 0, 0, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 2, 0, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 2, 1, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 2, 1, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 2, 0, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 4, 0, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 4, 1, -0.5, 0.5, 0.5,
-4.206167, -3.2673, 4, 1, 1.5, 0.5, 0.5,
-4.206167, -3.2673, 4, 0, 1.5, 0.5, 0.5
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
-3.681917, -2.839596, -5.407916,
-3.681917, 2.863127, -5.407916,
-3.681917, -2.839596, 5.252388,
-3.681917, 2.863127, 5.252388,
-3.681917, -2.839596, -5.407916,
-3.681917, -2.839596, 5.252388,
-3.681917, 2.863127, -5.407916,
-3.681917, 2.863127, 5.252388,
-3.681917, -2.839596, -5.407916,
3.308076, -2.839596, -5.407916,
-3.681917, -2.839596, 5.252388,
3.308076, -2.839596, 5.252388,
-3.681917, 2.863127, -5.407916,
3.308076, 2.863127, -5.407916,
-3.681917, 2.863127, 5.252388,
3.308076, 2.863127, 5.252388,
3.308076, -2.839596, -5.407916,
3.308076, 2.863127, -5.407916,
3.308076, -2.839596, 5.252388,
3.308076, 2.863127, 5.252388,
3.308076, -2.839596, -5.407916,
3.308076, -2.839596, 5.252388,
3.308076, 2.863127, -5.407916,
3.308076, 2.863127, 5.252388
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
var radius = 7.457076;
var distance = 33.17737;
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
mvMatrix.translate( 0.1869208, -0.01176536, 0.0777638 );
mvMatrix.scale( 1.153468, 1.41384, 0.7563326 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.17737);
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


