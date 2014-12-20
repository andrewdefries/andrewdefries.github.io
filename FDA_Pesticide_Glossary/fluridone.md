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
-3.221453, 0.02873837, -0.8789888, 1, 0, 0, 1,
-2.851357, -0.9048927, -3.028477, 1, 0.007843138, 0, 1,
-2.775805, 0.6994438, 0.006293526, 1, 0.01176471, 0, 1,
-2.545332, -1.209034, -1.140791, 1, 0.01960784, 0, 1,
-2.500003, 0.9346092, -0.5130422, 1, 0.02352941, 0, 1,
-2.490598, -1.574823, -2.755763, 1, 0.03137255, 0, 1,
-2.394936, 0.6588495, -0.7383041, 1, 0.03529412, 0, 1,
-2.35652, 0.1922573, -1.453243, 1, 0.04313726, 0, 1,
-2.34106, 0.3148394, -1.827919, 1, 0.04705882, 0, 1,
-2.308594, 1.510615, -0.565087, 1, 0.05490196, 0, 1,
-2.280102, -2.22514, -0.08649343, 1, 0.05882353, 0, 1,
-2.272724, 1.30628, -0.8889772, 1, 0.06666667, 0, 1,
-2.235823, -0.2818676, -1.514931, 1, 0.07058824, 0, 1,
-2.223073, 0.6587522, -0.08843518, 1, 0.07843138, 0, 1,
-2.151421, 1.044592, -0.01137319, 1, 0.08235294, 0, 1,
-2.111482, 1.644737, -2.103924, 1, 0.09019608, 0, 1,
-2.081545, -0.3905151, 0.8359804, 1, 0.09411765, 0, 1,
-2.077437, 0.5571945, -2.068715, 1, 0.1019608, 0, 1,
-2.072045, -0.3544329, -2.058767, 1, 0.1098039, 0, 1,
-2.069578, 0.0265561, -3.363005, 1, 0.1137255, 0, 1,
-2.050433, -0.002958155, -1.0025, 1, 0.1215686, 0, 1,
-2.03304, 0.5458455, 0.9043824, 1, 0.1254902, 0, 1,
-2.008071, 0.5770078, -2.025107, 1, 0.1333333, 0, 1,
-2.002044, -0.6446034, -0.9898936, 1, 0.1372549, 0, 1,
-1.971082, -0.5389718, 0.1157174, 1, 0.145098, 0, 1,
-1.968241, 1.495789, -1.649499, 1, 0.1490196, 0, 1,
-1.962202, -0.1782412, -0.8533478, 1, 0.1568628, 0, 1,
-1.960752, 1.07841, 0.1550661, 1, 0.1607843, 0, 1,
-1.893473, 1.008378, -0.3826761, 1, 0.1686275, 0, 1,
-1.864266, 0.3705648, -0.9983456, 1, 0.172549, 0, 1,
-1.850073, 0.4611405, -1.894376, 1, 0.1803922, 0, 1,
-1.796258, 1.491134, -0.7061543, 1, 0.1843137, 0, 1,
-1.781755, -1.011051, -2.739704, 1, 0.1921569, 0, 1,
-1.779028, -1.27912, -3.516953, 1, 0.1960784, 0, 1,
-1.763319, -1.260499, -3.393439, 1, 0.2039216, 0, 1,
-1.760512, 0.9915963, -2.285303, 1, 0.2117647, 0, 1,
-1.756657, -0.7186763, -1.812511, 1, 0.2156863, 0, 1,
-1.746781, 0.9816688, -2.365378, 1, 0.2235294, 0, 1,
-1.743575, 0.3198408, -2.579179, 1, 0.227451, 0, 1,
-1.735242, -0.01344277, -0.6821662, 1, 0.2352941, 0, 1,
-1.732576, 1.706663, -1.102612, 1, 0.2392157, 0, 1,
-1.719768, 1.489492, -0.7590727, 1, 0.2470588, 0, 1,
-1.70888, -0.5450167, -2.207674, 1, 0.2509804, 0, 1,
-1.70687, 0.5863861, -0.3652547, 1, 0.2588235, 0, 1,
-1.660016, -1.228901, -2.309742, 1, 0.2627451, 0, 1,
-1.656852, -0.0394602, -0.2524694, 1, 0.2705882, 0, 1,
-1.627743, 0.01580083, -1.298459, 1, 0.2745098, 0, 1,
-1.61837, 0.9602007, -1.913454, 1, 0.282353, 0, 1,
-1.614059, -0.5333738, -2.526522, 1, 0.2862745, 0, 1,
-1.572499, 0.3217428, -0.8740015, 1, 0.2941177, 0, 1,
-1.572224, -0.06701225, -2.209981, 1, 0.3019608, 0, 1,
-1.570294, -0.7570689, -1.479999, 1, 0.3058824, 0, 1,
-1.559186, 0.9087169, -3.774856, 1, 0.3137255, 0, 1,
-1.542971, -1.085383, -2.416253, 1, 0.3176471, 0, 1,
-1.529121, -1.622681, -2.718411, 1, 0.3254902, 0, 1,
-1.52786, -0.233244, -0.4607466, 1, 0.3294118, 0, 1,
-1.51194, -1.294792, -1.228069, 1, 0.3372549, 0, 1,
-1.504828, -0.2684354, -0.8783692, 1, 0.3411765, 0, 1,
-1.501691, 1.758665, -0.06117852, 1, 0.3490196, 0, 1,
-1.494419, -0.8615512, -1.864482, 1, 0.3529412, 0, 1,
-1.494386, 0.5458034, -2.29228, 1, 0.3607843, 0, 1,
-1.490471, 1.032275, 1.666013, 1, 0.3647059, 0, 1,
-1.488657, 0.731916, -2.02363, 1, 0.372549, 0, 1,
-1.48306, 0.5879844, -1.03736, 1, 0.3764706, 0, 1,
-1.4772, 0.5223292, -1.658603, 1, 0.3843137, 0, 1,
-1.474686, 0.9776267, -0.93576, 1, 0.3882353, 0, 1,
-1.461674, -1.326273, -2.475708, 1, 0.3960784, 0, 1,
-1.457214, -0.7468904, -0.9250101, 1, 0.4039216, 0, 1,
-1.456292, 1.54029, -0.2483592, 1, 0.4078431, 0, 1,
-1.452477, -1.344847, -0.9524496, 1, 0.4156863, 0, 1,
-1.44169, 2.280044, -0.8239909, 1, 0.4196078, 0, 1,
-1.43587, -0.9321014, -3.099311, 1, 0.427451, 0, 1,
-1.416675, 1.212373, 0.646385, 1, 0.4313726, 0, 1,
-1.400317, 0.7801011, -0.6996201, 1, 0.4392157, 0, 1,
-1.38899, 1.722518, -0.9781292, 1, 0.4431373, 0, 1,
-1.384042, -1.1402, -3.071094, 1, 0.4509804, 0, 1,
-1.371684, 1.260734, 0.2150044, 1, 0.454902, 0, 1,
-1.356355, 1.451426, -0.4115477, 1, 0.4627451, 0, 1,
-1.354063, -1.104756, -4.193587, 1, 0.4666667, 0, 1,
-1.337987, 1.03683, -0.3660427, 1, 0.4745098, 0, 1,
-1.330826, -1.380671, -1.471425, 1, 0.4784314, 0, 1,
-1.323694, -0.1227257, -1.897135, 1, 0.4862745, 0, 1,
-1.313666, -1.159329, -1.649532, 1, 0.4901961, 0, 1,
-1.30669, -0.6348157, -1.077635, 1, 0.4980392, 0, 1,
-1.306355, -0.2465045, -1.766586, 1, 0.5058824, 0, 1,
-1.302438, 1.28535, -3.942606, 1, 0.509804, 0, 1,
-1.297865, -1.265395, -1.887583, 1, 0.5176471, 0, 1,
-1.29432, 0.07444675, -3.182938, 1, 0.5215687, 0, 1,
-1.287846, -0.9381764, -1.205129, 1, 0.5294118, 0, 1,
-1.284848, 1.032598, 1.235518, 1, 0.5333334, 0, 1,
-1.278621, -1.578519, -1.539393, 1, 0.5411765, 0, 1,
-1.277041, -0.723175, -0.4275113, 1, 0.5450981, 0, 1,
-1.272514, 1.297849, 0.4716088, 1, 0.5529412, 0, 1,
-1.267565, -1.672576, -1.006424, 1, 0.5568628, 0, 1,
-1.258527, 0.4725454, -2.469025, 1, 0.5647059, 0, 1,
-1.25723, -0.06281026, -0.7847155, 1, 0.5686275, 0, 1,
-1.254781, 0.60633, -1.710105, 1, 0.5764706, 0, 1,
-1.253112, -0.7466404, 0.1340064, 1, 0.5803922, 0, 1,
-1.246425, 0.1926443, -2.200108, 1, 0.5882353, 0, 1,
-1.241219, 0.5862411, -1.623269, 1, 0.5921569, 0, 1,
-1.231609, 0.1207015, -1.761489, 1, 0.6, 0, 1,
-1.225206, -0.1825076, -1.775627, 1, 0.6078432, 0, 1,
-1.221424, -1.115807, -3.45821, 1, 0.6117647, 0, 1,
-1.219702, -0.9042549, -1.931756, 1, 0.6196079, 0, 1,
-1.206309, -0.3434198, -0.610371, 1, 0.6235294, 0, 1,
-1.206279, 1.977641, 0.4108672, 1, 0.6313726, 0, 1,
-1.200406, -0.3753383, -3.00408, 1, 0.6352941, 0, 1,
-1.191942, -0.9257766, -2.210247, 1, 0.6431373, 0, 1,
-1.16787, -0.728398, -2.337768, 1, 0.6470588, 0, 1,
-1.167322, 0.6890233, -3.914531, 1, 0.654902, 0, 1,
-1.163606, -0.2311614, -1.49001, 1, 0.6588235, 0, 1,
-1.159041, -0.2901899, -2.026798, 1, 0.6666667, 0, 1,
-1.151308, -0.5519863, -0.425171, 1, 0.6705883, 0, 1,
-1.151086, -0.6194358, 0.8750682, 1, 0.6784314, 0, 1,
-1.150531, 0.1136118, -1.048612, 1, 0.682353, 0, 1,
-1.147285, 0.7188002, 0.3065073, 1, 0.6901961, 0, 1,
-1.145558, -2.020795, -2.894859, 1, 0.6941177, 0, 1,
-1.109539, 1.926006, 1.416775, 1, 0.7019608, 0, 1,
-1.105295, 0.5313542, 0.6349343, 1, 0.7098039, 0, 1,
-1.102786, 0.1150909, -0.8866732, 1, 0.7137255, 0, 1,
-1.102536, 0.5029714, -1.117723, 1, 0.7215686, 0, 1,
-1.101577, -0.4747867, -2.483708, 1, 0.7254902, 0, 1,
-1.092658, -0.6049348, -2.243198, 1, 0.7333333, 0, 1,
-1.092384, 0.1570236, -1.618191, 1, 0.7372549, 0, 1,
-1.092259, 0.179394, -1.136687, 1, 0.7450981, 0, 1,
-1.085496, 0.1329216, -1.193479, 1, 0.7490196, 0, 1,
-1.083572, -0.6629294, -1.546186, 1, 0.7568628, 0, 1,
-1.056575, 0.3922641, -0.860613, 1, 0.7607843, 0, 1,
-1.052089, -0.0572516, -1.938363, 1, 0.7686275, 0, 1,
-1.051425, 0.5825292, -0.8351911, 1, 0.772549, 0, 1,
-1.048762, -0.6226745, -2.222353, 1, 0.7803922, 0, 1,
-1.047176, -1.424535, -2.611297, 1, 0.7843137, 0, 1,
-1.042574, 0.1442875, -0.07595566, 1, 0.7921569, 0, 1,
-1.039404, -0.1082433, -2.642002, 1, 0.7960784, 0, 1,
-1.034993, 0.7449538, -0.3988405, 1, 0.8039216, 0, 1,
-1.034196, -0.2418346, -3.47519, 1, 0.8117647, 0, 1,
-1.028913, 2.346535, 0.3124364, 1, 0.8156863, 0, 1,
-1.025581, 0.7271613, -0.6646729, 1, 0.8235294, 0, 1,
-1.024122, -0.8471442, -2.192491, 1, 0.827451, 0, 1,
-1.023022, -0.6163336, -0.7164953, 1, 0.8352941, 0, 1,
-1.019669, 2.210981, 1.928309, 1, 0.8392157, 0, 1,
-1.015747, -3.270528, -3.900645, 1, 0.8470588, 0, 1,
-1.004546, 1.131402, -1.225209, 1, 0.8509804, 0, 1,
-1.000194, 0.5763537, -3.176325, 1, 0.8588235, 0, 1,
-0.9930108, -1.021217, -2.356926, 1, 0.8627451, 0, 1,
-0.9885356, -2.408234, -0.8230888, 1, 0.8705882, 0, 1,
-0.9814755, 2.148131, -1.205047, 1, 0.8745098, 0, 1,
-0.981348, -0.3178436, -0.9557462, 1, 0.8823529, 0, 1,
-0.9749092, -0.254021, -3.714248, 1, 0.8862745, 0, 1,
-0.9741399, -2.389341, -2.308936, 1, 0.8941177, 0, 1,
-0.9697496, 0.3956301, -1.446523, 1, 0.8980392, 0, 1,
-0.9642195, -0.8313301, -1.815539, 1, 0.9058824, 0, 1,
-0.9616445, 0.03501503, -0.9449982, 1, 0.9137255, 0, 1,
-0.9599176, -0.4787267, -2.852041, 1, 0.9176471, 0, 1,
-0.9594024, -1.500495, -1.758704, 1, 0.9254902, 0, 1,
-0.9578011, -0.566385, -0.9219903, 1, 0.9294118, 0, 1,
-0.9542345, -0.2764667, 0.07984912, 1, 0.9372549, 0, 1,
-0.9504122, -0.239377, -2.611097, 1, 0.9411765, 0, 1,
-0.9498976, 1.648802, -0.6102104, 1, 0.9490196, 0, 1,
-0.9495062, -0.1573732, -1.763101, 1, 0.9529412, 0, 1,
-0.9458917, -0.4223423, -2.3819, 1, 0.9607843, 0, 1,
-0.9445181, -0.06668665, 0.6539614, 1, 0.9647059, 0, 1,
-0.9444044, -1.276571, -3.188432, 1, 0.972549, 0, 1,
-0.9423353, -0.3300181, -3.082593, 1, 0.9764706, 0, 1,
-0.9330747, -1.778513, -2.857653, 1, 0.9843137, 0, 1,
-0.9293418, 0.2380148, -0.06892332, 1, 0.9882353, 0, 1,
-0.9265898, -0.9764208, -1.172081, 1, 0.9960784, 0, 1,
-0.9131706, -0.7728436, -1.771281, 0.9960784, 1, 0, 1,
-0.9112857, -1.624795, -3.108368, 0.9921569, 1, 0, 1,
-0.9109911, -0.9097524, -3.952556, 0.9843137, 1, 0, 1,
-0.9047032, 1.400656, -1.767361, 0.9803922, 1, 0, 1,
-0.8964174, 0.8240638, -0.7149563, 0.972549, 1, 0, 1,
-0.8964154, -0.08625476, -3.447825, 0.9686275, 1, 0, 1,
-0.8866234, 0.4532332, -1.376197, 0.9607843, 1, 0, 1,
-0.8815728, -0.3498195, -1.109378, 0.9568627, 1, 0, 1,
-0.85391, 1.350034, 0.3128413, 0.9490196, 1, 0, 1,
-0.8478292, 1.302789, 0.5038502, 0.945098, 1, 0, 1,
-0.8423405, 0.5327281, -0.3076339, 0.9372549, 1, 0, 1,
-0.839129, 0.3774689, -0.6186035, 0.9333333, 1, 0, 1,
-0.8269156, -0.5782132, -2.227103, 0.9254902, 1, 0, 1,
-0.8266941, -1.509552, -1.558501, 0.9215686, 1, 0, 1,
-0.8224742, -0.1696114, -2.880807, 0.9137255, 1, 0, 1,
-0.8201709, 0.9622583, 0.6932396, 0.9098039, 1, 0, 1,
-0.8187991, 0.7726408, -0.7512593, 0.9019608, 1, 0, 1,
-0.8177215, 0.5503047, -1.527575, 0.8941177, 1, 0, 1,
-0.8161312, -0.1520311, -1.084415, 0.8901961, 1, 0, 1,
-0.8154382, -1.100509, -2.465168, 0.8823529, 1, 0, 1,
-0.8148107, 0.9832509, -1.41102, 0.8784314, 1, 0, 1,
-0.8147791, -1.749829, -3.055913, 0.8705882, 1, 0, 1,
-0.8106572, -1.200271, -3.693611, 0.8666667, 1, 0, 1,
-0.8062252, -0.03747727, -0.7353069, 0.8588235, 1, 0, 1,
-0.8057964, -0.1256022, -2.371746, 0.854902, 1, 0, 1,
-0.8027478, 1.997838, -0.1262547, 0.8470588, 1, 0, 1,
-0.7991317, 0.7903985, -1.601624, 0.8431373, 1, 0, 1,
-0.7964433, 1.027035, -0.4787298, 0.8352941, 1, 0, 1,
-0.7918609, 1.032345, -1.345938, 0.8313726, 1, 0, 1,
-0.7906086, 1.447793, -0.2722872, 0.8235294, 1, 0, 1,
-0.783196, -0.8435126, -2.311146, 0.8196079, 1, 0, 1,
-0.7829436, -0.3874974, -0.7430427, 0.8117647, 1, 0, 1,
-0.7827347, 0.8431794, -0.02424735, 0.8078431, 1, 0, 1,
-0.7801899, 0.7589363, -1.0238, 0.8, 1, 0, 1,
-0.7766417, -0.9022754, -3.13244, 0.7921569, 1, 0, 1,
-0.7753878, -0.4169443, -0.2615239, 0.7882353, 1, 0, 1,
-0.7745776, 1.369421, -0.5259152, 0.7803922, 1, 0, 1,
-0.7658128, -1.875175, -1.764789, 0.7764706, 1, 0, 1,
-0.7610219, -0.1146481, -0.8390518, 0.7686275, 1, 0, 1,
-0.7606353, 0.09562997, -2.350643, 0.7647059, 1, 0, 1,
-0.756557, 0.6191524, -0.7970422, 0.7568628, 1, 0, 1,
-0.7530877, 0.7608917, 0.3245307, 0.7529412, 1, 0, 1,
-0.7530645, -0.5985128, -1.586115, 0.7450981, 1, 0, 1,
-0.7516031, 0.8928562, -1.952658, 0.7411765, 1, 0, 1,
-0.7495525, -1.072393, -3.369322, 0.7333333, 1, 0, 1,
-0.7427491, -0.3480458, -4.079754, 0.7294118, 1, 0, 1,
-0.7424781, 0.5457872, 0.2673664, 0.7215686, 1, 0, 1,
-0.7406718, 2.636885, -0.557835, 0.7176471, 1, 0, 1,
-0.7350049, 0.7055841, -1.404477, 0.7098039, 1, 0, 1,
-0.7322581, 0.7413172, -0.9721856, 0.7058824, 1, 0, 1,
-0.7319286, 1.734128, -1.189752, 0.6980392, 1, 0, 1,
-0.7284979, 1.043896, -3.02183, 0.6901961, 1, 0, 1,
-0.7276225, -0.3328334, -0.1320106, 0.6862745, 1, 0, 1,
-0.724682, 0.07910162, 0.9170536, 0.6784314, 1, 0, 1,
-0.7242543, 0.8023493, -0.1281947, 0.6745098, 1, 0, 1,
-0.7200983, 0.39361, -1.632972, 0.6666667, 1, 0, 1,
-0.7191656, -1.477557, -3.362592, 0.6627451, 1, 0, 1,
-0.7156743, 0.2333771, -2.951446, 0.654902, 1, 0, 1,
-0.7047204, 0.2320087, 0.4124594, 0.6509804, 1, 0, 1,
-0.7029995, 0.5805103, -1.523513, 0.6431373, 1, 0, 1,
-0.7029204, 0.8932232, -0.1277234, 0.6392157, 1, 0, 1,
-0.7020826, -1.315022, -2.38993, 0.6313726, 1, 0, 1,
-0.7006015, -0.1625119, -1.618901, 0.627451, 1, 0, 1,
-0.6873501, 1.703833, 0.1926023, 0.6196079, 1, 0, 1,
-0.6857474, -0.06740364, -1.246068, 0.6156863, 1, 0, 1,
-0.684681, -1.31017, -1.187088, 0.6078432, 1, 0, 1,
-0.67995, -1.165996, -2.145451, 0.6039216, 1, 0, 1,
-0.6729127, -1.856982, -3.516812, 0.5960785, 1, 0, 1,
-0.666077, 0.7360438, 0.8033201, 0.5882353, 1, 0, 1,
-0.6654768, 0.2206756, -1.92029, 0.5843138, 1, 0, 1,
-0.663543, -0.1471865, -0.5200145, 0.5764706, 1, 0, 1,
-0.6594777, -0.3153216, -2.5581, 0.572549, 1, 0, 1,
-0.6584561, 1.37831, 0.3142041, 0.5647059, 1, 0, 1,
-0.6583066, -1.445833, -2.100583, 0.5607843, 1, 0, 1,
-0.6567659, -0.407034, -2.266205, 0.5529412, 1, 0, 1,
-0.6475452, 0.420984, -2.957474, 0.5490196, 1, 0, 1,
-0.643537, 1.693566, -0.4272388, 0.5411765, 1, 0, 1,
-0.636067, 0.07729108, -0.9913141, 0.5372549, 1, 0, 1,
-0.6332675, 0.008991992, -3.186739, 0.5294118, 1, 0, 1,
-0.6321188, 0.6556894, 0.9468421, 0.5254902, 1, 0, 1,
-0.6244169, -0.6104195, -1.739334, 0.5176471, 1, 0, 1,
-0.6221538, -0.9204769, -2.137649, 0.5137255, 1, 0, 1,
-0.6182416, 0.06722605, 1.460442, 0.5058824, 1, 0, 1,
-0.6150673, 0.8086047, 0.2180658, 0.5019608, 1, 0, 1,
-0.6104457, -1.679603, -3.267625, 0.4941176, 1, 0, 1,
-0.6084255, -0.2715747, -4.469544, 0.4862745, 1, 0, 1,
-0.6081995, 0.1773792, -1.083935, 0.4823529, 1, 0, 1,
-0.6056612, 1.061326, -2.032825, 0.4745098, 1, 0, 1,
-0.6045412, -1.004572, -2.971697, 0.4705882, 1, 0, 1,
-0.6040232, 0.9187477, 0.9154936, 0.4627451, 1, 0, 1,
-0.5992142, -0.8786781, -3.231472, 0.4588235, 1, 0, 1,
-0.5962657, -0.988282, -1.002076, 0.4509804, 1, 0, 1,
-0.5920712, -0.01498502, -1.523068, 0.4470588, 1, 0, 1,
-0.5915308, -0.2227339, -2.325485, 0.4392157, 1, 0, 1,
-0.5845058, 1.343505, -0.9461736, 0.4352941, 1, 0, 1,
-0.5838656, 1.106468, -0.2301067, 0.427451, 1, 0, 1,
-0.5702856, -1.024158, -3.130592, 0.4235294, 1, 0, 1,
-0.5675064, -0.228286, -1.405972, 0.4156863, 1, 0, 1,
-0.566867, 0.8872762, 1.486837, 0.4117647, 1, 0, 1,
-0.560275, -0.7583029, -2.949808, 0.4039216, 1, 0, 1,
-0.5591781, 1.175818, -1.636879, 0.3960784, 1, 0, 1,
-0.5564202, 0.6912446, 0.006841725, 0.3921569, 1, 0, 1,
-0.5538139, 0.5181807, -0.4949874, 0.3843137, 1, 0, 1,
-0.5529497, 0.3925385, -2.718919, 0.3803922, 1, 0, 1,
-0.5521351, -0.4951259, -3.221539, 0.372549, 1, 0, 1,
-0.5515897, -0.2871612, -1.680389, 0.3686275, 1, 0, 1,
-0.5428879, -1.610111, -1.394002, 0.3607843, 1, 0, 1,
-0.5392127, -0.1921113, -2.427078, 0.3568628, 1, 0, 1,
-0.5324545, -0.6864144, -0.7853981, 0.3490196, 1, 0, 1,
-0.5323984, -0.2009203, -1.118669, 0.345098, 1, 0, 1,
-0.528192, -1.044704, -1.686282, 0.3372549, 1, 0, 1,
-0.5242379, -1.631277, -2.355215, 0.3333333, 1, 0, 1,
-0.5214051, 0.2111195, -1.049673, 0.3254902, 1, 0, 1,
-0.5186283, 0.06395397, -0.3990568, 0.3215686, 1, 0, 1,
-0.5173329, 0.965871, 0.5181953, 0.3137255, 1, 0, 1,
-0.5161703, -0.7694554, -2.623008, 0.3098039, 1, 0, 1,
-0.5147175, 0.1000575, -0.7651247, 0.3019608, 1, 0, 1,
-0.5141826, -0.5985552, -0.6185448, 0.2941177, 1, 0, 1,
-0.5083334, 0.3245523, -0.008840119, 0.2901961, 1, 0, 1,
-0.5063455, -2.52414, -3.240214, 0.282353, 1, 0, 1,
-0.5055806, -1.467288, -3.517472, 0.2784314, 1, 0, 1,
-0.5043806, 2.40599, -1.653586, 0.2705882, 1, 0, 1,
-0.5039995, 1.100775, -0.1051942, 0.2666667, 1, 0, 1,
-0.5038356, -0.2688034, -1.768462, 0.2588235, 1, 0, 1,
-0.5010426, -0.03721943, 0.1732419, 0.254902, 1, 0, 1,
-0.5003008, 0.2601489, 0.6191769, 0.2470588, 1, 0, 1,
-0.4964149, -0.3183727, -1.667205, 0.2431373, 1, 0, 1,
-0.4891086, -1.373589, -3.957365, 0.2352941, 1, 0, 1,
-0.4858006, -1.079632, -3.119581, 0.2313726, 1, 0, 1,
-0.485364, -0.3508479, -2.52883, 0.2235294, 1, 0, 1,
-0.4833535, 1.599315, 0.2279546, 0.2196078, 1, 0, 1,
-0.4810613, -0.8889987, -2.763767, 0.2117647, 1, 0, 1,
-0.4766248, 1.706709, 0.5419108, 0.2078431, 1, 0, 1,
-0.4721331, -2.307556, -2.979403, 0.2, 1, 0, 1,
-0.4705274, 0.1213761, -2.272101, 0.1921569, 1, 0, 1,
-0.4664003, 0.4989895, -1.533954, 0.1882353, 1, 0, 1,
-0.4579001, 1.034061, 0.8029025, 0.1803922, 1, 0, 1,
-0.45709, -0.3235249, -1.748594, 0.1764706, 1, 0, 1,
-0.4539802, -1.287907, -2.599124, 0.1686275, 1, 0, 1,
-0.45283, -2.175823, -2.558549, 0.1647059, 1, 0, 1,
-0.4482639, -1.418192, -2.34722, 0.1568628, 1, 0, 1,
-0.4475621, -0.1112415, -0.5575264, 0.1529412, 1, 0, 1,
-0.4401186, -0.649096, -5.133287, 0.145098, 1, 0, 1,
-0.4373952, -1.030079, -2.778544, 0.1411765, 1, 0, 1,
-0.4325012, 0.5758622, 0.1413561, 0.1333333, 1, 0, 1,
-0.4308538, -0.3883806, -2.231873, 0.1294118, 1, 0, 1,
-0.4262582, -0.3918344, -1.926571, 0.1215686, 1, 0, 1,
-0.4257883, 0.0304912, -3.166576, 0.1176471, 1, 0, 1,
-0.4257811, 0.464947, 0.04564547, 0.1098039, 1, 0, 1,
-0.4208041, 1.02616, -0.4773369, 0.1058824, 1, 0, 1,
-0.4194731, 0.6975685, -1.782577, 0.09803922, 1, 0, 1,
-0.4161987, -0.6442507, -1.84934, 0.09019608, 1, 0, 1,
-0.414049, -0.3029107, -3.516182, 0.08627451, 1, 0, 1,
-0.4123336, -1.654617, -3.178184, 0.07843138, 1, 0, 1,
-0.4122204, -1.153756, -1.890832, 0.07450981, 1, 0, 1,
-0.4080095, 0.6651813, -1.337936, 0.06666667, 1, 0, 1,
-0.4060623, -1.973921, -1.718251, 0.0627451, 1, 0, 1,
-0.4036503, -1.414707, -3.061877, 0.05490196, 1, 0, 1,
-0.3916586, -0.7965302, -4.69024, 0.05098039, 1, 0, 1,
-0.3911993, 0.3382451, -0.2801452, 0.04313726, 1, 0, 1,
-0.3891429, 0.7787501, 1.434259, 0.03921569, 1, 0, 1,
-0.385036, -0.9251641, -2.630534, 0.03137255, 1, 0, 1,
-0.3837039, -0.4382421, -0.9984888, 0.02745098, 1, 0, 1,
-0.3816433, 0.334238, 0.1056978, 0.01960784, 1, 0, 1,
-0.3706439, 1.016939, 0.3358041, 0.01568628, 1, 0, 1,
-0.3648224, -1.099907, -2.644166, 0.007843138, 1, 0, 1,
-0.3641453, -0.6572784, -2.893308, 0.003921569, 1, 0, 1,
-0.3473875, 0.7869363, -0.03713495, 0, 1, 0.003921569, 1,
-0.3445823, 0.2185851, -0.7590706, 0, 1, 0.01176471, 1,
-0.3416625, -1.56844, -4.356899, 0, 1, 0.01568628, 1,
-0.3345938, 0.7353097, 0.6755874, 0, 1, 0.02352941, 1,
-0.3340579, 0.96414, -0.6940747, 0, 1, 0.02745098, 1,
-0.3326044, 0.8576094, -0.1955921, 0, 1, 0.03529412, 1,
-0.3322015, -0.007469583, -3.019609, 0, 1, 0.03921569, 1,
-0.325907, 0.5708078, -0.6063371, 0, 1, 0.04705882, 1,
-0.3211542, -0.233422, -1.85584, 0, 1, 0.05098039, 1,
-0.3204757, -1.476832, -2.418373, 0, 1, 0.05882353, 1,
-0.3196448, 0.9518574, -0.2024029, 0, 1, 0.0627451, 1,
-0.3193333, 2.957474, 1.291424, 0, 1, 0.07058824, 1,
-0.3192904, -0.8726856, -1.001799, 0, 1, 0.07450981, 1,
-0.3121168, -0.463754, -4.024599, 0, 1, 0.08235294, 1,
-0.3106377, -0.5793405, -2.248982, 0, 1, 0.08627451, 1,
-0.3102962, -1.190011, -1.681257, 0, 1, 0.09411765, 1,
-0.3091495, 0.517893, -1.668484, 0, 1, 0.1019608, 1,
-0.3090969, -0.3296027, -2.712411, 0, 1, 0.1058824, 1,
-0.3083326, -0.34532, -1.529226, 0, 1, 0.1137255, 1,
-0.307882, 1.37323, 0.3106193, 0, 1, 0.1176471, 1,
-0.3056546, 1.137693, -0.3321698, 0, 1, 0.1254902, 1,
-0.3022865, 1.737955, 0.9068976, 0, 1, 0.1294118, 1,
-0.301506, 0.2419961, -3.043443, 0, 1, 0.1372549, 1,
-0.3010069, -0.4139454, -2.067045, 0, 1, 0.1411765, 1,
-0.3000476, 1.184014, -0.3524337, 0, 1, 0.1490196, 1,
-0.2979833, 1.16137, 0.7885441, 0, 1, 0.1529412, 1,
-0.2977737, -0.9284346, -2.404565, 0, 1, 0.1607843, 1,
-0.2975236, -0.3717621, -2.494051, 0, 1, 0.1647059, 1,
-0.296831, -1.06019, -3.375309, 0, 1, 0.172549, 1,
-0.2944097, -0.2713453, -1.96381, 0, 1, 0.1764706, 1,
-0.2932648, 0.1227112, -1.238684, 0, 1, 0.1843137, 1,
-0.2856471, 1.117639, 0.5034639, 0, 1, 0.1882353, 1,
-0.2838309, 0.4083573, -1.754416, 0, 1, 0.1960784, 1,
-0.2819508, 1.592192, 0.7003574, 0, 1, 0.2039216, 1,
-0.2806482, 0.1221386, -2.900178, 0, 1, 0.2078431, 1,
-0.2786441, 1.685155, 0.5921333, 0, 1, 0.2156863, 1,
-0.2769714, 0.2497747, -2.317915, 0, 1, 0.2196078, 1,
-0.2700169, -0.2108154, -0.1852815, 0, 1, 0.227451, 1,
-0.26607, -0.485174, -3.795384, 0, 1, 0.2313726, 1,
-0.2606469, 1.045792, -0.6850162, 0, 1, 0.2392157, 1,
-0.2563317, 0.4610375, -0.468966, 0, 1, 0.2431373, 1,
-0.255298, -0.5310449, -2.422836, 0, 1, 0.2509804, 1,
-0.2495803, -0.8841521, -2.799009, 0, 1, 0.254902, 1,
-0.2465413, -0.786563, -4.070692, 0, 1, 0.2627451, 1,
-0.2450887, 0.05512369, -2.461789, 0, 1, 0.2666667, 1,
-0.2427577, -0.1114212, -3.816639, 0, 1, 0.2745098, 1,
-0.2421192, 0.5755791, 0.1043984, 0, 1, 0.2784314, 1,
-0.2399168, 0.6371378, -0.7295234, 0, 1, 0.2862745, 1,
-0.2397422, -0.7939967, -4.000466, 0, 1, 0.2901961, 1,
-0.2381452, -1.294659, -3.601312, 0, 1, 0.2980392, 1,
-0.2343531, 2.035437, -2.001784, 0, 1, 0.3058824, 1,
-0.2288284, 0.2990668, -1.544724, 0, 1, 0.3098039, 1,
-0.2228946, 0.2347789, 0.3692132, 0, 1, 0.3176471, 1,
-0.2151366, -0.03762336, -2.417205, 0, 1, 0.3215686, 1,
-0.2118358, -0.1963004, -1.819139, 0, 1, 0.3294118, 1,
-0.2076077, -0.2634111, -3.039153, 0, 1, 0.3333333, 1,
-0.2069738, -0.2438437, -1.377511, 0, 1, 0.3411765, 1,
-0.2061609, 1.199776, -2.966263, 0, 1, 0.345098, 1,
-0.2040348, -2.52389, -3.514574, 0, 1, 0.3529412, 1,
-0.2025499, -1.1643, -3.405742, 0, 1, 0.3568628, 1,
-0.2013827, -0.4927936, -3.315952, 0, 1, 0.3647059, 1,
-0.2013037, -0.261239, -2.278995, 0, 1, 0.3686275, 1,
-0.2006949, 0.3575931, -0.6596118, 0, 1, 0.3764706, 1,
-0.1997361, -0.04856747, -0.5491567, 0, 1, 0.3803922, 1,
-0.1992453, -0.472866, -3.149879, 0, 1, 0.3882353, 1,
-0.1967777, 1.811956, 0.08026596, 0, 1, 0.3921569, 1,
-0.1949657, 1.346973, -1.475385, 0, 1, 0.4, 1,
-0.1843636, 2.10409, 0.3130742, 0, 1, 0.4078431, 1,
-0.1838958, 0.2387364, -0.04798423, 0, 1, 0.4117647, 1,
-0.1799595, -1.106953, -2.128856, 0, 1, 0.4196078, 1,
-0.1777271, -0.3253201, -2.895795, 0, 1, 0.4235294, 1,
-0.1687434, -2.259773, -1.028171, 0, 1, 0.4313726, 1,
-0.1684528, -1.205607, -2.735288, 0, 1, 0.4352941, 1,
-0.1666415, -1.050378, -3.624002, 0, 1, 0.4431373, 1,
-0.1656706, -0.293131, -2.343977, 0, 1, 0.4470588, 1,
-0.1593668, -1.303466, -3.480247, 0, 1, 0.454902, 1,
-0.152968, -0.3671812, -1.533605, 0, 1, 0.4588235, 1,
-0.1529266, -0.2046833, -2.086637, 0, 1, 0.4666667, 1,
-0.1528764, -1.470305, -3.194275, 0, 1, 0.4705882, 1,
-0.1519686, 0.2608075, -0.3786988, 0, 1, 0.4784314, 1,
-0.1449018, -0.5041164, -3.254849, 0, 1, 0.4823529, 1,
-0.1380847, 0.5708304, 0.5022869, 0, 1, 0.4901961, 1,
-0.1372294, 0.4947159, -0.1770872, 0, 1, 0.4941176, 1,
-0.1366526, 0.326092, -0.1340725, 0, 1, 0.5019608, 1,
-0.1357519, 0.9251411, 1.404887, 0, 1, 0.509804, 1,
-0.1303279, -0.6599668, -2.894187, 0, 1, 0.5137255, 1,
-0.1301935, -1.522712, -2.532912, 0, 1, 0.5215687, 1,
-0.1289972, -0.3911227, -3.221465, 0, 1, 0.5254902, 1,
-0.1266485, 0.07322009, -1.52532, 0, 1, 0.5333334, 1,
-0.1242125, 0.3034694, -0.7159981, 0, 1, 0.5372549, 1,
-0.1203632, 0.08346751, -1.615174, 0, 1, 0.5450981, 1,
-0.1184154, 0.6166007, -1.58106, 0, 1, 0.5490196, 1,
-0.1172804, 0.562857, -1.028264, 0, 1, 0.5568628, 1,
-0.1113196, -1.606609, -4.667407, 0, 1, 0.5607843, 1,
-0.1106711, -0.6048477, -3.11912, 0, 1, 0.5686275, 1,
-0.1045081, 2.352847, -1.7145, 0, 1, 0.572549, 1,
-0.1006169, 0.7236962, 0.1652352, 0, 1, 0.5803922, 1,
-0.0993458, -0.8953963, -1.487535, 0, 1, 0.5843138, 1,
-0.09771835, 2.143287, 1.292312, 0, 1, 0.5921569, 1,
-0.09728803, 1.401311, -0.2088174, 0, 1, 0.5960785, 1,
-0.09403241, -2.211083, -1.755326, 0, 1, 0.6039216, 1,
-0.09204082, 1.400356, 0.5265911, 0, 1, 0.6117647, 1,
-0.09069568, 0.9389893, -0.5397948, 0, 1, 0.6156863, 1,
-0.09012854, 1.071872, -1.307889, 0, 1, 0.6235294, 1,
-0.08879985, 0.9186472, 0.7407632, 0, 1, 0.627451, 1,
-0.08739454, -0.832254, -4.341093, 0, 1, 0.6352941, 1,
-0.0854409, -0.1433889, -4.540962, 0, 1, 0.6392157, 1,
-0.08472037, -1.795013, -3.215599, 0, 1, 0.6470588, 1,
-0.08032145, -1.185491, -3.952868, 0, 1, 0.6509804, 1,
-0.07697104, 1.02411, -1.801877, 0, 1, 0.6588235, 1,
-0.06727525, -0.4664956, 0.07787994, 0, 1, 0.6627451, 1,
-0.06161616, -1.756154, -3.429253, 0, 1, 0.6705883, 1,
-0.06142037, -1.288837, -4.348763, 0, 1, 0.6745098, 1,
-0.0604601, -0.2047247, -5.236516, 0, 1, 0.682353, 1,
-0.05853288, -1.423248, -4.791978, 0, 1, 0.6862745, 1,
-0.05302319, -1.918896, -1.628595, 0, 1, 0.6941177, 1,
-0.05095828, 0.6735075, -0.7650178, 0, 1, 0.7019608, 1,
-0.04817499, 0.8950431, 1.214803, 0, 1, 0.7058824, 1,
-0.04209426, -1.216866, -3.580689, 0, 1, 0.7137255, 1,
-0.04199604, -0.5124726, -3.569409, 0, 1, 0.7176471, 1,
-0.03892249, -0.09385425, -4.082972, 0, 1, 0.7254902, 1,
-0.03872452, -0.2019315, -4.191228, 0, 1, 0.7294118, 1,
-0.03698816, 1.397161, -1.867896, 0, 1, 0.7372549, 1,
-0.03570801, 0.2666394, -1.623202, 0, 1, 0.7411765, 1,
-0.0351106, 0.6244681, -1.635913, 0, 1, 0.7490196, 1,
-0.03282595, -0.2643954, -4.050233, 0, 1, 0.7529412, 1,
-0.03279278, -0.5841073, -4.283968, 0, 1, 0.7607843, 1,
-0.03069276, 0.2033585, 1.30549, 0, 1, 0.7647059, 1,
-0.0296102, 0.5365905, -0.3132004, 0, 1, 0.772549, 1,
-0.02795143, -1.965261, -4.060787, 0, 1, 0.7764706, 1,
-0.02306641, -1.066095, -0.8326008, 0, 1, 0.7843137, 1,
-0.02270427, -0.4422093, -3.356631, 0, 1, 0.7882353, 1,
-0.02161483, -0.2863544, -2.871001, 0, 1, 0.7960784, 1,
-0.02140092, -0.171397, -3.155365, 0, 1, 0.8039216, 1,
-0.02139915, -0.5730558, -2.899268, 0, 1, 0.8078431, 1,
-0.0197409, 1.405017, -0.4896435, 0, 1, 0.8156863, 1,
-0.01875378, -1.508114, -3.888704, 0, 1, 0.8196079, 1,
-0.01812767, 1.302292, -0.3625518, 0, 1, 0.827451, 1,
-0.01798786, 0.6029204, -0.626241, 0, 1, 0.8313726, 1,
-0.01614659, 0.8662106, -0.6264831, 0, 1, 0.8392157, 1,
-0.01383933, -1.348561, -2.797459, 0, 1, 0.8431373, 1,
-0.01185679, 0.6443068, -0.07897979, 0, 1, 0.8509804, 1,
-0.01098543, -0.8155807, -3.266354, 0, 1, 0.854902, 1,
-0.009380132, 1.295758, 1.056153, 0, 1, 0.8627451, 1,
-0.008281137, 0.9207012, -0.5710945, 0, 1, 0.8666667, 1,
-0.007985771, -1.028352, -4.305169, 0, 1, 0.8745098, 1,
0.0005046741, 1.207193, -0.4720541, 0, 1, 0.8784314, 1,
0.006822824, -1.055841, 1.874143, 0, 1, 0.8862745, 1,
0.01039433, 0.1351958, -0.03844171, 0, 1, 0.8901961, 1,
0.01058534, -0.3701529, 3.682994, 0, 1, 0.8980392, 1,
0.01130897, 1.928802, 1.785472, 0, 1, 0.9058824, 1,
0.01350936, 0.6243907, 0.5697274, 0, 1, 0.9098039, 1,
0.01486391, -2.253585, 2.83755, 0, 1, 0.9176471, 1,
0.0154425, -0.5482678, 2.796949, 0, 1, 0.9215686, 1,
0.01659694, 0.2500888, -0.8191991, 0, 1, 0.9294118, 1,
0.01728215, 1.271496, -1.696672, 0, 1, 0.9333333, 1,
0.02285078, -0.1220054, 3.091655, 0, 1, 0.9411765, 1,
0.02461789, 0.3331368, 0.5656402, 0, 1, 0.945098, 1,
0.02802995, -1.009424, 3.447245, 0, 1, 0.9529412, 1,
0.028267, -0.9831812, 2.793865, 0, 1, 0.9568627, 1,
0.03119014, -0.3280613, 1.570281, 0, 1, 0.9647059, 1,
0.03821266, -1.167926, 4.08063, 0, 1, 0.9686275, 1,
0.03873375, -1.04529, 1.763028, 0, 1, 0.9764706, 1,
0.04584087, 0.4125901, -0.1115773, 0, 1, 0.9803922, 1,
0.04916426, 0.3031555, -0.891257, 0, 1, 0.9882353, 1,
0.05254056, 0.07107949, 0.153417, 0, 1, 0.9921569, 1,
0.053793, -0.003099096, 3.009659, 0, 1, 1, 1,
0.05403597, -0.06162002, 4.998128, 0, 0.9921569, 1, 1,
0.05629338, 0.02112609, 2.76397, 0, 0.9882353, 1, 1,
0.06112052, 0.1843706, 0.3530268, 0, 0.9803922, 1, 1,
0.06190583, 0.2376515, -1.0793, 0, 0.9764706, 1, 1,
0.0630956, 0.502849, 0.2061927, 0, 0.9686275, 1, 1,
0.06320316, 0.1544553, 0.8880621, 0, 0.9647059, 1, 1,
0.06356802, -0.4116337, 3.063019, 0, 0.9568627, 1, 1,
0.0675119, 0.7758881, 0.7598648, 0, 0.9529412, 1, 1,
0.06990439, 0.3799067, -0.1772639, 0, 0.945098, 1, 1,
0.07238915, -0.4789829, 3.426721, 0, 0.9411765, 1, 1,
0.07613923, 2.021112, 1.804, 0, 0.9333333, 1, 1,
0.07999276, 0.323502, 1.532503, 0, 0.9294118, 1, 1,
0.08404059, -0.6906062, 3.858282, 0, 0.9215686, 1, 1,
0.08573232, -2.440518, 3.684562, 0, 0.9176471, 1, 1,
0.08690736, 0.3512606, 1.505994, 0, 0.9098039, 1, 1,
0.08896899, -1.306669, 3.790036, 0, 0.9058824, 1, 1,
0.09114819, -0.837859, 3.560191, 0, 0.8980392, 1, 1,
0.0955236, -0.3235244, 5.1057, 0, 0.8901961, 1, 1,
0.09740166, -0.3380417, 3.73255, 0, 0.8862745, 1, 1,
0.09892208, 0.6013883, 1.122504, 0, 0.8784314, 1, 1,
0.1027729, 0.4448577, -0.5697549, 0, 0.8745098, 1, 1,
0.1039523, -1.205466, 2.69491, 0, 0.8666667, 1, 1,
0.116622, -0.8115622, 1.233568, 0, 0.8627451, 1, 1,
0.1232973, 0.9143462, 1.957803, 0, 0.854902, 1, 1,
0.1248866, -0.6203403, 3.337493, 0, 0.8509804, 1, 1,
0.1278248, 0.2307174, 0.06953355, 0, 0.8431373, 1, 1,
0.1318727, -0.6558492, 1.022676, 0, 0.8392157, 1, 1,
0.1322297, -1.575163, 3.165095, 0, 0.8313726, 1, 1,
0.1339962, 0.8443234, 0.5724485, 0, 0.827451, 1, 1,
0.1359757, 1.680745, 0.05536196, 0, 0.8196079, 1, 1,
0.1361604, 0.6617993, -0.1699889, 0, 0.8156863, 1, 1,
0.1366836, -0.5187172, 2.755973, 0, 0.8078431, 1, 1,
0.1370125, 0.6749097, 0.9589393, 0, 0.8039216, 1, 1,
0.1421203, -0.4301008, 2.649288, 0, 0.7960784, 1, 1,
0.1434516, 0.4172624, 1.369699, 0, 0.7882353, 1, 1,
0.1435661, -0.1135044, 0.8152521, 0, 0.7843137, 1, 1,
0.1462081, -1.432376, 3.363376, 0, 0.7764706, 1, 1,
0.1468056, 0.7855339, 1.55349, 0, 0.772549, 1, 1,
0.1473436, 2.132986, 0.6972916, 0, 0.7647059, 1, 1,
0.1492039, -0.1457111, 3.144753, 0, 0.7607843, 1, 1,
0.1500681, -1.582862, 3.033036, 0, 0.7529412, 1, 1,
0.1537594, -1.252466, 3.212032, 0, 0.7490196, 1, 1,
0.1549357, -0.4115296, 2.543568, 0, 0.7411765, 1, 1,
0.1559346, -0.2231783, 2.139167, 0, 0.7372549, 1, 1,
0.1589219, 0.3126213, 1.232839, 0, 0.7294118, 1, 1,
0.1589343, -0.05766284, 1.411436, 0, 0.7254902, 1, 1,
0.160397, 0.9539655, 0.3322288, 0, 0.7176471, 1, 1,
0.163582, 0.2289012, 0.3098577, 0, 0.7137255, 1, 1,
0.1642976, 0.7992015, 0.06931336, 0, 0.7058824, 1, 1,
0.167378, -0.9522244, 3.783156, 0, 0.6980392, 1, 1,
0.1678545, -0.3612093, 2.925745, 0, 0.6941177, 1, 1,
0.1688721, 0.03686201, 1.790617, 0, 0.6862745, 1, 1,
0.1745101, 0.5120938, 1.623829, 0, 0.682353, 1, 1,
0.1763982, -0.4278799, 3.019188, 0, 0.6745098, 1, 1,
0.1772018, 0.7990417, 0.04581437, 0, 0.6705883, 1, 1,
0.1788482, -1.589863, 2.916058, 0, 0.6627451, 1, 1,
0.1800178, 0.5539049, 0.4800485, 0, 0.6588235, 1, 1,
0.1859061, -1.46393, 3.593438, 0, 0.6509804, 1, 1,
0.1901447, -0.06348988, 3.153982, 0, 0.6470588, 1, 1,
0.1915615, 1.192399, -0.02876046, 0, 0.6392157, 1, 1,
0.1974343, 0.02855082, 3.085871, 0, 0.6352941, 1, 1,
0.1975066, 2.3678, -1.257382, 0, 0.627451, 1, 1,
0.1979842, 0.4762881, 1.615357, 0, 0.6235294, 1, 1,
0.1998044, 1.065472, -0.5766762, 0, 0.6156863, 1, 1,
0.1998304, -1.506076, 3.676017, 0, 0.6117647, 1, 1,
0.202876, 0.8948133, 0.7998649, 0, 0.6039216, 1, 1,
0.2045649, 0.1778557, 0.6340095, 0, 0.5960785, 1, 1,
0.2057396, -1.575962, 3.376652, 0, 0.5921569, 1, 1,
0.2083959, -0.8697861, 3.635696, 0, 0.5843138, 1, 1,
0.2114225, -1.151094, 0.8193831, 0, 0.5803922, 1, 1,
0.2171573, -1.550308, 1.538806, 0, 0.572549, 1, 1,
0.2178634, 0.6997663, 1.136329, 0, 0.5686275, 1, 1,
0.2198029, -0.808588, 2.370698, 0, 0.5607843, 1, 1,
0.2220807, 0.9036993, -1.135751, 0, 0.5568628, 1, 1,
0.2231334, -0.1040873, 2.254882, 0, 0.5490196, 1, 1,
0.2245051, -1.60957, 3.535036, 0, 0.5450981, 1, 1,
0.2325358, 0.9535626, -1.475734, 0, 0.5372549, 1, 1,
0.2326754, -0.3040851, 1.442112, 0, 0.5333334, 1, 1,
0.2338988, 1.571595, -0.08305369, 0, 0.5254902, 1, 1,
0.2357217, -0.5144511, 2.257933, 0, 0.5215687, 1, 1,
0.2371606, 0.8698009, 0.982652, 0, 0.5137255, 1, 1,
0.2371968, -0.02939637, 2.101402, 0, 0.509804, 1, 1,
0.2384494, -0.02258863, 1.810128, 0, 0.5019608, 1, 1,
0.2440577, 1.863228, -1.162343, 0, 0.4941176, 1, 1,
0.246578, -1.166565, 2.517544, 0, 0.4901961, 1, 1,
0.2466794, -0.5894835, 2.221906, 0, 0.4823529, 1, 1,
0.2480738, 0.4836636, -0.1925664, 0, 0.4784314, 1, 1,
0.2489956, -0.5123454, 2.756917, 0, 0.4705882, 1, 1,
0.2508735, -0.4019804, 2.223075, 0, 0.4666667, 1, 1,
0.2520223, 0.3801098, -0.01199724, 0, 0.4588235, 1, 1,
0.2590066, -0.5997801, 3.508072, 0, 0.454902, 1, 1,
0.2631313, -2.14899, 2.185646, 0, 0.4470588, 1, 1,
0.2683263, -0.870831, 3.416504, 0, 0.4431373, 1, 1,
0.273413, -0.9025714, 1.936093, 0, 0.4352941, 1, 1,
0.2739831, -0.9834038, 1.663683, 0, 0.4313726, 1, 1,
0.2748982, 0.2249241, 0.2190451, 0, 0.4235294, 1, 1,
0.275818, -0.8726705, 2.493234, 0, 0.4196078, 1, 1,
0.2766447, 0.3965545, 1.873538, 0, 0.4117647, 1, 1,
0.2844625, -0.2270443, 2.861233, 0, 0.4078431, 1, 1,
0.2852537, 0.8458037, 1.121945, 0, 0.4, 1, 1,
0.2865091, 1.915956, -0.4589171, 0, 0.3921569, 1, 1,
0.2873265, -0.7547786, 2.297178, 0, 0.3882353, 1, 1,
0.2887681, -0.004458536, 0.8683774, 0, 0.3803922, 1, 1,
0.2909615, -0.27929, 2.101088, 0, 0.3764706, 1, 1,
0.2929464, 0.3517431, -0.1395391, 0, 0.3686275, 1, 1,
0.2937125, -0.7804316, 1.332592, 0, 0.3647059, 1, 1,
0.3034472, 0.8846639, 1.288016, 0, 0.3568628, 1, 1,
0.3121214, -0.1489421, 2.784201, 0, 0.3529412, 1, 1,
0.3129876, 0.8030424, 0.08327413, 0, 0.345098, 1, 1,
0.313116, 0.03595491, 1.9192, 0, 0.3411765, 1, 1,
0.3220231, 0.776069, 0.3697304, 0, 0.3333333, 1, 1,
0.3236548, 0.1243832, 1.324132, 0, 0.3294118, 1, 1,
0.3298274, -0.0633949, 1.738314, 0, 0.3215686, 1, 1,
0.331081, -0.3520218, 1.985527, 0, 0.3176471, 1, 1,
0.3319086, 1.490246, -0.2812841, 0, 0.3098039, 1, 1,
0.3358738, -0.814755, 3.018548, 0, 0.3058824, 1, 1,
0.3400103, 0.2941498, 0.7131546, 0, 0.2980392, 1, 1,
0.340734, 0.1092431, 1.69948, 0, 0.2901961, 1, 1,
0.341194, 0.6429425, -1.588596, 0, 0.2862745, 1, 1,
0.3437099, 1.747458, -0.8945107, 0, 0.2784314, 1, 1,
0.343949, -0.1492622, 2.452368, 0, 0.2745098, 1, 1,
0.3441372, -0.3635699, 1.807519, 0, 0.2666667, 1, 1,
0.3474509, -1.934625, 2.281077, 0, 0.2627451, 1, 1,
0.3477198, 1.542778, 0.2589146, 0, 0.254902, 1, 1,
0.3524392, 0.6441233, -1.354828, 0, 0.2509804, 1, 1,
0.3524557, 1.251309, -0.9719568, 0, 0.2431373, 1, 1,
0.3534253, -0.2620256, 0.9160085, 0, 0.2392157, 1, 1,
0.354411, -1.092407, 2.621274, 0, 0.2313726, 1, 1,
0.3548907, -0.2038612, 0.765805, 0, 0.227451, 1, 1,
0.3571139, -0.8568115, 3.153343, 0, 0.2196078, 1, 1,
0.3573249, -0.5212317, 3.453127, 0, 0.2156863, 1, 1,
0.359571, 0.2694272, -0.4480335, 0, 0.2078431, 1, 1,
0.3596967, 1.418267, 0.8558365, 0, 0.2039216, 1, 1,
0.3673792, 0.02237488, -0.2272647, 0, 0.1960784, 1, 1,
0.3688168, -0.2421021, 3.008553, 0, 0.1882353, 1, 1,
0.3701132, 1.298707, 1.760954, 0, 0.1843137, 1, 1,
0.37132, 0.687147, 1.262977, 0, 0.1764706, 1, 1,
0.3755979, -0.2870457, 0.9993293, 0, 0.172549, 1, 1,
0.3797267, -0.7094871, 1.693571, 0, 0.1647059, 1, 1,
0.3837992, -0.2279671, 3.296747, 0, 0.1607843, 1, 1,
0.387217, 0.6484501, -0.1063554, 0, 0.1529412, 1, 1,
0.3875102, 0.6543415, -0.07604588, 0, 0.1490196, 1, 1,
0.3902489, 0.769263, -0.01978402, 0, 0.1411765, 1, 1,
0.391043, -0.3256158, 1.312571, 0, 0.1372549, 1, 1,
0.3918056, -0.8263178, 3.78384, 0, 0.1294118, 1, 1,
0.3927334, 0.5425466, 1.163542, 0, 0.1254902, 1, 1,
0.3944961, 0.9235775, -0.309975, 0, 0.1176471, 1, 1,
0.3958119, 0.3204701, 0.1977754, 0, 0.1137255, 1, 1,
0.3968672, -0.6076488, 2.864925, 0, 0.1058824, 1, 1,
0.3995966, -0.5656883, 2.290626, 0, 0.09803922, 1, 1,
0.4042946, 0.6592158, -0.5756475, 0, 0.09411765, 1, 1,
0.4096121, 1.595874, 0.3096922, 0, 0.08627451, 1, 1,
0.4137721, 0.002584983, 2.474298, 0, 0.08235294, 1, 1,
0.4147238, -1.094004, 2.358157, 0, 0.07450981, 1, 1,
0.4175702, 0.9655457, 0.5997656, 0, 0.07058824, 1, 1,
0.4211421, 0.6618258, -0.4856756, 0, 0.0627451, 1, 1,
0.4219457, -0.5876385, 1.335249, 0, 0.05882353, 1, 1,
0.4225491, -1.193099, 2.909971, 0, 0.05098039, 1, 1,
0.4264103, 2.572161, 0.2926196, 0, 0.04705882, 1, 1,
0.4289424, -1.395647, 2.4188, 0, 0.03921569, 1, 1,
0.4294159, -0.2764137, 2.996812, 0, 0.03529412, 1, 1,
0.4359587, 1.832981, 0.07806015, 0, 0.02745098, 1, 1,
0.4387636, 1.281881, 1.269994, 0, 0.02352941, 1, 1,
0.4394732, 0.3304136, 1.348927, 0, 0.01568628, 1, 1,
0.442194, -0.2873351, 3.819935, 0, 0.01176471, 1, 1,
0.4441044, 0.06862546, 2.076373, 0, 0.003921569, 1, 1,
0.4488442, 0.6998316, 1.711489, 0.003921569, 0, 1, 1,
0.454514, 1.656541, 0.8543618, 0.007843138, 0, 1, 1,
0.4572489, -2.555565, 3.436042, 0.01568628, 0, 1, 1,
0.4598644, 0.6826015, 0.4656737, 0.01960784, 0, 1, 1,
0.4598981, -1.341404, 2.290017, 0.02745098, 0, 1, 1,
0.4702255, 0.1105324, 1.073097, 0.03137255, 0, 1, 1,
0.4815347, 0.8576204, -0.5678955, 0.03921569, 0, 1, 1,
0.4838747, 2.592635, 0.0916173, 0.04313726, 0, 1, 1,
0.4889865, -0.07408951, 0.2305167, 0.05098039, 0, 1, 1,
0.4892335, 0.07049508, 2.632449, 0.05490196, 0, 1, 1,
0.4958253, 1.024836, 0.2067621, 0.0627451, 0, 1, 1,
0.4991981, -0.4727795, 2.807292, 0.06666667, 0, 1, 1,
0.4995202, -0.4863383, 2.069649, 0.07450981, 0, 1, 1,
0.5011957, 1.108873, -1.982649, 0.07843138, 0, 1, 1,
0.5026163, 0.5866181, 1.084967, 0.08627451, 0, 1, 1,
0.5032738, -0.7249097, 4.601301, 0.09019608, 0, 1, 1,
0.5044904, 0.9857183, 0.4211852, 0.09803922, 0, 1, 1,
0.5101427, -1.059033, 2.715486, 0.1058824, 0, 1, 1,
0.5106089, -1.403798, 3.008275, 0.1098039, 0, 1, 1,
0.5182698, 0.7177926, 0.003870543, 0.1176471, 0, 1, 1,
0.5188001, -1.566775, 4.838143, 0.1215686, 0, 1, 1,
0.52044, 0.006694627, 1.930333, 0.1294118, 0, 1, 1,
0.520462, -1.103117, 1.428489, 0.1333333, 0, 1, 1,
0.520488, 0.8598347, -0.5272622, 0.1411765, 0, 1, 1,
0.5270372, -1.00708, 2.292713, 0.145098, 0, 1, 1,
0.5274295, -0.5451207, 2.531413, 0.1529412, 0, 1, 1,
0.5289062, -0.3335389, 2.820587, 0.1568628, 0, 1, 1,
0.5349879, -0.08999141, 0.8511961, 0.1647059, 0, 1, 1,
0.5355767, 0.1914135, 0.7875033, 0.1686275, 0, 1, 1,
0.5373967, 0.7803223, 0.1855037, 0.1764706, 0, 1, 1,
0.5418523, -0.1611112, 4.172193, 0.1803922, 0, 1, 1,
0.5439684, 0.7524201, 0.9297604, 0.1882353, 0, 1, 1,
0.5458001, -0.195156, 3.376282, 0.1921569, 0, 1, 1,
0.5489581, 0.3422714, 1.440014, 0.2, 0, 1, 1,
0.5527304, 0.03832006, 2.311642, 0.2078431, 0, 1, 1,
0.5654203, 1.954355, 0.2884974, 0.2117647, 0, 1, 1,
0.5706421, 0.6732875, 0.7267669, 0.2196078, 0, 1, 1,
0.574164, -0.9053276, 1.746493, 0.2235294, 0, 1, 1,
0.5749695, -0.6105884, 1.445482, 0.2313726, 0, 1, 1,
0.5787627, -1.528315, 2.781948, 0.2352941, 0, 1, 1,
0.5810401, -0.1744618, 2.409097, 0.2431373, 0, 1, 1,
0.5817702, -0.367322, 2.437633, 0.2470588, 0, 1, 1,
0.5823082, 0.54585, 0.8294009, 0.254902, 0, 1, 1,
0.5826998, 0.2342051, -1.438616, 0.2588235, 0, 1, 1,
0.585681, 0.09109368, 1.640048, 0.2666667, 0, 1, 1,
0.5885282, 0.8218336, 1.746404, 0.2705882, 0, 1, 1,
0.5897984, -2.172145, 1.821685, 0.2784314, 0, 1, 1,
0.5913122, 0.1758966, 1.176505, 0.282353, 0, 1, 1,
0.5913275, 0.3499527, 0.4681485, 0.2901961, 0, 1, 1,
0.5925734, -0.7208577, 2.1175, 0.2941177, 0, 1, 1,
0.5926926, 0.7426775, 0.743312, 0.3019608, 0, 1, 1,
0.5947585, 0.03659556, 0.05836344, 0.3098039, 0, 1, 1,
0.6033446, -0.8423766, 3.135539, 0.3137255, 0, 1, 1,
0.6039933, -1.256536, 3.113407, 0.3215686, 0, 1, 1,
0.6081434, -1.331338, 2.944738, 0.3254902, 0, 1, 1,
0.6124245, 0.5475681, -0.1149824, 0.3333333, 0, 1, 1,
0.6145495, 0.5164875, 0.3513056, 0.3372549, 0, 1, 1,
0.6152707, 0.1105608, 2.679555, 0.345098, 0, 1, 1,
0.6160378, 0.4266034, 0.1574034, 0.3490196, 0, 1, 1,
0.6160874, -0.2294941, 2.593646, 0.3568628, 0, 1, 1,
0.6185373, -0.8588693, 1.956288, 0.3607843, 0, 1, 1,
0.6205068, -0.5135867, 0.2764093, 0.3686275, 0, 1, 1,
0.6208059, 1.341678, -1.700134, 0.372549, 0, 1, 1,
0.6277843, 0.7347687, -1.127902, 0.3803922, 0, 1, 1,
0.6307998, 1.017754, 1.1332, 0.3843137, 0, 1, 1,
0.6380845, 0.08432405, 0.6576121, 0.3921569, 0, 1, 1,
0.6401409, -1.760733, 2.225309, 0.3960784, 0, 1, 1,
0.6407462, -0.966902, 1.810224, 0.4039216, 0, 1, 1,
0.6427634, -0.5427596, 3.671847, 0.4117647, 0, 1, 1,
0.6445906, -0.3778136, 2.300045, 0.4156863, 0, 1, 1,
0.6446262, -1.312484, 2.225877, 0.4235294, 0, 1, 1,
0.645722, -0.4379739, 2.148079, 0.427451, 0, 1, 1,
0.6463767, 1.084676, -0.7485346, 0.4352941, 0, 1, 1,
0.646681, 0.3728219, 0.637782, 0.4392157, 0, 1, 1,
0.6500719, 2.563, -0.445698, 0.4470588, 0, 1, 1,
0.6718792, 0.4585799, 1.491614, 0.4509804, 0, 1, 1,
0.6738013, -1.401781, 1.264899, 0.4588235, 0, 1, 1,
0.6742311, 2.018944, 1.152605, 0.4627451, 0, 1, 1,
0.6742638, -1.113974, 4.221825, 0.4705882, 0, 1, 1,
0.675079, 1.377772, 1.500744, 0.4745098, 0, 1, 1,
0.6823015, -0.1992565, 0.4437886, 0.4823529, 0, 1, 1,
0.6890794, -0.172569, 1.02242, 0.4862745, 0, 1, 1,
0.6919987, -0.6339716, 0.7299885, 0.4941176, 0, 1, 1,
0.6968928, -0.1833472, 2.971008, 0.5019608, 0, 1, 1,
0.7000672, -0.5676156, 2.867898, 0.5058824, 0, 1, 1,
0.7010583, -0.01472725, 1.863004, 0.5137255, 0, 1, 1,
0.7100286, -1.04756, 0.9768002, 0.5176471, 0, 1, 1,
0.7140247, -0.04832599, -0.07129242, 0.5254902, 0, 1, 1,
0.7180889, 0.2815033, 2.243605, 0.5294118, 0, 1, 1,
0.7269734, 0.7482712, 1.063032, 0.5372549, 0, 1, 1,
0.7292368, 1.01905, 3.359096, 0.5411765, 0, 1, 1,
0.7300043, -1.106663, 1.772919, 0.5490196, 0, 1, 1,
0.7301211, 0.3202227, 0.6232538, 0.5529412, 0, 1, 1,
0.7307474, 0.1234485, 0.1758011, 0.5607843, 0, 1, 1,
0.7376934, 0.9446106, -1.327758, 0.5647059, 0, 1, 1,
0.7385684, 1.330491, 0.8379755, 0.572549, 0, 1, 1,
0.7410755, 0.4371141, 1.620844, 0.5764706, 0, 1, 1,
0.7413922, 0.2586735, 2.725247, 0.5843138, 0, 1, 1,
0.741486, 0.09093183, 0.8021525, 0.5882353, 0, 1, 1,
0.747223, -2.753762, 2.651035, 0.5960785, 0, 1, 1,
0.7491369, -0.07684109, 3.300673, 0.6039216, 0, 1, 1,
0.7695965, 0.5823271, 2.256095, 0.6078432, 0, 1, 1,
0.7782217, -0.7104762, 3.519078, 0.6156863, 0, 1, 1,
0.7808145, -0.52633, 2.118369, 0.6196079, 0, 1, 1,
0.7882303, 0.9357135, -0.301641, 0.627451, 0, 1, 1,
0.7961124, 0.4591538, 1.34806, 0.6313726, 0, 1, 1,
0.7974483, 0.1744924, 2.025707, 0.6392157, 0, 1, 1,
0.801092, 1.212738, -1.196177, 0.6431373, 0, 1, 1,
0.8011822, 0.7358878, 1.881938, 0.6509804, 0, 1, 1,
0.8051949, -1.505807, 2.719, 0.654902, 0, 1, 1,
0.8073717, 1.432018, 1.727373, 0.6627451, 0, 1, 1,
0.8074473, -0.8210225, 2.047447, 0.6666667, 0, 1, 1,
0.8081688, 0.07544558, 1.13007, 0.6745098, 0, 1, 1,
0.8091562, 0.8331543, -0.7033948, 0.6784314, 0, 1, 1,
0.8096577, -0.5422348, 2.838249, 0.6862745, 0, 1, 1,
0.8146617, -1.22861, 1.871176, 0.6901961, 0, 1, 1,
0.8154427, -0.1988515, 1.234859, 0.6980392, 0, 1, 1,
0.8166831, 0.2355234, 2.783883, 0.7058824, 0, 1, 1,
0.8168183, 0.7560132, 0.1753006, 0.7098039, 0, 1, 1,
0.8340691, 0.9181414, 0.6216521, 0.7176471, 0, 1, 1,
0.8376579, -2.877797, 2.117182, 0.7215686, 0, 1, 1,
0.838047, -0.1975236, -0.001027811, 0.7294118, 0, 1, 1,
0.8413635, 0.7964758, 2.6997, 0.7333333, 0, 1, 1,
0.8495431, 0.2453242, 0.2122717, 0.7411765, 0, 1, 1,
0.8630967, 0.3571446, 1.064406, 0.7450981, 0, 1, 1,
0.8726014, 0.7054065, 1.77802, 0.7529412, 0, 1, 1,
0.8813089, -0.3835414, 2.249729, 0.7568628, 0, 1, 1,
0.883307, 0.2740631, 0.5228975, 0.7647059, 0, 1, 1,
0.8876837, 0.3794276, 0.851634, 0.7686275, 0, 1, 1,
0.8896501, -0.183397, 2.528044, 0.7764706, 0, 1, 1,
0.8914455, -1.413528, 1.907716, 0.7803922, 0, 1, 1,
0.8968295, 1.171805, 0.4588521, 0.7882353, 0, 1, 1,
0.9043457, -2.530173, 5.054384, 0.7921569, 0, 1, 1,
0.9046391, 2.013933, 0.1267694, 0.8, 0, 1, 1,
0.9069688, 0.7147001, 1.835364, 0.8078431, 0, 1, 1,
0.9131398, -1.448194, 4.146265, 0.8117647, 0, 1, 1,
0.9190695, -1.141561, 1.963319, 0.8196079, 0, 1, 1,
0.9226168, -0.5692031, 1.38724, 0.8235294, 0, 1, 1,
0.9243441, 1.426875, -0.273161, 0.8313726, 0, 1, 1,
0.9245882, -1.228281, 1.64587, 0.8352941, 0, 1, 1,
0.925173, -0.02278705, 0.3165786, 0.8431373, 0, 1, 1,
0.9270384, -0.1003755, 2.952139, 0.8470588, 0, 1, 1,
0.9289178, -1.623001, 3.202312, 0.854902, 0, 1, 1,
0.931013, -0.02223015, 1.235067, 0.8588235, 0, 1, 1,
0.9333853, -0.4908494, 3.280482, 0.8666667, 0, 1, 1,
0.9369912, 0.2461358, 1.37686, 0.8705882, 0, 1, 1,
0.9443347, -0.09771497, 2.412146, 0.8784314, 0, 1, 1,
0.9447436, -0.5026382, 2.285783, 0.8823529, 0, 1, 1,
0.9481872, -0.02205814, 1.983168, 0.8901961, 0, 1, 1,
0.9487413, 1.052237, 1.540707, 0.8941177, 0, 1, 1,
0.9526623, -1.224727, 2.426245, 0.9019608, 0, 1, 1,
0.9541811, 0.2538399, 0.2949322, 0.9098039, 0, 1, 1,
0.9550061, 0.1895595, -0.03998297, 0.9137255, 0, 1, 1,
0.9576338, -0.5109211, -0.06540795, 0.9215686, 0, 1, 1,
0.9607496, 0.496054, -0.08733623, 0.9254902, 0, 1, 1,
0.9617733, 0.05477363, 1.916562, 0.9333333, 0, 1, 1,
0.9658254, 0.8845578, 0.6934211, 0.9372549, 0, 1, 1,
0.9705821, 0.05122522, -0.6773863, 0.945098, 0, 1, 1,
0.9759657, 0.4956166, 1.517323, 0.9490196, 0, 1, 1,
0.9767838, 0.4366193, 3.269221, 0.9568627, 0, 1, 1,
0.978552, 1.779584, 0.211998, 0.9607843, 0, 1, 1,
0.9793867, 0.6463529, 1.990734, 0.9686275, 0, 1, 1,
0.9869587, -0.490929, 2.331206, 0.972549, 0, 1, 1,
0.9908606, -0.8058589, 2.743588, 0.9803922, 0, 1, 1,
0.9938371, -1.122343, 0.3917634, 0.9843137, 0, 1, 1,
0.998711, -0.4307544, 1.383259, 0.9921569, 0, 1, 1,
1.000311, -0.1965432, 1.733358, 0.9960784, 0, 1, 1,
1.002685, 1.244362, 2.183929, 1, 0, 0.9960784, 1,
1.016461, -0.3161909, 3.172672, 1, 0, 0.9882353, 1,
1.017111, 0.02441916, -0.08651668, 1, 0, 0.9843137, 1,
1.017483, 0.9640407, 2.197907, 1, 0, 0.9764706, 1,
1.017692, -0.692464, 0.01542925, 1, 0, 0.972549, 1,
1.021754, -1.771736, 1.644015, 1, 0, 0.9647059, 1,
1.024291, 1.584349, 1.476794, 1, 0, 0.9607843, 1,
1.030368, -1.29408, 3.205585, 1, 0, 0.9529412, 1,
1.031579, 1.083179, -0.202423, 1, 0, 0.9490196, 1,
1.04797, -1.791874, 2.888392, 1, 0, 0.9411765, 1,
1.048144, -1.008277, 3.376167, 1, 0, 0.9372549, 1,
1.056877, -0.9840235, 1.020003, 1, 0, 0.9294118, 1,
1.059621, 0.9538244, 0.01418339, 1, 0, 0.9254902, 1,
1.067709, 0.5130876, 1.687138, 1, 0, 0.9176471, 1,
1.068786, 0.8740698, 1.164338, 1, 0, 0.9137255, 1,
1.070902, 0.2633186, 2.443872, 1, 0, 0.9058824, 1,
1.073237, -0.4868578, 2.146771, 1, 0, 0.9019608, 1,
1.075186, -1.746997, 3.156699, 1, 0, 0.8941177, 1,
1.090395, -2.218073, 2.634976, 1, 0, 0.8862745, 1,
1.091217, 1.730987, -0.0538433, 1, 0, 0.8823529, 1,
1.091457, -0.841539, 1.875441, 1, 0, 0.8745098, 1,
1.092945, -0.6409999, 3.475704, 1, 0, 0.8705882, 1,
1.095117, 0.6737655, 1.076359, 1, 0, 0.8627451, 1,
1.097701, -1.477535, 1.155481, 1, 0, 0.8588235, 1,
1.100366, -0.8195512, 1.9186, 1, 0, 0.8509804, 1,
1.104554, -0.91842, 3.564424, 1, 0, 0.8470588, 1,
1.108904, -1.215346, 1.834136, 1, 0, 0.8392157, 1,
1.11035, -0.5356576, 1.937698, 1, 0, 0.8352941, 1,
1.120027, 0.08514667, 3.279976, 1, 0, 0.827451, 1,
1.123101, 0.123928, 1.628989, 1, 0, 0.8235294, 1,
1.125105, -0.1587858, 0.2452922, 1, 0, 0.8156863, 1,
1.12636, 0.2421424, 1.595765, 1, 0, 0.8117647, 1,
1.127372, -1.518237, 2.299766, 1, 0, 0.8039216, 1,
1.128337, -0.128168, -0.4705802, 1, 0, 0.7960784, 1,
1.13705, -1.034311, 3.606708, 1, 0, 0.7921569, 1,
1.138554, 0.5342793, -0.04655752, 1, 0, 0.7843137, 1,
1.139149, -1.248245, 0.3022978, 1, 0, 0.7803922, 1,
1.141652, -0.04012653, 4.229354, 1, 0, 0.772549, 1,
1.143269, -1.240459, 2.481215, 1, 0, 0.7686275, 1,
1.14374, -0.7407125, 2.547136, 1, 0, 0.7607843, 1,
1.145833, 0.6191393, 3.267717, 1, 0, 0.7568628, 1,
1.14807, -0.5864877, 2.903525, 1, 0, 0.7490196, 1,
1.149464, 0.4431949, 0.05818135, 1, 0, 0.7450981, 1,
1.163037, -1.102568, 0.8467292, 1, 0, 0.7372549, 1,
1.167001, -0.5636913, 2.18249, 1, 0, 0.7333333, 1,
1.171299, -1.183746, 2.273395, 1, 0, 0.7254902, 1,
1.174156, -0.7053123, 3.097157, 1, 0, 0.7215686, 1,
1.177819, -0.402934, 1.920198, 1, 0, 0.7137255, 1,
1.191951, 0.9628075, 0.1542445, 1, 0, 0.7098039, 1,
1.192538, -0.4173814, 1.612927, 1, 0, 0.7019608, 1,
1.193173, -0.2466397, 1.956226, 1, 0, 0.6941177, 1,
1.19622, -0.5484859, 2.00742, 1, 0, 0.6901961, 1,
1.216287, 0.2538998, 2.646935, 1, 0, 0.682353, 1,
1.21951, 0.707751, 0.03558755, 1, 0, 0.6784314, 1,
1.21962, 0.187268, 0.003635718, 1, 0, 0.6705883, 1,
1.227964, 0.3356179, -0.07618136, 1, 0, 0.6666667, 1,
1.230489, 0.5327055, 1.113279, 1, 0, 0.6588235, 1,
1.230799, -0.5240037, 1.258452, 1, 0, 0.654902, 1,
1.233409, 1.839933, 1.80972, 1, 0, 0.6470588, 1,
1.243472, -0.8292022, 3.57192, 1, 0, 0.6431373, 1,
1.243735, -0.4029164, 1.806731, 1, 0, 0.6352941, 1,
1.258704, 0.6354976, 0.02366619, 1, 0, 0.6313726, 1,
1.261391, -2.552976, 4.005525, 1, 0, 0.6235294, 1,
1.261883, 0.7955704, 0.2068179, 1, 0, 0.6196079, 1,
1.268865, 0.3249159, 0.9682614, 1, 0, 0.6117647, 1,
1.273143, -0.1912558, 2.905821, 1, 0, 0.6078432, 1,
1.277767, -0.6880786, 1.644041, 1, 0, 0.6, 1,
1.285495, 0.03049012, 0.8640598, 1, 0, 0.5921569, 1,
1.287514, -0.8738354, 3.875411, 1, 0, 0.5882353, 1,
1.291406, 0.8244223, 1.493143, 1, 0, 0.5803922, 1,
1.293385, -1.900042, 1.125194, 1, 0, 0.5764706, 1,
1.296511, 0.8775458, 1.702546, 1, 0, 0.5686275, 1,
1.297284, 1.026936, 1.704249, 1, 0, 0.5647059, 1,
1.301204, 0.5626361, 0.4869518, 1, 0, 0.5568628, 1,
1.303856, 0.5524477, 0.2986064, 1, 0, 0.5529412, 1,
1.316669, 0.350094, 1.715355, 1, 0, 0.5450981, 1,
1.339265, 0.6043527, 2.842499, 1, 0, 0.5411765, 1,
1.358746, -0.01529584, 1.649388, 1, 0, 0.5333334, 1,
1.3742, 1.034576, 0.9563771, 1, 0, 0.5294118, 1,
1.383629, 0.05166256, 0.7929029, 1, 0, 0.5215687, 1,
1.384335, 1.709905, -0.7998922, 1, 0, 0.5176471, 1,
1.393659, 0.6180999, 0.009695635, 1, 0, 0.509804, 1,
1.393735, 0.4727557, -0.2508684, 1, 0, 0.5058824, 1,
1.401537, 0.7120125, 0.7486985, 1, 0, 0.4980392, 1,
1.40451, -0.5433213, -0.1529452, 1, 0, 0.4901961, 1,
1.418634, 1.220569, 1.075181, 1, 0, 0.4862745, 1,
1.432331, -0.3420073, 0.8650383, 1, 0, 0.4784314, 1,
1.439794, 1.54629, 0.3515325, 1, 0, 0.4745098, 1,
1.442912, 1.649452, 0.4684522, 1, 0, 0.4666667, 1,
1.450374, 0.4374729, -0.1112494, 1, 0, 0.4627451, 1,
1.46615, -0.5769593, 1.540367, 1, 0, 0.454902, 1,
1.46906, 0.002102391, 2.837487, 1, 0, 0.4509804, 1,
1.500288, -1.29639, 4.205542, 1, 0, 0.4431373, 1,
1.505885, -0.03724821, 0.8369237, 1, 0, 0.4392157, 1,
1.506734, -0.5931028, 1.567572, 1, 0, 0.4313726, 1,
1.517097, -0.5558626, 3.329441, 1, 0, 0.427451, 1,
1.521209, 1.026481, 1.137873, 1, 0, 0.4196078, 1,
1.522716, -0.6033629, 4.220701, 1, 0, 0.4156863, 1,
1.553017, -1.015522, 0.5176784, 1, 0, 0.4078431, 1,
1.556744, 0.2002281, 2.75569, 1, 0, 0.4039216, 1,
1.566384, -0.09519886, 2.120699, 1, 0, 0.3960784, 1,
1.568293, -0.3391034, 2.124243, 1, 0, 0.3882353, 1,
1.579004, 0.0325167, 1.593285, 1, 0, 0.3843137, 1,
1.595674, -1.309242, 2.288474, 1, 0, 0.3764706, 1,
1.605686, -1.222733, -0.07387447, 1, 0, 0.372549, 1,
1.607041, -0.894612, 2.577463, 1, 0, 0.3647059, 1,
1.609803, 0.5413485, 0.1915706, 1, 0, 0.3607843, 1,
1.609953, 1.357737, 1.549917, 1, 0, 0.3529412, 1,
1.613367, -0.330921, 2.356418, 1, 0, 0.3490196, 1,
1.628238, -0.09586672, 1.865168, 1, 0, 0.3411765, 1,
1.632675, 0.2750032, 1.737847, 1, 0, 0.3372549, 1,
1.64608, 0.004099805, 0.7923531, 1, 0, 0.3294118, 1,
1.649295, -0.1590859, 2.45199, 1, 0, 0.3254902, 1,
1.651589, -1.064057, 2.087553, 1, 0, 0.3176471, 1,
1.668785, -0.3966747, 2.251054, 1, 0, 0.3137255, 1,
1.674644, -0.5213654, 3.306918, 1, 0, 0.3058824, 1,
1.701178, 0.5359013, 1.192938, 1, 0, 0.2980392, 1,
1.714825, -0.1998925, 2.166613, 1, 0, 0.2941177, 1,
1.735603, -1.319286, 4.813775, 1, 0, 0.2862745, 1,
1.757235, 0.06370986, 2.253355, 1, 0, 0.282353, 1,
1.768783, -1.901121, 2.916745, 1, 0, 0.2745098, 1,
1.772902, -1.328453, 1.974451, 1, 0, 0.2705882, 1,
1.773976, 1.797776, 0.5698798, 1, 0, 0.2627451, 1,
1.783622, 0.8545265, 1.705998, 1, 0, 0.2588235, 1,
1.784489, -0.4205256, 1.733629, 1, 0, 0.2509804, 1,
1.799307, 0.1788011, 2.176667, 1, 0, 0.2470588, 1,
1.799845, 1.022669, 0.669572, 1, 0, 0.2392157, 1,
1.803427, -0.6106622, 3.035353, 1, 0, 0.2352941, 1,
1.813852, 0.6864735, 2.118818, 1, 0, 0.227451, 1,
1.935723, 0.7289621, 1.052653, 1, 0, 0.2235294, 1,
1.969398, 0.5413684, 2.607202, 1, 0, 0.2156863, 1,
1.980305, 1.021077, 0.8677133, 1, 0, 0.2117647, 1,
1.989246, 1.443211, 1.713444, 1, 0, 0.2039216, 1,
2.024194, 0.2618231, 1.827663, 1, 0, 0.1960784, 1,
2.025296, -0.07116869, 0.4333506, 1, 0, 0.1921569, 1,
2.026628, 1.679837, 1.568495, 1, 0, 0.1843137, 1,
2.0376, -0.416911, 1.35812, 1, 0, 0.1803922, 1,
2.046372, -0.6324412, 1.837964, 1, 0, 0.172549, 1,
2.055097, 1.330373, -0.5351552, 1, 0, 0.1686275, 1,
2.100191, 0.1069802, 0.7572415, 1, 0, 0.1607843, 1,
2.119866, -0.6914664, 2.816977, 1, 0, 0.1568628, 1,
2.143831, 0.4128346, 3.147146, 1, 0, 0.1490196, 1,
2.170233, -0.6513776, 1.923988, 1, 0, 0.145098, 1,
2.17522, -0.1231977, 1.049761, 1, 0, 0.1372549, 1,
2.181121, -0.9505259, 2.288084, 1, 0, 0.1333333, 1,
2.203607, -1.594017, 2.907438, 1, 0, 0.1254902, 1,
2.206487, -0.02181661, 1.133013, 1, 0, 0.1215686, 1,
2.212526, -0.05618351, 0.3518667, 1, 0, 0.1137255, 1,
2.246182, 1.972277, -0.0891896, 1, 0, 0.1098039, 1,
2.279094, 0.954828, -0.1796308, 1, 0, 0.1019608, 1,
2.369175, 0.2525905, 0.6742301, 1, 0, 0.09411765, 1,
2.374035, -0.214707, 0.9416471, 1, 0, 0.09019608, 1,
2.378363, 0.1415953, 2.812858, 1, 0, 0.08235294, 1,
2.408549, 1.944244, 1.073653, 1, 0, 0.07843138, 1,
2.595998, 1.354424, 0.7272184, 1, 0, 0.07058824, 1,
2.611793, -0.7282784, 1.638795, 1, 0, 0.06666667, 1,
2.624894, -0.4326763, 3.084704, 1, 0, 0.05882353, 1,
2.770094, 0.565785, 0.5972871, 1, 0, 0.05490196, 1,
2.835538, -0.4435246, 2.044606, 1, 0, 0.04705882, 1,
2.849989, 2.162607, 0.8568421, 1, 0, 0.04313726, 1,
2.875153, 2.00215, 0.5912901, 1, 0, 0.03529412, 1,
2.891157, 1.210865, 1.4418, 1, 0, 0.03137255, 1,
2.940931, 0.1571362, 2.011634, 1, 0, 0.02352941, 1,
3.085491, 1.845436, 0.1317229, 1, 0, 0.01960784, 1,
3.108048, 0.3004554, 0.4827344, 1, 0, 0.01176471, 1,
3.354108, -0.1397505, 1.783549, 1, 0, 0.007843138, 1
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
0.0663271, -4.326174, -6.989522, 0, -0.5, 0.5, 0.5,
0.0663271, -4.326174, -6.989522, 1, -0.5, 0.5, 0.5,
0.0663271, -4.326174, -6.989522, 1, 1.5, 0.5, 0.5,
0.0663271, -4.326174, -6.989522, 0, 1.5, 0.5, 0.5
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
-4.336011, -0.1565269, -6.989522, 0, -0.5, 0.5, 0.5,
-4.336011, -0.1565269, -6.989522, 1, -0.5, 0.5, 0.5,
-4.336011, -0.1565269, -6.989522, 1, 1.5, 0.5, 0.5,
-4.336011, -0.1565269, -6.989522, 0, 1.5, 0.5, 0.5
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
-4.336011, -4.326174, -0.06540799, 0, -0.5, 0.5, 0.5,
-4.336011, -4.326174, -0.06540799, 1, -0.5, 0.5, 0.5,
-4.336011, -4.326174, -0.06540799, 1, 1.5, 0.5, 0.5,
-4.336011, -4.326174, -0.06540799, 0, 1.5, 0.5, 0.5
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
-3, -3.363948, -5.39165,
3, -3.363948, -5.39165,
-3, -3.363948, -5.39165,
-3, -3.524319, -5.657962,
-2, -3.363948, -5.39165,
-2, -3.524319, -5.657962,
-1, -3.363948, -5.39165,
-1, -3.524319, -5.657962,
0, -3.363948, -5.39165,
0, -3.524319, -5.657962,
1, -3.363948, -5.39165,
1, -3.524319, -5.657962,
2, -3.363948, -5.39165,
2, -3.524319, -5.657962,
3, -3.363948, -5.39165,
3, -3.524319, -5.657962
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
-3, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
-3, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
-3, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
-3, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
-2, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
-2, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
-2, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
-2, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
-1, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
-1, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
-1, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
-1, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
0, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
0, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
0, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
0, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
1, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
1, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
1, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
1, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
2, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
2, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
2, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
2, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5,
3, -3.845061, -6.190586, 0, -0.5, 0.5, 0.5,
3, -3.845061, -6.190586, 1, -0.5, 0.5, 0.5,
3, -3.845061, -6.190586, 1, 1.5, 0.5, 0.5,
3, -3.845061, -6.190586, 0, 1.5, 0.5, 0.5
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
-3.320087, -3, -5.39165,
-3.320087, 2, -5.39165,
-3.320087, -3, -5.39165,
-3.489408, -3, -5.657962,
-3.320087, -2, -5.39165,
-3.489408, -2, -5.657962,
-3.320087, -1, -5.39165,
-3.489408, -1, -5.657962,
-3.320087, 0, -5.39165,
-3.489408, 0, -5.657962,
-3.320087, 1, -5.39165,
-3.489408, 1, -5.657962,
-3.320087, 2, -5.39165,
-3.489408, 2, -5.657962
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
-3.828049, -3, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, -3, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, -3, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, -3, -6.190586, 0, 1.5, 0.5, 0.5,
-3.828049, -2, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, -2, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, -2, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, -2, -6.190586, 0, 1.5, 0.5, 0.5,
-3.828049, -1, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, -1, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, -1, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, -1, -6.190586, 0, 1.5, 0.5, 0.5,
-3.828049, 0, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, 0, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, 0, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, 0, -6.190586, 0, 1.5, 0.5, 0.5,
-3.828049, 1, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, 1, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, 1, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, 1, -6.190586, 0, 1.5, 0.5, 0.5,
-3.828049, 2, -6.190586, 0, -0.5, 0.5, 0.5,
-3.828049, 2, -6.190586, 1, -0.5, 0.5, 0.5,
-3.828049, 2, -6.190586, 1, 1.5, 0.5, 0.5,
-3.828049, 2, -6.190586, 0, 1.5, 0.5, 0.5
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
-3.320087, -3.363948, -4,
-3.320087, -3.363948, 4,
-3.320087, -3.363948, -4,
-3.489408, -3.524319, -4,
-3.320087, -3.363948, -2,
-3.489408, -3.524319, -2,
-3.320087, -3.363948, 0,
-3.489408, -3.524319, 0,
-3.320087, -3.363948, 2,
-3.489408, -3.524319, 2,
-3.320087, -3.363948, 4,
-3.489408, -3.524319, 4
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
-3.828049, -3.845061, -4, 0, -0.5, 0.5, 0.5,
-3.828049, -3.845061, -4, 1, -0.5, 0.5, 0.5,
-3.828049, -3.845061, -4, 1, 1.5, 0.5, 0.5,
-3.828049, -3.845061, -4, 0, 1.5, 0.5, 0.5,
-3.828049, -3.845061, -2, 0, -0.5, 0.5, 0.5,
-3.828049, -3.845061, -2, 1, -0.5, 0.5, 0.5,
-3.828049, -3.845061, -2, 1, 1.5, 0.5, 0.5,
-3.828049, -3.845061, -2, 0, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 0, 0, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 0, 1, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 0, 1, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 0, 0, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 2, 0, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 2, 1, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 2, 1, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 2, 0, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 4, 0, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 4, 1, -0.5, 0.5, 0.5,
-3.828049, -3.845061, 4, 1, 1.5, 0.5, 0.5,
-3.828049, -3.845061, 4, 0, 1.5, 0.5, 0.5
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
-3.320087, -3.363948, -5.39165,
-3.320087, 3.050894, -5.39165,
-3.320087, -3.363948, 5.260834,
-3.320087, 3.050894, 5.260834,
-3.320087, -3.363948, -5.39165,
-3.320087, -3.363948, 5.260834,
-3.320087, 3.050894, -5.39165,
-3.320087, 3.050894, 5.260834,
-3.320087, -3.363948, -5.39165,
3.452741, -3.363948, -5.39165,
-3.320087, -3.363948, 5.260834,
3.452741, -3.363948, 5.260834,
-3.320087, 3.050894, -5.39165,
3.452741, 3.050894, -5.39165,
-3.320087, 3.050894, 5.260834,
3.452741, 3.050894, 5.260834,
3.452741, -3.363948, -5.39165,
3.452741, 3.050894, -5.39165,
3.452741, -3.363948, 5.260834,
3.452741, 3.050894, 5.260834,
3.452741, -3.363948, -5.39165,
3.452741, -3.363948, 5.260834,
3.452741, 3.050894, -5.39165,
3.452741, 3.050894, 5.260834
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
var radius = 7.560999;
var distance = 33.63974;
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
mvMatrix.translate( -0.0663271, 0.1565269, 0.06540799 );
mvMatrix.scale( 1.207044, 1.274404, 0.7674361 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63974);
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
fluridone<-read.table("fluridone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluridone$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluridone' not found
```

```r
y<-fluridone$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluridone' not found
```

```r
z<-fluridone$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluridone' not found
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
-3.221453, 0.02873837, -0.8789888, 0, 0, 1, 1, 1,
-2.851357, -0.9048927, -3.028477, 1, 0, 0, 1, 1,
-2.775805, 0.6994438, 0.006293526, 1, 0, 0, 1, 1,
-2.545332, -1.209034, -1.140791, 1, 0, 0, 1, 1,
-2.500003, 0.9346092, -0.5130422, 1, 0, 0, 1, 1,
-2.490598, -1.574823, -2.755763, 1, 0, 0, 1, 1,
-2.394936, 0.6588495, -0.7383041, 0, 0, 0, 1, 1,
-2.35652, 0.1922573, -1.453243, 0, 0, 0, 1, 1,
-2.34106, 0.3148394, -1.827919, 0, 0, 0, 1, 1,
-2.308594, 1.510615, -0.565087, 0, 0, 0, 1, 1,
-2.280102, -2.22514, -0.08649343, 0, 0, 0, 1, 1,
-2.272724, 1.30628, -0.8889772, 0, 0, 0, 1, 1,
-2.235823, -0.2818676, -1.514931, 0, 0, 0, 1, 1,
-2.223073, 0.6587522, -0.08843518, 1, 1, 1, 1, 1,
-2.151421, 1.044592, -0.01137319, 1, 1, 1, 1, 1,
-2.111482, 1.644737, -2.103924, 1, 1, 1, 1, 1,
-2.081545, -0.3905151, 0.8359804, 1, 1, 1, 1, 1,
-2.077437, 0.5571945, -2.068715, 1, 1, 1, 1, 1,
-2.072045, -0.3544329, -2.058767, 1, 1, 1, 1, 1,
-2.069578, 0.0265561, -3.363005, 1, 1, 1, 1, 1,
-2.050433, -0.002958155, -1.0025, 1, 1, 1, 1, 1,
-2.03304, 0.5458455, 0.9043824, 1, 1, 1, 1, 1,
-2.008071, 0.5770078, -2.025107, 1, 1, 1, 1, 1,
-2.002044, -0.6446034, -0.9898936, 1, 1, 1, 1, 1,
-1.971082, -0.5389718, 0.1157174, 1, 1, 1, 1, 1,
-1.968241, 1.495789, -1.649499, 1, 1, 1, 1, 1,
-1.962202, -0.1782412, -0.8533478, 1, 1, 1, 1, 1,
-1.960752, 1.07841, 0.1550661, 1, 1, 1, 1, 1,
-1.893473, 1.008378, -0.3826761, 0, 0, 1, 1, 1,
-1.864266, 0.3705648, -0.9983456, 1, 0, 0, 1, 1,
-1.850073, 0.4611405, -1.894376, 1, 0, 0, 1, 1,
-1.796258, 1.491134, -0.7061543, 1, 0, 0, 1, 1,
-1.781755, -1.011051, -2.739704, 1, 0, 0, 1, 1,
-1.779028, -1.27912, -3.516953, 1, 0, 0, 1, 1,
-1.763319, -1.260499, -3.393439, 0, 0, 0, 1, 1,
-1.760512, 0.9915963, -2.285303, 0, 0, 0, 1, 1,
-1.756657, -0.7186763, -1.812511, 0, 0, 0, 1, 1,
-1.746781, 0.9816688, -2.365378, 0, 0, 0, 1, 1,
-1.743575, 0.3198408, -2.579179, 0, 0, 0, 1, 1,
-1.735242, -0.01344277, -0.6821662, 0, 0, 0, 1, 1,
-1.732576, 1.706663, -1.102612, 0, 0, 0, 1, 1,
-1.719768, 1.489492, -0.7590727, 1, 1, 1, 1, 1,
-1.70888, -0.5450167, -2.207674, 1, 1, 1, 1, 1,
-1.70687, 0.5863861, -0.3652547, 1, 1, 1, 1, 1,
-1.660016, -1.228901, -2.309742, 1, 1, 1, 1, 1,
-1.656852, -0.0394602, -0.2524694, 1, 1, 1, 1, 1,
-1.627743, 0.01580083, -1.298459, 1, 1, 1, 1, 1,
-1.61837, 0.9602007, -1.913454, 1, 1, 1, 1, 1,
-1.614059, -0.5333738, -2.526522, 1, 1, 1, 1, 1,
-1.572499, 0.3217428, -0.8740015, 1, 1, 1, 1, 1,
-1.572224, -0.06701225, -2.209981, 1, 1, 1, 1, 1,
-1.570294, -0.7570689, -1.479999, 1, 1, 1, 1, 1,
-1.559186, 0.9087169, -3.774856, 1, 1, 1, 1, 1,
-1.542971, -1.085383, -2.416253, 1, 1, 1, 1, 1,
-1.529121, -1.622681, -2.718411, 1, 1, 1, 1, 1,
-1.52786, -0.233244, -0.4607466, 1, 1, 1, 1, 1,
-1.51194, -1.294792, -1.228069, 0, 0, 1, 1, 1,
-1.504828, -0.2684354, -0.8783692, 1, 0, 0, 1, 1,
-1.501691, 1.758665, -0.06117852, 1, 0, 0, 1, 1,
-1.494419, -0.8615512, -1.864482, 1, 0, 0, 1, 1,
-1.494386, 0.5458034, -2.29228, 1, 0, 0, 1, 1,
-1.490471, 1.032275, 1.666013, 1, 0, 0, 1, 1,
-1.488657, 0.731916, -2.02363, 0, 0, 0, 1, 1,
-1.48306, 0.5879844, -1.03736, 0, 0, 0, 1, 1,
-1.4772, 0.5223292, -1.658603, 0, 0, 0, 1, 1,
-1.474686, 0.9776267, -0.93576, 0, 0, 0, 1, 1,
-1.461674, -1.326273, -2.475708, 0, 0, 0, 1, 1,
-1.457214, -0.7468904, -0.9250101, 0, 0, 0, 1, 1,
-1.456292, 1.54029, -0.2483592, 0, 0, 0, 1, 1,
-1.452477, -1.344847, -0.9524496, 1, 1, 1, 1, 1,
-1.44169, 2.280044, -0.8239909, 1, 1, 1, 1, 1,
-1.43587, -0.9321014, -3.099311, 1, 1, 1, 1, 1,
-1.416675, 1.212373, 0.646385, 1, 1, 1, 1, 1,
-1.400317, 0.7801011, -0.6996201, 1, 1, 1, 1, 1,
-1.38899, 1.722518, -0.9781292, 1, 1, 1, 1, 1,
-1.384042, -1.1402, -3.071094, 1, 1, 1, 1, 1,
-1.371684, 1.260734, 0.2150044, 1, 1, 1, 1, 1,
-1.356355, 1.451426, -0.4115477, 1, 1, 1, 1, 1,
-1.354063, -1.104756, -4.193587, 1, 1, 1, 1, 1,
-1.337987, 1.03683, -0.3660427, 1, 1, 1, 1, 1,
-1.330826, -1.380671, -1.471425, 1, 1, 1, 1, 1,
-1.323694, -0.1227257, -1.897135, 1, 1, 1, 1, 1,
-1.313666, -1.159329, -1.649532, 1, 1, 1, 1, 1,
-1.30669, -0.6348157, -1.077635, 1, 1, 1, 1, 1,
-1.306355, -0.2465045, -1.766586, 0, 0, 1, 1, 1,
-1.302438, 1.28535, -3.942606, 1, 0, 0, 1, 1,
-1.297865, -1.265395, -1.887583, 1, 0, 0, 1, 1,
-1.29432, 0.07444675, -3.182938, 1, 0, 0, 1, 1,
-1.287846, -0.9381764, -1.205129, 1, 0, 0, 1, 1,
-1.284848, 1.032598, 1.235518, 1, 0, 0, 1, 1,
-1.278621, -1.578519, -1.539393, 0, 0, 0, 1, 1,
-1.277041, -0.723175, -0.4275113, 0, 0, 0, 1, 1,
-1.272514, 1.297849, 0.4716088, 0, 0, 0, 1, 1,
-1.267565, -1.672576, -1.006424, 0, 0, 0, 1, 1,
-1.258527, 0.4725454, -2.469025, 0, 0, 0, 1, 1,
-1.25723, -0.06281026, -0.7847155, 0, 0, 0, 1, 1,
-1.254781, 0.60633, -1.710105, 0, 0, 0, 1, 1,
-1.253112, -0.7466404, 0.1340064, 1, 1, 1, 1, 1,
-1.246425, 0.1926443, -2.200108, 1, 1, 1, 1, 1,
-1.241219, 0.5862411, -1.623269, 1, 1, 1, 1, 1,
-1.231609, 0.1207015, -1.761489, 1, 1, 1, 1, 1,
-1.225206, -0.1825076, -1.775627, 1, 1, 1, 1, 1,
-1.221424, -1.115807, -3.45821, 1, 1, 1, 1, 1,
-1.219702, -0.9042549, -1.931756, 1, 1, 1, 1, 1,
-1.206309, -0.3434198, -0.610371, 1, 1, 1, 1, 1,
-1.206279, 1.977641, 0.4108672, 1, 1, 1, 1, 1,
-1.200406, -0.3753383, -3.00408, 1, 1, 1, 1, 1,
-1.191942, -0.9257766, -2.210247, 1, 1, 1, 1, 1,
-1.16787, -0.728398, -2.337768, 1, 1, 1, 1, 1,
-1.167322, 0.6890233, -3.914531, 1, 1, 1, 1, 1,
-1.163606, -0.2311614, -1.49001, 1, 1, 1, 1, 1,
-1.159041, -0.2901899, -2.026798, 1, 1, 1, 1, 1,
-1.151308, -0.5519863, -0.425171, 0, 0, 1, 1, 1,
-1.151086, -0.6194358, 0.8750682, 1, 0, 0, 1, 1,
-1.150531, 0.1136118, -1.048612, 1, 0, 0, 1, 1,
-1.147285, 0.7188002, 0.3065073, 1, 0, 0, 1, 1,
-1.145558, -2.020795, -2.894859, 1, 0, 0, 1, 1,
-1.109539, 1.926006, 1.416775, 1, 0, 0, 1, 1,
-1.105295, 0.5313542, 0.6349343, 0, 0, 0, 1, 1,
-1.102786, 0.1150909, -0.8866732, 0, 0, 0, 1, 1,
-1.102536, 0.5029714, -1.117723, 0, 0, 0, 1, 1,
-1.101577, -0.4747867, -2.483708, 0, 0, 0, 1, 1,
-1.092658, -0.6049348, -2.243198, 0, 0, 0, 1, 1,
-1.092384, 0.1570236, -1.618191, 0, 0, 0, 1, 1,
-1.092259, 0.179394, -1.136687, 0, 0, 0, 1, 1,
-1.085496, 0.1329216, -1.193479, 1, 1, 1, 1, 1,
-1.083572, -0.6629294, -1.546186, 1, 1, 1, 1, 1,
-1.056575, 0.3922641, -0.860613, 1, 1, 1, 1, 1,
-1.052089, -0.0572516, -1.938363, 1, 1, 1, 1, 1,
-1.051425, 0.5825292, -0.8351911, 1, 1, 1, 1, 1,
-1.048762, -0.6226745, -2.222353, 1, 1, 1, 1, 1,
-1.047176, -1.424535, -2.611297, 1, 1, 1, 1, 1,
-1.042574, 0.1442875, -0.07595566, 1, 1, 1, 1, 1,
-1.039404, -0.1082433, -2.642002, 1, 1, 1, 1, 1,
-1.034993, 0.7449538, -0.3988405, 1, 1, 1, 1, 1,
-1.034196, -0.2418346, -3.47519, 1, 1, 1, 1, 1,
-1.028913, 2.346535, 0.3124364, 1, 1, 1, 1, 1,
-1.025581, 0.7271613, -0.6646729, 1, 1, 1, 1, 1,
-1.024122, -0.8471442, -2.192491, 1, 1, 1, 1, 1,
-1.023022, -0.6163336, -0.7164953, 1, 1, 1, 1, 1,
-1.019669, 2.210981, 1.928309, 0, 0, 1, 1, 1,
-1.015747, -3.270528, -3.900645, 1, 0, 0, 1, 1,
-1.004546, 1.131402, -1.225209, 1, 0, 0, 1, 1,
-1.000194, 0.5763537, -3.176325, 1, 0, 0, 1, 1,
-0.9930108, -1.021217, -2.356926, 1, 0, 0, 1, 1,
-0.9885356, -2.408234, -0.8230888, 1, 0, 0, 1, 1,
-0.9814755, 2.148131, -1.205047, 0, 0, 0, 1, 1,
-0.981348, -0.3178436, -0.9557462, 0, 0, 0, 1, 1,
-0.9749092, -0.254021, -3.714248, 0, 0, 0, 1, 1,
-0.9741399, -2.389341, -2.308936, 0, 0, 0, 1, 1,
-0.9697496, 0.3956301, -1.446523, 0, 0, 0, 1, 1,
-0.9642195, -0.8313301, -1.815539, 0, 0, 0, 1, 1,
-0.9616445, 0.03501503, -0.9449982, 0, 0, 0, 1, 1,
-0.9599176, -0.4787267, -2.852041, 1, 1, 1, 1, 1,
-0.9594024, -1.500495, -1.758704, 1, 1, 1, 1, 1,
-0.9578011, -0.566385, -0.9219903, 1, 1, 1, 1, 1,
-0.9542345, -0.2764667, 0.07984912, 1, 1, 1, 1, 1,
-0.9504122, -0.239377, -2.611097, 1, 1, 1, 1, 1,
-0.9498976, 1.648802, -0.6102104, 1, 1, 1, 1, 1,
-0.9495062, -0.1573732, -1.763101, 1, 1, 1, 1, 1,
-0.9458917, -0.4223423, -2.3819, 1, 1, 1, 1, 1,
-0.9445181, -0.06668665, 0.6539614, 1, 1, 1, 1, 1,
-0.9444044, -1.276571, -3.188432, 1, 1, 1, 1, 1,
-0.9423353, -0.3300181, -3.082593, 1, 1, 1, 1, 1,
-0.9330747, -1.778513, -2.857653, 1, 1, 1, 1, 1,
-0.9293418, 0.2380148, -0.06892332, 1, 1, 1, 1, 1,
-0.9265898, -0.9764208, -1.172081, 1, 1, 1, 1, 1,
-0.9131706, -0.7728436, -1.771281, 1, 1, 1, 1, 1,
-0.9112857, -1.624795, -3.108368, 0, 0, 1, 1, 1,
-0.9109911, -0.9097524, -3.952556, 1, 0, 0, 1, 1,
-0.9047032, 1.400656, -1.767361, 1, 0, 0, 1, 1,
-0.8964174, 0.8240638, -0.7149563, 1, 0, 0, 1, 1,
-0.8964154, -0.08625476, -3.447825, 1, 0, 0, 1, 1,
-0.8866234, 0.4532332, -1.376197, 1, 0, 0, 1, 1,
-0.8815728, -0.3498195, -1.109378, 0, 0, 0, 1, 1,
-0.85391, 1.350034, 0.3128413, 0, 0, 0, 1, 1,
-0.8478292, 1.302789, 0.5038502, 0, 0, 0, 1, 1,
-0.8423405, 0.5327281, -0.3076339, 0, 0, 0, 1, 1,
-0.839129, 0.3774689, -0.6186035, 0, 0, 0, 1, 1,
-0.8269156, -0.5782132, -2.227103, 0, 0, 0, 1, 1,
-0.8266941, -1.509552, -1.558501, 0, 0, 0, 1, 1,
-0.8224742, -0.1696114, -2.880807, 1, 1, 1, 1, 1,
-0.8201709, 0.9622583, 0.6932396, 1, 1, 1, 1, 1,
-0.8187991, 0.7726408, -0.7512593, 1, 1, 1, 1, 1,
-0.8177215, 0.5503047, -1.527575, 1, 1, 1, 1, 1,
-0.8161312, -0.1520311, -1.084415, 1, 1, 1, 1, 1,
-0.8154382, -1.100509, -2.465168, 1, 1, 1, 1, 1,
-0.8148107, 0.9832509, -1.41102, 1, 1, 1, 1, 1,
-0.8147791, -1.749829, -3.055913, 1, 1, 1, 1, 1,
-0.8106572, -1.200271, -3.693611, 1, 1, 1, 1, 1,
-0.8062252, -0.03747727, -0.7353069, 1, 1, 1, 1, 1,
-0.8057964, -0.1256022, -2.371746, 1, 1, 1, 1, 1,
-0.8027478, 1.997838, -0.1262547, 1, 1, 1, 1, 1,
-0.7991317, 0.7903985, -1.601624, 1, 1, 1, 1, 1,
-0.7964433, 1.027035, -0.4787298, 1, 1, 1, 1, 1,
-0.7918609, 1.032345, -1.345938, 1, 1, 1, 1, 1,
-0.7906086, 1.447793, -0.2722872, 0, 0, 1, 1, 1,
-0.783196, -0.8435126, -2.311146, 1, 0, 0, 1, 1,
-0.7829436, -0.3874974, -0.7430427, 1, 0, 0, 1, 1,
-0.7827347, 0.8431794, -0.02424735, 1, 0, 0, 1, 1,
-0.7801899, 0.7589363, -1.0238, 1, 0, 0, 1, 1,
-0.7766417, -0.9022754, -3.13244, 1, 0, 0, 1, 1,
-0.7753878, -0.4169443, -0.2615239, 0, 0, 0, 1, 1,
-0.7745776, 1.369421, -0.5259152, 0, 0, 0, 1, 1,
-0.7658128, -1.875175, -1.764789, 0, 0, 0, 1, 1,
-0.7610219, -0.1146481, -0.8390518, 0, 0, 0, 1, 1,
-0.7606353, 0.09562997, -2.350643, 0, 0, 0, 1, 1,
-0.756557, 0.6191524, -0.7970422, 0, 0, 0, 1, 1,
-0.7530877, 0.7608917, 0.3245307, 0, 0, 0, 1, 1,
-0.7530645, -0.5985128, -1.586115, 1, 1, 1, 1, 1,
-0.7516031, 0.8928562, -1.952658, 1, 1, 1, 1, 1,
-0.7495525, -1.072393, -3.369322, 1, 1, 1, 1, 1,
-0.7427491, -0.3480458, -4.079754, 1, 1, 1, 1, 1,
-0.7424781, 0.5457872, 0.2673664, 1, 1, 1, 1, 1,
-0.7406718, 2.636885, -0.557835, 1, 1, 1, 1, 1,
-0.7350049, 0.7055841, -1.404477, 1, 1, 1, 1, 1,
-0.7322581, 0.7413172, -0.9721856, 1, 1, 1, 1, 1,
-0.7319286, 1.734128, -1.189752, 1, 1, 1, 1, 1,
-0.7284979, 1.043896, -3.02183, 1, 1, 1, 1, 1,
-0.7276225, -0.3328334, -0.1320106, 1, 1, 1, 1, 1,
-0.724682, 0.07910162, 0.9170536, 1, 1, 1, 1, 1,
-0.7242543, 0.8023493, -0.1281947, 1, 1, 1, 1, 1,
-0.7200983, 0.39361, -1.632972, 1, 1, 1, 1, 1,
-0.7191656, -1.477557, -3.362592, 1, 1, 1, 1, 1,
-0.7156743, 0.2333771, -2.951446, 0, 0, 1, 1, 1,
-0.7047204, 0.2320087, 0.4124594, 1, 0, 0, 1, 1,
-0.7029995, 0.5805103, -1.523513, 1, 0, 0, 1, 1,
-0.7029204, 0.8932232, -0.1277234, 1, 0, 0, 1, 1,
-0.7020826, -1.315022, -2.38993, 1, 0, 0, 1, 1,
-0.7006015, -0.1625119, -1.618901, 1, 0, 0, 1, 1,
-0.6873501, 1.703833, 0.1926023, 0, 0, 0, 1, 1,
-0.6857474, -0.06740364, -1.246068, 0, 0, 0, 1, 1,
-0.684681, -1.31017, -1.187088, 0, 0, 0, 1, 1,
-0.67995, -1.165996, -2.145451, 0, 0, 0, 1, 1,
-0.6729127, -1.856982, -3.516812, 0, 0, 0, 1, 1,
-0.666077, 0.7360438, 0.8033201, 0, 0, 0, 1, 1,
-0.6654768, 0.2206756, -1.92029, 0, 0, 0, 1, 1,
-0.663543, -0.1471865, -0.5200145, 1, 1, 1, 1, 1,
-0.6594777, -0.3153216, -2.5581, 1, 1, 1, 1, 1,
-0.6584561, 1.37831, 0.3142041, 1, 1, 1, 1, 1,
-0.6583066, -1.445833, -2.100583, 1, 1, 1, 1, 1,
-0.6567659, -0.407034, -2.266205, 1, 1, 1, 1, 1,
-0.6475452, 0.420984, -2.957474, 1, 1, 1, 1, 1,
-0.643537, 1.693566, -0.4272388, 1, 1, 1, 1, 1,
-0.636067, 0.07729108, -0.9913141, 1, 1, 1, 1, 1,
-0.6332675, 0.008991992, -3.186739, 1, 1, 1, 1, 1,
-0.6321188, 0.6556894, 0.9468421, 1, 1, 1, 1, 1,
-0.6244169, -0.6104195, -1.739334, 1, 1, 1, 1, 1,
-0.6221538, -0.9204769, -2.137649, 1, 1, 1, 1, 1,
-0.6182416, 0.06722605, 1.460442, 1, 1, 1, 1, 1,
-0.6150673, 0.8086047, 0.2180658, 1, 1, 1, 1, 1,
-0.6104457, -1.679603, -3.267625, 1, 1, 1, 1, 1,
-0.6084255, -0.2715747, -4.469544, 0, 0, 1, 1, 1,
-0.6081995, 0.1773792, -1.083935, 1, 0, 0, 1, 1,
-0.6056612, 1.061326, -2.032825, 1, 0, 0, 1, 1,
-0.6045412, -1.004572, -2.971697, 1, 0, 0, 1, 1,
-0.6040232, 0.9187477, 0.9154936, 1, 0, 0, 1, 1,
-0.5992142, -0.8786781, -3.231472, 1, 0, 0, 1, 1,
-0.5962657, -0.988282, -1.002076, 0, 0, 0, 1, 1,
-0.5920712, -0.01498502, -1.523068, 0, 0, 0, 1, 1,
-0.5915308, -0.2227339, -2.325485, 0, 0, 0, 1, 1,
-0.5845058, 1.343505, -0.9461736, 0, 0, 0, 1, 1,
-0.5838656, 1.106468, -0.2301067, 0, 0, 0, 1, 1,
-0.5702856, -1.024158, -3.130592, 0, 0, 0, 1, 1,
-0.5675064, -0.228286, -1.405972, 0, 0, 0, 1, 1,
-0.566867, 0.8872762, 1.486837, 1, 1, 1, 1, 1,
-0.560275, -0.7583029, -2.949808, 1, 1, 1, 1, 1,
-0.5591781, 1.175818, -1.636879, 1, 1, 1, 1, 1,
-0.5564202, 0.6912446, 0.006841725, 1, 1, 1, 1, 1,
-0.5538139, 0.5181807, -0.4949874, 1, 1, 1, 1, 1,
-0.5529497, 0.3925385, -2.718919, 1, 1, 1, 1, 1,
-0.5521351, -0.4951259, -3.221539, 1, 1, 1, 1, 1,
-0.5515897, -0.2871612, -1.680389, 1, 1, 1, 1, 1,
-0.5428879, -1.610111, -1.394002, 1, 1, 1, 1, 1,
-0.5392127, -0.1921113, -2.427078, 1, 1, 1, 1, 1,
-0.5324545, -0.6864144, -0.7853981, 1, 1, 1, 1, 1,
-0.5323984, -0.2009203, -1.118669, 1, 1, 1, 1, 1,
-0.528192, -1.044704, -1.686282, 1, 1, 1, 1, 1,
-0.5242379, -1.631277, -2.355215, 1, 1, 1, 1, 1,
-0.5214051, 0.2111195, -1.049673, 1, 1, 1, 1, 1,
-0.5186283, 0.06395397, -0.3990568, 0, 0, 1, 1, 1,
-0.5173329, 0.965871, 0.5181953, 1, 0, 0, 1, 1,
-0.5161703, -0.7694554, -2.623008, 1, 0, 0, 1, 1,
-0.5147175, 0.1000575, -0.7651247, 1, 0, 0, 1, 1,
-0.5141826, -0.5985552, -0.6185448, 1, 0, 0, 1, 1,
-0.5083334, 0.3245523, -0.008840119, 1, 0, 0, 1, 1,
-0.5063455, -2.52414, -3.240214, 0, 0, 0, 1, 1,
-0.5055806, -1.467288, -3.517472, 0, 0, 0, 1, 1,
-0.5043806, 2.40599, -1.653586, 0, 0, 0, 1, 1,
-0.5039995, 1.100775, -0.1051942, 0, 0, 0, 1, 1,
-0.5038356, -0.2688034, -1.768462, 0, 0, 0, 1, 1,
-0.5010426, -0.03721943, 0.1732419, 0, 0, 0, 1, 1,
-0.5003008, 0.2601489, 0.6191769, 0, 0, 0, 1, 1,
-0.4964149, -0.3183727, -1.667205, 1, 1, 1, 1, 1,
-0.4891086, -1.373589, -3.957365, 1, 1, 1, 1, 1,
-0.4858006, -1.079632, -3.119581, 1, 1, 1, 1, 1,
-0.485364, -0.3508479, -2.52883, 1, 1, 1, 1, 1,
-0.4833535, 1.599315, 0.2279546, 1, 1, 1, 1, 1,
-0.4810613, -0.8889987, -2.763767, 1, 1, 1, 1, 1,
-0.4766248, 1.706709, 0.5419108, 1, 1, 1, 1, 1,
-0.4721331, -2.307556, -2.979403, 1, 1, 1, 1, 1,
-0.4705274, 0.1213761, -2.272101, 1, 1, 1, 1, 1,
-0.4664003, 0.4989895, -1.533954, 1, 1, 1, 1, 1,
-0.4579001, 1.034061, 0.8029025, 1, 1, 1, 1, 1,
-0.45709, -0.3235249, -1.748594, 1, 1, 1, 1, 1,
-0.4539802, -1.287907, -2.599124, 1, 1, 1, 1, 1,
-0.45283, -2.175823, -2.558549, 1, 1, 1, 1, 1,
-0.4482639, -1.418192, -2.34722, 1, 1, 1, 1, 1,
-0.4475621, -0.1112415, -0.5575264, 0, 0, 1, 1, 1,
-0.4401186, -0.649096, -5.133287, 1, 0, 0, 1, 1,
-0.4373952, -1.030079, -2.778544, 1, 0, 0, 1, 1,
-0.4325012, 0.5758622, 0.1413561, 1, 0, 0, 1, 1,
-0.4308538, -0.3883806, -2.231873, 1, 0, 0, 1, 1,
-0.4262582, -0.3918344, -1.926571, 1, 0, 0, 1, 1,
-0.4257883, 0.0304912, -3.166576, 0, 0, 0, 1, 1,
-0.4257811, 0.464947, 0.04564547, 0, 0, 0, 1, 1,
-0.4208041, 1.02616, -0.4773369, 0, 0, 0, 1, 1,
-0.4194731, 0.6975685, -1.782577, 0, 0, 0, 1, 1,
-0.4161987, -0.6442507, -1.84934, 0, 0, 0, 1, 1,
-0.414049, -0.3029107, -3.516182, 0, 0, 0, 1, 1,
-0.4123336, -1.654617, -3.178184, 0, 0, 0, 1, 1,
-0.4122204, -1.153756, -1.890832, 1, 1, 1, 1, 1,
-0.4080095, 0.6651813, -1.337936, 1, 1, 1, 1, 1,
-0.4060623, -1.973921, -1.718251, 1, 1, 1, 1, 1,
-0.4036503, -1.414707, -3.061877, 1, 1, 1, 1, 1,
-0.3916586, -0.7965302, -4.69024, 1, 1, 1, 1, 1,
-0.3911993, 0.3382451, -0.2801452, 1, 1, 1, 1, 1,
-0.3891429, 0.7787501, 1.434259, 1, 1, 1, 1, 1,
-0.385036, -0.9251641, -2.630534, 1, 1, 1, 1, 1,
-0.3837039, -0.4382421, -0.9984888, 1, 1, 1, 1, 1,
-0.3816433, 0.334238, 0.1056978, 1, 1, 1, 1, 1,
-0.3706439, 1.016939, 0.3358041, 1, 1, 1, 1, 1,
-0.3648224, -1.099907, -2.644166, 1, 1, 1, 1, 1,
-0.3641453, -0.6572784, -2.893308, 1, 1, 1, 1, 1,
-0.3473875, 0.7869363, -0.03713495, 1, 1, 1, 1, 1,
-0.3445823, 0.2185851, -0.7590706, 1, 1, 1, 1, 1,
-0.3416625, -1.56844, -4.356899, 0, 0, 1, 1, 1,
-0.3345938, 0.7353097, 0.6755874, 1, 0, 0, 1, 1,
-0.3340579, 0.96414, -0.6940747, 1, 0, 0, 1, 1,
-0.3326044, 0.8576094, -0.1955921, 1, 0, 0, 1, 1,
-0.3322015, -0.007469583, -3.019609, 1, 0, 0, 1, 1,
-0.325907, 0.5708078, -0.6063371, 1, 0, 0, 1, 1,
-0.3211542, -0.233422, -1.85584, 0, 0, 0, 1, 1,
-0.3204757, -1.476832, -2.418373, 0, 0, 0, 1, 1,
-0.3196448, 0.9518574, -0.2024029, 0, 0, 0, 1, 1,
-0.3193333, 2.957474, 1.291424, 0, 0, 0, 1, 1,
-0.3192904, -0.8726856, -1.001799, 0, 0, 0, 1, 1,
-0.3121168, -0.463754, -4.024599, 0, 0, 0, 1, 1,
-0.3106377, -0.5793405, -2.248982, 0, 0, 0, 1, 1,
-0.3102962, -1.190011, -1.681257, 1, 1, 1, 1, 1,
-0.3091495, 0.517893, -1.668484, 1, 1, 1, 1, 1,
-0.3090969, -0.3296027, -2.712411, 1, 1, 1, 1, 1,
-0.3083326, -0.34532, -1.529226, 1, 1, 1, 1, 1,
-0.307882, 1.37323, 0.3106193, 1, 1, 1, 1, 1,
-0.3056546, 1.137693, -0.3321698, 1, 1, 1, 1, 1,
-0.3022865, 1.737955, 0.9068976, 1, 1, 1, 1, 1,
-0.301506, 0.2419961, -3.043443, 1, 1, 1, 1, 1,
-0.3010069, -0.4139454, -2.067045, 1, 1, 1, 1, 1,
-0.3000476, 1.184014, -0.3524337, 1, 1, 1, 1, 1,
-0.2979833, 1.16137, 0.7885441, 1, 1, 1, 1, 1,
-0.2977737, -0.9284346, -2.404565, 1, 1, 1, 1, 1,
-0.2975236, -0.3717621, -2.494051, 1, 1, 1, 1, 1,
-0.296831, -1.06019, -3.375309, 1, 1, 1, 1, 1,
-0.2944097, -0.2713453, -1.96381, 1, 1, 1, 1, 1,
-0.2932648, 0.1227112, -1.238684, 0, 0, 1, 1, 1,
-0.2856471, 1.117639, 0.5034639, 1, 0, 0, 1, 1,
-0.2838309, 0.4083573, -1.754416, 1, 0, 0, 1, 1,
-0.2819508, 1.592192, 0.7003574, 1, 0, 0, 1, 1,
-0.2806482, 0.1221386, -2.900178, 1, 0, 0, 1, 1,
-0.2786441, 1.685155, 0.5921333, 1, 0, 0, 1, 1,
-0.2769714, 0.2497747, -2.317915, 0, 0, 0, 1, 1,
-0.2700169, -0.2108154, -0.1852815, 0, 0, 0, 1, 1,
-0.26607, -0.485174, -3.795384, 0, 0, 0, 1, 1,
-0.2606469, 1.045792, -0.6850162, 0, 0, 0, 1, 1,
-0.2563317, 0.4610375, -0.468966, 0, 0, 0, 1, 1,
-0.255298, -0.5310449, -2.422836, 0, 0, 0, 1, 1,
-0.2495803, -0.8841521, -2.799009, 0, 0, 0, 1, 1,
-0.2465413, -0.786563, -4.070692, 1, 1, 1, 1, 1,
-0.2450887, 0.05512369, -2.461789, 1, 1, 1, 1, 1,
-0.2427577, -0.1114212, -3.816639, 1, 1, 1, 1, 1,
-0.2421192, 0.5755791, 0.1043984, 1, 1, 1, 1, 1,
-0.2399168, 0.6371378, -0.7295234, 1, 1, 1, 1, 1,
-0.2397422, -0.7939967, -4.000466, 1, 1, 1, 1, 1,
-0.2381452, -1.294659, -3.601312, 1, 1, 1, 1, 1,
-0.2343531, 2.035437, -2.001784, 1, 1, 1, 1, 1,
-0.2288284, 0.2990668, -1.544724, 1, 1, 1, 1, 1,
-0.2228946, 0.2347789, 0.3692132, 1, 1, 1, 1, 1,
-0.2151366, -0.03762336, -2.417205, 1, 1, 1, 1, 1,
-0.2118358, -0.1963004, -1.819139, 1, 1, 1, 1, 1,
-0.2076077, -0.2634111, -3.039153, 1, 1, 1, 1, 1,
-0.2069738, -0.2438437, -1.377511, 1, 1, 1, 1, 1,
-0.2061609, 1.199776, -2.966263, 1, 1, 1, 1, 1,
-0.2040348, -2.52389, -3.514574, 0, 0, 1, 1, 1,
-0.2025499, -1.1643, -3.405742, 1, 0, 0, 1, 1,
-0.2013827, -0.4927936, -3.315952, 1, 0, 0, 1, 1,
-0.2013037, -0.261239, -2.278995, 1, 0, 0, 1, 1,
-0.2006949, 0.3575931, -0.6596118, 1, 0, 0, 1, 1,
-0.1997361, -0.04856747, -0.5491567, 1, 0, 0, 1, 1,
-0.1992453, -0.472866, -3.149879, 0, 0, 0, 1, 1,
-0.1967777, 1.811956, 0.08026596, 0, 0, 0, 1, 1,
-0.1949657, 1.346973, -1.475385, 0, 0, 0, 1, 1,
-0.1843636, 2.10409, 0.3130742, 0, 0, 0, 1, 1,
-0.1838958, 0.2387364, -0.04798423, 0, 0, 0, 1, 1,
-0.1799595, -1.106953, -2.128856, 0, 0, 0, 1, 1,
-0.1777271, -0.3253201, -2.895795, 0, 0, 0, 1, 1,
-0.1687434, -2.259773, -1.028171, 1, 1, 1, 1, 1,
-0.1684528, -1.205607, -2.735288, 1, 1, 1, 1, 1,
-0.1666415, -1.050378, -3.624002, 1, 1, 1, 1, 1,
-0.1656706, -0.293131, -2.343977, 1, 1, 1, 1, 1,
-0.1593668, -1.303466, -3.480247, 1, 1, 1, 1, 1,
-0.152968, -0.3671812, -1.533605, 1, 1, 1, 1, 1,
-0.1529266, -0.2046833, -2.086637, 1, 1, 1, 1, 1,
-0.1528764, -1.470305, -3.194275, 1, 1, 1, 1, 1,
-0.1519686, 0.2608075, -0.3786988, 1, 1, 1, 1, 1,
-0.1449018, -0.5041164, -3.254849, 1, 1, 1, 1, 1,
-0.1380847, 0.5708304, 0.5022869, 1, 1, 1, 1, 1,
-0.1372294, 0.4947159, -0.1770872, 1, 1, 1, 1, 1,
-0.1366526, 0.326092, -0.1340725, 1, 1, 1, 1, 1,
-0.1357519, 0.9251411, 1.404887, 1, 1, 1, 1, 1,
-0.1303279, -0.6599668, -2.894187, 1, 1, 1, 1, 1,
-0.1301935, -1.522712, -2.532912, 0, 0, 1, 1, 1,
-0.1289972, -0.3911227, -3.221465, 1, 0, 0, 1, 1,
-0.1266485, 0.07322009, -1.52532, 1, 0, 0, 1, 1,
-0.1242125, 0.3034694, -0.7159981, 1, 0, 0, 1, 1,
-0.1203632, 0.08346751, -1.615174, 1, 0, 0, 1, 1,
-0.1184154, 0.6166007, -1.58106, 1, 0, 0, 1, 1,
-0.1172804, 0.562857, -1.028264, 0, 0, 0, 1, 1,
-0.1113196, -1.606609, -4.667407, 0, 0, 0, 1, 1,
-0.1106711, -0.6048477, -3.11912, 0, 0, 0, 1, 1,
-0.1045081, 2.352847, -1.7145, 0, 0, 0, 1, 1,
-0.1006169, 0.7236962, 0.1652352, 0, 0, 0, 1, 1,
-0.0993458, -0.8953963, -1.487535, 0, 0, 0, 1, 1,
-0.09771835, 2.143287, 1.292312, 0, 0, 0, 1, 1,
-0.09728803, 1.401311, -0.2088174, 1, 1, 1, 1, 1,
-0.09403241, -2.211083, -1.755326, 1, 1, 1, 1, 1,
-0.09204082, 1.400356, 0.5265911, 1, 1, 1, 1, 1,
-0.09069568, 0.9389893, -0.5397948, 1, 1, 1, 1, 1,
-0.09012854, 1.071872, -1.307889, 1, 1, 1, 1, 1,
-0.08879985, 0.9186472, 0.7407632, 1, 1, 1, 1, 1,
-0.08739454, -0.832254, -4.341093, 1, 1, 1, 1, 1,
-0.0854409, -0.1433889, -4.540962, 1, 1, 1, 1, 1,
-0.08472037, -1.795013, -3.215599, 1, 1, 1, 1, 1,
-0.08032145, -1.185491, -3.952868, 1, 1, 1, 1, 1,
-0.07697104, 1.02411, -1.801877, 1, 1, 1, 1, 1,
-0.06727525, -0.4664956, 0.07787994, 1, 1, 1, 1, 1,
-0.06161616, -1.756154, -3.429253, 1, 1, 1, 1, 1,
-0.06142037, -1.288837, -4.348763, 1, 1, 1, 1, 1,
-0.0604601, -0.2047247, -5.236516, 1, 1, 1, 1, 1,
-0.05853288, -1.423248, -4.791978, 0, 0, 1, 1, 1,
-0.05302319, -1.918896, -1.628595, 1, 0, 0, 1, 1,
-0.05095828, 0.6735075, -0.7650178, 1, 0, 0, 1, 1,
-0.04817499, 0.8950431, 1.214803, 1, 0, 0, 1, 1,
-0.04209426, -1.216866, -3.580689, 1, 0, 0, 1, 1,
-0.04199604, -0.5124726, -3.569409, 1, 0, 0, 1, 1,
-0.03892249, -0.09385425, -4.082972, 0, 0, 0, 1, 1,
-0.03872452, -0.2019315, -4.191228, 0, 0, 0, 1, 1,
-0.03698816, 1.397161, -1.867896, 0, 0, 0, 1, 1,
-0.03570801, 0.2666394, -1.623202, 0, 0, 0, 1, 1,
-0.0351106, 0.6244681, -1.635913, 0, 0, 0, 1, 1,
-0.03282595, -0.2643954, -4.050233, 0, 0, 0, 1, 1,
-0.03279278, -0.5841073, -4.283968, 0, 0, 0, 1, 1,
-0.03069276, 0.2033585, 1.30549, 1, 1, 1, 1, 1,
-0.0296102, 0.5365905, -0.3132004, 1, 1, 1, 1, 1,
-0.02795143, -1.965261, -4.060787, 1, 1, 1, 1, 1,
-0.02306641, -1.066095, -0.8326008, 1, 1, 1, 1, 1,
-0.02270427, -0.4422093, -3.356631, 1, 1, 1, 1, 1,
-0.02161483, -0.2863544, -2.871001, 1, 1, 1, 1, 1,
-0.02140092, -0.171397, -3.155365, 1, 1, 1, 1, 1,
-0.02139915, -0.5730558, -2.899268, 1, 1, 1, 1, 1,
-0.0197409, 1.405017, -0.4896435, 1, 1, 1, 1, 1,
-0.01875378, -1.508114, -3.888704, 1, 1, 1, 1, 1,
-0.01812767, 1.302292, -0.3625518, 1, 1, 1, 1, 1,
-0.01798786, 0.6029204, -0.626241, 1, 1, 1, 1, 1,
-0.01614659, 0.8662106, -0.6264831, 1, 1, 1, 1, 1,
-0.01383933, -1.348561, -2.797459, 1, 1, 1, 1, 1,
-0.01185679, 0.6443068, -0.07897979, 1, 1, 1, 1, 1,
-0.01098543, -0.8155807, -3.266354, 0, 0, 1, 1, 1,
-0.009380132, 1.295758, 1.056153, 1, 0, 0, 1, 1,
-0.008281137, 0.9207012, -0.5710945, 1, 0, 0, 1, 1,
-0.007985771, -1.028352, -4.305169, 1, 0, 0, 1, 1,
0.0005046741, 1.207193, -0.4720541, 1, 0, 0, 1, 1,
0.006822824, -1.055841, 1.874143, 1, 0, 0, 1, 1,
0.01039433, 0.1351958, -0.03844171, 0, 0, 0, 1, 1,
0.01058534, -0.3701529, 3.682994, 0, 0, 0, 1, 1,
0.01130897, 1.928802, 1.785472, 0, 0, 0, 1, 1,
0.01350936, 0.6243907, 0.5697274, 0, 0, 0, 1, 1,
0.01486391, -2.253585, 2.83755, 0, 0, 0, 1, 1,
0.0154425, -0.5482678, 2.796949, 0, 0, 0, 1, 1,
0.01659694, 0.2500888, -0.8191991, 0, 0, 0, 1, 1,
0.01728215, 1.271496, -1.696672, 1, 1, 1, 1, 1,
0.02285078, -0.1220054, 3.091655, 1, 1, 1, 1, 1,
0.02461789, 0.3331368, 0.5656402, 1, 1, 1, 1, 1,
0.02802995, -1.009424, 3.447245, 1, 1, 1, 1, 1,
0.028267, -0.9831812, 2.793865, 1, 1, 1, 1, 1,
0.03119014, -0.3280613, 1.570281, 1, 1, 1, 1, 1,
0.03821266, -1.167926, 4.08063, 1, 1, 1, 1, 1,
0.03873375, -1.04529, 1.763028, 1, 1, 1, 1, 1,
0.04584087, 0.4125901, -0.1115773, 1, 1, 1, 1, 1,
0.04916426, 0.3031555, -0.891257, 1, 1, 1, 1, 1,
0.05254056, 0.07107949, 0.153417, 1, 1, 1, 1, 1,
0.053793, -0.003099096, 3.009659, 1, 1, 1, 1, 1,
0.05403597, -0.06162002, 4.998128, 1, 1, 1, 1, 1,
0.05629338, 0.02112609, 2.76397, 1, 1, 1, 1, 1,
0.06112052, 0.1843706, 0.3530268, 1, 1, 1, 1, 1,
0.06190583, 0.2376515, -1.0793, 0, 0, 1, 1, 1,
0.0630956, 0.502849, 0.2061927, 1, 0, 0, 1, 1,
0.06320316, 0.1544553, 0.8880621, 1, 0, 0, 1, 1,
0.06356802, -0.4116337, 3.063019, 1, 0, 0, 1, 1,
0.0675119, 0.7758881, 0.7598648, 1, 0, 0, 1, 1,
0.06990439, 0.3799067, -0.1772639, 1, 0, 0, 1, 1,
0.07238915, -0.4789829, 3.426721, 0, 0, 0, 1, 1,
0.07613923, 2.021112, 1.804, 0, 0, 0, 1, 1,
0.07999276, 0.323502, 1.532503, 0, 0, 0, 1, 1,
0.08404059, -0.6906062, 3.858282, 0, 0, 0, 1, 1,
0.08573232, -2.440518, 3.684562, 0, 0, 0, 1, 1,
0.08690736, 0.3512606, 1.505994, 0, 0, 0, 1, 1,
0.08896899, -1.306669, 3.790036, 0, 0, 0, 1, 1,
0.09114819, -0.837859, 3.560191, 1, 1, 1, 1, 1,
0.0955236, -0.3235244, 5.1057, 1, 1, 1, 1, 1,
0.09740166, -0.3380417, 3.73255, 1, 1, 1, 1, 1,
0.09892208, 0.6013883, 1.122504, 1, 1, 1, 1, 1,
0.1027729, 0.4448577, -0.5697549, 1, 1, 1, 1, 1,
0.1039523, -1.205466, 2.69491, 1, 1, 1, 1, 1,
0.116622, -0.8115622, 1.233568, 1, 1, 1, 1, 1,
0.1232973, 0.9143462, 1.957803, 1, 1, 1, 1, 1,
0.1248866, -0.6203403, 3.337493, 1, 1, 1, 1, 1,
0.1278248, 0.2307174, 0.06953355, 1, 1, 1, 1, 1,
0.1318727, -0.6558492, 1.022676, 1, 1, 1, 1, 1,
0.1322297, -1.575163, 3.165095, 1, 1, 1, 1, 1,
0.1339962, 0.8443234, 0.5724485, 1, 1, 1, 1, 1,
0.1359757, 1.680745, 0.05536196, 1, 1, 1, 1, 1,
0.1361604, 0.6617993, -0.1699889, 1, 1, 1, 1, 1,
0.1366836, -0.5187172, 2.755973, 0, 0, 1, 1, 1,
0.1370125, 0.6749097, 0.9589393, 1, 0, 0, 1, 1,
0.1421203, -0.4301008, 2.649288, 1, 0, 0, 1, 1,
0.1434516, 0.4172624, 1.369699, 1, 0, 0, 1, 1,
0.1435661, -0.1135044, 0.8152521, 1, 0, 0, 1, 1,
0.1462081, -1.432376, 3.363376, 1, 0, 0, 1, 1,
0.1468056, 0.7855339, 1.55349, 0, 0, 0, 1, 1,
0.1473436, 2.132986, 0.6972916, 0, 0, 0, 1, 1,
0.1492039, -0.1457111, 3.144753, 0, 0, 0, 1, 1,
0.1500681, -1.582862, 3.033036, 0, 0, 0, 1, 1,
0.1537594, -1.252466, 3.212032, 0, 0, 0, 1, 1,
0.1549357, -0.4115296, 2.543568, 0, 0, 0, 1, 1,
0.1559346, -0.2231783, 2.139167, 0, 0, 0, 1, 1,
0.1589219, 0.3126213, 1.232839, 1, 1, 1, 1, 1,
0.1589343, -0.05766284, 1.411436, 1, 1, 1, 1, 1,
0.160397, 0.9539655, 0.3322288, 1, 1, 1, 1, 1,
0.163582, 0.2289012, 0.3098577, 1, 1, 1, 1, 1,
0.1642976, 0.7992015, 0.06931336, 1, 1, 1, 1, 1,
0.167378, -0.9522244, 3.783156, 1, 1, 1, 1, 1,
0.1678545, -0.3612093, 2.925745, 1, 1, 1, 1, 1,
0.1688721, 0.03686201, 1.790617, 1, 1, 1, 1, 1,
0.1745101, 0.5120938, 1.623829, 1, 1, 1, 1, 1,
0.1763982, -0.4278799, 3.019188, 1, 1, 1, 1, 1,
0.1772018, 0.7990417, 0.04581437, 1, 1, 1, 1, 1,
0.1788482, -1.589863, 2.916058, 1, 1, 1, 1, 1,
0.1800178, 0.5539049, 0.4800485, 1, 1, 1, 1, 1,
0.1859061, -1.46393, 3.593438, 1, 1, 1, 1, 1,
0.1901447, -0.06348988, 3.153982, 1, 1, 1, 1, 1,
0.1915615, 1.192399, -0.02876046, 0, 0, 1, 1, 1,
0.1974343, 0.02855082, 3.085871, 1, 0, 0, 1, 1,
0.1975066, 2.3678, -1.257382, 1, 0, 0, 1, 1,
0.1979842, 0.4762881, 1.615357, 1, 0, 0, 1, 1,
0.1998044, 1.065472, -0.5766762, 1, 0, 0, 1, 1,
0.1998304, -1.506076, 3.676017, 1, 0, 0, 1, 1,
0.202876, 0.8948133, 0.7998649, 0, 0, 0, 1, 1,
0.2045649, 0.1778557, 0.6340095, 0, 0, 0, 1, 1,
0.2057396, -1.575962, 3.376652, 0, 0, 0, 1, 1,
0.2083959, -0.8697861, 3.635696, 0, 0, 0, 1, 1,
0.2114225, -1.151094, 0.8193831, 0, 0, 0, 1, 1,
0.2171573, -1.550308, 1.538806, 0, 0, 0, 1, 1,
0.2178634, 0.6997663, 1.136329, 0, 0, 0, 1, 1,
0.2198029, -0.808588, 2.370698, 1, 1, 1, 1, 1,
0.2220807, 0.9036993, -1.135751, 1, 1, 1, 1, 1,
0.2231334, -0.1040873, 2.254882, 1, 1, 1, 1, 1,
0.2245051, -1.60957, 3.535036, 1, 1, 1, 1, 1,
0.2325358, 0.9535626, -1.475734, 1, 1, 1, 1, 1,
0.2326754, -0.3040851, 1.442112, 1, 1, 1, 1, 1,
0.2338988, 1.571595, -0.08305369, 1, 1, 1, 1, 1,
0.2357217, -0.5144511, 2.257933, 1, 1, 1, 1, 1,
0.2371606, 0.8698009, 0.982652, 1, 1, 1, 1, 1,
0.2371968, -0.02939637, 2.101402, 1, 1, 1, 1, 1,
0.2384494, -0.02258863, 1.810128, 1, 1, 1, 1, 1,
0.2440577, 1.863228, -1.162343, 1, 1, 1, 1, 1,
0.246578, -1.166565, 2.517544, 1, 1, 1, 1, 1,
0.2466794, -0.5894835, 2.221906, 1, 1, 1, 1, 1,
0.2480738, 0.4836636, -0.1925664, 1, 1, 1, 1, 1,
0.2489956, -0.5123454, 2.756917, 0, 0, 1, 1, 1,
0.2508735, -0.4019804, 2.223075, 1, 0, 0, 1, 1,
0.2520223, 0.3801098, -0.01199724, 1, 0, 0, 1, 1,
0.2590066, -0.5997801, 3.508072, 1, 0, 0, 1, 1,
0.2631313, -2.14899, 2.185646, 1, 0, 0, 1, 1,
0.2683263, -0.870831, 3.416504, 1, 0, 0, 1, 1,
0.273413, -0.9025714, 1.936093, 0, 0, 0, 1, 1,
0.2739831, -0.9834038, 1.663683, 0, 0, 0, 1, 1,
0.2748982, 0.2249241, 0.2190451, 0, 0, 0, 1, 1,
0.275818, -0.8726705, 2.493234, 0, 0, 0, 1, 1,
0.2766447, 0.3965545, 1.873538, 0, 0, 0, 1, 1,
0.2844625, -0.2270443, 2.861233, 0, 0, 0, 1, 1,
0.2852537, 0.8458037, 1.121945, 0, 0, 0, 1, 1,
0.2865091, 1.915956, -0.4589171, 1, 1, 1, 1, 1,
0.2873265, -0.7547786, 2.297178, 1, 1, 1, 1, 1,
0.2887681, -0.004458536, 0.8683774, 1, 1, 1, 1, 1,
0.2909615, -0.27929, 2.101088, 1, 1, 1, 1, 1,
0.2929464, 0.3517431, -0.1395391, 1, 1, 1, 1, 1,
0.2937125, -0.7804316, 1.332592, 1, 1, 1, 1, 1,
0.3034472, 0.8846639, 1.288016, 1, 1, 1, 1, 1,
0.3121214, -0.1489421, 2.784201, 1, 1, 1, 1, 1,
0.3129876, 0.8030424, 0.08327413, 1, 1, 1, 1, 1,
0.313116, 0.03595491, 1.9192, 1, 1, 1, 1, 1,
0.3220231, 0.776069, 0.3697304, 1, 1, 1, 1, 1,
0.3236548, 0.1243832, 1.324132, 1, 1, 1, 1, 1,
0.3298274, -0.0633949, 1.738314, 1, 1, 1, 1, 1,
0.331081, -0.3520218, 1.985527, 1, 1, 1, 1, 1,
0.3319086, 1.490246, -0.2812841, 1, 1, 1, 1, 1,
0.3358738, -0.814755, 3.018548, 0, 0, 1, 1, 1,
0.3400103, 0.2941498, 0.7131546, 1, 0, 0, 1, 1,
0.340734, 0.1092431, 1.69948, 1, 0, 0, 1, 1,
0.341194, 0.6429425, -1.588596, 1, 0, 0, 1, 1,
0.3437099, 1.747458, -0.8945107, 1, 0, 0, 1, 1,
0.343949, -0.1492622, 2.452368, 1, 0, 0, 1, 1,
0.3441372, -0.3635699, 1.807519, 0, 0, 0, 1, 1,
0.3474509, -1.934625, 2.281077, 0, 0, 0, 1, 1,
0.3477198, 1.542778, 0.2589146, 0, 0, 0, 1, 1,
0.3524392, 0.6441233, -1.354828, 0, 0, 0, 1, 1,
0.3524557, 1.251309, -0.9719568, 0, 0, 0, 1, 1,
0.3534253, -0.2620256, 0.9160085, 0, 0, 0, 1, 1,
0.354411, -1.092407, 2.621274, 0, 0, 0, 1, 1,
0.3548907, -0.2038612, 0.765805, 1, 1, 1, 1, 1,
0.3571139, -0.8568115, 3.153343, 1, 1, 1, 1, 1,
0.3573249, -0.5212317, 3.453127, 1, 1, 1, 1, 1,
0.359571, 0.2694272, -0.4480335, 1, 1, 1, 1, 1,
0.3596967, 1.418267, 0.8558365, 1, 1, 1, 1, 1,
0.3673792, 0.02237488, -0.2272647, 1, 1, 1, 1, 1,
0.3688168, -0.2421021, 3.008553, 1, 1, 1, 1, 1,
0.3701132, 1.298707, 1.760954, 1, 1, 1, 1, 1,
0.37132, 0.687147, 1.262977, 1, 1, 1, 1, 1,
0.3755979, -0.2870457, 0.9993293, 1, 1, 1, 1, 1,
0.3797267, -0.7094871, 1.693571, 1, 1, 1, 1, 1,
0.3837992, -0.2279671, 3.296747, 1, 1, 1, 1, 1,
0.387217, 0.6484501, -0.1063554, 1, 1, 1, 1, 1,
0.3875102, 0.6543415, -0.07604588, 1, 1, 1, 1, 1,
0.3902489, 0.769263, -0.01978402, 1, 1, 1, 1, 1,
0.391043, -0.3256158, 1.312571, 0, 0, 1, 1, 1,
0.3918056, -0.8263178, 3.78384, 1, 0, 0, 1, 1,
0.3927334, 0.5425466, 1.163542, 1, 0, 0, 1, 1,
0.3944961, 0.9235775, -0.309975, 1, 0, 0, 1, 1,
0.3958119, 0.3204701, 0.1977754, 1, 0, 0, 1, 1,
0.3968672, -0.6076488, 2.864925, 1, 0, 0, 1, 1,
0.3995966, -0.5656883, 2.290626, 0, 0, 0, 1, 1,
0.4042946, 0.6592158, -0.5756475, 0, 0, 0, 1, 1,
0.4096121, 1.595874, 0.3096922, 0, 0, 0, 1, 1,
0.4137721, 0.002584983, 2.474298, 0, 0, 0, 1, 1,
0.4147238, -1.094004, 2.358157, 0, 0, 0, 1, 1,
0.4175702, 0.9655457, 0.5997656, 0, 0, 0, 1, 1,
0.4211421, 0.6618258, -0.4856756, 0, 0, 0, 1, 1,
0.4219457, -0.5876385, 1.335249, 1, 1, 1, 1, 1,
0.4225491, -1.193099, 2.909971, 1, 1, 1, 1, 1,
0.4264103, 2.572161, 0.2926196, 1, 1, 1, 1, 1,
0.4289424, -1.395647, 2.4188, 1, 1, 1, 1, 1,
0.4294159, -0.2764137, 2.996812, 1, 1, 1, 1, 1,
0.4359587, 1.832981, 0.07806015, 1, 1, 1, 1, 1,
0.4387636, 1.281881, 1.269994, 1, 1, 1, 1, 1,
0.4394732, 0.3304136, 1.348927, 1, 1, 1, 1, 1,
0.442194, -0.2873351, 3.819935, 1, 1, 1, 1, 1,
0.4441044, 0.06862546, 2.076373, 1, 1, 1, 1, 1,
0.4488442, 0.6998316, 1.711489, 1, 1, 1, 1, 1,
0.454514, 1.656541, 0.8543618, 1, 1, 1, 1, 1,
0.4572489, -2.555565, 3.436042, 1, 1, 1, 1, 1,
0.4598644, 0.6826015, 0.4656737, 1, 1, 1, 1, 1,
0.4598981, -1.341404, 2.290017, 1, 1, 1, 1, 1,
0.4702255, 0.1105324, 1.073097, 0, 0, 1, 1, 1,
0.4815347, 0.8576204, -0.5678955, 1, 0, 0, 1, 1,
0.4838747, 2.592635, 0.0916173, 1, 0, 0, 1, 1,
0.4889865, -0.07408951, 0.2305167, 1, 0, 0, 1, 1,
0.4892335, 0.07049508, 2.632449, 1, 0, 0, 1, 1,
0.4958253, 1.024836, 0.2067621, 1, 0, 0, 1, 1,
0.4991981, -0.4727795, 2.807292, 0, 0, 0, 1, 1,
0.4995202, -0.4863383, 2.069649, 0, 0, 0, 1, 1,
0.5011957, 1.108873, -1.982649, 0, 0, 0, 1, 1,
0.5026163, 0.5866181, 1.084967, 0, 0, 0, 1, 1,
0.5032738, -0.7249097, 4.601301, 0, 0, 0, 1, 1,
0.5044904, 0.9857183, 0.4211852, 0, 0, 0, 1, 1,
0.5101427, -1.059033, 2.715486, 0, 0, 0, 1, 1,
0.5106089, -1.403798, 3.008275, 1, 1, 1, 1, 1,
0.5182698, 0.7177926, 0.003870543, 1, 1, 1, 1, 1,
0.5188001, -1.566775, 4.838143, 1, 1, 1, 1, 1,
0.52044, 0.006694627, 1.930333, 1, 1, 1, 1, 1,
0.520462, -1.103117, 1.428489, 1, 1, 1, 1, 1,
0.520488, 0.8598347, -0.5272622, 1, 1, 1, 1, 1,
0.5270372, -1.00708, 2.292713, 1, 1, 1, 1, 1,
0.5274295, -0.5451207, 2.531413, 1, 1, 1, 1, 1,
0.5289062, -0.3335389, 2.820587, 1, 1, 1, 1, 1,
0.5349879, -0.08999141, 0.8511961, 1, 1, 1, 1, 1,
0.5355767, 0.1914135, 0.7875033, 1, 1, 1, 1, 1,
0.5373967, 0.7803223, 0.1855037, 1, 1, 1, 1, 1,
0.5418523, -0.1611112, 4.172193, 1, 1, 1, 1, 1,
0.5439684, 0.7524201, 0.9297604, 1, 1, 1, 1, 1,
0.5458001, -0.195156, 3.376282, 1, 1, 1, 1, 1,
0.5489581, 0.3422714, 1.440014, 0, 0, 1, 1, 1,
0.5527304, 0.03832006, 2.311642, 1, 0, 0, 1, 1,
0.5654203, 1.954355, 0.2884974, 1, 0, 0, 1, 1,
0.5706421, 0.6732875, 0.7267669, 1, 0, 0, 1, 1,
0.574164, -0.9053276, 1.746493, 1, 0, 0, 1, 1,
0.5749695, -0.6105884, 1.445482, 1, 0, 0, 1, 1,
0.5787627, -1.528315, 2.781948, 0, 0, 0, 1, 1,
0.5810401, -0.1744618, 2.409097, 0, 0, 0, 1, 1,
0.5817702, -0.367322, 2.437633, 0, 0, 0, 1, 1,
0.5823082, 0.54585, 0.8294009, 0, 0, 0, 1, 1,
0.5826998, 0.2342051, -1.438616, 0, 0, 0, 1, 1,
0.585681, 0.09109368, 1.640048, 0, 0, 0, 1, 1,
0.5885282, 0.8218336, 1.746404, 0, 0, 0, 1, 1,
0.5897984, -2.172145, 1.821685, 1, 1, 1, 1, 1,
0.5913122, 0.1758966, 1.176505, 1, 1, 1, 1, 1,
0.5913275, 0.3499527, 0.4681485, 1, 1, 1, 1, 1,
0.5925734, -0.7208577, 2.1175, 1, 1, 1, 1, 1,
0.5926926, 0.7426775, 0.743312, 1, 1, 1, 1, 1,
0.5947585, 0.03659556, 0.05836344, 1, 1, 1, 1, 1,
0.6033446, -0.8423766, 3.135539, 1, 1, 1, 1, 1,
0.6039933, -1.256536, 3.113407, 1, 1, 1, 1, 1,
0.6081434, -1.331338, 2.944738, 1, 1, 1, 1, 1,
0.6124245, 0.5475681, -0.1149824, 1, 1, 1, 1, 1,
0.6145495, 0.5164875, 0.3513056, 1, 1, 1, 1, 1,
0.6152707, 0.1105608, 2.679555, 1, 1, 1, 1, 1,
0.6160378, 0.4266034, 0.1574034, 1, 1, 1, 1, 1,
0.6160874, -0.2294941, 2.593646, 1, 1, 1, 1, 1,
0.6185373, -0.8588693, 1.956288, 1, 1, 1, 1, 1,
0.6205068, -0.5135867, 0.2764093, 0, 0, 1, 1, 1,
0.6208059, 1.341678, -1.700134, 1, 0, 0, 1, 1,
0.6277843, 0.7347687, -1.127902, 1, 0, 0, 1, 1,
0.6307998, 1.017754, 1.1332, 1, 0, 0, 1, 1,
0.6380845, 0.08432405, 0.6576121, 1, 0, 0, 1, 1,
0.6401409, -1.760733, 2.225309, 1, 0, 0, 1, 1,
0.6407462, -0.966902, 1.810224, 0, 0, 0, 1, 1,
0.6427634, -0.5427596, 3.671847, 0, 0, 0, 1, 1,
0.6445906, -0.3778136, 2.300045, 0, 0, 0, 1, 1,
0.6446262, -1.312484, 2.225877, 0, 0, 0, 1, 1,
0.645722, -0.4379739, 2.148079, 0, 0, 0, 1, 1,
0.6463767, 1.084676, -0.7485346, 0, 0, 0, 1, 1,
0.646681, 0.3728219, 0.637782, 0, 0, 0, 1, 1,
0.6500719, 2.563, -0.445698, 1, 1, 1, 1, 1,
0.6718792, 0.4585799, 1.491614, 1, 1, 1, 1, 1,
0.6738013, -1.401781, 1.264899, 1, 1, 1, 1, 1,
0.6742311, 2.018944, 1.152605, 1, 1, 1, 1, 1,
0.6742638, -1.113974, 4.221825, 1, 1, 1, 1, 1,
0.675079, 1.377772, 1.500744, 1, 1, 1, 1, 1,
0.6823015, -0.1992565, 0.4437886, 1, 1, 1, 1, 1,
0.6890794, -0.172569, 1.02242, 1, 1, 1, 1, 1,
0.6919987, -0.6339716, 0.7299885, 1, 1, 1, 1, 1,
0.6968928, -0.1833472, 2.971008, 1, 1, 1, 1, 1,
0.7000672, -0.5676156, 2.867898, 1, 1, 1, 1, 1,
0.7010583, -0.01472725, 1.863004, 1, 1, 1, 1, 1,
0.7100286, -1.04756, 0.9768002, 1, 1, 1, 1, 1,
0.7140247, -0.04832599, -0.07129242, 1, 1, 1, 1, 1,
0.7180889, 0.2815033, 2.243605, 1, 1, 1, 1, 1,
0.7269734, 0.7482712, 1.063032, 0, 0, 1, 1, 1,
0.7292368, 1.01905, 3.359096, 1, 0, 0, 1, 1,
0.7300043, -1.106663, 1.772919, 1, 0, 0, 1, 1,
0.7301211, 0.3202227, 0.6232538, 1, 0, 0, 1, 1,
0.7307474, 0.1234485, 0.1758011, 1, 0, 0, 1, 1,
0.7376934, 0.9446106, -1.327758, 1, 0, 0, 1, 1,
0.7385684, 1.330491, 0.8379755, 0, 0, 0, 1, 1,
0.7410755, 0.4371141, 1.620844, 0, 0, 0, 1, 1,
0.7413922, 0.2586735, 2.725247, 0, 0, 0, 1, 1,
0.741486, 0.09093183, 0.8021525, 0, 0, 0, 1, 1,
0.747223, -2.753762, 2.651035, 0, 0, 0, 1, 1,
0.7491369, -0.07684109, 3.300673, 0, 0, 0, 1, 1,
0.7695965, 0.5823271, 2.256095, 0, 0, 0, 1, 1,
0.7782217, -0.7104762, 3.519078, 1, 1, 1, 1, 1,
0.7808145, -0.52633, 2.118369, 1, 1, 1, 1, 1,
0.7882303, 0.9357135, -0.301641, 1, 1, 1, 1, 1,
0.7961124, 0.4591538, 1.34806, 1, 1, 1, 1, 1,
0.7974483, 0.1744924, 2.025707, 1, 1, 1, 1, 1,
0.801092, 1.212738, -1.196177, 1, 1, 1, 1, 1,
0.8011822, 0.7358878, 1.881938, 1, 1, 1, 1, 1,
0.8051949, -1.505807, 2.719, 1, 1, 1, 1, 1,
0.8073717, 1.432018, 1.727373, 1, 1, 1, 1, 1,
0.8074473, -0.8210225, 2.047447, 1, 1, 1, 1, 1,
0.8081688, 0.07544558, 1.13007, 1, 1, 1, 1, 1,
0.8091562, 0.8331543, -0.7033948, 1, 1, 1, 1, 1,
0.8096577, -0.5422348, 2.838249, 1, 1, 1, 1, 1,
0.8146617, -1.22861, 1.871176, 1, 1, 1, 1, 1,
0.8154427, -0.1988515, 1.234859, 1, 1, 1, 1, 1,
0.8166831, 0.2355234, 2.783883, 0, 0, 1, 1, 1,
0.8168183, 0.7560132, 0.1753006, 1, 0, 0, 1, 1,
0.8340691, 0.9181414, 0.6216521, 1, 0, 0, 1, 1,
0.8376579, -2.877797, 2.117182, 1, 0, 0, 1, 1,
0.838047, -0.1975236, -0.001027811, 1, 0, 0, 1, 1,
0.8413635, 0.7964758, 2.6997, 1, 0, 0, 1, 1,
0.8495431, 0.2453242, 0.2122717, 0, 0, 0, 1, 1,
0.8630967, 0.3571446, 1.064406, 0, 0, 0, 1, 1,
0.8726014, 0.7054065, 1.77802, 0, 0, 0, 1, 1,
0.8813089, -0.3835414, 2.249729, 0, 0, 0, 1, 1,
0.883307, 0.2740631, 0.5228975, 0, 0, 0, 1, 1,
0.8876837, 0.3794276, 0.851634, 0, 0, 0, 1, 1,
0.8896501, -0.183397, 2.528044, 0, 0, 0, 1, 1,
0.8914455, -1.413528, 1.907716, 1, 1, 1, 1, 1,
0.8968295, 1.171805, 0.4588521, 1, 1, 1, 1, 1,
0.9043457, -2.530173, 5.054384, 1, 1, 1, 1, 1,
0.9046391, 2.013933, 0.1267694, 1, 1, 1, 1, 1,
0.9069688, 0.7147001, 1.835364, 1, 1, 1, 1, 1,
0.9131398, -1.448194, 4.146265, 1, 1, 1, 1, 1,
0.9190695, -1.141561, 1.963319, 1, 1, 1, 1, 1,
0.9226168, -0.5692031, 1.38724, 1, 1, 1, 1, 1,
0.9243441, 1.426875, -0.273161, 1, 1, 1, 1, 1,
0.9245882, -1.228281, 1.64587, 1, 1, 1, 1, 1,
0.925173, -0.02278705, 0.3165786, 1, 1, 1, 1, 1,
0.9270384, -0.1003755, 2.952139, 1, 1, 1, 1, 1,
0.9289178, -1.623001, 3.202312, 1, 1, 1, 1, 1,
0.931013, -0.02223015, 1.235067, 1, 1, 1, 1, 1,
0.9333853, -0.4908494, 3.280482, 1, 1, 1, 1, 1,
0.9369912, 0.2461358, 1.37686, 0, 0, 1, 1, 1,
0.9443347, -0.09771497, 2.412146, 1, 0, 0, 1, 1,
0.9447436, -0.5026382, 2.285783, 1, 0, 0, 1, 1,
0.9481872, -0.02205814, 1.983168, 1, 0, 0, 1, 1,
0.9487413, 1.052237, 1.540707, 1, 0, 0, 1, 1,
0.9526623, -1.224727, 2.426245, 1, 0, 0, 1, 1,
0.9541811, 0.2538399, 0.2949322, 0, 0, 0, 1, 1,
0.9550061, 0.1895595, -0.03998297, 0, 0, 0, 1, 1,
0.9576338, -0.5109211, -0.06540795, 0, 0, 0, 1, 1,
0.9607496, 0.496054, -0.08733623, 0, 0, 0, 1, 1,
0.9617733, 0.05477363, 1.916562, 0, 0, 0, 1, 1,
0.9658254, 0.8845578, 0.6934211, 0, 0, 0, 1, 1,
0.9705821, 0.05122522, -0.6773863, 0, 0, 0, 1, 1,
0.9759657, 0.4956166, 1.517323, 1, 1, 1, 1, 1,
0.9767838, 0.4366193, 3.269221, 1, 1, 1, 1, 1,
0.978552, 1.779584, 0.211998, 1, 1, 1, 1, 1,
0.9793867, 0.6463529, 1.990734, 1, 1, 1, 1, 1,
0.9869587, -0.490929, 2.331206, 1, 1, 1, 1, 1,
0.9908606, -0.8058589, 2.743588, 1, 1, 1, 1, 1,
0.9938371, -1.122343, 0.3917634, 1, 1, 1, 1, 1,
0.998711, -0.4307544, 1.383259, 1, 1, 1, 1, 1,
1.000311, -0.1965432, 1.733358, 1, 1, 1, 1, 1,
1.002685, 1.244362, 2.183929, 1, 1, 1, 1, 1,
1.016461, -0.3161909, 3.172672, 1, 1, 1, 1, 1,
1.017111, 0.02441916, -0.08651668, 1, 1, 1, 1, 1,
1.017483, 0.9640407, 2.197907, 1, 1, 1, 1, 1,
1.017692, -0.692464, 0.01542925, 1, 1, 1, 1, 1,
1.021754, -1.771736, 1.644015, 1, 1, 1, 1, 1,
1.024291, 1.584349, 1.476794, 0, 0, 1, 1, 1,
1.030368, -1.29408, 3.205585, 1, 0, 0, 1, 1,
1.031579, 1.083179, -0.202423, 1, 0, 0, 1, 1,
1.04797, -1.791874, 2.888392, 1, 0, 0, 1, 1,
1.048144, -1.008277, 3.376167, 1, 0, 0, 1, 1,
1.056877, -0.9840235, 1.020003, 1, 0, 0, 1, 1,
1.059621, 0.9538244, 0.01418339, 0, 0, 0, 1, 1,
1.067709, 0.5130876, 1.687138, 0, 0, 0, 1, 1,
1.068786, 0.8740698, 1.164338, 0, 0, 0, 1, 1,
1.070902, 0.2633186, 2.443872, 0, 0, 0, 1, 1,
1.073237, -0.4868578, 2.146771, 0, 0, 0, 1, 1,
1.075186, -1.746997, 3.156699, 0, 0, 0, 1, 1,
1.090395, -2.218073, 2.634976, 0, 0, 0, 1, 1,
1.091217, 1.730987, -0.0538433, 1, 1, 1, 1, 1,
1.091457, -0.841539, 1.875441, 1, 1, 1, 1, 1,
1.092945, -0.6409999, 3.475704, 1, 1, 1, 1, 1,
1.095117, 0.6737655, 1.076359, 1, 1, 1, 1, 1,
1.097701, -1.477535, 1.155481, 1, 1, 1, 1, 1,
1.100366, -0.8195512, 1.9186, 1, 1, 1, 1, 1,
1.104554, -0.91842, 3.564424, 1, 1, 1, 1, 1,
1.108904, -1.215346, 1.834136, 1, 1, 1, 1, 1,
1.11035, -0.5356576, 1.937698, 1, 1, 1, 1, 1,
1.120027, 0.08514667, 3.279976, 1, 1, 1, 1, 1,
1.123101, 0.123928, 1.628989, 1, 1, 1, 1, 1,
1.125105, -0.1587858, 0.2452922, 1, 1, 1, 1, 1,
1.12636, 0.2421424, 1.595765, 1, 1, 1, 1, 1,
1.127372, -1.518237, 2.299766, 1, 1, 1, 1, 1,
1.128337, -0.128168, -0.4705802, 1, 1, 1, 1, 1,
1.13705, -1.034311, 3.606708, 0, 0, 1, 1, 1,
1.138554, 0.5342793, -0.04655752, 1, 0, 0, 1, 1,
1.139149, -1.248245, 0.3022978, 1, 0, 0, 1, 1,
1.141652, -0.04012653, 4.229354, 1, 0, 0, 1, 1,
1.143269, -1.240459, 2.481215, 1, 0, 0, 1, 1,
1.14374, -0.7407125, 2.547136, 1, 0, 0, 1, 1,
1.145833, 0.6191393, 3.267717, 0, 0, 0, 1, 1,
1.14807, -0.5864877, 2.903525, 0, 0, 0, 1, 1,
1.149464, 0.4431949, 0.05818135, 0, 0, 0, 1, 1,
1.163037, -1.102568, 0.8467292, 0, 0, 0, 1, 1,
1.167001, -0.5636913, 2.18249, 0, 0, 0, 1, 1,
1.171299, -1.183746, 2.273395, 0, 0, 0, 1, 1,
1.174156, -0.7053123, 3.097157, 0, 0, 0, 1, 1,
1.177819, -0.402934, 1.920198, 1, 1, 1, 1, 1,
1.191951, 0.9628075, 0.1542445, 1, 1, 1, 1, 1,
1.192538, -0.4173814, 1.612927, 1, 1, 1, 1, 1,
1.193173, -0.2466397, 1.956226, 1, 1, 1, 1, 1,
1.19622, -0.5484859, 2.00742, 1, 1, 1, 1, 1,
1.216287, 0.2538998, 2.646935, 1, 1, 1, 1, 1,
1.21951, 0.707751, 0.03558755, 1, 1, 1, 1, 1,
1.21962, 0.187268, 0.003635718, 1, 1, 1, 1, 1,
1.227964, 0.3356179, -0.07618136, 1, 1, 1, 1, 1,
1.230489, 0.5327055, 1.113279, 1, 1, 1, 1, 1,
1.230799, -0.5240037, 1.258452, 1, 1, 1, 1, 1,
1.233409, 1.839933, 1.80972, 1, 1, 1, 1, 1,
1.243472, -0.8292022, 3.57192, 1, 1, 1, 1, 1,
1.243735, -0.4029164, 1.806731, 1, 1, 1, 1, 1,
1.258704, 0.6354976, 0.02366619, 1, 1, 1, 1, 1,
1.261391, -2.552976, 4.005525, 0, 0, 1, 1, 1,
1.261883, 0.7955704, 0.2068179, 1, 0, 0, 1, 1,
1.268865, 0.3249159, 0.9682614, 1, 0, 0, 1, 1,
1.273143, -0.1912558, 2.905821, 1, 0, 0, 1, 1,
1.277767, -0.6880786, 1.644041, 1, 0, 0, 1, 1,
1.285495, 0.03049012, 0.8640598, 1, 0, 0, 1, 1,
1.287514, -0.8738354, 3.875411, 0, 0, 0, 1, 1,
1.291406, 0.8244223, 1.493143, 0, 0, 0, 1, 1,
1.293385, -1.900042, 1.125194, 0, 0, 0, 1, 1,
1.296511, 0.8775458, 1.702546, 0, 0, 0, 1, 1,
1.297284, 1.026936, 1.704249, 0, 0, 0, 1, 1,
1.301204, 0.5626361, 0.4869518, 0, 0, 0, 1, 1,
1.303856, 0.5524477, 0.2986064, 0, 0, 0, 1, 1,
1.316669, 0.350094, 1.715355, 1, 1, 1, 1, 1,
1.339265, 0.6043527, 2.842499, 1, 1, 1, 1, 1,
1.358746, -0.01529584, 1.649388, 1, 1, 1, 1, 1,
1.3742, 1.034576, 0.9563771, 1, 1, 1, 1, 1,
1.383629, 0.05166256, 0.7929029, 1, 1, 1, 1, 1,
1.384335, 1.709905, -0.7998922, 1, 1, 1, 1, 1,
1.393659, 0.6180999, 0.009695635, 1, 1, 1, 1, 1,
1.393735, 0.4727557, -0.2508684, 1, 1, 1, 1, 1,
1.401537, 0.7120125, 0.7486985, 1, 1, 1, 1, 1,
1.40451, -0.5433213, -0.1529452, 1, 1, 1, 1, 1,
1.418634, 1.220569, 1.075181, 1, 1, 1, 1, 1,
1.432331, -0.3420073, 0.8650383, 1, 1, 1, 1, 1,
1.439794, 1.54629, 0.3515325, 1, 1, 1, 1, 1,
1.442912, 1.649452, 0.4684522, 1, 1, 1, 1, 1,
1.450374, 0.4374729, -0.1112494, 1, 1, 1, 1, 1,
1.46615, -0.5769593, 1.540367, 0, 0, 1, 1, 1,
1.46906, 0.002102391, 2.837487, 1, 0, 0, 1, 1,
1.500288, -1.29639, 4.205542, 1, 0, 0, 1, 1,
1.505885, -0.03724821, 0.8369237, 1, 0, 0, 1, 1,
1.506734, -0.5931028, 1.567572, 1, 0, 0, 1, 1,
1.517097, -0.5558626, 3.329441, 1, 0, 0, 1, 1,
1.521209, 1.026481, 1.137873, 0, 0, 0, 1, 1,
1.522716, -0.6033629, 4.220701, 0, 0, 0, 1, 1,
1.553017, -1.015522, 0.5176784, 0, 0, 0, 1, 1,
1.556744, 0.2002281, 2.75569, 0, 0, 0, 1, 1,
1.566384, -0.09519886, 2.120699, 0, 0, 0, 1, 1,
1.568293, -0.3391034, 2.124243, 0, 0, 0, 1, 1,
1.579004, 0.0325167, 1.593285, 0, 0, 0, 1, 1,
1.595674, -1.309242, 2.288474, 1, 1, 1, 1, 1,
1.605686, -1.222733, -0.07387447, 1, 1, 1, 1, 1,
1.607041, -0.894612, 2.577463, 1, 1, 1, 1, 1,
1.609803, 0.5413485, 0.1915706, 1, 1, 1, 1, 1,
1.609953, 1.357737, 1.549917, 1, 1, 1, 1, 1,
1.613367, -0.330921, 2.356418, 1, 1, 1, 1, 1,
1.628238, -0.09586672, 1.865168, 1, 1, 1, 1, 1,
1.632675, 0.2750032, 1.737847, 1, 1, 1, 1, 1,
1.64608, 0.004099805, 0.7923531, 1, 1, 1, 1, 1,
1.649295, -0.1590859, 2.45199, 1, 1, 1, 1, 1,
1.651589, -1.064057, 2.087553, 1, 1, 1, 1, 1,
1.668785, -0.3966747, 2.251054, 1, 1, 1, 1, 1,
1.674644, -0.5213654, 3.306918, 1, 1, 1, 1, 1,
1.701178, 0.5359013, 1.192938, 1, 1, 1, 1, 1,
1.714825, -0.1998925, 2.166613, 1, 1, 1, 1, 1,
1.735603, -1.319286, 4.813775, 0, 0, 1, 1, 1,
1.757235, 0.06370986, 2.253355, 1, 0, 0, 1, 1,
1.768783, -1.901121, 2.916745, 1, 0, 0, 1, 1,
1.772902, -1.328453, 1.974451, 1, 0, 0, 1, 1,
1.773976, 1.797776, 0.5698798, 1, 0, 0, 1, 1,
1.783622, 0.8545265, 1.705998, 1, 0, 0, 1, 1,
1.784489, -0.4205256, 1.733629, 0, 0, 0, 1, 1,
1.799307, 0.1788011, 2.176667, 0, 0, 0, 1, 1,
1.799845, 1.022669, 0.669572, 0, 0, 0, 1, 1,
1.803427, -0.6106622, 3.035353, 0, 0, 0, 1, 1,
1.813852, 0.6864735, 2.118818, 0, 0, 0, 1, 1,
1.935723, 0.7289621, 1.052653, 0, 0, 0, 1, 1,
1.969398, 0.5413684, 2.607202, 0, 0, 0, 1, 1,
1.980305, 1.021077, 0.8677133, 1, 1, 1, 1, 1,
1.989246, 1.443211, 1.713444, 1, 1, 1, 1, 1,
2.024194, 0.2618231, 1.827663, 1, 1, 1, 1, 1,
2.025296, -0.07116869, 0.4333506, 1, 1, 1, 1, 1,
2.026628, 1.679837, 1.568495, 1, 1, 1, 1, 1,
2.0376, -0.416911, 1.35812, 1, 1, 1, 1, 1,
2.046372, -0.6324412, 1.837964, 1, 1, 1, 1, 1,
2.055097, 1.330373, -0.5351552, 1, 1, 1, 1, 1,
2.100191, 0.1069802, 0.7572415, 1, 1, 1, 1, 1,
2.119866, -0.6914664, 2.816977, 1, 1, 1, 1, 1,
2.143831, 0.4128346, 3.147146, 1, 1, 1, 1, 1,
2.170233, -0.6513776, 1.923988, 1, 1, 1, 1, 1,
2.17522, -0.1231977, 1.049761, 1, 1, 1, 1, 1,
2.181121, -0.9505259, 2.288084, 1, 1, 1, 1, 1,
2.203607, -1.594017, 2.907438, 1, 1, 1, 1, 1,
2.206487, -0.02181661, 1.133013, 0, 0, 1, 1, 1,
2.212526, -0.05618351, 0.3518667, 1, 0, 0, 1, 1,
2.246182, 1.972277, -0.0891896, 1, 0, 0, 1, 1,
2.279094, 0.954828, -0.1796308, 1, 0, 0, 1, 1,
2.369175, 0.2525905, 0.6742301, 1, 0, 0, 1, 1,
2.374035, -0.214707, 0.9416471, 1, 0, 0, 1, 1,
2.378363, 0.1415953, 2.812858, 0, 0, 0, 1, 1,
2.408549, 1.944244, 1.073653, 0, 0, 0, 1, 1,
2.595998, 1.354424, 0.7272184, 0, 0, 0, 1, 1,
2.611793, -0.7282784, 1.638795, 0, 0, 0, 1, 1,
2.624894, -0.4326763, 3.084704, 0, 0, 0, 1, 1,
2.770094, 0.565785, 0.5972871, 0, 0, 0, 1, 1,
2.835538, -0.4435246, 2.044606, 0, 0, 0, 1, 1,
2.849989, 2.162607, 0.8568421, 1, 1, 1, 1, 1,
2.875153, 2.00215, 0.5912901, 1, 1, 1, 1, 1,
2.891157, 1.210865, 1.4418, 1, 1, 1, 1, 1,
2.940931, 0.1571362, 2.011634, 1, 1, 1, 1, 1,
3.085491, 1.845436, 0.1317229, 1, 1, 1, 1, 1,
3.108048, 0.3004554, 0.4827344, 1, 1, 1, 1, 1,
3.354108, -0.1397505, 1.783549, 1, 1, 1, 1, 1
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
var radius = 9.423646;
var distance = 33.10015;
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
mvMatrix.translate( -0.0663271, 0.1565268, 0.06540799 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10015);
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
