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
-2.929765, 0.1428634, -1.310861, 1, 0, 0, 1,
-2.817985, 0.9508829, -1.02966, 1, 0.007843138, 0, 1,
-2.526427, 0.6224618, -1.773652, 1, 0.01176471, 0, 1,
-2.358118, 0.5019495, -3.269204, 1, 0.01960784, 0, 1,
-2.316999, -0.077851, -2.53601, 1, 0.02352941, 0, 1,
-2.290853, 1.401946, -0.8949949, 1, 0.03137255, 0, 1,
-2.225681, 1.079698, -0.4780068, 1, 0.03529412, 0, 1,
-2.157673, 1.265885, -2.190168, 1, 0.04313726, 0, 1,
-2.148424, 0.1442274, -1.568763, 1, 0.04705882, 0, 1,
-2.128123, 0.03546958, -0.6248366, 1, 0.05490196, 0, 1,
-2.039615, 1.77336, -2.002742, 1, 0.05882353, 0, 1,
-2.000805, 0.9297012, -2.241987, 1, 0.06666667, 0, 1,
-1.997981, 1.264374, -0.3941654, 1, 0.07058824, 0, 1,
-1.991638, -0.8198198, -0.01905319, 1, 0.07843138, 0, 1,
-1.953916, 0.2215222, -1.353367, 1, 0.08235294, 0, 1,
-1.938718, -0.05514785, -0.450054, 1, 0.09019608, 0, 1,
-1.927158, 1.781204, 0.6518881, 1, 0.09411765, 0, 1,
-1.917302, 1.043604, 0.4122465, 1, 0.1019608, 0, 1,
-1.900591, -2.741471, -1.631751, 1, 0.1098039, 0, 1,
-1.892486, -0.6674238, -1.172938, 1, 0.1137255, 0, 1,
-1.887996, -1.171404, -1.982854, 1, 0.1215686, 0, 1,
-1.87507, 0.7184187, -2.794397, 1, 0.1254902, 0, 1,
-1.867073, 1.692766, -1.652268, 1, 0.1333333, 0, 1,
-1.850957, -0.1095383, -2.632954, 1, 0.1372549, 0, 1,
-1.846666, -1.119535, -2.121005, 1, 0.145098, 0, 1,
-1.806323, -0.6774748, -0.2362663, 1, 0.1490196, 0, 1,
-1.804034, -1.412534, -1.656005, 1, 0.1568628, 0, 1,
-1.802997, -0.1957809, -3.124656, 1, 0.1607843, 0, 1,
-1.796811, -0.4235951, -3.02567, 1, 0.1686275, 0, 1,
-1.796565, 1.220742, -2.045613, 1, 0.172549, 0, 1,
-1.789302, 0.1260516, -0.8256742, 1, 0.1803922, 0, 1,
-1.785537, 0.3975125, -2.595855, 1, 0.1843137, 0, 1,
-1.773653, 1.340704, -0.1119951, 1, 0.1921569, 0, 1,
-1.748208, 1.184513, -0.6697978, 1, 0.1960784, 0, 1,
-1.731522, 0.6171421, 0.5233697, 1, 0.2039216, 0, 1,
-1.726001, 0.06100276, -1.521391, 1, 0.2117647, 0, 1,
-1.723465, -2.134794, -0.7327923, 1, 0.2156863, 0, 1,
-1.716007, -0.4951951, -2.022882, 1, 0.2235294, 0, 1,
-1.674696, -0.3764916, -2.372814, 1, 0.227451, 0, 1,
-1.667344, 2.767011, -2.108958, 1, 0.2352941, 0, 1,
-1.638662, 0.4398066, -1.338493, 1, 0.2392157, 0, 1,
-1.633362, 1.073618, -1.117121, 1, 0.2470588, 0, 1,
-1.62656, 0.1116328, -2.986876, 1, 0.2509804, 0, 1,
-1.621614, 2.397677, -3.373819, 1, 0.2588235, 0, 1,
-1.606442, 1.216632, -1.43601, 1, 0.2627451, 0, 1,
-1.601598, 0.7434555, -1.794564, 1, 0.2705882, 0, 1,
-1.594316, 0.4057555, -1.761497, 1, 0.2745098, 0, 1,
-1.580161, 0.2880086, -0.962785, 1, 0.282353, 0, 1,
-1.578832, -1.132908, -2.09898, 1, 0.2862745, 0, 1,
-1.574638, 1.015914, -0.8714897, 1, 0.2941177, 0, 1,
-1.557521, 0.6182969, 0.03088103, 1, 0.3019608, 0, 1,
-1.540867, 0.4731969, -0.2103202, 1, 0.3058824, 0, 1,
-1.526736, 1.562336, -0.07076333, 1, 0.3137255, 0, 1,
-1.52275, 0.09368919, -1.215149, 1, 0.3176471, 0, 1,
-1.518049, -2.65371, -3.303521, 1, 0.3254902, 0, 1,
-1.517228, -0.4879511, -1.858665, 1, 0.3294118, 0, 1,
-1.515512, 0.9397697, -2.207377, 1, 0.3372549, 0, 1,
-1.509403, 0.03992381, -1.89517, 1, 0.3411765, 0, 1,
-1.508137, -0.316405, 0.2007652, 1, 0.3490196, 0, 1,
-1.504771, -0.3425688, -1.100139, 1, 0.3529412, 0, 1,
-1.491978, -1.762541, -1.776431, 1, 0.3607843, 0, 1,
-1.481784, 1.00818, -0.4603159, 1, 0.3647059, 0, 1,
-1.479611, 0.3419048, -1.358354, 1, 0.372549, 0, 1,
-1.478943, 1.80811, -0.7353382, 1, 0.3764706, 0, 1,
-1.471004, 0.420559, -1.260612, 1, 0.3843137, 0, 1,
-1.467797, 0.2396781, -0.4419989, 1, 0.3882353, 0, 1,
-1.461517, -1.912158, -2.625127, 1, 0.3960784, 0, 1,
-1.459746, -0.5010721, -1.780039, 1, 0.4039216, 0, 1,
-1.456662, -1.039021, -1.992413, 1, 0.4078431, 0, 1,
-1.443721, -0.7624013, -1.339149, 1, 0.4156863, 0, 1,
-1.428785, -0.5537606, -1.488924, 1, 0.4196078, 0, 1,
-1.425089, -1.643296, -0.9701363, 1, 0.427451, 0, 1,
-1.415489, -0.376306, -0.9728878, 1, 0.4313726, 0, 1,
-1.414494, -2.008172, -0.5156639, 1, 0.4392157, 0, 1,
-1.41239, 0.4474678, -0.7039779, 1, 0.4431373, 0, 1,
-1.379917, 1.131227, -2.01281, 1, 0.4509804, 0, 1,
-1.37202, -0.1639991, -2.98073, 1, 0.454902, 0, 1,
-1.370716, -0.5342109, -2.801885, 1, 0.4627451, 0, 1,
-1.353779, -0.9597796, -3.182115, 1, 0.4666667, 0, 1,
-1.349168, -0.4937538, -0.8431004, 1, 0.4745098, 0, 1,
-1.340184, -1.229044, -1.243057, 1, 0.4784314, 0, 1,
-1.335888, 0.5275108, 1.280131, 1, 0.4862745, 0, 1,
-1.320341, -1.695872, -2.835084, 1, 0.4901961, 0, 1,
-1.316481, 1.88853, -0.04821503, 1, 0.4980392, 0, 1,
-1.304712, 2.186932, -0.4416554, 1, 0.5058824, 0, 1,
-1.301674, -1.769277, -1.190755, 1, 0.509804, 0, 1,
-1.295798, 0.4252081, -1.526223, 1, 0.5176471, 0, 1,
-1.282985, -0.4959465, -2.377088, 1, 0.5215687, 0, 1,
-1.28094, 0.779659, 0.9878263, 1, 0.5294118, 0, 1,
-1.257054, -0.8632511, -2.424261, 1, 0.5333334, 0, 1,
-1.251889, 1.235435, -1.835272, 1, 0.5411765, 0, 1,
-1.246802, 0.2424187, -1.369292, 1, 0.5450981, 0, 1,
-1.240509, 0.1209533, -1.57604, 1, 0.5529412, 0, 1,
-1.229142, 0.004159062, -1.326051, 1, 0.5568628, 0, 1,
-1.222642, -0.08941212, -2.370306, 1, 0.5647059, 0, 1,
-1.221033, 0.2272148, -0.7617588, 1, 0.5686275, 0, 1,
-1.216571, -0.8972848, -1.65884, 1, 0.5764706, 0, 1,
-1.213782, 1.03995, 0.4726289, 1, 0.5803922, 0, 1,
-1.212138, 2.035661, 0.7471212, 1, 0.5882353, 0, 1,
-1.208421, 1.564093, -1.593767, 1, 0.5921569, 0, 1,
-1.206415, -0.2380227, -1.718067, 1, 0.6, 0, 1,
-1.201457, -0.7734616, -2.747476, 1, 0.6078432, 0, 1,
-1.200395, 0.4170683, -0.7802996, 1, 0.6117647, 0, 1,
-1.198341, -1.412078, -1.27497, 1, 0.6196079, 0, 1,
-1.198083, 0.3244287, -3.211239, 1, 0.6235294, 0, 1,
-1.194246, 1.794093, -1.603688, 1, 0.6313726, 0, 1,
-1.191272, 1.13494, -0.5275759, 1, 0.6352941, 0, 1,
-1.191248, 0.8965583, -0.7971703, 1, 0.6431373, 0, 1,
-1.187506, 0.8608704, -1.000053, 1, 0.6470588, 0, 1,
-1.18704, -0.3520261, -0.09672703, 1, 0.654902, 0, 1,
-1.176029, 1.119091, -1.12215, 1, 0.6588235, 0, 1,
-1.175454, 0.09334067, -0.2580546, 1, 0.6666667, 0, 1,
-1.173201, -1.016852, -0.9621354, 1, 0.6705883, 0, 1,
-1.160986, -2.094837, -2.619621, 1, 0.6784314, 0, 1,
-1.159096, -0.1833532, -0.8568184, 1, 0.682353, 0, 1,
-1.15887, -0.3289799, -1.484378, 1, 0.6901961, 0, 1,
-1.145932, 0.5774096, -0.2639454, 1, 0.6941177, 0, 1,
-1.139041, 0.3932699, -2.028537, 1, 0.7019608, 0, 1,
-1.135592, -1.472009, -1.433511, 1, 0.7098039, 0, 1,
-1.132377, 0.1598072, -0.6307682, 1, 0.7137255, 0, 1,
-1.127992, 0.6574006, -1.809438, 1, 0.7215686, 0, 1,
-1.121985, 0.63936, -0.367593, 1, 0.7254902, 0, 1,
-1.121334, 0.5330446, -3.082234, 1, 0.7333333, 0, 1,
-1.107368, 0.1613238, -0.3466511, 1, 0.7372549, 0, 1,
-1.102958, -0.4574381, -0.4064081, 1, 0.7450981, 0, 1,
-1.102726, 0.8192891, -1.94019, 1, 0.7490196, 0, 1,
-1.097835, 1.706506, -1.639037, 1, 0.7568628, 0, 1,
-1.09466, 1.189547, -0.7266386, 1, 0.7607843, 0, 1,
-1.091616, 0.2449084, 0.1462006, 1, 0.7686275, 0, 1,
-1.091573, 0.5722921, -0.6555179, 1, 0.772549, 0, 1,
-1.084671, 1.00402, -1.561389, 1, 0.7803922, 0, 1,
-1.082438, 1.245574, -1.904401, 1, 0.7843137, 0, 1,
-1.081402, 1.789869, -0.2058286, 1, 0.7921569, 0, 1,
-1.078035, -0.6003597, 0.199089, 1, 0.7960784, 0, 1,
-1.06796, 0.2793715, -2.971315, 1, 0.8039216, 0, 1,
-1.067708, -1.531942, -2.848038, 1, 0.8117647, 0, 1,
-1.066851, 1.351893, -1.696008, 1, 0.8156863, 0, 1,
-1.06212, -0.9272652, -3.938584, 1, 0.8235294, 0, 1,
-1.061805, -0.06297304, 0.08692611, 1, 0.827451, 0, 1,
-1.050085, 0.8854737, 1.520568, 1, 0.8352941, 0, 1,
-1.045137, 0.432532, -1.48833, 1, 0.8392157, 0, 1,
-1.03344, -0.7578282, -2.220141, 1, 0.8470588, 0, 1,
-1.02679, -0.932929, -4.084862, 1, 0.8509804, 0, 1,
-1.026572, -0.6446236, -1.79473, 1, 0.8588235, 0, 1,
-1.02044, -0.4247624, -2.317997, 1, 0.8627451, 0, 1,
-1.016364, -0.3284521, -2.143229, 1, 0.8705882, 0, 1,
-1.011488, 0.1453639, -0.8389623, 1, 0.8745098, 0, 1,
-1.011377, 0.3104062, -1.648641, 1, 0.8823529, 0, 1,
-1.000467, -0.2843527, -0.07615945, 1, 0.8862745, 0, 1,
-0.9976696, 0.6997581, -1.622537, 1, 0.8941177, 0, 1,
-0.9933286, 0.2411239, -2.094975, 1, 0.8980392, 0, 1,
-0.9923629, -0.9335155, -1.100705, 1, 0.9058824, 0, 1,
-0.9918094, 2.324225, -0.1051567, 1, 0.9137255, 0, 1,
-0.9903199, -0.3831676, -3.759794, 1, 0.9176471, 0, 1,
-0.9871244, 1.958469, -2.525011, 1, 0.9254902, 0, 1,
-0.9850247, -0.5875691, -3.571726, 1, 0.9294118, 0, 1,
-0.9788764, -0.1684846, -0.7453995, 1, 0.9372549, 0, 1,
-0.9756886, 3.270445, -0.6834812, 1, 0.9411765, 0, 1,
-0.9684407, 0.05712255, -2.788848, 1, 0.9490196, 0, 1,
-0.9644369, -2.72372, -4.71592, 1, 0.9529412, 0, 1,
-0.9630523, 0.5988821, -1.232232, 1, 0.9607843, 0, 1,
-0.95739, 0.1916478, -0.6918092, 1, 0.9647059, 0, 1,
-0.9551528, 0.3123011, -2.664639, 1, 0.972549, 0, 1,
-0.9535412, 0.4157519, -1.5241, 1, 0.9764706, 0, 1,
-0.9462249, 0.6948109, -0.8439268, 1, 0.9843137, 0, 1,
-0.9391598, -1.017722, -0.9332802, 1, 0.9882353, 0, 1,
-0.9292691, 0.03190326, 0.2945742, 1, 0.9960784, 0, 1,
-0.9237499, 1.397045, -1.200544, 0.9960784, 1, 0, 1,
-0.9222422, 1.352683, -0.3272895, 0.9921569, 1, 0, 1,
-0.9202309, 1.188636, -0.4450854, 0.9843137, 1, 0, 1,
-0.9142997, -0.4679268, -1.809998, 0.9803922, 1, 0, 1,
-0.9084911, 0.5423731, -0.956231, 0.972549, 1, 0, 1,
-0.9077141, -0.8228879, -2.886287, 0.9686275, 1, 0, 1,
-0.9049584, 0.5625144, 0.8344647, 0.9607843, 1, 0, 1,
-0.902081, 1.546041, 0.08734694, 0.9568627, 1, 0, 1,
-0.9001592, 0.6408519, 1.051069, 0.9490196, 1, 0, 1,
-0.8985797, -0.4864863, -0.3711714, 0.945098, 1, 0, 1,
-0.897889, -0.3532796, -1.492952, 0.9372549, 1, 0, 1,
-0.8944836, -0.8318328, -1.676716, 0.9333333, 1, 0, 1,
-0.8944439, 0.6861062, -0.319255, 0.9254902, 1, 0, 1,
-0.8906271, -0.7171531, 0.3445037, 0.9215686, 1, 0, 1,
-0.8829651, 0.3397771, -0.3896291, 0.9137255, 1, 0, 1,
-0.8825762, 1.422758, 0.2090065, 0.9098039, 1, 0, 1,
-0.879629, 1.282267, -0.3717479, 0.9019608, 1, 0, 1,
-0.8771882, 1.452885, -0.813002, 0.8941177, 1, 0, 1,
-0.8760389, -0.03618127, -1.064706, 0.8901961, 1, 0, 1,
-0.8758091, 0.9273472, 0.1131309, 0.8823529, 1, 0, 1,
-0.8632748, -0.9695653, -3.980902, 0.8784314, 1, 0, 1,
-0.8632223, 2.150703, -0.1891914, 0.8705882, 1, 0, 1,
-0.8619466, -0.3591434, -2.667403, 0.8666667, 1, 0, 1,
-0.8575778, -0.5705836, -1.078095, 0.8588235, 1, 0, 1,
-0.8532045, 1.84169, -0.8777223, 0.854902, 1, 0, 1,
-0.8490829, -0.3824058, -2.767382, 0.8470588, 1, 0, 1,
-0.8486627, 1.236996, -0.08901886, 0.8431373, 1, 0, 1,
-0.8464012, 0.5683479, -1.902924, 0.8352941, 1, 0, 1,
-0.8432047, -1.654131, -0.2639541, 0.8313726, 1, 0, 1,
-0.8411437, -0.05749894, -1.070355, 0.8235294, 1, 0, 1,
-0.8391859, -0.4689643, -2.171837, 0.8196079, 1, 0, 1,
-0.8383172, 1.631199, -0.4739912, 0.8117647, 1, 0, 1,
-0.8372313, -0.1672296, -3.186421, 0.8078431, 1, 0, 1,
-0.8359566, -1.146948, -2.904368, 0.8, 1, 0, 1,
-0.8301185, -0.2643693, -1.948366, 0.7921569, 1, 0, 1,
-0.8271877, 0.02223581, -1.121422, 0.7882353, 1, 0, 1,
-0.8237932, 2.199689, 0.06512773, 0.7803922, 1, 0, 1,
-0.8170125, 0.8983386, -1.53854, 0.7764706, 1, 0, 1,
-0.8132495, -0.5044929, -2.454088, 0.7686275, 1, 0, 1,
-0.8089952, 0.253395, -0.1259339, 0.7647059, 1, 0, 1,
-0.8025547, 0.6201081, -0.9411357, 0.7568628, 1, 0, 1,
-0.8009914, -0.4973719, -2.857032, 0.7529412, 1, 0, 1,
-0.7956359, 0.5812992, -1.295097, 0.7450981, 1, 0, 1,
-0.7947282, 0.0969067, -2.696842, 0.7411765, 1, 0, 1,
-0.7937819, 0.537212, -2.675439, 0.7333333, 1, 0, 1,
-0.7927108, -0.0278721, -1.257111, 0.7294118, 1, 0, 1,
-0.7924833, -0.9414846, -1.168465, 0.7215686, 1, 0, 1,
-0.7891818, -0.04956296, -2.158633, 0.7176471, 1, 0, 1,
-0.7884549, 0.5996504, -0.3098938, 0.7098039, 1, 0, 1,
-0.7884151, 2.064679, -1.373569, 0.7058824, 1, 0, 1,
-0.7882693, -1.042845, -2.759664, 0.6980392, 1, 0, 1,
-0.7876819, -0.7326786, -2.672639, 0.6901961, 1, 0, 1,
-0.7871032, 1.344303, -0.1935217, 0.6862745, 1, 0, 1,
-0.7841673, 0.4195863, -1.417944, 0.6784314, 1, 0, 1,
-0.7783716, 0.394042, -2.039631, 0.6745098, 1, 0, 1,
-0.7762595, 0.02958457, -2.923832, 0.6666667, 1, 0, 1,
-0.7759295, 0.4010334, -1.600813, 0.6627451, 1, 0, 1,
-0.7694572, -0.3459289, -0.03203287, 0.654902, 1, 0, 1,
-0.7676077, 0.4601709, -0.3952421, 0.6509804, 1, 0, 1,
-0.7664407, 1.902476, -1.485869, 0.6431373, 1, 0, 1,
-0.7594371, -0.1553991, 0.2133854, 0.6392157, 1, 0, 1,
-0.756539, -0.3116078, -3.168463, 0.6313726, 1, 0, 1,
-0.7543457, -1.099485, -1.789492, 0.627451, 1, 0, 1,
-0.7488323, 0.01363446, -0.9941247, 0.6196079, 1, 0, 1,
-0.7478592, -2.444327, -3.183703, 0.6156863, 1, 0, 1,
-0.7395813, -0.8915238, -1.651441, 0.6078432, 1, 0, 1,
-0.7368004, -0.5762394, -1.743608, 0.6039216, 1, 0, 1,
-0.7323325, -0.945344, -3.007511, 0.5960785, 1, 0, 1,
-0.7303804, 1.110133, 2.167166, 0.5882353, 1, 0, 1,
-0.7242141, -0.7687451, -4.29501, 0.5843138, 1, 0, 1,
-0.721551, -0.9388694, -2.480232, 0.5764706, 1, 0, 1,
-0.7189588, 0.6381348, -0.5300497, 0.572549, 1, 0, 1,
-0.7179806, -0.4048865, -1.461906, 0.5647059, 1, 0, 1,
-0.7120225, -1.713288, -3.041122, 0.5607843, 1, 0, 1,
-0.7081485, 0.08820664, -3.85949, 0.5529412, 1, 0, 1,
-0.7023729, 0.6618592, 0.6041415, 0.5490196, 1, 0, 1,
-0.7009622, 0.6182773, -1.988008, 0.5411765, 1, 0, 1,
-0.695317, -1.974688, -1.675746, 0.5372549, 1, 0, 1,
-0.6896235, 0.04775342, -0.07000311, 0.5294118, 1, 0, 1,
-0.6874719, 0.8912249, -1.035843, 0.5254902, 1, 0, 1,
-0.6854019, -0.114412, -2.155776, 0.5176471, 1, 0, 1,
-0.6837049, 1.007523, 0.4939143, 0.5137255, 1, 0, 1,
-0.6835335, -1.434475, -2.402369, 0.5058824, 1, 0, 1,
-0.6788622, 1.615459, 0.2106053, 0.5019608, 1, 0, 1,
-0.6658083, 0.5461391, -0.2674471, 0.4941176, 1, 0, 1,
-0.6622861, 0.7644627, 0.03518516, 0.4862745, 1, 0, 1,
-0.6619883, 0.5877186, 1.394493, 0.4823529, 1, 0, 1,
-0.6572579, -0.7970659, -1.722336, 0.4745098, 1, 0, 1,
-0.654194, 0.3030364, -0.9749967, 0.4705882, 1, 0, 1,
-0.6521299, -0.7596013, -2.877741, 0.4627451, 1, 0, 1,
-0.6504973, 0.8031723, -1.685303, 0.4588235, 1, 0, 1,
-0.649436, -0.07978648, -1.419627, 0.4509804, 1, 0, 1,
-0.6483041, -0.7161983, -3.098526, 0.4470588, 1, 0, 1,
-0.6463556, 1.973129, -0.7648111, 0.4392157, 1, 0, 1,
-0.6448387, -0.5944477, -3.258001, 0.4352941, 1, 0, 1,
-0.6386184, 0.5806602, -1.255771, 0.427451, 1, 0, 1,
-0.6380844, 0.8767676, -0.4595135, 0.4235294, 1, 0, 1,
-0.6347221, 1.114419, -0.4204899, 0.4156863, 1, 0, 1,
-0.6336694, -0.4840115, -2.355886, 0.4117647, 1, 0, 1,
-0.6323906, 0.3298339, 0.8133847, 0.4039216, 1, 0, 1,
-0.631684, 0.8138921, 0.7150816, 0.3960784, 1, 0, 1,
-0.6293268, -1.661393, -1.896349, 0.3921569, 1, 0, 1,
-0.6290302, -1.057172, -2.558937, 0.3843137, 1, 0, 1,
-0.626357, -1.57839, -3.078846, 0.3803922, 1, 0, 1,
-0.6248239, 2.074716, 0.2472393, 0.372549, 1, 0, 1,
-0.6236144, 1.024602, 0.2424899, 0.3686275, 1, 0, 1,
-0.6227891, 0.5788055, -0.2497764, 0.3607843, 1, 0, 1,
-0.6195382, 1.751781, -0.5865985, 0.3568628, 1, 0, 1,
-0.6159168, -0.2060031, -1.56956, 0.3490196, 1, 0, 1,
-0.6132969, -0.01933526, -1.167509, 0.345098, 1, 0, 1,
-0.6126504, -0.8153939, -3.01004, 0.3372549, 1, 0, 1,
-0.6118628, 1.649057, 0.9360382, 0.3333333, 1, 0, 1,
-0.6090904, 0.4036353, -0.5779297, 0.3254902, 1, 0, 1,
-0.6046843, 1.914086, -0.6340164, 0.3215686, 1, 0, 1,
-0.6040626, 1.46275, -0.4104571, 0.3137255, 1, 0, 1,
-0.6022758, 0.2001269, -0.799919, 0.3098039, 1, 0, 1,
-0.6015652, 0.8644835, 0.7820491, 0.3019608, 1, 0, 1,
-0.5931132, -1.020949, -2.793709, 0.2941177, 1, 0, 1,
-0.589868, -1.336948, -0.4774189, 0.2901961, 1, 0, 1,
-0.5880263, 0.3845719, -1.945655, 0.282353, 1, 0, 1,
-0.5860671, -1.317067, -0.3270005, 0.2784314, 1, 0, 1,
-0.5833446, 1.039855, -1.061184, 0.2705882, 1, 0, 1,
-0.5815406, -0.191967, -0.2628054, 0.2666667, 1, 0, 1,
-0.5784344, 0.07772344, 0.5988346, 0.2588235, 1, 0, 1,
-0.5755818, -0.2230878, -2.311378, 0.254902, 1, 0, 1,
-0.5751792, 0.6290151, -1.16853, 0.2470588, 1, 0, 1,
-0.5750467, 0.279866, -0.4490231, 0.2431373, 1, 0, 1,
-0.5714511, 0.4807361, -1.608047, 0.2352941, 1, 0, 1,
-0.5710252, -0.03848396, -1.152928, 0.2313726, 1, 0, 1,
-0.5622084, 0.5266215, -1.000396, 0.2235294, 1, 0, 1,
-0.5555402, 1.047603, 0.5048972, 0.2196078, 1, 0, 1,
-0.5505156, 0.3903488, -1.609252, 0.2117647, 1, 0, 1,
-0.5473421, -2.175017, -2.373503, 0.2078431, 1, 0, 1,
-0.5449703, -0.1679724, -1.891437, 0.2, 1, 0, 1,
-0.5449008, 0.05017848, -0.6817529, 0.1921569, 1, 0, 1,
-0.5448169, 0.4854073, -0.0522577, 0.1882353, 1, 0, 1,
-0.5434784, -2.577686, -3.977896, 0.1803922, 1, 0, 1,
-0.5355871, 0.0317667, -2.041777, 0.1764706, 1, 0, 1,
-0.5346236, 0.5993747, -0.0137661, 0.1686275, 1, 0, 1,
-0.5323123, -0.4770373, -3.532387, 0.1647059, 1, 0, 1,
-0.5256268, 1.010443, -0.5998187, 0.1568628, 1, 0, 1,
-0.5212247, -2.300117, -3.634933, 0.1529412, 1, 0, 1,
-0.5161684, -0.1825424, -2.555754, 0.145098, 1, 0, 1,
-0.5160105, 0.4787586, -0.8254561, 0.1411765, 1, 0, 1,
-0.5152017, 0.737816, 0.9386318, 0.1333333, 1, 0, 1,
-0.5111524, 0.1317802, -1.284562, 0.1294118, 1, 0, 1,
-0.5099666, -1.519813, -4.004274, 0.1215686, 1, 0, 1,
-0.5091732, -1.967729, -2.767438, 0.1176471, 1, 0, 1,
-0.5082468, 1.517036, -0.8448117, 0.1098039, 1, 0, 1,
-0.5025091, 0.02313828, -0.8495042, 0.1058824, 1, 0, 1,
-0.5023466, -0.7566885, -3.279323, 0.09803922, 1, 0, 1,
-0.5009369, -0.082941, -0.8094446, 0.09019608, 1, 0, 1,
-0.4956762, -1.43152, -2.088593, 0.08627451, 1, 0, 1,
-0.4951471, 2.268482, -0.1496733, 0.07843138, 1, 0, 1,
-0.4937316, 0.7864574, -0.3676915, 0.07450981, 1, 0, 1,
-0.4892446, -0.1382676, -3.607882, 0.06666667, 1, 0, 1,
-0.4891801, -0.272952, -1.738546, 0.0627451, 1, 0, 1,
-0.4881731, -0.6270726, -2.977894, 0.05490196, 1, 0, 1,
-0.483698, -0.004046252, 0.2591893, 0.05098039, 1, 0, 1,
-0.4828362, 0.973538, 1.024263, 0.04313726, 1, 0, 1,
-0.4768867, -0.07165784, -1.561761, 0.03921569, 1, 0, 1,
-0.4757232, 1.136549, -1.093631, 0.03137255, 1, 0, 1,
-0.4737446, -0.5933257, -2.980473, 0.02745098, 1, 0, 1,
-0.4710223, 0.3882654, -1.235549, 0.01960784, 1, 0, 1,
-0.4692475, -0.146852, -2.452854, 0.01568628, 1, 0, 1,
-0.4668211, -0.4394679, -2.293088, 0.007843138, 1, 0, 1,
-0.4641024, 0.1497693, -0.9062115, 0.003921569, 1, 0, 1,
-0.4626012, 0.8915713, -1.187688, 0, 1, 0.003921569, 1,
-0.4569886, 0.4312788, -0.8191046, 0, 1, 0.01176471, 1,
-0.4539933, 0.5914248, -0.8628148, 0, 1, 0.01568628, 1,
-0.4533798, 0.3233649, -1.096668, 0, 1, 0.02352941, 1,
-0.452515, 1.409209, -1.174531, 0, 1, 0.02745098, 1,
-0.4525113, 0.7074789, 1.990386, 0, 1, 0.03529412, 1,
-0.4491512, -0.7933011, -4.017574, 0, 1, 0.03921569, 1,
-0.4460653, -0.6451597, -2.126253, 0, 1, 0.04705882, 1,
-0.4441898, -2.40554, -2.849873, 0, 1, 0.05098039, 1,
-0.4432628, -0.5610928, -2.136882, 0, 1, 0.05882353, 1,
-0.4419661, -0.879733, -1.698038, 0, 1, 0.0627451, 1,
-0.4379312, 0.05301232, -1.244807, 0, 1, 0.07058824, 1,
-0.4348919, 2.739035, -0.7937739, 0, 1, 0.07450981, 1,
-0.4347432, 0.02328284, -3.245645, 0, 1, 0.08235294, 1,
-0.4262654, 1.040454, -0.04477758, 0, 1, 0.08627451, 1,
-0.4249741, 0.5969339, 1.28666, 0, 1, 0.09411765, 1,
-0.4242313, -0.07857665, -2.136318, 0, 1, 0.1019608, 1,
-0.4219016, 0.1723364, -2.603702, 0, 1, 0.1058824, 1,
-0.4214777, -0.4410092, -3.412189, 0, 1, 0.1137255, 1,
-0.4113479, -0.7385975, -2.671655, 0, 1, 0.1176471, 1,
-0.4071571, 0.977287, -0.4207378, 0, 1, 0.1254902, 1,
-0.4065616, 0.3706698, -1.181277, 0, 1, 0.1294118, 1,
-0.4032612, 0.3678873, -0.9815642, 0, 1, 0.1372549, 1,
-0.3997448, -1.570626, -3.889279, 0, 1, 0.1411765, 1,
-0.3987425, -0.5515472, -1.821405, 0, 1, 0.1490196, 1,
-0.3983769, 0.6569866, -0.2166149, 0, 1, 0.1529412, 1,
-0.3973766, 1.141289, 0.6747535, 0, 1, 0.1607843, 1,
-0.3967266, 0.09848623, -2.726138, 0, 1, 0.1647059, 1,
-0.3910907, 0.3159824, -1.770107, 0, 1, 0.172549, 1,
-0.3900042, 0.4654559, -0.1330719, 0, 1, 0.1764706, 1,
-0.3899427, -0.03313219, -1.210052, 0, 1, 0.1843137, 1,
-0.3892999, 0.03789705, -2.440385, 0, 1, 0.1882353, 1,
-0.3875608, -1.685391, -1.708965, 0, 1, 0.1960784, 1,
-0.3860706, 0.5679619, 0.08421098, 0, 1, 0.2039216, 1,
-0.3838989, -0.9692897, -2.106177, 0, 1, 0.2078431, 1,
-0.3769136, -0.9818205, -4.230116, 0, 1, 0.2156863, 1,
-0.3766323, -1.598715, -3.271903, 0, 1, 0.2196078, 1,
-0.3699928, -0.7312044, -2.252772, 0, 1, 0.227451, 1,
-0.3672058, -0.1524432, -2.157771, 0, 1, 0.2313726, 1,
-0.3656103, 0.1043095, -1.591126, 0, 1, 0.2392157, 1,
-0.3640181, 0.5050309, 0.1797944, 0, 1, 0.2431373, 1,
-0.3626375, 0.5134485, -1.416382, 0, 1, 0.2509804, 1,
-0.3621293, 0.343325, -0.1941699, 0, 1, 0.254902, 1,
-0.3562612, -0.8681471, -2.7505, 0, 1, 0.2627451, 1,
-0.3559102, -0.5843999, -0.6072791, 0, 1, 0.2666667, 1,
-0.3557746, 0.01145118, -0.5616056, 0, 1, 0.2745098, 1,
-0.3540268, 0.7844362, 0.3254201, 0, 1, 0.2784314, 1,
-0.350044, -0.5370654, -4.700229, 0, 1, 0.2862745, 1,
-0.3494519, 0.3373513, 0.8865018, 0, 1, 0.2901961, 1,
-0.344223, -1.532909, -1.705356, 0, 1, 0.2980392, 1,
-0.3428887, 0.7366531, 0.2766275, 0, 1, 0.3058824, 1,
-0.34046, -0.004215947, -2.208006, 0, 1, 0.3098039, 1,
-0.3402401, -0.28876, -0.6793571, 0, 1, 0.3176471, 1,
-0.339509, 0.4179285, -0.3227553, 0, 1, 0.3215686, 1,
-0.3391255, 0.2297732, -1.573493, 0, 1, 0.3294118, 1,
-0.334949, -0.6962368, -3.95158, 0, 1, 0.3333333, 1,
-0.33487, -0.5813795, -2.811613, 0, 1, 0.3411765, 1,
-0.3261268, 1.595561, -2.666424, 0, 1, 0.345098, 1,
-0.3222767, 0.07452639, -0.1628317, 0, 1, 0.3529412, 1,
-0.3218982, -1.369733, -3.496176, 0, 1, 0.3568628, 1,
-0.3199028, 1.667898, -0.1195474, 0, 1, 0.3647059, 1,
-0.3184667, -0.5590033, -1.347358, 0, 1, 0.3686275, 1,
-0.3151874, 1.089097, 0.9951706, 0, 1, 0.3764706, 1,
-0.3141128, 1.729838, -0.878565, 0, 1, 0.3803922, 1,
-0.2988951, -0.430955, -2.377171, 0, 1, 0.3882353, 1,
-0.2983454, 0.2022767, 0.9227288, 0, 1, 0.3921569, 1,
-0.2910717, -0.4657268, -2.394747, 0, 1, 0.4, 1,
-0.2824302, -0.09549036, -1.89742, 0, 1, 0.4078431, 1,
-0.2768056, -0.561933, -3.9722, 0, 1, 0.4117647, 1,
-0.2759694, -0.4086065, -1.225818, 0, 1, 0.4196078, 1,
-0.2714446, -0.152747, -0.3549536, 0, 1, 0.4235294, 1,
-0.2700463, -1.075714, -4.558259, 0, 1, 0.4313726, 1,
-0.2695367, 0.9333092, 0.05369294, 0, 1, 0.4352941, 1,
-0.2679912, 0.1920021, 0.9610826, 0, 1, 0.4431373, 1,
-0.2651495, 1.344244, 0.5542004, 0, 1, 0.4470588, 1,
-0.2642437, -0.1517872, -3.419128, 0, 1, 0.454902, 1,
-0.261539, -0.1082264, -2.031863, 0, 1, 0.4588235, 1,
-0.2540965, 1.163726, -1.414337, 0, 1, 0.4666667, 1,
-0.251776, 1.303927, -0.5158476, 0, 1, 0.4705882, 1,
-0.2513641, -0.5602542, -4.156624, 0, 1, 0.4784314, 1,
-0.2505591, -1.022751, -1.617123, 0, 1, 0.4823529, 1,
-0.2503543, 0.2123244, -0.7676455, 0, 1, 0.4901961, 1,
-0.2436869, 0.0335523, -1.763238, 0, 1, 0.4941176, 1,
-0.2423683, -0.828799, -2.651894, 0, 1, 0.5019608, 1,
-0.2391138, -1.48913, -2.799076, 0, 1, 0.509804, 1,
-0.2386207, -0.3494133, -2.369182, 0, 1, 0.5137255, 1,
-0.2373307, -0.3887588, -2.235321, 0, 1, 0.5215687, 1,
-0.2368253, -0.4523484, -2.426182, 0, 1, 0.5254902, 1,
-0.2327563, -0.1749162, -0.8377357, 0, 1, 0.5333334, 1,
-0.2301406, -0.8568842, -2.78783, 0, 1, 0.5372549, 1,
-0.2297235, 1.176323, -0.5187123, 0, 1, 0.5450981, 1,
-0.2265025, -0.6912953, -4.031377, 0, 1, 0.5490196, 1,
-0.2253796, -0.6593326, -2.247143, 0, 1, 0.5568628, 1,
-0.2249802, 0.4576288, 0.6005067, 0, 1, 0.5607843, 1,
-0.214121, 0.8537876, 2.272289, 0, 1, 0.5686275, 1,
-0.2054389, -1.720855, -3.14729, 0, 1, 0.572549, 1,
-0.2047048, 1.051323, -2.888902, 0, 1, 0.5803922, 1,
-0.1985659, 0.3389228, 0.5450317, 0, 1, 0.5843138, 1,
-0.1984518, 0.3131516, 0.3119447, 0, 1, 0.5921569, 1,
-0.1963977, -0.8607289, -1.851684, 0, 1, 0.5960785, 1,
-0.1883592, -1.215204, -2.638669, 0, 1, 0.6039216, 1,
-0.185334, 1.378177, -1.135026, 0, 1, 0.6117647, 1,
-0.1836857, 0.9676446, 0.8503572, 0, 1, 0.6156863, 1,
-0.1818561, -1.25937, -2.007621, 0, 1, 0.6235294, 1,
-0.1764751, 0.7091397, -0.9873489, 0, 1, 0.627451, 1,
-0.176005, 1.383448, -1.870916, 0, 1, 0.6352941, 1,
-0.1751679, 1.188155, 1.386217, 0, 1, 0.6392157, 1,
-0.1736231, -0.1061578, -0.6931303, 0, 1, 0.6470588, 1,
-0.1706912, -0.2494599, -2.574856, 0, 1, 0.6509804, 1,
-0.1685573, 0.9661927, 0.3514984, 0, 1, 0.6588235, 1,
-0.166909, -1.33986, -2.71852, 0, 1, 0.6627451, 1,
-0.1664693, -0.7624906, -3.494844, 0, 1, 0.6705883, 1,
-0.1613462, -0.6301933, -1.564648, 0, 1, 0.6745098, 1,
-0.1611562, 0.5508726, 0.2140265, 0, 1, 0.682353, 1,
-0.1577572, 0.63052, -1.573765, 0, 1, 0.6862745, 1,
-0.1561985, -1.500403, -3.743802, 0, 1, 0.6941177, 1,
-0.1560408, -0.52067, -3.077379, 0, 1, 0.7019608, 1,
-0.1448817, -0.5202467, -2.671354, 0, 1, 0.7058824, 1,
-0.1413721, 0.2533152, -0.6169342, 0, 1, 0.7137255, 1,
-0.1404428, 1.461496, 1.14947, 0, 1, 0.7176471, 1,
-0.1386918, 0.2709923, -2.034802, 0, 1, 0.7254902, 1,
-0.1386751, 1.26768, 0.4225484, 0, 1, 0.7294118, 1,
-0.1332886, 0.5433445, -0.7073506, 0, 1, 0.7372549, 1,
-0.1330049, -1.067327, -4.599768, 0, 1, 0.7411765, 1,
-0.1322274, -0.6843908, -2.643626, 0, 1, 0.7490196, 1,
-0.1295522, -0.4723946, -2.320677, 0, 1, 0.7529412, 1,
-0.1292338, 0.02697055, -1.096023, 0, 1, 0.7607843, 1,
-0.1177013, -0.4963219, -2.165244, 0, 1, 0.7647059, 1,
-0.1174669, -0.7692134, -2.839849, 0, 1, 0.772549, 1,
-0.1159939, -0.4323021, -2.440946, 0, 1, 0.7764706, 1,
-0.1159043, 0.861191, -0.3517782, 0, 1, 0.7843137, 1,
-0.1132655, -0.6191669, -4.5131, 0, 1, 0.7882353, 1,
-0.1112319, 0.794358, 0.09442456, 0, 1, 0.7960784, 1,
-0.1100297, -0.5077747, -4.552207, 0, 1, 0.8039216, 1,
-0.1086375, -2.129749, -3.572739, 0, 1, 0.8078431, 1,
-0.108536, -1.144798, -3.043964, 0, 1, 0.8156863, 1,
-0.1071395, -0.8930039, -3.476568, 0, 1, 0.8196079, 1,
-0.1025357, -0.2944941, -3.208521, 0, 1, 0.827451, 1,
-0.10196, 0.6887851, 0.05769375, 0, 1, 0.8313726, 1,
-0.09979142, -1.008202, -3.140235, 0, 1, 0.8392157, 1,
-0.09928646, -1.08512, -2.306095, 0, 1, 0.8431373, 1,
-0.09775387, -0.2927251, -5.264478, 0, 1, 0.8509804, 1,
-0.09709778, 0.2086766, -1.735996, 0, 1, 0.854902, 1,
-0.09509163, -0.6210077, -4.282603, 0, 1, 0.8627451, 1,
-0.09038784, -0.7207159, -3.643412, 0, 1, 0.8666667, 1,
-0.08685086, 1.947019, 0.5410413, 0, 1, 0.8745098, 1,
-0.08544949, -0.7688233, -1.919143, 0, 1, 0.8784314, 1,
-0.07956899, -0.02421971, -3.012165, 0, 1, 0.8862745, 1,
-0.07707337, -0.4716767, -3.897188, 0, 1, 0.8901961, 1,
-0.07544689, -1.252576, -3.17261, 0, 1, 0.8980392, 1,
-0.07258105, -0.05481555, -1.205177, 0, 1, 0.9058824, 1,
-0.06609235, -0.09255885, -3.90671, 0, 1, 0.9098039, 1,
-0.06368017, 0.658645, 0.538689, 0, 1, 0.9176471, 1,
-0.06367929, -0.2095039, -3.24586, 0, 1, 0.9215686, 1,
-0.06149393, -0.9835053, -2.953709, 0, 1, 0.9294118, 1,
-0.06097467, 0.8643039, 0.2356633, 0, 1, 0.9333333, 1,
-0.06000917, 0.4241083, -0.4218415, 0, 1, 0.9411765, 1,
-0.05983071, -1.033727, -1.826764, 0, 1, 0.945098, 1,
-0.05895144, -0.3270686, -3.805432, 0, 1, 0.9529412, 1,
-0.05872648, -0.5784763, -5.04359, 0, 1, 0.9568627, 1,
-0.05622862, -0.9165778, -3.437261, 0, 1, 0.9647059, 1,
-0.05312671, 0.2854767, -0.3010926, 0, 1, 0.9686275, 1,
-0.05296677, -0.5815096, -3.460832, 0, 1, 0.9764706, 1,
-0.04977265, -0.2372015, -3.003569, 0, 1, 0.9803922, 1,
-0.04896486, -1.150531, -4.097044, 0, 1, 0.9882353, 1,
-0.04196921, -1.14625, -3.811594, 0, 1, 0.9921569, 1,
-0.04034673, 0.7435715, -0.9097101, 0, 1, 1, 1,
-0.03843315, 0.1809019, -0.9511972, 0, 0.9921569, 1, 1,
-0.03746473, 1.209134, 0.5822475, 0, 0.9882353, 1, 1,
-0.03506012, 0.6475466, 0.4296172, 0, 0.9803922, 1, 1,
-0.03063057, 0.6898365, -1.347163, 0, 0.9764706, 1, 1,
-0.02925446, 1.658375, 0.9825271, 0, 0.9686275, 1, 1,
-0.02888572, 0.7692931, -2.760694, 0, 0.9647059, 1, 1,
-0.02847061, -1.18422, -2.35144, 0, 0.9568627, 1, 1,
-0.0276979, 0.4541416, -1.668337, 0, 0.9529412, 1, 1,
-0.02769512, 0.3156479, 0.8339291, 0, 0.945098, 1, 1,
-0.02650104, 0.8960772, 0.9069638, 0, 0.9411765, 1, 1,
-0.02589941, -0.2132923, -2.849607, 0, 0.9333333, 1, 1,
-0.02587213, 0.08948289, 0.3544249, 0, 0.9294118, 1, 1,
-0.01717269, -0.08356043, -1.654684, 0, 0.9215686, 1, 1,
-0.004632257, 1.454242, -1.416426, 0, 0.9176471, 1, 1,
0.0003908024, 1.048436, 0.4067363, 0, 0.9098039, 1, 1,
0.003895138, 0.8745705, 0.06467608, 0, 0.9058824, 1, 1,
0.01008824, -0.9201682, 3.462588, 0, 0.8980392, 1, 1,
0.01111163, 0.5274054, -0.02923561, 0, 0.8901961, 1, 1,
0.01536893, -1.49873, 1.194639, 0, 0.8862745, 1, 1,
0.01712223, -0.04572512, 3.764291, 0, 0.8784314, 1, 1,
0.02594074, 0.4844975, -0.344886, 0, 0.8745098, 1, 1,
0.02616663, -0.60918, 4.34974, 0, 0.8666667, 1, 1,
0.03315524, -0.264118, 4.513335, 0, 0.8627451, 1, 1,
0.03387202, 0.4841664, -0.4470238, 0, 0.854902, 1, 1,
0.03984977, -0.7826513, 4.1115, 0, 0.8509804, 1, 1,
0.04098864, -0.1698012, 3.153231, 0, 0.8431373, 1, 1,
0.04425039, 1.351413, 0.8806595, 0, 0.8392157, 1, 1,
0.04476647, 0.5770514, 1.864117, 0, 0.8313726, 1, 1,
0.04783932, -0.7675511, 4.178712, 0, 0.827451, 1, 1,
0.05206867, -0.5264167, 2.406419, 0, 0.8196079, 1, 1,
0.05208573, 1.263098, -0.269369, 0, 0.8156863, 1, 1,
0.05826224, -0.5946588, 4.415738, 0, 0.8078431, 1, 1,
0.05991756, 0.2842401, 0.8936202, 0, 0.8039216, 1, 1,
0.06605028, -0.4079148, 4.03074, 0, 0.7960784, 1, 1,
0.06991709, -1.154943, 4.212555, 0, 0.7882353, 1, 1,
0.07014313, 0.4400662, 0.7081785, 0, 0.7843137, 1, 1,
0.0705131, -1.656665, 2.541461, 0, 0.7764706, 1, 1,
0.07294187, -0.6123316, 3.32348, 0, 0.772549, 1, 1,
0.07706403, -0.7982292, 4.466891, 0, 0.7647059, 1, 1,
0.07930769, -1.125566, 2.29156, 0, 0.7607843, 1, 1,
0.08928759, -1.180297, 3.03294, 0, 0.7529412, 1, 1,
0.08950318, 0.4558064, 1.783592, 0, 0.7490196, 1, 1,
0.08971023, 3.133935, 1.312532, 0, 0.7411765, 1, 1,
0.09111296, 2.009569, 0.7986677, 0, 0.7372549, 1, 1,
0.1003587, 0.04981318, 0.9439355, 0, 0.7294118, 1, 1,
0.1007723, -0.8980624, 3.593229, 0, 0.7254902, 1, 1,
0.1040688, 0.8064834, 2.109547, 0, 0.7176471, 1, 1,
0.1067698, -1.508595, 4.509058, 0, 0.7137255, 1, 1,
0.1078616, -1.549547, 4.176138, 0, 0.7058824, 1, 1,
0.1122801, -0.08840861, 3.122113, 0, 0.6980392, 1, 1,
0.1159488, 1.818017, 2.068762, 0, 0.6941177, 1, 1,
0.1162157, -0.4732311, 3.747267, 0, 0.6862745, 1, 1,
0.1167098, 1.504129, -0.5268575, 0, 0.682353, 1, 1,
0.1184071, 0.7921311, -0.5314341, 0, 0.6745098, 1, 1,
0.1200649, 1.426691, -0.7849534, 0, 0.6705883, 1, 1,
0.1265953, 0.7442868, -0.1102576, 0, 0.6627451, 1, 1,
0.12842, 0.6240975, -0.7371657, 0, 0.6588235, 1, 1,
0.1346186, -0.3496233, 0.3776468, 0, 0.6509804, 1, 1,
0.1379955, 0.9555576, 1.267142, 0, 0.6470588, 1, 1,
0.1393678, 0.1860449, 0.4292903, 0, 0.6392157, 1, 1,
0.1426939, -0.10968, 2.589545, 0, 0.6352941, 1, 1,
0.1442964, -0.7650384, 3.022382, 0, 0.627451, 1, 1,
0.1446749, -0.3744619, 2.508097, 0, 0.6235294, 1, 1,
0.1469744, -1.234027, 3.362117, 0, 0.6156863, 1, 1,
0.1470423, 0.4936054, 0.09193926, 0, 0.6117647, 1, 1,
0.1475983, 0.2435095, 0.5101405, 0, 0.6039216, 1, 1,
0.1479063, -0.5078828, 1.943691, 0, 0.5960785, 1, 1,
0.1494377, -0.7304078, 2.956434, 0, 0.5921569, 1, 1,
0.157998, -0.04452958, 0.9041787, 0, 0.5843138, 1, 1,
0.1587424, -1.147662, 0.8171162, 0, 0.5803922, 1, 1,
0.1591516, 0.2625099, 0.4904104, 0, 0.572549, 1, 1,
0.1652016, 2.471093, -1.857703, 0, 0.5686275, 1, 1,
0.1669814, -1.140071, 4.62594, 0, 0.5607843, 1, 1,
0.1736141, 0.04433011, 1.298591, 0, 0.5568628, 1, 1,
0.1744948, 0.3666395, 0.5065362, 0, 0.5490196, 1, 1,
0.1773553, 0.7854023, -0.2392703, 0, 0.5450981, 1, 1,
0.1788717, -1.243561, 2.442517, 0, 0.5372549, 1, 1,
0.1791145, -0.03968252, 1.645226, 0, 0.5333334, 1, 1,
0.1807512, -0.06281567, 3.053238, 0, 0.5254902, 1, 1,
0.1817733, 0.2761322, 1.55059, 0, 0.5215687, 1, 1,
0.1819976, 1.828061, -0.2043372, 0, 0.5137255, 1, 1,
0.183851, -0.9987726, 2.106892, 0, 0.509804, 1, 1,
0.1856711, 1.633146, 1.734571, 0, 0.5019608, 1, 1,
0.188685, 1.021532, -1.931299, 0, 0.4941176, 1, 1,
0.1915426, -1.144011, 2.608328, 0, 0.4901961, 1, 1,
0.1966189, -0.2142335, 3.707774, 0, 0.4823529, 1, 1,
0.1987302, -0.6090716, 2.720799, 0, 0.4784314, 1, 1,
0.201718, 1.54203, 1.215924, 0, 0.4705882, 1, 1,
0.2025013, -0.5549423, 0.9369183, 0, 0.4666667, 1, 1,
0.2038234, -0.3592036, 2.138122, 0, 0.4588235, 1, 1,
0.2040867, 0.4612086, 0.4932629, 0, 0.454902, 1, 1,
0.2100629, -0.3940245, 2.828813, 0, 0.4470588, 1, 1,
0.2140751, -0.8719637, 2.348708, 0, 0.4431373, 1, 1,
0.2154985, -0.6738005, 4.884655, 0, 0.4352941, 1, 1,
0.2155327, 0.01564312, 1.780987, 0, 0.4313726, 1, 1,
0.2180259, 1.210889, -0.6842676, 0, 0.4235294, 1, 1,
0.2182973, -1.131309, 0.2034051, 0, 0.4196078, 1, 1,
0.2197692, 0.2289213, 1.149171, 0, 0.4117647, 1, 1,
0.2220576, -0.09935036, 0.2138488, 0, 0.4078431, 1, 1,
0.2275443, 1.040363, -0.8353516, 0, 0.4, 1, 1,
0.2301797, 0.9209999, -0.5954154, 0, 0.3921569, 1, 1,
0.2305149, 0.1775039, 2.98718, 0, 0.3882353, 1, 1,
0.2312587, 0.4662765, 0.4251969, 0, 0.3803922, 1, 1,
0.231415, 0.7614117, 0.9003932, 0, 0.3764706, 1, 1,
0.2351104, 0.5480127, 0.9601591, 0, 0.3686275, 1, 1,
0.2385206, 0.2177956, 2.636013, 0, 0.3647059, 1, 1,
0.2406144, 0.09357064, 1.399314, 0, 0.3568628, 1, 1,
0.2422214, -0.2676141, -0.8921826, 0, 0.3529412, 1, 1,
0.245621, -0.8172974, 2.169449, 0, 0.345098, 1, 1,
0.2466487, -0.4879522, 4.245307, 0, 0.3411765, 1, 1,
0.2515718, 0.03361024, 1.619294, 0, 0.3333333, 1, 1,
0.256289, 1.116137, -0.03644585, 0, 0.3294118, 1, 1,
0.257965, -1.759707, 2.469532, 0, 0.3215686, 1, 1,
0.2622284, 0.4021503, -0.4930858, 0, 0.3176471, 1, 1,
0.2660913, 1.719021, -1.104118, 0, 0.3098039, 1, 1,
0.2674335, 0.3919539, -0.8182939, 0, 0.3058824, 1, 1,
0.2675652, -0.07103061, 1.112764, 0, 0.2980392, 1, 1,
0.2687835, -1.021673, 1.010256, 0, 0.2901961, 1, 1,
0.2690122, 1.864777, 0.7413892, 0, 0.2862745, 1, 1,
0.2691455, 0.7970811, 0.1472794, 0, 0.2784314, 1, 1,
0.2695691, -0.4426398, 2.221265, 0, 0.2745098, 1, 1,
0.2731945, -0.7445868, 3.290371, 0, 0.2666667, 1, 1,
0.2746207, 1.258414, 1.200508, 0, 0.2627451, 1, 1,
0.2757662, -0.001720227, 0.4763379, 0, 0.254902, 1, 1,
0.2772507, 0.1969396, -0.1289354, 0, 0.2509804, 1, 1,
0.2807814, 1.732528, -0.7155553, 0, 0.2431373, 1, 1,
0.2823748, 0.7073172, 0.3168176, 0, 0.2392157, 1, 1,
0.2830838, 1.2714, -0.1770335, 0, 0.2313726, 1, 1,
0.285231, -0.3242934, 2.045217, 0, 0.227451, 1, 1,
0.2863787, 1.132109, 1.465647, 0, 0.2196078, 1, 1,
0.2890145, -0.9444566, 2.75952, 0, 0.2156863, 1, 1,
0.2892846, -0.1377981, 2.002748, 0, 0.2078431, 1, 1,
0.292193, -0.4153695, 1.575241, 0, 0.2039216, 1, 1,
0.2971354, 1.105143, 0.3318685, 0, 0.1960784, 1, 1,
0.298678, -1.865169, 2.153342, 0, 0.1882353, 1, 1,
0.3079808, -0.8699953, 2.647116, 0, 0.1843137, 1, 1,
0.309772, -0.2881681, 4.757612, 0, 0.1764706, 1, 1,
0.3119939, -0.6905885, 4.693692, 0, 0.172549, 1, 1,
0.3121957, -0.5557849, 1.745419, 0, 0.1647059, 1, 1,
0.3148876, 1.694716, 2.156999, 0, 0.1607843, 1, 1,
0.3171328, -0.08122748, 1.572345, 0, 0.1529412, 1, 1,
0.3268184, 0.1976543, 0.9869077, 0, 0.1490196, 1, 1,
0.3275828, 1.602838, -1.505568, 0, 0.1411765, 1, 1,
0.3282262, 1.141392, 0.02904225, 0, 0.1372549, 1, 1,
0.3321914, -0.7010267, 2.855071, 0, 0.1294118, 1, 1,
0.3327209, 3.875036, 0.1349767, 0, 0.1254902, 1, 1,
0.3336521, 0.1283779, -0.4083621, 0, 0.1176471, 1, 1,
0.33441, -0.8758971, 3.089824, 0, 0.1137255, 1, 1,
0.3401916, 0.5828366, 0.4055276, 0, 0.1058824, 1, 1,
0.3450334, 1.462648, -1.671417, 0, 0.09803922, 1, 1,
0.3492517, 0.5302386, -0.6605552, 0, 0.09411765, 1, 1,
0.3528527, -1.568778, 3.684403, 0, 0.08627451, 1, 1,
0.3546592, -0.07187372, 2.42959, 0, 0.08235294, 1, 1,
0.3569992, -0.9903012, 2.01608, 0, 0.07450981, 1, 1,
0.3605755, -1.958016, 1.357445, 0, 0.07058824, 1, 1,
0.3606852, 2.611382, -0.6334246, 0, 0.0627451, 1, 1,
0.36313, 1.078107, 1.273438, 0, 0.05882353, 1, 1,
0.3640864, 1.224056, 0.0754106, 0, 0.05098039, 1, 1,
0.3652791, -0.452748, 1.838263, 0, 0.04705882, 1, 1,
0.3657466, -0.1620695, 2.253311, 0, 0.03921569, 1, 1,
0.3685078, 0.6984339, 0.4771179, 0, 0.03529412, 1, 1,
0.3779909, -1.25356, 4.439533, 0, 0.02745098, 1, 1,
0.3801324, -0.5921551, 2.276342, 0, 0.02352941, 1, 1,
0.3832427, 1.019967, 1.114173, 0, 0.01568628, 1, 1,
0.3868861, 2.021183, 1.830346, 0, 0.01176471, 1, 1,
0.3872454, 0.1569997, 2.096516, 0, 0.003921569, 1, 1,
0.3895452, -0.4566959, 4.766759, 0.003921569, 0, 1, 1,
0.3918684, 2.050379, 0.9447262, 0.007843138, 0, 1, 1,
0.3922946, 0.3339356, 1.592402, 0.01568628, 0, 1, 1,
0.3986151, -0.06622443, 0.9264117, 0.01960784, 0, 1, 1,
0.3997099, -1.083007, 3.500334, 0.02745098, 0, 1, 1,
0.401857, 0.02913571, 1.08563, 0.03137255, 0, 1, 1,
0.4174808, -0.705243, 2.570652, 0.03921569, 0, 1, 1,
0.417846, 0.1230248, 0.8385133, 0.04313726, 0, 1, 1,
0.4218241, -0.5359289, 2.877897, 0.05098039, 0, 1, 1,
0.4220104, 1.258071, -0.2000966, 0.05490196, 0, 1, 1,
0.4311833, -0.8450696, 1.584537, 0.0627451, 0, 1, 1,
0.4316594, 0.8734941, 0.5765693, 0.06666667, 0, 1, 1,
0.4352813, 0.8562703, 0.4966163, 0.07450981, 0, 1, 1,
0.435453, -1.283866, 3.907994, 0.07843138, 0, 1, 1,
0.4356516, 0.546895, -0.4811331, 0.08627451, 0, 1, 1,
0.4408619, 0.3784754, 1.716482, 0.09019608, 0, 1, 1,
0.4465238, -0.2990097, 3.688438, 0.09803922, 0, 1, 1,
0.4484471, -1.358242, 2.245883, 0.1058824, 0, 1, 1,
0.4506613, 1.148091, -0.3244292, 0.1098039, 0, 1, 1,
0.4583016, 0.2940574, 1.978825, 0.1176471, 0, 1, 1,
0.4586443, -0.6162972, 1.230474, 0.1215686, 0, 1, 1,
0.4618947, 0.5973326, 0.9880345, 0.1294118, 0, 1, 1,
0.4626002, 0.6445619, 1.440496, 0.1333333, 0, 1, 1,
0.4660039, -1.000656, 1.347461, 0.1411765, 0, 1, 1,
0.4714987, 1.315086, 0.7759803, 0.145098, 0, 1, 1,
0.475099, 0.3709056, 0.9624886, 0.1529412, 0, 1, 1,
0.4782856, -1.691843, 3.221893, 0.1568628, 0, 1, 1,
0.4785632, -0.4875663, 2.131424, 0.1647059, 0, 1, 1,
0.4788267, -0.4505587, 2.153817, 0.1686275, 0, 1, 1,
0.4793484, -0.6822446, 1.792923, 0.1764706, 0, 1, 1,
0.4812021, -0.0376679, 2.087837, 0.1803922, 0, 1, 1,
0.4823568, -0.7238035, 2.543363, 0.1882353, 0, 1, 1,
0.4841436, -1.294171, 3.502011, 0.1921569, 0, 1, 1,
0.4876216, 1.281874, -0.01149705, 0.2, 0, 1, 1,
0.4892513, -0.006315425, 2.010296, 0.2078431, 0, 1, 1,
0.4904017, -1.262924, 3.055712, 0.2117647, 0, 1, 1,
0.4956154, 0.3555441, 0.6678246, 0.2196078, 0, 1, 1,
0.4982848, 0.6861074, -1.504204, 0.2235294, 0, 1, 1,
0.4986792, -0.9178824, 4.375592, 0.2313726, 0, 1, 1,
0.4993009, 0.6394023, 1.138005, 0.2352941, 0, 1, 1,
0.5035729, 0.06683248, 2.140682, 0.2431373, 0, 1, 1,
0.5059538, -0.1621221, 2.278016, 0.2470588, 0, 1, 1,
0.5061763, 0.1057186, 1.905486, 0.254902, 0, 1, 1,
0.511573, 1.333842, -1.412609, 0.2588235, 0, 1, 1,
0.5132949, 0.8498554, 2.58497, 0.2666667, 0, 1, 1,
0.5138839, 0.5625969, 0.4816802, 0.2705882, 0, 1, 1,
0.5224008, 2.470256, 0.6898927, 0.2784314, 0, 1, 1,
0.5237519, 1.412365, 0.465685, 0.282353, 0, 1, 1,
0.5249335, -1.118531, 4.205787, 0.2901961, 0, 1, 1,
0.5322882, 0.3494416, 0.380838, 0.2941177, 0, 1, 1,
0.5336984, 2.465728, 0.1473316, 0.3019608, 0, 1, 1,
0.534371, -0.1286775, 1.766908, 0.3098039, 0, 1, 1,
0.5385555, 0.8744398, 2.412501, 0.3137255, 0, 1, 1,
0.5413296, 0.5762171, 0.2167528, 0.3215686, 0, 1, 1,
0.5466334, -0.8119519, 3.09591, 0.3254902, 0, 1, 1,
0.555557, -1.140671, 3.283307, 0.3333333, 0, 1, 1,
0.5570807, -0.1883159, 1.963151, 0.3372549, 0, 1, 1,
0.5657862, -0.7672322, 1.863932, 0.345098, 0, 1, 1,
0.5672926, 0.9179068, 1.883776, 0.3490196, 0, 1, 1,
0.5688731, 1.178257, 1.670418, 0.3568628, 0, 1, 1,
0.5706398, 0.360669, 1.824335, 0.3607843, 0, 1, 1,
0.5715271, 1.755191, 0.1665805, 0.3686275, 0, 1, 1,
0.5752581, 0.4565774, 1.659804, 0.372549, 0, 1, 1,
0.5760695, 0.5286762, 0.9353498, 0.3803922, 0, 1, 1,
0.5781907, 0.9371998, -0.9053413, 0.3843137, 0, 1, 1,
0.5835215, -0.03918278, 1.745099, 0.3921569, 0, 1, 1,
0.5864041, 1.26618, -1.323515, 0.3960784, 0, 1, 1,
0.5895372, -0.2482312, 1.704712, 0.4039216, 0, 1, 1,
0.5897745, 0.8221725, 0.2378481, 0.4117647, 0, 1, 1,
0.5921519, -0.5754482, 2.298275, 0.4156863, 0, 1, 1,
0.5949451, 1.486575, 0.3163663, 0.4235294, 0, 1, 1,
0.5969944, 1.336362, 3.335068, 0.427451, 0, 1, 1,
0.5976187, 0.1101803, 0.3184246, 0.4352941, 0, 1, 1,
0.6038672, -0.7237173, 2.955781, 0.4392157, 0, 1, 1,
0.615387, 0.7342324, -0.9800994, 0.4470588, 0, 1, 1,
0.619533, 1.164589, 1.652596, 0.4509804, 0, 1, 1,
0.6249757, 1.547023, 0.1848093, 0.4588235, 0, 1, 1,
0.6270995, 0.600643, 1.503714, 0.4627451, 0, 1, 1,
0.6294129, 0.7538651, 0.1437645, 0.4705882, 0, 1, 1,
0.6327979, 0.4364882, 2.299662, 0.4745098, 0, 1, 1,
0.6374745, -1.563205, 4.495341, 0.4823529, 0, 1, 1,
0.639884, 0.893329, -0.5323445, 0.4862745, 0, 1, 1,
0.6492215, -1.237633, 2.334832, 0.4941176, 0, 1, 1,
0.6503694, 1.751534, 0.7089914, 0.5019608, 0, 1, 1,
0.6523123, 0.3354484, 0.3364216, 0.5058824, 0, 1, 1,
0.656676, 0.5347311, 1.601098, 0.5137255, 0, 1, 1,
0.6568077, -0.120007, 3.153662, 0.5176471, 0, 1, 1,
0.6590722, 1.02813, 0.271826, 0.5254902, 0, 1, 1,
0.6590762, 0.9723894, 0.6101079, 0.5294118, 0, 1, 1,
0.6601451, 0.2119004, 0.4732798, 0.5372549, 0, 1, 1,
0.661996, 1.520683, 0.5518432, 0.5411765, 0, 1, 1,
0.664243, -0.1785714, 3.897122, 0.5490196, 0, 1, 1,
0.6667849, 0.7349167, 0.5114371, 0.5529412, 0, 1, 1,
0.6699442, -0.3893225, 2.006718, 0.5607843, 0, 1, 1,
0.6705474, 0.2481539, 2.548258, 0.5647059, 0, 1, 1,
0.6719788, -0.5229145, 2.397723, 0.572549, 0, 1, 1,
0.6753656, 0.1322928, 2.696838, 0.5764706, 0, 1, 1,
0.677458, 0.9119716, 0.004981411, 0.5843138, 0, 1, 1,
0.6777939, 0.0426763, 4.084235, 0.5882353, 0, 1, 1,
0.6814201, 1.496302, 1.499526, 0.5960785, 0, 1, 1,
0.6892841, 1.080191, 1.275606, 0.6039216, 0, 1, 1,
0.6939288, 0.636532, 0.2744376, 0.6078432, 0, 1, 1,
0.7004408, 1.115203, 0.710735, 0.6156863, 0, 1, 1,
0.7011554, 2.12237, -0.3381085, 0.6196079, 0, 1, 1,
0.7030326, 0.6241778, 2.232031, 0.627451, 0, 1, 1,
0.705382, 0.8240053, 0.8180633, 0.6313726, 0, 1, 1,
0.7070509, 0.5883612, 0.4729965, 0.6392157, 0, 1, 1,
0.7175865, -0.08087566, 2.162166, 0.6431373, 0, 1, 1,
0.7314219, 1.313113, 1.494816, 0.6509804, 0, 1, 1,
0.732102, 0.6734768, 1.231362, 0.654902, 0, 1, 1,
0.7389192, 1.838116, -0.9123617, 0.6627451, 0, 1, 1,
0.7429503, 0.02138693, 1.946415, 0.6666667, 0, 1, 1,
0.7429844, -0.3062826, 1.551519, 0.6745098, 0, 1, 1,
0.7453328, 0.03204946, 0.8635672, 0.6784314, 0, 1, 1,
0.7514405, 0.7642308, 1.858083, 0.6862745, 0, 1, 1,
0.7542305, 2.115493, 0.911744, 0.6901961, 0, 1, 1,
0.7633469, 0.9486012, 1.131436, 0.6980392, 0, 1, 1,
0.7651267, -0.2047759, 1.805964, 0.7058824, 0, 1, 1,
0.7719082, -0.2472858, 1.20486, 0.7098039, 0, 1, 1,
0.7737033, 0.3155936, 1.234209, 0.7176471, 0, 1, 1,
0.7742667, -0.2062616, 1.09532, 0.7215686, 0, 1, 1,
0.7800948, 0.0005494913, 2.100865, 0.7294118, 0, 1, 1,
0.7846735, 2.703139, -0.7605792, 0.7333333, 0, 1, 1,
0.7878354, -0.9262413, 4.611185, 0.7411765, 0, 1, 1,
0.7916121, -3.218048, 1.709078, 0.7450981, 0, 1, 1,
0.7926088, 1.940069, 1.630973, 0.7529412, 0, 1, 1,
0.7975382, 0.6127836, 2.09257, 0.7568628, 0, 1, 1,
0.7992214, -0.09411809, 2.389987, 0.7647059, 0, 1, 1,
0.7998822, 0.277071, 1.980989, 0.7686275, 0, 1, 1,
0.8134972, -0.2705792, 0.5585169, 0.7764706, 0, 1, 1,
0.813682, -0.4345169, 4.127778, 0.7803922, 0, 1, 1,
0.8159807, 1.104123, 1.644491, 0.7882353, 0, 1, 1,
0.8202313, 0.5089517, 1.565125, 0.7921569, 0, 1, 1,
0.8203645, 0.5354197, -0.1555726, 0.8, 0, 1, 1,
0.8260686, 0.5327926, 3.065922, 0.8078431, 0, 1, 1,
0.8260958, 0.1869181, 1.58046, 0.8117647, 0, 1, 1,
0.8316472, 0.5032916, 2.091499, 0.8196079, 0, 1, 1,
0.8343682, 1.511211, -1.215295, 0.8235294, 0, 1, 1,
0.8350887, 0.4170986, 0.7845293, 0.8313726, 0, 1, 1,
0.8394372, 0.2332334, 1.479791, 0.8352941, 0, 1, 1,
0.8395509, 0.1634263, 0.7000481, 0.8431373, 0, 1, 1,
0.841578, 0.5453131, 0.741214, 0.8470588, 0, 1, 1,
0.8438514, 0.4581414, 2.012654, 0.854902, 0, 1, 1,
0.8493035, 0.5075577, -0.1026093, 0.8588235, 0, 1, 1,
0.8521847, -0.02912255, 1.659224, 0.8666667, 0, 1, 1,
0.8537875, -1.478747, 4.058528, 0.8705882, 0, 1, 1,
0.8552027, 0.8190399, 0.04703634, 0.8784314, 0, 1, 1,
0.8676703, 1.842261, -1.123428, 0.8823529, 0, 1, 1,
0.8731802, 0.9956849, 0.306876, 0.8901961, 0, 1, 1,
0.8790614, 0.4505924, 1.773353, 0.8941177, 0, 1, 1,
0.887103, 1.093728, 1.540586, 0.9019608, 0, 1, 1,
0.8895628, 1.034601, 0.9711614, 0.9098039, 0, 1, 1,
0.9006577, -0.505588, 2.208622, 0.9137255, 0, 1, 1,
0.9007343, 0.05812586, 1.698323, 0.9215686, 0, 1, 1,
0.9023756, 0.3817743, -0.1519997, 0.9254902, 0, 1, 1,
0.9158919, 0.03967033, 0.6530681, 0.9333333, 0, 1, 1,
0.9224275, 1.615155, 0.8919051, 0.9372549, 0, 1, 1,
0.924804, 0.8826174, -0.7060886, 0.945098, 0, 1, 1,
0.9329362, -1.313408, 3.153647, 0.9490196, 0, 1, 1,
0.9347182, 0.1960953, 1.443539, 0.9568627, 0, 1, 1,
0.9351755, -0.009937445, 2.930248, 0.9607843, 0, 1, 1,
0.9470724, 0.09008197, 1.688094, 0.9686275, 0, 1, 1,
0.9472622, 0.4744501, 1.634399, 0.972549, 0, 1, 1,
0.9499518, 0.2093363, 1.115712, 0.9803922, 0, 1, 1,
0.9513509, -0.07989187, 2.377307, 0.9843137, 0, 1, 1,
0.9520577, 1.152404, 0.7446213, 0.9921569, 0, 1, 1,
0.9573593, -1.865969, 2.034333, 0.9960784, 0, 1, 1,
0.9639611, -2.567187, 2.76417, 1, 0, 0.9960784, 1,
0.9642307, 0.9150268, 1.655415, 1, 0, 0.9882353, 1,
0.9659253, 1.534441, -0.06994068, 1, 0, 0.9843137, 1,
0.9683521, 0.107548, -0.7864501, 1, 0, 0.9764706, 1,
0.9892101, 1.214077, 1.106557, 1, 0, 0.972549, 1,
0.9911222, -0.8077826, 0.3743457, 1, 0, 0.9647059, 1,
0.9915961, 1.106269, 0.4130681, 1, 0, 0.9607843, 1,
0.9938254, -0.3987288, 0.9798136, 1, 0, 0.9529412, 1,
0.994775, -1.309083, 2.945602, 1, 0, 0.9490196, 1,
0.995329, -0.1943128, 3.104051, 1, 0, 0.9411765, 1,
0.9974819, 1.341191, 1.399582, 1, 0, 0.9372549, 1,
0.999985, -0.06754382, 1.405495, 1, 0, 0.9294118, 1,
1.000187, 0.7109835, 0.5565058, 1, 0, 0.9254902, 1,
1.008918, -2.154441, 2.103225, 1, 0, 0.9176471, 1,
1.026382, -0.5237511, 1.153728, 1, 0, 0.9137255, 1,
1.027462, -0.7996823, 3.39396, 1, 0, 0.9058824, 1,
1.028403, 1.377781, 0.388195, 1, 0, 0.9019608, 1,
1.039862, -0.270207, 1.061783, 1, 0, 0.8941177, 1,
1.042924, 1.39468, -0.002235649, 1, 0, 0.8862745, 1,
1.045437, -1.514782, 1.354504, 1, 0, 0.8823529, 1,
1.048287, 0.5537714, -1.241874, 1, 0, 0.8745098, 1,
1.048731, 0.1809315, 1.246418, 1, 0, 0.8705882, 1,
1.048951, 0.6515188, 2.278808, 1, 0, 0.8627451, 1,
1.049166, -1.775942, 3.634297, 1, 0, 0.8588235, 1,
1.053114, -1.109318, 0.2905071, 1, 0, 0.8509804, 1,
1.055295, -1.60273, 0.573446, 1, 0, 0.8470588, 1,
1.059207, 0.2973986, 1.038596, 1, 0, 0.8392157, 1,
1.067447, 0.466548, 2.128011, 1, 0, 0.8352941, 1,
1.067671, 1.716832, 0.801008, 1, 0, 0.827451, 1,
1.071416, -2.324272, 2.976523, 1, 0, 0.8235294, 1,
1.075565, 0.09364265, 1.603902, 1, 0, 0.8156863, 1,
1.076444, -1.178077, 3.0879, 1, 0, 0.8117647, 1,
1.08245, 0.8512832, -1.234208, 1, 0, 0.8039216, 1,
1.083503, 0.6251834, 2.433538, 1, 0, 0.7960784, 1,
1.085748, -0.09353181, 2.390227, 1, 0, 0.7921569, 1,
1.087342, -0.1824212, 1.746434, 1, 0, 0.7843137, 1,
1.099824, -1.721887, 3.096923, 1, 0, 0.7803922, 1,
1.101199, 0.5303925, 2.110427, 1, 0, 0.772549, 1,
1.103077, -0.6811145, 0.676179, 1, 0, 0.7686275, 1,
1.108041, -1.293647, 0.8677264, 1, 0, 0.7607843, 1,
1.1223, 1.382023, 0.136081, 1, 0, 0.7568628, 1,
1.122687, 0.9247605, 0.6097419, 1, 0, 0.7490196, 1,
1.123087, 1.17136, 0.7880707, 1, 0, 0.7450981, 1,
1.125355, 0.4873988, 1.31541, 1, 0, 0.7372549, 1,
1.132644, 1.796688, 0.03670613, 1, 0, 0.7333333, 1,
1.13429, -1.122371, 2.032877, 1, 0, 0.7254902, 1,
1.13456, -0.41596, 2.989833, 1, 0, 0.7215686, 1,
1.139824, 1.367427, 0.2913621, 1, 0, 0.7137255, 1,
1.151069, 1.683477, 0.7018607, 1, 0, 0.7098039, 1,
1.156269, 0.1965475, 1.070125, 1, 0, 0.7019608, 1,
1.162138, -0.1504728, 1.772224, 1, 0, 0.6941177, 1,
1.167735, -0.5058798, 0.9834328, 1, 0, 0.6901961, 1,
1.174436, -0.2175871, 0.4605031, 1, 0, 0.682353, 1,
1.175164, 0.3929098, 1.188224, 1, 0, 0.6784314, 1,
1.203168, 0.4043007, 1.101061, 1, 0, 0.6705883, 1,
1.2053, -0.3473375, 1.168468, 1, 0, 0.6666667, 1,
1.206831, 1.767481, 1.749205, 1, 0, 0.6588235, 1,
1.221122, -0.7823244, 1.901834, 1, 0, 0.654902, 1,
1.237975, -0.4157171, -0.1632215, 1, 0, 0.6470588, 1,
1.239293, 0.3486907, 0.8757932, 1, 0, 0.6431373, 1,
1.242017, 1.58357, 0.4330119, 1, 0, 0.6352941, 1,
1.245983, 1.104118, 1.072967, 1, 0, 0.6313726, 1,
1.253436, -0.7992758, 2.455845, 1, 0, 0.6235294, 1,
1.26778, -0.4249722, 2.965064, 1, 0, 0.6196079, 1,
1.268448, -0.8693396, 2.501635, 1, 0, 0.6117647, 1,
1.275866, 1.479564, 0.6949872, 1, 0, 0.6078432, 1,
1.276899, 0.477224, 3.130029, 1, 0, 0.6, 1,
1.279633, -2.001558, 2.703135, 1, 0, 0.5921569, 1,
1.282993, -2.644042, 3.556205, 1, 0, 0.5882353, 1,
1.285296, -0.9880289, 2.245081, 1, 0, 0.5803922, 1,
1.294921, 0.128677, 0.9641295, 1, 0, 0.5764706, 1,
1.295936, -0.3135767, 1.811858, 1, 0, 0.5686275, 1,
1.307696, 0.712098, 0.7727144, 1, 0, 0.5647059, 1,
1.314035, -1.970827, 1.566909, 1, 0, 0.5568628, 1,
1.326317, -0.08498633, 0.3159233, 1, 0, 0.5529412, 1,
1.343557, -0.7142615, 2.353282, 1, 0, 0.5450981, 1,
1.352234, -0.4599028, 1.717119, 1, 0, 0.5411765, 1,
1.371905, 0.5647103, 1.761868, 1, 0, 0.5333334, 1,
1.373315, -0.2188539, 2.507242, 1, 0, 0.5294118, 1,
1.375242, -0.8987323, 0.8940095, 1, 0, 0.5215687, 1,
1.381513, -0.6019285, 1.807184, 1, 0, 0.5176471, 1,
1.387876, 2.562981, 1.130193, 1, 0, 0.509804, 1,
1.38974, 0.2170215, 2.71576, 1, 0, 0.5058824, 1,
1.404654, 0.6670672, 0.7606803, 1, 0, 0.4980392, 1,
1.411492, -1.256827, 1.919556, 1, 0, 0.4901961, 1,
1.414009, 0.3297044, 0.05964555, 1, 0, 0.4862745, 1,
1.421148, -0.8563382, 0.6165681, 1, 0, 0.4784314, 1,
1.42836, 1.1242, 3.66413, 1, 0, 0.4745098, 1,
1.42926, 0.3249338, 0.221127, 1, 0, 0.4666667, 1,
1.443844, 3.122223, 0.8373728, 1, 0, 0.4627451, 1,
1.447063, 1.949167, -0.05706392, 1, 0, 0.454902, 1,
1.449117, -0.2262413, 1.871317, 1, 0, 0.4509804, 1,
1.449515, -0.8551842, 1.468568, 1, 0, 0.4431373, 1,
1.452288, 1.952446, -0.6227718, 1, 0, 0.4392157, 1,
1.459515, 1.558067, 0.9283949, 1, 0, 0.4313726, 1,
1.468059, -0.8949687, 2.538454, 1, 0, 0.427451, 1,
1.47256, -0.4162473, 2.957133, 1, 0, 0.4196078, 1,
1.475097, -1.062789, 2.707658, 1, 0, 0.4156863, 1,
1.488341, 1.323627, -1.922361, 1, 0, 0.4078431, 1,
1.502545, 0.9937012, 0.1998452, 1, 0, 0.4039216, 1,
1.529775, 1.71064, -0.0851373, 1, 0, 0.3960784, 1,
1.548336, -0.6039276, 2.051732, 1, 0, 0.3882353, 1,
1.553531, 0.5786397, 1.915263, 1, 0, 0.3843137, 1,
1.566627, -1.512296, 0.2638379, 1, 0, 0.3764706, 1,
1.573465, -0.9681497, 3.55942, 1, 0, 0.372549, 1,
1.583001, 0.07566398, 1.6774, 1, 0, 0.3647059, 1,
1.588983, -1.050584, 3.105083, 1, 0, 0.3607843, 1,
1.593202, 0.1077018, 0.813792, 1, 0, 0.3529412, 1,
1.596676, -0.1264576, 2.738233, 1, 0, 0.3490196, 1,
1.607788, -0.1532034, 2.42177, 1, 0, 0.3411765, 1,
1.610528, -0.9628441, 0.6978189, 1, 0, 0.3372549, 1,
1.615743, -0.5025198, 3.572885, 1, 0, 0.3294118, 1,
1.617996, -0.499304, 1.195034, 1, 0, 0.3254902, 1,
1.621151, 1.245365, 0.4006431, 1, 0, 0.3176471, 1,
1.621549, -0.2498088, 2.72504, 1, 0, 0.3137255, 1,
1.622923, 0.08056841, 1.653957, 1, 0, 0.3058824, 1,
1.624124, -1.236302, 2.19187, 1, 0, 0.2980392, 1,
1.63388, -1.284338, 2.345399, 1, 0, 0.2941177, 1,
1.634906, 0.1781955, 1.395303, 1, 0, 0.2862745, 1,
1.639715, -1.299173, 2.921547, 1, 0, 0.282353, 1,
1.65946, -0.2488031, 2.121815, 1, 0, 0.2745098, 1,
1.678197, 0.1328999, 2.210434, 1, 0, 0.2705882, 1,
1.679648, 0.4291152, 2.064825, 1, 0, 0.2627451, 1,
1.687904, 0.03776885, 2.274679, 1, 0, 0.2588235, 1,
1.699182, -0.7263936, 1.191126, 1, 0, 0.2509804, 1,
1.722558, -1.618803, 2.300539, 1, 0, 0.2470588, 1,
1.723011, -1.681184, 2.986546, 1, 0, 0.2392157, 1,
1.728126, 2.626318, 0.1828388, 1, 0, 0.2352941, 1,
1.749453, -1.722237, 2.287864, 1, 0, 0.227451, 1,
1.757553, -0.5686941, 1.680955, 1, 0, 0.2235294, 1,
1.775199, 0.6466434, 0.2778235, 1, 0, 0.2156863, 1,
1.787864, 1.221595, 2.142913, 1, 0, 0.2117647, 1,
1.791597, 0.2364929, 2.613219, 1, 0, 0.2039216, 1,
1.84934, 1.95699, -0.3952967, 1, 0, 0.1960784, 1,
1.851271, -0.4902495, -0.609358, 1, 0, 0.1921569, 1,
1.867515, 1.275677, 1.57106, 1, 0, 0.1843137, 1,
1.893365, 1.416473, 1.688391, 1, 0, 0.1803922, 1,
1.901685, -0.4661818, 2.615021, 1, 0, 0.172549, 1,
1.947978, 1.940933, 0.6355387, 1, 0, 0.1686275, 1,
1.952014, 0.6688344, 1.457851, 1, 0, 0.1607843, 1,
1.954688, -1.639012, 3.866032, 1, 0, 0.1568628, 1,
1.956389, 0.175188, 0.7534797, 1, 0, 0.1490196, 1,
1.970211, -0.261151, 2.447052, 1, 0, 0.145098, 1,
1.979521, 1.844207, 0.9793956, 1, 0, 0.1372549, 1,
2.008703, -0.3664208, 1.683937, 1, 0, 0.1333333, 1,
2.031638, -1.182259, 1.094625, 1, 0, 0.1254902, 1,
2.077385, -1.594326, 4.005999, 1, 0, 0.1215686, 1,
2.078521, -1.605935, 1.948258, 1, 0, 0.1137255, 1,
2.081982, 0.3166471, 1.14253, 1, 0, 0.1098039, 1,
2.108784, 0.5770271, 1.92096, 1, 0, 0.1019608, 1,
2.130111, -0.1410827, 2.147761, 1, 0, 0.09411765, 1,
2.142055, -0.1773542, 1.468302, 1, 0, 0.09019608, 1,
2.150018, 1.087828, -0.3965386, 1, 0, 0.08235294, 1,
2.200071, -0.5559842, 1.127556, 1, 0, 0.07843138, 1,
2.259839, -0.3816879, 3.157316, 1, 0, 0.07058824, 1,
2.308102, 1.286132, 2.371854, 1, 0, 0.06666667, 1,
2.327157, 0.5774474, 1.153555, 1, 0, 0.05882353, 1,
2.483851, -0.9129273, 3.891474, 1, 0, 0.05490196, 1,
2.531311, -1.142129, 1.560685, 1, 0, 0.04705882, 1,
2.587198, -0.7768236, 1.918977, 1, 0, 0.04313726, 1,
2.618125, 1.717722, 1.065557, 1, 0, 0.03529412, 1,
2.622922, 0.08464085, 0.896577, 1, 0, 0.03137255, 1,
2.647919, 1.08124, 0.08455827, 1, 0, 0.02352941, 1,
2.720513, -0.3524681, 0.463734, 1, 0, 0.01960784, 1,
3.175966, 0.2019602, 2.213742, 1, 0, 0.01176471, 1,
3.531705, -1.676764, 0.8175414, 1, 0, 0.007843138, 1
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
0.3009698, -4.420325, -6.984756, 0, -0.5, 0.5, 0.5,
0.3009698, -4.420325, -6.984756, 1, -0.5, 0.5, 0.5,
0.3009698, -4.420325, -6.984756, 1, 1.5, 0.5, 0.5,
0.3009698, -4.420325, -6.984756, 0, 1.5, 0.5, 0.5
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
-4.024985, 0.328494, -6.984756, 0, -0.5, 0.5, 0.5,
-4.024985, 0.328494, -6.984756, 1, -0.5, 0.5, 0.5,
-4.024985, 0.328494, -6.984756, 1, 1.5, 0.5, 0.5,
-4.024985, 0.328494, -6.984756, 0, 1.5, 0.5, 0.5
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
-4.024985, -4.420325, -0.1899114, 0, -0.5, 0.5, 0.5,
-4.024985, -4.420325, -0.1899114, 1, -0.5, 0.5, 0.5,
-4.024985, -4.420325, -0.1899114, 1, 1.5, 0.5, 0.5,
-4.024985, -4.420325, -0.1899114, 0, 1.5, 0.5, 0.5
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
-2, -3.324444, -5.416715,
3, -3.324444, -5.416715,
-2, -3.324444, -5.416715,
-2, -3.507091, -5.678055,
-1, -3.324444, -5.416715,
-1, -3.507091, -5.678055,
0, -3.324444, -5.416715,
0, -3.507091, -5.678055,
1, -3.324444, -5.416715,
1, -3.507091, -5.678055,
2, -3.324444, -5.416715,
2, -3.507091, -5.678055,
3, -3.324444, -5.416715,
3, -3.507091, -5.678055
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
-2, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
-2, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
-2, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
-2, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5,
-1, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
-1, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
-1, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
-1, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5,
0, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
0, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
0, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
0, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5,
1, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
1, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
1, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
1, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5,
2, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
2, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
2, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
2, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5,
3, -3.872385, -6.200736, 0, -0.5, 0.5, 0.5,
3, -3.872385, -6.200736, 1, -0.5, 0.5, 0.5,
3, -3.872385, -6.200736, 1, 1.5, 0.5, 0.5,
3, -3.872385, -6.200736, 0, 1.5, 0.5, 0.5
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
-3.026688, -2, -5.416715,
-3.026688, 2, -5.416715,
-3.026688, -2, -5.416715,
-3.19307, -2, -5.678055,
-3.026688, 0, -5.416715,
-3.19307, 0, -5.678055,
-3.026688, 2, -5.416715,
-3.19307, 2, -5.678055
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
"0",
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
-3.525836, -2, -6.200736, 0, -0.5, 0.5, 0.5,
-3.525836, -2, -6.200736, 1, -0.5, 0.5, 0.5,
-3.525836, -2, -6.200736, 1, 1.5, 0.5, 0.5,
-3.525836, -2, -6.200736, 0, 1.5, 0.5, 0.5,
-3.525836, 0, -6.200736, 0, -0.5, 0.5, 0.5,
-3.525836, 0, -6.200736, 1, -0.5, 0.5, 0.5,
-3.525836, 0, -6.200736, 1, 1.5, 0.5, 0.5,
-3.525836, 0, -6.200736, 0, 1.5, 0.5, 0.5,
-3.525836, 2, -6.200736, 0, -0.5, 0.5, 0.5,
-3.525836, 2, -6.200736, 1, -0.5, 0.5, 0.5,
-3.525836, 2, -6.200736, 1, 1.5, 0.5, 0.5,
-3.525836, 2, -6.200736, 0, 1.5, 0.5, 0.5
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
-3.026688, -3.324444, -4,
-3.026688, -3.324444, 4,
-3.026688, -3.324444, -4,
-3.19307, -3.507091, -4,
-3.026688, -3.324444, -2,
-3.19307, -3.507091, -2,
-3.026688, -3.324444, 0,
-3.19307, -3.507091, 0,
-3.026688, -3.324444, 2,
-3.19307, -3.507091, 2,
-3.026688, -3.324444, 4,
-3.19307, -3.507091, 4
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
-3.525836, -3.872385, -4, 0, -0.5, 0.5, 0.5,
-3.525836, -3.872385, -4, 1, -0.5, 0.5, 0.5,
-3.525836, -3.872385, -4, 1, 1.5, 0.5, 0.5,
-3.525836, -3.872385, -4, 0, 1.5, 0.5, 0.5,
-3.525836, -3.872385, -2, 0, -0.5, 0.5, 0.5,
-3.525836, -3.872385, -2, 1, -0.5, 0.5, 0.5,
-3.525836, -3.872385, -2, 1, 1.5, 0.5, 0.5,
-3.525836, -3.872385, -2, 0, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 0, 0, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 0, 1, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 0, 1, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 0, 0, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 2, 0, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 2, 1, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 2, 1, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 2, 0, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 4, 0, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 4, 1, -0.5, 0.5, 0.5,
-3.525836, -3.872385, 4, 1, 1.5, 0.5, 0.5,
-3.525836, -3.872385, 4, 0, 1.5, 0.5, 0.5
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
-3.026688, -3.324444, -5.416715,
-3.026688, 3.981432, -5.416715,
-3.026688, -3.324444, 5.036892,
-3.026688, 3.981432, 5.036892,
-3.026688, -3.324444, -5.416715,
-3.026688, -3.324444, 5.036892,
-3.026688, 3.981432, -5.416715,
-3.026688, 3.981432, 5.036892,
-3.026688, -3.324444, -5.416715,
3.628627, -3.324444, -5.416715,
-3.026688, -3.324444, 5.036892,
3.628627, -3.324444, 5.036892,
-3.026688, 3.981432, -5.416715,
3.628627, 3.981432, -5.416715,
-3.026688, 3.981432, 5.036892,
3.628627, 3.981432, 5.036892,
3.628627, -3.324444, -5.416715,
3.628627, 3.981432, -5.416715,
3.628627, -3.324444, 5.036892,
3.628627, 3.981432, 5.036892,
3.628627, -3.324444, -5.416715,
3.628627, -3.324444, 5.036892,
3.628627, 3.981432, -5.416715,
3.628627, 3.981432, 5.036892
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
var radius = 7.681658;
var distance = 34.17656;
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
mvMatrix.translate( -0.3009698, -0.328494, 0.1899114 );
mvMatrix.scale( 1.247959, 1.136833, 0.7945161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17656);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
hexaflumuron<-read.table("hexaflumuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexaflumuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
```

```r
y<-hexaflumuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
```

```r
z<-hexaflumuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexaflumuron' not found
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
-2.929765, 0.1428634, -1.310861, 0, 0, 1, 1, 1,
-2.817985, 0.9508829, -1.02966, 1, 0, 0, 1, 1,
-2.526427, 0.6224618, -1.773652, 1, 0, 0, 1, 1,
-2.358118, 0.5019495, -3.269204, 1, 0, 0, 1, 1,
-2.316999, -0.077851, -2.53601, 1, 0, 0, 1, 1,
-2.290853, 1.401946, -0.8949949, 1, 0, 0, 1, 1,
-2.225681, 1.079698, -0.4780068, 0, 0, 0, 1, 1,
-2.157673, 1.265885, -2.190168, 0, 0, 0, 1, 1,
-2.148424, 0.1442274, -1.568763, 0, 0, 0, 1, 1,
-2.128123, 0.03546958, -0.6248366, 0, 0, 0, 1, 1,
-2.039615, 1.77336, -2.002742, 0, 0, 0, 1, 1,
-2.000805, 0.9297012, -2.241987, 0, 0, 0, 1, 1,
-1.997981, 1.264374, -0.3941654, 0, 0, 0, 1, 1,
-1.991638, -0.8198198, -0.01905319, 1, 1, 1, 1, 1,
-1.953916, 0.2215222, -1.353367, 1, 1, 1, 1, 1,
-1.938718, -0.05514785, -0.450054, 1, 1, 1, 1, 1,
-1.927158, 1.781204, 0.6518881, 1, 1, 1, 1, 1,
-1.917302, 1.043604, 0.4122465, 1, 1, 1, 1, 1,
-1.900591, -2.741471, -1.631751, 1, 1, 1, 1, 1,
-1.892486, -0.6674238, -1.172938, 1, 1, 1, 1, 1,
-1.887996, -1.171404, -1.982854, 1, 1, 1, 1, 1,
-1.87507, 0.7184187, -2.794397, 1, 1, 1, 1, 1,
-1.867073, 1.692766, -1.652268, 1, 1, 1, 1, 1,
-1.850957, -0.1095383, -2.632954, 1, 1, 1, 1, 1,
-1.846666, -1.119535, -2.121005, 1, 1, 1, 1, 1,
-1.806323, -0.6774748, -0.2362663, 1, 1, 1, 1, 1,
-1.804034, -1.412534, -1.656005, 1, 1, 1, 1, 1,
-1.802997, -0.1957809, -3.124656, 1, 1, 1, 1, 1,
-1.796811, -0.4235951, -3.02567, 0, 0, 1, 1, 1,
-1.796565, 1.220742, -2.045613, 1, 0, 0, 1, 1,
-1.789302, 0.1260516, -0.8256742, 1, 0, 0, 1, 1,
-1.785537, 0.3975125, -2.595855, 1, 0, 0, 1, 1,
-1.773653, 1.340704, -0.1119951, 1, 0, 0, 1, 1,
-1.748208, 1.184513, -0.6697978, 1, 0, 0, 1, 1,
-1.731522, 0.6171421, 0.5233697, 0, 0, 0, 1, 1,
-1.726001, 0.06100276, -1.521391, 0, 0, 0, 1, 1,
-1.723465, -2.134794, -0.7327923, 0, 0, 0, 1, 1,
-1.716007, -0.4951951, -2.022882, 0, 0, 0, 1, 1,
-1.674696, -0.3764916, -2.372814, 0, 0, 0, 1, 1,
-1.667344, 2.767011, -2.108958, 0, 0, 0, 1, 1,
-1.638662, 0.4398066, -1.338493, 0, 0, 0, 1, 1,
-1.633362, 1.073618, -1.117121, 1, 1, 1, 1, 1,
-1.62656, 0.1116328, -2.986876, 1, 1, 1, 1, 1,
-1.621614, 2.397677, -3.373819, 1, 1, 1, 1, 1,
-1.606442, 1.216632, -1.43601, 1, 1, 1, 1, 1,
-1.601598, 0.7434555, -1.794564, 1, 1, 1, 1, 1,
-1.594316, 0.4057555, -1.761497, 1, 1, 1, 1, 1,
-1.580161, 0.2880086, -0.962785, 1, 1, 1, 1, 1,
-1.578832, -1.132908, -2.09898, 1, 1, 1, 1, 1,
-1.574638, 1.015914, -0.8714897, 1, 1, 1, 1, 1,
-1.557521, 0.6182969, 0.03088103, 1, 1, 1, 1, 1,
-1.540867, 0.4731969, -0.2103202, 1, 1, 1, 1, 1,
-1.526736, 1.562336, -0.07076333, 1, 1, 1, 1, 1,
-1.52275, 0.09368919, -1.215149, 1, 1, 1, 1, 1,
-1.518049, -2.65371, -3.303521, 1, 1, 1, 1, 1,
-1.517228, -0.4879511, -1.858665, 1, 1, 1, 1, 1,
-1.515512, 0.9397697, -2.207377, 0, 0, 1, 1, 1,
-1.509403, 0.03992381, -1.89517, 1, 0, 0, 1, 1,
-1.508137, -0.316405, 0.2007652, 1, 0, 0, 1, 1,
-1.504771, -0.3425688, -1.100139, 1, 0, 0, 1, 1,
-1.491978, -1.762541, -1.776431, 1, 0, 0, 1, 1,
-1.481784, 1.00818, -0.4603159, 1, 0, 0, 1, 1,
-1.479611, 0.3419048, -1.358354, 0, 0, 0, 1, 1,
-1.478943, 1.80811, -0.7353382, 0, 0, 0, 1, 1,
-1.471004, 0.420559, -1.260612, 0, 0, 0, 1, 1,
-1.467797, 0.2396781, -0.4419989, 0, 0, 0, 1, 1,
-1.461517, -1.912158, -2.625127, 0, 0, 0, 1, 1,
-1.459746, -0.5010721, -1.780039, 0, 0, 0, 1, 1,
-1.456662, -1.039021, -1.992413, 0, 0, 0, 1, 1,
-1.443721, -0.7624013, -1.339149, 1, 1, 1, 1, 1,
-1.428785, -0.5537606, -1.488924, 1, 1, 1, 1, 1,
-1.425089, -1.643296, -0.9701363, 1, 1, 1, 1, 1,
-1.415489, -0.376306, -0.9728878, 1, 1, 1, 1, 1,
-1.414494, -2.008172, -0.5156639, 1, 1, 1, 1, 1,
-1.41239, 0.4474678, -0.7039779, 1, 1, 1, 1, 1,
-1.379917, 1.131227, -2.01281, 1, 1, 1, 1, 1,
-1.37202, -0.1639991, -2.98073, 1, 1, 1, 1, 1,
-1.370716, -0.5342109, -2.801885, 1, 1, 1, 1, 1,
-1.353779, -0.9597796, -3.182115, 1, 1, 1, 1, 1,
-1.349168, -0.4937538, -0.8431004, 1, 1, 1, 1, 1,
-1.340184, -1.229044, -1.243057, 1, 1, 1, 1, 1,
-1.335888, 0.5275108, 1.280131, 1, 1, 1, 1, 1,
-1.320341, -1.695872, -2.835084, 1, 1, 1, 1, 1,
-1.316481, 1.88853, -0.04821503, 1, 1, 1, 1, 1,
-1.304712, 2.186932, -0.4416554, 0, 0, 1, 1, 1,
-1.301674, -1.769277, -1.190755, 1, 0, 0, 1, 1,
-1.295798, 0.4252081, -1.526223, 1, 0, 0, 1, 1,
-1.282985, -0.4959465, -2.377088, 1, 0, 0, 1, 1,
-1.28094, 0.779659, 0.9878263, 1, 0, 0, 1, 1,
-1.257054, -0.8632511, -2.424261, 1, 0, 0, 1, 1,
-1.251889, 1.235435, -1.835272, 0, 0, 0, 1, 1,
-1.246802, 0.2424187, -1.369292, 0, 0, 0, 1, 1,
-1.240509, 0.1209533, -1.57604, 0, 0, 0, 1, 1,
-1.229142, 0.004159062, -1.326051, 0, 0, 0, 1, 1,
-1.222642, -0.08941212, -2.370306, 0, 0, 0, 1, 1,
-1.221033, 0.2272148, -0.7617588, 0, 0, 0, 1, 1,
-1.216571, -0.8972848, -1.65884, 0, 0, 0, 1, 1,
-1.213782, 1.03995, 0.4726289, 1, 1, 1, 1, 1,
-1.212138, 2.035661, 0.7471212, 1, 1, 1, 1, 1,
-1.208421, 1.564093, -1.593767, 1, 1, 1, 1, 1,
-1.206415, -0.2380227, -1.718067, 1, 1, 1, 1, 1,
-1.201457, -0.7734616, -2.747476, 1, 1, 1, 1, 1,
-1.200395, 0.4170683, -0.7802996, 1, 1, 1, 1, 1,
-1.198341, -1.412078, -1.27497, 1, 1, 1, 1, 1,
-1.198083, 0.3244287, -3.211239, 1, 1, 1, 1, 1,
-1.194246, 1.794093, -1.603688, 1, 1, 1, 1, 1,
-1.191272, 1.13494, -0.5275759, 1, 1, 1, 1, 1,
-1.191248, 0.8965583, -0.7971703, 1, 1, 1, 1, 1,
-1.187506, 0.8608704, -1.000053, 1, 1, 1, 1, 1,
-1.18704, -0.3520261, -0.09672703, 1, 1, 1, 1, 1,
-1.176029, 1.119091, -1.12215, 1, 1, 1, 1, 1,
-1.175454, 0.09334067, -0.2580546, 1, 1, 1, 1, 1,
-1.173201, -1.016852, -0.9621354, 0, 0, 1, 1, 1,
-1.160986, -2.094837, -2.619621, 1, 0, 0, 1, 1,
-1.159096, -0.1833532, -0.8568184, 1, 0, 0, 1, 1,
-1.15887, -0.3289799, -1.484378, 1, 0, 0, 1, 1,
-1.145932, 0.5774096, -0.2639454, 1, 0, 0, 1, 1,
-1.139041, 0.3932699, -2.028537, 1, 0, 0, 1, 1,
-1.135592, -1.472009, -1.433511, 0, 0, 0, 1, 1,
-1.132377, 0.1598072, -0.6307682, 0, 0, 0, 1, 1,
-1.127992, 0.6574006, -1.809438, 0, 0, 0, 1, 1,
-1.121985, 0.63936, -0.367593, 0, 0, 0, 1, 1,
-1.121334, 0.5330446, -3.082234, 0, 0, 0, 1, 1,
-1.107368, 0.1613238, -0.3466511, 0, 0, 0, 1, 1,
-1.102958, -0.4574381, -0.4064081, 0, 0, 0, 1, 1,
-1.102726, 0.8192891, -1.94019, 1, 1, 1, 1, 1,
-1.097835, 1.706506, -1.639037, 1, 1, 1, 1, 1,
-1.09466, 1.189547, -0.7266386, 1, 1, 1, 1, 1,
-1.091616, 0.2449084, 0.1462006, 1, 1, 1, 1, 1,
-1.091573, 0.5722921, -0.6555179, 1, 1, 1, 1, 1,
-1.084671, 1.00402, -1.561389, 1, 1, 1, 1, 1,
-1.082438, 1.245574, -1.904401, 1, 1, 1, 1, 1,
-1.081402, 1.789869, -0.2058286, 1, 1, 1, 1, 1,
-1.078035, -0.6003597, 0.199089, 1, 1, 1, 1, 1,
-1.06796, 0.2793715, -2.971315, 1, 1, 1, 1, 1,
-1.067708, -1.531942, -2.848038, 1, 1, 1, 1, 1,
-1.066851, 1.351893, -1.696008, 1, 1, 1, 1, 1,
-1.06212, -0.9272652, -3.938584, 1, 1, 1, 1, 1,
-1.061805, -0.06297304, 0.08692611, 1, 1, 1, 1, 1,
-1.050085, 0.8854737, 1.520568, 1, 1, 1, 1, 1,
-1.045137, 0.432532, -1.48833, 0, 0, 1, 1, 1,
-1.03344, -0.7578282, -2.220141, 1, 0, 0, 1, 1,
-1.02679, -0.932929, -4.084862, 1, 0, 0, 1, 1,
-1.026572, -0.6446236, -1.79473, 1, 0, 0, 1, 1,
-1.02044, -0.4247624, -2.317997, 1, 0, 0, 1, 1,
-1.016364, -0.3284521, -2.143229, 1, 0, 0, 1, 1,
-1.011488, 0.1453639, -0.8389623, 0, 0, 0, 1, 1,
-1.011377, 0.3104062, -1.648641, 0, 0, 0, 1, 1,
-1.000467, -0.2843527, -0.07615945, 0, 0, 0, 1, 1,
-0.9976696, 0.6997581, -1.622537, 0, 0, 0, 1, 1,
-0.9933286, 0.2411239, -2.094975, 0, 0, 0, 1, 1,
-0.9923629, -0.9335155, -1.100705, 0, 0, 0, 1, 1,
-0.9918094, 2.324225, -0.1051567, 0, 0, 0, 1, 1,
-0.9903199, -0.3831676, -3.759794, 1, 1, 1, 1, 1,
-0.9871244, 1.958469, -2.525011, 1, 1, 1, 1, 1,
-0.9850247, -0.5875691, -3.571726, 1, 1, 1, 1, 1,
-0.9788764, -0.1684846, -0.7453995, 1, 1, 1, 1, 1,
-0.9756886, 3.270445, -0.6834812, 1, 1, 1, 1, 1,
-0.9684407, 0.05712255, -2.788848, 1, 1, 1, 1, 1,
-0.9644369, -2.72372, -4.71592, 1, 1, 1, 1, 1,
-0.9630523, 0.5988821, -1.232232, 1, 1, 1, 1, 1,
-0.95739, 0.1916478, -0.6918092, 1, 1, 1, 1, 1,
-0.9551528, 0.3123011, -2.664639, 1, 1, 1, 1, 1,
-0.9535412, 0.4157519, -1.5241, 1, 1, 1, 1, 1,
-0.9462249, 0.6948109, -0.8439268, 1, 1, 1, 1, 1,
-0.9391598, -1.017722, -0.9332802, 1, 1, 1, 1, 1,
-0.9292691, 0.03190326, 0.2945742, 1, 1, 1, 1, 1,
-0.9237499, 1.397045, -1.200544, 1, 1, 1, 1, 1,
-0.9222422, 1.352683, -0.3272895, 0, 0, 1, 1, 1,
-0.9202309, 1.188636, -0.4450854, 1, 0, 0, 1, 1,
-0.9142997, -0.4679268, -1.809998, 1, 0, 0, 1, 1,
-0.9084911, 0.5423731, -0.956231, 1, 0, 0, 1, 1,
-0.9077141, -0.8228879, -2.886287, 1, 0, 0, 1, 1,
-0.9049584, 0.5625144, 0.8344647, 1, 0, 0, 1, 1,
-0.902081, 1.546041, 0.08734694, 0, 0, 0, 1, 1,
-0.9001592, 0.6408519, 1.051069, 0, 0, 0, 1, 1,
-0.8985797, -0.4864863, -0.3711714, 0, 0, 0, 1, 1,
-0.897889, -0.3532796, -1.492952, 0, 0, 0, 1, 1,
-0.8944836, -0.8318328, -1.676716, 0, 0, 0, 1, 1,
-0.8944439, 0.6861062, -0.319255, 0, 0, 0, 1, 1,
-0.8906271, -0.7171531, 0.3445037, 0, 0, 0, 1, 1,
-0.8829651, 0.3397771, -0.3896291, 1, 1, 1, 1, 1,
-0.8825762, 1.422758, 0.2090065, 1, 1, 1, 1, 1,
-0.879629, 1.282267, -0.3717479, 1, 1, 1, 1, 1,
-0.8771882, 1.452885, -0.813002, 1, 1, 1, 1, 1,
-0.8760389, -0.03618127, -1.064706, 1, 1, 1, 1, 1,
-0.8758091, 0.9273472, 0.1131309, 1, 1, 1, 1, 1,
-0.8632748, -0.9695653, -3.980902, 1, 1, 1, 1, 1,
-0.8632223, 2.150703, -0.1891914, 1, 1, 1, 1, 1,
-0.8619466, -0.3591434, -2.667403, 1, 1, 1, 1, 1,
-0.8575778, -0.5705836, -1.078095, 1, 1, 1, 1, 1,
-0.8532045, 1.84169, -0.8777223, 1, 1, 1, 1, 1,
-0.8490829, -0.3824058, -2.767382, 1, 1, 1, 1, 1,
-0.8486627, 1.236996, -0.08901886, 1, 1, 1, 1, 1,
-0.8464012, 0.5683479, -1.902924, 1, 1, 1, 1, 1,
-0.8432047, -1.654131, -0.2639541, 1, 1, 1, 1, 1,
-0.8411437, -0.05749894, -1.070355, 0, 0, 1, 1, 1,
-0.8391859, -0.4689643, -2.171837, 1, 0, 0, 1, 1,
-0.8383172, 1.631199, -0.4739912, 1, 0, 0, 1, 1,
-0.8372313, -0.1672296, -3.186421, 1, 0, 0, 1, 1,
-0.8359566, -1.146948, -2.904368, 1, 0, 0, 1, 1,
-0.8301185, -0.2643693, -1.948366, 1, 0, 0, 1, 1,
-0.8271877, 0.02223581, -1.121422, 0, 0, 0, 1, 1,
-0.8237932, 2.199689, 0.06512773, 0, 0, 0, 1, 1,
-0.8170125, 0.8983386, -1.53854, 0, 0, 0, 1, 1,
-0.8132495, -0.5044929, -2.454088, 0, 0, 0, 1, 1,
-0.8089952, 0.253395, -0.1259339, 0, 0, 0, 1, 1,
-0.8025547, 0.6201081, -0.9411357, 0, 0, 0, 1, 1,
-0.8009914, -0.4973719, -2.857032, 0, 0, 0, 1, 1,
-0.7956359, 0.5812992, -1.295097, 1, 1, 1, 1, 1,
-0.7947282, 0.0969067, -2.696842, 1, 1, 1, 1, 1,
-0.7937819, 0.537212, -2.675439, 1, 1, 1, 1, 1,
-0.7927108, -0.0278721, -1.257111, 1, 1, 1, 1, 1,
-0.7924833, -0.9414846, -1.168465, 1, 1, 1, 1, 1,
-0.7891818, -0.04956296, -2.158633, 1, 1, 1, 1, 1,
-0.7884549, 0.5996504, -0.3098938, 1, 1, 1, 1, 1,
-0.7884151, 2.064679, -1.373569, 1, 1, 1, 1, 1,
-0.7882693, -1.042845, -2.759664, 1, 1, 1, 1, 1,
-0.7876819, -0.7326786, -2.672639, 1, 1, 1, 1, 1,
-0.7871032, 1.344303, -0.1935217, 1, 1, 1, 1, 1,
-0.7841673, 0.4195863, -1.417944, 1, 1, 1, 1, 1,
-0.7783716, 0.394042, -2.039631, 1, 1, 1, 1, 1,
-0.7762595, 0.02958457, -2.923832, 1, 1, 1, 1, 1,
-0.7759295, 0.4010334, -1.600813, 1, 1, 1, 1, 1,
-0.7694572, -0.3459289, -0.03203287, 0, 0, 1, 1, 1,
-0.7676077, 0.4601709, -0.3952421, 1, 0, 0, 1, 1,
-0.7664407, 1.902476, -1.485869, 1, 0, 0, 1, 1,
-0.7594371, -0.1553991, 0.2133854, 1, 0, 0, 1, 1,
-0.756539, -0.3116078, -3.168463, 1, 0, 0, 1, 1,
-0.7543457, -1.099485, -1.789492, 1, 0, 0, 1, 1,
-0.7488323, 0.01363446, -0.9941247, 0, 0, 0, 1, 1,
-0.7478592, -2.444327, -3.183703, 0, 0, 0, 1, 1,
-0.7395813, -0.8915238, -1.651441, 0, 0, 0, 1, 1,
-0.7368004, -0.5762394, -1.743608, 0, 0, 0, 1, 1,
-0.7323325, -0.945344, -3.007511, 0, 0, 0, 1, 1,
-0.7303804, 1.110133, 2.167166, 0, 0, 0, 1, 1,
-0.7242141, -0.7687451, -4.29501, 0, 0, 0, 1, 1,
-0.721551, -0.9388694, -2.480232, 1, 1, 1, 1, 1,
-0.7189588, 0.6381348, -0.5300497, 1, 1, 1, 1, 1,
-0.7179806, -0.4048865, -1.461906, 1, 1, 1, 1, 1,
-0.7120225, -1.713288, -3.041122, 1, 1, 1, 1, 1,
-0.7081485, 0.08820664, -3.85949, 1, 1, 1, 1, 1,
-0.7023729, 0.6618592, 0.6041415, 1, 1, 1, 1, 1,
-0.7009622, 0.6182773, -1.988008, 1, 1, 1, 1, 1,
-0.695317, -1.974688, -1.675746, 1, 1, 1, 1, 1,
-0.6896235, 0.04775342, -0.07000311, 1, 1, 1, 1, 1,
-0.6874719, 0.8912249, -1.035843, 1, 1, 1, 1, 1,
-0.6854019, -0.114412, -2.155776, 1, 1, 1, 1, 1,
-0.6837049, 1.007523, 0.4939143, 1, 1, 1, 1, 1,
-0.6835335, -1.434475, -2.402369, 1, 1, 1, 1, 1,
-0.6788622, 1.615459, 0.2106053, 1, 1, 1, 1, 1,
-0.6658083, 0.5461391, -0.2674471, 1, 1, 1, 1, 1,
-0.6622861, 0.7644627, 0.03518516, 0, 0, 1, 1, 1,
-0.6619883, 0.5877186, 1.394493, 1, 0, 0, 1, 1,
-0.6572579, -0.7970659, -1.722336, 1, 0, 0, 1, 1,
-0.654194, 0.3030364, -0.9749967, 1, 0, 0, 1, 1,
-0.6521299, -0.7596013, -2.877741, 1, 0, 0, 1, 1,
-0.6504973, 0.8031723, -1.685303, 1, 0, 0, 1, 1,
-0.649436, -0.07978648, -1.419627, 0, 0, 0, 1, 1,
-0.6483041, -0.7161983, -3.098526, 0, 0, 0, 1, 1,
-0.6463556, 1.973129, -0.7648111, 0, 0, 0, 1, 1,
-0.6448387, -0.5944477, -3.258001, 0, 0, 0, 1, 1,
-0.6386184, 0.5806602, -1.255771, 0, 0, 0, 1, 1,
-0.6380844, 0.8767676, -0.4595135, 0, 0, 0, 1, 1,
-0.6347221, 1.114419, -0.4204899, 0, 0, 0, 1, 1,
-0.6336694, -0.4840115, -2.355886, 1, 1, 1, 1, 1,
-0.6323906, 0.3298339, 0.8133847, 1, 1, 1, 1, 1,
-0.631684, 0.8138921, 0.7150816, 1, 1, 1, 1, 1,
-0.6293268, -1.661393, -1.896349, 1, 1, 1, 1, 1,
-0.6290302, -1.057172, -2.558937, 1, 1, 1, 1, 1,
-0.626357, -1.57839, -3.078846, 1, 1, 1, 1, 1,
-0.6248239, 2.074716, 0.2472393, 1, 1, 1, 1, 1,
-0.6236144, 1.024602, 0.2424899, 1, 1, 1, 1, 1,
-0.6227891, 0.5788055, -0.2497764, 1, 1, 1, 1, 1,
-0.6195382, 1.751781, -0.5865985, 1, 1, 1, 1, 1,
-0.6159168, -0.2060031, -1.56956, 1, 1, 1, 1, 1,
-0.6132969, -0.01933526, -1.167509, 1, 1, 1, 1, 1,
-0.6126504, -0.8153939, -3.01004, 1, 1, 1, 1, 1,
-0.6118628, 1.649057, 0.9360382, 1, 1, 1, 1, 1,
-0.6090904, 0.4036353, -0.5779297, 1, 1, 1, 1, 1,
-0.6046843, 1.914086, -0.6340164, 0, 0, 1, 1, 1,
-0.6040626, 1.46275, -0.4104571, 1, 0, 0, 1, 1,
-0.6022758, 0.2001269, -0.799919, 1, 0, 0, 1, 1,
-0.6015652, 0.8644835, 0.7820491, 1, 0, 0, 1, 1,
-0.5931132, -1.020949, -2.793709, 1, 0, 0, 1, 1,
-0.589868, -1.336948, -0.4774189, 1, 0, 0, 1, 1,
-0.5880263, 0.3845719, -1.945655, 0, 0, 0, 1, 1,
-0.5860671, -1.317067, -0.3270005, 0, 0, 0, 1, 1,
-0.5833446, 1.039855, -1.061184, 0, 0, 0, 1, 1,
-0.5815406, -0.191967, -0.2628054, 0, 0, 0, 1, 1,
-0.5784344, 0.07772344, 0.5988346, 0, 0, 0, 1, 1,
-0.5755818, -0.2230878, -2.311378, 0, 0, 0, 1, 1,
-0.5751792, 0.6290151, -1.16853, 0, 0, 0, 1, 1,
-0.5750467, 0.279866, -0.4490231, 1, 1, 1, 1, 1,
-0.5714511, 0.4807361, -1.608047, 1, 1, 1, 1, 1,
-0.5710252, -0.03848396, -1.152928, 1, 1, 1, 1, 1,
-0.5622084, 0.5266215, -1.000396, 1, 1, 1, 1, 1,
-0.5555402, 1.047603, 0.5048972, 1, 1, 1, 1, 1,
-0.5505156, 0.3903488, -1.609252, 1, 1, 1, 1, 1,
-0.5473421, -2.175017, -2.373503, 1, 1, 1, 1, 1,
-0.5449703, -0.1679724, -1.891437, 1, 1, 1, 1, 1,
-0.5449008, 0.05017848, -0.6817529, 1, 1, 1, 1, 1,
-0.5448169, 0.4854073, -0.0522577, 1, 1, 1, 1, 1,
-0.5434784, -2.577686, -3.977896, 1, 1, 1, 1, 1,
-0.5355871, 0.0317667, -2.041777, 1, 1, 1, 1, 1,
-0.5346236, 0.5993747, -0.0137661, 1, 1, 1, 1, 1,
-0.5323123, -0.4770373, -3.532387, 1, 1, 1, 1, 1,
-0.5256268, 1.010443, -0.5998187, 1, 1, 1, 1, 1,
-0.5212247, -2.300117, -3.634933, 0, 0, 1, 1, 1,
-0.5161684, -0.1825424, -2.555754, 1, 0, 0, 1, 1,
-0.5160105, 0.4787586, -0.8254561, 1, 0, 0, 1, 1,
-0.5152017, 0.737816, 0.9386318, 1, 0, 0, 1, 1,
-0.5111524, 0.1317802, -1.284562, 1, 0, 0, 1, 1,
-0.5099666, -1.519813, -4.004274, 1, 0, 0, 1, 1,
-0.5091732, -1.967729, -2.767438, 0, 0, 0, 1, 1,
-0.5082468, 1.517036, -0.8448117, 0, 0, 0, 1, 1,
-0.5025091, 0.02313828, -0.8495042, 0, 0, 0, 1, 1,
-0.5023466, -0.7566885, -3.279323, 0, 0, 0, 1, 1,
-0.5009369, -0.082941, -0.8094446, 0, 0, 0, 1, 1,
-0.4956762, -1.43152, -2.088593, 0, 0, 0, 1, 1,
-0.4951471, 2.268482, -0.1496733, 0, 0, 0, 1, 1,
-0.4937316, 0.7864574, -0.3676915, 1, 1, 1, 1, 1,
-0.4892446, -0.1382676, -3.607882, 1, 1, 1, 1, 1,
-0.4891801, -0.272952, -1.738546, 1, 1, 1, 1, 1,
-0.4881731, -0.6270726, -2.977894, 1, 1, 1, 1, 1,
-0.483698, -0.004046252, 0.2591893, 1, 1, 1, 1, 1,
-0.4828362, 0.973538, 1.024263, 1, 1, 1, 1, 1,
-0.4768867, -0.07165784, -1.561761, 1, 1, 1, 1, 1,
-0.4757232, 1.136549, -1.093631, 1, 1, 1, 1, 1,
-0.4737446, -0.5933257, -2.980473, 1, 1, 1, 1, 1,
-0.4710223, 0.3882654, -1.235549, 1, 1, 1, 1, 1,
-0.4692475, -0.146852, -2.452854, 1, 1, 1, 1, 1,
-0.4668211, -0.4394679, -2.293088, 1, 1, 1, 1, 1,
-0.4641024, 0.1497693, -0.9062115, 1, 1, 1, 1, 1,
-0.4626012, 0.8915713, -1.187688, 1, 1, 1, 1, 1,
-0.4569886, 0.4312788, -0.8191046, 1, 1, 1, 1, 1,
-0.4539933, 0.5914248, -0.8628148, 0, 0, 1, 1, 1,
-0.4533798, 0.3233649, -1.096668, 1, 0, 0, 1, 1,
-0.452515, 1.409209, -1.174531, 1, 0, 0, 1, 1,
-0.4525113, 0.7074789, 1.990386, 1, 0, 0, 1, 1,
-0.4491512, -0.7933011, -4.017574, 1, 0, 0, 1, 1,
-0.4460653, -0.6451597, -2.126253, 1, 0, 0, 1, 1,
-0.4441898, -2.40554, -2.849873, 0, 0, 0, 1, 1,
-0.4432628, -0.5610928, -2.136882, 0, 0, 0, 1, 1,
-0.4419661, -0.879733, -1.698038, 0, 0, 0, 1, 1,
-0.4379312, 0.05301232, -1.244807, 0, 0, 0, 1, 1,
-0.4348919, 2.739035, -0.7937739, 0, 0, 0, 1, 1,
-0.4347432, 0.02328284, -3.245645, 0, 0, 0, 1, 1,
-0.4262654, 1.040454, -0.04477758, 0, 0, 0, 1, 1,
-0.4249741, 0.5969339, 1.28666, 1, 1, 1, 1, 1,
-0.4242313, -0.07857665, -2.136318, 1, 1, 1, 1, 1,
-0.4219016, 0.1723364, -2.603702, 1, 1, 1, 1, 1,
-0.4214777, -0.4410092, -3.412189, 1, 1, 1, 1, 1,
-0.4113479, -0.7385975, -2.671655, 1, 1, 1, 1, 1,
-0.4071571, 0.977287, -0.4207378, 1, 1, 1, 1, 1,
-0.4065616, 0.3706698, -1.181277, 1, 1, 1, 1, 1,
-0.4032612, 0.3678873, -0.9815642, 1, 1, 1, 1, 1,
-0.3997448, -1.570626, -3.889279, 1, 1, 1, 1, 1,
-0.3987425, -0.5515472, -1.821405, 1, 1, 1, 1, 1,
-0.3983769, 0.6569866, -0.2166149, 1, 1, 1, 1, 1,
-0.3973766, 1.141289, 0.6747535, 1, 1, 1, 1, 1,
-0.3967266, 0.09848623, -2.726138, 1, 1, 1, 1, 1,
-0.3910907, 0.3159824, -1.770107, 1, 1, 1, 1, 1,
-0.3900042, 0.4654559, -0.1330719, 1, 1, 1, 1, 1,
-0.3899427, -0.03313219, -1.210052, 0, 0, 1, 1, 1,
-0.3892999, 0.03789705, -2.440385, 1, 0, 0, 1, 1,
-0.3875608, -1.685391, -1.708965, 1, 0, 0, 1, 1,
-0.3860706, 0.5679619, 0.08421098, 1, 0, 0, 1, 1,
-0.3838989, -0.9692897, -2.106177, 1, 0, 0, 1, 1,
-0.3769136, -0.9818205, -4.230116, 1, 0, 0, 1, 1,
-0.3766323, -1.598715, -3.271903, 0, 0, 0, 1, 1,
-0.3699928, -0.7312044, -2.252772, 0, 0, 0, 1, 1,
-0.3672058, -0.1524432, -2.157771, 0, 0, 0, 1, 1,
-0.3656103, 0.1043095, -1.591126, 0, 0, 0, 1, 1,
-0.3640181, 0.5050309, 0.1797944, 0, 0, 0, 1, 1,
-0.3626375, 0.5134485, -1.416382, 0, 0, 0, 1, 1,
-0.3621293, 0.343325, -0.1941699, 0, 0, 0, 1, 1,
-0.3562612, -0.8681471, -2.7505, 1, 1, 1, 1, 1,
-0.3559102, -0.5843999, -0.6072791, 1, 1, 1, 1, 1,
-0.3557746, 0.01145118, -0.5616056, 1, 1, 1, 1, 1,
-0.3540268, 0.7844362, 0.3254201, 1, 1, 1, 1, 1,
-0.350044, -0.5370654, -4.700229, 1, 1, 1, 1, 1,
-0.3494519, 0.3373513, 0.8865018, 1, 1, 1, 1, 1,
-0.344223, -1.532909, -1.705356, 1, 1, 1, 1, 1,
-0.3428887, 0.7366531, 0.2766275, 1, 1, 1, 1, 1,
-0.34046, -0.004215947, -2.208006, 1, 1, 1, 1, 1,
-0.3402401, -0.28876, -0.6793571, 1, 1, 1, 1, 1,
-0.339509, 0.4179285, -0.3227553, 1, 1, 1, 1, 1,
-0.3391255, 0.2297732, -1.573493, 1, 1, 1, 1, 1,
-0.334949, -0.6962368, -3.95158, 1, 1, 1, 1, 1,
-0.33487, -0.5813795, -2.811613, 1, 1, 1, 1, 1,
-0.3261268, 1.595561, -2.666424, 1, 1, 1, 1, 1,
-0.3222767, 0.07452639, -0.1628317, 0, 0, 1, 1, 1,
-0.3218982, -1.369733, -3.496176, 1, 0, 0, 1, 1,
-0.3199028, 1.667898, -0.1195474, 1, 0, 0, 1, 1,
-0.3184667, -0.5590033, -1.347358, 1, 0, 0, 1, 1,
-0.3151874, 1.089097, 0.9951706, 1, 0, 0, 1, 1,
-0.3141128, 1.729838, -0.878565, 1, 0, 0, 1, 1,
-0.2988951, -0.430955, -2.377171, 0, 0, 0, 1, 1,
-0.2983454, 0.2022767, 0.9227288, 0, 0, 0, 1, 1,
-0.2910717, -0.4657268, -2.394747, 0, 0, 0, 1, 1,
-0.2824302, -0.09549036, -1.89742, 0, 0, 0, 1, 1,
-0.2768056, -0.561933, -3.9722, 0, 0, 0, 1, 1,
-0.2759694, -0.4086065, -1.225818, 0, 0, 0, 1, 1,
-0.2714446, -0.152747, -0.3549536, 0, 0, 0, 1, 1,
-0.2700463, -1.075714, -4.558259, 1, 1, 1, 1, 1,
-0.2695367, 0.9333092, 0.05369294, 1, 1, 1, 1, 1,
-0.2679912, 0.1920021, 0.9610826, 1, 1, 1, 1, 1,
-0.2651495, 1.344244, 0.5542004, 1, 1, 1, 1, 1,
-0.2642437, -0.1517872, -3.419128, 1, 1, 1, 1, 1,
-0.261539, -0.1082264, -2.031863, 1, 1, 1, 1, 1,
-0.2540965, 1.163726, -1.414337, 1, 1, 1, 1, 1,
-0.251776, 1.303927, -0.5158476, 1, 1, 1, 1, 1,
-0.2513641, -0.5602542, -4.156624, 1, 1, 1, 1, 1,
-0.2505591, -1.022751, -1.617123, 1, 1, 1, 1, 1,
-0.2503543, 0.2123244, -0.7676455, 1, 1, 1, 1, 1,
-0.2436869, 0.0335523, -1.763238, 1, 1, 1, 1, 1,
-0.2423683, -0.828799, -2.651894, 1, 1, 1, 1, 1,
-0.2391138, -1.48913, -2.799076, 1, 1, 1, 1, 1,
-0.2386207, -0.3494133, -2.369182, 1, 1, 1, 1, 1,
-0.2373307, -0.3887588, -2.235321, 0, 0, 1, 1, 1,
-0.2368253, -0.4523484, -2.426182, 1, 0, 0, 1, 1,
-0.2327563, -0.1749162, -0.8377357, 1, 0, 0, 1, 1,
-0.2301406, -0.8568842, -2.78783, 1, 0, 0, 1, 1,
-0.2297235, 1.176323, -0.5187123, 1, 0, 0, 1, 1,
-0.2265025, -0.6912953, -4.031377, 1, 0, 0, 1, 1,
-0.2253796, -0.6593326, -2.247143, 0, 0, 0, 1, 1,
-0.2249802, 0.4576288, 0.6005067, 0, 0, 0, 1, 1,
-0.214121, 0.8537876, 2.272289, 0, 0, 0, 1, 1,
-0.2054389, -1.720855, -3.14729, 0, 0, 0, 1, 1,
-0.2047048, 1.051323, -2.888902, 0, 0, 0, 1, 1,
-0.1985659, 0.3389228, 0.5450317, 0, 0, 0, 1, 1,
-0.1984518, 0.3131516, 0.3119447, 0, 0, 0, 1, 1,
-0.1963977, -0.8607289, -1.851684, 1, 1, 1, 1, 1,
-0.1883592, -1.215204, -2.638669, 1, 1, 1, 1, 1,
-0.185334, 1.378177, -1.135026, 1, 1, 1, 1, 1,
-0.1836857, 0.9676446, 0.8503572, 1, 1, 1, 1, 1,
-0.1818561, -1.25937, -2.007621, 1, 1, 1, 1, 1,
-0.1764751, 0.7091397, -0.9873489, 1, 1, 1, 1, 1,
-0.176005, 1.383448, -1.870916, 1, 1, 1, 1, 1,
-0.1751679, 1.188155, 1.386217, 1, 1, 1, 1, 1,
-0.1736231, -0.1061578, -0.6931303, 1, 1, 1, 1, 1,
-0.1706912, -0.2494599, -2.574856, 1, 1, 1, 1, 1,
-0.1685573, 0.9661927, 0.3514984, 1, 1, 1, 1, 1,
-0.166909, -1.33986, -2.71852, 1, 1, 1, 1, 1,
-0.1664693, -0.7624906, -3.494844, 1, 1, 1, 1, 1,
-0.1613462, -0.6301933, -1.564648, 1, 1, 1, 1, 1,
-0.1611562, 0.5508726, 0.2140265, 1, 1, 1, 1, 1,
-0.1577572, 0.63052, -1.573765, 0, 0, 1, 1, 1,
-0.1561985, -1.500403, -3.743802, 1, 0, 0, 1, 1,
-0.1560408, -0.52067, -3.077379, 1, 0, 0, 1, 1,
-0.1448817, -0.5202467, -2.671354, 1, 0, 0, 1, 1,
-0.1413721, 0.2533152, -0.6169342, 1, 0, 0, 1, 1,
-0.1404428, 1.461496, 1.14947, 1, 0, 0, 1, 1,
-0.1386918, 0.2709923, -2.034802, 0, 0, 0, 1, 1,
-0.1386751, 1.26768, 0.4225484, 0, 0, 0, 1, 1,
-0.1332886, 0.5433445, -0.7073506, 0, 0, 0, 1, 1,
-0.1330049, -1.067327, -4.599768, 0, 0, 0, 1, 1,
-0.1322274, -0.6843908, -2.643626, 0, 0, 0, 1, 1,
-0.1295522, -0.4723946, -2.320677, 0, 0, 0, 1, 1,
-0.1292338, 0.02697055, -1.096023, 0, 0, 0, 1, 1,
-0.1177013, -0.4963219, -2.165244, 1, 1, 1, 1, 1,
-0.1174669, -0.7692134, -2.839849, 1, 1, 1, 1, 1,
-0.1159939, -0.4323021, -2.440946, 1, 1, 1, 1, 1,
-0.1159043, 0.861191, -0.3517782, 1, 1, 1, 1, 1,
-0.1132655, -0.6191669, -4.5131, 1, 1, 1, 1, 1,
-0.1112319, 0.794358, 0.09442456, 1, 1, 1, 1, 1,
-0.1100297, -0.5077747, -4.552207, 1, 1, 1, 1, 1,
-0.1086375, -2.129749, -3.572739, 1, 1, 1, 1, 1,
-0.108536, -1.144798, -3.043964, 1, 1, 1, 1, 1,
-0.1071395, -0.8930039, -3.476568, 1, 1, 1, 1, 1,
-0.1025357, -0.2944941, -3.208521, 1, 1, 1, 1, 1,
-0.10196, 0.6887851, 0.05769375, 1, 1, 1, 1, 1,
-0.09979142, -1.008202, -3.140235, 1, 1, 1, 1, 1,
-0.09928646, -1.08512, -2.306095, 1, 1, 1, 1, 1,
-0.09775387, -0.2927251, -5.264478, 1, 1, 1, 1, 1,
-0.09709778, 0.2086766, -1.735996, 0, 0, 1, 1, 1,
-0.09509163, -0.6210077, -4.282603, 1, 0, 0, 1, 1,
-0.09038784, -0.7207159, -3.643412, 1, 0, 0, 1, 1,
-0.08685086, 1.947019, 0.5410413, 1, 0, 0, 1, 1,
-0.08544949, -0.7688233, -1.919143, 1, 0, 0, 1, 1,
-0.07956899, -0.02421971, -3.012165, 1, 0, 0, 1, 1,
-0.07707337, -0.4716767, -3.897188, 0, 0, 0, 1, 1,
-0.07544689, -1.252576, -3.17261, 0, 0, 0, 1, 1,
-0.07258105, -0.05481555, -1.205177, 0, 0, 0, 1, 1,
-0.06609235, -0.09255885, -3.90671, 0, 0, 0, 1, 1,
-0.06368017, 0.658645, 0.538689, 0, 0, 0, 1, 1,
-0.06367929, -0.2095039, -3.24586, 0, 0, 0, 1, 1,
-0.06149393, -0.9835053, -2.953709, 0, 0, 0, 1, 1,
-0.06097467, 0.8643039, 0.2356633, 1, 1, 1, 1, 1,
-0.06000917, 0.4241083, -0.4218415, 1, 1, 1, 1, 1,
-0.05983071, -1.033727, -1.826764, 1, 1, 1, 1, 1,
-0.05895144, -0.3270686, -3.805432, 1, 1, 1, 1, 1,
-0.05872648, -0.5784763, -5.04359, 1, 1, 1, 1, 1,
-0.05622862, -0.9165778, -3.437261, 1, 1, 1, 1, 1,
-0.05312671, 0.2854767, -0.3010926, 1, 1, 1, 1, 1,
-0.05296677, -0.5815096, -3.460832, 1, 1, 1, 1, 1,
-0.04977265, -0.2372015, -3.003569, 1, 1, 1, 1, 1,
-0.04896486, -1.150531, -4.097044, 1, 1, 1, 1, 1,
-0.04196921, -1.14625, -3.811594, 1, 1, 1, 1, 1,
-0.04034673, 0.7435715, -0.9097101, 1, 1, 1, 1, 1,
-0.03843315, 0.1809019, -0.9511972, 1, 1, 1, 1, 1,
-0.03746473, 1.209134, 0.5822475, 1, 1, 1, 1, 1,
-0.03506012, 0.6475466, 0.4296172, 1, 1, 1, 1, 1,
-0.03063057, 0.6898365, -1.347163, 0, 0, 1, 1, 1,
-0.02925446, 1.658375, 0.9825271, 1, 0, 0, 1, 1,
-0.02888572, 0.7692931, -2.760694, 1, 0, 0, 1, 1,
-0.02847061, -1.18422, -2.35144, 1, 0, 0, 1, 1,
-0.0276979, 0.4541416, -1.668337, 1, 0, 0, 1, 1,
-0.02769512, 0.3156479, 0.8339291, 1, 0, 0, 1, 1,
-0.02650104, 0.8960772, 0.9069638, 0, 0, 0, 1, 1,
-0.02589941, -0.2132923, -2.849607, 0, 0, 0, 1, 1,
-0.02587213, 0.08948289, 0.3544249, 0, 0, 0, 1, 1,
-0.01717269, -0.08356043, -1.654684, 0, 0, 0, 1, 1,
-0.004632257, 1.454242, -1.416426, 0, 0, 0, 1, 1,
0.0003908024, 1.048436, 0.4067363, 0, 0, 0, 1, 1,
0.003895138, 0.8745705, 0.06467608, 0, 0, 0, 1, 1,
0.01008824, -0.9201682, 3.462588, 1, 1, 1, 1, 1,
0.01111163, 0.5274054, -0.02923561, 1, 1, 1, 1, 1,
0.01536893, -1.49873, 1.194639, 1, 1, 1, 1, 1,
0.01712223, -0.04572512, 3.764291, 1, 1, 1, 1, 1,
0.02594074, 0.4844975, -0.344886, 1, 1, 1, 1, 1,
0.02616663, -0.60918, 4.34974, 1, 1, 1, 1, 1,
0.03315524, -0.264118, 4.513335, 1, 1, 1, 1, 1,
0.03387202, 0.4841664, -0.4470238, 1, 1, 1, 1, 1,
0.03984977, -0.7826513, 4.1115, 1, 1, 1, 1, 1,
0.04098864, -0.1698012, 3.153231, 1, 1, 1, 1, 1,
0.04425039, 1.351413, 0.8806595, 1, 1, 1, 1, 1,
0.04476647, 0.5770514, 1.864117, 1, 1, 1, 1, 1,
0.04783932, -0.7675511, 4.178712, 1, 1, 1, 1, 1,
0.05206867, -0.5264167, 2.406419, 1, 1, 1, 1, 1,
0.05208573, 1.263098, -0.269369, 1, 1, 1, 1, 1,
0.05826224, -0.5946588, 4.415738, 0, 0, 1, 1, 1,
0.05991756, 0.2842401, 0.8936202, 1, 0, 0, 1, 1,
0.06605028, -0.4079148, 4.03074, 1, 0, 0, 1, 1,
0.06991709, -1.154943, 4.212555, 1, 0, 0, 1, 1,
0.07014313, 0.4400662, 0.7081785, 1, 0, 0, 1, 1,
0.0705131, -1.656665, 2.541461, 1, 0, 0, 1, 1,
0.07294187, -0.6123316, 3.32348, 0, 0, 0, 1, 1,
0.07706403, -0.7982292, 4.466891, 0, 0, 0, 1, 1,
0.07930769, -1.125566, 2.29156, 0, 0, 0, 1, 1,
0.08928759, -1.180297, 3.03294, 0, 0, 0, 1, 1,
0.08950318, 0.4558064, 1.783592, 0, 0, 0, 1, 1,
0.08971023, 3.133935, 1.312532, 0, 0, 0, 1, 1,
0.09111296, 2.009569, 0.7986677, 0, 0, 0, 1, 1,
0.1003587, 0.04981318, 0.9439355, 1, 1, 1, 1, 1,
0.1007723, -0.8980624, 3.593229, 1, 1, 1, 1, 1,
0.1040688, 0.8064834, 2.109547, 1, 1, 1, 1, 1,
0.1067698, -1.508595, 4.509058, 1, 1, 1, 1, 1,
0.1078616, -1.549547, 4.176138, 1, 1, 1, 1, 1,
0.1122801, -0.08840861, 3.122113, 1, 1, 1, 1, 1,
0.1159488, 1.818017, 2.068762, 1, 1, 1, 1, 1,
0.1162157, -0.4732311, 3.747267, 1, 1, 1, 1, 1,
0.1167098, 1.504129, -0.5268575, 1, 1, 1, 1, 1,
0.1184071, 0.7921311, -0.5314341, 1, 1, 1, 1, 1,
0.1200649, 1.426691, -0.7849534, 1, 1, 1, 1, 1,
0.1265953, 0.7442868, -0.1102576, 1, 1, 1, 1, 1,
0.12842, 0.6240975, -0.7371657, 1, 1, 1, 1, 1,
0.1346186, -0.3496233, 0.3776468, 1, 1, 1, 1, 1,
0.1379955, 0.9555576, 1.267142, 1, 1, 1, 1, 1,
0.1393678, 0.1860449, 0.4292903, 0, 0, 1, 1, 1,
0.1426939, -0.10968, 2.589545, 1, 0, 0, 1, 1,
0.1442964, -0.7650384, 3.022382, 1, 0, 0, 1, 1,
0.1446749, -0.3744619, 2.508097, 1, 0, 0, 1, 1,
0.1469744, -1.234027, 3.362117, 1, 0, 0, 1, 1,
0.1470423, 0.4936054, 0.09193926, 1, 0, 0, 1, 1,
0.1475983, 0.2435095, 0.5101405, 0, 0, 0, 1, 1,
0.1479063, -0.5078828, 1.943691, 0, 0, 0, 1, 1,
0.1494377, -0.7304078, 2.956434, 0, 0, 0, 1, 1,
0.157998, -0.04452958, 0.9041787, 0, 0, 0, 1, 1,
0.1587424, -1.147662, 0.8171162, 0, 0, 0, 1, 1,
0.1591516, 0.2625099, 0.4904104, 0, 0, 0, 1, 1,
0.1652016, 2.471093, -1.857703, 0, 0, 0, 1, 1,
0.1669814, -1.140071, 4.62594, 1, 1, 1, 1, 1,
0.1736141, 0.04433011, 1.298591, 1, 1, 1, 1, 1,
0.1744948, 0.3666395, 0.5065362, 1, 1, 1, 1, 1,
0.1773553, 0.7854023, -0.2392703, 1, 1, 1, 1, 1,
0.1788717, -1.243561, 2.442517, 1, 1, 1, 1, 1,
0.1791145, -0.03968252, 1.645226, 1, 1, 1, 1, 1,
0.1807512, -0.06281567, 3.053238, 1, 1, 1, 1, 1,
0.1817733, 0.2761322, 1.55059, 1, 1, 1, 1, 1,
0.1819976, 1.828061, -0.2043372, 1, 1, 1, 1, 1,
0.183851, -0.9987726, 2.106892, 1, 1, 1, 1, 1,
0.1856711, 1.633146, 1.734571, 1, 1, 1, 1, 1,
0.188685, 1.021532, -1.931299, 1, 1, 1, 1, 1,
0.1915426, -1.144011, 2.608328, 1, 1, 1, 1, 1,
0.1966189, -0.2142335, 3.707774, 1, 1, 1, 1, 1,
0.1987302, -0.6090716, 2.720799, 1, 1, 1, 1, 1,
0.201718, 1.54203, 1.215924, 0, 0, 1, 1, 1,
0.2025013, -0.5549423, 0.9369183, 1, 0, 0, 1, 1,
0.2038234, -0.3592036, 2.138122, 1, 0, 0, 1, 1,
0.2040867, 0.4612086, 0.4932629, 1, 0, 0, 1, 1,
0.2100629, -0.3940245, 2.828813, 1, 0, 0, 1, 1,
0.2140751, -0.8719637, 2.348708, 1, 0, 0, 1, 1,
0.2154985, -0.6738005, 4.884655, 0, 0, 0, 1, 1,
0.2155327, 0.01564312, 1.780987, 0, 0, 0, 1, 1,
0.2180259, 1.210889, -0.6842676, 0, 0, 0, 1, 1,
0.2182973, -1.131309, 0.2034051, 0, 0, 0, 1, 1,
0.2197692, 0.2289213, 1.149171, 0, 0, 0, 1, 1,
0.2220576, -0.09935036, 0.2138488, 0, 0, 0, 1, 1,
0.2275443, 1.040363, -0.8353516, 0, 0, 0, 1, 1,
0.2301797, 0.9209999, -0.5954154, 1, 1, 1, 1, 1,
0.2305149, 0.1775039, 2.98718, 1, 1, 1, 1, 1,
0.2312587, 0.4662765, 0.4251969, 1, 1, 1, 1, 1,
0.231415, 0.7614117, 0.9003932, 1, 1, 1, 1, 1,
0.2351104, 0.5480127, 0.9601591, 1, 1, 1, 1, 1,
0.2385206, 0.2177956, 2.636013, 1, 1, 1, 1, 1,
0.2406144, 0.09357064, 1.399314, 1, 1, 1, 1, 1,
0.2422214, -0.2676141, -0.8921826, 1, 1, 1, 1, 1,
0.245621, -0.8172974, 2.169449, 1, 1, 1, 1, 1,
0.2466487, -0.4879522, 4.245307, 1, 1, 1, 1, 1,
0.2515718, 0.03361024, 1.619294, 1, 1, 1, 1, 1,
0.256289, 1.116137, -0.03644585, 1, 1, 1, 1, 1,
0.257965, -1.759707, 2.469532, 1, 1, 1, 1, 1,
0.2622284, 0.4021503, -0.4930858, 1, 1, 1, 1, 1,
0.2660913, 1.719021, -1.104118, 1, 1, 1, 1, 1,
0.2674335, 0.3919539, -0.8182939, 0, 0, 1, 1, 1,
0.2675652, -0.07103061, 1.112764, 1, 0, 0, 1, 1,
0.2687835, -1.021673, 1.010256, 1, 0, 0, 1, 1,
0.2690122, 1.864777, 0.7413892, 1, 0, 0, 1, 1,
0.2691455, 0.7970811, 0.1472794, 1, 0, 0, 1, 1,
0.2695691, -0.4426398, 2.221265, 1, 0, 0, 1, 1,
0.2731945, -0.7445868, 3.290371, 0, 0, 0, 1, 1,
0.2746207, 1.258414, 1.200508, 0, 0, 0, 1, 1,
0.2757662, -0.001720227, 0.4763379, 0, 0, 0, 1, 1,
0.2772507, 0.1969396, -0.1289354, 0, 0, 0, 1, 1,
0.2807814, 1.732528, -0.7155553, 0, 0, 0, 1, 1,
0.2823748, 0.7073172, 0.3168176, 0, 0, 0, 1, 1,
0.2830838, 1.2714, -0.1770335, 0, 0, 0, 1, 1,
0.285231, -0.3242934, 2.045217, 1, 1, 1, 1, 1,
0.2863787, 1.132109, 1.465647, 1, 1, 1, 1, 1,
0.2890145, -0.9444566, 2.75952, 1, 1, 1, 1, 1,
0.2892846, -0.1377981, 2.002748, 1, 1, 1, 1, 1,
0.292193, -0.4153695, 1.575241, 1, 1, 1, 1, 1,
0.2971354, 1.105143, 0.3318685, 1, 1, 1, 1, 1,
0.298678, -1.865169, 2.153342, 1, 1, 1, 1, 1,
0.3079808, -0.8699953, 2.647116, 1, 1, 1, 1, 1,
0.309772, -0.2881681, 4.757612, 1, 1, 1, 1, 1,
0.3119939, -0.6905885, 4.693692, 1, 1, 1, 1, 1,
0.3121957, -0.5557849, 1.745419, 1, 1, 1, 1, 1,
0.3148876, 1.694716, 2.156999, 1, 1, 1, 1, 1,
0.3171328, -0.08122748, 1.572345, 1, 1, 1, 1, 1,
0.3268184, 0.1976543, 0.9869077, 1, 1, 1, 1, 1,
0.3275828, 1.602838, -1.505568, 1, 1, 1, 1, 1,
0.3282262, 1.141392, 0.02904225, 0, 0, 1, 1, 1,
0.3321914, -0.7010267, 2.855071, 1, 0, 0, 1, 1,
0.3327209, 3.875036, 0.1349767, 1, 0, 0, 1, 1,
0.3336521, 0.1283779, -0.4083621, 1, 0, 0, 1, 1,
0.33441, -0.8758971, 3.089824, 1, 0, 0, 1, 1,
0.3401916, 0.5828366, 0.4055276, 1, 0, 0, 1, 1,
0.3450334, 1.462648, -1.671417, 0, 0, 0, 1, 1,
0.3492517, 0.5302386, -0.6605552, 0, 0, 0, 1, 1,
0.3528527, -1.568778, 3.684403, 0, 0, 0, 1, 1,
0.3546592, -0.07187372, 2.42959, 0, 0, 0, 1, 1,
0.3569992, -0.9903012, 2.01608, 0, 0, 0, 1, 1,
0.3605755, -1.958016, 1.357445, 0, 0, 0, 1, 1,
0.3606852, 2.611382, -0.6334246, 0, 0, 0, 1, 1,
0.36313, 1.078107, 1.273438, 1, 1, 1, 1, 1,
0.3640864, 1.224056, 0.0754106, 1, 1, 1, 1, 1,
0.3652791, -0.452748, 1.838263, 1, 1, 1, 1, 1,
0.3657466, -0.1620695, 2.253311, 1, 1, 1, 1, 1,
0.3685078, 0.6984339, 0.4771179, 1, 1, 1, 1, 1,
0.3779909, -1.25356, 4.439533, 1, 1, 1, 1, 1,
0.3801324, -0.5921551, 2.276342, 1, 1, 1, 1, 1,
0.3832427, 1.019967, 1.114173, 1, 1, 1, 1, 1,
0.3868861, 2.021183, 1.830346, 1, 1, 1, 1, 1,
0.3872454, 0.1569997, 2.096516, 1, 1, 1, 1, 1,
0.3895452, -0.4566959, 4.766759, 1, 1, 1, 1, 1,
0.3918684, 2.050379, 0.9447262, 1, 1, 1, 1, 1,
0.3922946, 0.3339356, 1.592402, 1, 1, 1, 1, 1,
0.3986151, -0.06622443, 0.9264117, 1, 1, 1, 1, 1,
0.3997099, -1.083007, 3.500334, 1, 1, 1, 1, 1,
0.401857, 0.02913571, 1.08563, 0, 0, 1, 1, 1,
0.4174808, -0.705243, 2.570652, 1, 0, 0, 1, 1,
0.417846, 0.1230248, 0.8385133, 1, 0, 0, 1, 1,
0.4218241, -0.5359289, 2.877897, 1, 0, 0, 1, 1,
0.4220104, 1.258071, -0.2000966, 1, 0, 0, 1, 1,
0.4311833, -0.8450696, 1.584537, 1, 0, 0, 1, 1,
0.4316594, 0.8734941, 0.5765693, 0, 0, 0, 1, 1,
0.4352813, 0.8562703, 0.4966163, 0, 0, 0, 1, 1,
0.435453, -1.283866, 3.907994, 0, 0, 0, 1, 1,
0.4356516, 0.546895, -0.4811331, 0, 0, 0, 1, 1,
0.4408619, 0.3784754, 1.716482, 0, 0, 0, 1, 1,
0.4465238, -0.2990097, 3.688438, 0, 0, 0, 1, 1,
0.4484471, -1.358242, 2.245883, 0, 0, 0, 1, 1,
0.4506613, 1.148091, -0.3244292, 1, 1, 1, 1, 1,
0.4583016, 0.2940574, 1.978825, 1, 1, 1, 1, 1,
0.4586443, -0.6162972, 1.230474, 1, 1, 1, 1, 1,
0.4618947, 0.5973326, 0.9880345, 1, 1, 1, 1, 1,
0.4626002, 0.6445619, 1.440496, 1, 1, 1, 1, 1,
0.4660039, -1.000656, 1.347461, 1, 1, 1, 1, 1,
0.4714987, 1.315086, 0.7759803, 1, 1, 1, 1, 1,
0.475099, 0.3709056, 0.9624886, 1, 1, 1, 1, 1,
0.4782856, -1.691843, 3.221893, 1, 1, 1, 1, 1,
0.4785632, -0.4875663, 2.131424, 1, 1, 1, 1, 1,
0.4788267, -0.4505587, 2.153817, 1, 1, 1, 1, 1,
0.4793484, -0.6822446, 1.792923, 1, 1, 1, 1, 1,
0.4812021, -0.0376679, 2.087837, 1, 1, 1, 1, 1,
0.4823568, -0.7238035, 2.543363, 1, 1, 1, 1, 1,
0.4841436, -1.294171, 3.502011, 1, 1, 1, 1, 1,
0.4876216, 1.281874, -0.01149705, 0, 0, 1, 1, 1,
0.4892513, -0.006315425, 2.010296, 1, 0, 0, 1, 1,
0.4904017, -1.262924, 3.055712, 1, 0, 0, 1, 1,
0.4956154, 0.3555441, 0.6678246, 1, 0, 0, 1, 1,
0.4982848, 0.6861074, -1.504204, 1, 0, 0, 1, 1,
0.4986792, -0.9178824, 4.375592, 1, 0, 0, 1, 1,
0.4993009, 0.6394023, 1.138005, 0, 0, 0, 1, 1,
0.5035729, 0.06683248, 2.140682, 0, 0, 0, 1, 1,
0.5059538, -0.1621221, 2.278016, 0, 0, 0, 1, 1,
0.5061763, 0.1057186, 1.905486, 0, 0, 0, 1, 1,
0.511573, 1.333842, -1.412609, 0, 0, 0, 1, 1,
0.5132949, 0.8498554, 2.58497, 0, 0, 0, 1, 1,
0.5138839, 0.5625969, 0.4816802, 0, 0, 0, 1, 1,
0.5224008, 2.470256, 0.6898927, 1, 1, 1, 1, 1,
0.5237519, 1.412365, 0.465685, 1, 1, 1, 1, 1,
0.5249335, -1.118531, 4.205787, 1, 1, 1, 1, 1,
0.5322882, 0.3494416, 0.380838, 1, 1, 1, 1, 1,
0.5336984, 2.465728, 0.1473316, 1, 1, 1, 1, 1,
0.534371, -0.1286775, 1.766908, 1, 1, 1, 1, 1,
0.5385555, 0.8744398, 2.412501, 1, 1, 1, 1, 1,
0.5413296, 0.5762171, 0.2167528, 1, 1, 1, 1, 1,
0.5466334, -0.8119519, 3.09591, 1, 1, 1, 1, 1,
0.555557, -1.140671, 3.283307, 1, 1, 1, 1, 1,
0.5570807, -0.1883159, 1.963151, 1, 1, 1, 1, 1,
0.5657862, -0.7672322, 1.863932, 1, 1, 1, 1, 1,
0.5672926, 0.9179068, 1.883776, 1, 1, 1, 1, 1,
0.5688731, 1.178257, 1.670418, 1, 1, 1, 1, 1,
0.5706398, 0.360669, 1.824335, 1, 1, 1, 1, 1,
0.5715271, 1.755191, 0.1665805, 0, 0, 1, 1, 1,
0.5752581, 0.4565774, 1.659804, 1, 0, 0, 1, 1,
0.5760695, 0.5286762, 0.9353498, 1, 0, 0, 1, 1,
0.5781907, 0.9371998, -0.9053413, 1, 0, 0, 1, 1,
0.5835215, -0.03918278, 1.745099, 1, 0, 0, 1, 1,
0.5864041, 1.26618, -1.323515, 1, 0, 0, 1, 1,
0.5895372, -0.2482312, 1.704712, 0, 0, 0, 1, 1,
0.5897745, 0.8221725, 0.2378481, 0, 0, 0, 1, 1,
0.5921519, -0.5754482, 2.298275, 0, 0, 0, 1, 1,
0.5949451, 1.486575, 0.3163663, 0, 0, 0, 1, 1,
0.5969944, 1.336362, 3.335068, 0, 0, 0, 1, 1,
0.5976187, 0.1101803, 0.3184246, 0, 0, 0, 1, 1,
0.6038672, -0.7237173, 2.955781, 0, 0, 0, 1, 1,
0.615387, 0.7342324, -0.9800994, 1, 1, 1, 1, 1,
0.619533, 1.164589, 1.652596, 1, 1, 1, 1, 1,
0.6249757, 1.547023, 0.1848093, 1, 1, 1, 1, 1,
0.6270995, 0.600643, 1.503714, 1, 1, 1, 1, 1,
0.6294129, 0.7538651, 0.1437645, 1, 1, 1, 1, 1,
0.6327979, 0.4364882, 2.299662, 1, 1, 1, 1, 1,
0.6374745, -1.563205, 4.495341, 1, 1, 1, 1, 1,
0.639884, 0.893329, -0.5323445, 1, 1, 1, 1, 1,
0.6492215, -1.237633, 2.334832, 1, 1, 1, 1, 1,
0.6503694, 1.751534, 0.7089914, 1, 1, 1, 1, 1,
0.6523123, 0.3354484, 0.3364216, 1, 1, 1, 1, 1,
0.656676, 0.5347311, 1.601098, 1, 1, 1, 1, 1,
0.6568077, -0.120007, 3.153662, 1, 1, 1, 1, 1,
0.6590722, 1.02813, 0.271826, 1, 1, 1, 1, 1,
0.6590762, 0.9723894, 0.6101079, 1, 1, 1, 1, 1,
0.6601451, 0.2119004, 0.4732798, 0, 0, 1, 1, 1,
0.661996, 1.520683, 0.5518432, 1, 0, 0, 1, 1,
0.664243, -0.1785714, 3.897122, 1, 0, 0, 1, 1,
0.6667849, 0.7349167, 0.5114371, 1, 0, 0, 1, 1,
0.6699442, -0.3893225, 2.006718, 1, 0, 0, 1, 1,
0.6705474, 0.2481539, 2.548258, 1, 0, 0, 1, 1,
0.6719788, -0.5229145, 2.397723, 0, 0, 0, 1, 1,
0.6753656, 0.1322928, 2.696838, 0, 0, 0, 1, 1,
0.677458, 0.9119716, 0.004981411, 0, 0, 0, 1, 1,
0.6777939, 0.0426763, 4.084235, 0, 0, 0, 1, 1,
0.6814201, 1.496302, 1.499526, 0, 0, 0, 1, 1,
0.6892841, 1.080191, 1.275606, 0, 0, 0, 1, 1,
0.6939288, 0.636532, 0.2744376, 0, 0, 0, 1, 1,
0.7004408, 1.115203, 0.710735, 1, 1, 1, 1, 1,
0.7011554, 2.12237, -0.3381085, 1, 1, 1, 1, 1,
0.7030326, 0.6241778, 2.232031, 1, 1, 1, 1, 1,
0.705382, 0.8240053, 0.8180633, 1, 1, 1, 1, 1,
0.7070509, 0.5883612, 0.4729965, 1, 1, 1, 1, 1,
0.7175865, -0.08087566, 2.162166, 1, 1, 1, 1, 1,
0.7314219, 1.313113, 1.494816, 1, 1, 1, 1, 1,
0.732102, 0.6734768, 1.231362, 1, 1, 1, 1, 1,
0.7389192, 1.838116, -0.9123617, 1, 1, 1, 1, 1,
0.7429503, 0.02138693, 1.946415, 1, 1, 1, 1, 1,
0.7429844, -0.3062826, 1.551519, 1, 1, 1, 1, 1,
0.7453328, 0.03204946, 0.8635672, 1, 1, 1, 1, 1,
0.7514405, 0.7642308, 1.858083, 1, 1, 1, 1, 1,
0.7542305, 2.115493, 0.911744, 1, 1, 1, 1, 1,
0.7633469, 0.9486012, 1.131436, 1, 1, 1, 1, 1,
0.7651267, -0.2047759, 1.805964, 0, 0, 1, 1, 1,
0.7719082, -0.2472858, 1.20486, 1, 0, 0, 1, 1,
0.7737033, 0.3155936, 1.234209, 1, 0, 0, 1, 1,
0.7742667, -0.2062616, 1.09532, 1, 0, 0, 1, 1,
0.7800948, 0.0005494913, 2.100865, 1, 0, 0, 1, 1,
0.7846735, 2.703139, -0.7605792, 1, 0, 0, 1, 1,
0.7878354, -0.9262413, 4.611185, 0, 0, 0, 1, 1,
0.7916121, -3.218048, 1.709078, 0, 0, 0, 1, 1,
0.7926088, 1.940069, 1.630973, 0, 0, 0, 1, 1,
0.7975382, 0.6127836, 2.09257, 0, 0, 0, 1, 1,
0.7992214, -0.09411809, 2.389987, 0, 0, 0, 1, 1,
0.7998822, 0.277071, 1.980989, 0, 0, 0, 1, 1,
0.8134972, -0.2705792, 0.5585169, 0, 0, 0, 1, 1,
0.813682, -0.4345169, 4.127778, 1, 1, 1, 1, 1,
0.8159807, 1.104123, 1.644491, 1, 1, 1, 1, 1,
0.8202313, 0.5089517, 1.565125, 1, 1, 1, 1, 1,
0.8203645, 0.5354197, -0.1555726, 1, 1, 1, 1, 1,
0.8260686, 0.5327926, 3.065922, 1, 1, 1, 1, 1,
0.8260958, 0.1869181, 1.58046, 1, 1, 1, 1, 1,
0.8316472, 0.5032916, 2.091499, 1, 1, 1, 1, 1,
0.8343682, 1.511211, -1.215295, 1, 1, 1, 1, 1,
0.8350887, 0.4170986, 0.7845293, 1, 1, 1, 1, 1,
0.8394372, 0.2332334, 1.479791, 1, 1, 1, 1, 1,
0.8395509, 0.1634263, 0.7000481, 1, 1, 1, 1, 1,
0.841578, 0.5453131, 0.741214, 1, 1, 1, 1, 1,
0.8438514, 0.4581414, 2.012654, 1, 1, 1, 1, 1,
0.8493035, 0.5075577, -0.1026093, 1, 1, 1, 1, 1,
0.8521847, -0.02912255, 1.659224, 1, 1, 1, 1, 1,
0.8537875, -1.478747, 4.058528, 0, 0, 1, 1, 1,
0.8552027, 0.8190399, 0.04703634, 1, 0, 0, 1, 1,
0.8676703, 1.842261, -1.123428, 1, 0, 0, 1, 1,
0.8731802, 0.9956849, 0.306876, 1, 0, 0, 1, 1,
0.8790614, 0.4505924, 1.773353, 1, 0, 0, 1, 1,
0.887103, 1.093728, 1.540586, 1, 0, 0, 1, 1,
0.8895628, 1.034601, 0.9711614, 0, 0, 0, 1, 1,
0.9006577, -0.505588, 2.208622, 0, 0, 0, 1, 1,
0.9007343, 0.05812586, 1.698323, 0, 0, 0, 1, 1,
0.9023756, 0.3817743, -0.1519997, 0, 0, 0, 1, 1,
0.9158919, 0.03967033, 0.6530681, 0, 0, 0, 1, 1,
0.9224275, 1.615155, 0.8919051, 0, 0, 0, 1, 1,
0.924804, 0.8826174, -0.7060886, 0, 0, 0, 1, 1,
0.9329362, -1.313408, 3.153647, 1, 1, 1, 1, 1,
0.9347182, 0.1960953, 1.443539, 1, 1, 1, 1, 1,
0.9351755, -0.009937445, 2.930248, 1, 1, 1, 1, 1,
0.9470724, 0.09008197, 1.688094, 1, 1, 1, 1, 1,
0.9472622, 0.4744501, 1.634399, 1, 1, 1, 1, 1,
0.9499518, 0.2093363, 1.115712, 1, 1, 1, 1, 1,
0.9513509, -0.07989187, 2.377307, 1, 1, 1, 1, 1,
0.9520577, 1.152404, 0.7446213, 1, 1, 1, 1, 1,
0.9573593, -1.865969, 2.034333, 1, 1, 1, 1, 1,
0.9639611, -2.567187, 2.76417, 1, 1, 1, 1, 1,
0.9642307, 0.9150268, 1.655415, 1, 1, 1, 1, 1,
0.9659253, 1.534441, -0.06994068, 1, 1, 1, 1, 1,
0.9683521, 0.107548, -0.7864501, 1, 1, 1, 1, 1,
0.9892101, 1.214077, 1.106557, 1, 1, 1, 1, 1,
0.9911222, -0.8077826, 0.3743457, 1, 1, 1, 1, 1,
0.9915961, 1.106269, 0.4130681, 0, 0, 1, 1, 1,
0.9938254, -0.3987288, 0.9798136, 1, 0, 0, 1, 1,
0.994775, -1.309083, 2.945602, 1, 0, 0, 1, 1,
0.995329, -0.1943128, 3.104051, 1, 0, 0, 1, 1,
0.9974819, 1.341191, 1.399582, 1, 0, 0, 1, 1,
0.999985, -0.06754382, 1.405495, 1, 0, 0, 1, 1,
1.000187, 0.7109835, 0.5565058, 0, 0, 0, 1, 1,
1.008918, -2.154441, 2.103225, 0, 0, 0, 1, 1,
1.026382, -0.5237511, 1.153728, 0, 0, 0, 1, 1,
1.027462, -0.7996823, 3.39396, 0, 0, 0, 1, 1,
1.028403, 1.377781, 0.388195, 0, 0, 0, 1, 1,
1.039862, -0.270207, 1.061783, 0, 0, 0, 1, 1,
1.042924, 1.39468, -0.002235649, 0, 0, 0, 1, 1,
1.045437, -1.514782, 1.354504, 1, 1, 1, 1, 1,
1.048287, 0.5537714, -1.241874, 1, 1, 1, 1, 1,
1.048731, 0.1809315, 1.246418, 1, 1, 1, 1, 1,
1.048951, 0.6515188, 2.278808, 1, 1, 1, 1, 1,
1.049166, -1.775942, 3.634297, 1, 1, 1, 1, 1,
1.053114, -1.109318, 0.2905071, 1, 1, 1, 1, 1,
1.055295, -1.60273, 0.573446, 1, 1, 1, 1, 1,
1.059207, 0.2973986, 1.038596, 1, 1, 1, 1, 1,
1.067447, 0.466548, 2.128011, 1, 1, 1, 1, 1,
1.067671, 1.716832, 0.801008, 1, 1, 1, 1, 1,
1.071416, -2.324272, 2.976523, 1, 1, 1, 1, 1,
1.075565, 0.09364265, 1.603902, 1, 1, 1, 1, 1,
1.076444, -1.178077, 3.0879, 1, 1, 1, 1, 1,
1.08245, 0.8512832, -1.234208, 1, 1, 1, 1, 1,
1.083503, 0.6251834, 2.433538, 1, 1, 1, 1, 1,
1.085748, -0.09353181, 2.390227, 0, 0, 1, 1, 1,
1.087342, -0.1824212, 1.746434, 1, 0, 0, 1, 1,
1.099824, -1.721887, 3.096923, 1, 0, 0, 1, 1,
1.101199, 0.5303925, 2.110427, 1, 0, 0, 1, 1,
1.103077, -0.6811145, 0.676179, 1, 0, 0, 1, 1,
1.108041, -1.293647, 0.8677264, 1, 0, 0, 1, 1,
1.1223, 1.382023, 0.136081, 0, 0, 0, 1, 1,
1.122687, 0.9247605, 0.6097419, 0, 0, 0, 1, 1,
1.123087, 1.17136, 0.7880707, 0, 0, 0, 1, 1,
1.125355, 0.4873988, 1.31541, 0, 0, 0, 1, 1,
1.132644, 1.796688, 0.03670613, 0, 0, 0, 1, 1,
1.13429, -1.122371, 2.032877, 0, 0, 0, 1, 1,
1.13456, -0.41596, 2.989833, 0, 0, 0, 1, 1,
1.139824, 1.367427, 0.2913621, 1, 1, 1, 1, 1,
1.151069, 1.683477, 0.7018607, 1, 1, 1, 1, 1,
1.156269, 0.1965475, 1.070125, 1, 1, 1, 1, 1,
1.162138, -0.1504728, 1.772224, 1, 1, 1, 1, 1,
1.167735, -0.5058798, 0.9834328, 1, 1, 1, 1, 1,
1.174436, -0.2175871, 0.4605031, 1, 1, 1, 1, 1,
1.175164, 0.3929098, 1.188224, 1, 1, 1, 1, 1,
1.203168, 0.4043007, 1.101061, 1, 1, 1, 1, 1,
1.2053, -0.3473375, 1.168468, 1, 1, 1, 1, 1,
1.206831, 1.767481, 1.749205, 1, 1, 1, 1, 1,
1.221122, -0.7823244, 1.901834, 1, 1, 1, 1, 1,
1.237975, -0.4157171, -0.1632215, 1, 1, 1, 1, 1,
1.239293, 0.3486907, 0.8757932, 1, 1, 1, 1, 1,
1.242017, 1.58357, 0.4330119, 1, 1, 1, 1, 1,
1.245983, 1.104118, 1.072967, 1, 1, 1, 1, 1,
1.253436, -0.7992758, 2.455845, 0, 0, 1, 1, 1,
1.26778, -0.4249722, 2.965064, 1, 0, 0, 1, 1,
1.268448, -0.8693396, 2.501635, 1, 0, 0, 1, 1,
1.275866, 1.479564, 0.6949872, 1, 0, 0, 1, 1,
1.276899, 0.477224, 3.130029, 1, 0, 0, 1, 1,
1.279633, -2.001558, 2.703135, 1, 0, 0, 1, 1,
1.282993, -2.644042, 3.556205, 0, 0, 0, 1, 1,
1.285296, -0.9880289, 2.245081, 0, 0, 0, 1, 1,
1.294921, 0.128677, 0.9641295, 0, 0, 0, 1, 1,
1.295936, -0.3135767, 1.811858, 0, 0, 0, 1, 1,
1.307696, 0.712098, 0.7727144, 0, 0, 0, 1, 1,
1.314035, -1.970827, 1.566909, 0, 0, 0, 1, 1,
1.326317, -0.08498633, 0.3159233, 0, 0, 0, 1, 1,
1.343557, -0.7142615, 2.353282, 1, 1, 1, 1, 1,
1.352234, -0.4599028, 1.717119, 1, 1, 1, 1, 1,
1.371905, 0.5647103, 1.761868, 1, 1, 1, 1, 1,
1.373315, -0.2188539, 2.507242, 1, 1, 1, 1, 1,
1.375242, -0.8987323, 0.8940095, 1, 1, 1, 1, 1,
1.381513, -0.6019285, 1.807184, 1, 1, 1, 1, 1,
1.387876, 2.562981, 1.130193, 1, 1, 1, 1, 1,
1.38974, 0.2170215, 2.71576, 1, 1, 1, 1, 1,
1.404654, 0.6670672, 0.7606803, 1, 1, 1, 1, 1,
1.411492, -1.256827, 1.919556, 1, 1, 1, 1, 1,
1.414009, 0.3297044, 0.05964555, 1, 1, 1, 1, 1,
1.421148, -0.8563382, 0.6165681, 1, 1, 1, 1, 1,
1.42836, 1.1242, 3.66413, 1, 1, 1, 1, 1,
1.42926, 0.3249338, 0.221127, 1, 1, 1, 1, 1,
1.443844, 3.122223, 0.8373728, 1, 1, 1, 1, 1,
1.447063, 1.949167, -0.05706392, 0, 0, 1, 1, 1,
1.449117, -0.2262413, 1.871317, 1, 0, 0, 1, 1,
1.449515, -0.8551842, 1.468568, 1, 0, 0, 1, 1,
1.452288, 1.952446, -0.6227718, 1, 0, 0, 1, 1,
1.459515, 1.558067, 0.9283949, 1, 0, 0, 1, 1,
1.468059, -0.8949687, 2.538454, 1, 0, 0, 1, 1,
1.47256, -0.4162473, 2.957133, 0, 0, 0, 1, 1,
1.475097, -1.062789, 2.707658, 0, 0, 0, 1, 1,
1.488341, 1.323627, -1.922361, 0, 0, 0, 1, 1,
1.502545, 0.9937012, 0.1998452, 0, 0, 0, 1, 1,
1.529775, 1.71064, -0.0851373, 0, 0, 0, 1, 1,
1.548336, -0.6039276, 2.051732, 0, 0, 0, 1, 1,
1.553531, 0.5786397, 1.915263, 0, 0, 0, 1, 1,
1.566627, -1.512296, 0.2638379, 1, 1, 1, 1, 1,
1.573465, -0.9681497, 3.55942, 1, 1, 1, 1, 1,
1.583001, 0.07566398, 1.6774, 1, 1, 1, 1, 1,
1.588983, -1.050584, 3.105083, 1, 1, 1, 1, 1,
1.593202, 0.1077018, 0.813792, 1, 1, 1, 1, 1,
1.596676, -0.1264576, 2.738233, 1, 1, 1, 1, 1,
1.607788, -0.1532034, 2.42177, 1, 1, 1, 1, 1,
1.610528, -0.9628441, 0.6978189, 1, 1, 1, 1, 1,
1.615743, -0.5025198, 3.572885, 1, 1, 1, 1, 1,
1.617996, -0.499304, 1.195034, 1, 1, 1, 1, 1,
1.621151, 1.245365, 0.4006431, 1, 1, 1, 1, 1,
1.621549, -0.2498088, 2.72504, 1, 1, 1, 1, 1,
1.622923, 0.08056841, 1.653957, 1, 1, 1, 1, 1,
1.624124, -1.236302, 2.19187, 1, 1, 1, 1, 1,
1.63388, -1.284338, 2.345399, 1, 1, 1, 1, 1,
1.634906, 0.1781955, 1.395303, 0, 0, 1, 1, 1,
1.639715, -1.299173, 2.921547, 1, 0, 0, 1, 1,
1.65946, -0.2488031, 2.121815, 1, 0, 0, 1, 1,
1.678197, 0.1328999, 2.210434, 1, 0, 0, 1, 1,
1.679648, 0.4291152, 2.064825, 1, 0, 0, 1, 1,
1.687904, 0.03776885, 2.274679, 1, 0, 0, 1, 1,
1.699182, -0.7263936, 1.191126, 0, 0, 0, 1, 1,
1.722558, -1.618803, 2.300539, 0, 0, 0, 1, 1,
1.723011, -1.681184, 2.986546, 0, 0, 0, 1, 1,
1.728126, 2.626318, 0.1828388, 0, 0, 0, 1, 1,
1.749453, -1.722237, 2.287864, 0, 0, 0, 1, 1,
1.757553, -0.5686941, 1.680955, 0, 0, 0, 1, 1,
1.775199, 0.6466434, 0.2778235, 0, 0, 0, 1, 1,
1.787864, 1.221595, 2.142913, 1, 1, 1, 1, 1,
1.791597, 0.2364929, 2.613219, 1, 1, 1, 1, 1,
1.84934, 1.95699, -0.3952967, 1, 1, 1, 1, 1,
1.851271, -0.4902495, -0.609358, 1, 1, 1, 1, 1,
1.867515, 1.275677, 1.57106, 1, 1, 1, 1, 1,
1.893365, 1.416473, 1.688391, 1, 1, 1, 1, 1,
1.901685, -0.4661818, 2.615021, 1, 1, 1, 1, 1,
1.947978, 1.940933, 0.6355387, 1, 1, 1, 1, 1,
1.952014, 0.6688344, 1.457851, 1, 1, 1, 1, 1,
1.954688, -1.639012, 3.866032, 1, 1, 1, 1, 1,
1.956389, 0.175188, 0.7534797, 1, 1, 1, 1, 1,
1.970211, -0.261151, 2.447052, 1, 1, 1, 1, 1,
1.979521, 1.844207, 0.9793956, 1, 1, 1, 1, 1,
2.008703, -0.3664208, 1.683937, 1, 1, 1, 1, 1,
2.031638, -1.182259, 1.094625, 1, 1, 1, 1, 1,
2.077385, -1.594326, 4.005999, 0, 0, 1, 1, 1,
2.078521, -1.605935, 1.948258, 1, 0, 0, 1, 1,
2.081982, 0.3166471, 1.14253, 1, 0, 0, 1, 1,
2.108784, 0.5770271, 1.92096, 1, 0, 0, 1, 1,
2.130111, -0.1410827, 2.147761, 1, 0, 0, 1, 1,
2.142055, -0.1773542, 1.468302, 1, 0, 0, 1, 1,
2.150018, 1.087828, -0.3965386, 0, 0, 0, 1, 1,
2.200071, -0.5559842, 1.127556, 0, 0, 0, 1, 1,
2.259839, -0.3816879, 3.157316, 0, 0, 0, 1, 1,
2.308102, 1.286132, 2.371854, 0, 0, 0, 1, 1,
2.327157, 0.5774474, 1.153555, 0, 0, 0, 1, 1,
2.483851, -0.9129273, 3.891474, 0, 0, 0, 1, 1,
2.531311, -1.142129, 1.560685, 0, 0, 0, 1, 1,
2.587198, -0.7768236, 1.918977, 1, 1, 1, 1, 1,
2.618125, 1.717722, 1.065557, 1, 1, 1, 1, 1,
2.622922, 0.08464085, 0.896577, 1, 1, 1, 1, 1,
2.647919, 1.08124, 0.08455827, 1, 1, 1, 1, 1,
2.720513, -0.3524681, 0.463734, 1, 1, 1, 1, 1,
3.175966, 0.2019602, 2.213742, 1, 1, 1, 1, 1,
3.531705, -1.676764, 0.8175414, 1, 1, 1, 1, 1
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
var radius = 9.556115;
var distance = 33.56545;
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
mvMatrix.translate( -0.3009697, -0.3284938, 0.1899114 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56545);
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
