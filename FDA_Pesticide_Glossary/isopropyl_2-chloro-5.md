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
-3.141843, -0.3199178, -3.49029, 1, 0, 0, 1,
-2.749427, -0.6100176, -2.122654, 1, 0.007843138, 0, 1,
-2.651494, 1.14817, 1.427074, 1, 0.01176471, 0, 1,
-2.566923, 0.5330471, -1.591457, 1, 0.01960784, 0, 1,
-2.510908, -1.491353, -0.3622949, 1, 0.02352941, 0, 1,
-2.483237, 2.302769, -1.350322, 1, 0.03137255, 0, 1,
-2.394251, 0.648354, -1.559459, 1, 0.03529412, 0, 1,
-2.376963, 1.14212, -1.618921, 1, 0.04313726, 0, 1,
-2.264228, -1.447601, -3.755338, 1, 0.04705882, 0, 1,
-2.224766, 1.732952, 0.2911026, 1, 0.05490196, 0, 1,
-2.197643, -0.7952713, -1.607871, 1, 0.05882353, 0, 1,
-2.195971, 0.3325981, -0.8555542, 1, 0.06666667, 0, 1,
-2.184853, 0.4692219, 0.8290943, 1, 0.07058824, 0, 1,
-2.157202, -0.03527286, -3.270775, 1, 0.07843138, 0, 1,
-2.143579, -0.4992205, -1.818904, 1, 0.08235294, 0, 1,
-2.141853, -0.02092657, -1.36075, 1, 0.09019608, 0, 1,
-2.102855, -1.461648, -2.834949, 1, 0.09411765, 0, 1,
-2.070914, 1.461904, -0.904936, 1, 0.1019608, 0, 1,
-2.056814, 1.774435, -1.380491, 1, 0.1098039, 0, 1,
-2.014093, 0.3937958, -1.22725, 1, 0.1137255, 0, 1,
-1.995757, 0.8633769, -2.549891, 1, 0.1215686, 0, 1,
-1.950188, 0.8091124, -2.63637, 1, 0.1254902, 0, 1,
-1.945288, 1.269788, 0.7783298, 1, 0.1333333, 0, 1,
-1.931093, 1.025504, -1.067338, 1, 0.1372549, 0, 1,
-1.919695, 0.1006934, -1.458043, 1, 0.145098, 0, 1,
-1.916637, 0.4146232, -0.7348432, 1, 0.1490196, 0, 1,
-1.913067, -0.5114979, -0.2024883, 1, 0.1568628, 0, 1,
-1.911795, 0.1412257, -1.08426, 1, 0.1607843, 0, 1,
-1.903151, -0.4238074, -2.222674, 1, 0.1686275, 0, 1,
-1.895903, -0.2273978, -1.601112, 1, 0.172549, 0, 1,
-1.888475, -0.253101, -2.930208, 1, 0.1803922, 0, 1,
-1.863531, -0.1552123, -3.204021, 1, 0.1843137, 0, 1,
-1.854465, -0.1350726, -1.401993, 1, 0.1921569, 0, 1,
-1.825284, 0.4644029, -1.503888, 1, 0.1960784, 0, 1,
-1.810854, 1.806147, -2.259536, 1, 0.2039216, 0, 1,
-1.773761, -1.326547, -1.926009, 1, 0.2117647, 0, 1,
-1.750729, -0.05796184, -1.436396, 1, 0.2156863, 0, 1,
-1.746981, 0.07340301, -1.033124, 1, 0.2235294, 0, 1,
-1.739657, 1.858815, 0.1770471, 1, 0.227451, 0, 1,
-1.737631, -1.143565, -2.903285, 1, 0.2352941, 0, 1,
-1.736801, -0.5573252, -1.663229, 1, 0.2392157, 0, 1,
-1.722574, -1.793913, -0.736648, 1, 0.2470588, 0, 1,
-1.696646, -0.7947634, -1.290625, 1, 0.2509804, 0, 1,
-1.693964, 0.1136359, -1.286907, 1, 0.2588235, 0, 1,
-1.693644, -0.8827273, -2.248107, 1, 0.2627451, 0, 1,
-1.689221, -0.4193755, -0.6538939, 1, 0.2705882, 0, 1,
-1.682835, -0.9942268, -1.249427, 1, 0.2745098, 0, 1,
-1.676316, 0.384005, -2.651837, 1, 0.282353, 0, 1,
-1.665185, -0.5763154, -3.162053, 1, 0.2862745, 0, 1,
-1.662333, 1.258735, -1.991709, 1, 0.2941177, 0, 1,
-1.650636, 1.241064, -0.9883622, 1, 0.3019608, 0, 1,
-1.648214, -0.7005811, -2.411811, 1, 0.3058824, 0, 1,
-1.644351, -0.5970004, -0.998405, 1, 0.3137255, 0, 1,
-1.634364, 0.1441989, -1.433281, 1, 0.3176471, 0, 1,
-1.612768, -0.6956485, -2.363855, 1, 0.3254902, 0, 1,
-1.601239, -1.046776, -1.445625, 1, 0.3294118, 0, 1,
-1.60118, 0.9727124, 0.4814356, 1, 0.3372549, 0, 1,
-1.595522, -0.7557955, -2.867914, 1, 0.3411765, 0, 1,
-1.5936, -2.234646, -1.005205, 1, 0.3490196, 0, 1,
-1.581486, -0.8812261, -2.848517, 1, 0.3529412, 0, 1,
-1.574211, 0.5710369, -1.613139, 1, 0.3607843, 0, 1,
-1.571497, -1.050435, -2.263672, 1, 0.3647059, 0, 1,
-1.564329, 0.6919073, -2.102818, 1, 0.372549, 0, 1,
-1.551855, -0.9769976, -4.062066, 1, 0.3764706, 0, 1,
-1.550787, 1.271251, 0.3251282, 1, 0.3843137, 0, 1,
-1.544186, -0.3255365, -1.427424, 1, 0.3882353, 0, 1,
-1.531496, -0.08272817, -1.951659, 1, 0.3960784, 0, 1,
-1.530061, -1.598689, -2.300825, 1, 0.4039216, 0, 1,
-1.527118, -1.607833, -2.326932, 1, 0.4078431, 0, 1,
-1.523357, -2.393394, -3.239311, 1, 0.4156863, 0, 1,
-1.521435, -1.477064, -2.168087, 1, 0.4196078, 0, 1,
-1.52102, 0.3854921, -2.332899, 1, 0.427451, 0, 1,
-1.515177, 0.8777048, -1.425063, 1, 0.4313726, 0, 1,
-1.506293, 0.484696, -1.355069, 1, 0.4392157, 0, 1,
-1.49613, 0.4944446, -2.866569, 1, 0.4431373, 0, 1,
-1.488702, -1.599013, -2.956542, 1, 0.4509804, 0, 1,
-1.484159, -0.1416885, -2.028709, 1, 0.454902, 0, 1,
-1.483955, -0.05421738, -0.9685708, 1, 0.4627451, 0, 1,
-1.462303, -0.5615821, -2.366223, 1, 0.4666667, 0, 1,
-1.45757, 1.647373, 0.1286609, 1, 0.4745098, 0, 1,
-1.455241, 0.08578867, -0.03689762, 1, 0.4784314, 0, 1,
-1.455209, -0.2612676, -1.271289, 1, 0.4862745, 0, 1,
-1.447696, 0.8211085, -1.919901, 1, 0.4901961, 0, 1,
-1.43913, 0.5078403, -1.725028, 1, 0.4980392, 0, 1,
-1.422404, 0.560893, -0.2830279, 1, 0.5058824, 0, 1,
-1.417155, 0.7380684, -1.58963, 1, 0.509804, 0, 1,
-1.408697, -0.5425881, -1.600244, 1, 0.5176471, 0, 1,
-1.397939, -0.4474092, -0.8533927, 1, 0.5215687, 0, 1,
-1.397893, 0.5159633, -1.969586, 1, 0.5294118, 0, 1,
-1.386451, 0.8663046, -2.097033, 1, 0.5333334, 0, 1,
-1.372652, -1.035974, -2.798085, 1, 0.5411765, 0, 1,
-1.36928, -0.1412445, -2.767012, 1, 0.5450981, 0, 1,
-1.366745, -1.457432, -3.707648, 1, 0.5529412, 0, 1,
-1.365853, 1.599249, -2.406175, 1, 0.5568628, 0, 1,
-1.360604, 1.830883, -0.05975382, 1, 0.5647059, 0, 1,
-1.356289, 1.467009, -0.2218068, 1, 0.5686275, 0, 1,
-1.322938, -2.140618, -0.9193329, 1, 0.5764706, 0, 1,
-1.322106, 0.4828556, -2.590688, 1, 0.5803922, 0, 1,
-1.320827, 1.000892, -1.912708, 1, 0.5882353, 0, 1,
-1.305693, 0.1484889, -1.413808, 1, 0.5921569, 0, 1,
-1.300173, -0.8837175, -2.850701, 1, 0.6, 0, 1,
-1.298468, -0.296853, -3.082574, 1, 0.6078432, 0, 1,
-1.297654, -1.088657, -4.066095, 1, 0.6117647, 0, 1,
-1.281992, 0.2435585, -1.28493, 1, 0.6196079, 0, 1,
-1.27956, -0.2978061, -2.061566, 1, 0.6235294, 0, 1,
-1.276984, -0.4218192, -1.728018, 1, 0.6313726, 0, 1,
-1.271996, -0.9020323, -1.352167, 1, 0.6352941, 0, 1,
-1.262046, 1.846042, -2.389647, 1, 0.6431373, 0, 1,
-1.2592, -1.955237, -2.548127, 1, 0.6470588, 0, 1,
-1.257684, -1.180714, -2.434202, 1, 0.654902, 0, 1,
-1.257271, -1.152643, -2.98254, 1, 0.6588235, 0, 1,
-1.247196, 2.219209, -0.9734825, 1, 0.6666667, 0, 1,
-1.243399, 0.01222294, -1.541427, 1, 0.6705883, 0, 1,
-1.237413, 0.4851633, -2.388386, 1, 0.6784314, 0, 1,
-1.23425, 1.193659, -2.935998, 1, 0.682353, 0, 1,
-1.233629, -0.7392694, -0.6153288, 1, 0.6901961, 0, 1,
-1.229887, 0.4031574, -1.680743, 1, 0.6941177, 0, 1,
-1.227029, 0.8835806, -0.01475307, 1, 0.7019608, 0, 1,
-1.224521, 0.6848745, -1.776418, 1, 0.7098039, 0, 1,
-1.213605, 0.01412868, -1.575156, 1, 0.7137255, 0, 1,
-1.208875, 0.3902078, -2.318789, 1, 0.7215686, 0, 1,
-1.201116, -0.1658371, 0.09453841, 1, 0.7254902, 0, 1,
-1.199012, -0.7536356, -1.884075, 1, 0.7333333, 0, 1,
-1.198177, 0.9978682, -1.71005, 1, 0.7372549, 0, 1,
-1.183507, 0.2899045, -1.362472, 1, 0.7450981, 0, 1,
-1.18252, -1.305058, -3.570225, 1, 0.7490196, 0, 1,
-1.18048, -0.3060452, -1.828228, 1, 0.7568628, 0, 1,
-1.175831, 1.76125, -0.6043286, 1, 0.7607843, 0, 1,
-1.164579, 0.6264201, -1.432869, 1, 0.7686275, 0, 1,
-1.157866, 0.5953918, -1.358925, 1, 0.772549, 0, 1,
-1.155069, -1.195534, -2.148268, 1, 0.7803922, 0, 1,
-1.151877, 1.863007, -0.7997097, 1, 0.7843137, 0, 1,
-1.151249, 1.892915, -0.2409755, 1, 0.7921569, 0, 1,
-1.140555, -0.2572631, -1.368759, 1, 0.7960784, 0, 1,
-1.138931, -0.03751208, -1.956293, 1, 0.8039216, 0, 1,
-1.1341, -0.3934907, -2.914049, 1, 0.8117647, 0, 1,
-1.133624, 1.231865, -1.153593, 1, 0.8156863, 0, 1,
-1.133143, 1.674645, -0.04344122, 1, 0.8235294, 0, 1,
-1.13117, -0.888459, -3.001418, 1, 0.827451, 0, 1,
-1.130037, 0.8358129, 0.03602447, 1, 0.8352941, 0, 1,
-1.128244, 1.419489, 0.7985357, 1, 0.8392157, 0, 1,
-1.110553, 0.4080609, -0.5187572, 1, 0.8470588, 0, 1,
-1.110549, 0.441245, -1.827776, 1, 0.8509804, 0, 1,
-1.103884, -0.1896289, -3.391922, 1, 0.8588235, 0, 1,
-1.099877, -1.770636, -3.308831, 1, 0.8627451, 0, 1,
-1.096124, -0.5322562, -0.198146, 1, 0.8705882, 0, 1,
-1.094179, 0.0895242, -1.672623, 1, 0.8745098, 0, 1,
-1.092525, -0.5127053, -2.89729, 1, 0.8823529, 0, 1,
-1.082064, 2.450019, 1.370181, 1, 0.8862745, 0, 1,
-1.080249, 1.017386, -0.8501551, 1, 0.8941177, 0, 1,
-1.074407, 1.336726, -1.854107, 1, 0.8980392, 0, 1,
-1.068235, -0.6205879, -2.031022, 1, 0.9058824, 0, 1,
-1.066653, -0.340472, -0.7034225, 1, 0.9137255, 0, 1,
-1.061515, 0.7215943, -1.37739, 1, 0.9176471, 0, 1,
-1.061046, 1.084722, 1.125434, 1, 0.9254902, 0, 1,
-1.059653, -0.9779386, -2.293884, 1, 0.9294118, 0, 1,
-1.050146, -0.9326537, -1.79435, 1, 0.9372549, 0, 1,
-1.043285, 0.3947824, -2.271363, 1, 0.9411765, 0, 1,
-1.040107, 0.6172975, -0.3363199, 1, 0.9490196, 0, 1,
-1.039759, 0.44177, -2.43888, 1, 0.9529412, 0, 1,
-1.038672, -0.4203971, -2.194309, 1, 0.9607843, 0, 1,
-1.038055, 1.35399, -0.4266514, 1, 0.9647059, 0, 1,
-1.026904, -1.104843, -2.197666, 1, 0.972549, 0, 1,
-1.021396, -1.039909, -1.391835, 1, 0.9764706, 0, 1,
-1.019922, 0.3141766, -1.432559, 1, 0.9843137, 0, 1,
-1.017798, 1.887836, -1.230939, 1, 0.9882353, 0, 1,
-1.007861, 1.848942, -0.3951249, 1, 0.9960784, 0, 1,
-1.00743, -0.06340366, -1.856862, 0.9960784, 1, 0, 1,
-1.004877, -0.1132431, -2.032869, 0.9921569, 1, 0, 1,
-0.9986276, -0.5182338, -1.788021, 0.9843137, 1, 0, 1,
-0.9886077, 2.152465, 0.06370322, 0.9803922, 1, 0, 1,
-0.9851729, -1.04002, -2.199924, 0.972549, 1, 0, 1,
-0.9849299, -1.719773, -1.529944, 0.9686275, 1, 0, 1,
-0.9838478, -2.340272, -2.548973, 0.9607843, 1, 0, 1,
-0.9780526, -0.4113666, -3.830206, 0.9568627, 1, 0, 1,
-0.9756373, 0.1894099, -1.082444, 0.9490196, 1, 0, 1,
-0.9725072, -0.2705885, -3.900361, 0.945098, 1, 0, 1,
-0.9710353, 0.7502987, 1.419884, 0.9372549, 1, 0, 1,
-0.9653719, 0.8410923, 0.224141, 0.9333333, 1, 0, 1,
-0.9589569, 1.416234, -1.096263, 0.9254902, 1, 0, 1,
-0.9568523, 1.941917, -1.45733, 0.9215686, 1, 0, 1,
-0.9520055, -0.7527903, 0.2306781, 0.9137255, 1, 0, 1,
-0.9423327, -1.038275, -0.9546587, 0.9098039, 1, 0, 1,
-0.9414728, -1.037247, -3.721912, 0.9019608, 1, 0, 1,
-0.9372517, -2.0065, -2.721766, 0.8941177, 1, 0, 1,
-0.9361598, 0.3561522, -2.12755, 0.8901961, 1, 0, 1,
-0.9335335, 1.531486, -1.720855, 0.8823529, 1, 0, 1,
-0.9321331, -0.9482875, -1.732557, 0.8784314, 1, 0, 1,
-0.9302695, 1.116872, 0.5206063, 0.8705882, 1, 0, 1,
-0.9260693, 2.070157, -2.329996, 0.8666667, 1, 0, 1,
-0.9240099, 1.349706, 0.363231, 0.8588235, 1, 0, 1,
-0.9236658, 0.8349462, 0.1808981, 0.854902, 1, 0, 1,
-0.9221919, 0.4309641, -0.8793098, 0.8470588, 1, 0, 1,
-0.9106179, 1.940973, 0.3317785, 0.8431373, 1, 0, 1,
-0.9063629, 0.330553, -2.618895, 0.8352941, 1, 0, 1,
-0.9051018, 0.1774715, -0.2648533, 0.8313726, 1, 0, 1,
-0.8961887, -0.9246523, -3.452346, 0.8235294, 1, 0, 1,
-0.8943271, 0.7347621, -0.4657272, 0.8196079, 1, 0, 1,
-0.8909032, 1.171854, -0.2157187, 0.8117647, 1, 0, 1,
-0.8874556, -0.1309305, -1.399707, 0.8078431, 1, 0, 1,
-0.8806178, -0.4708767, -2.188357, 0.8, 1, 0, 1,
-0.8753068, 1.31393, 0.6474647, 0.7921569, 1, 0, 1,
-0.8730094, -1.035481, -0.8617107, 0.7882353, 1, 0, 1,
-0.872142, -2.76492, -4.071484, 0.7803922, 1, 0, 1,
-0.8715588, 0.2145144, -2.964921, 0.7764706, 1, 0, 1,
-0.8715375, -1.330287, -2.852255, 0.7686275, 1, 0, 1,
-0.8709407, 1.181266, -0.6265665, 0.7647059, 1, 0, 1,
-0.866326, 1.944496, -3.039133, 0.7568628, 1, 0, 1,
-0.8653924, 1.021549, 0.1494081, 0.7529412, 1, 0, 1,
-0.860526, 0.3765028, -1.681877, 0.7450981, 1, 0, 1,
-0.8596693, -0.6313874, -0.9020125, 0.7411765, 1, 0, 1,
-0.8596079, 0.1064552, -2.797467, 0.7333333, 1, 0, 1,
-0.8503891, 0.7324743, 0.3760454, 0.7294118, 1, 0, 1,
-0.8487578, 1.494208, 1.118701, 0.7215686, 1, 0, 1,
-0.8486678, 0.3171676, -1.625461, 0.7176471, 1, 0, 1,
-0.8477423, 0.1376035, -0.2014019, 0.7098039, 1, 0, 1,
-0.8464771, -0.9741089, -2.501221, 0.7058824, 1, 0, 1,
-0.8456537, 0.2832464, -1.236772, 0.6980392, 1, 0, 1,
-0.8415475, 1.391384, 0.9469988, 0.6901961, 1, 0, 1,
-0.8392625, -2.033368, -3.110604, 0.6862745, 1, 0, 1,
-0.8368813, -1.54023, -3.00867, 0.6784314, 1, 0, 1,
-0.8317267, -0.00477567, -3.154554, 0.6745098, 1, 0, 1,
-0.8296514, -0.09319136, -2.755087, 0.6666667, 1, 0, 1,
-0.8264864, -1.611416, -3.841917, 0.6627451, 1, 0, 1,
-0.823837, 2.667019, -0.5030332, 0.654902, 1, 0, 1,
-0.812088, -1.11944, -2.361388, 0.6509804, 1, 0, 1,
-0.8098254, -0.4397922, -0.3428485, 0.6431373, 1, 0, 1,
-0.8091266, -1.828679, -2.328175, 0.6392157, 1, 0, 1,
-0.8089622, -1.062277, -0.3580571, 0.6313726, 1, 0, 1,
-0.8073983, -0.3683974, -4.365587, 0.627451, 1, 0, 1,
-0.8004443, 0.4318515, -0.7798017, 0.6196079, 1, 0, 1,
-0.7966551, 0.541931, -1.415376, 0.6156863, 1, 0, 1,
-0.7961007, -0.5695853, -4.103267, 0.6078432, 1, 0, 1,
-0.7854277, -1.470201, -2.85616, 0.6039216, 1, 0, 1,
-0.7775137, 0.01763904, -1.39213, 0.5960785, 1, 0, 1,
-0.7731161, 1.257101, -1.292618, 0.5882353, 1, 0, 1,
-0.7687558, 0.7693742, -1.288976, 0.5843138, 1, 0, 1,
-0.762364, 0.4482722, -1.614963, 0.5764706, 1, 0, 1,
-0.7617279, -1.145765, -3.193076, 0.572549, 1, 0, 1,
-0.7605453, -1.219876, -3.147033, 0.5647059, 1, 0, 1,
-0.758246, 0.5814264, -0.2883841, 0.5607843, 1, 0, 1,
-0.7571259, -0.5015442, -3.592408, 0.5529412, 1, 0, 1,
-0.7535154, -0.3986266, -2.5457, 0.5490196, 1, 0, 1,
-0.7444833, 0.8052133, 0.4007187, 0.5411765, 1, 0, 1,
-0.7404943, 0.2772551, -2.433472, 0.5372549, 1, 0, 1,
-0.73654, -1.025679, -1.634769, 0.5294118, 1, 0, 1,
-0.7357438, 1.23323, 0.4162161, 0.5254902, 1, 0, 1,
-0.7314386, -0.5924196, -0.7871999, 0.5176471, 1, 0, 1,
-0.7262921, 0.1012554, -1.371674, 0.5137255, 1, 0, 1,
-0.7241229, 1.523229, 0.8658133, 0.5058824, 1, 0, 1,
-0.7233885, 0.4455066, -2.133285, 0.5019608, 1, 0, 1,
-0.7221333, 1.39794, 0.2094675, 0.4941176, 1, 0, 1,
-0.7194495, 0.07826792, -1.981065, 0.4862745, 1, 0, 1,
-0.7192616, 0.6956671, -1.165969, 0.4823529, 1, 0, 1,
-0.7151494, -0.7955313, -3.880812, 0.4745098, 1, 0, 1,
-0.7128919, 0.9414925, -1.325509, 0.4705882, 1, 0, 1,
-0.712349, 1.515445, -1.033749, 0.4627451, 1, 0, 1,
-0.7022606, -0.2464598, -1.361616, 0.4588235, 1, 0, 1,
-0.6920336, -0.1084594, -1.991035, 0.4509804, 1, 0, 1,
-0.6920046, 1.179966, -1.444622, 0.4470588, 1, 0, 1,
-0.6911008, -0.05317167, -2.773838, 0.4392157, 1, 0, 1,
-0.6851104, -1.279626, -2.586798, 0.4352941, 1, 0, 1,
-0.6819922, 1.376232, -2.219825, 0.427451, 1, 0, 1,
-0.6768702, 0.2073078, 0.8002913, 0.4235294, 1, 0, 1,
-0.6762801, -0.01510668, -0.8885104, 0.4156863, 1, 0, 1,
-0.6735911, -0.2262428, -4.103962, 0.4117647, 1, 0, 1,
-0.6730235, 0.3039911, -1.668993, 0.4039216, 1, 0, 1,
-0.6718944, -1.154943, -2.210408, 0.3960784, 1, 0, 1,
-0.6690193, -0.04871964, -1.975962, 0.3921569, 1, 0, 1,
-0.6652385, -0.2906641, -0.6581789, 0.3843137, 1, 0, 1,
-0.6629966, -0.9863312, -1.945115, 0.3803922, 1, 0, 1,
-0.6609339, 0.8956653, 1.380031, 0.372549, 1, 0, 1,
-0.6578611, -0.0421675, -2.233328, 0.3686275, 1, 0, 1,
-0.6538938, 0.5086664, -1.351696, 0.3607843, 1, 0, 1,
-0.6509901, -0.02021522, -2.519058, 0.3568628, 1, 0, 1,
-0.6488063, 1.523943, 0.02269096, 0.3490196, 1, 0, 1,
-0.6465725, 0.1412192, 0.2897066, 0.345098, 1, 0, 1,
-0.6454923, 0.7512778, -1.225694, 0.3372549, 1, 0, 1,
-0.6395295, -0.1027179, -2.063386, 0.3333333, 1, 0, 1,
-0.6353487, -1.752453, -1.852015, 0.3254902, 1, 0, 1,
-0.6324107, 0.04501847, -0.7334718, 0.3215686, 1, 0, 1,
-0.6277596, 0.9258733, 1.126284, 0.3137255, 1, 0, 1,
-0.6277018, -0.1549837, -2.44292, 0.3098039, 1, 0, 1,
-0.627622, -0.8715577, -4.000918, 0.3019608, 1, 0, 1,
-0.6074606, 0.8876125, -0.6474583, 0.2941177, 1, 0, 1,
-0.6028692, 2.084745, -0.3932243, 0.2901961, 1, 0, 1,
-0.6025035, -0.6375434, -0.9314165, 0.282353, 1, 0, 1,
-0.5958739, -0.8321213, -1.65293, 0.2784314, 1, 0, 1,
-0.5954261, 0.9926549, -1.268126, 0.2705882, 1, 0, 1,
-0.5914217, 0.7957884, -1.356797, 0.2666667, 1, 0, 1,
-0.5867168, -0.9395006, -4.189251, 0.2588235, 1, 0, 1,
-0.586058, 0.6629698, -4.405401, 0.254902, 1, 0, 1,
-0.5843533, 0.02004868, -1.199157, 0.2470588, 1, 0, 1,
-0.5796145, 0.4110623, 0.4058647, 0.2431373, 1, 0, 1,
-0.5788096, -0.9953071, -3.435001, 0.2352941, 1, 0, 1,
-0.5773078, -1.149931, -4.259347, 0.2313726, 1, 0, 1,
-0.5762392, -0.4525394, -1.341668, 0.2235294, 1, 0, 1,
-0.5752968, 0.3394723, -1.36839, 0.2196078, 1, 0, 1,
-0.5727488, 0.4234935, 0.4203967, 0.2117647, 1, 0, 1,
-0.5564394, 0.2485135, -0.5937774, 0.2078431, 1, 0, 1,
-0.5554195, 2.181601, 0.5680891, 0.2, 1, 0, 1,
-0.5502697, -0.07743919, -1.473523, 0.1921569, 1, 0, 1,
-0.5493345, -2.77063, -1.335384, 0.1882353, 1, 0, 1,
-0.5417567, 1.867224, -0.5643719, 0.1803922, 1, 0, 1,
-0.5407391, 0.7133298, 0.125633, 0.1764706, 1, 0, 1,
-0.533687, -0.186153, -2.437872, 0.1686275, 1, 0, 1,
-0.5332204, -1.56305, -1.462007, 0.1647059, 1, 0, 1,
-0.5322126, -0.8943923, -2.565515, 0.1568628, 1, 0, 1,
-0.5237051, -1.755506, -3.255112, 0.1529412, 1, 0, 1,
-0.5206305, -1.115701, -2.280745, 0.145098, 1, 0, 1,
-0.5192859, -1.556702, -3.518053, 0.1411765, 1, 0, 1,
-0.5159667, 0.9958081, 0.6974828, 0.1333333, 1, 0, 1,
-0.5140744, 1.074506, -1.580545, 0.1294118, 1, 0, 1,
-0.5109531, 0.9104815, -0.799275, 0.1215686, 1, 0, 1,
-0.5013958, -0.167971, -1.722331, 0.1176471, 1, 0, 1,
-0.4924872, -0.4003291, -1.286762, 0.1098039, 1, 0, 1,
-0.491092, -0.4758308, -3.742319, 0.1058824, 1, 0, 1,
-0.4896587, -1.151996, -3.11979, 0.09803922, 1, 0, 1,
-0.4874209, -0.3393622, -0.08832376, 0.09019608, 1, 0, 1,
-0.482921, -0.4006838, -0.9171596, 0.08627451, 1, 0, 1,
-0.481535, 0.4294684, -0.9154114, 0.07843138, 1, 0, 1,
-0.4808221, 0.3588377, -1.242635, 0.07450981, 1, 0, 1,
-0.4793309, 0.4542607, -1.496046, 0.06666667, 1, 0, 1,
-0.4777817, 0.8036263, -1.746566, 0.0627451, 1, 0, 1,
-0.477614, 1.534999, 0.7844124, 0.05490196, 1, 0, 1,
-0.4773851, -1.79187, -3.879174, 0.05098039, 1, 0, 1,
-0.4767273, 0.3324984, -0.438052, 0.04313726, 1, 0, 1,
-0.4764237, 1.796885, 0.6675473, 0.03921569, 1, 0, 1,
-0.4760616, 1.604043, -0.1176834, 0.03137255, 1, 0, 1,
-0.4746676, 0.4711927, -1.567255, 0.02745098, 1, 0, 1,
-0.4737689, 0.1296107, -2.469924, 0.01960784, 1, 0, 1,
-0.4702975, -0.3668363, -2.040332, 0.01568628, 1, 0, 1,
-0.4698246, -1.574995, -3.602606, 0.007843138, 1, 0, 1,
-0.4672374, 1.048347, -1.937818, 0.003921569, 1, 0, 1,
-0.4588107, -0.690784, -2.12893, 0, 1, 0.003921569, 1,
-0.4557593, 0.3771018, -1.925616, 0, 1, 0.01176471, 1,
-0.4520511, 0.7626632, -0.8658764, 0, 1, 0.01568628, 1,
-0.4500873, -0.2624289, -1.323737, 0, 1, 0.02352941, 1,
-0.4485727, 0.593994, 0.3659317, 0, 1, 0.02745098, 1,
-0.448017, 1.570513, 0.4403023, 0, 1, 0.03529412, 1,
-0.4459934, 0.8744496, -1.597663, 0, 1, 0.03921569, 1,
-0.4397792, 1.290199, -1.238995, 0, 1, 0.04705882, 1,
-0.4386751, 2.483316, -0.248424, 0, 1, 0.05098039, 1,
-0.4342899, -0.9810311, -3.930698, 0, 1, 0.05882353, 1,
-0.4327404, -0.8875105, -2.430735, 0, 1, 0.0627451, 1,
-0.4314927, 1.830568, -0.7073478, 0, 1, 0.07058824, 1,
-0.4292947, -1.109239, -2.287808, 0, 1, 0.07450981, 1,
-0.4233367, -0.5135548, -1.859978, 0, 1, 0.08235294, 1,
-0.4216965, -0.9417425, -1.98431, 0, 1, 0.08627451, 1,
-0.4202697, 0.07581333, -2.440505, 0, 1, 0.09411765, 1,
-0.4194061, -0.9502345, -0.9557003, 0, 1, 0.1019608, 1,
-0.4158936, 0.5788929, 0.5388948, 0, 1, 0.1058824, 1,
-0.4120076, 0.369415, -0.3539893, 0, 1, 0.1137255, 1,
-0.4110183, 1.2862, 0.130057, 0, 1, 0.1176471, 1,
-0.4087974, -0.7487776, -2.949132, 0, 1, 0.1254902, 1,
-0.4010279, -0.1740354, -0.9003143, 0, 1, 0.1294118, 1,
-0.3968087, -0.8134388, -4.707606, 0, 1, 0.1372549, 1,
-0.3933497, 0.8181919, -2.52887, 0, 1, 0.1411765, 1,
-0.3916448, 0.990938, 1.73378, 0, 1, 0.1490196, 1,
-0.3886192, 0.6862526, -1.146896, 0, 1, 0.1529412, 1,
-0.3819861, -0.48528, -2.617409, 0, 1, 0.1607843, 1,
-0.380239, 0.8033983, -0.8230183, 0, 1, 0.1647059, 1,
-0.3800086, 0.1656542, -2.137163, 0, 1, 0.172549, 1,
-0.379498, -1.771542, -3.011546, 0, 1, 0.1764706, 1,
-0.376669, 1.006852, 0.3290966, 0, 1, 0.1843137, 1,
-0.367678, 0.6425255, -0.3704541, 0, 1, 0.1882353, 1,
-0.3653078, 0.3489755, -0.3318716, 0, 1, 0.1960784, 1,
-0.3605985, 0.3010848, -0.1010199, 0, 1, 0.2039216, 1,
-0.3591515, 1.164057, 1.062796, 0, 1, 0.2078431, 1,
-0.3526313, -0.9531037, -1.225248, 0, 1, 0.2156863, 1,
-0.3499203, -1.033699, -2.217467, 0, 1, 0.2196078, 1,
-0.3481946, -1.40617, -3.058073, 0, 1, 0.227451, 1,
-0.347018, -0.4310445, -1.498496, 0, 1, 0.2313726, 1,
-0.3439932, -1.005987, -3.11361, 0, 1, 0.2392157, 1,
-0.3428825, -1.299828, -1.178907, 0, 1, 0.2431373, 1,
-0.3417304, -1.295909, -3.165225, 0, 1, 0.2509804, 1,
-0.3385396, 0.4606334, -0.8386984, 0, 1, 0.254902, 1,
-0.3284165, 0.2282439, -0.2893487, 0, 1, 0.2627451, 1,
-0.3281603, -0.6536601, -3.013951, 0, 1, 0.2666667, 1,
-0.3268944, -0.5122137, -3.030374, 0, 1, 0.2745098, 1,
-0.3239994, 0.7488542, 1.194771, 0, 1, 0.2784314, 1,
-0.3190498, 0.6428393, -1.454653, 0, 1, 0.2862745, 1,
-0.317049, -0.5493803, -2.151173, 0, 1, 0.2901961, 1,
-0.3143376, 0.2199168, -0.5574808, 0, 1, 0.2980392, 1,
-0.3127247, -0.48356, -3.870001, 0, 1, 0.3058824, 1,
-0.3102066, -0.9814865, -6.157114, 0, 1, 0.3098039, 1,
-0.3094692, 1.009054, -0.3649282, 0, 1, 0.3176471, 1,
-0.3091769, -0.4543071, -4.724978, 0, 1, 0.3215686, 1,
-0.3072747, -0.5850731, -3.588191, 0, 1, 0.3294118, 1,
-0.3062866, 1.743881, -0.6507271, 0, 1, 0.3333333, 1,
-0.2972835, 0.1689841, -0.9708674, 0, 1, 0.3411765, 1,
-0.2947191, -0.8227834, -2.690897, 0, 1, 0.345098, 1,
-0.2944733, -0.4572674, -4.545822, 0, 1, 0.3529412, 1,
-0.2941535, 0.5880796, -2.490967, 0, 1, 0.3568628, 1,
-0.2931319, 0.2907968, -1.586073, 0, 1, 0.3647059, 1,
-0.2915348, -1.298556, -3.122922, 0, 1, 0.3686275, 1,
-0.2878187, -0.3002321, -3.655738, 0, 1, 0.3764706, 1,
-0.2854367, 0.802501, -0.1806535, 0, 1, 0.3803922, 1,
-0.284075, 0.07572164, -2.700126, 0, 1, 0.3882353, 1,
-0.2836005, -0.6109492, -2.961233, 0, 1, 0.3921569, 1,
-0.2727349, -0.783162, -2.290197, 0, 1, 0.4, 1,
-0.2686295, -0.7609601, -3.897014, 0, 1, 0.4078431, 1,
-0.2643446, 0.6393425, -1.538657, 0, 1, 0.4117647, 1,
-0.2628593, 0.08322323, -0.1135448, 0, 1, 0.4196078, 1,
-0.2597146, 0.7346697, -0.7359945, 0, 1, 0.4235294, 1,
-0.2553391, -0.0532934, -1.412917, 0, 1, 0.4313726, 1,
-0.2541937, -0.09173664, -1.217232, 0, 1, 0.4352941, 1,
-0.2529123, 0.8948942, -0.09268672, 0, 1, 0.4431373, 1,
-0.2510284, -0.1319812, -1.946527, 0, 1, 0.4470588, 1,
-0.2489776, 0.5438663, 1.459988, 0, 1, 0.454902, 1,
-0.2453343, -1.204246, -3.334996, 0, 1, 0.4588235, 1,
-0.2412739, 1.148939, -1.647447, 0, 1, 0.4666667, 1,
-0.2312153, 0.03831086, -2.07076, 0, 1, 0.4705882, 1,
-0.2310093, 0.5308295, -1.13025, 0, 1, 0.4784314, 1,
-0.2287055, -0.308813, -4.788053, 0, 1, 0.4823529, 1,
-0.2255784, 0.4506497, 0.6072245, 0, 1, 0.4901961, 1,
-0.2223456, 0.398228, -0.1078124, 0, 1, 0.4941176, 1,
-0.2211593, 3.072226, 0.5738419, 0, 1, 0.5019608, 1,
-0.2164149, 1.636679, -0.8282554, 0, 1, 0.509804, 1,
-0.2153786, -1.348036, -2.483063, 0, 1, 0.5137255, 1,
-0.2135675, 0.4341975, 1.345147, 0, 1, 0.5215687, 1,
-0.212911, 0.5407918, -0.9224257, 0, 1, 0.5254902, 1,
-0.2126639, 0.2896523, -0.8196036, 0, 1, 0.5333334, 1,
-0.2110975, 1.612389, -0.4700011, 0, 1, 0.5372549, 1,
-0.2108334, -2.07527, -2.685158, 0, 1, 0.5450981, 1,
-0.2108232, 0.04852527, -0.9662151, 0, 1, 0.5490196, 1,
-0.210209, 0.1743521, 1.105992, 0, 1, 0.5568628, 1,
-0.2084485, 1.405727, 1.232177, 0, 1, 0.5607843, 1,
-0.2032312, 0.2424167, -1.323268, 0, 1, 0.5686275, 1,
-0.2004168, -0.7568581, -1.216179, 0, 1, 0.572549, 1,
-0.1980875, -0.5764732, -2.560471, 0, 1, 0.5803922, 1,
-0.1977869, -1.073043, -2.605208, 0, 1, 0.5843138, 1,
-0.1967748, -0.08584961, -1.258067, 0, 1, 0.5921569, 1,
-0.1910228, -0.9759585, -3.550916, 0, 1, 0.5960785, 1,
-0.1906089, -0.5220389, -3.126435, 0, 1, 0.6039216, 1,
-0.1896435, -0.2078363, -1.399543, 0, 1, 0.6117647, 1,
-0.1875046, 0.4123402, -1.306919, 0, 1, 0.6156863, 1,
-0.1869728, -0.3974593, -3.272572, 0, 1, 0.6235294, 1,
-0.1836745, -0.1431587, -3.398765, 0, 1, 0.627451, 1,
-0.1834617, 0.5811851, -1.398303, 0, 1, 0.6352941, 1,
-0.1813244, 0.4557894, 0.4199802, 0, 1, 0.6392157, 1,
-0.1800451, 0.9373235, -0.3792744, 0, 1, 0.6470588, 1,
-0.1780724, -0.8149053, -3.05561, 0, 1, 0.6509804, 1,
-0.1762746, 0.9906482, -0.04819309, 0, 1, 0.6588235, 1,
-0.1709035, -0.6165317, -1.506479, 0, 1, 0.6627451, 1,
-0.1673913, -1.805438, -3.204669, 0, 1, 0.6705883, 1,
-0.1633278, -1.28969, -1.744172, 0, 1, 0.6745098, 1,
-0.1612186, -0.8380485, -3.424074, 0, 1, 0.682353, 1,
-0.1574875, -0.1127724, -2.575302, 0, 1, 0.6862745, 1,
-0.1545216, 0.6269671, 0.4492079, 0, 1, 0.6941177, 1,
-0.1465925, 1.698634, -0.2232174, 0, 1, 0.7019608, 1,
-0.1464284, 0.5733945, -0.2938982, 0, 1, 0.7058824, 1,
-0.1450229, -0.6268944, -2.683295, 0, 1, 0.7137255, 1,
-0.1449389, 1.368982, 0.954502, 0, 1, 0.7176471, 1,
-0.1387247, 0.6732423, 1.216741, 0, 1, 0.7254902, 1,
-0.1383602, -1.065465, -2.219152, 0, 1, 0.7294118, 1,
-0.1381542, -0.8954057, -2.069167, 0, 1, 0.7372549, 1,
-0.1366324, 1.213191, 0.4211017, 0, 1, 0.7411765, 1,
-0.1352081, -0.348688, -4.124438, 0, 1, 0.7490196, 1,
-0.1332675, 0.04706784, -2.385734, 0, 1, 0.7529412, 1,
-0.1316917, 0.3691883, 0.5672937, 0, 1, 0.7607843, 1,
-0.1224629, -0.1771646, -2.009289, 0, 1, 0.7647059, 1,
-0.1205893, -1.114299, -4.785765, 0, 1, 0.772549, 1,
-0.1203707, -0.393831, -3.59897, 0, 1, 0.7764706, 1,
-0.1112795, 0.6364172, 0.4688741, 0, 1, 0.7843137, 1,
-0.1063037, -1.779053, -2.526175, 0, 1, 0.7882353, 1,
-0.09863397, 0.04654535, -0.07236307, 0, 1, 0.7960784, 1,
-0.09661168, -0.9922416, -4.531031, 0, 1, 0.8039216, 1,
-0.09637445, -0.3053353, -3.32352, 0, 1, 0.8078431, 1,
-0.09322256, -0.7411424, -4.108121, 0, 1, 0.8156863, 1,
-0.09195592, 0.3757467, -1.165304, 0, 1, 0.8196079, 1,
-0.08530438, 0.7441026, -0.1627822, 0, 1, 0.827451, 1,
-0.08346468, -0.6498253, -1.939106, 0, 1, 0.8313726, 1,
-0.08292642, -0.6265073, -2.094231, 0, 1, 0.8392157, 1,
-0.08130328, -1.86579, -2.260348, 0, 1, 0.8431373, 1,
-0.07805183, -1.497836, -2.763124, 0, 1, 0.8509804, 1,
-0.07370912, -1.254885, -4.290692, 0, 1, 0.854902, 1,
-0.07170215, -0.650925, -2.625445, 0, 1, 0.8627451, 1,
-0.06818423, -0.1647443, -2.844619, 0, 1, 0.8666667, 1,
-0.065906, 0.83711, 0.05510075, 0, 1, 0.8745098, 1,
-0.06430703, -0.3481047, -3.988698, 0, 1, 0.8784314, 1,
-0.06321087, 0.03330731, -0.8757452, 0, 1, 0.8862745, 1,
-0.05797646, -1.71666, -3.410846, 0, 1, 0.8901961, 1,
-0.05344898, 0.6522882, 1.3982, 0, 1, 0.8980392, 1,
-0.05343521, -0.3420633, -4.115663, 0, 1, 0.9058824, 1,
-0.0517703, 0.438213, 0.5752354, 0, 1, 0.9098039, 1,
-0.05164449, 0.2684016, -0.117013, 0, 1, 0.9176471, 1,
-0.04903376, 1.035536, 0.7185782, 0, 1, 0.9215686, 1,
-0.04519913, -0.5551495, -4.127444, 0, 1, 0.9294118, 1,
-0.03638318, -1.679186, -2.445122, 0, 1, 0.9333333, 1,
-0.032423, 1.718696, 0.6928895, 0, 1, 0.9411765, 1,
-0.03126102, 0.9138708, -0.6077617, 0, 1, 0.945098, 1,
-0.02997054, 0.6348935, 0.9057534, 0, 1, 0.9529412, 1,
-0.02926289, 0.4779238, -0.7147315, 0, 1, 0.9568627, 1,
-0.02768341, 0.1822198, -1.323056, 0, 1, 0.9647059, 1,
-0.02444348, 2.025602, 1.084581, 0, 1, 0.9686275, 1,
-0.01787941, 0.1496529, -2.583587, 0, 1, 0.9764706, 1,
-0.0169261, 1.548962, -0.4959523, 0, 1, 0.9803922, 1,
-0.01375442, -1.218731, -3.584326, 0, 1, 0.9882353, 1,
-0.01082702, 0.7435192, 2.109872, 0, 1, 0.9921569, 1,
-0.009481258, 0.844956, -1.346074, 0, 1, 1, 1,
-0.006824972, 1.021667, -0.9729347, 0, 0.9921569, 1, 1,
-0.004485202, -0.7663338, -3.383303, 0, 0.9882353, 1, 1,
0.0003594875, -0.06255544, 3.144109, 0, 0.9803922, 1, 1,
0.00736404, -0.5904325, 3.105292, 0, 0.9764706, 1, 1,
0.008348798, -0.4266103, 3.174265, 0, 0.9686275, 1, 1,
0.01389921, 0.3305949, 0.3774715, 0, 0.9647059, 1, 1,
0.0163488, -1.282832, 2.402761, 0, 0.9568627, 1, 1,
0.02246222, 1.652652, 0.3739239, 0, 0.9529412, 1, 1,
0.02256388, -1.607371, 2.29098, 0, 0.945098, 1, 1,
0.02429619, -2.514961, 3.852325, 0, 0.9411765, 1, 1,
0.0275365, 1.477699, 1.094652, 0, 0.9333333, 1, 1,
0.02818228, -0.916687, 2.645652, 0, 0.9294118, 1, 1,
0.03150497, 0.9066447, -1.079004, 0, 0.9215686, 1, 1,
0.03237676, -0.5722379, 3.634554, 0, 0.9176471, 1, 1,
0.03501406, 1.720255, -0.2329652, 0, 0.9098039, 1, 1,
0.03859408, 0.6078435, -2.098458, 0, 0.9058824, 1, 1,
0.04091416, -0.2727568, 2.651885, 0, 0.8980392, 1, 1,
0.04600804, 1.385408, -1.561548, 0, 0.8901961, 1, 1,
0.04755061, -0.3724394, 3.598016, 0, 0.8862745, 1, 1,
0.04964258, 0.2077392, -0.02275097, 0, 0.8784314, 1, 1,
0.05060663, 0.2266537, -0.510467, 0, 0.8745098, 1, 1,
0.0520623, 0.3836559, 1.921497, 0, 0.8666667, 1, 1,
0.05377599, 1.421518, -0.01424327, 0, 0.8627451, 1, 1,
0.0617222, 1.262032, 0.2402058, 0, 0.854902, 1, 1,
0.062128, -1.442037, 2.284223, 0, 0.8509804, 1, 1,
0.06241091, 0.2446594, -0.8505747, 0, 0.8431373, 1, 1,
0.0629064, 1.11358, 0.6931763, 0, 0.8392157, 1, 1,
0.06431439, -0.4709115, 3.758425, 0, 0.8313726, 1, 1,
0.07621683, 0.5156278, -0.04853536, 0, 0.827451, 1, 1,
0.07631034, -0.1020076, 3.14934, 0, 0.8196079, 1, 1,
0.07868973, -1.137411, 3.12956, 0, 0.8156863, 1, 1,
0.08065075, -0.6665677, 2.588916, 0, 0.8078431, 1, 1,
0.08561076, 0.5645138, 1.281719, 0, 0.8039216, 1, 1,
0.09372916, -0.8764185, 3.613778, 0, 0.7960784, 1, 1,
0.09570249, -1.191597, 2.547946, 0, 0.7882353, 1, 1,
0.09575862, -0.7255629, 4.151135, 0, 0.7843137, 1, 1,
0.0998997, -0.4924983, 2.999292, 0, 0.7764706, 1, 1,
0.1000648, 0.8590847, -1.53597, 0, 0.772549, 1, 1,
0.1005241, 0.2231503, 0.45971, 0, 0.7647059, 1, 1,
0.105663, -1.380361, 3.401348, 0, 0.7607843, 1, 1,
0.1090897, -0.8771464, 4.695049, 0, 0.7529412, 1, 1,
0.1115413, 0.6049694, 0.5740322, 0, 0.7490196, 1, 1,
0.1139537, -1.349156, 2.45183, 0, 0.7411765, 1, 1,
0.1140153, -0.503181, 2.639834, 0, 0.7372549, 1, 1,
0.1171547, -2.062959, 3.894257, 0, 0.7294118, 1, 1,
0.1186392, -1.024819, 2.125832, 0, 0.7254902, 1, 1,
0.1216465, -1.456224, 2.998115, 0, 0.7176471, 1, 1,
0.1220482, -0.1551832, 2.328728, 0, 0.7137255, 1, 1,
0.1226108, -0.4028108, 4.064099, 0, 0.7058824, 1, 1,
0.1229642, -1.372116, 3.491247, 0, 0.6980392, 1, 1,
0.1230386, 0.7010629, 1.511944, 0, 0.6941177, 1, 1,
0.1236063, -0.4055547, 3.443603, 0, 0.6862745, 1, 1,
0.1268808, -0.2714659, 3.856485, 0, 0.682353, 1, 1,
0.1293236, -0.4126197, 4.355809, 0, 0.6745098, 1, 1,
0.1296931, -2.895254, 5.400417, 0, 0.6705883, 1, 1,
0.1298104, -0.3326808, 3.480256, 0, 0.6627451, 1, 1,
0.1306729, -0.4670629, 4.170369, 0, 0.6588235, 1, 1,
0.1311393, 1.642115, 0.2375296, 0, 0.6509804, 1, 1,
0.1351295, -0.7669109, 2.499336, 0, 0.6470588, 1, 1,
0.1394881, 0.4871216, 1.019683, 0, 0.6392157, 1, 1,
0.1420681, 0.8646008, 3.129114, 0, 0.6352941, 1, 1,
0.1442996, 1.139569, 0.5878116, 0, 0.627451, 1, 1,
0.1444591, 0.9514531, 1.228597, 0, 0.6235294, 1, 1,
0.1520175, 0.166514, -0.621483, 0, 0.6156863, 1, 1,
0.154732, 0.3549333, -0.5365866, 0, 0.6117647, 1, 1,
0.1653578, 0.01206441, 1.750023, 0, 0.6039216, 1, 1,
0.169693, 0.9542364, -0.3697269, 0, 0.5960785, 1, 1,
0.1714185, 0.5020622, 0.4846308, 0, 0.5921569, 1, 1,
0.1733843, -0.1756225, 3.367279, 0, 0.5843138, 1, 1,
0.1741211, 0.9912847, 1.38477, 0, 0.5803922, 1, 1,
0.1757637, 0.6786243, 1.214839, 0, 0.572549, 1, 1,
0.1772477, -0.7176151, 1.742012, 0, 0.5686275, 1, 1,
0.1774986, 0.6256527, 0.1966283, 0, 0.5607843, 1, 1,
0.1776701, 0.0472223, 2.101094, 0, 0.5568628, 1, 1,
0.1845363, 1.158429, -0.1105, 0, 0.5490196, 1, 1,
0.1852049, -0.1714147, 1.583352, 0, 0.5450981, 1, 1,
0.1887884, -2.283331, 2.997534, 0, 0.5372549, 1, 1,
0.1888044, 0.8306016, 0.863699, 0, 0.5333334, 1, 1,
0.1944988, -1.78427, 3.823362, 0, 0.5254902, 1, 1,
0.2060094, -0.2048277, 2.276491, 0, 0.5215687, 1, 1,
0.2064653, -0.5506225, 2.264072, 0, 0.5137255, 1, 1,
0.2113479, -0.8927266, 2.345113, 0, 0.509804, 1, 1,
0.2174753, -0.2629874, 1.840105, 0, 0.5019608, 1, 1,
0.2193858, 0.2479836, 0.3222949, 0, 0.4941176, 1, 1,
0.2242929, -0.7492926, 1.636643, 0, 0.4901961, 1, 1,
0.2263075, 0.9813894, -0.6721351, 0, 0.4823529, 1, 1,
0.2268027, -0.4355745, 1.545537, 0, 0.4784314, 1, 1,
0.2451643, 0.830942, 0.2337268, 0, 0.4705882, 1, 1,
0.2466148, 1.102503, 0.696985, 0, 0.4666667, 1, 1,
0.2486456, -1.599152, 3.516209, 0, 0.4588235, 1, 1,
0.2585377, -0.4653307, 2.448626, 0, 0.454902, 1, 1,
0.2607697, 0.02433921, 2.224873, 0, 0.4470588, 1, 1,
0.2631304, 0.2690415, 0.6981635, 0, 0.4431373, 1, 1,
0.2707709, 1.438001, -1.987893, 0, 0.4352941, 1, 1,
0.2767407, 1.568703, 2.174455, 0, 0.4313726, 1, 1,
0.2786196, -0.164067, 3.523345, 0, 0.4235294, 1, 1,
0.2790602, -0.5429395, 0.6178458, 0, 0.4196078, 1, 1,
0.280296, 1.358885, 0.9754171, 0, 0.4117647, 1, 1,
0.2846439, 0.5031503, 0.1714038, 0, 0.4078431, 1, 1,
0.2861361, -0.4624293, 2.266474, 0, 0.4, 1, 1,
0.2897708, 1.351611, -0.8119072, 0, 0.3921569, 1, 1,
0.2914278, 0.06169289, 1.624601, 0, 0.3882353, 1, 1,
0.2914781, -0.4080092, 3.274823, 0, 0.3803922, 1, 1,
0.292417, 1.570066, 1.009897, 0, 0.3764706, 1, 1,
0.295311, -0.3271288, 3.042818, 0, 0.3686275, 1, 1,
0.2967508, 1.705084, 0.9642164, 0, 0.3647059, 1, 1,
0.2977495, -0.9349094, 2.61048, 0, 0.3568628, 1, 1,
0.299643, -0.3090809, 1.763977, 0, 0.3529412, 1, 1,
0.3020615, -1.026665, 1.366536, 0, 0.345098, 1, 1,
0.3036901, -0.02034576, 1.118789, 0, 0.3411765, 1, 1,
0.3089995, 0.9751467, -1.969572, 0, 0.3333333, 1, 1,
0.3098877, 0.1010917, 1.790142, 0, 0.3294118, 1, 1,
0.3133887, -0.03226544, 3.434578, 0, 0.3215686, 1, 1,
0.3135552, -1.770167, 4.131409, 0, 0.3176471, 1, 1,
0.3181295, -0.1620278, 1.806647, 0, 0.3098039, 1, 1,
0.31863, -0.2657616, 0.1008789, 0, 0.3058824, 1, 1,
0.3194974, -0.4778494, -0.2697652, 0, 0.2980392, 1, 1,
0.3222135, 2.472184, -0.3252792, 0, 0.2901961, 1, 1,
0.3224921, 0.1023505, 1.044109, 0, 0.2862745, 1, 1,
0.324066, -0.01498083, 1.688834, 0, 0.2784314, 1, 1,
0.3288104, 0.2737013, 1.69321, 0, 0.2745098, 1, 1,
0.329822, -0.6648982, 2.967208, 0, 0.2666667, 1, 1,
0.3312545, -2.052995, 2.232302, 0, 0.2627451, 1, 1,
0.3333842, 0.4336619, -0.04754027, 0, 0.254902, 1, 1,
0.3344424, 0.1092613, -0.4122048, 0, 0.2509804, 1, 1,
0.3357357, -0.208195, 1.612479, 0, 0.2431373, 1, 1,
0.3384445, 0.1376144, 0.86732, 0, 0.2392157, 1, 1,
0.3417052, 1.708308, -0.02633443, 0, 0.2313726, 1, 1,
0.3440484, -0.4497713, 3.539686, 0, 0.227451, 1, 1,
0.3443477, -0.757386, 2.860557, 0, 0.2196078, 1, 1,
0.350657, -0.1946943, 1.869255, 0, 0.2156863, 1, 1,
0.3544606, 0.3497052, 0.9466665, 0, 0.2078431, 1, 1,
0.3564323, -0.09369425, 1.48164, 0, 0.2039216, 1, 1,
0.3598637, -0.7527241, 1.150771, 0, 0.1960784, 1, 1,
0.3617797, 0.366216, 0.1670077, 0, 0.1882353, 1, 1,
0.3630614, 0.1083231, 1.402222, 0, 0.1843137, 1, 1,
0.367534, 0.1271608, 0.127996, 0, 0.1764706, 1, 1,
0.369164, 1.9213, -0.4896345, 0, 0.172549, 1, 1,
0.3758733, -1.499195, 2.725603, 0, 0.1647059, 1, 1,
0.3772536, -0.4358968, 1.672782, 0, 0.1607843, 1, 1,
0.3807184, 1.393331, 0.1683777, 0, 0.1529412, 1, 1,
0.3955751, -0.4195184, 1.598924, 0, 0.1490196, 1, 1,
0.401634, -0.5328202, 4.021762, 0, 0.1411765, 1, 1,
0.4079675, -0.775343, 2.726752, 0, 0.1372549, 1, 1,
0.4104261, 0.7331862, -1.194821, 0, 0.1294118, 1, 1,
0.4108257, 0.6308743, 0.06290504, 0, 0.1254902, 1, 1,
0.4125639, 0.4566484, -1.387128, 0, 0.1176471, 1, 1,
0.415258, -2.915134, 0.8384235, 0, 0.1137255, 1, 1,
0.4157918, -0.2667361, 2.431694, 0, 0.1058824, 1, 1,
0.4159747, 0.4631604, 0.8964479, 0, 0.09803922, 1, 1,
0.4168125, -0.301057, 0.3389317, 0, 0.09411765, 1, 1,
0.4174495, -0.4433815, 1.982486, 0, 0.08627451, 1, 1,
0.4181833, -0.4709061, 1.40669, 0, 0.08235294, 1, 1,
0.419356, -1.944319, 4.104815, 0, 0.07450981, 1, 1,
0.4208172, 0.04707744, 2.433357, 0, 0.07058824, 1, 1,
0.4209939, 0.2017905, 1.772526, 0, 0.0627451, 1, 1,
0.4256049, -0.7561583, 4.915988, 0, 0.05882353, 1, 1,
0.4282895, -1.580509, 2.473539, 0, 0.05098039, 1, 1,
0.4287328, -0.5960687, 1.116047, 0, 0.04705882, 1, 1,
0.4291021, -1.187525, 2.249794, 0, 0.03921569, 1, 1,
0.4309884, 1.926267, 0.08353264, 0, 0.03529412, 1, 1,
0.4322431, -0.8212023, 1.88943, 0, 0.02745098, 1, 1,
0.4340003, -0.5295913, 3.317329, 0, 0.02352941, 1, 1,
0.4345313, -0.7838926, 2.874174, 0, 0.01568628, 1, 1,
0.4347471, -2.288234, 3.782517, 0, 0.01176471, 1, 1,
0.4422236, 0.2295526, -0.4107899, 0, 0.003921569, 1, 1,
0.4430153, 1.223994, 0.02065925, 0.003921569, 0, 1, 1,
0.4549763, 0.5800415, 0.4937066, 0.007843138, 0, 1, 1,
0.4569869, -0.5822865, 2.638345, 0.01568628, 0, 1, 1,
0.4610722, -0.5670065, 2.221327, 0.01960784, 0, 1, 1,
0.4668157, 0.262083, -0.4029454, 0.02745098, 0, 1, 1,
0.4744046, -0.4560722, 2.118232, 0.03137255, 0, 1, 1,
0.4744236, 1.316758, 0.4223405, 0.03921569, 0, 1, 1,
0.4769382, 1.227397, 0.8879232, 0.04313726, 0, 1, 1,
0.4775908, 0.9786934, -0.5305348, 0.05098039, 0, 1, 1,
0.4800289, 1.042499, 0.8808025, 0.05490196, 0, 1, 1,
0.4831361, -0.0302633, 2.161429, 0.0627451, 0, 1, 1,
0.4865115, -0.6970328, 1.774204, 0.06666667, 0, 1, 1,
0.486645, 0.4772215, 1.929811, 0.07450981, 0, 1, 1,
0.4874081, -0.5924856, 3.698199, 0.07843138, 0, 1, 1,
0.4875338, -0.6236459, 1.862366, 0.08627451, 0, 1, 1,
0.4890017, -0.3172284, 1.069464, 0.09019608, 0, 1, 1,
0.4957304, 0.6062157, 1.333994, 0.09803922, 0, 1, 1,
0.5027704, 2.518419, 0.7549189, 0.1058824, 0, 1, 1,
0.503405, -1.555935, 1.910367, 0.1098039, 0, 1, 1,
0.5049117, 0.5370631, 2.303562, 0.1176471, 0, 1, 1,
0.5091755, -0.5481318, 2.382506, 0.1215686, 0, 1, 1,
0.5096239, 1.176823, 0.5646106, 0.1294118, 0, 1, 1,
0.5119078, -0.2865725, 1.753425, 0.1333333, 0, 1, 1,
0.5124241, -1.183219, 3.338259, 0.1411765, 0, 1, 1,
0.5200137, 0.7110485, 0.7450526, 0.145098, 0, 1, 1,
0.5225274, -1.891404, 1.826449, 0.1529412, 0, 1, 1,
0.537398, 0.225043, 0.1604842, 0.1568628, 0, 1, 1,
0.5377712, -0.1255709, 1.391261, 0.1647059, 0, 1, 1,
0.5383821, 1.26254, 0.1173094, 0.1686275, 0, 1, 1,
0.5489435, -0.6416715, 1.385216, 0.1764706, 0, 1, 1,
0.5513101, -2.002566, 1.019823, 0.1803922, 0, 1, 1,
0.5554401, 1.352569, 0.986858, 0.1882353, 0, 1, 1,
0.5566654, 2.157965, -0.7963029, 0.1921569, 0, 1, 1,
0.5600035, 1.509121, -0.2775843, 0.2, 0, 1, 1,
0.5686063, 0.6295056, -0.3583713, 0.2078431, 0, 1, 1,
0.5696212, 0.6987267, 1.654531, 0.2117647, 0, 1, 1,
0.5725582, 0.6647701, 1.3496, 0.2196078, 0, 1, 1,
0.5739717, -1.981752, 1.60279, 0.2235294, 0, 1, 1,
0.5743408, -0.1671, 2.557871, 0.2313726, 0, 1, 1,
0.5753095, -1.744044, 3.080281, 0.2352941, 0, 1, 1,
0.5780105, 1.036332, 2.710063, 0.2431373, 0, 1, 1,
0.5819929, -0.04567105, 1.718947, 0.2470588, 0, 1, 1,
0.5827532, -0.2587783, 1.149296, 0.254902, 0, 1, 1,
0.5835223, 2.829984, -0.2519488, 0.2588235, 0, 1, 1,
0.5836236, -0.650849, 0.7145445, 0.2666667, 0, 1, 1,
0.5879427, -0.1876078, 0.9095493, 0.2705882, 0, 1, 1,
0.5952932, -0.237203, 2.855116, 0.2784314, 0, 1, 1,
0.5972639, -2.518796, 2.435437, 0.282353, 0, 1, 1,
0.5989287, 0.8232656, 1.829817, 0.2901961, 0, 1, 1,
0.6019854, -0.0901517, 2.664955, 0.2941177, 0, 1, 1,
0.6022815, -0.05582133, 4.173588, 0.3019608, 0, 1, 1,
0.6102359, -1.225447, 3.123436, 0.3098039, 0, 1, 1,
0.610421, -0.4421474, 2.77374, 0.3137255, 0, 1, 1,
0.6109523, 0.2364486, -0.2794699, 0.3215686, 0, 1, 1,
0.611029, 0.2226234, 1.037219, 0.3254902, 0, 1, 1,
0.6139556, 0.9273514, 0.9018552, 0.3333333, 0, 1, 1,
0.615044, 0.1133627, 1.742993, 0.3372549, 0, 1, 1,
0.6175083, 0.7722284, 0.7195982, 0.345098, 0, 1, 1,
0.6192863, 1.512953, -0.08349179, 0.3490196, 0, 1, 1,
0.6195104, -1.23752, 2.657622, 0.3568628, 0, 1, 1,
0.6200184, -0.5185158, 1.682067, 0.3607843, 0, 1, 1,
0.6235523, -0.1846995, 1.289338, 0.3686275, 0, 1, 1,
0.6246408, -1.707339, 3.0275, 0.372549, 0, 1, 1,
0.6329688, -1.193793, 2.818683, 0.3803922, 0, 1, 1,
0.6393548, 0.7890204, 0.3073075, 0.3843137, 0, 1, 1,
0.6411828, -1.87008, 3.348037, 0.3921569, 0, 1, 1,
0.6425661, -0.984714, 3.388674, 0.3960784, 0, 1, 1,
0.6490706, 0.1472462, 1.212327, 0.4039216, 0, 1, 1,
0.6512049, -0.2421494, 1.371976, 0.4117647, 0, 1, 1,
0.651661, -1.193495, 2.828294, 0.4156863, 0, 1, 1,
0.6552153, -0.5193438, 3.461598, 0.4235294, 0, 1, 1,
0.6581941, -0.08413292, 0.7257229, 0.427451, 0, 1, 1,
0.6600935, -0.459046, 2.212972, 0.4352941, 0, 1, 1,
0.6648091, -0.9157051, 2.58781, 0.4392157, 0, 1, 1,
0.6675148, -0.04081791, 3.587062, 0.4470588, 0, 1, 1,
0.6676186, 1.258094, 1.972932, 0.4509804, 0, 1, 1,
0.6682416, 1.827028, 1.103727, 0.4588235, 0, 1, 1,
0.673165, 0.1024028, 0.0009549829, 0.4627451, 0, 1, 1,
0.674301, 0.19225, 2.209029, 0.4705882, 0, 1, 1,
0.6784475, 0.681255, -0.6879283, 0.4745098, 0, 1, 1,
0.6833774, -0.7949187, 0.8040233, 0.4823529, 0, 1, 1,
0.6885676, 1.316648, 0.6702068, 0.4862745, 0, 1, 1,
0.6924858, 0.3256493, 1.777457, 0.4941176, 0, 1, 1,
0.6948521, 0.2151953, 2.079875, 0.5019608, 0, 1, 1,
0.70037, 0.5527198, -0.01949146, 0.5058824, 0, 1, 1,
0.705501, 1.119415, 1.920779, 0.5137255, 0, 1, 1,
0.7057912, 0.8369904, 1.233958, 0.5176471, 0, 1, 1,
0.7080591, -1.79816, 1.089339, 0.5254902, 0, 1, 1,
0.7116309, 0.7429439, 1.294797, 0.5294118, 0, 1, 1,
0.7138374, 0.3335267, 0.7304473, 0.5372549, 0, 1, 1,
0.7139145, -0.8724826, 0.8672958, 0.5411765, 0, 1, 1,
0.7194089, 0.6140386, 2.410908, 0.5490196, 0, 1, 1,
0.7213528, 0.4484426, 0.3881753, 0.5529412, 0, 1, 1,
0.7292101, 0.4461329, 2.953333, 0.5607843, 0, 1, 1,
0.7349886, -0.7314913, 2.567306, 0.5647059, 0, 1, 1,
0.7370963, -0.5049145, 3.202554, 0.572549, 0, 1, 1,
0.7406407, 0.1383379, -0.1762123, 0.5764706, 0, 1, 1,
0.7455716, -2.520028, 3.016597, 0.5843138, 0, 1, 1,
0.7476589, -0.4042792, 1.292768, 0.5882353, 0, 1, 1,
0.7502064, 0.5110968, 1.239061, 0.5960785, 0, 1, 1,
0.7517364, -0.1447885, 2.246915, 0.6039216, 0, 1, 1,
0.7535822, -0.3899576, 1.556031, 0.6078432, 0, 1, 1,
0.7554419, -0.4812855, 2.09198, 0.6156863, 0, 1, 1,
0.7574371, 1.285434, -0.8273203, 0.6196079, 0, 1, 1,
0.7583091, -2.100397, 1.647126, 0.627451, 0, 1, 1,
0.7608325, 0.1471656, 1.333544, 0.6313726, 0, 1, 1,
0.7612426, 1.399813, 0.6330562, 0.6392157, 0, 1, 1,
0.7629937, -1.098023, 3.547414, 0.6431373, 0, 1, 1,
0.7638392, 0.004715689, 0.7620178, 0.6509804, 0, 1, 1,
0.7645288, -0.03880671, 2.52171, 0.654902, 0, 1, 1,
0.7666866, 0.3732519, 0.89836, 0.6627451, 0, 1, 1,
0.7701644, -0.176982, 3.086513, 0.6666667, 0, 1, 1,
0.7724413, 1.698532, -0.08403046, 0.6745098, 0, 1, 1,
0.7729037, -0.2535088, 2.013996, 0.6784314, 0, 1, 1,
0.7785812, -0.544457, 1.44455, 0.6862745, 0, 1, 1,
0.7835035, 0.9572563, 0.5540892, 0.6901961, 0, 1, 1,
0.7845984, -0.9952865, 0.1122417, 0.6980392, 0, 1, 1,
0.7855912, -0.1976104, 1.286207, 0.7058824, 0, 1, 1,
0.788546, 0.7920766, 1.317995, 0.7098039, 0, 1, 1,
0.7929346, -0.1128415, 2.298065, 0.7176471, 0, 1, 1,
0.793458, 0.3867368, 2.400146, 0.7215686, 0, 1, 1,
0.7939163, 0.03213704, 1.665905, 0.7294118, 0, 1, 1,
0.7959692, -2.264151, 3.915357, 0.7333333, 0, 1, 1,
0.7991545, -0.2230371, 1.49954, 0.7411765, 0, 1, 1,
0.8008464, 0.8016694, 1.224947, 0.7450981, 0, 1, 1,
0.8022426, 1.396615, 1.291312, 0.7529412, 0, 1, 1,
0.80265, 2.032534, 0.2040785, 0.7568628, 0, 1, 1,
0.8058409, -1.393952, 2.497975, 0.7647059, 0, 1, 1,
0.80795, 0.6411316, 0.3732017, 0.7686275, 0, 1, 1,
0.8150141, -0.5289119, 2.879649, 0.7764706, 0, 1, 1,
0.8176178, 0.4632235, 1.275995, 0.7803922, 0, 1, 1,
0.8233761, 1.549409, 0.6677421, 0.7882353, 0, 1, 1,
0.8252037, 0.0458666, 2.030135, 0.7921569, 0, 1, 1,
0.8314142, -0.177725, 0.9447957, 0.8, 0, 1, 1,
0.8325448, -0.2579652, 2.326213, 0.8078431, 0, 1, 1,
0.8364081, -0.8712701, 1.980326, 0.8117647, 0, 1, 1,
0.837245, 1.21623, 0.887086, 0.8196079, 0, 1, 1,
0.8389398, -1.162432, 2.606089, 0.8235294, 0, 1, 1,
0.8391212, 0.883378, 2.938908, 0.8313726, 0, 1, 1,
0.8403883, 1.0555, 2.014722, 0.8352941, 0, 1, 1,
0.8411035, 1.817731, -0.6860673, 0.8431373, 0, 1, 1,
0.8442194, -0.7707004, 1.33615, 0.8470588, 0, 1, 1,
0.8487543, 0.1942361, 1.346612, 0.854902, 0, 1, 1,
0.8526813, -0.07005228, 1.462652, 0.8588235, 0, 1, 1,
0.8599159, 1.441069, -0.594788, 0.8666667, 0, 1, 1,
0.8605616, -0.9914085, 1.753623, 0.8705882, 0, 1, 1,
0.8679609, 0.9587724, -0.4171945, 0.8784314, 0, 1, 1,
0.8695126, -1.001879, 1.646661, 0.8823529, 0, 1, 1,
0.8727044, -0.4043318, 3.165689, 0.8901961, 0, 1, 1,
0.8765053, 0.8794139, 0.6286997, 0.8941177, 0, 1, 1,
0.8782516, 0.7825679, -0.7605791, 0.9019608, 0, 1, 1,
0.8804792, 1.335027, 1.043197, 0.9098039, 0, 1, 1,
0.8808094, -1.890037, 1.374874, 0.9137255, 0, 1, 1,
0.8911154, -0.2575866, 0.6908455, 0.9215686, 0, 1, 1,
0.8963487, -0.7288933, 2.65161, 0.9254902, 0, 1, 1,
0.8972361, -1.590741, 2.153737, 0.9333333, 0, 1, 1,
0.9032134, 0.3593737, 0.8861509, 0.9372549, 0, 1, 1,
0.9044487, -0.4760693, 2.517103, 0.945098, 0, 1, 1,
0.9088649, 0.3701609, 1.884826, 0.9490196, 0, 1, 1,
0.9110328, -1.004219, 1.647841, 0.9568627, 0, 1, 1,
0.9130515, -0.1506885, 0.6494941, 0.9607843, 0, 1, 1,
0.916358, -1.080288, 2.450434, 0.9686275, 0, 1, 1,
0.9173155, 0.4457091, 1.118767, 0.972549, 0, 1, 1,
0.9216604, 0.5506407, 1.083712, 0.9803922, 0, 1, 1,
0.9219209, -0.9544595, 1.853313, 0.9843137, 0, 1, 1,
0.9229615, -0.5366875, 3.241047, 0.9921569, 0, 1, 1,
0.9244578, 0.2332662, 0.2137714, 0.9960784, 0, 1, 1,
0.943418, -1.073443, 1.988628, 1, 0, 0.9960784, 1,
0.9440525, 0.04544015, 1.272329, 1, 0, 0.9882353, 1,
0.9559184, -0.9359307, 1.417201, 1, 0, 0.9843137, 1,
0.9634687, -1.033011, 2.354467, 1, 0, 0.9764706, 1,
0.9712589, -1.061055, 1.599843, 1, 0, 0.972549, 1,
0.9795766, -1.284389, 3.843418, 1, 0, 0.9647059, 1,
0.9804147, 0.4974945, 1.512996, 1, 0, 0.9607843, 1,
0.9880453, 0.5456627, 2.099131, 1, 0, 0.9529412, 1,
0.991223, 0.9773241, -0.2235125, 1, 0, 0.9490196, 1,
1.007411, -0.1297588, 0.8552694, 1, 0, 0.9411765, 1,
1.018084, 0.3658719, 2.009249, 1, 0, 0.9372549, 1,
1.020724, -0.2506837, 1.323033, 1, 0, 0.9294118, 1,
1.022814, 0.3901081, 0.6420972, 1, 0, 0.9254902, 1,
1.027661, -1.022517, 1.770654, 1, 0, 0.9176471, 1,
1.027786, 0.1034953, 1.222278, 1, 0, 0.9137255, 1,
1.03479, -0.690539, 1.563411, 1, 0, 0.9058824, 1,
1.049165, 1.117003, 1.698548, 1, 0, 0.9019608, 1,
1.058646, 0.7608959, 2.359606, 1, 0, 0.8941177, 1,
1.059525, 0.2030601, 1.193013, 1, 0, 0.8862745, 1,
1.062726, 0.7233401, 1.161379, 1, 0, 0.8823529, 1,
1.065401, -1.142784, 2.487739, 1, 0, 0.8745098, 1,
1.066292, -0.7857625, 2.674055, 1, 0, 0.8705882, 1,
1.06984, 0.08116134, 3.677088, 1, 0, 0.8627451, 1,
1.083211, -1.147692, 3.919647, 1, 0, 0.8588235, 1,
1.087014, 1.848531, 0.4405962, 1, 0, 0.8509804, 1,
1.087943, -0.9740655, 2.143862, 1, 0, 0.8470588, 1,
1.094094, 1.71221, -1.418192, 1, 0, 0.8392157, 1,
1.09471, 0.2238563, 2.471543, 1, 0, 0.8352941, 1,
1.095898, -0.8259161, 1.18234, 1, 0, 0.827451, 1,
1.096794, -1.365467, 1.734454, 1, 0, 0.8235294, 1,
1.10085, 0.4730839, 2.097761, 1, 0, 0.8156863, 1,
1.103977, 0.06277271, 1.029479, 1, 0, 0.8117647, 1,
1.110167, -0.1053681, 2.261147, 1, 0, 0.8039216, 1,
1.116806, -1.043833, 2.710288, 1, 0, 0.7960784, 1,
1.124089, 0.08578913, 3.523041, 1, 0, 0.7921569, 1,
1.125083, -1.009776, 3.43229, 1, 0, 0.7843137, 1,
1.126875, 1.815326, 0.6702307, 1, 0, 0.7803922, 1,
1.128055, 0.09653697, 2.155654, 1, 0, 0.772549, 1,
1.128117, -0.8202981, 1.832467, 1, 0, 0.7686275, 1,
1.129408, -0.9023214, 1.119603, 1, 0, 0.7607843, 1,
1.139472, -0.1832777, 0.378017, 1, 0, 0.7568628, 1,
1.140756, -0.3050755, 1.313511, 1, 0, 0.7490196, 1,
1.143392, 1.324163, 0.7611549, 1, 0, 0.7450981, 1,
1.143786, 0.7278559, 0.2399296, 1, 0, 0.7372549, 1,
1.145936, 0.8854795, 1.248342, 1, 0, 0.7333333, 1,
1.153397, -2.32176, 2.851179, 1, 0, 0.7254902, 1,
1.155971, 1.007092, 3.197785, 1, 0, 0.7215686, 1,
1.157674, 1.822379, -0.2114635, 1, 0, 0.7137255, 1,
1.160081, -0.01908837, 1.639702, 1, 0, 0.7098039, 1,
1.170574, -0.4431627, 3.401603, 1, 0, 0.7019608, 1,
1.171045, -0.5203751, 2.186691, 1, 0, 0.6941177, 1,
1.172028, 1.442532, -0.04567027, 1, 0, 0.6901961, 1,
1.179777, 0.8559787, 0.4111113, 1, 0, 0.682353, 1,
1.188127, 0.002047821, 0.8832644, 1, 0, 0.6784314, 1,
1.190556, -0.3403056, 0.4755296, 1, 0, 0.6705883, 1,
1.198265, -0.01837676, -0.005106864, 1, 0, 0.6666667, 1,
1.199027, -1.624496, 2.295576, 1, 0, 0.6588235, 1,
1.203002, -1.847969, 3.879332, 1, 0, 0.654902, 1,
1.205645, -1.153657, 3.290057, 1, 0, 0.6470588, 1,
1.208874, 0.3516035, 1.706554, 1, 0, 0.6431373, 1,
1.209884, 0.05339603, 1.717449, 1, 0, 0.6352941, 1,
1.214836, -0.0498643, 3.715048, 1, 0, 0.6313726, 1,
1.223917, -1.935773, 1.933372, 1, 0, 0.6235294, 1,
1.22895, 0.2336948, 0.8826831, 1, 0, 0.6196079, 1,
1.237477, 1.710636, -0.2096792, 1, 0, 0.6117647, 1,
1.241759, -0.9519402, 2.38475, 1, 0, 0.6078432, 1,
1.24268, -0.1549219, 2.084249, 1, 0, 0.6, 1,
1.245556, 0.2502395, 1.808496, 1, 0, 0.5921569, 1,
1.255493, -0.1737388, -0.470263, 1, 0, 0.5882353, 1,
1.258185, -0.6682183, 1.036543, 1, 0, 0.5803922, 1,
1.265079, 0.06093331, 1.961569, 1, 0, 0.5764706, 1,
1.268151, -0.7540585, 2.216464, 1, 0, 0.5686275, 1,
1.269293, 0.4227202, -0.2703494, 1, 0, 0.5647059, 1,
1.270123, -0.8119566, 0.5797484, 1, 0, 0.5568628, 1,
1.272471, 0.8356707, 1.385433, 1, 0, 0.5529412, 1,
1.272795, -0.6614859, 2.140816, 1, 0, 0.5450981, 1,
1.287588, 0.641636, 2.38445, 1, 0, 0.5411765, 1,
1.299932, -0.7202786, 1.32247, 1, 0, 0.5333334, 1,
1.305789, 0.4902262, 0.8170532, 1, 0, 0.5294118, 1,
1.308972, -0.1014382, 2.264033, 1, 0, 0.5215687, 1,
1.313804, 0.2553132, 0.2630802, 1, 0, 0.5176471, 1,
1.314506, 0.8202668, 0.6725703, 1, 0, 0.509804, 1,
1.314779, 0.01068913, 0.7805512, 1, 0, 0.5058824, 1,
1.315731, 0.5040416, 0.3583262, 1, 0, 0.4980392, 1,
1.321035, 0.6247874, 0.2938794, 1, 0, 0.4901961, 1,
1.329135, -0.6268321, 1.325251, 1, 0, 0.4862745, 1,
1.334351, 0.9385081, 0.8094004, 1, 0, 0.4784314, 1,
1.339545, 0.8877122, 1.612633, 1, 0, 0.4745098, 1,
1.34007, 0.6919439, 1.02534, 1, 0, 0.4666667, 1,
1.340813, 1.175489, 1.4033, 1, 0, 0.4627451, 1,
1.342963, 0.6397609, 1.996128, 1, 0, 0.454902, 1,
1.356554, 0.3631501, 0.7058025, 1, 0, 0.4509804, 1,
1.359389, 0.8043632, 1.426589, 1, 0, 0.4431373, 1,
1.36348, -0.431552, 4.416818, 1, 0, 0.4392157, 1,
1.364497, 0.04168575, 1.293733, 1, 0, 0.4313726, 1,
1.381779, -0.6685342, 1.773574, 1, 0, 0.427451, 1,
1.401882, -1.035208, 3.339364, 1, 0, 0.4196078, 1,
1.40785, -1.228882, 2.448529, 1, 0, 0.4156863, 1,
1.410541, -0.5296206, 2.466544, 1, 0, 0.4078431, 1,
1.416641, 0.4383968, 0.5479465, 1, 0, 0.4039216, 1,
1.417719, 0.5240816, 2.320921, 1, 0, 0.3960784, 1,
1.419697, 1.558951, 1.386508, 1, 0, 0.3882353, 1,
1.429305, 0.3165588, 1.438007, 1, 0, 0.3843137, 1,
1.434985, 0.4829472, 0.5483848, 1, 0, 0.3764706, 1,
1.455376, -0.703919, 1.260002, 1, 0, 0.372549, 1,
1.499497, 0.8797254, 2.54584, 1, 0, 0.3647059, 1,
1.504682, 0.4210308, 1.404752, 1, 0, 0.3607843, 1,
1.506925, 0.5649005, 3.797005, 1, 0, 0.3529412, 1,
1.508994, -0.2430716, 1.306254, 1, 0, 0.3490196, 1,
1.514508, 1.136503, 0.07128358, 1, 0, 0.3411765, 1,
1.551046, -0.2836744, 0.878093, 1, 0, 0.3372549, 1,
1.551415, -0.695959, 1.25671, 1, 0, 0.3294118, 1,
1.558792, 0.8074422, 1.290965, 1, 0, 0.3254902, 1,
1.559786, -0.3782296, 2.353163, 1, 0, 0.3176471, 1,
1.573119, 0.6359971, 0.3016033, 1, 0, 0.3137255, 1,
1.583305, -0.8132727, 2.613828, 1, 0, 0.3058824, 1,
1.592738, -0.7487726, 2.107124, 1, 0, 0.2980392, 1,
1.599719, 0.9253461, -0.4690194, 1, 0, 0.2941177, 1,
1.60466, 0.8805766, 0.9531742, 1, 0, 0.2862745, 1,
1.609015, 1.660043, 0.5318393, 1, 0, 0.282353, 1,
1.617834, 1.149616, -1.716006, 1, 0, 0.2745098, 1,
1.651174, -0.6349794, 2.094156, 1, 0, 0.2705882, 1,
1.658477, -0.2138353, 0.4043089, 1, 0, 0.2627451, 1,
1.667576, -0.9136619, 0.7122391, 1, 0, 0.2588235, 1,
1.678801, -0.3942939, 0.431528, 1, 0, 0.2509804, 1,
1.681903, -0.3234266, 1.029243, 1, 0, 0.2470588, 1,
1.684512, 1.325246, 2.242255, 1, 0, 0.2392157, 1,
1.688119, -0.6954364, 1.724929, 1, 0, 0.2352941, 1,
1.718891, 0.1304668, 1.921984, 1, 0, 0.227451, 1,
1.731768, 0.9015689, 0.6765269, 1, 0, 0.2235294, 1,
1.749513, 0.9706768, 0.5819905, 1, 0, 0.2156863, 1,
1.764841, -0.9613625, 2.741057, 1, 0, 0.2117647, 1,
1.769345, 0.03094257, 2.531497, 1, 0, 0.2039216, 1,
1.778289, -2.069561, 3.118202, 1, 0, 0.1960784, 1,
1.806457, -1.120429, 2.356581, 1, 0, 0.1921569, 1,
1.843404, 0.009111054, 0.4370744, 1, 0, 0.1843137, 1,
1.928954, 0.7148233, 1.331168, 1, 0, 0.1803922, 1,
1.936132, -0.2679926, 0.5733808, 1, 0, 0.172549, 1,
1.956186, 1.248716, 0.3141371, 1, 0, 0.1686275, 1,
1.956646, 0.5884871, 2.84125, 1, 0, 0.1607843, 1,
1.961727, 0.8115854, 1.338828, 1, 0, 0.1568628, 1,
1.962747, -0.9058464, 1.976066, 1, 0, 0.1490196, 1,
1.989937, 0.5076852, 2.422844, 1, 0, 0.145098, 1,
1.999132, 0.6492726, 1.374877, 1, 0, 0.1372549, 1,
1.999485, 0.1886836, 1.026863, 1, 0, 0.1333333, 1,
2.021099, -0.3874633, 0.6237909, 1, 0, 0.1254902, 1,
2.123989, 1.024043, -0.05944805, 1, 0, 0.1215686, 1,
2.14239, 1.228467, -0.1656963, 1, 0, 0.1137255, 1,
2.186687, 0.9913154, 2.133723, 1, 0, 0.1098039, 1,
2.187124, 1.428089, 0.1802946, 1, 0, 0.1019608, 1,
2.194898, -0.9549049, 2.369453, 1, 0, 0.09411765, 1,
2.209385, -1.672602, 2.932152, 1, 0, 0.09019608, 1,
2.23531, 0.7208951, -0.0702103, 1, 0, 0.08235294, 1,
2.28885, 0.7137099, 2.717309, 1, 0, 0.07843138, 1,
2.317433, -0.07693312, 1.075844, 1, 0, 0.07058824, 1,
2.351733, -0.6061783, 3.008114, 1, 0, 0.06666667, 1,
2.406241, -1.72458, 1.591631, 1, 0, 0.05882353, 1,
2.434948, -0.2502109, 2.652574, 1, 0, 0.05490196, 1,
2.441848, -1.767254, 1.692533, 1, 0, 0.04705882, 1,
2.44995, 0.5574883, 0.5832411, 1, 0, 0.04313726, 1,
2.458211, -0.2559651, 1.55536, 1, 0, 0.03529412, 1,
2.482759, 0.3149873, 0.8258243, 1, 0, 0.03137255, 1,
2.656238, 0.3263393, 1.349453, 1, 0, 0.02352941, 1,
2.800617, -0.5659429, 1.379147, 1, 0, 0.01960784, 1,
3.273036, 1.990759, 1.986823, 1, 0, 0.01176471, 1,
3.330597, 0.9390247, 1.239274, 1, 0, 0.007843138, 1
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
0.09437692, -3.929991, -8.116116, 0, -0.5, 0.5, 0.5,
0.09437692, -3.929991, -8.116116, 1, -0.5, 0.5, 0.5,
0.09437692, -3.929991, -8.116116, 1, 1.5, 0.5, 0.5,
0.09437692, -3.929991, -8.116116, 0, 1.5, 0.5, 0.5
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
-4.238922, 0.07854617, -8.116116, 0, -0.5, 0.5, 0.5,
-4.238922, 0.07854617, -8.116116, 1, -0.5, 0.5, 0.5,
-4.238922, 0.07854617, -8.116116, 1, 1.5, 0.5, 0.5,
-4.238922, 0.07854617, -8.116116, 0, 1.5, 0.5, 0.5
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
-4.238922, -3.929991, -0.3783484, 0, -0.5, 0.5, 0.5,
-4.238922, -3.929991, -0.3783484, 1, -0.5, 0.5, 0.5,
-4.238922, -3.929991, -0.3783484, 1, 1.5, 0.5, 0.5,
-4.238922, -3.929991, -0.3783484, 0, 1.5, 0.5, 0.5
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
-3, -3.004944, -6.330477,
3, -3.004944, -6.330477,
-3, -3.004944, -6.330477,
-3, -3.159119, -6.628083,
-2, -3.004944, -6.330477,
-2, -3.159119, -6.628083,
-1, -3.004944, -6.330477,
-1, -3.159119, -6.628083,
0, -3.004944, -6.330477,
0, -3.159119, -6.628083,
1, -3.004944, -6.330477,
1, -3.159119, -6.628083,
2, -3.004944, -6.330477,
2, -3.159119, -6.628083,
3, -3.004944, -6.330477,
3, -3.159119, -6.628083
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
-3, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
-3, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
-3, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
-3, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
-2, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
-2, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
-2, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
-2, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
-1, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
-1, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
-1, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
-1, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
0, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
0, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
0, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
0, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
1, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
1, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
1, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
1, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
2, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
2, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
2, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
2, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5,
3, -3.467468, -7.223296, 0, -0.5, 0.5, 0.5,
3, -3.467468, -7.223296, 1, -0.5, 0.5, 0.5,
3, -3.467468, -7.223296, 1, 1.5, 0.5, 0.5,
3, -3.467468, -7.223296, 0, 1.5, 0.5, 0.5
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
-3.23893, -2, -6.330477,
-3.23893, 3, -6.330477,
-3.23893, -2, -6.330477,
-3.405595, -2, -6.628083,
-3.23893, -1, -6.330477,
-3.405595, -1, -6.628083,
-3.23893, 0, -6.330477,
-3.405595, 0, -6.628083,
-3.23893, 1, -6.330477,
-3.405595, 1, -6.628083,
-3.23893, 2, -6.330477,
-3.405595, 2, -6.628083,
-3.23893, 3, -6.330477,
-3.405595, 3, -6.628083
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
-3.738926, -2, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, -2, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, -2, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, -2, -7.223296, 0, 1.5, 0.5, 0.5,
-3.738926, -1, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, -1, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, -1, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, -1, -7.223296, 0, 1.5, 0.5, 0.5,
-3.738926, 0, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, 0, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, 0, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, 0, -7.223296, 0, 1.5, 0.5, 0.5,
-3.738926, 1, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, 1, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, 1, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, 1, -7.223296, 0, 1.5, 0.5, 0.5,
-3.738926, 2, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, 2, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, 2, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, 2, -7.223296, 0, 1.5, 0.5, 0.5,
-3.738926, 3, -7.223296, 0, -0.5, 0.5, 0.5,
-3.738926, 3, -7.223296, 1, -0.5, 0.5, 0.5,
-3.738926, 3, -7.223296, 1, 1.5, 0.5, 0.5,
-3.738926, 3, -7.223296, 0, 1.5, 0.5, 0.5
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
-3.23893, -3.004944, -6,
-3.23893, -3.004944, 4,
-3.23893, -3.004944, -6,
-3.405595, -3.159119, -6,
-3.23893, -3.004944, -4,
-3.405595, -3.159119, -4,
-3.23893, -3.004944, -2,
-3.405595, -3.159119, -2,
-3.23893, -3.004944, 0,
-3.405595, -3.159119, 0,
-3.23893, -3.004944, 2,
-3.405595, -3.159119, 2,
-3.23893, -3.004944, 4,
-3.405595, -3.159119, 4
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
-3.738926, -3.467468, -6, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -6, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -6, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, -6, 0, 1.5, 0.5, 0.5,
-3.738926, -3.467468, -4, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -4, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -4, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, -4, 0, 1.5, 0.5, 0.5,
-3.738926, -3.467468, -2, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -2, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, -2, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, -2, 0, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 0, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 0, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 0, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 0, 0, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 2, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 2, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 2, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 2, 0, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 4, 0, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 4, 1, -0.5, 0.5, 0.5,
-3.738926, -3.467468, 4, 1, 1.5, 0.5, 0.5,
-3.738926, -3.467468, 4, 0, 1.5, 0.5, 0.5
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
-3.23893, -3.004944, -6.330477,
-3.23893, 3.162037, -6.330477,
-3.23893, -3.004944, 5.57378,
-3.23893, 3.162037, 5.57378,
-3.23893, -3.004944, -6.330477,
-3.23893, -3.004944, 5.57378,
-3.23893, 3.162037, -6.330477,
-3.23893, 3.162037, 5.57378,
-3.23893, -3.004944, -6.330477,
3.427684, -3.004944, -6.330477,
-3.23893, -3.004944, 5.57378,
3.427684, -3.004944, 5.57378,
-3.23893, 3.162037, -6.330477,
3.427684, 3.162037, -6.330477,
-3.23893, 3.162037, 5.57378,
3.427684, 3.162037, 5.57378,
3.427684, -3.004944, -6.330477,
3.427684, 3.162037, -6.330477,
3.427684, -3.004944, 5.57378,
3.427684, 3.162037, 5.57378,
3.427684, -3.004944, -6.330477,
3.427684, -3.004944, 5.57378,
3.427684, 3.162037, -6.330477,
3.427684, 3.162037, 5.57378
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
var radius = 7.99522;
var distance = 35.57164;
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
mvMatrix.translate( -0.09437692, -0.07854617, 0.3783484 );
mvMatrix.scale( 1.296699, 1.401754, 0.7261762 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.57164);
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
isopropyl_2-chloro-5<-read.table("isopropyl_2-chloro-5.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropyl_2-chloro-5$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
```

```r
y<-isopropyl_2-chloro-5$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
```

```r
z<-isopropyl_2-chloro-5$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_2' not found
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
-3.141843, -0.3199178, -3.49029, 0, 0, 1, 1, 1,
-2.749427, -0.6100176, -2.122654, 1, 0, 0, 1, 1,
-2.651494, 1.14817, 1.427074, 1, 0, 0, 1, 1,
-2.566923, 0.5330471, -1.591457, 1, 0, 0, 1, 1,
-2.510908, -1.491353, -0.3622949, 1, 0, 0, 1, 1,
-2.483237, 2.302769, -1.350322, 1, 0, 0, 1, 1,
-2.394251, 0.648354, -1.559459, 0, 0, 0, 1, 1,
-2.376963, 1.14212, -1.618921, 0, 0, 0, 1, 1,
-2.264228, -1.447601, -3.755338, 0, 0, 0, 1, 1,
-2.224766, 1.732952, 0.2911026, 0, 0, 0, 1, 1,
-2.197643, -0.7952713, -1.607871, 0, 0, 0, 1, 1,
-2.195971, 0.3325981, -0.8555542, 0, 0, 0, 1, 1,
-2.184853, 0.4692219, 0.8290943, 0, 0, 0, 1, 1,
-2.157202, -0.03527286, -3.270775, 1, 1, 1, 1, 1,
-2.143579, -0.4992205, -1.818904, 1, 1, 1, 1, 1,
-2.141853, -0.02092657, -1.36075, 1, 1, 1, 1, 1,
-2.102855, -1.461648, -2.834949, 1, 1, 1, 1, 1,
-2.070914, 1.461904, -0.904936, 1, 1, 1, 1, 1,
-2.056814, 1.774435, -1.380491, 1, 1, 1, 1, 1,
-2.014093, 0.3937958, -1.22725, 1, 1, 1, 1, 1,
-1.995757, 0.8633769, -2.549891, 1, 1, 1, 1, 1,
-1.950188, 0.8091124, -2.63637, 1, 1, 1, 1, 1,
-1.945288, 1.269788, 0.7783298, 1, 1, 1, 1, 1,
-1.931093, 1.025504, -1.067338, 1, 1, 1, 1, 1,
-1.919695, 0.1006934, -1.458043, 1, 1, 1, 1, 1,
-1.916637, 0.4146232, -0.7348432, 1, 1, 1, 1, 1,
-1.913067, -0.5114979, -0.2024883, 1, 1, 1, 1, 1,
-1.911795, 0.1412257, -1.08426, 1, 1, 1, 1, 1,
-1.903151, -0.4238074, -2.222674, 0, 0, 1, 1, 1,
-1.895903, -0.2273978, -1.601112, 1, 0, 0, 1, 1,
-1.888475, -0.253101, -2.930208, 1, 0, 0, 1, 1,
-1.863531, -0.1552123, -3.204021, 1, 0, 0, 1, 1,
-1.854465, -0.1350726, -1.401993, 1, 0, 0, 1, 1,
-1.825284, 0.4644029, -1.503888, 1, 0, 0, 1, 1,
-1.810854, 1.806147, -2.259536, 0, 0, 0, 1, 1,
-1.773761, -1.326547, -1.926009, 0, 0, 0, 1, 1,
-1.750729, -0.05796184, -1.436396, 0, 0, 0, 1, 1,
-1.746981, 0.07340301, -1.033124, 0, 0, 0, 1, 1,
-1.739657, 1.858815, 0.1770471, 0, 0, 0, 1, 1,
-1.737631, -1.143565, -2.903285, 0, 0, 0, 1, 1,
-1.736801, -0.5573252, -1.663229, 0, 0, 0, 1, 1,
-1.722574, -1.793913, -0.736648, 1, 1, 1, 1, 1,
-1.696646, -0.7947634, -1.290625, 1, 1, 1, 1, 1,
-1.693964, 0.1136359, -1.286907, 1, 1, 1, 1, 1,
-1.693644, -0.8827273, -2.248107, 1, 1, 1, 1, 1,
-1.689221, -0.4193755, -0.6538939, 1, 1, 1, 1, 1,
-1.682835, -0.9942268, -1.249427, 1, 1, 1, 1, 1,
-1.676316, 0.384005, -2.651837, 1, 1, 1, 1, 1,
-1.665185, -0.5763154, -3.162053, 1, 1, 1, 1, 1,
-1.662333, 1.258735, -1.991709, 1, 1, 1, 1, 1,
-1.650636, 1.241064, -0.9883622, 1, 1, 1, 1, 1,
-1.648214, -0.7005811, -2.411811, 1, 1, 1, 1, 1,
-1.644351, -0.5970004, -0.998405, 1, 1, 1, 1, 1,
-1.634364, 0.1441989, -1.433281, 1, 1, 1, 1, 1,
-1.612768, -0.6956485, -2.363855, 1, 1, 1, 1, 1,
-1.601239, -1.046776, -1.445625, 1, 1, 1, 1, 1,
-1.60118, 0.9727124, 0.4814356, 0, 0, 1, 1, 1,
-1.595522, -0.7557955, -2.867914, 1, 0, 0, 1, 1,
-1.5936, -2.234646, -1.005205, 1, 0, 0, 1, 1,
-1.581486, -0.8812261, -2.848517, 1, 0, 0, 1, 1,
-1.574211, 0.5710369, -1.613139, 1, 0, 0, 1, 1,
-1.571497, -1.050435, -2.263672, 1, 0, 0, 1, 1,
-1.564329, 0.6919073, -2.102818, 0, 0, 0, 1, 1,
-1.551855, -0.9769976, -4.062066, 0, 0, 0, 1, 1,
-1.550787, 1.271251, 0.3251282, 0, 0, 0, 1, 1,
-1.544186, -0.3255365, -1.427424, 0, 0, 0, 1, 1,
-1.531496, -0.08272817, -1.951659, 0, 0, 0, 1, 1,
-1.530061, -1.598689, -2.300825, 0, 0, 0, 1, 1,
-1.527118, -1.607833, -2.326932, 0, 0, 0, 1, 1,
-1.523357, -2.393394, -3.239311, 1, 1, 1, 1, 1,
-1.521435, -1.477064, -2.168087, 1, 1, 1, 1, 1,
-1.52102, 0.3854921, -2.332899, 1, 1, 1, 1, 1,
-1.515177, 0.8777048, -1.425063, 1, 1, 1, 1, 1,
-1.506293, 0.484696, -1.355069, 1, 1, 1, 1, 1,
-1.49613, 0.4944446, -2.866569, 1, 1, 1, 1, 1,
-1.488702, -1.599013, -2.956542, 1, 1, 1, 1, 1,
-1.484159, -0.1416885, -2.028709, 1, 1, 1, 1, 1,
-1.483955, -0.05421738, -0.9685708, 1, 1, 1, 1, 1,
-1.462303, -0.5615821, -2.366223, 1, 1, 1, 1, 1,
-1.45757, 1.647373, 0.1286609, 1, 1, 1, 1, 1,
-1.455241, 0.08578867, -0.03689762, 1, 1, 1, 1, 1,
-1.455209, -0.2612676, -1.271289, 1, 1, 1, 1, 1,
-1.447696, 0.8211085, -1.919901, 1, 1, 1, 1, 1,
-1.43913, 0.5078403, -1.725028, 1, 1, 1, 1, 1,
-1.422404, 0.560893, -0.2830279, 0, 0, 1, 1, 1,
-1.417155, 0.7380684, -1.58963, 1, 0, 0, 1, 1,
-1.408697, -0.5425881, -1.600244, 1, 0, 0, 1, 1,
-1.397939, -0.4474092, -0.8533927, 1, 0, 0, 1, 1,
-1.397893, 0.5159633, -1.969586, 1, 0, 0, 1, 1,
-1.386451, 0.8663046, -2.097033, 1, 0, 0, 1, 1,
-1.372652, -1.035974, -2.798085, 0, 0, 0, 1, 1,
-1.36928, -0.1412445, -2.767012, 0, 0, 0, 1, 1,
-1.366745, -1.457432, -3.707648, 0, 0, 0, 1, 1,
-1.365853, 1.599249, -2.406175, 0, 0, 0, 1, 1,
-1.360604, 1.830883, -0.05975382, 0, 0, 0, 1, 1,
-1.356289, 1.467009, -0.2218068, 0, 0, 0, 1, 1,
-1.322938, -2.140618, -0.9193329, 0, 0, 0, 1, 1,
-1.322106, 0.4828556, -2.590688, 1, 1, 1, 1, 1,
-1.320827, 1.000892, -1.912708, 1, 1, 1, 1, 1,
-1.305693, 0.1484889, -1.413808, 1, 1, 1, 1, 1,
-1.300173, -0.8837175, -2.850701, 1, 1, 1, 1, 1,
-1.298468, -0.296853, -3.082574, 1, 1, 1, 1, 1,
-1.297654, -1.088657, -4.066095, 1, 1, 1, 1, 1,
-1.281992, 0.2435585, -1.28493, 1, 1, 1, 1, 1,
-1.27956, -0.2978061, -2.061566, 1, 1, 1, 1, 1,
-1.276984, -0.4218192, -1.728018, 1, 1, 1, 1, 1,
-1.271996, -0.9020323, -1.352167, 1, 1, 1, 1, 1,
-1.262046, 1.846042, -2.389647, 1, 1, 1, 1, 1,
-1.2592, -1.955237, -2.548127, 1, 1, 1, 1, 1,
-1.257684, -1.180714, -2.434202, 1, 1, 1, 1, 1,
-1.257271, -1.152643, -2.98254, 1, 1, 1, 1, 1,
-1.247196, 2.219209, -0.9734825, 1, 1, 1, 1, 1,
-1.243399, 0.01222294, -1.541427, 0, 0, 1, 1, 1,
-1.237413, 0.4851633, -2.388386, 1, 0, 0, 1, 1,
-1.23425, 1.193659, -2.935998, 1, 0, 0, 1, 1,
-1.233629, -0.7392694, -0.6153288, 1, 0, 0, 1, 1,
-1.229887, 0.4031574, -1.680743, 1, 0, 0, 1, 1,
-1.227029, 0.8835806, -0.01475307, 1, 0, 0, 1, 1,
-1.224521, 0.6848745, -1.776418, 0, 0, 0, 1, 1,
-1.213605, 0.01412868, -1.575156, 0, 0, 0, 1, 1,
-1.208875, 0.3902078, -2.318789, 0, 0, 0, 1, 1,
-1.201116, -0.1658371, 0.09453841, 0, 0, 0, 1, 1,
-1.199012, -0.7536356, -1.884075, 0, 0, 0, 1, 1,
-1.198177, 0.9978682, -1.71005, 0, 0, 0, 1, 1,
-1.183507, 0.2899045, -1.362472, 0, 0, 0, 1, 1,
-1.18252, -1.305058, -3.570225, 1, 1, 1, 1, 1,
-1.18048, -0.3060452, -1.828228, 1, 1, 1, 1, 1,
-1.175831, 1.76125, -0.6043286, 1, 1, 1, 1, 1,
-1.164579, 0.6264201, -1.432869, 1, 1, 1, 1, 1,
-1.157866, 0.5953918, -1.358925, 1, 1, 1, 1, 1,
-1.155069, -1.195534, -2.148268, 1, 1, 1, 1, 1,
-1.151877, 1.863007, -0.7997097, 1, 1, 1, 1, 1,
-1.151249, 1.892915, -0.2409755, 1, 1, 1, 1, 1,
-1.140555, -0.2572631, -1.368759, 1, 1, 1, 1, 1,
-1.138931, -0.03751208, -1.956293, 1, 1, 1, 1, 1,
-1.1341, -0.3934907, -2.914049, 1, 1, 1, 1, 1,
-1.133624, 1.231865, -1.153593, 1, 1, 1, 1, 1,
-1.133143, 1.674645, -0.04344122, 1, 1, 1, 1, 1,
-1.13117, -0.888459, -3.001418, 1, 1, 1, 1, 1,
-1.130037, 0.8358129, 0.03602447, 1, 1, 1, 1, 1,
-1.128244, 1.419489, 0.7985357, 0, 0, 1, 1, 1,
-1.110553, 0.4080609, -0.5187572, 1, 0, 0, 1, 1,
-1.110549, 0.441245, -1.827776, 1, 0, 0, 1, 1,
-1.103884, -0.1896289, -3.391922, 1, 0, 0, 1, 1,
-1.099877, -1.770636, -3.308831, 1, 0, 0, 1, 1,
-1.096124, -0.5322562, -0.198146, 1, 0, 0, 1, 1,
-1.094179, 0.0895242, -1.672623, 0, 0, 0, 1, 1,
-1.092525, -0.5127053, -2.89729, 0, 0, 0, 1, 1,
-1.082064, 2.450019, 1.370181, 0, 0, 0, 1, 1,
-1.080249, 1.017386, -0.8501551, 0, 0, 0, 1, 1,
-1.074407, 1.336726, -1.854107, 0, 0, 0, 1, 1,
-1.068235, -0.6205879, -2.031022, 0, 0, 0, 1, 1,
-1.066653, -0.340472, -0.7034225, 0, 0, 0, 1, 1,
-1.061515, 0.7215943, -1.37739, 1, 1, 1, 1, 1,
-1.061046, 1.084722, 1.125434, 1, 1, 1, 1, 1,
-1.059653, -0.9779386, -2.293884, 1, 1, 1, 1, 1,
-1.050146, -0.9326537, -1.79435, 1, 1, 1, 1, 1,
-1.043285, 0.3947824, -2.271363, 1, 1, 1, 1, 1,
-1.040107, 0.6172975, -0.3363199, 1, 1, 1, 1, 1,
-1.039759, 0.44177, -2.43888, 1, 1, 1, 1, 1,
-1.038672, -0.4203971, -2.194309, 1, 1, 1, 1, 1,
-1.038055, 1.35399, -0.4266514, 1, 1, 1, 1, 1,
-1.026904, -1.104843, -2.197666, 1, 1, 1, 1, 1,
-1.021396, -1.039909, -1.391835, 1, 1, 1, 1, 1,
-1.019922, 0.3141766, -1.432559, 1, 1, 1, 1, 1,
-1.017798, 1.887836, -1.230939, 1, 1, 1, 1, 1,
-1.007861, 1.848942, -0.3951249, 1, 1, 1, 1, 1,
-1.00743, -0.06340366, -1.856862, 1, 1, 1, 1, 1,
-1.004877, -0.1132431, -2.032869, 0, 0, 1, 1, 1,
-0.9986276, -0.5182338, -1.788021, 1, 0, 0, 1, 1,
-0.9886077, 2.152465, 0.06370322, 1, 0, 0, 1, 1,
-0.9851729, -1.04002, -2.199924, 1, 0, 0, 1, 1,
-0.9849299, -1.719773, -1.529944, 1, 0, 0, 1, 1,
-0.9838478, -2.340272, -2.548973, 1, 0, 0, 1, 1,
-0.9780526, -0.4113666, -3.830206, 0, 0, 0, 1, 1,
-0.9756373, 0.1894099, -1.082444, 0, 0, 0, 1, 1,
-0.9725072, -0.2705885, -3.900361, 0, 0, 0, 1, 1,
-0.9710353, 0.7502987, 1.419884, 0, 0, 0, 1, 1,
-0.9653719, 0.8410923, 0.224141, 0, 0, 0, 1, 1,
-0.9589569, 1.416234, -1.096263, 0, 0, 0, 1, 1,
-0.9568523, 1.941917, -1.45733, 0, 0, 0, 1, 1,
-0.9520055, -0.7527903, 0.2306781, 1, 1, 1, 1, 1,
-0.9423327, -1.038275, -0.9546587, 1, 1, 1, 1, 1,
-0.9414728, -1.037247, -3.721912, 1, 1, 1, 1, 1,
-0.9372517, -2.0065, -2.721766, 1, 1, 1, 1, 1,
-0.9361598, 0.3561522, -2.12755, 1, 1, 1, 1, 1,
-0.9335335, 1.531486, -1.720855, 1, 1, 1, 1, 1,
-0.9321331, -0.9482875, -1.732557, 1, 1, 1, 1, 1,
-0.9302695, 1.116872, 0.5206063, 1, 1, 1, 1, 1,
-0.9260693, 2.070157, -2.329996, 1, 1, 1, 1, 1,
-0.9240099, 1.349706, 0.363231, 1, 1, 1, 1, 1,
-0.9236658, 0.8349462, 0.1808981, 1, 1, 1, 1, 1,
-0.9221919, 0.4309641, -0.8793098, 1, 1, 1, 1, 1,
-0.9106179, 1.940973, 0.3317785, 1, 1, 1, 1, 1,
-0.9063629, 0.330553, -2.618895, 1, 1, 1, 1, 1,
-0.9051018, 0.1774715, -0.2648533, 1, 1, 1, 1, 1,
-0.8961887, -0.9246523, -3.452346, 0, 0, 1, 1, 1,
-0.8943271, 0.7347621, -0.4657272, 1, 0, 0, 1, 1,
-0.8909032, 1.171854, -0.2157187, 1, 0, 0, 1, 1,
-0.8874556, -0.1309305, -1.399707, 1, 0, 0, 1, 1,
-0.8806178, -0.4708767, -2.188357, 1, 0, 0, 1, 1,
-0.8753068, 1.31393, 0.6474647, 1, 0, 0, 1, 1,
-0.8730094, -1.035481, -0.8617107, 0, 0, 0, 1, 1,
-0.872142, -2.76492, -4.071484, 0, 0, 0, 1, 1,
-0.8715588, 0.2145144, -2.964921, 0, 0, 0, 1, 1,
-0.8715375, -1.330287, -2.852255, 0, 0, 0, 1, 1,
-0.8709407, 1.181266, -0.6265665, 0, 0, 0, 1, 1,
-0.866326, 1.944496, -3.039133, 0, 0, 0, 1, 1,
-0.8653924, 1.021549, 0.1494081, 0, 0, 0, 1, 1,
-0.860526, 0.3765028, -1.681877, 1, 1, 1, 1, 1,
-0.8596693, -0.6313874, -0.9020125, 1, 1, 1, 1, 1,
-0.8596079, 0.1064552, -2.797467, 1, 1, 1, 1, 1,
-0.8503891, 0.7324743, 0.3760454, 1, 1, 1, 1, 1,
-0.8487578, 1.494208, 1.118701, 1, 1, 1, 1, 1,
-0.8486678, 0.3171676, -1.625461, 1, 1, 1, 1, 1,
-0.8477423, 0.1376035, -0.2014019, 1, 1, 1, 1, 1,
-0.8464771, -0.9741089, -2.501221, 1, 1, 1, 1, 1,
-0.8456537, 0.2832464, -1.236772, 1, 1, 1, 1, 1,
-0.8415475, 1.391384, 0.9469988, 1, 1, 1, 1, 1,
-0.8392625, -2.033368, -3.110604, 1, 1, 1, 1, 1,
-0.8368813, -1.54023, -3.00867, 1, 1, 1, 1, 1,
-0.8317267, -0.00477567, -3.154554, 1, 1, 1, 1, 1,
-0.8296514, -0.09319136, -2.755087, 1, 1, 1, 1, 1,
-0.8264864, -1.611416, -3.841917, 1, 1, 1, 1, 1,
-0.823837, 2.667019, -0.5030332, 0, 0, 1, 1, 1,
-0.812088, -1.11944, -2.361388, 1, 0, 0, 1, 1,
-0.8098254, -0.4397922, -0.3428485, 1, 0, 0, 1, 1,
-0.8091266, -1.828679, -2.328175, 1, 0, 0, 1, 1,
-0.8089622, -1.062277, -0.3580571, 1, 0, 0, 1, 1,
-0.8073983, -0.3683974, -4.365587, 1, 0, 0, 1, 1,
-0.8004443, 0.4318515, -0.7798017, 0, 0, 0, 1, 1,
-0.7966551, 0.541931, -1.415376, 0, 0, 0, 1, 1,
-0.7961007, -0.5695853, -4.103267, 0, 0, 0, 1, 1,
-0.7854277, -1.470201, -2.85616, 0, 0, 0, 1, 1,
-0.7775137, 0.01763904, -1.39213, 0, 0, 0, 1, 1,
-0.7731161, 1.257101, -1.292618, 0, 0, 0, 1, 1,
-0.7687558, 0.7693742, -1.288976, 0, 0, 0, 1, 1,
-0.762364, 0.4482722, -1.614963, 1, 1, 1, 1, 1,
-0.7617279, -1.145765, -3.193076, 1, 1, 1, 1, 1,
-0.7605453, -1.219876, -3.147033, 1, 1, 1, 1, 1,
-0.758246, 0.5814264, -0.2883841, 1, 1, 1, 1, 1,
-0.7571259, -0.5015442, -3.592408, 1, 1, 1, 1, 1,
-0.7535154, -0.3986266, -2.5457, 1, 1, 1, 1, 1,
-0.7444833, 0.8052133, 0.4007187, 1, 1, 1, 1, 1,
-0.7404943, 0.2772551, -2.433472, 1, 1, 1, 1, 1,
-0.73654, -1.025679, -1.634769, 1, 1, 1, 1, 1,
-0.7357438, 1.23323, 0.4162161, 1, 1, 1, 1, 1,
-0.7314386, -0.5924196, -0.7871999, 1, 1, 1, 1, 1,
-0.7262921, 0.1012554, -1.371674, 1, 1, 1, 1, 1,
-0.7241229, 1.523229, 0.8658133, 1, 1, 1, 1, 1,
-0.7233885, 0.4455066, -2.133285, 1, 1, 1, 1, 1,
-0.7221333, 1.39794, 0.2094675, 1, 1, 1, 1, 1,
-0.7194495, 0.07826792, -1.981065, 0, 0, 1, 1, 1,
-0.7192616, 0.6956671, -1.165969, 1, 0, 0, 1, 1,
-0.7151494, -0.7955313, -3.880812, 1, 0, 0, 1, 1,
-0.7128919, 0.9414925, -1.325509, 1, 0, 0, 1, 1,
-0.712349, 1.515445, -1.033749, 1, 0, 0, 1, 1,
-0.7022606, -0.2464598, -1.361616, 1, 0, 0, 1, 1,
-0.6920336, -0.1084594, -1.991035, 0, 0, 0, 1, 1,
-0.6920046, 1.179966, -1.444622, 0, 0, 0, 1, 1,
-0.6911008, -0.05317167, -2.773838, 0, 0, 0, 1, 1,
-0.6851104, -1.279626, -2.586798, 0, 0, 0, 1, 1,
-0.6819922, 1.376232, -2.219825, 0, 0, 0, 1, 1,
-0.6768702, 0.2073078, 0.8002913, 0, 0, 0, 1, 1,
-0.6762801, -0.01510668, -0.8885104, 0, 0, 0, 1, 1,
-0.6735911, -0.2262428, -4.103962, 1, 1, 1, 1, 1,
-0.6730235, 0.3039911, -1.668993, 1, 1, 1, 1, 1,
-0.6718944, -1.154943, -2.210408, 1, 1, 1, 1, 1,
-0.6690193, -0.04871964, -1.975962, 1, 1, 1, 1, 1,
-0.6652385, -0.2906641, -0.6581789, 1, 1, 1, 1, 1,
-0.6629966, -0.9863312, -1.945115, 1, 1, 1, 1, 1,
-0.6609339, 0.8956653, 1.380031, 1, 1, 1, 1, 1,
-0.6578611, -0.0421675, -2.233328, 1, 1, 1, 1, 1,
-0.6538938, 0.5086664, -1.351696, 1, 1, 1, 1, 1,
-0.6509901, -0.02021522, -2.519058, 1, 1, 1, 1, 1,
-0.6488063, 1.523943, 0.02269096, 1, 1, 1, 1, 1,
-0.6465725, 0.1412192, 0.2897066, 1, 1, 1, 1, 1,
-0.6454923, 0.7512778, -1.225694, 1, 1, 1, 1, 1,
-0.6395295, -0.1027179, -2.063386, 1, 1, 1, 1, 1,
-0.6353487, -1.752453, -1.852015, 1, 1, 1, 1, 1,
-0.6324107, 0.04501847, -0.7334718, 0, 0, 1, 1, 1,
-0.6277596, 0.9258733, 1.126284, 1, 0, 0, 1, 1,
-0.6277018, -0.1549837, -2.44292, 1, 0, 0, 1, 1,
-0.627622, -0.8715577, -4.000918, 1, 0, 0, 1, 1,
-0.6074606, 0.8876125, -0.6474583, 1, 0, 0, 1, 1,
-0.6028692, 2.084745, -0.3932243, 1, 0, 0, 1, 1,
-0.6025035, -0.6375434, -0.9314165, 0, 0, 0, 1, 1,
-0.5958739, -0.8321213, -1.65293, 0, 0, 0, 1, 1,
-0.5954261, 0.9926549, -1.268126, 0, 0, 0, 1, 1,
-0.5914217, 0.7957884, -1.356797, 0, 0, 0, 1, 1,
-0.5867168, -0.9395006, -4.189251, 0, 0, 0, 1, 1,
-0.586058, 0.6629698, -4.405401, 0, 0, 0, 1, 1,
-0.5843533, 0.02004868, -1.199157, 0, 0, 0, 1, 1,
-0.5796145, 0.4110623, 0.4058647, 1, 1, 1, 1, 1,
-0.5788096, -0.9953071, -3.435001, 1, 1, 1, 1, 1,
-0.5773078, -1.149931, -4.259347, 1, 1, 1, 1, 1,
-0.5762392, -0.4525394, -1.341668, 1, 1, 1, 1, 1,
-0.5752968, 0.3394723, -1.36839, 1, 1, 1, 1, 1,
-0.5727488, 0.4234935, 0.4203967, 1, 1, 1, 1, 1,
-0.5564394, 0.2485135, -0.5937774, 1, 1, 1, 1, 1,
-0.5554195, 2.181601, 0.5680891, 1, 1, 1, 1, 1,
-0.5502697, -0.07743919, -1.473523, 1, 1, 1, 1, 1,
-0.5493345, -2.77063, -1.335384, 1, 1, 1, 1, 1,
-0.5417567, 1.867224, -0.5643719, 1, 1, 1, 1, 1,
-0.5407391, 0.7133298, 0.125633, 1, 1, 1, 1, 1,
-0.533687, -0.186153, -2.437872, 1, 1, 1, 1, 1,
-0.5332204, -1.56305, -1.462007, 1, 1, 1, 1, 1,
-0.5322126, -0.8943923, -2.565515, 1, 1, 1, 1, 1,
-0.5237051, -1.755506, -3.255112, 0, 0, 1, 1, 1,
-0.5206305, -1.115701, -2.280745, 1, 0, 0, 1, 1,
-0.5192859, -1.556702, -3.518053, 1, 0, 0, 1, 1,
-0.5159667, 0.9958081, 0.6974828, 1, 0, 0, 1, 1,
-0.5140744, 1.074506, -1.580545, 1, 0, 0, 1, 1,
-0.5109531, 0.9104815, -0.799275, 1, 0, 0, 1, 1,
-0.5013958, -0.167971, -1.722331, 0, 0, 0, 1, 1,
-0.4924872, -0.4003291, -1.286762, 0, 0, 0, 1, 1,
-0.491092, -0.4758308, -3.742319, 0, 0, 0, 1, 1,
-0.4896587, -1.151996, -3.11979, 0, 0, 0, 1, 1,
-0.4874209, -0.3393622, -0.08832376, 0, 0, 0, 1, 1,
-0.482921, -0.4006838, -0.9171596, 0, 0, 0, 1, 1,
-0.481535, 0.4294684, -0.9154114, 0, 0, 0, 1, 1,
-0.4808221, 0.3588377, -1.242635, 1, 1, 1, 1, 1,
-0.4793309, 0.4542607, -1.496046, 1, 1, 1, 1, 1,
-0.4777817, 0.8036263, -1.746566, 1, 1, 1, 1, 1,
-0.477614, 1.534999, 0.7844124, 1, 1, 1, 1, 1,
-0.4773851, -1.79187, -3.879174, 1, 1, 1, 1, 1,
-0.4767273, 0.3324984, -0.438052, 1, 1, 1, 1, 1,
-0.4764237, 1.796885, 0.6675473, 1, 1, 1, 1, 1,
-0.4760616, 1.604043, -0.1176834, 1, 1, 1, 1, 1,
-0.4746676, 0.4711927, -1.567255, 1, 1, 1, 1, 1,
-0.4737689, 0.1296107, -2.469924, 1, 1, 1, 1, 1,
-0.4702975, -0.3668363, -2.040332, 1, 1, 1, 1, 1,
-0.4698246, -1.574995, -3.602606, 1, 1, 1, 1, 1,
-0.4672374, 1.048347, -1.937818, 1, 1, 1, 1, 1,
-0.4588107, -0.690784, -2.12893, 1, 1, 1, 1, 1,
-0.4557593, 0.3771018, -1.925616, 1, 1, 1, 1, 1,
-0.4520511, 0.7626632, -0.8658764, 0, 0, 1, 1, 1,
-0.4500873, -0.2624289, -1.323737, 1, 0, 0, 1, 1,
-0.4485727, 0.593994, 0.3659317, 1, 0, 0, 1, 1,
-0.448017, 1.570513, 0.4403023, 1, 0, 0, 1, 1,
-0.4459934, 0.8744496, -1.597663, 1, 0, 0, 1, 1,
-0.4397792, 1.290199, -1.238995, 1, 0, 0, 1, 1,
-0.4386751, 2.483316, -0.248424, 0, 0, 0, 1, 1,
-0.4342899, -0.9810311, -3.930698, 0, 0, 0, 1, 1,
-0.4327404, -0.8875105, -2.430735, 0, 0, 0, 1, 1,
-0.4314927, 1.830568, -0.7073478, 0, 0, 0, 1, 1,
-0.4292947, -1.109239, -2.287808, 0, 0, 0, 1, 1,
-0.4233367, -0.5135548, -1.859978, 0, 0, 0, 1, 1,
-0.4216965, -0.9417425, -1.98431, 0, 0, 0, 1, 1,
-0.4202697, 0.07581333, -2.440505, 1, 1, 1, 1, 1,
-0.4194061, -0.9502345, -0.9557003, 1, 1, 1, 1, 1,
-0.4158936, 0.5788929, 0.5388948, 1, 1, 1, 1, 1,
-0.4120076, 0.369415, -0.3539893, 1, 1, 1, 1, 1,
-0.4110183, 1.2862, 0.130057, 1, 1, 1, 1, 1,
-0.4087974, -0.7487776, -2.949132, 1, 1, 1, 1, 1,
-0.4010279, -0.1740354, -0.9003143, 1, 1, 1, 1, 1,
-0.3968087, -0.8134388, -4.707606, 1, 1, 1, 1, 1,
-0.3933497, 0.8181919, -2.52887, 1, 1, 1, 1, 1,
-0.3916448, 0.990938, 1.73378, 1, 1, 1, 1, 1,
-0.3886192, 0.6862526, -1.146896, 1, 1, 1, 1, 1,
-0.3819861, -0.48528, -2.617409, 1, 1, 1, 1, 1,
-0.380239, 0.8033983, -0.8230183, 1, 1, 1, 1, 1,
-0.3800086, 0.1656542, -2.137163, 1, 1, 1, 1, 1,
-0.379498, -1.771542, -3.011546, 1, 1, 1, 1, 1,
-0.376669, 1.006852, 0.3290966, 0, 0, 1, 1, 1,
-0.367678, 0.6425255, -0.3704541, 1, 0, 0, 1, 1,
-0.3653078, 0.3489755, -0.3318716, 1, 0, 0, 1, 1,
-0.3605985, 0.3010848, -0.1010199, 1, 0, 0, 1, 1,
-0.3591515, 1.164057, 1.062796, 1, 0, 0, 1, 1,
-0.3526313, -0.9531037, -1.225248, 1, 0, 0, 1, 1,
-0.3499203, -1.033699, -2.217467, 0, 0, 0, 1, 1,
-0.3481946, -1.40617, -3.058073, 0, 0, 0, 1, 1,
-0.347018, -0.4310445, -1.498496, 0, 0, 0, 1, 1,
-0.3439932, -1.005987, -3.11361, 0, 0, 0, 1, 1,
-0.3428825, -1.299828, -1.178907, 0, 0, 0, 1, 1,
-0.3417304, -1.295909, -3.165225, 0, 0, 0, 1, 1,
-0.3385396, 0.4606334, -0.8386984, 0, 0, 0, 1, 1,
-0.3284165, 0.2282439, -0.2893487, 1, 1, 1, 1, 1,
-0.3281603, -0.6536601, -3.013951, 1, 1, 1, 1, 1,
-0.3268944, -0.5122137, -3.030374, 1, 1, 1, 1, 1,
-0.3239994, 0.7488542, 1.194771, 1, 1, 1, 1, 1,
-0.3190498, 0.6428393, -1.454653, 1, 1, 1, 1, 1,
-0.317049, -0.5493803, -2.151173, 1, 1, 1, 1, 1,
-0.3143376, 0.2199168, -0.5574808, 1, 1, 1, 1, 1,
-0.3127247, -0.48356, -3.870001, 1, 1, 1, 1, 1,
-0.3102066, -0.9814865, -6.157114, 1, 1, 1, 1, 1,
-0.3094692, 1.009054, -0.3649282, 1, 1, 1, 1, 1,
-0.3091769, -0.4543071, -4.724978, 1, 1, 1, 1, 1,
-0.3072747, -0.5850731, -3.588191, 1, 1, 1, 1, 1,
-0.3062866, 1.743881, -0.6507271, 1, 1, 1, 1, 1,
-0.2972835, 0.1689841, -0.9708674, 1, 1, 1, 1, 1,
-0.2947191, -0.8227834, -2.690897, 1, 1, 1, 1, 1,
-0.2944733, -0.4572674, -4.545822, 0, 0, 1, 1, 1,
-0.2941535, 0.5880796, -2.490967, 1, 0, 0, 1, 1,
-0.2931319, 0.2907968, -1.586073, 1, 0, 0, 1, 1,
-0.2915348, -1.298556, -3.122922, 1, 0, 0, 1, 1,
-0.2878187, -0.3002321, -3.655738, 1, 0, 0, 1, 1,
-0.2854367, 0.802501, -0.1806535, 1, 0, 0, 1, 1,
-0.284075, 0.07572164, -2.700126, 0, 0, 0, 1, 1,
-0.2836005, -0.6109492, -2.961233, 0, 0, 0, 1, 1,
-0.2727349, -0.783162, -2.290197, 0, 0, 0, 1, 1,
-0.2686295, -0.7609601, -3.897014, 0, 0, 0, 1, 1,
-0.2643446, 0.6393425, -1.538657, 0, 0, 0, 1, 1,
-0.2628593, 0.08322323, -0.1135448, 0, 0, 0, 1, 1,
-0.2597146, 0.7346697, -0.7359945, 0, 0, 0, 1, 1,
-0.2553391, -0.0532934, -1.412917, 1, 1, 1, 1, 1,
-0.2541937, -0.09173664, -1.217232, 1, 1, 1, 1, 1,
-0.2529123, 0.8948942, -0.09268672, 1, 1, 1, 1, 1,
-0.2510284, -0.1319812, -1.946527, 1, 1, 1, 1, 1,
-0.2489776, 0.5438663, 1.459988, 1, 1, 1, 1, 1,
-0.2453343, -1.204246, -3.334996, 1, 1, 1, 1, 1,
-0.2412739, 1.148939, -1.647447, 1, 1, 1, 1, 1,
-0.2312153, 0.03831086, -2.07076, 1, 1, 1, 1, 1,
-0.2310093, 0.5308295, -1.13025, 1, 1, 1, 1, 1,
-0.2287055, -0.308813, -4.788053, 1, 1, 1, 1, 1,
-0.2255784, 0.4506497, 0.6072245, 1, 1, 1, 1, 1,
-0.2223456, 0.398228, -0.1078124, 1, 1, 1, 1, 1,
-0.2211593, 3.072226, 0.5738419, 1, 1, 1, 1, 1,
-0.2164149, 1.636679, -0.8282554, 1, 1, 1, 1, 1,
-0.2153786, -1.348036, -2.483063, 1, 1, 1, 1, 1,
-0.2135675, 0.4341975, 1.345147, 0, 0, 1, 1, 1,
-0.212911, 0.5407918, -0.9224257, 1, 0, 0, 1, 1,
-0.2126639, 0.2896523, -0.8196036, 1, 0, 0, 1, 1,
-0.2110975, 1.612389, -0.4700011, 1, 0, 0, 1, 1,
-0.2108334, -2.07527, -2.685158, 1, 0, 0, 1, 1,
-0.2108232, 0.04852527, -0.9662151, 1, 0, 0, 1, 1,
-0.210209, 0.1743521, 1.105992, 0, 0, 0, 1, 1,
-0.2084485, 1.405727, 1.232177, 0, 0, 0, 1, 1,
-0.2032312, 0.2424167, -1.323268, 0, 0, 0, 1, 1,
-0.2004168, -0.7568581, -1.216179, 0, 0, 0, 1, 1,
-0.1980875, -0.5764732, -2.560471, 0, 0, 0, 1, 1,
-0.1977869, -1.073043, -2.605208, 0, 0, 0, 1, 1,
-0.1967748, -0.08584961, -1.258067, 0, 0, 0, 1, 1,
-0.1910228, -0.9759585, -3.550916, 1, 1, 1, 1, 1,
-0.1906089, -0.5220389, -3.126435, 1, 1, 1, 1, 1,
-0.1896435, -0.2078363, -1.399543, 1, 1, 1, 1, 1,
-0.1875046, 0.4123402, -1.306919, 1, 1, 1, 1, 1,
-0.1869728, -0.3974593, -3.272572, 1, 1, 1, 1, 1,
-0.1836745, -0.1431587, -3.398765, 1, 1, 1, 1, 1,
-0.1834617, 0.5811851, -1.398303, 1, 1, 1, 1, 1,
-0.1813244, 0.4557894, 0.4199802, 1, 1, 1, 1, 1,
-0.1800451, 0.9373235, -0.3792744, 1, 1, 1, 1, 1,
-0.1780724, -0.8149053, -3.05561, 1, 1, 1, 1, 1,
-0.1762746, 0.9906482, -0.04819309, 1, 1, 1, 1, 1,
-0.1709035, -0.6165317, -1.506479, 1, 1, 1, 1, 1,
-0.1673913, -1.805438, -3.204669, 1, 1, 1, 1, 1,
-0.1633278, -1.28969, -1.744172, 1, 1, 1, 1, 1,
-0.1612186, -0.8380485, -3.424074, 1, 1, 1, 1, 1,
-0.1574875, -0.1127724, -2.575302, 0, 0, 1, 1, 1,
-0.1545216, 0.6269671, 0.4492079, 1, 0, 0, 1, 1,
-0.1465925, 1.698634, -0.2232174, 1, 0, 0, 1, 1,
-0.1464284, 0.5733945, -0.2938982, 1, 0, 0, 1, 1,
-0.1450229, -0.6268944, -2.683295, 1, 0, 0, 1, 1,
-0.1449389, 1.368982, 0.954502, 1, 0, 0, 1, 1,
-0.1387247, 0.6732423, 1.216741, 0, 0, 0, 1, 1,
-0.1383602, -1.065465, -2.219152, 0, 0, 0, 1, 1,
-0.1381542, -0.8954057, -2.069167, 0, 0, 0, 1, 1,
-0.1366324, 1.213191, 0.4211017, 0, 0, 0, 1, 1,
-0.1352081, -0.348688, -4.124438, 0, 0, 0, 1, 1,
-0.1332675, 0.04706784, -2.385734, 0, 0, 0, 1, 1,
-0.1316917, 0.3691883, 0.5672937, 0, 0, 0, 1, 1,
-0.1224629, -0.1771646, -2.009289, 1, 1, 1, 1, 1,
-0.1205893, -1.114299, -4.785765, 1, 1, 1, 1, 1,
-0.1203707, -0.393831, -3.59897, 1, 1, 1, 1, 1,
-0.1112795, 0.6364172, 0.4688741, 1, 1, 1, 1, 1,
-0.1063037, -1.779053, -2.526175, 1, 1, 1, 1, 1,
-0.09863397, 0.04654535, -0.07236307, 1, 1, 1, 1, 1,
-0.09661168, -0.9922416, -4.531031, 1, 1, 1, 1, 1,
-0.09637445, -0.3053353, -3.32352, 1, 1, 1, 1, 1,
-0.09322256, -0.7411424, -4.108121, 1, 1, 1, 1, 1,
-0.09195592, 0.3757467, -1.165304, 1, 1, 1, 1, 1,
-0.08530438, 0.7441026, -0.1627822, 1, 1, 1, 1, 1,
-0.08346468, -0.6498253, -1.939106, 1, 1, 1, 1, 1,
-0.08292642, -0.6265073, -2.094231, 1, 1, 1, 1, 1,
-0.08130328, -1.86579, -2.260348, 1, 1, 1, 1, 1,
-0.07805183, -1.497836, -2.763124, 1, 1, 1, 1, 1,
-0.07370912, -1.254885, -4.290692, 0, 0, 1, 1, 1,
-0.07170215, -0.650925, -2.625445, 1, 0, 0, 1, 1,
-0.06818423, -0.1647443, -2.844619, 1, 0, 0, 1, 1,
-0.065906, 0.83711, 0.05510075, 1, 0, 0, 1, 1,
-0.06430703, -0.3481047, -3.988698, 1, 0, 0, 1, 1,
-0.06321087, 0.03330731, -0.8757452, 1, 0, 0, 1, 1,
-0.05797646, -1.71666, -3.410846, 0, 0, 0, 1, 1,
-0.05344898, 0.6522882, 1.3982, 0, 0, 0, 1, 1,
-0.05343521, -0.3420633, -4.115663, 0, 0, 0, 1, 1,
-0.0517703, 0.438213, 0.5752354, 0, 0, 0, 1, 1,
-0.05164449, 0.2684016, -0.117013, 0, 0, 0, 1, 1,
-0.04903376, 1.035536, 0.7185782, 0, 0, 0, 1, 1,
-0.04519913, -0.5551495, -4.127444, 0, 0, 0, 1, 1,
-0.03638318, -1.679186, -2.445122, 1, 1, 1, 1, 1,
-0.032423, 1.718696, 0.6928895, 1, 1, 1, 1, 1,
-0.03126102, 0.9138708, -0.6077617, 1, 1, 1, 1, 1,
-0.02997054, 0.6348935, 0.9057534, 1, 1, 1, 1, 1,
-0.02926289, 0.4779238, -0.7147315, 1, 1, 1, 1, 1,
-0.02768341, 0.1822198, -1.323056, 1, 1, 1, 1, 1,
-0.02444348, 2.025602, 1.084581, 1, 1, 1, 1, 1,
-0.01787941, 0.1496529, -2.583587, 1, 1, 1, 1, 1,
-0.0169261, 1.548962, -0.4959523, 1, 1, 1, 1, 1,
-0.01375442, -1.218731, -3.584326, 1, 1, 1, 1, 1,
-0.01082702, 0.7435192, 2.109872, 1, 1, 1, 1, 1,
-0.009481258, 0.844956, -1.346074, 1, 1, 1, 1, 1,
-0.006824972, 1.021667, -0.9729347, 1, 1, 1, 1, 1,
-0.004485202, -0.7663338, -3.383303, 1, 1, 1, 1, 1,
0.0003594875, -0.06255544, 3.144109, 1, 1, 1, 1, 1,
0.00736404, -0.5904325, 3.105292, 0, 0, 1, 1, 1,
0.008348798, -0.4266103, 3.174265, 1, 0, 0, 1, 1,
0.01389921, 0.3305949, 0.3774715, 1, 0, 0, 1, 1,
0.0163488, -1.282832, 2.402761, 1, 0, 0, 1, 1,
0.02246222, 1.652652, 0.3739239, 1, 0, 0, 1, 1,
0.02256388, -1.607371, 2.29098, 1, 0, 0, 1, 1,
0.02429619, -2.514961, 3.852325, 0, 0, 0, 1, 1,
0.0275365, 1.477699, 1.094652, 0, 0, 0, 1, 1,
0.02818228, -0.916687, 2.645652, 0, 0, 0, 1, 1,
0.03150497, 0.9066447, -1.079004, 0, 0, 0, 1, 1,
0.03237676, -0.5722379, 3.634554, 0, 0, 0, 1, 1,
0.03501406, 1.720255, -0.2329652, 0, 0, 0, 1, 1,
0.03859408, 0.6078435, -2.098458, 0, 0, 0, 1, 1,
0.04091416, -0.2727568, 2.651885, 1, 1, 1, 1, 1,
0.04600804, 1.385408, -1.561548, 1, 1, 1, 1, 1,
0.04755061, -0.3724394, 3.598016, 1, 1, 1, 1, 1,
0.04964258, 0.2077392, -0.02275097, 1, 1, 1, 1, 1,
0.05060663, 0.2266537, -0.510467, 1, 1, 1, 1, 1,
0.0520623, 0.3836559, 1.921497, 1, 1, 1, 1, 1,
0.05377599, 1.421518, -0.01424327, 1, 1, 1, 1, 1,
0.0617222, 1.262032, 0.2402058, 1, 1, 1, 1, 1,
0.062128, -1.442037, 2.284223, 1, 1, 1, 1, 1,
0.06241091, 0.2446594, -0.8505747, 1, 1, 1, 1, 1,
0.0629064, 1.11358, 0.6931763, 1, 1, 1, 1, 1,
0.06431439, -0.4709115, 3.758425, 1, 1, 1, 1, 1,
0.07621683, 0.5156278, -0.04853536, 1, 1, 1, 1, 1,
0.07631034, -0.1020076, 3.14934, 1, 1, 1, 1, 1,
0.07868973, -1.137411, 3.12956, 1, 1, 1, 1, 1,
0.08065075, -0.6665677, 2.588916, 0, 0, 1, 1, 1,
0.08561076, 0.5645138, 1.281719, 1, 0, 0, 1, 1,
0.09372916, -0.8764185, 3.613778, 1, 0, 0, 1, 1,
0.09570249, -1.191597, 2.547946, 1, 0, 0, 1, 1,
0.09575862, -0.7255629, 4.151135, 1, 0, 0, 1, 1,
0.0998997, -0.4924983, 2.999292, 1, 0, 0, 1, 1,
0.1000648, 0.8590847, -1.53597, 0, 0, 0, 1, 1,
0.1005241, 0.2231503, 0.45971, 0, 0, 0, 1, 1,
0.105663, -1.380361, 3.401348, 0, 0, 0, 1, 1,
0.1090897, -0.8771464, 4.695049, 0, 0, 0, 1, 1,
0.1115413, 0.6049694, 0.5740322, 0, 0, 0, 1, 1,
0.1139537, -1.349156, 2.45183, 0, 0, 0, 1, 1,
0.1140153, -0.503181, 2.639834, 0, 0, 0, 1, 1,
0.1171547, -2.062959, 3.894257, 1, 1, 1, 1, 1,
0.1186392, -1.024819, 2.125832, 1, 1, 1, 1, 1,
0.1216465, -1.456224, 2.998115, 1, 1, 1, 1, 1,
0.1220482, -0.1551832, 2.328728, 1, 1, 1, 1, 1,
0.1226108, -0.4028108, 4.064099, 1, 1, 1, 1, 1,
0.1229642, -1.372116, 3.491247, 1, 1, 1, 1, 1,
0.1230386, 0.7010629, 1.511944, 1, 1, 1, 1, 1,
0.1236063, -0.4055547, 3.443603, 1, 1, 1, 1, 1,
0.1268808, -0.2714659, 3.856485, 1, 1, 1, 1, 1,
0.1293236, -0.4126197, 4.355809, 1, 1, 1, 1, 1,
0.1296931, -2.895254, 5.400417, 1, 1, 1, 1, 1,
0.1298104, -0.3326808, 3.480256, 1, 1, 1, 1, 1,
0.1306729, -0.4670629, 4.170369, 1, 1, 1, 1, 1,
0.1311393, 1.642115, 0.2375296, 1, 1, 1, 1, 1,
0.1351295, -0.7669109, 2.499336, 1, 1, 1, 1, 1,
0.1394881, 0.4871216, 1.019683, 0, 0, 1, 1, 1,
0.1420681, 0.8646008, 3.129114, 1, 0, 0, 1, 1,
0.1442996, 1.139569, 0.5878116, 1, 0, 0, 1, 1,
0.1444591, 0.9514531, 1.228597, 1, 0, 0, 1, 1,
0.1520175, 0.166514, -0.621483, 1, 0, 0, 1, 1,
0.154732, 0.3549333, -0.5365866, 1, 0, 0, 1, 1,
0.1653578, 0.01206441, 1.750023, 0, 0, 0, 1, 1,
0.169693, 0.9542364, -0.3697269, 0, 0, 0, 1, 1,
0.1714185, 0.5020622, 0.4846308, 0, 0, 0, 1, 1,
0.1733843, -0.1756225, 3.367279, 0, 0, 0, 1, 1,
0.1741211, 0.9912847, 1.38477, 0, 0, 0, 1, 1,
0.1757637, 0.6786243, 1.214839, 0, 0, 0, 1, 1,
0.1772477, -0.7176151, 1.742012, 0, 0, 0, 1, 1,
0.1774986, 0.6256527, 0.1966283, 1, 1, 1, 1, 1,
0.1776701, 0.0472223, 2.101094, 1, 1, 1, 1, 1,
0.1845363, 1.158429, -0.1105, 1, 1, 1, 1, 1,
0.1852049, -0.1714147, 1.583352, 1, 1, 1, 1, 1,
0.1887884, -2.283331, 2.997534, 1, 1, 1, 1, 1,
0.1888044, 0.8306016, 0.863699, 1, 1, 1, 1, 1,
0.1944988, -1.78427, 3.823362, 1, 1, 1, 1, 1,
0.2060094, -0.2048277, 2.276491, 1, 1, 1, 1, 1,
0.2064653, -0.5506225, 2.264072, 1, 1, 1, 1, 1,
0.2113479, -0.8927266, 2.345113, 1, 1, 1, 1, 1,
0.2174753, -0.2629874, 1.840105, 1, 1, 1, 1, 1,
0.2193858, 0.2479836, 0.3222949, 1, 1, 1, 1, 1,
0.2242929, -0.7492926, 1.636643, 1, 1, 1, 1, 1,
0.2263075, 0.9813894, -0.6721351, 1, 1, 1, 1, 1,
0.2268027, -0.4355745, 1.545537, 1, 1, 1, 1, 1,
0.2451643, 0.830942, 0.2337268, 0, 0, 1, 1, 1,
0.2466148, 1.102503, 0.696985, 1, 0, 0, 1, 1,
0.2486456, -1.599152, 3.516209, 1, 0, 0, 1, 1,
0.2585377, -0.4653307, 2.448626, 1, 0, 0, 1, 1,
0.2607697, 0.02433921, 2.224873, 1, 0, 0, 1, 1,
0.2631304, 0.2690415, 0.6981635, 1, 0, 0, 1, 1,
0.2707709, 1.438001, -1.987893, 0, 0, 0, 1, 1,
0.2767407, 1.568703, 2.174455, 0, 0, 0, 1, 1,
0.2786196, -0.164067, 3.523345, 0, 0, 0, 1, 1,
0.2790602, -0.5429395, 0.6178458, 0, 0, 0, 1, 1,
0.280296, 1.358885, 0.9754171, 0, 0, 0, 1, 1,
0.2846439, 0.5031503, 0.1714038, 0, 0, 0, 1, 1,
0.2861361, -0.4624293, 2.266474, 0, 0, 0, 1, 1,
0.2897708, 1.351611, -0.8119072, 1, 1, 1, 1, 1,
0.2914278, 0.06169289, 1.624601, 1, 1, 1, 1, 1,
0.2914781, -0.4080092, 3.274823, 1, 1, 1, 1, 1,
0.292417, 1.570066, 1.009897, 1, 1, 1, 1, 1,
0.295311, -0.3271288, 3.042818, 1, 1, 1, 1, 1,
0.2967508, 1.705084, 0.9642164, 1, 1, 1, 1, 1,
0.2977495, -0.9349094, 2.61048, 1, 1, 1, 1, 1,
0.299643, -0.3090809, 1.763977, 1, 1, 1, 1, 1,
0.3020615, -1.026665, 1.366536, 1, 1, 1, 1, 1,
0.3036901, -0.02034576, 1.118789, 1, 1, 1, 1, 1,
0.3089995, 0.9751467, -1.969572, 1, 1, 1, 1, 1,
0.3098877, 0.1010917, 1.790142, 1, 1, 1, 1, 1,
0.3133887, -0.03226544, 3.434578, 1, 1, 1, 1, 1,
0.3135552, -1.770167, 4.131409, 1, 1, 1, 1, 1,
0.3181295, -0.1620278, 1.806647, 1, 1, 1, 1, 1,
0.31863, -0.2657616, 0.1008789, 0, 0, 1, 1, 1,
0.3194974, -0.4778494, -0.2697652, 1, 0, 0, 1, 1,
0.3222135, 2.472184, -0.3252792, 1, 0, 0, 1, 1,
0.3224921, 0.1023505, 1.044109, 1, 0, 0, 1, 1,
0.324066, -0.01498083, 1.688834, 1, 0, 0, 1, 1,
0.3288104, 0.2737013, 1.69321, 1, 0, 0, 1, 1,
0.329822, -0.6648982, 2.967208, 0, 0, 0, 1, 1,
0.3312545, -2.052995, 2.232302, 0, 0, 0, 1, 1,
0.3333842, 0.4336619, -0.04754027, 0, 0, 0, 1, 1,
0.3344424, 0.1092613, -0.4122048, 0, 0, 0, 1, 1,
0.3357357, -0.208195, 1.612479, 0, 0, 0, 1, 1,
0.3384445, 0.1376144, 0.86732, 0, 0, 0, 1, 1,
0.3417052, 1.708308, -0.02633443, 0, 0, 0, 1, 1,
0.3440484, -0.4497713, 3.539686, 1, 1, 1, 1, 1,
0.3443477, -0.757386, 2.860557, 1, 1, 1, 1, 1,
0.350657, -0.1946943, 1.869255, 1, 1, 1, 1, 1,
0.3544606, 0.3497052, 0.9466665, 1, 1, 1, 1, 1,
0.3564323, -0.09369425, 1.48164, 1, 1, 1, 1, 1,
0.3598637, -0.7527241, 1.150771, 1, 1, 1, 1, 1,
0.3617797, 0.366216, 0.1670077, 1, 1, 1, 1, 1,
0.3630614, 0.1083231, 1.402222, 1, 1, 1, 1, 1,
0.367534, 0.1271608, 0.127996, 1, 1, 1, 1, 1,
0.369164, 1.9213, -0.4896345, 1, 1, 1, 1, 1,
0.3758733, -1.499195, 2.725603, 1, 1, 1, 1, 1,
0.3772536, -0.4358968, 1.672782, 1, 1, 1, 1, 1,
0.3807184, 1.393331, 0.1683777, 1, 1, 1, 1, 1,
0.3955751, -0.4195184, 1.598924, 1, 1, 1, 1, 1,
0.401634, -0.5328202, 4.021762, 1, 1, 1, 1, 1,
0.4079675, -0.775343, 2.726752, 0, 0, 1, 1, 1,
0.4104261, 0.7331862, -1.194821, 1, 0, 0, 1, 1,
0.4108257, 0.6308743, 0.06290504, 1, 0, 0, 1, 1,
0.4125639, 0.4566484, -1.387128, 1, 0, 0, 1, 1,
0.415258, -2.915134, 0.8384235, 1, 0, 0, 1, 1,
0.4157918, -0.2667361, 2.431694, 1, 0, 0, 1, 1,
0.4159747, 0.4631604, 0.8964479, 0, 0, 0, 1, 1,
0.4168125, -0.301057, 0.3389317, 0, 0, 0, 1, 1,
0.4174495, -0.4433815, 1.982486, 0, 0, 0, 1, 1,
0.4181833, -0.4709061, 1.40669, 0, 0, 0, 1, 1,
0.419356, -1.944319, 4.104815, 0, 0, 0, 1, 1,
0.4208172, 0.04707744, 2.433357, 0, 0, 0, 1, 1,
0.4209939, 0.2017905, 1.772526, 0, 0, 0, 1, 1,
0.4256049, -0.7561583, 4.915988, 1, 1, 1, 1, 1,
0.4282895, -1.580509, 2.473539, 1, 1, 1, 1, 1,
0.4287328, -0.5960687, 1.116047, 1, 1, 1, 1, 1,
0.4291021, -1.187525, 2.249794, 1, 1, 1, 1, 1,
0.4309884, 1.926267, 0.08353264, 1, 1, 1, 1, 1,
0.4322431, -0.8212023, 1.88943, 1, 1, 1, 1, 1,
0.4340003, -0.5295913, 3.317329, 1, 1, 1, 1, 1,
0.4345313, -0.7838926, 2.874174, 1, 1, 1, 1, 1,
0.4347471, -2.288234, 3.782517, 1, 1, 1, 1, 1,
0.4422236, 0.2295526, -0.4107899, 1, 1, 1, 1, 1,
0.4430153, 1.223994, 0.02065925, 1, 1, 1, 1, 1,
0.4549763, 0.5800415, 0.4937066, 1, 1, 1, 1, 1,
0.4569869, -0.5822865, 2.638345, 1, 1, 1, 1, 1,
0.4610722, -0.5670065, 2.221327, 1, 1, 1, 1, 1,
0.4668157, 0.262083, -0.4029454, 1, 1, 1, 1, 1,
0.4744046, -0.4560722, 2.118232, 0, 0, 1, 1, 1,
0.4744236, 1.316758, 0.4223405, 1, 0, 0, 1, 1,
0.4769382, 1.227397, 0.8879232, 1, 0, 0, 1, 1,
0.4775908, 0.9786934, -0.5305348, 1, 0, 0, 1, 1,
0.4800289, 1.042499, 0.8808025, 1, 0, 0, 1, 1,
0.4831361, -0.0302633, 2.161429, 1, 0, 0, 1, 1,
0.4865115, -0.6970328, 1.774204, 0, 0, 0, 1, 1,
0.486645, 0.4772215, 1.929811, 0, 0, 0, 1, 1,
0.4874081, -0.5924856, 3.698199, 0, 0, 0, 1, 1,
0.4875338, -0.6236459, 1.862366, 0, 0, 0, 1, 1,
0.4890017, -0.3172284, 1.069464, 0, 0, 0, 1, 1,
0.4957304, 0.6062157, 1.333994, 0, 0, 0, 1, 1,
0.5027704, 2.518419, 0.7549189, 0, 0, 0, 1, 1,
0.503405, -1.555935, 1.910367, 1, 1, 1, 1, 1,
0.5049117, 0.5370631, 2.303562, 1, 1, 1, 1, 1,
0.5091755, -0.5481318, 2.382506, 1, 1, 1, 1, 1,
0.5096239, 1.176823, 0.5646106, 1, 1, 1, 1, 1,
0.5119078, -0.2865725, 1.753425, 1, 1, 1, 1, 1,
0.5124241, -1.183219, 3.338259, 1, 1, 1, 1, 1,
0.5200137, 0.7110485, 0.7450526, 1, 1, 1, 1, 1,
0.5225274, -1.891404, 1.826449, 1, 1, 1, 1, 1,
0.537398, 0.225043, 0.1604842, 1, 1, 1, 1, 1,
0.5377712, -0.1255709, 1.391261, 1, 1, 1, 1, 1,
0.5383821, 1.26254, 0.1173094, 1, 1, 1, 1, 1,
0.5489435, -0.6416715, 1.385216, 1, 1, 1, 1, 1,
0.5513101, -2.002566, 1.019823, 1, 1, 1, 1, 1,
0.5554401, 1.352569, 0.986858, 1, 1, 1, 1, 1,
0.5566654, 2.157965, -0.7963029, 1, 1, 1, 1, 1,
0.5600035, 1.509121, -0.2775843, 0, 0, 1, 1, 1,
0.5686063, 0.6295056, -0.3583713, 1, 0, 0, 1, 1,
0.5696212, 0.6987267, 1.654531, 1, 0, 0, 1, 1,
0.5725582, 0.6647701, 1.3496, 1, 0, 0, 1, 1,
0.5739717, -1.981752, 1.60279, 1, 0, 0, 1, 1,
0.5743408, -0.1671, 2.557871, 1, 0, 0, 1, 1,
0.5753095, -1.744044, 3.080281, 0, 0, 0, 1, 1,
0.5780105, 1.036332, 2.710063, 0, 0, 0, 1, 1,
0.5819929, -0.04567105, 1.718947, 0, 0, 0, 1, 1,
0.5827532, -0.2587783, 1.149296, 0, 0, 0, 1, 1,
0.5835223, 2.829984, -0.2519488, 0, 0, 0, 1, 1,
0.5836236, -0.650849, 0.7145445, 0, 0, 0, 1, 1,
0.5879427, -0.1876078, 0.9095493, 0, 0, 0, 1, 1,
0.5952932, -0.237203, 2.855116, 1, 1, 1, 1, 1,
0.5972639, -2.518796, 2.435437, 1, 1, 1, 1, 1,
0.5989287, 0.8232656, 1.829817, 1, 1, 1, 1, 1,
0.6019854, -0.0901517, 2.664955, 1, 1, 1, 1, 1,
0.6022815, -0.05582133, 4.173588, 1, 1, 1, 1, 1,
0.6102359, -1.225447, 3.123436, 1, 1, 1, 1, 1,
0.610421, -0.4421474, 2.77374, 1, 1, 1, 1, 1,
0.6109523, 0.2364486, -0.2794699, 1, 1, 1, 1, 1,
0.611029, 0.2226234, 1.037219, 1, 1, 1, 1, 1,
0.6139556, 0.9273514, 0.9018552, 1, 1, 1, 1, 1,
0.615044, 0.1133627, 1.742993, 1, 1, 1, 1, 1,
0.6175083, 0.7722284, 0.7195982, 1, 1, 1, 1, 1,
0.6192863, 1.512953, -0.08349179, 1, 1, 1, 1, 1,
0.6195104, -1.23752, 2.657622, 1, 1, 1, 1, 1,
0.6200184, -0.5185158, 1.682067, 1, 1, 1, 1, 1,
0.6235523, -0.1846995, 1.289338, 0, 0, 1, 1, 1,
0.6246408, -1.707339, 3.0275, 1, 0, 0, 1, 1,
0.6329688, -1.193793, 2.818683, 1, 0, 0, 1, 1,
0.6393548, 0.7890204, 0.3073075, 1, 0, 0, 1, 1,
0.6411828, -1.87008, 3.348037, 1, 0, 0, 1, 1,
0.6425661, -0.984714, 3.388674, 1, 0, 0, 1, 1,
0.6490706, 0.1472462, 1.212327, 0, 0, 0, 1, 1,
0.6512049, -0.2421494, 1.371976, 0, 0, 0, 1, 1,
0.651661, -1.193495, 2.828294, 0, 0, 0, 1, 1,
0.6552153, -0.5193438, 3.461598, 0, 0, 0, 1, 1,
0.6581941, -0.08413292, 0.7257229, 0, 0, 0, 1, 1,
0.6600935, -0.459046, 2.212972, 0, 0, 0, 1, 1,
0.6648091, -0.9157051, 2.58781, 0, 0, 0, 1, 1,
0.6675148, -0.04081791, 3.587062, 1, 1, 1, 1, 1,
0.6676186, 1.258094, 1.972932, 1, 1, 1, 1, 1,
0.6682416, 1.827028, 1.103727, 1, 1, 1, 1, 1,
0.673165, 0.1024028, 0.0009549829, 1, 1, 1, 1, 1,
0.674301, 0.19225, 2.209029, 1, 1, 1, 1, 1,
0.6784475, 0.681255, -0.6879283, 1, 1, 1, 1, 1,
0.6833774, -0.7949187, 0.8040233, 1, 1, 1, 1, 1,
0.6885676, 1.316648, 0.6702068, 1, 1, 1, 1, 1,
0.6924858, 0.3256493, 1.777457, 1, 1, 1, 1, 1,
0.6948521, 0.2151953, 2.079875, 1, 1, 1, 1, 1,
0.70037, 0.5527198, -0.01949146, 1, 1, 1, 1, 1,
0.705501, 1.119415, 1.920779, 1, 1, 1, 1, 1,
0.7057912, 0.8369904, 1.233958, 1, 1, 1, 1, 1,
0.7080591, -1.79816, 1.089339, 1, 1, 1, 1, 1,
0.7116309, 0.7429439, 1.294797, 1, 1, 1, 1, 1,
0.7138374, 0.3335267, 0.7304473, 0, 0, 1, 1, 1,
0.7139145, -0.8724826, 0.8672958, 1, 0, 0, 1, 1,
0.7194089, 0.6140386, 2.410908, 1, 0, 0, 1, 1,
0.7213528, 0.4484426, 0.3881753, 1, 0, 0, 1, 1,
0.7292101, 0.4461329, 2.953333, 1, 0, 0, 1, 1,
0.7349886, -0.7314913, 2.567306, 1, 0, 0, 1, 1,
0.7370963, -0.5049145, 3.202554, 0, 0, 0, 1, 1,
0.7406407, 0.1383379, -0.1762123, 0, 0, 0, 1, 1,
0.7455716, -2.520028, 3.016597, 0, 0, 0, 1, 1,
0.7476589, -0.4042792, 1.292768, 0, 0, 0, 1, 1,
0.7502064, 0.5110968, 1.239061, 0, 0, 0, 1, 1,
0.7517364, -0.1447885, 2.246915, 0, 0, 0, 1, 1,
0.7535822, -0.3899576, 1.556031, 0, 0, 0, 1, 1,
0.7554419, -0.4812855, 2.09198, 1, 1, 1, 1, 1,
0.7574371, 1.285434, -0.8273203, 1, 1, 1, 1, 1,
0.7583091, -2.100397, 1.647126, 1, 1, 1, 1, 1,
0.7608325, 0.1471656, 1.333544, 1, 1, 1, 1, 1,
0.7612426, 1.399813, 0.6330562, 1, 1, 1, 1, 1,
0.7629937, -1.098023, 3.547414, 1, 1, 1, 1, 1,
0.7638392, 0.004715689, 0.7620178, 1, 1, 1, 1, 1,
0.7645288, -0.03880671, 2.52171, 1, 1, 1, 1, 1,
0.7666866, 0.3732519, 0.89836, 1, 1, 1, 1, 1,
0.7701644, -0.176982, 3.086513, 1, 1, 1, 1, 1,
0.7724413, 1.698532, -0.08403046, 1, 1, 1, 1, 1,
0.7729037, -0.2535088, 2.013996, 1, 1, 1, 1, 1,
0.7785812, -0.544457, 1.44455, 1, 1, 1, 1, 1,
0.7835035, 0.9572563, 0.5540892, 1, 1, 1, 1, 1,
0.7845984, -0.9952865, 0.1122417, 1, 1, 1, 1, 1,
0.7855912, -0.1976104, 1.286207, 0, 0, 1, 1, 1,
0.788546, 0.7920766, 1.317995, 1, 0, 0, 1, 1,
0.7929346, -0.1128415, 2.298065, 1, 0, 0, 1, 1,
0.793458, 0.3867368, 2.400146, 1, 0, 0, 1, 1,
0.7939163, 0.03213704, 1.665905, 1, 0, 0, 1, 1,
0.7959692, -2.264151, 3.915357, 1, 0, 0, 1, 1,
0.7991545, -0.2230371, 1.49954, 0, 0, 0, 1, 1,
0.8008464, 0.8016694, 1.224947, 0, 0, 0, 1, 1,
0.8022426, 1.396615, 1.291312, 0, 0, 0, 1, 1,
0.80265, 2.032534, 0.2040785, 0, 0, 0, 1, 1,
0.8058409, -1.393952, 2.497975, 0, 0, 0, 1, 1,
0.80795, 0.6411316, 0.3732017, 0, 0, 0, 1, 1,
0.8150141, -0.5289119, 2.879649, 0, 0, 0, 1, 1,
0.8176178, 0.4632235, 1.275995, 1, 1, 1, 1, 1,
0.8233761, 1.549409, 0.6677421, 1, 1, 1, 1, 1,
0.8252037, 0.0458666, 2.030135, 1, 1, 1, 1, 1,
0.8314142, -0.177725, 0.9447957, 1, 1, 1, 1, 1,
0.8325448, -0.2579652, 2.326213, 1, 1, 1, 1, 1,
0.8364081, -0.8712701, 1.980326, 1, 1, 1, 1, 1,
0.837245, 1.21623, 0.887086, 1, 1, 1, 1, 1,
0.8389398, -1.162432, 2.606089, 1, 1, 1, 1, 1,
0.8391212, 0.883378, 2.938908, 1, 1, 1, 1, 1,
0.8403883, 1.0555, 2.014722, 1, 1, 1, 1, 1,
0.8411035, 1.817731, -0.6860673, 1, 1, 1, 1, 1,
0.8442194, -0.7707004, 1.33615, 1, 1, 1, 1, 1,
0.8487543, 0.1942361, 1.346612, 1, 1, 1, 1, 1,
0.8526813, -0.07005228, 1.462652, 1, 1, 1, 1, 1,
0.8599159, 1.441069, -0.594788, 1, 1, 1, 1, 1,
0.8605616, -0.9914085, 1.753623, 0, 0, 1, 1, 1,
0.8679609, 0.9587724, -0.4171945, 1, 0, 0, 1, 1,
0.8695126, -1.001879, 1.646661, 1, 0, 0, 1, 1,
0.8727044, -0.4043318, 3.165689, 1, 0, 0, 1, 1,
0.8765053, 0.8794139, 0.6286997, 1, 0, 0, 1, 1,
0.8782516, 0.7825679, -0.7605791, 1, 0, 0, 1, 1,
0.8804792, 1.335027, 1.043197, 0, 0, 0, 1, 1,
0.8808094, -1.890037, 1.374874, 0, 0, 0, 1, 1,
0.8911154, -0.2575866, 0.6908455, 0, 0, 0, 1, 1,
0.8963487, -0.7288933, 2.65161, 0, 0, 0, 1, 1,
0.8972361, -1.590741, 2.153737, 0, 0, 0, 1, 1,
0.9032134, 0.3593737, 0.8861509, 0, 0, 0, 1, 1,
0.9044487, -0.4760693, 2.517103, 0, 0, 0, 1, 1,
0.9088649, 0.3701609, 1.884826, 1, 1, 1, 1, 1,
0.9110328, -1.004219, 1.647841, 1, 1, 1, 1, 1,
0.9130515, -0.1506885, 0.6494941, 1, 1, 1, 1, 1,
0.916358, -1.080288, 2.450434, 1, 1, 1, 1, 1,
0.9173155, 0.4457091, 1.118767, 1, 1, 1, 1, 1,
0.9216604, 0.5506407, 1.083712, 1, 1, 1, 1, 1,
0.9219209, -0.9544595, 1.853313, 1, 1, 1, 1, 1,
0.9229615, -0.5366875, 3.241047, 1, 1, 1, 1, 1,
0.9244578, 0.2332662, 0.2137714, 1, 1, 1, 1, 1,
0.943418, -1.073443, 1.988628, 1, 1, 1, 1, 1,
0.9440525, 0.04544015, 1.272329, 1, 1, 1, 1, 1,
0.9559184, -0.9359307, 1.417201, 1, 1, 1, 1, 1,
0.9634687, -1.033011, 2.354467, 1, 1, 1, 1, 1,
0.9712589, -1.061055, 1.599843, 1, 1, 1, 1, 1,
0.9795766, -1.284389, 3.843418, 1, 1, 1, 1, 1,
0.9804147, 0.4974945, 1.512996, 0, 0, 1, 1, 1,
0.9880453, 0.5456627, 2.099131, 1, 0, 0, 1, 1,
0.991223, 0.9773241, -0.2235125, 1, 0, 0, 1, 1,
1.007411, -0.1297588, 0.8552694, 1, 0, 0, 1, 1,
1.018084, 0.3658719, 2.009249, 1, 0, 0, 1, 1,
1.020724, -0.2506837, 1.323033, 1, 0, 0, 1, 1,
1.022814, 0.3901081, 0.6420972, 0, 0, 0, 1, 1,
1.027661, -1.022517, 1.770654, 0, 0, 0, 1, 1,
1.027786, 0.1034953, 1.222278, 0, 0, 0, 1, 1,
1.03479, -0.690539, 1.563411, 0, 0, 0, 1, 1,
1.049165, 1.117003, 1.698548, 0, 0, 0, 1, 1,
1.058646, 0.7608959, 2.359606, 0, 0, 0, 1, 1,
1.059525, 0.2030601, 1.193013, 0, 0, 0, 1, 1,
1.062726, 0.7233401, 1.161379, 1, 1, 1, 1, 1,
1.065401, -1.142784, 2.487739, 1, 1, 1, 1, 1,
1.066292, -0.7857625, 2.674055, 1, 1, 1, 1, 1,
1.06984, 0.08116134, 3.677088, 1, 1, 1, 1, 1,
1.083211, -1.147692, 3.919647, 1, 1, 1, 1, 1,
1.087014, 1.848531, 0.4405962, 1, 1, 1, 1, 1,
1.087943, -0.9740655, 2.143862, 1, 1, 1, 1, 1,
1.094094, 1.71221, -1.418192, 1, 1, 1, 1, 1,
1.09471, 0.2238563, 2.471543, 1, 1, 1, 1, 1,
1.095898, -0.8259161, 1.18234, 1, 1, 1, 1, 1,
1.096794, -1.365467, 1.734454, 1, 1, 1, 1, 1,
1.10085, 0.4730839, 2.097761, 1, 1, 1, 1, 1,
1.103977, 0.06277271, 1.029479, 1, 1, 1, 1, 1,
1.110167, -0.1053681, 2.261147, 1, 1, 1, 1, 1,
1.116806, -1.043833, 2.710288, 1, 1, 1, 1, 1,
1.124089, 0.08578913, 3.523041, 0, 0, 1, 1, 1,
1.125083, -1.009776, 3.43229, 1, 0, 0, 1, 1,
1.126875, 1.815326, 0.6702307, 1, 0, 0, 1, 1,
1.128055, 0.09653697, 2.155654, 1, 0, 0, 1, 1,
1.128117, -0.8202981, 1.832467, 1, 0, 0, 1, 1,
1.129408, -0.9023214, 1.119603, 1, 0, 0, 1, 1,
1.139472, -0.1832777, 0.378017, 0, 0, 0, 1, 1,
1.140756, -0.3050755, 1.313511, 0, 0, 0, 1, 1,
1.143392, 1.324163, 0.7611549, 0, 0, 0, 1, 1,
1.143786, 0.7278559, 0.2399296, 0, 0, 0, 1, 1,
1.145936, 0.8854795, 1.248342, 0, 0, 0, 1, 1,
1.153397, -2.32176, 2.851179, 0, 0, 0, 1, 1,
1.155971, 1.007092, 3.197785, 0, 0, 0, 1, 1,
1.157674, 1.822379, -0.2114635, 1, 1, 1, 1, 1,
1.160081, -0.01908837, 1.639702, 1, 1, 1, 1, 1,
1.170574, -0.4431627, 3.401603, 1, 1, 1, 1, 1,
1.171045, -0.5203751, 2.186691, 1, 1, 1, 1, 1,
1.172028, 1.442532, -0.04567027, 1, 1, 1, 1, 1,
1.179777, 0.8559787, 0.4111113, 1, 1, 1, 1, 1,
1.188127, 0.002047821, 0.8832644, 1, 1, 1, 1, 1,
1.190556, -0.3403056, 0.4755296, 1, 1, 1, 1, 1,
1.198265, -0.01837676, -0.005106864, 1, 1, 1, 1, 1,
1.199027, -1.624496, 2.295576, 1, 1, 1, 1, 1,
1.203002, -1.847969, 3.879332, 1, 1, 1, 1, 1,
1.205645, -1.153657, 3.290057, 1, 1, 1, 1, 1,
1.208874, 0.3516035, 1.706554, 1, 1, 1, 1, 1,
1.209884, 0.05339603, 1.717449, 1, 1, 1, 1, 1,
1.214836, -0.0498643, 3.715048, 1, 1, 1, 1, 1,
1.223917, -1.935773, 1.933372, 0, 0, 1, 1, 1,
1.22895, 0.2336948, 0.8826831, 1, 0, 0, 1, 1,
1.237477, 1.710636, -0.2096792, 1, 0, 0, 1, 1,
1.241759, -0.9519402, 2.38475, 1, 0, 0, 1, 1,
1.24268, -0.1549219, 2.084249, 1, 0, 0, 1, 1,
1.245556, 0.2502395, 1.808496, 1, 0, 0, 1, 1,
1.255493, -0.1737388, -0.470263, 0, 0, 0, 1, 1,
1.258185, -0.6682183, 1.036543, 0, 0, 0, 1, 1,
1.265079, 0.06093331, 1.961569, 0, 0, 0, 1, 1,
1.268151, -0.7540585, 2.216464, 0, 0, 0, 1, 1,
1.269293, 0.4227202, -0.2703494, 0, 0, 0, 1, 1,
1.270123, -0.8119566, 0.5797484, 0, 0, 0, 1, 1,
1.272471, 0.8356707, 1.385433, 0, 0, 0, 1, 1,
1.272795, -0.6614859, 2.140816, 1, 1, 1, 1, 1,
1.287588, 0.641636, 2.38445, 1, 1, 1, 1, 1,
1.299932, -0.7202786, 1.32247, 1, 1, 1, 1, 1,
1.305789, 0.4902262, 0.8170532, 1, 1, 1, 1, 1,
1.308972, -0.1014382, 2.264033, 1, 1, 1, 1, 1,
1.313804, 0.2553132, 0.2630802, 1, 1, 1, 1, 1,
1.314506, 0.8202668, 0.6725703, 1, 1, 1, 1, 1,
1.314779, 0.01068913, 0.7805512, 1, 1, 1, 1, 1,
1.315731, 0.5040416, 0.3583262, 1, 1, 1, 1, 1,
1.321035, 0.6247874, 0.2938794, 1, 1, 1, 1, 1,
1.329135, -0.6268321, 1.325251, 1, 1, 1, 1, 1,
1.334351, 0.9385081, 0.8094004, 1, 1, 1, 1, 1,
1.339545, 0.8877122, 1.612633, 1, 1, 1, 1, 1,
1.34007, 0.6919439, 1.02534, 1, 1, 1, 1, 1,
1.340813, 1.175489, 1.4033, 1, 1, 1, 1, 1,
1.342963, 0.6397609, 1.996128, 0, 0, 1, 1, 1,
1.356554, 0.3631501, 0.7058025, 1, 0, 0, 1, 1,
1.359389, 0.8043632, 1.426589, 1, 0, 0, 1, 1,
1.36348, -0.431552, 4.416818, 1, 0, 0, 1, 1,
1.364497, 0.04168575, 1.293733, 1, 0, 0, 1, 1,
1.381779, -0.6685342, 1.773574, 1, 0, 0, 1, 1,
1.401882, -1.035208, 3.339364, 0, 0, 0, 1, 1,
1.40785, -1.228882, 2.448529, 0, 0, 0, 1, 1,
1.410541, -0.5296206, 2.466544, 0, 0, 0, 1, 1,
1.416641, 0.4383968, 0.5479465, 0, 0, 0, 1, 1,
1.417719, 0.5240816, 2.320921, 0, 0, 0, 1, 1,
1.419697, 1.558951, 1.386508, 0, 0, 0, 1, 1,
1.429305, 0.3165588, 1.438007, 0, 0, 0, 1, 1,
1.434985, 0.4829472, 0.5483848, 1, 1, 1, 1, 1,
1.455376, -0.703919, 1.260002, 1, 1, 1, 1, 1,
1.499497, 0.8797254, 2.54584, 1, 1, 1, 1, 1,
1.504682, 0.4210308, 1.404752, 1, 1, 1, 1, 1,
1.506925, 0.5649005, 3.797005, 1, 1, 1, 1, 1,
1.508994, -0.2430716, 1.306254, 1, 1, 1, 1, 1,
1.514508, 1.136503, 0.07128358, 1, 1, 1, 1, 1,
1.551046, -0.2836744, 0.878093, 1, 1, 1, 1, 1,
1.551415, -0.695959, 1.25671, 1, 1, 1, 1, 1,
1.558792, 0.8074422, 1.290965, 1, 1, 1, 1, 1,
1.559786, -0.3782296, 2.353163, 1, 1, 1, 1, 1,
1.573119, 0.6359971, 0.3016033, 1, 1, 1, 1, 1,
1.583305, -0.8132727, 2.613828, 1, 1, 1, 1, 1,
1.592738, -0.7487726, 2.107124, 1, 1, 1, 1, 1,
1.599719, 0.9253461, -0.4690194, 1, 1, 1, 1, 1,
1.60466, 0.8805766, 0.9531742, 0, 0, 1, 1, 1,
1.609015, 1.660043, 0.5318393, 1, 0, 0, 1, 1,
1.617834, 1.149616, -1.716006, 1, 0, 0, 1, 1,
1.651174, -0.6349794, 2.094156, 1, 0, 0, 1, 1,
1.658477, -0.2138353, 0.4043089, 1, 0, 0, 1, 1,
1.667576, -0.9136619, 0.7122391, 1, 0, 0, 1, 1,
1.678801, -0.3942939, 0.431528, 0, 0, 0, 1, 1,
1.681903, -0.3234266, 1.029243, 0, 0, 0, 1, 1,
1.684512, 1.325246, 2.242255, 0, 0, 0, 1, 1,
1.688119, -0.6954364, 1.724929, 0, 0, 0, 1, 1,
1.718891, 0.1304668, 1.921984, 0, 0, 0, 1, 1,
1.731768, 0.9015689, 0.6765269, 0, 0, 0, 1, 1,
1.749513, 0.9706768, 0.5819905, 0, 0, 0, 1, 1,
1.764841, -0.9613625, 2.741057, 1, 1, 1, 1, 1,
1.769345, 0.03094257, 2.531497, 1, 1, 1, 1, 1,
1.778289, -2.069561, 3.118202, 1, 1, 1, 1, 1,
1.806457, -1.120429, 2.356581, 1, 1, 1, 1, 1,
1.843404, 0.009111054, 0.4370744, 1, 1, 1, 1, 1,
1.928954, 0.7148233, 1.331168, 1, 1, 1, 1, 1,
1.936132, -0.2679926, 0.5733808, 1, 1, 1, 1, 1,
1.956186, 1.248716, 0.3141371, 1, 1, 1, 1, 1,
1.956646, 0.5884871, 2.84125, 1, 1, 1, 1, 1,
1.961727, 0.8115854, 1.338828, 1, 1, 1, 1, 1,
1.962747, -0.9058464, 1.976066, 1, 1, 1, 1, 1,
1.989937, 0.5076852, 2.422844, 1, 1, 1, 1, 1,
1.999132, 0.6492726, 1.374877, 1, 1, 1, 1, 1,
1.999485, 0.1886836, 1.026863, 1, 1, 1, 1, 1,
2.021099, -0.3874633, 0.6237909, 1, 1, 1, 1, 1,
2.123989, 1.024043, -0.05944805, 0, 0, 1, 1, 1,
2.14239, 1.228467, -0.1656963, 1, 0, 0, 1, 1,
2.186687, 0.9913154, 2.133723, 1, 0, 0, 1, 1,
2.187124, 1.428089, 0.1802946, 1, 0, 0, 1, 1,
2.194898, -0.9549049, 2.369453, 1, 0, 0, 1, 1,
2.209385, -1.672602, 2.932152, 1, 0, 0, 1, 1,
2.23531, 0.7208951, -0.0702103, 0, 0, 0, 1, 1,
2.28885, 0.7137099, 2.717309, 0, 0, 0, 1, 1,
2.317433, -0.07693312, 1.075844, 0, 0, 0, 1, 1,
2.351733, -0.6061783, 3.008114, 0, 0, 0, 1, 1,
2.406241, -1.72458, 1.591631, 0, 0, 0, 1, 1,
2.434948, -0.2502109, 2.652574, 0, 0, 0, 1, 1,
2.441848, -1.767254, 1.692533, 0, 0, 0, 1, 1,
2.44995, 0.5574883, 0.5832411, 1, 1, 1, 1, 1,
2.458211, -0.2559651, 1.55536, 1, 1, 1, 1, 1,
2.482759, 0.3149873, 0.8258243, 1, 1, 1, 1, 1,
2.656238, 0.3263393, 1.349453, 1, 1, 1, 1, 1,
2.800617, -0.5659429, 1.379147, 1, 1, 1, 1, 1,
3.273036, 1.990759, 1.986823, 1, 1, 1, 1, 1,
3.330597, 0.9390247, 1.239274, 1, 1, 1, 1, 1
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
var radius = 9.829268;
var distance = 34.52489;
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
mvMatrix.translate( -0.0943768, -0.07854629, 0.3783484 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.52489);
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
