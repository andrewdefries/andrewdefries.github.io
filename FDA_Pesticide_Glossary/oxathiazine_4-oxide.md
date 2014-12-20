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
-3.493246, -0.03439162, -2.331123, 1, 0, 0, 1,
-2.986487, -0.6308661, -2.075808, 1, 0.007843138, 0, 1,
-2.63366, -0.9660504, -1.598303, 1, 0.01176471, 0, 1,
-2.584381, -1.769108, -2.065454, 1, 0.01960784, 0, 1,
-2.323062, 0.03059981, -0.9063057, 1, 0.02352941, 0, 1,
-2.319908, 0.6704863, -2.514733, 1, 0.03137255, 0, 1,
-2.263085, 1.026434, 0.3915435, 1, 0.03529412, 0, 1,
-2.248563, -1.069379, -1.010482, 1, 0.04313726, 0, 1,
-2.231447, -0.8452178, -0.2481369, 1, 0.04705882, 0, 1,
-2.21831, 0.3139436, -1.456974, 1, 0.05490196, 0, 1,
-2.196417, 0.1335819, -2.912239, 1, 0.05882353, 0, 1,
-2.123326, 0.2887576, -2.159128, 1, 0.06666667, 0, 1,
-2.122649, 0.3022127, -2.842687, 1, 0.07058824, 0, 1,
-2.119618, -0.8761441, -3.201267, 1, 0.07843138, 0, 1,
-2.107701, -0.9562636, -1.97625, 1, 0.08235294, 0, 1,
-2.079895, 0.4002247, -2.639685, 1, 0.09019608, 0, 1,
-2.07759, -0.5081736, -1.636433, 1, 0.09411765, 0, 1,
-2.07537, -1.981262, -3.93687, 1, 0.1019608, 0, 1,
-2.045503, -1.991047, -2.840426, 1, 0.1098039, 0, 1,
-2.017152, 2.802325, -0.4738156, 1, 0.1137255, 0, 1,
-1.992355, 2.612496, 0.07281799, 1, 0.1215686, 0, 1,
-1.983149, -0.8552051, -2.053369, 1, 0.1254902, 0, 1,
-1.971808, -0.1555436, -2.849154, 1, 0.1333333, 0, 1,
-1.963471, 1.405855, -0.5515864, 1, 0.1372549, 0, 1,
-1.919529, -1.365442, -0.9694819, 1, 0.145098, 0, 1,
-1.896513, -0.4736841, -1.606924, 1, 0.1490196, 0, 1,
-1.879026, -0.79032, -0.2130349, 1, 0.1568628, 0, 1,
-1.840396, -0.903641, -1.627088, 1, 0.1607843, 0, 1,
-1.792831, -1.265759, -1.61333, 1, 0.1686275, 0, 1,
-1.792795, 1.704089, -0.8335134, 1, 0.172549, 0, 1,
-1.77849, 1.710479, -0.03702905, 1, 0.1803922, 0, 1,
-1.767608, 0.201381, -1.177557, 1, 0.1843137, 0, 1,
-1.736814, 0.4682318, -2.249023, 1, 0.1921569, 0, 1,
-1.717742, 0.97259, -0.8349702, 1, 0.1960784, 0, 1,
-1.699501, -2.069754, -1.8927, 1, 0.2039216, 0, 1,
-1.699141, -0.5210248, 0.4303928, 1, 0.2117647, 0, 1,
-1.694982, -0.5210437, -0.9813501, 1, 0.2156863, 0, 1,
-1.694646, 1.213861, -0.1823308, 1, 0.2235294, 0, 1,
-1.691372, 2.133491, -1.667067, 1, 0.227451, 0, 1,
-1.687606, 1.196958, -0.9609078, 1, 0.2352941, 0, 1,
-1.670572, 1.307786, -0.8279108, 1, 0.2392157, 0, 1,
-1.666064, 0.4296986, -2.357433, 1, 0.2470588, 0, 1,
-1.640803, -1.270576, -1.977167, 1, 0.2509804, 0, 1,
-1.635196, -1.501374, -3.295456, 1, 0.2588235, 0, 1,
-1.615406, -0.144623, -2.768729, 1, 0.2627451, 0, 1,
-1.587536, -0.5936477, -2.481446, 1, 0.2705882, 0, 1,
-1.581756, 0.5579014, -0.6326931, 1, 0.2745098, 0, 1,
-1.580095, 0.3008319, -1.877328, 1, 0.282353, 0, 1,
-1.567211, -0.05764724, -0.691104, 1, 0.2862745, 0, 1,
-1.564526, 1.705776, -1.870486, 1, 0.2941177, 0, 1,
-1.558618, -0.2039172, -1.81864, 1, 0.3019608, 0, 1,
-1.558164, 1.579505, -1.936704, 1, 0.3058824, 0, 1,
-1.551268, -0.9816211, -1.395903, 1, 0.3137255, 0, 1,
-1.544011, -1.791554, -1.973567, 1, 0.3176471, 0, 1,
-1.527158, -0.09843093, -1.265335, 1, 0.3254902, 0, 1,
-1.517407, 0.4531744, -1.643243, 1, 0.3294118, 0, 1,
-1.500047, 0.3846337, -1.077814, 1, 0.3372549, 0, 1,
-1.499078, -0.6550458, -2.256261, 1, 0.3411765, 0, 1,
-1.494225, 0.1970165, -2.546455, 1, 0.3490196, 0, 1,
-1.491812, -0.8592685, -1.722777, 1, 0.3529412, 0, 1,
-1.483276, 0.5860116, -0.5794299, 1, 0.3607843, 0, 1,
-1.482271, -0.6571268, -1.588844, 1, 0.3647059, 0, 1,
-1.466057, -0.002324348, -2.152252, 1, 0.372549, 0, 1,
-1.461175, 0.9048488, -1.433408, 1, 0.3764706, 0, 1,
-1.452426, 1.433695, -1.248496, 1, 0.3843137, 0, 1,
-1.449782, -1.518571, -3.327996, 1, 0.3882353, 0, 1,
-1.443765, -0.2445258, -3.244396, 1, 0.3960784, 0, 1,
-1.425764, 0.798506, -0.7519315, 1, 0.4039216, 0, 1,
-1.418776, 2.173069, -1.349284, 1, 0.4078431, 0, 1,
-1.418227, 2.035953, -1.33397, 1, 0.4156863, 0, 1,
-1.417341, -1.761842, -2.710484, 1, 0.4196078, 0, 1,
-1.401533, 1.965472, 0.1864288, 1, 0.427451, 0, 1,
-1.395705, -0.4687006, -0.3012819, 1, 0.4313726, 0, 1,
-1.392219, 0.09438248, -1.077276, 1, 0.4392157, 0, 1,
-1.390977, 0.4912502, -1.366466, 1, 0.4431373, 0, 1,
-1.389199, 1.65545, 1.82123, 1, 0.4509804, 0, 1,
-1.385604, 1.770494, 0.2655796, 1, 0.454902, 0, 1,
-1.384236, -1.152105, -0.3584134, 1, 0.4627451, 0, 1,
-1.382928, -1.548898, -3.085463, 1, 0.4666667, 0, 1,
-1.37466, -0.0799947, -1.319199, 1, 0.4745098, 0, 1,
-1.366697, 0.4820178, -1.841582, 1, 0.4784314, 0, 1,
-1.36331, -0.8105368, -2.666031, 1, 0.4862745, 0, 1,
-1.362337, 1.441702, -0.6108271, 1, 0.4901961, 0, 1,
-1.357529, -0.1694388, -1.972951, 1, 0.4980392, 0, 1,
-1.355155, 0.04086768, 0.188103, 1, 0.5058824, 0, 1,
-1.354992, -0.01432543, -2.027846, 1, 0.509804, 0, 1,
-1.349815, -1.21531, -1.274656, 1, 0.5176471, 0, 1,
-1.343007, -0.8434657, -2.307322, 1, 0.5215687, 0, 1,
-1.340119, -0.1692012, -3.742971, 1, 0.5294118, 0, 1,
-1.332106, 0.2064039, -2.329143, 1, 0.5333334, 0, 1,
-1.306914, 0.6804572, -1.462045, 1, 0.5411765, 0, 1,
-1.305927, 2.135081, 0.8141633, 1, 0.5450981, 0, 1,
-1.304348, 1.621523, -0.198565, 1, 0.5529412, 0, 1,
-1.300395, 1.123537, -2.666996, 1, 0.5568628, 0, 1,
-1.29592, -0.8832467, -3.114234, 1, 0.5647059, 0, 1,
-1.290443, 0.327161, -1.929476, 1, 0.5686275, 0, 1,
-1.289284, -0.1050362, -1.264643, 1, 0.5764706, 0, 1,
-1.284738, 1.614572, 0.4017968, 1, 0.5803922, 0, 1,
-1.280977, 1.341618, 1.905783, 1, 0.5882353, 0, 1,
-1.277113, 0.7223254, -1.440638, 1, 0.5921569, 0, 1,
-1.269726, 0.5028555, -1.029179, 1, 0.6, 0, 1,
-1.266542, 0.656372, -0.7405911, 1, 0.6078432, 0, 1,
-1.257352, 0.04703879, -1.718214, 1, 0.6117647, 0, 1,
-1.2495, -1.474761, -2.466331, 1, 0.6196079, 0, 1,
-1.248098, 0.6108539, -1.627378, 1, 0.6235294, 0, 1,
-1.245033, 0.4053409, -0.08464758, 1, 0.6313726, 0, 1,
-1.231017, -0.9622838, -1.437045, 1, 0.6352941, 0, 1,
-1.221058, -0.440605, -1.787673, 1, 0.6431373, 0, 1,
-1.218358, 0.03402239, -0.9042373, 1, 0.6470588, 0, 1,
-1.214919, -0.6091446, -3.176384, 1, 0.654902, 0, 1,
-1.210428, 0.1184819, 0.4637757, 1, 0.6588235, 0, 1,
-1.206424, 0.4825315, -0.7508918, 1, 0.6666667, 0, 1,
-1.197709, -0.4522618, -0.09193315, 1, 0.6705883, 0, 1,
-1.196109, -0.003230206, -1.373876, 1, 0.6784314, 0, 1,
-1.18778, -0.1155257, -1.532556, 1, 0.682353, 0, 1,
-1.18705, -1.313705, -2.519648, 1, 0.6901961, 0, 1,
-1.185564, -0.4484804, -1.671862, 1, 0.6941177, 0, 1,
-1.165613, 0.9746161, -1.789493, 1, 0.7019608, 0, 1,
-1.165495, 0.2112455, -0.4144032, 1, 0.7098039, 0, 1,
-1.164905, -1.24567, -3.439052, 1, 0.7137255, 0, 1,
-1.161881, 0.1498491, -1.650945, 1, 0.7215686, 0, 1,
-1.158611, -1.186549, -2.30382, 1, 0.7254902, 0, 1,
-1.153249, 0.265476, -1.020185, 1, 0.7333333, 0, 1,
-1.151353, 0.03166563, -1.072728, 1, 0.7372549, 0, 1,
-1.149081, 0.2904056, 0.3892581, 1, 0.7450981, 0, 1,
-1.148611, 0.2846472, -1.925968, 1, 0.7490196, 0, 1,
-1.140441, -0.1789404, -0.1726531, 1, 0.7568628, 0, 1,
-1.133157, 1.837903, -0.1494604, 1, 0.7607843, 0, 1,
-1.111058, -0.3084663, -3.708112, 1, 0.7686275, 0, 1,
-1.110071, -0.9487051, -4.056273, 1, 0.772549, 0, 1,
-1.100784, -0.5352347, -1.07321, 1, 0.7803922, 0, 1,
-1.099812, 1.759237, -0.3172071, 1, 0.7843137, 0, 1,
-1.089202, 1.42789, -0.3187922, 1, 0.7921569, 0, 1,
-1.086517, 0.684452, -1.156637, 1, 0.7960784, 0, 1,
-1.072872, -1.462317, -2.056443, 1, 0.8039216, 0, 1,
-1.066018, -0.8736007, -3.105404, 1, 0.8117647, 0, 1,
-1.057518, 0.5459229, -1.827376, 1, 0.8156863, 0, 1,
-1.046844, -0.653833, -1.484414, 1, 0.8235294, 0, 1,
-1.046436, -0.08622275, -1.131819, 1, 0.827451, 0, 1,
-1.04638, 0.6705691, -1.724585, 1, 0.8352941, 0, 1,
-1.044922, -0.3959898, -4.615156, 1, 0.8392157, 0, 1,
-1.02477, -0.3208418, -1.601881, 1, 0.8470588, 0, 1,
-1.021406, 0.5317535, -0.2631055, 1, 0.8509804, 0, 1,
-1.010527, -2.479838, -3.448604, 1, 0.8588235, 0, 1,
-1.006109, 1.003562, -0.3786076, 1, 0.8627451, 0, 1,
-1.005095, -0.2751986, -0.4313637, 1, 0.8705882, 0, 1,
-0.9903567, -0.4069775, -2.851041, 1, 0.8745098, 0, 1,
-0.9838247, -0.9806898, 1.537901, 1, 0.8823529, 0, 1,
-0.981833, -0.09614239, -1.831125, 1, 0.8862745, 0, 1,
-0.9754812, -0.2152516, -2.4585, 1, 0.8941177, 0, 1,
-0.9699056, 0.580214, -2.075146, 1, 0.8980392, 0, 1,
-0.9670667, 0.9891125, -0.2386535, 1, 0.9058824, 0, 1,
-0.9631956, 1.625269, -1.990553, 1, 0.9137255, 0, 1,
-0.9590604, -1.444626, -4.419624, 1, 0.9176471, 0, 1,
-0.9556418, 0.9044843, -1.223557, 1, 0.9254902, 0, 1,
-0.9480767, -1.731282, -3.532043, 1, 0.9294118, 0, 1,
-0.9457774, -1.295595, -1.639847, 1, 0.9372549, 0, 1,
-0.9421191, -0.3744671, -2.913633, 1, 0.9411765, 0, 1,
-0.9350984, -0.1262562, -2.761699, 1, 0.9490196, 0, 1,
-0.9327542, -0.4427581, -1.004635, 1, 0.9529412, 0, 1,
-0.9212376, -1.022829, -1.116627, 1, 0.9607843, 0, 1,
-0.918155, 0.1630363, -0.7207395, 1, 0.9647059, 0, 1,
-0.9129131, -0.2197301, -3.395886, 1, 0.972549, 0, 1,
-0.9123014, -0.1444965, -0.1486693, 1, 0.9764706, 0, 1,
-0.9063951, -0.7206312, -1.692123, 1, 0.9843137, 0, 1,
-0.8962936, -0.9323496, -3.440101, 1, 0.9882353, 0, 1,
-0.8927791, -0.3565831, -2.584027, 1, 0.9960784, 0, 1,
-0.8921796, -0.8646906, -0.6292381, 0.9960784, 1, 0, 1,
-0.888571, -0.5658934, -2.479417, 0.9921569, 1, 0, 1,
-0.8884469, 0.09715135, -1.294396, 0.9843137, 1, 0, 1,
-0.8878905, 1.199632, -1.013383, 0.9803922, 1, 0, 1,
-0.8858411, 1.11473, 0.7538604, 0.972549, 1, 0, 1,
-0.8835369, -0.5052888, -0.955496, 0.9686275, 1, 0, 1,
-0.8810089, 0.3163073, -2.322895, 0.9607843, 1, 0, 1,
-0.8772504, 0.9884744, -1.657244, 0.9568627, 1, 0, 1,
-0.8743402, 0.05091865, -0.5317637, 0.9490196, 1, 0, 1,
-0.8681097, 0.05911332, -3.257959, 0.945098, 1, 0, 1,
-0.8603032, 0.3691384, -1.813768, 0.9372549, 1, 0, 1,
-0.8581495, -0.513849, -2.335495, 0.9333333, 1, 0, 1,
-0.8567746, -0.2918059, -3.483714, 0.9254902, 1, 0, 1,
-0.856191, -1.397015, -1.272945, 0.9215686, 1, 0, 1,
-0.8545862, 1.77042, -2.3008, 0.9137255, 1, 0, 1,
-0.8540318, -0.9226198, -2.79156, 0.9098039, 1, 0, 1,
-0.8507837, 0.4393319, -0.6970192, 0.9019608, 1, 0, 1,
-0.8408206, -0.1055671, -2.367629, 0.8941177, 1, 0, 1,
-0.8345842, -0.9364783, -1.532023, 0.8901961, 1, 0, 1,
-0.8326069, -1.406605, -2.4209, 0.8823529, 1, 0, 1,
-0.8288769, -1.202104, -0.9188136, 0.8784314, 1, 0, 1,
-0.8240259, -0.8013796, -1.322805, 0.8705882, 1, 0, 1,
-0.8224006, 1.301666, -0.9969574, 0.8666667, 1, 0, 1,
-0.821963, -0.5040213, -1.495242, 0.8588235, 1, 0, 1,
-0.8217368, 1.48635, -0.4590025, 0.854902, 1, 0, 1,
-0.8177063, -0.5347974, -1.968067, 0.8470588, 1, 0, 1,
-0.8165265, 0.3816276, -0.9466342, 0.8431373, 1, 0, 1,
-0.8152716, 0.8367727, -1.085387, 0.8352941, 1, 0, 1,
-0.8053391, -0.8410589, -0.90976, 0.8313726, 1, 0, 1,
-0.8051325, -2.909482, -0.9203252, 0.8235294, 1, 0, 1,
-0.8025875, 0.07316494, -0.4950232, 0.8196079, 1, 0, 1,
-0.799381, -0.4873606, -1.448338, 0.8117647, 1, 0, 1,
-0.7987266, 0.1709771, -3.041418, 0.8078431, 1, 0, 1,
-0.7894321, 0.4008171, -1.378222, 0.8, 1, 0, 1,
-0.7782727, 0.698311, -1.226039, 0.7921569, 1, 0, 1,
-0.7772527, 0.9123755, -0.9236304, 0.7882353, 1, 0, 1,
-0.7744684, 0.8228225, 0.2495647, 0.7803922, 1, 0, 1,
-0.7656375, 0.5005946, 0.8704965, 0.7764706, 1, 0, 1,
-0.7647744, 0.3793125, -1.771319, 0.7686275, 1, 0, 1,
-0.7624922, 0.5816369, 0.3675008, 0.7647059, 1, 0, 1,
-0.756824, -0.05197879, -0.9088545, 0.7568628, 1, 0, 1,
-0.7567276, -0.2581069, -1.680481, 0.7529412, 1, 0, 1,
-0.7534668, -2.309867, -2.77607, 0.7450981, 1, 0, 1,
-0.7392812, 1.611489, -1.227134, 0.7411765, 1, 0, 1,
-0.7373941, 0.6352216, -1.320957, 0.7333333, 1, 0, 1,
-0.7369781, 1.406918, -0.9808179, 0.7294118, 1, 0, 1,
-0.7248887, -2.155969, -2.760271, 0.7215686, 1, 0, 1,
-0.7142915, 0.5303582, -1.345049, 0.7176471, 1, 0, 1,
-0.7075033, -2.168185, -4.144548, 0.7098039, 1, 0, 1,
-0.7064921, -0.6257414, -3.388561, 0.7058824, 1, 0, 1,
-0.7060319, 0.8620802, -0.3469838, 0.6980392, 1, 0, 1,
-0.6998206, -1.263897, -1.024869, 0.6901961, 1, 0, 1,
-0.6890672, -1.567253, -3.743028, 0.6862745, 1, 0, 1,
-0.6885507, 1.060867, -0.09222342, 0.6784314, 1, 0, 1,
-0.6823309, -0.1070543, -1.261958, 0.6745098, 1, 0, 1,
-0.6810355, 1.50513, 0.3008408, 0.6666667, 1, 0, 1,
-0.6797267, 0.1126275, -1.018939, 0.6627451, 1, 0, 1,
-0.6775575, -0.1498565, -2.303906, 0.654902, 1, 0, 1,
-0.6741252, 0.9027626, -1.352437, 0.6509804, 1, 0, 1,
-0.6715516, -1.490163, -1.57307, 0.6431373, 1, 0, 1,
-0.6702566, -0.1036745, -2.914805, 0.6392157, 1, 0, 1,
-0.6700739, 0.6271009, 0.3729832, 0.6313726, 1, 0, 1,
-0.6679857, -1.988823, -3.849534, 0.627451, 1, 0, 1,
-0.6665825, 0.003833142, -1.028554, 0.6196079, 1, 0, 1,
-0.6656545, 0.9456068, -0.2241501, 0.6156863, 1, 0, 1,
-0.6605088, -1.100262, -2.899742, 0.6078432, 1, 0, 1,
-0.6580078, 0.3615246, -0.3744206, 0.6039216, 1, 0, 1,
-0.6543208, 2.480116, 0.5952314, 0.5960785, 1, 0, 1,
-0.6511081, -1.23746, -1.854402, 0.5882353, 1, 0, 1,
-0.6427613, -0.530545, -2.533605, 0.5843138, 1, 0, 1,
-0.6356432, -0.06929417, -0.732511, 0.5764706, 1, 0, 1,
-0.6329411, 0.4498741, -0.2031379, 0.572549, 1, 0, 1,
-0.631653, -0.161713, -0.8698488, 0.5647059, 1, 0, 1,
-0.6264899, -0.3682848, -2.861012, 0.5607843, 1, 0, 1,
-0.6208003, 0.2764387, -0.7823075, 0.5529412, 1, 0, 1,
-0.620082, 0.711385, 0.01194222, 0.5490196, 1, 0, 1,
-0.617989, 1.757207, -2.383437, 0.5411765, 1, 0, 1,
-0.6167809, 0.6758222, 0.122741, 0.5372549, 1, 0, 1,
-0.6102443, 0.01085594, -0.5590914, 0.5294118, 1, 0, 1,
-0.6069498, 1.171067, 0.0775016, 0.5254902, 1, 0, 1,
-0.6052865, 0.881929, -0.2104314, 0.5176471, 1, 0, 1,
-0.5980104, 0.8926824, -0.1145943, 0.5137255, 1, 0, 1,
-0.5979308, 0.3829356, -0.130465, 0.5058824, 1, 0, 1,
-0.5911839, 2.099931, -0.3268824, 0.5019608, 1, 0, 1,
-0.5896925, -0.001865094, -1.158027, 0.4941176, 1, 0, 1,
-0.5869353, 1.920717, 0.7551781, 0.4862745, 1, 0, 1,
-0.5803192, -0.9533243, -3.810933, 0.4823529, 1, 0, 1,
-0.5753289, 0.9437767, 0.07208288, 0.4745098, 1, 0, 1,
-0.5741451, -0.4756474, -1.887453, 0.4705882, 1, 0, 1,
-0.5730707, 0.4471929, 0.5667735, 0.4627451, 1, 0, 1,
-0.5692385, 0.6707683, 0.7962955, 0.4588235, 1, 0, 1,
-0.5659326, -0.3367523, -3.39762, 0.4509804, 1, 0, 1,
-0.5650914, 0.8713493, -0.3509206, 0.4470588, 1, 0, 1,
-0.5600277, 1.574082, -0.2582282, 0.4392157, 1, 0, 1,
-0.5584903, 1.319117, 0.3030998, 0.4352941, 1, 0, 1,
-0.5570974, 1.45173, 0.8707088, 0.427451, 1, 0, 1,
-0.5510998, -0.1442873, -2.588742, 0.4235294, 1, 0, 1,
-0.5458597, 1.396396, 0.2356417, 0.4156863, 1, 0, 1,
-0.5448791, 0.8946645, -0.6311499, 0.4117647, 1, 0, 1,
-0.5442132, -0.5117863, -1.579087, 0.4039216, 1, 0, 1,
-0.5429898, 0.2336558, -2.310045, 0.3960784, 1, 0, 1,
-0.5354707, 1.979323, -2.07202, 0.3921569, 1, 0, 1,
-0.5353633, -0.8472592, -3.459285, 0.3843137, 1, 0, 1,
-0.5184739, 1.175541, -1.39041, 0.3803922, 1, 0, 1,
-0.5171136, -0.2284998, -2.040279, 0.372549, 1, 0, 1,
-0.5154504, -0.6806481, -3.595453, 0.3686275, 1, 0, 1,
-0.5051267, 0.01790347, -2.496071, 0.3607843, 1, 0, 1,
-0.501438, 0.8823177, -0.8416765, 0.3568628, 1, 0, 1,
-0.5014263, 0.05654678, -0.07343086, 0.3490196, 1, 0, 1,
-0.4969733, -0.5411804, -1.010804, 0.345098, 1, 0, 1,
-0.4901788, 1.113637, -0.6796833, 0.3372549, 1, 0, 1,
-0.4828195, 0.3648803, 0.1005159, 0.3333333, 1, 0, 1,
-0.480305, -1.113856, -1.732585, 0.3254902, 1, 0, 1,
-0.4735778, -0.03628833, -0.7903679, 0.3215686, 1, 0, 1,
-0.4700715, 0.4569536, 1.730668, 0.3137255, 1, 0, 1,
-0.4667387, 1.647832, -0.7262031, 0.3098039, 1, 0, 1,
-0.4665132, 0.8444886, -0.65155, 0.3019608, 1, 0, 1,
-0.46282, -0.4863034, -2.692508, 0.2941177, 1, 0, 1,
-0.4627457, 1.482423, -0.4486454, 0.2901961, 1, 0, 1,
-0.4619467, 0.9077016, -1.056654, 0.282353, 1, 0, 1,
-0.4586518, 0.1802072, -2.627971, 0.2784314, 1, 0, 1,
-0.4583611, -0.3878167, -2.409072, 0.2705882, 1, 0, 1,
-0.4581062, -0.5373482, -1.383188, 0.2666667, 1, 0, 1,
-0.4571782, 0.7975245, -1.68658, 0.2588235, 1, 0, 1,
-0.4522812, -0.2568864, -2.350403, 0.254902, 1, 0, 1,
-0.4492492, -1.426463, -2.867604, 0.2470588, 1, 0, 1,
-0.4461171, 0.2051702, -1.620706, 0.2431373, 1, 0, 1,
-0.4459257, -1.791906, -2.693413, 0.2352941, 1, 0, 1,
-0.4449706, 0.2977102, -0.1348251, 0.2313726, 1, 0, 1,
-0.4434341, -1.074698, -2.312248, 0.2235294, 1, 0, 1,
-0.4419993, 1.13254, -0.6971917, 0.2196078, 1, 0, 1,
-0.4408376, 0.8601818, -0.6250597, 0.2117647, 1, 0, 1,
-0.4395103, 1.591125, 0.2764575, 0.2078431, 1, 0, 1,
-0.4389072, -1.472863, -4.670368, 0.2, 1, 0, 1,
-0.4352475, -0.3258363, -1.907347, 0.1921569, 1, 0, 1,
-0.4330711, 0.854579, -1.874613, 0.1882353, 1, 0, 1,
-0.4318781, -0.6869135, -3.509413, 0.1803922, 1, 0, 1,
-0.4290867, 0.7067546, -0.9007281, 0.1764706, 1, 0, 1,
-0.4272594, 1.163641, -0.141387, 0.1686275, 1, 0, 1,
-0.4250138, 0.9985619, -0.1142728, 0.1647059, 1, 0, 1,
-0.4237629, -0.7569035, -2.323243, 0.1568628, 1, 0, 1,
-0.4231597, -3.175012, -3.10661, 0.1529412, 1, 0, 1,
-0.4229974, -0.9861166, -3.489542, 0.145098, 1, 0, 1,
-0.4199283, -1.086267, -3.297229, 0.1411765, 1, 0, 1,
-0.414417, 0.02688201, -0.8201126, 0.1333333, 1, 0, 1,
-0.412746, -0.4963357, -0.5019888, 0.1294118, 1, 0, 1,
-0.4069338, -0.3593178, -2.701714, 0.1215686, 1, 0, 1,
-0.4067249, 1.661502, -1.880712, 0.1176471, 1, 0, 1,
-0.4065396, -0.9898376, -3.984101, 0.1098039, 1, 0, 1,
-0.4042943, -0.7106803, -2.245314, 0.1058824, 1, 0, 1,
-0.4017957, -0.9591239, -2.449118, 0.09803922, 1, 0, 1,
-0.3988046, -0.5365313, -2.226284, 0.09019608, 1, 0, 1,
-0.3934702, -0.7476792, -0.1992419, 0.08627451, 1, 0, 1,
-0.3911806, -2.697508, -0.8521757, 0.07843138, 1, 0, 1,
-0.3887555, -0.126151, -2.392042, 0.07450981, 1, 0, 1,
-0.3789481, -0.06813402, -0.5030921, 0.06666667, 1, 0, 1,
-0.3778712, -1.319545, -2.311805, 0.0627451, 1, 0, 1,
-0.3769878, -0.03039153, -2.896419, 0.05490196, 1, 0, 1,
-0.3725957, -0.2113252, -1.85819, 0.05098039, 1, 0, 1,
-0.3690961, -0.6654843, -2.186738, 0.04313726, 1, 0, 1,
-0.3668827, -0.120147, -1.514426, 0.03921569, 1, 0, 1,
-0.3665498, -1.736902, -3.73672, 0.03137255, 1, 0, 1,
-0.3660137, -0.8929783, -1.954502, 0.02745098, 1, 0, 1,
-0.3604276, 0.3648795, -1.640851, 0.01960784, 1, 0, 1,
-0.3582228, 0.8555686, -1.494169, 0.01568628, 1, 0, 1,
-0.353886, -0.269881, -1.714823, 0.007843138, 1, 0, 1,
-0.3522716, 2.225238, -0.1050597, 0.003921569, 1, 0, 1,
-0.3518087, -0.7710373, -1.612085, 0, 1, 0.003921569, 1,
-0.3497511, 0.6970763, -1.38026, 0, 1, 0.01176471, 1,
-0.3442105, -0.4302655, -3.834181, 0, 1, 0.01568628, 1,
-0.3427625, -1.538807, -2.235622, 0, 1, 0.02352941, 1,
-0.340228, -0.08332504, -0.2650535, 0, 1, 0.02745098, 1,
-0.3398726, -0.009017099, -1.767045, 0, 1, 0.03529412, 1,
-0.3380793, -2.410646, -2.018547, 0, 1, 0.03921569, 1,
-0.337537, 1.741359, -0.06548584, 0, 1, 0.04705882, 1,
-0.3374694, 0.09868947, -0.5649521, 0, 1, 0.05098039, 1,
-0.336792, 1.287339, 0.3367322, 0, 1, 0.05882353, 1,
-0.3355755, -0.5873977, -1.753649, 0, 1, 0.0627451, 1,
-0.3298278, -0.3038372, -2.625808, 0, 1, 0.07058824, 1,
-0.3291159, 1.060664, 2.065636, 0, 1, 0.07450981, 1,
-0.3283189, -1.000705, -2.973344, 0, 1, 0.08235294, 1,
-0.3278, -0.8569866, -2.349849, 0, 1, 0.08627451, 1,
-0.3260775, 0.3207597, 0.01961998, 0, 1, 0.09411765, 1,
-0.3138829, 1.305061, -0.6904142, 0, 1, 0.1019608, 1,
-0.3137943, 0.05187558, -0.7735043, 0, 1, 0.1058824, 1,
-0.3067602, 1.925087, -1.478766, 0, 1, 0.1137255, 1,
-0.3066885, 0.8654775, 0.9467944, 0, 1, 0.1176471, 1,
-0.3026228, -0.2568016, -2.669554, 0, 1, 0.1254902, 1,
-0.3004766, -0.9854826, -1.624069, 0, 1, 0.1294118, 1,
-0.2983555, -0.5879301, -1.384074, 0, 1, 0.1372549, 1,
-0.2979669, -0.4359646, -3.158555, 0, 1, 0.1411765, 1,
-0.2967486, 0.9813102, -0.88039, 0, 1, 0.1490196, 1,
-0.2965577, 0.411819, -0.9844351, 0, 1, 0.1529412, 1,
-0.2945922, 1.893911, -0.6376862, 0, 1, 0.1607843, 1,
-0.2933876, 0.31929, -1.967624, 0, 1, 0.1647059, 1,
-0.2926802, -1.853623, -3.163982, 0, 1, 0.172549, 1,
-0.2925289, -0.1937499, -2.263955, 0, 1, 0.1764706, 1,
-0.2923609, 0.2639806, -1.671353, 0, 1, 0.1843137, 1,
-0.2918741, -0.8297843, -3.52651, 0, 1, 0.1882353, 1,
-0.2908725, 1.071727, -0.2326698, 0, 1, 0.1960784, 1,
-0.2830914, -1.313175, -3.062929, 0, 1, 0.2039216, 1,
-0.2830201, -0.1975547, -3.10753, 0, 1, 0.2078431, 1,
-0.2826265, 1.242086, 0.8909235, 0, 1, 0.2156863, 1,
-0.2801602, -1.234548, -3.50731, 0, 1, 0.2196078, 1,
-0.2779877, 0.599464, -2.026864, 0, 1, 0.227451, 1,
-0.2774041, -0.514359, -2.952455, 0, 1, 0.2313726, 1,
-0.2720376, 0.3849881, -0.3762602, 0, 1, 0.2392157, 1,
-0.2719338, 0.5163275, 0.2545876, 0, 1, 0.2431373, 1,
-0.2669948, -1.205488, -4.179996, 0, 1, 0.2509804, 1,
-0.2650214, 0.7749365, 0.1681532, 0, 1, 0.254902, 1,
-0.2618292, 0.7248363, -0.9257134, 0, 1, 0.2627451, 1,
-0.2533158, -0.5785939, -0.7430398, 0, 1, 0.2666667, 1,
-0.2523227, 0.5355563, -1.301874, 0, 1, 0.2745098, 1,
-0.2421546, 0.433349, -2.879009, 0, 1, 0.2784314, 1,
-0.2406543, 0.443484, -1.530485, 0, 1, 0.2862745, 1,
-0.2355254, -0.8312717, -1.660137, 0, 1, 0.2901961, 1,
-0.2344087, 0.1582519, -0.9980342, 0, 1, 0.2980392, 1,
-0.2341126, 0.8325087, 0.0006648373, 0, 1, 0.3058824, 1,
-0.231977, 0.8001285, 0.7468377, 0, 1, 0.3098039, 1,
-0.2299239, 2.135964, 0.8751708, 0, 1, 0.3176471, 1,
-0.223678, 1.030113, 1.041471, 0, 1, 0.3215686, 1,
-0.2236162, -0.2720308, -3.110378, 0, 1, 0.3294118, 1,
-0.2203512, 0.05091388, -2.552384, 0, 1, 0.3333333, 1,
-0.2196815, -0.930892, -3.167508, 0, 1, 0.3411765, 1,
-0.2189789, -0.02409207, -1.196796, 0, 1, 0.345098, 1,
-0.2128355, 0.3707487, -1.253639, 0, 1, 0.3529412, 1,
-0.2116682, -0.4765668, -4.298672, 0, 1, 0.3568628, 1,
-0.2086436, -0.7741448, -3.154708, 0, 1, 0.3647059, 1,
-0.2046694, -0.7912486, -1.317443, 0, 1, 0.3686275, 1,
-0.2019423, 0.2403155, -0.7319481, 0, 1, 0.3764706, 1,
-0.201377, -2.066055, -2.187676, 0, 1, 0.3803922, 1,
-0.2005201, -0.1146872, -1.977299, 0, 1, 0.3882353, 1,
-0.1945798, -0.2332457, -0.9144306, 0, 1, 0.3921569, 1,
-0.191194, 0.08594614, -2.087167, 0, 1, 0.4, 1,
-0.188939, 0.7271639, 0.365285, 0, 1, 0.4078431, 1,
-0.1883007, -0.4069938, -1.488052, 0, 1, 0.4117647, 1,
-0.1882477, 0.4905986, -1.040203, 0, 1, 0.4196078, 1,
-0.1869382, 0.3789599, -2.188748, 0, 1, 0.4235294, 1,
-0.1853397, -1.24289, -3.324286, 0, 1, 0.4313726, 1,
-0.1846217, 0.1640169, -0.2462378, 0, 1, 0.4352941, 1,
-0.1835283, -0.1624007, -0.9567211, 0, 1, 0.4431373, 1,
-0.1817866, -0.8235155, -3.622317, 0, 1, 0.4470588, 1,
-0.1812033, -1.241878, -2.303262, 0, 1, 0.454902, 1,
-0.1809314, -0.7704443, -3.026476, 0, 1, 0.4588235, 1,
-0.1791123, -0.5829606, -1.987629, 0, 1, 0.4666667, 1,
-0.1781416, 1.219956, -0.3600934, 0, 1, 0.4705882, 1,
-0.1776856, 0.2359911, 0.1023443, 0, 1, 0.4784314, 1,
-0.1775226, 1.093942, -0.6110964, 0, 1, 0.4823529, 1,
-0.176926, -1.136008, -2.865842, 0, 1, 0.4901961, 1,
-0.1767417, 0.04725819, -1.73619, 0, 1, 0.4941176, 1,
-0.1759039, -0.8378621, -2.046229, 0, 1, 0.5019608, 1,
-0.1654905, 1.488021, -0.01924765, 0, 1, 0.509804, 1,
-0.1642132, 0.6058409, -0.385563, 0, 1, 0.5137255, 1,
-0.1577707, -0.7958915, -5.089982, 0, 1, 0.5215687, 1,
-0.1564874, 1.311329, -0.9214913, 0, 1, 0.5254902, 1,
-0.1561128, 1.321604, -1.04932, 0, 1, 0.5333334, 1,
-0.1516398, 1.439241, -2.239965, 0, 1, 0.5372549, 1,
-0.1491937, -0.04503512, -1.974058, 0, 1, 0.5450981, 1,
-0.1485708, 0.6591101, 1.042112, 0, 1, 0.5490196, 1,
-0.147621, -0.04433165, -1.067682, 0, 1, 0.5568628, 1,
-0.1439335, -1.3882, -1.925195, 0, 1, 0.5607843, 1,
-0.1347385, 0.1058129, -0.1202201, 0, 1, 0.5686275, 1,
-0.1311083, 2.010978, -0.8269225, 0, 1, 0.572549, 1,
-0.1301259, -0.206711, -2.338755, 0, 1, 0.5803922, 1,
-0.1295679, -0.3077497, -3.3921, 0, 1, 0.5843138, 1,
-0.1269205, -0.2619578, -2.340283, 0, 1, 0.5921569, 1,
-0.1234308, -0.6329785, -3.619766, 0, 1, 0.5960785, 1,
-0.1226951, -0.2225136, -1.939542, 0, 1, 0.6039216, 1,
-0.1223041, -1.181806, -2.738933, 0, 1, 0.6117647, 1,
-0.1139111, 1.249984, 0.4692682, 0, 1, 0.6156863, 1,
-0.1139023, 1.923286, 0.9392628, 0, 1, 0.6235294, 1,
-0.1079786, -1.764345, -3.403375, 0, 1, 0.627451, 1,
-0.107217, -0.7698101, -3.403875, 0, 1, 0.6352941, 1,
-0.1068184, 0.5081959, 0.0740497, 0, 1, 0.6392157, 1,
-0.1066893, 0.01219462, -1.630036, 0, 1, 0.6470588, 1,
-0.1054355, -0.7511644, -3.539013, 0, 1, 0.6509804, 1,
-0.1052393, 0.5134382, 1.001399, 0, 1, 0.6588235, 1,
-0.1032387, -0.3075076, -4.086575, 0, 1, 0.6627451, 1,
-0.08616388, -1.315662, -4.673288, 0, 1, 0.6705883, 1,
-0.08462724, 0.7579691, -0.6772988, 0, 1, 0.6745098, 1,
-0.08341013, 0.5903435, -0.3063221, 0, 1, 0.682353, 1,
-0.08290822, 0.5714152, 0.9369436, 0, 1, 0.6862745, 1,
-0.07887594, 2.601783, -1.562973, 0, 1, 0.6941177, 1,
-0.07757583, 0.1876768, -1.641721, 0, 1, 0.7019608, 1,
-0.07399067, 0.8915368, 0.5435894, 0, 1, 0.7058824, 1,
-0.07024021, 0.7152029, 0.3566222, 0, 1, 0.7137255, 1,
-0.06885648, 0.6967698, 0.2593461, 0, 1, 0.7176471, 1,
-0.06468474, 0.2470116, -0.4335164, 0, 1, 0.7254902, 1,
-0.06448719, -0.5827376, -3.290804, 0, 1, 0.7294118, 1,
-0.06389479, -0.1422566, -3.527358, 0, 1, 0.7372549, 1,
-0.0636436, -1.655147, -3.024677, 0, 1, 0.7411765, 1,
-0.06101103, 1.122389, -0.8560362, 0, 1, 0.7490196, 1,
-0.05828711, 0.06155354, 0.6455573, 0, 1, 0.7529412, 1,
-0.05809203, -1.867941, -2.595892, 0, 1, 0.7607843, 1,
-0.05771457, 0.1488881, -0.2465154, 0, 1, 0.7647059, 1,
-0.05523724, -0.5503935, -4.84864, 0, 1, 0.772549, 1,
-0.05519699, 0.3178516, -0.5404376, 0, 1, 0.7764706, 1,
-0.05412536, -1.388908, -2.766794, 0, 1, 0.7843137, 1,
-0.05398043, 0.7688119, 0.5035661, 0, 1, 0.7882353, 1,
-0.05371197, -1.943964, -1.750479, 0, 1, 0.7960784, 1,
-0.05044879, 0.6527516, -0.1527086, 0, 1, 0.8039216, 1,
-0.05032082, 0.7037649, 0.5417937, 0, 1, 0.8078431, 1,
-0.05017878, 0.3684456, 0.205442, 0, 1, 0.8156863, 1,
-0.04792476, 0.7939506, -0.004014191, 0, 1, 0.8196079, 1,
-0.0475989, -0.3730513, -3.564786, 0, 1, 0.827451, 1,
-0.04735265, 0.09302646, 0.9425582, 0, 1, 0.8313726, 1,
-0.04278846, -1.080218, -2.016229, 0, 1, 0.8392157, 1,
-0.04265126, 1.227963, 1.232919, 0, 1, 0.8431373, 1,
-0.03438925, 2.273136, -0.09428427, 0, 1, 0.8509804, 1,
-0.03232963, -0.8989727, -5.243633, 0, 1, 0.854902, 1,
-0.03097606, 0.1558694, -1.155516, 0, 1, 0.8627451, 1,
-0.03012503, -0.3931719, -3.556874, 0, 1, 0.8666667, 1,
-0.02962537, 0.0227457, -2.459388, 0, 1, 0.8745098, 1,
-0.02763411, -0.5459281, -4.046123, 0, 1, 0.8784314, 1,
-0.02666151, 0.3289759, 0.6089983, 0, 1, 0.8862745, 1,
-0.02583662, -0.5292801, -1.735718, 0, 1, 0.8901961, 1,
-0.02250092, 0.5207548, -1.552426, 0, 1, 0.8980392, 1,
-0.02045379, -0.2134381, -1.099241, 0, 1, 0.9058824, 1,
-0.01785835, -0.198031, -2.813729, 0, 1, 0.9098039, 1,
-0.008385759, -0.6425539, -4.03622, 0, 1, 0.9176471, 1,
-0.005511115, 0.3588118, 1.768493, 0, 1, 0.9215686, 1,
-0.00550007, -0.4090849, -2.997697, 0, 1, 0.9294118, 1,
-0.002604218, 0.2115718, 0.8187207, 0, 1, 0.9333333, 1,
-0.001810689, 1.641246, -0.7147526, 0, 1, 0.9411765, 1,
-0.001707538, 0.4809751, -0.004071821, 0, 1, 0.945098, 1,
-0.000852218, 1.062094, -0.708034, 0, 1, 0.9529412, 1,
0.002635008, 1.355563, -0.5309983, 0, 1, 0.9568627, 1,
0.002650045, 0.9324687, -0.3165381, 0, 1, 0.9647059, 1,
0.01017328, -0.4242807, 3.203291, 0, 1, 0.9686275, 1,
0.01181794, -0.2851673, 3.002537, 0, 1, 0.9764706, 1,
0.01521724, 0.09128453, 0.4890791, 0, 1, 0.9803922, 1,
0.02016897, -1.457906, 4.327724, 0, 1, 0.9882353, 1,
0.02088667, -1.293701, 1.384674, 0, 1, 0.9921569, 1,
0.02447949, -0.3550192, 3.931491, 0, 1, 1, 1,
0.03113526, -1.088184, 4.050725, 0, 0.9921569, 1, 1,
0.0334003, 1.365741, 0.2515574, 0, 0.9882353, 1, 1,
0.03419997, 0.06062569, -0.08877371, 0, 0.9803922, 1, 1,
0.0348574, 0.9533495, 0.6677584, 0, 0.9764706, 1, 1,
0.03650104, 0.0499469, 2.524008, 0, 0.9686275, 1, 1,
0.03971532, -1.312824, 1.529683, 0, 0.9647059, 1, 1,
0.04145056, 0.3056504, 0.1139471, 0, 0.9568627, 1, 1,
0.042021, 0.6650004, 0.5049004, 0, 0.9529412, 1, 1,
0.04295311, -1.229915, 2.570838, 0, 0.945098, 1, 1,
0.04431014, 0.9308138, 0.6548622, 0, 0.9411765, 1, 1,
0.04598763, 0.3230787, -0.6206793, 0, 0.9333333, 1, 1,
0.04616527, 0.7062716, -0.8880246, 0, 0.9294118, 1, 1,
0.04729311, -0.4755074, 2.900161, 0, 0.9215686, 1, 1,
0.04874557, -1.176759, 3.405225, 0, 0.9176471, 1, 1,
0.05398438, 0.6624236, 1.068549, 0, 0.9098039, 1, 1,
0.06205869, 0.03862971, 1.79073, 0, 0.9058824, 1, 1,
0.07369405, 0.1252886, 0.2797439, 0, 0.8980392, 1, 1,
0.07521921, -1.492692, 3.807183, 0, 0.8901961, 1, 1,
0.08058988, -0.4482009, 3.189962, 0, 0.8862745, 1, 1,
0.08527194, -0.8987079, 3.18533, 0, 0.8784314, 1, 1,
0.09236179, -1.901729, 3.728633, 0, 0.8745098, 1, 1,
0.09517936, 0.8610405, -1.536282, 0, 0.8666667, 1, 1,
0.09725013, 2.063343, -0.2565328, 0, 0.8627451, 1, 1,
0.09843529, 0.2442328, 1.150962, 0, 0.854902, 1, 1,
0.09955689, -0.3119811, 3.866024, 0, 0.8509804, 1, 1,
0.1001474, -0.8093792, 3.491, 0, 0.8431373, 1, 1,
0.1011982, -0.8652465, 1.887436, 0, 0.8392157, 1, 1,
0.1067111, -0.05181967, 2.85331, 0, 0.8313726, 1, 1,
0.1182285, -1.425894, 2.763636, 0, 0.827451, 1, 1,
0.1183568, 1.482612, -2.200621, 0, 0.8196079, 1, 1,
0.1238334, -0.4022416, 3.531355, 0, 0.8156863, 1, 1,
0.1254871, 0.6354193, 0.3125894, 0, 0.8078431, 1, 1,
0.1256061, 0.3471106, -0.9098973, 0, 0.8039216, 1, 1,
0.1286044, -0.3370901, 3.280522, 0, 0.7960784, 1, 1,
0.1295468, -1.277349, 2.615069, 0, 0.7882353, 1, 1,
0.1322669, -0.9377918, 5.220532, 0, 0.7843137, 1, 1,
0.133686, -0.5062241, 3.896525, 0, 0.7764706, 1, 1,
0.1340065, 1.957958, 0.6555647, 0, 0.772549, 1, 1,
0.1355448, -0.2825565, 1.868512, 0, 0.7647059, 1, 1,
0.1497715, 1.621654, -0.2486929, 0, 0.7607843, 1, 1,
0.1508931, 0.4035027, 1.305739, 0, 0.7529412, 1, 1,
0.1521817, -0.6018052, 2.601899, 0, 0.7490196, 1, 1,
0.1539216, -0.666669, 3.218572, 0, 0.7411765, 1, 1,
0.1549143, -0.6183234, 3.452842, 0, 0.7372549, 1, 1,
0.1551884, 1.217141, -0.2427873, 0, 0.7294118, 1, 1,
0.155955, -0.3089179, 3.4848, 0, 0.7254902, 1, 1,
0.158109, 1.33579, -0.9249524, 0, 0.7176471, 1, 1,
0.1604212, -0.5411847, 3.544192, 0, 0.7137255, 1, 1,
0.1641416, 0.2683888, 0.9796878, 0, 0.7058824, 1, 1,
0.165771, -0.7582131, 3.538913, 0, 0.6980392, 1, 1,
0.1663498, 2.502493, -0.6770785, 0, 0.6941177, 1, 1,
0.1758597, 1.047839, 0.6646311, 0, 0.6862745, 1, 1,
0.1765785, -0.04199659, 2.694998, 0, 0.682353, 1, 1,
0.1786064, 0.1723509, 1.047598, 0, 0.6745098, 1, 1,
0.1811762, 0.7440752, -0.8548281, 0, 0.6705883, 1, 1,
0.1826233, -0.6806579, 2.829529, 0, 0.6627451, 1, 1,
0.18279, -1.146149, 1.414102, 0, 0.6588235, 1, 1,
0.18352, -0.04975558, 1.34867, 0, 0.6509804, 1, 1,
0.185045, 1.155536, 1.175602, 0, 0.6470588, 1, 1,
0.1853843, 0.276435, 0.2482556, 0, 0.6392157, 1, 1,
0.186823, 1.448656, 1.096403, 0, 0.6352941, 1, 1,
0.1869849, 0.2578734, 0.7348403, 0, 0.627451, 1, 1,
0.1876889, -0.9311869, 2.187899, 0, 0.6235294, 1, 1,
0.1879201, -0.4400768, 2.204021, 0, 0.6156863, 1, 1,
0.1936227, 0.9294316, 0.8290179, 0, 0.6117647, 1, 1,
0.1937071, 0.2586075, -0.1926432, 0, 0.6039216, 1, 1,
0.1944837, 0.5046667, 0.6308973, 0, 0.5960785, 1, 1,
0.1946258, 0.1158586, 1.336693, 0, 0.5921569, 1, 1,
0.2043184, 0.6641869, 0.526778, 0, 0.5843138, 1, 1,
0.2047659, 0.9021013, 1.549585, 0, 0.5803922, 1, 1,
0.2048421, 1.356882, 1.711451, 0, 0.572549, 1, 1,
0.2056649, -0.5962907, 3.889097, 0, 0.5686275, 1, 1,
0.2074949, 1.284663, 0.08486102, 0, 0.5607843, 1, 1,
0.2091667, -0.7078157, 2.001139, 0, 0.5568628, 1, 1,
0.2103197, 1.362168, -0.2640116, 0, 0.5490196, 1, 1,
0.2166946, -1.597437, 3.281541, 0, 0.5450981, 1, 1,
0.2171475, 0.7847074, -0.3465837, 0, 0.5372549, 1, 1,
0.2196796, -0.4577554, 2.410554, 0, 0.5333334, 1, 1,
0.2215766, -1.062675, 2.146818, 0, 0.5254902, 1, 1,
0.2247624, -0.485501, 1.458995, 0, 0.5215687, 1, 1,
0.2257657, 1.158493, 0.2609027, 0, 0.5137255, 1, 1,
0.2306492, 1.381444, 2.204313, 0, 0.509804, 1, 1,
0.2316817, 0.5579745, -0.7661198, 0, 0.5019608, 1, 1,
0.2349153, 1.991863, 0.4824576, 0, 0.4941176, 1, 1,
0.2370156, -1.535832, 2.092872, 0, 0.4901961, 1, 1,
0.241687, -0.4541573, 4.068887, 0, 0.4823529, 1, 1,
0.2437189, 0.3377655, 2.00942, 0, 0.4784314, 1, 1,
0.2454479, -0.9843606, 3.836521, 0, 0.4705882, 1, 1,
0.2477016, -0.7150337, 3.765469, 0, 0.4666667, 1, 1,
0.2488353, 0.1680258, -0.2459527, 0, 0.4588235, 1, 1,
0.2492661, -0.2206113, 3.261751, 0, 0.454902, 1, 1,
0.2527704, -0.1993485, 0.3635166, 0, 0.4470588, 1, 1,
0.2532158, -0.555746, 2.83959, 0, 0.4431373, 1, 1,
0.2539596, 2.314955, -0.5724147, 0, 0.4352941, 1, 1,
0.2572816, 0.2882664, 1.274562, 0, 0.4313726, 1, 1,
0.2581244, 1.11421, 0.7836813, 0, 0.4235294, 1, 1,
0.2613428, -0.08325478, 0.9776511, 0, 0.4196078, 1, 1,
0.2614597, 0.3560402, 0.186233, 0, 0.4117647, 1, 1,
0.2616077, 0.03988502, 2.099166, 0, 0.4078431, 1, 1,
0.2675261, -1.945005, 2.789866, 0, 0.4, 1, 1,
0.2683983, -1.442277, 3.116116, 0, 0.3921569, 1, 1,
0.2693018, 0.3886361, 0.5849144, 0, 0.3882353, 1, 1,
0.2703275, -0.1102324, 2.505491, 0, 0.3803922, 1, 1,
0.2747747, 0.3564893, -0.803539, 0, 0.3764706, 1, 1,
0.278568, -0.3535802, 2.938043, 0, 0.3686275, 1, 1,
0.2804624, 0.6885726, 0.06300592, 0, 0.3647059, 1, 1,
0.2813504, -0.1332048, 2.435819, 0, 0.3568628, 1, 1,
0.281817, -0.3633365, 2.141535, 0, 0.3529412, 1, 1,
0.2819915, -0.5198432, 3.14223, 0, 0.345098, 1, 1,
0.2866457, -3.634829, 3.365449, 0, 0.3411765, 1, 1,
0.2890606, 0.787779, -0.946577, 0, 0.3333333, 1, 1,
0.2906826, -0.1400886, 1.707994, 0, 0.3294118, 1, 1,
0.293513, -0.4482017, 2.693985, 0, 0.3215686, 1, 1,
0.2946166, 0.5019252, -1.66609, 0, 0.3176471, 1, 1,
0.3018739, 0.3718616, 0.4321363, 0, 0.3098039, 1, 1,
0.3020272, 1.057186, 0.6733434, 0, 0.3058824, 1, 1,
0.3025483, 0.09285164, 1.618157, 0, 0.2980392, 1, 1,
0.3038497, 1.579696, -0.03212916, 0, 0.2901961, 1, 1,
0.3044425, -1.349401, 2.885535, 0, 0.2862745, 1, 1,
0.3061082, 0.8332311, -1.365148, 0, 0.2784314, 1, 1,
0.3110602, -0.6124602, 2.022872, 0, 0.2745098, 1, 1,
0.3119541, -1.294047, 1.252082, 0, 0.2666667, 1, 1,
0.3169, 0.9885728, -0.2723635, 0, 0.2627451, 1, 1,
0.3188184, 0.09985868, 2.22803, 0, 0.254902, 1, 1,
0.3191357, -1.830064, 3.869444, 0, 0.2509804, 1, 1,
0.3207693, 0.3046834, 1.177647, 0, 0.2431373, 1, 1,
0.3233953, 0.2740147, 1.624982, 0, 0.2392157, 1, 1,
0.3235377, -0.6916013, 0.8014695, 0, 0.2313726, 1, 1,
0.3240486, 1.687664, 1.105563, 0, 0.227451, 1, 1,
0.3252153, -0.5459523, 2.882967, 0, 0.2196078, 1, 1,
0.3289865, 1.037824, 0.07909118, 0, 0.2156863, 1, 1,
0.3313689, 0.8358506, 1.826016, 0, 0.2078431, 1, 1,
0.3334366, -1.400892, 2.21031, 0, 0.2039216, 1, 1,
0.3336674, -1.350051, 2.671381, 0, 0.1960784, 1, 1,
0.3339944, 0.2875999, 0.809124, 0, 0.1882353, 1, 1,
0.3365935, 0.3497984, 2.22759, 0, 0.1843137, 1, 1,
0.3396541, 0.7726951, 0.8909114, 0, 0.1764706, 1, 1,
0.3436306, 0.8771743, -0.03267641, 0, 0.172549, 1, 1,
0.3437291, 0.4841805, 1.562503, 0, 0.1647059, 1, 1,
0.3482225, -0.3488523, 3.454119, 0, 0.1607843, 1, 1,
0.3490013, 1.020869, -1.165087, 0, 0.1529412, 1, 1,
0.3508655, -0.3363502, 2.829488, 0, 0.1490196, 1, 1,
0.3560956, -1.206746, 1.676333, 0, 0.1411765, 1, 1,
0.3606273, -0.2595659, 2.000702, 0, 0.1372549, 1, 1,
0.3672633, 0.7832799, -0.717644, 0, 0.1294118, 1, 1,
0.3691076, -0.2695428, 1.992206, 0, 0.1254902, 1, 1,
0.377315, -0.09678596, 2.695573, 0, 0.1176471, 1, 1,
0.3790097, -0.2317863, 3.543756, 0, 0.1137255, 1, 1,
0.3821965, -1.240808, 1.589396, 0, 0.1058824, 1, 1,
0.3857341, -0.5395949, 2.577394, 0, 0.09803922, 1, 1,
0.3867709, -1.016751, 4.355534, 0, 0.09411765, 1, 1,
0.3868746, 0.548991, 0.4129012, 0, 0.08627451, 1, 1,
0.3870681, -1.738785, 4.175669, 0, 0.08235294, 1, 1,
0.3888135, -0.6761206, 2.218604, 0, 0.07450981, 1, 1,
0.3908326, 0.9823321, 0.4083465, 0, 0.07058824, 1, 1,
0.3942932, -2.019665, 3.144907, 0, 0.0627451, 1, 1,
0.3944851, -0.7451459, 4.042094, 0, 0.05882353, 1, 1,
0.3967365, -0.09141772, 2.334107, 0, 0.05098039, 1, 1,
0.3973155, -0.2061352, 2.725955, 0, 0.04705882, 1, 1,
0.3991039, -0.5287609, 3.382837, 0, 0.03921569, 1, 1,
0.4029195, -1.378932, 1.924163, 0, 0.03529412, 1, 1,
0.403358, 1.283095, 1.294405, 0, 0.02745098, 1, 1,
0.4058152, 0.1761012, 1.638096, 0, 0.02352941, 1, 1,
0.4073201, 1.707984, -0.6386518, 0, 0.01568628, 1, 1,
0.413343, 2.313689, 0.5674362, 0, 0.01176471, 1, 1,
0.415963, -0.8305209, 2.257872, 0, 0.003921569, 1, 1,
0.4165305, -0.3661288, 1.735885, 0.003921569, 0, 1, 1,
0.4195709, 0.9046218, -0.1832992, 0.007843138, 0, 1, 1,
0.4218214, 2.604601, 0.9469678, 0.01568628, 0, 1, 1,
0.4219547, 2.325642, 2.101392, 0.01960784, 0, 1, 1,
0.4265234, -0.1921511, 2.707358, 0.02745098, 0, 1, 1,
0.4286163, 0.9732398, 1.408647, 0.03137255, 0, 1, 1,
0.4289053, 2.245409, -0.501816, 0.03921569, 0, 1, 1,
0.4304598, -0.3164518, 1.705454, 0.04313726, 0, 1, 1,
0.4335255, 0.4075104, 1.325982, 0.05098039, 0, 1, 1,
0.4375373, -0.7486955, 2.288263, 0.05490196, 0, 1, 1,
0.4380863, -0.5064502, 4.656494, 0.0627451, 0, 1, 1,
0.4426206, 0.2578779, 1.085906, 0.06666667, 0, 1, 1,
0.4431245, 0.4820083, 0.9124157, 0.07450981, 0, 1, 1,
0.4487756, 0.9094537, 1.894008, 0.07843138, 0, 1, 1,
0.4501683, 2.265813, -1.121323, 0.08627451, 0, 1, 1,
0.4502746, 0.4541114, 0.6506321, 0.09019608, 0, 1, 1,
0.4565244, 0.804015, 0.3170851, 0.09803922, 0, 1, 1,
0.4598628, 2.835453, 0.3696285, 0.1058824, 0, 1, 1,
0.4633957, -0.9359841, 2.873447, 0.1098039, 0, 1, 1,
0.464308, 0.04898372, 2.019667, 0.1176471, 0, 1, 1,
0.4643792, -0.5571179, 1.82047, 0.1215686, 0, 1, 1,
0.465165, -0.4441989, 2.244111, 0.1294118, 0, 1, 1,
0.467905, 0.2406303, 2.006441, 0.1333333, 0, 1, 1,
0.4757423, 0.9031446, 1.604262, 0.1411765, 0, 1, 1,
0.4813496, -1.880671, 2.080493, 0.145098, 0, 1, 1,
0.4853425, -0.4005096, 1.076529, 0.1529412, 0, 1, 1,
0.4877824, -0.2184212, 1.21796, 0.1568628, 0, 1, 1,
0.4893057, 0.8223905, 0.07936171, 0.1647059, 0, 1, 1,
0.4906137, -0.1966347, 2.241896, 0.1686275, 0, 1, 1,
0.4968873, 0.08645418, 1.666515, 0.1764706, 0, 1, 1,
0.4974276, -2.379476, 3.74474, 0.1803922, 0, 1, 1,
0.4985212, 0.3131468, 1.566347, 0.1882353, 0, 1, 1,
0.5012748, 0.8551318, 0.6120196, 0.1921569, 0, 1, 1,
0.5043631, 2.396185, 1.019531, 0.2, 0, 1, 1,
0.5061117, 0.05316626, 1.270961, 0.2078431, 0, 1, 1,
0.506929, -1.138427, 2.826287, 0.2117647, 0, 1, 1,
0.5137047, -0.4560772, 3.935818, 0.2196078, 0, 1, 1,
0.5140228, 1.127568, 0.5210218, 0.2235294, 0, 1, 1,
0.5197858, -0.02316502, 0.7321481, 0.2313726, 0, 1, 1,
0.5202824, 0.8510255, 0.2292909, 0.2352941, 0, 1, 1,
0.5208778, -0.1490854, 2.486493, 0.2431373, 0, 1, 1,
0.5211921, 1.039631, -1.748609, 0.2470588, 0, 1, 1,
0.5253344, 0.8578737, 0.7788998, 0.254902, 0, 1, 1,
0.5282369, -0.2932504, 2.503854, 0.2588235, 0, 1, 1,
0.5297924, 1.180699, 1.14402, 0.2666667, 0, 1, 1,
0.530801, 1.840827, -0.3745036, 0.2705882, 0, 1, 1,
0.531758, 1.520595, 1.154345, 0.2784314, 0, 1, 1,
0.5336678, 1.292777, -0.9741706, 0.282353, 0, 1, 1,
0.53458, 1.476572, -0.1411368, 0.2901961, 0, 1, 1,
0.534759, -0.6850523, 3.695527, 0.2941177, 0, 1, 1,
0.5375922, 1.822856, 0.3913953, 0.3019608, 0, 1, 1,
0.5405167, 1.816412, 0.1314286, 0.3098039, 0, 1, 1,
0.5406155, 2.300727, -0.6969385, 0.3137255, 0, 1, 1,
0.5408468, -0.7098774, 2.095268, 0.3215686, 0, 1, 1,
0.542292, 0.2400836, 1.608438, 0.3254902, 0, 1, 1,
0.5487888, 0.6035106, 1.847842, 0.3333333, 0, 1, 1,
0.5519134, -2.286816, 2.95067, 0.3372549, 0, 1, 1,
0.5528439, 2.583592, -0.9702563, 0.345098, 0, 1, 1,
0.5537735, 0.4881344, 1.346108, 0.3490196, 0, 1, 1,
0.5552517, 0.2267788, -0.02292017, 0.3568628, 0, 1, 1,
0.5577185, -1.65111, 5.402516, 0.3607843, 0, 1, 1,
0.5598862, 0.80395, 2.156855, 0.3686275, 0, 1, 1,
0.5701447, 0.350805, -0.5259372, 0.372549, 0, 1, 1,
0.5790147, -0.8658928, 1.912752, 0.3803922, 0, 1, 1,
0.5799292, 0.3603671, 1.843547, 0.3843137, 0, 1, 1,
0.5806696, 1.159673, 1.097554, 0.3921569, 0, 1, 1,
0.5816768, 0.5711107, 0.5794708, 0.3960784, 0, 1, 1,
0.5819528, -0.2179778, 2.497847, 0.4039216, 0, 1, 1,
0.5963707, -0.5800612, 2.981099, 0.4117647, 0, 1, 1,
0.6018103, -0.3692171, 1.920418, 0.4156863, 0, 1, 1,
0.6037397, 0.1113637, 1.09263, 0.4235294, 0, 1, 1,
0.6045725, 0.1139917, 0.09874839, 0.427451, 0, 1, 1,
0.6062921, -0.7346776, 2.280685, 0.4352941, 0, 1, 1,
0.6091443, -0.7723063, 2.892367, 0.4392157, 0, 1, 1,
0.6116621, 0.3598208, 1.146292, 0.4470588, 0, 1, 1,
0.6175395, 0.9849257, -2.12999, 0.4509804, 0, 1, 1,
0.6198036, 0.06704139, 0.5768048, 0.4588235, 0, 1, 1,
0.6273834, -0.5987331, 2.409137, 0.4627451, 0, 1, 1,
0.6322765, 1.815896, -0.8751134, 0.4705882, 0, 1, 1,
0.6341907, 2.255319, 0.7010393, 0.4745098, 0, 1, 1,
0.6376047, -0.1189995, 1.377267, 0.4823529, 0, 1, 1,
0.6403486, -0.1228752, 2.257361, 0.4862745, 0, 1, 1,
0.6408853, 0.2430066, -0.2214095, 0.4941176, 0, 1, 1,
0.6445133, 0.1294807, 1.416736, 0.5019608, 0, 1, 1,
0.6472973, -1.339099, 3.42639, 0.5058824, 0, 1, 1,
0.6475985, -0.5657915, 1.491643, 0.5137255, 0, 1, 1,
0.6479694, 0.646345, 1.184468, 0.5176471, 0, 1, 1,
0.6484974, -0.3336096, 2.221966, 0.5254902, 0, 1, 1,
0.6490922, -1.376473, 3.222411, 0.5294118, 0, 1, 1,
0.6529678, -0.5174031, 1.79147, 0.5372549, 0, 1, 1,
0.6543109, 0.5128812, 3.176579, 0.5411765, 0, 1, 1,
0.6569446, -0.5979656, 2.964422, 0.5490196, 0, 1, 1,
0.6577064, 0.003963358, 2.48422, 0.5529412, 0, 1, 1,
0.6577723, -0.7312889, 3.100336, 0.5607843, 0, 1, 1,
0.6604148, 0.9199945, 1.349454, 0.5647059, 0, 1, 1,
0.6604149, 1.101432, 1.599823, 0.572549, 0, 1, 1,
0.6636727, 0.3486342, -1.351674, 0.5764706, 0, 1, 1,
0.6664554, 0.1916756, 0.341732, 0.5843138, 0, 1, 1,
0.6669022, 0.4723012, 1.774193, 0.5882353, 0, 1, 1,
0.6670699, -0.05681495, 2.306896, 0.5960785, 0, 1, 1,
0.6707136, 1.065537, -1.108883, 0.6039216, 0, 1, 1,
0.6813004, 0.3097318, 0.1239747, 0.6078432, 0, 1, 1,
0.6872966, -1.304808, 2.468297, 0.6156863, 0, 1, 1,
0.6883292, -0.05575998, 3.034407, 0.6196079, 0, 1, 1,
0.6886101, 1.635484, 0.3205847, 0.627451, 0, 1, 1,
0.6895608, 0.3679153, 1.43093, 0.6313726, 0, 1, 1,
0.6949024, -1.375206, 2.940645, 0.6392157, 0, 1, 1,
0.6958861, -0.9770835, 1.863472, 0.6431373, 0, 1, 1,
0.6985419, 0.6820482, 0.8238173, 0.6509804, 0, 1, 1,
0.6999783, 0.1090098, 1.073375, 0.654902, 0, 1, 1,
0.708223, 1.689821, 0.548674, 0.6627451, 0, 1, 1,
0.7123088, -0.1818291, 2.78758, 0.6666667, 0, 1, 1,
0.7251644, 0.1105694, 1.888116, 0.6745098, 0, 1, 1,
0.726072, -0.1703077, 0.6908603, 0.6784314, 0, 1, 1,
0.7303096, -2.836994, 2.738108, 0.6862745, 0, 1, 1,
0.7310445, -1.517076, 2.333041, 0.6901961, 0, 1, 1,
0.7326572, -0.2423593, 2.412991, 0.6980392, 0, 1, 1,
0.7328565, 0.6163358, 0.9716011, 0.7058824, 0, 1, 1,
0.7329391, -2.151843, 2.788248, 0.7098039, 0, 1, 1,
0.7393656, 0.3337673, 0.1439156, 0.7176471, 0, 1, 1,
0.7415592, 0.3764586, -0.3010964, 0.7215686, 0, 1, 1,
0.7425078, -0.7942557, 4.321704, 0.7294118, 0, 1, 1,
0.7443069, -1.591451, 4.075247, 0.7333333, 0, 1, 1,
0.7558523, 0.06406024, 2.987732, 0.7411765, 0, 1, 1,
0.7581156, -1.429004, 2.387645, 0.7450981, 0, 1, 1,
0.7584333, 0.9385375, 1.440983, 0.7529412, 0, 1, 1,
0.7650514, -0.5544816, 1.358807, 0.7568628, 0, 1, 1,
0.768077, -0.07611159, 0.9107389, 0.7647059, 0, 1, 1,
0.768275, 0.6031044, 0.8621961, 0.7686275, 0, 1, 1,
0.7716096, -1.027143, 1.561748, 0.7764706, 0, 1, 1,
0.7717302, -0.6170238, 2.215907, 0.7803922, 0, 1, 1,
0.772755, -0.5465136, 1.830341, 0.7882353, 0, 1, 1,
0.7792634, -3.054426, 3.141069, 0.7921569, 0, 1, 1,
0.7825476, -0.8099514, 2.885805, 0.8, 0, 1, 1,
0.7881767, 1.54742, 0.3280298, 0.8078431, 0, 1, 1,
0.7883665, -0.4322431, 1.14692, 0.8117647, 0, 1, 1,
0.791129, -0.0176876, 0.3046607, 0.8196079, 0, 1, 1,
0.7966803, 1.043666, -1.067731, 0.8235294, 0, 1, 1,
0.8023567, -0.879546, 2.067484, 0.8313726, 0, 1, 1,
0.8039793, -0.9241368, 2.830533, 0.8352941, 0, 1, 1,
0.8040176, -0.9935802, 1.542036, 0.8431373, 0, 1, 1,
0.8077025, 0.9330373, 1.525575, 0.8470588, 0, 1, 1,
0.8164117, 1.800519, -0.1719841, 0.854902, 0, 1, 1,
0.8178917, -1.730657, 3.837518, 0.8588235, 0, 1, 1,
0.8181475, 1.180899, -0.2254799, 0.8666667, 0, 1, 1,
0.8185009, -0.4684412, 1.027468, 0.8705882, 0, 1, 1,
0.8272122, 0.3293375, 1.290223, 0.8784314, 0, 1, 1,
0.8310489, -0.9546539, 4.059017, 0.8823529, 0, 1, 1,
0.8399619, 0.1963038, -0.3616161, 0.8901961, 0, 1, 1,
0.8423709, 0.2717855, 1.27257, 0.8941177, 0, 1, 1,
0.8464121, 0.4019201, 0.7321555, 0.9019608, 0, 1, 1,
0.8496758, -1.559398, 2.531959, 0.9098039, 0, 1, 1,
0.8507051, -0.6852735, 2.439228, 0.9137255, 0, 1, 1,
0.8507226, -0.1105586, 2.405451, 0.9215686, 0, 1, 1,
0.8522896, 0.3181878, 3.601776, 0.9254902, 0, 1, 1,
0.8594365, -0.4468646, 2.082736, 0.9333333, 0, 1, 1,
0.8600638, -0.803043, 1.093879, 0.9372549, 0, 1, 1,
0.8608022, 0.2649326, 1.466323, 0.945098, 0, 1, 1,
0.8617899, 0.619374, 2.570669, 0.9490196, 0, 1, 1,
0.870313, -0.9519441, 0.9598294, 0.9568627, 0, 1, 1,
0.8767189, 0.1820748, 2.733584, 0.9607843, 0, 1, 1,
0.8803238, -0.1569602, 0.6976295, 0.9686275, 0, 1, 1,
0.8811647, -0.4759949, 2.819049, 0.972549, 0, 1, 1,
0.8841687, 0.8150747, 0.3659091, 0.9803922, 0, 1, 1,
0.8884778, -0.1232431, 0.708953, 0.9843137, 0, 1, 1,
0.8911239, 1.500843, 0.2522486, 0.9921569, 0, 1, 1,
0.8958662, 0.2726623, 1.106769, 0.9960784, 0, 1, 1,
0.8967428, 1.161555, 0.9139305, 1, 0, 0.9960784, 1,
0.9011902, -0.8085581, 0.6286114, 1, 0, 0.9882353, 1,
0.9021977, -0.3986242, 4.356194, 1, 0, 0.9843137, 1,
0.9036374, -1.271432, 3.304033, 1, 0, 0.9764706, 1,
0.9104702, -0.685931, 3.783994, 1, 0, 0.972549, 1,
0.9294299, 0.3562094, 1.911824, 1, 0, 0.9647059, 1,
0.9368063, 0.416937, 0.2717253, 1, 0, 0.9607843, 1,
0.9420928, 0.2732067, 2.908722, 1, 0, 0.9529412, 1,
0.9436484, 2.713985, 1.341851, 1, 0, 0.9490196, 1,
0.9446334, -0.7364696, 2.070718, 1, 0, 0.9411765, 1,
0.9458129, -0.9537908, 3.382926, 1, 0, 0.9372549, 1,
0.9463192, 0.4344572, 3.23487, 1, 0, 0.9294118, 1,
0.9512407, 2.232457, -1.118142, 1, 0, 0.9254902, 1,
0.9531713, 0.2080362, 0.2557412, 1, 0, 0.9176471, 1,
0.974371, -1.559974, 2.536147, 1, 0, 0.9137255, 1,
0.9800515, -0.6160282, 1.312274, 1, 0, 0.9058824, 1,
0.9837888, -1.035056, -0.1817811, 1, 0, 0.9019608, 1,
0.9846411, 1.27307, 0.4778309, 1, 0, 0.8941177, 1,
0.9852767, 0.5225286, -1.360503, 1, 0, 0.8862745, 1,
0.9880843, -0.4240227, 2.853472, 1, 0, 0.8823529, 1,
0.9884872, 0.7133179, 0.7786849, 1, 0, 0.8745098, 1,
0.9950114, 0.6247402, 1.178493, 1, 0, 0.8705882, 1,
1.016207, 0.4174159, 0.8699239, 1, 0, 0.8627451, 1,
1.017142, 1.624643, -0.5559385, 1, 0, 0.8588235, 1,
1.02485, 1.297685, 0.1534442, 1, 0, 0.8509804, 1,
1.031455, -0.07328007, 1.078172, 1, 0, 0.8470588, 1,
1.033345, -0.8536791, 1.697234, 1, 0, 0.8392157, 1,
1.037036, -2.399497, 2.666804, 1, 0, 0.8352941, 1,
1.043462, -1.232141, 1.109229, 1, 0, 0.827451, 1,
1.05453, -0.8315224, 1.552137, 1, 0, 0.8235294, 1,
1.061877, 1.084771, 1.781231, 1, 0, 0.8156863, 1,
1.078914, -0.590943, 2.93676, 1, 0, 0.8117647, 1,
1.087474, 0.1982351, 2.498633, 1, 0, 0.8039216, 1,
1.090498, 0.1225429, 1.844441, 1, 0, 0.7960784, 1,
1.093812, -1.198877, 2.826481, 1, 0, 0.7921569, 1,
1.106924, -1.64295, 3.555897, 1, 0, 0.7843137, 1,
1.13794, 0.6826719, 2.78675, 1, 0, 0.7803922, 1,
1.140621, -0.9665916, 2.13104, 1, 0, 0.772549, 1,
1.154396, 1.359457, -0.5835651, 1, 0, 0.7686275, 1,
1.162903, -0.5108694, 2.3376, 1, 0, 0.7607843, 1,
1.164163, 0.6583598, 0.01067382, 1, 0, 0.7568628, 1,
1.17454, 0.4707813, 1.263108, 1, 0, 0.7490196, 1,
1.184332, -0.1672023, 0.8268954, 1, 0, 0.7450981, 1,
1.186258, 0.5988373, 1.219223, 1, 0, 0.7372549, 1,
1.190834, -0.8919135, 3.137994, 1, 0, 0.7333333, 1,
1.207662, 0.3985607, 0.8880981, 1, 0, 0.7254902, 1,
1.210496, 0.9078994, 0.4745211, 1, 0, 0.7215686, 1,
1.215353, -1.246189, 2.629406, 1, 0, 0.7137255, 1,
1.221573, -0.8474588, 2.699744, 1, 0, 0.7098039, 1,
1.221719, -0.2077967, 0.5695817, 1, 0, 0.7019608, 1,
1.222967, 2.461859, -0.2324074, 1, 0, 0.6941177, 1,
1.223238, 1.203618, -0.0339017, 1, 0, 0.6901961, 1,
1.229286, 1.244501, 2.00561, 1, 0, 0.682353, 1,
1.235597, 0.3277529, -0.06115323, 1, 0, 0.6784314, 1,
1.239938, -0.4185287, 1.602347, 1, 0, 0.6705883, 1,
1.240025, 0.09087519, 1.895039, 1, 0, 0.6666667, 1,
1.240503, -2.003419, 3.454084, 1, 0, 0.6588235, 1,
1.240649, -1.16172, 2.659491, 1, 0, 0.654902, 1,
1.242167, -0.9277116, 0.6885187, 1, 0, 0.6470588, 1,
1.245637, 0.9783144, 0.01493321, 1, 0, 0.6431373, 1,
1.265555, 0.3882644, 1.362391, 1, 0, 0.6352941, 1,
1.267325, -0.5534768, 3.793357, 1, 0, 0.6313726, 1,
1.267615, -1.158456, 2.780264, 1, 0, 0.6235294, 1,
1.27371, 1.412775, 0.891846, 1, 0, 0.6196079, 1,
1.294458, 0.8024583, 0.4494221, 1, 0, 0.6117647, 1,
1.300351, -0.4560217, 2.32172, 1, 0, 0.6078432, 1,
1.301986, -0.9398654, 1.100229, 1, 0, 0.6, 1,
1.30479, -1.011223, 2.638118, 1, 0, 0.5921569, 1,
1.311809, 1.146013, 3.070937, 1, 0, 0.5882353, 1,
1.315635, 0.2478844, 0.4871962, 1, 0, 0.5803922, 1,
1.316357, -0.5496339, 1.75429, 1, 0, 0.5764706, 1,
1.327603, 0.4731345, 1.440126, 1, 0, 0.5686275, 1,
1.328346, -0.009520463, 3.159603, 1, 0, 0.5647059, 1,
1.338492, 1.455343, 0.1457785, 1, 0, 0.5568628, 1,
1.340231, -0.3713687, 2.726372, 1, 0, 0.5529412, 1,
1.353376, -1.136162, 2.091058, 1, 0, 0.5450981, 1,
1.360918, 0.5658154, -1.713807, 1, 0, 0.5411765, 1,
1.378915, -1.005767, 0.9534127, 1, 0, 0.5333334, 1,
1.388251, -0.2891114, 2.251557, 1, 0, 0.5294118, 1,
1.395565, 1.16258, 0.8788935, 1, 0, 0.5215687, 1,
1.398818, 1.310082, 0.3380797, 1, 0, 0.5176471, 1,
1.403196, 0.2853341, 3.47022, 1, 0, 0.509804, 1,
1.409439, -1.390571, 1.988496, 1, 0, 0.5058824, 1,
1.423549, -0.8822727, 0.8685741, 1, 0, 0.4980392, 1,
1.426303, -0.6320106, 1.927904, 1, 0, 0.4901961, 1,
1.430284, -1.680959, 1.785606, 1, 0, 0.4862745, 1,
1.433776, 0.7551719, 0.9073211, 1, 0, 0.4784314, 1,
1.438338, 0.3521786, 1.059355, 1, 0, 0.4745098, 1,
1.442699, -1.150586, 1.362098, 1, 0, 0.4666667, 1,
1.454404, 0.6725878, 2.228616, 1, 0, 0.4627451, 1,
1.455704, 1.351325, -0.3617146, 1, 0, 0.454902, 1,
1.45825, 0.3575979, 0.7402318, 1, 0, 0.4509804, 1,
1.46659, -1.99591, 2.801447, 1, 0, 0.4431373, 1,
1.473225, -0.4620046, 2.482152, 1, 0, 0.4392157, 1,
1.48308, -0.5528969, 3.09971, 1, 0, 0.4313726, 1,
1.489628, -0.1001643, 1.382165, 1, 0, 0.427451, 1,
1.518157, -0.5139707, 0.8547505, 1, 0, 0.4196078, 1,
1.528308, -0.1132725, 2.951665, 1, 0, 0.4156863, 1,
1.533476, 0.5749348, 0.7962248, 1, 0, 0.4078431, 1,
1.533872, 0.3405826, 0.7108809, 1, 0, 0.4039216, 1,
1.538471, 1.47711, -0.9650421, 1, 0, 0.3960784, 1,
1.539897, 0.6592646, 1.977801, 1, 0, 0.3882353, 1,
1.552349, 0.1858928, 0.934076, 1, 0, 0.3843137, 1,
1.553915, -1.393733, 1.041099, 1, 0, 0.3764706, 1,
1.559494, 1.096497, 1.434564, 1, 0, 0.372549, 1,
1.56316, 0.1788515, 1.230752, 1, 0, 0.3647059, 1,
1.594584, 0.1540308, 0.3039231, 1, 0, 0.3607843, 1,
1.614284, -0.1126428, 2.652492, 1, 0, 0.3529412, 1,
1.64592, -1.234539, 3.104952, 1, 0, 0.3490196, 1,
1.655177, -0.3584004, 3.181383, 1, 0, 0.3411765, 1,
1.658273, -1.154463, 4.404586, 1, 0, 0.3372549, 1,
1.693665, -0.5050667, 1.794853, 1, 0, 0.3294118, 1,
1.695072, -0.008436672, 0.3083453, 1, 0, 0.3254902, 1,
1.705962, -0.9414765, 0.5931462, 1, 0, 0.3176471, 1,
1.714996, -0.8871104, 1.608974, 1, 0, 0.3137255, 1,
1.720418, -1.319811, 3.539527, 1, 0, 0.3058824, 1,
1.726698, -1.793622, 1.097995, 1, 0, 0.2980392, 1,
1.733125, 0.4526621, 0.2137942, 1, 0, 0.2941177, 1,
1.741432, -0.6640841, 2.435824, 1, 0, 0.2862745, 1,
1.742682, -0.3749621, 2.299915, 1, 0, 0.282353, 1,
1.752031, -0.5632314, 2.545278, 1, 0, 0.2745098, 1,
1.757517, 0.7588848, -0.1715675, 1, 0, 0.2705882, 1,
1.761053, -0.5779358, -0.3060016, 1, 0, 0.2627451, 1,
1.78596, 0.199928, 3.488278, 1, 0, 0.2588235, 1,
1.795874, 0.8177894, -0.3208208, 1, 0, 0.2509804, 1,
1.806826, -0.6892363, 3.996198, 1, 0, 0.2470588, 1,
1.838663, -1.049273, 1.812057, 1, 0, 0.2392157, 1,
1.844234, -0.1924726, 1.356656, 1, 0, 0.2352941, 1,
1.848553, -0.3402675, 0.6291187, 1, 0, 0.227451, 1,
1.858385, -0.5019962, -0.03635233, 1, 0, 0.2235294, 1,
1.874033, 0.6689598, -0.5441767, 1, 0, 0.2156863, 1,
1.882429, -0.009826823, 1.616115, 1, 0, 0.2117647, 1,
1.886073, -0.5647036, 2.677527, 1, 0, 0.2039216, 1,
1.890222, -0.03001938, 0.3700306, 1, 0, 0.1960784, 1,
1.92519, -1.194811, 2.463007, 1, 0, 0.1921569, 1,
1.945978, 0.1011326, -0.175461, 1, 0, 0.1843137, 1,
1.957186, -0.8008745, 1.673342, 1, 0, 0.1803922, 1,
1.972912, -0.03314171, 1.06736, 1, 0, 0.172549, 1,
1.97948, -0.338197, 2.030059, 1, 0, 0.1686275, 1,
2.000828, 1.165054, 2.237643, 1, 0, 0.1607843, 1,
2.016972, 1.661673, 1.336221, 1, 0, 0.1568628, 1,
2.026822, -0.622814, 2.195264, 1, 0, 0.1490196, 1,
2.04393, 0.785669, 1.399497, 1, 0, 0.145098, 1,
2.046001, -0.9265527, 1.925745, 1, 0, 0.1372549, 1,
2.061998, 0.6724818, 1.294781, 1, 0, 0.1333333, 1,
2.067485, -2.097423, 2.652336, 1, 0, 0.1254902, 1,
2.084766, -0.006547068, 1.744423, 1, 0, 0.1215686, 1,
2.122052, -1.372495, 2.192881, 1, 0, 0.1137255, 1,
2.134015, 0.02139571, 1.907648, 1, 0, 0.1098039, 1,
2.146383, -0.2086217, 2.627849, 1, 0, 0.1019608, 1,
2.199739, 0.554261, 1.943016, 1, 0, 0.09411765, 1,
2.202937, -0.4817572, 1.788868, 1, 0, 0.09019608, 1,
2.205545, -0.4833277, 2.07648, 1, 0, 0.08235294, 1,
2.212029, -0.1976624, 1.833864, 1, 0, 0.07843138, 1,
2.263586, 0.7907969, 0.1236501, 1, 0, 0.07058824, 1,
2.292773, -1.149938, 5.238453, 1, 0, 0.06666667, 1,
2.301843, -0.5377345, 0.9532692, 1, 0, 0.05882353, 1,
2.368134, -0.5392617, -1.022426, 1, 0, 0.05490196, 1,
2.392622, -0.04327531, 1.860883, 1, 0, 0.04705882, 1,
2.431894, 0.04422404, 3.095761, 1, 0, 0.04313726, 1,
2.451174, 0.3975674, 1.330042, 1, 0, 0.03529412, 1,
2.464029, 0.5318817, 0.9059728, 1, 0, 0.03137255, 1,
2.503501, -0.8735471, 0.5377491, 1, 0, 0.02352941, 1,
2.876371, -1.282356, 1.833772, 1, 0, 0.01960784, 1,
3.190508, 0.6205488, 0.9085305, 1, 0, 0.01176471, 1,
3.540889, -0.4027669, 2.663296, 1, 0, 0.007843138, 1
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
0.02382159, -4.731541, -7.048156, 0, -0.5, 0.5, 0.5,
0.02382159, -4.731541, -7.048156, 1, -0.5, 0.5, 0.5,
0.02382159, -4.731541, -7.048156, 1, 1.5, 0.5, 0.5,
0.02382159, -4.731541, -7.048156, 0, 1.5, 0.5, 0.5
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
-4.685532, -0.399688, -7.048156, 0, -0.5, 0.5, 0.5,
-4.685532, -0.399688, -7.048156, 1, -0.5, 0.5, 0.5,
-4.685532, -0.399688, -7.048156, 1, 1.5, 0.5, 0.5,
-4.685532, -0.399688, -7.048156, 0, 1.5, 0.5, 0.5
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
-4.685532, -4.731541, 0.07944131, 0, -0.5, 0.5, 0.5,
-4.685532, -4.731541, 0.07944131, 1, -0.5, 0.5, 0.5,
-4.685532, -4.731541, 0.07944131, 1, 1.5, 0.5, 0.5,
-4.685532, -4.731541, 0.07944131, 0, 1.5, 0.5, 0.5
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
-2, -3.731883, -5.403326,
2, -3.731883, -5.403326,
-2, -3.731883, -5.403326,
-2, -3.898493, -5.677464,
0, -3.731883, -5.403326,
0, -3.898493, -5.677464,
2, -3.731883, -5.403326,
2, -3.898493, -5.677464
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
-2, -4.231712, -6.22574, 0, -0.5, 0.5, 0.5,
-2, -4.231712, -6.22574, 1, -0.5, 0.5, 0.5,
-2, -4.231712, -6.22574, 1, 1.5, 0.5, 0.5,
-2, -4.231712, -6.22574, 0, 1.5, 0.5, 0.5,
0, -4.231712, -6.22574, 0, -0.5, 0.5, 0.5,
0, -4.231712, -6.22574, 1, -0.5, 0.5, 0.5,
0, -4.231712, -6.22574, 1, 1.5, 0.5, 0.5,
0, -4.231712, -6.22574, 0, 1.5, 0.5, 0.5,
2, -4.231712, -6.22574, 0, -0.5, 0.5, 0.5,
2, -4.231712, -6.22574, 1, -0.5, 0.5, 0.5,
2, -4.231712, -6.22574, 1, 1.5, 0.5, 0.5,
2, -4.231712, -6.22574, 0, 1.5, 0.5, 0.5
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
-3.598758, -3, -5.403326,
-3.598758, 2, -5.403326,
-3.598758, -3, -5.403326,
-3.779887, -3, -5.677464,
-3.598758, -2, -5.403326,
-3.779887, -2, -5.677464,
-3.598758, -1, -5.403326,
-3.779887, -1, -5.677464,
-3.598758, 0, -5.403326,
-3.779887, 0, -5.677464,
-3.598758, 1, -5.403326,
-3.779887, 1, -5.677464,
-3.598758, 2, -5.403326,
-3.779887, 2, -5.677464
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
-4.142145, -3, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, -3, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, -3, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, -3, -6.22574, 0, 1.5, 0.5, 0.5,
-4.142145, -2, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, -2, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, -2, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, -2, -6.22574, 0, 1.5, 0.5, 0.5,
-4.142145, -1, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, -1, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, -1, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, -1, -6.22574, 0, 1.5, 0.5, 0.5,
-4.142145, 0, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, 0, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, 0, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, 0, -6.22574, 0, 1.5, 0.5, 0.5,
-4.142145, 1, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, 1, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, 1, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, 1, -6.22574, 0, 1.5, 0.5, 0.5,
-4.142145, 2, -6.22574, 0, -0.5, 0.5, 0.5,
-4.142145, 2, -6.22574, 1, -0.5, 0.5, 0.5,
-4.142145, 2, -6.22574, 1, 1.5, 0.5, 0.5,
-4.142145, 2, -6.22574, 0, 1.5, 0.5, 0.5
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
-3.598758, -3.731883, -4,
-3.598758, -3.731883, 4,
-3.598758, -3.731883, -4,
-3.779887, -3.898493, -4,
-3.598758, -3.731883, -2,
-3.779887, -3.898493, -2,
-3.598758, -3.731883, 0,
-3.779887, -3.898493, 0,
-3.598758, -3.731883, 2,
-3.779887, -3.898493, 2,
-3.598758, -3.731883, 4,
-3.779887, -3.898493, 4
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
-4.142145, -4.231712, -4, 0, -0.5, 0.5, 0.5,
-4.142145, -4.231712, -4, 1, -0.5, 0.5, 0.5,
-4.142145, -4.231712, -4, 1, 1.5, 0.5, 0.5,
-4.142145, -4.231712, -4, 0, 1.5, 0.5, 0.5,
-4.142145, -4.231712, -2, 0, -0.5, 0.5, 0.5,
-4.142145, -4.231712, -2, 1, -0.5, 0.5, 0.5,
-4.142145, -4.231712, -2, 1, 1.5, 0.5, 0.5,
-4.142145, -4.231712, -2, 0, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 0, 0, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 0, 1, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 0, 1, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 0, 0, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 2, 0, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 2, 1, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 2, 1, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 2, 0, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 4, 0, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 4, 1, -0.5, 0.5, 0.5,
-4.142145, -4.231712, 4, 1, 1.5, 0.5, 0.5,
-4.142145, -4.231712, 4, 0, 1.5, 0.5, 0.5
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
-3.598758, -3.731883, -5.403326,
-3.598758, 2.932507, -5.403326,
-3.598758, -3.731883, 5.562208,
-3.598758, 2.932507, 5.562208,
-3.598758, -3.731883, -5.403326,
-3.598758, -3.731883, 5.562208,
-3.598758, 2.932507, -5.403326,
-3.598758, 2.932507, 5.562208,
-3.598758, -3.731883, -5.403326,
3.646401, -3.731883, -5.403326,
-3.598758, -3.731883, 5.562208,
3.646401, -3.731883, 5.562208,
-3.598758, 2.932507, -5.403326,
3.646401, 2.932507, -5.403326,
-3.598758, 2.932507, 5.562208,
3.646401, 2.932507, 5.562208,
3.646401, -3.731883, -5.403326,
3.646401, 2.932507, -5.403326,
3.646401, -3.731883, 5.562208,
3.646401, 2.932507, 5.562208,
3.646401, -3.731883, -5.403326,
3.646401, -3.731883, 5.562208,
3.646401, 2.932507, -5.403326,
3.646401, 2.932507, 5.562208
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
var radius = 7.868731;
var distance = 35.00888;
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
mvMatrix.translate( -0.02382159, 0.399688, -0.07944131 );
mvMatrix.scale( 1.174277, 1.27661, 0.7758698 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.00888);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
oxathiazine_4-oxide<-read.table("oxathiazine_4-oxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxathiazine_4-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
```

```r
y<-oxathiazine_4-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
```

```r
z<-oxathiazine_4-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxathiazine_4' not found
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
-3.493246, -0.03439162, -2.331123, 0, 0, 1, 1, 1,
-2.986487, -0.6308661, -2.075808, 1, 0, 0, 1, 1,
-2.63366, -0.9660504, -1.598303, 1, 0, 0, 1, 1,
-2.584381, -1.769108, -2.065454, 1, 0, 0, 1, 1,
-2.323062, 0.03059981, -0.9063057, 1, 0, 0, 1, 1,
-2.319908, 0.6704863, -2.514733, 1, 0, 0, 1, 1,
-2.263085, 1.026434, 0.3915435, 0, 0, 0, 1, 1,
-2.248563, -1.069379, -1.010482, 0, 0, 0, 1, 1,
-2.231447, -0.8452178, -0.2481369, 0, 0, 0, 1, 1,
-2.21831, 0.3139436, -1.456974, 0, 0, 0, 1, 1,
-2.196417, 0.1335819, -2.912239, 0, 0, 0, 1, 1,
-2.123326, 0.2887576, -2.159128, 0, 0, 0, 1, 1,
-2.122649, 0.3022127, -2.842687, 0, 0, 0, 1, 1,
-2.119618, -0.8761441, -3.201267, 1, 1, 1, 1, 1,
-2.107701, -0.9562636, -1.97625, 1, 1, 1, 1, 1,
-2.079895, 0.4002247, -2.639685, 1, 1, 1, 1, 1,
-2.07759, -0.5081736, -1.636433, 1, 1, 1, 1, 1,
-2.07537, -1.981262, -3.93687, 1, 1, 1, 1, 1,
-2.045503, -1.991047, -2.840426, 1, 1, 1, 1, 1,
-2.017152, 2.802325, -0.4738156, 1, 1, 1, 1, 1,
-1.992355, 2.612496, 0.07281799, 1, 1, 1, 1, 1,
-1.983149, -0.8552051, -2.053369, 1, 1, 1, 1, 1,
-1.971808, -0.1555436, -2.849154, 1, 1, 1, 1, 1,
-1.963471, 1.405855, -0.5515864, 1, 1, 1, 1, 1,
-1.919529, -1.365442, -0.9694819, 1, 1, 1, 1, 1,
-1.896513, -0.4736841, -1.606924, 1, 1, 1, 1, 1,
-1.879026, -0.79032, -0.2130349, 1, 1, 1, 1, 1,
-1.840396, -0.903641, -1.627088, 1, 1, 1, 1, 1,
-1.792831, -1.265759, -1.61333, 0, 0, 1, 1, 1,
-1.792795, 1.704089, -0.8335134, 1, 0, 0, 1, 1,
-1.77849, 1.710479, -0.03702905, 1, 0, 0, 1, 1,
-1.767608, 0.201381, -1.177557, 1, 0, 0, 1, 1,
-1.736814, 0.4682318, -2.249023, 1, 0, 0, 1, 1,
-1.717742, 0.97259, -0.8349702, 1, 0, 0, 1, 1,
-1.699501, -2.069754, -1.8927, 0, 0, 0, 1, 1,
-1.699141, -0.5210248, 0.4303928, 0, 0, 0, 1, 1,
-1.694982, -0.5210437, -0.9813501, 0, 0, 0, 1, 1,
-1.694646, 1.213861, -0.1823308, 0, 0, 0, 1, 1,
-1.691372, 2.133491, -1.667067, 0, 0, 0, 1, 1,
-1.687606, 1.196958, -0.9609078, 0, 0, 0, 1, 1,
-1.670572, 1.307786, -0.8279108, 0, 0, 0, 1, 1,
-1.666064, 0.4296986, -2.357433, 1, 1, 1, 1, 1,
-1.640803, -1.270576, -1.977167, 1, 1, 1, 1, 1,
-1.635196, -1.501374, -3.295456, 1, 1, 1, 1, 1,
-1.615406, -0.144623, -2.768729, 1, 1, 1, 1, 1,
-1.587536, -0.5936477, -2.481446, 1, 1, 1, 1, 1,
-1.581756, 0.5579014, -0.6326931, 1, 1, 1, 1, 1,
-1.580095, 0.3008319, -1.877328, 1, 1, 1, 1, 1,
-1.567211, -0.05764724, -0.691104, 1, 1, 1, 1, 1,
-1.564526, 1.705776, -1.870486, 1, 1, 1, 1, 1,
-1.558618, -0.2039172, -1.81864, 1, 1, 1, 1, 1,
-1.558164, 1.579505, -1.936704, 1, 1, 1, 1, 1,
-1.551268, -0.9816211, -1.395903, 1, 1, 1, 1, 1,
-1.544011, -1.791554, -1.973567, 1, 1, 1, 1, 1,
-1.527158, -0.09843093, -1.265335, 1, 1, 1, 1, 1,
-1.517407, 0.4531744, -1.643243, 1, 1, 1, 1, 1,
-1.500047, 0.3846337, -1.077814, 0, 0, 1, 1, 1,
-1.499078, -0.6550458, -2.256261, 1, 0, 0, 1, 1,
-1.494225, 0.1970165, -2.546455, 1, 0, 0, 1, 1,
-1.491812, -0.8592685, -1.722777, 1, 0, 0, 1, 1,
-1.483276, 0.5860116, -0.5794299, 1, 0, 0, 1, 1,
-1.482271, -0.6571268, -1.588844, 1, 0, 0, 1, 1,
-1.466057, -0.002324348, -2.152252, 0, 0, 0, 1, 1,
-1.461175, 0.9048488, -1.433408, 0, 0, 0, 1, 1,
-1.452426, 1.433695, -1.248496, 0, 0, 0, 1, 1,
-1.449782, -1.518571, -3.327996, 0, 0, 0, 1, 1,
-1.443765, -0.2445258, -3.244396, 0, 0, 0, 1, 1,
-1.425764, 0.798506, -0.7519315, 0, 0, 0, 1, 1,
-1.418776, 2.173069, -1.349284, 0, 0, 0, 1, 1,
-1.418227, 2.035953, -1.33397, 1, 1, 1, 1, 1,
-1.417341, -1.761842, -2.710484, 1, 1, 1, 1, 1,
-1.401533, 1.965472, 0.1864288, 1, 1, 1, 1, 1,
-1.395705, -0.4687006, -0.3012819, 1, 1, 1, 1, 1,
-1.392219, 0.09438248, -1.077276, 1, 1, 1, 1, 1,
-1.390977, 0.4912502, -1.366466, 1, 1, 1, 1, 1,
-1.389199, 1.65545, 1.82123, 1, 1, 1, 1, 1,
-1.385604, 1.770494, 0.2655796, 1, 1, 1, 1, 1,
-1.384236, -1.152105, -0.3584134, 1, 1, 1, 1, 1,
-1.382928, -1.548898, -3.085463, 1, 1, 1, 1, 1,
-1.37466, -0.0799947, -1.319199, 1, 1, 1, 1, 1,
-1.366697, 0.4820178, -1.841582, 1, 1, 1, 1, 1,
-1.36331, -0.8105368, -2.666031, 1, 1, 1, 1, 1,
-1.362337, 1.441702, -0.6108271, 1, 1, 1, 1, 1,
-1.357529, -0.1694388, -1.972951, 1, 1, 1, 1, 1,
-1.355155, 0.04086768, 0.188103, 0, 0, 1, 1, 1,
-1.354992, -0.01432543, -2.027846, 1, 0, 0, 1, 1,
-1.349815, -1.21531, -1.274656, 1, 0, 0, 1, 1,
-1.343007, -0.8434657, -2.307322, 1, 0, 0, 1, 1,
-1.340119, -0.1692012, -3.742971, 1, 0, 0, 1, 1,
-1.332106, 0.2064039, -2.329143, 1, 0, 0, 1, 1,
-1.306914, 0.6804572, -1.462045, 0, 0, 0, 1, 1,
-1.305927, 2.135081, 0.8141633, 0, 0, 0, 1, 1,
-1.304348, 1.621523, -0.198565, 0, 0, 0, 1, 1,
-1.300395, 1.123537, -2.666996, 0, 0, 0, 1, 1,
-1.29592, -0.8832467, -3.114234, 0, 0, 0, 1, 1,
-1.290443, 0.327161, -1.929476, 0, 0, 0, 1, 1,
-1.289284, -0.1050362, -1.264643, 0, 0, 0, 1, 1,
-1.284738, 1.614572, 0.4017968, 1, 1, 1, 1, 1,
-1.280977, 1.341618, 1.905783, 1, 1, 1, 1, 1,
-1.277113, 0.7223254, -1.440638, 1, 1, 1, 1, 1,
-1.269726, 0.5028555, -1.029179, 1, 1, 1, 1, 1,
-1.266542, 0.656372, -0.7405911, 1, 1, 1, 1, 1,
-1.257352, 0.04703879, -1.718214, 1, 1, 1, 1, 1,
-1.2495, -1.474761, -2.466331, 1, 1, 1, 1, 1,
-1.248098, 0.6108539, -1.627378, 1, 1, 1, 1, 1,
-1.245033, 0.4053409, -0.08464758, 1, 1, 1, 1, 1,
-1.231017, -0.9622838, -1.437045, 1, 1, 1, 1, 1,
-1.221058, -0.440605, -1.787673, 1, 1, 1, 1, 1,
-1.218358, 0.03402239, -0.9042373, 1, 1, 1, 1, 1,
-1.214919, -0.6091446, -3.176384, 1, 1, 1, 1, 1,
-1.210428, 0.1184819, 0.4637757, 1, 1, 1, 1, 1,
-1.206424, 0.4825315, -0.7508918, 1, 1, 1, 1, 1,
-1.197709, -0.4522618, -0.09193315, 0, 0, 1, 1, 1,
-1.196109, -0.003230206, -1.373876, 1, 0, 0, 1, 1,
-1.18778, -0.1155257, -1.532556, 1, 0, 0, 1, 1,
-1.18705, -1.313705, -2.519648, 1, 0, 0, 1, 1,
-1.185564, -0.4484804, -1.671862, 1, 0, 0, 1, 1,
-1.165613, 0.9746161, -1.789493, 1, 0, 0, 1, 1,
-1.165495, 0.2112455, -0.4144032, 0, 0, 0, 1, 1,
-1.164905, -1.24567, -3.439052, 0, 0, 0, 1, 1,
-1.161881, 0.1498491, -1.650945, 0, 0, 0, 1, 1,
-1.158611, -1.186549, -2.30382, 0, 0, 0, 1, 1,
-1.153249, 0.265476, -1.020185, 0, 0, 0, 1, 1,
-1.151353, 0.03166563, -1.072728, 0, 0, 0, 1, 1,
-1.149081, 0.2904056, 0.3892581, 0, 0, 0, 1, 1,
-1.148611, 0.2846472, -1.925968, 1, 1, 1, 1, 1,
-1.140441, -0.1789404, -0.1726531, 1, 1, 1, 1, 1,
-1.133157, 1.837903, -0.1494604, 1, 1, 1, 1, 1,
-1.111058, -0.3084663, -3.708112, 1, 1, 1, 1, 1,
-1.110071, -0.9487051, -4.056273, 1, 1, 1, 1, 1,
-1.100784, -0.5352347, -1.07321, 1, 1, 1, 1, 1,
-1.099812, 1.759237, -0.3172071, 1, 1, 1, 1, 1,
-1.089202, 1.42789, -0.3187922, 1, 1, 1, 1, 1,
-1.086517, 0.684452, -1.156637, 1, 1, 1, 1, 1,
-1.072872, -1.462317, -2.056443, 1, 1, 1, 1, 1,
-1.066018, -0.8736007, -3.105404, 1, 1, 1, 1, 1,
-1.057518, 0.5459229, -1.827376, 1, 1, 1, 1, 1,
-1.046844, -0.653833, -1.484414, 1, 1, 1, 1, 1,
-1.046436, -0.08622275, -1.131819, 1, 1, 1, 1, 1,
-1.04638, 0.6705691, -1.724585, 1, 1, 1, 1, 1,
-1.044922, -0.3959898, -4.615156, 0, 0, 1, 1, 1,
-1.02477, -0.3208418, -1.601881, 1, 0, 0, 1, 1,
-1.021406, 0.5317535, -0.2631055, 1, 0, 0, 1, 1,
-1.010527, -2.479838, -3.448604, 1, 0, 0, 1, 1,
-1.006109, 1.003562, -0.3786076, 1, 0, 0, 1, 1,
-1.005095, -0.2751986, -0.4313637, 1, 0, 0, 1, 1,
-0.9903567, -0.4069775, -2.851041, 0, 0, 0, 1, 1,
-0.9838247, -0.9806898, 1.537901, 0, 0, 0, 1, 1,
-0.981833, -0.09614239, -1.831125, 0, 0, 0, 1, 1,
-0.9754812, -0.2152516, -2.4585, 0, 0, 0, 1, 1,
-0.9699056, 0.580214, -2.075146, 0, 0, 0, 1, 1,
-0.9670667, 0.9891125, -0.2386535, 0, 0, 0, 1, 1,
-0.9631956, 1.625269, -1.990553, 0, 0, 0, 1, 1,
-0.9590604, -1.444626, -4.419624, 1, 1, 1, 1, 1,
-0.9556418, 0.9044843, -1.223557, 1, 1, 1, 1, 1,
-0.9480767, -1.731282, -3.532043, 1, 1, 1, 1, 1,
-0.9457774, -1.295595, -1.639847, 1, 1, 1, 1, 1,
-0.9421191, -0.3744671, -2.913633, 1, 1, 1, 1, 1,
-0.9350984, -0.1262562, -2.761699, 1, 1, 1, 1, 1,
-0.9327542, -0.4427581, -1.004635, 1, 1, 1, 1, 1,
-0.9212376, -1.022829, -1.116627, 1, 1, 1, 1, 1,
-0.918155, 0.1630363, -0.7207395, 1, 1, 1, 1, 1,
-0.9129131, -0.2197301, -3.395886, 1, 1, 1, 1, 1,
-0.9123014, -0.1444965, -0.1486693, 1, 1, 1, 1, 1,
-0.9063951, -0.7206312, -1.692123, 1, 1, 1, 1, 1,
-0.8962936, -0.9323496, -3.440101, 1, 1, 1, 1, 1,
-0.8927791, -0.3565831, -2.584027, 1, 1, 1, 1, 1,
-0.8921796, -0.8646906, -0.6292381, 1, 1, 1, 1, 1,
-0.888571, -0.5658934, -2.479417, 0, 0, 1, 1, 1,
-0.8884469, 0.09715135, -1.294396, 1, 0, 0, 1, 1,
-0.8878905, 1.199632, -1.013383, 1, 0, 0, 1, 1,
-0.8858411, 1.11473, 0.7538604, 1, 0, 0, 1, 1,
-0.8835369, -0.5052888, -0.955496, 1, 0, 0, 1, 1,
-0.8810089, 0.3163073, -2.322895, 1, 0, 0, 1, 1,
-0.8772504, 0.9884744, -1.657244, 0, 0, 0, 1, 1,
-0.8743402, 0.05091865, -0.5317637, 0, 0, 0, 1, 1,
-0.8681097, 0.05911332, -3.257959, 0, 0, 0, 1, 1,
-0.8603032, 0.3691384, -1.813768, 0, 0, 0, 1, 1,
-0.8581495, -0.513849, -2.335495, 0, 0, 0, 1, 1,
-0.8567746, -0.2918059, -3.483714, 0, 0, 0, 1, 1,
-0.856191, -1.397015, -1.272945, 0, 0, 0, 1, 1,
-0.8545862, 1.77042, -2.3008, 1, 1, 1, 1, 1,
-0.8540318, -0.9226198, -2.79156, 1, 1, 1, 1, 1,
-0.8507837, 0.4393319, -0.6970192, 1, 1, 1, 1, 1,
-0.8408206, -0.1055671, -2.367629, 1, 1, 1, 1, 1,
-0.8345842, -0.9364783, -1.532023, 1, 1, 1, 1, 1,
-0.8326069, -1.406605, -2.4209, 1, 1, 1, 1, 1,
-0.8288769, -1.202104, -0.9188136, 1, 1, 1, 1, 1,
-0.8240259, -0.8013796, -1.322805, 1, 1, 1, 1, 1,
-0.8224006, 1.301666, -0.9969574, 1, 1, 1, 1, 1,
-0.821963, -0.5040213, -1.495242, 1, 1, 1, 1, 1,
-0.8217368, 1.48635, -0.4590025, 1, 1, 1, 1, 1,
-0.8177063, -0.5347974, -1.968067, 1, 1, 1, 1, 1,
-0.8165265, 0.3816276, -0.9466342, 1, 1, 1, 1, 1,
-0.8152716, 0.8367727, -1.085387, 1, 1, 1, 1, 1,
-0.8053391, -0.8410589, -0.90976, 1, 1, 1, 1, 1,
-0.8051325, -2.909482, -0.9203252, 0, 0, 1, 1, 1,
-0.8025875, 0.07316494, -0.4950232, 1, 0, 0, 1, 1,
-0.799381, -0.4873606, -1.448338, 1, 0, 0, 1, 1,
-0.7987266, 0.1709771, -3.041418, 1, 0, 0, 1, 1,
-0.7894321, 0.4008171, -1.378222, 1, 0, 0, 1, 1,
-0.7782727, 0.698311, -1.226039, 1, 0, 0, 1, 1,
-0.7772527, 0.9123755, -0.9236304, 0, 0, 0, 1, 1,
-0.7744684, 0.8228225, 0.2495647, 0, 0, 0, 1, 1,
-0.7656375, 0.5005946, 0.8704965, 0, 0, 0, 1, 1,
-0.7647744, 0.3793125, -1.771319, 0, 0, 0, 1, 1,
-0.7624922, 0.5816369, 0.3675008, 0, 0, 0, 1, 1,
-0.756824, -0.05197879, -0.9088545, 0, 0, 0, 1, 1,
-0.7567276, -0.2581069, -1.680481, 0, 0, 0, 1, 1,
-0.7534668, -2.309867, -2.77607, 1, 1, 1, 1, 1,
-0.7392812, 1.611489, -1.227134, 1, 1, 1, 1, 1,
-0.7373941, 0.6352216, -1.320957, 1, 1, 1, 1, 1,
-0.7369781, 1.406918, -0.9808179, 1, 1, 1, 1, 1,
-0.7248887, -2.155969, -2.760271, 1, 1, 1, 1, 1,
-0.7142915, 0.5303582, -1.345049, 1, 1, 1, 1, 1,
-0.7075033, -2.168185, -4.144548, 1, 1, 1, 1, 1,
-0.7064921, -0.6257414, -3.388561, 1, 1, 1, 1, 1,
-0.7060319, 0.8620802, -0.3469838, 1, 1, 1, 1, 1,
-0.6998206, -1.263897, -1.024869, 1, 1, 1, 1, 1,
-0.6890672, -1.567253, -3.743028, 1, 1, 1, 1, 1,
-0.6885507, 1.060867, -0.09222342, 1, 1, 1, 1, 1,
-0.6823309, -0.1070543, -1.261958, 1, 1, 1, 1, 1,
-0.6810355, 1.50513, 0.3008408, 1, 1, 1, 1, 1,
-0.6797267, 0.1126275, -1.018939, 1, 1, 1, 1, 1,
-0.6775575, -0.1498565, -2.303906, 0, 0, 1, 1, 1,
-0.6741252, 0.9027626, -1.352437, 1, 0, 0, 1, 1,
-0.6715516, -1.490163, -1.57307, 1, 0, 0, 1, 1,
-0.6702566, -0.1036745, -2.914805, 1, 0, 0, 1, 1,
-0.6700739, 0.6271009, 0.3729832, 1, 0, 0, 1, 1,
-0.6679857, -1.988823, -3.849534, 1, 0, 0, 1, 1,
-0.6665825, 0.003833142, -1.028554, 0, 0, 0, 1, 1,
-0.6656545, 0.9456068, -0.2241501, 0, 0, 0, 1, 1,
-0.6605088, -1.100262, -2.899742, 0, 0, 0, 1, 1,
-0.6580078, 0.3615246, -0.3744206, 0, 0, 0, 1, 1,
-0.6543208, 2.480116, 0.5952314, 0, 0, 0, 1, 1,
-0.6511081, -1.23746, -1.854402, 0, 0, 0, 1, 1,
-0.6427613, -0.530545, -2.533605, 0, 0, 0, 1, 1,
-0.6356432, -0.06929417, -0.732511, 1, 1, 1, 1, 1,
-0.6329411, 0.4498741, -0.2031379, 1, 1, 1, 1, 1,
-0.631653, -0.161713, -0.8698488, 1, 1, 1, 1, 1,
-0.6264899, -0.3682848, -2.861012, 1, 1, 1, 1, 1,
-0.6208003, 0.2764387, -0.7823075, 1, 1, 1, 1, 1,
-0.620082, 0.711385, 0.01194222, 1, 1, 1, 1, 1,
-0.617989, 1.757207, -2.383437, 1, 1, 1, 1, 1,
-0.6167809, 0.6758222, 0.122741, 1, 1, 1, 1, 1,
-0.6102443, 0.01085594, -0.5590914, 1, 1, 1, 1, 1,
-0.6069498, 1.171067, 0.0775016, 1, 1, 1, 1, 1,
-0.6052865, 0.881929, -0.2104314, 1, 1, 1, 1, 1,
-0.5980104, 0.8926824, -0.1145943, 1, 1, 1, 1, 1,
-0.5979308, 0.3829356, -0.130465, 1, 1, 1, 1, 1,
-0.5911839, 2.099931, -0.3268824, 1, 1, 1, 1, 1,
-0.5896925, -0.001865094, -1.158027, 1, 1, 1, 1, 1,
-0.5869353, 1.920717, 0.7551781, 0, 0, 1, 1, 1,
-0.5803192, -0.9533243, -3.810933, 1, 0, 0, 1, 1,
-0.5753289, 0.9437767, 0.07208288, 1, 0, 0, 1, 1,
-0.5741451, -0.4756474, -1.887453, 1, 0, 0, 1, 1,
-0.5730707, 0.4471929, 0.5667735, 1, 0, 0, 1, 1,
-0.5692385, 0.6707683, 0.7962955, 1, 0, 0, 1, 1,
-0.5659326, -0.3367523, -3.39762, 0, 0, 0, 1, 1,
-0.5650914, 0.8713493, -0.3509206, 0, 0, 0, 1, 1,
-0.5600277, 1.574082, -0.2582282, 0, 0, 0, 1, 1,
-0.5584903, 1.319117, 0.3030998, 0, 0, 0, 1, 1,
-0.5570974, 1.45173, 0.8707088, 0, 0, 0, 1, 1,
-0.5510998, -0.1442873, -2.588742, 0, 0, 0, 1, 1,
-0.5458597, 1.396396, 0.2356417, 0, 0, 0, 1, 1,
-0.5448791, 0.8946645, -0.6311499, 1, 1, 1, 1, 1,
-0.5442132, -0.5117863, -1.579087, 1, 1, 1, 1, 1,
-0.5429898, 0.2336558, -2.310045, 1, 1, 1, 1, 1,
-0.5354707, 1.979323, -2.07202, 1, 1, 1, 1, 1,
-0.5353633, -0.8472592, -3.459285, 1, 1, 1, 1, 1,
-0.5184739, 1.175541, -1.39041, 1, 1, 1, 1, 1,
-0.5171136, -0.2284998, -2.040279, 1, 1, 1, 1, 1,
-0.5154504, -0.6806481, -3.595453, 1, 1, 1, 1, 1,
-0.5051267, 0.01790347, -2.496071, 1, 1, 1, 1, 1,
-0.501438, 0.8823177, -0.8416765, 1, 1, 1, 1, 1,
-0.5014263, 0.05654678, -0.07343086, 1, 1, 1, 1, 1,
-0.4969733, -0.5411804, -1.010804, 1, 1, 1, 1, 1,
-0.4901788, 1.113637, -0.6796833, 1, 1, 1, 1, 1,
-0.4828195, 0.3648803, 0.1005159, 1, 1, 1, 1, 1,
-0.480305, -1.113856, -1.732585, 1, 1, 1, 1, 1,
-0.4735778, -0.03628833, -0.7903679, 0, 0, 1, 1, 1,
-0.4700715, 0.4569536, 1.730668, 1, 0, 0, 1, 1,
-0.4667387, 1.647832, -0.7262031, 1, 0, 0, 1, 1,
-0.4665132, 0.8444886, -0.65155, 1, 0, 0, 1, 1,
-0.46282, -0.4863034, -2.692508, 1, 0, 0, 1, 1,
-0.4627457, 1.482423, -0.4486454, 1, 0, 0, 1, 1,
-0.4619467, 0.9077016, -1.056654, 0, 0, 0, 1, 1,
-0.4586518, 0.1802072, -2.627971, 0, 0, 0, 1, 1,
-0.4583611, -0.3878167, -2.409072, 0, 0, 0, 1, 1,
-0.4581062, -0.5373482, -1.383188, 0, 0, 0, 1, 1,
-0.4571782, 0.7975245, -1.68658, 0, 0, 0, 1, 1,
-0.4522812, -0.2568864, -2.350403, 0, 0, 0, 1, 1,
-0.4492492, -1.426463, -2.867604, 0, 0, 0, 1, 1,
-0.4461171, 0.2051702, -1.620706, 1, 1, 1, 1, 1,
-0.4459257, -1.791906, -2.693413, 1, 1, 1, 1, 1,
-0.4449706, 0.2977102, -0.1348251, 1, 1, 1, 1, 1,
-0.4434341, -1.074698, -2.312248, 1, 1, 1, 1, 1,
-0.4419993, 1.13254, -0.6971917, 1, 1, 1, 1, 1,
-0.4408376, 0.8601818, -0.6250597, 1, 1, 1, 1, 1,
-0.4395103, 1.591125, 0.2764575, 1, 1, 1, 1, 1,
-0.4389072, -1.472863, -4.670368, 1, 1, 1, 1, 1,
-0.4352475, -0.3258363, -1.907347, 1, 1, 1, 1, 1,
-0.4330711, 0.854579, -1.874613, 1, 1, 1, 1, 1,
-0.4318781, -0.6869135, -3.509413, 1, 1, 1, 1, 1,
-0.4290867, 0.7067546, -0.9007281, 1, 1, 1, 1, 1,
-0.4272594, 1.163641, -0.141387, 1, 1, 1, 1, 1,
-0.4250138, 0.9985619, -0.1142728, 1, 1, 1, 1, 1,
-0.4237629, -0.7569035, -2.323243, 1, 1, 1, 1, 1,
-0.4231597, -3.175012, -3.10661, 0, 0, 1, 1, 1,
-0.4229974, -0.9861166, -3.489542, 1, 0, 0, 1, 1,
-0.4199283, -1.086267, -3.297229, 1, 0, 0, 1, 1,
-0.414417, 0.02688201, -0.8201126, 1, 0, 0, 1, 1,
-0.412746, -0.4963357, -0.5019888, 1, 0, 0, 1, 1,
-0.4069338, -0.3593178, -2.701714, 1, 0, 0, 1, 1,
-0.4067249, 1.661502, -1.880712, 0, 0, 0, 1, 1,
-0.4065396, -0.9898376, -3.984101, 0, 0, 0, 1, 1,
-0.4042943, -0.7106803, -2.245314, 0, 0, 0, 1, 1,
-0.4017957, -0.9591239, -2.449118, 0, 0, 0, 1, 1,
-0.3988046, -0.5365313, -2.226284, 0, 0, 0, 1, 1,
-0.3934702, -0.7476792, -0.1992419, 0, 0, 0, 1, 1,
-0.3911806, -2.697508, -0.8521757, 0, 0, 0, 1, 1,
-0.3887555, -0.126151, -2.392042, 1, 1, 1, 1, 1,
-0.3789481, -0.06813402, -0.5030921, 1, 1, 1, 1, 1,
-0.3778712, -1.319545, -2.311805, 1, 1, 1, 1, 1,
-0.3769878, -0.03039153, -2.896419, 1, 1, 1, 1, 1,
-0.3725957, -0.2113252, -1.85819, 1, 1, 1, 1, 1,
-0.3690961, -0.6654843, -2.186738, 1, 1, 1, 1, 1,
-0.3668827, -0.120147, -1.514426, 1, 1, 1, 1, 1,
-0.3665498, -1.736902, -3.73672, 1, 1, 1, 1, 1,
-0.3660137, -0.8929783, -1.954502, 1, 1, 1, 1, 1,
-0.3604276, 0.3648795, -1.640851, 1, 1, 1, 1, 1,
-0.3582228, 0.8555686, -1.494169, 1, 1, 1, 1, 1,
-0.353886, -0.269881, -1.714823, 1, 1, 1, 1, 1,
-0.3522716, 2.225238, -0.1050597, 1, 1, 1, 1, 1,
-0.3518087, -0.7710373, -1.612085, 1, 1, 1, 1, 1,
-0.3497511, 0.6970763, -1.38026, 1, 1, 1, 1, 1,
-0.3442105, -0.4302655, -3.834181, 0, 0, 1, 1, 1,
-0.3427625, -1.538807, -2.235622, 1, 0, 0, 1, 1,
-0.340228, -0.08332504, -0.2650535, 1, 0, 0, 1, 1,
-0.3398726, -0.009017099, -1.767045, 1, 0, 0, 1, 1,
-0.3380793, -2.410646, -2.018547, 1, 0, 0, 1, 1,
-0.337537, 1.741359, -0.06548584, 1, 0, 0, 1, 1,
-0.3374694, 0.09868947, -0.5649521, 0, 0, 0, 1, 1,
-0.336792, 1.287339, 0.3367322, 0, 0, 0, 1, 1,
-0.3355755, -0.5873977, -1.753649, 0, 0, 0, 1, 1,
-0.3298278, -0.3038372, -2.625808, 0, 0, 0, 1, 1,
-0.3291159, 1.060664, 2.065636, 0, 0, 0, 1, 1,
-0.3283189, -1.000705, -2.973344, 0, 0, 0, 1, 1,
-0.3278, -0.8569866, -2.349849, 0, 0, 0, 1, 1,
-0.3260775, 0.3207597, 0.01961998, 1, 1, 1, 1, 1,
-0.3138829, 1.305061, -0.6904142, 1, 1, 1, 1, 1,
-0.3137943, 0.05187558, -0.7735043, 1, 1, 1, 1, 1,
-0.3067602, 1.925087, -1.478766, 1, 1, 1, 1, 1,
-0.3066885, 0.8654775, 0.9467944, 1, 1, 1, 1, 1,
-0.3026228, -0.2568016, -2.669554, 1, 1, 1, 1, 1,
-0.3004766, -0.9854826, -1.624069, 1, 1, 1, 1, 1,
-0.2983555, -0.5879301, -1.384074, 1, 1, 1, 1, 1,
-0.2979669, -0.4359646, -3.158555, 1, 1, 1, 1, 1,
-0.2967486, 0.9813102, -0.88039, 1, 1, 1, 1, 1,
-0.2965577, 0.411819, -0.9844351, 1, 1, 1, 1, 1,
-0.2945922, 1.893911, -0.6376862, 1, 1, 1, 1, 1,
-0.2933876, 0.31929, -1.967624, 1, 1, 1, 1, 1,
-0.2926802, -1.853623, -3.163982, 1, 1, 1, 1, 1,
-0.2925289, -0.1937499, -2.263955, 1, 1, 1, 1, 1,
-0.2923609, 0.2639806, -1.671353, 0, 0, 1, 1, 1,
-0.2918741, -0.8297843, -3.52651, 1, 0, 0, 1, 1,
-0.2908725, 1.071727, -0.2326698, 1, 0, 0, 1, 1,
-0.2830914, -1.313175, -3.062929, 1, 0, 0, 1, 1,
-0.2830201, -0.1975547, -3.10753, 1, 0, 0, 1, 1,
-0.2826265, 1.242086, 0.8909235, 1, 0, 0, 1, 1,
-0.2801602, -1.234548, -3.50731, 0, 0, 0, 1, 1,
-0.2779877, 0.599464, -2.026864, 0, 0, 0, 1, 1,
-0.2774041, -0.514359, -2.952455, 0, 0, 0, 1, 1,
-0.2720376, 0.3849881, -0.3762602, 0, 0, 0, 1, 1,
-0.2719338, 0.5163275, 0.2545876, 0, 0, 0, 1, 1,
-0.2669948, -1.205488, -4.179996, 0, 0, 0, 1, 1,
-0.2650214, 0.7749365, 0.1681532, 0, 0, 0, 1, 1,
-0.2618292, 0.7248363, -0.9257134, 1, 1, 1, 1, 1,
-0.2533158, -0.5785939, -0.7430398, 1, 1, 1, 1, 1,
-0.2523227, 0.5355563, -1.301874, 1, 1, 1, 1, 1,
-0.2421546, 0.433349, -2.879009, 1, 1, 1, 1, 1,
-0.2406543, 0.443484, -1.530485, 1, 1, 1, 1, 1,
-0.2355254, -0.8312717, -1.660137, 1, 1, 1, 1, 1,
-0.2344087, 0.1582519, -0.9980342, 1, 1, 1, 1, 1,
-0.2341126, 0.8325087, 0.0006648373, 1, 1, 1, 1, 1,
-0.231977, 0.8001285, 0.7468377, 1, 1, 1, 1, 1,
-0.2299239, 2.135964, 0.8751708, 1, 1, 1, 1, 1,
-0.223678, 1.030113, 1.041471, 1, 1, 1, 1, 1,
-0.2236162, -0.2720308, -3.110378, 1, 1, 1, 1, 1,
-0.2203512, 0.05091388, -2.552384, 1, 1, 1, 1, 1,
-0.2196815, -0.930892, -3.167508, 1, 1, 1, 1, 1,
-0.2189789, -0.02409207, -1.196796, 1, 1, 1, 1, 1,
-0.2128355, 0.3707487, -1.253639, 0, 0, 1, 1, 1,
-0.2116682, -0.4765668, -4.298672, 1, 0, 0, 1, 1,
-0.2086436, -0.7741448, -3.154708, 1, 0, 0, 1, 1,
-0.2046694, -0.7912486, -1.317443, 1, 0, 0, 1, 1,
-0.2019423, 0.2403155, -0.7319481, 1, 0, 0, 1, 1,
-0.201377, -2.066055, -2.187676, 1, 0, 0, 1, 1,
-0.2005201, -0.1146872, -1.977299, 0, 0, 0, 1, 1,
-0.1945798, -0.2332457, -0.9144306, 0, 0, 0, 1, 1,
-0.191194, 0.08594614, -2.087167, 0, 0, 0, 1, 1,
-0.188939, 0.7271639, 0.365285, 0, 0, 0, 1, 1,
-0.1883007, -0.4069938, -1.488052, 0, 0, 0, 1, 1,
-0.1882477, 0.4905986, -1.040203, 0, 0, 0, 1, 1,
-0.1869382, 0.3789599, -2.188748, 0, 0, 0, 1, 1,
-0.1853397, -1.24289, -3.324286, 1, 1, 1, 1, 1,
-0.1846217, 0.1640169, -0.2462378, 1, 1, 1, 1, 1,
-0.1835283, -0.1624007, -0.9567211, 1, 1, 1, 1, 1,
-0.1817866, -0.8235155, -3.622317, 1, 1, 1, 1, 1,
-0.1812033, -1.241878, -2.303262, 1, 1, 1, 1, 1,
-0.1809314, -0.7704443, -3.026476, 1, 1, 1, 1, 1,
-0.1791123, -0.5829606, -1.987629, 1, 1, 1, 1, 1,
-0.1781416, 1.219956, -0.3600934, 1, 1, 1, 1, 1,
-0.1776856, 0.2359911, 0.1023443, 1, 1, 1, 1, 1,
-0.1775226, 1.093942, -0.6110964, 1, 1, 1, 1, 1,
-0.176926, -1.136008, -2.865842, 1, 1, 1, 1, 1,
-0.1767417, 0.04725819, -1.73619, 1, 1, 1, 1, 1,
-0.1759039, -0.8378621, -2.046229, 1, 1, 1, 1, 1,
-0.1654905, 1.488021, -0.01924765, 1, 1, 1, 1, 1,
-0.1642132, 0.6058409, -0.385563, 1, 1, 1, 1, 1,
-0.1577707, -0.7958915, -5.089982, 0, 0, 1, 1, 1,
-0.1564874, 1.311329, -0.9214913, 1, 0, 0, 1, 1,
-0.1561128, 1.321604, -1.04932, 1, 0, 0, 1, 1,
-0.1516398, 1.439241, -2.239965, 1, 0, 0, 1, 1,
-0.1491937, -0.04503512, -1.974058, 1, 0, 0, 1, 1,
-0.1485708, 0.6591101, 1.042112, 1, 0, 0, 1, 1,
-0.147621, -0.04433165, -1.067682, 0, 0, 0, 1, 1,
-0.1439335, -1.3882, -1.925195, 0, 0, 0, 1, 1,
-0.1347385, 0.1058129, -0.1202201, 0, 0, 0, 1, 1,
-0.1311083, 2.010978, -0.8269225, 0, 0, 0, 1, 1,
-0.1301259, -0.206711, -2.338755, 0, 0, 0, 1, 1,
-0.1295679, -0.3077497, -3.3921, 0, 0, 0, 1, 1,
-0.1269205, -0.2619578, -2.340283, 0, 0, 0, 1, 1,
-0.1234308, -0.6329785, -3.619766, 1, 1, 1, 1, 1,
-0.1226951, -0.2225136, -1.939542, 1, 1, 1, 1, 1,
-0.1223041, -1.181806, -2.738933, 1, 1, 1, 1, 1,
-0.1139111, 1.249984, 0.4692682, 1, 1, 1, 1, 1,
-0.1139023, 1.923286, 0.9392628, 1, 1, 1, 1, 1,
-0.1079786, -1.764345, -3.403375, 1, 1, 1, 1, 1,
-0.107217, -0.7698101, -3.403875, 1, 1, 1, 1, 1,
-0.1068184, 0.5081959, 0.0740497, 1, 1, 1, 1, 1,
-0.1066893, 0.01219462, -1.630036, 1, 1, 1, 1, 1,
-0.1054355, -0.7511644, -3.539013, 1, 1, 1, 1, 1,
-0.1052393, 0.5134382, 1.001399, 1, 1, 1, 1, 1,
-0.1032387, -0.3075076, -4.086575, 1, 1, 1, 1, 1,
-0.08616388, -1.315662, -4.673288, 1, 1, 1, 1, 1,
-0.08462724, 0.7579691, -0.6772988, 1, 1, 1, 1, 1,
-0.08341013, 0.5903435, -0.3063221, 1, 1, 1, 1, 1,
-0.08290822, 0.5714152, 0.9369436, 0, 0, 1, 1, 1,
-0.07887594, 2.601783, -1.562973, 1, 0, 0, 1, 1,
-0.07757583, 0.1876768, -1.641721, 1, 0, 0, 1, 1,
-0.07399067, 0.8915368, 0.5435894, 1, 0, 0, 1, 1,
-0.07024021, 0.7152029, 0.3566222, 1, 0, 0, 1, 1,
-0.06885648, 0.6967698, 0.2593461, 1, 0, 0, 1, 1,
-0.06468474, 0.2470116, -0.4335164, 0, 0, 0, 1, 1,
-0.06448719, -0.5827376, -3.290804, 0, 0, 0, 1, 1,
-0.06389479, -0.1422566, -3.527358, 0, 0, 0, 1, 1,
-0.0636436, -1.655147, -3.024677, 0, 0, 0, 1, 1,
-0.06101103, 1.122389, -0.8560362, 0, 0, 0, 1, 1,
-0.05828711, 0.06155354, 0.6455573, 0, 0, 0, 1, 1,
-0.05809203, -1.867941, -2.595892, 0, 0, 0, 1, 1,
-0.05771457, 0.1488881, -0.2465154, 1, 1, 1, 1, 1,
-0.05523724, -0.5503935, -4.84864, 1, 1, 1, 1, 1,
-0.05519699, 0.3178516, -0.5404376, 1, 1, 1, 1, 1,
-0.05412536, -1.388908, -2.766794, 1, 1, 1, 1, 1,
-0.05398043, 0.7688119, 0.5035661, 1, 1, 1, 1, 1,
-0.05371197, -1.943964, -1.750479, 1, 1, 1, 1, 1,
-0.05044879, 0.6527516, -0.1527086, 1, 1, 1, 1, 1,
-0.05032082, 0.7037649, 0.5417937, 1, 1, 1, 1, 1,
-0.05017878, 0.3684456, 0.205442, 1, 1, 1, 1, 1,
-0.04792476, 0.7939506, -0.004014191, 1, 1, 1, 1, 1,
-0.0475989, -0.3730513, -3.564786, 1, 1, 1, 1, 1,
-0.04735265, 0.09302646, 0.9425582, 1, 1, 1, 1, 1,
-0.04278846, -1.080218, -2.016229, 1, 1, 1, 1, 1,
-0.04265126, 1.227963, 1.232919, 1, 1, 1, 1, 1,
-0.03438925, 2.273136, -0.09428427, 1, 1, 1, 1, 1,
-0.03232963, -0.8989727, -5.243633, 0, 0, 1, 1, 1,
-0.03097606, 0.1558694, -1.155516, 1, 0, 0, 1, 1,
-0.03012503, -0.3931719, -3.556874, 1, 0, 0, 1, 1,
-0.02962537, 0.0227457, -2.459388, 1, 0, 0, 1, 1,
-0.02763411, -0.5459281, -4.046123, 1, 0, 0, 1, 1,
-0.02666151, 0.3289759, 0.6089983, 1, 0, 0, 1, 1,
-0.02583662, -0.5292801, -1.735718, 0, 0, 0, 1, 1,
-0.02250092, 0.5207548, -1.552426, 0, 0, 0, 1, 1,
-0.02045379, -0.2134381, -1.099241, 0, 0, 0, 1, 1,
-0.01785835, -0.198031, -2.813729, 0, 0, 0, 1, 1,
-0.008385759, -0.6425539, -4.03622, 0, 0, 0, 1, 1,
-0.005511115, 0.3588118, 1.768493, 0, 0, 0, 1, 1,
-0.00550007, -0.4090849, -2.997697, 0, 0, 0, 1, 1,
-0.002604218, 0.2115718, 0.8187207, 1, 1, 1, 1, 1,
-0.001810689, 1.641246, -0.7147526, 1, 1, 1, 1, 1,
-0.001707538, 0.4809751, -0.004071821, 1, 1, 1, 1, 1,
-0.000852218, 1.062094, -0.708034, 1, 1, 1, 1, 1,
0.002635008, 1.355563, -0.5309983, 1, 1, 1, 1, 1,
0.002650045, 0.9324687, -0.3165381, 1, 1, 1, 1, 1,
0.01017328, -0.4242807, 3.203291, 1, 1, 1, 1, 1,
0.01181794, -0.2851673, 3.002537, 1, 1, 1, 1, 1,
0.01521724, 0.09128453, 0.4890791, 1, 1, 1, 1, 1,
0.02016897, -1.457906, 4.327724, 1, 1, 1, 1, 1,
0.02088667, -1.293701, 1.384674, 1, 1, 1, 1, 1,
0.02447949, -0.3550192, 3.931491, 1, 1, 1, 1, 1,
0.03113526, -1.088184, 4.050725, 1, 1, 1, 1, 1,
0.0334003, 1.365741, 0.2515574, 1, 1, 1, 1, 1,
0.03419997, 0.06062569, -0.08877371, 1, 1, 1, 1, 1,
0.0348574, 0.9533495, 0.6677584, 0, 0, 1, 1, 1,
0.03650104, 0.0499469, 2.524008, 1, 0, 0, 1, 1,
0.03971532, -1.312824, 1.529683, 1, 0, 0, 1, 1,
0.04145056, 0.3056504, 0.1139471, 1, 0, 0, 1, 1,
0.042021, 0.6650004, 0.5049004, 1, 0, 0, 1, 1,
0.04295311, -1.229915, 2.570838, 1, 0, 0, 1, 1,
0.04431014, 0.9308138, 0.6548622, 0, 0, 0, 1, 1,
0.04598763, 0.3230787, -0.6206793, 0, 0, 0, 1, 1,
0.04616527, 0.7062716, -0.8880246, 0, 0, 0, 1, 1,
0.04729311, -0.4755074, 2.900161, 0, 0, 0, 1, 1,
0.04874557, -1.176759, 3.405225, 0, 0, 0, 1, 1,
0.05398438, 0.6624236, 1.068549, 0, 0, 0, 1, 1,
0.06205869, 0.03862971, 1.79073, 0, 0, 0, 1, 1,
0.07369405, 0.1252886, 0.2797439, 1, 1, 1, 1, 1,
0.07521921, -1.492692, 3.807183, 1, 1, 1, 1, 1,
0.08058988, -0.4482009, 3.189962, 1, 1, 1, 1, 1,
0.08527194, -0.8987079, 3.18533, 1, 1, 1, 1, 1,
0.09236179, -1.901729, 3.728633, 1, 1, 1, 1, 1,
0.09517936, 0.8610405, -1.536282, 1, 1, 1, 1, 1,
0.09725013, 2.063343, -0.2565328, 1, 1, 1, 1, 1,
0.09843529, 0.2442328, 1.150962, 1, 1, 1, 1, 1,
0.09955689, -0.3119811, 3.866024, 1, 1, 1, 1, 1,
0.1001474, -0.8093792, 3.491, 1, 1, 1, 1, 1,
0.1011982, -0.8652465, 1.887436, 1, 1, 1, 1, 1,
0.1067111, -0.05181967, 2.85331, 1, 1, 1, 1, 1,
0.1182285, -1.425894, 2.763636, 1, 1, 1, 1, 1,
0.1183568, 1.482612, -2.200621, 1, 1, 1, 1, 1,
0.1238334, -0.4022416, 3.531355, 1, 1, 1, 1, 1,
0.1254871, 0.6354193, 0.3125894, 0, 0, 1, 1, 1,
0.1256061, 0.3471106, -0.9098973, 1, 0, 0, 1, 1,
0.1286044, -0.3370901, 3.280522, 1, 0, 0, 1, 1,
0.1295468, -1.277349, 2.615069, 1, 0, 0, 1, 1,
0.1322669, -0.9377918, 5.220532, 1, 0, 0, 1, 1,
0.133686, -0.5062241, 3.896525, 1, 0, 0, 1, 1,
0.1340065, 1.957958, 0.6555647, 0, 0, 0, 1, 1,
0.1355448, -0.2825565, 1.868512, 0, 0, 0, 1, 1,
0.1497715, 1.621654, -0.2486929, 0, 0, 0, 1, 1,
0.1508931, 0.4035027, 1.305739, 0, 0, 0, 1, 1,
0.1521817, -0.6018052, 2.601899, 0, 0, 0, 1, 1,
0.1539216, -0.666669, 3.218572, 0, 0, 0, 1, 1,
0.1549143, -0.6183234, 3.452842, 0, 0, 0, 1, 1,
0.1551884, 1.217141, -0.2427873, 1, 1, 1, 1, 1,
0.155955, -0.3089179, 3.4848, 1, 1, 1, 1, 1,
0.158109, 1.33579, -0.9249524, 1, 1, 1, 1, 1,
0.1604212, -0.5411847, 3.544192, 1, 1, 1, 1, 1,
0.1641416, 0.2683888, 0.9796878, 1, 1, 1, 1, 1,
0.165771, -0.7582131, 3.538913, 1, 1, 1, 1, 1,
0.1663498, 2.502493, -0.6770785, 1, 1, 1, 1, 1,
0.1758597, 1.047839, 0.6646311, 1, 1, 1, 1, 1,
0.1765785, -0.04199659, 2.694998, 1, 1, 1, 1, 1,
0.1786064, 0.1723509, 1.047598, 1, 1, 1, 1, 1,
0.1811762, 0.7440752, -0.8548281, 1, 1, 1, 1, 1,
0.1826233, -0.6806579, 2.829529, 1, 1, 1, 1, 1,
0.18279, -1.146149, 1.414102, 1, 1, 1, 1, 1,
0.18352, -0.04975558, 1.34867, 1, 1, 1, 1, 1,
0.185045, 1.155536, 1.175602, 1, 1, 1, 1, 1,
0.1853843, 0.276435, 0.2482556, 0, 0, 1, 1, 1,
0.186823, 1.448656, 1.096403, 1, 0, 0, 1, 1,
0.1869849, 0.2578734, 0.7348403, 1, 0, 0, 1, 1,
0.1876889, -0.9311869, 2.187899, 1, 0, 0, 1, 1,
0.1879201, -0.4400768, 2.204021, 1, 0, 0, 1, 1,
0.1936227, 0.9294316, 0.8290179, 1, 0, 0, 1, 1,
0.1937071, 0.2586075, -0.1926432, 0, 0, 0, 1, 1,
0.1944837, 0.5046667, 0.6308973, 0, 0, 0, 1, 1,
0.1946258, 0.1158586, 1.336693, 0, 0, 0, 1, 1,
0.2043184, 0.6641869, 0.526778, 0, 0, 0, 1, 1,
0.2047659, 0.9021013, 1.549585, 0, 0, 0, 1, 1,
0.2048421, 1.356882, 1.711451, 0, 0, 0, 1, 1,
0.2056649, -0.5962907, 3.889097, 0, 0, 0, 1, 1,
0.2074949, 1.284663, 0.08486102, 1, 1, 1, 1, 1,
0.2091667, -0.7078157, 2.001139, 1, 1, 1, 1, 1,
0.2103197, 1.362168, -0.2640116, 1, 1, 1, 1, 1,
0.2166946, -1.597437, 3.281541, 1, 1, 1, 1, 1,
0.2171475, 0.7847074, -0.3465837, 1, 1, 1, 1, 1,
0.2196796, -0.4577554, 2.410554, 1, 1, 1, 1, 1,
0.2215766, -1.062675, 2.146818, 1, 1, 1, 1, 1,
0.2247624, -0.485501, 1.458995, 1, 1, 1, 1, 1,
0.2257657, 1.158493, 0.2609027, 1, 1, 1, 1, 1,
0.2306492, 1.381444, 2.204313, 1, 1, 1, 1, 1,
0.2316817, 0.5579745, -0.7661198, 1, 1, 1, 1, 1,
0.2349153, 1.991863, 0.4824576, 1, 1, 1, 1, 1,
0.2370156, -1.535832, 2.092872, 1, 1, 1, 1, 1,
0.241687, -0.4541573, 4.068887, 1, 1, 1, 1, 1,
0.2437189, 0.3377655, 2.00942, 1, 1, 1, 1, 1,
0.2454479, -0.9843606, 3.836521, 0, 0, 1, 1, 1,
0.2477016, -0.7150337, 3.765469, 1, 0, 0, 1, 1,
0.2488353, 0.1680258, -0.2459527, 1, 0, 0, 1, 1,
0.2492661, -0.2206113, 3.261751, 1, 0, 0, 1, 1,
0.2527704, -0.1993485, 0.3635166, 1, 0, 0, 1, 1,
0.2532158, -0.555746, 2.83959, 1, 0, 0, 1, 1,
0.2539596, 2.314955, -0.5724147, 0, 0, 0, 1, 1,
0.2572816, 0.2882664, 1.274562, 0, 0, 0, 1, 1,
0.2581244, 1.11421, 0.7836813, 0, 0, 0, 1, 1,
0.2613428, -0.08325478, 0.9776511, 0, 0, 0, 1, 1,
0.2614597, 0.3560402, 0.186233, 0, 0, 0, 1, 1,
0.2616077, 0.03988502, 2.099166, 0, 0, 0, 1, 1,
0.2675261, -1.945005, 2.789866, 0, 0, 0, 1, 1,
0.2683983, -1.442277, 3.116116, 1, 1, 1, 1, 1,
0.2693018, 0.3886361, 0.5849144, 1, 1, 1, 1, 1,
0.2703275, -0.1102324, 2.505491, 1, 1, 1, 1, 1,
0.2747747, 0.3564893, -0.803539, 1, 1, 1, 1, 1,
0.278568, -0.3535802, 2.938043, 1, 1, 1, 1, 1,
0.2804624, 0.6885726, 0.06300592, 1, 1, 1, 1, 1,
0.2813504, -0.1332048, 2.435819, 1, 1, 1, 1, 1,
0.281817, -0.3633365, 2.141535, 1, 1, 1, 1, 1,
0.2819915, -0.5198432, 3.14223, 1, 1, 1, 1, 1,
0.2866457, -3.634829, 3.365449, 1, 1, 1, 1, 1,
0.2890606, 0.787779, -0.946577, 1, 1, 1, 1, 1,
0.2906826, -0.1400886, 1.707994, 1, 1, 1, 1, 1,
0.293513, -0.4482017, 2.693985, 1, 1, 1, 1, 1,
0.2946166, 0.5019252, -1.66609, 1, 1, 1, 1, 1,
0.3018739, 0.3718616, 0.4321363, 1, 1, 1, 1, 1,
0.3020272, 1.057186, 0.6733434, 0, 0, 1, 1, 1,
0.3025483, 0.09285164, 1.618157, 1, 0, 0, 1, 1,
0.3038497, 1.579696, -0.03212916, 1, 0, 0, 1, 1,
0.3044425, -1.349401, 2.885535, 1, 0, 0, 1, 1,
0.3061082, 0.8332311, -1.365148, 1, 0, 0, 1, 1,
0.3110602, -0.6124602, 2.022872, 1, 0, 0, 1, 1,
0.3119541, -1.294047, 1.252082, 0, 0, 0, 1, 1,
0.3169, 0.9885728, -0.2723635, 0, 0, 0, 1, 1,
0.3188184, 0.09985868, 2.22803, 0, 0, 0, 1, 1,
0.3191357, -1.830064, 3.869444, 0, 0, 0, 1, 1,
0.3207693, 0.3046834, 1.177647, 0, 0, 0, 1, 1,
0.3233953, 0.2740147, 1.624982, 0, 0, 0, 1, 1,
0.3235377, -0.6916013, 0.8014695, 0, 0, 0, 1, 1,
0.3240486, 1.687664, 1.105563, 1, 1, 1, 1, 1,
0.3252153, -0.5459523, 2.882967, 1, 1, 1, 1, 1,
0.3289865, 1.037824, 0.07909118, 1, 1, 1, 1, 1,
0.3313689, 0.8358506, 1.826016, 1, 1, 1, 1, 1,
0.3334366, -1.400892, 2.21031, 1, 1, 1, 1, 1,
0.3336674, -1.350051, 2.671381, 1, 1, 1, 1, 1,
0.3339944, 0.2875999, 0.809124, 1, 1, 1, 1, 1,
0.3365935, 0.3497984, 2.22759, 1, 1, 1, 1, 1,
0.3396541, 0.7726951, 0.8909114, 1, 1, 1, 1, 1,
0.3436306, 0.8771743, -0.03267641, 1, 1, 1, 1, 1,
0.3437291, 0.4841805, 1.562503, 1, 1, 1, 1, 1,
0.3482225, -0.3488523, 3.454119, 1, 1, 1, 1, 1,
0.3490013, 1.020869, -1.165087, 1, 1, 1, 1, 1,
0.3508655, -0.3363502, 2.829488, 1, 1, 1, 1, 1,
0.3560956, -1.206746, 1.676333, 1, 1, 1, 1, 1,
0.3606273, -0.2595659, 2.000702, 0, 0, 1, 1, 1,
0.3672633, 0.7832799, -0.717644, 1, 0, 0, 1, 1,
0.3691076, -0.2695428, 1.992206, 1, 0, 0, 1, 1,
0.377315, -0.09678596, 2.695573, 1, 0, 0, 1, 1,
0.3790097, -0.2317863, 3.543756, 1, 0, 0, 1, 1,
0.3821965, -1.240808, 1.589396, 1, 0, 0, 1, 1,
0.3857341, -0.5395949, 2.577394, 0, 0, 0, 1, 1,
0.3867709, -1.016751, 4.355534, 0, 0, 0, 1, 1,
0.3868746, 0.548991, 0.4129012, 0, 0, 0, 1, 1,
0.3870681, -1.738785, 4.175669, 0, 0, 0, 1, 1,
0.3888135, -0.6761206, 2.218604, 0, 0, 0, 1, 1,
0.3908326, 0.9823321, 0.4083465, 0, 0, 0, 1, 1,
0.3942932, -2.019665, 3.144907, 0, 0, 0, 1, 1,
0.3944851, -0.7451459, 4.042094, 1, 1, 1, 1, 1,
0.3967365, -0.09141772, 2.334107, 1, 1, 1, 1, 1,
0.3973155, -0.2061352, 2.725955, 1, 1, 1, 1, 1,
0.3991039, -0.5287609, 3.382837, 1, 1, 1, 1, 1,
0.4029195, -1.378932, 1.924163, 1, 1, 1, 1, 1,
0.403358, 1.283095, 1.294405, 1, 1, 1, 1, 1,
0.4058152, 0.1761012, 1.638096, 1, 1, 1, 1, 1,
0.4073201, 1.707984, -0.6386518, 1, 1, 1, 1, 1,
0.413343, 2.313689, 0.5674362, 1, 1, 1, 1, 1,
0.415963, -0.8305209, 2.257872, 1, 1, 1, 1, 1,
0.4165305, -0.3661288, 1.735885, 1, 1, 1, 1, 1,
0.4195709, 0.9046218, -0.1832992, 1, 1, 1, 1, 1,
0.4218214, 2.604601, 0.9469678, 1, 1, 1, 1, 1,
0.4219547, 2.325642, 2.101392, 1, 1, 1, 1, 1,
0.4265234, -0.1921511, 2.707358, 1, 1, 1, 1, 1,
0.4286163, 0.9732398, 1.408647, 0, 0, 1, 1, 1,
0.4289053, 2.245409, -0.501816, 1, 0, 0, 1, 1,
0.4304598, -0.3164518, 1.705454, 1, 0, 0, 1, 1,
0.4335255, 0.4075104, 1.325982, 1, 0, 0, 1, 1,
0.4375373, -0.7486955, 2.288263, 1, 0, 0, 1, 1,
0.4380863, -0.5064502, 4.656494, 1, 0, 0, 1, 1,
0.4426206, 0.2578779, 1.085906, 0, 0, 0, 1, 1,
0.4431245, 0.4820083, 0.9124157, 0, 0, 0, 1, 1,
0.4487756, 0.9094537, 1.894008, 0, 0, 0, 1, 1,
0.4501683, 2.265813, -1.121323, 0, 0, 0, 1, 1,
0.4502746, 0.4541114, 0.6506321, 0, 0, 0, 1, 1,
0.4565244, 0.804015, 0.3170851, 0, 0, 0, 1, 1,
0.4598628, 2.835453, 0.3696285, 0, 0, 0, 1, 1,
0.4633957, -0.9359841, 2.873447, 1, 1, 1, 1, 1,
0.464308, 0.04898372, 2.019667, 1, 1, 1, 1, 1,
0.4643792, -0.5571179, 1.82047, 1, 1, 1, 1, 1,
0.465165, -0.4441989, 2.244111, 1, 1, 1, 1, 1,
0.467905, 0.2406303, 2.006441, 1, 1, 1, 1, 1,
0.4757423, 0.9031446, 1.604262, 1, 1, 1, 1, 1,
0.4813496, -1.880671, 2.080493, 1, 1, 1, 1, 1,
0.4853425, -0.4005096, 1.076529, 1, 1, 1, 1, 1,
0.4877824, -0.2184212, 1.21796, 1, 1, 1, 1, 1,
0.4893057, 0.8223905, 0.07936171, 1, 1, 1, 1, 1,
0.4906137, -0.1966347, 2.241896, 1, 1, 1, 1, 1,
0.4968873, 0.08645418, 1.666515, 1, 1, 1, 1, 1,
0.4974276, -2.379476, 3.74474, 1, 1, 1, 1, 1,
0.4985212, 0.3131468, 1.566347, 1, 1, 1, 1, 1,
0.5012748, 0.8551318, 0.6120196, 1, 1, 1, 1, 1,
0.5043631, 2.396185, 1.019531, 0, 0, 1, 1, 1,
0.5061117, 0.05316626, 1.270961, 1, 0, 0, 1, 1,
0.506929, -1.138427, 2.826287, 1, 0, 0, 1, 1,
0.5137047, -0.4560772, 3.935818, 1, 0, 0, 1, 1,
0.5140228, 1.127568, 0.5210218, 1, 0, 0, 1, 1,
0.5197858, -0.02316502, 0.7321481, 1, 0, 0, 1, 1,
0.5202824, 0.8510255, 0.2292909, 0, 0, 0, 1, 1,
0.5208778, -0.1490854, 2.486493, 0, 0, 0, 1, 1,
0.5211921, 1.039631, -1.748609, 0, 0, 0, 1, 1,
0.5253344, 0.8578737, 0.7788998, 0, 0, 0, 1, 1,
0.5282369, -0.2932504, 2.503854, 0, 0, 0, 1, 1,
0.5297924, 1.180699, 1.14402, 0, 0, 0, 1, 1,
0.530801, 1.840827, -0.3745036, 0, 0, 0, 1, 1,
0.531758, 1.520595, 1.154345, 1, 1, 1, 1, 1,
0.5336678, 1.292777, -0.9741706, 1, 1, 1, 1, 1,
0.53458, 1.476572, -0.1411368, 1, 1, 1, 1, 1,
0.534759, -0.6850523, 3.695527, 1, 1, 1, 1, 1,
0.5375922, 1.822856, 0.3913953, 1, 1, 1, 1, 1,
0.5405167, 1.816412, 0.1314286, 1, 1, 1, 1, 1,
0.5406155, 2.300727, -0.6969385, 1, 1, 1, 1, 1,
0.5408468, -0.7098774, 2.095268, 1, 1, 1, 1, 1,
0.542292, 0.2400836, 1.608438, 1, 1, 1, 1, 1,
0.5487888, 0.6035106, 1.847842, 1, 1, 1, 1, 1,
0.5519134, -2.286816, 2.95067, 1, 1, 1, 1, 1,
0.5528439, 2.583592, -0.9702563, 1, 1, 1, 1, 1,
0.5537735, 0.4881344, 1.346108, 1, 1, 1, 1, 1,
0.5552517, 0.2267788, -0.02292017, 1, 1, 1, 1, 1,
0.5577185, -1.65111, 5.402516, 1, 1, 1, 1, 1,
0.5598862, 0.80395, 2.156855, 0, 0, 1, 1, 1,
0.5701447, 0.350805, -0.5259372, 1, 0, 0, 1, 1,
0.5790147, -0.8658928, 1.912752, 1, 0, 0, 1, 1,
0.5799292, 0.3603671, 1.843547, 1, 0, 0, 1, 1,
0.5806696, 1.159673, 1.097554, 1, 0, 0, 1, 1,
0.5816768, 0.5711107, 0.5794708, 1, 0, 0, 1, 1,
0.5819528, -0.2179778, 2.497847, 0, 0, 0, 1, 1,
0.5963707, -0.5800612, 2.981099, 0, 0, 0, 1, 1,
0.6018103, -0.3692171, 1.920418, 0, 0, 0, 1, 1,
0.6037397, 0.1113637, 1.09263, 0, 0, 0, 1, 1,
0.6045725, 0.1139917, 0.09874839, 0, 0, 0, 1, 1,
0.6062921, -0.7346776, 2.280685, 0, 0, 0, 1, 1,
0.6091443, -0.7723063, 2.892367, 0, 0, 0, 1, 1,
0.6116621, 0.3598208, 1.146292, 1, 1, 1, 1, 1,
0.6175395, 0.9849257, -2.12999, 1, 1, 1, 1, 1,
0.6198036, 0.06704139, 0.5768048, 1, 1, 1, 1, 1,
0.6273834, -0.5987331, 2.409137, 1, 1, 1, 1, 1,
0.6322765, 1.815896, -0.8751134, 1, 1, 1, 1, 1,
0.6341907, 2.255319, 0.7010393, 1, 1, 1, 1, 1,
0.6376047, -0.1189995, 1.377267, 1, 1, 1, 1, 1,
0.6403486, -0.1228752, 2.257361, 1, 1, 1, 1, 1,
0.6408853, 0.2430066, -0.2214095, 1, 1, 1, 1, 1,
0.6445133, 0.1294807, 1.416736, 1, 1, 1, 1, 1,
0.6472973, -1.339099, 3.42639, 1, 1, 1, 1, 1,
0.6475985, -0.5657915, 1.491643, 1, 1, 1, 1, 1,
0.6479694, 0.646345, 1.184468, 1, 1, 1, 1, 1,
0.6484974, -0.3336096, 2.221966, 1, 1, 1, 1, 1,
0.6490922, -1.376473, 3.222411, 1, 1, 1, 1, 1,
0.6529678, -0.5174031, 1.79147, 0, 0, 1, 1, 1,
0.6543109, 0.5128812, 3.176579, 1, 0, 0, 1, 1,
0.6569446, -0.5979656, 2.964422, 1, 0, 0, 1, 1,
0.6577064, 0.003963358, 2.48422, 1, 0, 0, 1, 1,
0.6577723, -0.7312889, 3.100336, 1, 0, 0, 1, 1,
0.6604148, 0.9199945, 1.349454, 1, 0, 0, 1, 1,
0.6604149, 1.101432, 1.599823, 0, 0, 0, 1, 1,
0.6636727, 0.3486342, -1.351674, 0, 0, 0, 1, 1,
0.6664554, 0.1916756, 0.341732, 0, 0, 0, 1, 1,
0.6669022, 0.4723012, 1.774193, 0, 0, 0, 1, 1,
0.6670699, -0.05681495, 2.306896, 0, 0, 0, 1, 1,
0.6707136, 1.065537, -1.108883, 0, 0, 0, 1, 1,
0.6813004, 0.3097318, 0.1239747, 0, 0, 0, 1, 1,
0.6872966, -1.304808, 2.468297, 1, 1, 1, 1, 1,
0.6883292, -0.05575998, 3.034407, 1, 1, 1, 1, 1,
0.6886101, 1.635484, 0.3205847, 1, 1, 1, 1, 1,
0.6895608, 0.3679153, 1.43093, 1, 1, 1, 1, 1,
0.6949024, -1.375206, 2.940645, 1, 1, 1, 1, 1,
0.6958861, -0.9770835, 1.863472, 1, 1, 1, 1, 1,
0.6985419, 0.6820482, 0.8238173, 1, 1, 1, 1, 1,
0.6999783, 0.1090098, 1.073375, 1, 1, 1, 1, 1,
0.708223, 1.689821, 0.548674, 1, 1, 1, 1, 1,
0.7123088, -0.1818291, 2.78758, 1, 1, 1, 1, 1,
0.7251644, 0.1105694, 1.888116, 1, 1, 1, 1, 1,
0.726072, -0.1703077, 0.6908603, 1, 1, 1, 1, 1,
0.7303096, -2.836994, 2.738108, 1, 1, 1, 1, 1,
0.7310445, -1.517076, 2.333041, 1, 1, 1, 1, 1,
0.7326572, -0.2423593, 2.412991, 1, 1, 1, 1, 1,
0.7328565, 0.6163358, 0.9716011, 0, 0, 1, 1, 1,
0.7329391, -2.151843, 2.788248, 1, 0, 0, 1, 1,
0.7393656, 0.3337673, 0.1439156, 1, 0, 0, 1, 1,
0.7415592, 0.3764586, -0.3010964, 1, 0, 0, 1, 1,
0.7425078, -0.7942557, 4.321704, 1, 0, 0, 1, 1,
0.7443069, -1.591451, 4.075247, 1, 0, 0, 1, 1,
0.7558523, 0.06406024, 2.987732, 0, 0, 0, 1, 1,
0.7581156, -1.429004, 2.387645, 0, 0, 0, 1, 1,
0.7584333, 0.9385375, 1.440983, 0, 0, 0, 1, 1,
0.7650514, -0.5544816, 1.358807, 0, 0, 0, 1, 1,
0.768077, -0.07611159, 0.9107389, 0, 0, 0, 1, 1,
0.768275, 0.6031044, 0.8621961, 0, 0, 0, 1, 1,
0.7716096, -1.027143, 1.561748, 0, 0, 0, 1, 1,
0.7717302, -0.6170238, 2.215907, 1, 1, 1, 1, 1,
0.772755, -0.5465136, 1.830341, 1, 1, 1, 1, 1,
0.7792634, -3.054426, 3.141069, 1, 1, 1, 1, 1,
0.7825476, -0.8099514, 2.885805, 1, 1, 1, 1, 1,
0.7881767, 1.54742, 0.3280298, 1, 1, 1, 1, 1,
0.7883665, -0.4322431, 1.14692, 1, 1, 1, 1, 1,
0.791129, -0.0176876, 0.3046607, 1, 1, 1, 1, 1,
0.7966803, 1.043666, -1.067731, 1, 1, 1, 1, 1,
0.8023567, -0.879546, 2.067484, 1, 1, 1, 1, 1,
0.8039793, -0.9241368, 2.830533, 1, 1, 1, 1, 1,
0.8040176, -0.9935802, 1.542036, 1, 1, 1, 1, 1,
0.8077025, 0.9330373, 1.525575, 1, 1, 1, 1, 1,
0.8164117, 1.800519, -0.1719841, 1, 1, 1, 1, 1,
0.8178917, -1.730657, 3.837518, 1, 1, 1, 1, 1,
0.8181475, 1.180899, -0.2254799, 1, 1, 1, 1, 1,
0.8185009, -0.4684412, 1.027468, 0, 0, 1, 1, 1,
0.8272122, 0.3293375, 1.290223, 1, 0, 0, 1, 1,
0.8310489, -0.9546539, 4.059017, 1, 0, 0, 1, 1,
0.8399619, 0.1963038, -0.3616161, 1, 0, 0, 1, 1,
0.8423709, 0.2717855, 1.27257, 1, 0, 0, 1, 1,
0.8464121, 0.4019201, 0.7321555, 1, 0, 0, 1, 1,
0.8496758, -1.559398, 2.531959, 0, 0, 0, 1, 1,
0.8507051, -0.6852735, 2.439228, 0, 0, 0, 1, 1,
0.8507226, -0.1105586, 2.405451, 0, 0, 0, 1, 1,
0.8522896, 0.3181878, 3.601776, 0, 0, 0, 1, 1,
0.8594365, -0.4468646, 2.082736, 0, 0, 0, 1, 1,
0.8600638, -0.803043, 1.093879, 0, 0, 0, 1, 1,
0.8608022, 0.2649326, 1.466323, 0, 0, 0, 1, 1,
0.8617899, 0.619374, 2.570669, 1, 1, 1, 1, 1,
0.870313, -0.9519441, 0.9598294, 1, 1, 1, 1, 1,
0.8767189, 0.1820748, 2.733584, 1, 1, 1, 1, 1,
0.8803238, -0.1569602, 0.6976295, 1, 1, 1, 1, 1,
0.8811647, -0.4759949, 2.819049, 1, 1, 1, 1, 1,
0.8841687, 0.8150747, 0.3659091, 1, 1, 1, 1, 1,
0.8884778, -0.1232431, 0.708953, 1, 1, 1, 1, 1,
0.8911239, 1.500843, 0.2522486, 1, 1, 1, 1, 1,
0.8958662, 0.2726623, 1.106769, 1, 1, 1, 1, 1,
0.8967428, 1.161555, 0.9139305, 1, 1, 1, 1, 1,
0.9011902, -0.8085581, 0.6286114, 1, 1, 1, 1, 1,
0.9021977, -0.3986242, 4.356194, 1, 1, 1, 1, 1,
0.9036374, -1.271432, 3.304033, 1, 1, 1, 1, 1,
0.9104702, -0.685931, 3.783994, 1, 1, 1, 1, 1,
0.9294299, 0.3562094, 1.911824, 1, 1, 1, 1, 1,
0.9368063, 0.416937, 0.2717253, 0, 0, 1, 1, 1,
0.9420928, 0.2732067, 2.908722, 1, 0, 0, 1, 1,
0.9436484, 2.713985, 1.341851, 1, 0, 0, 1, 1,
0.9446334, -0.7364696, 2.070718, 1, 0, 0, 1, 1,
0.9458129, -0.9537908, 3.382926, 1, 0, 0, 1, 1,
0.9463192, 0.4344572, 3.23487, 1, 0, 0, 1, 1,
0.9512407, 2.232457, -1.118142, 0, 0, 0, 1, 1,
0.9531713, 0.2080362, 0.2557412, 0, 0, 0, 1, 1,
0.974371, -1.559974, 2.536147, 0, 0, 0, 1, 1,
0.9800515, -0.6160282, 1.312274, 0, 0, 0, 1, 1,
0.9837888, -1.035056, -0.1817811, 0, 0, 0, 1, 1,
0.9846411, 1.27307, 0.4778309, 0, 0, 0, 1, 1,
0.9852767, 0.5225286, -1.360503, 0, 0, 0, 1, 1,
0.9880843, -0.4240227, 2.853472, 1, 1, 1, 1, 1,
0.9884872, 0.7133179, 0.7786849, 1, 1, 1, 1, 1,
0.9950114, 0.6247402, 1.178493, 1, 1, 1, 1, 1,
1.016207, 0.4174159, 0.8699239, 1, 1, 1, 1, 1,
1.017142, 1.624643, -0.5559385, 1, 1, 1, 1, 1,
1.02485, 1.297685, 0.1534442, 1, 1, 1, 1, 1,
1.031455, -0.07328007, 1.078172, 1, 1, 1, 1, 1,
1.033345, -0.8536791, 1.697234, 1, 1, 1, 1, 1,
1.037036, -2.399497, 2.666804, 1, 1, 1, 1, 1,
1.043462, -1.232141, 1.109229, 1, 1, 1, 1, 1,
1.05453, -0.8315224, 1.552137, 1, 1, 1, 1, 1,
1.061877, 1.084771, 1.781231, 1, 1, 1, 1, 1,
1.078914, -0.590943, 2.93676, 1, 1, 1, 1, 1,
1.087474, 0.1982351, 2.498633, 1, 1, 1, 1, 1,
1.090498, 0.1225429, 1.844441, 1, 1, 1, 1, 1,
1.093812, -1.198877, 2.826481, 0, 0, 1, 1, 1,
1.106924, -1.64295, 3.555897, 1, 0, 0, 1, 1,
1.13794, 0.6826719, 2.78675, 1, 0, 0, 1, 1,
1.140621, -0.9665916, 2.13104, 1, 0, 0, 1, 1,
1.154396, 1.359457, -0.5835651, 1, 0, 0, 1, 1,
1.162903, -0.5108694, 2.3376, 1, 0, 0, 1, 1,
1.164163, 0.6583598, 0.01067382, 0, 0, 0, 1, 1,
1.17454, 0.4707813, 1.263108, 0, 0, 0, 1, 1,
1.184332, -0.1672023, 0.8268954, 0, 0, 0, 1, 1,
1.186258, 0.5988373, 1.219223, 0, 0, 0, 1, 1,
1.190834, -0.8919135, 3.137994, 0, 0, 0, 1, 1,
1.207662, 0.3985607, 0.8880981, 0, 0, 0, 1, 1,
1.210496, 0.9078994, 0.4745211, 0, 0, 0, 1, 1,
1.215353, -1.246189, 2.629406, 1, 1, 1, 1, 1,
1.221573, -0.8474588, 2.699744, 1, 1, 1, 1, 1,
1.221719, -0.2077967, 0.5695817, 1, 1, 1, 1, 1,
1.222967, 2.461859, -0.2324074, 1, 1, 1, 1, 1,
1.223238, 1.203618, -0.0339017, 1, 1, 1, 1, 1,
1.229286, 1.244501, 2.00561, 1, 1, 1, 1, 1,
1.235597, 0.3277529, -0.06115323, 1, 1, 1, 1, 1,
1.239938, -0.4185287, 1.602347, 1, 1, 1, 1, 1,
1.240025, 0.09087519, 1.895039, 1, 1, 1, 1, 1,
1.240503, -2.003419, 3.454084, 1, 1, 1, 1, 1,
1.240649, -1.16172, 2.659491, 1, 1, 1, 1, 1,
1.242167, -0.9277116, 0.6885187, 1, 1, 1, 1, 1,
1.245637, 0.9783144, 0.01493321, 1, 1, 1, 1, 1,
1.265555, 0.3882644, 1.362391, 1, 1, 1, 1, 1,
1.267325, -0.5534768, 3.793357, 1, 1, 1, 1, 1,
1.267615, -1.158456, 2.780264, 0, 0, 1, 1, 1,
1.27371, 1.412775, 0.891846, 1, 0, 0, 1, 1,
1.294458, 0.8024583, 0.4494221, 1, 0, 0, 1, 1,
1.300351, -0.4560217, 2.32172, 1, 0, 0, 1, 1,
1.301986, -0.9398654, 1.100229, 1, 0, 0, 1, 1,
1.30479, -1.011223, 2.638118, 1, 0, 0, 1, 1,
1.311809, 1.146013, 3.070937, 0, 0, 0, 1, 1,
1.315635, 0.2478844, 0.4871962, 0, 0, 0, 1, 1,
1.316357, -0.5496339, 1.75429, 0, 0, 0, 1, 1,
1.327603, 0.4731345, 1.440126, 0, 0, 0, 1, 1,
1.328346, -0.009520463, 3.159603, 0, 0, 0, 1, 1,
1.338492, 1.455343, 0.1457785, 0, 0, 0, 1, 1,
1.340231, -0.3713687, 2.726372, 0, 0, 0, 1, 1,
1.353376, -1.136162, 2.091058, 1, 1, 1, 1, 1,
1.360918, 0.5658154, -1.713807, 1, 1, 1, 1, 1,
1.378915, -1.005767, 0.9534127, 1, 1, 1, 1, 1,
1.388251, -0.2891114, 2.251557, 1, 1, 1, 1, 1,
1.395565, 1.16258, 0.8788935, 1, 1, 1, 1, 1,
1.398818, 1.310082, 0.3380797, 1, 1, 1, 1, 1,
1.403196, 0.2853341, 3.47022, 1, 1, 1, 1, 1,
1.409439, -1.390571, 1.988496, 1, 1, 1, 1, 1,
1.423549, -0.8822727, 0.8685741, 1, 1, 1, 1, 1,
1.426303, -0.6320106, 1.927904, 1, 1, 1, 1, 1,
1.430284, -1.680959, 1.785606, 1, 1, 1, 1, 1,
1.433776, 0.7551719, 0.9073211, 1, 1, 1, 1, 1,
1.438338, 0.3521786, 1.059355, 1, 1, 1, 1, 1,
1.442699, -1.150586, 1.362098, 1, 1, 1, 1, 1,
1.454404, 0.6725878, 2.228616, 1, 1, 1, 1, 1,
1.455704, 1.351325, -0.3617146, 0, 0, 1, 1, 1,
1.45825, 0.3575979, 0.7402318, 1, 0, 0, 1, 1,
1.46659, -1.99591, 2.801447, 1, 0, 0, 1, 1,
1.473225, -0.4620046, 2.482152, 1, 0, 0, 1, 1,
1.48308, -0.5528969, 3.09971, 1, 0, 0, 1, 1,
1.489628, -0.1001643, 1.382165, 1, 0, 0, 1, 1,
1.518157, -0.5139707, 0.8547505, 0, 0, 0, 1, 1,
1.528308, -0.1132725, 2.951665, 0, 0, 0, 1, 1,
1.533476, 0.5749348, 0.7962248, 0, 0, 0, 1, 1,
1.533872, 0.3405826, 0.7108809, 0, 0, 0, 1, 1,
1.538471, 1.47711, -0.9650421, 0, 0, 0, 1, 1,
1.539897, 0.6592646, 1.977801, 0, 0, 0, 1, 1,
1.552349, 0.1858928, 0.934076, 0, 0, 0, 1, 1,
1.553915, -1.393733, 1.041099, 1, 1, 1, 1, 1,
1.559494, 1.096497, 1.434564, 1, 1, 1, 1, 1,
1.56316, 0.1788515, 1.230752, 1, 1, 1, 1, 1,
1.594584, 0.1540308, 0.3039231, 1, 1, 1, 1, 1,
1.614284, -0.1126428, 2.652492, 1, 1, 1, 1, 1,
1.64592, -1.234539, 3.104952, 1, 1, 1, 1, 1,
1.655177, -0.3584004, 3.181383, 1, 1, 1, 1, 1,
1.658273, -1.154463, 4.404586, 1, 1, 1, 1, 1,
1.693665, -0.5050667, 1.794853, 1, 1, 1, 1, 1,
1.695072, -0.008436672, 0.3083453, 1, 1, 1, 1, 1,
1.705962, -0.9414765, 0.5931462, 1, 1, 1, 1, 1,
1.714996, -0.8871104, 1.608974, 1, 1, 1, 1, 1,
1.720418, -1.319811, 3.539527, 1, 1, 1, 1, 1,
1.726698, -1.793622, 1.097995, 1, 1, 1, 1, 1,
1.733125, 0.4526621, 0.2137942, 1, 1, 1, 1, 1,
1.741432, -0.6640841, 2.435824, 0, 0, 1, 1, 1,
1.742682, -0.3749621, 2.299915, 1, 0, 0, 1, 1,
1.752031, -0.5632314, 2.545278, 1, 0, 0, 1, 1,
1.757517, 0.7588848, -0.1715675, 1, 0, 0, 1, 1,
1.761053, -0.5779358, -0.3060016, 1, 0, 0, 1, 1,
1.78596, 0.199928, 3.488278, 1, 0, 0, 1, 1,
1.795874, 0.8177894, -0.3208208, 0, 0, 0, 1, 1,
1.806826, -0.6892363, 3.996198, 0, 0, 0, 1, 1,
1.838663, -1.049273, 1.812057, 0, 0, 0, 1, 1,
1.844234, -0.1924726, 1.356656, 0, 0, 0, 1, 1,
1.848553, -0.3402675, 0.6291187, 0, 0, 0, 1, 1,
1.858385, -0.5019962, -0.03635233, 0, 0, 0, 1, 1,
1.874033, 0.6689598, -0.5441767, 0, 0, 0, 1, 1,
1.882429, -0.009826823, 1.616115, 1, 1, 1, 1, 1,
1.886073, -0.5647036, 2.677527, 1, 1, 1, 1, 1,
1.890222, -0.03001938, 0.3700306, 1, 1, 1, 1, 1,
1.92519, -1.194811, 2.463007, 1, 1, 1, 1, 1,
1.945978, 0.1011326, -0.175461, 1, 1, 1, 1, 1,
1.957186, -0.8008745, 1.673342, 1, 1, 1, 1, 1,
1.972912, -0.03314171, 1.06736, 1, 1, 1, 1, 1,
1.97948, -0.338197, 2.030059, 1, 1, 1, 1, 1,
2.000828, 1.165054, 2.237643, 1, 1, 1, 1, 1,
2.016972, 1.661673, 1.336221, 1, 1, 1, 1, 1,
2.026822, -0.622814, 2.195264, 1, 1, 1, 1, 1,
2.04393, 0.785669, 1.399497, 1, 1, 1, 1, 1,
2.046001, -0.9265527, 1.925745, 1, 1, 1, 1, 1,
2.061998, 0.6724818, 1.294781, 1, 1, 1, 1, 1,
2.067485, -2.097423, 2.652336, 1, 1, 1, 1, 1,
2.084766, -0.006547068, 1.744423, 0, 0, 1, 1, 1,
2.122052, -1.372495, 2.192881, 1, 0, 0, 1, 1,
2.134015, 0.02139571, 1.907648, 1, 0, 0, 1, 1,
2.146383, -0.2086217, 2.627849, 1, 0, 0, 1, 1,
2.199739, 0.554261, 1.943016, 1, 0, 0, 1, 1,
2.202937, -0.4817572, 1.788868, 1, 0, 0, 1, 1,
2.205545, -0.4833277, 2.07648, 0, 0, 0, 1, 1,
2.212029, -0.1976624, 1.833864, 0, 0, 0, 1, 1,
2.263586, 0.7907969, 0.1236501, 0, 0, 0, 1, 1,
2.292773, -1.149938, 5.238453, 0, 0, 0, 1, 1,
2.301843, -0.5377345, 0.9532692, 0, 0, 0, 1, 1,
2.368134, -0.5392617, -1.022426, 0, 0, 0, 1, 1,
2.392622, -0.04327531, 1.860883, 0, 0, 0, 1, 1,
2.431894, 0.04422404, 3.095761, 1, 1, 1, 1, 1,
2.451174, 0.3975674, 1.330042, 1, 1, 1, 1, 1,
2.464029, 0.5318817, 0.9059728, 1, 1, 1, 1, 1,
2.503501, -0.8735471, 0.5377491, 1, 1, 1, 1, 1,
2.876371, -1.282356, 1.833772, 1, 1, 1, 1, 1,
3.190508, 0.6205488, 0.9085305, 1, 1, 1, 1, 1,
3.540889, -0.4027669, 2.663296, 1, 1, 1, 1, 1
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
var radius = 9.734943;
var distance = 34.19357;
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
mvMatrix.translate( -0.02382135, 0.399688, -0.07944131 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19357);
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
