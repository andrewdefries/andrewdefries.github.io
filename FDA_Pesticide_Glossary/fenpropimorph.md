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
-3.371568, -1.536838, -0.899574, 1, 0, 0, 1,
-2.791152, 1.218848, 0.2442036, 1, 0.007843138, 0, 1,
-2.78271, 0.3923778, -1.71129, 1, 0.01176471, 0, 1,
-2.777833, -0.2868198, -2.545756, 1, 0.01960784, 0, 1,
-2.716264, 0.06967916, -1.571403, 1, 0.02352941, 0, 1,
-2.580913, -2.187933, -1.351041, 1, 0.03137255, 0, 1,
-2.384629, 0.195368, -0.1626397, 1, 0.03529412, 0, 1,
-2.358931, -2.095924, -2.074691, 1, 0.04313726, 0, 1,
-2.349279, 0.1974946, -4.554798, 1, 0.04705882, 0, 1,
-2.322028, 0.8473412, -0.1566119, 1, 0.05490196, 0, 1,
-2.274806, -0.9389516, -2.122579, 1, 0.05882353, 0, 1,
-2.265157, -0.04943199, -1.231953, 1, 0.06666667, 0, 1,
-2.207833, -2.163267, -0.2437595, 1, 0.07058824, 0, 1,
-2.202761, 1.7547, -1.24516, 1, 0.07843138, 0, 1,
-2.183277, -1.643669, -2.132884, 1, 0.08235294, 0, 1,
-2.170231, -0.5182867, -2.765665, 1, 0.09019608, 0, 1,
-2.163327, -1.201451, -2.331363, 1, 0.09411765, 0, 1,
-2.069927, -0.8859168, -1.935578, 1, 0.1019608, 0, 1,
-2.028408, -0.7913917, -2.590713, 1, 0.1098039, 0, 1,
-2.013214, -0.7294652, -2.575239, 1, 0.1137255, 0, 1,
-2.004695, -0.9104765, -2.406975, 1, 0.1215686, 0, 1,
-2.00388, 1.064227, -3.652006, 1, 0.1254902, 0, 1,
-1.960363, -0.5340223, -0.34214, 1, 0.1333333, 0, 1,
-1.949998, 0.2276781, -2.390001, 1, 0.1372549, 0, 1,
-1.930963, 0.5419821, -0.1884568, 1, 0.145098, 0, 1,
-1.920154, -0.3407015, -2.260114, 1, 0.1490196, 0, 1,
-1.906977, -0.6270398, -1.116851, 1, 0.1568628, 0, 1,
-1.8978, 0.08228842, -0.9246404, 1, 0.1607843, 0, 1,
-1.88446, 0.1536845, -1.763553, 1, 0.1686275, 0, 1,
-1.867016, 0.663415, -0.581222, 1, 0.172549, 0, 1,
-1.850182, -0.8452963, -3.686088, 1, 0.1803922, 0, 1,
-1.843549, -0.06216354, -1.132506, 1, 0.1843137, 0, 1,
-1.839071, -0.7721834, -2.136326, 1, 0.1921569, 0, 1,
-1.837245, 0.02706094, -0.3998875, 1, 0.1960784, 0, 1,
-1.832568, 0.3621797, -2.747364, 1, 0.2039216, 0, 1,
-1.830529, -0.4057272, -2.570512, 1, 0.2117647, 0, 1,
-1.826602, 0.5902834, -1.074763, 1, 0.2156863, 0, 1,
-1.794384, -1.159639, -2.342765, 1, 0.2235294, 0, 1,
-1.791396, -0.04733227, -0.8835659, 1, 0.227451, 0, 1,
-1.772293, -0.9485387, -3.430218, 1, 0.2352941, 0, 1,
-1.765071, -0.8571386, -0.4171707, 1, 0.2392157, 0, 1,
-1.757026, 0.4289622, -2.757862, 1, 0.2470588, 0, 1,
-1.756949, 0.2641161, -2.411315, 1, 0.2509804, 0, 1,
-1.729132, -0.6241142, -1.011322, 1, 0.2588235, 0, 1,
-1.726536, 2.035706, -0.2468514, 1, 0.2627451, 0, 1,
-1.664736, 0.2244342, 0.08852158, 1, 0.2705882, 0, 1,
-1.66275, -2.674817, -2.912756, 1, 0.2745098, 0, 1,
-1.653948, 0.6763183, -0.7417862, 1, 0.282353, 0, 1,
-1.650218, 0.745419, -1.010763, 1, 0.2862745, 0, 1,
-1.647214, 0.6076373, -0.06705914, 1, 0.2941177, 0, 1,
-1.626714, -0.4709354, 0.3937012, 1, 0.3019608, 0, 1,
-1.618563, 0.7036871, -1.606323, 1, 0.3058824, 0, 1,
-1.613983, -0.1989236, -1.499227, 1, 0.3137255, 0, 1,
-1.609475, -1.805878, -3.437783, 1, 0.3176471, 0, 1,
-1.599654, 0.06494373, 0.4968816, 1, 0.3254902, 0, 1,
-1.590913, -1.282169, -1.482226, 1, 0.3294118, 0, 1,
-1.57855, -1.151832, -1.924326, 1, 0.3372549, 0, 1,
-1.578507, 0.6677101, 1.46064, 1, 0.3411765, 0, 1,
-1.571211, 2.623395, -1.369511, 1, 0.3490196, 0, 1,
-1.567363, -1.579923, -1.314501, 1, 0.3529412, 0, 1,
-1.552241, -1.073373, -1.770384, 1, 0.3607843, 0, 1,
-1.543517, -0.3190307, -1.8058, 1, 0.3647059, 0, 1,
-1.534026, 0.279939, -2.822335, 1, 0.372549, 0, 1,
-1.520849, -1.341756, -1.679879, 1, 0.3764706, 0, 1,
-1.507495, 1.092629, -1.771959, 1, 0.3843137, 0, 1,
-1.503204, 0.4922123, -2.579376, 1, 0.3882353, 0, 1,
-1.490907, 0.4173269, -0.8072544, 1, 0.3960784, 0, 1,
-1.49055, -0.08226842, -3.203998, 1, 0.4039216, 0, 1,
-1.487505, -1.835073, -1.685673, 1, 0.4078431, 0, 1,
-1.480755, 0.1276208, -1.088464, 1, 0.4156863, 0, 1,
-1.472604, -0.3529147, -3.222324, 1, 0.4196078, 0, 1,
-1.469679, -0.4686572, -1.618276, 1, 0.427451, 0, 1,
-1.460603, -0.4624376, -2.263099, 1, 0.4313726, 0, 1,
-1.45246, -0.1514358, -2.198119, 1, 0.4392157, 0, 1,
-1.440279, 0.3832196, -1.208706, 1, 0.4431373, 0, 1,
-1.438333, 1.24381, 1.157548, 1, 0.4509804, 0, 1,
-1.429815, 0.002741854, -0.4002651, 1, 0.454902, 0, 1,
-1.401346, -1.583524, -4.567569, 1, 0.4627451, 0, 1,
-1.39989, -0.1387915, -1.471567, 1, 0.4666667, 0, 1,
-1.398452, 0.1838231, -2.224428, 1, 0.4745098, 0, 1,
-1.396653, 1.080268, -0.4565341, 1, 0.4784314, 0, 1,
-1.395014, 0.3399202, -0.3733941, 1, 0.4862745, 0, 1,
-1.390355, -0.4800102, -2.24723, 1, 0.4901961, 0, 1,
-1.384177, -0.145668, -1.748359, 1, 0.4980392, 0, 1,
-1.38118, -0.860449, -3.042731, 1, 0.5058824, 0, 1,
-1.379078, 0.9688046, -1.092396, 1, 0.509804, 0, 1,
-1.368832, 1.013938, -1.084141, 1, 0.5176471, 0, 1,
-1.330311, 1.36138, 0.1993795, 1, 0.5215687, 0, 1,
-1.326769, 0.6647294, -0.7287391, 1, 0.5294118, 0, 1,
-1.323631, -0.1716068, -1.425866, 1, 0.5333334, 0, 1,
-1.322137, 1.634973, -1.483069, 1, 0.5411765, 0, 1,
-1.315914, 0.70037, -0.6474976, 1, 0.5450981, 0, 1,
-1.312731, -1.280324, -0.9770648, 1, 0.5529412, 0, 1,
-1.309133, 0.974967, -0.6083364, 1, 0.5568628, 0, 1,
-1.291422, 0.4698115, 0.4435078, 1, 0.5647059, 0, 1,
-1.290257, 0.1198702, -2.819332, 1, 0.5686275, 0, 1,
-1.280563, -0.09513163, -0.8005182, 1, 0.5764706, 0, 1,
-1.28018, 0.9966965, -0.2898759, 1, 0.5803922, 0, 1,
-1.27962, -0.6506543, -2.293097, 1, 0.5882353, 0, 1,
-1.279487, 0.2680545, -1.580116, 1, 0.5921569, 0, 1,
-1.274445, 0.2645685, -1.469906, 1, 0.6, 0, 1,
-1.262325, -0.5548582, -3.375449, 1, 0.6078432, 0, 1,
-1.250089, -0.1781415, -1.008809, 1, 0.6117647, 0, 1,
-1.247822, -0.8155062, -3.81018, 1, 0.6196079, 0, 1,
-1.24003, -0.3377627, -3.555856, 1, 0.6235294, 0, 1,
-1.233189, -0.486739, -1.828047, 1, 0.6313726, 0, 1,
-1.2236, -0.3733054, -3.725484, 1, 0.6352941, 0, 1,
-1.210424, -0.2533658, -0.9266725, 1, 0.6431373, 0, 1,
-1.209406, 1.027492, 2.446117, 1, 0.6470588, 0, 1,
-1.204208, 1.396527, -1.971052, 1, 0.654902, 0, 1,
-1.19574, 0.4487704, 0.3400432, 1, 0.6588235, 0, 1,
-1.194639, 1.721754, -2.179157, 1, 0.6666667, 0, 1,
-1.191325, 0.7436566, -1.27302, 1, 0.6705883, 0, 1,
-1.189275, 1.647333, -1.632322, 1, 0.6784314, 0, 1,
-1.185122, -0.2529445, -0.6407869, 1, 0.682353, 0, 1,
-1.183495, 0.7272879, -1.021326, 1, 0.6901961, 0, 1,
-1.176029, 1.659883, 1.238981, 1, 0.6941177, 0, 1,
-1.174769, 0.06757282, -0.5489053, 1, 0.7019608, 0, 1,
-1.172659, 0.03698842, -1.646243, 1, 0.7098039, 0, 1,
-1.171083, 0.2312997, 0.744857, 1, 0.7137255, 0, 1,
-1.170349, 0.5211985, -1.458672, 1, 0.7215686, 0, 1,
-1.163661, 0.6085284, -2.252867, 1, 0.7254902, 0, 1,
-1.155402, 0.4792783, -0.3937103, 1, 0.7333333, 0, 1,
-1.152363, -0.1346264, -2.806298, 1, 0.7372549, 0, 1,
-1.152198, 0.5246959, -0.5739317, 1, 0.7450981, 0, 1,
-1.151608, -0.6402912, -4.984688, 1, 0.7490196, 0, 1,
-1.145592, -1.636714, -2.659124, 1, 0.7568628, 0, 1,
-1.142294, -0.352211, 0.8017124, 1, 0.7607843, 0, 1,
-1.139917, -1.154246, -3.208029, 1, 0.7686275, 0, 1,
-1.135465, -1.259001, -2.007052, 1, 0.772549, 0, 1,
-1.127756, 0.06056027, -0.3365467, 1, 0.7803922, 0, 1,
-1.119613, -0.1806194, -2.223931, 1, 0.7843137, 0, 1,
-1.11699, -0.6300889, -1.231638, 1, 0.7921569, 0, 1,
-1.116502, 1.370563, 0.214983, 1, 0.7960784, 0, 1,
-1.112979, 0.9735132, -1.714192, 1, 0.8039216, 0, 1,
-1.112469, -0.05275908, -2.084902, 1, 0.8117647, 0, 1,
-1.105096, 1.218482, -0.2661767, 1, 0.8156863, 0, 1,
-1.095038, 0.7874773, -1.744294, 1, 0.8235294, 0, 1,
-1.088837, 0.1456107, -1.252205, 1, 0.827451, 0, 1,
-1.085765, -1.54343, -3.808557, 1, 0.8352941, 0, 1,
-1.08575, -0.1401901, -0.2493507, 1, 0.8392157, 0, 1,
-1.082549, 0.2041573, -1.249381, 1, 0.8470588, 0, 1,
-1.076993, 0.05084962, -1.319371, 1, 0.8509804, 0, 1,
-1.074831, 0.389302, -1.593105, 1, 0.8588235, 0, 1,
-1.073872, 1.063993, -2.277548, 1, 0.8627451, 0, 1,
-1.069794, 0.3283819, -0.6078959, 1, 0.8705882, 0, 1,
-1.065357, 1.777237, -0.6132353, 1, 0.8745098, 0, 1,
-1.052345, 0.4410706, -0.6486779, 1, 0.8823529, 0, 1,
-1.051014, -0.6898074, -2.02119, 1, 0.8862745, 0, 1,
-1.047706, 1.032554, -0.4709905, 1, 0.8941177, 0, 1,
-1.045406, 0.05508402, 0.4263967, 1, 0.8980392, 0, 1,
-1.032734, 0.2961281, -1.743447, 1, 0.9058824, 0, 1,
-1.027451, 1.115648, -0.6887364, 1, 0.9137255, 0, 1,
-1.023512, -0.6813095, -2.481808, 1, 0.9176471, 0, 1,
-1.0232, -2.966541, -1.892156, 1, 0.9254902, 0, 1,
-1.02196, -0.4338621, -2.576983, 1, 0.9294118, 0, 1,
-1.021884, 1.209797, 0.4934934, 1, 0.9372549, 0, 1,
-1.019723, -0.7540459, -1.004889, 1, 0.9411765, 0, 1,
-1.017833, 0.9209358, -1.063875, 1, 0.9490196, 0, 1,
-1.012386, -0.2722782, -4.855274, 1, 0.9529412, 0, 1,
-1.011559, -0.4714903, -1.113959, 1, 0.9607843, 0, 1,
-1.009228, -1.002777, -1.462988, 1, 0.9647059, 0, 1,
-1.001189, 1.216739, -1.500573, 1, 0.972549, 0, 1,
-0.999782, -0.1611737, -3.820252, 1, 0.9764706, 0, 1,
-0.9980165, -0.3463285, -3.696229, 1, 0.9843137, 0, 1,
-0.9908855, 1.476109, -0.6370076, 1, 0.9882353, 0, 1,
-0.9882291, 0.5671089, -2.527653, 1, 0.9960784, 0, 1,
-0.9807941, 1.963641, 1.918629, 0.9960784, 1, 0, 1,
-0.9657385, 0.07749534, -2.906001, 0.9921569, 1, 0, 1,
-0.9638876, -1.122828, -1.608341, 0.9843137, 1, 0, 1,
-0.9614723, 0.01383532, -1.875281, 0.9803922, 1, 0, 1,
-0.9586824, 0.364256, -1.640805, 0.972549, 1, 0, 1,
-0.9575269, -1.67108, -0.4883086, 0.9686275, 1, 0, 1,
-0.9446802, -0.2487007, -2.045625, 0.9607843, 1, 0, 1,
-0.9341969, 1.143653, -1.06661, 0.9568627, 1, 0, 1,
-0.9245961, -1.509877, -2.167888, 0.9490196, 1, 0, 1,
-0.9230294, -0.7711607, -3.330608, 0.945098, 1, 0, 1,
-0.9200394, -1.112597, -1.604511, 0.9372549, 1, 0, 1,
-0.9193146, -0.5964876, -0.9330327, 0.9333333, 1, 0, 1,
-0.9172134, 0.5484033, -1.407366, 0.9254902, 1, 0, 1,
-0.9167743, -1.523414, -2.629467, 0.9215686, 1, 0, 1,
-0.9101035, -0.1646234, -0.7020096, 0.9137255, 1, 0, 1,
-0.9045061, 0.2816975, -0.1370664, 0.9098039, 1, 0, 1,
-0.9024541, 0.8307053, -2.297982, 0.9019608, 1, 0, 1,
-0.8978652, -0.3180179, -1.500786, 0.8941177, 1, 0, 1,
-0.8964188, 0.1598603, -2.707081, 0.8901961, 1, 0, 1,
-0.8961003, -0.8313353, -1.606702, 0.8823529, 1, 0, 1,
-0.8947544, 0.8770018, -0.4786095, 0.8784314, 1, 0, 1,
-0.8889515, 0.3145874, -2.54156, 0.8705882, 1, 0, 1,
-0.8862562, -1.261736, -1.354222, 0.8666667, 1, 0, 1,
-0.8826095, 2.041878, -0.4635903, 0.8588235, 1, 0, 1,
-0.8821831, 1.624168, -2.020938, 0.854902, 1, 0, 1,
-0.8645051, -0.4338357, -1.284567, 0.8470588, 1, 0, 1,
-0.863833, -1.562409, -2.753916, 0.8431373, 1, 0, 1,
-0.8619459, -0.2932336, -1.286888, 0.8352941, 1, 0, 1,
-0.857318, -0.2438609, -1.963863, 0.8313726, 1, 0, 1,
-0.841831, -0.4332044, -1.627422, 0.8235294, 1, 0, 1,
-0.8416126, 1.913618, -1.528312, 0.8196079, 1, 0, 1,
-0.8364983, 0.01822555, -1.648936, 0.8117647, 1, 0, 1,
-0.8339679, 0.4009341, -1.348909, 0.8078431, 1, 0, 1,
-0.8228269, -1.103911, -0.9260834, 0.8, 1, 0, 1,
-0.8181932, -1.121491, -2.045146, 0.7921569, 1, 0, 1,
-0.8169466, -0.07037709, -1.947143, 0.7882353, 1, 0, 1,
-0.8141445, -1.45238, -1.021918, 0.7803922, 1, 0, 1,
-0.8136593, 1.308237, -1.184588, 0.7764706, 1, 0, 1,
-0.8128589, 0.3730675, 0.253099, 0.7686275, 1, 0, 1,
-0.8118699, -1.778311, -0.7995334, 0.7647059, 1, 0, 1,
-0.8056654, 0.6540317, -0.5535095, 0.7568628, 1, 0, 1,
-0.8014939, -0.1915068, -1.343606, 0.7529412, 1, 0, 1,
-0.8008265, -1.525735, -2.867769, 0.7450981, 1, 0, 1,
-0.7949499, 0.3960468, -0.7156388, 0.7411765, 1, 0, 1,
-0.7941306, 1.57596, 0.1930137, 0.7333333, 1, 0, 1,
-0.7938864, -1.182313, -2.732582, 0.7294118, 1, 0, 1,
-0.7910192, -1.283774, -2.330366, 0.7215686, 1, 0, 1,
-0.7902259, -1.231744, -0.945317, 0.7176471, 1, 0, 1,
-0.7847919, 1.722412, -2.468414, 0.7098039, 1, 0, 1,
-0.7700239, -0.8976291, -1.816021, 0.7058824, 1, 0, 1,
-0.7699327, -0.928617, -2.429151, 0.6980392, 1, 0, 1,
-0.7678124, -0.2039499, -0.4184194, 0.6901961, 1, 0, 1,
-0.7672224, 1.207584, -3.709659, 0.6862745, 1, 0, 1,
-0.7647898, 0.4160853, -0.5220966, 0.6784314, 1, 0, 1,
-0.763333, -0.2505267, -1.5116, 0.6745098, 1, 0, 1,
-0.7595735, -1.169418, -2.412545, 0.6666667, 1, 0, 1,
-0.7563859, 1.326754, -0.9662361, 0.6627451, 1, 0, 1,
-0.7483026, -1.174974, -1.501701, 0.654902, 1, 0, 1,
-0.7475022, -0.1864383, -0.3044169, 0.6509804, 1, 0, 1,
-0.7472847, -0.0207212, -1.518929, 0.6431373, 1, 0, 1,
-0.7430033, 0.01353371, -2.621834, 0.6392157, 1, 0, 1,
-0.742672, -0.6620117, -2.652373, 0.6313726, 1, 0, 1,
-0.7406007, 1.453301, -0.6657421, 0.627451, 1, 0, 1,
-0.7333406, -0.2741385, -0.4695719, 0.6196079, 1, 0, 1,
-0.728925, 1.289529, -0.7469224, 0.6156863, 1, 0, 1,
-0.7262643, 1.660808, -0.5443354, 0.6078432, 1, 0, 1,
-0.7213231, -0.1901174, -1.688325, 0.6039216, 1, 0, 1,
-0.7192237, 1.547115, -0.1269989, 0.5960785, 1, 0, 1,
-0.7178908, 1.118124, 0.3919733, 0.5882353, 1, 0, 1,
-0.7121992, 0.01355508, -2.185486, 0.5843138, 1, 0, 1,
-0.7110212, 0.4253459, 0.7460348, 0.5764706, 1, 0, 1,
-0.7085448, -0.472531, -2.745398, 0.572549, 1, 0, 1,
-0.6965111, -0.5802101, -2.487751, 0.5647059, 1, 0, 1,
-0.6962162, 1.10524, -0.2707973, 0.5607843, 1, 0, 1,
-0.6943102, 0.6056134, -1.737443, 0.5529412, 1, 0, 1,
-0.6896377, 2.510561, -0.5390856, 0.5490196, 1, 0, 1,
-0.6883712, 0.6856085, -0.7411575, 0.5411765, 1, 0, 1,
-0.6876587, -0.1297239, -0.1218888, 0.5372549, 1, 0, 1,
-0.6841936, -0.4058198, -2.541917, 0.5294118, 1, 0, 1,
-0.683674, -0.6580937, -2.855058, 0.5254902, 1, 0, 1,
-0.6780959, 0.1298356, -1.897772, 0.5176471, 1, 0, 1,
-0.6742417, -0.2322241, -1.160211, 0.5137255, 1, 0, 1,
-0.6737914, 0.9903938, -1.046734, 0.5058824, 1, 0, 1,
-0.6727595, -2.11938, -1.77883, 0.5019608, 1, 0, 1,
-0.6694564, 2.450376, -1.105, 0.4941176, 1, 0, 1,
-0.6673564, 1.453722, -0.1895933, 0.4862745, 1, 0, 1,
-0.6659408, -0.9754899, -2.516079, 0.4823529, 1, 0, 1,
-0.6622027, -0.6962217, -1.572615, 0.4745098, 1, 0, 1,
-0.658954, 0.003428191, -3.71711, 0.4705882, 1, 0, 1,
-0.6520515, -1.084706, -2.804891, 0.4627451, 1, 0, 1,
-0.6496704, 0.04537298, -0.6679692, 0.4588235, 1, 0, 1,
-0.6495091, 1.292715, 0.05581262, 0.4509804, 1, 0, 1,
-0.6463521, 0.4896118, 0.8981312, 0.4470588, 1, 0, 1,
-0.6453884, 0.05488972, -0.8155149, 0.4392157, 1, 0, 1,
-0.6435172, 0.7933226, -1.097623, 0.4352941, 1, 0, 1,
-0.6419079, 0.00221926, -0.7900074, 0.427451, 1, 0, 1,
-0.6415843, 0.8185159, -0.7020875, 0.4235294, 1, 0, 1,
-0.6390802, -0.3585389, -3.085557, 0.4156863, 1, 0, 1,
-0.6389658, -0.845385, -0.6035554, 0.4117647, 1, 0, 1,
-0.6349115, 0.9507866, -0.1572334, 0.4039216, 1, 0, 1,
-0.6323677, -0.8283659, -2.264184, 0.3960784, 1, 0, 1,
-0.6269521, -0.3180052, -1.756844, 0.3921569, 1, 0, 1,
-0.617838, -0.9771373, -2.374002, 0.3843137, 1, 0, 1,
-0.6063007, -2.359478, -3.504281, 0.3803922, 1, 0, 1,
-0.6036164, 0.4194897, -1.274194, 0.372549, 1, 0, 1,
-0.6011044, 0.2414995, -2.642834, 0.3686275, 1, 0, 1,
-0.6004846, -2.478533, -3.306749, 0.3607843, 1, 0, 1,
-0.5998895, 1.216648, -1.275311, 0.3568628, 1, 0, 1,
-0.5938888, -1.187791, -4.218955, 0.3490196, 1, 0, 1,
-0.5877544, -0.6046792, -3.420738, 0.345098, 1, 0, 1,
-0.5841614, 0.5355918, -0.9383848, 0.3372549, 1, 0, 1,
-0.5818948, -0.9652348, -1.26851, 0.3333333, 1, 0, 1,
-0.5810535, 0.950267, 0.6818349, 0.3254902, 1, 0, 1,
-0.5772048, 1.750181, -1.687423, 0.3215686, 1, 0, 1,
-0.5762872, 0.1561632, -0.8304389, 0.3137255, 1, 0, 1,
-0.5708581, -1.507081, -3.153275, 0.3098039, 1, 0, 1,
-0.5693187, 0.85672, -0.09602107, 0.3019608, 1, 0, 1,
-0.5644981, 0.5699004, -1.079426, 0.2941177, 1, 0, 1,
-0.554365, 0.8179658, -0.03625411, 0.2901961, 1, 0, 1,
-0.5532953, -1.004939, -4.181147, 0.282353, 1, 0, 1,
-0.5524352, 0.2793332, -1.440817, 0.2784314, 1, 0, 1,
-0.552366, 0.02727138, -2.193362, 0.2705882, 1, 0, 1,
-0.5511127, -0.9279019, -2.957447, 0.2666667, 1, 0, 1,
-0.5465448, -0.7939259, -2.335487, 0.2588235, 1, 0, 1,
-0.5460004, -1.071638, -2.719369, 0.254902, 1, 0, 1,
-0.5429584, 0.2570376, -0.3136486, 0.2470588, 1, 0, 1,
-0.5390894, 0.2177651, -0.6756113, 0.2431373, 1, 0, 1,
-0.5378395, 1.179938, 0.9977415, 0.2352941, 1, 0, 1,
-0.5332516, -0.7267777, -2.964829, 0.2313726, 1, 0, 1,
-0.5316324, 2.058443, -1.189694, 0.2235294, 1, 0, 1,
-0.5278187, -0.8071731, -2.19216, 0.2196078, 1, 0, 1,
-0.527688, 0.6392858, 0.2166879, 0.2117647, 1, 0, 1,
-0.5265964, 1.191468, -1.321256, 0.2078431, 1, 0, 1,
-0.5220842, 1.404905, 1.241032, 0.2, 1, 0, 1,
-0.5162756, -0.2013467, -1.156327, 0.1921569, 1, 0, 1,
-0.5149142, 0.9807789, -1.018923, 0.1882353, 1, 0, 1,
-0.5137507, -0.2255602, -1.214393, 0.1803922, 1, 0, 1,
-0.5040814, -0.9802836, -4.121484, 0.1764706, 1, 0, 1,
-0.5040377, 2.564271, -0.8097006, 0.1686275, 1, 0, 1,
-0.5034286, -0.7853597, -1.87034, 0.1647059, 1, 0, 1,
-0.5019533, 0.5466027, -1.303622, 0.1568628, 1, 0, 1,
-0.5007486, 1.34895, -0.01266516, 0.1529412, 1, 0, 1,
-0.49343, -0.687461, -2.710121, 0.145098, 1, 0, 1,
-0.4897313, 0.9762601, -0.9717169, 0.1411765, 1, 0, 1,
-0.4894327, 0.9044259, -0.7263901, 0.1333333, 1, 0, 1,
-0.4879387, 0.4095853, -0.9580958, 0.1294118, 1, 0, 1,
-0.4872267, -0.9143097, -2.664999, 0.1215686, 1, 0, 1,
-0.4732685, -1.120215, -2.874829, 0.1176471, 1, 0, 1,
-0.4725127, 0.3148798, -1.015276, 0.1098039, 1, 0, 1,
-0.4687636, -0.930132, -3.489021, 0.1058824, 1, 0, 1,
-0.4674439, -2.224322, -1.682912, 0.09803922, 1, 0, 1,
-0.4630378, -2.302068, -2.929152, 0.09019608, 1, 0, 1,
-0.4602781, -0.748925, -2.570173, 0.08627451, 1, 0, 1,
-0.4560241, -1.323775, -2.498351, 0.07843138, 1, 0, 1,
-0.454294, 0.3521839, 0.9890993, 0.07450981, 1, 0, 1,
-0.4517758, -0.3895756, -2.729255, 0.06666667, 1, 0, 1,
-0.4347333, -2.605901, -3.436354, 0.0627451, 1, 0, 1,
-0.433794, 0.3394338, -1.222112, 0.05490196, 1, 0, 1,
-0.4319214, 0.4361879, -1.267695, 0.05098039, 1, 0, 1,
-0.4313746, 0.8656942, -1.127166, 0.04313726, 1, 0, 1,
-0.4264293, -0.4870381, 0.1408086, 0.03921569, 1, 0, 1,
-0.4262608, 0.8028549, -0.3179521, 0.03137255, 1, 0, 1,
-0.4206094, 0.4588223, -3.311689, 0.02745098, 1, 0, 1,
-0.4162878, 2.049825, -0.405103, 0.01960784, 1, 0, 1,
-0.4131619, 0.5942311, -1.885815, 0.01568628, 1, 0, 1,
-0.4112103, -0.9292837, -3.340951, 0.007843138, 1, 0, 1,
-0.4099603, -1.139146, -3.870693, 0.003921569, 1, 0, 1,
-0.4083203, -0.9955937, -4.420246, 0, 1, 0.003921569, 1,
-0.4053065, -0.6935527, -1.073946, 0, 1, 0.01176471, 1,
-0.4050639, 1.798378, -1.611555, 0, 1, 0.01568628, 1,
-0.4041545, -0.01858525, -2.677943, 0, 1, 0.02352941, 1,
-0.4015355, -1.289041, -3.50115, 0, 1, 0.02745098, 1,
-0.3987794, 1.116264, 0.3211165, 0, 1, 0.03529412, 1,
-0.3980592, 0.1317029, -0.8869206, 0, 1, 0.03921569, 1,
-0.3851588, -1.772149, -3.129081, 0, 1, 0.04705882, 1,
-0.385085, -0.4454308, -2.346201, 0, 1, 0.05098039, 1,
-0.385033, 1.2893, -0.09563325, 0, 1, 0.05882353, 1,
-0.3805011, -0.1453652, -3.176822, 0, 1, 0.0627451, 1,
-0.3788695, -0.1210113, -3.061119, 0, 1, 0.07058824, 1,
-0.3781072, -0.9752278, -3.223562, 0, 1, 0.07450981, 1,
-0.3752432, -0.8891877, -2.596493, 0, 1, 0.08235294, 1,
-0.3739055, -1.020342, -4.294491, 0, 1, 0.08627451, 1,
-0.3711475, 0.2145487, -0.5812233, 0, 1, 0.09411765, 1,
-0.3666221, -0.01328842, -1.835437, 0, 1, 0.1019608, 1,
-0.3567871, 1.290097, -0.3217926, 0, 1, 0.1058824, 1,
-0.3551019, 0.2458122, -2.026315, 0, 1, 0.1137255, 1,
-0.3547336, -0.7136248, -2.919968, 0, 1, 0.1176471, 1,
-0.3544695, 0.9903746, -1.734723, 0, 1, 0.1254902, 1,
-0.3517884, 1.740141, -0.5420675, 0, 1, 0.1294118, 1,
-0.3473439, 0.5640845, -0.9072145, 0, 1, 0.1372549, 1,
-0.3464266, 0.5699586, -1.135399, 0, 1, 0.1411765, 1,
-0.3398502, -1.202966, -3.889397, 0, 1, 0.1490196, 1,
-0.3388327, 0.06268918, -0.7835167, 0, 1, 0.1529412, 1,
-0.3369819, -0.5483826, -2.896572, 0, 1, 0.1607843, 1,
-0.3301072, 0.4426131, 0.6138791, 0, 1, 0.1647059, 1,
-0.329191, -0.71763, -0.7709998, 0, 1, 0.172549, 1,
-0.3272643, -1.766162, -2.18694, 0, 1, 0.1764706, 1,
-0.3261075, -0.2209846, -1.646647, 0, 1, 0.1843137, 1,
-0.3223638, -2.19036, -2.480052, 0, 1, 0.1882353, 1,
-0.3211972, -0.8553721, -2.929344, 0, 1, 0.1960784, 1,
-0.3202919, -0.3454605, -1.475642, 0, 1, 0.2039216, 1,
-0.3144682, 2.187226, 0.04668135, 0, 1, 0.2078431, 1,
-0.3128975, -1.529029, -2.807581, 0, 1, 0.2156863, 1,
-0.3092523, -0.4424041, -3.660197, 0, 1, 0.2196078, 1,
-0.305046, -0.5809627, -2.593637, 0, 1, 0.227451, 1,
-0.3028495, -0.4252866, -3.872256, 0, 1, 0.2313726, 1,
-0.3025045, 1.37242, -1.329907, 0, 1, 0.2392157, 1,
-0.2975217, 2.06357, -1.418141, 0, 1, 0.2431373, 1,
-0.2963166, 0.8927954, 0.5395368, 0, 1, 0.2509804, 1,
-0.2904739, -1.451459, -2.8634, 0, 1, 0.254902, 1,
-0.2898825, 0.988345, 0.9324462, 0, 1, 0.2627451, 1,
-0.2838391, 0.1124583, -1.758801, 0, 1, 0.2666667, 1,
-0.2834836, 0.5998329, -0.2571796, 0, 1, 0.2745098, 1,
-0.2812997, 1.8005, -0.1291708, 0, 1, 0.2784314, 1,
-0.2771959, -0.8848199, -1.640377, 0, 1, 0.2862745, 1,
-0.2712958, -0.06579046, -2.646276, 0, 1, 0.2901961, 1,
-0.2679939, 0.4556876, -0.5044104, 0, 1, 0.2980392, 1,
-0.2642142, -0.8510779, -3.963696, 0, 1, 0.3058824, 1,
-0.2571651, -1.148965, -2.722186, 0, 1, 0.3098039, 1,
-0.2561351, -0.4412687, -2.916196, 0, 1, 0.3176471, 1,
-0.2503484, 0.06310653, -0.5612589, 0, 1, 0.3215686, 1,
-0.2483007, 1.724221, -1.496516, 0, 1, 0.3294118, 1,
-0.2473225, -0.5757346, -2.861055, 0, 1, 0.3333333, 1,
-0.2437001, 0.06284685, 0.3069791, 0, 1, 0.3411765, 1,
-0.2429671, -0.4388698, -1.465317, 0, 1, 0.345098, 1,
-0.2394122, -0.1952973, -2.159633, 0, 1, 0.3529412, 1,
-0.2387168, -0.3967531, -2.538016, 0, 1, 0.3568628, 1,
-0.2385625, -0.8448107, -2.024439, 0, 1, 0.3647059, 1,
-0.235671, 0.7762644, -0.554226, 0, 1, 0.3686275, 1,
-0.2308575, -1.125121, -3.236968, 0, 1, 0.3764706, 1,
-0.2304366, -0.396644, -2.713629, 0, 1, 0.3803922, 1,
-0.2269946, -0.9604677, -2.161505, 0, 1, 0.3882353, 1,
-0.2251125, 1.396906, 0.2418737, 0, 1, 0.3921569, 1,
-0.2191482, -1.29678, -2.735037, 0, 1, 0.4, 1,
-0.2174113, -0.2083593, -2.53283, 0, 1, 0.4078431, 1,
-0.2169516, -2.540199, -3.602755, 0, 1, 0.4117647, 1,
-0.2161303, 0.4772992, -0.3990507, 0, 1, 0.4196078, 1,
-0.2157068, -0.2176903, -4.421928, 0, 1, 0.4235294, 1,
-0.2085588, -0.5067279, -0.9523457, 0, 1, 0.4313726, 1,
-0.2075166, -0.907872, -2.280938, 0, 1, 0.4352941, 1,
-0.2038398, 0.4198783, -0.2590342, 0, 1, 0.4431373, 1,
-0.2015544, -0.4377887, -3.269855, 0, 1, 0.4470588, 1,
-0.2007513, 0.3259743, 0.2168572, 0, 1, 0.454902, 1,
-0.2005236, -0.904623, -1.972948, 0, 1, 0.4588235, 1,
-0.1976472, -0.1075438, 0.2467631, 0, 1, 0.4666667, 1,
-0.197619, -1.190552, -2.711268, 0, 1, 0.4705882, 1,
-0.1953398, -0.2508054, -2.779828, 0, 1, 0.4784314, 1,
-0.1952087, 1.3829, -0.2874098, 0, 1, 0.4823529, 1,
-0.1939117, 1.336199, -0.4475079, 0, 1, 0.4901961, 1,
-0.1865751, -0.3335657, -1.82822, 0, 1, 0.4941176, 1,
-0.1862731, 0.2290126, -0.406088, 0, 1, 0.5019608, 1,
-0.1831368, -0.4341872, -3.043811, 0, 1, 0.509804, 1,
-0.1806362, 0.6132478, -2.6744, 0, 1, 0.5137255, 1,
-0.1744868, -0.7839396, -1.389146, 0, 1, 0.5215687, 1,
-0.1734717, 2.210291, -0.589257, 0, 1, 0.5254902, 1,
-0.1688839, -1.210424, -2.879745, 0, 1, 0.5333334, 1,
-0.1673735, 0.3351346, 1.50669, 0, 1, 0.5372549, 1,
-0.1662664, 2.20238, -0.5920675, 0, 1, 0.5450981, 1,
-0.1659189, -0.1395353, -0.5611515, 0, 1, 0.5490196, 1,
-0.1654698, 0.4130899, -0.8337305, 0, 1, 0.5568628, 1,
-0.1626811, 2.044109, -1.270339, 0, 1, 0.5607843, 1,
-0.1619441, -0.9191175, -1.479177, 0, 1, 0.5686275, 1,
-0.1609065, 1.038806, -1.185573, 0, 1, 0.572549, 1,
-0.1605203, 0.9143578, 0.2590306, 0, 1, 0.5803922, 1,
-0.1584114, 0.748221, -1.6541, 0, 1, 0.5843138, 1,
-0.1535897, -1.035917, -2.066905, 0, 1, 0.5921569, 1,
-0.1521507, -0.1027895, -3.688885, 0, 1, 0.5960785, 1,
-0.1519689, 1.199058, 0.4449224, 0, 1, 0.6039216, 1,
-0.1518925, 0.354431, -1.270024, 0, 1, 0.6117647, 1,
-0.1510354, 0.6610229, 1.480325, 0, 1, 0.6156863, 1,
-0.1477385, 1.220373, 0.03339093, 0, 1, 0.6235294, 1,
-0.1471605, -0.2323482, -3.35882, 0, 1, 0.627451, 1,
-0.1364902, 0.7438918, -0.5326301, 0, 1, 0.6352941, 1,
-0.1356881, 1.51289, 1.089766, 0, 1, 0.6392157, 1,
-0.1322779, 0.2786227, -1.367534, 0, 1, 0.6470588, 1,
-0.1321765, -1.502587, -2.402507, 0, 1, 0.6509804, 1,
-0.131092, -0.4066282, -1.651521, 0, 1, 0.6588235, 1,
-0.1310107, 0.8132115, 1.584896, 0, 1, 0.6627451, 1,
-0.1277013, -2.086418, -5.346537, 0, 1, 0.6705883, 1,
-0.1272124, 0.120887, 0.2076188, 0, 1, 0.6745098, 1,
-0.12707, 0.02791978, -2.035601, 0, 1, 0.682353, 1,
-0.125419, 0.4592166, 0.7223971, 0, 1, 0.6862745, 1,
-0.1253675, 0.5886446, -0.6518944, 0, 1, 0.6941177, 1,
-0.1216012, 0.925501, -0.9120485, 0, 1, 0.7019608, 1,
-0.1182898, -0.6155686, -4.467247, 0, 1, 0.7058824, 1,
-0.1160614, 1.106633, -1.441304, 0, 1, 0.7137255, 1,
-0.1146396, 0.4473673, -1.62473, 0, 1, 0.7176471, 1,
-0.1145992, 1.516745, -0.3800328, 0, 1, 0.7254902, 1,
-0.1123735, -0.05451718, -2.531866, 0, 1, 0.7294118, 1,
-0.1117337, 0.05061084, -0.977994, 0, 1, 0.7372549, 1,
-0.1057903, 1.036605, -0.003921259, 0, 1, 0.7411765, 1,
-0.10293, 0.002290627, -0.3617614, 0, 1, 0.7490196, 1,
-0.09542622, -2.225701, -3.114539, 0, 1, 0.7529412, 1,
-0.09434123, 2.764959, 0.6448835, 0, 1, 0.7607843, 1,
-0.08985401, -1.104599, -2.966371, 0, 1, 0.7647059, 1,
-0.08730596, -0.7177207, -3.409164, 0, 1, 0.772549, 1,
-0.08476903, -0.03267148, -1.398198, 0, 1, 0.7764706, 1,
-0.07740874, 1.847748, 0.159237, 0, 1, 0.7843137, 1,
-0.07644196, 0.7177058, -0.7399884, 0, 1, 0.7882353, 1,
-0.07503813, -0.6068787, -2.041378, 0, 1, 0.7960784, 1,
-0.06971407, 0.8497579, 0.5266431, 0, 1, 0.8039216, 1,
-0.05980924, -1.673679, -2.295219, 0, 1, 0.8078431, 1,
-0.05683965, 0.2335056, -1.128665, 0, 1, 0.8156863, 1,
-0.05677858, -0.5651837, -1.991265, 0, 1, 0.8196079, 1,
-0.05604504, 1.441656, -0.3405174, 0, 1, 0.827451, 1,
-0.05603288, -1.455627, -4.743922, 0, 1, 0.8313726, 1,
-0.05136335, -0.3023887, -4.168474, 0, 1, 0.8392157, 1,
-0.0512799, -0.09339675, -2.41883, 0, 1, 0.8431373, 1,
-0.0502968, 0.4864469, -0.8735241, 0, 1, 0.8509804, 1,
-0.05025424, 1.613857, -0.7344452, 0, 1, 0.854902, 1,
-0.04803894, -1.004791, -2.985039, 0, 1, 0.8627451, 1,
-0.04433093, -1.264444, -2.047926, 0, 1, 0.8666667, 1,
-0.04373955, 0.562102, 0.5401152, 0, 1, 0.8745098, 1,
-0.03989659, 0.1280012, -1.292031, 0, 1, 0.8784314, 1,
-0.03640388, 0.8580285, 1.285451, 0, 1, 0.8862745, 1,
-0.03584377, -0.3607579, -1.505075, 0, 1, 0.8901961, 1,
-0.03515467, 0.8638409, 0.1243133, 0, 1, 0.8980392, 1,
-0.0298354, 0.3752148, 0.8579137, 0, 1, 0.9058824, 1,
-0.02722864, -0.4425513, -3.858341, 0, 1, 0.9098039, 1,
-0.02677459, -1.798813, -1.94433, 0, 1, 0.9176471, 1,
-0.02634059, 0.1679737, -0.8966227, 0, 1, 0.9215686, 1,
-0.02510013, 0.07822679, 0.5696719, 0, 1, 0.9294118, 1,
-0.02474401, -1.829328, -4.514198, 0, 1, 0.9333333, 1,
-0.02338531, 0.01379485, -0.470244, 0, 1, 0.9411765, 1,
-0.02275391, -1.426218, -4.458992, 0, 1, 0.945098, 1,
-0.02055669, 0.5825231, -2.292935, 0, 1, 0.9529412, 1,
-0.01940905, -0.08044434, -2.571083, 0, 1, 0.9568627, 1,
-0.01898531, -0.05117299, -2.841813, 0, 1, 0.9647059, 1,
-0.0156862, 1.492471, -0.7128469, 0, 1, 0.9686275, 1,
-0.0133405, 1.074206, -0.6742718, 0, 1, 0.9764706, 1,
-0.00979044, -2.664474, -2.164599, 0, 1, 0.9803922, 1,
-0.004699595, 1.604116, -0.1953154, 0, 1, 0.9882353, 1,
-0.002894545, 0.3647828, 0.8527647, 0, 1, 0.9921569, 1,
0.001031331, 0.1431865, 1.599944, 0, 1, 1, 1,
0.002246212, 1.133207, -0.5985767, 0, 0.9921569, 1, 1,
0.005081286, 1.67819, 0.1266454, 0, 0.9882353, 1, 1,
0.0115155, -1.120033, 3.017373, 0, 0.9803922, 1, 1,
0.0163737, -0.5486909, 2.269129, 0, 0.9764706, 1, 1,
0.02073095, -1.557831, 1.640482, 0, 0.9686275, 1, 1,
0.02857994, -0.8044796, 1.12455, 0, 0.9647059, 1, 1,
0.03057033, 0.06311908, -1.225597, 0, 0.9568627, 1, 1,
0.03615511, -0.9784698, 1.982083, 0, 0.9529412, 1, 1,
0.03823421, -2.049201, 3.544248, 0, 0.945098, 1, 1,
0.04252903, 0.4458526, 0.4721147, 0, 0.9411765, 1, 1,
0.043279, 1.571469, -0.2538509, 0, 0.9333333, 1, 1,
0.04340356, -1.12995, 2.919738, 0, 0.9294118, 1, 1,
0.04870368, -0.4771959, 3.030466, 0, 0.9215686, 1, 1,
0.04903238, -0.4530053, 1.669254, 0, 0.9176471, 1, 1,
0.05567643, 1.850196, 0.8011101, 0, 0.9098039, 1, 1,
0.05657601, 1.903111, 0.6523161, 0, 0.9058824, 1, 1,
0.0570049, 1.508204, -0.4447716, 0, 0.8980392, 1, 1,
0.05722032, 0.1159825, 1.532536, 0, 0.8901961, 1, 1,
0.0619295, 1.646052, -1.326971, 0, 0.8862745, 1, 1,
0.06416871, 0.2968074, 0.3151412, 0, 0.8784314, 1, 1,
0.06754654, 1.600426, -1.74089, 0, 0.8745098, 1, 1,
0.06831895, -0.563612, 2.404876, 0, 0.8666667, 1, 1,
0.07763707, 0.4831308, 0.05658723, 0, 0.8627451, 1, 1,
0.08503598, 0.05324773, 1.30686, 0, 0.854902, 1, 1,
0.08928341, 0.4411884, -0.1271849, 0, 0.8509804, 1, 1,
0.09109495, -0.4292807, 2.660272, 0, 0.8431373, 1, 1,
0.09147868, 1.019076, -0.3021957, 0, 0.8392157, 1, 1,
0.0931721, -1.136766, 4.39493, 0, 0.8313726, 1, 1,
0.09579426, -1.300112, 2.801859, 0, 0.827451, 1, 1,
0.09656665, 0.5205875, 0.08607382, 0, 0.8196079, 1, 1,
0.09819578, -0.6126506, 4.028438, 0, 0.8156863, 1, 1,
0.1001631, -0.8072274, 1.985445, 0, 0.8078431, 1, 1,
0.1020274, 1.069163, 0.5246418, 0, 0.8039216, 1, 1,
0.1039774, 0.884688, 2.105556, 0, 0.7960784, 1, 1,
0.1064454, -1.268769, 2.012205, 0, 0.7882353, 1, 1,
0.1075473, -1.140501, 3.305745, 0, 0.7843137, 1, 1,
0.1091652, 0.3596653, 1.73488, 0, 0.7764706, 1, 1,
0.1099318, 2.870266, 1.701068, 0, 0.772549, 1, 1,
0.1128609, 0.7045513, -0.028135, 0, 0.7647059, 1, 1,
0.1139571, -0.4521053, 2.032279, 0, 0.7607843, 1, 1,
0.1156233, -1.101046, 3.331367, 0, 0.7529412, 1, 1,
0.1164639, -1.496475, 1.73679, 0, 0.7490196, 1, 1,
0.1194132, -3.037749, 1.931938, 0, 0.7411765, 1, 1,
0.1201794, -0.3619418, 2.417851, 0, 0.7372549, 1, 1,
0.1234577, 0.1213029, 0.4208018, 0, 0.7294118, 1, 1,
0.1234663, -0.9116713, 3.968545, 0, 0.7254902, 1, 1,
0.1246315, -0.4206479, 2.911427, 0, 0.7176471, 1, 1,
0.1262498, 1.45165, 1.08253, 0, 0.7137255, 1, 1,
0.1296739, 0.5279458, 0.2153282, 0, 0.7058824, 1, 1,
0.1312535, 0.01453454, 1.168209, 0, 0.6980392, 1, 1,
0.1316792, -0.9929444, 3.793264, 0, 0.6941177, 1, 1,
0.1330445, -0.2061388, 3.489677, 0, 0.6862745, 1, 1,
0.1345947, 0.4336836, -0.1172386, 0, 0.682353, 1, 1,
0.1435402, 0.4592984, 0.2412826, 0, 0.6745098, 1, 1,
0.1469465, -2.135564, 4.634159, 0, 0.6705883, 1, 1,
0.1495346, 0.0359142, 1.190442, 0, 0.6627451, 1, 1,
0.1531339, 0.3601947, -0.4373362, 0, 0.6588235, 1, 1,
0.1532949, 1.05039, 0.9406663, 0, 0.6509804, 1, 1,
0.1557006, 0.7343619, 0.5606418, 0, 0.6470588, 1, 1,
0.1602196, 1.147426, 0.7717799, 0, 0.6392157, 1, 1,
0.1707787, -0.9825183, 2.186747, 0, 0.6352941, 1, 1,
0.1773613, -1.64725, 4.349791, 0, 0.627451, 1, 1,
0.1776964, 1.227922, -0.2032308, 0, 0.6235294, 1, 1,
0.1807831, -1.248593, 1.386515, 0, 0.6156863, 1, 1,
0.1872407, 0.6074451, 1.224478, 0, 0.6117647, 1, 1,
0.1893496, 0.1077154, 0.4594512, 0, 0.6039216, 1, 1,
0.1894214, -0.9167793, 1.938887, 0, 0.5960785, 1, 1,
0.1906442, -0.4796505, 2.302743, 0, 0.5921569, 1, 1,
0.1923207, 1.640526, 1.566135, 0, 0.5843138, 1, 1,
0.1930727, 0.6224616, 1.126562, 0, 0.5803922, 1, 1,
0.1964296, 0.1657926, 2.269501, 0, 0.572549, 1, 1,
0.1967843, 1.264603, -0.315942, 0, 0.5686275, 1, 1,
0.1980733, 0.7884563, -2.051775, 0, 0.5607843, 1, 1,
0.2027564, 0.5774575, 1.059041, 0, 0.5568628, 1, 1,
0.2029477, 0.6727232, 0.6204708, 0, 0.5490196, 1, 1,
0.2055959, 1.317398, -0.02654986, 0, 0.5450981, 1, 1,
0.2078505, 0.09443466, 0.7571462, 0, 0.5372549, 1, 1,
0.2123094, -0.6362775, 2.701166, 0, 0.5333334, 1, 1,
0.214199, 1.73856, -0.3957463, 0, 0.5254902, 1, 1,
0.2164122, -0.3371153, 3.560608, 0, 0.5215687, 1, 1,
0.2180294, -0.9830991, 3.106921, 0, 0.5137255, 1, 1,
0.2196173, -0.8934071, 1.448424, 0, 0.509804, 1, 1,
0.2239347, 1.567717, -0.05502322, 0, 0.5019608, 1, 1,
0.2252936, 0.6671627, 0.9415851, 0, 0.4941176, 1, 1,
0.2289831, 2.152217, 0.4444937, 0, 0.4901961, 1, 1,
0.229808, 0.02304926, 1.486201, 0, 0.4823529, 1, 1,
0.2315162, 0.4750786, 1.591261, 0, 0.4784314, 1, 1,
0.2340293, 0.4502232, 0.2948264, 0, 0.4705882, 1, 1,
0.2343921, -1.344883, 1.587168, 0, 0.4666667, 1, 1,
0.235857, 0.5544367, 0.407788, 0, 0.4588235, 1, 1,
0.2374863, 1.174035, -0.06439126, 0, 0.454902, 1, 1,
0.2394061, -0.6083044, 3.851373, 0, 0.4470588, 1, 1,
0.2401415, 0.9487483, -0.3999388, 0, 0.4431373, 1, 1,
0.2405184, -0.9993728, 3.431, 0, 0.4352941, 1, 1,
0.2406769, -1.068667, 2.686447, 0, 0.4313726, 1, 1,
0.2434505, -0.09281861, 0.9275863, 0, 0.4235294, 1, 1,
0.2449232, 1.186421, 0.4902681, 0, 0.4196078, 1, 1,
0.2459729, 1.196934, -0.5001281, 0, 0.4117647, 1, 1,
0.2495226, -0.9749027, 1.350869, 0, 0.4078431, 1, 1,
0.2545751, 0.7284489, 2.264128, 0, 0.4, 1, 1,
0.2554116, -0.5802757, 2.730153, 0, 0.3921569, 1, 1,
0.2576368, 0.1493623, 1.612947, 0, 0.3882353, 1, 1,
0.2604761, 0.05242621, 1.740244, 0, 0.3803922, 1, 1,
0.2628961, 1.658284, -1.984864, 0, 0.3764706, 1, 1,
0.2664482, 2.164917, 1.071131, 0, 0.3686275, 1, 1,
0.2695819, 0.05019731, 1.343231, 0, 0.3647059, 1, 1,
0.2795211, -0.3685829, 3.91205, 0, 0.3568628, 1, 1,
0.2827009, 0.2857748, 0.5139301, 0, 0.3529412, 1, 1,
0.2864096, -0.4602938, 0.7236676, 0, 0.345098, 1, 1,
0.2887706, 1.179991, -2.046785, 0, 0.3411765, 1, 1,
0.2890289, -0.5665003, 3.771189, 0, 0.3333333, 1, 1,
0.2991742, 0.973147, 0.9403781, 0, 0.3294118, 1, 1,
0.3013426, 1.243461, 0.4587607, 0, 0.3215686, 1, 1,
0.302479, 1.681841, 0.5926602, 0, 0.3176471, 1, 1,
0.3046397, 1.454848, 1.478469, 0, 0.3098039, 1, 1,
0.3058081, -1.263985, 1.037679, 0, 0.3058824, 1, 1,
0.3062795, -0.2575099, 1.279456, 0, 0.2980392, 1, 1,
0.3091251, -0.1857296, 2.837548, 0, 0.2901961, 1, 1,
0.3092783, -0.36075, 2.434222, 0, 0.2862745, 1, 1,
0.3101426, 0.1490521, 2.486955, 0, 0.2784314, 1, 1,
0.3106936, -0.8027612, 3.703386, 0, 0.2745098, 1, 1,
0.3127618, 0.5291345, -0.7807131, 0, 0.2666667, 1, 1,
0.3129801, -0.3955475, 4.599053, 0, 0.2627451, 1, 1,
0.313271, 0.6740271, 1.754624, 0, 0.254902, 1, 1,
0.3148134, -0.3507297, 0.8844082, 0, 0.2509804, 1, 1,
0.3199769, 1.183981, -1.403172, 0, 0.2431373, 1, 1,
0.3219772, -0.4129879, 2.099993, 0, 0.2392157, 1, 1,
0.3234823, 0.9905168, 2.185941, 0, 0.2313726, 1, 1,
0.3238466, 0.4829039, 0.7648094, 0, 0.227451, 1, 1,
0.3242836, 0.581683, 0.473927, 0, 0.2196078, 1, 1,
0.3247743, -0.6484932, 2.178268, 0, 0.2156863, 1, 1,
0.3264013, 1.981456, 0.3883102, 0, 0.2078431, 1, 1,
0.328883, 0.5039812, 0.7476561, 0, 0.2039216, 1, 1,
0.3318938, 0.4971148, 2.075197, 0, 0.1960784, 1, 1,
0.335164, 0.0333093, 1.870519, 0, 0.1882353, 1, 1,
0.3358875, 0.2163064, 0.2207427, 0, 0.1843137, 1, 1,
0.3380921, 0.5985718, -0.04158419, 0, 0.1764706, 1, 1,
0.3389043, 0.6527296, -0.006098547, 0, 0.172549, 1, 1,
0.3408502, -0.04523134, 1.901071, 0, 0.1647059, 1, 1,
0.3414373, 1.016709, -0.4596173, 0, 0.1607843, 1, 1,
0.3474909, 0.6889771, 0.252064, 0, 0.1529412, 1, 1,
0.3509258, -0.5576648, 3.331138, 0, 0.1490196, 1, 1,
0.352237, 0.9113718, -1.090608, 0, 0.1411765, 1, 1,
0.3628049, 0.4512604, -0.1130498, 0, 0.1372549, 1, 1,
0.3649698, -0.1873628, 0.7969836, 0, 0.1294118, 1, 1,
0.3651376, 1.404626, 0.2242372, 0, 0.1254902, 1, 1,
0.3690944, -0.375356, 2.753782, 0, 0.1176471, 1, 1,
0.3746733, 0.4723358, 0.9260421, 0, 0.1137255, 1, 1,
0.3748498, 0.7014793, 0.7993383, 0, 0.1058824, 1, 1,
0.3793035, 1.061021, -0.350747, 0, 0.09803922, 1, 1,
0.3825782, -0.7214369, 0.9268377, 0, 0.09411765, 1, 1,
0.3827299, 0.5864233, -0.6667566, 0, 0.08627451, 1, 1,
0.3931516, -0.6807639, 1.933815, 0, 0.08235294, 1, 1,
0.4062286, -0.6952136, 2.649923, 0, 0.07450981, 1, 1,
0.4084616, 0.9909927, 1.459787, 0, 0.07058824, 1, 1,
0.4114623, 0.3761584, 0.7044686, 0, 0.0627451, 1, 1,
0.4114635, 0.8543588, 1.299379, 0, 0.05882353, 1, 1,
0.4114991, -0.9120271, 4.176846, 0, 0.05098039, 1, 1,
0.4123673, -0.4142874, 2.458261, 0, 0.04705882, 1, 1,
0.4196785, -0.2838568, 2.317233, 0, 0.03921569, 1, 1,
0.4274173, -0.8012694, 2.375196, 0, 0.03529412, 1, 1,
0.4278708, 0.04462488, 1.372919, 0, 0.02745098, 1, 1,
0.4318102, 1.708826, 0.9676181, 0, 0.02352941, 1, 1,
0.4330156, 1.72795, 1.308501, 0, 0.01568628, 1, 1,
0.4348569, -0.1726639, 1.059633, 0, 0.01176471, 1, 1,
0.4356754, 0.6953616, 1.401621, 0, 0.003921569, 1, 1,
0.4370979, 1.821308, 0.9794862, 0.003921569, 0, 1, 1,
0.4420754, 0.2685739, 0.563395, 0.007843138, 0, 1, 1,
0.4460666, 0.5607731, 0.6336597, 0.01568628, 0, 1, 1,
0.4474472, -0.4251405, 1.688613, 0.01960784, 0, 1, 1,
0.4497235, 0.2644216, 1.454438, 0.02745098, 0, 1, 1,
0.4545874, 0.9553269, -1.295194, 0.03137255, 0, 1, 1,
0.4566442, -1.652535, 2.953536, 0.03921569, 0, 1, 1,
0.4573017, 1.373939, 0.5513468, 0.04313726, 0, 1, 1,
0.4580053, 0.9154868, -0.5626274, 0.05098039, 0, 1, 1,
0.4581089, -0.01481165, 1.26566, 0.05490196, 0, 1, 1,
0.4586173, -0.2040522, 1.276946, 0.0627451, 0, 1, 1,
0.4618391, -0.04448645, 0.6214452, 0.06666667, 0, 1, 1,
0.4629597, 0.6311677, -1.0564, 0.07450981, 0, 1, 1,
0.4644636, 1.730878, 0.2720083, 0.07843138, 0, 1, 1,
0.4668446, 0.2588761, 1.167475, 0.08627451, 0, 1, 1,
0.4670548, -0.8226819, 2.762135, 0.09019608, 0, 1, 1,
0.4676889, -1.733023, 2.832789, 0.09803922, 0, 1, 1,
0.4691606, 1.122329, 0.1715307, 0.1058824, 0, 1, 1,
0.4739088, 1.914871, 0.6967817, 0.1098039, 0, 1, 1,
0.4763841, -0.8482344, 2.513799, 0.1176471, 0, 1, 1,
0.4803596, -0.7335271, 1.834962, 0.1215686, 0, 1, 1,
0.4813434, 2.545143, -1.530765, 0.1294118, 0, 1, 1,
0.4815737, -0.7012302, 2.995566, 0.1333333, 0, 1, 1,
0.4828565, -1.053226, 2.776104, 0.1411765, 0, 1, 1,
0.4841098, -0.459186, 2.673555, 0.145098, 0, 1, 1,
0.491228, -0.4551503, 1.473977, 0.1529412, 0, 1, 1,
0.4915969, 0.7212967, 0.7510734, 0.1568628, 0, 1, 1,
0.4921924, -2.343413, 2.73146, 0.1647059, 0, 1, 1,
0.4925008, 0.1167984, 1.86934, 0.1686275, 0, 1, 1,
0.4931115, -0.5956115, 3.064327, 0.1764706, 0, 1, 1,
0.4944921, 0.07545441, 0.2335188, 0.1803922, 0, 1, 1,
0.4956003, 0.05767303, 2.92627, 0.1882353, 0, 1, 1,
0.4957873, 1.669897, 0.7507939, 0.1921569, 0, 1, 1,
0.4963611, 1.065502, 1.544054, 0.2, 0, 1, 1,
0.5015126, -1.781034, 3.006175, 0.2078431, 0, 1, 1,
0.5067326, -1.399581, 3.748519, 0.2117647, 0, 1, 1,
0.5153043, -1.075946, 4.445206, 0.2196078, 0, 1, 1,
0.5172026, -0.2793168, 1.336236, 0.2235294, 0, 1, 1,
0.520222, 0.8225859, 0.7102684, 0.2313726, 0, 1, 1,
0.5242987, 0.4481093, 1.39766, 0.2352941, 0, 1, 1,
0.5253058, -0.07500611, 1.377504, 0.2431373, 0, 1, 1,
0.5262769, -0.3943174, 4.494984, 0.2470588, 0, 1, 1,
0.5272042, 1.251796, -0.1073032, 0.254902, 0, 1, 1,
0.5294917, 0.1638465, 1.858153, 0.2588235, 0, 1, 1,
0.5298019, -0.2396043, 2.907721, 0.2666667, 0, 1, 1,
0.5303885, 0.6436649, -0.2552763, 0.2705882, 0, 1, 1,
0.5311365, -0.3338328, 0.9050941, 0.2784314, 0, 1, 1,
0.5324883, 0.3634835, -0.3674744, 0.282353, 0, 1, 1,
0.5342697, 1.069341, 0.5719475, 0.2901961, 0, 1, 1,
0.5349394, 0.001560326, -0.2709811, 0.2941177, 0, 1, 1,
0.5362724, 0.4835684, 0.2583852, 0.3019608, 0, 1, 1,
0.5411693, 0.5960273, -1.125362, 0.3098039, 0, 1, 1,
0.5452991, 1.295709, -0.9183171, 0.3137255, 0, 1, 1,
0.5486905, 0.08689624, 1.290301, 0.3215686, 0, 1, 1,
0.5489239, -1.846681, 3.065749, 0.3254902, 0, 1, 1,
0.5533437, 0.785228, -0.3087244, 0.3333333, 0, 1, 1,
0.5592091, 1.448912, 0.1575833, 0.3372549, 0, 1, 1,
0.5614479, -0.3821488, 1.461978, 0.345098, 0, 1, 1,
0.5617337, -1.745663, 4.454459, 0.3490196, 0, 1, 1,
0.565365, 1.194321, 0.2463306, 0.3568628, 0, 1, 1,
0.5670558, -1.883627, 2.894995, 0.3607843, 0, 1, 1,
0.5694678, 1.064248, 1.025379, 0.3686275, 0, 1, 1,
0.5701815, -1.736095, 2.947873, 0.372549, 0, 1, 1,
0.573054, 1.783219, -1.009112, 0.3803922, 0, 1, 1,
0.5775387, -0.1856521, 1.229517, 0.3843137, 0, 1, 1,
0.583793, -1.046705, 1.459782, 0.3921569, 0, 1, 1,
0.5871134, 2.358571, 1.587675, 0.3960784, 0, 1, 1,
0.5875372, -1.06146, 3.590692, 0.4039216, 0, 1, 1,
0.5939457, 0.4457742, 0.3201978, 0.4117647, 0, 1, 1,
0.5958058, -0.3111011, 3.229416, 0.4156863, 0, 1, 1,
0.6052383, -0.9969759, 2.078573, 0.4235294, 0, 1, 1,
0.6103139, -1.017972, 1.715954, 0.427451, 0, 1, 1,
0.6104248, -0.7443492, 3.088988, 0.4352941, 0, 1, 1,
0.6151676, -0.1661873, 3.179751, 0.4392157, 0, 1, 1,
0.6154642, 1.34071, 0.304473, 0.4470588, 0, 1, 1,
0.6197297, 1.214752, -1.153662, 0.4509804, 0, 1, 1,
0.6245764, 0.5249408, 0.6898649, 0.4588235, 0, 1, 1,
0.6275685, -2.258628, 3.4237, 0.4627451, 0, 1, 1,
0.6295269, -0.946188, 3.147411, 0.4705882, 0, 1, 1,
0.6297109, -0.8893152, 3.609016, 0.4745098, 0, 1, 1,
0.6326922, 0.8926001, -0.3234276, 0.4823529, 0, 1, 1,
0.6398377, -0.02272584, 1.415488, 0.4862745, 0, 1, 1,
0.6404513, -1.473363, 1.541768, 0.4941176, 0, 1, 1,
0.6416404, 1.968779, 1.654764, 0.5019608, 0, 1, 1,
0.6434203, 0.3412532, 1.093783, 0.5058824, 0, 1, 1,
0.6454811, 0.4146433, 2.276754, 0.5137255, 0, 1, 1,
0.6473778, 0.05627104, 2.543193, 0.5176471, 0, 1, 1,
0.6502324, 0.7361124, 0.8338301, 0.5254902, 0, 1, 1,
0.6507775, -0.1452625, 1.556734, 0.5294118, 0, 1, 1,
0.6510322, 0.5337921, 0.009568927, 0.5372549, 0, 1, 1,
0.6527214, -0.07074306, 2.207954, 0.5411765, 0, 1, 1,
0.6527746, 0.2971372, 1.682688, 0.5490196, 0, 1, 1,
0.6579317, 2.743734, -1.7152, 0.5529412, 0, 1, 1,
0.6598092, 0.9752491, 1.582798, 0.5607843, 0, 1, 1,
0.6604814, -0.277537, 1.926164, 0.5647059, 0, 1, 1,
0.6637201, -0.9391038, 2.361717, 0.572549, 0, 1, 1,
0.6709752, -0.001113459, 3.018952, 0.5764706, 0, 1, 1,
0.6726646, -0.8919992, 2.260527, 0.5843138, 0, 1, 1,
0.67374, 1.433536, 2.671038, 0.5882353, 0, 1, 1,
0.6740152, -1.200613, 3.637623, 0.5960785, 0, 1, 1,
0.6749365, -0.2029565, 1.24793, 0.6039216, 0, 1, 1,
0.6842198, -1.872318, 1.333806, 0.6078432, 0, 1, 1,
0.6852245, -0.321725, 1.556872, 0.6156863, 0, 1, 1,
0.6899855, 0.1907296, 0.3568072, 0.6196079, 0, 1, 1,
0.6900487, 1.463938, 0.5688495, 0.627451, 0, 1, 1,
0.706118, -0.8044795, 1.394744, 0.6313726, 0, 1, 1,
0.7067254, 1.248882, -0.3394805, 0.6392157, 0, 1, 1,
0.7109216, 0.5609702, 1.472297, 0.6431373, 0, 1, 1,
0.7167718, 0.7754784, 0.08363795, 0.6509804, 0, 1, 1,
0.7197995, 0.6806205, -0.2690412, 0.654902, 0, 1, 1,
0.7232037, -1.272278, 1.3975, 0.6627451, 0, 1, 1,
0.7552879, 1.659938, 0.4378072, 0.6666667, 0, 1, 1,
0.7600577, -0.8714926, 2.121249, 0.6745098, 0, 1, 1,
0.7607239, 0.7565497, 0.4282597, 0.6784314, 0, 1, 1,
0.7610068, 0.150149, 1.362929, 0.6862745, 0, 1, 1,
0.7656875, -0.2915174, 0.6756802, 0.6901961, 0, 1, 1,
0.7720925, -0.05319523, 1.861868, 0.6980392, 0, 1, 1,
0.775413, 1.226515, 1.449476, 0.7058824, 0, 1, 1,
0.7766529, -1.252136, 2.135564, 0.7098039, 0, 1, 1,
0.7795408, 0.4040386, 0.8040985, 0.7176471, 0, 1, 1,
0.7809308, 0.8132731, 2.14632, 0.7215686, 0, 1, 1,
0.7892775, -0.2106588, 2.231057, 0.7294118, 0, 1, 1,
0.7905201, -0.5498118, 0.7019008, 0.7333333, 0, 1, 1,
0.7958072, 0.5972461, -0.3751303, 0.7411765, 0, 1, 1,
0.798983, -1.323344, 2.742818, 0.7450981, 0, 1, 1,
0.8023837, 0.2938477, 1.837457, 0.7529412, 0, 1, 1,
0.8060451, 2.582587, -0.3945867, 0.7568628, 0, 1, 1,
0.8151113, -0.7887231, 2.985994, 0.7647059, 0, 1, 1,
0.8173392, -0.03868068, 1.726959, 0.7686275, 0, 1, 1,
0.8177534, -0.07758088, 2.641761, 0.7764706, 0, 1, 1,
0.8188527, -0.4943741, 1.177647, 0.7803922, 0, 1, 1,
0.8266883, -0.4574508, 1.180257, 0.7882353, 0, 1, 1,
0.8285359, -0.01912485, 2.500436, 0.7921569, 0, 1, 1,
0.8379008, 1.356868, 2.504627, 0.8, 0, 1, 1,
0.8390619, -0.06845601, 1.19156, 0.8078431, 0, 1, 1,
0.8392813, -0.6280017, 2.498625, 0.8117647, 0, 1, 1,
0.8428648, -3.35779, 4.331234, 0.8196079, 0, 1, 1,
0.850485, 0.9117357, 2.186687, 0.8235294, 0, 1, 1,
0.8506326, 0.6899949, 3.214444, 0.8313726, 0, 1, 1,
0.8506567, 0.3059955, 0.4800939, 0.8352941, 0, 1, 1,
0.8633884, -0.2858804, 1.86438, 0.8431373, 0, 1, 1,
0.8640656, -0.5641648, 2.352837, 0.8470588, 0, 1, 1,
0.8712435, -0.223303, 1.121088, 0.854902, 0, 1, 1,
0.8748919, 0.6859148, 0.235553, 0.8588235, 0, 1, 1,
0.8768304, 1.549853, 1.757426, 0.8666667, 0, 1, 1,
0.879209, 1.261868, -0.708685, 0.8705882, 0, 1, 1,
0.8794776, 1.015249, 0.175781, 0.8784314, 0, 1, 1,
0.880645, 0.8251115, 1.031502, 0.8823529, 0, 1, 1,
0.8831252, 0.7812818, 0.9537102, 0.8901961, 0, 1, 1,
0.8877043, -1.250113, 1.283835, 0.8941177, 0, 1, 1,
0.8877321, -1.180349, 1.747733, 0.9019608, 0, 1, 1,
0.890662, 0.4083964, 0.9646227, 0.9098039, 0, 1, 1,
0.9038849, -0.4449347, 1.12633, 0.9137255, 0, 1, 1,
0.9094992, -0.7764294, 2.303082, 0.9215686, 0, 1, 1,
0.9100323, -1.285343, 2.948307, 0.9254902, 0, 1, 1,
0.9103245, 0.4453367, 1.939656, 0.9333333, 0, 1, 1,
0.9146796, -0.5951441, 0.7274147, 0.9372549, 0, 1, 1,
0.9150836, -0.542289, 2.495328, 0.945098, 0, 1, 1,
0.9228117, 0.6190664, 0.2088621, 0.9490196, 0, 1, 1,
0.9228259, -0.4485497, 4.018037, 0.9568627, 0, 1, 1,
0.9293652, 0.1980674, 2.185641, 0.9607843, 0, 1, 1,
0.9310413, -0.8399468, 2.233699, 0.9686275, 0, 1, 1,
0.9325073, 0.887946, 0.2886058, 0.972549, 0, 1, 1,
0.9335598, 0.4556501, 1.848773, 0.9803922, 0, 1, 1,
0.9379054, 0.9082166, 0.6569422, 0.9843137, 0, 1, 1,
0.9388867, 0.9846493, 2.95389, 0.9921569, 0, 1, 1,
0.9399102, 1.230348, -0.3022316, 0.9960784, 0, 1, 1,
0.9410441, -2.077303, 3.036516, 1, 0, 0.9960784, 1,
0.9460033, 0.0366159, 0.7050313, 1, 0, 0.9882353, 1,
0.9506059, -0.267644, -0.3000704, 1, 0, 0.9843137, 1,
0.9570804, 0.187201, 1.991382, 1, 0, 0.9764706, 1,
0.9586068, -0.6531584, 3.112667, 1, 0, 0.972549, 1,
0.9694927, -1.110903, 2.731574, 1, 0, 0.9647059, 1,
0.9702477, -1.711119, 2.156381, 1, 0, 0.9607843, 1,
0.9724786, 2.22447, 0.8621392, 1, 0, 0.9529412, 1,
0.9768491, 0.2642481, 1.528573, 1, 0, 0.9490196, 1,
0.9769148, -0.7405547, 1.989121, 1, 0, 0.9411765, 1,
0.9866039, 1.869663, 0.1359124, 1, 0, 0.9372549, 1,
0.9881548, -0.5743788, 2.208165, 1, 0, 0.9294118, 1,
0.9941453, -1.144438, 2.524072, 1, 0, 0.9254902, 1,
0.9985459, -1.241804, 3.072916, 1, 0, 0.9176471, 1,
1.003484, 0.4519413, 1.181087, 1, 0, 0.9137255, 1,
1.003853, 0.2595187, 3.202348, 1, 0, 0.9058824, 1,
1.008301, 0.3718406, 1.596866, 1, 0, 0.9019608, 1,
1.009172, -1.849747, 1.543161, 1, 0, 0.8941177, 1,
1.016203, 0.04905804, 2.661868, 1, 0, 0.8862745, 1,
1.016221, 0.2494993, 1.204657, 1, 0, 0.8823529, 1,
1.017382, -1.365297, 3.239094, 1, 0, 0.8745098, 1,
1.018701, 0.9271258, 1.105868, 1, 0, 0.8705882, 1,
1.020654, 0.4923259, 2.036019, 1, 0, 0.8627451, 1,
1.022949, -0.8676656, 2.619046, 1, 0, 0.8588235, 1,
1.025308, -2.126832, 2.157053, 1, 0, 0.8509804, 1,
1.029026, 2.111138, 1.049692, 1, 0, 0.8470588, 1,
1.036579, -1.052912, 0.4829413, 1, 0, 0.8392157, 1,
1.040777, 0.4868717, 0.187923, 1, 0, 0.8352941, 1,
1.040987, -0.6916933, 1.708904, 1, 0, 0.827451, 1,
1.043418, 1.409562, 0.4682375, 1, 0, 0.8235294, 1,
1.045535, 1.356726, 0.6058196, 1, 0, 0.8156863, 1,
1.046053, 0.9857212, 1.908011, 1, 0, 0.8117647, 1,
1.050115, -1.043276, 2.573768, 1, 0, 0.8039216, 1,
1.054425, -1.450985, 1.40968, 1, 0, 0.7960784, 1,
1.062242, -0.4324246, 0.8144267, 1, 0, 0.7921569, 1,
1.064887, 1.289925, 2.423235, 1, 0, 0.7843137, 1,
1.071407, -0.05152206, 2.033589, 1, 0, 0.7803922, 1,
1.072714, 2.325533, -0.7911757, 1, 0, 0.772549, 1,
1.075867, 1.07271, 0.9010437, 1, 0, 0.7686275, 1,
1.080539, -0.4020448, 2.916009, 1, 0, 0.7607843, 1,
1.086311, -1.011094, 3.472476, 1, 0, 0.7568628, 1,
1.09473, 0.003875094, 1.9166, 1, 0, 0.7490196, 1,
1.09545, 1.161607, -0.7590689, 1, 0, 0.7450981, 1,
1.098886, 0.3920256, 1.544631, 1, 0, 0.7372549, 1,
1.103613, 0.4459936, 0.4463285, 1, 0, 0.7333333, 1,
1.108311, 1.207813, 0.1918937, 1, 0, 0.7254902, 1,
1.118033, -0.9211251, 3.008911, 1, 0, 0.7215686, 1,
1.139562, -0.03902285, 1.291177, 1, 0, 0.7137255, 1,
1.148914, -0.1496671, 1.78111, 1, 0, 0.7098039, 1,
1.153557, -0.02341309, 2.883939, 1, 0, 0.7019608, 1,
1.154594, 0.295279, 1.882972, 1, 0, 0.6941177, 1,
1.16185, 1.56945, 0.6001988, 1, 0, 0.6901961, 1,
1.173612, -0.8395029, 1.695485, 1, 0, 0.682353, 1,
1.181028, -0.2724915, 1.990726, 1, 0, 0.6784314, 1,
1.185023, 0.2857487, 2.126375, 1, 0, 0.6705883, 1,
1.198257, 0.2455093, -0.3149979, 1, 0, 0.6666667, 1,
1.199228, 2.046434, 2.796238, 1, 0, 0.6588235, 1,
1.200057, -0.8870435, 2.589527, 1, 0, 0.654902, 1,
1.210771, 1.082398, -1.034321, 1, 0, 0.6470588, 1,
1.220008, 0.3799911, -1.27651, 1, 0, 0.6431373, 1,
1.231281, -1.2839, 0.4048524, 1, 0, 0.6352941, 1,
1.235989, -0.7172022, 1.314583, 1, 0, 0.6313726, 1,
1.237571, -1.026413, 2.587151, 1, 0, 0.6235294, 1,
1.238028, -1.076886, 2.974657, 1, 0, 0.6196079, 1,
1.253837, -1.774583, 3.262552, 1, 0, 0.6117647, 1,
1.25444, -2.03268, 1.533969, 1, 0, 0.6078432, 1,
1.254457, 0.3452358, 2.25594, 1, 0, 0.6, 1,
1.258897, -0.8889852, 1.41324, 1, 0, 0.5921569, 1,
1.259203, -0.2172453, 2.834537, 1, 0, 0.5882353, 1,
1.26562, -1.058526, 0.6765609, 1, 0, 0.5803922, 1,
1.266772, 0.1032425, 1.921629, 1, 0, 0.5764706, 1,
1.276161, 0.7568438, 0.8830377, 1, 0, 0.5686275, 1,
1.279861, -1.221694, 2.376032, 1, 0, 0.5647059, 1,
1.284815, -0.8423507, 1.3934, 1, 0, 0.5568628, 1,
1.288197, 0.4796004, 0.5328113, 1, 0, 0.5529412, 1,
1.29038, 0.670818, 0.3151703, 1, 0, 0.5450981, 1,
1.303592, 0.4713345, 0.1141267, 1, 0, 0.5411765, 1,
1.307933, 1.623777, 0.5288537, 1, 0, 0.5333334, 1,
1.329496, -1.160608, 3.750406, 1, 0, 0.5294118, 1,
1.344523, -1.49509, 2.30911, 1, 0, 0.5215687, 1,
1.376181, -0.0803849, 1.573012, 1, 0, 0.5176471, 1,
1.392258, 1.976709, 1.860328, 1, 0, 0.509804, 1,
1.406309, 1.464741, -0.2764691, 1, 0, 0.5058824, 1,
1.420412, 1.069804, 1.374185, 1, 0, 0.4980392, 1,
1.423559, -0.6315143, 2.43035, 1, 0, 0.4901961, 1,
1.424072, -0.1223087, 0.6608464, 1, 0, 0.4862745, 1,
1.432586, -0.3290035, 3.771198, 1, 0, 0.4784314, 1,
1.437149, 0.2272319, 0.8513293, 1, 0, 0.4745098, 1,
1.438437, 0.04581697, 2.812724, 1, 0, 0.4666667, 1,
1.445374, -1.197508, 2.051775, 1, 0, 0.4627451, 1,
1.446037, -0.1467918, 1.631757, 1, 0, 0.454902, 1,
1.446084, -0.488223, 2.862352, 1, 0, 0.4509804, 1,
1.446469, 0.7858804, 2.001361, 1, 0, 0.4431373, 1,
1.455211, -0.6048288, 0.7644221, 1, 0, 0.4392157, 1,
1.462923, 0.2413998, 1.587919, 1, 0, 0.4313726, 1,
1.466494, -0.272222, 1.909472, 1, 0, 0.427451, 1,
1.46676, 0.7472046, 1.964347, 1, 0, 0.4196078, 1,
1.468178, 0.5831165, 0.4541728, 1, 0, 0.4156863, 1,
1.472666, -0.09898955, 1.448176, 1, 0, 0.4078431, 1,
1.477074, -0.5516573, 2.500834, 1, 0, 0.4039216, 1,
1.499245, -0.7839132, 2.104217, 1, 0, 0.3960784, 1,
1.501425, 1.014977, 1.403023, 1, 0, 0.3882353, 1,
1.513871, 0.1867145, -0.04510577, 1, 0, 0.3843137, 1,
1.542313, -1.401718, 3.695035, 1, 0, 0.3764706, 1,
1.543474, 0.02614221, 0.9254212, 1, 0, 0.372549, 1,
1.562338, 0.02395145, 2.830963, 1, 0, 0.3647059, 1,
1.563302, -0.08352559, 0.0988377, 1, 0, 0.3607843, 1,
1.576801, -0.8924026, 2.416988, 1, 0, 0.3529412, 1,
1.583763, 0.498999, 1.24352, 1, 0, 0.3490196, 1,
1.587613, -0.646543, 3.320309, 1, 0, 0.3411765, 1,
1.589265, -0.2635867, 2.229727, 1, 0, 0.3372549, 1,
1.643376, 1.065697, 2.347001, 1, 0, 0.3294118, 1,
1.657832, 1.000646, -0.07437927, 1, 0, 0.3254902, 1,
1.658046, 0.0784363, -0.1039112, 1, 0, 0.3176471, 1,
1.662863, 0.2822431, 2.368363, 1, 0, 0.3137255, 1,
1.66898, 0.4683846, 2.459918, 1, 0, 0.3058824, 1,
1.6717, -0.5122032, 1.827673, 1, 0, 0.2980392, 1,
1.672207, -1.285846, 2.307187, 1, 0, 0.2941177, 1,
1.684272, 0.03912149, -0.6578127, 1, 0, 0.2862745, 1,
1.717558, 0.7095011, 0.7353446, 1, 0, 0.282353, 1,
1.734309, -0.09076568, 0.2569036, 1, 0, 0.2745098, 1,
1.735258, -0.7579176, 1.501112, 1, 0, 0.2705882, 1,
1.757661, -1.009502, 1.583095, 1, 0, 0.2627451, 1,
1.769366, -0.2570325, 1.91722, 1, 0, 0.2588235, 1,
1.783709, -2.094779, 2.199736, 1, 0, 0.2509804, 1,
1.784438, -1.342966, 2.011203, 1, 0, 0.2470588, 1,
1.790267, -0.08567671, 3.842854, 1, 0, 0.2392157, 1,
1.798454, -1.002011, 2.541475, 1, 0, 0.2352941, 1,
1.802265, -0.009955537, 1.094312, 1, 0, 0.227451, 1,
1.802604, -1.442673, 3.264213, 1, 0, 0.2235294, 1,
1.807499, -0.3008446, 1.113224, 1, 0, 0.2156863, 1,
1.813135, -0.7031629, 1.156013, 1, 0, 0.2117647, 1,
1.821026, 0.641491, 0.3252853, 1, 0, 0.2039216, 1,
1.827768, 1.098126, -0.2179562, 1, 0, 0.1960784, 1,
1.860527, -0.8117791, 1.167644, 1, 0, 0.1921569, 1,
1.883694, 1.188663, 1.914153, 1, 0, 0.1843137, 1,
1.900439, -0.4351853, 1.550913, 1, 0, 0.1803922, 1,
1.93667, 1.956406, -0.3767361, 1, 0, 0.172549, 1,
1.965482, -1.033106, 2.425362, 1, 0, 0.1686275, 1,
1.979362, -0.2802878, -0.120956, 1, 0, 0.1607843, 1,
1.989754, -0.8354473, 2.882424, 1, 0, 0.1568628, 1,
2.007303, -0.2368531, 0.4737835, 1, 0, 0.1490196, 1,
2.009356, 0.4388745, -0.244437, 1, 0, 0.145098, 1,
2.024269, 0.9227539, 2.040827, 1, 0, 0.1372549, 1,
2.036497, -1.282669, 0.8848605, 1, 0, 0.1333333, 1,
2.071756, -0.2745806, -0.3427746, 1, 0, 0.1254902, 1,
2.096237, 0.7488751, 0.7967977, 1, 0, 0.1215686, 1,
2.110746, -0.006695792, 0.4218484, 1, 0, 0.1137255, 1,
2.114769, 0.6320873, 1.842062, 1, 0, 0.1098039, 1,
2.133134, 0.7537181, 2.683327, 1, 0, 0.1019608, 1,
2.178638, 1.606383, 2.265514, 1, 0, 0.09411765, 1,
2.204026, 0.004145323, 2.086165, 1, 0, 0.09019608, 1,
2.247499, 0.1788778, -0.01379374, 1, 0, 0.08235294, 1,
2.253626, -0.7925793, 2.254642, 1, 0, 0.07843138, 1,
2.305437, 1.5324, 0.4321015, 1, 0, 0.07058824, 1,
2.318766, -0.2325379, 1.539505, 1, 0, 0.06666667, 1,
2.381821, 0.2216447, 0.8602964, 1, 0, 0.05882353, 1,
2.55869, -1.332728, 1.857415, 1, 0, 0.05490196, 1,
2.565963, -1.008871, 0.9320498, 1, 0, 0.04705882, 1,
2.622755, 1.181153, 1.467641, 1, 0, 0.04313726, 1,
2.649313, -1.219053, 1.677255, 1, 0, 0.03529412, 1,
2.671811, 0.3622656, 0.7254618, 1, 0, 0.03137255, 1,
2.692124, 0.7954514, 2.158587, 1, 0, 0.02352941, 1,
2.754857, -1.214526, 0.5997007, 1, 0, 0.01960784, 1,
2.90726, -0.2968775, 2.375429, 1, 0, 0.01176471, 1,
3.263829, -1.013273, 0.8668247, 1, 0, 0.007843138, 1
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
-0.05386972, -4.413445, -7.038264, 0, -0.5, 0.5, 0.5,
-0.05386972, -4.413445, -7.038264, 1, -0.5, 0.5, 0.5,
-0.05386972, -4.413445, -7.038264, 1, 1.5, 0.5, 0.5,
-0.05386972, -4.413445, -7.038264, 0, 1.5, 0.5, 0.5
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
-4.496268, -0.2437619, -7.038264, 0, -0.5, 0.5, 0.5,
-4.496268, -0.2437619, -7.038264, 1, -0.5, 0.5, 0.5,
-4.496268, -0.2437619, -7.038264, 1, 1.5, 0.5, 0.5,
-4.496268, -0.2437619, -7.038264, 0, 1.5, 0.5, 0.5
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
-4.496268, -4.413445, -0.356189, 0, -0.5, 0.5, 0.5,
-4.496268, -4.413445, -0.356189, 1, -0.5, 0.5, 0.5,
-4.496268, -4.413445, -0.356189, 1, 1.5, 0.5, 0.5,
-4.496268, -4.413445, -0.356189, 0, 1.5, 0.5, 0.5
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
-3, -3.45121, -5.496247,
3, -3.45121, -5.496247,
-3, -3.45121, -5.496247,
-3, -3.611583, -5.75325,
-2, -3.45121, -5.496247,
-2, -3.611583, -5.75325,
-1, -3.45121, -5.496247,
-1, -3.611583, -5.75325,
0, -3.45121, -5.496247,
0, -3.611583, -5.75325,
1, -3.45121, -5.496247,
1, -3.611583, -5.75325,
2, -3.45121, -5.496247,
2, -3.611583, -5.75325,
3, -3.45121, -5.496247,
3, -3.611583, -5.75325
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
-3, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
-3, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
-3, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
-3, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
-2, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
-2, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
-2, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
-2, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
-1, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
-1, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
-1, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
-1, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
0, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
0, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
0, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
0, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
1, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
1, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
1, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
1, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
2, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
2, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
2, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
2, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5,
3, -3.932328, -6.267256, 0, -0.5, 0.5, 0.5,
3, -3.932328, -6.267256, 1, -0.5, 0.5, 0.5,
3, -3.932328, -6.267256, 1, 1.5, 0.5, 0.5,
3, -3.932328, -6.267256, 0, 1.5, 0.5, 0.5
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
-3.471099, -3, -5.496247,
-3.471099, 2, -5.496247,
-3.471099, -3, -5.496247,
-3.64196, -3, -5.75325,
-3.471099, -2, -5.496247,
-3.64196, -2, -5.75325,
-3.471099, -1, -5.496247,
-3.64196, -1, -5.75325,
-3.471099, 0, -5.496247,
-3.64196, 0, -5.75325,
-3.471099, 1, -5.496247,
-3.64196, 1, -5.75325,
-3.471099, 2, -5.496247,
-3.64196, 2, -5.75325
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
-3.983683, -3, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, -3, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, -3, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, -3, -6.267256, 0, 1.5, 0.5, 0.5,
-3.983683, -2, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, -2, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, -2, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, -2, -6.267256, 0, 1.5, 0.5, 0.5,
-3.983683, -1, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, -1, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, -1, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, -1, -6.267256, 0, 1.5, 0.5, 0.5,
-3.983683, 0, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, 0, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, 0, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, 0, -6.267256, 0, 1.5, 0.5, 0.5,
-3.983683, 1, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, 1, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, 1, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, 1, -6.267256, 0, 1.5, 0.5, 0.5,
-3.983683, 2, -6.267256, 0, -0.5, 0.5, 0.5,
-3.983683, 2, -6.267256, 1, -0.5, 0.5, 0.5,
-3.983683, 2, -6.267256, 1, 1.5, 0.5, 0.5,
-3.983683, 2, -6.267256, 0, 1.5, 0.5, 0.5
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
-3.471099, -3.45121, -4,
-3.471099, -3.45121, 4,
-3.471099, -3.45121, -4,
-3.64196, -3.611583, -4,
-3.471099, -3.45121, -2,
-3.64196, -3.611583, -2,
-3.471099, -3.45121, 0,
-3.64196, -3.611583, 0,
-3.471099, -3.45121, 2,
-3.64196, -3.611583, 2,
-3.471099, -3.45121, 4,
-3.64196, -3.611583, 4
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
-3.983683, -3.932328, -4, 0, -0.5, 0.5, 0.5,
-3.983683, -3.932328, -4, 1, -0.5, 0.5, 0.5,
-3.983683, -3.932328, -4, 1, 1.5, 0.5, 0.5,
-3.983683, -3.932328, -4, 0, 1.5, 0.5, 0.5,
-3.983683, -3.932328, -2, 0, -0.5, 0.5, 0.5,
-3.983683, -3.932328, -2, 1, -0.5, 0.5, 0.5,
-3.983683, -3.932328, -2, 1, 1.5, 0.5, 0.5,
-3.983683, -3.932328, -2, 0, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 0, 0, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 0, 1, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 0, 1, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 0, 0, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 2, 0, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 2, 1, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 2, 1, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 2, 0, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 4, 0, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 4, 1, -0.5, 0.5, 0.5,
-3.983683, -3.932328, 4, 1, 1.5, 0.5, 0.5,
-3.983683, -3.932328, 4, 0, 1.5, 0.5, 0.5
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
-3.471099, -3.45121, -5.496247,
-3.471099, 2.963686, -5.496247,
-3.471099, -3.45121, 4.783869,
-3.471099, 2.963686, 4.783869,
-3.471099, -3.45121, -5.496247,
-3.471099, -3.45121, 4.783869,
-3.471099, 2.963686, -5.496247,
-3.471099, 2.963686, 4.783869,
-3.471099, -3.45121, -5.496247,
3.363359, -3.45121, -5.496247,
-3.471099, -3.45121, 4.783869,
3.363359, -3.45121, 4.783869,
-3.471099, 2.963686, -5.496247,
3.363359, 2.963686, -5.496247,
-3.471099, 2.963686, 4.783869,
3.363359, 2.963686, 4.783869,
3.363359, -3.45121, -5.496247,
3.363359, 2.963686, -5.496247,
3.363359, -3.45121, 4.783869,
3.363359, 2.963686, 4.783869,
3.363359, -3.45121, -5.496247,
3.363359, -3.45121, 4.783869,
3.363359, 2.963686, -5.496247,
3.363359, 2.963686, 4.783869
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
var radius = 7.428695;
var distance = 33.0511;
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
mvMatrix.translate( 0.05386972, 0.2437619, 0.356189 );
mvMatrix.scale( 1.175229, 1.252093, 0.7813191 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.0511);
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
fenpropimorph<-read.table("fenpropimorph.xyz")
```

```
## Error in read.table("fenpropimorph.xyz"): no lines available in input
```

```r
x<-fenpropimorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
```

```r
y<-fenpropimorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
```

```r
z<-fenpropimorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropimorph' not found
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
-3.371568, -1.536838, -0.899574, 0, 0, 1, 1, 1,
-2.791152, 1.218848, 0.2442036, 1, 0, 0, 1, 1,
-2.78271, 0.3923778, -1.71129, 1, 0, 0, 1, 1,
-2.777833, -0.2868198, -2.545756, 1, 0, 0, 1, 1,
-2.716264, 0.06967916, -1.571403, 1, 0, 0, 1, 1,
-2.580913, -2.187933, -1.351041, 1, 0, 0, 1, 1,
-2.384629, 0.195368, -0.1626397, 0, 0, 0, 1, 1,
-2.358931, -2.095924, -2.074691, 0, 0, 0, 1, 1,
-2.349279, 0.1974946, -4.554798, 0, 0, 0, 1, 1,
-2.322028, 0.8473412, -0.1566119, 0, 0, 0, 1, 1,
-2.274806, -0.9389516, -2.122579, 0, 0, 0, 1, 1,
-2.265157, -0.04943199, -1.231953, 0, 0, 0, 1, 1,
-2.207833, -2.163267, -0.2437595, 0, 0, 0, 1, 1,
-2.202761, 1.7547, -1.24516, 1, 1, 1, 1, 1,
-2.183277, -1.643669, -2.132884, 1, 1, 1, 1, 1,
-2.170231, -0.5182867, -2.765665, 1, 1, 1, 1, 1,
-2.163327, -1.201451, -2.331363, 1, 1, 1, 1, 1,
-2.069927, -0.8859168, -1.935578, 1, 1, 1, 1, 1,
-2.028408, -0.7913917, -2.590713, 1, 1, 1, 1, 1,
-2.013214, -0.7294652, -2.575239, 1, 1, 1, 1, 1,
-2.004695, -0.9104765, -2.406975, 1, 1, 1, 1, 1,
-2.00388, 1.064227, -3.652006, 1, 1, 1, 1, 1,
-1.960363, -0.5340223, -0.34214, 1, 1, 1, 1, 1,
-1.949998, 0.2276781, -2.390001, 1, 1, 1, 1, 1,
-1.930963, 0.5419821, -0.1884568, 1, 1, 1, 1, 1,
-1.920154, -0.3407015, -2.260114, 1, 1, 1, 1, 1,
-1.906977, -0.6270398, -1.116851, 1, 1, 1, 1, 1,
-1.8978, 0.08228842, -0.9246404, 1, 1, 1, 1, 1,
-1.88446, 0.1536845, -1.763553, 0, 0, 1, 1, 1,
-1.867016, 0.663415, -0.581222, 1, 0, 0, 1, 1,
-1.850182, -0.8452963, -3.686088, 1, 0, 0, 1, 1,
-1.843549, -0.06216354, -1.132506, 1, 0, 0, 1, 1,
-1.839071, -0.7721834, -2.136326, 1, 0, 0, 1, 1,
-1.837245, 0.02706094, -0.3998875, 1, 0, 0, 1, 1,
-1.832568, 0.3621797, -2.747364, 0, 0, 0, 1, 1,
-1.830529, -0.4057272, -2.570512, 0, 0, 0, 1, 1,
-1.826602, 0.5902834, -1.074763, 0, 0, 0, 1, 1,
-1.794384, -1.159639, -2.342765, 0, 0, 0, 1, 1,
-1.791396, -0.04733227, -0.8835659, 0, 0, 0, 1, 1,
-1.772293, -0.9485387, -3.430218, 0, 0, 0, 1, 1,
-1.765071, -0.8571386, -0.4171707, 0, 0, 0, 1, 1,
-1.757026, 0.4289622, -2.757862, 1, 1, 1, 1, 1,
-1.756949, 0.2641161, -2.411315, 1, 1, 1, 1, 1,
-1.729132, -0.6241142, -1.011322, 1, 1, 1, 1, 1,
-1.726536, 2.035706, -0.2468514, 1, 1, 1, 1, 1,
-1.664736, 0.2244342, 0.08852158, 1, 1, 1, 1, 1,
-1.66275, -2.674817, -2.912756, 1, 1, 1, 1, 1,
-1.653948, 0.6763183, -0.7417862, 1, 1, 1, 1, 1,
-1.650218, 0.745419, -1.010763, 1, 1, 1, 1, 1,
-1.647214, 0.6076373, -0.06705914, 1, 1, 1, 1, 1,
-1.626714, -0.4709354, 0.3937012, 1, 1, 1, 1, 1,
-1.618563, 0.7036871, -1.606323, 1, 1, 1, 1, 1,
-1.613983, -0.1989236, -1.499227, 1, 1, 1, 1, 1,
-1.609475, -1.805878, -3.437783, 1, 1, 1, 1, 1,
-1.599654, 0.06494373, 0.4968816, 1, 1, 1, 1, 1,
-1.590913, -1.282169, -1.482226, 1, 1, 1, 1, 1,
-1.57855, -1.151832, -1.924326, 0, 0, 1, 1, 1,
-1.578507, 0.6677101, 1.46064, 1, 0, 0, 1, 1,
-1.571211, 2.623395, -1.369511, 1, 0, 0, 1, 1,
-1.567363, -1.579923, -1.314501, 1, 0, 0, 1, 1,
-1.552241, -1.073373, -1.770384, 1, 0, 0, 1, 1,
-1.543517, -0.3190307, -1.8058, 1, 0, 0, 1, 1,
-1.534026, 0.279939, -2.822335, 0, 0, 0, 1, 1,
-1.520849, -1.341756, -1.679879, 0, 0, 0, 1, 1,
-1.507495, 1.092629, -1.771959, 0, 0, 0, 1, 1,
-1.503204, 0.4922123, -2.579376, 0, 0, 0, 1, 1,
-1.490907, 0.4173269, -0.8072544, 0, 0, 0, 1, 1,
-1.49055, -0.08226842, -3.203998, 0, 0, 0, 1, 1,
-1.487505, -1.835073, -1.685673, 0, 0, 0, 1, 1,
-1.480755, 0.1276208, -1.088464, 1, 1, 1, 1, 1,
-1.472604, -0.3529147, -3.222324, 1, 1, 1, 1, 1,
-1.469679, -0.4686572, -1.618276, 1, 1, 1, 1, 1,
-1.460603, -0.4624376, -2.263099, 1, 1, 1, 1, 1,
-1.45246, -0.1514358, -2.198119, 1, 1, 1, 1, 1,
-1.440279, 0.3832196, -1.208706, 1, 1, 1, 1, 1,
-1.438333, 1.24381, 1.157548, 1, 1, 1, 1, 1,
-1.429815, 0.002741854, -0.4002651, 1, 1, 1, 1, 1,
-1.401346, -1.583524, -4.567569, 1, 1, 1, 1, 1,
-1.39989, -0.1387915, -1.471567, 1, 1, 1, 1, 1,
-1.398452, 0.1838231, -2.224428, 1, 1, 1, 1, 1,
-1.396653, 1.080268, -0.4565341, 1, 1, 1, 1, 1,
-1.395014, 0.3399202, -0.3733941, 1, 1, 1, 1, 1,
-1.390355, -0.4800102, -2.24723, 1, 1, 1, 1, 1,
-1.384177, -0.145668, -1.748359, 1, 1, 1, 1, 1,
-1.38118, -0.860449, -3.042731, 0, 0, 1, 1, 1,
-1.379078, 0.9688046, -1.092396, 1, 0, 0, 1, 1,
-1.368832, 1.013938, -1.084141, 1, 0, 0, 1, 1,
-1.330311, 1.36138, 0.1993795, 1, 0, 0, 1, 1,
-1.326769, 0.6647294, -0.7287391, 1, 0, 0, 1, 1,
-1.323631, -0.1716068, -1.425866, 1, 0, 0, 1, 1,
-1.322137, 1.634973, -1.483069, 0, 0, 0, 1, 1,
-1.315914, 0.70037, -0.6474976, 0, 0, 0, 1, 1,
-1.312731, -1.280324, -0.9770648, 0, 0, 0, 1, 1,
-1.309133, 0.974967, -0.6083364, 0, 0, 0, 1, 1,
-1.291422, 0.4698115, 0.4435078, 0, 0, 0, 1, 1,
-1.290257, 0.1198702, -2.819332, 0, 0, 0, 1, 1,
-1.280563, -0.09513163, -0.8005182, 0, 0, 0, 1, 1,
-1.28018, 0.9966965, -0.2898759, 1, 1, 1, 1, 1,
-1.27962, -0.6506543, -2.293097, 1, 1, 1, 1, 1,
-1.279487, 0.2680545, -1.580116, 1, 1, 1, 1, 1,
-1.274445, 0.2645685, -1.469906, 1, 1, 1, 1, 1,
-1.262325, -0.5548582, -3.375449, 1, 1, 1, 1, 1,
-1.250089, -0.1781415, -1.008809, 1, 1, 1, 1, 1,
-1.247822, -0.8155062, -3.81018, 1, 1, 1, 1, 1,
-1.24003, -0.3377627, -3.555856, 1, 1, 1, 1, 1,
-1.233189, -0.486739, -1.828047, 1, 1, 1, 1, 1,
-1.2236, -0.3733054, -3.725484, 1, 1, 1, 1, 1,
-1.210424, -0.2533658, -0.9266725, 1, 1, 1, 1, 1,
-1.209406, 1.027492, 2.446117, 1, 1, 1, 1, 1,
-1.204208, 1.396527, -1.971052, 1, 1, 1, 1, 1,
-1.19574, 0.4487704, 0.3400432, 1, 1, 1, 1, 1,
-1.194639, 1.721754, -2.179157, 1, 1, 1, 1, 1,
-1.191325, 0.7436566, -1.27302, 0, 0, 1, 1, 1,
-1.189275, 1.647333, -1.632322, 1, 0, 0, 1, 1,
-1.185122, -0.2529445, -0.6407869, 1, 0, 0, 1, 1,
-1.183495, 0.7272879, -1.021326, 1, 0, 0, 1, 1,
-1.176029, 1.659883, 1.238981, 1, 0, 0, 1, 1,
-1.174769, 0.06757282, -0.5489053, 1, 0, 0, 1, 1,
-1.172659, 0.03698842, -1.646243, 0, 0, 0, 1, 1,
-1.171083, 0.2312997, 0.744857, 0, 0, 0, 1, 1,
-1.170349, 0.5211985, -1.458672, 0, 0, 0, 1, 1,
-1.163661, 0.6085284, -2.252867, 0, 0, 0, 1, 1,
-1.155402, 0.4792783, -0.3937103, 0, 0, 0, 1, 1,
-1.152363, -0.1346264, -2.806298, 0, 0, 0, 1, 1,
-1.152198, 0.5246959, -0.5739317, 0, 0, 0, 1, 1,
-1.151608, -0.6402912, -4.984688, 1, 1, 1, 1, 1,
-1.145592, -1.636714, -2.659124, 1, 1, 1, 1, 1,
-1.142294, -0.352211, 0.8017124, 1, 1, 1, 1, 1,
-1.139917, -1.154246, -3.208029, 1, 1, 1, 1, 1,
-1.135465, -1.259001, -2.007052, 1, 1, 1, 1, 1,
-1.127756, 0.06056027, -0.3365467, 1, 1, 1, 1, 1,
-1.119613, -0.1806194, -2.223931, 1, 1, 1, 1, 1,
-1.11699, -0.6300889, -1.231638, 1, 1, 1, 1, 1,
-1.116502, 1.370563, 0.214983, 1, 1, 1, 1, 1,
-1.112979, 0.9735132, -1.714192, 1, 1, 1, 1, 1,
-1.112469, -0.05275908, -2.084902, 1, 1, 1, 1, 1,
-1.105096, 1.218482, -0.2661767, 1, 1, 1, 1, 1,
-1.095038, 0.7874773, -1.744294, 1, 1, 1, 1, 1,
-1.088837, 0.1456107, -1.252205, 1, 1, 1, 1, 1,
-1.085765, -1.54343, -3.808557, 1, 1, 1, 1, 1,
-1.08575, -0.1401901, -0.2493507, 0, 0, 1, 1, 1,
-1.082549, 0.2041573, -1.249381, 1, 0, 0, 1, 1,
-1.076993, 0.05084962, -1.319371, 1, 0, 0, 1, 1,
-1.074831, 0.389302, -1.593105, 1, 0, 0, 1, 1,
-1.073872, 1.063993, -2.277548, 1, 0, 0, 1, 1,
-1.069794, 0.3283819, -0.6078959, 1, 0, 0, 1, 1,
-1.065357, 1.777237, -0.6132353, 0, 0, 0, 1, 1,
-1.052345, 0.4410706, -0.6486779, 0, 0, 0, 1, 1,
-1.051014, -0.6898074, -2.02119, 0, 0, 0, 1, 1,
-1.047706, 1.032554, -0.4709905, 0, 0, 0, 1, 1,
-1.045406, 0.05508402, 0.4263967, 0, 0, 0, 1, 1,
-1.032734, 0.2961281, -1.743447, 0, 0, 0, 1, 1,
-1.027451, 1.115648, -0.6887364, 0, 0, 0, 1, 1,
-1.023512, -0.6813095, -2.481808, 1, 1, 1, 1, 1,
-1.0232, -2.966541, -1.892156, 1, 1, 1, 1, 1,
-1.02196, -0.4338621, -2.576983, 1, 1, 1, 1, 1,
-1.021884, 1.209797, 0.4934934, 1, 1, 1, 1, 1,
-1.019723, -0.7540459, -1.004889, 1, 1, 1, 1, 1,
-1.017833, 0.9209358, -1.063875, 1, 1, 1, 1, 1,
-1.012386, -0.2722782, -4.855274, 1, 1, 1, 1, 1,
-1.011559, -0.4714903, -1.113959, 1, 1, 1, 1, 1,
-1.009228, -1.002777, -1.462988, 1, 1, 1, 1, 1,
-1.001189, 1.216739, -1.500573, 1, 1, 1, 1, 1,
-0.999782, -0.1611737, -3.820252, 1, 1, 1, 1, 1,
-0.9980165, -0.3463285, -3.696229, 1, 1, 1, 1, 1,
-0.9908855, 1.476109, -0.6370076, 1, 1, 1, 1, 1,
-0.9882291, 0.5671089, -2.527653, 1, 1, 1, 1, 1,
-0.9807941, 1.963641, 1.918629, 1, 1, 1, 1, 1,
-0.9657385, 0.07749534, -2.906001, 0, 0, 1, 1, 1,
-0.9638876, -1.122828, -1.608341, 1, 0, 0, 1, 1,
-0.9614723, 0.01383532, -1.875281, 1, 0, 0, 1, 1,
-0.9586824, 0.364256, -1.640805, 1, 0, 0, 1, 1,
-0.9575269, -1.67108, -0.4883086, 1, 0, 0, 1, 1,
-0.9446802, -0.2487007, -2.045625, 1, 0, 0, 1, 1,
-0.9341969, 1.143653, -1.06661, 0, 0, 0, 1, 1,
-0.9245961, -1.509877, -2.167888, 0, 0, 0, 1, 1,
-0.9230294, -0.7711607, -3.330608, 0, 0, 0, 1, 1,
-0.9200394, -1.112597, -1.604511, 0, 0, 0, 1, 1,
-0.9193146, -0.5964876, -0.9330327, 0, 0, 0, 1, 1,
-0.9172134, 0.5484033, -1.407366, 0, 0, 0, 1, 1,
-0.9167743, -1.523414, -2.629467, 0, 0, 0, 1, 1,
-0.9101035, -0.1646234, -0.7020096, 1, 1, 1, 1, 1,
-0.9045061, 0.2816975, -0.1370664, 1, 1, 1, 1, 1,
-0.9024541, 0.8307053, -2.297982, 1, 1, 1, 1, 1,
-0.8978652, -0.3180179, -1.500786, 1, 1, 1, 1, 1,
-0.8964188, 0.1598603, -2.707081, 1, 1, 1, 1, 1,
-0.8961003, -0.8313353, -1.606702, 1, 1, 1, 1, 1,
-0.8947544, 0.8770018, -0.4786095, 1, 1, 1, 1, 1,
-0.8889515, 0.3145874, -2.54156, 1, 1, 1, 1, 1,
-0.8862562, -1.261736, -1.354222, 1, 1, 1, 1, 1,
-0.8826095, 2.041878, -0.4635903, 1, 1, 1, 1, 1,
-0.8821831, 1.624168, -2.020938, 1, 1, 1, 1, 1,
-0.8645051, -0.4338357, -1.284567, 1, 1, 1, 1, 1,
-0.863833, -1.562409, -2.753916, 1, 1, 1, 1, 1,
-0.8619459, -0.2932336, -1.286888, 1, 1, 1, 1, 1,
-0.857318, -0.2438609, -1.963863, 1, 1, 1, 1, 1,
-0.841831, -0.4332044, -1.627422, 0, 0, 1, 1, 1,
-0.8416126, 1.913618, -1.528312, 1, 0, 0, 1, 1,
-0.8364983, 0.01822555, -1.648936, 1, 0, 0, 1, 1,
-0.8339679, 0.4009341, -1.348909, 1, 0, 0, 1, 1,
-0.8228269, -1.103911, -0.9260834, 1, 0, 0, 1, 1,
-0.8181932, -1.121491, -2.045146, 1, 0, 0, 1, 1,
-0.8169466, -0.07037709, -1.947143, 0, 0, 0, 1, 1,
-0.8141445, -1.45238, -1.021918, 0, 0, 0, 1, 1,
-0.8136593, 1.308237, -1.184588, 0, 0, 0, 1, 1,
-0.8128589, 0.3730675, 0.253099, 0, 0, 0, 1, 1,
-0.8118699, -1.778311, -0.7995334, 0, 0, 0, 1, 1,
-0.8056654, 0.6540317, -0.5535095, 0, 0, 0, 1, 1,
-0.8014939, -0.1915068, -1.343606, 0, 0, 0, 1, 1,
-0.8008265, -1.525735, -2.867769, 1, 1, 1, 1, 1,
-0.7949499, 0.3960468, -0.7156388, 1, 1, 1, 1, 1,
-0.7941306, 1.57596, 0.1930137, 1, 1, 1, 1, 1,
-0.7938864, -1.182313, -2.732582, 1, 1, 1, 1, 1,
-0.7910192, -1.283774, -2.330366, 1, 1, 1, 1, 1,
-0.7902259, -1.231744, -0.945317, 1, 1, 1, 1, 1,
-0.7847919, 1.722412, -2.468414, 1, 1, 1, 1, 1,
-0.7700239, -0.8976291, -1.816021, 1, 1, 1, 1, 1,
-0.7699327, -0.928617, -2.429151, 1, 1, 1, 1, 1,
-0.7678124, -0.2039499, -0.4184194, 1, 1, 1, 1, 1,
-0.7672224, 1.207584, -3.709659, 1, 1, 1, 1, 1,
-0.7647898, 0.4160853, -0.5220966, 1, 1, 1, 1, 1,
-0.763333, -0.2505267, -1.5116, 1, 1, 1, 1, 1,
-0.7595735, -1.169418, -2.412545, 1, 1, 1, 1, 1,
-0.7563859, 1.326754, -0.9662361, 1, 1, 1, 1, 1,
-0.7483026, -1.174974, -1.501701, 0, 0, 1, 1, 1,
-0.7475022, -0.1864383, -0.3044169, 1, 0, 0, 1, 1,
-0.7472847, -0.0207212, -1.518929, 1, 0, 0, 1, 1,
-0.7430033, 0.01353371, -2.621834, 1, 0, 0, 1, 1,
-0.742672, -0.6620117, -2.652373, 1, 0, 0, 1, 1,
-0.7406007, 1.453301, -0.6657421, 1, 0, 0, 1, 1,
-0.7333406, -0.2741385, -0.4695719, 0, 0, 0, 1, 1,
-0.728925, 1.289529, -0.7469224, 0, 0, 0, 1, 1,
-0.7262643, 1.660808, -0.5443354, 0, 0, 0, 1, 1,
-0.7213231, -0.1901174, -1.688325, 0, 0, 0, 1, 1,
-0.7192237, 1.547115, -0.1269989, 0, 0, 0, 1, 1,
-0.7178908, 1.118124, 0.3919733, 0, 0, 0, 1, 1,
-0.7121992, 0.01355508, -2.185486, 0, 0, 0, 1, 1,
-0.7110212, 0.4253459, 0.7460348, 1, 1, 1, 1, 1,
-0.7085448, -0.472531, -2.745398, 1, 1, 1, 1, 1,
-0.6965111, -0.5802101, -2.487751, 1, 1, 1, 1, 1,
-0.6962162, 1.10524, -0.2707973, 1, 1, 1, 1, 1,
-0.6943102, 0.6056134, -1.737443, 1, 1, 1, 1, 1,
-0.6896377, 2.510561, -0.5390856, 1, 1, 1, 1, 1,
-0.6883712, 0.6856085, -0.7411575, 1, 1, 1, 1, 1,
-0.6876587, -0.1297239, -0.1218888, 1, 1, 1, 1, 1,
-0.6841936, -0.4058198, -2.541917, 1, 1, 1, 1, 1,
-0.683674, -0.6580937, -2.855058, 1, 1, 1, 1, 1,
-0.6780959, 0.1298356, -1.897772, 1, 1, 1, 1, 1,
-0.6742417, -0.2322241, -1.160211, 1, 1, 1, 1, 1,
-0.6737914, 0.9903938, -1.046734, 1, 1, 1, 1, 1,
-0.6727595, -2.11938, -1.77883, 1, 1, 1, 1, 1,
-0.6694564, 2.450376, -1.105, 1, 1, 1, 1, 1,
-0.6673564, 1.453722, -0.1895933, 0, 0, 1, 1, 1,
-0.6659408, -0.9754899, -2.516079, 1, 0, 0, 1, 1,
-0.6622027, -0.6962217, -1.572615, 1, 0, 0, 1, 1,
-0.658954, 0.003428191, -3.71711, 1, 0, 0, 1, 1,
-0.6520515, -1.084706, -2.804891, 1, 0, 0, 1, 1,
-0.6496704, 0.04537298, -0.6679692, 1, 0, 0, 1, 1,
-0.6495091, 1.292715, 0.05581262, 0, 0, 0, 1, 1,
-0.6463521, 0.4896118, 0.8981312, 0, 0, 0, 1, 1,
-0.6453884, 0.05488972, -0.8155149, 0, 0, 0, 1, 1,
-0.6435172, 0.7933226, -1.097623, 0, 0, 0, 1, 1,
-0.6419079, 0.00221926, -0.7900074, 0, 0, 0, 1, 1,
-0.6415843, 0.8185159, -0.7020875, 0, 0, 0, 1, 1,
-0.6390802, -0.3585389, -3.085557, 0, 0, 0, 1, 1,
-0.6389658, -0.845385, -0.6035554, 1, 1, 1, 1, 1,
-0.6349115, 0.9507866, -0.1572334, 1, 1, 1, 1, 1,
-0.6323677, -0.8283659, -2.264184, 1, 1, 1, 1, 1,
-0.6269521, -0.3180052, -1.756844, 1, 1, 1, 1, 1,
-0.617838, -0.9771373, -2.374002, 1, 1, 1, 1, 1,
-0.6063007, -2.359478, -3.504281, 1, 1, 1, 1, 1,
-0.6036164, 0.4194897, -1.274194, 1, 1, 1, 1, 1,
-0.6011044, 0.2414995, -2.642834, 1, 1, 1, 1, 1,
-0.6004846, -2.478533, -3.306749, 1, 1, 1, 1, 1,
-0.5998895, 1.216648, -1.275311, 1, 1, 1, 1, 1,
-0.5938888, -1.187791, -4.218955, 1, 1, 1, 1, 1,
-0.5877544, -0.6046792, -3.420738, 1, 1, 1, 1, 1,
-0.5841614, 0.5355918, -0.9383848, 1, 1, 1, 1, 1,
-0.5818948, -0.9652348, -1.26851, 1, 1, 1, 1, 1,
-0.5810535, 0.950267, 0.6818349, 1, 1, 1, 1, 1,
-0.5772048, 1.750181, -1.687423, 0, 0, 1, 1, 1,
-0.5762872, 0.1561632, -0.8304389, 1, 0, 0, 1, 1,
-0.5708581, -1.507081, -3.153275, 1, 0, 0, 1, 1,
-0.5693187, 0.85672, -0.09602107, 1, 0, 0, 1, 1,
-0.5644981, 0.5699004, -1.079426, 1, 0, 0, 1, 1,
-0.554365, 0.8179658, -0.03625411, 1, 0, 0, 1, 1,
-0.5532953, -1.004939, -4.181147, 0, 0, 0, 1, 1,
-0.5524352, 0.2793332, -1.440817, 0, 0, 0, 1, 1,
-0.552366, 0.02727138, -2.193362, 0, 0, 0, 1, 1,
-0.5511127, -0.9279019, -2.957447, 0, 0, 0, 1, 1,
-0.5465448, -0.7939259, -2.335487, 0, 0, 0, 1, 1,
-0.5460004, -1.071638, -2.719369, 0, 0, 0, 1, 1,
-0.5429584, 0.2570376, -0.3136486, 0, 0, 0, 1, 1,
-0.5390894, 0.2177651, -0.6756113, 1, 1, 1, 1, 1,
-0.5378395, 1.179938, 0.9977415, 1, 1, 1, 1, 1,
-0.5332516, -0.7267777, -2.964829, 1, 1, 1, 1, 1,
-0.5316324, 2.058443, -1.189694, 1, 1, 1, 1, 1,
-0.5278187, -0.8071731, -2.19216, 1, 1, 1, 1, 1,
-0.527688, 0.6392858, 0.2166879, 1, 1, 1, 1, 1,
-0.5265964, 1.191468, -1.321256, 1, 1, 1, 1, 1,
-0.5220842, 1.404905, 1.241032, 1, 1, 1, 1, 1,
-0.5162756, -0.2013467, -1.156327, 1, 1, 1, 1, 1,
-0.5149142, 0.9807789, -1.018923, 1, 1, 1, 1, 1,
-0.5137507, -0.2255602, -1.214393, 1, 1, 1, 1, 1,
-0.5040814, -0.9802836, -4.121484, 1, 1, 1, 1, 1,
-0.5040377, 2.564271, -0.8097006, 1, 1, 1, 1, 1,
-0.5034286, -0.7853597, -1.87034, 1, 1, 1, 1, 1,
-0.5019533, 0.5466027, -1.303622, 1, 1, 1, 1, 1,
-0.5007486, 1.34895, -0.01266516, 0, 0, 1, 1, 1,
-0.49343, -0.687461, -2.710121, 1, 0, 0, 1, 1,
-0.4897313, 0.9762601, -0.9717169, 1, 0, 0, 1, 1,
-0.4894327, 0.9044259, -0.7263901, 1, 0, 0, 1, 1,
-0.4879387, 0.4095853, -0.9580958, 1, 0, 0, 1, 1,
-0.4872267, -0.9143097, -2.664999, 1, 0, 0, 1, 1,
-0.4732685, -1.120215, -2.874829, 0, 0, 0, 1, 1,
-0.4725127, 0.3148798, -1.015276, 0, 0, 0, 1, 1,
-0.4687636, -0.930132, -3.489021, 0, 0, 0, 1, 1,
-0.4674439, -2.224322, -1.682912, 0, 0, 0, 1, 1,
-0.4630378, -2.302068, -2.929152, 0, 0, 0, 1, 1,
-0.4602781, -0.748925, -2.570173, 0, 0, 0, 1, 1,
-0.4560241, -1.323775, -2.498351, 0, 0, 0, 1, 1,
-0.454294, 0.3521839, 0.9890993, 1, 1, 1, 1, 1,
-0.4517758, -0.3895756, -2.729255, 1, 1, 1, 1, 1,
-0.4347333, -2.605901, -3.436354, 1, 1, 1, 1, 1,
-0.433794, 0.3394338, -1.222112, 1, 1, 1, 1, 1,
-0.4319214, 0.4361879, -1.267695, 1, 1, 1, 1, 1,
-0.4313746, 0.8656942, -1.127166, 1, 1, 1, 1, 1,
-0.4264293, -0.4870381, 0.1408086, 1, 1, 1, 1, 1,
-0.4262608, 0.8028549, -0.3179521, 1, 1, 1, 1, 1,
-0.4206094, 0.4588223, -3.311689, 1, 1, 1, 1, 1,
-0.4162878, 2.049825, -0.405103, 1, 1, 1, 1, 1,
-0.4131619, 0.5942311, -1.885815, 1, 1, 1, 1, 1,
-0.4112103, -0.9292837, -3.340951, 1, 1, 1, 1, 1,
-0.4099603, -1.139146, -3.870693, 1, 1, 1, 1, 1,
-0.4083203, -0.9955937, -4.420246, 1, 1, 1, 1, 1,
-0.4053065, -0.6935527, -1.073946, 1, 1, 1, 1, 1,
-0.4050639, 1.798378, -1.611555, 0, 0, 1, 1, 1,
-0.4041545, -0.01858525, -2.677943, 1, 0, 0, 1, 1,
-0.4015355, -1.289041, -3.50115, 1, 0, 0, 1, 1,
-0.3987794, 1.116264, 0.3211165, 1, 0, 0, 1, 1,
-0.3980592, 0.1317029, -0.8869206, 1, 0, 0, 1, 1,
-0.3851588, -1.772149, -3.129081, 1, 0, 0, 1, 1,
-0.385085, -0.4454308, -2.346201, 0, 0, 0, 1, 1,
-0.385033, 1.2893, -0.09563325, 0, 0, 0, 1, 1,
-0.3805011, -0.1453652, -3.176822, 0, 0, 0, 1, 1,
-0.3788695, -0.1210113, -3.061119, 0, 0, 0, 1, 1,
-0.3781072, -0.9752278, -3.223562, 0, 0, 0, 1, 1,
-0.3752432, -0.8891877, -2.596493, 0, 0, 0, 1, 1,
-0.3739055, -1.020342, -4.294491, 0, 0, 0, 1, 1,
-0.3711475, 0.2145487, -0.5812233, 1, 1, 1, 1, 1,
-0.3666221, -0.01328842, -1.835437, 1, 1, 1, 1, 1,
-0.3567871, 1.290097, -0.3217926, 1, 1, 1, 1, 1,
-0.3551019, 0.2458122, -2.026315, 1, 1, 1, 1, 1,
-0.3547336, -0.7136248, -2.919968, 1, 1, 1, 1, 1,
-0.3544695, 0.9903746, -1.734723, 1, 1, 1, 1, 1,
-0.3517884, 1.740141, -0.5420675, 1, 1, 1, 1, 1,
-0.3473439, 0.5640845, -0.9072145, 1, 1, 1, 1, 1,
-0.3464266, 0.5699586, -1.135399, 1, 1, 1, 1, 1,
-0.3398502, -1.202966, -3.889397, 1, 1, 1, 1, 1,
-0.3388327, 0.06268918, -0.7835167, 1, 1, 1, 1, 1,
-0.3369819, -0.5483826, -2.896572, 1, 1, 1, 1, 1,
-0.3301072, 0.4426131, 0.6138791, 1, 1, 1, 1, 1,
-0.329191, -0.71763, -0.7709998, 1, 1, 1, 1, 1,
-0.3272643, -1.766162, -2.18694, 1, 1, 1, 1, 1,
-0.3261075, -0.2209846, -1.646647, 0, 0, 1, 1, 1,
-0.3223638, -2.19036, -2.480052, 1, 0, 0, 1, 1,
-0.3211972, -0.8553721, -2.929344, 1, 0, 0, 1, 1,
-0.3202919, -0.3454605, -1.475642, 1, 0, 0, 1, 1,
-0.3144682, 2.187226, 0.04668135, 1, 0, 0, 1, 1,
-0.3128975, -1.529029, -2.807581, 1, 0, 0, 1, 1,
-0.3092523, -0.4424041, -3.660197, 0, 0, 0, 1, 1,
-0.305046, -0.5809627, -2.593637, 0, 0, 0, 1, 1,
-0.3028495, -0.4252866, -3.872256, 0, 0, 0, 1, 1,
-0.3025045, 1.37242, -1.329907, 0, 0, 0, 1, 1,
-0.2975217, 2.06357, -1.418141, 0, 0, 0, 1, 1,
-0.2963166, 0.8927954, 0.5395368, 0, 0, 0, 1, 1,
-0.2904739, -1.451459, -2.8634, 0, 0, 0, 1, 1,
-0.2898825, 0.988345, 0.9324462, 1, 1, 1, 1, 1,
-0.2838391, 0.1124583, -1.758801, 1, 1, 1, 1, 1,
-0.2834836, 0.5998329, -0.2571796, 1, 1, 1, 1, 1,
-0.2812997, 1.8005, -0.1291708, 1, 1, 1, 1, 1,
-0.2771959, -0.8848199, -1.640377, 1, 1, 1, 1, 1,
-0.2712958, -0.06579046, -2.646276, 1, 1, 1, 1, 1,
-0.2679939, 0.4556876, -0.5044104, 1, 1, 1, 1, 1,
-0.2642142, -0.8510779, -3.963696, 1, 1, 1, 1, 1,
-0.2571651, -1.148965, -2.722186, 1, 1, 1, 1, 1,
-0.2561351, -0.4412687, -2.916196, 1, 1, 1, 1, 1,
-0.2503484, 0.06310653, -0.5612589, 1, 1, 1, 1, 1,
-0.2483007, 1.724221, -1.496516, 1, 1, 1, 1, 1,
-0.2473225, -0.5757346, -2.861055, 1, 1, 1, 1, 1,
-0.2437001, 0.06284685, 0.3069791, 1, 1, 1, 1, 1,
-0.2429671, -0.4388698, -1.465317, 1, 1, 1, 1, 1,
-0.2394122, -0.1952973, -2.159633, 0, 0, 1, 1, 1,
-0.2387168, -0.3967531, -2.538016, 1, 0, 0, 1, 1,
-0.2385625, -0.8448107, -2.024439, 1, 0, 0, 1, 1,
-0.235671, 0.7762644, -0.554226, 1, 0, 0, 1, 1,
-0.2308575, -1.125121, -3.236968, 1, 0, 0, 1, 1,
-0.2304366, -0.396644, -2.713629, 1, 0, 0, 1, 1,
-0.2269946, -0.9604677, -2.161505, 0, 0, 0, 1, 1,
-0.2251125, 1.396906, 0.2418737, 0, 0, 0, 1, 1,
-0.2191482, -1.29678, -2.735037, 0, 0, 0, 1, 1,
-0.2174113, -0.2083593, -2.53283, 0, 0, 0, 1, 1,
-0.2169516, -2.540199, -3.602755, 0, 0, 0, 1, 1,
-0.2161303, 0.4772992, -0.3990507, 0, 0, 0, 1, 1,
-0.2157068, -0.2176903, -4.421928, 0, 0, 0, 1, 1,
-0.2085588, -0.5067279, -0.9523457, 1, 1, 1, 1, 1,
-0.2075166, -0.907872, -2.280938, 1, 1, 1, 1, 1,
-0.2038398, 0.4198783, -0.2590342, 1, 1, 1, 1, 1,
-0.2015544, -0.4377887, -3.269855, 1, 1, 1, 1, 1,
-0.2007513, 0.3259743, 0.2168572, 1, 1, 1, 1, 1,
-0.2005236, -0.904623, -1.972948, 1, 1, 1, 1, 1,
-0.1976472, -0.1075438, 0.2467631, 1, 1, 1, 1, 1,
-0.197619, -1.190552, -2.711268, 1, 1, 1, 1, 1,
-0.1953398, -0.2508054, -2.779828, 1, 1, 1, 1, 1,
-0.1952087, 1.3829, -0.2874098, 1, 1, 1, 1, 1,
-0.1939117, 1.336199, -0.4475079, 1, 1, 1, 1, 1,
-0.1865751, -0.3335657, -1.82822, 1, 1, 1, 1, 1,
-0.1862731, 0.2290126, -0.406088, 1, 1, 1, 1, 1,
-0.1831368, -0.4341872, -3.043811, 1, 1, 1, 1, 1,
-0.1806362, 0.6132478, -2.6744, 1, 1, 1, 1, 1,
-0.1744868, -0.7839396, -1.389146, 0, 0, 1, 1, 1,
-0.1734717, 2.210291, -0.589257, 1, 0, 0, 1, 1,
-0.1688839, -1.210424, -2.879745, 1, 0, 0, 1, 1,
-0.1673735, 0.3351346, 1.50669, 1, 0, 0, 1, 1,
-0.1662664, 2.20238, -0.5920675, 1, 0, 0, 1, 1,
-0.1659189, -0.1395353, -0.5611515, 1, 0, 0, 1, 1,
-0.1654698, 0.4130899, -0.8337305, 0, 0, 0, 1, 1,
-0.1626811, 2.044109, -1.270339, 0, 0, 0, 1, 1,
-0.1619441, -0.9191175, -1.479177, 0, 0, 0, 1, 1,
-0.1609065, 1.038806, -1.185573, 0, 0, 0, 1, 1,
-0.1605203, 0.9143578, 0.2590306, 0, 0, 0, 1, 1,
-0.1584114, 0.748221, -1.6541, 0, 0, 0, 1, 1,
-0.1535897, -1.035917, -2.066905, 0, 0, 0, 1, 1,
-0.1521507, -0.1027895, -3.688885, 1, 1, 1, 1, 1,
-0.1519689, 1.199058, 0.4449224, 1, 1, 1, 1, 1,
-0.1518925, 0.354431, -1.270024, 1, 1, 1, 1, 1,
-0.1510354, 0.6610229, 1.480325, 1, 1, 1, 1, 1,
-0.1477385, 1.220373, 0.03339093, 1, 1, 1, 1, 1,
-0.1471605, -0.2323482, -3.35882, 1, 1, 1, 1, 1,
-0.1364902, 0.7438918, -0.5326301, 1, 1, 1, 1, 1,
-0.1356881, 1.51289, 1.089766, 1, 1, 1, 1, 1,
-0.1322779, 0.2786227, -1.367534, 1, 1, 1, 1, 1,
-0.1321765, -1.502587, -2.402507, 1, 1, 1, 1, 1,
-0.131092, -0.4066282, -1.651521, 1, 1, 1, 1, 1,
-0.1310107, 0.8132115, 1.584896, 1, 1, 1, 1, 1,
-0.1277013, -2.086418, -5.346537, 1, 1, 1, 1, 1,
-0.1272124, 0.120887, 0.2076188, 1, 1, 1, 1, 1,
-0.12707, 0.02791978, -2.035601, 1, 1, 1, 1, 1,
-0.125419, 0.4592166, 0.7223971, 0, 0, 1, 1, 1,
-0.1253675, 0.5886446, -0.6518944, 1, 0, 0, 1, 1,
-0.1216012, 0.925501, -0.9120485, 1, 0, 0, 1, 1,
-0.1182898, -0.6155686, -4.467247, 1, 0, 0, 1, 1,
-0.1160614, 1.106633, -1.441304, 1, 0, 0, 1, 1,
-0.1146396, 0.4473673, -1.62473, 1, 0, 0, 1, 1,
-0.1145992, 1.516745, -0.3800328, 0, 0, 0, 1, 1,
-0.1123735, -0.05451718, -2.531866, 0, 0, 0, 1, 1,
-0.1117337, 0.05061084, -0.977994, 0, 0, 0, 1, 1,
-0.1057903, 1.036605, -0.003921259, 0, 0, 0, 1, 1,
-0.10293, 0.002290627, -0.3617614, 0, 0, 0, 1, 1,
-0.09542622, -2.225701, -3.114539, 0, 0, 0, 1, 1,
-0.09434123, 2.764959, 0.6448835, 0, 0, 0, 1, 1,
-0.08985401, -1.104599, -2.966371, 1, 1, 1, 1, 1,
-0.08730596, -0.7177207, -3.409164, 1, 1, 1, 1, 1,
-0.08476903, -0.03267148, -1.398198, 1, 1, 1, 1, 1,
-0.07740874, 1.847748, 0.159237, 1, 1, 1, 1, 1,
-0.07644196, 0.7177058, -0.7399884, 1, 1, 1, 1, 1,
-0.07503813, -0.6068787, -2.041378, 1, 1, 1, 1, 1,
-0.06971407, 0.8497579, 0.5266431, 1, 1, 1, 1, 1,
-0.05980924, -1.673679, -2.295219, 1, 1, 1, 1, 1,
-0.05683965, 0.2335056, -1.128665, 1, 1, 1, 1, 1,
-0.05677858, -0.5651837, -1.991265, 1, 1, 1, 1, 1,
-0.05604504, 1.441656, -0.3405174, 1, 1, 1, 1, 1,
-0.05603288, -1.455627, -4.743922, 1, 1, 1, 1, 1,
-0.05136335, -0.3023887, -4.168474, 1, 1, 1, 1, 1,
-0.0512799, -0.09339675, -2.41883, 1, 1, 1, 1, 1,
-0.0502968, 0.4864469, -0.8735241, 1, 1, 1, 1, 1,
-0.05025424, 1.613857, -0.7344452, 0, 0, 1, 1, 1,
-0.04803894, -1.004791, -2.985039, 1, 0, 0, 1, 1,
-0.04433093, -1.264444, -2.047926, 1, 0, 0, 1, 1,
-0.04373955, 0.562102, 0.5401152, 1, 0, 0, 1, 1,
-0.03989659, 0.1280012, -1.292031, 1, 0, 0, 1, 1,
-0.03640388, 0.8580285, 1.285451, 1, 0, 0, 1, 1,
-0.03584377, -0.3607579, -1.505075, 0, 0, 0, 1, 1,
-0.03515467, 0.8638409, 0.1243133, 0, 0, 0, 1, 1,
-0.0298354, 0.3752148, 0.8579137, 0, 0, 0, 1, 1,
-0.02722864, -0.4425513, -3.858341, 0, 0, 0, 1, 1,
-0.02677459, -1.798813, -1.94433, 0, 0, 0, 1, 1,
-0.02634059, 0.1679737, -0.8966227, 0, 0, 0, 1, 1,
-0.02510013, 0.07822679, 0.5696719, 0, 0, 0, 1, 1,
-0.02474401, -1.829328, -4.514198, 1, 1, 1, 1, 1,
-0.02338531, 0.01379485, -0.470244, 1, 1, 1, 1, 1,
-0.02275391, -1.426218, -4.458992, 1, 1, 1, 1, 1,
-0.02055669, 0.5825231, -2.292935, 1, 1, 1, 1, 1,
-0.01940905, -0.08044434, -2.571083, 1, 1, 1, 1, 1,
-0.01898531, -0.05117299, -2.841813, 1, 1, 1, 1, 1,
-0.0156862, 1.492471, -0.7128469, 1, 1, 1, 1, 1,
-0.0133405, 1.074206, -0.6742718, 1, 1, 1, 1, 1,
-0.00979044, -2.664474, -2.164599, 1, 1, 1, 1, 1,
-0.004699595, 1.604116, -0.1953154, 1, 1, 1, 1, 1,
-0.002894545, 0.3647828, 0.8527647, 1, 1, 1, 1, 1,
0.001031331, 0.1431865, 1.599944, 1, 1, 1, 1, 1,
0.002246212, 1.133207, -0.5985767, 1, 1, 1, 1, 1,
0.005081286, 1.67819, 0.1266454, 1, 1, 1, 1, 1,
0.0115155, -1.120033, 3.017373, 1, 1, 1, 1, 1,
0.0163737, -0.5486909, 2.269129, 0, 0, 1, 1, 1,
0.02073095, -1.557831, 1.640482, 1, 0, 0, 1, 1,
0.02857994, -0.8044796, 1.12455, 1, 0, 0, 1, 1,
0.03057033, 0.06311908, -1.225597, 1, 0, 0, 1, 1,
0.03615511, -0.9784698, 1.982083, 1, 0, 0, 1, 1,
0.03823421, -2.049201, 3.544248, 1, 0, 0, 1, 1,
0.04252903, 0.4458526, 0.4721147, 0, 0, 0, 1, 1,
0.043279, 1.571469, -0.2538509, 0, 0, 0, 1, 1,
0.04340356, -1.12995, 2.919738, 0, 0, 0, 1, 1,
0.04870368, -0.4771959, 3.030466, 0, 0, 0, 1, 1,
0.04903238, -0.4530053, 1.669254, 0, 0, 0, 1, 1,
0.05567643, 1.850196, 0.8011101, 0, 0, 0, 1, 1,
0.05657601, 1.903111, 0.6523161, 0, 0, 0, 1, 1,
0.0570049, 1.508204, -0.4447716, 1, 1, 1, 1, 1,
0.05722032, 0.1159825, 1.532536, 1, 1, 1, 1, 1,
0.0619295, 1.646052, -1.326971, 1, 1, 1, 1, 1,
0.06416871, 0.2968074, 0.3151412, 1, 1, 1, 1, 1,
0.06754654, 1.600426, -1.74089, 1, 1, 1, 1, 1,
0.06831895, -0.563612, 2.404876, 1, 1, 1, 1, 1,
0.07763707, 0.4831308, 0.05658723, 1, 1, 1, 1, 1,
0.08503598, 0.05324773, 1.30686, 1, 1, 1, 1, 1,
0.08928341, 0.4411884, -0.1271849, 1, 1, 1, 1, 1,
0.09109495, -0.4292807, 2.660272, 1, 1, 1, 1, 1,
0.09147868, 1.019076, -0.3021957, 1, 1, 1, 1, 1,
0.0931721, -1.136766, 4.39493, 1, 1, 1, 1, 1,
0.09579426, -1.300112, 2.801859, 1, 1, 1, 1, 1,
0.09656665, 0.5205875, 0.08607382, 1, 1, 1, 1, 1,
0.09819578, -0.6126506, 4.028438, 1, 1, 1, 1, 1,
0.1001631, -0.8072274, 1.985445, 0, 0, 1, 1, 1,
0.1020274, 1.069163, 0.5246418, 1, 0, 0, 1, 1,
0.1039774, 0.884688, 2.105556, 1, 0, 0, 1, 1,
0.1064454, -1.268769, 2.012205, 1, 0, 0, 1, 1,
0.1075473, -1.140501, 3.305745, 1, 0, 0, 1, 1,
0.1091652, 0.3596653, 1.73488, 1, 0, 0, 1, 1,
0.1099318, 2.870266, 1.701068, 0, 0, 0, 1, 1,
0.1128609, 0.7045513, -0.028135, 0, 0, 0, 1, 1,
0.1139571, -0.4521053, 2.032279, 0, 0, 0, 1, 1,
0.1156233, -1.101046, 3.331367, 0, 0, 0, 1, 1,
0.1164639, -1.496475, 1.73679, 0, 0, 0, 1, 1,
0.1194132, -3.037749, 1.931938, 0, 0, 0, 1, 1,
0.1201794, -0.3619418, 2.417851, 0, 0, 0, 1, 1,
0.1234577, 0.1213029, 0.4208018, 1, 1, 1, 1, 1,
0.1234663, -0.9116713, 3.968545, 1, 1, 1, 1, 1,
0.1246315, -0.4206479, 2.911427, 1, 1, 1, 1, 1,
0.1262498, 1.45165, 1.08253, 1, 1, 1, 1, 1,
0.1296739, 0.5279458, 0.2153282, 1, 1, 1, 1, 1,
0.1312535, 0.01453454, 1.168209, 1, 1, 1, 1, 1,
0.1316792, -0.9929444, 3.793264, 1, 1, 1, 1, 1,
0.1330445, -0.2061388, 3.489677, 1, 1, 1, 1, 1,
0.1345947, 0.4336836, -0.1172386, 1, 1, 1, 1, 1,
0.1435402, 0.4592984, 0.2412826, 1, 1, 1, 1, 1,
0.1469465, -2.135564, 4.634159, 1, 1, 1, 1, 1,
0.1495346, 0.0359142, 1.190442, 1, 1, 1, 1, 1,
0.1531339, 0.3601947, -0.4373362, 1, 1, 1, 1, 1,
0.1532949, 1.05039, 0.9406663, 1, 1, 1, 1, 1,
0.1557006, 0.7343619, 0.5606418, 1, 1, 1, 1, 1,
0.1602196, 1.147426, 0.7717799, 0, 0, 1, 1, 1,
0.1707787, -0.9825183, 2.186747, 1, 0, 0, 1, 1,
0.1773613, -1.64725, 4.349791, 1, 0, 0, 1, 1,
0.1776964, 1.227922, -0.2032308, 1, 0, 0, 1, 1,
0.1807831, -1.248593, 1.386515, 1, 0, 0, 1, 1,
0.1872407, 0.6074451, 1.224478, 1, 0, 0, 1, 1,
0.1893496, 0.1077154, 0.4594512, 0, 0, 0, 1, 1,
0.1894214, -0.9167793, 1.938887, 0, 0, 0, 1, 1,
0.1906442, -0.4796505, 2.302743, 0, 0, 0, 1, 1,
0.1923207, 1.640526, 1.566135, 0, 0, 0, 1, 1,
0.1930727, 0.6224616, 1.126562, 0, 0, 0, 1, 1,
0.1964296, 0.1657926, 2.269501, 0, 0, 0, 1, 1,
0.1967843, 1.264603, -0.315942, 0, 0, 0, 1, 1,
0.1980733, 0.7884563, -2.051775, 1, 1, 1, 1, 1,
0.2027564, 0.5774575, 1.059041, 1, 1, 1, 1, 1,
0.2029477, 0.6727232, 0.6204708, 1, 1, 1, 1, 1,
0.2055959, 1.317398, -0.02654986, 1, 1, 1, 1, 1,
0.2078505, 0.09443466, 0.7571462, 1, 1, 1, 1, 1,
0.2123094, -0.6362775, 2.701166, 1, 1, 1, 1, 1,
0.214199, 1.73856, -0.3957463, 1, 1, 1, 1, 1,
0.2164122, -0.3371153, 3.560608, 1, 1, 1, 1, 1,
0.2180294, -0.9830991, 3.106921, 1, 1, 1, 1, 1,
0.2196173, -0.8934071, 1.448424, 1, 1, 1, 1, 1,
0.2239347, 1.567717, -0.05502322, 1, 1, 1, 1, 1,
0.2252936, 0.6671627, 0.9415851, 1, 1, 1, 1, 1,
0.2289831, 2.152217, 0.4444937, 1, 1, 1, 1, 1,
0.229808, 0.02304926, 1.486201, 1, 1, 1, 1, 1,
0.2315162, 0.4750786, 1.591261, 1, 1, 1, 1, 1,
0.2340293, 0.4502232, 0.2948264, 0, 0, 1, 1, 1,
0.2343921, -1.344883, 1.587168, 1, 0, 0, 1, 1,
0.235857, 0.5544367, 0.407788, 1, 0, 0, 1, 1,
0.2374863, 1.174035, -0.06439126, 1, 0, 0, 1, 1,
0.2394061, -0.6083044, 3.851373, 1, 0, 0, 1, 1,
0.2401415, 0.9487483, -0.3999388, 1, 0, 0, 1, 1,
0.2405184, -0.9993728, 3.431, 0, 0, 0, 1, 1,
0.2406769, -1.068667, 2.686447, 0, 0, 0, 1, 1,
0.2434505, -0.09281861, 0.9275863, 0, 0, 0, 1, 1,
0.2449232, 1.186421, 0.4902681, 0, 0, 0, 1, 1,
0.2459729, 1.196934, -0.5001281, 0, 0, 0, 1, 1,
0.2495226, -0.9749027, 1.350869, 0, 0, 0, 1, 1,
0.2545751, 0.7284489, 2.264128, 0, 0, 0, 1, 1,
0.2554116, -0.5802757, 2.730153, 1, 1, 1, 1, 1,
0.2576368, 0.1493623, 1.612947, 1, 1, 1, 1, 1,
0.2604761, 0.05242621, 1.740244, 1, 1, 1, 1, 1,
0.2628961, 1.658284, -1.984864, 1, 1, 1, 1, 1,
0.2664482, 2.164917, 1.071131, 1, 1, 1, 1, 1,
0.2695819, 0.05019731, 1.343231, 1, 1, 1, 1, 1,
0.2795211, -0.3685829, 3.91205, 1, 1, 1, 1, 1,
0.2827009, 0.2857748, 0.5139301, 1, 1, 1, 1, 1,
0.2864096, -0.4602938, 0.7236676, 1, 1, 1, 1, 1,
0.2887706, 1.179991, -2.046785, 1, 1, 1, 1, 1,
0.2890289, -0.5665003, 3.771189, 1, 1, 1, 1, 1,
0.2991742, 0.973147, 0.9403781, 1, 1, 1, 1, 1,
0.3013426, 1.243461, 0.4587607, 1, 1, 1, 1, 1,
0.302479, 1.681841, 0.5926602, 1, 1, 1, 1, 1,
0.3046397, 1.454848, 1.478469, 1, 1, 1, 1, 1,
0.3058081, -1.263985, 1.037679, 0, 0, 1, 1, 1,
0.3062795, -0.2575099, 1.279456, 1, 0, 0, 1, 1,
0.3091251, -0.1857296, 2.837548, 1, 0, 0, 1, 1,
0.3092783, -0.36075, 2.434222, 1, 0, 0, 1, 1,
0.3101426, 0.1490521, 2.486955, 1, 0, 0, 1, 1,
0.3106936, -0.8027612, 3.703386, 1, 0, 0, 1, 1,
0.3127618, 0.5291345, -0.7807131, 0, 0, 0, 1, 1,
0.3129801, -0.3955475, 4.599053, 0, 0, 0, 1, 1,
0.313271, 0.6740271, 1.754624, 0, 0, 0, 1, 1,
0.3148134, -0.3507297, 0.8844082, 0, 0, 0, 1, 1,
0.3199769, 1.183981, -1.403172, 0, 0, 0, 1, 1,
0.3219772, -0.4129879, 2.099993, 0, 0, 0, 1, 1,
0.3234823, 0.9905168, 2.185941, 0, 0, 0, 1, 1,
0.3238466, 0.4829039, 0.7648094, 1, 1, 1, 1, 1,
0.3242836, 0.581683, 0.473927, 1, 1, 1, 1, 1,
0.3247743, -0.6484932, 2.178268, 1, 1, 1, 1, 1,
0.3264013, 1.981456, 0.3883102, 1, 1, 1, 1, 1,
0.328883, 0.5039812, 0.7476561, 1, 1, 1, 1, 1,
0.3318938, 0.4971148, 2.075197, 1, 1, 1, 1, 1,
0.335164, 0.0333093, 1.870519, 1, 1, 1, 1, 1,
0.3358875, 0.2163064, 0.2207427, 1, 1, 1, 1, 1,
0.3380921, 0.5985718, -0.04158419, 1, 1, 1, 1, 1,
0.3389043, 0.6527296, -0.006098547, 1, 1, 1, 1, 1,
0.3408502, -0.04523134, 1.901071, 1, 1, 1, 1, 1,
0.3414373, 1.016709, -0.4596173, 1, 1, 1, 1, 1,
0.3474909, 0.6889771, 0.252064, 1, 1, 1, 1, 1,
0.3509258, -0.5576648, 3.331138, 1, 1, 1, 1, 1,
0.352237, 0.9113718, -1.090608, 1, 1, 1, 1, 1,
0.3628049, 0.4512604, -0.1130498, 0, 0, 1, 1, 1,
0.3649698, -0.1873628, 0.7969836, 1, 0, 0, 1, 1,
0.3651376, 1.404626, 0.2242372, 1, 0, 0, 1, 1,
0.3690944, -0.375356, 2.753782, 1, 0, 0, 1, 1,
0.3746733, 0.4723358, 0.9260421, 1, 0, 0, 1, 1,
0.3748498, 0.7014793, 0.7993383, 1, 0, 0, 1, 1,
0.3793035, 1.061021, -0.350747, 0, 0, 0, 1, 1,
0.3825782, -0.7214369, 0.9268377, 0, 0, 0, 1, 1,
0.3827299, 0.5864233, -0.6667566, 0, 0, 0, 1, 1,
0.3931516, -0.6807639, 1.933815, 0, 0, 0, 1, 1,
0.4062286, -0.6952136, 2.649923, 0, 0, 0, 1, 1,
0.4084616, 0.9909927, 1.459787, 0, 0, 0, 1, 1,
0.4114623, 0.3761584, 0.7044686, 0, 0, 0, 1, 1,
0.4114635, 0.8543588, 1.299379, 1, 1, 1, 1, 1,
0.4114991, -0.9120271, 4.176846, 1, 1, 1, 1, 1,
0.4123673, -0.4142874, 2.458261, 1, 1, 1, 1, 1,
0.4196785, -0.2838568, 2.317233, 1, 1, 1, 1, 1,
0.4274173, -0.8012694, 2.375196, 1, 1, 1, 1, 1,
0.4278708, 0.04462488, 1.372919, 1, 1, 1, 1, 1,
0.4318102, 1.708826, 0.9676181, 1, 1, 1, 1, 1,
0.4330156, 1.72795, 1.308501, 1, 1, 1, 1, 1,
0.4348569, -0.1726639, 1.059633, 1, 1, 1, 1, 1,
0.4356754, 0.6953616, 1.401621, 1, 1, 1, 1, 1,
0.4370979, 1.821308, 0.9794862, 1, 1, 1, 1, 1,
0.4420754, 0.2685739, 0.563395, 1, 1, 1, 1, 1,
0.4460666, 0.5607731, 0.6336597, 1, 1, 1, 1, 1,
0.4474472, -0.4251405, 1.688613, 1, 1, 1, 1, 1,
0.4497235, 0.2644216, 1.454438, 1, 1, 1, 1, 1,
0.4545874, 0.9553269, -1.295194, 0, 0, 1, 1, 1,
0.4566442, -1.652535, 2.953536, 1, 0, 0, 1, 1,
0.4573017, 1.373939, 0.5513468, 1, 0, 0, 1, 1,
0.4580053, 0.9154868, -0.5626274, 1, 0, 0, 1, 1,
0.4581089, -0.01481165, 1.26566, 1, 0, 0, 1, 1,
0.4586173, -0.2040522, 1.276946, 1, 0, 0, 1, 1,
0.4618391, -0.04448645, 0.6214452, 0, 0, 0, 1, 1,
0.4629597, 0.6311677, -1.0564, 0, 0, 0, 1, 1,
0.4644636, 1.730878, 0.2720083, 0, 0, 0, 1, 1,
0.4668446, 0.2588761, 1.167475, 0, 0, 0, 1, 1,
0.4670548, -0.8226819, 2.762135, 0, 0, 0, 1, 1,
0.4676889, -1.733023, 2.832789, 0, 0, 0, 1, 1,
0.4691606, 1.122329, 0.1715307, 0, 0, 0, 1, 1,
0.4739088, 1.914871, 0.6967817, 1, 1, 1, 1, 1,
0.4763841, -0.8482344, 2.513799, 1, 1, 1, 1, 1,
0.4803596, -0.7335271, 1.834962, 1, 1, 1, 1, 1,
0.4813434, 2.545143, -1.530765, 1, 1, 1, 1, 1,
0.4815737, -0.7012302, 2.995566, 1, 1, 1, 1, 1,
0.4828565, -1.053226, 2.776104, 1, 1, 1, 1, 1,
0.4841098, -0.459186, 2.673555, 1, 1, 1, 1, 1,
0.491228, -0.4551503, 1.473977, 1, 1, 1, 1, 1,
0.4915969, 0.7212967, 0.7510734, 1, 1, 1, 1, 1,
0.4921924, -2.343413, 2.73146, 1, 1, 1, 1, 1,
0.4925008, 0.1167984, 1.86934, 1, 1, 1, 1, 1,
0.4931115, -0.5956115, 3.064327, 1, 1, 1, 1, 1,
0.4944921, 0.07545441, 0.2335188, 1, 1, 1, 1, 1,
0.4956003, 0.05767303, 2.92627, 1, 1, 1, 1, 1,
0.4957873, 1.669897, 0.7507939, 1, 1, 1, 1, 1,
0.4963611, 1.065502, 1.544054, 0, 0, 1, 1, 1,
0.5015126, -1.781034, 3.006175, 1, 0, 0, 1, 1,
0.5067326, -1.399581, 3.748519, 1, 0, 0, 1, 1,
0.5153043, -1.075946, 4.445206, 1, 0, 0, 1, 1,
0.5172026, -0.2793168, 1.336236, 1, 0, 0, 1, 1,
0.520222, 0.8225859, 0.7102684, 1, 0, 0, 1, 1,
0.5242987, 0.4481093, 1.39766, 0, 0, 0, 1, 1,
0.5253058, -0.07500611, 1.377504, 0, 0, 0, 1, 1,
0.5262769, -0.3943174, 4.494984, 0, 0, 0, 1, 1,
0.5272042, 1.251796, -0.1073032, 0, 0, 0, 1, 1,
0.5294917, 0.1638465, 1.858153, 0, 0, 0, 1, 1,
0.5298019, -0.2396043, 2.907721, 0, 0, 0, 1, 1,
0.5303885, 0.6436649, -0.2552763, 0, 0, 0, 1, 1,
0.5311365, -0.3338328, 0.9050941, 1, 1, 1, 1, 1,
0.5324883, 0.3634835, -0.3674744, 1, 1, 1, 1, 1,
0.5342697, 1.069341, 0.5719475, 1, 1, 1, 1, 1,
0.5349394, 0.001560326, -0.2709811, 1, 1, 1, 1, 1,
0.5362724, 0.4835684, 0.2583852, 1, 1, 1, 1, 1,
0.5411693, 0.5960273, -1.125362, 1, 1, 1, 1, 1,
0.5452991, 1.295709, -0.9183171, 1, 1, 1, 1, 1,
0.5486905, 0.08689624, 1.290301, 1, 1, 1, 1, 1,
0.5489239, -1.846681, 3.065749, 1, 1, 1, 1, 1,
0.5533437, 0.785228, -0.3087244, 1, 1, 1, 1, 1,
0.5592091, 1.448912, 0.1575833, 1, 1, 1, 1, 1,
0.5614479, -0.3821488, 1.461978, 1, 1, 1, 1, 1,
0.5617337, -1.745663, 4.454459, 1, 1, 1, 1, 1,
0.565365, 1.194321, 0.2463306, 1, 1, 1, 1, 1,
0.5670558, -1.883627, 2.894995, 1, 1, 1, 1, 1,
0.5694678, 1.064248, 1.025379, 0, 0, 1, 1, 1,
0.5701815, -1.736095, 2.947873, 1, 0, 0, 1, 1,
0.573054, 1.783219, -1.009112, 1, 0, 0, 1, 1,
0.5775387, -0.1856521, 1.229517, 1, 0, 0, 1, 1,
0.583793, -1.046705, 1.459782, 1, 0, 0, 1, 1,
0.5871134, 2.358571, 1.587675, 1, 0, 0, 1, 1,
0.5875372, -1.06146, 3.590692, 0, 0, 0, 1, 1,
0.5939457, 0.4457742, 0.3201978, 0, 0, 0, 1, 1,
0.5958058, -0.3111011, 3.229416, 0, 0, 0, 1, 1,
0.6052383, -0.9969759, 2.078573, 0, 0, 0, 1, 1,
0.6103139, -1.017972, 1.715954, 0, 0, 0, 1, 1,
0.6104248, -0.7443492, 3.088988, 0, 0, 0, 1, 1,
0.6151676, -0.1661873, 3.179751, 0, 0, 0, 1, 1,
0.6154642, 1.34071, 0.304473, 1, 1, 1, 1, 1,
0.6197297, 1.214752, -1.153662, 1, 1, 1, 1, 1,
0.6245764, 0.5249408, 0.6898649, 1, 1, 1, 1, 1,
0.6275685, -2.258628, 3.4237, 1, 1, 1, 1, 1,
0.6295269, -0.946188, 3.147411, 1, 1, 1, 1, 1,
0.6297109, -0.8893152, 3.609016, 1, 1, 1, 1, 1,
0.6326922, 0.8926001, -0.3234276, 1, 1, 1, 1, 1,
0.6398377, -0.02272584, 1.415488, 1, 1, 1, 1, 1,
0.6404513, -1.473363, 1.541768, 1, 1, 1, 1, 1,
0.6416404, 1.968779, 1.654764, 1, 1, 1, 1, 1,
0.6434203, 0.3412532, 1.093783, 1, 1, 1, 1, 1,
0.6454811, 0.4146433, 2.276754, 1, 1, 1, 1, 1,
0.6473778, 0.05627104, 2.543193, 1, 1, 1, 1, 1,
0.6502324, 0.7361124, 0.8338301, 1, 1, 1, 1, 1,
0.6507775, -0.1452625, 1.556734, 1, 1, 1, 1, 1,
0.6510322, 0.5337921, 0.009568927, 0, 0, 1, 1, 1,
0.6527214, -0.07074306, 2.207954, 1, 0, 0, 1, 1,
0.6527746, 0.2971372, 1.682688, 1, 0, 0, 1, 1,
0.6579317, 2.743734, -1.7152, 1, 0, 0, 1, 1,
0.6598092, 0.9752491, 1.582798, 1, 0, 0, 1, 1,
0.6604814, -0.277537, 1.926164, 1, 0, 0, 1, 1,
0.6637201, -0.9391038, 2.361717, 0, 0, 0, 1, 1,
0.6709752, -0.001113459, 3.018952, 0, 0, 0, 1, 1,
0.6726646, -0.8919992, 2.260527, 0, 0, 0, 1, 1,
0.67374, 1.433536, 2.671038, 0, 0, 0, 1, 1,
0.6740152, -1.200613, 3.637623, 0, 0, 0, 1, 1,
0.6749365, -0.2029565, 1.24793, 0, 0, 0, 1, 1,
0.6842198, -1.872318, 1.333806, 0, 0, 0, 1, 1,
0.6852245, -0.321725, 1.556872, 1, 1, 1, 1, 1,
0.6899855, 0.1907296, 0.3568072, 1, 1, 1, 1, 1,
0.6900487, 1.463938, 0.5688495, 1, 1, 1, 1, 1,
0.706118, -0.8044795, 1.394744, 1, 1, 1, 1, 1,
0.7067254, 1.248882, -0.3394805, 1, 1, 1, 1, 1,
0.7109216, 0.5609702, 1.472297, 1, 1, 1, 1, 1,
0.7167718, 0.7754784, 0.08363795, 1, 1, 1, 1, 1,
0.7197995, 0.6806205, -0.2690412, 1, 1, 1, 1, 1,
0.7232037, -1.272278, 1.3975, 1, 1, 1, 1, 1,
0.7552879, 1.659938, 0.4378072, 1, 1, 1, 1, 1,
0.7600577, -0.8714926, 2.121249, 1, 1, 1, 1, 1,
0.7607239, 0.7565497, 0.4282597, 1, 1, 1, 1, 1,
0.7610068, 0.150149, 1.362929, 1, 1, 1, 1, 1,
0.7656875, -0.2915174, 0.6756802, 1, 1, 1, 1, 1,
0.7720925, -0.05319523, 1.861868, 1, 1, 1, 1, 1,
0.775413, 1.226515, 1.449476, 0, 0, 1, 1, 1,
0.7766529, -1.252136, 2.135564, 1, 0, 0, 1, 1,
0.7795408, 0.4040386, 0.8040985, 1, 0, 0, 1, 1,
0.7809308, 0.8132731, 2.14632, 1, 0, 0, 1, 1,
0.7892775, -0.2106588, 2.231057, 1, 0, 0, 1, 1,
0.7905201, -0.5498118, 0.7019008, 1, 0, 0, 1, 1,
0.7958072, 0.5972461, -0.3751303, 0, 0, 0, 1, 1,
0.798983, -1.323344, 2.742818, 0, 0, 0, 1, 1,
0.8023837, 0.2938477, 1.837457, 0, 0, 0, 1, 1,
0.8060451, 2.582587, -0.3945867, 0, 0, 0, 1, 1,
0.8151113, -0.7887231, 2.985994, 0, 0, 0, 1, 1,
0.8173392, -0.03868068, 1.726959, 0, 0, 0, 1, 1,
0.8177534, -0.07758088, 2.641761, 0, 0, 0, 1, 1,
0.8188527, -0.4943741, 1.177647, 1, 1, 1, 1, 1,
0.8266883, -0.4574508, 1.180257, 1, 1, 1, 1, 1,
0.8285359, -0.01912485, 2.500436, 1, 1, 1, 1, 1,
0.8379008, 1.356868, 2.504627, 1, 1, 1, 1, 1,
0.8390619, -0.06845601, 1.19156, 1, 1, 1, 1, 1,
0.8392813, -0.6280017, 2.498625, 1, 1, 1, 1, 1,
0.8428648, -3.35779, 4.331234, 1, 1, 1, 1, 1,
0.850485, 0.9117357, 2.186687, 1, 1, 1, 1, 1,
0.8506326, 0.6899949, 3.214444, 1, 1, 1, 1, 1,
0.8506567, 0.3059955, 0.4800939, 1, 1, 1, 1, 1,
0.8633884, -0.2858804, 1.86438, 1, 1, 1, 1, 1,
0.8640656, -0.5641648, 2.352837, 1, 1, 1, 1, 1,
0.8712435, -0.223303, 1.121088, 1, 1, 1, 1, 1,
0.8748919, 0.6859148, 0.235553, 1, 1, 1, 1, 1,
0.8768304, 1.549853, 1.757426, 1, 1, 1, 1, 1,
0.879209, 1.261868, -0.708685, 0, 0, 1, 1, 1,
0.8794776, 1.015249, 0.175781, 1, 0, 0, 1, 1,
0.880645, 0.8251115, 1.031502, 1, 0, 0, 1, 1,
0.8831252, 0.7812818, 0.9537102, 1, 0, 0, 1, 1,
0.8877043, -1.250113, 1.283835, 1, 0, 0, 1, 1,
0.8877321, -1.180349, 1.747733, 1, 0, 0, 1, 1,
0.890662, 0.4083964, 0.9646227, 0, 0, 0, 1, 1,
0.9038849, -0.4449347, 1.12633, 0, 0, 0, 1, 1,
0.9094992, -0.7764294, 2.303082, 0, 0, 0, 1, 1,
0.9100323, -1.285343, 2.948307, 0, 0, 0, 1, 1,
0.9103245, 0.4453367, 1.939656, 0, 0, 0, 1, 1,
0.9146796, -0.5951441, 0.7274147, 0, 0, 0, 1, 1,
0.9150836, -0.542289, 2.495328, 0, 0, 0, 1, 1,
0.9228117, 0.6190664, 0.2088621, 1, 1, 1, 1, 1,
0.9228259, -0.4485497, 4.018037, 1, 1, 1, 1, 1,
0.9293652, 0.1980674, 2.185641, 1, 1, 1, 1, 1,
0.9310413, -0.8399468, 2.233699, 1, 1, 1, 1, 1,
0.9325073, 0.887946, 0.2886058, 1, 1, 1, 1, 1,
0.9335598, 0.4556501, 1.848773, 1, 1, 1, 1, 1,
0.9379054, 0.9082166, 0.6569422, 1, 1, 1, 1, 1,
0.9388867, 0.9846493, 2.95389, 1, 1, 1, 1, 1,
0.9399102, 1.230348, -0.3022316, 1, 1, 1, 1, 1,
0.9410441, -2.077303, 3.036516, 1, 1, 1, 1, 1,
0.9460033, 0.0366159, 0.7050313, 1, 1, 1, 1, 1,
0.9506059, -0.267644, -0.3000704, 1, 1, 1, 1, 1,
0.9570804, 0.187201, 1.991382, 1, 1, 1, 1, 1,
0.9586068, -0.6531584, 3.112667, 1, 1, 1, 1, 1,
0.9694927, -1.110903, 2.731574, 1, 1, 1, 1, 1,
0.9702477, -1.711119, 2.156381, 0, 0, 1, 1, 1,
0.9724786, 2.22447, 0.8621392, 1, 0, 0, 1, 1,
0.9768491, 0.2642481, 1.528573, 1, 0, 0, 1, 1,
0.9769148, -0.7405547, 1.989121, 1, 0, 0, 1, 1,
0.9866039, 1.869663, 0.1359124, 1, 0, 0, 1, 1,
0.9881548, -0.5743788, 2.208165, 1, 0, 0, 1, 1,
0.9941453, -1.144438, 2.524072, 0, 0, 0, 1, 1,
0.9985459, -1.241804, 3.072916, 0, 0, 0, 1, 1,
1.003484, 0.4519413, 1.181087, 0, 0, 0, 1, 1,
1.003853, 0.2595187, 3.202348, 0, 0, 0, 1, 1,
1.008301, 0.3718406, 1.596866, 0, 0, 0, 1, 1,
1.009172, -1.849747, 1.543161, 0, 0, 0, 1, 1,
1.016203, 0.04905804, 2.661868, 0, 0, 0, 1, 1,
1.016221, 0.2494993, 1.204657, 1, 1, 1, 1, 1,
1.017382, -1.365297, 3.239094, 1, 1, 1, 1, 1,
1.018701, 0.9271258, 1.105868, 1, 1, 1, 1, 1,
1.020654, 0.4923259, 2.036019, 1, 1, 1, 1, 1,
1.022949, -0.8676656, 2.619046, 1, 1, 1, 1, 1,
1.025308, -2.126832, 2.157053, 1, 1, 1, 1, 1,
1.029026, 2.111138, 1.049692, 1, 1, 1, 1, 1,
1.036579, -1.052912, 0.4829413, 1, 1, 1, 1, 1,
1.040777, 0.4868717, 0.187923, 1, 1, 1, 1, 1,
1.040987, -0.6916933, 1.708904, 1, 1, 1, 1, 1,
1.043418, 1.409562, 0.4682375, 1, 1, 1, 1, 1,
1.045535, 1.356726, 0.6058196, 1, 1, 1, 1, 1,
1.046053, 0.9857212, 1.908011, 1, 1, 1, 1, 1,
1.050115, -1.043276, 2.573768, 1, 1, 1, 1, 1,
1.054425, -1.450985, 1.40968, 1, 1, 1, 1, 1,
1.062242, -0.4324246, 0.8144267, 0, 0, 1, 1, 1,
1.064887, 1.289925, 2.423235, 1, 0, 0, 1, 1,
1.071407, -0.05152206, 2.033589, 1, 0, 0, 1, 1,
1.072714, 2.325533, -0.7911757, 1, 0, 0, 1, 1,
1.075867, 1.07271, 0.9010437, 1, 0, 0, 1, 1,
1.080539, -0.4020448, 2.916009, 1, 0, 0, 1, 1,
1.086311, -1.011094, 3.472476, 0, 0, 0, 1, 1,
1.09473, 0.003875094, 1.9166, 0, 0, 0, 1, 1,
1.09545, 1.161607, -0.7590689, 0, 0, 0, 1, 1,
1.098886, 0.3920256, 1.544631, 0, 0, 0, 1, 1,
1.103613, 0.4459936, 0.4463285, 0, 0, 0, 1, 1,
1.108311, 1.207813, 0.1918937, 0, 0, 0, 1, 1,
1.118033, -0.9211251, 3.008911, 0, 0, 0, 1, 1,
1.139562, -0.03902285, 1.291177, 1, 1, 1, 1, 1,
1.148914, -0.1496671, 1.78111, 1, 1, 1, 1, 1,
1.153557, -0.02341309, 2.883939, 1, 1, 1, 1, 1,
1.154594, 0.295279, 1.882972, 1, 1, 1, 1, 1,
1.16185, 1.56945, 0.6001988, 1, 1, 1, 1, 1,
1.173612, -0.8395029, 1.695485, 1, 1, 1, 1, 1,
1.181028, -0.2724915, 1.990726, 1, 1, 1, 1, 1,
1.185023, 0.2857487, 2.126375, 1, 1, 1, 1, 1,
1.198257, 0.2455093, -0.3149979, 1, 1, 1, 1, 1,
1.199228, 2.046434, 2.796238, 1, 1, 1, 1, 1,
1.200057, -0.8870435, 2.589527, 1, 1, 1, 1, 1,
1.210771, 1.082398, -1.034321, 1, 1, 1, 1, 1,
1.220008, 0.3799911, -1.27651, 1, 1, 1, 1, 1,
1.231281, -1.2839, 0.4048524, 1, 1, 1, 1, 1,
1.235989, -0.7172022, 1.314583, 1, 1, 1, 1, 1,
1.237571, -1.026413, 2.587151, 0, 0, 1, 1, 1,
1.238028, -1.076886, 2.974657, 1, 0, 0, 1, 1,
1.253837, -1.774583, 3.262552, 1, 0, 0, 1, 1,
1.25444, -2.03268, 1.533969, 1, 0, 0, 1, 1,
1.254457, 0.3452358, 2.25594, 1, 0, 0, 1, 1,
1.258897, -0.8889852, 1.41324, 1, 0, 0, 1, 1,
1.259203, -0.2172453, 2.834537, 0, 0, 0, 1, 1,
1.26562, -1.058526, 0.6765609, 0, 0, 0, 1, 1,
1.266772, 0.1032425, 1.921629, 0, 0, 0, 1, 1,
1.276161, 0.7568438, 0.8830377, 0, 0, 0, 1, 1,
1.279861, -1.221694, 2.376032, 0, 0, 0, 1, 1,
1.284815, -0.8423507, 1.3934, 0, 0, 0, 1, 1,
1.288197, 0.4796004, 0.5328113, 0, 0, 0, 1, 1,
1.29038, 0.670818, 0.3151703, 1, 1, 1, 1, 1,
1.303592, 0.4713345, 0.1141267, 1, 1, 1, 1, 1,
1.307933, 1.623777, 0.5288537, 1, 1, 1, 1, 1,
1.329496, -1.160608, 3.750406, 1, 1, 1, 1, 1,
1.344523, -1.49509, 2.30911, 1, 1, 1, 1, 1,
1.376181, -0.0803849, 1.573012, 1, 1, 1, 1, 1,
1.392258, 1.976709, 1.860328, 1, 1, 1, 1, 1,
1.406309, 1.464741, -0.2764691, 1, 1, 1, 1, 1,
1.420412, 1.069804, 1.374185, 1, 1, 1, 1, 1,
1.423559, -0.6315143, 2.43035, 1, 1, 1, 1, 1,
1.424072, -0.1223087, 0.6608464, 1, 1, 1, 1, 1,
1.432586, -0.3290035, 3.771198, 1, 1, 1, 1, 1,
1.437149, 0.2272319, 0.8513293, 1, 1, 1, 1, 1,
1.438437, 0.04581697, 2.812724, 1, 1, 1, 1, 1,
1.445374, -1.197508, 2.051775, 1, 1, 1, 1, 1,
1.446037, -0.1467918, 1.631757, 0, 0, 1, 1, 1,
1.446084, -0.488223, 2.862352, 1, 0, 0, 1, 1,
1.446469, 0.7858804, 2.001361, 1, 0, 0, 1, 1,
1.455211, -0.6048288, 0.7644221, 1, 0, 0, 1, 1,
1.462923, 0.2413998, 1.587919, 1, 0, 0, 1, 1,
1.466494, -0.272222, 1.909472, 1, 0, 0, 1, 1,
1.46676, 0.7472046, 1.964347, 0, 0, 0, 1, 1,
1.468178, 0.5831165, 0.4541728, 0, 0, 0, 1, 1,
1.472666, -0.09898955, 1.448176, 0, 0, 0, 1, 1,
1.477074, -0.5516573, 2.500834, 0, 0, 0, 1, 1,
1.499245, -0.7839132, 2.104217, 0, 0, 0, 1, 1,
1.501425, 1.014977, 1.403023, 0, 0, 0, 1, 1,
1.513871, 0.1867145, -0.04510577, 0, 0, 0, 1, 1,
1.542313, -1.401718, 3.695035, 1, 1, 1, 1, 1,
1.543474, 0.02614221, 0.9254212, 1, 1, 1, 1, 1,
1.562338, 0.02395145, 2.830963, 1, 1, 1, 1, 1,
1.563302, -0.08352559, 0.0988377, 1, 1, 1, 1, 1,
1.576801, -0.8924026, 2.416988, 1, 1, 1, 1, 1,
1.583763, 0.498999, 1.24352, 1, 1, 1, 1, 1,
1.587613, -0.646543, 3.320309, 1, 1, 1, 1, 1,
1.589265, -0.2635867, 2.229727, 1, 1, 1, 1, 1,
1.643376, 1.065697, 2.347001, 1, 1, 1, 1, 1,
1.657832, 1.000646, -0.07437927, 1, 1, 1, 1, 1,
1.658046, 0.0784363, -0.1039112, 1, 1, 1, 1, 1,
1.662863, 0.2822431, 2.368363, 1, 1, 1, 1, 1,
1.66898, 0.4683846, 2.459918, 1, 1, 1, 1, 1,
1.6717, -0.5122032, 1.827673, 1, 1, 1, 1, 1,
1.672207, -1.285846, 2.307187, 1, 1, 1, 1, 1,
1.684272, 0.03912149, -0.6578127, 0, 0, 1, 1, 1,
1.717558, 0.7095011, 0.7353446, 1, 0, 0, 1, 1,
1.734309, -0.09076568, 0.2569036, 1, 0, 0, 1, 1,
1.735258, -0.7579176, 1.501112, 1, 0, 0, 1, 1,
1.757661, -1.009502, 1.583095, 1, 0, 0, 1, 1,
1.769366, -0.2570325, 1.91722, 1, 0, 0, 1, 1,
1.783709, -2.094779, 2.199736, 0, 0, 0, 1, 1,
1.784438, -1.342966, 2.011203, 0, 0, 0, 1, 1,
1.790267, -0.08567671, 3.842854, 0, 0, 0, 1, 1,
1.798454, -1.002011, 2.541475, 0, 0, 0, 1, 1,
1.802265, -0.009955537, 1.094312, 0, 0, 0, 1, 1,
1.802604, -1.442673, 3.264213, 0, 0, 0, 1, 1,
1.807499, -0.3008446, 1.113224, 0, 0, 0, 1, 1,
1.813135, -0.7031629, 1.156013, 1, 1, 1, 1, 1,
1.821026, 0.641491, 0.3252853, 1, 1, 1, 1, 1,
1.827768, 1.098126, -0.2179562, 1, 1, 1, 1, 1,
1.860527, -0.8117791, 1.167644, 1, 1, 1, 1, 1,
1.883694, 1.188663, 1.914153, 1, 1, 1, 1, 1,
1.900439, -0.4351853, 1.550913, 1, 1, 1, 1, 1,
1.93667, 1.956406, -0.3767361, 1, 1, 1, 1, 1,
1.965482, -1.033106, 2.425362, 1, 1, 1, 1, 1,
1.979362, -0.2802878, -0.120956, 1, 1, 1, 1, 1,
1.989754, -0.8354473, 2.882424, 1, 1, 1, 1, 1,
2.007303, -0.2368531, 0.4737835, 1, 1, 1, 1, 1,
2.009356, 0.4388745, -0.244437, 1, 1, 1, 1, 1,
2.024269, 0.9227539, 2.040827, 1, 1, 1, 1, 1,
2.036497, -1.282669, 0.8848605, 1, 1, 1, 1, 1,
2.071756, -0.2745806, -0.3427746, 1, 1, 1, 1, 1,
2.096237, 0.7488751, 0.7967977, 0, 0, 1, 1, 1,
2.110746, -0.006695792, 0.4218484, 1, 0, 0, 1, 1,
2.114769, 0.6320873, 1.842062, 1, 0, 0, 1, 1,
2.133134, 0.7537181, 2.683327, 1, 0, 0, 1, 1,
2.178638, 1.606383, 2.265514, 1, 0, 0, 1, 1,
2.204026, 0.004145323, 2.086165, 1, 0, 0, 1, 1,
2.247499, 0.1788778, -0.01379374, 0, 0, 0, 1, 1,
2.253626, -0.7925793, 2.254642, 0, 0, 0, 1, 1,
2.305437, 1.5324, 0.4321015, 0, 0, 0, 1, 1,
2.318766, -0.2325379, 1.539505, 0, 0, 0, 1, 1,
2.381821, 0.2216447, 0.8602964, 0, 0, 0, 1, 1,
2.55869, -1.332728, 1.857415, 0, 0, 0, 1, 1,
2.565963, -1.008871, 0.9320498, 0, 0, 0, 1, 1,
2.622755, 1.181153, 1.467641, 1, 1, 1, 1, 1,
2.649313, -1.219053, 1.677255, 1, 1, 1, 1, 1,
2.671811, 0.3622656, 0.7254618, 1, 1, 1, 1, 1,
2.692124, 0.7954514, 2.158587, 1, 1, 1, 1, 1,
2.754857, -1.214526, 0.5997007, 1, 1, 1, 1, 1,
2.90726, -0.2968775, 2.375429, 1, 1, 1, 1, 1,
3.263829, -1.013273, 0.8668247, 1, 1, 1, 1, 1
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
var radius = 9.298222;
var distance = 32.65961;
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
mvMatrix.translate( 0.05386972, 0.2437619, 0.356189 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.65961);
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
