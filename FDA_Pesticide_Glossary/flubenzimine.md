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
-3.863685, -1.03333, -0.3021445, 1, 0, 0, 1,
-2.871363, 0.07296502, -1.564324, 1, 0.007843138, 0, 1,
-2.785239, 0.224842, -0.3166514, 1, 0.01176471, 0, 1,
-2.778671, 0.2543919, -1.685928, 1, 0.01960784, 0, 1,
-2.752577, -1.949824, -1.759341, 1, 0.02352941, 0, 1,
-2.716061, -0.5169668, -1.32167, 1, 0.03137255, 0, 1,
-2.707223, -0.09665939, -1.456362, 1, 0.03529412, 0, 1,
-2.675435, 0.708933, -0.09534136, 1, 0.04313726, 0, 1,
-2.488588, 0.2300068, -2.706248, 1, 0.04705882, 0, 1,
-2.408451, -1.485543, -3.030911, 1, 0.05490196, 0, 1,
-2.390598, 1.358348, -0.2309272, 1, 0.05882353, 0, 1,
-2.315896, -0.03283722, -2.215452, 1, 0.06666667, 0, 1,
-2.302667, -0.2301645, -2.208853, 1, 0.07058824, 0, 1,
-2.300032, 0.7079037, -1.085723, 1, 0.07843138, 0, 1,
-2.264928, -2.254464, -2.677583, 1, 0.08235294, 0, 1,
-2.251727, 1.180334, -2.065204, 1, 0.09019608, 0, 1,
-2.196854, -2.052072, -3.556483, 1, 0.09411765, 0, 1,
-2.136289, 0.8425016, 0.2557661, 1, 0.1019608, 0, 1,
-2.077105, 1.235601, -0.42622, 1, 0.1098039, 0, 1,
-2.033005, 1.158729, -2.678858, 1, 0.1137255, 0, 1,
-2.000511, -0.5991697, -2.844432, 1, 0.1215686, 0, 1,
-1.993566, -1.088891, -2.32416, 1, 0.1254902, 0, 1,
-1.979268, 0.3883625, -2.63606, 1, 0.1333333, 0, 1,
-1.968652, 0.5278057, -1.995271, 1, 0.1372549, 0, 1,
-1.964639, 1.494944, -0.237708, 1, 0.145098, 0, 1,
-1.945875, -0.1749121, -0.5433354, 1, 0.1490196, 0, 1,
-1.913249, 1.499811, -2.823407, 1, 0.1568628, 0, 1,
-1.900625, -0.1444038, -2.8105, 1, 0.1607843, 0, 1,
-1.886489, -1.817352, -2.261726, 1, 0.1686275, 0, 1,
-1.878945, 0.8570351, 0.1806273, 1, 0.172549, 0, 1,
-1.874588, -0.7729531, -2.46454, 1, 0.1803922, 0, 1,
-1.861039, 1.185929, 1.463221, 1, 0.1843137, 0, 1,
-1.86079, -0.0033669, -1.790453, 1, 0.1921569, 0, 1,
-1.860385, -0.0603002, -1.745875, 1, 0.1960784, 0, 1,
-1.826479, 0.791424, -0.9047046, 1, 0.2039216, 0, 1,
-1.798628, 0.2445128, 0.1673814, 1, 0.2117647, 0, 1,
-1.797468, -1.088531, -2.657158, 1, 0.2156863, 0, 1,
-1.79478, 0.9353359, -1.870001, 1, 0.2235294, 0, 1,
-1.777743, 1.686348, -1.059449, 1, 0.227451, 0, 1,
-1.755536, 0.8090653, -1.975701, 1, 0.2352941, 0, 1,
-1.716687, 1.27707, -0.04921194, 1, 0.2392157, 0, 1,
-1.715053, -0.993687, -2.834935, 1, 0.2470588, 0, 1,
-1.713477, 0.9469576, -0.7615901, 1, 0.2509804, 0, 1,
-1.685924, -0.7090117, -1.538865, 1, 0.2588235, 0, 1,
-1.658007, 0.4663118, -3.769699, 1, 0.2627451, 0, 1,
-1.638629, -1.476453, -2.921841, 1, 0.2705882, 0, 1,
-1.608723, -1.445996, -2.321512, 1, 0.2745098, 0, 1,
-1.606254, -2.828448, -3.308765, 1, 0.282353, 0, 1,
-1.60309, 1.071328, -0.6665382, 1, 0.2862745, 0, 1,
-1.595009, -0.7851871, -2.114479, 1, 0.2941177, 0, 1,
-1.593338, 0.08070643, -3.001182, 1, 0.3019608, 0, 1,
-1.587407, 2.286915, -0.5723974, 1, 0.3058824, 0, 1,
-1.573738, 0.1318713, -2.938989, 1, 0.3137255, 0, 1,
-1.571694, 0.9325649, -0.4655817, 1, 0.3176471, 0, 1,
-1.55922, 0.5207245, -1.675338, 1, 0.3254902, 0, 1,
-1.551765, 0.1770221, -1.106996, 1, 0.3294118, 0, 1,
-1.527959, -0.5350953, -2.191447, 1, 0.3372549, 0, 1,
-1.515053, 0.5266461, -1.553362, 1, 0.3411765, 0, 1,
-1.511441, -1.881048, -1.518112, 1, 0.3490196, 0, 1,
-1.50885, -0.7806141, -1.844486, 1, 0.3529412, 0, 1,
-1.496867, -2.148605, -2.00303, 1, 0.3607843, 0, 1,
-1.496691, 0.03236454, -2.247207, 1, 0.3647059, 0, 1,
-1.496647, -1.214957, -0.190553, 1, 0.372549, 0, 1,
-1.494837, 0.637788, -0.3026447, 1, 0.3764706, 0, 1,
-1.47508, -1.594034, -2.867666, 1, 0.3843137, 0, 1,
-1.470413, 0.2446333, -1.524626, 1, 0.3882353, 0, 1,
-1.454536, -3.257154, -4.577188, 1, 0.3960784, 0, 1,
-1.448767, 2.382359, 0.03070456, 1, 0.4039216, 0, 1,
-1.439691, -1.02427, -3.041011, 1, 0.4078431, 0, 1,
-1.437643, -0.5280209, -1.99757, 1, 0.4156863, 0, 1,
-1.419968, -0.08680554, -1.106051, 1, 0.4196078, 0, 1,
-1.417498, 0.9657863, -1.432577, 1, 0.427451, 0, 1,
-1.414888, -0.977861, -2.208819, 1, 0.4313726, 0, 1,
-1.413124, 3.01633, -1.278309, 1, 0.4392157, 0, 1,
-1.407226, -0.644009, -1.957486, 1, 0.4431373, 0, 1,
-1.39995, 0.7921232, -2.083648, 1, 0.4509804, 0, 1,
-1.388034, -1.555239, -2.47605, 1, 0.454902, 0, 1,
-1.379849, -0.535632, -2.980169, 1, 0.4627451, 0, 1,
-1.37496, -0.8936726, -1.537124, 1, 0.4666667, 0, 1,
-1.374357, -0.9178932, 0.4368203, 1, 0.4745098, 0, 1,
-1.365929, 0.5193362, -0.9288925, 1, 0.4784314, 0, 1,
-1.357999, 0.9504897, -1.073018, 1, 0.4862745, 0, 1,
-1.346711, -0.1617276, -1.54336, 1, 0.4901961, 0, 1,
-1.329567, 0.04471397, -0.7017589, 1, 0.4980392, 0, 1,
-1.32804, 1.098873, 0.5623113, 1, 0.5058824, 0, 1,
-1.327063, -0.6211842, -0.8097874, 1, 0.509804, 0, 1,
-1.3243, -1.460064, -3.546671, 1, 0.5176471, 0, 1,
-1.324076, 1.03827, 1.069525, 1, 0.5215687, 0, 1,
-1.311376, -1.271393, -3.560932, 1, 0.5294118, 0, 1,
-1.299332, -0.7989429, -3.411391, 1, 0.5333334, 0, 1,
-1.264663, -0.3274409, -2.708289, 1, 0.5411765, 0, 1,
-1.262208, -0.5145406, -2.023535, 1, 0.5450981, 0, 1,
-1.24924, -1.004259, -1.862452, 1, 0.5529412, 0, 1,
-1.244917, 0.1157378, -1.722767, 1, 0.5568628, 0, 1,
-1.243479, 1.047889, -0.2644834, 1, 0.5647059, 0, 1,
-1.229882, 2.032791, 0.5285639, 1, 0.5686275, 0, 1,
-1.22762, -0.4172348, -2.433149, 1, 0.5764706, 0, 1,
-1.22378, 0.6303048, -1.59126, 1, 0.5803922, 0, 1,
-1.212759, -0.4797032, -2.723514, 1, 0.5882353, 0, 1,
-1.207143, 0.9694278, -0.6576768, 1, 0.5921569, 0, 1,
-1.204382, 0.9605579, 0.06074689, 1, 0.6, 0, 1,
-1.198454, -0.3716267, -3.586229, 1, 0.6078432, 0, 1,
-1.196074, -0.2956406, -2.630813, 1, 0.6117647, 0, 1,
-1.185068, -0.7404146, -1.80459, 1, 0.6196079, 0, 1,
-1.168827, 0.240407, -0.3732686, 1, 0.6235294, 0, 1,
-1.163902, 0.5231209, -3.501651, 1, 0.6313726, 0, 1,
-1.150738, -0.7496985, -3.049403, 1, 0.6352941, 0, 1,
-1.136371, -0.3935231, -1.44515, 1, 0.6431373, 0, 1,
-1.135726, -1.371558, -2.656012, 1, 0.6470588, 0, 1,
-1.131392, -1.148484, -2.77842, 1, 0.654902, 0, 1,
-1.128352, 0.4337384, -0.6409186, 1, 0.6588235, 0, 1,
-1.126105, -0.5182185, -0.8332758, 1, 0.6666667, 0, 1,
-1.125357, -0.138606, -2.401479, 1, 0.6705883, 0, 1,
-1.118128, -0.4453866, -3.692331, 1, 0.6784314, 0, 1,
-1.109735, 1.32115, -0.524662, 1, 0.682353, 0, 1,
-1.104358, 0.6913971, -1.685906, 1, 0.6901961, 0, 1,
-1.103493, 0.3907554, -1.840325, 1, 0.6941177, 0, 1,
-1.096473, -2.01995, -3.654728, 1, 0.7019608, 0, 1,
-1.090095, 1.115002, -1.400954, 1, 0.7098039, 0, 1,
-1.078969, -0.05143126, -1.234718, 1, 0.7137255, 0, 1,
-1.07501, -1.239236, -2.251354, 1, 0.7215686, 0, 1,
-1.074749, 1.200321, -2.342139, 1, 0.7254902, 0, 1,
-1.072724, 0.013591, -1.768901, 1, 0.7333333, 0, 1,
-1.07028, -0.5579408, -1.765847, 1, 0.7372549, 0, 1,
-1.068802, -0.7982476, -1.836377, 1, 0.7450981, 0, 1,
-1.066678, -0.5362413, -1.833658, 1, 0.7490196, 0, 1,
-1.06465, -0.1814097, -0.4807901, 1, 0.7568628, 0, 1,
-1.059906, -0.7621204, -0.6415026, 1, 0.7607843, 0, 1,
-1.053875, 1.641344, -1.178329, 1, 0.7686275, 0, 1,
-1.05305, 0.09855889, -0.864324, 1, 0.772549, 0, 1,
-1.045822, 1.84837, -1.021045, 1, 0.7803922, 0, 1,
-1.040169, -1.733945, -3.471483, 1, 0.7843137, 0, 1,
-1.035136, 0.1920952, -0.9492974, 1, 0.7921569, 0, 1,
-1.026079, -1.275645, -1.684724, 1, 0.7960784, 0, 1,
-1.008474, 0.9288445, -1.50755, 1, 0.8039216, 0, 1,
-1.007263, -0.9742134, -2.374205, 1, 0.8117647, 0, 1,
-1.005008, -1.399172, -0.7570903, 1, 0.8156863, 0, 1,
-0.9980582, 0.5374235, -0.9722748, 1, 0.8235294, 0, 1,
-0.9935704, 1.377228, 0.5728738, 1, 0.827451, 0, 1,
-0.9929525, -0.6158026, -1.668511, 1, 0.8352941, 0, 1,
-0.9912493, 1.005273, -1.912031, 1, 0.8392157, 0, 1,
-0.9838111, -0.3573253, -2.69717, 1, 0.8470588, 0, 1,
-0.9757118, 1.005661, -0.8508927, 1, 0.8509804, 0, 1,
-0.9669788, 0.2265163, -1.741143, 1, 0.8588235, 0, 1,
-0.961511, -1.378453, -2.27597, 1, 0.8627451, 0, 1,
-0.9547327, -0.540556, -2.374457, 1, 0.8705882, 0, 1,
-0.95083, 0.09724562, -1.693643, 1, 0.8745098, 0, 1,
-0.9481538, -0.6800102, -2.8956, 1, 0.8823529, 0, 1,
-0.9439486, -0.1479995, -3.14219, 1, 0.8862745, 0, 1,
-0.940661, -2.084496, -2.196417, 1, 0.8941177, 0, 1,
-0.9400386, -1.259922, -2.372003, 1, 0.8980392, 0, 1,
-0.9299023, -0.3739624, -1.688768, 1, 0.9058824, 0, 1,
-0.9283241, 0.6638004, -2.049142, 1, 0.9137255, 0, 1,
-0.9264006, 1.946899, -1.662464, 1, 0.9176471, 0, 1,
-0.9258785, -0.1911288, -1.277168, 1, 0.9254902, 0, 1,
-0.9106838, 0.9111369, -0.4466401, 1, 0.9294118, 0, 1,
-0.9080674, -0.02436806, -0.1972832, 1, 0.9372549, 0, 1,
-0.8863364, 1.210478, -0.672676, 1, 0.9411765, 0, 1,
-0.885671, 0.9866983, -1.563324, 1, 0.9490196, 0, 1,
-0.8796764, 0.5533494, -1.131386, 1, 0.9529412, 0, 1,
-0.8774161, -0.6582075, -2.246006, 1, 0.9607843, 0, 1,
-0.8749521, 0.4405352, -1.850236, 1, 0.9647059, 0, 1,
-0.8729853, 0.9067935, 0.2117369, 1, 0.972549, 0, 1,
-0.8707074, 0.4753681, -2.542264, 1, 0.9764706, 0, 1,
-0.8697912, -3.715392, -2.432192, 1, 0.9843137, 0, 1,
-0.8685139, 0.3496242, -1.162754, 1, 0.9882353, 0, 1,
-0.8679084, 0.03683127, -0.2413751, 1, 0.9960784, 0, 1,
-0.8671331, -0.03293554, -1.630494, 0.9960784, 1, 0, 1,
-0.8663971, 0.7383212, -2.810509, 0.9921569, 1, 0, 1,
-0.8648206, 1.224962, -1.578606, 0.9843137, 1, 0, 1,
-0.8628558, -0.5537446, -3.161363, 0.9803922, 1, 0, 1,
-0.859837, 0.1116795, -1.932251, 0.972549, 1, 0, 1,
-0.8551424, -0.02636734, -1.801237, 0.9686275, 1, 0, 1,
-0.8512791, -0.8737473, -3.856146, 0.9607843, 1, 0, 1,
-0.8458864, 0.5739986, -1.186904, 0.9568627, 1, 0, 1,
-0.8376791, 0.1957236, -1.53338, 0.9490196, 1, 0, 1,
-0.8350531, 0.8422417, -0.4983434, 0.945098, 1, 0, 1,
-0.824697, -0.7049506, -3.950801, 0.9372549, 1, 0, 1,
-0.8228881, -0.554903, -0.6090816, 0.9333333, 1, 0, 1,
-0.8012613, 1.05187, -0.9613565, 0.9254902, 1, 0, 1,
-0.7909934, 0.1727235, 1.471338, 0.9215686, 1, 0, 1,
-0.7812115, -1.432864, -1.164098, 0.9137255, 1, 0, 1,
-0.7719201, 1.503263, -0.3574534, 0.9098039, 1, 0, 1,
-0.7670968, -0.1961707, -4.514851, 0.9019608, 1, 0, 1,
-0.7656212, -2.950022, -2.304027, 0.8941177, 1, 0, 1,
-0.7641698, -1.363878, -3.41481, 0.8901961, 1, 0, 1,
-0.7613988, 1.127257, 0.1907065, 0.8823529, 1, 0, 1,
-0.7603893, 1.242874, -0.284212, 0.8784314, 1, 0, 1,
-0.759056, -0.7065329, -2.218827, 0.8705882, 1, 0, 1,
-0.7588792, -0.2217116, -4.34955, 0.8666667, 1, 0, 1,
-0.754863, -0.653864, -2.040289, 0.8588235, 1, 0, 1,
-0.7535132, 0.4429241, -2.036311, 0.854902, 1, 0, 1,
-0.7512611, -0.2483628, -2.64586, 0.8470588, 1, 0, 1,
-0.7510482, 0.2693477, -1.829224, 0.8431373, 1, 0, 1,
-0.7482603, -0.6866648, -0.7441475, 0.8352941, 1, 0, 1,
-0.7456194, 0.8019498, -1.410354, 0.8313726, 1, 0, 1,
-0.7438635, 3.25899, 0.4744149, 0.8235294, 1, 0, 1,
-0.7404683, 0.8229637, -0.7386045, 0.8196079, 1, 0, 1,
-0.7372401, 1.658564, 0.06392583, 0.8117647, 1, 0, 1,
-0.7333223, -1.504502, -4.0792, 0.8078431, 1, 0, 1,
-0.7327015, 0.8703384, 2.659476, 0.8, 1, 0, 1,
-0.7307364, 0.3973815, -1.010796, 0.7921569, 1, 0, 1,
-0.7268283, 0.1554337, -0.4463171, 0.7882353, 1, 0, 1,
-0.7245889, -0.6008353, -2.95531, 0.7803922, 1, 0, 1,
-0.7244343, -1.878692, -2.541473, 0.7764706, 1, 0, 1,
-0.7231163, -0.01223249, -1.700257, 0.7686275, 1, 0, 1,
-0.7195556, -0.8034719, -2.344686, 0.7647059, 1, 0, 1,
-0.719028, 0.6537253, -0.457907, 0.7568628, 1, 0, 1,
-0.7166308, 1.619238, -0.2567117, 0.7529412, 1, 0, 1,
-0.7163652, -1.114665, -3.802889, 0.7450981, 1, 0, 1,
-0.7117537, -0.1914878, -1.673169, 0.7411765, 1, 0, 1,
-0.7100273, 1.235552, -0.2551118, 0.7333333, 1, 0, 1,
-0.7005438, -1.148291, -2.358527, 0.7294118, 1, 0, 1,
-0.6925761, -0.9512729, -3.509497, 0.7215686, 1, 0, 1,
-0.6893282, -1.212874, -2.88365, 0.7176471, 1, 0, 1,
-0.688444, -1.626116, -3.188093, 0.7098039, 1, 0, 1,
-0.6873017, 0.218133, -1.306319, 0.7058824, 1, 0, 1,
-0.6805743, 0.3879414, -0.5617242, 0.6980392, 1, 0, 1,
-0.6769749, -0.06857448, -2.775791, 0.6901961, 1, 0, 1,
-0.6741099, -2.185392, -1.23835, 0.6862745, 1, 0, 1,
-0.6704962, -1.363724, -2.909076, 0.6784314, 1, 0, 1,
-0.6704337, -0.05696026, -1.513578, 0.6745098, 1, 0, 1,
-0.6670137, -0.4803879, -2.844514, 0.6666667, 1, 0, 1,
-0.6660395, -0.421766, -1.83293, 0.6627451, 1, 0, 1,
-0.6626167, -0.4158623, -3.007446, 0.654902, 1, 0, 1,
-0.6555021, -0.4669563, -1.117036, 0.6509804, 1, 0, 1,
-0.6552668, 0.2994801, -1.59841, 0.6431373, 1, 0, 1,
-0.6542582, -0.1097284, -3.289471, 0.6392157, 1, 0, 1,
-0.651907, 0.2457694, -0.5265701, 0.6313726, 1, 0, 1,
-0.6460586, 0.3880013, -0.99166, 0.627451, 1, 0, 1,
-0.6438904, 1.164239, -1.855004, 0.6196079, 1, 0, 1,
-0.643014, -1.788651, -2.227329, 0.6156863, 1, 0, 1,
-0.6428723, -1.293582, -3.232969, 0.6078432, 1, 0, 1,
-0.6418035, -1.357742, -4.183563, 0.6039216, 1, 0, 1,
-0.6376002, 1.287756, -0.4090595, 0.5960785, 1, 0, 1,
-0.6371132, 0.1848532, -1.945536, 0.5882353, 1, 0, 1,
-0.635254, 0.7237129, -0.2710196, 0.5843138, 1, 0, 1,
-0.6273081, 1.237086, -0.7963799, 0.5764706, 1, 0, 1,
-0.6242393, -0.5009786, -2.698801, 0.572549, 1, 0, 1,
-0.6129514, 0.7929991, -1.121668, 0.5647059, 1, 0, 1,
-0.6123905, -0.3970979, -2.773751, 0.5607843, 1, 0, 1,
-0.6079526, -0.4927774, -1.462163, 0.5529412, 1, 0, 1,
-0.6023146, 1.432095, 0.4062219, 0.5490196, 1, 0, 1,
-0.6017206, -1.599464, -4.064986, 0.5411765, 1, 0, 1,
-0.5995727, 1.615855, -0.7413464, 0.5372549, 1, 0, 1,
-0.5971885, -0.07196593, -1.512683, 0.5294118, 1, 0, 1,
-0.5944269, 0.08599959, -0.5830331, 0.5254902, 1, 0, 1,
-0.5904598, 1.178918, -1.536187, 0.5176471, 1, 0, 1,
-0.5882117, 1.12733, -1.153823, 0.5137255, 1, 0, 1,
-0.586215, -0.5234523, -3.446112, 0.5058824, 1, 0, 1,
-0.579517, 0.6609545, -1.967267, 0.5019608, 1, 0, 1,
-0.5709211, 0.8256496, -1.399298, 0.4941176, 1, 0, 1,
-0.5681263, -1.283629, -1.729196, 0.4862745, 1, 0, 1,
-0.5680524, 0.1250498, -3.760064, 0.4823529, 1, 0, 1,
-0.5672538, -0.96071, -1.332145, 0.4745098, 1, 0, 1,
-0.5645421, 0.8974057, 0.5272904, 0.4705882, 1, 0, 1,
-0.5641135, -0.07053348, -1.142317, 0.4627451, 1, 0, 1,
-0.5640126, 1.837044, 0.4723319, 0.4588235, 1, 0, 1,
-0.5613858, -0.4658092, -2.37941, 0.4509804, 1, 0, 1,
-0.5601097, 2.844187, 1.546807, 0.4470588, 1, 0, 1,
-0.5550754, -0.7701062, -2.842897, 0.4392157, 1, 0, 1,
-0.5480089, -0.008870958, 0.07232336, 0.4352941, 1, 0, 1,
-0.547796, -1.134023, -3.14212, 0.427451, 1, 0, 1,
-0.5476853, -1.210566, -3.374777, 0.4235294, 1, 0, 1,
-0.5456979, 0.6496189, -2.005325, 0.4156863, 1, 0, 1,
-0.5414461, -0.7950457, -3.554652, 0.4117647, 1, 0, 1,
-0.5404392, 1.270053, 0.2029306, 0.4039216, 1, 0, 1,
-0.5391484, -0.8170778, -2.990628, 0.3960784, 1, 0, 1,
-0.5389318, -0.6411535, -2.457159, 0.3921569, 1, 0, 1,
-0.5326912, 0.2699093, 0.4093802, 0.3843137, 1, 0, 1,
-0.5306458, 0.5033908, -2.57743, 0.3803922, 1, 0, 1,
-0.5292592, -0.9122357, -2.121585, 0.372549, 1, 0, 1,
-0.5286782, 1.617361, 0.5084448, 0.3686275, 1, 0, 1,
-0.5285744, -1.22077, -1.53739, 0.3607843, 1, 0, 1,
-0.5269021, 0.2531302, -2.659762, 0.3568628, 1, 0, 1,
-0.5245067, -0.7336606, -3.429724, 0.3490196, 1, 0, 1,
-0.5224298, 0.06997448, 0.7391383, 0.345098, 1, 0, 1,
-0.5180095, 0.6248906, -0.6088699, 0.3372549, 1, 0, 1,
-0.5176203, -0.2833176, -2.692316, 0.3333333, 1, 0, 1,
-0.5171632, -0.6568212, -1.940757, 0.3254902, 1, 0, 1,
-0.5168224, 0.6009058, -1.263094, 0.3215686, 1, 0, 1,
-0.5131034, 0.5438672, -0.2450539, 0.3137255, 1, 0, 1,
-0.512418, 0.6356847, -0.7417671, 0.3098039, 1, 0, 1,
-0.5104934, 0.1219838, -1.546118, 0.3019608, 1, 0, 1,
-0.4965396, 1.314191, -1.86384, 0.2941177, 1, 0, 1,
-0.4927356, 0.6862321, -0.6903247, 0.2901961, 1, 0, 1,
-0.4922053, -0.4398389, -2.885976, 0.282353, 1, 0, 1,
-0.4910566, 1.503718, 0.07987095, 0.2784314, 1, 0, 1,
-0.4904082, 0.6092988, -0.5842671, 0.2705882, 1, 0, 1,
-0.4867879, -1.201744, -2.599454, 0.2666667, 1, 0, 1,
-0.4865605, 0.8151965, -1.796407, 0.2588235, 1, 0, 1,
-0.4847934, -0.123356, -3.074556, 0.254902, 1, 0, 1,
-0.4828582, -0.1947355, -2.039952, 0.2470588, 1, 0, 1,
-0.4787204, 0.2712126, -1.403713, 0.2431373, 1, 0, 1,
-0.4775347, 1.515006, -0.5703082, 0.2352941, 1, 0, 1,
-0.4712526, -0.4163094, -2.957104, 0.2313726, 1, 0, 1,
-0.4709408, -0.2791029, -1.349907, 0.2235294, 1, 0, 1,
-0.4697096, -0.4953621, -2.188562, 0.2196078, 1, 0, 1,
-0.4678729, 0.4134841, -0.4723007, 0.2117647, 1, 0, 1,
-0.4669611, -0.4580173, -2.994234, 0.2078431, 1, 0, 1,
-0.4650602, 1.319301, -1.215743, 0.2, 1, 0, 1,
-0.4629371, -1.781188, -2.655856, 0.1921569, 1, 0, 1,
-0.4617708, -0.0915492, -1.926273, 0.1882353, 1, 0, 1,
-0.4584365, -0.1137455, -1.738079, 0.1803922, 1, 0, 1,
-0.4570636, 0.2736732, -1.140904, 0.1764706, 1, 0, 1,
-0.456913, -0.9484407, -2.498175, 0.1686275, 1, 0, 1,
-0.4563942, 1.082251, -1.216271, 0.1647059, 1, 0, 1,
-0.4493775, -0.4309739, -1.419851, 0.1568628, 1, 0, 1,
-0.4461271, -0.3649946, -2.065112, 0.1529412, 1, 0, 1,
-0.4430794, 0.5627704, -1.589378, 0.145098, 1, 0, 1,
-0.4379971, 1.06102, 0.1752952, 0.1411765, 1, 0, 1,
-0.4309382, -0.1075854, -3.26004, 0.1333333, 1, 0, 1,
-0.4291681, -0.6501868, -0.4906379, 0.1294118, 1, 0, 1,
-0.424256, -0.4101919, -2.680376, 0.1215686, 1, 0, 1,
-0.4212954, -0.004730397, -1.074691, 0.1176471, 1, 0, 1,
-0.4189553, -0.366208, -1.756988, 0.1098039, 1, 0, 1,
-0.417609, -1.208458, -4.066141, 0.1058824, 1, 0, 1,
-0.416643, -0.7780172, -1.214652, 0.09803922, 1, 0, 1,
-0.4122209, 0.6068342, -0.2391751, 0.09019608, 1, 0, 1,
-0.4113191, 0.6119538, -0.5255057, 0.08627451, 1, 0, 1,
-0.4077366, -1.591145, -1.725279, 0.07843138, 1, 0, 1,
-0.4051585, -1.006902, -2.04636, 0.07450981, 1, 0, 1,
-0.4026177, -1.80443, -2.093895, 0.06666667, 1, 0, 1,
-0.4018812, -1.005117, -3.574305, 0.0627451, 1, 0, 1,
-0.4016019, 0.8924078, -0.124052, 0.05490196, 1, 0, 1,
-0.3986706, -0.3584218, -1.860453, 0.05098039, 1, 0, 1,
-0.3950672, 0.8550965, -0.3644387, 0.04313726, 1, 0, 1,
-0.3948761, -0.847922, -3.544284, 0.03921569, 1, 0, 1,
-0.3928969, -0.8810288, -1.848871, 0.03137255, 1, 0, 1,
-0.3909962, 0.02103897, -0.9035254, 0.02745098, 1, 0, 1,
-0.3883474, -1.033009, -2.42794, 0.01960784, 1, 0, 1,
-0.3844579, -1.989883, -2.650736, 0.01568628, 1, 0, 1,
-0.3844214, -0.1572363, -1.027681, 0.007843138, 1, 0, 1,
-0.380557, -1.092805, -3.314055, 0.003921569, 1, 0, 1,
-0.3801212, -0.3319433, -2.766574, 0, 1, 0.003921569, 1,
-0.378568, 0.5725329, 0.2808859, 0, 1, 0.01176471, 1,
-0.3727695, -0.7226683, -1.385125, 0, 1, 0.01568628, 1,
-0.3669346, -0.07947081, -1.785814, 0, 1, 0.02352941, 1,
-0.3616876, -0.9312598, -2.825596, 0, 1, 0.02745098, 1,
-0.360295, 1.252652, 0.2515863, 0, 1, 0.03529412, 1,
-0.3556634, 0.02514387, -2.364428, 0, 1, 0.03921569, 1,
-0.3551494, -1.639386, -2.688613, 0, 1, 0.04705882, 1,
-0.3512257, 1.47937, -0.1996886, 0, 1, 0.05098039, 1,
-0.3496832, -0.2314425, -2.794511, 0, 1, 0.05882353, 1,
-0.3495677, 1.841243, -0.5755363, 0, 1, 0.0627451, 1,
-0.3475445, -0.401114, -1.635894, 0, 1, 0.07058824, 1,
-0.3472499, -0.1151715, -1.064119, 0, 1, 0.07450981, 1,
-0.3464815, -0.5619436, -2.824396, 0, 1, 0.08235294, 1,
-0.3425835, -0.4383095, -2.144108, 0, 1, 0.08627451, 1,
-0.3404495, 0.04482408, -1.916473, 0, 1, 0.09411765, 1,
-0.3390753, 0.1654903, -1.350239, 0, 1, 0.1019608, 1,
-0.3390577, 1.556256, -1.841773, 0, 1, 0.1058824, 1,
-0.338398, -0.2127621, -3.580261, 0, 1, 0.1137255, 1,
-0.3376102, -1.115, -3.003728, 0, 1, 0.1176471, 1,
-0.3357529, -0.5862568, -4.734081, 0, 1, 0.1254902, 1,
-0.3178064, 1.661431, -0.04962932, 0, 1, 0.1294118, 1,
-0.3159536, -0.08637145, -1.480911, 0, 1, 0.1372549, 1,
-0.3153433, -0.939836, -3.59475, 0, 1, 0.1411765, 1,
-0.3128161, 0.2572185, -0.02535007, 0, 1, 0.1490196, 1,
-0.309191, -2.465608, -3.855935, 0, 1, 0.1529412, 1,
-0.308049, 1.82215, -0.02921346, 0, 1, 0.1607843, 1,
-0.3054428, 0.4751275, 0.312547, 0, 1, 0.1647059, 1,
-0.3053152, -0.03691843, -3.189522, 0, 1, 0.172549, 1,
-0.2921937, -1.04688, -3.791269, 0, 1, 0.1764706, 1,
-0.2911843, -0.7825133, -2.623277, 0, 1, 0.1843137, 1,
-0.2889988, -0.02021874, -2.098084, 0, 1, 0.1882353, 1,
-0.2886879, 2.32232, -0.6134905, 0, 1, 0.1960784, 1,
-0.2873704, -0.5509954, -2.729788, 0, 1, 0.2039216, 1,
-0.2856791, 2.755435, -0.8060327, 0, 1, 0.2078431, 1,
-0.2855054, 1.169516, 1.112022, 0, 1, 0.2156863, 1,
-0.2825126, -0.4576075, -3.653921, 0, 1, 0.2196078, 1,
-0.2820437, -0.3619504, -3.057831, 0, 1, 0.227451, 1,
-0.2793244, 0.6357332, -0.5026744, 0, 1, 0.2313726, 1,
-0.2712082, -1.765303, -2.995832, 0, 1, 0.2392157, 1,
-0.2705594, -0.6258473, -4.025897, 0, 1, 0.2431373, 1,
-0.2658378, -1.736671, -3.129408, 0, 1, 0.2509804, 1,
-0.2645957, -1.56863, -0.8664505, 0, 1, 0.254902, 1,
-0.2632906, -0.7512457, -2.3684, 0, 1, 0.2627451, 1,
-0.2619359, -0.2604201, -1.329406, 0, 1, 0.2666667, 1,
-0.2602434, 0.1980959, -2.407985, 0, 1, 0.2745098, 1,
-0.2544248, 0.1627693, -1.016626, 0, 1, 0.2784314, 1,
-0.2530217, -1.216498, -3.564095, 0, 1, 0.2862745, 1,
-0.2528591, 0.1902907, -1.942305, 0, 1, 0.2901961, 1,
-0.2510029, 1.203284, -0.154553, 0, 1, 0.2980392, 1,
-0.2507385, 0.9622672, -0.3037901, 0, 1, 0.3058824, 1,
-0.2483084, 0.7426959, 1.62876, 0, 1, 0.3098039, 1,
-0.2480978, 0.4589891, 0.3399601, 0, 1, 0.3176471, 1,
-0.2459491, 0.2734901, -1.816355, 0, 1, 0.3215686, 1,
-0.2409035, 0.7391174, -1.861041, 0, 1, 0.3294118, 1,
-0.2337891, 0.6665687, 1.143092, 0, 1, 0.3333333, 1,
-0.2326231, -0.6854252, -1.912962, 0, 1, 0.3411765, 1,
-0.2308212, 1.859496, -0.8410305, 0, 1, 0.345098, 1,
-0.2233929, -0.03742554, -2.206663, 0, 1, 0.3529412, 1,
-0.2211019, 1.225488, 0.1948407, 0, 1, 0.3568628, 1,
-0.2165745, -0.3949413, -2.741826, 0, 1, 0.3647059, 1,
-0.2127477, -1.750269, -4.002337, 0, 1, 0.3686275, 1,
-0.209819, -0.24324, -2.467175, 0, 1, 0.3764706, 1,
-0.2096328, -0.1975774, -0.1674058, 0, 1, 0.3803922, 1,
-0.2091221, 0.06032442, -1.505353, 0, 1, 0.3882353, 1,
-0.2074126, 0.8691606, 1.173274, 0, 1, 0.3921569, 1,
-0.2018742, -0.5859329, -2.699662, 0, 1, 0.4, 1,
-0.1988642, 1.031443, -0.3416286, 0, 1, 0.4078431, 1,
-0.1979022, 0.203567, -1.125898, 0, 1, 0.4117647, 1,
-0.1956546, 1.591272, 1.027005, 0, 1, 0.4196078, 1,
-0.194077, -1.766394, -2.511362, 0, 1, 0.4235294, 1,
-0.1855692, -0.4764479, -1.648438, 0, 1, 0.4313726, 1,
-0.184777, 0.4229251, 0.3914361, 0, 1, 0.4352941, 1,
-0.1837727, -0.650391, -3.565747, 0, 1, 0.4431373, 1,
-0.1826395, -1.016668, -3.83913, 0, 1, 0.4470588, 1,
-0.1812878, -0.01255141, -2.52083, 0, 1, 0.454902, 1,
-0.1809655, 0.07251899, -1.475227, 0, 1, 0.4588235, 1,
-0.1788131, 0.03267866, -0.7613198, 0, 1, 0.4666667, 1,
-0.1776803, -0.0749954, -0.7174019, 0, 1, 0.4705882, 1,
-0.1756095, -0.3596907, -1.979407, 0, 1, 0.4784314, 1,
-0.1718771, 1.144389, -0.1574724, 0, 1, 0.4823529, 1,
-0.1649858, 0.9561813, -0.4889067, 0, 1, 0.4901961, 1,
-0.1649791, -0.6881273, -3.349268, 0, 1, 0.4941176, 1,
-0.1619136, 0.9754091, 1.676706, 0, 1, 0.5019608, 1,
-0.1556958, 0.3450094, 0.3920778, 0, 1, 0.509804, 1,
-0.1510705, -0.4736811, -2.633044, 0, 1, 0.5137255, 1,
-0.1490489, 0.4559051, -2.967217, 0, 1, 0.5215687, 1,
-0.1440935, -0.4101933, -4.054998, 0, 1, 0.5254902, 1,
-0.1440264, 1.577082, -0.001864769, 0, 1, 0.5333334, 1,
-0.1418676, -0.5588878, -2.328985, 0, 1, 0.5372549, 1,
-0.1417527, -1.226238, -2.233684, 0, 1, 0.5450981, 1,
-0.1340828, 0.2972415, -0.08828746, 0, 1, 0.5490196, 1,
-0.1311635, 1.500188, 0.4651721, 0, 1, 0.5568628, 1,
-0.1308823, -0.3897437, -2.686193, 0, 1, 0.5607843, 1,
-0.1307608, -0.8233035, -1.008853, 0, 1, 0.5686275, 1,
-0.1262437, 0.4654743, -0.3010512, 0, 1, 0.572549, 1,
-0.1260287, -0.8461205, -2.73107, 0, 1, 0.5803922, 1,
-0.1196309, -2.522288, -3.120871, 0, 1, 0.5843138, 1,
-0.1182303, 0.6481094, -1.176651, 0, 1, 0.5921569, 1,
-0.1166284, 2.426493, -1.818297, 0, 1, 0.5960785, 1,
-0.1140736, 1.664404, 0.6571528, 0, 1, 0.6039216, 1,
-0.1092161, -1.437438, -3.487902, 0, 1, 0.6117647, 1,
-0.1066326, 0.1270646, 0.4233392, 0, 1, 0.6156863, 1,
-0.1062363, -1.74709, -0.9332371, 0, 1, 0.6235294, 1,
-0.1048949, 1.556, 0.8627732, 0, 1, 0.627451, 1,
-0.1035792, -1.384689, -3.683052, 0, 1, 0.6352941, 1,
-0.09072269, -0.3292012, -2.330341, 0, 1, 0.6392157, 1,
-0.090445, -1.726869, -3.274847, 0, 1, 0.6470588, 1,
-0.08751505, -0.2454995, -1.950893, 0, 1, 0.6509804, 1,
-0.08690821, -0.6061413, -2.450881, 0, 1, 0.6588235, 1,
-0.08317062, -0.9739966, -2.588207, 0, 1, 0.6627451, 1,
-0.07496494, -0.2489715, -2.256439, 0, 1, 0.6705883, 1,
-0.07308444, -0.07020298, -2.363265, 0, 1, 0.6745098, 1,
-0.07233059, 0.2350065, 1.245925, 0, 1, 0.682353, 1,
-0.07229958, -0.04673287, -1.526647, 0, 1, 0.6862745, 1,
-0.0708039, -0.3925557, -1.821903, 0, 1, 0.6941177, 1,
-0.07062784, 0.2666791, 0.5884061, 0, 1, 0.7019608, 1,
-0.06904701, 1.251818, 1.594002, 0, 1, 0.7058824, 1,
-0.06899171, 0.04731716, -1.072306, 0, 1, 0.7137255, 1,
-0.06698844, -0.3510974, -3.605781, 0, 1, 0.7176471, 1,
-0.06409398, -0.8367567, -3.754186, 0, 1, 0.7254902, 1,
-0.06291596, 1.295344, -2.423538, 0, 1, 0.7294118, 1,
-0.05988081, -0.3993903, -4.17339, 0, 1, 0.7372549, 1,
-0.05647944, 0.7401908, 0.5350254, 0, 1, 0.7411765, 1,
-0.05544031, -0.07435089, -0.956566, 0, 1, 0.7490196, 1,
-0.05461394, 0.4117347, -0.4332336, 0, 1, 0.7529412, 1,
-0.05146781, 0.4199523, 0.4205749, 0, 1, 0.7607843, 1,
-0.05092361, -0.03241231, -2.289613, 0, 1, 0.7647059, 1,
-0.04532022, -0.3798574, -2.753132, 0, 1, 0.772549, 1,
-0.04317199, 0.06537893, 0.298903, 0, 1, 0.7764706, 1,
-0.04259202, 0.9927552, 0.08118511, 0, 1, 0.7843137, 1,
-0.04157504, -0.5684639, -3.629112, 0, 1, 0.7882353, 1,
-0.04111941, -0.2970102, -2.18941, 0, 1, 0.7960784, 1,
-0.03920177, 0.5567459, -0.8057404, 0, 1, 0.8039216, 1,
-0.03772419, -1.02102, -2.808662, 0, 1, 0.8078431, 1,
-0.03618861, 0.6265009, 0.6529581, 0, 1, 0.8156863, 1,
-0.03570654, -2.020725, -2.136293, 0, 1, 0.8196079, 1,
-0.03471508, 0.3507186, -2.222701, 0, 1, 0.827451, 1,
-0.03065164, -0.7962779, -3.830363, 0, 1, 0.8313726, 1,
-0.02954924, 2.538252, 0.08098494, 0, 1, 0.8392157, 1,
-0.02946263, 0.2465556, -0.4052762, 0, 1, 0.8431373, 1,
-0.02861289, 0.3482079, 0.6015786, 0, 1, 0.8509804, 1,
-0.02770611, -0.6788102, -2.28819, 0, 1, 0.854902, 1,
-0.02381447, 0.8450627, -0.2775128, 0, 1, 0.8627451, 1,
-0.02315198, -0.408266, -1.826007, 0, 1, 0.8666667, 1,
-0.02313546, 0.3723092, 0.5833564, 0, 1, 0.8745098, 1,
-0.01680959, 1.064862, -0.7270166, 0, 1, 0.8784314, 1,
-0.01592483, 2.008518, -0.1961656, 0, 1, 0.8862745, 1,
-0.01432823, -0.8749043, -5.535328, 0, 1, 0.8901961, 1,
-0.01228945, -0.201653, -3.725991, 0, 1, 0.8980392, 1,
-0.00920018, -0.5250856, -3.35018, 0, 1, 0.9058824, 1,
-0.000254369, 0.2223006, -1.972797, 0, 1, 0.9098039, 1,
0.0003874374, -1.113931, 2.595188, 0, 1, 0.9176471, 1,
0.001031151, 0.2065479, -1.066493, 0, 1, 0.9215686, 1,
0.001423777, -1.320019, 3.258187, 0, 1, 0.9294118, 1,
0.01021526, -0.19313, 2.019325, 0, 1, 0.9333333, 1,
0.01153124, 0.03589362, 0.3139868, 0, 1, 0.9411765, 1,
0.01256423, -1.260668, 3.695105, 0, 1, 0.945098, 1,
0.01515072, 1.220876, 0.5101736, 0, 1, 0.9529412, 1,
0.01782272, -1.207792, 2.939557, 0, 1, 0.9568627, 1,
0.01896236, -1.125308, 5.073397, 0, 1, 0.9647059, 1,
0.02122135, -0.1627798, 4.134804, 0, 1, 0.9686275, 1,
0.02247572, 1.273577, -0.1372001, 0, 1, 0.9764706, 1,
0.02944583, -0.1429793, 1.994436, 0, 1, 0.9803922, 1,
0.03486627, 0.1050822, -0.4830755, 0, 1, 0.9882353, 1,
0.0365892, 1.283508, 1.061511, 0, 1, 0.9921569, 1,
0.03853586, 1.560513, -0.5161383, 0, 1, 1, 1,
0.0445256, 0.01552171, 0.04292602, 0, 0.9921569, 1, 1,
0.04544746, 1.075174, -0.05189194, 0, 0.9882353, 1, 1,
0.04726628, -0.7839279, 4.406158, 0, 0.9803922, 1, 1,
0.0478276, -0.6059377, 3.233789, 0, 0.9764706, 1, 1,
0.05185479, -0.1123227, 1.115216, 0, 0.9686275, 1, 1,
0.05552575, 1.416968, -0.8846729, 0, 0.9647059, 1, 1,
0.0612734, -1.060676, 2.11808, 0, 0.9568627, 1, 1,
0.06444636, 0.4090288, -0.4726709, 0, 0.9529412, 1, 1,
0.07414348, 1.65357, 2.947035, 0, 0.945098, 1, 1,
0.07690026, 0.4251978, 0.1211776, 0, 0.9411765, 1, 1,
0.07925545, 0.2005697, 1.932222, 0, 0.9333333, 1, 1,
0.07954977, -2.272583, 4.108179, 0, 0.9294118, 1, 1,
0.07963719, 0.2261994, -1.611783, 0, 0.9215686, 1, 1,
0.0847296, -0.9633544, 1.95831, 0, 0.9176471, 1, 1,
0.08568052, 0.8740724, 0.913798, 0, 0.9098039, 1, 1,
0.09077056, 1.02542, 2.069895, 0, 0.9058824, 1, 1,
0.09575798, 0.7153533, -0.4689009, 0, 0.8980392, 1, 1,
0.1001196, -1.465096, 3.348447, 0, 0.8901961, 1, 1,
0.1027978, -0.02679568, 2.22329, 0, 0.8862745, 1, 1,
0.1049247, 0.4823951, -0.02865865, 0, 0.8784314, 1, 1,
0.105963, 0.3430771, 0.8684515, 0, 0.8745098, 1, 1,
0.1063252, 0.8644764, 1.17021, 0, 0.8666667, 1, 1,
0.1064112, 0.3128578, 1.994769, 0, 0.8627451, 1, 1,
0.1105684, 0.2532911, -0.9614311, 0, 0.854902, 1, 1,
0.1149255, 0.05385702, -0.07894596, 0, 0.8509804, 1, 1,
0.1151484, -0.5364195, 3.771383, 0, 0.8431373, 1, 1,
0.1152002, -0.2636186, 2.628599, 0, 0.8392157, 1, 1,
0.117521, 0.1749948, 0.9485358, 0, 0.8313726, 1, 1,
0.1198704, 0.7132607, 0.5985947, 0, 0.827451, 1, 1,
0.1215238, 0.9814847, 0.4802529, 0, 0.8196079, 1, 1,
0.1260237, 0.01789719, 2.183522, 0, 0.8156863, 1, 1,
0.1300147, 1.574043, 0.753626, 0, 0.8078431, 1, 1,
0.1302507, 0.2882957, 0.6071392, 0, 0.8039216, 1, 1,
0.1340537, -0.381162, 1.627856, 0, 0.7960784, 1, 1,
0.1345432, -0.6876229, 1.253603, 0, 0.7882353, 1, 1,
0.1362089, -1.707497, 2.935453, 0, 0.7843137, 1, 1,
0.1412844, 0.4835886, 2.253483, 0, 0.7764706, 1, 1,
0.1432552, 0.02204402, 1.873533, 0, 0.772549, 1, 1,
0.1465954, -1.045077, 3.55471, 0, 0.7647059, 1, 1,
0.1495872, -0.3331939, 2.454239, 0, 0.7607843, 1, 1,
0.1500175, -1.068123, 4.237862, 0, 0.7529412, 1, 1,
0.1502489, -0.7705878, 3.703856, 0, 0.7490196, 1, 1,
0.1520491, 2.14866, -1.141023, 0, 0.7411765, 1, 1,
0.1546026, 0.4639344, -0.6134818, 0, 0.7372549, 1, 1,
0.155747, 0.5068781, 1.315474, 0, 0.7294118, 1, 1,
0.1566677, -0.8611152, 2.499468, 0, 0.7254902, 1, 1,
0.1580589, 0.5731862, 1.028482, 0, 0.7176471, 1, 1,
0.1596901, -0.8250105, 4.07291, 0, 0.7137255, 1, 1,
0.1720619, -0.4833072, 1.934653, 0, 0.7058824, 1, 1,
0.1729037, 0.07396991, 2.106158, 0, 0.6980392, 1, 1,
0.172982, 0.5598332, 1.870771, 0, 0.6941177, 1, 1,
0.1759983, 2.146737, 1.225915, 0, 0.6862745, 1, 1,
0.1805479, 0.9458171, 2.471802, 0, 0.682353, 1, 1,
0.183506, -0.2455676, 0.9409881, 0, 0.6745098, 1, 1,
0.1901687, 0.1963203, 0.6284459, 0, 0.6705883, 1, 1,
0.1913407, -0.273869, 1.551339, 0, 0.6627451, 1, 1,
0.1929313, -1.665227, 3.41317, 0, 0.6588235, 1, 1,
0.1929673, -0.3685168, 1.610718, 0, 0.6509804, 1, 1,
0.1994398, 1.137519, 2.144214, 0, 0.6470588, 1, 1,
0.2003163, -1.688321, 2.575223, 0, 0.6392157, 1, 1,
0.2005475, -0.01166436, 1.974224, 0, 0.6352941, 1, 1,
0.202059, 0.2469239, 1.33716, 0, 0.627451, 1, 1,
0.2040606, -0.7226073, 3.593167, 0, 0.6235294, 1, 1,
0.2052135, 0.06508343, 1.930268, 0, 0.6156863, 1, 1,
0.2063911, -0.4187997, 1.942468, 0, 0.6117647, 1, 1,
0.2116423, -1.471393, 2.396953, 0, 0.6039216, 1, 1,
0.2130598, 0.2987633, -1.195586, 0, 0.5960785, 1, 1,
0.21342, -0.2162293, 2.881042, 0, 0.5921569, 1, 1,
0.2176048, -2.071925, 4.773887, 0, 0.5843138, 1, 1,
0.2199066, 0.9308444, -1.377861, 0, 0.5803922, 1, 1,
0.222614, -1.476803, 1.690097, 0, 0.572549, 1, 1,
0.2282585, -0.5463467, 1.97514, 0, 0.5686275, 1, 1,
0.2324551, -0.0002853185, 0.4637093, 0, 0.5607843, 1, 1,
0.2325681, 1.271687, 1.54937, 0, 0.5568628, 1, 1,
0.2345301, 0.99546, -0.7165543, 0, 0.5490196, 1, 1,
0.2357462, -0.4087932, 3.134116, 0, 0.5450981, 1, 1,
0.2360343, -1.513949, 1.710114, 0, 0.5372549, 1, 1,
0.23768, 0.008425311, 0.8996649, 0, 0.5333334, 1, 1,
0.2410584, -1.121537, 4.936537, 0, 0.5254902, 1, 1,
0.2414291, -0.02234864, 3.421373, 0, 0.5215687, 1, 1,
0.2438128, -0.3378885, 3.893157, 0, 0.5137255, 1, 1,
0.2513394, -0.3913533, 2.955977, 0, 0.509804, 1, 1,
0.2523206, -0.3757058, 2.891151, 0, 0.5019608, 1, 1,
0.2579787, -2.042658, 1.370902, 0, 0.4941176, 1, 1,
0.2581247, 0.7620591, 1.597864, 0, 0.4901961, 1, 1,
0.2679332, -0.3731328, 2.69217, 0, 0.4823529, 1, 1,
0.2699321, -0.2838923, 2.167936, 0, 0.4784314, 1, 1,
0.2700855, -1.111794, 3.734529, 0, 0.4705882, 1, 1,
0.2703832, 1.283268, -1.182572, 0, 0.4666667, 1, 1,
0.2708486, -0.7152904, 3.459809, 0, 0.4588235, 1, 1,
0.2721683, -1.187562, 2.725461, 0, 0.454902, 1, 1,
0.2755358, 1.731726, -0.1510877, 0, 0.4470588, 1, 1,
0.2764036, 0.5575284, -0.7010632, 0, 0.4431373, 1, 1,
0.2777353, 0.5647909, -0.9466506, 0, 0.4352941, 1, 1,
0.2782858, 0.9924231, 1.232035, 0, 0.4313726, 1, 1,
0.2788957, 0.89613, -1.754642, 0, 0.4235294, 1, 1,
0.2832387, -0.01876782, 2.905216, 0, 0.4196078, 1, 1,
0.284236, 0.7675683, 3.830503, 0, 0.4117647, 1, 1,
0.2852755, 0.5514593, 0.9482781, 0, 0.4078431, 1, 1,
0.288939, 0.5459606, -0.8361567, 0, 0.4, 1, 1,
0.2894603, -0.8302946, 2.389823, 0, 0.3921569, 1, 1,
0.2924502, -0.7376001, 2.701759, 0, 0.3882353, 1, 1,
0.2957081, -0.8299205, 2.047276, 0, 0.3803922, 1, 1,
0.3045736, 1.769384, 1.036452, 0, 0.3764706, 1, 1,
0.3075267, -0.195279, 0.9413659, 0, 0.3686275, 1, 1,
0.3083624, -0.1323162, 1.169562, 0, 0.3647059, 1, 1,
0.3121928, 0.007601186, 2.218476, 0, 0.3568628, 1, 1,
0.3147127, 1.219159, -0.6190959, 0, 0.3529412, 1, 1,
0.3242149, -0.6549423, 3.949399, 0, 0.345098, 1, 1,
0.3244281, 0.5384929, -0.1579974, 0, 0.3411765, 1, 1,
0.3307956, -0.07795852, 0.9330398, 0, 0.3333333, 1, 1,
0.3322538, -1.22179, 2.826246, 0, 0.3294118, 1, 1,
0.3323434, 1.351127, -0.3855776, 0, 0.3215686, 1, 1,
0.3339543, -0.009510952, 1.712248, 0, 0.3176471, 1, 1,
0.3339603, 1.029029, 0.5589849, 0, 0.3098039, 1, 1,
0.3340762, 0.3311883, -0.173543, 0, 0.3058824, 1, 1,
0.3357366, 2.141501, -0.8054079, 0, 0.2980392, 1, 1,
0.3416013, -0.3342295, 3.146553, 0, 0.2901961, 1, 1,
0.3416628, 3.044302, 1.21404, 0, 0.2862745, 1, 1,
0.3419601, 1.017342, 0.4134562, 0, 0.2784314, 1, 1,
0.3465379, 0.4436715, 0.2540817, 0, 0.2745098, 1, 1,
0.3474929, -0.2649996, 3.164665, 0, 0.2666667, 1, 1,
0.349007, -0.8886198, 3.597124, 0, 0.2627451, 1, 1,
0.3494122, 1.42983, 1.707959, 0, 0.254902, 1, 1,
0.3511842, -0.4757316, 2.590855, 0, 0.2509804, 1, 1,
0.3554752, 0.9384162, 0.9665155, 0, 0.2431373, 1, 1,
0.3614933, 0.2196794, 1.948337, 0, 0.2392157, 1, 1,
0.3640407, -0.4188858, 3.742661, 0, 0.2313726, 1, 1,
0.3685148, -0.1170895, 0.8411458, 0, 0.227451, 1, 1,
0.3725751, 0.2244807, 0.9385441, 0, 0.2196078, 1, 1,
0.3729693, -0.7099811, 3.355695, 0, 0.2156863, 1, 1,
0.3747852, 0.7613384, -0.353064, 0, 0.2078431, 1, 1,
0.3756997, 1.181584, -1.727586, 0, 0.2039216, 1, 1,
0.3797903, -1.243188, 3.599201, 0, 0.1960784, 1, 1,
0.3803592, 0.5906555, 0.7071697, 0, 0.1882353, 1, 1,
0.3808126, -0.07355078, 1.990186, 0, 0.1843137, 1, 1,
0.3815182, 0.8528258, 0.7320946, 0, 0.1764706, 1, 1,
0.3821182, -1.048448, 2.037345, 0, 0.172549, 1, 1,
0.3833455, -1.089688, 3.702879, 0, 0.1647059, 1, 1,
0.3841543, -1.512313, 3.712277, 0, 0.1607843, 1, 1,
0.3863147, 0.7090148, 0.7901823, 0, 0.1529412, 1, 1,
0.3890476, 0.9262338, 1.99059, 0, 0.1490196, 1, 1,
0.3927671, 0.07677648, 0.9613245, 0, 0.1411765, 1, 1,
0.3930189, -0.8110766, 4.043463, 0, 0.1372549, 1, 1,
0.395328, -0.2142205, 3.564855, 0, 0.1294118, 1, 1,
0.3968136, -1.013694, 2.968882, 0, 0.1254902, 1, 1,
0.3978054, 1.36109, 0.03460269, 0, 0.1176471, 1, 1,
0.3999523, -1.185655, 1.904691, 0, 0.1137255, 1, 1,
0.4004718, -0.3413804, 2.384408, 0, 0.1058824, 1, 1,
0.4013923, -0.2111345, 0.9346055, 0, 0.09803922, 1, 1,
0.4032236, -0.53006, 0.9966151, 0, 0.09411765, 1, 1,
0.4088788, -0.6502366, 1.977789, 0, 0.08627451, 1, 1,
0.4095475, 0.4390598, 2.902218, 0, 0.08235294, 1, 1,
0.4113683, -0.3006008, 1.92973, 0, 0.07450981, 1, 1,
0.411759, 3.006254, 0.6209517, 0, 0.07058824, 1, 1,
0.4137369, -2.063401, 2.154595, 0, 0.0627451, 1, 1,
0.4141295, 1.253897, 0.1824799, 0, 0.05882353, 1, 1,
0.4163777, 1.176332, 0.4454525, 0, 0.05098039, 1, 1,
0.4168193, -1.088789, 1.388166, 0, 0.04705882, 1, 1,
0.4184331, -1.937531, 5.156262, 0, 0.03921569, 1, 1,
0.4191449, -0.3921919, 0.6210729, 0, 0.03529412, 1, 1,
0.4231133, -0.02213842, 2.821299, 0, 0.02745098, 1, 1,
0.4271488, 0.2574168, 0.5981649, 0, 0.02352941, 1, 1,
0.4290144, -0.574749, 3.988446, 0, 0.01568628, 1, 1,
0.4328136, 1.155619, 0.2618412, 0, 0.01176471, 1, 1,
0.4348538, -1.195779, 2.60036, 0, 0.003921569, 1, 1,
0.4369836, -0.07588759, 1.969168, 0.003921569, 0, 1, 1,
0.4411166, -0.2930515, 3.213228, 0.007843138, 0, 1, 1,
0.4422113, -0.2444668, 1.462312, 0.01568628, 0, 1, 1,
0.446223, -1.192446, 4.920866, 0.01960784, 0, 1, 1,
0.4486639, 1.510258, 1.005148, 0.02745098, 0, 1, 1,
0.4510107, 0.08273043, 0.6388333, 0.03137255, 0, 1, 1,
0.4523755, 0.1748114, 2.065326, 0.03921569, 0, 1, 1,
0.4531745, 1.009673, 0.8619047, 0.04313726, 0, 1, 1,
0.4537388, -1.437785, 2.169786, 0.05098039, 0, 1, 1,
0.454098, 1.411312, 0.4003136, 0.05490196, 0, 1, 1,
0.4677572, 1.383985, -0.1544089, 0.0627451, 0, 1, 1,
0.4695421, -0.303928, 2.81886, 0.06666667, 0, 1, 1,
0.4712097, -0.8675181, 0.4722306, 0.07450981, 0, 1, 1,
0.4770435, 0.286849, 2.96722, 0.07843138, 0, 1, 1,
0.4819352, -1.757164, -0.2156066, 0.08627451, 0, 1, 1,
0.4844661, -0.3222497, 2.149499, 0.09019608, 0, 1, 1,
0.4894798, -0.421368, 3.222743, 0.09803922, 0, 1, 1,
0.4906895, -0.5627745, 1.588807, 0.1058824, 0, 1, 1,
0.4909786, 1.500526, 0.6585159, 0.1098039, 0, 1, 1,
0.4912604, -1.233228, 2.987599, 0.1176471, 0, 1, 1,
0.5015392, -0.5613084, 0.9022768, 0.1215686, 0, 1, 1,
0.5033453, 0.5637524, 0.7020404, 0.1294118, 0, 1, 1,
0.503684, -0.5505092, 3.081586, 0.1333333, 0, 1, 1,
0.5041199, -0.1117393, 0.8263681, 0.1411765, 0, 1, 1,
0.5151894, -0.4659118, 0.4169306, 0.145098, 0, 1, 1,
0.5213618, -2.212148, 4.580268, 0.1529412, 0, 1, 1,
0.5213746, -0.9278358, 3.350586, 0.1568628, 0, 1, 1,
0.5298117, 0.8931027, -0.07765998, 0.1647059, 0, 1, 1,
0.5320336, 0.4047825, 2.049655, 0.1686275, 0, 1, 1,
0.5336274, 0.04051556, 1.847151, 0.1764706, 0, 1, 1,
0.5397082, -1.55973, 1.841099, 0.1803922, 0, 1, 1,
0.5429139, 0.8378621, -0.1463339, 0.1882353, 0, 1, 1,
0.5442914, 0.01105221, 1.940048, 0.1921569, 0, 1, 1,
0.5515643, 1.353072, -0.3401226, 0.2, 0, 1, 1,
0.5546031, -1.374933, 2.707138, 0.2078431, 0, 1, 1,
0.5551959, -1.991971, 3.5507, 0.2117647, 0, 1, 1,
0.5563926, -0.7063084, 2.913413, 0.2196078, 0, 1, 1,
0.5578911, -0.951727, 3.068946, 0.2235294, 0, 1, 1,
0.56297, 0.1658585, 1.405054, 0.2313726, 0, 1, 1,
0.5700161, 0.2837078, 3.22516, 0.2352941, 0, 1, 1,
0.5711474, -1.127081, 2.103459, 0.2431373, 0, 1, 1,
0.5754575, -1.063128, 1.590343, 0.2470588, 0, 1, 1,
0.5772772, -0.7079573, 1.336452, 0.254902, 0, 1, 1,
0.5779372, 0.06926546, 1.799403, 0.2588235, 0, 1, 1,
0.5780548, 0.08933282, 0.7765263, 0.2666667, 0, 1, 1,
0.5819356, -1.503402, 1.955086, 0.2705882, 0, 1, 1,
0.5821786, 0.805016, -0.5885059, 0.2784314, 0, 1, 1,
0.5838267, -0.2020764, 2.996187, 0.282353, 0, 1, 1,
0.5915429, -0.7579643, 1.649584, 0.2901961, 0, 1, 1,
0.5923507, 0.2374872, 0.9634079, 0.2941177, 0, 1, 1,
0.5949813, 0.1740362, 1.6335, 0.3019608, 0, 1, 1,
0.6019498, -0.5754678, 3.471577, 0.3098039, 0, 1, 1,
0.6051898, -0.6340202, 0.5951227, 0.3137255, 0, 1, 1,
0.61229, 1.865261, -1.518777, 0.3215686, 0, 1, 1,
0.6138701, -0.9637688, 4.26603, 0.3254902, 0, 1, 1,
0.6215774, -0.9880034, 3.006508, 0.3333333, 0, 1, 1,
0.634236, 1.29532, -1.14007, 0.3372549, 0, 1, 1,
0.6357813, 0.02669628, 1.345951, 0.345098, 0, 1, 1,
0.6396696, 0.6144471, 2.679273, 0.3490196, 0, 1, 1,
0.6428646, 1.136232, 0.4853072, 0.3568628, 0, 1, 1,
0.6434405, 2.781991, 1.434613, 0.3607843, 0, 1, 1,
0.6464916, 0.3883167, 2.070281, 0.3686275, 0, 1, 1,
0.6470283, -0.8363824, 1.662702, 0.372549, 0, 1, 1,
0.6511778, 0.232473, 1.855218, 0.3803922, 0, 1, 1,
0.6521257, -0.1319526, 3.425581, 0.3843137, 0, 1, 1,
0.6526024, -0.1878201, 2.066158, 0.3921569, 0, 1, 1,
0.6529803, -1.144244, 2.945815, 0.3960784, 0, 1, 1,
0.655569, 0.8150874, 2.24574, 0.4039216, 0, 1, 1,
0.6575877, 0.4679925, -0.02528535, 0.4117647, 0, 1, 1,
0.6581756, -2.103136, 4.425522, 0.4156863, 0, 1, 1,
0.662564, -0.5708395, 1.794705, 0.4235294, 0, 1, 1,
0.663562, 1.363579, 1.27086, 0.427451, 0, 1, 1,
0.6636116, -0.3961498, 3.224868, 0.4352941, 0, 1, 1,
0.6643646, -1.185014, 3.939914, 0.4392157, 0, 1, 1,
0.666727, 1.142054, 2.107702, 0.4470588, 0, 1, 1,
0.6721877, -0.1757669, 2.394879, 0.4509804, 0, 1, 1,
0.6743042, 0.7332412, 1.066731, 0.4588235, 0, 1, 1,
0.6821784, -0.3273141, 2.172565, 0.4627451, 0, 1, 1,
0.6837601, -1.22494, 1.539428, 0.4705882, 0, 1, 1,
0.6847538, -0.07553247, 2.184879, 0.4745098, 0, 1, 1,
0.6883422, 0.750367, 0.9597853, 0.4823529, 0, 1, 1,
0.6889373, 0.4900739, 1.669959, 0.4862745, 0, 1, 1,
0.6892804, -1.416871, 2.972857, 0.4941176, 0, 1, 1,
0.6894013, 0.8038289, 1.935706, 0.5019608, 0, 1, 1,
0.6897715, 1.058401, 2.419382, 0.5058824, 0, 1, 1,
0.6927712, -0.2756079, 3.057228, 0.5137255, 0, 1, 1,
0.7001566, -1.043163, 2.793012, 0.5176471, 0, 1, 1,
0.7021173, 1.32855, 0.5148728, 0.5254902, 0, 1, 1,
0.7029044, -0.5018976, 1.335972, 0.5294118, 0, 1, 1,
0.7068763, 0.03740213, 0.4698288, 0.5372549, 0, 1, 1,
0.7087265, 1.482491, -0.05998227, 0.5411765, 0, 1, 1,
0.7104515, -0.4083056, 0.9259933, 0.5490196, 0, 1, 1,
0.7132691, -0.1916492, 3.154588, 0.5529412, 0, 1, 1,
0.7168476, 0.5057347, 1.411104, 0.5607843, 0, 1, 1,
0.7175216, -0.8727907, 2.232972, 0.5647059, 0, 1, 1,
0.7282263, -1.188483, 3.619371, 0.572549, 0, 1, 1,
0.7306602, -1.43383, 1.51514, 0.5764706, 0, 1, 1,
0.7311566, 1.820538, -1.465129, 0.5843138, 0, 1, 1,
0.7349586, 0.4528897, 0.9810411, 0.5882353, 0, 1, 1,
0.7390814, 0.01520893, 0.02817547, 0.5960785, 0, 1, 1,
0.7392423, 0.76559, 1.266335, 0.6039216, 0, 1, 1,
0.7419464, 0.2952199, 1.171689, 0.6078432, 0, 1, 1,
0.7423069, -1.313396, 3.067959, 0.6156863, 0, 1, 1,
0.7429968, -0.5118309, 2.503416, 0.6196079, 0, 1, 1,
0.7439765, 0.1878751, 0.4373341, 0.627451, 0, 1, 1,
0.7440557, -2.176822, 3.801634, 0.6313726, 0, 1, 1,
0.74683, 0.7161677, 1.466952, 0.6392157, 0, 1, 1,
0.7479273, 2.085885, 1.476645, 0.6431373, 0, 1, 1,
0.7509783, -0.9579238, 1.966546, 0.6509804, 0, 1, 1,
0.7533327, 0.8982597, 1.723776, 0.654902, 0, 1, 1,
0.7584624, -1.190694, 1.158653, 0.6627451, 0, 1, 1,
0.7607036, 1.743951, -0.7498186, 0.6666667, 0, 1, 1,
0.7679039, -0.739584, 0.6835879, 0.6745098, 0, 1, 1,
0.7684612, -0.6325212, 2.097039, 0.6784314, 0, 1, 1,
0.7686657, -0.3475432, 1.148402, 0.6862745, 0, 1, 1,
0.7702094, 1.095789, -1.165846, 0.6901961, 0, 1, 1,
0.7710435, 1.356435, 0.7820781, 0.6980392, 0, 1, 1,
0.7783785, -0.07599373, 2.516378, 0.7058824, 0, 1, 1,
0.7812908, -0.4061532, 1.9337, 0.7098039, 0, 1, 1,
0.7826552, 2.238137, 0.7889087, 0.7176471, 0, 1, 1,
0.7837334, -1.015971, 3.633773, 0.7215686, 0, 1, 1,
0.7848788, -0.1385807, 2.182865, 0.7294118, 0, 1, 1,
0.7885171, 0.4544128, -0.327794, 0.7333333, 0, 1, 1,
0.7931252, -2.65142, 2.065791, 0.7411765, 0, 1, 1,
0.7946517, 0.6469763, 1.907414, 0.7450981, 0, 1, 1,
0.7964477, 0.0147558, 2.670501, 0.7529412, 0, 1, 1,
0.8112887, -1.370078, 2.025694, 0.7568628, 0, 1, 1,
0.821985, -0.9131498, 2.985816, 0.7647059, 0, 1, 1,
0.8286275, -0.2452222, 1.103599, 0.7686275, 0, 1, 1,
0.8305246, -0.6531789, 1.565227, 0.7764706, 0, 1, 1,
0.8362262, -0.9629427, 2.399464, 0.7803922, 0, 1, 1,
0.8381796, -0.2383277, 2.408044, 0.7882353, 0, 1, 1,
0.8382087, -1.063918, 1.655169, 0.7921569, 0, 1, 1,
0.8404524, 0.2423546, -0.03317557, 0.8, 0, 1, 1,
0.8409094, 1.726828, 0.3473538, 0.8078431, 0, 1, 1,
0.8439637, -1.130171, 3.396685, 0.8117647, 0, 1, 1,
0.8457208, -0.4074654, 1.484057, 0.8196079, 0, 1, 1,
0.8459026, -2.190477, 1.936844, 0.8235294, 0, 1, 1,
0.8498062, 1.686324, 0.8989488, 0.8313726, 0, 1, 1,
0.8506994, 0.7952712, 0.7729244, 0.8352941, 0, 1, 1,
0.8535502, -0.2573363, 1.807409, 0.8431373, 0, 1, 1,
0.856648, -0.4631902, 2.515337, 0.8470588, 0, 1, 1,
0.8635217, 0.9838187, 1.814601, 0.854902, 0, 1, 1,
0.8698513, -1.165386, 0.9832172, 0.8588235, 0, 1, 1,
0.8745577, 1.537296, 0.1043298, 0.8666667, 0, 1, 1,
0.8763705, -0.629533, 4.777148, 0.8705882, 0, 1, 1,
0.8803608, 1.146239, -0.009299049, 0.8784314, 0, 1, 1,
0.8859972, 0.7255273, 2.494273, 0.8823529, 0, 1, 1,
0.8916055, -0.1837089, -0.03814561, 0.8901961, 0, 1, 1,
0.8936046, 0.4389477, 2.950761, 0.8941177, 0, 1, 1,
0.8999575, 0.6550369, 2.429109, 0.9019608, 0, 1, 1,
0.9001934, 0.1496763, 2.905678, 0.9098039, 0, 1, 1,
0.9031336, -2.042044, 1.102763, 0.9137255, 0, 1, 1,
0.9040537, 0.2296502, 1.719411, 0.9215686, 0, 1, 1,
0.9115229, 0.003270578, 2.033341, 0.9254902, 0, 1, 1,
0.9168273, 1.775388, 1.162457, 0.9333333, 0, 1, 1,
0.9188362, 1.288529, 0.4096672, 0.9372549, 0, 1, 1,
0.9205421, 0.8124977, 1.098717, 0.945098, 0, 1, 1,
0.9226459, -1.340153, 2.67053, 0.9490196, 0, 1, 1,
0.9279851, -1.148026, 2.959619, 0.9568627, 0, 1, 1,
0.9347616, -0.733855, 3.51584, 0.9607843, 0, 1, 1,
0.941241, -0.5371594, 1.462544, 0.9686275, 0, 1, 1,
0.9468746, 0.15397, -0.2956206, 0.972549, 0, 1, 1,
0.9469839, -0.1047421, 2.123448, 0.9803922, 0, 1, 1,
0.9490421, 0.4726083, 2.182974, 0.9843137, 0, 1, 1,
0.9663438, -1.272814, 2.092096, 0.9921569, 0, 1, 1,
0.9761967, -0.0909233, 3.914984, 0.9960784, 0, 1, 1,
0.9770309, -0.6685172, 1.660288, 1, 0, 0.9960784, 1,
0.9775743, -1.046952, 4.330514, 1, 0, 0.9882353, 1,
0.9790906, 0.3774247, 1.005908, 1, 0, 0.9843137, 1,
0.982819, -0.4524667, 3.645094, 1, 0, 0.9764706, 1,
0.9876802, -0.319413, 1.867793, 1, 0, 0.972549, 1,
0.9885655, 0.8049788, 1.752145, 1, 0, 0.9647059, 1,
0.9909127, -0.3381184, 2.844795, 1, 0, 0.9607843, 1,
0.9923238, 0.7045957, 0.8531621, 1, 0, 0.9529412, 1,
0.9924323, -0.5660034, 1.997558, 1, 0, 0.9490196, 1,
0.9931617, -0.6084483, 2.069937, 1, 0, 0.9411765, 1,
0.9941396, -0.5727197, 1.791973, 1, 0, 0.9372549, 1,
1.003651, 0.2825115, 0.7923878, 1, 0, 0.9294118, 1,
1.007515, 0.1201695, 0.9960402, 1, 0, 0.9254902, 1,
1.014385, -1.606347, 1.417083, 1, 0, 0.9176471, 1,
1.016791, -0.7605358, 2.901137, 1, 0, 0.9137255, 1,
1.018287, -1.17609, 2.252073, 1, 0, 0.9058824, 1,
1.021343, -1.534866, 3.204488, 1, 0, 0.9019608, 1,
1.022935, -1.105851, 2.154289, 1, 0, 0.8941177, 1,
1.028342, -0.3125341, 2.162363, 1, 0, 0.8862745, 1,
1.029742, 1.744838, 2.702592, 1, 0, 0.8823529, 1,
1.035681, 0.3932845, 2.168633, 1, 0, 0.8745098, 1,
1.050952, -0.6986412, 1.484594, 1, 0, 0.8705882, 1,
1.05126, -0.2067867, 1.240684, 1, 0, 0.8627451, 1,
1.068447, -0.4014286, 1.110988, 1, 0, 0.8588235, 1,
1.069475, -0.001926696, 2.19396, 1, 0, 0.8509804, 1,
1.077788, 0.6729658, 0.6819964, 1, 0, 0.8470588, 1,
1.079344, 0.3203432, 1.892207, 1, 0, 0.8392157, 1,
1.095957, -0.6707017, 1.769811, 1, 0, 0.8352941, 1,
1.09632, -0.8148102, 3.202937, 1, 0, 0.827451, 1,
1.108471, 1.514337, 2.097185, 1, 0, 0.8235294, 1,
1.113053, -0.3962731, 1.435854, 1, 0, 0.8156863, 1,
1.115516, -0.3061002, 0.8367789, 1, 0, 0.8117647, 1,
1.119431, 1.066503, 1.391951, 1, 0, 0.8039216, 1,
1.122299, 0.1015643, -0.7780189, 1, 0, 0.7960784, 1,
1.125069, 1.091553, 1.247719, 1, 0, 0.7921569, 1,
1.125292, -1.377333, 1.466371, 1, 0, 0.7843137, 1,
1.127359, -0.3620408, 3.439539, 1, 0, 0.7803922, 1,
1.129045, 2.138564, 1.767036, 1, 0, 0.772549, 1,
1.130508, 0.6880006, -1.567792, 1, 0, 0.7686275, 1,
1.132458, 1.143603, -0.6186032, 1, 0, 0.7607843, 1,
1.135506, 1.087325, 0.4864127, 1, 0, 0.7568628, 1,
1.135883, -0.3492567, 1.634178, 1, 0, 0.7490196, 1,
1.138212, 0.8257121, 0.4363647, 1, 0, 0.7450981, 1,
1.142051, -0.07799311, 1.8883, 1, 0, 0.7372549, 1,
1.144353, 2.268946, 0.9210823, 1, 0, 0.7333333, 1,
1.151098, -0.1124402, 1.717275, 1, 0, 0.7254902, 1,
1.151859, 0.5331519, 1.245133, 1, 0, 0.7215686, 1,
1.159607, -2.583786, 2.770861, 1, 0, 0.7137255, 1,
1.163944, -0.9305626, 2.68622, 1, 0, 0.7098039, 1,
1.166604, 0.4924671, 1.889762, 1, 0, 0.7019608, 1,
1.166958, -1.25823, 2.909403, 1, 0, 0.6941177, 1,
1.167997, -0.3987011, 2.144486, 1, 0, 0.6901961, 1,
1.172503, -0.3833613, 2.107715, 1, 0, 0.682353, 1,
1.192654, -1.230592, 3.492228, 1, 0, 0.6784314, 1,
1.201722, 0.2271111, 0.5974183, 1, 0, 0.6705883, 1,
1.238729, 1.714787, 1.193665, 1, 0, 0.6666667, 1,
1.242247, 0.8761465, 1.289725, 1, 0, 0.6588235, 1,
1.251488, 0.7368796, 0.07517662, 1, 0, 0.654902, 1,
1.259302, 0.5210507, 2.081367, 1, 0, 0.6470588, 1,
1.267133, -1.011304, 3.285398, 1, 0, 0.6431373, 1,
1.268985, 1.42314, -1.653525, 1, 0, 0.6352941, 1,
1.270232, 0.681354, -0.389531, 1, 0, 0.6313726, 1,
1.274386, 0.3484564, 2.594867, 1, 0, 0.6235294, 1,
1.275684, 0.1546539, 0.1979679, 1, 0, 0.6196079, 1,
1.288544, 0.3977065, 1.078051, 1, 0, 0.6117647, 1,
1.292959, 0.9059061, 1.804359, 1, 0, 0.6078432, 1,
1.293985, -1.236714, 2.332296, 1, 0, 0.6, 1,
1.301261, 1.048674, -0.02209719, 1, 0, 0.5921569, 1,
1.301652, -0.05277147, 1.020413, 1, 0, 0.5882353, 1,
1.305243, 0.1184006, 0.3144296, 1, 0, 0.5803922, 1,
1.30993, 0.846168, 1.815751, 1, 0, 0.5764706, 1,
1.325242, 2.253369, 0.8317754, 1, 0, 0.5686275, 1,
1.336733, 0.8978043, 2.092344, 1, 0, 0.5647059, 1,
1.343989, 0.1481573, 1.890036, 1, 0, 0.5568628, 1,
1.348029, -0.2826744, 2.918497, 1, 0, 0.5529412, 1,
1.349502, -0.04605167, 4.429949, 1, 0, 0.5450981, 1,
1.352718, -0.3905274, 0.6170048, 1, 0, 0.5411765, 1,
1.355586, -0.3983938, 2.938799, 1, 0, 0.5333334, 1,
1.360601, -0.2206092, 2.701961, 1, 0, 0.5294118, 1,
1.37641, -0.2338267, 1.420593, 1, 0, 0.5215687, 1,
1.393355, 0.8849929, 1.096361, 1, 0, 0.5176471, 1,
1.396341, 0.3047194, 0.5615782, 1, 0, 0.509804, 1,
1.405599, 1.953305, 0.5940571, 1, 0, 0.5058824, 1,
1.406134, -1.059585, 2.292464, 1, 0, 0.4980392, 1,
1.421411, -1.263658, 1.444557, 1, 0, 0.4901961, 1,
1.422959, 0.4736152, 2.969858, 1, 0, 0.4862745, 1,
1.424338, -0.725309, 0.5043975, 1, 0, 0.4784314, 1,
1.45109, 0.9017321, -0.4253544, 1, 0, 0.4745098, 1,
1.456935, 0.07777732, 2.815924, 1, 0, 0.4666667, 1,
1.459372, -1.493404, 2.447002, 1, 0, 0.4627451, 1,
1.468796, -1.051454, 0.414289, 1, 0, 0.454902, 1,
1.473752, 1.11256, 0.1537764, 1, 0, 0.4509804, 1,
1.478643, -0.51886, 1.219188, 1, 0, 0.4431373, 1,
1.493273, 0.6903472, 0.3008165, 1, 0, 0.4392157, 1,
1.497525, -0.6446862, 1.748182, 1, 0, 0.4313726, 1,
1.502866, -2.003305, 2.433585, 1, 0, 0.427451, 1,
1.520995, -0.3890339, 0.2696476, 1, 0, 0.4196078, 1,
1.544723, -0.3521131, 3.883815, 1, 0, 0.4156863, 1,
1.547439, 0.5889029, 0.7876277, 1, 0, 0.4078431, 1,
1.547844, -1.875194, 2.27109, 1, 0, 0.4039216, 1,
1.553268, 0.02980965, 0.5473129, 1, 0, 0.3960784, 1,
1.57025, 0.5654721, 3.071357, 1, 0, 0.3882353, 1,
1.575716, -0.4063563, 0.8194566, 1, 0, 0.3843137, 1,
1.584836, 1.019544, 0.8708693, 1, 0, 0.3764706, 1,
1.585584, 0.1849393, 1.455751, 1, 0, 0.372549, 1,
1.588732, -0.489684, 0.3987279, 1, 0, 0.3647059, 1,
1.598059, 1.462116, 1.397036, 1, 0, 0.3607843, 1,
1.606313, -0.5519491, 3.735092, 1, 0, 0.3529412, 1,
1.609154, 0.8025445, 3.197498, 1, 0, 0.3490196, 1,
1.627285, 0.4212003, 0.4460634, 1, 0, 0.3411765, 1,
1.632702, -0.3982366, 1.858397, 1, 0, 0.3372549, 1,
1.634641, 0.9488812, 1.16958, 1, 0, 0.3294118, 1,
1.637956, -0.2737952, 2.556423, 1, 0, 0.3254902, 1,
1.640303, -0.2802379, 0.9860002, 1, 0, 0.3176471, 1,
1.649485, -0.3994055, 2.156181, 1, 0, 0.3137255, 1,
1.651532, -0.4790496, 3.007901, 1, 0, 0.3058824, 1,
1.653613, -0.5050687, 1.400592, 1, 0, 0.2980392, 1,
1.654368, -0.2137293, 1.235927, 1, 0, 0.2941177, 1,
1.659575, 0.2345266, 3.529034, 1, 0, 0.2862745, 1,
1.667351, 1.350926, 2.21124, 1, 0, 0.282353, 1,
1.668535, -2.497532, 2.374161, 1, 0, 0.2745098, 1,
1.677894, 0.1290609, 0.291974, 1, 0, 0.2705882, 1,
1.687732, 2.231539, 1.905523, 1, 0, 0.2627451, 1,
1.704109, -0.2073227, 0.6488473, 1, 0, 0.2588235, 1,
1.712299, -0.01870738, 2.053295, 1, 0, 0.2509804, 1,
1.725825, -1.423024, 0.3741514, 1, 0, 0.2470588, 1,
1.728258, -0.3932604, 2.080493, 1, 0, 0.2392157, 1,
1.742605, -0.6273584, 0.9531044, 1, 0, 0.2352941, 1,
1.751181, 0.6173142, -1.278941, 1, 0, 0.227451, 1,
1.751505, 1.919106, -0.04627276, 1, 0, 0.2235294, 1,
1.752376, 0.2737184, 0.08360453, 1, 0, 0.2156863, 1,
1.761652, -1.292624, 2.825407, 1, 0, 0.2117647, 1,
1.762424, 1.03699, -1.048214, 1, 0, 0.2039216, 1,
1.762482, -0.4588829, 1.958139, 1, 0, 0.1960784, 1,
1.787315, -1.380275, 0.001466544, 1, 0, 0.1921569, 1,
1.813913, 0.1211663, 1.558915, 1, 0, 0.1843137, 1,
1.814398, 0.7250155, 0.374599, 1, 0, 0.1803922, 1,
1.826178, 0.3008289, 1.182078, 1, 0, 0.172549, 1,
1.861873, 0.3028751, 1.268213, 1, 0, 0.1686275, 1,
1.876516, -2.19345, 2.348985, 1, 0, 0.1607843, 1,
1.881643, -0.2320396, 1.380481, 1, 0, 0.1568628, 1,
1.885078, 0.4350262, 1.294132, 1, 0, 0.1490196, 1,
1.948859, 0.4304794, -0.3468581, 1, 0, 0.145098, 1,
2.007513, 0.2957683, 3.257597, 1, 0, 0.1372549, 1,
2.012647, 0.3018434, -2.012155, 1, 0, 0.1333333, 1,
2.071679, -0.1112121, 2.48676, 1, 0, 0.1254902, 1,
2.07608, -0.1320352, 2.162266, 1, 0, 0.1215686, 1,
2.084166, 0.03927686, 1.545608, 1, 0, 0.1137255, 1,
2.114529, -1.768048, 2.520912, 1, 0, 0.1098039, 1,
2.137369, -1.137846, 1.813611, 1, 0, 0.1019608, 1,
2.154142, -0.153, 1.444046, 1, 0, 0.09411765, 1,
2.187005, -0.9459432, 3.198218, 1, 0, 0.09019608, 1,
2.191382, 2.464631, -0.128165, 1, 0, 0.08235294, 1,
2.268161, 0.941036, 1.023833, 1, 0, 0.07843138, 1,
2.32967, 0.07630832, 1.94606, 1, 0, 0.07058824, 1,
2.367384, -1.055651, 2.719815, 1, 0, 0.06666667, 1,
2.376117, 1.776147, 1.355596, 1, 0, 0.05882353, 1,
2.493314, -0.9043532, 3.126406, 1, 0, 0.05490196, 1,
2.536551, 0.8258401, 1.633731, 1, 0, 0.04705882, 1,
2.650834, 1.707774, 0.9348482, 1, 0, 0.04313726, 1,
2.793922, -0.263481, 2.130912, 1, 0, 0.03529412, 1,
2.805762, 1.549646, -1.024442, 1, 0, 0.03137255, 1,
2.807416, 0.1824179, 2.319524, 1, 0, 0.02352941, 1,
3.079019, 0.243928, 2.27922, 1, 0, 0.01960784, 1,
3.227808, 0.07681885, 0.2619999, 1, 0, 0.01176471, 1,
3.408936, 0.07638012, 2.185905, 1, 0, 0.007843138, 1
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
-0.2273742, -4.89755, -7.347552, 0, -0.5, 0.5, 0.5,
-0.2273742, -4.89755, -7.347552, 1, -0.5, 0.5, 0.5,
-0.2273742, -4.89755, -7.347552, 1, 1.5, 0.5, 0.5,
-0.2273742, -4.89755, -7.347552, 0, 1.5, 0.5, 0.5
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
-5.096394, -0.2282009, -7.347552, 0, -0.5, 0.5, 0.5,
-5.096394, -0.2282009, -7.347552, 1, -0.5, 0.5, 0.5,
-5.096394, -0.2282009, -7.347552, 1, 1.5, 0.5, 0.5,
-5.096394, -0.2282009, -7.347552, 0, 1.5, 0.5, 0.5
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
-5.096394, -4.89755, -0.1895328, 0, -0.5, 0.5, 0.5,
-5.096394, -4.89755, -0.1895328, 1, -0.5, 0.5, 0.5,
-5.096394, -4.89755, -0.1895328, 1, 1.5, 0.5, 0.5,
-5.096394, -4.89755, -0.1895328, 0, 1.5, 0.5, 0.5
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
-2, -3.820008, -5.695702,
2, -3.820008, -5.695702,
-2, -3.820008, -5.695702,
-2, -3.999598, -5.97101,
0, -3.820008, -5.695702,
0, -3.999598, -5.97101,
2, -3.820008, -5.695702,
2, -3.999598, -5.97101
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
"0",
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
-2, -4.358778, -6.521627, 0, -0.5, 0.5, 0.5,
-2, -4.358778, -6.521627, 1, -0.5, 0.5, 0.5,
-2, -4.358778, -6.521627, 1, 1.5, 0.5, 0.5,
-2, -4.358778, -6.521627, 0, 1.5, 0.5, 0.5,
0, -4.358778, -6.521627, 0, -0.5, 0.5, 0.5,
0, -4.358778, -6.521627, 1, -0.5, 0.5, 0.5,
0, -4.358778, -6.521627, 1, 1.5, 0.5, 0.5,
0, -4.358778, -6.521627, 0, 1.5, 0.5, 0.5,
2, -4.358778, -6.521627, 0, -0.5, 0.5, 0.5,
2, -4.358778, -6.521627, 1, -0.5, 0.5, 0.5,
2, -4.358778, -6.521627, 1, 1.5, 0.5, 0.5,
2, -4.358778, -6.521627, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.972774, -3, -5.695702,
-3.972774, 3, -5.695702,
-3.972774, -3, -5.695702,
-4.160044, -3, -5.97101,
-3.972774, -2, -5.695702,
-4.160044, -2, -5.97101,
-3.972774, -1, -5.695702,
-4.160044, -1, -5.97101,
-3.972774, 0, -5.695702,
-4.160044, 0, -5.97101,
-3.972774, 1, -5.695702,
-4.160044, 1, -5.97101,
-3.972774, 2, -5.695702,
-4.160044, 2, -5.97101,
-3.972774, 3, -5.695702,
-4.160044, 3, -5.97101
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
-4.534584, -3, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, -3, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, -3, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, -3, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, -2, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, -2, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, -2, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, -2, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, -1, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, -1, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, -1, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, -1, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, 0, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, 0, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, 0, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, 0, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, 1, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, 1, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, 1, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, 1, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, 2, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, 2, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, 2, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, 2, -6.521627, 0, 1.5, 0.5, 0.5,
-4.534584, 3, -6.521627, 0, -0.5, 0.5, 0.5,
-4.534584, 3, -6.521627, 1, -0.5, 0.5, 0.5,
-4.534584, 3, -6.521627, 1, 1.5, 0.5, 0.5,
-4.534584, 3, -6.521627, 0, 1.5, 0.5, 0.5
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
-3.972774, -3.820008, -4,
-3.972774, -3.820008, 4,
-3.972774, -3.820008, -4,
-4.160044, -3.999598, -4,
-3.972774, -3.820008, -2,
-4.160044, -3.999598, -2,
-3.972774, -3.820008, 0,
-4.160044, -3.999598, 0,
-3.972774, -3.820008, 2,
-4.160044, -3.999598, 2,
-3.972774, -3.820008, 4,
-4.160044, -3.999598, 4
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
-4.534584, -4.358778, -4, 0, -0.5, 0.5, 0.5,
-4.534584, -4.358778, -4, 1, -0.5, 0.5, 0.5,
-4.534584, -4.358778, -4, 1, 1.5, 0.5, 0.5,
-4.534584, -4.358778, -4, 0, 1.5, 0.5, 0.5,
-4.534584, -4.358778, -2, 0, -0.5, 0.5, 0.5,
-4.534584, -4.358778, -2, 1, -0.5, 0.5, 0.5,
-4.534584, -4.358778, -2, 1, 1.5, 0.5, 0.5,
-4.534584, -4.358778, -2, 0, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 0, 0, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 0, 1, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 0, 1, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 0, 0, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 2, 0, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 2, 1, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 2, 1, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 2, 0, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 4, 0, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 4, 1, -0.5, 0.5, 0.5,
-4.534584, -4.358778, 4, 1, 1.5, 0.5, 0.5,
-4.534584, -4.358778, 4, 0, 1.5, 0.5, 0.5
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
-3.972774, -3.820008, -5.695702,
-3.972774, 3.363606, -5.695702,
-3.972774, -3.820008, 5.316636,
-3.972774, 3.363606, 5.316636,
-3.972774, -3.820008, -5.695702,
-3.972774, -3.820008, 5.316636,
-3.972774, 3.363606, -5.695702,
-3.972774, 3.363606, 5.316636,
-3.972774, -3.820008, -5.695702,
3.518026, -3.820008, -5.695702,
-3.972774, -3.820008, 5.316636,
3.518026, -3.820008, 5.316636,
-3.972774, 3.363606, -5.695702,
3.518026, 3.363606, -5.695702,
-3.972774, 3.363606, 5.316636,
3.518026, 3.363606, 5.316636,
3.518026, -3.820008, -5.695702,
3.518026, 3.363606, -5.695702,
3.518026, -3.820008, 5.316636,
3.518026, 3.363606, 5.316636,
3.518026, -3.820008, -5.695702,
3.518026, -3.820008, 5.316636,
3.518026, 3.363606, -5.695702,
3.518026, 3.363606, 5.316636
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
var radius = 8.08038;
var distance = 35.95053;
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
mvMatrix.translate( 0.2273742, 0.2282009, 0.1895328 );
mvMatrix.scale( 1.166319, 1.216194, 0.7933525 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95053);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flubenzimine<-read.table("flubenzimine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flubenzimine$V2
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
y<-flubenzimine$V3
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
z<-flubenzimine$V4
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
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
-3.863685, -1.03333, -0.3021445, 0, 0, 1, 1, 1,
-2.871363, 0.07296502, -1.564324, 1, 0, 0, 1, 1,
-2.785239, 0.224842, -0.3166514, 1, 0, 0, 1, 1,
-2.778671, 0.2543919, -1.685928, 1, 0, 0, 1, 1,
-2.752577, -1.949824, -1.759341, 1, 0, 0, 1, 1,
-2.716061, -0.5169668, -1.32167, 1, 0, 0, 1, 1,
-2.707223, -0.09665939, -1.456362, 0, 0, 0, 1, 1,
-2.675435, 0.708933, -0.09534136, 0, 0, 0, 1, 1,
-2.488588, 0.2300068, -2.706248, 0, 0, 0, 1, 1,
-2.408451, -1.485543, -3.030911, 0, 0, 0, 1, 1,
-2.390598, 1.358348, -0.2309272, 0, 0, 0, 1, 1,
-2.315896, -0.03283722, -2.215452, 0, 0, 0, 1, 1,
-2.302667, -0.2301645, -2.208853, 0, 0, 0, 1, 1,
-2.300032, 0.7079037, -1.085723, 1, 1, 1, 1, 1,
-2.264928, -2.254464, -2.677583, 1, 1, 1, 1, 1,
-2.251727, 1.180334, -2.065204, 1, 1, 1, 1, 1,
-2.196854, -2.052072, -3.556483, 1, 1, 1, 1, 1,
-2.136289, 0.8425016, 0.2557661, 1, 1, 1, 1, 1,
-2.077105, 1.235601, -0.42622, 1, 1, 1, 1, 1,
-2.033005, 1.158729, -2.678858, 1, 1, 1, 1, 1,
-2.000511, -0.5991697, -2.844432, 1, 1, 1, 1, 1,
-1.993566, -1.088891, -2.32416, 1, 1, 1, 1, 1,
-1.979268, 0.3883625, -2.63606, 1, 1, 1, 1, 1,
-1.968652, 0.5278057, -1.995271, 1, 1, 1, 1, 1,
-1.964639, 1.494944, -0.237708, 1, 1, 1, 1, 1,
-1.945875, -0.1749121, -0.5433354, 1, 1, 1, 1, 1,
-1.913249, 1.499811, -2.823407, 1, 1, 1, 1, 1,
-1.900625, -0.1444038, -2.8105, 1, 1, 1, 1, 1,
-1.886489, -1.817352, -2.261726, 0, 0, 1, 1, 1,
-1.878945, 0.8570351, 0.1806273, 1, 0, 0, 1, 1,
-1.874588, -0.7729531, -2.46454, 1, 0, 0, 1, 1,
-1.861039, 1.185929, 1.463221, 1, 0, 0, 1, 1,
-1.86079, -0.0033669, -1.790453, 1, 0, 0, 1, 1,
-1.860385, -0.0603002, -1.745875, 1, 0, 0, 1, 1,
-1.826479, 0.791424, -0.9047046, 0, 0, 0, 1, 1,
-1.798628, 0.2445128, 0.1673814, 0, 0, 0, 1, 1,
-1.797468, -1.088531, -2.657158, 0, 0, 0, 1, 1,
-1.79478, 0.9353359, -1.870001, 0, 0, 0, 1, 1,
-1.777743, 1.686348, -1.059449, 0, 0, 0, 1, 1,
-1.755536, 0.8090653, -1.975701, 0, 0, 0, 1, 1,
-1.716687, 1.27707, -0.04921194, 0, 0, 0, 1, 1,
-1.715053, -0.993687, -2.834935, 1, 1, 1, 1, 1,
-1.713477, 0.9469576, -0.7615901, 1, 1, 1, 1, 1,
-1.685924, -0.7090117, -1.538865, 1, 1, 1, 1, 1,
-1.658007, 0.4663118, -3.769699, 1, 1, 1, 1, 1,
-1.638629, -1.476453, -2.921841, 1, 1, 1, 1, 1,
-1.608723, -1.445996, -2.321512, 1, 1, 1, 1, 1,
-1.606254, -2.828448, -3.308765, 1, 1, 1, 1, 1,
-1.60309, 1.071328, -0.6665382, 1, 1, 1, 1, 1,
-1.595009, -0.7851871, -2.114479, 1, 1, 1, 1, 1,
-1.593338, 0.08070643, -3.001182, 1, 1, 1, 1, 1,
-1.587407, 2.286915, -0.5723974, 1, 1, 1, 1, 1,
-1.573738, 0.1318713, -2.938989, 1, 1, 1, 1, 1,
-1.571694, 0.9325649, -0.4655817, 1, 1, 1, 1, 1,
-1.55922, 0.5207245, -1.675338, 1, 1, 1, 1, 1,
-1.551765, 0.1770221, -1.106996, 1, 1, 1, 1, 1,
-1.527959, -0.5350953, -2.191447, 0, 0, 1, 1, 1,
-1.515053, 0.5266461, -1.553362, 1, 0, 0, 1, 1,
-1.511441, -1.881048, -1.518112, 1, 0, 0, 1, 1,
-1.50885, -0.7806141, -1.844486, 1, 0, 0, 1, 1,
-1.496867, -2.148605, -2.00303, 1, 0, 0, 1, 1,
-1.496691, 0.03236454, -2.247207, 1, 0, 0, 1, 1,
-1.496647, -1.214957, -0.190553, 0, 0, 0, 1, 1,
-1.494837, 0.637788, -0.3026447, 0, 0, 0, 1, 1,
-1.47508, -1.594034, -2.867666, 0, 0, 0, 1, 1,
-1.470413, 0.2446333, -1.524626, 0, 0, 0, 1, 1,
-1.454536, -3.257154, -4.577188, 0, 0, 0, 1, 1,
-1.448767, 2.382359, 0.03070456, 0, 0, 0, 1, 1,
-1.439691, -1.02427, -3.041011, 0, 0, 0, 1, 1,
-1.437643, -0.5280209, -1.99757, 1, 1, 1, 1, 1,
-1.419968, -0.08680554, -1.106051, 1, 1, 1, 1, 1,
-1.417498, 0.9657863, -1.432577, 1, 1, 1, 1, 1,
-1.414888, -0.977861, -2.208819, 1, 1, 1, 1, 1,
-1.413124, 3.01633, -1.278309, 1, 1, 1, 1, 1,
-1.407226, -0.644009, -1.957486, 1, 1, 1, 1, 1,
-1.39995, 0.7921232, -2.083648, 1, 1, 1, 1, 1,
-1.388034, -1.555239, -2.47605, 1, 1, 1, 1, 1,
-1.379849, -0.535632, -2.980169, 1, 1, 1, 1, 1,
-1.37496, -0.8936726, -1.537124, 1, 1, 1, 1, 1,
-1.374357, -0.9178932, 0.4368203, 1, 1, 1, 1, 1,
-1.365929, 0.5193362, -0.9288925, 1, 1, 1, 1, 1,
-1.357999, 0.9504897, -1.073018, 1, 1, 1, 1, 1,
-1.346711, -0.1617276, -1.54336, 1, 1, 1, 1, 1,
-1.329567, 0.04471397, -0.7017589, 1, 1, 1, 1, 1,
-1.32804, 1.098873, 0.5623113, 0, 0, 1, 1, 1,
-1.327063, -0.6211842, -0.8097874, 1, 0, 0, 1, 1,
-1.3243, -1.460064, -3.546671, 1, 0, 0, 1, 1,
-1.324076, 1.03827, 1.069525, 1, 0, 0, 1, 1,
-1.311376, -1.271393, -3.560932, 1, 0, 0, 1, 1,
-1.299332, -0.7989429, -3.411391, 1, 0, 0, 1, 1,
-1.264663, -0.3274409, -2.708289, 0, 0, 0, 1, 1,
-1.262208, -0.5145406, -2.023535, 0, 0, 0, 1, 1,
-1.24924, -1.004259, -1.862452, 0, 0, 0, 1, 1,
-1.244917, 0.1157378, -1.722767, 0, 0, 0, 1, 1,
-1.243479, 1.047889, -0.2644834, 0, 0, 0, 1, 1,
-1.229882, 2.032791, 0.5285639, 0, 0, 0, 1, 1,
-1.22762, -0.4172348, -2.433149, 0, 0, 0, 1, 1,
-1.22378, 0.6303048, -1.59126, 1, 1, 1, 1, 1,
-1.212759, -0.4797032, -2.723514, 1, 1, 1, 1, 1,
-1.207143, 0.9694278, -0.6576768, 1, 1, 1, 1, 1,
-1.204382, 0.9605579, 0.06074689, 1, 1, 1, 1, 1,
-1.198454, -0.3716267, -3.586229, 1, 1, 1, 1, 1,
-1.196074, -0.2956406, -2.630813, 1, 1, 1, 1, 1,
-1.185068, -0.7404146, -1.80459, 1, 1, 1, 1, 1,
-1.168827, 0.240407, -0.3732686, 1, 1, 1, 1, 1,
-1.163902, 0.5231209, -3.501651, 1, 1, 1, 1, 1,
-1.150738, -0.7496985, -3.049403, 1, 1, 1, 1, 1,
-1.136371, -0.3935231, -1.44515, 1, 1, 1, 1, 1,
-1.135726, -1.371558, -2.656012, 1, 1, 1, 1, 1,
-1.131392, -1.148484, -2.77842, 1, 1, 1, 1, 1,
-1.128352, 0.4337384, -0.6409186, 1, 1, 1, 1, 1,
-1.126105, -0.5182185, -0.8332758, 1, 1, 1, 1, 1,
-1.125357, -0.138606, -2.401479, 0, 0, 1, 1, 1,
-1.118128, -0.4453866, -3.692331, 1, 0, 0, 1, 1,
-1.109735, 1.32115, -0.524662, 1, 0, 0, 1, 1,
-1.104358, 0.6913971, -1.685906, 1, 0, 0, 1, 1,
-1.103493, 0.3907554, -1.840325, 1, 0, 0, 1, 1,
-1.096473, -2.01995, -3.654728, 1, 0, 0, 1, 1,
-1.090095, 1.115002, -1.400954, 0, 0, 0, 1, 1,
-1.078969, -0.05143126, -1.234718, 0, 0, 0, 1, 1,
-1.07501, -1.239236, -2.251354, 0, 0, 0, 1, 1,
-1.074749, 1.200321, -2.342139, 0, 0, 0, 1, 1,
-1.072724, 0.013591, -1.768901, 0, 0, 0, 1, 1,
-1.07028, -0.5579408, -1.765847, 0, 0, 0, 1, 1,
-1.068802, -0.7982476, -1.836377, 0, 0, 0, 1, 1,
-1.066678, -0.5362413, -1.833658, 1, 1, 1, 1, 1,
-1.06465, -0.1814097, -0.4807901, 1, 1, 1, 1, 1,
-1.059906, -0.7621204, -0.6415026, 1, 1, 1, 1, 1,
-1.053875, 1.641344, -1.178329, 1, 1, 1, 1, 1,
-1.05305, 0.09855889, -0.864324, 1, 1, 1, 1, 1,
-1.045822, 1.84837, -1.021045, 1, 1, 1, 1, 1,
-1.040169, -1.733945, -3.471483, 1, 1, 1, 1, 1,
-1.035136, 0.1920952, -0.9492974, 1, 1, 1, 1, 1,
-1.026079, -1.275645, -1.684724, 1, 1, 1, 1, 1,
-1.008474, 0.9288445, -1.50755, 1, 1, 1, 1, 1,
-1.007263, -0.9742134, -2.374205, 1, 1, 1, 1, 1,
-1.005008, -1.399172, -0.7570903, 1, 1, 1, 1, 1,
-0.9980582, 0.5374235, -0.9722748, 1, 1, 1, 1, 1,
-0.9935704, 1.377228, 0.5728738, 1, 1, 1, 1, 1,
-0.9929525, -0.6158026, -1.668511, 1, 1, 1, 1, 1,
-0.9912493, 1.005273, -1.912031, 0, 0, 1, 1, 1,
-0.9838111, -0.3573253, -2.69717, 1, 0, 0, 1, 1,
-0.9757118, 1.005661, -0.8508927, 1, 0, 0, 1, 1,
-0.9669788, 0.2265163, -1.741143, 1, 0, 0, 1, 1,
-0.961511, -1.378453, -2.27597, 1, 0, 0, 1, 1,
-0.9547327, -0.540556, -2.374457, 1, 0, 0, 1, 1,
-0.95083, 0.09724562, -1.693643, 0, 0, 0, 1, 1,
-0.9481538, -0.6800102, -2.8956, 0, 0, 0, 1, 1,
-0.9439486, -0.1479995, -3.14219, 0, 0, 0, 1, 1,
-0.940661, -2.084496, -2.196417, 0, 0, 0, 1, 1,
-0.9400386, -1.259922, -2.372003, 0, 0, 0, 1, 1,
-0.9299023, -0.3739624, -1.688768, 0, 0, 0, 1, 1,
-0.9283241, 0.6638004, -2.049142, 0, 0, 0, 1, 1,
-0.9264006, 1.946899, -1.662464, 1, 1, 1, 1, 1,
-0.9258785, -0.1911288, -1.277168, 1, 1, 1, 1, 1,
-0.9106838, 0.9111369, -0.4466401, 1, 1, 1, 1, 1,
-0.9080674, -0.02436806, -0.1972832, 1, 1, 1, 1, 1,
-0.8863364, 1.210478, -0.672676, 1, 1, 1, 1, 1,
-0.885671, 0.9866983, -1.563324, 1, 1, 1, 1, 1,
-0.8796764, 0.5533494, -1.131386, 1, 1, 1, 1, 1,
-0.8774161, -0.6582075, -2.246006, 1, 1, 1, 1, 1,
-0.8749521, 0.4405352, -1.850236, 1, 1, 1, 1, 1,
-0.8729853, 0.9067935, 0.2117369, 1, 1, 1, 1, 1,
-0.8707074, 0.4753681, -2.542264, 1, 1, 1, 1, 1,
-0.8697912, -3.715392, -2.432192, 1, 1, 1, 1, 1,
-0.8685139, 0.3496242, -1.162754, 1, 1, 1, 1, 1,
-0.8679084, 0.03683127, -0.2413751, 1, 1, 1, 1, 1,
-0.8671331, -0.03293554, -1.630494, 1, 1, 1, 1, 1,
-0.8663971, 0.7383212, -2.810509, 0, 0, 1, 1, 1,
-0.8648206, 1.224962, -1.578606, 1, 0, 0, 1, 1,
-0.8628558, -0.5537446, -3.161363, 1, 0, 0, 1, 1,
-0.859837, 0.1116795, -1.932251, 1, 0, 0, 1, 1,
-0.8551424, -0.02636734, -1.801237, 1, 0, 0, 1, 1,
-0.8512791, -0.8737473, -3.856146, 1, 0, 0, 1, 1,
-0.8458864, 0.5739986, -1.186904, 0, 0, 0, 1, 1,
-0.8376791, 0.1957236, -1.53338, 0, 0, 0, 1, 1,
-0.8350531, 0.8422417, -0.4983434, 0, 0, 0, 1, 1,
-0.824697, -0.7049506, -3.950801, 0, 0, 0, 1, 1,
-0.8228881, -0.554903, -0.6090816, 0, 0, 0, 1, 1,
-0.8012613, 1.05187, -0.9613565, 0, 0, 0, 1, 1,
-0.7909934, 0.1727235, 1.471338, 0, 0, 0, 1, 1,
-0.7812115, -1.432864, -1.164098, 1, 1, 1, 1, 1,
-0.7719201, 1.503263, -0.3574534, 1, 1, 1, 1, 1,
-0.7670968, -0.1961707, -4.514851, 1, 1, 1, 1, 1,
-0.7656212, -2.950022, -2.304027, 1, 1, 1, 1, 1,
-0.7641698, -1.363878, -3.41481, 1, 1, 1, 1, 1,
-0.7613988, 1.127257, 0.1907065, 1, 1, 1, 1, 1,
-0.7603893, 1.242874, -0.284212, 1, 1, 1, 1, 1,
-0.759056, -0.7065329, -2.218827, 1, 1, 1, 1, 1,
-0.7588792, -0.2217116, -4.34955, 1, 1, 1, 1, 1,
-0.754863, -0.653864, -2.040289, 1, 1, 1, 1, 1,
-0.7535132, 0.4429241, -2.036311, 1, 1, 1, 1, 1,
-0.7512611, -0.2483628, -2.64586, 1, 1, 1, 1, 1,
-0.7510482, 0.2693477, -1.829224, 1, 1, 1, 1, 1,
-0.7482603, -0.6866648, -0.7441475, 1, 1, 1, 1, 1,
-0.7456194, 0.8019498, -1.410354, 1, 1, 1, 1, 1,
-0.7438635, 3.25899, 0.4744149, 0, 0, 1, 1, 1,
-0.7404683, 0.8229637, -0.7386045, 1, 0, 0, 1, 1,
-0.7372401, 1.658564, 0.06392583, 1, 0, 0, 1, 1,
-0.7333223, -1.504502, -4.0792, 1, 0, 0, 1, 1,
-0.7327015, 0.8703384, 2.659476, 1, 0, 0, 1, 1,
-0.7307364, 0.3973815, -1.010796, 1, 0, 0, 1, 1,
-0.7268283, 0.1554337, -0.4463171, 0, 0, 0, 1, 1,
-0.7245889, -0.6008353, -2.95531, 0, 0, 0, 1, 1,
-0.7244343, -1.878692, -2.541473, 0, 0, 0, 1, 1,
-0.7231163, -0.01223249, -1.700257, 0, 0, 0, 1, 1,
-0.7195556, -0.8034719, -2.344686, 0, 0, 0, 1, 1,
-0.719028, 0.6537253, -0.457907, 0, 0, 0, 1, 1,
-0.7166308, 1.619238, -0.2567117, 0, 0, 0, 1, 1,
-0.7163652, -1.114665, -3.802889, 1, 1, 1, 1, 1,
-0.7117537, -0.1914878, -1.673169, 1, 1, 1, 1, 1,
-0.7100273, 1.235552, -0.2551118, 1, 1, 1, 1, 1,
-0.7005438, -1.148291, -2.358527, 1, 1, 1, 1, 1,
-0.6925761, -0.9512729, -3.509497, 1, 1, 1, 1, 1,
-0.6893282, -1.212874, -2.88365, 1, 1, 1, 1, 1,
-0.688444, -1.626116, -3.188093, 1, 1, 1, 1, 1,
-0.6873017, 0.218133, -1.306319, 1, 1, 1, 1, 1,
-0.6805743, 0.3879414, -0.5617242, 1, 1, 1, 1, 1,
-0.6769749, -0.06857448, -2.775791, 1, 1, 1, 1, 1,
-0.6741099, -2.185392, -1.23835, 1, 1, 1, 1, 1,
-0.6704962, -1.363724, -2.909076, 1, 1, 1, 1, 1,
-0.6704337, -0.05696026, -1.513578, 1, 1, 1, 1, 1,
-0.6670137, -0.4803879, -2.844514, 1, 1, 1, 1, 1,
-0.6660395, -0.421766, -1.83293, 1, 1, 1, 1, 1,
-0.6626167, -0.4158623, -3.007446, 0, 0, 1, 1, 1,
-0.6555021, -0.4669563, -1.117036, 1, 0, 0, 1, 1,
-0.6552668, 0.2994801, -1.59841, 1, 0, 0, 1, 1,
-0.6542582, -0.1097284, -3.289471, 1, 0, 0, 1, 1,
-0.651907, 0.2457694, -0.5265701, 1, 0, 0, 1, 1,
-0.6460586, 0.3880013, -0.99166, 1, 0, 0, 1, 1,
-0.6438904, 1.164239, -1.855004, 0, 0, 0, 1, 1,
-0.643014, -1.788651, -2.227329, 0, 0, 0, 1, 1,
-0.6428723, -1.293582, -3.232969, 0, 0, 0, 1, 1,
-0.6418035, -1.357742, -4.183563, 0, 0, 0, 1, 1,
-0.6376002, 1.287756, -0.4090595, 0, 0, 0, 1, 1,
-0.6371132, 0.1848532, -1.945536, 0, 0, 0, 1, 1,
-0.635254, 0.7237129, -0.2710196, 0, 0, 0, 1, 1,
-0.6273081, 1.237086, -0.7963799, 1, 1, 1, 1, 1,
-0.6242393, -0.5009786, -2.698801, 1, 1, 1, 1, 1,
-0.6129514, 0.7929991, -1.121668, 1, 1, 1, 1, 1,
-0.6123905, -0.3970979, -2.773751, 1, 1, 1, 1, 1,
-0.6079526, -0.4927774, -1.462163, 1, 1, 1, 1, 1,
-0.6023146, 1.432095, 0.4062219, 1, 1, 1, 1, 1,
-0.6017206, -1.599464, -4.064986, 1, 1, 1, 1, 1,
-0.5995727, 1.615855, -0.7413464, 1, 1, 1, 1, 1,
-0.5971885, -0.07196593, -1.512683, 1, 1, 1, 1, 1,
-0.5944269, 0.08599959, -0.5830331, 1, 1, 1, 1, 1,
-0.5904598, 1.178918, -1.536187, 1, 1, 1, 1, 1,
-0.5882117, 1.12733, -1.153823, 1, 1, 1, 1, 1,
-0.586215, -0.5234523, -3.446112, 1, 1, 1, 1, 1,
-0.579517, 0.6609545, -1.967267, 1, 1, 1, 1, 1,
-0.5709211, 0.8256496, -1.399298, 1, 1, 1, 1, 1,
-0.5681263, -1.283629, -1.729196, 0, 0, 1, 1, 1,
-0.5680524, 0.1250498, -3.760064, 1, 0, 0, 1, 1,
-0.5672538, -0.96071, -1.332145, 1, 0, 0, 1, 1,
-0.5645421, 0.8974057, 0.5272904, 1, 0, 0, 1, 1,
-0.5641135, -0.07053348, -1.142317, 1, 0, 0, 1, 1,
-0.5640126, 1.837044, 0.4723319, 1, 0, 0, 1, 1,
-0.5613858, -0.4658092, -2.37941, 0, 0, 0, 1, 1,
-0.5601097, 2.844187, 1.546807, 0, 0, 0, 1, 1,
-0.5550754, -0.7701062, -2.842897, 0, 0, 0, 1, 1,
-0.5480089, -0.008870958, 0.07232336, 0, 0, 0, 1, 1,
-0.547796, -1.134023, -3.14212, 0, 0, 0, 1, 1,
-0.5476853, -1.210566, -3.374777, 0, 0, 0, 1, 1,
-0.5456979, 0.6496189, -2.005325, 0, 0, 0, 1, 1,
-0.5414461, -0.7950457, -3.554652, 1, 1, 1, 1, 1,
-0.5404392, 1.270053, 0.2029306, 1, 1, 1, 1, 1,
-0.5391484, -0.8170778, -2.990628, 1, 1, 1, 1, 1,
-0.5389318, -0.6411535, -2.457159, 1, 1, 1, 1, 1,
-0.5326912, 0.2699093, 0.4093802, 1, 1, 1, 1, 1,
-0.5306458, 0.5033908, -2.57743, 1, 1, 1, 1, 1,
-0.5292592, -0.9122357, -2.121585, 1, 1, 1, 1, 1,
-0.5286782, 1.617361, 0.5084448, 1, 1, 1, 1, 1,
-0.5285744, -1.22077, -1.53739, 1, 1, 1, 1, 1,
-0.5269021, 0.2531302, -2.659762, 1, 1, 1, 1, 1,
-0.5245067, -0.7336606, -3.429724, 1, 1, 1, 1, 1,
-0.5224298, 0.06997448, 0.7391383, 1, 1, 1, 1, 1,
-0.5180095, 0.6248906, -0.6088699, 1, 1, 1, 1, 1,
-0.5176203, -0.2833176, -2.692316, 1, 1, 1, 1, 1,
-0.5171632, -0.6568212, -1.940757, 1, 1, 1, 1, 1,
-0.5168224, 0.6009058, -1.263094, 0, 0, 1, 1, 1,
-0.5131034, 0.5438672, -0.2450539, 1, 0, 0, 1, 1,
-0.512418, 0.6356847, -0.7417671, 1, 0, 0, 1, 1,
-0.5104934, 0.1219838, -1.546118, 1, 0, 0, 1, 1,
-0.4965396, 1.314191, -1.86384, 1, 0, 0, 1, 1,
-0.4927356, 0.6862321, -0.6903247, 1, 0, 0, 1, 1,
-0.4922053, -0.4398389, -2.885976, 0, 0, 0, 1, 1,
-0.4910566, 1.503718, 0.07987095, 0, 0, 0, 1, 1,
-0.4904082, 0.6092988, -0.5842671, 0, 0, 0, 1, 1,
-0.4867879, -1.201744, -2.599454, 0, 0, 0, 1, 1,
-0.4865605, 0.8151965, -1.796407, 0, 0, 0, 1, 1,
-0.4847934, -0.123356, -3.074556, 0, 0, 0, 1, 1,
-0.4828582, -0.1947355, -2.039952, 0, 0, 0, 1, 1,
-0.4787204, 0.2712126, -1.403713, 1, 1, 1, 1, 1,
-0.4775347, 1.515006, -0.5703082, 1, 1, 1, 1, 1,
-0.4712526, -0.4163094, -2.957104, 1, 1, 1, 1, 1,
-0.4709408, -0.2791029, -1.349907, 1, 1, 1, 1, 1,
-0.4697096, -0.4953621, -2.188562, 1, 1, 1, 1, 1,
-0.4678729, 0.4134841, -0.4723007, 1, 1, 1, 1, 1,
-0.4669611, -0.4580173, -2.994234, 1, 1, 1, 1, 1,
-0.4650602, 1.319301, -1.215743, 1, 1, 1, 1, 1,
-0.4629371, -1.781188, -2.655856, 1, 1, 1, 1, 1,
-0.4617708, -0.0915492, -1.926273, 1, 1, 1, 1, 1,
-0.4584365, -0.1137455, -1.738079, 1, 1, 1, 1, 1,
-0.4570636, 0.2736732, -1.140904, 1, 1, 1, 1, 1,
-0.456913, -0.9484407, -2.498175, 1, 1, 1, 1, 1,
-0.4563942, 1.082251, -1.216271, 1, 1, 1, 1, 1,
-0.4493775, -0.4309739, -1.419851, 1, 1, 1, 1, 1,
-0.4461271, -0.3649946, -2.065112, 0, 0, 1, 1, 1,
-0.4430794, 0.5627704, -1.589378, 1, 0, 0, 1, 1,
-0.4379971, 1.06102, 0.1752952, 1, 0, 0, 1, 1,
-0.4309382, -0.1075854, -3.26004, 1, 0, 0, 1, 1,
-0.4291681, -0.6501868, -0.4906379, 1, 0, 0, 1, 1,
-0.424256, -0.4101919, -2.680376, 1, 0, 0, 1, 1,
-0.4212954, -0.004730397, -1.074691, 0, 0, 0, 1, 1,
-0.4189553, -0.366208, -1.756988, 0, 0, 0, 1, 1,
-0.417609, -1.208458, -4.066141, 0, 0, 0, 1, 1,
-0.416643, -0.7780172, -1.214652, 0, 0, 0, 1, 1,
-0.4122209, 0.6068342, -0.2391751, 0, 0, 0, 1, 1,
-0.4113191, 0.6119538, -0.5255057, 0, 0, 0, 1, 1,
-0.4077366, -1.591145, -1.725279, 0, 0, 0, 1, 1,
-0.4051585, -1.006902, -2.04636, 1, 1, 1, 1, 1,
-0.4026177, -1.80443, -2.093895, 1, 1, 1, 1, 1,
-0.4018812, -1.005117, -3.574305, 1, 1, 1, 1, 1,
-0.4016019, 0.8924078, -0.124052, 1, 1, 1, 1, 1,
-0.3986706, -0.3584218, -1.860453, 1, 1, 1, 1, 1,
-0.3950672, 0.8550965, -0.3644387, 1, 1, 1, 1, 1,
-0.3948761, -0.847922, -3.544284, 1, 1, 1, 1, 1,
-0.3928969, -0.8810288, -1.848871, 1, 1, 1, 1, 1,
-0.3909962, 0.02103897, -0.9035254, 1, 1, 1, 1, 1,
-0.3883474, -1.033009, -2.42794, 1, 1, 1, 1, 1,
-0.3844579, -1.989883, -2.650736, 1, 1, 1, 1, 1,
-0.3844214, -0.1572363, -1.027681, 1, 1, 1, 1, 1,
-0.380557, -1.092805, -3.314055, 1, 1, 1, 1, 1,
-0.3801212, -0.3319433, -2.766574, 1, 1, 1, 1, 1,
-0.378568, 0.5725329, 0.2808859, 1, 1, 1, 1, 1,
-0.3727695, -0.7226683, -1.385125, 0, 0, 1, 1, 1,
-0.3669346, -0.07947081, -1.785814, 1, 0, 0, 1, 1,
-0.3616876, -0.9312598, -2.825596, 1, 0, 0, 1, 1,
-0.360295, 1.252652, 0.2515863, 1, 0, 0, 1, 1,
-0.3556634, 0.02514387, -2.364428, 1, 0, 0, 1, 1,
-0.3551494, -1.639386, -2.688613, 1, 0, 0, 1, 1,
-0.3512257, 1.47937, -0.1996886, 0, 0, 0, 1, 1,
-0.3496832, -0.2314425, -2.794511, 0, 0, 0, 1, 1,
-0.3495677, 1.841243, -0.5755363, 0, 0, 0, 1, 1,
-0.3475445, -0.401114, -1.635894, 0, 0, 0, 1, 1,
-0.3472499, -0.1151715, -1.064119, 0, 0, 0, 1, 1,
-0.3464815, -0.5619436, -2.824396, 0, 0, 0, 1, 1,
-0.3425835, -0.4383095, -2.144108, 0, 0, 0, 1, 1,
-0.3404495, 0.04482408, -1.916473, 1, 1, 1, 1, 1,
-0.3390753, 0.1654903, -1.350239, 1, 1, 1, 1, 1,
-0.3390577, 1.556256, -1.841773, 1, 1, 1, 1, 1,
-0.338398, -0.2127621, -3.580261, 1, 1, 1, 1, 1,
-0.3376102, -1.115, -3.003728, 1, 1, 1, 1, 1,
-0.3357529, -0.5862568, -4.734081, 1, 1, 1, 1, 1,
-0.3178064, 1.661431, -0.04962932, 1, 1, 1, 1, 1,
-0.3159536, -0.08637145, -1.480911, 1, 1, 1, 1, 1,
-0.3153433, -0.939836, -3.59475, 1, 1, 1, 1, 1,
-0.3128161, 0.2572185, -0.02535007, 1, 1, 1, 1, 1,
-0.309191, -2.465608, -3.855935, 1, 1, 1, 1, 1,
-0.308049, 1.82215, -0.02921346, 1, 1, 1, 1, 1,
-0.3054428, 0.4751275, 0.312547, 1, 1, 1, 1, 1,
-0.3053152, -0.03691843, -3.189522, 1, 1, 1, 1, 1,
-0.2921937, -1.04688, -3.791269, 1, 1, 1, 1, 1,
-0.2911843, -0.7825133, -2.623277, 0, 0, 1, 1, 1,
-0.2889988, -0.02021874, -2.098084, 1, 0, 0, 1, 1,
-0.2886879, 2.32232, -0.6134905, 1, 0, 0, 1, 1,
-0.2873704, -0.5509954, -2.729788, 1, 0, 0, 1, 1,
-0.2856791, 2.755435, -0.8060327, 1, 0, 0, 1, 1,
-0.2855054, 1.169516, 1.112022, 1, 0, 0, 1, 1,
-0.2825126, -0.4576075, -3.653921, 0, 0, 0, 1, 1,
-0.2820437, -0.3619504, -3.057831, 0, 0, 0, 1, 1,
-0.2793244, 0.6357332, -0.5026744, 0, 0, 0, 1, 1,
-0.2712082, -1.765303, -2.995832, 0, 0, 0, 1, 1,
-0.2705594, -0.6258473, -4.025897, 0, 0, 0, 1, 1,
-0.2658378, -1.736671, -3.129408, 0, 0, 0, 1, 1,
-0.2645957, -1.56863, -0.8664505, 0, 0, 0, 1, 1,
-0.2632906, -0.7512457, -2.3684, 1, 1, 1, 1, 1,
-0.2619359, -0.2604201, -1.329406, 1, 1, 1, 1, 1,
-0.2602434, 0.1980959, -2.407985, 1, 1, 1, 1, 1,
-0.2544248, 0.1627693, -1.016626, 1, 1, 1, 1, 1,
-0.2530217, -1.216498, -3.564095, 1, 1, 1, 1, 1,
-0.2528591, 0.1902907, -1.942305, 1, 1, 1, 1, 1,
-0.2510029, 1.203284, -0.154553, 1, 1, 1, 1, 1,
-0.2507385, 0.9622672, -0.3037901, 1, 1, 1, 1, 1,
-0.2483084, 0.7426959, 1.62876, 1, 1, 1, 1, 1,
-0.2480978, 0.4589891, 0.3399601, 1, 1, 1, 1, 1,
-0.2459491, 0.2734901, -1.816355, 1, 1, 1, 1, 1,
-0.2409035, 0.7391174, -1.861041, 1, 1, 1, 1, 1,
-0.2337891, 0.6665687, 1.143092, 1, 1, 1, 1, 1,
-0.2326231, -0.6854252, -1.912962, 1, 1, 1, 1, 1,
-0.2308212, 1.859496, -0.8410305, 1, 1, 1, 1, 1,
-0.2233929, -0.03742554, -2.206663, 0, 0, 1, 1, 1,
-0.2211019, 1.225488, 0.1948407, 1, 0, 0, 1, 1,
-0.2165745, -0.3949413, -2.741826, 1, 0, 0, 1, 1,
-0.2127477, -1.750269, -4.002337, 1, 0, 0, 1, 1,
-0.209819, -0.24324, -2.467175, 1, 0, 0, 1, 1,
-0.2096328, -0.1975774, -0.1674058, 1, 0, 0, 1, 1,
-0.2091221, 0.06032442, -1.505353, 0, 0, 0, 1, 1,
-0.2074126, 0.8691606, 1.173274, 0, 0, 0, 1, 1,
-0.2018742, -0.5859329, -2.699662, 0, 0, 0, 1, 1,
-0.1988642, 1.031443, -0.3416286, 0, 0, 0, 1, 1,
-0.1979022, 0.203567, -1.125898, 0, 0, 0, 1, 1,
-0.1956546, 1.591272, 1.027005, 0, 0, 0, 1, 1,
-0.194077, -1.766394, -2.511362, 0, 0, 0, 1, 1,
-0.1855692, -0.4764479, -1.648438, 1, 1, 1, 1, 1,
-0.184777, 0.4229251, 0.3914361, 1, 1, 1, 1, 1,
-0.1837727, -0.650391, -3.565747, 1, 1, 1, 1, 1,
-0.1826395, -1.016668, -3.83913, 1, 1, 1, 1, 1,
-0.1812878, -0.01255141, -2.52083, 1, 1, 1, 1, 1,
-0.1809655, 0.07251899, -1.475227, 1, 1, 1, 1, 1,
-0.1788131, 0.03267866, -0.7613198, 1, 1, 1, 1, 1,
-0.1776803, -0.0749954, -0.7174019, 1, 1, 1, 1, 1,
-0.1756095, -0.3596907, -1.979407, 1, 1, 1, 1, 1,
-0.1718771, 1.144389, -0.1574724, 1, 1, 1, 1, 1,
-0.1649858, 0.9561813, -0.4889067, 1, 1, 1, 1, 1,
-0.1649791, -0.6881273, -3.349268, 1, 1, 1, 1, 1,
-0.1619136, 0.9754091, 1.676706, 1, 1, 1, 1, 1,
-0.1556958, 0.3450094, 0.3920778, 1, 1, 1, 1, 1,
-0.1510705, -0.4736811, -2.633044, 1, 1, 1, 1, 1,
-0.1490489, 0.4559051, -2.967217, 0, 0, 1, 1, 1,
-0.1440935, -0.4101933, -4.054998, 1, 0, 0, 1, 1,
-0.1440264, 1.577082, -0.001864769, 1, 0, 0, 1, 1,
-0.1418676, -0.5588878, -2.328985, 1, 0, 0, 1, 1,
-0.1417527, -1.226238, -2.233684, 1, 0, 0, 1, 1,
-0.1340828, 0.2972415, -0.08828746, 1, 0, 0, 1, 1,
-0.1311635, 1.500188, 0.4651721, 0, 0, 0, 1, 1,
-0.1308823, -0.3897437, -2.686193, 0, 0, 0, 1, 1,
-0.1307608, -0.8233035, -1.008853, 0, 0, 0, 1, 1,
-0.1262437, 0.4654743, -0.3010512, 0, 0, 0, 1, 1,
-0.1260287, -0.8461205, -2.73107, 0, 0, 0, 1, 1,
-0.1196309, -2.522288, -3.120871, 0, 0, 0, 1, 1,
-0.1182303, 0.6481094, -1.176651, 0, 0, 0, 1, 1,
-0.1166284, 2.426493, -1.818297, 1, 1, 1, 1, 1,
-0.1140736, 1.664404, 0.6571528, 1, 1, 1, 1, 1,
-0.1092161, -1.437438, -3.487902, 1, 1, 1, 1, 1,
-0.1066326, 0.1270646, 0.4233392, 1, 1, 1, 1, 1,
-0.1062363, -1.74709, -0.9332371, 1, 1, 1, 1, 1,
-0.1048949, 1.556, 0.8627732, 1, 1, 1, 1, 1,
-0.1035792, -1.384689, -3.683052, 1, 1, 1, 1, 1,
-0.09072269, -0.3292012, -2.330341, 1, 1, 1, 1, 1,
-0.090445, -1.726869, -3.274847, 1, 1, 1, 1, 1,
-0.08751505, -0.2454995, -1.950893, 1, 1, 1, 1, 1,
-0.08690821, -0.6061413, -2.450881, 1, 1, 1, 1, 1,
-0.08317062, -0.9739966, -2.588207, 1, 1, 1, 1, 1,
-0.07496494, -0.2489715, -2.256439, 1, 1, 1, 1, 1,
-0.07308444, -0.07020298, -2.363265, 1, 1, 1, 1, 1,
-0.07233059, 0.2350065, 1.245925, 1, 1, 1, 1, 1,
-0.07229958, -0.04673287, -1.526647, 0, 0, 1, 1, 1,
-0.0708039, -0.3925557, -1.821903, 1, 0, 0, 1, 1,
-0.07062784, 0.2666791, 0.5884061, 1, 0, 0, 1, 1,
-0.06904701, 1.251818, 1.594002, 1, 0, 0, 1, 1,
-0.06899171, 0.04731716, -1.072306, 1, 0, 0, 1, 1,
-0.06698844, -0.3510974, -3.605781, 1, 0, 0, 1, 1,
-0.06409398, -0.8367567, -3.754186, 0, 0, 0, 1, 1,
-0.06291596, 1.295344, -2.423538, 0, 0, 0, 1, 1,
-0.05988081, -0.3993903, -4.17339, 0, 0, 0, 1, 1,
-0.05647944, 0.7401908, 0.5350254, 0, 0, 0, 1, 1,
-0.05544031, -0.07435089, -0.956566, 0, 0, 0, 1, 1,
-0.05461394, 0.4117347, -0.4332336, 0, 0, 0, 1, 1,
-0.05146781, 0.4199523, 0.4205749, 0, 0, 0, 1, 1,
-0.05092361, -0.03241231, -2.289613, 1, 1, 1, 1, 1,
-0.04532022, -0.3798574, -2.753132, 1, 1, 1, 1, 1,
-0.04317199, 0.06537893, 0.298903, 1, 1, 1, 1, 1,
-0.04259202, 0.9927552, 0.08118511, 1, 1, 1, 1, 1,
-0.04157504, -0.5684639, -3.629112, 1, 1, 1, 1, 1,
-0.04111941, -0.2970102, -2.18941, 1, 1, 1, 1, 1,
-0.03920177, 0.5567459, -0.8057404, 1, 1, 1, 1, 1,
-0.03772419, -1.02102, -2.808662, 1, 1, 1, 1, 1,
-0.03618861, 0.6265009, 0.6529581, 1, 1, 1, 1, 1,
-0.03570654, -2.020725, -2.136293, 1, 1, 1, 1, 1,
-0.03471508, 0.3507186, -2.222701, 1, 1, 1, 1, 1,
-0.03065164, -0.7962779, -3.830363, 1, 1, 1, 1, 1,
-0.02954924, 2.538252, 0.08098494, 1, 1, 1, 1, 1,
-0.02946263, 0.2465556, -0.4052762, 1, 1, 1, 1, 1,
-0.02861289, 0.3482079, 0.6015786, 1, 1, 1, 1, 1,
-0.02770611, -0.6788102, -2.28819, 0, 0, 1, 1, 1,
-0.02381447, 0.8450627, -0.2775128, 1, 0, 0, 1, 1,
-0.02315198, -0.408266, -1.826007, 1, 0, 0, 1, 1,
-0.02313546, 0.3723092, 0.5833564, 1, 0, 0, 1, 1,
-0.01680959, 1.064862, -0.7270166, 1, 0, 0, 1, 1,
-0.01592483, 2.008518, -0.1961656, 1, 0, 0, 1, 1,
-0.01432823, -0.8749043, -5.535328, 0, 0, 0, 1, 1,
-0.01228945, -0.201653, -3.725991, 0, 0, 0, 1, 1,
-0.00920018, -0.5250856, -3.35018, 0, 0, 0, 1, 1,
-0.000254369, 0.2223006, -1.972797, 0, 0, 0, 1, 1,
0.0003874374, -1.113931, 2.595188, 0, 0, 0, 1, 1,
0.001031151, 0.2065479, -1.066493, 0, 0, 0, 1, 1,
0.001423777, -1.320019, 3.258187, 0, 0, 0, 1, 1,
0.01021526, -0.19313, 2.019325, 1, 1, 1, 1, 1,
0.01153124, 0.03589362, 0.3139868, 1, 1, 1, 1, 1,
0.01256423, -1.260668, 3.695105, 1, 1, 1, 1, 1,
0.01515072, 1.220876, 0.5101736, 1, 1, 1, 1, 1,
0.01782272, -1.207792, 2.939557, 1, 1, 1, 1, 1,
0.01896236, -1.125308, 5.073397, 1, 1, 1, 1, 1,
0.02122135, -0.1627798, 4.134804, 1, 1, 1, 1, 1,
0.02247572, 1.273577, -0.1372001, 1, 1, 1, 1, 1,
0.02944583, -0.1429793, 1.994436, 1, 1, 1, 1, 1,
0.03486627, 0.1050822, -0.4830755, 1, 1, 1, 1, 1,
0.0365892, 1.283508, 1.061511, 1, 1, 1, 1, 1,
0.03853586, 1.560513, -0.5161383, 1, 1, 1, 1, 1,
0.0445256, 0.01552171, 0.04292602, 1, 1, 1, 1, 1,
0.04544746, 1.075174, -0.05189194, 1, 1, 1, 1, 1,
0.04726628, -0.7839279, 4.406158, 1, 1, 1, 1, 1,
0.0478276, -0.6059377, 3.233789, 0, 0, 1, 1, 1,
0.05185479, -0.1123227, 1.115216, 1, 0, 0, 1, 1,
0.05552575, 1.416968, -0.8846729, 1, 0, 0, 1, 1,
0.0612734, -1.060676, 2.11808, 1, 0, 0, 1, 1,
0.06444636, 0.4090288, -0.4726709, 1, 0, 0, 1, 1,
0.07414348, 1.65357, 2.947035, 1, 0, 0, 1, 1,
0.07690026, 0.4251978, 0.1211776, 0, 0, 0, 1, 1,
0.07925545, 0.2005697, 1.932222, 0, 0, 0, 1, 1,
0.07954977, -2.272583, 4.108179, 0, 0, 0, 1, 1,
0.07963719, 0.2261994, -1.611783, 0, 0, 0, 1, 1,
0.0847296, -0.9633544, 1.95831, 0, 0, 0, 1, 1,
0.08568052, 0.8740724, 0.913798, 0, 0, 0, 1, 1,
0.09077056, 1.02542, 2.069895, 0, 0, 0, 1, 1,
0.09575798, 0.7153533, -0.4689009, 1, 1, 1, 1, 1,
0.1001196, -1.465096, 3.348447, 1, 1, 1, 1, 1,
0.1027978, -0.02679568, 2.22329, 1, 1, 1, 1, 1,
0.1049247, 0.4823951, -0.02865865, 1, 1, 1, 1, 1,
0.105963, 0.3430771, 0.8684515, 1, 1, 1, 1, 1,
0.1063252, 0.8644764, 1.17021, 1, 1, 1, 1, 1,
0.1064112, 0.3128578, 1.994769, 1, 1, 1, 1, 1,
0.1105684, 0.2532911, -0.9614311, 1, 1, 1, 1, 1,
0.1149255, 0.05385702, -0.07894596, 1, 1, 1, 1, 1,
0.1151484, -0.5364195, 3.771383, 1, 1, 1, 1, 1,
0.1152002, -0.2636186, 2.628599, 1, 1, 1, 1, 1,
0.117521, 0.1749948, 0.9485358, 1, 1, 1, 1, 1,
0.1198704, 0.7132607, 0.5985947, 1, 1, 1, 1, 1,
0.1215238, 0.9814847, 0.4802529, 1, 1, 1, 1, 1,
0.1260237, 0.01789719, 2.183522, 1, 1, 1, 1, 1,
0.1300147, 1.574043, 0.753626, 0, 0, 1, 1, 1,
0.1302507, 0.2882957, 0.6071392, 1, 0, 0, 1, 1,
0.1340537, -0.381162, 1.627856, 1, 0, 0, 1, 1,
0.1345432, -0.6876229, 1.253603, 1, 0, 0, 1, 1,
0.1362089, -1.707497, 2.935453, 1, 0, 0, 1, 1,
0.1412844, 0.4835886, 2.253483, 1, 0, 0, 1, 1,
0.1432552, 0.02204402, 1.873533, 0, 0, 0, 1, 1,
0.1465954, -1.045077, 3.55471, 0, 0, 0, 1, 1,
0.1495872, -0.3331939, 2.454239, 0, 0, 0, 1, 1,
0.1500175, -1.068123, 4.237862, 0, 0, 0, 1, 1,
0.1502489, -0.7705878, 3.703856, 0, 0, 0, 1, 1,
0.1520491, 2.14866, -1.141023, 0, 0, 0, 1, 1,
0.1546026, 0.4639344, -0.6134818, 0, 0, 0, 1, 1,
0.155747, 0.5068781, 1.315474, 1, 1, 1, 1, 1,
0.1566677, -0.8611152, 2.499468, 1, 1, 1, 1, 1,
0.1580589, 0.5731862, 1.028482, 1, 1, 1, 1, 1,
0.1596901, -0.8250105, 4.07291, 1, 1, 1, 1, 1,
0.1720619, -0.4833072, 1.934653, 1, 1, 1, 1, 1,
0.1729037, 0.07396991, 2.106158, 1, 1, 1, 1, 1,
0.172982, 0.5598332, 1.870771, 1, 1, 1, 1, 1,
0.1759983, 2.146737, 1.225915, 1, 1, 1, 1, 1,
0.1805479, 0.9458171, 2.471802, 1, 1, 1, 1, 1,
0.183506, -0.2455676, 0.9409881, 1, 1, 1, 1, 1,
0.1901687, 0.1963203, 0.6284459, 1, 1, 1, 1, 1,
0.1913407, -0.273869, 1.551339, 1, 1, 1, 1, 1,
0.1929313, -1.665227, 3.41317, 1, 1, 1, 1, 1,
0.1929673, -0.3685168, 1.610718, 1, 1, 1, 1, 1,
0.1994398, 1.137519, 2.144214, 1, 1, 1, 1, 1,
0.2003163, -1.688321, 2.575223, 0, 0, 1, 1, 1,
0.2005475, -0.01166436, 1.974224, 1, 0, 0, 1, 1,
0.202059, 0.2469239, 1.33716, 1, 0, 0, 1, 1,
0.2040606, -0.7226073, 3.593167, 1, 0, 0, 1, 1,
0.2052135, 0.06508343, 1.930268, 1, 0, 0, 1, 1,
0.2063911, -0.4187997, 1.942468, 1, 0, 0, 1, 1,
0.2116423, -1.471393, 2.396953, 0, 0, 0, 1, 1,
0.2130598, 0.2987633, -1.195586, 0, 0, 0, 1, 1,
0.21342, -0.2162293, 2.881042, 0, 0, 0, 1, 1,
0.2176048, -2.071925, 4.773887, 0, 0, 0, 1, 1,
0.2199066, 0.9308444, -1.377861, 0, 0, 0, 1, 1,
0.222614, -1.476803, 1.690097, 0, 0, 0, 1, 1,
0.2282585, -0.5463467, 1.97514, 0, 0, 0, 1, 1,
0.2324551, -0.0002853185, 0.4637093, 1, 1, 1, 1, 1,
0.2325681, 1.271687, 1.54937, 1, 1, 1, 1, 1,
0.2345301, 0.99546, -0.7165543, 1, 1, 1, 1, 1,
0.2357462, -0.4087932, 3.134116, 1, 1, 1, 1, 1,
0.2360343, -1.513949, 1.710114, 1, 1, 1, 1, 1,
0.23768, 0.008425311, 0.8996649, 1, 1, 1, 1, 1,
0.2410584, -1.121537, 4.936537, 1, 1, 1, 1, 1,
0.2414291, -0.02234864, 3.421373, 1, 1, 1, 1, 1,
0.2438128, -0.3378885, 3.893157, 1, 1, 1, 1, 1,
0.2513394, -0.3913533, 2.955977, 1, 1, 1, 1, 1,
0.2523206, -0.3757058, 2.891151, 1, 1, 1, 1, 1,
0.2579787, -2.042658, 1.370902, 1, 1, 1, 1, 1,
0.2581247, 0.7620591, 1.597864, 1, 1, 1, 1, 1,
0.2679332, -0.3731328, 2.69217, 1, 1, 1, 1, 1,
0.2699321, -0.2838923, 2.167936, 1, 1, 1, 1, 1,
0.2700855, -1.111794, 3.734529, 0, 0, 1, 1, 1,
0.2703832, 1.283268, -1.182572, 1, 0, 0, 1, 1,
0.2708486, -0.7152904, 3.459809, 1, 0, 0, 1, 1,
0.2721683, -1.187562, 2.725461, 1, 0, 0, 1, 1,
0.2755358, 1.731726, -0.1510877, 1, 0, 0, 1, 1,
0.2764036, 0.5575284, -0.7010632, 1, 0, 0, 1, 1,
0.2777353, 0.5647909, -0.9466506, 0, 0, 0, 1, 1,
0.2782858, 0.9924231, 1.232035, 0, 0, 0, 1, 1,
0.2788957, 0.89613, -1.754642, 0, 0, 0, 1, 1,
0.2832387, -0.01876782, 2.905216, 0, 0, 0, 1, 1,
0.284236, 0.7675683, 3.830503, 0, 0, 0, 1, 1,
0.2852755, 0.5514593, 0.9482781, 0, 0, 0, 1, 1,
0.288939, 0.5459606, -0.8361567, 0, 0, 0, 1, 1,
0.2894603, -0.8302946, 2.389823, 1, 1, 1, 1, 1,
0.2924502, -0.7376001, 2.701759, 1, 1, 1, 1, 1,
0.2957081, -0.8299205, 2.047276, 1, 1, 1, 1, 1,
0.3045736, 1.769384, 1.036452, 1, 1, 1, 1, 1,
0.3075267, -0.195279, 0.9413659, 1, 1, 1, 1, 1,
0.3083624, -0.1323162, 1.169562, 1, 1, 1, 1, 1,
0.3121928, 0.007601186, 2.218476, 1, 1, 1, 1, 1,
0.3147127, 1.219159, -0.6190959, 1, 1, 1, 1, 1,
0.3242149, -0.6549423, 3.949399, 1, 1, 1, 1, 1,
0.3244281, 0.5384929, -0.1579974, 1, 1, 1, 1, 1,
0.3307956, -0.07795852, 0.9330398, 1, 1, 1, 1, 1,
0.3322538, -1.22179, 2.826246, 1, 1, 1, 1, 1,
0.3323434, 1.351127, -0.3855776, 1, 1, 1, 1, 1,
0.3339543, -0.009510952, 1.712248, 1, 1, 1, 1, 1,
0.3339603, 1.029029, 0.5589849, 1, 1, 1, 1, 1,
0.3340762, 0.3311883, -0.173543, 0, 0, 1, 1, 1,
0.3357366, 2.141501, -0.8054079, 1, 0, 0, 1, 1,
0.3416013, -0.3342295, 3.146553, 1, 0, 0, 1, 1,
0.3416628, 3.044302, 1.21404, 1, 0, 0, 1, 1,
0.3419601, 1.017342, 0.4134562, 1, 0, 0, 1, 1,
0.3465379, 0.4436715, 0.2540817, 1, 0, 0, 1, 1,
0.3474929, -0.2649996, 3.164665, 0, 0, 0, 1, 1,
0.349007, -0.8886198, 3.597124, 0, 0, 0, 1, 1,
0.3494122, 1.42983, 1.707959, 0, 0, 0, 1, 1,
0.3511842, -0.4757316, 2.590855, 0, 0, 0, 1, 1,
0.3554752, 0.9384162, 0.9665155, 0, 0, 0, 1, 1,
0.3614933, 0.2196794, 1.948337, 0, 0, 0, 1, 1,
0.3640407, -0.4188858, 3.742661, 0, 0, 0, 1, 1,
0.3685148, -0.1170895, 0.8411458, 1, 1, 1, 1, 1,
0.3725751, 0.2244807, 0.9385441, 1, 1, 1, 1, 1,
0.3729693, -0.7099811, 3.355695, 1, 1, 1, 1, 1,
0.3747852, 0.7613384, -0.353064, 1, 1, 1, 1, 1,
0.3756997, 1.181584, -1.727586, 1, 1, 1, 1, 1,
0.3797903, -1.243188, 3.599201, 1, 1, 1, 1, 1,
0.3803592, 0.5906555, 0.7071697, 1, 1, 1, 1, 1,
0.3808126, -0.07355078, 1.990186, 1, 1, 1, 1, 1,
0.3815182, 0.8528258, 0.7320946, 1, 1, 1, 1, 1,
0.3821182, -1.048448, 2.037345, 1, 1, 1, 1, 1,
0.3833455, -1.089688, 3.702879, 1, 1, 1, 1, 1,
0.3841543, -1.512313, 3.712277, 1, 1, 1, 1, 1,
0.3863147, 0.7090148, 0.7901823, 1, 1, 1, 1, 1,
0.3890476, 0.9262338, 1.99059, 1, 1, 1, 1, 1,
0.3927671, 0.07677648, 0.9613245, 1, 1, 1, 1, 1,
0.3930189, -0.8110766, 4.043463, 0, 0, 1, 1, 1,
0.395328, -0.2142205, 3.564855, 1, 0, 0, 1, 1,
0.3968136, -1.013694, 2.968882, 1, 0, 0, 1, 1,
0.3978054, 1.36109, 0.03460269, 1, 0, 0, 1, 1,
0.3999523, -1.185655, 1.904691, 1, 0, 0, 1, 1,
0.4004718, -0.3413804, 2.384408, 1, 0, 0, 1, 1,
0.4013923, -0.2111345, 0.9346055, 0, 0, 0, 1, 1,
0.4032236, -0.53006, 0.9966151, 0, 0, 0, 1, 1,
0.4088788, -0.6502366, 1.977789, 0, 0, 0, 1, 1,
0.4095475, 0.4390598, 2.902218, 0, 0, 0, 1, 1,
0.4113683, -0.3006008, 1.92973, 0, 0, 0, 1, 1,
0.411759, 3.006254, 0.6209517, 0, 0, 0, 1, 1,
0.4137369, -2.063401, 2.154595, 0, 0, 0, 1, 1,
0.4141295, 1.253897, 0.1824799, 1, 1, 1, 1, 1,
0.4163777, 1.176332, 0.4454525, 1, 1, 1, 1, 1,
0.4168193, -1.088789, 1.388166, 1, 1, 1, 1, 1,
0.4184331, -1.937531, 5.156262, 1, 1, 1, 1, 1,
0.4191449, -0.3921919, 0.6210729, 1, 1, 1, 1, 1,
0.4231133, -0.02213842, 2.821299, 1, 1, 1, 1, 1,
0.4271488, 0.2574168, 0.5981649, 1, 1, 1, 1, 1,
0.4290144, -0.574749, 3.988446, 1, 1, 1, 1, 1,
0.4328136, 1.155619, 0.2618412, 1, 1, 1, 1, 1,
0.4348538, -1.195779, 2.60036, 1, 1, 1, 1, 1,
0.4369836, -0.07588759, 1.969168, 1, 1, 1, 1, 1,
0.4411166, -0.2930515, 3.213228, 1, 1, 1, 1, 1,
0.4422113, -0.2444668, 1.462312, 1, 1, 1, 1, 1,
0.446223, -1.192446, 4.920866, 1, 1, 1, 1, 1,
0.4486639, 1.510258, 1.005148, 1, 1, 1, 1, 1,
0.4510107, 0.08273043, 0.6388333, 0, 0, 1, 1, 1,
0.4523755, 0.1748114, 2.065326, 1, 0, 0, 1, 1,
0.4531745, 1.009673, 0.8619047, 1, 0, 0, 1, 1,
0.4537388, -1.437785, 2.169786, 1, 0, 0, 1, 1,
0.454098, 1.411312, 0.4003136, 1, 0, 0, 1, 1,
0.4677572, 1.383985, -0.1544089, 1, 0, 0, 1, 1,
0.4695421, -0.303928, 2.81886, 0, 0, 0, 1, 1,
0.4712097, -0.8675181, 0.4722306, 0, 0, 0, 1, 1,
0.4770435, 0.286849, 2.96722, 0, 0, 0, 1, 1,
0.4819352, -1.757164, -0.2156066, 0, 0, 0, 1, 1,
0.4844661, -0.3222497, 2.149499, 0, 0, 0, 1, 1,
0.4894798, -0.421368, 3.222743, 0, 0, 0, 1, 1,
0.4906895, -0.5627745, 1.588807, 0, 0, 0, 1, 1,
0.4909786, 1.500526, 0.6585159, 1, 1, 1, 1, 1,
0.4912604, -1.233228, 2.987599, 1, 1, 1, 1, 1,
0.5015392, -0.5613084, 0.9022768, 1, 1, 1, 1, 1,
0.5033453, 0.5637524, 0.7020404, 1, 1, 1, 1, 1,
0.503684, -0.5505092, 3.081586, 1, 1, 1, 1, 1,
0.5041199, -0.1117393, 0.8263681, 1, 1, 1, 1, 1,
0.5151894, -0.4659118, 0.4169306, 1, 1, 1, 1, 1,
0.5213618, -2.212148, 4.580268, 1, 1, 1, 1, 1,
0.5213746, -0.9278358, 3.350586, 1, 1, 1, 1, 1,
0.5298117, 0.8931027, -0.07765998, 1, 1, 1, 1, 1,
0.5320336, 0.4047825, 2.049655, 1, 1, 1, 1, 1,
0.5336274, 0.04051556, 1.847151, 1, 1, 1, 1, 1,
0.5397082, -1.55973, 1.841099, 1, 1, 1, 1, 1,
0.5429139, 0.8378621, -0.1463339, 1, 1, 1, 1, 1,
0.5442914, 0.01105221, 1.940048, 1, 1, 1, 1, 1,
0.5515643, 1.353072, -0.3401226, 0, 0, 1, 1, 1,
0.5546031, -1.374933, 2.707138, 1, 0, 0, 1, 1,
0.5551959, -1.991971, 3.5507, 1, 0, 0, 1, 1,
0.5563926, -0.7063084, 2.913413, 1, 0, 0, 1, 1,
0.5578911, -0.951727, 3.068946, 1, 0, 0, 1, 1,
0.56297, 0.1658585, 1.405054, 1, 0, 0, 1, 1,
0.5700161, 0.2837078, 3.22516, 0, 0, 0, 1, 1,
0.5711474, -1.127081, 2.103459, 0, 0, 0, 1, 1,
0.5754575, -1.063128, 1.590343, 0, 0, 0, 1, 1,
0.5772772, -0.7079573, 1.336452, 0, 0, 0, 1, 1,
0.5779372, 0.06926546, 1.799403, 0, 0, 0, 1, 1,
0.5780548, 0.08933282, 0.7765263, 0, 0, 0, 1, 1,
0.5819356, -1.503402, 1.955086, 0, 0, 0, 1, 1,
0.5821786, 0.805016, -0.5885059, 1, 1, 1, 1, 1,
0.5838267, -0.2020764, 2.996187, 1, 1, 1, 1, 1,
0.5915429, -0.7579643, 1.649584, 1, 1, 1, 1, 1,
0.5923507, 0.2374872, 0.9634079, 1, 1, 1, 1, 1,
0.5949813, 0.1740362, 1.6335, 1, 1, 1, 1, 1,
0.6019498, -0.5754678, 3.471577, 1, 1, 1, 1, 1,
0.6051898, -0.6340202, 0.5951227, 1, 1, 1, 1, 1,
0.61229, 1.865261, -1.518777, 1, 1, 1, 1, 1,
0.6138701, -0.9637688, 4.26603, 1, 1, 1, 1, 1,
0.6215774, -0.9880034, 3.006508, 1, 1, 1, 1, 1,
0.634236, 1.29532, -1.14007, 1, 1, 1, 1, 1,
0.6357813, 0.02669628, 1.345951, 1, 1, 1, 1, 1,
0.6396696, 0.6144471, 2.679273, 1, 1, 1, 1, 1,
0.6428646, 1.136232, 0.4853072, 1, 1, 1, 1, 1,
0.6434405, 2.781991, 1.434613, 1, 1, 1, 1, 1,
0.6464916, 0.3883167, 2.070281, 0, 0, 1, 1, 1,
0.6470283, -0.8363824, 1.662702, 1, 0, 0, 1, 1,
0.6511778, 0.232473, 1.855218, 1, 0, 0, 1, 1,
0.6521257, -0.1319526, 3.425581, 1, 0, 0, 1, 1,
0.6526024, -0.1878201, 2.066158, 1, 0, 0, 1, 1,
0.6529803, -1.144244, 2.945815, 1, 0, 0, 1, 1,
0.655569, 0.8150874, 2.24574, 0, 0, 0, 1, 1,
0.6575877, 0.4679925, -0.02528535, 0, 0, 0, 1, 1,
0.6581756, -2.103136, 4.425522, 0, 0, 0, 1, 1,
0.662564, -0.5708395, 1.794705, 0, 0, 0, 1, 1,
0.663562, 1.363579, 1.27086, 0, 0, 0, 1, 1,
0.6636116, -0.3961498, 3.224868, 0, 0, 0, 1, 1,
0.6643646, -1.185014, 3.939914, 0, 0, 0, 1, 1,
0.666727, 1.142054, 2.107702, 1, 1, 1, 1, 1,
0.6721877, -0.1757669, 2.394879, 1, 1, 1, 1, 1,
0.6743042, 0.7332412, 1.066731, 1, 1, 1, 1, 1,
0.6821784, -0.3273141, 2.172565, 1, 1, 1, 1, 1,
0.6837601, -1.22494, 1.539428, 1, 1, 1, 1, 1,
0.6847538, -0.07553247, 2.184879, 1, 1, 1, 1, 1,
0.6883422, 0.750367, 0.9597853, 1, 1, 1, 1, 1,
0.6889373, 0.4900739, 1.669959, 1, 1, 1, 1, 1,
0.6892804, -1.416871, 2.972857, 1, 1, 1, 1, 1,
0.6894013, 0.8038289, 1.935706, 1, 1, 1, 1, 1,
0.6897715, 1.058401, 2.419382, 1, 1, 1, 1, 1,
0.6927712, -0.2756079, 3.057228, 1, 1, 1, 1, 1,
0.7001566, -1.043163, 2.793012, 1, 1, 1, 1, 1,
0.7021173, 1.32855, 0.5148728, 1, 1, 1, 1, 1,
0.7029044, -0.5018976, 1.335972, 1, 1, 1, 1, 1,
0.7068763, 0.03740213, 0.4698288, 0, 0, 1, 1, 1,
0.7087265, 1.482491, -0.05998227, 1, 0, 0, 1, 1,
0.7104515, -0.4083056, 0.9259933, 1, 0, 0, 1, 1,
0.7132691, -0.1916492, 3.154588, 1, 0, 0, 1, 1,
0.7168476, 0.5057347, 1.411104, 1, 0, 0, 1, 1,
0.7175216, -0.8727907, 2.232972, 1, 0, 0, 1, 1,
0.7282263, -1.188483, 3.619371, 0, 0, 0, 1, 1,
0.7306602, -1.43383, 1.51514, 0, 0, 0, 1, 1,
0.7311566, 1.820538, -1.465129, 0, 0, 0, 1, 1,
0.7349586, 0.4528897, 0.9810411, 0, 0, 0, 1, 1,
0.7390814, 0.01520893, 0.02817547, 0, 0, 0, 1, 1,
0.7392423, 0.76559, 1.266335, 0, 0, 0, 1, 1,
0.7419464, 0.2952199, 1.171689, 0, 0, 0, 1, 1,
0.7423069, -1.313396, 3.067959, 1, 1, 1, 1, 1,
0.7429968, -0.5118309, 2.503416, 1, 1, 1, 1, 1,
0.7439765, 0.1878751, 0.4373341, 1, 1, 1, 1, 1,
0.7440557, -2.176822, 3.801634, 1, 1, 1, 1, 1,
0.74683, 0.7161677, 1.466952, 1, 1, 1, 1, 1,
0.7479273, 2.085885, 1.476645, 1, 1, 1, 1, 1,
0.7509783, -0.9579238, 1.966546, 1, 1, 1, 1, 1,
0.7533327, 0.8982597, 1.723776, 1, 1, 1, 1, 1,
0.7584624, -1.190694, 1.158653, 1, 1, 1, 1, 1,
0.7607036, 1.743951, -0.7498186, 1, 1, 1, 1, 1,
0.7679039, -0.739584, 0.6835879, 1, 1, 1, 1, 1,
0.7684612, -0.6325212, 2.097039, 1, 1, 1, 1, 1,
0.7686657, -0.3475432, 1.148402, 1, 1, 1, 1, 1,
0.7702094, 1.095789, -1.165846, 1, 1, 1, 1, 1,
0.7710435, 1.356435, 0.7820781, 1, 1, 1, 1, 1,
0.7783785, -0.07599373, 2.516378, 0, 0, 1, 1, 1,
0.7812908, -0.4061532, 1.9337, 1, 0, 0, 1, 1,
0.7826552, 2.238137, 0.7889087, 1, 0, 0, 1, 1,
0.7837334, -1.015971, 3.633773, 1, 0, 0, 1, 1,
0.7848788, -0.1385807, 2.182865, 1, 0, 0, 1, 1,
0.7885171, 0.4544128, -0.327794, 1, 0, 0, 1, 1,
0.7931252, -2.65142, 2.065791, 0, 0, 0, 1, 1,
0.7946517, 0.6469763, 1.907414, 0, 0, 0, 1, 1,
0.7964477, 0.0147558, 2.670501, 0, 0, 0, 1, 1,
0.8112887, -1.370078, 2.025694, 0, 0, 0, 1, 1,
0.821985, -0.9131498, 2.985816, 0, 0, 0, 1, 1,
0.8286275, -0.2452222, 1.103599, 0, 0, 0, 1, 1,
0.8305246, -0.6531789, 1.565227, 0, 0, 0, 1, 1,
0.8362262, -0.9629427, 2.399464, 1, 1, 1, 1, 1,
0.8381796, -0.2383277, 2.408044, 1, 1, 1, 1, 1,
0.8382087, -1.063918, 1.655169, 1, 1, 1, 1, 1,
0.8404524, 0.2423546, -0.03317557, 1, 1, 1, 1, 1,
0.8409094, 1.726828, 0.3473538, 1, 1, 1, 1, 1,
0.8439637, -1.130171, 3.396685, 1, 1, 1, 1, 1,
0.8457208, -0.4074654, 1.484057, 1, 1, 1, 1, 1,
0.8459026, -2.190477, 1.936844, 1, 1, 1, 1, 1,
0.8498062, 1.686324, 0.8989488, 1, 1, 1, 1, 1,
0.8506994, 0.7952712, 0.7729244, 1, 1, 1, 1, 1,
0.8535502, -0.2573363, 1.807409, 1, 1, 1, 1, 1,
0.856648, -0.4631902, 2.515337, 1, 1, 1, 1, 1,
0.8635217, 0.9838187, 1.814601, 1, 1, 1, 1, 1,
0.8698513, -1.165386, 0.9832172, 1, 1, 1, 1, 1,
0.8745577, 1.537296, 0.1043298, 1, 1, 1, 1, 1,
0.8763705, -0.629533, 4.777148, 0, 0, 1, 1, 1,
0.8803608, 1.146239, -0.009299049, 1, 0, 0, 1, 1,
0.8859972, 0.7255273, 2.494273, 1, 0, 0, 1, 1,
0.8916055, -0.1837089, -0.03814561, 1, 0, 0, 1, 1,
0.8936046, 0.4389477, 2.950761, 1, 0, 0, 1, 1,
0.8999575, 0.6550369, 2.429109, 1, 0, 0, 1, 1,
0.9001934, 0.1496763, 2.905678, 0, 0, 0, 1, 1,
0.9031336, -2.042044, 1.102763, 0, 0, 0, 1, 1,
0.9040537, 0.2296502, 1.719411, 0, 0, 0, 1, 1,
0.9115229, 0.003270578, 2.033341, 0, 0, 0, 1, 1,
0.9168273, 1.775388, 1.162457, 0, 0, 0, 1, 1,
0.9188362, 1.288529, 0.4096672, 0, 0, 0, 1, 1,
0.9205421, 0.8124977, 1.098717, 0, 0, 0, 1, 1,
0.9226459, -1.340153, 2.67053, 1, 1, 1, 1, 1,
0.9279851, -1.148026, 2.959619, 1, 1, 1, 1, 1,
0.9347616, -0.733855, 3.51584, 1, 1, 1, 1, 1,
0.941241, -0.5371594, 1.462544, 1, 1, 1, 1, 1,
0.9468746, 0.15397, -0.2956206, 1, 1, 1, 1, 1,
0.9469839, -0.1047421, 2.123448, 1, 1, 1, 1, 1,
0.9490421, 0.4726083, 2.182974, 1, 1, 1, 1, 1,
0.9663438, -1.272814, 2.092096, 1, 1, 1, 1, 1,
0.9761967, -0.0909233, 3.914984, 1, 1, 1, 1, 1,
0.9770309, -0.6685172, 1.660288, 1, 1, 1, 1, 1,
0.9775743, -1.046952, 4.330514, 1, 1, 1, 1, 1,
0.9790906, 0.3774247, 1.005908, 1, 1, 1, 1, 1,
0.982819, -0.4524667, 3.645094, 1, 1, 1, 1, 1,
0.9876802, -0.319413, 1.867793, 1, 1, 1, 1, 1,
0.9885655, 0.8049788, 1.752145, 1, 1, 1, 1, 1,
0.9909127, -0.3381184, 2.844795, 0, 0, 1, 1, 1,
0.9923238, 0.7045957, 0.8531621, 1, 0, 0, 1, 1,
0.9924323, -0.5660034, 1.997558, 1, 0, 0, 1, 1,
0.9931617, -0.6084483, 2.069937, 1, 0, 0, 1, 1,
0.9941396, -0.5727197, 1.791973, 1, 0, 0, 1, 1,
1.003651, 0.2825115, 0.7923878, 1, 0, 0, 1, 1,
1.007515, 0.1201695, 0.9960402, 0, 0, 0, 1, 1,
1.014385, -1.606347, 1.417083, 0, 0, 0, 1, 1,
1.016791, -0.7605358, 2.901137, 0, 0, 0, 1, 1,
1.018287, -1.17609, 2.252073, 0, 0, 0, 1, 1,
1.021343, -1.534866, 3.204488, 0, 0, 0, 1, 1,
1.022935, -1.105851, 2.154289, 0, 0, 0, 1, 1,
1.028342, -0.3125341, 2.162363, 0, 0, 0, 1, 1,
1.029742, 1.744838, 2.702592, 1, 1, 1, 1, 1,
1.035681, 0.3932845, 2.168633, 1, 1, 1, 1, 1,
1.050952, -0.6986412, 1.484594, 1, 1, 1, 1, 1,
1.05126, -0.2067867, 1.240684, 1, 1, 1, 1, 1,
1.068447, -0.4014286, 1.110988, 1, 1, 1, 1, 1,
1.069475, -0.001926696, 2.19396, 1, 1, 1, 1, 1,
1.077788, 0.6729658, 0.6819964, 1, 1, 1, 1, 1,
1.079344, 0.3203432, 1.892207, 1, 1, 1, 1, 1,
1.095957, -0.6707017, 1.769811, 1, 1, 1, 1, 1,
1.09632, -0.8148102, 3.202937, 1, 1, 1, 1, 1,
1.108471, 1.514337, 2.097185, 1, 1, 1, 1, 1,
1.113053, -0.3962731, 1.435854, 1, 1, 1, 1, 1,
1.115516, -0.3061002, 0.8367789, 1, 1, 1, 1, 1,
1.119431, 1.066503, 1.391951, 1, 1, 1, 1, 1,
1.122299, 0.1015643, -0.7780189, 1, 1, 1, 1, 1,
1.125069, 1.091553, 1.247719, 0, 0, 1, 1, 1,
1.125292, -1.377333, 1.466371, 1, 0, 0, 1, 1,
1.127359, -0.3620408, 3.439539, 1, 0, 0, 1, 1,
1.129045, 2.138564, 1.767036, 1, 0, 0, 1, 1,
1.130508, 0.6880006, -1.567792, 1, 0, 0, 1, 1,
1.132458, 1.143603, -0.6186032, 1, 0, 0, 1, 1,
1.135506, 1.087325, 0.4864127, 0, 0, 0, 1, 1,
1.135883, -0.3492567, 1.634178, 0, 0, 0, 1, 1,
1.138212, 0.8257121, 0.4363647, 0, 0, 0, 1, 1,
1.142051, -0.07799311, 1.8883, 0, 0, 0, 1, 1,
1.144353, 2.268946, 0.9210823, 0, 0, 0, 1, 1,
1.151098, -0.1124402, 1.717275, 0, 0, 0, 1, 1,
1.151859, 0.5331519, 1.245133, 0, 0, 0, 1, 1,
1.159607, -2.583786, 2.770861, 1, 1, 1, 1, 1,
1.163944, -0.9305626, 2.68622, 1, 1, 1, 1, 1,
1.166604, 0.4924671, 1.889762, 1, 1, 1, 1, 1,
1.166958, -1.25823, 2.909403, 1, 1, 1, 1, 1,
1.167997, -0.3987011, 2.144486, 1, 1, 1, 1, 1,
1.172503, -0.3833613, 2.107715, 1, 1, 1, 1, 1,
1.192654, -1.230592, 3.492228, 1, 1, 1, 1, 1,
1.201722, 0.2271111, 0.5974183, 1, 1, 1, 1, 1,
1.238729, 1.714787, 1.193665, 1, 1, 1, 1, 1,
1.242247, 0.8761465, 1.289725, 1, 1, 1, 1, 1,
1.251488, 0.7368796, 0.07517662, 1, 1, 1, 1, 1,
1.259302, 0.5210507, 2.081367, 1, 1, 1, 1, 1,
1.267133, -1.011304, 3.285398, 1, 1, 1, 1, 1,
1.268985, 1.42314, -1.653525, 1, 1, 1, 1, 1,
1.270232, 0.681354, -0.389531, 1, 1, 1, 1, 1,
1.274386, 0.3484564, 2.594867, 0, 0, 1, 1, 1,
1.275684, 0.1546539, 0.1979679, 1, 0, 0, 1, 1,
1.288544, 0.3977065, 1.078051, 1, 0, 0, 1, 1,
1.292959, 0.9059061, 1.804359, 1, 0, 0, 1, 1,
1.293985, -1.236714, 2.332296, 1, 0, 0, 1, 1,
1.301261, 1.048674, -0.02209719, 1, 0, 0, 1, 1,
1.301652, -0.05277147, 1.020413, 0, 0, 0, 1, 1,
1.305243, 0.1184006, 0.3144296, 0, 0, 0, 1, 1,
1.30993, 0.846168, 1.815751, 0, 0, 0, 1, 1,
1.325242, 2.253369, 0.8317754, 0, 0, 0, 1, 1,
1.336733, 0.8978043, 2.092344, 0, 0, 0, 1, 1,
1.343989, 0.1481573, 1.890036, 0, 0, 0, 1, 1,
1.348029, -0.2826744, 2.918497, 0, 0, 0, 1, 1,
1.349502, -0.04605167, 4.429949, 1, 1, 1, 1, 1,
1.352718, -0.3905274, 0.6170048, 1, 1, 1, 1, 1,
1.355586, -0.3983938, 2.938799, 1, 1, 1, 1, 1,
1.360601, -0.2206092, 2.701961, 1, 1, 1, 1, 1,
1.37641, -0.2338267, 1.420593, 1, 1, 1, 1, 1,
1.393355, 0.8849929, 1.096361, 1, 1, 1, 1, 1,
1.396341, 0.3047194, 0.5615782, 1, 1, 1, 1, 1,
1.405599, 1.953305, 0.5940571, 1, 1, 1, 1, 1,
1.406134, -1.059585, 2.292464, 1, 1, 1, 1, 1,
1.421411, -1.263658, 1.444557, 1, 1, 1, 1, 1,
1.422959, 0.4736152, 2.969858, 1, 1, 1, 1, 1,
1.424338, -0.725309, 0.5043975, 1, 1, 1, 1, 1,
1.45109, 0.9017321, -0.4253544, 1, 1, 1, 1, 1,
1.456935, 0.07777732, 2.815924, 1, 1, 1, 1, 1,
1.459372, -1.493404, 2.447002, 1, 1, 1, 1, 1,
1.468796, -1.051454, 0.414289, 0, 0, 1, 1, 1,
1.473752, 1.11256, 0.1537764, 1, 0, 0, 1, 1,
1.478643, -0.51886, 1.219188, 1, 0, 0, 1, 1,
1.493273, 0.6903472, 0.3008165, 1, 0, 0, 1, 1,
1.497525, -0.6446862, 1.748182, 1, 0, 0, 1, 1,
1.502866, -2.003305, 2.433585, 1, 0, 0, 1, 1,
1.520995, -0.3890339, 0.2696476, 0, 0, 0, 1, 1,
1.544723, -0.3521131, 3.883815, 0, 0, 0, 1, 1,
1.547439, 0.5889029, 0.7876277, 0, 0, 0, 1, 1,
1.547844, -1.875194, 2.27109, 0, 0, 0, 1, 1,
1.553268, 0.02980965, 0.5473129, 0, 0, 0, 1, 1,
1.57025, 0.5654721, 3.071357, 0, 0, 0, 1, 1,
1.575716, -0.4063563, 0.8194566, 0, 0, 0, 1, 1,
1.584836, 1.019544, 0.8708693, 1, 1, 1, 1, 1,
1.585584, 0.1849393, 1.455751, 1, 1, 1, 1, 1,
1.588732, -0.489684, 0.3987279, 1, 1, 1, 1, 1,
1.598059, 1.462116, 1.397036, 1, 1, 1, 1, 1,
1.606313, -0.5519491, 3.735092, 1, 1, 1, 1, 1,
1.609154, 0.8025445, 3.197498, 1, 1, 1, 1, 1,
1.627285, 0.4212003, 0.4460634, 1, 1, 1, 1, 1,
1.632702, -0.3982366, 1.858397, 1, 1, 1, 1, 1,
1.634641, 0.9488812, 1.16958, 1, 1, 1, 1, 1,
1.637956, -0.2737952, 2.556423, 1, 1, 1, 1, 1,
1.640303, -0.2802379, 0.9860002, 1, 1, 1, 1, 1,
1.649485, -0.3994055, 2.156181, 1, 1, 1, 1, 1,
1.651532, -0.4790496, 3.007901, 1, 1, 1, 1, 1,
1.653613, -0.5050687, 1.400592, 1, 1, 1, 1, 1,
1.654368, -0.2137293, 1.235927, 1, 1, 1, 1, 1,
1.659575, 0.2345266, 3.529034, 0, 0, 1, 1, 1,
1.667351, 1.350926, 2.21124, 1, 0, 0, 1, 1,
1.668535, -2.497532, 2.374161, 1, 0, 0, 1, 1,
1.677894, 0.1290609, 0.291974, 1, 0, 0, 1, 1,
1.687732, 2.231539, 1.905523, 1, 0, 0, 1, 1,
1.704109, -0.2073227, 0.6488473, 1, 0, 0, 1, 1,
1.712299, -0.01870738, 2.053295, 0, 0, 0, 1, 1,
1.725825, -1.423024, 0.3741514, 0, 0, 0, 1, 1,
1.728258, -0.3932604, 2.080493, 0, 0, 0, 1, 1,
1.742605, -0.6273584, 0.9531044, 0, 0, 0, 1, 1,
1.751181, 0.6173142, -1.278941, 0, 0, 0, 1, 1,
1.751505, 1.919106, -0.04627276, 0, 0, 0, 1, 1,
1.752376, 0.2737184, 0.08360453, 0, 0, 0, 1, 1,
1.761652, -1.292624, 2.825407, 1, 1, 1, 1, 1,
1.762424, 1.03699, -1.048214, 1, 1, 1, 1, 1,
1.762482, -0.4588829, 1.958139, 1, 1, 1, 1, 1,
1.787315, -1.380275, 0.001466544, 1, 1, 1, 1, 1,
1.813913, 0.1211663, 1.558915, 1, 1, 1, 1, 1,
1.814398, 0.7250155, 0.374599, 1, 1, 1, 1, 1,
1.826178, 0.3008289, 1.182078, 1, 1, 1, 1, 1,
1.861873, 0.3028751, 1.268213, 1, 1, 1, 1, 1,
1.876516, -2.19345, 2.348985, 1, 1, 1, 1, 1,
1.881643, -0.2320396, 1.380481, 1, 1, 1, 1, 1,
1.885078, 0.4350262, 1.294132, 1, 1, 1, 1, 1,
1.948859, 0.4304794, -0.3468581, 1, 1, 1, 1, 1,
2.007513, 0.2957683, 3.257597, 1, 1, 1, 1, 1,
2.012647, 0.3018434, -2.012155, 1, 1, 1, 1, 1,
2.071679, -0.1112121, 2.48676, 1, 1, 1, 1, 1,
2.07608, -0.1320352, 2.162266, 0, 0, 1, 1, 1,
2.084166, 0.03927686, 1.545608, 1, 0, 0, 1, 1,
2.114529, -1.768048, 2.520912, 1, 0, 0, 1, 1,
2.137369, -1.137846, 1.813611, 1, 0, 0, 1, 1,
2.154142, -0.153, 1.444046, 1, 0, 0, 1, 1,
2.187005, -0.9459432, 3.198218, 1, 0, 0, 1, 1,
2.191382, 2.464631, -0.128165, 0, 0, 0, 1, 1,
2.268161, 0.941036, 1.023833, 0, 0, 0, 1, 1,
2.32967, 0.07630832, 1.94606, 0, 0, 0, 1, 1,
2.367384, -1.055651, 2.719815, 0, 0, 0, 1, 1,
2.376117, 1.776147, 1.355596, 0, 0, 0, 1, 1,
2.493314, -0.9043532, 3.126406, 0, 0, 0, 1, 1,
2.536551, 0.8258401, 1.633731, 0, 0, 0, 1, 1,
2.650834, 1.707774, 0.9348482, 1, 1, 1, 1, 1,
2.793922, -0.263481, 2.130912, 1, 1, 1, 1, 1,
2.805762, 1.549646, -1.024442, 1, 1, 1, 1, 1,
2.807416, 0.1824179, 2.319524, 1, 1, 1, 1, 1,
3.079019, 0.243928, 2.27922, 1, 1, 1, 1, 1,
3.227808, 0.07681885, 0.2619999, 1, 1, 1, 1, 1,
3.408936, 0.07638012, 2.185905, 1, 1, 1, 1, 1
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
var radius = 9.95481;
var distance = 34.96585;
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
mvMatrix.translate( 0.2273741, 0.2282009, 0.1895328 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.96585);
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
