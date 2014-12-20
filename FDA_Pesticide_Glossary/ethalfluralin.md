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
-3.652962, -0.3240989, -0.917217, 1, 0, 0, 1,
-2.989545, -2.006464, -2.057807, 1, 0.007843138, 0, 1,
-2.983976, -0.2850761, -2.738298, 1, 0.01176471, 0, 1,
-2.914694, 1.286273, -1.657652, 1, 0.01960784, 0, 1,
-2.85187, -2.203101, -1.622931, 1, 0.02352941, 0, 1,
-2.682405, -0.7370012, -1.702595, 1, 0.03137255, 0, 1,
-2.682067, 0.8021742, 0.6250084, 1, 0.03529412, 0, 1,
-2.652642, -1.105475, -2.499227, 1, 0.04313726, 0, 1,
-2.635025, -2.165087, -2.61015, 1, 0.04705882, 0, 1,
-2.339412, 1.045553, -2.654762, 1, 0.05490196, 0, 1,
-2.283978, 0.7853714, -0.8759099, 1, 0.05882353, 0, 1,
-2.232049, -1.293475, -1.50141, 1, 0.06666667, 0, 1,
-2.153473, 0.7446873, -2.639592, 1, 0.07058824, 0, 1,
-2.136619, -0.6966146, -1.331616, 1, 0.07843138, 0, 1,
-2.116927, 2.119465, -0.5139015, 1, 0.08235294, 0, 1,
-2.084015, -0.6976377, -0.8031079, 1, 0.09019608, 0, 1,
-2.071166, 0.2654389, -0.766755, 1, 0.09411765, 0, 1,
-2.064537, -0.195524, -0.8552393, 1, 0.1019608, 0, 1,
-2.044284, 0.3908191, -0.2461196, 1, 0.1098039, 0, 1,
-2.007615, 0.1100997, -0.9825653, 1, 0.1137255, 0, 1,
-1.978226, 0.7623514, -0.9451641, 1, 0.1215686, 0, 1,
-1.931875, 0.2740663, -2.575972, 1, 0.1254902, 0, 1,
-1.922881, 0.3139063, -1.091855, 1, 0.1333333, 0, 1,
-1.90245, -0.1777545, -1.139518, 1, 0.1372549, 0, 1,
-1.897066, -0.3718232, -1.633762, 1, 0.145098, 0, 1,
-1.889078, -0.889355, -1.560359, 1, 0.1490196, 0, 1,
-1.888926, -0.05702372, 0.4569131, 1, 0.1568628, 0, 1,
-1.885923, 0.5969014, -1.10768, 1, 0.1607843, 0, 1,
-1.875997, 0.4394413, 0.1362134, 1, 0.1686275, 0, 1,
-1.834257, 1.398227, -1.653976, 1, 0.172549, 0, 1,
-1.796831, -1.046617, -2.907097, 1, 0.1803922, 0, 1,
-1.781201, 0.5376856, 0.03752624, 1, 0.1843137, 0, 1,
-1.767462, -1.286667, -3.784151, 1, 0.1921569, 0, 1,
-1.748997, -0.5146799, -2.59518, 1, 0.1960784, 0, 1,
-1.741609, 0.9266275, 0.1392772, 1, 0.2039216, 0, 1,
-1.723812, 0.8154579, 0.5068639, 1, 0.2117647, 0, 1,
-1.716702, -2.190882, -2.169837, 1, 0.2156863, 0, 1,
-1.707402, 0.6604168, -1.684932, 1, 0.2235294, 0, 1,
-1.703682, 1.043191, 0.5833989, 1, 0.227451, 0, 1,
-1.700678, 0.1111482, -2.181754, 1, 0.2352941, 0, 1,
-1.690958, -0.03528408, -3.284379, 1, 0.2392157, 0, 1,
-1.685035, 0.2196319, -0.6164335, 1, 0.2470588, 0, 1,
-1.659851, 0.09199521, -1.460112, 1, 0.2509804, 0, 1,
-1.647414, -0.1480402, -1.734324, 1, 0.2588235, 0, 1,
-1.615984, 0.3143483, -0.4719689, 1, 0.2627451, 0, 1,
-1.607906, -0.2700357, -2.613344, 1, 0.2705882, 0, 1,
-1.596315, 0.5224662, -2.656065, 1, 0.2745098, 0, 1,
-1.58926, 0.8352078, -2.639206, 1, 0.282353, 0, 1,
-1.586745, 0.7660034, 1.043801, 1, 0.2862745, 0, 1,
-1.584728, -0.4221924, -2.68766, 1, 0.2941177, 0, 1,
-1.570491, -0.4794268, -2.483423, 1, 0.3019608, 0, 1,
-1.568723, 0.4988581, -1.038829, 1, 0.3058824, 0, 1,
-1.566001, 1.123671, -1.076978, 1, 0.3137255, 0, 1,
-1.562747, -1.157227, -1.035705, 1, 0.3176471, 0, 1,
-1.558431, 0.07750943, -3.096831, 1, 0.3254902, 0, 1,
-1.556569, -0.7662101, -1.362823, 1, 0.3294118, 0, 1,
-1.553461, 1.036727, -0.3678022, 1, 0.3372549, 0, 1,
-1.536436, 1.007874, -0.9446248, 1, 0.3411765, 0, 1,
-1.531265, -0.1554756, -4.461902, 1, 0.3490196, 0, 1,
-1.528131, 0.3743199, -0.5435702, 1, 0.3529412, 0, 1,
-1.522696, 0.5630308, 0.3625216, 1, 0.3607843, 0, 1,
-1.519611, -0.3603436, -3.05364, 1, 0.3647059, 0, 1,
-1.500942, 0.06422067, -3.04831, 1, 0.372549, 0, 1,
-1.495103, -0.672075, -1.567373, 1, 0.3764706, 0, 1,
-1.473727, 1.332426, 0.3911419, 1, 0.3843137, 0, 1,
-1.44868, -0.1287299, -0.2027685, 1, 0.3882353, 0, 1,
-1.412781, -0.6494791, -0.4644795, 1, 0.3960784, 0, 1,
-1.40255, -0.09115314, -3.274042, 1, 0.4039216, 0, 1,
-1.398319, 0.5765487, -0.6033192, 1, 0.4078431, 0, 1,
-1.38133, 0.7312053, -2.707276, 1, 0.4156863, 0, 1,
-1.373564, -0.4118407, -1.510621, 1, 0.4196078, 0, 1,
-1.3713, -0.6518144, -1.731841, 1, 0.427451, 0, 1,
-1.369918, 1.043061, -1.046209, 1, 0.4313726, 0, 1,
-1.361821, -1.075987, -1.731024, 1, 0.4392157, 0, 1,
-1.343753, -1.40769, -4.487797, 1, 0.4431373, 0, 1,
-1.333052, -0.7281518, -1.30562, 1, 0.4509804, 0, 1,
-1.318467, 0.8785635, -2.726736, 1, 0.454902, 0, 1,
-1.316831, -1.591986, -3.337156, 1, 0.4627451, 0, 1,
-1.306754, 0.8421229, -0.3976414, 1, 0.4666667, 0, 1,
-1.30468, -1.501524, -2.547751, 1, 0.4745098, 0, 1,
-1.297892, 1.581252, -1.525578, 1, 0.4784314, 0, 1,
-1.274226, -0.3882597, -0.4724682, 1, 0.4862745, 0, 1,
-1.267015, -0.1613247, -1.200788, 1, 0.4901961, 0, 1,
-1.262261, 1.962495, -0.2759665, 1, 0.4980392, 0, 1,
-1.257712, -0.352534, -2.776905, 1, 0.5058824, 0, 1,
-1.255452, -0.3246141, -2.852542, 1, 0.509804, 0, 1,
-1.251505, 0.6938699, -1.096265, 1, 0.5176471, 0, 1,
-1.243879, 1.250669, -2.065645, 1, 0.5215687, 0, 1,
-1.238567, -0.3767529, -2.093342, 1, 0.5294118, 0, 1,
-1.234528, -0.2724991, -2.795234, 1, 0.5333334, 0, 1,
-1.2327, 0.2291401, -3.333793, 1, 0.5411765, 0, 1,
-1.228052, -0.68826, -3.0108, 1, 0.5450981, 0, 1,
-1.22155, 1.652915, -1.639554, 1, 0.5529412, 0, 1,
-1.212549, 0.7878664, -0.344476, 1, 0.5568628, 0, 1,
-1.210709, -0.01607057, -2.489512, 1, 0.5647059, 0, 1,
-1.204437, 0.2046831, -1.791071, 1, 0.5686275, 0, 1,
-1.203194, 0.3544875, -2.650414, 1, 0.5764706, 0, 1,
-1.196053, 0.3402419, -0.02350769, 1, 0.5803922, 0, 1,
-1.194453, 1.756235, -1.750459, 1, 0.5882353, 0, 1,
-1.184747, -1.198073, -3.188163, 1, 0.5921569, 0, 1,
-1.177001, -0.01432368, -1.355492, 1, 0.6, 0, 1,
-1.172917, -1.560394, -1.836831, 1, 0.6078432, 0, 1,
-1.172581, -0.6110796, -3.636811, 1, 0.6117647, 0, 1,
-1.162026, -0.2941192, -0.5782847, 1, 0.6196079, 0, 1,
-1.161559, -0.3015214, 0.3887691, 1, 0.6235294, 0, 1,
-1.161114, 0.07982303, -1.689642, 1, 0.6313726, 0, 1,
-1.141309, 0.5625975, -0.7688307, 1, 0.6352941, 0, 1,
-1.139567, -0.9633116, -2.520823, 1, 0.6431373, 0, 1,
-1.138156, 0.155173, -1.48219, 1, 0.6470588, 0, 1,
-1.135746, -1.335819, -2.609168, 1, 0.654902, 0, 1,
-1.133412, -0.8595811, -2.849118, 1, 0.6588235, 0, 1,
-1.128978, 0.1242742, 0.1715168, 1, 0.6666667, 0, 1,
-1.123395, 0.8486069, -1.536462, 1, 0.6705883, 0, 1,
-1.122658, -0.971121, -2.918664, 1, 0.6784314, 0, 1,
-1.119646, -0.07675488, -0.2775936, 1, 0.682353, 0, 1,
-1.112942, 0.08851002, -2.081455, 1, 0.6901961, 0, 1,
-1.101701, -1.61175, -1.824045, 1, 0.6941177, 0, 1,
-1.100658, 0.05993948, 0.274253, 1, 0.7019608, 0, 1,
-1.089878, 0.1502803, -2.9035, 1, 0.7098039, 0, 1,
-1.082655, -0.5354002, -2.646133, 1, 0.7137255, 0, 1,
-1.078787, -0.7876582, -2.739393, 1, 0.7215686, 0, 1,
-1.078364, 0.6251962, -2.245004, 1, 0.7254902, 0, 1,
-1.076519, 0.266717, -2.127807, 1, 0.7333333, 0, 1,
-1.069129, 0.4358531, -0.7960268, 1, 0.7372549, 0, 1,
-1.066117, 1.955924, -2.704492, 1, 0.7450981, 0, 1,
-1.061399, 0.2853641, -0.6821294, 1, 0.7490196, 0, 1,
-1.059502, 0.3070951, -2.063004, 1, 0.7568628, 0, 1,
-1.056435, 1.885955, 0.3949046, 1, 0.7607843, 0, 1,
-1.055963, -0.05543479, -0.115374, 1, 0.7686275, 0, 1,
-1.053832, 1.055667, -0.7660093, 1, 0.772549, 0, 1,
-1.052628, 0.8032834, 0.3982602, 1, 0.7803922, 0, 1,
-1.047792, 0.6779171, -2.387276, 1, 0.7843137, 0, 1,
-1.044611, 0.01929281, -1.757123, 1, 0.7921569, 0, 1,
-1.044581, -0.8394411, -3.414787, 1, 0.7960784, 0, 1,
-1.044165, -0.2131307, -1.552796, 1, 0.8039216, 0, 1,
-1.043407, 1.116339, -0.6876277, 1, 0.8117647, 0, 1,
-1.043343, -0.04683358, -1.209604, 1, 0.8156863, 0, 1,
-1.036598, 0.3210184, -1.003992, 1, 0.8235294, 0, 1,
-1.033358, -0.3372546, -1.309894, 1, 0.827451, 0, 1,
-1.032446, 1.011475, -2.463007, 1, 0.8352941, 0, 1,
-1.017467, 0.1195585, 0.2052393, 1, 0.8392157, 0, 1,
-1.013566, 0.4870584, -0.6270594, 1, 0.8470588, 0, 1,
-1.010775, 1.507572, -1.447029, 1, 0.8509804, 0, 1,
-1.000683, 0.2755345, -2.493125, 1, 0.8588235, 0, 1,
-1.000116, 1.163576, 0.261797, 1, 0.8627451, 0, 1,
-0.9968641, -0.6867224, -2.580443, 1, 0.8705882, 0, 1,
-0.9915119, -1.370683, -3.516808, 1, 0.8745098, 0, 1,
-0.9865204, 0.7877777, -0.3508008, 1, 0.8823529, 0, 1,
-0.9858078, -0.4349842, -1.963871, 1, 0.8862745, 0, 1,
-0.985237, 0.9384835, -1.799068, 1, 0.8941177, 0, 1,
-0.9838426, -1.163973, -4.482217, 1, 0.8980392, 0, 1,
-0.9811468, -1.632819, -3.761344, 1, 0.9058824, 0, 1,
-0.9661259, 0.8142094, -0.9778146, 1, 0.9137255, 0, 1,
-0.961553, -0.2084551, -2.445957, 1, 0.9176471, 0, 1,
-0.952225, -2.256009, -4.500398, 1, 0.9254902, 0, 1,
-0.9466091, 1.113284, -1.880659, 1, 0.9294118, 0, 1,
-0.9294574, 1.158265, 0.2571687, 1, 0.9372549, 0, 1,
-0.9289601, -0.7736596, -2.68655, 1, 0.9411765, 0, 1,
-0.9272161, -0.5540028, -1.59874, 1, 0.9490196, 0, 1,
-0.9258652, 0.3188333, -1.768994, 1, 0.9529412, 0, 1,
-0.9225551, -0.9265203, -3.124457, 1, 0.9607843, 0, 1,
-0.9221051, -0.6825489, -4.589211, 1, 0.9647059, 0, 1,
-0.9169782, -1.614229, -1.203251, 1, 0.972549, 0, 1,
-0.9134554, -0.06069034, -1.595933, 1, 0.9764706, 0, 1,
-0.9124609, -0.501049, -0.8950763, 1, 0.9843137, 0, 1,
-0.9103847, -0.6096401, -3.103604, 1, 0.9882353, 0, 1,
-0.9008389, 1.810338, -0.3975679, 1, 0.9960784, 0, 1,
-0.9004111, 0.4338474, -1.590154, 0.9960784, 1, 0, 1,
-0.8860032, -0.06437682, -2.792523, 0.9921569, 1, 0, 1,
-0.8838505, -0.05356153, -0.4604275, 0.9843137, 1, 0, 1,
-0.8816685, 0.1776625, -1.631109, 0.9803922, 1, 0, 1,
-0.8753768, 0.05306027, 0.7361723, 0.972549, 1, 0, 1,
-0.8640331, -0.4728598, -2.308473, 0.9686275, 1, 0, 1,
-0.8518376, 0.2897807, 0.2060036, 0.9607843, 1, 0, 1,
-0.8500359, -1.587852, -2.256918, 0.9568627, 1, 0, 1,
-0.8443427, -0.1077968, -2.829635, 0.9490196, 1, 0, 1,
-0.8344542, -0.6913218, -3.878139, 0.945098, 1, 0, 1,
-0.8307745, 1.357136, -2.184472, 0.9372549, 1, 0, 1,
-0.8291128, 1.305443, -0.3877259, 0.9333333, 1, 0, 1,
-0.8263659, 0.2060537, -1.504499, 0.9254902, 1, 0, 1,
-0.815208, -0.7769937, -3.181993, 0.9215686, 1, 0, 1,
-0.809495, -0.5395954, -2.151294, 0.9137255, 1, 0, 1,
-0.8080465, 0.002672881, -2.858819, 0.9098039, 1, 0, 1,
-0.8079473, 1.389743, 0.9550011, 0.9019608, 1, 0, 1,
-0.8072251, -0.6393349, -3.162311, 0.8941177, 1, 0, 1,
-0.804913, 0.3473833, 0.05126885, 0.8901961, 1, 0, 1,
-0.8033515, 0.330691, -2.763742, 0.8823529, 1, 0, 1,
-0.7992682, 0.3609082, -0.5467812, 0.8784314, 1, 0, 1,
-0.7930481, -0.4272442, -2.930601, 0.8705882, 1, 0, 1,
-0.7908484, -1.179298, -3.350777, 0.8666667, 1, 0, 1,
-0.7859233, 0.3552117, -1.274235, 0.8588235, 1, 0, 1,
-0.7841762, 0.02883632, -2.245376, 0.854902, 1, 0, 1,
-0.771952, 0.09855364, -2.289432, 0.8470588, 1, 0, 1,
-0.7711679, 0.8953351, 0.3500801, 0.8431373, 1, 0, 1,
-0.770205, -0.7479247, -3.496642, 0.8352941, 1, 0, 1,
-0.7689888, 1.549551, 1.388286, 0.8313726, 1, 0, 1,
-0.7677034, -0.3502711, -1.504611, 0.8235294, 1, 0, 1,
-0.7594272, -0.3002093, -1.011297, 0.8196079, 1, 0, 1,
-0.7574795, -1.454415, -5.027971, 0.8117647, 1, 0, 1,
-0.7568261, -0.4662603, -2.394861, 0.8078431, 1, 0, 1,
-0.7548958, -1.821747, -1.808051, 0.8, 1, 0, 1,
-0.7535897, 1.045936, -2.154679, 0.7921569, 1, 0, 1,
-0.7534387, 0.490721, -0.8363466, 0.7882353, 1, 0, 1,
-0.7527008, 0.3017717, -0.4695677, 0.7803922, 1, 0, 1,
-0.7506674, -1.043238, -6.086078, 0.7764706, 1, 0, 1,
-0.7437979, 0.02205696, -1.471591, 0.7686275, 1, 0, 1,
-0.7409665, 1.607421, -1.211489, 0.7647059, 1, 0, 1,
-0.7406699, -1.31335, -2.677057, 0.7568628, 1, 0, 1,
-0.7306412, -0.7566222, -1.796342, 0.7529412, 1, 0, 1,
-0.7283905, 1.28794, -0.7032831, 0.7450981, 1, 0, 1,
-0.7278416, -0.5544596, -2.685406, 0.7411765, 1, 0, 1,
-0.7259088, 0.3779286, -0.2908168, 0.7333333, 1, 0, 1,
-0.7226773, 1.059295, 0.3612561, 0.7294118, 1, 0, 1,
-0.7223032, 0.4845547, -3.244003, 0.7215686, 1, 0, 1,
-0.72124, 0.455494, -3.148586, 0.7176471, 1, 0, 1,
-0.7162587, -2.333615, -3.593549, 0.7098039, 1, 0, 1,
-0.7146819, -0.2586087, -2.113261, 0.7058824, 1, 0, 1,
-0.714521, -1.222029, -1.911515, 0.6980392, 1, 0, 1,
-0.7141524, 1.758776, -0.8362151, 0.6901961, 1, 0, 1,
-0.7092201, -0.260087, -2.245949, 0.6862745, 1, 0, 1,
-0.7068377, -0.5894739, -1.264967, 0.6784314, 1, 0, 1,
-0.7068316, -0.6085938, -1.257085, 0.6745098, 1, 0, 1,
-0.7051864, -2.291138, -3.329952, 0.6666667, 1, 0, 1,
-0.7042981, -2.63384, -2.730429, 0.6627451, 1, 0, 1,
-0.7036398, 1.303884, -0.7453511, 0.654902, 1, 0, 1,
-0.7007523, -0.05722674, -0.6622166, 0.6509804, 1, 0, 1,
-0.6952031, 0.6628137, -2.509512, 0.6431373, 1, 0, 1,
-0.6907936, -0.3576514, -2.135832, 0.6392157, 1, 0, 1,
-0.6872894, -0.008605199, -2.565925, 0.6313726, 1, 0, 1,
-0.6844046, -1.663644, -2.993007, 0.627451, 1, 0, 1,
-0.6843076, -0.5590544, -4.716536, 0.6196079, 1, 0, 1,
-0.6843054, -0.05349448, -2.232063, 0.6156863, 1, 0, 1,
-0.6809888, 0.322744, 0.3137669, 0.6078432, 1, 0, 1,
-0.6803546, -1.330409, -2.819103, 0.6039216, 1, 0, 1,
-0.6705604, 0.8850217, 1.237981, 0.5960785, 1, 0, 1,
-0.6652356, 1.491806, -2.461298, 0.5882353, 1, 0, 1,
-0.6612039, -0.4809926, -1.904755, 0.5843138, 1, 0, 1,
-0.6561717, -2.422969, -1.977065, 0.5764706, 1, 0, 1,
-0.6515877, 0.3316258, -1.508644, 0.572549, 1, 0, 1,
-0.6472157, 0.4910887, -0.6287901, 0.5647059, 1, 0, 1,
-0.6465333, 0.2602239, -3.062681, 0.5607843, 1, 0, 1,
-0.6460187, -0.2254041, -3.551216, 0.5529412, 1, 0, 1,
-0.6449278, -0.935199, -1.32476, 0.5490196, 1, 0, 1,
-0.6393265, -0.7156681, -4.094918, 0.5411765, 1, 0, 1,
-0.6340116, 0.2071524, -1.668387, 0.5372549, 1, 0, 1,
-0.6317371, -0.4786003, -2.145803, 0.5294118, 1, 0, 1,
-0.6235219, -0.594937, -3.022322, 0.5254902, 1, 0, 1,
-0.6217813, 0.2979836, -0.5202971, 0.5176471, 1, 0, 1,
-0.6192783, -0.9664034, -3.534567, 0.5137255, 1, 0, 1,
-0.6167432, 0.1104478, 2.641352, 0.5058824, 1, 0, 1,
-0.6152849, -0.5151082, -3.286897, 0.5019608, 1, 0, 1,
-0.6143166, -0.737098, -1.177058, 0.4941176, 1, 0, 1,
-0.609841, 0.6116366, -0.104243, 0.4862745, 1, 0, 1,
-0.6063855, 0.6926352, -0.6786368, 0.4823529, 1, 0, 1,
-0.6040145, -0.3875483, -3.373827, 0.4745098, 1, 0, 1,
-0.6024509, 0.5723047, 0.3381607, 0.4705882, 1, 0, 1,
-0.598038, 0.5274103, -1.886176, 0.4627451, 1, 0, 1,
-0.5951547, -0.9207963, -3.189675, 0.4588235, 1, 0, 1,
-0.5840929, -0.2686494, -3.820514, 0.4509804, 1, 0, 1,
-0.5818566, -0.6294776, -2.895726, 0.4470588, 1, 0, 1,
-0.580754, -0.4572323, -2.980261, 0.4392157, 1, 0, 1,
-0.5744405, 0.6741408, -2.135987, 0.4352941, 1, 0, 1,
-0.5707978, 1.187108, -0.2967992, 0.427451, 1, 0, 1,
-0.5677536, 0.006781772, -1.097686, 0.4235294, 1, 0, 1,
-0.5656515, 0.2320704, -1.951599, 0.4156863, 1, 0, 1,
-0.5647607, 0.413108, 0.7662444, 0.4117647, 1, 0, 1,
-0.5642467, -0.8017563, -3.201782, 0.4039216, 1, 0, 1,
-0.5625181, 0.8997703, -0.4750517, 0.3960784, 1, 0, 1,
-0.5616956, -0.09586284, -1.933549, 0.3921569, 1, 0, 1,
-0.5602191, -1.303097, -3.810994, 0.3843137, 1, 0, 1,
-0.5577569, 1.01611, -2.533979, 0.3803922, 1, 0, 1,
-0.5576894, 2.037521, -0.3334886, 0.372549, 1, 0, 1,
-0.5558704, 0.2107399, -2.256124, 0.3686275, 1, 0, 1,
-0.5458543, 0.201767, -1.041866, 0.3607843, 1, 0, 1,
-0.5419214, -0.2948108, -1.39337, 0.3568628, 1, 0, 1,
-0.5403222, 0.5043536, -1.511699, 0.3490196, 1, 0, 1,
-0.5378368, 0.5029281, -0.7877313, 0.345098, 1, 0, 1,
-0.5375415, -0.204726, -2.35142, 0.3372549, 1, 0, 1,
-0.537532, -1.727655, -1.844167, 0.3333333, 1, 0, 1,
-0.5356998, -0.3560089, -1.113866, 0.3254902, 1, 0, 1,
-0.5353354, 0.4260852, -2.350738, 0.3215686, 1, 0, 1,
-0.5339538, -1.534888, -3.21253, 0.3137255, 1, 0, 1,
-0.5332701, 0.4121747, 0.3071196, 0.3098039, 1, 0, 1,
-0.5294408, -1.026773, -1.230541, 0.3019608, 1, 0, 1,
-0.5243184, -0.4625022, -2.644954, 0.2941177, 1, 0, 1,
-0.5242719, 0.1356683, 0.1913284, 0.2901961, 1, 0, 1,
-0.5225372, 1.66109, -2.648537, 0.282353, 1, 0, 1,
-0.5167285, -1.469504, -2.753523, 0.2784314, 1, 0, 1,
-0.5165014, -0.6394429, -0.8049663, 0.2705882, 1, 0, 1,
-0.5089249, 0.4542278, -0.9174756, 0.2666667, 1, 0, 1,
-0.5085206, 0.9088174, -1.378513, 0.2588235, 1, 0, 1,
-0.5014892, 2.26802, 2.550939, 0.254902, 1, 0, 1,
-0.5007766, -0.2154004, -0.5680761, 0.2470588, 1, 0, 1,
-0.5007524, 0.170546, -0.413711, 0.2431373, 1, 0, 1,
-0.4980975, 0.6546231, 0.3832549, 0.2352941, 1, 0, 1,
-0.4965956, -0.1196025, -3.021879, 0.2313726, 1, 0, 1,
-0.489348, -1.396405, -3.999185, 0.2235294, 1, 0, 1,
-0.4871112, -0.6734945, -2.747233, 0.2196078, 1, 0, 1,
-0.4749527, 0.3276879, -0.1317694, 0.2117647, 1, 0, 1,
-0.4744637, 0.1494355, -2.156272, 0.2078431, 1, 0, 1,
-0.4734038, -0.4061641, -3.03548, 0.2, 1, 0, 1,
-0.4687796, -1.738376, -2.500139, 0.1921569, 1, 0, 1,
-0.468382, 0.7766992, -0.4080106, 0.1882353, 1, 0, 1,
-0.4630532, -0.5233179, -2.754296, 0.1803922, 1, 0, 1,
-0.462287, -0.8278901, -2.514109, 0.1764706, 1, 0, 1,
-0.4614876, -0.2217854, -1.260717, 0.1686275, 1, 0, 1,
-0.4595139, 0.5829116, -0.4808629, 0.1647059, 1, 0, 1,
-0.4556369, -0.4561193, -3.548285, 0.1568628, 1, 0, 1,
-0.4539936, -0.6734214, -2.903875, 0.1529412, 1, 0, 1,
-0.452637, 0.5595109, -0.4641737, 0.145098, 1, 0, 1,
-0.4454643, -1.161634, -3.889884, 0.1411765, 1, 0, 1,
-0.4436236, -1.219509, -2.618134, 0.1333333, 1, 0, 1,
-0.442418, 0.4329574, -1.030558, 0.1294118, 1, 0, 1,
-0.4416366, 0.9952209, -0.845086, 0.1215686, 1, 0, 1,
-0.4363912, 0.6945385, -1.842224, 0.1176471, 1, 0, 1,
-0.4360961, -0.258394, -3.107672, 0.1098039, 1, 0, 1,
-0.4271015, 0.2730848, -0.8327345, 0.1058824, 1, 0, 1,
-0.4223702, -0.8313271, -0.8307726, 0.09803922, 1, 0, 1,
-0.4216937, 0.4146569, -2.37464, 0.09019608, 1, 0, 1,
-0.4209631, 0.2921132, -0.9330189, 0.08627451, 1, 0, 1,
-0.4195795, -0.2273696, -1.322706, 0.07843138, 1, 0, 1,
-0.4139176, -0.8382847, -3.479071, 0.07450981, 1, 0, 1,
-0.4111961, -0.1439675, -2.041611, 0.06666667, 1, 0, 1,
-0.4073227, 0.1769898, -0.6055278, 0.0627451, 1, 0, 1,
-0.4066848, -0.8258566, -1.666381, 0.05490196, 1, 0, 1,
-0.4038801, -0.4782949, -2.443084, 0.05098039, 1, 0, 1,
-0.3965924, 2.016041, -0.01283836, 0.04313726, 1, 0, 1,
-0.3916867, 0.6023474, -1.25598, 0.03921569, 1, 0, 1,
-0.3883075, -1.150489, -3.229169, 0.03137255, 1, 0, 1,
-0.3872955, -0.4003646, -2.746902, 0.02745098, 1, 0, 1,
-0.3847181, 1.148198, -0.03682859, 0.01960784, 1, 0, 1,
-0.3832839, 0.5147738, -1.414241, 0.01568628, 1, 0, 1,
-0.3832272, 0.4734714, -2.757801, 0.007843138, 1, 0, 1,
-0.3810419, 0.2012201, -0.5007395, 0.003921569, 1, 0, 1,
-0.3790993, -0.9540288, -2.600464, 0, 1, 0.003921569, 1,
-0.3772088, 1.764419, -0.7556414, 0, 1, 0.01176471, 1,
-0.3764391, -1.21196, -3.867015, 0, 1, 0.01568628, 1,
-0.3724207, 0.4269559, 0.8608958, 0, 1, 0.02352941, 1,
-0.3694327, 1.048573, 0.3268509, 0, 1, 0.02745098, 1,
-0.3648839, -1.055717, -2.716976, 0, 1, 0.03529412, 1,
-0.3624431, -0.2530458, -1.163177, 0, 1, 0.03921569, 1,
-0.3516406, 0.394495, -2.064245, 0, 1, 0.04705882, 1,
-0.3480485, 0.5437963, -0.686992, 0, 1, 0.05098039, 1,
-0.3468601, 0.007496991, -3.225739, 0, 1, 0.05882353, 1,
-0.3417113, -1.4932, -3.760906, 0, 1, 0.0627451, 1,
-0.3388296, 0.6675678, 0.5081359, 0, 1, 0.07058824, 1,
-0.3373659, -0.9168212, -2.64744, 0, 1, 0.07450981, 1,
-0.3373273, -0.3656645, -1.451034, 0, 1, 0.08235294, 1,
-0.3319314, -0.01014367, -2.15767, 0, 1, 0.08627451, 1,
-0.3282861, -1.252172, -3.402827, 0, 1, 0.09411765, 1,
-0.3278356, 1.053967, -0.9244078, 0, 1, 0.1019608, 1,
-0.3269537, 1.556394, 0.05606389, 0, 1, 0.1058824, 1,
-0.3116655, 0.6055528, -0.6902593, 0, 1, 0.1137255, 1,
-0.3086194, -0.03895802, -3.620156, 0, 1, 0.1176471, 1,
-0.3075691, -1.491855, -2.1393, 0, 1, 0.1254902, 1,
-0.3053355, -0.3304807, -1.273652, 0, 1, 0.1294118, 1,
-0.3038818, -0.7473738, -2.341422, 0, 1, 0.1372549, 1,
-0.3038659, 2.148494, 0.4606126, 0, 1, 0.1411765, 1,
-0.3020297, 0.2600034, -1.970021, 0, 1, 0.1490196, 1,
-0.2923056, 0.2392026, 0.8287557, 0, 1, 0.1529412, 1,
-0.2895702, -0.3684195, -2.86276, 0, 1, 0.1607843, 1,
-0.2878492, -0.3173253, -1.225444, 0, 1, 0.1647059, 1,
-0.2859283, -1.164241, -3.215692, 0, 1, 0.172549, 1,
-0.2828371, 0.0830506, 0.09076206, 0, 1, 0.1764706, 1,
-0.2823854, 1.638717, -0.1489499, 0, 1, 0.1843137, 1,
-0.2735414, 0.08733375, -1.194173, 0, 1, 0.1882353, 1,
-0.2723454, -0.09904596, -1.3311, 0, 1, 0.1960784, 1,
-0.2713447, -1.567434, -3.535213, 0, 1, 0.2039216, 1,
-0.2620281, -1.645483, -2.512705, 0, 1, 0.2078431, 1,
-0.2591609, 0.1865527, -0.05879661, 0, 1, 0.2156863, 1,
-0.2540514, 0.05224991, -2.587855, 0, 1, 0.2196078, 1,
-0.253601, -0.1785142, -1.193396, 0, 1, 0.227451, 1,
-0.2462765, 0.7623342, 1.040888, 0, 1, 0.2313726, 1,
-0.2455888, 1.154957, -0.1768982, 0, 1, 0.2392157, 1,
-0.2435432, -0.7728295, -0.4727023, 0, 1, 0.2431373, 1,
-0.2391327, -0.05347119, -2.434251, 0, 1, 0.2509804, 1,
-0.2387803, -0.7514243, -0.7859726, 0, 1, 0.254902, 1,
-0.2378578, 0.3298837, -2.571658, 0, 1, 0.2627451, 1,
-0.2348102, 1.884693, 1.280362, 0, 1, 0.2666667, 1,
-0.2331953, 1.699188, 0.2829258, 0, 1, 0.2745098, 1,
-0.2290692, -1.740259, -4.249247, 0, 1, 0.2784314, 1,
-0.2287687, -0.06639546, -2.116474, 0, 1, 0.2862745, 1,
-0.2256311, 0.3116381, -0.3502823, 0, 1, 0.2901961, 1,
-0.2256244, 0.4063926, 1.037225, 0, 1, 0.2980392, 1,
-0.223537, -1.614247, -3.25494, 0, 1, 0.3058824, 1,
-0.220202, 0.6316011, 0.9981543, 0, 1, 0.3098039, 1,
-0.2170219, 0.8321388, -0.7414589, 0, 1, 0.3176471, 1,
-0.2145701, -0.1642213, -1.158932, 0, 1, 0.3215686, 1,
-0.2139112, 0.09067485, -1.533294, 0, 1, 0.3294118, 1,
-0.2118807, -1.02879, -4.268957, 0, 1, 0.3333333, 1,
-0.2118744, -0.7736613, -2.951378, 0, 1, 0.3411765, 1,
-0.2029849, -0.2767562, -2.816303, 0, 1, 0.345098, 1,
-0.1993414, -0.8652962, -3.54153, 0, 1, 0.3529412, 1,
-0.1952126, 0.7041891, 1.56631, 0, 1, 0.3568628, 1,
-0.1938403, 0.08645318, -1.018104, 0, 1, 0.3647059, 1,
-0.1931024, -0.1971162, -1.527562, 0, 1, 0.3686275, 1,
-0.1929965, -0.8877581, -2.131863, 0, 1, 0.3764706, 1,
-0.1835922, 1.664382, 1.255296, 0, 1, 0.3803922, 1,
-0.1817288, 1.060158, -0.4078262, 0, 1, 0.3882353, 1,
-0.1765954, 0.4283972, -1.553301, 0, 1, 0.3921569, 1,
-0.1762029, -1.097341, -2.781232, 0, 1, 0.4, 1,
-0.1723125, 1.07822, -1.122493, 0, 1, 0.4078431, 1,
-0.1695762, 0.4685968, -0.0454007, 0, 1, 0.4117647, 1,
-0.1668555, -1.378676, -2.293958, 0, 1, 0.4196078, 1,
-0.1636981, -1.450588, -3.666543, 0, 1, 0.4235294, 1,
-0.1601432, -1.556952, -1.969423, 0, 1, 0.4313726, 1,
-0.1583588, -0.3033081, -4.037092, 0, 1, 0.4352941, 1,
-0.157542, -0.1672302, -2.707938, 0, 1, 0.4431373, 1,
-0.1557219, 0.9909219, 0.7022759, 0, 1, 0.4470588, 1,
-0.1553262, 0.3322518, 0.392552, 0, 1, 0.454902, 1,
-0.1551635, 0.3232464, -0.5590692, 0, 1, 0.4588235, 1,
-0.1534716, -1.725811, -2.140232, 0, 1, 0.4666667, 1,
-0.1511427, 0.01007367, -1.541148, 0, 1, 0.4705882, 1,
-0.1507761, -0.8335523, -2.242332, 0, 1, 0.4784314, 1,
-0.1474244, -0.05475819, -2.280154, 0, 1, 0.4823529, 1,
-0.1466704, 0.6239223, -0.6774927, 0, 1, 0.4901961, 1,
-0.1433155, 0.7393762, -0.4060588, 0, 1, 0.4941176, 1,
-0.1429283, 0.04533263, -1.008348, 0, 1, 0.5019608, 1,
-0.1398356, 0.9301811, -0.6120677, 0, 1, 0.509804, 1,
-0.1383751, 0.3317226, -1.514209, 0, 1, 0.5137255, 1,
-0.1377137, -0.892514, -2.340687, 0, 1, 0.5215687, 1,
-0.1370142, -1.882971, -2.31032, 0, 1, 0.5254902, 1,
-0.1366913, -1.431497, -4.571354, 0, 1, 0.5333334, 1,
-0.1365847, 0.8149174, -0.7385419, 0, 1, 0.5372549, 1,
-0.1360637, -0.9021945, -2.633974, 0, 1, 0.5450981, 1,
-0.1360629, -0.1125086, -2.126462, 0, 1, 0.5490196, 1,
-0.1350837, 0.06753808, -1.585772, 0, 1, 0.5568628, 1,
-0.1346431, 1.739203, 0.1539681, 0, 1, 0.5607843, 1,
-0.1341775, 0.8818547, 0.7466587, 0, 1, 0.5686275, 1,
-0.1335566, 0.4050637, 0.2890256, 0, 1, 0.572549, 1,
-0.1227645, 0.2558329, 0.6165989, 0, 1, 0.5803922, 1,
-0.1208556, 1.35766, 0.600583, 0, 1, 0.5843138, 1,
-0.1205645, -0.8189827, -3.212387, 0, 1, 0.5921569, 1,
-0.1178244, -1.115963, -2.384112, 0, 1, 0.5960785, 1,
-0.106311, 0.7273559, -1.486459, 0, 1, 0.6039216, 1,
-0.1058895, 0.290749, -2.013681, 0, 1, 0.6117647, 1,
-0.1028363, 1.885724, -0.834014, 0, 1, 0.6156863, 1,
-0.1017432, -1.348628, -2.791921, 0, 1, 0.6235294, 1,
-0.1008737, -1.059438, -0.7889866, 0, 1, 0.627451, 1,
-0.09978124, -1.011803, -2.193514, 0, 1, 0.6352941, 1,
-0.09832798, 0.4049785, -0.1457331, 0, 1, 0.6392157, 1,
-0.09269144, 0.618309, -1.353572, 0, 1, 0.6470588, 1,
-0.08835509, 1.076235, -0.3023101, 0, 1, 0.6509804, 1,
-0.08575316, -0.223191, -2.337807, 0, 1, 0.6588235, 1,
-0.08381813, -0.5179144, -3.640498, 0, 1, 0.6627451, 1,
-0.0813013, -0.8412843, -3.46583, 0, 1, 0.6705883, 1,
-0.07956692, -0.133855, -2.827177, 0, 1, 0.6745098, 1,
-0.07713496, -1.228147, -4.227009, 0, 1, 0.682353, 1,
-0.0770072, 0.2635696, -0.9781229, 0, 1, 0.6862745, 1,
-0.07619466, -1.563, -3.49188, 0, 1, 0.6941177, 1,
-0.07365847, 2.146907, -0.1354914, 0, 1, 0.7019608, 1,
-0.0732824, 0.2248615, -1.840253, 0, 1, 0.7058824, 1,
-0.07319722, 1.76488, -2.160306, 0, 1, 0.7137255, 1,
-0.06863395, 1.837849, -0.8177797, 0, 1, 0.7176471, 1,
-0.0590204, 0.8735676, 0.3058877, 0, 1, 0.7254902, 1,
-0.05492155, -1.254894, -4.230752, 0, 1, 0.7294118, 1,
-0.05231772, 0.9486727, -1.234541, 0, 1, 0.7372549, 1,
-0.04908791, 0.7321101, -1.898126, 0, 1, 0.7411765, 1,
-0.04849644, 1.55267, -1.996557, 0, 1, 0.7490196, 1,
-0.04541538, -1.43912, -1.09325, 0, 1, 0.7529412, 1,
-0.04188077, 0.01451102, -2.47424, 0, 1, 0.7607843, 1,
-0.0260279, 1.092938, -0.973166, 0, 1, 0.7647059, 1,
-0.02356605, 0.0545816, -1.064497, 0, 1, 0.772549, 1,
-0.02184731, 0.2483734, -1.457377, 0, 1, 0.7764706, 1,
-0.01641852, 0.1899248, 1.49305, 0, 1, 0.7843137, 1,
-0.0134861, -0.4728357, -4.831924, 0, 1, 0.7882353, 1,
-0.01151122, -0.8793558, -4.412735, 0, 1, 0.7960784, 1,
-0.007745529, 0.5449945, -0.1588126, 0, 1, 0.8039216, 1,
-0.004415498, 0.8450781, 0.7710655, 0, 1, 0.8078431, 1,
-0.0002269437, 1.093043, 0.258681, 0, 1, 0.8156863, 1,
0.005007819, 0.2921709, -0.9608111, 0, 1, 0.8196079, 1,
0.00685555, -0.7728765, 2.253094, 0, 1, 0.827451, 1,
0.008767924, 0.510592, -0.8929058, 0, 1, 0.8313726, 1,
0.02091656, 0.05060331, -2.110525, 0, 1, 0.8392157, 1,
0.02763208, -0.3295659, 3.614352, 0, 1, 0.8431373, 1,
0.02858682, 1.408358, 1.747771, 0, 1, 0.8509804, 1,
0.03484325, -0.5454435, 2.490936, 0, 1, 0.854902, 1,
0.03503778, 0.3263678, 0.6690423, 0, 1, 0.8627451, 1,
0.03524707, -0.5429971, 2.73319, 0, 1, 0.8666667, 1,
0.03542989, -0.414436, 3.047858, 0, 1, 0.8745098, 1,
0.03963808, -0.4236734, 3.416986, 0, 1, 0.8784314, 1,
0.040654, 0.8177872, -0.5662818, 0, 1, 0.8862745, 1,
0.04193069, 0.6827416, -0.3945496, 0, 1, 0.8901961, 1,
0.04251937, 0.3611921, 2.633749, 0, 1, 0.8980392, 1,
0.0500662, -0.5259284, 2.731558, 0, 1, 0.9058824, 1,
0.05113091, -0.4126888, 4.50282, 0, 1, 0.9098039, 1,
0.05783673, 0.4964663, 0.1167804, 0, 1, 0.9176471, 1,
0.06173598, 0.735741, 0.3439694, 0, 1, 0.9215686, 1,
0.06411068, -0.870231, 2.6935, 0, 1, 0.9294118, 1,
0.06876501, 0.1646359, 1.143898, 0, 1, 0.9333333, 1,
0.07161368, 1.34224, 0.0196285, 0, 1, 0.9411765, 1,
0.07167621, -0.3320663, 3.543096, 0, 1, 0.945098, 1,
0.07174128, 0.4225973, -0.7338851, 0, 1, 0.9529412, 1,
0.07183022, 0.4221393, 0.9683136, 0, 1, 0.9568627, 1,
0.07396254, 2.41546, 0.8351715, 0, 1, 0.9647059, 1,
0.0741377, 0.07705294, -0.2212427, 0, 1, 0.9686275, 1,
0.07422671, 1.32835, -2.036666, 0, 1, 0.9764706, 1,
0.07894253, -0.891611, 2.099109, 0, 1, 0.9803922, 1,
0.07963654, 0.05056268, 1.89291, 0, 1, 0.9882353, 1,
0.08002209, 0.03432121, 1.468025, 0, 1, 0.9921569, 1,
0.08091537, 0.5149766, -0.8312705, 0, 1, 1, 1,
0.08226275, 0.8942078, -0.7358509, 0, 0.9921569, 1, 1,
0.08287205, -1.181348, 2.846427, 0, 0.9882353, 1, 1,
0.09051012, -0.7521936, 1.242716, 0, 0.9803922, 1, 1,
0.09267391, -0.3791187, 0.7544018, 0, 0.9764706, 1, 1,
0.09604836, 0.919006, 0.613687, 0, 0.9686275, 1, 1,
0.09621418, 1.052568, -0.4515294, 0, 0.9647059, 1, 1,
0.09772535, -1.305314, 2.34435, 0, 0.9568627, 1, 1,
0.1037141, -0.05543973, 2.396352, 0, 0.9529412, 1, 1,
0.1063274, -0.4833956, 1.485948, 0, 0.945098, 1, 1,
0.1070056, -0.1937135, 2.351338, 0, 0.9411765, 1, 1,
0.1078843, -1.057329, 1.743169, 0, 0.9333333, 1, 1,
0.1102028, 1.001565, -0.6179584, 0, 0.9294118, 1, 1,
0.112349, 0.8482875, -0.2554294, 0, 0.9215686, 1, 1,
0.1170565, 0.3911074, -0.4570728, 0, 0.9176471, 1, 1,
0.1196784, 1.188017, 0.29774, 0, 0.9098039, 1, 1,
0.1268422, 0.8374465, 0.9691098, 0, 0.9058824, 1, 1,
0.1295146, -0.5035801, 2.329538, 0, 0.8980392, 1, 1,
0.1299224, 0.6577846, 0.0593579, 0, 0.8901961, 1, 1,
0.1304562, -1.748984, 2.911521, 0, 0.8862745, 1, 1,
0.1310095, 0.1372184, 2.091491, 0, 0.8784314, 1, 1,
0.1312149, -0.08568939, 1.361232, 0, 0.8745098, 1, 1,
0.1333236, -0.7272056, 2.696122, 0, 0.8666667, 1, 1,
0.1347194, -0.3565182, 2.902758, 0, 0.8627451, 1, 1,
0.135754, 1.439749, 0.6505195, 0, 0.854902, 1, 1,
0.1357673, 0.4564646, -0.2131424, 0, 0.8509804, 1, 1,
0.1378429, -0.4282931, 2.320924, 0, 0.8431373, 1, 1,
0.1381999, -0.3537175, 6.331456, 0, 0.8392157, 1, 1,
0.1428023, -0.7850622, 3.187353, 0, 0.8313726, 1, 1,
0.1491398, 2.175239, -0.5185993, 0, 0.827451, 1, 1,
0.1492475, -0.1215685, 3.143509, 0, 0.8196079, 1, 1,
0.150841, -0.2170588, 1.201097, 0, 0.8156863, 1, 1,
0.1523049, -1.330786, 3.586943, 0, 0.8078431, 1, 1,
0.1551666, -0.9509319, 3.786419, 0, 0.8039216, 1, 1,
0.1555222, -0.2159271, 1.635047, 0, 0.7960784, 1, 1,
0.160363, 0.997399, -1.284505, 0, 0.7882353, 1, 1,
0.1611086, -0.02087273, 1.391682, 0, 0.7843137, 1, 1,
0.1621787, 0.5291029, -1.067955, 0, 0.7764706, 1, 1,
0.1648543, -0.5741358, 3.255444, 0, 0.772549, 1, 1,
0.1688209, -0.403716, 4.497404, 0, 0.7647059, 1, 1,
0.1710046, 1.722069, 1.147229, 0, 0.7607843, 1, 1,
0.1723454, -2.10671, 1.955892, 0, 0.7529412, 1, 1,
0.1746103, -0.03884283, 1.867561, 0, 0.7490196, 1, 1,
0.1759273, 1.744748, 0.6695489, 0, 0.7411765, 1, 1,
0.1770898, 0.3311506, -1.036241, 0, 0.7372549, 1, 1,
0.1783343, 0.08844487, 1.61087, 0, 0.7294118, 1, 1,
0.1783748, 1.006134, 0.04307402, 0, 0.7254902, 1, 1,
0.1795829, -0.2307083, 2.750864, 0, 0.7176471, 1, 1,
0.1796274, 0.5938879, 0.04586235, 0, 0.7137255, 1, 1,
0.1809689, 0.1274872, 1.98603, 0, 0.7058824, 1, 1,
0.1844922, 1.293406, 1.700445, 0, 0.6980392, 1, 1,
0.1873918, 0.9182249, 2.319725, 0, 0.6941177, 1, 1,
0.1890657, -0.6481452, 2.070714, 0, 0.6862745, 1, 1,
0.1914265, -2.503985, 1.762902, 0, 0.682353, 1, 1,
0.194814, 0.4938884, 1.850936, 0, 0.6745098, 1, 1,
0.2025109, -0.1165055, 2.49471, 0, 0.6705883, 1, 1,
0.2034004, -1.127931, 2.283073, 0, 0.6627451, 1, 1,
0.2174206, -1.31794, 2.463463, 0, 0.6588235, 1, 1,
0.2182519, -0.7895323, 3.638164, 0, 0.6509804, 1, 1,
0.2217901, -0.1879378, 2.716286, 0, 0.6470588, 1, 1,
0.2226356, -1.097927, 3.08899, 0, 0.6392157, 1, 1,
0.223393, -0.105808, 1.820113, 0, 0.6352941, 1, 1,
0.2241009, 0.3428787, -0.2455211, 0, 0.627451, 1, 1,
0.2312531, -0.1287351, -0.4083194, 0, 0.6235294, 1, 1,
0.2318511, 0.1848164, 0.7272363, 0, 0.6156863, 1, 1,
0.2339498, 0.9626187, -1.259665, 0, 0.6117647, 1, 1,
0.2346207, 0.05784388, 1.098223, 0, 0.6039216, 1, 1,
0.2414279, -0.471228, 2.893572, 0, 0.5960785, 1, 1,
0.2426959, 2.671538, 0.793148, 0, 0.5921569, 1, 1,
0.2450676, -0.04087097, 1.172907, 0, 0.5843138, 1, 1,
0.2452539, -1.982728, 1.278749, 0, 0.5803922, 1, 1,
0.2494061, -0.2394564, 1.783038, 0, 0.572549, 1, 1,
0.2523626, 1.450326, -0.9843973, 0, 0.5686275, 1, 1,
0.2539948, -1.040203, 4.527856, 0, 0.5607843, 1, 1,
0.2593495, 0.3153173, 1.89335, 0, 0.5568628, 1, 1,
0.2594208, -0.2441296, 2.776155, 0, 0.5490196, 1, 1,
0.2640482, -0.3967676, 2.436246, 0, 0.5450981, 1, 1,
0.2645719, -0.3131452, 1.944196, 0, 0.5372549, 1, 1,
0.265918, -0.7691925, 2.094203, 0, 0.5333334, 1, 1,
0.2700824, 2.1965, 0.1785955, 0, 0.5254902, 1, 1,
0.2719663, 0.02669636, 1.140374, 0, 0.5215687, 1, 1,
0.2742071, 1.697585, 1.41126, 0, 0.5137255, 1, 1,
0.2802998, -1.111724, 2.622632, 0, 0.509804, 1, 1,
0.2804627, -1.262934, 1.902229, 0, 0.5019608, 1, 1,
0.2813803, -0.5209348, 2.004541, 0, 0.4941176, 1, 1,
0.2850781, -0.3145871, 3.554951, 0, 0.4901961, 1, 1,
0.287425, 0.3505578, 1.688764, 0, 0.4823529, 1, 1,
0.2876849, -0.8494537, 3.542123, 0, 0.4784314, 1, 1,
0.2889455, 0.1191807, 0.484001, 0, 0.4705882, 1, 1,
0.2928723, 0.9090329, 0.9526283, 0, 0.4666667, 1, 1,
0.2956189, 0.1408912, 1.999204, 0, 0.4588235, 1, 1,
0.2967112, 0.2764498, 0.2643518, 0, 0.454902, 1, 1,
0.2983671, 1.36016, -0.5098768, 0, 0.4470588, 1, 1,
0.3020212, -1.106812, 2.634491, 0, 0.4431373, 1, 1,
0.3031411, 0.05486741, 0.4903882, 0, 0.4352941, 1, 1,
0.303598, 0.7504476, 1.367933, 0, 0.4313726, 1, 1,
0.3053279, 0.3216191, 0.895238, 0, 0.4235294, 1, 1,
0.3107898, -0.5052882, 1.544966, 0, 0.4196078, 1, 1,
0.3131328, -0.3294924, 2.820524, 0, 0.4117647, 1, 1,
0.3132561, 0.004127721, 2.098932, 0, 0.4078431, 1, 1,
0.3141724, -1.187196, 4.122624, 0, 0.4, 1, 1,
0.3143351, 0.3489193, 1.632157, 0, 0.3921569, 1, 1,
0.316011, 0.9836798, 0.2293552, 0, 0.3882353, 1, 1,
0.3176576, -1.078949, 1.778972, 0, 0.3803922, 1, 1,
0.3196552, 0.1280188, 1.456787, 0, 0.3764706, 1, 1,
0.3211384, 0.2243599, 0.1405896, 0, 0.3686275, 1, 1,
0.3211916, -2.828789, 3.269941, 0, 0.3647059, 1, 1,
0.3243986, -0.04614923, 1.002035, 0, 0.3568628, 1, 1,
0.3247761, -0.283704, 1.882112, 0, 0.3529412, 1, 1,
0.3274834, -0.4624649, 2.401695, 0, 0.345098, 1, 1,
0.3276587, -0.7064758, 3.28064, 0, 0.3411765, 1, 1,
0.328887, -0.2777247, 4.484289, 0, 0.3333333, 1, 1,
0.3310116, -0.3483936, 3.220472, 0, 0.3294118, 1, 1,
0.3326281, 2.694131, -0.1142107, 0, 0.3215686, 1, 1,
0.3352464, -0.2300456, 2.809741, 0, 0.3176471, 1, 1,
0.341837, 0.9931784, -1.088943, 0, 0.3098039, 1, 1,
0.3436761, 1.61571, -0.05999469, 0, 0.3058824, 1, 1,
0.3441424, -0.7041351, 3.965436, 0, 0.2980392, 1, 1,
0.3453436, 0.54659, -0.01820562, 0, 0.2901961, 1, 1,
0.3522167, 0.6688355, 0.1822741, 0, 0.2862745, 1, 1,
0.3530059, 0.8081437, -0.07409395, 0, 0.2784314, 1, 1,
0.3538504, -0.6455374, 2.080117, 0, 0.2745098, 1, 1,
0.3543262, 1.772937, 0.7725997, 0, 0.2666667, 1, 1,
0.365891, -0.0790749, 1.644942, 0, 0.2627451, 1, 1,
0.3668517, 1.556538, -0.03556341, 0, 0.254902, 1, 1,
0.368035, 1.790367, 1.456336, 0, 0.2509804, 1, 1,
0.3698648, 0.6929072, 0.332709, 0, 0.2431373, 1, 1,
0.3713691, -0.4649728, 3.713191, 0, 0.2392157, 1, 1,
0.3730437, -1.153803, 2.660576, 0, 0.2313726, 1, 1,
0.3805511, -0.6027265, 2.142298, 0, 0.227451, 1, 1,
0.3813039, 0.6518164, 1.61427, 0, 0.2196078, 1, 1,
0.3861278, -0.2662, 1.779634, 0, 0.2156863, 1, 1,
0.3873729, 0.9442428, -0.3021128, 0, 0.2078431, 1, 1,
0.3950932, -0.4157979, 2.697204, 0, 0.2039216, 1, 1,
0.3977424, -1.89205, 3.902881, 0, 0.1960784, 1, 1,
0.3988408, -0.6685342, 0.735697, 0, 0.1882353, 1, 1,
0.4013301, -0.5115929, 1.782557, 0, 0.1843137, 1, 1,
0.4020568, 1.301572, -0.05281218, 0, 0.1764706, 1, 1,
0.4078602, -0.7812296, 4.117448, 0, 0.172549, 1, 1,
0.4079443, -0.5211958, 2.025757, 0, 0.1647059, 1, 1,
0.4129625, -0.8553001, -0.1929607, 0, 0.1607843, 1, 1,
0.4168932, -1.257569, 4.935494, 0, 0.1529412, 1, 1,
0.4169217, -1.390937, 4.112856, 0, 0.1490196, 1, 1,
0.4183883, -0.2136836, 0.8612801, 0, 0.1411765, 1, 1,
0.424972, 0.3445583, 0.3315386, 0, 0.1372549, 1, 1,
0.4252196, 0.1122946, 1.89245, 0, 0.1294118, 1, 1,
0.4264958, -0.2575267, 1.218017, 0, 0.1254902, 1, 1,
0.4279981, 0.2968391, 2.759244, 0, 0.1176471, 1, 1,
0.4372254, 2.088269, -1.434519, 0, 0.1137255, 1, 1,
0.4416498, -0.2497461, 2.690848, 0, 0.1058824, 1, 1,
0.4428681, 0.5039505, 0.9880725, 0, 0.09803922, 1, 1,
0.4437599, 0.803715, 0.3507233, 0, 0.09411765, 1, 1,
0.4437732, 0.1205482, 0.9108194, 0, 0.08627451, 1, 1,
0.4441133, -1.21847, 2.099208, 0, 0.08235294, 1, 1,
0.4486066, -0.8843152, 3.80481, 0, 0.07450981, 1, 1,
0.4521651, 0.06582864, 2.91978, 0, 0.07058824, 1, 1,
0.4554857, 1.449703, -0.5139205, 0, 0.0627451, 1, 1,
0.4564447, -0.8650012, 4.026604, 0, 0.05882353, 1, 1,
0.458355, 0.7437414, 1.280624, 0, 0.05098039, 1, 1,
0.4593519, -1.039789, 2.714912, 0, 0.04705882, 1, 1,
0.4616489, 0.9584827, 0.9187414, 0, 0.03921569, 1, 1,
0.4648633, 0.1343002, 0.6723379, 0, 0.03529412, 1, 1,
0.4678994, 0.0008396361, 0.242767, 0, 0.02745098, 1, 1,
0.4704735, -0.5154337, 2.927231, 0, 0.02352941, 1, 1,
0.474474, 0.3114966, -0.3809549, 0, 0.01568628, 1, 1,
0.4751669, 0.4733524, -0.8477311, 0, 0.01176471, 1, 1,
0.4780123, 0.2499002, 0.6591629, 0, 0.003921569, 1, 1,
0.4788241, -0.445363, 2.931615, 0.003921569, 0, 1, 1,
0.4792616, -0.447939, 3.518358, 0.007843138, 0, 1, 1,
0.4799238, 1.128376, -0.3125099, 0.01568628, 0, 1, 1,
0.4816716, 0.09226932, 0.3173365, 0.01960784, 0, 1, 1,
0.4821129, -0.7983515, 2.699579, 0.02745098, 0, 1, 1,
0.4856516, 0.1180977, 1.625439, 0.03137255, 0, 1, 1,
0.4893847, 0.4008496, 0.3445044, 0.03921569, 0, 1, 1,
0.4895653, 0.4210552, 0.7961897, 0.04313726, 0, 1, 1,
0.4939315, -1.868208, 2.883247, 0.05098039, 0, 1, 1,
0.4954236, -0.9966744, 0.5295159, 0.05490196, 0, 1, 1,
0.5003161, 0.218356, 0.9059548, 0.0627451, 0, 1, 1,
0.5008435, -2.129828, 2.299159, 0.06666667, 0, 1, 1,
0.5073094, 0.06921455, 0.4667753, 0.07450981, 0, 1, 1,
0.5099081, 0.630151, 2.98089, 0.07843138, 0, 1, 1,
0.510801, 1.273307, -0.922792, 0.08627451, 0, 1, 1,
0.5116901, 1.223985, -0.6658787, 0.09019608, 0, 1, 1,
0.5139965, -1.20992, 1.473748, 0.09803922, 0, 1, 1,
0.5148623, 0.8469718, -1.102654, 0.1058824, 0, 1, 1,
0.5150418, 0.2653495, 1.281845, 0.1098039, 0, 1, 1,
0.520372, 0.363719, 3.125678, 0.1176471, 0, 1, 1,
0.5238065, 0.3698299, -0.5993823, 0.1215686, 0, 1, 1,
0.5254384, -1.161908, 2.82137, 0.1294118, 0, 1, 1,
0.5267429, 0.8275447, -0.8704289, 0.1333333, 0, 1, 1,
0.5281492, -0.6787216, 1.932749, 0.1411765, 0, 1, 1,
0.5375145, -1.054381, 2.897685, 0.145098, 0, 1, 1,
0.539542, 0.07790361, 2.771103, 0.1529412, 0, 1, 1,
0.5426553, -0.3787547, 1.050082, 0.1568628, 0, 1, 1,
0.5470776, 0.9056295, 0.05461478, 0.1647059, 0, 1, 1,
0.547767, -0.7644718, 4.217467, 0.1686275, 0, 1, 1,
0.5489108, 1.194465, 1.581837, 0.1764706, 0, 1, 1,
0.5506685, -1.240195, 0.9072726, 0.1803922, 0, 1, 1,
0.5522885, -1.567629, 4.34205, 0.1882353, 0, 1, 1,
0.5524129, 0.2090467, 0.3498568, 0.1921569, 0, 1, 1,
0.5533892, 0.006379092, 0.8854231, 0.2, 0, 1, 1,
0.5545284, 0.8601589, 2.022849, 0.2078431, 0, 1, 1,
0.5604299, -1.771926, 3.821106, 0.2117647, 0, 1, 1,
0.5613898, -1.391298, 2.813308, 0.2196078, 0, 1, 1,
0.5631413, -0.4371513, 0.4355003, 0.2235294, 0, 1, 1,
0.5645511, -0.0843437, 2.763287, 0.2313726, 0, 1, 1,
0.5665674, 0.5279955, 1.267231, 0.2352941, 0, 1, 1,
0.5676302, -0.4660154, 2.720611, 0.2431373, 0, 1, 1,
0.5683663, -0.3581023, 2.986027, 0.2470588, 0, 1, 1,
0.5708777, 0.6616362, 1.553683, 0.254902, 0, 1, 1,
0.5711794, -1.26492, 2.86714, 0.2588235, 0, 1, 1,
0.5726679, -0.1288948, 2.941778, 0.2666667, 0, 1, 1,
0.5728701, -0.620806, 4.201379, 0.2705882, 0, 1, 1,
0.5736436, 0.4847686, 0.4713577, 0.2784314, 0, 1, 1,
0.5744114, -0.3531245, 2.109243, 0.282353, 0, 1, 1,
0.5774599, -0.06727795, 1.174884, 0.2901961, 0, 1, 1,
0.5806977, -0.384748, 2.306606, 0.2941177, 0, 1, 1,
0.5845018, 1.598414, 1.128219, 0.3019608, 0, 1, 1,
0.5900473, -1.044536, 2.584366, 0.3098039, 0, 1, 1,
0.5902971, 0.5510653, 0.4371848, 0.3137255, 0, 1, 1,
0.5908903, -0.2165008, 0.9112223, 0.3215686, 0, 1, 1,
0.5995188, 0.5939858, 0.5149176, 0.3254902, 0, 1, 1,
0.5999665, 0.4968058, 0.4637472, 0.3333333, 0, 1, 1,
0.6024063, -0.3467561, 2.296457, 0.3372549, 0, 1, 1,
0.6031283, 0.2075752, 0.4671843, 0.345098, 0, 1, 1,
0.6070014, -0.3881434, 1.533176, 0.3490196, 0, 1, 1,
0.6072726, 0.07451218, 2.187739, 0.3568628, 0, 1, 1,
0.6085316, -0.1801936, 0.6413812, 0.3607843, 0, 1, 1,
0.6148747, -0.6041527, 3.016602, 0.3686275, 0, 1, 1,
0.6296259, -1.480029, 2.041764, 0.372549, 0, 1, 1,
0.6335124, -0.5655404, 0.6410478, 0.3803922, 0, 1, 1,
0.6383638, 0.9026042, -0.3072227, 0.3843137, 0, 1, 1,
0.640617, 1.215234, 0.6324789, 0.3921569, 0, 1, 1,
0.6430231, 1.098674, -0.03050006, 0.3960784, 0, 1, 1,
0.6446071, 1.026557, 0.8662344, 0.4039216, 0, 1, 1,
0.6467298, 0.7248801, -0.7223713, 0.4117647, 0, 1, 1,
0.6477025, 0.171071, 0.5658443, 0.4156863, 0, 1, 1,
0.6536586, 0.7413871, -0.3030389, 0.4235294, 0, 1, 1,
0.6632102, 0.447797, 1.606643, 0.427451, 0, 1, 1,
0.665561, -1.098189, 2.321156, 0.4352941, 0, 1, 1,
0.6659475, -0.2918634, 2.103513, 0.4392157, 0, 1, 1,
0.6697333, -1.621278, 2.024222, 0.4470588, 0, 1, 1,
0.6760247, -1.695798, 3.318485, 0.4509804, 0, 1, 1,
0.6765491, -0.7538419, 1.531992, 0.4588235, 0, 1, 1,
0.6778114, 0.491947, 0.4043095, 0.4627451, 0, 1, 1,
0.6790926, 1.341845, -0.8845133, 0.4705882, 0, 1, 1,
0.6801416, 0.599152, 1.644087, 0.4745098, 0, 1, 1,
0.6851506, 1.512467, 0.08441167, 0.4823529, 0, 1, 1,
0.6902333, 0.3589057, 2.927635, 0.4862745, 0, 1, 1,
0.6957791, 2.379976, 0.08841926, 0.4941176, 0, 1, 1,
0.7021283, 0.9677734, 1.113275, 0.5019608, 0, 1, 1,
0.7029446, 0.003855459, 2.396165, 0.5058824, 0, 1, 1,
0.7093034, -1.970535, 1.668271, 0.5137255, 0, 1, 1,
0.7123902, 1.047283, 0.5210508, 0.5176471, 0, 1, 1,
0.7125852, 1.514344, 0.5759259, 0.5254902, 0, 1, 1,
0.7191247, -2.172743, 1.993816, 0.5294118, 0, 1, 1,
0.7198787, -0.6865271, 2.626847, 0.5372549, 0, 1, 1,
0.7213251, 0.8182556, 0.4106017, 0.5411765, 0, 1, 1,
0.7234831, 0.9637023, 0.7500024, 0.5490196, 0, 1, 1,
0.7259191, -1.059918, 1.355157, 0.5529412, 0, 1, 1,
0.7279966, 0.3530254, 1.848187, 0.5607843, 0, 1, 1,
0.7290798, -0.9764166, 2.676653, 0.5647059, 0, 1, 1,
0.7306162, 0.3076577, 0.5702925, 0.572549, 0, 1, 1,
0.7358493, -1.068266, 2.773007, 0.5764706, 0, 1, 1,
0.7394769, -0.6272617, 3.205, 0.5843138, 0, 1, 1,
0.7395791, -2.151781, 3.357765, 0.5882353, 0, 1, 1,
0.7455932, -0.614969, 3.099532, 0.5960785, 0, 1, 1,
0.7473406, -1.225695, 1.412537, 0.6039216, 0, 1, 1,
0.7584748, 0.3751476, -0.6022978, 0.6078432, 0, 1, 1,
0.7587958, -0.5203609, 3.368896, 0.6156863, 0, 1, 1,
0.7596616, -0.338329, 1.270169, 0.6196079, 0, 1, 1,
0.7653416, -0.5834903, 3.120095, 0.627451, 0, 1, 1,
0.7707202, -1.463557, 2.837591, 0.6313726, 0, 1, 1,
0.7707659, -0.8251439, 2.573764, 0.6392157, 0, 1, 1,
0.7708046, 0.4424356, 0.5427402, 0.6431373, 0, 1, 1,
0.7729534, -0.3374618, 2.910269, 0.6509804, 0, 1, 1,
0.7751597, 1.314525, 0.5336568, 0.654902, 0, 1, 1,
0.7770321, 0.5891271, 2.803081, 0.6627451, 0, 1, 1,
0.7771118, 1.319441, 1.360034, 0.6666667, 0, 1, 1,
0.7794266, -0.7615299, 1.388995, 0.6745098, 0, 1, 1,
0.7814148, 0.6741537, 0.6368558, 0.6784314, 0, 1, 1,
0.7834205, -0.7224082, 3.504876, 0.6862745, 0, 1, 1,
0.7883108, 0.7544193, 0.8909279, 0.6901961, 0, 1, 1,
0.7930514, 0.2595403, 3.072711, 0.6980392, 0, 1, 1,
0.7938462, -0.5353297, 1.25027, 0.7058824, 0, 1, 1,
0.7942904, 0.9286801, 0.4723037, 0.7098039, 0, 1, 1,
0.8047456, 0.4244612, 0.4837717, 0.7176471, 0, 1, 1,
0.805075, 1.203707, 0.7194517, 0.7215686, 0, 1, 1,
0.8055655, 0.2179625, 0.7135977, 0.7294118, 0, 1, 1,
0.806419, 0.7588957, -0.2757852, 0.7333333, 0, 1, 1,
0.8091238, 1.81417, 0.3155953, 0.7411765, 0, 1, 1,
0.8126507, -1.047742, 3.541031, 0.7450981, 0, 1, 1,
0.8149486, 0.2333732, 1.165424, 0.7529412, 0, 1, 1,
0.8180997, -0.6478746, 2.24332, 0.7568628, 0, 1, 1,
0.8229373, -1.360505, 3.274193, 0.7647059, 0, 1, 1,
0.8231877, -0.5372998, 3.176166, 0.7686275, 0, 1, 1,
0.8259816, 0.9550139, 0.9525511, 0.7764706, 0, 1, 1,
0.8346207, -0.5757123, 2.246682, 0.7803922, 0, 1, 1,
0.8376504, 1.137272, 1.412834, 0.7882353, 0, 1, 1,
0.8411264, -0.7690195, 2.820622, 0.7921569, 0, 1, 1,
0.842644, 1.699619, 1.232943, 0.8, 0, 1, 1,
0.8427051, 0.06287424, 0.5973672, 0.8078431, 0, 1, 1,
0.8660609, 1.296519, -0.2133355, 0.8117647, 0, 1, 1,
0.869502, 0.4369505, 0.4602107, 0.8196079, 0, 1, 1,
0.8751453, 1.212361, 1.320437, 0.8235294, 0, 1, 1,
0.8770588, 0.2803423, 0.5070263, 0.8313726, 0, 1, 1,
0.877194, -0.9206483, 3.392012, 0.8352941, 0, 1, 1,
0.8785294, -0.5798452, 0.01730889, 0.8431373, 0, 1, 1,
0.8799232, -1.108735, 1.968634, 0.8470588, 0, 1, 1,
0.8805382, 0.2519506, 0.9446475, 0.854902, 0, 1, 1,
0.8848205, 1.309168, -1.348265, 0.8588235, 0, 1, 1,
0.8864753, -0.1673751, 1.943741, 0.8666667, 0, 1, 1,
0.8889495, 0.8029522, 1.675711, 0.8705882, 0, 1, 1,
0.8929738, 1.109899, 0.7142213, 0.8784314, 0, 1, 1,
0.8935791, 0.6467493, 2.012048, 0.8823529, 0, 1, 1,
0.8964727, 0.06734048, 2.134797, 0.8901961, 0, 1, 1,
0.8991957, -1.431647, 2.818997, 0.8941177, 0, 1, 1,
0.904816, 0.6593444, -0.01253981, 0.9019608, 0, 1, 1,
0.9220352, -1.383872, 2.413634, 0.9098039, 0, 1, 1,
0.9232669, -2.197583, 3.174049, 0.9137255, 0, 1, 1,
0.927579, 2.01283, 1.102834, 0.9215686, 0, 1, 1,
0.9305503, 0.4091395, 1.267439, 0.9254902, 0, 1, 1,
0.9346062, -1.468539, 2.068872, 0.9333333, 0, 1, 1,
0.9403923, -0.6694224, 1.532151, 0.9372549, 0, 1, 1,
0.9424664, 0.7054539, 0.1034418, 0.945098, 0, 1, 1,
0.9464847, 0.7835635, 2.145432, 0.9490196, 0, 1, 1,
0.9474505, 1.668411, 0.4506109, 0.9568627, 0, 1, 1,
0.9523281, 0.2066029, 0.9764025, 0.9607843, 0, 1, 1,
0.9525623, -0.5124881, 3.211605, 0.9686275, 0, 1, 1,
0.9560809, -1.090103, 2.241306, 0.972549, 0, 1, 1,
0.9579287, -0.5250027, 0.8258572, 0.9803922, 0, 1, 1,
0.9591767, -0.2839406, 2.776168, 0.9843137, 0, 1, 1,
0.9641653, 0.05277629, 1.633853, 0.9921569, 0, 1, 1,
0.9679651, -0.5036031, 1.686548, 0.9960784, 0, 1, 1,
0.9699953, -0.666747, 1.75148, 1, 0, 0.9960784, 1,
0.9711047, 1.610834, 1.417858, 1, 0, 0.9882353, 1,
0.9714665, -1.419162, 3.242228, 1, 0, 0.9843137, 1,
0.9777572, -0.5509557, 2.391263, 1, 0, 0.9764706, 1,
0.9784855, -0.8887151, 2.534483, 1, 0, 0.972549, 1,
0.9825602, -0.2822959, 1.827571, 1, 0, 0.9647059, 1,
0.9839609, 1.150913, 0.3237963, 1, 0, 0.9607843, 1,
0.9859065, -0.8463892, 3.742544, 1, 0, 0.9529412, 1,
0.9860261, 0.008882388, 0.8481254, 1, 0, 0.9490196, 1,
0.9886227, 0.05530272, 1.653605, 1, 0, 0.9411765, 1,
0.9917708, 0.08420232, 1.915864, 1, 0, 0.9372549, 1,
0.994372, 0.8074331, 0.4288098, 1, 0, 0.9294118, 1,
1.002486, -0.3522518, 1.499225, 1, 0, 0.9254902, 1,
1.01916, 0.9579955, 2.091359, 1, 0, 0.9176471, 1,
1.022398, 0.6252623, 1.46433, 1, 0, 0.9137255, 1,
1.024342, -0.5692734, 2.736736, 1, 0, 0.9058824, 1,
1.025975, 0.02453678, 0.9644554, 1, 0, 0.9019608, 1,
1.026643, -1.286599, 2.519202, 1, 0, 0.8941177, 1,
1.035083, 1.570591, -0.08799434, 1, 0, 0.8862745, 1,
1.039025, 1.582911, 1.746551, 1, 0, 0.8823529, 1,
1.044928, -0.7550277, 2.421014, 1, 0, 0.8745098, 1,
1.049152, -0.7966877, -0.9951972, 1, 0, 0.8705882, 1,
1.050456, 0.3339932, 1.768574, 1, 0, 0.8627451, 1,
1.05257, -0.2182105, 2.506353, 1, 0, 0.8588235, 1,
1.054641, 1.70512, 0.7675708, 1, 0, 0.8509804, 1,
1.054786, 0.2542118, 1.601166, 1, 0, 0.8470588, 1,
1.055588, -0.4507778, 2.277166, 1, 0, 0.8392157, 1,
1.058856, -1.371533, 1.108812, 1, 0, 0.8352941, 1,
1.059062, 1.253761, -1.167997, 1, 0, 0.827451, 1,
1.061473, -0.7262097, 1.623915, 1, 0, 0.8235294, 1,
1.064119, -0.8575243, 2.312979, 1, 0, 0.8156863, 1,
1.069351, 0.9913414, 1.695692, 1, 0, 0.8117647, 1,
1.070545, -1.862152, 2.104491, 1, 0, 0.8039216, 1,
1.074749, 1.953488, -0.07694896, 1, 0, 0.7960784, 1,
1.077025, 0.9131842, 0.3477707, 1, 0, 0.7921569, 1,
1.087849, -0.1612943, 2.305851, 1, 0, 0.7843137, 1,
1.088337, 1.513182, 0.9239153, 1, 0, 0.7803922, 1,
1.088497, 0.6610414, 1.016877, 1, 0, 0.772549, 1,
1.090826, -0.7519211, 1.400792, 1, 0, 0.7686275, 1,
1.094069, -1.012977, 0.9674739, 1, 0, 0.7607843, 1,
1.100396, 1.84492, 0.4624743, 1, 0, 0.7568628, 1,
1.103594, 0.2365712, 1.476404, 1, 0, 0.7490196, 1,
1.103671, -0.5495117, 1.64955, 1, 0, 0.7450981, 1,
1.103897, 1.536529, 0.5093504, 1, 0, 0.7372549, 1,
1.124588, 0.709056, 2.122102, 1, 0, 0.7333333, 1,
1.126431, -2.848731, 2.050263, 1, 0, 0.7254902, 1,
1.129128, 1.676452, -0.6653124, 1, 0, 0.7215686, 1,
1.131532, -0.7088665, 2.645335, 1, 0, 0.7137255, 1,
1.139883, -0.5502578, 1.546303, 1, 0, 0.7098039, 1,
1.145763, 0.8306299, -0.9477314, 1, 0, 0.7019608, 1,
1.154457, -0.5402745, 1.439533, 1, 0, 0.6941177, 1,
1.161722, -0.5096005, 2.074491, 1, 0, 0.6901961, 1,
1.164324, -0.2719215, 2.249169, 1, 0, 0.682353, 1,
1.171828, -0.6164771, 2.52732, 1, 0, 0.6784314, 1,
1.176209, 1.214731, -0.5009959, 1, 0, 0.6705883, 1,
1.184577, 1.190059, 1.681205, 1, 0, 0.6666667, 1,
1.185304, 0.2801641, 0.5750832, 1, 0, 0.6588235, 1,
1.188244, 1.074551, -0.3770276, 1, 0, 0.654902, 1,
1.189545, -1.352413, 2.654146, 1, 0, 0.6470588, 1,
1.198838, 0.01424459, 2.105508, 1, 0, 0.6431373, 1,
1.208453, -0.2965583, 0.3460301, 1, 0, 0.6352941, 1,
1.209327, 0.2257447, 4.326184, 1, 0, 0.6313726, 1,
1.217705, 1.647814, -1.381063, 1, 0, 0.6235294, 1,
1.218144, 1.498262, 0.2121027, 1, 0, 0.6196079, 1,
1.22024, 0.00376084, 2.232127, 1, 0, 0.6117647, 1,
1.237963, 1.513878, 1.465446, 1, 0, 0.6078432, 1,
1.239105, 0.008836157, 1.85544, 1, 0, 0.6, 1,
1.243894, 0.6414903, 0.5123118, 1, 0, 0.5921569, 1,
1.245013, -0.09912433, 2.728916, 1, 0, 0.5882353, 1,
1.246392, 0.1067232, 1.315477, 1, 0, 0.5803922, 1,
1.252231, 0.7800508, -0.9629248, 1, 0, 0.5764706, 1,
1.252576, -2.642243, 1.561374, 1, 0, 0.5686275, 1,
1.252829, 0.4218116, 1.26145, 1, 0, 0.5647059, 1,
1.262652, -1.220073, 2.328445, 1, 0, 0.5568628, 1,
1.275573, 1.149339, 2.329337, 1, 0, 0.5529412, 1,
1.281899, 0.4075079, 1.207376, 1, 0, 0.5450981, 1,
1.295771, -0.5917, 3.144843, 1, 0, 0.5411765, 1,
1.306938, -1.361324, 4.561671, 1, 0, 0.5333334, 1,
1.309477, -1.410952, 3.043113, 1, 0, 0.5294118, 1,
1.31034, -1.820837, 1.55252, 1, 0, 0.5215687, 1,
1.313834, 0.08245915, 2.347968, 1, 0, 0.5176471, 1,
1.315655, 1.275566, 0.611223, 1, 0, 0.509804, 1,
1.317143, 0.500536, 1.74817, 1, 0, 0.5058824, 1,
1.320834, 2.115428, -0.2451356, 1, 0, 0.4980392, 1,
1.334762, -1.403504, 4.402321, 1, 0, 0.4901961, 1,
1.352141, -0.02684488, 0.8958474, 1, 0, 0.4862745, 1,
1.360337, -0.07397023, 2.14513, 1, 0, 0.4784314, 1,
1.364462, 0.003113132, 0.3302094, 1, 0, 0.4745098, 1,
1.374124, -0.3952781, 2.401135, 1, 0, 0.4666667, 1,
1.384095, 0.1177285, 2.085809, 1, 0, 0.4627451, 1,
1.384806, -0.03661076, 2.152979, 1, 0, 0.454902, 1,
1.411582, 2.125568, 1.533669, 1, 0, 0.4509804, 1,
1.421602, 0.9559457, 2.177898, 1, 0, 0.4431373, 1,
1.427512, -1.492469, 3.471005, 1, 0, 0.4392157, 1,
1.437382, 0.4619995, -0.2117162, 1, 0, 0.4313726, 1,
1.439761, 1.284874, -0.2869281, 1, 0, 0.427451, 1,
1.444922, 1.182877, 1.052419, 1, 0, 0.4196078, 1,
1.44513, 1.274945, -0.1155457, 1, 0, 0.4156863, 1,
1.452217, 0.07422002, 2.99778, 1, 0, 0.4078431, 1,
1.467963, -1.648002, 4.416658, 1, 0, 0.4039216, 1,
1.478676, -1.034933, 2.549908, 1, 0, 0.3960784, 1,
1.48146, 0.7782306, 1.156425, 1, 0, 0.3882353, 1,
1.49281, 1.12622, 0.7612266, 1, 0, 0.3843137, 1,
1.493258, 0.1677629, 1.041299, 1, 0, 0.3764706, 1,
1.493646, -2.115007, 0.977547, 1, 0, 0.372549, 1,
1.504773, 0.4896839, 1.736606, 1, 0, 0.3647059, 1,
1.506081, 0.3996843, 1.759924, 1, 0, 0.3607843, 1,
1.510457, -0.4048294, -0.1035612, 1, 0, 0.3529412, 1,
1.512441, 0.4538932, 1.113646, 1, 0, 0.3490196, 1,
1.514006, 0.3943051, 0.7695215, 1, 0, 0.3411765, 1,
1.527513, -0.6055875, 2.47813, 1, 0, 0.3372549, 1,
1.536615, 1.236917, 1.770156, 1, 0, 0.3294118, 1,
1.538145, 0.5482389, 2.120872, 1, 0, 0.3254902, 1,
1.56341, -0.6573507, 0.4644211, 1, 0, 0.3176471, 1,
1.563511, 0.6292358, 1.690446, 1, 0, 0.3137255, 1,
1.574755, 0.9920632, -0.4083582, 1, 0, 0.3058824, 1,
1.574762, 1.126634, 1.79328, 1, 0, 0.2980392, 1,
1.587425, -0.3564928, 3.682113, 1, 0, 0.2941177, 1,
1.596776, -0.452742, 1.091963, 1, 0, 0.2862745, 1,
1.622672, 0.2834187, 1.121515, 1, 0, 0.282353, 1,
1.64427, 0.03057696, 2.481202, 1, 0, 0.2745098, 1,
1.665589, -0.8370885, 2.748463, 1, 0, 0.2705882, 1,
1.68734, 0.5382348, -0.1247865, 1, 0, 0.2627451, 1,
1.692527, -0.3513639, 0.01358528, 1, 0, 0.2588235, 1,
1.702722, -0.3236173, 2.965663, 1, 0, 0.2509804, 1,
1.717813, -0.5799994, 1.411533, 1, 0, 0.2470588, 1,
1.720333, 1.286113, 1.276262, 1, 0, 0.2392157, 1,
1.73635, -1.173565, 1.702178, 1, 0, 0.2352941, 1,
1.737265, -1.537254, 1.731333, 1, 0, 0.227451, 1,
1.740018, -0.6593451, -0.03167104, 1, 0, 0.2235294, 1,
1.745393, -1.532612, 0.4613811, 1, 0, 0.2156863, 1,
1.747132, 1.970914, 0.10228, 1, 0, 0.2117647, 1,
1.748242, 1.971433, 1.193704, 1, 0, 0.2039216, 1,
1.749612, -1.448917, 4.052715, 1, 0, 0.1960784, 1,
1.754675, 0.4972003, 2.838837, 1, 0, 0.1921569, 1,
1.768651, -0.2952747, 1.106286, 1, 0, 0.1843137, 1,
1.786467, -0.1762096, 2.12806, 1, 0, 0.1803922, 1,
1.794819, 0.6488258, 0.9445328, 1, 0, 0.172549, 1,
1.802718, 1.012553, 1.705852, 1, 0, 0.1686275, 1,
1.818412, 0.3681109, 1.946712, 1, 0, 0.1607843, 1,
1.833893, -0.3707961, 3.242253, 1, 0, 0.1568628, 1,
1.861263, -0.01685227, 2.162083, 1, 0, 0.1490196, 1,
1.871779, -0.0213362, 0.4675317, 1, 0, 0.145098, 1,
1.872481, -0.3452995, 3.705072, 1, 0, 0.1372549, 1,
1.878127, -0.03230982, 2.544, 1, 0, 0.1333333, 1,
1.897927, 0.2223274, 2.525058, 1, 0, 0.1254902, 1,
1.917324, -0.607361, 1.362841, 1, 0, 0.1215686, 1,
1.92836, 1.187868, 2.665387, 1, 0, 0.1137255, 1,
1.938247, -0.03613011, 2.682889, 1, 0, 0.1098039, 1,
1.953434, -0.2783247, 2.971283, 1, 0, 0.1019608, 1,
1.995174, -0.6821342, 1.75106, 1, 0, 0.09411765, 1,
2.012795, -0.8031874, 2.149117, 1, 0, 0.09019608, 1,
2.032952, -1.358985, 2.886835, 1, 0, 0.08235294, 1,
2.051709, -0.8945699, 0.3032501, 1, 0, 0.07843138, 1,
2.068825, 0.3837596, 0.8661468, 1, 0, 0.07058824, 1,
2.083577, 0.5844191, 2.841894, 1, 0, 0.06666667, 1,
2.12847, 0.04545974, 1.095605, 1, 0, 0.05882353, 1,
2.158488, 0.334327, 1.423784, 1, 0, 0.05490196, 1,
2.162572, 0.6343338, 0.5212752, 1, 0, 0.04705882, 1,
2.162614, -0.1276518, 2.533393, 1, 0, 0.04313726, 1,
2.430061, 0.6577785, 1.199736, 1, 0, 0.03529412, 1,
2.535083, 0.5962216, 0.6936153, 1, 0, 0.03137255, 1,
2.723056, 0.1896195, 2.848126, 1, 0, 0.02352941, 1,
2.790193, 0.06969763, 1.770612, 1, 0, 0.01960784, 1,
2.801309, 0.2012784, 1.294829, 1, 0, 0.01176471, 1,
2.883918, -1.290131, 0.2836224, 1, 0, 0.007843138, 1
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
-0.3845221, -3.788246, -8.190849, 0, -0.5, 0.5, 0.5,
-0.3845221, -3.788246, -8.190849, 1, -0.5, 0.5, 0.5,
-0.3845221, -3.788246, -8.190849, 1, 1.5, 0.5, 0.5,
-0.3845221, -3.788246, -8.190849, 0, 1.5, 0.5, 0.5
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
-4.760963, -0.07730007, -8.190849, 0, -0.5, 0.5, 0.5,
-4.760963, -0.07730007, -8.190849, 1, -0.5, 0.5, 0.5,
-4.760963, -0.07730007, -8.190849, 1, 1.5, 0.5, 0.5,
-4.760963, -0.07730007, -8.190849, 0, 1.5, 0.5, 0.5
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
-4.760963, -3.788246, 0.122689, 0, -0.5, 0.5, 0.5,
-4.760963, -3.788246, 0.122689, 1, -0.5, 0.5, 0.5,
-4.760963, -3.788246, 0.122689, 1, 1.5, 0.5, 0.5,
-4.760963, -3.788246, 0.122689, 0, 1.5, 0.5, 0.5
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
-3, -2.931874, -6.272341,
2, -2.931874, -6.272341,
-3, -2.931874, -6.272341,
-3, -3.074603, -6.592092,
-2, -2.931874, -6.272341,
-2, -3.074603, -6.592092,
-1, -2.931874, -6.272341,
-1, -3.074603, -6.592092,
0, -2.931874, -6.272341,
0, -3.074603, -6.592092,
1, -2.931874, -6.272341,
1, -3.074603, -6.592092,
2, -2.931874, -6.272341,
2, -3.074603, -6.592092
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
-3, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
-3, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
-3, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
-3, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5,
-2, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
-2, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
-2, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
-2, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5,
-1, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
-1, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
-1, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
-1, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5,
0, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
0, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
0, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
0, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5,
1, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
1, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
1, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
1, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5,
2, -3.36006, -7.231595, 0, -0.5, 0.5, 0.5,
2, -3.36006, -7.231595, 1, -0.5, 0.5, 0.5,
2, -3.36006, -7.231595, 1, 1.5, 0.5, 0.5,
2, -3.36006, -7.231595, 0, 1.5, 0.5, 0.5
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
-3.751015, -2, -6.272341,
-3.751015, 2, -6.272341,
-3.751015, -2, -6.272341,
-3.91934, -2, -6.592092,
-3.751015, -1, -6.272341,
-3.91934, -1, -6.592092,
-3.751015, 0, -6.272341,
-3.91934, 0, -6.592092,
-3.751015, 1, -6.272341,
-3.91934, 1, -6.592092,
-3.751015, 2, -6.272341,
-3.91934, 2, -6.592092
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
-4.255989, -2, -7.231595, 0, -0.5, 0.5, 0.5,
-4.255989, -2, -7.231595, 1, -0.5, 0.5, 0.5,
-4.255989, -2, -7.231595, 1, 1.5, 0.5, 0.5,
-4.255989, -2, -7.231595, 0, 1.5, 0.5, 0.5,
-4.255989, -1, -7.231595, 0, -0.5, 0.5, 0.5,
-4.255989, -1, -7.231595, 1, -0.5, 0.5, 0.5,
-4.255989, -1, -7.231595, 1, 1.5, 0.5, 0.5,
-4.255989, -1, -7.231595, 0, 1.5, 0.5, 0.5,
-4.255989, 0, -7.231595, 0, -0.5, 0.5, 0.5,
-4.255989, 0, -7.231595, 1, -0.5, 0.5, 0.5,
-4.255989, 0, -7.231595, 1, 1.5, 0.5, 0.5,
-4.255989, 0, -7.231595, 0, 1.5, 0.5, 0.5,
-4.255989, 1, -7.231595, 0, -0.5, 0.5, 0.5,
-4.255989, 1, -7.231595, 1, -0.5, 0.5, 0.5,
-4.255989, 1, -7.231595, 1, 1.5, 0.5, 0.5,
-4.255989, 1, -7.231595, 0, 1.5, 0.5, 0.5,
-4.255989, 2, -7.231595, 0, -0.5, 0.5, 0.5,
-4.255989, 2, -7.231595, 1, -0.5, 0.5, 0.5,
-4.255989, 2, -7.231595, 1, 1.5, 0.5, 0.5,
-4.255989, 2, -7.231595, 0, 1.5, 0.5, 0.5
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
-3.751015, -2.931874, -6,
-3.751015, -2.931874, 6,
-3.751015, -2.931874, -6,
-3.91934, -3.074603, -6,
-3.751015, -2.931874, -4,
-3.91934, -3.074603, -4,
-3.751015, -2.931874, -2,
-3.91934, -3.074603, -2,
-3.751015, -2.931874, 0,
-3.91934, -3.074603, 0,
-3.751015, -2.931874, 2,
-3.91934, -3.074603, 2,
-3.751015, -2.931874, 4,
-3.91934, -3.074603, 4,
-3.751015, -2.931874, 6,
-3.91934, -3.074603, 6
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
-4.255989, -3.36006, -6, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -6, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -6, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, -6, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, -4, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -4, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -4, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, -4, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, -2, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -2, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, -2, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, -2, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 0, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 0, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 0, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 0, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 2, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 2, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 2, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 2, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 4, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 4, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 4, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 4, 0, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 6, 0, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 6, 1, -0.5, 0.5, 0.5,
-4.255989, -3.36006, 6, 1, 1.5, 0.5, 0.5,
-4.255989, -3.36006, 6, 0, 1.5, 0.5, 0.5
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
-3.751015, -2.931874, -6.272341,
-3.751015, 2.777274, -6.272341,
-3.751015, -2.931874, 6.517719,
-3.751015, 2.777274, 6.517719,
-3.751015, -2.931874, -6.272341,
-3.751015, -2.931874, 6.517719,
-3.751015, 2.777274, -6.272341,
-3.751015, 2.777274, 6.517719,
-3.751015, -2.931874, -6.272341,
2.981971, -2.931874, -6.272341,
-3.751015, -2.931874, 6.517719,
2.981971, -2.931874, 6.517719,
-3.751015, 2.777274, -6.272341,
2.981971, 2.777274, -6.272341,
-3.751015, 2.777274, 6.517719,
2.981971, 2.777274, 6.517719,
2.981971, -2.931874, -6.272341,
2.981971, 2.777274, -6.272341,
2.981971, -2.931874, 6.517719,
2.981971, 2.777274, 6.517719,
2.981971, -2.931874, -6.272341,
2.981971, -2.931874, 6.517719,
2.981971, 2.777274, -6.272341,
2.981971, 2.777274, 6.517719
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
var radius = 8.298428;
var distance = 36.92064;
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
mvMatrix.translate( 0.3845221, 0.07730007, -0.122689 );
mvMatrix.scale( 1.332607, 1.571587, 0.7015153 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.92064);
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
ethalfluralin<-read.table("ethalfluralin.xyz")
```

```
## Error in read.table("ethalfluralin.xyz"): no lines available in input
```

```r
x<-ethalfluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
y<-ethalfluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
```

```r
z<-ethalfluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethalfluralin' not found
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
-3.652962, -0.3240989, -0.917217, 0, 0, 1, 1, 1,
-2.989545, -2.006464, -2.057807, 1, 0, 0, 1, 1,
-2.983976, -0.2850761, -2.738298, 1, 0, 0, 1, 1,
-2.914694, 1.286273, -1.657652, 1, 0, 0, 1, 1,
-2.85187, -2.203101, -1.622931, 1, 0, 0, 1, 1,
-2.682405, -0.7370012, -1.702595, 1, 0, 0, 1, 1,
-2.682067, 0.8021742, 0.6250084, 0, 0, 0, 1, 1,
-2.652642, -1.105475, -2.499227, 0, 0, 0, 1, 1,
-2.635025, -2.165087, -2.61015, 0, 0, 0, 1, 1,
-2.339412, 1.045553, -2.654762, 0, 0, 0, 1, 1,
-2.283978, 0.7853714, -0.8759099, 0, 0, 0, 1, 1,
-2.232049, -1.293475, -1.50141, 0, 0, 0, 1, 1,
-2.153473, 0.7446873, -2.639592, 0, 0, 0, 1, 1,
-2.136619, -0.6966146, -1.331616, 1, 1, 1, 1, 1,
-2.116927, 2.119465, -0.5139015, 1, 1, 1, 1, 1,
-2.084015, -0.6976377, -0.8031079, 1, 1, 1, 1, 1,
-2.071166, 0.2654389, -0.766755, 1, 1, 1, 1, 1,
-2.064537, -0.195524, -0.8552393, 1, 1, 1, 1, 1,
-2.044284, 0.3908191, -0.2461196, 1, 1, 1, 1, 1,
-2.007615, 0.1100997, -0.9825653, 1, 1, 1, 1, 1,
-1.978226, 0.7623514, -0.9451641, 1, 1, 1, 1, 1,
-1.931875, 0.2740663, -2.575972, 1, 1, 1, 1, 1,
-1.922881, 0.3139063, -1.091855, 1, 1, 1, 1, 1,
-1.90245, -0.1777545, -1.139518, 1, 1, 1, 1, 1,
-1.897066, -0.3718232, -1.633762, 1, 1, 1, 1, 1,
-1.889078, -0.889355, -1.560359, 1, 1, 1, 1, 1,
-1.888926, -0.05702372, 0.4569131, 1, 1, 1, 1, 1,
-1.885923, 0.5969014, -1.10768, 1, 1, 1, 1, 1,
-1.875997, 0.4394413, 0.1362134, 0, 0, 1, 1, 1,
-1.834257, 1.398227, -1.653976, 1, 0, 0, 1, 1,
-1.796831, -1.046617, -2.907097, 1, 0, 0, 1, 1,
-1.781201, 0.5376856, 0.03752624, 1, 0, 0, 1, 1,
-1.767462, -1.286667, -3.784151, 1, 0, 0, 1, 1,
-1.748997, -0.5146799, -2.59518, 1, 0, 0, 1, 1,
-1.741609, 0.9266275, 0.1392772, 0, 0, 0, 1, 1,
-1.723812, 0.8154579, 0.5068639, 0, 0, 0, 1, 1,
-1.716702, -2.190882, -2.169837, 0, 0, 0, 1, 1,
-1.707402, 0.6604168, -1.684932, 0, 0, 0, 1, 1,
-1.703682, 1.043191, 0.5833989, 0, 0, 0, 1, 1,
-1.700678, 0.1111482, -2.181754, 0, 0, 0, 1, 1,
-1.690958, -0.03528408, -3.284379, 0, 0, 0, 1, 1,
-1.685035, 0.2196319, -0.6164335, 1, 1, 1, 1, 1,
-1.659851, 0.09199521, -1.460112, 1, 1, 1, 1, 1,
-1.647414, -0.1480402, -1.734324, 1, 1, 1, 1, 1,
-1.615984, 0.3143483, -0.4719689, 1, 1, 1, 1, 1,
-1.607906, -0.2700357, -2.613344, 1, 1, 1, 1, 1,
-1.596315, 0.5224662, -2.656065, 1, 1, 1, 1, 1,
-1.58926, 0.8352078, -2.639206, 1, 1, 1, 1, 1,
-1.586745, 0.7660034, 1.043801, 1, 1, 1, 1, 1,
-1.584728, -0.4221924, -2.68766, 1, 1, 1, 1, 1,
-1.570491, -0.4794268, -2.483423, 1, 1, 1, 1, 1,
-1.568723, 0.4988581, -1.038829, 1, 1, 1, 1, 1,
-1.566001, 1.123671, -1.076978, 1, 1, 1, 1, 1,
-1.562747, -1.157227, -1.035705, 1, 1, 1, 1, 1,
-1.558431, 0.07750943, -3.096831, 1, 1, 1, 1, 1,
-1.556569, -0.7662101, -1.362823, 1, 1, 1, 1, 1,
-1.553461, 1.036727, -0.3678022, 0, 0, 1, 1, 1,
-1.536436, 1.007874, -0.9446248, 1, 0, 0, 1, 1,
-1.531265, -0.1554756, -4.461902, 1, 0, 0, 1, 1,
-1.528131, 0.3743199, -0.5435702, 1, 0, 0, 1, 1,
-1.522696, 0.5630308, 0.3625216, 1, 0, 0, 1, 1,
-1.519611, -0.3603436, -3.05364, 1, 0, 0, 1, 1,
-1.500942, 0.06422067, -3.04831, 0, 0, 0, 1, 1,
-1.495103, -0.672075, -1.567373, 0, 0, 0, 1, 1,
-1.473727, 1.332426, 0.3911419, 0, 0, 0, 1, 1,
-1.44868, -0.1287299, -0.2027685, 0, 0, 0, 1, 1,
-1.412781, -0.6494791, -0.4644795, 0, 0, 0, 1, 1,
-1.40255, -0.09115314, -3.274042, 0, 0, 0, 1, 1,
-1.398319, 0.5765487, -0.6033192, 0, 0, 0, 1, 1,
-1.38133, 0.7312053, -2.707276, 1, 1, 1, 1, 1,
-1.373564, -0.4118407, -1.510621, 1, 1, 1, 1, 1,
-1.3713, -0.6518144, -1.731841, 1, 1, 1, 1, 1,
-1.369918, 1.043061, -1.046209, 1, 1, 1, 1, 1,
-1.361821, -1.075987, -1.731024, 1, 1, 1, 1, 1,
-1.343753, -1.40769, -4.487797, 1, 1, 1, 1, 1,
-1.333052, -0.7281518, -1.30562, 1, 1, 1, 1, 1,
-1.318467, 0.8785635, -2.726736, 1, 1, 1, 1, 1,
-1.316831, -1.591986, -3.337156, 1, 1, 1, 1, 1,
-1.306754, 0.8421229, -0.3976414, 1, 1, 1, 1, 1,
-1.30468, -1.501524, -2.547751, 1, 1, 1, 1, 1,
-1.297892, 1.581252, -1.525578, 1, 1, 1, 1, 1,
-1.274226, -0.3882597, -0.4724682, 1, 1, 1, 1, 1,
-1.267015, -0.1613247, -1.200788, 1, 1, 1, 1, 1,
-1.262261, 1.962495, -0.2759665, 1, 1, 1, 1, 1,
-1.257712, -0.352534, -2.776905, 0, 0, 1, 1, 1,
-1.255452, -0.3246141, -2.852542, 1, 0, 0, 1, 1,
-1.251505, 0.6938699, -1.096265, 1, 0, 0, 1, 1,
-1.243879, 1.250669, -2.065645, 1, 0, 0, 1, 1,
-1.238567, -0.3767529, -2.093342, 1, 0, 0, 1, 1,
-1.234528, -0.2724991, -2.795234, 1, 0, 0, 1, 1,
-1.2327, 0.2291401, -3.333793, 0, 0, 0, 1, 1,
-1.228052, -0.68826, -3.0108, 0, 0, 0, 1, 1,
-1.22155, 1.652915, -1.639554, 0, 0, 0, 1, 1,
-1.212549, 0.7878664, -0.344476, 0, 0, 0, 1, 1,
-1.210709, -0.01607057, -2.489512, 0, 0, 0, 1, 1,
-1.204437, 0.2046831, -1.791071, 0, 0, 0, 1, 1,
-1.203194, 0.3544875, -2.650414, 0, 0, 0, 1, 1,
-1.196053, 0.3402419, -0.02350769, 1, 1, 1, 1, 1,
-1.194453, 1.756235, -1.750459, 1, 1, 1, 1, 1,
-1.184747, -1.198073, -3.188163, 1, 1, 1, 1, 1,
-1.177001, -0.01432368, -1.355492, 1, 1, 1, 1, 1,
-1.172917, -1.560394, -1.836831, 1, 1, 1, 1, 1,
-1.172581, -0.6110796, -3.636811, 1, 1, 1, 1, 1,
-1.162026, -0.2941192, -0.5782847, 1, 1, 1, 1, 1,
-1.161559, -0.3015214, 0.3887691, 1, 1, 1, 1, 1,
-1.161114, 0.07982303, -1.689642, 1, 1, 1, 1, 1,
-1.141309, 0.5625975, -0.7688307, 1, 1, 1, 1, 1,
-1.139567, -0.9633116, -2.520823, 1, 1, 1, 1, 1,
-1.138156, 0.155173, -1.48219, 1, 1, 1, 1, 1,
-1.135746, -1.335819, -2.609168, 1, 1, 1, 1, 1,
-1.133412, -0.8595811, -2.849118, 1, 1, 1, 1, 1,
-1.128978, 0.1242742, 0.1715168, 1, 1, 1, 1, 1,
-1.123395, 0.8486069, -1.536462, 0, 0, 1, 1, 1,
-1.122658, -0.971121, -2.918664, 1, 0, 0, 1, 1,
-1.119646, -0.07675488, -0.2775936, 1, 0, 0, 1, 1,
-1.112942, 0.08851002, -2.081455, 1, 0, 0, 1, 1,
-1.101701, -1.61175, -1.824045, 1, 0, 0, 1, 1,
-1.100658, 0.05993948, 0.274253, 1, 0, 0, 1, 1,
-1.089878, 0.1502803, -2.9035, 0, 0, 0, 1, 1,
-1.082655, -0.5354002, -2.646133, 0, 0, 0, 1, 1,
-1.078787, -0.7876582, -2.739393, 0, 0, 0, 1, 1,
-1.078364, 0.6251962, -2.245004, 0, 0, 0, 1, 1,
-1.076519, 0.266717, -2.127807, 0, 0, 0, 1, 1,
-1.069129, 0.4358531, -0.7960268, 0, 0, 0, 1, 1,
-1.066117, 1.955924, -2.704492, 0, 0, 0, 1, 1,
-1.061399, 0.2853641, -0.6821294, 1, 1, 1, 1, 1,
-1.059502, 0.3070951, -2.063004, 1, 1, 1, 1, 1,
-1.056435, 1.885955, 0.3949046, 1, 1, 1, 1, 1,
-1.055963, -0.05543479, -0.115374, 1, 1, 1, 1, 1,
-1.053832, 1.055667, -0.7660093, 1, 1, 1, 1, 1,
-1.052628, 0.8032834, 0.3982602, 1, 1, 1, 1, 1,
-1.047792, 0.6779171, -2.387276, 1, 1, 1, 1, 1,
-1.044611, 0.01929281, -1.757123, 1, 1, 1, 1, 1,
-1.044581, -0.8394411, -3.414787, 1, 1, 1, 1, 1,
-1.044165, -0.2131307, -1.552796, 1, 1, 1, 1, 1,
-1.043407, 1.116339, -0.6876277, 1, 1, 1, 1, 1,
-1.043343, -0.04683358, -1.209604, 1, 1, 1, 1, 1,
-1.036598, 0.3210184, -1.003992, 1, 1, 1, 1, 1,
-1.033358, -0.3372546, -1.309894, 1, 1, 1, 1, 1,
-1.032446, 1.011475, -2.463007, 1, 1, 1, 1, 1,
-1.017467, 0.1195585, 0.2052393, 0, 0, 1, 1, 1,
-1.013566, 0.4870584, -0.6270594, 1, 0, 0, 1, 1,
-1.010775, 1.507572, -1.447029, 1, 0, 0, 1, 1,
-1.000683, 0.2755345, -2.493125, 1, 0, 0, 1, 1,
-1.000116, 1.163576, 0.261797, 1, 0, 0, 1, 1,
-0.9968641, -0.6867224, -2.580443, 1, 0, 0, 1, 1,
-0.9915119, -1.370683, -3.516808, 0, 0, 0, 1, 1,
-0.9865204, 0.7877777, -0.3508008, 0, 0, 0, 1, 1,
-0.9858078, -0.4349842, -1.963871, 0, 0, 0, 1, 1,
-0.985237, 0.9384835, -1.799068, 0, 0, 0, 1, 1,
-0.9838426, -1.163973, -4.482217, 0, 0, 0, 1, 1,
-0.9811468, -1.632819, -3.761344, 0, 0, 0, 1, 1,
-0.9661259, 0.8142094, -0.9778146, 0, 0, 0, 1, 1,
-0.961553, -0.2084551, -2.445957, 1, 1, 1, 1, 1,
-0.952225, -2.256009, -4.500398, 1, 1, 1, 1, 1,
-0.9466091, 1.113284, -1.880659, 1, 1, 1, 1, 1,
-0.9294574, 1.158265, 0.2571687, 1, 1, 1, 1, 1,
-0.9289601, -0.7736596, -2.68655, 1, 1, 1, 1, 1,
-0.9272161, -0.5540028, -1.59874, 1, 1, 1, 1, 1,
-0.9258652, 0.3188333, -1.768994, 1, 1, 1, 1, 1,
-0.9225551, -0.9265203, -3.124457, 1, 1, 1, 1, 1,
-0.9221051, -0.6825489, -4.589211, 1, 1, 1, 1, 1,
-0.9169782, -1.614229, -1.203251, 1, 1, 1, 1, 1,
-0.9134554, -0.06069034, -1.595933, 1, 1, 1, 1, 1,
-0.9124609, -0.501049, -0.8950763, 1, 1, 1, 1, 1,
-0.9103847, -0.6096401, -3.103604, 1, 1, 1, 1, 1,
-0.9008389, 1.810338, -0.3975679, 1, 1, 1, 1, 1,
-0.9004111, 0.4338474, -1.590154, 1, 1, 1, 1, 1,
-0.8860032, -0.06437682, -2.792523, 0, 0, 1, 1, 1,
-0.8838505, -0.05356153, -0.4604275, 1, 0, 0, 1, 1,
-0.8816685, 0.1776625, -1.631109, 1, 0, 0, 1, 1,
-0.8753768, 0.05306027, 0.7361723, 1, 0, 0, 1, 1,
-0.8640331, -0.4728598, -2.308473, 1, 0, 0, 1, 1,
-0.8518376, 0.2897807, 0.2060036, 1, 0, 0, 1, 1,
-0.8500359, -1.587852, -2.256918, 0, 0, 0, 1, 1,
-0.8443427, -0.1077968, -2.829635, 0, 0, 0, 1, 1,
-0.8344542, -0.6913218, -3.878139, 0, 0, 0, 1, 1,
-0.8307745, 1.357136, -2.184472, 0, 0, 0, 1, 1,
-0.8291128, 1.305443, -0.3877259, 0, 0, 0, 1, 1,
-0.8263659, 0.2060537, -1.504499, 0, 0, 0, 1, 1,
-0.815208, -0.7769937, -3.181993, 0, 0, 0, 1, 1,
-0.809495, -0.5395954, -2.151294, 1, 1, 1, 1, 1,
-0.8080465, 0.002672881, -2.858819, 1, 1, 1, 1, 1,
-0.8079473, 1.389743, 0.9550011, 1, 1, 1, 1, 1,
-0.8072251, -0.6393349, -3.162311, 1, 1, 1, 1, 1,
-0.804913, 0.3473833, 0.05126885, 1, 1, 1, 1, 1,
-0.8033515, 0.330691, -2.763742, 1, 1, 1, 1, 1,
-0.7992682, 0.3609082, -0.5467812, 1, 1, 1, 1, 1,
-0.7930481, -0.4272442, -2.930601, 1, 1, 1, 1, 1,
-0.7908484, -1.179298, -3.350777, 1, 1, 1, 1, 1,
-0.7859233, 0.3552117, -1.274235, 1, 1, 1, 1, 1,
-0.7841762, 0.02883632, -2.245376, 1, 1, 1, 1, 1,
-0.771952, 0.09855364, -2.289432, 1, 1, 1, 1, 1,
-0.7711679, 0.8953351, 0.3500801, 1, 1, 1, 1, 1,
-0.770205, -0.7479247, -3.496642, 1, 1, 1, 1, 1,
-0.7689888, 1.549551, 1.388286, 1, 1, 1, 1, 1,
-0.7677034, -0.3502711, -1.504611, 0, 0, 1, 1, 1,
-0.7594272, -0.3002093, -1.011297, 1, 0, 0, 1, 1,
-0.7574795, -1.454415, -5.027971, 1, 0, 0, 1, 1,
-0.7568261, -0.4662603, -2.394861, 1, 0, 0, 1, 1,
-0.7548958, -1.821747, -1.808051, 1, 0, 0, 1, 1,
-0.7535897, 1.045936, -2.154679, 1, 0, 0, 1, 1,
-0.7534387, 0.490721, -0.8363466, 0, 0, 0, 1, 1,
-0.7527008, 0.3017717, -0.4695677, 0, 0, 0, 1, 1,
-0.7506674, -1.043238, -6.086078, 0, 0, 0, 1, 1,
-0.7437979, 0.02205696, -1.471591, 0, 0, 0, 1, 1,
-0.7409665, 1.607421, -1.211489, 0, 0, 0, 1, 1,
-0.7406699, -1.31335, -2.677057, 0, 0, 0, 1, 1,
-0.7306412, -0.7566222, -1.796342, 0, 0, 0, 1, 1,
-0.7283905, 1.28794, -0.7032831, 1, 1, 1, 1, 1,
-0.7278416, -0.5544596, -2.685406, 1, 1, 1, 1, 1,
-0.7259088, 0.3779286, -0.2908168, 1, 1, 1, 1, 1,
-0.7226773, 1.059295, 0.3612561, 1, 1, 1, 1, 1,
-0.7223032, 0.4845547, -3.244003, 1, 1, 1, 1, 1,
-0.72124, 0.455494, -3.148586, 1, 1, 1, 1, 1,
-0.7162587, -2.333615, -3.593549, 1, 1, 1, 1, 1,
-0.7146819, -0.2586087, -2.113261, 1, 1, 1, 1, 1,
-0.714521, -1.222029, -1.911515, 1, 1, 1, 1, 1,
-0.7141524, 1.758776, -0.8362151, 1, 1, 1, 1, 1,
-0.7092201, -0.260087, -2.245949, 1, 1, 1, 1, 1,
-0.7068377, -0.5894739, -1.264967, 1, 1, 1, 1, 1,
-0.7068316, -0.6085938, -1.257085, 1, 1, 1, 1, 1,
-0.7051864, -2.291138, -3.329952, 1, 1, 1, 1, 1,
-0.7042981, -2.63384, -2.730429, 1, 1, 1, 1, 1,
-0.7036398, 1.303884, -0.7453511, 0, 0, 1, 1, 1,
-0.7007523, -0.05722674, -0.6622166, 1, 0, 0, 1, 1,
-0.6952031, 0.6628137, -2.509512, 1, 0, 0, 1, 1,
-0.6907936, -0.3576514, -2.135832, 1, 0, 0, 1, 1,
-0.6872894, -0.008605199, -2.565925, 1, 0, 0, 1, 1,
-0.6844046, -1.663644, -2.993007, 1, 0, 0, 1, 1,
-0.6843076, -0.5590544, -4.716536, 0, 0, 0, 1, 1,
-0.6843054, -0.05349448, -2.232063, 0, 0, 0, 1, 1,
-0.6809888, 0.322744, 0.3137669, 0, 0, 0, 1, 1,
-0.6803546, -1.330409, -2.819103, 0, 0, 0, 1, 1,
-0.6705604, 0.8850217, 1.237981, 0, 0, 0, 1, 1,
-0.6652356, 1.491806, -2.461298, 0, 0, 0, 1, 1,
-0.6612039, -0.4809926, -1.904755, 0, 0, 0, 1, 1,
-0.6561717, -2.422969, -1.977065, 1, 1, 1, 1, 1,
-0.6515877, 0.3316258, -1.508644, 1, 1, 1, 1, 1,
-0.6472157, 0.4910887, -0.6287901, 1, 1, 1, 1, 1,
-0.6465333, 0.2602239, -3.062681, 1, 1, 1, 1, 1,
-0.6460187, -0.2254041, -3.551216, 1, 1, 1, 1, 1,
-0.6449278, -0.935199, -1.32476, 1, 1, 1, 1, 1,
-0.6393265, -0.7156681, -4.094918, 1, 1, 1, 1, 1,
-0.6340116, 0.2071524, -1.668387, 1, 1, 1, 1, 1,
-0.6317371, -0.4786003, -2.145803, 1, 1, 1, 1, 1,
-0.6235219, -0.594937, -3.022322, 1, 1, 1, 1, 1,
-0.6217813, 0.2979836, -0.5202971, 1, 1, 1, 1, 1,
-0.6192783, -0.9664034, -3.534567, 1, 1, 1, 1, 1,
-0.6167432, 0.1104478, 2.641352, 1, 1, 1, 1, 1,
-0.6152849, -0.5151082, -3.286897, 1, 1, 1, 1, 1,
-0.6143166, -0.737098, -1.177058, 1, 1, 1, 1, 1,
-0.609841, 0.6116366, -0.104243, 0, 0, 1, 1, 1,
-0.6063855, 0.6926352, -0.6786368, 1, 0, 0, 1, 1,
-0.6040145, -0.3875483, -3.373827, 1, 0, 0, 1, 1,
-0.6024509, 0.5723047, 0.3381607, 1, 0, 0, 1, 1,
-0.598038, 0.5274103, -1.886176, 1, 0, 0, 1, 1,
-0.5951547, -0.9207963, -3.189675, 1, 0, 0, 1, 1,
-0.5840929, -0.2686494, -3.820514, 0, 0, 0, 1, 1,
-0.5818566, -0.6294776, -2.895726, 0, 0, 0, 1, 1,
-0.580754, -0.4572323, -2.980261, 0, 0, 0, 1, 1,
-0.5744405, 0.6741408, -2.135987, 0, 0, 0, 1, 1,
-0.5707978, 1.187108, -0.2967992, 0, 0, 0, 1, 1,
-0.5677536, 0.006781772, -1.097686, 0, 0, 0, 1, 1,
-0.5656515, 0.2320704, -1.951599, 0, 0, 0, 1, 1,
-0.5647607, 0.413108, 0.7662444, 1, 1, 1, 1, 1,
-0.5642467, -0.8017563, -3.201782, 1, 1, 1, 1, 1,
-0.5625181, 0.8997703, -0.4750517, 1, 1, 1, 1, 1,
-0.5616956, -0.09586284, -1.933549, 1, 1, 1, 1, 1,
-0.5602191, -1.303097, -3.810994, 1, 1, 1, 1, 1,
-0.5577569, 1.01611, -2.533979, 1, 1, 1, 1, 1,
-0.5576894, 2.037521, -0.3334886, 1, 1, 1, 1, 1,
-0.5558704, 0.2107399, -2.256124, 1, 1, 1, 1, 1,
-0.5458543, 0.201767, -1.041866, 1, 1, 1, 1, 1,
-0.5419214, -0.2948108, -1.39337, 1, 1, 1, 1, 1,
-0.5403222, 0.5043536, -1.511699, 1, 1, 1, 1, 1,
-0.5378368, 0.5029281, -0.7877313, 1, 1, 1, 1, 1,
-0.5375415, -0.204726, -2.35142, 1, 1, 1, 1, 1,
-0.537532, -1.727655, -1.844167, 1, 1, 1, 1, 1,
-0.5356998, -0.3560089, -1.113866, 1, 1, 1, 1, 1,
-0.5353354, 0.4260852, -2.350738, 0, 0, 1, 1, 1,
-0.5339538, -1.534888, -3.21253, 1, 0, 0, 1, 1,
-0.5332701, 0.4121747, 0.3071196, 1, 0, 0, 1, 1,
-0.5294408, -1.026773, -1.230541, 1, 0, 0, 1, 1,
-0.5243184, -0.4625022, -2.644954, 1, 0, 0, 1, 1,
-0.5242719, 0.1356683, 0.1913284, 1, 0, 0, 1, 1,
-0.5225372, 1.66109, -2.648537, 0, 0, 0, 1, 1,
-0.5167285, -1.469504, -2.753523, 0, 0, 0, 1, 1,
-0.5165014, -0.6394429, -0.8049663, 0, 0, 0, 1, 1,
-0.5089249, 0.4542278, -0.9174756, 0, 0, 0, 1, 1,
-0.5085206, 0.9088174, -1.378513, 0, 0, 0, 1, 1,
-0.5014892, 2.26802, 2.550939, 0, 0, 0, 1, 1,
-0.5007766, -0.2154004, -0.5680761, 0, 0, 0, 1, 1,
-0.5007524, 0.170546, -0.413711, 1, 1, 1, 1, 1,
-0.4980975, 0.6546231, 0.3832549, 1, 1, 1, 1, 1,
-0.4965956, -0.1196025, -3.021879, 1, 1, 1, 1, 1,
-0.489348, -1.396405, -3.999185, 1, 1, 1, 1, 1,
-0.4871112, -0.6734945, -2.747233, 1, 1, 1, 1, 1,
-0.4749527, 0.3276879, -0.1317694, 1, 1, 1, 1, 1,
-0.4744637, 0.1494355, -2.156272, 1, 1, 1, 1, 1,
-0.4734038, -0.4061641, -3.03548, 1, 1, 1, 1, 1,
-0.4687796, -1.738376, -2.500139, 1, 1, 1, 1, 1,
-0.468382, 0.7766992, -0.4080106, 1, 1, 1, 1, 1,
-0.4630532, -0.5233179, -2.754296, 1, 1, 1, 1, 1,
-0.462287, -0.8278901, -2.514109, 1, 1, 1, 1, 1,
-0.4614876, -0.2217854, -1.260717, 1, 1, 1, 1, 1,
-0.4595139, 0.5829116, -0.4808629, 1, 1, 1, 1, 1,
-0.4556369, -0.4561193, -3.548285, 1, 1, 1, 1, 1,
-0.4539936, -0.6734214, -2.903875, 0, 0, 1, 1, 1,
-0.452637, 0.5595109, -0.4641737, 1, 0, 0, 1, 1,
-0.4454643, -1.161634, -3.889884, 1, 0, 0, 1, 1,
-0.4436236, -1.219509, -2.618134, 1, 0, 0, 1, 1,
-0.442418, 0.4329574, -1.030558, 1, 0, 0, 1, 1,
-0.4416366, 0.9952209, -0.845086, 1, 0, 0, 1, 1,
-0.4363912, 0.6945385, -1.842224, 0, 0, 0, 1, 1,
-0.4360961, -0.258394, -3.107672, 0, 0, 0, 1, 1,
-0.4271015, 0.2730848, -0.8327345, 0, 0, 0, 1, 1,
-0.4223702, -0.8313271, -0.8307726, 0, 0, 0, 1, 1,
-0.4216937, 0.4146569, -2.37464, 0, 0, 0, 1, 1,
-0.4209631, 0.2921132, -0.9330189, 0, 0, 0, 1, 1,
-0.4195795, -0.2273696, -1.322706, 0, 0, 0, 1, 1,
-0.4139176, -0.8382847, -3.479071, 1, 1, 1, 1, 1,
-0.4111961, -0.1439675, -2.041611, 1, 1, 1, 1, 1,
-0.4073227, 0.1769898, -0.6055278, 1, 1, 1, 1, 1,
-0.4066848, -0.8258566, -1.666381, 1, 1, 1, 1, 1,
-0.4038801, -0.4782949, -2.443084, 1, 1, 1, 1, 1,
-0.3965924, 2.016041, -0.01283836, 1, 1, 1, 1, 1,
-0.3916867, 0.6023474, -1.25598, 1, 1, 1, 1, 1,
-0.3883075, -1.150489, -3.229169, 1, 1, 1, 1, 1,
-0.3872955, -0.4003646, -2.746902, 1, 1, 1, 1, 1,
-0.3847181, 1.148198, -0.03682859, 1, 1, 1, 1, 1,
-0.3832839, 0.5147738, -1.414241, 1, 1, 1, 1, 1,
-0.3832272, 0.4734714, -2.757801, 1, 1, 1, 1, 1,
-0.3810419, 0.2012201, -0.5007395, 1, 1, 1, 1, 1,
-0.3790993, -0.9540288, -2.600464, 1, 1, 1, 1, 1,
-0.3772088, 1.764419, -0.7556414, 1, 1, 1, 1, 1,
-0.3764391, -1.21196, -3.867015, 0, 0, 1, 1, 1,
-0.3724207, 0.4269559, 0.8608958, 1, 0, 0, 1, 1,
-0.3694327, 1.048573, 0.3268509, 1, 0, 0, 1, 1,
-0.3648839, -1.055717, -2.716976, 1, 0, 0, 1, 1,
-0.3624431, -0.2530458, -1.163177, 1, 0, 0, 1, 1,
-0.3516406, 0.394495, -2.064245, 1, 0, 0, 1, 1,
-0.3480485, 0.5437963, -0.686992, 0, 0, 0, 1, 1,
-0.3468601, 0.007496991, -3.225739, 0, 0, 0, 1, 1,
-0.3417113, -1.4932, -3.760906, 0, 0, 0, 1, 1,
-0.3388296, 0.6675678, 0.5081359, 0, 0, 0, 1, 1,
-0.3373659, -0.9168212, -2.64744, 0, 0, 0, 1, 1,
-0.3373273, -0.3656645, -1.451034, 0, 0, 0, 1, 1,
-0.3319314, -0.01014367, -2.15767, 0, 0, 0, 1, 1,
-0.3282861, -1.252172, -3.402827, 1, 1, 1, 1, 1,
-0.3278356, 1.053967, -0.9244078, 1, 1, 1, 1, 1,
-0.3269537, 1.556394, 0.05606389, 1, 1, 1, 1, 1,
-0.3116655, 0.6055528, -0.6902593, 1, 1, 1, 1, 1,
-0.3086194, -0.03895802, -3.620156, 1, 1, 1, 1, 1,
-0.3075691, -1.491855, -2.1393, 1, 1, 1, 1, 1,
-0.3053355, -0.3304807, -1.273652, 1, 1, 1, 1, 1,
-0.3038818, -0.7473738, -2.341422, 1, 1, 1, 1, 1,
-0.3038659, 2.148494, 0.4606126, 1, 1, 1, 1, 1,
-0.3020297, 0.2600034, -1.970021, 1, 1, 1, 1, 1,
-0.2923056, 0.2392026, 0.8287557, 1, 1, 1, 1, 1,
-0.2895702, -0.3684195, -2.86276, 1, 1, 1, 1, 1,
-0.2878492, -0.3173253, -1.225444, 1, 1, 1, 1, 1,
-0.2859283, -1.164241, -3.215692, 1, 1, 1, 1, 1,
-0.2828371, 0.0830506, 0.09076206, 1, 1, 1, 1, 1,
-0.2823854, 1.638717, -0.1489499, 0, 0, 1, 1, 1,
-0.2735414, 0.08733375, -1.194173, 1, 0, 0, 1, 1,
-0.2723454, -0.09904596, -1.3311, 1, 0, 0, 1, 1,
-0.2713447, -1.567434, -3.535213, 1, 0, 0, 1, 1,
-0.2620281, -1.645483, -2.512705, 1, 0, 0, 1, 1,
-0.2591609, 0.1865527, -0.05879661, 1, 0, 0, 1, 1,
-0.2540514, 0.05224991, -2.587855, 0, 0, 0, 1, 1,
-0.253601, -0.1785142, -1.193396, 0, 0, 0, 1, 1,
-0.2462765, 0.7623342, 1.040888, 0, 0, 0, 1, 1,
-0.2455888, 1.154957, -0.1768982, 0, 0, 0, 1, 1,
-0.2435432, -0.7728295, -0.4727023, 0, 0, 0, 1, 1,
-0.2391327, -0.05347119, -2.434251, 0, 0, 0, 1, 1,
-0.2387803, -0.7514243, -0.7859726, 0, 0, 0, 1, 1,
-0.2378578, 0.3298837, -2.571658, 1, 1, 1, 1, 1,
-0.2348102, 1.884693, 1.280362, 1, 1, 1, 1, 1,
-0.2331953, 1.699188, 0.2829258, 1, 1, 1, 1, 1,
-0.2290692, -1.740259, -4.249247, 1, 1, 1, 1, 1,
-0.2287687, -0.06639546, -2.116474, 1, 1, 1, 1, 1,
-0.2256311, 0.3116381, -0.3502823, 1, 1, 1, 1, 1,
-0.2256244, 0.4063926, 1.037225, 1, 1, 1, 1, 1,
-0.223537, -1.614247, -3.25494, 1, 1, 1, 1, 1,
-0.220202, 0.6316011, 0.9981543, 1, 1, 1, 1, 1,
-0.2170219, 0.8321388, -0.7414589, 1, 1, 1, 1, 1,
-0.2145701, -0.1642213, -1.158932, 1, 1, 1, 1, 1,
-0.2139112, 0.09067485, -1.533294, 1, 1, 1, 1, 1,
-0.2118807, -1.02879, -4.268957, 1, 1, 1, 1, 1,
-0.2118744, -0.7736613, -2.951378, 1, 1, 1, 1, 1,
-0.2029849, -0.2767562, -2.816303, 1, 1, 1, 1, 1,
-0.1993414, -0.8652962, -3.54153, 0, 0, 1, 1, 1,
-0.1952126, 0.7041891, 1.56631, 1, 0, 0, 1, 1,
-0.1938403, 0.08645318, -1.018104, 1, 0, 0, 1, 1,
-0.1931024, -0.1971162, -1.527562, 1, 0, 0, 1, 1,
-0.1929965, -0.8877581, -2.131863, 1, 0, 0, 1, 1,
-0.1835922, 1.664382, 1.255296, 1, 0, 0, 1, 1,
-0.1817288, 1.060158, -0.4078262, 0, 0, 0, 1, 1,
-0.1765954, 0.4283972, -1.553301, 0, 0, 0, 1, 1,
-0.1762029, -1.097341, -2.781232, 0, 0, 0, 1, 1,
-0.1723125, 1.07822, -1.122493, 0, 0, 0, 1, 1,
-0.1695762, 0.4685968, -0.0454007, 0, 0, 0, 1, 1,
-0.1668555, -1.378676, -2.293958, 0, 0, 0, 1, 1,
-0.1636981, -1.450588, -3.666543, 0, 0, 0, 1, 1,
-0.1601432, -1.556952, -1.969423, 1, 1, 1, 1, 1,
-0.1583588, -0.3033081, -4.037092, 1, 1, 1, 1, 1,
-0.157542, -0.1672302, -2.707938, 1, 1, 1, 1, 1,
-0.1557219, 0.9909219, 0.7022759, 1, 1, 1, 1, 1,
-0.1553262, 0.3322518, 0.392552, 1, 1, 1, 1, 1,
-0.1551635, 0.3232464, -0.5590692, 1, 1, 1, 1, 1,
-0.1534716, -1.725811, -2.140232, 1, 1, 1, 1, 1,
-0.1511427, 0.01007367, -1.541148, 1, 1, 1, 1, 1,
-0.1507761, -0.8335523, -2.242332, 1, 1, 1, 1, 1,
-0.1474244, -0.05475819, -2.280154, 1, 1, 1, 1, 1,
-0.1466704, 0.6239223, -0.6774927, 1, 1, 1, 1, 1,
-0.1433155, 0.7393762, -0.4060588, 1, 1, 1, 1, 1,
-0.1429283, 0.04533263, -1.008348, 1, 1, 1, 1, 1,
-0.1398356, 0.9301811, -0.6120677, 1, 1, 1, 1, 1,
-0.1383751, 0.3317226, -1.514209, 1, 1, 1, 1, 1,
-0.1377137, -0.892514, -2.340687, 0, 0, 1, 1, 1,
-0.1370142, -1.882971, -2.31032, 1, 0, 0, 1, 1,
-0.1366913, -1.431497, -4.571354, 1, 0, 0, 1, 1,
-0.1365847, 0.8149174, -0.7385419, 1, 0, 0, 1, 1,
-0.1360637, -0.9021945, -2.633974, 1, 0, 0, 1, 1,
-0.1360629, -0.1125086, -2.126462, 1, 0, 0, 1, 1,
-0.1350837, 0.06753808, -1.585772, 0, 0, 0, 1, 1,
-0.1346431, 1.739203, 0.1539681, 0, 0, 0, 1, 1,
-0.1341775, 0.8818547, 0.7466587, 0, 0, 0, 1, 1,
-0.1335566, 0.4050637, 0.2890256, 0, 0, 0, 1, 1,
-0.1227645, 0.2558329, 0.6165989, 0, 0, 0, 1, 1,
-0.1208556, 1.35766, 0.600583, 0, 0, 0, 1, 1,
-0.1205645, -0.8189827, -3.212387, 0, 0, 0, 1, 1,
-0.1178244, -1.115963, -2.384112, 1, 1, 1, 1, 1,
-0.106311, 0.7273559, -1.486459, 1, 1, 1, 1, 1,
-0.1058895, 0.290749, -2.013681, 1, 1, 1, 1, 1,
-0.1028363, 1.885724, -0.834014, 1, 1, 1, 1, 1,
-0.1017432, -1.348628, -2.791921, 1, 1, 1, 1, 1,
-0.1008737, -1.059438, -0.7889866, 1, 1, 1, 1, 1,
-0.09978124, -1.011803, -2.193514, 1, 1, 1, 1, 1,
-0.09832798, 0.4049785, -0.1457331, 1, 1, 1, 1, 1,
-0.09269144, 0.618309, -1.353572, 1, 1, 1, 1, 1,
-0.08835509, 1.076235, -0.3023101, 1, 1, 1, 1, 1,
-0.08575316, -0.223191, -2.337807, 1, 1, 1, 1, 1,
-0.08381813, -0.5179144, -3.640498, 1, 1, 1, 1, 1,
-0.0813013, -0.8412843, -3.46583, 1, 1, 1, 1, 1,
-0.07956692, -0.133855, -2.827177, 1, 1, 1, 1, 1,
-0.07713496, -1.228147, -4.227009, 1, 1, 1, 1, 1,
-0.0770072, 0.2635696, -0.9781229, 0, 0, 1, 1, 1,
-0.07619466, -1.563, -3.49188, 1, 0, 0, 1, 1,
-0.07365847, 2.146907, -0.1354914, 1, 0, 0, 1, 1,
-0.0732824, 0.2248615, -1.840253, 1, 0, 0, 1, 1,
-0.07319722, 1.76488, -2.160306, 1, 0, 0, 1, 1,
-0.06863395, 1.837849, -0.8177797, 1, 0, 0, 1, 1,
-0.0590204, 0.8735676, 0.3058877, 0, 0, 0, 1, 1,
-0.05492155, -1.254894, -4.230752, 0, 0, 0, 1, 1,
-0.05231772, 0.9486727, -1.234541, 0, 0, 0, 1, 1,
-0.04908791, 0.7321101, -1.898126, 0, 0, 0, 1, 1,
-0.04849644, 1.55267, -1.996557, 0, 0, 0, 1, 1,
-0.04541538, -1.43912, -1.09325, 0, 0, 0, 1, 1,
-0.04188077, 0.01451102, -2.47424, 0, 0, 0, 1, 1,
-0.0260279, 1.092938, -0.973166, 1, 1, 1, 1, 1,
-0.02356605, 0.0545816, -1.064497, 1, 1, 1, 1, 1,
-0.02184731, 0.2483734, -1.457377, 1, 1, 1, 1, 1,
-0.01641852, 0.1899248, 1.49305, 1, 1, 1, 1, 1,
-0.0134861, -0.4728357, -4.831924, 1, 1, 1, 1, 1,
-0.01151122, -0.8793558, -4.412735, 1, 1, 1, 1, 1,
-0.007745529, 0.5449945, -0.1588126, 1, 1, 1, 1, 1,
-0.004415498, 0.8450781, 0.7710655, 1, 1, 1, 1, 1,
-0.0002269437, 1.093043, 0.258681, 1, 1, 1, 1, 1,
0.005007819, 0.2921709, -0.9608111, 1, 1, 1, 1, 1,
0.00685555, -0.7728765, 2.253094, 1, 1, 1, 1, 1,
0.008767924, 0.510592, -0.8929058, 1, 1, 1, 1, 1,
0.02091656, 0.05060331, -2.110525, 1, 1, 1, 1, 1,
0.02763208, -0.3295659, 3.614352, 1, 1, 1, 1, 1,
0.02858682, 1.408358, 1.747771, 1, 1, 1, 1, 1,
0.03484325, -0.5454435, 2.490936, 0, 0, 1, 1, 1,
0.03503778, 0.3263678, 0.6690423, 1, 0, 0, 1, 1,
0.03524707, -0.5429971, 2.73319, 1, 0, 0, 1, 1,
0.03542989, -0.414436, 3.047858, 1, 0, 0, 1, 1,
0.03963808, -0.4236734, 3.416986, 1, 0, 0, 1, 1,
0.040654, 0.8177872, -0.5662818, 1, 0, 0, 1, 1,
0.04193069, 0.6827416, -0.3945496, 0, 0, 0, 1, 1,
0.04251937, 0.3611921, 2.633749, 0, 0, 0, 1, 1,
0.0500662, -0.5259284, 2.731558, 0, 0, 0, 1, 1,
0.05113091, -0.4126888, 4.50282, 0, 0, 0, 1, 1,
0.05783673, 0.4964663, 0.1167804, 0, 0, 0, 1, 1,
0.06173598, 0.735741, 0.3439694, 0, 0, 0, 1, 1,
0.06411068, -0.870231, 2.6935, 0, 0, 0, 1, 1,
0.06876501, 0.1646359, 1.143898, 1, 1, 1, 1, 1,
0.07161368, 1.34224, 0.0196285, 1, 1, 1, 1, 1,
0.07167621, -0.3320663, 3.543096, 1, 1, 1, 1, 1,
0.07174128, 0.4225973, -0.7338851, 1, 1, 1, 1, 1,
0.07183022, 0.4221393, 0.9683136, 1, 1, 1, 1, 1,
0.07396254, 2.41546, 0.8351715, 1, 1, 1, 1, 1,
0.0741377, 0.07705294, -0.2212427, 1, 1, 1, 1, 1,
0.07422671, 1.32835, -2.036666, 1, 1, 1, 1, 1,
0.07894253, -0.891611, 2.099109, 1, 1, 1, 1, 1,
0.07963654, 0.05056268, 1.89291, 1, 1, 1, 1, 1,
0.08002209, 0.03432121, 1.468025, 1, 1, 1, 1, 1,
0.08091537, 0.5149766, -0.8312705, 1, 1, 1, 1, 1,
0.08226275, 0.8942078, -0.7358509, 1, 1, 1, 1, 1,
0.08287205, -1.181348, 2.846427, 1, 1, 1, 1, 1,
0.09051012, -0.7521936, 1.242716, 1, 1, 1, 1, 1,
0.09267391, -0.3791187, 0.7544018, 0, 0, 1, 1, 1,
0.09604836, 0.919006, 0.613687, 1, 0, 0, 1, 1,
0.09621418, 1.052568, -0.4515294, 1, 0, 0, 1, 1,
0.09772535, -1.305314, 2.34435, 1, 0, 0, 1, 1,
0.1037141, -0.05543973, 2.396352, 1, 0, 0, 1, 1,
0.1063274, -0.4833956, 1.485948, 1, 0, 0, 1, 1,
0.1070056, -0.1937135, 2.351338, 0, 0, 0, 1, 1,
0.1078843, -1.057329, 1.743169, 0, 0, 0, 1, 1,
0.1102028, 1.001565, -0.6179584, 0, 0, 0, 1, 1,
0.112349, 0.8482875, -0.2554294, 0, 0, 0, 1, 1,
0.1170565, 0.3911074, -0.4570728, 0, 0, 0, 1, 1,
0.1196784, 1.188017, 0.29774, 0, 0, 0, 1, 1,
0.1268422, 0.8374465, 0.9691098, 0, 0, 0, 1, 1,
0.1295146, -0.5035801, 2.329538, 1, 1, 1, 1, 1,
0.1299224, 0.6577846, 0.0593579, 1, 1, 1, 1, 1,
0.1304562, -1.748984, 2.911521, 1, 1, 1, 1, 1,
0.1310095, 0.1372184, 2.091491, 1, 1, 1, 1, 1,
0.1312149, -0.08568939, 1.361232, 1, 1, 1, 1, 1,
0.1333236, -0.7272056, 2.696122, 1, 1, 1, 1, 1,
0.1347194, -0.3565182, 2.902758, 1, 1, 1, 1, 1,
0.135754, 1.439749, 0.6505195, 1, 1, 1, 1, 1,
0.1357673, 0.4564646, -0.2131424, 1, 1, 1, 1, 1,
0.1378429, -0.4282931, 2.320924, 1, 1, 1, 1, 1,
0.1381999, -0.3537175, 6.331456, 1, 1, 1, 1, 1,
0.1428023, -0.7850622, 3.187353, 1, 1, 1, 1, 1,
0.1491398, 2.175239, -0.5185993, 1, 1, 1, 1, 1,
0.1492475, -0.1215685, 3.143509, 1, 1, 1, 1, 1,
0.150841, -0.2170588, 1.201097, 1, 1, 1, 1, 1,
0.1523049, -1.330786, 3.586943, 0, 0, 1, 1, 1,
0.1551666, -0.9509319, 3.786419, 1, 0, 0, 1, 1,
0.1555222, -0.2159271, 1.635047, 1, 0, 0, 1, 1,
0.160363, 0.997399, -1.284505, 1, 0, 0, 1, 1,
0.1611086, -0.02087273, 1.391682, 1, 0, 0, 1, 1,
0.1621787, 0.5291029, -1.067955, 1, 0, 0, 1, 1,
0.1648543, -0.5741358, 3.255444, 0, 0, 0, 1, 1,
0.1688209, -0.403716, 4.497404, 0, 0, 0, 1, 1,
0.1710046, 1.722069, 1.147229, 0, 0, 0, 1, 1,
0.1723454, -2.10671, 1.955892, 0, 0, 0, 1, 1,
0.1746103, -0.03884283, 1.867561, 0, 0, 0, 1, 1,
0.1759273, 1.744748, 0.6695489, 0, 0, 0, 1, 1,
0.1770898, 0.3311506, -1.036241, 0, 0, 0, 1, 1,
0.1783343, 0.08844487, 1.61087, 1, 1, 1, 1, 1,
0.1783748, 1.006134, 0.04307402, 1, 1, 1, 1, 1,
0.1795829, -0.2307083, 2.750864, 1, 1, 1, 1, 1,
0.1796274, 0.5938879, 0.04586235, 1, 1, 1, 1, 1,
0.1809689, 0.1274872, 1.98603, 1, 1, 1, 1, 1,
0.1844922, 1.293406, 1.700445, 1, 1, 1, 1, 1,
0.1873918, 0.9182249, 2.319725, 1, 1, 1, 1, 1,
0.1890657, -0.6481452, 2.070714, 1, 1, 1, 1, 1,
0.1914265, -2.503985, 1.762902, 1, 1, 1, 1, 1,
0.194814, 0.4938884, 1.850936, 1, 1, 1, 1, 1,
0.2025109, -0.1165055, 2.49471, 1, 1, 1, 1, 1,
0.2034004, -1.127931, 2.283073, 1, 1, 1, 1, 1,
0.2174206, -1.31794, 2.463463, 1, 1, 1, 1, 1,
0.2182519, -0.7895323, 3.638164, 1, 1, 1, 1, 1,
0.2217901, -0.1879378, 2.716286, 1, 1, 1, 1, 1,
0.2226356, -1.097927, 3.08899, 0, 0, 1, 1, 1,
0.223393, -0.105808, 1.820113, 1, 0, 0, 1, 1,
0.2241009, 0.3428787, -0.2455211, 1, 0, 0, 1, 1,
0.2312531, -0.1287351, -0.4083194, 1, 0, 0, 1, 1,
0.2318511, 0.1848164, 0.7272363, 1, 0, 0, 1, 1,
0.2339498, 0.9626187, -1.259665, 1, 0, 0, 1, 1,
0.2346207, 0.05784388, 1.098223, 0, 0, 0, 1, 1,
0.2414279, -0.471228, 2.893572, 0, 0, 0, 1, 1,
0.2426959, 2.671538, 0.793148, 0, 0, 0, 1, 1,
0.2450676, -0.04087097, 1.172907, 0, 0, 0, 1, 1,
0.2452539, -1.982728, 1.278749, 0, 0, 0, 1, 1,
0.2494061, -0.2394564, 1.783038, 0, 0, 0, 1, 1,
0.2523626, 1.450326, -0.9843973, 0, 0, 0, 1, 1,
0.2539948, -1.040203, 4.527856, 1, 1, 1, 1, 1,
0.2593495, 0.3153173, 1.89335, 1, 1, 1, 1, 1,
0.2594208, -0.2441296, 2.776155, 1, 1, 1, 1, 1,
0.2640482, -0.3967676, 2.436246, 1, 1, 1, 1, 1,
0.2645719, -0.3131452, 1.944196, 1, 1, 1, 1, 1,
0.265918, -0.7691925, 2.094203, 1, 1, 1, 1, 1,
0.2700824, 2.1965, 0.1785955, 1, 1, 1, 1, 1,
0.2719663, 0.02669636, 1.140374, 1, 1, 1, 1, 1,
0.2742071, 1.697585, 1.41126, 1, 1, 1, 1, 1,
0.2802998, -1.111724, 2.622632, 1, 1, 1, 1, 1,
0.2804627, -1.262934, 1.902229, 1, 1, 1, 1, 1,
0.2813803, -0.5209348, 2.004541, 1, 1, 1, 1, 1,
0.2850781, -0.3145871, 3.554951, 1, 1, 1, 1, 1,
0.287425, 0.3505578, 1.688764, 1, 1, 1, 1, 1,
0.2876849, -0.8494537, 3.542123, 1, 1, 1, 1, 1,
0.2889455, 0.1191807, 0.484001, 0, 0, 1, 1, 1,
0.2928723, 0.9090329, 0.9526283, 1, 0, 0, 1, 1,
0.2956189, 0.1408912, 1.999204, 1, 0, 0, 1, 1,
0.2967112, 0.2764498, 0.2643518, 1, 0, 0, 1, 1,
0.2983671, 1.36016, -0.5098768, 1, 0, 0, 1, 1,
0.3020212, -1.106812, 2.634491, 1, 0, 0, 1, 1,
0.3031411, 0.05486741, 0.4903882, 0, 0, 0, 1, 1,
0.303598, 0.7504476, 1.367933, 0, 0, 0, 1, 1,
0.3053279, 0.3216191, 0.895238, 0, 0, 0, 1, 1,
0.3107898, -0.5052882, 1.544966, 0, 0, 0, 1, 1,
0.3131328, -0.3294924, 2.820524, 0, 0, 0, 1, 1,
0.3132561, 0.004127721, 2.098932, 0, 0, 0, 1, 1,
0.3141724, -1.187196, 4.122624, 0, 0, 0, 1, 1,
0.3143351, 0.3489193, 1.632157, 1, 1, 1, 1, 1,
0.316011, 0.9836798, 0.2293552, 1, 1, 1, 1, 1,
0.3176576, -1.078949, 1.778972, 1, 1, 1, 1, 1,
0.3196552, 0.1280188, 1.456787, 1, 1, 1, 1, 1,
0.3211384, 0.2243599, 0.1405896, 1, 1, 1, 1, 1,
0.3211916, -2.828789, 3.269941, 1, 1, 1, 1, 1,
0.3243986, -0.04614923, 1.002035, 1, 1, 1, 1, 1,
0.3247761, -0.283704, 1.882112, 1, 1, 1, 1, 1,
0.3274834, -0.4624649, 2.401695, 1, 1, 1, 1, 1,
0.3276587, -0.7064758, 3.28064, 1, 1, 1, 1, 1,
0.328887, -0.2777247, 4.484289, 1, 1, 1, 1, 1,
0.3310116, -0.3483936, 3.220472, 1, 1, 1, 1, 1,
0.3326281, 2.694131, -0.1142107, 1, 1, 1, 1, 1,
0.3352464, -0.2300456, 2.809741, 1, 1, 1, 1, 1,
0.341837, 0.9931784, -1.088943, 1, 1, 1, 1, 1,
0.3436761, 1.61571, -0.05999469, 0, 0, 1, 1, 1,
0.3441424, -0.7041351, 3.965436, 1, 0, 0, 1, 1,
0.3453436, 0.54659, -0.01820562, 1, 0, 0, 1, 1,
0.3522167, 0.6688355, 0.1822741, 1, 0, 0, 1, 1,
0.3530059, 0.8081437, -0.07409395, 1, 0, 0, 1, 1,
0.3538504, -0.6455374, 2.080117, 1, 0, 0, 1, 1,
0.3543262, 1.772937, 0.7725997, 0, 0, 0, 1, 1,
0.365891, -0.0790749, 1.644942, 0, 0, 0, 1, 1,
0.3668517, 1.556538, -0.03556341, 0, 0, 0, 1, 1,
0.368035, 1.790367, 1.456336, 0, 0, 0, 1, 1,
0.3698648, 0.6929072, 0.332709, 0, 0, 0, 1, 1,
0.3713691, -0.4649728, 3.713191, 0, 0, 0, 1, 1,
0.3730437, -1.153803, 2.660576, 0, 0, 0, 1, 1,
0.3805511, -0.6027265, 2.142298, 1, 1, 1, 1, 1,
0.3813039, 0.6518164, 1.61427, 1, 1, 1, 1, 1,
0.3861278, -0.2662, 1.779634, 1, 1, 1, 1, 1,
0.3873729, 0.9442428, -0.3021128, 1, 1, 1, 1, 1,
0.3950932, -0.4157979, 2.697204, 1, 1, 1, 1, 1,
0.3977424, -1.89205, 3.902881, 1, 1, 1, 1, 1,
0.3988408, -0.6685342, 0.735697, 1, 1, 1, 1, 1,
0.4013301, -0.5115929, 1.782557, 1, 1, 1, 1, 1,
0.4020568, 1.301572, -0.05281218, 1, 1, 1, 1, 1,
0.4078602, -0.7812296, 4.117448, 1, 1, 1, 1, 1,
0.4079443, -0.5211958, 2.025757, 1, 1, 1, 1, 1,
0.4129625, -0.8553001, -0.1929607, 1, 1, 1, 1, 1,
0.4168932, -1.257569, 4.935494, 1, 1, 1, 1, 1,
0.4169217, -1.390937, 4.112856, 1, 1, 1, 1, 1,
0.4183883, -0.2136836, 0.8612801, 1, 1, 1, 1, 1,
0.424972, 0.3445583, 0.3315386, 0, 0, 1, 1, 1,
0.4252196, 0.1122946, 1.89245, 1, 0, 0, 1, 1,
0.4264958, -0.2575267, 1.218017, 1, 0, 0, 1, 1,
0.4279981, 0.2968391, 2.759244, 1, 0, 0, 1, 1,
0.4372254, 2.088269, -1.434519, 1, 0, 0, 1, 1,
0.4416498, -0.2497461, 2.690848, 1, 0, 0, 1, 1,
0.4428681, 0.5039505, 0.9880725, 0, 0, 0, 1, 1,
0.4437599, 0.803715, 0.3507233, 0, 0, 0, 1, 1,
0.4437732, 0.1205482, 0.9108194, 0, 0, 0, 1, 1,
0.4441133, -1.21847, 2.099208, 0, 0, 0, 1, 1,
0.4486066, -0.8843152, 3.80481, 0, 0, 0, 1, 1,
0.4521651, 0.06582864, 2.91978, 0, 0, 0, 1, 1,
0.4554857, 1.449703, -0.5139205, 0, 0, 0, 1, 1,
0.4564447, -0.8650012, 4.026604, 1, 1, 1, 1, 1,
0.458355, 0.7437414, 1.280624, 1, 1, 1, 1, 1,
0.4593519, -1.039789, 2.714912, 1, 1, 1, 1, 1,
0.4616489, 0.9584827, 0.9187414, 1, 1, 1, 1, 1,
0.4648633, 0.1343002, 0.6723379, 1, 1, 1, 1, 1,
0.4678994, 0.0008396361, 0.242767, 1, 1, 1, 1, 1,
0.4704735, -0.5154337, 2.927231, 1, 1, 1, 1, 1,
0.474474, 0.3114966, -0.3809549, 1, 1, 1, 1, 1,
0.4751669, 0.4733524, -0.8477311, 1, 1, 1, 1, 1,
0.4780123, 0.2499002, 0.6591629, 1, 1, 1, 1, 1,
0.4788241, -0.445363, 2.931615, 1, 1, 1, 1, 1,
0.4792616, -0.447939, 3.518358, 1, 1, 1, 1, 1,
0.4799238, 1.128376, -0.3125099, 1, 1, 1, 1, 1,
0.4816716, 0.09226932, 0.3173365, 1, 1, 1, 1, 1,
0.4821129, -0.7983515, 2.699579, 1, 1, 1, 1, 1,
0.4856516, 0.1180977, 1.625439, 0, 0, 1, 1, 1,
0.4893847, 0.4008496, 0.3445044, 1, 0, 0, 1, 1,
0.4895653, 0.4210552, 0.7961897, 1, 0, 0, 1, 1,
0.4939315, -1.868208, 2.883247, 1, 0, 0, 1, 1,
0.4954236, -0.9966744, 0.5295159, 1, 0, 0, 1, 1,
0.5003161, 0.218356, 0.9059548, 1, 0, 0, 1, 1,
0.5008435, -2.129828, 2.299159, 0, 0, 0, 1, 1,
0.5073094, 0.06921455, 0.4667753, 0, 0, 0, 1, 1,
0.5099081, 0.630151, 2.98089, 0, 0, 0, 1, 1,
0.510801, 1.273307, -0.922792, 0, 0, 0, 1, 1,
0.5116901, 1.223985, -0.6658787, 0, 0, 0, 1, 1,
0.5139965, -1.20992, 1.473748, 0, 0, 0, 1, 1,
0.5148623, 0.8469718, -1.102654, 0, 0, 0, 1, 1,
0.5150418, 0.2653495, 1.281845, 1, 1, 1, 1, 1,
0.520372, 0.363719, 3.125678, 1, 1, 1, 1, 1,
0.5238065, 0.3698299, -0.5993823, 1, 1, 1, 1, 1,
0.5254384, -1.161908, 2.82137, 1, 1, 1, 1, 1,
0.5267429, 0.8275447, -0.8704289, 1, 1, 1, 1, 1,
0.5281492, -0.6787216, 1.932749, 1, 1, 1, 1, 1,
0.5375145, -1.054381, 2.897685, 1, 1, 1, 1, 1,
0.539542, 0.07790361, 2.771103, 1, 1, 1, 1, 1,
0.5426553, -0.3787547, 1.050082, 1, 1, 1, 1, 1,
0.5470776, 0.9056295, 0.05461478, 1, 1, 1, 1, 1,
0.547767, -0.7644718, 4.217467, 1, 1, 1, 1, 1,
0.5489108, 1.194465, 1.581837, 1, 1, 1, 1, 1,
0.5506685, -1.240195, 0.9072726, 1, 1, 1, 1, 1,
0.5522885, -1.567629, 4.34205, 1, 1, 1, 1, 1,
0.5524129, 0.2090467, 0.3498568, 1, 1, 1, 1, 1,
0.5533892, 0.006379092, 0.8854231, 0, 0, 1, 1, 1,
0.5545284, 0.8601589, 2.022849, 1, 0, 0, 1, 1,
0.5604299, -1.771926, 3.821106, 1, 0, 0, 1, 1,
0.5613898, -1.391298, 2.813308, 1, 0, 0, 1, 1,
0.5631413, -0.4371513, 0.4355003, 1, 0, 0, 1, 1,
0.5645511, -0.0843437, 2.763287, 1, 0, 0, 1, 1,
0.5665674, 0.5279955, 1.267231, 0, 0, 0, 1, 1,
0.5676302, -0.4660154, 2.720611, 0, 0, 0, 1, 1,
0.5683663, -0.3581023, 2.986027, 0, 0, 0, 1, 1,
0.5708777, 0.6616362, 1.553683, 0, 0, 0, 1, 1,
0.5711794, -1.26492, 2.86714, 0, 0, 0, 1, 1,
0.5726679, -0.1288948, 2.941778, 0, 0, 0, 1, 1,
0.5728701, -0.620806, 4.201379, 0, 0, 0, 1, 1,
0.5736436, 0.4847686, 0.4713577, 1, 1, 1, 1, 1,
0.5744114, -0.3531245, 2.109243, 1, 1, 1, 1, 1,
0.5774599, -0.06727795, 1.174884, 1, 1, 1, 1, 1,
0.5806977, -0.384748, 2.306606, 1, 1, 1, 1, 1,
0.5845018, 1.598414, 1.128219, 1, 1, 1, 1, 1,
0.5900473, -1.044536, 2.584366, 1, 1, 1, 1, 1,
0.5902971, 0.5510653, 0.4371848, 1, 1, 1, 1, 1,
0.5908903, -0.2165008, 0.9112223, 1, 1, 1, 1, 1,
0.5995188, 0.5939858, 0.5149176, 1, 1, 1, 1, 1,
0.5999665, 0.4968058, 0.4637472, 1, 1, 1, 1, 1,
0.6024063, -0.3467561, 2.296457, 1, 1, 1, 1, 1,
0.6031283, 0.2075752, 0.4671843, 1, 1, 1, 1, 1,
0.6070014, -0.3881434, 1.533176, 1, 1, 1, 1, 1,
0.6072726, 0.07451218, 2.187739, 1, 1, 1, 1, 1,
0.6085316, -0.1801936, 0.6413812, 1, 1, 1, 1, 1,
0.6148747, -0.6041527, 3.016602, 0, 0, 1, 1, 1,
0.6296259, -1.480029, 2.041764, 1, 0, 0, 1, 1,
0.6335124, -0.5655404, 0.6410478, 1, 0, 0, 1, 1,
0.6383638, 0.9026042, -0.3072227, 1, 0, 0, 1, 1,
0.640617, 1.215234, 0.6324789, 1, 0, 0, 1, 1,
0.6430231, 1.098674, -0.03050006, 1, 0, 0, 1, 1,
0.6446071, 1.026557, 0.8662344, 0, 0, 0, 1, 1,
0.6467298, 0.7248801, -0.7223713, 0, 0, 0, 1, 1,
0.6477025, 0.171071, 0.5658443, 0, 0, 0, 1, 1,
0.6536586, 0.7413871, -0.3030389, 0, 0, 0, 1, 1,
0.6632102, 0.447797, 1.606643, 0, 0, 0, 1, 1,
0.665561, -1.098189, 2.321156, 0, 0, 0, 1, 1,
0.6659475, -0.2918634, 2.103513, 0, 0, 0, 1, 1,
0.6697333, -1.621278, 2.024222, 1, 1, 1, 1, 1,
0.6760247, -1.695798, 3.318485, 1, 1, 1, 1, 1,
0.6765491, -0.7538419, 1.531992, 1, 1, 1, 1, 1,
0.6778114, 0.491947, 0.4043095, 1, 1, 1, 1, 1,
0.6790926, 1.341845, -0.8845133, 1, 1, 1, 1, 1,
0.6801416, 0.599152, 1.644087, 1, 1, 1, 1, 1,
0.6851506, 1.512467, 0.08441167, 1, 1, 1, 1, 1,
0.6902333, 0.3589057, 2.927635, 1, 1, 1, 1, 1,
0.6957791, 2.379976, 0.08841926, 1, 1, 1, 1, 1,
0.7021283, 0.9677734, 1.113275, 1, 1, 1, 1, 1,
0.7029446, 0.003855459, 2.396165, 1, 1, 1, 1, 1,
0.7093034, -1.970535, 1.668271, 1, 1, 1, 1, 1,
0.7123902, 1.047283, 0.5210508, 1, 1, 1, 1, 1,
0.7125852, 1.514344, 0.5759259, 1, 1, 1, 1, 1,
0.7191247, -2.172743, 1.993816, 1, 1, 1, 1, 1,
0.7198787, -0.6865271, 2.626847, 0, 0, 1, 1, 1,
0.7213251, 0.8182556, 0.4106017, 1, 0, 0, 1, 1,
0.7234831, 0.9637023, 0.7500024, 1, 0, 0, 1, 1,
0.7259191, -1.059918, 1.355157, 1, 0, 0, 1, 1,
0.7279966, 0.3530254, 1.848187, 1, 0, 0, 1, 1,
0.7290798, -0.9764166, 2.676653, 1, 0, 0, 1, 1,
0.7306162, 0.3076577, 0.5702925, 0, 0, 0, 1, 1,
0.7358493, -1.068266, 2.773007, 0, 0, 0, 1, 1,
0.7394769, -0.6272617, 3.205, 0, 0, 0, 1, 1,
0.7395791, -2.151781, 3.357765, 0, 0, 0, 1, 1,
0.7455932, -0.614969, 3.099532, 0, 0, 0, 1, 1,
0.7473406, -1.225695, 1.412537, 0, 0, 0, 1, 1,
0.7584748, 0.3751476, -0.6022978, 0, 0, 0, 1, 1,
0.7587958, -0.5203609, 3.368896, 1, 1, 1, 1, 1,
0.7596616, -0.338329, 1.270169, 1, 1, 1, 1, 1,
0.7653416, -0.5834903, 3.120095, 1, 1, 1, 1, 1,
0.7707202, -1.463557, 2.837591, 1, 1, 1, 1, 1,
0.7707659, -0.8251439, 2.573764, 1, 1, 1, 1, 1,
0.7708046, 0.4424356, 0.5427402, 1, 1, 1, 1, 1,
0.7729534, -0.3374618, 2.910269, 1, 1, 1, 1, 1,
0.7751597, 1.314525, 0.5336568, 1, 1, 1, 1, 1,
0.7770321, 0.5891271, 2.803081, 1, 1, 1, 1, 1,
0.7771118, 1.319441, 1.360034, 1, 1, 1, 1, 1,
0.7794266, -0.7615299, 1.388995, 1, 1, 1, 1, 1,
0.7814148, 0.6741537, 0.6368558, 1, 1, 1, 1, 1,
0.7834205, -0.7224082, 3.504876, 1, 1, 1, 1, 1,
0.7883108, 0.7544193, 0.8909279, 1, 1, 1, 1, 1,
0.7930514, 0.2595403, 3.072711, 1, 1, 1, 1, 1,
0.7938462, -0.5353297, 1.25027, 0, 0, 1, 1, 1,
0.7942904, 0.9286801, 0.4723037, 1, 0, 0, 1, 1,
0.8047456, 0.4244612, 0.4837717, 1, 0, 0, 1, 1,
0.805075, 1.203707, 0.7194517, 1, 0, 0, 1, 1,
0.8055655, 0.2179625, 0.7135977, 1, 0, 0, 1, 1,
0.806419, 0.7588957, -0.2757852, 1, 0, 0, 1, 1,
0.8091238, 1.81417, 0.3155953, 0, 0, 0, 1, 1,
0.8126507, -1.047742, 3.541031, 0, 0, 0, 1, 1,
0.8149486, 0.2333732, 1.165424, 0, 0, 0, 1, 1,
0.8180997, -0.6478746, 2.24332, 0, 0, 0, 1, 1,
0.8229373, -1.360505, 3.274193, 0, 0, 0, 1, 1,
0.8231877, -0.5372998, 3.176166, 0, 0, 0, 1, 1,
0.8259816, 0.9550139, 0.9525511, 0, 0, 0, 1, 1,
0.8346207, -0.5757123, 2.246682, 1, 1, 1, 1, 1,
0.8376504, 1.137272, 1.412834, 1, 1, 1, 1, 1,
0.8411264, -0.7690195, 2.820622, 1, 1, 1, 1, 1,
0.842644, 1.699619, 1.232943, 1, 1, 1, 1, 1,
0.8427051, 0.06287424, 0.5973672, 1, 1, 1, 1, 1,
0.8660609, 1.296519, -0.2133355, 1, 1, 1, 1, 1,
0.869502, 0.4369505, 0.4602107, 1, 1, 1, 1, 1,
0.8751453, 1.212361, 1.320437, 1, 1, 1, 1, 1,
0.8770588, 0.2803423, 0.5070263, 1, 1, 1, 1, 1,
0.877194, -0.9206483, 3.392012, 1, 1, 1, 1, 1,
0.8785294, -0.5798452, 0.01730889, 1, 1, 1, 1, 1,
0.8799232, -1.108735, 1.968634, 1, 1, 1, 1, 1,
0.8805382, 0.2519506, 0.9446475, 1, 1, 1, 1, 1,
0.8848205, 1.309168, -1.348265, 1, 1, 1, 1, 1,
0.8864753, -0.1673751, 1.943741, 1, 1, 1, 1, 1,
0.8889495, 0.8029522, 1.675711, 0, 0, 1, 1, 1,
0.8929738, 1.109899, 0.7142213, 1, 0, 0, 1, 1,
0.8935791, 0.6467493, 2.012048, 1, 0, 0, 1, 1,
0.8964727, 0.06734048, 2.134797, 1, 0, 0, 1, 1,
0.8991957, -1.431647, 2.818997, 1, 0, 0, 1, 1,
0.904816, 0.6593444, -0.01253981, 1, 0, 0, 1, 1,
0.9220352, -1.383872, 2.413634, 0, 0, 0, 1, 1,
0.9232669, -2.197583, 3.174049, 0, 0, 0, 1, 1,
0.927579, 2.01283, 1.102834, 0, 0, 0, 1, 1,
0.9305503, 0.4091395, 1.267439, 0, 0, 0, 1, 1,
0.9346062, -1.468539, 2.068872, 0, 0, 0, 1, 1,
0.9403923, -0.6694224, 1.532151, 0, 0, 0, 1, 1,
0.9424664, 0.7054539, 0.1034418, 0, 0, 0, 1, 1,
0.9464847, 0.7835635, 2.145432, 1, 1, 1, 1, 1,
0.9474505, 1.668411, 0.4506109, 1, 1, 1, 1, 1,
0.9523281, 0.2066029, 0.9764025, 1, 1, 1, 1, 1,
0.9525623, -0.5124881, 3.211605, 1, 1, 1, 1, 1,
0.9560809, -1.090103, 2.241306, 1, 1, 1, 1, 1,
0.9579287, -0.5250027, 0.8258572, 1, 1, 1, 1, 1,
0.9591767, -0.2839406, 2.776168, 1, 1, 1, 1, 1,
0.9641653, 0.05277629, 1.633853, 1, 1, 1, 1, 1,
0.9679651, -0.5036031, 1.686548, 1, 1, 1, 1, 1,
0.9699953, -0.666747, 1.75148, 1, 1, 1, 1, 1,
0.9711047, 1.610834, 1.417858, 1, 1, 1, 1, 1,
0.9714665, -1.419162, 3.242228, 1, 1, 1, 1, 1,
0.9777572, -0.5509557, 2.391263, 1, 1, 1, 1, 1,
0.9784855, -0.8887151, 2.534483, 1, 1, 1, 1, 1,
0.9825602, -0.2822959, 1.827571, 1, 1, 1, 1, 1,
0.9839609, 1.150913, 0.3237963, 0, 0, 1, 1, 1,
0.9859065, -0.8463892, 3.742544, 1, 0, 0, 1, 1,
0.9860261, 0.008882388, 0.8481254, 1, 0, 0, 1, 1,
0.9886227, 0.05530272, 1.653605, 1, 0, 0, 1, 1,
0.9917708, 0.08420232, 1.915864, 1, 0, 0, 1, 1,
0.994372, 0.8074331, 0.4288098, 1, 0, 0, 1, 1,
1.002486, -0.3522518, 1.499225, 0, 0, 0, 1, 1,
1.01916, 0.9579955, 2.091359, 0, 0, 0, 1, 1,
1.022398, 0.6252623, 1.46433, 0, 0, 0, 1, 1,
1.024342, -0.5692734, 2.736736, 0, 0, 0, 1, 1,
1.025975, 0.02453678, 0.9644554, 0, 0, 0, 1, 1,
1.026643, -1.286599, 2.519202, 0, 0, 0, 1, 1,
1.035083, 1.570591, -0.08799434, 0, 0, 0, 1, 1,
1.039025, 1.582911, 1.746551, 1, 1, 1, 1, 1,
1.044928, -0.7550277, 2.421014, 1, 1, 1, 1, 1,
1.049152, -0.7966877, -0.9951972, 1, 1, 1, 1, 1,
1.050456, 0.3339932, 1.768574, 1, 1, 1, 1, 1,
1.05257, -0.2182105, 2.506353, 1, 1, 1, 1, 1,
1.054641, 1.70512, 0.7675708, 1, 1, 1, 1, 1,
1.054786, 0.2542118, 1.601166, 1, 1, 1, 1, 1,
1.055588, -0.4507778, 2.277166, 1, 1, 1, 1, 1,
1.058856, -1.371533, 1.108812, 1, 1, 1, 1, 1,
1.059062, 1.253761, -1.167997, 1, 1, 1, 1, 1,
1.061473, -0.7262097, 1.623915, 1, 1, 1, 1, 1,
1.064119, -0.8575243, 2.312979, 1, 1, 1, 1, 1,
1.069351, 0.9913414, 1.695692, 1, 1, 1, 1, 1,
1.070545, -1.862152, 2.104491, 1, 1, 1, 1, 1,
1.074749, 1.953488, -0.07694896, 1, 1, 1, 1, 1,
1.077025, 0.9131842, 0.3477707, 0, 0, 1, 1, 1,
1.087849, -0.1612943, 2.305851, 1, 0, 0, 1, 1,
1.088337, 1.513182, 0.9239153, 1, 0, 0, 1, 1,
1.088497, 0.6610414, 1.016877, 1, 0, 0, 1, 1,
1.090826, -0.7519211, 1.400792, 1, 0, 0, 1, 1,
1.094069, -1.012977, 0.9674739, 1, 0, 0, 1, 1,
1.100396, 1.84492, 0.4624743, 0, 0, 0, 1, 1,
1.103594, 0.2365712, 1.476404, 0, 0, 0, 1, 1,
1.103671, -0.5495117, 1.64955, 0, 0, 0, 1, 1,
1.103897, 1.536529, 0.5093504, 0, 0, 0, 1, 1,
1.124588, 0.709056, 2.122102, 0, 0, 0, 1, 1,
1.126431, -2.848731, 2.050263, 0, 0, 0, 1, 1,
1.129128, 1.676452, -0.6653124, 0, 0, 0, 1, 1,
1.131532, -0.7088665, 2.645335, 1, 1, 1, 1, 1,
1.139883, -0.5502578, 1.546303, 1, 1, 1, 1, 1,
1.145763, 0.8306299, -0.9477314, 1, 1, 1, 1, 1,
1.154457, -0.5402745, 1.439533, 1, 1, 1, 1, 1,
1.161722, -0.5096005, 2.074491, 1, 1, 1, 1, 1,
1.164324, -0.2719215, 2.249169, 1, 1, 1, 1, 1,
1.171828, -0.6164771, 2.52732, 1, 1, 1, 1, 1,
1.176209, 1.214731, -0.5009959, 1, 1, 1, 1, 1,
1.184577, 1.190059, 1.681205, 1, 1, 1, 1, 1,
1.185304, 0.2801641, 0.5750832, 1, 1, 1, 1, 1,
1.188244, 1.074551, -0.3770276, 1, 1, 1, 1, 1,
1.189545, -1.352413, 2.654146, 1, 1, 1, 1, 1,
1.198838, 0.01424459, 2.105508, 1, 1, 1, 1, 1,
1.208453, -0.2965583, 0.3460301, 1, 1, 1, 1, 1,
1.209327, 0.2257447, 4.326184, 1, 1, 1, 1, 1,
1.217705, 1.647814, -1.381063, 0, 0, 1, 1, 1,
1.218144, 1.498262, 0.2121027, 1, 0, 0, 1, 1,
1.22024, 0.00376084, 2.232127, 1, 0, 0, 1, 1,
1.237963, 1.513878, 1.465446, 1, 0, 0, 1, 1,
1.239105, 0.008836157, 1.85544, 1, 0, 0, 1, 1,
1.243894, 0.6414903, 0.5123118, 1, 0, 0, 1, 1,
1.245013, -0.09912433, 2.728916, 0, 0, 0, 1, 1,
1.246392, 0.1067232, 1.315477, 0, 0, 0, 1, 1,
1.252231, 0.7800508, -0.9629248, 0, 0, 0, 1, 1,
1.252576, -2.642243, 1.561374, 0, 0, 0, 1, 1,
1.252829, 0.4218116, 1.26145, 0, 0, 0, 1, 1,
1.262652, -1.220073, 2.328445, 0, 0, 0, 1, 1,
1.275573, 1.149339, 2.329337, 0, 0, 0, 1, 1,
1.281899, 0.4075079, 1.207376, 1, 1, 1, 1, 1,
1.295771, -0.5917, 3.144843, 1, 1, 1, 1, 1,
1.306938, -1.361324, 4.561671, 1, 1, 1, 1, 1,
1.309477, -1.410952, 3.043113, 1, 1, 1, 1, 1,
1.31034, -1.820837, 1.55252, 1, 1, 1, 1, 1,
1.313834, 0.08245915, 2.347968, 1, 1, 1, 1, 1,
1.315655, 1.275566, 0.611223, 1, 1, 1, 1, 1,
1.317143, 0.500536, 1.74817, 1, 1, 1, 1, 1,
1.320834, 2.115428, -0.2451356, 1, 1, 1, 1, 1,
1.334762, -1.403504, 4.402321, 1, 1, 1, 1, 1,
1.352141, -0.02684488, 0.8958474, 1, 1, 1, 1, 1,
1.360337, -0.07397023, 2.14513, 1, 1, 1, 1, 1,
1.364462, 0.003113132, 0.3302094, 1, 1, 1, 1, 1,
1.374124, -0.3952781, 2.401135, 1, 1, 1, 1, 1,
1.384095, 0.1177285, 2.085809, 1, 1, 1, 1, 1,
1.384806, -0.03661076, 2.152979, 0, 0, 1, 1, 1,
1.411582, 2.125568, 1.533669, 1, 0, 0, 1, 1,
1.421602, 0.9559457, 2.177898, 1, 0, 0, 1, 1,
1.427512, -1.492469, 3.471005, 1, 0, 0, 1, 1,
1.437382, 0.4619995, -0.2117162, 1, 0, 0, 1, 1,
1.439761, 1.284874, -0.2869281, 1, 0, 0, 1, 1,
1.444922, 1.182877, 1.052419, 0, 0, 0, 1, 1,
1.44513, 1.274945, -0.1155457, 0, 0, 0, 1, 1,
1.452217, 0.07422002, 2.99778, 0, 0, 0, 1, 1,
1.467963, -1.648002, 4.416658, 0, 0, 0, 1, 1,
1.478676, -1.034933, 2.549908, 0, 0, 0, 1, 1,
1.48146, 0.7782306, 1.156425, 0, 0, 0, 1, 1,
1.49281, 1.12622, 0.7612266, 0, 0, 0, 1, 1,
1.493258, 0.1677629, 1.041299, 1, 1, 1, 1, 1,
1.493646, -2.115007, 0.977547, 1, 1, 1, 1, 1,
1.504773, 0.4896839, 1.736606, 1, 1, 1, 1, 1,
1.506081, 0.3996843, 1.759924, 1, 1, 1, 1, 1,
1.510457, -0.4048294, -0.1035612, 1, 1, 1, 1, 1,
1.512441, 0.4538932, 1.113646, 1, 1, 1, 1, 1,
1.514006, 0.3943051, 0.7695215, 1, 1, 1, 1, 1,
1.527513, -0.6055875, 2.47813, 1, 1, 1, 1, 1,
1.536615, 1.236917, 1.770156, 1, 1, 1, 1, 1,
1.538145, 0.5482389, 2.120872, 1, 1, 1, 1, 1,
1.56341, -0.6573507, 0.4644211, 1, 1, 1, 1, 1,
1.563511, 0.6292358, 1.690446, 1, 1, 1, 1, 1,
1.574755, 0.9920632, -0.4083582, 1, 1, 1, 1, 1,
1.574762, 1.126634, 1.79328, 1, 1, 1, 1, 1,
1.587425, -0.3564928, 3.682113, 1, 1, 1, 1, 1,
1.596776, -0.452742, 1.091963, 0, 0, 1, 1, 1,
1.622672, 0.2834187, 1.121515, 1, 0, 0, 1, 1,
1.64427, 0.03057696, 2.481202, 1, 0, 0, 1, 1,
1.665589, -0.8370885, 2.748463, 1, 0, 0, 1, 1,
1.68734, 0.5382348, -0.1247865, 1, 0, 0, 1, 1,
1.692527, -0.3513639, 0.01358528, 1, 0, 0, 1, 1,
1.702722, -0.3236173, 2.965663, 0, 0, 0, 1, 1,
1.717813, -0.5799994, 1.411533, 0, 0, 0, 1, 1,
1.720333, 1.286113, 1.276262, 0, 0, 0, 1, 1,
1.73635, -1.173565, 1.702178, 0, 0, 0, 1, 1,
1.737265, -1.537254, 1.731333, 0, 0, 0, 1, 1,
1.740018, -0.6593451, -0.03167104, 0, 0, 0, 1, 1,
1.745393, -1.532612, 0.4613811, 0, 0, 0, 1, 1,
1.747132, 1.970914, 0.10228, 1, 1, 1, 1, 1,
1.748242, 1.971433, 1.193704, 1, 1, 1, 1, 1,
1.749612, -1.448917, 4.052715, 1, 1, 1, 1, 1,
1.754675, 0.4972003, 2.838837, 1, 1, 1, 1, 1,
1.768651, -0.2952747, 1.106286, 1, 1, 1, 1, 1,
1.786467, -0.1762096, 2.12806, 1, 1, 1, 1, 1,
1.794819, 0.6488258, 0.9445328, 1, 1, 1, 1, 1,
1.802718, 1.012553, 1.705852, 1, 1, 1, 1, 1,
1.818412, 0.3681109, 1.946712, 1, 1, 1, 1, 1,
1.833893, -0.3707961, 3.242253, 1, 1, 1, 1, 1,
1.861263, -0.01685227, 2.162083, 1, 1, 1, 1, 1,
1.871779, -0.0213362, 0.4675317, 1, 1, 1, 1, 1,
1.872481, -0.3452995, 3.705072, 1, 1, 1, 1, 1,
1.878127, -0.03230982, 2.544, 1, 1, 1, 1, 1,
1.897927, 0.2223274, 2.525058, 1, 1, 1, 1, 1,
1.917324, -0.607361, 1.362841, 0, 0, 1, 1, 1,
1.92836, 1.187868, 2.665387, 1, 0, 0, 1, 1,
1.938247, -0.03613011, 2.682889, 1, 0, 0, 1, 1,
1.953434, -0.2783247, 2.971283, 1, 0, 0, 1, 1,
1.995174, -0.6821342, 1.75106, 1, 0, 0, 1, 1,
2.012795, -0.8031874, 2.149117, 1, 0, 0, 1, 1,
2.032952, -1.358985, 2.886835, 0, 0, 0, 1, 1,
2.051709, -0.8945699, 0.3032501, 0, 0, 0, 1, 1,
2.068825, 0.3837596, 0.8661468, 0, 0, 0, 1, 1,
2.083577, 0.5844191, 2.841894, 0, 0, 0, 1, 1,
2.12847, 0.04545974, 1.095605, 0, 0, 0, 1, 1,
2.158488, 0.334327, 1.423784, 0, 0, 0, 1, 1,
2.162572, 0.6343338, 0.5212752, 0, 0, 0, 1, 1,
2.162614, -0.1276518, 2.533393, 1, 1, 1, 1, 1,
2.430061, 0.6577785, 1.199736, 1, 1, 1, 1, 1,
2.535083, 0.5962216, 0.6936153, 1, 1, 1, 1, 1,
2.723056, 0.1896195, 2.848126, 1, 1, 1, 1, 1,
2.790193, 0.06969763, 1.770612, 1, 1, 1, 1, 1,
2.801309, 0.2012784, 1.294829, 1, 1, 1, 1, 1,
2.883918, -1.290131, 0.2836224, 1, 1, 1, 1, 1
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
var radius = 10.10622;
var distance = 35.49766;
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
mvMatrix.translate( 0.3845221, 0.07730007, -0.122689 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.49766);
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
