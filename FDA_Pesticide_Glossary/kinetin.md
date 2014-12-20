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
-3.017651, -0.1592066, -0.9521396, 1, 0, 0, 1,
-2.877335, 1.207496, 0.3386727, 1, 0.007843138, 0, 1,
-2.571516, 0.4849204, -1.67918, 1, 0.01176471, 0, 1,
-2.469104, -3.241212, -3.222632, 1, 0.01960784, 0, 1,
-2.359285, -0.4889456, -0.9108323, 1, 0.02352941, 0, 1,
-2.350835, -1.071847, -1.932436, 1, 0.03137255, 0, 1,
-2.344897, -1.470977, -3.385385, 1, 0.03529412, 0, 1,
-2.331757, -0.3203337, -1.698571, 1, 0.04313726, 0, 1,
-2.272379, -0.03422838, -2.309868, 1, 0.04705882, 0, 1,
-2.265117, 1.058835, -2.405584, 1, 0.05490196, 0, 1,
-2.258034, 0.06032184, -3.340141, 1, 0.05882353, 0, 1,
-2.160273, -0.4727475, -3.579653, 1, 0.06666667, 0, 1,
-2.154206, 1.034758, 0.1294713, 1, 0.07058824, 0, 1,
-2.106702, 0.6638277, -0.5978346, 1, 0.07843138, 0, 1,
-2.068906, -0.1957761, -0.4064476, 1, 0.08235294, 0, 1,
-2.062247, -0.8277749, -1.575157, 1, 0.09019608, 0, 1,
-2.048441, -0.5252295, -1.059668, 1, 0.09411765, 0, 1,
-2.048086, -0.1381317, -0.6202049, 1, 0.1019608, 0, 1,
-2.025726, 0.9100467, -1.665863, 1, 0.1098039, 0, 1,
-2.017034, -0.1631062, -1.215069, 1, 0.1137255, 0, 1,
-1.986407, -0.7991036, -4.582137, 1, 0.1215686, 0, 1,
-1.962349, 0.4213554, 0.2412188, 1, 0.1254902, 0, 1,
-1.945481, -0.04078534, -2.014724, 1, 0.1333333, 0, 1,
-1.923386, -0.3681578, -1.783565, 1, 0.1372549, 0, 1,
-1.886754, 0.9419414, -2.176321, 1, 0.145098, 0, 1,
-1.886738, 0.6966056, -0.2530648, 1, 0.1490196, 0, 1,
-1.863517, -0.9761924, -0.9202206, 1, 0.1568628, 0, 1,
-1.847922, 0.2972272, -2.508453, 1, 0.1607843, 0, 1,
-1.846727, -1.450625, -2.624737, 1, 0.1686275, 0, 1,
-1.841191, 0.1263982, -2.079294, 1, 0.172549, 0, 1,
-1.836157, -0.6098415, -2.695073, 1, 0.1803922, 0, 1,
-1.829901, -0.2429226, -2.243197, 1, 0.1843137, 0, 1,
-1.82946, 1.317794, -2.169121, 1, 0.1921569, 0, 1,
-1.809087, 1.391111, -0.9234248, 1, 0.1960784, 0, 1,
-1.794079, 0.3972342, -1.755459, 1, 0.2039216, 0, 1,
-1.73893, 0.4007912, -2.327248, 1, 0.2117647, 0, 1,
-1.714877, -0.637327, -2.106163, 1, 0.2156863, 0, 1,
-1.704816, 1.89884, -2.319759, 1, 0.2235294, 0, 1,
-1.696676, 0.6014315, -0.6248277, 1, 0.227451, 0, 1,
-1.681696, 0.1779722, -2.76747, 1, 0.2352941, 0, 1,
-1.680028, -1.437916, -2.116951, 1, 0.2392157, 0, 1,
-1.66839, 2.287912, -0.6762946, 1, 0.2470588, 0, 1,
-1.663252, -0.4554183, -1.495125, 1, 0.2509804, 0, 1,
-1.658089, -0.427935, -2.032231, 1, 0.2588235, 0, 1,
-1.656976, 0.5753891, -2.490566, 1, 0.2627451, 0, 1,
-1.625705, -1.382503, -3.814715, 1, 0.2705882, 0, 1,
-1.622416, -0.8230915, -1.870646, 1, 0.2745098, 0, 1,
-1.615734, 1.859148, -1.290357, 1, 0.282353, 0, 1,
-1.598, -1.515527, -3.261892, 1, 0.2862745, 0, 1,
-1.587833, 0.0275828, -2.47442, 1, 0.2941177, 0, 1,
-1.585318, 0.4518169, -1.000471, 1, 0.3019608, 0, 1,
-1.573604, 0.1618089, -1.801654, 1, 0.3058824, 0, 1,
-1.550351, 0.02333624, -2.928598, 1, 0.3137255, 0, 1,
-1.532071, 0.3871633, -2.512922, 1, 0.3176471, 0, 1,
-1.524654, -0.1707752, -2.411695, 1, 0.3254902, 0, 1,
-1.514369, 0.0779141, -0.5279666, 1, 0.3294118, 0, 1,
-1.506579, 0.3708936, -2.669272, 1, 0.3372549, 0, 1,
-1.464701, 0.3608872, -0.9850781, 1, 0.3411765, 0, 1,
-1.462943, -1.263627, -2.786643, 1, 0.3490196, 0, 1,
-1.456531, -0.148931, -0.2783433, 1, 0.3529412, 0, 1,
-1.451874, -0.601924, -1.839602, 1, 0.3607843, 0, 1,
-1.45128, -0.2899517, -1.233953, 1, 0.3647059, 0, 1,
-1.450894, -0.08893545, -1.60096, 1, 0.372549, 0, 1,
-1.449721, -0.03438042, -1.215552, 1, 0.3764706, 0, 1,
-1.440438, 0.3289801, -1.314944, 1, 0.3843137, 0, 1,
-1.434441, 1.440399, -1.034486, 1, 0.3882353, 0, 1,
-1.427438, -0.09123043, -2.884855, 1, 0.3960784, 0, 1,
-1.425704, -0.05645182, -1.306697, 1, 0.4039216, 0, 1,
-1.402146, 0.4024664, -0.2931963, 1, 0.4078431, 0, 1,
-1.397457, -0.9395606, -0.8903282, 1, 0.4156863, 0, 1,
-1.395012, -1.05801, -1.456983, 1, 0.4196078, 0, 1,
-1.384399, 0.0483831, -0.4256689, 1, 0.427451, 0, 1,
-1.382342, -1.017228, -1.289834, 1, 0.4313726, 0, 1,
-1.377386, -0.5741385, -1.541911, 1, 0.4392157, 0, 1,
-1.37639, 0.2732285, -0.8684068, 1, 0.4431373, 0, 1,
-1.37538, 0.9399875, -2.747676, 1, 0.4509804, 0, 1,
-1.371143, -1.973878, -1.573476, 1, 0.454902, 0, 1,
-1.355594, 0.789581, -1.574082, 1, 0.4627451, 0, 1,
-1.352863, -0.68718, -1.358806, 1, 0.4666667, 0, 1,
-1.348612, 0.08330558, -0.5891566, 1, 0.4745098, 0, 1,
-1.338633, -0.8878025, -0.2842057, 1, 0.4784314, 0, 1,
-1.321492, 0.5816525, -0.7912995, 1, 0.4862745, 0, 1,
-1.319628, -1.240835, -3.568059, 1, 0.4901961, 0, 1,
-1.313862, 0.6557154, -0.4573723, 1, 0.4980392, 0, 1,
-1.310097, 1.226478, 1.413708, 1, 0.5058824, 0, 1,
-1.305013, -0.01286481, -1.279538, 1, 0.509804, 0, 1,
-1.294807, 1.596003, -0.9916534, 1, 0.5176471, 0, 1,
-1.281532, 0.05581003, -1.647754, 1, 0.5215687, 0, 1,
-1.27783, -1.364282, -2.277852, 1, 0.5294118, 0, 1,
-1.271541, -2.356597, -3.572674, 1, 0.5333334, 0, 1,
-1.260591, 0.4206682, -0.9836568, 1, 0.5411765, 0, 1,
-1.257959, -0.03726767, -1.020401, 1, 0.5450981, 0, 1,
-1.253556, 0.7134379, 0.6252031, 1, 0.5529412, 0, 1,
-1.238929, 0.4156305, -1.713445, 1, 0.5568628, 0, 1,
-1.238065, 0.1630085, -1.15504, 1, 0.5647059, 0, 1,
-1.236418, -0.7803683, -0.5469444, 1, 0.5686275, 0, 1,
-1.233598, -0.6819641, -2.977724, 1, 0.5764706, 0, 1,
-1.231498, -2.311268, -2.412181, 1, 0.5803922, 0, 1,
-1.227819, -0.7763789, -1.79326, 1, 0.5882353, 0, 1,
-1.221148, -0.1119437, -2.674711, 1, 0.5921569, 0, 1,
-1.219319, 0.831191, -1.552325, 1, 0.6, 0, 1,
-1.211185, -1.173326, -2.490686, 1, 0.6078432, 0, 1,
-1.20354, 0.8435825, 0.09741659, 1, 0.6117647, 0, 1,
-1.200528, -0.3588172, -2.260954, 1, 0.6196079, 0, 1,
-1.199299, 0.194733, -0.3050804, 1, 0.6235294, 0, 1,
-1.19814, -0.1329907, -1.596282, 1, 0.6313726, 0, 1,
-1.197062, -0.5111311, -0.4216039, 1, 0.6352941, 0, 1,
-1.180937, -0.05305118, -1.54928, 1, 0.6431373, 0, 1,
-1.179615, 0.5010181, 0.09822072, 1, 0.6470588, 0, 1,
-1.17683, -1.087265, -2.193114, 1, 0.654902, 0, 1,
-1.172515, 1.115186, -0.8459574, 1, 0.6588235, 0, 1,
-1.158254, -1.110433, -2.587374, 1, 0.6666667, 0, 1,
-1.137313, -0.7429605, -0.4819643, 1, 0.6705883, 0, 1,
-1.134812, -0.3086447, -1.098465, 1, 0.6784314, 0, 1,
-1.134046, -0.01373698, -0.7974145, 1, 0.682353, 0, 1,
-1.131268, -0.437792, -1.861677, 1, 0.6901961, 0, 1,
-1.127299, 0.8359905, -0.2902564, 1, 0.6941177, 0, 1,
-1.125302, 0.311684, -1.355942, 1, 0.7019608, 0, 1,
-1.123775, 0.5103071, -1.058397, 1, 0.7098039, 0, 1,
-1.115118, 0.8187193, -1.337429, 1, 0.7137255, 0, 1,
-1.109994, -1.285254, -1.81817, 1, 0.7215686, 0, 1,
-1.10634, -0.4404121, 0.6367991, 1, 0.7254902, 0, 1,
-1.101963, 0.5320862, -0.4923232, 1, 0.7333333, 0, 1,
-1.101343, 1.656958, 1.830783, 1, 0.7372549, 0, 1,
-1.098793, 0.362862, -1.191577, 1, 0.7450981, 0, 1,
-1.091425, -0.4288742, -4.065408, 1, 0.7490196, 0, 1,
-1.088891, 0.7894027, -1.323344, 1, 0.7568628, 0, 1,
-1.086291, -2.176641, -2.788368, 1, 0.7607843, 0, 1,
-1.072826, 0.04972898, 0.0407451, 1, 0.7686275, 0, 1,
-1.068834, 1.173012, -2.399984, 1, 0.772549, 0, 1,
-1.068668, 0.8344232, -2.549277, 1, 0.7803922, 0, 1,
-1.065311, 1.249647, 0.359476, 1, 0.7843137, 0, 1,
-1.064938, 1.912993, -0.3259103, 1, 0.7921569, 0, 1,
-1.05636, -0.4184071, -0.7939505, 1, 0.7960784, 0, 1,
-1.05623, 1.066892, 0.09612056, 1, 0.8039216, 0, 1,
-1.055715, -0.6086055, -2.448326, 1, 0.8117647, 0, 1,
-1.05312, -0.4452035, -2.610734, 1, 0.8156863, 0, 1,
-1.052355, -1.088098, -3.124927, 1, 0.8235294, 0, 1,
-1.050551, 0.2834696, -1.429874, 1, 0.827451, 0, 1,
-1.048751, -1.164354, -3.505394, 1, 0.8352941, 0, 1,
-1.046053, 0.4775358, 1.705068, 1, 0.8392157, 0, 1,
-1.03491, 1.413633, -0.6916227, 1, 0.8470588, 0, 1,
-1.026126, 0.7505201, -1.676868, 1, 0.8509804, 0, 1,
-1.022102, 0.3909308, -0.3232634, 1, 0.8588235, 0, 1,
-1.018996, -0.1307273, -2.093084, 1, 0.8627451, 0, 1,
-1.016563, -0.6196814, -3.287472, 1, 0.8705882, 0, 1,
-1.011571, 0.4012311, -0.9632154, 1, 0.8745098, 0, 1,
-1.008559, -0.4826216, -1.723865, 1, 0.8823529, 0, 1,
-0.9976759, 2.056072, -1.474465, 1, 0.8862745, 0, 1,
-0.9947734, 0.4308305, -1.451127, 1, 0.8941177, 0, 1,
-0.9882978, -0.4326855, 0.4120565, 1, 0.8980392, 0, 1,
-0.9877607, 1.076925, -3.041491, 1, 0.9058824, 0, 1,
-0.9860259, 0.2283795, -1.650516, 1, 0.9137255, 0, 1,
-0.9855605, 1.772583, -0.1120414, 1, 0.9176471, 0, 1,
-0.9804351, -1.043351, -1.596968, 1, 0.9254902, 0, 1,
-0.9788635, 0.7788187, -3.166507, 1, 0.9294118, 0, 1,
-0.9721658, -0.04585922, -2.882215, 1, 0.9372549, 0, 1,
-0.9719048, 1.169929, -1.081079, 1, 0.9411765, 0, 1,
-0.9713718, 0.7575898, -2.069915, 1, 0.9490196, 0, 1,
-0.9702232, -0.1951751, -2.50356, 1, 0.9529412, 0, 1,
-0.966193, 0.8268983, -1.082527, 1, 0.9607843, 0, 1,
-0.9525982, -0.0571779, -3.225578, 1, 0.9647059, 0, 1,
-0.9518383, 0.4981575, -0.6548929, 1, 0.972549, 0, 1,
-0.9458848, -0.2608352, -1.093319, 1, 0.9764706, 0, 1,
-0.9379231, 0.06128801, -0.7839187, 1, 0.9843137, 0, 1,
-0.9350354, 0.5063275, -2.801286, 1, 0.9882353, 0, 1,
-0.9340394, -0.2935377, -1.116405, 1, 0.9960784, 0, 1,
-0.9300469, 2.047341, -1.425433, 0.9960784, 1, 0, 1,
-0.920469, -0.6664543, -2.337554, 0.9921569, 1, 0, 1,
-0.9116772, 0.5034494, -1.871606, 0.9843137, 1, 0, 1,
-0.9095181, -0.5230805, -2.240151, 0.9803922, 1, 0, 1,
-0.9081847, -0.3093379, -2.435999, 0.972549, 1, 0, 1,
-0.9078406, 2.001137, -1.396696, 0.9686275, 1, 0, 1,
-0.8956249, -0.08594017, -2.134356, 0.9607843, 1, 0, 1,
-0.8949294, -1.437966, -3.608821, 0.9568627, 1, 0, 1,
-0.8888337, 1.183019, -0.1401624, 0.9490196, 1, 0, 1,
-0.8879324, -0.5857759, -0.3024111, 0.945098, 1, 0, 1,
-0.8877587, -0.8325707, -3.986837, 0.9372549, 1, 0, 1,
-0.8740599, -0.5149688, -2.525468, 0.9333333, 1, 0, 1,
-0.8710458, 2.097224, -0.782343, 0.9254902, 1, 0, 1,
-0.8705, -1.249498, -3.75234, 0.9215686, 1, 0, 1,
-0.8695229, -1.120452, -1.69401, 0.9137255, 1, 0, 1,
-0.8608057, -1.11206, -3.134464, 0.9098039, 1, 0, 1,
-0.8527919, 0.5678561, 0.8258899, 0.9019608, 1, 0, 1,
-0.8499857, -0.7400852, -2.354337, 0.8941177, 1, 0, 1,
-0.8481574, -1.081358, -3.174042, 0.8901961, 1, 0, 1,
-0.8450589, -0.6257191, 0.03854147, 0.8823529, 1, 0, 1,
-0.845048, -1.267855, -2.724618, 0.8784314, 1, 0, 1,
-0.8423656, 0.5545813, -1.728601, 0.8705882, 1, 0, 1,
-0.8377358, -2.554186, -0.6632717, 0.8666667, 1, 0, 1,
-0.8288736, -1.605457, -1.833356, 0.8588235, 1, 0, 1,
-0.8254332, -0.1526851, -0.1226922, 0.854902, 1, 0, 1,
-0.8210889, -0.8085868, -1.770167, 0.8470588, 1, 0, 1,
-0.8207243, -1.711713, -2.962945, 0.8431373, 1, 0, 1,
-0.8155167, -0.200248, -1.928935, 0.8352941, 1, 0, 1,
-0.8109012, 0.5154955, -0.9834127, 0.8313726, 1, 0, 1,
-0.8064802, 0.3450529, -0.6910666, 0.8235294, 1, 0, 1,
-0.8021226, 0.1808277, -1.653203, 0.8196079, 1, 0, 1,
-0.8016902, 0.910791, 0.5711666, 0.8117647, 1, 0, 1,
-0.8012358, -0.3957461, -1.456733, 0.8078431, 1, 0, 1,
-0.8000312, 1.347885, -2.455089, 0.8, 1, 0, 1,
-0.7984819, 0.4422843, -0.01234465, 0.7921569, 1, 0, 1,
-0.796186, 0.48381, -1.095038, 0.7882353, 1, 0, 1,
-0.7866651, 1.147007, -0.4031918, 0.7803922, 1, 0, 1,
-0.7832786, 1.234498, 0.9954731, 0.7764706, 1, 0, 1,
-0.783272, 0.1136395, -1.634904, 0.7686275, 1, 0, 1,
-0.7780236, -0.5290885, -2.0275, 0.7647059, 1, 0, 1,
-0.7720728, -0.08580198, -1.852832, 0.7568628, 1, 0, 1,
-0.7707167, 1.231647, -0.306019, 0.7529412, 1, 0, 1,
-0.7684335, 0.3774562, -1.208752, 0.7450981, 1, 0, 1,
-0.7643537, 0.02626912, 0.8976781, 0.7411765, 1, 0, 1,
-0.7603642, 2.437555, -2.495312, 0.7333333, 1, 0, 1,
-0.7575395, -1.255478, -3.559313, 0.7294118, 1, 0, 1,
-0.7552568, 0.6448247, -2.493957, 0.7215686, 1, 0, 1,
-0.7504178, 0.9819663, -1.433978, 0.7176471, 1, 0, 1,
-0.7485765, -1.521251, -1.001041, 0.7098039, 1, 0, 1,
-0.7391827, 0.1984925, -1.698892, 0.7058824, 1, 0, 1,
-0.7374952, 1.236138, 0.9755183, 0.6980392, 1, 0, 1,
-0.733576, -1.10307, -3.390131, 0.6901961, 1, 0, 1,
-0.7326465, 0.437274, -0.4920675, 0.6862745, 1, 0, 1,
-0.7305126, -1.264722, -4.862216, 0.6784314, 1, 0, 1,
-0.7207136, -0.7265527, -2.894119, 0.6745098, 1, 0, 1,
-0.7199475, -0.930925, -2.00894, 0.6666667, 1, 0, 1,
-0.7160556, -1.427709, -2.538086, 0.6627451, 1, 0, 1,
-0.7153518, 2.147619, -0.4805572, 0.654902, 1, 0, 1,
-0.7097676, -0.3132728, 1.415205, 0.6509804, 1, 0, 1,
-0.7077526, 0.4925258, -1.199721, 0.6431373, 1, 0, 1,
-0.7014756, -0.5483609, -3.253153, 0.6392157, 1, 0, 1,
-0.7013843, 0.7444903, -1.666966, 0.6313726, 1, 0, 1,
-0.6971977, 1.578927, -0.838347, 0.627451, 1, 0, 1,
-0.6910662, -1.385056, -3.377933, 0.6196079, 1, 0, 1,
-0.6908939, 0.082576, 1.07146, 0.6156863, 1, 0, 1,
-0.6901445, 0.8163553, -1.156582, 0.6078432, 1, 0, 1,
-0.682604, 0.8170189, -0.565176, 0.6039216, 1, 0, 1,
-0.6820687, 0.4395543, -0.5828851, 0.5960785, 1, 0, 1,
-0.6769093, 0.03307161, -2.654156, 0.5882353, 1, 0, 1,
-0.6686905, -1.579949, -3.034543, 0.5843138, 1, 0, 1,
-0.665656, -0.7841856, -2.897459, 0.5764706, 1, 0, 1,
-0.6549601, -0.8542053, -3.858987, 0.572549, 1, 0, 1,
-0.6499725, 0.2621756, -1.920983, 0.5647059, 1, 0, 1,
-0.6495371, 0.5796687, -0.3068091, 0.5607843, 1, 0, 1,
-0.6455635, 0.1291317, -2.70007, 0.5529412, 1, 0, 1,
-0.6447764, -1.257923, -2.618938, 0.5490196, 1, 0, 1,
-0.643829, -0.6206832, -3.151459, 0.5411765, 1, 0, 1,
-0.6418633, 0.7622435, 0.7411094, 0.5372549, 1, 0, 1,
-0.6409829, 0.4860565, -0.1466496, 0.5294118, 1, 0, 1,
-0.6386594, 1.6526, -0.278496, 0.5254902, 1, 0, 1,
-0.6383188, -2.115439, -4.486077, 0.5176471, 1, 0, 1,
-0.6321584, 1.173364, -0.879641, 0.5137255, 1, 0, 1,
-0.6302041, 2.103637, 0.4380898, 0.5058824, 1, 0, 1,
-0.6280885, 1.066834, 1.692009, 0.5019608, 1, 0, 1,
-0.6261702, 0.8375875, -0.05182354, 0.4941176, 1, 0, 1,
-0.6245959, 0.07504676, -2.284439, 0.4862745, 1, 0, 1,
-0.624441, -1.261844, -2.190823, 0.4823529, 1, 0, 1,
-0.6224014, -0.4392389, -1.906547, 0.4745098, 1, 0, 1,
-0.6116242, 1.207883, -0.2259057, 0.4705882, 1, 0, 1,
-0.6112791, -1.122644, -2.822036, 0.4627451, 1, 0, 1,
-0.6075835, -0.694179, -1.641953, 0.4588235, 1, 0, 1,
-0.6048336, -0.618406, -2.269433, 0.4509804, 1, 0, 1,
-0.5979462, -1.256349, -1.362575, 0.4470588, 1, 0, 1,
-0.5951827, 1.518216, 0.004934771, 0.4392157, 1, 0, 1,
-0.5938628, -0.08028626, -1.687849, 0.4352941, 1, 0, 1,
-0.5910075, -0.3696402, -3.465919, 0.427451, 1, 0, 1,
-0.579851, -0.04242971, -1.349248, 0.4235294, 1, 0, 1,
-0.5723652, 1.774152, -1.53132, 0.4156863, 1, 0, 1,
-0.5655544, 1.420867, -0.6935061, 0.4117647, 1, 0, 1,
-0.5636123, 0.08070382, -0.6417031, 0.4039216, 1, 0, 1,
-0.562932, 1.964032, -2.514006, 0.3960784, 1, 0, 1,
-0.5589066, 0.1130108, -0.1216752, 0.3921569, 1, 0, 1,
-0.553901, -0.6093812, -2.613702, 0.3843137, 1, 0, 1,
-0.5538672, 1.046691, 0.4409328, 0.3803922, 1, 0, 1,
-0.5491614, -0.6186496, -3.264265, 0.372549, 1, 0, 1,
-0.5464952, 0.8751931, -0.2952718, 0.3686275, 1, 0, 1,
-0.5456546, 0.5327959, -1.403663, 0.3607843, 1, 0, 1,
-0.5440322, 0.8128194, 0.1645913, 0.3568628, 1, 0, 1,
-0.5409601, 0.4560658, 0.1777824, 0.3490196, 1, 0, 1,
-0.5406603, 0.6345785, -2.040308, 0.345098, 1, 0, 1,
-0.5390774, 1.175715, -0.3486596, 0.3372549, 1, 0, 1,
-0.5334266, -1.690751, -4.267837, 0.3333333, 1, 0, 1,
-0.5297098, -0.7718341, -0.6826088, 0.3254902, 1, 0, 1,
-0.5296857, -0.0698765, -1.964812, 0.3215686, 1, 0, 1,
-0.5291929, 0.3700591, -1.139813, 0.3137255, 1, 0, 1,
-0.528092, -0.06128023, -1.882694, 0.3098039, 1, 0, 1,
-0.5188577, -0.6815402, -3.176825, 0.3019608, 1, 0, 1,
-0.5185794, -0.4790609, -2.125228, 0.2941177, 1, 0, 1,
-0.5170489, -0.3501365, -4.520439, 0.2901961, 1, 0, 1,
-0.5121595, 0.1625494, -2.222768, 0.282353, 1, 0, 1,
-0.5117028, 0.7511821, -2.003132, 0.2784314, 1, 0, 1,
-0.5108197, 0.9895914, -2.042721, 0.2705882, 1, 0, 1,
-0.5097917, -1.248434, -3.605557, 0.2666667, 1, 0, 1,
-0.5065413, 0.2633696, -2.3341, 0.2588235, 1, 0, 1,
-0.5033193, 0.8887072, -0.9041183, 0.254902, 1, 0, 1,
-0.5014187, -0.7848328, -2.575257, 0.2470588, 1, 0, 1,
-0.4990722, 0.5985171, -1.456726, 0.2431373, 1, 0, 1,
-0.4944316, -0.3745845, -0.9190872, 0.2352941, 1, 0, 1,
-0.4920547, -0.805056, -3.331023, 0.2313726, 1, 0, 1,
-0.4916101, 0.5727214, -1.035311, 0.2235294, 1, 0, 1,
-0.4913325, 1.025985, -2.125038, 0.2196078, 1, 0, 1,
-0.4912245, -1.114741, -0.3692685, 0.2117647, 1, 0, 1,
-0.4912019, -1.230002, -3.827506, 0.2078431, 1, 0, 1,
-0.4896418, -1.349166, -2.480322, 0.2, 1, 0, 1,
-0.4883797, -0.0775511, -1.724028, 0.1921569, 1, 0, 1,
-0.4850005, 0.8066572, 1.241036, 0.1882353, 1, 0, 1,
-0.4842907, 0.9353495, -2.090308, 0.1803922, 1, 0, 1,
-0.4817101, 1.143391, -0.4394818, 0.1764706, 1, 0, 1,
-0.4781358, -0.6147339, -1.666214, 0.1686275, 1, 0, 1,
-0.4764956, 0.8584971, -1.214761, 0.1647059, 1, 0, 1,
-0.4763826, 1.239911, -1.680098, 0.1568628, 1, 0, 1,
-0.4752147, -2.192914, -2.919963, 0.1529412, 1, 0, 1,
-0.4743124, -0.7794374, -1.068804, 0.145098, 1, 0, 1,
-0.473204, -0.5757593, -2.072761, 0.1411765, 1, 0, 1,
-0.4670192, 0.1822907, -0.9921823, 0.1333333, 1, 0, 1,
-0.4565006, -2.108771, -3.945157, 0.1294118, 1, 0, 1,
-0.4561155, 0.3307161, -1.026384, 0.1215686, 1, 0, 1,
-0.4557843, -1.435254, -2.756857, 0.1176471, 1, 0, 1,
-0.4522109, -0.1381474, 0.534506, 0.1098039, 1, 0, 1,
-0.4496509, 0.4743337, -0.3802733, 0.1058824, 1, 0, 1,
-0.4450366, -1.174411, -1.854996, 0.09803922, 1, 0, 1,
-0.4434009, -0.3119986, -3.081059, 0.09019608, 1, 0, 1,
-0.4427617, 0.2798741, -0.9833454, 0.08627451, 1, 0, 1,
-0.4425146, -0.3572768, -3.741642, 0.07843138, 1, 0, 1,
-0.4416294, 1.176853, -1.880173, 0.07450981, 1, 0, 1,
-0.4400205, 0.1972831, -0.3639607, 0.06666667, 1, 0, 1,
-0.4397011, -0.5283208, -3.068002, 0.0627451, 1, 0, 1,
-0.4395528, 0.6759945, -0.5331501, 0.05490196, 1, 0, 1,
-0.4382558, -1.427032, -1.331661, 0.05098039, 1, 0, 1,
-0.4376407, -0.1183419, -0.3415301, 0.04313726, 1, 0, 1,
-0.4371692, -0.8472821, -2.183856, 0.03921569, 1, 0, 1,
-0.4360311, 0.8962376, 1.205312, 0.03137255, 1, 0, 1,
-0.435581, -1.2138, -2.362118, 0.02745098, 1, 0, 1,
-0.4348647, -0.1536214, -2.182664, 0.01960784, 1, 0, 1,
-0.4272967, -0.2330458, -1.271381, 0.01568628, 1, 0, 1,
-0.4191062, -0.606176, -0.8643025, 0.007843138, 1, 0, 1,
-0.415406, 0.5765929, -1.378011, 0.003921569, 1, 0, 1,
-0.4112382, 0.1508571, -0.074655, 0, 1, 0.003921569, 1,
-0.408944, -0.01380881, -1.246021, 0, 1, 0.01176471, 1,
-0.4052746, -1.266513, -4.812261, 0, 1, 0.01568628, 1,
-0.4049838, 1.459898, 1.181857, 0, 1, 0.02352941, 1,
-0.404136, 0.2526575, -4.104985, 0, 1, 0.02745098, 1,
-0.4006211, 0.2934116, -2.525445, 0, 1, 0.03529412, 1,
-0.3970411, 0.4443128, -0.7974271, 0, 1, 0.03921569, 1,
-0.3930626, -0.6321945, -0.9788272, 0, 1, 0.04705882, 1,
-0.3904097, -0.7670619, -3.206787, 0, 1, 0.05098039, 1,
-0.3862061, -0.1145656, -1.022814, 0, 1, 0.05882353, 1,
-0.3858001, -1.079279, -2.560871, 0, 1, 0.0627451, 1,
-0.3855097, -0.9267279, -3.160447, 0, 1, 0.07058824, 1,
-0.3844721, -0.8363279, -1.900943, 0, 1, 0.07450981, 1,
-0.3820975, 0.1792877, -1.214625, 0, 1, 0.08235294, 1,
-0.3745154, 0.848569, -0.546913, 0, 1, 0.08627451, 1,
-0.3673887, 0.6300007, 1.06502, 0, 1, 0.09411765, 1,
-0.3671876, 0.1195289, -0.8859677, 0, 1, 0.1019608, 1,
-0.3650415, 0.291126, -0.05535819, 0, 1, 0.1058824, 1,
-0.3623385, -1.679463, -4.217638, 0, 1, 0.1137255, 1,
-0.3590687, -0.2641917, -1.159158, 0, 1, 0.1176471, 1,
-0.3587724, -1.841433, -3.253887, 0, 1, 0.1254902, 1,
-0.3571082, 0.3723121, -1.847588, 0, 1, 0.1294118, 1,
-0.3564981, 0.7842215, -0.4503446, 0, 1, 0.1372549, 1,
-0.3564868, -1.074003, -1.962888, 0, 1, 0.1411765, 1,
-0.3564146, -1.657203, -3.663869, 0, 1, 0.1490196, 1,
-0.3555129, 0.372113, -1.911262, 0, 1, 0.1529412, 1,
-0.3487917, -0.8181189, -2.085683, 0, 1, 0.1607843, 1,
-0.3472067, 2.541052, -1.757919, 0, 1, 0.1647059, 1,
-0.3408966, -0.766124, -3.733549, 0, 1, 0.172549, 1,
-0.3329677, -0.7797607, -2.899123, 0, 1, 0.1764706, 1,
-0.3318687, 1.121276, 0.2654216, 0, 1, 0.1843137, 1,
-0.3303685, -0.404177, -2.809626, 0, 1, 0.1882353, 1,
-0.3286897, 0.7954758, 0.05539306, 0, 1, 0.1960784, 1,
-0.3279359, 1.099862, 0.476163, 0, 1, 0.2039216, 1,
-0.3236289, 0.4859551, -1.943708, 0, 1, 0.2078431, 1,
-0.3227344, -0.2335387, -2.716722, 0, 1, 0.2156863, 1,
-0.3194353, -0.2363817, -2.054056, 0, 1, 0.2196078, 1,
-0.3073911, 0.1301354, 0.07163615, 0, 1, 0.227451, 1,
-0.305306, 1.632042, -0.381248, 0, 1, 0.2313726, 1,
-0.3049208, -0.3034087, -3.970591, 0, 1, 0.2392157, 1,
-0.3044896, 0.5308923, 0.04217165, 0, 1, 0.2431373, 1,
-0.304153, -0.4123278, -2.559287, 0, 1, 0.2509804, 1,
-0.3021981, -0.8172147, -0.329753, 0, 1, 0.254902, 1,
-0.3018991, 1.145873, 1.102043, 0, 1, 0.2627451, 1,
-0.2972277, -0.67554, -2.35826, 0, 1, 0.2666667, 1,
-0.2967528, -1.398114, -4.826017, 0, 1, 0.2745098, 1,
-0.2966979, -0.27239, -2.203443, 0, 1, 0.2784314, 1,
-0.2962977, -1.476289, -2.908116, 0, 1, 0.2862745, 1,
-0.2960983, 0.936007, 0.7937903, 0, 1, 0.2901961, 1,
-0.2946358, -1.783387, -3.020974, 0, 1, 0.2980392, 1,
-0.293835, 0.3083363, 0.1280584, 0, 1, 0.3058824, 1,
-0.2852466, -0.4135648, -2.633398, 0, 1, 0.3098039, 1,
-0.2842104, -1.259594, -1.822665, 0, 1, 0.3176471, 1,
-0.2812337, -1.483877, -3.364678, 0, 1, 0.3215686, 1,
-0.2789696, 0.2982531, -1.258283, 0, 1, 0.3294118, 1,
-0.2779939, -0.2573167, -3.992528, 0, 1, 0.3333333, 1,
-0.2766442, -0.1462563, -2.570628, 0, 1, 0.3411765, 1,
-0.2761188, 0.6456432, -0.02061523, 0, 1, 0.345098, 1,
-0.275556, -3.163053, -2.568682, 0, 1, 0.3529412, 1,
-0.2718355, -0.8603438, -3.358225, 0, 1, 0.3568628, 1,
-0.2678599, 0.8182874, 0.5875107, 0, 1, 0.3647059, 1,
-0.2671628, -0.1902816, -2.37937, 0, 1, 0.3686275, 1,
-0.2651139, -0.4730795, -1.414856, 0, 1, 0.3764706, 1,
-0.2639472, 0.7961254, -0.2421859, 0, 1, 0.3803922, 1,
-0.2623607, 0.265363, 0.07876045, 0, 1, 0.3882353, 1,
-0.260749, 1.325567, 2.245869, 0, 1, 0.3921569, 1,
-0.2577439, -0.7958789, -2.730329, 0, 1, 0.4, 1,
-0.2456035, 1.771594, 0.9669396, 0, 1, 0.4078431, 1,
-0.2429597, -1.271676, -1.999056, 0, 1, 0.4117647, 1,
-0.238834, 0.9069875, 0.4121966, 0, 1, 0.4196078, 1,
-0.238235, -1.745694, -2.037613, 0, 1, 0.4235294, 1,
-0.2373854, 1.518497, -1.621762, 0, 1, 0.4313726, 1,
-0.2369287, 0.3513714, -0.5955024, 0, 1, 0.4352941, 1,
-0.2339969, -1.211874, -3.699877, 0, 1, 0.4431373, 1,
-0.2294883, 0.7035044, 0.2655056, 0, 1, 0.4470588, 1,
-0.2286879, 0.7870679, -0.435101, 0, 1, 0.454902, 1,
-0.2200757, -0.7697869, -3.19051, 0, 1, 0.4588235, 1,
-0.2194347, -2.685831, -1.037489, 0, 1, 0.4666667, 1,
-0.2185817, 0.3900893, -2.855929, 0, 1, 0.4705882, 1,
-0.2162182, 1.031419, -0.6366497, 0, 1, 0.4784314, 1,
-0.2159182, 0.3754737, 0.7219194, 0, 1, 0.4823529, 1,
-0.215695, -0.3045647, -1.523774, 0, 1, 0.4901961, 1,
-0.2129674, 1.203071, -0.1462653, 0, 1, 0.4941176, 1,
-0.2082752, -1.353085, -2.586509, 0, 1, 0.5019608, 1,
-0.2067098, 0.9820206, -1.056409, 0, 1, 0.509804, 1,
-0.1980755, -1.135476, -3.423595, 0, 1, 0.5137255, 1,
-0.1979216, -0.3693722, -2.862799, 0, 1, 0.5215687, 1,
-0.1958371, 1.195494, -0.06924073, 0, 1, 0.5254902, 1,
-0.1931406, 2.162303, -1.332403, 0, 1, 0.5333334, 1,
-0.1863365, -1.564226, -2.858498, 0, 1, 0.5372549, 1,
-0.1854491, 1.251986, 0.2419942, 0, 1, 0.5450981, 1,
-0.1852661, -1.13839, -2.694537, 0, 1, 0.5490196, 1,
-0.1835407, -0.8232716, -3.272369, 0, 1, 0.5568628, 1,
-0.1833107, -1.594432, -3.071745, 0, 1, 0.5607843, 1,
-0.1788308, -0.6669677, -3.978675, 0, 1, 0.5686275, 1,
-0.1760941, 0.07298977, -1.750313, 0, 1, 0.572549, 1,
-0.1724951, -0.1643291, -3.502595, 0, 1, 0.5803922, 1,
-0.171376, -0.07517126, -2.644427, 0, 1, 0.5843138, 1,
-0.166692, -0.8385373, -3.616142, 0, 1, 0.5921569, 1,
-0.1654656, -0.6662504, -2.129421, 0, 1, 0.5960785, 1,
-0.1645381, 0.9896, 0.8416708, 0, 1, 0.6039216, 1,
-0.1643696, -1.07874, -3.077025, 0, 1, 0.6117647, 1,
-0.1604469, -0.932161, -3.268693, 0, 1, 0.6156863, 1,
-0.1519373, -1.958563, -3.402868, 0, 1, 0.6235294, 1,
-0.1512153, 0.0727667, -0.1293726, 0, 1, 0.627451, 1,
-0.1491463, -1.01835, -3.140103, 0, 1, 0.6352941, 1,
-0.1473178, -0.570174, -2.570627, 0, 1, 0.6392157, 1,
-0.147124, -1.102539, -1.567811, 0, 1, 0.6470588, 1,
-0.1468382, 1.042239, -1.967625, 0, 1, 0.6509804, 1,
-0.144934, 0.2458438, -1.118829, 0, 1, 0.6588235, 1,
-0.1381684, 0.1974829, 1.996688, 0, 1, 0.6627451, 1,
-0.1377961, 0.5248403, 0.4971881, 0, 1, 0.6705883, 1,
-0.1353365, -1.06467, -2.71299, 0, 1, 0.6745098, 1,
-0.1348044, 0.05661068, -0.4350912, 0, 1, 0.682353, 1,
-0.1347107, -0.2683229, -1.948736, 0, 1, 0.6862745, 1,
-0.1340363, -0.174037, -3.787275, 0, 1, 0.6941177, 1,
-0.1305756, 0.1566305, 1.118221, 0, 1, 0.7019608, 1,
-0.1268894, -1.36774, -1.458388, 0, 1, 0.7058824, 1,
-0.1268444, -2.15399, -3.807086, 0, 1, 0.7137255, 1,
-0.1221566, -1.374411, -3.744009, 0, 1, 0.7176471, 1,
-0.1209276, 1.41305, 0.5492853, 0, 1, 0.7254902, 1,
-0.1199693, 0.813324, 0.4500995, 0, 1, 0.7294118, 1,
-0.1135028, -0.3904084, -3.199863, 0, 1, 0.7372549, 1,
-0.1125721, -0.2548638, -2.447355, 0, 1, 0.7411765, 1,
-0.1080001, 2.097324, -0.9018726, 0, 1, 0.7490196, 1,
-0.107145, 0.4711384, 1.817383, 0, 1, 0.7529412, 1,
-0.1054533, 0.8070507, -1.824325, 0, 1, 0.7607843, 1,
-0.1042481, -0.5775653, -3.444008, 0, 1, 0.7647059, 1,
-0.1018731, -0.3882276, -3.216698, 0, 1, 0.772549, 1,
-0.1001215, 0.870935, -1.189222, 0, 1, 0.7764706, 1,
-0.09681787, 0.08405615, -1.126867, 0, 1, 0.7843137, 1,
-0.09239251, -0.08371342, -2.560101, 0, 1, 0.7882353, 1,
-0.08662934, 0.8309333, 0.06562168, 0, 1, 0.7960784, 1,
-0.08502451, 0.1877326, -1.572237, 0, 1, 0.8039216, 1,
-0.0840815, 0.9089885, -2.305078, 0, 1, 0.8078431, 1,
-0.08256953, 0.8570824, 0.4554874, 0, 1, 0.8156863, 1,
-0.07669529, 0.5793253, 0.9443831, 0, 1, 0.8196079, 1,
-0.07425075, -1.886717, -3.80435, 0, 1, 0.827451, 1,
-0.07410733, -0.1753335, -3.451337, 0, 1, 0.8313726, 1,
-0.07343698, 2.278724, -0.04276284, 0, 1, 0.8392157, 1,
-0.06940228, 1.382087, -0.4898393, 0, 1, 0.8431373, 1,
-0.06357756, 1.308383, 0.9537277, 0, 1, 0.8509804, 1,
-0.06151752, -0.2940018, -1.941698, 0, 1, 0.854902, 1,
-0.05842634, 1.164798, -0.5805486, 0, 1, 0.8627451, 1,
-0.05723407, -0.1728065, -1.444787, 0, 1, 0.8666667, 1,
-0.05703539, 0.2245958, -0.7357761, 0, 1, 0.8745098, 1,
-0.05569733, -0.112913, -2.064027, 0, 1, 0.8784314, 1,
-0.05137191, 0.5893298, 0.2360616, 0, 1, 0.8862745, 1,
-0.05037872, 0.2414397, -0.8660259, 0, 1, 0.8901961, 1,
-0.05029711, 0.00217474, -3.059647, 0, 1, 0.8980392, 1,
-0.04498132, 1.551534, -1.146077, 0, 1, 0.9058824, 1,
-0.0425837, 0.8139563, 0.3414758, 0, 1, 0.9098039, 1,
-0.04182212, -0.4551676, -3.338161, 0, 1, 0.9176471, 1,
-0.04057434, 0.4248865, 0.06810966, 0, 1, 0.9215686, 1,
-0.04037284, 0.6034561, -0.7923676, 0, 1, 0.9294118, 1,
-0.04030848, 0.348492, 0.1910499, 0, 1, 0.9333333, 1,
-0.03728148, -0.04572241, -3.581142, 0, 1, 0.9411765, 1,
-0.03474184, 1.587178, -1.179196, 0, 1, 0.945098, 1,
-0.02135016, -0.4227728, -2.387866, 0, 1, 0.9529412, 1,
-0.01922495, 0.9429263, -0.3203254, 0, 1, 0.9568627, 1,
-0.01723164, -0.9946716, -3.331283, 0, 1, 0.9647059, 1,
-0.01554109, 0.02501402, 0.5041999, 0, 1, 0.9686275, 1,
-0.01300701, 0.00619415, -0.1613597, 0, 1, 0.9764706, 1,
-0.01288357, 0.6098342, 1.882802, 0, 1, 0.9803922, 1,
-0.0101242, 0.4420159, -2.043674, 0, 1, 0.9882353, 1,
-0.006073369, 1.72476, 0.1955784, 0, 1, 0.9921569, 1,
-0.0009576534, -1.354451, -1.701871, 0, 1, 1, 1,
0.001757226, -1.01701, 4.076933, 0, 0.9921569, 1, 1,
0.003697478, -2.037657, 3.976938, 0, 0.9882353, 1, 1,
0.004144719, 0.8417348, -0.9127031, 0, 0.9803922, 1, 1,
0.008999403, 0.0492822, -0.694394, 0, 0.9764706, 1, 1,
0.01007113, -0.1713488, 2.424854, 0, 0.9686275, 1, 1,
0.01095833, -0.4292066, 1.874659, 0, 0.9647059, 1, 1,
0.01396943, 1.262364, -0.5159518, 0, 0.9568627, 1, 1,
0.01614082, -0.4356996, 3.92641, 0, 0.9529412, 1, 1,
0.01767661, 0.3483812, -2.158935, 0, 0.945098, 1, 1,
0.0185703, 0.02409005, 0.8495573, 0, 0.9411765, 1, 1,
0.02233484, -0.4323891, 3.499156, 0, 0.9333333, 1, 1,
0.02358668, 2.127353, -0.9820009, 0, 0.9294118, 1, 1,
0.02674553, 0.214123, -1.195725, 0, 0.9215686, 1, 1,
0.02698769, 0.05613125, 0.8265631, 0, 0.9176471, 1, 1,
0.02725082, 1.319043, 1.576398, 0, 0.9098039, 1, 1,
0.02991864, -0.5305731, 3.648324, 0, 0.9058824, 1, 1,
0.03563041, -0.02859334, 2.647434, 0, 0.8980392, 1, 1,
0.0387717, 1.929586, -1.443853, 0, 0.8901961, 1, 1,
0.04277429, 1.459945, 0.1171808, 0, 0.8862745, 1, 1,
0.04290163, -0.9728972, 3.026022, 0, 0.8784314, 1, 1,
0.04596508, 0.5097393, 0.2227163, 0, 0.8745098, 1, 1,
0.04661312, -0.3087504, 3.351371, 0, 0.8666667, 1, 1,
0.04742, 0.5161062, 0.66278, 0, 0.8627451, 1, 1,
0.05473279, -1.002949, 4.703546, 0, 0.854902, 1, 1,
0.06329522, -0.409383, 3.467301, 0, 0.8509804, 1, 1,
0.06444938, -1.545578, 1.886418, 0, 0.8431373, 1, 1,
0.06627136, -1.696911, 3.34277, 0, 0.8392157, 1, 1,
0.06848219, -3.542326, 3.693077, 0, 0.8313726, 1, 1,
0.06902295, 0.2857332, -0.9328538, 0, 0.827451, 1, 1,
0.07418332, -1.336524, 4.171319, 0, 0.8196079, 1, 1,
0.0806423, -0.7090814, 5.887984, 0, 0.8156863, 1, 1,
0.08127445, -0.2265342, 3.552186, 0, 0.8078431, 1, 1,
0.08624047, 0.7302542, -0.5268933, 0, 0.8039216, 1, 1,
0.09127446, -1.204872, 3.243265, 0, 0.7960784, 1, 1,
0.09328748, -1.250508, 0.1854486, 0, 0.7882353, 1, 1,
0.09891101, 0.4211285, -1.15721, 0, 0.7843137, 1, 1,
0.1019949, 0.4715925, 1.704562, 0, 0.7764706, 1, 1,
0.1036856, -1.105476, 4.809936, 0, 0.772549, 1, 1,
0.1090116, 0.05632095, 0.6479348, 0, 0.7647059, 1, 1,
0.113939, -0.4322305, 3.676425, 0, 0.7607843, 1, 1,
0.1149054, -1.082448, 1.943465, 0, 0.7529412, 1, 1,
0.1161086, -0.4927454, 1.100069, 0, 0.7490196, 1, 1,
0.121589, 0.1065581, -0.4605206, 0, 0.7411765, 1, 1,
0.1232429, 1.968779, -0.2648224, 0, 0.7372549, 1, 1,
0.1286732, 1.391579, 0.39443, 0, 0.7294118, 1, 1,
0.1339372, -0.7071619, 2.40294, 0, 0.7254902, 1, 1,
0.1343123, -0.5018689, 2.218719, 0, 0.7176471, 1, 1,
0.1356367, 1.519779, 0.7122046, 0, 0.7137255, 1, 1,
0.1374566, -2.322324, 2.477012, 0, 0.7058824, 1, 1,
0.1403338, 0.8866752, -0.8950186, 0, 0.6980392, 1, 1,
0.140942, -0.1521049, 3.51897, 0, 0.6941177, 1, 1,
0.1463386, 2.363576, -0.9313857, 0, 0.6862745, 1, 1,
0.1509178, 0.03003766, 2.040832, 0, 0.682353, 1, 1,
0.1512423, 0.5034484, 0.7629359, 0, 0.6745098, 1, 1,
0.1515441, -0.6255488, 1.336376, 0, 0.6705883, 1, 1,
0.1534668, 1.961868, 0.4214817, 0, 0.6627451, 1, 1,
0.1541692, -1.44963, 2.61794, 0, 0.6588235, 1, 1,
0.1568463, -1.466832, 1.569227, 0, 0.6509804, 1, 1,
0.1591256, 0.7624177, -0.3286286, 0, 0.6470588, 1, 1,
0.1603826, -0.7094256, 2.353327, 0, 0.6392157, 1, 1,
0.1618891, 1.726664, 0.3549315, 0, 0.6352941, 1, 1,
0.161894, -0.9942677, 3.111085, 0, 0.627451, 1, 1,
0.1672259, 1.556559, -0.1266861, 0, 0.6235294, 1, 1,
0.1750561, -0.1333315, 0.5674102, 0, 0.6156863, 1, 1,
0.1770107, -0.432208, 0.3429451, 0, 0.6117647, 1, 1,
0.180195, -0.3731966, 2.929128, 0, 0.6039216, 1, 1,
0.1809839, -0.1135855, 2.089118, 0, 0.5960785, 1, 1,
0.1819845, -0.2521968, 2.686789, 0, 0.5921569, 1, 1,
0.1826382, 0.3435276, -0.7327408, 0, 0.5843138, 1, 1,
0.1866845, -0.2376863, 1.057541, 0, 0.5803922, 1, 1,
0.187122, -0.5974844, 2.628865, 0, 0.572549, 1, 1,
0.1889472, 1.41363, -0.05655618, 0, 0.5686275, 1, 1,
0.1904091, 0.4037258, -1.411147, 0, 0.5607843, 1, 1,
0.1906667, -0.1281812, 3.879571, 0, 0.5568628, 1, 1,
0.1919895, -1.215817, 4.078901, 0, 0.5490196, 1, 1,
0.1930803, 0.1631852, 1.424683, 0, 0.5450981, 1, 1,
0.1983901, -1.25695, 2.189127, 0, 0.5372549, 1, 1,
0.1993195, 0.6803013, 1.157445, 0, 0.5333334, 1, 1,
0.2009762, -1.710982, 3.741549, 0, 0.5254902, 1, 1,
0.2017098, -0.08026132, 1.147757, 0, 0.5215687, 1, 1,
0.2021207, -0.6352354, 3.673435, 0, 0.5137255, 1, 1,
0.213384, -0.7241698, 3.387733, 0, 0.509804, 1, 1,
0.2201356, -0.7740281, 3.864502, 0, 0.5019608, 1, 1,
0.2205968, -0.6305687, 3.247974, 0, 0.4941176, 1, 1,
0.221254, -1.03752, 4.656755, 0, 0.4901961, 1, 1,
0.2218494, -0.7404938, 2.156611, 0, 0.4823529, 1, 1,
0.2286754, 0.1989345, 0.6325893, 0, 0.4784314, 1, 1,
0.231668, 2.01649, -1.785228, 0, 0.4705882, 1, 1,
0.232963, 0.5576705, 0.6294593, 0, 0.4666667, 1, 1,
0.2330391, -1.338013, 2.814859, 0, 0.4588235, 1, 1,
0.2374006, -0.1309148, 0.6705614, 0, 0.454902, 1, 1,
0.237518, -1.15522, 2.549674, 0, 0.4470588, 1, 1,
0.2407975, -1.064745, 2.238798, 0, 0.4431373, 1, 1,
0.2408255, 0.9050969, -1.821511, 0, 0.4352941, 1, 1,
0.2441638, 1.274598, 0.4295953, 0, 0.4313726, 1, 1,
0.2446495, 0.582567, 0.5971453, 0, 0.4235294, 1, 1,
0.2469539, -0.9675997, 2.255876, 0, 0.4196078, 1, 1,
0.2501028, -1.493914, 1.719824, 0, 0.4117647, 1, 1,
0.2525598, -1.922401, 2.744129, 0, 0.4078431, 1, 1,
0.2533228, -0.01469055, 2.398855, 0, 0.4, 1, 1,
0.2585968, 0.4649087, 0.6409155, 0, 0.3921569, 1, 1,
0.2625338, -0.4752974, 3.69563, 0, 0.3882353, 1, 1,
0.2640528, -0.4381053, 2.595779, 0, 0.3803922, 1, 1,
0.2676786, 1.181361, -1.56871, 0, 0.3764706, 1, 1,
0.2720422, 1.215239, 0.1184177, 0, 0.3686275, 1, 1,
0.2782073, -0.5543933, 3.046153, 0, 0.3647059, 1, 1,
0.2800419, -0.4938949, 1.215853, 0, 0.3568628, 1, 1,
0.2807655, 0.3071403, -0.1319942, 0, 0.3529412, 1, 1,
0.2815851, 0.5109036, 0.06752883, 0, 0.345098, 1, 1,
0.2834415, -1.642148, 3.303702, 0, 0.3411765, 1, 1,
0.2862753, -0.568741, 1.507313, 0, 0.3333333, 1, 1,
0.2908196, -1.716493, 3.917279, 0, 0.3294118, 1, 1,
0.295432, 0.1457672, 2.277128, 0, 0.3215686, 1, 1,
0.2959464, 1.180357, 0.8998241, 0, 0.3176471, 1, 1,
0.2962451, 0.862321, 1.220508, 0, 0.3098039, 1, 1,
0.296823, 0.950349, -0.6545897, 0, 0.3058824, 1, 1,
0.3028991, 0.1225995, 0.4254466, 0, 0.2980392, 1, 1,
0.3037054, -0.1433045, 3.301096, 0, 0.2901961, 1, 1,
0.3054028, 0.22834, 0.2184107, 0, 0.2862745, 1, 1,
0.3055092, 0.5662791, -0.2816529, 0, 0.2784314, 1, 1,
0.3063873, -1.254503, 3.244966, 0, 0.2745098, 1, 1,
0.3077918, 0.424118, -0.05113299, 0, 0.2666667, 1, 1,
0.3084693, 0.8105316, 0.8122432, 0, 0.2627451, 1, 1,
0.3139503, 0.5342398, -0.1454068, 0, 0.254902, 1, 1,
0.3142908, -1.140436, 3.331732, 0, 0.2509804, 1, 1,
0.3146467, 1.464996, -0.5076573, 0, 0.2431373, 1, 1,
0.3160426, -0.08208299, 1.196917, 0, 0.2392157, 1, 1,
0.3223708, 0.02357821, -0.1335936, 0, 0.2313726, 1, 1,
0.3230332, 2.322577, -0.1093271, 0, 0.227451, 1, 1,
0.3253882, -0.7403339, 3.370882, 0, 0.2196078, 1, 1,
0.325505, 1.134387, 0.7731268, 0, 0.2156863, 1, 1,
0.3274072, 3.436865, 0.9891669, 0, 0.2078431, 1, 1,
0.3278587, -1.220686, 1.972107, 0, 0.2039216, 1, 1,
0.331703, 2.228405, 1.133848, 0, 0.1960784, 1, 1,
0.3317252, 0.6024563, -1.408201, 0, 0.1882353, 1, 1,
0.3328629, -1.443637, 2.48583, 0, 0.1843137, 1, 1,
0.3399862, -1.144891, 2.065562, 0, 0.1764706, 1, 1,
0.3434101, -0.178192, 0.5214537, 0, 0.172549, 1, 1,
0.3452143, 1.018764, 0.7726738, 0, 0.1647059, 1, 1,
0.3501313, 1.070853, 0.7121946, 0, 0.1607843, 1, 1,
0.361092, 0.5957367, -1.218902, 0, 0.1529412, 1, 1,
0.3619295, 0.02505376, 1.07161, 0, 0.1490196, 1, 1,
0.363923, -1.126027, 2.101474, 0, 0.1411765, 1, 1,
0.3691725, 1.178551, -2.441565, 0, 0.1372549, 1, 1,
0.3708251, 1.650486, 0.4183731, 0, 0.1294118, 1, 1,
0.3740244, 1.304637, 0.2128243, 0, 0.1254902, 1, 1,
0.3779515, 2.482661, -0.6262244, 0, 0.1176471, 1, 1,
0.3816017, -0.7852968, 3.600807, 0, 0.1137255, 1, 1,
0.3830835, -0.2637784, 2.328537, 0, 0.1058824, 1, 1,
0.3864114, 2.231864, 0.6147341, 0, 0.09803922, 1, 1,
0.3895664, -0.891159, 2.004686, 0, 0.09411765, 1, 1,
0.3901228, -0.2710153, 0.8561723, 0, 0.08627451, 1, 1,
0.3907112, -1.378712, 2.836087, 0, 0.08235294, 1, 1,
0.3934287, -0.2051761, 3.909418, 0, 0.07450981, 1, 1,
0.4053579, 0.5736047, -0.5668835, 0, 0.07058824, 1, 1,
0.40558, 1.620761, 1.687257, 0, 0.0627451, 1, 1,
0.4063611, 1.985672, 0.8886945, 0, 0.05882353, 1, 1,
0.4075328, -0.019417, 1.139151, 0, 0.05098039, 1, 1,
0.4112012, -0.9661366, 1.759766, 0, 0.04705882, 1, 1,
0.4128593, 0.545706, 1.537218, 0, 0.03921569, 1, 1,
0.4149829, 1.443415, 0.5795656, 0, 0.03529412, 1, 1,
0.4174117, -0.6022118, 3.021368, 0, 0.02745098, 1, 1,
0.4212743, 0.7487172, 0.8028244, 0, 0.02352941, 1, 1,
0.4215763, 0.2265537, -0.3775307, 0, 0.01568628, 1, 1,
0.4231711, -0.7958056, 2.390846, 0, 0.01176471, 1, 1,
0.4237518, -0.1031598, 1.262962, 0, 0.003921569, 1, 1,
0.4252535, -0.1846432, 3.414536, 0.003921569, 0, 1, 1,
0.4282055, 0.2321354, 0.8400971, 0.007843138, 0, 1, 1,
0.4295015, 1.045299, 0.5980451, 0.01568628, 0, 1, 1,
0.4324526, 2.074227, 0.4291135, 0.01960784, 0, 1, 1,
0.4351757, 0.2151824, 1.910535, 0.02745098, 0, 1, 1,
0.4364698, 0.6754599, -0.2403788, 0.03137255, 0, 1, 1,
0.4373399, 0.7858363, 0.5382384, 0.03921569, 0, 1, 1,
0.4393524, 1.413328, 0.2320905, 0.04313726, 0, 1, 1,
0.4437273, -0.7795076, 2.015768, 0.05098039, 0, 1, 1,
0.4445632, 0.9445259, 1.938323, 0.05490196, 0, 1, 1,
0.4542488, -1.051053, 1.194577, 0.0627451, 0, 1, 1,
0.4556847, -0.04117957, 1.353579, 0.06666667, 0, 1, 1,
0.4627635, 0.9651013, -1.531931, 0.07450981, 0, 1, 1,
0.4642253, -1.012738, 1.807709, 0.07843138, 0, 1, 1,
0.4648964, -0.3436979, 2.203412, 0.08627451, 0, 1, 1,
0.4692088, 1.581844, -1.051786, 0.09019608, 0, 1, 1,
0.4692643, 0.9361329, -0.03688532, 0.09803922, 0, 1, 1,
0.4706629, -0.2017477, 2.017531, 0.1058824, 0, 1, 1,
0.4742353, 0.7996892, 1.658659, 0.1098039, 0, 1, 1,
0.4748374, 1.37194, 0.1341249, 0.1176471, 0, 1, 1,
0.4772098, -0.3723749, 2.673287, 0.1215686, 0, 1, 1,
0.479145, -1.147349, 2.509932, 0.1294118, 0, 1, 1,
0.4830967, 0.1817227, 0.6755205, 0.1333333, 0, 1, 1,
0.483709, 0.6293715, -1.546411, 0.1411765, 0, 1, 1,
0.484694, -0.3150007, 3.147481, 0.145098, 0, 1, 1,
0.48627, -0.2349671, 3.245399, 0.1529412, 0, 1, 1,
0.4913199, -0.4057513, 2.965871, 0.1568628, 0, 1, 1,
0.4913497, -0.1651287, 1.895016, 0.1647059, 0, 1, 1,
0.4966324, 0.734103, 0.7274538, 0.1686275, 0, 1, 1,
0.4980904, -1.074125, 3.528988, 0.1764706, 0, 1, 1,
0.4996195, -1.37003, 4.043608, 0.1803922, 0, 1, 1,
0.5020833, 0.1757128, 0.7724938, 0.1882353, 0, 1, 1,
0.507709, -0.6133824, 2.87297, 0.1921569, 0, 1, 1,
0.507944, 1.310616, 2.015593, 0.2, 0, 1, 1,
0.5136818, 1.681491, 0.7265909, 0.2078431, 0, 1, 1,
0.5153942, -0.5926427, 3.674395, 0.2117647, 0, 1, 1,
0.519252, 0.9634481, 0.5810632, 0.2196078, 0, 1, 1,
0.5234727, 0.3990345, 0.5291034, 0.2235294, 0, 1, 1,
0.5282158, 0.4540757, 1.246924, 0.2313726, 0, 1, 1,
0.5398102, 1.112873, -0.9402054, 0.2352941, 0, 1, 1,
0.5426726, -1.639207, 3.136649, 0.2431373, 0, 1, 1,
0.5520793, 0.6887703, 0.445424, 0.2470588, 0, 1, 1,
0.5541745, -0.2034056, 1.564007, 0.254902, 0, 1, 1,
0.5551843, 0.4276278, 2.341731, 0.2588235, 0, 1, 1,
0.5554776, 0.2808857, 2.272706, 0.2666667, 0, 1, 1,
0.5580683, 0.6351516, 0.8348044, 0.2705882, 0, 1, 1,
0.5627931, 0.5239955, 1.021399, 0.2784314, 0, 1, 1,
0.5660482, 1.73887, 0.8120896, 0.282353, 0, 1, 1,
0.5693462, 0.8211492, -0.2287173, 0.2901961, 0, 1, 1,
0.5724097, 1.223981, -0.6992779, 0.2941177, 0, 1, 1,
0.5754896, -0.2174958, 5.542258, 0.3019608, 0, 1, 1,
0.5777641, 1.663172, 0.1569491, 0.3098039, 0, 1, 1,
0.5785439, -3.083518, 3.30467, 0.3137255, 0, 1, 1,
0.5793904, 0.4821902, 1.202937, 0.3215686, 0, 1, 1,
0.5872665, -0.1104854, 2.468646, 0.3254902, 0, 1, 1,
0.5873944, -1.478582, 2.259471, 0.3333333, 0, 1, 1,
0.588904, 1.036214, 0.6466279, 0.3372549, 0, 1, 1,
0.5889676, -0.7594545, 2.541543, 0.345098, 0, 1, 1,
0.5944297, 0.4126894, 1.243659, 0.3490196, 0, 1, 1,
0.5990074, -1.642509, 1.583269, 0.3568628, 0, 1, 1,
0.5990518, 1.715558, 1.512366, 0.3607843, 0, 1, 1,
0.6073453, 0.9266492, -1.284807, 0.3686275, 0, 1, 1,
0.6087031, 0.9366258, -0.2718922, 0.372549, 0, 1, 1,
0.6112304, -0.9246365, 2.282069, 0.3803922, 0, 1, 1,
0.6203238, 1.04325, -1.525046, 0.3843137, 0, 1, 1,
0.622188, -1.080083, 1.939992, 0.3921569, 0, 1, 1,
0.6227559, 0.6550867, 0.194583, 0.3960784, 0, 1, 1,
0.6253985, -0.7530336, 2.701415, 0.4039216, 0, 1, 1,
0.6256266, 2.153355, -1.232745, 0.4117647, 0, 1, 1,
0.6349258, 0.262268, 0.5360062, 0.4156863, 0, 1, 1,
0.6367359, -0.2277217, 4.740613, 0.4235294, 0, 1, 1,
0.6384888, 0.9704478, 1.851397, 0.427451, 0, 1, 1,
0.6446581, 0.2405907, 2.247749, 0.4352941, 0, 1, 1,
0.6556897, -0.1682404, 0.8565374, 0.4392157, 0, 1, 1,
0.6561936, -0.2968191, 2.080281, 0.4470588, 0, 1, 1,
0.6564264, 0.4978902, 3.023568, 0.4509804, 0, 1, 1,
0.6624525, 0.984884, 1.085089, 0.4588235, 0, 1, 1,
0.6640666, 0.9824052, -1.620034, 0.4627451, 0, 1, 1,
0.6673337, 1.257272, 1.325105, 0.4705882, 0, 1, 1,
0.6777682, -1.624163, 2.268465, 0.4745098, 0, 1, 1,
0.6803406, -1.770664, 3.710644, 0.4823529, 0, 1, 1,
0.691444, -0.8828397, 0.876524, 0.4862745, 0, 1, 1,
0.6928342, -0.1645732, 2.636728, 0.4941176, 0, 1, 1,
0.696716, -1.01697, 2.690884, 0.5019608, 0, 1, 1,
0.6992579, 0.8381562, 0.9940287, 0.5058824, 0, 1, 1,
0.7062189, -0.7389114, -0.4962843, 0.5137255, 0, 1, 1,
0.7067417, 0.7181166, 1.663313, 0.5176471, 0, 1, 1,
0.7094705, 0.3675548, 3.265156, 0.5254902, 0, 1, 1,
0.7128535, 0.4723386, 1.211543, 0.5294118, 0, 1, 1,
0.7141173, 0.03545161, 1.603424, 0.5372549, 0, 1, 1,
0.7151785, 0.4121476, 0.1334562, 0.5411765, 0, 1, 1,
0.7185133, -2.029211, 1.204549, 0.5490196, 0, 1, 1,
0.7240497, -1.318328, 4.139104, 0.5529412, 0, 1, 1,
0.7251386, -0.7556833, 1.138929, 0.5607843, 0, 1, 1,
0.7279737, 0.03930137, 2.061286, 0.5647059, 0, 1, 1,
0.7292221, 0.4250651, -0.6559836, 0.572549, 0, 1, 1,
0.7340518, -2.298934, 4.724017, 0.5764706, 0, 1, 1,
0.7454115, 0.06263298, 2.906234, 0.5843138, 0, 1, 1,
0.7477021, 0.6844466, 0.7844993, 0.5882353, 0, 1, 1,
0.7518389, 0.3655519, 0.893263, 0.5960785, 0, 1, 1,
0.759501, 1.036433, -0.8617867, 0.6039216, 0, 1, 1,
0.7635676, -0.9559472, 3.114065, 0.6078432, 0, 1, 1,
0.7637008, 0.4735281, 0.1043788, 0.6156863, 0, 1, 1,
0.7648887, -0.5211664, 2.196894, 0.6196079, 0, 1, 1,
0.7716872, -0.1619955, 0.9511651, 0.627451, 0, 1, 1,
0.7779431, -0.2863759, 2.910272, 0.6313726, 0, 1, 1,
0.7809375, -1.205132, 2.395416, 0.6392157, 0, 1, 1,
0.7823734, 0.9884431, -1.584945, 0.6431373, 0, 1, 1,
0.7838856, -1.425533, 2.571169, 0.6509804, 0, 1, 1,
0.7863993, 0.3029896, 0.7794956, 0.654902, 0, 1, 1,
0.7880868, -0.2766368, 2.518594, 0.6627451, 0, 1, 1,
0.7910571, -0.7774708, 2.965079, 0.6666667, 0, 1, 1,
0.79206, 0.4744288, 1.640988, 0.6745098, 0, 1, 1,
0.7971105, -0.3840158, 1.835943, 0.6784314, 0, 1, 1,
0.8015588, -1.531272, 3.575902, 0.6862745, 0, 1, 1,
0.8033245, -1.573002, 2.235045, 0.6901961, 0, 1, 1,
0.8084039, 0.1604745, 1.042266, 0.6980392, 0, 1, 1,
0.8129956, 1.875449, 0.001824231, 0.7058824, 0, 1, 1,
0.8139813, 0.5564504, 0.877571, 0.7098039, 0, 1, 1,
0.8195676, 1.029046, -1.082388, 0.7176471, 0, 1, 1,
0.8197402, -1.254596, 2.990567, 0.7215686, 0, 1, 1,
0.8244073, 0.5537848, 0.6582212, 0.7294118, 0, 1, 1,
0.8278218, 0.4092151, 1.658165, 0.7333333, 0, 1, 1,
0.828365, 0.9685619, -0.4368902, 0.7411765, 0, 1, 1,
0.8346381, 1.299149, -0.8199587, 0.7450981, 0, 1, 1,
0.8445159, 0.8161476, -0.4534259, 0.7529412, 0, 1, 1,
0.8455265, -0.9977918, 1.649482, 0.7568628, 0, 1, 1,
0.8514209, 0.5600289, 2.568825, 0.7647059, 0, 1, 1,
0.8546615, -0.7007576, 1.913255, 0.7686275, 0, 1, 1,
0.8638256, -1.003738, -0.7158687, 0.7764706, 0, 1, 1,
0.865705, -0.1669693, 0.7059591, 0.7803922, 0, 1, 1,
0.8682927, 0.9070799, 0.5649357, 0.7882353, 0, 1, 1,
0.8684559, 0.2530802, 0.6952537, 0.7921569, 0, 1, 1,
0.8723404, 0.1960457, 0.1987619, 0.8, 0, 1, 1,
0.8724872, -1.247644, 1.94893, 0.8078431, 0, 1, 1,
0.8761167, -0.7716066, 1.382765, 0.8117647, 0, 1, 1,
0.8761373, 0.6718665, -0.5082902, 0.8196079, 0, 1, 1,
0.8795111, 1.130264, 0.08105816, 0.8235294, 0, 1, 1,
0.8822362, 0.6199803, 0.4692613, 0.8313726, 0, 1, 1,
0.8932852, 0.1052626, -0.5533719, 0.8352941, 0, 1, 1,
0.8983004, -0.7271331, 3.516099, 0.8431373, 0, 1, 1,
0.9025335, -0.745797, 1.607198, 0.8470588, 0, 1, 1,
0.9068884, 1.915168, -0.1964647, 0.854902, 0, 1, 1,
0.9070029, -0.7324372, 1.767691, 0.8588235, 0, 1, 1,
0.9073431, 0.09609095, 0.6951153, 0.8666667, 0, 1, 1,
0.9187503, -0.5657545, 1.081524, 0.8705882, 0, 1, 1,
0.9293631, -0.1170601, 3.497527, 0.8784314, 0, 1, 1,
0.929482, 0.6565092, 0.6080805, 0.8823529, 0, 1, 1,
0.9354407, -1.287299, 2.693284, 0.8901961, 0, 1, 1,
0.9382722, -0.930611, 1.109915, 0.8941177, 0, 1, 1,
0.9400428, 1.003216, 4.098886, 0.9019608, 0, 1, 1,
0.9462053, 3.473236, -0.1389253, 0.9098039, 0, 1, 1,
0.9553745, -0.2881375, 0.2673544, 0.9137255, 0, 1, 1,
0.9711436, 0.1855492, 1.915812, 0.9215686, 0, 1, 1,
0.975665, -1.288538, 3.354309, 0.9254902, 0, 1, 1,
0.9769376, 0.1719019, 2.324751, 0.9333333, 0, 1, 1,
0.983165, -0.1686896, 1.883724, 0.9372549, 0, 1, 1,
0.9849209, -0.0372249, 0.7174729, 0.945098, 0, 1, 1,
0.9860989, 1.947046, 0.701369, 0.9490196, 0, 1, 1,
0.9863512, -1.907528, 3.066049, 0.9568627, 0, 1, 1,
0.9900831, -0.09604993, 3.405226, 0.9607843, 0, 1, 1,
0.9947897, 1.290276, 1.040521, 0.9686275, 0, 1, 1,
1.002603, 1.108935, 1.637836, 0.972549, 0, 1, 1,
1.002865, 0.05990855, 0.8066443, 0.9803922, 0, 1, 1,
1.003685, -0.1934761, 1.323119, 0.9843137, 0, 1, 1,
1.005244, -0.4661056, 1.732399, 0.9921569, 0, 1, 1,
1.005685, 1.760693, 0.5396714, 0.9960784, 0, 1, 1,
1.010984, -1.696708, 1.731912, 1, 0, 0.9960784, 1,
1.021072, 0.7212763, 1.417693, 1, 0, 0.9882353, 1,
1.027976, 1.227712, 1.135729, 1, 0, 0.9843137, 1,
1.028275, 0.5056003, 1.60524, 1, 0, 0.9764706, 1,
1.029774, -0.8274089, 0.4875879, 1, 0, 0.972549, 1,
1.03279, 0.5588703, 0.2304943, 1, 0, 0.9647059, 1,
1.033659, -0.914105, 1.7976, 1, 0, 0.9607843, 1,
1.037369, 0.8629062, -0.1768888, 1, 0, 0.9529412, 1,
1.041342, 1.06802, 1.485951, 1, 0, 0.9490196, 1,
1.043085, 1.045401, 1.981571, 1, 0, 0.9411765, 1,
1.049162, 0.02649141, 2.545977, 1, 0, 0.9372549, 1,
1.058752, 1.51511, 0.2538866, 1, 0, 0.9294118, 1,
1.059312, -0.2857018, 2.259953, 1, 0, 0.9254902, 1,
1.062148, 0.1119835, 2.987396, 1, 0, 0.9176471, 1,
1.065315, -0.7904928, 0.7827761, 1, 0, 0.9137255, 1,
1.065441, 0.4625153, -0.6251066, 1, 0, 0.9058824, 1,
1.069649, 0.3324485, -0.389957, 1, 0, 0.9019608, 1,
1.075517, -0.549718, 2.37422, 1, 0, 0.8941177, 1,
1.081308, 0.2255141, 1.429791, 1, 0, 0.8862745, 1,
1.084123, -1.61633, 1.006669, 1, 0, 0.8823529, 1,
1.084329, -0.5915028, 2.661744, 1, 0, 0.8745098, 1,
1.100057, -0.7912915, 1.676769, 1, 0, 0.8705882, 1,
1.112355, 0.7111866, 2.575089, 1, 0, 0.8627451, 1,
1.11742, 0.6950497, -0.9847025, 1, 0, 0.8588235, 1,
1.118962, 0.2423529, 2.265427, 1, 0, 0.8509804, 1,
1.119516, 1.50707, 0.03074957, 1, 0, 0.8470588, 1,
1.122057, -2.828741, 4.028253, 1, 0, 0.8392157, 1,
1.125371, -0.4866388, 1.472913, 1, 0, 0.8352941, 1,
1.126801, 0.605562, 2.088373, 1, 0, 0.827451, 1,
1.128513, 0.4601676, 1.84382, 1, 0, 0.8235294, 1,
1.130449, 0.3932992, 0.1007671, 1, 0, 0.8156863, 1,
1.130645, 0.6129661, 2.021881, 1, 0, 0.8117647, 1,
1.13108, 0.1966618, 0.05366985, 1, 0, 0.8039216, 1,
1.131318, -0.7621355, 2.784076, 1, 0, 0.7960784, 1,
1.131346, 1.028052, 0.9930478, 1, 0, 0.7921569, 1,
1.133341, -0.02293072, 0.8173903, 1, 0, 0.7843137, 1,
1.148957, 0.02083258, 0.8077465, 1, 0, 0.7803922, 1,
1.149049, -1.056967, -0.9652201, 1, 0, 0.772549, 1,
1.154579, 0.7443867, 1.077589, 1, 0, 0.7686275, 1,
1.157094, 0.1639068, 3.792551, 1, 0, 0.7607843, 1,
1.160964, 0.6329079, 1.162862, 1, 0, 0.7568628, 1,
1.172276, -0.1708547, 1.078905, 1, 0, 0.7490196, 1,
1.174451, -1.198724, 2.971901, 1, 0, 0.7450981, 1,
1.174749, -0.8897506, 1.796898, 1, 0, 0.7372549, 1,
1.174955, 0.1182996, 3.575212, 1, 0, 0.7333333, 1,
1.178325, 3.0176, -0.7026655, 1, 0, 0.7254902, 1,
1.188178, 1.574256, -0.7208949, 1, 0, 0.7215686, 1,
1.189617, 0.8457002, 1.534209, 1, 0, 0.7137255, 1,
1.189885, -0.4759315, 2.907667, 1, 0, 0.7098039, 1,
1.215404, -1.213886, 2.6886, 1, 0, 0.7019608, 1,
1.221733, 0.4265398, 0.3910448, 1, 0, 0.6941177, 1,
1.226588, -1.127427, 3.047986, 1, 0, 0.6901961, 1,
1.24264, -1.034992, 3.101113, 1, 0, 0.682353, 1,
1.243092, 1.880857, 0.9800001, 1, 0, 0.6784314, 1,
1.247837, -0.1166143, 1.992041, 1, 0, 0.6705883, 1,
1.248867, 0.2201975, 1.978026, 1, 0, 0.6666667, 1,
1.253121, -1.586595, 0.9103785, 1, 0, 0.6588235, 1,
1.255408, -0.4605196, 1.079572, 1, 0, 0.654902, 1,
1.258264, -0.7219464, 2.798759, 1, 0, 0.6470588, 1,
1.260234, 0.06487127, 3.041602, 1, 0, 0.6431373, 1,
1.2618, -1.526184, 0.7759864, 1, 0, 0.6352941, 1,
1.262769, -0.4616688, 3.089303, 1, 0, 0.6313726, 1,
1.268897, 1.987278, 0.02407368, 1, 0, 0.6235294, 1,
1.269154, 0.7848433, 0.2934194, 1, 0, 0.6196079, 1,
1.26967, 0.8382203, 2.026946, 1, 0, 0.6117647, 1,
1.278985, 0.4444642, -0.4544712, 1, 0, 0.6078432, 1,
1.291474, -0.6893991, 2.156004, 1, 0, 0.6, 1,
1.293922, 0.9338446, -0.1451827, 1, 0, 0.5921569, 1,
1.297836, -0.2985985, 0.3896236, 1, 0, 0.5882353, 1,
1.299706, 0.4621877, 1.8066, 1, 0, 0.5803922, 1,
1.30904, -0.1820657, 0.2906882, 1, 0, 0.5764706, 1,
1.319031, -1.472024, 4.102281, 1, 0, 0.5686275, 1,
1.320869, 1.361157, -1.163016, 1, 0, 0.5647059, 1,
1.321308, 0.247914, 0.7597077, 1, 0, 0.5568628, 1,
1.324552, 0.8194475, 1.289228, 1, 0, 0.5529412, 1,
1.327528, 0.5955188, 1.347839, 1, 0, 0.5450981, 1,
1.331568, 0.6871645, 1.371743, 1, 0, 0.5411765, 1,
1.346794, 0.9978002, 0.7307103, 1, 0, 0.5333334, 1,
1.348296, 0.3640748, 1.791317, 1, 0, 0.5294118, 1,
1.361253, 0.9091491, 1.285245, 1, 0, 0.5215687, 1,
1.369899, 1.91914, 1.482067, 1, 0, 0.5176471, 1,
1.371079, 1.463295, 1.543226, 1, 0, 0.509804, 1,
1.374763, -0.2058983, -0.1269331, 1, 0, 0.5058824, 1,
1.374993, 0.8517963, 1.032074, 1, 0, 0.4980392, 1,
1.376345, -0.3932894, 2.248269, 1, 0, 0.4901961, 1,
1.390312, -1.036929, 3.355613, 1, 0, 0.4862745, 1,
1.393149, -0.4634821, 0.920496, 1, 0, 0.4784314, 1,
1.3989, 1.247204, -0.09815094, 1, 0, 0.4745098, 1,
1.402831, 0.368537, 0.1481245, 1, 0, 0.4666667, 1,
1.404282, 0.5469113, 1.229225, 1, 0, 0.4627451, 1,
1.40695, 0.3890238, 0.6450105, 1, 0, 0.454902, 1,
1.408025, -0.02999119, -0.3682438, 1, 0, 0.4509804, 1,
1.416795, -1.435688, 3.284498, 1, 0, 0.4431373, 1,
1.423925, 1.109867, 0.6859864, 1, 0, 0.4392157, 1,
1.424871, 0.549226, 1.267058, 1, 0, 0.4313726, 1,
1.426301, -1.432184, 3.627299, 1, 0, 0.427451, 1,
1.442483, 1.315782, 0.4603638, 1, 0, 0.4196078, 1,
1.475071, -1.084777, 1.822373, 1, 0, 0.4156863, 1,
1.479741, -1.422157, 3.188899, 1, 0, 0.4078431, 1,
1.480686, -0.2289504, 1.585782, 1, 0, 0.4039216, 1,
1.480955, 0.2902239, 2.988311, 1, 0, 0.3960784, 1,
1.497253, -0.1598303, 2.149735, 1, 0, 0.3882353, 1,
1.517034, -0.7302435, 1.5527, 1, 0, 0.3843137, 1,
1.527231, 0.474092, 0.9525435, 1, 0, 0.3764706, 1,
1.534774, 2.01583, 0.0961583, 1, 0, 0.372549, 1,
1.539272, 0.4419158, 2.349532, 1, 0, 0.3647059, 1,
1.557808, 0.4476365, 1.523108, 1, 0, 0.3607843, 1,
1.557939, 0.04328883, 0.332068, 1, 0, 0.3529412, 1,
1.559965, 0.1025924, 2.886832, 1, 0, 0.3490196, 1,
1.561937, -1.489382, 3.521357, 1, 0, 0.3411765, 1,
1.565565, -1.007504, 2.993449, 1, 0, 0.3372549, 1,
1.583592, -1.621104, 3.438528, 1, 0, 0.3294118, 1,
1.587464, -1.263044, 3.118376, 1, 0, 0.3254902, 1,
1.594821, -0.3415574, 1.227103, 1, 0, 0.3176471, 1,
1.601185, 0.2999142, 2.831845, 1, 0, 0.3137255, 1,
1.607303, 1.108209, 0.8085197, 1, 0, 0.3058824, 1,
1.622035, -0.5686473, 2.233929, 1, 0, 0.2980392, 1,
1.653876, 1.075334, -0.03399057, 1, 0, 0.2941177, 1,
1.660131, -0.212553, 2.412586, 1, 0, 0.2862745, 1,
1.666735, -0.7397192, 2.568848, 1, 0, 0.282353, 1,
1.669373, -0.7859758, 1.7198, 1, 0, 0.2745098, 1,
1.678717, 0.3183959, 1.136301, 1, 0, 0.2705882, 1,
1.688884, -0.08903994, 0.9188681, 1, 0, 0.2627451, 1,
1.715023, -0.4934598, 1.150659, 1, 0, 0.2588235, 1,
1.715204, 0.9927204, 0.3136447, 1, 0, 0.2509804, 1,
1.725187, -1.946106, 3.597952, 1, 0, 0.2470588, 1,
1.732957, -1.610827, 1.944819, 1, 0, 0.2392157, 1,
1.733344, -0.7452624, 2.281643, 1, 0, 0.2352941, 1,
1.742513, -2.218643, 2.736219, 1, 0, 0.227451, 1,
1.745488, 1.143697, 1.864657, 1, 0, 0.2235294, 1,
1.753014, -0.6287604, 2.016421, 1, 0, 0.2156863, 1,
1.760401, -1.291708, 1.112206, 1, 0, 0.2117647, 1,
1.763552, -1.002885, 1.801538, 1, 0, 0.2039216, 1,
1.7638, 0.2087983, 0.3706178, 1, 0, 0.1960784, 1,
1.770848, 1.324687, 0.8838279, 1, 0, 0.1921569, 1,
1.846458, 0.3488188, 1.254307, 1, 0, 0.1843137, 1,
1.850708, 1.833292, -0.1620322, 1, 0, 0.1803922, 1,
1.86144, -1.053198, 3.036276, 1, 0, 0.172549, 1,
1.91436, 1.259036, 1.757072, 1, 0, 0.1686275, 1,
1.920833, 0.3851022, 0.1345253, 1, 0, 0.1607843, 1,
1.921503, 2.267575, -0.4374677, 1, 0, 0.1568628, 1,
1.931295, -0.4907337, 3.728435, 1, 0, 0.1490196, 1,
1.933224, -0.6844944, 1.650943, 1, 0, 0.145098, 1,
1.938314, -0.695646, 1.674481, 1, 0, 0.1372549, 1,
1.941182, 0.3342729, 3.146372, 1, 0, 0.1333333, 1,
1.94439, 1.643694, 0.6584904, 1, 0, 0.1254902, 1,
1.982267, 1.471689, 0.531572, 1, 0, 0.1215686, 1,
2.008525, -0.4522959, 2.112509, 1, 0, 0.1137255, 1,
2.026742, -1.584284, 2.160829, 1, 0, 0.1098039, 1,
2.039121, -0.1298956, 2.236521, 1, 0, 0.1019608, 1,
2.116818, -0.4354811, 1.764041, 1, 0, 0.09411765, 1,
2.134473, -1.120208, 0.1460172, 1, 0, 0.09019608, 1,
2.147633, 0.9207861, 1.566854, 1, 0, 0.08235294, 1,
2.191463, -1.420198, 2.277289, 1, 0, 0.07843138, 1,
2.198471, -0.5931189, 2.507514, 1, 0, 0.07058824, 1,
2.199577, 0.03174977, 0.2804112, 1, 0, 0.06666667, 1,
2.375265, 0.4828252, 2.439515, 1, 0, 0.05882353, 1,
2.377808, -0.08361074, 2.536748, 1, 0, 0.05490196, 1,
2.377906, -0.1928563, 1.756251, 1, 0, 0.04705882, 1,
2.391865, -0.7644089, 2.593639, 1, 0, 0.04313726, 1,
2.41796, 0.4581687, 3.71928, 1, 0, 0.03529412, 1,
2.459367, 1.400153, 0.07400592, 1, 0, 0.03137255, 1,
2.746462, -1.748453, 3.232478, 1, 0, 0.02352941, 1,
2.748399, 0.4743353, 0.7714395, 1, 0, 0.01960784, 1,
2.930036, -0.8395612, 1.202255, 1, 0, 0.01176471, 1,
2.930059, 1.582158, 1.060357, 1, 0, 0.007843138, 1
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
-0.0437957, -4.731463, -6.684375, 0, -0.5, 0.5, 0.5,
-0.0437957, -4.731463, -6.684375, 1, -0.5, 0.5, 0.5,
-0.0437957, -4.731463, -6.684375, 1, 1.5, 0.5, 0.5,
-0.0437957, -4.731463, -6.684375, 0, 1.5, 0.5, 0.5
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
-4.025787, -0.03454506, -6.684375, 0, -0.5, 0.5, 0.5,
-4.025787, -0.03454506, -6.684375, 1, -0.5, 0.5, 0.5,
-4.025787, -0.03454506, -6.684375, 1, 1.5, 0.5, 0.5,
-4.025787, -0.03454506, -6.684375, 0, 1.5, 0.5, 0.5
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
-4.025787, -4.731463, 0.5128837, 0, -0.5, 0.5, 0.5,
-4.025787, -4.731463, 0.5128837, 1, -0.5, 0.5, 0.5,
-4.025787, -4.731463, 0.5128837, 1, 1.5, 0.5, 0.5,
-4.025787, -4.731463, 0.5128837, 0, 1.5, 0.5, 0.5
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
-3, -3.647559, -5.023469,
2, -3.647559, -5.023469,
-3, -3.647559, -5.023469,
-3, -3.82821, -5.300287,
-2, -3.647559, -5.023469,
-2, -3.82821, -5.300287,
-1, -3.647559, -5.023469,
-1, -3.82821, -5.300287,
0, -3.647559, -5.023469,
0, -3.82821, -5.300287,
1, -3.647559, -5.023469,
1, -3.82821, -5.300287,
2, -3.647559, -5.023469,
2, -3.82821, -5.300287
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
-3, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
-3, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
-3, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
-3, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5,
-2, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
-2, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
-2, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
-2, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5,
-1, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
-1, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
-1, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
-1, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5,
0, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
0, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
0, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
0, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5,
1, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
1, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
1, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
1, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5,
2, -4.189511, -5.853922, 0, -0.5, 0.5, 0.5,
2, -4.189511, -5.853922, 1, -0.5, 0.5, 0.5,
2, -4.189511, -5.853922, 1, 1.5, 0.5, 0.5,
2, -4.189511, -5.853922, 0, 1.5, 0.5, 0.5
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
-3.106866, -2, -5.023469,
-3.106866, 2, -5.023469,
-3.106866, -2, -5.023469,
-3.26002, -2, -5.300287,
-3.106866, 0, -5.023469,
-3.26002, 0, -5.300287,
-3.106866, 2, -5.023469,
-3.26002, 2, -5.300287
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
-3.566327, -2, -5.853922, 0, -0.5, 0.5, 0.5,
-3.566327, -2, -5.853922, 1, -0.5, 0.5, 0.5,
-3.566327, -2, -5.853922, 1, 1.5, 0.5, 0.5,
-3.566327, -2, -5.853922, 0, 1.5, 0.5, 0.5,
-3.566327, 0, -5.853922, 0, -0.5, 0.5, 0.5,
-3.566327, 0, -5.853922, 1, -0.5, 0.5, 0.5,
-3.566327, 0, -5.853922, 1, 1.5, 0.5, 0.5,
-3.566327, 0, -5.853922, 0, 1.5, 0.5, 0.5,
-3.566327, 2, -5.853922, 0, -0.5, 0.5, 0.5,
-3.566327, 2, -5.853922, 1, -0.5, 0.5, 0.5,
-3.566327, 2, -5.853922, 1, 1.5, 0.5, 0.5,
-3.566327, 2, -5.853922, 0, 1.5, 0.5, 0.5
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
-3.106866, -3.647559, -4,
-3.106866, -3.647559, 4,
-3.106866, -3.647559, -4,
-3.26002, -3.82821, -4,
-3.106866, -3.647559, -2,
-3.26002, -3.82821, -2,
-3.106866, -3.647559, 0,
-3.26002, -3.82821, 0,
-3.106866, -3.647559, 2,
-3.26002, -3.82821, 2,
-3.106866, -3.647559, 4,
-3.26002, -3.82821, 4
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
-3.566327, -4.189511, -4, 0, -0.5, 0.5, 0.5,
-3.566327, -4.189511, -4, 1, -0.5, 0.5, 0.5,
-3.566327, -4.189511, -4, 1, 1.5, 0.5, 0.5,
-3.566327, -4.189511, -4, 0, 1.5, 0.5, 0.5,
-3.566327, -4.189511, -2, 0, -0.5, 0.5, 0.5,
-3.566327, -4.189511, -2, 1, -0.5, 0.5, 0.5,
-3.566327, -4.189511, -2, 1, 1.5, 0.5, 0.5,
-3.566327, -4.189511, -2, 0, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 0, 0, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 0, 1, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 0, 1, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 0, 0, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 2, 0, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 2, 1, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 2, 1, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 2, 0, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 4, 0, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 4, 1, -0.5, 0.5, 0.5,
-3.566327, -4.189511, 4, 1, 1.5, 0.5, 0.5,
-3.566327, -4.189511, 4, 0, 1.5, 0.5, 0.5
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
-3.106866, -3.647559, -5.023469,
-3.106866, 3.578469, -5.023469,
-3.106866, -3.647559, 6.049237,
-3.106866, 3.578469, 6.049237,
-3.106866, -3.647559, -5.023469,
-3.106866, -3.647559, 6.049237,
-3.106866, 3.578469, -5.023469,
-3.106866, 3.578469, 6.049237,
-3.106866, -3.647559, -5.023469,
3.019275, -3.647559, -5.023469,
-3.106866, -3.647559, 6.049237,
3.019275, -3.647559, 6.049237,
-3.106866, 3.578469, -5.023469,
3.019275, 3.578469, -5.023469,
-3.106866, 3.578469, 6.049237,
3.019275, 3.578469, 6.049237,
3.019275, -3.647559, -5.023469,
3.019275, 3.578469, -5.023469,
3.019275, -3.647559, 6.049237,
3.019275, 3.578469, 6.049237,
3.019275, -3.647559, -5.023469,
3.019275, -3.647559, 6.049237,
3.019275, 3.578469, -5.023469,
3.019275, 3.578469, 6.049237
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
var radius = 7.781288;
var distance = 34.61983;
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
mvMatrix.translate( 0.0437957, 0.03454506, -0.5128837 );
mvMatrix.scale( 1.373341, 1.164302, 0.7598216 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61983);
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
kinetin<-read.table("kinetin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-kinetin$V2
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
```

```r
y<-kinetin$V3
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
```

```r
z<-kinetin$V4
```

```
## Error in eval(expr, envir, enclos): object 'kinetin' not found
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
-3.017651, -0.1592066, -0.9521396, 0, 0, 1, 1, 1,
-2.877335, 1.207496, 0.3386727, 1, 0, 0, 1, 1,
-2.571516, 0.4849204, -1.67918, 1, 0, 0, 1, 1,
-2.469104, -3.241212, -3.222632, 1, 0, 0, 1, 1,
-2.359285, -0.4889456, -0.9108323, 1, 0, 0, 1, 1,
-2.350835, -1.071847, -1.932436, 1, 0, 0, 1, 1,
-2.344897, -1.470977, -3.385385, 0, 0, 0, 1, 1,
-2.331757, -0.3203337, -1.698571, 0, 0, 0, 1, 1,
-2.272379, -0.03422838, -2.309868, 0, 0, 0, 1, 1,
-2.265117, 1.058835, -2.405584, 0, 0, 0, 1, 1,
-2.258034, 0.06032184, -3.340141, 0, 0, 0, 1, 1,
-2.160273, -0.4727475, -3.579653, 0, 0, 0, 1, 1,
-2.154206, 1.034758, 0.1294713, 0, 0, 0, 1, 1,
-2.106702, 0.6638277, -0.5978346, 1, 1, 1, 1, 1,
-2.068906, -0.1957761, -0.4064476, 1, 1, 1, 1, 1,
-2.062247, -0.8277749, -1.575157, 1, 1, 1, 1, 1,
-2.048441, -0.5252295, -1.059668, 1, 1, 1, 1, 1,
-2.048086, -0.1381317, -0.6202049, 1, 1, 1, 1, 1,
-2.025726, 0.9100467, -1.665863, 1, 1, 1, 1, 1,
-2.017034, -0.1631062, -1.215069, 1, 1, 1, 1, 1,
-1.986407, -0.7991036, -4.582137, 1, 1, 1, 1, 1,
-1.962349, 0.4213554, 0.2412188, 1, 1, 1, 1, 1,
-1.945481, -0.04078534, -2.014724, 1, 1, 1, 1, 1,
-1.923386, -0.3681578, -1.783565, 1, 1, 1, 1, 1,
-1.886754, 0.9419414, -2.176321, 1, 1, 1, 1, 1,
-1.886738, 0.6966056, -0.2530648, 1, 1, 1, 1, 1,
-1.863517, -0.9761924, -0.9202206, 1, 1, 1, 1, 1,
-1.847922, 0.2972272, -2.508453, 1, 1, 1, 1, 1,
-1.846727, -1.450625, -2.624737, 0, 0, 1, 1, 1,
-1.841191, 0.1263982, -2.079294, 1, 0, 0, 1, 1,
-1.836157, -0.6098415, -2.695073, 1, 0, 0, 1, 1,
-1.829901, -0.2429226, -2.243197, 1, 0, 0, 1, 1,
-1.82946, 1.317794, -2.169121, 1, 0, 0, 1, 1,
-1.809087, 1.391111, -0.9234248, 1, 0, 0, 1, 1,
-1.794079, 0.3972342, -1.755459, 0, 0, 0, 1, 1,
-1.73893, 0.4007912, -2.327248, 0, 0, 0, 1, 1,
-1.714877, -0.637327, -2.106163, 0, 0, 0, 1, 1,
-1.704816, 1.89884, -2.319759, 0, 0, 0, 1, 1,
-1.696676, 0.6014315, -0.6248277, 0, 0, 0, 1, 1,
-1.681696, 0.1779722, -2.76747, 0, 0, 0, 1, 1,
-1.680028, -1.437916, -2.116951, 0, 0, 0, 1, 1,
-1.66839, 2.287912, -0.6762946, 1, 1, 1, 1, 1,
-1.663252, -0.4554183, -1.495125, 1, 1, 1, 1, 1,
-1.658089, -0.427935, -2.032231, 1, 1, 1, 1, 1,
-1.656976, 0.5753891, -2.490566, 1, 1, 1, 1, 1,
-1.625705, -1.382503, -3.814715, 1, 1, 1, 1, 1,
-1.622416, -0.8230915, -1.870646, 1, 1, 1, 1, 1,
-1.615734, 1.859148, -1.290357, 1, 1, 1, 1, 1,
-1.598, -1.515527, -3.261892, 1, 1, 1, 1, 1,
-1.587833, 0.0275828, -2.47442, 1, 1, 1, 1, 1,
-1.585318, 0.4518169, -1.000471, 1, 1, 1, 1, 1,
-1.573604, 0.1618089, -1.801654, 1, 1, 1, 1, 1,
-1.550351, 0.02333624, -2.928598, 1, 1, 1, 1, 1,
-1.532071, 0.3871633, -2.512922, 1, 1, 1, 1, 1,
-1.524654, -0.1707752, -2.411695, 1, 1, 1, 1, 1,
-1.514369, 0.0779141, -0.5279666, 1, 1, 1, 1, 1,
-1.506579, 0.3708936, -2.669272, 0, 0, 1, 1, 1,
-1.464701, 0.3608872, -0.9850781, 1, 0, 0, 1, 1,
-1.462943, -1.263627, -2.786643, 1, 0, 0, 1, 1,
-1.456531, -0.148931, -0.2783433, 1, 0, 0, 1, 1,
-1.451874, -0.601924, -1.839602, 1, 0, 0, 1, 1,
-1.45128, -0.2899517, -1.233953, 1, 0, 0, 1, 1,
-1.450894, -0.08893545, -1.60096, 0, 0, 0, 1, 1,
-1.449721, -0.03438042, -1.215552, 0, 0, 0, 1, 1,
-1.440438, 0.3289801, -1.314944, 0, 0, 0, 1, 1,
-1.434441, 1.440399, -1.034486, 0, 0, 0, 1, 1,
-1.427438, -0.09123043, -2.884855, 0, 0, 0, 1, 1,
-1.425704, -0.05645182, -1.306697, 0, 0, 0, 1, 1,
-1.402146, 0.4024664, -0.2931963, 0, 0, 0, 1, 1,
-1.397457, -0.9395606, -0.8903282, 1, 1, 1, 1, 1,
-1.395012, -1.05801, -1.456983, 1, 1, 1, 1, 1,
-1.384399, 0.0483831, -0.4256689, 1, 1, 1, 1, 1,
-1.382342, -1.017228, -1.289834, 1, 1, 1, 1, 1,
-1.377386, -0.5741385, -1.541911, 1, 1, 1, 1, 1,
-1.37639, 0.2732285, -0.8684068, 1, 1, 1, 1, 1,
-1.37538, 0.9399875, -2.747676, 1, 1, 1, 1, 1,
-1.371143, -1.973878, -1.573476, 1, 1, 1, 1, 1,
-1.355594, 0.789581, -1.574082, 1, 1, 1, 1, 1,
-1.352863, -0.68718, -1.358806, 1, 1, 1, 1, 1,
-1.348612, 0.08330558, -0.5891566, 1, 1, 1, 1, 1,
-1.338633, -0.8878025, -0.2842057, 1, 1, 1, 1, 1,
-1.321492, 0.5816525, -0.7912995, 1, 1, 1, 1, 1,
-1.319628, -1.240835, -3.568059, 1, 1, 1, 1, 1,
-1.313862, 0.6557154, -0.4573723, 1, 1, 1, 1, 1,
-1.310097, 1.226478, 1.413708, 0, 0, 1, 1, 1,
-1.305013, -0.01286481, -1.279538, 1, 0, 0, 1, 1,
-1.294807, 1.596003, -0.9916534, 1, 0, 0, 1, 1,
-1.281532, 0.05581003, -1.647754, 1, 0, 0, 1, 1,
-1.27783, -1.364282, -2.277852, 1, 0, 0, 1, 1,
-1.271541, -2.356597, -3.572674, 1, 0, 0, 1, 1,
-1.260591, 0.4206682, -0.9836568, 0, 0, 0, 1, 1,
-1.257959, -0.03726767, -1.020401, 0, 0, 0, 1, 1,
-1.253556, 0.7134379, 0.6252031, 0, 0, 0, 1, 1,
-1.238929, 0.4156305, -1.713445, 0, 0, 0, 1, 1,
-1.238065, 0.1630085, -1.15504, 0, 0, 0, 1, 1,
-1.236418, -0.7803683, -0.5469444, 0, 0, 0, 1, 1,
-1.233598, -0.6819641, -2.977724, 0, 0, 0, 1, 1,
-1.231498, -2.311268, -2.412181, 1, 1, 1, 1, 1,
-1.227819, -0.7763789, -1.79326, 1, 1, 1, 1, 1,
-1.221148, -0.1119437, -2.674711, 1, 1, 1, 1, 1,
-1.219319, 0.831191, -1.552325, 1, 1, 1, 1, 1,
-1.211185, -1.173326, -2.490686, 1, 1, 1, 1, 1,
-1.20354, 0.8435825, 0.09741659, 1, 1, 1, 1, 1,
-1.200528, -0.3588172, -2.260954, 1, 1, 1, 1, 1,
-1.199299, 0.194733, -0.3050804, 1, 1, 1, 1, 1,
-1.19814, -0.1329907, -1.596282, 1, 1, 1, 1, 1,
-1.197062, -0.5111311, -0.4216039, 1, 1, 1, 1, 1,
-1.180937, -0.05305118, -1.54928, 1, 1, 1, 1, 1,
-1.179615, 0.5010181, 0.09822072, 1, 1, 1, 1, 1,
-1.17683, -1.087265, -2.193114, 1, 1, 1, 1, 1,
-1.172515, 1.115186, -0.8459574, 1, 1, 1, 1, 1,
-1.158254, -1.110433, -2.587374, 1, 1, 1, 1, 1,
-1.137313, -0.7429605, -0.4819643, 0, 0, 1, 1, 1,
-1.134812, -0.3086447, -1.098465, 1, 0, 0, 1, 1,
-1.134046, -0.01373698, -0.7974145, 1, 0, 0, 1, 1,
-1.131268, -0.437792, -1.861677, 1, 0, 0, 1, 1,
-1.127299, 0.8359905, -0.2902564, 1, 0, 0, 1, 1,
-1.125302, 0.311684, -1.355942, 1, 0, 0, 1, 1,
-1.123775, 0.5103071, -1.058397, 0, 0, 0, 1, 1,
-1.115118, 0.8187193, -1.337429, 0, 0, 0, 1, 1,
-1.109994, -1.285254, -1.81817, 0, 0, 0, 1, 1,
-1.10634, -0.4404121, 0.6367991, 0, 0, 0, 1, 1,
-1.101963, 0.5320862, -0.4923232, 0, 0, 0, 1, 1,
-1.101343, 1.656958, 1.830783, 0, 0, 0, 1, 1,
-1.098793, 0.362862, -1.191577, 0, 0, 0, 1, 1,
-1.091425, -0.4288742, -4.065408, 1, 1, 1, 1, 1,
-1.088891, 0.7894027, -1.323344, 1, 1, 1, 1, 1,
-1.086291, -2.176641, -2.788368, 1, 1, 1, 1, 1,
-1.072826, 0.04972898, 0.0407451, 1, 1, 1, 1, 1,
-1.068834, 1.173012, -2.399984, 1, 1, 1, 1, 1,
-1.068668, 0.8344232, -2.549277, 1, 1, 1, 1, 1,
-1.065311, 1.249647, 0.359476, 1, 1, 1, 1, 1,
-1.064938, 1.912993, -0.3259103, 1, 1, 1, 1, 1,
-1.05636, -0.4184071, -0.7939505, 1, 1, 1, 1, 1,
-1.05623, 1.066892, 0.09612056, 1, 1, 1, 1, 1,
-1.055715, -0.6086055, -2.448326, 1, 1, 1, 1, 1,
-1.05312, -0.4452035, -2.610734, 1, 1, 1, 1, 1,
-1.052355, -1.088098, -3.124927, 1, 1, 1, 1, 1,
-1.050551, 0.2834696, -1.429874, 1, 1, 1, 1, 1,
-1.048751, -1.164354, -3.505394, 1, 1, 1, 1, 1,
-1.046053, 0.4775358, 1.705068, 0, 0, 1, 1, 1,
-1.03491, 1.413633, -0.6916227, 1, 0, 0, 1, 1,
-1.026126, 0.7505201, -1.676868, 1, 0, 0, 1, 1,
-1.022102, 0.3909308, -0.3232634, 1, 0, 0, 1, 1,
-1.018996, -0.1307273, -2.093084, 1, 0, 0, 1, 1,
-1.016563, -0.6196814, -3.287472, 1, 0, 0, 1, 1,
-1.011571, 0.4012311, -0.9632154, 0, 0, 0, 1, 1,
-1.008559, -0.4826216, -1.723865, 0, 0, 0, 1, 1,
-0.9976759, 2.056072, -1.474465, 0, 0, 0, 1, 1,
-0.9947734, 0.4308305, -1.451127, 0, 0, 0, 1, 1,
-0.9882978, -0.4326855, 0.4120565, 0, 0, 0, 1, 1,
-0.9877607, 1.076925, -3.041491, 0, 0, 0, 1, 1,
-0.9860259, 0.2283795, -1.650516, 0, 0, 0, 1, 1,
-0.9855605, 1.772583, -0.1120414, 1, 1, 1, 1, 1,
-0.9804351, -1.043351, -1.596968, 1, 1, 1, 1, 1,
-0.9788635, 0.7788187, -3.166507, 1, 1, 1, 1, 1,
-0.9721658, -0.04585922, -2.882215, 1, 1, 1, 1, 1,
-0.9719048, 1.169929, -1.081079, 1, 1, 1, 1, 1,
-0.9713718, 0.7575898, -2.069915, 1, 1, 1, 1, 1,
-0.9702232, -0.1951751, -2.50356, 1, 1, 1, 1, 1,
-0.966193, 0.8268983, -1.082527, 1, 1, 1, 1, 1,
-0.9525982, -0.0571779, -3.225578, 1, 1, 1, 1, 1,
-0.9518383, 0.4981575, -0.6548929, 1, 1, 1, 1, 1,
-0.9458848, -0.2608352, -1.093319, 1, 1, 1, 1, 1,
-0.9379231, 0.06128801, -0.7839187, 1, 1, 1, 1, 1,
-0.9350354, 0.5063275, -2.801286, 1, 1, 1, 1, 1,
-0.9340394, -0.2935377, -1.116405, 1, 1, 1, 1, 1,
-0.9300469, 2.047341, -1.425433, 1, 1, 1, 1, 1,
-0.920469, -0.6664543, -2.337554, 0, 0, 1, 1, 1,
-0.9116772, 0.5034494, -1.871606, 1, 0, 0, 1, 1,
-0.9095181, -0.5230805, -2.240151, 1, 0, 0, 1, 1,
-0.9081847, -0.3093379, -2.435999, 1, 0, 0, 1, 1,
-0.9078406, 2.001137, -1.396696, 1, 0, 0, 1, 1,
-0.8956249, -0.08594017, -2.134356, 1, 0, 0, 1, 1,
-0.8949294, -1.437966, -3.608821, 0, 0, 0, 1, 1,
-0.8888337, 1.183019, -0.1401624, 0, 0, 0, 1, 1,
-0.8879324, -0.5857759, -0.3024111, 0, 0, 0, 1, 1,
-0.8877587, -0.8325707, -3.986837, 0, 0, 0, 1, 1,
-0.8740599, -0.5149688, -2.525468, 0, 0, 0, 1, 1,
-0.8710458, 2.097224, -0.782343, 0, 0, 0, 1, 1,
-0.8705, -1.249498, -3.75234, 0, 0, 0, 1, 1,
-0.8695229, -1.120452, -1.69401, 1, 1, 1, 1, 1,
-0.8608057, -1.11206, -3.134464, 1, 1, 1, 1, 1,
-0.8527919, 0.5678561, 0.8258899, 1, 1, 1, 1, 1,
-0.8499857, -0.7400852, -2.354337, 1, 1, 1, 1, 1,
-0.8481574, -1.081358, -3.174042, 1, 1, 1, 1, 1,
-0.8450589, -0.6257191, 0.03854147, 1, 1, 1, 1, 1,
-0.845048, -1.267855, -2.724618, 1, 1, 1, 1, 1,
-0.8423656, 0.5545813, -1.728601, 1, 1, 1, 1, 1,
-0.8377358, -2.554186, -0.6632717, 1, 1, 1, 1, 1,
-0.8288736, -1.605457, -1.833356, 1, 1, 1, 1, 1,
-0.8254332, -0.1526851, -0.1226922, 1, 1, 1, 1, 1,
-0.8210889, -0.8085868, -1.770167, 1, 1, 1, 1, 1,
-0.8207243, -1.711713, -2.962945, 1, 1, 1, 1, 1,
-0.8155167, -0.200248, -1.928935, 1, 1, 1, 1, 1,
-0.8109012, 0.5154955, -0.9834127, 1, 1, 1, 1, 1,
-0.8064802, 0.3450529, -0.6910666, 0, 0, 1, 1, 1,
-0.8021226, 0.1808277, -1.653203, 1, 0, 0, 1, 1,
-0.8016902, 0.910791, 0.5711666, 1, 0, 0, 1, 1,
-0.8012358, -0.3957461, -1.456733, 1, 0, 0, 1, 1,
-0.8000312, 1.347885, -2.455089, 1, 0, 0, 1, 1,
-0.7984819, 0.4422843, -0.01234465, 1, 0, 0, 1, 1,
-0.796186, 0.48381, -1.095038, 0, 0, 0, 1, 1,
-0.7866651, 1.147007, -0.4031918, 0, 0, 0, 1, 1,
-0.7832786, 1.234498, 0.9954731, 0, 0, 0, 1, 1,
-0.783272, 0.1136395, -1.634904, 0, 0, 0, 1, 1,
-0.7780236, -0.5290885, -2.0275, 0, 0, 0, 1, 1,
-0.7720728, -0.08580198, -1.852832, 0, 0, 0, 1, 1,
-0.7707167, 1.231647, -0.306019, 0, 0, 0, 1, 1,
-0.7684335, 0.3774562, -1.208752, 1, 1, 1, 1, 1,
-0.7643537, 0.02626912, 0.8976781, 1, 1, 1, 1, 1,
-0.7603642, 2.437555, -2.495312, 1, 1, 1, 1, 1,
-0.7575395, -1.255478, -3.559313, 1, 1, 1, 1, 1,
-0.7552568, 0.6448247, -2.493957, 1, 1, 1, 1, 1,
-0.7504178, 0.9819663, -1.433978, 1, 1, 1, 1, 1,
-0.7485765, -1.521251, -1.001041, 1, 1, 1, 1, 1,
-0.7391827, 0.1984925, -1.698892, 1, 1, 1, 1, 1,
-0.7374952, 1.236138, 0.9755183, 1, 1, 1, 1, 1,
-0.733576, -1.10307, -3.390131, 1, 1, 1, 1, 1,
-0.7326465, 0.437274, -0.4920675, 1, 1, 1, 1, 1,
-0.7305126, -1.264722, -4.862216, 1, 1, 1, 1, 1,
-0.7207136, -0.7265527, -2.894119, 1, 1, 1, 1, 1,
-0.7199475, -0.930925, -2.00894, 1, 1, 1, 1, 1,
-0.7160556, -1.427709, -2.538086, 1, 1, 1, 1, 1,
-0.7153518, 2.147619, -0.4805572, 0, 0, 1, 1, 1,
-0.7097676, -0.3132728, 1.415205, 1, 0, 0, 1, 1,
-0.7077526, 0.4925258, -1.199721, 1, 0, 0, 1, 1,
-0.7014756, -0.5483609, -3.253153, 1, 0, 0, 1, 1,
-0.7013843, 0.7444903, -1.666966, 1, 0, 0, 1, 1,
-0.6971977, 1.578927, -0.838347, 1, 0, 0, 1, 1,
-0.6910662, -1.385056, -3.377933, 0, 0, 0, 1, 1,
-0.6908939, 0.082576, 1.07146, 0, 0, 0, 1, 1,
-0.6901445, 0.8163553, -1.156582, 0, 0, 0, 1, 1,
-0.682604, 0.8170189, -0.565176, 0, 0, 0, 1, 1,
-0.6820687, 0.4395543, -0.5828851, 0, 0, 0, 1, 1,
-0.6769093, 0.03307161, -2.654156, 0, 0, 0, 1, 1,
-0.6686905, -1.579949, -3.034543, 0, 0, 0, 1, 1,
-0.665656, -0.7841856, -2.897459, 1, 1, 1, 1, 1,
-0.6549601, -0.8542053, -3.858987, 1, 1, 1, 1, 1,
-0.6499725, 0.2621756, -1.920983, 1, 1, 1, 1, 1,
-0.6495371, 0.5796687, -0.3068091, 1, 1, 1, 1, 1,
-0.6455635, 0.1291317, -2.70007, 1, 1, 1, 1, 1,
-0.6447764, -1.257923, -2.618938, 1, 1, 1, 1, 1,
-0.643829, -0.6206832, -3.151459, 1, 1, 1, 1, 1,
-0.6418633, 0.7622435, 0.7411094, 1, 1, 1, 1, 1,
-0.6409829, 0.4860565, -0.1466496, 1, 1, 1, 1, 1,
-0.6386594, 1.6526, -0.278496, 1, 1, 1, 1, 1,
-0.6383188, -2.115439, -4.486077, 1, 1, 1, 1, 1,
-0.6321584, 1.173364, -0.879641, 1, 1, 1, 1, 1,
-0.6302041, 2.103637, 0.4380898, 1, 1, 1, 1, 1,
-0.6280885, 1.066834, 1.692009, 1, 1, 1, 1, 1,
-0.6261702, 0.8375875, -0.05182354, 1, 1, 1, 1, 1,
-0.6245959, 0.07504676, -2.284439, 0, 0, 1, 1, 1,
-0.624441, -1.261844, -2.190823, 1, 0, 0, 1, 1,
-0.6224014, -0.4392389, -1.906547, 1, 0, 0, 1, 1,
-0.6116242, 1.207883, -0.2259057, 1, 0, 0, 1, 1,
-0.6112791, -1.122644, -2.822036, 1, 0, 0, 1, 1,
-0.6075835, -0.694179, -1.641953, 1, 0, 0, 1, 1,
-0.6048336, -0.618406, -2.269433, 0, 0, 0, 1, 1,
-0.5979462, -1.256349, -1.362575, 0, 0, 0, 1, 1,
-0.5951827, 1.518216, 0.004934771, 0, 0, 0, 1, 1,
-0.5938628, -0.08028626, -1.687849, 0, 0, 0, 1, 1,
-0.5910075, -0.3696402, -3.465919, 0, 0, 0, 1, 1,
-0.579851, -0.04242971, -1.349248, 0, 0, 0, 1, 1,
-0.5723652, 1.774152, -1.53132, 0, 0, 0, 1, 1,
-0.5655544, 1.420867, -0.6935061, 1, 1, 1, 1, 1,
-0.5636123, 0.08070382, -0.6417031, 1, 1, 1, 1, 1,
-0.562932, 1.964032, -2.514006, 1, 1, 1, 1, 1,
-0.5589066, 0.1130108, -0.1216752, 1, 1, 1, 1, 1,
-0.553901, -0.6093812, -2.613702, 1, 1, 1, 1, 1,
-0.5538672, 1.046691, 0.4409328, 1, 1, 1, 1, 1,
-0.5491614, -0.6186496, -3.264265, 1, 1, 1, 1, 1,
-0.5464952, 0.8751931, -0.2952718, 1, 1, 1, 1, 1,
-0.5456546, 0.5327959, -1.403663, 1, 1, 1, 1, 1,
-0.5440322, 0.8128194, 0.1645913, 1, 1, 1, 1, 1,
-0.5409601, 0.4560658, 0.1777824, 1, 1, 1, 1, 1,
-0.5406603, 0.6345785, -2.040308, 1, 1, 1, 1, 1,
-0.5390774, 1.175715, -0.3486596, 1, 1, 1, 1, 1,
-0.5334266, -1.690751, -4.267837, 1, 1, 1, 1, 1,
-0.5297098, -0.7718341, -0.6826088, 1, 1, 1, 1, 1,
-0.5296857, -0.0698765, -1.964812, 0, 0, 1, 1, 1,
-0.5291929, 0.3700591, -1.139813, 1, 0, 0, 1, 1,
-0.528092, -0.06128023, -1.882694, 1, 0, 0, 1, 1,
-0.5188577, -0.6815402, -3.176825, 1, 0, 0, 1, 1,
-0.5185794, -0.4790609, -2.125228, 1, 0, 0, 1, 1,
-0.5170489, -0.3501365, -4.520439, 1, 0, 0, 1, 1,
-0.5121595, 0.1625494, -2.222768, 0, 0, 0, 1, 1,
-0.5117028, 0.7511821, -2.003132, 0, 0, 0, 1, 1,
-0.5108197, 0.9895914, -2.042721, 0, 0, 0, 1, 1,
-0.5097917, -1.248434, -3.605557, 0, 0, 0, 1, 1,
-0.5065413, 0.2633696, -2.3341, 0, 0, 0, 1, 1,
-0.5033193, 0.8887072, -0.9041183, 0, 0, 0, 1, 1,
-0.5014187, -0.7848328, -2.575257, 0, 0, 0, 1, 1,
-0.4990722, 0.5985171, -1.456726, 1, 1, 1, 1, 1,
-0.4944316, -0.3745845, -0.9190872, 1, 1, 1, 1, 1,
-0.4920547, -0.805056, -3.331023, 1, 1, 1, 1, 1,
-0.4916101, 0.5727214, -1.035311, 1, 1, 1, 1, 1,
-0.4913325, 1.025985, -2.125038, 1, 1, 1, 1, 1,
-0.4912245, -1.114741, -0.3692685, 1, 1, 1, 1, 1,
-0.4912019, -1.230002, -3.827506, 1, 1, 1, 1, 1,
-0.4896418, -1.349166, -2.480322, 1, 1, 1, 1, 1,
-0.4883797, -0.0775511, -1.724028, 1, 1, 1, 1, 1,
-0.4850005, 0.8066572, 1.241036, 1, 1, 1, 1, 1,
-0.4842907, 0.9353495, -2.090308, 1, 1, 1, 1, 1,
-0.4817101, 1.143391, -0.4394818, 1, 1, 1, 1, 1,
-0.4781358, -0.6147339, -1.666214, 1, 1, 1, 1, 1,
-0.4764956, 0.8584971, -1.214761, 1, 1, 1, 1, 1,
-0.4763826, 1.239911, -1.680098, 1, 1, 1, 1, 1,
-0.4752147, -2.192914, -2.919963, 0, 0, 1, 1, 1,
-0.4743124, -0.7794374, -1.068804, 1, 0, 0, 1, 1,
-0.473204, -0.5757593, -2.072761, 1, 0, 0, 1, 1,
-0.4670192, 0.1822907, -0.9921823, 1, 0, 0, 1, 1,
-0.4565006, -2.108771, -3.945157, 1, 0, 0, 1, 1,
-0.4561155, 0.3307161, -1.026384, 1, 0, 0, 1, 1,
-0.4557843, -1.435254, -2.756857, 0, 0, 0, 1, 1,
-0.4522109, -0.1381474, 0.534506, 0, 0, 0, 1, 1,
-0.4496509, 0.4743337, -0.3802733, 0, 0, 0, 1, 1,
-0.4450366, -1.174411, -1.854996, 0, 0, 0, 1, 1,
-0.4434009, -0.3119986, -3.081059, 0, 0, 0, 1, 1,
-0.4427617, 0.2798741, -0.9833454, 0, 0, 0, 1, 1,
-0.4425146, -0.3572768, -3.741642, 0, 0, 0, 1, 1,
-0.4416294, 1.176853, -1.880173, 1, 1, 1, 1, 1,
-0.4400205, 0.1972831, -0.3639607, 1, 1, 1, 1, 1,
-0.4397011, -0.5283208, -3.068002, 1, 1, 1, 1, 1,
-0.4395528, 0.6759945, -0.5331501, 1, 1, 1, 1, 1,
-0.4382558, -1.427032, -1.331661, 1, 1, 1, 1, 1,
-0.4376407, -0.1183419, -0.3415301, 1, 1, 1, 1, 1,
-0.4371692, -0.8472821, -2.183856, 1, 1, 1, 1, 1,
-0.4360311, 0.8962376, 1.205312, 1, 1, 1, 1, 1,
-0.435581, -1.2138, -2.362118, 1, 1, 1, 1, 1,
-0.4348647, -0.1536214, -2.182664, 1, 1, 1, 1, 1,
-0.4272967, -0.2330458, -1.271381, 1, 1, 1, 1, 1,
-0.4191062, -0.606176, -0.8643025, 1, 1, 1, 1, 1,
-0.415406, 0.5765929, -1.378011, 1, 1, 1, 1, 1,
-0.4112382, 0.1508571, -0.074655, 1, 1, 1, 1, 1,
-0.408944, -0.01380881, -1.246021, 1, 1, 1, 1, 1,
-0.4052746, -1.266513, -4.812261, 0, 0, 1, 1, 1,
-0.4049838, 1.459898, 1.181857, 1, 0, 0, 1, 1,
-0.404136, 0.2526575, -4.104985, 1, 0, 0, 1, 1,
-0.4006211, 0.2934116, -2.525445, 1, 0, 0, 1, 1,
-0.3970411, 0.4443128, -0.7974271, 1, 0, 0, 1, 1,
-0.3930626, -0.6321945, -0.9788272, 1, 0, 0, 1, 1,
-0.3904097, -0.7670619, -3.206787, 0, 0, 0, 1, 1,
-0.3862061, -0.1145656, -1.022814, 0, 0, 0, 1, 1,
-0.3858001, -1.079279, -2.560871, 0, 0, 0, 1, 1,
-0.3855097, -0.9267279, -3.160447, 0, 0, 0, 1, 1,
-0.3844721, -0.8363279, -1.900943, 0, 0, 0, 1, 1,
-0.3820975, 0.1792877, -1.214625, 0, 0, 0, 1, 1,
-0.3745154, 0.848569, -0.546913, 0, 0, 0, 1, 1,
-0.3673887, 0.6300007, 1.06502, 1, 1, 1, 1, 1,
-0.3671876, 0.1195289, -0.8859677, 1, 1, 1, 1, 1,
-0.3650415, 0.291126, -0.05535819, 1, 1, 1, 1, 1,
-0.3623385, -1.679463, -4.217638, 1, 1, 1, 1, 1,
-0.3590687, -0.2641917, -1.159158, 1, 1, 1, 1, 1,
-0.3587724, -1.841433, -3.253887, 1, 1, 1, 1, 1,
-0.3571082, 0.3723121, -1.847588, 1, 1, 1, 1, 1,
-0.3564981, 0.7842215, -0.4503446, 1, 1, 1, 1, 1,
-0.3564868, -1.074003, -1.962888, 1, 1, 1, 1, 1,
-0.3564146, -1.657203, -3.663869, 1, 1, 1, 1, 1,
-0.3555129, 0.372113, -1.911262, 1, 1, 1, 1, 1,
-0.3487917, -0.8181189, -2.085683, 1, 1, 1, 1, 1,
-0.3472067, 2.541052, -1.757919, 1, 1, 1, 1, 1,
-0.3408966, -0.766124, -3.733549, 1, 1, 1, 1, 1,
-0.3329677, -0.7797607, -2.899123, 1, 1, 1, 1, 1,
-0.3318687, 1.121276, 0.2654216, 0, 0, 1, 1, 1,
-0.3303685, -0.404177, -2.809626, 1, 0, 0, 1, 1,
-0.3286897, 0.7954758, 0.05539306, 1, 0, 0, 1, 1,
-0.3279359, 1.099862, 0.476163, 1, 0, 0, 1, 1,
-0.3236289, 0.4859551, -1.943708, 1, 0, 0, 1, 1,
-0.3227344, -0.2335387, -2.716722, 1, 0, 0, 1, 1,
-0.3194353, -0.2363817, -2.054056, 0, 0, 0, 1, 1,
-0.3073911, 0.1301354, 0.07163615, 0, 0, 0, 1, 1,
-0.305306, 1.632042, -0.381248, 0, 0, 0, 1, 1,
-0.3049208, -0.3034087, -3.970591, 0, 0, 0, 1, 1,
-0.3044896, 0.5308923, 0.04217165, 0, 0, 0, 1, 1,
-0.304153, -0.4123278, -2.559287, 0, 0, 0, 1, 1,
-0.3021981, -0.8172147, -0.329753, 0, 0, 0, 1, 1,
-0.3018991, 1.145873, 1.102043, 1, 1, 1, 1, 1,
-0.2972277, -0.67554, -2.35826, 1, 1, 1, 1, 1,
-0.2967528, -1.398114, -4.826017, 1, 1, 1, 1, 1,
-0.2966979, -0.27239, -2.203443, 1, 1, 1, 1, 1,
-0.2962977, -1.476289, -2.908116, 1, 1, 1, 1, 1,
-0.2960983, 0.936007, 0.7937903, 1, 1, 1, 1, 1,
-0.2946358, -1.783387, -3.020974, 1, 1, 1, 1, 1,
-0.293835, 0.3083363, 0.1280584, 1, 1, 1, 1, 1,
-0.2852466, -0.4135648, -2.633398, 1, 1, 1, 1, 1,
-0.2842104, -1.259594, -1.822665, 1, 1, 1, 1, 1,
-0.2812337, -1.483877, -3.364678, 1, 1, 1, 1, 1,
-0.2789696, 0.2982531, -1.258283, 1, 1, 1, 1, 1,
-0.2779939, -0.2573167, -3.992528, 1, 1, 1, 1, 1,
-0.2766442, -0.1462563, -2.570628, 1, 1, 1, 1, 1,
-0.2761188, 0.6456432, -0.02061523, 1, 1, 1, 1, 1,
-0.275556, -3.163053, -2.568682, 0, 0, 1, 1, 1,
-0.2718355, -0.8603438, -3.358225, 1, 0, 0, 1, 1,
-0.2678599, 0.8182874, 0.5875107, 1, 0, 0, 1, 1,
-0.2671628, -0.1902816, -2.37937, 1, 0, 0, 1, 1,
-0.2651139, -0.4730795, -1.414856, 1, 0, 0, 1, 1,
-0.2639472, 0.7961254, -0.2421859, 1, 0, 0, 1, 1,
-0.2623607, 0.265363, 0.07876045, 0, 0, 0, 1, 1,
-0.260749, 1.325567, 2.245869, 0, 0, 0, 1, 1,
-0.2577439, -0.7958789, -2.730329, 0, 0, 0, 1, 1,
-0.2456035, 1.771594, 0.9669396, 0, 0, 0, 1, 1,
-0.2429597, -1.271676, -1.999056, 0, 0, 0, 1, 1,
-0.238834, 0.9069875, 0.4121966, 0, 0, 0, 1, 1,
-0.238235, -1.745694, -2.037613, 0, 0, 0, 1, 1,
-0.2373854, 1.518497, -1.621762, 1, 1, 1, 1, 1,
-0.2369287, 0.3513714, -0.5955024, 1, 1, 1, 1, 1,
-0.2339969, -1.211874, -3.699877, 1, 1, 1, 1, 1,
-0.2294883, 0.7035044, 0.2655056, 1, 1, 1, 1, 1,
-0.2286879, 0.7870679, -0.435101, 1, 1, 1, 1, 1,
-0.2200757, -0.7697869, -3.19051, 1, 1, 1, 1, 1,
-0.2194347, -2.685831, -1.037489, 1, 1, 1, 1, 1,
-0.2185817, 0.3900893, -2.855929, 1, 1, 1, 1, 1,
-0.2162182, 1.031419, -0.6366497, 1, 1, 1, 1, 1,
-0.2159182, 0.3754737, 0.7219194, 1, 1, 1, 1, 1,
-0.215695, -0.3045647, -1.523774, 1, 1, 1, 1, 1,
-0.2129674, 1.203071, -0.1462653, 1, 1, 1, 1, 1,
-0.2082752, -1.353085, -2.586509, 1, 1, 1, 1, 1,
-0.2067098, 0.9820206, -1.056409, 1, 1, 1, 1, 1,
-0.1980755, -1.135476, -3.423595, 1, 1, 1, 1, 1,
-0.1979216, -0.3693722, -2.862799, 0, 0, 1, 1, 1,
-0.1958371, 1.195494, -0.06924073, 1, 0, 0, 1, 1,
-0.1931406, 2.162303, -1.332403, 1, 0, 0, 1, 1,
-0.1863365, -1.564226, -2.858498, 1, 0, 0, 1, 1,
-0.1854491, 1.251986, 0.2419942, 1, 0, 0, 1, 1,
-0.1852661, -1.13839, -2.694537, 1, 0, 0, 1, 1,
-0.1835407, -0.8232716, -3.272369, 0, 0, 0, 1, 1,
-0.1833107, -1.594432, -3.071745, 0, 0, 0, 1, 1,
-0.1788308, -0.6669677, -3.978675, 0, 0, 0, 1, 1,
-0.1760941, 0.07298977, -1.750313, 0, 0, 0, 1, 1,
-0.1724951, -0.1643291, -3.502595, 0, 0, 0, 1, 1,
-0.171376, -0.07517126, -2.644427, 0, 0, 0, 1, 1,
-0.166692, -0.8385373, -3.616142, 0, 0, 0, 1, 1,
-0.1654656, -0.6662504, -2.129421, 1, 1, 1, 1, 1,
-0.1645381, 0.9896, 0.8416708, 1, 1, 1, 1, 1,
-0.1643696, -1.07874, -3.077025, 1, 1, 1, 1, 1,
-0.1604469, -0.932161, -3.268693, 1, 1, 1, 1, 1,
-0.1519373, -1.958563, -3.402868, 1, 1, 1, 1, 1,
-0.1512153, 0.0727667, -0.1293726, 1, 1, 1, 1, 1,
-0.1491463, -1.01835, -3.140103, 1, 1, 1, 1, 1,
-0.1473178, -0.570174, -2.570627, 1, 1, 1, 1, 1,
-0.147124, -1.102539, -1.567811, 1, 1, 1, 1, 1,
-0.1468382, 1.042239, -1.967625, 1, 1, 1, 1, 1,
-0.144934, 0.2458438, -1.118829, 1, 1, 1, 1, 1,
-0.1381684, 0.1974829, 1.996688, 1, 1, 1, 1, 1,
-0.1377961, 0.5248403, 0.4971881, 1, 1, 1, 1, 1,
-0.1353365, -1.06467, -2.71299, 1, 1, 1, 1, 1,
-0.1348044, 0.05661068, -0.4350912, 1, 1, 1, 1, 1,
-0.1347107, -0.2683229, -1.948736, 0, 0, 1, 1, 1,
-0.1340363, -0.174037, -3.787275, 1, 0, 0, 1, 1,
-0.1305756, 0.1566305, 1.118221, 1, 0, 0, 1, 1,
-0.1268894, -1.36774, -1.458388, 1, 0, 0, 1, 1,
-0.1268444, -2.15399, -3.807086, 1, 0, 0, 1, 1,
-0.1221566, -1.374411, -3.744009, 1, 0, 0, 1, 1,
-0.1209276, 1.41305, 0.5492853, 0, 0, 0, 1, 1,
-0.1199693, 0.813324, 0.4500995, 0, 0, 0, 1, 1,
-0.1135028, -0.3904084, -3.199863, 0, 0, 0, 1, 1,
-0.1125721, -0.2548638, -2.447355, 0, 0, 0, 1, 1,
-0.1080001, 2.097324, -0.9018726, 0, 0, 0, 1, 1,
-0.107145, 0.4711384, 1.817383, 0, 0, 0, 1, 1,
-0.1054533, 0.8070507, -1.824325, 0, 0, 0, 1, 1,
-0.1042481, -0.5775653, -3.444008, 1, 1, 1, 1, 1,
-0.1018731, -0.3882276, -3.216698, 1, 1, 1, 1, 1,
-0.1001215, 0.870935, -1.189222, 1, 1, 1, 1, 1,
-0.09681787, 0.08405615, -1.126867, 1, 1, 1, 1, 1,
-0.09239251, -0.08371342, -2.560101, 1, 1, 1, 1, 1,
-0.08662934, 0.8309333, 0.06562168, 1, 1, 1, 1, 1,
-0.08502451, 0.1877326, -1.572237, 1, 1, 1, 1, 1,
-0.0840815, 0.9089885, -2.305078, 1, 1, 1, 1, 1,
-0.08256953, 0.8570824, 0.4554874, 1, 1, 1, 1, 1,
-0.07669529, 0.5793253, 0.9443831, 1, 1, 1, 1, 1,
-0.07425075, -1.886717, -3.80435, 1, 1, 1, 1, 1,
-0.07410733, -0.1753335, -3.451337, 1, 1, 1, 1, 1,
-0.07343698, 2.278724, -0.04276284, 1, 1, 1, 1, 1,
-0.06940228, 1.382087, -0.4898393, 1, 1, 1, 1, 1,
-0.06357756, 1.308383, 0.9537277, 1, 1, 1, 1, 1,
-0.06151752, -0.2940018, -1.941698, 0, 0, 1, 1, 1,
-0.05842634, 1.164798, -0.5805486, 1, 0, 0, 1, 1,
-0.05723407, -0.1728065, -1.444787, 1, 0, 0, 1, 1,
-0.05703539, 0.2245958, -0.7357761, 1, 0, 0, 1, 1,
-0.05569733, -0.112913, -2.064027, 1, 0, 0, 1, 1,
-0.05137191, 0.5893298, 0.2360616, 1, 0, 0, 1, 1,
-0.05037872, 0.2414397, -0.8660259, 0, 0, 0, 1, 1,
-0.05029711, 0.00217474, -3.059647, 0, 0, 0, 1, 1,
-0.04498132, 1.551534, -1.146077, 0, 0, 0, 1, 1,
-0.0425837, 0.8139563, 0.3414758, 0, 0, 0, 1, 1,
-0.04182212, -0.4551676, -3.338161, 0, 0, 0, 1, 1,
-0.04057434, 0.4248865, 0.06810966, 0, 0, 0, 1, 1,
-0.04037284, 0.6034561, -0.7923676, 0, 0, 0, 1, 1,
-0.04030848, 0.348492, 0.1910499, 1, 1, 1, 1, 1,
-0.03728148, -0.04572241, -3.581142, 1, 1, 1, 1, 1,
-0.03474184, 1.587178, -1.179196, 1, 1, 1, 1, 1,
-0.02135016, -0.4227728, -2.387866, 1, 1, 1, 1, 1,
-0.01922495, 0.9429263, -0.3203254, 1, 1, 1, 1, 1,
-0.01723164, -0.9946716, -3.331283, 1, 1, 1, 1, 1,
-0.01554109, 0.02501402, 0.5041999, 1, 1, 1, 1, 1,
-0.01300701, 0.00619415, -0.1613597, 1, 1, 1, 1, 1,
-0.01288357, 0.6098342, 1.882802, 1, 1, 1, 1, 1,
-0.0101242, 0.4420159, -2.043674, 1, 1, 1, 1, 1,
-0.006073369, 1.72476, 0.1955784, 1, 1, 1, 1, 1,
-0.0009576534, -1.354451, -1.701871, 1, 1, 1, 1, 1,
0.001757226, -1.01701, 4.076933, 1, 1, 1, 1, 1,
0.003697478, -2.037657, 3.976938, 1, 1, 1, 1, 1,
0.004144719, 0.8417348, -0.9127031, 1, 1, 1, 1, 1,
0.008999403, 0.0492822, -0.694394, 0, 0, 1, 1, 1,
0.01007113, -0.1713488, 2.424854, 1, 0, 0, 1, 1,
0.01095833, -0.4292066, 1.874659, 1, 0, 0, 1, 1,
0.01396943, 1.262364, -0.5159518, 1, 0, 0, 1, 1,
0.01614082, -0.4356996, 3.92641, 1, 0, 0, 1, 1,
0.01767661, 0.3483812, -2.158935, 1, 0, 0, 1, 1,
0.0185703, 0.02409005, 0.8495573, 0, 0, 0, 1, 1,
0.02233484, -0.4323891, 3.499156, 0, 0, 0, 1, 1,
0.02358668, 2.127353, -0.9820009, 0, 0, 0, 1, 1,
0.02674553, 0.214123, -1.195725, 0, 0, 0, 1, 1,
0.02698769, 0.05613125, 0.8265631, 0, 0, 0, 1, 1,
0.02725082, 1.319043, 1.576398, 0, 0, 0, 1, 1,
0.02991864, -0.5305731, 3.648324, 0, 0, 0, 1, 1,
0.03563041, -0.02859334, 2.647434, 1, 1, 1, 1, 1,
0.0387717, 1.929586, -1.443853, 1, 1, 1, 1, 1,
0.04277429, 1.459945, 0.1171808, 1, 1, 1, 1, 1,
0.04290163, -0.9728972, 3.026022, 1, 1, 1, 1, 1,
0.04596508, 0.5097393, 0.2227163, 1, 1, 1, 1, 1,
0.04661312, -0.3087504, 3.351371, 1, 1, 1, 1, 1,
0.04742, 0.5161062, 0.66278, 1, 1, 1, 1, 1,
0.05473279, -1.002949, 4.703546, 1, 1, 1, 1, 1,
0.06329522, -0.409383, 3.467301, 1, 1, 1, 1, 1,
0.06444938, -1.545578, 1.886418, 1, 1, 1, 1, 1,
0.06627136, -1.696911, 3.34277, 1, 1, 1, 1, 1,
0.06848219, -3.542326, 3.693077, 1, 1, 1, 1, 1,
0.06902295, 0.2857332, -0.9328538, 1, 1, 1, 1, 1,
0.07418332, -1.336524, 4.171319, 1, 1, 1, 1, 1,
0.0806423, -0.7090814, 5.887984, 1, 1, 1, 1, 1,
0.08127445, -0.2265342, 3.552186, 0, 0, 1, 1, 1,
0.08624047, 0.7302542, -0.5268933, 1, 0, 0, 1, 1,
0.09127446, -1.204872, 3.243265, 1, 0, 0, 1, 1,
0.09328748, -1.250508, 0.1854486, 1, 0, 0, 1, 1,
0.09891101, 0.4211285, -1.15721, 1, 0, 0, 1, 1,
0.1019949, 0.4715925, 1.704562, 1, 0, 0, 1, 1,
0.1036856, -1.105476, 4.809936, 0, 0, 0, 1, 1,
0.1090116, 0.05632095, 0.6479348, 0, 0, 0, 1, 1,
0.113939, -0.4322305, 3.676425, 0, 0, 0, 1, 1,
0.1149054, -1.082448, 1.943465, 0, 0, 0, 1, 1,
0.1161086, -0.4927454, 1.100069, 0, 0, 0, 1, 1,
0.121589, 0.1065581, -0.4605206, 0, 0, 0, 1, 1,
0.1232429, 1.968779, -0.2648224, 0, 0, 0, 1, 1,
0.1286732, 1.391579, 0.39443, 1, 1, 1, 1, 1,
0.1339372, -0.7071619, 2.40294, 1, 1, 1, 1, 1,
0.1343123, -0.5018689, 2.218719, 1, 1, 1, 1, 1,
0.1356367, 1.519779, 0.7122046, 1, 1, 1, 1, 1,
0.1374566, -2.322324, 2.477012, 1, 1, 1, 1, 1,
0.1403338, 0.8866752, -0.8950186, 1, 1, 1, 1, 1,
0.140942, -0.1521049, 3.51897, 1, 1, 1, 1, 1,
0.1463386, 2.363576, -0.9313857, 1, 1, 1, 1, 1,
0.1509178, 0.03003766, 2.040832, 1, 1, 1, 1, 1,
0.1512423, 0.5034484, 0.7629359, 1, 1, 1, 1, 1,
0.1515441, -0.6255488, 1.336376, 1, 1, 1, 1, 1,
0.1534668, 1.961868, 0.4214817, 1, 1, 1, 1, 1,
0.1541692, -1.44963, 2.61794, 1, 1, 1, 1, 1,
0.1568463, -1.466832, 1.569227, 1, 1, 1, 1, 1,
0.1591256, 0.7624177, -0.3286286, 1, 1, 1, 1, 1,
0.1603826, -0.7094256, 2.353327, 0, 0, 1, 1, 1,
0.1618891, 1.726664, 0.3549315, 1, 0, 0, 1, 1,
0.161894, -0.9942677, 3.111085, 1, 0, 0, 1, 1,
0.1672259, 1.556559, -0.1266861, 1, 0, 0, 1, 1,
0.1750561, -0.1333315, 0.5674102, 1, 0, 0, 1, 1,
0.1770107, -0.432208, 0.3429451, 1, 0, 0, 1, 1,
0.180195, -0.3731966, 2.929128, 0, 0, 0, 1, 1,
0.1809839, -0.1135855, 2.089118, 0, 0, 0, 1, 1,
0.1819845, -0.2521968, 2.686789, 0, 0, 0, 1, 1,
0.1826382, 0.3435276, -0.7327408, 0, 0, 0, 1, 1,
0.1866845, -0.2376863, 1.057541, 0, 0, 0, 1, 1,
0.187122, -0.5974844, 2.628865, 0, 0, 0, 1, 1,
0.1889472, 1.41363, -0.05655618, 0, 0, 0, 1, 1,
0.1904091, 0.4037258, -1.411147, 1, 1, 1, 1, 1,
0.1906667, -0.1281812, 3.879571, 1, 1, 1, 1, 1,
0.1919895, -1.215817, 4.078901, 1, 1, 1, 1, 1,
0.1930803, 0.1631852, 1.424683, 1, 1, 1, 1, 1,
0.1983901, -1.25695, 2.189127, 1, 1, 1, 1, 1,
0.1993195, 0.6803013, 1.157445, 1, 1, 1, 1, 1,
0.2009762, -1.710982, 3.741549, 1, 1, 1, 1, 1,
0.2017098, -0.08026132, 1.147757, 1, 1, 1, 1, 1,
0.2021207, -0.6352354, 3.673435, 1, 1, 1, 1, 1,
0.213384, -0.7241698, 3.387733, 1, 1, 1, 1, 1,
0.2201356, -0.7740281, 3.864502, 1, 1, 1, 1, 1,
0.2205968, -0.6305687, 3.247974, 1, 1, 1, 1, 1,
0.221254, -1.03752, 4.656755, 1, 1, 1, 1, 1,
0.2218494, -0.7404938, 2.156611, 1, 1, 1, 1, 1,
0.2286754, 0.1989345, 0.6325893, 1, 1, 1, 1, 1,
0.231668, 2.01649, -1.785228, 0, 0, 1, 1, 1,
0.232963, 0.5576705, 0.6294593, 1, 0, 0, 1, 1,
0.2330391, -1.338013, 2.814859, 1, 0, 0, 1, 1,
0.2374006, -0.1309148, 0.6705614, 1, 0, 0, 1, 1,
0.237518, -1.15522, 2.549674, 1, 0, 0, 1, 1,
0.2407975, -1.064745, 2.238798, 1, 0, 0, 1, 1,
0.2408255, 0.9050969, -1.821511, 0, 0, 0, 1, 1,
0.2441638, 1.274598, 0.4295953, 0, 0, 0, 1, 1,
0.2446495, 0.582567, 0.5971453, 0, 0, 0, 1, 1,
0.2469539, -0.9675997, 2.255876, 0, 0, 0, 1, 1,
0.2501028, -1.493914, 1.719824, 0, 0, 0, 1, 1,
0.2525598, -1.922401, 2.744129, 0, 0, 0, 1, 1,
0.2533228, -0.01469055, 2.398855, 0, 0, 0, 1, 1,
0.2585968, 0.4649087, 0.6409155, 1, 1, 1, 1, 1,
0.2625338, -0.4752974, 3.69563, 1, 1, 1, 1, 1,
0.2640528, -0.4381053, 2.595779, 1, 1, 1, 1, 1,
0.2676786, 1.181361, -1.56871, 1, 1, 1, 1, 1,
0.2720422, 1.215239, 0.1184177, 1, 1, 1, 1, 1,
0.2782073, -0.5543933, 3.046153, 1, 1, 1, 1, 1,
0.2800419, -0.4938949, 1.215853, 1, 1, 1, 1, 1,
0.2807655, 0.3071403, -0.1319942, 1, 1, 1, 1, 1,
0.2815851, 0.5109036, 0.06752883, 1, 1, 1, 1, 1,
0.2834415, -1.642148, 3.303702, 1, 1, 1, 1, 1,
0.2862753, -0.568741, 1.507313, 1, 1, 1, 1, 1,
0.2908196, -1.716493, 3.917279, 1, 1, 1, 1, 1,
0.295432, 0.1457672, 2.277128, 1, 1, 1, 1, 1,
0.2959464, 1.180357, 0.8998241, 1, 1, 1, 1, 1,
0.2962451, 0.862321, 1.220508, 1, 1, 1, 1, 1,
0.296823, 0.950349, -0.6545897, 0, 0, 1, 1, 1,
0.3028991, 0.1225995, 0.4254466, 1, 0, 0, 1, 1,
0.3037054, -0.1433045, 3.301096, 1, 0, 0, 1, 1,
0.3054028, 0.22834, 0.2184107, 1, 0, 0, 1, 1,
0.3055092, 0.5662791, -0.2816529, 1, 0, 0, 1, 1,
0.3063873, -1.254503, 3.244966, 1, 0, 0, 1, 1,
0.3077918, 0.424118, -0.05113299, 0, 0, 0, 1, 1,
0.3084693, 0.8105316, 0.8122432, 0, 0, 0, 1, 1,
0.3139503, 0.5342398, -0.1454068, 0, 0, 0, 1, 1,
0.3142908, -1.140436, 3.331732, 0, 0, 0, 1, 1,
0.3146467, 1.464996, -0.5076573, 0, 0, 0, 1, 1,
0.3160426, -0.08208299, 1.196917, 0, 0, 0, 1, 1,
0.3223708, 0.02357821, -0.1335936, 0, 0, 0, 1, 1,
0.3230332, 2.322577, -0.1093271, 1, 1, 1, 1, 1,
0.3253882, -0.7403339, 3.370882, 1, 1, 1, 1, 1,
0.325505, 1.134387, 0.7731268, 1, 1, 1, 1, 1,
0.3274072, 3.436865, 0.9891669, 1, 1, 1, 1, 1,
0.3278587, -1.220686, 1.972107, 1, 1, 1, 1, 1,
0.331703, 2.228405, 1.133848, 1, 1, 1, 1, 1,
0.3317252, 0.6024563, -1.408201, 1, 1, 1, 1, 1,
0.3328629, -1.443637, 2.48583, 1, 1, 1, 1, 1,
0.3399862, -1.144891, 2.065562, 1, 1, 1, 1, 1,
0.3434101, -0.178192, 0.5214537, 1, 1, 1, 1, 1,
0.3452143, 1.018764, 0.7726738, 1, 1, 1, 1, 1,
0.3501313, 1.070853, 0.7121946, 1, 1, 1, 1, 1,
0.361092, 0.5957367, -1.218902, 1, 1, 1, 1, 1,
0.3619295, 0.02505376, 1.07161, 1, 1, 1, 1, 1,
0.363923, -1.126027, 2.101474, 1, 1, 1, 1, 1,
0.3691725, 1.178551, -2.441565, 0, 0, 1, 1, 1,
0.3708251, 1.650486, 0.4183731, 1, 0, 0, 1, 1,
0.3740244, 1.304637, 0.2128243, 1, 0, 0, 1, 1,
0.3779515, 2.482661, -0.6262244, 1, 0, 0, 1, 1,
0.3816017, -0.7852968, 3.600807, 1, 0, 0, 1, 1,
0.3830835, -0.2637784, 2.328537, 1, 0, 0, 1, 1,
0.3864114, 2.231864, 0.6147341, 0, 0, 0, 1, 1,
0.3895664, -0.891159, 2.004686, 0, 0, 0, 1, 1,
0.3901228, -0.2710153, 0.8561723, 0, 0, 0, 1, 1,
0.3907112, -1.378712, 2.836087, 0, 0, 0, 1, 1,
0.3934287, -0.2051761, 3.909418, 0, 0, 0, 1, 1,
0.4053579, 0.5736047, -0.5668835, 0, 0, 0, 1, 1,
0.40558, 1.620761, 1.687257, 0, 0, 0, 1, 1,
0.4063611, 1.985672, 0.8886945, 1, 1, 1, 1, 1,
0.4075328, -0.019417, 1.139151, 1, 1, 1, 1, 1,
0.4112012, -0.9661366, 1.759766, 1, 1, 1, 1, 1,
0.4128593, 0.545706, 1.537218, 1, 1, 1, 1, 1,
0.4149829, 1.443415, 0.5795656, 1, 1, 1, 1, 1,
0.4174117, -0.6022118, 3.021368, 1, 1, 1, 1, 1,
0.4212743, 0.7487172, 0.8028244, 1, 1, 1, 1, 1,
0.4215763, 0.2265537, -0.3775307, 1, 1, 1, 1, 1,
0.4231711, -0.7958056, 2.390846, 1, 1, 1, 1, 1,
0.4237518, -0.1031598, 1.262962, 1, 1, 1, 1, 1,
0.4252535, -0.1846432, 3.414536, 1, 1, 1, 1, 1,
0.4282055, 0.2321354, 0.8400971, 1, 1, 1, 1, 1,
0.4295015, 1.045299, 0.5980451, 1, 1, 1, 1, 1,
0.4324526, 2.074227, 0.4291135, 1, 1, 1, 1, 1,
0.4351757, 0.2151824, 1.910535, 1, 1, 1, 1, 1,
0.4364698, 0.6754599, -0.2403788, 0, 0, 1, 1, 1,
0.4373399, 0.7858363, 0.5382384, 1, 0, 0, 1, 1,
0.4393524, 1.413328, 0.2320905, 1, 0, 0, 1, 1,
0.4437273, -0.7795076, 2.015768, 1, 0, 0, 1, 1,
0.4445632, 0.9445259, 1.938323, 1, 0, 0, 1, 1,
0.4542488, -1.051053, 1.194577, 1, 0, 0, 1, 1,
0.4556847, -0.04117957, 1.353579, 0, 0, 0, 1, 1,
0.4627635, 0.9651013, -1.531931, 0, 0, 0, 1, 1,
0.4642253, -1.012738, 1.807709, 0, 0, 0, 1, 1,
0.4648964, -0.3436979, 2.203412, 0, 0, 0, 1, 1,
0.4692088, 1.581844, -1.051786, 0, 0, 0, 1, 1,
0.4692643, 0.9361329, -0.03688532, 0, 0, 0, 1, 1,
0.4706629, -0.2017477, 2.017531, 0, 0, 0, 1, 1,
0.4742353, 0.7996892, 1.658659, 1, 1, 1, 1, 1,
0.4748374, 1.37194, 0.1341249, 1, 1, 1, 1, 1,
0.4772098, -0.3723749, 2.673287, 1, 1, 1, 1, 1,
0.479145, -1.147349, 2.509932, 1, 1, 1, 1, 1,
0.4830967, 0.1817227, 0.6755205, 1, 1, 1, 1, 1,
0.483709, 0.6293715, -1.546411, 1, 1, 1, 1, 1,
0.484694, -0.3150007, 3.147481, 1, 1, 1, 1, 1,
0.48627, -0.2349671, 3.245399, 1, 1, 1, 1, 1,
0.4913199, -0.4057513, 2.965871, 1, 1, 1, 1, 1,
0.4913497, -0.1651287, 1.895016, 1, 1, 1, 1, 1,
0.4966324, 0.734103, 0.7274538, 1, 1, 1, 1, 1,
0.4980904, -1.074125, 3.528988, 1, 1, 1, 1, 1,
0.4996195, -1.37003, 4.043608, 1, 1, 1, 1, 1,
0.5020833, 0.1757128, 0.7724938, 1, 1, 1, 1, 1,
0.507709, -0.6133824, 2.87297, 1, 1, 1, 1, 1,
0.507944, 1.310616, 2.015593, 0, 0, 1, 1, 1,
0.5136818, 1.681491, 0.7265909, 1, 0, 0, 1, 1,
0.5153942, -0.5926427, 3.674395, 1, 0, 0, 1, 1,
0.519252, 0.9634481, 0.5810632, 1, 0, 0, 1, 1,
0.5234727, 0.3990345, 0.5291034, 1, 0, 0, 1, 1,
0.5282158, 0.4540757, 1.246924, 1, 0, 0, 1, 1,
0.5398102, 1.112873, -0.9402054, 0, 0, 0, 1, 1,
0.5426726, -1.639207, 3.136649, 0, 0, 0, 1, 1,
0.5520793, 0.6887703, 0.445424, 0, 0, 0, 1, 1,
0.5541745, -0.2034056, 1.564007, 0, 0, 0, 1, 1,
0.5551843, 0.4276278, 2.341731, 0, 0, 0, 1, 1,
0.5554776, 0.2808857, 2.272706, 0, 0, 0, 1, 1,
0.5580683, 0.6351516, 0.8348044, 0, 0, 0, 1, 1,
0.5627931, 0.5239955, 1.021399, 1, 1, 1, 1, 1,
0.5660482, 1.73887, 0.8120896, 1, 1, 1, 1, 1,
0.5693462, 0.8211492, -0.2287173, 1, 1, 1, 1, 1,
0.5724097, 1.223981, -0.6992779, 1, 1, 1, 1, 1,
0.5754896, -0.2174958, 5.542258, 1, 1, 1, 1, 1,
0.5777641, 1.663172, 0.1569491, 1, 1, 1, 1, 1,
0.5785439, -3.083518, 3.30467, 1, 1, 1, 1, 1,
0.5793904, 0.4821902, 1.202937, 1, 1, 1, 1, 1,
0.5872665, -0.1104854, 2.468646, 1, 1, 1, 1, 1,
0.5873944, -1.478582, 2.259471, 1, 1, 1, 1, 1,
0.588904, 1.036214, 0.6466279, 1, 1, 1, 1, 1,
0.5889676, -0.7594545, 2.541543, 1, 1, 1, 1, 1,
0.5944297, 0.4126894, 1.243659, 1, 1, 1, 1, 1,
0.5990074, -1.642509, 1.583269, 1, 1, 1, 1, 1,
0.5990518, 1.715558, 1.512366, 1, 1, 1, 1, 1,
0.6073453, 0.9266492, -1.284807, 0, 0, 1, 1, 1,
0.6087031, 0.9366258, -0.2718922, 1, 0, 0, 1, 1,
0.6112304, -0.9246365, 2.282069, 1, 0, 0, 1, 1,
0.6203238, 1.04325, -1.525046, 1, 0, 0, 1, 1,
0.622188, -1.080083, 1.939992, 1, 0, 0, 1, 1,
0.6227559, 0.6550867, 0.194583, 1, 0, 0, 1, 1,
0.6253985, -0.7530336, 2.701415, 0, 0, 0, 1, 1,
0.6256266, 2.153355, -1.232745, 0, 0, 0, 1, 1,
0.6349258, 0.262268, 0.5360062, 0, 0, 0, 1, 1,
0.6367359, -0.2277217, 4.740613, 0, 0, 0, 1, 1,
0.6384888, 0.9704478, 1.851397, 0, 0, 0, 1, 1,
0.6446581, 0.2405907, 2.247749, 0, 0, 0, 1, 1,
0.6556897, -0.1682404, 0.8565374, 0, 0, 0, 1, 1,
0.6561936, -0.2968191, 2.080281, 1, 1, 1, 1, 1,
0.6564264, 0.4978902, 3.023568, 1, 1, 1, 1, 1,
0.6624525, 0.984884, 1.085089, 1, 1, 1, 1, 1,
0.6640666, 0.9824052, -1.620034, 1, 1, 1, 1, 1,
0.6673337, 1.257272, 1.325105, 1, 1, 1, 1, 1,
0.6777682, -1.624163, 2.268465, 1, 1, 1, 1, 1,
0.6803406, -1.770664, 3.710644, 1, 1, 1, 1, 1,
0.691444, -0.8828397, 0.876524, 1, 1, 1, 1, 1,
0.6928342, -0.1645732, 2.636728, 1, 1, 1, 1, 1,
0.696716, -1.01697, 2.690884, 1, 1, 1, 1, 1,
0.6992579, 0.8381562, 0.9940287, 1, 1, 1, 1, 1,
0.7062189, -0.7389114, -0.4962843, 1, 1, 1, 1, 1,
0.7067417, 0.7181166, 1.663313, 1, 1, 1, 1, 1,
0.7094705, 0.3675548, 3.265156, 1, 1, 1, 1, 1,
0.7128535, 0.4723386, 1.211543, 1, 1, 1, 1, 1,
0.7141173, 0.03545161, 1.603424, 0, 0, 1, 1, 1,
0.7151785, 0.4121476, 0.1334562, 1, 0, 0, 1, 1,
0.7185133, -2.029211, 1.204549, 1, 0, 0, 1, 1,
0.7240497, -1.318328, 4.139104, 1, 0, 0, 1, 1,
0.7251386, -0.7556833, 1.138929, 1, 0, 0, 1, 1,
0.7279737, 0.03930137, 2.061286, 1, 0, 0, 1, 1,
0.7292221, 0.4250651, -0.6559836, 0, 0, 0, 1, 1,
0.7340518, -2.298934, 4.724017, 0, 0, 0, 1, 1,
0.7454115, 0.06263298, 2.906234, 0, 0, 0, 1, 1,
0.7477021, 0.6844466, 0.7844993, 0, 0, 0, 1, 1,
0.7518389, 0.3655519, 0.893263, 0, 0, 0, 1, 1,
0.759501, 1.036433, -0.8617867, 0, 0, 0, 1, 1,
0.7635676, -0.9559472, 3.114065, 0, 0, 0, 1, 1,
0.7637008, 0.4735281, 0.1043788, 1, 1, 1, 1, 1,
0.7648887, -0.5211664, 2.196894, 1, 1, 1, 1, 1,
0.7716872, -0.1619955, 0.9511651, 1, 1, 1, 1, 1,
0.7779431, -0.2863759, 2.910272, 1, 1, 1, 1, 1,
0.7809375, -1.205132, 2.395416, 1, 1, 1, 1, 1,
0.7823734, 0.9884431, -1.584945, 1, 1, 1, 1, 1,
0.7838856, -1.425533, 2.571169, 1, 1, 1, 1, 1,
0.7863993, 0.3029896, 0.7794956, 1, 1, 1, 1, 1,
0.7880868, -0.2766368, 2.518594, 1, 1, 1, 1, 1,
0.7910571, -0.7774708, 2.965079, 1, 1, 1, 1, 1,
0.79206, 0.4744288, 1.640988, 1, 1, 1, 1, 1,
0.7971105, -0.3840158, 1.835943, 1, 1, 1, 1, 1,
0.8015588, -1.531272, 3.575902, 1, 1, 1, 1, 1,
0.8033245, -1.573002, 2.235045, 1, 1, 1, 1, 1,
0.8084039, 0.1604745, 1.042266, 1, 1, 1, 1, 1,
0.8129956, 1.875449, 0.001824231, 0, 0, 1, 1, 1,
0.8139813, 0.5564504, 0.877571, 1, 0, 0, 1, 1,
0.8195676, 1.029046, -1.082388, 1, 0, 0, 1, 1,
0.8197402, -1.254596, 2.990567, 1, 0, 0, 1, 1,
0.8244073, 0.5537848, 0.6582212, 1, 0, 0, 1, 1,
0.8278218, 0.4092151, 1.658165, 1, 0, 0, 1, 1,
0.828365, 0.9685619, -0.4368902, 0, 0, 0, 1, 1,
0.8346381, 1.299149, -0.8199587, 0, 0, 0, 1, 1,
0.8445159, 0.8161476, -0.4534259, 0, 0, 0, 1, 1,
0.8455265, -0.9977918, 1.649482, 0, 0, 0, 1, 1,
0.8514209, 0.5600289, 2.568825, 0, 0, 0, 1, 1,
0.8546615, -0.7007576, 1.913255, 0, 0, 0, 1, 1,
0.8638256, -1.003738, -0.7158687, 0, 0, 0, 1, 1,
0.865705, -0.1669693, 0.7059591, 1, 1, 1, 1, 1,
0.8682927, 0.9070799, 0.5649357, 1, 1, 1, 1, 1,
0.8684559, 0.2530802, 0.6952537, 1, 1, 1, 1, 1,
0.8723404, 0.1960457, 0.1987619, 1, 1, 1, 1, 1,
0.8724872, -1.247644, 1.94893, 1, 1, 1, 1, 1,
0.8761167, -0.7716066, 1.382765, 1, 1, 1, 1, 1,
0.8761373, 0.6718665, -0.5082902, 1, 1, 1, 1, 1,
0.8795111, 1.130264, 0.08105816, 1, 1, 1, 1, 1,
0.8822362, 0.6199803, 0.4692613, 1, 1, 1, 1, 1,
0.8932852, 0.1052626, -0.5533719, 1, 1, 1, 1, 1,
0.8983004, -0.7271331, 3.516099, 1, 1, 1, 1, 1,
0.9025335, -0.745797, 1.607198, 1, 1, 1, 1, 1,
0.9068884, 1.915168, -0.1964647, 1, 1, 1, 1, 1,
0.9070029, -0.7324372, 1.767691, 1, 1, 1, 1, 1,
0.9073431, 0.09609095, 0.6951153, 1, 1, 1, 1, 1,
0.9187503, -0.5657545, 1.081524, 0, 0, 1, 1, 1,
0.9293631, -0.1170601, 3.497527, 1, 0, 0, 1, 1,
0.929482, 0.6565092, 0.6080805, 1, 0, 0, 1, 1,
0.9354407, -1.287299, 2.693284, 1, 0, 0, 1, 1,
0.9382722, -0.930611, 1.109915, 1, 0, 0, 1, 1,
0.9400428, 1.003216, 4.098886, 1, 0, 0, 1, 1,
0.9462053, 3.473236, -0.1389253, 0, 0, 0, 1, 1,
0.9553745, -0.2881375, 0.2673544, 0, 0, 0, 1, 1,
0.9711436, 0.1855492, 1.915812, 0, 0, 0, 1, 1,
0.975665, -1.288538, 3.354309, 0, 0, 0, 1, 1,
0.9769376, 0.1719019, 2.324751, 0, 0, 0, 1, 1,
0.983165, -0.1686896, 1.883724, 0, 0, 0, 1, 1,
0.9849209, -0.0372249, 0.7174729, 0, 0, 0, 1, 1,
0.9860989, 1.947046, 0.701369, 1, 1, 1, 1, 1,
0.9863512, -1.907528, 3.066049, 1, 1, 1, 1, 1,
0.9900831, -0.09604993, 3.405226, 1, 1, 1, 1, 1,
0.9947897, 1.290276, 1.040521, 1, 1, 1, 1, 1,
1.002603, 1.108935, 1.637836, 1, 1, 1, 1, 1,
1.002865, 0.05990855, 0.8066443, 1, 1, 1, 1, 1,
1.003685, -0.1934761, 1.323119, 1, 1, 1, 1, 1,
1.005244, -0.4661056, 1.732399, 1, 1, 1, 1, 1,
1.005685, 1.760693, 0.5396714, 1, 1, 1, 1, 1,
1.010984, -1.696708, 1.731912, 1, 1, 1, 1, 1,
1.021072, 0.7212763, 1.417693, 1, 1, 1, 1, 1,
1.027976, 1.227712, 1.135729, 1, 1, 1, 1, 1,
1.028275, 0.5056003, 1.60524, 1, 1, 1, 1, 1,
1.029774, -0.8274089, 0.4875879, 1, 1, 1, 1, 1,
1.03279, 0.5588703, 0.2304943, 1, 1, 1, 1, 1,
1.033659, -0.914105, 1.7976, 0, 0, 1, 1, 1,
1.037369, 0.8629062, -0.1768888, 1, 0, 0, 1, 1,
1.041342, 1.06802, 1.485951, 1, 0, 0, 1, 1,
1.043085, 1.045401, 1.981571, 1, 0, 0, 1, 1,
1.049162, 0.02649141, 2.545977, 1, 0, 0, 1, 1,
1.058752, 1.51511, 0.2538866, 1, 0, 0, 1, 1,
1.059312, -0.2857018, 2.259953, 0, 0, 0, 1, 1,
1.062148, 0.1119835, 2.987396, 0, 0, 0, 1, 1,
1.065315, -0.7904928, 0.7827761, 0, 0, 0, 1, 1,
1.065441, 0.4625153, -0.6251066, 0, 0, 0, 1, 1,
1.069649, 0.3324485, -0.389957, 0, 0, 0, 1, 1,
1.075517, -0.549718, 2.37422, 0, 0, 0, 1, 1,
1.081308, 0.2255141, 1.429791, 0, 0, 0, 1, 1,
1.084123, -1.61633, 1.006669, 1, 1, 1, 1, 1,
1.084329, -0.5915028, 2.661744, 1, 1, 1, 1, 1,
1.100057, -0.7912915, 1.676769, 1, 1, 1, 1, 1,
1.112355, 0.7111866, 2.575089, 1, 1, 1, 1, 1,
1.11742, 0.6950497, -0.9847025, 1, 1, 1, 1, 1,
1.118962, 0.2423529, 2.265427, 1, 1, 1, 1, 1,
1.119516, 1.50707, 0.03074957, 1, 1, 1, 1, 1,
1.122057, -2.828741, 4.028253, 1, 1, 1, 1, 1,
1.125371, -0.4866388, 1.472913, 1, 1, 1, 1, 1,
1.126801, 0.605562, 2.088373, 1, 1, 1, 1, 1,
1.128513, 0.4601676, 1.84382, 1, 1, 1, 1, 1,
1.130449, 0.3932992, 0.1007671, 1, 1, 1, 1, 1,
1.130645, 0.6129661, 2.021881, 1, 1, 1, 1, 1,
1.13108, 0.1966618, 0.05366985, 1, 1, 1, 1, 1,
1.131318, -0.7621355, 2.784076, 1, 1, 1, 1, 1,
1.131346, 1.028052, 0.9930478, 0, 0, 1, 1, 1,
1.133341, -0.02293072, 0.8173903, 1, 0, 0, 1, 1,
1.148957, 0.02083258, 0.8077465, 1, 0, 0, 1, 1,
1.149049, -1.056967, -0.9652201, 1, 0, 0, 1, 1,
1.154579, 0.7443867, 1.077589, 1, 0, 0, 1, 1,
1.157094, 0.1639068, 3.792551, 1, 0, 0, 1, 1,
1.160964, 0.6329079, 1.162862, 0, 0, 0, 1, 1,
1.172276, -0.1708547, 1.078905, 0, 0, 0, 1, 1,
1.174451, -1.198724, 2.971901, 0, 0, 0, 1, 1,
1.174749, -0.8897506, 1.796898, 0, 0, 0, 1, 1,
1.174955, 0.1182996, 3.575212, 0, 0, 0, 1, 1,
1.178325, 3.0176, -0.7026655, 0, 0, 0, 1, 1,
1.188178, 1.574256, -0.7208949, 0, 0, 0, 1, 1,
1.189617, 0.8457002, 1.534209, 1, 1, 1, 1, 1,
1.189885, -0.4759315, 2.907667, 1, 1, 1, 1, 1,
1.215404, -1.213886, 2.6886, 1, 1, 1, 1, 1,
1.221733, 0.4265398, 0.3910448, 1, 1, 1, 1, 1,
1.226588, -1.127427, 3.047986, 1, 1, 1, 1, 1,
1.24264, -1.034992, 3.101113, 1, 1, 1, 1, 1,
1.243092, 1.880857, 0.9800001, 1, 1, 1, 1, 1,
1.247837, -0.1166143, 1.992041, 1, 1, 1, 1, 1,
1.248867, 0.2201975, 1.978026, 1, 1, 1, 1, 1,
1.253121, -1.586595, 0.9103785, 1, 1, 1, 1, 1,
1.255408, -0.4605196, 1.079572, 1, 1, 1, 1, 1,
1.258264, -0.7219464, 2.798759, 1, 1, 1, 1, 1,
1.260234, 0.06487127, 3.041602, 1, 1, 1, 1, 1,
1.2618, -1.526184, 0.7759864, 1, 1, 1, 1, 1,
1.262769, -0.4616688, 3.089303, 1, 1, 1, 1, 1,
1.268897, 1.987278, 0.02407368, 0, 0, 1, 1, 1,
1.269154, 0.7848433, 0.2934194, 1, 0, 0, 1, 1,
1.26967, 0.8382203, 2.026946, 1, 0, 0, 1, 1,
1.278985, 0.4444642, -0.4544712, 1, 0, 0, 1, 1,
1.291474, -0.6893991, 2.156004, 1, 0, 0, 1, 1,
1.293922, 0.9338446, -0.1451827, 1, 0, 0, 1, 1,
1.297836, -0.2985985, 0.3896236, 0, 0, 0, 1, 1,
1.299706, 0.4621877, 1.8066, 0, 0, 0, 1, 1,
1.30904, -0.1820657, 0.2906882, 0, 0, 0, 1, 1,
1.319031, -1.472024, 4.102281, 0, 0, 0, 1, 1,
1.320869, 1.361157, -1.163016, 0, 0, 0, 1, 1,
1.321308, 0.247914, 0.7597077, 0, 0, 0, 1, 1,
1.324552, 0.8194475, 1.289228, 0, 0, 0, 1, 1,
1.327528, 0.5955188, 1.347839, 1, 1, 1, 1, 1,
1.331568, 0.6871645, 1.371743, 1, 1, 1, 1, 1,
1.346794, 0.9978002, 0.7307103, 1, 1, 1, 1, 1,
1.348296, 0.3640748, 1.791317, 1, 1, 1, 1, 1,
1.361253, 0.9091491, 1.285245, 1, 1, 1, 1, 1,
1.369899, 1.91914, 1.482067, 1, 1, 1, 1, 1,
1.371079, 1.463295, 1.543226, 1, 1, 1, 1, 1,
1.374763, -0.2058983, -0.1269331, 1, 1, 1, 1, 1,
1.374993, 0.8517963, 1.032074, 1, 1, 1, 1, 1,
1.376345, -0.3932894, 2.248269, 1, 1, 1, 1, 1,
1.390312, -1.036929, 3.355613, 1, 1, 1, 1, 1,
1.393149, -0.4634821, 0.920496, 1, 1, 1, 1, 1,
1.3989, 1.247204, -0.09815094, 1, 1, 1, 1, 1,
1.402831, 0.368537, 0.1481245, 1, 1, 1, 1, 1,
1.404282, 0.5469113, 1.229225, 1, 1, 1, 1, 1,
1.40695, 0.3890238, 0.6450105, 0, 0, 1, 1, 1,
1.408025, -0.02999119, -0.3682438, 1, 0, 0, 1, 1,
1.416795, -1.435688, 3.284498, 1, 0, 0, 1, 1,
1.423925, 1.109867, 0.6859864, 1, 0, 0, 1, 1,
1.424871, 0.549226, 1.267058, 1, 0, 0, 1, 1,
1.426301, -1.432184, 3.627299, 1, 0, 0, 1, 1,
1.442483, 1.315782, 0.4603638, 0, 0, 0, 1, 1,
1.475071, -1.084777, 1.822373, 0, 0, 0, 1, 1,
1.479741, -1.422157, 3.188899, 0, 0, 0, 1, 1,
1.480686, -0.2289504, 1.585782, 0, 0, 0, 1, 1,
1.480955, 0.2902239, 2.988311, 0, 0, 0, 1, 1,
1.497253, -0.1598303, 2.149735, 0, 0, 0, 1, 1,
1.517034, -0.7302435, 1.5527, 0, 0, 0, 1, 1,
1.527231, 0.474092, 0.9525435, 1, 1, 1, 1, 1,
1.534774, 2.01583, 0.0961583, 1, 1, 1, 1, 1,
1.539272, 0.4419158, 2.349532, 1, 1, 1, 1, 1,
1.557808, 0.4476365, 1.523108, 1, 1, 1, 1, 1,
1.557939, 0.04328883, 0.332068, 1, 1, 1, 1, 1,
1.559965, 0.1025924, 2.886832, 1, 1, 1, 1, 1,
1.561937, -1.489382, 3.521357, 1, 1, 1, 1, 1,
1.565565, -1.007504, 2.993449, 1, 1, 1, 1, 1,
1.583592, -1.621104, 3.438528, 1, 1, 1, 1, 1,
1.587464, -1.263044, 3.118376, 1, 1, 1, 1, 1,
1.594821, -0.3415574, 1.227103, 1, 1, 1, 1, 1,
1.601185, 0.2999142, 2.831845, 1, 1, 1, 1, 1,
1.607303, 1.108209, 0.8085197, 1, 1, 1, 1, 1,
1.622035, -0.5686473, 2.233929, 1, 1, 1, 1, 1,
1.653876, 1.075334, -0.03399057, 1, 1, 1, 1, 1,
1.660131, -0.212553, 2.412586, 0, 0, 1, 1, 1,
1.666735, -0.7397192, 2.568848, 1, 0, 0, 1, 1,
1.669373, -0.7859758, 1.7198, 1, 0, 0, 1, 1,
1.678717, 0.3183959, 1.136301, 1, 0, 0, 1, 1,
1.688884, -0.08903994, 0.9188681, 1, 0, 0, 1, 1,
1.715023, -0.4934598, 1.150659, 1, 0, 0, 1, 1,
1.715204, 0.9927204, 0.3136447, 0, 0, 0, 1, 1,
1.725187, -1.946106, 3.597952, 0, 0, 0, 1, 1,
1.732957, -1.610827, 1.944819, 0, 0, 0, 1, 1,
1.733344, -0.7452624, 2.281643, 0, 0, 0, 1, 1,
1.742513, -2.218643, 2.736219, 0, 0, 0, 1, 1,
1.745488, 1.143697, 1.864657, 0, 0, 0, 1, 1,
1.753014, -0.6287604, 2.016421, 0, 0, 0, 1, 1,
1.760401, -1.291708, 1.112206, 1, 1, 1, 1, 1,
1.763552, -1.002885, 1.801538, 1, 1, 1, 1, 1,
1.7638, 0.2087983, 0.3706178, 1, 1, 1, 1, 1,
1.770848, 1.324687, 0.8838279, 1, 1, 1, 1, 1,
1.846458, 0.3488188, 1.254307, 1, 1, 1, 1, 1,
1.850708, 1.833292, -0.1620322, 1, 1, 1, 1, 1,
1.86144, -1.053198, 3.036276, 1, 1, 1, 1, 1,
1.91436, 1.259036, 1.757072, 1, 1, 1, 1, 1,
1.920833, 0.3851022, 0.1345253, 1, 1, 1, 1, 1,
1.921503, 2.267575, -0.4374677, 1, 1, 1, 1, 1,
1.931295, -0.4907337, 3.728435, 1, 1, 1, 1, 1,
1.933224, -0.6844944, 1.650943, 1, 1, 1, 1, 1,
1.938314, -0.695646, 1.674481, 1, 1, 1, 1, 1,
1.941182, 0.3342729, 3.146372, 1, 1, 1, 1, 1,
1.94439, 1.643694, 0.6584904, 1, 1, 1, 1, 1,
1.982267, 1.471689, 0.531572, 0, 0, 1, 1, 1,
2.008525, -0.4522959, 2.112509, 1, 0, 0, 1, 1,
2.026742, -1.584284, 2.160829, 1, 0, 0, 1, 1,
2.039121, -0.1298956, 2.236521, 1, 0, 0, 1, 1,
2.116818, -0.4354811, 1.764041, 1, 0, 0, 1, 1,
2.134473, -1.120208, 0.1460172, 1, 0, 0, 1, 1,
2.147633, 0.9207861, 1.566854, 0, 0, 0, 1, 1,
2.191463, -1.420198, 2.277289, 0, 0, 0, 1, 1,
2.198471, -0.5931189, 2.507514, 0, 0, 0, 1, 1,
2.199577, 0.03174977, 0.2804112, 0, 0, 0, 1, 1,
2.375265, 0.4828252, 2.439515, 0, 0, 0, 1, 1,
2.377808, -0.08361074, 2.536748, 0, 0, 0, 1, 1,
2.377906, -0.1928563, 1.756251, 0, 0, 0, 1, 1,
2.391865, -0.7644089, 2.593639, 1, 1, 1, 1, 1,
2.41796, 0.4581687, 3.71928, 1, 1, 1, 1, 1,
2.459367, 1.400153, 0.07400592, 1, 1, 1, 1, 1,
2.746462, -1.748453, 3.232478, 1, 1, 1, 1, 1,
2.748399, 0.4743353, 0.7714395, 1, 1, 1, 1, 1,
2.930036, -0.8395612, 1.202255, 1, 1, 1, 1, 1,
2.930059, 1.582158, 1.060357, 1, 1, 1, 1, 1
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
var radius = 9.636999;
var distance = 33.84955;
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
mvMatrix.translate( 0.0437957, 0.03454518, -0.5128837 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84955);
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
