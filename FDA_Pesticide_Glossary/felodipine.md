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
-2.617105, -0.01807517, -2.781183, 1, 0, 0, 1,
-2.430977, 1.243843, -0.8438655, 1, 0.007843138, 0, 1,
-2.422359, 1.819744, -1.187141, 1, 0.01176471, 0, 1,
-2.411075, -0.5920018, -2.337475, 1, 0.01960784, 0, 1,
-2.394445, 0.3765098, -1.319134, 1, 0.02352941, 0, 1,
-2.365899, 0.4804282, -2.707128, 1, 0.03137255, 0, 1,
-2.349072, -0.1894333, -2.442024, 1, 0.03529412, 0, 1,
-2.281362, 1.673479, -1.412711, 1, 0.04313726, 0, 1,
-2.276166, 0.01863404, -1.93836, 1, 0.04705882, 0, 1,
-2.268302, 1.220454, 0.5441378, 1, 0.05490196, 0, 1,
-2.254556, 1.511743, -1.94942, 1, 0.05882353, 0, 1,
-2.233309, -0.5899843, -2.289708, 1, 0.06666667, 0, 1,
-2.220093, -0.4789215, -1.706146, 1, 0.07058824, 0, 1,
-2.216369, -1.924604, -3.950515, 1, 0.07843138, 0, 1,
-2.198092, -0.06346613, -1.068239, 1, 0.08235294, 0, 1,
-2.169118, -1.681487, -3.075284, 1, 0.09019608, 0, 1,
-2.148932, -2.056911, -3.283411, 1, 0.09411765, 0, 1,
-2.144474, 0.5750829, -0.8294315, 1, 0.1019608, 0, 1,
-2.118316, 0.09688878, -1.432177, 1, 0.1098039, 0, 1,
-2.092939, -0.9988635, -1.436389, 1, 0.1137255, 0, 1,
-2.092757, -0.2939186, -1.363849, 1, 0.1215686, 0, 1,
-2.055745, -0.8015903, -1.297845, 1, 0.1254902, 0, 1,
-2.042133, 1.182254, -1.390299, 1, 0.1333333, 0, 1,
-1.995871, 0.4688062, -2.036075, 1, 0.1372549, 0, 1,
-1.991596, 1.235317, 0.3623852, 1, 0.145098, 0, 1,
-1.945018, 2.099718, -1.717263, 1, 0.1490196, 0, 1,
-1.917861, -0.7321599, -2.878989, 1, 0.1568628, 0, 1,
-1.9098, -1.049739, -0.9700171, 1, 0.1607843, 0, 1,
-1.909451, 0.01888193, -2.218, 1, 0.1686275, 0, 1,
-1.891886, -0.3290145, -1.822936, 1, 0.172549, 0, 1,
-1.869353, -0.6277716, -2.771089, 1, 0.1803922, 0, 1,
-1.864102, -0.531738, -1.984575, 1, 0.1843137, 0, 1,
-1.830893, 1.595977, -2.898634, 1, 0.1921569, 0, 1,
-1.80889, -1.051391, -1.420783, 1, 0.1960784, 0, 1,
-1.808299, -1.199571, -2.879692, 1, 0.2039216, 0, 1,
-1.803383, 0.6517956, -0.01977839, 1, 0.2117647, 0, 1,
-1.769627, -0.8704131, -0.4109105, 1, 0.2156863, 0, 1,
-1.761378, -0.5611897, -2.446444, 1, 0.2235294, 0, 1,
-1.752844, -1.02292, -3.745426, 1, 0.227451, 0, 1,
-1.741203, -1.645969, -4.365853, 1, 0.2352941, 0, 1,
-1.738045, 0.4517469, -4.806351, 1, 0.2392157, 0, 1,
-1.704857, -0.420571, -2.470276, 1, 0.2470588, 0, 1,
-1.694928, -0.7209463, -2.670898, 1, 0.2509804, 0, 1,
-1.677635, 0.1484767, 0.7758815, 1, 0.2588235, 0, 1,
-1.674527, -1.043834, -4.186454, 1, 0.2627451, 0, 1,
-1.671955, -0.8511682, -1.840194, 1, 0.2705882, 0, 1,
-1.669909, 0.5817141, -1.204751, 1, 0.2745098, 0, 1,
-1.660997, -0.1552605, -1.005905, 1, 0.282353, 0, 1,
-1.609936, -0.1758967, 0.1535368, 1, 0.2862745, 0, 1,
-1.594435, 0.1774649, -1.927271, 1, 0.2941177, 0, 1,
-1.587425, -0.07491435, -0.8097103, 1, 0.3019608, 0, 1,
-1.573037, -1.034372, -3.068575, 1, 0.3058824, 0, 1,
-1.571805, 1.156984, -1.284866, 1, 0.3137255, 0, 1,
-1.560281, 1.868572, -1.19319, 1, 0.3176471, 0, 1,
-1.55463, 1.923796, -2.272541, 1, 0.3254902, 0, 1,
-1.554467, -1.343231, -2.713068, 1, 0.3294118, 0, 1,
-1.547569, 0.6604603, 0.1734639, 1, 0.3372549, 0, 1,
-1.535462, -0.05520625, -1.376694, 1, 0.3411765, 0, 1,
-1.534047, -0.3539538, -2.059422, 1, 0.3490196, 0, 1,
-1.521963, -0.02474282, -0.4266403, 1, 0.3529412, 0, 1,
-1.517531, -0.8770276, -1.441444, 1, 0.3607843, 0, 1,
-1.51584, 0.04591876, -1.090395, 1, 0.3647059, 0, 1,
-1.510819, -0.9602289, -2.474401, 1, 0.372549, 0, 1,
-1.502388, 0.220249, -1.703043, 1, 0.3764706, 0, 1,
-1.486308, -1.750993, -2.426329, 1, 0.3843137, 0, 1,
-1.47948, -0.670555, -3.551341, 1, 0.3882353, 0, 1,
-1.47295, -0.3354959, -3.410879, 1, 0.3960784, 0, 1,
-1.470727, -1.219549, -1.742734, 1, 0.4039216, 0, 1,
-1.460592, 0.08941256, -0.728193, 1, 0.4078431, 0, 1,
-1.457722, 0.2415544, 0.9711682, 1, 0.4156863, 0, 1,
-1.451459, 1.185506, 0.7446499, 1, 0.4196078, 0, 1,
-1.450754, 0.5859166, -2.497355, 1, 0.427451, 0, 1,
-1.446973, 2.99249, 0.08249085, 1, 0.4313726, 0, 1,
-1.445129, -1.554944, -5.551061, 1, 0.4392157, 0, 1,
-1.44145, 0.09020404, -3.903118, 1, 0.4431373, 0, 1,
-1.436107, 1.043422, -2.443938, 1, 0.4509804, 0, 1,
-1.423586, -1.725001, -2.138854, 1, 0.454902, 0, 1,
-1.423215, -1.021942, -0.48597, 1, 0.4627451, 0, 1,
-1.416359, 1.075641, -2.299283, 1, 0.4666667, 0, 1,
-1.397922, -0.3537072, -1.94173, 1, 0.4745098, 0, 1,
-1.396998, 0.03962931, -2.265269, 1, 0.4784314, 0, 1,
-1.394931, -1.410133, -2.642191, 1, 0.4862745, 0, 1,
-1.377825, 0.5035878, -1.590326, 1, 0.4901961, 0, 1,
-1.374223, -0.9266084, -3.39369, 1, 0.4980392, 0, 1,
-1.359062, 1.460853, -0.1590298, 1, 0.5058824, 0, 1,
-1.354131, -0.3468833, -1.343465, 1, 0.509804, 0, 1,
-1.348962, -0.08016343, -1.834629, 1, 0.5176471, 0, 1,
-1.346657, 0.002514581, -2.201377, 1, 0.5215687, 0, 1,
-1.344939, -1.973875, -3.507858, 1, 0.5294118, 0, 1,
-1.343512, 0.2253603, -2.889707, 1, 0.5333334, 0, 1,
-1.333535, -0.2992909, 0.5493369, 1, 0.5411765, 0, 1,
-1.331946, 1.080181, -1.426883, 1, 0.5450981, 0, 1,
-1.331823, 0.2837492, -0.09109264, 1, 0.5529412, 0, 1,
-1.326943, 0.8647732, -0.4692477, 1, 0.5568628, 0, 1,
-1.319272, 1.426216, -1.744811, 1, 0.5647059, 0, 1,
-1.306924, 0.5299302, -2.333219, 1, 0.5686275, 0, 1,
-1.305664, -1.570161, -2.679478, 1, 0.5764706, 0, 1,
-1.299159, 0.7845999, -1.399187, 1, 0.5803922, 0, 1,
-1.296988, 1.160121, -1.356709, 1, 0.5882353, 0, 1,
-1.294435, 0.9389592, -1.77507, 1, 0.5921569, 0, 1,
-1.294311, -1.394787, -1.942655, 1, 0.6, 0, 1,
-1.278711, -1.209296, -2.911981, 1, 0.6078432, 0, 1,
-1.278703, -1.567131, -2.672291, 1, 0.6117647, 0, 1,
-1.278327, -0.6194726, -0.3293141, 1, 0.6196079, 0, 1,
-1.275713, -0.9512353, -1.902602, 1, 0.6235294, 0, 1,
-1.266025, 0.1289065, -0.7984957, 1, 0.6313726, 0, 1,
-1.262303, -0.4909483, -0.3128819, 1, 0.6352941, 0, 1,
-1.259461, -0.345027, -1.40189, 1, 0.6431373, 0, 1,
-1.251279, -1.170232, -1.286586, 1, 0.6470588, 0, 1,
-1.249211, -1.732241, -3.027251, 1, 0.654902, 0, 1,
-1.24474, -0.2727347, -2.723056, 1, 0.6588235, 0, 1,
-1.231797, 0.4879013, -1.450551, 1, 0.6666667, 0, 1,
-1.228785, 0.845553, -1.34834, 1, 0.6705883, 0, 1,
-1.224334, -1.099127, -0.4428727, 1, 0.6784314, 0, 1,
-1.210954, 0.06523693, -0.8198156, 1, 0.682353, 0, 1,
-1.200309, 0.3935996, -0.03933451, 1, 0.6901961, 0, 1,
-1.200258, -0.2497196, -0.7673243, 1, 0.6941177, 0, 1,
-1.193517, 0.9801929, -0.3376322, 1, 0.7019608, 0, 1,
-1.18505, 0.451128, -0.3806646, 1, 0.7098039, 0, 1,
-1.181767, 1.48373, 0.1292393, 1, 0.7137255, 0, 1,
-1.180251, -1.137997, -1.479969, 1, 0.7215686, 0, 1,
-1.163438, 0.4085647, -1.856254, 1, 0.7254902, 0, 1,
-1.160812, 0.7140181, 0.1580572, 1, 0.7333333, 0, 1,
-1.160052, -0.4578785, -3.194977, 1, 0.7372549, 0, 1,
-1.156628, 2.800342, 0.1787868, 1, 0.7450981, 0, 1,
-1.150326, -0.01495527, -2.202761, 1, 0.7490196, 0, 1,
-1.146691, 1.035576, 0.8957933, 1, 0.7568628, 0, 1,
-1.145995, 1.475927, -0.02715436, 1, 0.7607843, 0, 1,
-1.132634, 0.5696378, -0.122075, 1, 0.7686275, 0, 1,
-1.130143, -1.360697, -4.051652, 1, 0.772549, 0, 1,
-1.129375, -0.4323831, -2.531008, 1, 0.7803922, 0, 1,
-1.121249, -0.5575023, -2.80935, 1, 0.7843137, 0, 1,
-1.120021, -0.8756453, -1.801511, 1, 0.7921569, 0, 1,
-1.117307, 1.768215, -1.841662, 1, 0.7960784, 0, 1,
-1.102304, 0.07590985, -2.902213, 1, 0.8039216, 0, 1,
-1.097504, -1.979636, -2.969109, 1, 0.8117647, 0, 1,
-1.093237, -0.207203, -1.220641, 1, 0.8156863, 0, 1,
-1.092495, 0.02616902, -1.228461, 1, 0.8235294, 0, 1,
-1.086441, 0.5632835, -2.706748, 1, 0.827451, 0, 1,
-1.085559, 0.8337871, -0.6760111, 1, 0.8352941, 0, 1,
-1.085149, -0.827827, -2.262651, 1, 0.8392157, 0, 1,
-1.08241, -1.433798, -2.412908, 1, 0.8470588, 0, 1,
-1.077628, 0.3997585, -0.2399403, 1, 0.8509804, 0, 1,
-1.077223, 0.8220801, -0.8617437, 1, 0.8588235, 0, 1,
-1.069558, -1.371853, -3.12693, 1, 0.8627451, 0, 1,
-1.060843, 1.66614, -1.666584, 1, 0.8705882, 0, 1,
-1.05963, -0.3209899, -1.311507, 1, 0.8745098, 0, 1,
-1.056625, -0.3587555, -2.620568, 1, 0.8823529, 0, 1,
-1.054704, -0.2395565, -1.724145, 1, 0.8862745, 0, 1,
-1.042887, 0.5830796, -2.024413, 1, 0.8941177, 0, 1,
-1.033693, -2.397665, -4.179627, 1, 0.8980392, 0, 1,
-1.019713, 0.2482568, -0.001899553, 1, 0.9058824, 0, 1,
-1.01539, -0.06407444, -2.833177, 1, 0.9137255, 0, 1,
-1.013322, 1.046028, -0.433764, 1, 0.9176471, 0, 1,
-1.010843, -1.179989, -2.283855, 1, 0.9254902, 0, 1,
-1.006768, 0.4889242, -1.828511, 1, 0.9294118, 0, 1,
-1.00358, -0.2792751, -3.093475, 1, 0.9372549, 0, 1,
-1.003188, -0.6028583, -2.371917, 1, 0.9411765, 0, 1,
-1.002673, 0.08959315, -1.152282, 1, 0.9490196, 0, 1,
-0.9985311, 1.373157, -1.360759, 1, 0.9529412, 0, 1,
-0.9964308, -0.1145219, -0.9260915, 1, 0.9607843, 0, 1,
-0.9938166, 0.6827402, -0.6790696, 1, 0.9647059, 0, 1,
-0.9897875, 0.1447963, -1.837463, 1, 0.972549, 0, 1,
-0.9865068, -1.216458, -2.959012, 1, 0.9764706, 0, 1,
-0.9859857, -0.7816958, -0.8999595, 1, 0.9843137, 0, 1,
-0.9841369, 1.363266, -0.7923995, 1, 0.9882353, 0, 1,
-0.9831733, 1.996057, 0.1947716, 1, 0.9960784, 0, 1,
-0.9807914, -1.099066, -2.362612, 0.9960784, 1, 0, 1,
-0.9581367, 0.8804961, 0.4692589, 0.9921569, 1, 0, 1,
-0.9478424, 0.8243671, -0.9965021, 0.9843137, 1, 0, 1,
-0.9444029, 0.8034344, 0.3806965, 0.9803922, 1, 0, 1,
-0.9287066, 0.3642384, -0.05056342, 0.972549, 1, 0, 1,
-0.9240083, 0.4238037, -0.3471395, 0.9686275, 1, 0, 1,
-0.9233554, -0.2323028, -1.055599, 0.9607843, 1, 0, 1,
-0.921864, -0.7933003, -1.897904, 0.9568627, 1, 0, 1,
-0.9181578, -1.15979, -2.442305, 0.9490196, 1, 0, 1,
-0.9177058, 2.645033, -0.3090073, 0.945098, 1, 0, 1,
-0.9118273, 0.6195655, -1.998342, 0.9372549, 1, 0, 1,
-0.9050994, 1.710218, -0.5956956, 0.9333333, 1, 0, 1,
-0.9048401, 0.9887189, -0.6142051, 0.9254902, 1, 0, 1,
-0.9042455, -1.251024, -3.137788, 0.9215686, 1, 0, 1,
-0.9015515, 0.6045883, -1.020821, 0.9137255, 1, 0, 1,
-0.8949546, 0.2256249, -0.3317831, 0.9098039, 1, 0, 1,
-0.8914339, 0.4606463, -1.772446, 0.9019608, 1, 0, 1,
-0.8884336, -1.311819, -2.848812, 0.8941177, 1, 0, 1,
-0.887156, -1.229544, -3.36125, 0.8901961, 1, 0, 1,
-0.8765011, 0.139388, -1.424388, 0.8823529, 1, 0, 1,
-0.8728611, 0.3905603, -2.314278, 0.8784314, 1, 0, 1,
-0.8674827, -0.6672442, -0.2174734, 0.8705882, 1, 0, 1,
-0.8623408, -0.04294639, -1.943973, 0.8666667, 1, 0, 1,
-0.859514, 1.334733, -0.01348753, 0.8588235, 1, 0, 1,
-0.8589208, -0.9927971, -2.707423, 0.854902, 1, 0, 1,
-0.8569711, 0.9276299, -0.6920905, 0.8470588, 1, 0, 1,
-0.8425428, 0.3770475, -0.9408706, 0.8431373, 1, 0, 1,
-0.8421668, -0.1121984, -1.86957, 0.8352941, 1, 0, 1,
-0.8396226, -0.1606531, -0.111042, 0.8313726, 1, 0, 1,
-0.8381774, 0.2082719, -3.138177, 0.8235294, 1, 0, 1,
-0.8378825, 0.5696606, -2.841707, 0.8196079, 1, 0, 1,
-0.8352165, -1.634804, -0.9749308, 0.8117647, 1, 0, 1,
-0.8351504, -1.414034, -2.160375, 0.8078431, 1, 0, 1,
-0.8348543, -0.2257098, -3.384073, 0.8, 1, 0, 1,
-0.8333704, 0.4647627, -1.143821, 0.7921569, 1, 0, 1,
-0.823925, -0.9799185, -3.047686, 0.7882353, 1, 0, 1,
-0.8234115, 1.028497, -0.9360487, 0.7803922, 1, 0, 1,
-0.8222761, 0.3271481, -2.862724, 0.7764706, 1, 0, 1,
-0.7991032, 0.8409219, -1.018043, 0.7686275, 1, 0, 1,
-0.798071, -0.4527375, -0.6771095, 0.7647059, 1, 0, 1,
-0.797175, -1.374096, -2.92165, 0.7568628, 1, 0, 1,
-0.7964306, -1.693141, -1.127109, 0.7529412, 1, 0, 1,
-0.7925366, -0.458683, 0.0868217, 0.7450981, 1, 0, 1,
-0.7905344, 0.06242003, -0.7999328, 0.7411765, 1, 0, 1,
-0.7845323, 0.8251655, -2.592707, 0.7333333, 1, 0, 1,
-0.7705151, 0.9251875, -1.324095, 0.7294118, 1, 0, 1,
-0.7683986, 0.8217898, -0.3015992, 0.7215686, 1, 0, 1,
-0.763835, 1.21828, -1.991057, 0.7176471, 1, 0, 1,
-0.7591849, 0.4677678, -1.290372, 0.7098039, 1, 0, 1,
-0.7523493, -0.4240828, -1.833869, 0.7058824, 1, 0, 1,
-0.7494898, 1.037251, -0.3703046, 0.6980392, 1, 0, 1,
-0.7466846, -0.8351128, -2.861958, 0.6901961, 1, 0, 1,
-0.7456608, 0.4661397, -0.8444692, 0.6862745, 1, 0, 1,
-0.7413765, -1.215239, -2.921836, 0.6784314, 1, 0, 1,
-0.7373737, -1.284019, -4.549693, 0.6745098, 1, 0, 1,
-0.7333619, 0.6327439, -1.95267, 0.6666667, 1, 0, 1,
-0.7331068, 0.8741124, -0.1289611, 0.6627451, 1, 0, 1,
-0.7279817, -1.648669, -2.412732, 0.654902, 1, 0, 1,
-0.7247221, 0.2436189, -0.1110016, 0.6509804, 1, 0, 1,
-0.7143178, 0.3454122, -1.021269, 0.6431373, 1, 0, 1,
-0.710124, -2.476537, -3.164499, 0.6392157, 1, 0, 1,
-0.7032725, -1.24188, -0.4613446, 0.6313726, 1, 0, 1,
-0.6923741, 1.498053, -0.2421339, 0.627451, 1, 0, 1,
-0.6923156, 0.6086707, 0.205117, 0.6196079, 1, 0, 1,
-0.6912928, -0.1014026, -1.928433, 0.6156863, 1, 0, 1,
-0.6873676, -0.5436803, -1.872845, 0.6078432, 1, 0, 1,
-0.6820167, 0.3572277, -2.793797, 0.6039216, 1, 0, 1,
-0.6777875, 0.1165712, -2.930386, 0.5960785, 1, 0, 1,
-0.6705894, -1.143869, -3.461582, 0.5882353, 1, 0, 1,
-0.666043, -1.630505, -2.773003, 0.5843138, 1, 0, 1,
-0.6609886, -0.4166143, -1.151203, 0.5764706, 1, 0, 1,
-0.6599615, 0.3059843, -1.71163, 0.572549, 1, 0, 1,
-0.6557596, 0.04882616, 0.6304774, 0.5647059, 1, 0, 1,
-0.6543886, -1.36016, -2.329264, 0.5607843, 1, 0, 1,
-0.6423107, 1.031717, 0.6267215, 0.5529412, 1, 0, 1,
-0.6419734, -0.2281022, -2.178898, 0.5490196, 1, 0, 1,
-0.6418525, -0.7888177, -3.321156, 0.5411765, 1, 0, 1,
-0.63811, 0.2975846, -0.2976648, 0.5372549, 1, 0, 1,
-0.6361632, 1.176221, -0.2542903, 0.5294118, 1, 0, 1,
-0.6307037, 1.095514, -1.767503, 0.5254902, 1, 0, 1,
-0.6263472, -0.1718633, -0.45446, 0.5176471, 1, 0, 1,
-0.6260583, -0.7189758, -1.312881, 0.5137255, 1, 0, 1,
-0.6253236, 1.197983, -0.4313864, 0.5058824, 1, 0, 1,
-0.6212443, 0.09368392, -0.1483577, 0.5019608, 1, 0, 1,
-0.6197223, 0.5695741, 0.6630579, 0.4941176, 1, 0, 1,
-0.6174291, -1.132295, -2.033243, 0.4862745, 1, 0, 1,
-0.6167156, 0.2310785, 0.537578, 0.4823529, 1, 0, 1,
-0.616456, -0.966161, -2.783498, 0.4745098, 1, 0, 1,
-0.6154181, -0.7121274, -0.9882752, 0.4705882, 1, 0, 1,
-0.6143998, 1.008855, -1.073631, 0.4627451, 1, 0, 1,
-0.6141021, -2.194976, -2.6043, 0.4588235, 1, 0, 1,
-0.6118786, 0.539539, -1.018883, 0.4509804, 1, 0, 1,
-0.6104493, -0.2268465, -1.514474, 0.4470588, 1, 0, 1,
-0.6075692, 0.5294069, -2.491146, 0.4392157, 1, 0, 1,
-0.5986521, 0.05949568, -2.132437, 0.4352941, 1, 0, 1,
-0.5977218, 0.8529376, 0.4581321, 0.427451, 1, 0, 1,
-0.5964459, -0.6600077, -0.7440024, 0.4235294, 1, 0, 1,
-0.5959838, 0.2565838, -0.8266234, 0.4156863, 1, 0, 1,
-0.5885261, -0.4038613, -2.27522, 0.4117647, 1, 0, 1,
-0.5824214, -1.175796, -1.53795, 0.4039216, 1, 0, 1,
-0.5817837, 0.7540988, -1.577829, 0.3960784, 1, 0, 1,
-0.5769389, -1.093061, -1.289583, 0.3921569, 1, 0, 1,
-0.5738209, -0.7220766, -2.692488, 0.3843137, 1, 0, 1,
-0.5712659, 1.701211, 0.5742481, 0.3803922, 1, 0, 1,
-0.570128, 2.826391, -1.103132, 0.372549, 1, 0, 1,
-0.5675487, -0.7138941, -2.625021, 0.3686275, 1, 0, 1,
-0.5627238, -1.005767, -2.831068, 0.3607843, 1, 0, 1,
-0.5591905, -0.7810099, -3.653446, 0.3568628, 1, 0, 1,
-0.5586042, -0.08045175, -1.375615, 0.3490196, 1, 0, 1,
-0.5555529, -1.043902, -3.764009, 0.345098, 1, 0, 1,
-0.5531042, -0.08900461, -2.092241, 0.3372549, 1, 0, 1,
-0.5519275, 0.05899384, -0.6817865, 0.3333333, 1, 0, 1,
-0.5462735, 0.3581892, -1.049932, 0.3254902, 1, 0, 1,
-0.5433841, 0.6262881, -0.1025843, 0.3215686, 1, 0, 1,
-0.5430438, -0.1627601, -2.70288, 0.3137255, 1, 0, 1,
-0.5403754, 0.4461198, -0.4583556, 0.3098039, 1, 0, 1,
-0.5401106, -0.02913018, -3.249139, 0.3019608, 1, 0, 1,
-0.53951, -1.513957, -2.004377, 0.2941177, 1, 0, 1,
-0.5392196, -0.05424159, -2.04576, 0.2901961, 1, 0, 1,
-0.538853, 1.083993, -2.655361, 0.282353, 1, 0, 1,
-0.5362809, 0.2884808, 0.811644, 0.2784314, 1, 0, 1,
-0.535506, -0.1509148, -0.06727035, 0.2705882, 1, 0, 1,
-0.5332418, 0.7839201, -0.7140853, 0.2666667, 1, 0, 1,
-0.5294427, 1.872299, -0.5399188, 0.2588235, 1, 0, 1,
-0.5215061, -1.031338, -1.653859, 0.254902, 1, 0, 1,
-0.5137853, -1.171036, -2.538666, 0.2470588, 1, 0, 1,
-0.5067419, -1.183318, -2.284371, 0.2431373, 1, 0, 1,
-0.5053849, -1.041672, -2.311202, 0.2352941, 1, 0, 1,
-0.5052419, -0.07878734, -0.2793163, 0.2313726, 1, 0, 1,
-0.4997499, -1.205624, -2.843047, 0.2235294, 1, 0, 1,
-0.4996553, 0.890578, 0.8933854, 0.2196078, 1, 0, 1,
-0.4981346, -0.9832637, -3.283385, 0.2117647, 1, 0, 1,
-0.4949633, 1.185954, -1.486262, 0.2078431, 1, 0, 1,
-0.490328, -0.2023488, -2.510026, 0.2, 1, 0, 1,
-0.4901033, -0.9858207, -3.603022, 0.1921569, 1, 0, 1,
-0.4856419, 1.680275, -0.2045211, 0.1882353, 1, 0, 1,
-0.4836376, 0.8180512, 0.4317933, 0.1803922, 1, 0, 1,
-0.4832345, -0.9370188, -2.139055, 0.1764706, 1, 0, 1,
-0.4810488, -0.02380176, -2.225603, 0.1686275, 1, 0, 1,
-0.4807257, -2.251607, -1.714876, 0.1647059, 1, 0, 1,
-0.4773968, 1.212727, 0.4727495, 0.1568628, 1, 0, 1,
-0.4758387, -0.4927792, -2.315025, 0.1529412, 1, 0, 1,
-0.4753483, -1.178247, -1.070711, 0.145098, 1, 0, 1,
-0.4748392, -1.615342, -4.466274, 0.1411765, 1, 0, 1,
-0.4741984, 0.3639916, -0.3045628, 0.1333333, 1, 0, 1,
-0.4738751, 1.261473, 1.261715, 0.1294118, 1, 0, 1,
-0.4727066, 0.6604638, -0.7050763, 0.1215686, 1, 0, 1,
-0.4713825, 1.385173, -0.6689401, 0.1176471, 1, 0, 1,
-0.4670863, 0.4265303, -0.5271421, 0.1098039, 1, 0, 1,
-0.4654357, 0.2711197, -1.465052, 0.1058824, 1, 0, 1,
-0.4578859, -0.4282261, -1.107835, 0.09803922, 1, 0, 1,
-0.4546188, 0.6806136, -0.9996564, 0.09019608, 1, 0, 1,
-0.4538259, 1.241351, 0.639365, 0.08627451, 1, 0, 1,
-0.4537136, 1.364164, 0.8052247, 0.07843138, 1, 0, 1,
-0.4494288, -0.2089865, -2.497752, 0.07450981, 1, 0, 1,
-0.4490978, 0.8995356, 0.5881758, 0.06666667, 1, 0, 1,
-0.4475731, -0.3009106, -3.283131, 0.0627451, 1, 0, 1,
-0.4473633, 0.4852018, -1.648297, 0.05490196, 1, 0, 1,
-0.4455931, -0.641809, -3.424685, 0.05098039, 1, 0, 1,
-0.4427844, 1.649966, -0.2452544, 0.04313726, 1, 0, 1,
-0.4401606, -1.156892, -3.798745, 0.03921569, 1, 0, 1,
-0.4390517, 0.1594973, -0.6854578, 0.03137255, 1, 0, 1,
-0.4370403, 0.8069988, -0.7384411, 0.02745098, 1, 0, 1,
-0.4338762, 0.4578999, -2.128813, 0.01960784, 1, 0, 1,
-0.4321989, -0.4788188, -2.375445, 0.01568628, 1, 0, 1,
-0.4289205, 0.02875469, -2.596018, 0.007843138, 1, 0, 1,
-0.4180976, -1.394472, -1.896458, 0.003921569, 1, 0, 1,
-0.415913, -0.4140208, -1.931158, 0, 1, 0.003921569, 1,
-0.4131728, -0.4156552, -4.57592, 0, 1, 0.01176471, 1,
-0.4125358, -1.068301, -2.265395, 0, 1, 0.01568628, 1,
-0.4101372, 0.9555339, 0.491671, 0, 1, 0.02352941, 1,
-0.4086966, -1.079752, -2.845331, 0, 1, 0.02745098, 1,
-0.4080141, -0.04249804, -0.3544515, 0, 1, 0.03529412, 1,
-0.4076279, -0.2659211, -1.563428, 0, 1, 0.03921569, 1,
-0.4046655, 0.2520117, 0.04556135, 0, 1, 0.04705882, 1,
-0.4033694, 0.3951193, -1.297865, 0, 1, 0.05098039, 1,
-0.402351, -0.5078611, -1.925109, 0, 1, 0.05882353, 1,
-0.4002476, -0.1431364, -0.5759802, 0, 1, 0.0627451, 1,
-0.3995887, -0.2032954, -2.462463, 0, 1, 0.07058824, 1,
-0.3987948, -1.503823, -2.679132, 0, 1, 0.07450981, 1,
-0.3973388, 0.7111621, -1.876721, 0, 1, 0.08235294, 1,
-0.3948482, 0.1033785, -2.770787, 0, 1, 0.08627451, 1,
-0.392856, 0.6702777, -0.3360355, 0, 1, 0.09411765, 1,
-0.3909466, -1.163756, -3.009239, 0, 1, 0.1019608, 1,
-0.3873269, 0.4276642, -0.1229074, 0, 1, 0.1058824, 1,
-0.3845216, -0.2953739, -3.771478, 0, 1, 0.1137255, 1,
-0.3834027, 1.210987, -1.096209, 0, 1, 0.1176471, 1,
-0.3827403, -1.949538, -1.289659, 0, 1, 0.1254902, 1,
-0.3799125, 1.018288, -0.5425164, 0, 1, 0.1294118, 1,
-0.3794861, 0.7486819, -1.21327, 0, 1, 0.1372549, 1,
-0.3782378, -1.560868, -2.599807, 0, 1, 0.1411765, 1,
-0.3780434, -0.6620347, -1.803007, 0, 1, 0.1490196, 1,
-0.3697152, -0.2008322, -1.914374, 0, 1, 0.1529412, 1,
-0.3686633, -0.9152299, -2.85531, 0, 1, 0.1607843, 1,
-0.3684137, -1.618516, -3.125402, 0, 1, 0.1647059, 1,
-0.3650179, 2.258944, 0.1646926, 0, 1, 0.172549, 1,
-0.364171, 0.1748086, -2.331103, 0, 1, 0.1764706, 1,
-0.3635503, -0.2424908, -2.574668, 0, 1, 0.1843137, 1,
-0.362821, 0.9092457, -0.4558448, 0, 1, 0.1882353, 1,
-0.3574015, 0.4798943, -0.1759758, 0, 1, 0.1960784, 1,
-0.3552577, -0.9789912, -3.012817, 0, 1, 0.2039216, 1,
-0.3549381, 1.669045, -2.418306, 0, 1, 0.2078431, 1,
-0.346112, 1.689117, -0.5824586, 0, 1, 0.2156863, 1,
-0.3440817, -0.993493, -1.484787, 0, 1, 0.2196078, 1,
-0.3438297, 0.2235134, -2.418107, 0, 1, 0.227451, 1,
-0.3406439, -0.3234734, -2.821839, 0, 1, 0.2313726, 1,
-0.3388382, 0.1569096, -2.894559, 0, 1, 0.2392157, 1,
-0.3383322, 1.275148, -0.373039, 0, 1, 0.2431373, 1,
-0.3366669, -1.23176, -3.226126, 0, 1, 0.2509804, 1,
-0.3359479, 0.8114837, 1.547448, 0, 1, 0.254902, 1,
-0.3323182, 0.2608269, -2.453775, 0, 1, 0.2627451, 1,
-0.3317589, -0.3827728, -3.323477, 0, 1, 0.2666667, 1,
-0.3292288, 1.371761, -1.378803, 0, 1, 0.2745098, 1,
-0.3250308, -0.20563, -2.277887, 0, 1, 0.2784314, 1,
-0.3210836, 1.726083, -0.4564014, 0, 1, 0.2862745, 1,
-0.3195119, 0.3972318, -0.5671809, 0, 1, 0.2901961, 1,
-0.3188247, -0.1842049, -0.671865, 0, 1, 0.2980392, 1,
-0.315312, -0.05328213, -1.235012, 0, 1, 0.3058824, 1,
-0.3091371, -0.2825342, -3.473878, 0, 1, 0.3098039, 1,
-0.3065148, 1.420518, -0.4361405, 0, 1, 0.3176471, 1,
-0.3056919, -1.052605, -3.518491, 0, 1, 0.3215686, 1,
-0.3044323, 1.225161, 0.7802159, 0, 1, 0.3294118, 1,
-0.3007294, 1.501336, -0.8343411, 0, 1, 0.3333333, 1,
-0.3001039, 0.07456152, -0.9069105, 0, 1, 0.3411765, 1,
-0.2992511, 2.492555, -0.570348, 0, 1, 0.345098, 1,
-0.2975895, -1.539568, -1.859348, 0, 1, 0.3529412, 1,
-0.2964318, 0.3943224, -1.170336, 0, 1, 0.3568628, 1,
-0.2938392, -0.3948807, -2.581664, 0, 1, 0.3647059, 1,
-0.2932295, 1.982913, -0.2800215, 0, 1, 0.3686275, 1,
-0.2913079, 0.6134037, 0.4701013, 0, 1, 0.3764706, 1,
-0.2907017, 0.4631318, 0.6313871, 0, 1, 0.3803922, 1,
-0.2865075, -0.7464504, -2.521925, 0, 1, 0.3882353, 1,
-0.2864917, -0.8604648, -2.611528, 0, 1, 0.3921569, 1,
-0.2776039, -0.7107608, -2.457518, 0, 1, 0.4, 1,
-0.2771063, 0.541937, -1.228373, 0, 1, 0.4078431, 1,
-0.2710458, 0.2128363, -2.320479, 0, 1, 0.4117647, 1,
-0.2645989, 0.9171095, -0.3609407, 0, 1, 0.4196078, 1,
-0.2643125, 0.05249059, -0.7713612, 0, 1, 0.4235294, 1,
-0.2634501, 0.1679076, -0.9080848, 0, 1, 0.4313726, 1,
-0.2554435, -1.045759, -2.842224, 0, 1, 0.4352941, 1,
-0.2550025, -1.334808, -2.289586, 0, 1, 0.4431373, 1,
-0.2520181, 1.125615, 0.06786877, 0, 1, 0.4470588, 1,
-0.248807, 0.7642941, 2.254321, 0, 1, 0.454902, 1,
-0.2459646, 0.2117236, -0.1188244, 0, 1, 0.4588235, 1,
-0.2397431, -1.631686, -2.188146, 0, 1, 0.4666667, 1,
-0.2356578, -2.7402, -3.956734, 0, 1, 0.4705882, 1,
-0.2329032, -0.7735603, -1.927965, 0, 1, 0.4784314, 1,
-0.2300752, -0.06917465, -1.979171, 0, 1, 0.4823529, 1,
-0.2293701, 0.5421592, -0.5866705, 0, 1, 0.4901961, 1,
-0.2259814, 0.5091711, 0.1714156, 0, 1, 0.4941176, 1,
-0.2178126, 0.8945951, -0.7352729, 0, 1, 0.5019608, 1,
-0.2168216, 0.8318663, 1.336845, 0, 1, 0.509804, 1,
-0.215775, -1.287372, -1.76601, 0, 1, 0.5137255, 1,
-0.2114667, 0.05132001, -1.91745, 0, 1, 0.5215687, 1,
-0.2067513, -1.571789, -2.719077, 0, 1, 0.5254902, 1,
-0.2060579, -0.4847835, -1.716603, 0, 1, 0.5333334, 1,
-0.2039903, -0.04189763, -1.629094, 0, 1, 0.5372549, 1,
-0.1987972, -1.089999, -1.368676, 0, 1, 0.5450981, 1,
-0.1978301, -2.355652, -1.69969, 0, 1, 0.5490196, 1,
-0.1964341, 1.982373, 0.1651435, 0, 1, 0.5568628, 1,
-0.194334, 1.412032, 1.503618, 0, 1, 0.5607843, 1,
-0.1933881, 0.1573574, -0.8767561, 0, 1, 0.5686275, 1,
-0.1923799, -0.2457674, -1.85751, 0, 1, 0.572549, 1,
-0.1910497, 0.2734715, 0.3308028, 0, 1, 0.5803922, 1,
-0.1866733, -0.4177964, -3.382179, 0, 1, 0.5843138, 1,
-0.1824068, 0.2684301, -0.0468546, 0, 1, 0.5921569, 1,
-0.181691, -0.9458166, -4.120663, 0, 1, 0.5960785, 1,
-0.1809036, 1.135683, -0.5613262, 0, 1, 0.6039216, 1,
-0.1800872, -0.44946, -0.9685736, 0, 1, 0.6117647, 1,
-0.1796226, 0.3335104, -0.7818019, 0, 1, 0.6156863, 1,
-0.1766461, -0.917299, -3.140355, 0, 1, 0.6235294, 1,
-0.1764572, 1.950525, 1.289194, 0, 1, 0.627451, 1,
-0.1718877, -0.03171617, -0.5819037, 0, 1, 0.6352941, 1,
-0.1664319, 1.798935, 0.4992161, 0, 1, 0.6392157, 1,
-0.1651969, 1.901917, -1.160349, 0, 1, 0.6470588, 1,
-0.1645765, 0.278565, 1.385627, 0, 1, 0.6509804, 1,
-0.1641305, 0.6198763, -0.1745233, 0, 1, 0.6588235, 1,
-0.1605892, 0.2348917, -0.5537907, 0, 1, 0.6627451, 1,
-0.1603752, -0.6208468, -2.298314, 0, 1, 0.6705883, 1,
-0.1530984, 0.6058239, -0.3143857, 0, 1, 0.6745098, 1,
-0.1528253, -0.551186, -3.23359, 0, 1, 0.682353, 1,
-0.1498203, 0.6321644, 0.1108334, 0, 1, 0.6862745, 1,
-0.139704, -0.746938, -1.248343, 0, 1, 0.6941177, 1,
-0.1369641, 0.8193567, -0.7896791, 0, 1, 0.7019608, 1,
-0.1345785, -1.855533, -2.449163, 0, 1, 0.7058824, 1,
-0.1320994, 0.4718322, 2.540307, 0, 1, 0.7137255, 1,
-0.1304369, -0.270523, -1.598904, 0, 1, 0.7176471, 1,
-0.1301886, -1.165505, -5.004565, 0, 1, 0.7254902, 1,
-0.1299855, 0.01520815, -2.390819, 0, 1, 0.7294118, 1,
-0.1295445, -1.17516, -3.332409, 0, 1, 0.7372549, 1,
-0.1290397, -0.2702981, -2.370085, 0, 1, 0.7411765, 1,
-0.1273118, 0.5615468, -1.016689, 0, 1, 0.7490196, 1,
-0.1210878, 0.6341262, 0.251735, 0, 1, 0.7529412, 1,
-0.1117007, 0.1415109, -1.18851, 0, 1, 0.7607843, 1,
-0.1101664, 0.5582703, 0.001834172, 0, 1, 0.7647059, 1,
-0.1070419, 0.4646545, -0.3302332, 0, 1, 0.772549, 1,
-0.1062431, 0.3229799, -2.06961, 0, 1, 0.7764706, 1,
-0.1038751, 0.5934941, -1.985003, 0, 1, 0.7843137, 1,
-0.09966633, 0.2423383, 0.8769572, 0, 1, 0.7882353, 1,
-0.0959096, -1.727306, -2.540277, 0, 1, 0.7960784, 1,
-0.09587809, 0.7571477, -0.2998981, 0, 1, 0.8039216, 1,
-0.09304315, 1.620466, -2.279066, 0, 1, 0.8078431, 1,
-0.09285781, -0.2084633, -5.190105, 0, 1, 0.8156863, 1,
-0.0905927, 0.6652465, -0.8996155, 0, 1, 0.8196079, 1,
-0.08297098, -1.092314, -3.452863, 0, 1, 0.827451, 1,
-0.08292312, 1.393628, -0.1992919, 0, 1, 0.8313726, 1,
-0.0826721, 1.070862, -0.696809, 0, 1, 0.8392157, 1,
-0.08116546, -0.5193815, -4.091877, 0, 1, 0.8431373, 1,
-0.0803493, 0.1656449, -1.376906, 0, 1, 0.8509804, 1,
-0.07566524, -1.467139, -3.471591, 0, 1, 0.854902, 1,
-0.0755493, 0.777531, 0.3963689, 0, 1, 0.8627451, 1,
-0.07139782, 0.02423677, -0.8984135, 0, 1, 0.8666667, 1,
-0.0707994, 0.07761347, -2.148561, 0, 1, 0.8745098, 1,
-0.0698582, -1.529335, -0.8387715, 0, 1, 0.8784314, 1,
-0.06892464, -0.0381833, -2.402499, 0, 1, 0.8862745, 1,
-0.06761011, 1.276189, 1.979555, 0, 1, 0.8901961, 1,
-0.06753773, 1.313427, 1.402458, 0, 1, 0.8980392, 1,
-0.05852894, -0.6347253, -3.01686, 0, 1, 0.9058824, 1,
-0.05631508, -0.6537402, -2.6018, 0, 1, 0.9098039, 1,
-0.05561316, 1.528536, 0.1567984, 0, 1, 0.9176471, 1,
-0.05499771, 2.16611, 0.001886027, 0, 1, 0.9215686, 1,
-0.05314088, -2.59865, -3.164171, 0, 1, 0.9294118, 1,
-0.05283315, -0.1502133, -2.137943, 0, 1, 0.9333333, 1,
-0.05260401, -1.221312, -2.432568, 0, 1, 0.9411765, 1,
-0.04921703, -0.7006335, -2.553168, 0, 1, 0.945098, 1,
-0.04895784, -0.2054032, -1.984807, 0, 1, 0.9529412, 1,
-0.04672809, -0.1842881, -2.837818, 0, 1, 0.9568627, 1,
-0.04370043, -0.6962534, -3.548704, 0, 1, 0.9647059, 1,
-0.0436956, -0.7429632, -2.836659, 0, 1, 0.9686275, 1,
-0.04242771, 1.190167, 1.27823, 0, 1, 0.9764706, 1,
-0.03819036, 1.0679, -1.257708, 0, 1, 0.9803922, 1,
-0.03788011, 0.3666742, -1.569112, 0, 1, 0.9882353, 1,
-0.03439418, -0.2156707, -0.582047, 0, 1, 0.9921569, 1,
-0.03126926, -0.8921238, -1.457446, 0, 1, 1, 1,
-0.0307544, 0.09451138, 1.542641, 0, 0.9921569, 1, 1,
-0.02983056, 1.373483, 0.8017876, 0, 0.9882353, 1, 1,
-0.02780808, -0.309947, -3.707568, 0, 0.9803922, 1, 1,
-0.02749855, 0.4090817, -0.07638919, 0, 0.9764706, 1, 1,
-0.02732004, -0.6305674, -4.288754, 0, 0.9686275, 1, 1,
-0.02655017, -0.1816628, -6.297867, 0, 0.9647059, 1, 1,
-0.02499011, -0.2706521, -2.914294, 0, 0.9568627, 1, 1,
-0.02271465, 2.546681, -0.6294965, 0, 0.9529412, 1, 1,
-0.01858632, 0.2111316, 1.588037, 0, 0.945098, 1, 1,
-0.01832812, 0.4674592, -0.2116216, 0, 0.9411765, 1, 1,
-0.0173561, 0.008562742, -2.740285, 0, 0.9333333, 1, 1,
-0.006827101, -2.829089, -3.721189, 0, 0.9294118, 1, 1,
-0.006624726, -1.689422, -2.826829, 0, 0.9215686, 1, 1,
-0.004861101, 1.36962, 0.2742929, 0, 0.9176471, 1, 1,
-0.001523652, 1.28209, -0.3697891, 0, 0.9098039, 1, 1,
-0.0002480541, 1.362657, -0.5494772, 0, 0.9058824, 1, 1,
0.01612307, 1.42329, 0.3207863, 0, 0.8980392, 1, 1,
0.0246928, -1.520765, 3.398911, 0, 0.8901961, 1, 1,
0.02904277, -0.3318705, 1.012542, 0, 0.8862745, 1, 1,
0.03040534, 0.02935875, 1.945685, 0, 0.8784314, 1, 1,
0.03473042, 1.07938, 0.07128651, 0, 0.8745098, 1, 1,
0.03903187, 1.781859, 1.123198, 0, 0.8666667, 1, 1,
0.04152634, -0.2001883, 2.671412, 0, 0.8627451, 1, 1,
0.04236206, -0.7556607, 3.229405, 0, 0.854902, 1, 1,
0.04583988, -1.415367, 3.296677, 0, 0.8509804, 1, 1,
0.04757116, 0.3920438, 1.728536, 0, 0.8431373, 1, 1,
0.05349497, -1.289066, 2.785041, 0, 0.8392157, 1, 1,
0.05352395, -0.4147876, 2.360076, 0, 0.8313726, 1, 1,
0.05363465, 1.840507, 0.4019771, 0, 0.827451, 1, 1,
0.05772211, -1.467852, 2.641636, 0, 0.8196079, 1, 1,
0.05777712, 1.097727, 1.593547, 0, 0.8156863, 1, 1,
0.06019345, 0.9214014, 1.12739, 0, 0.8078431, 1, 1,
0.0629043, 0.6365095, -0.7639964, 0, 0.8039216, 1, 1,
0.07219268, -0.2082207, 3.064456, 0, 0.7960784, 1, 1,
0.07289419, 1.070422, 0.7208019, 0, 0.7882353, 1, 1,
0.08615128, 0.6249811, -0.1031967, 0, 0.7843137, 1, 1,
0.08765129, -1.026819, 1.15551, 0, 0.7764706, 1, 1,
0.08923361, 1.91463, 1.11253, 0, 0.772549, 1, 1,
0.1264437, -0.576772, 2.495202, 0, 0.7647059, 1, 1,
0.1266711, 1.001423, 0.1673929, 0, 0.7607843, 1, 1,
0.1269359, 1.254745, 0.7727194, 0, 0.7529412, 1, 1,
0.1284028, -0.4277753, 3.571836, 0, 0.7490196, 1, 1,
0.1323724, -0.2240828, 2.563282, 0, 0.7411765, 1, 1,
0.1347544, -0.8967275, 3.653463, 0, 0.7372549, 1, 1,
0.1362617, 0.5064473, -0.9804141, 0, 0.7294118, 1, 1,
0.1377721, -0.8378225, 3.568105, 0, 0.7254902, 1, 1,
0.1384193, -1.504908, 4.11548, 0, 0.7176471, 1, 1,
0.1394319, -0.5610032, 2.06296, 0, 0.7137255, 1, 1,
0.1464303, -0.2315153, 3.266943, 0, 0.7058824, 1, 1,
0.1482749, 0.1473554, 0.6320344, 0, 0.6980392, 1, 1,
0.1548258, -0.7081447, 2.577084, 0, 0.6941177, 1, 1,
0.1564783, 1.528973, -1.59771, 0, 0.6862745, 1, 1,
0.1590027, 0.7241316, -0.02594066, 0, 0.682353, 1, 1,
0.16447, 0.3761392, 1.508287, 0, 0.6745098, 1, 1,
0.1657761, -2.267411, 3.4791, 0, 0.6705883, 1, 1,
0.168125, -0.2752158, 4.568999, 0, 0.6627451, 1, 1,
0.1712256, -0.8215661, 4.319153, 0, 0.6588235, 1, 1,
0.1766843, -1.200181, 1.075028, 0, 0.6509804, 1, 1,
0.1766898, -0.2536641, 3.791972, 0, 0.6470588, 1, 1,
0.1767857, 0.9176629, 0.9485509, 0, 0.6392157, 1, 1,
0.1788327, -0.5438799, 1.425593, 0, 0.6352941, 1, 1,
0.1802136, 1.072348, -0.3058898, 0, 0.627451, 1, 1,
0.1843156, 1.211998, 1.743963, 0, 0.6235294, 1, 1,
0.1846706, -0.2603906, 3.940197, 0, 0.6156863, 1, 1,
0.1853639, -1.629101, 2.899072, 0, 0.6117647, 1, 1,
0.1864212, -1.73501, 2.476619, 0, 0.6039216, 1, 1,
0.1895502, -0.7914079, 2.646136, 0, 0.5960785, 1, 1,
0.1918818, -1.43263, 2.744286, 0, 0.5921569, 1, 1,
0.1930344, 0.293112, 0.8073448, 0, 0.5843138, 1, 1,
0.1948055, -0.2360327, 2.104062, 0, 0.5803922, 1, 1,
0.1985411, -0.409913, 1.48688, 0, 0.572549, 1, 1,
0.1997621, -0.9103087, 4.232312, 0, 0.5686275, 1, 1,
0.2006027, -1.024865, 4.202177, 0, 0.5607843, 1, 1,
0.2015317, 0.4496049, 1.147024, 0, 0.5568628, 1, 1,
0.2050651, -1.949686, 1.323564, 0, 0.5490196, 1, 1,
0.2061201, 0.4607564, 0.05684653, 0, 0.5450981, 1, 1,
0.2064096, 1.540662, 1.593053, 0, 0.5372549, 1, 1,
0.2086555, -0.0668828, 2.013185, 0, 0.5333334, 1, 1,
0.2106228, -0.6641754, 4.411365, 0, 0.5254902, 1, 1,
0.2110299, -0.8063702, 1.96739, 0, 0.5215687, 1, 1,
0.2118256, -0.5567834, 1.43262, 0, 0.5137255, 1, 1,
0.2134036, -0.7167018, 3.649646, 0, 0.509804, 1, 1,
0.2168276, 1.770969, -0.02901239, 0, 0.5019608, 1, 1,
0.2192848, 0.6764381, -0.5482597, 0, 0.4941176, 1, 1,
0.2226625, 1.102236, -0.1458694, 0, 0.4901961, 1, 1,
0.2237368, 0.1954421, -0.1472539, 0, 0.4823529, 1, 1,
0.2242789, -0.2133376, 1.823462, 0, 0.4784314, 1, 1,
0.2251627, 0.8442324, -0.5404094, 0, 0.4705882, 1, 1,
0.2268806, -0.1765826, 3.243657, 0, 0.4666667, 1, 1,
0.2378154, -0.4046793, 0.4535391, 0, 0.4588235, 1, 1,
0.2379028, 1.377428, 2.6881, 0, 0.454902, 1, 1,
0.2405763, 0.3534571, -0.3802957, 0, 0.4470588, 1, 1,
0.2470994, 0.7756525, 0.2185977, 0, 0.4431373, 1, 1,
0.2472671, -1.286553, 2.990144, 0, 0.4352941, 1, 1,
0.2509225, 0.1150828, 1.608596, 0, 0.4313726, 1, 1,
0.2529409, 1.209903, -0.1425106, 0, 0.4235294, 1, 1,
0.2569119, 1.194166, 0.1961689, 0, 0.4196078, 1, 1,
0.2615822, -0.6152828, 2.875441, 0, 0.4117647, 1, 1,
0.2625212, -0.3332428, 2.929726, 0, 0.4078431, 1, 1,
0.2635793, 0.108205, 2.052126, 0, 0.4, 1, 1,
0.2710579, -0.3800492, 2.665301, 0, 0.3921569, 1, 1,
0.2762754, -0.7713856, 1.269087, 0, 0.3882353, 1, 1,
0.2780119, -2.264524, 5.585241, 0, 0.3803922, 1, 1,
0.280301, -1.587923, 1.133124, 0, 0.3764706, 1, 1,
0.2809502, 1.469939, -0.205437, 0, 0.3686275, 1, 1,
0.2819912, -0.2097999, 0.4371782, 0, 0.3647059, 1, 1,
0.2853859, 1.082221, 1.219865, 0, 0.3568628, 1, 1,
0.2855974, 0.8846439, 0.6021881, 0, 0.3529412, 1, 1,
0.2859433, -0.7506689, 1.690172, 0, 0.345098, 1, 1,
0.2871911, 0.5680085, -0.2528395, 0, 0.3411765, 1, 1,
0.2893493, 0.06339606, 2.294001, 0, 0.3333333, 1, 1,
0.2903282, 0.7007886, 0.4161755, 0, 0.3294118, 1, 1,
0.2906095, 0.03380705, 0.9979816, 0, 0.3215686, 1, 1,
0.2912157, -0.979991, 3.259568, 0, 0.3176471, 1, 1,
0.2928687, -0.2651097, 2.356947, 0, 0.3098039, 1, 1,
0.299727, -0.7274556, 2.346389, 0, 0.3058824, 1, 1,
0.3033185, 0.03761787, 0.9388414, 0, 0.2980392, 1, 1,
0.3067909, -0.3899308, 3.465177, 0, 0.2901961, 1, 1,
0.3235247, 0.8346013, 1.228918, 0, 0.2862745, 1, 1,
0.3264461, -0.1419597, 0.7652583, 0, 0.2784314, 1, 1,
0.3328871, 0.3755807, -0.1138559, 0, 0.2745098, 1, 1,
0.3366198, 0.5589671, -0.5616015, 0, 0.2666667, 1, 1,
0.3384695, -1.593857, 1.955544, 0, 0.2627451, 1, 1,
0.3436041, -0.1226645, 3.31414, 0, 0.254902, 1, 1,
0.3468908, 0.5682634, -2.050408, 0, 0.2509804, 1, 1,
0.3512384, -0.3805182, 4.182969, 0, 0.2431373, 1, 1,
0.3512393, 1.770603, 1.061343, 0, 0.2392157, 1, 1,
0.3513511, -0.3558428, 0.5398329, 0, 0.2313726, 1, 1,
0.3545243, 0.6843569, 0.4532578, 0, 0.227451, 1, 1,
0.3549984, 1.181747, -0.09283051, 0, 0.2196078, 1, 1,
0.3611383, -1.419203, 3.538863, 0, 0.2156863, 1, 1,
0.3619266, -2.703061, 3.090892, 0, 0.2078431, 1, 1,
0.3621119, 0.6663983, 0.7533564, 0, 0.2039216, 1, 1,
0.3687265, -0.6496215, 1.871262, 0, 0.1960784, 1, 1,
0.3732615, 1.749218, 1.549129, 0, 0.1882353, 1, 1,
0.3743351, 0.7036932, 0.9253011, 0, 0.1843137, 1, 1,
0.3759891, -0.018609, 1.543169, 0, 0.1764706, 1, 1,
0.3831904, -0.4994078, 3.384309, 0, 0.172549, 1, 1,
0.3845162, 0.3589857, -1.200424, 0, 0.1647059, 1, 1,
0.3856544, 1.639868, 0.720876, 0, 0.1607843, 1, 1,
0.3924953, -1.329516, 3.078169, 0, 0.1529412, 1, 1,
0.3930446, 1.026808, 0.5096127, 0, 0.1490196, 1, 1,
0.3937359, 0.8613613, -0.8455905, 0, 0.1411765, 1, 1,
0.3984149, -1.477932, 3.141874, 0, 0.1372549, 1, 1,
0.4009668, 0.6548796, -0.5182684, 0, 0.1294118, 1, 1,
0.4015178, -0.6674978, 2.479623, 0, 0.1254902, 1, 1,
0.4029145, -2.127898, 1.494876, 0, 0.1176471, 1, 1,
0.406276, 0.6311761, 0.9884892, 0, 0.1137255, 1, 1,
0.4070163, 0.7913069, 2.204187, 0, 0.1058824, 1, 1,
0.4108861, -0.1301055, 3.3026, 0, 0.09803922, 1, 1,
0.4159954, -0.185123, 0.7512835, 0, 0.09411765, 1, 1,
0.4188439, -0.08250803, 1.666061, 0, 0.08627451, 1, 1,
0.4222932, -0.5133244, 3.621206, 0, 0.08235294, 1, 1,
0.4229555, 0.3101072, -0.4596015, 0, 0.07450981, 1, 1,
0.4249151, 1.470303, 0.3177644, 0, 0.07058824, 1, 1,
0.4256691, 0.6190521, 1.397984, 0, 0.0627451, 1, 1,
0.4343618, 0.07489191, 0.1567902, 0, 0.05882353, 1, 1,
0.4364312, -0.5418003, 1.94832, 0, 0.05098039, 1, 1,
0.4376854, 1.742438, -0.1649984, 0, 0.04705882, 1, 1,
0.4408523, 0.3108683, -0.1124686, 0, 0.03921569, 1, 1,
0.4412753, -0.2120947, 2.247841, 0, 0.03529412, 1, 1,
0.4424928, -0.5655909, 1.443929, 0, 0.02745098, 1, 1,
0.4432426, 1.625274, -0.5229656, 0, 0.02352941, 1, 1,
0.4468355, -0.09058268, 1.075359, 0, 0.01568628, 1, 1,
0.4472263, -0.306335, 0.6508095, 0, 0.01176471, 1, 1,
0.4497997, 0.1405895, 1.989919, 0, 0.003921569, 1, 1,
0.4530608, 0.7707171, -1.735993, 0.003921569, 0, 1, 1,
0.4536509, 0.05048756, 1.356503, 0.007843138, 0, 1, 1,
0.4552056, -0.9090098, 3.799313, 0.01568628, 0, 1, 1,
0.4657696, 0.2330104, -0.1821133, 0.01960784, 0, 1, 1,
0.4674534, -0.2452244, 2.203856, 0.02745098, 0, 1, 1,
0.4676563, -1.216308, 2.328315, 0.03137255, 0, 1, 1,
0.4682739, 0.1542534, 0.783832, 0.03921569, 0, 1, 1,
0.4699693, -0.3461978, 3.113362, 0.04313726, 0, 1, 1,
0.4705291, 0.09258217, 2.456126, 0.05098039, 0, 1, 1,
0.4712997, 0.09797136, 0.6990688, 0.05490196, 0, 1, 1,
0.471999, 1.544551, 0.5906996, 0.0627451, 0, 1, 1,
0.4760505, 0.8021117, 0.3506738, 0.06666667, 0, 1, 1,
0.4761819, -0.1582342, 3.271741, 0.07450981, 0, 1, 1,
0.4766803, 1.085882, -0.7345642, 0.07843138, 0, 1, 1,
0.4786733, 0.1322009, 1.092708, 0.08627451, 0, 1, 1,
0.480988, 0.7743057, 2.95023, 0.09019608, 0, 1, 1,
0.4849149, 0.2969391, -0.5750571, 0.09803922, 0, 1, 1,
0.4920647, 1.491839, -0.6836132, 0.1058824, 0, 1, 1,
0.4928577, -0.3632374, 3.133654, 0.1098039, 0, 1, 1,
0.4930034, 1.122864, -0.4191321, 0.1176471, 0, 1, 1,
0.5001572, -1.075548, 5.008445, 0.1215686, 0, 1, 1,
0.5009689, -0.9562141, 3.085684, 0.1294118, 0, 1, 1,
0.5043392, 1.636247, 1.532337, 0.1333333, 0, 1, 1,
0.5095363, -2.082647, 2.962879, 0.1411765, 0, 1, 1,
0.5116962, 0.4031528, 2.266235, 0.145098, 0, 1, 1,
0.5165768, 2.047583, 0.1298779, 0.1529412, 0, 1, 1,
0.5237135, 0.3399477, 1.135685, 0.1568628, 0, 1, 1,
0.527155, -1.022979, 2.4457, 0.1647059, 0, 1, 1,
0.5312082, -0.6441627, 2.096612, 0.1686275, 0, 1, 1,
0.5319417, -1.098858, 3.14553, 0.1764706, 0, 1, 1,
0.5401798, 0.2360101, 0.7485044, 0.1803922, 0, 1, 1,
0.5405731, 0.2010625, 2.123326, 0.1882353, 0, 1, 1,
0.5469887, 0.9907572, 0.1479127, 0.1921569, 0, 1, 1,
0.5611048, 0.1178193, 1.692659, 0.2, 0, 1, 1,
0.5661586, -1.251373, 1.831513, 0.2078431, 0, 1, 1,
0.5684114, 1.974157, 1.658139, 0.2117647, 0, 1, 1,
0.5685481, -1.078486, 5.054613, 0.2196078, 0, 1, 1,
0.5756007, 0.8424426, 0.1131542, 0.2235294, 0, 1, 1,
0.5759851, -0.7639583, 4.862447, 0.2313726, 0, 1, 1,
0.5850785, -0.6581453, 4.02861, 0.2352941, 0, 1, 1,
0.592279, -0.7744194, 3.301227, 0.2431373, 0, 1, 1,
0.5925601, -0.1344352, 1.327219, 0.2470588, 0, 1, 1,
0.5952906, -0.5050166, 2.647338, 0.254902, 0, 1, 1,
0.5980433, -0.7441725, 3.355899, 0.2588235, 0, 1, 1,
0.6003616, 0.7880059, 1.657146, 0.2666667, 0, 1, 1,
0.6027064, 0.7019825, 1.85845, 0.2705882, 0, 1, 1,
0.603175, 0.1141697, 0.2617359, 0.2784314, 0, 1, 1,
0.6047414, -0.8096437, 0.3213098, 0.282353, 0, 1, 1,
0.6070688, -0.162028, 1.073597, 0.2901961, 0, 1, 1,
0.6088594, -1.877236, 2.062915, 0.2941177, 0, 1, 1,
0.6128482, 1.008582, -0.3747958, 0.3019608, 0, 1, 1,
0.620191, 0.6009126, 1.180672, 0.3098039, 0, 1, 1,
0.6214827, -0.2143108, 2.194723, 0.3137255, 0, 1, 1,
0.6235822, -1.97367, 3.510164, 0.3215686, 0, 1, 1,
0.6252081, -0.05587688, 2.506418, 0.3254902, 0, 1, 1,
0.6285566, -0.9287478, 4.240198, 0.3333333, 0, 1, 1,
0.6288518, -0.6698793, 2.410032, 0.3372549, 0, 1, 1,
0.6297209, -0.9569777, 2.529383, 0.345098, 0, 1, 1,
0.6307096, -2.215193, 2.507036, 0.3490196, 0, 1, 1,
0.6330507, -0.04494307, 1.865588, 0.3568628, 0, 1, 1,
0.6363297, -0.3669109, 3.184268, 0.3607843, 0, 1, 1,
0.6373799, -0.2219912, 0.9500828, 0.3686275, 0, 1, 1,
0.6415951, -0.6643612, 1.346582, 0.372549, 0, 1, 1,
0.6435581, -0.02796173, 1.452342, 0.3803922, 0, 1, 1,
0.6457127, 1.139147, 1.584628, 0.3843137, 0, 1, 1,
0.6459635, -0.9283774, 2.936583, 0.3921569, 0, 1, 1,
0.6491359, -1.601517, 1.734733, 0.3960784, 0, 1, 1,
0.6535366, -0.4881679, 1.083764, 0.4039216, 0, 1, 1,
0.6600364, -0.9413337, 2.166067, 0.4117647, 0, 1, 1,
0.6602818, 0.4847423, 0.8546912, 0.4156863, 0, 1, 1,
0.6629605, -0.02528594, 2.30263, 0.4235294, 0, 1, 1,
0.6639428, 0.9117706, 3.284096, 0.427451, 0, 1, 1,
0.6659104, 1.114909, 0.4608458, 0.4352941, 0, 1, 1,
0.6671532, 0.3232423, 2.789428, 0.4392157, 0, 1, 1,
0.6703928, -1.135879, 2.273321, 0.4470588, 0, 1, 1,
0.671087, -0.2354779, 2.359835, 0.4509804, 0, 1, 1,
0.6715453, -1.203549, 1.956494, 0.4588235, 0, 1, 1,
0.672796, -0.4021062, 1.862412, 0.4627451, 0, 1, 1,
0.6748495, -0.02125528, 1.932245, 0.4705882, 0, 1, 1,
0.6779922, -0.8776239, 2.605187, 0.4745098, 0, 1, 1,
0.6796595, 1.371574, 1.003368, 0.4823529, 0, 1, 1,
0.6811975, 1.443224, 1.157496, 0.4862745, 0, 1, 1,
0.6966186, -0.287832, 0.9836825, 0.4941176, 0, 1, 1,
0.6998047, -1.914624, 2.958188, 0.5019608, 0, 1, 1,
0.7026089, 0.4940773, 1.284049, 0.5058824, 0, 1, 1,
0.7031486, 0.1096098, 3.083836, 0.5137255, 0, 1, 1,
0.7032242, 0.2359949, 2.639734, 0.5176471, 0, 1, 1,
0.7065338, -2.145285, 2.12044, 0.5254902, 0, 1, 1,
0.7118863, -0.4817039, 2.051743, 0.5294118, 0, 1, 1,
0.7126708, -1.752991, 1.512846, 0.5372549, 0, 1, 1,
0.7172187, 1.522378, -0.8537652, 0.5411765, 0, 1, 1,
0.7210504, 0.2194356, 1.865288, 0.5490196, 0, 1, 1,
0.7274444, -0.8096081, 2.184152, 0.5529412, 0, 1, 1,
0.7286946, -0.454104, 0.7456864, 0.5607843, 0, 1, 1,
0.7351476, 1.205382, 1.652011, 0.5647059, 0, 1, 1,
0.736558, 0.0417783, 1.496714, 0.572549, 0, 1, 1,
0.7382988, 0.4544282, 0.2893111, 0.5764706, 0, 1, 1,
0.7399212, 2.143431, -0.9920894, 0.5843138, 0, 1, 1,
0.7425431, -1.081069, 2.531036, 0.5882353, 0, 1, 1,
0.7439599, 0.1399028, 1.531432, 0.5960785, 0, 1, 1,
0.7502481, -0.3231953, 1.777249, 0.6039216, 0, 1, 1,
0.7525096, 2.110756, 1.29741, 0.6078432, 0, 1, 1,
0.7543197, -0.4797424, 1.421323, 0.6156863, 0, 1, 1,
0.7557698, -0.1767828, 2.355929, 0.6196079, 0, 1, 1,
0.7622037, -1.085158, 3.362363, 0.627451, 0, 1, 1,
0.7639037, 1.856146, 0.5233371, 0.6313726, 0, 1, 1,
0.7646069, -1.035486, 1.814247, 0.6392157, 0, 1, 1,
0.7746336, -2.046503, 2.179658, 0.6431373, 0, 1, 1,
0.7780879, -0.0909453, 2.952635, 0.6509804, 0, 1, 1,
0.7819751, -0.2088726, 0.6111986, 0.654902, 0, 1, 1,
0.7826676, -1.281977, 1.845114, 0.6627451, 0, 1, 1,
0.7849088, -0.7875608, 2.377704, 0.6666667, 0, 1, 1,
0.7883114, 1.318107, 0.9442337, 0.6745098, 0, 1, 1,
0.7973351, -1.0667, 2.313919, 0.6784314, 0, 1, 1,
0.7977844, -0.7213835, 2.128499, 0.6862745, 0, 1, 1,
0.8025306, -0.5777227, 3.48178, 0.6901961, 0, 1, 1,
0.8062625, -1.628389, 4.172791, 0.6980392, 0, 1, 1,
0.8072809, 1.480381, 1.03805, 0.7058824, 0, 1, 1,
0.8080966, 0.3707807, 0.9757913, 0.7098039, 0, 1, 1,
0.8109564, 0.04267169, 2.352591, 0.7176471, 0, 1, 1,
0.8112141, -0.2275409, 0.2013435, 0.7215686, 0, 1, 1,
0.8173146, 1.252492, 0.4370928, 0.7294118, 0, 1, 1,
0.8178284, 0.9127619, 0.4784521, 0.7333333, 0, 1, 1,
0.8199512, 0.2664461, 0.9193717, 0.7411765, 0, 1, 1,
0.8260922, -0.034145, 1.157786, 0.7450981, 0, 1, 1,
0.8402772, 1.276274, 0.6109264, 0.7529412, 0, 1, 1,
0.8529757, -0.06891594, 3.239042, 0.7568628, 0, 1, 1,
0.8560523, -1.911411, 1.622886, 0.7647059, 0, 1, 1,
0.8592709, 0.2837973, 0.837453, 0.7686275, 0, 1, 1,
0.8619337, -0.8298997, 2.36449, 0.7764706, 0, 1, 1,
0.86458, 0.5160882, 1.322227, 0.7803922, 0, 1, 1,
0.8679055, 0.4744087, -0.5071563, 0.7882353, 0, 1, 1,
0.8695232, 0.6319759, 0.05108351, 0.7921569, 0, 1, 1,
0.8729402, -0.887805, 3.049766, 0.8, 0, 1, 1,
0.8787853, 0.1146907, 0.4807279, 0.8078431, 0, 1, 1,
0.8829192, -0.6273597, 3.99257, 0.8117647, 0, 1, 1,
0.8830862, 1.60111, 0.1639329, 0.8196079, 0, 1, 1,
0.8869671, 1.055582, 1.204297, 0.8235294, 0, 1, 1,
0.8871122, -0.01585901, 1.392584, 0.8313726, 0, 1, 1,
0.8885217, -0.5877867, 2.483915, 0.8352941, 0, 1, 1,
0.8912929, -1.044345, 2.149835, 0.8431373, 0, 1, 1,
0.8947622, -1.217212, 3.613466, 0.8470588, 0, 1, 1,
0.8976235, 1.985047, -1.086496, 0.854902, 0, 1, 1,
0.9014327, -0.9818703, 2.818289, 0.8588235, 0, 1, 1,
0.9037913, 0.7789755, 0.1558054, 0.8666667, 0, 1, 1,
0.9047211, 0.4462689, 1.184644, 0.8705882, 0, 1, 1,
0.9122794, -0.7167318, 2.228571, 0.8784314, 0, 1, 1,
0.9127614, -0.7460888, 0.9604853, 0.8823529, 0, 1, 1,
0.9148288, -1.257119, 3.753505, 0.8901961, 0, 1, 1,
0.9154962, 0.2683, 0.9616103, 0.8941177, 0, 1, 1,
0.9234064, -0.2169791, 1.560826, 0.9019608, 0, 1, 1,
0.9243138, 1.402572, 1.649521, 0.9098039, 0, 1, 1,
0.9320296, 1.213786, 1.810659, 0.9137255, 0, 1, 1,
0.9401679, -1.146974, 1.185118, 0.9215686, 0, 1, 1,
0.9405503, -0.8032383, 1.368715, 0.9254902, 0, 1, 1,
0.9446703, -1.436691, 2.115932, 0.9333333, 0, 1, 1,
0.9462003, 0.4145039, 0.6392829, 0.9372549, 0, 1, 1,
0.9511496, 0.3197448, 0.7368419, 0.945098, 0, 1, 1,
0.9594307, 0.5005463, 0.9414902, 0.9490196, 0, 1, 1,
0.9606891, 0.3983728, 0.4581633, 0.9568627, 0, 1, 1,
0.9638245, 0.4299591, 1.863113, 0.9607843, 0, 1, 1,
0.9688777, -0.5380185, 0.9180503, 0.9686275, 0, 1, 1,
0.9715056, 0.1671593, 0.5608975, 0.972549, 0, 1, 1,
0.9759364, 0.5725989, 0.04782199, 0.9803922, 0, 1, 1,
0.9780241, -0.6591089, 1.103989, 0.9843137, 0, 1, 1,
0.9794213, 1.3862, 1.02381, 0.9921569, 0, 1, 1,
0.9810626, -0.2649009, 0.3668659, 0.9960784, 0, 1, 1,
0.9867119, 0.04153116, 1.338325, 1, 0, 0.9960784, 1,
0.9885172, 0.210024, 0.2212439, 1, 0, 0.9882353, 1,
0.9903646, 0.1213738, 2.321831, 1, 0, 0.9843137, 1,
0.990698, -0.4618061, 0.9266177, 1, 0, 0.9764706, 1,
1.000702, 0.3724072, 1.256297, 1, 0, 0.972549, 1,
1.002068, -0.9934197, 1.880173, 1, 0, 0.9647059, 1,
1.002319, -0.2933528, 1.703236, 1, 0, 0.9607843, 1,
1.012048, -0.5897643, 0.9150236, 1, 0, 0.9529412, 1,
1.01239, -0.2872865, 3.513815, 1, 0, 0.9490196, 1,
1.019167, 1.263686, 0.1445794, 1, 0, 0.9411765, 1,
1.030192, 0.3660342, -0.7298461, 1, 0, 0.9372549, 1,
1.031303, -1.416624, 2.055851, 1, 0, 0.9294118, 1,
1.039997, -1.245095, 4.365233, 1, 0, 0.9254902, 1,
1.040449, -0.5936384, 3.141955, 1, 0, 0.9176471, 1,
1.041096, 1.689249, 0.3536896, 1, 0, 0.9137255, 1,
1.051191, 1.200257, 1.651448, 1, 0, 0.9058824, 1,
1.052891, -0.01595702, 0.5950842, 1, 0, 0.9019608, 1,
1.057827, -0.5476711, 2.071784, 1, 0, 0.8941177, 1,
1.058456, -0.07169674, 1.592511, 1, 0, 0.8862745, 1,
1.060306, -0.1796861, 2.009806, 1, 0, 0.8823529, 1,
1.067007, -1.44359, 1.931006, 1, 0, 0.8745098, 1,
1.070364, 0.3089547, -0.9053794, 1, 0, 0.8705882, 1,
1.086781, -0.6835419, 1.602956, 1, 0, 0.8627451, 1,
1.08787, 0.7290013, -0.3406186, 1, 0, 0.8588235, 1,
1.088629, 1.903322, 1.403197, 1, 0, 0.8509804, 1,
1.090364, -0.5227962, 1.34386, 1, 0, 0.8470588, 1,
1.102007, 0.6919746, 0.001784678, 1, 0, 0.8392157, 1,
1.108677, 1.762193, 0.05162048, 1, 0, 0.8352941, 1,
1.115247, 0.2245563, 1.315316, 1, 0, 0.827451, 1,
1.117432, 0.8730866, 1.057663, 1, 0, 0.8235294, 1,
1.118751, -0.2825546, 3.037856, 1, 0, 0.8156863, 1,
1.123928, 0.7088236, 1.125598, 1, 0, 0.8117647, 1,
1.126642, -1.305928, 2.356843, 1, 0, 0.8039216, 1,
1.133893, -0.190507, 1.369611, 1, 0, 0.7960784, 1,
1.134169, -0.1416373, 1.768709, 1, 0, 0.7921569, 1,
1.152854, -0.1121269, 2.313662, 1, 0, 0.7843137, 1,
1.156899, 0.5274913, -0.1766094, 1, 0, 0.7803922, 1,
1.157897, 1.593259, 2.063041, 1, 0, 0.772549, 1,
1.164919, -1.479746, 3.061095, 1, 0, 0.7686275, 1,
1.167072, -0.05222275, 1.651307, 1, 0, 0.7607843, 1,
1.175254, 0.4794058, 1.701705, 1, 0, 0.7568628, 1,
1.180709, -1.896803, 1.493679, 1, 0, 0.7490196, 1,
1.186934, -1.275621, 1.688991, 1, 0, 0.7450981, 1,
1.19453, -0.3026462, 1.693926, 1, 0, 0.7372549, 1,
1.19816, 0.6988844, -0.03772048, 1, 0, 0.7333333, 1,
1.203231, -1.866153, 2.109105, 1, 0, 0.7254902, 1,
1.216632, 1.258803, 1.715758, 1, 0, 0.7215686, 1,
1.21759, -0.2634614, 1.425375, 1, 0, 0.7137255, 1,
1.218377, 0.3516364, -0.3221085, 1, 0, 0.7098039, 1,
1.218967, -2.368181, 3.343876, 1, 0, 0.7019608, 1,
1.221359, 0.5764226, 0.8193926, 1, 0, 0.6941177, 1,
1.22282, 2.636606, -0.2425114, 1, 0, 0.6901961, 1,
1.231786, -0.4019473, 4.210437, 1, 0, 0.682353, 1,
1.245281, 0.1688637, 0.4948906, 1, 0, 0.6784314, 1,
1.250049, 0.18943, 1.647529, 1, 0, 0.6705883, 1,
1.254324, -0.660751, 1.582417, 1, 0, 0.6666667, 1,
1.256, -0.7062408, 0.2624676, 1, 0, 0.6588235, 1,
1.257816, -1.132486, 2.679919, 1, 0, 0.654902, 1,
1.265015, 1.475506, 1.608171, 1, 0, 0.6470588, 1,
1.271028, 0.5763313, 0.5314366, 1, 0, 0.6431373, 1,
1.273686, -0.6949443, 2.18028, 1, 0, 0.6352941, 1,
1.275993, 1.012758, 1.908618, 1, 0, 0.6313726, 1,
1.276885, -0.2761004, 0.7530785, 1, 0, 0.6235294, 1,
1.287152, 0.2395021, 1.297874, 1, 0, 0.6196079, 1,
1.292714, 2.751373, 0.5444562, 1, 0, 0.6117647, 1,
1.29533, 1.223074, -1.50363, 1, 0, 0.6078432, 1,
1.301474, -0.2554022, 2.68625, 1, 0, 0.6, 1,
1.308017, 0.00618252, 0.4695966, 1, 0, 0.5921569, 1,
1.323538, -1.665366, 1.303366, 1, 0, 0.5882353, 1,
1.333113, -1.684716, 1.563154, 1, 0, 0.5803922, 1,
1.339459, -0.1624587, 2.04869, 1, 0, 0.5764706, 1,
1.341746, 0.5781109, 2.444948, 1, 0, 0.5686275, 1,
1.346924, 0.8667997, 1.48427, 1, 0, 0.5647059, 1,
1.357106, 0.1261248, 0.9020295, 1, 0, 0.5568628, 1,
1.357728, -0.1452159, 2.950669, 1, 0, 0.5529412, 1,
1.362329, 0.6927335, 2.121835, 1, 0, 0.5450981, 1,
1.371654, 0.2132759, 0.653081, 1, 0, 0.5411765, 1,
1.373898, -0.7842714, 1.69406, 1, 0, 0.5333334, 1,
1.375903, -0.265662, 1.701144, 1, 0, 0.5294118, 1,
1.38326, 0.3578205, 2.548825, 1, 0, 0.5215687, 1,
1.40145, -0.2419013, 2.286246, 1, 0, 0.5176471, 1,
1.403898, 0.4106146, -1.493783, 1, 0, 0.509804, 1,
1.418916, -0.9333588, 1.990923, 1, 0, 0.5058824, 1,
1.422303, -0.4521378, 1.492135, 1, 0, 0.4980392, 1,
1.423987, -0.8325146, 1.144201, 1, 0, 0.4901961, 1,
1.426889, 0.3586071, 1.003436, 1, 0, 0.4862745, 1,
1.432575, 1.657304, 0.4810924, 1, 0, 0.4784314, 1,
1.435269, 1.521224, 1.271822, 1, 0, 0.4745098, 1,
1.437945, -1.055007, 2.446474, 1, 0, 0.4666667, 1,
1.441723, -0.146688, 1.750621, 1, 0, 0.4627451, 1,
1.442952, -1.488893, 2.870965, 1, 0, 0.454902, 1,
1.443416, -1.582505, 0.9520239, 1, 0, 0.4509804, 1,
1.451845, -0.1272056, 1.707304, 1, 0, 0.4431373, 1,
1.453507, -0.4421802, 1.631232, 1, 0, 0.4392157, 1,
1.45937, 0.7785816, 3.139281, 1, 0, 0.4313726, 1,
1.460349, 0.06568471, 1.078727, 1, 0, 0.427451, 1,
1.464484, 1.301983, 2.233404, 1, 0, 0.4196078, 1,
1.470452, -0.4652604, 1.128703, 1, 0, 0.4156863, 1,
1.493423, -0.2596264, 0.8893197, 1, 0, 0.4078431, 1,
1.51167, 0.8610246, 2.610859, 1, 0, 0.4039216, 1,
1.51192, 0.1711055, 2.679638, 1, 0, 0.3960784, 1,
1.517624, -1.766536, 1.506842, 1, 0, 0.3882353, 1,
1.519205, 0.3497829, -0.1765395, 1, 0, 0.3843137, 1,
1.525344, -2.077015, 2.750118, 1, 0, 0.3764706, 1,
1.563268, 1.062581, 1.430573, 1, 0, 0.372549, 1,
1.577671, -1.007353, 3.487581, 1, 0, 0.3647059, 1,
1.58815, -1.095713, 2.43644, 1, 0, 0.3607843, 1,
1.594919, -1.128728, -0.02886288, 1, 0, 0.3529412, 1,
1.601435, 0.7488641, 1.465867, 1, 0, 0.3490196, 1,
1.62124, 0.6905623, 0.762265, 1, 0, 0.3411765, 1,
1.63801, -1.973161, 2.158888, 1, 0, 0.3372549, 1,
1.665924, -0.9298336, 1.74459, 1, 0, 0.3294118, 1,
1.669945, 0.3320154, 1.378462, 1, 0, 0.3254902, 1,
1.678306, -1.487751, 3.253495, 1, 0, 0.3176471, 1,
1.685593, -1.108666, 3.456553, 1, 0, 0.3137255, 1,
1.688982, -0.1660114, 1.083038, 1, 0, 0.3058824, 1,
1.702736, 0.3192633, 2.731122, 1, 0, 0.2980392, 1,
1.70553, 0.04689844, 0.6035938, 1, 0, 0.2941177, 1,
1.712317, -0.7185524, 2.791599, 1, 0, 0.2862745, 1,
1.713906, -0.3369413, 0.5022351, 1, 0, 0.282353, 1,
1.720963, -1.399822, 3.450704, 1, 0, 0.2745098, 1,
1.726766, 0.3607936, 1.073549, 1, 0, 0.2705882, 1,
1.761158, -0.1524509, 1.834224, 1, 0, 0.2627451, 1,
1.763128, 1.322058, 1.436247, 1, 0, 0.2588235, 1,
1.766407, -1.141796, 1.780696, 1, 0, 0.2509804, 1,
1.779351, 1.680549, -0.07896142, 1, 0, 0.2470588, 1,
1.81897, 0.1578158, 3.919071, 1, 0, 0.2392157, 1,
1.822353, -0.34925, 3.191665, 1, 0, 0.2352941, 1,
1.829415, -0.205433, 3.126052, 1, 0, 0.227451, 1,
1.841752, -0.6869262, 0.7790664, 1, 0, 0.2235294, 1,
1.868268, 0.5133289, 3.107805, 1, 0, 0.2156863, 1,
1.879409, -1.507374, 2.95464, 1, 0, 0.2117647, 1,
1.893, 1.337833, 1.665118, 1, 0, 0.2039216, 1,
1.898865, -0.01722519, 0.3902258, 1, 0, 0.1960784, 1,
1.938937, -0.03179651, 1.061514, 1, 0, 0.1921569, 1,
1.967337, -1.915348, 2.734887, 1, 0, 0.1843137, 1,
1.973089, 0.02665723, 1.916399, 1, 0, 0.1803922, 1,
1.992123, 0.3405711, 1.757724, 1, 0, 0.172549, 1,
2.014762, -0.7110633, 2.728934, 1, 0, 0.1686275, 1,
2.041395, -0.6067835, 1.60355, 1, 0, 0.1607843, 1,
2.057785, 1.247214, -0.3267713, 1, 0, 0.1568628, 1,
2.111634, 0.1812974, 0.611915, 1, 0, 0.1490196, 1,
2.117226, -0.1992235, 2.339463, 1, 0, 0.145098, 1,
2.165353, 0.9218179, 1.438025, 1, 0, 0.1372549, 1,
2.206287, -1.852461, 2.894907, 1, 0, 0.1333333, 1,
2.216308, 0.2182029, 2.45408, 1, 0, 0.1254902, 1,
2.274975, 0.9999442, 1.622429, 1, 0, 0.1215686, 1,
2.29764, -2.2097, 1.475165, 1, 0, 0.1137255, 1,
2.32487, 0.8157742, 1.420493, 1, 0, 0.1098039, 1,
2.341292, -0.102078, 1.789178, 1, 0, 0.1019608, 1,
2.381181, 0.07308554, 1.731139, 1, 0, 0.09411765, 1,
2.415372, -0.5435748, 2.960342, 1, 0, 0.09019608, 1,
2.468231, -1.158679, 1.524935, 1, 0, 0.08235294, 1,
2.483831, -0.9141653, 1.339501, 1, 0, 0.07843138, 1,
2.525338, 0.5363765, 2.419273, 1, 0, 0.07058824, 1,
2.530929, 0.1604253, 2.281512, 1, 0, 0.06666667, 1,
2.581836, 0.186945, 4.600418, 1, 0, 0.05882353, 1,
2.584196, 1.087798, 2.022808, 1, 0, 0.05490196, 1,
2.624659, 0.1220207, 3.802495, 1, 0, 0.04705882, 1,
2.837742, -0.8993635, 1.555876, 1, 0, 0.04313726, 1,
3.006615, 0.06107786, 1.95966, 1, 0, 0.03529412, 1,
3.175942, -0.9677071, 0.9195919, 1, 0, 0.03137255, 1,
3.421242, -1.245204, 1.67221, 1, 0, 0.02352941, 1,
3.519815, 0.1054279, -1.381437, 1, 0, 0.01960784, 1,
4.065683, -1.141312, 1.603022, 1, 0, 0.01176471, 1,
4.082416, 0.2446143, 0.6707113, 1, 0, 0.007843138, 1
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
0.7326558, -3.815847, -8.312054, 0, -0.5, 0.5, 0.5,
0.7326558, -3.815847, -8.312054, 1, -0.5, 0.5, 0.5,
0.7326558, -3.815847, -8.312054, 1, 1.5, 0.5, 0.5,
0.7326558, -3.815847, -8.312054, 0, 1.5, 0.5, 0.5
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
-3.752673, 0.08170068, -8.312054, 0, -0.5, 0.5, 0.5,
-3.752673, 0.08170068, -8.312054, 1, -0.5, 0.5, 0.5,
-3.752673, 0.08170068, -8.312054, 1, 1.5, 0.5, 0.5,
-3.752673, 0.08170068, -8.312054, 0, 1.5, 0.5, 0.5
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
-3.752673, -3.815847, -0.356313, 0, -0.5, 0.5, 0.5,
-3.752673, -3.815847, -0.356313, 1, -0.5, 0.5, 0.5,
-3.752673, -3.815847, -0.356313, 1, 1.5, 0.5, 0.5,
-3.752673, -3.815847, -0.356313, 0, 1.5, 0.5, 0.5
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
-2, -2.916413, -6.476113,
4, -2.916413, -6.476113,
-2, -2.916413, -6.476113,
-2, -3.066318, -6.782104,
-1, -2.916413, -6.476113,
-1, -3.066318, -6.782104,
0, -2.916413, -6.476113,
0, -3.066318, -6.782104,
1, -2.916413, -6.476113,
1, -3.066318, -6.782104,
2, -2.916413, -6.476113,
2, -3.066318, -6.782104,
3, -2.916413, -6.476113,
3, -3.066318, -6.782104,
4, -2.916413, -6.476113,
4, -3.066318, -6.782104
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
"3",
"4"
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
-2, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
-2, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
-2, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
-2, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
-1, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
-1, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
-1, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
-1, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
0, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
0, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
0, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
0, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
1, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
1, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
1, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
1, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
2, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
2, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
2, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
2, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
3, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
3, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
3, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
3, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5,
4, -3.36613, -7.394083, 0, -0.5, 0.5, 0.5,
4, -3.36613, -7.394083, 1, -0.5, 0.5, 0.5,
4, -3.36613, -7.394083, 1, 1.5, 0.5, 0.5,
4, -3.36613, -7.394083, 0, 1.5, 0.5, 0.5
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
-2.717597, -2, -6.476113,
-2.717597, 2, -6.476113,
-2.717597, -2, -6.476113,
-2.89011, -2, -6.782104,
-2.717597, -1, -6.476113,
-2.89011, -1, -6.782104,
-2.717597, 0, -6.476113,
-2.89011, 0, -6.782104,
-2.717597, 1, -6.476113,
-2.89011, 1, -6.782104,
-2.717597, 2, -6.476113,
-2.89011, 2, -6.782104
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
-3.235135, -2, -7.394083, 0, -0.5, 0.5, 0.5,
-3.235135, -2, -7.394083, 1, -0.5, 0.5, 0.5,
-3.235135, -2, -7.394083, 1, 1.5, 0.5, 0.5,
-3.235135, -2, -7.394083, 0, 1.5, 0.5, 0.5,
-3.235135, -1, -7.394083, 0, -0.5, 0.5, 0.5,
-3.235135, -1, -7.394083, 1, -0.5, 0.5, 0.5,
-3.235135, -1, -7.394083, 1, 1.5, 0.5, 0.5,
-3.235135, -1, -7.394083, 0, 1.5, 0.5, 0.5,
-3.235135, 0, -7.394083, 0, -0.5, 0.5, 0.5,
-3.235135, 0, -7.394083, 1, -0.5, 0.5, 0.5,
-3.235135, 0, -7.394083, 1, 1.5, 0.5, 0.5,
-3.235135, 0, -7.394083, 0, 1.5, 0.5, 0.5,
-3.235135, 1, -7.394083, 0, -0.5, 0.5, 0.5,
-3.235135, 1, -7.394083, 1, -0.5, 0.5, 0.5,
-3.235135, 1, -7.394083, 1, 1.5, 0.5, 0.5,
-3.235135, 1, -7.394083, 0, 1.5, 0.5, 0.5,
-3.235135, 2, -7.394083, 0, -0.5, 0.5, 0.5,
-3.235135, 2, -7.394083, 1, -0.5, 0.5, 0.5,
-3.235135, 2, -7.394083, 1, 1.5, 0.5, 0.5,
-3.235135, 2, -7.394083, 0, 1.5, 0.5, 0.5
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
-2.717597, -2.916413, -6,
-2.717597, -2.916413, 4,
-2.717597, -2.916413, -6,
-2.89011, -3.066318, -6,
-2.717597, -2.916413, -4,
-2.89011, -3.066318, -4,
-2.717597, -2.916413, -2,
-2.89011, -3.066318, -2,
-2.717597, -2.916413, 0,
-2.89011, -3.066318, 0,
-2.717597, -2.916413, 2,
-2.89011, -3.066318, 2,
-2.717597, -2.916413, 4,
-2.89011, -3.066318, 4
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
-3.235135, -3.36613, -6, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -6, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -6, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, -6, 0, 1.5, 0.5, 0.5,
-3.235135, -3.36613, -4, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -4, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -4, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, -4, 0, 1.5, 0.5, 0.5,
-3.235135, -3.36613, -2, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -2, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, -2, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, -2, 0, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 0, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 0, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 0, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 0, 0, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 2, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 2, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 2, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 2, 0, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 4, 0, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 4, 1, -0.5, 0.5, 0.5,
-3.235135, -3.36613, 4, 1, 1.5, 0.5, 0.5,
-3.235135, -3.36613, 4, 0, 1.5, 0.5, 0.5
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
-2.717597, -2.916413, -6.476113,
-2.717597, 3.079814, -6.476113,
-2.717597, -2.916413, 5.763487,
-2.717597, 3.079814, 5.763487,
-2.717597, -2.916413, -6.476113,
-2.717597, -2.916413, 5.763487,
-2.717597, 3.079814, -6.476113,
-2.717597, 3.079814, 5.763487,
-2.717597, -2.916413, -6.476113,
4.182909, -2.916413, -6.476113,
-2.717597, -2.916413, 5.763487,
4.182909, -2.916413, 5.763487,
-2.717597, 3.079814, -6.476113,
4.182909, 3.079814, -6.476113,
-2.717597, 3.079814, 5.763487,
4.182909, 3.079814, 5.763487,
4.182909, -2.916413, -6.476113,
4.182909, 3.079814, -6.476113,
4.182909, -2.916413, 5.763487,
4.182909, 3.079814, 5.763487,
4.182909, -2.916413, -6.476113,
4.182909, -2.916413, 5.763487,
4.182909, 3.079814, -6.476113,
4.182909, 3.079814, 5.763487
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
var radius = 8.157496;
var distance = 36.29362;
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
mvMatrix.translate( -0.7326558, -0.08170068, 0.356313 );
mvMatrix.scale( 1.278174, 1.470932, 0.7206154 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.29362);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
felodipine<-read.table("felodipine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-felodipine$V2
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
```

```r
y<-felodipine$V3
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
```

```r
z<-felodipine$V4
```

```
## Error in eval(expr, envir, enclos): object 'felodipine' not found
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
-2.617105, -0.01807517, -2.781183, 0, 0, 1, 1, 1,
-2.430977, 1.243843, -0.8438655, 1, 0, 0, 1, 1,
-2.422359, 1.819744, -1.187141, 1, 0, 0, 1, 1,
-2.411075, -0.5920018, -2.337475, 1, 0, 0, 1, 1,
-2.394445, 0.3765098, -1.319134, 1, 0, 0, 1, 1,
-2.365899, 0.4804282, -2.707128, 1, 0, 0, 1, 1,
-2.349072, -0.1894333, -2.442024, 0, 0, 0, 1, 1,
-2.281362, 1.673479, -1.412711, 0, 0, 0, 1, 1,
-2.276166, 0.01863404, -1.93836, 0, 0, 0, 1, 1,
-2.268302, 1.220454, 0.5441378, 0, 0, 0, 1, 1,
-2.254556, 1.511743, -1.94942, 0, 0, 0, 1, 1,
-2.233309, -0.5899843, -2.289708, 0, 0, 0, 1, 1,
-2.220093, -0.4789215, -1.706146, 0, 0, 0, 1, 1,
-2.216369, -1.924604, -3.950515, 1, 1, 1, 1, 1,
-2.198092, -0.06346613, -1.068239, 1, 1, 1, 1, 1,
-2.169118, -1.681487, -3.075284, 1, 1, 1, 1, 1,
-2.148932, -2.056911, -3.283411, 1, 1, 1, 1, 1,
-2.144474, 0.5750829, -0.8294315, 1, 1, 1, 1, 1,
-2.118316, 0.09688878, -1.432177, 1, 1, 1, 1, 1,
-2.092939, -0.9988635, -1.436389, 1, 1, 1, 1, 1,
-2.092757, -0.2939186, -1.363849, 1, 1, 1, 1, 1,
-2.055745, -0.8015903, -1.297845, 1, 1, 1, 1, 1,
-2.042133, 1.182254, -1.390299, 1, 1, 1, 1, 1,
-1.995871, 0.4688062, -2.036075, 1, 1, 1, 1, 1,
-1.991596, 1.235317, 0.3623852, 1, 1, 1, 1, 1,
-1.945018, 2.099718, -1.717263, 1, 1, 1, 1, 1,
-1.917861, -0.7321599, -2.878989, 1, 1, 1, 1, 1,
-1.9098, -1.049739, -0.9700171, 1, 1, 1, 1, 1,
-1.909451, 0.01888193, -2.218, 0, 0, 1, 1, 1,
-1.891886, -0.3290145, -1.822936, 1, 0, 0, 1, 1,
-1.869353, -0.6277716, -2.771089, 1, 0, 0, 1, 1,
-1.864102, -0.531738, -1.984575, 1, 0, 0, 1, 1,
-1.830893, 1.595977, -2.898634, 1, 0, 0, 1, 1,
-1.80889, -1.051391, -1.420783, 1, 0, 0, 1, 1,
-1.808299, -1.199571, -2.879692, 0, 0, 0, 1, 1,
-1.803383, 0.6517956, -0.01977839, 0, 0, 0, 1, 1,
-1.769627, -0.8704131, -0.4109105, 0, 0, 0, 1, 1,
-1.761378, -0.5611897, -2.446444, 0, 0, 0, 1, 1,
-1.752844, -1.02292, -3.745426, 0, 0, 0, 1, 1,
-1.741203, -1.645969, -4.365853, 0, 0, 0, 1, 1,
-1.738045, 0.4517469, -4.806351, 0, 0, 0, 1, 1,
-1.704857, -0.420571, -2.470276, 1, 1, 1, 1, 1,
-1.694928, -0.7209463, -2.670898, 1, 1, 1, 1, 1,
-1.677635, 0.1484767, 0.7758815, 1, 1, 1, 1, 1,
-1.674527, -1.043834, -4.186454, 1, 1, 1, 1, 1,
-1.671955, -0.8511682, -1.840194, 1, 1, 1, 1, 1,
-1.669909, 0.5817141, -1.204751, 1, 1, 1, 1, 1,
-1.660997, -0.1552605, -1.005905, 1, 1, 1, 1, 1,
-1.609936, -0.1758967, 0.1535368, 1, 1, 1, 1, 1,
-1.594435, 0.1774649, -1.927271, 1, 1, 1, 1, 1,
-1.587425, -0.07491435, -0.8097103, 1, 1, 1, 1, 1,
-1.573037, -1.034372, -3.068575, 1, 1, 1, 1, 1,
-1.571805, 1.156984, -1.284866, 1, 1, 1, 1, 1,
-1.560281, 1.868572, -1.19319, 1, 1, 1, 1, 1,
-1.55463, 1.923796, -2.272541, 1, 1, 1, 1, 1,
-1.554467, -1.343231, -2.713068, 1, 1, 1, 1, 1,
-1.547569, 0.6604603, 0.1734639, 0, 0, 1, 1, 1,
-1.535462, -0.05520625, -1.376694, 1, 0, 0, 1, 1,
-1.534047, -0.3539538, -2.059422, 1, 0, 0, 1, 1,
-1.521963, -0.02474282, -0.4266403, 1, 0, 0, 1, 1,
-1.517531, -0.8770276, -1.441444, 1, 0, 0, 1, 1,
-1.51584, 0.04591876, -1.090395, 1, 0, 0, 1, 1,
-1.510819, -0.9602289, -2.474401, 0, 0, 0, 1, 1,
-1.502388, 0.220249, -1.703043, 0, 0, 0, 1, 1,
-1.486308, -1.750993, -2.426329, 0, 0, 0, 1, 1,
-1.47948, -0.670555, -3.551341, 0, 0, 0, 1, 1,
-1.47295, -0.3354959, -3.410879, 0, 0, 0, 1, 1,
-1.470727, -1.219549, -1.742734, 0, 0, 0, 1, 1,
-1.460592, 0.08941256, -0.728193, 0, 0, 0, 1, 1,
-1.457722, 0.2415544, 0.9711682, 1, 1, 1, 1, 1,
-1.451459, 1.185506, 0.7446499, 1, 1, 1, 1, 1,
-1.450754, 0.5859166, -2.497355, 1, 1, 1, 1, 1,
-1.446973, 2.99249, 0.08249085, 1, 1, 1, 1, 1,
-1.445129, -1.554944, -5.551061, 1, 1, 1, 1, 1,
-1.44145, 0.09020404, -3.903118, 1, 1, 1, 1, 1,
-1.436107, 1.043422, -2.443938, 1, 1, 1, 1, 1,
-1.423586, -1.725001, -2.138854, 1, 1, 1, 1, 1,
-1.423215, -1.021942, -0.48597, 1, 1, 1, 1, 1,
-1.416359, 1.075641, -2.299283, 1, 1, 1, 1, 1,
-1.397922, -0.3537072, -1.94173, 1, 1, 1, 1, 1,
-1.396998, 0.03962931, -2.265269, 1, 1, 1, 1, 1,
-1.394931, -1.410133, -2.642191, 1, 1, 1, 1, 1,
-1.377825, 0.5035878, -1.590326, 1, 1, 1, 1, 1,
-1.374223, -0.9266084, -3.39369, 1, 1, 1, 1, 1,
-1.359062, 1.460853, -0.1590298, 0, 0, 1, 1, 1,
-1.354131, -0.3468833, -1.343465, 1, 0, 0, 1, 1,
-1.348962, -0.08016343, -1.834629, 1, 0, 0, 1, 1,
-1.346657, 0.002514581, -2.201377, 1, 0, 0, 1, 1,
-1.344939, -1.973875, -3.507858, 1, 0, 0, 1, 1,
-1.343512, 0.2253603, -2.889707, 1, 0, 0, 1, 1,
-1.333535, -0.2992909, 0.5493369, 0, 0, 0, 1, 1,
-1.331946, 1.080181, -1.426883, 0, 0, 0, 1, 1,
-1.331823, 0.2837492, -0.09109264, 0, 0, 0, 1, 1,
-1.326943, 0.8647732, -0.4692477, 0, 0, 0, 1, 1,
-1.319272, 1.426216, -1.744811, 0, 0, 0, 1, 1,
-1.306924, 0.5299302, -2.333219, 0, 0, 0, 1, 1,
-1.305664, -1.570161, -2.679478, 0, 0, 0, 1, 1,
-1.299159, 0.7845999, -1.399187, 1, 1, 1, 1, 1,
-1.296988, 1.160121, -1.356709, 1, 1, 1, 1, 1,
-1.294435, 0.9389592, -1.77507, 1, 1, 1, 1, 1,
-1.294311, -1.394787, -1.942655, 1, 1, 1, 1, 1,
-1.278711, -1.209296, -2.911981, 1, 1, 1, 1, 1,
-1.278703, -1.567131, -2.672291, 1, 1, 1, 1, 1,
-1.278327, -0.6194726, -0.3293141, 1, 1, 1, 1, 1,
-1.275713, -0.9512353, -1.902602, 1, 1, 1, 1, 1,
-1.266025, 0.1289065, -0.7984957, 1, 1, 1, 1, 1,
-1.262303, -0.4909483, -0.3128819, 1, 1, 1, 1, 1,
-1.259461, -0.345027, -1.40189, 1, 1, 1, 1, 1,
-1.251279, -1.170232, -1.286586, 1, 1, 1, 1, 1,
-1.249211, -1.732241, -3.027251, 1, 1, 1, 1, 1,
-1.24474, -0.2727347, -2.723056, 1, 1, 1, 1, 1,
-1.231797, 0.4879013, -1.450551, 1, 1, 1, 1, 1,
-1.228785, 0.845553, -1.34834, 0, 0, 1, 1, 1,
-1.224334, -1.099127, -0.4428727, 1, 0, 0, 1, 1,
-1.210954, 0.06523693, -0.8198156, 1, 0, 0, 1, 1,
-1.200309, 0.3935996, -0.03933451, 1, 0, 0, 1, 1,
-1.200258, -0.2497196, -0.7673243, 1, 0, 0, 1, 1,
-1.193517, 0.9801929, -0.3376322, 1, 0, 0, 1, 1,
-1.18505, 0.451128, -0.3806646, 0, 0, 0, 1, 1,
-1.181767, 1.48373, 0.1292393, 0, 0, 0, 1, 1,
-1.180251, -1.137997, -1.479969, 0, 0, 0, 1, 1,
-1.163438, 0.4085647, -1.856254, 0, 0, 0, 1, 1,
-1.160812, 0.7140181, 0.1580572, 0, 0, 0, 1, 1,
-1.160052, -0.4578785, -3.194977, 0, 0, 0, 1, 1,
-1.156628, 2.800342, 0.1787868, 0, 0, 0, 1, 1,
-1.150326, -0.01495527, -2.202761, 1, 1, 1, 1, 1,
-1.146691, 1.035576, 0.8957933, 1, 1, 1, 1, 1,
-1.145995, 1.475927, -0.02715436, 1, 1, 1, 1, 1,
-1.132634, 0.5696378, -0.122075, 1, 1, 1, 1, 1,
-1.130143, -1.360697, -4.051652, 1, 1, 1, 1, 1,
-1.129375, -0.4323831, -2.531008, 1, 1, 1, 1, 1,
-1.121249, -0.5575023, -2.80935, 1, 1, 1, 1, 1,
-1.120021, -0.8756453, -1.801511, 1, 1, 1, 1, 1,
-1.117307, 1.768215, -1.841662, 1, 1, 1, 1, 1,
-1.102304, 0.07590985, -2.902213, 1, 1, 1, 1, 1,
-1.097504, -1.979636, -2.969109, 1, 1, 1, 1, 1,
-1.093237, -0.207203, -1.220641, 1, 1, 1, 1, 1,
-1.092495, 0.02616902, -1.228461, 1, 1, 1, 1, 1,
-1.086441, 0.5632835, -2.706748, 1, 1, 1, 1, 1,
-1.085559, 0.8337871, -0.6760111, 1, 1, 1, 1, 1,
-1.085149, -0.827827, -2.262651, 0, 0, 1, 1, 1,
-1.08241, -1.433798, -2.412908, 1, 0, 0, 1, 1,
-1.077628, 0.3997585, -0.2399403, 1, 0, 0, 1, 1,
-1.077223, 0.8220801, -0.8617437, 1, 0, 0, 1, 1,
-1.069558, -1.371853, -3.12693, 1, 0, 0, 1, 1,
-1.060843, 1.66614, -1.666584, 1, 0, 0, 1, 1,
-1.05963, -0.3209899, -1.311507, 0, 0, 0, 1, 1,
-1.056625, -0.3587555, -2.620568, 0, 0, 0, 1, 1,
-1.054704, -0.2395565, -1.724145, 0, 0, 0, 1, 1,
-1.042887, 0.5830796, -2.024413, 0, 0, 0, 1, 1,
-1.033693, -2.397665, -4.179627, 0, 0, 0, 1, 1,
-1.019713, 0.2482568, -0.001899553, 0, 0, 0, 1, 1,
-1.01539, -0.06407444, -2.833177, 0, 0, 0, 1, 1,
-1.013322, 1.046028, -0.433764, 1, 1, 1, 1, 1,
-1.010843, -1.179989, -2.283855, 1, 1, 1, 1, 1,
-1.006768, 0.4889242, -1.828511, 1, 1, 1, 1, 1,
-1.00358, -0.2792751, -3.093475, 1, 1, 1, 1, 1,
-1.003188, -0.6028583, -2.371917, 1, 1, 1, 1, 1,
-1.002673, 0.08959315, -1.152282, 1, 1, 1, 1, 1,
-0.9985311, 1.373157, -1.360759, 1, 1, 1, 1, 1,
-0.9964308, -0.1145219, -0.9260915, 1, 1, 1, 1, 1,
-0.9938166, 0.6827402, -0.6790696, 1, 1, 1, 1, 1,
-0.9897875, 0.1447963, -1.837463, 1, 1, 1, 1, 1,
-0.9865068, -1.216458, -2.959012, 1, 1, 1, 1, 1,
-0.9859857, -0.7816958, -0.8999595, 1, 1, 1, 1, 1,
-0.9841369, 1.363266, -0.7923995, 1, 1, 1, 1, 1,
-0.9831733, 1.996057, 0.1947716, 1, 1, 1, 1, 1,
-0.9807914, -1.099066, -2.362612, 1, 1, 1, 1, 1,
-0.9581367, 0.8804961, 0.4692589, 0, 0, 1, 1, 1,
-0.9478424, 0.8243671, -0.9965021, 1, 0, 0, 1, 1,
-0.9444029, 0.8034344, 0.3806965, 1, 0, 0, 1, 1,
-0.9287066, 0.3642384, -0.05056342, 1, 0, 0, 1, 1,
-0.9240083, 0.4238037, -0.3471395, 1, 0, 0, 1, 1,
-0.9233554, -0.2323028, -1.055599, 1, 0, 0, 1, 1,
-0.921864, -0.7933003, -1.897904, 0, 0, 0, 1, 1,
-0.9181578, -1.15979, -2.442305, 0, 0, 0, 1, 1,
-0.9177058, 2.645033, -0.3090073, 0, 0, 0, 1, 1,
-0.9118273, 0.6195655, -1.998342, 0, 0, 0, 1, 1,
-0.9050994, 1.710218, -0.5956956, 0, 0, 0, 1, 1,
-0.9048401, 0.9887189, -0.6142051, 0, 0, 0, 1, 1,
-0.9042455, -1.251024, -3.137788, 0, 0, 0, 1, 1,
-0.9015515, 0.6045883, -1.020821, 1, 1, 1, 1, 1,
-0.8949546, 0.2256249, -0.3317831, 1, 1, 1, 1, 1,
-0.8914339, 0.4606463, -1.772446, 1, 1, 1, 1, 1,
-0.8884336, -1.311819, -2.848812, 1, 1, 1, 1, 1,
-0.887156, -1.229544, -3.36125, 1, 1, 1, 1, 1,
-0.8765011, 0.139388, -1.424388, 1, 1, 1, 1, 1,
-0.8728611, 0.3905603, -2.314278, 1, 1, 1, 1, 1,
-0.8674827, -0.6672442, -0.2174734, 1, 1, 1, 1, 1,
-0.8623408, -0.04294639, -1.943973, 1, 1, 1, 1, 1,
-0.859514, 1.334733, -0.01348753, 1, 1, 1, 1, 1,
-0.8589208, -0.9927971, -2.707423, 1, 1, 1, 1, 1,
-0.8569711, 0.9276299, -0.6920905, 1, 1, 1, 1, 1,
-0.8425428, 0.3770475, -0.9408706, 1, 1, 1, 1, 1,
-0.8421668, -0.1121984, -1.86957, 1, 1, 1, 1, 1,
-0.8396226, -0.1606531, -0.111042, 1, 1, 1, 1, 1,
-0.8381774, 0.2082719, -3.138177, 0, 0, 1, 1, 1,
-0.8378825, 0.5696606, -2.841707, 1, 0, 0, 1, 1,
-0.8352165, -1.634804, -0.9749308, 1, 0, 0, 1, 1,
-0.8351504, -1.414034, -2.160375, 1, 0, 0, 1, 1,
-0.8348543, -0.2257098, -3.384073, 1, 0, 0, 1, 1,
-0.8333704, 0.4647627, -1.143821, 1, 0, 0, 1, 1,
-0.823925, -0.9799185, -3.047686, 0, 0, 0, 1, 1,
-0.8234115, 1.028497, -0.9360487, 0, 0, 0, 1, 1,
-0.8222761, 0.3271481, -2.862724, 0, 0, 0, 1, 1,
-0.7991032, 0.8409219, -1.018043, 0, 0, 0, 1, 1,
-0.798071, -0.4527375, -0.6771095, 0, 0, 0, 1, 1,
-0.797175, -1.374096, -2.92165, 0, 0, 0, 1, 1,
-0.7964306, -1.693141, -1.127109, 0, 0, 0, 1, 1,
-0.7925366, -0.458683, 0.0868217, 1, 1, 1, 1, 1,
-0.7905344, 0.06242003, -0.7999328, 1, 1, 1, 1, 1,
-0.7845323, 0.8251655, -2.592707, 1, 1, 1, 1, 1,
-0.7705151, 0.9251875, -1.324095, 1, 1, 1, 1, 1,
-0.7683986, 0.8217898, -0.3015992, 1, 1, 1, 1, 1,
-0.763835, 1.21828, -1.991057, 1, 1, 1, 1, 1,
-0.7591849, 0.4677678, -1.290372, 1, 1, 1, 1, 1,
-0.7523493, -0.4240828, -1.833869, 1, 1, 1, 1, 1,
-0.7494898, 1.037251, -0.3703046, 1, 1, 1, 1, 1,
-0.7466846, -0.8351128, -2.861958, 1, 1, 1, 1, 1,
-0.7456608, 0.4661397, -0.8444692, 1, 1, 1, 1, 1,
-0.7413765, -1.215239, -2.921836, 1, 1, 1, 1, 1,
-0.7373737, -1.284019, -4.549693, 1, 1, 1, 1, 1,
-0.7333619, 0.6327439, -1.95267, 1, 1, 1, 1, 1,
-0.7331068, 0.8741124, -0.1289611, 1, 1, 1, 1, 1,
-0.7279817, -1.648669, -2.412732, 0, 0, 1, 1, 1,
-0.7247221, 0.2436189, -0.1110016, 1, 0, 0, 1, 1,
-0.7143178, 0.3454122, -1.021269, 1, 0, 0, 1, 1,
-0.710124, -2.476537, -3.164499, 1, 0, 0, 1, 1,
-0.7032725, -1.24188, -0.4613446, 1, 0, 0, 1, 1,
-0.6923741, 1.498053, -0.2421339, 1, 0, 0, 1, 1,
-0.6923156, 0.6086707, 0.205117, 0, 0, 0, 1, 1,
-0.6912928, -0.1014026, -1.928433, 0, 0, 0, 1, 1,
-0.6873676, -0.5436803, -1.872845, 0, 0, 0, 1, 1,
-0.6820167, 0.3572277, -2.793797, 0, 0, 0, 1, 1,
-0.6777875, 0.1165712, -2.930386, 0, 0, 0, 1, 1,
-0.6705894, -1.143869, -3.461582, 0, 0, 0, 1, 1,
-0.666043, -1.630505, -2.773003, 0, 0, 0, 1, 1,
-0.6609886, -0.4166143, -1.151203, 1, 1, 1, 1, 1,
-0.6599615, 0.3059843, -1.71163, 1, 1, 1, 1, 1,
-0.6557596, 0.04882616, 0.6304774, 1, 1, 1, 1, 1,
-0.6543886, -1.36016, -2.329264, 1, 1, 1, 1, 1,
-0.6423107, 1.031717, 0.6267215, 1, 1, 1, 1, 1,
-0.6419734, -0.2281022, -2.178898, 1, 1, 1, 1, 1,
-0.6418525, -0.7888177, -3.321156, 1, 1, 1, 1, 1,
-0.63811, 0.2975846, -0.2976648, 1, 1, 1, 1, 1,
-0.6361632, 1.176221, -0.2542903, 1, 1, 1, 1, 1,
-0.6307037, 1.095514, -1.767503, 1, 1, 1, 1, 1,
-0.6263472, -0.1718633, -0.45446, 1, 1, 1, 1, 1,
-0.6260583, -0.7189758, -1.312881, 1, 1, 1, 1, 1,
-0.6253236, 1.197983, -0.4313864, 1, 1, 1, 1, 1,
-0.6212443, 0.09368392, -0.1483577, 1, 1, 1, 1, 1,
-0.6197223, 0.5695741, 0.6630579, 1, 1, 1, 1, 1,
-0.6174291, -1.132295, -2.033243, 0, 0, 1, 1, 1,
-0.6167156, 0.2310785, 0.537578, 1, 0, 0, 1, 1,
-0.616456, -0.966161, -2.783498, 1, 0, 0, 1, 1,
-0.6154181, -0.7121274, -0.9882752, 1, 0, 0, 1, 1,
-0.6143998, 1.008855, -1.073631, 1, 0, 0, 1, 1,
-0.6141021, -2.194976, -2.6043, 1, 0, 0, 1, 1,
-0.6118786, 0.539539, -1.018883, 0, 0, 0, 1, 1,
-0.6104493, -0.2268465, -1.514474, 0, 0, 0, 1, 1,
-0.6075692, 0.5294069, -2.491146, 0, 0, 0, 1, 1,
-0.5986521, 0.05949568, -2.132437, 0, 0, 0, 1, 1,
-0.5977218, 0.8529376, 0.4581321, 0, 0, 0, 1, 1,
-0.5964459, -0.6600077, -0.7440024, 0, 0, 0, 1, 1,
-0.5959838, 0.2565838, -0.8266234, 0, 0, 0, 1, 1,
-0.5885261, -0.4038613, -2.27522, 1, 1, 1, 1, 1,
-0.5824214, -1.175796, -1.53795, 1, 1, 1, 1, 1,
-0.5817837, 0.7540988, -1.577829, 1, 1, 1, 1, 1,
-0.5769389, -1.093061, -1.289583, 1, 1, 1, 1, 1,
-0.5738209, -0.7220766, -2.692488, 1, 1, 1, 1, 1,
-0.5712659, 1.701211, 0.5742481, 1, 1, 1, 1, 1,
-0.570128, 2.826391, -1.103132, 1, 1, 1, 1, 1,
-0.5675487, -0.7138941, -2.625021, 1, 1, 1, 1, 1,
-0.5627238, -1.005767, -2.831068, 1, 1, 1, 1, 1,
-0.5591905, -0.7810099, -3.653446, 1, 1, 1, 1, 1,
-0.5586042, -0.08045175, -1.375615, 1, 1, 1, 1, 1,
-0.5555529, -1.043902, -3.764009, 1, 1, 1, 1, 1,
-0.5531042, -0.08900461, -2.092241, 1, 1, 1, 1, 1,
-0.5519275, 0.05899384, -0.6817865, 1, 1, 1, 1, 1,
-0.5462735, 0.3581892, -1.049932, 1, 1, 1, 1, 1,
-0.5433841, 0.6262881, -0.1025843, 0, 0, 1, 1, 1,
-0.5430438, -0.1627601, -2.70288, 1, 0, 0, 1, 1,
-0.5403754, 0.4461198, -0.4583556, 1, 0, 0, 1, 1,
-0.5401106, -0.02913018, -3.249139, 1, 0, 0, 1, 1,
-0.53951, -1.513957, -2.004377, 1, 0, 0, 1, 1,
-0.5392196, -0.05424159, -2.04576, 1, 0, 0, 1, 1,
-0.538853, 1.083993, -2.655361, 0, 0, 0, 1, 1,
-0.5362809, 0.2884808, 0.811644, 0, 0, 0, 1, 1,
-0.535506, -0.1509148, -0.06727035, 0, 0, 0, 1, 1,
-0.5332418, 0.7839201, -0.7140853, 0, 0, 0, 1, 1,
-0.5294427, 1.872299, -0.5399188, 0, 0, 0, 1, 1,
-0.5215061, -1.031338, -1.653859, 0, 0, 0, 1, 1,
-0.5137853, -1.171036, -2.538666, 0, 0, 0, 1, 1,
-0.5067419, -1.183318, -2.284371, 1, 1, 1, 1, 1,
-0.5053849, -1.041672, -2.311202, 1, 1, 1, 1, 1,
-0.5052419, -0.07878734, -0.2793163, 1, 1, 1, 1, 1,
-0.4997499, -1.205624, -2.843047, 1, 1, 1, 1, 1,
-0.4996553, 0.890578, 0.8933854, 1, 1, 1, 1, 1,
-0.4981346, -0.9832637, -3.283385, 1, 1, 1, 1, 1,
-0.4949633, 1.185954, -1.486262, 1, 1, 1, 1, 1,
-0.490328, -0.2023488, -2.510026, 1, 1, 1, 1, 1,
-0.4901033, -0.9858207, -3.603022, 1, 1, 1, 1, 1,
-0.4856419, 1.680275, -0.2045211, 1, 1, 1, 1, 1,
-0.4836376, 0.8180512, 0.4317933, 1, 1, 1, 1, 1,
-0.4832345, -0.9370188, -2.139055, 1, 1, 1, 1, 1,
-0.4810488, -0.02380176, -2.225603, 1, 1, 1, 1, 1,
-0.4807257, -2.251607, -1.714876, 1, 1, 1, 1, 1,
-0.4773968, 1.212727, 0.4727495, 1, 1, 1, 1, 1,
-0.4758387, -0.4927792, -2.315025, 0, 0, 1, 1, 1,
-0.4753483, -1.178247, -1.070711, 1, 0, 0, 1, 1,
-0.4748392, -1.615342, -4.466274, 1, 0, 0, 1, 1,
-0.4741984, 0.3639916, -0.3045628, 1, 0, 0, 1, 1,
-0.4738751, 1.261473, 1.261715, 1, 0, 0, 1, 1,
-0.4727066, 0.6604638, -0.7050763, 1, 0, 0, 1, 1,
-0.4713825, 1.385173, -0.6689401, 0, 0, 0, 1, 1,
-0.4670863, 0.4265303, -0.5271421, 0, 0, 0, 1, 1,
-0.4654357, 0.2711197, -1.465052, 0, 0, 0, 1, 1,
-0.4578859, -0.4282261, -1.107835, 0, 0, 0, 1, 1,
-0.4546188, 0.6806136, -0.9996564, 0, 0, 0, 1, 1,
-0.4538259, 1.241351, 0.639365, 0, 0, 0, 1, 1,
-0.4537136, 1.364164, 0.8052247, 0, 0, 0, 1, 1,
-0.4494288, -0.2089865, -2.497752, 1, 1, 1, 1, 1,
-0.4490978, 0.8995356, 0.5881758, 1, 1, 1, 1, 1,
-0.4475731, -0.3009106, -3.283131, 1, 1, 1, 1, 1,
-0.4473633, 0.4852018, -1.648297, 1, 1, 1, 1, 1,
-0.4455931, -0.641809, -3.424685, 1, 1, 1, 1, 1,
-0.4427844, 1.649966, -0.2452544, 1, 1, 1, 1, 1,
-0.4401606, -1.156892, -3.798745, 1, 1, 1, 1, 1,
-0.4390517, 0.1594973, -0.6854578, 1, 1, 1, 1, 1,
-0.4370403, 0.8069988, -0.7384411, 1, 1, 1, 1, 1,
-0.4338762, 0.4578999, -2.128813, 1, 1, 1, 1, 1,
-0.4321989, -0.4788188, -2.375445, 1, 1, 1, 1, 1,
-0.4289205, 0.02875469, -2.596018, 1, 1, 1, 1, 1,
-0.4180976, -1.394472, -1.896458, 1, 1, 1, 1, 1,
-0.415913, -0.4140208, -1.931158, 1, 1, 1, 1, 1,
-0.4131728, -0.4156552, -4.57592, 1, 1, 1, 1, 1,
-0.4125358, -1.068301, -2.265395, 0, 0, 1, 1, 1,
-0.4101372, 0.9555339, 0.491671, 1, 0, 0, 1, 1,
-0.4086966, -1.079752, -2.845331, 1, 0, 0, 1, 1,
-0.4080141, -0.04249804, -0.3544515, 1, 0, 0, 1, 1,
-0.4076279, -0.2659211, -1.563428, 1, 0, 0, 1, 1,
-0.4046655, 0.2520117, 0.04556135, 1, 0, 0, 1, 1,
-0.4033694, 0.3951193, -1.297865, 0, 0, 0, 1, 1,
-0.402351, -0.5078611, -1.925109, 0, 0, 0, 1, 1,
-0.4002476, -0.1431364, -0.5759802, 0, 0, 0, 1, 1,
-0.3995887, -0.2032954, -2.462463, 0, 0, 0, 1, 1,
-0.3987948, -1.503823, -2.679132, 0, 0, 0, 1, 1,
-0.3973388, 0.7111621, -1.876721, 0, 0, 0, 1, 1,
-0.3948482, 0.1033785, -2.770787, 0, 0, 0, 1, 1,
-0.392856, 0.6702777, -0.3360355, 1, 1, 1, 1, 1,
-0.3909466, -1.163756, -3.009239, 1, 1, 1, 1, 1,
-0.3873269, 0.4276642, -0.1229074, 1, 1, 1, 1, 1,
-0.3845216, -0.2953739, -3.771478, 1, 1, 1, 1, 1,
-0.3834027, 1.210987, -1.096209, 1, 1, 1, 1, 1,
-0.3827403, -1.949538, -1.289659, 1, 1, 1, 1, 1,
-0.3799125, 1.018288, -0.5425164, 1, 1, 1, 1, 1,
-0.3794861, 0.7486819, -1.21327, 1, 1, 1, 1, 1,
-0.3782378, -1.560868, -2.599807, 1, 1, 1, 1, 1,
-0.3780434, -0.6620347, -1.803007, 1, 1, 1, 1, 1,
-0.3697152, -0.2008322, -1.914374, 1, 1, 1, 1, 1,
-0.3686633, -0.9152299, -2.85531, 1, 1, 1, 1, 1,
-0.3684137, -1.618516, -3.125402, 1, 1, 1, 1, 1,
-0.3650179, 2.258944, 0.1646926, 1, 1, 1, 1, 1,
-0.364171, 0.1748086, -2.331103, 1, 1, 1, 1, 1,
-0.3635503, -0.2424908, -2.574668, 0, 0, 1, 1, 1,
-0.362821, 0.9092457, -0.4558448, 1, 0, 0, 1, 1,
-0.3574015, 0.4798943, -0.1759758, 1, 0, 0, 1, 1,
-0.3552577, -0.9789912, -3.012817, 1, 0, 0, 1, 1,
-0.3549381, 1.669045, -2.418306, 1, 0, 0, 1, 1,
-0.346112, 1.689117, -0.5824586, 1, 0, 0, 1, 1,
-0.3440817, -0.993493, -1.484787, 0, 0, 0, 1, 1,
-0.3438297, 0.2235134, -2.418107, 0, 0, 0, 1, 1,
-0.3406439, -0.3234734, -2.821839, 0, 0, 0, 1, 1,
-0.3388382, 0.1569096, -2.894559, 0, 0, 0, 1, 1,
-0.3383322, 1.275148, -0.373039, 0, 0, 0, 1, 1,
-0.3366669, -1.23176, -3.226126, 0, 0, 0, 1, 1,
-0.3359479, 0.8114837, 1.547448, 0, 0, 0, 1, 1,
-0.3323182, 0.2608269, -2.453775, 1, 1, 1, 1, 1,
-0.3317589, -0.3827728, -3.323477, 1, 1, 1, 1, 1,
-0.3292288, 1.371761, -1.378803, 1, 1, 1, 1, 1,
-0.3250308, -0.20563, -2.277887, 1, 1, 1, 1, 1,
-0.3210836, 1.726083, -0.4564014, 1, 1, 1, 1, 1,
-0.3195119, 0.3972318, -0.5671809, 1, 1, 1, 1, 1,
-0.3188247, -0.1842049, -0.671865, 1, 1, 1, 1, 1,
-0.315312, -0.05328213, -1.235012, 1, 1, 1, 1, 1,
-0.3091371, -0.2825342, -3.473878, 1, 1, 1, 1, 1,
-0.3065148, 1.420518, -0.4361405, 1, 1, 1, 1, 1,
-0.3056919, -1.052605, -3.518491, 1, 1, 1, 1, 1,
-0.3044323, 1.225161, 0.7802159, 1, 1, 1, 1, 1,
-0.3007294, 1.501336, -0.8343411, 1, 1, 1, 1, 1,
-0.3001039, 0.07456152, -0.9069105, 1, 1, 1, 1, 1,
-0.2992511, 2.492555, -0.570348, 1, 1, 1, 1, 1,
-0.2975895, -1.539568, -1.859348, 0, 0, 1, 1, 1,
-0.2964318, 0.3943224, -1.170336, 1, 0, 0, 1, 1,
-0.2938392, -0.3948807, -2.581664, 1, 0, 0, 1, 1,
-0.2932295, 1.982913, -0.2800215, 1, 0, 0, 1, 1,
-0.2913079, 0.6134037, 0.4701013, 1, 0, 0, 1, 1,
-0.2907017, 0.4631318, 0.6313871, 1, 0, 0, 1, 1,
-0.2865075, -0.7464504, -2.521925, 0, 0, 0, 1, 1,
-0.2864917, -0.8604648, -2.611528, 0, 0, 0, 1, 1,
-0.2776039, -0.7107608, -2.457518, 0, 0, 0, 1, 1,
-0.2771063, 0.541937, -1.228373, 0, 0, 0, 1, 1,
-0.2710458, 0.2128363, -2.320479, 0, 0, 0, 1, 1,
-0.2645989, 0.9171095, -0.3609407, 0, 0, 0, 1, 1,
-0.2643125, 0.05249059, -0.7713612, 0, 0, 0, 1, 1,
-0.2634501, 0.1679076, -0.9080848, 1, 1, 1, 1, 1,
-0.2554435, -1.045759, -2.842224, 1, 1, 1, 1, 1,
-0.2550025, -1.334808, -2.289586, 1, 1, 1, 1, 1,
-0.2520181, 1.125615, 0.06786877, 1, 1, 1, 1, 1,
-0.248807, 0.7642941, 2.254321, 1, 1, 1, 1, 1,
-0.2459646, 0.2117236, -0.1188244, 1, 1, 1, 1, 1,
-0.2397431, -1.631686, -2.188146, 1, 1, 1, 1, 1,
-0.2356578, -2.7402, -3.956734, 1, 1, 1, 1, 1,
-0.2329032, -0.7735603, -1.927965, 1, 1, 1, 1, 1,
-0.2300752, -0.06917465, -1.979171, 1, 1, 1, 1, 1,
-0.2293701, 0.5421592, -0.5866705, 1, 1, 1, 1, 1,
-0.2259814, 0.5091711, 0.1714156, 1, 1, 1, 1, 1,
-0.2178126, 0.8945951, -0.7352729, 1, 1, 1, 1, 1,
-0.2168216, 0.8318663, 1.336845, 1, 1, 1, 1, 1,
-0.215775, -1.287372, -1.76601, 1, 1, 1, 1, 1,
-0.2114667, 0.05132001, -1.91745, 0, 0, 1, 1, 1,
-0.2067513, -1.571789, -2.719077, 1, 0, 0, 1, 1,
-0.2060579, -0.4847835, -1.716603, 1, 0, 0, 1, 1,
-0.2039903, -0.04189763, -1.629094, 1, 0, 0, 1, 1,
-0.1987972, -1.089999, -1.368676, 1, 0, 0, 1, 1,
-0.1978301, -2.355652, -1.69969, 1, 0, 0, 1, 1,
-0.1964341, 1.982373, 0.1651435, 0, 0, 0, 1, 1,
-0.194334, 1.412032, 1.503618, 0, 0, 0, 1, 1,
-0.1933881, 0.1573574, -0.8767561, 0, 0, 0, 1, 1,
-0.1923799, -0.2457674, -1.85751, 0, 0, 0, 1, 1,
-0.1910497, 0.2734715, 0.3308028, 0, 0, 0, 1, 1,
-0.1866733, -0.4177964, -3.382179, 0, 0, 0, 1, 1,
-0.1824068, 0.2684301, -0.0468546, 0, 0, 0, 1, 1,
-0.181691, -0.9458166, -4.120663, 1, 1, 1, 1, 1,
-0.1809036, 1.135683, -0.5613262, 1, 1, 1, 1, 1,
-0.1800872, -0.44946, -0.9685736, 1, 1, 1, 1, 1,
-0.1796226, 0.3335104, -0.7818019, 1, 1, 1, 1, 1,
-0.1766461, -0.917299, -3.140355, 1, 1, 1, 1, 1,
-0.1764572, 1.950525, 1.289194, 1, 1, 1, 1, 1,
-0.1718877, -0.03171617, -0.5819037, 1, 1, 1, 1, 1,
-0.1664319, 1.798935, 0.4992161, 1, 1, 1, 1, 1,
-0.1651969, 1.901917, -1.160349, 1, 1, 1, 1, 1,
-0.1645765, 0.278565, 1.385627, 1, 1, 1, 1, 1,
-0.1641305, 0.6198763, -0.1745233, 1, 1, 1, 1, 1,
-0.1605892, 0.2348917, -0.5537907, 1, 1, 1, 1, 1,
-0.1603752, -0.6208468, -2.298314, 1, 1, 1, 1, 1,
-0.1530984, 0.6058239, -0.3143857, 1, 1, 1, 1, 1,
-0.1528253, -0.551186, -3.23359, 1, 1, 1, 1, 1,
-0.1498203, 0.6321644, 0.1108334, 0, 0, 1, 1, 1,
-0.139704, -0.746938, -1.248343, 1, 0, 0, 1, 1,
-0.1369641, 0.8193567, -0.7896791, 1, 0, 0, 1, 1,
-0.1345785, -1.855533, -2.449163, 1, 0, 0, 1, 1,
-0.1320994, 0.4718322, 2.540307, 1, 0, 0, 1, 1,
-0.1304369, -0.270523, -1.598904, 1, 0, 0, 1, 1,
-0.1301886, -1.165505, -5.004565, 0, 0, 0, 1, 1,
-0.1299855, 0.01520815, -2.390819, 0, 0, 0, 1, 1,
-0.1295445, -1.17516, -3.332409, 0, 0, 0, 1, 1,
-0.1290397, -0.2702981, -2.370085, 0, 0, 0, 1, 1,
-0.1273118, 0.5615468, -1.016689, 0, 0, 0, 1, 1,
-0.1210878, 0.6341262, 0.251735, 0, 0, 0, 1, 1,
-0.1117007, 0.1415109, -1.18851, 0, 0, 0, 1, 1,
-0.1101664, 0.5582703, 0.001834172, 1, 1, 1, 1, 1,
-0.1070419, 0.4646545, -0.3302332, 1, 1, 1, 1, 1,
-0.1062431, 0.3229799, -2.06961, 1, 1, 1, 1, 1,
-0.1038751, 0.5934941, -1.985003, 1, 1, 1, 1, 1,
-0.09966633, 0.2423383, 0.8769572, 1, 1, 1, 1, 1,
-0.0959096, -1.727306, -2.540277, 1, 1, 1, 1, 1,
-0.09587809, 0.7571477, -0.2998981, 1, 1, 1, 1, 1,
-0.09304315, 1.620466, -2.279066, 1, 1, 1, 1, 1,
-0.09285781, -0.2084633, -5.190105, 1, 1, 1, 1, 1,
-0.0905927, 0.6652465, -0.8996155, 1, 1, 1, 1, 1,
-0.08297098, -1.092314, -3.452863, 1, 1, 1, 1, 1,
-0.08292312, 1.393628, -0.1992919, 1, 1, 1, 1, 1,
-0.0826721, 1.070862, -0.696809, 1, 1, 1, 1, 1,
-0.08116546, -0.5193815, -4.091877, 1, 1, 1, 1, 1,
-0.0803493, 0.1656449, -1.376906, 1, 1, 1, 1, 1,
-0.07566524, -1.467139, -3.471591, 0, 0, 1, 1, 1,
-0.0755493, 0.777531, 0.3963689, 1, 0, 0, 1, 1,
-0.07139782, 0.02423677, -0.8984135, 1, 0, 0, 1, 1,
-0.0707994, 0.07761347, -2.148561, 1, 0, 0, 1, 1,
-0.0698582, -1.529335, -0.8387715, 1, 0, 0, 1, 1,
-0.06892464, -0.0381833, -2.402499, 1, 0, 0, 1, 1,
-0.06761011, 1.276189, 1.979555, 0, 0, 0, 1, 1,
-0.06753773, 1.313427, 1.402458, 0, 0, 0, 1, 1,
-0.05852894, -0.6347253, -3.01686, 0, 0, 0, 1, 1,
-0.05631508, -0.6537402, -2.6018, 0, 0, 0, 1, 1,
-0.05561316, 1.528536, 0.1567984, 0, 0, 0, 1, 1,
-0.05499771, 2.16611, 0.001886027, 0, 0, 0, 1, 1,
-0.05314088, -2.59865, -3.164171, 0, 0, 0, 1, 1,
-0.05283315, -0.1502133, -2.137943, 1, 1, 1, 1, 1,
-0.05260401, -1.221312, -2.432568, 1, 1, 1, 1, 1,
-0.04921703, -0.7006335, -2.553168, 1, 1, 1, 1, 1,
-0.04895784, -0.2054032, -1.984807, 1, 1, 1, 1, 1,
-0.04672809, -0.1842881, -2.837818, 1, 1, 1, 1, 1,
-0.04370043, -0.6962534, -3.548704, 1, 1, 1, 1, 1,
-0.0436956, -0.7429632, -2.836659, 1, 1, 1, 1, 1,
-0.04242771, 1.190167, 1.27823, 1, 1, 1, 1, 1,
-0.03819036, 1.0679, -1.257708, 1, 1, 1, 1, 1,
-0.03788011, 0.3666742, -1.569112, 1, 1, 1, 1, 1,
-0.03439418, -0.2156707, -0.582047, 1, 1, 1, 1, 1,
-0.03126926, -0.8921238, -1.457446, 1, 1, 1, 1, 1,
-0.0307544, 0.09451138, 1.542641, 1, 1, 1, 1, 1,
-0.02983056, 1.373483, 0.8017876, 1, 1, 1, 1, 1,
-0.02780808, -0.309947, -3.707568, 1, 1, 1, 1, 1,
-0.02749855, 0.4090817, -0.07638919, 0, 0, 1, 1, 1,
-0.02732004, -0.6305674, -4.288754, 1, 0, 0, 1, 1,
-0.02655017, -0.1816628, -6.297867, 1, 0, 0, 1, 1,
-0.02499011, -0.2706521, -2.914294, 1, 0, 0, 1, 1,
-0.02271465, 2.546681, -0.6294965, 1, 0, 0, 1, 1,
-0.01858632, 0.2111316, 1.588037, 1, 0, 0, 1, 1,
-0.01832812, 0.4674592, -0.2116216, 0, 0, 0, 1, 1,
-0.0173561, 0.008562742, -2.740285, 0, 0, 0, 1, 1,
-0.006827101, -2.829089, -3.721189, 0, 0, 0, 1, 1,
-0.006624726, -1.689422, -2.826829, 0, 0, 0, 1, 1,
-0.004861101, 1.36962, 0.2742929, 0, 0, 0, 1, 1,
-0.001523652, 1.28209, -0.3697891, 0, 0, 0, 1, 1,
-0.0002480541, 1.362657, -0.5494772, 0, 0, 0, 1, 1,
0.01612307, 1.42329, 0.3207863, 1, 1, 1, 1, 1,
0.0246928, -1.520765, 3.398911, 1, 1, 1, 1, 1,
0.02904277, -0.3318705, 1.012542, 1, 1, 1, 1, 1,
0.03040534, 0.02935875, 1.945685, 1, 1, 1, 1, 1,
0.03473042, 1.07938, 0.07128651, 1, 1, 1, 1, 1,
0.03903187, 1.781859, 1.123198, 1, 1, 1, 1, 1,
0.04152634, -0.2001883, 2.671412, 1, 1, 1, 1, 1,
0.04236206, -0.7556607, 3.229405, 1, 1, 1, 1, 1,
0.04583988, -1.415367, 3.296677, 1, 1, 1, 1, 1,
0.04757116, 0.3920438, 1.728536, 1, 1, 1, 1, 1,
0.05349497, -1.289066, 2.785041, 1, 1, 1, 1, 1,
0.05352395, -0.4147876, 2.360076, 1, 1, 1, 1, 1,
0.05363465, 1.840507, 0.4019771, 1, 1, 1, 1, 1,
0.05772211, -1.467852, 2.641636, 1, 1, 1, 1, 1,
0.05777712, 1.097727, 1.593547, 1, 1, 1, 1, 1,
0.06019345, 0.9214014, 1.12739, 0, 0, 1, 1, 1,
0.0629043, 0.6365095, -0.7639964, 1, 0, 0, 1, 1,
0.07219268, -0.2082207, 3.064456, 1, 0, 0, 1, 1,
0.07289419, 1.070422, 0.7208019, 1, 0, 0, 1, 1,
0.08615128, 0.6249811, -0.1031967, 1, 0, 0, 1, 1,
0.08765129, -1.026819, 1.15551, 1, 0, 0, 1, 1,
0.08923361, 1.91463, 1.11253, 0, 0, 0, 1, 1,
0.1264437, -0.576772, 2.495202, 0, 0, 0, 1, 1,
0.1266711, 1.001423, 0.1673929, 0, 0, 0, 1, 1,
0.1269359, 1.254745, 0.7727194, 0, 0, 0, 1, 1,
0.1284028, -0.4277753, 3.571836, 0, 0, 0, 1, 1,
0.1323724, -0.2240828, 2.563282, 0, 0, 0, 1, 1,
0.1347544, -0.8967275, 3.653463, 0, 0, 0, 1, 1,
0.1362617, 0.5064473, -0.9804141, 1, 1, 1, 1, 1,
0.1377721, -0.8378225, 3.568105, 1, 1, 1, 1, 1,
0.1384193, -1.504908, 4.11548, 1, 1, 1, 1, 1,
0.1394319, -0.5610032, 2.06296, 1, 1, 1, 1, 1,
0.1464303, -0.2315153, 3.266943, 1, 1, 1, 1, 1,
0.1482749, 0.1473554, 0.6320344, 1, 1, 1, 1, 1,
0.1548258, -0.7081447, 2.577084, 1, 1, 1, 1, 1,
0.1564783, 1.528973, -1.59771, 1, 1, 1, 1, 1,
0.1590027, 0.7241316, -0.02594066, 1, 1, 1, 1, 1,
0.16447, 0.3761392, 1.508287, 1, 1, 1, 1, 1,
0.1657761, -2.267411, 3.4791, 1, 1, 1, 1, 1,
0.168125, -0.2752158, 4.568999, 1, 1, 1, 1, 1,
0.1712256, -0.8215661, 4.319153, 1, 1, 1, 1, 1,
0.1766843, -1.200181, 1.075028, 1, 1, 1, 1, 1,
0.1766898, -0.2536641, 3.791972, 1, 1, 1, 1, 1,
0.1767857, 0.9176629, 0.9485509, 0, 0, 1, 1, 1,
0.1788327, -0.5438799, 1.425593, 1, 0, 0, 1, 1,
0.1802136, 1.072348, -0.3058898, 1, 0, 0, 1, 1,
0.1843156, 1.211998, 1.743963, 1, 0, 0, 1, 1,
0.1846706, -0.2603906, 3.940197, 1, 0, 0, 1, 1,
0.1853639, -1.629101, 2.899072, 1, 0, 0, 1, 1,
0.1864212, -1.73501, 2.476619, 0, 0, 0, 1, 1,
0.1895502, -0.7914079, 2.646136, 0, 0, 0, 1, 1,
0.1918818, -1.43263, 2.744286, 0, 0, 0, 1, 1,
0.1930344, 0.293112, 0.8073448, 0, 0, 0, 1, 1,
0.1948055, -0.2360327, 2.104062, 0, 0, 0, 1, 1,
0.1985411, -0.409913, 1.48688, 0, 0, 0, 1, 1,
0.1997621, -0.9103087, 4.232312, 0, 0, 0, 1, 1,
0.2006027, -1.024865, 4.202177, 1, 1, 1, 1, 1,
0.2015317, 0.4496049, 1.147024, 1, 1, 1, 1, 1,
0.2050651, -1.949686, 1.323564, 1, 1, 1, 1, 1,
0.2061201, 0.4607564, 0.05684653, 1, 1, 1, 1, 1,
0.2064096, 1.540662, 1.593053, 1, 1, 1, 1, 1,
0.2086555, -0.0668828, 2.013185, 1, 1, 1, 1, 1,
0.2106228, -0.6641754, 4.411365, 1, 1, 1, 1, 1,
0.2110299, -0.8063702, 1.96739, 1, 1, 1, 1, 1,
0.2118256, -0.5567834, 1.43262, 1, 1, 1, 1, 1,
0.2134036, -0.7167018, 3.649646, 1, 1, 1, 1, 1,
0.2168276, 1.770969, -0.02901239, 1, 1, 1, 1, 1,
0.2192848, 0.6764381, -0.5482597, 1, 1, 1, 1, 1,
0.2226625, 1.102236, -0.1458694, 1, 1, 1, 1, 1,
0.2237368, 0.1954421, -0.1472539, 1, 1, 1, 1, 1,
0.2242789, -0.2133376, 1.823462, 1, 1, 1, 1, 1,
0.2251627, 0.8442324, -0.5404094, 0, 0, 1, 1, 1,
0.2268806, -0.1765826, 3.243657, 1, 0, 0, 1, 1,
0.2378154, -0.4046793, 0.4535391, 1, 0, 0, 1, 1,
0.2379028, 1.377428, 2.6881, 1, 0, 0, 1, 1,
0.2405763, 0.3534571, -0.3802957, 1, 0, 0, 1, 1,
0.2470994, 0.7756525, 0.2185977, 1, 0, 0, 1, 1,
0.2472671, -1.286553, 2.990144, 0, 0, 0, 1, 1,
0.2509225, 0.1150828, 1.608596, 0, 0, 0, 1, 1,
0.2529409, 1.209903, -0.1425106, 0, 0, 0, 1, 1,
0.2569119, 1.194166, 0.1961689, 0, 0, 0, 1, 1,
0.2615822, -0.6152828, 2.875441, 0, 0, 0, 1, 1,
0.2625212, -0.3332428, 2.929726, 0, 0, 0, 1, 1,
0.2635793, 0.108205, 2.052126, 0, 0, 0, 1, 1,
0.2710579, -0.3800492, 2.665301, 1, 1, 1, 1, 1,
0.2762754, -0.7713856, 1.269087, 1, 1, 1, 1, 1,
0.2780119, -2.264524, 5.585241, 1, 1, 1, 1, 1,
0.280301, -1.587923, 1.133124, 1, 1, 1, 1, 1,
0.2809502, 1.469939, -0.205437, 1, 1, 1, 1, 1,
0.2819912, -0.2097999, 0.4371782, 1, 1, 1, 1, 1,
0.2853859, 1.082221, 1.219865, 1, 1, 1, 1, 1,
0.2855974, 0.8846439, 0.6021881, 1, 1, 1, 1, 1,
0.2859433, -0.7506689, 1.690172, 1, 1, 1, 1, 1,
0.2871911, 0.5680085, -0.2528395, 1, 1, 1, 1, 1,
0.2893493, 0.06339606, 2.294001, 1, 1, 1, 1, 1,
0.2903282, 0.7007886, 0.4161755, 1, 1, 1, 1, 1,
0.2906095, 0.03380705, 0.9979816, 1, 1, 1, 1, 1,
0.2912157, -0.979991, 3.259568, 1, 1, 1, 1, 1,
0.2928687, -0.2651097, 2.356947, 1, 1, 1, 1, 1,
0.299727, -0.7274556, 2.346389, 0, 0, 1, 1, 1,
0.3033185, 0.03761787, 0.9388414, 1, 0, 0, 1, 1,
0.3067909, -0.3899308, 3.465177, 1, 0, 0, 1, 1,
0.3235247, 0.8346013, 1.228918, 1, 0, 0, 1, 1,
0.3264461, -0.1419597, 0.7652583, 1, 0, 0, 1, 1,
0.3328871, 0.3755807, -0.1138559, 1, 0, 0, 1, 1,
0.3366198, 0.5589671, -0.5616015, 0, 0, 0, 1, 1,
0.3384695, -1.593857, 1.955544, 0, 0, 0, 1, 1,
0.3436041, -0.1226645, 3.31414, 0, 0, 0, 1, 1,
0.3468908, 0.5682634, -2.050408, 0, 0, 0, 1, 1,
0.3512384, -0.3805182, 4.182969, 0, 0, 0, 1, 1,
0.3512393, 1.770603, 1.061343, 0, 0, 0, 1, 1,
0.3513511, -0.3558428, 0.5398329, 0, 0, 0, 1, 1,
0.3545243, 0.6843569, 0.4532578, 1, 1, 1, 1, 1,
0.3549984, 1.181747, -0.09283051, 1, 1, 1, 1, 1,
0.3611383, -1.419203, 3.538863, 1, 1, 1, 1, 1,
0.3619266, -2.703061, 3.090892, 1, 1, 1, 1, 1,
0.3621119, 0.6663983, 0.7533564, 1, 1, 1, 1, 1,
0.3687265, -0.6496215, 1.871262, 1, 1, 1, 1, 1,
0.3732615, 1.749218, 1.549129, 1, 1, 1, 1, 1,
0.3743351, 0.7036932, 0.9253011, 1, 1, 1, 1, 1,
0.3759891, -0.018609, 1.543169, 1, 1, 1, 1, 1,
0.3831904, -0.4994078, 3.384309, 1, 1, 1, 1, 1,
0.3845162, 0.3589857, -1.200424, 1, 1, 1, 1, 1,
0.3856544, 1.639868, 0.720876, 1, 1, 1, 1, 1,
0.3924953, -1.329516, 3.078169, 1, 1, 1, 1, 1,
0.3930446, 1.026808, 0.5096127, 1, 1, 1, 1, 1,
0.3937359, 0.8613613, -0.8455905, 1, 1, 1, 1, 1,
0.3984149, -1.477932, 3.141874, 0, 0, 1, 1, 1,
0.4009668, 0.6548796, -0.5182684, 1, 0, 0, 1, 1,
0.4015178, -0.6674978, 2.479623, 1, 0, 0, 1, 1,
0.4029145, -2.127898, 1.494876, 1, 0, 0, 1, 1,
0.406276, 0.6311761, 0.9884892, 1, 0, 0, 1, 1,
0.4070163, 0.7913069, 2.204187, 1, 0, 0, 1, 1,
0.4108861, -0.1301055, 3.3026, 0, 0, 0, 1, 1,
0.4159954, -0.185123, 0.7512835, 0, 0, 0, 1, 1,
0.4188439, -0.08250803, 1.666061, 0, 0, 0, 1, 1,
0.4222932, -0.5133244, 3.621206, 0, 0, 0, 1, 1,
0.4229555, 0.3101072, -0.4596015, 0, 0, 0, 1, 1,
0.4249151, 1.470303, 0.3177644, 0, 0, 0, 1, 1,
0.4256691, 0.6190521, 1.397984, 0, 0, 0, 1, 1,
0.4343618, 0.07489191, 0.1567902, 1, 1, 1, 1, 1,
0.4364312, -0.5418003, 1.94832, 1, 1, 1, 1, 1,
0.4376854, 1.742438, -0.1649984, 1, 1, 1, 1, 1,
0.4408523, 0.3108683, -0.1124686, 1, 1, 1, 1, 1,
0.4412753, -0.2120947, 2.247841, 1, 1, 1, 1, 1,
0.4424928, -0.5655909, 1.443929, 1, 1, 1, 1, 1,
0.4432426, 1.625274, -0.5229656, 1, 1, 1, 1, 1,
0.4468355, -0.09058268, 1.075359, 1, 1, 1, 1, 1,
0.4472263, -0.306335, 0.6508095, 1, 1, 1, 1, 1,
0.4497997, 0.1405895, 1.989919, 1, 1, 1, 1, 1,
0.4530608, 0.7707171, -1.735993, 1, 1, 1, 1, 1,
0.4536509, 0.05048756, 1.356503, 1, 1, 1, 1, 1,
0.4552056, -0.9090098, 3.799313, 1, 1, 1, 1, 1,
0.4657696, 0.2330104, -0.1821133, 1, 1, 1, 1, 1,
0.4674534, -0.2452244, 2.203856, 1, 1, 1, 1, 1,
0.4676563, -1.216308, 2.328315, 0, 0, 1, 1, 1,
0.4682739, 0.1542534, 0.783832, 1, 0, 0, 1, 1,
0.4699693, -0.3461978, 3.113362, 1, 0, 0, 1, 1,
0.4705291, 0.09258217, 2.456126, 1, 0, 0, 1, 1,
0.4712997, 0.09797136, 0.6990688, 1, 0, 0, 1, 1,
0.471999, 1.544551, 0.5906996, 1, 0, 0, 1, 1,
0.4760505, 0.8021117, 0.3506738, 0, 0, 0, 1, 1,
0.4761819, -0.1582342, 3.271741, 0, 0, 0, 1, 1,
0.4766803, 1.085882, -0.7345642, 0, 0, 0, 1, 1,
0.4786733, 0.1322009, 1.092708, 0, 0, 0, 1, 1,
0.480988, 0.7743057, 2.95023, 0, 0, 0, 1, 1,
0.4849149, 0.2969391, -0.5750571, 0, 0, 0, 1, 1,
0.4920647, 1.491839, -0.6836132, 0, 0, 0, 1, 1,
0.4928577, -0.3632374, 3.133654, 1, 1, 1, 1, 1,
0.4930034, 1.122864, -0.4191321, 1, 1, 1, 1, 1,
0.5001572, -1.075548, 5.008445, 1, 1, 1, 1, 1,
0.5009689, -0.9562141, 3.085684, 1, 1, 1, 1, 1,
0.5043392, 1.636247, 1.532337, 1, 1, 1, 1, 1,
0.5095363, -2.082647, 2.962879, 1, 1, 1, 1, 1,
0.5116962, 0.4031528, 2.266235, 1, 1, 1, 1, 1,
0.5165768, 2.047583, 0.1298779, 1, 1, 1, 1, 1,
0.5237135, 0.3399477, 1.135685, 1, 1, 1, 1, 1,
0.527155, -1.022979, 2.4457, 1, 1, 1, 1, 1,
0.5312082, -0.6441627, 2.096612, 1, 1, 1, 1, 1,
0.5319417, -1.098858, 3.14553, 1, 1, 1, 1, 1,
0.5401798, 0.2360101, 0.7485044, 1, 1, 1, 1, 1,
0.5405731, 0.2010625, 2.123326, 1, 1, 1, 1, 1,
0.5469887, 0.9907572, 0.1479127, 1, 1, 1, 1, 1,
0.5611048, 0.1178193, 1.692659, 0, 0, 1, 1, 1,
0.5661586, -1.251373, 1.831513, 1, 0, 0, 1, 1,
0.5684114, 1.974157, 1.658139, 1, 0, 0, 1, 1,
0.5685481, -1.078486, 5.054613, 1, 0, 0, 1, 1,
0.5756007, 0.8424426, 0.1131542, 1, 0, 0, 1, 1,
0.5759851, -0.7639583, 4.862447, 1, 0, 0, 1, 1,
0.5850785, -0.6581453, 4.02861, 0, 0, 0, 1, 1,
0.592279, -0.7744194, 3.301227, 0, 0, 0, 1, 1,
0.5925601, -0.1344352, 1.327219, 0, 0, 0, 1, 1,
0.5952906, -0.5050166, 2.647338, 0, 0, 0, 1, 1,
0.5980433, -0.7441725, 3.355899, 0, 0, 0, 1, 1,
0.6003616, 0.7880059, 1.657146, 0, 0, 0, 1, 1,
0.6027064, 0.7019825, 1.85845, 0, 0, 0, 1, 1,
0.603175, 0.1141697, 0.2617359, 1, 1, 1, 1, 1,
0.6047414, -0.8096437, 0.3213098, 1, 1, 1, 1, 1,
0.6070688, -0.162028, 1.073597, 1, 1, 1, 1, 1,
0.6088594, -1.877236, 2.062915, 1, 1, 1, 1, 1,
0.6128482, 1.008582, -0.3747958, 1, 1, 1, 1, 1,
0.620191, 0.6009126, 1.180672, 1, 1, 1, 1, 1,
0.6214827, -0.2143108, 2.194723, 1, 1, 1, 1, 1,
0.6235822, -1.97367, 3.510164, 1, 1, 1, 1, 1,
0.6252081, -0.05587688, 2.506418, 1, 1, 1, 1, 1,
0.6285566, -0.9287478, 4.240198, 1, 1, 1, 1, 1,
0.6288518, -0.6698793, 2.410032, 1, 1, 1, 1, 1,
0.6297209, -0.9569777, 2.529383, 1, 1, 1, 1, 1,
0.6307096, -2.215193, 2.507036, 1, 1, 1, 1, 1,
0.6330507, -0.04494307, 1.865588, 1, 1, 1, 1, 1,
0.6363297, -0.3669109, 3.184268, 1, 1, 1, 1, 1,
0.6373799, -0.2219912, 0.9500828, 0, 0, 1, 1, 1,
0.6415951, -0.6643612, 1.346582, 1, 0, 0, 1, 1,
0.6435581, -0.02796173, 1.452342, 1, 0, 0, 1, 1,
0.6457127, 1.139147, 1.584628, 1, 0, 0, 1, 1,
0.6459635, -0.9283774, 2.936583, 1, 0, 0, 1, 1,
0.6491359, -1.601517, 1.734733, 1, 0, 0, 1, 1,
0.6535366, -0.4881679, 1.083764, 0, 0, 0, 1, 1,
0.6600364, -0.9413337, 2.166067, 0, 0, 0, 1, 1,
0.6602818, 0.4847423, 0.8546912, 0, 0, 0, 1, 1,
0.6629605, -0.02528594, 2.30263, 0, 0, 0, 1, 1,
0.6639428, 0.9117706, 3.284096, 0, 0, 0, 1, 1,
0.6659104, 1.114909, 0.4608458, 0, 0, 0, 1, 1,
0.6671532, 0.3232423, 2.789428, 0, 0, 0, 1, 1,
0.6703928, -1.135879, 2.273321, 1, 1, 1, 1, 1,
0.671087, -0.2354779, 2.359835, 1, 1, 1, 1, 1,
0.6715453, -1.203549, 1.956494, 1, 1, 1, 1, 1,
0.672796, -0.4021062, 1.862412, 1, 1, 1, 1, 1,
0.6748495, -0.02125528, 1.932245, 1, 1, 1, 1, 1,
0.6779922, -0.8776239, 2.605187, 1, 1, 1, 1, 1,
0.6796595, 1.371574, 1.003368, 1, 1, 1, 1, 1,
0.6811975, 1.443224, 1.157496, 1, 1, 1, 1, 1,
0.6966186, -0.287832, 0.9836825, 1, 1, 1, 1, 1,
0.6998047, -1.914624, 2.958188, 1, 1, 1, 1, 1,
0.7026089, 0.4940773, 1.284049, 1, 1, 1, 1, 1,
0.7031486, 0.1096098, 3.083836, 1, 1, 1, 1, 1,
0.7032242, 0.2359949, 2.639734, 1, 1, 1, 1, 1,
0.7065338, -2.145285, 2.12044, 1, 1, 1, 1, 1,
0.7118863, -0.4817039, 2.051743, 1, 1, 1, 1, 1,
0.7126708, -1.752991, 1.512846, 0, 0, 1, 1, 1,
0.7172187, 1.522378, -0.8537652, 1, 0, 0, 1, 1,
0.7210504, 0.2194356, 1.865288, 1, 0, 0, 1, 1,
0.7274444, -0.8096081, 2.184152, 1, 0, 0, 1, 1,
0.7286946, -0.454104, 0.7456864, 1, 0, 0, 1, 1,
0.7351476, 1.205382, 1.652011, 1, 0, 0, 1, 1,
0.736558, 0.0417783, 1.496714, 0, 0, 0, 1, 1,
0.7382988, 0.4544282, 0.2893111, 0, 0, 0, 1, 1,
0.7399212, 2.143431, -0.9920894, 0, 0, 0, 1, 1,
0.7425431, -1.081069, 2.531036, 0, 0, 0, 1, 1,
0.7439599, 0.1399028, 1.531432, 0, 0, 0, 1, 1,
0.7502481, -0.3231953, 1.777249, 0, 0, 0, 1, 1,
0.7525096, 2.110756, 1.29741, 0, 0, 0, 1, 1,
0.7543197, -0.4797424, 1.421323, 1, 1, 1, 1, 1,
0.7557698, -0.1767828, 2.355929, 1, 1, 1, 1, 1,
0.7622037, -1.085158, 3.362363, 1, 1, 1, 1, 1,
0.7639037, 1.856146, 0.5233371, 1, 1, 1, 1, 1,
0.7646069, -1.035486, 1.814247, 1, 1, 1, 1, 1,
0.7746336, -2.046503, 2.179658, 1, 1, 1, 1, 1,
0.7780879, -0.0909453, 2.952635, 1, 1, 1, 1, 1,
0.7819751, -0.2088726, 0.6111986, 1, 1, 1, 1, 1,
0.7826676, -1.281977, 1.845114, 1, 1, 1, 1, 1,
0.7849088, -0.7875608, 2.377704, 1, 1, 1, 1, 1,
0.7883114, 1.318107, 0.9442337, 1, 1, 1, 1, 1,
0.7973351, -1.0667, 2.313919, 1, 1, 1, 1, 1,
0.7977844, -0.7213835, 2.128499, 1, 1, 1, 1, 1,
0.8025306, -0.5777227, 3.48178, 1, 1, 1, 1, 1,
0.8062625, -1.628389, 4.172791, 1, 1, 1, 1, 1,
0.8072809, 1.480381, 1.03805, 0, 0, 1, 1, 1,
0.8080966, 0.3707807, 0.9757913, 1, 0, 0, 1, 1,
0.8109564, 0.04267169, 2.352591, 1, 0, 0, 1, 1,
0.8112141, -0.2275409, 0.2013435, 1, 0, 0, 1, 1,
0.8173146, 1.252492, 0.4370928, 1, 0, 0, 1, 1,
0.8178284, 0.9127619, 0.4784521, 1, 0, 0, 1, 1,
0.8199512, 0.2664461, 0.9193717, 0, 0, 0, 1, 1,
0.8260922, -0.034145, 1.157786, 0, 0, 0, 1, 1,
0.8402772, 1.276274, 0.6109264, 0, 0, 0, 1, 1,
0.8529757, -0.06891594, 3.239042, 0, 0, 0, 1, 1,
0.8560523, -1.911411, 1.622886, 0, 0, 0, 1, 1,
0.8592709, 0.2837973, 0.837453, 0, 0, 0, 1, 1,
0.8619337, -0.8298997, 2.36449, 0, 0, 0, 1, 1,
0.86458, 0.5160882, 1.322227, 1, 1, 1, 1, 1,
0.8679055, 0.4744087, -0.5071563, 1, 1, 1, 1, 1,
0.8695232, 0.6319759, 0.05108351, 1, 1, 1, 1, 1,
0.8729402, -0.887805, 3.049766, 1, 1, 1, 1, 1,
0.8787853, 0.1146907, 0.4807279, 1, 1, 1, 1, 1,
0.8829192, -0.6273597, 3.99257, 1, 1, 1, 1, 1,
0.8830862, 1.60111, 0.1639329, 1, 1, 1, 1, 1,
0.8869671, 1.055582, 1.204297, 1, 1, 1, 1, 1,
0.8871122, -0.01585901, 1.392584, 1, 1, 1, 1, 1,
0.8885217, -0.5877867, 2.483915, 1, 1, 1, 1, 1,
0.8912929, -1.044345, 2.149835, 1, 1, 1, 1, 1,
0.8947622, -1.217212, 3.613466, 1, 1, 1, 1, 1,
0.8976235, 1.985047, -1.086496, 1, 1, 1, 1, 1,
0.9014327, -0.9818703, 2.818289, 1, 1, 1, 1, 1,
0.9037913, 0.7789755, 0.1558054, 1, 1, 1, 1, 1,
0.9047211, 0.4462689, 1.184644, 0, 0, 1, 1, 1,
0.9122794, -0.7167318, 2.228571, 1, 0, 0, 1, 1,
0.9127614, -0.7460888, 0.9604853, 1, 0, 0, 1, 1,
0.9148288, -1.257119, 3.753505, 1, 0, 0, 1, 1,
0.9154962, 0.2683, 0.9616103, 1, 0, 0, 1, 1,
0.9234064, -0.2169791, 1.560826, 1, 0, 0, 1, 1,
0.9243138, 1.402572, 1.649521, 0, 0, 0, 1, 1,
0.9320296, 1.213786, 1.810659, 0, 0, 0, 1, 1,
0.9401679, -1.146974, 1.185118, 0, 0, 0, 1, 1,
0.9405503, -0.8032383, 1.368715, 0, 0, 0, 1, 1,
0.9446703, -1.436691, 2.115932, 0, 0, 0, 1, 1,
0.9462003, 0.4145039, 0.6392829, 0, 0, 0, 1, 1,
0.9511496, 0.3197448, 0.7368419, 0, 0, 0, 1, 1,
0.9594307, 0.5005463, 0.9414902, 1, 1, 1, 1, 1,
0.9606891, 0.3983728, 0.4581633, 1, 1, 1, 1, 1,
0.9638245, 0.4299591, 1.863113, 1, 1, 1, 1, 1,
0.9688777, -0.5380185, 0.9180503, 1, 1, 1, 1, 1,
0.9715056, 0.1671593, 0.5608975, 1, 1, 1, 1, 1,
0.9759364, 0.5725989, 0.04782199, 1, 1, 1, 1, 1,
0.9780241, -0.6591089, 1.103989, 1, 1, 1, 1, 1,
0.9794213, 1.3862, 1.02381, 1, 1, 1, 1, 1,
0.9810626, -0.2649009, 0.3668659, 1, 1, 1, 1, 1,
0.9867119, 0.04153116, 1.338325, 1, 1, 1, 1, 1,
0.9885172, 0.210024, 0.2212439, 1, 1, 1, 1, 1,
0.9903646, 0.1213738, 2.321831, 1, 1, 1, 1, 1,
0.990698, -0.4618061, 0.9266177, 1, 1, 1, 1, 1,
1.000702, 0.3724072, 1.256297, 1, 1, 1, 1, 1,
1.002068, -0.9934197, 1.880173, 1, 1, 1, 1, 1,
1.002319, -0.2933528, 1.703236, 0, 0, 1, 1, 1,
1.012048, -0.5897643, 0.9150236, 1, 0, 0, 1, 1,
1.01239, -0.2872865, 3.513815, 1, 0, 0, 1, 1,
1.019167, 1.263686, 0.1445794, 1, 0, 0, 1, 1,
1.030192, 0.3660342, -0.7298461, 1, 0, 0, 1, 1,
1.031303, -1.416624, 2.055851, 1, 0, 0, 1, 1,
1.039997, -1.245095, 4.365233, 0, 0, 0, 1, 1,
1.040449, -0.5936384, 3.141955, 0, 0, 0, 1, 1,
1.041096, 1.689249, 0.3536896, 0, 0, 0, 1, 1,
1.051191, 1.200257, 1.651448, 0, 0, 0, 1, 1,
1.052891, -0.01595702, 0.5950842, 0, 0, 0, 1, 1,
1.057827, -0.5476711, 2.071784, 0, 0, 0, 1, 1,
1.058456, -0.07169674, 1.592511, 0, 0, 0, 1, 1,
1.060306, -0.1796861, 2.009806, 1, 1, 1, 1, 1,
1.067007, -1.44359, 1.931006, 1, 1, 1, 1, 1,
1.070364, 0.3089547, -0.9053794, 1, 1, 1, 1, 1,
1.086781, -0.6835419, 1.602956, 1, 1, 1, 1, 1,
1.08787, 0.7290013, -0.3406186, 1, 1, 1, 1, 1,
1.088629, 1.903322, 1.403197, 1, 1, 1, 1, 1,
1.090364, -0.5227962, 1.34386, 1, 1, 1, 1, 1,
1.102007, 0.6919746, 0.001784678, 1, 1, 1, 1, 1,
1.108677, 1.762193, 0.05162048, 1, 1, 1, 1, 1,
1.115247, 0.2245563, 1.315316, 1, 1, 1, 1, 1,
1.117432, 0.8730866, 1.057663, 1, 1, 1, 1, 1,
1.118751, -0.2825546, 3.037856, 1, 1, 1, 1, 1,
1.123928, 0.7088236, 1.125598, 1, 1, 1, 1, 1,
1.126642, -1.305928, 2.356843, 1, 1, 1, 1, 1,
1.133893, -0.190507, 1.369611, 1, 1, 1, 1, 1,
1.134169, -0.1416373, 1.768709, 0, 0, 1, 1, 1,
1.152854, -0.1121269, 2.313662, 1, 0, 0, 1, 1,
1.156899, 0.5274913, -0.1766094, 1, 0, 0, 1, 1,
1.157897, 1.593259, 2.063041, 1, 0, 0, 1, 1,
1.164919, -1.479746, 3.061095, 1, 0, 0, 1, 1,
1.167072, -0.05222275, 1.651307, 1, 0, 0, 1, 1,
1.175254, 0.4794058, 1.701705, 0, 0, 0, 1, 1,
1.180709, -1.896803, 1.493679, 0, 0, 0, 1, 1,
1.186934, -1.275621, 1.688991, 0, 0, 0, 1, 1,
1.19453, -0.3026462, 1.693926, 0, 0, 0, 1, 1,
1.19816, 0.6988844, -0.03772048, 0, 0, 0, 1, 1,
1.203231, -1.866153, 2.109105, 0, 0, 0, 1, 1,
1.216632, 1.258803, 1.715758, 0, 0, 0, 1, 1,
1.21759, -0.2634614, 1.425375, 1, 1, 1, 1, 1,
1.218377, 0.3516364, -0.3221085, 1, 1, 1, 1, 1,
1.218967, -2.368181, 3.343876, 1, 1, 1, 1, 1,
1.221359, 0.5764226, 0.8193926, 1, 1, 1, 1, 1,
1.22282, 2.636606, -0.2425114, 1, 1, 1, 1, 1,
1.231786, -0.4019473, 4.210437, 1, 1, 1, 1, 1,
1.245281, 0.1688637, 0.4948906, 1, 1, 1, 1, 1,
1.250049, 0.18943, 1.647529, 1, 1, 1, 1, 1,
1.254324, -0.660751, 1.582417, 1, 1, 1, 1, 1,
1.256, -0.7062408, 0.2624676, 1, 1, 1, 1, 1,
1.257816, -1.132486, 2.679919, 1, 1, 1, 1, 1,
1.265015, 1.475506, 1.608171, 1, 1, 1, 1, 1,
1.271028, 0.5763313, 0.5314366, 1, 1, 1, 1, 1,
1.273686, -0.6949443, 2.18028, 1, 1, 1, 1, 1,
1.275993, 1.012758, 1.908618, 1, 1, 1, 1, 1,
1.276885, -0.2761004, 0.7530785, 0, 0, 1, 1, 1,
1.287152, 0.2395021, 1.297874, 1, 0, 0, 1, 1,
1.292714, 2.751373, 0.5444562, 1, 0, 0, 1, 1,
1.29533, 1.223074, -1.50363, 1, 0, 0, 1, 1,
1.301474, -0.2554022, 2.68625, 1, 0, 0, 1, 1,
1.308017, 0.00618252, 0.4695966, 1, 0, 0, 1, 1,
1.323538, -1.665366, 1.303366, 0, 0, 0, 1, 1,
1.333113, -1.684716, 1.563154, 0, 0, 0, 1, 1,
1.339459, -0.1624587, 2.04869, 0, 0, 0, 1, 1,
1.341746, 0.5781109, 2.444948, 0, 0, 0, 1, 1,
1.346924, 0.8667997, 1.48427, 0, 0, 0, 1, 1,
1.357106, 0.1261248, 0.9020295, 0, 0, 0, 1, 1,
1.357728, -0.1452159, 2.950669, 0, 0, 0, 1, 1,
1.362329, 0.6927335, 2.121835, 1, 1, 1, 1, 1,
1.371654, 0.2132759, 0.653081, 1, 1, 1, 1, 1,
1.373898, -0.7842714, 1.69406, 1, 1, 1, 1, 1,
1.375903, -0.265662, 1.701144, 1, 1, 1, 1, 1,
1.38326, 0.3578205, 2.548825, 1, 1, 1, 1, 1,
1.40145, -0.2419013, 2.286246, 1, 1, 1, 1, 1,
1.403898, 0.4106146, -1.493783, 1, 1, 1, 1, 1,
1.418916, -0.9333588, 1.990923, 1, 1, 1, 1, 1,
1.422303, -0.4521378, 1.492135, 1, 1, 1, 1, 1,
1.423987, -0.8325146, 1.144201, 1, 1, 1, 1, 1,
1.426889, 0.3586071, 1.003436, 1, 1, 1, 1, 1,
1.432575, 1.657304, 0.4810924, 1, 1, 1, 1, 1,
1.435269, 1.521224, 1.271822, 1, 1, 1, 1, 1,
1.437945, -1.055007, 2.446474, 1, 1, 1, 1, 1,
1.441723, -0.146688, 1.750621, 1, 1, 1, 1, 1,
1.442952, -1.488893, 2.870965, 0, 0, 1, 1, 1,
1.443416, -1.582505, 0.9520239, 1, 0, 0, 1, 1,
1.451845, -0.1272056, 1.707304, 1, 0, 0, 1, 1,
1.453507, -0.4421802, 1.631232, 1, 0, 0, 1, 1,
1.45937, 0.7785816, 3.139281, 1, 0, 0, 1, 1,
1.460349, 0.06568471, 1.078727, 1, 0, 0, 1, 1,
1.464484, 1.301983, 2.233404, 0, 0, 0, 1, 1,
1.470452, -0.4652604, 1.128703, 0, 0, 0, 1, 1,
1.493423, -0.2596264, 0.8893197, 0, 0, 0, 1, 1,
1.51167, 0.8610246, 2.610859, 0, 0, 0, 1, 1,
1.51192, 0.1711055, 2.679638, 0, 0, 0, 1, 1,
1.517624, -1.766536, 1.506842, 0, 0, 0, 1, 1,
1.519205, 0.3497829, -0.1765395, 0, 0, 0, 1, 1,
1.525344, -2.077015, 2.750118, 1, 1, 1, 1, 1,
1.563268, 1.062581, 1.430573, 1, 1, 1, 1, 1,
1.577671, -1.007353, 3.487581, 1, 1, 1, 1, 1,
1.58815, -1.095713, 2.43644, 1, 1, 1, 1, 1,
1.594919, -1.128728, -0.02886288, 1, 1, 1, 1, 1,
1.601435, 0.7488641, 1.465867, 1, 1, 1, 1, 1,
1.62124, 0.6905623, 0.762265, 1, 1, 1, 1, 1,
1.63801, -1.973161, 2.158888, 1, 1, 1, 1, 1,
1.665924, -0.9298336, 1.74459, 1, 1, 1, 1, 1,
1.669945, 0.3320154, 1.378462, 1, 1, 1, 1, 1,
1.678306, -1.487751, 3.253495, 1, 1, 1, 1, 1,
1.685593, -1.108666, 3.456553, 1, 1, 1, 1, 1,
1.688982, -0.1660114, 1.083038, 1, 1, 1, 1, 1,
1.702736, 0.3192633, 2.731122, 1, 1, 1, 1, 1,
1.70553, 0.04689844, 0.6035938, 1, 1, 1, 1, 1,
1.712317, -0.7185524, 2.791599, 0, 0, 1, 1, 1,
1.713906, -0.3369413, 0.5022351, 1, 0, 0, 1, 1,
1.720963, -1.399822, 3.450704, 1, 0, 0, 1, 1,
1.726766, 0.3607936, 1.073549, 1, 0, 0, 1, 1,
1.761158, -0.1524509, 1.834224, 1, 0, 0, 1, 1,
1.763128, 1.322058, 1.436247, 1, 0, 0, 1, 1,
1.766407, -1.141796, 1.780696, 0, 0, 0, 1, 1,
1.779351, 1.680549, -0.07896142, 0, 0, 0, 1, 1,
1.81897, 0.1578158, 3.919071, 0, 0, 0, 1, 1,
1.822353, -0.34925, 3.191665, 0, 0, 0, 1, 1,
1.829415, -0.205433, 3.126052, 0, 0, 0, 1, 1,
1.841752, -0.6869262, 0.7790664, 0, 0, 0, 1, 1,
1.868268, 0.5133289, 3.107805, 0, 0, 0, 1, 1,
1.879409, -1.507374, 2.95464, 1, 1, 1, 1, 1,
1.893, 1.337833, 1.665118, 1, 1, 1, 1, 1,
1.898865, -0.01722519, 0.3902258, 1, 1, 1, 1, 1,
1.938937, -0.03179651, 1.061514, 1, 1, 1, 1, 1,
1.967337, -1.915348, 2.734887, 1, 1, 1, 1, 1,
1.973089, 0.02665723, 1.916399, 1, 1, 1, 1, 1,
1.992123, 0.3405711, 1.757724, 1, 1, 1, 1, 1,
2.014762, -0.7110633, 2.728934, 1, 1, 1, 1, 1,
2.041395, -0.6067835, 1.60355, 1, 1, 1, 1, 1,
2.057785, 1.247214, -0.3267713, 1, 1, 1, 1, 1,
2.111634, 0.1812974, 0.611915, 1, 1, 1, 1, 1,
2.117226, -0.1992235, 2.339463, 1, 1, 1, 1, 1,
2.165353, 0.9218179, 1.438025, 1, 1, 1, 1, 1,
2.206287, -1.852461, 2.894907, 1, 1, 1, 1, 1,
2.216308, 0.2182029, 2.45408, 1, 1, 1, 1, 1,
2.274975, 0.9999442, 1.622429, 0, 0, 1, 1, 1,
2.29764, -2.2097, 1.475165, 1, 0, 0, 1, 1,
2.32487, 0.8157742, 1.420493, 1, 0, 0, 1, 1,
2.341292, -0.102078, 1.789178, 1, 0, 0, 1, 1,
2.381181, 0.07308554, 1.731139, 1, 0, 0, 1, 1,
2.415372, -0.5435748, 2.960342, 1, 0, 0, 1, 1,
2.468231, -1.158679, 1.524935, 0, 0, 0, 1, 1,
2.483831, -0.9141653, 1.339501, 0, 0, 0, 1, 1,
2.525338, 0.5363765, 2.419273, 0, 0, 0, 1, 1,
2.530929, 0.1604253, 2.281512, 0, 0, 0, 1, 1,
2.581836, 0.186945, 4.600418, 0, 0, 0, 1, 1,
2.584196, 1.087798, 2.022808, 0, 0, 0, 1, 1,
2.624659, 0.1220207, 3.802495, 0, 0, 0, 1, 1,
2.837742, -0.8993635, 1.555876, 1, 1, 1, 1, 1,
3.006615, 0.06107786, 1.95966, 1, 1, 1, 1, 1,
3.175942, -0.9677071, 0.9195919, 1, 1, 1, 1, 1,
3.421242, -1.245204, 1.67221, 1, 1, 1, 1, 1,
3.519815, 0.1054279, -1.381437, 1, 1, 1, 1, 1,
4.065683, -1.141312, 1.603022, 1, 1, 1, 1, 1,
4.082416, 0.2446143, 0.6707113, 1, 1, 1, 1, 1
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
var radius = 9.985181;
var distance = 35.07252;
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
mvMatrix.translate( -0.7326558, -0.08170068, 0.356313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07252);
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
