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
-2.634258, -1.530232, -4.304722, 1, 0, 0, 1,
-2.615484, -1.57274, -3.950395, 1, 0.007843138, 0, 1,
-2.496953, 0.5327561, -1.366946, 1, 0.01176471, 0, 1,
-2.395788, -1.26657, -0.9983756, 1, 0.01960784, 0, 1,
-2.360646, -0.3512635, -2.193167, 1, 0.02352941, 0, 1,
-2.251884, 0.8660628, -0.6818232, 1, 0.03137255, 0, 1,
-2.200942, -1.699484, -2.494614, 1, 0.03529412, 0, 1,
-2.197435, -0.8440127, -1.36574, 1, 0.04313726, 0, 1,
-2.192668, 0.4739375, -1.28528, 1, 0.04705882, 0, 1,
-2.163752, 0.4274532, -1.458417, 1, 0.05490196, 0, 1,
-2.160541, 0.9686794, -0.7890706, 1, 0.05882353, 0, 1,
-2.152968, 1.497246, -0.4555418, 1, 0.06666667, 0, 1,
-2.149609, -1.020617, -0.9417006, 1, 0.07058824, 0, 1,
-2.14886, 0.6253682, -1.728415, 1, 0.07843138, 0, 1,
-2.08574, 0.4413335, -1.227946, 1, 0.08235294, 0, 1,
-2.029807, 0.3746064, -0.775387, 1, 0.09019608, 0, 1,
-2.012303, -0.01353007, -2.159108, 1, 0.09411765, 0, 1,
-2.001165, 1.369306, -3.783377, 1, 0.1019608, 0, 1,
-1.988515, 0.555106, -2.082529, 1, 0.1098039, 0, 1,
-1.981127, 0.8036253, -1.173819, 1, 0.1137255, 0, 1,
-1.950973, -0.1074607, -3.151162, 1, 0.1215686, 0, 1,
-1.933584, -0.497235, -1.971331, 1, 0.1254902, 0, 1,
-1.91769, 0.7531697, -1.4599, 1, 0.1333333, 0, 1,
-1.917202, -0.0227743, -2.837591, 1, 0.1372549, 0, 1,
-1.915134, -0.4916174, -3.393481, 1, 0.145098, 0, 1,
-1.908563, -1.041135, -1.654529, 1, 0.1490196, 0, 1,
-1.90467, 1.188935, -0.05617019, 1, 0.1568628, 0, 1,
-1.90111, 1.330701, -0.1422235, 1, 0.1607843, 0, 1,
-1.898764, 0.561366, -1.435231, 1, 0.1686275, 0, 1,
-1.894803, 0.154241, -2.768107, 1, 0.172549, 0, 1,
-1.88614, -0.5548815, -1.871014, 1, 0.1803922, 0, 1,
-1.859308, 0.441602, 0.03878676, 1, 0.1843137, 0, 1,
-1.84042, 1.413974, -2.217033, 1, 0.1921569, 0, 1,
-1.828792, 0.3412266, -1.551383, 1, 0.1960784, 0, 1,
-1.824247, 1.058523, -1.362793, 1, 0.2039216, 0, 1,
-1.819416, 0.5093296, -1.475796, 1, 0.2117647, 0, 1,
-1.817939, 0.4486428, -1.938882, 1, 0.2156863, 0, 1,
-1.813999, 0.1758329, -2.308534, 1, 0.2235294, 0, 1,
-1.808613, -0.3619219, -0.7897336, 1, 0.227451, 0, 1,
-1.799668, -0.7292445, -0.8893303, 1, 0.2352941, 0, 1,
-1.780973, 1.373718, -1.752593, 1, 0.2392157, 0, 1,
-1.775009, -1.406105, -0.4819357, 1, 0.2470588, 0, 1,
-1.760416, 0.1425767, -0.5122118, 1, 0.2509804, 0, 1,
-1.757676, 1.309218, -1.169845, 1, 0.2588235, 0, 1,
-1.74717, 0.9908225, 0.8165045, 1, 0.2627451, 0, 1,
-1.744542, -0.6964869, -2.984956, 1, 0.2705882, 0, 1,
-1.740159, 0.5907176, -1.794822, 1, 0.2745098, 0, 1,
-1.718547, -1.695249, -2.173925, 1, 0.282353, 0, 1,
-1.699582, 0.1152771, -3.942841, 1, 0.2862745, 0, 1,
-1.6859, -0.5835218, -0.8531883, 1, 0.2941177, 0, 1,
-1.670459, -0.04620866, -0.9026115, 1, 0.3019608, 0, 1,
-1.66601, 0.443884, -1.178463, 1, 0.3058824, 0, 1,
-1.657995, -0.3998868, -2.603558, 1, 0.3137255, 0, 1,
-1.636825, -0.6177649, -2.463724, 1, 0.3176471, 0, 1,
-1.63301, 0.2200284, -2.695878, 1, 0.3254902, 0, 1,
-1.628902, -1.812567, -2.344947, 1, 0.3294118, 0, 1,
-1.621579, 0.4112035, -1.248427, 1, 0.3372549, 0, 1,
-1.610394, 1.486779, -2.586063, 1, 0.3411765, 0, 1,
-1.609327, -0.2397797, -2.087539, 1, 0.3490196, 0, 1,
-1.603837, -0.2161783, -2.235964, 1, 0.3529412, 0, 1,
-1.601958, 0.1778082, -0.7135131, 1, 0.3607843, 0, 1,
-1.599341, 1.073315, -0.3951549, 1, 0.3647059, 0, 1,
-1.570619, -0.4568711, -1.963048, 1, 0.372549, 0, 1,
-1.559468, -1.237731, -3.288186, 1, 0.3764706, 0, 1,
-1.550169, -0.9449437, -3.084465, 1, 0.3843137, 0, 1,
-1.548049, -1.368296, -2.080163, 1, 0.3882353, 0, 1,
-1.534682, 0.2208404, -3.319371, 1, 0.3960784, 0, 1,
-1.520267, -0.4406333, -1.962008, 1, 0.4039216, 0, 1,
-1.498874, -0.5485301, -0.6636435, 1, 0.4078431, 0, 1,
-1.483548, -1.673897, -0.8990011, 1, 0.4156863, 0, 1,
-1.474198, -0.438757, -1.479108, 1, 0.4196078, 0, 1,
-1.472045, 0.6860113, -2.982731, 1, 0.427451, 0, 1,
-1.470314, -1.655535, -2.306035, 1, 0.4313726, 0, 1,
-1.465423, -0.5801978, -1.793274, 1, 0.4392157, 0, 1,
-1.464195, 0.5834922, -0.2631824, 1, 0.4431373, 0, 1,
-1.446815, -1.2657, -2.197141, 1, 0.4509804, 0, 1,
-1.446708, 0.1914239, -0.928144, 1, 0.454902, 0, 1,
-1.445843, 0.5236493, -1.025306, 1, 0.4627451, 0, 1,
-1.442276, 0.9947776, -1.75413, 1, 0.4666667, 0, 1,
-1.440646, -1.17402, -2.370543, 1, 0.4745098, 0, 1,
-1.439051, -1.226671, -3.705381, 1, 0.4784314, 0, 1,
-1.437719, -1.229991, -1.172719, 1, 0.4862745, 0, 1,
-1.429424, 0.2300287, -0.5217014, 1, 0.4901961, 0, 1,
-1.425316, 1.11852, 0.2982602, 1, 0.4980392, 0, 1,
-1.414778, 0.8213521, -0.6208761, 1, 0.5058824, 0, 1,
-1.413761, 0.6008923, -2.232073, 1, 0.509804, 0, 1,
-1.410844, -0.5900436, -0.4007679, 1, 0.5176471, 0, 1,
-1.410427, 1.200975, -1.379272, 1, 0.5215687, 0, 1,
-1.410414, -0.1723798, -1.882702, 1, 0.5294118, 0, 1,
-1.406294, -0.8474541, -0.6238739, 1, 0.5333334, 0, 1,
-1.391509, 0.749969, -1.586626, 1, 0.5411765, 0, 1,
-1.390541, 0.948199, -0.9667682, 1, 0.5450981, 0, 1,
-1.381765, 1.309624, -0.4512088, 1, 0.5529412, 0, 1,
-1.376004, 0.2108511, -1.055632, 1, 0.5568628, 0, 1,
-1.359141, 0.2680894, -3.113934, 1, 0.5647059, 0, 1,
-1.358913, 0.0516897, -0.9643455, 1, 0.5686275, 0, 1,
-1.35844, 0.5556369, -1.95492, 1, 0.5764706, 0, 1,
-1.338589, 0.4369746, -2.853408, 1, 0.5803922, 0, 1,
-1.334212, 0.9033947, -0.8087334, 1, 0.5882353, 0, 1,
-1.308604, 1.01158, -0.1562149, 1, 0.5921569, 0, 1,
-1.303708, 1.222423, 0.3419752, 1, 0.6, 0, 1,
-1.293206, 0.6258904, -2.608675, 1, 0.6078432, 0, 1,
-1.292279, 0.1188916, 0.656546, 1, 0.6117647, 0, 1,
-1.292164, 0.6291195, -0.8402857, 1, 0.6196079, 0, 1,
-1.290089, -0.3174445, -2.233941, 1, 0.6235294, 0, 1,
-1.276719, -1.862023, -3.791904, 1, 0.6313726, 0, 1,
-1.275242, 0.6299652, -0.5655861, 1, 0.6352941, 0, 1,
-1.273712, -0.8132027, -2.189042, 1, 0.6431373, 0, 1,
-1.267753, 3.383745, -0.1727998, 1, 0.6470588, 0, 1,
-1.257203, 0.2328518, -0.4196939, 1, 0.654902, 0, 1,
-1.253227, 0.1088663, -0.7969841, 1, 0.6588235, 0, 1,
-1.246266, -0.6412044, -2.605712, 1, 0.6666667, 0, 1,
-1.238247, 1.73884, -1.622227, 1, 0.6705883, 0, 1,
-1.234296, 0.9630841, -3.12397, 1, 0.6784314, 0, 1,
-1.209195, -0.4669647, -1.405014, 1, 0.682353, 0, 1,
-1.204563, 2.274267, -0.6591451, 1, 0.6901961, 0, 1,
-1.20434, 0.747994, 0.4974389, 1, 0.6941177, 0, 1,
-1.199047, -0.1014534, -3.894579, 1, 0.7019608, 0, 1,
-1.198013, -0.03773369, -2.35044, 1, 0.7098039, 0, 1,
-1.188676, 1.080197, 0.6310025, 1, 0.7137255, 0, 1,
-1.187366, 0.412862, -2.148207, 1, 0.7215686, 0, 1,
-1.181483, -2.156347, -2.455789, 1, 0.7254902, 0, 1,
-1.179521, -1.473431, -3.126419, 1, 0.7333333, 0, 1,
-1.17403, 0.1104198, -1.972669, 1, 0.7372549, 0, 1,
-1.172413, -0.9226098, -2.551572, 1, 0.7450981, 0, 1,
-1.171033, -0.01956543, -2.754974, 1, 0.7490196, 0, 1,
-1.166369, 1.171474, -0.1063771, 1, 0.7568628, 0, 1,
-1.161842, 0.5849488, -0.2648839, 1, 0.7607843, 0, 1,
-1.15728, -1.204752, -3.867165, 1, 0.7686275, 0, 1,
-1.149005, 0.05748775, -1.653116, 1, 0.772549, 0, 1,
-1.148734, 0.4337515, 0.2007909, 1, 0.7803922, 0, 1,
-1.145703, -0.1541446, -0.4171446, 1, 0.7843137, 0, 1,
-1.134998, -1.324177, -3.0499, 1, 0.7921569, 0, 1,
-1.133338, -0.4334599, -2.018307, 1, 0.7960784, 0, 1,
-1.12635, -0.1392917, -0.7790542, 1, 0.8039216, 0, 1,
-1.116243, 1.307053, -0.6321675, 1, 0.8117647, 0, 1,
-1.115805, -2.784953, -4.318921, 1, 0.8156863, 0, 1,
-1.111502, 0.6355582, -1.415047, 1, 0.8235294, 0, 1,
-1.100644, -0.2321354, -3.275259, 1, 0.827451, 0, 1,
-1.098121, -0.8546582, -2.524099, 1, 0.8352941, 0, 1,
-1.088434, 0.4030911, 0.4363844, 1, 0.8392157, 0, 1,
-1.088365, -1.249482, -2.216922, 1, 0.8470588, 0, 1,
-1.08823, -1.017215, -2.518036, 1, 0.8509804, 0, 1,
-1.085223, 0.400831, -1.360603, 1, 0.8588235, 0, 1,
-1.083186, -0.1948373, -0.5658991, 1, 0.8627451, 0, 1,
-1.077291, -0.979049, -1.06622, 1, 0.8705882, 0, 1,
-1.075628, -1.665552, -0.691833, 1, 0.8745098, 0, 1,
-1.074451, 0.0406985, 0.3012922, 1, 0.8823529, 0, 1,
-1.072983, 0.9206946, -0.1200025, 1, 0.8862745, 0, 1,
-1.067459, -0.2591967, -2.379474, 1, 0.8941177, 0, 1,
-1.062655, -0.405951, -1.5004, 1, 0.8980392, 0, 1,
-1.054225, -1.582753, -2.213467, 1, 0.9058824, 0, 1,
-1.054103, -0.1907751, -0.33436, 1, 0.9137255, 0, 1,
-1.0429, 1.245384, -2.278647, 1, 0.9176471, 0, 1,
-1.042659, -0.1970306, -1.891386, 1, 0.9254902, 0, 1,
-1.036741, -1.501511, -3.079368, 1, 0.9294118, 0, 1,
-1.035116, 0.3507318, -1.087977, 1, 0.9372549, 0, 1,
-1.03218, 0.3829221, -3.043575, 1, 0.9411765, 0, 1,
-1.031446, -2.531715, -2.561767, 1, 0.9490196, 0, 1,
-1.020522, 0.4297793, -0.3373844, 1, 0.9529412, 0, 1,
-1.017154, -0.1098838, -1.64473, 1, 0.9607843, 0, 1,
-1.015423, -1.377076, -3.074499, 1, 0.9647059, 0, 1,
-1.005124, 0.3269012, -0.6318001, 1, 0.972549, 0, 1,
-1.00206, 0.2763098, -0.3044789, 1, 0.9764706, 0, 1,
-1.000464, 1.327331, -0.6315364, 1, 0.9843137, 0, 1,
-0.998569, 1.5323, 0.318464, 1, 0.9882353, 0, 1,
-0.9984917, -0.9354343, -3.801189, 1, 0.9960784, 0, 1,
-0.9927429, -0.9369269, -3.106027, 0.9960784, 1, 0, 1,
-0.989121, 1.174365, -1.768005, 0.9921569, 1, 0, 1,
-0.9867541, -1.623783, -3.229785, 0.9843137, 1, 0, 1,
-0.9857991, -0.6446967, -1.708402, 0.9803922, 1, 0, 1,
-0.9843199, 2.065421, -1.49746, 0.972549, 1, 0, 1,
-0.9779656, 0.001233785, -0.5552184, 0.9686275, 1, 0, 1,
-0.9736291, -0.7369836, -1.45382, 0.9607843, 1, 0, 1,
-0.9729638, 0.1029976, -1.015759, 0.9568627, 1, 0, 1,
-0.9636518, -0.09386472, -1.697917, 0.9490196, 1, 0, 1,
-0.9510348, 0.5876521, -0.1917945, 0.945098, 1, 0, 1,
-0.945599, -0.5401466, -3.652176, 0.9372549, 1, 0, 1,
-0.9342217, -1.281737, -2.788777, 0.9333333, 1, 0, 1,
-0.9289672, -0.1843611, -4.184851, 0.9254902, 1, 0, 1,
-0.9209042, 0.1524645, -1.913479, 0.9215686, 1, 0, 1,
-0.9084466, -1.612435, -3.921488, 0.9137255, 1, 0, 1,
-0.9070305, -1.340827, -2.520288, 0.9098039, 1, 0, 1,
-0.9023747, 1.239639, -0.9453471, 0.9019608, 1, 0, 1,
-0.8935413, 1.91204, -1.144329, 0.8941177, 1, 0, 1,
-0.8933516, -0.7672121, -1.788339, 0.8901961, 1, 0, 1,
-0.8924314, 0.02447449, -0.824424, 0.8823529, 1, 0, 1,
-0.8905588, 0.1007484, -2.651592, 0.8784314, 1, 0, 1,
-0.88942, 0.04015249, -4.306168, 0.8705882, 1, 0, 1,
-0.8854598, 0.1111473, -0.7648947, 0.8666667, 1, 0, 1,
-0.8848371, -0.3861307, -2.039392, 0.8588235, 1, 0, 1,
-0.8830169, 0.8142913, -1.258157, 0.854902, 1, 0, 1,
-0.8800211, 0.06423699, -1.810559, 0.8470588, 1, 0, 1,
-0.8767048, -0.9134024, -1.421838, 0.8431373, 1, 0, 1,
-0.8756319, 0.970486, -0.4629227, 0.8352941, 1, 0, 1,
-0.8747833, -0.2262306, -2.411949, 0.8313726, 1, 0, 1,
-0.8719141, 1.110738, 0.6082309, 0.8235294, 1, 0, 1,
-0.8712511, 0.4957474, -0.66722, 0.8196079, 1, 0, 1,
-0.8659657, 0.230837, -0.5161844, 0.8117647, 1, 0, 1,
-0.8654982, -0.02623383, -1.263991, 0.8078431, 1, 0, 1,
-0.8647187, 0.919073, -0.323076, 0.8, 1, 0, 1,
-0.8621044, -0.1617499, -1.183455, 0.7921569, 1, 0, 1,
-0.8594702, -0.8516004, -1.163378, 0.7882353, 1, 0, 1,
-0.8574593, -1.095553, -4.142386, 0.7803922, 1, 0, 1,
-0.854241, -0.5194643, -2.498093, 0.7764706, 1, 0, 1,
-0.8445652, -0.8990017, -1.372192, 0.7686275, 1, 0, 1,
-0.8412592, 1.219333, 0.1743436, 0.7647059, 1, 0, 1,
-0.8396623, -0.8375401, -2.059183, 0.7568628, 1, 0, 1,
-0.8371441, -0.2912199, -0.07761256, 0.7529412, 1, 0, 1,
-0.8320956, 0.0434895, -1.135809, 0.7450981, 1, 0, 1,
-0.8320383, 0.6767475, -1.379677, 0.7411765, 1, 0, 1,
-0.8312029, 2.014629, -0.1119422, 0.7333333, 1, 0, 1,
-0.8213721, 0.9699203, -0.8684962, 0.7294118, 1, 0, 1,
-0.8181071, 0.4055299, -1.292128, 0.7215686, 1, 0, 1,
-0.8166922, -0.1472037, -1.462561, 0.7176471, 1, 0, 1,
-0.8135229, -0.2949963, 0.07930432, 0.7098039, 1, 0, 1,
-0.8123322, 0.4954488, -0.5455654, 0.7058824, 1, 0, 1,
-0.8089647, 0.2771005, -2.058539, 0.6980392, 1, 0, 1,
-0.8071939, -1.107135, -1.728121, 0.6901961, 1, 0, 1,
-0.8017799, -0.1008004, -2.763018, 0.6862745, 1, 0, 1,
-0.7923377, 1.227232, -1.236317, 0.6784314, 1, 0, 1,
-0.7906238, 1.52247, 0.7758151, 0.6745098, 1, 0, 1,
-0.7890166, -1.976802, -3.627701, 0.6666667, 1, 0, 1,
-0.7850915, -0.6916199, -3.650656, 0.6627451, 1, 0, 1,
-0.7832199, -0.06231904, -2.066412, 0.654902, 1, 0, 1,
-0.7696849, -0.5984534, -0.6667343, 0.6509804, 1, 0, 1,
-0.7658935, -0.3181407, -2.623657, 0.6431373, 1, 0, 1,
-0.7508066, 0.03790157, -0.3794841, 0.6392157, 1, 0, 1,
-0.7488917, -0.8592644, -3.571141, 0.6313726, 1, 0, 1,
-0.7473571, -0.2050768, -1.94506, 0.627451, 1, 0, 1,
-0.7418712, -0.282643, -2.156835, 0.6196079, 1, 0, 1,
-0.7388237, 0.4746979, -0.6684859, 0.6156863, 1, 0, 1,
-0.7342486, -1.082528, -4.394122, 0.6078432, 1, 0, 1,
-0.734208, -1.453485, -1.171216, 0.6039216, 1, 0, 1,
-0.7223942, 0.4671915, -0.1001933, 0.5960785, 1, 0, 1,
-0.7212153, -0.36574, -2.990712, 0.5882353, 1, 0, 1,
-0.718906, -1.37749, -3.717613, 0.5843138, 1, 0, 1,
-0.7104542, -0.983399, -2.420472, 0.5764706, 1, 0, 1,
-0.7079665, 0.2680139, -1.147231, 0.572549, 1, 0, 1,
-0.7077672, -1.641391, -4.008273, 0.5647059, 1, 0, 1,
-0.7027867, 1.077962, -0.9996915, 0.5607843, 1, 0, 1,
-0.6995742, -0.8208644, -1.324505, 0.5529412, 1, 0, 1,
-0.698956, -0.4814082, -1.167018, 0.5490196, 1, 0, 1,
-0.6987439, -2.582909, -1.511564, 0.5411765, 1, 0, 1,
-0.6969599, -0.6911082, -1.368494, 0.5372549, 1, 0, 1,
-0.6946977, -0.3091139, -0.4838513, 0.5294118, 1, 0, 1,
-0.6934907, 0.3493545, -0.6002471, 0.5254902, 1, 0, 1,
-0.692606, 0.1387117, 0.0600976, 0.5176471, 1, 0, 1,
-0.6925299, 0.5475763, 0.2448286, 0.5137255, 1, 0, 1,
-0.6922123, 0.186444, -1.742046, 0.5058824, 1, 0, 1,
-0.6916484, 1.053195, -0.2496471, 0.5019608, 1, 0, 1,
-0.6909051, 0.03161312, -0.9364883, 0.4941176, 1, 0, 1,
-0.6905357, -1.891274, -2.570869, 0.4862745, 1, 0, 1,
-0.6870795, 0.2044588, -1.510094, 0.4823529, 1, 0, 1,
-0.6870016, -1.002991, -3.522161, 0.4745098, 1, 0, 1,
-0.6803777, -1.351063, -3.64892, 0.4705882, 1, 0, 1,
-0.6746488, 0.7867109, 0.6242329, 0.4627451, 1, 0, 1,
-0.6698591, 1.330683, 0.1438756, 0.4588235, 1, 0, 1,
-0.668854, 1.134564, -0.7482057, 0.4509804, 1, 0, 1,
-0.6687461, 0.5093377, 0.0212877, 0.4470588, 1, 0, 1,
-0.6607683, 0.1723154, -0.5252909, 0.4392157, 1, 0, 1,
-0.6529015, 1.197203, -0.4004665, 0.4352941, 1, 0, 1,
-0.6510924, 0.7642163, 0.4103981, 0.427451, 1, 0, 1,
-0.648005, 0.2818838, -2.704195, 0.4235294, 1, 0, 1,
-0.6472771, -1.465698, -3.030062, 0.4156863, 1, 0, 1,
-0.6464821, 1.990525, -1.281006, 0.4117647, 1, 0, 1,
-0.6460524, 0.2244259, 0.2216181, 0.4039216, 1, 0, 1,
-0.6459942, 1.812593, -0.2403733, 0.3960784, 1, 0, 1,
-0.6413706, -0.8697245, -3.83476, 0.3921569, 1, 0, 1,
-0.6402016, -1.428642, -2.661019, 0.3843137, 1, 0, 1,
-0.6396594, 0.03702836, -0.3516392, 0.3803922, 1, 0, 1,
-0.6384274, -0.5543692, -2.574064, 0.372549, 1, 0, 1,
-0.637499, 1.826038, 1.051402, 0.3686275, 1, 0, 1,
-0.6373959, -1.389167, -2.268628, 0.3607843, 1, 0, 1,
-0.6373704, -1.754099, -3.979318, 0.3568628, 1, 0, 1,
-0.6363465, -0.9726894, -1.015439, 0.3490196, 1, 0, 1,
-0.635488, 1.961923, -0.05231215, 0.345098, 1, 0, 1,
-0.6285165, 1.441875, -1.667065, 0.3372549, 1, 0, 1,
-0.6270545, -1.81596, -3.519098, 0.3333333, 1, 0, 1,
-0.6268883, -1.179246, -3.51486, 0.3254902, 1, 0, 1,
-0.6208338, -0.9554943, -2.089928, 0.3215686, 1, 0, 1,
-0.614989, 1.389165, 0.4454396, 0.3137255, 1, 0, 1,
-0.6138241, 1.267147, -1.437856, 0.3098039, 1, 0, 1,
-0.6135491, -0.5308782, -3.132942, 0.3019608, 1, 0, 1,
-0.6086159, 0.3908645, -0.8361273, 0.2941177, 1, 0, 1,
-0.6043233, -1.254426, -1.299997, 0.2901961, 1, 0, 1,
-0.6000496, 1.073556, 0.3311632, 0.282353, 1, 0, 1,
-0.5997221, 1.20498, -1.38079, 0.2784314, 1, 0, 1,
-0.5984214, -0.5247231, -3.91346, 0.2705882, 1, 0, 1,
-0.5983104, -0.5409525, -2.077457, 0.2666667, 1, 0, 1,
-0.5916646, -1.090284, -1.649582, 0.2588235, 1, 0, 1,
-0.5908077, -0.6003096, -2.456731, 0.254902, 1, 0, 1,
-0.5905288, -0.3185143, -1.679411, 0.2470588, 1, 0, 1,
-0.5874524, 0.719823, 0.1689598, 0.2431373, 1, 0, 1,
-0.5863079, 1.300226, -0.6041396, 0.2352941, 1, 0, 1,
-0.5856809, -0.2302311, -2.063118, 0.2313726, 1, 0, 1,
-0.5853996, -0.7949995, -2.59208, 0.2235294, 1, 0, 1,
-0.5800698, -1.501696, -2.517868, 0.2196078, 1, 0, 1,
-0.5750144, -1.067347, -2.29495, 0.2117647, 1, 0, 1,
-0.5746358, 0.1467758, -0.7050623, 0.2078431, 1, 0, 1,
-0.5740176, 0.3215367, 0.2462655, 0.2, 1, 0, 1,
-0.566537, 0.4920544, -1.119424, 0.1921569, 1, 0, 1,
-0.5608021, -2.057259, -2.721027, 0.1882353, 1, 0, 1,
-0.5592414, -1.026542, -3.317248, 0.1803922, 1, 0, 1,
-0.5574793, -0.472601, -1.558624, 0.1764706, 1, 0, 1,
-0.5567131, -0.4071125, -2.15764, 0.1686275, 1, 0, 1,
-0.5558331, -0.6356831, -2.735146, 0.1647059, 1, 0, 1,
-0.5556269, -0.2242822, -1.330546, 0.1568628, 1, 0, 1,
-0.5526077, -0.2136863, -3.17409, 0.1529412, 1, 0, 1,
-0.5506688, -0.188415, -1.936036, 0.145098, 1, 0, 1,
-0.5464466, 0.6554322, -0.5402675, 0.1411765, 1, 0, 1,
-0.545006, -0.4811656, -2.837082, 0.1333333, 1, 0, 1,
-0.5408967, 1.03382, -0.9211572, 0.1294118, 1, 0, 1,
-0.5385005, -0.5521774, -3.036625, 0.1215686, 1, 0, 1,
-0.5369556, 0.2349247, -1.152308, 0.1176471, 1, 0, 1,
-0.5365788, -1.080498, -2.475327, 0.1098039, 1, 0, 1,
-0.5335839, -0.1705392, -0.3854734, 0.1058824, 1, 0, 1,
-0.532805, 1.343431, -0.7658362, 0.09803922, 1, 0, 1,
-0.532722, 0.01266759, 1.24684, 0.09019608, 1, 0, 1,
-0.5313386, -1.877344, -1.510456, 0.08627451, 1, 0, 1,
-0.5307194, 2.041428, -0.8497702, 0.07843138, 1, 0, 1,
-0.5296189, -0.9587825, -2.204574, 0.07450981, 1, 0, 1,
-0.5260473, 1.165518, -1.196817, 0.06666667, 1, 0, 1,
-0.5253876, -1.449496, -3.469691, 0.0627451, 1, 0, 1,
-0.5232142, -0.08097861, -3.148953, 0.05490196, 1, 0, 1,
-0.5199466, -1.075045, -1.067646, 0.05098039, 1, 0, 1,
-0.5115249, 1.521598, -3.206408, 0.04313726, 1, 0, 1,
-0.5091161, -0.2321664, -1.642468, 0.03921569, 1, 0, 1,
-0.5070126, 0.4721151, -1.493869, 0.03137255, 1, 0, 1,
-0.5041997, 1.350644, -0.0731814, 0.02745098, 1, 0, 1,
-0.5010535, 1.03303, 0.4544043, 0.01960784, 1, 0, 1,
-0.4996781, -0.2392867, -2.154076, 0.01568628, 1, 0, 1,
-0.4990465, -1.709817, -1.427255, 0.007843138, 1, 0, 1,
-0.4955919, 2.08129, -0.1355987, 0.003921569, 1, 0, 1,
-0.4950484, -0.1500924, -3.925186, 0, 1, 0.003921569, 1,
-0.4871933, 1.570413, 0.2496937, 0, 1, 0.01176471, 1,
-0.4817572, 2.778447, 0.9926907, 0, 1, 0.01568628, 1,
-0.4805422, 0.2767664, -1.854304, 0, 1, 0.02352941, 1,
-0.4797355, 0.05604162, -1.430032, 0, 1, 0.02745098, 1,
-0.4731092, -0.600098, -3.309675, 0, 1, 0.03529412, 1,
-0.4661596, -0.5030493, -1.529948, 0, 1, 0.03921569, 1,
-0.4645278, -1.160096, -3.502617, 0, 1, 0.04705882, 1,
-0.4630296, 1.257892, -1.86985, 0, 1, 0.05098039, 1,
-0.4611777, -1.513327, -3.220472, 0, 1, 0.05882353, 1,
-0.4596292, 0.6179677, -0.2305745, 0, 1, 0.0627451, 1,
-0.4575681, 0.06593204, -2.180085, 0, 1, 0.07058824, 1,
-0.457062, 0.7028243, -0.1014685, 0, 1, 0.07450981, 1,
-0.4498988, 1.006401, 0.5755339, 0, 1, 0.08235294, 1,
-0.447838, 0.5063059, -0.5477954, 0, 1, 0.08627451, 1,
-0.4466399, 0.665554, -0.5127389, 0, 1, 0.09411765, 1,
-0.4407967, 0.5447837, -0.8091307, 0, 1, 0.1019608, 1,
-0.4391471, 0.183152, -1.467971, 0, 1, 0.1058824, 1,
-0.4291428, -2.790253, -3.652036, 0, 1, 0.1137255, 1,
-0.4248271, -1.586636, -1.53823, 0, 1, 0.1176471, 1,
-0.4247629, -1.064728, -2.580903, 0, 1, 0.1254902, 1,
-0.4238186, 0.587982, -1.572645, 0, 1, 0.1294118, 1,
-0.4219401, -0.03738027, -2.915932, 0, 1, 0.1372549, 1,
-0.4182023, 1.638222, 0.6573017, 0, 1, 0.1411765, 1,
-0.4157836, -0.004968003, -1.746255, 0, 1, 0.1490196, 1,
-0.4132862, 0.1614582, -0.6710533, 0, 1, 0.1529412, 1,
-0.4118412, -0.4113297, -2.701695, 0, 1, 0.1607843, 1,
-0.4090347, 0.9215241, 0.3453046, 0, 1, 0.1647059, 1,
-0.4080083, 1.285684, -0.4306477, 0, 1, 0.172549, 1,
-0.4040248, -0.6660526, -3.714225, 0, 1, 0.1764706, 1,
-0.4033336, -0.4785352, -0.9558048, 0, 1, 0.1843137, 1,
-0.3934551, 1.811972, -2.790399, 0, 1, 0.1882353, 1,
-0.3901728, -0.283829, -2.382666, 0, 1, 0.1960784, 1,
-0.3878408, 0.7470392, 0.9908043, 0, 1, 0.2039216, 1,
-0.3855836, -1.139948, -2.764751, 0, 1, 0.2078431, 1,
-0.3843344, 1.085415, 1.070168, 0, 1, 0.2156863, 1,
-0.3809935, 0.1611697, -2.456296, 0, 1, 0.2196078, 1,
-0.3797417, -0.009436782, -1.458819, 0, 1, 0.227451, 1,
-0.3777537, 0.4145501, 0.09890477, 0, 1, 0.2313726, 1,
-0.3773713, 0.559217, -2.018122, 0, 1, 0.2392157, 1,
-0.3773362, -0.4806449, -2.968828, 0, 1, 0.2431373, 1,
-0.3769507, 0.9324056, -1.678158, 0, 1, 0.2509804, 1,
-0.373415, -1.032338, -1.959951, 0, 1, 0.254902, 1,
-0.3687975, -2.517476, -1.908889, 0, 1, 0.2627451, 1,
-0.3679687, 1.397078, -1.683563, 0, 1, 0.2666667, 1,
-0.3675983, 0.4191474, -1.827686, 0, 1, 0.2745098, 1,
-0.365147, 0.3110486, -0.2908294, 0, 1, 0.2784314, 1,
-0.3640167, 1.127258, -1.662972, 0, 1, 0.2862745, 1,
-0.3627894, -1.685915, -4.169177, 0, 1, 0.2901961, 1,
-0.3607803, -0.8806097, -1.038824, 0, 1, 0.2980392, 1,
-0.3543567, -2.654296, -3.35222, 0, 1, 0.3058824, 1,
-0.3504091, 0.6249127, -0.1950915, 0, 1, 0.3098039, 1,
-0.3488316, -0.6334627, -2.403806, 0, 1, 0.3176471, 1,
-0.344863, 0.01779794, -2.613869, 0, 1, 0.3215686, 1,
-0.3438219, -0.706195, -2.497239, 0, 1, 0.3294118, 1,
-0.3426525, -0.2784129, -4.082831, 0, 1, 0.3333333, 1,
-0.3363428, -0.6081282, -3.229266, 0, 1, 0.3411765, 1,
-0.3355653, -0.2859535, -2.534068, 0, 1, 0.345098, 1,
-0.3349776, 1.070649, -1.385324, 0, 1, 0.3529412, 1,
-0.3341519, -0.1870487, -2.118085, 0, 1, 0.3568628, 1,
-0.3326422, 0.3776629, -0.6794898, 0, 1, 0.3647059, 1,
-0.326803, -0.9952767, -2.19989, 0, 1, 0.3686275, 1,
-0.325628, -0.3529855, -2.176729, 0, 1, 0.3764706, 1,
-0.3250109, 0.466928, 0.2343782, 0, 1, 0.3803922, 1,
-0.3224106, 0.4070928, -0.4035031, 0, 1, 0.3882353, 1,
-0.3176562, 0.2934165, -1.268181, 0, 1, 0.3921569, 1,
-0.3171923, -0.4924591, -0.5876059, 0, 1, 0.4, 1,
-0.3155276, -0.5842373, -3.474445, 0, 1, 0.4078431, 1,
-0.3145494, -0.07775598, -2.073233, 0, 1, 0.4117647, 1,
-0.3138091, 0.3336905, -0.4760994, 0, 1, 0.4196078, 1,
-0.3124853, -0.06971519, -2.413003, 0, 1, 0.4235294, 1,
-0.309887, -0.5201818, -1.966686, 0, 1, 0.4313726, 1,
-0.3090543, -0.8739316, -2.660394, 0, 1, 0.4352941, 1,
-0.3079896, -0.1384907, -2.918825, 0, 1, 0.4431373, 1,
-0.306981, 0.6562722, -0.4929872, 0, 1, 0.4470588, 1,
-0.3042887, 0.7694609, -2.11345, 0, 1, 0.454902, 1,
-0.3022928, 0.1180719, 0.1493444, 0, 1, 0.4588235, 1,
-0.3000996, -0.5069434, -0.8527509, 0, 1, 0.4666667, 1,
-0.2996078, -0.2536791, -3.509799, 0, 1, 0.4705882, 1,
-0.2981452, 0.2518323, -2.41719, 0, 1, 0.4784314, 1,
-0.293594, 0.946534, 1.489413, 0, 1, 0.4823529, 1,
-0.2920093, 0.6933054, -0.6932998, 0, 1, 0.4901961, 1,
-0.2852085, -0.6008312, -0.8017051, 0, 1, 0.4941176, 1,
-0.2849908, 0.9712051, 0.7007577, 0, 1, 0.5019608, 1,
-0.2840776, 1.275612, -0.7870473, 0, 1, 0.509804, 1,
-0.2801584, 0.7149575, 0.3927237, 0, 1, 0.5137255, 1,
-0.2797179, 0.6313616, -0.09306271, 0, 1, 0.5215687, 1,
-0.275795, 1.749162, 0.02661926, 0, 1, 0.5254902, 1,
-0.270641, -0.4898598, -1.895831, 0, 1, 0.5333334, 1,
-0.2698664, 1.250504, -0.6499077, 0, 1, 0.5372549, 1,
-0.2657654, -0.9944532, -3.705428, 0, 1, 0.5450981, 1,
-0.2648506, -2.534614, -2.492811, 0, 1, 0.5490196, 1,
-0.2636023, -1.001379, -2.639507, 0, 1, 0.5568628, 1,
-0.257476, -1.550514, -2.161607, 0, 1, 0.5607843, 1,
-0.2462737, 0.1050956, -0.6203634, 0, 1, 0.5686275, 1,
-0.2434773, 0.2903461, -0.7128788, 0, 1, 0.572549, 1,
-0.2434765, -0.8689163, -4.769105, 0, 1, 0.5803922, 1,
-0.2429018, 1.035167, 0.1835647, 0, 1, 0.5843138, 1,
-0.2426339, -1.332298, -4.057889, 0, 1, 0.5921569, 1,
-0.2405805, 0.1128902, -2.63633, 0, 1, 0.5960785, 1,
-0.2393136, -0.1498445, 0.08111118, 0, 1, 0.6039216, 1,
-0.2369315, -0.1942597, -2.602107, 0, 1, 0.6117647, 1,
-0.2338283, -0.6063441, -3.500937, 0, 1, 0.6156863, 1,
-0.2274529, 0.6552756, 1.628368, 0, 1, 0.6235294, 1,
-0.2238832, -0.9594327, -2.666527, 0, 1, 0.627451, 1,
-0.2238301, -0.1594772, -1.83098, 0, 1, 0.6352941, 1,
-0.2213329, -0.572424, -3.199087, 0, 1, 0.6392157, 1,
-0.217292, 2.227931, -0.7398523, 0, 1, 0.6470588, 1,
-0.2147746, 1.411832, 1.306017, 0, 1, 0.6509804, 1,
-0.2127157, -0.03230383, -0.4775692, 0, 1, 0.6588235, 1,
-0.2124084, 0.8994367, 2.088635, 0, 1, 0.6627451, 1,
-0.2040453, -1.030913, -3.402511, 0, 1, 0.6705883, 1,
-0.1983449, 1.037663, 0.159473, 0, 1, 0.6745098, 1,
-0.1908686, 0.2509552, 0.5765405, 0, 1, 0.682353, 1,
-0.1806937, -0.9618397, -2.458863, 0, 1, 0.6862745, 1,
-0.1804511, -0.4581506, -3.870391, 0, 1, 0.6941177, 1,
-0.1800391, -0.5316277, -3.851748, 0, 1, 0.7019608, 1,
-0.1760265, 2.291404, 1.134451, 0, 1, 0.7058824, 1,
-0.174922, -0.7303218, -3.847269, 0, 1, 0.7137255, 1,
-0.1733986, -0.5873355, -1.81479, 0, 1, 0.7176471, 1,
-0.1709071, 0.2761885, 0.1491769, 0, 1, 0.7254902, 1,
-0.168942, 2.52689, -0.1423819, 0, 1, 0.7294118, 1,
-0.1681311, 0.2606777, -0.107331, 0, 1, 0.7372549, 1,
-0.1663056, 1.593193, 0.245169, 0, 1, 0.7411765, 1,
-0.1580017, -0.3457308, -2.259181, 0, 1, 0.7490196, 1,
-0.1555822, 0.4412751, -1.512234, 0, 1, 0.7529412, 1,
-0.1552532, 0.5538253, -0.3832358, 0, 1, 0.7607843, 1,
-0.1538444, 0.6761705, -0.5264792, 0, 1, 0.7647059, 1,
-0.1510096, -0.9771277, -1.773039, 0, 1, 0.772549, 1,
-0.1502527, -0.824449, -3.903735, 0, 1, 0.7764706, 1,
-0.148631, 0.5212253, 2.334966, 0, 1, 0.7843137, 1,
-0.1456032, -0.4981745, -2.728551, 0, 1, 0.7882353, 1,
-0.1367362, 3.132275, 1.659735, 0, 1, 0.7960784, 1,
-0.1354733, 0.1091471, 0.1023083, 0, 1, 0.8039216, 1,
-0.1253474, -1.909141, -2.580126, 0, 1, 0.8078431, 1,
-0.1238167, 0.04494027, -2.088594, 0, 1, 0.8156863, 1,
-0.1233908, 0.02276404, -1.739649, 0, 1, 0.8196079, 1,
-0.1215864, -1.038328, -3.175231, 0, 1, 0.827451, 1,
-0.1211606, -1.352345, -2.140927, 0, 1, 0.8313726, 1,
-0.1196642, 1.034735, -0.515729, 0, 1, 0.8392157, 1,
-0.1172196, -0.9999899, -3.122424, 0, 1, 0.8431373, 1,
-0.1168368, 0.5555642, -1.451409, 0, 1, 0.8509804, 1,
-0.110242, 1.249419, 2.109909, 0, 1, 0.854902, 1,
-0.1095221, -0.7099674, -4.872015, 0, 1, 0.8627451, 1,
-0.1095178, 0.3418746, -0.4251816, 0, 1, 0.8666667, 1,
-0.1014641, -0.3763523, -3.355326, 0, 1, 0.8745098, 1,
-0.09670896, -1.621642, -3.356423, 0, 1, 0.8784314, 1,
-0.09527209, -1.143648, -3.720947, 0, 1, 0.8862745, 1,
-0.09458332, 0.4139226, 1.526952, 0, 1, 0.8901961, 1,
-0.09429649, 2.049727, 0.05161989, 0, 1, 0.8980392, 1,
-0.09160715, 0.3378887, -1.829158, 0, 1, 0.9058824, 1,
-0.09135588, -0.4117142, -2.775376, 0, 1, 0.9098039, 1,
-0.08809504, -1.056859, -3.019532, 0, 1, 0.9176471, 1,
-0.08520288, 1.254266, -0.1696091, 0, 1, 0.9215686, 1,
-0.0839982, 0.8549539, -0.09169783, 0, 1, 0.9294118, 1,
-0.07762112, -0.05301104, -1.116048, 0, 1, 0.9333333, 1,
-0.07741446, 0.5048805, -0.8287538, 0, 1, 0.9411765, 1,
-0.07690474, -0.4292279, -1.782018, 0, 1, 0.945098, 1,
-0.07444145, -1.68554, -3.7954, 0, 1, 0.9529412, 1,
-0.07013562, 0.6648605, -1.437708, 0, 1, 0.9568627, 1,
-0.06726928, -0.05994549, -1.24299, 0, 1, 0.9647059, 1,
-0.06377289, 0.5550609, -0.2867875, 0, 1, 0.9686275, 1,
-0.06191448, -0.619228, -3.922691, 0, 1, 0.9764706, 1,
-0.0609691, -0.2337955, -2.634147, 0, 1, 0.9803922, 1,
-0.06045333, 0.4135081, 0.6078807, 0, 1, 0.9882353, 1,
-0.05864809, -1.796855, -3.847846, 0, 1, 0.9921569, 1,
-0.0576138, -0.7216527, -3.515358, 0, 1, 1, 1,
-0.05754289, 0.6113834, 0.1277378, 0, 0.9921569, 1, 1,
-0.05741648, -1.315534, -4.39509, 0, 0.9882353, 1, 1,
-0.05550108, 1.283377, 0.4360567, 0, 0.9803922, 1, 1,
-0.05458625, 0.06795146, -1.843902, 0, 0.9764706, 1, 1,
-0.05176934, -0.03653838, -2.524334, 0, 0.9686275, 1, 1,
-0.05117884, -0.9180838, -3.173488, 0, 0.9647059, 1, 1,
-0.05004999, 1.492813, -0.386387, 0, 0.9568627, 1, 1,
-0.04950034, -1.958047, -2.952012, 0, 0.9529412, 1, 1,
-0.04904144, 0.6140201, -1.186495, 0, 0.945098, 1, 1,
-0.04644066, -0.08430227, -4.041129, 0, 0.9411765, 1, 1,
-0.04562087, -0.5668969, -3.762786, 0, 0.9333333, 1, 1,
-0.04392298, -1.472104, -2.734759, 0, 0.9294118, 1, 1,
-0.0431301, -1.429537, -2.614889, 0, 0.9215686, 1, 1,
-0.04298994, -0.6257631, -3.011743, 0, 0.9176471, 1, 1,
-0.04016003, 0.6449917, -1.301858, 0, 0.9098039, 1, 1,
-0.03911085, 0.1341996, -0.6367175, 0, 0.9058824, 1, 1,
-0.03562716, -0.5895612, -2.284286, 0, 0.8980392, 1, 1,
-0.03465887, -1.30289, -3.541769, 0, 0.8901961, 1, 1,
-0.03437649, -0.5747651, -3.822829, 0, 0.8862745, 1, 1,
-0.03126409, -0.1860719, -1.312198, 0, 0.8784314, 1, 1,
-0.02931534, -0.3966214, -1.84476, 0, 0.8745098, 1, 1,
-0.02699079, -0.5272671, -1.799809, 0, 0.8666667, 1, 1,
-0.02648989, -1.770612, -3.074969, 0, 0.8627451, 1, 1,
-0.0255566, 0.929249, -1.299676, 0, 0.854902, 1, 1,
-0.02526557, 0.3480721, 0.7883271, 0, 0.8509804, 1, 1,
-0.02512457, -0.05710273, -1.35396, 0, 0.8431373, 1, 1,
-0.02470037, 0.2644661, -1.977716, 0, 0.8392157, 1, 1,
-0.02348269, -0.5464949, -4.580155, 0, 0.8313726, 1, 1,
-0.01930913, 0.5628354, 0.4810927, 0, 0.827451, 1, 1,
-0.01637709, -0.5071225, -1.476677, 0, 0.8196079, 1, 1,
-0.01404831, -1.428813, -5.148444, 0, 0.8156863, 1, 1,
-0.01385637, 0.292844, 1.345415, 0, 0.8078431, 1, 1,
-0.009503683, -0.5709063, -2.480059, 0, 0.8039216, 1, 1,
-0.004446279, -1.36624, -4.552932, 0, 0.7960784, 1, 1,
-0.003484815, 2.241374, -0.1820054, 0, 0.7882353, 1, 1,
-0.003272687, -0.8584645, -2.747997, 0, 0.7843137, 1, 1,
-0.0005104007, 0.1746806, -0.6432672, 0, 0.7764706, 1, 1,
0.00050831, 0.3335798, -1.616841, 0, 0.772549, 1, 1,
0.003474009, -1.620502, 2.195594, 0, 0.7647059, 1, 1,
0.004670351, 1.230328, -0.9412124, 0, 0.7607843, 1, 1,
0.009233604, -1.189416, 3.050661, 0, 0.7529412, 1, 1,
0.009487717, -0.5731336, 1.947123, 0, 0.7490196, 1, 1,
0.009881294, 0.7011176, 0.4587542, 0, 0.7411765, 1, 1,
0.01180673, -1.116321, 4.204901, 0, 0.7372549, 1, 1,
0.01185224, 0.7112685, -0.8246328, 0, 0.7294118, 1, 1,
0.01712287, -0.2790321, 3.088299, 0, 0.7254902, 1, 1,
0.02007133, 1.004953, -0.5761794, 0, 0.7176471, 1, 1,
0.02823403, -1.158211, 3.637659, 0, 0.7137255, 1, 1,
0.0301457, 2.164728, 2.307405, 0, 0.7058824, 1, 1,
0.03649636, 0.2868758, -0.03600853, 0, 0.6980392, 1, 1,
0.03873969, -1.100132, 3.006002, 0, 0.6941177, 1, 1,
0.04083975, 1.636984, -1.347626, 0, 0.6862745, 1, 1,
0.04329997, 0.1727597, -1.351496, 0, 0.682353, 1, 1,
0.04427325, -0.5149881, 1.855406, 0, 0.6745098, 1, 1,
0.04947817, -1.038728, 2.068927, 0, 0.6705883, 1, 1,
0.05015379, 1.159158, -0.9586741, 0, 0.6627451, 1, 1,
0.0511449, 1.465391, -0.5205851, 0, 0.6588235, 1, 1,
0.05448526, 0.06895804, 1.35174, 0, 0.6509804, 1, 1,
0.05463488, -0.4935519, 2.31209, 0, 0.6470588, 1, 1,
0.0554588, -0.6847753, 4.776629, 0, 0.6392157, 1, 1,
0.05840933, -0.147284, 3.873419, 0, 0.6352941, 1, 1,
0.06081968, 0.197481, -0.2848719, 0, 0.627451, 1, 1,
0.06566594, -1.94172, 3.30346, 0, 0.6235294, 1, 1,
0.06637411, 0.856211, 0.05693465, 0, 0.6156863, 1, 1,
0.0694843, 0.7995787, -0.9405971, 0, 0.6117647, 1, 1,
0.07145313, -0.03856928, 1.127783, 0, 0.6039216, 1, 1,
0.07322585, 2.270685, -0.8449858, 0, 0.5960785, 1, 1,
0.07549498, -0.7185238, 2.162679, 0, 0.5921569, 1, 1,
0.0785657, 0.2206385, 1.641442, 0, 0.5843138, 1, 1,
0.07892047, 0.05548253, 0.1469079, 0, 0.5803922, 1, 1,
0.08164381, -0.3036986, 0.8625056, 0, 0.572549, 1, 1,
0.08575208, -0.6743127, 3.033566, 0, 0.5686275, 1, 1,
0.08616192, -1.30556, 2.604482, 0, 0.5607843, 1, 1,
0.08860227, -0.6839925, 4.31846, 0, 0.5568628, 1, 1,
0.0899161, -0.3398851, 3.460852, 0, 0.5490196, 1, 1,
0.09059811, 0.1493627, 1.33293, 0, 0.5450981, 1, 1,
0.0942803, -0.8285279, 3.461656, 0, 0.5372549, 1, 1,
0.09571241, 0.8510326, -0.2067382, 0, 0.5333334, 1, 1,
0.09750009, -1.018913, -0.08472927, 0, 0.5254902, 1, 1,
0.09896149, 1.805153, 1.215536, 0, 0.5215687, 1, 1,
0.1074963, 0.2897036, 0.6327984, 0, 0.5137255, 1, 1,
0.1075911, -0.6010954, 3.591723, 0, 0.509804, 1, 1,
0.1119232, -1.076031, 2.585869, 0, 0.5019608, 1, 1,
0.1150834, 0.8946111, -0.1240264, 0, 0.4941176, 1, 1,
0.1158797, 1.992783, 0.2130959, 0, 0.4901961, 1, 1,
0.1166425, -2.488268, 4.428166, 0, 0.4823529, 1, 1,
0.1177898, -0.09042692, 1.543556, 0, 0.4784314, 1, 1,
0.1218992, 0.7786199, 0.7571881, 0, 0.4705882, 1, 1,
0.12293, 1.040143, -0.2013102, 0, 0.4666667, 1, 1,
0.1265709, -0.8333712, 4.261125, 0, 0.4588235, 1, 1,
0.1273718, -0.9651724, 2.599149, 0, 0.454902, 1, 1,
0.1283446, 0.891538, -0.3434401, 0, 0.4470588, 1, 1,
0.1368482, -0.08716951, 3.82271, 0, 0.4431373, 1, 1,
0.1425847, -0.1039276, 2.913645, 0, 0.4352941, 1, 1,
0.1435585, 0.4461925, -0.8591675, 0, 0.4313726, 1, 1,
0.1439815, -0.9815333, 4.243783, 0, 0.4235294, 1, 1,
0.1443214, 0.4312311, 2.233432, 0, 0.4196078, 1, 1,
0.14587, 0.2639246, 1.143621, 0, 0.4117647, 1, 1,
0.1471814, -0.7204608, 1.482473, 0, 0.4078431, 1, 1,
0.1489725, 0.6736599, -1.299218, 0, 0.4, 1, 1,
0.1589534, 1.53981, -1.01902, 0, 0.3921569, 1, 1,
0.1619575, -1.715933, 2.503858, 0, 0.3882353, 1, 1,
0.1639241, -0.6799319, 3.165742, 0, 0.3803922, 1, 1,
0.1702558, -0.001127585, 0.4201722, 0, 0.3764706, 1, 1,
0.1790345, -0.1480329, 3.598479, 0, 0.3686275, 1, 1,
0.1796402, 0.09418779, 0.01127869, 0, 0.3647059, 1, 1,
0.1833754, 0.02854141, 1.326298, 0, 0.3568628, 1, 1,
0.1848009, -0.1172426, 2.010458, 0, 0.3529412, 1, 1,
0.1877982, -0.6658589, 4.839419, 0, 0.345098, 1, 1,
0.1885606, 0.6201, -1.172036, 0, 0.3411765, 1, 1,
0.1921418, 1.511554, -1.008581, 0, 0.3333333, 1, 1,
0.2056694, -0.1565353, 1.345601, 0, 0.3294118, 1, 1,
0.2062075, 0.3317237, 1.238235, 0, 0.3215686, 1, 1,
0.2081605, 0.1516947, 0.567233, 0, 0.3176471, 1, 1,
0.2094621, -0.8290138, 3.895401, 0, 0.3098039, 1, 1,
0.2095591, 0.9354453, 1.091684, 0, 0.3058824, 1, 1,
0.2125566, -0.4331148, 3.188221, 0, 0.2980392, 1, 1,
0.2137046, 0.2487834, 1.565618, 0, 0.2901961, 1, 1,
0.2139599, 0.3832547, -0.4158867, 0, 0.2862745, 1, 1,
0.2197064, -0.3316218, 2.586879, 0, 0.2784314, 1, 1,
0.2278766, 1.895358, 1.776418, 0, 0.2745098, 1, 1,
0.2305984, 0.8539056, 1.373232, 0, 0.2666667, 1, 1,
0.2322146, -0.2397551, 2.159705, 0, 0.2627451, 1, 1,
0.2384668, -1.596317, 4.718056, 0, 0.254902, 1, 1,
0.2408609, -1.256164, 2.604532, 0, 0.2509804, 1, 1,
0.2432422, -0.768169, 4.771987, 0, 0.2431373, 1, 1,
0.2459095, -1.05601, 2.460604, 0, 0.2392157, 1, 1,
0.2465196, -0.6229078, 2.884156, 0, 0.2313726, 1, 1,
0.2499722, -0.432538, 3.561156, 0, 0.227451, 1, 1,
0.2579602, 0.07042862, 2.175963, 0, 0.2196078, 1, 1,
0.260447, -1.063943, 2.142455, 0, 0.2156863, 1, 1,
0.2656402, -0.847742, 2.124771, 0, 0.2078431, 1, 1,
0.2680528, -1.114507, 2.312292, 0, 0.2039216, 1, 1,
0.2720787, 0.09708678, 1.709433, 0, 0.1960784, 1, 1,
0.2760552, 1.142701, 0.4184096, 0, 0.1882353, 1, 1,
0.2770133, -0.6242058, 1.049834, 0, 0.1843137, 1, 1,
0.2770834, -0.9888087, 3.042905, 0, 0.1764706, 1, 1,
0.2791602, 1.466426, 0.6142356, 0, 0.172549, 1, 1,
0.2832852, 0.7822412, 0.2401734, 0, 0.1647059, 1, 1,
0.284219, 1.705283, 0.4745658, 0, 0.1607843, 1, 1,
0.2842802, 1.417596, -1.51981, 0, 0.1529412, 1, 1,
0.2939627, -0.3421145, 3.078004, 0, 0.1490196, 1, 1,
0.2967391, 0.2726784, 1.779098, 0, 0.1411765, 1, 1,
0.3014218, -0.7562716, 3.051992, 0, 0.1372549, 1, 1,
0.3035291, -0.2608481, 2.570491, 0, 0.1294118, 1, 1,
0.3043643, -0.1587154, 2.325548, 0, 0.1254902, 1, 1,
0.3048483, -0.06004378, 2.086987, 0, 0.1176471, 1, 1,
0.3152671, -0.3894215, 4.520969, 0, 0.1137255, 1, 1,
0.3169149, 0.1173725, -0.4970417, 0, 0.1058824, 1, 1,
0.3180395, -0.6346227, 3.145792, 0, 0.09803922, 1, 1,
0.3206721, -1.485288, 1.471919, 0, 0.09411765, 1, 1,
0.3209946, -0.6702023, 3.119082, 0, 0.08627451, 1, 1,
0.322634, 0.2333519, 1.644948, 0, 0.08235294, 1, 1,
0.3266231, -0.3417818, 2.96916, 0, 0.07450981, 1, 1,
0.3270347, -1.452605, 1.236374, 0, 0.07058824, 1, 1,
0.3291565, -1.302876, 3.242394, 0, 0.0627451, 1, 1,
0.3301203, -0.1558998, 2.094745, 0, 0.05882353, 1, 1,
0.3378949, 1.044917, 0.02045288, 0, 0.05098039, 1, 1,
0.342507, -0.09110229, 1.066709, 0, 0.04705882, 1, 1,
0.3457175, -0.6553758, 1.732105, 0, 0.03921569, 1, 1,
0.3460853, -0.06885642, 2.691089, 0, 0.03529412, 1, 1,
0.3465174, -0.4031626, 2.028477, 0, 0.02745098, 1, 1,
0.3467355, 0.2094656, 0.789269, 0, 0.02352941, 1, 1,
0.3480664, 0.3872153, -0.08046333, 0, 0.01568628, 1, 1,
0.3486215, 0.3665786, 1.148234, 0, 0.01176471, 1, 1,
0.3552588, -0.1973149, 2.310667, 0, 0.003921569, 1, 1,
0.35927, -1.443359, 2.918998, 0.003921569, 0, 1, 1,
0.3669525, 0.2850469, 2.009045, 0.007843138, 0, 1, 1,
0.367748, 1.116978, 3.346205, 0.01568628, 0, 1, 1,
0.3691138, -3.082009, 4.289839, 0.01960784, 0, 1, 1,
0.3728276, -0.08250938, -0.1436546, 0.02745098, 0, 1, 1,
0.3737076, -0.4519831, 1.147764, 0.03137255, 0, 1, 1,
0.3739461, -1.391105, 3.105732, 0.03921569, 0, 1, 1,
0.3786401, 0.003187554, 2.911181, 0.04313726, 0, 1, 1,
0.3855572, 0.4674293, -0.3319383, 0.05098039, 0, 1, 1,
0.3885166, -0.1615074, 0.917821, 0.05490196, 0, 1, 1,
0.3937963, 0.2006077, -1.00601, 0.0627451, 0, 1, 1,
0.397121, 0.3229684, 2.46196, 0.06666667, 0, 1, 1,
0.4028252, 0.4747402, 0.5219912, 0.07450981, 0, 1, 1,
0.4033119, -0.3299536, 1.576281, 0.07843138, 0, 1, 1,
0.4040637, -0.8919849, 1.520184, 0.08627451, 0, 1, 1,
0.4062596, -0.9472952, 3.829463, 0.09019608, 0, 1, 1,
0.4163715, 0.9700639, -0.5348054, 0.09803922, 0, 1, 1,
0.4181304, -0.2459933, 2.093896, 0.1058824, 0, 1, 1,
0.4193517, -0.9575366, 4.036403, 0.1098039, 0, 1, 1,
0.4214706, 0.2630451, 0.874153, 0.1176471, 0, 1, 1,
0.4244392, -0.1833045, 1.870243, 0.1215686, 0, 1, 1,
0.4279133, -1.284594, 3.032663, 0.1294118, 0, 1, 1,
0.4282854, 1.228891, 1.651152, 0.1333333, 0, 1, 1,
0.4312764, -0.3174645, 1.9063, 0.1411765, 0, 1, 1,
0.4324877, 1.185034, -0.702009, 0.145098, 0, 1, 1,
0.4386758, 0.7759067, 1.234027, 0.1529412, 0, 1, 1,
0.4399868, -0.1708777, 2.674553, 0.1568628, 0, 1, 1,
0.441072, -0.4003562, 2.367524, 0.1647059, 0, 1, 1,
0.445278, -0.008323587, -0.6412079, 0.1686275, 0, 1, 1,
0.4472176, -2.170008, 2.350129, 0.1764706, 0, 1, 1,
0.4490626, -0.7632833, 2.562999, 0.1803922, 0, 1, 1,
0.4517312, -0.7217197, 4.310326, 0.1882353, 0, 1, 1,
0.4520305, -0.3893211, 1.757499, 0.1921569, 0, 1, 1,
0.4551174, 0.7625751, 2.141812, 0.2, 0, 1, 1,
0.4642273, -1.116643, 2.578264, 0.2078431, 0, 1, 1,
0.4669451, 0.60298, 2.550267, 0.2117647, 0, 1, 1,
0.4681678, 1.358701, 0.6074946, 0.2196078, 0, 1, 1,
0.4689004, -1.247294, 1.35505, 0.2235294, 0, 1, 1,
0.4719515, -0.1059413, 2.390777, 0.2313726, 0, 1, 1,
0.475181, 1.555453, 0.4333884, 0.2352941, 0, 1, 1,
0.4780865, -0.6040081, 1.686279, 0.2431373, 0, 1, 1,
0.4784932, -0.7474815, 2.710927, 0.2470588, 0, 1, 1,
0.4822031, 0.1247585, -0.8550325, 0.254902, 0, 1, 1,
0.4870414, 1.700423, -1.539628, 0.2588235, 0, 1, 1,
0.4936597, -0.7245941, 2.319312, 0.2666667, 0, 1, 1,
0.494856, -1.130929, 0.4629523, 0.2705882, 0, 1, 1,
0.4984352, 0.2116732, 2.129437, 0.2784314, 0, 1, 1,
0.4986361, -2.178828, 3.279305, 0.282353, 0, 1, 1,
0.5000679, -0.6079049, 3.052797, 0.2901961, 0, 1, 1,
0.5010087, 0.5963753, 1.520572, 0.2941177, 0, 1, 1,
0.5110124, -1.097447, 4.543749, 0.3019608, 0, 1, 1,
0.5118738, 0.7615843, 0.3477113, 0.3098039, 0, 1, 1,
0.5142496, -0.7552117, 3.292347, 0.3137255, 0, 1, 1,
0.5143588, 1.604515, 0.9842022, 0.3215686, 0, 1, 1,
0.5178114, 0.7769595, 2.637799, 0.3254902, 0, 1, 1,
0.521455, -0.7268716, 3.097206, 0.3333333, 0, 1, 1,
0.5221604, 0.2384344, -0.4596927, 0.3372549, 0, 1, 1,
0.5236186, 0.3874967, 2.44236, 0.345098, 0, 1, 1,
0.526584, -0.007155178, 1.559728, 0.3490196, 0, 1, 1,
0.5340275, 1.030527, -0.9086115, 0.3568628, 0, 1, 1,
0.5347593, 0.3653526, -0.5898193, 0.3607843, 0, 1, 1,
0.5367217, 0.1907763, 1.286519, 0.3686275, 0, 1, 1,
0.5468159, 0.8503125, 1.95974, 0.372549, 0, 1, 1,
0.5475034, -2.435366, 2.704316, 0.3803922, 0, 1, 1,
0.55115, -0.1742764, 4.33889, 0.3843137, 0, 1, 1,
0.5566389, 1.700268, 0.896091, 0.3921569, 0, 1, 1,
0.5569317, 0.7017888, -0.1552215, 0.3960784, 0, 1, 1,
0.5572876, -0.8395422, 2.369673, 0.4039216, 0, 1, 1,
0.5575446, 1.005055, 1.144197, 0.4117647, 0, 1, 1,
0.5622784, 0.4735514, 2.140496, 0.4156863, 0, 1, 1,
0.5791396, 1.653393, -0.3969036, 0.4235294, 0, 1, 1,
0.580055, 0.4180996, 1.184909, 0.427451, 0, 1, 1,
0.5848535, 2.188359, 2.031167, 0.4352941, 0, 1, 1,
0.5857682, 2.4653, -1.256427, 0.4392157, 0, 1, 1,
0.5920293, -0.467027, 2.331991, 0.4470588, 0, 1, 1,
0.6007175, 0.3200109, -0.4627871, 0.4509804, 0, 1, 1,
0.6008529, 0.7029715, 1.577287, 0.4588235, 0, 1, 1,
0.605288, -1.872834, 3.830503, 0.4627451, 0, 1, 1,
0.6057348, -0.1220803, 1.83062, 0.4705882, 0, 1, 1,
0.6079205, 1.376889, -0.8283763, 0.4745098, 0, 1, 1,
0.6122608, 0.5164493, 2.279284, 0.4823529, 0, 1, 1,
0.6125551, 1.160515, 0.8832686, 0.4862745, 0, 1, 1,
0.612913, 0.01490994, 2.704301, 0.4941176, 0, 1, 1,
0.6129643, 0.2495288, 1.07554, 0.5019608, 0, 1, 1,
0.6171304, 1.054093, -0.06992514, 0.5058824, 0, 1, 1,
0.6214586, -1.688795, 2.109433, 0.5137255, 0, 1, 1,
0.62221, 1.267347, -2.147514, 0.5176471, 0, 1, 1,
0.6296456, 0.6505785, 2.712486, 0.5254902, 0, 1, 1,
0.6308152, -1.547546, 0.7474575, 0.5294118, 0, 1, 1,
0.6343617, -1.075812, 3.836001, 0.5372549, 0, 1, 1,
0.649285, 0.2057071, -0.5554654, 0.5411765, 0, 1, 1,
0.64979, 0.392271, 1.406861, 0.5490196, 0, 1, 1,
0.6507936, 0.6586992, 1.789549, 0.5529412, 0, 1, 1,
0.6520182, 0.4483128, -1.051032, 0.5607843, 0, 1, 1,
0.6526252, 2.746161, 0.3844989, 0.5647059, 0, 1, 1,
0.6553181, -0.2674468, 2.89364, 0.572549, 0, 1, 1,
0.6569725, 0.1008758, 0.2922613, 0.5764706, 0, 1, 1,
0.6578929, -0.9914779, 2.894358, 0.5843138, 0, 1, 1,
0.6605128, 0.1446893, -0.3476866, 0.5882353, 0, 1, 1,
0.6638551, -1.526588, 1.939429, 0.5960785, 0, 1, 1,
0.6649492, -1.247451, 3.345899, 0.6039216, 0, 1, 1,
0.6687092, -0.6411642, 1.500434, 0.6078432, 0, 1, 1,
0.6705205, 0.6882504, 0.9604482, 0.6156863, 0, 1, 1,
0.6754314, -1.044755, 2.488758, 0.6196079, 0, 1, 1,
0.681218, -1.609864, 3.402053, 0.627451, 0, 1, 1,
0.6840265, 0.6919203, 0.4148372, 0.6313726, 0, 1, 1,
0.6856416, 2.526096, 1.130408, 0.6392157, 0, 1, 1,
0.6860561, -0.8925873, 2.906077, 0.6431373, 0, 1, 1,
0.6895623, 0.617746, 1.684211, 0.6509804, 0, 1, 1,
0.6898154, 0.6655917, -0.3478808, 0.654902, 0, 1, 1,
0.6914815, -0.9316034, 3.792264, 0.6627451, 0, 1, 1,
0.7030761, 0.382087, 0.3224254, 0.6666667, 0, 1, 1,
0.7068572, 0.9800228, 0.9209374, 0.6745098, 0, 1, 1,
0.7072988, 1.577337, 1.066431, 0.6784314, 0, 1, 1,
0.7082964, 1.518433, 0.07244142, 0.6862745, 0, 1, 1,
0.7095903, 0.6174757, 0.9532998, 0.6901961, 0, 1, 1,
0.710033, 0.7604325, 0.7054833, 0.6980392, 0, 1, 1,
0.7111452, 1.099372, 1.091937, 0.7058824, 0, 1, 1,
0.7180392, 0.005723243, 1.045688, 0.7098039, 0, 1, 1,
0.7279774, 0.9670137, 1.994553, 0.7176471, 0, 1, 1,
0.7312706, -0.602396, 1.102797, 0.7215686, 0, 1, 1,
0.7358312, 1.269716, 0.8671182, 0.7294118, 0, 1, 1,
0.7464681, 1.512158, 0.3602007, 0.7333333, 0, 1, 1,
0.756368, -0.5234558, 1.658077, 0.7411765, 0, 1, 1,
0.7593049, 0.04516678, 1.728678, 0.7450981, 0, 1, 1,
0.7657933, 0.1445019, 1.597195, 0.7529412, 0, 1, 1,
0.7670419, 0.01827865, 1.373707, 0.7568628, 0, 1, 1,
0.7696203, -0.08810708, 0.8499888, 0.7647059, 0, 1, 1,
0.7699706, 0.6066895, 0.02221706, 0.7686275, 0, 1, 1,
0.7845801, 0.1647791, 1.14066, 0.7764706, 0, 1, 1,
0.788496, -0.6554766, 2.248983, 0.7803922, 0, 1, 1,
0.7887035, -0.1433679, 1.244623, 0.7882353, 0, 1, 1,
0.7930641, 0.4863521, 0.3978202, 0.7921569, 0, 1, 1,
0.7930681, -0.7744734, 2.110151, 0.8, 0, 1, 1,
0.7990106, -0.03336897, 2.124014, 0.8078431, 0, 1, 1,
0.8027646, -1.146405, 2.068105, 0.8117647, 0, 1, 1,
0.8029631, 0.02873017, 0.6733156, 0.8196079, 0, 1, 1,
0.8067764, 0.7523113, 0.1746675, 0.8235294, 0, 1, 1,
0.8132806, -0.4270954, 2.173023, 0.8313726, 0, 1, 1,
0.818491, 0.6343285, 1.232796, 0.8352941, 0, 1, 1,
0.819683, 1.023092, 0.009701692, 0.8431373, 0, 1, 1,
0.823805, -0.6766211, 2.254032, 0.8470588, 0, 1, 1,
0.8307258, -1.981015, 2.51679, 0.854902, 0, 1, 1,
0.832253, 0.2278463, 2.637485, 0.8588235, 0, 1, 1,
0.8360486, -1.468222, 4.188394, 0.8666667, 0, 1, 1,
0.837976, 0.4047081, 0.7153569, 0.8705882, 0, 1, 1,
0.8383405, 0.3419849, -0.493461, 0.8784314, 0, 1, 1,
0.8485484, 0.5112049, 1.663742, 0.8823529, 0, 1, 1,
0.8591914, 2.361259, 0.1557785, 0.8901961, 0, 1, 1,
0.8645225, -1.084697, 1.335829, 0.8941177, 0, 1, 1,
0.8723335, 1.140684, 0.2595705, 0.9019608, 0, 1, 1,
0.8725472, -0.7977926, 1.001434, 0.9098039, 0, 1, 1,
0.8849608, 1.126354, 2.532355, 0.9137255, 0, 1, 1,
0.8862331, -1.328868, 2.663734, 0.9215686, 0, 1, 1,
0.887107, -0.2571572, 1.682483, 0.9254902, 0, 1, 1,
0.8923635, 1.078073, 1.220078, 0.9333333, 0, 1, 1,
0.893372, -1.221255, 3.15039, 0.9372549, 0, 1, 1,
0.8946066, 1.82202, -0.2742311, 0.945098, 0, 1, 1,
0.8962591, -0.3142247, 2.201822, 0.9490196, 0, 1, 1,
0.8976684, -0.1584136, 1.071068, 0.9568627, 0, 1, 1,
0.905625, -0.1181417, 3.194348, 0.9607843, 0, 1, 1,
0.9071095, 0.2935714, 1.807444, 0.9686275, 0, 1, 1,
0.9094614, -0.3292733, 2.738155, 0.972549, 0, 1, 1,
0.9140615, 0.364243, 1.406612, 0.9803922, 0, 1, 1,
0.9146928, 1.781119, 0.2717829, 0.9843137, 0, 1, 1,
0.9308516, 1.089823, 1.224105, 0.9921569, 0, 1, 1,
0.9323499, -0.8880029, 3.754856, 0.9960784, 0, 1, 1,
0.9389851, -0.5660318, 2.80701, 1, 0, 0.9960784, 1,
0.9416557, 0.8282248, 2.002226, 1, 0, 0.9882353, 1,
0.9509562, -1.397094, 3.573989, 1, 0, 0.9843137, 1,
0.9577014, -0.3781258, 1.392502, 1, 0, 0.9764706, 1,
0.9640265, -0.5633214, 0.9414053, 1, 0, 0.972549, 1,
0.9678471, -0.6840159, 2.159549, 1, 0, 0.9647059, 1,
0.9798425, -0.2009374, 2.742093, 1, 0, 0.9607843, 1,
0.9907196, -0.5252484, 2.458489, 1, 0, 0.9529412, 1,
0.9908829, -0.6231148, 0.8413879, 1, 0, 0.9490196, 1,
0.9932281, 0.02313712, 1.718277, 1, 0, 0.9411765, 1,
0.9956151, 0.4609829, 2.089546, 1, 0, 0.9372549, 1,
1.000627, 1.321264, 2.027975, 1, 0, 0.9294118, 1,
1.013524, 1.165337, -0.0822913, 1, 0, 0.9254902, 1,
1.014843, 0.7016444, 0.1301655, 1, 0, 0.9176471, 1,
1.01569, -1.238333, 1.512254, 1, 0, 0.9137255, 1,
1.017992, -0.5536752, 0.4430617, 1, 0, 0.9058824, 1,
1.018802, -2.207029, 2.650064, 1, 0, 0.9019608, 1,
1.023871, -0.4460748, 0.1472517, 1, 0, 0.8941177, 1,
1.033383, -0.8794692, 2.15647, 1, 0, 0.8862745, 1,
1.038104, -0.6571964, 1.125297, 1, 0, 0.8823529, 1,
1.040061, 0.3720486, 0.7074006, 1, 0, 0.8745098, 1,
1.042619, -0.5700411, 1.947029, 1, 0, 0.8705882, 1,
1.04496, -0.5721061, 1.796112, 1, 0, 0.8627451, 1,
1.046005, -0.9254835, 1.659711, 1, 0, 0.8588235, 1,
1.046027, -1.233677, 2.57717, 1, 0, 0.8509804, 1,
1.051455, 0.5324386, 1.519693, 1, 0, 0.8470588, 1,
1.059395, -0.2757712, 1.573386, 1, 0, 0.8392157, 1,
1.062668, 0.340257, 1.300372, 1, 0, 0.8352941, 1,
1.071228, -0.6080782, 1.116977, 1, 0, 0.827451, 1,
1.074609, -0.9022129, 2.131207, 1, 0, 0.8235294, 1,
1.075374, -1.783503, 3.081009, 1, 0, 0.8156863, 1,
1.077078, -1.645999, 3.224149, 1, 0, 0.8117647, 1,
1.077849, 0.6747323, 0.731483, 1, 0, 0.8039216, 1,
1.082396, -0.4351694, -0.185014, 1, 0, 0.7960784, 1,
1.082603, 1.041761, 0.5454893, 1, 0, 0.7921569, 1,
1.092039, 0.794786, 2.975148, 1, 0, 0.7843137, 1,
1.105428, -1.208353, 3.074059, 1, 0, 0.7803922, 1,
1.108896, 0.3668379, -0.05741597, 1, 0, 0.772549, 1,
1.110701, -2.010655, 1.726702, 1, 0, 0.7686275, 1,
1.114432, 0.6556714, 0.1347486, 1, 0, 0.7607843, 1,
1.121651, -1.505945, 2.129953, 1, 0, 0.7568628, 1,
1.126599, -1.927599, 3.907753, 1, 0, 0.7490196, 1,
1.130201, -0.9631658, 3.701702, 1, 0, 0.7450981, 1,
1.13901, -0.4688729, 1.972619, 1, 0, 0.7372549, 1,
1.140922, -0.5852001, 0.3198852, 1, 0, 0.7333333, 1,
1.142262, -0.8430662, 1.764365, 1, 0, 0.7254902, 1,
1.167022, 0.4763657, 2.707582, 1, 0, 0.7215686, 1,
1.173793, 2.676797, -0.6478432, 1, 0, 0.7137255, 1,
1.175248, -1.927957, 1.195901, 1, 0, 0.7098039, 1,
1.179405, -1.106503, 5.696982, 1, 0, 0.7019608, 1,
1.190983, -0.9237911, 1.468813, 1, 0, 0.6941177, 1,
1.19473, -0.3255891, 0.8511781, 1, 0, 0.6901961, 1,
1.195035, -0.8210341, 1.863766, 1, 0, 0.682353, 1,
1.201557, -0.5554909, 2.841834, 1, 0, 0.6784314, 1,
1.202355, -1.613375, 2.683463, 1, 0, 0.6705883, 1,
1.213701, -1.552014, 3.639865, 1, 0, 0.6666667, 1,
1.21459, 1.222439, -0.4556896, 1, 0, 0.6588235, 1,
1.226623, 0.9002662, 1.272302, 1, 0, 0.654902, 1,
1.230491, 0.198331, 1.160501, 1, 0, 0.6470588, 1,
1.230536, -1.117469, 1.935892, 1, 0, 0.6431373, 1,
1.240801, 1.263128, -0.02334054, 1, 0, 0.6352941, 1,
1.2416, 0.522953, 3.700743, 1, 0, 0.6313726, 1,
1.247046, -0.984724, 3.281893, 1, 0, 0.6235294, 1,
1.254369, 0.3512427, 0.5239703, 1, 0, 0.6196079, 1,
1.256851, -0.7377806, 2.82026, 1, 0, 0.6117647, 1,
1.27239, -0.09884243, 0.8565004, 1, 0, 0.6078432, 1,
1.277603, 0.7260826, 0.6905518, 1, 0, 0.6, 1,
1.2845, 0.3135945, 1.830469, 1, 0, 0.5921569, 1,
1.2885, 1.417826, -0.3165497, 1, 0, 0.5882353, 1,
1.305153, -0.7664957, 1.825394, 1, 0, 0.5803922, 1,
1.324099, -0.748998, 1.726276, 1, 0, 0.5764706, 1,
1.326448, -1.429315, 2.487755, 1, 0, 0.5686275, 1,
1.343021, -0.6453578, 2.862965, 1, 0, 0.5647059, 1,
1.352574, -0.7795025, 2.338553, 1, 0, 0.5568628, 1,
1.366941, -0.7416874, 3.35025, 1, 0, 0.5529412, 1,
1.367924, -1.144836, 2.337077, 1, 0, 0.5450981, 1,
1.378706, 1.134644, 1.773769, 1, 0, 0.5411765, 1,
1.390246, -0.192213, 0.2640384, 1, 0, 0.5333334, 1,
1.408514, 0.3006895, 2.218517, 1, 0, 0.5294118, 1,
1.412123, -0.1899682, 2.396611, 1, 0, 0.5215687, 1,
1.417157, 0.6911089, 0.8242931, 1, 0, 0.5176471, 1,
1.417566, 1.012421, 0.02161735, 1, 0, 0.509804, 1,
1.4326, -0.3699771, 1.884902, 1, 0, 0.5058824, 1,
1.439173, -0.6664914, 3.268813, 1, 0, 0.4980392, 1,
1.441475, 0.3363161, 1.53378, 1, 0, 0.4901961, 1,
1.445506, 1.984225, -0.5505118, 1, 0, 0.4862745, 1,
1.445973, -1.286403, 2.735301, 1, 0, 0.4784314, 1,
1.475443, -0.9373569, -0.8056888, 1, 0, 0.4745098, 1,
1.481205, -0.03882685, 2.084572, 1, 0, 0.4666667, 1,
1.481454, -1.424059, 3.710945, 1, 0, 0.4627451, 1,
1.486267, -0.2281118, 0.6227021, 1, 0, 0.454902, 1,
1.495297, 1.307762, 1.285387, 1, 0, 0.4509804, 1,
1.496465, -0.1794779, 0.9753124, 1, 0, 0.4431373, 1,
1.505057, -0.7644781, 0.8394564, 1, 0, 0.4392157, 1,
1.525319, -0.8670223, 1.534838, 1, 0, 0.4313726, 1,
1.53184, -0.06443189, 3.142399, 1, 0, 0.427451, 1,
1.532873, 0.9102899, 0.4325116, 1, 0, 0.4196078, 1,
1.535244, -1.230934, 1.445822, 1, 0, 0.4156863, 1,
1.538272, 0.4207759, 2.334932, 1, 0, 0.4078431, 1,
1.552374, 0.4992999, 1.851552, 1, 0, 0.4039216, 1,
1.559545, 0.6235591, -0.961682, 1, 0, 0.3960784, 1,
1.569907, 0.1287661, 1.675082, 1, 0, 0.3882353, 1,
1.572465, 0.5265488, 0.1479779, 1, 0, 0.3843137, 1,
1.582964, -1.449291, 3.705762, 1, 0, 0.3764706, 1,
1.584293, 0.4158329, 1.625077, 1, 0, 0.372549, 1,
1.587509, 0.3313081, 0.2690204, 1, 0, 0.3647059, 1,
1.595338, -0.319954, 2.036802, 1, 0, 0.3607843, 1,
1.598752, -0.7906489, 2.516949, 1, 0, 0.3529412, 1,
1.601812, -1.400326, 3.499161, 1, 0, 0.3490196, 1,
1.613369, -0.5880046, 2.814986, 1, 0, 0.3411765, 1,
1.613451, -1.096475, 2.34231, 1, 0, 0.3372549, 1,
1.629167, 0.415074, 0.1536589, 1, 0, 0.3294118, 1,
1.641209, 0.5705357, 2.679961, 1, 0, 0.3254902, 1,
1.64478, 0.2325644, 3.461735, 1, 0, 0.3176471, 1,
1.649103, -1.394578, 0.5359229, 1, 0, 0.3137255, 1,
1.652086, -1.459663, 1.17736, 1, 0, 0.3058824, 1,
1.657607, -0.3834423, 1.147915, 1, 0, 0.2980392, 1,
1.657893, 1.666438, 2.214998, 1, 0, 0.2941177, 1,
1.669377, -0.3684689, 3.110832, 1, 0, 0.2862745, 1,
1.669455, 1.181779, 0.9792278, 1, 0, 0.282353, 1,
1.712501, 0.6707521, 0.6736375, 1, 0, 0.2745098, 1,
1.723753, 1.753502, 1.663878, 1, 0, 0.2705882, 1,
1.726582, 1.966015, 0.3287948, 1, 0, 0.2627451, 1,
1.73053, 0.3454229, 3.179111, 1, 0, 0.2588235, 1,
1.748891, -2.454782, 2.372537, 1, 0, 0.2509804, 1,
1.761034, 1.316011, 1.241171, 1, 0, 0.2470588, 1,
1.794552, -0.004551488, 0.7314879, 1, 0, 0.2392157, 1,
1.832657, 0.4807331, 0.9744386, 1, 0, 0.2352941, 1,
1.833242, -0.04115805, 1.67667, 1, 0, 0.227451, 1,
1.86052, 0.8064599, 1.577497, 1, 0, 0.2235294, 1,
1.863932, 0.3903874, 2.602095, 1, 0, 0.2156863, 1,
1.882283, -0.1771011, 1.661146, 1, 0, 0.2117647, 1,
1.886283, 1.015624, 1.751488, 1, 0, 0.2039216, 1,
1.897924, 0.5468668, -0.6868329, 1, 0, 0.1960784, 1,
1.908989, 1.294051, 2.049861, 1, 0, 0.1921569, 1,
1.913062, 0.351362, 0.7459602, 1, 0, 0.1843137, 1,
1.932275, 0.271051, 0.5292724, 1, 0, 0.1803922, 1,
1.959185, -0.7471541, 3.171537, 1, 0, 0.172549, 1,
1.96332, 0.6964622, -0.5524381, 1, 0, 0.1686275, 1,
1.965078, 0.396062, 3.154213, 1, 0, 0.1607843, 1,
1.974129, 1.376817, 0.4422332, 1, 0, 0.1568628, 1,
1.974342, -1.175043, 2.635507, 1, 0, 0.1490196, 1,
1.982259, 1.205156, 1.154964, 1, 0, 0.145098, 1,
2, 0.07541662, 1.193304, 1, 0, 0.1372549, 1,
2.011256, 0.3895068, 0.89064, 1, 0, 0.1333333, 1,
2.011301, -0.05933254, 2.52148, 1, 0, 0.1254902, 1,
2.060131, -1.023107, 3.403863, 1, 0, 0.1215686, 1,
2.077583, 0.004009226, 3.076204, 1, 0, 0.1137255, 1,
2.104152, -0.6037933, 1.717016, 1, 0, 0.1098039, 1,
2.142062, 0.7447062, 2.919949, 1, 0, 0.1019608, 1,
2.146222, 0.4791981, 0.5113372, 1, 0, 0.09411765, 1,
2.211306, -0.2604027, 1.029268, 1, 0, 0.09019608, 1,
2.222172, -0.5312799, 1.194546, 1, 0, 0.08235294, 1,
2.310133, -0.7022069, 3.305668, 1, 0, 0.07843138, 1,
2.335686, -0.2694048, 2.901529, 1, 0, 0.07058824, 1,
2.407215, -0.3534881, 0.6180931, 1, 0, 0.06666667, 1,
2.408102, -0.665333, 2.107893, 1, 0, 0.05882353, 1,
2.53675, -1.174891, 1.894325, 1, 0, 0.05490196, 1,
2.560836, 1.270798, 1.241861, 1, 0, 0.04705882, 1,
2.565395, 0.4254394, 1.257523, 1, 0, 0.04313726, 1,
2.658572, 0.5592878, 0.9149964, 1, 0, 0.03529412, 1,
2.723559, -0.7218578, 1.708044, 1, 0, 0.03137255, 1,
2.817474, -1.161006, 4.040617, 1, 0, 0.02352941, 1,
2.930788, 1.331594, 0.8583789, 1, 0, 0.01960784, 1,
3.098796, -0.7340351, 1.530148, 1, 0, 0.01176471, 1,
3.16783, 1.226697, 2.02022, 1, 0, 0.007843138, 1
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
0.266786, -4.177954, -6.986744, 0, -0.5, 0.5, 0.5,
0.266786, -4.177954, -6.986744, 1, -0.5, 0.5, 0.5,
0.266786, -4.177954, -6.986744, 1, 1.5, 0.5, 0.5,
0.266786, -4.177954, -6.986744, 0, 1.5, 0.5, 0.5
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
-3.617712, 0.1508683, -6.986744, 0, -0.5, 0.5, 0.5,
-3.617712, 0.1508683, -6.986744, 1, -0.5, 0.5, 0.5,
-3.617712, 0.1508683, -6.986744, 1, 1.5, 0.5, 0.5,
-3.617712, 0.1508683, -6.986744, 0, 1.5, 0.5, 0.5
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
-3.617712, -4.177954, 0.2742689, 0, -0.5, 0.5, 0.5,
-3.617712, -4.177954, 0.2742689, 1, -0.5, 0.5, 0.5,
-3.617712, -4.177954, 0.2742689, 1, 1.5, 0.5, 0.5,
-3.617712, -4.177954, 0.2742689, 0, 1.5, 0.5, 0.5
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
-2, -3.178995, -5.311126,
3, -3.178995, -5.311126,
-2, -3.178995, -5.311126,
-2, -3.345488, -5.590395,
-1, -3.178995, -5.311126,
-1, -3.345488, -5.590395,
0, -3.178995, -5.311126,
0, -3.345488, -5.590395,
1, -3.178995, -5.311126,
1, -3.345488, -5.590395,
2, -3.178995, -5.311126,
2, -3.345488, -5.590395,
3, -3.178995, -5.311126,
3, -3.345488, -5.590395
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
-2, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
-2, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
-2, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
-2, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5,
-1, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
-1, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
-1, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
-1, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5,
0, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
0, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
0, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
0, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5,
1, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
1, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
1, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
1, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5,
2, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
2, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
2, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
2, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5,
3, -3.678475, -6.148935, 0, -0.5, 0.5, 0.5,
3, -3.678475, -6.148935, 1, -0.5, 0.5, 0.5,
3, -3.678475, -6.148935, 1, 1.5, 0.5, 0.5,
3, -3.678475, -6.148935, 0, 1.5, 0.5, 0.5
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
-2.721289, -3, -5.311126,
-2.721289, 3, -5.311126,
-2.721289, -3, -5.311126,
-2.870693, -3, -5.590395,
-2.721289, -2, -5.311126,
-2.870693, -2, -5.590395,
-2.721289, -1, -5.311126,
-2.870693, -1, -5.590395,
-2.721289, 0, -5.311126,
-2.870693, 0, -5.590395,
-2.721289, 1, -5.311126,
-2.870693, 1, -5.590395,
-2.721289, 2, -5.311126,
-2.870693, 2, -5.590395,
-2.721289, 3, -5.311126,
-2.870693, 3, -5.590395
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
-3.169501, -3, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, -3, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, -3, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, -3, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, -2, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, -2, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, -2, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, -2, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, -1, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, -1, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, -1, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, -1, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, 0, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, 0, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, 0, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, 0, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, 1, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, 1, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, 1, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, 1, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, 2, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, 2, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, 2, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, 2, -6.148935, 0, 1.5, 0.5, 0.5,
-3.169501, 3, -6.148935, 0, -0.5, 0.5, 0.5,
-3.169501, 3, -6.148935, 1, -0.5, 0.5, 0.5,
-3.169501, 3, -6.148935, 1, 1.5, 0.5, 0.5,
-3.169501, 3, -6.148935, 0, 1.5, 0.5, 0.5
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
-2.721289, -3.178995, -4,
-2.721289, -3.178995, 4,
-2.721289, -3.178995, -4,
-2.870693, -3.345488, -4,
-2.721289, -3.178995, -2,
-2.870693, -3.345488, -2,
-2.721289, -3.178995, 0,
-2.870693, -3.345488, 0,
-2.721289, -3.178995, 2,
-2.870693, -3.345488, 2,
-2.721289, -3.178995, 4,
-2.870693, -3.345488, 4
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
-3.169501, -3.678475, -4, 0, -0.5, 0.5, 0.5,
-3.169501, -3.678475, -4, 1, -0.5, 0.5, 0.5,
-3.169501, -3.678475, -4, 1, 1.5, 0.5, 0.5,
-3.169501, -3.678475, -4, 0, 1.5, 0.5, 0.5,
-3.169501, -3.678475, -2, 0, -0.5, 0.5, 0.5,
-3.169501, -3.678475, -2, 1, -0.5, 0.5, 0.5,
-3.169501, -3.678475, -2, 1, 1.5, 0.5, 0.5,
-3.169501, -3.678475, -2, 0, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 0, 0, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 0, 1, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 0, 1, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 0, 0, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 2, 0, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 2, 1, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 2, 1, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 2, 0, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 4, 0, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 4, 1, -0.5, 0.5, 0.5,
-3.169501, -3.678475, 4, 1, 1.5, 0.5, 0.5,
-3.169501, -3.678475, 4, 0, 1.5, 0.5, 0.5
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
-2.721289, -3.178995, -5.311126,
-2.721289, 3.480732, -5.311126,
-2.721289, -3.178995, 5.859663,
-2.721289, 3.480732, 5.859663,
-2.721289, -3.178995, -5.311126,
-2.721289, -3.178995, 5.859663,
-2.721289, 3.480732, -5.311126,
-2.721289, 3.480732, 5.859663,
-2.721289, -3.178995, -5.311126,
3.254861, -3.178995, -5.311126,
-2.721289, -3.178995, 5.859663,
3.254861, -3.178995, 5.859663,
-2.721289, 3.480732, -5.311126,
3.254861, 3.480732, -5.311126,
-2.721289, 3.480732, 5.859663,
3.254861, 3.480732, 5.859663,
3.254861, -3.178995, -5.311126,
3.254861, 3.480732, -5.311126,
3.254861, -3.178995, 5.859663,
3.254861, 3.480732, 5.859663,
3.254861, -3.178995, -5.311126,
3.254861, -3.178995, 5.859663,
3.254861, 3.480732, -5.311126,
3.254861, 3.480732, 5.859663
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
var radius = 7.642694;
var distance = 34.00321;
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
mvMatrix.translate( -0.266786, -0.1508683, -0.2742689 );
mvMatrix.scale( 1.382735, 1.240806, 0.7397357 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00321);
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


