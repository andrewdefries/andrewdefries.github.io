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
-3.01059, -0.6928993, -1.919273, 1, 0, 0, 1,
-2.571279, -1.597325, -1.72159, 1, 0.007843138, 0, 1,
-2.434557, -1.113888, -2.444776, 1, 0.01176471, 0, 1,
-2.388053, 0.05731609, -0.933964, 1, 0.01960784, 0, 1,
-2.306222, -0.9136512, -2.159987, 1, 0.02352941, 0, 1,
-2.30048, 0.7771019, -2.925655, 1, 0.03137255, 0, 1,
-2.296077, 0.01670424, -2.684076, 1, 0.03529412, 0, 1,
-2.259578, 0.4009219, -2.416301, 1, 0.04313726, 0, 1,
-2.187382, -2.661813, -3.771104, 1, 0.04705882, 0, 1,
-2.170278, -0.536085, -1.883099, 1, 0.05490196, 0, 1,
-2.152114, 2.068287, -0.534988, 1, 0.05882353, 0, 1,
-2.139094, 0.1072478, -0.5574733, 1, 0.06666667, 0, 1,
-2.128932, 1.796829, -1.178473, 1, 0.07058824, 0, 1,
-2.11359, 1.017261, -1.416365, 1, 0.07843138, 0, 1,
-2.095781, -0.1871073, -1.1204, 1, 0.08235294, 0, 1,
-2.060333, -1.3147, -2.172456, 1, 0.09019608, 0, 1,
-1.960113, 1.777144, -1.331046, 1, 0.09411765, 0, 1,
-1.947357, -0.4622781, -1.914043, 1, 0.1019608, 0, 1,
-1.905035, 0.5916819, 0.7710778, 1, 0.1098039, 0, 1,
-1.902483, 0.6770085, -0.1325238, 1, 0.1137255, 0, 1,
-1.891672, 1.203786, -0.9877532, 1, 0.1215686, 0, 1,
-1.878495, -0.137605, -3.707283, 1, 0.1254902, 0, 1,
-1.872436, -0.1370911, -1.608238, 1, 0.1333333, 0, 1,
-1.871797, -0.6713584, -1.975975, 1, 0.1372549, 0, 1,
-1.871685, 0.06929141, -1.237507, 1, 0.145098, 0, 1,
-1.864899, 0.08185487, -0.8909754, 1, 0.1490196, 0, 1,
-1.857689, -0.3120065, -1.933132, 1, 0.1568628, 0, 1,
-1.838025, -0.3485222, -1.959528, 1, 0.1607843, 0, 1,
-1.825042, 0.6663194, -0.9610726, 1, 0.1686275, 0, 1,
-1.790157, -1.280123, -2.696232, 1, 0.172549, 0, 1,
-1.76722, 0.3572097, -1.210249, 1, 0.1803922, 0, 1,
-1.752746, -1.064415, 0.3204309, 1, 0.1843137, 0, 1,
-1.7494, -1.897425, -3.857871, 1, 0.1921569, 0, 1,
-1.727511, 0.2154332, -3.186028, 1, 0.1960784, 0, 1,
-1.725891, 1.554819, -0.07786885, 1, 0.2039216, 0, 1,
-1.72306, -0.6645828, 0.1123518, 1, 0.2117647, 0, 1,
-1.722719, 0.238177, -0.2781235, 1, 0.2156863, 0, 1,
-1.713054, 0.05022299, -1.122511, 1, 0.2235294, 0, 1,
-1.709338, 1.819132, -0.4907885, 1, 0.227451, 0, 1,
-1.673881, -1.66577, -0.7709963, 1, 0.2352941, 0, 1,
-1.628939, 1.226523, -2.22709, 1, 0.2392157, 0, 1,
-1.628823, 1.12908, -1.266501, 1, 0.2470588, 0, 1,
-1.620591, 0.2178714, -0.7914783, 1, 0.2509804, 0, 1,
-1.618712, 0.1024111, -1.715964, 1, 0.2588235, 0, 1,
-1.608559, 0.7640933, -2.176206, 1, 0.2627451, 0, 1,
-1.605344, 0.5597661, -1.634761, 1, 0.2705882, 0, 1,
-1.603115, 1.121944, 0.1064829, 1, 0.2745098, 0, 1,
-1.579241, 1.2707, 0.1346357, 1, 0.282353, 0, 1,
-1.561976, -0.07939139, -1.517678, 1, 0.2862745, 0, 1,
-1.53642, 0.3191927, -0.8153026, 1, 0.2941177, 0, 1,
-1.536031, 1.334555, -0.5014871, 1, 0.3019608, 0, 1,
-1.533187, -0.4049501, -1.654094, 1, 0.3058824, 0, 1,
-1.52796, 0.9102092, 0.5523992, 1, 0.3137255, 0, 1,
-1.516525, -0.7195759, -1.123666, 1, 0.3176471, 0, 1,
-1.515818, 0.5695542, -0.8915755, 1, 0.3254902, 0, 1,
-1.513034, 1.124707, -1.181142, 1, 0.3294118, 0, 1,
-1.496948, -1.182851, -2.816749, 1, 0.3372549, 0, 1,
-1.492447, 1.042034, -1.932971, 1, 0.3411765, 0, 1,
-1.490792, -0.1993571, -1.088748, 1, 0.3490196, 0, 1,
-1.484959, 2.1581, -1.811906, 1, 0.3529412, 0, 1,
-1.477004, 0.269685, -1.243751, 1, 0.3607843, 0, 1,
-1.474108, -2.037805, -3.433383, 1, 0.3647059, 0, 1,
-1.462048, 0.2270886, -1.215283, 1, 0.372549, 0, 1,
-1.461583, -0.9769843, -2.341921, 1, 0.3764706, 0, 1,
-1.447841, 0.2025463, -1.547, 1, 0.3843137, 0, 1,
-1.44628, 0.4727207, -1.102064, 1, 0.3882353, 0, 1,
-1.434694, -0.1399747, -1.243834, 1, 0.3960784, 0, 1,
-1.412302, 0.6858013, -2.871384, 1, 0.4039216, 0, 1,
-1.412037, 0.5359307, 0.04346768, 1, 0.4078431, 0, 1,
-1.409789, -1.086022, -3.80583, 1, 0.4156863, 0, 1,
-1.381654, -0.1127524, -2.379624, 1, 0.4196078, 0, 1,
-1.376675, -0.14799, -1.336977, 1, 0.427451, 0, 1,
-1.371725, -0.4219291, -1.926846, 1, 0.4313726, 0, 1,
-1.368926, -1.897408, -2.564672, 1, 0.4392157, 0, 1,
-1.365768, 0.2823648, -1.725571, 1, 0.4431373, 0, 1,
-1.360466, -0.8018849, -2.411391, 1, 0.4509804, 0, 1,
-1.355435, 0.7590612, -0.6782063, 1, 0.454902, 0, 1,
-1.336983, -0.1352876, -1.855602, 1, 0.4627451, 0, 1,
-1.333356, -0.7210442, -1.194648, 1, 0.4666667, 0, 1,
-1.324648, 0.2832531, -3.869078, 1, 0.4745098, 0, 1,
-1.323381, 1.057962, -2.360561, 1, 0.4784314, 0, 1,
-1.317047, -0.4820403, -1.738192, 1, 0.4862745, 0, 1,
-1.315611, -1.182578, -1.840492, 1, 0.4901961, 0, 1,
-1.309696, 0.4103295, -1.920392, 1, 0.4980392, 0, 1,
-1.308431, 1.972818, 0.0020774, 1, 0.5058824, 0, 1,
-1.29691, 2.652799, 0.5098265, 1, 0.509804, 0, 1,
-1.278767, -0.1073873, -1.143795, 1, 0.5176471, 0, 1,
-1.277866, -0.3318509, -3.073315, 1, 0.5215687, 0, 1,
-1.276762, -0.5475874, -4.30716, 1, 0.5294118, 0, 1,
-1.269512, -0.2232248, -3.91807, 1, 0.5333334, 0, 1,
-1.266943, 0.8008543, -0.6421306, 1, 0.5411765, 0, 1,
-1.25253, -0.3685693, -0.711869, 1, 0.5450981, 0, 1,
-1.250539, 0.2346521, -1.476032, 1, 0.5529412, 0, 1,
-1.244445, 0.3220883, 0.7193916, 1, 0.5568628, 0, 1,
-1.226078, 0.6413193, 0.5420415, 1, 0.5647059, 0, 1,
-1.217171, -0.427945, -1.123431, 1, 0.5686275, 0, 1,
-1.216136, -0.9401876, -1.045128, 1, 0.5764706, 0, 1,
-1.213745, 0.4950788, -1.695003, 1, 0.5803922, 0, 1,
-1.209354, -0.3687946, 0.7753134, 1, 0.5882353, 0, 1,
-1.197009, -0.8139446, -4.813134, 1, 0.5921569, 0, 1,
-1.195668, 1.041319, -0.6426385, 1, 0.6, 0, 1,
-1.19072, 1.289706, -0.5978053, 1, 0.6078432, 0, 1,
-1.187537, -0.804002, -1.971385, 1, 0.6117647, 0, 1,
-1.186093, 0.9018827, -0.192219, 1, 0.6196079, 0, 1,
-1.184613, 0.05800238, -3.177601, 1, 0.6235294, 0, 1,
-1.180045, -0.8372268, -2.360159, 1, 0.6313726, 0, 1,
-1.172819, -0.1193655, -0.7252723, 1, 0.6352941, 0, 1,
-1.171743, -0.6252986, -1.73749, 1, 0.6431373, 0, 1,
-1.167855, 0.09432108, -1.914652, 1, 0.6470588, 0, 1,
-1.167606, 0.09395487, -0.1299452, 1, 0.654902, 0, 1,
-1.167252, -0.3805007, -2.792677, 1, 0.6588235, 0, 1,
-1.166656, -0.511586, -3.534188, 1, 0.6666667, 0, 1,
-1.166288, 0.03824034, -1.514915, 1, 0.6705883, 0, 1,
-1.164914, 1.369702, 0.2892064, 1, 0.6784314, 0, 1,
-1.163936, -0.4513349, -2.106173, 1, 0.682353, 0, 1,
-1.161326, 0.6233069, -1.494177, 1, 0.6901961, 0, 1,
-1.152205, 0.282319, -1.212173, 1, 0.6941177, 0, 1,
-1.141831, 0.4475572, 0.4199971, 1, 0.7019608, 0, 1,
-1.138973, -0.7448009, -0.4452286, 1, 0.7098039, 0, 1,
-1.130522, 0.665904, -0.3344055, 1, 0.7137255, 0, 1,
-1.129633, 1.026162, 1.516675, 1, 0.7215686, 0, 1,
-1.129207, 1.706798, -1.763943, 1, 0.7254902, 0, 1,
-1.127421, 0.8524138, -0.0858676, 1, 0.7333333, 0, 1,
-1.12558, 1.16006, -1.292777, 1, 0.7372549, 0, 1,
-1.122975, 0.1060658, -1.797951, 1, 0.7450981, 0, 1,
-1.119273, -1.902553, -2.950738, 1, 0.7490196, 0, 1,
-1.115084, 1.126281, -0.9433179, 1, 0.7568628, 0, 1,
-1.114123, 1.82131, 0.2385363, 1, 0.7607843, 0, 1,
-1.11175, 0.8535429, 0.6089587, 1, 0.7686275, 0, 1,
-1.100688, 0.1422752, -1.007289, 1, 0.772549, 0, 1,
-1.09943, -1.975238, -4.466112, 1, 0.7803922, 0, 1,
-1.09555, 0.5012577, -0.6806561, 1, 0.7843137, 0, 1,
-1.094237, -0.7660423, -1.552151, 1, 0.7921569, 0, 1,
-1.092266, 1.002353, -0.07071278, 1, 0.7960784, 0, 1,
-1.091307, -0.03157888, -1.372686, 1, 0.8039216, 0, 1,
-1.084054, -1.558932, -2.662076, 1, 0.8117647, 0, 1,
-1.083844, 0.672858, -2.706723, 1, 0.8156863, 0, 1,
-1.083812, -1.774161, -1.354227, 1, 0.8235294, 0, 1,
-1.072903, 1.473066, -1.134516, 1, 0.827451, 0, 1,
-1.070671, -0.1080313, -3.250812, 1, 0.8352941, 0, 1,
-1.068123, 0.6563555, -1.843657, 1, 0.8392157, 0, 1,
-1.061054, -0.3359146, -1.823134, 1, 0.8470588, 0, 1,
-1.056302, -0.7377211, -2.547482, 1, 0.8509804, 0, 1,
-1.049665, 0.3424897, -0.9898521, 1, 0.8588235, 0, 1,
-1.034712, 1.572275, 0.142153, 1, 0.8627451, 0, 1,
-1.029823, 0.5830626, -0.8898728, 1, 0.8705882, 0, 1,
-1.026675, -0.143615, -1.830398, 1, 0.8745098, 0, 1,
-1.023405, 0.8022491, 0.2071146, 1, 0.8823529, 0, 1,
-1.023349, 0.109713, -1.053743, 1, 0.8862745, 0, 1,
-1.022532, 0.6143056, -1.033614, 1, 0.8941177, 0, 1,
-1.020794, 1.242255, -1.792524, 1, 0.8980392, 0, 1,
-1.01362, 1.150088, -0.3963348, 1, 0.9058824, 0, 1,
-1.010555, -0.2708917, -3.706464, 1, 0.9137255, 0, 1,
-1.007277, 0.205074, -0.7642424, 1, 0.9176471, 0, 1,
-1.00712, -0.5268017, -0.6003937, 1, 0.9254902, 0, 1,
-1.0009, -1.05685, -1.283066, 1, 0.9294118, 0, 1,
-0.9995027, 0.1804449, -0.6233693, 1, 0.9372549, 0, 1,
-0.9994529, 1.08362, -2.318679, 1, 0.9411765, 0, 1,
-0.9965029, 1.641573, 1.298507, 1, 0.9490196, 0, 1,
-0.9836287, 0.9844041, -0.5127037, 1, 0.9529412, 0, 1,
-0.9771129, -0.09584866, -2.111039, 1, 0.9607843, 0, 1,
-0.9724339, 0.3453621, -0.5204009, 1, 0.9647059, 0, 1,
-0.9670331, -0.6587288, -2.53442, 1, 0.972549, 0, 1,
-0.9667878, 1.178087, -0.3840285, 1, 0.9764706, 0, 1,
-0.9651198, 0.1606249, -1.078562, 1, 0.9843137, 0, 1,
-0.9651161, -0.1888005, -1.285769, 1, 0.9882353, 0, 1,
-0.9621702, 1.421147, -1.138484, 1, 0.9960784, 0, 1,
-0.9524958, 1.269933, -0.6204318, 0.9960784, 1, 0, 1,
-0.9522716, -0.09023961, -1.48003, 0.9921569, 1, 0, 1,
-0.9491493, 0.4574496, -2.691965, 0.9843137, 1, 0, 1,
-0.9452521, -1.199985, -2.887837, 0.9803922, 1, 0, 1,
-0.9375324, 0.2163714, 0.3906602, 0.972549, 1, 0, 1,
-0.9333254, 2.332556, -0.3723494, 0.9686275, 1, 0, 1,
-0.9197211, 0.4647087, 0.09721766, 0.9607843, 1, 0, 1,
-0.906843, 0.02277973, -1.591497, 0.9568627, 1, 0, 1,
-0.906669, 0.2883419, -2.429002, 0.9490196, 1, 0, 1,
-0.9055254, -1.088862, -2.668642, 0.945098, 1, 0, 1,
-0.9045154, -0.1978227, -1.395186, 0.9372549, 1, 0, 1,
-0.9025103, 0.1053218, -0.6578255, 0.9333333, 1, 0, 1,
-0.8992753, 0.05959964, -2.759412, 0.9254902, 1, 0, 1,
-0.898692, -0.7305287, -1.339313, 0.9215686, 1, 0, 1,
-0.897648, -0.08811004, -1.565845, 0.9137255, 1, 0, 1,
-0.8902915, -0.547901, -0.4760525, 0.9098039, 1, 0, 1,
-0.8882841, 0.1299174, -2.072885, 0.9019608, 1, 0, 1,
-0.8865727, 0.7403545, -0.9932699, 0.8941177, 1, 0, 1,
-0.8828089, -1.832265, -4.077345, 0.8901961, 1, 0, 1,
-0.8802986, 1.038663, -0.3428823, 0.8823529, 1, 0, 1,
-0.8750486, -2.151927, -1.717624, 0.8784314, 1, 0, 1,
-0.8741615, -0.7163705, -1.813633, 0.8705882, 1, 0, 1,
-0.8688257, -0.3863454, -3.834812, 0.8666667, 1, 0, 1,
-0.8683, -0.1240956, -2.220041, 0.8588235, 1, 0, 1,
-0.8650232, -0.3895846, -1.881606, 0.854902, 1, 0, 1,
-0.8646279, 0.2930567, -1.601583, 0.8470588, 1, 0, 1,
-0.851308, -0.681897, -3.218317, 0.8431373, 1, 0, 1,
-0.851256, -0.2503446, -1.756197, 0.8352941, 1, 0, 1,
-0.8508075, -2.485426, -3.990566, 0.8313726, 1, 0, 1,
-0.8480948, 0.3106953, -1.157185, 0.8235294, 1, 0, 1,
-0.8452336, -0.8143794, -0.2149726, 0.8196079, 1, 0, 1,
-0.8399857, -0.1129044, -2.156007, 0.8117647, 1, 0, 1,
-0.8364879, 0.4339658, -0.8447932, 0.8078431, 1, 0, 1,
-0.8336466, 0.6177897, -1.07956, 0.8, 1, 0, 1,
-0.8330581, -0.8736395, -0.1555268, 0.7921569, 1, 0, 1,
-0.8283186, -0.4256437, -1.995082, 0.7882353, 1, 0, 1,
-0.8273054, 1.017202, -0.1010431, 0.7803922, 1, 0, 1,
-0.8262305, -0.5738499, -2.441308, 0.7764706, 1, 0, 1,
-0.8254566, -2.681182, -3.116888, 0.7686275, 1, 0, 1,
-0.8216597, 0.3985375, -1.527867, 0.7647059, 1, 0, 1,
-0.8172563, -1.139044, -2.767261, 0.7568628, 1, 0, 1,
-0.8163384, -0.3618281, -3.142771, 0.7529412, 1, 0, 1,
-0.8118212, -1.07057, -2.414989, 0.7450981, 1, 0, 1,
-0.8094334, 0.02001673, -0.4877889, 0.7411765, 1, 0, 1,
-0.808411, 1.008152, -1.130839, 0.7333333, 1, 0, 1,
-0.8068799, 0.746514, -0.9863411, 0.7294118, 1, 0, 1,
-0.7949581, -0.2775686, -1.305836, 0.7215686, 1, 0, 1,
-0.7906674, 0.3072751, -1.569953, 0.7176471, 1, 0, 1,
-0.7902247, -0.732735, -2.338261, 0.7098039, 1, 0, 1,
-0.7894599, 0.5337209, -0.941183, 0.7058824, 1, 0, 1,
-0.7875515, 2.23348, -0.4478408, 0.6980392, 1, 0, 1,
-0.7870312, -0.7669271, -2.71502, 0.6901961, 1, 0, 1,
-0.7843223, 0.4345968, -0.62883, 0.6862745, 1, 0, 1,
-0.7756886, 0.7227356, -1.196895, 0.6784314, 1, 0, 1,
-0.7745653, 0.7451772, -0.4455289, 0.6745098, 1, 0, 1,
-0.7736234, -0.02680185, -0.8359553, 0.6666667, 1, 0, 1,
-0.7734988, 0.4708609, -0.8168685, 0.6627451, 1, 0, 1,
-0.7712959, -0.8442825, -2.362304, 0.654902, 1, 0, 1,
-0.7711373, -0.1654774, -3.14519, 0.6509804, 1, 0, 1,
-0.7684327, 1.156154, -1.331124, 0.6431373, 1, 0, 1,
-0.7669662, 0.3441506, -0.7935113, 0.6392157, 1, 0, 1,
-0.7646077, -1.517355, -3.046602, 0.6313726, 1, 0, 1,
-0.7592827, 0.3374584, 0.8571858, 0.627451, 1, 0, 1,
-0.7536952, 0.3870492, -2.005733, 0.6196079, 1, 0, 1,
-0.7513503, 0.08302762, -1.732659, 0.6156863, 1, 0, 1,
-0.7491205, -0.7789482, -1.362733, 0.6078432, 1, 0, 1,
-0.7464777, 0.3572885, 0.3707398, 0.6039216, 1, 0, 1,
-0.7438835, -0.05410004, -1.785699, 0.5960785, 1, 0, 1,
-0.7408457, 0.3994396, -0.06704275, 0.5882353, 1, 0, 1,
-0.7404144, -0.9816525, -2.450516, 0.5843138, 1, 0, 1,
-0.7336561, -0.4537641, -2.909247, 0.5764706, 1, 0, 1,
-0.7249692, 1.162368, -1.30809, 0.572549, 1, 0, 1,
-0.7245253, -1.051603, -2.826961, 0.5647059, 1, 0, 1,
-0.7131967, 0.1250351, -1.539057, 0.5607843, 1, 0, 1,
-0.7118044, 0.123919, -1.563318, 0.5529412, 1, 0, 1,
-0.7066052, 0.6087756, 0.9915815, 0.5490196, 1, 0, 1,
-0.7052853, 0.3786408, -1.598579, 0.5411765, 1, 0, 1,
-0.7004436, 0.1827013, -1.361533, 0.5372549, 1, 0, 1,
-0.699558, 0.4777008, -0.6345609, 0.5294118, 1, 0, 1,
-0.6935449, 0.03672621, -0.8649458, 0.5254902, 1, 0, 1,
-0.6929004, -1.769441, -2.537066, 0.5176471, 1, 0, 1,
-0.6916067, -1.259611, -4.476999, 0.5137255, 1, 0, 1,
-0.690002, 0.4322871, -2.369105, 0.5058824, 1, 0, 1,
-0.6867541, 0.3923761, -1.402543, 0.5019608, 1, 0, 1,
-0.6832435, -0.5941001, -1.948113, 0.4941176, 1, 0, 1,
-0.6786392, 0.2623345, -1.522551, 0.4862745, 1, 0, 1,
-0.6768986, 0.4198866, -1.383195, 0.4823529, 1, 0, 1,
-0.6719842, 1.50047, 0.2687027, 0.4745098, 1, 0, 1,
-0.6703056, -1.292359, -2.886424, 0.4705882, 1, 0, 1,
-0.6685615, -0.3190536, -2.849985, 0.4627451, 1, 0, 1,
-0.6681411, 1.259396, -1.194636, 0.4588235, 1, 0, 1,
-0.6630729, 0.6757039, 0.4260231, 0.4509804, 1, 0, 1,
-0.661544, -0.4372053, -0.7724152, 0.4470588, 1, 0, 1,
-0.6578377, 0.2711394, -0.8342797, 0.4392157, 1, 0, 1,
-0.6559529, -0.9746498, -2.928793, 0.4352941, 1, 0, 1,
-0.6548426, 0.02357622, -0.2270364, 0.427451, 1, 0, 1,
-0.6538981, 0.08627737, -1.836624, 0.4235294, 1, 0, 1,
-0.6524069, 0.3842779, -3.579764, 0.4156863, 1, 0, 1,
-0.6497394, -0.4911611, -1.722139, 0.4117647, 1, 0, 1,
-0.6457204, 0.0256025, -2.268301, 0.4039216, 1, 0, 1,
-0.6412166, -0.1382417, -1.233901, 0.3960784, 1, 0, 1,
-0.6397341, 0.3340155, -1.007517, 0.3921569, 1, 0, 1,
-0.6385055, 0.7783393, -1.235821, 0.3843137, 1, 0, 1,
-0.6377708, 0.2766799, -1.330519, 0.3803922, 1, 0, 1,
-0.6340925, 0.1640204, -0.2717463, 0.372549, 1, 0, 1,
-0.6305249, -0.7359327, -1.451341, 0.3686275, 1, 0, 1,
-0.62817, -0.1821901, -2.419171, 0.3607843, 1, 0, 1,
-0.618006, 1.156634, 1.764915, 0.3568628, 1, 0, 1,
-0.6148421, -0.2184751, -1.637155, 0.3490196, 1, 0, 1,
-0.6088516, 0.4382882, -0.3431428, 0.345098, 1, 0, 1,
-0.6064346, -0.515007, -3.511509, 0.3372549, 1, 0, 1,
-0.6051161, -0.6253246, -3.26478, 0.3333333, 1, 0, 1,
-0.6028332, -0.837621, -3.820457, 0.3254902, 1, 0, 1,
-0.6004338, -0.3911943, -2.214067, 0.3215686, 1, 0, 1,
-0.5979809, 0.8078424, -0.5547798, 0.3137255, 1, 0, 1,
-0.5975409, -0.8978227, -3.070734, 0.3098039, 1, 0, 1,
-0.5964524, 1.220811, 0.3077775, 0.3019608, 1, 0, 1,
-0.5945091, -1.187125, -3.620183, 0.2941177, 1, 0, 1,
-0.5921011, -0.9837413, -2.315581, 0.2901961, 1, 0, 1,
-0.59073, 0.4505417, -0.2139164, 0.282353, 1, 0, 1,
-0.5893717, 0.09035833, -0.5632791, 0.2784314, 1, 0, 1,
-0.5835809, -0.2841561, -3.541163, 0.2705882, 1, 0, 1,
-0.5831152, -0.1323179, -0.7964602, 0.2666667, 1, 0, 1,
-0.5782624, -0.2247399, -2.060115, 0.2588235, 1, 0, 1,
-0.5732023, -1.472442, -3.373638, 0.254902, 1, 0, 1,
-0.5696023, -0.1175851, -3.559871, 0.2470588, 1, 0, 1,
-0.5693576, 0.8100736, -1.730567, 0.2431373, 1, 0, 1,
-0.5693424, -0.7774026, -4.727278, 0.2352941, 1, 0, 1,
-0.5693122, -0.2271466, -2.111345, 0.2313726, 1, 0, 1,
-0.5692077, -0.08834572, -0.4243801, 0.2235294, 1, 0, 1,
-0.5689948, 1.608061, -0.6457815, 0.2196078, 1, 0, 1,
-0.5688512, -1.541141, -2.641383, 0.2117647, 1, 0, 1,
-0.5639145, -0.5258586, -2.259614, 0.2078431, 1, 0, 1,
-0.5540721, 0.8617555, 1.092621, 0.2, 1, 0, 1,
-0.5504352, 1.711282, -0.4182818, 0.1921569, 1, 0, 1,
-0.5496776, -0.04848609, -1.910098, 0.1882353, 1, 0, 1,
-0.5419143, 1.887203, -0.6883367, 0.1803922, 1, 0, 1,
-0.5403273, 2.369726, -0.9680066, 0.1764706, 1, 0, 1,
-0.5382538, 0.6239948, -0.2052044, 0.1686275, 1, 0, 1,
-0.5355626, 0.546217, -2.76713, 0.1647059, 1, 0, 1,
-0.5334676, 0.073202, -1.839809, 0.1568628, 1, 0, 1,
-0.5218496, -1.581981, -4.595911, 0.1529412, 1, 0, 1,
-0.5213125, 0.7074997, -0.4342223, 0.145098, 1, 0, 1,
-0.5175375, -0.8186912, -2.449353, 0.1411765, 1, 0, 1,
-0.5136971, -0.5987164, -3.278827, 0.1333333, 1, 0, 1,
-0.5043181, 1.334701, -0.4966702, 0.1294118, 1, 0, 1,
-0.5021682, -1.246356, -1.926008, 0.1215686, 1, 0, 1,
-0.4952526, 0.5700932, -0.1928723, 0.1176471, 1, 0, 1,
-0.4901557, 0.1371362, -1.367661, 0.1098039, 1, 0, 1,
-0.4897452, -0.08900643, -2.014714, 0.1058824, 1, 0, 1,
-0.4846662, -0.5900779, -1.415279, 0.09803922, 1, 0, 1,
-0.4835794, -1.74192, -2.4739, 0.09019608, 1, 0, 1,
-0.4831359, 0.9491607, -1.686957, 0.08627451, 1, 0, 1,
-0.4829719, -0.5999209, -4.281786, 0.07843138, 1, 0, 1,
-0.4826677, 0.003359802, -0.85686, 0.07450981, 1, 0, 1,
-0.4824341, -0.4065336, -1.271973, 0.06666667, 1, 0, 1,
-0.4821891, 0.4865659, -1.417107, 0.0627451, 1, 0, 1,
-0.4820817, 0.8380724, -0.4973638, 0.05490196, 1, 0, 1,
-0.4794568, -0.01762334, 1.440406, 0.05098039, 1, 0, 1,
-0.4766411, -1.813241, -2.80416, 0.04313726, 1, 0, 1,
-0.4734994, 0.493991, -0.6154834, 0.03921569, 1, 0, 1,
-0.4733403, 0.3656319, -1.223129, 0.03137255, 1, 0, 1,
-0.4711265, 0.3040174, -1.093645, 0.02745098, 1, 0, 1,
-0.4690799, 0.2830993, -3.111868, 0.01960784, 1, 0, 1,
-0.4634021, -0.4536028, -1.702537, 0.01568628, 1, 0, 1,
-0.4563012, -0.2208941, -0.9038231, 0.007843138, 1, 0, 1,
-0.4537712, 1.033765, 0.7658074, 0.003921569, 1, 0, 1,
-0.4490899, 0.4282781, -1.118014, 0, 1, 0.003921569, 1,
-0.4456057, -0.4692222, -1.121231, 0, 1, 0.01176471, 1,
-0.4433405, 1.014512, -0.6734264, 0, 1, 0.01568628, 1,
-0.4416206, 0.3088833, -0.9339016, 0, 1, 0.02352941, 1,
-0.4397455, -0.7975194, -1.318044, 0, 1, 0.02745098, 1,
-0.4385701, -1.482283, -3.282606, 0, 1, 0.03529412, 1,
-0.433019, -0.1058717, -3.049262, 0, 1, 0.03921569, 1,
-0.4289318, -0.4236949, -1.715581, 0, 1, 0.04705882, 1,
-0.4243428, 1.267793, -0.9846081, 0, 1, 0.05098039, 1,
-0.4231528, -0.2465976, -1.595242, 0, 1, 0.05882353, 1,
-0.4189427, -2.527672, -2.852332, 0, 1, 0.0627451, 1,
-0.4171287, -2.746946, -4.464183, 0, 1, 0.07058824, 1,
-0.4098188, -0.9753852, -1.54747, 0, 1, 0.07450981, 1,
-0.4078917, 0.880722, -0.07411039, 0, 1, 0.08235294, 1,
-0.4053665, -1.600578, -1.792456, 0, 1, 0.08627451, 1,
-0.401072, 0.629191, -1.122039, 0, 1, 0.09411765, 1,
-0.4009558, 1.201051, -1.493368, 0, 1, 0.1019608, 1,
-0.4008412, -1.192901, -2.918065, 0, 1, 0.1058824, 1,
-0.400539, -1.019365, -4.539663, 0, 1, 0.1137255, 1,
-0.3973586, -1.681621, -3.473636, 0, 1, 0.1176471, 1,
-0.3895971, 0.4769596, 0.01039627, 0, 1, 0.1254902, 1,
-0.3890532, -1.489141, -4.549464, 0, 1, 0.1294118, 1,
-0.3878151, 0.7533038, -1.295827, 0, 1, 0.1372549, 1,
-0.3871932, -0.3666187, -1.909363, 0, 1, 0.1411765, 1,
-0.3859105, 0.546078, -0.6776069, 0, 1, 0.1490196, 1,
-0.3841398, 1.42009, 0.6418734, 0, 1, 0.1529412, 1,
-0.3804663, 0.1148962, -4.143791, 0, 1, 0.1607843, 1,
-0.3776844, 0.06139531, -1.489685, 0, 1, 0.1647059, 1,
-0.3751929, -1.319151, -0.1219614, 0, 1, 0.172549, 1,
-0.3746324, -0.7284044, -3.344493, 0, 1, 0.1764706, 1,
-0.373645, -2.335348, -2.808287, 0, 1, 0.1843137, 1,
-0.3735868, 0.2938862, 0.1417674, 0, 1, 0.1882353, 1,
-0.3715004, 1.376384, 1.520415, 0, 1, 0.1960784, 1,
-0.3689859, -0.7331098, -2.432864, 0, 1, 0.2039216, 1,
-0.3684629, -0.4203319, -1.889195, 0, 1, 0.2078431, 1,
-0.3608911, -0.2366151, -3.094824, 0, 1, 0.2156863, 1,
-0.3597991, 0.8867911, 0.7349776, 0, 1, 0.2196078, 1,
-0.3576126, 1.336688, 0.9192082, 0, 1, 0.227451, 1,
-0.3575217, -0.1306477, -2.314622, 0, 1, 0.2313726, 1,
-0.3559446, 1.132757, 0.5830725, 0, 1, 0.2392157, 1,
-0.3548294, 0.1055941, -0.9802436, 0, 1, 0.2431373, 1,
-0.3530597, -0.3177508, -2.646709, 0, 1, 0.2509804, 1,
-0.3512267, -0.8052391, -1.899318, 0, 1, 0.254902, 1,
-0.350415, 1.653845, -0.790935, 0, 1, 0.2627451, 1,
-0.3493607, 0.9546909, -1.5013, 0, 1, 0.2666667, 1,
-0.3466264, -1.118017, -2.107984, 0, 1, 0.2745098, 1,
-0.3464952, 0.6265704, -1.891307, 0, 1, 0.2784314, 1,
-0.344868, -0.393434, -1.283975, 0, 1, 0.2862745, 1,
-0.3441477, 0.2629235, -3.138295, 0, 1, 0.2901961, 1,
-0.3410148, 0.6363471, -0.635915, 0, 1, 0.2980392, 1,
-0.3360985, 0.4414082, -0.5829357, 0, 1, 0.3058824, 1,
-0.3334365, -2.380607, -3.739502, 0, 1, 0.3098039, 1,
-0.3323859, -1.436726, -3.994113, 0, 1, 0.3176471, 1,
-0.3322001, -1.800323, -4.40688, 0, 1, 0.3215686, 1,
-0.3276303, -0.574604, -3.563039, 0, 1, 0.3294118, 1,
-0.3254558, 0.6398947, 0.3701292, 0, 1, 0.3333333, 1,
-0.3237767, 2.057374, -0.06398193, 0, 1, 0.3411765, 1,
-0.3200591, 0.7114633, 0.009155254, 0, 1, 0.345098, 1,
-0.3162327, 0.7949892, 1.854624, 0, 1, 0.3529412, 1,
-0.3161395, -1.011619, -2.506122, 0, 1, 0.3568628, 1,
-0.3122221, -0.9333577, -1.824698, 0, 1, 0.3647059, 1,
-0.3097492, -1.020535, -1.417966, 0, 1, 0.3686275, 1,
-0.3015229, 2.026807, -1.225869, 0, 1, 0.3764706, 1,
-0.2964167, 0.1435618, -2.010137, 0, 1, 0.3803922, 1,
-0.2943605, 0.1282244, -1.94251, 0, 1, 0.3882353, 1,
-0.2942969, -0.2987069, 0.2451928, 0, 1, 0.3921569, 1,
-0.2903356, 1.145694, 0.9224622, 0, 1, 0.4, 1,
-0.285993, -0.1513898, -3.303761, 0, 1, 0.4078431, 1,
-0.2793533, -0.1979948, -5.788754, 0, 1, 0.4117647, 1,
-0.2792988, 0.408817, -2.976686, 0, 1, 0.4196078, 1,
-0.2699037, -1.03824, -2.907337, 0, 1, 0.4235294, 1,
-0.2689496, 0.2055718, 0.4769964, 0, 1, 0.4313726, 1,
-0.2683472, 0.1651039, -0.9248199, 0, 1, 0.4352941, 1,
-0.2654883, 0.3895011, -0.8193039, 0, 1, 0.4431373, 1,
-0.2636135, 0.6966243, -1.30128, 0, 1, 0.4470588, 1,
-0.2617319, -2.307298, -4.052106, 0, 1, 0.454902, 1,
-0.2604167, -0.1659834, -0.7535678, 0, 1, 0.4588235, 1,
-0.2599854, 0.0306666, -1.125656, 0, 1, 0.4666667, 1,
-0.2596947, -0.3819018, -2.324953, 0, 1, 0.4705882, 1,
-0.248224, -1.628562, -3.594857, 0, 1, 0.4784314, 1,
-0.2473732, -1.45589, -2.271988, 0, 1, 0.4823529, 1,
-0.2384423, 1.388363, -1.627202, 0, 1, 0.4901961, 1,
-0.2368693, -0.5384127, -1.5636, 0, 1, 0.4941176, 1,
-0.2344622, 1.317411, -0.2066755, 0, 1, 0.5019608, 1,
-0.2317063, -0.2282151, -4.369831, 0, 1, 0.509804, 1,
-0.2300766, 0.6632327, -0.8129129, 0, 1, 0.5137255, 1,
-0.2295482, 0.1626819, -1.570599, 0, 1, 0.5215687, 1,
-0.2292174, 0.8451508, 0.4938485, 0, 1, 0.5254902, 1,
-0.2283429, -1.538117, -3.219811, 0, 1, 0.5333334, 1,
-0.2273626, -0.4604822, -1.576274, 0, 1, 0.5372549, 1,
-0.2244643, 0.05858966, -1.784968, 0, 1, 0.5450981, 1,
-0.2208742, -0.6288081, -2.043163, 0, 1, 0.5490196, 1,
-0.2194947, -0.4051029, -3.291629, 0, 1, 0.5568628, 1,
-0.2193847, -0.9946522, -2.383861, 0, 1, 0.5607843, 1,
-0.2126461, 0.4494537, 0.1466702, 0, 1, 0.5686275, 1,
-0.210357, 0.8068523, 0.1085492, 0, 1, 0.572549, 1,
-0.2103562, 0.5944003, -1.284858, 0, 1, 0.5803922, 1,
-0.2094927, -0.9851419, -3.993667, 0, 1, 0.5843138, 1,
-0.2087651, 0.1294154, 0.7691444, 0, 1, 0.5921569, 1,
-0.2082365, 2.177127, 0.4175785, 0, 1, 0.5960785, 1,
-0.2055239, -1.289326, -2.496203, 0, 1, 0.6039216, 1,
-0.2040887, 0.9936818, -1.561514, 0, 1, 0.6117647, 1,
-0.2022111, -0.01948124, -1.301675, 0, 1, 0.6156863, 1,
-0.2011154, -0.2831546, -2.032058, 0, 1, 0.6235294, 1,
-0.1980066, -1.101543, -3.981378, 0, 1, 0.627451, 1,
-0.1963647, 1.429313, -0.5551782, 0, 1, 0.6352941, 1,
-0.19135, 0.1086616, -2.306594, 0, 1, 0.6392157, 1,
-0.1910236, -0.07790139, -2.089305, 0, 1, 0.6470588, 1,
-0.1908958, 0.7481322, 0.8592863, 0, 1, 0.6509804, 1,
-0.1885125, -0.05910344, -2.756427, 0, 1, 0.6588235, 1,
-0.1874589, 0.9785338, 0.09804507, 0, 1, 0.6627451, 1,
-0.1843258, -1.422682, -2.849439, 0, 1, 0.6705883, 1,
-0.1815127, -0.2008285, -1.615322, 0, 1, 0.6745098, 1,
-0.181346, 1.805704, 0.3090774, 0, 1, 0.682353, 1,
-0.1791693, -1.559587, -2.279097, 0, 1, 0.6862745, 1,
-0.1662723, 2.063211, 1.200641, 0, 1, 0.6941177, 1,
-0.1626589, -0.4079189, -3.848631, 0, 1, 0.7019608, 1,
-0.1623811, -0.804795, -2.044035, 0, 1, 0.7058824, 1,
-0.1605521, 1.057979, 1.317304, 0, 1, 0.7137255, 1,
-0.1599993, 0.05935783, -1.295392, 0, 1, 0.7176471, 1,
-0.1598744, 1.460305, -0.0488153, 0, 1, 0.7254902, 1,
-0.157272, 0.7700124, -1.873002, 0, 1, 0.7294118, 1,
-0.1561946, -0.1424351, -4.853888, 0, 1, 0.7372549, 1,
-0.1532591, -0.1529939, -1.887603, 0, 1, 0.7411765, 1,
-0.1525088, -1.845509, -3.546456, 0, 1, 0.7490196, 1,
-0.151124, 0.001731563, 0.3118415, 0, 1, 0.7529412, 1,
-0.1502242, -0.2111766, -2.53828, 0, 1, 0.7607843, 1,
-0.1489962, -1.401729, -2.789381, 0, 1, 0.7647059, 1,
-0.1454445, -1.040044, -2.91407, 0, 1, 0.772549, 1,
-0.1453401, -0.2000888, -2.355145, 0, 1, 0.7764706, 1,
-0.1444557, -1.138635, -2.087397, 0, 1, 0.7843137, 1,
-0.1418011, -0.01503767, -1.878442, 0, 1, 0.7882353, 1,
-0.1392125, 0.9738382, -0.7319767, 0, 1, 0.7960784, 1,
-0.1344835, 0.9106742, -2.705425, 0, 1, 0.8039216, 1,
-0.1322188, -1.279899, -3.812372, 0, 1, 0.8078431, 1,
-0.131968, 0.1926102, -0.4733143, 0, 1, 0.8156863, 1,
-0.12883, -0.3303289, -2.490265, 0, 1, 0.8196079, 1,
-0.1271151, 1.751784, -0.1983562, 0, 1, 0.827451, 1,
-0.1247782, -0.4446678, -2.682884, 0, 1, 0.8313726, 1,
-0.1239796, -1.733222, -2.375614, 0, 1, 0.8392157, 1,
-0.1239415, -1.359426, -2.380438, 0, 1, 0.8431373, 1,
-0.1218069, 0.2384456, 0.5019624, 0, 1, 0.8509804, 1,
-0.1217152, -0.2614457, -2.272878, 0, 1, 0.854902, 1,
-0.1205588, 1.061162, -0.6026651, 0, 1, 0.8627451, 1,
-0.1202916, -1.038552, -3.240286, 0, 1, 0.8666667, 1,
-0.1169658, 0.9652518, -0.7428271, 0, 1, 0.8745098, 1,
-0.1166075, 0.002666988, -0.7601166, 0, 1, 0.8784314, 1,
-0.1154711, 3.205957, 0.5348591, 0, 1, 0.8862745, 1,
-0.1125627, 0.9546906, 1.241738, 0, 1, 0.8901961, 1,
-0.1121702, -0.3758039, -2.227553, 0, 1, 0.8980392, 1,
-0.1084125, 0.877165, -1.454924, 0, 1, 0.9058824, 1,
-0.103245, 1.47953, -0.05111162, 0, 1, 0.9098039, 1,
-0.09660327, 0.2962846, 0.6352887, 0, 1, 0.9176471, 1,
-0.09650856, -1.486224, -3.072053, 0, 1, 0.9215686, 1,
-0.0958647, -0.2216233, -3.786308, 0, 1, 0.9294118, 1,
-0.09519614, 0.2348197, -0.07460932, 0, 1, 0.9333333, 1,
-0.09477284, 2.298332, 0.9694015, 0, 1, 0.9411765, 1,
-0.08549496, 0.0966114, -0.04024663, 0, 1, 0.945098, 1,
-0.08334116, -0.68213, -2.25947, 0, 1, 0.9529412, 1,
-0.082028, 0.8260232, -0.9494945, 0, 1, 0.9568627, 1,
-0.07590547, 0.8998631, 0.4809977, 0, 1, 0.9647059, 1,
-0.07185487, 1.219515, -1.633726, 0, 1, 0.9686275, 1,
-0.07102559, 1.14376, 1.019032, 0, 1, 0.9764706, 1,
-0.07030128, 1.237847, -0.5026388, 0, 1, 0.9803922, 1,
-0.06994513, -0.3502246, -3.05418, 0, 1, 0.9882353, 1,
-0.06501354, 0.9084759, -1.042688, 0, 1, 0.9921569, 1,
-0.06196725, 0.7488595, 0.210718, 0, 1, 1, 1,
-0.06146585, 0.8582218, 1.623941, 0, 0.9921569, 1, 1,
-0.06060247, 1.001082, -1.07674, 0, 0.9882353, 1, 1,
-0.05922894, -0.4440452, -5.232991, 0, 0.9803922, 1, 1,
-0.05781787, -1.668563, -2.489102, 0, 0.9764706, 1, 1,
-0.0571669, -0.54188, -1.990971, 0, 0.9686275, 1, 1,
-0.05519713, 0.05528172, 0.2183925, 0, 0.9647059, 1, 1,
-0.05466888, -0.4872308, -3.250259, 0, 0.9568627, 1, 1,
-0.05218527, -0.4349961, -2.568884, 0, 0.9529412, 1, 1,
-0.0488164, 0.7022656, 1.605234, 0, 0.945098, 1, 1,
-0.03910927, -1.53431, -1.675154, 0, 0.9411765, 1, 1,
-0.03902553, -0.9472225, -2.886655, 0, 0.9333333, 1, 1,
-0.03880849, 0.8421197, -0.8309159, 0, 0.9294118, 1, 1,
-0.03726178, 0.8088275, -0.1675636, 0, 0.9215686, 1, 1,
-0.03520117, 0.07188154, -1.345556, 0, 0.9176471, 1, 1,
-0.03430891, -0.657981, -2.095718, 0, 0.9098039, 1, 1,
-0.03074094, -0.04283479, -2.863745, 0, 0.9058824, 1, 1,
-0.02947236, 0.3962028, 1.164505, 0, 0.8980392, 1, 1,
-0.02742426, -1.49683, -2.590908, 0, 0.8901961, 1, 1,
-0.02715198, -0.2253927, -2.659945, 0, 0.8862745, 1, 1,
-0.02635323, 0.6872549, 0.9958525, 0, 0.8784314, 1, 1,
-0.02347386, -1.299392, -2.811817, 0, 0.8745098, 1, 1,
-0.01604087, 1.016439, 1.086199, 0, 0.8666667, 1, 1,
-0.0134008, 2.111548, -1.820094, 0, 0.8627451, 1, 1,
-0.01319345, -0.1658734, -3.535442, 0, 0.854902, 1, 1,
-0.007070682, -0.1631787, -2.338147, 0, 0.8509804, 1, 1,
-0.003225547, 1.183546, -0.1347948, 0, 0.8431373, 1, 1,
0.0004474514, 1.239564, -0.7789608, 0, 0.8392157, 1, 1,
0.0009610915, 0.8963718, -2.032959, 0, 0.8313726, 1, 1,
0.002216865, -0.334429, 2.102899, 0, 0.827451, 1, 1,
0.003371224, 0.1536519, -1.71902, 0, 0.8196079, 1, 1,
0.004782213, 1.121904, -0.4862835, 0, 0.8156863, 1, 1,
0.005804643, 0.4137669, -1.381061, 0, 0.8078431, 1, 1,
0.01484199, -0.3109871, 2.220706, 0, 0.8039216, 1, 1,
0.01760888, -1.310328, 3.612159, 0, 0.7960784, 1, 1,
0.01859727, 0.6227916, 0.2940021, 0, 0.7882353, 1, 1,
0.01869462, -1.510237, 2.769351, 0, 0.7843137, 1, 1,
0.02048177, -1.964747, 4.295209, 0, 0.7764706, 1, 1,
0.02399798, 0.3257564, 0.2183264, 0, 0.772549, 1, 1,
0.02572785, 0.02281986, 0.851311, 0, 0.7647059, 1, 1,
0.02611295, 0.5435759, -1.101643, 0, 0.7607843, 1, 1,
0.02826074, -0.1035273, 2.761313, 0, 0.7529412, 1, 1,
0.03399909, -1.237217, 3.374018, 0, 0.7490196, 1, 1,
0.03438185, -1.152323, 4.145092, 0, 0.7411765, 1, 1,
0.03504925, 0.5442901, -0.4555064, 0, 0.7372549, 1, 1,
0.03831567, 0.4220458, -0.2725665, 0, 0.7294118, 1, 1,
0.03911073, -1.471858, 4.593861, 0, 0.7254902, 1, 1,
0.04024442, 0.7965035, 1.182523, 0, 0.7176471, 1, 1,
0.04349476, 1.943268, -0.5416494, 0, 0.7137255, 1, 1,
0.04812082, 0.501839, 0.2670608, 0, 0.7058824, 1, 1,
0.05232183, 1.865393, 0.5049476, 0, 0.6980392, 1, 1,
0.05354996, 0.8578848, -1.208661, 0, 0.6941177, 1, 1,
0.05454944, -0.693767, 3.105086, 0, 0.6862745, 1, 1,
0.05540913, 0.9785763, -0.1212119, 0, 0.682353, 1, 1,
0.05779666, -0.5624952, 3.332999, 0, 0.6745098, 1, 1,
0.06148952, -0.2798413, 2.691506, 0, 0.6705883, 1, 1,
0.0669934, 2.00193, 0.2111759, 0, 0.6627451, 1, 1,
0.06783368, 0.007917828, 1.44708, 0, 0.6588235, 1, 1,
0.0698981, 0.9453858, 0.2702337, 0, 0.6509804, 1, 1,
0.07010206, -0.2634685, 2.81746, 0, 0.6470588, 1, 1,
0.07293923, 1.254826, 0.8298221, 0, 0.6392157, 1, 1,
0.0748224, -1.117563, 4.340557, 0, 0.6352941, 1, 1,
0.07485502, 0.6281065, 0.9561113, 0, 0.627451, 1, 1,
0.07581524, -0.01476025, 2.142628, 0, 0.6235294, 1, 1,
0.07875539, 1.215366, 0.1389372, 0, 0.6156863, 1, 1,
0.07974033, -0.9020061, 2.078682, 0, 0.6117647, 1, 1,
0.08044195, 0.2593972, 0.05221174, 0, 0.6039216, 1, 1,
0.08062933, 0.4431215, 0.5851783, 0, 0.5960785, 1, 1,
0.08107682, -0.4513132, 3.529256, 0, 0.5921569, 1, 1,
0.08110712, -1.913158, 2.038333, 0, 0.5843138, 1, 1,
0.0818, -1.058224, 3.272355, 0, 0.5803922, 1, 1,
0.08345019, -0.9032503, 3.326136, 0, 0.572549, 1, 1,
0.083633, -0.2101372, 0.7971942, 0, 0.5686275, 1, 1,
0.08570953, 1.12829, -0.4532619, 0, 0.5607843, 1, 1,
0.08575263, -1.420696, 2.315858, 0, 0.5568628, 1, 1,
0.08617803, -0.06778807, 3.584811, 0, 0.5490196, 1, 1,
0.09980375, -0.2660533, 2.664005, 0, 0.5450981, 1, 1,
0.101794, -1.826793, 3.587622, 0, 0.5372549, 1, 1,
0.103636, -0.1362721, 3.830927, 0, 0.5333334, 1, 1,
0.1039623, -0.4438307, 1.076448, 0, 0.5254902, 1, 1,
0.1081086, -0.1116429, 3.180015, 0, 0.5215687, 1, 1,
0.1134127, 0.6125776, -1.81005, 0, 0.5137255, 1, 1,
0.1138315, 0.2887788, 2.109699, 0, 0.509804, 1, 1,
0.1140015, -0.2901526, 3.592849, 0, 0.5019608, 1, 1,
0.1147276, 0.4379572, 0.1585897, 0, 0.4941176, 1, 1,
0.1162719, -0.5483816, 1.057256, 0, 0.4901961, 1, 1,
0.1179228, 0.4798961, -0.1296529, 0, 0.4823529, 1, 1,
0.1204996, 1.467345, 0.2674806, 0, 0.4784314, 1, 1,
0.1214765, 0.3725525, -0.2140137, 0, 0.4705882, 1, 1,
0.1224253, 1.480843, -0.7780036, 0, 0.4666667, 1, 1,
0.1226298, -0.3688942, 1.601982, 0, 0.4588235, 1, 1,
0.1231761, 0.6623074, 0.03634031, 0, 0.454902, 1, 1,
0.1240488, 0.4265096, -0.3132778, 0, 0.4470588, 1, 1,
0.128299, 0.611301, -0.3428406, 0, 0.4431373, 1, 1,
0.1305569, -0.6455999, 3.341865, 0, 0.4352941, 1, 1,
0.1305601, 1.052007, 0.7228438, 0, 0.4313726, 1, 1,
0.1312063, 0.2649805, 1.398339, 0, 0.4235294, 1, 1,
0.1359878, -1.96901, 3.937492, 0, 0.4196078, 1, 1,
0.1368574, 0.9384516, -0.5442008, 0, 0.4117647, 1, 1,
0.1441087, 0.1823139, -1.108538, 0, 0.4078431, 1, 1,
0.1452287, -0.6600617, 3.11985, 0, 0.4, 1, 1,
0.1454142, -1.424501, 3.790062, 0, 0.3921569, 1, 1,
0.14638, 1.095371, -1.98635, 0, 0.3882353, 1, 1,
0.1487687, -0.6743937, 2.695516, 0, 0.3803922, 1, 1,
0.1536906, 0.8898677, 0.0902784, 0, 0.3764706, 1, 1,
0.1577828, -0.4214076, 1.995988, 0, 0.3686275, 1, 1,
0.1643673, -0.8012781, 1.751881, 0, 0.3647059, 1, 1,
0.1729566, 2.692053, -0.7028231, 0, 0.3568628, 1, 1,
0.1735564, 0.05629118, 0.6904839, 0, 0.3529412, 1, 1,
0.1766621, 0.1345264, 1.514622, 0, 0.345098, 1, 1,
0.1781801, -0.02929142, 1.004319, 0, 0.3411765, 1, 1,
0.1795954, 2.27532, -0.6923147, 0, 0.3333333, 1, 1,
0.1844047, 0.1117797, -0.7801707, 0, 0.3294118, 1, 1,
0.1892857, 0.4861812, 1.811978, 0, 0.3215686, 1, 1,
0.1910815, -0.8117724, 4.669944, 0, 0.3176471, 1, 1,
0.1962838, 1.15219, -1.202804, 0, 0.3098039, 1, 1,
0.1994226, -0.8913088, 4.647405, 0, 0.3058824, 1, 1,
0.2055668, -0.2859835, 1.423986, 0, 0.2980392, 1, 1,
0.2076217, 0.2339692, 1.286563, 0, 0.2901961, 1, 1,
0.2082881, -0.2388413, 1.87604, 0, 0.2862745, 1, 1,
0.2113451, 0.1620262, 0.4909857, 0, 0.2784314, 1, 1,
0.2121478, -1.622945, 2.490924, 0, 0.2745098, 1, 1,
0.2176045, -1.476434, 2.211178, 0, 0.2666667, 1, 1,
0.2255175, 1.036349, 0.1405403, 0, 0.2627451, 1, 1,
0.2333443, 0.02204116, 1.989026, 0, 0.254902, 1, 1,
0.2336163, -0.3289781, 2.710046, 0, 0.2509804, 1, 1,
0.2348332, -0.1942991, 1.381279, 0, 0.2431373, 1, 1,
0.237639, -0.3922832, 1.586714, 0, 0.2392157, 1, 1,
0.2383281, 0.1766109, 1.805198, 0, 0.2313726, 1, 1,
0.2412274, 2.824892, -0.08324036, 0, 0.227451, 1, 1,
0.2427913, 0.3717489, 1.010151, 0, 0.2196078, 1, 1,
0.2429869, -0.76552, 2.350987, 0, 0.2156863, 1, 1,
0.2485569, 0.5897089, 0.7567095, 0, 0.2078431, 1, 1,
0.2547337, -2.558674, 4.140731, 0, 0.2039216, 1, 1,
0.2567374, 1.353356, 1.191463, 0, 0.1960784, 1, 1,
0.2569888, -0.3731886, 3.22681, 0, 0.1882353, 1, 1,
0.2579346, 0.3273596, -0.139472, 0, 0.1843137, 1, 1,
0.2589343, -0.02345001, 1.3654, 0, 0.1764706, 1, 1,
0.2597673, 0.7944611, 1.539714, 0, 0.172549, 1, 1,
0.2633231, 0.6791778, -0.5161592, 0, 0.1647059, 1, 1,
0.2649783, 0.735999, 1.349575, 0, 0.1607843, 1, 1,
0.2734625, 1.034403, -0.1921422, 0, 0.1529412, 1, 1,
0.2788374, 0.8153055, 0.998651, 0, 0.1490196, 1, 1,
0.2818728, 0.1689774, 0.7338873, 0, 0.1411765, 1, 1,
0.2873465, -1.87425, 0.2292626, 0, 0.1372549, 1, 1,
0.2912619, -0.1014138, 0.3034783, 0, 0.1294118, 1, 1,
0.2954716, 0.2567965, 1.174666, 0, 0.1254902, 1, 1,
0.2972926, 0.8250241, 0.3364057, 0, 0.1176471, 1, 1,
0.2973474, 2.226247, -0.4818436, 0, 0.1137255, 1, 1,
0.2994886, 0.2253322, 0.826914, 0, 0.1058824, 1, 1,
0.2997025, 0.004449002, 1.67329, 0, 0.09803922, 1, 1,
0.3025849, 1.491771, 2.152937, 0, 0.09411765, 1, 1,
0.3029974, -1.584711, 1.587939, 0, 0.08627451, 1, 1,
0.3103792, -1.673145, 3.07825, 0, 0.08235294, 1, 1,
0.3120922, 0.5331014, 0.01490616, 0, 0.07450981, 1, 1,
0.3152094, -0.01100905, 1.826762, 0, 0.07058824, 1, 1,
0.3181998, 0.6771235, -0.6564747, 0, 0.0627451, 1, 1,
0.3186285, 0.815566, 0.03317198, 0, 0.05882353, 1, 1,
0.320966, 0.02522232, 1.879777, 0, 0.05098039, 1, 1,
0.3263608, -1.003471, 3.159108, 0, 0.04705882, 1, 1,
0.3293679, 0.3450856, -0.002398851, 0, 0.03921569, 1, 1,
0.3380409, -1.639017, 1.683954, 0, 0.03529412, 1, 1,
0.339604, -1.023297, 2.079763, 0, 0.02745098, 1, 1,
0.3397264, -1.762462, 4.508515, 0, 0.02352941, 1, 1,
0.3426308, -1.999038, 2.571583, 0, 0.01568628, 1, 1,
0.3436335, -0.002789007, -0.5074833, 0, 0.01176471, 1, 1,
0.3456446, 1.242728, 1.572061, 0, 0.003921569, 1, 1,
0.3471363, -0.9061242, 3.436758, 0.003921569, 0, 1, 1,
0.3502514, 0.6858776, 1.798396, 0.007843138, 0, 1, 1,
0.3512028, -0.2958421, 2.594266, 0.01568628, 0, 1, 1,
0.3524046, -1.196362, 3.763912, 0.01960784, 0, 1, 1,
0.3524444, -1.336593, 2.881322, 0.02745098, 0, 1, 1,
0.3531157, 1.430449, 0.5477868, 0.03137255, 0, 1, 1,
0.3531868, 0.0726077, 1.85026, 0.03921569, 0, 1, 1,
0.3546804, -0.680715, 4.0411, 0.04313726, 0, 1, 1,
0.360572, -1.076675, 2.970187, 0.05098039, 0, 1, 1,
0.360714, -1.16448, 3.937881, 0.05490196, 0, 1, 1,
0.3651629, -0.292455, 0.6218505, 0.0627451, 0, 1, 1,
0.3673968, -0.5165544, 1.60158, 0.06666667, 0, 1, 1,
0.3682565, -0.2324874, 1.770256, 0.07450981, 0, 1, 1,
0.3745351, 0.3659616, 0.4023988, 0.07843138, 0, 1, 1,
0.3820831, 0.9742113, 1.388157, 0.08627451, 0, 1, 1,
0.3830816, -0.8433128, 0.5395572, 0.09019608, 0, 1, 1,
0.383175, 2.331725, -0.1716917, 0.09803922, 0, 1, 1,
0.3840863, -2.031256, 3.701479, 0.1058824, 0, 1, 1,
0.3858694, -0.1824074, -0.09249499, 0.1098039, 0, 1, 1,
0.3881952, -0.7761214, 2.505252, 0.1176471, 0, 1, 1,
0.3909153, 1.270022, 0.1079957, 0.1215686, 0, 1, 1,
0.3926482, -0.7755412, 2.378136, 0.1294118, 0, 1, 1,
0.3937157, -0.2427119, 1.407508, 0.1333333, 0, 1, 1,
0.3956128, -0.5003304, 2.752063, 0.1411765, 0, 1, 1,
0.3959327, -1.276655, 4.999467, 0.145098, 0, 1, 1,
0.4005775, -0.1007985, -0.8532846, 0.1529412, 0, 1, 1,
0.404382, -0.7444286, 1.915919, 0.1568628, 0, 1, 1,
0.405281, -1.006736, 4.281111, 0.1647059, 0, 1, 1,
0.4067517, 1.185932, -0.870086, 0.1686275, 0, 1, 1,
0.4094111, 0.7030746, -0.07688978, 0.1764706, 0, 1, 1,
0.4133681, 1.181983, -0.4261923, 0.1803922, 0, 1, 1,
0.4139193, 0.2282816, 1.175305, 0.1882353, 0, 1, 1,
0.4140576, 0.8404565, 1.026592, 0.1921569, 0, 1, 1,
0.4229957, 0.4364251, -0.5013465, 0.2, 0, 1, 1,
0.4231933, 0.7068406, -0.2605678, 0.2078431, 0, 1, 1,
0.4283763, 0.05666468, 1.544211, 0.2117647, 0, 1, 1,
0.4291079, 1.019048, 1.985034, 0.2196078, 0, 1, 1,
0.4302318, 0.06811973, 0.784534, 0.2235294, 0, 1, 1,
0.4304835, 0.1838164, 3.533926, 0.2313726, 0, 1, 1,
0.4325083, -0.4043635, 2.839893, 0.2352941, 0, 1, 1,
0.437438, -0.6613849, 1.648639, 0.2431373, 0, 1, 1,
0.4395081, -1.181477, 1.290178, 0.2470588, 0, 1, 1,
0.4409828, 1.247065, -0.2014783, 0.254902, 0, 1, 1,
0.4413036, -0.5133173, 2.716809, 0.2588235, 0, 1, 1,
0.442078, 0.02164508, 0.7324492, 0.2666667, 0, 1, 1,
0.4441681, 0.6674322, 1.02819, 0.2705882, 0, 1, 1,
0.4453501, -0.5891386, 2.828465, 0.2784314, 0, 1, 1,
0.45394, 1.113367, -2.448839, 0.282353, 0, 1, 1,
0.4578724, 0.4833989, 1.322647, 0.2901961, 0, 1, 1,
0.4600829, -0.8712774, 1.509883, 0.2941177, 0, 1, 1,
0.4612563, -2.988689, 3.772523, 0.3019608, 0, 1, 1,
0.4622085, -0.1752694, 1.926527, 0.3098039, 0, 1, 1,
0.4631639, -1.057849, 3.343402, 0.3137255, 0, 1, 1,
0.4680466, 1.307, 0.7115649, 0.3215686, 0, 1, 1,
0.4755793, 0.3470621, 1.348169, 0.3254902, 0, 1, 1,
0.4766161, -0.2996825, -0.8918166, 0.3333333, 0, 1, 1,
0.4778779, -0.9479059, 2.178855, 0.3372549, 0, 1, 1,
0.4884984, -0.113244, -1.070872, 0.345098, 0, 1, 1,
0.4926298, -2.143612, 5.449374, 0.3490196, 0, 1, 1,
0.5063066, 0.9877164, 0.07999444, 0.3568628, 0, 1, 1,
0.5092489, -0.138607, 1.966735, 0.3607843, 0, 1, 1,
0.513361, 0.5430861, 1.623922, 0.3686275, 0, 1, 1,
0.5165148, 0.5959726, 1.853257, 0.372549, 0, 1, 1,
0.5206546, 0.7289281, -0.4282413, 0.3803922, 0, 1, 1,
0.5221556, 0.7883437, 0.9354903, 0.3843137, 0, 1, 1,
0.5227388, -0.3781098, 3.441189, 0.3921569, 0, 1, 1,
0.5243731, 0.7731289, -0.1150718, 0.3960784, 0, 1, 1,
0.5274691, 0.609279, 1.72353, 0.4039216, 0, 1, 1,
0.5302128, -0.09408151, 0.9392875, 0.4117647, 0, 1, 1,
0.5327417, 1.35922, -0.1965712, 0.4156863, 0, 1, 1,
0.5331084, -1.059449, 3.215475, 0.4235294, 0, 1, 1,
0.5339366, -0.4589017, 1.894291, 0.427451, 0, 1, 1,
0.5376603, 0.3424827, 1.05329, 0.4352941, 0, 1, 1,
0.5384011, -0.5269863, 2.598936, 0.4392157, 0, 1, 1,
0.5400453, -0.9287146, 3.037955, 0.4470588, 0, 1, 1,
0.5456304, -1.602589, 3.49225, 0.4509804, 0, 1, 1,
0.5571399, 2.112018, -0.8671995, 0.4588235, 0, 1, 1,
0.5574372, -1.609792, 2.550866, 0.4627451, 0, 1, 1,
0.5604394, 1.109327, 1.469806, 0.4705882, 0, 1, 1,
0.5702364, -0.4934256, 1.180342, 0.4745098, 0, 1, 1,
0.5710899, 0.1648572, 0.4702555, 0.4823529, 0, 1, 1,
0.5726314, -1.173423, 2.325636, 0.4862745, 0, 1, 1,
0.5758649, -0.7084114, 1.722651, 0.4941176, 0, 1, 1,
0.5945778, -0.8286423, 2.235014, 0.5019608, 0, 1, 1,
0.5947636, 0.9830713, 0.5018406, 0.5058824, 0, 1, 1,
0.5965825, -1.628005, 2.189024, 0.5137255, 0, 1, 1,
0.5978467, -0.2120366, -0.2540037, 0.5176471, 0, 1, 1,
0.6008026, -1.230658, 3.503307, 0.5254902, 0, 1, 1,
0.6036313, 0.4765275, 0.7376382, 0.5294118, 0, 1, 1,
0.6076143, -0.487121, 0.7135715, 0.5372549, 0, 1, 1,
0.6080282, 1.088054, 0.517428, 0.5411765, 0, 1, 1,
0.6122681, -0.2187165, 1.502191, 0.5490196, 0, 1, 1,
0.6249772, 1.673589, 0.2503108, 0.5529412, 0, 1, 1,
0.6288116, 0.4198531, 0.1111638, 0.5607843, 0, 1, 1,
0.6291193, -0.7485743, 2.782341, 0.5647059, 0, 1, 1,
0.6488197, -1.146439, 2.352154, 0.572549, 0, 1, 1,
0.6565226, -1.131684, 1.482199, 0.5764706, 0, 1, 1,
0.6574574, 0.3559255, 1.472672, 0.5843138, 0, 1, 1,
0.6622496, 0.7704914, 0.2338072, 0.5882353, 0, 1, 1,
0.6636448, 0.07024709, 1.702847, 0.5960785, 0, 1, 1,
0.6642675, -0.9443451, -0.2095354, 0.6039216, 0, 1, 1,
0.6650101, 0.6875885, 1.286771, 0.6078432, 0, 1, 1,
0.6812307, -1.019651, 2.436866, 0.6156863, 0, 1, 1,
0.684911, 0.3850226, 0.9713832, 0.6196079, 0, 1, 1,
0.6875991, -0.1782439, 2.824285, 0.627451, 0, 1, 1,
0.6905296, -0.05450378, 2.861044, 0.6313726, 0, 1, 1,
0.6906107, 0.1841285, 2.414031, 0.6392157, 0, 1, 1,
0.7003922, 0.942844, 0.3207183, 0.6431373, 0, 1, 1,
0.7064957, -1.446324, 0.1814176, 0.6509804, 0, 1, 1,
0.7065845, -0.9531074, 0.8128465, 0.654902, 0, 1, 1,
0.7090738, -2.986373, 3.513421, 0.6627451, 0, 1, 1,
0.7270607, -1.699947, 2.025094, 0.6666667, 0, 1, 1,
0.7278183, -0.8718495, 2.91936, 0.6745098, 0, 1, 1,
0.7477689, -0.4931968, 1.937802, 0.6784314, 0, 1, 1,
0.7479895, -0.5051781, 2.05029, 0.6862745, 0, 1, 1,
0.7596022, 0.05144072, 2.819506, 0.6901961, 0, 1, 1,
0.7598933, 0.4184724, 1.059563, 0.6980392, 0, 1, 1,
0.7619737, 1.499691, 0.1150418, 0.7058824, 0, 1, 1,
0.7629498, -0.4476659, 1.597095, 0.7098039, 0, 1, 1,
0.7630556, -0.3063603, 1.387208, 0.7176471, 0, 1, 1,
0.7657717, -0.240402, 3.411956, 0.7215686, 0, 1, 1,
0.7673649, 0.5442311, 0.8422953, 0.7294118, 0, 1, 1,
0.7679615, -0.980642, 2.083086, 0.7333333, 0, 1, 1,
0.7705747, 1.220912, 0.8547499, 0.7411765, 0, 1, 1,
0.7734697, -0.8102509, -0.2116958, 0.7450981, 0, 1, 1,
0.7803808, -0.2960576, 2.967865, 0.7529412, 0, 1, 1,
0.7828276, -0.972021, 5.657342, 0.7568628, 0, 1, 1,
0.7831959, -0.8686272, 2.760741, 0.7647059, 0, 1, 1,
0.7845498, -0.4983801, 3.211723, 0.7686275, 0, 1, 1,
0.7887, 0.1907804, 3.724281, 0.7764706, 0, 1, 1,
0.7938546, 0.3245968, 1.306409, 0.7803922, 0, 1, 1,
0.8006522, 1.268601, 0.5585462, 0.7882353, 0, 1, 1,
0.8010218, 0.1932968, 1.942236, 0.7921569, 0, 1, 1,
0.8022448, -1.412105, 3.516207, 0.8, 0, 1, 1,
0.8041174, 0.6152402, 0.7514839, 0.8078431, 0, 1, 1,
0.806386, 0.1139354, 0.2656552, 0.8117647, 0, 1, 1,
0.8187749, -0.2409949, 0.6397118, 0.8196079, 0, 1, 1,
0.8206663, -0.7119834, 2.936886, 0.8235294, 0, 1, 1,
0.827603, -1.094807, 3.714006, 0.8313726, 0, 1, 1,
0.8285792, -0.2118733, 1.521353, 0.8352941, 0, 1, 1,
0.8402126, -0.07836217, 2.555752, 0.8431373, 0, 1, 1,
0.8417364, -3.0807, 3.640417, 0.8470588, 0, 1, 1,
0.8464368, 0.2102175, 0.6738842, 0.854902, 0, 1, 1,
0.8592932, 0.7944214, 1.604878, 0.8588235, 0, 1, 1,
0.8661796, -0.4628163, 3.028944, 0.8666667, 0, 1, 1,
0.8736556, -0.7982619, 0.9978595, 0.8705882, 0, 1, 1,
0.8743804, -1.94046, 2.985324, 0.8784314, 0, 1, 1,
0.8772703, 0.5660147, 1.427255, 0.8823529, 0, 1, 1,
0.8797565, 0.4970836, 0.994978, 0.8901961, 0, 1, 1,
0.8814874, 0.04544584, 1.000881, 0.8941177, 0, 1, 1,
0.8942754, -1.289401, 2.143986, 0.9019608, 0, 1, 1,
0.9024901, -0.4156034, 1.987053, 0.9098039, 0, 1, 1,
0.903508, 0.537432, 0.5866324, 0.9137255, 0, 1, 1,
0.9075212, -0.4378718, 3.050473, 0.9215686, 0, 1, 1,
0.9103717, 0.02343263, 1.773896, 0.9254902, 0, 1, 1,
0.9115859, -1.47291, 2.491099, 0.9333333, 0, 1, 1,
0.9248001, -0.1179169, 2.491981, 0.9372549, 0, 1, 1,
0.9320652, -0.7966723, 2.092285, 0.945098, 0, 1, 1,
0.9325001, 2.979839, 1.927061, 0.9490196, 0, 1, 1,
0.9330738, 1.592859, 0.7160391, 0.9568627, 0, 1, 1,
0.9335636, -0.8441815, 5.076244, 0.9607843, 0, 1, 1,
0.9344406, -1.138062, 4.013202, 0.9686275, 0, 1, 1,
0.9357554, -0.9964811, 3.199604, 0.972549, 0, 1, 1,
0.9424383, 1.342639, 1.619165, 0.9803922, 0, 1, 1,
0.9453723, 0.7638545, 0.5947612, 0.9843137, 0, 1, 1,
0.9573649, 1.331929, 0.1958006, 0.9921569, 0, 1, 1,
0.9631452, -0.707626, 2.847821, 0.9960784, 0, 1, 1,
0.9643947, 0.272021, 0.7110181, 1, 0, 0.9960784, 1,
0.9670592, -0.1728313, 1.868023, 1, 0, 0.9882353, 1,
0.9721226, -0.5598044, 1.426322, 1, 0, 0.9843137, 1,
0.9721435, -0.5584922, 1.015677, 1, 0, 0.9764706, 1,
0.9730668, 0.461652, 1.185553, 1, 0, 0.972549, 1,
0.9777934, -1.364687, 2.508852, 1, 0, 0.9647059, 1,
0.9906713, 0.193642, -0.7666808, 1, 0, 0.9607843, 1,
0.9931189, 0.05439028, 2.396199, 1, 0, 0.9529412, 1,
0.9996674, 1.367779, 2.109414, 1, 0, 0.9490196, 1,
1.001903, 0.3961719, 1.840144, 1, 0, 0.9411765, 1,
1.005363, 0.142231, 2.741013, 1, 0, 0.9372549, 1,
1.011902, 0.7761815, 0.8549132, 1, 0, 0.9294118, 1,
1.019395, 0.1739977, 0.8059303, 1, 0, 0.9254902, 1,
1.021569, -0.6124514, 3.022414, 1, 0, 0.9176471, 1,
1.026505, -1.316251, 1.680465, 1, 0, 0.9137255, 1,
1.02744, 0.8133767, 1.922386, 1, 0, 0.9058824, 1,
1.027884, 0.6312385, 2.885413, 1, 0, 0.9019608, 1,
1.032326, 1.164738, 0.7510054, 1, 0, 0.8941177, 1,
1.033727, 0.2202551, 2.92677, 1, 0, 0.8862745, 1,
1.042018, -1.172, 2.536082, 1, 0, 0.8823529, 1,
1.043862, 0.9340435, 1.483063, 1, 0, 0.8745098, 1,
1.045618, 0.4757926, 0.4693868, 1, 0, 0.8705882, 1,
1.049629, -1.227948, 2.116182, 1, 0, 0.8627451, 1,
1.050903, 1.605963, 1.168814, 1, 0, 0.8588235, 1,
1.054471, -0.1380253, 1.618994, 1, 0, 0.8509804, 1,
1.073614, 0.548241, 1.631143, 1, 0, 0.8470588, 1,
1.076008, -1.954974, 1.873173, 1, 0, 0.8392157, 1,
1.079342, -0.2354984, 1.202987, 1, 0, 0.8352941, 1,
1.082988, -0.5949064, 1.899199, 1, 0, 0.827451, 1,
1.085286, 0.8608698, -0.5108621, 1, 0, 0.8235294, 1,
1.086492, -0.5799077, 1.996089, 1, 0, 0.8156863, 1,
1.09547, -0.006755413, 1.912722, 1, 0, 0.8117647, 1,
1.097612, 0.6975222, 0.622732, 1, 0, 0.8039216, 1,
1.101787, 1.555332, -0.1902977, 1, 0, 0.7960784, 1,
1.103721, 0.7004375, 1.838551, 1, 0, 0.7921569, 1,
1.109762, -1.168595, 2.145724, 1, 0, 0.7843137, 1,
1.111706, -1.290432, 1.661341, 1, 0, 0.7803922, 1,
1.119532, 0.7599885, 0.8931817, 1, 0, 0.772549, 1,
1.122653, -1.336541, 3.474941, 1, 0, 0.7686275, 1,
1.127691, -0.9179793, 2.207894, 1, 0, 0.7607843, 1,
1.132136, -0.3855429, 2.377626, 1, 0, 0.7568628, 1,
1.136813, 0.729096, -0.5814887, 1, 0, 0.7490196, 1,
1.166688, 0.9511724, -1.662351, 1, 0, 0.7450981, 1,
1.178466, 1.10182, 1.447833, 1, 0, 0.7372549, 1,
1.180529, -0.3396924, 1.4295, 1, 0, 0.7333333, 1,
1.188908, -0.2979465, 0.3948071, 1, 0, 0.7254902, 1,
1.191347, 0.5792408, 1.376009, 1, 0, 0.7215686, 1,
1.194966, 0.3123926, 1.137659, 1, 0, 0.7137255, 1,
1.199622, -0.5795971, 2.867886, 1, 0, 0.7098039, 1,
1.200854, 0.8745508, 1.02302, 1, 0, 0.7019608, 1,
1.202527, -1.506745, 2.41707, 1, 0, 0.6941177, 1,
1.203334, -2.288929, 1.675661, 1, 0, 0.6901961, 1,
1.214712, -0.5062268, 2.145813, 1, 0, 0.682353, 1,
1.216895, 0.2345761, 0.3324889, 1, 0, 0.6784314, 1,
1.217936, -0.8865461, 2.059848, 1, 0, 0.6705883, 1,
1.226213, -0.3545497, 2.06577, 1, 0, 0.6666667, 1,
1.22689, 0.2857079, 1.789606, 1, 0, 0.6588235, 1,
1.231448, -2.022893, 3.582003, 1, 0, 0.654902, 1,
1.235454, -0.2444442, 1.791299, 1, 0, 0.6470588, 1,
1.237293, 1.485335, 0.06537373, 1, 0, 0.6431373, 1,
1.245988, 0.9000396, 2.590658, 1, 0, 0.6352941, 1,
1.249414, -1.382154, 1.487555, 1, 0, 0.6313726, 1,
1.256013, 0.01139005, 0.9280777, 1, 0, 0.6235294, 1,
1.262505, 0.3279351, 1.954123, 1, 0, 0.6196079, 1,
1.268521, -0.5046376, 2.05213, 1, 0, 0.6117647, 1,
1.269241, 0.805355, -0.8952482, 1, 0, 0.6078432, 1,
1.274939, -0.5380735, 1.940959, 1, 0, 0.6, 1,
1.284577, 0.1398579, 0.8020129, 1, 0, 0.5921569, 1,
1.290214, -0.2554193, 1.688931, 1, 0, 0.5882353, 1,
1.290341, -1.594541, 2.412879, 1, 0, 0.5803922, 1,
1.303216, -0.9171184, 0.5351381, 1, 0, 0.5764706, 1,
1.303642, -0.6701337, 2.327467, 1, 0, 0.5686275, 1,
1.344005, -0.2566942, 3.453197, 1, 0, 0.5647059, 1,
1.345341, 0.2484285, 1.558536, 1, 0, 0.5568628, 1,
1.345669, -0.3533253, 0.9877369, 1, 0, 0.5529412, 1,
1.34683, 0.998368, 0.3765703, 1, 0, 0.5450981, 1,
1.349247, 0.2201883, 1.190613, 1, 0, 0.5411765, 1,
1.351153, -0.1292544, 1.828364, 1, 0, 0.5333334, 1,
1.351585, -1.860163, -0.1910621, 1, 0, 0.5294118, 1,
1.36407, -1.293229, 2.106704, 1, 0, 0.5215687, 1,
1.370289, 0.4815182, 2.551364, 1, 0, 0.5176471, 1,
1.373268, -0.3008559, 2.441607, 1, 0, 0.509804, 1,
1.381318, 0.05856046, 2.125615, 1, 0, 0.5058824, 1,
1.388758, 0.6132181, 2.63021, 1, 0, 0.4980392, 1,
1.391312, -0.3223748, 0.01125845, 1, 0, 0.4901961, 1,
1.39656, 1.81652, 1.666876, 1, 0, 0.4862745, 1,
1.402521, -0.3780296, 1.139904, 1, 0, 0.4784314, 1,
1.431116, -0.4991141, 2.191474, 1, 0, 0.4745098, 1,
1.431648, 0.4016881, 0.9884425, 1, 0, 0.4666667, 1,
1.434937, -1.745126, 1.984126, 1, 0, 0.4627451, 1,
1.435612, -0.00358065, 0.4173451, 1, 0, 0.454902, 1,
1.451264, 1.083422, 2.573621, 1, 0, 0.4509804, 1,
1.457798, 0.3689243, 1.747028, 1, 0, 0.4431373, 1,
1.46081, 0.3519756, 1.808675, 1, 0, 0.4392157, 1,
1.462026, -1.241483, 2.744286, 1, 0, 0.4313726, 1,
1.462725, -2.29987, 3.168372, 1, 0, 0.427451, 1,
1.463292, -0.5036071, 2.255356, 1, 0, 0.4196078, 1,
1.468218, -0.1363984, 1.541914, 1, 0, 0.4156863, 1,
1.480847, 2.550786, 0.4048287, 1, 0, 0.4078431, 1,
1.483778, 1.213989, 0.5174795, 1, 0, 0.4039216, 1,
1.486568, 0.9066015, 3.315064, 1, 0, 0.3960784, 1,
1.492127, -1.018159, 2.209852, 1, 0, 0.3882353, 1,
1.499959, 1.33059, 1.691899, 1, 0, 0.3843137, 1,
1.501022, -1.438047, 4.840338, 1, 0, 0.3764706, 1,
1.501495, -1.025193, 2.10756, 1, 0, 0.372549, 1,
1.510166, -2.30999, 0.6241795, 1, 0, 0.3647059, 1,
1.520405, 0.7773222, 1.996428, 1, 0, 0.3607843, 1,
1.52596, 0.1795364, 0.7649444, 1, 0, 0.3529412, 1,
1.535734, 0.07192603, 1.288381, 1, 0, 0.3490196, 1,
1.540644, 0.2934397, -0.9414984, 1, 0, 0.3411765, 1,
1.562392, 1.289124, -0.602824, 1, 0, 0.3372549, 1,
1.563316, 0.1361906, 1.631244, 1, 0, 0.3294118, 1,
1.583309, 0.4293163, 0.2258909, 1, 0, 0.3254902, 1,
1.585798, -0.814468, 2.106056, 1, 0, 0.3176471, 1,
1.587402, 1.513189, 0.2399312, 1, 0, 0.3137255, 1,
1.587463, -0.1343004, 3.813037, 1, 0, 0.3058824, 1,
1.591508, -0.4949144, 0.9857032, 1, 0, 0.2980392, 1,
1.604286, 0.3578167, 1.404641, 1, 0, 0.2941177, 1,
1.610303, 0.1956038, 0.7753484, 1, 0, 0.2862745, 1,
1.616966, -0.0007871032, 1.492916, 1, 0, 0.282353, 1,
1.618211, 1.200405, 1.402867, 1, 0, 0.2745098, 1,
1.621703, 1.021317, 1.232245, 1, 0, 0.2705882, 1,
1.622555, 1.032329, 1.450338, 1, 0, 0.2627451, 1,
1.630527, 0.4150576, 0.3385608, 1, 0, 0.2588235, 1,
1.635068, 0.1504184, -0.2189588, 1, 0, 0.2509804, 1,
1.640556, 0.7728562, -0.5752228, 1, 0, 0.2470588, 1,
1.643119, 1.147053, 0.02007919, 1, 0, 0.2392157, 1,
1.656477, -1.264306, 2.770793, 1, 0, 0.2352941, 1,
1.666166, -0.02341227, 3.339545, 1, 0, 0.227451, 1,
1.668873, -0.422814, 1.038743, 1, 0, 0.2235294, 1,
1.689601, -1.006636, 3.158896, 1, 0, 0.2156863, 1,
1.704991, -0.8023477, 2.00664, 1, 0, 0.2117647, 1,
1.744945, -0.01211519, 2.282028, 1, 0, 0.2039216, 1,
1.753064, 1.462543, 1.076842, 1, 0, 0.1960784, 1,
1.767681, 0.1384668, 2.251468, 1, 0, 0.1921569, 1,
1.774942, -0.2142927, 1.513323, 1, 0, 0.1843137, 1,
1.850353, 0.02317974, -0.2115694, 1, 0, 0.1803922, 1,
1.860022, 1.549102, 0.5591851, 1, 0, 0.172549, 1,
1.863111, 0.07734773, 2.529666, 1, 0, 0.1686275, 1,
1.868456, 0.6538157, 1.093164, 1, 0, 0.1607843, 1,
1.874914, -0.03977484, 0.8870185, 1, 0, 0.1568628, 1,
1.882114, 0.4690698, 1.842284, 1, 0, 0.1490196, 1,
1.900295, 0.3639748, 1.979317, 1, 0, 0.145098, 1,
1.907487, -0.61136, 1.827343, 1, 0, 0.1372549, 1,
1.910666, 0.4017372, 0.7457815, 1, 0, 0.1333333, 1,
1.945212, 0.7434345, 1.51607, 1, 0, 0.1254902, 1,
1.970297, -0.2550389, 1.143767, 1, 0, 0.1215686, 1,
1.989687, -1.007876, 3.763308, 1, 0, 0.1137255, 1,
1.996733, 0.8099376, 0.9245803, 1, 0, 0.1098039, 1,
2.011965, 0.174684, 0.9685681, 1, 0, 0.1019608, 1,
2.014188, 0.6500476, 0.372795, 1, 0, 0.09411765, 1,
2.033616, -1.610144, 3.093059, 1, 0, 0.09019608, 1,
2.052675, 0.992083, -0.1501736, 1, 0, 0.08235294, 1,
2.063088, -1.019068, 3.460222, 1, 0, 0.07843138, 1,
2.107145, -0.3139371, 2.116142, 1, 0, 0.07058824, 1,
2.140269, -0.9846833, 2.62009, 1, 0, 0.06666667, 1,
2.145222, -1.086013, 1.823232, 1, 0, 0.05882353, 1,
2.166926, -0.7452465, 0.6821436, 1, 0, 0.05490196, 1,
2.179468, -0.4481977, 3.418849, 1, 0, 0.04705882, 1,
2.223728, 0.4262517, 0.02079551, 1, 0, 0.04313726, 1,
2.379045, 0.3903914, 1.134996, 1, 0, 0.03529412, 1,
2.421569, -0.09326486, 2.59001, 1, 0, 0.03137255, 1,
2.5261, 0.634667, -0.2803639, 1, 0, 0.02352941, 1,
2.560731, 1.561364, -1.282681, 1, 0, 0.01960784, 1,
2.601859, 0.573576, -0.472476, 1, 0, 0.01176471, 1,
2.857175, 0.5336179, 1.770674, 1, 0, 0.007843138, 1
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
-0.07670784, -4.146288, -7.728867, 0, -0.5, 0.5, 0.5,
-0.07670784, -4.146288, -7.728867, 1, -0.5, 0.5, 0.5,
-0.07670784, -4.146288, -7.728867, 1, 1.5, 0.5, 0.5,
-0.07670784, -4.146288, -7.728867, 0, 1.5, 0.5, 0.5
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
-4.005177, 0.06262863, -7.728867, 0, -0.5, 0.5, 0.5,
-4.005177, 0.06262863, -7.728867, 1, -0.5, 0.5, 0.5,
-4.005177, 0.06262863, -7.728867, 1, 1.5, 0.5, 0.5,
-4.005177, 0.06262863, -7.728867, 0, 1.5, 0.5, 0.5
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
-4.005177, -4.146288, -0.06570578, 0, -0.5, 0.5, 0.5,
-4.005177, -4.146288, -0.06570578, 1, -0.5, 0.5, 0.5,
-4.005177, -4.146288, -0.06570578, 1, 1.5, 0.5, 0.5,
-4.005177, -4.146288, -0.06570578, 0, 1.5, 0.5, 0.5
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
-3, -3.175, -5.960445,
2, -3.175, -5.960445,
-3, -3.175, -5.960445,
-3, -3.336881, -6.255182,
-2, -3.175, -5.960445,
-2, -3.336881, -6.255182,
-1, -3.175, -5.960445,
-1, -3.336881, -6.255182,
0, -3.175, -5.960445,
0, -3.336881, -6.255182,
1, -3.175, -5.960445,
1, -3.336881, -6.255182,
2, -3.175, -5.960445,
2, -3.336881, -6.255182
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
-3, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
-3, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
-3, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
-3, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5,
-2, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
-2, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
-2, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
-2, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5,
-1, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
-1, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
-1, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
-1, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5,
0, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
0, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
0, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
0, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5,
1, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
1, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
1, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
1, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5,
2, -3.660644, -6.844656, 0, -0.5, 0.5, 0.5,
2, -3.660644, -6.844656, 1, -0.5, 0.5, 0.5,
2, -3.660644, -6.844656, 1, 1.5, 0.5, 0.5,
2, -3.660644, -6.844656, 0, 1.5, 0.5, 0.5
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
-3.098607, -3, -5.960445,
-3.098607, 3, -5.960445,
-3.098607, -3, -5.960445,
-3.249702, -3, -6.255182,
-3.098607, -2, -5.960445,
-3.249702, -2, -6.255182,
-3.098607, -1, -5.960445,
-3.249702, -1, -6.255182,
-3.098607, 0, -5.960445,
-3.249702, 0, -6.255182,
-3.098607, 1, -5.960445,
-3.249702, 1, -6.255182,
-3.098607, 2, -5.960445,
-3.249702, 2, -6.255182,
-3.098607, 3, -5.960445,
-3.249702, 3, -6.255182
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
-3.551892, -3, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, -3, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, -3, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, -3, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, -2, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, -2, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, -2, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, -2, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, -1, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, -1, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, -1, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, -1, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, 0, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, 0, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, 0, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, 0, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, 1, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, 1, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, 1, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, 1, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, 2, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, 2, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, 2, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, 2, -6.844656, 0, 1.5, 0.5, 0.5,
-3.551892, 3, -6.844656, 0, -0.5, 0.5, 0.5,
-3.551892, 3, -6.844656, 1, -0.5, 0.5, 0.5,
-3.551892, 3, -6.844656, 1, 1.5, 0.5, 0.5,
-3.551892, 3, -6.844656, 0, 1.5, 0.5, 0.5
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
-3.098607, -3.175, -4,
-3.098607, -3.175, 4,
-3.098607, -3.175, -4,
-3.249702, -3.336881, -4,
-3.098607, -3.175, -2,
-3.249702, -3.336881, -2,
-3.098607, -3.175, 0,
-3.249702, -3.336881, 0,
-3.098607, -3.175, 2,
-3.249702, -3.336881, 2,
-3.098607, -3.175, 4,
-3.249702, -3.336881, 4
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
-3.551892, -3.660644, -4, 0, -0.5, 0.5, 0.5,
-3.551892, -3.660644, -4, 1, -0.5, 0.5, 0.5,
-3.551892, -3.660644, -4, 1, 1.5, 0.5, 0.5,
-3.551892, -3.660644, -4, 0, 1.5, 0.5, 0.5,
-3.551892, -3.660644, -2, 0, -0.5, 0.5, 0.5,
-3.551892, -3.660644, -2, 1, -0.5, 0.5, 0.5,
-3.551892, -3.660644, -2, 1, 1.5, 0.5, 0.5,
-3.551892, -3.660644, -2, 0, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 0, 0, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 0, 1, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 0, 1, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 0, 0, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 2, 0, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 2, 1, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 2, 1, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 2, 0, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 4, 0, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 4, 1, -0.5, 0.5, 0.5,
-3.551892, -3.660644, 4, 1, 1.5, 0.5, 0.5,
-3.551892, -3.660644, 4, 0, 1.5, 0.5, 0.5
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
-3.098607, -3.175, -5.960445,
-3.098607, 3.300257, -5.960445,
-3.098607, -3.175, 5.829033,
-3.098607, 3.300257, 5.829033,
-3.098607, -3.175, -5.960445,
-3.098607, -3.175, 5.829033,
-3.098607, 3.300257, -5.960445,
-3.098607, 3.300257, 5.829033,
-3.098607, -3.175, -5.960445,
2.945191, -3.175, -5.960445,
-3.098607, -3.175, 5.829033,
2.945191, -3.175, 5.829033,
-3.098607, 3.300257, -5.960445,
2.945191, 3.300257, -5.960445,
-3.098607, 3.300257, 5.829033,
2.945191, 3.300257, 5.829033,
2.945191, -3.175, -5.960445,
2.945191, 3.300257, -5.960445,
2.945191, -3.175, 5.829033,
2.945191, 3.300257, 5.829033,
2.945191, -3.175, -5.960445,
2.945191, -3.175, 5.829033,
2.945191, 3.300257, -5.960445,
2.945191, 3.300257, 5.829033
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
var radius = 7.874145;
var distance = 35.03296;
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
mvMatrix.translate( 0.07670784, -0.06262863, 0.06570578 );
mvMatrix.scale( 1.408664, 1.314802, 0.7221422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03296);
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


