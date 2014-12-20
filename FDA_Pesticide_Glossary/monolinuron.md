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
-2.967386, -0.2694266, -0.1201093, 1, 0, 0, 1,
-2.88207, -0.4946133, -1.50865, 1, 0.007843138, 0, 1,
-2.816166, -0.8753998, -3.731871, 1, 0.01176471, 0, 1,
-2.73431, -0.4978204, -1.359947, 1, 0.01960784, 0, 1,
-2.700327, 0.6494392, -1.891851, 1, 0.02352941, 0, 1,
-2.629066, -0.6404459, -3.046216, 1, 0.03137255, 0, 1,
-2.557316, 0.6037426, -0.5897592, 1, 0.03529412, 0, 1,
-2.511881, -0.6047447, -2.317101, 1, 0.04313726, 0, 1,
-2.477067, 0.4027492, -0.4232697, 1, 0.04705882, 0, 1,
-2.397815, -0.336888, 0.1927993, 1, 0.05490196, 0, 1,
-2.244359, -0.6528221, -1.383676, 1, 0.05882353, 0, 1,
-2.199613, -0.6647997, -2.116785, 1, 0.06666667, 0, 1,
-2.186312, 0.1564211, -2.911106, 1, 0.07058824, 0, 1,
-2.170614, -2.206494, -3.154425, 1, 0.07843138, 0, 1,
-2.151132, -1.380509, -2.281224, 1, 0.08235294, 0, 1,
-2.138541, 1.153975, -1.656364, 1, 0.09019608, 0, 1,
-2.100389, -0.5408539, -1.377271, 1, 0.09411765, 0, 1,
-2.074415, 1.495176, -3.153881, 1, 0.1019608, 0, 1,
-2.059244, -1.085689, -2.888767, 1, 0.1098039, 0, 1,
-2.054861, 0.5854414, -2.109846, 1, 0.1137255, 0, 1,
-2.050414, -0.1129347, -1.972709, 1, 0.1215686, 0, 1,
-2.04612, 1.080466, 2.445399, 1, 0.1254902, 0, 1,
-2.03351, -0.2140448, 0.01195478, 1, 0.1333333, 0, 1,
-2.022402, -0.8046362, -1.585254, 1, 0.1372549, 0, 1,
-2.016235, -1.471088, -3.156549, 1, 0.145098, 0, 1,
-2.011147, 0.550923, -1.750989, 1, 0.1490196, 0, 1,
-1.99474, 1.237013, -0.7638595, 1, 0.1568628, 0, 1,
-1.994039, -0.3335764, -2.489238, 1, 0.1607843, 0, 1,
-1.984736, -0.3944024, -0.1660863, 1, 0.1686275, 0, 1,
-1.962551, 1.034941, -2.274514, 1, 0.172549, 0, 1,
-1.941795, 1.71606, -1.337361, 1, 0.1803922, 0, 1,
-1.936425, -1.129189, -2.087112, 1, 0.1843137, 0, 1,
-1.92606, 0.2389308, -2.394833, 1, 0.1921569, 0, 1,
-1.912332, 0.3656343, -1.479252, 1, 0.1960784, 0, 1,
-1.909041, 0.4820429, -2.887524, 1, 0.2039216, 0, 1,
-1.891574, -1.072768, -2.4179, 1, 0.2117647, 0, 1,
-1.890233, -1.604446, -2.36856, 1, 0.2156863, 0, 1,
-1.884491, 0.9180076, 0.2398143, 1, 0.2235294, 0, 1,
-1.857953, 0.5554616, -0.180176, 1, 0.227451, 0, 1,
-1.852149, 0.1644072, -2.993867, 1, 0.2352941, 0, 1,
-1.821944, -1.25744, -1.296462, 1, 0.2392157, 0, 1,
-1.814764, -0.7205319, -2.474721, 1, 0.2470588, 0, 1,
-1.805415, -0.05006511, -1.960312, 1, 0.2509804, 0, 1,
-1.767047, -0.2773603, -1.798801, 1, 0.2588235, 0, 1,
-1.752, 0.9529956, 0.7624233, 1, 0.2627451, 0, 1,
-1.751983, 0.1008951, -2.668846, 1, 0.2705882, 0, 1,
-1.750242, 0.8938218, -1.052828, 1, 0.2745098, 0, 1,
-1.734934, 0.5804633, -1.09698, 1, 0.282353, 0, 1,
-1.726087, 0.1847904, -1.136336, 1, 0.2862745, 0, 1,
-1.717587, -0.8503877, -1.36347, 1, 0.2941177, 0, 1,
-1.701545, 0.8078739, -1.319388, 1, 0.3019608, 0, 1,
-1.694376, -1.287555, -1.82854, 1, 0.3058824, 0, 1,
-1.6777, -0.8388916, -2.435006, 1, 0.3137255, 0, 1,
-1.672419, 1.268244, -1.027116, 1, 0.3176471, 0, 1,
-1.63628, -0.13306, -0.06918854, 1, 0.3254902, 0, 1,
-1.631584, 0.2007255, -3.397164, 1, 0.3294118, 0, 1,
-1.624604, 0.605382, 0.2850051, 1, 0.3372549, 0, 1,
-1.613796, -0.2833088, -1.194538, 1, 0.3411765, 0, 1,
-1.601429, -1.240846, -2.938061, 1, 0.3490196, 0, 1,
-1.588851, 0.9550771, -1.869181, 1, 0.3529412, 0, 1,
-1.584101, -2.165842, -2.306646, 1, 0.3607843, 0, 1,
-1.582551, 0.3442329, -2.491837, 1, 0.3647059, 0, 1,
-1.575836, -0.4612849, -1.647964, 1, 0.372549, 0, 1,
-1.531247, 0.7844141, 0.2768465, 1, 0.3764706, 0, 1,
-1.529811, -1.165037, -1.243934, 1, 0.3843137, 0, 1,
-1.524976, -0.5082451, -3.166674, 1, 0.3882353, 0, 1,
-1.522102, -0.3072631, -1.564675, 1, 0.3960784, 0, 1,
-1.519435, 1.371361, -0.3748438, 1, 0.4039216, 0, 1,
-1.51777, -0.2945032, -3.7115, 1, 0.4078431, 0, 1,
-1.504835, -0.2781658, -1.323332, 1, 0.4156863, 0, 1,
-1.496167, 0.8079788, -1.119072, 1, 0.4196078, 0, 1,
-1.456038, 0.3053857, 0.1755375, 1, 0.427451, 0, 1,
-1.443387, -0.936609, -2.987509, 1, 0.4313726, 0, 1,
-1.44254, 0.4348224, -2.486177, 1, 0.4392157, 0, 1,
-1.440345, -0.1523238, -2.065307, 1, 0.4431373, 0, 1,
-1.434086, -0.5662598, -2.818026, 1, 0.4509804, 0, 1,
-1.434032, -0.3710247, -1.358073, 1, 0.454902, 0, 1,
-1.43098, 0.1835089, -1.237383, 1, 0.4627451, 0, 1,
-1.427089, -0.1702087, -0.1762538, 1, 0.4666667, 0, 1,
-1.426487, 2.67166, -2.751849, 1, 0.4745098, 0, 1,
-1.423542, 1.734795, 0.04888796, 1, 0.4784314, 0, 1,
-1.409783, 1.417275, -0.324778, 1, 0.4862745, 0, 1,
-1.40475, -1.07664, -3.150081, 1, 0.4901961, 0, 1,
-1.398854, 0.9977981, -2.572937, 1, 0.4980392, 0, 1,
-1.397209, -0.1833397, -1.840471, 1, 0.5058824, 0, 1,
-1.395756, 0.007397573, -0.1487042, 1, 0.509804, 0, 1,
-1.393057, 0.7412991, -2.528896, 1, 0.5176471, 0, 1,
-1.38803, 1.098052, -0.8595907, 1, 0.5215687, 0, 1,
-1.381663, -1.919717, -1.567339, 1, 0.5294118, 0, 1,
-1.381162, 1.015643, -2.929868, 1, 0.5333334, 0, 1,
-1.380373, -0.5276314, -1.413758, 1, 0.5411765, 0, 1,
-1.374748, 1.659708, -0.4484099, 1, 0.5450981, 0, 1,
-1.366163, 0.2575995, 1.22889, 1, 0.5529412, 0, 1,
-1.366015, -0.270229, -0.7834715, 1, 0.5568628, 0, 1,
-1.362516, 1.049865, -0.1220317, 1, 0.5647059, 0, 1,
-1.348529, -0.9451798, -3.178425, 1, 0.5686275, 0, 1,
-1.348504, -0.2999051, -2.477954, 1, 0.5764706, 0, 1,
-1.345254, -1.527629, -2.856377, 1, 0.5803922, 0, 1,
-1.34122, 2.060506, -0.2510779, 1, 0.5882353, 0, 1,
-1.330743, 0.09929729, -0.9240578, 1, 0.5921569, 0, 1,
-1.325027, -0.09344418, 0.2474258, 1, 0.6, 0, 1,
-1.322261, 1.962147, -0.6138044, 1, 0.6078432, 0, 1,
-1.317131, 0.1942837, -1.030218, 1, 0.6117647, 0, 1,
-1.312134, 0.008192956, -0.5985748, 1, 0.6196079, 0, 1,
-1.308322, 0.6406486, -0.1207881, 1, 0.6235294, 0, 1,
-1.304452, 1.390587, -0.3609911, 1, 0.6313726, 0, 1,
-1.304361, -0.2519805, -0.3461626, 1, 0.6352941, 0, 1,
-1.302526, -0.07504716, -0.5184833, 1, 0.6431373, 0, 1,
-1.300791, 0.9340927, -0.6277122, 1, 0.6470588, 0, 1,
-1.29615, 1.119473, -0.6280096, 1, 0.654902, 0, 1,
-1.287683, -1.175552, -1.369983, 1, 0.6588235, 0, 1,
-1.283564, 0.5989614, -1.688336, 1, 0.6666667, 0, 1,
-1.279532, 0.3367369, -1.794322, 1, 0.6705883, 0, 1,
-1.271459, -1.117702, -2.647485, 1, 0.6784314, 0, 1,
-1.268163, -0.1868421, -2.117674, 1, 0.682353, 0, 1,
-1.265628, 1.457832, -0.06799943, 1, 0.6901961, 0, 1,
-1.263946, -2.164938, -2.913769, 1, 0.6941177, 0, 1,
-1.259792, 0.3703405, 0.06161951, 1, 0.7019608, 0, 1,
-1.259439, -1.577767, -2.191529, 1, 0.7098039, 0, 1,
-1.256905, 0.694584, -1.250143, 1, 0.7137255, 0, 1,
-1.255765, -0.7016186, -2.617722, 1, 0.7215686, 0, 1,
-1.250767, -1.576433, -1.640249, 1, 0.7254902, 0, 1,
-1.2499, -0.2545622, -1.846473, 1, 0.7333333, 0, 1,
-1.245439, 0.097711, -3.159156, 1, 0.7372549, 0, 1,
-1.2451, 1.032099, -1.897198, 1, 0.7450981, 0, 1,
-1.236559, -0.5199232, -2.744255, 1, 0.7490196, 0, 1,
-1.234552, -0.9823858, -0.8531439, 1, 0.7568628, 0, 1,
-1.226771, -0.6455616, -1.753509, 1, 0.7607843, 0, 1,
-1.219547, -0.1927616, -4.430139, 1, 0.7686275, 0, 1,
-1.201427, -0.1028337, -2.063794, 1, 0.772549, 0, 1,
-1.19701, -0.3249317, -1.642478, 1, 0.7803922, 0, 1,
-1.194716, -0.08605707, -2.514895, 1, 0.7843137, 0, 1,
-1.19338, 1.937063, -0.7879671, 1, 0.7921569, 0, 1,
-1.192426, -0.7013819, -1.811106, 1, 0.7960784, 0, 1,
-1.190713, -0.4712907, -0.6605496, 1, 0.8039216, 0, 1,
-1.180761, 0.2965535, -1.987572, 1, 0.8117647, 0, 1,
-1.174646, 1.919902, -0.9726433, 1, 0.8156863, 0, 1,
-1.164645, 1.584767, 0.4424458, 1, 0.8235294, 0, 1,
-1.156215, 2.151328, 0.1685701, 1, 0.827451, 0, 1,
-1.155923, -0.06982744, -2.063066, 1, 0.8352941, 0, 1,
-1.153087, 0.9657634, -1.254053, 1, 0.8392157, 0, 1,
-1.150926, -0.5865789, -1.004949, 1, 0.8470588, 0, 1,
-1.150367, -0.3539685, -3.475132, 1, 0.8509804, 0, 1,
-1.148451, 0.116485, -1.115165, 1, 0.8588235, 0, 1,
-1.139389, -0.5027213, -1.399264, 1, 0.8627451, 0, 1,
-1.137393, -1.448263, -1.785327, 1, 0.8705882, 0, 1,
-1.136144, -2.640934, -1.703, 1, 0.8745098, 0, 1,
-1.132275, 0.2737934, -1.811731, 1, 0.8823529, 0, 1,
-1.118994, -2.182444, -4.505344, 1, 0.8862745, 0, 1,
-1.11857, 1.208719, -1.98442, 1, 0.8941177, 0, 1,
-1.117059, -0.8594158, -1.700395, 1, 0.8980392, 0, 1,
-1.112394, -2.788367, -2.480735, 1, 0.9058824, 0, 1,
-1.100827, -0.2920528, -1.133341, 1, 0.9137255, 0, 1,
-1.096032, -0.2942359, -1.342207, 1, 0.9176471, 0, 1,
-1.073773, 1.306149, -1.622321, 1, 0.9254902, 0, 1,
-1.073716, 0.5348752, -0.398181, 1, 0.9294118, 0, 1,
-1.066978, -0.4832568, -0.638762, 1, 0.9372549, 0, 1,
-1.062729, -0.2750506, -2.450103, 1, 0.9411765, 0, 1,
-1.06121, -0.6402743, -2.36648, 1, 0.9490196, 0, 1,
-1.054849, -1.663679, -1.008028, 1, 0.9529412, 0, 1,
-1.048184, -0.2504603, -3.239855, 1, 0.9607843, 0, 1,
-1.04658, -0.4340859, -2.990211, 1, 0.9647059, 0, 1,
-1.046369, -1.156316, -1.985672, 1, 0.972549, 0, 1,
-1.045551, -0.2217291, -1.327444, 1, 0.9764706, 0, 1,
-1.042195, -0.3379043, -2.236758, 1, 0.9843137, 0, 1,
-1.038615, 0.4271077, -1.660221, 1, 0.9882353, 0, 1,
-1.03081, -1.36727, -1.044692, 1, 0.9960784, 0, 1,
-1.014176, -1.72707, -2.001838, 0.9960784, 1, 0, 1,
-1.012493, 1.155902, -1.390658, 0.9921569, 1, 0, 1,
-1.007111, -0.09286156, -1.28593, 0.9843137, 1, 0, 1,
-1.001284, 0.0531706, -2.952784, 0.9803922, 1, 0, 1,
-1.000656, 1.063765, -0.3764657, 0.972549, 1, 0, 1,
-0.9998104, 2.745208, 1.474671, 0.9686275, 1, 0, 1,
-0.9956698, -0.9664961, -1.786481, 0.9607843, 1, 0, 1,
-0.9898116, -1.402861, -1.689366, 0.9568627, 1, 0, 1,
-0.9882523, 0.02148828, -1.475699, 0.9490196, 1, 0, 1,
-0.9870089, -0.4300694, -3.160132, 0.945098, 1, 0, 1,
-0.9854518, 0.2162324, -0.6541128, 0.9372549, 1, 0, 1,
-0.9843808, -0.1861164, -1.724621, 0.9333333, 1, 0, 1,
-0.9843204, 1.454254, -1.515964, 0.9254902, 1, 0, 1,
-0.9840694, -2.263838, -3.078589, 0.9215686, 1, 0, 1,
-0.9807051, -0.2497715, -2.139522, 0.9137255, 1, 0, 1,
-0.9695278, -1.137109, -2.325312, 0.9098039, 1, 0, 1,
-0.9624752, 0.8938549, -0.5010163, 0.9019608, 1, 0, 1,
-0.9613575, -1.390451, -4.215803, 0.8941177, 1, 0, 1,
-0.9537967, 0.06649657, -2.12764, 0.8901961, 1, 0, 1,
-0.9504395, -0.207561, -1.357903, 0.8823529, 1, 0, 1,
-0.9484556, 0.757939, -0.2562511, 0.8784314, 1, 0, 1,
-0.9393523, 0.8821337, -0.5509794, 0.8705882, 1, 0, 1,
-0.9347149, -0.6206832, -1.488595, 0.8666667, 1, 0, 1,
-0.9299119, 0.6834166, -1.18206, 0.8588235, 1, 0, 1,
-0.923174, -1.027164, -5.162554, 0.854902, 1, 0, 1,
-0.9225478, 0.06117729, -1.448635, 0.8470588, 1, 0, 1,
-0.9142792, -0.5376855, -2.263104, 0.8431373, 1, 0, 1,
-0.9142594, -1.352628, -0.5294019, 0.8352941, 1, 0, 1,
-0.9128435, 0.712905, 1.2728, 0.8313726, 1, 0, 1,
-0.9056069, 1.01209, 0.004331497, 0.8235294, 1, 0, 1,
-0.8993425, 0.4212564, -1.269222, 0.8196079, 1, 0, 1,
-0.8934333, 1.447475, -1.42081, 0.8117647, 1, 0, 1,
-0.8923311, -0.2456658, -2.591173, 0.8078431, 1, 0, 1,
-0.8769967, 0.07069811, -2.453911, 0.8, 1, 0, 1,
-0.8730316, 1.064552, -1.488768, 0.7921569, 1, 0, 1,
-0.870943, 0.4500766, -1.221071, 0.7882353, 1, 0, 1,
-0.8652517, -1.119061, -2.151237, 0.7803922, 1, 0, 1,
-0.8537422, -0.2515907, -1.123661, 0.7764706, 1, 0, 1,
-0.8530712, -0.665253, -1.200228, 0.7686275, 1, 0, 1,
-0.8520072, -1.390761, -1.835928, 0.7647059, 1, 0, 1,
-0.8496743, 0.5719672, -0.9032562, 0.7568628, 1, 0, 1,
-0.842743, 0.8453163, -2.754069, 0.7529412, 1, 0, 1,
-0.8392026, -1.287477, -2.823635, 0.7450981, 1, 0, 1,
-0.8369584, 1.042093, 0.721698, 0.7411765, 1, 0, 1,
-0.8318678, 0.08089961, -1.971211, 0.7333333, 1, 0, 1,
-0.827223, 0.9200348, 0.05569969, 0.7294118, 1, 0, 1,
-0.8271485, 0.04481689, -1.817135, 0.7215686, 1, 0, 1,
-0.8267398, -0.8341777, -0.01539217, 0.7176471, 1, 0, 1,
-0.8255495, 1.284889, 2.019542, 0.7098039, 1, 0, 1,
-0.8238679, 0.1917323, -1.652962, 0.7058824, 1, 0, 1,
-0.8208671, 0.2536712, -1.982081, 0.6980392, 1, 0, 1,
-0.8189935, -1.183854, -0.8153605, 0.6901961, 1, 0, 1,
-0.8155668, -2.183727, -1.189963, 0.6862745, 1, 0, 1,
-0.8143754, 0.123385, -2.204736, 0.6784314, 1, 0, 1,
-0.8093945, -1.636666, -2.31041, 0.6745098, 1, 0, 1,
-0.8060799, 0.5584733, -2.005109, 0.6666667, 1, 0, 1,
-0.8026862, 0.5678523, -0.4171963, 0.6627451, 1, 0, 1,
-0.797861, 0.8233997, -1.416917, 0.654902, 1, 0, 1,
-0.7938038, -0.3364201, -1.058723, 0.6509804, 1, 0, 1,
-0.7920283, 0.25937, -1.354189, 0.6431373, 1, 0, 1,
-0.7836714, -0.2031883, -0.5840364, 0.6392157, 1, 0, 1,
-0.7828409, -1.272593, -3.342516, 0.6313726, 1, 0, 1,
-0.7813824, -1.225829, -3.155592, 0.627451, 1, 0, 1,
-0.7764977, -0.1719918, -0.6879206, 0.6196079, 1, 0, 1,
-0.7758244, -0.09951911, -3.658329, 0.6156863, 1, 0, 1,
-0.774656, 1.944571, -0.7731809, 0.6078432, 1, 0, 1,
-0.7721701, -1.662811, -1.483426, 0.6039216, 1, 0, 1,
-0.7702165, 1.030499, -1.183, 0.5960785, 1, 0, 1,
-0.7691213, 0.2822195, 0.2571786, 0.5882353, 1, 0, 1,
-0.7665148, 0.8252551, -0.331141, 0.5843138, 1, 0, 1,
-0.76048, -0.2707873, -0.002506893, 0.5764706, 1, 0, 1,
-0.7568123, 0.6928024, 0.1681109, 0.572549, 1, 0, 1,
-0.7539039, -0.7458372, -3.163816, 0.5647059, 1, 0, 1,
-0.7536507, -1.756117, -3.999018, 0.5607843, 1, 0, 1,
-0.7532209, 0.32358, -0.8727216, 0.5529412, 1, 0, 1,
-0.7473643, 0.03254236, -2.393104, 0.5490196, 1, 0, 1,
-0.7410837, -0.6895267, -0.1171667, 0.5411765, 1, 0, 1,
-0.738055, -1.162165, -4.930097, 0.5372549, 1, 0, 1,
-0.736908, 0.1612744, -2.072758, 0.5294118, 1, 0, 1,
-0.7333348, 0.1643026, -1.868341, 0.5254902, 1, 0, 1,
-0.731971, -1.417489, -2.19321, 0.5176471, 1, 0, 1,
-0.7243785, 0.1255253, -0.386974, 0.5137255, 1, 0, 1,
-0.7159052, 0.4134334, -1.485271, 0.5058824, 1, 0, 1,
-0.7155762, 0.4102677, -2.344816, 0.5019608, 1, 0, 1,
-0.7154688, -1.008599, -2.67229, 0.4941176, 1, 0, 1,
-0.7152812, -0.2396657, -1.367897, 0.4862745, 1, 0, 1,
-0.714923, 0.7064372, -0.1188005, 0.4823529, 1, 0, 1,
-0.7129803, -1.178118, -2.901668, 0.4745098, 1, 0, 1,
-0.7113755, 0.333671, -2.298382, 0.4705882, 1, 0, 1,
-0.7110475, -0.654008, -0.4656651, 0.4627451, 1, 0, 1,
-0.7017673, 0.9357972, -0.8355724, 0.4588235, 1, 0, 1,
-0.7013612, -0.4564303, -2.554057, 0.4509804, 1, 0, 1,
-0.7005818, -0.576501, -2.597422, 0.4470588, 1, 0, 1,
-0.6968552, 1.035531, 0.4662453, 0.4392157, 1, 0, 1,
-0.692809, 0.04311488, -0.5448883, 0.4352941, 1, 0, 1,
-0.6926008, 1.478201, -1.931835, 0.427451, 1, 0, 1,
-0.6924696, -0.5474403, -3.384407, 0.4235294, 1, 0, 1,
-0.6917555, -0.7607623, -0.9867509, 0.4156863, 1, 0, 1,
-0.6895151, 0.6926296, -1.451174, 0.4117647, 1, 0, 1,
-0.6882879, 1.615361, -0.6073944, 0.4039216, 1, 0, 1,
-0.6842053, 0.1115062, -1.288522, 0.3960784, 1, 0, 1,
-0.682838, 1.089484, -0.5496669, 0.3921569, 1, 0, 1,
-0.6754114, -0.3759897, -3.173741, 0.3843137, 1, 0, 1,
-0.6707332, -0.7678662, -3.204387, 0.3803922, 1, 0, 1,
-0.6688592, -1.159081, -4.065334, 0.372549, 1, 0, 1,
-0.6672307, 0.06199115, -1.824452, 0.3686275, 1, 0, 1,
-0.660319, 1.200719, -0.662493, 0.3607843, 1, 0, 1,
-0.6551893, -0.5935397, -1.230385, 0.3568628, 1, 0, 1,
-0.6537762, -1.930928, -2.088531, 0.3490196, 1, 0, 1,
-0.6485461, -1.442604, -4.508339, 0.345098, 1, 0, 1,
-0.6462091, 0.4955939, -1.038655, 0.3372549, 1, 0, 1,
-0.6449716, -0.7279108, -2.319725, 0.3333333, 1, 0, 1,
-0.6394024, 1.384822, 1.053477, 0.3254902, 1, 0, 1,
-0.6389564, -1.843447, -1.526789, 0.3215686, 1, 0, 1,
-0.6369073, 0.2228693, -0.5028908, 0.3137255, 1, 0, 1,
-0.6355405, -0.4334959, -1.7613, 0.3098039, 1, 0, 1,
-0.6339954, -0.8569878, -2.97588, 0.3019608, 1, 0, 1,
-0.6284114, -0.3277046, -2.325254, 0.2941177, 1, 0, 1,
-0.6257118, 0.1595889, -2.821602, 0.2901961, 1, 0, 1,
-0.6155922, 0.583787, -1.404555, 0.282353, 1, 0, 1,
-0.6147788, -1.183102, -2.350789, 0.2784314, 1, 0, 1,
-0.6141335, -1.036949, -2.065541, 0.2705882, 1, 0, 1,
-0.6063414, -0.04714684, -1.27298, 0.2666667, 1, 0, 1,
-0.6046821, -1.257884, -2.547877, 0.2588235, 1, 0, 1,
-0.6046048, 0.5359346, -1.591567, 0.254902, 1, 0, 1,
-0.6030329, -0.6241044, -2.883874, 0.2470588, 1, 0, 1,
-0.6030256, -0.1841423, -1.479382, 0.2431373, 1, 0, 1,
-0.6028244, -0.6269097, -2.548048, 0.2352941, 1, 0, 1,
-0.6023528, -1.090468, -1.27479, 0.2313726, 1, 0, 1,
-0.6023412, 1.241907, -0.01377982, 0.2235294, 1, 0, 1,
-0.5997002, -0.7149096, -2.76668, 0.2196078, 1, 0, 1,
-0.5967085, -1.295929, -0.4476245, 0.2117647, 1, 0, 1,
-0.594138, 0.4955576, -0.9664114, 0.2078431, 1, 0, 1,
-0.5935254, 0.9277855, 0.110424, 0.2, 1, 0, 1,
-0.5915799, -0.1654964, -4.015222, 0.1921569, 1, 0, 1,
-0.5830808, 0.5462942, 0.1945134, 0.1882353, 1, 0, 1,
-0.5824876, -0.8444995, -2.453292, 0.1803922, 1, 0, 1,
-0.5772654, -0.3830661, -1.447328, 0.1764706, 1, 0, 1,
-0.5764194, 0.3535326, -0.5365033, 0.1686275, 1, 0, 1,
-0.5747734, -0.6268066, -3.126849, 0.1647059, 1, 0, 1,
-0.5726879, 0.5856401, -0.2377074, 0.1568628, 1, 0, 1,
-0.572539, -0.8678762, -3.253391, 0.1529412, 1, 0, 1,
-0.5661646, 0.3095556, -1.211691, 0.145098, 1, 0, 1,
-0.5618022, 0.001990655, -1.400367, 0.1411765, 1, 0, 1,
-0.5612118, -0.4984522, -3.869726, 0.1333333, 1, 0, 1,
-0.5567849, 0.1643518, -0.9842655, 0.1294118, 1, 0, 1,
-0.5554868, -0.1263512, -2.991318, 0.1215686, 1, 0, 1,
-0.5525795, -0.8021764, 0.3768493, 0.1176471, 1, 0, 1,
-0.5512069, 0.7095975, -1.192859, 0.1098039, 1, 0, 1,
-0.5478898, -0.1895728, -3.586767, 0.1058824, 1, 0, 1,
-0.542443, -1.435399, -3.112992, 0.09803922, 1, 0, 1,
-0.5397389, 0.8228965, 0.1633576, 0.09019608, 1, 0, 1,
-0.539519, 0.373152, -1.029848, 0.08627451, 1, 0, 1,
-0.5337785, 1.060686, -0.4921132, 0.07843138, 1, 0, 1,
-0.5272336, 2.017065, -0.810468, 0.07450981, 1, 0, 1,
-0.5268152, -1.094361, -3.506656, 0.06666667, 1, 0, 1,
-0.5246264, -0.3145161, -2.074874, 0.0627451, 1, 0, 1,
-0.522924, -1.186401, -3.907693, 0.05490196, 1, 0, 1,
-0.5216462, 0.714835, 1.933095, 0.05098039, 1, 0, 1,
-0.5187605, -0.9632472, -3.193515, 0.04313726, 1, 0, 1,
-0.5169298, -0.45836, -2.078361, 0.03921569, 1, 0, 1,
-0.5163975, 0.3375154, -0.4252699, 0.03137255, 1, 0, 1,
-0.5163298, -0.4354461, -1.995704, 0.02745098, 1, 0, 1,
-0.5128677, 0.908752, -0.8175216, 0.01960784, 1, 0, 1,
-0.5078862, -0.2378944, -3.039624, 0.01568628, 1, 0, 1,
-0.5076542, -0.5515823, -0.8023087, 0.007843138, 1, 0, 1,
-0.5058628, -0.1098519, -0.9569072, 0.003921569, 1, 0, 1,
-0.5012491, -1.909937, -2.761047, 0, 1, 0.003921569, 1,
-0.4986395, 0.1921632, -0.4532297, 0, 1, 0.01176471, 1,
-0.4967771, -1.861399, -4.76463, 0, 1, 0.01568628, 1,
-0.4959963, 2.451688, 0.1985813, 0, 1, 0.02352941, 1,
-0.4936006, 0.6571556, -0.1018533, 0, 1, 0.02745098, 1,
-0.4900734, -0.7234818, -0.9012851, 0, 1, 0.03529412, 1,
-0.4843138, -0.1004011, -2.43786, 0, 1, 0.03921569, 1,
-0.4836572, 0.3834997, -0.6227698, 0, 1, 0.04705882, 1,
-0.4834765, 0.4657648, 1.205787, 0, 1, 0.05098039, 1,
-0.4826442, -0.176509, -2.575036, 0, 1, 0.05882353, 1,
-0.4826332, -0.2881851, 0.0885259, 0, 1, 0.0627451, 1,
-0.4800455, -1.909613, -1.104092, 0, 1, 0.07058824, 1,
-0.4776759, -1.648637, -3.102279, 0, 1, 0.07450981, 1,
-0.4762287, 0.2332059, 0.2288176, 0, 1, 0.08235294, 1,
-0.4684156, -1.352447, -3.014996, 0, 1, 0.08627451, 1,
-0.4681693, -0.2358169, -1.246726, 0, 1, 0.09411765, 1,
-0.4667543, -0.5555354, -5.081179, 0, 1, 0.1019608, 1,
-0.4629755, 1.905663, -1.088725, 0, 1, 0.1058824, 1,
-0.457163, -0.4030316, -1.783521, 0, 1, 0.1137255, 1,
-0.4465462, 0.3689696, -0.8624631, 0, 1, 0.1176471, 1,
-0.4376422, 0.1219011, -1.520479, 0, 1, 0.1254902, 1,
-0.4369958, 2.373977, 0.01557689, 0, 1, 0.1294118, 1,
-0.4328203, 0.347733, -1.111281, 0, 1, 0.1372549, 1,
-0.4320079, 0.00217752, -3.485006, 0, 1, 0.1411765, 1,
-0.4308769, 0.07992084, -1.811126, 0, 1, 0.1490196, 1,
-0.4300861, 1.290262, -1.654925, 0, 1, 0.1529412, 1,
-0.4273335, 2.627308, -1.516009, 0, 1, 0.1607843, 1,
-0.4244243, 0.8142591, -1.738411, 0, 1, 0.1647059, 1,
-0.4237016, -1.657241, -3.159439, 0, 1, 0.172549, 1,
-0.4231264, 0.7031559, -0.460962, 0, 1, 0.1764706, 1,
-0.4197551, 0.5729197, -1.353123, 0, 1, 0.1843137, 1,
-0.4183114, 1.290787, -0.8867372, 0, 1, 0.1882353, 1,
-0.4152731, 1.403684, 0.2303761, 0, 1, 0.1960784, 1,
-0.4141365, -0.02669274, -1.976507, 0, 1, 0.2039216, 1,
-0.4120727, 0.4717082, -0.5096275, 0, 1, 0.2078431, 1,
-0.4110874, 1.28428, -0.5362387, 0, 1, 0.2156863, 1,
-0.4107086, -0.6130011, -3.360165, 0, 1, 0.2196078, 1,
-0.4068165, 0.910426, -1.776483, 0, 1, 0.227451, 1,
-0.4038478, 1.60384, 0.8290615, 0, 1, 0.2313726, 1,
-0.4001594, 0.4914777, -0.4924783, 0, 1, 0.2392157, 1,
-0.3966329, -0.7845678, -3.542344, 0, 1, 0.2431373, 1,
-0.3898201, 0.3711858, -0.8563686, 0, 1, 0.2509804, 1,
-0.3892243, 0.01677777, -1.620579, 0, 1, 0.254902, 1,
-0.3848857, 0.3563782, -0.3135683, 0, 1, 0.2627451, 1,
-0.384563, 0.02554874, 1.359809, 0, 1, 0.2666667, 1,
-0.3830487, -0.6647849, -2.506781, 0, 1, 0.2745098, 1,
-0.3801299, -0.01123601, -2.436034, 0, 1, 0.2784314, 1,
-0.3746119, -0.1639438, -1.343519, 0, 1, 0.2862745, 1,
-0.3743412, -0.3970656, -2.067883, 0, 1, 0.2901961, 1,
-0.3721375, 0.01061432, -2.184682, 0, 1, 0.2980392, 1,
-0.3697647, -0.4161312, -2.986228, 0, 1, 0.3058824, 1,
-0.369691, -1.238796, -2.947927, 0, 1, 0.3098039, 1,
-0.3676646, 0.3314252, -0.02287733, 0, 1, 0.3176471, 1,
-0.3664414, 0.9193408, 0.2164912, 0, 1, 0.3215686, 1,
-0.3662573, -1.110088, -3.441216, 0, 1, 0.3294118, 1,
-0.3658526, -0.2056778, -2.151443, 0, 1, 0.3333333, 1,
-0.3643154, -1.56429, -1.709898, 0, 1, 0.3411765, 1,
-0.3637639, 0.2647636, -1.997632, 0, 1, 0.345098, 1,
-0.3633859, -1.44814, -1.732891, 0, 1, 0.3529412, 1,
-0.3616628, -1.390726, -3.181638, 0, 1, 0.3568628, 1,
-0.3611888, 1.336107, -0.3618646, 0, 1, 0.3647059, 1,
-0.3605186, -0.1170783, -2.009292, 0, 1, 0.3686275, 1,
-0.3556542, 1.167964, -2.420616, 0, 1, 0.3764706, 1,
-0.3535976, 1.262967, -0.9658948, 0, 1, 0.3803922, 1,
-0.3490892, -1.284566, -3.833849, 0, 1, 0.3882353, 1,
-0.3441283, 0.3516723, -0.8742999, 0, 1, 0.3921569, 1,
-0.3430833, 0.4235064, -1.516271, 0, 1, 0.4, 1,
-0.3407294, -1.650331, -2.954211, 0, 1, 0.4078431, 1,
-0.3366846, 0.4666159, 0.7442614, 0, 1, 0.4117647, 1,
-0.3366063, -0.4216893, -4.222231, 0, 1, 0.4196078, 1,
-0.3326662, 1.135896, -1.765944, 0, 1, 0.4235294, 1,
-0.326979, 0.3273661, -1.732889, 0, 1, 0.4313726, 1,
-0.3110447, 0.004427352, -1.606235, 0, 1, 0.4352941, 1,
-0.3092559, -0.1814328, -2.111554, 0, 1, 0.4431373, 1,
-0.3029333, 0.2500931, 0.02358188, 0, 1, 0.4470588, 1,
-0.2912385, 1.164534, 0.4221622, 0, 1, 0.454902, 1,
-0.2877933, 1.340631, -1.053024, 0, 1, 0.4588235, 1,
-0.2812625, -0.3366239, -2.446082, 0, 1, 0.4666667, 1,
-0.2711631, 1.416746, -1.943986, 0, 1, 0.4705882, 1,
-0.2707787, 0.8126853, -0.2823583, 0, 1, 0.4784314, 1,
-0.2606009, -1.137487, -3.645786, 0, 1, 0.4823529, 1,
-0.2601624, -0.7992293, -2.90466, 0, 1, 0.4901961, 1,
-0.2577635, -0.1495058, -1.198473, 0, 1, 0.4941176, 1,
-0.2534672, -1.791889, -3.11835, 0, 1, 0.5019608, 1,
-0.2512501, 2.193548, 0.3276108, 0, 1, 0.509804, 1,
-0.2508051, -0.4322777, -2.978631, 0, 1, 0.5137255, 1,
-0.2500549, 1.442539, -0.2026288, 0, 1, 0.5215687, 1,
-0.2482141, 1.76863, -0.608754, 0, 1, 0.5254902, 1,
-0.2464847, -0.2077045, -0.01942898, 0, 1, 0.5333334, 1,
-0.2435623, 0.09559857, -2.279453, 0, 1, 0.5372549, 1,
-0.2424198, 1.012672, -1.292812, 0, 1, 0.5450981, 1,
-0.2424021, -0.4412689, -2.555138, 0, 1, 0.5490196, 1,
-0.2373083, -0.7954484, -3.110997, 0, 1, 0.5568628, 1,
-0.2339362, 0.6765128, -0.3708995, 0, 1, 0.5607843, 1,
-0.2307568, 0.2427318, 0.08826717, 0, 1, 0.5686275, 1,
-0.2195049, 0.13739, -2.789096, 0, 1, 0.572549, 1,
-0.2182869, -0.5539117, -5.142069, 0, 1, 0.5803922, 1,
-0.2160404, 2.153356, -1.328879, 0, 1, 0.5843138, 1,
-0.2110883, -0.6668401, -2.244693, 0, 1, 0.5921569, 1,
-0.2086642, -0.1701597, -1.193861, 0, 1, 0.5960785, 1,
-0.2079617, 0.750342, -0.1156201, 0, 1, 0.6039216, 1,
-0.2075656, 1.051491, -1.04677, 0, 1, 0.6117647, 1,
-0.2070947, 0.6714808, -0.07041273, 0, 1, 0.6156863, 1,
-0.2017843, -1.058231, -2.189131, 0, 1, 0.6235294, 1,
-0.1909352, -1.279311, -3.951654, 0, 1, 0.627451, 1,
-0.1888344, 0.8585761, -1.296764, 0, 1, 0.6352941, 1,
-0.1883392, -0.7195632, -4.662476, 0, 1, 0.6392157, 1,
-0.1870814, -0.6166039, -4.481399, 0, 1, 0.6470588, 1,
-0.1856991, 2.148579, -0.2449615, 0, 1, 0.6509804, 1,
-0.1848198, -0.6786536, -3.590149, 0, 1, 0.6588235, 1,
-0.1843285, 0.5570948, -1.096833, 0, 1, 0.6627451, 1,
-0.1791038, -0.1140197, -3.504634, 0, 1, 0.6705883, 1,
-0.1788046, -0.1123214, -1.440334, 0, 1, 0.6745098, 1,
-0.1784806, -0.9003093, -3.089297, 0, 1, 0.682353, 1,
-0.1601318, -0.4125153, -2.174007, 0, 1, 0.6862745, 1,
-0.1555579, -1.155731, -4.836565, 0, 1, 0.6941177, 1,
-0.1508214, -0.325368, -2.381486, 0, 1, 0.7019608, 1,
-0.1485135, -1.003003, -2.841537, 0, 1, 0.7058824, 1,
-0.1483663, -0.1577184, -2.427711, 0, 1, 0.7137255, 1,
-0.1330034, 1.21462, 0.4289049, 0, 1, 0.7176471, 1,
-0.1316529, -0.367546, -1.583969, 0, 1, 0.7254902, 1,
-0.1312316, 0.7679613, -3.166019, 0, 1, 0.7294118, 1,
-0.1303859, 1.679048, -0.7992821, 0, 1, 0.7372549, 1,
-0.1301012, -1.530645, -3.872958, 0, 1, 0.7411765, 1,
-0.1260607, 1.647854, -0.2274403, 0, 1, 0.7490196, 1,
-0.1250174, -0.276003, -2.377856, 0, 1, 0.7529412, 1,
-0.1149071, -0.6020897, -3.470195, 0, 1, 0.7607843, 1,
-0.105734, 1.814317, -0.2601392, 0, 1, 0.7647059, 1,
-0.1040861, -0.22461, -1.683947, 0, 1, 0.772549, 1,
-0.1031979, 1.719643, 0.7721598, 0, 1, 0.7764706, 1,
-0.1012798, -0.5684001, -2.265195, 0, 1, 0.7843137, 1,
-0.09783585, 0.6045932, 1.320835, 0, 1, 0.7882353, 1,
-0.09352745, 1.035051, 1.500853, 0, 1, 0.7960784, 1,
-0.08716376, -0.3792507, -2.23206, 0, 1, 0.8039216, 1,
-0.08572621, 1.356377, -1.145983, 0, 1, 0.8078431, 1,
-0.08487312, 0.1159325, -0.791108, 0, 1, 0.8156863, 1,
-0.08352236, 0.5658213, -0.06298058, 0, 1, 0.8196079, 1,
-0.0797427, 2.349997, -0.4886428, 0, 1, 0.827451, 1,
-0.07955321, -0.2468804, -2.094499, 0, 1, 0.8313726, 1,
-0.07793202, 0.7229243, 0.9146882, 0, 1, 0.8392157, 1,
-0.07764815, -0.8135492, -1.954713, 0, 1, 0.8431373, 1,
-0.07314036, 0.3550675, -0.3789518, 0, 1, 0.8509804, 1,
-0.07221451, 1.792094, -1.721321, 0, 1, 0.854902, 1,
-0.06974475, 0.5969132, 0.2442265, 0, 1, 0.8627451, 1,
-0.05746228, -0.4879534, -3.216688, 0, 1, 0.8666667, 1,
-0.05284009, -0.281215, -1.894671, 0, 1, 0.8745098, 1,
-0.05057573, -0.4660994, -2.744855, 0, 1, 0.8784314, 1,
-0.04939109, 0.7675958, -0.1164453, 0, 1, 0.8862745, 1,
-0.04575739, -0.2801199, -3.857501, 0, 1, 0.8901961, 1,
-0.04309131, -0.5660887, -3.487785, 0, 1, 0.8980392, 1,
-0.04147318, 1.05407, -1.058745, 0, 1, 0.9058824, 1,
-0.03849545, 1.957567, 2.043606, 0, 1, 0.9098039, 1,
-0.03744896, 0.9678078, -1.896645, 0, 1, 0.9176471, 1,
-0.0369435, 1.036047, -1.484608, 0, 1, 0.9215686, 1,
-0.03498969, 0.07879417, -1.057144, 0, 1, 0.9294118, 1,
-0.03485413, 1.256518, -1.454322, 0, 1, 0.9333333, 1,
-0.03479154, -0.2990187, -2.107489, 0, 1, 0.9411765, 1,
-0.03165573, 0.02195747, -1.11606, 0, 1, 0.945098, 1,
-0.02768647, -0.1143526, -4.39021, 0, 1, 0.9529412, 1,
-0.02717576, 0.6663843, -0.2348621, 0, 1, 0.9568627, 1,
-0.02450247, 0.3199622, 1.727536, 0, 1, 0.9647059, 1,
-0.02440109, 0.9414976, -1.395037, 0, 1, 0.9686275, 1,
-0.02031297, 0.9818979, 0.9825997, 0, 1, 0.9764706, 1,
-0.01826716, -1.872097, -5.330325, 0, 1, 0.9803922, 1,
-0.01748369, -0.3499814, -1.846241, 0, 1, 0.9882353, 1,
-0.01742646, -1.180905, -2.568604, 0, 1, 0.9921569, 1,
-0.01585889, -0.9978811, -3.470935, 0, 1, 1, 1,
-0.01345388, -1.134133, -3.014466, 0, 0.9921569, 1, 1,
-0.01251014, 2.374095, -0.2465234, 0, 0.9882353, 1, 1,
-0.01076847, -0.5329825, -2.900489, 0, 0.9803922, 1, 1,
-0.009072923, -0.848704, -0.9051846, 0, 0.9764706, 1, 1,
-0.008834846, 0.6148085, 0.1617308, 0, 0.9686275, 1, 1,
-0.007247371, -0.01148855, -2.311388, 0, 0.9647059, 1, 1,
-0.004872013, -0.8785139, -3.475074, 0, 0.9568627, 1, 1,
-0.002323385, 1.290425, -1.397933, 0, 0.9529412, 1, 1,
-0.001243382, -0.5388238, -1.983909, 0, 0.945098, 1, 1,
-0.0009986118, 0.9343718, -2.450696, 0, 0.9411765, 1, 1,
0.001739884, -0.1659767, 3.225058, 0, 0.9333333, 1, 1,
0.008580126, -0.4460327, 4.016994, 0, 0.9294118, 1, 1,
0.01250268, -0.3952635, 3.125623, 0, 0.9215686, 1, 1,
0.01270037, 1.045171, -0.8892896, 0, 0.9176471, 1, 1,
0.01444463, 0.6740489, 0.3481926, 0, 0.9098039, 1, 1,
0.0153252, 0.9852588, -0.03866835, 0, 0.9058824, 1, 1,
0.02187904, -0.2146392, 4.585117, 0, 0.8980392, 1, 1,
0.022743, -1.621901, 1.609652, 0, 0.8901961, 1, 1,
0.02447468, 1.551476, 1.021802, 0, 0.8862745, 1, 1,
0.02914655, 0.971829, 0.07488102, 0, 0.8784314, 1, 1,
0.03066207, -1.253802, 1.889213, 0, 0.8745098, 1, 1,
0.03418475, -0.1793027, 2.967504, 0, 0.8666667, 1, 1,
0.03465175, -0.7890732, 3.080201, 0, 0.8627451, 1, 1,
0.03556611, 1.19933, -1.153199, 0, 0.854902, 1, 1,
0.03621356, -0.1374564, 1.657398, 0, 0.8509804, 1, 1,
0.03720237, -0.4167875, 1.028267, 0, 0.8431373, 1, 1,
0.0408137, 1.085208, -1.822509, 0, 0.8392157, 1, 1,
0.0425758, 1.16353, -1.637726, 0, 0.8313726, 1, 1,
0.04273432, -0.7747194, 3.303398, 0, 0.827451, 1, 1,
0.04328944, 0.6813399, -0.2299424, 0, 0.8196079, 1, 1,
0.05177002, -1.589797, 2.384237, 0, 0.8156863, 1, 1,
0.06217292, 0.5791334, 0.5999599, 0, 0.8078431, 1, 1,
0.06319181, -0.4900494, 2.345071, 0, 0.8039216, 1, 1,
0.06553399, -1.380877, 4.018183, 0, 0.7960784, 1, 1,
0.06594529, 0.9486734, -1.94581, 0, 0.7882353, 1, 1,
0.06735357, 0.7900304, 1.641776, 0, 0.7843137, 1, 1,
0.0684589, 0.8378949, 0.2497557, 0, 0.7764706, 1, 1,
0.06895822, 0.2347496, -0.6801276, 0, 0.772549, 1, 1,
0.07009879, 1.908375, -0.5342128, 0, 0.7647059, 1, 1,
0.07214756, 0.7363361, 1.107578, 0, 0.7607843, 1, 1,
0.07424784, 0.251504, 2.192887, 0, 0.7529412, 1, 1,
0.07686941, 0.0459863, 1.747673, 0, 0.7490196, 1, 1,
0.08353571, 0.5148324, -0.9174086, 0, 0.7411765, 1, 1,
0.08643619, -1.95586, 2.157344, 0, 0.7372549, 1, 1,
0.08791655, 0.5874594, -0.07021371, 0, 0.7294118, 1, 1,
0.08933015, -0.01465268, 0.6386312, 0, 0.7254902, 1, 1,
0.09252183, -1.36707, 1.489971, 0, 0.7176471, 1, 1,
0.1011351, -0.6740581, 2.787438, 0, 0.7137255, 1, 1,
0.1043653, 1.309762, 0.3466716, 0, 0.7058824, 1, 1,
0.1046881, 0.4723921, -1.491519, 0, 0.6980392, 1, 1,
0.1076202, -0.7107636, 2.759055, 0, 0.6941177, 1, 1,
0.1096399, -1.480106, 2.523139, 0, 0.6862745, 1, 1,
0.113743, -1.226985, 2.327973, 0, 0.682353, 1, 1,
0.1142917, 0.8383958, 0.1475123, 0, 0.6745098, 1, 1,
0.1149728, -1.348626, 3.473405, 0, 0.6705883, 1, 1,
0.1150969, 0.08078706, 1.267612, 0, 0.6627451, 1, 1,
0.1168006, -1.836604, 2.09182, 0, 0.6588235, 1, 1,
0.1168171, -0.2397023, 2.78245, 0, 0.6509804, 1, 1,
0.1177057, -1.462612, 3.664846, 0, 0.6470588, 1, 1,
0.1181497, -0.4498458, 4.574229, 0, 0.6392157, 1, 1,
0.1236297, 0.4673716, -0.09781337, 0, 0.6352941, 1, 1,
0.1253133, -1.916115, 3.746066, 0, 0.627451, 1, 1,
0.1261839, 0.1813227, 1.414438, 0, 0.6235294, 1, 1,
0.1430223, 0.3496059, -2.25037, 0, 0.6156863, 1, 1,
0.1493892, 0.6727755, 1.014743, 0, 0.6117647, 1, 1,
0.1494252, -0.8875027, 1.935628, 0, 0.6039216, 1, 1,
0.1525722, 0.01739599, 2.127335, 0, 0.5960785, 1, 1,
0.1574397, -0.3357445, 1.617569, 0, 0.5921569, 1, 1,
0.1576296, -1.429781, 1.600105, 0, 0.5843138, 1, 1,
0.1596724, 0.2059525, 0.63333, 0, 0.5803922, 1, 1,
0.1606759, 0.7132779, 0.1511784, 0, 0.572549, 1, 1,
0.16142, 0.488093, -0.7170579, 0, 0.5686275, 1, 1,
0.1671102, -0.3194641, 1.477525, 0, 0.5607843, 1, 1,
0.1711789, 1.396089, 3.622484, 0, 0.5568628, 1, 1,
0.1779187, -0.08520997, 2.822898, 0, 0.5490196, 1, 1,
0.1833521, 0.9344904, 0.9018735, 0, 0.5450981, 1, 1,
0.1870887, -0.839591, 3.291681, 0, 0.5372549, 1, 1,
0.1885473, -0.2927726, 0.8226995, 0, 0.5333334, 1, 1,
0.1899669, 0.1298893, 0.5416146, 0, 0.5254902, 1, 1,
0.1912974, 1.465212, -1.539844, 0, 0.5215687, 1, 1,
0.1954555, 0.3975852, 1.318072, 0, 0.5137255, 1, 1,
0.1981899, -0.9809136, 3.174364, 0, 0.509804, 1, 1,
0.1992536, -1.099066, 3.280666, 0, 0.5019608, 1, 1,
0.1996146, 0.1532431, -0.7423612, 0, 0.4941176, 1, 1,
0.2004272, -1.849371, 1.376173, 0, 0.4901961, 1, 1,
0.2024663, 0.5400687, 0.7412229, 0, 0.4823529, 1, 1,
0.20257, 0.7884388, 0.4899854, 0, 0.4784314, 1, 1,
0.2043038, -0.5872234, 2.832232, 0, 0.4705882, 1, 1,
0.207262, 0.7212636, 0.4320081, 0, 0.4666667, 1, 1,
0.2099632, -0.3347011, 3.015106, 0, 0.4588235, 1, 1,
0.2110806, -0.8326142, 2.882929, 0, 0.454902, 1, 1,
0.2171065, -0.09999827, 2.605873, 0, 0.4470588, 1, 1,
0.2196801, -0.139033, 1.611307, 0, 0.4431373, 1, 1,
0.225079, 0.9199945, 1.598605, 0, 0.4352941, 1, 1,
0.2295511, -0.914494, 4.348273, 0, 0.4313726, 1, 1,
0.2299342, 0.5333313, 1.005902, 0, 0.4235294, 1, 1,
0.2312687, 1.567574, -1.166397, 0, 0.4196078, 1, 1,
0.2353492, -1.411127, 3.89394, 0, 0.4117647, 1, 1,
0.2360279, -0.4806826, 1.511535, 0, 0.4078431, 1, 1,
0.2363438, 0.9934611, -1.758832, 0, 0.4, 1, 1,
0.2375796, 0.5052263, 2.890109, 0, 0.3921569, 1, 1,
0.240948, -0.4160981, 1.935586, 0, 0.3882353, 1, 1,
0.2427844, -0.4100862, 1.421652, 0, 0.3803922, 1, 1,
0.2437901, 0.4018722, -0.1917126, 0, 0.3764706, 1, 1,
0.2458944, 2.190577, 0.8533986, 0, 0.3686275, 1, 1,
0.247024, 0.5206648, 2.483579, 0, 0.3647059, 1, 1,
0.2493384, -2.138513, 3.549675, 0, 0.3568628, 1, 1,
0.2513178, -0.791321, 0.7726791, 0, 0.3529412, 1, 1,
0.2518882, -1.327111, 3.418459, 0, 0.345098, 1, 1,
0.2543975, 1.443568, 0.1050213, 0, 0.3411765, 1, 1,
0.2586605, -0.5824715, 2.308081, 0, 0.3333333, 1, 1,
0.259237, -0.4517866, 1.937788, 0, 0.3294118, 1, 1,
0.2607159, 0.6393545, -0.4868988, 0, 0.3215686, 1, 1,
0.2618931, -0.1874257, 2.806976, 0, 0.3176471, 1, 1,
0.2625576, 0.9047761, 0.0326419, 0, 0.3098039, 1, 1,
0.2650964, 0.5458772, -0.07961161, 0, 0.3058824, 1, 1,
0.2685253, -0.9885125, 2.484276, 0, 0.2980392, 1, 1,
0.2698622, 0.4083317, 1.357915, 0, 0.2901961, 1, 1,
0.2718223, -0.9136773, 3.497726, 0, 0.2862745, 1, 1,
0.2757137, 1.907339, 2.037145, 0, 0.2784314, 1, 1,
0.2772677, -1.046443, 3.697791, 0, 0.2745098, 1, 1,
0.2807982, -1.584908, 2.7336, 0, 0.2666667, 1, 1,
0.2822536, 1.041576, 1.095847, 0, 0.2627451, 1, 1,
0.2871756, -1.049256, 0.6027393, 0, 0.254902, 1, 1,
0.2892269, -1.120926, 2.724673, 0, 0.2509804, 1, 1,
0.2935154, -0.3289505, 3.691305, 0, 0.2431373, 1, 1,
0.2959545, 0.4318933, 3.532551, 0, 0.2392157, 1, 1,
0.2961095, 1.736437, -0.643787, 0, 0.2313726, 1, 1,
0.2966632, -0.9640651, 3.509747, 0, 0.227451, 1, 1,
0.2967975, 0.7328966, -0.08245827, 0, 0.2196078, 1, 1,
0.3001616, 0.3582328, 2.54557, 0, 0.2156863, 1, 1,
0.3008892, 0.2804714, -0.03043289, 0, 0.2078431, 1, 1,
0.3010144, 1.016151, 1.045349, 0, 0.2039216, 1, 1,
0.3019819, 0.04076263, 0.4734244, 0, 0.1960784, 1, 1,
0.3034243, 1.164676, 0.8601286, 0, 0.1882353, 1, 1,
0.3063193, -1.16661, 2.925736, 0, 0.1843137, 1, 1,
0.3085037, 1.034217, 0.2949953, 0, 0.1764706, 1, 1,
0.3086581, -0.04082626, 2.01061, 0, 0.172549, 1, 1,
0.3119653, -1.563473, 3.361248, 0, 0.1647059, 1, 1,
0.3169082, 0.01798042, 2.629302, 0, 0.1607843, 1, 1,
0.3190726, -0.8120277, 3.285136, 0, 0.1529412, 1, 1,
0.3232687, 0.4674497, 1.984092, 0, 0.1490196, 1, 1,
0.3264216, -0.07693464, 2.668208, 0, 0.1411765, 1, 1,
0.3269403, 0.1112312, 0.6372469, 0, 0.1372549, 1, 1,
0.3272847, -0.02862049, 2.294538, 0, 0.1294118, 1, 1,
0.3302668, -0.3983891, 1.923685, 0, 0.1254902, 1, 1,
0.3315034, 0.9641072, -0.1248985, 0, 0.1176471, 1, 1,
0.3347035, 0.650416, 0.9989341, 0, 0.1137255, 1, 1,
0.3349793, -0.446467, 2.462655, 0, 0.1058824, 1, 1,
0.3359082, -0.713719, 2.900382, 0, 0.09803922, 1, 1,
0.338898, 1.039781, 2.019371, 0, 0.09411765, 1, 1,
0.3395334, -0.4442402, 3.266431, 0, 0.08627451, 1, 1,
0.3417442, -0.3244, 0.8862391, 0, 0.08235294, 1, 1,
0.342012, -0.8800767, 2.032912, 0, 0.07450981, 1, 1,
0.3478562, -1.226383, 2.697529, 0, 0.07058824, 1, 1,
0.348745, 0.1046844, 0.0194561, 0, 0.0627451, 1, 1,
0.350247, -1.635941, 2.776871, 0, 0.05882353, 1, 1,
0.3523208, 0.3340091, 0.0102054, 0, 0.05098039, 1, 1,
0.3542045, 0.007257727, 0.6362509, 0, 0.04705882, 1, 1,
0.3543978, 0.3723003, -0.08311, 0, 0.03921569, 1, 1,
0.3563628, -0.7500482, 2.825603, 0, 0.03529412, 1, 1,
0.3564631, 0.2950322, 0.6050406, 0, 0.02745098, 1, 1,
0.3565793, 0.3061131, 0.9973617, 0, 0.02352941, 1, 1,
0.3648567, 0.858138, -1.034609, 0, 0.01568628, 1, 1,
0.3687596, -0.9950055, 1.84244, 0, 0.01176471, 1, 1,
0.3705243, 0.5800115, -0.5626853, 0, 0.003921569, 1, 1,
0.3740315, -0.3572774, 1.38029, 0.003921569, 0, 1, 1,
0.3948902, 1.713111, -1.011324, 0.007843138, 0, 1, 1,
0.3972146, -0.320505, 1.138806, 0.01568628, 0, 1, 1,
0.3992311, -1.103552, 4.485018, 0.01960784, 0, 1, 1,
0.4016856, 0.5701038, 0.6464677, 0.02745098, 0, 1, 1,
0.4079073, -0.7238671, 1.130574, 0.03137255, 0, 1, 1,
0.414222, 0.9761281, -0.07040788, 0.03921569, 0, 1, 1,
0.4154409, 0.1648557, 1.523207, 0.04313726, 0, 1, 1,
0.417898, 0.7954391, 0.5832954, 0.05098039, 0, 1, 1,
0.4179102, 0.1006734, 1.557849, 0.05490196, 0, 1, 1,
0.4208691, -0.2502479, 2.161526, 0.0627451, 0, 1, 1,
0.4212357, 1.549386, 0.06192005, 0.06666667, 0, 1, 1,
0.4243818, -0.6581653, 5.594507, 0.07450981, 0, 1, 1,
0.4260531, -0.131763, 0.6601529, 0.07843138, 0, 1, 1,
0.4307278, -0.3222385, 3.601391, 0.08627451, 0, 1, 1,
0.433237, 0.1414124, 0.1017332, 0.09019608, 0, 1, 1,
0.4334067, 1.668971, 0.2765642, 0.09803922, 0, 1, 1,
0.4347466, 0.2622163, 1.758801, 0.1058824, 0, 1, 1,
0.4354784, 2.484143, 2.195188, 0.1098039, 0, 1, 1,
0.4357641, -2.296058, 3.011482, 0.1176471, 0, 1, 1,
0.4372631, 0.7109437, 1.813191, 0.1215686, 0, 1, 1,
0.4383834, -0.9366146, 3.142588, 0.1294118, 0, 1, 1,
0.4438159, -0.1124535, 1.967021, 0.1333333, 0, 1, 1,
0.4455959, 0.719478, 0.5474766, 0.1411765, 0, 1, 1,
0.4481031, 1.205075, 0.4969088, 0.145098, 0, 1, 1,
0.4585399, 0.6244938, 1.377218, 0.1529412, 0, 1, 1,
0.4594165, 0.2102519, 0.1075435, 0.1568628, 0, 1, 1,
0.4623406, 0.292153, 1.693166, 0.1647059, 0, 1, 1,
0.4630859, -0.3675354, 2.33567, 0.1686275, 0, 1, 1,
0.4638842, -0.5512577, 2.259619, 0.1764706, 0, 1, 1,
0.4770475, 0.8132192, -0.1637089, 0.1803922, 0, 1, 1,
0.4810499, 0.0844431, 4.140087, 0.1882353, 0, 1, 1,
0.4842893, -1.090253, 2.487576, 0.1921569, 0, 1, 1,
0.4851982, 1.26526, -0.5659081, 0.2, 0, 1, 1,
0.4853064, 0.6574778, -0.4810607, 0.2078431, 0, 1, 1,
0.4862862, 0.6788017, 1.744907, 0.2117647, 0, 1, 1,
0.4875164, -0.04772246, 1.417561, 0.2196078, 0, 1, 1,
0.4890801, 0.3975451, -1.95347, 0.2235294, 0, 1, 1,
0.4899239, 1.00797, 1.719483, 0.2313726, 0, 1, 1,
0.4906819, 0.1862251, 0.9849711, 0.2352941, 0, 1, 1,
0.495095, 0.2364529, 1.242018, 0.2431373, 0, 1, 1,
0.500926, 1.470798, 0.8451514, 0.2470588, 0, 1, 1,
0.5016346, -1.157742, 4.93827, 0.254902, 0, 1, 1,
0.5042835, 0.8978561, 0.7735885, 0.2588235, 0, 1, 1,
0.5053459, 0.1141511, 2.081406, 0.2666667, 0, 1, 1,
0.5090538, 2.231339, -1.651868, 0.2705882, 0, 1, 1,
0.5148355, 2.527115, 0.9152999, 0.2784314, 0, 1, 1,
0.5180218, 0.2563054, 0.3937831, 0.282353, 0, 1, 1,
0.5266589, 2.595134, 0.05860748, 0.2901961, 0, 1, 1,
0.5526682, -2.835843, 3.324997, 0.2941177, 0, 1, 1,
0.5570471, 0.5337722, -0.7725411, 0.3019608, 0, 1, 1,
0.5582271, -0.05931792, 3.589217, 0.3098039, 0, 1, 1,
0.5600721, 0.3710122, -1.550713, 0.3137255, 0, 1, 1,
0.5615714, -0.08526283, 2.525439, 0.3215686, 0, 1, 1,
0.563919, 1.720519, 0.607279, 0.3254902, 0, 1, 1,
0.5644935, -0.9552999, 1.436998, 0.3333333, 0, 1, 1,
0.5678762, -0.6142395, 2.784892, 0.3372549, 0, 1, 1,
0.5689656, -0.3104967, 3.133785, 0.345098, 0, 1, 1,
0.5720238, -1.585271, 4.302167, 0.3490196, 0, 1, 1,
0.5729952, -0.3981027, 1.98933, 0.3568628, 0, 1, 1,
0.5784287, -0.7463416, 3.132848, 0.3607843, 0, 1, 1,
0.5789969, -1.458349, 3.409287, 0.3686275, 0, 1, 1,
0.5810305, 0.9085535, 0.8096748, 0.372549, 0, 1, 1,
0.5826978, -0.4990577, 2.972242, 0.3803922, 0, 1, 1,
0.5843443, -0.4864165, 3.442988, 0.3843137, 0, 1, 1,
0.5876014, -1.753956, 1.83984, 0.3921569, 0, 1, 1,
0.5903306, -0.1360329, 4.309012, 0.3960784, 0, 1, 1,
0.5948899, -0.6210826, 1.582748, 0.4039216, 0, 1, 1,
0.5958965, -0.9931704, 3.558883, 0.4117647, 0, 1, 1,
0.596929, -1.510534, 2.319063, 0.4156863, 0, 1, 1,
0.6021972, 0.3364908, 1.063683, 0.4235294, 0, 1, 1,
0.6051171, 1.817397, 0.07256167, 0.427451, 0, 1, 1,
0.605473, -1.49845, 0.9287422, 0.4352941, 0, 1, 1,
0.6117323, -2.945751, 3.12201, 0.4392157, 0, 1, 1,
0.6155955, -0.4488052, 4.01027, 0.4470588, 0, 1, 1,
0.6182749, 1.18004, 0.9365132, 0.4509804, 0, 1, 1,
0.6213893, -0.9022686, 3.012068, 0.4588235, 0, 1, 1,
0.6221725, 0.8828516, -1.032244, 0.4627451, 0, 1, 1,
0.622717, -0.192507, 2.41039, 0.4705882, 0, 1, 1,
0.6232628, -0.3943618, 2.402018, 0.4745098, 0, 1, 1,
0.6252143, -1.71698, 3.004886, 0.4823529, 0, 1, 1,
0.6312413, -0.312012, 2.376679, 0.4862745, 0, 1, 1,
0.6341846, 1.441063, 1.142892, 0.4941176, 0, 1, 1,
0.6392145, -1.079087, 1.973989, 0.5019608, 0, 1, 1,
0.6412865, -0.1740829, 0.2758034, 0.5058824, 0, 1, 1,
0.6481218, 1.57851, -0.1874339, 0.5137255, 0, 1, 1,
0.6486945, -0.6020324, 3.538082, 0.5176471, 0, 1, 1,
0.6521401, -1.376142, 2.218662, 0.5254902, 0, 1, 1,
0.653246, 0.8372996, -0.1298906, 0.5294118, 0, 1, 1,
0.6538343, 1.491585, 0.5201378, 0.5372549, 0, 1, 1,
0.6544229, 0.4355545, 0.4171183, 0.5411765, 0, 1, 1,
0.65588, -0.2214244, 3.451175, 0.5490196, 0, 1, 1,
0.6560922, 0.4829812, 2.210165, 0.5529412, 0, 1, 1,
0.6562862, -0.06544822, 3.07969, 0.5607843, 0, 1, 1,
0.657685, -3.160225, 2.557622, 0.5647059, 0, 1, 1,
0.6665622, -0.09508949, 2.509437, 0.572549, 0, 1, 1,
0.6670372, -1.946351, 1.002897, 0.5764706, 0, 1, 1,
0.6675643, -0.04107744, 1.886109, 0.5843138, 0, 1, 1,
0.6780144, -1.707445, 4.885859, 0.5882353, 0, 1, 1,
0.6782323, 0.4795898, 1.221716, 0.5960785, 0, 1, 1,
0.6814266, -0.7959593, 0.9756561, 0.6039216, 0, 1, 1,
0.6817877, 0.3270439, 2.424786, 0.6078432, 0, 1, 1,
0.6840298, -0.2740786, 3.194883, 0.6156863, 0, 1, 1,
0.6841764, 1.395124, -0.3543738, 0.6196079, 0, 1, 1,
0.6868274, -0.8083957, 3.073797, 0.627451, 0, 1, 1,
0.6874016, -0.1966669, 2.96438, 0.6313726, 0, 1, 1,
0.6900972, 1.245929, 2.184365, 0.6392157, 0, 1, 1,
0.6918346, 0.1593195, 0.7935761, 0.6431373, 0, 1, 1,
0.695121, 1.049906, -0.5288613, 0.6509804, 0, 1, 1,
0.696123, 1.372716, -0.2170025, 0.654902, 0, 1, 1,
0.6965862, -1.205016, 3.495459, 0.6627451, 0, 1, 1,
0.6975823, 1.339656, 0.1131779, 0.6666667, 0, 1, 1,
0.6986798, -0.2109651, 1.858737, 0.6745098, 0, 1, 1,
0.7010465, 0.09501427, -0.3656339, 0.6784314, 0, 1, 1,
0.7016693, -0.4368949, 1.43465, 0.6862745, 0, 1, 1,
0.7026306, -0.554696, 0.5056885, 0.6901961, 0, 1, 1,
0.7039772, 0.6146061, 0.7667664, 0.6980392, 0, 1, 1,
0.7041356, -0.980571, 2.255069, 0.7058824, 0, 1, 1,
0.7104064, -0.145578, 0.8995133, 0.7098039, 0, 1, 1,
0.7214171, 1.33614, 1.441515, 0.7176471, 0, 1, 1,
0.7228343, 1.346336, 0.5898557, 0.7215686, 0, 1, 1,
0.7252274, 1.364997, -0.4014134, 0.7294118, 0, 1, 1,
0.7257394, -1.788286, 0.6677965, 0.7333333, 0, 1, 1,
0.7300136, 1.483672, 0.8957878, 0.7411765, 0, 1, 1,
0.7339863, 0.2519551, 0.121501, 0.7450981, 0, 1, 1,
0.7380325, -1.417974, 3.13855, 0.7529412, 0, 1, 1,
0.7489045, 0.01728124, 1.678199, 0.7568628, 0, 1, 1,
0.7570057, 1.461209, -0.5182066, 0.7647059, 0, 1, 1,
0.7593893, 0.5784809, 0.937661, 0.7686275, 0, 1, 1,
0.7611193, -0.9831555, 1.506106, 0.7764706, 0, 1, 1,
0.7618789, 1.32857, -1.521166, 0.7803922, 0, 1, 1,
0.7632964, 1.842258, -0.05705905, 0.7882353, 0, 1, 1,
0.7639086, 0.1887001, 1.462237, 0.7921569, 0, 1, 1,
0.7646479, -0.2973159, 1.796915, 0.8, 0, 1, 1,
0.7773987, 2.809047, 0.9947489, 0.8078431, 0, 1, 1,
0.7832778, -0.2341101, 4.412005, 0.8117647, 0, 1, 1,
0.7888793, -0.778411, 0.5550897, 0.8196079, 0, 1, 1,
0.7891022, 0.5181692, 2.427774, 0.8235294, 0, 1, 1,
0.7935969, 0.9083627, -1.256636, 0.8313726, 0, 1, 1,
0.801613, -0.8702163, 2.657044, 0.8352941, 0, 1, 1,
0.8037155, 1.420531, 0.009698248, 0.8431373, 0, 1, 1,
0.8063174, -1.805278, 2.303868, 0.8470588, 0, 1, 1,
0.807547, -0.7105653, 2.145069, 0.854902, 0, 1, 1,
0.8096661, -0.4882714, 3.275101, 0.8588235, 0, 1, 1,
0.8136615, 1.042281, -0.1916365, 0.8666667, 0, 1, 1,
0.8140188, 0.2545858, 1.933341, 0.8705882, 0, 1, 1,
0.8147151, -0.3889082, 2.467007, 0.8784314, 0, 1, 1,
0.8177705, 1.589435, -0.4617179, 0.8823529, 0, 1, 1,
0.8184125, 1.529606, -0.2958052, 0.8901961, 0, 1, 1,
0.8196559, 1.963963, -0.8108045, 0.8941177, 0, 1, 1,
0.8229587, -0.1051035, 0.7225347, 0.9019608, 0, 1, 1,
0.8244938, 0.8416198, 2.135598, 0.9098039, 0, 1, 1,
0.8347725, -0.1445792, 3.616005, 0.9137255, 0, 1, 1,
0.8395296, 2.291965, 1.740926, 0.9215686, 0, 1, 1,
0.8434653, -1.184671, 3.367365, 0.9254902, 0, 1, 1,
0.8476548, -1.539085, 2.429474, 0.9333333, 0, 1, 1,
0.8493408, -0.1644342, 2.569206, 0.9372549, 0, 1, 1,
0.850413, 0.7639248, 1.144851, 0.945098, 0, 1, 1,
0.8526367, 0.6263638, 2.215519, 0.9490196, 0, 1, 1,
0.8565653, -0.1573159, 2.420156, 0.9568627, 0, 1, 1,
0.8588809, -0.8441408, 1.861767, 0.9607843, 0, 1, 1,
0.8608119, -0.8714609, 4.141442, 0.9686275, 0, 1, 1,
0.8672548, 0.05626526, 1.721121, 0.972549, 0, 1, 1,
0.8698804, -0.9181706, 2.560522, 0.9803922, 0, 1, 1,
0.8717122, -0.795392, 1.827092, 0.9843137, 0, 1, 1,
0.8819755, 1.29547, 1.001009, 0.9921569, 0, 1, 1,
0.8833457, -1.694267, 2.992108, 0.9960784, 0, 1, 1,
0.8834867, -0.3280565, -0.4239639, 1, 0, 0.9960784, 1,
0.8947926, -1.563433, 3.211031, 1, 0, 0.9882353, 1,
0.9073964, 1.176244, -0.08718774, 1, 0, 0.9843137, 1,
0.9099817, 0.6204084, 2.089391, 1, 0, 0.9764706, 1,
0.9100927, -0.6936967, 2.238073, 1, 0, 0.972549, 1,
0.9106002, 0.8365991, -0.673058, 1, 0, 0.9647059, 1,
0.9245545, 1.434054, 0.07197566, 1, 0, 0.9607843, 1,
0.9348928, -1.207821, 0.4554257, 1, 0, 0.9529412, 1,
0.9363567, 0.1105685, -0.4400932, 1, 0, 0.9490196, 1,
0.938495, -0.7938421, 1.845335, 1, 0, 0.9411765, 1,
0.9488888, 0.6035424, 0.5618406, 1, 0, 0.9372549, 1,
0.9582079, 0.9217802, 1.887506, 1, 0, 0.9294118, 1,
0.961039, -1.010708, 4.052258, 1, 0, 0.9254902, 1,
0.9653774, -0.2643363, 1.733472, 1, 0, 0.9176471, 1,
0.9658535, 0.6619633, -0.0512379, 1, 0, 0.9137255, 1,
0.9671326, -2.438222, 3.058331, 1, 0, 0.9058824, 1,
0.9694138, -0.5157899, 4.628496, 1, 0, 0.9019608, 1,
0.977146, 1.469172, -0.4262664, 1, 0, 0.8941177, 1,
0.977295, -0.4411281, 0.7993433, 1, 0, 0.8862745, 1,
0.9851368, 0.2924926, 1.832726, 1, 0, 0.8823529, 1,
0.9867183, 0.3576196, 0.2799647, 1, 0, 0.8745098, 1,
0.9927135, -0.8833828, 2.311699, 1, 0, 0.8705882, 1,
1.009351, 1.01619, 2.104135, 1, 0, 0.8627451, 1,
1.017511, 0.847624, -1.25582, 1, 0, 0.8588235, 1,
1.02124, 0.6399804, 0.5523897, 1, 0, 0.8509804, 1,
1.024729, 0.3928744, 2.177982, 1, 0, 0.8470588, 1,
1.026783, 0.5817965, 1.269728, 1, 0, 0.8392157, 1,
1.038416, 0.09306557, 0.6894115, 1, 0, 0.8352941, 1,
1.042843, 1.215062, -0.5458942, 1, 0, 0.827451, 1,
1.04373, -0.6193971, 1.582224, 1, 0, 0.8235294, 1,
1.051771, -1.200766, 2.414776, 1, 0, 0.8156863, 1,
1.053363, -0.7830425, 0.8366656, 1, 0, 0.8117647, 1,
1.057463, -0.7320595, 2.262377, 1, 0, 0.8039216, 1,
1.065232, -0.682104, 2.113199, 1, 0, 0.7960784, 1,
1.070102, -0.08230092, 1.796895, 1, 0, 0.7921569, 1,
1.07013, -1.018979, 2.311337, 1, 0, 0.7843137, 1,
1.07672, -0.1792238, 2.506309, 1, 0, 0.7803922, 1,
1.077512, -0.9608838, 1.592431, 1, 0, 0.772549, 1,
1.085165, -0.5683438, 0.3901379, 1, 0, 0.7686275, 1,
1.093018, -0.8746358, 1.88816, 1, 0, 0.7607843, 1,
1.093431, 0.3696174, 1.926157, 1, 0, 0.7568628, 1,
1.093963, -0.1876121, 2.129239, 1, 0, 0.7490196, 1,
1.095857, -0.5970314, 2.26466, 1, 0, 0.7450981, 1,
1.100989, -0.3960097, 1.624213, 1, 0, 0.7372549, 1,
1.103572, 0.7119191, -1.502124, 1, 0, 0.7333333, 1,
1.105528, 0.5025725, -0.5121795, 1, 0, 0.7254902, 1,
1.113497, 0.3567725, 1.340758, 1, 0, 0.7215686, 1,
1.135226, -0.9177344, 2.090412, 1, 0, 0.7137255, 1,
1.135294, -0.4926839, 0.2870641, 1, 0, 0.7098039, 1,
1.150277, -0.8749276, 2.578634, 1, 0, 0.7019608, 1,
1.157329, 1.470751, 2.068258, 1, 0, 0.6941177, 1,
1.161976, -0.214932, 1.675652, 1, 0, 0.6901961, 1,
1.17048, 1.561047, 0.7572793, 1, 0, 0.682353, 1,
1.170568, 0.0425032, 1.881563, 1, 0, 0.6784314, 1,
1.182758, -1.185893, 0.9737588, 1, 0, 0.6705883, 1,
1.198427, -0.00321588, 2.613569, 1, 0, 0.6666667, 1,
1.198949, 0.9718398, 0.5525711, 1, 0, 0.6588235, 1,
1.210706, -0.1201682, 1.735901, 1, 0, 0.654902, 1,
1.214458, 1.885782, -0.0400774, 1, 0, 0.6470588, 1,
1.228813, 0.6443804, -0.4159257, 1, 0, 0.6431373, 1,
1.236701, -0.9951428, 3.648083, 1, 0, 0.6352941, 1,
1.24183, -0.494902, 2.044349, 1, 0, 0.6313726, 1,
1.242421, 1.404952, 1.778711, 1, 0, 0.6235294, 1,
1.242772, 1.941967, 0.2695932, 1, 0, 0.6196079, 1,
1.243791, 0.9196083, 1.756376, 1, 0, 0.6117647, 1,
1.245577, -0.9164436, 2.754515, 1, 0, 0.6078432, 1,
1.246175, -1.392493, 2.971683, 1, 0, 0.6, 1,
1.246679, 0.2044972, 3.34072, 1, 0, 0.5921569, 1,
1.267309, 1.518287, -0.3426446, 1, 0, 0.5882353, 1,
1.269304, 0.6960063, 0.3611091, 1, 0, 0.5803922, 1,
1.269692, 1.772796, -0.1757529, 1, 0, 0.5764706, 1,
1.285036, -0.4601513, 1.986809, 1, 0, 0.5686275, 1,
1.285043, 0.7124913, -0.6559708, 1, 0, 0.5647059, 1,
1.300342, -0.05716847, 0.2681556, 1, 0, 0.5568628, 1,
1.305674, -0.472912, 1.262595, 1, 0, 0.5529412, 1,
1.310049, -1.172785, 1.057634, 1, 0, 0.5450981, 1,
1.3104, 1.614075, -1.599899, 1, 0, 0.5411765, 1,
1.318264, -0.9296517, 2.298515, 1, 0, 0.5333334, 1,
1.356544, 2.376702, 1.641827, 1, 0, 0.5294118, 1,
1.361487, 0.7623805, 1.190905, 1, 0, 0.5215687, 1,
1.367872, 0.2128423, 2.243767, 1, 0, 0.5176471, 1,
1.389731, -0.9033248, 2.99934, 1, 0, 0.509804, 1,
1.409648, 2.017315, -0.1081335, 1, 0, 0.5058824, 1,
1.417977, -0.2895258, 2.248407, 1, 0, 0.4980392, 1,
1.418727, 1.29095, 1.790201, 1, 0, 0.4901961, 1,
1.421711, 0.3507316, -1.267347, 1, 0, 0.4862745, 1,
1.42644, 2.12462, -0.9100972, 1, 0, 0.4784314, 1,
1.429675, -0.7097468, 1.89969, 1, 0, 0.4745098, 1,
1.435506, 0.006556599, 3.002088, 1, 0, 0.4666667, 1,
1.440023, 0.2893938, -0.6296079, 1, 0, 0.4627451, 1,
1.441443, 0.1218966, 2.863374, 1, 0, 0.454902, 1,
1.444161, 0.6718943, 3.528827, 1, 0, 0.4509804, 1,
1.446399, 0.5397724, 2.071606, 1, 0, 0.4431373, 1,
1.44784, 1.264561, 0.831754, 1, 0, 0.4392157, 1,
1.455205, -1.148642, 2.7774, 1, 0, 0.4313726, 1,
1.46134, -0.555858, 4.126984, 1, 0, 0.427451, 1,
1.469943, 0.2025926, 3.460209, 1, 0, 0.4196078, 1,
1.480479, 0.8644612, 0.7395259, 1, 0, 0.4156863, 1,
1.492473, 1.022151, 0.89621, 1, 0, 0.4078431, 1,
1.492963, 0.1834227, 0.7341256, 1, 0, 0.4039216, 1,
1.502701, -0.1101457, 3.275803, 1, 0, 0.3960784, 1,
1.521674, -0.7355148, 0.9780231, 1, 0, 0.3882353, 1,
1.542954, 1.872918, -0.825129, 1, 0, 0.3843137, 1,
1.557354, -1.212502, 0.6236498, 1, 0, 0.3764706, 1,
1.565823, 0.07170456, 0.655974, 1, 0, 0.372549, 1,
1.568093, 1.322392, 0.03845556, 1, 0, 0.3647059, 1,
1.569688, 0.2612605, 1.726681, 1, 0, 0.3607843, 1,
1.573716, -1.169394, 2.650019, 1, 0, 0.3529412, 1,
1.577351, -0.4101806, 2.985579, 1, 0, 0.3490196, 1,
1.583779, 0.01316228, 2.644984, 1, 0, 0.3411765, 1,
1.590709, 0.9555985, 2.523016, 1, 0, 0.3372549, 1,
1.606263, -2.284468, 1.772302, 1, 0, 0.3294118, 1,
1.61575, 0.1178969, -0.0005755135, 1, 0, 0.3254902, 1,
1.642997, 0.6451342, 2.471509, 1, 0, 0.3176471, 1,
1.65067, -0.7578319, 2.890611, 1, 0, 0.3137255, 1,
1.650767, 1.373304, 0.462195, 1, 0, 0.3058824, 1,
1.652622, 0.6413225, 0.5192516, 1, 0, 0.2980392, 1,
1.662948, 0.112086, 1.441213, 1, 0, 0.2941177, 1,
1.677062, 0.04939275, 1.388373, 1, 0, 0.2862745, 1,
1.686594, -0.04519414, 1.251879, 1, 0, 0.282353, 1,
1.728035, -0.9430009, 1.638879, 1, 0, 0.2745098, 1,
1.74579, -1.018031, 3.909713, 1, 0, 0.2705882, 1,
1.746574, 1.493983, 1.138187, 1, 0, 0.2627451, 1,
1.755037, -0.3986463, 3.466222, 1, 0, 0.2588235, 1,
1.784399, -0.3939764, -1.144342, 1, 0, 0.2509804, 1,
1.788388, 1.354092, 0.8299417, 1, 0, 0.2470588, 1,
1.803969, 0.2281501, 1.169267, 1, 0, 0.2392157, 1,
1.808834, 0.280261, 1.115745, 1, 0, 0.2352941, 1,
1.816517, 0.3879239, 0.8983436, 1, 0, 0.227451, 1,
1.849618, 1.61814, 1.325294, 1, 0, 0.2235294, 1,
1.854138, -1.534649, 0.6165884, 1, 0, 0.2156863, 1,
1.975676, 0.1023562, 0.7615105, 1, 0, 0.2117647, 1,
1.996354, 1.74883, -0.9456935, 1, 0, 0.2039216, 1,
1.998433, 0.987203, 1.068456, 1, 0, 0.1960784, 1,
2.005, 1.225631, 1.068875, 1, 0, 0.1921569, 1,
2.00571, 2.481994, -0.922756, 1, 0, 0.1843137, 1,
2.043866, -1.611134, 3.634033, 1, 0, 0.1803922, 1,
2.049854, 1.29069, 0.06882417, 1, 0, 0.172549, 1,
2.05455, -0.1708392, 1.120433, 1, 0, 0.1686275, 1,
2.090354, 0.1509821, 2.16979, 1, 0, 0.1607843, 1,
2.095223, 0.5054289, 1.523483, 1, 0, 0.1568628, 1,
2.096303, 1.697428, 0.531006, 1, 0, 0.1490196, 1,
2.103103, -0.5747908, 3.928555, 1, 0, 0.145098, 1,
2.117117, 1.624916, 1.372667, 1, 0, 0.1372549, 1,
2.124216, -0.1959026, 3.512212, 1, 0, 0.1333333, 1,
2.147901, 0.6184498, 2.455613, 1, 0, 0.1254902, 1,
2.154822, 0.1051397, 3.041457, 1, 0, 0.1215686, 1,
2.155917, 0.6914238, 0.2686079, 1, 0, 0.1137255, 1,
2.193634, 0.3754077, 0.9025368, 1, 0, 0.1098039, 1,
2.211284, 0.5757496, 2.336641, 1, 0, 0.1019608, 1,
2.228423, -1.546146, 1.800013, 1, 0, 0.09411765, 1,
2.252099, -0.2835133, 1.098855, 1, 0, 0.09019608, 1,
2.266247, -0.3778115, 3.204276, 1, 0, 0.08235294, 1,
2.281027, 1.631057, 1.564361, 1, 0, 0.07843138, 1,
2.290307, 0.4888599, 2.123953, 1, 0, 0.07058824, 1,
2.324476, 0.1977365, 0.8034289, 1, 0, 0.06666667, 1,
2.357637, -1.858642, 3.939465, 1, 0, 0.05882353, 1,
2.503421, -0.1357924, 2.715757, 1, 0, 0.05490196, 1,
2.538156, 0.7591652, 1.285357, 1, 0, 0.04705882, 1,
2.584575, 0.9672219, 0.8011877, 1, 0, 0.04313726, 1,
2.598692, 0.9024456, -0.5211999, 1, 0, 0.03529412, 1,
2.680792, -0.8407731, 2.581858, 1, 0, 0.03137255, 1,
2.715681, -1.967759, 1.825022, 1, 0, 0.02352941, 1,
2.730453, -1.182857, 0.4285372, 1, 0, 0.01960784, 1,
2.733755, -0.02119002, 1.083493, 1, 0, 0.01176471, 1,
2.806401, 2.183024, 1.579637, 1, 0, 0.007843138, 1
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
-0.08049285, -4.172017, -7.182084, 0, -0.5, 0.5, 0.5,
-0.08049285, -4.172017, -7.182084, 1, -0.5, 0.5, 0.5,
-0.08049285, -4.172017, -7.182084, 1, 1.5, 0.5, 0.5,
-0.08049285, -4.172017, -7.182084, 0, 1.5, 0.5, 0.5
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
-3.946043, -0.175589, -7.182084, 0, -0.5, 0.5, 0.5,
-3.946043, -0.175589, -7.182084, 1, -0.5, 0.5, 0.5,
-3.946043, -0.175589, -7.182084, 1, 1.5, 0.5, 0.5,
-3.946043, -0.175589, -7.182084, 0, 1.5, 0.5, 0.5
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
-3.946043, -4.172017, 0.1320913, 0, -0.5, 0.5, 0.5,
-3.946043, -4.172017, 0.1320913, 1, -0.5, 0.5, 0.5,
-3.946043, -4.172017, 0.1320913, 1, 1.5, 0.5, 0.5,
-3.946043, -4.172017, 0.1320913, 0, 1.5, 0.5, 0.5
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
-2, -3.249764, -5.494197,
2, -3.249764, -5.494197,
-2, -3.249764, -5.494197,
-2, -3.403473, -5.775512,
-1, -3.249764, -5.494197,
-1, -3.403473, -5.775512,
0, -3.249764, -5.494197,
0, -3.403473, -5.775512,
1, -3.249764, -5.494197,
1, -3.403473, -5.775512,
2, -3.249764, -5.494197,
2, -3.403473, -5.775512
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
-2, -3.710891, -6.33814, 0, -0.5, 0.5, 0.5,
-2, -3.710891, -6.33814, 1, -0.5, 0.5, 0.5,
-2, -3.710891, -6.33814, 1, 1.5, 0.5, 0.5,
-2, -3.710891, -6.33814, 0, 1.5, 0.5, 0.5,
-1, -3.710891, -6.33814, 0, -0.5, 0.5, 0.5,
-1, -3.710891, -6.33814, 1, -0.5, 0.5, 0.5,
-1, -3.710891, -6.33814, 1, 1.5, 0.5, 0.5,
-1, -3.710891, -6.33814, 0, 1.5, 0.5, 0.5,
0, -3.710891, -6.33814, 0, -0.5, 0.5, 0.5,
0, -3.710891, -6.33814, 1, -0.5, 0.5, 0.5,
0, -3.710891, -6.33814, 1, 1.5, 0.5, 0.5,
0, -3.710891, -6.33814, 0, 1.5, 0.5, 0.5,
1, -3.710891, -6.33814, 0, -0.5, 0.5, 0.5,
1, -3.710891, -6.33814, 1, -0.5, 0.5, 0.5,
1, -3.710891, -6.33814, 1, 1.5, 0.5, 0.5,
1, -3.710891, -6.33814, 0, 1.5, 0.5, 0.5,
2, -3.710891, -6.33814, 0, -0.5, 0.5, 0.5,
2, -3.710891, -6.33814, 1, -0.5, 0.5, 0.5,
2, -3.710891, -6.33814, 1, 1.5, 0.5, 0.5,
2, -3.710891, -6.33814, 0, 1.5, 0.5, 0.5
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
-3.053993, -3, -5.494197,
-3.053993, 2, -5.494197,
-3.053993, -3, -5.494197,
-3.202668, -3, -5.775512,
-3.053993, -2, -5.494197,
-3.202668, -2, -5.775512,
-3.053993, -1, -5.494197,
-3.202668, -1, -5.775512,
-3.053993, 0, -5.494197,
-3.202668, 0, -5.775512,
-3.053993, 1, -5.494197,
-3.202668, 1, -5.775512,
-3.053993, 2, -5.494197,
-3.202668, 2, -5.775512
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
-3.500018, -3, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, -3, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, -3, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, -3, -6.33814, 0, 1.5, 0.5, 0.5,
-3.500018, -2, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, -2, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, -2, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, -2, -6.33814, 0, 1.5, 0.5, 0.5,
-3.500018, -1, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, -1, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, -1, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, -1, -6.33814, 0, 1.5, 0.5, 0.5,
-3.500018, 0, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, 0, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, 0, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, 0, -6.33814, 0, 1.5, 0.5, 0.5,
-3.500018, 1, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, 1, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, 1, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, 1, -6.33814, 0, 1.5, 0.5, 0.5,
-3.500018, 2, -6.33814, 0, -0.5, 0.5, 0.5,
-3.500018, 2, -6.33814, 1, -0.5, 0.5, 0.5,
-3.500018, 2, -6.33814, 1, 1.5, 0.5, 0.5,
-3.500018, 2, -6.33814, 0, 1.5, 0.5, 0.5
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
-3.053993, -3.249764, -4,
-3.053993, -3.249764, 4,
-3.053993, -3.249764, -4,
-3.202668, -3.403473, -4,
-3.053993, -3.249764, -2,
-3.202668, -3.403473, -2,
-3.053993, -3.249764, 0,
-3.202668, -3.403473, 0,
-3.053993, -3.249764, 2,
-3.202668, -3.403473, 2,
-3.053993, -3.249764, 4,
-3.202668, -3.403473, 4
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
-3.500018, -3.710891, -4, 0, -0.5, 0.5, 0.5,
-3.500018, -3.710891, -4, 1, -0.5, 0.5, 0.5,
-3.500018, -3.710891, -4, 1, 1.5, 0.5, 0.5,
-3.500018, -3.710891, -4, 0, 1.5, 0.5, 0.5,
-3.500018, -3.710891, -2, 0, -0.5, 0.5, 0.5,
-3.500018, -3.710891, -2, 1, -0.5, 0.5, 0.5,
-3.500018, -3.710891, -2, 1, 1.5, 0.5, 0.5,
-3.500018, -3.710891, -2, 0, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 0, 0, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 0, 1, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 0, 1, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 0, 0, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 2, 0, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 2, 1, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 2, 1, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 2, 0, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 4, 0, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 4, 1, -0.5, 0.5, 0.5,
-3.500018, -3.710891, 4, 1, 1.5, 0.5, 0.5,
-3.500018, -3.710891, 4, 0, 1.5, 0.5, 0.5
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
-3.053993, -3.249764, -5.494197,
-3.053993, 2.898587, -5.494197,
-3.053993, -3.249764, 5.758379,
-3.053993, 2.898587, 5.758379,
-3.053993, -3.249764, -5.494197,
-3.053993, -3.249764, 5.758379,
-3.053993, 2.898587, -5.494197,
-3.053993, 2.898587, 5.758379,
-3.053993, -3.249764, -5.494197,
2.893008, -3.249764, -5.494197,
-3.053993, -3.249764, 5.758379,
2.893008, -3.249764, 5.758379,
-3.053993, 2.898587, -5.494197,
2.893008, 2.898587, -5.494197,
-3.053993, 2.898587, 5.758379,
2.893008, 2.898587, 5.758379,
2.893008, -3.249764, -5.494197,
2.893008, 2.898587, -5.494197,
2.893008, -3.249764, 5.758379,
2.893008, 2.898587, 5.758379,
2.893008, -3.249764, -5.494197,
2.893008, -3.249764, 5.758379,
2.893008, 2.898587, -5.494197,
2.893008, 2.898587, 5.758379
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
var radius = 7.547651;
var distance = 33.58035;
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
mvMatrix.translate( 0.08049285, 0.175589, -0.1320913 );
mvMatrix.scale( 1.372233, 1.327294, 0.7252266 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.58035);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
monolinuron<-read.table("monolinuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-monolinuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
```

```r
y<-monolinuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
```

```r
z<-monolinuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'monolinuron' not found
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
-2.967386, -0.2694266, -0.1201093, 0, 0, 1, 1, 1,
-2.88207, -0.4946133, -1.50865, 1, 0, 0, 1, 1,
-2.816166, -0.8753998, -3.731871, 1, 0, 0, 1, 1,
-2.73431, -0.4978204, -1.359947, 1, 0, 0, 1, 1,
-2.700327, 0.6494392, -1.891851, 1, 0, 0, 1, 1,
-2.629066, -0.6404459, -3.046216, 1, 0, 0, 1, 1,
-2.557316, 0.6037426, -0.5897592, 0, 0, 0, 1, 1,
-2.511881, -0.6047447, -2.317101, 0, 0, 0, 1, 1,
-2.477067, 0.4027492, -0.4232697, 0, 0, 0, 1, 1,
-2.397815, -0.336888, 0.1927993, 0, 0, 0, 1, 1,
-2.244359, -0.6528221, -1.383676, 0, 0, 0, 1, 1,
-2.199613, -0.6647997, -2.116785, 0, 0, 0, 1, 1,
-2.186312, 0.1564211, -2.911106, 0, 0, 0, 1, 1,
-2.170614, -2.206494, -3.154425, 1, 1, 1, 1, 1,
-2.151132, -1.380509, -2.281224, 1, 1, 1, 1, 1,
-2.138541, 1.153975, -1.656364, 1, 1, 1, 1, 1,
-2.100389, -0.5408539, -1.377271, 1, 1, 1, 1, 1,
-2.074415, 1.495176, -3.153881, 1, 1, 1, 1, 1,
-2.059244, -1.085689, -2.888767, 1, 1, 1, 1, 1,
-2.054861, 0.5854414, -2.109846, 1, 1, 1, 1, 1,
-2.050414, -0.1129347, -1.972709, 1, 1, 1, 1, 1,
-2.04612, 1.080466, 2.445399, 1, 1, 1, 1, 1,
-2.03351, -0.2140448, 0.01195478, 1, 1, 1, 1, 1,
-2.022402, -0.8046362, -1.585254, 1, 1, 1, 1, 1,
-2.016235, -1.471088, -3.156549, 1, 1, 1, 1, 1,
-2.011147, 0.550923, -1.750989, 1, 1, 1, 1, 1,
-1.99474, 1.237013, -0.7638595, 1, 1, 1, 1, 1,
-1.994039, -0.3335764, -2.489238, 1, 1, 1, 1, 1,
-1.984736, -0.3944024, -0.1660863, 0, 0, 1, 1, 1,
-1.962551, 1.034941, -2.274514, 1, 0, 0, 1, 1,
-1.941795, 1.71606, -1.337361, 1, 0, 0, 1, 1,
-1.936425, -1.129189, -2.087112, 1, 0, 0, 1, 1,
-1.92606, 0.2389308, -2.394833, 1, 0, 0, 1, 1,
-1.912332, 0.3656343, -1.479252, 1, 0, 0, 1, 1,
-1.909041, 0.4820429, -2.887524, 0, 0, 0, 1, 1,
-1.891574, -1.072768, -2.4179, 0, 0, 0, 1, 1,
-1.890233, -1.604446, -2.36856, 0, 0, 0, 1, 1,
-1.884491, 0.9180076, 0.2398143, 0, 0, 0, 1, 1,
-1.857953, 0.5554616, -0.180176, 0, 0, 0, 1, 1,
-1.852149, 0.1644072, -2.993867, 0, 0, 0, 1, 1,
-1.821944, -1.25744, -1.296462, 0, 0, 0, 1, 1,
-1.814764, -0.7205319, -2.474721, 1, 1, 1, 1, 1,
-1.805415, -0.05006511, -1.960312, 1, 1, 1, 1, 1,
-1.767047, -0.2773603, -1.798801, 1, 1, 1, 1, 1,
-1.752, 0.9529956, 0.7624233, 1, 1, 1, 1, 1,
-1.751983, 0.1008951, -2.668846, 1, 1, 1, 1, 1,
-1.750242, 0.8938218, -1.052828, 1, 1, 1, 1, 1,
-1.734934, 0.5804633, -1.09698, 1, 1, 1, 1, 1,
-1.726087, 0.1847904, -1.136336, 1, 1, 1, 1, 1,
-1.717587, -0.8503877, -1.36347, 1, 1, 1, 1, 1,
-1.701545, 0.8078739, -1.319388, 1, 1, 1, 1, 1,
-1.694376, -1.287555, -1.82854, 1, 1, 1, 1, 1,
-1.6777, -0.8388916, -2.435006, 1, 1, 1, 1, 1,
-1.672419, 1.268244, -1.027116, 1, 1, 1, 1, 1,
-1.63628, -0.13306, -0.06918854, 1, 1, 1, 1, 1,
-1.631584, 0.2007255, -3.397164, 1, 1, 1, 1, 1,
-1.624604, 0.605382, 0.2850051, 0, 0, 1, 1, 1,
-1.613796, -0.2833088, -1.194538, 1, 0, 0, 1, 1,
-1.601429, -1.240846, -2.938061, 1, 0, 0, 1, 1,
-1.588851, 0.9550771, -1.869181, 1, 0, 0, 1, 1,
-1.584101, -2.165842, -2.306646, 1, 0, 0, 1, 1,
-1.582551, 0.3442329, -2.491837, 1, 0, 0, 1, 1,
-1.575836, -0.4612849, -1.647964, 0, 0, 0, 1, 1,
-1.531247, 0.7844141, 0.2768465, 0, 0, 0, 1, 1,
-1.529811, -1.165037, -1.243934, 0, 0, 0, 1, 1,
-1.524976, -0.5082451, -3.166674, 0, 0, 0, 1, 1,
-1.522102, -0.3072631, -1.564675, 0, 0, 0, 1, 1,
-1.519435, 1.371361, -0.3748438, 0, 0, 0, 1, 1,
-1.51777, -0.2945032, -3.7115, 0, 0, 0, 1, 1,
-1.504835, -0.2781658, -1.323332, 1, 1, 1, 1, 1,
-1.496167, 0.8079788, -1.119072, 1, 1, 1, 1, 1,
-1.456038, 0.3053857, 0.1755375, 1, 1, 1, 1, 1,
-1.443387, -0.936609, -2.987509, 1, 1, 1, 1, 1,
-1.44254, 0.4348224, -2.486177, 1, 1, 1, 1, 1,
-1.440345, -0.1523238, -2.065307, 1, 1, 1, 1, 1,
-1.434086, -0.5662598, -2.818026, 1, 1, 1, 1, 1,
-1.434032, -0.3710247, -1.358073, 1, 1, 1, 1, 1,
-1.43098, 0.1835089, -1.237383, 1, 1, 1, 1, 1,
-1.427089, -0.1702087, -0.1762538, 1, 1, 1, 1, 1,
-1.426487, 2.67166, -2.751849, 1, 1, 1, 1, 1,
-1.423542, 1.734795, 0.04888796, 1, 1, 1, 1, 1,
-1.409783, 1.417275, -0.324778, 1, 1, 1, 1, 1,
-1.40475, -1.07664, -3.150081, 1, 1, 1, 1, 1,
-1.398854, 0.9977981, -2.572937, 1, 1, 1, 1, 1,
-1.397209, -0.1833397, -1.840471, 0, 0, 1, 1, 1,
-1.395756, 0.007397573, -0.1487042, 1, 0, 0, 1, 1,
-1.393057, 0.7412991, -2.528896, 1, 0, 0, 1, 1,
-1.38803, 1.098052, -0.8595907, 1, 0, 0, 1, 1,
-1.381663, -1.919717, -1.567339, 1, 0, 0, 1, 1,
-1.381162, 1.015643, -2.929868, 1, 0, 0, 1, 1,
-1.380373, -0.5276314, -1.413758, 0, 0, 0, 1, 1,
-1.374748, 1.659708, -0.4484099, 0, 0, 0, 1, 1,
-1.366163, 0.2575995, 1.22889, 0, 0, 0, 1, 1,
-1.366015, -0.270229, -0.7834715, 0, 0, 0, 1, 1,
-1.362516, 1.049865, -0.1220317, 0, 0, 0, 1, 1,
-1.348529, -0.9451798, -3.178425, 0, 0, 0, 1, 1,
-1.348504, -0.2999051, -2.477954, 0, 0, 0, 1, 1,
-1.345254, -1.527629, -2.856377, 1, 1, 1, 1, 1,
-1.34122, 2.060506, -0.2510779, 1, 1, 1, 1, 1,
-1.330743, 0.09929729, -0.9240578, 1, 1, 1, 1, 1,
-1.325027, -0.09344418, 0.2474258, 1, 1, 1, 1, 1,
-1.322261, 1.962147, -0.6138044, 1, 1, 1, 1, 1,
-1.317131, 0.1942837, -1.030218, 1, 1, 1, 1, 1,
-1.312134, 0.008192956, -0.5985748, 1, 1, 1, 1, 1,
-1.308322, 0.6406486, -0.1207881, 1, 1, 1, 1, 1,
-1.304452, 1.390587, -0.3609911, 1, 1, 1, 1, 1,
-1.304361, -0.2519805, -0.3461626, 1, 1, 1, 1, 1,
-1.302526, -0.07504716, -0.5184833, 1, 1, 1, 1, 1,
-1.300791, 0.9340927, -0.6277122, 1, 1, 1, 1, 1,
-1.29615, 1.119473, -0.6280096, 1, 1, 1, 1, 1,
-1.287683, -1.175552, -1.369983, 1, 1, 1, 1, 1,
-1.283564, 0.5989614, -1.688336, 1, 1, 1, 1, 1,
-1.279532, 0.3367369, -1.794322, 0, 0, 1, 1, 1,
-1.271459, -1.117702, -2.647485, 1, 0, 0, 1, 1,
-1.268163, -0.1868421, -2.117674, 1, 0, 0, 1, 1,
-1.265628, 1.457832, -0.06799943, 1, 0, 0, 1, 1,
-1.263946, -2.164938, -2.913769, 1, 0, 0, 1, 1,
-1.259792, 0.3703405, 0.06161951, 1, 0, 0, 1, 1,
-1.259439, -1.577767, -2.191529, 0, 0, 0, 1, 1,
-1.256905, 0.694584, -1.250143, 0, 0, 0, 1, 1,
-1.255765, -0.7016186, -2.617722, 0, 0, 0, 1, 1,
-1.250767, -1.576433, -1.640249, 0, 0, 0, 1, 1,
-1.2499, -0.2545622, -1.846473, 0, 0, 0, 1, 1,
-1.245439, 0.097711, -3.159156, 0, 0, 0, 1, 1,
-1.2451, 1.032099, -1.897198, 0, 0, 0, 1, 1,
-1.236559, -0.5199232, -2.744255, 1, 1, 1, 1, 1,
-1.234552, -0.9823858, -0.8531439, 1, 1, 1, 1, 1,
-1.226771, -0.6455616, -1.753509, 1, 1, 1, 1, 1,
-1.219547, -0.1927616, -4.430139, 1, 1, 1, 1, 1,
-1.201427, -0.1028337, -2.063794, 1, 1, 1, 1, 1,
-1.19701, -0.3249317, -1.642478, 1, 1, 1, 1, 1,
-1.194716, -0.08605707, -2.514895, 1, 1, 1, 1, 1,
-1.19338, 1.937063, -0.7879671, 1, 1, 1, 1, 1,
-1.192426, -0.7013819, -1.811106, 1, 1, 1, 1, 1,
-1.190713, -0.4712907, -0.6605496, 1, 1, 1, 1, 1,
-1.180761, 0.2965535, -1.987572, 1, 1, 1, 1, 1,
-1.174646, 1.919902, -0.9726433, 1, 1, 1, 1, 1,
-1.164645, 1.584767, 0.4424458, 1, 1, 1, 1, 1,
-1.156215, 2.151328, 0.1685701, 1, 1, 1, 1, 1,
-1.155923, -0.06982744, -2.063066, 1, 1, 1, 1, 1,
-1.153087, 0.9657634, -1.254053, 0, 0, 1, 1, 1,
-1.150926, -0.5865789, -1.004949, 1, 0, 0, 1, 1,
-1.150367, -0.3539685, -3.475132, 1, 0, 0, 1, 1,
-1.148451, 0.116485, -1.115165, 1, 0, 0, 1, 1,
-1.139389, -0.5027213, -1.399264, 1, 0, 0, 1, 1,
-1.137393, -1.448263, -1.785327, 1, 0, 0, 1, 1,
-1.136144, -2.640934, -1.703, 0, 0, 0, 1, 1,
-1.132275, 0.2737934, -1.811731, 0, 0, 0, 1, 1,
-1.118994, -2.182444, -4.505344, 0, 0, 0, 1, 1,
-1.11857, 1.208719, -1.98442, 0, 0, 0, 1, 1,
-1.117059, -0.8594158, -1.700395, 0, 0, 0, 1, 1,
-1.112394, -2.788367, -2.480735, 0, 0, 0, 1, 1,
-1.100827, -0.2920528, -1.133341, 0, 0, 0, 1, 1,
-1.096032, -0.2942359, -1.342207, 1, 1, 1, 1, 1,
-1.073773, 1.306149, -1.622321, 1, 1, 1, 1, 1,
-1.073716, 0.5348752, -0.398181, 1, 1, 1, 1, 1,
-1.066978, -0.4832568, -0.638762, 1, 1, 1, 1, 1,
-1.062729, -0.2750506, -2.450103, 1, 1, 1, 1, 1,
-1.06121, -0.6402743, -2.36648, 1, 1, 1, 1, 1,
-1.054849, -1.663679, -1.008028, 1, 1, 1, 1, 1,
-1.048184, -0.2504603, -3.239855, 1, 1, 1, 1, 1,
-1.04658, -0.4340859, -2.990211, 1, 1, 1, 1, 1,
-1.046369, -1.156316, -1.985672, 1, 1, 1, 1, 1,
-1.045551, -0.2217291, -1.327444, 1, 1, 1, 1, 1,
-1.042195, -0.3379043, -2.236758, 1, 1, 1, 1, 1,
-1.038615, 0.4271077, -1.660221, 1, 1, 1, 1, 1,
-1.03081, -1.36727, -1.044692, 1, 1, 1, 1, 1,
-1.014176, -1.72707, -2.001838, 1, 1, 1, 1, 1,
-1.012493, 1.155902, -1.390658, 0, 0, 1, 1, 1,
-1.007111, -0.09286156, -1.28593, 1, 0, 0, 1, 1,
-1.001284, 0.0531706, -2.952784, 1, 0, 0, 1, 1,
-1.000656, 1.063765, -0.3764657, 1, 0, 0, 1, 1,
-0.9998104, 2.745208, 1.474671, 1, 0, 0, 1, 1,
-0.9956698, -0.9664961, -1.786481, 1, 0, 0, 1, 1,
-0.9898116, -1.402861, -1.689366, 0, 0, 0, 1, 1,
-0.9882523, 0.02148828, -1.475699, 0, 0, 0, 1, 1,
-0.9870089, -0.4300694, -3.160132, 0, 0, 0, 1, 1,
-0.9854518, 0.2162324, -0.6541128, 0, 0, 0, 1, 1,
-0.9843808, -0.1861164, -1.724621, 0, 0, 0, 1, 1,
-0.9843204, 1.454254, -1.515964, 0, 0, 0, 1, 1,
-0.9840694, -2.263838, -3.078589, 0, 0, 0, 1, 1,
-0.9807051, -0.2497715, -2.139522, 1, 1, 1, 1, 1,
-0.9695278, -1.137109, -2.325312, 1, 1, 1, 1, 1,
-0.9624752, 0.8938549, -0.5010163, 1, 1, 1, 1, 1,
-0.9613575, -1.390451, -4.215803, 1, 1, 1, 1, 1,
-0.9537967, 0.06649657, -2.12764, 1, 1, 1, 1, 1,
-0.9504395, -0.207561, -1.357903, 1, 1, 1, 1, 1,
-0.9484556, 0.757939, -0.2562511, 1, 1, 1, 1, 1,
-0.9393523, 0.8821337, -0.5509794, 1, 1, 1, 1, 1,
-0.9347149, -0.6206832, -1.488595, 1, 1, 1, 1, 1,
-0.9299119, 0.6834166, -1.18206, 1, 1, 1, 1, 1,
-0.923174, -1.027164, -5.162554, 1, 1, 1, 1, 1,
-0.9225478, 0.06117729, -1.448635, 1, 1, 1, 1, 1,
-0.9142792, -0.5376855, -2.263104, 1, 1, 1, 1, 1,
-0.9142594, -1.352628, -0.5294019, 1, 1, 1, 1, 1,
-0.9128435, 0.712905, 1.2728, 1, 1, 1, 1, 1,
-0.9056069, 1.01209, 0.004331497, 0, 0, 1, 1, 1,
-0.8993425, 0.4212564, -1.269222, 1, 0, 0, 1, 1,
-0.8934333, 1.447475, -1.42081, 1, 0, 0, 1, 1,
-0.8923311, -0.2456658, -2.591173, 1, 0, 0, 1, 1,
-0.8769967, 0.07069811, -2.453911, 1, 0, 0, 1, 1,
-0.8730316, 1.064552, -1.488768, 1, 0, 0, 1, 1,
-0.870943, 0.4500766, -1.221071, 0, 0, 0, 1, 1,
-0.8652517, -1.119061, -2.151237, 0, 0, 0, 1, 1,
-0.8537422, -0.2515907, -1.123661, 0, 0, 0, 1, 1,
-0.8530712, -0.665253, -1.200228, 0, 0, 0, 1, 1,
-0.8520072, -1.390761, -1.835928, 0, 0, 0, 1, 1,
-0.8496743, 0.5719672, -0.9032562, 0, 0, 0, 1, 1,
-0.842743, 0.8453163, -2.754069, 0, 0, 0, 1, 1,
-0.8392026, -1.287477, -2.823635, 1, 1, 1, 1, 1,
-0.8369584, 1.042093, 0.721698, 1, 1, 1, 1, 1,
-0.8318678, 0.08089961, -1.971211, 1, 1, 1, 1, 1,
-0.827223, 0.9200348, 0.05569969, 1, 1, 1, 1, 1,
-0.8271485, 0.04481689, -1.817135, 1, 1, 1, 1, 1,
-0.8267398, -0.8341777, -0.01539217, 1, 1, 1, 1, 1,
-0.8255495, 1.284889, 2.019542, 1, 1, 1, 1, 1,
-0.8238679, 0.1917323, -1.652962, 1, 1, 1, 1, 1,
-0.8208671, 0.2536712, -1.982081, 1, 1, 1, 1, 1,
-0.8189935, -1.183854, -0.8153605, 1, 1, 1, 1, 1,
-0.8155668, -2.183727, -1.189963, 1, 1, 1, 1, 1,
-0.8143754, 0.123385, -2.204736, 1, 1, 1, 1, 1,
-0.8093945, -1.636666, -2.31041, 1, 1, 1, 1, 1,
-0.8060799, 0.5584733, -2.005109, 1, 1, 1, 1, 1,
-0.8026862, 0.5678523, -0.4171963, 1, 1, 1, 1, 1,
-0.797861, 0.8233997, -1.416917, 0, 0, 1, 1, 1,
-0.7938038, -0.3364201, -1.058723, 1, 0, 0, 1, 1,
-0.7920283, 0.25937, -1.354189, 1, 0, 0, 1, 1,
-0.7836714, -0.2031883, -0.5840364, 1, 0, 0, 1, 1,
-0.7828409, -1.272593, -3.342516, 1, 0, 0, 1, 1,
-0.7813824, -1.225829, -3.155592, 1, 0, 0, 1, 1,
-0.7764977, -0.1719918, -0.6879206, 0, 0, 0, 1, 1,
-0.7758244, -0.09951911, -3.658329, 0, 0, 0, 1, 1,
-0.774656, 1.944571, -0.7731809, 0, 0, 0, 1, 1,
-0.7721701, -1.662811, -1.483426, 0, 0, 0, 1, 1,
-0.7702165, 1.030499, -1.183, 0, 0, 0, 1, 1,
-0.7691213, 0.2822195, 0.2571786, 0, 0, 0, 1, 1,
-0.7665148, 0.8252551, -0.331141, 0, 0, 0, 1, 1,
-0.76048, -0.2707873, -0.002506893, 1, 1, 1, 1, 1,
-0.7568123, 0.6928024, 0.1681109, 1, 1, 1, 1, 1,
-0.7539039, -0.7458372, -3.163816, 1, 1, 1, 1, 1,
-0.7536507, -1.756117, -3.999018, 1, 1, 1, 1, 1,
-0.7532209, 0.32358, -0.8727216, 1, 1, 1, 1, 1,
-0.7473643, 0.03254236, -2.393104, 1, 1, 1, 1, 1,
-0.7410837, -0.6895267, -0.1171667, 1, 1, 1, 1, 1,
-0.738055, -1.162165, -4.930097, 1, 1, 1, 1, 1,
-0.736908, 0.1612744, -2.072758, 1, 1, 1, 1, 1,
-0.7333348, 0.1643026, -1.868341, 1, 1, 1, 1, 1,
-0.731971, -1.417489, -2.19321, 1, 1, 1, 1, 1,
-0.7243785, 0.1255253, -0.386974, 1, 1, 1, 1, 1,
-0.7159052, 0.4134334, -1.485271, 1, 1, 1, 1, 1,
-0.7155762, 0.4102677, -2.344816, 1, 1, 1, 1, 1,
-0.7154688, -1.008599, -2.67229, 1, 1, 1, 1, 1,
-0.7152812, -0.2396657, -1.367897, 0, 0, 1, 1, 1,
-0.714923, 0.7064372, -0.1188005, 1, 0, 0, 1, 1,
-0.7129803, -1.178118, -2.901668, 1, 0, 0, 1, 1,
-0.7113755, 0.333671, -2.298382, 1, 0, 0, 1, 1,
-0.7110475, -0.654008, -0.4656651, 1, 0, 0, 1, 1,
-0.7017673, 0.9357972, -0.8355724, 1, 0, 0, 1, 1,
-0.7013612, -0.4564303, -2.554057, 0, 0, 0, 1, 1,
-0.7005818, -0.576501, -2.597422, 0, 0, 0, 1, 1,
-0.6968552, 1.035531, 0.4662453, 0, 0, 0, 1, 1,
-0.692809, 0.04311488, -0.5448883, 0, 0, 0, 1, 1,
-0.6926008, 1.478201, -1.931835, 0, 0, 0, 1, 1,
-0.6924696, -0.5474403, -3.384407, 0, 0, 0, 1, 1,
-0.6917555, -0.7607623, -0.9867509, 0, 0, 0, 1, 1,
-0.6895151, 0.6926296, -1.451174, 1, 1, 1, 1, 1,
-0.6882879, 1.615361, -0.6073944, 1, 1, 1, 1, 1,
-0.6842053, 0.1115062, -1.288522, 1, 1, 1, 1, 1,
-0.682838, 1.089484, -0.5496669, 1, 1, 1, 1, 1,
-0.6754114, -0.3759897, -3.173741, 1, 1, 1, 1, 1,
-0.6707332, -0.7678662, -3.204387, 1, 1, 1, 1, 1,
-0.6688592, -1.159081, -4.065334, 1, 1, 1, 1, 1,
-0.6672307, 0.06199115, -1.824452, 1, 1, 1, 1, 1,
-0.660319, 1.200719, -0.662493, 1, 1, 1, 1, 1,
-0.6551893, -0.5935397, -1.230385, 1, 1, 1, 1, 1,
-0.6537762, -1.930928, -2.088531, 1, 1, 1, 1, 1,
-0.6485461, -1.442604, -4.508339, 1, 1, 1, 1, 1,
-0.6462091, 0.4955939, -1.038655, 1, 1, 1, 1, 1,
-0.6449716, -0.7279108, -2.319725, 1, 1, 1, 1, 1,
-0.6394024, 1.384822, 1.053477, 1, 1, 1, 1, 1,
-0.6389564, -1.843447, -1.526789, 0, 0, 1, 1, 1,
-0.6369073, 0.2228693, -0.5028908, 1, 0, 0, 1, 1,
-0.6355405, -0.4334959, -1.7613, 1, 0, 0, 1, 1,
-0.6339954, -0.8569878, -2.97588, 1, 0, 0, 1, 1,
-0.6284114, -0.3277046, -2.325254, 1, 0, 0, 1, 1,
-0.6257118, 0.1595889, -2.821602, 1, 0, 0, 1, 1,
-0.6155922, 0.583787, -1.404555, 0, 0, 0, 1, 1,
-0.6147788, -1.183102, -2.350789, 0, 0, 0, 1, 1,
-0.6141335, -1.036949, -2.065541, 0, 0, 0, 1, 1,
-0.6063414, -0.04714684, -1.27298, 0, 0, 0, 1, 1,
-0.6046821, -1.257884, -2.547877, 0, 0, 0, 1, 1,
-0.6046048, 0.5359346, -1.591567, 0, 0, 0, 1, 1,
-0.6030329, -0.6241044, -2.883874, 0, 0, 0, 1, 1,
-0.6030256, -0.1841423, -1.479382, 1, 1, 1, 1, 1,
-0.6028244, -0.6269097, -2.548048, 1, 1, 1, 1, 1,
-0.6023528, -1.090468, -1.27479, 1, 1, 1, 1, 1,
-0.6023412, 1.241907, -0.01377982, 1, 1, 1, 1, 1,
-0.5997002, -0.7149096, -2.76668, 1, 1, 1, 1, 1,
-0.5967085, -1.295929, -0.4476245, 1, 1, 1, 1, 1,
-0.594138, 0.4955576, -0.9664114, 1, 1, 1, 1, 1,
-0.5935254, 0.9277855, 0.110424, 1, 1, 1, 1, 1,
-0.5915799, -0.1654964, -4.015222, 1, 1, 1, 1, 1,
-0.5830808, 0.5462942, 0.1945134, 1, 1, 1, 1, 1,
-0.5824876, -0.8444995, -2.453292, 1, 1, 1, 1, 1,
-0.5772654, -0.3830661, -1.447328, 1, 1, 1, 1, 1,
-0.5764194, 0.3535326, -0.5365033, 1, 1, 1, 1, 1,
-0.5747734, -0.6268066, -3.126849, 1, 1, 1, 1, 1,
-0.5726879, 0.5856401, -0.2377074, 1, 1, 1, 1, 1,
-0.572539, -0.8678762, -3.253391, 0, 0, 1, 1, 1,
-0.5661646, 0.3095556, -1.211691, 1, 0, 0, 1, 1,
-0.5618022, 0.001990655, -1.400367, 1, 0, 0, 1, 1,
-0.5612118, -0.4984522, -3.869726, 1, 0, 0, 1, 1,
-0.5567849, 0.1643518, -0.9842655, 1, 0, 0, 1, 1,
-0.5554868, -0.1263512, -2.991318, 1, 0, 0, 1, 1,
-0.5525795, -0.8021764, 0.3768493, 0, 0, 0, 1, 1,
-0.5512069, 0.7095975, -1.192859, 0, 0, 0, 1, 1,
-0.5478898, -0.1895728, -3.586767, 0, 0, 0, 1, 1,
-0.542443, -1.435399, -3.112992, 0, 0, 0, 1, 1,
-0.5397389, 0.8228965, 0.1633576, 0, 0, 0, 1, 1,
-0.539519, 0.373152, -1.029848, 0, 0, 0, 1, 1,
-0.5337785, 1.060686, -0.4921132, 0, 0, 0, 1, 1,
-0.5272336, 2.017065, -0.810468, 1, 1, 1, 1, 1,
-0.5268152, -1.094361, -3.506656, 1, 1, 1, 1, 1,
-0.5246264, -0.3145161, -2.074874, 1, 1, 1, 1, 1,
-0.522924, -1.186401, -3.907693, 1, 1, 1, 1, 1,
-0.5216462, 0.714835, 1.933095, 1, 1, 1, 1, 1,
-0.5187605, -0.9632472, -3.193515, 1, 1, 1, 1, 1,
-0.5169298, -0.45836, -2.078361, 1, 1, 1, 1, 1,
-0.5163975, 0.3375154, -0.4252699, 1, 1, 1, 1, 1,
-0.5163298, -0.4354461, -1.995704, 1, 1, 1, 1, 1,
-0.5128677, 0.908752, -0.8175216, 1, 1, 1, 1, 1,
-0.5078862, -0.2378944, -3.039624, 1, 1, 1, 1, 1,
-0.5076542, -0.5515823, -0.8023087, 1, 1, 1, 1, 1,
-0.5058628, -0.1098519, -0.9569072, 1, 1, 1, 1, 1,
-0.5012491, -1.909937, -2.761047, 1, 1, 1, 1, 1,
-0.4986395, 0.1921632, -0.4532297, 1, 1, 1, 1, 1,
-0.4967771, -1.861399, -4.76463, 0, 0, 1, 1, 1,
-0.4959963, 2.451688, 0.1985813, 1, 0, 0, 1, 1,
-0.4936006, 0.6571556, -0.1018533, 1, 0, 0, 1, 1,
-0.4900734, -0.7234818, -0.9012851, 1, 0, 0, 1, 1,
-0.4843138, -0.1004011, -2.43786, 1, 0, 0, 1, 1,
-0.4836572, 0.3834997, -0.6227698, 1, 0, 0, 1, 1,
-0.4834765, 0.4657648, 1.205787, 0, 0, 0, 1, 1,
-0.4826442, -0.176509, -2.575036, 0, 0, 0, 1, 1,
-0.4826332, -0.2881851, 0.0885259, 0, 0, 0, 1, 1,
-0.4800455, -1.909613, -1.104092, 0, 0, 0, 1, 1,
-0.4776759, -1.648637, -3.102279, 0, 0, 0, 1, 1,
-0.4762287, 0.2332059, 0.2288176, 0, 0, 0, 1, 1,
-0.4684156, -1.352447, -3.014996, 0, 0, 0, 1, 1,
-0.4681693, -0.2358169, -1.246726, 1, 1, 1, 1, 1,
-0.4667543, -0.5555354, -5.081179, 1, 1, 1, 1, 1,
-0.4629755, 1.905663, -1.088725, 1, 1, 1, 1, 1,
-0.457163, -0.4030316, -1.783521, 1, 1, 1, 1, 1,
-0.4465462, 0.3689696, -0.8624631, 1, 1, 1, 1, 1,
-0.4376422, 0.1219011, -1.520479, 1, 1, 1, 1, 1,
-0.4369958, 2.373977, 0.01557689, 1, 1, 1, 1, 1,
-0.4328203, 0.347733, -1.111281, 1, 1, 1, 1, 1,
-0.4320079, 0.00217752, -3.485006, 1, 1, 1, 1, 1,
-0.4308769, 0.07992084, -1.811126, 1, 1, 1, 1, 1,
-0.4300861, 1.290262, -1.654925, 1, 1, 1, 1, 1,
-0.4273335, 2.627308, -1.516009, 1, 1, 1, 1, 1,
-0.4244243, 0.8142591, -1.738411, 1, 1, 1, 1, 1,
-0.4237016, -1.657241, -3.159439, 1, 1, 1, 1, 1,
-0.4231264, 0.7031559, -0.460962, 1, 1, 1, 1, 1,
-0.4197551, 0.5729197, -1.353123, 0, 0, 1, 1, 1,
-0.4183114, 1.290787, -0.8867372, 1, 0, 0, 1, 1,
-0.4152731, 1.403684, 0.2303761, 1, 0, 0, 1, 1,
-0.4141365, -0.02669274, -1.976507, 1, 0, 0, 1, 1,
-0.4120727, 0.4717082, -0.5096275, 1, 0, 0, 1, 1,
-0.4110874, 1.28428, -0.5362387, 1, 0, 0, 1, 1,
-0.4107086, -0.6130011, -3.360165, 0, 0, 0, 1, 1,
-0.4068165, 0.910426, -1.776483, 0, 0, 0, 1, 1,
-0.4038478, 1.60384, 0.8290615, 0, 0, 0, 1, 1,
-0.4001594, 0.4914777, -0.4924783, 0, 0, 0, 1, 1,
-0.3966329, -0.7845678, -3.542344, 0, 0, 0, 1, 1,
-0.3898201, 0.3711858, -0.8563686, 0, 0, 0, 1, 1,
-0.3892243, 0.01677777, -1.620579, 0, 0, 0, 1, 1,
-0.3848857, 0.3563782, -0.3135683, 1, 1, 1, 1, 1,
-0.384563, 0.02554874, 1.359809, 1, 1, 1, 1, 1,
-0.3830487, -0.6647849, -2.506781, 1, 1, 1, 1, 1,
-0.3801299, -0.01123601, -2.436034, 1, 1, 1, 1, 1,
-0.3746119, -0.1639438, -1.343519, 1, 1, 1, 1, 1,
-0.3743412, -0.3970656, -2.067883, 1, 1, 1, 1, 1,
-0.3721375, 0.01061432, -2.184682, 1, 1, 1, 1, 1,
-0.3697647, -0.4161312, -2.986228, 1, 1, 1, 1, 1,
-0.369691, -1.238796, -2.947927, 1, 1, 1, 1, 1,
-0.3676646, 0.3314252, -0.02287733, 1, 1, 1, 1, 1,
-0.3664414, 0.9193408, 0.2164912, 1, 1, 1, 1, 1,
-0.3662573, -1.110088, -3.441216, 1, 1, 1, 1, 1,
-0.3658526, -0.2056778, -2.151443, 1, 1, 1, 1, 1,
-0.3643154, -1.56429, -1.709898, 1, 1, 1, 1, 1,
-0.3637639, 0.2647636, -1.997632, 1, 1, 1, 1, 1,
-0.3633859, -1.44814, -1.732891, 0, 0, 1, 1, 1,
-0.3616628, -1.390726, -3.181638, 1, 0, 0, 1, 1,
-0.3611888, 1.336107, -0.3618646, 1, 0, 0, 1, 1,
-0.3605186, -0.1170783, -2.009292, 1, 0, 0, 1, 1,
-0.3556542, 1.167964, -2.420616, 1, 0, 0, 1, 1,
-0.3535976, 1.262967, -0.9658948, 1, 0, 0, 1, 1,
-0.3490892, -1.284566, -3.833849, 0, 0, 0, 1, 1,
-0.3441283, 0.3516723, -0.8742999, 0, 0, 0, 1, 1,
-0.3430833, 0.4235064, -1.516271, 0, 0, 0, 1, 1,
-0.3407294, -1.650331, -2.954211, 0, 0, 0, 1, 1,
-0.3366846, 0.4666159, 0.7442614, 0, 0, 0, 1, 1,
-0.3366063, -0.4216893, -4.222231, 0, 0, 0, 1, 1,
-0.3326662, 1.135896, -1.765944, 0, 0, 0, 1, 1,
-0.326979, 0.3273661, -1.732889, 1, 1, 1, 1, 1,
-0.3110447, 0.004427352, -1.606235, 1, 1, 1, 1, 1,
-0.3092559, -0.1814328, -2.111554, 1, 1, 1, 1, 1,
-0.3029333, 0.2500931, 0.02358188, 1, 1, 1, 1, 1,
-0.2912385, 1.164534, 0.4221622, 1, 1, 1, 1, 1,
-0.2877933, 1.340631, -1.053024, 1, 1, 1, 1, 1,
-0.2812625, -0.3366239, -2.446082, 1, 1, 1, 1, 1,
-0.2711631, 1.416746, -1.943986, 1, 1, 1, 1, 1,
-0.2707787, 0.8126853, -0.2823583, 1, 1, 1, 1, 1,
-0.2606009, -1.137487, -3.645786, 1, 1, 1, 1, 1,
-0.2601624, -0.7992293, -2.90466, 1, 1, 1, 1, 1,
-0.2577635, -0.1495058, -1.198473, 1, 1, 1, 1, 1,
-0.2534672, -1.791889, -3.11835, 1, 1, 1, 1, 1,
-0.2512501, 2.193548, 0.3276108, 1, 1, 1, 1, 1,
-0.2508051, -0.4322777, -2.978631, 1, 1, 1, 1, 1,
-0.2500549, 1.442539, -0.2026288, 0, 0, 1, 1, 1,
-0.2482141, 1.76863, -0.608754, 1, 0, 0, 1, 1,
-0.2464847, -0.2077045, -0.01942898, 1, 0, 0, 1, 1,
-0.2435623, 0.09559857, -2.279453, 1, 0, 0, 1, 1,
-0.2424198, 1.012672, -1.292812, 1, 0, 0, 1, 1,
-0.2424021, -0.4412689, -2.555138, 1, 0, 0, 1, 1,
-0.2373083, -0.7954484, -3.110997, 0, 0, 0, 1, 1,
-0.2339362, 0.6765128, -0.3708995, 0, 0, 0, 1, 1,
-0.2307568, 0.2427318, 0.08826717, 0, 0, 0, 1, 1,
-0.2195049, 0.13739, -2.789096, 0, 0, 0, 1, 1,
-0.2182869, -0.5539117, -5.142069, 0, 0, 0, 1, 1,
-0.2160404, 2.153356, -1.328879, 0, 0, 0, 1, 1,
-0.2110883, -0.6668401, -2.244693, 0, 0, 0, 1, 1,
-0.2086642, -0.1701597, -1.193861, 1, 1, 1, 1, 1,
-0.2079617, 0.750342, -0.1156201, 1, 1, 1, 1, 1,
-0.2075656, 1.051491, -1.04677, 1, 1, 1, 1, 1,
-0.2070947, 0.6714808, -0.07041273, 1, 1, 1, 1, 1,
-0.2017843, -1.058231, -2.189131, 1, 1, 1, 1, 1,
-0.1909352, -1.279311, -3.951654, 1, 1, 1, 1, 1,
-0.1888344, 0.8585761, -1.296764, 1, 1, 1, 1, 1,
-0.1883392, -0.7195632, -4.662476, 1, 1, 1, 1, 1,
-0.1870814, -0.6166039, -4.481399, 1, 1, 1, 1, 1,
-0.1856991, 2.148579, -0.2449615, 1, 1, 1, 1, 1,
-0.1848198, -0.6786536, -3.590149, 1, 1, 1, 1, 1,
-0.1843285, 0.5570948, -1.096833, 1, 1, 1, 1, 1,
-0.1791038, -0.1140197, -3.504634, 1, 1, 1, 1, 1,
-0.1788046, -0.1123214, -1.440334, 1, 1, 1, 1, 1,
-0.1784806, -0.9003093, -3.089297, 1, 1, 1, 1, 1,
-0.1601318, -0.4125153, -2.174007, 0, 0, 1, 1, 1,
-0.1555579, -1.155731, -4.836565, 1, 0, 0, 1, 1,
-0.1508214, -0.325368, -2.381486, 1, 0, 0, 1, 1,
-0.1485135, -1.003003, -2.841537, 1, 0, 0, 1, 1,
-0.1483663, -0.1577184, -2.427711, 1, 0, 0, 1, 1,
-0.1330034, 1.21462, 0.4289049, 1, 0, 0, 1, 1,
-0.1316529, -0.367546, -1.583969, 0, 0, 0, 1, 1,
-0.1312316, 0.7679613, -3.166019, 0, 0, 0, 1, 1,
-0.1303859, 1.679048, -0.7992821, 0, 0, 0, 1, 1,
-0.1301012, -1.530645, -3.872958, 0, 0, 0, 1, 1,
-0.1260607, 1.647854, -0.2274403, 0, 0, 0, 1, 1,
-0.1250174, -0.276003, -2.377856, 0, 0, 0, 1, 1,
-0.1149071, -0.6020897, -3.470195, 0, 0, 0, 1, 1,
-0.105734, 1.814317, -0.2601392, 1, 1, 1, 1, 1,
-0.1040861, -0.22461, -1.683947, 1, 1, 1, 1, 1,
-0.1031979, 1.719643, 0.7721598, 1, 1, 1, 1, 1,
-0.1012798, -0.5684001, -2.265195, 1, 1, 1, 1, 1,
-0.09783585, 0.6045932, 1.320835, 1, 1, 1, 1, 1,
-0.09352745, 1.035051, 1.500853, 1, 1, 1, 1, 1,
-0.08716376, -0.3792507, -2.23206, 1, 1, 1, 1, 1,
-0.08572621, 1.356377, -1.145983, 1, 1, 1, 1, 1,
-0.08487312, 0.1159325, -0.791108, 1, 1, 1, 1, 1,
-0.08352236, 0.5658213, -0.06298058, 1, 1, 1, 1, 1,
-0.0797427, 2.349997, -0.4886428, 1, 1, 1, 1, 1,
-0.07955321, -0.2468804, -2.094499, 1, 1, 1, 1, 1,
-0.07793202, 0.7229243, 0.9146882, 1, 1, 1, 1, 1,
-0.07764815, -0.8135492, -1.954713, 1, 1, 1, 1, 1,
-0.07314036, 0.3550675, -0.3789518, 1, 1, 1, 1, 1,
-0.07221451, 1.792094, -1.721321, 0, 0, 1, 1, 1,
-0.06974475, 0.5969132, 0.2442265, 1, 0, 0, 1, 1,
-0.05746228, -0.4879534, -3.216688, 1, 0, 0, 1, 1,
-0.05284009, -0.281215, -1.894671, 1, 0, 0, 1, 1,
-0.05057573, -0.4660994, -2.744855, 1, 0, 0, 1, 1,
-0.04939109, 0.7675958, -0.1164453, 1, 0, 0, 1, 1,
-0.04575739, -0.2801199, -3.857501, 0, 0, 0, 1, 1,
-0.04309131, -0.5660887, -3.487785, 0, 0, 0, 1, 1,
-0.04147318, 1.05407, -1.058745, 0, 0, 0, 1, 1,
-0.03849545, 1.957567, 2.043606, 0, 0, 0, 1, 1,
-0.03744896, 0.9678078, -1.896645, 0, 0, 0, 1, 1,
-0.0369435, 1.036047, -1.484608, 0, 0, 0, 1, 1,
-0.03498969, 0.07879417, -1.057144, 0, 0, 0, 1, 1,
-0.03485413, 1.256518, -1.454322, 1, 1, 1, 1, 1,
-0.03479154, -0.2990187, -2.107489, 1, 1, 1, 1, 1,
-0.03165573, 0.02195747, -1.11606, 1, 1, 1, 1, 1,
-0.02768647, -0.1143526, -4.39021, 1, 1, 1, 1, 1,
-0.02717576, 0.6663843, -0.2348621, 1, 1, 1, 1, 1,
-0.02450247, 0.3199622, 1.727536, 1, 1, 1, 1, 1,
-0.02440109, 0.9414976, -1.395037, 1, 1, 1, 1, 1,
-0.02031297, 0.9818979, 0.9825997, 1, 1, 1, 1, 1,
-0.01826716, -1.872097, -5.330325, 1, 1, 1, 1, 1,
-0.01748369, -0.3499814, -1.846241, 1, 1, 1, 1, 1,
-0.01742646, -1.180905, -2.568604, 1, 1, 1, 1, 1,
-0.01585889, -0.9978811, -3.470935, 1, 1, 1, 1, 1,
-0.01345388, -1.134133, -3.014466, 1, 1, 1, 1, 1,
-0.01251014, 2.374095, -0.2465234, 1, 1, 1, 1, 1,
-0.01076847, -0.5329825, -2.900489, 1, 1, 1, 1, 1,
-0.009072923, -0.848704, -0.9051846, 0, 0, 1, 1, 1,
-0.008834846, 0.6148085, 0.1617308, 1, 0, 0, 1, 1,
-0.007247371, -0.01148855, -2.311388, 1, 0, 0, 1, 1,
-0.004872013, -0.8785139, -3.475074, 1, 0, 0, 1, 1,
-0.002323385, 1.290425, -1.397933, 1, 0, 0, 1, 1,
-0.001243382, -0.5388238, -1.983909, 1, 0, 0, 1, 1,
-0.0009986118, 0.9343718, -2.450696, 0, 0, 0, 1, 1,
0.001739884, -0.1659767, 3.225058, 0, 0, 0, 1, 1,
0.008580126, -0.4460327, 4.016994, 0, 0, 0, 1, 1,
0.01250268, -0.3952635, 3.125623, 0, 0, 0, 1, 1,
0.01270037, 1.045171, -0.8892896, 0, 0, 0, 1, 1,
0.01444463, 0.6740489, 0.3481926, 0, 0, 0, 1, 1,
0.0153252, 0.9852588, -0.03866835, 0, 0, 0, 1, 1,
0.02187904, -0.2146392, 4.585117, 1, 1, 1, 1, 1,
0.022743, -1.621901, 1.609652, 1, 1, 1, 1, 1,
0.02447468, 1.551476, 1.021802, 1, 1, 1, 1, 1,
0.02914655, 0.971829, 0.07488102, 1, 1, 1, 1, 1,
0.03066207, -1.253802, 1.889213, 1, 1, 1, 1, 1,
0.03418475, -0.1793027, 2.967504, 1, 1, 1, 1, 1,
0.03465175, -0.7890732, 3.080201, 1, 1, 1, 1, 1,
0.03556611, 1.19933, -1.153199, 1, 1, 1, 1, 1,
0.03621356, -0.1374564, 1.657398, 1, 1, 1, 1, 1,
0.03720237, -0.4167875, 1.028267, 1, 1, 1, 1, 1,
0.0408137, 1.085208, -1.822509, 1, 1, 1, 1, 1,
0.0425758, 1.16353, -1.637726, 1, 1, 1, 1, 1,
0.04273432, -0.7747194, 3.303398, 1, 1, 1, 1, 1,
0.04328944, 0.6813399, -0.2299424, 1, 1, 1, 1, 1,
0.05177002, -1.589797, 2.384237, 1, 1, 1, 1, 1,
0.06217292, 0.5791334, 0.5999599, 0, 0, 1, 1, 1,
0.06319181, -0.4900494, 2.345071, 1, 0, 0, 1, 1,
0.06553399, -1.380877, 4.018183, 1, 0, 0, 1, 1,
0.06594529, 0.9486734, -1.94581, 1, 0, 0, 1, 1,
0.06735357, 0.7900304, 1.641776, 1, 0, 0, 1, 1,
0.0684589, 0.8378949, 0.2497557, 1, 0, 0, 1, 1,
0.06895822, 0.2347496, -0.6801276, 0, 0, 0, 1, 1,
0.07009879, 1.908375, -0.5342128, 0, 0, 0, 1, 1,
0.07214756, 0.7363361, 1.107578, 0, 0, 0, 1, 1,
0.07424784, 0.251504, 2.192887, 0, 0, 0, 1, 1,
0.07686941, 0.0459863, 1.747673, 0, 0, 0, 1, 1,
0.08353571, 0.5148324, -0.9174086, 0, 0, 0, 1, 1,
0.08643619, -1.95586, 2.157344, 0, 0, 0, 1, 1,
0.08791655, 0.5874594, -0.07021371, 1, 1, 1, 1, 1,
0.08933015, -0.01465268, 0.6386312, 1, 1, 1, 1, 1,
0.09252183, -1.36707, 1.489971, 1, 1, 1, 1, 1,
0.1011351, -0.6740581, 2.787438, 1, 1, 1, 1, 1,
0.1043653, 1.309762, 0.3466716, 1, 1, 1, 1, 1,
0.1046881, 0.4723921, -1.491519, 1, 1, 1, 1, 1,
0.1076202, -0.7107636, 2.759055, 1, 1, 1, 1, 1,
0.1096399, -1.480106, 2.523139, 1, 1, 1, 1, 1,
0.113743, -1.226985, 2.327973, 1, 1, 1, 1, 1,
0.1142917, 0.8383958, 0.1475123, 1, 1, 1, 1, 1,
0.1149728, -1.348626, 3.473405, 1, 1, 1, 1, 1,
0.1150969, 0.08078706, 1.267612, 1, 1, 1, 1, 1,
0.1168006, -1.836604, 2.09182, 1, 1, 1, 1, 1,
0.1168171, -0.2397023, 2.78245, 1, 1, 1, 1, 1,
0.1177057, -1.462612, 3.664846, 1, 1, 1, 1, 1,
0.1181497, -0.4498458, 4.574229, 0, 0, 1, 1, 1,
0.1236297, 0.4673716, -0.09781337, 1, 0, 0, 1, 1,
0.1253133, -1.916115, 3.746066, 1, 0, 0, 1, 1,
0.1261839, 0.1813227, 1.414438, 1, 0, 0, 1, 1,
0.1430223, 0.3496059, -2.25037, 1, 0, 0, 1, 1,
0.1493892, 0.6727755, 1.014743, 1, 0, 0, 1, 1,
0.1494252, -0.8875027, 1.935628, 0, 0, 0, 1, 1,
0.1525722, 0.01739599, 2.127335, 0, 0, 0, 1, 1,
0.1574397, -0.3357445, 1.617569, 0, 0, 0, 1, 1,
0.1576296, -1.429781, 1.600105, 0, 0, 0, 1, 1,
0.1596724, 0.2059525, 0.63333, 0, 0, 0, 1, 1,
0.1606759, 0.7132779, 0.1511784, 0, 0, 0, 1, 1,
0.16142, 0.488093, -0.7170579, 0, 0, 0, 1, 1,
0.1671102, -0.3194641, 1.477525, 1, 1, 1, 1, 1,
0.1711789, 1.396089, 3.622484, 1, 1, 1, 1, 1,
0.1779187, -0.08520997, 2.822898, 1, 1, 1, 1, 1,
0.1833521, 0.9344904, 0.9018735, 1, 1, 1, 1, 1,
0.1870887, -0.839591, 3.291681, 1, 1, 1, 1, 1,
0.1885473, -0.2927726, 0.8226995, 1, 1, 1, 1, 1,
0.1899669, 0.1298893, 0.5416146, 1, 1, 1, 1, 1,
0.1912974, 1.465212, -1.539844, 1, 1, 1, 1, 1,
0.1954555, 0.3975852, 1.318072, 1, 1, 1, 1, 1,
0.1981899, -0.9809136, 3.174364, 1, 1, 1, 1, 1,
0.1992536, -1.099066, 3.280666, 1, 1, 1, 1, 1,
0.1996146, 0.1532431, -0.7423612, 1, 1, 1, 1, 1,
0.2004272, -1.849371, 1.376173, 1, 1, 1, 1, 1,
0.2024663, 0.5400687, 0.7412229, 1, 1, 1, 1, 1,
0.20257, 0.7884388, 0.4899854, 1, 1, 1, 1, 1,
0.2043038, -0.5872234, 2.832232, 0, 0, 1, 1, 1,
0.207262, 0.7212636, 0.4320081, 1, 0, 0, 1, 1,
0.2099632, -0.3347011, 3.015106, 1, 0, 0, 1, 1,
0.2110806, -0.8326142, 2.882929, 1, 0, 0, 1, 1,
0.2171065, -0.09999827, 2.605873, 1, 0, 0, 1, 1,
0.2196801, -0.139033, 1.611307, 1, 0, 0, 1, 1,
0.225079, 0.9199945, 1.598605, 0, 0, 0, 1, 1,
0.2295511, -0.914494, 4.348273, 0, 0, 0, 1, 1,
0.2299342, 0.5333313, 1.005902, 0, 0, 0, 1, 1,
0.2312687, 1.567574, -1.166397, 0, 0, 0, 1, 1,
0.2353492, -1.411127, 3.89394, 0, 0, 0, 1, 1,
0.2360279, -0.4806826, 1.511535, 0, 0, 0, 1, 1,
0.2363438, 0.9934611, -1.758832, 0, 0, 0, 1, 1,
0.2375796, 0.5052263, 2.890109, 1, 1, 1, 1, 1,
0.240948, -0.4160981, 1.935586, 1, 1, 1, 1, 1,
0.2427844, -0.4100862, 1.421652, 1, 1, 1, 1, 1,
0.2437901, 0.4018722, -0.1917126, 1, 1, 1, 1, 1,
0.2458944, 2.190577, 0.8533986, 1, 1, 1, 1, 1,
0.247024, 0.5206648, 2.483579, 1, 1, 1, 1, 1,
0.2493384, -2.138513, 3.549675, 1, 1, 1, 1, 1,
0.2513178, -0.791321, 0.7726791, 1, 1, 1, 1, 1,
0.2518882, -1.327111, 3.418459, 1, 1, 1, 1, 1,
0.2543975, 1.443568, 0.1050213, 1, 1, 1, 1, 1,
0.2586605, -0.5824715, 2.308081, 1, 1, 1, 1, 1,
0.259237, -0.4517866, 1.937788, 1, 1, 1, 1, 1,
0.2607159, 0.6393545, -0.4868988, 1, 1, 1, 1, 1,
0.2618931, -0.1874257, 2.806976, 1, 1, 1, 1, 1,
0.2625576, 0.9047761, 0.0326419, 1, 1, 1, 1, 1,
0.2650964, 0.5458772, -0.07961161, 0, 0, 1, 1, 1,
0.2685253, -0.9885125, 2.484276, 1, 0, 0, 1, 1,
0.2698622, 0.4083317, 1.357915, 1, 0, 0, 1, 1,
0.2718223, -0.9136773, 3.497726, 1, 0, 0, 1, 1,
0.2757137, 1.907339, 2.037145, 1, 0, 0, 1, 1,
0.2772677, -1.046443, 3.697791, 1, 0, 0, 1, 1,
0.2807982, -1.584908, 2.7336, 0, 0, 0, 1, 1,
0.2822536, 1.041576, 1.095847, 0, 0, 0, 1, 1,
0.2871756, -1.049256, 0.6027393, 0, 0, 0, 1, 1,
0.2892269, -1.120926, 2.724673, 0, 0, 0, 1, 1,
0.2935154, -0.3289505, 3.691305, 0, 0, 0, 1, 1,
0.2959545, 0.4318933, 3.532551, 0, 0, 0, 1, 1,
0.2961095, 1.736437, -0.643787, 0, 0, 0, 1, 1,
0.2966632, -0.9640651, 3.509747, 1, 1, 1, 1, 1,
0.2967975, 0.7328966, -0.08245827, 1, 1, 1, 1, 1,
0.3001616, 0.3582328, 2.54557, 1, 1, 1, 1, 1,
0.3008892, 0.2804714, -0.03043289, 1, 1, 1, 1, 1,
0.3010144, 1.016151, 1.045349, 1, 1, 1, 1, 1,
0.3019819, 0.04076263, 0.4734244, 1, 1, 1, 1, 1,
0.3034243, 1.164676, 0.8601286, 1, 1, 1, 1, 1,
0.3063193, -1.16661, 2.925736, 1, 1, 1, 1, 1,
0.3085037, 1.034217, 0.2949953, 1, 1, 1, 1, 1,
0.3086581, -0.04082626, 2.01061, 1, 1, 1, 1, 1,
0.3119653, -1.563473, 3.361248, 1, 1, 1, 1, 1,
0.3169082, 0.01798042, 2.629302, 1, 1, 1, 1, 1,
0.3190726, -0.8120277, 3.285136, 1, 1, 1, 1, 1,
0.3232687, 0.4674497, 1.984092, 1, 1, 1, 1, 1,
0.3264216, -0.07693464, 2.668208, 1, 1, 1, 1, 1,
0.3269403, 0.1112312, 0.6372469, 0, 0, 1, 1, 1,
0.3272847, -0.02862049, 2.294538, 1, 0, 0, 1, 1,
0.3302668, -0.3983891, 1.923685, 1, 0, 0, 1, 1,
0.3315034, 0.9641072, -0.1248985, 1, 0, 0, 1, 1,
0.3347035, 0.650416, 0.9989341, 1, 0, 0, 1, 1,
0.3349793, -0.446467, 2.462655, 1, 0, 0, 1, 1,
0.3359082, -0.713719, 2.900382, 0, 0, 0, 1, 1,
0.338898, 1.039781, 2.019371, 0, 0, 0, 1, 1,
0.3395334, -0.4442402, 3.266431, 0, 0, 0, 1, 1,
0.3417442, -0.3244, 0.8862391, 0, 0, 0, 1, 1,
0.342012, -0.8800767, 2.032912, 0, 0, 0, 1, 1,
0.3478562, -1.226383, 2.697529, 0, 0, 0, 1, 1,
0.348745, 0.1046844, 0.0194561, 0, 0, 0, 1, 1,
0.350247, -1.635941, 2.776871, 1, 1, 1, 1, 1,
0.3523208, 0.3340091, 0.0102054, 1, 1, 1, 1, 1,
0.3542045, 0.007257727, 0.6362509, 1, 1, 1, 1, 1,
0.3543978, 0.3723003, -0.08311, 1, 1, 1, 1, 1,
0.3563628, -0.7500482, 2.825603, 1, 1, 1, 1, 1,
0.3564631, 0.2950322, 0.6050406, 1, 1, 1, 1, 1,
0.3565793, 0.3061131, 0.9973617, 1, 1, 1, 1, 1,
0.3648567, 0.858138, -1.034609, 1, 1, 1, 1, 1,
0.3687596, -0.9950055, 1.84244, 1, 1, 1, 1, 1,
0.3705243, 0.5800115, -0.5626853, 1, 1, 1, 1, 1,
0.3740315, -0.3572774, 1.38029, 1, 1, 1, 1, 1,
0.3948902, 1.713111, -1.011324, 1, 1, 1, 1, 1,
0.3972146, -0.320505, 1.138806, 1, 1, 1, 1, 1,
0.3992311, -1.103552, 4.485018, 1, 1, 1, 1, 1,
0.4016856, 0.5701038, 0.6464677, 1, 1, 1, 1, 1,
0.4079073, -0.7238671, 1.130574, 0, 0, 1, 1, 1,
0.414222, 0.9761281, -0.07040788, 1, 0, 0, 1, 1,
0.4154409, 0.1648557, 1.523207, 1, 0, 0, 1, 1,
0.417898, 0.7954391, 0.5832954, 1, 0, 0, 1, 1,
0.4179102, 0.1006734, 1.557849, 1, 0, 0, 1, 1,
0.4208691, -0.2502479, 2.161526, 1, 0, 0, 1, 1,
0.4212357, 1.549386, 0.06192005, 0, 0, 0, 1, 1,
0.4243818, -0.6581653, 5.594507, 0, 0, 0, 1, 1,
0.4260531, -0.131763, 0.6601529, 0, 0, 0, 1, 1,
0.4307278, -0.3222385, 3.601391, 0, 0, 0, 1, 1,
0.433237, 0.1414124, 0.1017332, 0, 0, 0, 1, 1,
0.4334067, 1.668971, 0.2765642, 0, 0, 0, 1, 1,
0.4347466, 0.2622163, 1.758801, 0, 0, 0, 1, 1,
0.4354784, 2.484143, 2.195188, 1, 1, 1, 1, 1,
0.4357641, -2.296058, 3.011482, 1, 1, 1, 1, 1,
0.4372631, 0.7109437, 1.813191, 1, 1, 1, 1, 1,
0.4383834, -0.9366146, 3.142588, 1, 1, 1, 1, 1,
0.4438159, -0.1124535, 1.967021, 1, 1, 1, 1, 1,
0.4455959, 0.719478, 0.5474766, 1, 1, 1, 1, 1,
0.4481031, 1.205075, 0.4969088, 1, 1, 1, 1, 1,
0.4585399, 0.6244938, 1.377218, 1, 1, 1, 1, 1,
0.4594165, 0.2102519, 0.1075435, 1, 1, 1, 1, 1,
0.4623406, 0.292153, 1.693166, 1, 1, 1, 1, 1,
0.4630859, -0.3675354, 2.33567, 1, 1, 1, 1, 1,
0.4638842, -0.5512577, 2.259619, 1, 1, 1, 1, 1,
0.4770475, 0.8132192, -0.1637089, 1, 1, 1, 1, 1,
0.4810499, 0.0844431, 4.140087, 1, 1, 1, 1, 1,
0.4842893, -1.090253, 2.487576, 1, 1, 1, 1, 1,
0.4851982, 1.26526, -0.5659081, 0, 0, 1, 1, 1,
0.4853064, 0.6574778, -0.4810607, 1, 0, 0, 1, 1,
0.4862862, 0.6788017, 1.744907, 1, 0, 0, 1, 1,
0.4875164, -0.04772246, 1.417561, 1, 0, 0, 1, 1,
0.4890801, 0.3975451, -1.95347, 1, 0, 0, 1, 1,
0.4899239, 1.00797, 1.719483, 1, 0, 0, 1, 1,
0.4906819, 0.1862251, 0.9849711, 0, 0, 0, 1, 1,
0.495095, 0.2364529, 1.242018, 0, 0, 0, 1, 1,
0.500926, 1.470798, 0.8451514, 0, 0, 0, 1, 1,
0.5016346, -1.157742, 4.93827, 0, 0, 0, 1, 1,
0.5042835, 0.8978561, 0.7735885, 0, 0, 0, 1, 1,
0.5053459, 0.1141511, 2.081406, 0, 0, 0, 1, 1,
0.5090538, 2.231339, -1.651868, 0, 0, 0, 1, 1,
0.5148355, 2.527115, 0.9152999, 1, 1, 1, 1, 1,
0.5180218, 0.2563054, 0.3937831, 1, 1, 1, 1, 1,
0.5266589, 2.595134, 0.05860748, 1, 1, 1, 1, 1,
0.5526682, -2.835843, 3.324997, 1, 1, 1, 1, 1,
0.5570471, 0.5337722, -0.7725411, 1, 1, 1, 1, 1,
0.5582271, -0.05931792, 3.589217, 1, 1, 1, 1, 1,
0.5600721, 0.3710122, -1.550713, 1, 1, 1, 1, 1,
0.5615714, -0.08526283, 2.525439, 1, 1, 1, 1, 1,
0.563919, 1.720519, 0.607279, 1, 1, 1, 1, 1,
0.5644935, -0.9552999, 1.436998, 1, 1, 1, 1, 1,
0.5678762, -0.6142395, 2.784892, 1, 1, 1, 1, 1,
0.5689656, -0.3104967, 3.133785, 1, 1, 1, 1, 1,
0.5720238, -1.585271, 4.302167, 1, 1, 1, 1, 1,
0.5729952, -0.3981027, 1.98933, 1, 1, 1, 1, 1,
0.5784287, -0.7463416, 3.132848, 1, 1, 1, 1, 1,
0.5789969, -1.458349, 3.409287, 0, 0, 1, 1, 1,
0.5810305, 0.9085535, 0.8096748, 1, 0, 0, 1, 1,
0.5826978, -0.4990577, 2.972242, 1, 0, 0, 1, 1,
0.5843443, -0.4864165, 3.442988, 1, 0, 0, 1, 1,
0.5876014, -1.753956, 1.83984, 1, 0, 0, 1, 1,
0.5903306, -0.1360329, 4.309012, 1, 0, 0, 1, 1,
0.5948899, -0.6210826, 1.582748, 0, 0, 0, 1, 1,
0.5958965, -0.9931704, 3.558883, 0, 0, 0, 1, 1,
0.596929, -1.510534, 2.319063, 0, 0, 0, 1, 1,
0.6021972, 0.3364908, 1.063683, 0, 0, 0, 1, 1,
0.6051171, 1.817397, 0.07256167, 0, 0, 0, 1, 1,
0.605473, -1.49845, 0.9287422, 0, 0, 0, 1, 1,
0.6117323, -2.945751, 3.12201, 0, 0, 0, 1, 1,
0.6155955, -0.4488052, 4.01027, 1, 1, 1, 1, 1,
0.6182749, 1.18004, 0.9365132, 1, 1, 1, 1, 1,
0.6213893, -0.9022686, 3.012068, 1, 1, 1, 1, 1,
0.6221725, 0.8828516, -1.032244, 1, 1, 1, 1, 1,
0.622717, -0.192507, 2.41039, 1, 1, 1, 1, 1,
0.6232628, -0.3943618, 2.402018, 1, 1, 1, 1, 1,
0.6252143, -1.71698, 3.004886, 1, 1, 1, 1, 1,
0.6312413, -0.312012, 2.376679, 1, 1, 1, 1, 1,
0.6341846, 1.441063, 1.142892, 1, 1, 1, 1, 1,
0.6392145, -1.079087, 1.973989, 1, 1, 1, 1, 1,
0.6412865, -0.1740829, 0.2758034, 1, 1, 1, 1, 1,
0.6481218, 1.57851, -0.1874339, 1, 1, 1, 1, 1,
0.6486945, -0.6020324, 3.538082, 1, 1, 1, 1, 1,
0.6521401, -1.376142, 2.218662, 1, 1, 1, 1, 1,
0.653246, 0.8372996, -0.1298906, 1, 1, 1, 1, 1,
0.6538343, 1.491585, 0.5201378, 0, 0, 1, 1, 1,
0.6544229, 0.4355545, 0.4171183, 1, 0, 0, 1, 1,
0.65588, -0.2214244, 3.451175, 1, 0, 0, 1, 1,
0.6560922, 0.4829812, 2.210165, 1, 0, 0, 1, 1,
0.6562862, -0.06544822, 3.07969, 1, 0, 0, 1, 1,
0.657685, -3.160225, 2.557622, 1, 0, 0, 1, 1,
0.6665622, -0.09508949, 2.509437, 0, 0, 0, 1, 1,
0.6670372, -1.946351, 1.002897, 0, 0, 0, 1, 1,
0.6675643, -0.04107744, 1.886109, 0, 0, 0, 1, 1,
0.6780144, -1.707445, 4.885859, 0, 0, 0, 1, 1,
0.6782323, 0.4795898, 1.221716, 0, 0, 0, 1, 1,
0.6814266, -0.7959593, 0.9756561, 0, 0, 0, 1, 1,
0.6817877, 0.3270439, 2.424786, 0, 0, 0, 1, 1,
0.6840298, -0.2740786, 3.194883, 1, 1, 1, 1, 1,
0.6841764, 1.395124, -0.3543738, 1, 1, 1, 1, 1,
0.6868274, -0.8083957, 3.073797, 1, 1, 1, 1, 1,
0.6874016, -0.1966669, 2.96438, 1, 1, 1, 1, 1,
0.6900972, 1.245929, 2.184365, 1, 1, 1, 1, 1,
0.6918346, 0.1593195, 0.7935761, 1, 1, 1, 1, 1,
0.695121, 1.049906, -0.5288613, 1, 1, 1, 1, 1,
0.696123, 1.372716, -0.2170025, 1, 1, 1, 1, 1,
0.6965862, -1.205016, 3.495459, 1, 1, 1, 1, 1,
0.6975823, 1.339656, 0.1131779, 1, 1, 1, 1, 1,
0.6986798, -0.2109651, 1.858737, 1, 1, 1, 1, 1,
0.7010465, 0.09501427, -0.3656339, 1, 1, 1, 1, 1,
0.7016693, -0.4368949, 1.43465, 1, 1, 1, 1, 1,
0.7026306, -0.554696, 0.5056885, 1, 1, 1, 1, 1,
0.7039772, 0.6146061, 0.7667664, 1, 1, 1, 1, 1,
0.7041356, -0.980571, 2.255069, 0, 0, 1, 1, 1,
0.7104064, -0.145578, 0.8995133, 1, 0, 0, 1, 1,
0.7214171, 1.33614, 1.441515, 1, 0, 0, 1, 1,
0.7228343, 1.346336, 0.5898557, 1, 0, 0, 1, 1,
0.7252274, 1.364997, -0.4014134, 1, 0, 0, 1, 1,
0.7257394, -1.788286, 0.6677965, 1, 0, 0, 1, 1,
0.7300136, 1.483672, 0.8957878, 0, 0, 0, 1, 1,
0.7339863, 0.2519551, 0.121501, 0, 0, 0, 1, 1,
0.7380325, -1.417974, 3.13855, 0, 0, 0, 1, 1,
0.7489045, 0.01728124, 1.678199, 0, 0, 0, 1, 1,
0.7570057, 1.461209, -0.5182066, 0, 0, 0, 1, 1,
0.7593893, 0.5784809, 0.937661, 0, 0, 0, 1, 1,
0.7611193, -0.9831555, 1.506106, 0, 0, 0, 1, 1,
0.7618789, 1.32857, -1.521166, 1, 1, 1, 1, 1,
0.7632964, 1.842258, -0.05705905, 1, 1, 1, 1, 1,
0.7639086, 0.1887001, 1.462237, 1, 1, 1, 1, 1,
0.7646479, -0.2973159, 1.796915, 1, 1, 1, 1, 1,
0.7773987, 2.809047, 0.9947489, 1, 1, 1, 1, 1,
0.7832778, -0.2341101, 4.412005, 1, 1, 1, 1, 1,
0.7888793, -0.778411, 0.5550897, 1, 1, 1, 1, 1,
0.7891022, 0.5181692, 2.427774, 1, 1, 1, 1, 1,
0.7935969, 0.9083627, -1.256636, 1, 1, 1, 1, 1,
0.801613, -0.8702163, 2.657044, 1, 1, 1, 1, 1,
0.8037155, 1.420531, 0.009698248, 1, 1, 1, 1, 1,
0.8063174, -1.805278, 2.303868, 1, 1, 1, 1, 1,
0.807547, -0.7105653, 2.145069, 1, 1, 1, 1, 1,
0.8096661, -0.4882714, 3.275101, 1, 1, 1, 1, 1,
0.8136615, 1.042281, -0.1916365, 1, 1, 1, 1, 1,
0.8140188, 0.2545858, 1.933341, 0, 0, 1, 1, 1,
0.8147151, -0.3889082, 2.467007, 1, 0, 0, 1, 1,
0.8177705, 1.589435, -0.4617179, 1, 0, 0, 1, 1,
0.8184125, 1.529606, -0.2958052, 1, 0, 0, 1, 1,
0.8196559, 1.963963, -0.8108045, 1, 0, 0, 1, 1,
0.8229587, -0.1051035, 0.7225347, 1, 0, 0, 1, 1,
0.8244938, 0.8416198, 2.135598, 0, 0, 0, 1, 1,
0.8347725, -0.1445792, 3.616005, 0, 0, 0, 1, 1,
0.8395296, 2.291965, 1.740926, 0, 0, 0, 1, 1,
0.8434653, -1.184671, 3.367365, 0, 0, 0, 1, 1,
0.8476548, -1.539085, 2.429474, 0, 0, 0, 1, 1,
0.8493408, -0.1644342, 2.569206, 0, 0, 0, 1, 1,
0.850413, 0.7639248, 1.144851, 0, 0, 0, 1, 1,
0.8526367, 0.6263638, 2.215519, 1, 1, 1, 1, 1,
0.8565653, -0.1573159, 2.420156, 1, 1, 1, 1, 1,
0.8588809, -0.8441408, 1.861767, 1, 1, 1, 1, 1,
0.8608119, -0.8714609, 4.141442, 1, 1, 1, 1, 1,
0.8672548, 0.05626526, 1.721121, 1, 1, 1, 1, 1,
0.8698804, -0.9181706, 2.560522, 1, 1, 1, 1, 1,
0.8717122, -0.795392, 1.827092, 1, 1, 1, 1, 1,
0.8819755, 1.29547, 1.001009, 1, 1, 1, 1, 1,
0.8833457, -1.694267, 2.992108, 1, 1, 1, 1, 1,
0.8834867, -0.3280565, -0.4239639, 1, 1, 1, 1, 1,
0.8947926, -1.563433, 3.211031, 1, 1, 1, 1, 1,
0.9073964, 1.176244, -0.08718774, 1, 1, 1, 1, 1,
0.9099817, 0.6204084, 2.089391, 1, 1, 1, 1, 1,
0.9100927, -0.6936967, 2.238073, 1, 1, 1, 1, 1,
0.9106002, 0.8365991, -0.673058, 1, 1, 1, 1, 1,
0.9245545, 1.434054, 0.07197566, 0, 0, 1, 1, 1,
0.9348928, -1.207821, 0.4554257, 1, 0, 0, 1, 1,
0.9363567, 0.1105685, -0.4400932, 1, 0, 0, 1, 1,
0.938495, -0.7938421, 1.845335, 1, 0, 0, 1, 1,
0.9488888, 0.6035424, 0.5618406, 1, 0, 0, 1, 1,
0.9582079, 0.9217802, 1.887506, 1, 0, 0, 1, 1,
0.961039, -1.010708, 4.052258, 0, 0, 0, 1, 1,
0.9653774, -0.2643363, 1.733472, 0, 0, 0, 1, 1,
0.9658535, 0.6619633, -0.0512379, 0, 0, 0, 1, 1,
0.9671326, -2.438222, 3.058331, 0, 0, 0, 1, 1,
0.9694138, -0.5157899, 4.628496, 0, 0, 0, 1, 1,
0.977146, 1.469172, -0.4262664, 0, 0, 0, 1, 1,
0.977295, -0.4411281, 0.7993433, 0, 0, 0, 1, 1,
0.9851368, 0.2924926, 1.832726, 1, 1, 1, 1, 1,
0.9867183, 0.3576196, 0.2799647, 1, 1, 1, 1, 1,
0.9927135, -0.8833828, 2.311699, 1, 1, 1, 1, 1,
1.009351, 1.01619, 2.104135, 1, 1, 1, 1, 1,
1.017511, 0.847624, -1.25582, 1, 1, 1, 1, 1,
1.02124, 0.6399804, 0.5523897, 1, 1, 1, 1, 1,
1.024729, 0.3928744, 2.177982, 1, 1, 1, 1, 1,
1.026783, 0.5817965, 1.269728, 1, 1, 1, 1, 1,
1.038416, 0.09306557, 0.6894115, 1, 1, 1, 1, 1,
1.042843, 1.215062, -0.5458942, 1, 1, 1, 1, 1,
1.04373, -0.6193971, 1.582224, 1, 1, 1, 1, 1,
1.051771, -1.200766, 2.414776, 1, 1, 1, 1, 1,
1.053363, -0.7830425, 0.8366656, 1, 1, 1, 1, 1,
1.057463, -0.7320595, 2.262377, 1, 1, 1, 1, 1,
1.065232, -0.682104, 2.113199, 1, 1, 1, 1, 1,
1.070102, -0.08230092, 1.796895, 0, 0, 1, 1, 1,
1.07013, -1.018979, 2.311337, 1, 0, 0, 1, 1,
1.07672, -0.1792238, 2.506309, 1, 0, 0, 1, 1,
1.077512, -0.9608838, 1.592431, 1, 0, 0, 1, 1,
1.085165, -0.5683438, 0.3901379, 1, 0, 0, 1, 1,
1.093018, -0.8746358, 1.88816, 1, 0, 0, 1, 1,
1.093431, 0.3696174, 1.926157, 0, 0, 0, 1, 1,
1.093963, -0.1876121, 2.129239, 0, 0, 0, 1, 1,
1.095857, -0.5970314, 2.26466, 0, 0, 0, 1, 1,
1.100989, -0.3960097, 1.624213, 0, 0, 0, 1, 1,
1.103572, 0.7119191, -1.502124, 0, 0, 0, 1, 1,
1.105528, 0.5025725, -0.5121795, 0, 0, 0, 1, 1,
1.113497, 0.3567725, 1.340758, 0, 0, 0, 1, 1,
1.135226, -0.9177344, 2.090412, 1, 1, 1, 1, 1,
1.135294, -0.4926839, 0.2870641, 1, 1, 1, 1, 1,
1.150277, -0.8749276, 2.578634, 1, 1, 1, 1, 1,
1.157329, 1.470751, 2.068258, 1, 1, 1, 1, 1,
1.161976, -0.214932, 1.675652, 1, 1, 1, 1, 1,
1.17048, 1.561047, 0.7572793, 1, 1, 1, 1, 1,
1.170568, 0.0425032, 1.881563, 1, 1, 1, 1, 1,
1.182758, -1.185893, 0.9737588, 1, 1, 1, 1, 1,
1.198427, -0.00321588, 2.613569, 1, 1, 1, 1, 1,
1.198949, 0.9718398, 0.5525711, 1, 1, 1, 1, 1,
1.210706, -0.1201682, 1.735901, 1, 1, 1, 1, 1,
1.214458, 1.885782, -0.0400774, 1, 1, 1, 1, 1,
1.228813, 0.6443804, -0.4159257, 1, 1, 1, 1, 1,
1.236701, -0.9951428, 3.648083, 1, 1, 1, 1, 1,
1.24183, -0.494902, 2.044349, 1, 1, 1, 1, 1,
1.242421, 1.404952, 1.778711, 0, 0, 1, 1, 1,
1.242772, 1.941967, 0.2695932, 1, 0, 0, 1, 1,
1.243791, 0.9196083, 1.756376, 1, 0, 0, 1, 1,
1.245577, -0.9164436, 2.754515, 1, 0, 0, 1, 1,
1.246175, -1.392493, 2.971683, 1, 0, 0, 1, 1,
1.246679, 0.2044972, 3.34072, 1, 0, 0, 1, 1,
1.267309, 1.518287, -0.3426446, 0, 0, 0, 1, 1,
1.269304, 0.6960063, 0.3611091, 0, 0, 0, 1, 1,
1.269692, 1.772796, -0.1757529, 0, 0, 0, 1, 1,
1.285036, -0.4601513, 1.986809, 0, 0, 0, 1, 1,
1.285043, 0.7124913, -0.6559708, 0, 0, 0, 1, 1,
1.300342, -0.05716847, 0.2681556, 0, 0, 0, 1, 1,
1.305674, -0.472912, 1.262595, 0, 0, 0, 1, 1,
1.310049, -1.172785, 1.057634, 1, 1, 1, 1, 1,
1.3104, 1.614075, -1.599899, 1, 1, 1, 1, 1,
1.318264, -0.9296517, 2.298515, 1, 1, 1, 1, 1,
1.356544, 2.376702, 1.641827, 1, 1, 1, 1, 1,
1.361487, 0.7623805, 1.190905, 1, 1, 1, 1, 1,
1.367872, 0.2128423, 2.243767, 1, 1, 1, 1, 1,
1.389731, -0.9033248, 2.99934, 1, 1, 1, 1, 1,
1.409648, 2.017315, -0.1081335, 1, 1, 1, 1, 1,
1.417977, -0.2895258, 2.248407, 1, 1, 1, 1, 1,
1.418727, 1.29095, 1.790201, 1, 1, 1, 1, 1,
1.421711, 0.3507316, -1.267347, 1, 1, 1, 1, 1,
1.42644, 2.12462, -0.9100972, 1, 1, 1, 1, 1,
1.429675, -0.7097468, 1.89969, 1, 1, 1, 1, 1,
1.435506, 0.006556599, 3.002088, 1, 1, 1, 1, 1,
1.440023, 0.2893938, -0.6296079, 1, 1, 1, 1, 1,
1.441443, 0.1218966, 2.863374, 0, 0, 1, 1, 1,
1.444161, 0.6718943, 3.528827, 1, 0, 0, 1, 1,
1.446399, 0.5397724, 2.071606, 1, 0, 0, 1, 1,
1.44784, 1.264561, 0.831754, 1, 0, 0, 1, 1,
1.455205, -1.148642, 2.7774, 1, 0, 0, 1, 1,
1.46134, -0.555858, 4.126984, 1, 0, 0, 1, 1,
1.469943, 0.2025926, 3.460209, 0, 0, 0, 1, 1,
1.480479, 0.8644612, 0.7395259, 0, 0, 0, 1, 1,
1.492473, 1.022151, 0.89621, 0, 0, 0, 1, 1,
1.492963, 0.1834227, 0.7341256, 0, 0, 0, 1, 1,
1.502701, -0.1101457, 3.275803, 0, 0, 0, 1, 1,
1.521674, -0.7355148, 0.9780231, 0, 0, 0, 1, 1,
1.542954, 1.872918, -0.825129, 0, 0, 0, 1, 1,
1.557354, -1.212502, 0.6236498, 1, 1, 1, 1, 1,
1.565823, 0.07170456, 0.655974, 1, 1, 1, 1, 1,
1.568093, 1.322392, 0.03845556, 1, 1, 1, 1, 1,
1.569688, 0.2612605, 1.726681, 1, 1, 1, 1, 1,
1.573716, -1.169394, 2.650019, 1, 1, 1, 1, 1,
1.577351, -0.4101806, 2.985579, 1, 1, 1, 1, 1,
1.583779, 0.01316228, 2.644984, 1, 1, 1, 1, 1,
1.590709, 0.9555985, 2.523016, 1, 1, 1, 1, 1,
1.606263, -2.284468, 1.772302, 1, 1, 1, 1, 1,
1.61575, 0.1178969, -0.0005755135, 1, 1, 1, 1, 1,
1.642997, 0.6451342, 2.471509, 1, 1, 1, 1, 1,
1.65067, -0.7578319, 2.890611, 1, 1, 1, 1, 1,
1.650767, 1.373304, 0.462195, 1, 1, 1, 1, 1,
1.652622, 0.6413225, 0.5192516, 1, 1, 1, 1, 1,
1.662948, 0.112086, 1.441213, 1, 1, 1, 1, 1,
1.677062, 0.04939275, 1.388373, 0, 0, 1, 1, 1,
1.686594, -0.04519414, 1.251879, 1, 0, 0, 1, 1,
1.728035, -0.9430009, 1.638879, 1, 0, 0, 1, 1,
1.74579, -1.018031, 3.909713, 1, 0, 0, 1, 1,
1.746574, 1.493983, 1.138187, 1, 0, 0, 1, 1,
1.755037, -0.3986463, 3.466222, 1, 0, 0, 1, 1,
1.784399, -0.3939764, -1.144342, 0, 0, 0, 1, 1,
1.788388, 1.354092, 0.8299417, 0, 0, 0, 1, 1,
1.803969, 0.2281501, 1.169267, 0, 0, 0, 1, 1,
1.808834, 0.280261, 1.115745, 0, 0, 0, 1, 1,
1.816517, 0.3879239, 0.8983436, 0, 0, 0, 1, 1,
1.849618, 1.61814, 1.325294, 0, 0, 0, 1, 1,
1.854138, -1.534649, 0.6165884, 0, 0, 0, 1, 1,
1.975676, 0.1023562, 0.7615105, 1, 1, 1, 1, 1,
1.996354, 1.74883, -0.9456935, 1, 1, 1, 1, 1,
1.998433, 0.987203, 1.068456, 1, 1, 1, 1, 1,
2.005, 1.225631, 1.068875, 1, 1, 1, 1, 1,
2.00571, 2.481994, -0.922756, 1, 1, 1, 1, 1,
2.043866, -1.611134, 3.634033, 1, 1, 1, 1, 1,
2.049854, 1.29069, 0.06882417, 1, 1, 1, 1, 1,
2.05455, -0.1708392, 1.120433, 1, 1, 1, 1, 1,
2.090354, 0.1509821, 2.16979, 1, 1, 1, 1, 1,
2.095223, 0.5054289, 1.523483, 1, 1, 1, 1, 1,
2.096303, 1.697428, 0.531006, 1, 1, 1, 1, 1,
2.103103, -0.5747908, 3.928555, 1, 1, 1, 1, 1,
2.117117, 1.624916, 1.372667, 1, 1, 1, 1, 1,
2.124216, -0.1959026, 3.512212, 1, 1, 1, 1, 1,
2.147901, 0.6184498, 2.455613, 1, 1, 1, 1, 1,
2.154822, 0.1051397, 3.041457, 0, 0, 1, 1, 1,
2.155917, 0.6914238, 0.2686079, 1, 0, 0, 1, 1,
2.193634, 0.3754077, 0.9025368, 1, 0, 0, 1, 1,
2.211284, 0.5757496, 2.336641, 1, 0, 0, 1, 1,
2.228423, -1.546146, 1.800013, 1, 0, 0, 1, 1,
2.252099, -0.2835133, 1.098855, 1, 0, 0, 1, 1,
2.266247, -0.3778115, 3.204276, 0, 0, 0, 1, 1,
2.281027, 1.631057, 1.564361, 0, 0, 0, 1, 1,
2.290307, 0.4888599, 2.123953, 0, 0, 0, 1, 1,
2.324476, 0.1977365, 0.8034289, 0, 0, 0, 1, 1,
2.357637, -1.858642, 3.939465, 0, 0, 0, 1, 1,
2.503421, -0.1357924, 2.715757, 0, 0, 0, 1, 1,
2.538156, 0.7591652, 1.285357, 0, 0, 0, 1, 1,
2.584575, 0.9672219, 0.8011877, 1, 1, 1, 1, 1,
2.598692, 0.9024456, -0.5211999, 1, 1, 1, 1, 1,
2.680792, -0.8407731, 2.581858, 1, 1, 1, 1, 1,
2.715681, -1.967759, 1.825022, 1, 1, 1, 1, 1,
2.730453, -1.182857, 0.4285372, 1, 1, 1, 1, 1,
2.733755, -0.02119002, 1.083493, 1, 1, 1, 1, 1,
2.806401, 2.183024, 1.579637, 1, 1, 1, 1, 1
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
var radius = 9.382174;
var distance = 32.95449;
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
mvMatrix.translate( 0.08049285, 0.175589, -0.1320913 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95449);
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
