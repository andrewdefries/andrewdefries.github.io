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
-2.807475, 0.7231984, -1.706826, 1, 0, 0, 1,
-2.754112, 2.162512, -0.4769547, 1, 0.007843138, 0, 1,
-2.613682, 0.8295676, -1.23805, 1, 0.01176471, 0, 1,
-2.569009, 0.9876019, -1.989762, 1, 0.01960784, 0, 1,
-2.414812, -2.523514, -0.5939744, 1, 0.02352941, 0, 1,
-2.319263, 1.299283, -2.609349, 1, 0.03137255, 0, 1,
-2.294671, -0.1836976, -0.6395559, 1, 0.03529412, 0, 1,
-2.289874, -0.5899394, -0.474746, 1, 0.04313726, 0, 1,
-2.289003, -0.7572244, -1.727904, 1, 0.04705882, 0, 1,
-2.274634, -1.395782, -1.682382, 1, 0.05490196, 0, 1,
-2.237876, 0.4562196, -0.2288995, 1, 0.05882353, 0, 1,
-2.231514, 0.5954486, -0.1537624, 1, 0.06666667, 0, 1,
-2.231076, -0.3635103, -0.9232429, 1, 0.07058824, 0, 1,
-2.112875, 0.1035444, -2.095757, 1, 0.07843138, 0, 1,
-2.083334, 2.03332, -1.783278, 1, 0.08235294, 0, 1,
-2.046772, 1.504296, 0.6262593, 1, 0.09019608, 0, 1,
-2.046371, -1.062642, -2.407573, 1, 0.09411765, 0, 1,
-2.016756, -0.0903394, -1.532203, 1, 0.1019608, 0, 1,
-2.004879, -0.6205502, -0.2733172, 1, 0.1098039, 0, 1,
-1.995207, 0.4559477, -0.9795482, 1, 0.1137255, 0, 1,
-1.936878, 0.6977181, -0.2906707, 1, 0.1215686, 0, 1,
-1.928841, -0.6963965, -3.494122, 1, 0.1254902, 0, 1,
-1.926883, 1.022588, -1.897883, 1, 0.1333333, 0, 1,
-1.925453, 0.2002395, -3.417167, 1, 0.1372549, 0, 1,
-1.924666, -1.227278, -2.012208, 1, 0.145098, 0, 1,
-1.906387, 0.6268364, -1.833816, 1, 0.1490196, 0, 1,
-1.898403, 0.1275924, -2.300133, 1, 0.1568628, 0, 1,
-1.880758, 0.02669844, -1.588536, 1, 0.1607843, 0, 1,
-1.846091, -0.5110968, -2.000106, 1, 0.1686275, 0, 1,
-1.843254, 0.5443814, -0.2895477, 1, 0.172549, 0, 1,
-1.836401, 0.01890249, -0.7848252, 1, 0.1803922, 0, 1,
-1.831477, -1.138579, -0.2581177, 1, 0.1843137, 0, 1,
-1.824306, 0.1305909, -1.666424, 1, 0.1921569, 0, 1,
-1.802166, -0.6630095, -2.809855, 1, 0.1960784, 0, 1,
-1.779715, 0.5050495, -2.33497, 1, 0.2039216, 0, 1,
-1.772948, 1.335699, -1.40895, 1, 0.2117647, 0, 1,
-1.752045, 0.1650591, -1.401033, 1, 0.2156863, 0, 1,
-1.751836, 0.6842357, -0.7909929, 1, 0.2235294, 0, 1,
-1.751016, 1.327786, 0.8652567, 1, 0.227451, 0, 1,
-1.74817, 2.077091, 0.3996594, 1, 0.2352941, 0, 1,
-1.734727, -0.1026951, -0.4610513, 1, 0.2392157, 0, 1,
-1.732567, 1.545128, -1.531863, 1, 0.2470588, 0, 1,
-1.731543, -0.7127451, -1.454548, 1, 0.2509804, 0, 1,
-1.716465, 0.2666667, -2.303783, 1, 0.2588235, 0, 1,
-1.699361, -0.1664023, -2.610803, 1, 0.2627451, 0, 1,
-1.681366, 0.3292738, -0.6358721, 1, 0.2705882, 0, 1,
-1.681083, 0.2738019, -0.8365208, 1, 0.2745098, 0, 1,
-1.677097, 1.103981, -0.8421474, 1, 0.282353, 0, 1,
-1.675786, 1.082347, -2.720394, 1, 0.2862745, 0, 1,
-1.670628, -1.566087, -2.191062, 1, 0.2941177, 0, 1,
-1.669217, -0.4551529, -1.103886, 1, 0.3019608, 0, 1,
-1.66891, 0.9932427, 0.6156886, 1, 0.3058824, 0, 1,
-1.666272, -0.2550968, -2.571996, 1, 0.3137255, 0, 1,
-1.636253, 1.912662, -0.5579975, 1, 0.3176471, 0, 1,
-1.630993, 0.9892675, -1.329352, 1, 0.3254902, 0, 1,
-1.604561, -0.345699, -3.051901, 1, 0.3294118, 0, 1,
-1.601684, 0.1147889, -1.433109, 1, 0.3372549, 0, 1,
-1.590191, -0.5134683, -2.473303, 1, 0.3411765, 0, 1,
-1.585969, -2.24399, -2.626097, 1, 0.3490196, 0, 1,
-1.563825, 0.8685759, -1.510346, 1, 0.3529412, 0, 1,
-1.561971, 1.478074, -0.7323563, 1, 0.3607843, 0, 1,
-1.561784, -0.5312741, -1.896155, 1, 0.3647059, 0, 1,
-1.553858, -0.9450619, -1.060416, 1, 0.372549, 0, 1,
-1.545501, -0.7755771, -3.144939, 1, 0.3764706, 0, 1,
-1.537504, -2.285811, -2.653294, 1, 0.3843137, 0, 1,
-1.52793, 0.05697063, -0.7793741, 1, 0.3882353, 0, 1,
-1.527645, -0.9945865, -4.356239, 1, 0.3960784, 0, 1,
-1.52697, 0.9554278, -0.140282, 1, 0.4039216, 0, 1,
-1.486835, 0.4110132, -1.484538, 1, 0.4078431, 0, 1,
-1.479771, 0.0274242, -0.8613905, 1, 0.4156863, 0, 1,
-1.476228, -0.2552401, -1.323799, 1, 0.4196078, 0, 1,
-1.473935, -0.5937976, -1.390045, 1, 0.427451, 0, 1,
-1.467009, -0.8659225, -2.872124, 1, 0.4313726, 0, 1,
-1.465616, 2.116903, -3.276571, 1, 0.4392157, 0, 1,
-1.458668, 0.4009343, -1.194259, 1, 0.4431373, 0, 1,
-1.45398, 0.992168, -1.406998, 1, 0.4509804, 0, 1,
-1.451307, -0.2104576, -1.641186, 1, 0.454902, 0, 1,
-1.43576, 0.7345685, 0.779428, 1, 0.4627451, 0, 1,
-1.435053, -0.003882145, -1.850626, 1, 0.4666667, 0, 1,
-1.415578, -0.03309245, -0.6462314, 1, 0.4745098, 0, 1,
-1.413304, 0.5089749, 0.2176353, 1, 0.4784314, 0, 1,
-1.411387, -0.123331, -1.278624, 1, 0.4862745, 0, 1,
-1.40823, 0.3791847, -1.686355, 1, 0.4901961, 0, 1,
-1.403616, 0.7659031, 0.4176428, 1, 0.4980392, 0, 1,
-1.402571, 0.7206239, 0.2604547, 1, 0.5058824, 0, 1,
-1.396927, -0.9490262, -3.134483, 1, 0.509804, 0, 1,
-1.392144, 0.6817477, 1.20784, 1, 0.5176471, 0, 1,
-1.38638, -0.7245747, -3.272493, 1, 0.5215687, 0, 1,
-1.380183, 0.6389336, -1.84364, 1, 0.5294118, 0, 1,
-1.369372, -1.368535, -1.466541, 1, 0.5333334, 0, 1,
-1.363812, -1.868499, -0.898713, 1, 0.5411765, 0, 1,
-1.360628, 0.2899357, -1.742766, 1, 0.5450981, 0, 1,
-1.355366, 1.467909, 0.24862, 1, 0.5529412, 0, 1,
-1.344281, 0.9752653, -0.3765185, 1, 0.5568628, 0, 1,
-1.325226, -0.3884265, -2.194866, 1, 0.5647059, 0, 1,
-1.324789, -2.144346, -2.113728, 1, 0.5686275, 0, 1,
-1.318969, 0.2572075, -0.8798655, 1, 0.5764706, 0, 1,
-1.317289, 0.6740425, -0.9036893, 1, 0.5803922, 0, 1,
-1.314916, 0.0076387, -1.53734, 1, 0.5882353, 0, 1,
-1.308771, 1.117235, -1.578019, 1, 0.5921569, 0, 1,
-1.305827, 0.355164, -0.6080336, 1, 0.6, 0, 1,
-1.301372, 0.004020082, -1.110345, 1, 0.6078432, 0, 1,
-1.297324, -0.5327988, -4.804535, 1, 0.6117647, 0, 1,
-1.296907, -0.712283, -1.566897, 1, 0.6196079, 0, 1,
-1.295771, 0.1311286, -0.4824901, 1, 0.6235294, 0, 1,
-1.289492, 0.1542137, -1.161579, 1, 0.6313726, 0, 1,
-1.287997, -0.1487538, -4.004632, 1, 0.6352941, 0, 1,
-1.282892, 1.694822, -0.7161154, 1, 0.6431373, 0, 1,
-1.277391, 0.7007535, -0.0630475, 1, 0.6470588, 0, 1,
-1.275782, 1.763191, -0.5105252, 1, 0.654902, 0, 1,
-1.270399, 1.526132, -0.3759946, 1, 0.6588235, 0, 1,
-1.269144, 1.167555, -1.728369, 1, 0.6666667, 0, 1,
-1.257154, -0.4896181, -1.888754, 1, 0.6705883, 0, 1,
-1.252786, -0.9969478, -3.465039, 1, 0.6784314, 0, 1,
-1.243202, -0.6153214, -1.168635, 1, 0.682353, 0, 1,
-1.238702, -0.7575338, -2.033463, 1, 0.6901961, 0, 1,
-1.218215, 0.6737383, -0.9581034, 1, 0.6941177, 0, 1,
-1.214263, -1.144882, -4.064478, 1, 0.7019608, 0, 1,
-1.197923, 1.37995, 1.331729, 1, 0.7098039, 0, 1,
-1.194575, -1.838891, -3.681722, 1, 0.7137255, 0, 1,
-1.19076, 0.1540655, -2.12406, 1, 0.7215686, 0, 1,
-1.180114, 0.8782559, -0.5267693, 1, 0.7254902, 0, 1,
-1.176569, 0.6042951, -1.584066, 1, 0.7333333, 0, 1,
-1.168798, -0.06183093, -3.263361, 1, 0.7372549, 0, 1,
-1.16083, -0.3932912, -2.041704, 1, 0.7450981, 0, 1,
-1.150671, 1.829278, 0.2476288, 1, 0.7490196, 0, 1,
-1.149598, 2.28895, 0.6071557, 1, 0.7568628, 0, 1,
-1.145542, -0.9972599, -3.549109, 1, 0.7607843, 0, 1,
-1.133623, -1.146714, -2.565049, 1, 0.7686275, 0, 1,
-1.132996, -1.583915, -4.660534, 1, 0.772549, 0, 1,
-1.130623, 1.773689, -0.4381059, 1, 0.7803922, 0, 1,
-1.12503, -1.885503, -0.7473446, 1, 0.7843137, 0, 1,
-1.121305, -0.2428014, -1.254145, 1, 0.7921569, 0, 1,
-1.11633, -1.73463, -3.571203, 1, 0.7960784, 0, 1,
-1.112169, -0.4715417, -1.077043, 1, 0.8039216, 0, 1,
-1.111144, -0.2792271, -1.648921, 1, 0.8117647, 0, 1,
-1.110337, 0.04472328, -0.6687219, 1, 0.8156863, 0, 1,
-1.109227, -0.05638919, -1.5145, 1, 0.8235294, 0, 1,
-1.099723, -0.472619, -2.12689, 1, 0.827451, 0, 1,
-1.088822, 1.345318, -0.1150775, 1, 0.8352941, 0, 1,
-1.07719, 0.4264878, -1.994694, 1, 0.8392157, 0, 1,
-1.075573, -0.7926305, -2.877621, 1, 0.8470588, 0, 1,
-1.074571, -2.665366, -3.307507, 1, 0.8509804, 0, 1,
-1.070101, 1.101985, 0.3296236, 1, 0.8588235, 0, 1,
-1.054586, -1.803625, -1.559974, 1, 0.8627451, 0, 1,
-1.052312, -0.3008877, 0.6790482, 1, 0.8705882, 0, 1,
-1.040731, -0.7066299, -3.064304, 1, 0.8745098, 0, 1,
-1.030424, 0.9159054, -2.850707, 1, 0.8823529, 0, 1,
-1.028872, 1.015265, -1.273175, 1, 0.8862745, 0, 1,
-1.028236, -0.3477192, -2.301865, 1, 0.8941177, 0, 1,
-1.02713, 0.6484236, -0.8409594, 1, 0.8980392, 0, 1,
-1.022048, 1.008121, -1.025947, 1, 0.9058824, 0, 1,
-1.020258, -0.571276, -2.18008, 1, 0.9137255, 0, 1,
-1.01688, -0.7197841, -3.268593, 1, 0.9176471, 0, 1,
-1.011441, 0.6183794, -1.938596, 1, 0.9254902, 0, 1,
-0.9990734, 0.04418932, -0.2324976, 1, 0.9294118, 0, 1,
-0.9988521, -0.1808772, -1.029776, 1, 0.9372549, 0, 1,
-0.9954854, 0.5199984, -2.41268, 1, 0.9411765, 0, 1,
-0.9908734, 1.573565, -0.4259309, 1, 0.9490196, 0, 1,
-0.9886537, -0.2848592, -0.9599255, 1, 0.9529412, 0, 1,
-0.9878218, -0.4692527, -2.734033, 1, 0.9607843, 0, 1,
-0.9860997, 1.688054, -0.5984229, 1, 0.9647059, 0, 1,
-0.9791326, 1.889809, -1.289483, 1, 0.972549, 0, 1,
-0.9780931, 0.5475722, -1.814879, 1, 0.9764706, 0, 1,
-0.9757717, -0.3236288, 0.2057697, 1, 0.9843137, 0, 1,
-0.9752231, -1.849818, -4.410166, 1, 0.9882353, 0, 1,
-0.9711863, -0.7748989, -3.573323, 1, 0.9960784, 0, 1,
-0.970821, -0.1990172, -0.8115235, 0.9960784, 1, 0, 1,
-0.9654454, -0.9456096, -1.481974, 0.9921569, 1, 0, 1,
-0.9610746, -0.8821602, -2.925438, 0.9843137, 1, 0, 1,
-0.9598394, -0.02714893, -1.780932, 0.9803922, 1, 0, 1,
-0.9546905, -0.09272329, -0.7577525, 0.972549, 1, 0, 1,
-0.9481108, -0.6103047, -2.727151, 0.9686275, 1, 0, 1,
-0.9463935, 2.697684, -0.2470582, 0.9607843, 1, 0, 1,
-0.9424536, 0.6442847, -1.947014, 0.9568627, 1, 0, 1,
-0.9398047, 0.03365855, -2.535689, 0.9490196, 1, 0, 1,
-0.9372443, -2.031317, -1.964123, 0.945098, 1, 0, 1,
-0.9358723, 0.9055846, -0.6721126, 0.9372549, 1, 0, 1,
-0.9299514, 0.4238497, -0.5064211, 0.9333333, 1, 0, 1,
-0.9299005, -1.448852, -3.348908, 0.9254902, 1, 0, 1,
-0.9289964, 0.2919855, -0.6993369, 0.9215686, 1, 0, 1,
-0.9257509, -1.609141, -3.942009, 0.9137255, 1, 0, 1,
-0.9222472, -1.345047, -1.616931, 0.9098039, 1, 0, 1,
-0.9218149, -1.19045, -1.295657, 0.9019608, 1, 0, 1,
-0.9206411, -0.9861842, -0.9377737, 0.8941177, 1, 0, 1,
-0.9204801, 0.5379917, -0.947834, 0.8901961, 1, 0, 1,
-0.9179226, 0.8940597, -0.3668134, 0.8823529, 1, 0, 1,
-0.9166558, 0.7630773, 1.397912, 0.8784314, 1, 0, 1,
-0.9161215, 1.210416, -3.24373, 0.8705882, 1, 0, 1,
-0.9107323, -0.6974872, -2.764904, 0.8666667, 1, 0, 1,
-0.9106724, -0.8012469, -1.690639, 0.8588235, 1, 0, 1,
-0.9053295, 1.774861, 0.6614017, 0.854902, 1, 0, 1,
-0.9037074, 0.3111482, -1.986923, 0.8470588, 1, 0, 1,
-0.8850279, -1.510491, -1.227132, 0.8431373, 1, 0, 1,
-0.8846716, 0.87876, -0.4198494, 0.8352941, 1, 0, 1,
-0.8819374, -0.6299726, -1.183203, 0.8313726, 1, 0, 1,
-0.8791344, -0.8015897, -1.910677, 0.8235294, 1, 0, 1,
-0.8784528, 0.2638168, -0.7152344, 0.8196079, 1, 0, 1,
-0.8746311, -2.13152, -2.122084, 0.8117647, 1, 0, 1,
-0.8739132, -0.7369468, -3.975798, 0.8078431, 1, 0, 1,
-0.8660825, 1.582067, -1.471366, 0.8, 1, 0, 1,
-0.8612216, 2.305088, 0.02538122, 0.7921569, 1, 0, 1,
-0.8608844, 1.043517, -1.489774, 0.7882353, 1, 0, 1,
-0.8581179, -1.631629, -2.522497, 0.7803922, 1, 0, 1,
-0.8463277, -0.5625652, -1.01634, 0.7764706, 1, 0, 1,
-0.8439485, 1.367205, 0.815199, 0.7686275, 1, 0, 1,
-0.8416353, -0.06159247, -2.162071, 0.7647059, 1, 0, 1,
-0.8351652, 0.3535711, -1.863434, 0.7568628, 1, 0, 1,
-0.8310181, 3.320171, 0.7446123, 0.7529412, 1, 0, 1,
-0.830904, 0.6894066, -1.830204, 0.7450981, 1, 0, 1,
-0.8296621, -1.157325, -2.36551, 0.7411765, 1, 0, 1,
-0.8284132, 1.393137, 0.8831612, 0.7333333, 1, 0, 1,
-0.8220896, 0.4890152, -3.111608, 0.7294118, 1, 0, 1,
-0.8144287, -0.1961311, -3.356799, 0.7215686, 1, 0, 1,
-0.8100957, -0.6989354, -1.174721, 0.7176471, 1, 0, 1,
-0.8038843, -1.013023, -3.400568, 0.7098039, 1, 0, 1,
-0.8023499, 1.94473, -1.23388, 0.7058824, 1, 0, 1,
-0.7992769, -0.5024681, -3.205274, 0.6980392, 1, 0, 1,
-0.7988755, -0.2118938, -2.147591, 0.6901961, 1, 0, 1,
-0.7829521, 0.06007726, -2.619449, 0.6862745, 1, 0, 1,
-0.7788486, -0.3985623, -1.73604, 0.6784314, 1, 0, 1,
-0.7768716, 0.1845385, -1.739598, 0.6745098, 1, 0, 1,
-0.7748772, 0.7702666, -0.6061559, 0.6666667, 1, 0, 1,
-0.7714108, 0.6522483, -1.685347, 0.6627451, 1, 0, 1,
-0.7708651, -1.113703, -1.7679, 0.654902, 1, 0, 1,
-0.7707552, 0.03888378, -2.083242, 0.6509804, 1, 0, 1,
-0.7698101, 1.344696, -0.09127242, 0.6431373, 1, 0, 1,
-0.7697281, 0.2726638, -2.089349, 0.6392157, 1, 0, 1,
-0.7686729, 0.2433569, -2.311958, 0.6313726, 1, 0, 1,
-0.7659444, -2.195947, -2.141458, 0.627451, 1, 0, 1,
-0.761684, -1.651642, -2.706309, 0.6196079, 1, 0, 1,
-0.7456139, -0.9017193, -3.700827, 0.6156863, 1, 0, 1,
-0.7428181, 0.0707735, -1.360663, 0.6078432, 1, 0, 1,
-0.7421613, 0.3641854, -2.741245, 0.6039216, 1, 0, 1,
-0.7378119, -0.6174786, -1.88179, 0.5960785, 1, 0, 1,
-0.7377655, -0.3538573, -2.888009, 0.5882353, 1, 0, 1,
-0.7355428, 0.5743197, -0.651486, 0.5843138, 1, 0, 1,
-0.7354991, 1.867822, 0.9932506, 0.5764706, 1, 0, 1,
-0.73545, 0.1864363, -2.474028, 0.572549, 1, 0, 1,
-0.7332476, -0.5007145, -1.351281, 0.5647059, 1, 0, 1,
-0.7304874, -2.885146, -2.202301, 0.5607843, 1, 0, 1,
-0.7258913, -1.66641, -3.088501, 0.5529412, 1, 0, 1,
-0.7202175, -0.1224955, -2.523165, 0.5490196, 1, 0, 1,
-0.7153255, -0.07486389, -0.4069692, 0.5411765, 1, 0, 1,
-0.7151177, 0.4117625, -1.708865, 0.5372549, 1, 0, 1,
-0.7142908, 0.6142994, -1.05769, 0.5294118, 1, 0, 1,
-0.713897, 0.8881904, -1.420866, 0.5254902, 1, 0, 1,
-0.7129726, 0.518673, -1.471079, 0.5176471, 1, 0, 1,
-0.7122887, -0.05554929, -2.212676, 0.5137255, 1, 0, 1,
-0.70673, 0.1906848, -2.083824, 0.5058824, 1, 0, 1,
-0.7061056, -1.10211, -2.688702, 0.5019608, 1, 0, 1,
-0.7047357, -0.4096634, -1.926968, 0.4941176, 1, 0, 1,
-0.7017341, -0.06360901, -3.245703, 0.4862745, 1, 0, 1,
-0.6965132, 0.2827483, -1.635687, 0.4823529, 1, 0, 1,
-0.6962836, 0.6730194, -1.002347, 0.4745098, 1, 0, 1,
-0.689858, 0.4615293, -1.347131, 0.4705882, 1, 0, 1,
-0.6819099, 0.350979, -0.2444179, 0.4627451, 1, 0, 1,
-0.6643928, -2.033719, -2.995416, 0.4588235, 1, 0, 1,
-0.664228, 2.432154, -0.3142295, 0.4509804, 1, 0, 1,
-0.6611782, 0.974633, -0.2796235, 0.4470588, 1, 0, 1,
-0.6519775, 0.589604, -0.6857721, 0.4392157, 1, 0, 1,
-0.6517929, 3.121573, 0.002166557, 0.4352941, 1, 0, 1,
-0.6461761, 0.5956626, -2.025012, 0.427451, 1, 0, 1,
-0.6456876, -0.7064358, -2.736489, 0.4235294, 1, 0, 1,
-0.6454958, -1.229352, -1.306743, 0.4156863, 1, 0, 1,
-0.6293809, -0.6251966, -2.956651, 0.4117647, 1, 0, 1,
-0.6270827, 0.6441289, -0.5445785, 0.4039216, 1, 0, 1,
-0.6206675, -1.156317, -2.453951, 0.3960784, 1, 0, 1,
-0.6184024, 0.3745557, -2.359896, 0.3921569, 1, 0, 1,
-0.614651, -0.6806535, -3.294783, 0.3843137, 1, 0, 1,
-0.6135395, 0.1293521, -2.037488, 0.3803922, 1, 0, 1,
-0.605403, -0.3599398, -2.834669, 0.372549, 1, 0, 1,
-0.6041085, -0.2173137, -2.303282, 0.3686275, 1, 0, 1,
-0.6002638, -1.64014, -2.683168, 0.3607843, 1, 0, 1,
-0.5954633, 0.3312469, -1.481607, 0.3568628, 1, 0, 1,
-0.5943672, -0.3054262, -0.897485, 0.3490196, 1, 0, 1,
-0.5920858, -0.197879, -2.720939, 0.345098, 1, 0, 1,
-0.5893635, 1.180896, 1.236515, 0.3372549, 1, 0, 1,
-0.5867562, 0.8905067, -2.478897, 0.3333333, 1, 0, 1,
-0.5852562, -0.3214792, -0.200709, 0.3254902, 1, 0, 1,
-0.57779, -0.9579542, -1.623394, 0.3215686, 1, 0, 1,
-0.5767756, 0.09717862, -2.18072, 0.3137255, 1, 0, 1,
-0.5736534, -0.9618917, -0.6535718, 0.3098039, 1, 0, 1,
-0.5732659, 0.6380893, 0.03515762, 0.3019608, 1, 0, 1,
-0.5671178, 0.3996307, -2.285772, 0.2941177, 1, 0, 1,
-0.564603, -0.1974934, -3.7901, 0.2901961, 1, 0, 1,
-0.5570315, -0.9002651, -4.322753, 0.282353, 1, 0, 1,
-0.5557648, 0.9479457, -2.305294, 0.2784314, 1, 0, 1,
-0.5502997, 3.001291, 0.6090615, 0.2705882, 1, 0, 1,
-0.5469103, -1.021234, -2.733003, 0.2666667, 1, 0, 1,
-0.537013, 0.2304969, -2.927487, 0.2588235, 1, 0, 1,
-0.5365548, 0.7428546, -1.284439, 0.254902, 1, 0, 1,
-0.5336879, 0.2012866, -2.093089, 0.2470588, 1, 0, 1,
-0.5330317, 2.003649, -0.3078592, 0.2431373, 1, 0, 1,
-0.5302414, -0.2290531, -1.514414, 0.2352941, 1, 0, 1,
-0.518414, -0.1959831, -2.158494, 0.2313726, 1, 0, 1,
-0.5134874, 1.046848, 0.2224877, 0.2235294, 1, 0, 1,
-0.50776, -1.081591, -1.189601, 0.2196078, 1, 0, 1,
-0.5030682, -2.761902, -3.294492, 0.2117647, 1, 0, 1,
-0.4886068, 0.009588582, -2.098796, 0.2078431, 1, 0, 1,
-0.4872633, -0.2826228, -2.637293, 0.2, 1, 0, 1,
-0.4820199, 1.195323, -0.4424089, 0.1921569, 1, 0, 1,
-0.4724263, -0.8375269, -1.639063, 0.1882353, 1, 0, 1,
-0.4722928, 1.110975, -2.294038, 0.1803922, 1, 0, 1,
-0.4701742, -0.4612858, -2.877886, 0.1764706, 1, 0, 1,
-0.4616677, 0.827778, 0.1118761, 0.1686275, 1, 0, 1,
-0.4598931, -0.757268, -3.761113, 0.1647059, 1, 0, 1,
-0.4563257, -0.8620473, -2.621474, 0.1568628, 1, 0, 1,
-0.4557528, 0.6951298, -0.2598475, 0.1529412, 1, 0, 1,
-0.4537297, 1.683797, -0.08204561, 0.145098, 1, 0, 1,
-0.4531707, 1.408124, -0.8263277, 0.1411765, 1, 0, 1,
-0.4496354, 1.519047, 0.4389292, 0.1333333, 1, 0, 1,
-0.4437845, -0.9850659, -0.9195876, 0.1294118, 1, 0, 1,
-0.4436826, 1.26472, 0.1406795, 0.1215686, 1, 0, 1,
-0.4393724, 0.3345924, -1.73481, 0.1176471, 1, 0, 1,
-0.4375281, -2.004125, -3.000099, 0.1098039, 1, 0, 1,
-0.4315085, 1.554902, -1.174318, 0.1058824, 1, 0, 1,
-0.4278988, -0.6248468, -2.428181, 0.09803922, 1, 0, 1,
-0.4272933, 0.1129211, -0.342867, 0.09019608, 1, 0, 1,
-0.4139023, -2.058093, -3.542498, 0.08627451, 1, 0, 1,
-0.4138545, 3.112914, -0.7552333, 0.07843138, 1, 0, 1,
-0.4100855, -1.301446, -2.671385, 0.07450981, 1, 0, 1,
-0.4096075, 0.5793109, -0.03071893, 0.06666667, 1, 0, 1,
-0.4086564, -0.04302292, -0.5444257, 0.0627451, 1, 0, 1,
-0.403936, 1.136375, -1.721235, 0.05490196, 1, 0, 1,
-0.403253, -0.4324513, -1.552212, 0.05098039, 1, 0, 1,
-0.3975769, -0.7618882, -2.637684, 0.04313726, 1, 0, 1,
-0.3975006, -0.7347953, -2.954413, 0.03921569, 1, 0, 1,
-0.3933162, -1.642178, -2.980733, 0.03137255, 1, 0, 1,
-0.3931107, -0.302932, -1.527274, 0.02745098, 1, 0, 1,
-0.3926765, 0.01756267, -0.214155, 0.01960784, 1, 0, 1,
-0.3920505, -0.1356857, -2.085164, 0.01568628, 1, 0, 1,
-0.3905584, -0.4517618, -3.154446, 0.007843138, 1, 0, 1,
-0.3875075, -0.01575352, -2.482615, 0.003921569, 1, 0, 1,
-0.3862628, 0.3899341, 1.658856, 0, 1, 0.003921569, 1,
-0.3842928, -0.9630309, -3.807223, 0, 1, 0.01176471, 1,
-0.3752973, -0.6898136, -2.521202, 0, 1, 0.01568628, 1,
-0.3747975, 0.7119532, -0.3748505, 0, 1, 0.02352941, 1,
-0.3711027, 0.1199289, -3.251943, 0, 1, 0.02745098, 1,
-0.3649388, 0.4450828, -1.83379, 0, 1, 0.03529412, 1,
-0.3637559, -0.7070322, -3.668625, 0, 1, 0.03921569, 1,
-0.3633922, 1.456171, 0.5268656, 0, 1, 0.04705882, 1,
-0.3629511, 0.2133425, 0.05247595, 0, 1, 0.05098039, 1,
-0.3621331, -1.165515, -3.485421, 0, 1, 0.05882353, 1,
-0.3593028, 1.654542, -0.353734, 0, 1, 0.0627451, 1,
-0.3541245, 0.1396166, -2.884288, 0, 1, 0.07058824, 1,
-0.3492405, 0.2285054, 0.3957411, 0, 1, 0.07450981, 1,
-0.3481268, 0.4495321, 1.306659, 0, 1, 0.08235294, 1,
-0.3431319, -0.3492608, -1.639187, 0, 1, 0.08627451, 1,
-0.3426323, 0.7329288, -1.339571, 0, 1, 0.09411765, 1,
-0.3416682, -0.7202787, -2.396791, 0, 1, 0.1019608, 1,
-0.3350255, -0.5968558, -3.235749, 0, 1, 0.1058824, 1,
-0.3349509, -1.047044, -3.669702, 0, 1, 0.1137255, 1,
-0.3345025, 0.1988443, -0.4240344, 0, 1, 0.1176471, 1,
-0.3319394, -0.5335875, -3.537462, 0, 1, 0.1254902, 1,
-0.3298616, 2.151799, 1.021778, 0, 1, 0.1294118, 1,
-0.3280025, 0.6292415, -0.2625555, 0, 1, 0.1372549, 1,
-0.3252207, 0.4111353, 1.985051, 0, 1, 0.1411765, 1,
-0.3222177, 0.3113465, 1.255609, 0, 1, 0.1490196, 1,
-0.321148, -0.4886692, -3.55742, 0, 1, 0.1529412, 1,
-0.3207398, -0.365212, -2.830074, 0, 1, 0.1607843, 1,
-0.3181193, 0.2212396, -1.173791, 0, 1, 0.1647059, 1,
-0.317604, 0.5053398, -0.08448643, 0, 1, 0.172549, 1,
-0.3173964, 0.2036003, -1.4585, 0, 1, 0.1764706, 1,
-0.3165336, -0.05395173, -0.5579555, 0, 1, 0.1843137, 1,
-0.3130688, -1.208144, -3.296058, 0, 1, 0.1882353, 1,
-0.3094856, 1.568297, 0.7519263, 0, 1, 0.1960784, 1,
-0.3055529, 0.7983924, -0.8863611, 0, 1, 0.2039216, 1,
-0.301395, 0.5267696, 1.569103, 0, 1, 0.2078431, 1,
-0.2958768, -0.724613, -2.308085, 0, 1, 0.2156863, 1,
-0.2938919, -0.2025225, -0.7761629, 0, 1, 0.2196078, 1,
-0.2931033, 0.8558632, -0.6574469, 0, 1, 0.227451, 1,
-0.2926809, -1.142406, -2.243522, 0, 1, 0.2313726, 1,
-0.2865507, 0.3267386, -0.4771737, 0, 1, 0.2392157, 1,
-0.285919, 0.9419862, -0.9763287, 0, 1, 0.2431373, 1,
-0.2842405, -0.3217415, -1.062595, 0, 1, 0.2509804, 1,
-0.2839119, -0.7833632, -1.107048, 0, 1, 0.254902, 1,
-0.2792677, 2.342378, -1.011725, 0, 1, 0.2627451, 1,
-0.2783, 0.5937639, -0.927121, 0, 1, 0.2666667, 1,
-0.2697459, 1.016293, 0.839021, 0, 1, 0.2745098, 1,
-0.2672839, -1.311065, -3.082017, 0, 1, 0.2784314, 1,
-0.2670946, -1.128127, -4.198551, 0, 1, 0.2862745, 1,
-0.2661512, 1.660669, -1.808144, 0, 1, 0.2901961, 1,
-0.2639981, 0.6010643, -2.030319, 0, 1, 0.2980392, 1,
-0.2624798, -0.9719859, -2.702809, 0, 1, 0.3058824, 1,
-0.2620472, 0.9967391, 2.427376, 0, 1, 0.3098039, 1,
-0.2547391, -0.3204118, -2.820685, 0, 1, 0.3176471, 1,
-0.2543734, -0.2357643, -3.12787, 0, 1, 0.3215686, 1,
-0.2446263, -0.03387707, -2.64736, 0, 1, 0.3294118, 1,
-0.2375746, 0.1546414, -0.9502854, 0, 1, 0.3333333, 1,
-0.2365741, -1.07235, -2.417648, 0, 1, 0.3411765, 1,
-0.2325837, 0.6264638, -0.3745016, 0, 1, 0.345098, 1,
-0.2319777, 0.2897772, -1.223507, 0, 1, 0.3529412, 1,
-0.2313913, 0.229698, -2.003601, 0, 1, 0.3568628, 1,
-0.2299317, -0.6666722, -3.073702, 0, 1, 0.3647059, 1,
-0.2289251, -1.239764, -3.402297, 0, 1, 0.3686275, 1,
-0.2284168, 0.3366502, -0.5582776, 0, 1, 0.3764706, 1,
-0.2259717, -0.07196632, -2.005207, 0, 1, 0.3803922, 1,
-0.2238874, 0.6104795, 0.6089519, 0, 1, 0.3882353, 1,
-0.2232222, -0.9784669, -2.692272, 0, 1, 0.3921569, 1,
-0.2222447, -1.229001, -2.453895, 0, 1, 0.4, 1,
-0.221359, -1.032939, -3.578303, 0, 1, 0.4078431, 1,
-0.2211956, 0.9789123, -0.5639215, 0, 1, 0.4117647, 1,
-0.2211228, -1.017991, -2.353376, 0, 1, 0.4196078, 1,
-0.2210371, -0.1472818, -1.24173, 0, 1, 0.4235294, 1,
-0.220866, 0.2301819, -2.906789, 0, 1, 0.4313726, 1,
-0.2120758, 0.8877122, -1.179218, 0, 1, 0.4352941, 1,
-0.2104139, 1.642227, -0.7682093, 0, 1, 0.4431373, 1,
-0.2041081, -1.096563, -5.028975, 0, 1, 0.4470588, 1,
-0.2019455, 1.259255, 1.791809, 0, 1, 0.454902, 1,
-0.2017098, 0.01248276, -1.887081, 0, 1, 0.4588235, 1,
-0.1979895, 0.7584797, 2.184871, 0, 1, 0.4666667, 1,
-0.1928802, -0.6197332, -3.696965, 0, 1, 0.4705882, 1,
-0.1888075, -1.03085, -1.948246, 0, 1, 0.4784314, 1,
-0.1883118, -1.549621, -3.522971, 0, 1, 0.4823529, 1,
-0.1807134, -0.667574, -3.668138, 0, 1, 0.4901961, 1,
-0.1800346, 0.5148736, -0.2293938, 0, 1, 0.4941176, 1,
-0.173936, 0.06302576, -2.600858, 0, 1, 0.5019608, 1,
-0.1714014, -0.355614, -1.696365, 0, 1, 0.509804, 1,
-0.1662177, -2.36089, -4.344712, 0, 1, 0.5137255, 1,
-0.1607941, 1.329771, -0.3508425, 0, 1, 0.5215687, 1,
-0.1605153, 0.7035221, 0.1927749, 0, 1, 0.5254902, 1,
-0.1532795, 0.7241712, -1.639143, 0, 1, 0.5333334, 1,
-0.1529653, -1.308255, -4.840127, 0, 1, 0.5372549, 1,
-0.1510023, -0.2509564, -2.854008, 0, 1, 0.5450981, 1,
-0.1446954, -0.4066516, -3.352383, 0, 1, 0.5490196, 1,
-0.1446679, 0.6603376, -1.092343, 0, 1, 0.5568628, 1,
-0.1419517, -1.556066, -3.436481, 0, 1, 0.5607843, 1,
-0.1384099, -1.024231, -5.007154, 0, 1, 0.5686275, 1,
-0.1338698, -0.109131, -1.717099, 0, 1, 0.572549, 1,
-0.1330652, -0.08641589, -0.9903325, 0, 1, 0.5803922, 1,
-0.1316963, 0.2572262, -1.761521, 0, 1, 0.5843138, 1,
-0.1314045, -1.728992, -2.908356, 0, 1, 0.5921569, 1,
-0.1309193, -0.8405961, -2.669441, 0, 1, 0.5960785, 1,
-0.1295019, 0.8361398, -0.510806, 0, 1, 0.6039216, 1,
-0.1227808, -0.2132224, -2.756291, 0, 1, 0.6117647, 1,
-0.1198165, 0.3695784, 1.086954, 0, 1, 0.6156863, 1,
-0.1178439, 0.1208632, 0.5959622, 0, 1, 0.6235294, 1,
-0.1176225, -0.9229752, -3.743218, 0, 1, 0.627451, 1,
-0.1170982, 0.06168562, -0.6616979, 0, 1, 0.6352941, 1,
-0.1131535, -1.571651, -2.60779, 0, 1, 0.6392157, 1,
-0.1131386, 0.7438722, -0.9410835, 0, 1, 0.6470588, 1,
-0.1126813, 0.6412643, 0.1294937, 0, 1, 0.6509804, 1,
-0.110846, 0.05189662, 0.308481, 0, 1, 0.6588235, 1,
-0.1099614, 0.3848158, 1.411353, 0, 1, 0.6627451, 1,
-0.1069429, 0.8745295, -0.2691089, 0, 1, 0.6705883, 1,
-0.104377, -0.9442647, -2.695205, 0, 1, 0.6745098, 1,
-0.1002906, -0.3029282, -3.020157, 0, 1, 0.682353, 1,
-0.09639278, -0.391324, -1.427592, 0, 1, 0.6862745, 1,
-0.08807018, -0.883704, -3.298039, 0, 1, 0.6941177, 1,
-0.08611046, 0.6131958, 0.7218342, 0, 1, 0.7019608, 1,
-0.08272375, -1.315162, -3.659344, 0, 1, 0.7058824, 1,
-0.08222885, -0.229534, -2.578724, 0, 1, 0.7137255, 1,
-0.07970629, -1.754296, -3.53137, 0, 1, 0.7176471, 1,
-0.07874632, 1.04661, 0.7595585, 0, 1, 0.7254902, 1,
-0.07860629, -0.5493913, -3.74915, 0, 1, 0.7294118, 1,
-0.07850909, 0.6844613, -0.08324257, 0, 1, 0.7372549, 1,
-0.07675687, 1.481879, -0.05249806, 0, 1, 0.7411765, 1,
-0.07466023, 1.553931, 1.446755, 0, 1, 0.7490196, 1,
-0.07329722, -0.4122511, -2.568159, 0, 1, 0.7529412, 1,
-0.07310469, -2.103719, -2.644629, 0, 1, 0.7607843, 1,
-0.07259965, -1.776746, -3.928957, 0, 1, 0.7647059, 1,
-0.07063362, -0.2303893, -2.884319, 0, 1, 0.772549, 1,
-0.06715963, 0.8611703, 1.097814, 0, 1, 0.7764706, 1,
-0.06579007, -0.3798213, -2.030985, 0, 1, 0.7843137, 1,
-0.06012387, 0.1345837, -2.556379, 0, 1, 0.7882353, 1,
-0.05715389, 0.6855029, 0.9131017, 0, 1, 0.7960784, 1,
-0.05427423, 0.6229758, -0.1804749, 0, 1, 0.8039216, 1,
-0.04840085, 1.059478, -1.765836, 0, 1, 0.8078431, 1,
-0.0481017, 0.9354774, -0.7896939, 0, 1, 0.8156863, 1,
-0.04624142, -1.223001, -4.132102, 0, 1, 0.8196079, 1,
-0.04589363, 0.1900635, -0.9995, 0, 1, 0.827451, 1,
-0.04310033, -1.619381, -3.134882, 0, 1, 0.8313726, 1,
-0.04254586, -0.6984376, -3.646328, 0, 1, 0.8392157, 1,
-0.03640388, -0.9713069, -3.860828, 0, 1, 0.8431373, 1,
-0.03614397, 1.440856, -0.1927419, 0, 1, 0.8509804, 1,
-0.02695816, 1.174991, 0.3601326, 0, 1, 0.854902, 1,
-0.02505113, -0.9364703, -3.327856, 0, 1, 0.8627451, 1,
-0.02477091, -0.3414657, -2.544056, 0, 1, 0.8666667, 1,
-0.0246316, -2.245082, -3.306456, 0, 1, 0.8745098, 1,
-0.01824491, -0.5239872, -3.70494, 0, 1, 0.8784314, 1,
-0.0150726, -0.7928941, -1.669068, 0, 1, 0.8862745, 1,
-0.01205627, 0.6490517, -1.457656, 0, 1, 0.8901961, 1,
-0.01098117, -0.6208047, -4.50098, 0, 1, 0.8980392, 1,
-0.008588548, -0.2152676, -3.823453, 0, 1, 0.9058824, 1,
-0.004781577, 0.02654613, 0.5656152, 0, 1, 0.9098039, 1,
-0.003178433, -0.2798105, -3.183895, 0, 1, 0.9176471, 1,
-0.001452272, -0.8632519, -4.842183, 0, 1, 0.9215686, 1,
0.0008514898, 1.638025, 1.255528, 0, 1, 0.9294118, 1,
0.009228217, -0.9739502, 3.017766, 0, 1, 0.9333333, 1,
0.01115644, 1.575751, -0.1931878, 0, 1, 0.9411765, 1,
0.01450013, 0.6842307, -0.7185775, 0, 1, 0.945098, 1,
0.01475613, -0.9264889, 4.11512, 0, 1, 0.9529412, 1,
0.0155356, -0.7084738, 4.568341, 0, 1, 0.9568627, 1,
0.01804222, -0.4494024, 2.96144, 0, 1, 0.9647059, 1,
0.01814947, 0.5689895, 0.6813103, 0, 1, 0.9686275, 1,
0.01966442, 1.373857, 0.7653973, 0, 1, 0.9764706, 1,
0.0208128, 2.437783, 0.7138767, 0, 1, 0.9803922, 1,
0.0208794, 0.698042, 0.4858004, 0, 1, 0.9882353, 1,
0.02147308, 0.3909578, 0.2998338, 0, 1, 0.9921569, 1,
0.04770602, -0.6358124, 3.940217, 0, 1, 1, 1,
0.05124555, -2.207878, 4.932371, 0, 0.9921569, 1, 1,
0.05155007, -0.3647768, 2.779438, 0, 0.9882353, 1, 1,
0.05405159, -1.197103, 3.769996, 0, 0.9803922, 1, 1,
0.05717202, 0.8944724, 0.1077458, 0, 0.9764706, 1, 1,
0.05945265, 0.3750912, -1.012446, 0, 0.9686275, 1, 1,
0.06210862, -1.155227, 3.101244, 0, 0.9647059, 1, 1,
0.06573197, 1.048674, 0.3445334, 0, 0.9568627, 1, 1,
0.06586423, 0.530271, -0.5160368, 0, 0.9529412, 1, 1,
0.06770907, -1.408385, 1.22692, 0, 0.945098, 1, 1,
0.07000095, 2.449406, 1.653009, 0, 0.9411765, 1, 1,
0.07520839, -0.4539715, 4.366808, 0, 0.9333333, 1, 1,
0.07521077, 0.1383069, 0.0720012, 0, 0.9294118, 1, 1,
0.07838706, 0.6566969, -0.3487887, 0, 0.9215686, 1, 1,
0.07931307, -0.3277814, 1.391358, 0, 0.9176471, 1, 1,
0.08751721, -0.1857993, 2.885991, 0, 0.9098039, 1, 1,
0.09129723, 2.963753, -2.701681, 0, 0.9058824, 1, 1,
0.09302504, 1.202883, -0.2400825, 0, 0.8980392, 1, 1,
0.09485924, 1.696426, -0.03365104, 0, 0.8901961, 1, 1,
0.09585159, 1.251336, 0.3504636, 0, 0.8862745, 1, 1,
0.09885664, 1.148083, 1.110534, 0, 0.8784314, 1, 1,
0.102041, -0.3358271, 3.218085, 0, 0.8745098, 1, 1,
0.1038526, 0.451557, 1.624554, 0, 0.8666667, 1, 1,
0.1125121, 0.7178226, 0.4256892, 0, 0.8627451, 1, 1,
0.1127026, 1.327328, 0.9325518, 0, 0.854902, 1, 1,
0.1166181, -0.980711, 2.544519, 0, 0.8509804, 1, 1,
0.1206888, 0.1875166, 1.127073, 0, 0.8431373, 1, 1,
0.1212067, 0.5424553, -0.9735059, 0, 0.8392157, 1, 1,
0.1220332, 0.7936602, 1.235426, 0, 0.8313726, 1, 1,
0.1249371, 1.621148, -1.576157, 0, 0.827451, 1, 1,
0.1261079, 1.454511, -0.1132617, 0, 0.8196079, 1, 1,
0.126479, -0.2388642, 2.711115, 0, 0.8156863, 1, 1,
0.1278931, -0.9289859, 0.9620786, 0, 0.8078431, 1, 1,
0.1279283, 0.2495676, -0.3087866, 0, 0.8039216, 1, 1,
0.1289511, 0.2984755, -0.6788718, 0, 0.7960784, 1, 1,
0.130727, 0.1343038, 1.454425, 0, 0.7882353, 1, 1,
0.1315652, 0.4582043, 0.2258728, 0, 0.7843137, 1, 1,
0.1328619, -1.011743, 2.484542, 0, 0.7764706, 1, 1,
0.1415021, 0.1588139, 0.9093574, 0, 0.772549, 1, 1,
0.142907, -1.476768, 2.374177, 0, 0.7647059, 1, 1,
0.1473644, -1.131895, 3.434577, 0, 0.7607843, 1, 1,
0.1487752, 0.2128373, 0.456627, 0, 0.7529412, 1, 1,
0.1491514, 2.117508, 0.5022191, 0, 0.7490196, 1, 1,
0.1500239, -0.6617454, 4.353206, 0, 0.7411765, 1, 1,
0.151416, 0.5026733, 0.3831333, 0, 0.7372549, 1, 1,
0.157817, 1.388466, 1.238518, 0, 0.7294118, 1, 1,
0.1590924, -0.8314815, 3.100581, 0, 0.7254902, 1, 1,
0.1594777, -0.7153144, 1.472633, 0, 0.7176471, 1, 1,
0.1605763, 0.8698146, 2.170088, 0, 0.7137255, 1, 1,
0.1730973, -0.1870325, 2.752563, 0, 0.7058824, 1, 1,
0.1749905, -0.06339179, 1.845023, 0, 0.6980392, 1, 1,
0.176933, -0.2315303, 4.520969, 0, 0.6941177, 1, 1,
0.1787469, -0.06296998, 1.476017, 0, 0.6862745, 1, 1,
0.1816041, -0.2843517, 3.482592, 0, 0.682353, 1, 1,
0.1844235, -0.06736466, 1.448047, 0, 0.6745098, 1, 1,
0.1952878, 2.003482, -0.02645783, 0, 0.6705883, 1, 1,
0.19529, -0.3076585, 2.337762, 0, 0.6627451, 1, 1,
0.1966243, -0.5437792, 1.801962, 0, 0.6588235, 1, 1,
0.1980132, -0.007637628, 1.097833, 0, 0.6509804, 1, 1,
0.1980597, -0.3762617, 2.363764, 0, 0.6470588, 1, 1,
0.2017279, -0.1801843, -0.8386146, 0, 0.6392157, 1, 1,
0.2031504, 2.487493, 0.4314417, 0, 0.6352941, 1, 1,
0.2037985, 0.3336748, 2.035529, 0, 0.627451, 1, 1,
0.2057053, -0.02361282, 1.014464, 0, 0.6235294, 1, 1,
0.2076456, -1.141289, 2.104929, 0, 0.6156863, 1, 1,
0.2119697, 0.1919995, 0.7931541, 0, 0.6117647, 1, 1,
0.213843, -0.4436285, 3.812609, 0, 0.6039216, 1, 1,
0.2142494, -0.2557655, 4.490325, 0, 0.5960785, 1, 1,
0.2145913, 0.1378623, 0.76283, 0, 0.5921569, 1, 1,
0.2168757, 1.464292, -1.703649, 0, 0.5843138, 1, 1,
0.2199233, -0.9173436, 4.085764, 0, 0.5803922, 1, 1,
0.2213631, -1.392707, 2.590998, 0, 0.572549, 1, 1,
0.2218873, -0.3945096, 2.697446, 0, 0.5686275, 1, 1,
0.2280436, 0.7052751, 2.634821, 0, 0.5607843, 1, 1,
0.2303167, -0.1763493, 0.781363, 0, 0.5568628, 1, 1,
0.23399, -0.5253397, 2.281002, 0, 0.5490196, 1, 1,
0.2347702, 0.9662965, 0.8062017, 0, 0.5450981, 1, 1,
0.2362625, 0.2846731, -0.2058324, 0, 0.5372549, 1, 1,
0.2384233, 1.307683, 1.242871, 0, 0.5333334, 1, 1,
0.2389441, -0.9549415, 0.9792631, 0, 0.5254902, 1, 1,
0.2412993, -0.8643618, 3.851194, 0, 0.5215687, 1, 1,
0.2419159, 1.19702, 0.09265794, 0, 0.5137255, 1, 1,
0.2622195, 0.3685765, 1.427871, 0, 0.509804, 1, 1,
0.2639772, -0.9649482, 2.896526, 0, 0.5019608, 1, 1,
0.2714939, -0.5880383, 2.577283, 0, 0.4941176, 1, 1,
0.2759887, 0.1949925, 0.2865536, 0, 0.4901961, 1, 1,
0.276807, 2.052302, -0.7660736, 0, 0.4823529, 1, 1,
0.2840203, -0.3170742, 2.543755, 0, 0.4784314, 1, 1,
0.2846033, 0.9950029, 0.1926762, 0, 0.4705882, 1, 1,
0.2890268, -2.156515, 2.385191, 0, 0.4666667, 1, 1,
0.2947582, -0.4213228, 3.014468, 0, 0.4588235, 1, 1,
0.3054477, 0.9143937, 0.02266387, 0, 0.454902, 1, 1,
0.3089399, 0.6679808, 0.251031, 0, 0.4470588, 1, 1,
0.3107139, -0.907441, 1.524594, 0, 0.4431373, 1, 1,
0.3118701, -0.4123285, 2.062008, 0, 0.4352941, 1, 1,
0.3120985, 1.715849, -1.036466, 0, 0.4313726, 1, 1,
0.3173053, 0.9518916, 0.2053632, 0, 0.4235294, 1, 1,
0.318892, -0.7024046, 2.924935, 0, 0.4196078, 1, 1,
0.3237856, 0.8501515, 0.03633891, 0, 0.4117647, 1, 1,
0.3273169, 1.98142, 1.796651, 0, 0.4078431, 1, 1,
0.3299799, 0.1131927, 1.585447, 0, 0.4, 1, 1,
0.3319078, 1.044344, -0.7407677, 0, 0.3921569, 1, 1,
0.3336582, -1.042664, 2.819196, 0, 0.3882353, 1, 1,
0.336307, 0.916151, 2.426312, 0, 0.3803922, 1, 1,
0.3477938, 2.587481, -0.559512, 0, 0.3764706, 1, 1,
0.3489383, 0.7059003, -0.611158, 0, 0.3686275, 1, 1,
0.3532264, 0.2720325, 1.311872, 0, 0.3647059, 1, 1,
0.3535618, -0.9985807, 3.435226, 0, 0.3568628, 1, 1,
0.3542592, -1.417509, 3.053789, 0, 0.3529412, 1, 1,
0.3582823, 0.5128692, 1.43125, 0, 0.345098, 1, 1,
0.3590451, -0.7756199, 1.670545, 0, 0.3411765, 1, 1,
0.3592286, 0.9476513, 0.2627913, 0, 0.3333333, 1, 1,
0.3594925, 0.4328914, 0.1054694, 0, 0.3294118, 1, 1,
0.3643207, -1.968949, 2.213684, 0, 0.3215686, 1, 1,
0.3650639, 0.9540114, -1.57624, 0, 0.3176471, 1, 1,
0.3661408, -0.547813, 2.617394, 0, 0.3098039, 1, 1,
0.3682104, -2.336281, 2.119835, 0, 0.3058824, 1, 1,
0.3688399, 0.499076, 0.5100605, 0, 0.2980392, 1, 1,
0.3711133, -1.149403, 2.603116, 0, 0.2901961, 1, 1,
0.3717629, -1.351598, 4.210379, 0, 0.2862745, 1, 1,
0.372079, -0.5256435, 2.858127, 0, 0.2784314, 1, 1,
0.37575, -0.2426042, 2.54728, 0, 0.2745098, 1, 1,
0.3802904, -1.168906, 1.95527, 0, 0.2666667, 1, 1,
0.3803745, 1.435216, -1.176708, 0, 0.2627451, 1, 1,
0.3924915, 0.9860651, 0.9757794, 0, 0.254902, 1, 1,
0.3957542, 0.5287782, 0.1584571, 0, 0.2509804, 1, 1,
0.3965757, 0.4526164, 0.05677973, 0, 0.2431373, 1, 1,
0.3978975, 0.6249601, -0.1905976, 0, 0.2392157, 1, 1,
0.3984413, 0.5453672, 1.038777, 0, 0.2313726, 1, 1,
0.3985935, 1.355601, -0.7946336, 0, 0.227451, 1, 1,
0.4011461, 0.04310925, 2.283858, 0, 0.2196078, 1, 1,
0.4086332, -1.339629, 3.12258, 0, 0.2156863, 1, 1,
0.4127799, -0.7294844, 2.825196, 0, 0.2078431, 1, 1,
0.4179709, -0.570415, 2.120232, 0, 0.2039216, 1, 1,
0.4189037, -2.381289, 1.63745, 0, 0.1960784, 1, 1,
0.4191254, -0.9167953, 3.280393, 0, 0.1882353, 1, 1,
0.4191371, -1.803736, 2.712122, 0, 0.1843137, 1, 1,
0.4192424, -1.475032, 1.951523, 0, 0.1764706, 1, 1,
0.4197806, -0.8569408, 1.702301, 0, 0.172549, 1, 1,
0.4202187, 1.058286, -0.09752377, 0, 0.1647059, 1, 1,
0.4245321, 0.113826, 1.011558, 0, 0.1607843, 1, 1,
0.4248903, 2.222413, -1.469637, 0, 0.1529412, 1, 1,
0.4276044, 0.1989021, 2.010325, 0, 0.1490196, 1, 1,
0.4282984, 0.1583838, 1.678106, 0, 0.1411765, 1, 1,
0.4297113, 0.4198423, 1.209582, 0, 0.1372549, 1, 1,
0.4352045, 0.8412768, -0.4133081, 0, 0.1294118, 1, 1,
0.4365599, -0.1254274, 2.573656, 0, 0.1254902, 1, 1,
0.442838, 0.1982073, 1.754321, 0, 0.1176471, 1, 1,
0.4442922, 0.09910196, -0.1891066, 0, 0.1137255, 1, 1,
0.4473678, -1.261196, 2.211204, 0, 0.1058824, 1, 1,
0.4501112, -0.2385554, 0.1405619, 0, 0.09803922, 1, 1,
0.4502082, -1.393351, 3.241391, 0, 0.09411765, 1, 1,
0.4526035, -0.1124296, 1.917545, 0, 0.08627451, 1, 1,
0.4526161, -2.432034, 4.44634, 0, 0.08235294, 1, 1,
0.45529, 0.4954499, 0.3711995, 0, 0.07450981, 1, 1,
0.4624824, -0.2837506, 3.534177, 0, 0.07058824, 1, 1,
0.4656568, -0.7330321, 1.866525, 0, 0.0627451, 1, 1,
0.4679368, 1.271518, 0.08653321, 0, 0.05882353, 1, 1,
0.469013, -1.293952, 5.459339, 0, 0.05098039, 1, 1,
0.4693111, 2.615175, 0.1910747, 0, 0.04705882, 1, 1,
0.4739745, 0.0580412, 1.932979, 0, 0.03921569, 1, 1,
0.4809074, 0.9629285, -1.58746, 0, 0.03529412, 1, 1,
0.4817119, 1.443952, 0.544344, 0, 0.02745098, 1, 1,
0.4826947, -1.098227, 1.541431, 0, 0.02352941, 1, 1,
0.483427, -0.3897829, 2.99441, 0, 0.01568628, 1, 1,
0.484691, -0.2007975, 1.143082, 0, 0.01176471, 1, 1,
0.4855609, -0.1175201, 1.554132, 0, 0.003921569, 1, 1,
0.4859748, 1.915437, 0.4681556, 0.003921569, 0, 1, 1,
0.4862144, -1.778087, 3.499399, 0.007843138, 0, 1, 1,
0.4918257, 0.05739538, 0.8897231, 0.01568628, 0, 1, 1,
0.4929564, 1.177112, 1.239038, 0.01960784, 0, 1, 1,
0.4949169, 0.7799978, 2.083989, 0.02745098, 0, 1, 1,
0.4984284, 0.8236244, -0.3115045, 0.03137255, 0, 1, 1,
0.5028139, -0.5686019, 2.656447, 0.03921569, 0, 1, 1,
0.5071192, 0.02857487, 2.021728, 0.04313726, 0, 1, 1,
0.507168, 0.7738869, 1.003874, 0.05098039, 0, 1, 1,
0.5140882, 1.647913, -0.8192312, 0.05490196, 0, 1, 1,
0.5144957, -0.1682725, 2.396108, 0.0627451, 0, 1, 1,
0.515376, 0.6038146, 0.9889264, 0.06666667, 0, 1, 1,
0.5220394, -0.3100825, 1.322404, 0.07450981, 0, 1, 1,
0.5287023, -1.104866, 2.356732, 0.07843138, 0, 1, 1,
0.5324473, -0.8099358, 0.7856501, 0.08627451, 0, 1, 1,
0.5332197, -1.078839, 3.249487, 0.09019608, 0, 1, 1,
0.5334899, 1.318455, 0.3635073, 0.09803922, 0, 1, 1,
0.539872, 1.630723, 1.894057, 0.1058824, 0, 1, 1,
0.5403735, -0.1013662, 2.270038, 0.1098039, 0, 1, 1,
0.5404108, -0.4290909, 1.883577, 0.1176471, 0, 1, 1,
0.5411356, -0.4190246, 1.048308, 0.1215686, 0, 1, 1,
0.5422626, 0.8434916, 0.9747895, 0.1294118, 0, 1, 1,
0.5450609, -0.3475308, 2.06655, 0.1333333, 0, 1, 1,
0.5454621, -1.590077, 2.741459, 0.1411765, 0, 1, 1,
0.5473614, -0.5132332, 2.63084, 0.145098, 0, 1, 1,
0.553889, -1.306562, 0.7296132, 0.1529412, 0, 1, 1,
0.5557872, -1.338788, 2.578947, 0.1568628, 0, 1, 1,
0.5582265, 0.8193861, 1.24657, 0.1647059, 0, 1, 1,
0.5629439, 0.03258903, 0.6999611, 0.1686275, 0, 1, 1,
0.5635481, 0.1339574, -0.5425622, 0.1764706, 0, 1, 1,
0.5648152, -1.604448, 2.484151, 0.1803922, 0, 1, 1,
0.5648495, 1.985164, -0.235066, 0.1882353, 0, 1, 1,
0.5696715, 0.1490037, 0.415987, 0.1921569, 0, 1, 1,
0.5758318, -0.2975804, 1.191483, 0.2, 0, 1, 1,
0.5834506, 0.8637869, -1.457873, 0.2078431, 0, 1, 1,
0.5835764, 0.3374175, 0.7110006, 0.2117647, 0, 1, 1,
0.5854114, 0.5825567, 2.813702, 0.2196078, 0, 1, 1,
0.5869132, -0.3777799, 1.433508, 0.2235294, 0, 1, 1,
0.5884212, 0.2623563, 1.113003, 0.2313726, 0, 1, 1,
0.5902236, -1.187818, 1.113648, 0.2352941, 0, 1, 1,
0.5904728, 0.2682484, 2.692007, 0.2431373, 0, 1, 1,
0.5972729, -0.7320027, 3.381261, 0.2470588, 0, 1, 1,
0.5987015, -0.2054353, 4.95196, 0.254902, 0, 1, 1,
0.602547, -1.494252, 3.577553, 0.2588235, 0, 1, 1,
0.6078216, -0.1139061, 1.308122, 0.2666667, 0, 1, 1,
0.6093025, -0.7212183, 1.6845, 0.2705882, 0, 1, 1,
0.6137815, 0.3536955, 0.5324098, 0.2784314, 0, 1, 1,
0.6161564, -0.1885343, 2.541821, 0.282353, 0, 1, 1,
0.6189396, 0.5599788, 0.2759445, 0.2901961, 0, 1, 1,
0.6197627, 1.339339, -0.5174074, 0.2941177, 0, 1, 1,
0.6257221, 0.9168436, -0.3208825, 0.3019608, 0, 1, 1,
0.6260489, 0.5139429, 0.188408, 0.3098039, 0, 1, 1,
0.628231, 0.6509358, -0.1470728, 0.3137255, 0, 1, 1,
0.6297458, -1.534984, 2.996022, 0.3215686, 0, 1, 1,
0.6312804, -0.2689016, 0.2248441, 0.3254902, 0, 1, 1,
0.6319987, -1.921633, 2.815761, 0.3333333, 0, 1, 1,
0.6321847, 1.934983, -0.06090352, 0.3372549, 0, 1, 1,
0.6322456, -0.6739901, 2.063739, 0.345098, 0, 1, 1,
0.6327165, -1.292571, 2.883881, 0.3490196, 0, 1, 1,
0.6327252, 0.6457787, 1.387848, 0.3568628, 0, 1, 1,
0.6351107, 0.4473732, 0.03520462, 0.3607843, 0, 1, 1,
0.6446009, -0.4494356, 1.808398, 0.3686275, 0, 1, 1,
0.6490084, -0.007930771, 1.483687, 0.372549, 0, 1, 1,
0.6522159, 0.526053, 2.061953, 0.3803922, 0, 1, 1,
0.6538118, 1.420837, 0.3704647, 0.3843137, 0, 1, 1,
0.6556462, -1.750205, 3.758055, 0.3921569, 0, 1, 1,
0.6575474, 0.5431742, 0.2297753, 0.3960784, 0, 1, 1,
0.659641, -0.2374291, 2.409755, 0.4039216, 0, 1, 1,
0.6604957, -0.06457161, 1.66923, 0.4117647, 0, 1, 1,
0.6607964, 0.8334073, 1.208238, 0.4156863, 0, 1, 1,
0.664165, 0.02413194, 1.658385, 0.4235294, 0, 1, 1,
0.6646416, -0.1490898, 2.533322, 0.427451, 0, 1, 1,
0.6650757, -0.4780974, 2.268835, 0.4352941, 0, 1, 1,
0.6653777, 0.2210571, -0.3302674, 0.4392157, 0, 1, 1,
0.6702183, 0.111621, 1.407859, 0.4470588, 0, 1, 1,
0.6706637, 0.7853521, 0.8928236, 0.4509804, 0, 1, 1,
0.675615, -0.9942475, 2.311706, 0.4588235, 0, 1, 1,
0.6785336, 0.8040231, 0.5129483, 0.4627451, 0, 1, 1,
0.6790441, -1.972431, 2.038697, 0.4705882, 0, 1, 1,
0.687283, -1.351929, 2.820136, 0.4745098, 0, 1, 1,
0.6962916, 1.826563, 0.1465964, 0.4823529, 0, 1, 1,
0.6965675, -1.201653, 2.047609, 0.4862745, 0, 1, 1,
0.6985143, 1.084263, 1.051663, 0.4941176, 0, 1, 1,
0.6989446, 0.4434722, 1.131976, 0.5019608, 0, 1, 1,
0.7031977, -0.3398998, 1.231147, 0.5058824, 0, 1, 1,
0.7039168, -0.8149641, 2.823744, 0.5137255, 0, 1, 1,
0.7062451, -0.2233329, 3.117473, 0.5176471, 0, 1, 1,
0.7116931, 0.3837982, 0.2096883, 0.5254902, 0, 1, 1,
0.7123515, -0.6723924, 1.488495, 0.5294118, 0, 1, 1,
0.7124127, 0.5919942, -0.9135556, 0.5372549, 0, 1, 1,
0.7124689, 2.308829, 0.08069302, 0.5411765, 0, 1, 1,
0.7139265, -0.9819404, 1.169614, 0.5490196, 0, 1, 1,
0.7144662, -0.5487067, 2.922022, 0.5529412, 0, 1, 1,
0.7146012, 0.2858199, 0.7776558, 0.5607843, 0, 1, 1,
0.7180517, -1.720083, 1.5992, 0.5647059, 0, 1, 1,
0.7226871, 1.08823, 0.7116762, 0.572549, 0, 1, 1,
0.7252582, -0.2511431, 1.067142, 0.5764706, 0, 1, 1,
0.7287402, 0.7226133, 1.495267, 0.5843138, 0, 1, 1,
0.7320735, 0.1685266, 2.618653, 0.5882353, 0, 1, 1,
0.7399523, 1.911182, 0.1031799, 0.5960785, 0, 1, 1,
0.7415084, 0.5078384, 3.639414, 0.6039216, 0, 1, 1,
0.741667, -1.482751, 2.169746, 0.6078432, 0, 1, 1,
0.7456379, 0.8919185, -0.3525114, 0.6156863, 0, 1, 1,
0.7463137, 0.8297299, 0.4060099, 0.6196079, 0, 1, 1,
0.7575177, -1.433674, 3.018303, 0.627451, 0, 1, 1,
0.7579325, -0.1427507, 0.5301115, 0.6313726, 0, 1, 1,
0.7591494, -0.2202467, -0.4230297, 0.6392157, 0, 1, 1,
0.7593964, -0.1431278, 2.143982, 0.6431373, 0, 1, 1,
0.7631159, 0.04607656, 3.480146, 0.6509804, 0, 1, 1,
0.7692156, 0.7490427, 0.9251811, 0.654902, 0, 1, 1,
0.7703131, 0.2459307, 0.9348973, 0.6627451, 0, 1, 1,
0.7711334, -1.423211, 3.80209, 0.6666667, 0, 1, 1,
0.7711596, 1.185926, 1.063029, 0.6745098, 0, 1, 1,
0.7777509, 0.7044464, 1.401058, 0.6784314, 0, 1, 1,
0.7788184, -0.6169647, 0.04139747, 0.6862745, 0, 1, 1,
0.7790145, 1.080613, 1.116793, 0.6901961, 0, 1, 1,
0.7815908, -0.8730446, 2.568008, 0.6980392, 0, 1, 1,
0.7862371, -0.1005396, 2.442986, 0.7058824, 0, 1, 1,
0.7900708, 0.07659142, 0.7981778, 0.7098039, 0, 1, 1,
0.7964268, 1.168505, 1.225662, 0.7176471, 0, 1, 1,
0.7979217, 0.5363469, 1.264219, 0.7215686, 0, 1, 1,
0.7988128, 0.4625273, 1.467714, 0.7294118, 0, 1, 1,
0.8038864, 1.643489, -1.177927, 0.7333333, 0, 1, 1,
0.8057941, -1.821214, 3.783926, 0.7411765, 0, 1, 1,
0.8078374, -0.9960347, 2.606216, 0.7450981, 0, 1, 1,
0.8109486, -1.106213, 4.172493, 0.7529412, 0, 1, 1,
0.8145995, 1.411805, -0.6222064, 0.7568628, 0, 1, 1,
0.8192779, -1.609272, 2.311912, 0.7647059, 0, 1, 1,
0.8251852, 0.2069485, 1.191058, 0.7686275, 0, 1, 1,
0.8348834, 0.8834205, -0.02701224, 0.7764706, 0, 1, 1,
0.8362639, 0.4322081, 0.505758, 0.7803922, 0, 1, 1,
0.8367359, -1.808102, 0.1660241, 0.7882353, 0, 1, 1,
0.8580441, -0.7120103, 2.601353, 0.7921569, 0, 1, 1,
0.8619593, 0.1292887, 2.060495, 0.8, 0, 1, 1,
0.8623896, -0.6991035, 2.783257, 0.8078431, 0, 1, 1,
0.8637806, -0.89995, 5.029756, 0.8117647, 0, 1, 1,
0.8669767, 0.277463, 2.037052, 0.8196079, 0, 1, 1,
0.8689513, -0.7611899, 2.050996, 0.8235294, 0, 1, 1,
0.8697439, 1.66783, -1.064161, 0.8313726, 0, 1, 1,
0.8698766, -0.5336154, 1.389847, 0.8352941, 0, 1, 1,
0.8702737, 0.6663542, 3.054023, 0.8431373, 0, 1, 1,
0.8775555, 0.8730283, 0.3155392, 0.8470588, 0, 1, 1,
0.8799192, -1.368107, 1.640383, 0.854902, 0, 1, 1,
0.8884456, -0.6873382, 3.50597, 0.8588235, 0, 1, 1,
0.8915892, -0.2134706, 1.73745, 0.8666667, 0, 1, 1,
0.8916011, 0.8005277, 1.074101, 0.8705882, 0, 1, 1,
0.8971996, 0.4767815, 1.425103, 0.8784314, 0, 1, 1,
0.9063218, -0.2227794, 1.933447, 0.8823529, 0, 1, 1,
0.9075187, -0.5388547, 2.7131, 0.8901961, 0, 1, 1,
0.9107462, 2.11177, 0.9325902, 0.8941177, 0, 1, 1,
0.9144888, -2.306094, 2.556715, 0.9019608, 0, 1, 1,
0.91893, -0.8307505, 2.254945, 0.9098039, 0, 1, 1,
0.929438, -0.152969, 1.262897, 0.9137255, 0, 1, 1,
0.9305015, -0.3397575, 1.950082, 0.9215686, 0, 1, 1,
0.9339017, -0.3824388, 2.062233, 0.9254902, 0, 1, 1,
0.9343727, 0.203546, 2.033753, 0.9333333, 0, 1, 1,
0.9414873, -1.548008, 0.5772597, 0.9372549, 0, 1, 1,
0.9478384, 1.292701, 0.1073762, 0.945098, 0, 1, 1,
0.9494774, -0.6759529, 1.500556, 0.9490196, 0, 1, 1,
0.9497055, -0.3713793, 1.576405, 0.9568627, 0, 1, 1,
0.9591693, 0.9404269, 2.017714, 0.9607843, 0, 1, 1,
0.9599403, 0.2155187, 0.642924, 0.9686275, 0, 1, 1,
0.9618803, 1.385682, -1.211081, 0.972549, 0, 1, 1,
0.9632097, -1.358563, 3.786739, 0.9803922, 0, 1, 1,
0.963334, -0.3720117, 0.7966318, 0.9843137, 0, 1, 1,
0.9741423, -0.4350669, 0.8841701, 0.9921569, 0, 1, 1,
0.9791758, -0.06154595, -0.2116267, 0.9960784, 0, 1, 1,
0.9798912, 0.02072066, 2.072385, 1, 0, 0.9960784, 1,
0.9814691, 1.346042, 0.3119816, 1, 0, 0.9882353, 1,
0.9872694, 1.030757, -0.27832, 1, 0, 0.9843137, 1,
0.9913771, 0.5567504, 1.27464, 1, 0, 0.9764706, 1,
0.9915985, -0.2516581, 1.667514, 1, 0, 0.972549, 1,
0.9919812, 0.2973612, 0.4223129, 1, 0, 0.9647059, 1,
0.9931368, -1.350222, 2.713374, 1, 0, 0.9607843, 1,
0.9992082, -0.06400472, 2.487998, 1, 0, 0.9529412, 1,
0.9996995, 0.7266065, 0.1134682, 1, 0, 0.9490196, 1,
1.004119, -0.3074219, 0.8856532, 1, 0, 0.9411765, 1,
1.016794, -0.6364704, 2.683519, 1, 0, 0.9372549, 1,
1.018959, 0.6698666, 0.7015567, 1, 0, 0.9294118, 1,
1.025368, 0.3812729, 2.379828, 1, 0, 0.9254902, 1,
1.028106, -0.43622, 1.399027, 1, 0, 0.9176471, 1,
1.035676, 0.6128452, -0.1940226, 1, 0, 0.9137255, 1,
1.044951, 0.08669536, 2.337479, 1, 0, 0.9058824, 1,
1.045488, 1.418082, 0.1241507, 1, 0, 0.9019608, 1,
1.045692, 0.5055828, 0.9858364, 1, 0, 0.8941177, 1,
1.04687, 2.168169, -0.1386911, 1, 0, 0.8862745, 1,
1.047246, 1.167344, -0.4804403, 1, 0, 0.8823529, 1,
1.049253, 0.9361737, 1.107377, 1, 0, 0.8745098, 1,
1.050736, -0.2479905, 1.125268, 1, 0, 0.8705882, 1,
1.054104, 1.335785, 0.5502284, 1, 0, 0.8627451, 1,
1.058969, 0.6842737, 1.838488, 1, 0, 0.8588235, 1,
1.062745, 0.3848774, 2.07501, 1, 0, 0.8509804, 1,
1.063581, -0.8770069, 2.447639, 1, 0, 0.8470588, 1,
1.078955, -0.855875, 2.063711, 1, 0, 0.8392157, 1,
1.079527, -1.111465, 3.214275, 1, 0, 0.8352941, 1,
1.092556, -0.05397478, 1.726414, 1, 0, 0.827451, 1,
1.098803, 0.2074549, 0.1963586, 1, 0, 0.8235294, 1,
1.10078, 0.2318433, 1.444961, 1, 0, 0.8156863, 1,
1.102381, 0.4763946, 1.957092, 1, 0, 0.8117647, 1,
1.107451, -1.39988, 2.857656, 1, 0, 0.8039216, 1,
1.113827, 0.7054505, 0.7991738, 1, 0, 0.7960784, 1,
1.115059, -0.5354924, 3.096448, 1, 0, 0.7921569, 1,
1.116833, -0.2670217, 2.270355, 1, 0, 0.7843137, 1,
1.118008, -0.1572977, 1.284128, 1, 0, 0.7803922, 1,
1.121919, -1.006887, 0.6903433, 1, 0, 0.772549, 1,
1.122214, -0.2367368, 2.540486, 1, 0, 0.7686275, 1,
1.12515, -0.7137688, 1.648536, 1, 0, 0.7607843, 1,
1.125236, -1.134382, 2.472056, 1, 0, 0.7568628, 1,
1.129127, 1.650639, 0.245455, 1, 0, 0.7490196, 1,
1.130996, 0.9196298, 2.573284, 1, 0, 0.7450981, 1,
1.133781, 0.3784817, 2.032262, 1, 0, 0.7372549, 1,
1.138411, -0.4309027, 2.30725, 1, 0, 0.7333333, 1,
1.138748, -2.15949, 4.186489, 1, 0, 0.7254902, 1,
1.138861, -1.180501, 2.100728, 1, 0, 0.7215686, 1,
1.144396, 0.06864481, 1.304378, 1, 0, 0.7137255, 1,
1.155968, -0.4151221, 0.7982603, 1, 0, 0.7098039, 1,
1.15988, -0.5965993, 2.126233, 1, 0, 0.7019608, 1,
1.175191, 0.06739001, 1.356337, 1, 0, 0.6941177, 1,
1.175347, 0.9476806, -1.768551, 1, 0, 0.6901961, 1,
1.179721, -0.5531021, 2.286623, 1, 0, 0.682353, 1,
1.183863, 0.2545771, 1.417608, 1, 0, 0.6784314, 1,
1.187508, 0.4057278, 1.412827, 1, 0, 0.6705883, 1,
1.189299, 0.06208491, -1.095694, 1, 0, 0.6666667, 1,
1.190988, 0.9930863, 1.093561, 1, 0, 0.6588235, 1,
1.194399, 0.7471801, 0.5504065, 1, 0, 0.654902, 1,
1.198835, -0.4580558, 1.920552, 1, 0, 0.6470588, 1,
1.203054, 0.8827832, 1.878408, 1, 0, 0.6431373, 1,
1.20932, 1.086513, -0.04544718, 1, 0, 0.6352941, 1,
1.210413, 0.3448384, 2.617877, 1, 0, 0.6313726, 1,
1.2128, 0.4414445, 1.05671, 1, 0, 0.6235294, 1,
1.225872, 0.3784085, 0.6707895, 1, 0, 0.6196079, 1,
1.22657, 0.9978991, 0.5792555, 1, 0, 0.6117647, 1,
1.227728, -0.8425335, 1.401676, 1, 0, 0.6078432, 1,
1.230624, 0.9110553, 1.55663, 1, 0, 0.6, 1,
1.244956, -0.3969957, 3.153267, 1, 0, 0.5921569, 1,
1.249699, -0.3421749, 0.7971795, 1, 0, 0.5882353, 1,
1.252997, 0.7318738, -0.1357397, 1, 0, 0.5803922, 1,
1.254596, -0.02271946, 2.294741, 1, 0, 0.5764706, 1,
1.262628, -0.1428849, 0.3552502, 1, 0, 0.5686275, 1,
1.268255, -0.7996857, 2.492568, 1, 0, 0.5647059, 1,
1.270218, -1.024308, 2.168637, 1, 0, 0.5568628, 1,
1.287114, 0.9613123, 1.002897, 1, 0, 0.5529412, 1,
1.290413, 1.664363, -0.932134, 1, 0, 0.5450981, 1,
1.29393, -0.5587761, 0.9106032, 1, 0, 0.5411765, 1,
1.295061, 1.391232, 2.975421, 1, 0, 0.5333334, 1,
1.310521, 0.7708369, 0.2928655, 1, 0, 0.5294118, 1,
1.312365, -0.3112933, -0.6732467, 1, 0, 0.5215687, 1,
1.31409, 0.5151699, 1.85225, 1, 0, 0.5176471, 1,
1.31559, -0.7595509, 2.135743, 1, 0, 0.509804, 1,
1.321778, -1.360527, 3.760781, 1, 0, 0.5058824, 1,
1.331784, -0.4522198, 2.46761, 1, 0, 0.4980392, 1,
1.333594, 0.05902712, 1.193803, 1, 0, 0.4901961, 1,
1.335299, 0.09427821, 2.833021, 1, 0, 0.4862745, 1,
1.338233, -0.4069876, 0.9113495, 1, 0, 0.4784314, 1,
1.3404, -0.6917492, 2.392273, 1, 0, 0.4745098, 1,
1.343734, 0.04600041, 0.4573173, 1, 0, 0.4666667, 1,
1.345124, 0.2496969, 1.464092, 1, 0, 0.4627451, 1,
1.370401, -0.1459906, 4.203969, 1, 0, 0.454902, 1,
1.378221, 1.213844, -1.170007, 1, 0, 0.4509804, 1,
1.381138, 1.026752, -1.255801, 1, 0, 0.4431373, 1,
1.38641, -0.2556923, 1.95459, 1, 0, 0.4392157, 1,
1.394068, 1.686491, 0.9557533, 1, 0, 0.4313726, 1,
1.39929, -0.1950708, 1.508131, 1, 0, 0.427451, 1,
1.412276, 0.3732452, 0.7636746, 1, 0, 0.4196078, 1,
1.413692, 0.8075327, 1.092162, 1, 0, 0.4156863, 1,
1.420296, 1.237492, 0.2934994, 1, 0, 0.4078431, 1,
1.424237, 1.173991, -0.23087, 1, 0, 0.4039216, 1,
1.428854, 0.3635789, 2.697066, 1, 0, 0.3960784, 1,
1.430794, -1.365984, 2.1135, 1, 0, 0.3882353, 1,
1.436209, -2.604928, 1.056112, 1, 0, 0.3843137, 1,
1.440493, -1.201386, 3.067169, 1, 0, 0.3764706, 1,
1.445668, -0.5550298, 1.425959, 1, 0, 0.372549, 1,
1.452758, -0.6751286, 2.25218, 1, 0, 0.3647059, 1,
1.480085, -0.773122, 1.192207, 1, 0, 0.3607843, 1,
1.499302, -0.8687165, 2.223009, 1, 0, 0.3529412, 1,
1.504516, 0.0255064, -0.04022521, 1, 0, 0.3490196, 1,
1.516652, -0.2249314, 2.334879, 1, 0, 0.3411765, 1,
1.516975, -0.6781012, 0.6718483, 1, 0, 0.3372549, 1,
1.529687, 0.2817137, -0.1971011, 1, 0, 0.3294118, 1,
1.533089, 0.888831, 0.5059494, 1, 0, 0.3254902, 1,
1.544402, 1.143178, 1.311956, 1, 0, 0.3176471, 1,
1.550011, -0.7271986, 2.759508, 1, 0, 0.3137255, 1,
1.55554, 0.01390533, 2.241928, 1, 0, 0.3058824, 1,
1.57918, -0.906998, 3.225166, 1, 0, 0.2980392, 1,
1.589767, 0.7635936, 0.5335746, 1, 0, 0.2941177, 1,
1.606581, -1.68516, 2.676647, 1, 0, 0.2862745, 1,
1.610418, -0.5531828, 1.013084, 1, 0, 0.282353, 1,
1.623347, -0.6578692, 0.5224447, 1, 0, 0.2745098, 1,
1.631835, 0.01569178, 1.270818, 1, 0, 0.2705882, 1,
1.636325, 0.8519163, 0.8911158, 1, 0, 0.2627451, 1,
1.650594, 0.1586418, 1.100833, 1, 0, 0.2588235, 1,
1.659052, -1.337074, 1.343211, 1, 0, 0.2509804, 1,
1.664828, 1.413178, 1.825563, 1, 0, 0.2470588, 1,
1.668563, -0.670151, 1.985656, 1, 0, 0.2392157, 1,
1.684629, -0.05502156, 3.3226, 1, 0, 0.2352941, 1,
1.692987, 0.600489, 0.06892092, 1, 0, 0.227451, 1,
1.704576, 2.134791, 0.9760025, 1, 0, 0.2235294, 1,
1.745539, 0.887179, 2.168722, 1, 0, 0.2156863, 1,
1.747419, -1.402316, 3.242492, 1, 0, 0.2117647, 1,
1.76382, -0.5812502, 0.6047946, 1, 0, 0.2039216, 1,
1.76413, 1.337128, 1.302797, 1, 0, 0.1960784, 1,
1.77193, 1.136527, 0.3216284, 1, 0, 0.1921569, 1,
1.814631, -0.01557145, 2.446917, 1, 0, 0.1843137, 1,
1.82237, 0.3237379, 1.637011, 1, 0, 0.1803922, 1,
1.823551, -0.1418929, 1.55233, 1, 0, 0.172549, 1,
1.840035, 0.7478988, 1.684719, 1, 0, 0.1686275, 1,
1.850547, 0.7826554, 1.023194, 1, 0, 0.1607843, 1,
1.856193, -0.107156, -0.348586, 1, 0, 0.1568628, 1,
1.876521, -0.5565752, 0.6396323, 1, 0, 0.1490196, 1,
1.879009, 1.208446, 2.003684, 1, 0, 0.145098, 1,
1.880861, -0.02594358, 1.134225, 1, 0, 0.1372549, 1,
1.909232, -0.2020304, 1.760419, 1, 0, 0.1333333, 1,
1.932927, 1.07773, 1.231096, 1, 0, 0.1254902, 1,
1.942961, 1.533818, 2.990355, 1, 0, 0.1215686, 1,
2.046419, 0.002891124, 3.991565, 1, 0, 0.1137255, 1,
2.055699, 1.072287, 2.794127, 1, 0, 0.1098039, 1,
2.073548, -0.6949749, 3.083123, 1, 0, 0.1019608, 1,
2.096697, 0.1472779, 1.522189, 1, 0, 0.09411765, 1,
2.11555, 0.8729515, 3.087827, 1, 0, 0.09019608, 1,
2.119364, 1.7379, 1.339795, 1, 0, 0.08235294, 1,
2.124097, -0.2314338, 1.541266, 1, 0, 0.07843138, 1,
2.126507, 1.53109, 0.6944999, 1, 0, 0.07058824, 1,
2.171288, -1.372804, 2.732762, 1, 0, 0.06666667, 1,
2.173031, -1.184086, 1.162109, 1, 0, 0.05882353, 1,
2.378531, 0.1039907, 0.3366481, 1, 0, 0.05490196, 1,
2.451775, 0.4197213, 2.724697, 1, 0, 0.04705882, 1,
2.489161, 0.5827224, 1.157968, 1, 0, 0.04313726, 1,
2.523607, -0.4119554, 3.22545, 1, 0, 0.03529412, 1,
2.559417, -0.1035928, 1.41912, 1, 0, 0.03137255, 1,
2.561676, 0.9242609, 0.2105704, 1, 0, 0.02352941, 1,
2.568023, 1.84501, 1.065834, 1, 0, 0.01960784, 1,
2.636721, 0.674458, -0.1531445, 1, 0, 0.01176471, 1,
3.310236, 0.6302593, -0.1114243, 1, 0, 0.007843138, 1
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
0.2513804, -3.936947, -6.806745, 0, -0.5, 0.5, 0.5,
0.2513804, -3.936947, -6.806745, 1, -0.5, 0.5, 0.5,
0.2513804, -3.936947, -6.806745, 1, 1.5, 0.5, 0.5,
0.2513804, -3.936947, -6.806745, 0, 1.5, 0.5, 0.5
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
-3.844427, 0.2175125, -6.806745, 0, -0.5, 0.5, 0.5,
-3.844427, 0.2175125, -6.806745, 1, -0.5, 0.5, 0.5,
-3.844427, 0.2175125, -6.806745, 1, 1.5, 0.5, 0.5,
-3.844427, 0.2175125, -6.806745, 0, 1.5, 0.5, 0.5
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
-3.844427, -3.936947, 0.2151816, 0, -0.5, 0.5, 0.5,
-3.844427, -3.936947, 0.2151816, 1, -0.5, 0.5, 0.5,
-3.844427, -3.936947, 0.2151816, 1, 1.5, 0.5, 0.5,
-3.844427, -3.936947, 0.2151816, 0, 1.5, 0.5, 0.5
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
-2, -2.978226, -5.1863,
3, -2.978226, -5.1863,
-2, -2.978226, -5.1863,
-2, -3.138013, -5.456374,
-1, -2.978226, -5.1863,
-1, -3.138013, -5.456374,
0, -2.978226, -5.1863,
0, -3.138013, -5.456374,
1, -2.978226, -5.1863,
1, -3.138013, -5.456374,
2, -2.978226, -5.1863,
2, -3.138013, -5.456374,
3, -2.978226, -5.1863,
3, -3.138013, -5.456374
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
-2, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
-2, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
-2, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
-2, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5,
-1, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
-1, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
-1, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
-1, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5,
0, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
0, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
0, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
0, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5,
1, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
1, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
1, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
1, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5,
2, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
2, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
2, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
2, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5,
3, -3.457586, -5.996522, 0, -0.5, 0.5, 0.5,
3, -3.457586, -5.996522, 1, -0.5, 0.5, 0.5,
3, -3.457586, -5.996522, 1, 1.5, 0.5, 0.5,
3, -3.457586, -5.996522, 0, 1.5, 0.5, 0.5
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
-2.899241, -2, -5.1863,
-2.899241, 3, -5.1863,
-2.899241, -2, -5.1863,
-3.056772, -2, -5.456374,
-2.899241, -1, -5.1863,
-3.056772, -1, -5.456374,
-2.899241, 0, -5.1863,
-3.056772, 0, -5.456374,
-2.899241, 1, -5.1863,
-3.056772, 1, -5.456374,
-2.899241, 2, -5.1863,
-3.056772, 2, -5.456374,
-2.899241, 3, -5.1863,
-3.056772, 3, -5.456374
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
-3.371834, -2, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, -2, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, -2, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, -2, -5.996522, 0, 1.5, 0.5, 0.5,
-3.371834, -1, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, -1, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, -1, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, -1, -5.996522, 0, 1.5, 0.5, 0.5,
-3.371834, 0, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, 0, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, 0, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, 0, -5.996522, 0, 1.5, 0.5, 0.5,
-3.371834, 1, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, 1, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, 1, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, 1, -5.996522, 0, 1.5, 0.5, 0.5,
-3.371834, 2, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, 2, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, 2, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, 2, -5.996522, 0, 1.5, 0.5, 0.5,
-3.371834, 3, -5.996522, 0, -0.5, 0.5, 0.5,
-3.371834, 3, -5.996522, 1, -0.5, 0.5, 0.5,
-3.371834, 3, -5.996522, 1, 1.5, 0.5, 0.5,
-3.371834, 3, -5.996522, 0, 1.5, 0.5, 0.5
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
-2.899241, -2.978226, -4,
-2.899241, -2.978226, 4,
-2.899241, -2.978226, -4,
-3.056772, -3.138013, -4,
-2.899241, -2.978226, -2,
-3.056772, -3.138013, -2,
-2.899241, -2.978226, 0,
-3.056772, -3.138013, 0,
-2.899241, -2.978226, 2,
-3.056772, -3.138013, 2,
-2.899241, -2.978226, 4,
-3.056772, -3.138013, 4
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
-3.371834, -3.457586, -4, 0, -0.5, 0.5, 0.5,
-3.371834, -3.457586, -4, 1, -0.5, 0.5, 0.5,
-3.371834, -3.457586, -4, 1, 1.5, 0.5, 0.5,
-3.371834, -3.457586, -4, 0, 1.5, 0.5, 0.5,
-3.371834, -3.457586, -2, 0, -0.5, 0.5, 0.5,
-3.371834, -3.457586, -2, 1, -0.5, 0.5, 0.5,
-3.371834, -3.457586, -2, 1, 1.5, 0.5, 0.5,
-3.371834, -3.457586, -2, 0, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 0, 0, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 0, 1, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 0, 1, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 0, 0, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 2, 0, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 2, 1, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 2, 1, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 2, 0, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 4, 0, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 4, 1, -0.5, 0.5, 0.5,
-3.371834, -3.457586, 4, 1, 1.5, 0.5, 0.5,
-3.371834, -3.457586, 4, 0, 1.5, 0.5, 0.5
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
-2.899241, -2.978226, -5.1863,
-2.899241, 3.413251, -5.1863,
-2.899241, -2.978226, 5.616663,
-2.899241, 3.413251, 5.616663,
-2.899241, -2.978226, -5.1863,
-2.899241, -2.978226, 5.616663,
-2.899241, 3.413251, -5.1863,
-2.899241, 3.413251, 5.616663,
-2.899241, -2.978226, -5.1863,
3.402002, -2.978226, -5.1863,
-2.899241, -2.978226, 5.616663,
3.402002, -2.978226, 5.616663,
-2.899241, 3.413251, -5.1863,
3.402002, 3.413251, -5.1863,
-2.899241, 3.413251, 5.616663,
3.402002, 3.413251, 5.616663,
3.402002, -2.978226, -5.1863,
3.402002, 3.413251, -5.1863,
3.402002, -2.978226, 5.616663,
3.402002, 3.413251, 5.616663,
3.402002, -2.978226, -5.1863,
3.402002, -2.978226, 5.616663,
3.402002, 3.413251, -5.1863,
3.402002, 3.413251, 5.616663
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
var radius = 7.499731;
var distance = 33.36715;
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
mvMatrix.translate( -0.2513804, -0.2175125, -0.2151816 );
mvMatrix.scale( 1.286866, 1.268698, 0.750614 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.36715);
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
ethyl_pyrophosphate<-read.table("ethyl_pyrophosphate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_pyrophosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
y<-ethyl_pyrophosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
```

```r
z<-ethyl_pyrophosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_pyrophosphate' not found
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
-2.807475, 0.7231984, -1.706826, 0, 0, 1, 1, 1,
-2.754112, 2.162512, -0.4769547, 1, 0, 0, 1, 1,
-2.613682, 0.8295676, -1.23805, 1, 0, 0, 1, 1,
-2.569009, 0.9876019, -1.989762, 1, 0, 0, 1, 1,
-2.414812, -2.523514, -0.5939744, 1, 0, 0, 1, 1,
-2.319263, 1.299283, -2.609349, 1, 0, 0, 1, 1,
-2.294671, -0.1836976, -0.6395559, 0, 0, 0, 1, 1,
-2.289874, -0.5899394, -0.474746, 0, 0, 0, 1, 1,
-2.289003, -0.7572244, -1.727904, 0, 0, 0, 1, 1,
-2.274634, -1.395782, -1.682382, 0, 0, 0, 1, 1,
-2.237876, 0.4562196, -0.2288995, 0, 0, 0, 1, 1,
-2.231514, 0.5954486, -0.1537624, 0, 0, 0, 1, 1,
-2.231076, -0.3635103, -0.9232429, 0, 0, 0, 1, 1,
-2.112875, 0.1035444, -2.095757, 1, 1, 1, 1, 1,
-2.083334, 2.03332, -1.783278, 1, 1, 1, 1, 1,
-2.046772, 1.504296, 0.6262593, 1, 1, 1, 1, 1,
-2.046371, -1.062642, -2.407573, 1, 1, 1, 1, 1,
-2.016756, -0.0903394, -1.532203, 1, 1, 1, 1, 1,
-2.004879, -0.6205502, -0.2733172, 1, 1, 1, 1, 1,
-1.995207, 0.4559477, -0.9795482, 1, 1, 1, 1, 1,
-1.936878, 0.6977181, -0.2906707, 1, 1, 1, 1, 1,
-1.928841, -0.6963965, -3.494122, 1, 1, 1, 1, 1,
-1.926883, 1.022588, -1.897883, 1, 1, 1, 1, 1,
-1.925453, 0.2002395, -3.417167, 1, 1, 1, 1, 1,
-1.924666, -1.227278, -2.012208, 1, 1, 1, 1, 1,
-1.906387, 0.6268364, -1.833816, 1, 1, 1, 1, 1,
-1.898403, 0.1275924, -2.300133, 1, 1, 1, 1, 1,
-1.880758, 0.02669844, -1.588536, 1, 1, 1, 1, 1,
-1.846091, -0.5110968, -2.000106, 0, 0, 1, 1, 1,
-1.843254, 0.5443814, -0.2895477, 1, 0, 0, 1, 1,
-1.836401, 0.01890249, -0.7848252, 1, 0, 0, 1, 1,
-1.831477, -1.138579, -0.2581177, 1, 0, 0, 1, 1,
-1.824306, 0.1305909, -1.666424, 1, 0, 0, 1, 1,
-1.802166, -0.6630095, -2.809855, 1, 0, 0, 1, 1,
-1.779715, 0.5050495, -2.33497, 0, 0, 0, 1, 1,
-1.772948, 1.335699, -1.40895, 0, 0, 0, 1, 1,
-1.752045, 0.1650591, -1.401033, 0, 0, 0, 1, 1,
-1.751836, 0.6842357, -0.7909929, 0, 0, 0, 1, 1,
-1.751016, 1.327786, 0.8652567, 0, 0, 0, 1, 1,
-1.74817, 2.077091, 0.3996594, 0, 0, 0, 1, 1,
-1.734727, -0.1026951, -0.4610513, 0, 0, 0, 1, 1,
-1.732567, 1.545128, -1.531863, 1, 1, 1, 1, 1,
-1.731543, -0.7127451, -1.454548, 1, 1, 1, 1, 1,
-1.716465, 0.2666667, -2.303783, 1, 1, 1, 1, 1,
-1.699361, -0.1664023, -2.610803, 1, 1, 1, 1, 1,
-1.681366, 0.3292738, -0.6358721, 1, 1, 1, 1, 1,
-1.681083, 0.2738019, -0.8365208, 1, 1, 1, 1, 1,
-1.677097, 1.103981, -0.8421474, 1, 1, 1, 1, 1,
-1.675786, 1.082347, -2.720394, 1, 1, 1, 1, 1,
-1.670628, -1.566087, -2.191062, 1, 1, 1, 1, 1,
-1.669217, -0.4551529, -1.103886, 1, 1, 1, 1, 1,
-1.66891, 0.9932427, 0.6156886, 1, 1, 1, 1, 1,
-1.666272, -0.2550968, -2.571996, 1, 1, 1, 1, 1,
-1.636253, 1.912662, -0.5579975, 1, 1, 1, 1, 1,
-1.630993, 0.9892675, -1.329352, 1, 1, 1, 1, 1,
-1.604561, -0.345699, -3.051901, 1, 1, 1, 1, 1,
-1.601684, 0.1147889, -1.433109, 0, 0, 1, 1, 1,
-1.590191, -0.5134683, -2.473303, 1, 0, 0, 1, 1,
-1.585969, -2.24399, -2.626097, 1, 0, 0, 1, 1,
-1.563825, 0.8685759, -1.510346, 1, 0, 0, 1, 1,
-1.561971, 1.478074, -0.7323563, 1, 0, 0, 1, 1,
-1.561784, -0.5312741, -1.896155, 1, 0, 0, 1, 1,
-1.553858, -0.9450619, -1.060416, 0, 0, 0, 1, 1,
-1.545501, -0.7755771, -3.144939, 0, 0, 0, 1, 1,
-1.537504, -2.285811, -2.653294, 0, 0, 0, 1, 1,
-1.52793, 0.05697063, -0.7793741, 0, 0, 0, 1, 1,
-1.527645, -0.9945865, -4.356239, 0, 0, 0, 1, 1,
-1.52697, 0.9554278, -0.140282, 0, 0, 0, 1, 1,
-1.486835, 0.4110132, -1.484538, 0, 0, 0, 1, 1,
-1.479771, 0.0274242, -0.8613905, 1, 1, 1, 1, 1,
-1.476228, -0.2552401, -1.323799, 1, 1, 1, 1, 1,
-1.473935, -0.5937976, -1.390045, 1, 1, 1, 1, 1,
-1.467009, -0.8659225, -2.872124, 1, 1, 1, 1, 1,
-1.465616, 2.116903, -3.276571, 1, 1, 1, 1, 1,
-1.458668, 0.4009343, -1.194259, 1, 1, 1, 1, 1,
-1.45398, 0.992168, -1.406998, 1, 1, 1, 1, 1,
-1.451307, -0.2104576, -1.641186, 1, 1, 1, 1, 1,
-1.43576, 0.7345685, 0.779428, 1, 1, 1, 1, 1,
-1.435053, -0.003882145, -1.850626, 1, 1, 1, 1, 1,
-1.415578, -0.03309245, -0.6462314, 1, 1, 1, 1, 1,
-1.413304, 0.5089749, 0.2176353, 1, 1, 1, 1, 1,
-1.411387, -0.123331, -1.278624, 1, 1, 1, 1, 1,
-1.40823, 0.3791847, -1.686355, 1, 1, 1, 1, 1,
-1.403616, 0.7659031, 0.4176428, 1, 1, 1, 1, 1,
-1.402571, 0.7206239, 0.2604547, 0, 0, 1, 1, 1,
-1.396927, -0.9490262, -3.134483, 1, 0, 0, 1, 1,
-1.392144, 0.6817477, 1.20784, 1, 0, 0, 1, 1,
-1.38638, -0.7245747, -3.272493, 1, 0, 0, 1, 1,
-1.380183, 0.6389336, -1.84364, 1, 0, 0, 1, 1,
-1.369372, -1.368535, -1.466541, 1, 0, 0, 1, 1,
-1.363812, -1.868499, -0.898713, 0, 0, 0, 1, 1,
-1.360628, 0.2899357, -1.742766, 0, 0, 0, 1, 1,
-1.355366, 1.467909, 0.24862, 0, 0, 0, 1, 1,
-1.344281, 0.9752653, -0.3765185, 0, 0, 0, 1, 1,
-1.325226, -0.3884265, -2.194866, 0, 0, 0, 1, 1,
-1.324789, -2.144346, -2.113728, 0, 0, 0, 1, 1,
-1.318969, 0.2572075, -0.8798655, 0, 0, 0, 1, 1,
-1.317289, 0.6740425, -0.9036893, 1, 1, 1, 1, 1,
-1.314916, 0.0076387, -1.53734, 1, 1, 1, 1, 1,
-1.308771, 1.117235, -1.578019, 1, 1, 1, 1, 1,
-1.305827, 0.355164, -0.6080336, 1, 1, 1, 1, 1,
-1.301372, 0.004020082, -1.110345, 1, 1, 1, 1, 1,
-1.297324, -0.5327988, -4.804535, 1, 1, 1, 1, 1,
-1.296907, -0.712283, -1.566897, 1, 1, 1, 1, 1,
-1.295771, 0.1311286, -0.4824901, 1, 1, 1, 1, 1,
-1.289492, 0.1542137, -1.161579, 1, 1, 1, 1, 1,
-1.287997, -0.1487538, -4.004632, 1, 1, 1, 1, 1,
-1.282892, 1.694822, -0.7161154, 1, 1, 1, 1, 1,
-1.277391, 0.7007535, -0.0630475, 1, 1, 1, 1, 1,
-1.275782, 1.763191, -0.5105252, 1, 1, 1, 1, 1,
-1.270399, 1.526132, -0.3759946, 1, 1, 1, 1, 1,
-1.269144, 1.167555, -1.728369, 1, 1, 1, 1, 1,
-1.257154, -0.4896181, -1.888754, 0, 0, 1, 1, 1,
-1.252786, -0.9969478, -3.465039, 1, 0, 0, 1, 1,
-1.243202, -0.6153214, -1.168635, 1, 0, 0, 1, 1,
-1.238702, -0.7575338, -2.033463, 1, 0, 0, 1, 1,
-1.218215, 0.6737383, -0.9581034, 1, 0, 0, 1, 1,
-1.214263, -1.144882, -4.064478, 1, 0, 0, 1, 1,
-1.197923, 1.37995, 1.331729, 0, 0, 0, 1, 1,
-1.194575, -1.838891, -3.681722, 0, 0, 0, 1, 1,
-1.19076, 0.1540655, -2.12406, 0, 0, 0, 1, 1,
-1.180114, 0.8782559, -0.5267693, 0, 0, 0, 1, 1,
-1.176569, 0.6042951, -1.584066, 0, 0, 0, 1, 1,
-1.168798, -0.06183093, -3.263361, 0, 0, 0, 1, 1,
-1.16083, -0.3932912, -2.041704, 0, 0, 0, 1, 1,
-1.150671, 1.829278, 0.2476288, 1, 1, 1, 1, 1,
-1.149598, 2.28895, 0.6071557, 1, 1, 1, 1, 1,
-1.145542, -0.9972599, -3.549109, 1, 1, 1, 1, 1,
-1.133623, -1.146714, -2.565049, 1, 1, 1, 1, 1,
-1.132996, -1.583915, -4.660534, 1, 1, 1, 1, 1,
-1.130623, 1.773689, -0.4381059, 1, 1, 1, 1, 1,
-1.12503, -1.885503, -0.7473446, 1, 1, 1, 1, 1,
-1.121305, -0.2428014, -1.254145, 1, 1, 1, 1, 1,
-1.11633, -1.73463, -3.571203, 1, 1, 1, 1, 1,
-1.112169, -0.4715417, -1.077043, 1, 1, 1, 1, 1,
-1.111144, -0.2792271, -1.648921, 1, 1, 1, 1, 1,
-1.110337, 0.04472328, -0.6687219, 1, 1, 1, 1, 1,
-1.109227, -0.05638919, -1.5145, 1, 1, 1, 1, 1,
-1.099723, -0.472619, -2.12689, 1, 1, 1, 1, 1,
-1.088822, 1.345318, -0.1150775, 1, 1, 1, 1, 1,
-1.07719, 0.4264878, -1.994694, 0, 0, 1, 1, 1,
-1.075573, -0.7926305, -2.877621, 1, 0, 0, 1, 1,
-1.074571, -2.665366, -3.307507, 1, 0, 0, 1, 1,
-1.070101, 1.101985, 0.3296236, 1, 0, 0, 1, 1,
-1.054586, -1.803625, -1.559974, 1, 0, 0, 1, 1,
-1.052312, -0.3008877, 0.6790482, 1, 0, 0, 1, 1,
-1.040731, -0.7066299, -3.064304, 0, 0, 0, 1, 1,
-1.030424, 0.9159054, -2.850707, 0, 0, 0, 1, 1,
-1.028872, 1.015265, -1.273175, 0, 0, 0, 1, 1,
-1.028236, -0.3477192, -2.301865, 0, 0, 0, 1, 1,
-1.02713, 0.6484236, -0.8409594, 0, 0, 0, 1, 1,
-1.022048, 1.008121, -1.025947, 0, 0, 0, 1, 1,
-1.020258, -0.571276, -2.18008, 0, 0, 0, 1, 1,
-1.01688, -0.7197841, -3.268593, 1, 1, 1, 1, 1,
-1.011441, 0.6183794, -1.938596, 1, 1, 1, 1, 1,
-0.9990734, 0.04418932, -0.2324976, 1, 1, 1, 1, 1,
-0.9988521, -0.1808772, -1.029776, 1, 1, 1, 1, 1,
-0.9954854, 0.5199984, -2.41268, 1, 1, 1, 1, 1,
-0.9908734, 1.573565, -0.4259309, 1, 1, 1, 1, 1,
-0.9886537, -0.2848592, -0.9599255, 1, 1, 1, 1, 1,
-0.9878218, -0.4692527, -2.734033, 1, 1, 1, 1, 1,
-0.9860997, 1.688054, -0.5984229, 1, 1, 1, 1, 1,
-0.9791326, 1.889809, -1.289483, 1, 1, 1, 1, 1,
-0.9780931, 0.5475722, -1.814879, 1, 1, 1, 1, 1,
-0.9757717, -0.3236288, 0.2057697, 1, 1, 1, 1, 1,
-0.9752231, -1.849818, -4.410166, 1, 1, 1, 1, 1,
-0.9711863, -0.7748989, -3.573323, 1, 1, 1, 1, 1,
-0.970821, -0.1990172, -0.8115235, 1, 1, 1, 1, 1,
-0.9654454, -0.9456096, -1.481974, 0, 0, 1, 1, 1,
-0.9610746, -0.8821602, -2.925438, 1, 0, 0, 1, 1,
-0.9598394, -0.02714893, -1.780932, 1, 0, 0, 1, 1,
-0.9546905, -0.09272329, -0.7577525, 1, 0, 0, 1, 1,
-0.9481108, -0.6103047, -2.727151, 1, 0, 0, 1, 1,
-0.9463935, 2.697684, -0.2470582, 1, 0, 0, 1, 1,
-0.9424536, 0.6442847, -1.947014, 0, 0, 0, 1, 1,
-0.9398047, 0.03365855, -2.535689, 0, 0, 0, 1, 1,
-0.9372443, -2.031317, -1.964123, 0, 0, 0, 1, 1,
-0.9358723, 0.9055846, -0.6721126, 0, 0, 0, 1, 1,
-0.9299514, 0.4238497, -0.5064211, 0, 0, 0, 1, 1,
-0.9299005, -1.448852, -3.348908, 0, 0, 0, 1, 1,
-0.9289964, 0.2919855, -0.6993369, 0, 0, 0, 1, 1,
-0.9257509, -1.609141, -3.942009, 1, 1, 1, 1, 1,
-0.9222472, -1.345047, -1.616931, 1, 1, 1, 1, 1,
-0.9218149, -1.19045, -1.295657, 1, 1, 1, 1, 1,
-0.9206411, -0.9861842, -0.9377737, 1, 1, 1, 1, 1,
-0.9204801, 0.5379917, -0.947834, 1, 1, 1, 1, 1,
-0.9179226, 0.8940597, -0.3668134, 1, 1, 1, 1, 1,
-0.9166558, 0.7630773, 1.397912, 1, 1, 1, 1, 1,
-0.9161215, 1.210416, -3.24373, 1, 1, 1, 1, 1,
-0.9107323, -0.6974872, -2.764904, 1, 1, 1, 1, 1,
-0.9106724, -0.8012469, -1.690639, 1, 1, 1, 1, 1,
-0.9053295, 1.774861, 0.6614017, 1, 1, 1, 1, 1,
-0.9037074, 0.3111482, -1.986923, 1, 1, 1, 1, 1,
-0.8850279, -1.510491, -1.227132, 1, 1, 1, 1, 1,
-0.8846716, 0.87876, -0.4198494, 1, 1, 1, 1, 1,
-0.8819374, -0.6299726, -1.183203, 1, 1, 1, 1, 1,
-0.8791344, -0.8015897, -1.910677, 0, 0, 1, 1, 1,
-0.8784528, 0.2638168, -0.7152344, 1, 0, 0, 1, 1,
-0.8746311, -2.13152, -2.122084, 1, 0, 0, 1, 1,
-0.8739132, -0.7369468, -3.975798, 1, 0, 0, 1, 1,
-0.8660825, 1.582067, -1.471366, 1, 0, 0, 1, 1,
-0.8612216, 2.305088, 0.02538122, 1, 0, 0, 1, 1,
-0.8608844, 1.043517, -1.489774, 0, 0, 0, 1, 1,
-0.8581179, -1.631629, -2.522497, 0, 0, 0, 1, 1,
-0.8463277, -0.5625652, -1.01634, 0, 0, 0, 1, 1,
-0.8439485, 1.367205, 0.815199, 0, 0, 0, 1, 1,
-0.8416353, -0.06159247, -2.162071, 0, 0, 0, 1, 1,
-0.8351652, 0.3535711, -1.863434, 0, 0, 0, 1, 1,
-0.8310181, 3.320171, 0.7446123, 0, 0, 0, 1, 1,
-0.830904, 0.6894066, -1.830204, 1, 1, 1, 1, 1,
-0.8296621, -1.157325, -2.36551, 1, 1, 1, 1, 1,
-0.8284132, 1.393137, 0.8831612, 1, 1, 1, 1, 1,
-0.8220896, 0.4890152, -3.111608, 1, 1, 1, 1, 1,
-0.8144287, -0.1961311, -3.356799, 1, 1, 1, 1, 1,
-0.8100957, -0.6989354, -1.174721, 1, 1, 1, 1, 1,
-0.8038843, -1.013023, -3.400568, 1, 1, 1, 1, 1,
-0.8023499, 1.94473, -1.23388, 1, 1, 1, 1, 1,
-0.7992769, -0.5024681, -3.205274, 1, 1, 1, 1, 1,
-0.7988755, -0.2118938, -2.147591, 1, 1, 1, 1, 1,
-0.7829521, 0.06007726, -2.619449, 1, 1, 1, 1, 1,
-0.7788486, -0.3985623, -1.73604, 1, 1, 1, 1, 1,
-0.7768716, 0.1845385, -1.739598, 1, 1, 1, 1, 1,
-0.7748772, 0.7702666, -0.6061559, 1, 1, 1, 1, 1,
-0.7714108, 0.6522483, -1.685347, 1, 1, 1, 1, 1,
-0.7708651, -1.113703, -1.7679, 0, 0, 1, 1, 1,
-0.7707552, 0.03888378, -2.083242, 1, 0, 0, 1, 1,
-0.7698101, 1.344696, -0.09127242, 1, 0, 0, 1, 1,
-0.7697281, 0.2726638, -2.089349, 1, 0, 0, 1, 1,
-0.7686729, 0.2433569, -2.311958, 1, 0, 0, 1, 1,
-0.7659444, -2.195947, -2.141458, 1, 0, 0, 1, 1,
-0.761684, -1.651642, -2.706309, 0, 0, 0, 1, 1,
-0.7456139, -0.9017193, -3.700827, 0, 0, 0, 1, 1,
-0.7428181, 0.0707735, -1.360663, 0, 0, 0, 1, 1,
-0.7421613, 0.3641854, -2.741245, 0, 0, 0, 1, 1,
-0.7378119, -0.6174786, -1.88179, 0, 0, 0, 1, 1,
-0.7377655, -0.3538573, -2.888009, 0, 0, 0, 1, 1,
-0.7355428, 0.5743197, -0.651486, 0, 0, 0, 1, 1,
-0.7354991, 1.867822, 0.9932506, 1, 1, 1, 1, 1,
-0.73545, 0.1864363, -2.474028, 1, 1, 1, 1, 1,
-0.7332476, -0.5007145, -1.351281, 1, 1, 1, 1, 1,
-0.7304874, -2.885146, -2.202301, 1, 1, 1, 1, 1,
-0.7258913, -1.66641, -3.088501, 1, 1, 1, 1, 1,
-0.7202175, -0.1224955, -2.523165, 1, 1, 1, 1, 1,
-0.7153255, -0.07486389, -0.4069692, 1, 1, 1, 1, 1,
-0.7151177, 0.4117625, -1.708865, 1, 1, 1, 1, 1,
-0.7142908, 0.6142994, -1.05769, 1, 1, 1, 1, 1,
-0.713897, 0.8881904, -1.420866, 1, 1, 1, 1, 1,
-0.7129726, 0.518673, -1.471079, 1, 1, 1, 1, 1,
-0.7122887, -0.05554929, -2.212676, 1, 1, 1, 1, 1,
-0.70673, 0.1906848, -2.083824, 1, 1, 1, 1, 1,
-0.7061056, -1.10211, -2.688702, 1, 1, 1, 1, 1,
-0.7047357, -0.4096634, -1.926968, 1, 1, 1, 1, 1,
-0.7017341, -0.06360901, -3.245703, 0, 0, 1, 1, 1,
-0.6965132, 0.2827483, -1.635687, 1, 0, 0, 1, 1,
-0.6962836, 0.6730194, -1.002347, 1, 0, 0, 1, 1,
-0.689858, 0.4615293, -1.347131, 1, 0, 0, 1, 1,
-0.6819099, 0.350979, -0.2444179, 1, 0, 0, 1, 1,
-0.6643928, -2.033719, -2.995416, 1, 0, 0, 1, 1,
-0.664228, 2.432154, -0.3142295, 0, 0, 0, 1, 1,
-0.6611782, 0.974633, -0.2796235, 0, 0, 0, 1, 1,
-0.6519775, 0.589604, -0.6857721, 0, 0, 0, 1, 1,
-0.6517929, 3.121573, 0.002166557, 0, 0, 0, 1, 1,
-0.6461761, 0.5956626, -2.025012, 0, 0, 0, 1, 1,
-0.6456876, -0.7064358, -2.736489, 0, 0, 0, 1, 1,
-0.6454958, -1.229352, -1.306743, 0, 0, 0, 1, 1,
-0.6293809, -0.6251966, -2.956651, 1, 1, 1, 1, 1,
-0.6270827, 0.6441289, -0.5445785, 1, 1, 1, 1, 1,
-0.6206675, -1.156317, -2.453951, 1, 1, 1, 1, 1,
-0.6184024, 0.3745557, -2.359896, 1, 1, 1, 1, 1,
-0.614651, -0.6806535, -3.294783, 1, 1, 1, 1, 1,
-0.6135395, 0.1293521, -2.037488, 1, 1, 1, 1, 1,
-0.605403, -0.3599398, -2.834669, 1, 1, 1, 1, 1,
-0.6041085, -0.2173137, -2.303282, 1, 1, 1, 1, 1,
-0.6002638, -1.64014, -2.683168, 1, 1, 1, 1, 1,
-0.5954633, 0.3312469, -1.481607, 1, 1, 1, 1, 1,
-0.5943672, -0.3054262, -0.897485, 1, 1, 1, 1, 1,
-0.5920858, -0.197879, -2.720939, 1, 1, 1, 1, 1,
-0.5893635, 1.180896, 1.236515, 1, 1, 1, 1, 1,
-0.5867562, 0.8905067, -2.478897, 1, 1, 1, 1, 1,
-0.5852562, -0.3214792, -0.200709, 1, 1, 1, 1, 1,
-0.57779, -0.9579542, -1.623394, 0, 0, 1, 1, 1,
-0.5767756, 0.09717862, -2.18072, 1, 0, 0, 1, 1,
-0.5736534, -0.9618917, -0.6535718, 1, 0, 0, 1, 1,
-0.5732659, 0.6380893, 0.03515762, 1, 0, 0, 1, 1,
-0.5671178, 0.3996307, -2.285772, 1, 0, 0, 1, 1,
-0.564603, -0.1974934, -3.7901, 1, 0, 0, 1, 1,
-0.5570315, -0.9002651, -4.322753, 0, 0, 0, 1, 1,
-0.5557648, 0.9479457, -2.305294, 0, 0, 0, 1, 1,
-0.5502997, 3.001291, 0.6090615, 0, 0, 0, 1, 1,
-0.5469103, -1.021234, -2.733003, 0, 0, 0, 1, 1,
-0.537013, 0.2304969, -2.927487, 0, 0, 0, 1, 1,
-0.5365548, 0.7428546, -1.284439, 0, 0, 0, 1, 1,
-0.5336879, 0.2012866, -2.093089, 0, 0, 0, 1, 1,
-0.5330317, 2.003649, -0.3078592, 1, 1, 1, 1, 1,
-0.5302414, -0.2290531, -1.514414, 1, 1, 1, 1, 1,
-0.518414, -0.1959831, -2.158494, 1, 1, 1, 1, 1,
-0.5134874, 1.046848, 0.2224877, 1, 1, 1, 1, 1,
-0.50776, -1.081591, -1.189601, 1, 1, 1, 1, 1,
-0.5030682, -2.761902, -3.294492, 1, 1, 1, 1, 1,
-0.4886068, 0.009588582, -2.098796, 1, 1, 1, 1, 1,
-0.4872633, -0.2826228, -2.637293, 1, 1, 1, 1, 1,
-0.4820199, 1.195323, -0.4424089, 1, 1, 1, 1, 1,
-0.4724263, -0.8375269, -1.639063, 1, 1, 1, 1, 1,
-0.4722928, 1.110975, -2.294038, 1, 1, 1, 1, 1,
-0.4701742, -0.4612858, -2.877886, 1, 1, 1, 1, 1,
-0.4616677, 0.827778, 0.1118761, 1, 1, 1, 1, 1,
-0.4598931, -0.757268, -3.761113, 1, 1, 1, 1, 1,
-0.4563257, -0.8620473, -2.621474, 1, 1, 1, 1, 1,
-0.4557528, 0.6951298, -0.2598475, 0, 0, 1, 1, 1,
-0.4537297, 1.683797, -0.08204561, 1, 0, 0, 1, 1,
-0.4531707, 1.408124, -0.8263277, 1, 0, 0, 1, 1,
-0.4496354, 1.519047, 0.4389292, 1, 0, 0, 1, 1,
-0.4437845, -0.9850659, -0.9195876, 1, 0, 0, 1, 1,
-0.4436826, 1.26472, 0.1406795, 1, 0, 0, 1, 1,
-0.4393724, 0.3345924, -1.73481, 0, 0, 0, 1, 1,
-0.4375281, -2.004125, -3.000099, 0, 0, 0, 1, 1,
-0.4315085, 1.554902, -1.174318, 0, 0, 0, 1, 1,
-0.4278988, -0.6248468, -2.428181, 0, 0, 0, 1, 1,
-0.4272933, 0.1129211, -0.342867, 0, 0, 0, 1, 1,
-0.4139023, -2.058093, -3.542498, 0, 0, 0, 1, 1,
-0.4138545, 3.112914, -0.7552333, 0, 0, 0, 1, 1,
-0.4100855, -1.301446, -2.671385, 1, 1, 1, 1, 1,
-0.4096075, 0.5793109, -0.03071893, 1, 1, 1, 1, 1,
-0.4086564, -0.04302292, -0.5444257, 1, 1, 1, 1, 1,
-0.403936, 1.136375, -1.721235, 1, 1, 1, 1, 1,
-0.403253, -0.4324513, -1.552212, 1, 1, 1, 1, 1,
-0.3975769, -0.7618882, -2.637684, 1, 1, 1, 1, 1,
-0.3975006, -0.7347953, -2.954413, 1, 1, 1, 1, 1,
-0.3933162, -1.642178, -2.980733, 1, 1, 1, 1, 1,
-0.3931107, -0.302932, -1.527274, 1, 1, 1, 1, 1,
-0.3926765, 0.01756267, -0.214155, 1, 1, 1, 1, 1,
-0.3920505, -0.1356857, -2.085164, 1, 1, 1, 1, 1,
-0.3905584, -0.4517618, -3.154446, 1, 1, 1, 1, 1,
-0.3875075, -0.01575352, -2.482615, 1, 1, 1, 1, 1,
-0.3862628, 0.3899341, 1.658856, 1, 1, 1, 1, 1,
-0.3842928, -0.9630309, -3.807223, 1, 1, 1, 1, 1,
-0.3752973, -0.6898136, -2.521202, 0, 0, 1, 1, 1,
-0.3747975, 0.7119532, -0.3748505, 1, 0, 0, 1, 1,
-0.3711027, 0.1199289, -3.251943, 1, 0, 0, 1, 1,
-0.3649388, 0.4450828, -1.83379, 1, 0, 0, 1, 1,
-0.3637559, -0.7070322, -3.668625, 1, 0, 0, 1, 1,
-0.3633922, 1.456171, 0.5268656, 1, 0, 0, 1, 1,
-0.3629511, 0.2133425, 0.05247595, 0, 0, 0, 1, 1,
-0.3621331, -1.165515, -3.485421, 0, 0, 0, 1, 1,
-0.3593028, 1.654542, -0.353734, 0, 0, 0, 1, 1,
-0.3541245, 0.1396166, -2.884288, 0, 0, 0, 1, 1,
-0.3492405, 0.2285054, 0.3957411, 0, 0, 0, 1, 1,
-0.3481268, 0.4495321, 1.306659, 0, 0, 0, 1, 1,
-0.3431319, -0.3492608, -1.639187, 0, 0, 0, 1, 1,
-0.3426323, 0.7329288, -1.339571, 1, 1, 1, 1, 1,
-0.3416682, -0.7202787, -2.396791, 1, 1, 1, 1, 1,
-0.3350255, -0.5968558, -3.235749, 1, 1, 1, 1, 1,
-0.3349509, -1.047044, -3.669702, 1, 1, 1, 1, 1,
-0.3345025, 0.1988443, -0.4240344, 1, 1, 1, 1, 1,
-0.3319394, -0.5335875, -3.537462, 1, 1, 1, 1, 1,
-0.3298616, 2.151799, 1.021778, 1, 1, 1, 1, 1,
-0.3280025, 0.6292415, -0.2625555, 1, 1, 1, 1, 1,
-0.3252207, 0.4111353, 1.985051, 1, 1, 1, 1, 1,
-0.3222177, 0.3113465, 1.255609, 1, 1, 1, 1, 1,
-0.321148, -0.4886692, -3.55742, 1, 1, 1, 1, 1,
-0.3207398, -0.365212, -2.830074, 1, 1, 1, 1, 1,
-0.3181193, 0.2212396, -1.173791, 1, 1, 1, 1, 1,
-0.317604, 0.5053398, -0.08448643, 1, 1, 1, 1, 1,
-0.3173964, 0.2036003, -1.4585, 1, 1, 1, 1, 1,
-0.3165336, -0.05395173, -0.5579555, 0, 0, 1, 1, 1,
-0.3130688, -1.208144, -3.296058, 1, 0, 0, 1, 1,
-0.3094856, 1.568297, 0.7519263, 1, 0, 0, 1, 1,
-0.3055529, 0.7983924, -0.8863611, 1, 0, 0, 1, 1,
-0.301395, 0.5267696, 1.569103, 1, 0, 0, 1, 1,
-0.2958768, -0.724613, -2.308085, 1, 0, 0, 1, 1,
-0.2938919, -0.2025225, -0.7761629, 0, 0, 0, 1, 1,
-0.2931033, 0.8558632, -0.6574469, 0, 0, 0, 1, 1,
-0.2926809, -1.142406, -2.243522, 0, 0, 0, 1, 1,
-0.2865507, 0.3267386, -0.4771737, 0, 0, 0, 1, 1,
-0.285919, 0.9419862, -0.9763287, 0, 0, 0, 1, 1,
-0.2842405, -0.3217415, -1.062595, 0, 0, 0, 1, 1,
-0.2839119, -0.7833632, -1.107048, 0, 0, 0, 1, 1,
-0.2792677, 2.342378, -1.011725, 1, 1, 1, 1, 1,
-0.2783, 0.5937639, -0.927121, 1, 1, 1, 1, 1,
-0.2697459, 1.016293, 0.839021, 1, 1, 1, 1, 1,
-0.2672839, -1.311065, -3.082017, 1, 1, 1, 1, 1,
-0.2670946, -1.128127, -4.198551, 1, 1, 1, 1, 1,
-0.2661512, 1.660669, -1.808144, 1, 1, 1, 1, 1,
-0.2639981, 0.6010643, -2.030319, 1, 1, 1, 1, 1,
-0.2624798, -0.9719859, -2.702809, 1, 1, 1, 1, 1,
-0.2620472, 0.9967391, 2.427376, 1, 1, 1, 1, 1,
-0.2547391, -0.3204118, -2.820685, 1, 1, 1, 1, 1,
-0.2543734, -0.2357643, -3.12787, 1, 1, 1, 1, 1,
-0.2446263, -0.03387707, -2.64736, 1, 1, 1, 1, 1,
-0.2375746, 0.1546414, -0.9502854, 1, 1, 1, 1, 1,
-0.2365741, -1.07235, -2.417648, 1, 1, 1, 1, 1,
-0.2325837, 0.6264638, -0.3745016, 1, 1, 1, 1, 1,
-0.2319777, 0.2897772, -1.223507, 0, 0, 1, 1, 1,
-0.2313913, 0.229698, -2.003601, 1, 0, 0, 1, 1,
-0.2299317, -0.6666722, -3.073702, 1, 0, 0, 1, 1,
-0.2289251, -1.239764, -3.402297, 1, 0, 0, 1, 1,
-0.2284168, 0.3366502, -0.5582776, 1, 0, 0, 1, 1,
-0.2259717, -0.07196632, -2.005207, 1, 0, 0, 1, 1,
-0.2238874, 0.6104795, 0.6089519, 0, 0, 0, 1, 1,
-0.2232222, -0.9784669, -2.692272, 0, 0, 0, 1, 1,
-0.2222447, -1.229001, -2.453895, 0, 0, 0, 1, 1,
-0.221359, -1.032939, -3.578303, 0, 0, 0, 1, 1,
-0.2211956, 0.9789123, -0.5639215, 0, 0, 0, 1, 1,
-0.2211228, -1.017991, -2.353376, 0, 0, 0, 1, 1,
-0.2210371, -0.1472818, -1.24173, 0, 0, 0, 1, 1,
-0.220866, 0.2301819, -2.906789, 1, 1, 1, 1, 1,
-0.2120758, 0.8877122, -1.179218, 1, 1, 1, 1, 1,
-0.2104139, 1.642227, -0.7682093, 1, 1, 1, 1, 1,
-0.2041081, -1.096563, -5.028975, 1, 1, 1, 1, 1,
-0.2019455, 1.259255, 1.791809, 1, 1, 1, 1, 1,
-0.2017098, 0.01248276, -1.887081, 1, 1, 1, 1, 1,
-0.1979895, 0.7584797, 2.184871, 1, 1, 1, 1, 1,
-0.1928802, -0.6197332, -3.696965, 1, 1, 1, 1, 1,
-0.1888075, -1.03085, -1.948246, 1, 1, 1, 1, 1,
-0.1883118, -1.549621, -3.522971, 1, 1, 1, 1, 1,
-0.1807134, -0.667574, -3.668138, 1, 1, 1, 1, 1,
-0.1800346, 0.5148736, -0.2293938, 1, 1, 1, 1, 1,
-0.173936, 0.06302576, -2.600858, 1, 1, 1, 1, 1,
-0.1714014, -0.355614, -1.696365, 1, 1, 1, 1, 1,
-0.1662177, -2.36089, -4.344712, 1, 1, 1, 1, 1,
-0.1607941, 1.329771, -0.3508425, 0, 0, 1, 1, 1,
-0.1605153, 0.7035221, 0.1927749, 1, 0, 0, 1, 1,
-0.1532795, 0.7241712, -1.639143, 1, 0, 0, 1, 1,
-0.1529653, -1.308255, -4.840127, 1, 0, 0, 1, 1,
-0.1510023, -0.2509564, -2.854008, 1, 0, 0, 1, 1,
-0.1446954, -0.4066516, -3.352383, 1, 0, 0, 1, 1,
-0.1446679, 0.6603376, -1.092343, 0, 0, 0, 1, 1,
-0.1419517, -1.556066, -3.436481, 0, 0, 0, 1, 1,
-0.1384099, -1.024231, -5.007154, 0, 0, 0, 1, 1,
-0.1338698, -0.109131, -1.717099, 0, 0, 0, 1, 1,
-0.1330652, -0.08641589, -0.9903325, 0, 0, 0, 1, 1,
-0.1316963, 0.2572262, -1.761521, 0, 0, 0, 1, 1,
-0.1314045, -1.728992, -2.908356, 0, 0, 0, 1, 1,
-0.1309193, -0.8405961, -2.669441, 1, 1, 1, 1, 1,
-0.1295019, 0.8361398, -0.510806, 1, 1, 1, 1, 1,
-0.1227808, -0.2132224, -2.756291, 1, 1, 1, 1, 1,
-0.1198165, 0.3695784, 1.086954, 1, 1, 1, 1, 1,
-0.1178439, 0.1208632, 0.5959622, 1, 1, 1, 1, 1,
-0.1176225, -0.9229752, -3.743218, 1, 1, 1, 1, 1,
-0.1170982, 0.06168562, -0.6616979, 1, 1, 1, 1, 1,
-0.1131535, -1.571651, -2.60779, 1, 1, 1, 1, 1,
-0.1131386, 0.7438722, -0.9410835, 1, 1, 1, 1, 1,
-0.1126813, 0.6412643, 0.1294937, 1, 1, 1, 1, 1,
-0.110846, 0.05189662, 0.308481, 1, 1, 1, 1, 1,
-0.1099614, 0.3848158, 1.411353, 1, 1, 1, 1, 1,
-0.1069429, 0.8745295, -0.2691089, 1, 1, 1, 1, 1,
-0.104377, -0.9442647, -2.695205, 1, 1, 1, 1, 1,
-0.1002906, -0.3029282, -3.020157, 1, 1, 1, 1, 1,
-0.09639278, -0.391324, -1.427592, 0, 0, 1, 1, 1,
-0.08807018, -0.883704, -3.298039, 1, 0, 0, 1, 1,
-0.08611046, 0.6131958, 0.7218342, 1, 0, 0, 1, 1,
-0.08272375, -1.315162, -3.659344, 1, 0, 0, 1, 1,
-0.08222885, -0.229534, -2.578724, 1, 0, 0, 1, 1,
-0.07970629, -1.754296, -3.53137, 1, 0, 0, 1, 1,
-0.07874632, 1.04661, 0.7595585, 0, 0, 0, 1, 1,
-0.07860629, -0.5493913, -3.74915, 0, 0, 0, 1, 1,
-0.07850909, 0.6844613, -0.08324257, 0, 0, 0, 1, 1,
-0.07675687, 1.481879, -0.05249806, 0, 0, 0, 1, 1,
-0.07466023, 1.553931, 1.446755, 0, 0, 0, 1, 1,
-0.07329722, -0.4122511, -2.568159, 0, 0, 0, 1, 1,
-0.07310469, -2.103719, -2.644629, 0, 0, 0, 1, 1,
-0.07259965, -1.776746, -3.928957, 1, 1, 1, 1, 1,
-0.07063362, -0.2303893, -2.884319, 1, 1, 1, 1, 1,
-0.06715963, 0.8611703, 1.097814, 1, 1, 1, 1, 1,
-0.06579007, -0.3798213, -2.030985, 1, 1, 1, 1, 1,
-0.06012387, 0.1345837, -2.556379, 1, 1, 1, 1, 1,
-0.05715389, 0.6855029, 0.9131017, 1, 1, 1, 1, 1,
-0.05427423, 0.6229758, -0.1804749, 1, 1, 1, 1, 1,
-0.04840085, 1.059478, -1.765836, 1, 1, 1, 1, 1,
-0.0481017, 0.9354774, -0.7896939, 1, 1, 1, 1, 1,
-0.04624142, -1.223001, -4.132102, 1, 1, 1, 1, 1,
-0.04589363, 0.1900635, -0.9995, 1, 1, 1, 1, 1,
-0.04310033, -1.619381, -3.134882, 1, 1, 1, 1, 1,
-0.04254586, -0.6984376, -3.646328, 1, 1, 1, 1, 1,
-0.03640388, -0.9713069, -3.860828, 1, 1, 1, 1, 1,
-0.03614397, 1.440856, -0.1927419, 1, 1, 1, 1, 1,
-0.02695816, 1.174991, 0.3601326, 0, 0, 1, 1, 1,
-0.02505113, -0.9364703, -3.327856, 1, 0, 0, 1, 1,
-0.02477091, -0.3414657, -2.544056, 1, 0, 0, 1, 1,
-0.0246316, -2.245082, -3.306456, 1, 0, 0, 1, 1,
-0.01824491, -0.5239872, -3.70494, 1, 0, 0, 1, 1,
-0.0150726, -0.7928941, -1.669068, 1, 0, 0, 1, 1,
-0.01205627, 0.6490517, -1.457656, 0, 0, 0, 1, 1,
-0.01098117, -0.6208047, -4.50098, 0, 0, 0, 1, 1,
-0.008588548, -0.2152676, -3.823453, 0, 0, 0, 1, 1,
-0.004781577, 0.02654613, 0.5656152, 0, 0, 0, 1, 1,
-0.003178433, -0.2798105, -3.183895, 0, 0, 0, 1, 1,
-0.001452272, -0.8632519, -4.842183, 0, 0, 0, 1, 1,
0.0008514898, 1.638025, 1.255528, 0, 0, 0, 1, 1,
0.009228217, -0.9739502, 3.017766, 1, 1, 1, 1, 1,
0.01115644, 1.575751, -0.1931878, 1, 1, 1, 1, 1,
0.01450013, 0.6842307, -0.7185775, 1, 1, 1, 1, 1,
0.01475613, -0.9264889, 4.11512, 1, 1, 1, 1, 1,
0.0155356, -0.7084738, 4.568341, 1, 1, 1, 1, 1,
0.01804222, -0.4494024, 2.96144, 1, 1, 1, 1, 1,
0.01814947, 0.5689895, 0.6813103, 1, 1, 1, 1, 1,
0.01966442, 1.373857, 0.7653973, 1, 1, 1, 1, 1,
0.0208128, 2.437783, 0.7138767, 1, 1, 1, 1, 1,
0.0208794, 0.698042, 0.4858004, 1, 1, 1, 1, 1,
0.02147308, 0.3909578, 0.2998338, 1, 1, 1, 1, 1,
0.04770602, -0.6358124, 3.940217, 1, 1, 1, 1, 1,
0.05124555, -2.207878, 4.932371, 1, 1, 1, 1, 1,
0.05155007, -0.3647768, 2.779438, 1, 1, 1, 1, 1,
0.05405159, -1.197103, 3.769996, 1, 1, 1, 1, 1,
0.05717202, 0.8944724, 0.1077458, 0, 0, 1, 1, 1,
0.05945265, 0.3750912, -1.012446, 1, 0, 0, 1, 1,
0.06210862, -1.155227, 3.101244, 1, 0, 0, 1, 1,
0.06573197, 1.048674, 0.3445334, 1, 0, 0, 1, 1,
0.06586423, 0.530271, -0.5160368, 1, 0, 0, 1, 1,
0.06770907, -1.408385, 1.22692, 1, 0, 0, 1, 1,
0.07000095, 2.449406, 1.653009, 0, 0, 0, 1, 1,
0.07520839, -0.4539715, 4.366808, 0, 0, 0, 1, 1,
0.07521077, 0.1383069, 0.0720012, 0, 0, 0, 1, 1,
0.07838706, 0.6566969, -0.3487887, 0, 0, 0, 1, 1,
0.07931307, -0.3277814, 1.391358, 0, 0, 0, 1, 1,
0.08751721, -0.1857993, 2.885991, 0, 0, 0, 1, 1,
0.09129723, 2.963753, -2.701681, 0, 0, 0, 1, 1,
0.09302504, 1.202883, -0.2400825, 1, 1, 1, 1, 1,
0.09485924, 1.696426, -0.03365104, 1, 1, 1, 1, 1,
0.09585159, 1.251336, 0.3504636, 1, 1, 1, 1, 1,
0.09885664, 1.148083, 1.110534, 1, 1, 1, 1, 1,
0.102041, -0.3358271, 3.218085, 1, 1, 1, 1, 1,
0.1038526, 0.451557, 1.624554, 1, 1, 1, 1, 1,
0.1125121, 0.7178226, 0.4256892, 1, 1, 1, 1, 1,
0.1127026, 1.327328, 0.9325518, 1, 1, 1, 1, 1,
0.1166181, -0.980711, 2.544519, 1, 1, 1, 1, 1,
0.1206888, 0.1875166, 1.127073, 1, 1, 1, 1, 1,
0.1212067, 0.5424553, -0.9735059, 1, 1, 1, 1, 1,
0.1220332, 0.7936602, 1.235426, 1, 1, 1, 1, 1,
0.1249371, 1.621148, -1.576157, 1, 1, 1, 1, 1,
0.1261079, 1.454511, -0.1132617, 1, 1, 1, 1, 1,
0.126479, -0.2388642, 2.711115, 1, 1, 1, 1, 1,
0.1278931, -0.9289859, 0.9620786, 0, 0, 1, 1, 1,
0.1279283, 0.2495676, -0.3087866, 1, 0, 0, 1, 1,
0.1289511, 0.2984755, -0.6788718, 1, 0, 0, 1, 1,
0.130727, 0.1343038, 1.454425, 1, 0, 0, 1, 1,
0.1315652, 0.4582043, 0.2258728, 1, 0, 0, 1, 1,
0.1328619, -1.011743, 2.484542, 1, 0, 0, 1, 1,
0.1415021, 0.1588139, 0.9093574, 0, 0, 0, 1, 1,
0.142907, -1.476768, 2.374177, 0, 0, 0, 1, 1,
0.1473644, -1.131895, 3.434577, 0, 0, 0, 1, 1,
0.1487752, 0.2128373, 0.456627, 0, 0, 0, 1, 1,
0.1491514, 2.117508, 0.5022191, 0, 0, 0, 1, 1,
0.1500239, -0.6617454, 4.353206, 0, 0, 0, 1, 1,
0.151416, 0.5026733, 0.3831333, 0, 0, 0, 1, 1,
0.157817, 1.388466, 1.238518, 1, 1, 1, 1, 1,
0.1590924, -0.8314815, 3.100581, 1, 1, 1, 1, 1,
0.1594777, -0.7153144, 1.472633, 1, 1, 1, 1, 1,
0.1605763, 0.8698146, 2.170088, 1, 1, 1, 1, 1,
0.1730973, -0.1870325, 2.752563, 1, 1, 1, 1, 1,
0.1749905, -0.06339179, 1.845023, 1, 1, 1, 1, 1,
0.176933, -0.2315303, 4.520969, 1, 1, 1, 1, 1,
0.1787469, -0.06296998, 1.476017, 1, 1, 1, 1, 1,
0.1816041, -0.2843517, 3.482592, 1, 1, 1, 1, 1,
0.1844235, -0.06736466, 1.448047, 1, 1, 1, 1, 1,
0.1952878, 2.003482, -0.02645783, 1, 1, 1, 1, 1,
0.19529, -0.3076585, 2.337762, 1, 1, 1, 1, 1,
0.1966243, -0.5437792, 1.801962, 1, 1, 1, 1, 1,
0.1980132, -0.007637628, 1.097833, 1, 1, 1, 1, 1,
0.1980597, -0.3762617, 2.363764, 1, 1, 1, 1, 1,
0.2017279, -0.1801843, -0.8386146, 0, 0, 1, 1, 1,
0.2031504, 2.487493, 0.4314417, 1, 0, 0, 1, 1,
0.2037985, 0.3336748, 2.035529, 1, 0, 0, 1, 1,
0.2057053, -0.02361282, 1.014464, 1, 0, 0, 1, 1,
0.2076456, -1.141289, 2.104929, 1, 0, 0, 1, 1,
0.2119697, 0.1919995, 0.7931541, 1, 0, 0, 1, 1,
0.213843, -0.4436285, 3.812609, 0, 0, 0, 1, 1,
0.2142494, -0.2557655, 4.490325, 0, 0, 0, 1, 1,
0.2145913, 0.1378623, 0.76283, 0, 0, 0, 1, 1,
0.2168757, 1.464292, -1.703649, 0, 0, 0, 1, 1,
0.2199233, -0.9173436, 4.085764, 0, 0, 0, 1, 1,
0.2213631, -1.392707, 2.590998, 0, 0, 0, 1, 1,
0.2218873, -0.3945096, 2.697446, 0, 0, 0, 1, 1,
0.2280436, 0.7052751, 2.634821, 1, 1, 1, 1, 1,
0.2303167, -0.1763493, 0.781363, 1, 1, 1, 1, 1,
0.23399, -0.5253397, 2.281002, 1, 1, 1, 1, 1,
0.2347702, 0.9662965, 0.8062017, 1, 1, 1, 1, 1,
0.2362625, 0.2846731, -0.2058324, 1, 1, 1, 1, 1,
0.2384233, 1.307683, 1.242871, 1, 1, 1, 1, 1,
0.2389441, -0.9549415, 0.9792631, 1, 1, 1, 1, 1,
0.2412993, -0.8643618, 3.851194, 1, 1, 1, 1, 1,
0.2419159, 1.19702, 0.09265794, 1, 1, 1, 1, 1,
0.2622195, 0.3685765, 1.427871, 1, 1, 1, 1, 1,
0.2639772, -0.9649482, 2.896526, 1, 1, 1, 1, 1,
0.2714939, -0.5880383, 2.577283, 1, 1, 1, 1, 1,
0.2759887, 0.1949925, 0.2865536, 1, 1, 1, 1, 1,
0.276807, 2.052302, -0.7660736, 1, 1, 1, 1, 1,
0.2840203, -0.3170742, 2.543755, 1, 1, 1, 1, 1,
0.2846033, 0.9950029, 0.1926762, 0, 0, 1, 1, 1,
0.2890268, -2.156515, 2.385191, 1, 0, 0, 1, 1,
0.2947582, -0.4213228, 3.014468, 1, 0, 0, 1, 1,
0.3054477, 0.9143937, 0.02266387, 1, 0, 0, 1, 1,
0.3089399, 0.6679808, 0.251031, 1, 0, 0, 1, 1,
0.3107139, -0.907441, 1.524594, 1, 0, 0, 1, 1,
0.3118701, -0.4123285, 2.062008, 0, 0, 0, 1, 1,
0.3120985, 1.715849, -1.036466, 0, 0, 0, 1, 1,
0.3173053, 0.9518916, 0.2053632, 0, 0, 0, 1, 1,
0.318892, -0.7024046, 2.924935, 0, 0, 0, 1, 1,
0.3237856, 0.8501515, 0.03633891, 0, 0, 0, 1, 1,
0.3273169, 1.98142, 1.796651, 0, 0, 0, 1, 1,
0.3299799, 0.1131927, 1.585447, 0, 0, 0, 1, 1,
0.3319078, 1.044344, -0.7407677, 1, 1, 1, 1, 1,
0.3336582, -1.042664, 2.819196, 1, 1, 1, 1, 1,
0.336307, 0.916151, 2.426312, 1, 1, 1, 1, 1,
0.3477938, 2.587481, -0.559512, 1, 1, 1, 1, 1,
0.3489383, 0.7059003, -0.611158, 1, 1, 1, 1, 1,
0.3532264, 0.2720325, 1.311872, 1, 1, 1, 1, 1,
0.3535618, -0.9985807, 3.435226, 1, 1, 1, 1, 1,
0.3542592, -1.417509, 3.053789, 1, 1, 1, 1, 1,
0.3582823, 0.5128692, 1.43125, 1, 1, 1, 1, 1,
0.3590451, -0.7756199, 1.670545, 1, 1, 1, 1, 1,
0.3592286, 0.9476513, 0.2627913, 1, 1, 1, 1, 1,
0.3594925, 0.4328914, 0.1054694, 1, 1, 1, 1, 1,
0.3643207, -1.968949, 2.213684, 1, 1, 1, 1, 1,
0.3650639, 0.9540114, -1.57624, 1, 1, 1, 1, 1,
0.3661408, -0.547813, 2.617394, 1, 1, 1, 1, 1,
0.3682104, -2.336281, 2.119835, 0, 0, 1, 1, 1,
0.3688399, 0.499076, 0.5100605, 1, 0, 0, 1, 1,
0.3711133, -1.149403, 2.603116, 1, 0, 0, 1, 1,
0.3717629, -1.351598, 4.210379, 1, 0, 0, 1, 1,
0.372079, -0.5256435, 2.858127, 1, 0, 0, 1, 1,
0.37575, -0.2426042, 2.54728, 1, 0, 0, 1, 1,
0.3802904, -1.168906, 1.95527, 0, 0, 0, 1, 1,
0.3803745, 1.435216, -1.176708, 0, 0, 0, 1, 1,
0.3924915, 0.9860651, 0.9757794, 0, 0, 0, 1, 1,
0.3957542, 0.5287782, 0.1584571, 0, 0, 0, 1, 1,
0.3965757, 0.4526164, 0.05677973, 0, 0, 0, 1, 1,
0.3978975, 0.6249601, -0.1905976, 0, 0, 0, 1, 1,
0.3984413, 0.5453672, 1.038777, 0, 0, 0, 1, 1,
0.3985935, 1.355601, -0.7946336, 1, 1, 1, 1, 1,
0.4011461, 0.04310925, 2.283858, 1, 1, 1, 1, 1,
0.4086332, -1.339629, 3.12258, 1, 1, 1, 1, 1,
0.4127799, -0.7294844, 2.825196, 1, 1, 1, 1, 1,
0.4179709, -0.570415, 2.120232, 1, 1, 1, 1, 1,
0.4189037, -2.381289, 1.63745, 1, 1, 1, 1, 1,
0.4191254, -0.9167953, 3.280393, 1, 1, 1, 1, 1,
0.4191371, -1.803736, 2.712122, 1, 1, 1, 1, 1,
0.4192424, -1.475032, 1.951523, 1, 1, 1, 1, 1,
0.4197806, -0.8569408, 1.702301, 1, 1, 1, 1, 1,
0.4202187, 1.058286, -0.09752377, 1, 1, 1, 1, 1,
0.4245321, 0.113826, 1.011558, 1, 1, 1, 1, 1,
0.4248903, 2.222413, -1.469637, 1, 1, 1, 1, 1,
0.4276044, 0.1989021, 2.010325, 1, 1, 1, 1, 1,
0.4282984, 0.1583838, 1.678106, 1, 1, 1, 1, 1,
0.4297113, 0.4198423, 1.209582, 0, 0, 1, 1, 1,
0.4352045, 0.8412768, -0.4133081, 1, 0, 0, 1, 1,
0.4365599, -0.1254274, 2.573656, 1, 0, 0, 1, 1,
0.442838, 0.1982073, 1.754321, 1, 0, 0, 1, 1,
0.4442922, 0.09910196, -0.1891066, 1, 0, 0, 1, 1,
0.4473678, -1.261196, 2.211204, 1, 0, 0, 1, 1,
0.4501112, -0.2385554, 0.1405619, 0, 0, 0, 1, 1,
0.4502082, -1.393351, 3.241391, 0, 0, 0, 1, 1,
0.4526035, -0.1124296, 1.917545, 0, 0, 0, 1, 1,
0.4526161, -2.432034, 4.44634, 0, 0, 0, 1, 1,
0.45529, 0.4954499, 0.3711995, 0, 0, 0, 1, 1,
0.4624824, -0.2837506, 3.534177, 0, 0, 0, 1, 1,
0.4656568, -0.7330321, 1.866525, 0, 0, 0, 1, 1,
0.4679368, 1.271518, 0.08653321, 1, 1, 1, 1, 1,
0.469013, -1.293952, 5.459339, 1, 1, 1, 1, 1,
0.4693111, 2.615175, 0.1910747, 1, 1, 1, 1, 1,
0.4739745, 0.0580412, 1.932979, 1, 1, 1, 1, 1,
0.4809074, 0.9629285, -1.58746, 1, 1, 1, 1, 1,
0.4817119, 1.443952, 0.544344, 1, 1, 1, 1, 1,
0.4826947, -1.098227, 1.541431, 1, 1, 1, 1, 1,
0.483427, -0.3897829, 2.99441, 1, 1, 1, 1, 1,
0.484691, -0.2007975, 1.143082, 1, 1, 1, 1, 1,
0.4855609, -0.1175201, 1.554132, 1, 1, 1, 1, 1,
0.4859748, 1.915437, 0.4681556, 1, 1, 1, 1, 1,
0.4862144, -1.778087, 3.499399, 1, 1, 1, 1, 1,
0.4918257, 0.05739538, 0.8897231, 1, 1, 1, 1, 1,
0.4929564, 1.177112, 1.239038, 1, 1, 1, 1, 1,
0.4949169, 0.7799978, 2.083989, 1, 1, 1, 1, 1,
0.4984284, 0.8236244, -0.3115045, 0, 0, 1, 1, 1,
0.5028139, -0.5686019, 2.656447, 1, 0, 0, 1, 1,
0.5071192, 0.02857487, 2.021728, 1, 0, 0, 1, 1,
0.507168, 0.7738869, 1.003874, 1, 0, 0, 1, 1,
0.5140882, 1.647913, -0.8192312, 1, 0, 0, 1, 1,
0.5144957, -0.1682725, 2.396108, 1, 0, 0, 1, 1,
0.515376, 0.6038146, 0.9889264, 0, 0, 0, 1, 1,
0.5220394, -0.3100825, 1.322404, 0, 0, 0, 1, 1,
0.5287023, -1.104866, 2.356732, 0, 0, 0, 1, 1,
0.5324473, -0.8099358, 0.7856501, 0, 0, 0, 1, 1,
0.5332197, -1.078839, 3.249487, 0, 0, 0, 1, 1,
0.5334899, 1.318455, 0.3635073, 0, 0, 0, 1, 1,
0.539872, 1.630723, 1.894057, 0, 0, 0, 1, 1,
0.5403735, -0.1013662, 2.270038, 1, 1, 1, 1, 1,
0.5404108, -0.4290909, 1.883577, 1, 1, 1, 1, 1,
0.5411356, -0.4190246, 1.048308, 1, 1, 1, 1, 1,
0.5422626, 0.8434916, 0.9747895, 1, 1, 1, 1, 1,
0.5450609, -0.3475308, 2.06655, 1, 1, 1, 1, 1,
0.5454621, -1.590077, 2.741459, 1, 1, 1, 1, 1,
0.5473614, -0.5132332, 2.63084, 1, 1, 1, 1, 1,
0.553889, -1.306562, 0.7296132, 1, 1, 1, 1, 1,
0.5557872, -1.338788, 2.578947, 1, 1, 1, 1, 1,
0.5582265, 0.8193861, 1.24657, 1, 1, 1, 1, 1,
0.5629439, 0.03258903, 0.6999611, 1, 1, 1, 1, 1,
0.5635481, 0.1339574, -0.5425622, 1, 1, 1, 1, 1,
0.5648152, -1.604448, 2.484151, 1, 1, 1, 1, 1,
0.5648495, 1.985164, -0.235066, 1, 1, 1, 1, 1,
0.5696715, 0.1490037, 0.415987, 1, 1, 1, 1, 1,
0.5758318, -0.2975804, 1.191483, 0, 0, 1, 1, 1,
0.5834506, 0.8637869, -1.457873, 1, 0, 0, 1, 1,
0.5835764, 0.3374175, 0.7110006, 1, 0, 0, 1, 1,
0.5854114, 0.5825567, 2.813702, 1, 0, 0, 1, 1,
0.5869132, -0.3777799, 1.433508, 1, 0, 0, 1, 1,
0.5884212, 0.2623563, 1.113003, 1, 0, 0, 1, 1,
0.5902236, -1.187818, 1.113648, 0, 0, 0, 1, 1,
0.5904728, 0.2682484, 2.692007, 0, 0, 0, 1, 1,
0.5972729, -0.7320027, 3.381261, 0, 0, 0, 1, 1,
0.5987015, -0.2054353, 4.95196, 0, 0, 0, 1, 1,
0.602547, -1.494252, 3.577553, 0, 0, 0, 1, 1,
0.6078216, -0.1139061, 1.308122, 0, 0, 0, 1, 1,
0.6093025, -0.7212183, 1.6845, 0, 0, 0, 1, 1,
0.6137815, 0.3536955, 0.5324098, 1, 1, 1, 1, 1,
0.6161564, -0.1885343, 2.541821, 1, 1, 1, 1, 1,
0.6189396, 0.5599788, 0.2759445, 1, 1, 1, 1, 1,
0.6197627, 1.339339, -0.5174074, 1, 1, 1, 1, 1,
0.6257221, 0.9168436, -0.3208825, 1, 1, 1, 1, 1,
0.6260489, 0.5139429, 0.188408, 1, 1, 1, 1, 1,
0.628231, 0.6509358, -0.1470728, 1, 1, 1, 1, 1,
0.6297458, -1.534984, 2.996022, 1, 1, 1, 1, 1,
0.6312804, -0.2689016, 0.2248441, 1, 1, 1, 1, 1,
0.6319987, -1.921633, 2.815761, 1, 1, 1, 1, 1,
0.6321847, 1.934983, -0.06090352, 1, 1, 1, 1, 1,
0.6322456, -0.6739901, 2.063739, 1, 1, 1, 1, 1,
0.6327165, -1.292571, 2.883881, 1, 1, 1, 1, 1,
0.6327252, 0.6457787, 1.387848, 1, 1, 1, 1, 1,
0.6351107, 0.4473732, 0.03520462, 1, 1, 1, 1, 1,
0.6446009, -0.4494356, 1.808398, 0, 0, 1, 1, 1,
0.6490084, -0.007930771, 1.483687, 1, 0, 0, 1, 1,
0.6522159, 0.526053, 2.061953, 1, 0, 0, 1, 1,
0.6538118, 1.420837, 0.3704647, 1, 0, 0, 1, 1,
0.6556462, -1.750205, 3.758055, 1, 0, 0, 1, 1,
0.6575474, 0.5431742, 0.2297753, 1, 0, 0, 1, 1,
0.659641, -0.2374291, 2.409755, 0, 0, 0, 1, 1,
0.6604957, -0.06457161, 1.66923, 0, 0, 0, 1, 1,
0.6607964, 0.8334073, 1.208238, 0, 0, 0, 1, 1,
0.664165, 0.02413194, 1.658385, 0, 0, 0, 1, 1,
0.6646416, -0.1490898, 2.533322, 0, 0, 0, 1, 1,
0.6650757, -0.4780974, 2.268835, 0, 0, 0, 1, 1,
0.6653777, 0.2210571, -0.3302674, 0, 0, 0, 1, 1,
0.6702183, 0.111621, 1.407859, 1, 1, 1, 1, 1,
0.6706637, 0.7853521, 0.8928236, 1, 1, 1, 1, 1,
0.675615, -0.9942475, 2.311706, 1, 1, 1, 1, 1,
0.6785336, 0.8040231, 0.5129483, 1, 1, 1, 1, 1,
0.6790441, -1.972431, 2.038697, 1, 1, 1, 1, 1,
0.687283, -1.351929, 2.820136, 1, 1, 1, 1, 1,
0.6962916, 1.826563, 0.1465964, 1, 1, 1, 1, 1,
0.6965675, -1.201653, 2.047609, 1, 1, 1, 1, 1,
0.6985143, 1.084263, 1.051663, 1, 1, 1, 1, 1,
0.6989446, 0.4434722, 1.131976, 1, 1, 1, 1, 1,
0.7031977, -0.3398998, 1.231147, 1, 1, 1, 1, 1,
0.7039168, -0.8149641, 2.823744, 1, 1, 1, 1, 1,
0.7062451, -0.2233329, 3.117473, 1, 1, 1, 1, 1,
0.7116931, 0.3837982, 0.2096883, 1, 1, 1, 1, 1,
0.7123515, -0.6723924, 1.488495, 1, 1, 1, 1, 1,
0.7124127, 0.5919942, -0.9135556, 0, 0, 1, 1, 1,
0.7124689, 2.308829, 0.08069302, 1, 0, 0, 1, 1,
0.7139265, -0.9819404, 1.169614, 1, 0, 0, 1, 1,
0.7144662, -0.5487067, 2.922022, 1, 0, 0, 1, 1,
0.7146012, 0.2858199, 0.7776558, 1, 0, 0, 1, 1,
0.7180517, -1.720083, 1.5992, 1, 0, 0, 1, 1,
0.7226871, 1.08823, 0.7116762, 0, 0, 0, 1, 1,
0.7252582, -0.2511431, 1.067142, 0, 0, 0, 1, 1,
0.7287402, 0.7226133, 1.495267, 0, 0, 0, 1, 1,
0.7320735, 0.1685266, 2.618653, 0, 0, 0, 1, 1,
0.7399523, 1.911182, 0.1031799, 0, 0, 0, 1, 1,
0.7415084, 0.5078384, 3.639414, 0, 0, 0, 1, 1,
0.741667, -1.482751, 2.169746, 0, 0, 0, 1, 1,
0.7456379, 0.8919185, -0.3525114, 1, 1, 1, 1, 1,
0.7463137, 0.8297299, 0.4060099, 1, 1, 1, 1, 1,
0.7575177, -1.433674, 3.018303, 1, 1, 1, 1, 1,
0.7579325, -0.1427507, 0.5301115, 1, 1, 1, 1, 1,
0.7591494, -0.2202467, -0.4230297, 1, 1, 1, 1, 1,
0.7593964, -0.1431278, 2.143982, 1, 1, 1, 1, 1,
0.7631159, 0.04607656, 3.480146, 1, 1, 1, 1, 1,
0.7692156, 0.7490427, 0.9251811, 1, 1, 1, 1, 1,
0.7703131, 0.2459307, 0.9348973, 1, 1, 1, 1, 1,
0.7711334, -1.423211, 3.80209, 1, 1, 1, 1, 1,
0.7711596, 1.185926, 1.063029, 1, 1, 1, 1, 1,
0.7777509, 0.7044464, 1.401058, 1, 1, 1, 1, 1,
0.7788184, -0.6169647, 0.04139747, 1, 1, 1, 1, 1,
0.7790145, 1.080613, 1.116793, 1, 1, 1, 1, 1,
0.7815908, -0.8730446, 2.568008, 1, 1, 1, 1, 1,
0.7862371, -0.1005396, 2.442986, 0, 0, 1, 1, 1,
0.7900708, 0.07659142, 0.7981778, 1, 0, 0, 1, 1,
0.7964268, 1.168505, 1.225662, 1, 0, 0, 1, 1,
0.7979217, 0.5363469, 1.264219, 1, 0, 0, 1, 1,
0.7988128, 0.4625273, 1.467714, 1, 0, 0, 1, 1,
0.8038864, 1.643489, -1.177927, 1, 0, 0, 1, 1,
0.8057941, -1.821214, 3.783926, 0, 0, 0, 1, 1,
0.8078374, -0.9960347, 2.606216, 0, 0, 0, 1, 1,
0.8109486, -1.106213, 4.172493, 0, 0, 0, 1, 1,
0.8145995, 1.411805, -0.6222064, 0, 0, 0, 1, 1,
0.8192779, -1.609272, 2.311912, 0, 0, 0, 1, 1,
0.8251852, 0.2069485, 1.191058, 0, 0, 0, 1, 1,
0.8348834, 0.8834205, -0.02701224, 0, 0, 0, 1, 1,
0.8362639, 0.4322081, 0.505758, 1, 1, 1, 1, 1,
0.8367359, -1.808102, 0.1660241, 1, 1, 1, 1, 1,
0.8580441, -0.7120103, 2.601353, 1, 1, 1, 1, 1,
0.8619593, 0.1292887, 2.060495, 1, 1, 1, 1, 1,
0.8623896, -0.6991035, 2.783257, 1, 1, 1, 1, 1,
0.8637806, -0.89995, 5.029756, 1, 1, 1, 1, 1,
0.8669767, 0.277463, 2.037052, 1, 1, 1, 1, 1,
0.8689513, -0.7611899, 2.050996, 1, 1, 1, 1, 1,
0.8697439, 1.66783, -1.064161, 1, 1, 1, 1, 1,
0.8698766, -0.5336154, 1.389847, 1, 1, 1, 1, 1,
0.8702737, 0.6663542, 3.054023, 1, 1, 1, 1, 1,
0.8775555, 0.8730283, 0.3155392, 1, 1, 1, 1, 1,
0.8799192, -1.368107, 1.640383, 1, 1, 1, 1, 1,
0.8884456, -0.6873382, 3.50597, 1, 1, 1, 1, 1,
0.8915892, -0.2134706, 1.73745, 1, 1, 1, 1, 1,
0.8916011, 0.8005277, 1.074101, 0, 0, 1, 1, 1,
0.8971996, 0.4767815, 1.425103, 1, 0, 0, 1, 1,
0.9063218, -0.2227794, 1.933447, 1, 0, 0, 1, 1,
0.9075187, -0.5388547, 2.7131, 1, 0, 0, 1, 1,
0.9107462, 2.11177, 0.9325902, 1, 0, 0, 1, 1,
0.9144888, -2.306094, 2.556715, 1, 0, 0, 1, 1,
0.91893, -0.8307505, 2.254945, 0, 0, 0, 1, 1,
0.929438, -0.152969, 1.262897, 0, 0, 0, 1, 1,
0.9305015, -0.3397575, 1.950082, 0, 0, 0, 1, 1,
0.9339017, -0.3824388, 2.062233, 0, 0, 0, 1, 1,
0.9343727, 0.203546, 2.033753, 0, 0, 0, 1, 1,
0.9414873, -1.548008, 0.5772597, 0, 0, 0, 1, 1,
0.9478384, 1.292701, 0.1073762, 0, 0, 0, 1, 1,
0.9494774, -0.6759529, 1.500556, 1, 1, 1, 1, 1,
0.9497055, -0.3713793, 1.576405, 1, 1, 1, 1, 1,
0.9591693, 0.9404269, 2.017714, 1, 1, 1, 1, 1,
0.9599403, 0.2155187, 0.642924, 1, 1, 1, 1, 1,
0.9618803, 1.385682, -1.211081, 1, 1, 1, 1, 1,
0.9632097, -1.358563, 3.786739, 1, 1, 1, 1, 1,
0.963334, -0.3720117, 0.7966318, 1, 1, 1, 1, 1,
0.9741423, -0.4350669, 0.8841701, 1, 1, 1, 1, 1,
0.9791758, -0.06154595, -0.2116267, 1, 1, 1, 1, 1,
0.9798912, 0.02072066, 2.072385, 1, 1, 1, 1, 1,
0.9814691, 1.346042, 0.3119816, 1, 1, 1, 1, 1,
0.9872694, 1.030757, -0.27832, 1, 1, 1, 1, 1,
0.9913771, 0.5567504, 1.27464, 1, 1, 1, 1, 1,
0.9915985, -0.2516581, 1.667514, 1, 1, 1, 1, 1,
0.9919812, 0.2973612, 0.4223129, 1, 1, 1, 1, 1,
0.9931368, -1.350222, 2.713374, 0, 0, 1, 1, 1,
0.9992082, -0.06400472, 2.487998, 1, 0, 0, 1, 1,
0.9996995, 0.7266065, 0.1134682, 1, 0, 0, 1, 1,
1.004119, -0.3074219, 0.8856532, 1, 0, 0, 1, 1,
1.016794, -0.6364704, 2.683519, 1, 0, 0, 1, 1,
1.018959, 0.6698666, 0.7015567, 1, 0, 0, 1, 1,
1.025368, 0.3812729, 2.379828, 0, 0, 0, 1, 1,
1.028106, -0.43622, 1.399027, 0, 0, 0, 1, 1,
1.035676, 0.6128452, -0.1940226, 0, 0, 0, 1, 1,
1.044951, 0.08669536, 2.337479, 0, 0, 0, 1, 1,
1.045488, 1.418082, 0.1241507, 0, 0, 0, 1, 1,
1.045692, 0.5055828, 0.9858364, 0, 0, 0, 1, 1,
1.04687, 2.168169, -0.1386911, 0, 0, 0, 1, 1,
1.047246, 1.167344, -0.4804403, 1, 1, 1, 1, 1,
1.049253, 0.9361737, 1.107377, 1, 1, 1, 1, 1,
1.050736, -0.2479905, 1.125268, 1, 1, 1, 1, 1,
1.054104, 1.335785, 0.5502284, 1, 1, 1, 1, 1,
1.058969, 0.6842737, 1.838488, 1, 1, 1, 1, 1,
1.062745, 0.3848774, 2.07501, 1, 1, 1, 1, 1,
1.063581, -0.8770069, 2.447639, 1, 1, 1, 1, 1,
1.078955, -0.855875, 2.063711, 1, 1, 1, 1, 1,
1.079527, -1.111465, 3.214275, 1, 1, 1, 1, 1,
1.092556, -0.05397478, 1.726414, 1, 1, 1, 1, 1,
1.098803, 0.2074549, 0.1963586, 1, 1, 1, 1, 1,
1.10078, 0.2318433, 1.444961, 1, 1, 1, 1, 1,
1.102381, 0.4763946, 1.957092, 1, 1, 1, 1, 1,
1.107451, -1.39988, 2.857656, 1, 1, 1, 1, 1,
1.113827, 0.7054505, 0.7991738, 1, 1, 1, 1, 1,
1.115059, -0.5354924, 3.096448, 0, 0, 1, 1, 1,
1.116833, -0.2670217, 2.270355, 1, 0, 0, 1, 1,
1.118008, -0.1572977, 1.284128, 1, 0, 0, 1, 1,
1.121919, -1.006887, 0.6903433, 1, 0, 0, 1, 1,
1.122214, -0.2367368, 2.540486, 1, 0, 0, 1, 1,
1.12515, -0.7137688, 1.648536, 1, 0, 0, 1, 1,
1.125236, -1.134382, 2.472056, 0, 0, 0, 1, 1,
1.129127, 1.650639, 0.245455, 0, 0, 0, 1, 1,
1.130996, 0.9196298, 2.573284, 0, 0, 0, 1, 1,
1.133781, 0.3784817, 2.032262, 0, 0, 0, 1, 1,
1.138411, -0.4309027, 2.30725, 0, 0, 0, 1, 1,
1.138748, -2.15949, 4.186489, 0, 0, 0, 1, 1,
1.138861, -1.180501, 2.100728, 0, 0, 0, 1, 1,
1.144396, 0.06864481, 1.304378, 1, 1, 1, 1, 1,
1.155968, -0.4151221, 0.7982603, 1, 1, 1, 1, 1,
1.15988, -0.5965993, 2.126233, 1, 1, 1, 1, 1,
1.175191, 0.06739001, 1.356337, 1, 1, 1, 1, 1,
1.175347, 0.9476806, -1.768551, 1, 1, 1, 1, 1,
1.179721, -0.5531021, 2.286623, 1, 1, 1, 1, 1,
1.183863, 0.2545771, 1.417608, 1, 1, 1, 1, 1,
1.187508, 0.4057278, 1.412827, 1, 1, 1, 1, 1,
1.189299, 0.06208491, -1.095694, 1, 1, 1, 1, 1,
1.190988, 0.9930863, 1.093561, 1, 1, 1, 1, 1,
1.194399, 0.7471801, 0.5504065, 1, 1, 1, 1, 1,
1.198835, -0.4580558, 1.920552, 1, 1, 1, 1, 1,
1.203054, 0.8827832, 1.878408, 1, 1, 1, 1, 1,
1.20932, 1.086513, -0.04544718, 1, 1, 1, 1, 1,
1.210413, 0.3448384, 2.617877, 1, 1, 1, 1, 1,
1.2128, 0.4414445, 1.05671, 0, 0, 1, 1, 1,
1.225872, 0.3784085, 0.6707895, 1, 0, 0, 1, 1,
1.22657, 0.9978991, 0.5792555, 1, 0, 0, 1, 1,
1.227728, -0.8425335, 1.401676, 1, 0, 0, 1, 1,
1.230624, 0.9110553, 1.55663, 1, 0, 0, 1, 1,
1.244956, -0.3969957, 3.153267, 1, 0, 0, 1, 1,
1.249699, -0.3421749, 0.7971795, 0, 0, 0, 1, 1,
1.252997, 0.7318738, -0.1357397, 0, 0, 0, 1, 1,
1.254596, -0.02271946, 2.294741, 0, 0, 0, 1, 1,
1.262628, -0.1428849, 0.3552502, 0, 0, 0, 1, 1,
1.268255, -0.7996857, 2.492568, 0, 0, 0, 1, 1,
1.270218, -1.024308, 2.168637, 0, 0, 0, 1, 1,
1.287114, 0.9613123, 1.002897, 0, 0, 0, 1, 1,
1.290413, 1.664363, -0.932134, 1, 1, 1, 1, 1,
1.29393, -0.5587761, 0.9106032, 1, 1, 1, 1, 1,
1.295061, 1.391232, 2.975421, 1, 1, 1, 1, 1,
1.310521, 0.7708369, 0.2928655, 1, 1, 1, 1, 1,
1.312365, -0.3112933, -0.6732467, 1, 1, 1, 1, 1,
1.31409, 0.5151699, 1.85225, 1, 1, 1, 1, 1,
1.31559, -0.7595509, 2.135743, 1, 1, 1, 1, 1,
1.321778, -1.360527, 3.760781, 1, 1, 1, 1, 1,
1.331784, -0.4522198, 2.46761, 1, 1, 1, 1, 1,
1.333594, 0.05902712, 1.193803, 1, 1, 1, 1, 1,
1.335299, 0.09427821, 2.833021, 1, 1, 1, 1, 1,
1.338233, -0.4069876, 0.9113495, 1, 1, 1, 1, 1,
1.3404, -0.6917492, 2.392273, 1, 1, 1, 1, 1,
1.343734, 0.04600041, 0.4573173, 1, 1, 1, 1, 1,
1.345124, 0.2496969, 1.464092, 1, 1, 1, 1, 1,
1.370401, -0.1459906, 4.203969, 0, 0, 1, 1, 1,
1.378221, 1.213844, -1.170007, 1, 0, 0, 1, 1,
1.381138, 1.026752, -1.255801, 1, 0, 0, 1, 1,
1.38641, -0.2556923, 1.95459, 1, 0, 0, 1, 1,
1.394068, 1.686491, 0.9557533, 1, 0, 0, 1, 1,
1.39929, -0.1950708, 1.508131, 1, 0, 0, 1, 1,
1.412276, 0.3732452, 0.7636746, 0, 0, 0, 1, 1,
1.413692, 0.8075327, 1.092162, 0, 0, 0, 1, 1,
1.420296, 1.237492, 0.2934994, 0, 0, 0, 1, 1,
1.424237, 1.173991, -0.23087, 0, 0, 0, 1, 1,
1.428854, 0.3635789, 2.697066, 0, 0, 0, 1, 1,
1.430794, -1.365984, 2.1135, 0, 0, 0, 1, 1,
1.436209, -2.604928, 1.056112, 0, 0, 0, 1, 1,
1.440493, -1.201386, 3.067169, 1, 1, 1, 1, 1,
1.445668, -0.5550298, 1.425959, 1, 1, 1, 1, 1,
1.452758, -0.6751286, 2.25218, 1, 1, 1, 1, 1,
1.480085, -0.773122, 1.192207, 1, 1, 1, 1, 1,
1.499302, -0.8687165, 2.223009, 1, 1, 1, 1, 1,
1.504516, 0.0255064, -0.04022521, 1, 1, 1, 1, 1,
1.516652, -0.2249314, 2.334879, 1, 1, 1, 1, 1,
1.516975, -0.6781012, 0.6718483, 1, 1, 1, 1, 1,
1.529687, 0.2817137, -0.1971011, 1, 1, 1, 1, 1,
1.533089, 0.888831, 0.5059494, 1, 1, 1, 1, 1,
1.544402, 1.143178, 1.311956, 1, 1, 1, 1, 1,
1.550011, -0.7271986, 2.759508, 1, 1, 1, 1, 1,
1.55554, 0.01390533, 2.241928, 1, 1, 1, 1, 1,
1.57918, -0.906998, 3.225166, 1, 1, 1, 1, 1,
1.589767, 0.7635936, 0.5335746, 1, 1, 1, 1, 1,
1.606581, -1.68516, 2.676647, 0, 0, 1, 1, 1,
1.610418, -0.5531828, 1.013084, 1, 0, 0, 1, 1,
1.623347, -0.6578692, 0.5224447, 1, 0, 0, 1, 1,
1.631835, 0.01569178, 1.270818, 1, 0, 0, 1, 1,
1.636325, 0.8519163, 0.8911158, 1, 0, 0, 1, 1,
1.650594, 0.1586418, 1.100833, 1, 0, 0, 1, 1,
1.659052, -1.337074, 1.343211, 0, 0, 0, 1, 1,
1.664828, 1.413178, 1.825563, 0, 0, 0, 1, 1,
1.668563, -0.670151, 1.985656, 0, 0, 0, 1, 1,
1.684629, -0.05502156, 3.3226, 0, 0, 0, 1, 1,
1.692987, 0.600489, 0.06892092, 0, 0, 0, 1, 1,
1.704576, 2.134791, 0.9760025, 0, 0, 0, 1, 1,
1.745539, 0.887179, 2.168722, 0, 0, 0, 1, 1,
1.747419, -1.402316, 3.242492, 1, 1, 1, 1, 1,
1.76382, -0.5812502, 0.6047946, 1, 1, 1, 1, 1,
1.76413, 1.337128, 1.302797, 1, 1, 1, 1, 1,
1.77193, 1.136527, 0.3216284, 1, 1, 1, 1, 1,
1.814631, -0.01557145, 2.446917, 1, 1, 1, 1, 1,
1.82237, 0.3237379, 1.637011, 1, 1, 1, 1, 1,
1.823551, -0.1418929, 1.55233, 1, 1, 1, 1, 1,
1.840035, 0.7478988, 1.684719, 1, 1, 1, 1, 1,
1.850547, 0.7826554, 1.023194, 1, 1, 1, 1, 1,
1.856193, -0.107156, -0.348586, 1, 1, 1, 1, 1,
1.876521, -0.5565752, 0.6396323, 1, 1, 1, 1, 1,
1.879009, 1.208446, 2.003684, 1, 1, 1, 1, 1,
1.880861, -0.02594358, 1.134225, 1, 1, 1, 1, 1,
1.909232, -0.2020304, 1.760419, 1, 1, 1, 1, 1,
1.932927, 1.07773, 1.231096, 1, 1, 1, 1, 1,
1.942961, 1.533818, 2.990355, 0, 0, 1, 1, 1,
2.046419, 0.002891124, 3.991565, 1, 0, 0, 1, 1,
2.055699, 1.072287, 2.794127, 1, 0, 0, 1, 1,
2.073548, -0.6949749, 3.083123, 1, 0, 0, 1, 1,
2.096697, 0.1472779, 1.522189, 1, 0, 0, 1, 1,
2.11555, 0.8729515, 3.087827, 1, 0, 0, 1, 1,
2.119364, 1.7379, 1.339795, 0, 0, 0, 1, 1,
2.124097, -0.2314338, 1.541266, 0, 0, 0, 1, 1,
2.126507, 1.53109, 0.6944999, 0, 0, 0, 1, 1,
2.171288, -1.372804, 2.732762, 0, 0, 0, 1, 1,
2.173031, -1.184086, 1.162109, 0, 0, 0, 1, 1,
2.378531, 0.1039907, 0.3366481, 0, 0, 0, 1, 1,
2.451775, 0.4197213, 2.724697, 0, 0, 0, 1, 1,
2.489161, 0.5827224, 1.157968, 1, 1, 1, 1, 1,
2.523607, -0.4119554, 3.22545, 1, 1, 1, 1, 1,
2.559417, -0.1035928, 1.41912, 1, 1, 1, 1, 1,
2.561676, 0.9242609, 0.2105704, 1, 1, 1, 1, 1,
2.568023, 1.84501, 1.065834, 1, 1, 1, 1, 1,
2.636721, 0.674458, -0.1531445, 1, 1, 1, 1, 1,
3.310236, 0.6302593, -0.1114243, 1, 1, 1, 1, 1
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
var radius = 9.352951;
var distance = 32.85184;
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
mvMatrix.translate( -0.2513803, -0.2175125, -0.2151816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.85184);
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
