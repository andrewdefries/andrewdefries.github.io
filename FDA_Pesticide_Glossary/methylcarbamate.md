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
-3.320393, 1.587151, -1.081551, 1, 0, 0, 1,
-3.034047, 0.08534515, -0.4997165, 1, 0.007843138, 0, 1,
-2.920243, -0.4968724, -1.914742, 1, 0.01176471, 0, 1,
-2.704337, 0.6623099, -2.106445, 1, 0.01960784, 0, 1,
-2.690973, 0.0008704845, -2.618534, 1, 0.02352941, 0, 1,
-2.592105, 0.9034591, -0.4046285, 1, 0.03137255, 0, 1,
-2.479105, -0.5101069, -0.2578121, 1, 0.03529412, 0, 1,
-2.442548, -0.3396353, -1.794477, 1, 0.04313726, 0, 1,
-2.433109, -0.838796, -2.604217, 1, 0.04705882, 0, 1,
-2.358556, 1.076664, -2.00419, 1, 0.05490196, 0, 1,
-2.289823, -0.08703794, -1.829331, 1, 0.05882353, 0, 1,
-2.24019, -0.2517791, -2.067064, 1, 0.06666667, 0, 1,
-2.229566, -1.927164, -1.566483, 1, 0.07058824, 0, 1,
-2.188834, 0.8067316, -0.9764217, 1, 0.07843138, 0, 1,
-2.181249, 1.989398, -1.296416, 1, 0.08235294, 0, 1,
-2.175802, 0.2401036, -3.703374, 1, 0.09019608, 0, 1,
-2.147646, 1.208837, -0.1351434, 1, 0.09411765, 0, 1,
-2.096179, 1.233165, -0.770793, 1, 0.1019608, 0, 1,
-2.036247, -0.5053461, -1.222594, 1, 0.1098039, 0, 1,
-2.016619, 1.380684, -0.5344725, 1, 0.1137255, 0, 1,
-2.014402, 0.9671879, -1.513161, 1, 0.1215686, 0, 1,
-2.014111, 0.5650337, -1.250123, 1, 0.1254902, 0, 1,
-2.013617, 0.8025107, -0.3875824, 1, 0.1333333, 0, 1,
-2.005817, 1.951377, -2.097797, 1, 0.1372549, 0, 1,
-1.99887, 0.2550541, -2.171102, 1, 0.145098, 0, 1,
-1.99738, 0.7385902, -2.429396, 1, 0.1490196, 0, 1,
-1.975208, 0.6891837, 0.5075512, 1, 0.1568628, 0, 1,
-1.944396, 1.579342, -1.114595, 1, 0.1607843, 0, 1,
-1.929453, -0.6292998, -2.324107, 1, 0.1686275, 0, 1,
-1.927747, 0.4649039, -1.595502, 1, 0.172549, 0, 1,
-1.923985, -0.03201574, -0.6453956, 1, 0.1803922, 0, 1,
-1.904409, 0.9467414, -0.5810227, 1, 0.1843137, 0, 1,
-1.897559, -1.165311, -4.171906, 1, 0.1921569, 0, 1,
-1.885773, -0.1693824, 0.03196988, 1, 0.1960784, 0, 1,
-1.883142, -0.8229192, -2.495251, 1, 0.2039216, 0, 1,
-1.875246, -0.227523, -1.954209, 1, 0.2117647, 0, 1,
-1.86586, -0.1632338, -1.454748, 1, 0.2156863, 0, 1,
-1.862852, 1.047329, -0.6335119, 1, 0.2235294, 0, 1,
-1.856066, -0.3738994, -4.572723, 1, 0.227451, 0, 1,
-1.85262, -0.4665785, -1.178385, 1, 0.2352941, 0, 1,
-1.838195, -0.5573595, -1.884527, 1, 0.2392157, 0, 1,
-1.829035, 0.2659055, -0.6736307, 1, 0.2470588, 0, 1,
-1.790315, 0.6294953, 0.4084944, 1, 0.2509804, 0, 1,
-1.780951, -0.4646996, -2.171759, 1, 0.2588235, 0, 1,
-1.772281, 0.3256402, -2.020309, 1, 0.2627451, 0, 1,
-1.768133, 0.4083093, -1.020205, 1, 0.2705882, 0, 1,
-1.758101, 0.8231747, -1.816616, 1, 0.2745098, 0, 1,
-1.726393, -0.4862369, -3.305566, 1, 0.282353, 0, 1,
-1.724664, 0.3028692, -1.412126, 1, 0.2862745, 0, 1,
-1.713962, 0.3746174, -0.6865035, 1, 0.2941177, 0, 1,
-1.688015, -0.7181693, -1.042248, 1, 0.3019608, 0, 1,
-1.66747, 0.01543567, -2.022354, 1, 0.3058824, 0, 1,
-1.636468, 0.2182766, -1.501257, 1, 0.3137255, 0, 1,
-1.622683, -0.2358336, -1.643517, 1, 0.3176471, 0, 1,
-1.610658, 1.111806, -1.339725, 1, 0.3254902, 0, 1,
-1.605778, 0.1969561, -0.6842866, 1, 0.3294118, 0, 1,
-1.598563, -1.356424, -1.83702, 1, 0.3372549, 0, 1,
-1.592296, 0.9251007, -0.7139621, 1, 0.3411765, 0, 1,
-1.591918, 1.521358, 0.62387, 1, 0.3490196, 0, 1,
-1.590943, -2.264574, -2.17726, 1, 0.3529412, 0, 1,
-1.588452, 0.5855543, -0.005800535, 1, 0.3607843, 0, 1,
-1.567044, -1.743414, -3.263802, 1, 0.3647059, 0, 1,
-1.564649, -1.880684, -4.051276, 1, 0.372549, 0, 1,
-1.554408, 0.2775061, -2.172142, 1, 0.3764706, 0, 1,
-1.553689, 0.3558759, -0.4141468, 1, 0.3843137, 0, 1,
-1.553552, -1.036521, -4.935051, 1, 0.3882353, 0, 1,
-1.549469, 0.02296322, -2.028925, 1, 0.3960784, 0, 1,
-1.546195, -1.575966, -1.88187, 1, 0.4039216, 0, 1,
-1.529101, -1.975682, -2.56404, 1, 0.4078431, 0, 1,
-1.520184, 0.3274755, -2.184282, 1, 0.4156863, 0, 1,
-1.498915, 2.410328, 0.9006292, 1, 0.4196078, 0, 1,
-1.498267, -0.7438917, -0.9904833, 1, 0.427451, 0, 1,
-1.498205, -0.9390453, -2.788498, 1, 0.4313726, 0, 1,
-1.493127, -0.8482829, -3.944635, 1, 0.4392157, 0, 1,
-1.486293, -0.4873026, -1.772476, 1, 0.4431373, 0, 1,
-1.476316, 1.596275, -0.3036675, 1, 0.4509804, 0, 1,
-1.457086, 0.5000066, -0.521807, 1, 0.454902, 0, 1,
-1.448307, 1.952959, -0.04548196, 1, 0.4627451, 0, 1,
-1.447353, -0.9091037, -1.698692, 1, 0.4666667, 0, 1,
-1.44645, -0.8556471, -1.511411, 1, 0.4745098, 0, 1,
-1.430582, 0.9940584, -1.117789, 1, 0.4784314, 0, 1,
-1.423293, 1.269805, -2.540962, 1, 0.4862745, 0, 1,
-1.420583, 1.667135, 0.03422252, 1, 0.4901961, 0, 1,
-1.419421, 0.5661391, -1.878622, 1, 0.4980392, 0, 1,
-1.416158, -0.1447987, -2.436175, 1, 0.5058824, 0, 1,
-1.411279, -0.80134, -3.116172, 1, 0.509804, 0, 1,
-1.405676, 1.621155, 0.2591584, 1, 0.5176471, 0, 1,
-1.405578, -0.5787237, -2.150333, 1, 0.5215687, 0, 1,
-1.405477, 0.6016755, -0.5652995, 1, 0.5294118, 0, 1,
-1.379989, -0.00914128, -1.225342, 1, 0.5333334, 0, 1,
-1.367847, 0.770906, -3.019101, 1, 0.5411765, 0, 1,
-1.35877, 0.5456384, -0.5072977, 1, 0.5450981, 0, 1,
-1.343069, -0.0242811, -2.109089, 1, 0.5529412, 0, 1,
-1.339674, 0.4915452, -1.920048, 1, 0.5568628, 0, 1,
-1.338346, -0.1567207, -0.4885357, 1, 0.5647059, 0, 1,
-1.336839, 0.403279, -0.7837429, 1, 0.5686275, 0, 1,
-1.327612, 0.5023196, -1.053407, 1, 0.5764706, 0, 1,
-1.321883, 0.2899322, -1.3082, 1, 0.5803922, 0, 1,
-1.313036, 1.789718, -0.6656876, 1, 0.5882353, 0, 1,
-1.312652, -0.7819582, -3.645024, 1, 0.5921569, 0, 1,
-1.307678, 0.5672938, -1.693551, 1, 0.6, 0, 1,
-1.300738, -0.6130112, -2.355013, 1, 0.6078432, 0, 1,
-1.298691, 0.6984873, 0.2888685, 1, 0.6117647, 0, 1,
-1.296198, 0.3559539, -1.362738, 1, 0.6196079, 0, 1,
-1.295573, 1.149371, -1.140011, 1, 0.6235294, 0, 1,
-1.294503, 1.53941, -0.4078722, 1, 0.6313726, 0, 1,
-1.284665, 1.975141, -1.757976, 1, 0.6352941, 0, 1,
-1.271383, -1.161709, -2.843721, 1, 0.6431373, 0, 1,
-1.267808, -0.5667612, -1.994597, 1, 0.6470588, 0, 1,
-1.253906, 2.414249, -0.1075681, 1, 0.654902, 0, 1,
-1.241304, -0.2257669, -0.3685195, 1, 0.6588235, 0, 1,
-1.230698, -0.4143181, -1.436233, 1, 0.6666667, 0, 1,
-1.226293, -0.341351, -2.083414, 1, 0.6705883, 0, 1,
-1.209855, -0.5713792, -2.121697, 1, 0.6784314, 0, 1,
-1.195746, -2.437464, -2.682312, 1, 0.682353, 0, 1,
-1.189968, -0.2694426, -2.122896, 1, 0.6901961, 0, 1,
-1.185506, -0.4555314, -0.8939294, 1, 0.6941177, 0, 1,
-1.180824, -1.819989, 0.4399365, 1, 0.7019608, 0, 1,
-1.180722, 0.4891056, -3.205752, 1, 0.7098039, 0, 1,
-1.174686, -1.405729, -3.232177, 1, 0.7137255, 0, 1,
-1.168424, 0.448078, -0.8224875, 1, 0.7215686, 0, 1,
-1.149563, -0.4319962, -3.686018, 1, 0.7254902, 0, 1,
-1.147613, -0.8504869, -2.448844, 1, 0.7333333, 0, 1,
-1.145848, 0.4145297, -1.270579, 1, 0.7372549, 0, 1,
-1.145244, -1.411063, -1.451837, 1, 0.7450981, 0, 1,
-1.127421, 0.09882963, -2.313267, 1, 0.7490196, 0, 1,
-1.126612, -0.1156891, -2.560495, 1, 0.7568628, 0, 1,
-1.125892, 0.9987288, -0.8111781, 1, 0.7607843, 0, 1,
-1.125795, -0.2277066, -1.64672, 1, 0.7686275, 0, 1,
-1.118335, -1.042648, -1.882744, 1, 0.772549, 0, 1,
-1.118235, 0.7884108, -1.050902, 1, 0.7803922, 0, 1,
-1.114866, 0.2097721, -0.6751028, 1, 0.7843137, 0, 1,
-1.114803, -0.1217956, -1.981184, 1, 0.7921569, 0, 1,
-1.107676, 1.103851, -0.2889769, 1, 0.7960784, 0, 1,
-1.104964, 0.4261064, -1.327891, 1, 0.8039216, 0, 1,
-1.104873, -0.3224852, -3.455358, 1, 0.8117647, 0, 1,
-1.104069, 0.5575588, -1.321567, 1, 0.8156863, 0, 1,
-1.101996, -0.7318946, -2.176113, 1, 0.8235294, 0, 1,
-1.096632, 0.05900571, -2.370954, 1, 0.827451, 0, 1,
-1.095135, -0.4030939, -2.514656, 1, 0.8352941, 0, 1,
-1.084625, 0.5498722, -1.006614, 1, 0.8392157, 0, 1,
-1.072703, 0.3922457, -1.126075, 1, 0.8470588, 0, 1,
-1.064804, 0.1188436, -2.833543, 1, 0.8509804, 0, 1,
-1.064415, -1.022574, -1.949475, 1, 0.8588235, 0, 1,
-1.057979, 1.078997, -1.662522, 1, 0.8627451, 0, 1,
-1.057959, 1.147732, 0.5922009, 1, 0.8705882, 0, 1,
-1.046541, -2.157842, -2.560762, 1, 0.8745098, 0, 1,
-1.041812, 0.1835798, -2.091924, 1, 0.8823529, 0, 1,
-1.041622, -0.4203756, -1.483564, 1, 0.8862745, 0, 1,
-1.041512, 0.9351529, -0.5577438, 1, 0.8941177, 0, 1,
-1.037149, -1.447675, -1.061447, 1, 0.8980392, 0, 1,
-1.03031, 0.2223087, -1.776788, 1, 0.9058824, 0, 1,
-1.012828, 0.5689068, 0.6955976, 1, 0.9137255, 0, 1,
-1.009545, 0.579798, -2.073266, 1, 0.9176471, 0, 1,
-1.009077, -1.125396, -2.59479, 1, 0.9254902, 0, 1,
-1.007648, -0.9858475, -1.680227, 1, 0.9294118, 0, 1,
-1.004072, -0.2360532, -0.995177, 1, 0.9372549, 0, 1,
-0.993148, 0.6284299, -2.628018, 1, 0.9411765, 0, 1,
-0.9766917, 1.034582, -0.4115523, 1, 0.9490196, 0, 1,
-0.9762687, 0.2641403, -2.795355, 1, 0.9529412, 0, 1,
-0.9742525, -1.269372, -2.293852, 1, 0.9607843, 0, 1,
-0.9737526, 0.9021779, -1.458199, 1, 0.9647059, 0, 1,
-0.9594463, -0.4605251, -2.207484, 1, 0.972549, 0, 1,
-0.9563996, -0.9688722, -2.050609, 1, 0.9764706, 0, 1,
-0.9562243, -0.6705347, -2.028328, 1, 0.9843137, 0, 1,
-0.9484276, -0.2382724, -1.574371, 1, 0.9882353, 0, 1,
-0.9407626, -0.4893091, -1.701936, 1, 0.9960784, 0, 1,
-0.9395219, -0.3074188, -2.090449, 0.9960784, 1, 0, 1,
-0.9382613, -1.470753, -3.450596, 0.9921569, 1, 0, 1,
-0.9373595, 1.072175, -1.351648, 0.9843137, 1, 0, 1,
-0.9367433, 0.6303303, -0.9902297, 0.9803922, 1, 0, 1,
-0.9359062, -0.03511254, -2.105845, 0.972549, 1, 0, 1,
-0.932381, -0.482709, -1.872944, 0.9686275, 1, 0, 1,
-0.9299436, -0.8815174, -1.671094, 0.9607843, 1, 0, 1,
-0.9227702, 0.9066795, -0.3221674, 0.9568627, 1, 0, 1,
-0.9195601, 1.896476, -0.5389488, 0.9490196, 1, 0, 1,
-0.9183728, 0.2642212, -2.072261, 0.945098, 1, 0, 1,
-0.9164172, 0.9789945, -0.7272937, 0.9372549, 1, 0, 1,
-0.9146101, 1.422353, -0.1646532, 0.9333333, 1, 0, 1,
-0.9066667, 0.7332869, -2.283481, 0.9254902, 1, 0, 1,
-0.9048015, 0.9570406, -1.829512, 0.9215686, 1, 0, 1,
-0.904165, 0.6293585, -0.8468097, 0.9137255, 1, 0, 1,
-0.9013391, 0.486795, -0.1419178, 0.9098039, 1, 0, 1,
-0.9006347, 1.178209, -0.8822495, 0.9019608, 1, 0, 1,
-0.8918754, -1.663335, -3.703847, 0.8941177, 1, 0, 1,
-0.8897976, 1.230491, -0.3503823, 0.8901961, 1, 0, 1,
-0.8846031, 0.04578536, -1.06046, 0.8823529, 1, 0, 1,
-0.8830945, 0.05263934, -0.1376384, 0.8784314, 1, 0, 1,
-0.8807644, -0.4311851, -3.256908, 0.8705882, 1, 0, 1,
-0.8798788, -0.3476289, -1.347531, 0.8666667, 1, 0, 1,
-0.8759827, -2.558452, -2.903985, 0.8588235, 1, 0, 1,
-0.8713303, 0.04118649, -2.352671, 0.854902, 1, 0, 1,
-0.8690171, 0.8209267, -1.449129, 0.8470588, 1, 0, 1,
-0.8599184, 1.333557, -3.200753, 0.8431373, 1, 0, 1,
-0.8562052, -0.222778, -0.6659539, 0.8352941, 1, 0, 1,
-0.8525912, -0.8376318, 0.2161901, 0.8313726, 1, 0, 1,
-0.8497744, -0.2180395, -0.6558125, 0.8235294, 1, 0, 1,
-0.8443428, 0.8664336, -0.6612617, 0.8196079, 1, 0, 1,
-0.8393071, -0.3205969, -2.518275, 0.8117647, 1, 0, 1,
-0.83676, -1.090385, -1.38126, 0.8078431, 1, 0, 1,
-0.8229402, -0.9639964, -2.301473, 0.8, 1, 0, 1,
-0.821122, 0.8746973, -1.510923, 0.7921569, 1, 0, 1,
-0.8202742, 0.9516248, -0.5364245, 0.7882353, 1, 0, 1,
-0.820232, 0.4177487, -1.447009, 0.7803922, 1, 0, 1,
-0.818778, -0.3513514, -1.547175, 0.7764706, 1, 0, 1,
-0.8168818, 1.989691, -0.5623151, 0.7686275, 1, 0, 1,
-0.8141198, 1.625575, -1.519934, 0.7647059, 1, 0, 1,
-0.8080617, 0.4189751, -1.539312, 0.7568628, 1, 0, 1,
-0.8076808, -2.080582, -2.65539, 0.7529412, 1, 0, 1,
-0.8042743, -0.4948534, -1.590454, 0.7450981, 1, 0, 1,
-0.8022355, 1.207734, -0.9326969, 0.7411765, 1, 0, 1,
-0.7987579, -0.3688607, -2.187532, 0.7333333, 1, 0, 1,
-0.7968432, -0.503729, -1.704971, 0.7294118, 1, 0, 1,
-0.7891977, -0.7501971, -3.300213, 0.7215686, 1, 0, 1,
-0.7886876, -0.9713179, -1.041742, 0.7176471, 1, 0, 1,
-0.7868154, 0.07354688, -0.7791274, 0.7098039, 1, 0, 1,
-0.785235, 0.3125629, 0.6244641, 0.7058824, 1, 0, 1,
-0.7785636, 0.9514216, -1.018377, 0.6980392, 1, 0, 1,
-0.7778865, 2.382899, 1.901631, 0.6901961, 1, 0, 1,
-0.7764441, -0.5357075, -2.55728, 0.6862745, 1, 0, 1,
-0.77581, -0.6012461, -2.379388, 0.6784314, 1, 0, 1,
-0.772857, -0.8335544, -2.542485, 0.6745098, 1, 0, 1,
-0.7711989, 0.6412038, -1.796291, 0.6666667, 1, 0, 1,
-0.768263, 0.431301, -1.745744, 0.6627451, 1, 0, 1,
-0.7674678, 0.6117563, -0.7129453, 0.654902, 1, 0, 1,
-0.7571968, 0.09711187, -2.068583, 0.6509804, 1, 0, 1,
-0.7558531, -1.321697, -2.728833, 0.6431373, 1, 0, 1,
-0.7557319, 0.2742464, 0.03964597, 0.6392157, 1, 0, 1,
-0.7504992, -0.9435294, -1.561906, 0.6313726, 1, 0, 1,
-0.7490827, -0.466424, -2.942455, 0.627451, 1, 0, 1,
-0.7471151, 0.1207827, -1.075582, 0.6196079, 1, 0, 1,
-0.7452294, 0.7673248, -0.1414683, 0.6156863, 1, 0, 1,
-0.7444556, 0.6175539, 0.5024914, 0.6078432, 1, 0, 1,
-0.7409169, -0.7552629, -1.616595, 0.6039216, 1, 0, 1,
-0.7267526, 1.31474, -0.5379186, 0.5960785, 1, 0, 1,
-0.7261194, -0.6128489, -3.544547, 0.5882353, 1, 0, 1,
-0.7251926, -0.2436734, -0.3916457, 0.5843138, 1, 0, 1,
-0.7243307, -0.8912522, -3.419147, 0.5764706, 1, 0, 1,
-0.7213427, 0.2594407, -1.760977, 0.572549, 1, 0, 1,
-0.7211188, -1.374195, -0.8865991, 0.5647059, 1, 0, 1,
-0.7171579, 0.6410791, -2.265651, 0.5607843, 1, 0, 1,
-0.7108852, 0.1361351, -2.784728, 0.5529412, 1, 0, 1,
-0.7084526, -0.4261006, -1.690827, 0.5490196, 1, 0, 1,
-0.706439, 0.4138055, 0.4055381, 0.5411765, 1, 0, 1,
-0.7062746, 1.093022, 0.3030962, 0.5372549, 1, 0, 1,
-0.7046534, -0.3050956, -1.960525, 0.5294118, 1, 0, 1,
-0.7023048, 0.3748524, -1.284544, 0.5254902, 1, 0, 1,
-0.6999232, -0.5009122, -2.829384, 0.5176471, 1, 0, 1,
-0.6930873, -0.7673349, -3.036201, 0.5137255, 1, 0, 1,
-0.6861325, -0.178017, 0.08877782, 0.5058824, 1, 0, 1,
-0.6758175, 1.068287, -1.557583, 0.5019608, 1, 0, 1,
-0.6735782, 1.012172, -2.015417, 0.4941176, 1, 0, 1,
-0.6720359, 0.2722416, 1.152974, 0.4862745, 1, 0, 1,
-0.6671823, -0.1077009, -3.418274, 0.4823529, 1, 0, 1,
-0.6642351, -0.2399839, -1.497232, 0.4745098, 1, 0, 1,
-0.6633396, -0.3044574, -2.103351, 0.4705882, 1, 0, 1,
-0.656383, -0.4404194, -1.645445, 0.4627451, 1, 0, 1,
-0.6524816, 0.5354596, -0.07969027, 0.4588235, 1, 0, 1,
-0.6490241, -1.334698, -2.204213, 0.4509804, 1, 0, 1,
-0.637839, 1.305117, -0.321121, 0.4470588, 1, 0, 1,
-0.6374466, 0.2981344, -0.2105418, 0.4392157, 1, 0, 1,
-0.6342645, -0.2959199, -2.161815, 0.4352941, 1, 0, 1,
-0.6318181, -1.763364, -3.033841, 0.427451, 1, 0, 1,
-0.6306061, 0.5049081, -0.4634755, 0.4235294, 1, 0, 1,
-0.6291535, -1.867837, -4.125146, 0.4156863, 1, 0, 1,
-0.6274742, -0.6770372, -2.734941, 0.4117647, 1, 0, 1,
-0.6240765, -0.1697511, -1.322626, 0.4039216, 1, 0, 1,
-0.620162, 0.2790097, -0.5535536, 0.3960784, 1, 0, 1,
-0.619332, 0.3906982, -2.820402, 0.3921569, 1, 0, 1,
-0.6147063, 2.153565, -0.1894781, 0.3843137, 1, 0, 1,
-0.614315, -0.2882093, -3.730098, 0.3803922, 1, 0, 1,
-0.611627, 1.285649, 0.4442983, 0.372549, 1, 0, 1,
-0.6073434, 0.07870001, 0.7223644, 0.3686275, 1, 0, 1,
-0.6036354, 0.3335741, -2.717296, 0.3607843, 1, 0, 1,
-0.6017269, -0.9565778, -2.278273, 0.3568628, 1, 0, 1,
-0.5995709, -0.001159416, -1.894453, 0.3490196, 1, 0, 1,
-0.5980659, 0.9864739, 0.5709011, 0.345098, 1, 0, 1,
-0.5939673, 1.244406, 0.06732317, 0.3372549, 1, 0, 1,
-0.5917992, 1.210123, -0.3361335, 0.3333333, 1, 0, 1,
-0.5853093, -0.2839822, -2.742322, 0.3254902, 1, 0, 1,
-0.5819537, 0.8666295, -2.521265, 0.3215686, 1, 0, 1,
-0.5814918, 1.810233, -0.5145262, 0.3137255, 1, 0, 1,
-0.5810299, -1.368433, -2.095269, 0.3098039, 1, 0, 1,
-0.5804592, -0.694845, -3.296781, 0.3019608, 1, 0, 1,
-0.5799296, -0.07357752, -0.7914172, 0.2941177, 1, 0, 1,
-0.5769593, 0.8368412, -0.7420007, 0.2901961, 1, 0, 1,
-0.5731094, -0.02598922, -4.002113, 0.282353, 1, 0, 1,
-0.5694538, 3.002469, -0.9773915, 0.2784314, 1, 0, 1,
-0.5667897, -2.139446, -2.466169, 0.2705882, 1, 0, 1,
-0.5574144, 0.2966242, -0.9382766, 0.2666667, 1, 0, 1,
-0.5555807, 0.03479926, -1.075489, 0.2588235, 1, 0, 1,
-0.5521163, 0.7106999, -3.797892, 0.254902, 1, 0, 1,
-0.5464527, 1.286207, 0.2307604, 0.2470588, 1, 0, 1,
-0.5448105, 0.8655115, -1.988096, 0.2431373, 1, 0, 1,
-0.5406916, 1.398251, -0.4170389, 0.2352941, 1, 0, 1,
-0.5346265, -0.3336198, -1.888755, 0.2313726, 1, 0, 1,
-0.5272291, -0.4941186, -3.88732, 0.2235294, 1, 0, 1,
-0.5264937, 2.290219, 0.1720165, 0.2196078, 1, 0, 1,
-0.5256058, 0.1325559, -0.2989698, 0.2117647, 1, 0, 1,
-0.5249628, 1.576082, 1.054933, 0.2078431, 1, 0, 1,
-0.5223353, 2.784198, -0.2273262, 0.2, 1, 0, 1,
-0.5206702, -0.8482335, -1.770827, 0.1921569, 1, 0, 1,
-0.5190972, 0.1916291, -2.204055, 0.1882353, 1, 0, 1,
-0.519047, -1.264528, -1.158573, 0.1803922, 1, 0, 1,
-0.5188922, 0.07127184, 0.1143796, 0.1764706, 1, 0, 1,
-0.5097272, -1.793974, -4.208009, 0.1686275, 1, 0, 1,
-0.5096228, 1.226886, 0.3379195, 0.1647059, 1, 0, 1,
-0.509081, 1.206418, 1.461851, 0.1568628, 1, 0, 1,
-0.5082175, -0.4887294, -2.341556, 0.1529412, 1, 0, 1,
-0.506862, -0.4604925, -2.27496, 0.145098, 1, 0, 1,
-0.5008737, 0.8038586, 0.7576395, 0.1411765, 1, 0, 1,
-0.5000669, 0.691271, -1.76745, 0.1333333, 1, 0, 1,
-0.4979692, 0.2146914, -2.312315, 0.1294118, 1, 0, 1,
-0.4979377, -1.491641, -2.44274, 0.1215686, 1, 0, 1,
-0.4964392, 0.6119355, -0.8922799, 0.1176471, 1, 0, 1,
-0.494657, 0.4462116, -1.05162, 0.1098039, 1, 0, 1,
-0.492466, 0.8457965, -1.949062, 0.1058824, 1, 0, 1,
-0.4884841, -0.1121105, -0.7895689, 0.09803922, 1, 0, 1,
-0.4861934, -0.2345643, -4.328903, 0.09019608, 1, 0, 1,
-0.4809898, 1.282111, -1.486862, 0.08627451, 1, 0, 1,
-0.4781384, -0.6462601, -2.667426, 0.07843138, 1, 0, 1,
-0.4754673, -0.7077147, -2.664061, 0.07450981, 1, 0, 1,
-0.4697623, -1.075635, -1.404689, 0.06666667, 1, 0, 1,
-0.4680806, 0.8121925, -0.6770539, 0.0627451, 1, 0, 1,
-0.4673819, 0.1172109, 0.08017468, 0.05490196, 1, 0, 1,
-0.465892, 1.37831, 0.7468665, 0.05098039, 1, 0, 1,
-0.4653096, 0.677897, 0.3222305, 0.04313726, 1, 0, 1,
-0.4613974, -0.143403, -1.532631, 0.03921569, 1, 0, 1,
-0.4600296, -0.6000077, -0.7098461, 0.03137255, 1, 0, 1,
-0.4583938, -1.80153, -3.169845, 0.02745098, 1, 0, 1,
-0.4505949, 0.8011312, 0.5331145, 0.01960784, 1, 0, 1,
-0.4490117, -0.9873316, -3.547933, 0.01568628, 1, 0, 1,
-0.4441979, 1.17777, -0.7898318, 0.007843138, 1, 0, 1,
-0.4436755, 1.7122, -1.016849, 0.003921569, 1, 0, 1,
-0.4426576, 0.3916886, -4.089218, 0, 1, 0.003921569, 1,
-0.4404171, -1.235125, -2.085861, 0, 1, 0.01176471, 1,
-0.437167, 2.10869, -0.2440293, 0, 1, 0.01568628, 1,
-0.436918, 0.2354665, -2.331484, 0, 1, 0.02352941, 1,
-0.4313621, 0.907937, -0.1322445, 0, 1, 0.02745098, 1,
-0.4290428, 0.0191651, -1.717345, 0, 1, 0.03529412, 1,
-0.4281951, -0.4329793, -2.687805, 0, 1, 0.03921569, 1,
-0.4255129, -0.6341696, -4.055838, 0, 1, 0.04705882, 1,
-0.4215178, -1.052227, -2.682651, 0, 1, 0.05098039, 1,
-0.4187024, 1.224677, -1.915717, 0, 1, 0.05882353, 1,
-0.4181113, 1.23212, 0.2212903, 0, 1, 0.0627451, 1,
-0.4172376, -0.1161105, 0.658949, 0, 1, 0.07058824, 1,
-0.4159856, -2.510097, -3.173319, 0, 1, 0.07450981, 1,
-0.4148345, -1.411032, -2.575703, 0, 1, 0.08235294, 1,
-0.4103167, 1.253927, -0.9546923, 0, 1, 0.08627451, 1,
-0.4090759, -1.858576, -4.153684, 0, 1, 0.09411765, 1,
-0.4086662, -0.3017072, -1.004249, 0, 1, 0.1019608, 1,
-0.4067263, 1.256405, -0.7530501, 0, 1, 0.1058824, 1,
-0.4040617, 0.786775, -1.282993, 0, 1, 0.1137255, 1,
-0.4040565, -0.1684313, -1.020174, 0, 1, 0.1176471, 1,
-0.3927554, 0.2156876, -1.265895, 0, 1, 0.1254902, 1,
-0.3920107, 0.6720358, 0.1390509, 0, 1, 0.1294118, 1,
-0.3908566, 1.614803, 1.148645, 0, 1, 0.1372549, 1,
-0.3883646, 0.6143202, -0.8355021, 0, 1, 0.1411765, 1,
-0.3873155, 0.5312159, 1.302623, 0, 1, 0.1490196, 1,
-0.38232, 1.399639, 0.8789811, 0, 1, 0.1529412, 1,
-0.3776711, 0.05631416, -0.8971584, 0, 1, 0.1607843, 1,
-0.3774208, 2.14885, -1.48715, 0, 1, 0.1647059, 1,
-0.3739139, 0.5654663, -2.222281, 0, 1, 0.172549, 1,
-0.3625324, -0.5839679, -3.940985, 0, 1, 0.1764706, 1,
-0.3600814, -0.2790008, -2.934881, 0, 1, 0.1843137, 1,
-0.358688, -0.7090805, -3.035911, 0, 1, 0.1882353, 1,
-0.3586555, -0.5249417, -4.376941, 0, 1, 0.1960784, 1,
-0.3566391, -0.685159, -3.362766, 0, 1, 0.2039216, 1,
-0.3559749, -0.1050253, -2.808393, 0, 1, 0.2078431, 1,
-0.3544403, 1.113118, 0.7911096, 0, 1, 0.2156863, 1,
-0.3503042, -1.837286, -1.626118, 0, 1, 0.2196078, 1,
-0.3456429, -0.2166969, -1.991239, 0, 1, 0.227451, 1,
-0.3351455, -1.018051, -4.133564, 0, 1, 0.2313726, 1,
-0.3340668, -0.708939, -0.9367137, 0, 1, 0.2392157, 1,
-0.3321636, 1.292618, 0.8771934, 0, 1, 0.2431373, 1,
-0.3294843, 0.475183, 0.5075697, 0, 1, 0.2509804, 1,
-0.3249298, 1.476524, -0.9464461, 0, 1, 0.254902, 1,
-0.3220818, 0.3055836, -0.4812073, 0, 1, 0.2627451, 1,
-0.318904, -2.29063, -1.702172, 0, 1, 0.2666667, 1,
-0.316174, -0.9033082, -2.040047, 0, 1, 0.2745098, 1,
-0.3131359, -0.8298307, -2.705838, 0, 1, 0.2784314, 1,
-0.30882, -0.7175093, -2.234678, 0, 1, 0.2862745, 1,
-0.3073641, 1.011562, -0.6854172, 0, 1, 0.2901961, 1,
-0.3069511, 0.4777017, -0.30207, 0, 1, 0.2980392, 1,
-0.3022313, 1.587057, 0.5873277, 0, 1, 0.3058824, 1,
-0.3005543, -0.5173497, -3.088531, 0, 1, 0.3098039, 1,
-0.2974904, 0.4837573, -1.081551, 0, 1, 0.3176471, 1,
-0.2965631, 1.488523, -0.05361279, 0, 1, 0.3215686, 1,
-0.294012, -1.107336, -2.029445, 0, 1, 0.3294118, 1,
-0.2925437, 0.7646067, -1.338376, 0, 1, 0.3333333, 1,
-0.2875319, -0.4430154, -4.388209, 0, 1, 0.3411765, 1,
-0.2872965, -1.22292, -2.559176, 0, 1, 0.345098, 1,
-0.28651, -0.7300276, -2.564173, 0, 1, 0.3529412, 1,
-0.2827801, 0.3212329, -1.752205, 0, 1, 0.3568628, 1,
-0.2823696, -0.8294111, -3.881517, 0, 1, 0.3647059, 1,
-0.2814164, -0.6739931, -3.69256, 0, 1, 0.3686275, 1,
-0.2755178, -1.526421, -2.763951, 0, 1, 0.3764706, 1,
-0.2672157, -0.9178708, -4.537961, 0, 1, 0.3803922, 1,
-0.2670391, 1.001628, 0.6709788, 0, 1, 0.3882353, 1,
-0.2663477, 0.2641625, 0.5532823, 0, 1, 0.3921569, 1,
-0.2661568, 0.7682529, 0.5279422, 0, 1, 0.4, 1,
-0.2583635, -1.073979, -3.60964, 0, 1, 0.4078431, 1,
-0.2572976, -0.5650406, -2.885574, 0, 1, 0.4117647, 1,
-0.2562543, 0.6809313, 0.09469055, 0, 1, 0.4196078, 1,
-0.2555139, -1.883055, -3.385763, 0, 1, 0.4235294, 1,
-0.2521536, -1.370319, -1.462768, 0, 1, 0.4313726, 1,
-0.241844, -0.7009354, -2.435184, 0, 1, 0.4352941, 1,
-0.2395879, -0.7412348, -2.677159, 0, 1, 0.4431373, 1,
-0.2369893, 1.526091, -1.76245, 0, 1, 0.4470588, 1,
-0.2330882, -0.5668525, -4.296074, 0, 1, 0.454902, 1,
-0.2310602, -1.029724, -1.535207, 0, 1, 0.4588235, 1,
-0.2306635, 1.13556, 0.5801946, 0, 1, 0.4666667, 1,
-0.2276419, 0.4066322, -1.823506, 0, 1, 0.4705882, 1,
-0.2182006, 0.8423427, -0.7141421, 0, 1, 0.4784314, 1,
-0.2179706, -0.9356524, -2.569818, 0, 1, 0.4823529, 1,
-0.2168636, -1.299502, -3.22329, 0, 1, 0.4901961, 1,
-0.2139945, -1.189675, -3.071865, 0, 1, 0.4941176, 1,
-0.1994523, 0.859726, 1.115986, 0, 1, 0.5019608, 1,
-0.1956321, 1.448124, 0.7353753, 0, 1, 0.509804, 1,
-0.1945319, 0.42125, 1.49056, 0, 1, 0.5137255, 1,
-0.1877034, 0.9225209, -1.844598, 0, 1, 0.5215687, 1,
-0.1860103, -0.6155328, -3.715488, 0, 1, 0.5254902, 1,
-0.1851093, -0.5339763, -2.54812, 0, 1, 0.5333334, 1,
-0.1745441, 0.1554282, -2.574746, 0, 1, 0.5372549, 1,
-0.1743807, -0.1571339, -3.56838, 0, 1, 0.5450981, 1,
-0.1742241, 0.2867967, -1.019533, 0, 1, 0.5490196, 1,
-0.1741986, 0.7758948, -1.75579, 0, 1, 0.5568628, 1,
-0.1736282, 0.4179081, 0.06572168, 0, 1, 0.5607843, 1,
-0.172569, 1.402751, 0.6306578, 0, 1, 0.5686275, 1,
-0.1721242, 0.08312096, -1.463835, 0, 1, 0.572549, 1,
-0.1712161, 1.257937, -0.005988418, 0, 1, 0.5803922, 1,
-0.1706068, 1.384364, 0.3862612, 0, 1, 0.5843138, 1,
-0.1664663, 1.833495, -1.138451, 0, 1, 0.5921569, 1,
-0.1614639, 0.5935267, -0.3755458, 0, 1, 0.5960785, 1,
-0.1595761, -2.316425, -0.9524945, 0, 1, 0.6039216, 1,
-0.1592824, -0.5224149, -4.287732, 0, 1, 0.6117647, 1,
-0.155698, 1.077735, 1.511063, 0, 1, 0.6156863, 1,
-0.1548392, 0.4182273, 1.179425, 0, 1, 0.6235294, 1,
-0.1537456, 0.7675075, -0.0694236, 0, 1, 0.627451, 1,
-0.1507526, -0.2426031, -3.649119, 0, 1, 0.6352941, 1,
-0.1486475, 0.1250178, 0.1149072, 0, 1, 0.6392157, 1,
-0.1469291, -0.2983485, -2.68157, 0, 1, 0.6470588, 1,
-0.1456088, 1.004269, -2.762641, 0, 1, 0.6509804, 1,
-0.1432515, 0.08611265, 0.1426361, 0, 1, 0.6588235, 1,
-0.1428047, -0.5199817, -2.396233, 0, 1, 0.6627451, 1,
-0.1403048, 0.6846884, -2.406227, 0, 1, 0.6705883, 1,
-0.1363314, -2.064798, -3.315034, 0, 1, 0.6745098, 1,
-0.1278092, 0.7460141, 1.730655, 0, 1, 0.682353, 1,
-0.1259903, -0.6751399, -3.290188, 0, 1, 0.6862745, 1,
-0.1256626, 0.8645716, -0.1519184, 0, 1, 0.6941177, 1,
-0.1224251, -1.037296, -3.518414, 0, 1, 0.7019608, 1,
-0.1170283, -1.092717, -3.844426, 0, 1, 0.7058824, 1,
-0.1134879, 0.04200043, -1.043819, 0, 1, 0.7137255, 1,
-0.1111727, 0.325259, 1.148228, 0, 1, 0.7176471, 1,
-0.109851, -1.105543, -2.306681, 0, 1, 0.7254902, 1,
-0.1096922, -0.364416, -2.880428, 0, 1, 0.7294118, 1,
-0.1057809, -0.8683095, -2.777076, 0, 1, 0.7372549, 1,
-0.102626, -2.038375, -3.953425, 0, 1, 0.7411765, 1,
-0.102556, 1.122774, -0.3261564, 0, 1, 0.7490196, 1,
-0.1019256, 2.521758, -0.5358765, 0, 1, 0.7529412, 1,
-0.1016648, -1.029282, -3.501562, 0, 1, 0.7607843, 1,
-0.09635444, -0.2418685, -3.379773, 0, 1, 0.7647059, 1,
-0.09218175, -0.6680724, -3.856559, 0, 1, 0.772549, 1,
-0.09191076, -0.8332879, -2.774775, 0, 1, 0.7764706, 1,
-0.08682738, 0.7344759, 0.658372, 0, 1, 0.7843137, 1,
-0.08525513, -1.473639, -2.571882, 0, 1, 0.7882353, 1,
-0.08437895, -0.7782766, -2.743987, 0, 1, 0.7960784, 1,
-0.0842154, -0.8243977, -2.337417, 0, 1, 0.8039216, 1,
-0.08265777, -0.4974301, -2.138775, 0, 1, 0.8078431, 1,
-0.08154497, 0.3980076, -0.9280075, 0, 1, 0.8156863, 1,
-0.0770135, -1.074288, -4.019383, 0, 1, 0.8196079, 1,
-0.07659452, -0.6570943, -2.988697, 0, 1, 0.827451, 1,
-0.07498714, -0.567223, -4.781735, 0, 1, 0.8313726, 1,
-0.07477827, 0.4893676, 0.1966328, 0, 1, 0.8392157, 1,
-0.07284274, 0.02541913, -3.268909, 0, 1, 0.8431373, 1,
-0.07190099, 0.3639503, -1.042, 0, 1, 0.8509804, 1,
-0.07183181, -0.4642878, -1.468668, 0, 1, 0.854902, 1,
-0.06826638, -1.61945, -3.403162, 0, 1, 0.8627451, 1,
-0.06654706, -1.579004, -2.592444, 0, 1, 0.8666667, 1,
-0.06646232, -0.03585361, 0.08373566, 0, 1, 0.8745098, 1,
-0.06474041, 1.056574, 0.46762, 0, 1, 0.8784314, 1,
-0.05465002, 0.2599888, 0.1897524, 0, 1, 0.8862745, 1,
-0.05367724, 0.4294469, -1.421857, 0, 1, 0.8901961, 1,
-0.05137639, 0.4019393, -1.325693, 0, 1, 0.8980392, 1,
-0.05026513, -0.2137327, -3.272826, 0, 1, 0.9058824, 1,
-0.0442436, 1.895405, 0.02563172, 0, 1, 0.9098039, 1,
-0.04077664, -0.9841223, -3.72998, 0, 1, 0.9176471, 1,
-0.03982399, 0.7843566, -0.2488722, 0, 1, 0.9215686, 1,
-0.03890799, 0.01981218, -1.580538, 0, 1, 0.9294118, 1,
-0.03878807, -1.902546, -1.791348, 0, 1, 0.9333333, 1,
-0.03710933, -2.118387, -3.313179, 0, 1, 0.9411765, 1,
-0.0282966, 0.4173574, -0.7401965, 0, 1, 0.945098, 1,
-0.0246332, -0.1109279, -2.204461, 0, 1, 0.9529412, 1,
-0.02376102, -0.4557462, -2.707935, 0, 1, 0.9568627, 1,
-0.02113701, 0.03636559, -0.3012175, 0, 1, 0.9647059, 1,
-0.01859144, 0.5366309, 1.212788, 0, 1, 0.9686275, 1,
-0.01653429, -1.465719, -3.105389, 0, 1, 0.9764706, 1,
-0.01549117, -0.2873727, -2.030979, 0, 1, 0.9803922, 1,
-0.01185358, 1.580106, 1.238358, 0, 1, 0.9882353, 1,
-0.01141148, 0.5164238, 0.3954691, 0, 1, 0.9921569, 1,
-0.01059829, -0.3011312, -2.821482, 0, 1, 1, 1,
-0.009470203, 0.140648, 0.01636758, 0, 0.9921569, 1, 1,
-0.002556695, -0.7777598, -3.652464, 0, 0.9882353, 1, 1,
0.0007388715, -1.409481, 3.013048, 0, 0.9803922, 1, 1,
0.002152893, -1.453645, 3.173577, 0, 0.9764706, 1, 1,
0.003169952, -0.08194567, 3.170894, 0, 0.9686275, 1, 1,
0.003355492, 0.8926505, -0.5403011, 0, 0.9647059, 1, 1,
0.006577902, 0.29472, -0.2058963, 0, 0.9568627, 1, 1,
0.0070019, 3.159264, 1.467338, 0, 0.9529412, 1, 1,
0.008804911, 1.00353, -0.4382271, 0, 0.945098, 1, 1,
0.009597679, 0.9869011, -0.9605255, 0, 0.9411765, 1, 1,
0.0103677, 1.489644, -0.4435989, 0, 0.9333333, 1, 1,
0.01651284, 0.954908, 0.2115736, 0, 0.9294118, 1, 1,
0.02048573, -0.2799887, 3.845962, 0, 0.9215686, 1, 1,
0.02114574, -0.7154498, 1.753069, 0, 0.9176471, 1, 1,
0.03071328, 0.07726522, 1.234617, 0, 0.9098039, 1, 1,
0.03534177, -1.548378, 3.594664, 0, 0.9058824, 1, 1,
0.03628704, -0.4113791, 4.618004, 0, 0.8980392, 1, 1,
0.03741956, 0.9511374, 0.1417889, 0, 0.8901961, 1, 1,
0.03833322, -0.918238, 2.746751, 0, 0.8862745, 1, 1,
0.04062354, 0.957388, -0.9376079, 0, 0.8784314, 1, 1,
0.04102468, -0.8171449, 3.140102, 0, 0.8745098, 1, 1,
0.04433376, 1.945065, 0.6829105, 0, 0.8666667, 1, 1,
0.04520927, -0.8505855, 2.856552, 0, 0.8627451, 1, 1,
0.04907085, -2.959417, 3.775329, 0, 0.854902, 1, 1,
0.04956863, 0.08093882, -0.4390947, 0, 0.8509804, 1, 1,
0.05046774, 0.9326167, -1.014884, 0, 0.8431373, 1, 1,
0.05110947, -0.9634402, 2.96659, 0, 0.8392157, 1, 1,
0.07093081, 1.042163, -0.2361197, 0, 0.8313726, 1, 1,
0.07209707, -0.3199456, 1.669123, 0, 0.827451, 1, 1,
0.07238039, -0.4021791, 2.353034, 0, 0.8196079, 1, 1,
0.07279026, -0.553928, 4.955436, 0, 0.8156863, 1, 1,
0.07400561, 0.9542134, 1.535867, 0, 0.8078431, 1, 1,
0.07455372, 1.946958, -0.6730691, 0, 0.8039216, 1, 1,
0.07667758, -0.8851795, 3.531034, 0, 0.7960784, 1, 1,
0.07960278, -1.025069, 3.324571, 0, 0.7882353, 1, 1,
0.07964029, -0.7521688, 4.469828, 0, 0.7843137, 1, 1,
0.07991317, 0.7454763, 2.290582, 0, 0.7764706, 1, 1,
0.08059824, 0.2229284, 1.30003, 0, 0.772549, 1, 1,
0.08082568, 0.350087, -1.907178, 0, 0.7647059, 1, 1,
0.08127171, -0.4456284, 4.44779, 0, 0.7607843, 1, 1,
0.08476432, 0.3968295, -0.1986967, 0, 0.7529412, 1, 1,
0.08577184, 0.3460473, 1.574651, 0, 0.7490196, 1, 1,
0.086604, 1.594249, -1.074272, 0, 0.7411765, 1, 1,
0.08719238, -0.8026982, 4.74082, 0, 0.7372549, 1, 1,
0.08720814, -1.09147, 2.717993, 0, 0.7294118, 1, 1,
0.09280375, 0.9938408, 0.320613, 0, 0.7254902, 1, 1,
0.09393916, -1.387851, 3.325989, 0, 0.7176471, 1, 1,
0.09536789, 0.5797262, -1.951237, 0, 0.7137255, 1, 1,
0.09539422, -1.369569, 3.556075, 0, 0.7058824, 1, 1,
0.09710037, 1.171088, -0.8888911, 0, 0.6980392, 1, 1,
0.1008295, 0.06503893, 0.6891643, 0, 0.6941177, 1, 1,
0.1020684, -1.948572, 4.32687, 0, 0.6862745, 1, 1,
0.1144974, 0.6778753, 0.8013762, 0, 0.682353, 1, 1,
0.1165428, 1.197401, -1.155344, 0, 0.6745098, 1, 1,
0.1201106, -1.106586, 3.847647, 0, 0.6705883, 1, 1,
0.121942, -0.9512424, 1.827024, 0, 0.6627451, 1, 1,
0.1223168, -1.954057, 1.654864, 0, 0.6588235, 1, 1,
0.1228372, 1.502117, 1.039316, 0, 0.6509804, 1, 1,
0.1251937, -1.547733, 4.271262, 0, 0.6470588, 1, 1,
0.1275255, 1.270333, -0.2572595, 0, 0.6392157, 1, 1,
0.1342796, -1.080527, 2.175542, 0, 0.6352941, 1, 1,
0.1349462, 1.122509, 0.09927458, 0, 0.627451, 1, 1,
0.1366759, -0.6377147, 3.711711, 0, 0.6235294, 1, 1,
0.137379, 0.7350424, -0.4966905, 0, 0.6156863, 1, 1,
0.1387357, 0.56178, -1.15931, 0, 0.6117647, 1, 1,
0.138833, 1.120345, 2.529596, 0, 0.6039216, 1, 1,
0.1412241, 0.8737559, 1.249566, 0, 0.5960785, 1, 1,
0.1418461, 0.2783023, 0.3286276, 0, 0.5921569, 1, 1,
0.146402, 0.9466842, -1.224031, 0, 0.5843138, 1, 1,
0.1488025, -0.3931535, 2.313853, 0, 0.5803922, 1, 1,
0.1551102, 0.1070155, -1.464937, 0, 0.572549, 1, 1,
0.1554147, -0.08020712, 3.430988, 0, 0.5686275, 1, 1,
0.157482, 1.350253, -1.896001, 0, 0.5607843, 1, 1,
0.1576996, -0.6399988, 2.693626, 0, 0.5568628, 1, 1,
0.1603359, -1.293576, 2.923305, 0, 0.5490196, 1, 1,
0.1606032, -0.1468982, 2.130714, 0, 0.5450981, 1, 1,
0.1682657, 0.6682163, 0.9246362, 0, 0.5372549, 1, 1,
0.1689356, 0.7483199, 2.059895, 0, 0.5333334, 1, 1,
0.1739341, 2.41298, -2.350895, 0, 0.5254902, 1, 1,
0.1749276, -1.238813, 2.121495, 0, 0.5215687, 1, 1,
0.1796701, -0.1044135, 2.431145, 0, 0.5137255, 1, 1,
0.180301, -0.5824042, 1.524497, 0, 0.509804, 1, 1,
0.1822192, 0.4261265, 0.5184096, 0, 0.5019608, 1, 1,
0.184169, 2.235224, -0.2113685, 0, 0.4941176, 1, 1,
0.1846767, -0.1497119, 2.748691, 0, 0.4901961, 1, 1,
0.1864627, -0.9217213, 1.250998, 0, 0.4823529, 1, 1,
0.1922147, 0.8130759, 1.72449, 0, 0.4784314, 1, 1,
0.1985743, 0.1336046, 1.864173, 0, 0.4705882, 1, 1,
0.1989429, 0.1238386, 0.7978997, 0, 0.4666667, 1, 1,
0.2036946, -0.3043124, 2.104579, 0, 0.4588235, 1, 1,
0.2092796, 0.6746927, -1.626847, 0, 0.454902, 1, 1,
0.2143238, 1.730371, 0.7267671, 0, 0.4470588, 1, 1,
0.2147751, 1.441281, 1.306202, 0, 0.4431373, 1, 1,
0.2165819, 0.4800099, 2.46452, 0, 0.4352941, 1, 1,
0.2180836, -0.4459553, 2.660609, 0, 0.4313726, 1, 1,
0.2221872, 1.519479, -0.1429961, 0, 0.4235294, 1, 1,
0.2236574, 0.6192986, -1.212219, 0, 0.4196078, 1, 1,
0.2241307, 0.7812635, -0.2431301, 0, 0.4117647, 1, 1,
0.2265881, 0.0135233, 3.393219, 0, 0.4078431, 1, 1,
0.2268004, -0.5682894, 3.077509, 0, 0.4, 1, 1,
0.2277758, -0.2008312, 3.622337, 0, 0.3921569, 1, 1,
0.2283529, 0.7082422, -0.1560266, 0, 0.3882353, 1, 1,
0.2374054, 0.4647174, 1.714585, 0, 0.3803922, 1, 1,
0.2427358, 0.01940264, 2.030284, 0, 0.3764706, 1, 1,
0.2438783, 0.6833957, 0.6429818, 0, 0.3686275, 1, 1,
0.2444199, -0.1698123, 0.9386219, 0, 0.3647059, 1, 1,
0.2456892, -0.6109138, 2.659553, 0, 0.3568628, 1, 1,
0.2474415, 0.2621865, -0.02811684, 0, 0.3529412, 1, 1,
0.2536294, -0.9835568, 3.287299, 0, 0.345098, 1, 1,
0.254332, 0.331466, -0.9115454, 0, 0.3411765, 1, 1,
0.2608671, 1.34176, 0.1563027, 0, 0.3333333, 1, 1,
0.2608715, -0.6221725, 2.755722, 0, 0.3294118, 1, 1,
0.2610927, -0.0757159, 3.431756, 0, 0.3215686, 1, 1,
0.2617119, 0.302824, 0.1623879, 0, 0.3176471, 1, 1,
0.2706309, -1.694611, 3.214772, 0, 0.3098039, 1, 1,
0.2750956, 0.3911791, 1.70224, 0, 0.3058824, 1, 1,
0.2753269, -0.0452517, 2.163861, 0, 0.2980392, 1, 1,
0.2817658, 0.07277813, 1.338869, 0, 0.2901961, 1, 1,
0.2841252, 0.1677867, 2.288655, 0, 0.2862745, 1, 1,
0.2953979, 0.6647237, 0.2975312, 0, 0.2784314, 1, 1,
0.3004724, 1.673935, 0.700218, 0, 0.2745098, 1, 1,
0.3010491, 1.272543, 0.506053, 0, 0.2666667, 1, 1,
0.3030418, 0.8494831, 0.08627822, 0, 0.2627451, 1, 1,
0.3074499, -0.9427583, 3.759696, 0, 0.254902, 1, 1,
0.3075536, 0.8677332, 0.9857162, 0, 0.2509804, 1, 1,
0.3090465, 1.439884, 0.4401152, 0, 0.2431373, 1, 1,
0.3127879, -0.8849785, 2.306209, 0, 0.2392157, 1, 1,
0.3160349, -2.144646, 2.616266, 0, 0.2313726, 1, 1,
0.3194022, 0.585681, -0.5427823, 0, 0.227451, 1, 1,
0.3205462, 1.359146, -0.903824, 0, 0.2196078, 1, 1,
0.3205895, -0.661231, 3.311869, 0, 0.2156863, 1, 1,
0.3229677, -0.9310356, 1.692758, 0, 0.2078431, 1, 1,
0.3233454, 0.2539102, 0.2551636, 0, 0.2039216, 1, 1,
0.323822, 0.2319534, 2.891263, 0, 0.1960784, 1, 1,
0.3258827, -0.2442862, 2.751486, 0, 0.1882353, 1, 1,
0.3295025, 0.9003344, 0.6912792, 0, 0.1843137, 1, 1,
0.3309781, 0.2040723, -0.3640963, 0, 0.1764706, 1, 1,
0.3367405, -1.464742, 4.363142, 0, 0.172549, 1, 1,
0.3409252, -0.1456427, 1.966914, 0, 0.1647059, 1, 1,
0.3409622, 0.8768502, 1.584954, 0, 0.1607843, 1, 1,
0.3409872, 0.1635553, -0.436255, 0, 0.1529412, 1, 1,
0.3421673, 0.1534643, 0.3299459, 0, 0.1490196, 1, 1,
0.3424262, -1.058, 3.006618, 0, 0.1411765, 1, 1,
0.3429322, 1.18833, -0.1947997, 0, 0.1372549, 1, 1,
0.3451133, 2.112579, -0.5321401, 0, 0.1294118, 1, 1,
0.3476622, 0.101429, 0.3291765, 0, 0.1254902, 1, 1,
0.3556479, -2.58324, 2.905335, 0, 0.1176471, 1, 1,
0.3580081, 1.055136, 2.972758, 0, 0.1137255, 1, 1,
0.35849, 0.6649898, 1.741423, 0, 0.1058824, 1, 1,
0.3611476, 0.2172408, 0.204199, 0, 0.09803922, 1, 1,
0.3626336, 0.355417, -1.359666, 0, 0.09411765, 1, 1,
0.3643265, -1.88797, 2.415353, 0, 0.08627451, 1, 1,
0.3658032, 1.004168, 0.6709099, 0, 0.08235294, 1, 1,
0.3750146, 2.010792, 0.4930758, 0, 0.07450981, 1, 1,
0.3778138, 0.919593, -2.426265, 0, 0.07058824, 1, 1,
0.378186, 0.1920526, 0.8143563, 0, 0.0627451, 1, 1,
0.3803306, 0.408245, 0.3003423, 0, 0.05882353, 1, 1,
0.3865587, 1.587772, -0.6119484, 0, 0.05098039, 1, 1,
0.390906, -1.344324, 2.920681, 0, 0.04705882, 1, 1,
0.3921213, 0.5565038, 0.6795025, 0, 0.03921569, 1, 1,
0.3927864, 0.2202245, 1.844582, 0, 0.03529412, 1, 1,
0.3996716, 0.6094028, 0.006820713, 0, 0.02745098, 1, 1,
0.4008921, -0.7512, 3.150233, 0, 0.02352941, 1, 1,
0.4014316, -0.1005551, 1.627258, 0, 0.01568628, 1, 1,
0.4062616, 0.7458166, 0.7057226, 0, 0.01176471, 1, 1,
0.4074804, -0.170494, 1.267364, 0, 0.003921569, 1, 1,
0.410382, -1.183903, 2.160849, 0.003921569, 0, 1, 1,
0.4106281, -1.47313, 4.398002, 0.007843138, 0, 1, 1,
0.411064, 0.04547634, 2.462322, 0.01568628, 0, 1, 1,
0.4113285, 0.5839043, 1.654483, 0.01960784, 0, 1, 1,
0.4115325, 0.5448989, -0.3071779, 0.02745098, 0, 1, 1,
0.4124013, 1.015114, -2.750254, 0.03137255, 0, 1, 1,
0.4157128, 1.951605, -1.552778, 0.03921569, 0, 1, 1,
0.4168648, 0.2210488, 3.324198, 0.04313726, 0, 1, 1,
0.421788, 1.068046, -1.62215, 0.05098039, 0, 1, 1,
0.4275477, 0.8722901, -1.441546, 0.05490196, 0, 1, 1,
0.4278132, -2.299535, 3.050343, 0.0627451, 0, 1, 1,
0.4339028, -0.1838861, 3.325006, 0.06666667, 0, 1, 1,
0.4375188, 1.057057, -0.3381683, 0.07450981, 0, 1, 1,
0.4400285, -0.5221885, 3.646614, 0.07843138, 0, 1, 1,
0.4445114, 0.7798477, -0.5296212, 0.08627451, 0, 1, 1,
0.4453191, -1.602305, 2.268103, 0.09019608, 0, 1, 1,
0.448405, 0.2575816, 2.017329, 0.09803922, 0, 1, 1,
0.4493726, -0.9696694, 1.913182, 0.1058824, 0, 1, 1,
0.4510041, -1.840313, 4.205938, 0.1098039, 0, 1, 1,
0.4528794, -0.8071135, 2.550664, 0.1176471, 0, 1, 1,
0.4555793, -0.0791728, 1.85779, 0.1215686, 0, 1, 1,
0.4589996, 0.4592611, 1.768645, 0.1294118, 0, 1, 1,
0.4609924, -0.498987, 2.579914, 0.1333333, 0, 1, 1,
0.4621433, 0.3180186, -0.1384229, 0.1411765, 0, 1, 1,
0.4627988, 0.458323, 0.8245863, 0.145098, 0, 1, 1,
0.464636, 0.6301294, 0.432012, 0.1529412, 0, 1, 1,
0.4704821, -0.336958, 3.34356, 0.1568628, 0, 1, 1,
0.4732998, 0.007699389, 3.210639, 0.1647059, 0, 1, 1,
0.4737454, -0.2257493, 3.556853, 0.1686275, 0, 1, 1,
0.4778481, -0.3334233, 3.999917, 0.1764706, 0, 1, 1,
0.4788752, 0.2470847, -0.09739463, 0.1803922, 0, 1, 1,
0.4816962, -0.8004258, 4.960999, 0.1882353, 0, 1, 1,
0.4862624, -0.4571854, 3.455127, 0.1921569, 0, 1, 1,
0.5099812, 0.9831577, 2.541924, 0.2, 0, 1, 1,
0.5157703, 0.5253803, -0.3641666, 0.2078431, 0, 1, 1,
0.5200791, -0.1197487, 1.261993, 0.2117647, 0, 1, 1,
0.5244365, 0.9485542, -0.6058365, 0.2196078, 0, 1, 1,
0.5295816, -1.864979, 4.362157, 0.2235294, 0, 1, 1,
0.5319892, -0.09805813, 2.165424, 0.2313726, 0, 1, 1,
0.5327743, 1.600368, 0.7786664, 0.2352941, 0, 1, 1,
0.534227, -0.466352, 1.475579, 0.2431373, 0, 1, 1,
0.5355511, -0.01148163, 3.338645, 0.2470588, 0, 1, 1,
0.5434963, 0.4247068, 1.940383, 0.254902, 0, 1, 1,
0.545377, 1.743431, 1.097212, 0.2588235, 0, 1, 1,
0.55133, 0.8186677, 0.5296664, 0.2666667, 0, 1, 1,
0.5517477, 0.8253601, 1.12031, 0.2705882, 0, 1, 1,
0.5545716, -0.02366321, 2.839496, 0.2784314, 0, 1, 1,
0.5589544, -0.8087949, 3.817853, 0.282353, 0, 1, 1,
0.5592015, 0.08112658, 1.250163, 0.2901961, 0, 1, 1,
0.5643061, -0.7114324, 3.42051, 0.2941177, 0, 1, 1,
0.5656259, -0.5950918, 1.808992, 0.3019608, 0, 1, 1,
0.5802824, 0.4869937, -0.7014855, 0.3098039, 0, 1, 1,
0.5803832, -1.147635, 2.688312, 0.3137255, 0, 1, 1,
0.5848662, -1.597175, 1.523215, 0.3215686, 0, 1, 1,
0.5861893, -1.589731, 3.359078, 0.3254902, 0, 1, 1,
0.5865147, 0.09726232, 1.387299, 0.3333333, 0, 1, 1,
0.5914032, 1.54825, -0.1773834, 0.3372549, 0, 1, 1,
0.5928865, 1.65798, 0.1093533, 0.345098, 0, 1, 1,
0.5993899, 0.6950806, -0.100811, 0.3490196, 0, 1, 1,
0.6004095, -1.921168, 4.110027, 0.3568628, 0, 1, 1,
0.6008162, 0.2802767, 0.1159002, 0.3607843, 0, 1, 1,
0.600851, 1.484472, -1.188804, 0.3686275, 0, 1, 1,
0.6009368, -0.7821209, 3.679163, 0.372549, 0, 1, 1,
0.6023991, -1.25612, 1.515415, 0.3803922, 0, 1, 1,
0.6029587, -0.8885788, 4.001357, 0.3843137, 0, 1, 1,
0.6064001, 0.4055406, 2.270663, 0.3921569, 0, 1, 1,
0.6064581, -1.328019, 2.601767, 0.3960784, 0, 1, 1,
0.6118538, -0.8450833, 2.079505, 0.4039216, 0, 1, 1,
0.6170703, 0.1034093, 2.058534, 0.4117647, 0, 1, 1,
0.6178925, 0.3753764, 2.849334, 0.4156863, 0, 1, 1,
0.6297737, -0.8032866, 2.378895, 0.4235294, 0, 1, 1,
0.6351293, -1.400162, 3.74916, 0.427451, 0, 1, 1,
0.6360254, -0.05183661, 1.821354, 0.4352941, 0, 1, 1,
0.6379617, -0.1506575, 2.183749, 0.4392157, 0, 1, 1,
0.6385011, 0.9009778, -0.7309979, 0.4470588, 0, 1, 1,
0.6438548, -0.6449165, 1.462986, 0.4509804, 0, 1, 1,
0.6465448, 0.06794523, 1.974978, 0.4588235, 0, 1, 1,
0.6486861, -0.2507132, 1.130192, 0.4627451, 0, 1, 1,
0.6504456, 0.8500034, 1.472381, 0.4705882, 0, 1, 1,
0.6530259, 0.4301272, 2.840762, 0.4745098, 0, 1, 1,
0.6563411, -1.06287, 3.832271, 0.4823529, 0, 1, 1,
0.663348, 0.7243861, 1.092908, 0.4862745, 0, 1, 1,
0.6667171, 1.776796, 0.7317405, 0.4941176, 0, 1, 1,
0.6691065, 0.6093369, 1.190432, 0.5019608, 0, 1, 1,
0.670493, -0.9518954, 1.017089, 0.5058824, 0, 1, 1,
0.6735519, 1.240556, -1.357437, 0.5137255, 0, 1, 1,
0.6782231, 0.8655953, 1.447601, 0.5176471, 0, 1, 1,
0.6787512, 0.9483531, 1.058707, 0.5254902, 0, 1, 1,
0.6797098, 0.4819829, 0.7823022, 0.5294118, 0, 1, 1,
0.6884683, -1.199158, 2.439348, 0.5372549, 0, 1, 1,
0.7001508, 0.7672808, 0.3960475, 0.5411765, 0, 1, 1,
0.703037, -0.7141914, 1.135863, 0.5490196, 0, 1, 1,
0.709852, 0.8351583, 0.2079654, 0.5529412, 0, 1, 1,
0.7109428, -0.04674783, 3.649615, 0.5607843, 0, 1, 1,
0.7117122, -0.7170941, 1.667122, 0.5647059, 0, 1, 1,
0.7132604, -0.3782947, 0.3584829, 0.572549, 0, 1, 1,
0.7193725, -0.6427808, 0.1941086, 0.5764706, 0, 1, 1,
0.7206419, -0.4742089, 3.605077, 0.5843138, 0, 1, 1,
0.7255086, 0.8415163, 0.7337177, 0.5882353, 0, 1, 1,
0.7328357, -0.1489428, 0.09364092, 0.5960785, 0, 1, 1,
0.7348284, 0.4618895, 0.8804549, 0.6039216, 0, 1, 1,
0.7379383, -1.663683, 3.108331, 0.6078432, 0, 1, 1,
0.7389777, -0.09405565, 2.124611, 0.6156863, 0, 1, 1,
0.74101, -0.470573, 2.768661, 0.6196079, 0, 1, 1,
0.7419967, 0.8739433, 1.074436, 0.627451, 0, 1, 1,
0.7437611, -1.82795, 3.224802, 0.6313726, 0, 1, 1,
0.7460517, 0.4381348, -0.4127598, 0.6392157, 0, 1, 1,
0.7525946, -0.5539809, 2.973805, 0.6431373, 0, 1, 1,
0.7597799, 1.483098, 0.0105079, 0.6509804, 0, 1, 1,
0.7600116, 0.1250595, 1.601774, 0.654902, 0, 1, 1,
0.7643906, -0.8986642, 2.160868, 0.6627451, 0, 1, 1,
0.7646695, -1.197957, 3.464525, 0.6666667, 0, 1, 1,
0.7676163, -0.2518393, 3.184573, 0.6745098, 0, 1, 1,
0.7688305, -1.530589, 2.134654, 0.6784314, 0, 1, 1,
0.7732477, 0.6135026, 0.7884989, 0.6862745, 0, 1, 1,
0.7839655, -1.64197, 1.991334, 0.6901961, 0, 1, 1,
0.7854608, 0.1711686, 0.6643523, 0.6980392, 0, 1, 1,
0.8003029, -1.355139, 1.440028, 0.7058824, 0, 1, 1,
0.8020427, -1.167361, 0.5473865, 0.7098039, 0, 1, 1,
0.8049673, 0.4716072, 2.570502, 0.7176471, 0, 1, 1,
0.810742, -0.6185169, 3.60597, 0.7215686, 0, 1, 1,
0.8215452, -0.1332815, 2.7491, 0.7294118, 0, 1, 1,
0.8342592, -1.139338, 2.138668, 0.7333333, 0, 1, 1,
0.8411438, -0.3152866, 2.590195, 0.7411765, 0, 1, 1,
0.8444244, -1.183229, 2.202673, 0.7450981, 0, 1, 1,
0.8510333, -1.641108, 3.295886, 0.7529412, 0, 1, 1,
0.8622691, 0.181261, 0.4895992, 0.7568628, 0, 1, 1,
0.8654428, 0.3963054, 3.807792, 0.7647059, 0, 1, 1,
0.8669815, 1.010058, 1.24633, 0.7686275, 0, 1, 1,
0.8714659, -0.6743297, 2.326401, 0.7764706, 0, 1, 1,
0.8729619, 0.5268589, 3.606783, 0.7803922, 0, 1, 1,
0.877705, -0.07773803, 1.906648, 0.7882353, 0, 1, 1,
0.8991293, -0.7581955, 2.572103, 0.7921569, 0, 1, 1,
0.9013358, -0.5832688, 3.285617, 0.8, 0, 1, 1,
0.9013374, 1.374065, 0.9786628, 0.8078431, 0, 1, 1,
0.9034457, -1.124139, 3.536253, 0.8117647, 0, 1, 1,
0.907804, -0.6470696, 3.870956, 0.8196079, 0, 1, 1,
0.9120967, 0.18548, 0.8860934, 0.8235294, 0, 1, 1,
0.9157259, -0.2151727, 0.6799526, 0.8313726, 0, 1, 1,
0.9158669, -0.01050787, 2.504649, 0.8352941, 0, 1, 1,
0.9199602, -0.06865064, 1.920735, 0.8431373, 0, 1, 1,
0.9241616, -1.159916, 1.943099, 0.8470588, 0, 1, 1,
0.9279287, -0.6771755, 1.217072, 0.854902, 0, 1, 1,
0.9279318, -2.327272, 2.732247, 0.8588235, 0, 1, 1,
0.9320824, -1.276232, 3.215636, 0.8666667, 0, 1, 1,
0.9346052, 0.1507008, 0.8612594, 0.8705882, 0, 1, 1,
0.9347971, -1.902246, 2.600621, 0.8784314, 0, 1, 1,
0.9352704, -0.6017935, 3.145215, 0.8823529, 0, 1, 1,
0.9370437, 2.204847, -0.0802415, 0.8901961, 0, 1, 1,
0.939227, 0.4493505, 1.030287, 0.8941177, 0, 1, 1,
0.9397645, 1.318395, 0.8332806, 0.9019608, 0, 1, 1,
0.9494627, 0.1990921, 0.9104182, 0.9098039, 0, 1, 1,
0.9513289, -1.350812, 1.161427, 0.9137255, 0, 1, 1,
0.9540826, 0.1420851, 1.115212, 0.9215686, 0, 1, 1,
0.956585, -0.867183, 3.058057, 0.9254902, 0, 1, 1,
0.9566956, 1.085176, 0.1025439, 0.9333333, 0, 1, 1,
0.962474, -2.071505, 2.096529, 0.9372549, 0, 1, 1,
0.9645431, -0.175765, 3.045693, 0.945098, 0, 1, 1,
0.967672, -0.6557623, 0.8231079, 0.9490196, 0, 1, 1,
0.9703755, 0.6770334, 3.833555, 0.9568627, 0, 1, 1,
0.9756825, -1.094336, 2.321104, 0.9607843, 0, 1, 1,
0.9764367, -0.5256527, 3.070221, 0.9686275, 0, 1, 1,
0.9813619, -1.135681, 1.609872, 0.972549, 0, 1, 1,
0.9838709, 0.03962436, 0.1633222, 0.9803922, 0, 1, 1,
0.9893357, -0.611518, 2.863899, 0.9843137, 0, 1, 1,
0.9895241, -0.1548974, 1.510756, 0.9921569, 0, 1, 1,
0.9909172, -1.680538, 3.082586, 0.9960784, 0, 1, 1,
0.9978324, 0.07143439, 2.017816, 1, 0, 0.9960784, 1,
0.9979757, 0.4800113, 0.9881756, 1, 0, 0.9882353, 1,
0.9996527, 1.926321, -0.1414014, 1, 0, 0.9843137, 1,
1.005332, -1.253793, 2.199801, 1, 0, 0.9764706, 1,
1.010579, 0.2692817, 0.2512361, 1, 0, 0.972549, 1,
1.011946, 0.4094646, 1.138773, 1, 0, 0.9647059, 1,
1.012933, 0.5655562, 0.9009998, 1, 0, 0.9607843, 1,
1.013128, 0.9486809, -0.7339355, 1, 0, 0.9529412, 1,
1.015321, 1.307898, 0.7038544, 1, 0, 0.9490196, 1,
1.019579, 0.9873917, 0.770497, 1, 0, 0.9411765, 1,
1.02258, 1.219597, -0.9336117, 1, 0, 0.9372549, 1,
1.029592, 1.151707, 0.1547886, 1, 0, 0.9294118, 1,
1.034726, -2.170053, 2.053914, 1, 0, 0.9254902, 1,
1.035019, -0.7478201, 1.926288, 1, 0, 0.9176471, 1,
1.036231, 1.296596, 0.1418177, 1, 0, 0.9137255, 1,
1.038768, -0.01287172, 0.8254297, 1, 0, 0.9058824, 1,
1.050719, -1.568192, 3.079454, 1, 0, 0.9019608, 1,
1.051398, 2.201044, 0.6202494, 1, 0, 0.8941177, 1,
1.05174, 0.1146728, 2.172223, 1, 0, 0.8862745, 1,
1.05543, -0.8030156, 2.59144, 1, 0, 0.8823529, 1,
1.060292, 0.05906839, 1.474571, 1, 0, 0.8745098, 1,
1.060608, -0.1234106, 2.111966, 1, 0, 0.8705882, 1,
1.065263, 0.6143098, 1.264226, 1, 0, 0.8627451, 1,
1.06622, -0.1842955, 0.2232853, 1, 0, 0.8588235, 1,
1.067789, 0.3547519, -0.3162347, 1, 0, 0.8509804, 1,
1.069242, 0.2609901, 2.138106, 1, 0, 0.8470588, 1,
1.076081, 0.8166831, 1.854821, 1, 0, 0.8392157, 1,
1.090191, 0.8073554, 2.558396, 1, 0, 0.8352941, 1,
1.090544, 0.09175069, 1.332283, 1, 0, 0.827451, 1,
1.096017, 1.253051, 3.638963, 1, 0, 0.8235294, 1,
1.096226, -0.1745568, 2.309481, 1, 0, 0.8156863, 1,
1.096686, -0.08313676, 1.019816, 1, 0, 0.8117647, 1,
1.098768, 1.186339, 0.9701076, 1, 0, 0.8039216, 1,
1.099174, 0.06308324, 1.70125, 1, 0, 0.7960784, 1,
1.103284, 1.731944, -0.2235922, 1, 0, 0.7921569, 1,
1.105085, -1.297042, 3.299142, 1, 0, 0.7843137, 1,
1.111466, 1.457454, 1.087758, 1, 0, 0.7803922, 1,
1.112096, 0.4626335, 1.614807, 1, 0, 0.772549, 1,
1.11414, -0.9874977, 1.529112, 1, 0, 0.7686275, 1,
1.114874, 1.505865, -0.03561668, 1, 0, 0.7607843, 1,
1.115571, -0.6392907, 2.743135, 1, 0, 0.7568628, 1,
1.121407, 2.68902, 1.136996, 1, 0, 0.7490196, 1,
1.122772, -0.3315078, 2.470936, 1, 0, 0.7450981, 1,
1.12575, -1.02696, 1.848418, 1, 0, 0.7372549, 1,
1.134516, -1.001725, 1.658121, 1, 0, 0.7333333, 1,
1.154044, -1.301, 2.813479, 1, 0, 0.7254902, 1,
1.159405, 0.165613, 1.22639, 1, 0, 0.7215686, 1,
1.164509, 0.07026843, 1.190152, 1, 0, 0.7137255, 1,
1.168058, 1.103953, 0.202044, 1, 0, 0.7098039, 1,
1.168277, 0.5400019, 0.4457114, 1, 0, 0.7019608, 1,
1.170665, -0.377914, 1.987275, 1, 0, 0.6941177, 1,
1.173382, 0.8552715, -0.2253959, 1, 0, 0.6901961, 1,
1.174133, -2.914081, 2.570082, 1, 0, 0.682353, 1,
1.181707, 0.1736002, 2.749881, 1, 0, 0.6784314, 1,
1.186232, -0.1266321, 1.813821, 1, 0, 0.6705883, 1,
1.188098, -0.03263458, 0.7026479, 1, 0, 0.6666667, 1,
1.188797, -0.485061, 1.151294, 1, 0, 0.6588235, 1,
1.200549, 1.44124, 1.847686, 1, 0, 0.654902, 1,
1.215818, -0.4575089, 2.796524, 1, 0, 0.6470588, 1,
1.216486, 0.8987815, 1.733713, 1, 0, 0.6431373, 1,
1.217006, -0.4448515, 0.713391, 1, 0, 0.6352941, 1,
1.217215, 0.592973, 0.8342943, 1, 0, 0.6313726, 1,
1.230137, -0.4050626, 2.073346, 1, 0, 0.6235294, 1,
1.231134, 0.2136628, 1.855962, 1, 0, 0.6196079, 1,
1.232833, 0.592875, 1.319449, 1, 0, 0.6117647, 1,
1.233375, -0.1361985, 2.892381, 1, 0, 0.6078432, 1,
1.241553, -0.8038805, 3.212383, 1, 0, 0.6, 1,
1.248205, -1.963734, 1.623129, 1, 0, 0.5921569, 1,
1.250949, 0.6701056, 1.649508, 1, 0, 0.5882353, 1,
1.254537, 0.1151841, 3.063416, 1, 0, 0.5803922, 1,
1.261268, 2.697634, 0.6065512, 1, 0, 0.5764706, 1,
1.262662, 0.3986764, 1.241989, 1, 0, 0.5686275, 1,
1.28026, 0.9778869, 1.770828, 1, 0, 0.5647059, 1,
1.283244, 0.5785357, 1.520725, 1, 0, 0.5568628, 1,
1.292513, -0.2030828, 3.070583, 1, 0, 0.5529412, 1,
1.294933, 1.030998, 0.8689301, 1, 0, 0.5450981, 1,
1.295885, 0.3462417, 0.9479339, 1, 0, 0.5411765, 1,
1.295936, -0.01059077, 2.432912, 1, 0, 0.5333334, 1,
1.296156, -0.2563145, 2.099261, 1, 0, 0.5294118, 1,
1.298413, 0.1779521, 2.728393, 1, 0, 0.5215687, 1,
1.299639, 0.9357697, 1.551772, 1, 0, 0.5176471, 1,
1.303278, -0.9704411, 2.449129, 1, 0, 0.509804, 1,
1.314665, 1.078704, 0.04409034, 1, 0, 0.5058824, 1,
1.332341, 1.40279, -0.1458012, 1, 0, 0.4980392, 1,
1.350854, 0.1888848, 2.522405, 1, 0, 0.4901961, 1,
1.354237, -1.798895, 4.710034, 1, 0, 0.4862745, 1,
1.357818, 3.145169, -1.021106, 1, 0, 0.4784314, 1,
1.378086, 0.1061142, 1.092046, 1, 0, 0.4745098, 1,
1.383754, -0.9456228, 2.695403, 1, 0, 0.4666667, 1,
1.385272, 0.3261467, 0.6402685, 1, 0, 0.4627451, 1,
1.400979, -1.339148, 4.592664, 1, 0, 0.454902, 1,
1.401326, -0.6655871, 1.769469, 1, 0, 0.4509804, 1,
1.407886, 0.3812023, 1.537413, 1, 0, 0.4431373, 1,
1.4122, -1.122695, 2.995163, 1, 0, 0.4392157, 1,
1.419274, 1.099585, 1.27984, 1, 0, 0.4313726, 1,
1.431401, -0.8801682, 1.322486, 1, 0, 0.427451, 1,
1.435555, 0.214751, 2.251878, 1, 0, 0.4196078, 1,
1.454005, 1.203352, -0.9887695, 1, 0, 0.4156863, 1,
1.460709, 0.1421493, 2.83655, 1, 0, 0.4078431, 1,
1.463511, 0.1146383, 1.470367, 1, 0, 0.4039216, 1,
1.46469, 0.6436056, 3.220448, 1, 0, 0.3960784, 1,
1.465055, 1.298363, 0.4151184, 1, 0, 0.3882353, 1,
1.470139, 1.199603, 1.684458, 1, 0, 0.3843137, 1,
1.477395, -0.7204696, 1.351303, 1, 0, 0.3764706, 1,
1.480525, -0.5127977, 3.739189, 1, 0, 0.372549, 1,
1.484076, 0.7306933, 2.668391, 1, 0, 0.3647059, 1,
1.485812, -1.500675, 3.500834, 1, 0, 0.3607843, 1,
1.498192, -0.8812763, 1.605783, 1, 0, 0.3529412, 1,
1.498703, 1.003949, -0.811322, 1, 0, 0.3490196, 1,
1.501104, -0.7904285, 2.116448, 1, 0, 0.3411765, 1,
1.505646, 1.028817, -1.148407, 1, 0, 0.3372549, 1,
1.517179, 0.5796473, 1.582235, 1, 0, 0.3294118, 1,
1.518483, -0.2510373, 2.772013, 1, 0, 0.3254902, 1,
1.532194, -0.3280229, 0.3590526, 1, 0, 0.3176471, 1,
1.536498, 1.364011, 0.5776211, 1, 0, 0.3137255, 1,
1.584605, -0.0573769, 2.654664, 1, 0, 0.3058824, 1,
1.607665, 0.2687307, 1.049235, 1, 0, 0.2980392, 1,
1.610639, 0.8649654, 1.300485, 1, 0, 0.2941177, 1,
1.620071, 1.02394, -1.287182, 1, 0, 0.2862745, 1,
1.629478, -0.8461334, 2.189965, 1, 0, 0.282353, 1,
1.648157, -1.761793, 2.035841, 1, 0, 0.2745098, 1,
1.651315, 1.222917, 1.714967, 1, 0, 0.2705882, 1,
1.666793, 0.2798618, 1.611331, 1, 0, 0.2627451, 1,
1.721699, -1.672202, 3.636229, 1, 0, 0.2588235, 1,
1.724945, 1.492632, 1.035859, 1, 0, 0.2509804, 1,
1.72842, 0.259898, 1.51926, 1, 0, 0.2470588, 1,
1.729433, 1.097494, 1.170152, 1, 0, 0.2392157, 1,
1.753498, 0.734006, 0.9222974, 1, 0, 0.2352941, 1,
1.754256, 1.104567, 0.9324253, 1, 0, 0.227451, 1,
1.764438, 0.1329733, 1.355807, 1, 0, 0.2235294, 1,
1.785601, 0.5922091, 0.9437041, 1, 0, 0.2156863, 1,
1.788597, 1.819871, -1.160537, 1, 0, 0.2117647, 1,
1.80444, 0.8221282, 1.741675, 1, 0, 0.2039216, 1,
1.817155, -0.8681532, 1.563753, 1, 0, 0.1960784, 1,
1.817205, -0.9007038, 0.8345018, 1, 0, 0.1921569, 1,
1.837548, 1.758229, 1.272467, 1, 0, 0.1843137, 1,
1.838468, 2.507258, 1.373019, 1, 0, 0.1803922, 1,
1.844948, -0.3587717, 2.975493, 1, 0, 0.172549, 1,
1.853402, -0.6233223, 3.180515, 1, 0, 0.1686275, 1,
1.860132, 0.6477746, 1.457519, 1, 0, 0.1607843, 1,
1.87772, -0.9961221, 2.548796, 1, 0, 0.1568628, 1,
1.878804, -0.4511102, 1.626917, 1, 0, 0.1490196, 1,
1.880669, 1.119339, 0.534242, 1, 0, 0.145098, 1,
1.928633, 0.2547887, 0.4885573, 1, 0, 0.1372549, 1,
1.938963, -0.4084317, 2.596028, 1, 0, 0.1333333, 1,
1.960956, -0.04479226, 2.217878, 1, 0, 0.1254902, 1,
2.012062, 0.4368357, 3.101551, 1, 0, 0.1215686, 1,
2.030052, 0.9205775, 1.366162, 1, 0, 0.1137255, 1,
2.033224, -0.5991345, 1.311247, 1, 0, 0.1098039, 1,
2.056369, 0.2351664, 2.691155, 1, 0, 0.1019608, 1,
2.102907, 1.463714, 0.08869419, 1, 0, 0.09411765, 1,
2.103177, 0.7761817, 1.074129, 1, 0, 0.09019608, 1,
2.115404, -0.2543003, 2.906796, 1, 0, 0.08235294, 1,
2.146682, -1.95469, 2.882256, 1, 0, 0.07843138, 1,
2.176538, -2.364245, 1.542022, 1, 0, 0.07058824, 1,
2.216101, -0.3311824, 1.824677, 1, 0, 0.06666667, 1,
2.220526, -1.37494, 1.516545, 1, 0, 0.05882353, 1,
2.302042, 0.240619, 1.860259, 1, 0, 0.05490196, 1,
2.357009, 1.89226, 1.853093, 1, 0, 0.04705882, 1,
2.401298, -0.1881679, 0.0744658, 1, 0, 0.04313726, 1,
2.468098, -0.984596, 1.839905, 1, 0, 0.03529412, 1,
2.502645, -0.2903807, 1.806303, 1, 0, 0.03137255, 1,
2.54156, 0.7576248, 1.736147, 1, 0, 0.02352941, 1,
2.867111, -0.8764225, 2.314079, 1, 0, 0.01960784, 1,
3.063579, -0.5986939, 2.049324, 1, 0, 0.01176471, 1,
3.176696, 0.436967, 1.291687, 1, 0, 0.007843138, 1
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
-0.07184887, -3.996533, -6.612432, 0, -0.5, 0.5, 0.5,
-0.07184887, -3.996533, -6.612432, 1, -0.5, 0.5, 0.5,
-0.07184887, -3.996533, -6.612432, 1, 1.5, 0.5, 0.5,
-0.07184887, -3.996533, -6.612432, 0, 1.5, 0.5, 0.5
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
-4.42165, 0.09992385, -6.612432, 0, -0.5, 0.5, 0.5,
-4.42165, 0.09992385, -6.612432, 1, -0.5, 0.5, 0.5,
-4.42165, 0.09992385, -6.612432, 1, 1.5, 0.5, 0.5,
-4.42165, 0.09992385, -6.612432, 0, 1.5, 0.5, 0.5
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
-4.42165, -3.996533, 0.01297402, 0, -0.5, 0.5, 0.5,
-4.42165, -3.996533, 0.01297402, 1, -0.5, 0.5, 0.5,
-4.42165, -3.996533, 0.01297402, 1, 1.5, 0.5, 0.5,
-4.42165, -3.996533, 0.01297402, 0, 1.5, 0.5, 0.5
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
-3, -3.051197, -5.083492,
3, -3.051197, -5.083492,
-3, -3.051197, -5.083492,
-3, -3.208753, -5.338315,
-2, -3.051197, -5.083492,
-2, -3.208753, -5.338315,
-1, -3.051197, -5.083492,
-1, -3.208753, -5.338315,
0, -3.051197, -5.083492,
0, -3.208753, -5.338315,
1, -3.051197, -5.083492,
1, -3.208753, -5.338315,
2, -3.051197, -5.083492,
2, -3.208753, -5.338315,
3, -3.051197, -5.083492,
3, -3.208753, -5.338315
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
-3, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
-3, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
-3, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
-3, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
-2, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
-2, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
-2, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
-2, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
-1, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
-1, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
-1, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
-1, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
0, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
0, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
0, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
0, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
1, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
1, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
1, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
1, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
2, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
2, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
2, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
2, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5,
3, -3.523865, -5.847962, 0, -0.5, 0.5, 0.5,
3, -3.523865, -5.847962, 1, -0.5, 0.5, 0.5,
3, -3.523865, -5.847962, 1, 1.5, 0.5, 0.5,
3, -3.523865, -5.847962, 0, 1.5, 0.5, 0.5
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
-3.41785, -2, -5.083492,
-3.41785, 3, -5.083492,
-3.41785, -2, -5.083492,
-3.58515, -2, -5.338315,
-3.41785, -1, -5.083492,
-3.58515, -1, -5.338315,
-3.41785, 0, -5.083492,
-3.58515, 0, -5.338315,
-3.41785, 1, -5.083492,
-3.58515, 1, -5.338315,
-3.41785, 2, -5.083492,
-3.58515, 2, -5.338315,
-3.41785, 3, -5.083492,
-3.58515, 3, -5.338315
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
-3.91975, -2, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, -2, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, -2, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, -2, -5.847962, 0, 1.5, 0.5, 0.5,
-3.91975, -1, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, -1, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, -1, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, -1, -5.847962, 0, 1.5, 0.5, 0.5,
-3.91975, 0, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, 0, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, 0, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, 0, -5.847962, 0, 1.5, 0.5, 0.5,
-3.91975, 1, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, 1, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, 1, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, 1, -5.847962, 0, 1.5, 0.5, 0.5,
-3.91975, 2, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, 2, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, 2, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, 2, -5.847962, 0, 1.5, 0.5, 0.5,
-3.91975, 3, -5.847962, 0, -0.5, 0.5, 0.5,
-3.91975, 3, -5.847962, 1, -0.5, 0.5, 0.5,
-3.91975, 3, -5.847962, 1, 1.5, 0.5, 0.5,
-3.91975, 3, -5.847962, 0, 1.5, 0.5, 0.5
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
-3.41785, -3.051197, -4,
-3.41785, -3.051197, 4,
-3.41785, -3.051197, -4,
-3.58515, -3.208753, -4,
-3.41785, -3.051197, -2,
-3.58515, -3.208753, -2,
-3.41785, -3.051197, 0,
-3.58515, -3.208753, 0,
-3.41785, -3.051197, 2,
-3.58515, -3.208753, 2,
-3.41785, -3.051197, 4,
-3.58515, -3.208753, 4
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
-3.91975, -3.523865, -4, 0, -0.5, 0.5, 0.5,
-3.91975, -3.523865, -4, 1, -0.5, 0.5, 0.5,
-3.91975, -3.523865, -4, 1, 1.5, 0.5, 0.5,
-3.91975, -3.523865, -4, 0, 1.5, 0.5, 0.5,
-3.91975, -3.523865, -2, 0, -0.5, 0.5, 0.5,
-3.91975, -3.523865, -2, 1, -0.5, 0.5, 0.5,
-3.91975, -3.523865, -2, 1, 1.5, 0.5, 0.5,
-3.91975, -3.523865, -2, 0, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 0, 0, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 0, 1, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 0, 1, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 0, 0, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 2, 0, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 2, 1, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 2, 1, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 2, 0, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 4, 0, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 4, 1, -0.5, 0.5, 0.5,
-3.91975, -3.523865, 4, 1, 1.5, 0.5, 0.5,
-3.91975, -3.523865, 4, 0, 1.5, 0.5, 0.5
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
-3.41785, -3.051197, -5.083492,
-3.41785, 3.251045, -5.083492,
-3.41785, -3.051197, 5.10944,
-3.41785, 3.251045, 5.10944,
-3.41785, -3.051197, -5.083492,
-3.41785, -3.051197, 5.10944,
-3.41785, 3.251045, -5.083492,
-3.41785, 3.251045, 5.10944,
-3.41785, -3.051197, -5.083492,
3.274152, -3.051197, -5.083492,
-3.41785, -3.051197, 5.10944,
3.274152, -3.051197, 5.10944,
-3.41785, 3.251045, -5.083492,
3.274152, 3.251045, -5.083492,
-3.41785, 3.251045, 5.10944,
3.274152, 3.251045, 5.10944,
3.274152, -3.051197, -5.083492,
3.274152, 3.251045, -5.083492,
3.274152, -3.051197, 5.10944,
3.274152, 3.251045, 5.10944,
3.274152, -3.051197, -5.083492,
3.274152, -3.051197, 5.10944,
3.274152, 3.251045, -5.083492,
3.274152, 3.251045, 5.10944
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
var radius = 7.329299;
var distance = 32.60888;
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
mvMatrix.translate( 0.07184887, -0.09992385, -0.01297402 );
mvMatrix.scale( 1.184187, 1.257423, 0.7774585 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60888);
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
methylcarbamate<-read.table("methylcarbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylcarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
y<-methylcarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
```

```r
z<-methylcarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate' not found
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
-3.320393, 1.587151, -1.081551, 0, 0, 1, 1, 1,
-3.034047, 0.08534515, -0.4997165, 1, 0, 0, 1, 1,
-2.920243, -0.4968724, -1.914742, 1, 0, 0, 1, 1,
-2.704337, 0.6623099, -2.106445, 1, 0, 0, 1, 1,
-2.690973, 0.0008704845, -2.618534, 1, 0, 0, 1, 1,
-2.592105, 0.9034591, -0.4046285, 1, 0, 0, 1, 1,
-2.479105, -0.5101069, -0.2578121, 0, 0, 0, 1, 1,
-2.442548, -0.3396353, -1.794477, 0, 0, 0, 1, 1,
-2.433109, -0.838796, -2.604217, 0, 0, 0, 1, 1,
-2.358556, 1.076664, -2.00419, 0, 0, 0, 1, 1,
-2.289823, -0.08703794, -1.829331, 0, 0, 0, 1, 1,
-2.24019, -0.2517791, -2.067064, 0, 0, 0, 1, 1,
-2.229566, -1.927164, -1.566483, 0, 0, 0, 1, 1,
-2.188834, 0.8067316, -0.9764217, 1, 1, 1, 1, 1,
-2.181249, 1.989398, -1.296416, 1, 1, 1, 1, 1,
-2.175802, 0.2401036, -3.703374, 1, 1, 1, 1, 1,
-2.147646, 1.208837, -0.1351434, 1, 1, 1, 1, 1,
-2.096179, 1.233165, -0.770793, 1, 1, 1, 1, 1,
-2.036247, -0.5053461, -1.222594, 1, 1, 1, 1, 1,
-2.016619, 1.380684, -0.5344725, 1, 1, 1, 1, 1,
-2.014402, 0.9671879, -1.513161, 1, 1, 1, 1, 1,
-2.014111, 0.5650337, -1.250123, 1, 1, 1, 1, 1,
-2.013617, 0.8025107, -0.3875824, 1, 1, 1, 1, 1,
-2.005817, 1.951377, -2.097797, 1, 1, 1, 1, 1,
-1.99887, 0.2550541, -2.171102, 1, 1, 1, 1, 1,
-1.99738, 0.7385902, -2.429396, 1, 1, 1, 1, 1,
-1.975208, 0.6891837, 0.5075512, 1, 1, 1, 1, 1,
-1.944396, 1.579342, -1.114595, 1, 1, 1, 1, 1,
-1.929453, -0.6292998, -2.324107, 0, 0, 1, 1, 1,
-1.927747, 0.4649039, -1.595502, 1, 0, 0, 1, 1,
-1.923985, -0.03201574, -0.6453956, 1, 0, 0, 1, 1,
-1.904409, 0.9467414, -0.5810227, 1, 0, 0, 1, 1,
-1.897559, -1.165311, -4.171906, 1, 0, 0, 1, 1,
-1.885773, -0.1693824, 0.03196988, 1, 0, 0, 1, 1,
-1.883142, -0.8229192, -2.495251, 0, 0, 0, 1, 1,
-1.875246, -0.227523, -1.954209, 0, 0, 0, 1, 1,
-1.86586, -0.1632338, -1.454748, 0, 0, 0, 1, 1,
-1.862852, 1.047329, -0.6335119, 0, 0, 0, 1, 1,
-1.856066, -0.3738994, -4.572723, 0, 0, 0, 1, 1,
-1.85262, -0.4665785, -1.178385, 0, 0, 0, 1, 1,
-1.838195, -0.5573595, -1.884527, 0, 0, 0, 1, 1,
-1.829035, 0.2659055, -0.6736307, 1, 1, 1, 1, 1,
-1.790315, 0.6294953, 0.4084944, 1, 1, 1, 1, 1,
-1.780951, -0.4646996, -2.171759, 1, 1, 1, 1, 1,
-1.772281, 0.3256402, -2.020309, 1, 1, 1, 1, 1,
-1.768133, 0.4083093, -1.020205, 1, 1, 1, 1, 1,
-1.758101, 0.8231747, -1.816616, 1, 1, 1, 1, 1,
-1.726393, -0.4862369, -3.305566, 1, 1, 1, 1, 1,
-1.724664, 0.3028692, -1.412126, 1, 1, 1, 1, 1,
-1.713962, 0.3746174, -0.6865035, 1, 1, 1, 1, 1,
-1.688015, -0.7181693, -1.042248, 1, 1, 1, 1, 1,
-1.66747, 0.01543567, -2.022354, 1, 1, 1, 1, 1,
-1.636468, 0.2182766, -1.501257, 1, 1, 1, 1, 1,
-1.622683, -0.2358336, -1.643517, 1, 1, 1, 1, 1,
-1.610658, 1.111806, -1.339725, 1, 1, 1, 1, 1,
-1.605778, 0.1969561, -0.6842866, 1, 1, 1, 1, 1,
-1.598563, -1.356424, -1.83702, 0, 0, 1, 1, 1,
-1.592296, 0.9251007, -0.7139621, 1, 0, 0, 1, 1,
-1.591918, 1.521358, 0.62387, 1, 0, 0, 1, 1,
-1.590943, -2.264574, -2.17726, 1, 0, 0, 1, 1,
-1.588452, 0.5855543, -0.005800535, 1, 0, 0, 1, 1,
-1.567044, -1.743414, -3.263802, 1, 0, 0, 1, 1,
-1.564649, -1.880684, -4.051276, 0, 0, 0, 1, 1,
-1.554408, 0.2775061, -2.172142, 0, 0, 0, 1, 1,
-1.553689, 0.3558759, -0.4141468, 0, 0, 0, 1, 1,
-1.553552, -1.036521, -4.935051, 0, 0, 0, 1, 1,
-1.549469, 0.02296322, -2.028925, 0, 0, 0, 1, 1,
-1.546195, -1.575966, -1.88187, 0, 0, 0, 1, 1,
-1.529101, -1.975682, -2.56404, 0, 0, 0, 1, 1,
-1.520184, 0.3274755, -2.184282, 1, 1, 1, 1, 1,
-1.498915, 2.410328, 0.9006292, 1, 1, 1, 1, 1,
-1.498267, -0.7438917, -0.9904833, 1, 1, 1, 1, 1,
-1.498205, -0.9390453, -2.788498, 1, 1, 1, 1, 1,
-1.493127, -0.8482829, -3.944635, 1, 1, 1, 1, 1,
-1.486293, -0.4873026, -1.772476, 1, 1, 1, 1, 1,
-1.476316, 1.596275, -0.3036675, 1, 1, 1, 1, 1,
-1.457086, 0.5000066, -0.521807, 1, 1, 1, 1, 1,
-1.448307, 1.952959, -0.04548196, 1, 1, 1, 1, 1,
-1.447353, -0.9091037, -1.698692, 1, 1, 1, 1, 1,
-1.44645, -0.8556471, -1.511411, 1, 1, 1, 1, 1,
-1.430582, 0.9940584, -1.117789, 1, 1, 1, 1, 1,
-1.423293, 1.269805, -2.540962, 1, 1, 1, 1, 1,
-1.420583, 1.667135, 0.03422252, 1, 1, 1, 1, 1,
-1.419421, 0.5661391, -1.878622, 1, 1, 1, 1, 1,
-1.416158, -0.1447987, -2.436175, 0, 0, 1, 1, 1,
-1.411279, -0.80134, -3.116172, 1, 0, 0, 1, 1,
-1.405676, 1.621155, 0.2591584, 1, 0, 0, 1, 1,
-1.405578, -0.5787237, -2.150333, 1, 0, 0, 1, 1,
-1.405477, 0.6016755, -0.5652995, 1, 0, 0, 1, 1,
-1.379989, -0.00914128, -1.225342, 1, 0, 0, 1, 1,
-1.367847, 0.770906, -3.019101, 0, 0, 0, 1, 1,
-1.35877, 0.5456384, -0.5072977, 0, 0, 0, 1, 1,
-1.343069, -0.0242811, -2.109089, 0, 0, 0, 1, 1,
-1.339674, 0.4915452, -1.920048, 0, 0, 0, 1, 1,
-1.338346, -0.1567207, -0.4885357, 0, 0, 0, 1, 1,
-1.336839, 0.403279, -0.7837429, 0, 0, 0, 1, 1,
-1.327612, 0.5023196, -1.053407, 0, 0, 0, 1, 1,
-1.321883, 0.2899322, -1.3082, 1, 1, 1, 1, 1,
-1.313036, 1.789718, -0.6656876, 1, 1, 1, 1, 1,
-1.312652, -0.7819582, -3.645024, 1, 1, 1, 1, 1,
-1.307678, 0.5672938, -1.693551, 1, 1, 1, 1, 1,
-1.300738, -0.6130112, -2.355013, 1, 1, 1, 1, 1,
-1.298691, 0.6984873, 0.2888685, 1, 1, 1, 1, 1,
-1.296198, 0.3559539, -1.362738, 1, 1, 1, 1, 1,
-1.295573, 1.149371, -1.140011, 1, 1, 1, 1, 1,
-1.294503, 1.53941, -0.4078722, 1, 1, 1, 1, 1,
-1.284665, 1.975141, -1.757976, 1, 1, 1, 1, 1,
-1.271383, -1.161709, -2.843721, 1, 1, 1, 1, 1,
-1.267808, -0.5667612, -1.994597, 1, 1, 1, 1, 1,
-1.253906, 2.414249, -0.1075681, 1, 1, 1, 1, 1,
-1.241304, -0.2257669, -0.3685195, 1, 1, 1, 1, 1,
-1.230698, -0.4143181, -1.436233, 1, 1, 1, 1, 1,
-1.226293, -0.341351, -2.083414, 0, 0, 1, 1, 1,
-1.209855, -0.5713792, -2.121697, 1, 0, 0, 1, 1,
-1.195746, -2.437464, -2.682312, 1, 0, 0, 1, 1,
-1.189968, -0.2694426, -2.122896, 1, 0, 0, 1, 1,
-1.185506, -0.4555314, -0.8939294, 1, 0, 0, 1, 1,
-1.180824, -1.819989, 0.4399365, 1, 0, 0, 1, 1,
-1.180722, 0.4891056, -3.205752, 0, 0, 0, 1, 1,
-1.174686, -1.405729, -3.232177, 0, 0, 0, 1, 1,
-1.168424, 0.448078, -0.8224875, 0, 0, 0, 1, 1,
-1.149563, -0.4319962, -3.686018, 0, 0, 0, 1, 1,
-1.147613, -0.8504869, -2.448844, 0, 0, 0, 1, 1,
-1.145848, 0.4145297, -1.270579, 0, 0, 0, 1, 1,
-1.145244, -1.411063, -1.451837, 0, 0, 0, 1, 1,
-1.127421, 0.09882963, -2.313267, 1, 1, 1, 1, 1,
-1.126612, -0.1156891, -2.560495, 1, 1, 1, 1, 1,
-1.125892, 0.9987288, -0.8111781, 1, 1, 1, 1, 1,
-1.125795, -0.2277066, -1.64672, 1, 1, 1, 1, 1,
-1.118335, -1.042648, -1.882744, 1, 1, 1, 1, 1,
-1.118235, 0.7884108, -1.050902, 1, 1, 1, 1, 1,
-1.114866, 0.2097721, -0.6751028, 1, 1, 1, 1, 1,
-1.114803, -0.1217956, -1.981184, 1, 1, 1, 1, 1,
-1.107676, 1.103851, -0.2889769, 1, 1, 1, 1, 1,
-1.104964, 0.4261064, -1.327891, 1, 1, 1, 1, 1,
-1.104873, -0.3224852, -3.455358, 1, 1, 1, 1, 1,
-1.104069, 0.5575588, -1.321567, 1, 1, 1, 1, 1,
-1.101996, -0.7318946, -2.176113, 1, 1, 1, 1, 1,
-1.096632, 0.05900571, -2.370954, 1, 1, 1, 1, 1,
-1.095135, -0.4030939, -2.514656, 1, 1, 1, 1, 1,
-1.084625, 0.5498722, -1.006614, 0, 0, 1, 1, 1,
-1.072703, 0.3922457, -1.126075, 1, 0, 0, 1, 1,
-1.064804, 0.1188436, -2.833543, 1, 0, 0, 1, 1,
-1.064415, -1.022574, -1.949475, 1, 0, 0, 1, 1,
-1.057979, 1.078997, -1.662522, 1, 0, 0, 1, 1,
-1.057959, 1.147732, 0.5922009, 1, 0, 0, 1, 1,
-1.046541, -2.157842, -2.560762, 0, 0, 0, 1, 1,
-1.041812, 0.1835798, -2.091924, 0, 0, 0, 1, 1,
-1.041622, -0.4203756, -1.483564, 0, 0, 0, 1, 1,
-1.041512, 0.9351529, -0.5577438, 0, 0, 0, 1, 1,
-1.037149, -1.447675, -1.061447, 0, 0, 0, 1, 1,
-1.03031, 0.2223087, -1.776788, 0, 0, 0, 1, 1,
-1.012828, 0.5689068, 0.6955976, 0, 0, 0, 1, 1,
-1.009545, 0.579798, -2.073266, 1, 1, 1, 1, 1,
-1.009077, -1.125396, -2.59479, 1, 1, 1, 1, 1,
-1.007648, -0.9858475, -1.680227, 1, 1, 1, 1, 1,
-1.004072, -0.2360532, -0.995177, 1, 1, 1, 1, 1,
-0.993148, 0.6284299, -2.628018, 1, 1, 1, 1, 1,
-0.9766917, 1.034582, -0.4115523, 1, 1, 1, 1, 1,
-0.9762687, 0.2641403, -2.795355, 1, 1, 1, 1, 1,
-0.9742525, -1.269372, -2.293852, 1, 1, 1, 1, 1,
-0.9737526, 0.9021779, -1.458199, 1, 1, 1, 1, 1,
-0.9594463, -0.4605251, -2.207484, 1, 1, 1, 1, 1,
-0.9563996, -0.9688722, -2.050609, 1, 1, 1, 1, 1,
-0.9562243, -0.6705347, -2.028328, 1, 1, 1, 1, 1,
-0.9484276, -0.2382724, -1.574371, 1, 1, 1, 1, 1,
-0.9407626, -0.4893091, -1.701936, 1, 1, 1, 1, 1,
-0.9395219, -0.3074188, -2.090449, 1, 1, 1, 1, 1,
-0.9382613, -1.470753, -3.450596, 0, 0, 1, 1, 1,
-0.9373595, 1.072175, -1.351648, 1, 0, 0, 1, 1,
-0.9367433, 0.6303303, -0.9902297, 1, 0, 0, 1, 1,
-0.9359062, -0.03511254, -2.105845, 1, 0, 0, 1, 1,
-0.932381, -0.482709, -1.872944, 1, 0, 0, 1, 1,
-0.9299436, -0.8815174, -1.671094, 1, 0, 0, 1, 1,
-0.9227702, 0.9066795, -0.3221674, 0, 0, 0, 1, 1,
-0.9195601, 1.896476, -0.5389488, 0, 0, 0, 1, 1,
-0.9183728, 0.2642212, -2.072261, 0, 0, 0, 1, 1,
-0.9164172, 0.9789945, -0.7272937, 0, 0, 0, 1, 1,
-0.9146101, 1.422353, -0.1646532, 0, 0, 0, 1, 1,
-0.9066667, 0.7332869, -2.283481, 0, 0, 0, 1, 1,
-0.9048015, 0.9570406, -1.829512, 0, 0, 0, 1, 1,
-0.904165, 0.6293585, -0.8468097, 1, 1, 1, 1, 1,
-0.9013391, 0.486795, -0.1419178, 1, 1, 1, 1, 1,
-0.9006347, 1.178209, -0.8822495, 1, 1, 1, 1, 1,
-0.8918754, -1.663335, -3.703847, 1, 1, 1, 1, 1,
-0.8897976, 1.230491, -0.3503823, 1, 1, 1, 1, 1,
-0.8846031, 0.04578536, -1.06046, 1, 1, 1, 1, 1,
-0.8830945, 0.05263934, -0.1376384, 1, 1, 1, 1, 1,
-0.8807644, -0.4311851, -3.256908, 1, 1, 1, 1, 1,
-0.8798788, -0.3476289, -1.347531, 1, 1, 1, 1, 1,
-0.8759827, -2.558452, -2.903985, 1, 1, 1, 1, 1,
-0.8713303, 0.04118649, -2.352671, 1, 1, 1, 1, 1,
-0.8690171, 0.8209267, -1.449129, 1, 1, 1, 1, 1,
-0.8599184, 1.333557, -3.200753, 1, 1, 1, 1, 1,
-0.8562052, -0.222778, -0.6659539, 1, 1, 1, 1, 1,
-0.8525912, -0.8376318, 0.2161901, 1, 1, 1, 1, 1,
-0.8497744, -0.2180395, -0.6558125, 0, 0, 1, 1, 1,
-0.8443428, 0.8664336, -0.6612617, 1, 0, 0, 1, 1,
-0.8393071, -0.3205969, -2.518275, 1, 0, 0, 1, 1,
-0.83676, -1.090385, -1.38126, 1, 0, 0, 1, 1,
-0.8229402, -0.9639964, -2.301473, 1, 0, 0, 1, 1,
-0.821122, 0.8746973, -1.510923, 1, 0, 0, 1, 1,
-0.8202742, 0.9516248, -0.5364245, 0, 0, 0, 1, 1,
-0.820232, 0.4177487, -1.447009, 0, 0, 0, 1, 1,
-0.818778, -0.3513514, -1.547175, 0, 0, 0, 1, 1,
-0.8168818, 1.989691, -0.5623151, 0, 0, 0, 1, 1,
-0.8141198, 1.625575, -1.519934, 0, 0, 0, 1, 1,
-0.8080617, 0.4189751, -1.539312, 0, 0, 0, 1, 1,
-0.8076808, -2.080582, -2.65539, 0, 0, 0, 1, 1,
-0.8042743, -0.4948534, -1.590454, 1, 1, 1, 1, 1,
-0.8022355, 1.207734, -0.9326969, 1, 1, 1, 1, 1,
-0.7987579, -0.3688607, -2.187532, 1, 1, 1, 1, 1,
-0.7968432, -0.503729, -1.704971, 1, 1, 1, 1, 1,
-0.7891977, -0.7501971, -3.300213, 1, 1, 1, 1, 1,
-0.7886876, -0.9713179, -1.041742, 1, 1, 1, 1, 1,
-0.7868154, 0.07354688, -0.7791274, 1, 1, 1, 1, 1,
-0.785235, 0.3125629, 0.6244641, 1, 1, 1, 1, 1,
-0.7785636, 0.9514216, -1.018377, 1, 1, 1, 1, 1,
-0.7778865, 2.382899, 1.901631, 1, 1, 1, 1, 1,
-0.7764441, -0.5357075, -2.55728, 1, 1, 1, 1, 1,
-0.77581, -0.6012461, -2.379388, 1, 1, 1, 1, 1,
-0.772857, -0.8335544, -2.542485, 1, 1, 1, 1, 1,
-0.7711989, 0.6412038, -1.796291, 1, 1, 1, 1, 1,
-0.768263, 0.431301, -1.745744, 1, 1, 1, 1, 1,
-0.7674678, 0.6117563, -0.7129453, 0, 0, 1, 1, 1,
-0.7571968, 0.09711187, -2.068583, 1, 0, 0, 1, 1,
-0.7558531, -1.321697, -2.728833, 1, 0, 0, 1, 1,
-0.7557319, 0.2742464, 0.03964597, 1, 0, 0, 1, 1,
-0.7504992, -0.9435294, -1.561906, 1, 0, 0, 1, 1,
-0.7490827, -0.466424, -2.942455, 1, 0, 0, 1, 1,
-0.7471151, 0.1207827, -1.075582, 0, 0, 0, 1, 1,
-0.7452294, 0.7673248, -0.1414683, 0, 0, 0, 1, 1,
-0.7444556, 0.6175539, 0.5024914, 0, 0, 0, 1, 1,
-0.7409169, -0.7552629, -1.616595, 0, 0, 0, 1, 1,
-0.7267526, 1.31474, -0.5379186, 0, 0, 0, 1, 1,
-0.7261194, -0.6128489, -3.544547, 0, 0, 0, 1, 1,
-0.7251926, -0.2436734, -0.3916457, 0, 0, 0, 1, 1,
-0.7243307, -0.8912522, -3.419147, 1, 1, 1, 1, 1,
-0.7213427, 0.2594407, -1.760977, 1, 1, 1, 1, 1,
-0.7211188, -1.374195, -0.8865991, 1, 1, 1, 1, 1,
-0.7171579, 0.6410791, -2.265651, 1, 1, 1, 1, 1,
-0.7108852, 0.1361351, -2.784728, 1, 1, 1, 1, 1,
-0.7084526, -0.4261006, -1.690827, 1, 1, 1, 1, 1,
-0.706439, 0.4138055, 0.4055381, 1, 1, 1, 1, 1,
-0.7062746, 1.093022, 0.3030962, 1, 1, 1, 1, 1,
-0.7046534, -0.3050956, -1.960525, 1, 1, 1, 1, 1,
-0.7023048, 0.3748524, -1.284544, 1, 1, 1, 1, 1,
-0.6999232, -0.5009122, -2.829384, 1, 1, 1, 1, 1,
-0.6930873, -0.7673349, -3.036201, 1, 1, 1, 1, 1,
-0.6861325, -0.178017, 0.08877782, 1, 1, 1, 1, 1,
-0.6758175, 1.068287, -1.557583, 1, 1, 1, 1, 1,
-0.6735782, 1.012172, -2.015417, 1, 1, 1, 1, 1,
-0.6720359, 0.2722416, 1.152974, 0, 0, 1, 1, 1,
-0.6671823, -0.1077009, -3.418274, 1, 0, 0, 1, 1,
-0.6642351, -0.2399839, -1.497232, 1, 0, 0, 1, 1,
-0.6633396, -0.3044574, -2.103351, 1, 0, 0, 1, 1,
-0.656383, -0.4404194, -1.645445, 1, 0, 0, 1, 1,
-0.6524816, 0.5354596, -0.07969027, 1, 0, 0, 1, 1,
-0.6490241, -1.334698, -2.204213, 0, 0, 0, 1, 1,
-0.637839, 1.305117, -0.321121, 0, 0, 0, 1, 1,
-0.6374466, 0.2981344, -0.2105418, 0, 0, 0, 1, 1,
-0.6342645, -0.2959199, -2.161815, 0, 0, 0, 1, 1,
-0.6318181, -1.763364, -3.033841, 0, 0, 0, 1, 1,
-0.6306061, 0.5049081, -0.4634755, 0, 0, 0, 1, 1,
-0.6291535, -1.867837, -4.125146, 0, 0, 0, 1, 1,
-0.6274742, -0.6770372, -2.734941, 1, 1, 1, 1, 1,
-0.6240765, -0.1697511, -1.322626, 1, 1, 1, 1, 1,
-0.620162, 0.2790097, -0.5535536, 1, 1, 1, 1, 1,
-0.619332, 0.3906982, -2.820402, 1, 1, 1, 1, 1,
-0.6147063, 2.153565, -0.1894781, 1, 1, 1, 1, 1,
-0.614315, -0.2882093, -3.730098, 1, 1, 1, 1, 1,
-0.611627, 1.285649, 0.4442983, 1, 1, 1, 1, 1,
-0.6073434, 0.07870001, 0.7223644, 1, 1, 1, 1, 1,
-0.6036354, 0.3335741, -2.717296, 1, 1, 1, 1, 1,
-0.6017269, -0.9565778, -2.278273, 1, 1, 1, 1, 1,
-0.5995709, -0.001159416, -1.894453, 1, 1, 1, 1, 1,
-0.5980659, 0.9864739, 0.5709011, 1, 1, 1, 1, 1,
-0.5939673, 1.244406, 0.06732317, 1, 1, 1, 1, 1,
-0.5917992, 1.210123, -0.3361335, 1, 1, 1, 1, 1,
-0.5853093, -0.2839822, -2.742322, 1, 1, 1, 1, 1,
-0.5819537, 0.8666295, -2.521265, 0, 0, 1, 1, 1,
-0.5814918, 1.810233, -0.5145262, 1, 0, 0, 1, 1,
-0.5810299, -1.368433, -2.095269, 1, 0, 0, 1, 1,
-0.5804592, -0.694845, -3.296781, 1, 0, 0, 1, 1,
-0.5799296, -0.07357752, -0.7914172, 1, 0, 0, 1, 1,
-0.5769593, 0.8368412, -0.7420007, 1, 0, 0, 1, 1,
-0.5731094, -0.02598922, -4.002113, 0, 0, 0, 1, 1,
-0.5694538, 3.002469, -0.9773915, 0, 0, 0, 1, 1,
-0.5667897, -2.139446, -2.466169, 0, 0, 0, 1, 1,
-0.5574144, 0.2966242, -0.9382766, 0, 0, 0, 1, 1,
-0.5555807, 0.03479926, -1.075489, 0, 0, 0, 1, 1,
-0.5521163, 0.7106999, -3.797892, 0, 0, 0, 1, 1,
-0.5464527, 1.286207, 0.2307604, 0, 0, 0, 1, 1,
-0.5448105, 0.8655115, -1.988096, 1, 1, 1, 1, 1,
-0.5406916, 1.398251, -0.4170389, 1, 1, 1, 1, 1,
-0.5346265, -0.3336198, -1.888755, 1, 1, 1, 1, 1,
-0.5272291, -0.4941186, -3.88732, 1, 1, 1, 1, 1,
-0.5264937, 2.290219, 0.1720165, 1, 1, 1, 1, 1,
-0.5256058, 0.1325559, -0.2989698, 1, 1, 1, 1, 1,
-0.5249628, 1.576082, 1.054933, 1, 1, 1, 1, 1,
-0.5223353, 2.784198, -0.2273262, 1, 1, 1, 1, 1,
-0.5206702, -0.8482335, -1.770827, 1, 1, 1, 1, 1,
-0.5190972, 0.1916291, -2.204055, 1, 1, 1, 1, 1,
-0.519047, -1.264528, -1.158573, 1, 1, 1, 1, 1,
-0.5188922, 0.07127184, 0.1143796, 1, 1, 1, 1, 1,
-0.5097272, -1.793974, -4.208009, 1, 1, 1, 1, 1,
-0.5096228, 1.226886, 0.3379195, 1, 1, 1, 1, 1,
-0.509081, 1.206418, 1.461851, 1, 1, 1, 1, 1,
-0.5082175, -0.4887294, -2.341556, 0, 0, 1, 1, 1,
-0.506862, -0.4604925, -2.27496, 1, 0, 0, 1, 1,
-0.5008737, 0.8038586, 0.7576395, 1, 0, 0, 1, 1,
-0.5000669, 0.691271, -1.76745, 1, 0, 0, 1, 1,
-0.4979692, 0.2146914, -2.312315, 1, 0, 0, 1, 1,
-0.4979377, -1.491641, -2.44274, 1, 0, 0, 1, 1,
-0.4964392, 0.6119355, -0.8922799, 0, 0, 0, 1, 1,
-0.494657, 0.4462116, -1.05162, 0, 0, 0, 1, 1,
-0.492466, 0.8457965, -1.949062, 0, 0, 0, 1, 1,
-0.4884841, -0.1121105, -0.7895689, 0, 0, 0, 1, 1,
-0.4861934, -0.2345643, -4.328903, 0, 0, 0, 1, 1,
-0.4809898, 1.282111, -1.486862, 0, 0, 0, 1, 1,
-0.4781384, -0.6462601, -2.667426, 0, 0, 0, 1, 1,
-0.4754673, -0.7077147, -2.664061, 1, 1, 1, 1, 1,
-0.4697623, -1.075635, -1.404689, 1, 1, 1, 1, 1,
-0.4680806, 0.8121925, -0.6770539, 1, 1, 1, 1, 1,
-0.4673819, 0.1172109, 0.08017468, 1, 1, 1, 1, 1,
-0.465892, 1.37831, 0.7468665, 1, 1, 1, 1, 1,
-0.4653096, 0.677897, 0.3222305, 1, 1, 1, 1, 1,
-0.4613974, -0.143403, -1.532631, 1, 1, 1, 1, 1,
-0.4600296, -0.6000077, -0.7098461, 1, 1, 1, 1, 1,
-0.4583938, -1.80153, -3.169845, 1, 1, 1, 1, 1,
-0.4505949, 0.8011312, 0.5331145, 1, 1, 1, 1, 1,
-0.4490117, -0.9873316, -3.547933, 1, 1, 1, 1, 1,
-0.4441979, 1.17777, -0.7898318, 1, 1, 1, 1, 1,
-0.4436755, 1.7122, -1.016849, 1, 1, 1, 1, 1,
-0.4426576, 0.3916886, -4.089218, 1, 1, 1, 1, 1,
-0.4404171, -1.235125, -2.085861, 1, 1, 1, 1, 1,
-0.437167, 2.10869, -0.2440293, 0, 0, 1, 1, 1,
-0.436918, 0.2354665, -2.331484, 1, 0, 0, 1, 1,
-0.4313621, 0.907937, -0.1322445, 1, 0, 0, 1, 1,
-0.4290428, 0.0191651, -1.717345, 1, 0, 0, 1, 1,
-0.4281951, -0.4329793, -2.687805, 1, 0, 0, 1, 1,
-0.4255129, -0.6341696, -4.055838, 1, 0, 0, 1, 1,
-0.4215178, -1.052227, -2.682651, 0, 0, 0, 1, 1,
-0.4187024, 1.224677, -1.915717, 0, 0, 0, 1, 1,
-0.4181113, 1.23212, 0.2212903, 0, 0, 0, 1, 1,
-0.4172376, -0.1161105, 0.658949, 0, 0, 0, 1, 1,
-0.4159856, -2.510097, -3.173319, 0, 0, 0, 1, 1,
-0.4148345, -1.411032, -2.575703, 0, 0, 0, 1, 1,
-0.4103167, 1.253927, -0.9546923, 0, 0, 0, 1, 1,
-0.4090759, -1.858576, -4.153684, 1, 1, 1, 1, 1,
-0.4086662, -0.3017072, -1.004249, 1, 1, 1, 1, 1,
-0.4067263, 1.256405, -0.7530501, 1, 1, 1, 1, 1,
-0.4040617, 0.786775, -1.282993, 1, 1, 1, 1, 1,
-0.4040565, -0.1684313, -1.020174, 1, 1, 1, 1, 1,
-0.3927554, 0.2156876, -1.265895, 1, 1, 1, 1, 1,
-0.3920107, 0.6720358, 0.1390509, 1, 1, 1, 1, 1,
-0.3908566, 1.614803, 1.148645, 1, 1, 1, 1, 1,
-0.3883646, 0.6143202, -0.8355021, 1, 1, 1, 1, 1,
-0.3873155, 0.5312159, 1.302623, 1, 1, 1, 1, 1,
-0.38232, 1.399639, 0.8789811, 1, 1, 1, 1, 1,
-0.3776711, 0.05631416, -0.8971584, 1, 1, 1, 1, 1,
-0.3774208, 2.14885, -1.48715, 1, 1, 1, 1, 1,
-0.3739139, 0.5654663, -2.222281, 1, 1, 1, 1, 1,
-0.3625324, -0.5839679, -3.940985, 1, 1, 1, 1, 1,
-0.3600814, -0.2790008, -2.934881, 0, 0, 1, 1, 1,
-0.358688, -0.7090805, -3.035911, 1, 0, 0, 1, 1,
-0.3586555, -0.5249417, -4.376941, 1, 0, 0, 1, 1,
-0.3566391, -0.685159, -3.362766, 1, 0, 0, 1, 1,
-0.3559749, -0.1050253, -2.808393, 1, 0, 0, 1, 1,
-0.3544403, 1.113118, 0.7911096, 1, 0, 0, 1, 1,
-0.3503042, -1.837286, -1.626118, 0, 0, 0, 1, 1,
-0.3456429, -0.2166969, -1.991239, 0, 0, 0, 1, 1,
-0.3351455, -1.018051, -4.133564, 0, 0, 0, 1, 1,
-0.3340668, -0.708939, -0.9367137, 0, 0, 0, 1, 1,
-0.3321636, 1.292618, 0.8771934, 0, 0, 0, 1, 1,
-0.3294843, 0.475183, 0.5075697, 0, 0, 0, 1, 1,
-0.3249298, 1.476524, -0.9464461, 0, 0, 0, 1, 1,
-0.3220818, 0.3055836, -0.4812073, 1, 1, 1, 1, 1,
-0.318904, -2.29063, -1.702172, 1, 1, 1, 1, 1,
-0.316174, -0.9033082, -2.040047, 1, 1, 1, 1, 1,
-0.3131359, -0.8298307, -2.705838, 1, 1, 1, 1, 1,
-0.30882, -0.7175093, -2.234678, 1, 1, 1, 1, 1,
-0.3073641, 1.011562, -0.6854172, 1, 1, 1, 1, 1,
-0.3069511, 0.4777017, -0.30207, 1, 1, 1, 1, 1,
-0.3022313, 1.587057, 0.5873277, 1, 1, 1, 1, 1,
-0.3005543, -0.5173497, -3.088531, 1, 1, 1, 1, 1,
-0.2974904, 0.4837573, -1.081551, 1, 1, 1, 1, 1,
-0.2965631, 1.488523, -0.05361279, 1, 1, 1, 1, 1,
-0.294012, -1.107336, -2.029445, 1, 1, 1, 1, 1,
-0.2925437, 0.7646067, -1.338376, 1, 1, 1, 1, 1,
-0.2875319, -0.4430154, -4.388209, 1, 1, 1, 1, 1,
-0.2872965, -1.22292, -2.559176, 1, 1, 1, 1, 1,
-0.28651, -0.7300276, -2.564173, 0, 0, 1, 1, 1,
-0.2827801, 0.3212329, -1.752205, 1, 0, 0, 1, 1,
-0.2823696, -0.8294111, -3.881517, 1, 0, 0, 1, 1,
-0.2814164, -0.6739931, -3.69256, 1, 0, 0, 1, 1,
-0.2755178, -1.526421, -2.763951, 1, 0, 0, 1, 1,
-0.2672157, -0.9178708, -4.537961, 1, 0, 0, 1, 1,
-0.2670391, 1.001628, 0.6709788, 0, 0, 0, 1, 1,
-0.2663477, 0.2641625, 0.5532823, 0, 0, 0, 1, 1,
-0.2661568, 0.7682529, 0.5279422, 0, 0, 0, 1, 1,
-0.2583635, -1.073979, -3.60964, 0, 0, 0, 1, 1,
-0.2572976, -0.5650406, -2.885574, 0, 0, 0, 1, 1,
-0.2562543, 0.6809313, 0.09469055, 0, 0, 0, 1, 1,
-0.2555139, -1.883055, -3.385763, 0, 0, 0, 1, 1,
-0.2521536, -1.370319, -1.462768, 1, 1, 1, 1, 1,
-0.241844, -0.7009354, -2.435184, 1, 1, 1, 1, 1,
-0.2395879, -0.7412348, -2.677159, 1, 1, 1, 1, 1,
-0.2369893, 1.526091, -1.76245, 1, 1, 1, 1, 1,
-0.2330882, -0.5668525, -4.296074, 1, 1, 1, 1, 1,
-0.2310602, -1.029724, -1.535207, 1, 1, 1, 1, 1,
-0.2306635, 1.13556, 0.5801946, 1, 1, 1, 1, 1,
-0.2276419, 0.4066322, -1.823506, 1, 1, 1, 1, 1,
-0.2182006, 0.8423427, -0.7141421, 1, 1, 1, 1, 1,
-0.2179706, -0.9356524, -2.569818, 1, 1, 1, 1, 1,
-0.2168636, -1.299502, -3.22329, 1, 1, 1, 1, 1,
-0.2139945, -1.189675, -3.071865, 1, 1, 1, 1, 1,
-0.1994523, 0.859726, 1.115986, 1, 1, 1, 1, 1,
-0.1956321, 1.448124, 0.7353753, 1, 1, 1, 1, 1,
-0.1945319, 0.42125, 1.49056, 1, 1, 1, 1, 1,
-0.1877034, 0.9225209, -1.844598, 0, 0, 1, 1, 1,
-0.1860103, -0.6155328, -3.715488, 1, 0, 0, 1, 1,
-0.1851093, -0.5339763, -2.54812, 1, 0, 0, 1, 1,
-0.1745441, 0.1554282, -2.574746, 1, 0, 0, 1, 1,
-0.1743807, -0.1571339, -3.56838, 1, 0, 0, 1, 1,
-0.1742241, 0.2867967, -1.019533, 1, 0, 0, 1, 1,
-0.1741986, 0.7758948, -1.75579, 0, 0, 0, 1, 1,
-0.1736282, 0.4179081, 0.06572168, 0, 0, 0, 1, 1,
-0.172569, 1.402751, 0.6306578, 0, 0, 0, 1, 1,
-0.1721242, 0.08312096, -1.463835, 0, 0, 0, 1, 1,
-0.1712161, 1.257937, -0.005988418, 0, 0, 0, 1, 1,
-0.1706068, 1.384364, 0.3862612, 0, 0, 0, 1, 1,
-0.1664663, 1.833495, -1.138451, 0, 0, 0, 1, 1,
-0.1614639, 0.5935267, -0.3755458, 1, 1, 1, 1, 1,
-0.1595761, -2.316425, -0.9524945, 1, 1, 1, 1, 1,
-0.1592824, -0.5224149, -4.287732, 1, 1, 1, 1, 1,
-0.155698, 1.077735, 1.511063, 1, 1, 1, 1, 1,
-0.1548392, 0.4182273, 1.179425, 1, 1, 1, 1, 1,
-0.1537456, 0.7675075, -0.0694236, 1, 1, 1, 1, 1,
-0.1507526, -0.2426031, -3.649119, 1, 1, 1, 1, 1,
-0.1486475, 0.1250178, 0.1149072, 1, 1, 1, 1, 1,
-0.1469291, -0.2983485, -2.68157, 1, 1, 1, 1, 1,
-0.1456088, 1.004269, -2.762641, 1, 1, 1, 1, 1,
-0.1432515, 0.08611265, 0.1426361, 1, 1, 1, 1, 1,
-0.1428047, -0.5199817, -2.396233, 1, 1, 1, 1, 1,
-0.1403048, 0.6846884, -2.406227, 1, 1, 1, 1, 1,
-0.1363314, -2.064798, -3.315034, 1, 1, 1, 1, 1,
-0.1278092, 0.7460141, 1.730655, 1, 1, 1, 1, 1,
-0.1259903, -0.6751399, -3.290188, 0, 0, 1, 1, 1,
-0.1256626, 0.8645716, -0.1519184, 1, 0, 0, 1, 1,
-0.1224251, -1.037296, -3.518414, 1, 0, 0, 1, 1,
-0.1170283, -1.092717, -3.844426, 1, 0, 0, 1, 1,
-0.1134879, 0.04200043, -1.043819, 1, 0, 0, 1, 1,
-0.1111727, 0.325259, 1.148228, 1, 0, 0, 1, 1,
-0.109851, -1.105543, -2.306681, 0, 0, 0, 1, 1,
-0.1096922, -0.364416, -2.880428, 0, 0, 0, 1, 1,
-0.1057809, -0.8683095, -2.777076, 0, 0, 0, 1, 1,
-0.102626, -2.038375, -3.953425, 0, 0, 0, 1, 1,
-0.102556, 1.122774, -0.3261564, 0, 0, 0, 1, 1,
-0.1019256, 2.521758, -0.5358765, 0, 0, 0, 1, 1,
-0.1016648, -1.029282, -3.501562, 0, 0, 0, 1, 1,
-0.09635444, -0.2418685, -3.379773, 1, 1, 1, 1, 1,
-0.09218175, -0.6680724, -3.856559, 1, 1, 1, 1, 1,
-0.09191076, -0.8332879, -2.774775, 1, 1, 1, 1, 1,
-0.08682738, 0.7344759, 0.658372, 1, 1, 1, 1, 1,
-0.08525513, -1.473639, -2.571882, 1, 1, 1, 1, 1,
-0.08437895, -0.7782766, -2.743987, 1, 1, 1, 1, 1,
-0.0842154, -0.8243977, -2.337417, 1, 1, 1, 1, 1,
-0.08265777, -0.4974301, -2.138775, 1, 1, 1, 1, 1,
-0.08154497, 0.3980076, -0.9280075, 1, 1, 1, 1, 1,
-0.0770135, -1.074288, -4.019383, 1, 1, 1, 1, 1,
-0.07659452, -0.6570943, -2.988697, 1, 1, 1, 1, 1,
-0.07498714, -0.567223, -4.781735, 1, 1, 1, 1, 1,
-0.07477827, 0.4893676, 0.1966328, 1, 1, 1, 1, 1,
-0.07284274, 0.02541913, -3.268909, 1, 1, 1, 1, 1,
-0.07190099, 0.3639503, -1.042, 1, 1, 1, 1, 1,
-0.07183181, -0.4642878, -1.468668, 0, 0, 1, 1, 1,
-0.06826638, -1.61945, -3.403162, 1, 0, 0, 1, 1,
-0.06654706, -1.579004, -2.592444, 1, 0, 0, 1, 1,
-0.06646232, -0.03585361, 0.08373566, 1, 0, 0, 1, 1,
-0.06474041, 1.056574, 0.46762, 1, 0, 0, 1, 1,
-0.05465002, 0.2599888, 0.1897524, 1, 0, 0, 1, 1,
-0.05367724, 0.4294469, -1.421857, 0, 0, 0, 1, 1,
-0.05137639, 0.4019393, -1.325693, 0, 0, 0, 1, 1,
-0.05026513, -0.2137327, -3.272826, 0, 0, 0, 1, 1,
-0.0442436, 1.895405, 0.02563172, 0, 0, 0, 1, 1,
-0.04077664, -0.9841223, -3.72998, 0, 0, 0, 1, 1,
-0.03982399, 0.7843566, -0.2488722, 0, 0, 0, 1, 1,
-0.03890799, 0.01981218, -1.580538, 0, 0, 0, 1, 1,
-0.03878807, -1.902546, -1.791348, 1, 1, 1, 1, 1,
-0.03710933, -2.118387, -3.313179, 1, 1, 1, 1, 1,
-0.0282966, 0.4173574, -0.7401965, 1, 1, 1, 1, 1,
-0.0246332, -0.1109279, -2.204461, 1, 1, 1, 1, 1,
-0.02376102, -0.4557462, -2.707935, 1, 1, 1, 1, 1,
-0.02113701, 0.03636559, -0.3012175, 1, 1, 1, 1, 1,
-0.01859144, 0.5366309, 1.212788, 1, 1, 1, 1, 1,
-0.01653429, -1.465719, -3.105389, 1, 1, 1, 1, 1,
-0.01549117, -0.2873727, -2.030979, 1, 1, 1, 1, 1,
-0.01185358, 1.580106, 1.238358, 1, 1, 1, 1, 1,
-0.01141148, 0.5164238, 0.3954691, 1, 1, 1, 1, 1,
-0.01059829, -0.3011312, -2.821482, 1, 1, 1, 1, 1,
-0.009470203, 0.140648, 0.01636758, 1, 1, 1, 1, 1,
-0.002556695, -0.7777598, -3.652464, 1, 1, 1, 1, 1,
0.0007388715, -1.409481, 3.013048, 1, 1, 1, 1, 1,
0.002152893, -1.453645, 3.173577, 0, 0, 1, 1, 1,
0.003169952, -0.08194567, 3.170894, 1, 0, 0, 1, 1,
0.003355492, 0.8926505, -0.5403011, 1, 0, 0, 1, 1,
0.006577902, 0.29472, -0.2058963, 1, 0, 0, 1, 1,
0.0070019, 3.159264, 1.467338, 1, 0, 0, 1, 1,
0.008804911, 1.00353, -0.4382271, 1, 0, 0, 1, 1,
0.009597679, 0.9869011, -0.9605255, 0, 0, 0, 1, 1,
0.0103677, 1.489644, -0.4435989, 0, 0, 0, 1, 1,
0.01651284, 0.954908, 0.2115736, 0, 0, 0, 1, 1,
0.02048573, -0.2799887, 3.845962, 0, 0, 0, 1, 1,
0.02114574, -0.7154498, 1.753069, 0, 0, 0, 1, 1,
0.03071328, 0.07726522, 1.234617, 0, 0, 0, 1, 1,
0.03534177, -1.548378, 3.594664, 0, 0, 0, 1, 1,
0.03628704, -0.4113791, 4.618004, 1, 1, 1, 1, 1,
0.03741956, 0.9511374, 0.1417889, 1, 1, 1, 1, 1,
0.03833322, -0.918238, 2.746751, 1, 1, 1, 1, 1,
0.04062354, 0.957388, -0.9376079, 1, 1, 1, 1, 1,
0.04102468, -0.8171449, 3.140102, 1, 1, 1, 1, 1,
0.04433376, 1.945065, 0.6829105, 1, 1, 1, 1, 1,
0.04520927, -0.8505855, 2.856552, 1, 1, 1, 1, 1,
0.04907085, -2.959417, 3.775329, 1, 1, 1, 1, 1,
0.04956863, 0.08093882, -0.4390947, 1, 1, 1, 1, 1,
0.05046774, 0.9326167, -1.014884, 1, 1, 1, 1, 1,
0.05110947, -0.9634402, 2.96659, 1, 1, 1, 1, 1,
0.07093081, 1.042163, -0.2361197, 1, 1, 1, 1, 1,
0.07209707, -0.3199456, 1.669123, 1, 1, 1, 1, 1,
0.07238039, -0.4021791, 2.353034, 1, 1, 1, 1, 1,
0.07279026, -0.553928, 4.955436, 1, 1, 1, 1, 1,
0.07400561, 0.9542134, 1.535867, 0, 0, 1, 1, 1,
0.07455372, 1.946958, -0.6730691, 1, 0, 0, 1, 1,
0.07667758, -0.8851795, 3.531034, 1, 0, 0, 1, 1,
0.07960278, -1.025069, 3.324571, 1, 0, 0, 1, 1,
0.07964029, -0.7521688, 4.469828, 1, 0, 0, 1, 1,
0.07991317, 0.7454763, 2.290582, 1, 0, 0, 1, 1,
0.08059824, 0.2229284, 1.30003, 0, 0, 0, 1, 1,
0.08082568, 0.350087, -1.907178, 0, 0, 0, 1, 1,
0.08127171, -0.4456284, 4.44779, 0, 0, 0, 1, 1,
0.08476432, 0.3968295, -0.1986967, 0, 0, 0, 1, 1,
0.08577184, 0.3460473, 1.574651, 0, 0, 0, 1, 1,
0.086604, 1.594249, -1.074272, 0, 0, 0, 1, 1,
0.08719238, -0.8026982, 4.74082, 0, 0, 0, 1, 1,
0.08720814, -1.09147, 2.717993, 1, 1, 1, 1, 1,
0.09280375, 0.9938408, 0.320613, 1, 1, 1, 1, 1,
0.09393916, -1.387851, 3.325989, 1, 1, 1, 1, 1,
0.09536789, 0.5797262, -1.951237, 1, 1, 1, 1, 1,
0.09539422, -1.369569, 3.556075, 1, 1, 1, 1, 1,
0.09710037, 1.171088, -0.8888911, 1, 1, 1, 1, 1,
0.1008295, 0.06503893, 0.6891643, 1, 1, 1, 1, 1,
0.1020684, -1.948572, 4.32687, 1, 1, 1, 1, 1,
0.1144974, 0.6778753, 0.8013762, 1, 1, 1, 1, 1,
0.1165428, 1.197401, -1.155344, 1, 1, 1, 1, 1,
0.1201106, -1.106586, 3.847647, 1, 1, 1, 1, 1,
0.121942, -0.9512424, 1.827024, 1, 1, 1, 1, 1,
0.1223168, -1.954057, 1.654864, 1, 1, 1, 1, 1,
0.1228372, 1.502117, 1.039316, 1, 1, 1, 1, 1,
0.1251937, -1.547733, 4.271262, 1, 1, 1, 1, 1,
0.1275255, 1.270333, -0.2572595, 0, 0, 1, 1, 1,
0.1342796, -1.080527, 2.175542, 1, 0, 0, 1, 1,
0.1349462, 1.122509, 0.09927458, 1, 0, 0, 1, 1,
0.1366759, -0.6377147, 3.711711, 1, 0, 0, 1, 1,
0.137379, 0.7350424, -0.4966905, 1, 0, 0, 1, 1,
0.1387357, 0.56178, -1.15931, 1, 0, 0, 1, 1,
0.138833, 1.120345, 2.529596, 0, 0, 0, 1, 1,
0.1412241, 0.8737559, 1.249566, 0, 0, 0, 1, 1,
0.1418461, 0.2783023, 0.3286276, 0, 0, 0, 1, 1,
0.146402, 0.9466842, -1.224031, 0, 0, 0, 1, 1,
0.1488025, -0.3931535, 2.313853, 0, 0, 0, 1, 1,
0.1551102, 0.1070155, -1.464937, 0, 0, 0, 1, 1,
0.1554147, -0.08020712, 3.430988, 0, 0, 0, 1, 1,
0.157482, 1.350253, -1.896001, 1, 1, 1, 1, 1,
0.1576996, -0.6399988, 2.693626, 1, 1, 1, 1, 1,
0.1603359, -1.293576, 2.923305, 1, 1, 1, 1, 1,
0.1606032, -0.1468982, 2.130714, 1, 1, 1, 1, 1,
0.1682657, 0.6682163, 0.9246362, 1, 1, 1, 1, 1,
0.1689356, 0.7483199, 2.059895, 1, 1, 1, 1, 1,
0.1739341, 2.41298, -2.350895, 1, 1, 1, 1, 1,
0.1749276, -1.238813, 2.121495, 1, 1, 1, 1, 1,
0.1796701, -0.1044135, 2.431145, 1, 1, 1, 1, 1,
0.180301, -0.5824042, 1.524497, 1, 1, 1, 1, 1,
0.1822192, 0.4261265, 0.5184096, 1, 1, 1, 1, 1,
0.184169, 2.235224, -0.2113685, 1, 1, 1, 1, 1,
0.1846767, -0.1497119, 2.748691, 1, 1, 1, 1, 1,
0.1864627, -0.9217213, 1.250998, 1, 1, 1, 1, 1,
0.1922147, 0.8130759, 1.72449, 1, 1, 1, 1, 1,
0.1985743, 0.1336046, 1.864173, 0, 0, 1, 1, 1,
0.1989429, 0.1238386, 0.7978997, 1, 0, 0, 1, 1,
0.2036946, -0.3043124, 2.104579, 1, 0, 0, 1, 1,
0.2092796, 0.6746927, -1.626847, 1, 0, 0, 1, 1,
0.2143238, 1.730371, 0.7267671, 1, 0, 0, 1, 1,
0.2147751, 1.441281, 1.306202, 1, 0, 0, 1, 1,
0.2165819, 0.4800099, 2.46452, 0, 0, 0, 1, 1,
0.2180836, -0.4459553, 2.660609, 0, 0, 0, 1, 1,
0.2221872, 1.519479, -0.1429961, 0, 0, 0, 1, 1,
0.2236574, 0.6192986, -1.212219, 0, 0, 0, 1, 1,
0.2241307, 0.7812635, -0.2431301, 0, 0, 0, 1, 1,
0.2265881, 0.0135233, 3.393219, 0, 0, 0, 1, 1,
0.2268004, -0.5682894, 3.077509, 0, 0, 0, 1, 1,
0.2277758, -0.2008312, 3.622337, 1, 1, 1, 1, 1,
0.2283529, 0.7082422, -0.1560266, 1, 1, 1, 1, 1,
0.2374054, 0.4647174, 1.714585, 1, 1, 1, 1, 1,
0.2427358, 0.01940264, 2.030284, 1, 1, 1, 1, 1,
0.2438783, 0.6833957, 0.6429818, 1, 1, 1, 1, 1,
0.2444199, -0.1698123, 0.9386219, 1, 1, 1, 1, 1,
0.2456892, -0.6109138, 2.659553, 1, 1, 1, 1, 1,
0.2474415, 0.2621865, -0.02811684, 1, 1, 1, 1, 1,
0.2536294, -0.9835568, 3.287299, 1, 1, 1, 1, 1,
0.254332, 0.331466, -0.9115454, 1, 1, 1, 1, 1,
0.2608671, 1.34176, 0.1563027, 1, 1, 1, 1, 1,
0.2608715, -0.6221725, 2.755722, 1, 1, 1, 1, 1,
0.2610927, -0.0757159, 3.431756, 1, 1, 1, 1, 1,
0.2617119, 0.302824, 0.1623879, 1, 1, 1, 1, 1,
0.2706309, -1.694611, 3.214772, 1, 1, 1, 1, 1,
0.2750956, 0.3911791, 1.70224, 0, 0, 1, 1, 1,
0.2753269, -0.0452517, 2.163861, 1, 0, 0, 1, 1,
0.2817658, 0.07277813, 1.338869, 1, 0, 0, 1, 1,
0.2841252, 0.1677867, 2.288655, 1, 0, 0, 1, 1,
0.2953979, 0.6647237, 0.2975312, 1, 0, 0, 1, 1,
0.3004724, 1.673935, 0.700218, 1, 0, 0, 1, 1,
0.3010491, 1.272543, 0.506053, 0, 0, 0, 1, 1,
0.3030418, 0.8494831, 0.08627822, 0, 0, 0, 1, 1,
0.3074499, -0.9427583, 3.759696, 0, 0, 0, 1, 1,
0.3075536, 0.8677332, 0.9857162, 0, 0, 0, 1, 1,
0.3090465, 1.439884, 0.4401152, 0, 0, 0, 1, 1,
0.3127879, -0.8849785, 2.306209, 0, 0, 0, 1, 1,
0.3160349, -2.144646, 2.616266, 0, 0, 0, 1, 1,
0.3194022, 0.585681, -0.5427823, 1, 1, 1, 1, 1,
0.3205462, 1.359146, -0.903824, 1, 1, 1, 1, 1,
0.3205895, -0.661231, 3.311869, 1, 1, 1, 1, 1,
0.3229677, -0.9310356, 1.692758, 1, 1, 1, 1, 1,
0.3233454, 0.2539102, 0.2551636, 1, 1, 1, 1, 1,
0.323822, 0.2319534, 2.891263, 1, 1, 1, 1, 1,
0.3258827, -0.2442862, 2.751486, 1, 1, 1, 1, 1,
0.3295025, 0.9003344, 0.6912792, 1, 1, 1, 1, 1,
0.3309781, 0.2040723, -0.3640963, 1, 1, 1, 1, 1,
0.3367405, -1.464742, 4.363142, 1, 1, 1, 1, 1,
0.3409252, -0.1456427, 1.966914, 1, 1, 1, 1, 1,
0.3409622, 0.8768502, 1.584954, 1, 1, 1, 1, 1,
0.3409872, 0.1635553, -0.436255, 1, 1, 1, 1, 1,
0.3421673, 0.1534643, 0.3299459, 1, 1, 1, 1, 1,
0.3424262, -1.058, 3.006618, 1, 1, 1, 1, 1,
0.3429322, 1.18833, -0.1947997, 0, 0, 1, 1, 1,
0.3451133, 2.112579, -0.5321401, 1, 0, 0, 1, 1,
0.3476622, 0.101429, 0.3291765, 1, 0, 0, 1, 1,
0.3556479, -2.58324, 2.905335, 1, 0, 0, 1, 1,
0.3580081, 1.055136, 2.972758, 1, 0, 0, 1, 1,
0.35849, 0.6649898, 1.741423, 1, 0, 0, 1, 1,
0.3611476, 0.2172408, 0.204199, 0, 0, 0, 1, 1,
0.3626336, 0.355417, -1.359666, 0, 0, 0, 1, 1,
0.3643265, -1.88797, 2.415353, 0, 0, 0, 1, 1,
0.3658032, 1.004168, 0.6709099, 0, 0, 0, 1, 1,
0.3750146, 2.010792, 0.4930758, 0, 0, 0, 1, 1,
0.3778138, 0.919593, -2.426265, 0, 0, 0, 1, 1,
0.378186, 0.1920526, 0.8143563, 0, 0, 0, 1, 1,
0.3803306, 0.408245, 0.3003423, 1, 1, 1, 1, 1,
0.3865587, 1.587772, -0.6119484, 1, 1, 1, 1, 1,
0.390906, -1.344324, 2.920681, 1, 1, 1, 1, 1,
0.3921213, 0.5565038, 0.6795025, 1, 1, 1, 1, 1,
0.3927864, 0.2202245, 1.844582, 1, 1, 1, 1, 1,
0.3996716, 0.6094028, 0.006820713, 1, 1, 1, 1, 1,
0.4008921, -0.7512, 3.150233, 1, 1, 1, 1, 1,
0.4014316, -0.1005551, 1.627258, 1, 1, 1, 1, 1,
0.4062616, 0.7458166, 0.7057226, 1, 1, 1, 1, 1,
0.4074804, -0.170494, 1.267364, 1, 1, 1, 1, 1,
0.410382, -1.183903, 2.160849, 1, 1, 1, 1, 1,
0.4106281, -1.47313, 4.398002, 1, 1, 1, 1, 1,
0.411064, 0.04547634, 2.462322, 1, 1, 1, 1, 1,
0.4113285, 0.5839043, 1.654483, 1, 1, 1, 1, 1,
0.4115325, 0.5448989, -0.3071779, 1, 1, 1, 1, 1,
0.4124013, 1.015114, -2.750254, 0, 0, 1, 1, 1,
0.4157128, 1.951605, -1.552778, 1, 0, 0, 1, 1,
0.4168648, 0.2210488, 3.324198, 1, 0, 0, 1, 1,
0.421788, 1.068046, -1.62215, 1, 0, 0, 1, 1,
0.4275477, 0.8722901, -1.441546, 1, 0, 0, 1, 1,
0.4278132, -2.299535, 3.050343, 1, 0, 0, 1, 1,
0.4339028, -0.1838861, 3.325006, 0, 0, 0, 1, 1,
0.4375188, 1.057057, -0.3381683, 0, 0, 0, 1, 1,
0.4400285, -0.5221885, 3.646614, 0, 0, 0, 1, 1,
0.4445114, 0.7798477, -0.5296212, 0, 0, 0, 1, 1,
0.4453191, -1.602305, 2.268103, 0, 0, 0, 1, 1,
0.448405, 0.2575816, 2.017329, 0, 0, 0, 1, 1,
0.4493726, -0.9696694, 1.913182, 0, 0, 0, 1, 1,
0.4510041, -1.840313, 4.205938, 1, 1, 1, 1, 1,
0.4528794, -0.8071135, 2.550664, 1, 1, 1, 1, 1,
0.4555793, -0.0791728, 1.85779, 1, 1, 1, 1, 1,
0.4589996, 0.4592611, 1.768645, 1, 1, 1, 1, 1,
0.4609924, -0.498987, 2.579914, 1, 1, 1, 1, 1,
0.4621433, 0.3180186, -0.1384229, 1, 1, 1, 1, 1,
0.4627988, 0.458323, 0.8245863, 1, 1, 1, 1, 1,
0.464636, 0.6301294, 0.432012, 1, 1, 1, 1, 1,
0.4704821, -0.336958, 3.34356, 1, 1, 1, 1, 1,
0.4732998, 0.007699389, 3.210639, 1, 1, 1, 1, 1,
0.4737454, -0.2257493, 3.556853, 1, 1, 1, 1, 1,
0.4778481, -0.3334233, 3.999917, 1, 1, 1, 1, 1,
0.4788752, 0.2470847, -0.09739463, 1, 1, 1, 1, 1,
0.4816962, -0.8004258, 4.960999, 1, 1, 1, 1, 1,
0.4862624, -0.4571854, 3.455127, 1, 1, 1, 1, 1,
0.5099812, 0.9831577, 2.541924, 0, 0, 1, 1, 1,
0.5157703, 0.5253803, -0.3641666, 1, 0, 0, 1, 1,
0.5200791, -0.1197487, 1.261993, 1, 0, 0, 1, 1,
0.5244365, 0.9485542, -0.6058365, 1, 0, 0, 1, 1,
0.5295816, -1.864979, 4.362157, 1, 0, 0, 1, 1,
0.5319892, -0.09805813, 2.165424, 1, 0, 0, 1, 1,
0.5327743, 1.600368, 0.7786664, 0, 0, 0, 1, 1,
0.534227, -0.466352, 1.475579, 0, 0, 0, 1, 1,
0.5355511, -0.01148163, 3.338645, 0, 0, 0, 1, 1,
0.5434963, 0.4247068, 1.940383, 0, 0, 0, 1, 1,
0.545377, 1.743431, 1.097212, 0, 0, 0, 1, 1,
0.55133, 0.8186677, 0.5296664, 0, 0, 0, 1, 1,
0.5517477, 0.8253601, 1.12031, 0, 0, 0, 1, 1,
0.5545716, -0.02366321, 2.839496, 1, 1, 1, 1, 1,
0.5589544, -0.8087949, 3.817853, 1, 1, 1, 1, 1,
0.5592015, 0.08112658, 1.250163, 1, 1, 1, 1, 1,
0.5643061, -0.7114324, 3.42051, 1, 1, 1, 1, 1,
0.5656259, -0.5950918, 1.808992, 1, 1, 1, 1, 1,
0.5802824, 0.4869937, -0.7014855, 1, 1, 1, 1, 1,
0.5803832, -1.147635, 2.688312, 1, 1, 1, 1, 1,
0.5848662, -1.597175, 1.523215, 1, 1, 1, 1, 1,
0.5861893, -1.589731, 3.359078, 1, 1, 1, 1, 1,
0.5865147, 0.09726232, 1.387299, 1, 1, 1, 1, 1,
0.5914032, 1.54825, -0.1773834, 1, 1, 1, 1, 1,
0.5928865, 1.65798, 0.1093533, 1, 1, 1, 1, 1,
0.5993899, 0.6950806, -0.100811, 1, 1, 1, 1, 1,
0.6004095, -1.921168, 4.110027, 1, 1, 1, 1, 1,
0.6008162, 0.2802767, 0.1159002, 1, 1, 1, 1, 1,
0.600851, 1.484472, -1.188804, 0, 0, 1, 1, 1,
0.6009368, -0.7821209, 3.679163, 1, 0, 0, 1, 1,
0.6023991, -1.25612, 1.515415, 1, 0, 0, 1, 1,
0.6029587, -0.8885788, 4.001357, 1, 0, 0, 1, 1,
0.6064001, 0.4055406, 2.270663, 1, 0, 0, 1, 1,
0.6064581, -1.328019, 2.601767, 1, 0, 0, 1, 1,
0.6118538, -0.8450833, 2.079505, 0, 0, 0, 1, 1,
0.6170703, 0.1034093, 2.058534, 0, 0, 0, 1, 1,
0.6178925, 0.3753764, 2.849334, 0, 0, 0, 1, 1,
0.6297737, -0.8032866, 2.378895, 0, 0, 0, 1, 1,
0.6351293, -1.400162, 3.74916, 0, 0, 0, 1, 1,
0.6360254, -0.05183661, 1.821354, 0, 0, 0, 1, 1,
0.6379617, -0.1506575, 2.183749, 0, 0, 0, 1, 1,
0.6385011, 0.9009778, -0.7309979, 1, 1, 1, 1, 1,
0.6438548, -0.6449165, 1.462986, 1, 1, 1, 1, 1,
0.6465448, 0.06794523, 1.974978, 1, 1, 1, 1, 1,
0.6486861, -0.2507132, 1.130192, 1, 1, 1, 1, 1,
0.6504456, 0.8500034, 1.472381, 1, 1, 1, 1, 1,
0.6530259, 0.4301272, 2.840762, 1, 1, 1, 1, 1,
0.6563411, -1.06287, 3.832271, 1, 1, 1, 1, 1,
0.663348, 0.7243861, 1.092908, 1, 1, 1, 1, 1,
0.6667171, 1.776796, 0.7317405, 1, 1, 1, 1, 1,
0.6691065, 0.6093369, 1.190432, 1, 1, 1, 1, 1,
0.670493, -0.9518954, 1.017089, 1, 1, 1, 1, 1,
0.6735519, 1.240556, -1.357437, 1, 1, 1, 1, 1,
0.6782231, 0.8655953, 1.447601, 1, 1, 1, 1, 1,
0.6787512, 0.9483531, 1.058707, 1, 1, 1, 1, 1,
0.6797098, 0.4819829, 0.7823022, 1, 1, 1, 1, 1,
0.6884683, -1.199158, 2.439348, 0, 0, 1, 1, 1,
0.7001508, 0.7672808, 0.3960475, 1, 0, 0, 1, 1,
0.703037, -0.7141914, 1.135863, 1, 0, 0, 1, 1,
0.709852, 0.8351583, 0.2079654, 1, 0, 0, 1, 1,
0.7109428, -0.04674783, 3.649615, 1, 0, 0, 1, 1,
0.7117122, -0.7170941, 1.667122, 1, 0, 0, 1, 1,
0.7132604, -0.3782947, 0.3584829, 0, 0, 0, 1, 1,
0.7193725, -0.6427808, 0.1941086, 0, 0, 0, 1, 1,
0.7206419, -0.4742089, 3.605077, 0, 0, 0, 1, 1,
0.7255086, 0.8415163, 0.7337177, 0, 0, 0, 1, 1,
0.7328357, -0.1489428, 0.09364092, 0, 0, 0, 1, 1,
0.7348284, 0.4618895, 0.8804549, 0, 0, 0, 1, 1,
0.7379383, -1.663683, 3.108331, 0, 0, 0, 1, 1,
0.7389777, -0.09405565, 2.124611, 1, 1, 1, 1, 1,
0.74101, -0.470573, 2.768661, 1, 1, 1, 1, 1,
0.7419967, 0.8739433, 1.074436, 1, 1, 1, 1, 1,
0.7437611, -1.82795, 3.224802, 1, 1, 1, 1, 1,
0.7460517, 0.4381348, -0.4127598, 1, 1, 1, 1, 1,
0.7525946, -0.5539809, 2.973805, 1, 1, 1, 1, 1,
0.7597799, 1.483098, 0.0105079, 1, 1, 1, 1, 1,
0.7600116, 0.1250595, 1.601774, 1, 1, 1, 1, 1,
0.7643906, -0.8986642, 2.160868, 1, 1, 1, 1, 1,
0.7646695, -1.197957, 3.464525, 1, 1, 1, 1, 1,
0.7676163, -0.2518393, 3.184573, 1, 1, 1, 1, 1,
0.7688305, -1.530589, 2.134654, 1, 1, 1, 1, 1,
0.7732477, 0.6135026, 0.7884989, 1, 1, 1, 1, 1,
0.7839655, -1.64197, 1.991334, 1, 1, 1, 1, 1,
0.7854608, 0.1711686, 0.6643523, 1, 1, 1, 1, 1,
0.8003029, -1.355139, 1.440028, 0, 0, 1, 1, 1,
0.8020427, -1.167361, 0.5473865, 1, 0, 0, 1, 1,
0.8049673, 0.4716072, 2.570502, 1, 0, 0, 1, 1,
0.810742, -0.6185169, 3.60597, 1, 0, 0, 1, 1,
0.8215452, -0.1332815, 2.7491, 1, 0, 0, 1, 1,
0.8342592, -1.139338, 2.138668, 1, 0, 0, 1, 1,
0.8411438, -0.3152866, 2.590195, 0, 0, 0, 1, 1,
0.8444244, -1.183229, 2.202673, 0, 0, 0, 1, 1,
0.8510333, -1.641108, 3.295886, 0, 0, 0, 1, 1,
0.8622691, 0.181261, 0.4895992, 0, 0, 0, 1, 1,
0.8654428, 0.3963054, 3.807792, 0, 0, 0, 1, 1,
0.8669815, 1.010058, 1.24633, 0, 0, 0, 1, 1,
0.8714659, -0.6743297, 2.326401, 0, 0, 0, 1, 1,
0.8729619, 0.5268589, 3.606783, 1, 1, 1, 1, 1,
0.877705, -0.07773803, 1.906648, 1, 1, 1, 1, 1,
0.8991293, -0.7581955, 2.572103, 1, 1, 1, 1, 1,
0.9013358, -0.5832688, 3.285617, 1, 1, 1, 1, 1,
0.9013374, 1.374065, 0.9786628, 1, 1, 1, 1, 1,
0.9034457, -1.124139, 3.536253, 1, 1, 1, 1, 1,
0.907804, -0.6470696, 3.870956, 1, 1, 1, 1, 1,
0.9120967, 0.18548, 0.8860934, 1, 1, 1, 1, 1,
0.9157259, -0.2151727, 0.6799526, 1, 1, 1, 1, 1,
0.9158669, -0.01050787, 2.504649, 1, 1, 1, 1, 1,
0.9199602, -0.06865064, 1.920735, 1, 1, 1, 1, 1,
0.9241616, -1.159916, 1.943099, 1, 1, 1, 1, 1,
0.9279287, -0.6771755, 1.217072, 1, 1, 1, 1, 1,
0.9279318, -2.327272, 2.732247, 1, 1, 1, 1, 1,
0.9320824, -1.276232, 3.215636, 1, 1, 1, 1, 1,
0.9346052, 0.1507008, 0.8612594, 0, 0, 1, 1, 1,
0.9347971, -1.902246, 2.600621, 1, 0, 0, 1, 1,
0.9352704, -0.6017935, 3.145215, 1, 0, 0, 1, 1,
0.9370437, 2.204847, -0.0802415, 1, 0, 0, 1, 1,
0.939227, 0.4493505, 1.030287, 1, 0, 0, 1, 1,
0.9397645, 1.318395, 0.8332806, 1, 0, 0, 1, 1,
0.9494627, 0.1990921, 0.9104182, 0, 0, 0, 1, 1,
0.9513289, -1.350812, 1.161427, 0, 0, 0, 1, 1,
0.9540826, 0.1420851, 1.115212, 0, 0, 0, 1, 1,
0.956585, -0.867183, 3.058057, 0, 0, 0, 1, 1,
0.9566956, 1.085176, 0.1025439, 0, 0, 0, 1, 1,
0.962474, -2.071505, 2.096529, 0, 0, 0, 1, 1,
0.9645431, -0.175765, 3.045693, 0, 0, 0, 1, 1,
0.967672, -0.6557623, 0.8231079, 1, 1, 1, 1, 1,
0.9703755, 0.6770334, 3.833555, 1, 1, 1, 1, 1,
0.9756825, -1.094336, 2.321104, 1, 1, 1, 1, 1,
0.9764367, -0.5256527, 3.070221, 1, 1, 1, 1, 1,
0.9813619, -1.135681, 1.609872, 1, 1, 1, 1, 1,
0.9838709, 0.03962436, 0.1633222, 1, 1, 1, 1, 1,
0.9893357, -0.611518, 2.863899, 1, 1, 1, 1, 1,
0.9895241, -0.1548974, 1.510756, 1, 1, 1, 1, 1,
0.9909172, -1.680538, 3.082586, 1, 1, 1, 1, 1,
0.9978324, 0.07143439, 2.017816, 1, 1, 1, 1, 1,
0.9979757, 0.4800113, 0.9881756, 1, 1, 1, 1, 1,
0.9996527, 1.926321, -0.1414014, 1, 1, 1, 1, 1,
1.005332, -1.253793, 2.199801, 1, 1, 1, 1, 1,
1.010579, 0.2692817, 0.2512361, 1, 1, 1, 1, 1,
1.011946, 0.4094646, 1.138773, 1, 1, 1, 1, 1,
1.012933, 0.5655562, 0.9009998, 0, 0, 1, 1, 1,
1.013128, 0.9486809, -0.7339355, 1, 0, 0, 1, 1,
1.015321, 1.307898, 0.7038544, 1, 0, 0, 1, 1,
1.019579, 0.9873917, 0.770497, 1, 0, 0, 1, 1,
1.02258, 1.219597, -0.9336117, 1, 0, 0, 1, 1,
1.029592, 1.151707, 0.1547886, 1, 0, 0, 1, 1,
1.034726, -2.170053, 2.053914, 0, 0, 0, 1, 1,
1.035019, -0.7478201, 1.926288, 0, 0, 0, 1, 1,
1.036231, 1.296596, 0.1418177, 0, 0, 0, 1, 1,
1.038768, -0.01287172, 0.8254297, 0, 0, 0, 1, 1,
1.050719, -1.568192, 3.079454, 0, 0, 0, 1, 1,
1.051398, 2.201044, 0.6202494, 0, 0, 0, 1, 1,
1.05174, 0.1146728, 2.172223, 0, 0, 0, 1, 1,
1.05543, -0.8030156, 2.59144, 1, 1, 1, 1, 1,
1.060292, 0.05906839, 1.474571, 1, 1, 1, 1, 1,
1.060608, -0.1234106, 2.111966, 1, 1, 1, 1, 1,
1.065263, 0.6143098, 1.264226, 1, 1, 1, 1, 1,
1.06622, -0.1842955, 0.2232853, 1, 1, 1, 1, 1,
1.067789, 0.3547519, -0.3162347, 1, 1, 1, 1, 1,
1.069242, 0.2609901, 2.138106, 1, 1, 1, 1, 1,
1.076081, 0.8166831, 1.854821, 1, 1, 1, 1, 1,
1.090191, 0.8073554, 2.558396, 1, 1, 1, 1, 1,
1.090544, 0.09175069, 1.332283, 1, 1, 1, 1, 1,
1.096017, 1.253051, 3.638963, 1, 1, 1, 1, 1,
1.096226, -0.1745568, 2.309481, 1, 1, 1, 1, 1,
1.096686, -0.08313676, 1.019816, 1, 1, 1, 1, 1,
1.098768, 1.186339, 0.9701076, 1, 1, 1, 1, 1,
1.099174, 0.06308324, 1.70125, 1, 1, 1, 1, 1,
1.103284, 1.731944, -0.2235922, 0, 0, 1, 1, 1,
1.105085, -1.297042, 3.299142, 1, 0, 0, 1, 1,
1.111466, 1.457454, 1.087758, 1, 0, 0, 1, 1,
1.112096, 0.4626335, 1.614807, 1, 0, 0, 1, 1,
1.11414, -0.9874977, 1.529112, 1, 0, 0, 1, 1,
1.114874, 1.505865, -0.03561668, 1, 0, 0, 1, 1,
1.115571, -0.6392907, 2.743135, 0, 0, 0, 1, 1,
1.121407, 2.68902, 1.136996, 0, 0, 0, 1, 1,
1.122772, -0.3315078, 2.470936, 0, 0, 0, 1, 1,
1.12575, -1.02696, 1.848418, 0, 0, 0, 1, 1,
1.134516, -1.001725, 1.658121, 0, 0, 0, 1, 1,
1.154044, -1.301, 2.813479, 0, 0, 0, 1, 1,
1.159405, 0.165613, 1.22639, 0, 0, 0, 1, 1,
1.164509, 0.07026843, 1.190152, 1, 1, 1, 1, 1,
1.168058, 1.103953, 0.202044, 1, 1, 1, 1, 1,
1.168277, 0.5400019, 0.4457114, 1, 1, 1, 1, 1,
1.170665, -0.377914, 1.987275, 1, 1, 1, 1, 1,
1.173382, 0.8552715, -0.2253959, 1, 1, 1, 1, 1,
1.174133, -2.914081, 2.570082, 1, 1, 1, 1, 1,
1.181707, 0.1736002, 2.749881, 1, 1, 1, 1, 1,
1.186232, -0.1266321, 1.813821, 1, 1, 1, 1, 1,
1.188098, -0.03263458, 0.7026479, 1, 1, 1, 1, 1,
1.188797, -0.485061, 1.151294, 1, 1, 1, 1, 1,
1.200549, 1.44124, 1.847686, 1, 1, 1, 1, 1,
1.215818, -0.4575089, 2.796524, 1, 1, 1, 1, 1,
1.216486, 0.8987815, 1.733713, 1, 1, 1, 1, 1,
1.217006, -0.4448515, 0.713391, 1, 1, 1, 1, 1,
1.217215, 0.592973, 0.8342943, 1, 1, 1, 1, 1,
1.230137, -0.4050626, 2.073346, 0, 0, 1, 1, 1,
1.231134, 0.2136628, 1.855962, 1, 0, 0, 1, 1,
1.232833, 0.592875, 1.319449, 1, 0, 0, 1, 1,
1.233375, -0.1361985, 2.892381, 1, 0, 0, 1, 1,
1.241553, -0.8038805, 3.212383, 1, 0, 0, 1, 1,
1.248205, -1.963734, 1.623129, 1, 0, 0, 1, 1,
1.250949, 0.6701056, 1.649508, 0, 0, 0, 1, 1,
1.254537, 0.1151841, 3.063416, 0, 0, 0, 1, 1,
1.261268, 2.697634, 0.6065512, 0, 0, 0, 1, 1,
1.262662, 0.3986764, 1.241989, 0, 0, 0, 1, 1,
1.28026, 0.9778869, 1.770828, 0, 0, 0, 1, 1,
1.283244, 0.5785357, 1.520725, 0, 0, 0, 1, 1,
1.292513, -0.2030828, 3.070583, 0, 0, 0, 1, 1,
1.294933, 1.030998, 0.8689301, 1, 1, 1, 1, 1,
1.295885, 0.3462417, 0.9479339, 1, 1, 1, 1, 1,
1.295936, -0.01059077, 2.432912, 1, 1, 1, 1, 1,
1.296156, -0.2563145, 2.099261, 1, 1, 1, 1, 1,
1.298413, 0.1779521, 2.728393, 1, 1, 1, 1, 1,
1.299639, 0.9357697, 1.551772, 1, 1, 1, 1, 1,
1.303278, -0.9704411, 2.449129, 1, 1, 1, 1, 1,
1.314665, 1.078704, 0.04409034, 1, 1, 1, 1, 1,
1.332341, 1.40279, -0.1458012, 1, 1, 1, 1, 1,
1.350854, 0.1888848, 2.522405, 1, 1, 1, 1, 1,
1.354237, -1.798895, 4.710034, 1, 1, 1, 1, 1,
1.357818, 3.145169, -1.021106, 1, 1, 1, 1, 1,
1.378086, 0.1061142, 1.092046, 1, 1, 1, 1, 1,
1.383754, -0.9456228, 2.695403, 1, 1, 1, 1, 1,
1.385272, 0.3261467, 0.6402685, 1, 1, 1, 1, 1,
1.400979, -1.339148, 4.592664, 0, 0, 1, 1, 1,
1.401326, -0.6655871, 1.769469, 1, 0, 0, 1, 1,
1.407886, 0.3812023, 1.537413, 1, 0, 0, 1, 1,
1.4122, -1.122695, 2.995163, 1, 0, 0, 1, 1,
1.419274, 1.099585, 1.27984, 1, 0, 0, 1, 1,
1.431401, -0.8801682, 1.322486, 1, 0, 0, 1, 1,
1.435555, 0.214751, 2.251878, 0, 0, 0, 1, 1,
1.454005, 1.203352, -0.9887695, 0, 0, 0, 1, 1,
1.460709, 0.1421493, 2.83655, 0, 0, 0, 1, 1,
1.463511, 0.1146383, 1.470367, 0, 0, 0, 1, 1,
1.46469, 0.6436056, 3.220448, 0, 0, 0, 1, 1,
1.465055, 1.298363, 0.4151184, 0, 0, 0, 1, 1,
1.470139, 1.199603, 1.684458, 0, 0, 0, 1, 1,
1.477395, -0.7204696, 1.351303, 1, 1, 1, 1, 1,
1.480525, -0.5127977, 3.739189, 1, 1, 1, 1, 1,
1.484076, 0.7306933, 2.668391, 1, 1, 1, 1, 1,
1.485812, -1.500675, 3.500834, 1, 1, 1, 1, 1,
1.498192, -0.8812763, 1.605783, 1, 1, 1, 1, 1,
1.498703, 1.003949, -0.811322, 1, 1, 1, 1, 1,
1.501104, -0.7904285, 2.116448, 1, 1, 1, 1, 1,
1.505646, 1.028817, -1.148407, 1, 1, 1, 1, 1,
1.517179, 0.5796473, 1.582235, 1, 1, 1, 1, 1,
1.518483, -0.2510373, 2.772013, 1, 1, 1, 1, 1,
1.532194, -0.3280229, 0.3590526, 1, 1, 1, 1, 1,
1.536498, 1.364011, 0.5776211, 1, 1, 1, 1, 1,
1.584605, -0.0573769, 2.654664, 1, 1, 1, 1, 1,
1.607665, 0.2687307, 1.049235, 1, 1, 1, 1, 1,
1.610639, 0.8649654, 1.300485, 1, 1, 1, 1, 1,
1.620071, 1.02394, -1.287182, 0, 0, 1, 1, 1,
1.629478, -0.8461334, 2.189965, 1, 0, 0, 1, 1,
1.648157, -1.761793, 2.035841, 1, 0, 0, 1, 1,
1.651315, 1.222917, 1.714967, 1, 0, 0, 1, 1,
1.666793, 0.2798618, 1.611331, 1, 0, 0, 1, 1,
1.721699, -1.672202, 3.636229, 1, 0, 0, 1, 1,
1.724945, 1.492632, 1.035859, 0, 0, 0, 1, 1,
1.72842, 0.259898, 1.51926, 0, 0, 0, 1, 1,
1.729433, 1.097494, 1.170152, 0, 0, 0, 1, 1,
1.753498, 0.734006, 0.9222974, 0, 0, 0, 1, 1,
1.754256, 1.104567, 0.9324253, 0, 0, 0, 1, 1,
1.764438, 0.1329733, 1.355807, 0, 0, 0, 1, 1,
1.785601, 0.5922091, 0.9437041, 0, 0, 0, 1, 1,
1.788597, 1.819871, -1.160537, 1, 1, 1, 1, 1,
1.80444, 0.8221282, 1.741675, 1, 1, 1, 1, 1,
1.817155, -0.8681532, 1.563753, 1, 1, 1, 1, 1,
1.817205, -0.9007038, 0.8345018, 1, 1, 1, 1, 1,
1.837548, 1.758229, 1.272467, 1, 1, 1, 1, 1,
1.838468, 2.507258, 1.373019, 1, 1, 1, 1, 1,
1.844948, -0.3587717, 2.975493, 1, 1, 1, 1, 1,
1.853402, -0.6233223, 3.180515, 1, 1, 1, 1, 1,
1.860132, 0.6477746, 1.457519, 1, 1, 1, 1, 1,
1.87772, -0.9961221, 2.548796, 1, 1, 1, 1, 1,
1.878804, -0.4511102, 1.626917, 1, 1, 1, 1, 1,
1.880669, 1.119339, 0.534242, 1, 1, 1, 1, 1,
1.928633, 0.2547887, 0.4885573, 1, 1, 1, 1, 1,
1.938963, -0.4084317, 2.596028, 1, 1, 1, 1, 1,
1.960956, -0.04479226, 2.217878, 1, 1, 1, 1, 1,
2.012062, 0.4368357, 3.101551, 0, 0, 1, 1, 1,
2.030052, 0.9205775, 1.366162, 1, 0, 0, 1, 1,
2.033224, -0.5991345, 1.311247, 1, 0, 0, 1, 1,
2.056369, 0.2351664, 2.691155, 1, 0, 0, 1, 1,
2.102907, 1.463714, 0.08869419, 1, 0, 0, 1, 1,
2.103177, 0.7761817, 1.074129, 1, 0, 0, 1, 1,
2.115404, -0.2543003, 2.906796, 0, 0, 0, 1, 1,
2.146682, -1.95469, 2.882256, 0, 0, 0, 1, 1,
2.176538, -2.364245, 1.542022, 0, 0, 0, 1, 1,
2.216101, -0.3311824, 1.824677, 0, 0, 0, 1, 1,
2.220526, -1.37494, 1.516545, 0, 0, 0, 1, 1,
2.302042, 0.240619, 1.860259, 0, 0, 0, 1, 1,
2.357009, 1.89226, 1.853093, 0, 0, 0, 1, 1,
2.401298, -0.1881679, 0.0744658, 1, 1, 1, 1, 1,
2.468098, -0.984596, 1.839905, 1, 1, 1, 1, 1,
2.502645, -0.2903807, 1.806303, 1, 1, 1, 1, 1,
2.54156, 0.7576248, 1.736147, 1, 1, 1, 1, 1,
2.867111, -0.8764225, 2.314079, 1, 1, 1, 1, 1,
3.063579, -0.5986939, 2.049324, 1, 1, 1, 1, 1,
3.176696, 0.436967, 1.291687, 1, 1, 1, 1, 1
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
var radius = 9.19717;
var distance = 32.30467;
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
mvMatrix.translate( 0.07184887, -0.09992397, -0.01297402 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.30467);
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