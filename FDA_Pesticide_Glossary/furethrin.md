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
-2.909564, -0.1704799, -2.838115, 1, 0, 0, 1,
-2.71414, 0.9151919, -3.948604, 1, 0.007843138, 0, 1,
-2.683203, 1.672124, -1.399682, 1, 0.01176471, 0, 1,
-2.661156, -1.792215, -2.083205, 1, 0.01960784, 0, 1,
-2.657048, -0.593937, -0.8886431, 1, 0.02352941, 0, 1,
-2.623115, -1.415514, -3.108049, 1, 0.03137255, 0, 1,
-2.548588, 0.1713296, -3.072087, 1, 0.03529412, 0, 1,
-2.528057, -0.5927194, -1.141215, 1, 0.04313726, 0, 1,
-2.359566, 0.2227223, -2.516207, 1, 0.04705882, 0, 1,
-2.359503, 0.2406514, -0.3586241, 1, 0.05490196, 0, 1,
-2.208277, 1.558528, -2.538349, 1, 0.05882353, 0, 1,
-2.185952, 2.797729, -0.4505146, 1, 0.06666667, 0, 1,
-2.152885, 1.466922, -1.367304, 1, 0.07058824, 0, 1,
-2.139194, -0.4783492, -0.631612, 1, 0.07843138, 0, 1,
-2.129378, 1.416202, -2.803579, 1, 0.08235294, 0, 1,
-2.090687, 0.005165579, -0.3208746, 1, 0.09019608, 0, 1,
-2.078946, -1.265943, -2.554229, 1, 0.09411765, 0, 1,
-2.076741, 1.266786, -0.7892527, 1, 0.1019608, 0, 1,
-2.075522, -0.5631273, -2.201088, 1, 0.1098039, 0, 1,
-2.065047, -0.4434474, -0.5383078, 1, 0.1137255, 0, 1,
-2.056722, 1.221025, 0.9879513, 1, 0.1215686, 0, 1,
-2.048481, -1.564363, -0.5393044, 1, 0.1254902, 0, 1,
-1.984982, 0.869826, -1.305557, 1, 0.1333333, 0, 1,
-1.96536, 0.4808876, -1.228535, 1, 0.1372549, 0, 1,
-1.945126, -0.1521183, -3.558712, 1, 0.145098, 0, 1,
-1.943455, -0.3173223, 0.633628, 1, 0.1490196, 0, 1,
-1.936745, 0.4426547, -2.106051, 1, 0.1568628, 0, 1,
-1.923237, -1.26939, -2.455403, 1, 0.1607843, 0, 1,
-1.912888, 1.919635, -1.988816, 1, 0.1686275, 0, 1,
-1.909025, -0.740998, -1.476199, 1, 0.172549, 0, 1,
-1.902651, -1.005798, -2.080993, 1, 0.1803922, 0, 1,
-1.897398, 1.098718, 0.1733651, 1, 0.1843137, 0, 1,
-1.88635, -0.897697, -2.259911, 1, 0.1921569, 0, 1,
-1.885611, 0.417925, -1.504859, 1, 0.1960784, 0, 1,
-1.882478, 0.4576362, -0.5501394, 1, 0.2039216, 0, 1,
-1.871176, -1.643167, -1.771256, 1, 0.2117647, 0, 1,
-1.839283, -0.8147568, -2.259404, 1, 0.2156863, 0, 1,
-1.815123, 0.934909, -2.632323, 1, 0.2235294, 0, 1,
-1.814648, 1.158463, -2.686597, 1, 0.227451, 0, 1,
-1.797112, -0.2567754, -0.06500614, 1, 0.2352941, 0, 1,
-1.79656, -0.9505144, -1.862506, 1, 0.2392157, 0, 1,
-1.796275, -2.38811, -3.292571, 1, 0.2470588, 0, 1,
-1.789047, 0.7651206, -1.149177, 1, 0.2509804, 0, 1,
-1.780773, -1.079221, -1.908628, 1, 0.2588235, 0, 1,
-1.767269, -1.934894, -3.033046, 1, 0.2627451, 0, 1,
-1.766383, 0.7270637, -0.5872819, 1, 0.2705882, 0, 1,
-1.765903, 0.2743476, -1.145597, 1, 0.2745098, 0, 1,
-1.759515, -0.3838142, -2.397326, 1, 0.282353, 0, 1,
-1.754701, -0.531055, -1.592593, 1, 0.2862745, 0, 1,
-1.744171, 0.07824145, -1.484577, 1, 0.2941177, 0, 1,
-1.734923, 1.08153, -0.9451826, 1, 0.3019608, 0, 1,
-1.734459, 0.1260102, -2.038175, 1, 0.3058824, 0, 1,
-1.721289, 2.377815, 0.4350629, 1, 0.3137255, 0, 1,
-1.693035, 0.6911973, 0.07180147, 1, 0.3176471, 0, 1,
-1.687509, 0.7434015, -1.269751, 1, 0.3254902, 0, 1,
-1.659314, 1.050454, -0.2608034, 1, 0.3294118, 0, 1,
-1.657813, 0.2631781, -0.4734283, 1, 0.3372549, 0, 1,
-1.656229, 0.8665968, -0.9366316, 1, 0.3411765, 0, 1,
-1.621794, -0.875514, -3.518367, 1, 0.3490196, 0, 1,
-1.602038, -0.1534786, -1.281258, 1, 0.3529412, 0, 1,
-1.597838, 0.4785964, -1.655788, 1, 0.3607843, 0, 1,
-1.593199, 0.8995559, -1.656937, 1, 0.3647059, 0, 1,
-1.58046, 0.4079249, -0.08575864, 1, 0.372549, 0, 1,
-1.538782, -0.9014921, -1.443168, 1, 0.3764706, 0, 1,
-1.537566, -0.8185805, -1.757845, 1, 0.3843137, 0, 1,
-1.530488, -0.4220224, -2.411117, 1, 0.3882353, 0, 1,
-1.523126, -1.376911, -2.078564, 1, 0.3960784, 0, 1,
-1.51931, -0.8601169, -2.230963, 1, 0.4039216, 0, 1,
-1.500604, 0.31835, -3.974127, 1, 0.4078431, 0, 1,
-1.491244, 0.4627575, -0.2283008, 1, 0.4156863, 0, 1,
-1.489985, -1.205346, -2.590215, 1, 0.4196078, 0, 1,
-1.481115, 0.710171, -0.04525185, 1, 0.427451, 0, 1,
-1.478213, -0.4147697, -1.922923, 1, 0.4313726, 0, 1,
-1.470746, 0.07276977, -0.4185008, 1, 0.4392157, 0, 1,
-1.470389, -1.062618, -3.168308, 1, 0.4431373, 0, 1,
-1.469089, 1.765655, 0.6940014, 1, 0.4509804, 0, 1,
-1.46654, 0.6905155, 1.032951, 1, 0.454902, 0, 1,
-1.464738, 1.040567, -0.7718078, 1, 0.4627451, 0, 1,
-1.452707, 0.601341, -0.306056, 1, 0.4666667, 0, 1,
-1.439784, 0.05719391, -2.612869, 1, 0.4745098, 0, 1,
-1.439576, -1.017377, -2.321584, 1, 0.4784314, 0, 1,
-1.439047, 2.211435, -1.337979, 1, 0.4862745, 0, 1,
-1.422675, -1.296787, -1.756907, 1, 0.4901961, 0, 1,
-1.421915, 0.6493353, -0.6476161, 1, 0.4980392, 0, 1,
-1.409389, 0.6075286, -1.130019, 1, 0.5058824, 0, 1,
-1.395133, 0.2027729, -1.835972, 1, 0.509804, 0, 1,
-1.380379, -2.145687, -1.849916, 1, 0.5176471, 0, 1,
-1.379217, -0.4423451, -2.424472, 1, 0.5215687, 0, 1,
-1.377171, -1.056323, -3.41317, 1, 0.5294118, 0, 1,
-1.367455, 1.494579, -1.518752, 1, 0.5333334, 0, 1,
-1.357226, 1.297076, -1.173585, 1, 0.5411765, 0, 1,
-1.349601, 1.711116, -0.7102561, 1, 0.5450981, 0, 1,
-1.333927, -1.985601, -3.491913, 1, 0.5529412, 0, 1,
-1.333643, 0.8840361, -1.676799, 1, 0.5568628, 0, 1,
-1.317929, -0.9754688, -2.675029, 1, 0.5647059, 0, 1,
-1.304355, 0.2965009, -1.965505, 1, 0.5686275, 0, 1,
-1.272152, 0.8506261, 0.3552541, 1, 0.5764706, 0, 1,
-1.271463, -1.711043, -2.848668, 1, 0.5803922, 0, 1,
-1.260839, -1.111526, -1.681357, 1, 0.5882353, 0, 1,
-1.253156, -0.9191225, -0.2819151, 1, 0.5921569, 0, 1,
-1.251774, -0.01565858, -1.703964, 1, 0.6, 0, 1,
-1.245836, -0.6579933, -2.066237, 1, 0.6078432, 0, 1,
-1.237653, 0.5169376, -2.555982, 1, 0.6117647, 0, 1,
-1.236012, 0.04246109, -0.6624034, 1, 0.6196079, 0, 1,
-1.233122, 0.8774764, -1.63575, 1, 0.6235294, 0, 1,
-1.231008, -0.4131747, -2.476765, 1, 0.6313726, 0, 1,
-1.225138, -1.012592, -3.156227, 1, 0.6352941, 0, 1,
-1.215316, 1.114075, 0.430104, 1, 0.6431373, 0, 1,
-1.198967, -0.8851625, -1.73002, 1, 0.6470588, 0, 1,
-1.198964, 1.026522, -0.1038944, 1, 0.654902, 0, 1,
-1.189542, 0.7679324, -0.9534526, 1, 0.6588235, 0, 1,
-1.189386, -0.0642219, -2.093376, 1, 0.6666667, 0, 1,
-1.183386, 0.7224131, -1.330817, 1, 0.6705883, 0, 1,
-1.173165, 0.7477163, 0.7911393, 1, 0.6784314, 0, 1,
-1.162623, 0.4566333, -2.921267, 1, 0.682353, 0, 1,
-1.158218, -1.834859, -3.011756, 1, 0.6901961, 0, 1,
-1.143688, 0.2647015, 0.8426172, 1, 0.6941177, 0, 1,
-1.139237, -1.203705, -0.552358, 1, 0.7019608, 0, 1,
-1.137734, -1.580472, -2.077047, 1, 0.7098039, 0, 1,
-1.128635, -0.6504655, -1.108619, 1, 0.7137255, 0, 1,
-1.117415, 0.7879955, -1.620007, 1, 0.7215686, 0, 1,
-1.114927, -0.04767625, 0.01502045, 1, 0.7254902, 0, 1,
-1.114818, -1.287223, -1.438333, 1, 0.7333333, 0, 1,
-1.112388, -0.5698961, -2.307434, 1, 0.7372549, 0, 1,
-1.109447, -1.204121, -2.98861, 1, 0.7450981, 0, 1,
-1.09784, -0.4281287, -2.760919, 1, 0.7490196, 0, 1,
-1.097037, -1.148207, -1.986749, 1, 0.7568628, 0, 1,
-1.0964, -0.2189312, -1.909391, 1, 0.7607843, 0, 1,
-1.09139, -0.3870109, -0.06225277, 1, 0.7686275, 0, 1,
-1.09005, 0.1970591, -1.675539, 1, 0.772549, 0, 1,
-1.088209, -1.173517, -3.095058, 1, 0.7803922, 0, 1,
-1.086324, 0.875388, -1.314581, 1, 0.7843137, 0, 1,
-1.08142, -1.866626, -4.553224, 1, 0.7921569, 0, 1,
-1.078916, 0.7157257, 0.02284585, 1, 0.7960784, 0, 1,
-1.075908, -0.2271112, -1.532646, 1, 0.8039216, 0, 1,
-1.075159, 0.9532624, 0.8272823, 1, 0.8117647, 0, 1,
-1.059597, -1.296671, -2.700119, 1, 0.8156863, 0, 1,
-1.059301, 0.03358623, -0.9820419, 1, 0.8235294, 0, 1,
-1.047346, -3.429751, -1.577146, 1, 0.827451, 0, 1,
-1.041384, 0.8587636, -0.06299397, 1, 0.8352941, 0, 1,
-1.037963, -0.1703928, -1.404712, 1, 0.8392157, 0, 1,
-1.030416, -0.300677, -0.8541467, 1, 0.8470588, 0, 1,
-1.026011, -0.1015851, -0.6544118, 1, 0.8509804, 0, 1,
-1.002305, 0.357239, -3.539429, 1, 0.8588235, 0, 1,
-0.9973202, -1.19641, -2.902885, 1, 0.8627451, 0, 1,
-0.9925973, 1.771635, 0.04856548, 1, 0.8705882, 0, 1,
-0.9921911, -0.4311205, -1.256101, 1, 0.8745098, 0, 1,
-0.9908171, -0.3775137, -0.7830983, 1, 0.8823529, 0, 1,
-0.9823421, -0.8023309, -2.364156, 1, 0.8862745, 0, 1,
-0.9767068, 0.5654657, -0.3763397, 1, 0.8941177, 0, 1,
-0.9686776, 1.155886, -1.04657, 1, 0.8980392, 0, 1,
-0.9605916, 0.7853928, -0.6267455, 1, 0.9058824, 0, 1,
-0.9588346, 1.324019, -0.1975202, 1, 0.9137255, 0, 1,
-0.9560165, 0.5072207, -0.6538578, 1, 0.9176471, 0, 1,
-0.9536756, -0.1274957, -1.732368, 1, 0.9254902, 0, 1,
-0.9454079, 1.057538, 0.07763879, 1, 0.9294118, 0, 1,
-0.943864, 1.413783, -1.544077, 1, 0.9372549, 0, 1,
-0.9425058, -1.138791, -2.993874, 1, 0.9411765, 0, 1,
-0.9406569, 0.9464862, -0.9231481, 1, 0.9490196, 0, 1,
-0.9386884, 0.1026885, 0.4245484, 1, 0.9529412, 0, 1,
-0.9274486, -1.580155, -2.899985, 1, 0.9607843, 0, 1,
-0.9201335, -0.7789553, -1.605665, 1, 0.9647059, 0, 1,
-0.9168581, -0.06134809, -0.9786718, 1, 0.972549, 0, 1,
-0.9139757, -2.363653, -4.47961, 1, 0.9764706, 0, 1,
-0.9077764, 0.5238756, -1.043976, 1, 0.9843137, 0, 1,
-0.8986778, 0.4839085, -1.560216, 1, 0.9882353, 0, 1,
-0.8969015, 0.5253783, 0.05672967, 1, 0.9960784, 0, 1,
-0.8955929, -1.150539, -2.905525, 0.9960784, 1, 0, 1,
-0.8940367, 1.758524, -0.5705022, 0.9921569, 1, 0, 1,
-0.8929172, 0.1061673, -2.048452, 0.9843137, 1, 0, 1,
-0.8928589, -1.089579, -1.355068, 0.9803922, 1, 0, 1,
-0.8902825, -0.5851446, -2.317068, 0.972549, 1, 0, 1,
-0.8895647, 0.1127495, 0.7195494, 0.9686275, 1, 0, 1,
-0.8880712, -0.7019107, -3.178384, 0.9607843, 1, 0, 1,
-0.8873699, 1.315834, -2.695732, 0.9568627, 1, 0, 1,
-0.8857983, 1.070068, 0.6160535, 0.9490196, 1, 0, 1,
-0.8845934, 0.9447124, -1.69643, 0.945098, 1, 0, 1,
-0.8724651, -1.091716, -1.400948, 0.9372549, 1, 0, 1,
-0.8716897, -0.3580864, -2.251904, 0.9333333, 1, 0, 1,
-0.871309, 0.642006, -0.2768143, 0.9254902, 1, 0, 1,
-0.8656589, -0.4430548, -2.387243, 0.9215686, 1, 0, 1,
-0.8599114, -0.4447066, -1.685108, 0.9137255, 1, 0, 1,
-0.855037, 0.8002564, -0.9758607, 0.9098039, 1, 0, 1,
-0.8493902, 0.03055478, -3.008195, 0.9019608, 1, 0, 1,
-0.8492091, 0.5938359, -2.570431, 0.8941177, 1, 0, 1,
-0.8484894, -0.6490396, -2.521715, 0.8901961, 1, 0, 1,
-0.845306, -0.9296703, -1.360986, 0.8823529, 1, 0, 1,
-0.845228, 0.06732354, -2.116924, 0.8784314, 1, 0, 1,
-0.8430817, 1.769572, 0.4411556, 0.8705882, 1, 0, 1,
-0.8429028, -0.09235577, -1.600669, 0.8666667, 1, 0, 1,
-0.8370557, 0.2252556, -2.498369, 0.8588235, 1, 0, 1,
-0.8341229, -0.4838001, -1.545456, 0.854902, 1, 0, 1,
-0.8318644, 1.628117, -0.2614483, 0.8470588, 1, 0, 1,
-0.8247459, -1.058517, -1.690773, 0.8431373, 1, 0, 1,
-0.8232502, -1.051653, -2.443745, 0.8352941, 1, 0, 1,
-0.8150833, 0.1428977, -0.1682701, 0.8313726, 1, 0, 1,
-0.8137156, 0.5150648, -1.590925, 0.8235294, 1, 0, 1,
-0.8110961, 0.9195237, -2.098177, 0.8196079, 1, 0, 1,
-0.8071333, 1.100586, -0.3360031, 0.8117647, 1, 0, 1,
-0.8002019, -1.315363, -1.791675, 0.8078431, 1, 0, 1,
-0.795764, -1.345551, -1.905281, 0.8, 1, 0, 1,
-0.7937948, 0.2524694, -1.064728, 0.7921569, 1, 0, 1,
-0.7927349, -0.7039821, -2.966583, 0.7882353, 1, 0, 1,
-0.7900747, -0.8398337, -1.81069, 0.7803922, 1, 0, 1,
-0.7882475, -0.451117, -4.245616, 0.7764706, 1, 0, 1,
-0.7789336, 1.25602, -1.367131, 0.7686275, 1, 0, 1,
-0.7786775, -0.8438933, -1.092304, 0.7647059, 1, 0, 1,
-0.7772888, -0.9959337, -3.050773, 0.7568628, 1, 0, 1,
-0.7767794, 0.1112924, -1.292352, 0.7529412, 1, 0, 1,
-0.7735531, 0.8672689, -0.1401413, 0.7450981, 1, 0, 1,
-0.773514, 0.7222204, 0.2150131, 0.7411765, 1, 0, 1,
-0.7723237, -0.2297333, -0.1900462, 0.7333333, 1, 0, 1,
-0.7663748, -0.2701701, -2.238054, 0.7294118, 1, 0, 1,
-0.7638863, -1.902221, -1.972624, 0.7215686, 1, 0, 1,
-0.7621411, -0.04025492, -1.351493, 0.7176471, 1, 0, 1,
-0.7594261, -0.04422998, -1.032489, 0.7098039, 1, 0, 1,
-0.759266, -0.04575123, -1.604376, 0.7058824, 1, 0, 1,
-0.7564093, -1.29932, -2.780422, 0.6980392, 1, 0, 1,
-0.7547495, -0.05354051, -0.9037395, 0.6901961, 1, 0, 1,
-0.7507337, 1.407462, 0.02616033, 0.6862745, 1, 0, 1,
-0.7490373, -0.6827976, -3.226267, 0.6784314, 1, 0, 1,
-0.7447782, 1.319022, -0.5353065, 0.6745098, 1, 0, 1,
-0.7351529, -0.4492879, -1.238689, 0.6666667, 1, 0, 1,
-0.7344673, -1.710375, -2.594504, 0.6627451, 1, 0, 1,
-0.7330379, 0.426578, -1.286955, 0.654902, 1, 0, 1,
-0.7315007, 1.434979, -0.09509294, 0.6509804, 1, 0, 1,
-0.7311643, -1.075987, -0.4224448, 0.6431373, 1, 0, 1,
-0.7246385, -1.431142, -0.7638915, 0.6392157, 1, 0, 1,
-0.7236019, 0.2371262, -2.316666, 0.6313726, 1, 0, 1,
-0.7230419, -1.886376, -2.54399, 0.627451, 1, 0, 1,
-0.7142529, 0.7545491, 0.05846969, 0.6196079, 1, 0, 1,
-0.70737, -1.171772, -3.681172, 0.6156863, 1, 0, 1,
-0.7067256, 1.251811, -0.7712601, 0.6078432, 1, 0, 1,
-0.706531, 1.703077, -0.6811433, 0.6039216, 1, 0, 1,
-0.696484, 0.7031968, -0.3209662, 0.5960785, 1, 0, 1,
-0.6958653, -2.06327, -2.690231, 0.5882353, 1, 0, 1,
-0.6904172, 0.7210048, -1.057798, 0.5843138, 1, 0, 1,
-0.6903234, 1.173548, -1.117773, 0.5764706, 1, 0, 1,
-0.6897035, 0.4016512, -0.0386974, 0.572549, 1, 0, 1,
-0.6848065, 1.386539, -1.730385, 0.5647059, 1, 0, 1,
-0.6846201, 0.8719065, -0.910871, 0.5607843, 1, 0, 1,
-0.6845641, -1.65307, -2.681571, 0.5529412, 1, 0, 1,
-0.6845048, -1.885466, -5.037482, 0.5490196, 1, 0, 1,
-0.6840913, 1.692598, 1.276595, 0.5411765, 1, 0, 1,
-0.6839862, -0.3358052, -1.030321, 0.5372549, 1, 0, 1,
-0.6829769, -1.51552, -4.153966, 0.5294118, 1, 0, 1,
-0.6828347, 0.5073657, -1.442955, 0.5254902, 1, 0, 1,
-0.6801963, -0.4404564, -0.6631854, 0.5176471, 1, 0, 1,
-0.6720358, 0.3541489, -1.03037, 0.5137255, 1, 0, 1,
-0.6711401, -2.315133, -1.582709, 0.5058824, 1, 0, 1,
-0.662373, 1.008062, -0.139527, 0.5019608, 1, 0, 1,
-0.6587139, 2.656778, -1.155646, 0.4941176, 1, 0, 1,
-0.6584155, 0.2019762, -0.0782774, 0.4862745, 1, 0, 1,
-0.6571716, 0.6270715, -0.1522556, 0.4823529, 1, 0, 1,
-0.6549097, 0.7398379, -0.1608686, 0.4745098, 1, 0, 1,
-0.6520991, 0.7083127, -1.588956, 0.4705882, 1, 0, 1,
-0.6434931, -0.1030075, -3.938592, 0.4627451, 1, 0, 1,
-0.6420492, -1.023912, -1.143979, 0.4588235, 1, 0, 1,
-0.6419904, -0.5017807, -2.374765, 0.4509804, 1, 0, 1,
-0.6403247, 0.5569625, -1.691447, 0.4470588, 1, 0, 1,
-0.6267354, 0.2758919, 0.3363543, 0.4392157, 1, 0, 1,
-0.6202785, 0.822244, -0.3400052, 0.4352941, 1, 0, 1,
-0.6190214, -0.84398, -3.047575, 0.427451, 1, 0, 1,
-0.6173569, -0.9351246, -3.370075, 0.4235294, 1, 0, 1,
-0.6148601, 0.2935594, -1.659981, 0.4156863, 1, 0, 1,
-0.6120551, -1.603428, -2.791058, 0.4117647, 1, 0, 1,
-0.6107212, 0.4227691, -0.4360147, 0.4039216, 1, 0, 1,
-0.6044176, 0.208299, -1.862553, 0.3960784, 1, 0, 1,
-0.5963367, 0.704753, -0.4776472, 0.3921569, 1, 0, 1,
-0.5894566, 0.2168766, -2.242385, 0.3843137, 1, 0, 1,
-0.5891526, 0.9542324, -0.2168127, 0.3803922, 1, 0, 1,
-0.5882685, 0.1497407, -1.006682, 0.372549, 1, 0, 1,
-0.5879785, -0.2263455, -2.920831, 0.3686275, 1, 0, 1,
-0.584315, -0.1025777, -1.26016, 0.3607843, 1, 0, 1,
-0.583998, 0.962113, -0.5809537, 0.3568628, 1, 0, 1,
-0.5822833, 0.1950634, -1.273195, 0.3490196, 1, 0, 1,
-0.5820949, -0.1049766, -2.042602, 0.345098, 1, 0, 1,
-0.5807539, 0.2881844, 0.9715738, 0.3372549, 1, 0, 1,
-0.5763878, -0.7391278, -2.643498, 0.3333333, 1, 0, 1,
-0.5755783, -0.7140737, -1.590457, 0.3254902, 1, 0, 1,
-0.5751921, -0.6019093, -4.324391, 0.3215686, 1, 0, 1,
-0.5736133, -0.02619258, -2.396909, 0.3137255, 1, 0, 1,
-0.5725901, -0.4193901, -2.769645, 0.3098039, 1, 0, 1,
-0.5701722, 0.4417665, -1.430446, 0.3019608, 1, 0, 1,
-0.5673963, 0.4399117, -0.3752212, 0.2941177, 1, 0, 1,
-0.5670846, 1.156469, -2.59816, 0.2901961, 1, 0, 1,
-0.5664088, -0.4594492, -1.788959, 0.282353, 1, 0, 1,
-0.5583716, 0.8850573, -2.461618, 0.2784314, 1, 0, 1,
-0.5571945, -1.170008, -2.490868, 0.2705882, 1, 0, 1,
-0.5560227, -1.083667, -2.371437, 0.2666667, 1, 0, 1,
-0.5525385, 0.2665809, -2.303733, 0.2588235, 1, 0, 1,
-0.5508849, -1.973239, -2.258553, 0.254902, 1, 0, 1,
-0.549467, -0.9629201, -4.872199, 0.2470588, 1, 0, 1,
-0.5479823, -0.7688674, -4.146091, 0.2431373, 1, 0, 1,
-0.5451496, 1.669872, -1.74069, 0.2352941, 1, 0, 1,
-0.5353331, 1.448941, 0.3012246, 0.2313726, 1, 0, 1,
-0.5342392, -1.526551, -2.212007, 0.2235294, 1, 0, 1,
-0.5338725, 1.246067, -0.6510854, 0.2196078, 1, 0, 1,
-0.5299482, 2.257758, 0.6448827, 0.2117647, 1, 0, 1,
-0.5298323, -0.831911, -3.114161, 0.2078431, 1, 0, 1,
-0.5250859, 1.792457, -0.5047218, 0.2, 1, 0, 1,
-0.5195097, -0.2250572, -0.859347, 0.1921569, 1, 0, 1,
-0.5184657, -0.9865761, -2.945422, 0.1882353, 1, 0, 1,
-0.5158782, 0.5840965, -2.371783, 0.1803922, 1, 0, 1,
-0.5150617, -0.2259841, -2.034106, 0.1764706, 1, 0, 1,
-0.5137447, 0.01539858, -3.63806, 0.1686275, 1, 0, 1,
-0.5083252, 0.7253785, -0.6749574, 0.1647059, 1, 0, 1,
-0.4974248, -0.6233402, -1.607561, 0.1568628, 1, 0, 1,
-0.4971796, -0.7700719, -2.480699, 0.1529412, 1, 0, 1,
-0.4948049, 2.59644, 1.056161, 0.145098, 1, 0, 1,
-0.4913917, 0.02439833, -1.690518, 0.1411765, 1, 0, 1,
-0.4913356, 1.414624, 1.813118, 0.1333333, 1, 0, 1,
-0.4873102, -0.4300984, -2.846021, 0.1294118, 1, 0, 1,
-0.484684, 0.8904029, -0.880191, 0.1215686, 1, 0, 1,
-0.484525, 0.6040527, 0.7566372, 0.1176471, 1, 0, 1,
-0.4823895, -0.3492633, -2.726315, 0.1098039, 1, 0, 1,
-0.4803989, 1.065521, -0.7221586, 0.1058824, 1, 0, 1,
-0.477669, -1.072852, -3.66047, 0.09803922, 1, 0, 1,
-0.4742507, -0.1578693, -0.2100178, 0.09019608, 1, 0, 1,
-0.4612867, -0.4738541, -2.496115, 0.08627451, 1, 0, 1,
-0.4591941, 2.295498, 1.256158, 0.07843138, 1, 0, 1,
-0.456351, 0.03890178, -0.7630348, 0.07450981, 1, 0, 1,
-0.4552611, 2.235673, 0.627087, 0.06666667, 1, 0, 1,
-0.4534433, 0.0818141, -1.842107, 0.0627451, 1, 0, 1,
-0.4507895, -0.3554439, -3.423755, 0.05490196, 1, 0, 1,
-0.4453819, 0.03879965, -1.463227, 0.05098039, 1, 0, 1,
-0.4450038, -0.6224565, -1.117139, 0.04313726, 1, 0, 1,
-0.4385622, 1.279915, -1.120539, 0.03921569, 1, 0, 1,
-0.4370915, -0.2654429, -1.102425, 0.03137255, 1, 0, 1,
-0.4369142, -0.2489412, -3.038255, 0.02745098, 1, 0, 1,
-0.4175231, 0.4679686, -0.2884133, 0.01960784, 1, 0, 1,
-0.4128081, -0.5798487, -2.96383, 0.01568628, 1, 0, 1,
-0.4127691, 1.290704, 0.9836124, 0.007843138, 1, 0, 1,
-0.4116828, 0.5200933, -0.1993798, 0.003921569, 1, 0, 1,
-0.4076881, -0.4406064, -2.706473, 0, 1, 0.003921569, 1,
-0.4044389, -0.7450216, -3.907844, 0, 1, 0.01176471, 1,
-0.4040179, 0.3071238, 0.04272721, 0, 1, 0.01568628, 1,
-0.4034269, -1.884993, -2.159355, 0, 1, 0.02352941, 1,
-0.4018181, 1.468091, -0.7669669, 0, 1, 0.02745098, 1,
-0.3908971, -0.7346423, -3.283113, 0, 1, 0.03529412, 1,
-0.3864397, -0.03798748, -1.552226, 0, 1, 0.03921569, 1,
-0.3844721, -1.115906, -1.222395, 0, 1, 0.04705882, 1,
-0.3833942, 1.395818, 0.5256017, 0, 1, 0.05098039, 1,
-0.3812627, 0.5235738, 0.9230093, 0, 1, 0.05882353, 1,
-0.3721941, -0.3884699, -4.521181, 0, 1, 0.0627451, 1,
-0.3712573, 0.6094706, -0.4990723, 0, 1, 0.07058824, 1,
-0.3710877, -0.5742819, -2.739504, 0, 1, 0.07450981, 1,
-0.3707042, 0.08999974, -1.156454, 0, 1, 0.08235294, 1,
-0.3694545, 0.8362122, -0.7473673, 0, 1, 0.08627451, 1,
-0.3687757, -2.055749, -2.644183, 0, 1, 0.09411765, 1,
-0.3684751, 1.077356, 2.6229, 0, 1, 0.1019608, 1,
-0.3653254, -0.9828961, -3.325712, 0, 1, 0.1058824, 1,
-0.3631786, 0.7763584, -1.010614, 0, 1, 0.1137255, 1,
-0.3519972, -0.9329591, -3.480004, 0, 1, 0.1176471, 1,
-0.3510309, -0.31743, -2.122344, 0, 1, 0.1254902, 1,
-0.3458278, -1.538367, -3.073241, 0, 1, 0.1294118, 1,
-0.344389, 1.288647, 0.5592051, 0, 1, 0.1372549, 1,
-0.341278, -0.3502392, -2.014915, 0, 1, 0.1411765, 1,
-0.337563, -0.7904545, -2.284053, 0, 1, 0.1490196, 1,
-0.3317994, 0.5499964, -0.5598414, 0, 1, 0.1529412, 1,
-0.3271834, 2.017414, -0.2862297, 0, 1, 0.1607843, 1,
-0.3238167, 0.5539938, -0.4177854, 0, 1, 0.1647059, 1,
-0.3227382, 0.4438777, -0.207674, 0, 1, 0.172549, 1,
-0.3226605, 0.7890767, -0.1761924, 0, 1, 0.1764706, 1,
-0.3195529, -0.2505077, -3.745425, 0, 1, 0.1843137, 1,
-0.3186336, -1.273922, -3.080634, 0, 1, 0.1882353, 1,
-0.3071514, -1.897026, -3.21685, 0, 1, 0.1960784, 1,
-0.3047773, 0.2475622, -2.133737, 0, 1, 0.2039216, 1,
-0.298351, -1.233812, -2.544129, 0, 1, 0.2078431, 1,
-0.2954991, 0.9779791, -1.279093, 0, 1, 0.2156863, 1,
-0.2919781, 0.3134873, -0.7449108, 0, 1, 0.2196078, 1,
-0.2911736, -0.2544222, -2.06635, 0, 1, 0.227451, 1,
-0.2906466, 1.204408, -0.7742763, 0, 1, 0.2313726, 1,
-0.2895564, 1.222296, -0.9150446, 0, 1, 0.2392157, 1,
-0.2889653, 0.8481326, -0.2228586, 0, 1, 0.2431373, 1,
-0.2888885, -0.9297968, -4.206444, 0, 1, 0.2509804, 1,
-0.2859098, -0.4006028, -2.483639, 0, 1, 0.254902, 1,
-0.2855623, -0.6331438, -3.575098, 0, 1, 0.2627451, 1,
-0.2850714, -0.0132592, -0.5408848, 0, 1, 0.2666667, 1,
-0.282185, -0.8075436, -3.090671, 0, 1, 0.2745098, 1,
-0.2769803, 0.8688871, 1.00799, 0, 1, 0.2784314, 1,
-0.2755267, 0.08081204, -1.833833, 0, 1, 0.2862745, 1,
-0.272993, 1.073364, 0.2558731, 0, 1, 0.2901961, 1,
-0.2719955, -1.278921, -2.338108, 0, 1, 0.2980392, 1,
-0.2682756, 2.667173, -0.1661381, 0, 1, 0.3058824, 1,
-0.2653221, -0.9673861, -3.653337, 0, 1, 0.3098039, 1,
-0.2639411, 0.3838679, -0.9338396, 0, 1, 0.3176471, 1,
-0.2607644, 0.3571039, 1.493989, 0, 1, 0.3215686, 1,
-0.2578748, 1.685174, -1.028626, 0, 1, 0.3294118, 1,
-0.2513074, -0.03088946, -1.9656, 0, 1, 0.3333333, 1,
-0.2467595, 0.5711911, -1.674785, 0, 1, 0.3411765, 1,
-0.2445519, 0.5493794, -0.257726, 0, 1, 0.345098, 1,
-0.244097, 0.9307386, -1.692172, 0, 1, 0.3529412, 1,
-0.2368744, -0.5991931, -4.145587, 0, 1, 0.3568628, 1,
-0.2357077, 0.07688636, 0.08069129, 0, 1, 0.3647059, 1,
-0.2329877, 2.714137, -1.510452, 0, 1, 0.3686275, 1,
-0.231702, 0.1193149, -0.6180843, 0, 1, 0.3764706, 1,
-0.2298594, 0.8899528, 0.8689458, 0, 1, 0.3803922, 1,
-0.2271202, -1.791239, -2.409424, 0, 1, 0.3882353, 1,
-0.2260561, 1.583083, -0.3638731, 0, 1, 0.3921569, 1,
-0.2180439, 0.1124639, -2.181846, 0, 1, 0.4, 1,
-0.2159608, 1.727353, 1.200422, 0, 1, 0.4078431, 1,
-0.2019802, 1.201873, -0.3390842, 0, 1, 0.4117647, 1,
-0.201249, 0.1108261, -1.934479, 0, 1, 0.4196078, 1,
-0.2006706, -0.3415876, -4.489518, 0, 1, 0.4235294, 1,
-0.1995261, -0.2780371, -2.537892, 0, 1, 0.4313726, 1,
-0.1917732, -0.8608492, -3.98261, 0, 1, 0.4352941, 1,
-0.1910015, 0.4590235, -1.249096, 0, 1, 0.4431373, 1,
-0.1908256, 0.2402878, -0.9254979, 0, 1, 0.4470588, 1,
-0.1905479, -0.06275819, -2.757988, 0, 1, 0.454902, 1,
-0.1903159, -1.517768, -2.965701, 0, 1, 0.4588235, 1,
-0.1886898, -0.6961413, -3.258843, 0, 1, 0.4666667, 1,
-0.1878375, 0.1365553, -1.779648, 0, 1, 0.4705882, 1,
-0.1864091, 0.1439996, -2.54775, 0, 1, 0.4784314, 1,
-0.1850115, 1.599366, 0.892797, 0, 1, 0.4823529, 1,
-0.1833136, -1.863383, -2.992936, 0, 1, 0.4901961, 1,
-0.1806807, -1.962314, -4.222323, 0, 1, 0.4941176, 1,
-0.1727634, 0.08127119, -1.344763, 0, 1, 0.5019608, 1,
-0.169201, -0.2482121, -3.299125, 0, 1, 0.509804, 1,
-0.1675645, -0.4343791, -0.4638927, 0, 1, 0.5137255, 1,
-0.166551, 2.13905, -1.394166, 0, 1, 0.5215687, 1,
-0.1647135, 3.355378, -1.036569, 0, 1, 0.5254902, 1,
-0.1618377, -0.2432864, -1.078671, 0, 1, 0.5333334, 1,
-0.1586583, -0.6359579, -3.50762, 0, 1, 0.5372549, 1,
-0.15684, 0.6071062, -0.9030017, 0, 1, 0.5450981, 1,
-0.156083, 0.5523973, 0.5971748, 0, 1, 0.5490196, 1,
-0.15137, -1.449053, -1.410294, 0, 1, 0.5568628, 1,
-0.1449438, -0.6600811, -3.942605, 0, 1, 0.5607843, 1,
-0.1441318, 1.623266, -0.5923517, 0, 1, 0.5686275, 1,
-0.1433242, 1.320768, -0.1112529, 0, 1, 0.572549, 1,
-0.1404809, 0.5659701, -1.373262, 0, 1, 0.5803922, 1,
-0.139428, 0.9153195, -2.126656, 0, 1, 0.5843138, 1,
-0.1383489, 1.803911, -1.293356, 0, 1, 0.5921569, 1,
-0.1378618, -0.1354466, -1.199638, 0, 1, 0.5960785, 1,
-0.1375725, -0.1033472, -1.560909, 0, 1, 0.6039216, 1,
-0.1284466, 0.2096783, -2.188408, 0, 1, 0.6117647, 1,
-0.1269406, -0.2201712, -2.787572, 0, 1, 0.6156863, 1,
-0.125662, 0.6041845, -0.7787533, 0, 1, 0.6235294, 1,
-0.122726, 0.9666892, 0.5764787, 0, 1, 0.627451, 1,
-0.1194428, -0.4981104, -2.209486, 0, 1, 0.6352941, 1,
-0.1174546, 0.006728909, -1.76066, 0, 1, 0.6392157, 1,
-0.1136891, 1.278869, 1.134142, 0, 1, 0.6470588, 1,
-0.1102175, 0.2468783, -0.3768009, 0, 1, 0.6509804, 1,
-0.1042284, 1.001657, -0.09997213, 0, 1, 0.6588235, 1,
-0.102892, -1.400042, -2.883557, 0, 1, 0.6627451, 1,
-0.09851635, -1.714885, -2.848053, 0, 1, 0.6705883, 1,
-0.0900844, 0.7342297, -0.0569343, 0, 1, 0.6745098, 1,
-0.08959403, 0.4792584, -0.5907285, 0, 1, 0.682353, 1,
-0.08832534, 0.4922425, -0.5392335, 0, 1, 0.6862745, 1,
-0.08802284, -1.244104, -1.917209, 0, 1, 0.6941177, 1,
-0.08665454, -0.3704897, -3.173704, 0, 1, 0.7019608, 1,
-0.0847105, -1.215599, -1.730068, 0, 1, 0.7058824, 1,
-0.082795, -2.044371, -3.142922, 0, 1, 0.7137255, 1,
-0.07600188, -1.488512, -4.81696, 0, 1, 0.7176471, 1,
-0.07529531, 0.07083051, -1.169168, 0, 1, 0.7254902, 1,
-0.07482471, 0.3908479, 0.5612288, 0, 1, 0.7294118, 1,
-0.07384616, -0.3335025, -3.178671, 0, 1, 0.7372549, 1,
-0.07253379, -1.718514, -3.238005, 0, 1, 0.7411765, 1,
-0.07189902, 1.592238, -0.9417788, 0, 1, 0.7490196, 1,
-0.07145938, 0.635684, 0.01049573, 0, 1, 0.7529412, 1,
-0.06843729, 0.551175, 0.05613021, 0, 1, 0.7607843, 1,
-0.06744304, -1.874832, -2.46087, 0, 1, 0.7647059, 1,
-0.06615964, -1.913043, -4.610656, 0, 1, 0.772549, 1,
-0.05877531, 1.18704, -0.7701822, 0, 1, 0.7764706, 1,
-0.05171593, 0.624352, 0.05581803, 0, 1, 0.7843137, 1,
-0.04940484, -0.3678707, -2.547006, 0, 1, 0.7882353, 1,
-0.0464552, -0.6872, -5.151669, 0, 1, 0.7960784, 1,
-0.04528705, -1.220415, -3.726223, 0, 1, 0.8039216, 1,
-0.04156008, -0.3196176, -1.966797, 0, 1, 0.8078431, 1,
-0.04110771, 0.5059678, -0.485779, 0, 1, 0.8156863, 1,
-0.03843428, 0.6607885, 0.7130566, 0, 1, 0.8196079, 1,
-0.03546733, 0.629673, 0.394963, 0, 1, 0.827451, 1,
-0.02377387, -1.109599, -4.280924, 0, 1, 0.8313726, 1,
-0.02367754, -0.752506, -4.253249, 0, 1, 0.8392157, 1,
-0.02283029, -0.6200009, -2.907639, 0, 1, 0.8431373, 1,
-0.02106878, -0.8363038, -4.833032, 0, 1, 0.8509804, 1,
-0.01581682, -0.7106134, -1.158459, 0, 1, 0.854902, 1,
-0.01485936, -1.040716, -4.377589, 0, 1, 0.8627451, 1,
-0.0145868, -0.1893567, -3.364647, 0, 1, 0.8666667, 1,
-0.01071172, -0.5617791, -4.535108, 0, 1, 0.8745098, 1,
-0.006659211, 0.1270618, 1.45983, 0, 1, 0.8784314, 1,
-0.005498626, -0.004392968, -1.564045, 0, 1, 0.8862745, 1,
0.001782861, -0.737028, 2.544474, 0, 1, 0.8901961, 1,
0.001982063, -0.5653043, 3.90593, 0, 1, 0.8980392, 1,
0.003883066, 0.8338814, -2.513683, 0, 1, 0.9058824, 1,
0.00783873, -1.119847, 3.168988, 0, 1, 0.9098039, 1,
0.009871528, -0.2945485, 3.415183, 0, 1, 0.9176471, 1,
0.01049939, -0.2205275, 2.682388, 0, 1, 0.9215686, 1,
0.01183611, -0.2342049, 2.208807, 0, 1, 0.9294118, 1,
0.0118539, 3.221923, -0.9552426, 0, 1, 0.9333333, 1,
0.01300632, 1.199661, 0.2939182, 0, 1, 0.9411765, 1,
0.01723679, -0.3058098, 4.162623, 0, 1, 0.945098, 1,
0.01971309, 1.695647, -0.2414853, 0, 1, 0.9529412, 1,
0.02423202, -0.2093413, 3.743495, 0, 1, 0.9568627, 1,
0.03177853, 1.573528, -0.6496695, 0, 1, 0.9647059, 1,
0.0318815, 1.181156, -1.848639, 0, 1, 0.9686275, 1,
0.03546122, 0.389744, 0.2682393, 0, 1, 0.9764706, 1,
0.03547448, -1.483322, 4.486862, 0, 1, 0.9803922, 1,
0.03553703, 0.07002902, 1.50986, 0, 1, 0.9882353, 1,
0.03617527, -1.173322, 1.913688, 0, 1, 0.9921569, 1,
0.04249036, -0.06381255, 0.394419, 0, 1, 1, 1,
0.0428484, -0.9779813, 4.267632, 0, 0.9921569, 1, 1,
0.04486243, -1.442552, 2.466832, 0, 0.9882353, 1, 1,
0.0479166, 0.7224659, -0.581587, 0, 0.9803922, 1, 1,
0.04811414, 1.447566, -1.241539, 0, 0.9764706, 1, 1,
0.05574316, 1.057881, 1.487737, 0, 0.9686275, 1, 1,
0.06002226, -0.1675944, 2.214277, 0, 0.9647059, 1, 1,
0.06321781, 0.2903538, 0.6565456, 0, 0.9568627, 1, 1,
0.06715447, -0.4545956, 2.506234, 0, 0.9529412, 1, 1,
0.0685415, 0.06543373, 1.438985, 0, 0.945098, 1, 1,
0.07083908, -0.8656676, 2.639363, 0, 0.9411765, 1, 1,
0.07817556, -0.1446463, 3.578253, 0, 0.9333333, 1, 1,
0.0855306, -0.1608039, 1.554513, 0, 0.9294118, 1, 1,
0.0858053, -0.4268043, 3.278706, 0, 0.9215686, 1, 1,
0.08717914, -0.3103486, 3.718272, 0, 0.9176471, 1, 1,
0.09231688, -0.3471399, 3.47753, 0, 0.9098039, 1, 1,
0.09391033, 0.3951557, 0.7161157, 0, 0.9058824, 1, 1,
0.09653942, -0.1910728, 1.795807, 0, 0.8980392, 1, 1,
0.09789243, -0.4100063, 2.492008, 0, 0.8901961, 1, 1,
0.0989486, -0.3604438, 2.350558, 0, 0.8862745, 1, 1,
0.1005401, -0.6937363, 1.552796, 0, 0.8784314, 1, 1,
0.1011496, -0.1063258, 3.824066, 0, 0.8745098, 1, 1,
0.1129891, 0.3329429, 1.0668, 0, 0.8666667, 1, 1,
0.1135942, 1.077578, -1.188636, 0, 0.8627451, 1, 1,
0.115297, 0.05489672, 1.290086, 0, 0.854902, 1, 1,
0.1153092, 0.2044854, 0.7932689, 0, 0.8509804, 1, 1,
0.1167236, -1.715151, 3.170931, 0, 0.8431373, 1, 1,
0.1179259, 0.254989, 0.07282914, 0, 0.8392157, 1, 1,
0.118505, 0.1122635, 0.09533314, 0, 0.8313726, 1, 1,
0.128816, 0.7481377, -0.07695752, 0, 0.827451, 1, 1,
0.1363134, -0.0942734, 3.411437, 0, 0.8196079, 1, 1,
0.1373112, 0.5414084, 0.2156352, 0, 0.8156863, 1, 1,
0.1377283, 0.0774489, 2.70827, 0, 0.8078431, 1, 1,
0.1423852, 1.208243, 0.4828499, 0, 0.8039216, 1, 1,
0.1459183, -1.096552, 2.712506, 0, 0.7960784, 1, 1,
0.1494697, -2.059821, 2.90373, 0, 0.7882353, 1, 1,
0.1520729, 1.787875, 0.7930635, 0, 0.7843137, 1, 1,
0.1535469, -1.166604, 3.501332, 0, 0.7764706, 1, 1,
0.1592654, -1.195291, 4.37825, 0, 0.772549, 1, 1,
0.1638082, -0.6804187, 2.786655, 0, 0.7647059, 1, 1,
0.164752, -0.8002415, 2.689831, 0, 0.7607843, 1, 1,
0.164888, -0.4101677, -0.01510598, 0, 0.7529412, 1, 1,
0.1650387, 0.05893645, 1.720806, 0, 0.7490196, 1, 1,
0.1669448, 1.093185, 0.0555896, 0, 0.7411765, 1, 1,
0.1683068, 0.2379982, -0.5156232, 0, 0.7372549, 1, 1,
0.1700713, 1.193694, 0.8439619, 0, 0.7294118, 1, 1,
0.1712121, -0.01998303, -0.3798675, 0, 0.7254902, 1, 1,
0.1729645, 0.1364088, -1.095822, 0, 0.7176471, 1, 1,
0.1739209, -0.6971651, 2.981222, 0, 0.7137255, 1, 1,
0.1740573, -1.159612, 2.898257, 0, 0.7058824, 1, 1,
0.1778915, 0.7583287, 0.6364356, 0, 0.6980392, 1, 1,
0.1782458, 1.457592, -0.386769, 0, 0.6941177, 1, 1,
0.1802715, 1.104537, -0.8480664, 0, 0.6862745, 1, 1,
0.180814, -1.174182, 4.117766, 0, 0.682353, 1, 1,
0.1838548, -1.032094, 3.791749, 0, 0.6745098, 1, 1,
0.1887282, -0.2943125, 2.420019, 0, 0.6705883, 1, 1,
0.1916966, 0.7087389, -0.2240058, 0, 0.6627451, 1, 1,
0.197501, 0.2995767, 0.8250595, 0, 0.6588235, 1, 1,
0.2016711, 0.2585466, 1.741566, 0, 0.6509804, 1, 1,
0.2051319, 1.723325, -0.239385, 0, 0.6470588, 1, 1,
0.2076476, 1.311197, -1.367663, 0, 0.6392157, 1, 1,
0.2092288, -1.775781, 2.758614, 0, 0.6352941, 1, 1,
0.2130721, 0.2790638, 0.4362015, 0, 0.627451, 1, 1,
0.215931, -1.424132, 3.444766, 0, 0.6235294, 1, 1,
0.2218881, -1.449092, 1.556655, 0, 0.6156863, 1, 1,
0.2284408, 0.6050333, -1.508283, 0, 0.6117647, 1, 1,
0.2296436, -2.145256, 0.8754851, 0, 0.6039216, 1, 1,
0.2322859, 0.09713672, 3.293028, 0, 0.5960785, 1, 1,
0.2325336, 1.967921, 1.440511, 0, 0.5921569, 1, 1,
0.2376736, -0.2272226, 2.748188, 0, 0.5843138, 1, 1,
0.2394882, 0.1134711, 0.256591, 0, 0.5803922, 1, 1,
0.2409637, 0.9557363, -0.7331228, 0, 0.572549, 1, 1,
0.2416153, 0.2388989, 1.953245, 0, 0.5686275, 1, 1,
0.2439028, -2.030658, 1.887303, 0, 0.5607843, 1, 1,
0.2469684, 0.3941549, 0.09651864, 0, 0.5568628, 1, 1,
0.2475706, 1.328869, -0.5069759, 0, 0.5490196, 1, 1,
0.251682, 0.5045136, 0.1308394, 0, 0.5450981, 1, 1,
0.252363, 0.583485, 0.3640225, 0, 0.5372549, 1, 1,
0.2535445, -1.490605, 2.489604, 0, 0.5333334, 1, 1,
0.2545193, 0.8687276, 0.484612, 0, 0.5254902, 1, 1,
0.2547009, -0.09101808, 2.54506, 0, 0.5215687, 1, 1,
0.256299, -0.6688128, 0.6344693, 0, 0.5137255, 1, 1,
0.2604127, 0.6747081, -0.06632237, 0, 0.509804, 1, 1,
0.2606727, 0.3026672, 1.565642, 0, 0.5019608, 1, 1,
0.2634497, 0.006676067, 1.741128, 0, 0.4941176, 1, 1,
0.2664525, 1.017058, -0.07806801, 0, 0.4901961, 1, 1,
0.2683251, 0.9026642, 1.490438, 0, 0.4823529, 1, 1,
0.2768199, 0.9754443, 0.5139491, 0, 0.4784314, 1, 1,
0.2783139, -0.7037819, 3.529316, 0, 0.4705882, 1, 1,
0.2785071, 0.3968005, 0.6117419, 0, 0.4666667, 1, 1,
0.2791052, 2.010025, 0.3497426, 0, 0.4588235, 1, 1,
0.2801899, 1.073382, 1.297432, 0, 0.454902, 1, 1,
0.2826849, -1.389725, 4.359816, 0, 0.4470588, 1, 1,
0.2838112, 1.576823, 1.434276, 0, 0.4431373, 1, 1,
0.2849229, -0.204033, 2.82292, 0, 0.4352941, 1, 1,
0.2852809, -0.427912, 3.044615, 0, 0.4313726, 1, 1,
0.2964853, -2.068094, 1.993409, 0, 0.4235294, 1, 1,
0.2986801, -0.1532751, 3.103542, 0, 0.4196078, 1, 1,
0.2991239, 0.9154016, 0.4681938, 0, 0.4117647, 1, 1,
0.2991742, -0.2632936, 1.827571, 0, 0.4078431, 1, 1,
0.303985, -0.6647493, 0.5582271, 0, 0.4, 1, 1,
0.3081137, 2.462578, 0.4695565, 0, 0.3921569, 1, 1,
0.3125195, 0.978216, -0.2724599, 0, 0.3882353, 1, 1,
0.3177344, 0.3231294, 0.8273427, 0, 0.3803922, 1, 1,
0.3205379, 0.09445797, -0.5619811, 0, 0.3764706, 1, 1,
0.3235627, -0.2236704, 1.776197, 0, 0.3686275, 1, 1,
0.3265234, 0.2317399, -0.5523887, 0, 0.3647059, 1, 1,
0.3329192, 0.2607982, 0.896866, 0, 0.3568628, 1, 1,
0.3378279, -1.098866, 3.691367, 0, 0.3529412, 1, 1,
0.3474091, 1.128623, 2.070385, 0, 0.345098, 1, 1,
0.3482489, 0.3504864, 1.881607, 0, 0.3411765, 1, 1,
0.3482518, -0.04682239, 2.509133, 0, 0.3333333, 1, 1,
0.3487387, 0.5809854, -1.774581, 0, 0.3294118, 1, 1,
0.3514965, 0.03273349, 1.647848, 0, 0.3215686, 1, 1,
0.3515659, -0.171738, 0.3526223, 0, 0.3176471, 1, 1,
0.3543465, -0.7473534, 3.021624, 0, 0.3098039, 1, 1,
0.3558062, 0.5446209, 1.774213, 0, 0.3058824, 1, 1,
0.3563868, 0.7416451, -0.1619052, 0, 0.2980392, 1, 1,
0.358522, 1.77297, 0.9373739, 0, 0.2901961, 1, 1,
0.3609128, -0.3161691, 4.037531, 0, 0.2862745, 1, 1,
0.3634422, 1.155564, 0.2057436, 0, 0.2784314, 1, 1,
0.364984, -0.0351652, 1.18844, 0, 0.2745098, 1, 1,
0.3660858, -1.512106, 4.461573, 0, 0.2666667, 1, 1,
0.3695705, -0.4555879, 2.903195, 0, 0.2627451, 1, 1,
0.3722018, -1.069452, 3.313467, 0, 0.254902, 1, 1,
0.3741545, -0.9376494, 2.391961, 0, 0.2509804, 1, 1,
0.3762512, 0.3778999, 2.562379, 0, 0.2431373, 1, 1,
0.3763925, 2.188695, 0.4520995, 0, 0.2392157, 1, 1,
0.3772707, 0.6041577, -0.3233213, 0, 0.2313726, 1, 1,
0.3807968, -1.927795, 4.63775, 0, 0.227451, 1, 1,
0.3839585, 0.7761667, 0.5169109, 0, 0.2196078, 1, 1,
0.385201, 0.5471956, 1.580058, 0, 0.2156863, 1, 1,
0.3858118, 1.467246, 0.2447158, 0, 0.2078431, 1, 1,
0.3866563, -0.03576523, -1.099701, 0, 0.2039216, 1, 1,
0.3888912, 1.223153, 1.217681, 0, 0.1960784, 1, 1,
0.3914528, -2.312395, 3.295147, 0, 0.1882353, 1, 1,
0.3957401, 0.05304973, 0.4559873, 0, 0.1843137, 1, 1,
0.3978855, -0.9292128, 2.748664, 0, 0.1764706, 1, 1,
0.3982544, -1.360135, 1.381384, 0, 0.172549, 1, 1,
0.3989848, -0.5646323, 2.220154, 0, 0.1647059, 1, 1,
0.4000871, 0.1999711, -0.8212192, 0, 0.1607843, 1, 1,
0.4012064, 0.6926706, 0.5681446, 0, 0.1529412, 1, 1,
0.4079238, 1.109172, 2.08415, 0, 0.1490196, 1, 1,
0.4087854, 1.008153, 1.112887, 0, 0.1411765, 1, 1,
0.409991, -0.1524317, -0.3561088, 0, 0.1372549, 1, 1,
0.4137243, 0.6510071, -1.084456, 0, 0.1294118, 1, 1,
0.4291568, -0.6479307, 3.631474, 0, 0.1254902, 1, 1,
0.4318342, -1.69466, 4.19861, 0, 0.1176471, 1, 1,
0.4319602, -0.760731, 3.123762, 0, 0.1137255, 1, 1,
0.4337549, 0.3076065, 1.030743, 0, 0.1058824, 1, 1,
0.4362153, 0.2008478, 1.177604, 0, 0.09803922, 1, 1,
0.4399896, 0.04294842, 1.081043, 0, 0.09411765, 1, 1,
0.4402326, -0.7970382, 3.010939, 0, 0.08627451, 1, 1,
0.4404023, -2.029007, 3.04271, 0, 0.08235294, 1, 1,
0.4420017, -0.2545382, 0.87712, 0, 0.07450981, 1, 1,
0.4441462, -0.3812819, 1.81772, 0, 0.07058824, 1, 1,
0.446408, -0.4403196, 3.223742, 0, 0.0627451, 1, 1,
0.4531328, -0.3044915, 1.733122, 0, 0.05882353, 1, 1,
0.4553298, -0.06287299, 0.5466796, 0, 0.05098039, 1, 1,
0.4612244, -0.4333565, 2.427952, 0, 0.04705882, 1, 1,
0.4646486, -0.8486293, 0.8166909, 0, 0.03921569, 1, 1,
0.4682519, -0.9642219, 1.621023, 0, 0.03529412, 1, 1,
0.4715414, -0.5244139, 4.49901, 0, 0.02745098, 1, 1,
0.4731345, -0.6238349, 1.621917, 0, 0.02352941, 1, 1,
0.4750124, -0.9465957, 0.5535737, 0, 0.01568628, 1, 1,
0.4768544, -0.7749031, 1.534949, 0, 0.01176471, 1, 1,
0.4770001, 0.1172888, -0.4504751, 0, 0.003921569, 1, 1,
0.4861932, 0.1740181, 0.4479979, 0.003921569, 0, 1, 1,
0.4886987, -0.296382, 3.170441, 0.007843138, 0, 1, 1,
0.488944, 0.4558292, 0.7372907, 0.01568628, 0, 1, 1,
0.4907058, -0.4575767, 1.328569, 0.01960784, 0, 1, 1,
0.4912066, -0.6120566, 3.344927, 0.02745098, 0, 1, 1,
0.5000123, 0.5119408, 1.865946, 0.03137255, 0, 1, 1,
0.5056039, -0.308187, 2.376328, 0.03921569, 0, 1, 1,
0.5088674, 0.7175853, 1.614694, 0.04313726, 0, 1, 1,
0.5197288, -0.7425776, 2.705844, 0.05098039, 0, 1, 1,
0.520717, -1.085615, 2.512688, 0.05490196, 0, 1, 1,
0.5244321, 1.523477, 1.068656, 0.0627451, 0, 1, 1,
0.5276924, -1.423875, 2.289855, 0.06666667, 0, 1, 1,
0.5312923, 0.9013055, 0.07265243, 0.07450981, 0, 1, 1,
0.5342042, 0.144111, 0.531678, 0.07843138, 0, 1, 1,
0.5372228, -1.147489, 0.7715437, 0.08627451, 0, 1, 1,
0.5382101, -0.9539505, 2.390217, 0.09019608, 0, 1, 1,
0.538448, -0.4600113, 4.325546, 0.09803922, 0, 1, 1,
0.5439342, -1.499096, 3.407237, 0.1058824, 0, 1, 1,
0.5448942, 1.070693, 1.902967, 0.1098039, 0, 1, 1,
0.5487691, -0.6437156, 1.51789, 0.1176471, 0, 1, 1,
0.5512654, -0.824921, 3.100515, 0.1215686, 0, 1, 1,
0.551271, 0.157541, 0.0939326, 0.1294118, 0, 1, 1,
0.5515686, -1.035927, 2.699558, 0.1333333, 0, 1, 1,
0.553678, -0.6477821, 0.4814629, 0.1411765, 0, 1, 1,
0.5539562, 0.6481334, 1.335825, 0.145098, 0, 1, 1,
0.56142, -2.487158, 3.363315, 0.1529412, 0, 1, 1,
0.56734, 1.896005, -0.1146019, 0.1568628, 0, 1, 1,
0.5678699, 0.8509012, -0.7980906, 0.1647059, 0, 1, 1,
0.5706478, -0.84527, -0.4052599, 0.1686275, 0, 1, 1,
0.571897, -0.02462766, 1.461975, 0.1764706, 0, 1, 1,
0.5719187, -1.204202, 3.247522, 0.1803922, 0, 1, 1,
0.5740896, 1.021386, 1.698049, 0.1882353, 0, 1, 1,
0.5786956, -0.4482198, 2.744467, 0.1921569, 0, 1, 1,
0.5798733, 0.1447786, -0.4550876, 0.2, 0, 1, 1,
0.5883515, 0.2452971, 2.083911, 0.2078431, 0, 1, 1,
0.5920517, -1.471566, 4.761356, 0.2117647, 0, 1, 1,
0.5987456, -1.134414, 3.124795, 0.2196078, 0, 1, 1,
0.6012697, 0.9194114, 0.3704681, 0.2235294, 0, 1, 1,
0.605326, 0.9890187, 0.1745863, 0.2313726, 0, 1, 1,
0.6080377, -1.597279, 3.15941, 0.2352941, 0, 1, 1,
0.61049, 0.4493946, 1.448244, 0.2431373, 0, 1, 1,
0.6111855, -1.096264, 4.017326, 0.2470588, 0, 1, 1,
0.611579, -0.02556643, -0.01568808, 0.254902, 0, 1, 1,
0.6125484, 1.687626, 1.08543, 0.2588235, 0, 1, 1,
0.6158413, 0.8435275, 1.424983, 0.2666667, 0, 1, 1,
0.6162922, -0.5428647, 2.333039, 0.2705882, 0, 1, 1,
0.6180601, 0.3588976, 0.5663964, 0.2784314, 0, 1, 1,
0.6181017, 0.3642781, -1.087167, 0.282353, 0, 1, 1,
0.6209671, -0.3210598, 2.119461, 0.2901961, 0, 1, 1,
0.62277, 0.8565301, 1.367085, 0.2941177, 0, 1, 1,
0.6268851, -0.3981237, 1.508433, 0.3019608, 0, 1, 1,
0.6281661, 1.923028, -1.889725, 0.3098039, 0, 1, 1,
0.6310152, -0.3665703, 1.252544, 0.3137255, 0, 1, 1,
0.6337845, 0.05256121, 2.94656, 0.3215686, 0, 1, 1,
0.6341503, 0.3201146, 1.125028, 0.3254902, 0, 1, 1,
0.6348155, 0.8631365, 1.035895, 0.3333333, 0, 1, 1,
0.6404135, 1.008797, -0.9582915, 0.3372549, 0, 1, 1,
0.6428, -0.4787432, 0.1573513, 0.345098, 0, 1, 1,
0.64666, 1.49966, -0.2065714, 0.3490196, 0, 1, 1,
0.6480658, -0.3857356, 2.415436, 0.3568628, 0, 1, 1,
0.6494119, 0.2785151, 0.2614311, 0.3607843, 0, 1, 1,
0.6541852, 0.3421824, 0.1259588, 0.3686275, 0, 1, 1,
0.6623193, -0.2901994, 0.7312874, 0.372549, 0, 1, 1,
0.6638599, 1.407897, -0.6195421, 0.3803922, 0, 1, 1,
0.6661271, 0.3940195, 0.9514441, 0.3843137, 0, 1, 1,
0.668746, 0.4844872, 0.01247123, 0.3921569, 0, 1, 1,
0.6740239, -0.2011125, 1.41033, 0.3960784, 0, 1, 1,
0.6766745, 0.03406528, 3.979707, 0.4039216, 0, 1, 1,
0.6768562, 1.114163, 0.5908441, 0.4117647, 0, 1, 1,
0.6816502, 1.681556, 1.539937, 0.4156863, 0, 1, 1,
0.6817621, -0.4164751, 0.1248735, 0.4235294, 0, 1, 1,
0.6849067, -0.8526838, 2.466642, 0.427451, 0, 1, 1,
0.6882099, -0.9653193, 2.632275, 0.4352941, 0, 1, 1,
0.6916963, -0.3860877, 0.9955428, 0.4392157, 0, 1, 1,
0.6937868, -1.055396, 3.05896, 0.4470588, 0, 1, 1,
0.6940641, -0.9153574, 2.315675, 0.4509804, 0, 1, 1,
0.7004412, -0.05746125, 3.050091, 0.4588235, 0, 1, 1,
0.7025892, 0.05508763, 1.50429, 0.4627451, 0, 1, 1,
0.703693, -1.677864, 2.472501, 0.4705882, 0, 1, 1,
0.7056341, -2.229976, 3.333704, 0.4745098, 0, 1, 1,
0.7122658, 0.9826919, 0.377892, 0.4823529, 0, 1, 1,
0.7162426, -0.0140052, 2.008289, 0.4862745, 0, 1, 1,
0.7181101, -0.02904403, 2.602324, 0.4941176, 0, 1, 1,
0.7233574, -1.642962, 3.876267, 0.5019608, 0, 1, 1,
0.7248834, -1.417977, 2.944701, 0.5058824, 0, 1, 1,
0.7314127, 0.5053917, 2.149944, 0.5137255, 0, 1, 1,
0.7340721, -0.4713887, 2.39726, 0.5176471, 0, 1, 1,
0.7375175, 0.1489557, 3.151136, 0.5254902, 0, 1, 1,
0.7390288, 0.06737695, 1.184778, 0.5294118, 0, 1, 1,
0.745194, -0.8899459, 0.6793499, 0.5372549, 0, 1, 1,
0.7548111, -1.163578, 4.322269, 0.5411765, 0, 1, 1,
0.7606733, 0.6552333, 1.033316, 0.5490196, 0, 1, 1,
0.7619517, -0.3373467, 0.913183, 0.5529412, 0, 1, 1,
0.7627878, 0.3598764, 0.6149604, 0.5607843, 0, 1, 1,
0.7645244, -0.08034101, 1.380615, 0.5647059, 0, 1, 1,
0.7696222, -1.517788, 1.395127, 0.572549, 0, 1, 1,
0.7863289, -2.494901, 3.708623, 0.5764706, 0, 1, 1,
0.7863469, 0.8368239, 1.458472, 0.5843138, 0, 1, 1,
0.7892737, -0.9008822, 2.434842, 0.5882353, 0, 1, 1,
0.7897142, 0.9230494, 0.5719989, 0.5960785, 0, 1, 1,
0.790153, 1.422446, 1.216939, 0.6039216, 0, 1, 1,
0.8018121, -0.8693298, 3.689595, 0.6078432, 0, 1, 1,
0.8025467, 0.1505814, 1.147036, 0.6156863, 0, 1, 1,
0.8088403, -0.2857109, 1.570988, 0.6196079, 0, 1, 1,
0.809283, -2.106597, 2.347053, 0.627451, 0, 1, 1,
0.8098881, -0.1447033, 2.529023, 0.6313726, 0, 1, 1,
0.8130641, 1.14859, 1.041066, 0.6392157, 0, 1, 1,
0.821404, 2.045549, 0.9613926, 0.6431373, 0, 1, 1,
0.8264284, 0.3541031, 1.002784, 0.6509804, 0, 1, 1,
0.8306091, 0.5354719, 0.7339555, 0.654902, 0, 1, 1,
0.832569, -0.3655414, 2.758708, 0.6627451, 0, 1, 1,
0.832664, -0.2699382, 0.2732205, 0.6666667, 0, 1, 1,
0.8367626, -1.155186, 2.649388, 0.6745098, 0, 1, 1,
0.8399256, -2.697748, 3.689359, 0.6784314, 0, 1, 1,
0.8399306, 1.185119, -0.513666, 0.6862745, 0, 1, 1,
0.8472083, 0.8784307, 1.667481, 0.6901961, 0, 1, 1,
0.849565, -0.9078907, 3.558449, 0.6980392, 0, 1, 1,
0.8530964, -0.5553133, 1.631932, 0.7058824, 0, 1, 1,
0.854373, 0.979055, 0.005937453, 0.7098039, 0, 1, 1,
0.8557972, -0.3697225, 2.631346, 0.7176471, 0, 1, 1,
0.8615504, -0.9509656, 2.967413, 0.7215686, 0, 1, 1,
0.8622156, -1.253256, 1.754557, 0.7294118, 0, 1, 1,
0.8689854, -0.1357397, 2.333684, 0.7333333, 0, 1, 1,
0.8743464, 0.2968054, 0.873201, 0.7411765, 0, 1, 1,
0.8760451, -0.545369, 1.339799, 0.7450981, 0, 1, 1,
0.8764855, 2.080602, 1.204581, 0.7529412, 0, 1, 1,
0.8772081, 1.055202, -0.9813421, 0.7568628, 0, 1, 1,
0.8789836, -0.1380603, 2.048235, 0.7647059, 0, 1, 1,
0.8882322, 1.121584, 0.4879101, 0.7686275, 0, 1, 1,
0.890897, 0.3178472, -0.6453145, 0.7764706, 0, 1, 1,
0.8925539, 0.03498623, 0.7266592, 0.7803922, 0, 1, 1,
0.8960019, 0.8786345, 0.5512137, 0.7882353, 0, 1, 1,
0.8977951, -1.010468, 2.434994, 0.7921569, 0, 1, 1,
0.8980833, -0.8994728, 1.344247, 0.8, 0, 1, 1,
0.9012177, 0.4822628, 0.9632401, 0.8078431, 0, 1, 1,
0.9030921, -0.3321985, 2.872846, 0.8117647, 0, 1, 1,
0.9041308, -1.248982, 2.396012, 0.8196079, 0, 1, 1,
0.9058312, -0.7464767, 1.684133, 0.8235294, 0, 1, 1,
0.90608, -1.750779, 1.453859, 0.8313726, 0, 1, 1,
0.9123608, 1.469782, 0.5183701, 0.8352941, 0, 1, 1,
0.9249368, 0.2698891, 0.5750877, 0.8431373, 0, 1, 1,
0.9266306, 1.674135, 1.425227, 0.8470588, 0, 1, 1,
0.9266325, 0.1412892, 0.4339954, 0.854902, 0, 1, 1,
0.9272338, -0.4720949, 1.363933, 0.8588235, 0, 1, 1,
0.9293652, 0.4053226, 2.198663, 0.8666667, 0, 1, 1,
0.9380381, -1.575852, 1.792018, 0.8705882, 0, 1, 1,
0.9394021, 0.341073, 1.49043, 0.8784314, 0, 1, 1,
0.9400167, -1.453174, 5.795701, 0.8823529, 0, 1, 1,
0.9407995, -0.3026459, 2.198415, 0.8901961, 0, 1, 1,
0.9421819, 0.3329121, -0.1034551, 0.8941177, 0, 1, 1,
0.9434091, 0.4144452, 2.613295, 0.9019608, 0, 1, 1,
0.9510823, 1.13401, 0.6829533, 0.9098039, 0, 1, 1,
0.9513933, 0.9700803, 0.270954, 0.9137255, 0, 1, 1,
0.9541482, -1.078932, 0.2968927, 0.9215686, 0, 1, 1,
0.9552183, 0.3036203, 2.557446, 0.9254902, 0, 1, 1,
0.9565511, -2.224755, 1.871421, 0.9333333, 0, 1, 1,
0.9572452, -0.3175989, 3.646162, 0.9372549, 0, 1, 1,
0.9626253, -0.726458, 1.672936, 0.945098, 0, 1, 1,
0.9650185, 0.9327174, 2.545887, 0.9490196, 0, 1, 1,
0.9697052, -1.005674, 1.097188, 0.9568627, 0, 1, 1,
0.9726199, -0.8545539, 4.263055, 0.9607843, 0, 1, 1,
0.9736432, -0.8000122, 1.88185, 0.9686275, 0, 1, 1,
0.9756861, -2.624412, 4.104022, 0.972549, 0, 1, 1,
0.9776919, 0.716186, 2.511019, 0.9803922, 0, 1, 1,
0.9877177, -0.4794131, 0.4661133, 0.9843137, 0, 1, 1,
0.9884218, -0.7876984, 1.938292, 0.9921569, 0, 1, 1,
0.9900967, -0.6246992, 2.773012, 0.9960784, 0, 1, 1,
0.9942781, -0.439838, 2.456368, 1, 0, 0.9960784, 1,
0.9947957, 0.4912152, 0.4335174, 1, 0, 0.9882353, 1,
0.9954637, -0.5549397, 1.252195, 1, 0, 0.9843137, 1,
0.9984996, 1.524318, 0.5280185, 1, 0, 0.9764706, 1,
0.9994103, 0.6144878, 1.201474, 1, 0, 0.972549, 1,
1.011476, -0.1089326, 0.3274541, 1, 0, 0.9647059, 1,
1.022724, -0.8857021, 3.849321, 1, 0, 0.9607843, 1,
1.023917, -0.4354724, 1.399467, 1, 0, 0.9529412, 1,
1.027296, 0.02513737, 3.713209, 1, 0, 0.9490196, 1,
1.028817, 0.9018967, 1.233907, 1, 0, 0.9411765, 1,
1.029032, -0.5083672, 2.511154, 1, 0, 0.9372549, 1,
1.032328, -0.1437733, 0.03180281, 1, 0, 0.9294118, 1,
1.032423, -1.330104, 2.496228, 1, 0, 0.9254902, 1,
1.032504, 0.1928409, 0.5056514, 1, 0, 0.9176471, 1,
1.034947, -0.9203162, 2.295847, 1, 0, 0.9137255, 1,
1.035748, -0.2161199, 2.171195, 1, 0, 0.9058824, 1,
1.038169, 0.7844329, 0.9672719, 1, 0, 0.9019608, 1,
1.0399, 1.314906, 3.387994, 1, 0, 0.8941177, 1,
1.044131, -0.1913503, 2.017042, 1, 0, 0.8862745, 1,
1.045066, -1.205639, 3.210541, 1, 0, 0.8823529, 1,
1.052106, -0.9259888, 2.476427, 1, 0, 0.8745098, 1,
1.057825, -1.347723, 1.967178, 1, 0, 0.8705882, 1,
1.061454, 0.4133047, 0.2757894, 1, 0, 0.8627451, 1,
1.064654, 0.8202715, 0.4936437, 1, 0, 0.8588235, 1,
1.067411, -1.261501, -1.129632, 1, 0, 0.8509804, 1,
1.067424, 0.6188734, 0.6644908, 1, 0, 0.8470588, 1,
1.076568, 0.2830044, 0.1122894, 1, 0, 0.8392157, 1,
1.079242, -1.37673, 3.093562, 1, 0, 0.8352941, 1,
1.085929, 0.3915371, 1.378035, 1, 0, 0.827451, 1,
1.086043, -0.6107985, 1.013223, 1, 0, 0.8235294, 1,
1.090698, 0.740447, -1.265236, 1, 0, 0.8156863, 1,
1.092697, 0.167904, 0.6466466, 1, 0, 0.8117647, 1,
1.098028, -0.7106359, 3.194076, 1, 0, 0.8039216, 1,
1.102686, 0.9585643, 2.744846, 1, 0, 0.7960784, 1,
1.109236, 0.6568083, 1.180564, 1, 0, 0.7921569, 1,
1.112092, 1.974781, 0.4718127, 1, 0, 0.7843137, 1,
1.112768, 0.7407484, 0.2262075, 1, 0, 0.7803922, 1,
1.118431, 1.838978, -1.236666, 1, 0, 0.772549, 1,
1.118901, -0.1715337, 1.435541, 1, 0, 0.7686275, 1,
1.129821, -1.423632, 3.036419, 1, 0, 0.7607843, 1,
1.161003, 0.600324, -0.8149646, 1, 0, 0.7568628, 1,
1.177206, 0.5450668, -0.3740871, 1, 0, 0.7490196, 1,
1.178395, -2.576711, 3.49022, 1, 0, 0.7450981, 1,
1.179111, 2.243073, 0.8619564, 1, 0, 0.7372549, 1,
1.180033, -0.03457723, 1.131094, 1, 0, 0.7333333, 1,
1.184182, -0.1444085, 0.9263129, 1, 0, 0.7254902, 1,
1.186176, -0.4052937, 1.955855, 1, 0, 0.7215686, 1,
1.18743, -0.2458392, 2.501817, 1, 0, 0.7137255, 1,
1.191095, -0.3965909, 1.111833, 1, 0, 0.7098039, 1,
1.193313, -0.3557359, 2.086107, 1, 0, 0.7019608, 1,
1.196474, 0.5394899, 2.873748, 1, 0, 0.6941177, 1,
1.199791, -0.7192798, 2.529479, 1, 0, 0.6901961, 1,
1.205396, 0.7220406, 1.653088, 1, 0, 0.682353, 1,
1.213493, 1.870887, 0.5891979, 1, 0, 0.6784314, 1,
1.217203, 0.6268557, 1.750254, 1, 0, 0.6705883, 1,
1.228077, -3.237403, 3.709222, 1, 0, 0.6666667, 1,
1.229306, -1.047534, 1.91342, 1, 0, 0.6588235, 1,
1.230453, 0.1684361, 0.6787198, 1, 0, 0.654902, 1,
1.230769, 0.5755093, 0.2300627, 1, 0, 0.6470588, 1,
1.242764, 1.597017, 1.874767, 1, 0, 0.6431373, 1,
1.24299, 1.045124, 0.9647899, 1, 0, 0.6352941, 1,
1.245561, 0.1784033, 1.77305, 1, 0, 0.6313726, 1,
1.25524, 1.704328, -0.03869663, 1, 0, 0.6235294, 1,
1.257957, -0.5077103, 2.301461, 1, 0, 0.6196079, 1,
1.268596, 0.6761, -1.342694, 1, 0, 0.6117647, 1,
1.283725, 1.904222, 0.07841989, 1, 0, 0.6078432, 1,
1.286335, 1.168001, 0.7083429, 1, 0, 0.6, 1,
1.293529, 1.978587, 0.194141, 1, 0, 0.5921569, 1,
1.297269, -1.39836, 2.561005, 1, 0, 0.5882353, 1,
1.299025, -0.2939204, 1.808949, 1, 0, 0.5803922, 1,
1.308699, -1.151039, 1.699152, 1, 0, 0.5764706, 1,
1.310271, 1.639628, -0.3468632, 1, 0, 0.5686275, 1,
1.336739, -0.9415391, 3.396691, 1, 0, 0.5647059, 1,
1.34723, -0.3567483, 0.5996266, 1, 0, 0.5568628, 1,
1.3547, -2.452597, 1.113032, 1, 0, 0.5529412, 1,
1.355103, -0.574314, 1.681591, 1, 0, 0.5450981, 1,
1.355667, 0.1611053, 0.4090231, 1, 0, 0.5411765, 1,
1.359412, -0.07761538, 0.3973953, 1, 0, 0.5333334, 1,
1.36092, 0.0788964, 1.779256, 1, 0, 0.5294118, 1,
1.36999, -0.5227835, 1.465549, 1, 0, 0.5215687, 1,
1.373413, 1.407472, 1.324709, 1, 0, 0.5176471, 1,
1.375959, 1.654783, 0.580628, 1, 0, 0.509804, 1,
1.378283, -0.4305089, 0.623368, 1, 0, 0.5058824, 1,
1.389509, 1.508832, 0.8765774, 1, 0, 0.4980392, 1,
1.389701, -0.4402245, 0.1968364, 1, 0, 0.4901961, 1,
1.390396, -0.7442279, 3.041871, 1, 0, 0.4862745, 1,
1.391956, -0.597065, 3.075639, 1, 0, 0.4784314, 1,
1.394908, -1.937358, 2.962999, 1, 0, 0.4745098, 1,
1.395056, 0.9041067, 1.264202, 1, 0, 0.4666667, 1,
1.401527, 0.6969975, 0.3158517, 1, 0, 0.4627451, 1,
1.410876, 0.9852309, 2.458798, 1, 0, 0.454902, 1,
1.422256, 0.3625134, 3.159608, 1, 0, 0.4509804, 1,
1.440027, 0.08692317, 1.221004, 1, 0, 0.4431373, 1,
1.441986, -0.1753603, 2.300679, 1, 0, 0.4392157, 1,
1.44419, -0.4645744, 3.585667, 1, 0, 0.4313726, 1,
1.447448, -0.6717188, 2.779751, 1, 0, 0.427451, 1,
1.464831, 0.9998367, 1.370018, 1, 0, 0.4196078, 1,
1.465083, -0.1650384, 1.79553, 1, 0, 0.4156863, 1,
1.479366, -2.331803, 1.257538, 1, 0, 0.4078431, 1,
1.479728, 0.945712, 1.413759, 1, 0, 0.4039216, 1,
1.481046, -0.06422492, 0.1899758, 1, 0, 0.3960784, 1,
1.485044, 0.1429618, 2.103836, 1, 0, 0.3882353, 1,
1.510975, -1.4323, 3.84629, 1, 0, 0.3843137, 1,
1.518436, 1.351633, -0.4271458, 1, 0, 0.3764706, 1,
1.519547, 1.380231, 2.060764, 1, 0, 0.372549, 1,
1.524251, 1.493046, -0.2159029, 1, 0, 0.3647059, 1,
1.532495, -0.5632767, 1.774569, 1, 0, 0.3607843, 1,
1.543903, -0.6351926, 2.723736, 1, 0, 0.3529412, 1,
1.565177, -0.3086741, 2.655685, 1, 0, 0.3490196, 1,
1.565385, -0.1070853, 2.303723, 1, 0, 0.3411765, 1,
1.589104, -0.5361804, 0.265054, 1, 0, 0.3372549, 1,
1.590721, -0.744177, 2.527761, 1, 0, 0.3294118, 1,
1.597761, -0.5570204, 2.268929, 1, 0, 0.3254902, 1,
1.603097, 0.9878121, 0.9579486, 1, 0, 0.3176471, 1,
1.610079, -0.9354187, 2.40428, 1, 0, 0.3137255, 1,
1.610237, -0.9886259, 2.310313, 1, 0, 0.3058824, 1,
1.615206, 1.017116, 1.240073, 1, 0, 0.2980392, 1,
1.618569, 1.753074, 1.235068, 1, 0, 0.2941177, 1,
1.623628, -0.4421041, 2.247195, 1, 0, 0.2862745, 1,
1.63129, -0.05403339, 1.37567, 1, 0, 0.282353, 1,
1.658121, -1.232652, 1.848263, 1, 0, 0.2745098, 1,
1.66091, 1.0874, 0.2862888, 1, 0, 0.2705882, 1,
1.664873, -0.8935239, 1.524024, 1, 0, 0.2627451, 1,
1.666602, -0.6737008, 0.8768589, 1, 0, 0.2588235, 1,
1.691037, -1.328416, 2.369058, 1, 0, 0.2509804, 1,
1.705562, -0.3303999, 2.552509, 1, 0, 0.2470588, 1,
1.718331, -0.8932152, 3.075685, 1, 0, 0.2392157, 1,
1.752875, 1.160862, 1.211895, 1, 0, 0.2352941, 1,
1.75334, -0.4123846, 3.457926, 1, 0, 0.227451, 1,
1.755193, 0.2705685, 1.387723, 1, 0, 0.2235294, 1,
1.782518, -0.3548661, 1.435085, 1, 0, 0.2156863, 1,
1.807221, -0.2303865, 0.6841035, 1, 0, 0.2117647, 1,
1.809539, -0.0124534, 0.7858156, 1, 0, 0.2039216, 1,
1.81927, -2.02866, 2.199005, 1, 0, 0.1960784, 1,
1.847295, 0.4954521, -0.4781276, 1, 0, 0.1921569, 1,
1.848191, -0.5576842, 1.520168, 1, 0, 0.1843137, 1,
1.878427, -1.261749, 1.75641, 1, 0, 0.1803922, 1,
1.886189, -2.403099, 1.233793, 1, 0, 0.172549, 1,
1.890525, 1.733897, 2.750057, 1, 0, 0.1686275, 1,
1.918128, 0.1986756, 3.971919, 1, 0, 0.1607843, 1,
1.952414, 1.695905, 0.959353, 1, 0, 0.1568628, 1,
2.007601, 0.3552279, -0.8340772, 1, 0, 0.1490196, 1,
2.011505, -0.04922796, 1.25433, 1, 0, 0.145098, 1,
2.035859, -0.7134064, 0.07134174, 1, 0, 0.1372549, 1,
2.046232, 0.5093104, 0.7846041, 1, 0, 0.1333333, 1,
2.068025, 0.03800913, -0.417878, 1, 0, 0.1254902, 1,
2.142146, -0.4426721, 0.8699052, 1, 0, 0.1215686, 1,
2.193457, 0.02137573, -0.21661, 1, 0, 0.1137255, 1,
2.193798, 0.141623, 1.816212, 1, 0, 0.1098039, 1,
2.243478, 0.1627895, 1.810504, 1, 0, 0.1019608, 1,
2.272441, -2.332206, 3.14427, 1, 0, 0.09411765, 1,
2.364857, 0.9022269, -0.4940089, 1, 0, 0.09019608, 1,
2.403234, -1.718153, 1.230758, 1, 0, 0.08235294, 1,
2.484268, -0.6854227, 1.874135, 1, 0, 0.07843138, 1,
2.545913, -0.1556323, 3.048344, 1, 0, 0.07058824, 1,
2.556736, 1.131342, 0.1836212, 1, 0, 0.06666667, 1,
2.600694, -0.2957825, 2.612488, 1, 0, 0.05882353, 1,
2.632963, -1.475667, 2.369977, 1, 0, 0.05490196, 1,
2.638977, -0.2487883, 0.1113749, 1, 0, 0.04705882, 1,
2.656977, 1.800116, 1.683023, 1, 0, 0.04313726, 1,
2.756094, -1.616571, 2.766854, 1, 0, 0.03529412, 1,
2.779001, 0.02594841, 2.682897, 1, 0, 0.03137255, 1,
2.82147, 1.813862, 0.6717817, 1, 0, 0.02352941, 1,
2.856668, -0.4383675, 1.981654, 1, 0, 0.01960784, 1,
2.96307, 0.2497163, 1.609654, 1, 0, 0.01176471, 1,
3.042416, 0.8232827, 0.2018063, 1, 0, 0.007843138, 1
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
0.06642592, -4.579831, -7.007247, 0, -0.5, 0.5, 0.5,
0.06642592, -4.579831, -7.007247, 1, -0.5, 0.5, 0.5,
0.06642592, -4.579831, -7.007247, 1, 1.5, 0.5, 0.5,
0.06642592, -4.579831, -7.007247, 0, 1.5, 0.5, 0.5
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
-3.918424, -0.03718638, -7.007247, 0, -0.5, 0.5, 0.5,
-3.918424, -0.03718638, -7.007247, 1, -0.5, 0.5, 0.5,
-3.918424, -0.03718638, -7.007247, 1, 1.5, 0.5, 0.5,
-3.918424, -0.03718638, -7.007247, 0, 1.5, 0.5, 0.5
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
-3.918424, -4.579831, 0.322016, 0, -0.5, 0.5, 0.5,
-3.918424, -4.579831, 0.322016, 1, -0.5, 0.5, 0.5,
-3.918424, -4.579831, 0.322016, 1, 1.5, 0.5, 0.5,
-3.918424, -4.579831, 0.322016, 0, 1.5, 0.5, 0.5
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
-2, -3.531528, -5.315879,
3, -3.531528, -5.315879,
-2, -3.531528, -5.315879,
-2, -3.706245, -5.597774,
-1, -3.531528, -5.315879,
-1, -3.706245, -5.597774,
0, -3.531528, -5.315879,
0, -3.706245, -5.597774,
1, -3.531528, -5.315879,
1, -3.706245, -5.597774,
2, -3.531528, -5.315879,
2, -3.706245, -5.597774,
3, -3.531528, -5.315879,
3, -3.706245, -5.597774
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
-2, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
-2, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
-2, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
-2, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5,
-1, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
-1, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
-1, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
-1, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5,
0, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
0, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
0, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
0, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5,
1, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
1, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
1, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
1, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5,
2, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
2, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
2, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
2, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5,
3, -4.055679, -6.161563, 0, -0.5, 0.5, 0.5,
3, -4.055679, -6.161563, 1, -0.5, 0.5, 0.5,
3, -4.055679, -6.161563, 1, 1.5, 0.5, 0.5,
3, -4.055679, -6.161563, 0, 1.5, 0.5, 0.5
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
-2.998843, -3, -5.315879,
-2.998843, 3, -5.315879,
-2.998843, -3, -5.315879,
-3.152107, -3, -5.597774,
-2.998843, -2, -5.315879,
-3.152107, -2, -5.597774,
-2.998843, -1, -5.315879,
-3.152107, -1, -5.597774,
-2.998843, 0, -5.315879,
-3.152107, 0, -5.597774,
-2.998843, 1, -5.315879,
-3.152107, 1, -5.597774,
-2.998843, 2, -5.315879,
-3.152107, 2, -5.597774,
-2.998843, 3, -5.315879,
-3.152107, 3, -5.597774
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
-3.458634, -3, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, -3, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, -3, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, -3, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, -2, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, -2, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, -2, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, -2, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, -1, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, -1, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, -1, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, -1, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, 0, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, 0, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, 0, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, 0, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, 1, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, 1, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, 1, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, 1, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, 2, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, 2, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, 2, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, 2, -6.161563, 0, 1.5, 0.5, 0.5,
-3.458634, 3, -6.161563, 0, -0.5, 0.5, 0.5,
-3.458634, 3, -6.161563, 1, -0.5, 0.5, 0.5,
-3.458634, 3, -6.161563, 1, 1.5, 0.5, 0.5,
-3.458634, 3, -6.161563, 0, 1.5, 0.5, 0.5
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
-2.998843, -3.531528, -4,
-2.998843, -3.531528, 4,
-2.998843, -3.531528, -4,
-3.152107, -3.706245, -4,
-2.998843, -3.531528, -2,
-3.152107, -3.706245, -2,
-2.998843, -3.531528, 0,
-3.152107, -3.706245, 0,
-2.998843, -3.531528, 2,
-3.152107, -3.706245, 2,
-2.998843, -3.531528, 4,
-3.152107, -3.706245, 4
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
-3.458634, -4.055679, -4, 0, -0.5, 0.5, 0.5,
-3.458634, -4.055679, -4, 1, -0.5, 0.5, 0.5,
-3.458634, -4.055679, -4, 1, 1.5, 0.5, 0.5,
-3.458634, -4.055679, -4, 0, 1.5, 0.5, 0.5,
-3.458634, -4.055679, -2, 0, -0.5, 0.5, 0.5,
-3.458634, -4.055679, -2, 1, -0.5, 0.5, 0.5,
-3.458634, -4.055679, -2, 1, 1.5, 0.5, 0.5,
-3.458634, -4.055679, -2, 0, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 0, 0, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 0, 1, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 0, 1, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 0, 0, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 2, 0, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 2, 1, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 2, 1, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 2, 0, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 4, 0, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 4, 1, -0.5, 0.5, 0.5,
-3.458634, -4.055679, 4, 1, 1.5, 0.5, 0.5,
-3.458634, -4.055679, 4, 0, 1.5, 0.5, 0.5
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
-2.998843, -3.531528, -5.315879,
-2.998843, 3.457155, -5.315879,
-2.998843, -3.531528, 5.959911,
-2.998843, 3.457155, 5.959911,
-2.998843, -3.531528, -5.315879,
-2.998843, -3.531528, 5.959911,
-2.998843, 3.457155, -5.315879,
-2.998843, 3.457155, 5.959911,
-2.998843, -3.531528, -5.315879,
3.131695, -3.531528, -5.315879,
-2.998843, -3.531528, 5.959911,
3.131695, -3.531528, 5.959911,
-2.998843, 3.457155, -5.315879,
3.131695, 3.457155, -5.315879,
-2.998843, 3.457155, 5.959911,
3.131695, 3.457155, 5.959911,
3.131695, -3.531528, -5.315879,
3.131695, 3.457155, -5.315879,
3.131695, -3.531528, 5.959911,
3.131695, 3.457155, 5.959911,
3.131695, -3.531528, -5.315879,
3.131695, -3.531528, 5.959911,
3.131695, 3.457155, -5.315879,
3.131695, 3.457155, 5.959911
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
var radius = 7.803586;
var distance = 34.71904;
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
mvMatrix.translate( -0.06642592, 0.03718638, -0.322016 );
mvMatrix.scale( 1.376289, 1.207293, 0.7482748 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71904);
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
furethrin<-read.table("furethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
```

```r
y<-furethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
```

```r
z<-furethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'furethrin' not found
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
-2.909564, -0.1704799, -2.838115, 0, 0, 1, 1, 1,
-2.71414, 0.9151919, -3.948604, 1, 0, 0, 1, 1,
-2.683203, 1.672124, -1.399682, 1, 0, 0, 1, 1,
-2.661156, -1.792215, -2.083205, 1, 0, 0, 1, 1,
-2.657048, -0.593937, -0.8886431, 1, 0, 0, 1, 1,
-2.623115, -1.415514, -3.108049, 1, 0, 0, 1, 1,
-2.548588, 0.1713296, -3.072087, 0, 0, 0, 1, 1,
-2.528057, -0.5927194, -1.141215, 0, 0, 0, 1, 1,
-2.359566, 0.2227223, -2.516207, 0, 0, 0, 1, 1,
-2.359503, 0.2406514, -0.3586241, 0, 0, 0, 1, 1,
-2.208277, 1.558528, -2.538349, 0, 0, 0, 1, 1,
-2.185952, 2.797729, -0.4505146, 0, 0, 0, 1, 1,
-2.152885, 1.466922, -1.367304, 0, 0, 0, 1, 1,
-2.139194, -0.4783492, -0.631612, 1, 1, 1, 1, 1,
-2.129378, 1.416202, -2.803579, 1, 1, 1, 1, 1,
-2.090687, 0.005165579, -0.3208746, 1, 1, 1, 1, 1,
-2.078946, -1.265943, -2.554229, 1, 1, 1, 1, 1,
-2.076741, 1.266786, -0.7892527, 1, 1, 1, 1, 1,
-2.075522, -0.5631273, -2.201088, 1, 1, 1, 1, 1,
-2.065047, -0.4434474, -0.5383078, 1, 1, 1, 1, 1,
-2.056722, 1.221025, 0.9879513, 1, 1, 1, 1, 1,
-2.048481, -1.564363, -0.5393044, 1, 1, 1, 1, 1,
-1.984982, 0.869826, -1.305557, 1, 1, 1, 1, 1,
-1.96536, 0.4808876, -1.228535, 1, 1, 1, 1, 1,
-1.945126, -0.1521183, -3.558712, 1, 1, 1, 1, 1,
-1.943455, -0.3173223, 0.633628, 1, 1, 1, 1, 1,
-1.936745, 0.4426547, -2.106051, 1, 1, 1, 1, 1,
-1.923237, -1.26939, -2.455403, 1, 1, 1, 1, 1,
-1.912888, 1.919635, -1.988816, 0, 0, 1, 1, 1,
-1.909025, -0.740998, -1.476199, 1, 0, 0, 1, 1,
-1.902651, -1.005798, -2.080993, 1, 0, 0, 1, 1,
-1.897398, 1.098718, 0.1733651, 1, 0, 0, 1, 1,
-1.88635, -0.897697, -2.259911, 1, 0, 0, 1, 1,
-1.885611, 0.417925, -1.504859, 1, 0, 0, 1, 1,
-1.882478, 0.4576362, -0.5501394, 0, 0, 0, 1, 1,
-1.871176, -1.643167, -1.771256, 0, 0, 0, 1, 1,
-1.839283, -0.8147568, -2.259404, 0, 0, 0, 1, 1,
-1.815123, 0.934909, -2.632323, 0, 0, 0, 1, 1,
-1.814648, 1.158463, -2.686597, 0, 0, 0, 1, 1,
-1.797112, -0.2567754, -0.06500614, 0, 0, 0, 1, 1,
-1.79656, -0.9505144, -1.862506, 0, 0, 0, 1, 1,
-1.796275, -2.38811, -3.292571, 1, 1, 1, 1, 1,
-1.789047, 0.7651206, -1.149177, 1, 1, 1, 1, 1,
-1.780773, -1.079221, -1.908628, 1, 1, 1, 1, 1,
-1.767269, -1.934894, -3.033046, 1, 1, 1, 1, 1,
-1.766383, 0.7270637, -0.5872819, 1, 1, 1, 1, 1,
-1.765903, 0.2743476, -1.145597, 1, 1, 1, 1, 1,
-1.759515, -0.3838142, -2.397326, 1, 1, 1, 1, 1,
-1.754701, -0.531055, -1.592593, 1, 1, 1, 1, 1,
-1.744171, 0.07824145, -1.484577, 1, 1, 1, 1, 1,
-1.734923, 1.08153, -0.9451826, 1, 1, 1, 1, 1,
-1.734459, 0.1260102, -2.038175, 1, 1, 1, 1, 1,
-1.721289, 2.377815, 0.4350629, 1, 1, 1, 1, 1,
-1.693035, 0.6911973, 0.07180147, 1, 1, 1, 1, 1,
-1.687509, 0.7434015, -1.269751, 1, 1, 1, 1, 1,
-1.659314, 1.050454, -0.2608034, 1, 1, 1, 1, 1,
-1.657813, 0.2631781, -0.4734283, 0, 0, 1, 1, 1,
-1.656229, 0.8665968, -0.9366316, 1, 0, 0, 1, 1,
-1.621794, -0.875514, -3.518367, 1, 0, 0, 1, 1,
-1.602038, -0.1534786, -1.281258, 1, 0, 0, 1, 1,
-1.597838, 0.4785964, -1.655788, 1, 0, 0, 1, 1,
-1.593199, 0.8995559, -1.656937, 1, 0, 0, 1, 1,
-1.58046, 0.4079249, -0.08575864, 0, 0, 0, 1, 1,
-1.538782, -0.9014921, -1.443168, 0, 0, 0, 1, 1,
-1.537566, -0.8185805, -1.757845, 0, 0, 0, 1, 1,
-1.530488, -0.4220224, -2.411117, 0, 0, 0, 1, 1,
-1.523126, -1.376911, -2.078564, 0, 0, 0, 1, 1,
-1.51931, -0.8601169, -2.230963, 0, 0, 0, 1, 1,
-1.500604, 0.31835, -3.974127, 0, 0, 0, 1, 1,
-1.491244, 0.4627575, -0.2283008, 1, 1, 1, 1, 1,
-1.489985, -1.205346, -2.590215, 1, 1, 1, 1, 1,
-1.481115, 0.710171, -0.04525185, 1, 1, 1, 1, 1,
-1.478213, -0.4147697, -1.922923, 1, 1, 1, 1, 1,
-1.470746, 0.07276977, -0.4185008, 1, 1, 1, 1, 1,
-1.470389, -1.062618, -3.168308, 1, 1, 1, 1, 1,
-1.469089, 1.765655, 0.6940014, 1, 1, 1, 1, 1,
-1.46654, 0.6905155, 1.032951, 1, 1, 1, 1, 1,
-1.464738, 1.040567, -0.7718078, 1, 1, 1, 1, 1,
-1.452707, 0.601341, -0.306056, 1, 1, 1, 1, 1,
-1.439784, 0.05719391, -2.612869, 1, 1, 1, 1, 1,
-1.439576, -1.017377, -2.321584, 1, 1, 1, 1, 1,
-1.439047, 2.211435, -1.337979, 1, 1, 1, 1, 1,
-1.422675, -1.296787, -1.756907, 1, 1, 1, 1, 1,
-1.421915, 0.6493353, -0.6476161, 1, 1, 1, 1, 1,
-1.409389, 0.6075286, -1.130019, 0, 0, 1, 1, 1,
-1.395133, 0.2027729, -1.835972, 1, 0, 0, 1, 1,
-1.380379, -2.145687, -1.849916, 1, 0, 0, 1, 1,
-1.379217, -0.4423451, -2.424472, 1, 0, 0, 1, 1,
-1.377171, -1.056323, -3.41317, 1, 0, 0, 1, 1,
-1.367455, 1.494579, -1.518752, 1, 0, 0, 1, 1,
-1.357226, 1.297076, -1.173585, 0, 0, 0, 1, 1,
-1.349601, 1.711116, -0.7102561, 0, 0, 0, 1, 1,
-1.333927, -1.985601, -3.491913, 0, 0, 0, 1, 1,
-1.333643, 0.8840361, -1.676799, 0, 0, 0, 1, 1,
-1.317929, -0.9754688, -2.675029, 0, 0, 0, 1, 1,
-1.304355, 0.2965009, -1.965505, 0, 0, 0, 1, 1,
-1.272152, 0.8506261, 0.3552541, 0, 0, 0, 1, 1,
-1.271463, -1.711043, -2.848668, 1, 1, 1, 1, 1,
-1.260839, -1.111526, -1.681357, 1, 1, 1, 1, 1,
-1.253156, -0.9191225, -0.2819151, 1, 1, 1, 1, 1,
-1.251774, -0.01565858, -1.703964, 1, 1, 1, 1, 1,
-1.245836, -0.6579933, -2.066237, 1, 1, 1, 1, 1,
-1.237653, 0.5169376, -2.555982, 1, 1, 1, 1, 1,
-1.236012, 0.04246109, -0.6624034, 1, 1, 1, 1, 1,
-1.233122, 0.8774764, -1.63575, 1, 1, 1, 1, 1,
-1.231008, -0.4131747, -2.476765, 1, 1, 1, 1, 1,
-1.225138, -1.012592, -3.156227, 1, 1, 1, 1, 1,
-1.215316, 1.114075, 0.430104, 1, 1, 1, 1, 1,
-1.198967, -0.8851625, -1.73002, 1, 1, 1, 1, 1,
-1.198964, 1.026522, -0.1038944, 1, 1, 1, 1, 1,
-1.189542, 0.7679324, -0.9534526, 1, 1, 1, 1, 1,
-1.189386, -0.0642219, -2.093376, 1, 1, 1, 1, 1,
-1.183386, 0.7224131, -1.330817, 0, 0, 1, 1, 1,
-1.173165, 0.7477163, 0.7911393, 1, 0, 0, 1, 1,
-1.162623, 0.4566333, -2.921267, 1, 0, 0, 1, 1,
-1.158218, -1.834859, -3.011756, 1, 0, 0, 1, 1,
-1.143688, 0.2647015, 0.8426172, 1, 0, 0, 1, 1,
-1.139237, -1.203705, -0.552358, 1, 0, 0, 1, 1,
-1.137734, -1.580472, -2.077047, 0, 0, 0, 1, 1,
-1.128635, -0.6504655, -1.108619, 0, 0, 0, 1, 1,
-1.117415, 0.7879955, -1.620007, 0, 0, 0, 1, 1,
-1.114927, -0.04767625, 0.01502045, 0, 0, 0, 1, 1,
-1.114818, -1.287223, -1.438333, 0, 0, 0, 1, 1,
-1.112388, -0.5698961, -2.307434, 0, 0, 0, 1, 1,
-1.109447, -1.204121, -2.98861, 0, 0, 0, 1, 1,
-1.09784, -0.4281287, -2.760919, 1, 1, 1, 1, 1,
-1.097037, -1.148207, -1.986749, 1, 1, 1, 1, 1,
-1.0964, -0.2189312, -1.909391, 1, 1, 1, 1, 1,
-1.09139, -0.3870109, -0.06225277, 1, 1, 1, 1, 1,
-1.09005, 0.1970591, -1.675539, 1, 1, 1, 1, 1,
-1.088209, -1.173517, -3.095058, 1, 1, 1, 1, 1,
-1.086324, 0.875388, -1.314581, 1, 1, 1, 1, 1,
-1.08142, -1.866626, -4.553224, 1, 1, 1, 1, 1,
-1.078916, 0.7157257, 0.02284585, 1, 1, 1, 1, 1,
-1.075908, -0.2271112, -1.532646, 1, 1, 1, 1, 1,
-1.075159, 0.9532624, 0.8272823, 1, 1, 1, 1, 1,
-1.059597, -1.296671, -2.700119, 1, 1, 1, 1, 1,
-1.059301, 0.03358623, -0.9820419, 1, 1, 1, 1, 1,
-1.047346, -3.429751, -1.577146, 1, 1, 1, 1, 1,
-1.041384, 0.8587636, -0.06299397, 1, 1, 1, 1, 1,
-1.037963, -0.1703928, -1.404712, 0, 0, 1, 1, 1,
-1.030416, -0.300677, -0.8541467, 1, 0, 0, 1, 1,
-1.026011, -0.1015851, -0.6544118, 1, 0, 0, 1, 1,
-1.002305, 0.357239, -3.539429, 1, 0, 0, 1, 1,
-0.9973202, -1.19641, -2.902885, 1, 0, 0, 1, 1,
-0.9925973, 1.771635, 0.04856548, 1, 0, 0, 1, 1,
-0.9921911, -0.4311205, -1.256101, 0, 0, 0, 1, 1,
-0.9908171, -0.3775137, -0.7830983, 0, 0, 0, 1, 1,
-0.9823421, -0.8023309, -2.364156, 0, 0, 0, 1, 1,
-0.9767068, 0.5654657, -0.3763397, 0, 0, 0, 1, 1,
-0.9686776, 1.155886, -1.04657, 0, 0, 0, 1, 1,
-0.9605916, 0.7853928, -0.6267455, 0, 0, 0, 1, 1,
-0.9588346, 1.324019, -0.1975202, 0, 0, 0, 1, 1,
-0.9560165, 0.5072207, -0.6538578, 1, 1, 1, 1, 1,
-0.9536756, -0.1274957, -1.732368, 1, 1, 1, 1, 1,
-0.9454079, 1.057538, 0.07763879, 1, 1, 1, 1, 1,
-0.943864, 1.413783, -1.544077, 1, 1, 1, 1, 1,
-0.9425058, -1.138791, -2.993874, 1, 1, 1, 1, 1,
-0.9406569, 0.9464862, -0.9231481, 1, 1, 1, 1, 1,
-0.9386884, 0.1026885, 0.4245484, 1, 1, 1, 1, 1,
-0.9274486, -1.580155, -2.899985, 1, 1, 1, 1, 1,
-0.9201335, -0.7789553, -1.605665, 1, 1, 1, 1, 1,
-0.9168581, -0.06134809, -0.9786718, 1, 1, 1, 1, 1,
-0.9139757, -2.363653, -4.47961, 1, 1, 1, 1, 1,
-0.9077764, 0.5238756, -1.043976, 1, 1, 1, 1, 1,
-0.8986778, 0.4839085, -1.560216, 1, 1, 1, 1, 1,
-0.8969015, 0.5253783, 0.05672967, 1, 1, 1, 1, 1,
-0.8955929, -1.150539, -2.905525, 1, 1, 1, 1, 1,
-0.8940367, 1.758524, -0.5705022, 0, 0, 1, 1, 1,
-0.8929172, 0.1061673, -2.048452, 1, 0, 0, 1, 1,
-0.8928589, -1.089579, -1.355068, 1, 0, 0, 1, 1,
-0.8902825, -0.5851446, -2.317068, 1, 0, 0, 1, 1,
-0.8895647, 0.1127495, 0.7195494, 1, 0, 0, 1, 1,
-0.8880712, -0.7019107, -3.178384, 1, 0, 0, 1, 1,
-0.8873699, 1.315834, -2.695732, 0, 0, 0, 1, 1,
-0.8857983, 1.070068, 0.6160535, 0, 0, 0, 1, 1,
-0.8845934, 0.9447124, -1.69643, 0, 0, 0, 1, 1,
-0.8724651, -1.091716, -1.400948, 0, 0, 0, 1, 1,
-0.8716897, -0.3580864, -2.251904, 0, 0, 0, 1, 1,
-0.871309, 0.642006, -0.2768143, 0, 0, 0, 1, 1,
-0.8656589, -0.4430548, -2.387243, 0, 0, 0, 1, 1,
-0.8599114, -0.4447066, -1.685108, 1, 1, 1, 1, 1,
-0.855037, 0.8002564, -0.9758607, 1, 1, 1, 1, 1,
-0.8493902, 0.03055478, -3.008195, 1, 1, 1, 1, 1,
-0.8492091, 0.5938359, -2.570431, 1, 1, 1, 1, 1,
-0.8484894, -0.6490396, -2.521715, 1, 1, 1, 1, 1,
-0.845306, -0.9296703, -1.360986, 1, 1, 1, 1, 1,
-0.845228, 0.06732354, -2.116924, 1, 1, 1, 1, 1,
-0.8430817, 1.769572, 0.4411556, 1, 1, 1, 1, 1,
-0.8429028, -0.09235577, -1.600669, 1, 1, 1, 1, 1,
-0.8370557, 0.2252556, -2.498369, 1, 1, 1, 1, 1,
-0.8341229, -0.4838001, -1.545456, 1, 1, 1, 1, 1,
-0.8318644, 1.628117, -0.2614483, 1, 1, 1, 1, 1,
-0.8247459, -1.058517, -1.690773, 1, 1, 1, 1, 1,
-0.8232502, -1.051653, -2.443745, 1, 1, 1, 1, 1,
-0.8150833, 0.1428977, -0.1682701, 1, 1, 1, 1, 1,
-0.8137156, 0.5150648, -1.590925, 0, 0, 1, 1, 1,
-0.8110961, 0.9195237, -2.098177, 1, 0, 0, 1, 1,
-0.8071333, 1.100586, -0.3360031, 1, 0, 0, 1, 1,
-0.8002019, -1.315363, -1.791675, 1, 0, 0, 1, 1,
-0.795764, -1.345551, -1.905281, 1, 0, 0, 1, 1,
-0.7937948, 0.2524694, -1.064728, 1, 0, 0, 1, 1,
-0.7927349, -0.7039821, -2.966583, 0, 0, 0, 1, 1,
-0.7900747, -0.8398337, -1.81069, 0, 0, 0, 1, 1,
-0.7882475, -0.451117, -4.245616, 0, 0, 0, 1, 1,
-0.7789336, 1.25602, -1.367131, 0, 0, 0, 1, 1,
-0.7786775, -0.8438933, -1.092304, 0, 0, 0, 1, 1,
-0.7772888, -0.9959337, -3.050773, 0, 0, 0, 1, 1,
-0.7767794, 0.1112924, -1.292352, 0, 0, 0, 1, 1,
-0.7735531, 0.8672689, -0.1401413, 1, 1, 1, 1, 1,
-0.773514, 0.7222204, 0.2150131, 1, 1, 1, 1, 1,
-0.7723237, -0.2297333, -0.1900462, 1, 1, 1, 1, 1,
-0.7663748, -0.2701701, -2.238054, 1, 1, 1, 1, 1,
-0.7638863, -1.902221, -1.972624, 1, 1, 1, 1, 1,
-0.7621411, -0.04025492, -1.351493, 1, 1, 1, 1, 1,
-0.7594261, -0.04422998, -1.032489, 1, 1, 1, 1, 1,
-0.759266, -0.04575123, -1.604376, 1, 1, 1, 1, 1,
-0.7564093, -1.29932, -2.780422, 1, 1, 1, 1, 1,
-0.7547495, -0.05354051, -0.9037395, 1, 1, 1, 1, 1,
-0.7507337, 1.407462, 0.02616033, 1, 1, 1, 1, 1,
-0.7490373, -0.6827976, -3.226267, 1, 1, 1, 1, 1,
-0.7447782, 1.319022, -0.5353065, 1, 1, 1, 1, 1,
-0.7351529, -0.4492879, -1.238689, 1, 1, 1, 1, 1,
-0.7344673, -1.710375, -2.594504, 1, 1, 1, 1, 1,
-0.7330379, 0.426578, -1.286955, 0, 0, 1, 1, 1,
-0.7315007, 1.434979, -0.09509294, 1, 0, 0, 1, 1,
-0.7311643, -1.075987, -0.4224448, 1, 0, 0, 1, 1,
-0.7246385, -1.431142, -0.7638915, 1, 0, 0, 1, 1,
-0.7236019, 0.2371262, -2.316666, 1, 0, 0, 1, 1,
-0.7230419, -1.886376, -2.54399, 1, 0, 0, 1, 1,
-0.7142529, 0.7545491, 0.05846969, 0, 0, 0, 1, 1,
-0.70737, -1.171772, -3.681172, 0, 0, 0, 1, 1,
-0.7067256, 1.251811, -0.7712601, 0, 0, 0, 1, 1,
-0.706531, 1.703077, -0.6811433, 0, 0, 0, 1, 1,
-0.696484, 0.7031968, -0.3209662, 0, 0, 0, 1, 1,
-0.6958653, -2.06327, -2.690231, 0, 0, 0, 1, 1,
-0.6904172, 0.7210048, -1.057798, 0, 0, 0, 1, 1,
-0.6903234, 1.173548, -1.117773, 1, 1, 1, 1, 1,
-0.6897035, 0.4016512, -0.0386974, 1, 1, 1, 1, 1,
-0.6848065, 1.386539, -1.730385, 1, 1, 1, 1, 1,
-0.6846201, 0.8719065, -0.910871, 1, 1, 1, 1, 1,
-0.6845641, -1.65307, -2.681571, 1, 1, 1, 1, 1,
-0.6845048, -1.885466, -5.037482, 1, 1, 1, 1, 1,
-0.6840913, 1.692598, 1.276595, 1, 1, 1, 1, 1,
-0.6839862, -0.3358052, -1.030321, 1, 1, 1, 1, 1,
-0.6829769, -1.51552, -4.153966, 1, 1, 1, 1, 1,
-0.6828347, 0.5073657, -1.442955, 1, 1, 1, 1, 1,
-0.6801963, -0.4404564, -0.6631854, 1, 1, 1, 1, 1,
-0.6720358, 0.3541489, -1.03037, 1, 1, 1, 1, 1,
-0.6711401, -2.315133, -1.582709, 1, 1, 1, 1, 1,
-0.662373, 1.008062, -0.139527, 1, 1, 1, 1, 1,
-0.6587139, 2.656778, -1.155646, 1, 1, 1, 1, 1,
-0.6584155, 0.2019762, -0.0782774, 0, 0, 1, 1, 1,
-0.6571716, 0.6270715, -0.1522556, 1, 0, 0, 1, 1,
-0.6549097, 0.7398379, -0.1608686, 1, 0, 0, 1, 1,
-0.6520991, 0.7083127, -1.588956, 1, 0, 0, 1, 1,
-0.6434931, -0.1030075, -3.938592, 1, 0, 0, 1, 1,
-0.6420492, -1.023912, -1.143979, 1, 0, 0, 1, 1,
-0.6419904, -0.5017807, -2.374765, 0, 0, 0, 1, 1,
-0.6403247, 0.5569625, -1.691447, 0, 0, 0, 1, 1,
-0.6267354, 0.2758919, 0.3363543, 0, 0, 0, 1, 1,
-0.6202785, 0.822244, -0.3400052, 0, 0, 0, 1, 1,
-0.6190214, -0.84398, -3.047575, 0, 0, 0, 1, 1,
-0.6173569, -0.9351246, -3.370075, 0, 0, 0, 1, 1,
-0.6148601, 0.2935594, -1.659981, 0, 0, 0, 1, 1,
-0.6120551, -1.603428, -2.791058, 1, 1, 1, 1, 1,
-0.6107212, 0.4227691, -0.4360147, 1, 1, 1, 1, 1,
-0.6044176, 0.208299, -1.862553, 1, 1, 1, 1, 1,
-0.5963367, 0.704753, -0.4776472, 1, 1, 1, 1, 1,
-0.5894566, 0.2168766, -2.242385, 1, 1, 1, 1, 1,
-0.5891526, 0.9542324, -0.2168127, 1, 1, 1, 1, 1,
-0.5882685, 0.1497407, -1.006682, 1, 1, 1, 1, 1,
-0.5879785, -0.2263455, -2.920831, 1, 1, 1, 1, 1,
-0.584315, -0.1025777, -1.26016, 1, 1, 1, 1, 1,
-0.583998, 0.962113, -0.5809537, 1, 1, 1, 1, 1,
-0.5822833, 0.1950634, -1.273195, 1, 1, 1, 1, 1,
-0.5820949, -0.1049766, -2.042602, 1, 1, 1, 1, 1,
-0.5807539, 0.2881844, 0.9715738, 1, 1, 1, 1, 1,
-0.5763878, -0.7391278, -2.643498, 1, 1, 1, 1, 1,
-0.5755783, -0.7140737, -1.590457, 1, 1, 1, 1, 1,
-0.5751921, -0.6019093, -4.324391, 0, 0, 1, 1, 1,
-0.5736133, -0.02619258, -2.396909, 1, 0, 0, 1, 1,
-0.5725901, -0.4193901, -2.769645, 1, 0, 0, 1, 1,
-0.5701722, 0.4417665, -1.430446, 1, 0, 0, 1, 1,
-0.5673963, 0.4399117, -0.3752212, 1, 0, 0, 1, 1,
-0.5670846, 1.156469, -2.59816, 1, 0, 0, 1, 1,
-0.5664088, -0.4594492, -1.788959, 0, 0, 0, 1, 1,
-0.5583716, 0.8850573, -2.461618, 0, 0, 0, 1, 1,
-0.5571945, -1.170008, -2.490868, 0, 0, 0, 1, 1,
-0.5560227, -1.083667, -2.371437, 0, 0, 0, 1, 1,
-0.5525385, 0.2665809, -2.303733, 0, 0, 0, 1, 1,
-0.5508849, -1.973239, -2.258553, 0, 0, 0, 1, 1,
-0.549467, -0.9629201, -4.872199, 0, 0, 0, 1, 1,
-0.5479823, -0.7688674, -4.146091, 1, 1, 1, 1, 1,
-0.5451496, 1.669872, -1.74069, 1, 1, 1, 1, 1,
-0.5353331, 1.448941, 0.3012246, 1, 1, 1, 1, 1,
-0.5342392, -1.526551, -2.212007, 1, 1, 1, 1, 1,
-0.5338725, 1.246067, -0.6510854, 1, 1, 1, 1, 1,
-0.5299482, 2.257758, 0.6448827, 1, 1, 1, 1, 1,
-0.5298323, -0.831911, -3.114161, 1, 1, 1, 1, 1,
-0.5250859, 1.792457, -0.5047218, 1, 1, 1, 1, 1,
-0.5195097, -0.2250572, -0.859347, 1, 1, 1, 1, 1,
-0.5184657, -0.9865761, -2.945422, 1, 1, 1, 1, 1,
-0.5158782, 0.5840965, -2.371783, 1, 1, 1, 1, 1,
-0.5150617, -0.2259841, -2.034106, 1, 1, 1, 1, 1,
-0.5137447, 0.01539858, -3.63806, 1, 1, 1, 1, 1,
-0.5083252, 0.7253785, -0.6749574, 1, 1, 1, 1, 1,
-0.4974248, -0.6233402, -1.607561, 1, 1, 1, 1, 1,
-0.4971796, -0.7700719, -2.480699, 0, 0, 1, 1, 1,
-0.4948049, 2.59644, 1.056161, 1, 0, 0, 1, 1,
-0.4913917, 0.02439833, -1.690518, 1, 0, 0, 1, 1,
-0.4913356, 1.414624, 1.813118, 1, 0, 0, 1, 1,
-0.4873102, -0.4300984, -2.846021, 1, 0, 0, 1, 1,
-0.484684, 0.8904029, -0.880191, 1, 0, 0, 1, 1,
-0.484525, 0.6040527, 0.7566372, 0, 0, 0, 1, 1,
-0.4823895, -0.3492633, -2.726315, 0, 0, 0, 1, 1,
-0.4803989, 1.065521, -0.7221586, 0, 0, 0, 1, 1,
-0.477669, -1.072852, -3.66047, 0, 0, 0, 1, 1,
-0.4742507, -0.1578693, -0.2100178, 0, 0, 0, 1, 1,
-0.4612867, -0.4738541, -2.496115, 0, 0, 0, 1, 1,
-0.4591941, 2.295498, 1.256158, 0, 0, 0, 1, 1,
-0.456351, 0.03890178, -0.7630348, 1, 1, 1, 1, 1,
-0.4552611, 2.235673, 0.627087, 1, 1, 1, 1, 1,
-0.4534433, 0.0818141, -1.842107, 1, 1, 1, 1, 1,
-0.4507895, -0.3554439, -3.423755, 1, 1, 1, 1, 1,
-0.4453819, 0.03879965, -1.463227, 1, 1, 1, 1, 1,
-0.4450038, -0.6224565, -1.117139, 1, 1, 1, 1, 1,
-0.4385622, 1.279915, -1.120539, 1, 1, 1, 1, 1,
-0.4370915, -0.2654429, -1.102425, 1, 1, 1, 1, 1,
-0.4369142, -0.2489412, -3.038255, 1, 1, 1, 1, 1,
-0.4175231, 0.4679686, -0.2884133, 1, 1, 1, 1, 1,
-0.4128081, -0.5798487, -2.96383, 1, 1, 1, 1, 1,
-0.4127691, 1.290704, 0.9836124, 1, 1, 1, 1, 1,
-0.4116828, 0.5200933, -0.1993798, 1, 1, 1, 1, 1,
-0.4076881, -0.4406064, -2.706473, 1, 1, 1, 1, 1,
-0.4044389, -0.7450216, -3.907844, 1, 1, 1, 1, 1,
-0.4040179, 0.3071238, 0.04272721, 0, 0, 1, 1, 1,
-0.4034269, -1.884993, -2.159355, 1, 0, 0, 1, 1,
-0.4018181, 1.468091, -0.7669669, 1, 0, 0, 1, 1,
-0.3908971, -0.7346423, -3.283113, 1, 0, 0, 1, 1,
-0.3864397, -0.03798748, -1.552226, 1, 0, 0, 1, 1,
-0.3844721, -1.115906, -1.222395, 1, 0, 0, 1, 1,
-0.3833942, 1.395818, 0.5256017, 0, 0, 0, 1, 1,
-0.3812627, 0.5235738, 0.9230093, 0, 0, 0, 1, 1,
-0.3721941, -0.3884699, -4.521181, 0, 0, 0, 1, 1,
-0.3712573, 0.6094706, -0.4990723, 0, 0, 0, 1, 1,
-0.3710877, -0.5742819, -2.739504, 0, 0, 0, 1, 1,
-0.3707042, 0.08999974, -1.156454, 0, 0, 0, 1, 1,
-0.3694545, 0.8362122, -0.7473673, 0, 0, 0, 1, 1,
-0.3687757, -2.055749, -2.644183, 1, 1, 1, 1, 1,
-0.3684751, 1.077356, 2.6229, 1, 1, 1, 1, 1,
-0.3653254, -0.9828961, -3.325712, 1, 1, 1, 1, 1,
-0.3631786, 0.7763584, -1.010614, 1, 1, 1, 1, 1,
-0.3519972, -0.9329591, -3.480004, 1, 1, 1, 1, 1,
-0.3510309, -0.31743, -2.122344, 1, 1, 1, 1, 1,
-0.3458278, -1.538367, -3.073241, 1, 1, 1, 1, 1,
-0.344389, 1.288647, 0.5592051, 1, 1, 1, 1, 1,
-0.341278, -0.3502392, -2.014915, 1, 1, 1, 1, 1,
-0.337563, -0.7904545, -2.284053, 1, 1, 1, 1, 1,
-0.3317994, 0.5499964, -0.5598414, 1, 1, 1, 1, 1,
-0.3271834, 2.017414, -0.2862297, 1, 1, 1, 1, 1,
-0.3238167, 0.5539938, -0.4177854, 1, 1, 1, 1, 1,
-0.3227382, 0.4438777, -0.207674, 1, 1, 1, 1, 1,
-0.3226605, 0.7890767, -0.1761924, 1, 1, 1, 1, 1,
-0.3195529, -0.2505077, -3.745425, 0, 0, 1, 1, 1,
-0.3186336, -1.273922, -3.080634, 1, 0, 0, 1, 1,
-0.3071514, -1.897026, -3.21685, 1, 0, 0, 1, 1,
-0.3047773, 0.2475622, -2.133737, 1, 0, 0, 1, 1,
-0.298351, -1.233812, -2.544129, 1, 0, 0, 1, 1,
-0.2954991, 0.9779791, -1.279093, 1, 0, 0, 1, 1,
-0.2919781, 0.3134873, -0.7449108, 0, 0, 0, 1, 1,
-0.2911736, -0.2544222, -2.06635, 0, 0, 0, 1, 1,
-0.2906466, 1.204408, -0.7742763, 0, 0, 0, 1, 1,
-0.2895564, 1.222296, -0.9150446, 0, 0, 0, 1, 1,
-0.2889653, 0.8481326, -0.2228586, 0, 0, 0, 1, 1,
-0.2888885, -0.9297968, -4.206444, 0, 0, 0, 1, 1,
-0.2859098, -0.4006028, -2.483639, 0, 0, 0, 1, 1,
-0.2855623, -0.6331438, -3.575098, 1, 1, 1, 1, 1,
-0.2850714, -0.0132592, -0.5408848, 1, 1, 1, 1, 1,
-0.282185, -0.8075436, -3.090671, 1, 1, 1, 1, 1,
-0.2769803, 0.8688871, 1.00799, 1, 1, 1, 1, 1,
-0.2755267, 0.08081204, -1.833833, 1, 1, 1, 1, 1,
-0.272993, 1.073364, 0.2558731, 1, 1, 1, 1, 1,
-0.2719955, -1.278921, -2.338108, 1, 1, 1, 1, 1,
-0.2682756, 2.667173, -0.1661381, 1, 1, 1, 1, 1,
-0.2653221, -0.9673861, -3.653337, 1, 1, 1, 1, 1,
-0.2639411, 0.3838679, -0.9338396, 1, 1, 1, 1, 1,
-0.2607644, 0.3571039, 1.493989, 1, 1, 1, 1, 1,
-0.2578748, 1.685174, -1.028626, 1, 1, 1, 1, 1,
-0.2513074, -0.03088946, -1.9656, 1, 1, 1, 1, 1,
-0.2467595, 0.5711911, -1.674785, 1, 1, 1, 1, 1,
-0.2445519, 0.5493794, -0.257726, 1, 1, 1, 1, 1,
-0.244097, 0.9307386, -1.692172, 0, 0, 1, 1, 1,
-0.2368744, -0.5991931, -4.145587, 1, 0, 0, 1, 1,
-0.2357077, 0.07688636, 0.08069129, 1, 0, 0, 1, 1,
-0.2329877, 2.714137, -1.510452, 1, 0, 0, 1, 1,
-0.231702, 0.1193149, -0.6180843, 1, 0, 0, 1, 1,
-0.2298594, 0.8899528, 0.8689458, 1, 0, 0, 1, 1,
-0.2271202, -1.791239, -2.409424, 0, 0, 0, 1, 1,
-0.2260561, 1.583083, -0.3638731, 0, 0, 0, 1, 1,
-0.2180439, 0.1124639, -2.181846, 0, 0, 0, 1, 1,
-0.2159608, 1.727353, 1.200422, 0, 0, 0, 1, 1,
-0.2019802, 1.201873, -0.3390842, 0, 0, 0, 1, 1,
-0.201249, 0.1108261, -1.934479, 0, 0, 0, 1, 1,
-0.2006706, -0.3415876, -4.489518, 0, 0, 0, 1, 1,
-0.1995261, -0.2780371, -2.537892, 1, 1, 1, 1, 1,
-0.1917732, -0.8608492, -3.98261, 1, 1, 1, 1, 1,
-0.1910015, 0.4590235, -1.249096, 1, 1, 1, 1, 1,
-0.1908256, 0.2402878, -0.9254979, 1, 1, 1, 1, 1,
-0.1905479, -0.06275819, -2.757988, 1, 1, 1, 1, 1,
-0.1903159, -1.517768, -2.965701, 1, 1, 1, 1, 1,
-0.1886898, -0.6961413, -3.258843, 1, 1, 1, 1, 1,
-0.1878375, 0.1365553, -1.779648, 1, 1, 1, 1, 1,
-0.1864091, 0.1439996, -2.54775, 1, 1, 1, 1, 1,
-0.1850115, 1.599366, 0.892797, 1, 1, 1, 1, 1,
-0.1833136, -1.863383, -2.992936, 1, 1, 1, 1, 1,
-0.1806807, -1.962314, -4.222323, 1, 1, 1, 1, 1,
-0.1727634, 0.08127119, -1.344763, 1, 1, 1, 1, 1,
-0.169201, -0.2482121, -3.299125, 1, 1, 1, 1, 1,
-0.1675645, -0.4343791, -0.4638927, 1, 1, 1, 1, 1,
-0.166551, 2.13905, -1.394166, 0, 0, 1, 1, 1,
-0.1647135, 3.355378, -1.036569, 1, 0, 0, 1, 1,
-0.1618377, -0.2432864, -1.078671, 1, 0, 0, 1, 1,
-0.1586583, -0.6359579, -3.50762, 1, 0, 0, 1, 1,
-0.15684, 0.6071062, -0.9030017, 1, 0, 0, 1, 1,
-0.156083, 0.5523973, 0.5971748, 1, 0, 0, 1, 1,
-0.15137, -1.449053, -1.410294, 0, 0, 0, 1, 1,
-0.1449438, -0.6600811, -3.942605, 0, 0, 0, 1, 1,
-0.1441318, 1.623266, -0.5923517, 0, 0, 0, 1, 1,
-0.1433242, 1.320768, -0.1112529, 0, 0, 0, 1, 1,
-0.1404809, 0.5659701, -1.373262, 0, 0, 0, 1, 1,
-0.139428, 0.9153195, -2.126656, 0, 0, 0, 1, 1,
-0.1383489, 1.803911, -1.293356, 0, 0, 0, 1, 1,
-0.1378618, -0.1354466, -1.199638, 1, 1, 1, 1, 1,
-0.1375725, -0.1033472, -1.560909, 1, 1, 1, 1, 1,
-0.1284466, 0.2096783, -2.188408, 1, 1, 1, 1, 1,
-0.1269406, -0.2201712, -2.787572, 1, 1, 1, 1, 1,
-0.125662, 0.6041845, -0.7787533, 1, 1, 1, 1, 1,
-0.122726, 0.9666892, 0.5764787, 1, 1, 1, 1, 1,
-0.1194428, -0.4981104, -2.209486, 1, 1, 1, 1, 1,
-0.1174546, 0.006728909, -1.76066, 1, 1, 1, 1, 1,
-0.1136891, 1.278869, 1.134142, 1, 1, 1, 1, 1,
-0.1102175, 0.2468783, -0.3768009, 1, 1, 1, 1, 1,
-0.1042284, 1.001657, -0.09997213, 1, 1, 1, 1, 1,
-0.102892, -1.400042, -2.883557, 1, 1, 1, 1, 1,
-0.09851635, -1.714885, -2.848053, 1, 1, 1, 1, 1,
-0.0900844, 0.7342297, -0.0569343, 1, 1, 1, 1, 1,
-0.08959403, 0.4792584, -0.5907285, 1, 1, 1, 1, 1,
-0.08832534, 0.4922425, -0.5392335, 0, 0, 1, 1, 1,
-0.08802284, -1.244104, -1.917209, 1, 0, 0, 1, 1,
-0.08665454, -0.3704897, -3.173704, 1, 0, 0, 1, 1,
-0.0847105, -1.215599, -1.730068, 1, 0, 0, 1, 1,
-0.082795, -2.044371, -3.142922, 1, 0, 0, 1, 1,
-0.07600188, -1.488512, -4.81696, 1, 0, 0, 1, 1,
-0.07529531, 0.07083051, -1.169168, 0, 0, 0, 1, 1,
-0.07482471, 0.3908479, 0.5612288, 0, 0, 0, 1, 1,
-0.07384616, -0.3335025, -3.178671, 0, 0, 0, 1, 1,
-0.07253379, -1.718514, -3.238005, 0, 0, 0, 1, 1,
-0.07189902, 1.592238, -0.9417788, 0, 0, 0, 1, 1,
-0.07145938, 0.635684, 0.01049573, 0, 0, 0, 1, 1,
-0.06843729, 0.551175, 0.05613021, 0, 0, 0, 1, 1,
-0.06744304, -1.874832, -2.46087, 1, 1, 1, 1, 1,
-0.06615964, -1.913043, -4.610656, 1, 1, 1, 1, 1,
-0.05877531, 1.18704, -0.7701822, 1, 1, 1, 1, 1,
-0.05171593, 0.624352, 0.05581803, 1, 1, 1, 1, 1,
-0.04940484, -0.3678707, -2.547006, 1, 1, 1, 1, 1,
-0.0464552, -0.6872, -5.151669, 1, 1, 1, 1, 1,
-0.04528705, -1.220415, -3.726223, 1, 1, 1, 1, 1,
-0.04156008, -0.3196176, -1.966797, 1, 1, 1, 1, 1,
-0.04110771, 0.5059678, -0.485779, 1, 1, 1, 1, 1,
-0.03843428, 0.6607885, 0.7130566, 1, 1, 1, 1, 1,
-0.03546733, 0.629673, 0.394963, 1, 1, 1, 1, 1,
-0.02377387, -1.109599, -4.280924, 1, 1, 1, 1, 1,
-0.02367754, -0.752506, -4.253249, 1, 1, 1, 1, 1,
-0.02283029, -0.6200009, -2.907639, 1, 1, 1, 1, 1,
-0.02106878, -0.8363038, -4.833032, 1, 1, 1, 1, 1,
-0.01581682, -0.7106134, -1.158459, 0, 0, 1, 1, 1,
-0.01485936, -1.040716, -4.377589, 1, 0, 0, 1, 1,
-0.0145868, -0.1893567, -3.364647, 1, 0, 0, 1, 1,
-0.01071172, -0.5617791, -4.535108, 1, 0, 0, 1, 1,
-0.006659211, 0.1270618, 1.45983, 1, 0, 0, 1, 1,
-0.005498626, -0.004392968, -1.564045, 1, 0, 0, 1, 1,
0.001782861, -0.737028, 2.544474, 0, 0, 0, 1, 1,
0.001982063, -0.5653043, 3.90593, 0, 0, 0, 1, 1,
0.003883066, 0.8338814, -2.513683, 0, 0, 0, 1, 1,
0.00783873, -1.119847, 3.168988, 0, 0, 0, 1, 1,
0.009871528, -0.2945485, 3.415183, 0, 0, 0, 1, 1,
0.01049939, -0.2205275, 2.682388, 0, 0, 0, 1, 1,
0.01183611, -0.2342049, 2.208807, 0, 0, 0, 1, 1,
0.0118539, 3.221923, -0.9552426, 1, 1, 1, 1, 1,
0.01300632, 1.199661, 0.2939182, 1, 1, 1, 1, 1,
0.01723679, -0.3058098, 4.162623, 1, 1, 1, 1, 1,
0.01971309, 1.695647, -0.2414853, 1, 1, 1, 1, 1,
0.02423202, -0.2093413, 3.743495, 1, 1, 1, 1, 1,
0.03177853, 1.573528, -0.6496695, 1, 1, 1, 1, 1,
0.0318815, 1.181156, -1.848639, 1, 1, 1, 1, 1,
0.03546122, 0.389744, 0.2682393, 1, 1, 1, 1, 1,
0.03547448, -1.483322, 4.486862, 1, 1, 1, 1, 1,
0.03553703, 0.07002902, 1.50986, 1, 1, 1, 1, 1,
0.03617527, -1.173322, 1.913688, 1, 1, 1, 1, 1,
0.04249036, -0.06381255, 0.394419, 1, 1, 1, 1, 1,
0.0428484, -0.9779813, 4.267632, 1, 1, 1, 1, 1,
0.04486243, -1.442552, 2.466832, 1, 1, 1, 1, 1,
0.0479166, 0.7224659, -0.581587, 1, 1, 1, 1, 1,
0.04811414, 1.447566, -1.241539, 0, 0, 1, 1, 1,
0.05574316, 1.057881, 1.487737, 1, 0, 0, 1, 1,
0.06002226, -0.1675944, 2.214277, 1, 0, 0, 1, 1,
0.06321781, 0.2903538, 0.6565456, 1, 0, 0, 1, 1,
0.06715447, -0.4545956, 2.506234, 1, 0, 0, 1, 1,
0.0685415, 0.06543373, 1.438985, 1, 0, 0, 1, 1,
0.07083908, -0.8656676, 2.639363, 0, 0, 0, 1, 1,
0.07817556, -0.1446463, 3.578253, 0, 0, 0, 1, 1,
0.0855306, -0.1608039, 1.554513, 0, 0, 0, 1, 1,
0.0858053, -0.4268043, 3.278706, 0, 0, 0, 1, 1,
0.08717914, -0.3103486, 3.718272, 0, 0, 0, 1, 1,
0.09231688, -0.3471399, 3.47753, 0, 0, 0, 1, 1,
0.09391033, 0.3951557, 0.7161157, 0, 0, 0, 1, 1,
0.09653942, -0.1910728, 1.795807, 1, 1, 1, 1, 1,
0.09789243, -0.4100063, 2.492008, 1, 1, 1, 1, 1,
0.0989486, -0.3604438, 2.350558, 1, 1, 1, 1, 1,
0.1005401, -0.6937363, 1.552796, 1, 1, 1, 1, 1,
0.1011496, -0.1063258, 3.824066, 1, 1, 1, 1, 1,
0.1129891, 0.3329429, 1.0668, 1, 1, 1, 1, 1,
0.1135942, 1.077578, -1.188636, 1, 1, 1, 1, 1,
0.115297, 0.05489672, 1.290086, 1, 1, 1, 1, 1,
0.1153092, 0.2044854, 0.7932689, 1, 1, 1, 1, 1,
0.1167236, -1.715151, 3.170931, 1, 1, 1, 1, 1,
0.1179259, 0.254989, 0.07282914, 1, 1, 1, 1, 1,
0.118505, 0.1122635, 0.09533314, 1, 1, 1, 1, 1,
0.128816, 0.7481377, -0.07695752, 1, 1, 1, 1, 1,
0.1363134, -0.0942734, 3.411437, 1, 1, 1, 1, 1,
0.1373112, 0.5414084, 0.2156352, 1, 1, 1, 1, 1,
0.1377283, 0.0774489, 2.70827, 0, 0, 1, 1, 1,
0.1423852, 1.208243, 0.4828499, 1, 0, 0, 1, 1,
0.1459183, -1.096552, 2.712506, 1, 0, 0, 1, 1,
0.1494697, -2.059821, 2.90373, 1, 0, 0, 1, 1,
0.1520729, 1.787875, 0.7930635, 1, 0, 0, 1, 1,
0.1535469, -1.166604, 3.501332, 1, 0, 0, 1, 1,
0.1592654, -1.195291, 4.37825, 0, 0, 0, 1, 1,
0.1638082, -0.6804187, 2.786655, 0, 0, 0, 1, 1,
0.164752, -0.8002415, 2.689831, 0, 0, 0, 1, 1,
0.164888, -0.4101677, -0.01510598, 0, 0, 0, 1, 1,
0.1650387, 0.05893645, 1.720806, 0, 0, 0, 1, 1,
0.1669448, 1.093185, 0.0555896, 0, 0, 0, 1, 1,
0.1683068, 0.2379982, -0.5156232, 0, 0, 0, 1, 1,
0.1700713, 1.193694, 0.8439619, 1, 1, 1, 1, 1,
0.1712121, -0.01998303, -0.3798675, 1, 1, 1, 1, 1,
0.1729645, 0.1364088, -1.095822, 1, 1, 1, 1, 1,
0.1739209, -0.6971651, 2.981222, 1, 1, 1, 1, 1,
0.1740573, -1.159612, 2.898257, 1, 1, 1, 1, 1,
0.1778915, 0.7583287, 0.6364356, 1, 1, 1, 1, 1,
0.1782458, 1.457592, -0.386769, 1, 1, 1, 1, 1,
0.1802715, 1.104537, -0.8480664, 1, 1, 1, 1, 1,
0.180814, -1.174182, 4.117766, 1, 1, 1, 1, 1,
0.1838548, -1.032094, 3.791749, 1, 1, 1, 1, 1,
0.1887282, -0.2943125, 2.420019, 1, 1, 1, 1, 1,
0.1916966, 0.7087389, -0.2240058, 1, 1, 1, 1, 1,
0.197501, 0.2995767, 0.8250595, 1, 1, 1, 1, 1,
0.2016711, 0.2585466, 1.741566, 1, 1, 1, 1, 1,
0.2051319, 1.723325, -0.239385, 1, 1, 1, 1, 1,
0.2076476, 1.311197, -1.367663, 0, 0, 1, 1, 1,
0.2092288, -1.775781, 2.758614, 1, 0, 0, 1, 1,
0.2130721, 0.2790638, 0.4362015, 1, 0, 0, 1, 1,
0.215931, -1.424132, 3.444766, 1, 0, 0, 1, 1,
0.2218881, -1.449092, 1.556655, 1, 0, 0, 1, 1,
0.2284408, 0.6050333, -1.508283, 1, 0, 0, 1, 1,
0.2296436, -2.145256, 0.8754851, 0, 0, 0, 1, 1,
0.2322859, 0.09713672, 3.293028, 0, 0, 0, 1, 1,
0.2325336, 1.967921, 1.440511, 0, 0, 0, 1, 1,
0.2376736, -0.2272226, 2.748188, 0, 0, 0, 1, 1,
0.2394882, 0.1134711, 0.256591, 0, 0, 0, 1, 1,
0.2409637, 0.9557363, -0.7331228, 0, 0, 0, 1, 1,
0.2416153, 0.2388989, 1.953245, 0, 0, 0, 1, 1,
0.2439028, -2.030658, 1.887303, 1, 1, 1, 1, 1,
0.2469684, 0.3941549, 0.09651864, 1, 1, 1, 1, 1,
0.2475706, 1.328869, -0.5069759, 1, 1, 1, 1, 1,
0.251682, 0.5045136, 0.1308394, 1, 1, 1, 1, 1,
0.252363, 0.583485, 0.3640225, 1, 1, 1, 1, 1,
0.2535445, -1.490605, 2.489604, 1, 1, 1, 1, 1,
0.2545193, 0.8687276, 0.484612, 1, 1, 1, 1, 1,
0.2547009, -0.09101808, 2.54506, 1, 1, 1, 1, 1,
0.256299, -0.6688128, 0.6344693, 1, 1, 1, 1, 1,
0.2604127, 0.6747081, -0.06632237, 1, 1, 1, 1, 1,
0.2606727, 0.3026672, 1.565642, 1, 1, 1, 1, 1,
0.2634497, 0.006676067, 1.741128, 1, 1, 1, 1, 1,
0.2664525, 1.017058, -0.07806801, 1, 1, 1, 1, 1,
0.2683251, 0.9026642, 1.490438, 1, 1, 1, 1, 1,
0.2768199, 0.9754443, 0.5139491, 1, 1, 1, 1, 1,
0.2783139, -0.7037819, 3.529316, 0, 0, 1, 1, 1,
0.2785071, 0.3968005, 0.6117419, 1, 0, 0, 1, 1,
0.2791052, 2.010025, 0.3497426, 1, 0, 0, 1, 1,
0.2801899, 1.073382, 1.297432, 1, 0, 0, 1, 1,
0.2826849, -1.389725, 4.359816, 1, 0, 0, 1, 1,
0.2838112, 1.576823, 1.434276, 1, 0, 0, 1, 1,
0.2849229, -0.204033, 2.82292, 0, 0, 0, 1, 1,
0.2852809, -0.427912, 3.044615, 0, 0, 0, 1, 1,
0.2964853, -2.068094, 1.993409, 0, 0, 0, 1, 1,
0.2986801, -0.1532751, 3.103542, 0, 0, 0, 1, 1,
0.2991239, 0.9154016, 0.4681938, 0, 0, 0, 1, 1,
0.2991742, -0.2632936, 1.827571, 0, 0, 0, 1, 1,
0.303985, -0.6647493, 0.5582271, 0, 0, 0, 1, 1,
0.3081137, 2.462578, 0.4695565, 1, 1, 1, 1, 1,
0.3125195, 0.978216, -0.2724599, 1, 1, 1, 1, 1,
0.3177344, 0.3231294, 0.8273427, 1, 1, 1, 1, 1,
0.3205379, 0.09445797, -0.5619811, 1, 1, 1, 1, 1,
0.3235627, -0.2236704, 1.776197, 1, 1, 1, 1, 1,
0.3265234, 0.2317399, -0.5523887, 1, 1, 1, 1, 1,
0.3329192, 0.2607982, 0.896866, 1, 1, 1, 1, 1,
0.3378279, -1.098866, 3.691367, 1, 1, 1, 1, 1,
0.3474091, 1.128623, 2.070385, 1, 1, 1, 1, 1,
0.3482489, 0.3504864, 1.881607, 1, 1, 1, 1, 1,
0.3482518, -0.04682239, 2.509133, 1, 1, 1, 1, 1,
0.3487387, 0.5809854, -1.774581, 1, 1, 1, 1, 1,
0.3514965, 0.03273349, 1.647848, 1, 1, 1, 1, 1,
0.3515659, -0.171738, 0.3526223, 1, 1, 1, 1, 1,
0.3543465, -0.7473534, 3.021624, 1, 1, 1, 1, 1,
0.3558062, 0.5446209, 1.774213, 0, 0, 1, 1, 1,
0.3563868, 0.7416451, -0.1619052, 1, 0, 0, 1, 1,
0.358522, 1.77297, 0.9373739, 1, 0, 0, 1, 1,
0.3609128, -0.3161691, 4.037531, 1, 0, 0, 1, 1,
0.3634422, 1.155564, 0.2057436, 1, 0, 0, 1, 1,
0.364984, -0.0351652, 1.18844, 1, 0, 0, 1, 1,
0.3660858, -1.512106, 4.461573, 0, 0, 0, 1, 1,
0.3695705, -0.4555879, 2.903195, 0, 0, 0, 1, 1,
0.3722018, -1.069452, 3.313467, 0, 0, 0, 1, 1,
0.3741545, -0.9376494, 2.391961, 0, 0, 0, 1, 1,
0.3762512, 0.3778999, 2.562379, 0, 0, 0, 1, 1,
0.3763925, 2.188695, 0.4520995, 0, 0, 0, 1, 1,
0.3772707, 0.6041577, -0.3233213, 0, 0, 0, 1, 1,
0.3807968, -1.927795, 4.63775, 1, 1, 1, 1, 1,
0.3839585, 0.7761667, 0.5169109, 1, 1, 1, 1, 1,
0.385201, 0.5471956, 1.580058, 1, 1, 1, 1, 1,
0.3858118, 1.467246, 0.2447158, 1, 1, 1, 1, 1,
0.3866563, -0.03576523, -1.099701, 1, 1, 1, 1, 1,
0.3888912, 1.223153, 1.217681, 1, 1, 1, 1, 1,
0.3914528, -2.312395, 3.295147, 1, 1, 1, 1, 1,
0.3957401, 0.05304973, 0.4559873, 1, 1, 1, 1, 1,
0.3978855, -0.9292128, 2.748664, 1, 1, 1, 1, 1,
0.3982544, -1.360135, 1.381384, 1, 1, 1, 1, 1,
0.3989848, -0.5646323, 2.220154, 1, 1, 1, 1, 1,
0.4000871, 0.1999711, -0.8212192, 1, 1, 1, 1, 1,
0.4012064, 0.6926706, 0.5681446, 1, 1, 1, 1, 1,
0.4079238, 1.109172, 2.08415, 1, 1, 1, 1, 1,
0.4087854, 1.008153, 1.112887, 1, 1, 1, 1, 1,
0.409991, -0.1524317, -0.3561088, 0, 0, 1, 1, 1,
0.4137243, 0.6510071, -1.084456, 1, 0, 0, 1, 1,
0.4291568, -0.6479307, 3.631474, 1, 0, 0, 1, 1,
0.4318342, -1.69466, 4.19861, 1, 0, 0, 1, 1,
0.4319602, -0.760731, 3.123762, 1, 0, 0, 1, 1,
0.4337549, 0.3076065, 1.030743, 1, 0, 0, 1, 1,
0.4362153, 0.2008478, 1.177604, 0, 0, 0, 1, 1,
0.4399896, 0.04294842, 1.081043, 0, 0, 0, 1, 1,
0.4402326, -0.7970382, 3.010939, 0, 0, 0, 1, 1,
0.4404023, -2.029007, 3.04271, 0, 0, 0, 1, 1,
0.4420017, -0.2545382, 0.87712, 0, 0, 0, 1, 1,
0.4441462, -0.3812819, 1.81772, 0, 0, 0, 1, 1,
0.446408, -0.4403196, 3.223742, 0, 0, 0, 1, 1,
0.4531328, -0.3044915, 1.733122, 1, 1, 1, 1, 1,
0.4553298, -0.06287299, 0.5466796, 1, 1, 1, 1, 1,
0.4612244, -0.4333565, 2.427952, 1, 1, 1, 1, 1,
0.4646486, -0.8486293, 0.8166909, 1, 1, 1, 1, 1,
0.4682519, -0.9642219, 1.621023, 1, 1, 1, 1, 1,
0.4715414, -0.5244139, 4.49901, 1, 1, 1, 1, 1,
0.4731345, -0.6238349, 1.621917, 1, 1, 1, 1, 1,
0.4750124, -0.9465957, 0.5535737, 1, 1, 1, 1, 1,
0.4768544, -0.7749031, 1.534949, 1, 1, 1, 1, 1,
0.4770001, 0.1172888, -0.4504751, 1, 1, 1, 1, 1,
0.4861932, 0.1740181, 0.4479979, 1, 1, 1, 1, 1,
0.4886987, -0.296382, 3.170441, 1, 1, 1, 1, 1,
0.488944, 0.4558292, 0.7372907, 1, 1, 1, 1, 1,
0.4907058, -0.4575767, 1.328569, 1, 1, 1, 1, 1,
0.4912066, -0.6120566, 3.344927, 1, 1, 1, 1, 1,
0.5000123, 0.5119408, 1.865946, 0, 0, 1, 1, 1,
0.5056039, -0.308187, 2.376328, 1, 0, 0, 1, 1,
0.5088674, 0.7175853, 1.614694, 1, 0, 0, 1, 1,
0.5197288, -0.7425776, 2.705844, 1, 0, 0, 1, 1,
0.520717, -1.085615, 2.512688, 1, 0, 0, 1, 1,
0.5244321, 1.523477, 1.068656, 1, 0, 0, 1, 1,
0.5276924, -1.423875, 2.289855, 0, 0, 0, 1, 1,
0.5312923, 0.9013055, 0.07265243, 0, 0, 0, 1, 1,
0.5342042, 0.144111, 0.531678, 0, 0, 0, 1, 1,
0.5372228, -1.147489, 0.7715437, 0, 0, 0, 1, 1,
0.5382101, -0.9539505, 2.390217, 0, 0, 0, 1, 1,
0.538448, -0.4600113, 4.325546, 0, 0, 0, 1, 1,
0.5439342, -1.499096, 3.407237, 0, 0, 0, 1, 1,
0.5448942, 1.070693, 1.902967, 1, 1, 1, 1, 1,
0.5487691, -0.6437156, 1.51789, 1, 1, 1, 1, 1,
0.5512654, -0.824921, 3.100515, 1, 1, 1, 1, 1,
0.551271, 0.157541, 0.0939326, 1, 1, 1, 1, 1,
0.5515686, -1.035927, 2.699558, 1, 1, 1, 1, 1,
0.553678, -0.6477821, 0.4814629, 1, 1, 1, 1, 1,
0.5539562, 0.6481334, 1.335825, 1, 1, 1, 1, 1,
0.56142, -2.487158, 3.363315, 1, 1, 1, 1, 1,
0.56734, 1.896005, -0.1146019, 1, 1, 1, 1, 1,
0.5678699, 0.8509012, -0.7980906, 1, 1, 1, 1, 1,
0.5706478, -0.84527, -0.4052599, 1, 1, 1, 1, 1,
0.571897, -0.02462766, 1.461975, 1, 1, 1, 1, 1,
0.5719187, -1.204202, 3.247522, 1, 1, 1, 1, 1,
0.5740896, 1.021386, 1.698049, 1, 1, 1, 1, 1,
0.5786956, -0.4482198, 2.744467, 1, 1, 1, 1, 1,
0.5798733, 0.1447786, -0.4550876, 0, 0, 1, 1, 1,
0.5883515, 0.2452971, 2.083911, 1, 0, 0, 1, 1,
0.5920517, -1.471566, 4.761356, 1, 0, 0, 1, 1,
0.5987456, -1.134414, 3.124795, 1, 0, 0, 1, 1,
0.6012697, 0.9194114, 0.3704681, 1, 0, 0, 1, 1,
0.605326, 0.9890187, 0.1745863, 1, 0, 0, 1, 1,
0.6080377, -1.597279, 3.15941, 0, 0, 0, 1, 1,
0.61049, 0.4493946, 1.448244, 0, 0, 0, 1, 1,
0.6111855, -1.096264, 4.017326, 0, 0, 0, 1, 1,
0.611579, -0.02556643, -0.01568808, 0, 0, 0, 1, 1,
0.6125484, 1.687626, 1.08543, 0, 0, 0, 1, 1,
0.6158413, 0.8435275, 1.424983, 0, 0, 0, 1, 1,
0.6162922, -0.5428647, 2.333039, 0, 0, 0, 1, 1,
0.6180601, 0.3588976, 0.5663964, 1, 1, 1, 1, 1,
0.6181017, 0.3642781, -1.087167, 1, 1, 1, 1, 1,
0.6209671, -0.3210598, 2.119461, 1, 1, 1, 1, 1,
0.62277, 0.8565301, 1.367085, 1, 1, 1, 1, 1,
0.6268851, -0.3981237, 1.508433, 1, 1, 1, 1, 1,
0.6281661, 1.923028, -1.889725, 1, 1, 1, 1, 1,
0.6310152, -0.3665703, 1.252544, 1, 1, 1, 1, 1,
0.6337845, 0.05256121, 2.94656, 1, 1, 1, 1, 1,
0.6341503, 0.3201146, 1.125028, 1, 1, 1, 1, 1,
0.6348155, 0.8631365, 1.035895, 1, 1, 1, 1, 1,
0.6404135, 1.008797, -0.9582915, 1, 1, 1, 1, 1,
0.6428, -0.4787432, 0.1573513, 1, 1, 1, 1, 1,
0.64666, 1.49966, -0.2065714, 1, 1, 1, 1, 1,
0.6480658, -0.3857356, 2.415436, 1, 1, 1, 1, 1,
0.6494119, 0.2785151, 0.2614311, 1, 1, 1, 1, 1,
0.6541852, 0.3421824, 0.1259588, 0, 0, 1, 1, 1,
0.6623193, -0.2901994, 0.7312874, 1, 0, 0, 1, 1,
0.6638599, 1.407897, -0.6195421, 1, 0, 0, 1, 1,
0.6661271, 0.3940195, 0.9514441, 1, 0, 0, 1, 1,
0.668746, 0.4844872, 0.01247123, 1, 0, 0, 1, 1,
0.6740239, -0.2011125, 1.41033, 1, 0, 0, 1, 1,
0.6766745, 0.03406528, 3.979707, 0, 0, 0, 1, 1,
0.6768562, 1.114163, 0.5908441, 0, 0, 0, 1, 1,
0.6816502, 1.681556, 1.539937, 0, 0, 0, 1, 1,
0.6817621, -0.4164751, 0.1248735, 0, 0, 0, 1, 1,
0.6849067, -0.8526838, 2.466642, 0, 0, 0, 1, 1,
0.6882099, -0.9653193, 2.632275, 0, 0, 0, 1, 1,
0.6916963, -0.3860877, 0.9955428, 0, 0, 0, 1, 1,
0.6937868, -1.055396, 3.05896, 1, 1, 1, 1, 1,
0.6940641, -0.9153574, 2.315675, 1, 1, 1, 1, 1,
0.7004412, -0.05746125, 3.050091, 1, 1, 1, 1, 1,
0.7025892, 0.05508763, 1.50429, 1, 1, 1, 1, 1,
0.703693, -1.677864, 2.472501, 1, 1, 1, 1, 1,
0.7056341, -2.229976, 3.333704, 1, 1, 1, 1, 1,
0.7122658, 0.9826919, 0.377892, 1, 1, 1, 1, 1,
0.7162426, -0.0140052, 2.008289, 1, 1, 1, 1, 1,
0.7181101, -0.02904403, 2.602324, 1, 1, 1, 1, 1,
0.7233574, -1.642962, 3.876267, 1, 1, 1, 1, 1,
0.7248834, -1.417977, 2.944701, 1, 1, 1, 1, 1,
0.7314127, 0.5053917, 2.149944, 1, 1, 1, 1, 1,
0.7340721, -0.4713887, 2.39726, 1, 1, 1, 1, 1,
0.7375175, 0.1489557, 3.151136, 1, 1, 1, 1, 1,
0.7390288, 0.06737695, 1.184778, 1, 1, 1, 1, 1,
0.745194, -0.8899459, 0.6793499, 0, 0, 1, 1, 1,
0.7548111, -1.163578, 4.322269, 1, 0, 0, 1, 1,
0.7606733, 0.6552333, 1.033316, 1, 0, 0, 1, 1,
0.7619517, -0.3373467, 0.913183, 1, 0, 0, 1, 1,
0.7627878, 0.3598764, 0.6149604, 1, 0, 0, 1, 1,
0.7645244, -0.08034101, 1.380615, 1, 0, 0, 1, 1,
0.7696222, -1.517788, 1.395127, 0, 0, 0, 1, 1,
0.7863289, -2.494901, 3.708623, 0, 0, 0, 1, 1,
0.7863469, 0.8368239, 1.458472, 0, 0, 0, 1, 1,
0.7892737, -0.9008822, 2.434842, 0, 0, 0, 1, 1,
0.7897142, 0.9230494, 0.5719989, 0, 0, 0, 1, 1,
0.790153, 1.422446, 1.216939, 0, 0, 0, 1, 1,
0.8018121, -0.8693298, 3.689595, 0, 0, 0, 1, 1,
0.8025467, 0.1505814, 1.147036, 1, 1, 1, 1, 1,
0.8088403, -0.2857109, 1.570988, 1, 1, 1, 1, 1,
0.809283, -2.106597, 2.347053, 1, 1, 1, 1, 1,
0.8098881, -0.1447033, 2.529023, 1, 1, 1, 1, 1,
0.8130641, 1.14859, 1.041066, 1, 1, 1, 1, 1,
0.821404, 2.045549, 0.9613926, 1, 1, 1, 1, 1,
0.8264284, 0.3541031, 1.002784, 1, 1, 1, 1, 1,
0.8306091, 0.5354719, 0.7339555, 1, 1, 1, 1, 1,
0.832569, -0.3655414, 2.758708, 1, 1, 1, 1, 1,
0.832664, -0.2699382, 0.2732205, 1, 1, 1, 1, 1,
0.8367626, -1.155186, 2.649388, 1, 1, 1, 1, 1,
0.8399256, -2.697748, 3.689359, 1, 1, 1, 1, 1,
0.8399306, 1.185119, -0.513666, 1, 1, 1, 1, 1,
0.8472083, 0.8784307, 1.667481, 1, 1, 1, 1, 1,
0.849565, -0.9078907, 3.558449, 1, 1, 1, 1, 1,
0.8530964, -0.5553133, 1.631932, 0, 0, 1, 1, 1,
0.854373, 0.979055, 0.005937453, 1, 0, 0, 1, 1,
0.8557972, -0.3697225, 2.631346, 1, 0, 0, 1, 1,
0.8615504, -0.9509656, 2.967413, 1, 0, 0, 1, 1,
0.8622156, -1.253256, 1.754557, 1, 0, 0, 1, 1,
0.8689854, -0.1357397, 2.333684, 1, 0, 0, 1, 1,
0.8743464, 0.2968054, 0.873201, 0, 0, 0, 1, 1,
0.8760451, -0.545369, 1.339799, 0, 0, 0, 1, 1,
0.8764855, 2.080602, 1.204581, 0, 0, 0, 1, 1,
0.8772081, 1.055202, -0.9813421, 0, 0, 0, 1, 1,
0.8789836, -0.1380603, 2.048235, 0, 0, 0, 1, 1,
0.8882322, 1.121584, 0.4879101, 0, 0, 0, 1, 1,
0.890897, 0.3178472, -0.6453145, 0, 0, 0, 1, 1,
0.8925539, 0.03498623, 0.7266592, 1, 1, 1, 1, 1,
0.8960019, 0.8786345, 0.5512137, 1, 1, 1, 1, 1,
0.8977951, -1.010468, 2.434994, 1, 1, 1, 1, 1,
0.8980833, -0.8994728, 1.344247, 1, 1, 1, 1, 1,
0.9012177, 0.4822628, 0.9632401, 1, 1, 1, 1, 1,
0.9030921, -0.3321985, 2.872846, 1, 1, 1, 1, 1,
0.9041308, -1.248982, 2.396012, 1, 1, 1, 1, 1,
0.9058312, -0.7464767, 1.684133, 1, 1, 1, 1, 1,
0.90608, -1.750779, 1.453859, 1, 1, 1, 1, 1,
0.9123608, 1.469782, 0.5183701, 1, 1, 1, 1, 1,
0.9249368, 0.2698891, 0.5750877, 1, 1, 1, 1, 1,
0.9266306, 1.674135, 1.425227, 1, 1, 1, 1, 1,
0.9266325, 0.1412892, 0.4339954, 1, 1, 1, 1, 1,
0.9272338, -0.4720949, 1.363933, 1, 1, 1, 1, 1,
0.9293652, 0.4053226, 2.198663, 1, 1, 1, 1, 1,
0.9380381, -1.575852, 1.792018, 0, 0, 1, 1, 1,
0.9394021, 0.341073, 1.49043, 1, 0, 0, 1, 1,
0.9400167, -1.453174, 5.795701, 1, 0, 0, 1, 1,
0.9407995, -0.3026459, 2.198415, 1, 0, 0, 1, 1,
0.9421819, 0.3329121, -0.1034551, 1, 0, 0, 1, 1,
0.9434091, 0.4144452, 2.613295, 1, 0, 0, 1, 1,
0.9510823, 1.13401, 0.6829533, 0, 0, 0, 1, 1,
0.9513933, 0.9700803, 0.270954, 0, 0, 0, 1, 1,
0.9541482, -1.078932, 0.2968927, 0, 0, 0, 1, 1,
0.9552183, 0.3036203, 2.557446, 0, 0, 0, 1, 1,
0.9565511, -2.224755, 1.871421, 0, 0, 0, 1, 1,
0.9572452, -0.3175989, 3.646162, 0, 0, 0, 1, 1,
0.9626253, -0.726458, 1.672936, 0, 0, 0, 1, 1,
0.9650185, 0.9327174, 2.545887, 1, 1, 1, 1, 1,
0.9697052, -1.005674, 1.097188, 1, 1, 1, 1, 1,
0.9726199, -0.8545539, 4.263055, 1, 1, 1, 1, 1,
0.9736432, -0.8000122, 1.88185, 1, 1, 1, 1, 1,
0.9756861, -2.624412, 4.104022, 1, 1, 1, 1, 1,
0.9776919, 0.716186, 2.511019, 1, 1, 1, 1, 1,
0.9877177, -0.4794131, 0.4661133, 1, 1, 1, 1, 1,
0.9884218, -0.7876984, 1.938292, 1, 1, 1, 1, 1,
0.9900967, -0.6246992, 2.773012, 1, 1, 1, 1, 1,
0.9942781, -0.439838, 2.456368, 1, 1, 1, 1, 1,
0.9947957, 0.4912152, 0.4335174, 1, 1, 1, 1, 1,
0.9954637, -0.5549397, 1.252195, 1, 1, 1, 1, 1,
0.9984996, 1.524318, 0.5280185, 1, 1, 1, 1, 1,
0.9994103, 0.6144878, 1.201474, 1, 1, 1, 1, 1,
1.011476, -0.1089326, 0.3274541, 1, 1, 1, 1, 1,
1.022724, -0.8857021, 3.849321, 0, 0, 1, 1, 1,
1.023917, -0.4354724, 1.399467, 1, 0, 0, 1, 1,
1.027296, 0.02513737, 3.713209, 1, 0, 0, 1, 1,
1.028817, 0.9018967, 1.233907, 1, 0, 0, 1, 1,
1.029032, -0.5083672, 2.511154, 1, 0, 0, 1, 1,
1.032328, -0.1437733, 0.03180281, 1, 0, 0, 1, 1,
1.032423, -1.330104, 2.496228, 0, 0, 0, 1, 1,
1.032504, 0.1928409, 0.5056514, 0, 0, 0, 1, 1,
1.034947, -0.9203162, 2.295847, 0, 0, 0, 1, 1,
1.035748, -0.2161199, 2.171195, 0, 0, 0, 1, 1,
1.038169, 0.7844329, 0.9672719, 0, 0, 0, 1, 1,
1.0399, 1.314906, 3.387994, 0, 0, 0, 1, 1,
1.044131, -0.1913503, 2.017042, 0, 0, 0, 1, 1,
1.045066, -1.205639, 3.210541, 1, 1, 1, 1, 1,
1.052106, -0.9259888, 2.476427, 1, 1, 1, 1, 1,
1.057825, -1.347723, 1.967178, 1, 1, 1, 1, 1,
1.061454, 0.4133047, 0.2757894, 1, 1, 1, 1, 1,
1.064654, 0.8202715, 0.4936437, 1, 1, 1, 1, 1,
1.067411, -1.261501, -1.129632, 1, 1, 1, 1, 1,
1.067424, 0.6188734, 0.6644908, 1, 1, 1, 1, 1,
1.076568, 0.2830044, 0.1122894, 1, 1, 1, 1, 1,
1.079242, -1.37673, 3.093562, 1, 1, 1, 1, 1,
1.085929, 0.3915371, 1.378035, 1, 1, 1, 1, 1,
1.086043, -0.6107985, 1.013223, 1, 1, 1, 1, 1,
1.090698, 0.740447, -1.265236, 1, 1, 1, 1, 1,
1.092697, 0.167904, 0.6466466, 1, 1, 1, 1, 1,
1.098028, -0.7106359, 3.194076, 1, 1, 1, 1, 1,
1.102686, 0.9585643, 2.744846, 1, 1, 1, 1, 1,
1.109236, 0.6568083, 1.180564, 0, 0, 1, 1, 1,
1.112092, 1.974781, 0.4718127, 1, 0, 0, 1, 1,
1.112768, 0.7407484, 0.2262075, 1, 0, 0, 1, 1,
1.118431, 1.838978, -1.236666, 1, 0, 0, 1, 1,
1.118901, -0.1715337, 1.435541, 1, 0, 0, 1, 1,
1.129821, -1.423632, 3.036419, 1, 0, 0, 1, 1,
1.161003, 0.600324, -0.8149646, 0, 0, 0, 1, 1,
1.177206, 0.5450668, -0.3740871, 0, 0, 0, 1, 1,
1.178395, -2.576711, 3.49022, 0, 0, 0, 1, 1,
1.179111, 2.243073, 0.8619564, 0, 0, 0, 1, 1,
1.180033, -0.03457723, 1.131094, 0, 0, 0, 1, 1,
1.184182, -0.1444085, 0.9263129, 0, 0, 0, 1, 1,
1.186176, -0.4052937, 1.955855, 0, 0, 0, 1, 1,
1.18743, -0.2458392, 2.501817, 1, 1, 1, 1, 1,
1.191095, -0.3965909, 1.111833, 1, 1, 1, 1, 1,
1.193313, -0.3557359, 2.086107, 1, 1, 1, 1, 1,
1.196474, 0.5394899, 2.873748, 1, 1, 1, 1, 1,
1.199791, -0.7192798, 2.529479, 1, 1, 1, 1, 1,
1.205396, 0.7220406, 1.653088, 1, 1, 1, 1, 1,
1.213493, 1.870887, 0.5891979, 1, 1, 1, 1, 1,
1.217203, 0.6268557, 1.750254, 1, 1, 1, 1, 1,
1.228077, -3.237403, 3.709222, 1, 1, 1, 1, 1,
1.229306, -1.047534, 1.91342, 1, 1, 1, 1, 1,
1.230453, 0.1684361, 0.6787198, 1, 1, 1, 1, 1,
1.230769, 0.5755093, 0.2300627, 1, 1, 1, 1, 1,
1.242764, 1.597017, 1.874767, 1, 1, 1, 1, 1,
1.24299, 1.045124, 0.9647899, 1, 1, 1, 1, 1,
1.245561, 0.1784033, 1.77305, 1, 1, 1, 1, 1,
1.25524, 1.704328, -0.03869663, 0, 0, 1, 1, 1,
1.257957, -0.5077103, 2.301461, 1, 0, 0, 1, 1,
1.268596, 0.6761, -1.342694, 1, 0, 0, 1, 1,
1.283725, 1.904222, 0.07841989, 1, 0, 0, 1, 1,
1.286335, 1.168001, 0.7083429, 1, 0, 0, 1, 1,
1.293529, 1.978587, 0.194141, 1, 0, 0, 1, 1,
1.297269, -1.39836, 2.561005, 0, 0, 0, 1, 1,
1.299025, -0.2939204, 1.808949, 0, 0, 0, 1, 1,
1.308699, -1.151039, 1.699152, 0, 0, 0, 1, 1,
1.310271, 1.639628, -0.3468632, 0, 0, 0, 1, 1,
1.336739, -0.9415391, 3.396691, 0, 0, 0, 1, 1,
1.34723, -0.3567483, 0.5996266, 0, 0, 0, 1, 1,
1.3547, -2.452597, 1.113032, 0, 0, 0, 1, 1,
1.355103, -0.574314, 1.681591, 1, 1, 1, 1, 1,
1.355667, 0.1611053, 0.4090231, 1, 1, 1, 1, 1,
1.359412, -0.07761538, 0.3973953, 1, 1, 1, 1, 1,
1.36092, 0.0788964, 1.779256, 1, 1, 1, 1, 1,
1.36999, -0.5227835, 1.465549, 1, 1, 1, 1, 1,
1.373413, 1.407472, 1.324709, 1, 1, 1, 1, 1,
1.375959, 1.654783, 0.580628, 1, 1, 1, 1, 1,
1.378283, -0.4305089, 0.623368, 1, 1, 1, 1, 1,
1.389509, 1.508832, 0.8765774, 1, 1, 1, 1, 1,
1.389701, -0.4402245, 0.1968364, 1, 1, 1, 1, 1,
1.390396, -0.7442279, 3.041871, 1, 1, 1, 1, 1,
1.391956, -0.597065, 3.075639, 1, 1, 1, 1, 1,
1.394908, -1.937358, 2.962999, 1, 1, 1, 1, 1,
1.395056, 0.9041067, 1.264202, 1, 1, 1, 1, 1,
1.401527, 0.6969975, 0.3158517, 1, 1, 1, 1, 1,
1.410876, 0.9852309, 2.458798, 0, 0, 1, 1, 1,
1.422256, 0.3625134, 3.159608, 1, 0, 0, 1, 1,
1.440027, 0.08692317, 1.221004, 1, 0, 0, 1, 1,
1.441986, -0.1753603, 2.300679, 1, 0, 0, 1, 1,
1.44419, -0.4645744, 3.585667, 1, 0, 0, 1, 1,
1.447448, -0.6717188, 2.779751, 1, 0, 0, 1, 1,
1.464831, 0.9998367, 1.370018, 0, 0, 0, 1, 1,
1.465083, -0.1650384, 1.79553, 0, 0, 0, 1, 1,
1.479366, -2.331803, 1.257538, 0, 0, 0, 1, 1,
1.479728, 0.945712, 1.413759, 0, 0, 0, 1, 1,
1.481046, -0.06422492, 0.1899758, 0, 0, 0, 1, 1,
1.485044, 0.1429618, 2.103836, 0, 0, 0, 1, 1,
1.510975, -1.4323, 3.84629, 0, 0, 0, 1, 1,
1.518436, 1.351633, -0.4271458, 1, 1, 1, 1, 1,
1.519547, 1.380231, 2.060764, 1, 1, 1, 1, 1,
1.524251, 1.493046, -0.2159029, 1, 1, 1, 1, 1,
1.532495, -0.5632767, 1.774569, 1, 1, 1, 1, 1,
1.543903, -0.6351926, 2.723736, 1, 1, 1, 1, 1,
1.565177, -0.3086741, 2.655685, 1, 1, 1, 1, 1,
1.565385, -0.1070853, 2.303723, 1, 1, 1, 1, 1,
1.589104, -0.5361804, 0.265054, 1, 1, 1, 1, 1,
1.590721, -0.744177, 2.527761, 1, 1, 1, 1, 1,
1.597761, -0.5570204, 2.268929, 1, 1, 1, 1, 1,
1.603097, 0.9878121, 0.9579486, 1, 1, 1, 1, 1,
1.610079, -0.9354187, 2.40428, 1, 1, 1, 1, 1,
1.610237, -0.9886259, 2.310313, 1, 1, 1, 1, 1,
1.615206, 1.017116, 1.240073, 1, 1, 1, 1, 1,
1.618569, 1.753074, 1.235068, 1, 1, 1, 1, 1,
1.623628, -0.4421041, 2.247195, 0, 0, 1, 1, 1,
1.63129, -0.05403339, 1.37567, 1, 0, 0, 1, 1,
1.658121, -1.232652, 1.848263, 1, 0, 0, 1, 1,
1.66091, 1.0874, 0.2862888, 1, 0, 0, 1, 1,
1.664873, -0.8935239, 1.524024, 1, 0, 0, 1, 1,
1.666602, -0.6737008, 0.8768589, 1, 0, 0, 1, 1,
1.691037, -1.328416, 2.369058, 0, 0, 0, 1, 1,
1.705562, -0.3303999, 2.552509, 0, 0, 0, 1, 1,
1.718331, -0.8932152, 3.075685, 0, 0, 0, 1, 1,
1.752875, 1.160862, 1.211895, 0, 0, 0, 1, 1,
1.75334, -0.4123846, 3.457926, 0, 0, 0, 1, 1,
1.755193, 0.2705685, 1.387723, 0, 0, 0, 1, 1,
1.782518, -0.3548661, 1.435085, 0, 0, 0, 1, 1,
1.807221, -0.2303865, 0.6841035, 1, 1, 1, 1, 1,
1.809539, -0.0124534, 0.7858156, 1, 1, 1, 1, 1,
1.81927, -2.02866, 2.199005, 1, 1, 1, 1, 1,
1.847295, 0.4954521, -0.4781276, 1, 1, 1, 1, 1,
1.848191, -0.5576842, 1.520168, 1, 1, 1, 1, 1,
1.878427, -1.261749, 1.75641, 1, 1, 1, 1, 1,
1.886189, -2.403099, 1.233793, 1, 1, 1, 1, 1,
1.890525, 1.733897, 2.750057, 1, 1, 1, 1, 1,
1.918128, 0.1986756, 3.971919, 1, 1, 1, 1, 1,
1.952414, 1.695905, 0.959353, 1, 1, 1, 1, 1,
2.007601, 0.3552279, -0.8340772, 1, 1, 1, 1, 1,
2.011505, -0.04922796, 1.25433, 1, 1, 1, 1, 1,
2.035859, -0.7134064, 0.07134174, 1, 1, 1, 1, 1,
2.046232, 0.5093104, 0.7846041, 1, 1, 1, 1, 1,
2.068025, 0.03800913, -0.417878, 1, 1, 1, 1, 1,
2.142146, -0.4426721, 0.8699052, 0, 0, 1, 1, 1,
2.193457, 0.02137573, -0.21661, 1, 0, 0, 1, 1,
2.193798, 0.141623, 1.816212, 1, 0, 0, 1, 1,
2.243478, 0.1627895, 1.810504, 1, 0, 0, 1, 1,
2.272441, -2.332206, 3.14427, 1, 0, 0, 1, 1,
2.364857, 0.9022269, -0.4940089, 1, 0, 0, 1, 1,
2.403234, -1.718153, 1.230758, 0, 0, 0, 1, 1,
2.484268, -0.6854227, 1.874135, 0, 0, 0, 1, 1,
2.545913, -0.1556323, 3.048344, 0, 0, 0, 1, 1,
2.556736, 1.131342, 0.1836212, 0, 0, 0, 1, 1,
2.600694, -0.2957825, 2.612488, 0, 0, 0, 1, 1,
2.632963, -1.475667, 2.369977, 0, 0, 0, 1, 1,
2.638977, -0.2487883, 0.1113749, 0, 0, 0, 1, 1,
2.656977, 1.800116, 1.683023, 1, 1, 1, 1, 1,
2.756094, -1.616571, 2.766854, 1, 1, 1, 1, 1,
2.779001, 0.02594841, 2.682897, 1, 1, 1, 1, 1,
2.82147, 1.813862, 0.6717817, 1, 1, 1, 1, 1,
2.856668, -0.4383675, 1.981654, 1, 1, 1, 1, 1,
2.96307, 0.2497163, 1.609654, 1, 1, 1, 1, 1,
3.042416, 0.8232827, 0.2018063, 1, 1, 1, 1, 1
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
var radius = 9.653195;
var distance = 33.90643;
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
mvMatrix.translate( -0.06642592, 0.03718662, -0.322016 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90643);
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
