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
-3.494102, 0.5277634, -0.345856, 1, 0, 0, 1,
-2.983789, -1.239079, -0.3433307, 1, 0.007843138, 0, 1,
-2.886326, -1.014736, -1.568407, 1, 0.01176471, 0, 1,
-2.582762, 1.368841, -1.171075, 1, 0.01960784, 0, 1,
-2.541784, 0.7570424, -1.278824, 1, 0.02352941, 0, 1,
-2.534592, -0.7291759, -0.2060598, 1, 0.03137255, 0, 1,
-2.477666, 1.500063, 0.7361802, 1, 0.03529412, 0, 1,
-2.433954, 0.8199326, -1.97881, 1, 0.04313726, 0, 1,
-2.422771, -1.230814, -3.166262, 1, 0.04705882, 0, 1,
-2.366012, -1.0574, -1.212174, 1, 0.05490196, 0, 1,
-2.277282, -0.4431306, -3.529942, 1, 0.05882353, 0, 1,
-2.264651, -0.6063605, -2.277257, 1, 0.06666667, 0, 1,
-2.231329, -0.8122357, -2.40958, 1, 0.07058824, 0, 1,
-2.121723, -2.340427, -0.9501962, 1, 0.07843138, 0, 1,
-2.090839, 0.1921707, -1.127564, 1, 0.08235294, 0, 1,
-2.080765, 0.6141258, -1.759253, 1, 0.09019608, 0, 1,
-2.061645, 1.651928, -0.249364, 1, 0.09411765, 0, 1,
-2.059855, 0.0822503, -3.472828, 1, 0.1019608, 0, 1,
-2.028257, 0.2964951, -1.914099, 1, 0.1098039, 0, 1,
-2.026706, 0.7582878, -1.233256, 1, 0.1137255, 0, 1,
-2.014822, 0.4264853, -3.338972, 1, 0.1215686, 0, 1,
-2.013149, -1.229106, -4.32495, 1, 0.1254902, 0, 1,
-1.998486, -1.315489, -3.26473, 1, 0.1333333, 0, 1,
-1.992198, -0.8782871, -3.694893, 1, 0.1372549, 0, 1,
-1.968076, 0.6964758, -0.884854, 1, 0.145098, 0, 1,
-1.954114, -0.3620714, -3.091099, 1, 0.1490196, 0, 1,
-1.952002, 0.9938496, -0.817887, 1, 0.1568628, 0, 1,
-1.896917, 0.05010759, -0.4720408, 1, 0.1607843, 0, 1,
-1.853999, -0.4950047, -1.597059, 1, 0.1686275, 0, 1,
-1.833527, -0.4616905, -2.872819, 1, 0.172549, 0, 1,
-1.828665, -0.9159417, -1.911702, 1, 0.1803922, 0, 1,
-1.826156, 0.7279343, -1.557589, 1, 0.1843137, 0, 1,
-1.819914, 0.09226712, -2.665015, 1, 0.1921569, 0, 1,
-1.813384, 0.4688646, -2.274174, 1, 0.1960784, 0, 1,
-1.795264, -1.086318, -0.9939339, 1, 0.2039216, 0, 1,
-1.778708, -1.152601, -2.67879, 1, 0.2117647, 0, 1,
-1.77466, 1.730192, -1.371067, 1, 0.2156863, 0, 1,
-1.770027, 0.1283587, -0.8398218, 1, 0.2235294, 0, 1,
-1.76633, -1.542029, -1.063454, 1, 0.227451, 0, 1,
-1.741533, -0.2715487, -1.714345, 1, 0.2352941, 0, 1,
-1.731645, -0.02888981, -1.342043, 1, 0.2392157, 0, 1,
-1.731502, -0.6811795, -1.995816, 1, 0.2470588, 0, 1,
-1.701412, 0.2521079, -0.7141414, 1, 0.2509804, 0, 1,
-1.684896, 0.4447422, -1.599148, 1, 0.2588235, 0, 1,
-1.676582, 0.970226, -2.881723, 1, 0.2627451, 0, 1,
-1.671363, 0.4516326, -0.4593857, 1, 0.2705882, 0, 1,
-1.665091, -0.3289085, -1.427102, 1, 0.2745098, 0, 1,
-1.662687, -2.421047, -2.728217, 1, 0.282353, 0, 1,
-1.662151, 1.228865, -1.32548, 1, 0.2862745, 0, 1,
-1.653397, -0.5044098, -2.723513, 1, 0.2941177, 0, 1,
-1.646787, 0.495007, -1.842682, 1, 0.3019608, 0, 1,
-1.646178, -0.2090082, -2.094949, 1, 0.3058824, 0, 1,
-1.644615, 0.5993421, -0.02547158, 1, 0.3137255, 0, 1,
-1.643122, -0.3622468, -0.0138077, 1, 0.3176471, 0, 1,
-1.637452, -1.715247, -2.027154, 1, 0.3254902, 0, 1,
-1.626868, 1.966387, -3.631588, 1, 0.3294118, 0, 1,
-1.606963, 0.5941111, -1.462876, 1, 0.3372549, 0, 1,
-1.577002, -0.407219, -1.705158, 1, 0.3411765, 0, 1,
-1.575685, 0.224005, -1.142716, 1, 0.3490196, 0, 1,
-1.575123, 1.092826, -0.3050048, 1, 0.3529412, 0, 1,
-1.533615, 0.7471783, -1.137461, 1, 0.3607843, 0, 1,
-1.521271, 0.2370499, -1.200096, 1, 0.3647059, 0, 1,
-1.51298, 1.469309, -0.089641, 1, 0.372549, 0, 1,
-1.510487, -1.396613, -0.5381524, 1, 0.3764706, 0, 1,
-1.509456, -0.1901439, -2.887367, 1, 0.3843137, 0, 1,
-1.50613, 0.9964421, 0.5367343, 1, 0.3882353, 0, 1,
-1.505133, 0.6584015, -2.318897, 1, 0.3960784, 0, 1,
-1.496244, -0.8567772, -1.624196, 1, 0.4039216, 0, 1,
-1.494089, -0.02715248, -1.605541, 1, 0.4078431, 0, 1,
-1.491796, 0.606934, -2.557567, 1, 0.4156863, 0, 1,
-1.487582, 0.8378134, -0.2727999, 1, 0.4196078, 0, 1,
-1.485254, 0.6785298, -1.959349, 1, 0.427451, 0, 1,
-1.466623, -1.258697, -1.352607, 1, 0.4313726, 0, 1,
-1.464036, 0.2735394, -1.79638, 1, 0.4392157, 0, 1,
-1.454336, -0.3269874, -2.420737, 1, 0.4431373, 0, 1,
-1.449157, -0.5214057, -2.638396, 1, 0.4509804, 0, 1,
-1.441355, -0.6214538, 0.323361, 1, 0.454902, 0, 1,
-1.441086, 0.2497376, -2.134996, 1, 0.4627451, 0, 1,
-1.436093, -0.7626879, -3.045893, 1, 0.4666667, 0, 1,
-1.43462, -2.297126, -1.819863, 1, 0.4745098, 0, 1,
-1.425237, 0.3969429, -0.8261763, 1, 0.4784314, 0, 1,
-1.415537, 1.604688, -0.9323503, 1, 0.4862745, 0, 1,
-1.392433, -0.374838, -2.537867, 1, 0.4901961, 0, 1,
-1.378036, 0.7945663, -0.9640877, 1, 0.4980392, 0, 1,
-1.377199, -2.742248, -2.766057, 1, 0.5058824, 0, 1,
-1.376838, -0.5502014, -2.506333, 1, 0.509804, 0, 1,
-1.375976, -1.075403, -0.9610938, 1, 0.5176471, 0, 1,
-1.372934, -0.02997247, -0.1697284, 1, 0.5215687, 0, 1,
-1.36928, -1.322449, -2.328378, 1, 0.5294118, 0, 1,
-1.361091, -0.5449955, -3.597679, 1, 0.5333334, 0, 1,
-1.357841, 0.2505011, -2.126447, 1, 0.5411765, 0, 1,
-1.35753, -1.244874, -1.82388, 1, 0.5450981, 0, 1,
-1.357391, 0.3148126, -1.175003, 1, 0.5529412, 0, 1,
-1.355547, -0.7729545, -2.144843, 1, 0.5568628, 0, 1,
-1.346668, -0.9675565, -3.997026, 1, 0.5647059, 0, 1,
-1.345294, -0.8374126, -1.576963, 1, 0.5686275, 0, 1,
-1.34441, -0.459144, -0.3953219, 1, 0.5764706, 0, 1,
-1.342524, 1.17107, -1.044641, 1, 0.5803922, 0, 1,
-1.34221, -1.39558, -0.9431871, 1, 0.5882353, 0, 1,
-1.338626, 2.188389, -0.8645018, 1, 0.5921569, 0, 1,
-1.337801, 1.392383, -1.905435, 1, 0.6, 0, 1,
-1.318104, -0.5332467, -2.504081, 1, 0.6078432, 0, 1,
-1.305331, -1.016387, -3.572135, 1, 0.6117647, 0, 1,
-1.302247, 0.5117863, -3.534515, 1, 0.6196079, 0, 1,
-1.291092, 0.5868265, -1.798781, 1, 0.6235294, 0, 1,
-1.26937, 0.6393397, -0.5002477, 1, 0.6313726, 0, 1,
-1.269323, -0.2171974, -1.080307, 1, 0.6352941, 0, 1,
-1.265638, -0.4265425, -3.390345, 1, 0.6431373, 0, 1,
-1.262779, -0.4270617, -3.926774, 1, 0.6470588, 0, 1,
-1.259982, -1.170973, -3.94819, 1, 0.654902, 0, 1,
-1.258688, -0.9504393, -3.834456, 1, 0.6588235, 0, 1,
-1.257927, 0.7514971, -0.7506842, 1, 0.6666667, 0, 1,
-1.249316, 0.1880336, -1.359219, 1, 0.6705883, 0, 1,
-1.24688, -0.1373443, -1.598738, 1, 0.6784314, 0, 1,
-1.242825, -1.443408, -3.25674, 1, 0.682353, 0, 1,
-1.241996, -0.5421519, -2.985562, 1, 0.6901961, 0, 1,
-1.212889, 2.077553, -1.480978, 1, 0.6941177, 0, 1,
-1.206923, -1.651083, -0.7991148, 1, 0.7019608, 0, 1,
-1.205473, 1.844465, -1.545265, 1, 0.7098039, 0, 1,
-1.199833, -1.327969, -3.680754, 1, 0.7137255, 0, 1,
-1.192616, -1.480139, -2.458256, 1, 0.7215686, 0, 1,
-1.190437, 0.538685, -0.7047529, 1, 0.7254902, 0, 1,
-1.188504, -2.41383, -0.3132735, 1, 0.7333333, 0, 1,
-1.179274, 0.9256995, -0.9748945, 1, 0.7372549, 0, 1,
-1.174675, 0.8001457, -1.740261, 1, 0.7450981, 0, 1,
-1.173024, 0.454713, 0.02647741, 1, 0.7490196, 0, 1,
-1.171589, -1.286997, -1.134374, 1, 0.7568628, 0, 1,
-1.166916, -0.3133309, -3.090258, 1, 0.7607843, 0, 1,
-1.159339, -3.001383, -2.755436, 1, 0.7686275, 0, 1,
-1.157935, 0.2294744, -0.6830016, 1, 0.772549, 0, 1,
-1.14568, 0.9078086, -2.503974, 1, 0.7803922, 0, 1,
-1.140322, 0.02410511, -1.861991, 1, 0.7843137, 0, 1,
-1.131891, -0.2773692, -0.7608411, 1, 0.7921569, 0, 1,
-1.114363, -0.1939719, -3.045582, 1, 0.7960784, 0, 1,
-1.113921, -1.313939, -1.460185, 1, 0.8039216, 0, 1,
-1.109811, 0.1737062, -1.211286, 1, 0.8117647, 0, 1,
-1.105774, -0.3802493, -3.059801, 1, 0.8156863, 0, 1,
-1.104395, 0.9212722, -0.650253, 1, 0.8235294, 0, 1,
-1.101637, 0.9608489, -2.114086, 1, 0.827451, 0, 1,
-1.100846, 0.6446942, -2.569201, 1, 0.8352941, 0, 1,
-1.099756, 1.967658, 0.2577367, 1, 0.8392157, 0, 1,
-1.096188, -0.3778976, -0.2195054, 1, 0.8470588, 0, 1,
-1.091021, 0.2520027, -1.834665, 1, 0.8509804, 0, 1,
-1.084134, 0.1056774, -0.8193658, 1, 0.8588235, 0, 1,
-1.082155, 0.031627, -1.90814, 1, 0.8627451, 0, 1,
-1.081824, -0.02894344, -0.2997639, 1, 0.8705882, 0, 1,
-1.081359, -0.8572433, -3.377639, 1, 0.8745098, 0, 1,
-1.079965, -0.3353788, -1.514614, 1, 0.8823529, 0, 1,
-1.077437, 1.084893, -1.617689, 1, 0.8862745, 0, 1,
-1.070703, -0.7259339, -1.677534, 1, 0.8941177, 0, 1,
-1.056437, -1.033564, -0.2153971, 1, 0.8980392, 0, 1,
-1.053335, -0.8290333, -2.693774, 1, 0.9058824, 0, 1,
-1.04798, -1.554393, -3.36901, 1, 0.9137255, 0, 1,
-1.046334, 0.219673, -1.53688, 1, 0.9176471, 0, 1,
-1.044899, 0.7795524, -0.3937089, 1, 0.9254902, 0, 1,
-1.032438, 0.7364144, -1.816797, 1, 0.9294118, 0, 1,
-1.022799, 2.050523, 0.2812307, 1, 0.9372549, 0, 1,
-1.017134, -0.02364514, -1.477732, 1, 0.9411765, 0, 1,
-1.01251, -1.572332, -1.696238, 1, 0.9490196, 0, 1,
-1.01094, -1.48195, -2.684134, 1, 0.9529412, 0, 1,
-1.010939, 0.1331311, -0.840241, 1, 0.9607843, 0, 1,
-1.010398, -0.5134132, -4.084179, 1, 0.9647059, 0, 1,
-1.009277, -0.4172496, -0.04735562, 1, 0.972549, 0, 1,
-1.004917, -1.399112, -2.594096, 1, 0.9764706, 0, 1,
-1.002024, 0.1076789, -2.224076, 1, 0.9843137, 0, 1,
-0.998261, -0.5668168, -2.678629, 1, 0.9882353, 0, 1,
-0.9981847, 0.4717554, -0.2945512, 1, 0.9960784, 0, 1,
-0.9963899, 1.17876, 0.5076041, 0.9960784, 1, 0, 1,
-0.9955505, -0.3176509, -2.712173, 0.9921569, 1, 0, 1,
-0.9943817, 0.4810706, -2.086033, 0.9843137, 1, 0, 1,
-0.9915745, -1.351493, -0.3243842, 0.9803922, 1, 0, 1,
-0.988326, -0.2926221, -1.16198, 0.972549, 1, 0, 1,
-0.9865666, -1.104702, -1.888903, 0.9686275, 1, 0, 1,
-0.9811171, -0.473388, -2.822662, 0.9607843, 1, 0, 1,
-0.9724932, -1.763822, -2.805591, 0.9568627, 1, 0, 1,
-0.971304, -1.472703, -3.689776, 0.9490196, 1, 0, 1,
-0.9707599, -1.404822, -2.966652, 0.945098, 1, 0, 1,
-0.9700072, -0.007181921, -2.716517, 0.9372549, 1, 0, 1,
-0.9649448, 0.7943102, -1.934362, 0.9333333, 1, 0, 1,
-0.9602624, -0.3006549, -3.403668, 0.9254902, 1, 0, 1,
-0.9408031, -0.3592065, -0.1937496, 0.9215686, 1, 0, 1,
-0.9407734, -0.7546995, -1.044921, 0.9137255, 1, 0, 1,
-0.9403555, 0.6360719, -0.6798997, 0.9098039, 1, 0, 1,
-0.9251853, 0.4934065, -0.9497266, 0.9019608, 1, 0, 1,
-0.9246215, 1.184558, 0.1163017, 0.8941177, 1, 0, 1,
-0.9157069, -0.09650624, -0.9747797, 0.8901961, 1, 0, 1,
-0.9076443, -1.346169, -3.365006, 0.8823529, 1, 0, 1,
-0.9042838, 0.897691, -2.363471, 0.8784314, 1, 0, 1,
-0.892469, 1.806517, -1.907229, 0.8705882, 1, 0, 1,
-0.8890512, 0.8652788, -3.21436, 0.8666667, 1, 0, 1,
-0.8882078, 0.00649847, -1.328829, 0.8588235, 1, 0, 1,
-0.8830609, 0.6838711, -2.662978, 0.854902, 1, 0, 1,
-0.8817608, -0.6012155, -4.283414, 0.8470588, 1, 0, 1,
-0.8811694, 0.2076293, -2.68709, 0.8431373, 1, 0, 1,
-0.8810397, -0.9757551, -2.988109, 0.8352941, 1, 0, 1,
-0.8788486, -0.690486, -2.892282, 0.8313726, 1, 0, 1,
-0.8785615, -0.08859216, -2.342108, 0.8235294, 1, 0, 1,
-0.8760774, 0.05982342, -3.455486, 0.8196079, 1, 0, 1,
-0.8750785, -0.8732423, -2.668834, 0.8117647, 1, 0, 1,
-0.871277, -0.7574827, -3.17745, 0.8078431, 1, 0, 1,
-0.868772, -1.205342, -3.89026, 0.8, 1, 0, 1,
-0.8667132, -1.776022, -1.916376, 0.7921569, 1, 0, 1,
-0.8648399, -1.686772, -1.177296, 0.7882353, 1, 0, 1,
-0.8634593, -1.186996, -2.395871, 0.7803922, 1, 0, 1,
-0.8612321, -0.3782609, -2.059585, 0.7764706, 1, 0, 1,
-0.8553894, -0.3418499, -3.271973, 0.7686275, 1, 0, 1,
-0.8492094, 1.181781, 0.4533291, 0.7647059, 1, 0, 1,
-0.8449481, 0.1303551, -0.2414908, 0.7568628, 1, 0, 1,
-0.8402305, 1.281053, -1.703227, 0.7529412, 1, 0, 1,
-0.8390052, 0.4549976, -0.4421855, 0.7450981, 1, 0, 1,
-0.8307869, -0.706221, -2.027447, 0.7411765, 1, 0, 1,
-0.828038, -2.310746, -2.671817, 0.7333333, 1, 0, 1,
-0.8149893, 0.1126787, -1.176317, 0.7294118, 1, 0, 1,
-0.8144624, -0.761187, -0.8967971, 0.7215686, 1, 0, 1,
-0.8108262, -0.5451152, -2.336277, 0.7176471, 1, 0, 1,
-0.8101454, -0.4741461, -2.526521, 0.7098039, 1, 0, 1,
-0.7942054, 1.494348, -1.282046, 0.7058824, 1, 0, 1,
-0.7933413, 0.3312969, -1.071155, 0.6980392, 1, 0, 1,
-0.7894576, -0.9640022, -0.8346347, 0.6901961, 1, 0, 1,
-0.7835773, -0.8339335, -1.593283, 0.6862745, 1, 0, 1,
-0.7797744, -1.447899, -0.2747149, 0.6784314, 1, 0, 1,
-0.779632, -0.3115345, -2.079717, 0.6745098, 1, 0, 1,
-0.7785655, -0.3365671, -2.49325, 0.6666667, 1, 0, 1,
-0.7780246, 0.6739321, -2.540902, 0.6627451, 1, 0, 1,
-0.7702938, 0.3544969, -0.05917833, 0.654902, 1, 0, 1,
-0.7691053, 0.4824407, -0.254058, 0.6509804, 1, 0, 1,
-0.766589, 0.8610116, -1.448602, 0.6431373, 1, 0, 1,
-0.7662719, -0.5380802, -1.923462, 0.6392157, 1, 0, 1,
-0.7622498, 0.08639925, -1.208866, 0.6313726, 1, 0, 1,
-0.7618149, -0.06640244, -3.205854, 0.627451, 1, 0, 1,
-0.757798, -0.2093335, -2.10633, 0.6196079, 1, 0, 1,
-0.7575138, 0.8581012, -1.293582, 0.6156863, 1, 0, 1,
-0.7535765, 0.8365118, 0.3282566, 0.6078432, 1, 0, 1,
-0.7502593, 0.6855732, -1.156616, 0.6039216, 1, 0, 1,
-0.7459438, 1.361384, -1.006844, 0.5960785, 1, 0, 1,
-0.7458799, 0.3408614, 0.08709444, 0.5882353, 1, 0, 1,
-0.7444344, 1.768104, -1.658898, 0.5843138, 1, 0, 1,
-0.7438235, 0.2351539, -0.8451549, 0.5764706, 1, 0, 1,
-0.7416532, -0.1939363, -0.1962034, 0.572549, 1, 0, 1,
-0.7410001, 0.2884757, -2.191274, 0.5647059, 1, 0, 1,
-0.7398245, 0.422195, 0.6709878, 0.5607843, 1, 0, 1,
-0.7394935, 0.4642964, 1.083797, 0.5529412, 1, 0, 1,
-0.7390119, -0.4802862, -2.654123, 0.5490196, 1, 0, 1,
-0.7387199, 1.498591, -2.051136, 0.5411765, 1, 0, 1,
-0.7361987, 0.1534631, -0.6768076, 0.5372549, 1, 0, 1,
-0.7292923, -0.4632329, -1.848739, 0.5294118, 1, 0, 1,
-0.7284549, 0.608444, -0.5589074, 0.5254902, 1, 0, 1,
-0.7278384, -0.1097291, -0.7728591, 0.5176471, 1, 0, 1,
-0.720713, -1.216626, -3.49932, 0.5137255, 1, 0, 1,
-0.7171746, -0.1108641, -2.971576, 0.5058824, 1, 0, 1,
-0.7138386, 0.6815528, -1.34955, 0.5019608, 1, 0, 1,
-0.7119119, -0.6414561, -1.847891, 0.4941176, 1, 0, 1,
-0.7093211, -0.5929266, -2.165993, 0.4862745, 1, 0, 1,
-0.6969537, 0.479211, -2.699147, 0.4823529, 1, 0, 1,
-0.6954673, -0.3972635, -2.187795, 0.4745098, 1, 0, 1,
-0.6954631, -0.117846, -1.657023, 0.4705882, 1, 0, 1,
-0.6951578, 0.736757, -0.9064482, 0.4627451, 1, 0, 1,
-0.6856945, 1.850725, -1.311106, 0.4588235, 1, 0, 1,
-0.6834968, -0.06833683, -1.93058, 0.4509804, 1, 0, 1,
-0.6810277, -1.407682, -3.749047, 0.4470588, 1, 0, 1,
-0.6708127, -0.009314016, -1.508497, 0.4392157, 1, 0, 1,
-0.6695355, -0.423573, -1.667772, 0.4352941, 1, 0, 1,
-0.6678621, 0.07997784, -2.893346, 0.427451, 1, 0, 1,
-0.6673781, -1.67423, -3.750521, 0.4235294, 1, 0, 1,
-0.6663269, 0.2122273, -1.813092, 0.4156863, 1, 0, 1,
-0.6624553, 0.912854, -0.666032, 0.4117647, 1, 0, 1,
-0.6574068, -0.00933332, -2.380537, 0.4039216, 1, 0, 1,
-0.6566828, 1.163896, 0.9208298, 0.3960784, 1, 0, 1,
-0.6559188, 0.8705906, 0.2639294, 0.3921569, 1, 0, 1,
-0.6558989, 1.57933, 0.3290049, 0.3843137, 1, 0, 1,
-0.6556057, 0.6781985, -1.127292, 0.3803922, 1, 0, 1,
-0.6541142, 0.8148324, -0.3926012, 0.372549, 1, 0, 1,
-0.6534172, 0.4218227, -1.298863, 0.3686275, 1, 0, 1,
-0.6526793, -1.219586, -2.16563, 0.3607843, 1, 0, 1,
-0.650968, 0.340402, -1.421809, 0.3568628, 1, 0, 1,
-0.6493334, 1.400848, -1.671591, 0.3490196, 1, 0, 1,
-0.6477237, 0.2161322, -0.4558056, 0.345098, 1, 0, 1,
-0.6472583, -0.1291431, -1.909855, 0.3372549, 1, 0, 1,
-0.6468009, -0.8470899, -3.122295, 0.3333333, 1, 0, 1,
-0.6226836, 0.4651484, -0.5921278, 0.3254902, 1, 0, 1,
-0.6168534, -0.822217, -2.78131, 0.3215686, 1, 0, 1,
-0.6113261, -0.1103821, -2.030728, 0.3137255, 1, 0, 1,
-0.6084428, -0.2119666, -2.129071, 0.3098039, 1, 0, 1,
-0.6072608, -1.212508, -2.822408, 0.3019608, 1, 0, 1,
-0.6066526, 0.1768574, -0.38899, 0.2941177, 1, 0, 1,
-0.6051542, 1.730946, 0.3620026, 0.2901961, 1, 0, 1,
-0.5988203, 0.3807784, -0.8775794, 0.282353, 1, 0, 1,
-0.5942588, 1.297298, -2.759664, 0.2784314, 1, 0, 1,
-0.5891112, -0.7500983, -2.389793, 0.2705882, 1, 0, 1,
-0.5890986, -0.9945768, -2.786746, 0.2666667, 1, 0, 1,
-0.5815023, -0.6347957, -1.939818, 0.2588235, 1, 0, 1,
-0.5776471, -2.03887, -2.371238, 0.254902, 1, 0, 1,
-0.576153, 1.098897, 0.1627045, 0.2470588, 1, 0, 1,
-0.572117, 1.457189, -0.08776508, 0.2431373, 1, 0, 1,
-0.5674592, 2.697023, -1.169272, 0.2352941, 1, 0, 1,
-0.563638, 0.7048094, 1.337766, 0.2313726, 1, 0, 1,
-0.5508993, 0.07294571, -1.023158, 0.2235294, 1, 0, 1,
-0.5502775, -0.1955753, -2.952553, 0.2196078, 1, 0, 1,
-0.5493997, 0.7466524, -0.06408485, 0.2117647, 1, 0, 1,
-0.5490571, 1.007678, 0.1311297, 0.2078431, 1, 0, 1,
-0.5476031, -0.8255816, -1.114454, 0.2, 1, 0, 1,
-0.5461859, 0.09107362, -1.706329, 0.1921569, 1, 0, 1,
-0.5428067, 0.3168863, -1.578927, 0.1882353, 1, 0, 1,
-0.5399907, -0.2773556, -1.529429, 0.1803922, 1, 0, 1,
-0.5391007, -1.462608, -3.208394, 0.1764706, 1, 0, 1,
-0.5370311, -1.204178, -2.670212, 0.1686275, 1, 0, 1,
-0.5366114, 0.5656336, -2.452976, 0.1647059, 1, 0, 1,
-0.5312348, 0.7909186, 0.09521075, 0.1568628, 1, 0, 1,
-0.5267282, -1.844623, -3.808833, 0.1529412, 1, 0, 1,
-0.5260698, -0.1350404, 0.407974, 0.145098, 1, 0, 1,
-0.5217785, 1.003498, -1.725593, 0.1411765, 1, 0, 1,
-0.5201015, 0.08650385, -1.433244, 0.1333333, 1, 0, 1,
-0.5161635, -1.070122, -1.99921, 0.1294118, 1, 0, 1,
-0.5158551, 0.7360972, -1.422907, 0.1215686, 1, 0, 1,
-0.5059359, -1.29524, -1.130308, 0.1176471, 1, 0, 1,
-0.4999974, 1.307368, -0.4694705, 0.1098039, 1, 0, 1,
-0.4910134, -1.049287, -1.720507, 0.1058824, 1, 0, 1,
-0.4892234, 0.1929376, -1.330727, 0.09803922, 1, 0, 1,
-0.4808408, 1.792623, -1.614473, 0.09019608, 1, 0, 1,
-0.4800603, -0.3108317, -3.764693, 0.08627451, 1, 0, 1,
-0.4753269, -1.093566, -2.699684, 0.07843138, 1, 0, 1,
-0.4750407, -0.1955588, -3.45071, 0.07450981, 1, 0, 1,
-0.4743437, 0.3573842, -0.4843409, 0.06666667, 1, 0, 1,
-0.469418, -1.290985, -2.328856, 0.0627451, 1, 0, 1,
-0.4615768, -0.992169, -1.109581, 0.05490196, 1, 0, 1,
-0.4603594, 1.725739, -1.834433, 0.05098039, 1, 0, 1,
-0.4593488, -0.6498582, -4.219411, 0.04313726, 1, 0, 1,
-0.4564848, 0.9776258, -1.988034, 0.03921569, 1, 0, 1,
-0.4533675, -1.424958, -3.077678, 0.03137255, 1, 0, 1,
-0.4529807, -0.7209994, -2.029366, 0.02745098, 1, 0, 1,
-0.4518923, -0.09255327, -2.810518, 0.01960784, 1, 0, 1,
-0.4480864, -1.334479, -2.910486, 0.01568628, 1, 0, 1,
-0.4441667, -0.9684755, -2.804352, 0.007843138, 1, 0, 1,
-0.4433956, -1.450035, -3.148206, 0.003921569, 1, 0, 1,
-0.4404694, -0.8138015, -2.312743, 0, 1, 0.003921569, 1,
-0.4349902, 1.237149, -0.2645062, 0, 1, 0.01176471, 1,
-0.4259541, -2.311013, -1.798865, 0, 1, 0.01568628, 1,
-0.4257754, -0.3033238, -2.261622, 0, 1, 0.02352941, 1,
-0.4222435, -1.544323, -2.252409, 0, 1, 0.02745098, 1,
-0.4178179, 0.7802269, -1.039085, 0, 1, 0.03529412, 1,
-0.4166997, 0.6719114, 0.3972681, 0, 1, 0.03921569, 1,
-0.415308, 0.1419838, -1.18222, 0, 1, 0.04705882, 1,
-0.4130283, -1.043258, -2.503942, 0, 1, 0.05098039, 1,
-0.4102404, -1.394413, -3.319229, 0, 1, 0.05882353, 1,
-0.4008041, 0.9504181, 1.048314, 0, 1, 0.0627451, 1,
-0.3966568, -0.1301731, -1.235283, 0, 1, 0.07058824, 1,
-0.3949802, 0.39742, 0.4567898, 0, 1, 0.07450981, 1,
-0.3894956, -0.9667345, -2.438774, 0, 1, 0.08235294, 1,
-0.3880738, -0.9400825, -1.701487, 0, 1, 0.08627451, 1,
-0.3856136, -0.2346112, 0.7164949, 0, 1, 0.09411765, 1,
-0.3810466, -0.4470796, -3.461716, 0, 1, 0.1019608, 1,
-0.3786007, -0.1395237, -2.595892, 0, 1, 0.1058824, 1,
-0.3782171, 0.2070704, -2.463815, 0, 1, 0.1137255, 1,
-0.3771902, 0.8298806, -1.118148, 0, 1, 0.1176471, 1,
-0.3759295, -0.4322205, -1.894863, 0, 1, 0.1254902, 1,
-0.369331, 0.4623504, -2.00953, 0, 1, 0.1294118, 1,
-0.3660442, 0.7035356, -0.3823192, 0, 1, 0.1372549, 1,
-0.3654914, 0.1688031, -3.033794, 0, 1, 0.1411765, 1,
-0.3646455, -0.4584506, -2.391276, 0, 1, 0.1490196, 1,
-0.3633866, 0.8276404, -0.9643293, 0, 1, 0.1529412, 1,
-0.3615463, -1.640171, -3.31116, 0, 1, 0.1607843, 1,
-0.3607244, -1.809422, -1.168962, 0, 1, 0.1647059, 1,
-0.3601539, -0.9032907, -3.532089, 0, 1, 0.172549, 1,
-0.3600279, 0.1097314, -0.4024305, 0, 1, 0.1764706, 1,
-0.3588942, -0.2663369, -2.375142, 0, 1, 0.1843137, 1,
-0.3574409, -0.2842595, -0.647665, 0, 1, 0.1882353, 1,
-0.3571298, 0.6282598, -1.033783, 0, 1, 0.1960784, 1,
-0.3562318, 0.5943499, -1.64007, 0, 1, 0.2039216, 1,
-0.3556062, 0.3012742, -0.1524587, 0, 1, 0.2078431, 1,
-0.3551827, -0.655165, -2.219323, 0, 1, 0.2156863, 1,
-0.348473, 0.1249493, -0.3007155, 0, 1, 0.2196078, 1,
-0.3436992, 0.8000007, 0.3051589, 0, 1, 0.227451, 1,
-0.3433166, -0.440072, -0.7203024, 0, 1, 0.2313726, 1,
-0.3381088, -0.2171086, -1.798147, 0, 1, 0.2392157, 1,
-0.3379266, 1.211648, -1.11039, 0, 1, 0.2431373, 1,
-0.3363423, -0.5794653, -3.553135, 0, 1, 0.2509804, 1,
-0.3353409, -0.7440929, -3.418295, 0, 1, 0.254902, 1,
-0.3350279, 0.9770498, -1.184568, 0, 1, 0.2627451, 1,
-0.3342236, 1.222202, 0.5731573, 0, 1, 0.2666667, 1,
-0.3311009, 0.4991944, -0.7778851, 0, 1, 0.2745098, 1,
-0.3274049, 1.270343, 1.57184, 0, 1, 0.2784314, 1,
-0.321645, -0.5577378, -3.32352, 0, 1, 0.2862745, 1,
-0.3188493, -1.748572, -3.878621, 0, 1, 0.2901961, 1,
-0.3102581, -2.766824, -3.863618, 0, 1, 0.2980392, 1,
-0.3079081, -1.330093, -2.463096, 0, 1, 0.3058824, 1,
-0.3072236, -0.6946503, -3.240335, 0, 1, 0.3098039, 1,
-0.3070742, -0.556577, -2.637329, 0, 1, 0.3176471, 1,
-0.3060738, 1.331891, -0.8897455, 0, 1, 0.3215686, 1,
-0.2974083, 0.6330932, -0.9005688, 0, 1, 0.3294118, 1,
-0.2934656, 1.00105, 0.1388509, 0, 1, 0.3333333, 1,
-0.289748, 0.8501621, 0.6447938, 0, 1, 0.3411765, 1,
-0.2856181, 0.3195045, -0.9598215, 0, 1, 0.345098, 1,
-0.28049, -0.4201847, -1.404469, 0, 1, 0.3529412, 1,
-0.2798951, 1.090793, 0.3376449, 0, 1, 0.3568628, 1,
-0.2726778, 1.05393, 1.730373, 0, 1, 0.3647059, 1,
-0.2676361, 0.2178573, -1.550077, 0, 1, 0.3686275, 1,
-0.2585335, 0.1280329, -1.573626, 0, 1, 0.3764706, 1,
-0.2568848, 1.445615, 0.5600517, 0, 1, 0.3803922, 1,
-0.2507207, 0.2434629, -0.5915251, 0, 1, 0.3882353, 1,
-0.249735, 0.7176029, -0.240162, 0, 1, 0.3921569, 1,
-0.2478492, -1.248853, -2.636618, 0, 1, 0.4, 1,
-0.2471208, -1.905568, -2.664112, 0, 1, 0.4078431, 1,
-0.2442189, -0.3311698, -3.850441, 0, 1, 0.4117647, 1,
-0.2434419, -0.5500719, -3.420665, 0, 1, 0.4196078, 1,
-0.2348192, 1.160165, 0.235365, 0, 1, 0.4235294, 1,
-0.2281588, -0.2533879, -3.835784, 0, 1, 0.4313726, 1,
-0.2269677, -0.3967571, -3.78774, 0, 1, 0.4352941, 1,
-0.2263279, -1.589617, -3.037658, 0, 1, 0.4431373, 1,
-0.2253088, 0.9386387, -0.47586, 0, 1, 0.4470588, 1,
-0.2251021, -0.278991, -3.308074, 0, 1, 0.454902, 1,
-0.2225252, -0.4511239, -2.620078, 0, 1, 0.4588235, 1,
-0.2172517, 0.8333303, 0.3451706, 0, 1, 0.4666667, 1,
-0.2125945, 1.018891, -1.719708, 0, 1, 0.4705882, 1,
-0.2113722, 1.85321, 0.2077193, 0, 1, 0.4784314, 1,
-0.2077807, -0.5301828, -1.729388, 0, 1, 0.4823529, 1,
-0.2040968, -1.255947, -1.865011, 0, 1, 0.4901961, 1,
-0.2008483, 0.2859928, 0.635268, 0, 1, 0.4941176, 1,
-0.1974916, -0.02355477, -2.252595, 0, 1, 0.5019608, 1,
-0.1940797, -1.102754, -3.037867, 0, 1, 0.509804, 1,
-0.1906597, -0.8553753, -3.799902, 0, 1, 0.5137255, 1,
-0.1841737, -2.047586, -2.808038, 0, 1, 0.5215687, 1,
-0.179092, 0.6769641, 0.2548005, 0, 1, 0.5254902, 1,
-0.1718837, -0.7475359, -3.312687, 0, 1, 0.5333334, 1,
-0.1704024, -0.3221967, -2.978486, 0, 1, 0.5372549, 1,
-0.1694613, 1.636594, -1.725988, 0, 1, 0.5450981, 1,
-0.1689917, 0.459829, 0.9735242, 0, 1, 0.5490196, 1,
-0.1638254, -1.325978, -3.564603, 0, 1, 0.5568628, 1,
-0.1608124, 0.5151584, -0.4336013, 0, 1, 0.5607843, 1,
-0.1602253, -0.6022198, -2.389886, 0, 1, 0.5686275, 1,
-0.1594816, -0.8296261, -2.380617, 0, 1, 0.572549, 1,
-0.1589768, 0.4000023, 1.678061, 0, 1, 0.5803922, 1,
-0.1568719, 0.5958608, -0.4591421, 0, 1, 0.5843138, 1,
-0.1554496, 1.179488, 0.108956, 0, 1, 0.5921569, 1,
-0.1457036, -0.6890301, -3.56777, 0, 1, 0.5960785, 1,
-0.1445946, 2.413532, 0.2433404, 0, 1, 0.6039216, 1,
-0.143861, -1.075888, -2.532116, 0, 1, 0.6117647, 1,
-0.1401209, 0.04535135, -1.855309, 0, 1, 0.6156863, 1,
-0.1385106, -0.1104567, -2.529385, 0, 1, 0.6235294, 1,
-0.1348105, -0.8174296, -2.806883, 0, 1, 0.627451, 1,
-0.1331852, -1.137357, -4.204435, 0, 1, 0.6352941, 1,
-0.1295708, -1.643839, -3.681796, 0, 1, 0.6392157, 1,
-0.1291763, 1.453083, 0.7887357, 0, 1, 0.6470588, 1,
-0.1287399, 1.120446, -1.286242, 0, 1, 0.6509804, 1,
-0.1260114, 0.5637498, -0.4009895, 0, 1, 0.6588235, 1,
-0.1257784, 0.2492169, 0.4158773, 0, 1, 0.6627451, 1,
-0.1250669, -1.094612, -1.458377, 0, 1, 0.6705883, 1,
-0.1246714, 0.8729529, -0.5243766, 0, 1, 0.6745098, 1,
-0.1213429, -3.19576, -3.43585, 0, 1, 0.682353, 1,
-0.1186999, 1.736387, -1.126152, 0, 1, 0.6862745, 1,
-0.1166968, 1.97112, -1.99855, 0, 1, 0.6941177, 1,
-0.1146719, 0.06767059, 0.006947927, 0, 1, 0.7019608, 1,
-0.1109395, 0.8630418, 0.3100238, 0, 1, 0.7058824, 1,
-0.09992616, 0.4982003, 0.7710391, 0, 1, 0.7137255, 1,
-0.09970332, -0.1423903, -4.309888, 0, 1, 0.7176471, 1,
-0.09828182, 0.2619038, 0.7158724, 0, 1, 0.7254902, 1,
-0.09107682, -2.202505, -2.490069, 0, 1, 0.7294118, 1,
-0.0882503, 0.2635059, -0.183409, 0, 1, 0.7372549, 1,
-0.08722599, -0.006169265, -2.722252, 0, 1, 0.7411765, 1,
-0.08668344, 0.3527828, -0.2400689, 0, 1, 0.7490196, 1,
-0.08094542, -0.9241161, -2.322972, 0, 1, 0.7529412, 1,
-0.07920841, 1.87286, 0.7197257, 0, 1, 0.7607843, 1,
-0.06884632, -0.7014859, -2.411738, 0, 1, 0.7647059, 1,
-0.06880256, -0.7245986, -3.098406, 0, 1, 0.772549, 1,
-0.06624145, 0.231463, 1.081206, 0, 1, 0.7764706, 1,
-0.06110997, -0.6839045, -4.096519, 0, 1, 0.7843137, 1,
-0.06005653, -0.4542688, -2.266333, 0, 1, 0.7882353, 1,
-0.05261284, -0.1870527, -4.661503, 0, 1, 0.7960784, 1,
-0.05161053, -0.3901611, -3.95681, 0, 1, 0.8039216, 1,
-0.04991582, 0.2775175, -0.1233468, 0, 1, 0.8078431, 1,
-0.04630521, -0.4276533, -2.348442, 0, 1, 0.8156863, 1,
-0.04614409, 0.007200548, -0.8062082, 0, 1, 0.8196079, 1,
-0.04522574, 0.0701414, -0.49531, 0, 1, 0.827451, 1,
-0.0397347, -0.8538386, -3.26428, 0, 1, 0.8313726, 1,
-0.03899887, -0.1656013, -1.264872, 0, 1, 0.8392157, 1,
-0.03421955, 0.200247, 0.3695874, 0, 1, 0.8431373, 1,
-0.0310865, 0.4044665, 2.169139, 0, 1, 0.8509804, 1,
-0.02987145, 1.019256, -0.2268303, 0, 1, 0.854902, 1,
-0.02972098, -2.71516, -5.905952, 0, 1, 0.8627451, 1,
-0.02028372, 0.150953, 0.2833352, 0, 1, 0.8666667, 1,
-0.01487165, -1.339681, -3.784749, 0, 1, 0.8745098, 1,
-0.01376957, 0.3160733, -0.1407369, 0, 1, 0.8784314, 1,
-0.01192236, -0.1372946, -4.521609, 0, 1, 0.8862745, 1,
-0.01109307, 0.414756, 0.09013473, 0, 1, 0.8901961, 1,
-0.007536941, 1.878932, 0.5201392, 0, 1, 0.8980392, 1,
-0.005973231, -0.5190823, -4.064553, 0, 1, 0.9058824, 1,
-0.003214468, -0.2430103, -3.457591, 0, 1, 0.9098039, 1,
-0.0001070788, 0.2271971, -0.5033959, 0, 1, 0.9176471, 1,
0.0002679648, -1.255823, 2.343153, 0, 1, 0.9215686, 1,
0.002550173, -1.710098, 4.335495, 0, 1, 0.9294118, 1,
0.005181149, -0.274039, 4.060912, 0, 1, 0.9333333, 1,
0.01165468, -0.132308, 2.915186, 0, 1, 0.9411765, 1,
0.01242662, 0.4472328, 0.4372672, 0, 1, 0.945098, 1,
0.01255996, -0.1578522, 3.508754, 0, 1, 0.9529412, 1,
0.01310824, -0.06431087, 3.174917, 0, 1, 0.9568627, 1,
0.01320123, 0.3990045, 0.3674788, 0, 1, 0.9647059, 1,
0.01446658, 0.2200356, 0.3446169, 0, 1, 0.9686275, 1,
0.02428093, -0.5113115, 4.50802, 0, 1, 0.9764706, 1,
0.02555347, 1.064533, -1.702594, 0, 1, 0.9803922, 1,
0.02674441, -0.2422965, 2.818401, 0, 1, 0.9882353, 1,
0.02772072, -0.6917952, 2.182594, 0, 1, 0.9921569, 1,
0.0294073, 1.077284, -1.243893, 0, 1, 1, 1,
0.03494679, 0.8291795, -0.6463194, 0, 0.9921569, 1, 1,
0.03968709, 0.212136, 0.09362714, 0, 0.9882353, 1, 1,
0.04094085, -0.297844, 4.234676, 0, 0.9803922, 1, 1,
0.04120733, -0.05328603, 2.774375, 0, 0.9764706, 1, 1,
0.04145792, 0.9514892, 1.365377, 0, 0.9686275, 1, 1,
0.04573043, -0.1820482, 2.034144, 0, 0.9647059, 1, 1,
0.04701082, 0.3737981, 0.8786848, 0, 0.9568627, 1, 1,
0.05217607, 0.06819235, 1.114487, 0, 0.9529412, 1, 1,
0.05314352, -0.3104876, 4.404293, 0, 0.945098, 1, 1,
0.05376457, -1.076118, 3.857944, 0, 0.9411765, 1, 1,
0.05433757, -0.4627425, 3.450801, 0, 0.9333333, 1, 1,
0.05598919, -0.5141727, 2.873785, 0, 0.9294118, 1, 1,
0.06204508, 1.386593, 1.132208, 0, 0.9215686, 1, 1,
0.06471312, -1.362385, 3.36997, 0, 0.9176471, 1, 1,
0.06517633, -1.333035, 3.310291, 0, 0.9098039, 1, 1,
0.06627702, -1.687079, 4.80099, 0, 0.9058824, 1, 1,
0.0755981, 1.155201, 1.61321, 0, 0.8980392, 1, 1,
0.07850003, 1.020208, -1.883252, 0, 0.8901961, 1, 1,
0.07938453, -0.1468617, 4.641626, 0, 0.8862745, 1, 1,
0.08043931, 0.190256, -1.175399, 0, 0.8784314, 1, 1,
0.08107336, -0.7540336, 3.811419, 0, 0.8745098, 1, 1,
0.08107641, 0.1747386, 1.132423, 0, 0.8666667, 1, 1,
0.08230142, -0.6625035, 2.561059, 0, 0.8627451, 1, 1,
0.08478, -0.7272928, 2.169168, 0, 0.854902, 1, 1,
0.08489016, 0.05865015, -0.8696246, 0, 0.8509804, 1, 1,
0.08671658, -0.3757854, 3.148204, 0, 0.8431373, 1, 1,
0.09057268, -0.06440783, 2.486397, 0, 0.8392157, 1, 1,
0.0949184, -1.329677, 2.958734, 0, 0.8313726, 1, 1,
0.09621266, -0.06087224, 4.724392, 0, 0.827451, 1, 1,
0.09636746, 0.4452417, -0.5851671, 0, 0.8196079, 1, 1,
0.1002068, 0.8931935, 1.132472, 0, 0.8156863, 1, 1,
0.1008994, -1.268467, 2.23822, 0, 0.8078431, 1, 1,
0.1019913, 0.3988104, -0.6253875, 0, 0.8039216, 1, 1,
0.1031814, -0.2664849, 2.522433, 0, 0.7960784, 1, 1,
0.1038601, 1.451992, 0.07693349, 0, 0.7882353, 1, 1,
0.104707, -1.008718, 3.275219, 0, 0.7843137, 1, 1,
0.108195, -0.6239391, 1.239551, 0, 0.7764706, 1, 1,
0.1082993, 0.5945221, -0.05659341, 0, 0.772549, 1, 1,
0.1109437, -0.5860441, 0.398792, 0, 0.7647059, 1, 1,
0.1123039, 0.5043981, -0.2638964, 0, 0.7607843, 1, 1,
0.1123154, -1.234546, 1.664447, 0, 0.7529412, 1, 1,
0.1240862, 1.307174, 2.173373, 0, 0.7490196, 1, 1,
0.1266224, 0.8730712, 1.520156, 0, 0.7411765, 1, 1,
0.1276447, -2.219069, 3.312978, 0, 0.7372549, 1, 1,
0.1296275, 1.193899, -0.6557879, 0, 0.7294118, 1, 1,
0.1405445, 2.180509, 0.04482782, 0, 0.7254902, 1, 1,
0.1413767, -0.5183244, 2.746434, 0, 0.7176471, 1, 1,
0.1439152, -2.642089, 3.108966, 0, 0.7137255, 1, 1,
0.1459489, 0.2491679, 0.9402274, 0, 0.7058824, 1, 1,
0.1493509, -1.096557, 3.913366, 0, 0.6980392, 1, 1,
0.1522702, -2.271028, 1.853978, 0, 0.6941177, 1, 1,
0.1572267, 0.905373, 0.3655851, 0, 0.6862745, 1, 1,
0.1593089, -0.6860623, 2.181899, 0, 0.682353, 1, 1,
0.160387, 0.6019565, 1.10738, 0, 0.6745098, 1, 1,
0.1608787, -1.252808, 1.380857, 0, 0.6705883, 1, 1,
0.1672011, 1.312321, -0.3756776, 0, 0.6627451, 1, 1,
0.1722869, -1.27492, 1.628919, 0, 0.6588235, 1, 1,
0.1730474, -0.2141098, 5.31691, 0, 0.6509804, 1, 1,
0.1730736, 0.9456041, 0.01929787, 0, 0.6470588, 1, 1,
0.1747908, -1.032679, 2.825766, 0, 0.6392157, 1, 1,
0.1754718, -0.7435129, 3.027026, 0, 0.6352941, 1, 1,
0.1806523, 0.2492058, 1.247923, 0, 0.627451, 1, 1,
0.1811813, 0.9989673, 0.6181647, 0, 0.6235294, 1, 1,
0.1901224, -1.383245, 3.942158, 0, 0.6156863, 1, 1,
0.1901496, 0.2975509, -0.4584325, 0, 0.6117647, 1, 1,
0.1917566, -0.6908282, 2.113631, 0, 0.6039216, 1, 1,
0.1944116, -0.2371017, 2.865905, 0, 0.5960785, 1, 1,
0.1950644, -0.832188, 4.221153, 0, 0.5921569, 1, 1,
0.1995506, 0.9361171, 0.2351179, 0, 0.5843138, 1, 1,
0.2099933, 0.3372525, 0.001786142, 0, 0.5803922, 1, 1,
0.2129018, -0.4265699, 2.398752, 0, 0.572549, 1, 1,
0.2158955, 0.02784928, 2.053906, 0, 0.5686275, 1, 1,
0.2159928, -0.3575338, 3.607504, 0, 0.5607843, 1, 1,
0.2174851, 1.202226, -0.5810319, 0, 0.5568628, 1, 1,
0.2203507, -0.1680655, 3.37446, 0, 0.5490196, 1, 1,
0.2205207, -1.121902, 3.765257, 0, 0.5450981, 1, 1,
0.2213339, 0.6254717, 1.413149, 0, 0.5372549, 1, 1,
0.2228398, -0.1777074, 2.476961, 0, 0.5333334, 1, 1,
0.2230687, 2.370625, 1.229975, 0, 0.5254902, 1, 1,
0.2250568, 0.4610717, 1.356206, 0, 0.5215687, 1, 1,
0.2365814, -0.4128559, 3.528139, 0, 0.5137255, 1, 1,
0.2415466, -0.9170581, 3.722983, 0, 0.509804, 1, 1,
0.2418745, -2.373053, 1.118644, 0, 0.5019608, 1, 1,
0.2431601, -0.3818061, 4.504116, 0, 0.4941176, 1, 1,
0.2445452, -0.5280516, 2.960247, 0, 0.4901961, 1, 1,
0.2461975, -1.018622, 2.413888, 0, 0.4823529, 1, 1,
0.2479629, 0.4156663, -0.2387881, 0, 0.4784314, 1, 1,
0.2493144, 0.2634306, 0.1203786, 0, 0.4705882, 1, 1,
0.2495096, -0.7444162, 3.649708, 0, 0.4666667, 1, 1,
0.2557361, 0.5665116, 0.3425439, 0, 0.4588235, 1, 1,
0.2572546, 1.2755, -0.2586337, 0, 0.454902, 1, 1,
0.2573535, -0.4999187, 2.95033, 0, 0.4470588, 1, 1,
0.2623498, 0.4198222, 1.279107, 0, 0.4431373, 1, 1,
0.2669198, -0.4249572, 2.073942, 0, 0.4352941, 1, 1,
0.2680605, 0.1426115, 0.5336257, 0, 0.4313726, 1, 1,
0.2701868, 0.826099, 0.7732407, 0, 0.4235294, 1, 1,
0.2708806, -0.4321731, 1.121055, 0, 0.4196078, 1, 1,
0.271367, 0.9168018, 0.9117375, 0, 0.4117647, 1, 1,
0.2763137, -0.4659149, 0.2900978, 0, 0.4078431, 1, 1,
0.285145, -0.2011171, 1.720826, 0, 0.4, 1, 1,
0.28733, 2.05413, 0.25025, 0, 0.3921569, 1, 1,
0.2882759, 0.3270565, 1.246152, 0, 0.3882353, 1, 1,
0.2885341, -0.4584795, 2.726065, 0, 0.3803922, 1, 1,
0.2885637, -0.4669161, 2.902453, 0, 0.3764706, 1, 1,
0.3004048, 1.644161, 0.02599001, 0, 0.3686275, 1, 1,
0.3013244, -0.943603, 2.813944, 0, 0.3647059, 1, 1,
0.3035206, 0.275382, 2.383188, 0, 0.3568628, 1, 1,
0.3088937, 1.463014, -0.4347269, 0, 0.3529412, 1, 1,
0.3103622, 1.602567, -0.9124762, 0, 0.345098, 1, 1,
0.3105051, 0.3882121, 0.1767953, 0, 0.3411765, 1, 1,
0.3118821, -1.315056, 1.474075, 0, 0.3333333, 1, 1,
0.3135794, -2.264464, 1.983893, 0, 0.3294118, 1, 1,
0.3142525, -0.2855266, 1.497443, 0, 0.3215686, 1, 1,
0.3144454, -1.012427, 4.491094, 0, 0.3176471, 1, 1,
0.316038, -0.2785193, 1.445882, 0, 0.3098039, 1, 1,
0.31846, 0.9334154, 0.5443777, 0, 0.3058824, 1, 1,
0.3203446, -0.6369039, 2.070498, 0, 0.2980392, 1, 1,
0.3249863, 0.179902, 1.465901, 0, 0.2901961, 1, 1,
0.3305604, -1.046679, 1.32568, 0, 0.2862745, 1, 1,
0.335803, 1.294859, 0.640339, 0, 0.2784314, 1, 1,
0.3406233, -1.859532, 3.490374, 0, 0.2745098, 1, 1,
0.3416196, 0.5222492, -0.1636222, 0, 0.2666667, 1, 1,
0.3437274, -0.1248086, 0.7323201, 0, 0.2627451, 1, 1,
0.3476325, -1.523863, 1.887823, 0, 0.254902, 1, 1,
0.348728, -0.9855092, 1.630395, 0, 0.2509804, 1, 1,
0.351123, -0.505971, 3.285515, 0, 0.2431373, 1, 1,
0.3513772, 0.007713437, 1.817242, 0, 0.2392157, 1, 1,
0.3557173, -1.104327, 2.866099, 0, 0.2313726, 1, 1,
0.3603173, -1.259198, 1.755914, 0, 0.227451, 1, 1,
0.3681149, 0.4537874, 2.750881, 0, 0.2196078, 1, 1,
0.3749145, 0.6948172, 0.1922667, 0, 0.2156863, 1, 1,
0.3888646, 1.2186, 1.699442, 0, 0.2078431, 1, 1,
0.4001915, -0.3088578, 1.669936, 0, 0.2039216, 1, 1,
0.4053697, 0.6023804, 0.1196342, 0, 0.1960784, 1, 1,
0.4074993, 0.3040096, 1.07743, 0, 0.1882353, 1, 1,
0.4087698, -0.0833311, 1.738153, 0, 0.1843137, 1, 1,
0.4196927, -0.09342993, 3.641807, 0, 0.1764706, 1, 1,
0.4233226, 0.07096621, 2.187771, 0, 0.172549, 1, 1,
0.4279812, 0.2770834, 0.278568, 0, 0.1647059, 1, 1,
0.430637, -0.2082527, 1.710549, 0, 0.1607843, 1, 1,
0.4312184, -0.6113992, 2.638396, 0, 0.1529412, 1, 1,
0.432205, 0.9443412, 1.332985, 0, 0.1490196, 1, 1,
0.4337718, 1.58189, 0.9316551, 0, 0.1411765, 1, 1,
0.4352997, 0.2913152, 1.604527, 0, 0.1372549, 1, 1,
0.4424156, -1.660152, 1.32965, 0, 0.1294118, 1, 1,
0.4440477, -0.3763293, 2.528663, 0, 0.1254902, 1, 1,
0.452284, 0.048443, -0.1971539, 0, 0.1176471, 1, 1,
0.4538186, -0.07084408, 2.117295, 0, 0.1137255, 1, 1,
0.4541242, -2.431217, 3.126796, 0, 0.1058824, 1, 1,
0.4566094, 1.386162, 0.5910366, 0, 0.09803922, 1, 1,
0.4575984, 0.3848855, -0.04096806, 0, 0.09411765, 1, 1,
0.4585878, 0.9393424, 0.9019893, 0, 0.08627451, 1, 1,
0.4590942, -1.157055, 2.166722, 0, 0.08235294, 1, 1,
0.4610709, 0.8265615, 0.129908, 0, 0.07450981, 1, 1,
0.4616937, -0.3080784, 2.878793, 0, 0.07058824, 1, 1,
0.4704636, -0.8849639, -0.1214029, 0, 0.0627451, 1, 1,
0.4725525, -0.9008715, 1.110301, 0, 0.05882353, 1, 1,
0.4735643, 0.5859283, 1.669005, 0, 0.05098039, 1, 1,
0.4763473, -1.078537, 2.852528, 0, 0.04705882, 1, 1,
0.4797454, -1.301055, 2.623743, 0, 0.03921569, 1, 1,
0.4801885, -1.059458, 3.432502, 0, 0.03529412, 1, 1,
0.4824271, 0.489209, 0.04990403, 0, 0.02745098, 1, 1,
0.4833225, 0.2130045, 2.227794, 0, 0.02352941, 1, 1,
0.4835293, 0.8950615, 1.043011, 0, 0.01568628, 1, 1,
0.4860136, 1.226357, 0.903886, 0, 0.01176471, 1, 1,
0.4876274, -1.52977, 1.728839, 0, 0.003921569, 1, 1,
0.4913006, 0.2297575, 0.8321454, 0.003921569, 0, 1, 1,
0.4921823, 0.8011906, 2.083115, 0.007843138, 0, 1, 1,
0.4947739, -1.999601, 4.173054, 0.01568628, 0, 1, 1,
0.4967341, -0.6693932, 5.27692, 0.01960784, 0, 1, 1,
0.4968908, 0.6535835, 0.1890289, 0.02745098, 0, 1, 1,
0.4993674, 1.533739, 0.6619195, 0.03137255, 0, 1, 1,
0.5013362, -0.3526937, 0.6410589, 0.03921569, 0, 1, 1,
0.5040438, -0.2972312, 0.5509668, 0.04313726, 0, 1, 1,
0.504636, -1.273177, 3.699344, 0.05098039, 0, 1, 1,
0.5147896, 1.955717, 1.211865, 0.05490196, 0, 1, 1,
0.5157079, -0.1234062, 2.275817, 0.0627451, 0, 1, 1,
0.5167736, -0.2564355, 2.869873, 0.06666667, 0, 1, 1,
0.5175834, 1.99306, -0.5747974, 0.07450981, 0, 1, 1,
0.5179572, -0.4890589, 2.229192, 0.07843138, 0, 1, 1,
0.5198439, -0.1674307, 1.946615, 0.08627451, 0, 1, 1,
0.5254318, -0.8302628, 3.203233, 0.09019608, 0, 1, 1,
0.5260704, -0.9688314, 1.647252, 0.09803922, 0, 1, 1,
0.5291124, 1.856161, 0.2137032, 0.1058824, 0, 1, 1,
0.5356102, 1.522434, 0.08713896, 0.1098039, 0, 1, 1,
0.5373757, -2.739351, 3.487688, 0.1176471, 0, 1, 1,
0.5378277, -0.03219503, 1.507115, 0.1215686, 0, 1, 1,
0.538825, 0.4916745, 1.575955, 0.1294118, 0, 1, 1,
0.5397022, 0.3314889, 0.2001312, 0.1333333, 0, 1, 1,
0.5405734, 0.08342575, 2.373946, 0.1411765, 0, 1, 1,
0.5442851, 0.3073801, 2.577723, 0.145098, 0, 1, 1,
0.5469771, -0.08248994, 1.026955, 0.1529412, 0, 1, 1,
0.550578, 1.037444, 0.9274912, 0.1568628, 0, 1, 1,
0.5536274, -0.6882518, 3.692337, 0.1647059, 0, 1, 1,
0.5559626, -1.620205, 1.950636, 0.1686275, 0, 1, 1,
0.5617994, -1.031199, 2.073419, 0.1764706, 0, 1, 1,
0.5650359, 1.886722, -1.080973, 0.1803922, 0, 1, 1,
0.5653011, -0.3824678, 3.279128, 0.1882353, 0, 1, 1,
0.5730654, 0.201544, 2.470694, 0.1921569, 0, 1, 1,
0.575693, 2.054352, -0.1975187, 0.2, 0, 1, 1,
0.5767508, 1.978613, 0.7219455, 0.2078431, 0, 1, 1,
0.5851889, 0.08808101, 2.589419, 0.2117647, 0, 1, 1,
0.5858127, -1.44225, 2.138025, 0.2196078, 0, 1, 1,
0.5966666, -1.177865, 3.776538, 0.2235294, 0, 1, 1,
0.5983924, -0.5877051, 2.629839, 0.2313726, 0, 1, 1,
0.6028497, -1.60333, 0.9633572, 0.2352941, 0, 1, 1,
0.6053222, 0.7064207, 1.358067, 0.2431373, 0, 1, 1,
0.6088649, -0.6571908, 1.203753, 0.2470588, 0, 1, 1,
0.6112167, 1.367849, -0.5389931, 0.254902, 0, 1, 1,
0.6118637, -0.4181019, 2.523736, 0.2588235, 0, 1, 1,
0.6159112, -0.7196995, 3.104397, 0.2666667, 0, 1, 1,
0.6203917, -1.390608, 3.716684, 0.2705882, 0, 1, 1,
0.6246976, 0.8476605, 1.8619, 0.2784314, 0, 1, 1,
0.6281075, -0.359672, 1.504727, 0.282353, 0, 1, 1,
0.6286277, 0.1920115, 2.054582, 0.2901961, 0, 1, 1,
0.6332172, 0.09804713, 0.7282493, 0.2941177, 0, 1, 1,
0.6339656, -0.1191256, 1.17215, 0.3019608, 0, 1, 1,
0.6372159, 0.5205879, -0.543969, 0.3098039, 0, 1, 1,
0.6383882, -0.7575303, 1.258709, 0.3137255, 0, 1, 1,
0.6396564, 0.06888597, 1.771354, 0.3215686, 0, 1, 1,
0.6399559, 0.3237263, 1.276849, 0.3254902, 0, 1, 1,
0.6418532, 0.7611493, -1.135588, 0.3333333, 0, 1, 1,
0.6419137, -0.1230949, 2.569227, 0.3372549, 0, 1, 1,
0.6420709, -0.1783395, 2.557641, 0.345098, 0, 1, 1,
0.6448805, 0.3589698, -0.001811344, 0.3490196, 0, 1, 1,
0.6471884, 0.3322067, 0.4858809, 0.3568628, 0, 1, 1,
0.6501856, 0.5885085, 1.351757, 0.3607843, 0, 1, 1,
0.6505641, -0.3471952, 1.131824, 0.3686275, 0, 1, 1,
0.6566162, -0.6087108, 3.363958, 0.372549, 0, 1, 1,
0.6608595, 1.54315, -1.37216, 0.3803922, 0, 1, 1,
0.6681491, 0.7237798, -0.2143002, 0.3843137, 0, 1, 1,
0.6696837, -1.212698, 1.663531, 0.3921569, 0, 1, 1,
0.6700343, 0.5082015, 1.899862, 0.3960784, 0, 1, 1,
0.6707582, -1.059282, 4.572658, 0.4039216, 0, 1, 1,
0.6769356, -0.448334, 2.580143, 0.4117647, 0, 1, 1,
0.6818933, 0.320983, 2.226827, 0.4156863, 0, 1, 1,
0.6821285, -0.7222785, 2.410796, 0.4235294, 0, 1, 1,
0.6826333, 0.7161974, -1.023435, 0.427451, 0, 1, 1,
0.6948166, 1.839738, 0.3253291, 0.4352941, 0, 1, 1,
0.6957731, 0.1529574, 1.454171, 0.4392157, 0, 1, 1,
0.6968625, 0.9633476, 1.232289, 0.4470588, 0, 1, 1,
0.6997019, -0.5066751, 3.339807, 0.4509804, 0, 1, 1,
0.6997732, -0.5294593, 2.644502, 0.4588235, 0, 1, 1,
0.7008067, -1.232106, 3.106337, 0.4627451, 0, 1, 1,
0.7055056, 0.03308223, 0.4478432, 0.4705882, 0, 1, 1,
0.7126614, 0.7168118, 0.9190326, 0.4745098, 0, 1, 1,
0.7166691, 1.862582, 0.4000035, 0.4823529, 0, 1, 1,
0.7196571, -0.1005985, 1.620538, 0.4862745, 0, 1, 1,
0.7223321, 1.352582, 1.410142, 0.4941176, 0, 1, 1,
0.7235831, 1.329479, -0.9249119, 0.5019608, 0, 1, 1,
0.7293466, -0.2537611, 1.575229, 0.5058824, 0, 1, 1,
0.7340676, 0.5302306, 0.8800118, 0.5137255, 0, 1, 1,
0.7376099, 2.018411, -0.2306885, 0.5176471, 0, 1, 1,
0.741544, 0.4714516, 2.930845, 0.5254902, 0, 1, 1,
0.741623, 0.4269226, -0.720817, 0.5294118, 0, 1, 1,
0.7419345, 0.3919467, 0.04295699, 0.5372549, 0, 1, 1,
0.7430609, -0.07574697, 3.284954, 0.5411765, 0, 1, 1,
0.746744, 0.9900669, 1.124412, 0.5490196, 0, 1, 1,
0.747723, -0.4648866, 2.023786, 0.5529412, 0, 1, 1,
0.7514222, -0.3947091, 1.723844, 0.5607843, 0, 1, 1,
0.7541302, -0.2934925, 3.823648, 0.5647059, 0, 1, 1,
0.7560329, -1.399517, 3.704608, 0.572549, 0, 1, 1,
0.7599957, 0.6961309, 1.351183, 0.5764706, 0, 1, 1,
0.7620924, 0.6999223, 0.6426209, 0.5843138, 0, 1, 1,
0.7622467, -1.055484, 2.470103, 0.5882353, 0, 1, 1,
0.7634292, 0.8668742, 0.8753286, 0.5960785, 0, 1, 1,
0.7670894, 0.7603874, -0.316424, 0.6039216, 0, 1, 1,
0.7679458, -0.8059635, 3.562741, 0.6078432, 0, 1, 1,
0.7696705, 0.7710339, 0.7116441, 0.6156863, 0, 1, 1,
0.7733672, -0.3139015, 2.286664, 0.6196079, 0, 1, 1,
0.7776135, 0.9761005, 1.411534, 0.627451, 0, 1, 1,
0.7783767, 1.13554, -0.5971348, 0.6313726, 0, 1, 1,
0.7826783, -0.913641, 0.627584, 0.6392157, 0, 1, 1,
0.786525, 0.6327702, 1.142112, 0.6431373, 0, 1, 1,
0.7868639, 0.122454, 1.953135, 0.6509804, 0, 1, 1,
0.7882856, -0.2844989, 2.458315, 0.654902, 0, 1, 1,
0.790232, -0.07916999, 0.6087549, 0.6627451, 0, 1, 1,
0.7964403, -0.8839508, 3.131003, 0.6666667, 0, 1, 1,
0.8014249, 0.05922164, 1.944213, 0.6745098, 0, 1, 1,
0.8041021, -0.8541375, 1.270967, 0.6784314, 0, 1, 1,
0.8070673, 0.9133681, 1.369326, 0.6862745, 0, 1, 1,
0.8138192, -0.9808798, 1.40702, 0.6901961, 0, 1, 1,
0.8187302, 1.06599, 0.922226, 0.6980392, 0, 1, 1,
0.8202292, -0.6865304, 1.546056, 0.7058824, 0, 1, 1,
0.8241729, 0.4346338, -0.5322336, 0.7098039, 0, 1, 1,
0.8280028, 1.197319, 1.51973, 0.7176471, 0, 1, 1,
0.8309804, 2.681653, 0.7069526, 0.7215686, 0, 1, 1,
0.8316031, -0.834241, 3.761787, 0.7294118, 0, 1, 1,
0.8339618, 0.2869048, 0.6421484, 0.7333333, 0, 1, 1,
0.845485, -1.836234, 2.502744, 0.7411765, 0, 1, 1,
0.8493412, -1.03041, 1.074042, 0.7450981, 0, 1, 1,
0.8572527, 0.6447155, 0.5117836, 0.7529412, 0, 1, 1,
0.8630948, 1.822286, 0.2742469, 0.7568628, 0, 1, 1,
0.8655981, 0.2382997, -1.214359, 0.7647059, 0, 1, 1,
0.8663096, 1.174257, -0.2196694, 0.7686275, 0, 1, 1,
0.8690497, 0.001316787, -0.2847321, 0.7764706, 0, 1, 1,
0.8774596, -1.036453, 2.660666, 0.7803922, 0, 1, 1,
0.8785439, 0.05101547, 2.588192, 0.7882353, 0, 1, 1,
0.8859957, -0.5699075, 1.592281, 0.7921569, 0, 1, 1,
0.8879816, -0.05264415, 1.523794, 0.8, 0, 1, 1,
0.8925003, 2.481573, 1.558576, 0.8078431, 0, 1, 1,
0.8927124, 1.202767, 0.726828, 0.8117647, 0, 1, 1,
0.8972605, -1.138028, 3.672017, 0.8196079, 0, 1, 1,
0.8989584, 1.234181, 0.3295118, 0.8235294, 0, 1, 1,
0.9044977, 0.5193146, 0.5573483, 0.8313726, 0, 1, 1,
0.9059506, -0.6561674, 2.830525, 0.8352941, 0, 1, 1,
0.9091557, -1.176606, 4.047286, 0.8431373, 0, 1, 1,
0.9174269, -0.1955726, 0.01616012, 0.8470588, 0, 1, 1,
0.9256862, -2.217607, 4.415224, 0.854902, 0, 1, 1,
0.926011, -0.8636034, 1.48835, 0.8588235, 0, 1, 1,
0.9314789, 0.3240446, 1.057879, 0.8666667, 0, 1, 1,
0.9357869, 0.8545729, 2.016787, 0.8705882, 0, 1, 1,
0.9368622, 0.1464017, 3.36559, 0.8784314, 0, 1, 1,
0.9416791, 0.02638488, 0.5034177, 0.8823529, 0, 1, 1,
0.9475051, -0.9222273, 3.255839, 0.8901961, 0, 1, 1,
0.9502885, 0.1480488, 2.160029, 0.8941177, 0, 1, 1,
0.9520193, 0.2366261, -0.3390096, 0.9019608, 0, 1, 1,
0.9544193, 0.9651554, -0.8519416, 0.9098039, 0, 1, 1,
0.9635102, 0.5611745, -0.01706152, 0.9137255, 0, 1, 1,
0.9673564, -0.8259686, 3.370716, 0.9215686, 0, 1, 1,
0.9689542, 0.006690849, -0.5943752, 0.9254902, 0, 1, 1,
0.9694346, 0.3510963, 2.160247, 0.9333333, 0, 1, 1,
0.9749796, 0.7869454, 0.2588219, 0.9372549, 0, 1, 1,
0.9783357, -0.1536837, 2.425437, 0.945098, 0, 1, 1,
0.9784998, 0.7700112, -0.5455693, 0.9490196, 0, 1, 1,
0.9806592, -0.2155635, 0.9004503, 0.9568627, 0, 1, 1,
0.9867205, -0.8335773, 2.543503, 0.9607843, 0, 1, 1,
0.9867237, 1.171312, 0.17584, 0.9686275, 0, 1, 1,
0.9872375, -0.1029248, 2.477015, 0.972549, 0, 1, 1,
0.9993218, 0.8813541, 1.709491, 0.9803922, 0, 1, 1,
0.9994863, -2.51488, 1.596811, 0.9843137, 0, 1, 1,
1.000573, -0.4479138, 1.363573, 0.9921569, 0, 1, 1,
1.00902, 0.1290942, 1.395655, 0.9960784, 0, 1, 1,
1.010045, 0.767404, 1.715959, 1, 0, 0.9960784, 1,
1.01159, 0.05229967, 1.980896, 1, 0, 0.9882353, 1,
1.015134, -0.6398541, 2.514051, 1, 0, 0.9843137, 1,
1.021048, -0.7685622, 0.6560085, 1, 0, 0.9764706, 1,
1.02218, 0.2041325, 2.470056, 1, 0, 0.972549, 1,
1.028404, -0.02564108, 1.47668, 1, 0, 0.9647059, 1,
1.029756, -0.428574, 1.99985, 1, 0, 0.9607843, 1,
1.029786, 1.687513, 1.578338, 1, 0, 0.9529412, 1,
1.030321, 1.954867, 2.176306, 1, 0, 0.9490196, 1,
1.032987, 1.41934, -0.1228652, 1, 0, 0.9411765, 1,
1.047173, -0.9625325, 2.230327, 1, 0, 0.9372549, 1,
1.048879, -1.092467, 3.380384, 1, 0, 0.9294118, 1,
1.057402, -1.333982, 2.043971, 1, 0, 0.9254902, 1,
1.066824, 0.2284219, -0.2684612, 1, 0, 0.9176471, 1,
1.067418, -1.502661, 5.350981, 1, 0, 0.9137255, 1,
1.069627, 0.1774754, 0.9836918, 1, 0, 0.9058824, 1,
1.070024, 0.5018198, -0.2370001, 1, 0, 0.9019608, 1,
1.072398, 0.5483947, 0.2515296, 1, 0, 0.8941177, 1,
1.074047, 0.4073304, 1.912118, 1, 0, 0.8862745, 1,
1.077245, 2.046171, 2.164827, 1, 0, 0.8823529, 1,
1.086094, 1.503066, 1.055795, 1, 0, 0.8745098, 1,
1.086836, 0.7110872, 0.7005894, 1, 0, 0.8705882, 1,
1.090143, 0.5002265, 1.111746, 1, 0, 0.8627451, 1,
1.10416, -0.8725125, 2.96441, 1, 0, 0.8588235, 1,
1.105007, 2.771532, 1.097598, 1, 0, 0.8509804, 1,
1.108457, -0.1573132, 1.31698, 1, 0, 0.8470588, 1,
1.120271, -0.9851229, 1.756209, 1, 0, 0.8392157, 1,
1.122053, 0.2387257, 1.362968, 1, 0, 0.8352941, 1,
1.123988, -0.927829, 1.895363, 1, 0, 0.827451, 1,
1.131006, 2.103089, 2.201329, 1, 0, 0.8235294, 1,
1.142019, -0.8178213, 1.059874, 1, 0, 0.8156863, 1,
1.144973, 0.1069637, 2.46733, 1, 0, 0.8117647, 1,
1.152019, -1.544975, 3.490087, 1, 0, 0.8039216, 1,
1.157486, -1.333603, 2.279702, 1, 0, 0.7960784, 1,
1.157807, 1.9626, 1.298123, 1, 0, 0.7921569, 1,
1.167022, 0.5207821, 0.6871878, 1, 0, 0.7843137, 1,
1.16711, -0.6211936, 2.201659, 1, 0, 0.7803922, 1,
1.169371, -1.278561, 2.224518, 1, 0, 0.772549, 1,
1.175069, 0.516826, 0.5897385, 1, 0, 0.7686275, 1,
1.179704, -0.1762725, 2.645118, 1, 0, 0.7607843, 1,
1.190916, 0.6026666, -0.4164221, 1, 0, 0.7568628, 1,
1.192423, 0.4345506, -0.1215715, 1, 0, 0.7490196, 1,
1.194702, 0.7355023, 1.333448, 1, 0, 0.7450981, 1,
1.195278, 0.1344023, 1.657488, 1, 0, 0.7372549, 1,
1.195441, -0.09675828, 1.407954, 1, 0, 0.7333333, 1,
1.198636, -0.9586641, 3.379192, 1, 0, 0.7254902, 1,
1.202201, 0.4580969, 2.316754, 1, 0, 0.7215686, 1,
1.205072, -0.7631935, 0.08162933, 1, 0, 0.7137255, 1,
1.21808, 0.3421427, -0.6478779, 1, 0, 0.7098039, 1,
1.219513, 1.060594, -0.9674303, 1, 0, 0.7019608, 1,
1.223535, -0.9614778, 1.597443, 1, 0, 0.6941177, 1,
1.225305, 1.103288, 3.177997, 1, 0, 0.6901961, 1,
1.232967, -0.4978808, 1.76438, 1, 0, 0.682353, 1,
1.282637, 0.6934771, 2.314567, 1, 0, 0.6784314, 1,
1.288565, -0.4681641, 0.5478038, 1, 0, 0.6705883, 1,
1.328753, 1.173273, 1.670362, 1, 0, 0.6666667, 1,
1.343689, -0.009177121, 1.369875, 1, 0, 0.6588235, 1,
1.348394, -0.6256687, 2.712437, 1, 0, 0.654902, 1,
1.355912, 1.5067, 2.156642, 1, 0, 0.6470588, 1,
1.357089, -0.4977216, 0.730919, 1, 0, 0.6431373, 1,
1.357111, 0.3868769, 1.931628, 1, 0, 0.6352941, 1,
1.361225, 0.5190313, 2.017154, 1, 0, 0.6313726, 1,
1.375691, 0.4852476, 1.409895, 1, 0, 0.6235294, 1,
1.375848, -0.3623959, 2.278152, 1, 0, 0.6196079, 1,
1.378043, -1.256711, 0.2810822, 1, 0, 0.6117647, 1,
1.380371, -0.5464063, 0.797785, 1, 0, 0.6078432, 1,
1.389264, 0.6045237, -0.003347057, 1, 0, 0.6, 1,
1.39145, -2.258903, 3.99494, 1, 0, 0.5921569, 1,
1.392242, 0.4492386, 0.1165021, 1, 0, 0.5882353, 1,
1.393197, -0.3091903, 1.782201, 1, 0, 0.5803922, 1,
1.393773, 0.436317, 1.998367, 1, 0, 0.5764706, 1,
1.394595, 2.938334, 0.5051612, 1, 0, 0.5686275, 1,
1.403129, 1.993814, -0.9925269, 1, 0, 0.5647059, 1,
1.405291, -0.4870916, 0.5247562, 1, 0, 0.5568628, 1,
1.414005, -1.178569, 2.578497, 1, 0, 0.5529412, 1,
1.427548, 0.5744092, 1.07966, 1, 0, 0.5450981, 1,
1.428046, -0.9068808, 2.217842, 1, 0, 0.5411765, 1,
1.445707, 1.422757, 1.138253, 1, 0, 0.5333334, 1,
1.4519, 1.240714, 0.02525755, 1, 0, 0.5294118, 1,
1.45691, 1.419678, 1.271325, 1, 0, 0.5215687, 1,
1.460582, -1.162923, 3.103543, 1, 0, 0.5176471, 1,
1.480195, 0.4572573, -0.4478029, 1, 0, 0.509804, 1,
1.480428, -0.5305919, 1.578197, 1, 0, 0.5058824, 1,
1.49083, 0.8385888, -2.186287, 1, 0, 0.4980392, 1,
1.503475, -1.019174, 2.18099, 1, 0, 0.4901961, 1,
1.50486, 1.515089, 1.434129, 1, 0, 0.4862745, 1,
1.510345, 0.08302757, 1.642657, 1, 0, 0.4784314, 1,
1.510684, -0.04149013, -0.1347344, 1, 0, 0.4745098, 1,
1.5162, -0.5633405, 1.678613, 1, 0, 0.4666667, 1,
1.516461, -0.2928246, 2.149993, 1, 0, 0.4627451, 1,
1.528919, -0.107041, 1.076084, 1, 0, 0.454902, 1,
1.537412, -1.248784, 1.669029, 1, 0, 0.4509804, 1,
1.541085, 0.4931618, -0.2668603, 1, 0, 0.4431373, 1,
1.542665, -0.7082054, 2.787343, 1, 0, 0.4392157, 1,
1.545176, 2.412352, -0.8308942, 1, 0, 0.4313726, 1,
1.548763, 0.3650007, 0.3330026, 1, 0, 0.427451, 1,
1.54915, 0.8306376, 1.613226, 1, 0, 0.4196078, 1,
1.562774, -1.036195, 3.320108, 1, 0, 0.4156863, 1,
1.587162, -0.1476198, 4.159239, 1, 0, 0.4078431, 1,
1.592049, 0.6785381, 0.3362121, 1, 0, 0.4039216, 1,
1.593748, -1.04528, 0.7781772, 1, 0, 0.3960784, 1,
1.595658, 0.2475838, 2.057965, 1, 0, 0.3882353, 1,
1.598386, -0.1626004, 1.647747, 1, 0, 0.3843137, 1,
1.604868, 1.735152, 0.5575515, 1, 0, 0.3764706, 1,
1.605473, -0.1373025, 2.346338, 1, 0, 0.372549, 1,
1.617512, 0.4753965, 2.364267, 1, 0, 0.3647059, 1,
1.63016, 1.29846, 0.4722329, 1, 0, 0.3607843, 1,
1.636672, -0.3984577, 1.320303, 1, 0, 0.3529412, 1,
1.644389, -0.4033589, 2.631946, 1, 0, 0.3490196, 1,
1.646936, -0.3112046, 1.243238, 1, 0, 0.3411765, 1,
1.65289, -0.05535468, 3.324126, 1, 0, 0.3372549, 1,
1.658345, -0.4059472, 2.250881, 1, 0, 0.3294118, 1,
1.679107, -1.597513, 3.193781, 1, 0, 0.3254902, 1,
1.679266, -1.36658, 1.827527, 1, 0, 0.3176471, 1,
1.682966, -0.5733834, 3.080667, 1, 0, 0.3137255, 1,
1.687634, -0.239941, 3.456896, 1, 0, 0.3058824, 1,
1.692171, 0.1116318, 1.855821, 1, 0, 0.2980392, 1,
1.697966, -0.9366478, 2.769614, 1, 0, 0.2941177, 1,
1.740881, -0.2617029, 1.055456, 1, 0, 0.2862745, 1,
1.743739, -0.1628218, 1.797873, 1, 0, 0.282353, 1,
1.761161, 0.1755084, 1.792478, 1, 0, 0.2745098, 1,
1.76935, 0.03756241, -0.3716554, 1, 0, 0.2705882, 1,
1.772643, -0.4413233, 1.627603, 1, 0, 0.2627451, 1,
1.779222, -1.438798, 2.615176, 1, 0, 0.2588235, 1,
1.779691, -1.116732, 3.329702, 1, 0, 0.2509804, 1,
1.804773, 0.2457781, 0.3519543, 1, 0, 0.2470588, 1,
1.818518, -0.5342796, 2.111809, 1, 0, 0.2392157, 1,
1.826378, 1.33209, 1.342957, 1, 0, 0.2352941, 1,
1.84072, -1.179087, 4.082553, 1, 0, 0.227451, 1,
1.853806, 0.2236792, 2.259134, 1, 0, 0.2235294, 1,
1.873729, -1.03921, 2.146163, 1, 0, 0.2156863, 1,
1.884551, 0.2534589, 2.73169, 1, 0, 0.2117647, 1,
1.889458, -0.5985931, 2.954397, 1, 0, 0.2039216, 1,
1.917709, 0.7244482, 2.560024, 1, 0, 0.1960784, 1,
1.931256, 1.105737, 1.520129, 1, 0, 0.1921569, 1,
1.959819, 0.07248471, 1.750747, 1, 0, 0.1843137, 1,
1.983889, 1.206599, 1.608171, 1, 0, 0.1803922, 1,
1.992364, -0.6806874, 2.883356, 1, 0, 0.172549, 1,
1.993547, -1.716295, 2.99678, 1, 0, 0.1686275, 1,
1.995238, -0.6868935, 1.519286, 1, 0, 0.1607843, 1,
2.007196, -0.4070502, 1.625807, 1, 0, 0.1568628, 1,
2.020828, 1.120878, -0.1152652, 1, 0, 0.1490196, 1,
2.111285, -0.5832409, 1.133144, 1, 0, 0.145098, 1,
2.122103, -0.1701185, 0.8108299, 1, 0, 0.1372549, 1,
2.125606, 0.7103258, 0.07630211, 1, 0, 0.1333333, 1,
2.128713, 0.7165657, 1.232354, 1, 0, 0.1254902, 1,
2.132601, 0.9753357, 1.925286, 1, 0, 0.1215686, 1,
2.1462, 0.8326401, 1.566353, 1, 0, 0.1137255, 1,
2.148194, 0.9832545, 2.363651, 1, 0, 0.1098039, 1,
2.240695, 0.7204291, 1.314748, 1, 0, 0.1019608, 1,
2.243289, -1.027019, 1.04124, 1, 0, 0.09411765, 1,
2.248435, 0.0377066, 2.815883, 1, 0, 0.09019608, 1,
2.281357, -1.535283, 0.6020581, 1, 0, 0.08235294, 1,
2.333165, 0.5659354, -0.5811927, 1, 0, 0.07843138, 1,
2.428174, 0.5124269, 1.082133, 1, 0, 0.07058824, 1,
2.451999, -0.7912068, 2.139067, 1, 0, 0.06666667, 1,
2.501209, -1.298217, 2.22053, 1, 0, 0.05882353, 1,
2.520988, 0.03700567, 1.367038, 1, 0, 0.05490196, 1,
2.550045, -0.2733929, 1.662651, 1, 0, 0.04705882, 1,
2.608877, 0.9766277, 1.600317, 1, 0, 0.04313726, 1,
2.804892, 0.5678318, 1.838619, 1, 0, 0.03529412, 1,
2.804995, -0.3644619, 1.918105, 1, 0, 0.03137255, 1,
2.824637, -1.030227, 1.993604, 1, 0, 0.02352941, 1,
2.866546, 0.7425146, 2.391142, 1, 0, 0.01960784, 1,
2.928483, 0.669215, 1.352329, 1, 0, 0.01176471, 1,
2.975247, 1.510731, 0.8337446, 1, 0, 0.007843138, 1
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
-0.2594274, -4.235489, -7.814002, 0, -0.5, 0.5, 0.5,
-0.2594274, -4.235489, -7.814002, 1, -0.5, 0.5, 0.5,
-0.2594274, -4.235489, -7.814002, 1, 1.5, 0.5, 0.5,
-0.2594274, -4.235489, -7.814002, 0, 1.5, 0.5, 0.5
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
-4.590657, -0.1287128, -7.814002, 0, -0.5, 0.5, 0.5,
-4.590657, -0.1287128, -7.814002, 1, -0.5, 0.5, 0.5,
-4.590657, -0.1287128, -7.814002, 1, 1.5, 0.5, 0.5,
-4.590657, -0.1287128, -7.814002, 0, 1.5, 0.5, 0.5
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
-4.590657, -4.235489, -0.2774856, 0, -0.5, 0.5, 0.5,
-4.590657, -4.235489, -0.2774856, 1, -0.5, 0.5, 0.5,
-4.590657, -4.235489, -0.2774856, 1, 1.5, 0.5, 0.5,
-4.590657, -4.235489, -0.2774856, 0, 1.5, 0.5, 0.5
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
-3, -3.287771, -6.074806,
2, -3.287771, -6.074806,
-3, -3.287771, -6.074806,
-3, -3.445724, -6.364672,
-2, -3.287771, -6.074806,
-2, -3.445724, -6.364672,
-1, -3.287771, -6.074806,
-1, -3.445724, -6.364672,
0, -3.287771, -6.074806,
0, -3.445724, -6.364672,
1, -3.287771, -6.074806,
1, -3.445724, -6.364672,
2, -3.287771, -6.074806,
2, -3.445724, -6.364672
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
-3, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
-3, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
-3, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
-3, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5,
-2, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
-2, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
-2, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
-2, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5,
-1, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
-1, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
-1, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
-1, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5,
0, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
0, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
0, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
0, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5,
1, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
1, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
1, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
1, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5,
2, -3.76163, -6.944404, 0, -0.5, 0.5, 0.5,
2, -3.76163, -6.944404, 1, -0.5, 0.5, 0.5,
2, -3.76163, -6.944404, 1, 1.5, 0.5, 0.5,
2, -3.76163, -6.944404, 0, 1.5, 0.5, 0.5
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
-3.591142, -3, -6.074806,
-3.591142, 2, -6.074806,
-3.591142, -3, -6.074806,
-3.757728, -3, -6.364672,
-3.591142, -2, -6.074806,
-3.757728, -2, -6.364672,
-3.591142, -1, -6.074806,
-3.757728, -1, -6.364672,
-3.591142, 0, -6.074806,
-3.757728, 0, -6.364672,
-3.591142, 1, -6.074806,
-3.757728, 1, -6.364672,
-3.591142, 2, -6.074806,
-3.757728, 2, -6.364672
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
-4.090899, -3, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, -3, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, -3, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, -3, -6.944404, 0, 1.5, 0.5, 0.5,
-4.090899, -2, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, -2, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, -2, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, -2, -6.944404, 0, 1.5, 0.5, 0.5,
-4.090899, -1, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, -1, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, -1, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, -1, -6.944404, 0, 1.5, 0.5, 0.5,
-4.090899, 0, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, 0, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, 0, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, 0, -6.944404, 0, 1.5, 0.5, 0.5,
-4.090899, 1, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, 1, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, 1, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, 1, -6.944404, 0, 1.5, 0.5, 0.5,
-4.090899, 2, -6.944404, 0, -0.5, 0.5, 0.5,
-4.090899, 2, -6.944404, 1, -0.5, 0.5, 0.5,
-4.090899, 2, -6.944404, 1, 1.5, 0.5, 0.5,
-4.090899, 2, -6.944404, 0, 1.5, 0.5, 0.5
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
-3.591142, -3.287771, -4,
-3.591142, -3.287771, 4,
-3.591142, -3.287771, -4,
-3.757728, -3.445724, -4,
-3.591142, -3.287771, -2,
-3.757728, -3.445724, -2,
-3.591142, -3.287771, 0,
-3.757728, -3.445724, 0,
-3.591142, -3.287771, 2,
-3.757728, -3.445724, 2,
-3.591142, -3.287771, 4,
-3.757728, -3.445724, 4
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
-4.090899, -3.76163, -4, 0, -0.5, 0.5, 0.5,
-4.090899, -3.76163, -4, 1, -0.5, 0.5, 0.5,
-4.090899, -3.76163, -4, 1, 1.5, 0.5, 0.5,
-4.090899, -3.76163, -4, 0, 1.5, 0.5, 0.5,
-4.090899, -3.76163, -2, 0, -0.5, 0.5, 0.5,
-4.090899, -3.76163, -2, 1, -0.5, 0.5, 0.5,
-4.090899, -3.76163, -2, 1, 1.5, 0.5, 0.5,
-4.090899, -3.76163, -2, 0, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 0, 0, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 0, 1, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 0, 1, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 0, 0, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 2, 0, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 2, 1, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 2, 1, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 2, 0, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 4, 0, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 4, 1, -0.5, 0.5, 0.5,
-4.090899, -3.76163, 4, 1, 1.5, 0.5, 0.5,
-4.090899, -3.76163, 4, 0, 1.5, 0.5, 0.5
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
-3.591142, -3.287771, -6.074806,
-3.591142, 3.030346, -6.074806,
-3.591142, -3.287771, 5.519835,
-3.591142, 3.030346, 5.519835,
-3.591142, -3.287771, -6.074806,
-3.591142, -3.287771, 5.519835,
-3.591142, 3.030346, -6.074806,
-3.591142, 3.030346, 5.519835,
-3.591142, -3.287771, -6.074806,
3.072287, -3.287771, -6.074806,
-3.591142, -3.287771, 5.519835,
3.072287, -3.287771, 5.519835,
-3.591142, 3.030346, -6.074806,
3.072287, 3.030346, -6.074806,
-3.591142, 3.030346, 5.519835,
3.072287, 3.030346, 5.519835,
3.072287, -3.287771, -6.074806,
3.072287, 3.030346, -6.074806,
3.072287, -3.287771, 5.519835,
3.072287, 3.030346, 5.519835,
3.072287, -3.287771, -6.074806,
3.072287, -3.287771, 5.519835,
3.072287, 3.030346, -6.074806,
3.072287, 3.030346, 5.519835
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
var radius = 7.89778;
var distance = 35.13811;
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
mvMatrix.translate( 0.2594274, 0.1287128, 0.2774856 );
mvMatrix.scale( 1.281507, 1.351547, 0.7364812 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13811);
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
nitropyrazol-5-ylami<-read.table("nitropyrazol-5-ylami.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitropyrazol-5-ylami$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
```

```r
y<-nitropyrazol-5-ylami$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
```

```r
z<-nitropyrazol-5-ylami$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitropyrazol' not found
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
-3.494102, 0.5277634, -0.345856, 0, 0, 1, 1, 1,
-2.983789, -1.239079, -0.3433307, 1, 0, 0, 1, 1,
-2.886326, -1.014736, -1.568407, 1, 0, 0, 1, 1,
-2.582762, 1.368841, -1.171075, 1, 0, 0, 1, 1,
-2.541784, 0.7570424, -1.278824, 1, 0, 0, 1, 1,
-2.534592, -0.7291759, -0.2060598, 1, 0, 0, 1, 1,
-2.477666, 1.500063, 0.7361802, 0, 0, 0, 1, 1,
-2.433954, 0.8199326, -1.97881, 0, 0, 0, 1, 1,
-2.422771, -1.230814, -3.166262, 0, 0, 0, 1, 1,
-2.366012, -1.0574, -1.212174, 0, 0, 0, 1, 1,
-2.277282, -0.4431306, -3.529942, 0, 0, 0, 1, 1,
-2.264651, -0.6063605, -2.277257, 0, 0, 0, 1, 1,
-2.231329, -0.8122357, -2.40958, 0, 0, 0, 1, 1,
-2.121723, -2.340427, -0.9501962, 1, 1, 1, 1, 1,
-2.090839, 0.1921707, -1.127564, 1, 1, 1, 1, 1,
-2.080765, 0.6141258, -1.759253, 1, 1, 1, 1, 1,
-2.061645, 1.651928, -0.249364, 1, 1, 1, 1, 1,
-2.059855, 0.0822503, -3.472828, 1, 1, 1, 1, 1,
-2.028257, 0.2964951, -1.914099, 1, 1, 1, 1, 1,
-2.026706, 0.7582878, -1.233256, 1, 1, 1, 1, 1,
-2.014822, 0.4264853, -3.338972, 1, 1, 1, 1, 1,
-2.013149, -1.229106, -4.32495, 1, 1, 1, 1, 1,
-1.998486, -1.315489, -3.26473, 1, 1, 1, 1, 1,
-1.992198, -0.8782871, -3.694893, 1, 1, 1, 1, 1,
-1.968076, 0.6964758, -0.884854, 1, 1, 1, 1, 1,
-1.954114, -0.3620714, -3.091099, 1, 1, 1, 1, 1,
-1.952002, 0.9938496, -0.817887, 1, 1, 1, 1, 1,
-1.896917, 0.05010759, -0.4720408, 1, 1, 1, 1, 1,
-1.853999, -0.4950047, -1.597059, 0, 0, 1, 1, 1,
-1.833527, -0.4616905, -2.872819, 1, 0, 0, 1, 1,
-1.828665, -0.9159417, -1.911702, 1, 0, 0, 1, 1,
-1.826156, 0.7279343, -1.557589, 1, 0, 0, 1, 1,
-1.819914, 0.09226712, -2.665015, 1, 0, 0, 1, 1,
-1.813384, 0.4688646, -2.274174, 1, 0, 0, 1, 1,
-1.795264, -1.086318, -0.9939339, 0, 0, 0, 1, 1,
-1.778708, -1.152601, -2.67879, 0, 0, 0, 1, 1,
-1.77466, 1.730192, -1.371067, 0, 0, 0, 1, 1,
-1.770027, 0.1283587, -0.8398218, 0, 0, 0, 1, 1,
-1.76633, -1.542029, -1.063454, 0, 0, 0, 1, 1,
-1.741533, -0.2715487, -1.714345, 0, 0, 0, 1, 1,
-1.731645, -0.02888981, -1.342043, 0, 0, 0, 1, 1,
-1.731502, -0.6811795, -1.995816, 1, 1, 1, 1, 1,
-1.701412, 0.2521079, -0.7141414, 1, 1, 1, 1, 1,
-1.684896, 0.4447422, -1.599148, 1, 1, 1, 1, 1,
-1.676582, 0.970226, -2.881723, 1, 1, 1, 1, 1,
-1.671363, 0.4516326, -0.4593857, 1, 1, 1, 1, 1,
-1.665091, -0.3289085, -1.427102, 1, 1, 1, 1, 1,
-1.662687, -2.421047, -2.728217, 1, 1, 1, 1, 1,
-1.662151, 1.228865, -1.32548, 1, 1, 1, 1, 1,
-1.653397, -0.5044098, -2.723513, 1, 1, 1, 1, 1,
-1.646787, 0.495007, -1.842682, 1, 1, 1, 1, 1,
-1.646178, -0.2090082, -2.094949, 1, 1, 1, 1, 1,
-1.644615, 0.5993421, -0.02547158, 1, 1, 1, 1, 1,
-1.643122, -0.3622468, -0.0138077, 1, 1, 1, 1, 1,
-1.637452, -1.715247, -2.027154, 1, 1, 1, 1, 1,
-1.626868, 1.966387, -3.631588, 1, 1, 1, 1, 1,
-1.606963, 0.5941111, -1.462876, 0, 0, 1, 1, 1,
-1.577002, -0.407219, -1.705158, 1, 0, 0, 1, 1,
-1.575685, 0.224005, -1.142716, 1, 0, 0, 1, 1,
-1.575123, 1.092826, -0.3050048, 1, 0, 0, 1, 1,
-1.533615, 0.7471783, -1.137461, 1, 0, 0, 1, 1,
-1.521271, 0.2370499, -1.200096, 1, 0, 0, 1, 1,
-1.51298, 1.469309, -0.089641, 0, 0, 0, 1, 1,
-1.510487, -1.396613, -0.5381524, 0, 0, 0, 1, 1,
-1.509456, -0.1901439, -2.887367, 0, 0, 0, 1, 1,
-1.50613, 0.9964421, 0.5367343, 0, 0, 0, 1, 1,
-1.505133, 0.6584015, -2.318897, 0, 0, 0, 1, 1,
-1.496244, -0.8567772, -1.624196, 0, 0, 0, 1, 1,
-1.494089, -0.02715248, -1.605541, 0, 0, 0, 1, 1,
-1.491796, 0.606934, -2.557567, 1, 1, 1, 1, 1,
-1.487582, 0.8378134, -0.2727999, 1, 1, 1, 1, 1,
-1.485254, 0.6785298, -1.959349, 1, 1, 1, 1, 1,
-1.466623, -1.258697, -1.352607, 1, 1, 1, 1, 1,
-1.464036, 0.2735394, -1.79638, 1, 1, 1, 1, 1,
-1.454336, -0.3269874, -2.420737, 1, 1, 1, 1, 1,
-1.449157, -0.5214057, -2.638396, 1, 1, 1, 1, 1,
-1.441355, -0.6214538, 0.323361, 1, 1, 1, 1, 1,
-1.441086, 0.2497376, -2.134996, 1, 1, 1, 1, 1,
-1.436093, -0.7626879, -3.045893, 1, 1, 1, 1, 1,
-1.43462, -2.297126, -1.819863, 1, 1, 1, 1, 1,
-1.425237, 0.3969429, -0.8261763, 1, 1, 1, 1, 1,
-1.415537, 1.604688, -0.9323503, 1, 1, 1, 1, 1,
-1.392433, -0.374838, -2.537867, 1, 1, 1, 1, 1,
-1.378036, 0.7945663, -0.9640877, 1, 1, 1, 1, 1,
-1.377199, -2.742248, -2.766057, 0, 0, 1, 1, 1,
-1.376838, -0.5502014, -2.506333, 1, 0, 0, 1, 1,
-1.375976, -1.075403, -0.9610938, 1, 0, 0, 1, 1,
-1.372934, -0.02997247, -0.1697284, 1, 0, 0, 1, 1,
-1.36928, -1.322449, -2.328378, 1, 0, 0, 1, 1,
-1.361091, -0.5449955, -3.597679, 1, 0, 0, 1, 1,
-1.357841, 0.2505011, -2.126447, 0, 0, 0, 1, 1,
-1.35753, -1.244874, -1.82388, 0, 0, 0, 1, 1,
-1.357391, 0.3148126, -1.175003, 0, 0, 0, 1, 1,
-1.355547, -0.7729545, -2.144843, 0, 0, 0, 1, 1,
-1.346668, -0.9675565, -3.997026, 0, 0, 0, 1, 1,
-1.345294, -0.8374126, -1.576963, 0, 0, 0, 1, 1,
-1.34441, -0.459144, -0.3953219, 0, 0, 0, 1, 1,
-1.342524, 1.17107, -1.044641, 1, 1, 1, 1, 1,
-1.34221, -1.39558, -0.9431871, 1, 1, 1, 1, 1,
-1.338626, 2.188389, -0.8645018, 1, 1, 1, 1, 1,
-1.337801, 1.392383, -1.905435, 1, 1, 1, 1, 1,
-1.318104, -0.5332467, -2.504081, 1, 1, 1, 1, 1,
-1.305331, -1.016387, -3.572135, 1, 1, 1, 1, 1,
-1.302247, 0.5117863, -3.534515, 1, 1, 1, 1, 1,
-1.291092, 0.5868265, -1.798781, 1, 1, 1, 1, 1,
-1.26937, 0.6393397, -0.5002477, 1, 1, 1, 1, 1,
-1.269323, -0.2171974, -1.080307, 1, 1, 1, 1, 1,
-1.265638, -0.4265425, -3.390345, 1, 1, 1, 1, 1,
-1.262779, -0.4270617, -3.926774, 1, 1, 1, 1, 1,
-1.259982, -1.170973, -3.94819, 1, 1, 1, 1, 1,
-1.258688, -0.9504393, -3.834456, 1, 1, 1, 1, 1,
-1.257927, 0.7514971, -0.7506842, 1, 1, 1, 1, 1,
-1.249316, 0.1880336, -1.359219, 0, 0, 1, 1, 1,
-1.24688, -0.1373443, -1.598738, 1, 0, 0, 1, 1,
-1.242825, -1.443408, -3.25674, 1, 0, 0, 1, 1,
-1.241996, -0.5421519, -2.985562, 1, 0, 0, 1, 1,
-1.212889, 2.077553, -1.480978, 1, 0, 0, 1, 1,
-1.206923, -1.651083, -0.7991148, 1, 0, 0, 1, 1,
-1.205473, 1.844465, -1.545265, 0, 0, 0, 1, 1,
-1.199833, -1.327969, -3.680754, 0, 0, 0, 1, 1,
-1.192616, -1.480139, -2.458256, 0, 0, 0, 1, 1,
-1.190437, 0.538685, -0.7047529, 0, 0, 0, 1, 1,
-1.188504, -2.41383, -0.3132735, 0, 0, 0, 1, 1,
-1.179274, 0.9256995, -0.9748945, 0, 0, 0, 1, 1,
-1.174675, 0.8001457, -1.740261, 0, 0, 0, 1, 1,
-1.173024, 0.454713, 0.02647741, 1, 1, 1, 1, 1,
-1.171589, -1.286997, -1.134374, 1, 1, 1, 1, 1,
-1.166916, -0.3133309, -3.090258, 1, 1, 1, 1, 1,
-1.159339, -3.001383, -2.755436, 1, 1, 1, 1, 1,
-1.157935, 0.2294744, -0.6830016, 1, 1, 1, 1, 1,
-1.14568, 0.9078086, -2.503974, 1, 1, 1, 1, 1,
-1.140322, 0.02410511, -1.861991, 1, 1, 1, 1, 1,
-1.131891, -0.2773692, -0.7608411, 1, 1, 1, 1, 1,
-1.114363, -0.1939719, -3.045582, 1, 1, 1, 1, 1,
-1.113921, -1.313939, -1.460185, 1, 1, 1, 1, 1,
-1.109811, 0.1737062, -1.211286, 1, 1, 1, 1, 1,
-1.105774, -0.3802493, -3.059801, 1, 1, 1, 1, 1,
-1.104395, 0.9212722, -0.650253, 1, 1, 1, 1, 1,
-1.101637, 0.9608489, -2.114086, 1, 1, 1, 1, 1,
-1.100846, 0.6446942, -2.569201, 1, 1, 1, 1, 1,
-1.099756, 1.967658, 0.2577367, 0, 0, 1, 1, 1,
-1.096188, -0.3778976, -0.2195054, 1, 0, 0, 1, 1,
-1.091021, 0.2520027, -1.834665, 1, 0, 0, 1, 1,
-1.084134, 0.1056774, -0.8193658, 1, 0, 0, 1, 1,
-1.082155, 0.031627, -1.90814, 1, 0, 0, 1, 1,
-1.081824, -0.02894344, -0.2997639, 1, 0, 0, 1, 1,
-1.081359, -0.8572433, -3.377639, 0, 0, 0, 1, 1,
-1.079965, -0.3353788, -1.514614, 0, 0, 0, 1, 1,
-1.077437, 1.084893, -1.617689, 0, 0, 0, 1, 1,
-1.070703, -0.7259339, -1.677534, 0, 0, 0, 1, 1,
-1.056437, -1.033564, -0.2153971, 0, 0, 0, 1, 1,
-1.053335, -0.8290333, -2.693774, 0, 0, 0, 1, 1,
-1.04798, -1.554393, -3.36901, 0, 0, 0, 1, 1,
-1.046334, 0.219673, -1.53688, 1, 1, 1, 1, 1,
-1.044899, 0.7795524, -0.3937089, 1, 1, 1, 1, 1,
-1.032438, 0.7364144, -1.816797, 1, 1, 1, 1, 1,
-1.022799, 2.050523, 0.2812307, 1, 1, 1, 1, 1,
-1.017134, -0.02364514, -1.477732, 1, 1, 1, 1, 1,
-1.01251, -1.572332, -1.696238, 1, 1, 1, 1, 1,
-1.01094, -1.48195, -2.684134, 1, 1, 1, 1, 1,
-1.010939, 0.1331311, -0.840241, 1, 1, 1, 1, 1,
-1.010398, -0.5134132, -4.084179, 1, 1, 1, 1, 1,
-1.009277, -0.4172496, -0.04735562, 1, 1, 1, 1, 1,
-1.004917, -1.399112, -2.594096, 1, 1, 1, 1, 1,
-1.002024, 0.1076789, -2.224076, 1, 1, 1, 1, 1,
-0.998261, -0.5668168, -2.678629, 1, 1, 1, 1, 1,
-0.9981847, 0.4717554, -0.2945512, 1, 1, 1, 1, 1,
-0.9963899, 1.17876, 0.5076041, 1, 1, 1, 1, 1,
-0.9955505, -0.3176509, -2.712173, 0, 0, 1, 1, 1,
-0.9943817, 0.4810706, -2.086033, 1, 0, 0, 1, 1,
-0.9915745, -1.351493, -0.3243842, 1, 0, 0, 1, 1,
-0.988326, -0.2926221, -1.16198, 1, 0, 0, 1, 1,
-0.9865666, -1.104702, -1.888903, 1, 0, 0, 1, 1,
-0.9811171, -0.473388, -2.822662, 1, 0, 0, 1, 1,
-0.9724932, -1.763822, -2.805591, 0, 0, 0, 1, 1,
-0.971304, -1.472703, -3.689776, 0, 0, 0, 1, 1,
-0.9707599, -1.404822, -2.966652, 0, 0, 0, 1, 1,
-0.9700072, -0.007181921, -2.716517, 0, 0, 0, 1, 1,
-0.9649448, 0.7943102, -1.934362, 0, 0, 0, 1, 1,
-0.9602624, -0.3006549, -3.403668, 0, 0, 0, 1, 1,
-0.9408031, -0.3592065, -0.1937496, 0, 0, 0, 1, 1,
-0.9407734, -0.7546995, -1.044921, 1, 1, 1, 1, 1,
-0.9403555, 0.6360719, -0.6798997, 1, 1, 1, 1, 1,
-0.9251853, 0.4934065, -0.9497266, 1, 1, 1, 1, 1,
-0.9246215, 1.184558, 0.1163017, 1, 1, 1, 1, 1,
-0.9157069, -0.09650624, -0.9747797, 1, 1, 1, 1, 1,
-0.9076443, -1.346169, -3.365006, 1, 1, 1, 1, 1,
-0.9042838, 0.897691, -2.363471, 1, 1, 1, 1, 1,
-0.892469, 1.806517, -1.907229, 1, 1, 1, 1, 1,
-0.8890512, 0.8652788, -3.21436, 1, 1, 1, 1, 1,
-0.8882078, 0.00649847, -1.328829, 1, 1, 1, 1, 1,
-0.8830609, 0.6838711, -2.662978, 1, 1, 1, 1, 1,
-0.8817608, -0.6012155, -4.283414, 1, 1, 1, 1, 1,
-0.8811694, 0.2076293, -2.68709, 1, 1, 1, 1, 1,
-0.8810397, -0.9757551, -2.988109, 1, 1, 1, 1, 1,
-0.8788486, -0.690486, -2.892282, 1, 1, 1, 1, 1,
-0.8785615, -0.08859216, -2.342108, 0, 0, 1, 1, 1,
-0.8760774, 0.05982342, -3.455486, 1, 0, 0, 1, 1,
-0.8750785, -0.8732423, -2.668834, 1, 0, 0, 1, 1,
-0.871277, -0.7574827, -3.17745, 1, 0, 0, 1, 1,
-0.868772, -1.205342, -3.89026, 1, 0, 0, 1, 1,
-0.8667132, -1.776022, -1.916376, 1, 0, 0, 1, 1,
-0.8648399, -1.686772, -1.177296, 0, 0, 0, 1, 1,
-0.8634593, -1.186996, -2.395871, 0, 0, 0, 1, 1,
-0.8612321, -0.3782609, -2.059585, 0, 0, 0, 1, 1,
-0.8553894, -0.3418499, -3.271973, 0, 0, 0, 1, 1,
-0.8492094, 1.181781, 0.4533291, 0, 0, 0, 1, 1,
-0.8449481, 0.1303551, -0.2414908, 0, 0, 0, 1, 1,
-0.8402305, 1.281053, -1.703227, 0, 0, 0, 1, 1,
-0.8390052, 0.4549976, -0.4421855, 1, 1, 1, 1, 1,
-0.8307869, -0.706221, -2.027447, 1, 1, 1, 1, 1,
-0.828038, -2.310746, -2.671817, 1, 1, 1, 1, 1,
-0.8149893, 0.1126787, -1.176317, 1, 1, 1, 1, 1,
-0.8144624, -0.761187, -0.8967971, 1, 1, 1, 1, 1,
-0.8108262, -0.5451152, -2.336277, 1, 1, 1, 1, 1,
-0.8101454, -0.4741461, -2.526521, 1, 1, 1, 1, 1,
-0.7942054, 1.494348, -1.282046, 1, 1, 1, 1, 1,
-0.7933413, 0.3312969, -1.071155, 1, 1, 1, 1, 1,
-0.7894576, -0.9640022, -0.8346347, 1, 1, 1, 1, 1,
-0.7835773, -0.8339335, -1.593283, 1, 1, 1, 1, 1,
-0.7797744, -1.447899, -0.2747149, 1, 1, 1, 1, 1,
-0.779632, -0.3115345, -2.079717, 1, 1, 1, 1, 1,
-0.7785655, -0.3365671, -2.49325, 1, 1, 1, 1, 1,
-0.7780246, 0.6739321, -2.540902, 1, 1, 1, 1, 1,
-0.7702938, 0.3544969, -0.05917833, 0, 0, 1, 1, 1,
-0.7691053, 0.4824407, -0.254058, 1, 0, 0, 1, 1,
-0.766589, 0.8610116, -1.448602, 1, 0, 0, 1, 1,
-0.7662719, -0.5380802, -1.923462, 1, 0, 0, 1, 1,
-0.7622498, 0.08639925, -1.208866, 1, 0, 0, 1, 1,
-0.7618149, -0.06640244, -3.205854, 1, 0, 0, 1, 1,
-0.757798, -0.2093335, -2.10633, 0, 0, 0, 1, 1,
-0.7575138, 0.8581012, -1.293582, 0, 0, 0, 1, 1,
-0.7535765, 0.8365118, 0.3282566, 0, 0, 0, 1, 1,
-0.7502593, 0.6855732, -1.156616, 0, 0, 0, 1, 1,
-0.7459438, 1.361384, -1.006844, 0, 0, 0, 1, 1,
-0.7458799, 0.3408614, 0.08709444, 0, 0, 0, 1, 1,
-0.7444344, 1.768104, -1.658898, 0, 0, 0, 1, 1,
-0.7438235, 0.2351539, -0.8451549, 1, 1, 1, 1, 1,
-0.7416532, -0.1939363, -0.1962034, 1, 1, 1, 1, 1,
-0.7410001, 0.2884757, -2.191274, 1, 1, 1, 1, 1,
-0.7398245, 0.422195, 0.6709878, 1, 1, 1, 1, 1,
-0.7394935, 0.4642964, 1.083797, 1, 1, 1, 1, 1,
-0.7390119, -0.4802862, -2.654123, 1, 1, 1, 1, 1,
-0.7387199, 1.498591, -2.051136, 1, 1, 1, 1, 1,
-0.7361987, 0.1534631, -0.6768076, 1, 1, 1, 1, 1,
-0.7292923, -0.4632329, -1.848739, 1, 1, 1, 1, 1,
-0.7284549, 0.608444, -0.5589074, 1, 1, 1, 1, 1,
-0.7278384, -0.1097291, -0.7728591, 1, 1, 1, 1, 1,
-0.720713, -1.216626, -3.49932, 1, 1, 1, 1, 1,
-0.7171746, -0.1108641, -2.971576, 1, 1, 1, 1, 1,
-0.7138386, 0.6815528, -1.34955, 1, 1, 1, 1, 1,
-0.7119119, -0.6414561, -1.847891, 1, 1, 1, 1, 1,
-0.7093211, -0.5929266, -2.165993, 0, 0, 1, 1, 1,
-0.6969537, 0.479211, -2.699147, 1, 0, 0, 1, 1,
-0.6954673, -0.3972635, -2.187795, 1, 0, 0, 1, 1,
-0.6954631, -0.117846, -1.657023, 1, 0, 0, 1, 1,
-0.6951578, 0.736757, -0.9064482, 1, 0, 0, 1, 1,
-0.6856945, 1.850725, -1.311106, 1, 0, 0, 1, 1,
-0.6834968, -0.06833683, -1.93058, 0, 0, 0, 1, 1,
-0.6810277, -1.407682, -3.749047, 0, 0, 0, 1, 1,
-0.6708127, -0.009314016, -1.508497, 0, 0, 0, 1, 1,
-0.6695355, -0.423573, -1.667772, 0, 0, 0, 1, 1,
-0.6678621, 0.07997784, -2.893346, 0, 0, 0, 1, 1,
-0.6673781, -1.67423, -3.750521, 0, 0, 0, 1, 1,
-0.6663269, 0.2122273, -1.813092, 0, 0, 0, 1, 1,
-0.6624553, 0.912854, -0.666032, 1, 1, 1, 1, 1,
-0.6574068, -0.00933332, -2.380537, 1, 1, 1, 1, 1,
-0.6566828, 1.163896, 0.9208298, 1, 1, 1, 1, 1,
-0.6559188, 0.8705906, 0.2639294, 1, 1, 1, 1, 1,
-0.6558989, 1.57933, 0.3290049, 1, 1, 1, 1, 1,
-0.6556057, 0.6781985, -1.127292, 1, 1, 1, 1, 1,
-0.6541142, 0.8148324, -0.3926012, 1, 1, 1, 1, 1,
-0.6534172, 0.4218227, -1.298863, 1, 1, 1, 1, 1,
-0.6526793, -1.219586, -2.16563, 1, 1, 1, 1, 1,
-0.650968, 0.340402, -1.421809, 1, 1, 1, 1, 1,
-0.6493334, 1.400848, -1.671591, 1, 1, 1, 1, 1,
-0.6477237, 0.2161322, -0.4558056, 1, 1, 1, 1, 1,
-0.6472583, -0.1291431, -1.909855, 1, 1, 1, 1, 1,
-0.6468009, -0.8470899, -3.122295, 1, 1, 1, 1, 1,
-0.6226836, 0.4651484, -0.5921278, 1, 1, 1, 1, 1,
-0.6168534, -0.822217, -2.78131, 0, 0, 1, 1, 1,
-0.6113261, -0.1103821, -2.030728, 1, 0, 0, 1, 1,
-0.6084428, -0.2119666, -2.129071, 1, 0, 0, 1, 1,
-0.6072608, -1.212508, -2.822408, 1, 0, 0, 1, 1,
-0.6066526, 0.1768574, -0.38899, 1, 0, 0, 1, 1,
-0.6051542, 1.730946, 0.3620026, 1, 0, 0, 1, 1,
-0.5988203, 0.3807784, -0.8775794, 0, 0, 0, 1, 1,
-0.5942588, 1.297298, -2.759664, 0, 0, 0, 1, 1,
-0.5891112, -0.7500983, -2.389793, 0, 0, 0, 1, 1,
-0.5890986, -0.9945768, -2.786746, 0, 0, 0, 1, 1,
-0.5815023, -0.6347957, -1.939818, 0, 0, 0, 1, 1,
-0.5776471, -2.03887, -2.371238, 0, 0, 0, 1, 1,
-0.576153, 1.098897, 0.1627045, 0, 0, 0, 1, 1,
-0.572117, 1.457189, -0.08776508, 1, 1, 1, 1, 1,
-0.5674592, 2.697023, -1.169272, 1, 1, 1, 1, 1,
-0.563638, 0.7048094, 1.337766, 1, 1, 1, 1, 1,
-0.5508993, 0.07294571, -1.023158, 1, 1, 1, 1, 1,
-0.5502775, -0.1955753, -2.952553, 1, 1, 1, 1, 1,
-0.5493997, 0.7466524, -0.06408485, 1, 1, 1, 1, 1,
-0.5490571, 1.007678, 0.1311297, 1, 1, 1, 1, 1,
-0.5476031, -0.8255816, -1.114454, 1, 1, 1, 1, 1,
-0.5461859, 0.09107362, -1.706329, 1, 1, 1, 1, 1,
-0.5428067, 0.3168863, -1.578927, 1, 1, 1, 1, 1,
-0.5399907, -0.2773556, -1.529429, 1, 1, 1, 1, 1,
-0.5391007, -1.462608, -3.208394, 1, 1, 1, 1, 1,
-0.5370311, -1.204178, -2.670212, 1, 1, 1, 1, 1,
-0.5366114, 0.5656336, -2.452976, 1, 1, 1, 1, 1,
-0.5312348, 0.7909186, 0.09521075, 1, 1, 1, 1, 1,
-0.5267282, -1.844623, -3.808833, 0, 0, 1, 1, 1,
-0.5260698, -0.1350404, 0.407974, 1, 0, 0, 1, 1,
-0.5217785, 1.003498, -1.725593, 1, 0, 0, 1, 1,
-0.5201015, 0.08650385, -1.433244, 1, 0, 0, 1, 1,
-0.5161635, -1.070122, -1.99921, 1, 0, 0, 1, 1,
-0.5158551, 0.7360972, -1.422907, 1, 0, 0, 1, 1,
-0.5059359, -1.29524, -1.130308, 0, 0, 0, 1, 1,
-0.4999974, 1.307368, -0.4694705, 0, 0, 0, 1, 1,
-0.4910134, -1.049287, -1.720507, 0, 0, 0, 1, 1,
-0.4892234, 0.1929376, -1.330727, 0, 0, 0, 1, 1,
-0.4808408, 1.792623, -1.614473, 0, 0, 0, 1, 1,
-0.4800603, -0.3108317, -3.764693, 0, 0, 0, 1, 1,
-0.4753269, -1.093566, -2.699684, 0, 0, 0, 1, 1,
-0.4750407, -0.1955588, -3.45071, 1, 1, 1, 1, 1,
-0.4743437, 0.3573842, -0.4843409, 1, 1, 1, 1, 1,
-0.469418, -1.290985, -2.328856, 1, 1, 1, 1, 1,
-0.4615768, -0.992169, -1.109581, 1, 1, 1, 1, 1,
-0.4603594, 1.725739, -1.834433, 1, 1, 1, 1, 1,
-0.4593488, -0.6498582, -4.219411, 1, 1, 1, 1, 1,
-0.4564848, 0.9776258, -1.988034, 1, 1, 1, 1, 1,
-0.4533675, -1.424958, -3.077678, 1, 1, 1, 1, 1,
-0.4529807, -0.7209994, -2.029366, 1, 1, 1, 1, 1,
-0.4518923, -0.09255327, -2.810518, 1, 1, 1, 1, 1,
-0.4480864, -1.334479, -2.910486, 1, 1, 1, 1, 1,
-0.4441667, -0.9684755, -2.804352, 1, 1, 1, 1, 1,
-0.4433956, -1.450035, -3.148206, 1, 1, 1, 1, 1,
-0.4404694, -0.8138015, -2.312743, 1, 1, 1, 1, 1,
-0.4349902, 1.237149, -0.2645062, 1, 1, 1, 1, 1,
-0.4259541, -2.311013, -1.798865, 0, 0, 1, 1, 1,
-0.4257754, -0.3033238, -2.261622, 1, 0, 0, 1, 1,
-0.4222435, -1.544323, -2.252409, 1, 0, 0, 1, 1,
-0.4178179, 0.7802269, -1.039085, 1, 0, 0, 1, 1,
-0.4166997, 0.6719114, 0.3972681, 1, 0, 0, 1, 1,
-0.415308, 0.1419838, -1.18222, 1, 0, 0, 1, 1,
-0.4130283, -1.043258, -2.503942, 0, 0, 0, 1, 1,
-0.4102404, -1.394413, -3.319229, 0, 0, 0, 1, 1,
-0.4008041, 0.9504181, 1.048314, 0, 0, 0, 1, 1,
-0.3966568, -0.1301731, -1.235283, 0, 0, 0, 1, 1,
-0.3949802, 0.39742, 0.4567898, 0, 0, 0, 1, 1,
-0.3894956, -0.9667345, -2.438774, 0, 0, 0, 1, 1,
-0.3880738, -0.9400825, -1.701487, 0, 0, 0, 1, 1,
-0.3856136, -0.2346112, 0.7164949, 1, 1, 1, 1, 1,
-0.3810466, -0.4470796, -3.461716, 1, 1, 1, 1, 1,
-0.3786007, -0.1395237, -2.595892, 1, 1, 1, 1, 1,
-0.3782171, 0.2070704, -2.463815, 1, 1, 1, 1, 1,
-0.3771902, 0.8298806, -1.118148, 1, 1, 1, 1, 1,
-0.3759295, -0.4322205, -1.894863, 1, 1, 1, 1, 1,
-0.369331, 0.4623504, -2.00953, 1, 1, 1, 1, 1,
-0.3660442, 0.7035356, -0.3823192, 1, 1, 1, 1, 1,
-0.3654914, 0.1688031, -3.033794, 1, 1, 1, 1, 1,
-0.3646455, -0.4584506, -2.391276, 1, 1, 1, 1, 1,
-0.3633866, 0.8276404, -0.9643293, 1, 1, 1, 1, 1,
-0.3615463, -1.640171, -3.31116, 1, 1, 1, 1, 1,
-0.3607244, -1.809422, -1.168962, 1, 1, 1, 1, 1,
-0.3601539, -0.9032907, -3.532089, 1, 1, 1, 1, 1,
-0.3600279, 0.1097314, -0.4024305, 1, 1, 1, 1, 1,
-0.3588942, -0.2663369, -2.375142, 0, 0, 1, 1, 1,
-0.3574409, -0.2842595, -0.647665, 1, 0, 0, 1, 1,
-0.3571298, 0.6282598, -1.033783, 1, 0, 0, 1, 1,
-0.3562318, 0.5943499, -1.64007, 1, 0, 0, 1, 1,
-0.3556062, 0.3012742, -0.1524587, 1, 0, 0, 1, 1,
-0.3551827, -0.655165, -2.219323, 1, 0, 0, 1, 1,
-0.348473, 0.1249493, -0.3007155, 0, 0, 0, 1, 1,
-0.3436992, 0.8000007, 0.3051589, 0, 0, 0, 1, 1,
-0.3433166, -0.440072, -0.7203024, 0, 0, 0, 1, 1,
-0.3381088, -0.2171086, -1.798147, 0, 0, 0, 1, 1,
-0.3379266, 1.211648, -1.11039, 0, 0, 0, 1, 1,
-0.3363423, -0.5794653, -3.553135, 0, 0, 0, 1, 1,
-0.3353409, -0.7440929, -3.418295, 0, 0, 0, 1, 1,
-0.3350279, 0.9770498, -1.184568, 1, 1, 1, 1, 1,
-0.3342236, 1.222202, 0.5731573, 1, 1, 1, 1, 1,
-0.3311009, 0.4991944, -0.7778851, 1, 1, 1, 1, 1,
-0.3274049, 1.270343, 1.57184, 1, 1, 1, 1, 1,
-0.321645, -0.5577378, -3.32352, 1, 1, 1, 1, 1,
-0.3188493, -1.748572, -3.878621, 1, 1, 1, 1, 1,
-0.3102581, -2.766824, -3.863618, 1, 1, 1, 1, 1,
-0.3079081, -1.330093, -2.463096, 1, 1, 1, 1, 1,
-0.3072236, -0.6946503, -3.240335, 1, 1, 1, 1, 1,
-0.3070742, -0.556577, -2.637329, 1, 1, 1, 1, 1,
-0.3060738, 1.331891, -0.8897455, 1, 1, 1, 1, 1,
-0.2974083, 0.6330932, -0.9005688, 1, 1, 1, 1, 1,
-0.2934656, 1.00105, 0.1388509, 1, 1, 1, 1, 1,
-0.289748, 0.8501621, 0.6447938, 1, 1, 1, 1, 1,
-0.2856181, 0.3195045, -0.9598215, 1, 1, 1, 1, 1,
-0.28049, -0.4201847, -1.404469, 0, 0, 1, 1, 1,
-0.2798951, 1.090793, 0.3376449, 1, 0, 0, 1, 1,
-0.2726778, 1.05393, 1.730373, 1, 0, 0, 1, 1,
-0.2676361, 0.2178573, -1.550077, 1, 0, 0, 1, 1,
-0.2585335, 0.1280329, -1.573626, 1, 0, 0, 1, 1,
-0.2568848, 1.445615, 0.5600517, 1, 0, 0, 1, 1,
-0.2507207, 0.2434629, -0.5915251, 0, 0, 0, 1, 1,
-0.249735, 0.7176029, -0.240162, 0, 0, 0, 1, 1,
-0.2478492, -1.248853, -2.636618, 0, 0, 0, 1, 1,
-0.2471208, -1.905568, -2.664112, 0, 0, 0, 1, 1,
-0.2442189, -0.3311698, -3.850441, 0, 0, 0, 1, 1,
-0.2434419, -0.5500719, -3.420665, 0, 0, 0, 1, 1,
-0.2348192, 1.160165, 0.235365, 0, 0, 0, 1, 1,
-0.2281588, -0.2533879, -3.835784, 1, 1, 1, 1, 1,
-0.2269677, -0.3967571, -3.78774, 1, 1, 1, 1, 1,
-0.2263279, -1.589617, -3.037658, 1, 1, 1, 1, 1,
-0.2253088, 0.9386387, -0.47586, 1, 1, 1, 1, 1,
-0.2251021, -0.278991, -3.308074, 1, 1, 1, 1, 1,
-0.2225252, -0.4511239, -2.620078, 1, 1, 1, 1, 1,
-0.2172517, 0.8333303, 0.3451706, 1, 1, 1, 1, 1,
-0.2125945, 1.018891, -1.719708, 1, 1, 1, 1, 1,
-0.2113722, 1.85321, 0.2077193, 1, 1, 1, 1, 1,
-0.2077807, -0.5301828, -1.729388, 1, 1, 1, 1, 1,
-0.2040968, -1.255947, -1.865011, 1, 1, 1, 1, 1,
-0.2008483, 0.2859928, 0.635268, 1, 1, 1, 1, 1,
-0.1974916, -0.02355477, -2.252595, 1, 1, 1, 1, 1,
-0.1940797, -1.102754, -3.037867, 1, 1, 1, 1, 1,
-0.1906597, -0.8553753, -3.799902, 1, 1, 1, 1, 1,
-0.1841737, -2.047586, -2.808038, 0, 0, 1, 1, 1,
-0.179092, 0.6769641, 0.2548005, 1, 0, 0, 1, 1,
-0.1718837, -0.7475359, -3.312687, 1, 0, 0, 1, 1,
-0.1704024, -0.3221967, -2.978486, 1, 0, 0, 1, 1,
-0.1694613, 1.636594, -1.725988, 1, 0, 0, 1, 1,
-0.1689917, 0.459829, 0.9735242, 1, 0, 0, 1, 1,
-0.1638254, -1.325978, -3.564603, 0, 0, 0, 1, 1,
-0.1608124, 0.5151584, -0.4336013, 0, 0, 0, 1, 1,
-0.1602253, -0.6022198, -2.389886, 0, 0, 0, 1, 1,
-0.1594816, -0.8296261, -2.380617, 0, 0, 0, 1, 1,
-0.1589768, 0.4000023, 1.678061, 0, 0, 0, 1, 1,
-0.1568719, 0.5958608, -0.4591421, 0, 0, 0, 1, 1,
-0.1554496, 1.179488, 0.108956, 0, 0, 0, 1, 1,
-0.1457036, -0.6890301, -3.56777, 1, 1, 1, 1, 1,
-0.1445946, 2.413532, 0.2433404, 1, 1, 1, 1, 1,
-0.143861, -1.075888, -2.532116, 1, 1, 1, 1, 1,
-0.1401209, 0.04535135, -1.855309, 1, 1, 1, 1, 1,
-0.1385106, -0.1104567, -2.529385, 1, 1, 1, 1, 1,
-0.1348105, -0.8174296, -2.806883, 1, 1, 1, 1, 1,
-0.1331852, -1.137357, -4.204435, 1, 1, 1, 1, 1,
-0.1295708, -1.643839, -3.681796, 1, 1, 1, 1, 1,
-0.1291763, 1.453083, 0.7887357, 1, 1, 1, 1, 1,
-0.1287399, 1.120446, -1.286242, 1, 1, 1, 1, 1,
-0.1260114, 0.5637498, -0.4009895, 1, 1, 1, 1, 1,
-0.1257784, 0.2492169, 0.4158773, 1, 1, 1, 1, 1,
-0.1250669, -1.094612, -1.458377, 1, 1, 1, 1, 1,
-0.1246714, 0.8729529, -0.5243766, 1, 1, 1, 1, 1,
-0.1213429, -3.19576, -3.43585, 1, 1, 1, 1, 1,
-0.1186999, 1.736387, -1.126152, 0, 0, 1, 1, 1,
-0.1166968, 1.97112, -1.99855, 1, 0, 0, 1, 1,
-0.1146719, 0.06767059, 0.006947927, 1, 0, 0, 1, 1,
-0.1109395, 0.8630418, 0.3100238, 1, 0, 0, 1, 1,
-0.09992616, 0.4982003, 0.7710391, 1, 0, 0, 1, 1,
-0.09970332, -0.1423903, -4.309888, 1, 0, 0, 1, 1,
-0.09828182, 0.2619038, 0.7158724, 0, 0, 0, 1, 1,
-0.09107682, -2.202505, -2.490069, 0, 0, 0, 1, 1,
-0.0882503, 0.2635059, -0.183409, 0, 0, 0, 1, 1,
-0.08722599, -0.006169265, -2.722252, 0, 0, 0, 1, 1,
-0.08668344, 0.3527828, -0.2400689, 0, 0, 0, 1, 1,
-0.08094542, -0.9241161, -2.322972, 0, 0, 0, 1, 1,
-0.07920841, 1.87286, 0.7197257, 0, 0, 0, 1, 1,
-0.06884632, -0.7014859, -2.411738, 1, 1, 1, 1, 1,
-0.06880256, -0.7245986, -3.098406, 1, 1, 1, 1, 1,
-0.06624145, 0.231463, 1.081206, 1, 1, 1, 1, 1,
-0.06110997, -0.6839045, -4.096519, 1, 1, 1, 1, 1,
-0.06005653, -0.4542688, -2.266333, 1, 1, 1, 1, 1,
-0.05261284, -0.1870527, -4.661503, 1, 1, 1, 1, 1,
-0.05161053, -0.3901611, -3.95681, 1, 1, 1, 1, 1,
-0.04991582, 0.2775175, -0.1233468, 1, 1, 1, 1, 1,
-0.04630521, -0.4276533, -2.348442, 1, 1, 1, 1, 1,
-0.04614409, 0.007200548, -0.8062082, 1, 1, 1, 1, 1,
-0.04522574, 0.0701414, -0.49531, 1, 1, 1, 1, 1,
-0.0397347, -0.8538386, -3.26428, 1, 1, 1, 1, 1,
-0.03899887, -0.1656013, -1.264872, 1, 1, 1, 1, 1,
-0.03421955, 0.200247, 0.3695874, 1, 1, 1, 1, 1,
-0.0310865, 0.4044665, 2.169139, 1, 1, 1, 1, 1,
-0.02987145, 1.019256, -0.2268303, 0, 0, 1, 1, 1,
-0.02972098, -2.71516, -5.905952, 1, 0, 0, 1, 1,
-0.02028372, 0.150953, 0.2833352, 1, 0, 0, 1, 1,
-0.01487165, -1.339681, -3.784749, 1, 0, 0, 1, 1,
-0.01376957, 0.3160733, -0.1407369, 1, 0, 0, 1, 1,
-0.01192236, -0.1372946, -4.521609, 1, 0, 0, 1, 1,
-0.01109307, 0.414756, 0.09013473, 0, 0, 0, 1, 1,
-0.007536941, 1.878932, 0.5201392, 0, 0, 0, 1, 1,
-0.005973231, -0.5190823, -4.064553, 0, 0, 0, 1, 1,
-0.003214468, -0.2430103, -3.457591, 0, 0, 0, 1, 1,
-0.0001070788, 0.2271971, -0.5033959, 0, 0, 0, 1, 1,
0.0002679648, -1.255823, 2.343153, 0, 0, 0, 1, 1,
0.002550173, -1.710098, 4.335495, 0, 0, 0, 1, 1,
0.005181149, -0.274039, 4.060912, 1, 1, 1, 1, 1,
0.01165468, -0.132308, 2.915186, 1, 1, 1, 1, 1,
0.01242662, 0.4472328, 0.4372672, 1, 1, 1, 1, 1,
0.01255996, -0.1578522, 3.508754, 1, 1, 1, 1, 1,
0.01310824, -0.06431087, 3.174917, 1, 1, 1, 1, 1,
0.01320123, 0.3990045, 0.3674788, 1, 1, 1, 1, 1,
0.01446658, 0.2200356, 0.3446169, 1, 1, 1, 1, 1,
0.02428093, -0.5113115, 4.50802, 1, 1, 1, 1, 1,
0.02555347, 1.064533, -1.702594, 1, 1, 1, 1, 1,
0.02674441, -0.2422965, 2.818401, 1, 1, 1, 1, 1,
0.02772072, -0.6917952, 2.182594, 1, 1, 1, 1, 1,
0.0294073, 1.077284, -1.243893, 1, 1, 1, 1, 1,
0.03494679, 0.8291795, -0.6463194, 1, 1, 1, 1, 1,
0.03968709, 0.212136, 0.09362714, 1, 1, 1, 1, 1,
0.04094085, -0.297844, 4.234676, 1, 1, 1, 1, 1,
0.04120733, -0.05328603, 2.774375, 0, 0, 1, 1, 1,
0.04145792, 0.9514892, 1.365377, 1, 0, 0, 1, 1,
0.04573043, -0.1820482, 2.034144, 1, 0, 0, 1, 1,
0.04701082, 0.3737981, 0.8786848, 1, 0, 0, 1, 1,
0.05217607, 0.06819235, 1.114487, 1, 0, 0, 1, 1,
0.05314352, -0.3104876, 4.404293, 1, 0, 0, 1, 1,
0.05376457, -1.076118, 3.857944, 0, 0, 0, 1, 1,
0.05433757, -0.4627425, 3.450801, 0, 0, 0, 1, 1,
0.05598919, -0.5141727, 2.873785, 0, 0, 0, 1, 1,
0.06204508, 1.386593, 1.132208, 0, 0, 0, 1, 1,
0.06471312, -1.362385, 3.36997, 0, 0, 0, 1, 1,
0.06517633, -1.333035, 3.310291, 0, 0, 0, 1, 1,
0.06627702, -1.687079, 4.80099, 0, 0, 0, 1, 1,
0.0755981, 1.155201, 1.61321, 1, 1, 1, 1, 1,
0.07850003, 1.020208, -1.883252, 1, 1, 1, 1, 1,
0.07938453, -0.1468617, 4.641626, 1, 1, 1, 1, 1,
0.08043931, 0.190256, -1.175399, 1, 1, 1, 1, 1,
0.08107336, -0.7540336, 3.811419, 1, 1, 1, 1, 1,
0.08107641, 0.1747386, 1.132423, 1, 1, 1, 1, 1,
0.08230142, -0.6625035, 2.561059, 1, 1, 1, 1, 1,
0.08478, -0.7272928, 2.169168, 1, 1, 1, 1, 1,
0.08489016, 0.05865015, -0.8696246, 1, 1, 1, 1, 1,
0.08671658, -0.3757854, 3.148204, 1, 1, 1, 1, 1,
0.09057268, -0.06440783, 2.486397, 1, 1, 1, 1, 1,
0.0949184, -1.329677, 2.958734, 1, 1, 1, 1, 1,
0.09621266, -0.06087224, 4.724392, 1, 1, 1, 1, 1,
0.09636746, 0.4452417, -0.5851671, 1, 1, 1, 1, 1,
0.1002068, 0.8931935, 1.132472, 1, 1, 1, 1, 1,
0.1008994, -1.268467, 2.23822, 0, 0, 1, 1, 1,
0.1019913, 0.3988104, -0.6253875, 1, 0, 0, 1, 1,
0.1031814, -0.2664849, 2.522433, 1, 0, 0, 1, 1,
0.1038601, 1.451992, 0.07693349, 1, 0, 0, 1, 1,
0.104707, -1.008718, 3.275219, 1, 0, 0, 1, 1,
0.108195, -0.6239391, 1.239551, 1, 0, 0, 1, 1,
0.1082993, 0.5945221, -0.05659341, 0, 0, 0, 1, 1,
0.1109437, -0.5860441, 0.398792, 0, 0, 0, 1, 1,
0.1123039, 0.5043981, -0.2638964, 0, 0, 0, 1, 1,
0.1123154, -1.234546, 1.664447, 0, 0, 0, 1, 1,
0.1240862, 1.307174, 2.173373, 0, 0, 0, 1, 1,
0.1266224, 0.8730712, 1.520156, 0, 0, 0, 1, 1,
0.1276447, -2.219069, 3.312978, 0, 0, 0, 1, 1,
0.1296275, 1.193899, -0.6557879, 1, 1, 1, 1, 1,
0.1405445, 2.180509, 0.04482782, 1, 1, 1, 1, 1,
0.1413767, -0.5183244, 2.746434, 1, 1, 1, 1, 1,
0.1439152, -2.642089, 3.108966, 1, 1, 1, 1, 1,
0.1459489, 0.2491679, 0.9402274, 1, 1, 1, 1, 1,
0.1493509, -1.096557, 3.913366, 1, 1, 1, 1, 1,
0.1522702, -2.271028, 1.853978, 1, 1, 1, 1, 1,
0.1572267, 0.905373, 0.3655851, 1, 1, 1, 1, 1,
0.1593089, -0.6860623, 2.181899, 1, 1, 1, 1, 1,
0.160387, 0.6019565, 1.10738, 1, 1, 1, 1, 1,
0.1608787, -1.252808, 1.380857, 1, 1, 1, 1, 1,
0.1672011, 1.312321, -0.3756776, 1, 1, 1, 1, 1,
0.1722869, -1.27492, 1.628919, 1, 1, 1, 1, 1,
0.1730474, -0.2141098, 5.31691, 1, 1, 1, 1, 1,
0.1730736, 0.9456041, 0.01929787, 1, 1, 1, 1, 1,
0.1747908, -1.032679, 2.825766, 0, 0, 1, 1, 1,
0.1754718, -0.7435129, 3.027026, 1, 0, 0, 1, 1,
0.1806523, 0.2492058, 1.247923, 1, 0, 0, 1, 1,
0.1811813, 0.9989673, 0.6181647, 1, 0, 0, 1, 1,
0.1901224, -1.383245, 3.942158, 1, 0, 0, 1, 1,
0.1901496, 0.2975509, -0.4584325, 1, 0, 0, 1, 1,
0.1917566, -0.6908282, 2.113631, 0, 0, 0, 1, 1,
0.1944116, -0.2371017, 2.865905, 0, 0, 0, 1, 1,
0.1950644, -0.832188, 4.221153, 0, 0, 0, 1, 1,
0.1995506, 0.9361171, 0.2351179, 0, 0, 0, 1, 1,
0.2099933, 0.3372525, 0.001786142, 0, 0, 0, 1, 1,
0.2129018, -0.4265699, 2.398752, 0, 0, 0, 1, 1,
0.2158955, 0.02784928, 2.053906, 0, 0, 0, 1, 1,
0.2159928, -0.3575338, 3.607504, 1, 1, 1, 1, 1,
0.2174851, 1.202226, -0.5810319, 1, 1, 1, 1, 1,
0.2203507, -0.1680655, 3.37446, 1, 1, 1, 1, 1,
0.2205207, -1.121902, 3.765257, 1, 1, 1, 1, 1,
0.2213339, 0.6254717, 1.413149, 1, 1, 1, 1, 1,
0.2228398, -0.1777074, 2.476961, 1, 1, 1, 1, 1,
0.2230687, 2.370625, 1.229975, 1, 1, 1, 1, 1,
0.2250568, 0.4610717, 1.356206, 1, 1, 1, 1, 1,
0.2365814, -0.4128559, 3.528139, 1, 1, 1, 1, 1,
0.2415466, -0.9170581, 3.722983, 1, 1, 1, 1, 1,
0.2418745, -2.373053, 1.118644, 1, 1, 1, 1, 1,
0.2431601, -0.3818061, 4.504116, 1, 1, 1, 1, 1,
0.2445452, -0.5280516, 2.960247, 1, 1, 1, 1, 1,
0.2461975, -1.018622, 2.413888, 1, 1, 1, 1, 1,
0.2479629, 0.4156663, -0.2387881, 1, 1, 1, 1, 1,
0.2493144, 0.2634306, 0.1203786, 0, 0, 1, 1, 1,
0.2495096, -0.7444162, 3.649708, 1, 0, 0, 1, 1,
0.2557361, 0.5665116, 0.3425439, 1, 0, 0, 1, 1,
0.2572546, 1.2755, -0.2586337, 1, 0, 0, 1, 1,
0.2573535, -0.4999187, 2.95033, 1, 0, 0, 1, 1,
0.2623498, 0.4198222, 1.279107, 1, 0, 0, 1, 1,
0.2669198, -0.4249572, 2.073942, 0, 0, 0, 1, 1,
0.2680605, 0.1426115, 0.5336257, 0, 0, 0, 1, 1,
0.2701868, 0.826099, 0.7732407, 0, 0, 0, 1, 1,
0.2708806, -0.4321731, 1.121055, 0, 0, 0, 1, 1,
0.271367, 0.9168018, 0.9117375, 0, 0, 0, 1, 1,
0.2763137, -0.4659149, 0.2900978, 0, 0, 0, 1, 1,
0.285145, -0.2011171, 1.720826, 0, 0, 0, 1, 1,
0.28733, 2.05413, 0.25025, 1, 1, 1, 1, 1,
0.2882759, 0.3270565, 1.246152, 1, 1, 1, 1, 1,
0.2885341, -0.4584795, 2.726065, 1, 1, 1, 1, 1,
0.2885637, -0.4669161, 2.902453, 1, 1, 1, 1, 1,
0.3004048, 1.644161, 0.02599001, 1, 1, 1, 1, 1,
0.3013244, -0.943603, 2.813944, 1, 1, 1, 1, 1,
0.3035206, 0.275382, 2.383188, 1, 1, 1, 1, 1,
0.3088937, 1.463014, -0.4347269, 1, 1, 1, 1, 1,
0.3103622, 1.602567, -0.9124762, 1, 1, 1, 1, 1,
0.3105051, 0.3882121, 0.1767953, 1, 1, 1, 1, 1,
0.3118821, -1.315056, 1.474075, 1, 1, 1, 1, 1,
0.3135794, -2.264464, 1.983893, 1, 1, 1, 1, 1,
0.3142525, -0.2855266, 1.497443, 1, 1, 1, 1, 1,
0.3144454, -1.012427, 4.491094, 1, 1, 1, 1, 1,
0.316038, -0.2785193, 1.445882, 1, 1, 1, 1, 1,
0.31846, 0.9334154, 0.5443777, 0, 0, 1, 1, 1,
0.3203446, -0.6369039, 2.070498, 1, 0, 0, 1, 1,
0.3249863, 0.179902, 1.465901, 1, 0, 0, 1, 1,
0.3305604, -1.046679, 1.32568, 1, 0, 0, 1, 1,
0.335803, 1.294859, 0.640339, 1, 0, 0, 1, 1,
0.3406233, -1.859532, 3.490374, 1, 0, 0, 1, 1,
0.3416196, 0.5222492, -0.1636222, 0, 0, 0, 1, 1,
0.3437274, -0.1248086, 0.7323201, 0, 0, 0, 1, 1,
0.3476325, -1.523863, 1.887823, 0, 0, 0, 1, 1,
0.348728, -0.9855092, 1.630395, 0, 0, 0, 1, 1,
0.351123, -0.505971, 3.285515, 0, 0, 0, 1, 1,
0.3513772, 0.007713437, 1.817242, 0, 0, 0, 1, 1,
0.3557173, -1.104327, 2.866099, 0, 0, 0, 1, 1,
0.3603173, -1.259198, 1.755914, 1, 1, 1, 1, 1,
0.3681149, 0.4537874, 2.750881, 1, 1, 1, 1, 1,
0.3749145, 0.6948172, 0.1922667, 1, 1, 1, 1, 1,
0.3888646, 1.2186, 1.699442, 1, 1, 1, 1, 1,
0.4001915, -0.3088578, 1.669936, 1, 1, 1, 1, 1,
0.4053697, 0.6023804, 0.1196342, 1, 1, 1, 1, 1,
0.4074993, 0.3040096, 1.07743, 1, 1, 1, 1, 1,
0.4087698, -0.0833311, 1.738153, 1, 1, 1, 1, 1,
0.4196927, -0.09342993, 3.641807, 1, 1, 1, 1, 1,
0.4233226, 0.07096621, 2.187771, 1, 1, 1, 1, 1,
0.4279812, 0.2770834, 0.278568, 1, 1, 1, 1, 1,
0.430637, -0.2082527, 1.710549, 1, 1, 1, 1, 1,
0.4312184, -0.6113992, 2.638396, 1, 1, 1, 1, 1,
0.432205, 0.9443412, 1.332985, 1, 1, 1, 1, 1,
0.4337718, 1.58189, 0.9316551, 1, 1, 1, 1, 1,
0.4352997, 0.2913152, 1.604527, 0, 0, 1, 1, 1,
0.4424156, -1.660152, 1.32965, 1, 0, 0, 1, 1,
0.4440477, -0.3763293, 2.528663, 1, 0, 0, 1, 1,
0.452284, 0.048443, -0.1971539, 1, 0, 0, 1, 1,
0.4538186, -0.07084408, 2.117295, 1, 0, 0, 1, 1,
0.4541242, -2.431217, 3.126796, 1, 0, 0, 1, 1,
0.4566094, 1.386162, 0.5910366, 0, 0, 0, 1, 1,
0.4575984, 0.3848855, -0.04096806, 0, 0, 0, 1, 1,
0.4585878, 0.9393424, 0.9019893, 0, 0, 0, 1, 1,
0.4590942, -1.157055, 2.166722, 0, 0, 0, 1, 1,
0.4610709, 0.8265615, 0.129908, 0, 0, 0, 1, 1,
0.4616937, -0.3080784, 2.878793, 0, 0, 0, 1, 1,
0.4704636, -0.8849639, -0.1214029, 0, 0, 0, 1, 1,
0.4725525, -0.9008715, 1.110301, 1, 1, 1, 1, 1,
0.4735643, 0.5859283, 1.669005, 1, 1, 1, 1, 1,
0.4763473, -1.078537, 2.852528, 1, 1, 1, 1, 1,
0.4797454, -1.301055, 2.623743, 1, 1, 1, 1, 1,
0.4801885, -1.059458, 3.432502, 1, 1, 1, 1, 1,
0.4824271, 0.489209, 0.04990403, 1, 1, 1, 1, 1,
0.4833225, 0.2130045, 2.227794, 1, 1, 1, 1, 1,
0.4835293, 0.8950615, 1.043011, 1, 1, 1, 1, 1,
0.4860136, 1.226357, 0.903886, 1, 1, 1, 1, 1,
0.4876274, -1.52977, 1.728839, 1, 1, 1, 1, 1,
0.4913006, 0.2297575, 0.8321454, 1, 1, 1, 1, 1,
0.4921823, 0.8011906, 2.083115, 1, 1, 1, 1, 1,
0.4947739, -1.999601, 4.173054, 1, 1, 1, 1, 1,
0.4967341, -0.6693932, 5.27692, 1, 1, 1, 1, 1,
0.4968908, 0.6535835, 0.1890289, 1, 1, 1, 1, 1,
0.4993674, 1.533739, 0.6619195, 0, 0, 1, 1, 1,
0.5013362, -0.3526937, 0.6410589, 1, 0, 0, 1, 1,
0.5040438, -0.2972312, 0.5509668, 1, 0, 0, 1, 1,
0.504636, -1.273177, 3.699344, 1, 0, 0, 1, 1,
0.5147896, 1.955717, 1.211865, 1, 0, 0, 1, 1,
0.5157079, -0.1234062, 2.275817, 1, 0, 0, 1, 1,
0.5167736, -0.2564355, 2.869873, 0, 0, 0, 1, 1,
0.5175834, 1.99306, -0.5747974, 0, 0, 0, 1, 1,
0.5179572, -0.4890589, 2.229192, 0, 0, 0, 1, 1,
0.5198439, -0.1674307, 1.946615, 0, 0, 0, 1, 1,
0.5254318, -0.8302628, 3.203233, 0, 0, 0, 1, 1,
0.5260704, -0.9688314, 1.647252, 0, 0, 0, 1, 1,
0.5291124, 1.856161, 0.2137032, 0, 0, 0, 1, 1,
0.5356102, 1.522434, 0.08713896, 1, 1, 1, 1, 1,
0.5373757, -2.739351, 3.487688, 1, 1, 1, 1, 1,
0.5378277, -0.03219503, 1.507115, 1, 1, 1, 1, 1,
0.538825, 0.4916745, 1.575955, 1, 1, 1, 1, 1,
0.5397022, 0.3314889, 0.2001312, 1, 1, 1, 1, 1,
0.5405734, 0.08342575, 2.373946, 1, 1, 1, 1, 1,
0.5442851, 0.3073801, 2.577723, 1, 1, 1, 1, 1,
0.5469771, -0.08248994, 1.026955, 1, 1, 1, 1, 1,
0.550578, 1.037444, 0.9274912, 1, 1, 1, 1, 1,
0.5536274, -0.6882518, 3.692337, 1, 1, 1, 1, 1,
0.5559626, -1.620205, 1.950636, 1, 1, 1, 1, 1,
0.5617994, -1.031199, 2.073419, 1, 1, 1, 1, 1,
0.5650359, 1.886722, -1.080973, 1, 1, 1, 1, 1,
0.5653011, -0.3824678, 3.279128, 1, 1, 1, 1, 1,
0.5730654, 0.201544, 2.470694, 1, 1, 1, 1, 1,
0.575693, 2.054352, -0.1975187, 0, 0, 1, 1, 1,
0.5767508, 1.978613, 0.7219455, 1, 0, 0, 1, 1,
0.5851889, 0.08808101, 2.589419, 1, 0, 0, 1, 1,
0.5858127, -1.44225, 2.138025, 1, 0, 0, 1, 1,
0.5966666, -1.177865, 3.776538, 1, 0, 0, 1, 1,
0.5983924, -0.5877051, 2.629839, 1, 0, 0, 1, 1,
0.6028497, -1.60333, 0.9633572, 0, 0, 0, 1, 1,
0.6053222, 0.7064207, 1.358067, 0, 0, 0, 1, 1,
0.6088649, -0.6571908, 1.203753, 0, 0, 0, 1, 1,
0.6112167, 1.367849, -0.5389931, 0, 0, 0, 1, 1,
0.6118637, -0.4181019, 2.523736, 0, 0, 0, 1, 1,
0.6159112, -0.7196995, 3.104397, 0, 0, 0, 1, 1,
0.6203917, -1.390608, 3.716684, 0, 0, 0, 1, 1,
0.6246976, 0.8476605, 1.8619, 1, 1, 1, 1, 1,
0.6281075, -0.359672, 1.504727, 1, 1, 1, 1, 1,
0.6286277, 0.1920115, 2.054582, 1, 1, 1, 1, 1,
0.6332172, 0.09804713, 0.7282493, 1, 1, 1, 1, 1,
0.6339656, -0.1191256, 1.17215, 1, 1, 1, 1, 1,
0.6372159, 0.5205879, -0.543969, 1, 1, 1, 1, 1,
0.6383882, -0.7575303, 1.258709, 1, 1, 1, 1, 1,
0.6396564, 0.06888597, 1.771354, 1, 1, 1, 1, 1,
0.6399559, 0.3237263, 1.276849, 1, 1, 1, 1, 1,
0.6418532, 0.7611493, -1.135588, 1, 1, 1, 1, 1,
0.6419137, -0.1230949, 2.569227, 1, 1, 1, 1, 1,
0.6420709, -0.1783395, 2.557641, 1, 1, 1, 1, 1,
0.6448805, 0.3589698, -0.001811344, 1, 1, 1, 1, 1,
0.6471884, 0.3322067, 0.4858809, 1, 1, 1, 1, 1,
0.6501856, 0.5885085, 1.351757, 1, 1, 1, 1, 1,
0.6505641, -0.3471952, 1.131824, 0, 0, 1, 1, 1,
0.6566162, -0.6087108, 3.363958, 1, 0, 0, 1, 1,
0.6608595, 1.54315, -1.37216, 1, 0, 0, 1, 1,
0.6681491, 0.7237798, -0.2143002, 1, 0, 0, 1, 1,
0.6696837, -1.212698, 1.663531, 1, 0, 0, 1, 1,
0.6700343, 0.5082015, 1.899862, 1, 0, 0, 1, 1,
0.6707582, -1.059282, 4.572658, 0, 0, 0, 1, 1,
0.6769356, -0.448334, 2.580143, 0, 0, 0, 1, 1,
0.6818933, 0.320983, 2.226827, 0, 0, 0, 1, 1,
0.6821285, -0.7222785, 2.410796, 0, 0, 0, 1, 1,
0.6826333, 0.7161974, -1.023435, 0, 0, 0, 1, 1,
0.6948166, 1.839738, 0.3253291, 0, 0, 0, 1, 1,
0.6957731, 0.1529574, 1.454171, 0, 0, 0, 1, 1,
0.6968625, 0.9633476, 1.232289, 1, 1, 1, 1, 1,
0.6997019, -0.5066751, 3.339807, 1, 1, 1, 1, 1,
0.6997732, -0.5294593, 2.644502, 1, 1, 1, 1, 1,
0.7008067, -1.232106, 3.106337, 1, 1, 1, 1, 1,
0.7055056, 0.03308223, 0.4478432, 1, 1, 1, 1, 1,
0.7126614, 0.7168118, 0.9190326, 1, 1, 1, 1, 1,
0.7166691, 1.862582, 0.4000035, 1, 1, 1, 1, 1,
0.7196571, -0.1005985, 1.620538, 1, 1, 1, 1, 1,
0.7223321, 1.352582, 1.410142, 1, 1, 1, 1, 1,
0.7235831, 1.329479, -0.9249119, 1, 1, 1, 1, 1,
0.7293466, -0.2537611, 1.575229, 1, 1, 1, 1, 1,
0.7340676, 0.5302306, 0.8800118, 1, 1, 1, 1, 1,
0.7376099, 2.018411, -0.2306885, 1, 1, 1, 1, 1,
0.741544, 0.4714516, 2.930845, 1, 1, 1, 1, 1,
0.741623, 0.4269226, -0.720817, 1, 1, 1, 1, 1,
0.7419345, 0.3919467, 0.04295699, 0, 0, 1, 1, 1,
0.7430609, -0.07574697, 3.284954, 1, 0, 0, 1, 1,
0.746744, 0.9900669, 1.124412, 1, 0, 0, 1, 1,
0.747723, -0.4648866, 2.023786, 1, 0, 0, 1, 1,
0.7514222, -0.3947091, 1.723844, 1, 0, 0, 1, 1,
0.7541302, -0.2934925, 3.823648, 1, 0, 0, 1, 1,
0.7560329, -1.399517, 3.704608, 0, 0, 0, 1, 1,
0.7599957, 0.6961309, 1.351183, 0, 0, 0, 1, 1,
0.7620924, 0.6999223, 0.6426209, 0, 0, 0, 1, 1,
0.7622467, -1.055484, 2.470103, 0, 0, 0, 1, 1,
0.7634292, 0.8668742, 0.8753286, 0, 0, 0, 1, 1,
0.7670894, 0.7603874, -0.316424, 0, 0, 0, 1, 1,
0.7679458, -0.8059635, 3.562741, 0, 0, 0, 1, 1,
0.7696705, 0.7710339, 0.7116441, 1, 1, 1, 1, 1,
0.7733672, -0.3139015, 2.286664, 1, 1, 1, 1, 1,
0.7776135, 0.9761005, 1.411534, 1, 1, 1, 1, 1,
0.7783767, 1.13554, -0.5971348, 1, 1, 1, 1, 1,
0.7826783, -0.913641, 0.627584, 1, 1, 1, 1, 1,
0.786525, 0.6327702, 1.142112, 1, 1, 1, 1, 1,
0.7868639, 0.122454, 1.953135, 1, 1, 1, 1, 1,
0.7882856, -0.2844989, 2.458315, 1, 1, 1, 1, 1,
0.790232, -0.07916999, 0.6087549, 1, 1, 1, 1, 1,
0.7964403, -0.8839508, 3.131003, 1, 1, 1, 1, 1,
0.8014249, 0.05922164, 1.944213, 1, 1, 1, 1, 1,
0.8041021, -0.8541375, 1.270967, 1, 1, 1, 1, 1,
0.8070673, 0.9133681, 1.369326, 1, 1, 1, 1, 1,
0.8138192, -0.9808798, 1.40702, 1, 1, 1, 1, 1,
0.8187302, 1.06599, 0.922226, 1, 1, 1, 1, 1,
0.8202292, -0.6865304, 1.546056, 0, 0, 1, 1, 1,
0.8241729, 0.4346338, -0.5322336, 1, 0, 0, 1, 1,
0.8280028, 1.197319, 1.51973, 1, 0, 0, 1, 1,
0.8309804, 2.681653, 0.7069526, 1, 0, 0, 1, 1,
0.8316031, -0.834241, 3.761787, 1, 0, 0, 1, 1,
0.8339618, 0.2869048, 0.6421484, 1, 0, 0, 1, 1,
0.845485, -1.836234, 2.502744, 0, 0, 0, 1, 1,
0.8493412, -1.03041, 1.074042, 0, 0, 0, 1, 1,
0.8572527, 0.6447155, 0.5117836, 0, 0, 0, 1, 1,
0.8630948, 1.822286, 0.2742469, 0, 0, 0, 1, 1,
0.8655981, 0.2382997, -1.214359, 0, 0, 0, 1, 1,
0.8663096, 1.174257, -0.2196694, 0, 0, 0, 1, 1,
0.8690497, 0.001316787, -0.2847321, 0, 0, 0, 1, 1,
0.8774596, -1.036453, 2.660666, 1, 1, 1, 1, 1,
0.8785439, 0.05101547, 2.588192, 1, 1, 1, 1, 1,
0.8859957, -0.5699075, 1.592281, 1, 1, 1, 1, 1,
0.8879816, -0.05264415, 1.523794, 1, 1, 1, 1, 1,
0.8925003, 2.481573, 1.558576, 1, 1, 1, 1, 1,
0.8927124, 1.202767, 0.726828, 1, 1, 1, 1, 1,
0.8972605, -1.138028, 3.672017, 1, 1, 1, 1, 1,
0.8989584, 1.234181, 0.3295118, 1, 1, 1, 1, 1,
0.9044977, 0.5193146, 0.5573483, 1, 1, 1, 1, 1,
0.9059506, -0.6561674, 2.830525, 1, 1, 1, 1, 1,
0.9091557, -1.176606, 4.047286, 1, 1, 1, 1, 1,
0.9174269, -0.1955726, 0.01616012, 1, 1, 1, 1, 1,
0.9256862, -2.217607, 4.415224, 1, 1, 1, 1, 1,
0.926011, -0.8636034, 1.48835, 1, 1, 1, 1, 1,
0.9314789, 0.3240446, 1.057879, 1, 1, 1, 1, 1,
0.9357869, 0.8545729, 2.016787, 0, 0, 1, 1, 1,
0.9368622, 0.1464017, 3.36559, 1, 0, 0, 1, 1,
0.9416791, 0.02638488, 0.5034177, 1, 0, 0, 1, 1,
0.9475051, -0.9222273, 3.255839, 1, 0, 0, 1, 1,
0.9502885, 0.1480488, 2.160029, 1, 0, 0, 1, 1,
0.9520193, 0.2366261, -0.3390096, 1, 0, 0, 1, 1,
0.9544193, 0.9651554, -0.8519416, 0, 0, 0, 1, 1,
0.9635102, 0.5611745, -0.01706152, 0, 0, 0, 1, 1,
0.9673564, -0.8259686, 3.370716, 0, 0, 0, 1, 1,
0.9689542, 0.006690849, -0.5943752, 0, 0, 0, 1, 1,
0.9694346, 0.3510963, 2.160247, 0, 0, 0, 1, 1,
0.9749796, 0.7869454, 0.2588219, 0, 0, 0, 1, 1,
0.9783357, -0.1536837, 2.425437, 0, 0, 0, 1, 1,
0.9784998, 0.7700112, -0.5455693, 1, 1, 1, 1, 1,
0.9806592, -0.2155635, 0.9004503, 1, 1, 1, 1, 1,
0.9867205, -0.8335773, 2.543503, 1, 1, 1, 1, 1,
0.9867237, 1.171312, 0.17584, 1, 1, 1, 1, 1,
0.9872375, -0.1029248, 2.477015, 1, 1, 1, 1, 1,
0.9993218, 0.8813541, 1.709491, 1, 1, 1, 1, 1,
0.9994863, -2.51488, 1.596811, 1, 1, 1, 1, 1,
1.000573, -0.4479138, 1.363573, 1, 1, 1, 1, 1,
1.00902, 0.1290942, 1.395655, 1, 1, 1, 1, 1,
1.010045, 0.767404, 1.715959, 1, 1, 1, 1, 1,
1.01159, 0.05229967, 1.980896, 1, 1, 1, 1, 1,
1.015134, -0.6398541, 2.514051, 1, 1, 1, 1, 1,
1.021048, -0.7685622, 0.6560085, 1, 1, 1, 1, 1,
1.02218, 0.2041325, 2.470056, 1, 1, 1, 1, 1,
1.028404, -0.02564108, 1.47668, 1, 1, 1, 1, 1,
1.029756, -0.428574, 1.99985, 0, 0, 1, 1, 1,
1.029786, 1.687513, 1.578338, 1, 0, 0, 1, 1,
1.030321, 1.954867, 2.176306, 1, 0, 0, 1, 1,
1.032987, 1.41934, -0.1228652, 1, 0, 0, 1, 1,
1.047173, -0.9625325, 2.230327, 1, 0, 0, 1, 1,
1.048879, -1.092467, 3.380384, 1, 0, 0, 1, 1,
1.057402, -1.333982, 2.043971, 0, 0, 0, 1, 1,
1.066824, 0.2284219, -0.2684612, 0, 0, 0, 1, 1,
1.067418, -1.502661, 5.350981, 0, 0, 0, 1, 1,
1.069627, 0.1774754, 0.9836918, 0, 0, 0, 1, 1,
1.070024, 0.5018198, -0.2370001, 0, 0, 0, 1, 1,
1.072398, 0.5483947, 0.2515296, 0, 0, 0, 1, 1,
1.074047, 0.4073304, 1.912118, 0, 0, 0, 1, 1,
1.077245, 2.046171, 2.164827, 1, 1, 1, 1, 1,
1.086094, 1.503066, 1.055795, 1, 1, 1, 1, 1,
1.086836, 0.7110872, 0.7005894, 1, 1, 1, 1, 1,
1.090143, 0.5002265, 1.111746, 1, 1, 1, 1, 1,
1.10416, -0.8725125, 2.96441, 1, 1, 1, 1, 1,
1.105007, 2.771532, 1.097598, 1, 1, 1, 1, 1,
1.108457, -0.1573132, 1.31698, 1, 1, 1, 1, 1,
1.120271, -0.9851229, 1.756209, 1, 1, 1, 1, 1,
1.122053, 0.2387257, 1.362968, 1, 1, 1, 1, 1,
1.123988, -0.927829, 1.895363, 1, 1, 1, 1, 1,
1.131006, 2.103089, 2.201329, 1, 1, 1, 1, 1,
1.142019, -0.8178213, 1.059874, 1, 1, 1, 1, 1,
1.144973, 0.1069637, 2.46733, 1, 1, 1, 1, 1,
1.152019, -1.544975, 3.490087, 1, 1, 1, 1, 1,
1.157486, -1.333603, 2.279702, 1, 1, 1, 1, 1,
1.157807, 1.9626, 1.298123, 0, 0, 1, 1, 1,
1.167022, 0.5207821, 0.6871878, 1, 0, 0, 1, 1,
1.16711, -0.6211936, 2.201659, 1, 0, 0, 1, 1,
1.169371, -1.278561, 2.224518, 1, 0, 0, 1, 1,
1.175069, 0.516826, 0.5897385, 1, 0, 0, 1, 1,
1.179704, -0.1762725, 2.645118, 1, 0, 0, 1, 1,
1.190916, 0.6026666, -0.4164221, 0, 0, 0, 1, 1,
1.192423, 0.4345506, -0.1215715, 0, 0, 0, 1, 1,
1.194702, 0.7355023, 1.333448, 0, 0, 0, 1, 1,
1.195278, 0.1344023, 1.657488, 0, 0, 0, 1, 1,
1.195441, -0.09675828, 1.407954, 0, 0, 0, 1, 1,
1.198636, -0.9586641, 3.379192, 0, 0, 0, 1, 1,
1.202201, 0.4580969, 2.316754, 0, 0, 0, 1, 1,
1.205072, -0.7631935, 0.08162933, 1, 1, 1, 1, 1,
1.21808, 0.3421427, -0.6478779, 1, 1, 1, 1, 1,
1.219513, 1.060594, -0.9674303, 1, 1, 1, 1, 1,
1.223535, -0.9614778, 1.597443, 1, 1, 1, 1, 1,
1.225305, 1.103288, 3.177997, 1, 1, 1, 1, 1,
1.232967, -0.4978808, 1.76438, 1, 1, 1, 1, 1,
1.282637, 0.6934771, 2.314567, 1, 1, 1, 1, 1,
1.288565, -0.4681641, 0.5478038, 1, 1, 1, 1, 1,
1.328753, 1.173273, 1.670362, 1, 1, 1, 1, 1,
1.343689, -0.009177121, 1.369875, 1, 1, 1, 1, 1,
1.348394, -0.6256687, 2.712437, 1, 1, 1, 1, 1,
1.355912, 1.5067, 2.156642, 1, 1, 1, 1, 1,
1.357089, -0.4977216, 0.730919, 1, 1, 1, 1, 1,
1.357111, 0.3868769, 1.931628, 1, 1, 1, 1, 1,
1.361225, 0.5190313, 2.017154, 1, 1, 1, 1, 1,
1.375691, 0.4852476, 1.409895, 0, 0, 1, 1, 1,
1.375848, -0.3623959, 2.278152, 1, 0, 0, 1, 1,
1.378043, -1.256711, 0.2810822, 1, 0, 0, 1, 1,
1.380371, -0.5464063, 0.797785, 1, 0, 0, 1, 1,
1.389264, 0.6045237, -0.003347057, 1, 0, 0, 1, 1,
1.39145, -2.258903, 3.99494, 1, 0, 0, 1, 1,
1.392242, 0.4492386, 0.1165021, 0, 0, 0, 1, 1,
1.393197, -0.3091903, 1.782201, 0, 0, 0, 1, 1,
1.393773, 0.436317, 1.998367, 0, 0, 0, 1, 1,
1.394595, 2.938334, 0.5051612, 0, 0, 0, 1, 1,
1.403129, 1.993814, -0.9925269, 0, 0, 0, 1, 1,
1.405291, -0.4870916, 0.5247562, 0, 0, 0, 1, 1,
1.414005, -1.178569, 2.578497, 0, 0, 0, 1, 1,
1.427548, 0.5744092, 1.07966, 1, 1, 1, 1, 1,
1.428046, -0.9068808, 2.217842, 1, 1, 1, 1, 1,
1.445707, 1.422757, 1.138253, 1, 1, 1, 1, 1,
1.4519, 1.240714, 0.02525755, 1, 1, 1, 1, 1,
1.45691, 1.419678, 1.271325, 1, 1, 1, 1, 1,
1.460582, -1.162923, 3.103543, 1, 1, 1, 1, 1,
1.480195, 0.4572573, -0.4478029, 1, 1, 1, 1, 1,
1.480428, -0.5305919, 1.578197, 1, 1, 1, 1, 1,
1.49083, 0.8385888, -2.186287, 1, 1, 1, 1, 1,
1.503475, -1.019174, 2.18099, 1, 1, 1, 1, 1,
1.50486, 1.515089, 1.434129, 1, 1, 1, 1, 1,
1.510345, 0.08302757, 1.642657, 1, 1, 1, 1, 1,
1.510684, -0.04149013, -0.1347344, 1, 1, 1, 1, 1,
1.5162, -0.5633405, 1.678613, 1, 1, 1, 1, 1,
1.516461, -0.2928246, 2.149993, 1, 1, 1, 1, 1,
1.528919, -0.107041, 1.076084, 0, 0, 1, 1, 1,
1.537412, -1.248784, 1.669029, 1, 0, 0, 1, 1,
1.541085, 0.4931618, -0.2668603, 1, 0, 0, 1, 1,
1.542665, -0.7082054, 2.787343, 1, 0, 0, 1, 1,
1.545176, 2.412352, -0.8308942, 1, 0, 0, 1, 1,
1.548763, 0.3650007, 0.3330026, 1, 0, 0, 1, 1,
1.54915, 0.8306376, 1.613226, 0, 0, 0, 1, 1,
1.562774, -1.036195, 3.320108, 0, 0, 0, 1, 1,
1.587162, -0.1476198, 4.159239, 0, 0, 0, 1, 1,
1.592049, 0.6785381, 0.3362121, 0, 0, 0, 1, 1,
1.593748, -1.04528, 0.7781772, 0, 0, 0, 1, 1,
1.595658, 0.2475838, 2.057965, 0, 0, 0, 1, 1,
1.598386, -0.1626004, 1.647747, 0, 0, 0, 1, 1,
1.604868, 1.735152, 0.5575515, 1, 1, 1, 1, 1,
1.605473, -0.1373025, 2.346338, 1, 1, 1, 1, 1,
1.617512, 0.4753965, 2.364267, 1, 1, 1, 1, 1,
1.63016, 1.29846, 0.4722329, 1, 1, 1, 1, 1,
1.636672, -0.3984577, 1.320303, 1, 1, 1, 1, 1,
1.644389, -0.4033589, 2.631946, 1, 1, 1, 1, 1,
1.646936, -0.3112046, 1.243238, 1, 1, 1, 1, 1,
1.65289, -0.05535468, 3.324126, 1, 1, 1, 1, 1,
1.658345, -0.4059472, 2.250881, 1, 1, 1, 1, 1,
1.679107, -1.597513, 3.193781, 1, 1, 1, 1, 1,
1.679266, -1.36658, 1.827527, 1, 1, 1, 1, 1,
1.682966, -0.5733834, 3.080667, 1, 1, 1, 1, 1,
1.687634, -0.239941, 3.456896, 1, 1, 1, 1, 1,
1.692171, 0.1116318, 1.855821, 1, 1, 1, 1, 1,
1.697966, -0.9366478, 2.769614, 1, 1, 1, 1, 1,
1.740881, -0.2617029, 1.055456, 0, 0, 1, 1, 1,
1.743739, -0.1628218, 1.797873, 1, 0, 0, 1, 1,
1.761161, 0.1755084, 1.792478, 1, 0, 0, 1, 1,
1.76935, 0.03756241, -0.3716554, 1, 0, 0, 1, 1,
1.772643, -0.4413233, 1.627603, 1, 0, 0, 1, 1,
1.779222, -1.438798, 2.615176, 1, 0, 0, 1, 1,
1.779691, -1.116732, 3.329702, 0, 0, 0, 1, 1,
1.804773, 0.2457781, 0.3519543, 0, 0, 0, 1, 1,
1.818518, -0.5342796, 2.111809, 0, 0, 0, 1, 1,
1.826378, 1.33209, 1.342957, 0, 0, 0, 1, 1,
1.84072, -1.179087, 4.082553, 0, 0, 0, 1, 1,
1.853806, 0.2236792, 2.259134, 0, 0, 0, 1, 1,
1.873729, -1.03921, 2.146163, 0, 0, 0, 1, 1,
1.884551, 0.2534589, 2.73169, 1, 1, 1, 1, 1,
1.889458, -0.5985931, 2.954397, 1, 1, 1, 1, 1,
1.917709, 0.7244482, 2.560024, 1, 1, 1, 1, 1,
1.931256, 1.105737, 1.520129, 1, 1, 1, 1, 1,
1.959819, 0.07248471, 1.750747, 1, 1, 1, 1, 1,
1.983889, 1.206599, 1.608171, 1, 1, 1, 1, 1,
1.992364, -0.6806874, 2.883356, 1, 1, 1, 1, 1,
1.993547, -1.716295, 2.99678, 1, 1, 1, 1, 1,
1.995238, -0.6868935, 1.519286, 1, 1, 1, 1, 1,
2.007196, -0.4070502, 1.625807, 1, 1, 1, 1, 1,
2.020828, 1.120878, -0.1152652, 1, 1, 1, 1, 1,
2.111285, -0.5832409, 1.133144, 1, 1, 1, 1, 1,
2.122103, -0.1701185, 0.8108299, 1, 1, 1, 1, 1,
2.125606, 0.7103258, 0.07630211, 1, 1, 1, 1, 1,
2.128713, 0.7165657, 1.232354, 1, 1, 1, 1, 1,
2.132601, 0.9753357, 1.925286, 0, 0, 1, 1, 1,
2.1462, 0.8326401, 1.566353, 1, 0, 0, 1, 1,
2.148194, 0.9832545, 2.363651, 1, 0, 0, 1, 1,
2.240695, 0.7204291, 1.314748, 1, 0, 0, 1, 1,
2.243289, -1.027019, 1.04124, 1, 0, 0, 1, 1,
2.248435, 0.0377066, 2.815883, 1, 0, 0, 1, 1,
2.281357, -1.535283, 0.6020581, 0, 0, 0, 1, 1,
2.333165, 0.5659354, -0.5811927, 0, 0, 0, 1, 1,
2.428174, 0.5124269, 1.082133, 0, 0, 0, 1, 1,
2.451999, -0.7912068, 2.139067, 0, 0, 0, 1, 1,
2.501209, -1.298217, 2.22053, 0, 0, 0, 1, 1,
2.520988, 0.03700567, 1.367038, 0, 0, 0, 1, 1,
2.550045, -0.2733929, 1.662651, 0, 0, 0, 1, 1,
2.608877, 0.9766277, 1.600317, 1, 1, 1, 1, 1,
2.804892, 0.5678318, 1.838619, 1, 1, 1, 1, 1,
2.804995, -0.3644619, 1.918105, 1, 1, 1, 1, 1,
2.824637, -1.030227, 1.993604, 1, 1, 1, 1, 1,
2.866546, 0.7425146, 2.391142, 1, 1, 1, 1, 1,
2.928483, 0.669215, 1.352329, 1, 1, 1, 1, 1,
2.975247, 1.510731, 0.8337446, 1, 1, 1, 1, 1
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
var radius = 9.740431;
var distance = 34.21285;
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
mvMatrix.translate( 0.2594274, 0.1287127, 0.2774856 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21285);
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
