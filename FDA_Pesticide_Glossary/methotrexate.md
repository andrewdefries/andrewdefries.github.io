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
-2.902596, 1.140499, -1.039109, 1, 0, 0, 1,
-2.874239, 0.8832058, -2.068501, 1, 0.007843138, 0, 1,
-2.686811, -0.1772957, -1.195706, 1, 0.01176471, 0, 1,
-2.476663, 0.4920723, -1.753791, 1, 0.01960784, 0, 1,
-2.444233, 1.468538, -0.2295823, 1, 0.02352941, 0, 1,
-2.424556, -1.100653, -1.579432, 1, 0.03137255, 0, 1,
-2.403486, 0.5558692, -1.157075, 1, 0.03529412, 0, 1,
-2.392363, -1.071379, -2.428264, 1, 0.04313726, 0, 1,
-2.386372, 0.2169393, -0.6988471, 1, 0.04705882, 0, 1,
-2.363137, 2.000743, -0.3630933, 1, 0.05490196, 0, 1,
-2.351559, -0.2835956, 0.1378029, 1, 0.05882353, 0, 1,
-2.3056, 0.9243938, 1.02978, 1, 0.06666667, 0, 1,
-2.240976, -1.654781, -4.43988, 1, 0.07058824, 0, 1,
-2.217753, 0.9572468, 0.07899798, 1, 0.07843138, 0, 1,
-2.138903, -1.627262, -3.296243, 1, 0.08235294, 0, 1,
-2.110959, 0.1645576, -1.408014, 1, 0.09019608, 0, 1,
-2.105892, 0.3091161, -1.814508, 1, 0.09411765, 0, 1,
-2.083822, 0.3877916, -0.3600938, 1, 0.1019608, 0, 1,
-2.062225, 0.05118337, -1.517696, 1, 0.1098039, 0, 1,
-2.060222, 1.729681, -2.479956, 1, 0.1137255, 0, 1,
-2.039253, -0.1471957, -1.314671, 1, 0.1215686, 0, 1,
-2.034568, -1.081241, -3.197943, 1, 0.1254902, 0, 1,
-2.014832, 0.770959, -1.456569, 1, 0.1333333, 0, 1,
-2.014423, -0.2810396, -1.232677, 1, 0.1372549, 0, 1,
-1.970643, 1.314215, -1.29103, 1, 0.145098, 0, 1,
-1.958607, 0.4730745, -0.685724, 1, 0.1490196, 0, 1,
-1.950896, 0.3804987, -1.469076, 1, 0.1568628, 0, 1,
-1.946555, -0.2307103, -1.562887, 1, 0.1607843, 0, 1,
-1.923286, -1.8118, -2.167259, 1, 0.1686275, 0, 1,
-1.920319, 0.1109637, -1.483622, 1, 0.172549, 0, 1,
-1.899095, -0.5039915, -0.8748832, 1, 0.1803922, 0, 1,
-1.893339, 0.6163437, -2.751803, 1, 0.1843137, 0, 1,
-1.883795, -0.8941752, -4.069396, 1, 0.1921569, 0, 1,
-1.857309, 0.1688867, -2.896467, 1, 0.1960784, 0, 1,
-1.855132, 0.8664431, -0.4279803, 1, 0.2039216, 0, 1,
-1.843118, -0.7506121, -0.2819918, 1, 0.2117647, 0, 1,
-1.84209, 0.4088362, -3.089243, 1, 0.2156863, 0, 1,
-1.838323, -1.759047, -2.90713, 1, 0.2235294, 0, 1,
-1.828498, 1.202261, -0.3558524, 1, 0.227451, 0, 1,
-1.828418, 0.1533284, -0.9268053, 1, 0.2352941, 0, 1,
-1.822848, 0.01463968, -1.861032, 1, 0.2392157, 0, 1,
-1.821102, 0.7729018, -0.8995696, 1, 0.2470588, 0, 1,
-1.816746, -0.9919145, -2.593477, 1, 0.2509804, 0, 1,
-1.805215, -0.5090103, -4.150509, 1, 0.2588235, 0, 1,
-1.781183, 1.186367, 0.4757754, 1, 0.2627451, 0, 1,
-1.769871, 0.2425484, -1.969137, 1, 0.2705882, 0, 1,
-1.765205, -0.3834584, -1.264111, 1, 0.2745098, 0, 1,
-1.762758, 0.09054498, -1.612245, 1, 0.282353, 0, 1,
-1.756484, -0.2139775, -3.52222, 1, 0.2862745, 0, 1,
-1.741156, -0.5412867, -2.573857, 1, 0.2941177, 0, 1,
-1.730299, 1.597481, -0.1949678, 1, 0.3019608, 0, 1,
-1.711089, -0.1853477, -1.127173, 1, 0.3058824, 0, 1,
-1.698238, -0.1548149, -1.726496, 1, 0.3137255, 0, 1,
-1.694582, -2.00708, 0.3453195, 1, 0.3176471, 0, 1,
-1.686455, 1.096453, -3.224452, 1, 0.3254902, 0, 1,
-1.672594, -0.7785076, -2.734793, 1, 0.3294118, 0, 1,
-1.672096, 1.614425, -1.6999, 1, 0.3372549, 0, 1,
-1.658589, -0.6164137, -2.191307, 1, 0.3411765, 0, 1,
-1.652665, 0.4983103, 0.114186, 1, 0.3490196, 0, 1,
-1.634927, -0.3883453, -1.201306, 1, 0.3529412, 0, 1,
-1.632644, -0.1198912, -1.244455, 1, 0.3607843, 0, 1,
-1.624665, 0.5469257, 0.7765186, 1, 0.3647059, 0, 1,
-1.603743, 0.841557, -0.4807079, 1, 0.372549, 0, 1,
-1.599448, -0.822103, -1.794248, 1, 0.3764706, 0, 1,
-1.596659, -0.903179, -0.4746145, 1, 0.3843137, 0, 1,
-1.595024, -0.3844792, -1.171892, 1, 0.3882353, 0, 1,
-1.585912, 0.9543968, -2.903783, 1, 0.3960784, 0, 1,
-1.583586, -1.98163, -3.389702, 1, 0.4039216, 0, 1,
-1.581426, 0.8069581, -0.6728583, 1, 0.4078431, 0, 1,
-1.578827, -0.512784, -1.32084, 1, 0.4156863, 0, 1,
-1.565807, 0.1645626, -0.3054103, 1, 0.4196078, 0, 1,
-1.564964, 0.2624605, -2.426111, 1, 0.427451, 0, 1,
-1.557096, -0.09087422, -2.708616, 1, 0.4313726, 0, 1,
-1.554527, -0.4081122, -1.061087, 1, 0.4392157, 0, 1,
-1.549872, 0.5697361, -2.116043, 1, 0.4431373, 0, 1,
-1.539579, -0.4668128, -1.039413, 1, 0.4509804, 0, 1,
-1.537402, -0.1871928, -1.657435, 1, 0.454902, 0, 1,
-1.536374, -0.2464684, -2.29653, 1, 0.4627451, 0, 1,
-1.534504, 0.7934569, -2.029275, 1, 0.4666667, 0, 1,
-1.534291, -0.05112945, -1.340052, 1, 0.4745098, 0, 1,
-1.532574, 1.128543, -1.657017, 1, 0.4784314, 0, 1,
-1.521007, 2.141328, -2.428967, 1, 0.4862745, 0, 1,
-1.519201, -0.3736198, -2.268212, 1, 0.4901961, 0, 1,
-1.518779, 0.4062226, -1.232487, 1, 0.4980392, 0, 1,
-1.511681, 0.419848, -0.9275808, 1, 0.5058824, 0, 1,
-1.505638, 0.1757448, -0.8219284, 1, 0.509804, 0, 1,
-1.50501, -2.054035, -3.265498, 1, 0.5176471, 0, 1,
-1.504296, 0.3838131, -1.375796, 1, 0.5215687, 0, 1,
-1.494437, -1.703754, -1.854621, 1, 0.5294118, 0, 1,
-1.49355, -0.323779, -2.219884, 1, 0.5333334, 0, 1,
-1.492117, 0.1686959, 0.3234996, 1, 0.5411765, 0, 1,
-1.491022, 0.7080655, -1.135975, 1, 0.5450981, 0, 1,
-1.479866, -1.535792, -2.444836, 1, 0.5529412, 0, 1,
-1.469592, 0.7620344, -1.040791, 1, 0.5568628, 0, 1,
-1.456843, -0.4403172, -1.375419, 1, 0.5647059, 0, 1,
-1.444723, -0.9210309, -0.7523549, 1, 0.5686275, 0, 1,
-1.43504, 0.2002572, -2.101498, 1, 0.5764706, 0, 1,
-1.434446, -0.009698183, -0.9152246, 1, 0.5803922, 0, 1,
-1.433833, 0.06383554, -0.4676156, 1, 0.5882353, 0, 1,
-1.420913, -0.6626595, -4.288967, 1, 0.5921569, 0, 1,
-1.417186, 0.3478952, -2.307222, 1, 0.6, 0, 1,
-1.413767, 0.6935568, -1.350438, 1, 0.6078432, 0, 1,
-1.411855, -0.3613706, -1.569638, 1, 0.6117647, 0, 1,
-1.405903, 1.254827, -0.6192564, 1, 0.6196079, 0, 1,
-1.405596, 0.5415541, -0.7219143, 1, 0.6235294, 0, 1,
-1.399691, 0.797721, -2.207035, 1, 0.6313726, 0, 1,
-1.396278, 1.160167, -0.1559655, 1, 0.6352941, 0, 1,
-1.392632, 0.4224304, -0.7467716, 1, 0.6431373, 0, 1,
-1.388171, -0.6154041, -3.722094, 1, 0.6470588, 0, 1,
-1.386897, 0.448824, -1.789911, 1, 0.654902, 0, 1,
-1.383523, 1.710944, -0.01748227, 1, 0.6588235, 0, 1,
-1.374795, -0.01955974, -1.411526, 1, 0.6666667, 0, 1,
-1.372482, -0.6840121, -1.944435, 1, 0.6705883, 0, 1,
-1.372091, -0.08640826, -2.156839, 1, 0.6784314, 0, 1,
-1.365045, -0.7264696, -2.574827, 1, 0.682353, 0, 1,
-1.364246, 0.8213421, -0.4633251, 1, 0.6901961, 0, 1,
-1.360928, -1.155581, -2.579758, 1, 0.6941177, 0, 1,
-1.35187, -1.685029, -1.694778, 1, 0.7019608, 0, 1,
-1.351396, 1.205034, -1.10184, 1, 0.7098039, 0, 1,
-1.348772, 0.1306293, -1.313075, 1, 0.7137255, 0, 1,
-1.344775, 0.4522176, -2.135842, 1, 0.7215686, 0, 1,
-1.335074, 0.4097053, -1.134035, 1, 0.7254902, 0, 1,
-1.317157, -0.2754633, -1.890223, 1, 0.7333333, 0, 1,
-1.315679, 0.6801793, 0.151069, 1, 0.7372549, 0, 1,
-1.307836, -1.57819, -1.423108, 1, 0.7450981, 0, 1,
-1.306353, 1.422585, -0.8995075, 1, 0.7490196, 0, 1,
-1.297641, -1.596692, -2.380332, 1, 0.7568628, 0, 1,
-1.27639, -0.6407137, -1.601787, 1, 0.7607843, 0, 1,
-1.274784, -1.535635, -1.376165, 1, 0.7686275, 0, 1,
-1.271957, -1.995245, -3.470343, 1, 0.772549, 0, 1,
-1.270763, 1.609569, -0.9919184, 1, 0.7803922, 0, 1,
-1.269964, -0.5790678, -1.120754, 1, 0.7843137, 0, 1,
-1.264415, 1.72446, -0.5681054, 1, 0.7921569, 0, 1,
-1.255215, 0.4189389, -2.458126, 1, 0.7960784, 0, 1,
-1.253417, 0.3775669, -2.161274, 1, 0.8039216, 0, 1,
-1.250436, -0.7804418, 0.8667526, 1, 0.8117647, 0, 1,
-1.24953, 0.5127317, -0.1433504, 1, 0.8156863, 0, 1,
-1.245857, -0.7660226, -2.006506, 1, 0.8235294, 0, 1,
-1.242102, 1.05746, -0.9994435, 1, 0.827451, 0, 1,
-1.236181, -0.04608279, -1.820081, 1, 0.8352941, 0, 1,
-1.233012, -0.2922793, -2.511631, 1, 0.8392157, 0, 1,
-1.215632, 1.267987, -1.105146, 1, 0.8470588, 0, 1,
-1.215227, -2.030819, -3.31162, 1, 0.8509804, 0, 1,
-1.21475, -1.717916, -1.089749, 1, 0.8588235, 0, 1,
-1.210376, 1.411198, -0.4579524, 1, 0.8627451, 0, 1,
-1.209062, 0.06267454, -1.703655, 1, 0.8705882, 0, 1,
-1.203623, 1.001065, -0.2352389, 1, 0.8745098, 0, 1,
-1.194919, 0.06483756, -2.739167, 1, 0.8823529, 0, 1,
-1.185018, 1.11903, 0.9930921, 1, 0.8862745, 0, 1,
-1.184161, -1.415871, -1.679495, 1, 0.8941177, 0, 1,
-1.181224, -0.3794041, -1.755613, 1, 0.8980392, 0, 1,
-1.179935, -0.9761834, -1.206214, 1, 0.9058824, 0, 1,
-1.178, 2.136508, 1.121622, 1, 0.9137255, 0, 1,
-1.17753, -0.895094, -4.725696, 1, 0.9176471, 0, 1,
-1.169681, 0.797755, -0.7641938, 1, 0.9254902, 0, 1,
-1.166927, 0.2709708, -1.2224, 1, 0.9294118, 0, 1,
-1.164791, -1.445404, -1.396486, 1, 0.9372549, 0, 1,
-1.158563, 1.681209, -1.560905, 1, 0.9411765, 0, 1,
-1.153264, 2.074598, -0.4952372, 1, 0.9490196, 0, 1,
-1.143809, 1.876755, -1.717238, 1, 0.9529412, 0, 1,
-1.143193, 1.594494, -2.381691, 1, 0.9607843, 0, 1,
-1.139446, 0.7774224, -1.38935, 1, 0.9647059, 0, 1,
-1.137831, -1.08186, -1.440924, 1, 0.972549, 0, 1,
-1.13277, -1.272274, -1.560681, 1, 0.9764706, 0, 1,
-1.12715, 0.1098599, -2.731579, 1, 0.9843137, 0, 1,
-1.12165, -1.143907, -2.852865, 1, 0.9882353, 0, 1,
-1.11943, 0.8656114, -0.3979007, 1, 0.9960784, 0, 1,
-1.108407, 0.4628088, -1.39462, 0.9960784, 1, 0, 1,
-1.105767, 0.979835, -0.7521951, 0.9921569, 1, 0, 1,
-1.073326, 0.4283219, -1.194137, 0.9843137, 1, 0, 1,
-1.071926, -1.757423, -1.724082, 0.9803922, 1, 0, 1,
-1.062602, -0.4652895, -0.3962173, 0.972549, 1, 0, 1,
-1.055175, 1.704645, -0.9198913, 0.9686275, 1, 0, 1,
-1.051264, 0.08562123, 0.6710111, 0.9607843, 1, 0, 1,
-1.048352, 0.1185859, -1.773085, 0.9568627, 1, 0, 1,
-1.041027, -2.05164, -1.75627, 0.9490196, 1, 0, 1,
-1.036838, -0.9573036, -2.847301, 0.945098, 1, 0, 1,
-1.034017, 0.34881, -2.519012, 0.9372549, 1, 0, 1,
-1.028525, -0.4582553, -1.449457, 0.9333333, 1, 0, 1,
-1.023279, -0.8505372, -0.502815, 0.9254902, 1, 0, 1,
-1.019509, -1.446153, -2.428506, 0.9215686, 1, 0, 1,
-1.017828, 0.1970855, -0.7250967, 0.9137255, 1, 0, 1,
-1.016753, -1.201508, -2.278538, 0.9098039, 1, 0, 1,
-1.0123, 0.1849772, -2.115235, 0.9019608, 1, 0, 1,
-1.00907, 0.9242338, -1.400207, 0.8941177, 1, 0, 1,
-1.007435, 0.1860714, -2.924074, 0.8901961, 1, 0, 1,
-1.000675, -2.465097, -3.512761, 0.8823529, 1, 0, 1,
-0.9999431, 0.5272793, -0.7762137, 0.8784314, 1, 0, 1,
-0.9993645, 0.5212709, -2.042572, 0.8705882, 1, 0, 1,
-0.9926388, 0.7585775, -0.9480908, 0.8666667, 1, 0, 1,
-0.9872764, 0.3995731, 0.04519013, 0.8588235, 1, 0, 1,
-0.9862754, -0.7301285, -1.469725, 0.854902, 1, 0, 1,
-0.9842513, 1.168649, -2.263695, 0.8470588, 1, 0, 1,
-0.9800001, -0.278547, -2.620234, 0.8431373, 1, 0, 1,
-0.9782788, -1.45399, -2.521831, 0.8352941, 1, 0, 1,
-0.9741515, -1.014398, -2.699122, 0.8313726, 1, 0, 1,
-0.9692084, -1.035738, -2.021308, 0.8235294, 1, 0, 1,
-0.9577421, -1.597442, -2.643076, 0.8196079, 1, 0, 1,
-0.9515201, -0.5822935, -1.805249, 0.8117647, 1, 0, 1,
-0.9506435, -0.2948063, -2.547248, 0.8078431, 1, 0, 1,
-0.9500161, -1.089548, -1.181687, 0.8, 1, 0, 1,
-0.9427656, -0.7571212, -0.5367714, 0.7921569, 1, 0, 1,
-0.940593, -0.1565491, -0.4938447, 0.7882353, 1, 0, 1,
-0.9384694, 1.074613, -3.455848, 0.7803922, 1, 0, 1,
-0.9370892, -2.205, -3.766513, 0.7764706, 1, 0, 1,
-0.9261867, -1.001436, -1.337576, 0.7686275, 1, 0, 1,
-0.9244034, -0.03804332, -0.7649354, 0.7647059, 1, 0, 1,
-0.9231489, 0.09813102, -2.668735, 0.7568628, 1, 0, 1,
-0.9214768, -0.9873212, -3.410454, 0.7529412, 1, 0, 1,
-0.9107483, 1.063013, -0.8421865, 0.7450981, 1, 0, 1,
-0.9095359, 0.5192202, -2.70157, 0.7411765, 1, 0, 1,
-0.9086425, 0.07515592, -1.065877, 0.7333333, 1, 0, 1,
-0.8996347, -1.128042, -2.691962, 0.7294118, 1, 0, 1,
-0.8989523, 1.06688, -0.8653467, 0.7215686, 1, 0, 1,
-0.8954913, 0.5584816, -1.740671, 0.7176471, 1, 0, 1,
-0.889284, 0.574701, -1.157337, 0.7098039, 1, 0, 1,
-0.8860457, -0.08002339, -1.60486, 0.7058824, 1, 0, 1,
-0.8792788, 0.2279471, -2.648071, 0.6980392, 1, 0, 1,
-0.8786902, -0.919949, -3.284693, 0.6901961, 1, 0, 1,
-0.875389, -0.5328736, -1.570055, 0.6862745, 1, 0, 1,
-0.8709924, -0.1677562, -2.783692, 0.6784314, 1, 0, 1,
-0.8697984, 0.4549222, -0.300604, 0.6745098, 1, 0, 1,
-0.8687596, -1.947591, -2.981211, 0.6666667, 1, 0, 1,
-0.8668675, -2.003606, -1.3926, 0.6627451, 1, 0, 1,
-0.8660849, 1.526763, -0.9057637, 0.654902, 1, 0, 1,
-0.8655159, 0.4694113, -0.3385248, 0.6509804, 1, 0, 1,
-0.8583165, -1.57196, -2.681641, 0.6431373, 1, 0, 1,
-0.8525022, 0.4634547, -0.7770798, 0.6392157, 1, 0, 1,
-0.8500616, -0.4517226, -0.8807284, 0.6313726, 1, 0, 1,
-0.8482621, 0.3555541, 0.3538361, 0.627451, 1, 0, 1,
-0.846956, -2.613175, -2.797254, 0.6196079, 1, 0, 1,
-0.8461621, -1.436526, -2.38134, 0.6156863, 1, 0, 1,
-0.8451422, 0.8719205, -0.0458842, 0.6078432, 1, 0, 1,
-0.8446491, 2.390109, -1.233849, 0.6039216, 1, 0, 1,
-0.8353211, 0.1146107, 0.4243064, 0.5960785, 1, 0, 1,
-0.8326705, 0.2177413, -2.432038, 0.5882353, 1, 0, 1,
-0.8316808, 0.3432423, -1.623378, 0.5843138, 1, 0, 1,
-0.8225258, 0.6873776, -0.2732514, 0.5764706, 1, 0, 1,
-0.8208773, -0.2053645, -2.223845, 0.572549, 1, 0, 1,
-0.8202187, 0.8242703, 1.326032, 0.5647059, 1, 0, 1,
-0.8157868, -0.4029393, -3.544166, 0.5607843, 1, 0, 1,
-0.8157352, 0.1391422, -1.85864, 0.5529412, 1, 0, 1,
-0.8126565, 0.0801333, 1.225849, 0.5490196, 1, 0, 1,
-0.812216, -0.3544999, -1.724054, 0.5411765, 1, 0, 1,
-0.8112314, 0.6018333, -0.5235111, 0.5372549, 1, 0, 1,
-0.8051461, 0.4992995, -1.559807, 0.5294118, 1, 0, 1,
-0.8037738, -1.01293, -3.129442, 0.5254902, 1, 0, 1,
-0.8033273, -0.4395608, -3.965871, 0.5176471, 1, 0, 1,
-0.8012114, -0.3588521, -3.008079, 0.5137255, 1, 0, 1,
-0.7992014, -0.3065495, -2.281709, 0.5058824, 1, 0, 1,
-0.7986556, 0.5420079, -2.810358, 0.5019608, 1, 0, 1,
-0.7961856, 1.410288, 0.5769187, 0.4941176, 1, 0, 1,
-0.7947758, -0.0160159, -0.8108009, 0.4862745, 1, 0, 1,
-0.7918496, 0.8029528, -0.9395081, 0.4823529, 1, 0, 1,
-0.7902536, 0.8240272, -2.052535, 0.4745098, 1, 0, 1,
-0.7878544, -0.006988104, -2.583142, 0.4705882, 1, 0, 1,
-0.787562, -0.7832222, -2.211668, 0.4627451, 1, 0, 1,
-0.7686979, -0.4263849, -1.208393, 0.4588235, 1, 0, 1,
-0.7649931, 0.6130217, -2.784995, 0.4509804, 1, 0, 1,
-0.7634827, -0.1698866, -0.8314942, 0.4470588, 1, 0, 1,
-0.7634334, 0.1049721, -1.090533, 0.4392157, 1, 0, 1,
-0.7514163, 1.446254, 0.3991678, 0.4352941, 1, 0, 1,
-0.750401, -0.2919957, -2.662048, 0.427451, 1, 0, 1,
-0.7440127, -1.058583, -2.210114, 0.4235294, 1, 0, 1,
-0.7347075, 0.3057427, -1.009865, 0.4156863, 1, 0, 1,
-0.7308519, 1.002884, -0.2397383, 0.4117647, 1, 0, 1,
-0.7190075, -0.1709826, -2.673528, 0.4039216, 1, 0, 1,
-0.7183532, 0.6182734, -0.4759767, 0.3960784, 1, 0, 1,
-0.7154993, 0.612404, 0.1292025, 0.3921569, 1, 0, 1,
-0.7141902, -0.3482921, -2.349344, 0.3843137, 1, 0, 1,
-0.7114348, 0.5954344, -0.5591197, 0.3803922, 1, 0, 1,
-0.706816, 0.6594561, -0.9263478, 0.372549, 1, 0, 1,
-0.7033864, -1.377562, -1.698785, 0.3686275, 1, 0, 1,
-0.701334, -0.3366007, -1.170159, 0.3607843, 1, 0, 1,
-0.6920121, 0.3757673, -1.563214, 0.3568628, 1, 0, 1,
-0.690031, 0.6584184, -3.186263, 0.3490196, 1, 0, 1,
-0.6856275, 0.4042182, -1.678833, 0.345098, 1, 0, 1,
-0.6846635, -1.660868, -3.313901, 0.3372549, 1, 0, 1,
-0.6822496, 0.0964099, -0.5930551, 0.3333333, 1, 0, 1,
-0.6815612, 0.8545864, -0.3439546, 0.3254902, 1, 0, 1,
-0.6803628, -0.04513012, -2.266641, 0.3215686, 1, 0, 1,
-0.6750387, 0.759864, -1.51602, 0.3137255, 1, 0, 1,
-0.6659994, 0.3482851, -0.3547595, 0.3098039, 1, 0, 1,
-0.6647955, -1.379297, -3.175789, 0.3019608, 1, 0, 1,
-0.6646323, 0.865907, -2.395045, 0.2941177, 1, 0, 1,
-0.6606501, 1.422315, 0.3733467, 0.2901961, 1, 0, 1,
-0.6584788, 0.7962351, -1.773332, 0.282353, 1, 0, 1,
-0.654238, 0.7923991, 0.1555599, 0.2784314, 1, 0, 1,
-0.6522503, 0.9504546, -0.5611954, 0.2705882, 1, 0, 1,
-0.6433521, -0.3211241, -2.030859, 0.2666667, 1, 0, 1,
-0.642025, -0.3988018, -0.1560507, 0.2588235, 1, 0, 1,
-0.6399937, -0.2403497, -3.024662, 0.254902, 1, 0, 1,
-0.6387181, 1.504261, 1.636738, 0.2470588, 1, 0, 1,
-0.6341431, -0.2447662, -0.8630045, 0.2431373, 1, 0, 1,
-0.6300433, 0.6849076, -0.6990383, 0.2352941, 1, 0, 1,
-0.629971, -1.593905, -2.044655, 0.2313726, 1, 0, 1,
-0.6293268, 0.003596678, -2.519148, 0.2235294, 1, 0, 1,
-0.628535, 0.8370912, 0.05555353, 0.2196078, 1, 0, 1,
-0.6262555, -0.7919354, -2.406464, 0.2117647, 1, 0, 1,
-0.6233882, 0.9422654, -3.023694, 0.2078431, 1, 0, 1,
-0.6225582, -0.3317918, -2.333786, 0.2, 1, 0, 1,
-0.62248, 1.946746, -3.520384, 0.1921569, 1, 0, 1,
-0.6207649, -0.6923689, -1.303208, 0.1882353, 1, 0, 1,
-0.6145743, -1.24626, -2.864162, 0.1803922, 1, 0, 1,
-0.6141004, 0.8120759, -0.3265657, 0.1764706, 1, 0, 1,
-0.6111101, 0.02026583, -0.8347613, 0.1686275, 1, 0, 1,
-0.6070255, -0.7799515, -4.123693, 0.1647059, 1, 0, 1,
-0.6055385, 0.2422844, -1.221613, 0.1568628, 1, 0, 1,
-0.6032831, -0.1961519, -2.632823, 0.1529412, 1, 0, 1,
-0.6026812, 2.066569, -1.395463, 0.145098, 1, 0, 1,
-0.6004094, -0.6010402, -1.405568, 0.1411765, 1, 0, 1,
-0.5943301, 0.5885651, -1.703912, 0.1333333, 1, 0, 1,
-0.592374, -0.90817, -4.684193, 0.1294118, 1, 0, 1,
-0.5871269, -0.6509477, 0.08184185, 0.1215686, 1, 0, 1,
-0.5857779, -0.9115756, -2.452356, 0.1176471, 1, 0, 1,
-0.5843863, 1.905305, -0.5071564, 0.1098039, 1, 0, 1,
-0.5818883, -1.644633, -1.289173, 0.1058824, 1, 0, 1,
-0.5783296, -0.4292808, -2.901833, 0.09803922, 1, 0, 1,
-0.5694869, -0.4859192, -1.378518, 0.09019608, 1, 0, 1,
-0.5645001, -1.727645, -4.102583, 0.08627451, 1, 0, 1,
-0.5627375, 0.226545, -1.304231, 0.07843138, 1, 0, 1,
-0.5571427, 0.1538227, 0.577858, 0.07450981, 1, 0, 1,
-0.5536883, 0.5047274, -1.43384, 0.06666667, 1, 0, 1,
-0.5535246, 0.8771402, 0.895204, 0.0627451, 1, 0, 1,
-0.5507901, 2.308435, 0.2816587, 0.05490196, 1, 0, 1,
-0.548396, -0.3163228, -1.372981, 0.05098039, 1, 0, 1,
-0.5477703, -0.6947374, -3.886533, 0.04313726, 1, 0, 1,
-0.5458187, 1.340409, -1.965952, 0.03921569, 1, 0, 1,
-0.5418717, -0.313369, -3.074775, 0.03137255, 1, 0, 1,
-0.5268154, -0.5612759, 0.5626614, 0.02745098, 1, 0, 1,
-0.5237663, 0.7382999, -0.7476528, 0.01960784, 1, 0, 1,
-0.5217535, -0.6476674, -3.063419, 0.01568628, 1, 0, 1,
-0.5213674, 0.0283265, -0.5864061, 0.007843138, 1, 0, 1,
-0.520458, 2.573131, -0.2190329, 0.003921569, 1, 0, 1,
-0.5188948, 0.7180054, -0.9056492, 0, 1, 0.003921569, 1,
-0.5186238, -0.5048361, -2.506699, 0, 1, 0.01176471, 1,
-0.5162553, 0.5584145, -0.850423, 0, 1, 0.01568628, 1,
-0.5162216, -2.207119, -1.382215, 0, 1, 0.02352941, 1,
-0.5150499, 1.582842, 0.5606821, 0, 1, 0.02745098, 1,
-0.5133566, -0.7494822, -2.893749, 0, 1, 0.03529412, 1,
-0.5121152, -0.09527849, -2.561312, 0, 1, 0.03921569, 1,
-0.5108287, 0.752561, -0.4483798, 0, 1, 0.04705882, 1,
-0.5105968, -1.423108, -3.0577, 0, 1, 0.05098039, 1,
-0.5085161, 1.864284, -0.1490757, 0, 1, 0.05882353, 1,
-0.4999798, -0.3447676, -1.459702, 0, 1, 0.0627451, 1,
-0.4998145, -1.280817, -4.327535, 0, 1, 0.07058824, 1,
-0.49818, -0.3655124, -3.184047, 0, 1, 0.07450981, 1,
-0.4952579, -0.8806455, -2.666055, 0, 1, 0.08235294, 1,
-0.4937401, -1.517579, -3.157517, 0, 1, 0.08627451, 1,
-0.4932587, 0.4511926, -0.3436392, 0, 1, 0.09411765, 1,
-0.4928868, 0.6700361, -0.9723273, 0, 1, 0.1019608, 1,
-0.47772, 0.3994599, -0.1698622, 0, 1, 0.1058824, 1,
-0.4754357, -0.9176278, -2.598452, 0, 1, 0.1137255, 1,
-0.4744609, -0.2765934, -0.7678407, 0, 1, 0.1176471, 1,
-0.4712754, -0.9331738, -2.455633, 0, 1, 0.1254902, 1,
-0.4704734, -0.5038193, -2.042202, 0, 1, 0.1294118, 1,
-0.4674642, 0.6145183, 1.2029, 0, 1, 0.1372549, 1,
-0.4661464, -1.190192, -2.944375, 0, 1, 0.1411765, 1,
-0.4646505, 0.7508709, -2.108337, 0, 1, 0.1490196, 1,
-0.4645775, -2.112251, -4.311018, 0, 1, 0.1529412, 1,
-0.4633966, 0.9942751, -1.651494, 0, 1, 0.1607843, 1,
-0.4618967, -0.6949984, -3.283131, 0, 1, 0.1647059, 1,
-0.4601138, 0.9266219, -0.3662457, 0, 1, 0.172549, 1,
-0.4570763, 0.4988966, -0.4079338, 0, 1, 0.1764706, 1,
-0.4543658, -0.5161619, -3.111162, 0, 1, 0.1843137, 1,
-0.4506046, -0.1759002, -2.497479, 0, 1, 0.1882353, 1,
-0.4497431, 0.3671975, -0.1606633, 0, 1, 0.1960784, 1,
-0.4488441, 0.7570171, -1.154078, 0, 1, 0.2039216, 1,
-0.4472718, -0.6820406, -3.759764, 0, 1, 0.2078431, 1,
-0.4469987, -0.755623, -2.37097, 0, 1, 0.2156863, 1,
-0.4437173, -0.3272122, -3.040967, 0, 1, 0.2196078, 1,
-0.4424737, -0.5814266, -2.094636, 0, 1, 0.227451, 1,
-0.441072, -1.576212, -3.925226, 0, 1, 0.2313726, 1,
-0.4405202, 1.517693, -0.07068077, 0, 1, 0.2392157, 1,
-0.4392123, 1.987973, -1.204086, 0, 1, 0.2431373, 1,
-0.4329778, 2.347279, -1.224338, 0, 1, 0.2509804, 1,
-0.4290923, -0.2069008, -3.361792, 0, 1, 0.254902, 1,
-0.4274446, -0.2541017, -2.313224, 0, 1, 0.2627451, 1,
-0.4243921, -0.3529054, -1.259208, 0, 1, 0.2666667, 1,
-0.4237134, 1.093249, 0.2669636, 0, 1, 0.2745098, 1,
-0.4237112, -0.03575571, -1.88623, 0, 1, 0.2784314, 1,
-0.4090753, -1.291372, -2.025015, 0, 1, 0.2862745, 1,
-0.4087711, 0.1256142, -1.858139, 0, 1, 0.2901961, 1,
-0.4086649, 0.5689619, -0.9819484, 0, 1, 0.2980392, 1,
-0.408511, 0.4087089, -0.3374327, 0, 1, 0.3058824, 1,
-0.4077206, 1.282469, -1.733986, 0, 1, 0.3098039, 1,
-0.4004734, -0.5741288, -3.238311, 0, 1, 0.3176471, 1,
-0.3990362, 0.2027775, 0.910449, 0, 1, 0.3215686, 1,
-0.3924595, -1.091151, -3.175258, 0, 1, 0.3294118, 1,
-0.3913774, -0.3386728, -2.885599, 0, 1, 0.3333333, 1,
-0.3797488, 0.3073533, -2.169527, 0, 1, 0.3411765, 1,
-0.3795137, -0.2201964, -2.939404, 0, 1, 0.345098, 1,
-0.3745732, 0.7254616, -0.3033125, 0, 1, 0.3529412, 1,
-0.3743005, -0.6036896, -2.812633, 0, 1, 0.3568628, 1,
-0.3728417, -0.7213652, -3.651944, 0, 1, 0.3647059, 1,
-0.3713086, 0.6079409, -2.986449, 0, 1, 0.3686275, 1,
-0.366118, -1.041257, -2.10361, 0, 1, 0.3764706, 1,
-0.3599384, -1.038918, -2.373351, 0, 1, 0.3803922, 1,
-0.3567591, -0.08404905, -0.6268891, 0, 1, 0.3882353, 1,
-0.3548348, -1.753554, -1.608409, 0, 1, 0.3921569, 1,
-0.3547638, -0.8608024, -3.357393, 0, 1, 0.4, 1,
-0.3527041, 1.350388, 0.2005175, 0, 1, 0.4078431, 1,
-0.3484647, -0.6497646, -3.516189, 0, 1, 0.4117647, 1,
-0.3481096, -1.543468, -4.335077, 0, 1, 0.4196078, 1,
-0.347249, 0.0936747, -1.618461, 0, 1, 0.4235294, 1,
-0.3446754, -1.572466, -2.81157, 0, 1, 0.4313726, 1,
-0.3422394, 0.4729078, -2.077927, 0, 1, 0.4352941, 1,
-0.3409711, 0.4051431, -0.9610088, 0, 1, 0.4431373, 1,
-0.3376763, 1.715346, -1.140297, 0, 1, 0.4470588, 1,
-0.3362979, -0.31371, -1.606045, 0, 1, 0.454902, 1,
-0.3354354, 0.6167722, -1.822376, 0, 1, 0.4588235, 1,
-0.3339436, 1.346169, -0.7454076, 0, 1, 0.4666667, 1,
-0.3329841, 1.127447, -2.137046, 0, 1, 0.4705882, 1,
-0.3324088, -0.5123026, -3.488866, 0, 1, 0.4784314, 1,
-0.3319568, 0.7713047, 0.07966279, 0, 1, 0.4823529, 1,
-0.3302167, -0.2234455, -0.5846384, 0, 1, 0.4901961, 1,
-0.3295894, -0.01201097, -1.510446, 0, 1, 0.4941176, 1,
-0.3285798, -0.3984568, -3.165785, 0, 1, 0.5019608, 1,
-0.3183576, 1.112921, -1.001739, 0, 1, 0.509804, 1,
-0.3182116, 0.369449, -1.145093, 0, 1, 0.5137255, 1,
-0.3170356, -0.1966962, -2.124767, 0, 1, 0.5215687, 1,
-0.3125736, -1.179334, -4.468431, 0, 1, 0.5254902, 1,
-0.3102838, -0.9530329, -2.101832, 0, 1, 0.5333334, 1,
-0.3099307, -1.243751, -3.831618, 0, 1, 0.5372549, 1,
-0.3064421, 1.566349, -1.035269, 0, 1, 0.5450981, 1,
-0.3028512, -1.05857, -2.959998, 0, 1, 0.5490196, 1,
-0.3023196, 0.4637054, -1.104431, 0, 1, 0.5568628, 1,
-0.3006907, -1.272285, -0.8621551, 0, 1, 0.5607843, 1,
-0.2972105, 0.8376538, -1.709487, 0, 1, 0.5686275, 1,
-0.2935207, -0.9289188, -1.24026, 0, 1, 0.572549, 1,
-0.2917953, -0.3344046, -2.608834, 0, 1, 0.5803922, 1,
-0.2811633, -0.4308547, -2.2387, 0, 1, 0.5843138, 1,
-0.2763632, 0.04536603, -1.17693, 0, 1, 0.5921569, 1,
-0.2666691, -0.0796354, -1.816953, 0, 1, 0.5960785, 1,
-0.2622156, -0.7550188, -3.801672, 0, 1, 0.6039216, 1,
-0.2598072, 0.4535545, -0.8618535, 0, 1, 0.6117647, 1,
-0.2491058, 0.5138709, -0.8065012, 0, 1, 0.6156863, 1,
-0.2456618, -0.6451623, -3.429629, 0, 1, 0.6235294, 1,
-0.2454655, 2.393375, -0.9702314, 0, 1, 0.627451, 1,
-0.244783, -1.371422, -2.983681, 0, 1, 0.6352941, 1,
-0.2395529, 0.3673786, 1.721146, 0, 1, 0.6392157, 1,
-0.2394864, 0.503414, -0.6848319, 0, 1, 0.6470588, 1,
-0.2378171, 0.8044417, -0.8625975, 0, 1, 0.6509804, 1,
-0.2372627, 1.40432, -1.801057, 0, 1, 0.6588235, 1,
-0.2344092, -0.7941381, -1.822992, 0, 1, 0.6627451, 1,
-0.2324494, 0.9813522, -1.04345, 0, 1, 0.6705883, 1,
-0.2310683, 0.2009437, -1.312468, 0, 1, 0.6745098, 1,
-0.2240584, -0.03878446, -0.7399371, 0, 1, 0.682353, 1,
-0.2237348, -0.05658673, -3.521053, 0, 1, 0.6862745, 1,
-0.2237117, 0.1108195, -1.955505, 0, 1, 0.6941177, 1,
-0.2189399, 0.5678272, 0.7324358, 0, 1, 0.7019608, 1,
-0.2173059, 0.9914845, 0.2038509, 0, 1, 0.7058824, 1,
-0.2168871, 1.220371, -2.071537, 0, 1, 0.7137255, 1,
-0.2143662, -0.5096623, -4.88102, 0, 1, 0.7176471, 1,
-0.2109695, 1.061283, -1.783331, 0, 1, 0.7254902, 1,
-0.2044257, 1.00974, 0.621556, 0, 1, 0.7294118, 1,
-0.1973974, 1.367288, -0.3366382, 0, 1, 0.7372549, 1,
-0.1955593, -0.2602801, -1.126949, 0, 1, 0.7411765, 1,
-0.1912704, 0.2626637, -0.4805132, 0, 1, 0.7490196, 1,
-0.1869628, 0.1070952, -2.44072, 0, 1, 0.7529412, 1,
-0.1869602, 0.4262495, 0.8494895, 0, 1, 0.7607843, 1,
-0.1842535, 1.227916, -0.2041562, 0, 1, 0.7647059, 1,
-0.1836, -2.033245, -3.407678, 0, 1, 0.772549, 1,
-0.1829165, -0.8086501, -2.875907, 0, 1, 0.7764706, 1,
-0.1823012, -0.09796508, -3.336773, 0, 1, 0.7843137, 1,
-0.1781016, 0.4866774, 0.3677325, 0, 1, 0.7882353, 1,
-0.1776728, -0.00586013, -2.101777, 0, 1, 0.7960784, 1,
-0.1767031, 0.3590749, 0.04844739, 0, 1, 0.8039216, 1,
-0.171209, 1.553939, -0.3349365, 0, 1, 0.8078431, 1,
-0.1698914, 0.3642409, 0.3183495, 0, 1, 0.8156863, 1,
-0.1562887, 0.3413971, -1.629325, 0, 1, 0.8196079, 1,
-0.1557155, 1.824268, -2.352948, 0, 1, 0.827451, 1,
-0.1495829, -0.7112705, -1.406908, 0, 1, 0.8313726, 1,
-0.1489999, -0.3877306, -2.237888, 0, 1, 0.8392157, 1,
-0.1461277, -0.9557377, -3.193693, 0, 1, 0.8431373, 1,
-0.1407649, 0.7057693, -0.992777, 0, 1, 0.8509804, 1,
-0.1405169, 1.38375, 1.646554, 0, 1, 0.854902, 1,
-0.1324019, 1.633199, -1.534413, 0, 1, 0.8627451, 1,
-0.128836, 0.2767497, 0.1865419, 0, 1, 0.8666667, 1,
-0.1248519, -0.3592087, -3.15323, 0, 1, 0.8745098, 1,
-0.1246512, 1.06137, -0.3864919, 0, 1, 0.8784314, 1,
-0.1202777, 0.7695779, 2.340265, 0, 1, 0.8862745, 1,
-0.113064, 0.5306205, -1.129673, 0, 1, 0.8901961, 1,
-0.110954, 0.303335, 2.064125, 0, 1, 0.8980392, 1,
-0.1106546, -1.182142, -2.238592, 0, 1, 0.9058824, 1,
-0.1066999, -0.753624, -4.511399, 0, 1, 0.9098039, 1,
-0.1043875, -0.2435898, -3.698746, 0, 1, 0.9176471, 1,
-0.1037993, 0.9707899, -0.9523924, 0, 1, 0.9215686, 1,
-0.1030219, 0.6117474, -1.39231, 0, 1, 0.9294118, 1,
-0.1005835, 0.1646059, -0.2407128, 0, 1, 0.9333333, 1,
-0.09860658, 0.670054, 1.233305, 0, 1, 0.9411765, 1,
-0.08997368, 1.983792, -1.530113, 0, 1, 0.945098, 1,
-0.08937027, -1.100908, -3.232016, 0, 1, 0.9529412, 1,
-0.08528148, 1.855476, 1.048589, 0, 1, 0.9568627, 1,
-0.08278155, 0.04437174, -2.270161, 0, 1, 0.9647059, 1,
-0.08247506, 0.2875961, -0.09719577, 0, 1, 0.9686275, 1,
-0.08211661, -0.2001163, -2.013121, 0, 1, 0.9764706, 1,
-0.07447875, -0.6869152, -2.560376, 0, 1, 0.9803922, 1,
-0.07375797, -0.6380627, -3.071987, 0, 1, 0.9882353, 1,
-0.07375433, -0.5915359, -1.430412, 0, 1, 0.9921569, 1,
-0.07192962, -0.7401032, -4.282259, 0, 1, 1, 1,
-0.0705149, 0.09022108, 0.5034236, 0, 0.9921569, 1, 1,
-0.06970058, 1.386892, 2.168001, 0, 0.9882353, 1, 1,
-0.06855565, 0.3780463, 1.943352, 0, 0.9803922, 1, 1,
-0.06058491, -0.7271335, -4.044192, 0, 0.9764706, 1, 1,
-0.0577471, -1.160315, -2.953639, 0, 0.9686275, 1, 1,
-0.05770277, 1.490662, -1.032098, 0, 0.9647059, 1, 1,
-0.05755613, 1.779357, -0.9539997, 0, 0.9568627, 1, 1,
-0.05304602, 1.000288, -1.216559, 0, 0.9529412, 1, 1,
-0.05078957, -0.3895611, -2.34955, 0, 0.945098, 1, 1,
-0.04470074, -1.122315, -3.136525, 0, 0.9411765, 1, 1,
-0.04454259, -0.5103849, -1.382525, 0, 0.9333333, 1, 1,
-0.0371349, -1.052526, -4.388664, 0, 0.9294118, 1, 1,
-0.0347479, -1.145052, -3.447805, 0, 0.9215686, 1, 1,
-0.03424375, 0.4490203, -1.407081, 0, 0.9176471, 1, 1,
-0.03375238, -0.8802912, -4.209265, 0, 0.9098039, 1, 1,
-0.02886055, -1.715324, -2.003906, 0, 0.9058824, 1, 1,
-0.01848891, -0.2905345, -3.277033, 0, 0.8980392, 1, 1,
-0.01751611, 0.001885652, -1.262974, 0, 0.8901961, 1, 1,
-0.01467095, 1.334912, -0.2615875, 0, 0.8862745, 1, 1,
-0.01016295, -0.3492771, -3.283439, 0, 0.8784314, 1, 1,
-0.00825673, 1.59196, 0.2959173, 0, 0.8745098, 1, 1,
-0.006676537, -0.3384491, -3.010358, 0, 0.8666667, 1, 1,
-0.0001714994, 1.114139, -1.569412, 0, 0.8627451, 1, 1,
0.004056963, 1.405568, 0.1726356, 0, 0.854902, 1, 1,
0.0041935, -1.357258, 3.743209, 0, 0.8509804, 1, 1,
0.006967703, -0.5017141, 3.133745, 0, 0.8431373, 1, 1,
0.007989549, -1.250099, 2.346254, 0, 0.8392157, 1, 1,
0.00828923, -0.2374129, 3.467174, 0, 0.8313726, 1, 1,
0.01448917, -0.8578735, 2.207459, 0, 0.827451, 1, 1,
0.01547697, -0.9813781, 1.575912, 0, 0.8196079, 1, 1,
0.0166636, 0.316176, -1.930441, 0, 0.8156863, 1, 1,
0.01968269, 0.4555427, -0.4549615, 0, 0.8078431, 1, 1,
0.01981512, 1.59184, 0.7530053, 0, 0.8039216, 1, 1,
0.02037846, 0.5964711, 0.8238572, 0, 0.7960784, 1, 1,
0.02430616, -0.1293993, 3.867758, 0, 0.7882353, 1, 1,
0.02721648, 0.04836136, 0.5141008, 0, 0.7843137, 1, 1,
0.0276407, -0.5772162, 3.582802, 0, 0.7764706, 1, 1,
0.03500714, 0.4836347, 1.004364, 0, 0.772549, 1, 1,
0.03624129, -0.7094789, 1.682726, 0, 0.7647059, 1, 1,
0.04140467, -0.8726091, 2.186676, 0, 0.7607843, 1, 1,
0.04166279, 0.9916129, 0.8165035, 0, 0.7529412, 1, 1,
0.04563947, 0.3919756, 0.3904854, 0, 0.7490196, 1, 1,
0.04604511, -0.1648571, 4.578277, 0, 0.7411765, 1, 1,
0.04792758, 0.02965229, 1.549094, 0, 0.7372549, 1, 1,
0.05002904, -0.9840877, 1.645151, 0, 0.7294118, 1, 1,
0.05347186, -0.1992135, 0.3330225, 0, 0.7254902, 1, 1,
0.05369068, -0.499273, 2.086549, 0, 0.7176471, 1, 1,
0.05372059, 0.8206083, -0.9510207, 0, 0.7137255, 1, 1,
0.0553533, 0.8368327, -1.515135, 0, 0.7058824, 1, 1,
0.05641301, -0.4911192, 2.173517, 0, 0.6980392, 1, 1,
0.06307277, -1.389594, 2.970119, 0, 0.6941177, 1, 1,
0.06362162, -0.4866378, 2.073452, 0, 0.6862745, 1, 1,
0.06471291, -0.2648078, 2.453517, 0, 0.682353, 1, 1,
0.0674566, -0.6618319, 3.82958, 0, 0.6745098, 1, 1,
0.06915163, -0.04181134, 2.526198, 0, 0.6705883, 1, 1,
0.06920982, 0.941682, -0.8654079, 0, 0.6627451, 1, 1,
0.07215751, -0.2220445, 1.633007, 0, 0.6588235, 1, 1,
0.07700673, -2.443561, 2.658878, 0, 0.6509804, 1, 1,
0.07885868, -0.2244607, 1.988865, 0, 0.6470588, 1, 1,
0.0790754, -0.4089802, 3.01539, 0, 0.6392157, 1, 1,
0.08248401, -0.6139439, 3.902875, 0, 0.6352941, 1, 1,
0.08394461, -0.8492032, 3.079117, 0, 0.627451, 1, 1,
0.08494182, -2.322703, 2.337116, 0, 0.6235294, 1, 1,
0.08742335, -0.06805769, 1.114082, 0, 0.6156863, 1, 1,
0.08835046, -0.6350295, 3.597956, 0, 0.6117647, 1, 1,
0.08912044, 0.9447574, -1.128362, 0, 0.6039216, 1, 1,
0.09708519, -0.01608509, 1.158348, 0, 0.5960785, 1, 1,
0.09775022, -0.4047945, 1.167025, 0, 0.5921569, 1, 1,
0.0978278, 1.472812, 0.6341704, 0, 0.5843138, 1, 1,
0.09873785, 0.6542518, -0.05078134, 0, 0.5803922, 1, 1,
0.099994, -1.912252, 1.944466, 0, 0.572549, 1, 1,
0.1011618, -0.9167493, 0.7722089, 0, 0.5686275, 1, 1,
0.1033065, 0.4174643, 0.04077799, 0, 0.5607843, 1, 1,
0.1049413, 0.1675867, 0.0433749, 0, 0.5568628, 1, 1,
0.1110175, -0.3931629, 4.153165, 0, 0.5490196, 1, 1,
0.1126698, -2.451479, 3.210334, 0, 0.5450981, 1, 1,
0.1130371, -1.984957, 2.920959, 0, 0.5372549, 1, 1,
0.1183936, -0.1150628, 2.991008, 0, 0.5333334, 1, 1,
0.1195639, -0.3701153, 3.138513, 0, 0.5254902, 1, 1,
0.1278903, -0.2573946, 1.83285, 0, 0.5215687, 1, 1,
0.128993, -0.1326669, 2.006337, 0, 0.5137255, 1, 1,
0.1298583, 0.3519916, 0.7255855, 0, 0.509804, 1, 1,
0.1304686, -0.7638496, 1.58954, 0, 0.5019608, 1, 1,
0.1325372, 0.6780323, -1.662511, 0, 0.4941176, 1, 1,
0.1333397, -0.961184, 1.794515, 0, 0.4901961, 1, 1,
0.1385076, 0.8758498, 0.2046211, 0, 0.4823529, 1, 1,
0.1419023, 0.1097375, 0.584931, 0, 0.4784314, 1, 1,
0.1431686, -0.6174642, 3.280821, 0, 0.4705882, 1, 1,
0.1452275, -0.4318311, 2.832731, 0, 0.4666667, 1, 1,
0.1483425, 0.1951534, 1.090938, 0, 0.4588235, 1, 1,
0.1559289, -0.8571881, 2.197525, 0, 0.454902, 1, 1,
0.1569538, -0.283455, 3.267446, 0, 0.4470588, 1, 1,
0.1601831, -0.574225, 4.291337, 0, 0.4431373, 1, 1,
0.1661957, -1.674851, 3.251984, 0, 0.4352941, 1, 1,
0.1701361, -0.01565974, 1.297698, 0, 0.4313726, 1, 1,
0.1745115, -1.035166, 3.201394, 0, 0.4235294, 1, 1,
0.1751457, 0.04900526, 2.101177, 0, 0.4196078, 1, 1,
0.1752689, -1.299475, 4.299338, 0, 0.4117647, 1, 1,
0.1806521, -1.353322, 2.784792, 0, 0.4078431, 1, 1,
0.1823491, -0.8951934, 1.30219, 0, 0.4, 1, 1,
0.1852906, -1.474815, 2.057294, 0, 0.3921569, 1, 1,
0.1860719, -0.4503152, 2.741835, 0, 0.3882353, 1, 1,
0.1874186, 1.012596, 0.4040247, 0, 0.3803922, 1, 1,
0.1934036, -0.9640164, 2.526919, 0, 0.3764706, 1, 1,
0.1974456, -0.7605056, 0.410404, 0, 0.3686275, 1, 1,
0.2161848, -0.8174397, 3.456079, 0, 0.3647059, 1, 1,
0.2209997, 0.2478904, -0.5601716, 0, 0.3568628, 1, 1,
0.2217997, 0.979727, -0.5286528, 0, 0.3529412, 1, 1,
0.2219327, 0.02114365, 2.326026, 0, 0.345098, 1, 1,
0.2245972, 1.497586, 0.3338944, 0, 0.3411765, 1, 1,
0.2298778, -0.6380475, 2.419399, 0, 0.3333333, 1, 1,
0.2302347, -1.152808, 4.046302, 0, 0.3294118, 1, 1,
0.2317757, -1.565412, 4.180115, 0, 0.3215686, 1, 1,
0.2331582, 0.1931871, 2.470425, 0, 0.3176471, 1, 1,
0.2370165, 1.493963, 0.01406178, 0, 0.3098039, 1, 1,
0.2384975, 0.3838605, -1.524153, 0, 0.3058824, 1, 1,
0.2403499, 0.2409621, 0.008772149, 0, 0.2980392, 1, 1,
0.2420115, -1.933498, 3.554884, 0, 0.2901961, 1, 1,
0.2425574, 0.5397059, -0.5577689, 0, 0.2862745, 1, 1,
0.2434321, -1.775688, 1.893674, 0, 0.2784314, 1, 1,
0.2446316, -1.351705, 1.124609, 0, 0.2745098, 1, 1,
0.2468681, 0.624423, 0.5856212, 0, 0.2666667, 1, 1,
0.2477856, -1.257928, 3.534812, 0, 0.2627451, 1, 1,
0.2498885, 1.284046, 0.1269692, 0, 0.254902, 1, 1,
0.2546346, -0.3661812, 1.904343, 0, 0.2509804, 1, 1,
0.2555943, 1.70748, 0.5465254, 0, 0.2431373, 1, 1,
0.2584926, 0.4922268, 0.6659117, 0, 0.2392157, 1, 1,
0.2618062, -0.4955216, 1.657391, 0, 0.2313726, 1, 1,
0.2654957, 0.579531, 0.8328671, 0, 0.227451, 1, 1,
0.2668047, 1.303504, 0.890124, 0, 0.2196078, 1, 1,
0.2753405, 0.5657499, 0.4915923, 0, 0.2156863, 1, 1,
0.2784206, -0.1845259, 0.7776061, 0, 0.2078431, 1, 1,
0.2785299, 0.6302693, 0.5661926, 0, 0.2039216, 1, 1,
0.2789432, -1.161463, 2.899655, 0, 0.1960784, 1, 1,
0.281992, 1.30888, -0.7714615, 0, 0.1882353, 1, 1,
0.2869056, -0.453869, 1.654462, 0, 0.1843137, 1, 1,
0.2886831, -0.4730289, 2.662387, 0, 0.1764706, 1, 1,
0.289123, 0.6705196, 1.287464, 0, 0.172549, 1, 1,
0.2933274, -0.285652, 1.736209, 0, 0.1647059, 1, 1,
0.2970997, 0.4296252, 1.856798, 0, 0.1607843, 1, 1,
0.2978151, 0.6477315, 0.3603871, 0, 0.1529412, 1, 1,
0.3068194, -0.3139493, 1.881878, 0, 0.1490196, 1, 1,
0.3069032, 0.156937, 2.021435, 0, 0.1411765, 1, 1,
0.3160517, 1.303078, 0.4146543, 0, 0.1372549, 1, 1,
0.3194933, 0.1661905, -0.7859413, 0, 0.1294118, 1, 1,
0.3246402, 0.05490527, 1.484424, 0, 0.1254902, 1, 1,
0.325175, 0.9549818, 0.6825911, 0, 0.1176471, 1, 1,
0.3281382, 0.9429463, 1.445022, 0, 0.1137255, 1, 1,
0.3363813, 0.3392226, 1.318732, 0, 0.1058824, 1, 1,
0.3373176, 0.740422, 0.8139675, 0, 0.09803922, 1, 1,
0.3398086, -0.1326649, 1.59015, 0, 0.09411765, 1, 1,
0.3437678, -0.06434859, 1.249591, 0, 0.08627451, 1, 1,
0.345185, -0.8287063, 2.685549, 0, 0.08235294, 1, 1,
0.3486409, 0.6900142, -0.04012814, 0, 0.07450981, 1, 1,
0.3529786, -0.2723432, 2.568973, 0, 0.07058824, 1, 1,
0.3550497, 0.3716671, 0.1853422, 0, 0.0627451, 1, 1,
0.3571176, 0.4436017, 0.7220501, 0, 0.05882353, 1, 1,
0.3589554, -0.3815221, 1.704368, 0, 0.05098039, 1, 1,
0.3661465, 0.1451171, 0.9847442, 0, 0.04705882, 1, 1,
0.3681231, 1.26741, 0.2636259, 0, 0.03921569, 1, 1,
0.3756509, -0.6665369, 3.57113, 0, 0.03529412, 1, 1,
0.3773777, -0.03529929, 0.2471538, 0, 0.02745098, 1, 1,
0.3790129, -1.56724, 2.960126, 0, 0.02352941, 1, 1,
0.3795541, -0.4855402, 1.624688, 0, 0.01568628, 1, 1,
0.381751, 0.5179293, 1.92435, 0, 0.01176471, 1, 1,
0.3827121, -2.178374, 1.185911, 0, 0.003921569, 1, 1,
0.3829614, -1.27581, 3.028127, 0.003921569, 0, 1, 1,
0.3855168, 0.1289993, -0.3365164, 0.007843138, 0, 1, 1,
0.3869413, 0.3002393, 1.935785, 0.01568628, 0, 1, 1,
0.3904465, -0.01278574, 2.095005, 0.01960784, 0, 1, 1,
0.3929609, 0.2102645, 0.773249, 0.02745098, 0, 1, 1,
0.3930659, 0.5289, 0.1316025, 0.03137255, 0, 1, 1,
0.3960144, 0.6190677, 2.252411, 0.03921569, 0, 1, 1,
0.3979827, 0.7573794, -1.741499, 0.04313726, 0, 1, 1,
0.3984887, 0.4849547, 0.9007237, 0.05098039, 0, 1, 1,
0.3988589, 0.9084167, 2.443286, 0.05490196, 0, 1, 1,
0.4032173, -0.731387, 4.374092, 0.0627451, 0, 1, 1,
0.4056899, -0.118624, 2.588251, 0.06666667, 0, 1, 1,
0.4058908, 1.051828, -0.4078234, 0.07450981, 0, 1, 1,
0.4091074, 0.324032, 1.542435, 0.07843138, 0, 1, 1,
0.4091386, 0.4303124, -1.215888, 0.08627451, 0, 1, 1,
0.4126829, 0.7256989, 1.058301, 0.09019608, 0, 1, 1,
0.4157638, 0.5382894, 0.4567501, 0.09803922, 0, 1, 1,
0.4161948, 1.088251, 2.715003, 0.1058824, 0, 1, 1,
0.420592, -2.14722, 2.068846, 0.1098039, 0, 1, 1,
0.4216789, 0.1946592, 0.4767549, 0.1176471, 0, 1, 1,
0.4234273, -0.8087867, 3.902294, 0.1215686, 0, 1, 1,
0.4256859, -1.663511, 3.973728, 0.1294118, 0, 1, 1,
0.4292648, -2.58228, 3.379061, 0.1333333, 0, 1, 1,
0.4302306, 0.429318, 0.8301609, 0.1411765, 0, 1, 1,
0.4304016, 1.008178, -0.3299325, 0.145098, 0, 1, 1,
0.4309689, 0.6959547, -0.6467587, 0.1529412, 0, 1, 1,
0.4334498, 0.5972401, 0.9687033, 0.1568628, 0, 1, 1,
0.4490617, 1.829298, -0.06437526, 0.1647059, 0, 1, 1,
0.4500335, 0.3996204, 0.3019277, 0.1686275, 0, 1, 1,
0.4541648, -0.4114014, 2.804867, 0.1764706, 0, 1, 1,
0.4543948, 0.7639096, 0.2521913, 0.1803922, 0, 1, 1,
0.4584371, 0.5381268, 0.4491312, 0.1882353, 0, 1, 1,
0.4590687, -0.2750239, 2.709108, 0.1921569, 0, 1, 1,
0.4676193, 1.134488, 2.869776, 0.2, 0, 1, 1,
0.4715265, 0.8693998, -1.440372, 0.2078431, 0, 1, 1,
0.4728091, 0.2917716, 2.173551, 0.2117647, 0, 1, 1,
0.4759453, 1.316355, 0.8966386, 0.2196078, 0, 1, 1,
0.480546, -1.41609, 3.753419, 0.2235294, 0, 1, 1,
0.4819473, 0.07673875, 1.0039, 0.2313726, 0, 1, 1,
0.4838593, -3.113228, 4.07771, 0.2352941, 0, 1, 1,
0.4866981, 0.23978, 2.014493, 0.2431373, 0, 1, 1,
0.4872425, -0.3392441, 1.874679, 0.2470588, 0, 1, 1,
0.4876838, 1.630187, 1.134429, 0.254902, 0, 1, 1,
0.488067, 0.3256985, -0.554388, 0.2588235, 0, 1, 1,
0.4950162, -0.4315571, 2.743894, 0.2666667, 0, 1, 1,
0.4964716, -0.5436664, 4.338089, 0.2705882, 0, 1, 1,
0.4995781, -0.6925305, 1.681614, 0.2784314, 0, 1, 1,
0.5041493, -0.2099331, 2.206648, 0.282353, 0, 1, 1,
0.5102149, 0.6353438, 0.533753, 0.2901961, 0, 1, 1,
0.5145079, -0.2415845, 2.030712, 0.2941177, 0, 1, 1,
0.5212153, 0.9635106, 1.964782, 0.3019608, 0, 1, 1,
0.5231081, -0.3455117, 2.290738, 0.3098039, 0, 1, 1,
0.5233626, -0.1370509, 0.09181422, 0.3137255, 0, 1, 1,
0.5291243, 0.4490492, 2.122968, 0.3215686, 0, 1, 1,
0.5337471, 0.7587062, 0.6615375, 0.3254902, 0, 1, 1,
0.5358477, -1.23555, 3.488957, 0.3333333, 0, 1, 1,
0.5402144, -0.3612793, 4.342226, 0.3372549, 0, 1, 1,
0.5473165, 0.1373599, 0.9093089, 0.345098, 0, 1, 1,
0.5608983, -0.07541333, 2.82122, 0.3490196, 0, 1, 1,
0.5636802, 0.9142057, 0.1046833, 0.3568628, 0, 1, 1,
0.5706951, 1.662722, 1.225207, 0.3607843, 0, 1, 1,
0.5773323, -0.9980155, 2.321413, 0.3686275, 0, 1, 1,
0.5837332, 0.5441269, 1.096637, 0.372549, 0, 1, 1,
0.5839553, 0.2622873, 0.6286936, 0.3803922, 0, 1, 1,
0.5862354, 1.330826, -0.5007406, 0.3843137, 0, 1, 1,
0.5876211, -0.7290547, 1.412415, 0.3921569, 0, 1, 1,
0.5996929, -0.8202521, 3.519008, 0.3960784, 0, 1, 1,
0.6020119, 0.6054271, -0.1730695, 0.4039216, 0, 1, 1,
0.6111606, -0.07206961, 1.778252, 0.4117647, 0, 1, 1,
0.6215212, -0.4511744, 3.054415, 0.4156863, 0, 1, 1,
0.6249274, -1.208471, 1.247737, 0.4235294, 0, 1, 1,
0.6263238, -2.07459, 0.1404138, 0.427451, 0, 1, 1,
0.6296946, -2.45127, 4.212167, 0.4352941, 0, 1, 1,
0.6311299, -0.2609762, 1.502818, 0.4392157, 0, 1, 1,
0.6315872, -0.382224, 1.591087, 0.4470588, 0, 1, 1,
0.6318548, -0.6172073, 3.04264, 0.4509804, 0, 1, 1,
0.6350656, 1.006705, 0.9662327, 0.4588235, 0, 1, 1,
0.6380537, -0.5367976, 3.683007, 0.4627451, 0, 1, 1,
0.6389056, -0.04909357, 2.150744, 0.4705882, 0, 1, 1,
0.6402676, -2.072483, 2.682444, 0.4745098, 0, 1, 1,
0.6423948, -0.5560314, 3.265335, 0.4823529, 0, 1, 1,
0.6445966, -0.2000405, 1.690569, 0.4862745, 0, 1, 1,
0.6468268, 0.4580874, 1.529754, 0.4941176, 0, 1, 1,
0.6468784, -1.302512, 2.732589, 0.5019608, 0, 1, 1,
0.6540774, 1.033586, 0.2218933, 0.5058824, 0, 1, 1,
0.6541601, -0.3792267, 1.806855, 0.5137255, 0, 1, 1,
0.6629826, -0.4683639, 3.69417, 0.5176471, 0, 1, 1,
0.6734967, -1.340097, 2.953331, 0.5254902, 0, 1, 1,
0.6843796, -0.3093313, 3.46147, 0.5294118, 0, 1, 1,
0.6881088, 1.504963, 1.038341, 0.5372549, 0, 1, 1,
0.6926467, 0.496202, -0.5153297, 0.5411765, 0, 1, 1,
0.7031165, -0.2125411, 2.649392, 0.5490196, 0, 1, 1,
0.7090467, -0.7019909, 2.084821, 0.5529412, 0, 1, 1,
0.7107286, 1.513362, 0.632831, 0.5607843, 0, 1, 1,
0.7113943, 2.371123, 2.027907, 0.5647059, 0, 1, 1,
0.7176688, -0.4395207, 2.902516, 0.572549, 0, 1, 1,
0.71874, 1.086555, 0.1957219, 0.5764706, 0, 1, 1,
0.7197956, 0.6081235, -0.2888884, 0.5843138, 0, 1, 1,
0.7295355, -0.9445126, 2.000371, 0.5882353, 0, 1, 1,
0.7337264, -1.516302, 1.657234, 0.5960785, 0, 1, 1,
0.7338539, -0.03388842, -0.5974317, 0.6039216, 0, 1, 1,
0.7368361, 1.031526, 1.180772, 0.6078432, 0, 1, 1,
0.7384043, 0.5184723, 0.008857594, 0.6156863, 0, 1, 1,
0.7390006, 0.3239309, -0.143723, 0.6196079, 0, 1, 1,
0.7433135, -0.4340739, 1.895154, 0.627451, 0, 1, 1,
0.7446916, -1.150337, 4.548355, 0.6313726, 0, 1, 1,
0.7449952, 1.113758, -0.5805939, 0.6392157, 0, 1, 1,
0.746734, -1.427775, 3.024816, 0.6431373, 0, 1, 1,
0.7468739, -0.1362057, 1.775776, 0.6509804, 0, 1, 1,
0.7473351, -0.2130083, 2.23391, 0.654902, 0, 1, 1,
0.7480476, -1.181041, 3.115704, 0.6627451, 0, 1, 1,
0.7600455, -1.738824, 3.579049, 0.6666667, 0, 1, 1,
0.7601715, -1.08856, 3.447402, 0.6745098, 0, 1, 1,
0.7640141, 2.155489, 1.07642, 0.6784314, 0, 1, 1,
0.7653937, -0.240016, 2.32726, 0.6862745, 0, 1, 1,
0.7703412, 1.603693, 0.1037595, 0.6901961, 0, 1, 1,
0.7705303, -0.04738591, 1.389418, 0.6980392, 0, 1, 1,
0.7732575, -0.1108923, 1.655254, 0.7058824, 0, 1, 1,
0.7753527, -0.1710186, 2.745055, 0.7098039, 0, 1, 1,
0.7803548, 0.6657799, -0.612554, 0.7176471, 0, 1, 1,
0.782899, 1.322078, 0.5919809, 0.7215686, 0, 1, 1,
0.7891717, -0.0730918, 2.342586, 0.7294118, 0, 1, 1,
0.7954118, 0.856667, 0.4906536, 0.7333333, 0, 1, 1,
0.7964896, 0.9585713, 1.043337, 0.7411765, 0, 1, 1,
0.7973843, 0.5937068, 1.918112, 0.7450981, 0, 1, 1,
0.8029077, 1.001426, 0.9991721, 0.7529412, 0, 1, 1,
0.8033315, 0.8729815, 1.089877, 0.7568628, 0, 1, 1,
0.8056775, -0.07358134, 1.467774, 0.7647059, 0, 1, 1,
0.8062966, -0.06945443, 0.6674726, 0.7686275, 0, 1, 1,
0.812752, -0.4272295, 3.022756, 0.7764706, 0, 1, 1,
0.8254005, -0.9825447, 1.217617, 0.7803922, 0, 1, 1,
0.830983, 1.757364, 0.8505659, 0.7882353, 0, 1, 1,
0.8328882, -1.777287, 4.263113, 0.7921569, 0, 1, 1,
0.8364993, -1.75775, 3.636409, 0.8, 0, 1, 1,
0.8377236, -0.9433088, 2.723632, 0.8078431, 0, 1, 1,
0.8404863, -0.1977708, 1.743655, 0.8117647, 0, 1, 1,
0.8443796, -0.2795024, 1.520084, 0.8196079, 0, 1, 1,
0.8449578, -1.581231, 2.652848, 0.8235294, 0, 1, 1,
0.8514404, 1.902495, 0.421894, 0.8313726, 0, 1, 1,
0.851509, -1.255336, 1.140629, 0.8352941, 0, 1, 1,
0.8538356, -1.499538, -0.1657038, 0.8431373, 0, 1, 1,
0.8566455, -0.6085027, 3.364521, 0.8470588, 0, 1, 1,
0.8569097, -0.4249745, 2.602393, 0.854902, 0, 1, 1,
0.8569821, -1.399347, 1.8715, 0.8588235, 0, 1, 1,
0.8675825, 1.338794, -0.8414841, 0.8666667, 0, 1, 1,
0.8702782, -0.8876255, -0.02426258, 0.8705882, 0, 1, 1,
0.8780391, -0.48102, 0.3282281, 0.8784314, 0, 1, 1,
0.8802887, 0.2162076, 1.968068, 0.8823529, 0, 1, 1,
0.8864499, -0.4085291, 3.225175, 0.8901961, 0, 1, 1,
0.8979083, -1.192098, 2.242487, 0.8941177, 0, 1, 1,
0.8989469, 0.7488407, 0.6997596, 0.9019608, 0, 1, 1,
0.899825, -1.083405, 1.449524, 0.9098039, 0, 1, 1,
0.9007814, 1.067318, -0.08383823, 0.9137255, 0, 1, 1,
0.9027393, 0.6459632, -0.1095067, 0.9215686, 0, 1, 1,
0.903737, 0.2033271, -0.06272227, 0.9254902, 0, 1, 1,
0.9112567, -1.410124, 3.234006, 0.9333333, 0, 1, 1,
0.911328, -0.5666656, 2.812809, 0.9372549, 0, 1, 1,
0.9148374, 0.6582044, 1.57321, 0.945098, 0, 1, 1,
0.9200121, -0.2962544, 1.652051, 0.9490196, 0, 1, 1,
0.920168, 0.7074373, -0.4521541, 0.9568627, 0, 1, 1,
0.9220725, -0.1273026, -0.6341821, 0.9607843, 0, 1, 1,
0.9234629, 1.144793, 0.651037, 0.9686275, 0, 1, 1,
0.9262598, 0.5546807, 1.205103, 0.972549, 0, 1, 1,
0.9337605, 1.229158, -0.04682986, 0.9803922, 0, 1, 1,
0.9357588, 0.8966459, 0.9775779, 0.9843137, 0, 1, 1,
0.9391053, 1.185226, -1.593162, 0.9921569, 0, 1, 1,
0.9393827, -0.6470212, 2.012219, 0.9960784, 0, 1, 1,
0.9440814, -0.9774524, 2.455187, 1, 0, 0.9960784, 1,
0.9465768, 0.1653656, 1.041438, 1, 0, 0.9882353, 1,
0.9505638, -0.8472407, 4.243226, 1, 0, 0.9843137, 1,
0.9645457, -1.037183, 0.9711499, 1, 0, 0.9764706, 1,
0.9671157, -0.4349271, 1.305578, 1, 0, 0.972549, 1,
0.9703478, -0.8838108, 1.641608, 1, 0, 0.9647059, 1,
0.970553, -0.8087147, 2.115044, 1, 0, 0.9607843, 1,
0.9751817, -0.2001466, 0.9919538, 1, 0, 0.9529412, 1,
0.9786805, -0.2873381, 0.6972767, 1, 0, 0.9490196, 1,
0.9787829, -0.3315091, 1.123358, 1, 0, 0.9411765, 1,
0.9838438, 0.5898097, 1.513646, 1, 0, 0.9372549, 1,
0.9904655, -0.4471362, 3.82747, 1, 0, 0.9294118, 1,
0.9919765, 0.5307782, 0.8419003, 1, 0, 0.9254902, 1,
0.9927187, 0.9719431, 0.7740661, 1, 0, 0.9176471, 1,
0.9964339, 0.06738159, 2.258887, 1, 0, 0.9137255, 1,
1.005539, 0.9532704, 2.122712, 1, 0, 0.9058824, 1,
1.008703, 0.7010756, 1.158375, 1, 0, 0.9019608, 1,
1.014569, -0.3005541, 3.226326, 1, 0, 0.8941177, 1,
1.018645, 0.5547276, 0.8824727, 1, 0, 0.8862745, 1,
1.021556, 0.3601852, 2.244342, 1, 0, 0.8823529, 1,
1.025213, -0.1987157, 2.6078, 1, 0, 0.8745098, 1,
1.026978, 0.2679653, 0.7306584, 1, 0, 0.8705882, 1,
1.029419, 0.5964004, 1.566399, 1, 0, 0.8627451, 1,
1.03686, -0.3535973, 1.562201, 1, 0, 0.8588235, 1,
1.043059, 0.3150057, 1.51803, 1, 0, 0.8509804, 1,
1.050521, -0.5060699, 1.324884, 1, 0, 0.8470588, 1,
1.050728, -0.04659712, 0.835918, 1, 0, 0.8392157, 1,
1.055261, -0.5450729, 2.630352, 1, 0, 0.8352941, 1,
1.056258, -0.449351, 1.85045, 1, 0, 0.827451, 1,
1.0627, 1.056684, 1.104424, 1, 0, 0.8235294, 1,
1.066214, -0.5510045, 3.645164, 1, 0, 0.8156863, 1,
1.075295, 0.4414576, 1.425858, 1, 0, 0.8117647, 1,
1.080489, -0.5571917, 1.030872, 1, 0, 0.8039216, 1,
1.086156, -0.08488924, 1.354407, 1, 0, 0.7960784, 1,
1.096314, 1.43781, 1.737863, 1, 0, 0.7921569, 1,
1.096979, -0.9395152, 4.290852, 1, 0, 0.7843137, 1,
1.10085, -0.1246211, 1.152206, 1, 0, 0.7803922, 1,
1.109798, -0.132809, 1.894535, 1, 0, 0.772549, 1,
1.119335, -0.08721864, 0.9771267, 1, 0, 0.7686275, 1,
1.131487, -0.2432808, 1.603027, 1, 0, 0.7607843, 1,
1.133437, 1.412548, -1.194184, 1, 0, 0.7568628, 1,
1.13376, 0.2434326, 1.317572, 1, 0, 0.7490196, 1,
1.13541, -0.2020427, 1.582084, 1, 0, 0.7450981, 1,
1.136273, 0.899055, 0.8450873, 1, 0, 0.7372549, 1,
1.138975, 0.7237035, 0.995423, 1, 0, 0.7333333, 1,
1.146068, -0.245868, 1.170656, 1, 0, 0.7254902, 1,
1.157057, -0.0384092, 1.113385, 1, 0, 0.7215686, 1,
1.157625, 1.846172, 0.687949, 1, 0, 0.7137255, 1,
1.164712, 0.1084281, 1.219452, 1, 0, 0.7098039, 1,
1.164743, -0.2267446, 1.722348, 1, 0, 0.7019608, 1,
1.17072, 1.111522, -0.8170745, 1, 0, 0.6941177, 1,
1.175875, 1.742295, -0.863, 1, 0, 0.6901961, 1,
1.181886, -0.2297918, 3.164362, 1, 0, 0.682353, 1,
1.186662, -0.8743315, 2.608175, 1, 0, 0.6784314, 1,
1.187051, 0.7389826, -0.08309674, 1, 0, 0.6705883, 1,
1.191787, -2.730805, 2.376885, 1, 0, 0.6666667, 1,
1.195366, -1.174227, 1.15204, 1, 0, 0.6588235, 1,
1.209108, 1.170789, -0.06590022, 1, 0, 0.654902, 1,
1.216965, -0.2376384, 2.462527, 1, 0, 0.6470588, 1,
1.227087, -0.7334042, 2.455474, 1, 0, 0.6431373, 1,
1.227551, -2.452821, 4.182889, 1, 0, 0.6352941, 1,
1.230324, -0.2867071, 1.82103, 1, 0, 0.6313726, 1,
1.230494, -0.2543052, 2.556178, 1, 0, 0.6235294, 1,
1.234222, -0.5640462, 4.04554, 1, 0, 0.6196079, 1,
1.25138, -0.01632029, 1.867031, 1, 0, 0.6117647, 1,
1.256807, -0.8896634, 2.308718, 1, 0, 0.6078432, 1,
1.27015, 0.9955562, 2.225989, 1, 0, 0.6, 1,
1.27475, 1.014063, 2.035095, 1, 0, 0.5921569, 1,
1.276667, -0.2179066, 2.616071, 1, 0, 0.5882353, 1,
1.27672, -0.1521103, 1.464163, 1, 0, 0.5803922, 1,
1.278852, -0.6484835, 2.005786, 1, 0, 0.5764706, 1,
1.28533, -0.4428588, 3.043211, 1, 0, 0.5686275, 1,
1.286752, 0.6058975, 0.7526525, 1, 0, 0.5647059, 1,
1.289786, -0.5238238, 0.4569327, 1, 0, 0.5568628, 1,
1.298267, -0.9430951, 3.117905, 1, 0, 0.5529412, 1,
1.305094, 0.4345157, 0.8141889, 1, 0, 0.5450981, 1,
1.313001, -0.3485763, 2.97114, 1, 0, 0.5411765, 1,
1.319688, 0.5891345, 0.6924641, 1, 0, 0.5333334, 1,
1.321404, 0.3100724, 1.630617, 1, 0, 0.5294118, 1,
1.340628, -0.7519642, 2.897467, 1, 0, 0.5215687, 1,
1.352852, -0.4125394, 2.287647, 1, 0, 0.5176471, 1,
1.380831, 0.1130572, 1.82868, 1, 0, 0.509804, 1,
1.387597, 0.4928646, 0.9603603, 1, 0, 0.5058824, 1,
1.39245, 0.7383119, 2.084482, 1, 0, 0.4980392, 1,
1.400669, 0.08310172, 0.7180944, 1, 0, 0.4901961, 1,
1.406491, -1.129375, 2.000453, 1, 0, 0.4862745, 1,
1.410696, -0.7951387, 1.862838, 1, 0, 0.4784314, 1,
1.411356, 0.4806468, 1.260761, 1, 0, 0.4745098, 1,
1.422331, 1.273935, 1.57876, 1, 0, 0.4666667, 1,
1.437092, -1.240932, 3.956156, 1, 0, 0.4627451, 1,
1.451713, -0.1691249, 1.415307, 1, 0, 0.454902, 1,
1.456228, 0.2054982, 1.903035, 1, 0, 0.4509804, 1,
1.464973, 0.02626994, 3.128212, 1, 0, 0.4431373, 1,
1.473094, 1.742188, 0.357547, 1, 0, 0.4392157, 1,
1.476424, -0.2464018, 1.170533, 1, 0, 0.4313726, 1,
1.487767, 1.167491, 2.198407, 1, 0, 0.427451, 1,
1.492654, -0.5805743, 0.5018772, 1, 0, 0.4196078, 1,
1.497587, -0.0724648, 1.763572, 1, 0, 0.4156863, 1,
1.499053, -0.5138823, 1.823517, 1, 0, 0.4078431, 1,
1.499546, -0.05378062, 1.364534, 1, 0, 0.4039216, 1,
1.502457, 0.3254054, 3.157159, 1, 0, 0.3960784, 1,
1.508839, 2.373854, 2.561775, 1, 0, 0.3882353, 1,
1.509184, 0.685468, 1.040886, 1, 0, 0.3843137, 1,
1.524665, 0.08494609, 0.4391837, 1, 0, 0.3764706, 1,
1.530862, -1.832539, 0.8913116, 1, 0, 0.372549, 1,
1.544037, -0.4597644, 2.99009, 1, 0, 0.3647059, 1,
1.54733, 0.7546483, 0.9817449, 1, 0, 0.3607843, 1,
1.550442, 0.5605375, 0.6754491, 1, 0, 0.3529412, 1,
1.559493, 1.382481, 1.948115, 1, 0, 0.3490196, 1,
1.574277, 0.2921279, -0.03165976, 1, 0, 0.3411765, 1,
1.578159, 2.033842, 1.552335, 1, 0, 0.3372549, 1,
1.578843, 0.05547765, 2.913643, 1, 0, 0.3294118, 1,
1.580413, 0.2059487, 0.0771669, 1, 0, 0.3254902, 1,
1.594246, -0.1244446, 0.1802452, 1, 0, 0.3176471, 1,
1.605446, 2.145541, 0.6556943, 1, 0, 0.3137255, 1,
1.612314, 0.4862291, 0.7587723, 1, 0, 0.3058824, 1,
1.613679, -0.7806619, 3.177883, 1, 0, 0.2980392, 1,
1.615428, -0.8237022, 2.168432, 1, 0, 0.2941177, 1,
1.620098, -0.5675688, 1.728602, 1, 0, 0.2862745, 1,
1.630172, 1.003384, 0.03702312, 1, 0, 0.282353, 1,
1.631194, -0.4256274, 1.420415, 1, 0, 0.2745098, 1,
1.631376, 0.6094748, 1.204844, 1, 0, 0.2705882, 1,
1.632055, -0.3487013, 1.42695, 1, 0, 0.2627451, 1,
1.637164, -0.7649309, 0.5953599, 1, 0, 0.2588235, 1,
1.638307, -1.398533, 2.209579, 1, 0, 0.2509804, 1,
1.644715, -0.6796208, 3.422512, 1, 0, 0.2470588, 1,
1.646092, -0.4518792, 2.066749, 1, 0, 0.2392157, 1,
1.67422, -0.9221614, 2.919299, 1, 0, 0.2352941, 1,
1.684733, 0.7997835, 0.8634677, 1, 0, 0.227451, 1,
1.695525, 2.97379, 0.8836706, 1, 0, 0.2235294, 1,
1.723789, 1.283332, -0.1118923, 1, 0, 0.2156863, 1,
1.727059, -1.852444, 3.626824, 1, 0, 0.2117647, 1,
1.73541, -1.212376, 3.623036, 1, 0, 0.2039216, 1,
1.75971, -0.7042922, 1.390152, 1, 0, 0.1960784, 1,
1.780841, 0.7318636, 0.5342658, 1, 0, 0.1921569, 1,
1.820347, 0.3661796, 3.429437, 1, 0, 0.1843137, 1,
1.873356, 0.9809937, 1.031092, 1, 0, 0.1803922, 1,
1.87639, -1.750681, 1.96955, 1, 0, 0.172549, 1,
1.897038, -0.5341313, 1.63943, 1, 0, 0.1686275, 1,
1.923158, 2.024328, 0.2786992, 1, 0, 0.1607843, 1,
1.926354, 0.9136124, 1.216543, 1, 0, 0.1568628, 1,
1.938223, -0.3830929, 2.675512, 1, 0, 0.1490196, 1,
1.940617, -1.41788, 2.731803, 1, 0, 0.145098, 1,
1.948933, -0.1410525, 2.117621, 1, 0, 0.1372549, 1,
1.955028, 1.848504, 1.134252, 1, 0, 0.1333333, 1,
1.994169, -0.9623912, 1.844033, 1, 0, 0.1254902, 1,
1.998946, -1.710893, 1.767704, 1, 0, 0.1215686, 1,
1.999943, 0.2782828, 1.786265, 1, 0, 0.1137255, 1,
2.013779, -0.3191214, 1.570316, 1, 0, 0.1098039, 1,
2.020682, -1.436267, 1.94549, 1, 0, 0.1019608, 1,
2.024463, -0.15833, 2.72042, 1, 0, 0.09411765, 1,
2.038903, 1.15548, 1.267092, 1, 0, 0.09019608, 1,
2.041657, 0.1711472, 2.855982, 1, 0, 0.08235294, 1,
2.054879, 0.7474294, 0.3789512, 1, 0, 0.07843138, 1,
2.055619, 0.8642687, -0.1821027, 1, 0, 0.07058824, 1,
2.091489, -1.093399, 2.716722, 1, 0, 0.06666667, 1,
2.191034, 0.3833861, 1.058753, 1, 0, 0.05882353, 1,
2.218374, 2.712667, -0.02485707, 1, 0, 0.05490196, 1,
2.246498, 0.8966066, -0.6301048, 1, 0, 0.04705882, 1,
2.286198, -0.7371518, 0.1073963, 1, 0, 0.04313726, 1,
2.304358, -1.361334, 2.710076, 1, 0, 0.03529412, 1,
2.428094, 0.6029243, 0.8295305, 1, 0, 0.03137255, 1,
2.551401, -0.3173622, 1.064797, 1, 0, 0.02352941, 1,
2.563504, -0.725463, 0.3230858, 1, 0, 0.01960784, 1,
2.619371, 1.808733, 0.417375, 1, 0, 0.01176471, 1,
3.128978, 0.5020186, 1.560781, 1, 0, 0.007843138, 1
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
0.1131911, -4.144977, -6.484371, 0, -0.5, 0.5, 0.5,
0.1131911, -4.144977, -6.484371, 1, -0.5, 0.5, 0.5,
0.1131911, -4.144977, -6.484371, 1, 1.5, 0.5, 0.5,
0.1131911, -4.144977, -6.484371, 0, 1.5, 0.5, 0.5
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
-3.924947, -0.06971872, -6.484371, 0, -0.5, 0.5, 0.5,
-3.924947, -0.06971872, -6.484371, 1, -0.5, 0.5, 0.5,
-3.924947, -0.06971872, -6.484371, 1, 1.5, 0.5, 0.5,
-3.924947, -0.06971872, -6.484371, 0, 1.5, 0.5, 0.5
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
-3.924947, -4.144977, -0.1513717, 0, -0.5, 0.5, 0.5,
-3.924947, -4.144977, -0.1513717, 1, -0.5, 0.5, 0.5,
-3.924947, -4.144977, -0.1513717, 1, 1.5, 0.5, 0.5,
-3.924947, -4.144977, -0.1513717, 0, 1.5, 0.5, 0.5
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
-2, -3.204533, -5.02291,
3, -3.204533, -5.02291,
-2, -3.204533, -5.02291,
-2, -3.361274, -5.266487,
-1, -3.204533, -5.02291,
-1, -3.361274, -5.266487,
0, -3.204533, -5.02291,
0, -3.361274, -5.266487,
1, -3.204533, -5.02291,
1, -3.361274, -5.266487,
2, -3.204533, -5.02291,
2, -3.361274, -5.266487,
3, -3.204533, -5.02291,
3, -3.361274, -5.266487
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
-2, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
-2, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
-2, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
-2, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5,
-1, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
-1, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
-1, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
-1, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5,
0, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
0, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
0, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
0, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5,
1, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
1, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
1, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
1, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5,
2, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
2, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
2, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
2, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5,
3, -3.674755, -5.75364, 0, -0.5, 0.5, 0.5,
3, -3.674755, -5.75364, 1, -0.5, 0.5, 0.5,
3, -3.674755, -5.75364, 1, 1.5, 0.5, 0.5,
3, -3.674755, -5.75364, 0, 1.5, 0.5, 0.5
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
-2.993069, -3, -5.02291,
-2.993069, 2, -5.02291,
-2.993069, -3, -5.02291,
-3.148382, -3, -5.266487,
-2.993069, -2, -5.02291,
-3.148382, -2, -5.266487,
-2.993069, -1, -5.02291,
-3.148382, -1, -5.266487,
-2.993069, 0, -5.02291,
-3.148382, 0, -5.266487,
-2.993069, 1, -5.02291,
-3.148382, 1, -5.266487,
-2.993069, 2, -5.02291,
-3.148382, 2, -5.266487
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
-3.459008, -3, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, -3, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, -3, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, -3, -5.75364, 0, 1.5, 0.5, 0.5,
-3.459008, -2, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, -2, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, -2, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, -2, -5.75364, 0, 1.5, 0.5, 0.5,
-3.459008, -1, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, -1, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, -1, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, -1, -5.75364, 0, 1.5, 0.5, 0.5,
-3.459008, 0, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, 0, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, 0, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, 0, -5.75364, 0, 1.5, 0.5, 0.5,
-3.459008, 1, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, 1, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, 1, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, 1, -5.75364, 0, 1.5, 0.5, 0.5,
-3.459008, 2, -5.75364, 0, -0.5, 0.5, 0.5,
-3.459008, 2, -5.75364, 1, -0.5, 0.5, 0.5,
-3.459008, 2, -5.75364, 1, 1.5, 0.5, 0.5,
-3.459008, 2, -5.75364, 0, 1.5, 0.5, 0.5
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
-2.993069, -3.204533, -4,
-2.993069, -3.204533, 4,
-2.993069, -3.204533, -4,
-3.148382, -3.361274, -4,
-2.993069, -3.204533, -2,
-3.148382, -3.361274, -2,
-2.993069, -3.204533, 0,
-3.148382, -3.361274, 0,
-2.993069, -3.204533, 2,
-3.148382, -3.361274, 2,
-2.993069, -3.204533, 4,
-3.148382, -3.361274, 4
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
-3.459008, -3.674755, -4, 0, -0.5, 0.5, 0.5,
-3.459008, -3.674755, -4, 1, -0.5, 0.5, 0.5,
-3.459008, -3.674755, -4, 1, 1.5, 0.5, 0.5,
-3.459008, -3.674755, -4, 0, 1.5, 0.5, 0.5,
-3.459008, -3.674755, -2, 0, -0.5, 0.5, 0.5,
-3.459008, -3.674755, -2, 1, -0.5, 0.5, 0.5,
-3.459008, -3.674755, -2, 1, 1.5, 0.5, 0.5,
-3.459008, -3.674755, -2, 0, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 0, 0, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 0, 1, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 0, 1, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 0, 0, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 2, 0, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 2, 1, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 2, 1, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 2, 0, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 4, 0, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 4, 1, -0.5, 0.5, 0.5,
-3.459008, -3.674755, 4, 1, 1.5, 0.5, 0.5,
-3.459008, -3.674755, 4, 0, 1.5, 0.5, 0.5
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
-2.993069, -3.204533, -5.02291,
-2.993069, 3.065095, -5.02291,
-2.993069, -3.204533, 4.720166,
-2.993069, 3.065095, 4.720166,
-2.993069, -3.204533, -5.02291,
-2.993069, -3.204533, 4.720166,
-2.993069, 3.065095, -5.02291,
-2.993069, 3.065095, 4.720166,
-2.993069, -3.204533, -5.02291,
3.219451, -3.204533, -5.02291,
-2.993069, -3.204533, 4.720166,
3.219451, -3.204533, 4.720166,
-2.993069, 3.065095, -5.02291,
3.219451, 3.065095, -5.02291,
-2.993069, 3.065095, 4.720166,
3.219451, 3.065095, 4.720166,
3.219451, -3.204533, -5.02291,
3.219451, 3.065095, -5.02291,
3.219451, -3.204533, 4.720166,
3.219451, 3.065095, 4.720166,
3.219451, -3.204533, -5.02291,
3.219451, -3.204533, 4.720166,
3.219451, 3.065095, -5.02291,
3.219451, 3.065095, 4.720166
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
var radius = 7.01999;
var distance = 31.23273;
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
mvMatrix.translate( -0.1131911, 0.06971872, 0.1513717 );
mvMatrix.scale( 1.221751, 1.210622, 0.7790303 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.23273);
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
methotrexate<-read.table("methotrexate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methotrexate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methotrexate' not found
```

```r
y<-methotrexate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methotrexate' not found
```

```r
z<-methotrexate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methotrexate' not found
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
-2.902596, 1.140499, -1.039109, 0, 0, 1, 1, 1,
-2.874239, 0.8832058, -2.068501, 1, 0, 0, 1, 1,
-2.686811, -0.1772957, -1.195706, 1, 0, 0, 1, 1,
-2.476663, 0.4920723, -1.753791, 1, 0, 0, 1, 1,
-2.444233, 1.468538, -0.2295823, 1, 0, 0, 1, 1,
-2.424556, -1.100653, -1.579432, 1, 0, 0, 1, 1,
-2.403486, 0.5558692, -1.157075, 0, 0, 0, 1, 1,
-2.392363, -1.071379, -2.428264, 0, 0, 0, 1, 1,
-2.386372, 0.2169393, -0.6988471, 0, 0, 0, 1, 1,
-2.363137, 2.000743, -0.3630933, 0, 0, 0, 1, 1,
-2.351559, -0.2835956, 0.1378029, 0, 0, 0, 1, 1,
-2.3056, 0.9243938, 1.02978, 0, 0, 0, 1, 1,
-2.240976, -1.654781, -4.43988, 0, 0, 0, 1, 1,
-2.217753, 0.9572468, 0.07899798, 1, 1, 1, 1, 1,
-2.138903, -1.627262, -3.296243, 1, 1, 1, 1, 1,
-2.110959, 0.1645576, -1.408014, 1, 1, 1, 1, 1,
-2.105892, 0.3091161, -1.814508, 1, 1, 1, 1, 1,
-2.083822, 0.3877916, -0.3600938, 1, 1, 1, 1, 1,
-2.062225, 0.05118337, -1.517696, 1, 1, 1, 1, 1,
-2.060222, 1.729681, -2.479956, 1, 1, 1, 1, 1,
-2.039253, -0.1471957, -1.314671, 1, 1, 1, 1, 1,
-2.034568, -1.081241, -3.197943, 1, 1, 1, 1, 1,
-2.014832, 0.770959, -1.456569, 1, 1, 1, 1, 1,
-2.014423, -0.2810396, -1.232677, 1, 1, 1, 1, 1,
-1.970643, 1.314215, -1.29103, 1, 1, 1, 1, 1,
-1.958607, 0.4730745, -0.685724, 1, 1, 1, 1, 1,
-1.950896, 0.3804987, -1.469076, 1, 1, 1, 1, 1,
-1.946555, -0.2307103, -1.562887, 1, 1, 1, 1, 1,
-1.923286, -1.8118, -2.167259, 0, 0, 1, 1, 1,
-1.920319, 0.1109637, -1.483622, 1, 0, 0, 1, 1,
-1.899095, -0.5039915, -0.8748832, 1, 0, 0, 1, 1,
-1.893339, 0.6163437, -2.751803, 1, 0, 0, 1, 1,
-1.883795, -0.8941752, -4.069396, 1, 0, 0, 1, 1,
-1.857309, 0.1688867, -2.896467, 1, 0, 0, 1, 1,
-1.855132, 0.8664431, -0.4279803, 0, 0, 0, 1, 1,
-1.843118, -0.7506121, -0.2819918, 0, 0, 0, 1, 1,
-1.84209, 0.4088362, -3.089243, 0, 0, 0, 1, 1,
-1.838323, -1.759047, -2.90713, 0, 0, 0, 1, 1,
-1.828498, 1.202261, -0.3558524, 0, 0, 0, 1, 1,
-1.828418, 0.1533284, -0.9268053, 0, 0, 0, 1, 1,
-1.822848, 0.01463968, -1.861032, 0, 0, 0, 1, 1,
-1.821102, 0.7729018, -0.8995696, 1, 1, 1, 1, 1,
-1.816746, -0.9919145, -2.593477, 1, 1, 1, 1, 1,
-1.805215, -0.5090103, -4.150509, 1, 1, 1, 1, 1,
-1.781183, 1.186367, 0.4757754, 1, 1, 1, 1, 1,
-1.769871, 0.2425484, -1.969137, 1, 1, 1, 1, 1,
-1.765205, -0.3834584, -1.264111, 1, 1, 1, 1, 1,
-1.762758, 0.09054498, -1.612245, 1, 1, 1, 1, 1,
-1.756484, -0.2139775, -3.52222, 1, 1, 1, 1, 1,
-1.741156, -0.5412867, -2.573857, 1, 1, 1, 1, 1,
-1.730299, 1.597481, -0.1949678, 1, 1, 1, 1, 1,
-1.711089, -0.1853477, -1.127173, 1, 1, 1, 1, 1,
-1.698238, -0.1548149, -1.726496, 1, 1, 1, 1, 1,
-1.694582, -2.00708, 0.3453195, 1, 1, 1, 1, 1,
-1.686455, 1.096453, -3.224452, 1, 1, 1, 1, 1,
-1.672594, -0.7785076, -2.734793, 1, 1, 1, 1, 1,
-1.672096, 1.614425, -1.6999, 0, 0, 1, 1, 1,
-1.658589, -0.6164137, -2.191307, 1, 0, 0, 1, 1,
-1.652665, 0.4983103, 0.114186, 1, 0, 0, 1, 1,
-1.634927, -0.3883453, -1.201306, 1, 0, 0, 1, 1,
-1.632644, -0.1198912, -1.244455, 1, 0, 0, 1, 1,
-1.624665, 0.5469257, 0.7765186, 1, 0, 0, 1, 1,
-1.603743, 0.841557, -0.4807079, 0, 0, 0, 1, 1,
-1.599448, -0.822103, -1.794248, 0, 0, 0, 1, 1,
-1.596659, -0.903179, -0.4746145, 0, 0, 0, 1, 1,
-1.595024, -0.3844792, -1.171892, 0, 0, 0, 1, 1,
-1.585912, 0.9543968, -2.903783, 0, 0, 0, 1, 1,
-1.583586, -1.98163, -3.389702, 0, 0, 0, 1, 1,
-1.581426, 0.8069581, -0.6728583, 0, 0, 0, 1, 1,
-1.578827, -0.512784, -1.32084, 1, 1, 1, 1, 1,
-1.565807, 0.1645626, -0.3054103, 1, 1, 1, 1, 1,
-1.564964, 0.2624605, -2.426111, 1, 1, 1, 1, 1,
-1.557096, -0.09087422, -2.708616, 1, 1, 1, 1, 1,
-1.554527, -0.4081122, -1.061087, 1, 1, 1, 1, 1,
-1.549872, 0.5697361, -2.116043, 1, 1, 1, 1, 1,
-1.539579, -0.4668128, -1.039413, 1, 1, 1, 1, 1,
-1.537402, -0.1871928, -1.657435, 1, 1, 1, 1, 1,
-1.536374, -0.2464684, -2.29653, 1, 1, 1, 1, 1,
-1.534504, 0.7934569, -2.029275, 1, 1, 1, 1, 1,
-1.534291, -0.05112945, -1.340052, 1, 1, 1, 1, 1,
-1.532574, 1.128543, -1.657017, 1, 1, 1, 1, 1,
-1.521007, 2.141328, -2.428967, 1, 1, 1, 1, 1,
-1.519201, -0.3736198, -2.268212, 1, 1, 1, 1, 1,
-1.518779, 0.4062226, -1.232487, 1, 1, 1, 1, 1,
-1.511681, 0.419848, -0.9275808, 0, 0, 1, 1, 1,
-1.505638, 0.1757448, -0.8219284, 1, 0, 0, 1, 1,
-1.50501, -2.054035, -3.265498, 1, 0, 0, 1, 1,
-1.504296, 0.3838131, -1.375796, 1, 0, 0, 1, 1,
-1.494437, -1.703754, -1.854621, 1, 0, 0, 1, 1,
-1.49355, -0.323779, -2.219884, 1, 0, 0, 1, 1,
-1.492117, 0.1686959, 0.3234996, 0, 0, 0, 1, 1,
-1.491022, 0.7080655, -1.135975, 0, 0, 0, 1, 1,
-1.479866, -1.535792, -2.444836, 0, 0, 0, 1, 1,
-1.469592, 0.7620344, -1.040791, 0, 0, 0, 1, 1,
-1.456843, -0.4403172, -1.375419, 0, 0, 0, 1, 1,
-1.444723, -0.9210309, -0.7523549, 0, 0, 0, 1, 1,
-1.43504, 0.2002572, -2.101498, 0, 0, 0, 1, 1,
-1.434446, -0.009698183, -0.9152246, 1, 1, 1, 1, 1,
-1.433833, 0.06383554, -0.4676156, 1, 1, 1, 1, 1,
-1.420913, -0.6626595, -4.288967, 1, 1, 1, 1, 1,
-1.417186, 0.3478952, -2.307222, 1, 1, 1, 1, 1,
-1.413767, 0.6935568, -1.350438, 1, 1, 1, 1, 1,
-1.411855, -0.3613706, -1.569638, 1, 1, 1, 1, 1,
-1.405903, 1.254827, -0.6192564, 1, 1, 1, 1, 1,
-1.405596, 0.5415541, -0.7219143, 1, 1, 1, 1, 1,
-1.399691, 0.797721, -2.207035, 1, 1, 1, 1, 1,
-1.396278, 1.160167, -0.1559655, 1, 1, 1, 1, 1,
-1.392632, 0.4224304, -0.7467716, 1, 1, 1, 1, 1,
-1.388171, -0.6154041, -3.722094, 1, 1, 1, 1, 1,
-1.386897, 0.448824, -1.789911, 1, 1, 1, 1, 1,
-1.383523, 1.710944, -0.01748227, 1, 1, 1, 1, 1,
-1.374795, -0.01955974, -1.411526, 1, 1, 1, 1, 1,
-1.372482, -0.6840121, -1.944435, 0, 0, 1, 1, 1,
-1.372091, -0.08640826, -2.156839, 1, 0, 0, 1, 1,
-1.365045, -0.7264696, -2.574827, 1, 0, 0, 1, 1,
-1.364246, 0.8213421, -0.4633251, 1, 0, 0, 1, 1,
-1.360928, -1.155581, -2.579758, 1, 0, 0, 1, 1,
-1.35187, -1.685029, -1.694778, 1, 0, 0, 1, 1,
-1.351396, 1.205034, -1.10184, 0, 0, 0, 1, 1,
-1.348772, 0.1306293, -1.313075, 0, 0, 0, 1, 1,
-1.344775, 0.4522176, -2.135842, 0, 0, 0, 1, 1,
-1.335074, 0.4097053, -1.134035, 0, 0, 0, 1, 1,
-1.317157, -0.2754633, -1.890223, 0, 0, 0, 1, 1,
-1.315679, 0.6801793, 0.151069, 0, 0, 0, 1, 1,
-1.307836, -1.57819, -1.423108, 0, 0, 0, 1, 1,
-1.306353, 1.422585, -0.8995075, 1, 1, 1, 1, 1,
-1.297641, -1.596692, -2.380332, 1, 1, 1, 1, 1,
-1.27639, -0.6407137, -1.601787, 1, 1, 1, 1, 1,
-1.274784, -1.535635, -1.376165, 1, 1, 1, 1, 1,
-1.271957, -1.995245, -3.470343, 1, 1, 1, 1, 1,
-1.270763, 1.609569, -0.9919184, 1, 1, 1, 1, 1,
-1.269964, -0.5790678, -1.120754, 1, 1, 1, 1, 1,
-1.264415, 1.72446, -0.5681054, 1, 1, 1, 1, 1,
-1.255215, 0.4189389, -2.458126, 1, 1, 1, 1, 1,
-1.253417, 0.3775669, -2.161274, 1, 1, 1, 1, 1,
-1.250436, -0.7804418, 0.8667526, 1, 1, 1, 1, 1,
-1.24953, 0.5127317, -0.1433504, 1, 1, 1, 1, 1,
-1.245857, -0.7660226, -2.006506, 1, 1, 1, 1, 1,
-1.242102, 1.05746, -0.9994435, 1, 1, 1, 1, 1,
-1.236181, -0.04608279, -1.820081, 1, 1, 1, 1, 1,
-1.233012, -0.2922793, -2.511631, 0, 0, 1, 1, 1,
-1.215632, 1.267987, -1.105146, 1, 0, 0, 1, 1,
-1.215227, -2.030819, -3.31162, 1, 0, 0, 1, 1,
-1.21475, -1.717916, -1.089749, 1, 0, 0, 1, 1,
-1.210376, 1.411198, -0.4579524, 1, 0, 0, 1, 1,
-1.209062, 0.06267454, -1.703655, 1, 0, 0, 1, 1,
-1.203623, 1.001065, -0.2352389, 0, 0, 0, 1, 1,
-1.194919, 0.06483756, -2.739167, 0, 0, 0, 1, 1,
-1.185018, 1.11903, 0.9930921, 0, 0, 0, 1, 1,
-1.184161, -1.415871, -1.679495, 0, 0, 0, 1, 1,
-1.181224, -0.3794041, -1.755613, 0, 0, 0, 1, 1,
-1.179935, -0.9761834, -1.206214, 0, 0, 0, 1, 1,
-1.178, 2.136508, 1.121622, 0, 0, 0, 1, 1,
-1.17753, -0.895094, -4.725696, 1, 1, 1, 1, 1,
-1.169681, 0.797755, -0.7641938, 1, 1, 1, 1, 1,
-1.166927, 0.2709708, -1.2224, 1, 1, 1, 1, 1,
-1.164791, -1.445404, -1.396486, 1, 1, 1, 1, 1,
-1.158563, 1.681209, -1.560905, 1, 1, 1, 1, 1,
-1.153264, 2.074598, -0.4952372, 1, 1, 1, 1, 1,
-1.143809, 1.876755, -1.717238, 1, 1, 1, 1, 1,
-1.143193, 1.594494, -2.381691, 1, 1, 1, 1, 1,
-1.139446, 0.7774224, -1.38935, 1, 1, 1, 1, 1,
-1.137831, -1.08186, -1.440924, 1, 1, 1, 1, 1,
-1.13277, -1.272274, -1.560681, 1, 1, 1, 1, 1,
-1.12715, 0.1098599, -2.731579, 1, 1, 1, 1, 1,
-1.12165, -1.143907, -2.852865, 1, 1, 1, 1, 1,
-1.11943, 0.8656114, -0.3979007, 1, 1, 1, 1, 1,
-1.108407, 0.4628088, -1.39462, 1, 1, 1, 1, 1,
-1.105767, 0.979835, -0.7521951, 0, 0, 1, 1, 1,
-1.073326, 0.4283219, -1.194137, 1, 0, 0, 1, 1,
-1.071926, -1.757423, -1.724082, 1, 0, 0, 1, 1,
-1.062602, -0.4652895, -0.3962173, 1, 0, 0, 1, 1,
-1.055175, 1.704645, -0.9198913, 1, 0, 0, 1, 1,
-1.051264, 0.08562123, 0.6710111, 1, 0, 0, 1, 1,
-1.048352, 0.1185859, -1.773085, 0, 0, 0, 1, 1,
-1.041027, -2.05164, -1.75627, 0, 0, 0, 1, 1,
-1.036838, -0.9573036, -2.847301, 0, 0, 0, 1, 1,
-1.034017, 0.34881, -2.519012, 0, 0, 0, 1, 1,
-1.028525, -0.4582553, -1.449457, 0, 0, 0, 1, 1,
-1.023279, -0.8505372, -0.502815, 0, 0, 0, 1, 1,
-1.019509, -1.446153, -2.428506, 0, 0, 0, 1, 1,
-1.017828, 0.1970855, -0.7250967, 1, 1, 1, 1, 1,
-1.016753, -1.201508, -2.278538, 1, 1, 1, 1, 1,
-1.0123, 0.1849772, -2.115235, 1, 1, 1, 1, 1,
-1.00907, 0.9242338, -1.400207, 1, 1, 1, 1, 1,
-1.007435, 0.1860714, -2.924074, 1, 1, 1, 1, 1,
-1.000675, -2.465097, -3.512761, 1, 1, 1, 1, 1,
-0.9999431, 0.5272793, -0.7762137, 1, 1, 1, 1, 1,
-0.9993645, 0.5212709, -2.042572, 1, 1, 1, 1, 1,
-0.9926388, 0.7585775, -0.9480908, 1, 1, 1, 1, 1,
-0.9872764, 0.3995731, 0.04519013, 1, 1, 1, 1, 1,
-0.9862754, -0.7301285, -1.469725, 1, 1, 1, 1, 1,
-0.9842513, 1.168649, -2.263695, 1, 1, 1, 1, 1,
-0.9800001, -0.278547, -2.620234, 1, 1, 1, 1, 1,
-0.9782788, -1.45399, -2.521831, 1, 1, 1, 1, 1,
-0.9741515, -1.014398, -2.699122, 1, 1, 1, 1, 1,
-0.9692084, -1.035738, -2.021308, 0, 0, 1, 1, 1,
-0.9577421, -1.597442, -2.643076, 1, 0, 0, 1, 1,
-0.9515201, -0.5822935, -1.805249, 1, 0, 0, 1, 1,
-0.9506435, -0.2948063, -2.547248, 1, 0, 0, 1, 1,
-0.9500161, -1.089548, -1.181687, 1, 0, 0, 1, 1,
-0.9427656, -0.7571212, -0.5367714, 1, 0, 0, 1, 1,
-0.940593, -0.1565491, -0.4938447, 0, 0, 0, 1, 1,
-0.9384694, 1.074613, -3.455848, 0, 0, 0, 1, 1,
-0.9370892, -2.205, -3.766513, 0, 0, 0, 1, 1,
-0.9261867, -1.001436, -1.337576, 0, 0, 0, 1, 1,
-0.9244034, -0.03804332, -0.7649354, 0, 0, 0, 1, 1,
-0.9231489, 0.09813102, -2.668735, 0, 0, 0, 1, 1,
-0.9214768, -0.9873212, -3.410454, 0, 0, 0, 1, 1,
-0.9107483, 1.063013, -0.8421865, 1, 1, 1, 1, 1,
-0.9095359, 0.5192202, -2.70157, 1, 1, 1, 1, 1,
-0.9086425, 0.07515592, -1.065877, 1, 1, 1, 1, 1,
-0.8996347, -1.128042, -2.691962, 1, 1, 1, 1, 1,
-0.8989523, 1.06688, -0.8653467, 1, 1, 1, 1, 1,
-0.8954913, 0.5584816, -1.740671, 1, 1, 1, 1, 1,
-0.889284, 0.574701, -1.157337, 1, 1, 1, 1, 1,
-0.8860457, -0.08002339, -1.60486, 1, 1, 1, 1, 1,
-0.8792788, 0.2279471, -2.648071, 1, 1, 1, 1, 1,
-0.8786902, -0.919949, -3.284693, 1, 1, 1, 1, 1,
-0.875389, -0.5328736, -1.570055, 1, 1, 1, 1, 1,
-0.8709924, -0.1677562, -2.783692, 1, 1, 1, 1, 1,
-0.8697984, 0.4549222, -0.300604, 1, 1, 1, 1, 1,
-0.8687596, -1.947591, -2.981211, 1, 1, 1, 1, 1,
-0.8668675, -2.003606, -1.3926, 1, 1, 1, 1, 1,
-0.8660849, 1.526763, -0.9057637, 0, 0, 1, 1, 1,
-0.8655159, 0.4694113, -0.3385248, 1, 0, 0, 1, 1,
-0.8583165, -1.57196, -2.681641, 1, 0, 0, 1, 1,
-0.8525022, 0.4634547, -0.7770798, 1, 0, 0, 1, 1,
-0.8500616, -0.4517226, -0.8807284, 1, 0, 0, 1, 1,
-0.8482621, 0.3555541, 0.3538361, 1, 0, 0, 1, 1,
-0.846956, -2.613175, -2.797254, 0, 0, 0, 1, 1,
-0.8461621, -1.436526, -2.38134, 0, 0, 0, 1, 1,
-0.8451422, 0.8719205, -0.0458842, 0, 0, 0, 1, 1,
-0.8446491, 2.390109, -1.233849, 0, 0, 0, 1, 1,
-0.8353211, 0.1146107, 0.4243064, 0, 0, 0, 1, 1,
-0.8326705, 0.2177413, -2.432038, 0, 0, 0, 1, 1,
-0.8316808, 0.3432423, -1.623378, 0, 0, 0, 1, 1,
-0.8225258, 0.6873776, -0.2732514, 1, 1, 1, 1, 1,
-0.8208773, -0.2053645, -2.223845, 1, 1, 1, 1, 1,
-0.8202187, 0.8242703, 1.326032, 1, 1, 1, 1, 1,
-0.8157868, -0.4029393, -3.544166, 1, 1, 1, 1, 1,
-0.8157352, 0.1391422, -1.85864, 1, 1, 1, 1, 1,
-0.8126565, 0.0801333, 1.225849, 1, 1, 1, 1, 1,
-0.812216, -0.3544999, -1.724054, 1, 1, 1, 1, 1,
-0.8112314, 0.6018333, -0.5235111, 1, 1, 1, 1, 1,
-0.8051461, 0.4992995, -1.559807, 1, 1, 1, 1, 1,
-0.8037738, -1.01293, -3.129442, 1, 1, 1, 1, 1,
-0.8033273, -0.4395608, -3.965871, 1, 1, 1, 1, 1,
-0.8012114, -0.3588521, -3.008079, 1, 1, 1, 1, 1,
-0.7992014, -0.3065495, -2.281709, 1, 1, 1, 1, 1,
-0.7986556, 0.5420079, -2.810358, 1, 1, 1, 1, 1,
-0.7961856, 1.410288, 0.5769187, 1, 1, 1, 1, 1,
-0.7947758, -0.0160159, -0.8108009, 0, 0, 1, 1, 1,
-0.7918496, 0.8029528, -0.9395081, 1, 0, 0, 1, 1,
-0.7902536, 0.8240272, -2.052535, 1, 0, 0, 1, 1,
-0.7878544, -0.006988104, -2.583142, 1, 0, 0, 1, 1,
-0.787562, -0.7832222, -2.211668, 1, 0, 0, 1, 1,
-0.7686979, -0.4263849, -1.208393, 1, 0, 0, 1, 1,
-0.7649931, 0.6130217, -2.784995, 0, 0, 0, 1, 1,
-0.7634827, -0.1698866, -0.8314942, 0, 0, 0, 1, 1,
-0.7634334, 0.1049721, -1.090533, 0, 0, 0, 1, 1,
-0.7514163, 1.446254, 0.3991678, 0, 0, 0, 1, 1,
-0.750401, -0.2919957, -2.662048, 0, 0, 0, 1, 1,
-0.7440127, -1.058583, -2.210114, 0, 0, 0, 1, 1,
-0.7347075, 0.3057427, -1.009865, 0, 0, 0, 1, 1,
-0.7308519, 1.002884, -0.2397383, 1, 1, 1, 1, 1,
-0.7190075, -0.1709826, -2.673528, 1, 1, 1, 1, 1,
-0.7183532, 0.6182734, -0.4759767, 1, 1, 1, 1, 1,
-0.7154993, 0.612404, 0.1292025, 1, 1, 1, 1, 1,
-0.7141902, -0.3482921, -2.349344, 1, 1, 1, 1, 1,
-0.7114348, 0.5954344, -0.5591197, 1, 1, 1, 1, 1,
-0.706816, 0.6594561, -0.9263478, 1, 1, 1, 1, 1,
-0.7033864, -1.377562, -1.698785, 1, 1, 1, 1, 1,
-0.701334, -0.3366007, -1.170159, 1, 1, 1, 1, 1,
-0.6920121, 0.3757673, -1.563214, 1, 1, 1, 1, 1,
-0.690031, 0.6584184, -3.186263, 1, 1, 1, 1, 1,
-0.6856275, 0.4042182, -1.678833, 1, 1, 1, 1, 1,
-0.6846635, -1.660868, -3.313901, 1, 1, 1, 1, 1,
-0.6822496, 0.0964099, -0.5930551, 1, 1, 1, 1, 1,
-0.6815612, 0.8545864, -0.3439546, 1, 1, 1, 1, 1,
-0.6803628, -0.04513012, -2.266641, 0, 0, 1, 1, 1,
-0.6750387, 0.759864, -1.51602, 1, 0, 0, 1, 1,
-0.6659994, 0.3482851, -0.3547595, 1, 0, 0, 1, 1,
-0.6647955, -1.379297, -3.175789, 1, 0, 0, 1, 1,
-0.6646323, 0.865907, -2.395045, 1, 0, 0, 1, 1,
-0.6606501, 1.422315, 0.3733467, 1, 0, 0, 1, 1,
-0.6584788, 0.7962351, -1.773332, 0, 0, 0, 1, 1,
-0.654238, 0.7923991, 0.1555599, 0, 0, 0, 1, 1,
-0.6522503, 0.9504546, -0.5611954, 0, 0, 0, 1, 1,
-0.6433521, -0.3211241, -2.030859, 0, 0, 0, 1, 1,
-0.642025, -0.3988018, -0.1560507, 0, 0, 0, 1, 1,
-0.6399937, -0.2403497, -3.024662, 0, 0, 0, 1, 1,
-0.6387181, 1.504261, 1.636738, 0, 0, 0, 1, 1,
-0.6341431, -0.2447662, -0.8630045, 1, 1, 1, 1, 1,
-0.6300433, 0.6849076, -0.6990383, 1, 1, 1, 1, 1,
-0.629971, -1.593905, -2.044655, 1, 1, 1, 1, 1,
-0.6293268, 0.003596678, -2.519148, 1, 1, 1, 1, 1,
-0.628535, 0.8370912, 0.05555353, 1, 1, 1, 1, 1,
-0.6262555, -0.7919354, -2.406464, 1, 1, 1, 1, 1,
-0.6233882, 0.9422654, -3.023694, 1, 1, 1, 1, 1,
-0.6225582, -0.3317918, -2.333786, 1, 1, 1, 1, 1,
-0.62248, 1.946746, -3.520384, 1, 1, 1, 1, 1,
-0.6207649, -0.6923689, -1.303208, 1, 1, 1, 1, 1,
-0.6145743, -1.24626, -2.864162, 1, 1, 1, 1, 1,
-0.6141004, 0.8120759, -0.3265657, 1, 1, 1, 1, 1,
-0.6111101, 0.02026583, -0.8347613, 1, 1, 1, 1, 1,
-0.6070255, -0.7799515, -4.123693, 1, 1, 1, 1, 1,
-0.6055385, 0.2422844, -1.221613, 1, 1, 1, 1, 1,
-0.6032831, -0.1961519, -2.632823, 0, 0, 1, 1, 1,
-0.6026812, 2.066569, -1.395463, 1, 0, 0, 1, 1,
-0.6004094, -0.6010402, -1.405568, 1, 0, 0, 1, 1,
-0.5943301, 0.5885651, -1.703912, 1, 0, 0, 1, 1,
-0.592374, -0.90817, -4.684193, 1, 0, 0, 1, 1,
-0.5871269, -0.6509477, 0.08184185, 1, 0, 0, 1, 1,
-0.5857779, -0.9115756, -2.452356, 0, 0, 0, 1, 1,
-0.5843863, 1.905305, -0.5071564, 0, 0, 0, 1, 1,
-0.5818883, -1.644633, -1.289173, 0, 0, 0, 1, 1,
-0.5783296, -0.4292808, -2.901833, 0, 0, 0, 1, 1,
-0.5694869, -0.4859192, -1.378518, 0, 0, 0, 1, 1,
-0.5645001, -1.727645, -4.102583, 0, 0, 0, 1, 1,
-0.5627375, 0.226545, -1.304231, 0, 0, 0, 1, 1,
-0.5571427, 0.1538227, 0.577858, 1, 1, 1, 1, 1,
-0.5536883, 0.5047274, -1.43384, 1, 1, 1, 1, 1,
-0.5535246, 0.8771402, 0.895204, 1, 1, 1, 1, 1,
-0.5507901, 2.308435, 0.2816587, 1, 1, 1, 1, 1,
-0.548396, -0.3163228, -1.372981, 1, 1, 1, 1, 1,
-0.5477703, -0.6947374, -3.886533, 1, 1, 1, 1, 1,
-0.5458187, 1.340409, -1.965952, 1, 1, 1, 1, 1,
-0.5418717, -0.313369, -3.074775, 1, 1, 1, 1, 1,
-0.5268154, -0.5612759, 0.5626614, 1, 1, 1, 1, 1,
-0.5237663, 0.7382999, -0.7476528, 1, 1, 1, 1, 1,
-0.5217535, -0.6476674, -3.063419, 1, 1, 1, 1, 1,
-0.5213674, 0.0283265, -0.5864061, 1, 1, 1, 1, 1,
-0.520458, 2.573131, -0.2190329, 1, 1, 1, 1, 1,
-0.5188948, 0.7180054, -0.9056492, 1, 1, 1, 1, 1,
-0.5186238, -0.5048361, -2.506699, 1, 1, 1, 1, 1,
-0.5162553, 0.5584145, -0.850423, 0, 0, 1, 1, 1,
-0.5162216, -2.207119, -1.382215, 1, 0, 0, 1, 1,
-0.5150499, 1.582842, 0.5606821, 1, 0, 0, 1, 1,
-0.5133566, -0.7494822, -2.893749, 1, 0, 0, 1, 1,
-0.5121152, -0.09527849, -2.561312, 1, 0, 0, 1, 1,
-0.5108287, 0.752561, -0.4483798, 1, 0, 0, 1, 1,
-0.5105968, -1.423108, -3.0577, 0, 0, 0, 1, 1,
-0.5085161, 1.864284, -0.1490757, 0, 0, 0, 1, 1,
-0.4999798, -0.3447676, -1.459702, 0, 0, 0, 1, 1,
-0.4998145, -1.280817, -4.327535, 0, 0, 0, 1, 1,
-0.49818, -0.3655124, -3.184047, 0, 0, 0, 1, 1,
-0.4952579, -0.8806455, -2.666055, 0, 0, 0, 1, 1,
-0.4937401, -1.517579, -3.157517, 0, 0, 0, 1, 1,
-0.4932587, 0.4511926, -0.3436392, 1, 1, 1, 1, 1,
-0.4928868, 0.6700361, -0.9723273, 1, 1, 1, 1, 1,
-0.47772, 0.3994599, -0.1698622, 1, 1, 1, 1, 1,
-0.4754357, -0.9176278, -2.598452, 1, 1, 1, 1, 1,
-0.4744609, -0.2765934, -0.7678407, 1, 1, 1, 1, 1,
-0.4712754, -0.9331738, -2.455633, 1, 1, 1, 1, 1,
-0.4704734, -0.5038193, -2.042202, 1, 1, 1, 1, 1,
-0.4674642, 0.6145183, 1.2029, 1, 1, 1, 1, 1,
-0.4661464, -1.190192, -2.944375, 1, 1, 1, 1, 1,
-0.4646505, 0.7508709, -2.108337, 1, 1, 1, 1, 1,
-0.4645775, -2.112251, -4.311018, 1, 1, 1, 1, 1,
-0.4633966, 0.9942751, -1.651494, 1, 1, 1, 1, 1,
-0.4618967, -0.6949984, -3.283131, 1, 1, 1, 1, 1,
-0.4601138, 0.9266219, -0.3662457, 1, 1, 1, 1, 1,
-0.4570763, 0.4988966, -0.4079338, 1, 1, 1, 1, 1,
-0.4543658, -0.5161619, -3.111162, 0, 0, 1, 1, 1,
-0.4506046, -0.1759002, -2.497479, 1, 0, 0, 1, 1,
-0.4497431, 0.3671975, -0.1606633, 1, 0, 0, 1, 1,
-0.4488441, 0.7570171, -1.154078, 1, 0, 0, 1, 1,
-0.4472718, -0.6820406, -3.759764, 1, 0, 0, 1, 1,
-0.4469987, -0.755623, -2.37097, 1, 0, 0, 1, 1,
-0.4437173, -0.3272122, -3.040967, 0, 0, 0, 1, 1,
-0.4424737, -0.5814266, -2.094636, 0, 0, 0, 1, 1,
-0.441072, -1.576212, -3.925226, 0, 0, 0, 1, 1,
-0.4405202, 1.517693, -0.07068077, 0, 0, 0, 1, 1,
-0.4392123, 1.987973, -1.204086, 0, 0, 0, 1, 1,
-0.4329778, 2.347279, -1.224338, 0, 0, 0, 1, 1,
-0.4290923, -0.2069008, -3.361792, 0, 0, 0, 1, 1,
-0.4274446, -0.2541017, -2.313224, 1, 1, 1, 1, 1,
-0.4243921, -0.3529054, -1.259208, 1, 1, 1, 1, 1,
-0.4237134, 1.093249, 0.2669636, 1, 1, 1, 1, 1,
-0.4237112, -0.03575571, -1.88623, 1, 1, 1, 1, 1,
-0.4090753, -1.291372, -2.025015, 1, 1, 1, 1, 1,
-0.4087711, 0.1256142, -1.858139, 1, 1, 1, 1, 1,
-0.4086649, 0.5689619, -0.9819484, 1, 1, 1, 1, 1,
-0.408511, 0.4087089, -0.3374327, 1, 1, 1, 1, 1,
-0.4077206, 1.282469, -1.733986, 1, 1, 1, 1, 1,
-0.4004734, -0.5741288, -3.238311, 1, 1, 1, 1, 1,
-0.3990362, 0.2027775, 0.910449, 1, 1, 1, 1, 1,
-0.3924595, -1.091151, -3.175258, 1, 1, 1, 1, 1,
-0.3913774, -0.3386728, -2.885599, 1, 1, 1, 1, 1,
-0.3797488, 0.3073533, -2.169527, 1, 1, 1, 1, 1,
-0.3795137, -0.2201964, -2.939404, 1, 1, 1, 1, 1,
-0.3745732, 0.7254616, -0.3033125, 0, 0, 1, 1, 1,
-0.3743005, -0.6036896, -2.812633, 1, 0, 0, 1, 1,
-0.3728417, -0.7213652, -3.651944, 1, 0, 0, 1, 1,
-0.3713086, 0.6079409, -2.986449, 1, 0, 0, 1, 1,
-0.366118, -1.041257, -2.10361, 1, 0, 0, 1, 1,
-0.3599384, -1.038918, -2.373351, 1, 0, 0, 1, 1,
-0.3567591, -0.08404905, -0.6268891, 0, 0, 0, 1, 1,
-0.3548348, -1.753554, -1.608409, 0, 0, 0, 1, 1,
-0.3547638, -0.8608024, -3.357393, 0, 0, 0, 1, 1,
-0.3527041, 1.350388, 0.2005175, 0, 0, 0, 1, 1,
-0.3484647, -0.6497646, -3.516189, 0, 0, 0, 1, 1,
-0.3481096, -1.543468, -4.335077, 0, 0, 0, 1, 1,
-0.347249, 0.0936747, -1.618461, 0, 0, 0, 1, 1,
-0.3446754, -1.572466, -2.81157, 1, 1, 1, 1, 1,
-0.3422394, 0.4729078, -2.077927, 1, 1, 1, 1, 1,
-0.3409711, 0.4051431, -0.9610088, 1, 1, 1, 1, 1,
-0.3376763, 1.715346, -1.140297, 1, 1, 1, 1, 1,
-0.3362979, -0.31371, -1.606045, 1, 1, 1, 1, 1,
-0.3354354, 0.6167722, -1.822376, 1, 1, 1, 1, 1,
-0.3339436, 1.346169, -0.7454076, 1, 1, 1, 1, 1,
-0.3329841, 1.127447, -2.137046, 1, 1, 1, 1, 1,
-0.3324088, -0.5123026, -3.488866, 1, 1, 1, 1, 1,
-0.3319568, 0.7713047, 0.07966279, 1, 1, 1, 1, 1,
-0.3302167, -0.2234455, -0.5846384, 1, 1, 1, 1, 1,
-0.3295894, -0.01201097, -1.510446, 1, 1, 1, 1, 1,
-0.3285798, -0.3984568, -3.165785, 1, 1, 1, 1, 1,
-0.3183576, 1.112921, -1.001739, 1, 1, 1, 1, 1,
-0.3182116, 0.369449, -1.145093, 1, 1, 1, 1, 1,
-0.3170356, -0.1966962, -2.124767, 0, 0, 1, 1, 1,
-0.3125736, -1.179334, -4.468431, 1, 0, 0, 1, 1,
-0.3102838, -0.9530329, -2.101832, 1, 0, 0, 1, 1,
-0.3099307, -1.243751, -3.831618, 1, 0, 0, 1, 1,
-0.3064421, 1.566349, -1.035269, 1, 0, 0, 1, 1,
-0.3028512, -1.05857, -2.959998, 1, 0, 0, 1, 1,
-0.3023196, 0.4637054, -1.104431, 0, 0, 0, 1, 1,
-0.3006907, -1.272285, -0.8621551, 0, 0, 0, 1, 1,
-0.2972105, 0.8376538, -1.709487, 0, 0, 0, 1, 1,
-0.2935207, -0.9289188, -1.24026, 0, 0, 0, 1, 1,
-0.2917953, -0.3344046, -2.608834, 0, 0, 0, 1, 1,
-0.2811633, -0.4308547, -2.2387, 0, 0, 0, 1, 1,
-0.2763632, 0.04536603, -1.17693, 0, 0, 0, 1, 1,
-0.2666691, -0.0796354, -1.816953, 1, 1, 1, 1, 1,
-0.2622156, -0.7550188, -3.801672, 1, 1, 1, 1, 1,
-0.2598072, 0.4535545, -0.8618535, 1, 1, 1, 1, 1,
-0.2491058, 0.5138709, -0.8065012, 1, 1, 1, 1, 1,
-0.2456618, -0.6451623, -3.429629, 1, 1, 1, 1, 1,
-0.2454655, 2.393375, -0.9702314, 1, 1, 1, 1, 1,
-0.244783, -1.371422, -2.983681, 1, 1, 1, 1, 1,
-0.2395529, 0.3673786, 1.721146, 1, 1, 1, 1, 1,
-0.2394864, 0.503414, -0.6848319, 1, 1, 1, 1, 1,
-0.2378171, 0.8044417, -0.8625975, 1, 1, 1, 1, 1,
-0.2372627, 1.40432, -1.801057, 1, 1, 1, 1, 1,
-0.2344092, -0.7941381, -1.822992, 1, 1, 1, 1, 1,
-0.2324494, 0.9813522, -1.04345, 1, 1, 1, 1, 1,
-0.2310683, 0.2009437, -1.312468, 1, 1, 1, 1, 1,
-0.2240584, -0.03878446, -0.7399371, 1, 1, 1, 1, 1,
-0.2237348, -0.05658673, -3.521053, 0, 0, 1, 1, 1,
-0.2237117, 0.1108195, -1.955505, 1, 0, 0, 1, 1,
-0.2189399, 0.5678272, 0.7324358, 1, 0, 0, 1, 1,
-0.2173059, 0.9914845, 0.2038509, 1, 0, 0, 1, 1,
-0.2168871, 1.220371, -2.071537, 1, 0, 0, 1, 1,
-0.2143662, -0.5096623, -4.88102, 1, 0, 0, 1, 1,
-0.2109695, 1.061283, -1.783331, 0, 0, 0, 1, 1,
-0.2044257, 1.00974, 0.621556, 0, 0, 0, 1, 1,
-0.1973974, 1.367288, -0.3366382, 0, 0, 0, 1, 1,
-0.1955593, -0.2602801, -1.126949, 0, 0, 0, 1, 1,
-0.1912704, 0.2626637, -0.4805132, 0, 0, 0, 1, 1,
-0.1869628, 0.1070952, -2.44072, 0, 0, 0, 1, 1,
-0.1869602, 0.4262495, 0.8494895, 0, 0, 0, 1, 1,
-0.1842535, 1.227916, -0.2041562, 1, 1, 1, 1, 1,
-0.1836, -2.033245, -3.407678, 1, 1, 1, 1, 1,
-0.1829165, -0.8086501, -2.875907, 1, 1, 1, 1, 1,
-0.1823012, -0.09796508, -3.336773, 1, 1, 1, 1, 1,
-0.1781016, 0.4866774, 0.3677325, 1, 1, 1, 1, 1,
-0.1776728, -0.00586013, -2.101777, 1, 1, 1, 1, 1,
-0.1767031, 0.3590749, 0.04844739, 1, 1, 1, 1, 1,
-0.171209, 1.553939, -0.3349365, 1, 1, 1, 1, 1,
-0.1698914, 0.3642409, 0.3183495, 1, 1, 1, 1, 1,
-0.1562887, 0.3413971, -1.629325, 1, 1, 1, 1, 1,
-0.1557155, 1.824268, -2.352948, 1, 1, 1, 1, 1,
-0.1495829, -0.7112705, -1.406908, 1, 1, 1, 1, 1,
-0.1489999, -0.3877306, -2.237888, 1, 1, 1, 1, 1,
-0.1461277, -0.9557377, -3.193693, 1, 1, 1, 1, 1,
-0.1407649, 0.7057693, -0.992777, 1, 1, 1, 1, 1,
-0.1405169, 1.38375, 1.646554, 0, 0, 1, 1, 1,
-0.1324019, 1.633199, -1.534413, 1, 0, 0, 1, 1,
-0.128836, 0.2767497, 0.1865419, 1, 0, 0, 1, 1,
-0.1248519, -0.3592087, -3.15323, 1, 0, 0, 1, 1,
-0.1246512, 1.06137, -0.3864919, 1, 0, 0, 1, 1,
-0.1202777, 0.7695779, 2.340265, 1, 0, 0, 1, 1,
-0.113064, 0.5306205, -1.129673, 0, 0, 0, 1, 1,
-0.110954, 0.303335, 2.064125, 0, 0, 0, 1, 1,
-0.1106546, -1.182142, -2.238592, 0, 0, 0, 1, 1,
-0.1066999, -0.753624, -4.511399, 0, 0, 0, 1, 1,
-0.1043875, -0.2435898, -3.698746, 0, 0, 0, 1, 1,
-0.1037993, 0.9707899, -0.9523924, 0, 0, 0, 1, 1,
-0.1030219, 0.6117474, -1.39231, 0, 0, 0, 1, 1,
-0.1005835, 0.1646059, -0.2407128, 1, 1, 1, 1, 1,
-0.09860658, 0.670054, 1.233305, 1, 1, 1, 1, 1,
-0.08997368, 1.983792, -1.530113, 1, 1, 1, 1, 1,
-0.08937027, -1.100908, -3.232016, 1, 1, 1, 1, 1,
-0.08528148, 1.855476, 1.048589, 1, 1, 1, 1, 1,
-0.08278155, 0.04437174, -2.270161, 1, 1, 1, 1, 1,
-0.08247506, 0.2875961, -0.09719577, 1, 1, 1, 1, 1,
-0.08211661, -0.2001163, -2.013121, 1, 1, 1, 1, 1,
-0.07447875, -0.6869152, -2.560376, 1, 1, 1, 1, 1,
-0.07375797, -0.6380627, -3.071987, 1, 1, 1, 1, 1,
-0.07375433, -0.5915359, -1.430412, 1, 1, 1, 1, 1,
-0.07192962, -0.7401032, -4.282259, 1, 1, 1, 1, 1,
-0.0705149, 0.09022108, 0.5034236, 1, 1, 1, 1, 1,
-0.06970058, 1.386892, 2.168001, 1, 1, 1, 1, 1,
-0.06855565, 0.3780463, 1.943352, 1, 1, 1, 1, 1,
-0.06058491, -0.7271335, -4.044192, 0, 0, 1, 1, 1,
-0.0577471, -1.160315, -2.953639, 1, 0, 0, 1, 1,
-0.05770277, 1.490662, -1.032098, 1, 0, 0, 1, 1,
-0.05755613, 1.779357, -0.9539997, 1, 0, 0, 1, 1,
-0.05304602, 1.000288, -1.216559, 1, 0, 0, 1, 1,
-0.05078957, -0.3895611, -2.34955, 1, 0, 0, 1, 1,
-0.04470074, -1.122315, -3.136525, 0, 0, 0, 1, 1,
-0.04454259, -0.5103849, -1.382525, 0, 0, 0, 1, 1,
-0.0371349, -1.052526, -4.388664, 0, 0, 0, 1, 1,
-0.0347479, -1.145052, -3.447805, 0, 0, 0, 1, 1,
-0.03424375, 0.4490203, -1.407081, 0, 0, 0, 1, 1,
-0.03375238, -0.8802912, -4.209265, 0, 0, 0, 1, 1,
-0.02886055, -1.715324, -2.003906, 0, 0, 0, 1, 1,
-0.01848891, -0.2905345, -3.277033, 1, 1, 1, 1, 1,
-0.01751611, 0.001885652, -1.262974, 1, 1, 1, 1, 1,
-0.01467095, 1.334912, -0.2615875, 1, 1, 1, 1, 1,
-0.01016295, -0.3492771, -3.283439, 1, 1, 1, 1, 1,
-0.00825673, 1.59196, 0.2959173, 1, 1, 1, 1, 1,
-0.006676537, -0.3384491, -3.010358, 1, 1, 1, 1, 1,
-0.0001714994, 1.114139, -1.569412, 1, 1, 1, 1, 1,
0.004056963, 1.405568, 0.1726356, 1, 1, 1, 1, 1,
0.0041935, -1.357258, 3.743209, 1, 1, 1, 1, 1,
0.006967703, -0.5017141, 3.133745, 1, 1, 1, 1, 1,
0.007989549, -1.250099, 2.346254, 1, 1, 1, 1, 1,
0.00828923, -0.2374129, 3.467174, 1, 1, 1, 1, 1,
0.01448917, -0.8578735, 2.207459, 1, 1, 1, 1, 1,
0.01547697, -0.9813781, 1.575912, 1, 1, 1, 1, 1,
0.0166636, 0.316176, -1.930441, 1, 1, 1, 1, 1,
0.01968269, 0.4555427, -0.4549615, 0, 0, 1, 1, 1,
0.01981512, 1.59184, 0.7530053, 1, 0, 0, 1, 1,
0.02037846, 0.5964711, 0.8238572, 1, 0, 0, 1, 1,
0.02430616, -0.1293993, 3.867758, 1, 0, 0, 1, 1,
0.02721648, 0.04836136, 0.5141008, 1, 0, 0, 1, 1,
0.0276407, -0.5772162, 3.582802, 1, 0, 0, 1, 1,
0.03500714, 0.4836347, 1.004364, 0, 0, 0, 1, 1,
0.03624129, -0.7094789, 1.682726, 0, 0, 0, 1, 1,
0.04140467, -0.8726091, 2.186676, 0, 0, 0, 1, 1,
0.04166279, 0.9916129, 0.8165035, 0, 0, 0, 1, 1,
0.04563947, 0.3919756, 0.3904854, 0, 0, 0, 1, 1,
0.04604511, -0.1648571, 4.578277, 0, 0, 0, 1, 1,
0.04792758, 0.02965229, 1.549094, 0, 0, 0, 1, 1,
0.05002904, -0.9840877, 1.645151, 1, 1, 1, 1, 1,
0.05347186, -0.1992135, 0.3330225, 1, 1, 1, 1, 1,
0.05369068, -0.499273, 2.086549, 1, 1, 1, 1, 1,
0.05372059, 0.8206083, -0.9510207, 1, 1, 1, 1, 1,
0.0553533, 0.8368327, -1.515135, 1, 1, 1, 1, 1,
0.05641301, -0.4911192, 2.173517, 1, 1, 1, 1, 1,
0.06307277, -1.389594, 2.970119, 1, 1, 1, 1, 1,
0.06362162, -0.4866378, 2.073452, 1, 1, 1, 1, 1,
0.06471291, -0.2648078, 2.453517, 1, 1, 1, 1, 1,
0.0674566, -0.6618319, 3.82958, 1, 1, 1, 1, 1,
0.06915163, -0.04181134, 2.526198, 1, 1, 1, 1, 1,
0.06920982, 0.941682, -0.8654079, 1, 1, 1, 1, 1,
0.07215751, -0.2220445, 1.633007, 1, 1, 1, 1, 1,
0.07700673, -2.443561, 2.658878, 1, 1, 1, 1, 1,
0.07885868, -0.2244607, 1.988865, 1, 1, 1, 1, 1,
0.0790754, -0.4089802, 3.01539, 0, 0, 1, 1, 1,
0.08248401, -0.6139439, 3.902875, 1, 0, 0, 1, 1,
0.08394461, -0.8492032, 3.079117, 1, 0, 0, 1, 1,
0.08494182, -2.322703, 2.337116, 1, 0, 0, 1, 1,
0.08742335, -0.06805769, 1.114082, 1, 0, 0, 1, 1,
0.08835046, -0.6350295, 3.597956, 1, 0, 0, 1, 1,
0.08912044, 0.9447574, -1.128362, 0, 0, 0, 1, 1,
0.09708519, -0.01608509, 1.158348, 0, 0, 0, 1, 1,
0.09775022, -0.4047945, 1.167025, 0, 0, 0, 1, 1,
0.0978278, 1.472812, 0.6341704, 0, 0, 0, 1, 1,
0.09873785, 0.6542518, -0.05078134, 0, 0, 0, 1, 1,
0.099994, -1.912252, 1.944466, 0, 0, 0, 1, 1,
0.1011618, -0.9167493, 0.7722089, 0, 0, 0, 1, 1,
0.1033065, 0.4174643, 0.04077799, 1, 1, 1, 1, 1,
0.1049413, 0.1675867, 0.0433749, 1, 1, 1, 1, 1,
0.1110175, -0.3931629, 4.153165, 1, 1, 1, 1, 1,
0.1126698, -2.451479, 3.210334, 1, 1, 1, 1, 1,
0.1130371, -1.984957, 2.920959, 1, 1, 1, 1, 1,
0.1183936, -0.1150628, 2.991008, 1, 1, 1, 1, 1,
0.1195639, -0.3701153, 3.138513, 1, 1, 1, 1, 1,
0.1278903, -0.2573946, 1.83285, 1, 1, 1, 1, 1,
0.128993, -0.1326669, 2.006337, 1, 1, 1, 1, 1,
0.1298583, 0.3519916, 0.7255855, 1, 1, 1, 1, 1,
0.1304686, -0.7638496, 1.58954, 1, 1, 1, 1, 1,
0.1325372, 0.6780323, -1.662511, 1, 1, 1, 1, 1,
0.1333397, -0.961184, 1.794515, 1, 1, 1, 1, 1,
0.1385076, 0.8758498, 0.2046211, 1, 1, 1, 1, 1,
0.1419023, 0.1097375, 0.584931, 1, 1, 1, 1, 1,
0.1431686, -0.6174642, 3.280821, 0, 0, 1, 1, 1,
0.1452275, -0.4318311, 2.832731, 1, 0, 0, 1, 1,
0.1483425, 0.1951534, 1.090938, 1, 0, 0, 1, 1,
0.1559289, -0.8571881, 2.197525, 1, 0, 0, 1, 1,
0.1569538, -0.283455, 3.267446, 1, 0, 0, 1, 1,
0.1601831, -0.574225, 4.291337, 1, 0, 0, 1, 1,
0.1661957, -1.674851, 3.251984, 0, 0, 0, 1, 1,
0.1701361, -0.01565974, 1.297698, 0, 0, 0, 1, 1,
0.1745115, -1.035166, 3.201394, 0, 0, 0, 1, 1,
0.1751457, 0.04900526, 2.101177, 0, 0, 0, 1, 1,
0.1752689, -1.299475, 4.299338, 0, 0, 0, 1, 1,
0.1806521, -1.353322, 2.784792, 0, 0, 0, 1, 1,
0.1823491, -0.8951934, 1.30219, 0, 0, 0, 1, 1,
0.1852906, -1.474815, 2.057294, 1, 1, 1, 1, 1,
0.1860719, -0.4503152, 2.741835, 1, 1, 1, 1, 1,
0.1874186, 1.012596, 0.4040247, 1, 1, 1, 1, 1,
0.1934036, -0.9640164, 2.526919, 1, 1, 1, 1, 1,
0.1974456, -0.7605056, 0.410404, 1, 1, 1, 1, 1,
0.2161848, -0.8174397, 3.456079, 1, 1, 1, 1, 1,
0.2209997, 0.2478904, -0.5601716, 1, 1, 1, 1, 1,
0.2217997, 0.979727, -0.5286528, 1, 1, 1, 1, 1,
0.2219327, 0.02114365, 2.326026, 1, 1, 1, 1, 1,
0.2245972, 1.497586, 0.3338944, 1, 1, 1, 1, 1,
0.2298778, -0.6380475, 2.419399, 1, 1, 1, 1, 1,
0.2302347, -1.152808, 4.046302, 1, 1, 1, 1, 1,
0.2317757, -1.565412, 4.180115, 1, 1, 1, 1, 1,
0.2331582, 0.1931871, 2.470425, 1, 1, 1, 1, 1,
0.2370165, 1.493963, 0.01406178, 1, 1, 1, 1, 1,
0.2384975, 0.3838605, -1.524153, 0, 0, 1, 1, 1,
0.2403499, 0.2409621, 0.008772149, 1, 0, 0, 1, 1,
0.2420115, -1.933498, 3.554884, 1, 0, 0, 1, 1,
0.2425574, 0.5397059, -0.5577689, 1, 0, 0, 1, 1,
0.2434321, -1.775688, 1.893674, 1, 0, 0, 1, 1,
0.2446316, -1.351705, 1.124609, 1, 0, 0, 1, 1,
0.2468681, 0.624423, 0.5856212, 0, 0, 0, 1, 1,
0.2477856, -1.257928, 3.534812, 0, 0, 0, 1, 1,
0.2498885, 1.284046, 0.1269692, 0, 0, 0, 1, 1,
0.2546346, -0.3661812, 1.904343, 0, 0, 0, 1, 1,
0.2555943, 1.70748, 0.5465254, 0, 0, 0, 1, 1,
0.2584926, 0.4922268, 0.6659117, 0, 0, 0, 1, 1,
0.2618062, -0.4955216, 1.657391, 0, 0, 0, 1, 1,
0.2654957, 0.579531, 0.8328671, 1, 1, 1, 1, 1,
0.2668047, 1.303504, 0.890124, 1, 1, 1, 1, 1,
0.2753405, 0.5657499, 0.4915923, 1, 1, 1, 1, 1,
0.2784206, -0.1845259, 0.7776061, 1, 1, 1, 1, 1,
0.2785299, 0.6302693, 0.5661926, 1, 1, 1, 1, 1,
0.2789432, -1.161463, 2.899655, 1, 1, 1, 1, 1,
0.281992, 1.30888, -0.7714615, 1, 1, 1, 1, 1,
0.2869056, -0.453869, 1.654462, 1, 1, 1, 1, 1,
0.2886831, -0.4730289, 2.662387, 1, 1, 1, 1, 1,
0.289123, 0.6705196, 1.287464, 1, 1, 1, 1, 1,
0.2933274, -0.285652, 1.736209, 1, 1, 1, 1, 1,
0.2970997, 0.4296252, 1.856798, 1, 1, 1, 1, 1,
0.2978151, 0.6477315, 0.3603871, 1, 1, 1, 1, 1,
0.3068194, -0.3139493, 1.881878, 1, 1, 1, 1, 1,
0.3069032, 0.156937, 2.021435, 1, 1, 1, 1, 1,
0.3160517, 1.303078, 0.4146543, 0, 0, 1, 1, 1,
0.3194933, 0.1661905, -0.7859413, 1, 0, 0, 1, 1,
0.3246402, 0.05490527, 1.484424, 1, 0, 0, 1, 1,
0.325175, 0.9549818, 0.6825911, 1, 0, 0, 1, 1,
0.3281382, 0.9429463, 1.445022, 1, 0, 0, 1, 1,
0.3363813, 0.3392226, 1.318732, 1, 0, 0, 1, 1,
0.3373176, 0.740422, 0.8139675, 0, 0, 0, 1, 1,
0.3398086, -0.1326649, 1.59015, 0, 0, 0, 1, 1,
0.3437678, -0.06434859, 1.249591, 0, 0, 0, 1, 1,
0.345185, -0.8287063, 2.685549, 0, 0, 0, 1, 1,
0.3486409, 0.6900142, -0.04012814, 0, 0, 0, 1, 1,
0.3529786, -0.2723432, 2.568973, 0, 0, 0, 1, 1,
0.3550497, 0.3716671, 0.1853422, 0, 0, 0, 1, 1,
0.3571176, 0.4436017, 0.7220501, 1, 1, 1, 1, 1,
0.3589554, -0.3815221, 1.704368, 1, 1, 1, 1, 1,
0.3661465, 0.1451171, 0.9847442, 1, 1, 1, 1, 1,
0.3681231, 1.26741, 0.2636259, 1, 1, 1, 1, 1,
0.3756509, -0.6665369, 3.57113, 1, 1, 1, 1, 1,
0.3773777, -0.03529929, 0.2471538, 1, 1, 1, 1, 1,
0.3790129, -1.56724, 2.960126, 1, 1, 1, 1, 1,
0.3795541, -0.4855402, 1.624688, 1, 1, 1, 1, 1,
0.381751, 0.5179293, 1.92435, 1, 1, 1, 1, 1,
0.3827121, -2.178374, 1.185911, 1, 1, 1, 1, 1,
0.3829614, -1.27581, 3.028127, 1, 1, 1, 1, 1,
0.3855168, 0.1289993, -0.3365164, 1, 1, 1, 1, 1,
0.3869413, 0.3002393, 1.935785, 1, 1, 1, 1, 1,
0.3904465, -0.01278574, 2.095005, 1, 1, 1, 1, 1,
0.3929609, 0.2102645, 0.773249, 1, 1, 1, 1, 1,
0.3930659, 0.5289, 0.1316025, 0, 0, 1, 1, 1,
0.3960144, 0.6190677, 2.252411, 1, 0, 0, 1, 1,
0.3979827, 0.7573794, -1.741499, 1, 0, 0, 1, 1,
0.3984887, 0.4849547, 0.9007237, 1, 0, 0, 1, 1,
0.3988589, 0.9084167, 2.443286, 1, 0, 0, 1, 1,
0.4032173, -0.731387, 4.374092, 1, 0, 0, 1, 1,
0.4056899, -0.118624, 2.588251, 0, 0, 0, 1, 1,
0.4058908, 1.051828, -0.4078234, 0, 0, 0, 1, 1,
0.4091074, 0.324032, 1.542435, 0, 0, 0, 1, 1,
0.4091386, 0.4303124, -1.215888, 0, 0, 0, 1, 1,
0.4126829, 0.7256989, 1.058301, 0, 0, 0, 1, 1,
0.4157638, 0.5382894, 0.4567501, 0, 0, 0, 1, 1,
0.4161948, 1.088251, 2.715003, 0, 0, 0, 1, 1,
0.420592, -2.14722, 2.068846, 1, 1, 1, 1, 1,
0.4216789, 0.1946592, 0.4767549, 1, 1, 1, 1, 1,
0.4234273, -0.8087867, 3.902294, 1, 1, 1, 1, 1,
0.4256859, -1.663511, 3.973728, 1, 1, 1, 1, 1,
0.4292648, -2.58228, 3.379061, 1, 1, 1, 1, 1,
0.4302306, 0.429318, 0.8301609, 1, 1, 1, 1, 1,
0.4304016, 1.008178, -0.3299325, 1, 1, 1, 1, 1,
0.4309689, 0.6959547, -0.6467587, 1, 1, 1, 1, 1,
0.4334498, 0.5972401, 0.9687033, 1, 1, 1, 1, 1,
0.4490617, 1.829298, -0.06437526, 1, 1, 1, 1, 1,
0.4500335, 0.3996204, 0.3019277, 1, 1, 1, 1, 1,
0.4541648, -0.4114014, 2.804867, 1, 1, 1, 1, 1,
0.4543948, 0.7639096, 0.2521913, 1, 1, 1, 1, 1,
0.4584371, 0.5381268, 0.4491312, 1, 1, 1, 1, 1,
0.4590687, -0.2750239, 2.709108, 1, 1, 1, 1, 1,
0.4676193, 1.134488, 2.869776, 0, 0, 1, 1, 1,
0.4715265, 0.8693998, -1.440372, 1, 0, 0, 1, 1,
0.4728091, 0.2917716, 2.173551, 1, 0, 0, 1, 1,
0.4759453, 1.316355, 0.8966386, 1, 0, 0, 1, 1,
0.480546, -1.41609, 3.753419, 1, 0, 0, 1, 1,
0.4819473, 0.07673875, 1.0039, 1, 0, 0, 1, 1,
0.4838593, -3.113228, 4.07771, 0, 0, 0, 1, 1,
0.4866981, 0.23978, 2.014493, 0, 0, 0, 1, 1,
0.4872425, -0.3392441, 1.874679, 0, 0, 0, 1, 1,
0.4876838, 1.630187, 1.134429, 0, 0, 0, 1, 1,
0.488067, 0.3256985, -0.554388, 0, 0, 0, 1, 1,
0.4950162, -0.4315571, 2.743894, 0, 0, 0, 1, 1,
0.4964716, -0.5436664, 4.338089, 0, 0, 0, 1, 1,
0.4995781, -0.6925305, 1.681614, 1, 1, 1, 1, 1,
0.5041493, -0.2099331, 2.206648, 1, 1, 1, 1, 1,
0.5102149, 0.6353438, 0.533753, 1, 1, 1, 1, 1,
0.5145079, -0.2415845, 2.030712, 1, 1, 1, 1, 1,
0.5212153, 0.9635106, 1.964782, 1, 1, 1, 1, 1,
0.5231081, -0.3455117, 2.290738, 1, 1, 1, 1, 1,
0.5233626, -0.1370509, 0.09181422, 1, 1, 1, 1, 1,
0.5291243, 0.4490492, 2.122968, 1, 1, 1, 1, 1,
0.5337471, 0.7587062, 0.6615375, 1, 1, 1, 1, 1,
0.5358477, -1.23555, 3.488957, 1, 1, 1, 1, 1,
0.5402144, -0.3612793, 4.342226, 1, 1, 1, 1, 1,
0.5473165, 0.1373599, 0.9093089, 1, 1, 1, 1, 1,
0.5608983, -0.07541333, 2.82122, 1, 1, 1, 1, 1,
0.5636802, 0.9142057, 0.1046833, 1, 1, 1, 1, 1,
0.5706951, 1.662722, 1.225207, 1, 1, 1, 1, 1,
0.5773323, -0.9980155, 2.321413, 0, 0, 1, 1, 1,
0.5837332, 0.5441269, 1.096637, 1, 0, 0, 1, 1,
0.5839553, 0.2622873, 0.6286936, 1, 0, 0, 1, 1,
0.5862354, 1.330826, -0.5007406, 1, 0, 0, 1, 1,
0.5876211, -0.7290547, 1.412415, 1, 0, 0, 1, 1,
0.5996929, -0.8202521, 3.519008, 1, 0, 0, 1, 1,
0.6020119, 0.6054271, -0.1730695, 0, 0, 0, 1, 1,
0.6111606, -0.07206961, 1.778252, 0, 0, 0, 1, 1,
0.6215212, -0.4511744, 3.054415, 0, 0, 0, 1, 1,
0.6249274, -1.208471, 1.247737, 0, 0, 0, 1, 1,
0.6263238, -2.07459, 0.1404138, 0, 0, 0, 1, 1,
0.6296946, -2.45127, 4.212167, 0, 0, 0, 1, 1,
0.6311299, -0.2609762, 1.502818, 0, 0, 0, 1, 1,
0.6315872, -0.382224, 1.591087, 1, 1, 1, 1, 1,
0.6318548, -0.6172073, 3.04264, 1, 1, 1, 1, 1,
0.6350656, 1.006705, 0.9662327, 1, 1, 1, 1, 1,
0.6380537, -0.5367976, 3.683007, 1, 1, 1, 1, 1,
0.6389056, -0.04909357, 2.150744, 1, 1, 1, 1, 1,
0.6402676, -2.072483, 2.682444, 1, 1, 1, 1, 1,
0.6423948, -0.5560314, 3.265335, 1, 1, 1, 1, 1,
0.6445966, -0.2000405, 1.690569, 1, 1, 1, 1, 1,
0.6468268, 0.4580874, 1.529754, 1, 1, 1, 1, 1,
0.6468784, -1.302512, 2.732589, 1, 1, 1, 1, 1,
0.6540774, 1.033586, 0.2218933, 1, 1, 1, 1, 1,
0.6541601, -0.3792267, 1.806855, 1, 1, 1, 1, 1,
0.6629826, -0.4683639, 3.69417, 1, 1, 1, 1, 1,
0.6734967, -1.340097, 2.953331, 1, 1, 1, 1, 1,
0.6843796, -0.3093313, 3.46147, 1, 1, 1, 1, 1,
0.6881088, 1.504963, 1.038341, 0, 0, 1, 1, 1,
0.6926467, 0.496202, -0.5153297, 1, 0, 0, 1, 1,
0.7031165, -0.2125411, 2.649392, 1, 0, 0, 1, 1,
0.7090467, -0.7019909, 2.084821, 1, 0, 0, 1, 1,
0.7107286, 1.513362, 0.632831, 1, 0, 0, 1, 1,
0.7113943, 2.371123, 2.027907, 1, 0, 0, 1, 1,
0.7176688, -0.4395207, 2.902516, 0, 0, 0, 1, 1,
0.71874, 1.086555, 0.1957219, 0, 0, 0, 1, 1,
0.7197956, 0.6081235, -0.2888884, 0, 0, 0, 1, 1,
0.7295355, -0.9445126, 2.000371, 0, 0, 0, 1, 1,
0.7337264, -1.516302, 1.657234, 0, 0, 0, 1, 1,
0.7338539, -0.03388842, -0.5974317, 0, 0, 0, 1, 1,
0.7368361, 1.031526, 1.180772, 0, 0, 0, 1, 1,
0.7384043, 0.5184723, 0.008857594, 1, 1, 1, 1, 1,
0.7390006, 0.3239309, -0.143723, 1, 1, 1, 1, 1,
0.7433135, -0.4340739, 1.895154, 1, 1, 1, 1, 1,
0.7446916, -1.150337, 4.548355, 1, 1, 1, 1, 1,
0.7449952, 1.113758, -0.5805939, 1, 1, 1, 1, 1,
0.746734, -1.427775, 3.024816, 1, 1, 1, 1, 1,
0.7468739, -0.1362057, 1.775776, 1, 1, 1, 1, 1,
0.7473351, -0.2130083, 2.23391, 1, 1, 1, 1, 1,
0.7480476, -1.181041, 3.115704, 1, 1, 1, 1, 1,
0.7600455, -1.738824, 3.579049, 1, 1, 1, 1, 1,
0.7601715, -1.08856, 3.447402, 1, 1, 1, 1, 1,
0.7640141, 2.155489, 1.07642, 1, 1, 1, 1, 1,
0.7653937, -0.240016, 2.32726, 1, 1, 1, 1, 1,
0.7703412, 1.603693, 0.1037595, 1, 1, 1, 1, 1,
0.7705303, -0.04738591, 1.389418, 1, 1, 1, 1, 1,
0.7732575, -0.1108923, 1.655254, 0, 0, 1, 1, 1,
0.7753527, -0.1710186, 2.745055, 1, 0, 0, 1, 1,
0.7803548, 0.6657799, -0.612554, 1, 0, 0, 1, 1,
0.782899, 1.322078, 0.5919809, 1, 0, 0, 1, 1,
0.7891717, -0.0730918, 2.342586, 1, 0, 0, 1, 1,
0.7954118, 0.856667, 0.4906536, 1, 0, 0, 1, 1,
0.7964896, 0.9585713, 1.043337, 0, 0, 0, 1, 1,
0.7973843, 0.5937068, 1.918112, 0, 0, 0, 1, 1,
0.8029077, 1.001426, 0.9991721, 0, 0, 0, 1, 1,
0.8033315, 0.8729815, 1.089877, 0, 0, 0, 1, 1,
0.8056775, -0.07358134, 1.467774, 0, 0, 0, 1, 1,
0.8062966, -0.06945443, 0.6674726, 0, 0, 0, 1, 1,
0.812752, -0.4272295, 3.022756, 0, 0, 0, 1, 1,
0.8254005, -0.9825447, 1.217617, 1, 1, 1, 1, 1,
0.830983, 1.757364, 0.8505659, 1, 1, 1, 1, 1,
0.8328882, -1.777287, 4.263113, 1, 1, 1, 1, 1,
0.8364993, -1.75775, 3.636409, 1, 1, 1, 1, 1,
0.8377236, -0.9433088, 2.723632, 1, 1, 1, 1, 1,
0.8404863, -0.1977708, 1.743655, 1, 1, 1, 1, 1,
0.8443796, -0.2795024, 1.520084, 1, 1, 1, 1, 1,
0.8449578, -1.581231, 2.652848, 1, 1, 1, 1, 1,
0.8514404, 1.902495, 0.421894, 1, 1, 1, 1, 1,
0.851509, -1.255336, 1.140629, 1, 1, 1, 1, 1,
0.8538356, -1.499538, -0.1657038, 1, 1, 1, 1, 1,
0.8566455, -0.6085027, 3.364521, 1, 1, 1, 1, 1,
0.8569097, -0.4249745, 2.602393, 1, 1, 1, 1, 1,
0.8569821, -1.399347, 1.8715, 1, 1, 1, 1, 1,
0.8675825, 1.338794, -0.8414841, 1, 1, 1, 1, 1,
0.8702782, -0.8876255, -0.02426258, 0, 0, 1, 1, 1,
0.8780391, -0.48102, 0.3282281, 1, 0, 0, 1, 1,
0.8802887, 0.2162076, 1.968068, 1, 0, 0, 1, 1,
0.8864499, -0.4085291, 3.225175, 1, 0, 0, 1, 1,
0.8979083, -1.192098, 2.242487, 1, 0, 0, 1, 1,
0.8989469, 0.7488407, 0.6997596, 1, 0, 0, 1, 1,
0.899825, -1.083405, 1.449524, 0, 0, 0, 1, 1,
0.9007814, 1.067318, -0.08383823, 0, 0, 0, 1, 1,
0.9027393, 0.6459632, -0.1095067, 0, 0, 0, 1, 1,
0.903737, 0.2033271, -0.06272227, 0, 0, 0, 1, 1,
0.9112567, -1.410124, 3.234006, 0, 0, 0, 1, 1,
0.911328, -0.5666656, 2.812809, 0, 0, 0, 1, 1,
0.9148374, 0.6582044, 1.57321, 0, 0, 0, 1, 1,
0.9200121, -0.2962544, 1.652051, 1, 1, 1, 1, 1,
0.920168, 0.7074373, -0.4521541, 1, 1, 1, 1, 1,
0.9220725, -0.1273026, -0.6341821, 1, 1, 1, 1, 1,
0.9234629, 1.144793, 0.651037, 1, 1, 1, 1, 1,
0.9262598, 0.5546807, 1.205103, 1, 1, 1, 1, 1,
0.9337605, 1.229158, -0.04682986, 1, 1, 1, 1, 1,
0.9357588, 0.8966459, 0.9775779, 1, 1, 1, 1, 1,
0.9391053, 1.185226, -1.593162, 1, 1, 1, 1, 1,
0.9393827, -0.6470212, 2.012219, 1, 1, 1, 1, 1,
0.9440814, -0.9774524, 2.455187, 1, 1, 1, 1, 1,
0.9465768, 0.1653656, 1.041438, 1, 1, 1, 1, 1,
0.9505638, -0.8472407, 4.243226, 1, 1, 1, 1, 1,
0.9645457, -1.037183, 0.9711499, 1, 1, 1, 1, 1,
0.9671157, -0.4349271, 1.305578, 1, 1, 1, 1, 1,
0.9703478, -0.8838108, 1.641608, 1, 1, 1, 1, 1,
0.970553, -0.8087147, 2.115044, 0, 0, 1, 1, 1,
0.9751817, -0.2001466, 0.9919538, 1, 0, 0, 1, 1,
0.9786805, -0.2873381, 0.6972767, 1, 0, 0, 1, 1,
0.9787829, -0.3315091, 1.123358, 1, 0, 0, 1, 1,
0.9838438, 0.5898097, 1.513646, 1, 0, 0, 1, 1,
0.9904655, -0.4471362, 3.82747, 1, 0, 0, 1, 1,
0.9919765, 0.5307782, 0.8419003, 0, 0, 0, 1, 1,
0.9927187, 0.9719431, 0.7740661, 0, 0, 0, 1, 1,
0.9964339, 0.06738159, 2.258887, 0, 0, 0, 1, 1,
1.005539, 0.9532704, 2.122712, 0, 0, 0, 1, 1,
1.008703, 0.7010756, 1.158375, 0, 0, 0, 1, 1,
1.014569, -0.3005541, 3.226326, 0, 0, 0, 1, 1,
1.018645, 0.5547276, 0.8824727, 0, 0, 0, 1, 1,
1.021556, 0.3601852, 2.244342, 1, 1, 1, 1, 1,
1.025213, -0.1987157, 2.6078, 1, 1, 1, 1, 1,
1.026978, 0.2679653, 0.7306584, 1, 1, 1, 1, 1,
1.029419, 0.5964004, 1.566399, 1, 1, 1, 1, 1,
1.03686, -0.3535973, 1.562201, 1, 1, 1, 1, 1,
1.043059, 0.3150057, 1.51803, 1, 1, 1, 1, 1,
1.050521, -0.5060699, 1.324884, 1, 1, 1, 1, 1,
1.050728, -0.04659712, 0.835918, 1, 1, 1, 1, 1,
1.055261, -0.5450729, 2.630352, 1, 1, 1, 1, 1,
1.056258, -0.449351, 1.85045, 1, 1, 1, 1, 1,
1.0627, 1.056684, 1.104424, 1, 1, 1, 1, 1,
1.066214, -0.5510045, 3.645164, 1, 1, 1, 1, 1,
1.075295, 0.4414576, 1.425858, 1, 1, 1, 1, 1,
1.080489, -0.5571917, 1.030872, 1, 1, 1, 1, 1,
1.086156, -0.08488924, 1.354407, 1, 1, 1, 1, 1,
1.096314, 1.43781, 1.737863, 0, 0, 1, 1, 1,
1.096979, -0.9395152, 4.290852, 1, 0, 0, 1, 1,
1.10085, -0.1246211, 1.152206, 1, 0, 0, 1, 1,
1.109798, -0.132809, 1.894535, 1, 0, 0, 1, 1,
1.119335, -0.08721864, 0.9771267, 1, 0, 0, 1, 1,
1.131487, -0.2432808, 1.603027, 1, 0, 0, 1, 1,
1.133437, 1.412548, -1.194184, 0, 0, 0, 1, 1,
1.13376, 0.2434326, 1.317572, 0, 0, 0, 1, 1,
1.13541, -0.2020427, 1.582084, 0, 0, 0, 1, 1,
1.136273, 0.899055, 0.8450873, 0, 0, 0, 1, 1,
1.138975, 0.7237035, 0.995423, 0, 0, 0, 1, 1,
1.146068, -0.245868, 1.170656, 0, 0, 0, 1, 1,
1.157057, -0.0384092, 1.113385, 0, 0, 0, 1, 1,
1.157625, 1.846172, 0.687949, 1, 1, 1, 1, 1,
1.164712, 0.1084281, 1.219452, 1, 1, 1, 1, 1,
1.164743, -0.2267446, 1.722348, 1, 1, 1, 1, 1,
1.17072, 1.111522, -0.8170745, 1, 1, 1, 1, 1,
1.175875, 1.742295, -0.863, 1, 1, 1, 1, 1,
1.181886, -0.2297918, 3.164362, 1, 1, 1, 1, 1,
1.186662, -0.8743315, 2.608175, 1, 1, 1, 1, 1,
1.187051, 0.7389826, -0.08309674, 1, 1, 1, 1, 1,
1.191787, -2.730805, 2.376885, 1, 1, 1, 1, 1,
1.195366, -1.174227, 1.15204, 1, 1, 1, 1, 1,
1.209108, 1.170789, -0.06590022, 1, 1, 1, 1, 1,
1.216965, -0.2376384, 2.462527, 1, 1, 1, 1, 1,
1.227087, -0.7334042, 2.455474, 1, 1, 1, 1, 1,
1.227551, -2.452821, 4.182889, 1, 1, 1, 1, 1,
1.230324, -0.2867071, 1.82103, 1, 1, 1, 1, 1,
1.230494, -0.2543052, 2.556178, 0, 0, 1, 1, 1,
1.234222, -0.5640462, 4.04554, 1, 0, 0, 1, 1,
1.25138, -0.01632029, 1.867031, 1, 0, 0, 1, 1,
1.256807, -0.8896634, 2.308718, 1, 0, 0, 1, 1,
1.27015, 0.9955562, 2.225989, 1, 0, 0, 1, 1,
1.27475, 1.014063, 2.035095, 1, 0, 0, 1, 1,
1.276667, -0.2179066, 2.616071, 0, 0, 0, 1, 1,
1.27672, -0.1521103, 1.464163, 0, 0, 0, 1, 1,
1.278852, -0.6484835, 2.005786, 0, 0, 0, 1, 1,
1.28533, -0.4428588, 3.043211, 0, 0, 0, 1, 1,
1.286752, 0.6058975, 0.7526525, 0, 0, 0, 1, 1,
1.289786, -0.5238238, 0.4569327, 0, 0, 0, 1, 1,
1.298267, -0.9430951, 3.117905, 0, 0, 0, 1, 1,
1.305094, 0.4345157, 0.8141889, 1, 1, 1, 1, 1,
1.313001, -0.3485763, 2.97114, 1, 1, 1, 1, 1,
1.319688, 0.5891345, 0.6924641, 1, 1, 1, 1, 1,
1.321404, 0.3100724, 1.630617, 1, 1, 1, 1, 1,
1.340628, -0.7519642, 2.897467, 1, 1, 1, 1, 1,
1.352852, -0.4125394, 2.287647, 1, 1, 1, 1, 1,
1.380831, 0.1130572, 1.82868, 1, 1, 1, 1, 1,
1.387597, 0.4928646, 0.9603603, 1, 1, 1, 1, 1,
1.39245, 0.7383119, 2.084482, 1, 1, 1, 1, 1,
1.400669, 0.08310172, 0.7180944, 1, 1, 1, 1, 1,
1.406491, -1.129375, 2.000453, 1, 1, 1, 1, 1,
1.410696, -0.7951387, 1.862838, 1, 1, 1, 1, 1,
1.411356, 0.4806468, 1.260761, 1, 1, 1, 1, 1,
1.422331, 1.273935, 1.57876, 1, 1, 1, 1, 1,
1.437092, -1.240932, 3.956156, 1, 1, 1, 1, 1,
1.451713, -0.1691249, 1.415307, 0, 0, 1, 1, 1,
1.456228, 0.2054982, 1.903035, 1, 0, 0, 1, 1,
1.464973, 0.02626994, 3.128212, 1, 0, 0, 1, 1,
1.473094, 1.742188, 0.357547, 1, 0, 0, 1, 1,
1.476424, -0.2464018, 1.170533, 1, 0, 0, 1, 1,
1.487767, 1.167491, 2.198407, 1, 0, 0, 1, 1,
1.492654, -0.5805743, 0.5018772, 0, 0, 0, 1, 1,
1.497587, -0.0724648, 1.763572, 0, 0, 0, 1, 1,
1.499053, -0.5138823, 1.823517, 0, 0, 0, 1, 1,
1.499546, -0.05378062, 1.364534, 0, 0, 0, 1, 1,
1.502457, 0.3254054, 3.157159, 0, 0, 0, 1, 1,
1.508839, 2.373854, 2.561775, 0, 0, 0, 1, 1,
1.509184, 0.685468, 1.040886, 0, 0, 0, 1, 1,
1.524665, 0.08494609, 0.4391837, 1, 1, 1, 1, 1,
1.530862, -1.832539, 0.8913116, 1, 1, 1, 1, 1,
1.544037, -0.4597644, 2.99009, 1, 1, 1, 1, 1,
1.54733, 0.7546483, 0.9817449, 1, 1, 1, 1, 1,
1.550442, 0.5605375, 0.6754491, 1, 1, 1, 1, 1,
1.559493, 1.382481, 1.948115, 1, 1, 1, 1, 1,
1.574277, 0.2921279, -0.03165976, 1, 1, 1, 1, 1,
1.578159, 2.033842, 1.552335, 1, 1, 1, 1, 1,
1.578843, 0.05547765, 2.913643, 1, 1, 1, 1, 1,
1.580413, 0.2059487, 0.0771669, 1, 1, 1, 1, 1,
1.594246, -0.1244446, 0.1802452, 1, 1, 1, 1, 1,
1.605446, 2.145541, 0.6556943, 1, 1, 1, 1, 1,
1.612314, 0.4862291, 0.7587723, 1, 1, 1, 1, 1,
1.613679, -0.7806619, 3.177883, 1, 1, 1, 1, 1,
1.615428, -0.8237022, 2.168432, 1, 1, 1, 1, 1,
1.620098, -0.5675688, 1.728602, 0, 0, 1, 1, 1,
1.630172, 1.003384, 0.03702312, 1, 0, 0, 1, 1,
1.631194, -0.4256274, 1.420415, 1, 0, 0, 1, 1,
1.631376, 0.6094748, 1.204844, 1, 0, 0, 1, 1,
1.632055, -0.3487013, 1.42695, 1, 0, 0, 1, 1,
1.637164, -0.7649309, 0.5953599, 1, 0, 0, 1, 1,
1.638307, -1.398533, 2.209579, 0, 0, 0, 1, 1,
1.644715, -0.6796208, 3.422512, 0, 0, 0, 1, 1,
1.646092, -0.4518792, 2.066749, 0, 0, 0, 1, 1,
1.67422, -0.9221614, 2.919299, 0, 0, 0, 1, 1,
1.684733, 0.7997835, 0.8634677, 0, 0, 0, 1, 1,
1.695525, 2.97379, 0.8836706, 0, 0, 0, 1, 1,
1.723789, 1.283332, -0.1118923, 0, 0, 0, 1, 1,
1.727059, -1.852444, 3.626824, 1, 1, 1, 1, 1,
1.73541, -1.212376, 3.623036, 1, 1, 1, 1, 1,
1.75971, -0.7042922, 1.390152, 1, 1, 1, 1, 1,
1.780841, 0.7318636, 0.5342658, 1, 1, 1, 1, 1,
1.820347, 0.3661796, 3.429437, 1, 1, 1, 1, 1,
1.873356, 0.9809937, 1.031092, 1, 1, 1, 1, 1,
1.87639, -1.750681, 1.96955, 1, 1, 1, 1, 1,
1.897038, -0.5341313, 1.63943, 1, 1, 1, 1, 1,
1.923158, 2.024328, 0.2786992, 1, 1, 1, 1, 1,
1.926354, 0.9136124, 1.216543, 1, 1, 1, 1, 1,
1.938223, -0.3830929, 2.675512, 1, 1, 1, 1, 1,
1.940617, -1.41788, 2.731803, 1, 1, 1, 1, 1,
1.948933, -0.1410525, 2.117621, 1, 1, 1, 1, 1,
1.955028, 1.848504, 1.134252, 1, 1, 1, 1, 1,
1.994169, -0.9623912, 1.844033, 1, 1, 1, 1, 1,
1.998946, -1.710893, 1.767704, 0, 0, 1, 1, 1,
1.999943, 0.2782828, 1.786265, 1, 0, 0, 1, 1,
2.013779, -0.3191214, 1.570316, 1, 0, 0, 1, 1,
2.020682, -1.436267, 1.94549, 1, 0, 0, 1, 1,
2.024463, -0.15833, 2.72042, 1, 0, 0, 1, 1,
2.038903, 1.15548, 1.267092, 1, 0, 0, 1, 1,
2.041657, 0.1711472, 2.855982, 0, 0, 0, 1, 1,
2.054879, 0.7474294, 0.3789512, 0, 0, 0, 1, 1,
2.055619, 0.8642687, -0.1821027, 0, 0, 0, 1, 1,
2.091489, -1.093399, 2.716722, 0, 0, 0, 1, 1,
2.191034, 0.3833861, 1.058753, 0, 0, 0, 1, 1,
2.218374, 2.712667, -0.02485707, 0, 0, 0, 1, 1,
2.246498, 0.8966066, -0.6301048, 0, 0, 0, 1, 1,
2.286198, -0.7371518, 0.1073963, 1, 1, 1, 1, 1,
2.304358, -1.361334, 2.710076, 1, 1, 1, 1, 1,
2.428094, 0.6029243, 0.8295305, 1, 1, 1, 1, 1,
2.551401, -0.3173622, 1.064797, 1, 1, 1, 1, 1,
2.563504, -0.725463, 0.3230858, 1, 1, 1, 1, 1,
2.619371, 1.808733, 0.417375, 1, 1, 1, 1, 1,
3.128978, 0.5020186, 1.560781, 1, 1, 1, 1, 1
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
var radius = 8.889292;
var distance = 31.22326;
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
mvMatrix.translate( -0.1131911, 0.06971884, 0.1513717 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.22326);
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
