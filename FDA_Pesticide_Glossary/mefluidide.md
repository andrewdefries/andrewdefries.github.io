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
-4.306316, 0.2110902, -1.263682, 1, 0, 0, 1,
-3.22045, -0.05474719, -0.9928337, 1, 0.007843138, 0, 1,
-2.847065, 0.1271415, -2.22568, 1, 0.01176471, 0, 1,
-2.688019, 1.367514, -0.7317134, 1, 0.01960784, 0, 1,
-2.477777, -0.9677275, -2.506794, 1, 0.02352941, 0, 1,
-2.435244, 0.9379482, -0.04111249, 1, 0.03137255, 0, 1,
-2.427442, -0.06346082, -2.4753, 1, 0.03529412, 0, 1,
-2.425542, -1.139704, -1.826984, 1, 0.04313726, 0, 1,
-2.412671, 0.6244212, -2.435713, 1, 0.04705882, 0, 1,
-2.363464, -1.000135, -0.9971862, 1, 0.05490196, 0, 1,
-2.331627, 1.124777, -1.031338, 1, 0.05882353, 0, 1,
-2.287305, -0.7096123, -2.273295, 1, 0.06666667, 0, 1,
-2.285755, -0.3942418, -2.3403, 1, 0.07058824, 0, 1,
-2.277105, -0.2024841, -2.041347, 1, 0.07843138, 0, 1,
-2.230641, 0.127514, -1.620142, 1, 0.08235294, 0, 1,
-2.196262, -0.488693, -2.096708, 1, 0.09019608, 0, 1,
-2.16941, -0.04490773, -1.037257, 1, 0.09411765, 0, 1,
-2.167982, -0.4125565, -2.48285, 1, 0.1019608, 0, 1,
-2.161609, -1.385596, -0.6219299, 1, 0.1098039, 0, 1,
-2.14084, 1.022152, 0.3916713, 1, 0.1137255, 0, 1,
-2.120621, -1.226844, -2.263181, 1, 0.1215686, 0, 1,
-2.099155, -1.687991, -1.061384, 1, 0.1254902, 0, 1,
-2.076983, 0.7724335, -1.733892, 1, 0.1333333, 0, 1,
-2.055851, 1.154426, -1.632696, 1, 0.1372549, 0, 1,
-2.028512, 1.625771, -1.175502, 1, 0.145098, 0, 1,
-2.022575, -0.5656076, -1.34945, 1, 0.1490196, 0, 1,
-2.01416, -1.624502, -1.747025, 1, 0.1568628, 0, 1,
-2.009319, -1.372997, -2.810941, 1, 0.1607843, 0, 1,
-1.951209, -0.4289556, -1.487334, 1, 0.1686275, 0, 1,
-1.933076, -0.43951, -1.924516, 1, 0.172549, 0, 1,
-1.915466, 0.8391492, -0.01913607, 1, 0.1803922, 0, 1,
-1.896351, -0.7697347, -2.412271, 1, 0.1843137, 0, 1,
-1.885917, -0.5669821, -2.043502, 1, 0.1921569, 0, 1,
-1.88026, 0.4811948, -2.227923, 1, 0.1960784, 0, 1,
-1.865381, -0.1563839, -0.7770728, 1, 0.2039216, 0, 1,
-1.855057, 0.2855514, -2.582584, 1, 0.2117647, 0, 1,
-1.832513, -0.688161, -4.918105, 1, 0.2156863, 0, 1,
-1.818072, -0.1318464, -0.6528092, 1, 0.2235294, 0, 1,
-1.808173, -0.7066898, -4.005663, 1, 0.227451, 0, 1,
-1.801061, 0.96773, -3.634806, 1, 0.2352941, 0, 1,
-1.795158, 0.8252233, -1.060369, 1, 0.2392157, 0, 1,
-1.769566, 0.3707022, -2.650518, 1, 0.2470588, 0, 1,
-1.76953, -0.8025957, -3.089285, 1, 0.2509804, 0, 1,
-1.768871, 0.9064269, -2.500371, 1, 0.2588235, 0, 1,
-1.767273, -0.2530212, -1.02099, 1, 0.2627451, 0, 1,
-1.758574, -0.7863059, -3.595937, 1, 0.2705882, 0, 1,
-1.75676, 0.3195972, -1.854012, 1, 0.2745098, 0, 1,
-1.755833, -0.2176249, -1.800506, 1, 0.282353, 0, 1,
-1.735107, -0.2277973, -1.573161, 1, 0.2862745, 0, 1,
-1.727677, 0.3119176, -1.810755, 1, 0.2941177, 0, 1,
-1.72649, -0.461422, -1.894544, 1, 0.3019608, 0, 1,
-1.725345, -0.4068838, -0.4978569, 1, 0.3058824, 0, 1,
-1.724408, -0.3051603, -1.731296, 1, 0.3137255, 0, 1,
-1.717799, -0.7220213, -1.684561, 1, 0.3176471, 0, 1,
-1.712488, 0.3500077, -2.451744, 1, 0.3254902, 0, 1,
-1.701725, 1.580545, -2.852832, 1, 0.3294118, 0, 1,
-1.699016, 0.5367805, -0.563669, 1, 0.3372549, 0, 1,
-1.697471, -1.109022, -1.74454, 1, 0.3411765, 0, 1,
-1.693132, -0.1611791, -1.935116, 1, 0.3490196, 0, 1,
-1.680258, -0.4549086, -2.182788, 1, 0.3529412, 0, 1,
-1.680223, -2.724567, -3.241422, 1, 0.3607843, 0, 1,
-1.675817, -1.248878, -2.138497, 1, 0.3647059, 0, 1,
-1.672253, -0.02686188, -1.174614, 1, 0.372549, 0, 1,
-1.669445, -1.318668, -1.253596, 1, 0.3764706, 0, 1,
-1.660867, -0.01294026, -3.527942, 1, 0.3843137, 0, 1,
-1.655675, 0.9560524, -1.708409, 1, 0.3882353, 0, 1,
-1.650394, -1.607308, -0.2065678, 1, 0.3960784, 0, 1,
-1.61164, 2.275149, -0.07597166, 1, 0.4039216, 0, 1,
-1.609793, -0.4657561, -1.148636, 1, 0.4078431, 0, 1,
-1.609526, -0.9571896, -3.482666, 1, 0.4156863, 0, 1,
-1.587921, 0.9702505, -1.416349, 1, 0.4196078, 0, 1,
-1.579105, -0.7404046, 0.06178042, 1, 0.427451, 0, 1,
-1.577183, -0.2226975, -2.150791, 1, 0.4313726, 0, 1,
-1.555601, 0.2091269, -2.335208, 1, 0.4392157, 0, 1,
-1.554693, 0.373405, 0.7128293, 1, 0.4431373, 0, 1,
-1.550767, 1.931257, 0.415967, 1, 0.4509804, 0, 1,
-1.541981, 0.1909409, -0.4765603, 1, 0.454902, 0, 1,
-1.530567, -1.288922, -1.988457, 1, 0.4627451, 0, 1,
-1.522872, 0.5102972, -1.587563, 1, 0.4666667, 0, 1,
-1.517411, 0.7544824, -0.3518155, 1, 0.4745098, 0, 1,
-1.506074, -0.8009713, -0.1399092, 1, 0.4784314, 0, 1,
-1.499694, 1.020852, 0.7374098, 1, 0.4862745, 0, 1,
-1.4996, -0.3753281, -3.307344, 1, 0.4901961, 0, 1,
-1.483279, 2.749108, 0.7733169, 1, 0.4980392, 0, 1,
-1.483126, 0.8822497, -0.5784048, 1, 0.5058824, 0, 1,
-1.48287, 0.8899469, -1.919255, 1, 0.509804, 0, 1,
-1.470066, 0.1259506, -1.36608, 1, 0.5176471, 0, 1,
-1.46539, -0.3528304, -1.101013, 1, 0.5215687, 0, 1,
-1.456787, 0.3583061, -1.013747, 1, 0.5294118, 0, 1,
-1.446921, -0.1301137, -0.7280222, 1, 0.5333334, 0, 1,
-1.441518, -1.139658, -2.131075, 1, 0.5411765, 0, 1,
-1.433828, 0.4628741, -2.899508, 1, 0.5450981, 0, 1,
-1.414559, 0.1991541, -0.4627247, 1, 0.5529412, 0, 1,
-1.410071, 0.8662416, 0.03287984, 1, 0.5568628, 0, 1,
-1.394149, -1.163345, -2.902845, 1, 0.5647059, 0, 1,
-1.380921, 0.9754091, 0.5872157, 1, 0.5686275, 0, 1,
-1.379227, 0.5171512, -0.9576027, 1, 0.5764706, 0, 1,
-1.371232, 1.579292, -3.095233, 1, 0.5803922, 0, 1,
-1.364491, 1.897628, -2.455071, 1, 0.5882353, 0, 1,
-1.359089, -0.6855835, -2.115351, 1, 0.5921569, 0, 1,
-1.355149, -0.6562783, -4.069928, 1, 0.6, 0, 1,
-1.348635, 1.282379, -0.6890292, 1, 0.6078432, 0, 1,
-1.34687, -0.5662096, -2.186839, 1, 0.6117647, 0, 1,
-1.346292, -0.03057776, -1.073904, 1, 0.6196079, 0, 1,
-1.334267, 0.1415333, -1.651741, 1, 0.6235294, 0, 1,
-1.327931, -0.07181042, -1.661147, 1, 0.6313726, 0, 1,
-1.327898, -0.6433564, -2.124374, 1, 0.6352941, 0, 1,
-1.324251, -1.308608, -3.281616, 1, 0.6431373, 0, 1,
-1.323021, -0.8016436, -2.786297, 1, 0.6470588, 0, 1,
-1.323018, -0.45647, -3.729816, 1, 0.654902, 0, 1,
-1.316686, 0.1986997, -0.5469643, 1, 0.6588235, 0, 1,
-1.313004, 1.17607, -0.05250924, 1, 0.6666667, 0, 1,
-1.312399, -0.3304823, -1.661671, 1, 0.6705883, 0, 1,
-1.3081, -1.209742, -1.609887, 1, 0.6784314, 0, 1,
-1.307666, 0.529049, -2.164042, 1, 0.682353, 0, 1,
-1.296834, 0.7328435, -2.532705, 1, 0.6901961, 0, 1,
-1.295596, -0.5081775, -0.8684968, 1, 0.6941177, 0, 1,
-1.291741, -0.5039955, -1.445775, 1, 0.7019608, 0, 1,
-1.271079, -3.413076, -2.625058, 1, 0.7098039, 0, 1,
-1.26654, 1.156309, -1.574306, 1, 0.7137255, 0, 1,
-1.263366, -0.6099935, -3.289758, 1, 0.7215686, 0, 1,
-1.260432, 0.2992991, -0.3814018, 1, 0.7254902, 0, 1,
-1.255295, -1.596318, -2.862776, 1, 0.7333333, 0, 1,
-1.251094, -2.393514, -4.034507, 1, 0.7372549, 0, 1,
-1.250454, 0.2135724, 0.05137873, 1, 0.7450981, 0, 1,
-1.247266, -0.4286472, -1.874258, 1, 0.7490196, 0, 1,
-1.238849, -0.6388779, -0.8841504, 1, 0.7568628, 0, 1,
-1.230716, 1.320769, -1.923312, 1, 0.7607843, 0, 1,
-1.227594, -0.5226834, -2.09404, 1, 0.7686275, 0, 1,
-1.226463, -0.4677262, -1.163039, 1, 0.772549, 0, 1,
-1.217095, 1.333936, -0.1438483, 1, 0.7803922, 0, 1,
-1.208235, -0.09057576, -3.279426, 1, 0.7843137, 0, 1,
-1.202365, 1.862242, -0.9069453, 1, 0.7921569, 0, 1,
-1.200807, 0.5644276, -1.80164, 1, 0.7960784, 0, 1,
-1.199696, -0.1844372, -1.280921, 1, 0.8039216, 0, 1,
-1.196196, -1.650076, -1.770894, 1, 0.8117647, 0, 1,
-1.193662, -0.3364994, -2.647568, 1, 0.8156863, 0, 1,
-1.193479, 0.5835248, -0.5250774, 1, 0.8235294, 0, 1,
-1.193305, 0.2990621, -1.226203, 1, 0.827451, 0, 1,
-1.192235, 0.01982429, 0.7741296, 1, 0.8352941, 0, 1,
-1.186652, 1.81642, 0.7790307, 1, 0.8392157, 0, 1,
-1.179147, -0.4500172, -2.179001, 1, 0.8470588, 0, 1,
-1.176921, 0.6137121, -0.6012676, 1, 0.8509804, 0, 1,
-1.168623, 0.02992978, -1.630337, 1, 0.8588235, 0, 1,
-1.158104, -0.5054775, -1.429823, 1, 0.8627451, 0, 1,
-1.14503, 0.3750648, -0.5522549, 1, 0.8705882, 0, 1,
-1.14354, -0.8058992, -3.073763, 1, 0.8745098, 0, 1,
-1.142795, 1.04304, -1.480425, 1, 0.8823529, 0, 1,
-1.137548, 2.119757, -1.672299, 1, 0.8862745, 0, 1,
-1.134848, -0.5228497, -1.408228, 1, 0.8941177, 0, 1,
-1.126154, 1.476008, -0.0003584215, 1, 0.8980392, 0, 1,
-1.114228, -1.0252, -4.695249, 1, 0.9058824, 0, 1,
-1.10267, 0.586776, -2.673226, 1, 0.9137255, 0, 1,
-1.099321, -0.9377841, -1.373241, 1, 0.9176471, 0, 1,
-1.093538, 0.5225739, -0.7353788, 1, 0.9254902, 0, 1,
-1.092462, 0.8824527, 0.4371735, 1, 0.9294118, 0, 1,
-1.083484, -0.9553567, -1.485241, 1, 0.9372549, 0, 1,
-1.080287, 0.001160842, -2.904553, 1, 0.9411765, 0, 1,
-1.078897, 2.025466, 0.3760105, 1, 0.9490196, 0, 1,
-1.073242, 0.2461368, -1.518733, 1, 0.9529412, 0, 1,
-1.073001, -0.9984834, -1.210763, 1, 0.9607843, 0, 1,
-1.066208, -0.02982411, -1.467005, 1, 0.9647059, 0, 1,
-1.063829, 0.3049268, -0.7123541, 1, 0.972549, 0, 1,
-1.061843, 0.8439161, -0.8212961, 1, 0.9764706, 0, 1,
-1.054754, -0.06784018, -2.738199, 1, 0.9843137, 0, 1,
-1.053218, -0.1308178, -1.706064, 1, 0.9882353, 0, 1,
-1.051579, 2.394666, 0.9613416, 1, 0.9960784, 0, 1,
-1.048554, -0.2278231, -1.681213, 0.9960784, 1, 0, 1,
-1.046052, 1.230154, -2.108016, 0.9921569, 1, 0, 1,
-1.044813, -1.192681, -3.084843, 0.9843137, 1, 0, 1,
-1.041638, -0.226111, -4.273706, 0.9803922, 1, 0, 1,
-1.035643, 0.3058355, -2.385605, 0.972549, 1, 0, 1,
-1.030402, 0.4258436, -0.1352149, 0.9686275, 1, 0, 1,
-1.025868, -0.6520433, -4.159004, 0.9607843, 1, 0, 1,
-1.024758, 0.5843239, -1.952143, 0.9568627, 1, 0, 1,
-1.021019, 0.4970263, -1.993628, 0.9490196, 1, 0, 1,
-1.018733, -0.1465953, -2.806696, 0.945098, 1, 0, 1,
-1.009669, 0.8623895, -1.227991, 0.9372549, 1, 0, 1,
-1.008764, -0.9706383, -3.701804, 0.9333333, 1, 0, 1,
-1.006122, -0.5533763, -1.881155, 0.9254902, 1, 0, 1,
-0.9953945, -1.683052, -3.161703, 0.9215686, 1, 0, 1,
-0.9930939, -0.4446912, -0.8443604, 0.9137255, 1, 0, 1,
-0.9904847, -1.513812, -3.989677, 0.9098039, 1, 0, 1,
-0.9882123, 0.3850307, -0.4887073, 0.9019608, 1, 0, 1,
-0.9880053, 0.3839789, -0.7942753, 0.8941177, 1, 0, 1,
-0.9873799, 1.911989, 0.2762295, 0.8901961, 1, 0, 1,
-0.9872844, 0.5228138, -1.459326, 0.8823529, 1, 0, 1,
-0.9839906, -2.131153, -4.845178, 0.8784314, 1, 0, 1,
-0.9743069, 1.014554, -2.160701, 0.8705882, 1, 0, 1,
-0.9723592, -1.235281, -2.476417, 0.8666667, 1, 0, 1,
-0.9717357, -1.424998, -2.930503, 0.8588235, 1, 0, 1,
-0.9682342, 0.3647461, -0.6313885, 0.854902, 1, 0, 1,
-0.949457, 0.8923154, -2.065409, 0.8470588, 1, 0, 1,
-0.948622, -0.3387292, -2.981062, 0.8431373, 1, 0, 1,
-0.9459977, -1.456262, -4.963379, 0.8352941, 1, 0, 1,
-0.9426091, 0.6098442, -0.7008057, 0.8313726, 1, 0, 1,
-0.9411607, -0.4790918, -1.954336, 0.8235294, 1, 0, 1,
-0.9385579, -2.303172, -3.271622, 0.8196079, 1, 0, 1,
-0.9348456, -1.958972, -1.999597, 0.8117647, 1, 0, 1,
-0.924841, 1.763119, 0.5757447, 0.8078431, 1, 0, 1,
-0.9234459, -1.844538, -2.311574, 0.8, 1, 0, 1,
-0.9218892, -1.071084, -0.8519006, 0.7921569, 1, 0, 1,
-0.9183866, -1.517348, -1.446302, 0.7882353, 1, 0, 1,
-0.911818, -0.2857939, -2.000029, 0.7803922, 1, 0, 1,
-0.8980266, -0.3448767, -3.822402, 0.7764706, 1, 0, 1,
-0.8950369, 0.006523772, -1.815787, 0.7686275, 1, 0, 1,
-0.8866972, 1.525923, -1.755637, 0.7647059, 1, 0, 1,
-0.8858634, -0.4842108, -2.477177, 0.7568628, 1, 0, 1,
-0.8811491, -0.3581882, -2.040359, 0.7529412, 1, 0, 1,
-0.8721373, -1.059697, -2.025216, 0.7450981, 1, 0, 1,
-0.8705729, -0.02790575, -1.515442, 0.7411765, 1, 0, 1,
-0.8691043, 0.3532522, -0.5383663, 0.7333333, 1, 0, 1,
-0.8607781, -0.4353098, -2.345178, 0.7294118, 1, 0, 1,
-0.8594506, 0.6104992, -0.943684, 0.7215686, 1, 0, 1,
-0.8544191, 1.991744, 0.5828648, 0.7176471, 1, 0, 1,
-0.8486102, -0.754618, -1.986806, 0.7098039, 1, 0, 1,
-0.8484242, -1.192436, -2.267341, 0.7058824, 1, 0, 1,
-0.8455635, 1.267785, 0.210745, 0.6980392, 1, 0, 1,
-0.8455608, -0.8094347, -1.877819, 0.6901961, 1, 0, 1,
-0.8376621, -0.4819674, -0.9794808, 0.6862745, 1, 0, 1,
-0.8355307, -1.011441, -1.826169, 0.6784314, 1, 0, 1,
-0.8343005, 0.8805371, -2.476626, 0.6745098, 1, 0, 1,
-0.8280999, 0.1852642, -1.917231, 0.6666667, 1, 0, 1,
-0.8279104, -1.973902, -1.851916, 0.6627451, 1, 0, 1,
-0.8270147, 1.560982, -0.9781331, 0.654902, 1, 0, 1,
-0.8266511, 0.1371471, 0.5842853, 0.6509804, 1, 0, 1,
-0.8225635, -0.8772901, -4.540007, 0.6431373, 1, 0, 1,
-0.822167, 0.5999416, -1.213746, 0.6392157, 1, 0, 1,
-0.8202971, -0.08577181, -1.566693, 0.6313726, 1, 0, 1,
-0.8192119, -1.211945, -2.497947, 0.627451, 1, 0, 1,
-0.8190818, 0.7036965, 0.7842868, 0.6196079, 1, 0, 1,
-0.8068712, 0.8798376, -1.052453, 0.6156863, 1, 0, 1,
-0.8056697, -1.280174, -1.890107, 0.6078432, 1, 0, 1,
-0.798371, -0.3570721, -2.873924, 0.6039216, 1, 0, 1,
-0.7944309, 1.8328, -0.02439824, 0.5960785, 1, 0, 1,
-0.7837899, -0.5067093, -2.78394, 0.5882353, 1, 0, 1,
-0.7837463, 0.6639642, -0.4347616, 0.5843138, 1, 0, 1,
-0.7813849, -1.306447, -2.496179, 0.5764706, 1, 0, 1,
-0.7749698, -0.4668923, -1.970099, 0.572549, 1, 0, 1,
-0.769247, 0.6802275, -0.7072564, 0.5647059, 1, 0, 1,
-0.7676834, 0.4800451, 0.2231283, 0.5607843, 1, 0, 1,
-0.7655671, -0.7700754, -1.128656, 0.5529412, 1, 0, 1,
-0.7596475, -0.8094542, -3.956244, 0.5490196, 1, 0, 1,
-0.7550768, 1.935813, 0.8893415, 0.5411765, 1, 0, 1,
-0.7486088, -0.008951243, -1.995717, 0.5372549, 1, 0, 1,
-0.7472063, 0.4683405, -2.696728, 0.5294118, 1, 0, 1,
-0.7410354, 1.136847, -0.7084838, 0.5254902, 1, 0, 1,
-0.7391355, -0.4171034, -2.322377, 0.5176471, 1, 0, 1,
-0.736567, -2.080472, -2.196516, 0.5137255, 1, 0, 1,
-0.7343805, 2.788889, -0.1543837, 0.5058824, 1, 0, 1,
-0.7316272, -0.4078399, -0.6745046, 0.5019608, 1, 0, 1,
-0.7274864, 1.194607, -0.4004069, 0.4941176, 1, 0, 1,
-0.726858, 0.802412, -0.2190772, 0.4862745, 1, 0, 1,
-0.7260282, 2.96958, 1.295509, 0.4823529, 1, 0, 1,
-0.7204708, -0.678626, -2.480239, 0.4745098, 1, 0, 1,
-0.7130243, 1.575337, -1.687505, 0.4705882, 1, 0, 1,
-0.7129724, -0.8846058, -3.629853, 0.4627451, 1, 0, 1,
-0.7054833, 0.8939212, -1.713274, 0.4588235, 1, 0, 1,
-0.7047259, 1.312274, 0.2350669, 0.4509804, 1, 0, 1,
-0.7008066, -0.5639382, -2.36964, 0.4470588, 1, 0, 1,
-0.7001126, 0.4506041, 1.470063, 0.4392157, 1, 0, 1,
-0.6981085, -0.7913448, -2.784227, 0.4352941, 1, 0, 1,
-0.6969529, -0.7539826, -2.054561, 0.427451, 1, 0, 1,
-0.6946438, 0.1029354, -1.133395, 0.4235294, 1, 0, 1,
-0.6928873, -0.5137561, -2.917349, 0.4156863, 1, 0, 1,
-0.6922339, 0.5321231, -0.1815371, 0.4117647, 1, 0, 1,
-0.6891804, -1.337967, -0.822612, 0.4039216, 1, 0, 1,
-0.6886462, 0.2457671, -0.564156, 0.3960784, 1, 0, 1,
-0.6881362, 0.2346744, -1.05937, 0.3921569, 1, 0, 1,
-0.6814216, 0.07584751, 0.01001291, 0.3843137, 1, 0, 1,
-0.6764402, 1.023296, -1.559576, 0.3803922, 1, 0, 1,
-0.6749538, -0.1029383, -1.1122, 0.372549, 1, 0, 1,
-0.6745394, -1.630007, -3.638921, 0.3686275, 1, 0, 1,
-0.6689401, -0.008922053, -3.212348, 0.3607843, 1, 0, 1,
-0.6614166, 0.4788075, -0.2165575, 0.3568628, 1, 0, 1,
-0.6607097, -0.6495865, -1.26191, 0.3490196, 1, 0, 1,
-0.6584544, -1.309028, -0.8599913, 0.345098, 1, 0, 1,
-0.6549536, 1.058341, -0.845382, 0.3372549, 1, 0, 1,
-0.6498052, 1.016546, -0.9996613, 0.3333333, 1, 0, 1,
-0.6344653, 1.074401, 0.1476988, 0.3254902, 1, 0, 1,
-0.6285973, 0.780849, -0.7995049, 0.3215686, 1, 0, 1,
-0.6248826, -0.4168031, -0.7579306, 0.3137255, 1, 0, 1,
-0.6233054, -1.693224, -3.022746, 0.3098039, 1, 0, 1,
-0.6226216, -1.159088, -3.396082, 0.3019608, 1, 0, 1,
-0.610355, 1.042616, 0.01258538, 0.2941177, 1, 0, 1,
-0.6055529, 0.3355942, -3.281947, 0.2901961, 1, 0, 1,
-0.6038432, 0.7160162, -0.3182676, 0.282353, 1, 0, 1,
-0.6023836, 0.05279702, -1.356806, 0.2784314, 1, 0, 1,
-0.5997646, 0.8715233, -0.5843682, 0.2705882, 1, 0, 1,
-0.5942103, -0.09747217, -0.7113016, 0.2666667, 1, 0, 1,
-0.5906276, 0.712866, -1.706309, 0.2588235, 1, 0, 1,
-0.5890138, 0.6534845, -1.971435, 0.254902, 1, 0, 1,
-0.5841445, -1.082768, -2.908087, 0.2470588, 1, 0, 1,
-0.583864, 0.8612705, 0.6873269, 0.2431373, 1, 0, 1,
-0.5822849, -1.68996, -1.561476, 0.2352941, 1, 0, 1,
-0.5797225, 1.057104, -1.165848, 0.2313726, 1, 0, 1,
-0.5653768, 0.3910997, -1.676159, 0.2235294, 1, 0, 1,
-0.5650601, 0.1229912, -2.574412, 0.2196078, 1, 0, 1,
-0.5527012, -0.5474642, -2.667625, 0.2117647, 1, 0, 1,
-0.5485671, -1.098183, -3.326953, 0.2078431, 1, 0, 1,
-0.5480577, 0.6624818, -1.061991, 0.2, 1, 0, 1,
-0.546483, -1.118515, -3.96843, 0.1921569, 1, 0, 1,
-0.5463504, 1.516094, 0.1565745, 0.1882353, 1, 0, 1,
-0.5397764, 2.349307, -2.145777, 0.1803922, 1, 0, 1,
-0.5396534, -0.9802153, -1.759287, 0.1764706, 1, 0, 1,
-0.5362949, -0.9080017, -1.955036, 0.1686275, 1, 0, 1,
-0.5270785, -0.1133386, -1.17086, 0.1647059, 1, 0, 1,
-0.5258517, 1.590605, -0.7404928, 0.1568628, 1, 0, 1,
-0.5253266, 0.03440871, -1.172669, 0.1529412, 1, 0, 1,
-0.5243869, 0.3730623, -1.523298, 0.145098, 1, 0, 1,
-0.5188836, -0.9521381, -3.056883, 0.1411765, 1, 0, 1,
-0.5176504, 0.5258034, -0.6771628, 0.1333333, 1, 0, 1,
-0.5139965, -1.73901, -2.910056, 0.1294118, 1, 0, 1,
-0.5067468, 0.2362161, -3.073276, 0.1215686, 1, 0, 1,
-0.5049326, -0.6540082, -1.493775, 0.1176471, 1, 0, 1,
-0.5030627, 0.4898002, -0.3824891, 0.1098039, 1, 0, 1,
-0.501443, 0.07103924, -1.381328, 0.1058824, 1, 0, 1,
-0.500751, -0.7902899, -1.595501, 0.09803922, 1, 0, 1,
-0.4996791, -0.09772597, -0.2228003, 0.09019608, 1, 0, 1,
-0.4924978, 0.6082121, -1.530465, 0.08627451, 1, 0, 1,
-0.4924873, 1.212984, -0.7429779, 0.07843138, 1, 0, 1,
-0.4916561, -1.593531, -1.849999, 0.07450981, 1, 0, 1,
-0.4885471, -0.7264304, -4.511779, 0.06666667, 1, 0, 1,
-0.4871676, 0.03142979, -1.562613, 0.0627451, 1, 0, 1,
-0.4870309, -0.9540161, -4.265504, 0.05490196, 1, 0, 1,
-0.485793, 1.14672, 0.5010991, 0.05098039, 1, 0, 1,
-0.4788717, -0.1062832, -2.622642, 0.04313726, 1, 0, 1,
-0.473849, -0.6596947, -3.183373, 0.03921569, 1, 0, 1,
-0.4680425, -2.138567, -4.117096, 0.03137255, 1, 0, 1,
-0.463216, 0.7566374, -1.304235, 0.02745098, 1, 0, 1,
-0.4604448, -1.525894, -1.791199, 0.01960784, 1, 0, 1,
-0.4595719, 0.698473, -0.6363082, 0.01568628, 1, 0, 1,
-0.453976, 1.667781, 0.07117667, 0.007843138, 1, 0, 1,
-0.4517145, 0.5213744, -2.514626, 0.003921569, 1, 0, 1,
-0.4408765, 0.8555638, 0.4449414, 0, 1, 0.003921569, 1,
-0.4383667, 0.3618748, -0.9646797, 0, 1, 0.01176471, 1,
-0.4302938, 1.155645, -0.1269645, 0, 1, 0.01568628, 1,
-0.4261385, 0.7077233, -0.8509046, 0, 1, 0.02352941, 1,
-0.4213273, 0.8872136, -0.7089586, 0, 1, 0.02745098, 1,
-0.4210181, -0.5851606, -4.025272, 0, 1, 0.03529412, 1,
-0.4198506, -0.6063811, -2.713519, 0, 1, 0.03921569, 1,
-0.4189059, 0.9553118, 0.6305583, 0, 1, 0.04705882, 1,
-0.4166439, 0.3562406, -1.102592, 0, 1, 0.05098039, 1,
-0.4144385, -0.01615175, -1.983781, 0, 1, 0.05882353, 1,
-0.4081439, 0.1002733, -0.665431, 0, 1, 0.0627451, 1,
-0.4052128, 1.325713, 0.3344797, 0, 1, 0.07058824, 1,
-0.4048237, 0.3886763, 1.28554, 0, 1, 0.07450981, 1,
-0.4031518, 0.08785657, -0.815749, 0, 1, 0.08235294, 1,
-0.3975881, 0.5349673, 0.3057313, 0, 1, 0.08627451, 1,
-0.3937582, 0.1527784, -2.448468, 0, 1, 0.09411765, 1,
-0.3933849, 0.7544327, -1.383181, 0, 1, 0.1019608, 1,
-0.3912801, 0.6932736, 0.7228726, 0, 1, 0.1058824, 1,
-0.390723, 1.111672, -1.204915, 0, 1, 0.1137255, 1,
-0.3891804, -1.198089, -3.713864, 0, 1, 0.1176471, 1,
-0.3864674, -0.07816982, -1.108669, 0, 1, 0.1254902, 1,
-0.3831078, -1.537946, -2.737297, 0, 1, 0.1294118, 1,
-0.3830073, 0.1824527, -0.06372444, 0, 1, 0.1372549, 1,
-0.3766533, -0.2477825, -0.9728298, 0, 1, 0.1411765, 1,
-0.374273, 0.8761588, 0.6638275, 0, 1, 0.1490196, 1,
-0.371014, 1.1691, 0.05892998, 0, 1, 0.1529412, 1,
-0.3675413, -0.1526367, -2.37571, 0, 1, 0.1607843, 1,
-0.3663377, 1.33732, -2.309907, 0, 1, 0.1647059, 1,
-0.3621276, -1.818031, -3.89036, 0, 1, 0.172549, 1,
-0.3559787, 0.3290982, -1.014927, 0, 1, 0.1764706, 1,
-0.351431, 1.657061, -3.570619, 0, 1, 0.1843137, 1,
-0.3503297, -1.58478, -2.628155, 0, 1, 0.1882353, 1,
-0.3468409, -0.1941151, -1.287271, 0, 1, 0.1960784, 1,
-0.3459667, 0.9323199, 0.6206962, 0, 1, 0.2039216, 1,
-0.3459009, 0.5443056, -0.5131299, 0, 1, 0.2078431, 1,
-0.3291819, -2.025287, -4.508843, 0, 1, 0.2156863, 1,
-0.3263543, 0.02002974, -1.879792, 0, 1, 0.2196078, 1,
-0.3256825, 0.1689022, -1.284972, 0, 1, 0.227451, 1,
-0.3239841, 0.2128622, -0.6512492, 0, 1, 0.2313726, 1,
-0.3201528, 0.2607717, 0.440552, 0, 1, 0.2392157, 1,
-0.3201037, -0.3790084, -2.79025, 0, 1, 0.2431373, 1,
-0.3194239, 1.044143, -0.5719995, 0, 1, 0.2509804, 1,
-0.3180747, 0.4647639, -1.402548, 0, 1, 0.254902, 1,
-0.3169037, -0.183311, 0.2054088, 0, 1, 0.2627451, 1,
-0.3165634, 0.2185192, -1.132937, 0, 1, 0.2666667, 1,
-0.3131967, -0.3781544, -2.087807, 0, 1, 0.2745098, 1,
-0.3099506, -0.3617246, -3.155184, 0, 1, 0.2784314, 1,
-0.3095139, -0.2587518, -2.514534, 0, 1, 0.2862745, 1,
-0.3062108, 0.4021287, -0.05729205, 0, 1, 0.2901961, 1,
-0.3062024, -0.6405219, -1.449578, 0, 1, 0.2980392, 1,
-0.3050669, 1.09357, 0.9528036, 0, 1, 0.3058824, 1,
-0.3019282, 1.1875, -0.4831594, 0, 1, 0.3098039, 1,
-0.2978179, -0.4514676, -3.348419, 0, 1, 0.3176471, 1,
-0.2912038, 0.03624405, -0.5965096, 0, 1, 0.3215686, 1,
-0.2899286, 1.468173, -1.024283, 0, 1, 0.3294118, 1,
-0.2885546, 1.302016, -0.675431, 0, 1, 0.3333333, 1,
-0.2880851, -0.5923268, -1.662035, 0, 1, 0.3411765, 1,
-0.2841079, 0.19741, -1.887655, 0, 1, 0.345098, 1,
-0.2834334, 0.2832823, -0.3050487, 0, 1, 0.3529412, 1,
-0.2806346, -1.015313, -3.835728, 0, 1, 0.3568628, 1,
-0.2800254, -0.05426782, -2.014065, 0, 1, 0.3647059, 1,
-0.2792609, -1.447078, -3.232792, 0, 1, 0.3686275, 1,
-0.2781599, -0.6978235, -2.548918, 0, 1, 0.3764706, 1,
-0.2764598, -1.240048, -3.20514, 0, 1, 0.3803922, 1,
-0.2760412, -0.1084, -0.7096579, 0, 1, 0.3882353, 1,
-0.2759104, -0.2239546, -2.114697, 0, 1, 0.3921569, 1,
-0.2731347, 0.176875, 1.079454, 0, 1, 0.4, 1,
-0.2727169, -1.473374, -1.751634, 0, 1, 0.4078431, 1,
-0.2721618, -0.122716, -0.003817727, 0, 1, 0.4117647, 1,
-0.2657462, -0.8549032, -4.417948, 0, 1, 0.4196078, 1,
-0.261004, 0.2253969, -1.833559, 0, 1, 0.4235294, 1,
-0.2606536, -2.46649, -4.250674, 0, 1, 0.4313726, 1,
-0.2598967, -0.3584968, -2.014827, 0, 1, 0.4352941, 1,
-0.2598428, -2.042359, -3.005204, 0, 1, 0.4431373, 1,
-0.259299, 0.4604915, -0.1678384, 0, 1, 0.4470588, 1,
-0.2552801, 1.8074, -0.9761643, 0, 1, 0.454902, 1,
-0.2542174, 1.129441, -0.7162581, 0, 1, 0.4588235, 1,
-0.2536436, 0.9194164, -0.1122628, 0, 1, 0.4666667, 1,
-0.252479, 1.554477, -2.324011, 0, 1, 0.4705882, 1,
-0.2456167, -0.657077, -2.654586, 0, 1, 0.4784314, 1,
-0.2444753, 0.7893069, -0.1807387, 0, 1, 0.4823529, 1,
-0.2436809, -0.1097467, -2.858549, 0, 1, 0.4901961, 1,
-0.2405178, -0.5972932, -1.603489, 0, 1, 0.4941176, 1,
-0.240053, -1.103089, -3.097561, 0, 1, 0.5019608, 1,
-0.2360552, 1.370168, 0.03396659, 0, 1, 0.509804, 1,
-0.2353881, -0.9157121, -2.515364, 0, 1, 0.5137255, 1,
-0.230462, -1.597686, -2.306958, 0, 1, 0.5215687, 1,
-0.2300216, -0.07169689, -1.906288, 0, 1, 0.5254902, 1,
-0.2294959, 0.3584091, -1.512432, 0, 1, 0.5333334, 1,
-0.2267137, 1.249935, -0.02557935, 0, 1, 0.5372549, 1,
-0.2266743, 1.066779, 0.4203563, 0, 1, 0.5450981, 1,
-0.2256205, -0.3372009, -3.070735, 0, 1, 0.5490196, 1,
-0.2228467, 1.058642, 0.5011639, 0, 1, 0.5568628, 1,
-0.2216081, 0.4613464, -0.3384436, 0, 1, 0.5607843, 1,
-0.2175394, 0.723094, -1.776502, 0, 1, 0.5686275, 1,
-0.2172727, -0.3363266, -2.428815, 0, 1, 0.572549, 1,
-0.2171942, -1.565264, -2.133354, 0, 1, 0.5803922, 1,
-0.2151899, 0.9112263, 0.9826568, 0, 1, 0.5843138, 1,
-0.2126455, 0.7780948, 0.3475495, 0, 1, 0.5921569, 1,
-0.2107013, 0.9865488, 2.066229, 0, 1, 0.5960785, 1,
-0.2054102, -0.92434, -3.645777, 0, 1, 0.6039216, 1,
-0.2037363, -0.6137465, -2.30001, 0, 1, 0.6117647, 1,
-0.202156, -0.7557376, -2.16204, 0, 1, 0.6156863, 1,
-0.2017574, 1.070418, 2.529826, 0, 1, 0.6235294, 1,
-0.1951604, -0.9405388, -2.39163, 0, 1, 0.627451, 1,
-0.1852921, -0.02886707, -0.6261355, 0, 1, 0.6352941, 1,
-0.1842753, 1.432454, -0.1824483, 0, 1, 0.6392157, 1,
-0.1822902, 1.468656, 1.004039, 0, 1, 0.6470588, 1,
-0.1817535, 1.987568, -1.938857, 0, 1, 0.6509804, 1,
-0.1773053, 0.3948958, -1.257993, 0, 1, 0.6588235, 1,
-0.1757235, -0.4016472, -2.132337, 0, 1, 0.6627451, 1,
-0.1698724, 0.07281281, -1.266819, 0, 1, 0.6705883, 1,
-0.169589, -2.031593, -3.396686, 0, 1, 0.6745098, 1,
-0.1657208, -0.4814018, -4.133947, 0, 1, 0.682353, 1,
-0.1654625, 0.5132238, -0.7006967, 0, 1, 0.6862745, 1,
-0.1571652, -1.884302, -4.339167, 0, 1, 0.6941177, 1,
-0.1562947, 0.7042835, 0.284174, 0, 1, 0.7019608, 1,
-0.1549919, 0.3924358, 0.2929493, 0, 1, 0.7058824, 1,
-0.1527589, 0.4821063, -0.7529875, 0, 1, 0.7137255, 1,
-0.1526266, -1.213958, -3.321069, 0, 1, 0.7176471, 1,
-0.1526037, 1.675406, -0.1846022, 0, 1, 0.7254902, 1,
-0.1498999, -1.822806, -3.578184, 0, 1, 0.7294118, 1,
-0.149431, -1.948437, -4.216387, 0, 1, 0.7372549, 1,
-0.143941, 1.463196, -1.248297, 0, 1, 0.7411765, 1,
-0.1386398, 0.3987528, 0.3454039, 0, 1, 0.7490196, 1,
-0.1360337, 0.8458853, -0.01046992, 0, 1, 0.7529412, 1,
-0.1341866, -0.629841, -5.584381, 0, 1, 0.7607843, 1,
-0.1295528, -0.4364272, -3.217731, 0, 1, 0.7647059, 1,
-0.1231932, -0.4327094, -2.770596, 0, 1, 0.772549, 1,
-0.121546, -0.4064753, -2.908549, 0, 1, 0.7764706, 1,
-0.117734, 1.53492, -1.784096, 0, 1, 0.7843137, 1,
-0.1166346, -0.1206568, -2.064219, 0, 1, 0.7882353, 1,
-0.1165712, 0.5395867, -0.1408483, 0, 1, 0.7960784, 1,
-0.1123054, 1.203377, -0.9598909, 0, 1, 0.8039216, 1,
-0.103961, -0.2161477, -1.098734, 0, 1, 0.8078431, 1,
-0.1027681, -1.390947, -5.35336, 0, 1, 0.8156863, 1,
-0.1025616, 0.05814387, -1.557196, 0, 1, 0.8196079, 1,
-0.1017081, 0.2477022, -0.3539637, 0, 1, 0.827451, 1,
-0.09877062, -0.2453674, -1.255417, 0, 1, 0.8313726, 1,
-0.09654333, -0.2207946, -3.074234, 0, 1, 0.8392157, 1,
-0.09423172, 0.1529872, 1.110494, 0, 1, 0.8431373, 1,
-0.09394458, -1.551967, -3.14485, 0, 1, 0.8509804, 1,
-0.09043022, 0.04938541, -1.263913, 0, 1, 0.854902, 1,
-0.08742829, -0.7007304, -2.04765, 0, 1, 0.8627451, 1,
-0.08187912, -0.2540001, -3.621341, 0, 1, 0.8666667, 1,
-0.07668548, 0.2670111, -1.936356, 0, 1, 0.8745098, 1,
-0.07595557, 0.697095, 0.006948422, 0, 1, 0.8784314, 1,
-0.07172365, 0.3814476, -0.05845747, 0, 1, 0.8862745, 1,
-0.07033852, 2.105379, 0.9850536, 0, 1, 0.8901961, 1,
-0.06963554, 1.313442, -0.3596441, 0, 1, 0.8980392, 1,
-0.06936756, 0.00938626, 0.3499246, 0, 1, 0.9058824, 1,
-0.06215936, -1.666696, -2.900985, 0, 1, 0.9098039, 1,
-0.06209128, 2.426342, 0.1578474, 0, 1, 0.9176471, 1,
-0.05611594, -0.8073855, -2.293089, 0, 1, 0.9215686, 1,
-0.05172065, 0.3964348, 0.9134909, 0, 1, 0.9294118, 1,
-0.04994342, 0.6053823, -0.6184152, 0, 1, 0.9333333, 1,
-0.04617927, -0.3717897, -2.840056, 0, 1, 0.9411765, 1,
-0.04591699, 0.7522898, -0.4621783, 0, 1, 0.945098, 1,
-0.04370757, 0.1109599, 0.1259332, 0, 1, 0.9529412, 1,
-0.0418198, -0.8908879, -2.704363, 0, 1, 0.9568627, 1,
-0.04131302, -1.063745, -1.833823, 0, 1, 0.9647059, 1,
-0.03943027, 1.515903, -0.9912075, 0, 1, 0.9686275, 1,
-0.03453808, -0.2543844, -3.140017, 0, 1, 0.9764706, 1,
-0.03430948, -1.318195, -4.249874, 0, 1, 0.9803922, 1,
-0.03272023, -0.5971143, -3.834797, 0, 1, 0.9882353, 1,
-0.03129989, -1.331139, -3.105117, 0, 1, 0.9921569, 1,
-0.03059411, 1.688952, 0.6853544, 0, 1, 1, 1,
-0.03017402, -0.7285506, -2.262717, 0, 0.9921569, 1, 1,
-0.02574615, 0.3232037, 1.29388, 0, 0.9882353, 1, 1,
-0.02340495, -1.247785, -2.681737, 0, 0.9803922, 1, 1,
-0.01786093, -0.702523, -4.375765, 0, 0.9764706, 1, 1,
-0.01562041, -0.7839367, -3.019203, 0, 0.9686275, 1, 1,
-0.01501097, -1.520333, -3.837754, 0, 0.9647059, 1, 1,
-0.01202116, -0.1379655, -2.614471, 0, 0.9568627, 1, 1,
-0.009347564, 1.564647, 0.783744, 0, 0.9529412, 1, 1,
-0.005889703, -0.1339361, -4.06265, 0, 0.945098, 1, 1,
-0.00550053, 1.778043, -0.1514574, 0, 0.9411765, 1, 1,
-0.003647664, -0.04271245, -4.817851, 0, 0.9333333, 1, 1,
-0.002841188, 0.7135351, 2.017142, 0, 0.9294118, 1, 1,
-0.0005651788, -0.0666002, -4.231085, 0, 0.9215686, 1, 1,
0.001430617, 1.087477, -1.271435, 0, 0.9176471, 1, 1,
0.007163757, 0.3842541, -0.9795464, 0, 0.9098039, 1, 1,
0.008560481, 0.04864315, 1.44303, 0, 0.9058824, 1, 1,
0.01105262, -0.7622089, 4.969595, 0, 0.8980392, 1, 1,
0.01265198, -0.2432816, 3.297771, 0, 0.8901961, 1, 1,
0.01422969, 1.496551, 0.8439347, 0, 0.8862745, 1, 1,
0.01577312, -0.1243621, 3.11741, 0, 0.8784314, 1, 1,
0.01723785, 0.06968185, -0.1127375, 0, 0.8745098, 1, 1,
0.01818426, -0.03773848, 4.55285, 0, 0.8666667, 1, 1,
0.02049925, -0.9071433, 4.153316, 0, 0.8627451, 1, 1,
0.02063951, 0.7572001, 0.3126816, 0, 0.854902, 1, 1,
0.02633832, -0.5957572, 2.788513, 0, 0.8509804, 1, 1,
0.02709536, -0.1799195, 1.923779, 0, 0.8431373, 1, 1,
0.02756845, 0.6731967, -2.313675, 0, 0.8392157, 1, 1,
0.02771294, 0.3660157, 0.3821822, 0, 0.8313726, 1, 1,
0.03387635, -0.5403171, 3.084815, 0, 0.827451, 1, 1,
0.03406751, -1.76356, 1.548409, 0, 0.8196079, 1, 1,
0.03520343, 0.03234659, 0.6898867, 0, 0.8156863, 1, 1,
0.04483834, -1.635064, 2.335227, 0, 0.8078431, 1, 1,
0.05162005, -0.203384, 2.96898, 0, 0.8039216, 1, 1,
0.05634944, 1.146071, 1.158062, 0, 0.7960784, 1, 1,
0.05862599, 0.4518186, -0.08173567, 0, 0.7882353, 1, 1,
0.05985331, -0.1235859, 1.785665, 0, 0.7843137, 1, 1,
0.06596209, 2.381568, 1.888359, 0, 0.7764706, 1, 1,
0.07019842, 1.343763, 0.4638808, 0, 0.772549, 1, 1,
0.0708152, 3.366076, 1.435523, 0, 0.7647059, 1, 1,
0.07175796, -0.2361802, 4.50242, 0, 0.7607843, 1, 1,
0.0742785, 0.9652353, 0.9445081, 0, 0.7529412, 1, 1,
0.07544855, 1.065398, -1.721168, 0, 0.7490196, 1, 1,
0.07580322, 1.476992, -0.5778939, 0, 0.7411765, 1, 1,
0.08918226, 0.1528163, 2.418473, 0, 0.7372549, 1, 1,
0.09091218, 0.5548584, 0.411915, 0, 0.7294118, 1, 1,
0.09101856, -0.04817886, 2.483142, 0, 0.7254902, 1, 1,
0.09201364, 2.53079, -0.6806095, 0, 0.7176471, 1, 1,
0.09426421, 0.2031456, 0.5230682, 0, 0.7137255, 1, 1,
0.09973887, -1.511128, 2.486818, 0, 0.7058824, 1, 1,
0.1012056, 0.9419441, -1.61183, 0, 0.6980392, 1, 1,
0.107254, 0.5904507, -0.432034, 0, 0.6941177, 1, 1,
0.1076642, 1.745039, -0.1760729, 0, 0.6862745, 1, 1,
0.1102902, -1.373411, 3.175893, 0, 0.682353, 1, 1,
0.1144599, 0.04469177, 0.3457875, 0, 0.6745098, 1, 1,
0.1149166, -0.5701599, 3.887018, 0, 0.6705883, 1, 1,
0.1168818, -0.6997104, 3.144365, 0, 0.6627451, 1, 1,
0.1240169, -1.128029, 2.191784, 0, 0.6588235, 1, 1,
0.1256004, -0.7502472, 3.447537, 0, 0.6509804, 1, 1,
0.1295016, 1.684546, -1.698871, 0, 0.6470588, 1, 1,
0.129549, 0.9660471, -0.7697015, 0, 0.6392157, 1, 1,
0.1299659, -1.058137, 3.299655, 0, 0.6352941, 1, 1,
0.1324477, 0.6595059, 0.08391304, 0, 0.627451, 1, 1,
0.1329908, 0.240078, -1.935381, 0, 0.6235294, 1, 1,
0.1368499, -0.1259508, 1.579957, 0, 0.6156863, 1, 1,
0.1389349, 0.5689111, -0.1268916, 0, 0.6117647, 1, 1,
0.1399514, 0.6569636, 1.280205, 0, 0.6039216, 1, 1,
0.1431384, -1.563201, 4.395063, 0, 0.5960785, 1, 1,
0.1435196, 1.399423, 0.2099506, 0, 0.5921569, 1, 1,
0.1463875, -1.619083, 3.492979, 0, 0.5843138, 1, 1,
0.1543558, -0.422093, 1.534409, 0, 0.5803922, 1, 1,
0.1545369, 0.6685628, 0.3455707, 0, 0.572549, 1, 1,
0.1566291, 0.1254613, 0.4812723, 0, 0.5686275, 1, 1,
0.1569044, -0.1394752, 2.211172, 0, 0.5607843, 1, 1,
0.1578451, 0.356855, -0.5583572, 0, 0.5568628, 1, 1,
0.160164, 2.108052, 1.416194, 0, 0.5490196, 1, 1,
0.1624491, 1.536817, -0.1235446, 0, 0.5450981, 1, 1,
0.1632654, -0.27679, 2.162465, 0, 0.5372549, 1, 1,
0.164833, 0.9942148, -0.8789055, 0, 0.5333334, 1, 1,
0.164834, 1.635075, -0.3272325, 0, 0.5254902, 1, 1,
0.1697699, 0.07223795, 1.586762, 0, 0.5215687, 1, 1,
0.1770858, -0.6342, 3.095788, 0, 0.5137255, 1, 1,
0.1799189, -2.136594, 1.139775, 0, 0.509804, 1, 1,
0.1838968, 0.1964576, 0.8096327, 0, 0.5019608, 1, 1,
0.1862903, 0.316336, -1.162468, 0, 0.4941176, 1, 1,
0.1869821, 0.3418598, 0.9344033, 0, 0.4901961, 1, 1,
0.1875014, -0.4850455, 3.009547, 0, 0.4823529, 1, 1,
0.1889511, 1.033258, 1.104175, 0, 0.4784314, 1, 1,
0.1893265, 0.06454911, 1.266324, 0, 0.4705882, 1, 1,
0.1906421, 0.4946043, -1.616141, 0, 0.4666667, 1, 1,
0.1975188, 1.376615, 1.278417, 0, 0.4588235, 1, 1,
0.198139, -2.356081, 1.582744, 0, 0.454902, 1, 1,
0.1985812, -0.9074043, 2.002603, 0, 0.4470588, 1, 1,
0.2002163, -0.8546058, 3.296119, 0, 0.4431373, 1, 1,
0.2053362, 0.1807557, -0.3418223, 0, 0.4352941, 1, 1,
0.2076616, -0.1874003, 1.833467, 0, 0.4313726, 1, 1,
0.2093096, 0.1368533, 0.524672, 0, 0.4235294, 1, 1,
0.2108451, -0.425156, 4.120193, 0, 0.4196078, 1, 1,
0.2150124, -0.3648288, 3.343637, 0, 0.4117647, 1, 1,
0.2152145, 0.8423607, 0.08332112, 0, 0.4078431, 1, 1,
0.219636, -0.08231528, 0.7150949, 0, 0.4, 1, 1,
0.2211013, -0.9340736, 1.671114, 0, 0.3921569, 1, 1,
0.2225005, 1.156742, 0.79743, 0, 0.3882353, 1, 1,
0.2233043, 2.126037, -1.230464, 0, 0.3803922, 1, 1,
0.2233894, 0.9633199, 0.8468151, 0, 0.3764706, 1, 1,
0.2264042, -0.1238287, 2.16075, 0, 0.3686275, 1, 1,
0.228768, 1.089048, -0.6406364, 0, 0.3647059, 1, 1,
0.2341822, 0.5073876, 2.134586, 0, 0.3568628, 1, 1,
0.2391907, 1.029415, -0.8824053, 0, 0.3529412, 1, 1,
0.2396617, 0.07199124, 0.9840939, 0, 0.345098, 1, 1,
0.2399246, -2.164189, 1.388336, 0, 0.3411765, 1, 1,
0.239934, 0.7984565, -0.6535016, 0, 0.3333333, 1, 1,
0.2439454, 0.5812747, 0.2359265, 0, 0.3294118, 1, 1,
0.2458723, -0.55498, 3.580387, 0, 0.3215686, 1, 1,
0.2489425, -0.8989133, 1.572661, 0, 0.3176471, 1, 1,
0.2568957, 0.02235679, 1.562203, 0, 0.3098039, 1, 1,
0.257004, 0.3564824, 1.119031, 0, 0.3058824, 1, 1,
0.2589616, -0.1317316, 2.658339, 0, 0.2980392, 1, 1,
0.26108, 0.2437092, 2.399462, 0, 0.2901961, 1, 1,
0.2612373, -2.154155, 3.615936, 0, 0.2862745, 1, 1,
0.2613382, -0.4304483, 1.521327, 0, 0.2784314, 1, 1,
0.2657474, 0.05870932, 2.612741, 0, 0.2745098, 1, 1,
0.2663413, 0.08430303, 1.613977, 0, 0.2666667, 1, 1,
0.2689603, -0.6513719, 3.783817, 0, 0.2627451, 1, 1,
0.2728807, -2.021363, 2.396713, 0, 0.254902, 1, 1,
0.2738365, -0.1131314, 1.284011, 0, 0.2509804, 1, 1,
0.2775088, 0.6927003, -1.084765, 0, 0.2431373, 1, 1,
0.2783236, -0.232733, 0.3191622, 0, 0.2392157, 1, 1,
0.2808342, -2.743599, 1.789432, 0, 0.2313726, 1, 1,
0.2835716, 0.6713853, -0.05469971, 0, 0.227451, 1, 1,
0.2854385, -0.02046688, 1.70192, 0, 0.2196078, 1, 1,
0.2857121, -0.285016, 1.911236, 0, 0.2156863, 1, 1,
0.2872824, -0.7879241, 2.916739, 0, 0.2078431, 1, 1,
0.2910889, 0.2415452, 1.466703, 0, 0.2039216, 1, 1,
0.2920099, -0.03747008, 2.43312, 0, 0.1960784, 1, 1,
0.2927296, 1.080124, 0.4141081, 0, 0.1882353, 1, 1,
0.2934916, -0.1509818, 0.2843376, 0, 0.1843137, 1, 1,
0.2981406, -1.139388, 2.845385, 0, 0.1764706, 1, 1,
0.299065, -0.4017267, 1.778781, 0, 0.172549, 1, 1,
0.3067117, 0.3781272, 1.464745, 0, 0.1647059, 1, 1,
0.30832, 0.6588243, 1.549971, 0, 0.1607843, 1, 1,
0.3181677, 1.469711, 0.7546612, 0, 0.1529412, 1, 1,
0.3183384, -0.2589328, 2.160706, 0, 0.1490196, 1, 1,
0.3188708, 1.504732, -0.4249527, 0, 0.1411765, 1, 1,
0.3208137, 1.388176, -1.025885, 0, 0.1372549, 1, 1,
0.3222735, 0.3193657, 0.8089493, 0, 0.1294118, 1, 1,
0.3259465, -0.7360416, 2.453729, 0, 0.1254902, 1, 1,
0.3262228, -0.8051332, 2.364513, 0, 0.1176471, 1, 1,
0.332641, -0.1417971, 1.859133, 0, 0.1137255, 1, 1,
0.334289, -1.041857, 2.292905, 0, 0.1058824, 1, 1,
0.3361195, 2.131382, -0.6149219, 0, 0.09803922, 1, 1,
0.3390325, 0.4875506, -1.664769, 0, 0.09411765, 1, 1,
0.3399483, -0.3108275, 2.941545, 0, 0.08627451, 1, 1,
0.3495729, 0.07976936, 1.976031, 0, 0.08235294, 1, 1,
0.3556344, 0.01213657, 0.2756282, 0, 0.07450981, 1, 1,
0.3562245, -0.03555052, 1.447309, 0, 0.07058824, 1, 1,
0.3601461, -1.077206, 3.643722, 0, 0.0627451, 1, 1,
0.3633626, -1.423584, 2.352287, 0, 0.05882353, 1, 1,
0.3669613, -0.239211, 4.075003, 0, 0.05098039, 1, 1,
0.3673783, 0.9452088, -0.8617419, 0, 0.04705882, 1, 1,
0.3690752, -1.285332, 4.952578, 0, 0.03921569, 1, 1,
0.3699159, 0.4250744, 0.4830284, 0, 0.03529412, 1, 1,
0.3717305, 0.4665531, 0.2783501, 0, 0.02745098, 1, 1,
0.3737771, 0.3906871, 0.06537417, 0, 0.02352941, 1, 1,
0.375534, -0.9144452, 2.711799, 0, 0.01568628, 1, 1,
0.3773188, 0.7506015, -1.360699, 0, 0.01176471, 1, 1,
0.3774787, 0.9463727, -1.239776, 0, 0.003921569, 1, 1,
0.3846635, -1.240805, 1.076047, 0.003921569, 0, 1, 1,
0.3848148, 0.07430455, 2.012646, 0.007843138, 0, 1, 1,
0.3907585, -0.5158182, 2.426344, 0.01568628, 0, 1, 1,
0.3928838, -0.267599, 3.589607, 0.01960784, 0, 1, 1,
0.3941146, -0.5720434, 1.207715, 0.02745098, 0, 1, 1,
0.3960233, -0.3683437, 1.22646, 0.03137255, 0, 1, 1,
0.3986968, 0.2323048, -0.8557909, 0.03921569, 0, 1, 1,
0.4010265, 0.6464741, 1.63833, 0.04313726, 0, 1, 1,
0.401623, 1.490835, 0.5447166, 0.05098039, 0, 1, 1,
0.4021171, 1.128289, -1.056911, 0.05490196, 0, 1, 1,
0.4035266, 0.538756, 1.586339, 0.0627451, 0, 1, 1,
0.404566, 2.346896, 1.595817, 0.06666667, 0, 1, 1,
0.4048337, -0.7200934, 1.829796, 0.07450981, 0, 1, 1,
0.4056245, 0.4760719, -0.3557814, 0.07843138, 0, 1, 1,
0.4083286, -2.415451, 3.36753, 0.08627451, 0, 1, 1,
0.4091593, 1.179839, 0.3017327, 0.09019608, 0, 1, 1,
0.4096714, -0.3661274, 1.820144, 0.09803922, 0, 1, 1,
0.4099925, 0.4909798, 1.724073, 0.1058824, 0, 1, 1,
0.4113835, -2.901723, 2.678241, 0.1098039, 0, 1, 1,
0.4146977, -1.516744, 3.324497, 0.1176471, 0, 1, 1,
0.4147422, 1.496233, -0.3074756, 0.1215686, 0, 1, 1,
0.4155696, 0.7715234, 1.417168, 0.1294118, 0, 1, 1,
0.419221, 1.623921, -0.3742284, 0.1333333, 0, 1, 1,
0.4198397, -0.5099816, 1.743754, 0.1411765, 0, 1, 1,
0.4222907, -1.824524, 2.602236, 0.145098, 0, 1, 1,
0.4268617, 0.09998216, 1.126559, 0.1529412, 0, 1, 1,
0.4297392, 1.251861, 0.4711414, 0.1568628, 0, 1, 1,
0.429769, 0.4311244, 0.03549594, 0.1647059, 0, 1, 1,
0.4319856, -0.5530413, 1.432835, 0.1686275, 0, 1, 1,
0.4330652, -0.06996449, 3.461498, 0.1764706, 0, 1, 1,
0.4340567, 0.6205082, 2.78651, 0.1803922, 0, 1, 1,
0.4385622, -0.1675126, 3.355583, 0.1882353, 0, 1, 1,
0.4397142, 2.099893, 0.2861284, 0.1921569, 0, 1, 1,
0.4418413, -1.00114, 2.866884, 0.2, 0, 1, 1,
0.4424133, -0.4807916, 1.623876, 0.2078431, 0, 1, 1,
0.4430464, -0.4594459, 1.498929, 0.2117647, 0, 1, 1,
0.4612014, -0.4197344, 3.766699, 0.2196078, 0, 1, 1,
0.4617155, -1.043916, 2.510021, 0.2235294, 0, 1, 1,
0.4626615, -0.3340535, 3.191795, 0.2313726, 0, 1, 1,
0.4636821, 0.2503521, 0.596334, 0.2352941, 0, 1, 1,
0.4659459, 0.9524515, 0.2116958, 0.2431373, 0, 1, 1,
0.4682397, -0.1089262, 3.600424, 0.2470588, 0, 1, 1,
0.4738854, -1.108177, 4.146277, 0.254902, 0, 1, 1,
0.4741949, 1.423664, 0.3670412, 0.2588235, 0, 1, 1,
0.4766338, 0.5885727, -1.11845, 0.2666667, 0, 1, 1,
0.479901, -0.3400916, 1.021024, 0.2705882, 0, 1, 1,
0.4829908, 0.04910868, 0.5315206, 0.2784314, 0, 1, 1,
0.4923715, -0.17406, 2.200768, 0.282353, 0, 1, 1,
0.4987751, 0.5037283, 0.974764, 0.2901961, 0, 1, 1,
0.5027017, -0.7039926, 1.913038, 0.2941177, 0, 1, 1,
0.505114, 1.146513, 0.400845, 0.3019608, 0, 1, 1,
0.5074672, 0.2286675, 0.740768, 0.3098039, 0, 1, 1,
0.5080094, -0.4123656, 2.566211, 0.3137255, 0, 1, 1,
0.5142362, 0.7549652, 1.799449, 0.3215686, 0, 1, 1,
0.5192645, -0.4926325, 2.33672, 0.3254902, 0, 1, 1,
0.5206198, 1.312805, 0.119514, 0.3333333, 0, 1, 1,
0.5266202, 0.5294839, 0.461184, 0.3372549, 0, 1, 1,
0.5293048, -1.301967, 2.356027, 0.345098, 0, 1, 1,
0.5307779, 0.1304833, 2.091366, 0.3490196, 0, 1, 1,
0.5310199, -0.5950335, 3.437268, 0.3568628, 0, 1, 1,
0.5334079, 0.8313639, 0.8555288, 0.3607843, 0, 1, 1,
0.5373271, -0.4189367, 2.769635, 0.3686275, 0, 1, 1,
0.538031, -0.6954787, 2.139416, 0.372549, 0, 1, 1,
0.5411033, -1.684519, 2.156147, 0.3803922, 0, 1, 1,
0.5512434, -0.1207825, 2.31146, 0.3843137, 0, 1, 1,
0.5513389, 0.3474631, 0.1592312, 0.3921569, 0, 1, 1,
0.5524903, -0.7724443, 2.966743, 0.3960784, 0, 1, 1,
0.5550945, -1.131091, 4.031136, 0.4039216, 0, 1, 1,
0.5562237, -0.1399851, 0.5130358, 0.4117647, 0, 1, 1,
0.5567726, 1.023277, -0.8278921, 0.4156863, 0, 1, 1,
0.556891, 0.4168715, 1.984261, 0.4235294, 0, 1, 1,
0.5576784, -0.9654352, 0.9271501, 0.427451, 0, 1, 1,
0.5605489, 0.6080081, -0.3473921, 0.4352941, 0, 1, 1,
0.5624328, -0.5408836, 3.895559, 0.4392157, 0, 1, 1,
0.5661014, -0.3615153, 1.350092, 0.4470588, 0, 1, 1,
0.5698291, 1.528076, 0.8632289, 0.4509804, 0, 1, 1,
0.5708402, -0.9873785, 2.491638, 0.4588235, 0, 1, 1,
0.5719702, 0.4458314, 1.055946, 0.4627451, 0, 1, 1,
0.5723279, -0.07002749, 1.274258, 0.4705882, 0, 1, 1,
0.5726597, -0.4756156, 1.757104, 0.4745098, 0, 1, 1,
0.5726809, -0.4670549, 0.811428, 0.4823529, 0, 1, 1,
0.5732082, 0.6849948, 1.027636, 0.4862745, 0, 1, 1,
0.5770184, 1.574822, 1.128972, 0.4941176, 0, 1, 1,
0.5827711, 1.70795, 1.880464, 0.5019608, 0, 1, 1,
0.5867803, 0.8508931, 1.678666, 0.5058824, 0, 1, 1,
0.5908607, -0.3755649, 1.120869, 0.5137255, 0, 1, 1,
0.5912826, 0.5514324, 2.950191, 0.5176471, 0, 1, 1,
0.5919648, -0.7394031, 0.8528501, 0.5254902, 0, 1, 1,
0.5928684, 1.958547, -0.02339441, 0.5294118, 0, 1, 1,
0.5943691, -0.09151825, 2.330522, 0.5372549, 0, 1, 1,
0.5959206, 0.02538837, 0.708442, 0.5411765, 0, 1, 1,
0.5976394, -1.055643, 2.633287, 0.5490196, 0, 1, 1,
0.5988215, 0.9344989, -0.3222418, 0.5529412, 0, 1, 1,
0.6009393, -2.057765, 3.019973, 0.5607843, 0, 1, 1,
0.6010631, -0.4834868, 3.416811, 0.5647059, 0, 1, 1,
0.6019852, 1.261847, 1.094876, 0.572549, 0, 1, 1,
0.6030871, 0.1269921, 0.08741628, 0.5764706, 0, 1, 1,
0.6071616, -0.6476244, 2.933751, 0.5843138, 0, 1, 1,
0.6075686, 0.3138583, 3.061376, 0.5882353, 0, 1, 1,
0.6130239, -0.4559343, 3.87713, 0.5960785, 0, 1, 1,
0.6209009, -0.3458638, 2.670728, 0.6039216, 0, 1, 1,
0.6285685, -1.464696, 3.676484, 0.6078432, 0, 1, 1,
0.6309351, -0.6225364, 0.3766039, 0.6156863, 0, 1, 1,
0.6317111, 0.5491982, 0.2300612, 0.6196079, 0, 1, 1,
0.6354703, -0.1901509, -0.1603848, 0.627451, 0, 1, 1,
0.637574, 0.4621829, 0.6110622, 0.6313726, 0, 1, 1,
0.6425825, -0.03543417, 0.4237501, 0.6392157, 0, 1, 1,
0.6436538, 1.77362, 0.4643978, 0.6431373, 0, 1, 1,
0.6439766, 0.5268546, 2.348723, 0.6509804, 0, 1, 1,
0.6449685, 1.12867, -1.019695, 0.654902, 0, 1, 1,
0.6461196, 0.506357, 0.2491936, 0.6627451, 0, 1, 1,
0.6472784, 2.031615, 0.5248655, 0.6666667, 0, 1, 1,
0.6517244, -0.2205861, 1.309194, 0.6745098, 0, 1, 1,
0.6578737, 0.8940487, 0.2174737, 0.6784314, 0, 1, 1,
0.6580781, -0.2418824, 1.495453, 0.6862745, 0, 1, 1,
0.6581328, -0.6705438, 2.340822, 0.6901961, 0, 1, 1,
0.6605238, -0.7101219, 0.5776653, 0.6980392, 0, 1, 1,
0.6650241, -1.089892, 3.206023, 0.7058824, 0, 1, 1,
0.6714228, -1.347445, 2.286743, 0.7098039, 0, 1, 1,
0.6721293, -0.1256958, 3.485142, 0.7176471, 0, 1, 1,
0.6737294, 1.083594, 0.3698124, 0.7215686, 0, 1, 1,
0.685091, 0.1751339, 1.051991, 0.7294118, 0, 1, 1,
0.6891514, -0.9020445, 4.531289, 0.7333333, 0, 1, 1,
0.6946867, 0.9129327, 0.5210498, 0.7411765, 0, 1, 1,
0.6955898, 1.111892, -1.080602, 0.7450981, 0, 1, 1,
0.6982979, 1.069819, -0.01287674, 0.7529412, 0, 1, 1,
0.7003619, 0.9660954, -0.545424, 0.7568628, 0, 1, 1,
0.7012117, -0.9114127, 1.05133, 0.7647059, 0, 1, 1,
0.7034308, 0.2146044, -0.8491774, 0.7686275, 0, 1, 1,
0.7052456, 0.2979321, 2.000004, 0.7764706, 0, 1, 1,
0.707591, 0.7663018, 1.482858, 0.7803922, 0, 1, 1,
0.7109281, 0.5338954, -0.4313319, 0.7882353, 0, 1, 1,
0.7110596, 0.6998065, 0.8370109, 0.7921569, 0, 1, 1,
0.7131019, -0.6437016, 2.533059, 0.8, 0, 1, 1,
0.7142187, -0.9198933, 2.343115, 0.8078431, 0, 1, 1,
0.7176767, 0.395447, 0.423819, 0.8117647, 0, 1, 1,
0.7184996, -0.6187458, 2.056793, 0.8196079, 0, 1, 1,
0.7279369, 0.3323281, 0.5001917, 0.8235294, 0, 1, 1,
0.7291837, 2.580813, -1.027751, 0.8313726, 0, 1, 1,
0.7309375, -0.286371, 3.366, 0.8352941, 0, 1, 1,
0.7320604, -1.133627, 1.656503, 0.8431373, 0, 1, 1,
0.7323779, -0.07366184, 1.91667, 0.8470588, 0, 1, 1,
0.7350213, 0.6493081, 1.568666, 0.854902, 0, 1, 1,
0.7358286, 1.779491, 1.494264, 0.8588235, 0, 1, 1,
0.7399772, -0.9574133, 2.751263, 0.8666667, 0, 1, 1,
0.7402387, -0.7339169, 0.9684281, 0.8705882, 0, 1, 1,
0.7410219, 0.5418091, 1.775908, 0.8784314, 0, 1, 1,
0.7469267, 0.2954364, 1.16088, 0.8823529, 0, 1, 1,
0.7473546, 0.8993885, -0.3249329, 0.8901961, 0, 1, 1,
0.7507665, -0.119939, 2.270893, 0.8941177, 0, 1, 1,
0.7562554, 1.044097, -0.860343, 0.9019608, 0, 1, 1,
0.7591016, -0.7203905, 2.831003, 0.9098039, 0, 1, 1,
0.7621021, -0.178687, 2.134632, 0.9137255, 0, 1, 1,
0.7645143, -0.1012656, 3.263635, 0.9215686, 0, 1, 1,
0.7678599, -0.6233465, 2.536054, 0.9254902, 0, 1, 1,
0.7717235, 0.9992898, 1.038125, 0.9333333, 0, 1, 1,
0.7767062, -0.0873317, 1.592145, 0.9372549, 0, 1, 1,
0.7786542, -2.029686, 2.986584, 0.945098, 0, 1, 1,
0.7829757, -0.2804803, 2.554835, 0.9490196, 0, 1, 1,
0.7844835, 1.31898, -0.7700781, 0.9568627, 0, 1, 1,
0.7861184, 0.2439473, 0.09668925, 0.9607843, 0, 1, 1,
0.7864548, -1.611129, 2.697109, 0.9686275, 0, 1, 1,
0.7871567, 0.368592, -0.7908928, 0.972549, 0, 1, 1,
0.7991955, 2.091498, 0.7623079, 0.9803922, 0, 1, 1,
0.8083534, 0.5089356, 1.416064, 0.9843137, 0, 1, 1,
0.8121705, -0.2280858, 3.211625, 0.9921569, 0, 1, 1,
0.8145432, 0.0751228, 1.636316, 0.9960784, 0, 1, 1,
0.81505, 2.129934, 0.4091987, 1, 0, 0.9960784, 1,
0.8431443, 1.859625, 0.3918014, 1, 0, 0.9882353, 1,
0.8529813, -0.6066088, 3.784676, 1, 0, 0.9843137, 1,
0.8566231, -0.02046462, 0.9686688, 1, 0, 0.9764706, 1,
0.8589758, -0.7502584, 1.060786, 1, 0, 0.972549, 1,
0.8632522, -1.073793, 4.469583, 1, 0, 0.9647059, 1,
0.8696255, -1.587545, 2.63648, 1, 0, 0.9607843, 1,
0.8736972, -1.834082, 2.618165, 1, 0, 0.9529412, 1,
0.8772694, 0.7057067, 3.795588, 1, 0, 0.9490196, 1,
0.8774753, 0.3454503, 1.702261, 1, 0, 0.9411765, 1,
0.8803715, -0.5545295, 3.016111, 1, 0, 0.9372549, 1,
0.8854637, -0.8221173, 1.516348, 1, 0, 0.9294118, 1,
0.8856156, -0.2716666, 1.286585, 1, 0, 0.9254902, 1,
0.8890912, 1.131183, -1.936446, 1, 0, 0.9176471, 1,
0.8893492, -0.9251598, 2.008073, 1, 0, 0.9137255, 1,
0.8904757, -0.3560911, 1.276477, 1, 0, 0.9058824, 1,
0.8961341, 0.8888354, 0.7024592, 1, 0, 0.9019608, 1,
0.8966005, 0.5614023, 0.003102101, 1, 0, 0.8941177, 1,
0.9004169, 0.8734688, 1.15934, 1, 0, 0.8862745, 1,
0.9009792, -2.253885, 2.461835, 1, 0, 0.8823529, 1,
0.915054, 0.729653, 0.7717012, 1, 0, 0.8745098, 1,
0.9151945, 0.8546072, 0.157122, 1, 0, 0.8705882, 1,
0.9158151, -0.3841912, 1.93376, 1, 0, 0.8627451, 1,
0.9171457, 0.3514338, 1.13367, 1, 0, 0.8588235, 1,
0.9171754, -0.2284963, 2.313799, 1, 0, 0.8509804, 1,
0.9176528, 0.4293841, 2.264856, 1, 0, 0.8470588, 1,
0.9201624, 0.6488495, 1.316311, 1, 0, 0.8392157, 1,
0.923201, -0.6674079, 1.249066, 1, 0, 0.8352941, 1,
0.9283834, -0.1363087, 1.836284, 1, 0, 0.827451, 1,
0.9289693, -1.738717, 2.679542, 1, 0, 0.8235294, 1,
0.9343304, 0.532644, -2.027281, 1, 0, 0.8156863, 1,
0.9361325, -0.1149739, 0.8197114, 1, 0, 0.8117647, 1,
0.9363763, -0.8664872, 2.429969, 1, 0, 0.8039216, 1,
0.9410612, -0.7131841, 2.380655, 1, 0, 0.7960784, 1,
0.9420028, -0.8622123, 1.643245, 1, 0, 0.7921569, 1,
0.949293, -0.423686, 1.178443, 1, 0, 0.7843137, 1,
0.9508862, 0.6357155, 2.062656, 1, 0, 0.7803922, 1,
0.9511479, 0.01263426, 0.6874549, 1, 0, 0.772549, 1,
0.9516734, -0.8494921, 1.844554, 1, 0, 0.7686275, 1,
0.9555727, -0.2335366, 1.577344, 1, 0, 0.7607843, 1,
0.9567806, -1.46841, 2.907581, 1, 0, 0.7568628, 1,
0.959879, 0.09693279, 1.363782, 1, 0, 0.7490196, 1,
0.9611345, 2.569672, -0.49907, 1, 0, 0.7450981, 1,
0.9663947, 0.6123801, 0.6028094, 1, 0, 0.7372549, 1,
0.9745359, -0.5279674, 2.300179, 1, 0, 0.7333333, 1,
0.9957964, 0.601041, 1.665452, 1, 0, 0.7254902, 1,
1.004731, 0.2998631, -0.3966594, 1, 0, 0.7215686, 1,
1.007447, -2.518168, 3.067093, 1, 0, 0.7137255, 1,
1.012415, 1.347267, 1.280294, 1, 0, 0.7098039, 1,
1.024237, -0.5148762, 1.805879, 1, 0, 0.7019608, 1,
1.029624, -0.438524, 2.038937, 1, 0, 0.6941177, 1,
1.031911, -1.285563, 1.772794, 1, 0, 0.6901961, 1,
1.034456, 0.8109731, 0.8247011, 1, 0, 0.682353, 1,
1.035461, 0.7404589, 1.59876, 1, 0, 0.6784314, 1,
1.047541, 1.200282, -1.538953, 1, 0, 0.6705883, 1,
1.049725, 0.8779393, -0.1566691, 1, 0, 0.6666667, 1,
1.051507, 0.1974413, -0.09983951, 1, 0, 0.6588235, 1,
1.054071, 0.5107193, 0.8836793, 1, 0, 0.654902, 1,
1.0571, 0.1015069, 2.031615, 1, 0, 0.6470588, 1,
1.060069, 0.4279709, 1.75429, 1, 0, 0.6431373, 1,
1.060766, 0.3507035, 1.495662, 1, 0, 0.6352941, 1,
1.064836, 0.4848312, 0.8639234, 1, 0, 0.6313726, 1,
1.07714, 1.102298, 2.163559, 1, 0, 0.6235294, 1,
1.077404, -1.454399, 2.988578, 1, 0, 0.6196079, 1,
1.081876, -0.7977387, 2.300895, 1, 0, 0.6117647, 1,
1.086091, -1.209617, 1.867788, 1, 0, 0.6078432, 1,
1.09186, -1.59772, 3.584309, 1, 0, 0.6, 1,
1.103184, 2.039204, 0.3033732, 1, 0, 0.5921569, 1,
1.106465, -1.227718, 3.188555, 1, 0, 0.5882353, 1,
1.107767, 1.780689, 1.200441, 1, 0, 0.5803922, 1,
1.113418, 1.329829, 0.8737396, 1, 0, 0.5764706, 1,
1.12005, 0.08913494, 1.203578, 1, 0, 0.5686275, 1,
1.120465, -2.052405, 3.822899, 1, 0, 0.5647059, 1,
1.134939, -0.03078236, 1.321355, 1, 0, 0.5568628, 1,
1.136443, 2.111987, 0.09779534, 1, 0, 0.5529412, 1,
1.14393, -2.23076, 1.682712, 1, 0, 0.5450981, 1,
1.148288, -1.386466, 2.518688, 1, 0, 0.5411765, 1,
1.159945, -0.5850873, 3.351027, 1, 0, 0.5333334, 1,
1.168222, -2.244012, 3.459311, 1, 0, 0.5294118, 1,
1.179049, 0.5595653, 2.048076, 1, 0, 0.5215687, 1,
1.182508, 0.08518273, 0.9264899, 1, 0, 0.5176471, 1,
1.185119, 1.646603, 0.8831134, 1, 0, 0.509804, 1,
1.191114, 0.09425139, 2.688425, 1, 0, 0.5058824, 1,
1.196137, -1.177873, 4.097598, 1, 0, 0.4980392, 1,
1.196871, -0.8194773, 1.564951, 1, 0, 0.4901961, 1,
1.206385, 0.1292461, 0.187359, 1, 0, 0.4862745, 1,
1.208715, 0.3143783, 2.239754, 1, 0, 0.4784314, 1,
1.229153, 2.312303, 1.48065, 1, 0, 0.4745098, 1,
1.230995, 0.5579771, 1.89155, 1, 0, 0.4666667, 1,
1.23501, 0.01571106, 1.213202, 1, 0, 0.4627451, 1,
1.237621, -0.2101091, 2.672759, 1, 0, 0.454902, 1,
1.247545, -0.2718924, 1.617472, 1, 0, 0.4509804, 1,
1.257247, 0.4948343, 0.5284912, 1, 0, 0.4431373, 1,
1.257767, 0.6050644, 0.9525091, 1, 0, 0.4392157, 1,
1.2676, 0.3107322, 1.372916, 1, 0, 0.4313726, 1,
1.268263, 1.328104, 0.1638728, 1, 0, 0.427451, 1,
1.276042, 0.5819342, -0.2070027, 1, 0, 0.4196078, 1,
1.279273, 0.8788282, 2.280083, 1, 0, 0.4156863, 1,
1.282125, -0.6619392, 1.750061, 1, 0, 0.4078431, 1,
1.306364, -1.69274, 2.777486, 1, 0, 0.4039216, 1,
1.30846, -0.3512023, 1.069683, 1, 0, 0.3960784, 1,
1.309013, 1.021513, 1.404136, 1, 0, 0.3882353, 1,
1.321293, 0.7557514, 0.9036748, 1, 0, 0.3843137, 1,
1.343065, 0.141047, -1.582876, 1, 0, 0.3764706, 1,
1.367508, -0.798619, 2.945571, 1, 0, 0.372549, 1,
1.374149, -0.1894309, 3.461409, 1, 0, 0.3647059, 1,
1.381547, 0.1191155, 0.1917769, 1, 0, 0.3607843, 1,
1.382994, 1.325239, 0.9712651, 1, 0, 0.3529412, 1,
1.383446, 0.1886415, 2.622958, 1, 0, 0.3490196, 1,
1.384461, 0.6719561, 0.7878091, 1, 0, 0.3411765, 1,
1.390935, -0.1314267, 0.8923753, 1, 0, 0.3372549, 1,
1.399334, -0.04978476, 3.233816, 1, 0, 0.3294118, 1,
1.40185, -0.7605192, 2.437486, 1, 0, 0.3254902, 1,
1.401992, 1.918307, 0.6725588, 1, 0, 0.3176471, 1,
1.41518, 0.4590997, 0.4348296, 1, 0, 0.3137255, 1,
1.424414, 1.414792, -0.03210121, 1, 0, 0.3058824, 1,
1.42879, -0.1664976, 2.341308, 1, 0, 0.2980392, 1,
1.434505, -0.1350103, 1.913714, 1, 0, 0.2941177, 1,
1.436788, -0.8842603, 1.051108, 1, 0, 0.2862745, 1,
1.444491, 2.572423, 1.750074, 1, 0, 0.282353, 1,
1.486194, -1.299463, 2.210758, 1, 0, 0.2745098, 1,
1.490324, -2.303863, 4.75108, 1, 0, 0.2705882, 1,
1.496507, -0.9361802, 2.508833, 1, 0, 0.2627451, 1,
1.500726, 0.4320632, 1.136161, 1, 0, 0.2588235, 1,
1.509924, -2.059637, 1.42859, 1, 0, 0.2509804, 1,
1.510648, -0.4250408, 2.722428, 1, 0, 0.2470588, 1,
1.51662, -1.711858, 3.177839, 1, 0, 0.2392157, 1,
1.518808, 1.191753, 1.745847, 1, 0, 0.2352941, 1,
1.519664, -0.2588842, 0.9824056, 1, 0, 0.227451, 1,
1.525974, 0.8838722, 1.705472, 1, 0, 0.2235294, 1,
1.531169, 1.328534, -0.922277, 1, 0, 0.2156863, 1,
1.564139, -0.09644527, 1.261479, 1, 0, 0.2117647, 1,
1.585774, -0.5484816, 2.163409, 1, 0, 0.2039216, 1,
1.605865, -1.040059, 2.942083, 1, 0, 0.1960784, 1,
1.607914, 0.7747243, 1.485715, 1, 0, 0.1921569, 1,
1.61329, -0.563715, 2.007087, 1, 0, 0.1843137, 1,
1.627144, 0.7039268, 1.037533, 1, 0, 0.1803922, 1,
1.636146, 1.211328, -0.5986911, 1, 0, 0.172549, 1,
1.63738, 1.334613, 0.6816273, 1, 0, 0.1686275, 1,
1.655602, 0.4253022, 0.03706241, 1, 0, 0.1607843, 1,
1.69511, 0.1866391, 0.1335573, 1, 0, 0.1568628, 1,
1.708549, 0.7761791, 1.915737, 1, 0, 0.1490196, 1,
1.730814, 0.5313174, 0.6967693, 1, 0, 0.145098, 1,
1.766271, 1.016369, 0.9864479, 1, 0, 0.1372549, 1,
1.790238, 0.6859758, 1.748846, 1, 0, 0.1333333, 1,
1.823832, 0.5656636, 1.61429, 1, 0, 0.1254902, 1,
1.872889, 0.1150236, 1.954145, 1, 0, 0.1215686, 1,
1.883864, -0.3719113, 2.324323, 1, 0, 0.1137255, 1,
1.906362, -0.6158003, 1.442919, 1, 0, 0.1098039, 1,
1.944747, 0.8997057, 1.760928, 1, 0, 0.1019608, 1,
1.950584, 0.8564888, 1.772537, 1, 0, 0.09411765, 1,
2.006344, -0.7325699, 1.087333, 1, 0, 0.09019608, 1,
2.012896, 1.723891, 2.149671, 1, 0, 0.08235294, 1,
2.01947, -0.5547342, 0.9255255, 1, 0, 0.07843138, 1,
2.021172, -2.400359, 1.525858, 1, 0, 0.07058824, 1,
2.079475, 0.3964524, 1.746784, 1, 0, 0.06666667, 1,
2.095728, -0.746557, 1.790516, 1, 0, 0.05882353, 1,
2.123492, 0.6230887, 0.6399773, 1, 0, 0.05490196, 1,
2.282663, -1.523495, 2.530109, 1, 0, 0.04705882, 1,
2.309856, 1.288539, 0.3405707, 1, 0, 0.04313726, 1,
2.399239, -0.2762132, 1.528911, 1, 0, 0.03529412, 1,
2.586566, -1.150681, 1.809434, 1, 0, 0.03137255, 1,
2.619162, -0.3156673, 0.9496351, 1, 0, 0.02352941, 1,
2.811239, 1.529464, 1.632435, 1, 0, 0.01960784, 1,
2.894064, 1.028418, 2.485556, 1, 0, 0.01176471, 1,
2.955444, 0.3362032, 1.243786, 1, 0, 0.007843138, 1
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
-0.6754361, -4.562142, -7.37328, 0, -0.5, 0.5, 0.5,
-0.6754361, -4.562142, -7.37328, 1, -0.5, 0.5, 0.5,
-0.6754361, -4.562142, -7.37328, 1, 1.5, 0.5, 0.5,
-0.6754361, -4.562142, -7.37328, 0, 1.5, 0.5, 0.5
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
-5.537185, -0.02350032, -7.37328, 0, -0.5, 0.5, 0.5,
-5.537185, -0.02350032, -7.37328, 1, -0.5, 0.5, 0.5,
-5.537185, -0.02350032, -7.37328, 1, 1.5, 0.5, 0.5,
-5.537185, -0.02350032, -7.37328, 0, 1.5, 0.5, 0.5
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
-5.537185, -4.562142, -0.3073931, 0, -0.5, 0.5, 0.5,
-5.537185, -4.562142, -0.3073931, 1, -0.5, 0.5, 0.5,
-5.537185, -4.562142, -0.3073931, 1, 1.5, 0.5, 0.5,
-5.537185, -4.562142, -0.3073931, 0, 1.5, 0.5, 0.5
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
-4, -3.514763, -5.742691,
2, -3.514763, -5.742691,
-4, -3.514763, -5.742691,
-4, -3.689327, -6.014456,
-2, -3.514763, -5.742691,
-2, -3.689327, -6.014456,
0, -3.514763, -5.742691,
0, -3.689327, -6.014456,
2, -3.514763, -5.742691,
2, -3.689327, -6.014456
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
"-4",
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
-4, -4.038453, -6.557985, 0, -0.5, 0.5, 0.5,
-4, -4.038453, -6.557985, 1, -0.5, 0.5, 0.5,
-4, -4.038453, -6.557985, 1, 1.5, 0.5, 0.5,
-4, -4.038453, -6.557985, 0, 1.5, 0.5, 0.5,
-2, -4.038453, -6.557985, 0, -0.5, 0.5, 0.5,
-2, -4.038453, -6.557985, 1, -0.5, 0.5, 0.5,
-2, -4.038453, -6.557985, 1, 1.5, 0.5, 0.5,
-2, -4.038453, -6.557985, 0, 1.5, 0.5, 0.5,
0, -4.038453, -6.557985, 0, -0.5, 0.5, 0.5,
0, -4.038453, -6.557985, 1, -0.5, 0.5, 0.5,
0, -4.038453, -6.557985, 1, 1.5, 0.5, 0.5,
0, -4.038453, -6.557985, 0, 1.5, 0.5, 0.5,
2, -4.038453, -6.557985, 0, -0.5, 0.5, 0.5,
2, -4.038453, -6.557985, 1, -0.5, 0.5, 0.5,
2, -4.038453, -6.557985, 1, 1.5, 0.5, 0.5,
2, -4.038453, -6.557985, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.415243, -3, -5.742691,
-4.415243, 3, -5.742691,
-4.415243, -3, -5.742691,
-4.602233, -3, -6.014456,
-4.415243, -2, -5.742691,
-4.602233, -2, -6.014456,
-4.415243, -1, -5.742691,
-4.602233, -1, -6.014456,
-4.415243, 0, -5.742691,
-4.602233, 0, -6.014456,
-4.415243, 1, -5.742691,
-4.602233, 1, -6.014456,
-4.415243, 2, -5.742691,
-4.602233, 2, -6.014456,
-4.415243, 3, -5.742691,
-4.602233, 3, -6.014456
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
-4.976214, -3, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, -3, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, -3, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, -3, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, -2, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, -2, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, -2, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, -2, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, -1, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, -1, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, -1, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, -1, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, 0, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, 0, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, 0, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, 0, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, 1, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, 1, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, 1, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, 1, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, 2, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, 2, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, 2, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, 2, -6.557985, 0, 1.5, 0.5, 0.5,
-4.976214, 3, -6.557985, 0, -0.5, 0.5, 0.5,
-4.976214, 3, -6.557985, 1, -0.5, 0.5, 0.5,
-4.976214, 3, -6.557985, 1, 1.5, 0.5, 0.5,
-4.976214, 3, -6.557985, 0, 1.5, 0.5, 0.5
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
-4.415243, -3.514763, -4,
-4.415243, -3.514763, 4,
-4.415243, -3.514763, -4,
-4.602233, -3.689327, -4,
-4.415243, -3.514763, -2,
-4.602233, -3.689327, -2,
-4.415243, -3.514763, 0,
-4.602233, -3.689327, 0,
-4.415243, -3.514763, 2,
-4.602233, -3.689327, 2,
-4.415243, -3.514763, 4,
-4.602233, -3.689327, 4
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
-4.976214, -4.038453, -4, 0, -0.5, 0.5, 0.5,
-4.976214, -4.038453, -4, 1, -0.5, 0.5, 0.5,
-4.976214, -4.038453, -4, 1, 1.5, 0.5, 0.5,
-4.976214, -4.038453, -4, 0, 1.5, 0.5, 0.5,
-4.976214, -4.038453, -2, 0, -0.5, 0.5, 0.5,
-4.976214, -4.038453, -2, 1, -0.5, 0.5, 0.5,
-4.976214, -4.038453, -2, 1, 1.5, 0.5, 0.5,
-4.976214, -4.038453, -2, 0, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 0, 0, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 0, 1, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 0, 1, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 0, 0, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 2, 0, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 2, 1, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 2, 1, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 2, 0, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 4, 0, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 4, 1, -0.5, 0.5, 0.5,
-4.976214, -4.038453, 4, 1, 1.5, 0.5, 0.5,
-4.976214, -4.038453, 4, 0, 1.5, 0.5, 0.5
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
-4.415243, -3.514763, -5.742691,
-4.415243, 3.467763, -5.742691,
-4.415243, -3.514763, 5.127904,
-4.415243, 3.467763, 5.127904,
-4.415243, -3.514763, -5.742691,
-4.415243, -3.514763, 5.127904,
-4.415243, 3.467763, -5.742691,
-4.415243, 3.467763, 5.127904,
-4.415243, -3.514763, -5.742691,
3.06437, -3.514763, -5.742691,
-4.415243, -3.514763, 5.127904,
3.06437, -3.514763, 5.127904,
-4.415243, 3.467763, -5.742691,
3.06437, 3.467763, -5.742691,
-4.415243, 3.467763, 5.127904,
3.06437, 3.467763, 5.127904,
3.06437, -3.514763, -5.742691,
3.06437, 3.467763, -5.742691,
3.06437, -3.514763, 5.127904,
3.06437, 3.467763, 5.127904,
3.06437, -3.514763, -5.742691,
3.06437, -3.514763, 5.127904,
3.06437, 3.467763, -5.742691,
3.06437, 3.467763, 5.127904
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
var radius = 7.971708;
var distance = 35.46703;
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
mvMatrix.translate( 0.6754361, 0.02350032, 0.3073931 );
mvMatrix.scale( 1.152355, 1.234391, 0.7928882 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46703);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
mefluidide<-read.table("mefluidide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefluidide$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
y<-mefluidide$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
```

```r
z<-mefluidide$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefluidide' not found
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
-4.306316, 0.2110902, -1.263682, 0, 0, 1, 1, 1,
-3.22045, -0.05474719, -0.9928337, 1, 0, 0, 1, 1,
-2.847065, 0.1271415, -2.22568, 1, 0, 0, 1, 1,
-2.688019, 1.367514, -0.7317134, 1, 0, 0, 1, 1,
-2.477777, -0.9677275, -2.506794, 1, 0, 0, 1, 1,
-2.435244, 0.9379482, -0.04111249, 1, 0, 0, 1, 1,
-2.427442, -0.06346082, -2.4753, 0, 0, 0, 1, 1,
-2.425542, -1.139704, -1.826984, 0, 0, 0, 1, 1,
-2.412671, 0.6244212, -2.435713, 0, 0, 0, 1, 1,
-2.363464, -1.000135, -0.9971862, 0, 0, 0, 1, 1,
-2.331627, 1.124777, -1.031338, 0, 0, 0, 1, 1,
-2.287305, -0.7096123, -2.273295, 0, 0, 0, 1, 1,
-2.285755, -0.3942418, -2.3403, 0, 0, 0, 1, 1,
-2.277105, -0.2024841, -2.041347, 1, 1, 1, 1, 1,
-2.230641, 0.127514, -1.620142, 1, 1, 1, 1, 1,
-2.196262, -0.488693, -2.096708, 1, 1, 1, 1, 1,
-2.16941, -0.04490773, -1.037257, 1, 1, 1, 1, 1,
-2.167982, -0.4125565, -2.48285, 1, 1, 1, 1, 1,
-2.161609, -1.385596, -0.6219299, 1, 1, 1, 1, 1,
-2.14084, 1.022152, 0.3916713, 1, 1, 1, 1, 1,
-2.120621, -1.226844, -2.263181, 1, 1, 1, 1, 1,
-2.099155, -1.687991, -1.061384, 1, 1, 1, 1, 1,
-2.076983, 0.7724335, -1.733892, 1, 1, 1, 1, 1,
-2.055851, 1.154426, -1.632696, 1, 1, 1, 1, 1,
-2.028512, 1.625771, -1.175502, 1, 1, 1, 1, 1,
-2.022575, -0.5656076, -1.34945, 1, 1, 1, 1, 1,
-2.01416, -1.624502, -1.747025, 1, 1, 1, 1, 1,
-2.009319, -1.372997, -2.810941, 1, 1, 1, 1, 1,
-1.951209, -0.4289556, -1.487334, 0, 0, 1, 1, 1,
-1.933076, -0.43951, -1.924516, 1, 0, 0, 1, 1,
-1.915466, 0.8391492, -0.01913607, 1, 0, 0, 1, 1,
-1.896351, -0.7697347, -2.412271, 1, 0, 0, 1, 1,
-1.885917, -0.5669821, -2.043502, 1, 0, 0, 1, 1,
-1.88026, 0.4811948, -2.227923, 1, 0, 0, 1, 1,
-1.865381, -0.1563839, -0.7770728, 0, 0, 0, 1, 1,
-1.855057, 0.2855514, -2.582584, 0, 0, 0, 1, 1,
-1.832513, -0.688161, -4.918105, 0, 0, 0, 1, 1,
-1.818072, -0.1318464, -0.6528092, 0, 0, 0, 1, 1,
-1.808173, -0.7066898, -4.005663, 0, 0, 0, 1, 1,
-1.801061, 0.96773, -3.634806, 0, 0, 0, 1, 1,
-1.795158, 0.8252233, -1.060369, 0, 0, 0, 1, 1,
-1.769566, 0.3707022, -2.650518, 1, 1, 1, 1, 1,
-1.76953, -0.8025957, -3.089285, 1, 1, 1, 1, 1,
-1.768871, 0.9064269, -2.500371, 1, 1, 1, 1, 1,
-1.767273, -0.2530212, -1.02099, 1, 1, 1, 1, 1,
-1.758574, -0.7863059, -3.595937, 1, 1, 1, 1, 1,
-1.75676, 0.3195972, -1.854012, 1, 1, 1, 1, 1,
-1.755833, -0.2176249, -1.800506, 1, 1, 1, 1, 1,
-1.735107, -0.2277973, -1.573161, 1, 1, 1, 1, 1,
-1.727677, 0.3119176, -1.810755, 1, 1, 1, 1, 1,
-1.72649, -0.461422, -1.894544, 1, 1, 1, 1, 1,
-1.725345, -0.4068838, -0.4978569, 1, 1, 1, 1, 1,
-1.724408, -0.3051603, -1.731296, 1, 1, 1, 1, 1,
-1.717799, -0.7220213, -1.684561, 1, 1, 1, 1, 1,
-1.712488, 0.3500077, -2.451744, 1, 1, 1, 1, 1,
-1.701725, 1.580545, -2.852832, 1, 1, 1, 1, 1,
-1.699016, 0.5367805, -0.563669, 0, 0, 1, 1, 1,
-1.697471, -1.109022, -1.74454, 1, 0, 0, 1, 1,
-1.693132, -0.1611791, -1.935116, 1, 0, 0, 1, 1,
-1.680258, -0.4549086, -2.182788, 1, 0, 0, 1, 1,
-1.680223, -2.724567, -3.241422, 1, 0, 0, 1, 1,
-1.675817, -1.248878, -2.138497, 1, 0, 0, 1, 1,
-1.672253, -0.02686188, -1.174614, 0, 0, 0, 1, 1,
-1.669445, -1.318668, -1.253596, 0, 0, 0, 1, 1,
-1.660867, -0.01294026, -3.527942, 0, 0, 0, 1, 1,
-1.655675, 0.9560524, -1.708409, 0, 0, 0, 1, 1,
-1.650394, -1.607308, -0.2065678, 0, 0, 0, 1, 1,
-1.61164, 2.275149, -0.07597166, 0, 0, 0, 1, 1,
-1.609793, -0.4657561, -1.148636, 0, 0, 0, 1, 1,
-1.609526, -0.9571896, -3.482666, 1, 1, 1, 1, 1,
-1.587921, 0.9702505, -1.416349, 1, 1, 1, 1, 1,
-1.579105, -0.7404046, 0.06178042, 1, 1, 1, 1, 1,
-1.577183, -0.2226975, -2.150791, 1, 1, 1, 1, 1,
-1.555601, 0.2091269, -2.335208, 1, 1, 1, 1, 1,
-1.554693, 0.373405, 0.7128293, 1, 1, 1, 1, 1,
-1.550767, 1.931257, 0.415967, 1, 1, 1, 1, 1,
-1.541981, 0.1909409, -0.4765603, 1, 1, 1, 1, 1,
-1.530567, -1.288922, -1.988457, 1, 1, 1, 1, 1,
-1.522872, 0.5102972, -1.587563, 1, 1, 1, 1, 1,
-1.517411, 0.7544824, -0.3518155, 1, 1, 1, 1, 1,
-1.506074, -0.8009713, -0.1399092, 1, 1, 1, 1, 1,
-1.499694, 1.020852, 0.7374098, 1, 1, 1, 1, 1,
-1.4996, -0.3753281, -3.307344, 1, 1, 1, 1, 1,
-1.483279, 2.749108, 0.7733169, 1, 1, 1, 1, 1,
-1.483126, 0.8822497, -0.5784048, 0, 0, 1, 1, 1,
-1.48287, 0.8899469, -1.919255, 1, 0, 0, 1, 1,
-1.470066, 0.1259506, -1.36608, 1, 0, 0, 1, 1,
-1.46539, -0.3528304, -1.101013, 1, 0, 0, 1, 1,
-1.456787, 0.3583061, -1.013747, 1, 0, 0, 1, 1,
-1.446921, -0.1301137, -0.7280222, 1, 0, 0, 1, 1,
-1.441518, -1.139658, -2.131075, 0, 0, 0, 1, 1,
-1.433828, 0.4628741, -2.899508, 0, 0, 0, 1, 1,
-1.414559, 0.1991541, -0.4627247, 0, 0, 0, 1, 1,
-1.410071, 0.8662416, 0.03287984, 0, 0, 0, 1, 1,
-1.394149, -1.163345, -2.902845, 0, 0, 0, 1, 1,
-1.380921, 0.9754091, 0.5872157, 0, 0, 0, 1, 1,
-1.379227, 0.5171512, -0.9576027, 0, 0, 0, 1, 1,
-1.371232, 1.579292, -3.095233, 1, 1, 1, 1, 1,
-1.364491, 1.897628, -2.455071, 1, 1, 1, 1, 1,
-1.359089, -0.6855835, -2.115351, 1, 1, 1, 1, 1,
-1.355149, -0.6562783, -4.069928, 1, 1, 1, 1, 1,
-1.348635, 1.282379, -0.6890292, 1, 1, 1, 1, 1,
-1.34687, -0.5662096, -2.186839, 1, 1, 1, 1, 1,
-1.346292, -0.03057776, -1.073904, 1, 1, 1, 1, 1,
-1.334267, 0.1415333, -1.651741, 1, 1, 1, 1, 1,
-1.327931, -0.07181042, -1.661147, 1, 1, 1, 1, 1,
-1.327898, -0.6433564, -2.124374, 1, 1, 1, 1, 1,
-1.324251, -1.308608, -3.281616, 1, 1, 1, 1, 1,
-1.323021, -0.8016436, -2.786297, 1, 1, 1, 1, 1,
-1.323018, -0.45647, -3.729816, 1, 1, 1, 1, 1,
-1.316686, 0.1986997, -0.5469643, 1, 1, 1, 1, 1,
-1.313004, 1.17607, -0.05250924, 1, 1, 1, 1, 1,
-1.312399, -0.3304823, -1.661671, 0, 0, 1, 1, 1,
-1.3081, -1.209742, -1.609887, 1, 0, 0, 1, 1,
-1.307666, 0.529049, -2.164042, 1, 0, 0, 1, 1,
-1.296834, 0.7328435, -2.532705, 1, 0, 0, 1, 1,
-1.295596, -0.5081775, -0.8684968, 1, 0, 0, 1, 1,
-1.291741, -0.5039955, -1.445775, 1, 0, 0, 1, 1,
-1.271079, -3.413076, -2.625058, 0, 0, 0, 1, 1,
-1.26654, 1.156309, -1.574306, 0, 0, 0, 1, 1,
-1.263366, -0.6099935, -3.289758, 0, 0, 0, 1, 1,
-1.260432, 0.2992991, -0.3814018, 0, 0, 0, 1, 1,
-1.255295, -1.596318, -2.862776, 0, 0, 0, 1, 1,
-1.251094, -2.393514, -4.034507, 0, 0, 0, 1, 1,
-1.250454, 0.2135724, 0.05137873, 0, 0, 0, 1, 1,
-1.247266, -0.4286472, -1.874258, 1, 1, 1, 1, 1,
-1.238849, -0.6388779, -0.8841504, 1, 1, 1, 1, 1,
-1.230716, 1.320769, -1.923312, 1, 1, 1, 1, 1,
-1.227594, -0.5226834, -2.09404, 1, 1, 1, 1, 1,
-1.226463, -0.4677262, -1.163039, 1, 1, 1, 1, 1,
-1.217095, 1.333936, -0.1438483, 1, 1, 1, 1, 1,
-1.208235, -0.09057576, -3.279426, 1, 1, 1, 1, 1,
-1.202365, 1.862242, -0.9069453, 1, 1, 1, 1, 1,
-1.200807, 0.5644276, -1.80164, 1, 1, 1, 1, 1,
-1.199696, -0.1844372, -1.280921, 1, 1, 1, 1, 1,
-1.196196, -1.650076, -1.770894, 1, 1, 1, 1, 1,
-1.193662, -0.3364994, -2.647568, 1, 1, 1, 1, 1,
-1.193479, 0.5835248, -0.5250774, 1, 1, 1, 1, 1,
-1.193305, 0.2990621, -1.226203, 1, 1, 1, 1, 1,
-1.192235, 0.01982429, 0.7741296, 1, 1, 1, 1, 1,
-1.186652, 1.81642, 0.7790307, 0, 0, 1, 1, 1,
-1.179147, -0.4500172, -2.179001, 1, 0, 0, 1, 1,
-1.176921, 0.6137121, -0.6012676, 1, 0, 0, 1, 1,
-1.168623, 0.02992978, -1.630337, 1, 0, 0, 1, 1,
-1.158104, -0.5054775, -1.429823, 1, 0, 0, 1, 1,
-1.14503, 0.3750648, -0.5522549, 1, 0, 0, 1, 1,
-1.14354, -0.8058992, -3.073763, 0, 0, 0, 1, 1,
-1.142795, 1.04304, -1.480425, 0, 0, 0, 1, 1,
-1.137548, 2.119757, -1.672299, 0, 0, 0, 1, 1,
-1.134848, -0.5228497, -1.408228, 0, 0, 0, 1, 1,
-1.126154, 1.476008, -0.0003584215, 0, 0, 0, 1, 1,
-1.114228, -1.0252, -4.695249, 0, 0, 0, 1, 1,
-1.10267, 0.586776, -2.673226, 0, 0, 0, 1, 1,
-1.099321, -0.9377841, -1.373241, 1, 1, 1, 1, 1,
-1.093538, 0.5225739, -0.7353788, 1, 1, 1, 1, 1,
-1.092462, 0.8824527, 0.4371735, 1, 1, 1, 1, 1,
-1.083484, -0.9553567, -1.485241, 1, 1, 1, 1, 1,
-1.080287, 0.001160842, -2.904553, 1, 1, 1, 1, 1,
-1.078897, 2.025466, 0.3760105, 1, 1, 1, 1, 1,
-1.073242, 0.2461368, -1.518733, 1, 1, 1, 1, 1,
-1.073001, -0.9984834, -1.210763, 1, 1, 1, 1, 1,
-1.066208, -0.02982411, -1.467005, 1, 1, 1, 1, 1,
-1.063829, 0.3049268, -0.7123541, 1, 1, 1, 1, 1,
-1.061843, 0.8439161, -0.8212961, 1, 1, 1, 1, 1,
-1.054754, -0.06784018, -2.738199, 1, 1, 1, 1, 1,
-1.053218, -0.1308178, -1.706064, 1, 1, 1, 1, 1,
-1.051579, 2.394666, 0.9613416, 1, 1, 1, 1, 1,
-1.048554, -0.2278231, -1.681213, 1, 1, 1, 1, 1,
-1.046052, 1.230154, -2.108016, 0, 0, 1, 1, 1,
-1.044813, -1.192681, -3.084843, 1, 0, 0, 1, 1,
-1.041638, -0.226111, -4.273706, 1, 0, 0, 1, 1,
-1.035643, 0.3058355, -2.385605, 1, 0, 0, 1, 1,
-1.030402, 0.4258436, -0.1352149, 1, 0, 0, 1, 1,
-1.025868, -0.6520433, -4.159004, 1, 0, 0, 1, 1,
-1.024758, 0.5843239, -1.952143, 0, 0, 0, 1, 1,
-1.021019, 0.4970263, -1.993628, 0, 0, 0, 1, 1,
-1.018733, -0.1465953, -2.806696, 0, 0, 0, 1, 1,
-1.009669, 0.8623895, -1.227991, 0, 0, 0, 1, 1,
-1.008764, -0.9706383, -3.701804, 0, 0, 0, 1, 1,
-1.006122, -0.5533763, -1.881155, 0, 0, 0, 1, 1,
-0.9953945, -1.683052, -3.161703, 0, 0, 0, 1, 1,
-0.9930939, -0.4446912, -0.8443604, 1, 1, 1, 1, 1,
-0.9904847, -1.513812, -3.989677, 1, 1, 1, 1, 1,
-0.9882123, 0.3850307, -0.4887073, 1, 1, 1, 1, 1,
-0.9880053, 0.3839789, -0.7942753, 1, 1, 1, 1, 1,
-0.9873799, 1.911989, 0.2762295, 1, 1, 1, 1, 1,
-0.9872844, 0.5228138, -1.459326, 1, 1, 1, 1, 1,
-0.9839906, -2.131153, -4.845178, 1, 1, 1, 1, 1,
-0.9743069, 1.014554, -2.160701, 1, 1, 1, 1, 1,
-0.9723592, -1.235281, -2.476417, 1, 1, 1, 1, 1,
-0.9717357, -1.424998, -2.930503, 1, 1, 1, 1, 1,
-0.9682342, 0.3647461, -0.6313885, 1, 1, 1, 1, 1,
-0.949457, 0.8923154, -2.065409, 1, 1, 1, 1, 1,
-0.948622, -0.3387292, -2.981062, 1, 1, 1, 1, 1,
-0.9459977, -1.456262, -4.963379, 1, 1, 1, 1, 1,
-0.9426091, 0.6098442, -0.7008057, 1, 1, 1, 1, 1,
-0.9411607, -0.4790918, -1.954336, 0, 0, 1, 1, 1,
-0.9385579, -2.303172, -3.271622, 1, 0, 0, 1, 1,
-0.9348456, -1.958972, -1.999597, 1, 0, 0, 1, 1,
-0.924841, 1.763119, 0.5757447, 1, 0, 0, 1, 1,
-0.9234459, -1.844538, -2.311574, 1, 0, 0, 1, 1,
-0.9218892, -1.071084, -0.8519006, 1, 0, 0, 1, 1,
-0.9183866, -1.517348, -1.446302, 0, 0, 0, 1, 1,
-0.911818, -0.2857939, -2.000029, 0, 0, 0, 1, 1,
-0.8980266, -0.3448767, -3.822402, 0, 0, 0, 1, 1,
-0.8950369, 0.006523772, -1.815787, 0, 0, 0, 1, 1,
-0.8866972, 1.525923, -1.755637, 0, 0, 0, 1, 1,
-0.8858634, -0.4842108, -2.477177, 0, 0, 0, 1, 1,
-0.8811491, -0.3581882, -2.040359, 0, 0, 0, 1, 1,
-0.8721373, -1.059697, -2.025216, 1, 1, 1, 1, 1,
-0.8705729, -0.02790575, -1.515442, 1, 1, 1, 1, 1,
-0.8691043, 0.3532522, -0.5383663, 1, 1, 1, 1, 1,
-0.8607781, -0.4353098, -2.345178, 1, 1, 1, 1, 1,
-0.8594506, 0.6104992, -0.943684, 1, 1, 1, 1, 1,
-0.8544191, 1.991744, 0.5828648, 1, 1, 1, 1, 1,
-0.8486102, -0.754618, -1.986806, 1, 1, 1, 1, 1,
-0.8484242, -1.192436, -2.267341, 1, 1, 1, 1, 1,
-0.8455635, 1.267785, 0.210745, 1, 1, 1, 1, 1,
-0.8455608, -0.8094347, -1.877819, 1, 1, 1, 1, 1,
-0.8376621, -0.4819674, -0.9794808, 1, 1, 1, 1, 1,
-0.8355307, -1.011441, -1.826169, 1, 1, 1, 1, 1,
-0.8343005, 0.8805371, -2.476626, 1, 1, 1, 1, 1,
-0.8280999, 0.1852642, -1.917231, 1, 1, 1, 1, 1,
-0.8279104, -1.973902, -1.851916, 1, 1, 1, 1, 1,
-0.8270147, 1.560982, -0.9781331, 0, 0, 1, 1, 1,
-0.8266511, 0.1371471, 0.5842853, 1, 0, 0, 1, 1,
-0.8225635, -0.8772901, -4.540007, 1, 0, 0, 1, 1,
-0.822167, 0.5999416, -1.213746, 1, 0, 0, 1, 1,
-0.8202971, -0.08577181, -1.566693, 1, 0, 0, 1, 1,
-0.8192119, -1.211945, -2.497947, 1, 0, 0, 1, 1,
-0.8190818, 0.7036965, 0.7842868, 0, 0, 0, 1, 1,
-0.8068712, 0.8798376, -1.052453, 0, 0, 0, 1, 1,
-0.8056697, -1.280174, -1.890107, 0, 0, 0, 1, 1,
-0.798371, -0.3570721, -2.873924, 0, 0, 0, 1, 1,
-0.7944309, 1.8328, -0.02439824, 0, 0, 0, 1, 1,
-0.7837899, -0.5067093, -2.78394, 0, 0, 0, 1, 1,
-0.7837463, 0.6639642, -0.4347616, 0, 0, 0, 1, 1,
-0.7813849, -1.306447, -2.496179, 1, 1, 1, 1, 1,
-0.7749698, -0.4668923, -1.970099, 1, 1, 1, 1, 1,
-0.769247, 0.6802275, -0.7072564, 1, 1, 1, 1, 1,
-0.7676834, 0.4800451, 0.2231283, 1, 1, 1, 1, 1,
-0.7655671, -0.7700754, -1.128656, 1, 1, 1, 1, 1,
-0.7596475, -0.8094542, -3.956244, 1, 1, 1, 1, 1,
-0.7550768, 1.935813, 0.8893415, 1, 1, 1, 1, 1,
-0.7486088, -0.008951243, -1.995717, 1, 1, 1, 1, 1,
-0.7472063, 0.4683405, -2.696728, 1, 1, 1, 1, 1,
-0.7410354, 1.136847, -0.7084838, 1, 1, 1, 1, 1,
-0.7391355, -0.4171034, -2.322377, 1, 1, 1, 1, 1,
-0.736567, -2.080472, -2.196516, 1, 1, 1, 1, 1,
-0.7343805, 2.788889, -0.1543837, 1, 1, 1, 1, 1,
-0.7316272, -0.4078399, -0.6745046, 1, 1, 1, 1, 1,
-0.7274864, 1.194607, -0.4004069, 1, 1, 1, 1, 1,
-0.726858, 0.802412, -0.2190772, 0, 0, 1, 1, 1,
-0.7260282, 2.96958, 1.295509, 1, 0, 0, 1, 1,
-0.7204708, -0.678626, -2.480239, 1, 0, 0, 1, 1,
-0.7130243, 1.575337, -1.687505, 1, 0, 0, 1, 1,
-0.7129724, -0.8846058, -3.629853, 1, 0, 0, 1, 1,
-0.7054833, 0.8939212, -1.713274, 1, 0, 0, 1, 1,
-0.7047259, 1.312274, 0.2350669, 0, 0, 0, 1, 1,
-0.7008066, -0.5639382, -2.36964, 0, 0, 0, 1, 1,
-0.7001126, 0.4506041, 1.470063, 0, 0, 0, 1, 1,
-0.6981085, -0.7913448, -2.784227, 0, 0, 0, 1, 1,
-0.6969529, -0.7539826, -2.054561, 0, 0, 0, 1, 1,
-0.6946438, 0.1029354, -1.133395, 0, 0, 0, 1, 1,
-0.6928873, -0.5137561, -2.917349, 0, 0, 0, 1, 1,
-0.6922339, 0.5321231, -0.1815371, 1, 1, 1, 1, 1,
-0.6891804, -1.337967, -0.822612, 1, 1, 1, 1, 1,
-0.6886462, 0.2457671, -0.564156, 1, 1, 1, 1, 1,
-0.6881362, 0.2346744, -1.05937, 1, 1, 1, 1, 1,
-0.6814216, 0.07584751, 0.01001291, 1, 1, 1, 1, 1,
-0.6764402, 1.023296, -1.559576, 1, 1, 1, 1, 1,
-0.6749538, -0.1029383, -1.1122, 1, 1, 1, 1, 1,
-0.6745394, -1.630007, -3.638921, 1, 1, 1, 1, 1,
-0.6689401, -0.008922053, -3.212348, 1, 1, 1, 1, 1,
-0.6614166, 0.4788075, -0.2165575, 1, 1, 1, 1, 1,
-0.6607097, -0.6495865, -1.26191, 1, 1, 1, 1, 1,
-0.6584544, -1.309028, -0.8599913, 1, 1, 1, 1, 1,
-0.6549536, 1.058341, -0.845382, 1, 1, 1, 1, 1,
-0.6498052, 1.016546, -0.9996613, 1, 1, 1, 1, 1,
-0.6344653, 1.074401, 0.1476988, 1, 1, 1, 1, 1,
-0.6285973, 0.780849, -0.7995049, 0, 0, 1, 1, 1,
-0.6248826, -0.4168031, -0.7579306, 1, 0, 0, 1, 1,
-0.6233054, -1.693224, -3.022746, 1, 0, 0, 1, 1,
-0.6226216, -1.159088, -3.396082, 1, 0, 0, 1, 1,
-0.610355, 1.042616, 0.01258538, 1, 0, 0, 1, 1,
-0.6055529, 0.3355942, -3.281947, 1, 0, 0, 1, 1,
-0.6038432, 0.7160162, -0.3182676, 0, 0, 0, 1, 1,
-0.6023836, 0.05279702, -1.356806, 0, 0, 0, 1, 1,
-0.5997646, 0.8715233, -0.5843682, 0, 0, 0, 1, 1,
-0.5942103, -0.09747217, -0.7113016, 0, 0, 0, 1, 1,
-0.5906276, 0.712866, -1.706309, 0, 0, 0, 1, 1,
-0.5890138, 0.6534845, -1.971435, 0, 0, 0, 1, 1,
-0.5841445, -1.082768, -2.908087, 0, 0, 0, 1, 1,
-0.583864, 0.8612705, 0.6873269, 1, 1, 1, 1, 1,
-0.5822849, -1.68996, -1.561476, 1, 1, 1, 1, 1,
-0.5797225, 1.057104, -1.165848, 1, 1, 1, 1, 1,
-0.5653768, 0.3910997, -1.676159, 1, 1, 1, 1, 1,
-0.5650601, 0.1229912, -2.574412, 1, 1, 1, 1, 1,
-0.5527012, -0.5474642, -2.667625, 1, 1, 1, 1, 1,
-0.5485671, -1.098183, -3.326953, 1, 1, 1, 1, 1,
-0.5480577, 0.6624818, -1.061991, 1, 1, 1, 1, 1,
-0.546483, -1.118515, -3.96843, 1, 1, 1, 1, 1,
-0.5463504, 1.516094, 0.1565745, 1, 1, 1, 1, 1,
-0.5397764, 2.349307, -2.145777, 1, 1, 1, 1, 1,
-0.5396534, -0.9802153, -1.759287, 1, 1, 1, 1, 1,
-0.5362949, -0.9080017, -1.955036, 1, 1, 1, 1, 1,
-0.5270785, -0.1133386, -1.17086, 1, 1, 1, 1, 1,
-0.5258517, 1.590605, -0.7404928, 1, 1, 1, 1, 1,
-0.5253266, 0.03440871, -1.172669, 0, 0, 1, 1, 1,
-0.5243869, 0.3730623, -1.523298, 1, 0, 0, 1, 1,
-0.5188836, -0.9521381, -3.056883, 1, 0, 0, 1, 1,
-0.5176504, 0.5258034, -0.6771628, 1, 0, 0, 1, 1,
-0.5139965, -1.73901, -2.910056, 1, 0, 0, 1, 1,
-0.5067468, 0.2362161, -3.073276, 1, 0, 0, 1, 1,
-0.5049326, -0.6540082, -1.493775, 0, 0, 0, 1, 1,
-0.5030627, 0.4898002, -0.3824891, 0, 0, 0, 1, 1,
-0.501443, 0.07103924, -1.381328, 0, 0, 0, 1, 1,
-0.500751, -0.7902899, -1.595501, 0, 0, 0, 1, 1,
-0.4996791, -0.09772597, -0.2228003, 0, 0, 0, 1, 1,
-0.4924978, 0.6082121, -1.530465, 0, 0, 0, 1, 1,
-0.4924873, 1.212984, -0.7429779, 0, 0, 0, 1, 1,
-0.4916561, -1.593531, -1.849999, 1, 1, 1, 1, 1,
-0.4885471, -0.7264304, -4.511779, 1, 1, 1, 1, 1,
-0.4871676, 0.03142979, -1.562613, 1, 1, 1, 1, 1,
-0.4870309, -0.9540161, -4.265504, 1, 1, 1, 1, 1,
-0.485793, 1.14672, 0.5010991, 1, 1, 1, 1, 1,
-0.4788717, -0.1062832, -2.622642, 1, 1, 1, 1, 1,
-0.473849, -0.6596947, -3.183373, 1, 1, 1, 1, 1,
-0.4680425, -2.138567, -4.117096, 1, 1, 1, 1, 1,
-0.463216, 0.7566374, -1.304235, 1, 1, 1, 1, 1,
-0.4604448, -1.525894, -1.791199, 1, 1, 1, 1, 1,
-0.4595719, 0.698473, -0.6363082, 1, 1, 1, 1, 1,
-0.453976, 1.667781, 0.07117667, 1, 1, 1, 1, 1,
-0.4517145, 0.5213744, -2.514626, 1, 1, 1, 1, 1,
-0.4408765, 0.8555638, 0.4449414, 1, 1, 1, 1, 1,
-0.4383667, 0.3618748, -0.9646797, 1, 1, 1, 1, 1,
-0.4302938, 1.155645, -0.1269645, 0, 0, 1, 1, 1,
-0.4261385, 0.7077233, -0.8509046, 1, 0, 0, 1, 1,
-0.4213273, 0.8872136, -0.7089586, 1, 0, 0, 1, 1,
-0.4210181, -0.5851606, -4.025272, 1, 0, 0, 1, 1,
-0.4198506, -0.6063811, -2.713519, 1, 0, 0, 1, 1,
-0.4189059, 0.9553118, 0.6305583, 1, 0, 0, 1, 1,
-0.4166439, 0.3562406, -1.102592, 0, 0, 0, 1, 1,
-0.4144385, -0.01615175, -1.983781, 0, 0, 0, 1, 1,
-0.4081439, 0.1002733, -0.665431, 0, 0, 0, 1, 1,
-0.4052128, 1.325713, 0.3344797, 0, 0, 0, 1, 1,
-0.4048237, 0.3886763, 1.28554, 0, 0, 0, 1, 1,
-0.4031518, 0.08785657, -0.815749, 0, 0, 0, 1, 1,
-0.3975881, 0.5349673, 0.3057313, 0, 0, 0, 1, 1,
-0.3937582, 0.1527784, -2.448468, 1, 1, 1, 1, 1,
-0.3933849, 0.7544327, -1.383181, 1, 1, 1, 1, 1,
-0.3912801, 0.6932736, 0.7228726, 1, 1, 1, 1, 1,
-0.390723, 1.111672, -1.204915, 1, 1, 1, 1, 1,
-0.3891804, -1.198089, -3.713864, 1, 1, 1, 1, 1,
-0.3864674, -0.07816982, -1.108669, 1, 1, 1, 1, 1,
-0.3831078, -1.537946, -2.737297, 1, 1, 1, 1, 1,
-0.3830073, 0.1824527, -0.06372444, 1, 1, 1, 1, 1,
-0.3766533, -0.2477825, -0.9728298, 1, 1, 1, 1, 1,
-0.374273, 0.8761588, 0.6638275, 1, 1, 1, 1, 1,
-0.371014, 1.1691, 0.05892998, 1, 1, 1, 1, 1,
-0.3675413, -0.1526367, -2.37571, 1, 1, 1, 1, 1,
-0.3663377, 1.33732, -2.309907, 1, 1, 1, 1, 1,
-0.3621276, -1.818031, -3.89036, 1, 1, 1, 1, 1,
-0.3559787, 0.3290982, -1.014927, 1, 1, 1, 1, 1,
-0.351431, 1.657061, -3.570619, 0, 0, 1, 1, 1,
-0.3503297, -1.58478, -2.628155, 1, 0, 0, 1, 1,
-0.3468409, -0.1941151, -1.287271, 1, 0, 0, 1, 1,
-0.3459667, 0.9323199, 0.6206962, 1, 0, 0, 1, 1,
-0.3459009, 0.5443056, -0.5131299, 1, 0, 0, 1, 1,
-0.3291819, -2.025287, -4.508843, 1, 0, 0, 1, 1,
-0.3263543, 0.02002974, -1.879792, 0, 0, 0, 1, 1,
-0.3256825, 0.1689022, -1.284972, 0, 0, 0, 1, 1,
-0.3239841, 0.2128622, -0.6512492, 0, 0, 0, 1, 1,
-0.3201528, 0.2607717, 0.440552, 0, 0, 0, 1, 1,
-0.3201037, -0.3790084, -2.79025, 0, 0, 0, 1, 1,
-0.3194239, 1.044143, -0.5719995, 0, 0, 0, 1, 1,
-0.3180747, 0.4647639, -1.402548, 0, 0, 0, 1, 1,
-0.3169037, -0.183311, 0.2054088, 1, 1, 1, 1, 1,
-0.3165634, 0.2185192, -1.132937, 1, 1, 1, 1, 1,
-0.3131967, -0.3781544, -2.087807, 1, 1, 1, 1, 1,
-0.3099506, -0.3617246, -3.155184, 1, 1, 1, 1, 1,
-0.3095139, -0.2587518, -2.514534, 1, 1, 1, 1, 1,
-0.3062108, 0.4021287, -0.05729205, 1, 1, 1, 1, 1,
-0.3062024, -0.6405219, -1.449578, 1, 1, 1, 1, 1,
-0.3050669, 1.09357, 0.9528036, 1, 1, 1, 1, 1,
-0.3019282, 1.1875, -0.4831594, 1, 1, 1, 1, 1,
-0.2978179, -0.4514676, -3.348419, 1, 1, 1, 1, 1,
-0.2912038, 0.03624405, -0.5965096, 1, 1, 1, 1, 1,
-0.2899286, 1.468173, -1.024283, 1, 1, 1, 1, 1,
-0.2885546, 1.302016, -0.675431, 1, 1, 1, 1, 1,
-0.2880851, -0.5923268, -1.662035, 1, 1, 1, 1, 1,
-0.2841079, 0.19741, -1.887655, 1, 1, 1, 1, 1,
-0.2834334, 0.2832823, -0.3050487, 0, 0, 1, 1, 1,
-0.2806346, -1.015313, -3.835728, 1, 0, 0, 1, 1,
-0.2800254, -0.05426782, -2.014065, 1, 0, 0, 1, 1,
-0.2792609, -1.447078, -3.232792, 1, 0, 0, 1, 1,
-0.2781599, -0.6978235, -2.548918, 1, 0, 0, 1, 1,
-0.2764598, -1.240048, -3.20514, 1, 0, 0, 1, 1,
-0.2760412, -0.1084, -0.7096579, 0, 0, 0, 1, 1,
-0.2759104, -0.2239546, -2.114697, 0, 0, 0, 1, 1,
-0.2731347, 0.176875, 1.079454, 0, 0, 0, 1, 1,
-0.2727169, -1.473374, -1.751634, 0, 0, 0, 1, 1,
-0.2721618, -0.122716, -0.003817727, 0, 0, 0, 1, 1,
-0.2657462, -0.8549032, -4.417948, 0, 0, 0, 1, 1,
-0.261004, 0.2253969, -1.833559, 0, 0, 0, 1, 1,
-0.2606536, -2.46649, -4.250674, 1, 1, 1, 1, 1,
-0.2598967, -0.3584968, -2.014827, 1, 1, 1, 1, 1,
-0.2598428, -2.042359, -3.005204, 1, 1, 1, 1, 1,
-0.259299, 0.4604915, -0.1678384, 1, 1, 1, 1, 1,
-0.2552801, 1.8074, -0.9761643, 1, 1, 1, 1, 1,
-0.2542174, 1.129441, -0.7162581, 1, 1, 1, 1, 1,
-0.2536436, 0.9194164, -0.1122628, 1, 1, 1, 1, 1,
-0.252479, 1.554477, -2.324011, 1, 1, 1, 1, 1,
-0.2456167, -0.657077, -2.654586, 1, 1, 1, 1, 1,
-0.2444753, 0.7893069, -0.1807387, 1, 1, 1, 1, 1,
-0.2436809, -0.1097467, -2.858549, 1, 1, 1, 1, 1,
-0.2405178, -0.5972932, -1.603489, 1, 1, 1, 1, 1,
-0.240053, -1.103089, -3.097561, 1, 1, 1, 1, 1,
-0.2360552, 1.370168, 0.03396659, 1, 1, 1, 1, 1,
-0.2353881, -0.9157121, -2.515364, 1, 1, 1, 1, 1,
-0.230462, -1.597686, -2.306958, 0, 0, 1, 1, 1,
-0.2300216, -0.07169689, -1.906288, 1, 0, 0, 1, 1,
-0.2294959, 0.3584091, -1.512432, 1, 0, 0, 1, 1,
-0.2267137, 1.249935, -0.02557935, 1, 0, 0, 1, 1,
-0.2266743, 1.066779, 0.4203563, 1, 0, 0, 1, 1,
-0.2256205, -0.3372009, -3.070735, 1, 0, 0, 1, 1,
-0.2228467, 1.058642, 0.5011639, 0, 0, 0, 1, 1,
-0.2216081, 0.4613464, -0.3384436, 0, 0, 0, 1, 1,
-0.2175394, 0.723094, -1.776502, 0, 0, 0, 1, 1,
-0.2172727, -0.3363266, -2.428815, 0, 0, 0, 1, 1,
-0.2171942, -1.565264, -2.133354, 0, 0, 0, 1, 1,
-0.2151899, 0.9112263, 0.9826568, 0, 0, 0, 1, 1,
-0.2126455, 0.7780948, 0.3475495, 0, 0, 0, 1, 1,
-0.2107013, 0.9865488, 2.066229, 1, 1, 1, 1, 1,
-0.2054102, -0.92434, -3.645777, 1, 1, 1, 1, 1,
-0.2037363, -0.6137465, -2.30001, 1, 1, 1, 1, 1,
-0.202156, -0.7557376, -2.16204, 1, 1, 1, 1, 1,
-0.2017574, 1.070418, 2.529826, 1, 1, 1, 1, 1,
-0.1951604, -0.9405388, -2.39163, 1, 1, 1, 1, 1,
-0.1852921, -0.02886707, -0.6261355, 1, 1, 1, 1, 1,
-0.1842753, 1.432454, -0.1824483, 1, 1, 1, 1, 1,
-0.1822902, 1.468656, 1.004039, 1, 1, 1, 1, 1,
-0.1817535, 1.987568, -1.938857, 1, 1, 1, 1, 1,
-0.1773053, 0.3948958, -1.257993, 1, 1, 1, 1, 1,
-0.1757235, -0.4016472, -2.132337, 1, 1, 1, 1, 1,
-0.1698724, 0.07281281, -1.266819, 1, 1, 1, 1, 1,
-0.169589, -2.031593, -3.396686, 1, 1, 1, 1, 1,
-0.1657208, -0.4814018, -4.133947, 1, 1, 1, 1, 1,
-0.1654625, 0.5132238, -0.7006967, 0, 0, 1, 1, 1,
-0.1571652, -1.884302, -4.339167, 1, 0, 0, 1, 1,
-0.1562947, 0.7042835, 0.284174, 1, 0, 0, 1, 1,
-0.1549919, 0.3924358, 0.2929493, 1, 0, 0, 1, 1,
-0.1527589, 0.4821063, -0.7529875, 1, 0, 0, 1, 1,
-0.1526266, -1.213958, -3.321069, 1, 0, 0, 1, 1,
-0.1526037, 1.675406, -0.1846022, 0, 0, 0, 1, 1,
-0.1498999, -1.822806, -3.578184, 0, 0, 0, 1, 1,
-0.149431, -1.948437, -4.216387, 0, 0, 0, 1, 1,
-0.143941, 1.463196, -1.248297, 0, 0, 0, 1, 1,
-0.1386398, 0.3987528, 0.3454039, 0, 0, 0, 1, 1,
-0.1360337, 0.8458853, -0.01046992, 0, 0, 0, 1, 1,
-0.1341866, -0.629841, -5.584381, 0, 0, 0, 1, 1,
-0.1295528, -0.4364272, -3.217731, 1, 1, 1, 1, 1,
-0.1231932, -0.4327094, -2.770596, 1, 1, 1, 1, 1,
-0.121546, -0.4064753, -2.908549, 1, 1, 1, 1, 1,
-0.117734, 1.53492, -1.784096, 1, 1, 1, 1, 1,
-0.1166346, -0.1206568, -2.064219, 1, 1, 1, 1, 1,
-0.1165712, 0.5395867, -0.1408483, 1, 1, 1, 1, 1,
-0.1123054, 1.203377, -0.9598909, 1, 1, 1, 1, 1,
-0.103961, -0.2161477, -1.098734, 1, 1, 1, 1, 1,
-0.1027681, -1.390947, -5.35336, 1, 1, 1, 1, 1,
-0.1025616, 0.05814387, -1.557196, 1, 1, 1, 1, 1,
-0.1017081, 0.2477022, -0.3539637, 1, 1, 1, 1, 1,
-0.09877062, -0.2453674, -1.255417, 1, 1, 1, 1, 1,
-0.09654333, -0.2207946, -3.074234, 1, 1, 1, 1, 1,
-0.09423172, 0.1529872, 1.110494, 1, 1, 1, 1, 1,
-0.09394458, -1.551967, -3.14485, 1, 1, 1, 1, 1,
-0.09043022, 0.04938541, -1.263913, 0, 0, 1, 1, 1,
-0.08742829, -0.7007304, -2.04765, 1, 0, 0, 1, 1,
-0.08187912, -0.2540001, -3.621341, 1, 0, 0, 1, 1,
-0.07668548, 0.2670111, -1.936356, 1, 0, 0, 1, 1,
-0.07595557, 0.697095, 0.006948422, 1, 0, 0, 1, 1,
-0.07172365, 0.3814476, -0.05845747, 1, 0, 0, 1, 1,
-0.07033852, 2.105379, 0.9850536, 0, 0, 0, 1, 1,
-0.06963554, 1.313442, -0.3596441, 0, 0, 0, 1, 1,
-0.06936756, 0.00938626, 0.3499246, 0, 0, 0, 1, 1,
-0.06215936, -1.666696, -2.900985, 0, 0, 0, 1, 1,
-0.06209128, 2.426342, 0.1578474, 0, 0, 0, 1, 1,
-0.05611594, -0.8073855, -2.293089, 0, 0, 0, 1, 1,
-0.05172065, 0.3964348, 0.9134909, 0, 0, 0, 1, 1,
-0.04994342, 0.6053823, -0.6184152, 1, 1, 1, 1, 1,
-0.04617927, -0.3717897, -2.840056, 1, 1, 1, 1, 1,
-0.04591699, 0.7522898, -0.4621783, 1, 1, 1, 1, 1,
-0.04370757, 0.1109599, 0.1259332, 1, 1, 1, 1, 1,
-0.0418198, -0.8908879, -2.704363, 1, 1, 1, 1, 1,
-0.04131302, -1.063745, -1.833823, 1, 1, 1, 1, 1,
-0.03943027, 1.515903, -0.9912075, 1, 1, 1, 1, 1,
-0.03453808, -0.2543844, -3.140017, 1, 1, 1, 1, 1,
-0.03430948, -1.318195, -4.249874, 1, 1, 1, 1, 1,
-0.03272023, -0.5971143, -3.834797, 1, 1, 1, 1, 1,
-0.03129989, -1.331139, -3.105117, 1, 1, 1, 1, 1,
-0.03059411, 1.688952, 0.6853544, 1, 1, 1, 1, 1,
-0.03017402, -0.7285506, -2.262717, 1, 1, 1, 1, 1,
-0.02574615, 0.3232037, 1.29388, 1, 1, 1, 1, 1,
-0.02340495, -1.247785, -2.681737, 1, 1, 1, 1, 1,
-0.01786093, -0.702523, -4.375765, 0, 0, 1, 1, 1,
-0.01562041, -0.7839367, -3.019203, 1, 0, 0, 1, 1,
-0.01501097, -1.520333, -3.837754, 1, 0, 0, 1, 1,
-0.01202116, -0.1379655, -2.614471, 1, 0, 0, 1, 1,
-0.009347564, 1.564647, 0.783744, 1, 0, 0, 1, 1,
-0.005889703, -0.1339361, -4.06265, 1, 0, 0, 1, 1,
-0.00550053, 1.778043, -0.1514574, 0, 0, 0, 1, 1,
-0.003647664, -0.04271245, -4.817851, 0, 0, 0, 1, 1,
-0.002841188, 0.7135351, 2.017142, 0, 0, 0, 1, 1,
-0.0005651788, -0.0666002, -4.231085, 0, 0, 0, 1, 1,
0.001430617, 1.087477, -1.271435, 0, 0, 0, 1, 1,
0.007163757, 0.3842541, -0.9795464, 0, 0, 0, 1, 1,
0.008560481, 0.04864315, 1.44303, 0, 0, 0, 1, 1,
0.01105262, -0.7622089, 4.969595, 1, 1, 1, 1, 1,
0.01265198, -0.2432816, 3.297771, 1, 1, 1, 1, 1,
0.01422969, 1.496551, 0.8439347, 1, 1, 1, 1, 1,
0.01577312, -0.1243621, 3.11741, 1, 1, 1, 1, 1,
0.01723785, 0.06968185, -0.1127375, 1, 1, 1, 1, 1,
0.01818426, -0.03773848, 4.55285, 1, 1, 1, 1, 1,
0.02049925, -0.9071433, 4.153316, 1, 1, 1, 1, 1,
0.02063951, 0.7572001, 0.3126816, 1, 1, 1, 1, 1,
0.02633832, -0.5957572, 2.788513, 1, 1, 1, 1, 1,
0.02709536, -0.1799195, 1.923779, 1, 1, 1, 1, 1,
0.02756845, 0.6731967, -2.313675, 1, 1, 1, 1, 1,
0.02771294, 0.3660157, 0.3821822, 1, 1, 1, 1, 1,
0.03387635, -0.5403171, 3.084815, 1, 1, 1, 1, 1,
0.03406751, -1.76356, 1.548409, 1, 1, 1, 1, 1,
0.03520343, 0.03234659, 0.6898867, 1, 1, 1, 1, 1,
0.04483834, -1.635064, 2.335227, 0, 0, 1, 1, 1,
0.05162005, -0.203384, 2.96898, 1, 0, 0, 1, 1,
0.05634944, 1.146071, 1.158062, 1, 0, 0, 1, 1,
0.05862599, 0.4518186, -0.08173567, 1, 0, 0, 1, 1,
0.05985331, -0.1235859, 1.785665, 1, 0, 0, 1, 1,
0.06596209, 2.381568, 1.888359, 1, 0, 0, 1, 1,
0.07019842, 1.343763, 0.4638808, 0, 0, 0, 1, 1,
0.0708152, 3.366076, 1.435523, 0, 0, 0, 1, 1,
0.07175796, -0.2361802, 4.50242, 0, 0, 0, 1, 1,
0.0742785, 0.9652353, 0.9445081, 0, 0, 0, 1, 1,
0.07544855, 1.065398, -1.721168, 0, 0, 0, 1, 1,
0.07580322, 1.476992, -0.5778939, 0, 0, 0, 1, 1,
0.08918226, 0.1528163, 2.418473, 0, 0, 0, 1, 1,
0.09091218, 0.5548584, 0.411915, 1, 1, 1, 1, 1,
0.09101856, -0.04817886, 2.483142, 1, 1, 1, 1, 1,
0.09201364, 2.53079, -0.6806095, 1, 1, 1, 1, 1,
0.09426421, 0.2031456, 0.5230682, 1, 1, 1, 1, 1,
0.09973887, -1.511128, 2.486818, 1, 1, 1, 1, 1,
0.1012056, 0.9419441, -1.61183, 1, 1, 1, 1, 1,
0.107254, 0.5904507, -0.432034, 1, 1, 1, 1, 1,
0.1076642, 1.745039, -0.1760729, 1, 1, 1, 1, 1,
0.1102902, -1.373411, 3.175893, 1, 1, 1, 1, 1,
0.1144599, 0.04469177, 0.3457875, 1, 1, 1, 1, 1,
0.1149166, -0.5701599, 3.887018, 1, 1, 1, 1, 1,
0.1168818, -0.6997104, 3.144365, 1, 1, 1, 1, 1,
0.1240169, -1.128029, 2.191784, 1, 1, 1, 1, 1,
0.1256004, -0.7502472, 3.447537, 1, 1, 1, 1, 1,
0.1295016, 1.684546, -1.698871, 1, 1, 1, 1, 1,
0.129549, 0.9660471, -0.7697015, 0, 0, 1, 1, 1,
0.1299659, -1.058137, 3.299655, 1, 0, 0, 1, 1,
0.1324477, 0.6595059, 0.08391304, 1, 0, 0, 1, 1,
0.1329908, 0.240078, -1.935381, 1, 0, 0, 1, 1,
0.1368499, -0.1259508, 1.579957, 1, 0, 0, 1, 1,
0.1389349, 0.5689111, -0.1268916, 1, 0, 0, 1, 1,
0.1399514, 0.6569636, 1.280205, 0, 0, 0, 1, 1,
0.1431384, -1.563201, 4.395063, 0, 0, 0, 1, 1,
0.1435196, 1.399423, 0.2099506, 0, 0, 0, 1, 1,
0.1463875, -1.619083, 3.492979, 0, 0, 0, 1, 1,
0.1543558, -0.422093, 1.534409, 0, 0, 0, 1, 1,
0.1545369, 0.6685628, 0.3455707, 0, 0, 0, 1, 1,
0.1566291, 0.1254613, 0.4812723, 0, 0, 0, 1, 1,
0.1569044, -0.1394752, 2.211172, 1, 1, 1, 1, 1,
0.1578451, 0.356855, -0.5583572, 1, 1, 1, 1, 1,
0.160164, 2.108052, 1.416194, 1, 1, 1, 1, 1,
0.1624491, 1.536817, -0.1235446, 1, 1, 1, 1, 1,
0.1632654, -0.27679, 2.162465, 1, 1, 1, 1, 1,
0.164833, 0.9942148, -0.8789055, 1, 1, 1, 1, 1,
0.164834, 1.635075, -0.3272325, 1, 1, 1, 1, 1,
0.1697699, 0.07223795, 1.586762, 1, 1, 1, 1, 1,
0.1770858, -0.6342, 3.095788, 1, 1, 1, 1, 1,
0.1799189, -2.136594, 1.139775, 1, 1, 1, 1, 1,
0.1838968, 0.1964576, 0.8096327, 1, 1, 1, 1, 1,
0.1862903, 0.316336, -1.162468, 1, 1, 1, 1, 1,
0.1869821, 0.3418598, 0.9344033, 1, 1, 1, 1, 1,
0.1875014, -0.4850455, 3.009547, 1, 1, 1, 1, 1,
0.1889511, 1.033258, 1.104175, 1, 1, 1, 1, 1,
0.1893265, 0.06454911, 1.266324, 0, 0, 1, 1, 1,
0.1906421, 0.4946043, -1.616141, 1, 0, 0, 1, 1,
0.1975188, 1.376615, 1.278417, 1, 0, 0, 1, 1,
0.198139, -2.356081, 1.582744, 1, 0, 0, 1, 1,
0.1985812, -0.9074043, 2.002603, 1, 0, 0, 1, 1,
0.2002163, -0.8546058, 3.296119, 1, 0, 0, 1, 1,
0.2053362, 0.1807557, -0.3418223, 0, 0, 0, 1, 1,
0.2076616, -0.1874003, 1.833467, 0, 0, 0, 1, 1,
0.2093096, 0.1368533, 0.524672, 0, 0, 0, 1, 1,
0.2108451, -0.425156, 4.120193, 0, 0, 0, 1, 1,
0.2150124, -0.3648288, 3.343637, 0, 0, 0, 1, 1,
0.2152145, 0.8423607, 0.08332112, 0, 0, 0, 1, 1,
0.219636, -0.08231528, 0.7150949, 0, 0, 0, 1, 1,
0.2211013, -0.9340736, 1.671114, 1, 1, 1, 1, 1,
0.2225005, 1.156742, 0.79743, 1, 1, 1, 1, 1,
0.2233043, 2.126037, -1.230464, 1, 1, 1, 1, 1,
0.2233894, 0.9633199, 0.8468151, 1, 1, 1, 1, 1,
0.2264042, -0.1238287, 2.16075, 1, 1, 1, 1, 1,
0.228768, 1.089048, -0.6406364, 1, 1, 1, 1, 1,
0.2341822, 0.5073876, 2.134586, 1, 1, 1, 1, 1,
0.2391907, 1.029415, -0.8824053, 1, 1, 1, 1, 1,
0.2396617, 0.07199124, 0.9840939, 1, 1, 1, 1, 1,
0.2399246, -2.164189, 1.388336, 1, 1, 1, 1, 1,
0.239934, 0.7984565, -0.6535016, 1, 1, 1, 1, 1,
0.2439454, 0.5812747, 0.2359265, 1, 1, 1, 1, 1,
0.2458723, -0.55498, 3.580387, 1, 1, 1, 1, 1,
0.2489425, -0.8989133, 1.572661, 1, 1, 1, 1, 1,
0.2568957, 0.02235679, 1.562203, 1, 1, 1, 1, 1,
0.257004, 0.3564824, 1.119031, 0, 0, 1, 1, 1,
0.2589616, -0.1317316, 2.658339, 1, 0, 0, 1, 1,
0.26108, 0.2437092, 2.399462, 1, 0, 0, 1, 1,
0.2612373, -2.154155, 3.615936, 1, 0, 0, 1, 1,
0.2613382, -0.4304483, 1.521327, 1, 0, 0, 1, 1,
0.2657474, 0.05870932, 2.612741, 1, 0, 0, 1, 1,
0.2663413, 0.08430303, 1.613977, 0, 0, 0, 1, 1,
0.2689603, -0.6513719, 3.783817, 0, 0, 0, 1, 1,
0.2728807, -2.021363, 2.396713, 0, 0, 0, 1, 1,
0.2738365, -0.1131314, 1.284011, 0, 0, 0, 1, 1,
0.2775088, 0.6927003, -1.084765, 0, 0, 0, 1, 1,
0.2783236, -0.232733, 0.3191622, 0, 0, 0, 1, 1,
0.2808342, -2.743599, 1.789432, 0, 0, 0, 1, 1,
0.2835716, 0.6713853, -0.05469971, 1, 1, 1, 1, 1,
0.2854385, -0.02046688, 1.70192, 1, 1, 1, 1, 1,
0.2857121, -0.285016, 1.911236, 1, 1, 1, 1, 1,
0.2872824, -0.7879241, 2.916739, 1, 1, 1, 1, 1,
0.2910889, 0.2415452, 1.466703, 1, 1, 1, 1, 1,
0.2920099, -0.03747008, 2.43312, 1, 1, 1, 1, 1,
0.2927296, 1.080124, 0.4141081, 1, 1, 1, 1, 1,
0.2934916, -0.1509818, 0.2843376, 1, 1, 1, 1, 1,
0.2981406, -1.139388, 2.845385, 1, 1, 1, 1, 1,
0.299065, -0.4017267, 1.778781, 1, 1, 1, 1, 1,
0.3067117, 0.3781272, 1.464745, 1, 1, 1, 1, 1,
0.30832, 0.6588243, 1.549971, 1, 1, 1, 1, 1,
0.3181677, 1.469711, 0.7546612, 1, 1, 1, 1, 1,
0.3183384, -0.2589328, 2.160706, 1, 1, 1, 1, 1,
0.3188708, 1.504732, -0.4249527, 1, 1, 1, 1, 1,
0.3208137, 1.388176, -1.025885, 0, 0, 1, 1, 1,
0.3222735, 0.3193657, 0.8089493, 1, 0, 0, 1, 1,
0.3259465, -0.7360416, 2.453729, 1, 0, 0, 1, 1,
0.3262228, -0.8051332, 2.364513, 1, 0, 0, 1, 1,
0.332641, -0.1417971, 1.859133, 1, 0, 0, 1, 1,
0.334289, -1.041857, 2.292905, 1, 0, 0, 1, 1,
0.3361195, 2.131382, -0.6149219, 0, 0, 0, 1, 1,
0.3390325, 0.4875506, -1.664769, 0, 0, 0, 1, 1,
0.3399483, -0.3108275, 2.941545, 0, 0, 0, 1, 1,
0.3495729, 0.07976936, 1.976031, 0, 0, 0, 1, 1,
0.3556344, 0.01213657, 0.2756282, 0, 0, 0, 1, 1,
0.3562245, -0.03555052, 1.447309, 0, 0, 0, 1, 1,
0.3601461, -1.077206, 3.643722, 0, 0, 0, 1, 1,
0.3633626, -1.423584, 2.352287, 1, 1, 1, 1, 1,
0.3669613, -0.239211, 4.075003, 1, 1, 1, 1, 1,
0.3673783, 0.9452088, -0.8617419, 1, 1, 1, 1, 1,
0.3690752, -1.285332, 4.952578, 1, 1, 1, 1, 1,
0.3699159, 0.4250744, 0.4830284, 1, 1, 1, 1, 1,
0.3717305, 0.4665531, 0.2783501, 1, 1, 1, 1, 1,
0.3737771, 0.3906871, 0.06537417, 1, 1, 1, 1, 1,
0.375534, -0.9144452, 2.711799, 1, 1, 1, 1, 1,
0.3773188, 0.7506015, -1.360699, 1, 1, 1, 1, 1,
0.3774787, 0.9463727, -1.239776, 1, 1, 1, 1, 1,
0.3846635, -1.240805, 1.076047, 1, 1, 1, 1, 1,
0.3848148, 0.07430455, 2.012646, 1, 1, 1, 1, 1,
0.3907585, -0.5158182, 2.426344, 1, 1, 1, 1, 1,
0.3928838, -0.267599, 3.589607, 1, 1, 1, 1, 1,
0.3941146, -0.5720434, 1.207715, 1, 1, 1, 1, 1,
0.3960233, -0.3683437, 1.22646, 0, 0, 1, 1, 1,
0.3986968, 0.2323048, -0.8557909, 1, 0, 0, 1, 1,
0.4010265, 0.6464741, 1.63833, 1, 0, 0, 1, 1,
0.401623, 1.490835, 0.5447166, 1, 0, 0, 1, 1,
0.4021171, 1.128289, -1.056911, 1, 0, 0, 1, 1,
0.4035266, 0.538756, 1.586339, 1, 0, 0, 1, 1,
0.404566, 2.346896, 1.595817, 0, 0, 0, 1, 1,
0.4048337, -0.7200934, 1.829796, 0, 0, 0, 1, 1,
0.4056245, 0.4760719, -0.3557814, 0, 0, 0, 1, 1,
0.4083286, -2.415451, 3.36753, 0, 0, 0, 1, 1,
0.4091593, 1.179839, 0.3017327, 0, 0, 0, 1, 1,
0.4096714, -0.3661274, 1.820144, 0, 0, 0, 1, 1,
0.4099925, 0.4909798, 1.724073, 0, 0, 0, 1, 1,
0.4113835, -2.901723, 2.678241, 1, 1, 1, 1, 1,
0.4146977, -1.516744, 3.324497, 1, 1, 1, 1, 1,
0.4147422, 1.496233, -0.3074756, 1, 1, 1, 1, 1,
0.4155696, 0.7715234, 1.417168, 1, 1, 1, 1, 1,
0.419221, 1.623921, -0.3742284, 1, 1, 1, 1, 1,
0.4198397, -0.5099816, 1.743754, 1, 1, 1, 1, 1,
0.4222907, -1.824524, 2.602236, 1, 1, 1, 1, 1,
0.4268617, 0.09998216, 1.126559, 1, 1, 1, 1, 1,
0.4297392, 1.251861, 0.4711414, 1, 1, 1, 1, 1,
0.429769, 0.4311244, 0.03549594, 1, 1, 1, 1, 1,
0.4319856, -0.5530413, 1.432835, 1, 1, 1, 1, 1,
0.4330652, -0.06996449, 3.461498, 1, 1, 1, 1, 1,
0.4340567, 0.6205082, 2.78651, 1, 1, 1, 1, 1,
0.4385622, -0.1675126, 3.355583, 1, 1, 1, 1, 1,
0.4397142, 2.099893, 0.2861284, 1, 1, 1, 1, 1,
0.4418413, -1.00114, 2.866884, 0, 0, 1, 1, 1,
0.4424133, -0.4807916, 1.623876, 1, 0, 0, 1, 1,
0.4430464, -0.4594459, 1.498929, 1, 0, 0, 1, 1,
0.4612014, -0.4197344, 3.766699, 1, 0, 0, 1, 1,
0.4617155, -1.043916, 2.510021, 1, 0, 0, 1, 1,
0.4626615, -0.3340535, 3.191795, 1, 0, 0, 1, 1,
0.4636821, 0.2503521, 0.596334, 0, 0, 0, 1, 1,
0.4659459, 0.9524515, 0.2116958, 0, 0, 0, 1, 1,
0.4682397, -0.1089262, 3.600424, 0, 0, 0, 1, 1,
0.4738854, -1.108177, 4.146277, 0, 0, 0, 1, 1,
0.4741949, 1.423664, 0.3670412, 0, 0, 0, 1, 1,
0.4766338, 0.5885727, -1.11845, 0, 0, 0, 1, 1,
0.479901, -0.3400916, 1.021024, 0, 0, 0, 1, 1,
0.4829908, 0.04910868, 0.5315206, 1, 1, 1, 1, 1,
0.4923715, -0.17406, 2.200768, 1, 1, 1, 1, 1,
0.4987751, 0.5037283, 0.974764, 1, 1, 1, 1, 1,
0.5027017, -0.7039926, 1.913038, 1, 1, 1, 1, 1,
0.505114, 1.146513, 0.400845, 1, 1, 1, 1, 1,
0.5074672, 0.2286675, 0.740768, 1, 1, 1, 1, 1,
0.5080094, -0.4123656, 2.566211, 1, 1, 1, 1, 1,
0.5142362, 0.7549652, 1.799449, 1, 1, 1, 1, 1,
0.5192645, -0.4926325, 2.33672, 1, 1, 1, 1, 1,
0.5206198, 1.312805, 0.119514, 1, 1, 1, 1, 1,
0.5266202, 0.5294839, 0.461184, 1, 1, 1, 1, 1,
0.5293048, -1.301967, 2.356027, 1, 1, 1, 1, 1,
0.5307779, 0.1304833, 2.091366, 1, 1, 1, 1, 1,
0.5310199, -0.5950335, 3.437268, 1, 1, 1, 1, 1,
0.5334079, 0.8313639, 0.8555288, 1, 1, 1, 1, 1,
0.5373271, -0.4189367, 2.769635, 0, 0, 1, 1, 1,
0.538031, -0.6954787, 2.139416, 1, 0, 0, 1, 1,
0.5411033, -1.684519, 2.156147, 1, 0, 0, 1, 1,
0.5512434, -0.1207825, 2.31146, 1, 0, 0, 1, 1,
0.5513389, 0.3474631, 0.1592312, 1, 0, 0, 1, 1,
0.5524903, -0.7724443, 2.966743, 1, 0, 0, 1, 1,
0.5550945, -1.131091, 4.031136, 0, 0, 0, 1, 1,
0.5562237, -0.1399851, 0.5130358, 0, 0, 0, 1, 1,
0.5567726, 1.023277, -0.8278921, 0, 0, 0, 1, 1,
0.556891, 0.4168715, 1.984261, 0, 0, 0, 1, 1,
0.5576784, -0.9654352, 0.9271501, 0, 0, 0, 1, 1,
0.5605489, 0.6080081, -0.3473921, 0, 0, 0, 1, 1,
0.5624328, -0.5408836, 3.895559, 0, 0, 0, 1, 1,
0.5661014, -0.3615153, 1.350092, 1, 1, 1, 1, 1,
0.5698291, 1.528076, 0.8632289, 1, 1, 1, 1, 1,
0.5708402, -0.9873785, 2.491638, 1, 1, 1, 1, 1,
0.5719702, 0.4458314, 1.055946, 1, 1, 1, 1, 1,
0.5723279, -0.07002749, 1.274258, 1, 1, 1, 1, 1,
0.5726597, -0.4756156, 1.757104, 1, 1, 1, 1, 1,
0.5726809, -0.4670549, 0.811428, 1, 1, 1, 1, 1,
0.5732082, 0.6849948, 1.027636, 1, 1, 1, 1, 1,
0.5770184, 1.574822, 1.128972, 1, 1, 1, 1, 1,
0.5827711, 1.70795, 1.880464, 1, 1, 1, 1, 1,
0.5867803, 0.8508931, 1.678666, 1, 1, 1, 1, 1,
0.5908607, -0.3755649, 1.120869, 1, 1, 1, 1, 1,
0.5912826, 0.5514324, 2.950191, 1, 1, 1, 1, 1,
0.5919648, -0.7394031, 0.8528501, 1, 1, 1, 1, 1,
0.5928684, 1.958547, -0.02339441, 1, 1, 1, 1, 1,
0.5943691, -0.09151825, 2.330522, 0, 0, 1, 1, 1,
0.5959206, 0.02538837, 0.708442, 1, 0, 0, 1, 1,
0.5976394, -1.055643, 2.633287, 1, 0, 0, 1, 1,
0.5988215, 0.9344989, -0.3222418, 1, 0, 0, 1, 1,
0.6009393, -2.057765, 3.019973, 1, 0, 0, 1, 1,
0.6010631, -0.4834868, 3.416811, 1, 0, 0, 1, 1,
0.6019852, 1.261847, 1.094876, 0, 0, 0, 1, 1,
0.6030871, 0.1269921, 0.08741628, 0, 0, 0, 1, 1,
0.6071616, -0.6476244, 2.933751, 0, 0, 0, 1, 1,
0.6075686, 0.3138583, 3.061376, 0, 0, 0, 1, 1,
0.6130239, -0.4559343, 3.87713, 0, 0, 0, 1, 1,
0.6209009, -0.3458638, 2.670728, 0, 0, 0, 1, 1,
0.6285685, -1.464696, 3.676484, 0, 0, 0, 1, 1,
0.6309351, -0.6225364, 0.3766039, 1, 1, 1, 1, 1,
0.6317111, 0.5491982, 0.2300612, 1, 1, 1, 1, 1,
0.6354703, -0.1901509, -0.1603848, 1, 1, 1, 1, 1,
0.637574, 0.4621829, 0.6110622, 1, 1, 1, 1, 1,
0.6425825, -0.03543417, 0.4237501, 1, 1, 1, 1, 1,
0.6436538, 1.77362, 0.4643978, 1, 1, 1, 1, 1,
0.6439766, 0.5268546, 2.348723, 1, 1, 1, 1, 1,
0.6449685, 1.12867, -1.019695, 1, 1, 1, 1, 1,
0.6461196, 0.506357, 0.2491936, 1, 1, 1, 1, 1,
0.6472784, 2.031615, 0.5248655, 1, 1, 1, 1, 1,
0.6517244, -0.2205861, 1.309194, 1, 1, 1, 1, 1,
0.6578737, 0.8940487, 0.2174737, 1, 1, 1, 1, 1,
0.6580781, -0.2418824, 1.495453, 1, 1, 1, 1, 1,
0.6581328, -0.6705438, 2.340822, 1, 1, 1, 1, 1,
0.6605238, -0.7101219, 0.5776653, 1, 1, 1, 1, 1,
0.6650241, -1.089892, 3.206023, 0, 0, 1, 1, 1,
0.6714228, -1.347445, 2.286743, 1, 0, 0, 1, 1,
0.6721293, -0.1256958, 3.485142, 1, 0, 0, 1, 1,
0.6737294, 1.083594, 0.3698124, 1, 0, 0, 1, 1,
0.685091, 0.1751339, 1.051991, 1, 0, 0, 1, 1,
0.6891514, -0.9020445, 4.531289, 1, 0, 0, 1, 1,
0.6946867, 0.9129327, 0.5210498, 0, 0, 0, 1, 1,
0.6955898, 1.111892, -1.080602, 0, 0, 0, 1, 1,
0.6982979, 1.069819, -0.01287674, 0, 0, 0, 1, 1,
0.7003619, 0.9660954, -0.545424, 0, 0, 0, 1, 1,
0.7012117, -0.9114127, 1.05133, 0, 0, 0, 1, 1,
0.7034308, 0.2146044, -0.8491774, 0, 0, 0, 1, 1,
0.7052456, 0.2979321, 2.000004, 0, 0, 0, 1, 1,
0.707591, 0.7663018, 1.482858, 1, 1, 1, 1, 1,
0.7109281, 0.5338954, -0.4313319, 1, 1, 1, 1, 1,
0.7110596, 0.6998065, 0.8370109, 1, 1, 1, 1, 1,
0.7131019, -0.6437016, 2.533059, 1, 1, 1, 1, 1,
0.7142187, -0.9198933, 2.343115, 1, 1, 1, 1, 1,
0.7176767, 0.395447, 0.423819, 1, 1, 1, 1, 1,
0.7184996, -0.6187458, 2.056793, 1, 1, 1, 1, 1,
0.7279369, 0.3323281, 0.5001917, 1, 1, 1, 1, 1,
0.7291837, 2.580813, -1.027751, 1, 1, 1, 1, 1,
0.7309375, -0.286371, 3.366, 1, 1, 1, 1, 1,
0.7320604, -1.133627, 1.656503, 1, 1, 1, 1, 1,
0.7323779, -0.07366184, 1.91667, 1, 1, 1, 1, 1,
0.7350213, 0.6493081, 1.568666, 1, 1, 1, 1, 1,
0.7358286, 1.779491, 1.494264, 1, 1, 1, 1, 1,
0.7399772, -0.9574133, 2.751263, 1, 1, 1, 1, 1,
0.7402387, -0.7339169, 0.9684281, 0, 0, 1, 1, 1,
0.7410219, 0.5418091, 1.775908, 1, 0, 0, 1, 1,
0.7469267, 0.2954364, 1.16088, 1, 0, 0, 1, 1,
0.7473546, 0.8993885, -0.3249329, 1, 0, 0, 1, 1,
0.7507665, -0.119939, 2.270893, 1, 0, 0, 1, 1,
0.7562554, 1.044097, -0.860343, 1, 0, 0, 1, 1,
0.7591016, -0.7203905, 2.831003, 0, 0, 0, 1, 1,
0.7621021, -0.178687, 2.134632, 0, 0, 0, 1, 1,
0.7645143, -0.1012656, 3.263635, 0, 0, 0, 1, 1,
0.7678599, -0.6233465, 2.536054, 0, 0, 0, 1, 1,
0.7717235, 0.9992898, 1.038125, 0, 0, 0, 1, 1,
0.7767062, -0.0873317, 1.592145, 0, 0, 0, 1, 1,
0.7786542, -2.029686, 2.986584, 0, 0, 0, 1, 1,
0.7829757, -0.2804803, 2.554835, 1, 1, 1, 1, 1,
0.7844835, 1.31898, -0.7700781, 1, 1, 1, 1, 1,
0.7861184, 0.2439473, 0.09668925, 1, 1, 1, 1, 1,
0.7864548, -1.611129, 2.697109, 1, 1, 1, 1, 1,
0.7871567, 0.368592, -0.7908928, 1, 1, 1, 1, 1,
0.7991955, 2.091498, 0.7623079, 1, 1, 1, 1, 1,
0.8083534, 0.5089356, 1.416064, 1, 1, 1, 1, 1,
0.8121705, -0.2280858, 3.211625, 1, 1, 1, 1, 1,
0.8145432, 0.0751228, 1.636316, 1, 1, 1, 1, 1,
0.81505, 2.129934, 0.4091987, 1, 1, 1, 1, 1,
0.8431443, 1.859625, 0.3918014, 1, 1, 1, 1, 1,
0.8529813, -0.6066088, 3.784676, 1, 1, 1, 1, 1,
0.8566231, -0.02046462, 0.9686688, 1, 1, 1, 1, 1,
0.8589758, -0.7502584, 1.060786, 1, 1, 1, 1, 1,
0.8632522, -1.073793, 4.469583, 1, 1, 1, 1, 1,
0.8696255, -1.587545, 2.63648, 0, 0, 1, 1, 1,
0.8736972, -1.834082, 2.618165, 1, 0, 0, 1, 1,
0.8772694, 0.7057067, 3.795588, 1, 0, 0, 1, 1,
0.8774753, 0.3454503, 1.702261, 1, 0, 0, 1, 1,
0.8803715, -0.5545295, 3.016111, 1, 0, 0, 1, 1,
0.8854637, -0.8221173, 1.516348, 1, 0, 0, 1, 1,
0.8856156, -0.2716666, 1.286585, 0, 0, 0, 1, 1,
0.8890912, 1.131183, -1.936446, 0, 0, 0, 1, 1,
0.8893492, -0.9251598, 2.008073, 0, 0, 0, 1, 1,
0.8904757, -0.3560911, 1.276477, 0, 0, 0, 1, 1,
0.8961341, 0.8888354, 0.7024592, 0, 0, 0, 1, 1,
0.8966005, 0.5614023, 0.003102101, 0, 0, 0, 1, 1,
0.9004169, 0.8734688, 1.15934, 0, 0, 0, 1, 1,
0.9009792, -2.253885, 2.461835, 1, 1, 1, 1, 1,
0.915054, 0.729653, 0.7717012, 1, 1, 1, 1, 1,
0.9151945, 0.8546072, 0.157122, 1, 1, 1, 1, 1,
0.9158151, -0.3841912, 1.93376, 1, 1, 1, 1, 1,
0.9171457, 0.3514338, 1.13367, 1, 1, 1, 1, 1,
0.9171754, -0.2284963, 2.313799, 1, 1, 1, 1, 1,
0.9176528, 0.4293841, 2.264856, 1, 1, 1, 1, 1,
0.9201624, 0.6488495, 1.316311, 1, 1, 1, 1, 1,
0.923201, -0.6674079, 1.249066, 1, 1, 1, 1, 1,
0.9283834, -0.1363087, 1.836284, 1, 1, 1, 1, 1,
0.9289693, -1.738717, 2.679542, 1, 1, 1, 1, 1,
0.9343304, 0.532644, -2.027281, 1, 1, 1, 1, 1,
0.9361325, -0.1149739, 0.8197114, 1, 1, 1, 1, 1,
0.9363763, -0.8664872, 2.429969, 1, 1, 1, 1, 1,
0.9410612, -0.7131841, 2.380655, 1, 1, 1, 1, 1,
0.9420028, -0.8622123, 1.643245, 0, 0, 1, 1, 1,
0.949293, -0.423686, 1.178443, 1, 0, 0, 1, 1,
0.9508862, 0.6357155, 2.062656, 1, 0, 0, 1, 1,
0.9511479, 0.01263426, 0.6874549, 1, 0, 0, 1, 1,
0.9516734, -0.8494921, 1.844554, 1, 0, 0, 1, 1,
0.9555727, -0.2335366, 1.577344, 1, 0, 0, 1, 1,
0.9567806, -1.46841, 2.907581, 0, 0, 0, 1, 1,
0.959879, 0.09693279, 1.363782, 0, 0, 0, 1, 1,
0.9611345, 2.569672, -0.49907, 0, 0, 0, 1, 1,
0.9663947, 0.6123801, 0.6028094, 0, 0, 0, 1, 1,
0.9745359, -0.5279674, 2.300179, 0, 0, 0, 1, 1,
0.9957964, 0.601041, 1.665452, 0, 0, 0, 1, 1,
1.004731, 0.2998631, -0.3966594, 0, 0, 0, 1, 1,
1.007447, -2.518168, 3.067093, 1, 1, 1, 1, 1,
1.012415, 1.347267, 1.280294, 1, 1, 1, 1, 1,
1.024237, -0.5148762, 1.805879, 1, 1, 1, 1, 1,
1.029624, -0.438524, 2.038937, 1, 1, 1, 1, 1,
1.031911, -1.285563, 1.772794, 1, 1, 1, 1, 1,
1.034456, 0.8109731, 0.8247011, 1, 1, 1, 1, 1,
1.035461, 0.7404589, 1.59876, 1, 1, 1, 1, 1,
1.047541, 1.200282, -1.538953, 1, 1, 1, 1, 1,
1.049725, 0.8779393, -0.1566691, 1, 1, 1, 1, 1,
1.051507, 0.1974413, -0.09983951, 1, 1, 1, 1, 1,
1.054071, 0.5107193, 0.8836793, 1, 1, 1, 1, 1,
1.0571, 0.1015069, 2.031615, 1, 1, 1, 1, 1,
1.060069, 0.4279709, 1.75429, 1, 1, 1, 1, 1,
1.060766, 0.3507035, 1.495662, 1, 1, 1, 1, 1,
1.064836, 0.4848312, 0.8639234, 1, 1, 1, 1, 1,
1.07714, 1.102298, 2.163559, 0, 0, 1, 1, 1,
1.077404, -1.454399, 2.988578, 1, 0, 0, 1, 1,
1.081876, -0.7977387, 2.300895, 1, 0, 0, 1, 1,
1.086091, -1.209617, 1.867788, 1, 0, 0, 1, 1,
1.09186, -1.59772, 3.584309, 1, 0, 0, 1, 1,
1.103184, 2.039204, 0.3033732, 1, 0, 0, 1, 1,
1.106465, -1.227718, 3.188555, 0, 0, 0, 1, 1,
1.107767, 1.780689, 1.200441, 0, 0, 0, 1, 1,
1.113418, 1.329829, 0.8737396, 0, 0, 0, 1, 1,
1.12005, 0.08913494, 1.203578, 0, 0, 0, 1, 1,
1.120465, -2.052405, 3.822899, 0, 0, 0, 1, 1,
1.134939, -0.03078236, 1.321355, 0, 0, 0, 1, 1,
1.136443, 2.111987, 0.09779534, 0, 0, 0, 1, 1,
1.14393, -2.23076, 1.682712, 1, 1, 1, 1, 1,
1.148288, -1.386466, 2.518688, 1, 1, 1, 1, 1,
1.159945, -0.5850873, 3.351027, 1, 1, 1, 1, 1,
1.168222, -2.244012, 3.459311, 1, 1, 1, 1, 1,
1.179049, 0.5595653, 2.048076, 1, 1, 1, 1, 1,
1.182508, 0.08518273, 0.9264899, 1, 1, 1, 1, 1,
1.185119, 1.646603, 0.8831134, 1, 1, 1, 1, 1,
1.191114, 0.09425139, 2.688425, 1, 1, 1, 1, 1,
1.196137, -1.177873, 4.097598, 1, 1, 1, 1, 1,
1.196871, -0.8194773, 1.564951, 1, 1, 1, 1, 1,
1.206385, 0.1292461, 0.187359, 1, 1, 1, 1, 1,
1.208715, 0.3143783, 2.239754, 1, 1, 1, 1, 1,
1.229153, 2.312303, 1.48065, 1, 1, 1, 1, 1,
1.230995, 0.5579771, 1.89155, 1, 1, 1, 1, 1,
1.23501, 0.01571106, 1.213202, 1, 1, 1, 1, 1,
1.237621, -0.2101091, 2.672759, 0, 0, 1, 1, 1,
1.247545, -0.2718924, 1.617472, 1, 0, 0, 1, 1,
1.257247, 0.4948343, 0.5284912, 1, 0, 0, 1, 1,
1.257767, 0.6050644, 0.9525091, 1, 0, 0, 1, 1,
1.2676, 0.3107322, 1.372916, 1, 0, 0, 1, 1,
1.268263, 1.328104, 0.1638728, 1, 0, 0, 1, 1,
1.276042, 0.5819342, -0.2070027, 0, 0, 0, 1, 1,
1.279273, 0.8788282, 2.280083, 0, 0, 0, 1, 1,
1.282125, -0.6619392, 1.750061, 0, 0, 0, 1, 1,
1.306364, -1.69274, 2.777486, 0, 0, 0, 1, 1,
1.30846, -0.3512023, 1.069683, 0, 0, 0, 1, 1,
1.309013, 1.021513, 1.404136, 0, 0, 0, 1, 1,
1.321293, 0.7557514, 0.9036748, 0, 0, 0, 1, 1,
1.343065, 0.141047, -1.582876, 1, 1, 1, 1, 1,
1.367508, -0.798619, 2.945571, 1, 1, 1, 1, 1,
1.374149, -0.1894309, 3.461409, 1, 1, 1, 1, 1,
1.381547, 0.1191155, 0.1917769, 1, 1, 1, 1, 1,
1.382994, 1.325239, 0.9712651, 1, 1, 1, 1, 1,
1.383446, 0.1886415, 2.622958, 1, 1, 1, 1, 1,
1.384461, 0.6719561, 0.7878091, 1, 1, 1, 1, 1,
1.390935, -0.1314267, 0.8923753, 1, 1, 1, 1, 1,
1.399334, -0.04978476, 3.233816, 1, 1, 1, 1, 1,
1.40185, -0.7605192, 2.437486, 1, 1, 1, 1, 1,
1.401992, 1.918307, 0.6725588, 1, 1, 1, 1, 1,
1.41518, 0.4590997, 0.4348296, 1, 1, 1, 1, 1,
1.424414, 1.414792, -0.03210121, 1, 1, 1, 1, 1,
1.42879, -0.1664976, 2.341308, 1, 1, 1, 1, 1,
1.434505, -0.1350103, 1.913714, 1, 1, 1, 1, 1,
1.436788, -0.8842603, 1.051108, 0, 0, 1, 1, 1,
1.444491, 2.572423, 1.750074, 1, 0, 0, 1, 1,
1.486194, -1.299463, 2.210758, 1, 0, 0, 1, 1,
1.490324, -2.303863, 4.75108, 1, 0, 0, 1, 1,
1.496507, -0.9361802, 2.508833, 1, 0, 0, 1, 1,
1.500726, 0.4320632, 1.136161, 1, 0, 0, 1, 1,
1.509924, -2.059637, 1.42859, 0, 0, 0, 1, 1,
1.510648, -0.4250408, 2.722428, 0, 0, 0, 1, 1,
1.51662, -1.711858, 3.177839, 0, 0, 0, 1, 1,
1.518808, 1.191753, 1.745847, 0, 0, 0, 1, 1,
1.519664, -0.2588842, 0.9824056, 0, 0, 0, 1, 1,
1.525974, 0.8838722, 1.705472, 0, 0, 0, 1, 1,
1.531169, 1.328534, -0.922277, 0, 0, 0, 1, 1,
1.564139, -0.09644527, 1.261479, 1, 1, 1, 1, 1,
1.585774, -0.5484816, 2.163409, 1, 1, 1, 1, 1,
1.605865, -1.040059, 2.942083, 1, 1, 1, 1, 1,
1.607914, 0.7747243, 1.485715, 1, 1, 1, 1, 1,
1.61329, -0.563715, 2.007087, 1, 1, 1, 1, 1,
1.627144, 0.7039268, 1.037533, 1, 1, 1, 1, 1,
1.636146, 1.211328, -0.5986911, 1, 1, 1, 1, 1,
1.63738, 1.334613, 0.6816273, 1, 1, 1, 1, 1,
1.655602, 0.4253022, 0.03706241, 1, 1, 1, 1, 1,
1.69511, 0.1866391, 0.1335573, 1, 1, 1, 1, 1,
1.708549, 0.7761791, 1.915737, 1, 1, 1, 1, 1,
1.730814, 0.5313174, 0.6967693, 1, 1, 1, 1, 1,
1.766271, 1.016369, 0.9864479, 1, 1, 1, 1, 1,
1.790238, 0.6859758, 1.748846, 1, 1, 1, 1, 1,
1.823832, 0.5656636, 1.61429, 1, 1, 1, 1, 1,
1.872889, 0.1150236, 1.954145, 0, 0, 1, 1, 1,
1.883864, -0.3719113, 2.324323, 1, 0, 0, 1, 1,
1.906362, -0.6158003, 1.442919, 1, 0, 0, 1, 1,
1.944747, 0.8997057, 1.760928, 1, 0, 0, 1, 1,
1.950584, 0.8564888, 1.772537, 1, 0, 0, 1, 1,
2.006344, -0.7325699, 1.087333, 1, 0, 0, 1, 1,
2.012896, 1.723891, 2.149671, 0, 0, 0, 1, 1,
2.01947, -0.5547342, 0.9255255, 0, 0, 0, 1, 1,
2.021172, -2.400359, 1.525858, 0, 0, 0, 1, 1,
2.079475, 0.3964524, 1.746784, 0, 0, 0, 1, 1,
2.095728, -0.746557, 1.790516, 0, 0, 0, 1, 1,
2.123492, 0.6230887, 0.6399773, 0, 0, 0, 1, 1,
2.282663, -1.523495, 2.530109, 0, 0, 0, 1, 1,
2.309856, 1.288539, 0.3405707, 1, 1, 1, 1, 1,
2.399239, -0.2762132, 1.528911, 1, 1, 1, 1, 1,
2.586566, -1.150681, 1.809434, 1, 1, 1, 1, 1,
2.619162, -0.3156673, 0.9496351, 1, 1, 1, 1, 1,
2.811239, 1.529464, 1.632435, 1, 1, 1, 1, 1,
2.894064, 1.028418, 2.485556, 1, 1, 1, 1, 1,
2.955444, 0.3362032, 1.243786, 1, 1, 1, 1, 1
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
var radius = 9.845707;
var distance = 34.58263;
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
mvMatrix.translate( 0.6754361, 0.02350044, 0.3073931 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.58263);
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
