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
-4.374886, -0.3899135, -2.679338, 1, 0, 0, 1,
-3.000352, 0.3158521, 0.1389888, 1, 0.007843138, 0, 1,
-2.938931, -0.7874659, -0.5459107, 1, 0.01176471, 0, 1,
-2.813936, -0.3431698, -2.031988, 1, 0.01960784, 0, 1,
-2.794613, 1.258984, -0.5901564, 1, 0.02352941, 0, 1,
-2.70578, -0.1840292, -1.174691, 1, 0.03137255, 0, 1,
-2.588401, -1.570605, -3.513545, 1, 0.03529412, 0, 1,
-2.535333, -0.15366, -2.852724, 1, 0.04313726, 0, 1,
-2.493034, 0.2416735, 0.8491503, 1, 0.04705882, 0, 1,
-2.482022, 0.6835464, -0.496903, 1, 0.05490196, 0, 1,
-2.401881, -0.06374142, -1.913595, 1, 0.05882353, 0, 1,
-2.375802, 0.4925169, -2.153984, 1, 0.06666667, 0, 1,
-2.343654, 0.9657624, -1.183436, 1, 0.07058824, 0, 1,
-2.326014, 0.1054763, -2.588072, 1, 0.07843138, 0, 1,
-2.317127, 1.356481, -1.730978, 1, 0.08235294, 0, 1,
-2.312782, -0.6748177, -1.425637, 1, 0.09019608, 0, 1,
-2.276739, -0.7775484, -1.90444, 1, 0.09411765, 0, 1,
-2.261477, -1.295882, -2.06685, 1, 0.1019608, 0, 1,
-2.164696, -0.2616791, -2.489065, 1, 0.1098039, 0, 1,
-2.053127, 0.3053094, -2.316712, 1, 0.1137255, 0, 1,
-2.03286, 0.470711, -2.536041, 1, 0.1215686, 0, 1,
-2.029011, -2.258577, -3.013322, 1, 0.1254902, 0, 1,
-2.020483, -0.0959389, -1.173175, 1, 0.1333333, 0, 1,
-2.013217, 0.1056935, -2.868947, 1, 0.1372549, 0, 1,
-2.011164, -1.25942, -2.279854, 1, 0.145098, 0, 1,
-1.977663, -1.399446, -1.878496, 1, 0.1490196, 0, 1,
-1.945399, -0.826965, -0.9614308, 1, 0.1568628, 0, 1,
-1.940647, -2.073676, -2.800961, 1, 0.1607843, 0, 1,
-1.911584, -1.21871, -2.548227, 1, 0.1686275, 0, 1,
-1.882236, 0.2790327, -1.500005, 1, 0.172549, 0, 1,
-1.865635, 1.591934, -1.660261, 1, 0.1803922, 0, 1,
-1.861344, 0.04502512, -0.0731512, 1, 0.1843137, 0, 1,
-1.843265, 0.5091197, 0.145905, 1, 0.1921569, 0, 1,
-1.825557, 0.671079, -0.7043351, 1, 0.1960784, 0, 1,
-1.793116, -0.264955, -2.062607, 1, 0.2039216, 0, 1,
-1.784629, -0.5403652, -3.214774, 1, 0.2117647, 0, 1,
-1.768985, 0.461133, 0.1628352, 1, 0.2156863, 0, 1,
-1.765588, -0.8248285, -0.9719132, 1, 0.2235294, 0, 1,
-1.753378, 0.162914, -0.5446429, 1, 0.227451, 0, 1,
-1.749186, -0.4543528, -2.721304, 1, 0.2352941, 0, 1,
-1.738143, -0.4819495, -2.230326, 1, 0.2392157, 0, 1,
-1.703903, 1.016584, -0.694594, 1, 0.2470588, 0, 1,
-1.699963, 0.8086705, 0.1840343, 1, 0.2509804, 0, 1,
-1.696516, 0.9207631, -1.428213, 1, 0.2588235, 0, 1,
-1.691946, -0.7661656, -2.435672, 1, 0.2627451, 0, 1,
-1.688328, -1.05496, -2.010289, 1, 0.2705882, 0, 1,
-1.68661, -1.343437, -1.711882, 1, 0.2745098, 0, 1,
-1.676483, 0.4591165, -0.404552, 1, 0.282353, 0, 1,
-1.667341, -0.644405, -3.912269, 1, 0.2862745, 0, 1,
-1.649595, -1.110431, -3.471647, 1, 0.2941177, 0, 1,
-1.647604, 1.44884, -2.336941, 1, 0.3019608, 0, 1,
-1.643239, 1.032281, -1.061543, 1, 0.3058824, 0, 1,
-1.629303, 1.738358, 0.01906556, 1, 0.3137255, 0, 1,
-1.629246, 0.8537689, -1.45623, 1, 0.3176471, 0, 1,
-1.621252, 1.020396, -1.340266, 1, 0.3254902, 0, 1,
-1.619359, -1.101933, -1.225917, 1, 0.3294118, 0, 1,
-1.619014, -0.8338993, -2.48578, 1, 0.3372549, 0, 1,
-1.614693, -0.1349504, 0.07417496, 1, 0.3411765, 0, 1,
-1.58052, -1.458676, -2.397943, 1, 0.3490196, 0, 1,
-1.578926, 0.4804791, -2.295303, 1, 0.3529412, 0, 1,
-1.557311, -2.838415, -1.876252, 1, 0.3607843, 0, 1,
-1.549634, -0.006619167, -0.6321105, 1, 0.3647059, 0, 1,
-1.549544, 0.07967492, -0.931437, 1, 0.372549, 0, 1,
-1.548049, 1.017684, 1.251007, 1, 0.3764706, 0, 1,
-1.541478, -0.6465502, -1.555472, 1, 0.3843137, 0, 1,
-1.534595, -0.9498033, -0.876352, 1, 0.3882353, 0, 1,
-1.53025, -0.0850577, -2.009961, 1, 0.3960784, 0, 1,
-1.516824, -1.82973, -2.696319, 1, 0.4039216, 0, 1,
-1.502998, -0.6502748, -3.019135, 1, 0.4078431, 0, 1,
-1.497692, 0.02822334, -2.849758, 1, 0.4156863, 0, 1,
-1.489265, 0.5712303, -0.03333072, 1, 0.4196078, 0, 1,
-1.47667, -0.6350414, -0.4328212, 1, 0.427451, 0, 1,
-1.471274, 0.6991829, -1.0559, 1, 0.4313726, 0, 1,
-1.469263, -0.5196906, -1.956696, 1, 0.4392157, 0, 1,
-1.459732, 1.338866, -1.222147, 1, 0.4431373, 0, 1,
-1.457987, 0.2464229, -2.888227, 1, 0.4509804, 0, 1,
-1.452315, 0.002382984, -3.806111, 1, 0.454902, 0, 1,
-1.448838, -0.4073396, -2.713148, 1, 0.4627451, 0, 1,
-1.442184, 0.5050876, -1.672319, 1, 0.4666667, 0, 1,
-1.441687, -1.651976, -1.137598, 1, 0.4745098, 0, 1,
-1.437675, 1.199396, -0.3770036, 1, 0.4784314, 0, 1,
-1.436315, 0.2379618, -0.5316883, 1, 0.4862745, 0, 1,
-1.423863, -1.006812, -1.408523, 1, 0.4901961, 0, 1,
-1.418923, 1.120761, 0.1147217, 1, 0.4980392, 0, 1,
-1.418269, -0.8600988, -1.907048, 1, 0.5058824, 0, 1,
-1.416063, -0.4264316, -3.518421, 1, 0.509804, 0, 1,
-1.408422, 0.4999254, -2.394571, 1, 0.5176471, 0, 1,
-1.378242, -0.7216752, -2.064993, 1, 0.5215687, 0, 1,
-1.369197, -0.057623, -1.342325, 1, 0.5294118, 0, 1,
-1.366835, 0.06731118, 1.431733, 1, 0.5333334, 0, 1,
-1.358945, 0.3295063, -1.085448, 1, 0.5411765, 0, 1,
-1.355875, 2.171575, -0.3219622, 1, 0.5450981, 0, 1,
-1.354946, 0.560094, -1.943862, 1, 0.5529412, 0, 1,
-1.352073, 0.3861771, -2.490646, 1, 0.5568628, 0, 1,
-1.348387, -2.830994, -3.38631, 1, 0.5647059, 0, 1,
-1.341775, 0.4898676, -1.791417, 1, 0.5686275, 0, 1,
-1.334287, 0.4245057, -1.538826, 1, 0.5764706, 0, 1,
-1.332463, 0.1704189, 0.2951505, 1, 0.5803922, 0, 1,
-1.331948, 0.7965168, -1.136685, 1, 0.5882353, 0, 1,
-1.331864, 0.239718, -0.5778286, 1, 0.5921569, 0, 1,
-1.326825, 1.141327, -0.6564733, 1, 0.6, 0, 1,
-1.314897, 1.026068, -1.224121, 1, 0.6078432, 0, 1,
-1.311406, -0.5068017, -1.170421, 1, 0.6117647, 0, 1,
-1.294377, 0.7828875, -1.336973, 1, 0.6196079, 0, 1,
-1.292407, -2.100032, -1.160359, 1, 0.6235294, 0, 1,
-1.291284, 0.1037973, -2.140612, 1, 0.6313726, 0, 1,
-1.290805, 2.308363, -2.171756, 1, 0.6352941, 0, 1,
-1.290176, 1.334031, 0.9603058, 1, 0.6431373, 0, 1,
-1.278116, 0.8196433, 0.07075027, 1, 0.6470588, 0, 1,
-1.258536, 0.4823184, -1.808221, 1, 0.654902, 0, 1,
-1.257614, 0.292075, -2.44775, 1, 0.6588235, 0, 1,
-1.255386, -1.016984, -2.439118, 1, 0.6666667, 0, 1,
-1.254861, 0.3111941, -2.089575, 1, 0.6705883, 0, 1,
-1.249163, -0.1251097, -1.540225, 1, 0.6784314, 0, 1,
-1.247188, -1.35405, -2.384181, 1, 0.682353, 0, 1,
-1.24484, -1.111263, -2.566442, 1, 0.6901961, 0, 1,
-1.235341, -0.07142255, -2.31057, 1, 0.6941177, 0, 1,
-1.223496, -0.6927009, -0.5055208, 1, 0.7019608, 0, 1,
-1.216383, 0.9262882, 0.7563099, 1, 0.7098039, 0, 1,
-1.216365, -0.3662814, -1.812125, 1, 0.7137255, 0, 1,
-1.207736, 0.0008248965, -1.784978, 1, 0.7215686, 0, 1,
-1.207306, -0.7063078, -3.306592, 1, 0.7254902, 0, 1,
-1.205132, -0.1469493, -0.256261, 1, 0.7333333, 0, 1,
-1.203882, 0.5188002, -0.6436778, 1, 0.7372549, 0, 1,
-1.20281, 0.4573909, -3.222171, 1, 0.7450981, 0, 1,
-1.20205, 1.083651, -1.190825, 1, 0.7490196, 0, 1,
-1.19448, 1.218519, -1.959821, 1, 0.7568628, 0, 1,
-1.192808, 0.4074191, -0.5909855, 1, 0.7607843, 0, 1,
-1.1911, -0.03216868, -0.2799098, 1, 0.7686275, 0, 1,
-1.190865, 1.59007, -0.5793532, 1, 0.772549, 0, 1,
-1.1847, 0.004761705, -1.5569, 1, 0.7803922, 0, 1,
-1.184121, 0.5857242, -1.439577, 1, 0.7843137, 0, 1,
-1.176333, -0.2161954, -2.040744, 1, 0.7921569, 0, 1,
-1.172212, -2.190654, -4.72323, 1, 0.7960784, 0, 1,
-1.167585, -1.475237, -1.235652, 1, 0.8039216, 0, 1,
-1.164428, -0.1221856, -0.3153471, 1, 0.8117647, 0, 1,
-1.163639, 0.04619544, -1.233466, 1, 0.8156863, 0, 1,
-1.162661, 0.8050634, -2.273285, 1, 0.8235294, 0, 1,
-1.160966, -0.8185196, -1.763092, 1, 0.827451, 0, 1,
-1.154839, 0.7641649, -1.505709, 1, 0.8352941, 0, 1,
-1.153675, 1.057195, -0.7697612, 1, 0.8392157, 0, 1,
-1.147708, -0.136193, -1.602435, 1, 0.8470588, 0, 1,
-1.138121, 0.8037908, -0.2518977, 1, 0.8509804, 0, 1,
-1.131632, -1.1508, -5.402317, 1, 0.8588235, 0, 1,
-1.123393, 0.341832, -2.262055, 1, 0.8627451, 0, 1,
-1.12211, 0.2000075, -0.3265143, 1, 0.8705882, 0, 1,
-1.117646, -1.251676, -2.143766, 1, 0.8745098, 0, 1,
-1.113511, -0.07530045, 0.2758316, 1, 0.8823529, 0, 1,
-1.112148, -0.1969585, -2.705292, 1, 0.8862745, 0, 1,
-1.108714, -0.02198396, -1.545847, 1, 0.8941177, 0, 1,
-1.106037, -0.3193627, -1.712642, 1, 0.8980392, 0, 1,
-1.097208, -2.13122, -4.148847, 1, 0.9058824, 0, 1,
-1.096828, 0.2643008, -1.610487, 1, 0.9137255, 0, 1,
-1.096443, 0.02962762, -3.070007, 1, 0.9176471, 0, 1,
-1.085472, -0.3411204, 0.488828, 1, 0.9254902, 0, 1,
-1.085243, -0.3784747, -1.770208, 1, 0.9294118, 0, 1,
-1.079636, -0.3462225, -3.423039, 1, 0.9372549, 0, 1,
-1.076117, -0.5601264, -0.2164713, 1, 0.9411765, 0, 1,
-1.069663, -0.4773892, -3.019607, 1, 0.9490196, 0, 1,
-1.067891, -0.3185865, -1.369988, 1, 0.9529412, 0, 1,
-1.067568, 1.124138, -0.2252205, 1, 0.9607843, 0, 1,
-1.061956, 1.026208, -0.5330355, 1, 0.9647059, 0, 1,
-1.058987, -0.3835707, -1.975277, 1, 0.972549, 0, 1,
-1.057092, 0.08159974, -1.350356, 1, 0.9764706, 0, 1,
-1.054044, 0.9115666, -1.434584, 1, 0.9843137, 0, 1,
-1.034323, 0.5773427, -2.352947, 1, 0.9882353, 0, 1,
-1.032427, 1.206836, -0.7068467, 1, 0.9960784, 0, 1,
-1.029338, 1.013583, -3.122712, 0.9960784, 1, 0, 1,
-1.027629, -0.6159821, -2.616028, 0.9921569, 1, 0, 1,
-1.022021, -0.8651391, -1.574321, 0.9843137, 1, 0, 1,
-1.016142, -0.04940743, -0.1712143, 0.9803922, 1, 0, 1,
-1.014177, -0.5410368, -1.881104, 0.972549, 1, 0, 1,
-1.001768, -1.477881, 0.08334559, 0.9686275, 1, 0, 1,
-0.9976169, 0.8289862, -1.376445, 0.9607843, 1, 0, 1,
-0.9893832, 0.07280944, -0.7399099, 0.9568627, 1, 0, 1,
-0.9881862, -0.4435807, -3.818179, 0.9490196, 1, 0, 1,
-0.9750976, 1.042323, -2.451729, 0.945098, 1, 0, 1,
-0.9731834, 0.03628818, -2.98725, 0.9372549, 1, 0, 1,
-0.9686146, -1.401289, -1.878077, 0.9333333, 1, 0, 1,
-0.9664501, 0.4920358, -2.302915, 0.9254902, 1, 0, 1,
-0.9661239, 1.13111, -0.3392024, 0.9215686, 1, 0, 1,
-0.9616224, 0.9991322, 0.2295318, 0.9137255, 1, 0, 1,
-0.957229, 1.127153, -0.8752086, 0.9098039, 1, 0, 1,
-0.9476471, 2.679662, 1.431987, 0.9019608, 1, 0, 1,
-0.9405031, -0.04222897, -1.175362, 0.8941177, 1, 0, 1,
-0.9393677, 1.772599, 0.07965959, 0.8901961, 1, 0, 1,
-0.9370733, 1.775167, -0.9352139, 0.8823529, 1, 0, 1,
-0.9361181, 0.3501289, -1.20752, 0.8784314, 1, 0, 1,
-0.9350104, -1.139144, -0.809988, 0.8705882, 1, 0, 1,
-0.934472, 0.6670598, -5.223384e-05, 0.8666667, 1, 0, 1,
-0.9291234, 0.6632371, -0.9841791, 0.8588235, 1, 0, 1,
-0.9273755, 0.1668892, -2.148906, 0.854902, 1, 0, 1,
-0.921796, -0.1431822, -2.166229, 0.8470588, 1, 0, 1,
-0.910684, 1.632807, 0.03055078, 0.8431373, 1, 0, 1,
-0.9103276, -1.501837, -1.065596, 0.8352941, 1, 0, 1,
-0.9022806, 2.192597, -1.064634, 0.8313726, 1, 0, 1,
-0.8970714, -0.2277478, -3.176729, 0.8235294, 1, 0, 1,
-0.8950216, -0.06292661, -2.134808, 0.8196079, 1, 0, 1,
-0.89494, -1.922513, -3.614352, 0.8117647, 1, 0, 1,
-0.8817281, 1.55415, -0.429711, 0.8078431, 1, 0, 1,
-0.8808597, 0.2622348, -2.49358, 0.8, 1, 0, 1,
-0.87464, 0.04016109, -1.369263, 0.7921569, 1, 0, 1,
-0.8738039, 0.4380827, -0.3083923, 0.7882353, 1, 0, 1,
-0.8694797, 0.6572167, -2.09516, 0.7803922, 1, 0, 1,
-0.8438108, 1.151446, -0.5993102, 0.7764706, 1, 0, 1,
-0.8374626, 0.4410732, -2.108964, 0.7686275, 1, 0, 1,
-0.8357413, -0.4053849, -3.402754, 0.7647059, 1, 0, 1,
-0.8335235, 0.8977859, -1.421414, 0.7568628, 1, 0, 1,
-0.8300109, -1.199543, -2.475808, 0.7529412, 1, 0, 1,
-0.8258452, 0.2652607, -3.764984, 0.7450981, 1, 0, 1,
-0.8244237, -1.290356, -1.290299, 0.7411765, 1, 0, 1,
-0.8216837, 0.4649621, -0.6694359, 0.7333333, 1, 0, 1,
-0.8121845, 0.3687263, -1.98979, 0.7294118, 1, 0, 1,
-0.8077737, -0.1182733, -1.987624, 0.7215686, 1, 0, 1,
-0.8069093, -0.2753772, -0.4715637, 0.7176471, 1, 0, 1,
-0.8046081, 0.5532452, 0.03372104, 0.7098039, 1, 0, 1,
-0.7905137, -0.09000488, 0.8775206, 0.7058824, 1, 0, 1,
-0.7867258, 0.06538563, -1.217021, 0.6980392, 1, 0, 1,
-0.7829902, 0.3626712, -1.977944, 0.6901961, 1, 0, 1,
-0.7779587, 1.270274, -0.4872442, 0.6862745, 1, 0, 1,
-0.7711285, 0.1020691, -1.546762, 0.6784314, 1, 0, 1,
-0.7607197, 0.01950424, -2.31301, 0.6745098, 1, 0, 1,
-0.7591351, 0.2476369, -1.041746, 0.6666667, 1, 0, 1,
-0.7589682, -0.3103758, -2.284761, 0.6627451, 1, 0, 1,
-0.7562519, -0.4667917, -1.622937, 0.654902, 1, 0, 1,
-0.7543815, 1.584102, -0.4321552, 0.6509804, 1, 0, 1,
-0.7512619, -0.4101442, -2.67657, 0.6431373, 1, 0, 1,
-0.7399014, 0.00249295, -1.512387, 0.6392157, 1, 0, 1,
-0.7372738, -0.9025427, -1.815729, 0.6313726, 1, 0, 1,
-0.7365831, 0.6588797, -1.781283, 0.627451, 1, 0, 1,
-0.7337376, -0.9129041, -1.457097, 0.6196079, 1, 0, 1,
-0.7293386, -0.7476422, -2.114262, 0.6156863, 1, 0, 1,
-0.7275673, 0.380999, -0.1488664, 0.6078432, 1, 0, 1,
-0.7237832, -0.08332774, -2.272795, 0.6039216, 1, 0, 1,
-0.7206916, 1.187155, -1.135636, 0.5960785, 1, 0, 1,
-0.7201405, 0.1147739, -0.1648761, 0.5882353, 1, 0, 1,
-0.7140345, -0.570154, -1.503096, 0.5843138, 1, 0, 1,
-0.7081152, -0.9168673, -3.256625, 0.5764706, 1, 0, 1,
-0.7017234, -1.174469, -1.268664, 0.572549, 1, 0, 1,
-0.7013355, 0.7576078, -1.075407, 0.5647059, 1, 0, 1,
-0.6977237, -0.7401006, -1.880824, 0.5607843, 1, 0, 1,
-0.6942601, 1.56684, 1.243826, 0.5529412, 1, 0, 1,
-0.6933375, 0.3205308, 0.5873127, 0.5490196, 1, 0, 1,
-0.6928393, 0.1037565, 0.1393821, 0.5411765, 1, 0, 1,
-0.6876742, 0.01579014, -2.178322, 0.5372549, 1, 0, 1,
-0.6867194, 1.258968, -1.580979, 0.5294118, 1, 0, 1,
-0.685977, -0.2083357, -1.584104, 0.5254902, 1, 0, 1,
-0.6857362, 0.2541839, -0.468391, 0.5176471, 1, 0, 1,
-0.6854467, 1.20461, -0.8063776, 0.5137255, 1, 0, 1,
-0.6836242, -1.794155, -3.005789, 0.5058824, 1, 0, 1,
-0.6800506, -0.8473962, -2.57045, 0.5019608, 1, 0, 1,
-0.6771466, 2.171632, 0.3773476, 0.4941176, 1, 0, 1,
-0.6721472, -1.303753, -5.147075, 0.4862745, 1, 0, 1,
-0.6608599, 0.610859, -1.036029, 0.4823529, 1, 0, 1,
-0.6565855, -0.7141702, 0.05277811, 0.4745098, 1, 0, 1,
-0.6504337, 0.875178, -1.429221, 0.4705882, 1, 0, 1,
-0.6488959, 2.177527, -0.5562125, 0.4627451, 1, 0, 1,
-0.6459917, -2.006446, -2.151052, 0.4588235, 1, 0, 1,
-0.644299, 1.336006, 0.6809101, 0.4509804, 1, 0, 1,
-0.6433904, -0.3171088, -1.804757, 0.4470588, 1, 0, 1,
-0.6424606, 0.05078764, 0.1375867, 0.4392157, 1, 0, 1,
-0.6407264, -1.336378, -2.459751, 0.4352941, 1, 0, 1,
-0.6399355, 0.3284118, -3.090002, 0.427451, 1, 0, 1,
-0.6375044, -1.035446, -1.467003, 0.4235294, 1, 0, 1,
-0.6363614, -1.483248, -4.961893, 0.4156863, 1, 0, 1,
-0.6326614, 0.8291822, -1.222329, 0.4117647, 1, 0, 1,
-0.6278228, 0.5465596, 0.7229861, 0.4039216, 1, 0, 1,
-0.6236182, 0.1301032, -0.3881216, 0.3960784, 1, 0, 1,
-0.621925, 2.32996, -3.508242, 0.3921569, 1, 0, 1,
-0.6216208, 0.9457408, -1.437257, 0.3843137, 1, 0, 1,
-0.6207677, -0.3005927, -0.5398966, 0.3803922, 1, 0, 1,
-0.6196871, 0.534306, -2.631032, 0.372549, 1, 0, 1,
-0.6126816, -1.352409, -3.800433, 0.3686275, 1, 0, 1,
-0.611366, -1.053588, -2.606263, 0.3607843, 1, 0, 1,
-0.6104169, 0.1498205, -1.011757, 0.3568628, 1, 0, 1,
-0.6074131, 0.6492714, 0.8874946, 0.3490196, 1, 0, 1,
-0.6069416, -1.85877, -1.758281, 0.345098, 1, 0, 1,
-0.6041968, -0.05452704, -1.945874, 0.3372549, 1, 0, 1,
-0.6036357, 0.775419, 0.0201531, 0.3333333, 1, 0, 1,
-0.6001459, -1.695461, -3.271032, 0.3254902, 1, 0, 1,
-0.5994123, 0.8665619, -1.664831, 0.3215686, 1, 0, 1,
-0.5986328, -1.242077, -2.281069, 0.3137255, 1, 0, 1,
-0.5916066, -0.2935879, -1.529861, 0.3098039, 1, 0, 1,
-0.5900546, 0.1835103, -1.482871, 0.3019608, 1, 0, 1,
-0.5887609, -1.356189, -1.912437, 0.2941177, 1, 0, 1,
-0.5845112, 1.13184, -1.318625, 0.2901961, 1, 0, 1,
-0.5834559, 0.09263325, 0.09054948, 0.282353, 1, 0, 1,
-0.5816145, 1.073179, -0.4830975, 0.2784314, 1, 0, 1,
-0.5803837, 0.4491107, -1.316252, 0.2705882, 1, 0, 1,
-0.5802716, 0.05840898, -2.685207, 0.2666667, 1, 0, 1,
-0.5787943, 1.277794, 0.5743671, 0.2588235, 1, 0, 1,
-0.5768675, -0.7037717, -2.94898, 0.254902, 1, 0, 1,
-0.576305, -0.4979697, -2.217397, 0.2470588, 1, 0, 1,
-0.5731413, -0.2439259, -2.008855, 0.2431373, 1, 0, 1,
-0.5657116, 0.5078742, -0.6290042, 0.2352941, 1, 0, 1,
-0.5654537, 0.393096, -0.8173593, 0.2313726, 1, 0, 1,
-0.5654325, -1.588017, -2.471629, 0.2235294, 1, 0, 1,
-0.5632174, 1.17142, -0.7058194, 0.2196078, 1, 0, 1,
-0.5622209, -1.216261, -2.415255, 0.2117647, 1, 0, 1,
-0.561173, 0.7514156, -1.639682, 0.2078431, 1, 0, 1,
-0.5611104, -0.2672555, -1.41336, 0.2, 1, 0, 1,
-0.5594385, 1.334813, 0.3482213, 0.1921569, 1, 0, 1,
-0.5579649, 1.653141, 0.9398279, 0.1882353, 1, 0, 1,
-0.5564079, 1.315367, 0.3196398, 0.1803922, 1, 0, 1,
-0.5558943, -1.665278, -1.831931, 0.1764706, 1, 0, 1,
-0.5404379, 0.2792558, -1.982731, 0.1686275, 1, 0, 1,
-0.5401236, -1.064281, -1.812937, 0.1647059, 1, 0, 1,
-0.5363149, -0.326721, -2.022371, 0.1568628, 1, 0, 1,
-0.5251554, 0.7185436, -0.6357978, 0.1529412, 1, 0, 1,
-0.5224242, -0.1173348, -2.046769, 0.145098, 1, 0, 1,
-0.5223594, 1.033037, -1.418121, 0.1411765, 1, 0, 1,
-0.5223264, 1.543393, -0.7407957, 0.1333333, 1, 0, 1,
-0.5101938, -0.07467128, -2.347187, 0.1294118, 1, 0, 1,
-0.5010885, -0.7418124, -2.696309, 0.1215686, 1, 0, 1,
-0.4951994, -0.7468352, -3.188757, 0.1176471, 1, 0, 1,
-0.4939434, -0.462469, -1.590837, 0.1098039, 1, 0, 1,
-0.4897414, -0.4978639, -2.177838, 0.1058824, 1, 0, 1,
-0.4892155, -1.611445, -3.329564, 0.09803922, 1, 0, 1,
-0.4845895, -0.1041704, -0.4421016, 0.09019608, 1, 0, 1,
-0.478504, -1.049146, -3.319806, 0.08627451, 1, 0, 1,
-0.4750917, -0.3712713, -4.06939, 0.07843138, 1, 0, 1,
-0.4742812, -1.280323, -3.930286, 0.07450981, 1, 0, 1,
-0.4689893, -0.1306232, -1.619347, 0.06666667, 1, 0, 1,
-0.4679961, -1.137042, -2.389613, 0.0627451, 1, 0, 1,
-0.4668842, 1.552385, -1.60169, 0.05490196, 1, 0, 1,
-0.4652559, -1.186971, -3.667037, 0.05098039, 1, 0, 1,
-0.4633489, 1.174377, -1.778953, 0.04313726, 1, 0, 1,
-0.462993, 0.5878186, -0.9144951, 0.03921569, 1, 0, 1,
-0.4624385, -0.2829006, -0.6957359, 0.03137255, 1, 0, 1,
-0.462219, 1.004896, -0.3530542, 0.02745098, 1, 0, 1,
-0.4619441, -1.434019, -3.392794, 0.01960784, 1, 0, 1,
-0.4619396, -0.6875917, -1.661559, 0.01568628, 1, 0, 1,
-0.4574674, -2.527965, -3.623599, 0.007843138, 1, 0, 1,
-0.4537637, -0.6165678, -2.026255, 0.003921569, 1, 0, 1,
-0.4528635, -1.616681, -1.733537, 0, 1, 0.003921569, 1,
-0.4526139, 0.8662966, 0.08578014, 0, 1, 0.01176471, 1,
-0.4475546, -0.1143963, -3.772477, 0, 1, 0.01568628, 1,
-0.445827, 0.5026157, -2.281205, 0, 1, 0.02352941, 1,
-0.4457133, -0.462179, -1.774891, 0, 1, 0.02745098, 1,
-0.4389051, -0.9686911, -5.104949, 0, 1, 0.03529412, 1,
-0.4350906, -0.6739947, -2.086003, 0, 1, 0.03921569, 1,
-0.4335281, -0.6911331, -2.085026, 0, 1, 0.04705882, 1,
-0.4297097, 0.8609255, 0.1370111, 0, 1, 0.05098039, 1,
-0.419768, 0.3251515, -0.003859368, 0, 1, 0.05882353, 1,
-0.4194318, 0.4920033, -0.3216973, 0, 1, 0.0627451, 1,
-0.4159469, 1.38176, -0.5393462, 0, 1, 0.07058824, 1,
-0.4098107, 2.111783, -0.9506027, 0, 1, 0.07450981, 1,
-0.4091344, 0.4854721, -2.144926, 0, 1, 0.08235294, 1,
-0.4073389, -0.6990356, -2.126482, 0, 1, 0.08627451, 1,
-0.4026843, 2.174704, -0.5727199, 0, 1, 0.09411765, 1,
-0.3924105, 0.08914034, -2.630946, 0, 1, 0.1019608, 1,
-0.390861, -0.5421383, -0.8508974, 0, 1, 0.1058824, 1,
-0.3900652, 0.410872, -1.032374, 0, 1, 0.1137255, 1,
-0.3890545, -1.443744, -3.232632, 0, 1, 0.1176471, 1,
-0.3879601, 0.0002961408, -2.093379, 0, 1, 0.1254902, 1,
-0.3865668, 1.119152, -1.593579, 0, 1, 0.1294118, 1,
-0.3864752, 0.6169983, -2.551137, 0, 1, 0.1372549, 1,
-0.3857053, 0.4389478, 0.1238295, 0, 1, 0.1411765, 1,
-0.3840502, 1.173952, 2.031312, 0, 1, 0.1490196, 1,
-0.3813231, -1.992105, -3.549026, 0, 1, 0.1529412, 1,
-0.3764662, -0.9205573, -2.254768, 0, 1, 0.1607843, 1,
-0.3744783, 1.892835, 0.6118944, 0, 1, 0.1647059, 1,
-0.3742873, -1.17392, -3.21411, 0, 1, 0.172549, 1,
-0.3665221, -1.488959, -1.397495, 0, 1, 0.1764706, 1,
-0.3628081, -1.541512, -2.925254, 0, 1, 0.1843137, 1,
-0.3624646, -1.904633, -1.43306, 0, 1, 0.1882353, 1,
-0.3532288, 1.660135, -0.9044597, 0, 1, 0.1960784, 1,
-0.35199, -0.01028287, -2.859184, 0, 1, 0.2039216, 1,
-0.3487657, 1.098342, 1.841968, 0, 1, 0.2078431, 1,
-0.3481174, 0.5915343, -1.665792, 0, 1, 0.2156863, 1,
-0.3416237, -0.6065737, -3.084393, 0, 1, 0.2196078, 1,
-0.3393485, -0.8322924, -1.226115, 0, 1, 0.227451, 1,
-0.3352042, 0.455491, 0.9719086, 0, 1, 0.2313726, 1,
-0.3336504, 0.001733827, -2.333277, 0, 1, 0.2392157, 1,
-0.3332085, -0.374831, -1.473469, 0, 1, 0.2431373, 1,
-0.3260752, 0.4272669, 1.206077, 0, 1, 0.2509804, 1,
-0.325303, -0.2677737, -0.8592836, 0, 1, 0.254902, 1,
-0.3235456, -0.6639446, -1.794195, 0, 1, 0.2627451, 1,
-0.3211794, -0.08837882, -1.918744, 0, 1, 0.2666667, 1,
-0.3202043, 0.5306307, -1.350498, 0, 1, 0.2745098, 1,
-0.3156752, -1.240381, -3.146523, 0, 1, 0.2784314, 1,
-0.3141661, -0.9799999, -1.467141, 0, 1, 0.2862745, 1,
-0.3133812, 0.2999632, -1.455109, 0, 1, 0.2901961, 1,
-0.3126838, -0.1381673, -1.046535, 0, 1, 0.2980392, 1,
-0.3102593, 0.2355639, 1.037671, 0, 1, 0.3058824, 1,
-0.3010921, 0.08924894, -0.8796361, 0, 1, 0.3098039, 1,
-0.2994712, 0.732991, -0.6309885, 0, 1, 0.3176471, 1,
-0.2986261, -0.1354863, -3.4889, 0, 1, 0.3215686, 1,
-0.2967859, 0.870378, -0.04676302, 0, 1, 0.3294118, 1,
-0.293628, -0.6395326, -3.61327, 0, 1, 0.3333333, 1,
-0.2914882, 1.254027, -0.9230778, 0, 1, 0.3411765, 1,
-0.2850959, -1.136337, -3.120298, 0, 1, 0.345098, 1,
-0.2833842, -0.3611197, -3.998045, 0, 1, 0.3529412, 1,
-0.2824501, -0.2272212, -2.626274, 0, 1, 0.3568628, 1,
-0.2780635, 0.3925518, -1.564444, 0, 1, 0.3647059, 1,
-0.2704754, 0.1121878, -0.5413384, 0, 1, 0.3686275, 1,
-0.2699649, -0.2285362, -1.652635, 0, 1, 0.3764706, 1,
-0.2674775, 1.039243, 0.1121152, 0, 1, 0.3803922, 1,
-0.2644336, 0.2996695, -1.115201, 0, 1, 0.3882353, 1,
-0.2625391, -0.4512091, -0.9466944, 0, 1, 0.3921569, 1,
-0.2621495, 1.930901, -2.188979, 0, 1, 0.4, 1,
-0.2585432, 0.06594951, -1.32757, 0, 1, 0.4078431, 1,
-0.247541, 0.6115565, 1.88285, 0, 1, 0.4117647, 1,
-0.2434153, 0.09190802, -1.406542, 0, 1, 0.4196078, 1,
-0.242331, 0.8159124, 1.012431, 0, 1, 0.4235294, 1,
-0.2400029, -0.06716986, -1.880103, 0, 1, 0.4313726, 1,
-0.2301952, 0.1854053, 0.6526477, 0, 1, 0.4352941, 1,
-0.2297217, 0.4121578, 0.9949107, 0, 1, 0.4431373, 1,
-0.2254714, 1.857676, 0.3423637, 0, 1, 0.4470588, 1,
-0.2242074, 0.2912069, -0.6919557, 0, 1, 0.454902, 1,
-0.2231719, 0.09142893, -0.6741089, 0, 1, 0.4588235, 1,
-0.221763, 0.874599, 1.323945, 0, 1, 0.4666667, 1,
-0.2193965, -0.1117449, -1.743753, 0, 1, 0.4705882, 1,
-0.2192492, 1.326903, 1.607054, 0, 1, 0.4784314, 1,
-0.2096371, 0.1658617, -1.825626, 0, 1, 0.4823529, 1,
-0.2081406, 0.6502183, -0.5397848, 0, 1, 0.4901961, 1,
-0.2072084, -0.627982, -2.84254, 0, 1, 0.4941176, 1,
-0.2067096, -0.7759557, -2.60765, 0, 1, 0.5019608, 1,
-0.199801, 0.0605929, -1.695021, 0, 1, 0.509804, 1,
-0.1988608, 0.2663519, -1.161501, 0, 1, 0.5137255, 1,
-0.1929903, -0.1464487, -2.484412, 0, 1, 0.5215687, 1,
-0.1875473, 0.6041953, -0.612479, 0, 1, 0.5254902, 1,
-0.1850182, -0.3395737, -2.001973, 0, 1, 0.5333334, 1,
-0.1789259, 0.7061039, 1.668227, 0, 1, 0.5372549, 1,
-0.1787282, 2.879347, 0.354269, 0, 1, 0.5450981, 1,
-0.1775292, -3.024196, -2.735207, 0, 1, 0.5490196, 1,
-0.1753434, 0.3621117, -0.979807, 0, 1, 0.5568628, 1,
-0.1747233, -1.59095, -3.124809, 0, 1, 0.5607843, 1,
-0.1737008, 0.413023, -2.335383, 0, 1, 0.5686275, 1,
-0.1697289, 0.5226859, 0.9556544, 0, 1, 0.572549, 1,
-0.1600563, -1.540736, -1.975059, 0, 1, 0.5803922, 1,
-0.1579125, -1.270006, -3.703085, 0, 1, 0.5843138, 1,
-0.1568457, -1.626643, -1.830529, 0, 1, 0.5921569, 1,
-0.1555777, -0.8955958, -2.900605, 0, 1, 0.5960785, 1,
-0.1506315, 1.091692, -0.7722389, 0, 1, 0.6039216, 1,
-0.1500321, -1.065055, -2.576247, 0, 1, 0.6117647, 1,
-0.1492381, -0.04720045, -2.045085, 0, 1, 0.6156863, 1,
-0.1429286, -0.59198, -4.160499, 0, 1, 0.6235294, 1,
-0.1428521, -0.2601932, -0.805512, 0, 1, 0.627451, 1,
-0.1424637, 1.061791, -0.06858306, 0, 1, 0.6352941, 1,
-0.1412849, -0.426955, -4.514439, 0, 1, 0.6392157, 1,
-0.1379023, -1.465702, -3.374413, 0, 1, 0.6470588, 1,
-0.1300274, -0.5002481, -2.313873, 0, 1, 0.6509804, 1,
-0.1294656, -1.400666, -2.942105, 0, 1, 0.6588235, 1,
-0.1287887, -0.4455378, -2.780315, 0, 1, 0.6627451, 1,
-0.1279354, -0.1708273, -2.401742, 0, 1, 0.6705883, 1,
-0.1275664, -1.025882, -2.789088, 0, 1, 0.6745098, 1,
-0.1233842, -0.9376889, -5.182224, 0, 1, 0.682353, 1,
-0.1232746, 0.6915206, 1.073933, 0, 1, 0.6862745, 1,
-0.11878, 0.6538447, -0.9502054, 0, 1, 0.6941177, 1,
-0.1174566, 2.257932, -0.5254443, 0, 1, 0.7019608, 1,
-0.1158255, -1.317934, -2.976543, 0, 1, 0.7058824, 1,
-0.1107651, 0.7685292, -0.5557505, 0, 1, 0.7137255, 1,
-0.1095367, 1.021861, 0.370579, 0, 1, 0.7176471, 1,
-0.1041029, -1.315715, -2.515612, 0, 1, 0.7254902, 1,
-0.103408, -0.7584702, -4.424977, 0, 1, 0.7294118, 1,
-0.09917229, 0.2443786, -1.78757, 0, 1, 0.7372549, 1,
-0.09877901, 0.6423516, 0.03792177, 0, 1, 0.7411765, 1,
-0.09836771, -1.278824, -1.647637, 0, 1, 0.7490196, 1,
-0.09561247, 0.3201856, 0.2501192, 0, 1, 0.7529412, 1,
-0.09453167, 0.5802673, 1.321722, 0, 1, 0.7607843, 1,
-0.09391332, -1.403107, -0.3509166, 0, 1, 0.7647059, 1,
-0.09193198, -0.8794267, -2.103219, 0, 1, 0.772549, 1,
-0.08971, -0.1736548, -3.546593, 0, 1, 0.7764706, 1,
-0.08893047, 0.2277778, 0.0197785, 0, 1, 0.7843137, 1,
-0.08881103, 1.593294, 0.08798043, 0, 1, 0.7882353, 1,
-0.08852684, -0.5253593, -3.444461, 0, 1, 0.7960784, 1,
-0.08708549, 0.01166639, -1.370433, 0, 1, 0.8039216, 1,
-0.08702545, -2.073936, -2.234395, 0, 1, 0.8078431, 1,
-0.08643536, -0.2211075, -3.059832, 0, 1, 0.8156863, 1,
-0.08261935, -0.04945548, -1.484848, 0, 1, 0.8196079, 1,
-0.08026721, -1.527199, -2.245219, 0, 1, 0.827451, 1,
-0.07915092, -0.06844573, -3.955766, 0, 1, 0.8313726, 1,
-0.0725042, -0.6518674, -2.366825, 0, 1, 0.8392157, 1,
-0.0715346, 0.662149, -1.991721, 0, 1, 0.8431373, 1,
-0.06930389, -0.6618325, -2.877203, 0, 1, 0.8509804, 1,
-0.06522351, 1.402705, 1.391155, 0, 1, 0.854902, 1,
-0.0644133, -0.3240767, -2.488298, 0, 1, 0.8627451, 1,
-0.06370666, -2.000573, -3.328496, 0, 1, 0.8666667, 1,
-0.0611774, 0.1529494, 0.6010327, 0, 1, 0.8745098, 1,
-0.05990724, -0.7226232, -1.831705, 0, 1, 0.8784314, 1,
-0.05555677, 0.718868, -0.1101258, 0, 1, 0.8862745, 1,
-0.05430621, 0.1993878, -0.4433352, 0, 1, 0.8901961, 1,
-0.05033724, -0.5012526, -2.261796, 0, 1, 0.8980392, 1,
-0.04907016, 0.1325044, -1.430434, 0, 1, 0.9058824, 1,
-0.04192986, -0.2832455, -5.830699, 0, 1, 0.9098039, 1,
-0.04176391, 1.173097, -0.04995604, 0, 1, 0.9176471, 1,
-0.03682295, 0.7777414, -0.02342882, 0, 1, 0.9215686, 1,
-0.02918411, -0.3638923, -2.845922, 0, 1, 0.9294118, 1,
-0.02565825, -0.004628678, -1.633359, 0, 1, 0.9333333, 1,
-0.02426106, 0.2292363, -0.8810483, 0, 1, 0.9411765, 1,
-0.02422446, 0.5633256, 0.8950103, 0, 1, 0.945098, 1,
-0.02379776, 0.2113264, 0.3330397, 0, 1, 0.9529412, 1,
-0.02316906, -0.9963771, -2.671895, 0, 1, 0.9568627, 1,
-0.02270564, 1.563572, -0.02592161, 0, 1, 0.9647059, 1,
-0.01715664, 1.594926, 0.7177386, 0, 1, 0.9686275, 1,
-0.008497586, 0.8653294, 0.3814164, 0, 1, 0.9764706, 1,
-0.004877881, -0.9379693, -4.198487, 0, 1, 0.9803922, 1,
-0.001826042, -0.3073473, -3.468203, 0, 1, 0.9882353, 1,
0.001028431, -0.5104424, 2.017247, 0, 1, 0.9921569, 1,
0.01233653, -0.6132701, 1.431983, 0, 1, 1, 1,
0.0137637, -2.119619, 4.963066, 0, 0.9921569, 1, 1,
0.01408942, 1.0202, 0.2137143, 0, 0.9882353, 1, 1,
0.01677932, -0.3754365, 4.381796, 0, 0.9803922, 1, 1,
0.01852915, -1.047582, 2.278993, 0, 0.9764706, 1, 1,
0.02305675, -0.1347527, 3.084665, 0, 0.9686275, 1, 1,
0.02381473, -2.053824, 3.763188, 0, 0.9647059, 1, 1,
0.02540667, 0.5489766, -1.692167, 0, 0.9568627, 1, 1,
0.02569212, 0.6278954, 0.6637598, 0, 0.9529412, 1, 1,
0.02968756, -1.196911, 3.680578, 0, 0.945098, 1, 1,
0.03193076, 1.912216, 0.9182733, 0, 0.9411765, 1, 1,
0.03800678, 0.2763959, -0.1200423, 0, 0.9333333, 1, 1,
0.03935112, 0.2177783, 0.8166572, 0, 0.9294118, 1, 1,
0.04191143, 1.424035, -0.5682488, 0, 0.9215686, 1, 1,
0.0422716, -1.132758, 4.990765, 0, 0.9176471, 1, 1,
0.042293, 0.1127369, 0.05509275, 0, 0.9098039, 1, 1,
0.04492247, -1.764514, 3.119587, 0, 0.9058824, 1, 1,
0.04670105, 2.573435, 0.2893704, 0, 0.8980392, 1, 1,
0.04718842, -0.06008159, 2.195188, 0, 0.8901961, 1, 1,
0.04853673, -0.0100148, 2.221335, 0, 0.8862745, 1, 1,
0.04868257, 0.1222804, -0.1403676, 0, 0.8784314, 1, 1,
0.0492794, -0.7597626, 2.107763, 0, 0.8745098, 1, 1,
0.04947435, -0.4537709, 3.79059, 0, 0.8666667, 1, 1,
0.0516277, -0.7882403, 5.259539, 0, 0.8627451, 1, 1,
0.05188258, 0.425842, -0.105572, 0, 0.854902, 1, 1,
0.06049992, -0.9152434, 4.489254, 0, 0.8509804, 1, 1,
0.064487, 1.072504, 1.807377, 0, 0.8431373, 1, 1,
0.0667189, -0.4568331, 3.153832, 0, 0.8392157, 1, 1,
0.06901023, -2.113668, 3.470443, 0, 0.8313726, 1, 1,
0.07138288, -1.467251, 3.527215, 0, 0.827451, 1, 1,
0.0724615, 0.7248231, -0.4728774, 0, 0.8196079, 1, 1,
0.07420635, 0.7836435, -1.408501, 0, 0.8156863, 1, 1,
0.07652712, -1.076535, 5.128475, 0, 0.8078431, 1, 1,
0.07893208, 1.07952, 2.056787, 0, 0.8039216, 1, 1,
0.08334171, 0.5725552, 0.704621, 0, 0.7960784, 1, 1,
0.08551306, -0.194561, 3.675284, 0, 0.7882353, 1, 1,
0.08653683, 1.29967, -0.06244327, 0, 0.7843137, 1, 1,
0.08671535, -0.3780289, 1.294948, 0, 0.7764706, 1, 1,
0.08769865, -0.9986172, 3.514546, 0, 0.772549, 1, 1,
0.0879124, 0.8592357, 0.6706002, 0, 0.7647059, 1, 1,
0.08869656, 0.4343524, -0.007902177, 0, 0.7607843, 1, 1,
0.0919756, 0.06508991, 0.5448041, 0, 0.7529412, 1, 1,
0.09281778, -1.259581, 3.791633, 0, 0.7490196, 1, 1,
0.09299419, -0.469252, 4.057171, 0, 0.7411765, 1, 1,
0.0941572, 0.407949, 1.857906, 0, 0.7372549, 1, 1,
0.09583542, -0.7416319, 2.026441, 0, 0.7294118, 1, 1,
0.09613743, 0.1598061, 0.1736548, 0, 0.7254902, 1, 1,
0.09993042, -0.6225437, 3.715083, 0, 0.7176471, 1, 1,
0.1016335, 0.566061, -0.6307098, 0, 0.7137255, 1, 1,
0.1062679, 0.4351692, 1.595765, 0, 0.7058824, 1, 1,
0.1079182, 0.2225893, 0.8658592, 0, 0.6980392, 1, 1,
0.1094995, -0.7445195, 0.9469489, 0, 0.6941177, 1, 1,
0.1095242, 0.724165, 1.35339, 0, 0.6862745, 1, 1,
0.1117355, 0.3220763, 0.0688205, 0, 0.682353, 1, 1,
0.1121988, -1.999901, 6.148489, 0, 0.6745098, 1, 1,
0.1122311, 0.5353284, 0.1599233, 0, 0.6705883, 1, 1,
0.1209304, 0.05325244, 1.295409, 0, 0.6627451, 1, 1,
0.1270549, -0.4288352, 3.254791, 0, 0.6588235, 1, 1,
0.1285758, 1.650306, -0.7728628, 0, 0.6509804, 1, 1,
0.1286196, 1.579427, -1.411546, 0, 0.6470588, 1, 1,
0.1347557, 0.2608707, 1.590713, 0, 0.6392157, 1, 1,
0.1496003, -0.05193172, 1.614196, 0, 0.6352941, 1, 1,
0.1506378, -0.583642, 5.673912, 0, 0.627451, 1, 1,
0.1528517, 0.6556609, -0.4769073, 0, 0.6235294, 1, 1,
0.154503, -1.182722, 4.190427, 0, 0.6156863, 1, 1,
0.1553131, 0.8515933, -0.2988577, 0, 0.6117647, 1, 1,
0.1563426, 0.842746, -0.828147, 0, 0.6039216, 1, 1,
0.1577842, 0.351222, -0.09751861, 0, 0.5960785, 1, 1,
0.1579093, -0.6544253, 3.469687, 0, 0.5921569, 1, 1,
0.1623761, -2.096597, 2.330464, 0, 0.5843138, 1, 1,
0.1649857, 2.02165, 1.093652, 0, 0.5803922, 1, 1,
0.1654411, 1.234242, 0.8909124, 0, 0.572549, 1, 1,
0.1664228, 0.6037839, -1.576687, 0, 0.5686275, 1, 1,
0.1672135, -1.28656, 2.014433, 0, 0.5607843, 1, 1,
0.1710204, 0.2715825, 0.803884, 0, 0.5568628, 1, 1,
0.1728199, -0.2423534, 2.896829, 0, 0.5490196, 1, 1,
0.1739716, -0.3012815, 2.290153, 0, 0.5450981, 1, 1,
0.174064, 1.408705, 0.3869197, 0, 0.5372549, 1, 1,
0.1775939, 0.4518553, 1.579808, 0, 0.5333334, 1, 1,
0.178902, -1.395385, 3.457377, 0, 0.5254902, 1, 1,
0.1793653, -0.7818357, 0.8855975, 0, 0.5215687, 1, 1,
0.1796271, 1.002476, -1.625474, 0, 0.5137255, 1, 1,
0.181404, -0.4027763, 1.169942, 0, 0.509804, 1, 1,
0.1815402, 1.886246, -0.6861622, 0, 0.5019608, 1, 1,
0.1830022, 1.036546, -0.6672668, 0, 0.4941176, 1, 1,
0.1852395, 0.1803385, -0.2291516, 0, 0.4901961, 1, 1,
0.1858946, 0.7423173, 1.574347, 0, 0.4823529, 1, 1,
0.188535, -0.08178993, 1.192627, 0, 0.4784314, 1, 1,
0.191354, -0.2978807, 3.607973, 0, 0.4705882, 1, 1,
0.1919414, -0.985581, 3.659655, 0, 0.4666667, 1, 1,
0.1947366, -0.2355656, 2.887539, 0, 0.4588235, 1, 1,
0.1957945, -0.1972997, 2.631764, 0, 0.454902, 1, 1,
0.1971144, 1.37796, 0.7326428, 0, 0.4470588, 1, 1,
0.2041878, -0.7356992, 3.472813, 0, 0.4431373, 1, 1,
0.2098842, 0.8498396, -0.7228043, 0, 0.4352941, 1, 1,
0.210303, 0.9933035, 0.6996336, 0, 0.4313726, 1, 1,
0.2107121, 0.02126647, 2.270466, 0, 0.4235294, 1, 1,
0.213665, 0.4658441, -0.6090907, 0, 0.4196078, 1, 1,
0.2158675, 0.230005, 1.946351, 0, 0.4117647, 1, 1,
0.2169487, 1.241762, -0.06821031, 0, 0.4078431, 1, 1,
0.2196802, 0.6463331, 0.8442265, 0, 0.4, 1, 1,
0.2212023, -1.571672, 2.729818, 0, 0.3921569, 1, 1,
0.2295733, 0.6492823, 1.475464, 0, 0.3882353, 1, 1,
0.2304211, 0.8720647, -1.281772, 0, 0.3803922, 1, 1,
0.2332636, 0.3350582, -0.1700279, 0, 0.3764706, 1, 1,
0.236424, 1.512103, 1.484433, 0, 0.3686275, 1, 1,
0.2374949, -0.09068627, 1.916497, 0, 0.3647059, 1, 1,
0.246535, -0.7682444, 4.001012, 0, 0.3568628, 1, 1,
0.2544355, -0.2569823, 2.80898, 0, 0.3529412, 1, 1,
0.2555136, 0.08536565, 1.323476, 0, 0.345098, 1, 1,
0.2586878, 0.7581606, -0.4031138, 0, 0.3411765, 1, 1,
0.2592578, -0.1512864, 2.581802, 0, 0.3333333, 1, 1,
0.2627851, -1.993892, 2.467497, 0, 0.3294118, 1, 1,
0.2630213, 0.1431134, 1.529893, 0, 0.3215686, 1, 1,
0.2642594, -1.611395, 3.491902, 0, 0.3176471, 1, 1,
0.2664, 0.9388025, 0.9145364, 0, 0.3098039, 1, 1,
0.2696066, -2.05873, 2.958686, 0, 0.3058824, 1, 1,
0.2699286, 0.9305428, -1.286748, 0, 0.2980392, 1, 1,
0.2720433, -1.379751, 3.432565, 0, 0.2901961, 1, 1,
0.2749755, 0.3822834, 0.2676872, 0, 0.2862745, 1, 1,
0.2751341, -1.359118, 4.419856, 0, 0.2784314, 1, 1,
0.2845556, 0.5153289, 0.7648436, 0, 0.2745098, 1, 1,
0.2885831, 0.8452306, -0.8629367, 0, 0.2666667, 1, 1,
0.2885973, -1.252326, 0.9395159, 0, 0.2627451, 1, 1,
0.2897312, 0.3162793, 2.783039, 0, 0.254902, 1, 1,
0.2922225, 1.055893, 1.446765, 0, 0.2509804, 1, 1,
0.2956766, -0.2416683, 2.867033, 0, 0.2431373, 1, 1,
0.2958324, -0.3358629, 3.91846, 0, 0.2392157, 1, 1,
0.2988283, -0.407314, 2.404258, 0, 0.2313726, 1, 1,
0.3012955, 1.084534, 2.093396, 0, 0.227451, 1, 1,
0.3055013, 0.2055026, 0.04566804, 0, 0.2196078, 1, 1,
0.306769, 0.8147088, -0.3767138, 0, 0.2156863, 1, 1,
0.3069211, -0.2340873, 0.1941794, 0, 0.2078431, 1, 1,
0.3122354, 0.5568246, 0.9040533, 0, 0.2039216, 1, 1,
0.3141442, 1.6664, 0.4110011, 0, 0.1960784, 1, 1,
0.3161834, -0.2824578, 2.483897, 0, 0.1882353, 1, 1,
0.3201705, -0.4598517, 4.404123, 0, 0.1843137, 1, 1,
0.3211064, -2.97524, 2.910573, 0, 0.1764706, 1, 1,
0.3219916, -0.6542166, 2.900728, 0, 0.172549, 1, 1,
0.3229216, -2.372479, 3.523208, 0, 0.1647059, 1, 1,
0.3265264, -1.16677, 3.470145, 0, 0.1607843, 1, 1,
0.3278654, 0.3973837, 1.531464, 0, 0.1529412, 1, 1,
0.3320175, 0.7079296, -0.5903235, 0, 0.1490196, 1, 1,
0.3324156, -0.7262262, 3.956256, 0, 0.1411765, 1, 1,
0.3336838, 0.3206779, 2.919687, 0, 0.1372549, 1, 1,
0.3360409, -3.479254, 3.156823, 0, 0.1294118, 1, 1,
0.3368427, -1.188844, 1.511462, 0, 0.1254902, 1, 1,
0.3376382, -0.5883367, 2.056409, 0, 0.1176471, 1, 1,
0.3393126, 0.3312666, 2.239124, 0, 0.1137255, 1, 1,
0.3457065, 0.839184, 1.478697, 0, 0.1058824, 1, 1,
0.34705, -1.337582, 0.6467095, 0, 0.09803922, 1, 1,
0.3485755, 0.05779156, 1.622676, 0, 0.09411765, 1, 1,
0.349519, 1.499403, 1.241914, 0, 0.08627451, 1, 1,
0.3560683, -1.510233, 3.177243, 0, 0.08235294, 1, 1,
0.3562559, -0.3361444, 3.029221, 0, 0.07450981, 1, 1,
0.3597465, -0.2814406, 2.778326, 0, 0.07058824, 1, 1,
0.3602559, -0.9176127, 2.82513, 0, 0.0627451, 1, 1,
0.361651, -0.5252125, 2.299762, 0, 0.05882353, 1, 1,
0.3663617, -1.015709, 2.767578, 0, 0.05098039, 1, 1,
0.3669401, 0.6661389, 0.5470096, 0, 0.04705882, 1, 1,
0.3698376, 1.077424, 0.54663, 0, 0.03921569, 1, 1,
0.3713543, -0.3287136, 1.367695, 0, 0.03529412, 1, 1,
0.3714921, -1.670344, 3.791685, 0, 0.02745098, 1, 1,
0.3718877, -0.07990447, 1.644592, 0, 0.02352941, 1, 1,
0.3724042, -0.4842947, 2.22264, 0, 0.01568628, 1, 1,
0.3737544, -1.084302, 1.661715, 0, 0.01176471, 1, 1,
0.3755028, 0.5101336, -0.1235524, 0, 0.003921569, 1, 1,
0.3807961, -0.5953855, 1.781874, 0.003921569, 0, 1, 1,
0.3842202, -0.1424969, 2.934314, 0.007843138, 0, 1, 1,
0.384508, 0.4390446, -0.3354495, 0.01568628, 0, 1, 1,
0.3874286, -1.051679, 3.857304, 0.01960784, 0, 1, 1,
0.3889106, -0.5570797, 2.340393, 0.02745098, 0, 1, 1,
0.3929474, -1.813019, 4.132267, 0.03137255, 0, 1, 1,
0.3953434, -0.2866078, 1.640456, 0.03921569, 0, 1, 1,
0.3974614, 0.1263533, 1.803998, 0.04313726, 0, 1, 1,
0.3997658, -0.8554004, 2.2344, 0.05098039, 0, 1, 1,
0.4018499, 0.2742685, 1.333894, 0.05490196, 0, 1, 1,
0.4057601, -1.005612, 3.325874, 0.0627451, 0, 1, 1,
0.410293, 1.289422, 0.955012, 0.06666667, 0, 1, 1,
0.4171615, 1.438551, -0.3405067, 0.07450981, 0, 1, 1,
0.4202556, -0.03525012, 3.627587, 0.07843138, 0, 1, 1,
0.4307593, 0.4746381, 0.7339472, 0.08627451, 0, 1, 1,
0.4309292, -0.4037175, 0.4922515, 0.09019608, 0, 1, 1,
0.4361243, -3.596273, 4.255748, 0.09803922, 0, 1, 1,
0.4523147, 0.9544271, 1.73131, 0.1058824, 0, 1, 1,
0.4523332, -0.458316, 3.052203, 0.1098039, 0, 1, 1,
0.4524622, 1.89092, 1.582487, 0.1176471, 0, 1, 1,
0.4629594, 0.8670741, 0.9289446, 0.1215686, 0, 1, 1,
0.4656853, 1.179264, -0.743574, 0.1294118, 0, 1, 1,
0.4666355, -0.3833273, 3.263269, 0.1333333, 0, 1, 1,
0.4735622, -0.7121502, 2.719632, 0.1411765, 0, 1, 1,
0.480514, -1.415315, 2.643778, 0.145098, 0, 1, 1,
0.4828173, -1.329618, 3.0898, 0.1529412, 0, 1, 1,
0.4899434, 1.414561, 0.1758202, 0.1568628, 0, 1, 1,
0.4926251, -0.7599226, 3.438346, 0.1647059, 0, 1, 1,
0.4931824, 0.755979, 1.423757, 0.1686275, 0, 1, 1,
0.4932004, 2.138987, 0.002655531, 0.1764706, 0, 1, 1,
0.4974585, 0.780542, 0.9404625, 0.1803922, 0, 1, 1,
0.5033858, -2.006593, 2.776114, 0.1882353, 0, 1, 1,
0.5054623, -0.2793546, 1.85937, 0.1921569, 0, 1, 1,
0.5077533, -0.4307332, 1.18399, 0.2, 0, 1, 1,
0.5124194, 1.229677, 1.914422, 0.2078431, 0, 1, 1,
0.5159091, 0.3851264, 2.661391, 0.2117647, 0, 1, 1,
0.5178291, -0.6156676, 2.046721, 0.2196078, 0, 1, 1,
0.5182573, 1.529739, -0.9196141, 0.2235294, 0, 1, 1,
0.5193009, 0.9684336, 0.7570482, 0.2313726, 0, 1, 1,
0.5203926, 0.08619407, 1.238281, 0.2352941, 0, 1, 1,
0.5279443, 0.7670366, -0.502172, 0.2431373, 0, 1, 1,
0.531114, 0.3044696, 0.1842579, 0.2470588, 0, 1, 1,
0.5324867, -0.9783335, 3.984148, 0.254902, 0, 1, 1,
0.5373888, -1.078046, 2.398755, 0.2588235, 0, 1, 1,
0.5404381, 2.238287, 0.6434509, 0.2666667, 0, 1, 1,
0.5404773, -0.6732064, 2.246478, 0.2705882, 0, 1, 1,
0.5479801, 0.2133265, 1.388634, 0.2784314, 0, 1, 1,
0.5541539, 1.30847, -0.05326678, 0.282353, 0, 1, 1,
0.560257, -0.505746, 3.487475, 0.2901961, 0, 1, 1,
0.5617637, 0.2259871, -0.7752141, 0.2941177, 0, 1, 1,
0.569684, -0.3297079, 0.4934663, 0.3019608, 0, 1, 1,
0.5760304, -0.9891052, 1.671161, 0.3098039, 0, 1, 1,
0.5807648, 0.292232, 2.738091, 0.3137255, 0, 1, 1,
0.5859882, 1.903221, 1.831733, 0.3215686, 0, 1, 1,
0.5867461, -1.427368, 1.406026, 0.3254902, 0, 1, 1,
0.5876031, 0.8837101, 0.5534067, 0.3333333, 0, 1, 1,
0.5884994, -0.07234287, -0.9334084, 0.3372549, 0, 1, 1,
0.5925894, -0.6359465, 3.237861, 0.345098, 0, 1, 1,
0.5956005, -0.4118926, 2.730014, 0.3490196, 0, 1, 1,
0.5970684, -1.062383, 2.114718, 0.3568628, 0, 1, 1,
0.5980005, -0.5911044, 1.739165, 0.3607843, 0, 1, 1,
0.5997128, 0.184367, 0.9727932, 0.3686275, 0, 1, 1,
0.6057965, -0.9026784, 3.941097, 0.372549, 0, 1, 1,
0.6094357, 1.172324, 2.823105, 0.3803922, 0, 1, 1,
0.6108449, -1.459236, 2.504142, 0.3843137, 0, 1, 1,
0.6116274, -0.3418559, 2.88801, 0.3921569, 0, 1, 1,
0.6153158, -0.4645674, 3.92228, 0.3960784, 0, 1, 1,
0.6164636, -1.075119, 4.673969, 0.4039216, 0, 1, 1,
0.6183866, 0.9971074, 0.071677, 0.4117647, 0, 1, 1,
0.6219458, 0.3582562, -0.08467463, 0.4156863, 0, 1, 1,
0.6232435, 1.0197, 0.09086337, 0.4235294, 0, 1, 1,
0.6257172, 0.2017861, 0.3304698, 0.427451, 0, 1, 1,
0.6282588, -0.5184617, 3.91034, 0.4352941, 0, 1, 1,
0.6292822, 0.9180852, -0.1489274, 0.4392157, 0, 1, 1,
0.6295246, -0.1300966, 2.691906, 0.4470588, 0, 1, 1,
0.6357189, 0.006352656, 2.827234, 0.4509804, 0, 1, 1,
0.6379144, -0.5408134, 1.433666, 0.4588235, 0, 1, 1,
0.6384782, -0.37654, 0.8750941, 0.4627451, 0, 1, 1,
0.6413328, 0.944827, 2.439467, 0.4705882, 0, 1, 1,
0.6453295, 0.02199607, 1.298598, 0.4745098, 0, 1, 1,
0.6499746, -0.4560231, 2.021656, 0.4823529, 0, 1, 1,
0.6543989, 0.2357467, 1.494443, 0.4862745, 0, 1, 1,
0.6606866, -0.3498292, 0.9800273, 0.4941176, 0, 1, 1,
0.6640198, -0.4058496, 3.058655, 0.5019608, 0, 1, 1,
0.6686139, 0.4942226, 1.914997, 0.5058824, 0, 1, 1,
0.6692129, 0.02787039, 0.8868567, 0.5137255, 0, 1, 1,
0.6702058, -1.090222, 3.462367, 0.5176471, 0, 1, 1,
0.6760975, -1.460838, 2.432114, 0.5254902, 0, 1, 1,
0.6789982, -2.106913, 1.584395, 0.5294118, 0, 1, 1,
0.6819139, 0.7270564, 0.9685801, 0.5372549, 0, 1, 1,
0.6821139, -0.8150382, 3.298676, 0.5411765, 0, 1, 1,
0.6832468, -2.647263, 2.945008, 0.5490196, 0, 1, 1,
0.6887064, 1.403415, 0.01228401, 0.5529412, 0, 1, 1,
0.6925716, -0.4881502, 1.173158, 0.5607843, 0, 1, 1,
0.6929916, 0.3361883, 1.522277, 0.5647059, 0, 1, 1,
0.6952927, 1.391877, 0.1399053, 0.572549, 0, 1, 1,
0.6958129, -1.847261, 2.536267, 0.5764706, 0, 1, 1,
0.6966323, -0.6468555, 3.440904, 0.5843138, 0, 1, 1,
0.6993067, 1.307577, -0.9307493, 0.5882353, 0, 1, 1,
0.7014157, -0.8205823, 3.117611, 0.5960785, 0, 1, 1,
0.711408, 0.8455566, -1.119833, 0.6039216, 0, 1, 1,
0.7171689, 1.209949, 0.2956383, 0.6078432, 0, 1, 1,
0.719707, -0.9152339, 2.483807, 0.6156863, 0, 1, 1,
0.7221119, 0.824012, 0.5307426, 0.6196079, 0, 1, 1,
0.7243241, -0.0319234, 2.148869, 0.627451, 0, 1, 1,
0.7246135, 0.4202316, 1.43959, 0.6313726, 0, 1, 1,
0.7261124, 0.8059426, -0.1471214, 0.6392157, 0, 1, 1,
0.7262696, -0.02256485, 1.127428, 0.6431373, 0, 1, 1,
0.7267826, -0.4334962, 4.644506, 0.6509804, 0, 1, 1,
0.730413, -0.7294016, 1.133376, 0.654902, 0, 1, 1,
0.7305325, -0.163912, 2.912766, 0.6627451, 0, 1, 1,
0.7376411, -1.177891, 4.381389, 0.6666667, 0, 1, 1,
0.739111, -0.07535774, 0.1410496, 0.6745098, 0, 1, 1,
0.7477111, -0.6491048, 3.053965, 0.6784314, 0, 1, 1,
0.7484557, -0.2730943, 0.4347908, 0.6862745, 0, 1, 1,
0.7541709, 0.531877, 0.6289264, 0.6901961, 0, 1, 1,
0.756551, -1.248505, 1.682773, 0.6980392, 0, 1, 1,
0.7622303, -0.4621369, 2.434727, 0.7058824, 0, 1, 1,
0.7634744, 0.8940932, -0.3369085, 0.7098039, 0, 1, 1,
0.7643649, 0.2240006, 1.731203, 0.7176471, 0, 1, 1,
0.7704889, -2.329123, 2.728895, 0.7215686, 0, 1, 1,
0.7715636, 0.3379243, 1.891852, 0.7294118, 0, 1, 1,
0.7729859, 0.7266325, -0.3006225, 0.7333333, 0, 1, 1,
0.7750617, 0.8472816, 0.2702897, 0.7411765, 0, 1, 1,
0.7764937, 0.8160181, 2.497749, 0.7450981, 0, 1, 1,
0.776638, -0.6541032, 1.936672, 0.7529412, 0, 1, 1,
0.7823102, -0.51564, 1.560922, 0.7568628, 0, 1, 1,
0.7876257, 0.2698644, 0.4995119, 0.7647059, 0, 1, 1,
0.7936218, -1.427349, 2.589301, 0.7686275, 0, 1, 1,
0.7944036, 0.02077032, -1.36313, 0.7764706, 0, 1, 1,
0.7970756, 0.2509738, 2.695247, 0.7803922, 0, 1, 1,
0.8019727, 0.9810703, 0.6418104, 0.7882353, 0, 1, 1,
0.8027747, 0.2607667, 1.420442, 0.7921569, 0, 1, 1,
0.8117977, -2.662297, 3.717591, 0.8, 0, 1, 1,
0.8132616, -0.2755585, 1.445495, 0.8078431, 0, 1, 1,
0.8138879, -0.2349897, 1.88034, 0.8117647, 0, 1, 1,
0.8139581, 0.1621187, 1.155048, 0.8196079, 0, 1, 1,
0.8283206, -0.3991764, 1.705017, 0.8235294, 0, 1, 1,
0.8284772, -0.9207995, 2.680474, 0.8313726, 0, 1, 1,
0.8286617, -0.2114396, 3.79237, 0.8352941, 0, 1, 1,
0.8309274, -0.4787961, 3.720064, 0.8431373, 0, 1, 1,
0.8358997, -0.0204523, 3.53124, 0.8470588, 0, 1, 1,
0.8389472, -0.002690505, 2.011146, 0.854902, 0, 1, 1,
0.8414561, -0.740743, 3.077491, 0.8588235, 0, 1, 1,
0.8458084, 0.2002601, 1.276446, 0.8666667, 0, 1, 1,
0.8460894, -0.114753, 0.3861229, 0.8705882, 0, 1, 1,
0.8535014, 1.003584, 1.253595, 0.8784314, 0, 1, 1,
0.8541325, 0.1484129, 0.2778546, 0.8823529, 0, 1, 1,
0.8543255, -0.1393259, 1.494896, 0.8901961, 0, 1, 1,
0.8608992, -2.150548, 4.088499, 0.8941177, 0, 1, 1,
0.8621396, -1.044147, 2.943892, 0.9019608, 0, 1, 1,
0.8653311, -0.242298, 0.6501971, 0.9098039, 0, 1, 1,
0.8657731, -1.280311, 2.730473, 0.9137255, 0, 1, 1,
0.8695357, -0.2230121, 0.9285987, 0.9215686, 0, 1, 1,
0.8699769, 1.198706, 0.3422304, 0.9254902, 0, 1, 1,
0.872107, -0.7071931, 3.188658, 0.9333333, 0, 1, 1,
0.878171, 0.6047412, 0.2305656, 0.9372549, 0, 1, 1,
0.8782513, -0.9332489, 1.251903, 0.945098, 0, 1, 1,
0.8920295, -1.749619, 3.847416, 0.9490196, 0, 1, 1,
0.8952656, 0.0975534, 2.153692, 0.9568627, 0, 1, 1,
0.90909, -1.021265, 3.533267, 0.9607843, 0, 1, 1,
0.9112383, 0.3889812, 1.45879, 0.9686275, 0, 1, 1,
0.9178489, 0.1231003, 0.3534551, 0.972549, 0, 1, 1,
0.9190361, -0.9886774, 3.215756, 0.9803922, 0, 1, 1,
0.9193742, 0.0007316065, 2.214107, 0.9843137, 0, 1, 1,
0.9196889, 1.646258, -0.151183, 0.9921569, 0, 1, 1,
0.9200985, -1.714004, 2.214896, 0.9960784, 0, 1, 1,
0.9234941, 0.8521616, 0.5691288, 1, 0, 0.9960784, 1,
0.9367912, 0.09114739, 0.977739, 1, 0, 0.9882353, 1,
0.9534251, -0.1583016, 1.822439, 1, 0, 0.9843137, 1,
0.9576566, 0.2235153, 0.2736977, 1, 0, 0.9764706, 1,
0.9656472, 1.895017, 0.7844913, 1, 0, 0.972549, 1,
0.9692084, -0.009473841, 0.5583166, 1, 0, 0.9647059, 1,
0.9697153, -0.6195466, 2.641784, 1, 0, 0.9607843, 1,
0.9724962, 1.784814, -0.2169294, 1, 0, 0.9529412, 1,
0.9730586, 0.7939691, 1.322948, 1, 0, 0.9490196, 1,
0.9739217, 0.2234134, 0.9332368, 1, 0, 0.9411765, 1,
0.9902735, 0.2903473, 0.6445845, 1, 0, 0.9372549, 1,
0.9970865, 0.4699189, 0.568242, 1, 0, 0.9294118, 1,
1.004033, -0.2164053, 2.780431, 1, 0, 0.9254902, 1,
1.005677, 0.2660272, 1.975803, 1, 0, 0.9176471, 1,
1.022083, -0.4715831, 2.544625, 1, 0, 0.9137255, 1,
1.023224, -0.6025895, 0.9668074, 1, 0, 0.9058824, 1,
1.024292, 0.8949517, 0.8809486, 1, 0, 0.9019608, 1,
1.031889, -0.01741708, 1.973946, 1, 0, 0.8941177, 1,
1.037042, -1.181417, 2.790746, 1, 0, 0.8862745, 1,
1.03974, 1.770734, -0.2150943, 1, 0, 0.8823529, 1,
1.048226, 0.7052122, 2.487425, 1, 0, 0.8745098, 1,
1.04929, 1.139079, 0.720499, 1, 0, 0.8705882, 1,
1.051115, 2.294376, 0.7986416, 1, 0, 0.8627451, 1,
1.051888, 0.362857, 1.921929, 1, 0, 0.8588235, 1,
1.06028, -1.241533, 2.091059, 1, 0, 0.8509804, 1,
1.069342, 0.6417556, 1.797792, 1, 0, 0.8470588, 1,
1.074505, 1.933003, 1.022003, 1, 0, 0.8392157, 1,
1.085963, -1.673111, 1.43641, 1, 0, 0.8352941, 1,
1.091349, -0.549366, 1.112773, 1, 0, 0.827451, 1,
1.102948, -0.198277, 2.480258, 1, 0, 0.8235294, 1,
1.110001, -0.9968051, 1.632081, 1, 0, 0.8156863, 1,
1.110131, -0.9816844, 1.790534, 1, 0, 0.8117647, 1,
1.11037, -0.3005395, 2.849205, 1, 0, 0.8039216, 1,
1.110956, 0.09213956, 0.8509842, 1, 0, 0.7960784, 1,
1.112485, 0.3951769, 1.428002, 1, 0, 0.7921569, 1,
1.116428, -0.1763319, 1.45332, 1, 0, 0.7843137, 1,
1.117753, 0.8079777, 0.7212462, 1, 0, 0.7803922, 1,
1.124926, 1.502589, -0.03420532, 1, 0, 0.772549, 1,
1.125664, 0.1694358, 0.01973457, 1, 0, 0.7686275, 1,
1.126636, -0.5254955, 1.612884, 1, 0, 0.7607843, 1,
1.130243, -0.08306649, 2.465121, 1, 0, 0.7568628, 1,
1.131849, 1.061107, -0.6595793, 1, 0, 0.7490196, 1,
1.147979, 0.5697455, 2.809088, 1, 0, 0.7450981, 1,
1.149349, -0.3287885, 1.085582, 1, 0, 0.7372549, 1,
1.154424, 0.4190472, 0.05845085, 1, 0, 0.7333333, 1,
1.157125, 0.895095, 0.2778279, 1, 0, 0.7254902, 1,
1.169283, -0.9985418, 2.482367, 1, 0, 0.7215686, 1,
1.184756, -0.1078793, -0.1720845, 1, 0, 0.7137255, 1,
1.203035, 1.211773, 0.857859, 1, 0, 0.7098039, 1,
1.20379, -0.9052752, 2.174137, 1, 0, 0.7019608, 1,
1.205641, 0.6005977, 1.492159, 1, 0, 0.6941177, 1,
1.211002, -0.3862846, 0.8700146, 1, 0, 0.6901961, 1,
1.212018, 0.1180505, 2.09594, 1, 0, 0.682353, 1,
1.217096, 2.684396, -1.393373, 1, 0, 0.6784314, 1,
1.220677, 0.3717856, 1.987987, 1, 0, 0.6705883, 1,
1.244619, 0.7278205, 0.136956, 1, 0, 0.6666667, 1,
1.261872, 0.6207734, 1.993987, 1, 0, 0.6588235, 1,
1.263163, 2.678711, -0.3277423, 1, 0, 0.654902, 1,
1.269688, 0.02754486, 1.883112, 1, 0, 0.6470588, 1,
1.27172, 0.5149578, -1.122165, 1, 0, 0.6431373, 1,
1.278961, -0.250802, 3.647884, 1, 0, 0.6352941, 1,
1.307285, 0.08021799, 0.818089, 1, 0, 0.6313726, 1,
1.312417, 0.9971414, 1.033123, 1, 0, 0.6235294, 1,
1.332875, -0.07848657, 2.916294, 1, 0, 0.6196079, 1,
1.336074, -0.6914952, 4.015419, 1, 0, 0.6117647, 1,
1.338878, -0.2824441, 2.529913, 1, 0, 0.6078432, 1,
1.340838, -1.128192, 3.036017, 1, 0, 0.6, 1,
1.343686, -1.180445, 2.487544, 1, 0, 0.5921569, 1,
1.347489, 1.241934, 0.4610498, 1, 0, 0.5882353, 1,
1.351073, -1.614078, 0.6354338, 1, 0, 0.5803922, 1,
1.360466, 0.08474655, 2.196437, 1, 0, 0.5764706, 1,
1.362143, 1.159316, 2.530964, 1, 0, 0.5686275, 1,
1.365483, -0.3313362, 2.610473, 1, 0, 0.5647059, 1,
1.365951, -1.67966, 3.262481, 1, 0, 0.5568628, 1,
1.37191, 1.812247, 0.7187372, 1, 0, 0.5529412, 1,
1.378249, 0.02680502, 0.7063442, 1, 0, 0.5450981, 1,
1.392834, 1.495249, 0.4768222, 1, 0, 0.5411765, 1,
1.398679, 0.5144489, -0.3948418, 1, 0, 0.5333334, 1,
1.403314, 0.1809991, 1.11262, 1, 0, 0.5294118, 1,
1.406503, 0.05955694, 0.7862167, 1, 0, 0.5215687, 1,
1.411581, -0.759439, 1.466071, 1, 0, 0.5176471, 1,
1.418848, -0.4465966, 2.569267, 1, 0, 0.509804, 1,
1.420123, 0.1271802, 2.136516, 1, 0, 0.5058824, 1,
1.44253, -0.5718153, 0.7430001, 1, 0, 0.4980392, 1,
1.454839, 0.3870274, 1.263542, 1, 0, 0.4901961, 1,
1.458201, 1.315378, 2.142514, 1, 0, 0.4862745, 1,
1.46633, -1.896116, 3.709396, 1, 0, 0.4784314, 1,
1.477048, 0.5024532, 1.243444, 1, 0, 0.4745098, 1,
1.477827, -0.6731939, 1.332595, 1, 0, 0.4666667, 1,
1.483866, 0.9953475, 1.615612, 1, 0, 0.4627451, 1,
1.496163, 0.5407453, 0.7948048, 1, 0, 0.454902, 1,
1.507977, 0.9888067, 1.38336, 1, 0, 0.4509804, 1,
1.51449, -0.0617478, 0.4991767, 1, 0, 0.4431373, 1,
1.514617, 0.4736958, 0.8378983, 1, 0, 0.4392157, 1,
1.541242, -0.3939828, 1.322127, 1, 0, 0.4313726, 1,
1.544201, -1.283298, 2.136216, 1, 0, 0.427451, 1,
1.563076, -0.004084426, 1.593644, 1, 0, 0.4196078, 1,
1.569861, 0.4962557, 1.960397, 1, 0, 0.4156863, 1,
1.576337, -0.3995333, 2.147818, 1, 0, 0.4078431, 1,
1.59496, -0.2983179, 3.015636, 1, 0, 0.4039216, 1,
1.602322, -0.7431675, 1.003842, 1, 0, 0.3960784, 1,
1.612114, -0.9593385, 1.860051, 1, 0, 0.3882353, 1,
1.620278, -1.345495, 2.519052, 1, 0, 0.3843137, 1,
1.621593, 1.034119, 2.816732, 1, 0, 0.3764706, 1,
1.62639, 1.054371, 0.4555152, 1, 0, 0.372549, 1,
1.649468, 0.5361781, 0.6276044, 1, 0, 0.3647059, 1,
1.651717, -0.5775054, 0.9274635, 1, 0, 0.3607843, 1,
1.655447, 1.836936, 2.861658, 1, 0, 0.3529412, 1,
1.656026, 0.5416862, 0.9177838, 1, 0, 0.3490196, 1,
1.673097, -1.842608, 2.261446, 1, 0, 0.3411765, 1,
1.673699, -1.10961, 1.970497, 1, 0, 0.3372549, 1,
1.721635, 0.1787579, 2.253662, 1, 0, 0.3294118, 1,
1.724438, -0.5296395, 0.9768856, 1, 0, 0.3254902, 1,
1.738219, -0.2702495, 1.616348, 1, 0, 0.3176471, 1,
1.740316, 1.384842, 1.460675, 1, 0, 0.3137255, 1,
1.755617, 0.7236385, 1.349699, 1, 0, 0.3058824, 1,
1.776621, 0.266784, 0.6483386, 1, 0, 0.2980392, 1,
1.780318, -0.4615082, 1.735321, 1, 0, 0.2941177, 1,
1.782189, -0.8381178, 0.757207, 1, 0, 0.2862745, 1,
1.802271, 0.2019226, -0.007658076, 1, 0, 0.282353, 1,
1.807374, -0.4839982, 2.581734, 1, 0, 0.2745098, 1,
1.809633, -1.127463, 1.46718, 1, 0, 0.2705882, 1,
1.814461, 2.254455, -0.2293297, 1, 0, 0.2627451, 1,
1.816686, -0.07777078, 1.252202, 1, 0, 0.2588235, 1,
1.817121, -0.6582255, 2.884982, 1, 0, 0.2509804, 1,
1.836668, 0.854423, 0.7242516, 1, 0, 0.2470588, 1,
1.853392, 0.2455073, 1.169826, 1, 0, 0.2392157, 1,
1.860129, 1.276739, 0.7268518, 1, 0, 0.2352941, 1,
1.871902, -1.187209, 1.66095, 1, 0, 0.227451, 1,
1.894651, 0.9537992, -0.980185, 1, 0, 0.2235294, 1,
1.897891, -1.191273, 3.784794, 1, 0, 0.2156863, 1,
1.924927, -2.019259, 1.96042, 1, 0, 0.2117647, 1,
1.948037, -1.226372, 1.906916, 1, 0, 0.2039216, 1,
1.948847, 1.008448, 0.2782481, 1, 0, 0.1960784, 1,
1.966427, 0.6565364, 0.5978816, 1, 0, 0.1921569, 1,
1.977597, -2.019257, 2.331987, 1, 0, 0.1843137, 1,
1.99678, 0.2106133, 2.309553, 1, 0, 0.1803922, 1,
2.001478, -2.438493, 2.122937, 1, 0, 0.172549, 1,
2.048866, 0.4594105, 0.999867, 1, 0, 0.1686275, 1,
2.063098, 1.250726, 0.9605113, 1, 0, 0.1607843, 1,
2.063866, -1.039096, 3.563205, 1, 0, 0.1568628, 1,
2.105992, 0.8876014, 1.354509, 1, 0, 0.1490196, 1,
2.111348, 0.4812428, -0.3587607, 1, 0, 0.145098, 1,
2.113181, -0.2403717, 2.573847, 1, 0, 0.1372549, 1,
2.156544, 0.4508371, 1.895328, 1, 0, 0.1333333, 1,
2.193088, -0.3594651, 2.255463, 1, 0, 0.1254902, 1,
2.197975, -0.5049798, 1.985094, 1, 0, 0.1215686, 1,
2.219651, 0.9668644, 0.5843447, 1, 0, 0.1137255, 1,
2.228218, -0.4550754, 3.487721, 1, 0, 0.1098039, 1,
2.294254, 1.204472, 1.315279, 1, 0, 0.1019608, 1,
2.319418, -0.782172, 1.01552, 1, 0, 0.09411765, 1,
2.327192, -1.54278, 0.6919242, 1, 0, 0.09019608, 1,
2.330323, 0.5650666, 1.241568, 1, 0, 0.08235294, 1,
2.340538, -0.6589058, 1.34594, 1, 0, 0.07843138, 1,
2.411733, 0.8136779, 1.138199, 1, 0, 0.07058824, 1,
2.421328, -0.1263548, 0.4099059, 1, 0, 0.06666667, 1,
2.439606, -0.7229365, 0.3554013, 1, 0, 0.05882353, 1,
2.490192, 0.6268871, 3.120241, 1, 0, 0.05490196, 1,
2.574322, 0.4185405, 2.800772, 1, 0, 0.04705882, 1,
2.735289, 1.012506, -0.6498809, 1, 0, 0.04313726, 1,
2.804086, -0.940672, 0.9496539, 1, 0, 0.03529412, 1,
2.840645, -0.9692358, 1.508608, 1, 0, 0.03137255, 1,
2.847872, -0.7199639, 3.009958, 1, 0, 0.02352941, 1,
2.996909, 0.3140334, 0.198781, 1, 0, 0.01960784, 1,
3.010862, -1.428425, 1.497333, 1, 0, 0.01176471, 1,
3.194775, 0.3162515, 1.329546, 1, 0, 0.007843138, 1
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
-0.5900555, -4.69389, -7.861171, 0, -0.5, 0.5, 0.5,
-0.5900555, -4.69389, -7.861171, 1, -0.5, 0.5, 0.5,
-0.5900555, -4.69389, -7.861171, 1, 1.5, 0.5, 0.5,
-0.5900555, -4.69389, -7.861171, 0, 1.5, 0.5, 0.5
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
-5.657943, -0.3584627, -7.861171, 0, -0.5, 0.5, 0.5,
-5.657943, -0.3584627, -7.861171, 1, -0.5, 0.5, 0.5,
-5.657943, -0.3584627, -7.861171, 1, 1.5, 0.5, 0.5,
-5.657943, -0.3584627, -7.861171, 0, 1.5, 0.5, 0.5
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
-5.657943, -4.69389, 0.1588953, 0, -0.5, 0.5, 0.5,
-5.657943, -4.69389, 0.1588953, 1, -0.5, 0.5, 0.5,
-5.657943, -4.69389, 0.1588953, 1, 1.5, 0.5, 0.5,
-5.657943, -4.69389, 0.1588953, 0, 1.5, 0.5, 0.5
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
-4, -3.693407, -6.010387,
2, -3.693407, -6.010387,
-4, -3.693407, -6.010387,
-4, -3.860154, -6.318851,
-2, -3.693407, -6.010387,
-2, -3.860154, -6.318851,
0, -3.693407, -6.010387,
0, -3.860154, -6.318851,
2, -3.693407, -6.010387,
2, -3.860154, -6.318851
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
-4, -4.193649, -6.935779, 0, -0.5, 0.5, 0.5,
-4, -4.193649, -6.935779, 1, -0.5, 0.5, 0.5,
-4, -4.193649, -6.935779, 1, 1.5, 0.5, 0.5,
-4, -4.193649, -6.935779, 0, 1.5, 0.5, 0.5,
-2, -4.193649, -6.935779, 0, -0.5, 0.5, 0.5,
-2, -4.193649, -6.935779, 1, -0.5, 0.5, 0.5,
-2, -4.193649, -6.935779, 1, 1.5, 0.5, 0.5,
-2, -4.193649, -6.935779, 0, 1.5, 0.5, 0.5,
0, -4.193649, -6.935779, 0, -0.5, 0.5, 0.5,
0, -4.193649, -6.935779, 1, -0.5, 0.5, 0.5,
0, -4.193649, -6.935779, 1, 1.5, 0.5, 0.5,
0, -4.193649, -6.935779, 0, 1.5, 0.5, 0.5,
2, -4.193649, -6.935779, 0, -0.5, 0.5, 0.5,
2, -4.193649, -6.935779, 1, -0.5, 0.5, 0.5,
2, -4.193649, -6.935779, 1, 1.5, 0.5, 0.5,
2, -4.193649, -6.935779, 0, 1.5, 0.5, 0.5
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
-4.488431, -3, -6.010387,
-4.488431, 2, -6.010387,
-4.488431, -3, -6.010387,
-4.683349, -3, -6.318851,
-4.488431, -2, -6.010387,
-4.683349, -2, -6.318851,
-4.488431, -1, -6.010387,
-4.683349, -1, -6.318851,
-4.488431, 0, -6.010387,
-4.683349, 0, -6.318851,
-4.488431, 1, -6.010387,
-4.683349, 1, -6.318851,
-4.488431, 2, -6.010387,
-4.683349, 2, -6.318851
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
-5.073187, -3, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, -3, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, -3, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, -3, -6.935779, 0, 1.5, 0.5, 0.5,
-5.073187, -2, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, -2, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, -2, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, -2, -6.935779, 0, 1.5, 0.5, 0.5,
-5.073187, -1, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, -1, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, -1, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, -1, -6.935779, 0, 1.5, 0.5, 0.5,
-5.073187, 0, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, 0, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, 0, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, 0, -6.935779, 0, 1.5, 0.5, 0.5,
-5.073187, 1, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, 1, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, 1, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, 1, -6.935779, 0, 1.5, 0.5, 0.5,
-5.073187, 2, -6.935779, 0, -0.5, 0.5, 0.5,
-5.073187, 2, -6.935779, 1, -0.5, 0.5, 0.5,
-5.073187, 2, -6.935779, 1, 1.5, 0.5, 0.5,
-5.073187, 2, -6.935779, 0, 1.5, 0.5, 0.5
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
-4.488431, -3.693407, -4,
-4.488431, -3.693407, 6,
-4.488431, -3.693407, -4,
-4.683349, -3.860154, -4,
-4.488431, -3.693407, -2,
-4.683349, -3.860154, -2,
-4.488431, -3.693407, 0,
-4.683349, -3.860154, 0,
-4.488431, -3.693407, 2,
-4.683349, -3.860154, 2,
-4.488431, -3.693407, 4,
-4.683349, -3.860154, 4,
-4.488431, -3.693407, 6,
-4.683349, -3.860154, 6
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
"4",
"6"
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
-5.073187, -4.193649, -4, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, -4, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, -4, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, -4, 0, 1.5, 0.5, 0.5,
-5.073187, -4.193649, -2, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, -2, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, -2, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, -2, 0, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 0, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 0, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 0, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 0, 0, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 2, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 2, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 2, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 2, 0, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 4, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 4, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 4, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 4, 0, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 6, 0, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 6, 1, -0.5, 0.5, 0.5,
-5.073187, -4.193649, 6, 1, 1.5, 0.5, 0.5,
-5.073187, -4.193649, 6, 0, 1.5, 0.5, 0.5
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
-4.488431, -3.693407, -6.010387,
-4.488431, 2.976482, -6.010387,
-4.488431, -3.693407, 6.328177,
-4.488431, 2.976482, 6.328177,
-4.488431, -3.693407, -6.010387,
-4.488431, -3.693407, 6.328177,
-4.488431, 2.976482, -6.010387,
-4.488431, 2.976482, 6.328177,
-4.488431, -3.693407, -6.010387,
3.30832, -3.693407, -6.010387,
-4.488431, -3.693407, 6.328177,
3.30832, -3.693407, 6.328177,
-4.488431, 2.976482, -6.010387,
3.30832, 2.976482, -6.010387,
-4.488431, 2.976482, 6.328177,
3.30832, 2.976482, 6.328177,
3.30832, -3.693407, -6.010387,
3.30832, 2.976482, -6.010387,
3.30832, -3.693407, 6.328177,
3.30832, 2.976482, 6.328177,
3.30832, -3.693407, -6.010387,
3.30832, -3.693407, 6.328177,
3.30832, 2.976482, -6.010387,
3.30832, 2.976482, 6.328177
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
var radius = 8.568964;
var distance = 38.12429;
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
mvMatrix.translate( 0.5900555, 0.3584627, -0.1588953 );
mvMatrix.scale( 1.188307, 1.389068, 0.7508922 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.12429);
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
phosphoramidite<-read.table("phosphoramidite.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphoramidite$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
y<-phosphoramidite$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
```

```r
z<-phosphoramidite$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidite' not found
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
-4.374886, -0.3899135, -2.679338, 0, 0, 1, 1, 1,
-3.000352, 0.3158521, 0.1389888, 1, 0, 0, 1, 1,
-2.938931, -0.7874659, -0.5459107, 1, 0, 0, 1, 1,
-2.813936, -0.3431698, -2.031988, 1, 0, 0, 1, 1,
-2.794613, 1.258984, -0.5901564, 1, 0, 0, 1, 1,
-2.70578, -0.1840292, -1.174691, 1, 0, 0, 1, 1,
-2.588401, -1.570605, -3.513545, 0, 0, 0, 1, 1,
-2.535333, -0.15366, -2.852724, 0, 0, 0, 1, 1,
-2.493034, 0.2416735, 0.8491503, 0, 0, 0, 1, 1,
-2.482022, 0.6835464, -0.496903, 0, 0, 0, 1, 1,
-2.401881, -0.06374142, -1.913595, 0, 0, 0, 1, 1,
-2.375802, 0.4925169, -2.153984, 0, 0, 0, 1, 1,
-2.343654, 0.9657624, -1.183436, 0, 0, 0, 1, 1,
-2.326014, 0.1054763, -2.588072, 1, 1, 1, 1, 1,
-2.317127, 1.356481, -1.730978, 1, 1, 1, 1, 1,
-2.312782, -0.6748177, -1.425637, 1, 1, 1, 1, 1,
-2.276739, -0.7775484, -1.90444, 1, 1, 1, 1, 1,
-2.261477, -1.295882, -2.06685, 1, 1, 1, 1, 1,
-2.164696, -0.2616791, -2.489065, 1, 1, 1, 1, 1,
-2.053127, 0.3053094, -2.316712, 1, 1, 1, 1, 1,
-2.03286, 0.470711, -2.536041, 1, 1, 1, 1, 1,
-2.029011, -2.258577, -3.013322, 1, 1, 1, 1, 1,
-2.020483, -0.0959389, -1.173175, 1, 1, 1, 1, 1,
-2.013217, 0.1056935, -2.868947, 1, 1, 1, 1, 1,
-2.011164, -1.25942, -2.279854, 1, 1, 1, 1, 1,
-1.977663, -1.399446, -1.878496, 1, 1, 1, 1, 1,
-1.945399, -0.826965, -0.9614308, 1, 1, 1, 1, 1,
-1.940647, -2.073676, -2.800961, 1, 1, 1, 1, 1,
-1.911584, -1.21871, -2.548227, 0, 0, 1, 1, 1,
-1.882236, 0.2790327, -1.500005, 1, 0, 0, 1, 1,
-1.865635, 1.591934, -1.660261, 1, 0, 0, 1, 1,
-1.861344, 0.04502512, -0.0731512, 1, 0, 0, 1, 1,
-1.843265, 0.5091197, 0.145905, 1, 0, 0, 1, 1,
-1.825557, 0.671079, -0.7043351, 1, 0, 0, 1, 1,
-1.793116, -0.264955, -2.062607, 0, 0, 0, 1, 1,
-1.784629, -0.5403652, -3.214774, 0, 0, 0, 1, 1,
-1.768985, 0.461133, 0.1628352, 0, 0, 0, 1, 1,
-1.765588, -0.8248285, -0.9719132, 0, 0, 0, 1, 1,
-1.753378, 0.162914, -0.5446429, 0, 0, 0, 1, 1,
-1.749186, -0.4543528, -2.721304, 0, 0, 0, 1, 1,
-1.738143, -0.4819495, -2.230326, 0, 0, 0, 1, 1,
-1.703903, 1.016584, -0.694594, 1, 1, 1, 1, 1,
-1.699963, 0.8086705, 0.1840343, 1, 1, 1, 1, 1,
-1.696516, 0.9207631, -1.428213, 1, 1, 1, 1, 1,
-1.691946, -0.7661656, -2.435672, 1, 1, 1, 1, 1,
-1.688328, -1.05496, -2.010289, 1, 1, 1, 1, 1,
-1.68661, -1.343437, -1.711882, 1, 1, 1, 1, 1,
-1.676483, 0.4591165, -0.404552, 1, 1, 1, 1, 1,
-1.667341, -0.644405, -3.912269, 1, 1, 1, 1, 1,
-1.649595, -1.110431, -3.471647, 1, 1, 1, 1, 1,
-1.647604, 1.44884, -2.336941, 1, 1, 1, 1, 1,
-1.643239, 1.032281, -1.061543, 1, 1, 1, 1, 1,
-1.629303, 1.738358, 0.01906556, 1, 1, 1, 1, 1,
-1.629246, 0.8537689, -1.45623, 1, 1, 1, 1, 1,
-1.621252, 1.020396, -1.340266, 1, 1, 1, 1, 1,
-1.619359, -1.101933, -1.225917, 1, 1, 1, 1, 1,
-1.619014, -0.8338993, -2.48578, 0, 0, 1, 1, 1,
-1.614693, -0.1349504, 0.07417496, 1, 0, 0, 1, 1,
-1.58052, -1.458676, -2.397943, 1, 0, 0, 1, 1,
-1.578926, 0.4804791, -2.295303, 1, 0, 0, 1, 1,
-1.557311, -2.838415, -1.876252, 1, 0, 0, 1, 1,
-1.549634, -0.006619167, -0.6321105, 1, 0, 0, 1, 1,
-1.549544, 0.07967492, -0.931437, 0, 0, 0, 1, 1,
-1.548049, 1.017684, 1.251007, 0, 0, 0, 1, 1,
-1.541478, -0.6465502, -1.555472, 0, 0, 0, 1, 1,
-1.534595, -0.9498033, -0.876352, 0, 0, 0, 1, 1,
-1.53025, -0.0850577, -2.009961, 0, 0, 0, 1, 1,
-1.516824, -1.82973, -2.696319, 0, 0, 0, 1, 1,
-1.502998, -0.6502748, -3.019135, 0, 0, 0, 1, 1,
-1.497692, 0.02822334, -2.849758, 1, 1, 1, 1, 1,
-1.489265, 0.5712303, -0.03333072, 1, 1, 1, 1, 1,
-1.47667, -0.6350414, -0.4328212, 1, 1, 1, 1, 1,
-1.471274, 0.6991829, -1.0559, 1, 1, 1, 1, 1,
-1.469263, -0.5196906, -1.956696, 1, 1, 1, 1, 1,
-1.459732, 1.338866, -1.222147, 1, 1, 1, 1, 1,
-1.457987, 0.2464229, -2.888227, 1, 1, 1, 1, 1,
-1.452315, 0.002382984, -3.806111, 1, 1, 1, 1, 1,
-1.448838, -0.4073396, -2.713148, 1, 1, 1, 1, 1,
-1.442184, 0.5050876, -1.672319, 1, 1, 1, 1, 1,
-1.441687, -1.651976, -1.137598, 1, 1, 1, 1, 1,
-1.437675, 1.199396, -0.3770036, 1, 1, 1, 1, 1,
-1.436315, 0.2379618, -0.5316883, 1, 1, 1, 1, 1,
-1.423863, -1.006812, -1.408523, 1, 1, 1, 1, 1,
-1.418923, 1.120761, 0.1147217, 1, 1, 1, 1, 1,
-1.418269, -0.8600988, -1.907048, 0, 0, 1, 1, 1,
-1.416063, -0.4264316, -3.518421, 1, 0, 0, 1, 1,
-1.408422, 0.4999254, -2.394571, 1, 0, 0, 1, 1,
-1.378242, -0.7216752, -2.064993, 1, 0, 0, 1, 1,
-1.369197, -0.057623, -1.342325, 1, 0, 0, 1, 1,
-1.366835, 0.06731118, 1.431733, 1, 0, 0, 1, 1,
-1.358945, 0.3295063, -1.085448, 0, 0, 0, 1, 1,
-1.355875, 2.171575, -0.3219622, 0, 0, 0, 1, 1,
-1.354946, 0.560094, -1.943862, 0, 0, 0, 1, 1,
-1.352073, 0.3861771, -2.490646, 0, 0, 0, 1, 1,
-1.348387, -2.830994, -3.38631, 0, 0, 0, 1, 1,
-1.341775, 0.4898676, -1.791417, 0, 0, 0, 1, 1,
-1.334287, 0.4245057, -1.538826, 0, 0, 0, 1, 1,
-1.332463, 0.1704189, 0.2951505, 1, 1, 1, 1, 1,
-1.331948, 0.7965168, -1.136685, 1, 1, 1, 1, 1,
-1.331864, 0.239718, -0.5778286, 1, 1, 1, 1, 1,
-1.326825, 1.141327, -0.6564733, 1, 1, 1, 1, 1,
-1.314897, 1.026068, -1.224121, 1, 1, 1, 1, 1,
-1.311406, -0.5068017, -1.170421, 1, 1, 1, 1, 1,
-1.294377, 0.7828875, -1.336973, 1, 1, 1, 1, 1,
-1.292407, -2.100032, -1.160359, 1, 1, 1, 1, 1,
-1.291284, 0.1037973, -2.140612, 1, 1, 1, 1, 1,
-1.290805, 2.308363, -2.171756, 1, 1, 1, 1, 1,
-1.290176, 1.334031, 0.9603058, 1, 1, 1, 1, 1,
-1.278116, 0.8196433, 0.07075027, 1, 1, 1, 1, 1,
-1.258536, 0.4823184, -1.808221, 1, 1, 1, 1, 1,
-1.257614, 0.292075, -2.44775, 1, 1, 1, 1, 1,
-1.255386, -1.016984, -2.439118, 1, 1, 1, 1, 1,
-1.254861, 0.3111941, -2.089575, 0, 0, 1, 1, 1,
-1.249163, -0.1251097, -1.540225, 1, 0, 0, 1, 1,
-1.247188, -1.35405, -2.384181, 1, 0, 0, 1, 1,
-1.24484, -1.111263, -2.566442, 1, 0, 0, 1, 1,
-1.235341, -0.07142255, -2.31057, 1, 0, 0, 1, 1,
-1.223496, -0.6927009, -0.5055208, 1, 0, 0, 1, 1,
-1.216383, 0.9262882, 0.7563099, 0, 0, 0, 1, 1,
-1.216365, -0.3662814, -1.812125, 0, 0, 0, 1, 1,
-1.207736, 0.0008248965, -1.784978, 0, 0, 0, 1, 1,
-1.207306, -0.7063078, -3.306592, 0, 0, 0, 1, 1,
-1.205132, -0.1469493, -0.256261, 0, 0, 0, 1, 1,
-1.203882, 0.5188002, -0.6436778, 0, 0, 0, 1, 1,
-1.20281, 0.4573909, -3.222171, 0, 0, 0, 1, 1,
-1.20205, 1.083651, -1.190825, 1, 1, 1, 1, 1,
-1.19448, 1.218519, -1.959821, 1, 1, 1, 1, 1,
-1.192808, 0.4074191, -0.5909855, 1, 1, 1, 1, 1,
-1.1911, -0.03216868, -0.2799098, 1, 1, 1, 1, 1,
-1.190865, 1.59007, -0.5793532, 1, 1, 1, 1, 1,
-1.1847, 0.004761705, -1.5569, 1, 1, 1, 1, 1,
-1.184121, 0.5857242, -1.439577, 1, 1, 1, 1, 1,
-1.176333, -0.2161954, -2.040744, 1, 1, 1, 1, 1,
-1.172212, -2.190654, -4.72323, 1, 1, 1, 1, 1,
-1.167585, -1.475237, -1.235652, 1, 1, 1, 1, 1,
-1.164428, -0.1221856, -0.3153471, 1, 1, 1, 1, 1,
-1.163639, 0.04619544, -1.233466, 1, 1, 1, 1, 1,
-1.162661, 0.8050634, -2.273285, 1, 1, 1, 1, 1,
-1.160966, -0.8185196, -1.763092, 1, 1, 1, 1, 1,
-1.154839, 0.7641649, -1.505709, 1, 1, 1, 1, 1,
-1.153675, 1.057195, -0.7697612, 0, 0, 1, 1, 1,
-1.147708, -0.136193, -1.602435, 1, 0, 0, 1, 1,
-1.138121, 0.8037908, -0.2518977, 1, 0, 0, 1, 1,
-1.131632, -1.1508, -5.402317, 1, 0, 0, 1, 1,
-1.123393, 0.341832, -2.262055, 1, 0, 0, 1, 1,
-1.12211, 0.2000075, -0.3265143, 1, 0, 0, 1, 1,
-1.117646, -1.251676, -2.143766, 0, 0, 0, 1, 1,
-1.113511, -0.07530045, 0.2758316, 0, 0, 0, 1, 1,
-1.112148, -0.1969585, -2.705292, 0, 0, 0, 1, 1,
-1.108714, -0.02198396, -1.545847, 0, 0, 0, 1, 1,
-1.106037, -0.3193627, -1.712642, 0, 0, 0, 1, 1,
-1.097208, -2.13122, -4.148847, 0, 0, 0, 1, 1,
-1.096828, 0.2643008, -1.610487, 0, 0, 0, 1, 1,
-1.096443, 0.02962762, -3.070007, 1, 1, 1, 1, 1,
-1.085472, -0.3411204, 0.488828, 1, 1, 1, 1, 1,
-1.085243, -0.3784747, -1.770208, 1, 1, 1, 1, 1,
-1.079636, -0.3462225, -3.423039, 1, 1, 1, 1, 1,
-1.076117, -0.5601264, -0.2164713, 1, 1, 1, 1, 1,
-1.069663, -0.4773892, -3.019607, 1, 1, 1, 1, 1,
-1.067891, -0.3185865, -1.369988, 1, 1, 1, 1, 1,
-1.067568, 1.124138, -0.2252205, 1, 1, 1, 1, 1,
-1.061956, 1.026208, -0.5330355, 1, 1, 1, 1, 1,
-1.058987, -0.3835707, -1.975277, 1, 1, 1, 1, 1,
-1.057092, 0.08159974, -1.350356, 1, 1, 1, 1, 1,
-1.054044, 0.9115666, -1.434584, 1, 1, 1, 1, 1,
-1.034323, 0.5773427, -2.352947, 1, 1, 1, 1, 1,
-1.032427, 1.206836, -0.7068467, 1, 1, 1, 1, 1,
-1.029338, 1.013583, -3.122712, 1, 1, 1, 1, 1,
-1.027629, -0.6159821, -2.616028, 0, 0, 1, 1, 1,
-1.022021, -0.8651391, -1.574321, 1, 0, 0, 1, 1,
-1.016142, -0.04940743, -0.1712143, 1, 0, 0, 1, 1,
-1.014177, -0.5410368, -1.881104, 1, 0, 0, 1, 1,
-1.001768, -1.477881, 0.08334559, 1, 0, 0, 1, 1,
-0.9976169, 0.8289862, -1.376445, 1, 0, 0, 1, 1,
-0.9893832, 0.07280944, -0.7399099, 0, 0, 0, 1, 1,
-0.9881862, -0.4435807, -3.818179, 0, 0, 0, 1, 1,
-0.9750976, 1.042323, -2.451729, 0, 0, 0, 1, 1,
-0.9731834, 0.03628818, -2.98725, 0, 0, 0, 1, 1,
-0.9686146, -1.401289, -1.878077, 0, 0, 0, 1, 1,
-0.9664501, 0.4920358, -2.302915, 0, 0, 0, 1, 1,
-0.9661239, 1.13111, -0.3392024, 0, 0, 0, 1, 1,
-0.9616224, 0.9991322, 0.2295318, 1, 1, 1, 1, 1,
-0.957229, 1.127153, -0.8752086, 1, 1, 1, 1, 1,
-0.9476471, 2.679662, 1.431987, 1, 1, 1, 1, 1,
-0.9405031, -0.04222897, -1.175362, 1, 1, 1, 1, 1,
-0.9393677, 1.772599, 0.07965959, 1, 1, 1, 1, 1,
-0.9370733, 1.775167, -0.9352139, 1, 1, 1, 1, 1,
-0.9361181, 0.3501289, -1.20752, 1, 1, 1, 1, 1,
-0.9350104, -1.139144, -0.809988, 1, 1, 1, 1, 1,
-0.934472, 0.6670598, -5.223384e-05, 1, 1, 1, 1, 1,
-0.9291234, 0.6632371, -0.9841791, 1, 1, 1, 1, 1,
-0.9273755, 0.1668892, -2.148906, 1, 1, 1, 1, 1,
-0.921796, -0.1431822, -2.166229, 1, 1, 1, 1, 1,
-0.910684, 1.632807, 0.03055078, 1, 1, 1, 1, 1,
-0.9103276, -1.501837, -1.065596, 1, 1, 1, 1, 1,
-0.9022806, 2.192597, -1.064634, 1, 1, 1, 1, 1,
-0.8970714, -0.2277478, -3.176729, 0, 0, 1, 1, 1,
-0.8950216, -0.06292661, -2.134808, 1, 0, 0, 1, 1,
-0.89494, -1.922513, -3.614352, 1, 0, 0, 1, 1,
-0.8817281, 1.55415, -0.429711, 1, 0, 0, 1, 1,
-0.8808597, 0.2622348, -2.49358, 1, 0, 0, 1, 1,
-0.87464, 0.04016109, -1.369263, 1, 0, 0, 1, 1,
-0.8738039, 0.4380827, -0.3083923, 0, 0, 0, 1, 1,
-0.8694797, 0.6572167, -2.09516, 0, 0, 0, 1, 1,
-0.8438108, 1.151446, -0.5993102, 0, 0, 0, 1, 1,
-0.8374626, 0.4410732, -2.108964, 0, 0, 0, 1, 1,
-0.8357413, -0.4053849, -3.402754, 0, 0, 0, 1, 1,
-0.8335235, 0.8977859, -1.421414, 0, 0, 0, 1, 1,
-0.8300109, -1.199543, -2.475808, 0, 0, 0, 1, 1,
-0.8258452, 0.2652607, -3.764984, 1, 1, 1, 1, 1,
-0.8244237, -1.290356, -1.290299, 1, 1, 1, 1, 1,
-0.8216837, 0.4649621, -0.6694359, 1, 1, 1, 1, 1,
-0.8121845, 0.3687263, -1.98979, 1, 1, 1, 1, 1,
-0.8077737, -0.1182733, -1.987624, 1, 1, 1, 1, 1,
-0.8069093, -0.2753772, -0.4715637, 1, 1, 1, 1, 1,
-0.8046081, 0.5532452, 0.03372104, 1, 1, 1, 1, 1,
-0.7905137, -0.09000488, 0.8775206, 1, 1, 1, 1, 1,
-0.7867258, 0.06538563, -1.217021, 1, 1, 1, 1, 1,
-0.7829902, 0.3626712, -1.977944, 1, 1, 1, 1, 1,
-0.7779587, 1.270274, -0.4872442, 1, 1, 1, 1, 1,
-0.7711285, 0.1020691, -1.546762, 1, 1, 1, 1, 1,
-0.7607197, 0.01950424, -2.31301, 1, 1, 1, 1, 1,
-0.7591351, 0.2476369, -1.041746, 1, 1, 1, 1, 1,
-0.7589682, -0.3103758, -2.284761, 1, 1, 1, 1, 1,
-0.7562519, -0.4667917, -1.622937, 0, 0, 1, 1, 1,
-0.7543815, 1.584102, -0.4321552, 1, 0, 0, 1, 1,
-0.7512619, -0.4101442, -2.67657, 1, 0, 0, 1, 1,
-0.7399014, 0.00249295, -1.512387, 1, 0, 0, 1, 1,
-0.7372738, -0.9025427, -1.815729, 1, 0, 0, 1, 1,
-0.7365831, 0.6588797, -1.781283, 1, 0, 0, 1, 1,
-0.7337376, -0.9129041, -1.457097, 0, 0, 0, 1, 1,
-0.7293386, -0.7476422, -2.114262, 0, 0, 0, 1, 1,
-0.7275673, 0.380999, -0.1488664, 0, 0, 0, 1, 1,
-0.7237832, -0.08332774, -2.272795, 0, 0, 0, 1, 1,
-0.7206916, 1.187155, -1.135636, 0, 0, 0, 1, 1,
-0.7201405, 0.1147739, -0.1648761, 0, 0, 0, 1, 1,
-0.7140345, -0.570154, -1.503096, 0, 0, 0, 1, 1,
-0.7081152, -0.9168673, -3.256625, 1, 1, 1, 1, 1,
-0.7017234, -1.174469, -1.268664, 1, 1, 1, 1, 1,
-0.7013355, 0.7576078, -1.075407, 1, 1, 1, 1, 1,
-0.6977237, -0.7401006, -1.880824, 1, 1, 1, 1, 1,
-0.6942601, 1.56684, 1.243826, 1, 1, 1, 1, 1,
-0.6933375, 0.3205308, 0.5873127, 1, 1, 1, 1, 1,
-0.6928393, 0.1037565, 0.1393821, 1, 1, 1, 1, 1,
-0.6876742, 0.01579014, -2.178322, 1, 1, 1, 1, 1,
-0.6867194, 1.258968, -1.580979, 1, 1, 1, 1, 1,
-0.685977, -0.2083357, -1.584104, 1, 1, 1, 1, 1,
-0.6857362, 0.2541839, -0.468391, 1, 1, 1, 1, 1,
-0.6854467, 1.20461, -0.8063776, 1, 1, 1, 1, 1,
-0.6836242, -1.794155, -3.005789, 1, 1, 1, 1, 1,
-0.6800506, -0.8473962, -2.57045, 1, 1, 1, 1, 1,
-0.6771466, 2.171632, 0.3773476, 1, 1, 1, 1, 1,
-0.6721472, -1.303753, -5.147075, 0, 0, 1, 1, 1,
-0.6608599, 0.610859, -1.036029, 1, 0, 0, 1, 1,
-0.6565855, -0.7141702, 0.05277811, 1, 0, 0, 1, 1,
-0.6504337, 0.875178, -1.429221, 1, 0, 0, 1, 1,
-0.6488959, 2.177527, -0.5562125, 1, 0, 0, 1, 1,
-0.6459917, -2.006446, -2.151052, 1, 0, 0, 1, 1,
-0.644299, 1.336006, 0.6809101, 0, 0, 0, 1, 1,
-0.6433904, -0.3171088, -1.804757, 0, 0, 0, 1, 1,
-0.6424606, 0.05078764, 0.1375867, 0, 0, 0, 1, 1,
-0.6407264, -1.336378, -2.459751, 0, 0, 0, 1, 1,
-0.6399355, 0.3284118, -3.090002, 0, 0, 0, 1, 1,
-0.6375044, -1.035446, -1.467003, 0, 0, 0, 1, 1,
-0.6363614, -1.483248, -4.961893, 0, 0, 0, 1, 1,
-0.6326614, 0.8291822, -1.222329, 1, 1, 1, 1, 1,
-0.6278228, 0.5465596, 0.7229861, 1, 1, 1, 1, 1,
-0.6236182, 0.1301032, -0.3881216, 1, 1, 1, 1, 1,
-0.621925, 2.32996, -3.508242, 1, 1, 1, 1, 1,
-0.6216208, 0.9457408, -1.437257, 1, 1, 1, 1, 1,
-0.6207677, -0.3005927, -0.5398966, 1, 1, 1, 1, 1,
-0.6196871, 0.534306, -2.631032, 1, 1, 1, 1, 1,
-0.6126816, -1.352409, -3.800433, 1, 1, 1, 1, 1,
-0.611366, -1.053588, -2.606263, 1, 1, 1, 1, 1,
-0.6104169, 0.1498205, -1.011757, 1, 1, 1, 1, 1,
-0.6074131, 0.6492714, 0.8874946, 1, 1, 1, 1, 1,
-0.6069416, -1.85877, -1.758281, 1, 1, 1, 1, 1,
-0.6041968, -0.05452704, -1.945874, 1, 1, 1, 1, 1,
-0.6036357, 0.775419, 0.0201531, 1, 1, 1, 1, 1,
-0.6001459, -1.695461, -3.271032, 1, 1, 1, 1, 1,
-0.5994123, 0.8665619, -1.664831, 0, 0, 1, 1, 1,
-0.5986328, -1.242077, -2.281069, 1, 0, 0, 1, 1,
-0.5916066, -0.2935879, -1.529861, 1, 0, 0, 1, 1,
-0.5900546, 0.1835103, -1.482871, 1, 0, 0, 1, 1,
-0.5887609, -1.356189, -1.912437, 1, 0, 0, 1, 1,
-0.5845112, 1.13184, -1.318625, 1, 0, 0, 1, 1,
-0.5834559, 0.09263325, 0.09054948, 0, 0, 0, 1, 1,
-0.5816145, 1.073179, -0.4830975, 0, 0, 0, 1, 1,
-0.5803837, 0.4491107, -1.316252, 0, 0, 0, 1, 1,
-0.5802716, 0.05840898, -2.685207, 0, 0, 0, 1, 1,
-0.5787943, 1.277794, 0.5743671, 0, 0, 0, 1, 1,
-0.5768675, -0.7037717, -2.94898, 0, 0, 0, 1, 1,
-0.576305, -0.4979697, -2.217397, 0, 0, 0, 1, 1,
-0.5731413, -0.2439259, -2.008855, 1, 1, 1, 1, 1,
-0.5657116, 0.5078742, -0.6290042, 1, 1, 1, 1, 1,
-0.5654537, 0.393096, -0.8173593, 1, 1, 1, 1, 1,
-0.5654325, -1.588017, -2.471629, 1, 1, 1, 1, 1,
-0.5632174, 1.17142, -0.7058194, 1, 1, 1, 1, 1,
-0.5622209, -1.216261, -2.415255, 1, 1, 1, 1, 1,
-0.561173, 0.7514156, -1.639682, 1, 1, 1, 1, 1,
-0.5611104, -0.2672555, -1.41336, 1, 1, 1, 1, 1,
-0.5594385, 1.334813, 0.3482213, 1, 1, 1, 1, 1,
-0.5579649, 1.653141, 0.9398279, 1, 1, 1, 1, 1,
-0.5564079, 1.315367, 0.3196398, 1, 1, 1, 1, 1,
-0.5558943, -1.665278, -1.831931, 1, 1, 1, 1, 1,
-0.5404379, 0.2792558, -1.982731, 1, 1, 1, 1, 1,
-0.5401236, -1.064281, -1.812937, 1, 1, 1, 1, 1,
-0.5363149, -0.326721, -2.022371, 1, 1, 1, 1, 1,
-0.5251554, 0.7185436, -0.6357978, 0, 0, 1, 1, 1,
-0.5224242, -0.1173348, -2.046769, 1, 0, 0, 1, 1,
-0.5223594, 1.033037, -1.418121, 1, 0, 0, 1, 1,
-0.5223264, 1.543393, -0.7407957, 1, 0, 0, 1, 1,
-0.5101938, -0.07467128, -2.347187, 1, 0, 0, 1, 1,
-0.5010885, -0.7418124, -2.696309, 1, 0, 0, 1, 1,
-0.4951994, -0.7468352, -3.188757, 0, 0, 0, 1, 1,
-0.4939434, -0.462469, -1.590837, 0, 0, 0, 1, 1,
-0.4897414, -0.4978639, -2.177838, 0, 0, 0, 1, 1,
-0.4892155, -1.611445, -3.329564, 0, 0, 0, 1, 1,
-0.4845895, -0.1041704, -0.4421016, 0, 0, 0, 1, 1,
-0.478504, -1.049146, -3.319806, 0, 0, 0, 1, 1,
-0.4750917, -0.3712713, -4.06939, 0, 0, 0, 1, 1,
-0.4742812, -1.280323, -3.930286, 1, 1, 1, 1, 1,
-0.4689893, -0.1306232, -1.619347, 1, 1, 1, 1, 1,
-0.4679961, -1.137042, -2.389613, 1, 1, 1, 1, 1,
-0.4668842, 1.552385, -1.60169, 1, 1, 1, 1, 1,
-0.4652559, -1.186971, -3.667037, 1, 1, 1, 1, 1,
-0.4633489, 1.174377, -1.778953, 1, 1, 1, 1, 1,
-0.462993, 0.5878186, -0.9144951, 1, 1, 1, 1, 1,
-0.4624385, -0.2829006, -0.6957359, 1, 1, 1, 1, 1,
-0.462219, 1.004896, -0.3530542, 1, 1, 1, 1, 1,
-0.4619441, -1.434019, -3.392794, 1, 1, 1, 1, 1,
-0.4619396, -0.6875917, -1.661559, 1, 1, 1, 1, 1,
-0.4574674, -2.527965, -3.623599, 1, 1, 1, 1, 1,
-0.4537637, -0.6165678, -2.026255, 1, 1, 1, 1, 1,
-0.4528635, -1.616681, -1.733537, 1, 1, 1, 1, 1,
-0.4526139, 0.8662966, 0.08578014, 1, 1, 1, 1, 1,
-0.4475546, -0.1143963, -3.772477, 0, 0, 1, 1, 1,
-0.445827, 0.5026157, -2.281205, 1, 0, 0, 1, 1,
-0.4457133, -0.462179, -1.774891, 1, 0, 0, 1, 1,
-0.4389051, -0.9686911, -5.104949, 1, 0, 0, 1, 1,
-0.4350906, -0.6739947, -2.086003, 1, 0, 0, 1, 1,
-0.4335281, -0.6911331, -2.085026, 1, 0, 0, 1, 1,
-0.4297097, 0.8609255, 0.1370111, 0, 0, 0, 1, 1,
-0.419768, 0.3251515, -0.003859368, 0, 0, 0, 1, 1,
-0.4194318, 0.4920033, -0.3216973, 0, 0, 0, 1, 1,
-0.4159469, 1.38176, -0.5393462, 0, 0, 0, 1, 1,
-0.4098107, 2.111783, -0.9506027, 0, 0, 0, 1, 1,
-0.4091344, 0.4854721, -2.144926, 0, 0, 0, 1, 1,
-0.4073389, -0.6990356, -2.126482, 0, 0, 0, 1, 1,
-0.4026843, 2.174704, -0.5727199, 1, 1, 1, 1, 1,
-0.3924105, 0.08914034, -2.630946, 1, 1, 1, 1, 1,
-0.390861, -0.5421383, -0.8508974, 1, 1, 1, 1, 1,
-0.3900652, 0.410872, -1.032374, 1, 1, 1, 1, 1,
-0.3890545, -1.443744, -3.232632, 1, 1, 1, 1, 1,
-0.3879601, 0.0002961408, -2.093379, 1, 1, 1, 1, 1,
-0.3865668, 1.119152, -1.593579, 1, 1, 1, 1, 1,
-0.3864752, 0.6169983, -2.551137, 1, 1, 1, 1, 1,
-0.3857053, 0.4389478, 0.1238295, 1, 1, 1, 1, 1,
-0.3840502, 1.173952, 2.031312, 1, 1, 1, 1, 1,
-0.3813231, -1.992105, -3.549026, 1, 1, 1, 1, 1,
-0.3764662, -0.9205573, -2.254768, 1, 1, 1, 1, 1,
-0.3744783, 1.892835, 0.6118944, 1, 1, 1, 1, 1,
-0.3742873, -1.17392, -3.21411, 1, 1, 1, 1, 1,
-0.3665221, -1.488959, -1.397495, 1, 1, 1, 1, 1,
-0.3628081, -1.541512, -2.925254, 0, 0, 1, 1, 1,
-0.3624646, -1.904633, -1.43306, 1, 0, 0, 1, 1,
-0.3532288, 1.660135, -0.9044597, 1, 0, 0, 1, 1,
-0.35199, -0.01028287, -2.859184, 1, 0, 0, 1, 1,
-0.3487657, 1.098342, 1.841968, 1, 0, 0, 1, 1,
-0.3481174, 0.5915343, -1.665792, 1, 0, 0, 1, 1,
-0.3416237, -0.6065737, -3.084393, 0, 0, 0, 1, 1,
-0.3393485, -0.8322924, -1.226115, 0, 0, 0, 1, 1,
-0.3352042, 0.455491, 0.9719086, 0, 0, 0, 1, 1,
-0.3336504, 0.001733827, -2.333277, 0, 0, 0, 1, 1,
-0.3332085, -0.374831, -1.473469, 0, 0, 0, 1, 1,
-0.3260752, 0.4272669, 1.206077, 0, 0, 0, 1, 1,
-0.325303, -0.2677737, -0.8592836, 0, 0, 0, 1, 1,
-0.3235456, -0.6639446, -1.794195, 1, 1, 1, 1, 1,
-0.3211794, -0.08837882, -1.918744, 1, 1, 1, 1, 1,
-0.3202043, 0.5306307, -1.350498, 1, 1, 1, 1, 1,
-0.3156752, -1.240381, -3.146523, 1, 1, 1, 1, 1,
-0.3141661, -0.9799999, -1.467141, 1, 1, 1, 1, 1,
-0.3133812, 0.2999632, -1.455109, 1, 1, 1, 1, 1,
-0.3126838, -0.1381673, -1.046535, 1, 1, 1, 1, 1,
-0.3102593, 0.2355639, 1.037671, 1, 1, 1, 1, 1,
-0.3010921, 0.08924894, -0.8796361, 1, 1, 1, 1, 1,
-0.2994712, 0.732991, -0.6309885, 1, 1, 1, 1, 1,
-0.2986261, -0.1354863, -3.4889, 1, 1, 1, 1, 1,
-0.2967859, 0.870378, -0.04676302, 1, 1, 1, 1, 1,
-0.293628, -0.6395326, -3.61327, 1, 1, 1, 1, 1,
-0.2914882, 1.254027, -0.9230778, 1, 1, 1, 1, 1,
-0.2850959, -1.136337, -3.120298, 1, 1, 1, 1, 1,
-0.2833842, -0.3611197, -3.998045, 0, 0, 1, 1, 1,
-0.2824501, -0.2272212, -2.626274, 1, 0, 0, 1, 1,
-0.2780635, 0.3925518, -1.564444, 1, 0, 0, 1, 1,
-0.2704754, 0.1121878, -0.5413384, 1, 0, 0, 1, 1,
-0.2699649, -0.2285362, -1.652635, 1, 0, 0, 1, 1,
-0.2674775, 1.039243, 0.1121152, 1, 0, 0, 1, 1,
-0.2644336, 0.2996695, -1.115201, 0, 0, 0, 1, 1,
-0.2625391, -0.4512091, -0.9466944, 0, 0, 0, 1, 1,
-0.2621495, 1.930901, -2.188979, 0, 0, 0, 1, 1,
-0.2585432, 0.06594951, -1.32757, 0, 0, 0, 1, 1,
-0.247541, 0.6115565, 1.88285, 0, 0, 0, 1, 1,
-0.2434153, 0.09190802, -1.406542, 0, 0, 0, 1, 1,
-0.242331, 0.8159124, 1.012431, 0, 0, 0, 1, 1,
-0.2400029, -0.06716986, -1.880103, 1, 1, 1, 1, 1,
-0.2301952, 0.1854053, 0.6526477, 1, 1, 1, 1, 1,
-0.2297217, 0.4121578, 0.9949107, 1, 1, 1, 1, 1,
-0.2254714, 1.857676, 0.3423637, 1, 1, 1, 1, 1,
-0.2242074, 0.2912069, -0.6919557, 1, 1, 1, 1, 1,
-0.2231719, 0.09142893, -0.6741089, 1, 1, 1, 1, 1,
-0.221763, 0.874599, 1.323945, 1, 1, 1, 1, 1,
-0.2193965, -0.1117449, -1.743753, 1, 1, 1, 1, 1,
-0.2192492, 1.326903, 1.607054, 1, 1, 1, 1, 1,
-0.2096371, 0.1658617, -1.825626, 1, 1, 1, 1, 1,
-0.2081406, 0.6502183, -0.5397848, 1, 1, 1, 1, 1,
-0.2072084, -0.627982, -2.84254, 1, 1, 1, 1, 1,
-0.2067096, -0.7759557, -2.60765, 1, 1, 1, 1, 1,
-0.199801, 0.0605929, -1.695021, 1, 1, 1, 1, 1,
-0.1988608, 0.2663519, -1.161501, 1, 1, 1, 1, 1,
-0.1929903, -0.1464487, -2.484412, 0, 0, 1, 1, 1,
-0.1875473, 0.6041953, -0.612479, 1, 0, 0, 1, 1,
-0.1850182, -0.3395737, -2.001973, 1, 0, 0, 1, 1,
-0.1789259, 0.7061039, 1.668227, 1, 0, 0, 1, 1,
-0.1787282, 2.879347, 0.354269, 1, 0, 0, 1, 1,
-0.1775292, -3.024196, -2.735207, 1, 0, 0, 1, 1,
-0.1753434, 0.3621117, -0.979807, 0, 0, 0, 1, 1,
-0.1747233, -1.59095, -3.124809, 0, 0, 0, 1, 1,
-0.1737008, 0.413023, -2.335383, 0, 0, 0, 1, 1,
-0.1697289, 0.5226859, 0.9556544, 0, 0, 0, 1, 1,
-0.1600563, -1.540736, -1.975059, 0, 0, 0, 1, 1,
-0.1579125, -1.270006, -3.703085, 0, 0, 0, 1, 1,
-0.1568457, -1.626643, -1.830529, 0, 0, 0, 1, 1,
-0.1555777, -0.8955958, -2.900605, 1, 1, 1, 1, 1,
-0.1506315, 1.091692, -0.7722389, 1, 1, 1, 1, 1,
-0.1500321, -1.065055, -2.576247, 1, 1, 1, 1, 1,
-0.1492381, -0.04720045, -2.045085, 1, 1, 1, 1, 1,
-0.1429286, -0.59198, -4.160499, 1, 1, 1, 1, 1,
-0.1428521, -0.2601932, -0.805512, 1, 1, 1, 1, 1,
-0.1424637, 1.061791, -0.06858306, 1, 1, 1, 1, 1,
-0.1412849, -0.426955, -4.514439, 1, 1, 1, 1, 1,
-0.1379023, -1.465702, -3.374413, 1, 1, 1, 1, 1,
-0.1300274, -0.5002481, -2.313873, 1, 1, 1, 1, 1,
-0.1294656, -1.400666, -2.942105, 1, 1, 1, 1, 1,
-0.1287887, -0.4455378, -2.780315, 1, 1, 1, 1, 1,
-0.1279354, -0.1708273, -2.401742, 1, 1, 1, 1, 1,
-0.1275664, -1.025882, -2.789088, 1, 1, 1, 1, 1,
-0.1233842, -0.9376889, -5.182224, 1, 1, 1, 1, 1,
-0.1232746, 0.6915206, 1.073933, 0, 0, 1, 1, 1,
-0.11878, 0.6538447, -0.9502054, 1, 0, 0, 1, 1,
-0.1174566, 2.257932, -0.5254443, 1, 0, 0, 1, 1,
-0.1158255, -1.317934, -2.976543, 1, 0, 0, 1, 1,
-0.1107651, 0.7685292, -0.5557505, 1, 0, 0, 1, 1,
-0.1095367, 1.021861, 0.370579, 1, 0, 0, 1, 1,
-0.1041029, -1.315715, -2.515612, 0, 0, 0, 1, 1,
-0.103408, -0.7584702, -4.424977, 0, 0, 0, 1, 1,
-0.09917229, 0.2443786, -1.78757, 0, 0, 0, 1, 1,
-0.09877901, 0.6423516, 0.03792177, 0, 0, 0, 1, 1,
-0.09836771, -1.278824, -1.647637, 0, 0, 0, 1, 1,
-0.09561247, 0.3201856, 0.2501192, 0, 0, 0, 1, 1,
-0.09453167, 0.5802673, 1.321722, 0, 0, 0, 1, 1,
-0.09391332, -1.403107, -0.3509166, 1, 1, 1, 1, 1,
-0.09193198, -0.8794267, -2.103219, 1, 1, 1, 1, 1,
-0.08971, -0.1736548, -3.546593, 1, 1, 1, 1, 1,
-0.08893047, 0.2277778, 0.0197785, 1, 1, 1, 1, 1,
-0.08881103, 1.593294, 0.08798043, 1, 1, 1, 1, 1,
-0.08852684, -0.5253593, -3.444461, 1, 1, 1, 1, 1,
-0.08708549, 0.01166639, -1.370433, 1, 1, 1, 1, 1,
-0.08702545, -2.073936, -2.234395, 1, 1, 1, 1, 1,
-0.08643536, -0.2211075, -3.059832, 1, 1, 1, 1, 1,
-0.08261935, -0.04945548, -1.484848, 1, 1, 1, 1, 1,
-0.08026721, -1.527199, -2.245219, 1, 1, 1, 1, 1,
-0.07915092, -0.06844573, -3.955766, 1, 1, 1, 1, 1,
-0.0725042, -0.6518674, -2.366825, 1, 1, 1, 1, 1,
-0.0715346, 0.662149, -1.991721, 1, 1, 1, 1, 1,
-0.06930389, -0.6618325, -2.877203, 1, 1, 1, 1, 1,
-0.06522351, 1.402705, 1.391155, 0, 0, 1, 1, 1,
-0.0644133, -0.3240767, -2.488298, 1, 0, 0, 1, 1,
-0.06370666, -2.000573, -3.328496, 1, 0, 0, 1, 1,
-0.0611774, 0.1529494, 0.6010327, 1, 0, 0, 1, 1,
-0.05990724, -0.7226232, -1.831705, 1, 0, 0, 1, 1,
-0.05555677, 0.718868, -0.1101258, 1, 0, 0, 1, 1,
-0.05430621, 0.1993878, -0.4433352, 0, 0, 0, 1, 1,
-0.05033724, -0.5012526, -2.261796, 0, 0, 0, 1, 1,
-0.04907016, 0.1325044, -1.430434, 0, 0, 0, 1, 1,
-0.04192986, -0.2832455, -5.830699, 0, 0, 0, 1, 1,
-0.04176391, 1.173097, -0.04995604, 0, 0, 0, 1, 1,
-0.03682295, 0.7777414, -0.02342882, 0, 0, 0, 1, 1,
-0.02918411, -0.3638923, -2.845922, 0, 0, 0, 1, 1,
-0.02565825, -0.004628678, -1.633359, 1, 1, 1, 1, 1,
-0.02426106, 0.2292363, -0.8810483, 1, 1, 1, 1, 1,
-0.02422446, 0.5633256, 0.8950103, 1, 1, 1, 1, 1,
-0.02379776, 0.2113264, 0.3330397, 1, 1, 1, 1, 1,
-0.02316906, -0.9963771, -2.671895, 1, 1, 1, 1, 1,
-0.02270564, 1.563572, -0.02592161, 1, 1, 1, 1, 1,
-0.01715664, 1.594926, 0.7177386, 1, 1, 1, 1, 1,
-0.008497586, 0.8653294, 0.3814164, 1, 1, 1, 1, 1,
-0.004877881, -0.9379693, -4.198487, 1, 1, 1, 1, 1,
-0.001826042, -0.3073473, -3.468203, 1, 1, 1, 1, 1,
0.001028431, -0.5104424, 2.017247, 1, 1, 1, 1, 1,
0.01233653, -0.6132701, 1.431983, 1, 1, 1, 1, 1,
0.0137637, -2.119619, 4.963066, 1, 1, 1, 1, 1,
0.01408942, 1.0202, 0.2137143, 1, 1, 1, 1, 1,
0.01677932, -0.3754365, 4.381796, 1, 1, 1, 1, 1,
0.01852915, -1.047582, 2.278993, 0, 0, 1, 1, 1,
0.02305675, -0.1347527, 3.084665, 1, 0, 0, 1, 1,
0.02381473, -2.053824, 3.763188, 1, 0, 0, 1, 1,
0.02540667, 0.5489766, -1.692167, 1, 0, 0, 1, 1,
0.02569212, 0.6278954, 0.6637598, 1, 0, 0, 1, 1,
0.02968756, -1.196911, 3.680578, 1, 0, 0, 1, 1,
0.03193076, 1.912216, 0.9182733, 0, 0, 0, 1, 1,
0.03800678, 0.2763959, -0.1200423, 0, 0, 0, 1, 1,
0.03935112, 0.2177783, 0.8166572, 0, 0, 0, 1, 1,
0.04191143, 1.424035, -0.5682488, 0, 0, 0, 1, 1,
0.0422716, -1.132758, 4.990765, 0, 0, 0, 1, 1,
0.042293, 0.1127369, 0.05509275, 0, 0, 0, 1, 1,
0.04492247, -1.764514, 3.119587, 0, 0, 0, 1, 1,
0.04670105, 2.573435, 0.2893704, 1, 1, 1, 1, 1,
0.04718842, -0.06008159, 2.195188, 1, 1, 1, 1, 1,
0.04853673, -0.0100148, 2.221335, 1, 1, 1, 1, 1,
0.04868257, 0.1222804, -0.1403676, 1, 1, 1, 1, 1,
0.0492794, -0.7597626, 2.107763, 1, 1, 1, 1, 1,
0.04947435, -0.4537709, 3.79059, 1, 1, 1, 1, 1,
0.0516277, -0.7882403, 5.259539, 1, 1, 1, 1, 1,
0.05188258, 0.425842, -0.105572, 1, 1, 1, 1, 1,
0.06049992, -0.9152434, 4.489254, 1, 1, 1, 1, 1,
0.064487, 1.072504, 1.807377, 1, 1, 1, 1, 1,
0.0667189, -0.4568331, 3.153832, 1, 1, 1, 1, 1,
0.06901023, -2.113668, 3.470443, 1, 1, 1, 1, 1,
0.07138288, -1.467251, 3.527215, 1, 1, 1, 1, 1,
0.0724615, 0.7248231, -0.4728774, 1, 1, 1, 1, 1,
0.07420635, 0.7836435, -1.408501, 1, 1, 1, 1, 1,
0.07652712, -1.076535, 5.128475, 0, 0, 1, 1, 1,
0.07893208, 1.07952, 2.056787, 1, 0, 0, 1, 1,
0.08334171, 0.5725552, 0.704621, 1, 0, 0, 1, 1,
0.08551306, -0.194561, 3.675284, 1, 0, 0, 1, 1,
0.08653683, 1.29967, -0.06244327, 1, 0, 0, 1, 1,
0.08671535, -0.3780289, 1.294948, 1, 0, 0, 1, 1,
0.08769865, -0.9986172, 3.514546, 0, 0, 0, 1, 1,
0.0879124, 0.8592357, 0.6706002, 0, 0, 0, 1, 1,
0.08869656, 0.4343524, -0.007902177, 0, 0, 0, 1, 1,
0.0919756, 0.06508991, 0.5448041, 0, 0, 0, 1, 1,
0.09281778, -1.259581, 3.791633, 0, 0, 0, 1, 1,
0.09299419, -0.469252, 4.057171, 0, 0, 0, 1, 1,
0.0941572, 0.407949, 1.857906, 0, 0, 0, 1, 1,
0.09583542, -0.7416319, 2.026441, 1, 1, 1, 1, 1,
0.09613743, 0.1598061, 0.1736548, 1, 1, 1, 1, 1,
0.09993042, -0.6225437, 3.715083, 1, 1, 1, 1, 1,
0.1016335, 0.566061, -0.6307098, 1, 1, 1, 1, 1,
0.1062679, 0.4351692, 1.595765, 1, 1, 1, 1, 1,
0.1079182, 0.2225893, 0.8658592, 1, 1, 1, 1, 1,
0.1094995, -0.7445195, 0.9469489, 1, 1, 1, 1, 1,
0.1095242, 0.724165, 1.35339, 1, 1, 1, 1, 1,
0.1117355, 0.3220763, 0.0688205, 1, 1, 1, 1, 1,
0.1121988, -1.999901, 6.148489, 1, 1, 1, 1, 1,
0.1122311, 0.5353284, 0.1599233, 1, 1, 1, 1, 1,
0.1209304, 0.05325244, 1.295409, 1, 1, 1, 1, 1,
0.1270549, -0.4288352, 3.254791, 1, 1, 1, 1, 1,
0.1285758, 1.650306, -0.7728628, 1, 1, 1, 1, 1,
0.1286196, 1.579427, -1.411546, 1, 1, 1, 1, 1,
0.1347557, 0.2608707, 1.590713, 0, 0, 1, 1, 1,
0.1496003, -0.05193172, 1.614196, 1, 0, 0, 1, 1,
0.1506378, -0.583642, 5.673912, 1, 0, 0, 1, 1,
0.1528517, 0.6556609, -0.4769073, 1, 0, 0, 1, 1,
0.154503, -1.182722, 4.190427, 1, 0, 0, 1, 1,
0.1553131, 0.8515933, -0.2988577, 1, 0, 0, 1, 1,
0.1563426, 0.842746, -0.828147, 0, 0, 0, 1, 1,
0.1577842, 0.351222, -0.09751861, 0, 0, 0, 1, 1,
0.1579093, -0.6544253, 3.469687, 0, 0, 0, 1, 1,
0.1623761, -2.096597, 2.330464, 0, 0, 0, 1, 1,
0.1649857, 2.02165, 1.093652, 0, 0, 0, 1, 1,
0.1654411, 1.234242, 0.8909124, 0, 0, 0, 1, 1,
0.1664228, 0.6037839, -1.576687, 0, 0, 0, 1, 1,
0.1672135, -1.28656, 2.014433, 1, 1, 1, 1, 1,
0.1710204, 0.2715825, 0.803884, 1, 1, 1, 1, 1,
0.1728199, -0.2423534, 2.896829, 1, 1, 1, 1, 1,
0.1739716, -0.3012815, 2.290153, 1, 1, 1, 1, 1,
0.174064, 1.408705, 0.3869197, 1, 1, 1, 1, 1,
0.1775939, 0.4518553, 1.579808, 1, 1, 1, 1, 1,
0.178902, -1.395385, 3.457377, 1, 1, 1, 1, 1,
0.1793653, -0.7818357, 0.8855975, 1, 1, 1, 1, 1,
0.1796271, 1.002476, -1.625474, 1, 1, 1, 1, 1,
0.181404, -0.4027763, 1.169942, 1, 1, 1, 1, 1,
0.1815402, 1.886246, -0.6861622, 1, 1, 1, 1, 1,
0.1830022, 1.036546, -0.6672668, 1, 1, 1, 1, 1,
0.1852395, 0.1803385, -0.2291516, 1, 1, 1, 1, 1,
0.1858946, 0.7423173, 1.574347, 1, 1, 1, 1, 1,
0.188535, -0.08178993, 1.192627, 1, 1, 1, 1, 1,
0.191354, -0.2978807, 3.607973, 0, 0, 1, 1, 1,
0.1919414, -0.985581, 3.659655, 1, 0, 0, 1, 1,
0.1947366, -0.2355656, 2.887539, 1, 0, 0, 1, 1,
0.1957945, -0.1972997, 2.631764, 1, 0, 0, 1, 1,
0.1971144, 1.37796, 0.7326428, 1, 0, 0, 1, 1,
0.2041878, -0.7356992, 3.472813, 1, 0, 0, 1, 1,
0.2098842, 0.8498396, -0.7228043, 0, 0, 0, 1, 1,
0.210303, 0.9933035, 0.6996336, 0, 0, 0, 1, 1,
0.2107121, 0.02126647, 2.270466, 0, 0, 0, 1, 1,
0.213665, 0.4658441, -0.6090907, 0, 0, 0, 1, 1,
0.2158675, 0.230005, 1.946351, 0, 0, 0, 1, 1,
0.2169487, 1.241762, -0.06821031, 0, 0, 0, 1, 1,
0.2196802, 0.6463331, 0.8442265, 0, 0, 0, 1, 1,
0.2212023, -1.571672, 2.729818, 1, 1, 1, 1, 1,
0.2295733, 0.6492823, 1.475464, 1, 1, 1, 1, 1,
0.2304211, 0.8720647, -1.281772, 1, 1, 1, 1, 1,
0.2332636, 0.3350582, -0.1700279, 1, 1, 1, 1, 1,
0.236424, 1.512103, 1.484433, 1, 1, 1, 1, 1,
0.2374949, -0.09068627, 1.916497, 1, 1, 1, 1, 1,
0.246535, -0.7682444, 4.001012, 1, 1, 1, 1, 1,
0.2544355, -0.2569823, 2.80898, 1, 1, 1, 1, 1,
0.2555136, 0.08536565, 1.323476, 1, 1, 1, 1, 1,
0.2586878, 0.7581606, -0.4031138, 1, 1, 1, 1, 1,
0.2592578, -0.1512864, 2.581802, 1, 1, 1, 1, 1,
0.2627851, -1.993892, 2.467497, 1, 1, 1, 1, 1,
0.2630213, 0.1431134, 1.529893, 1, 1, 1, 1, 1,
0.2642594, -1.611395, 3.491902, 1, 1, 1, 1, 1,
0.2664, 0.9388025, 0.9145364, 1, 1, 1, 1, 1,
0.2696066, -2.05873, 2.958686, 0, 0, 1, 1, 1,
0.2699286, 0.9305428, -1.286748, 1, 0, 0, 1, 1,
0.2720433, -1.379751, 3.432565, 1, 0, 0, 1, 1,
0.2749755, 0.3822834, 0.2676872, 1, 0, 0, 1, 1,
0.2751341, -1.359118, 4.419856, 1, 0, 0, 1, 1,
0.2845556, 0.5153289, 0.7648436, 1, 0, 0, 1, 1,
0.2885831, 0.8452306, -0.8629367, 0, 0, 0, 1, 1,
0.2885973, -1.252326, 0.9395159, 0, 0, 0, 1, 1,
0.2897312, 0.3162793, 2.783039, 0, 0, 0, 1, 1,
0.2922225, 1.055893, 1.446765, 0, 0, 0, 1, 1,
0.2956766, -0.2416683, 2.867033, 0, 0, 0, 1, 1,
0.2958324, -0.3358629, 3.91846, 0, 0, 0, 1, 1,
0.2988283, -0.407314, 2.404258, 0, 0, 0, 1, 1,
0.3012955, 1.084534, 2.093396, 1, 1, 1, 1, 1,
0.3055013, 0.2055026, 0.04566804, 1, 1, 1, 1, 1,
0.306769, 0.8147088, -0.3767138, 1, 1, 1, 1, 1,
0.3069211, -0.2340873, 0.1941794, 1, 1, 1, 1, 1,
0.3122354, 0.5568246, 0.9040533, 1, 1, 1, 1, 1,
0.3141442, 1.6664, 0.4110011, 1, 1, 1, 1, 1,
0.3161834, -0.2824578, 2.483897, 1, 1, 1, 1, 1,
0.3201705, -0.4598517, 4.404123, 1, 1, 1, 1, 1,
0.3211064, -2.97524, 2.910573, 1, 1, 1, 1, 1,
0.3219916, -0.6542166, 2.900728, 1, 1, 1, 1, 1,
0.3229216, -2.372479, 3.523208, 1, 1, 1, 1, 1,
0.3265264, -1.16677, 3.470145, 1, 1, 1, 1, 1,
0.3278654, 0.3973837, 1.531464, 1, 1, 1, 1, 1,
0.3320175, 0.7079296, -0.5903235, 1, 1, 1, 1, 1,
0.3324156, -0.7262262, 3.956256, 1, 1, 1, 1, 1,
0.3336838, 0.3206779, 2.919687, 0, 0, 1, 1, 1,
0.3360409, -3.479254, 3.156823, 1, 0, 0, 1, 1,
0.3368427, -1.188844, 1.511462, 1, 0, 0, 1, 1,
0.3376382, -0.5883367, 2.056409, 1, 0, 0, 1, 1,
0.3393126, 0.3312666, 2.239124, 1, 0, 0, 1, 1,
0.3457065, 0.839184, 1.478697, 1, 0, 0, 1, 1,
0.34705, -1.337582, 0.6467095, 0, 0, 0, 1, 1,
0.3485755, 0.05779156, 1.622676, 0, 0, 0, 1, 1,
0.349519, 1.499403, 1.241914, 0, 0, 0, 1, 1,
0.3560683, -1.510233, 3.177243, 0, 0, 0, 1, 1,
0.3562559, -0.3361444, 3.029221, 0, 0, 0, 1, 1,
0.3597465, -0.2814406, 2.778326, 0, 0, 0, 1, 1,
0.3602559, -0.9176127, 2.82513, 0, 0, 0, 1, 1,
0.361651, -0.5252125, 2.299762, 1, 1, 1, 1, 1,
0.3663617, -1.015709, 2.767578, 1, 1, 1, 1, 1,
0.3669401, 0.6661389, 0.5470096, 1, 1, 1, 1, 1,
0.3698376, 1.077424, 0.54663, 1, 1, 1, 1, 1,
0.3713543, -0.3287136, 1.367695, 1, 1, 1, 1, 1,
0.3714921, -1.670344, 3.791685, 1, 1, 1, 1, 1,
0.3718877, -0.07990447, 1.644592, 1, 1, 1, 1, 1,
0.3724042, -0.4842947, 2.22264, 1, 1, 1, 1, 1,
0.3737544, -1.084302, 1.661715, 1, 1, 1, 1, 1,
0.3755028, 0.5101336, -0.1235524, 1, 1, 1, 1, 1,
0.3807961, -0.5953855, 1.781874, 1, 1, 1, 1, 1,
0.3842202, -0.1424969, 2.934314, 1, 1, 1, 1, 1,
0.384508, 0.4390446, -0.3354495, 1, 1, 1, 1, 1,
0.3874286, -1.051679, 3.857304, 1, 1, 1, 1, 1,
0.3889106, -0.5570797, 2.340393, 1, 1, 1, 1, 1,
0.3929474, -1.813019, 4.132267, 0, 0, 1, 1, 1,
0.3953434, -0.2866078, 1.640456, 1, 0, 0, 1, 1,
0.3974614, 0.1263533, 1.803998, 1, 0, 0, 1, 1,
0.3997658, -0.8554004, 2.2344, 1, 0, 0, 1, 1,
0.4018499, 0.2742685, 1.333894, 1, 0, 0, 1, 1,
0.4057601, -1.005612, 3.325874, 1, 0, 0, 1, 1,
0.410293, 1.289422, 0.955012, 0, 0, 0, 1, 1,
0.4171615, 1.438551, -0.3405067, 0, 0, 0, 1, 1,
0.4202556, -0.03525012, 3.627587, 0, 0, 0, 1, 1,
0.4307593, 0.4746381, 0.7339472, 0, 0, 0, 1, 1,
0.4309292, -0.4037175, 0.4922515, 0, 0, 0, 1, 1,
0.4361243, -3.596273, 4.255748, 0, 0, 0, 1, 1,
0.4523147, 0.9544271, 1.73131, 0, 0, 0, 1, 1,
0.4523332, -0.458316, 3.052203, 1, 1, 1, 1, 1,
0.4524622, 1.89092, 1.582487, 1, 1, 1, 1, 1,
0.4629594, 0.8670741, 0.9289446, 1, 1, 1, 1, 1,
0.4656853, 1.179264, -0.743574, 1, 1, 1, 1, 1,
0.4666355, -0.3833273, 3.263269, 1, 1, 1, 1, 1,
0.4735622, -0.7121502, 2.719632, 1, 1, 1, 1, 1,
0.480514, -1.415315, 2.643778, 1, 1, 1, 1, 1,
0.4828173, -1.329618, 3.0898, 1, 1, 1, 1, 1,
0.4899434, 1.414561, 0.1758202, 1, 1, 1, 1, 1,
0.4926251, -0.7599226, 3.438346, 1, 1, 1, 1, 1,
0.4931824, 0.755979, 1.423757, 1, 1, 1, 1, 1,
0.4932004, 2.138987, 0.002655531, 1, 1, 1, 1, 1,
0.4974585, 0.780542, 0.9404625, 1, 1, 1, 1, 1,
0.5033858, -2.006593, 2.776114, 1, 1, 1, 1, 1,
0.5054623, -0.2793546, 1.85937, 1, 1, 1, 1, 1,
0.5077533, -0.4307332, 1.18399, 0, 0, 1, 1, 1,
0.5124194, 1.229677, 1.914422, 1, 0, 0, 1, 1,
0.5159091, 0.3851264, 2.661391, 1, 0, 0, 1, 1,
0.5178291, -0.6156676, 2.046721, 1, 0, 0, 1, 1,
0.5182573, 1.529739, -0.9196141, 1, 0, 0, 1, 1,
0.5193009, 0.9684336, 0.7570482, 1, 0, 0, 1, 1,
0.5203926, 0.08619407, 1.238281, 0, 0, 0, 1, 1,
0.5279443, 0.7670366, -0.502172, 0, 0, 0, 1, 1,
0.531114, 0.3044696, 0.1842579, 0, 0, 0, 1, 1,
0.5324867, -0.9783335, 3.984148, 0, 0, 0, 1, 1,
0.5373888, -1.078046, 2.398755, 0, 0, 0, 1, 1,
0.5404381, 2.238287, 0.6434509, 0, 0, 0, 1, 1,
0.5404773, -0.6732064, 2.246478, 0, 0, 0, 1, 1,
0.5479801, 0.2133265, 1.388634, 1, 1, 1, 1, 1,
0.5541539, 1.30847, -0.05326678, 1, 1, 1, 1, 1,
0.560257, -0.505746, 3.487475, 1, 1, 1, 1, 1,
0.5617637, 0.2259871, -0.7752141, 1, 1, 1, 1, 1,
0.569684, -0.3297079, 0.4934663, 1, 1, 1, 1, 1,
0.5760304, -0.9891052, 1.671161, 1, 1, 1, 1, 1,
0.5807648, 0.292232, 2.738091, 1, 1, 1, 1, 1,
0.5859882, 1.903221, 1.831733, 1, 1, 1, 1, 1,
0.5867461, -1.427368, 1.406026, 1, 1, 1, 1, 1,
0.5876031, 0.8837101, 0.5534067, 1, 1, 1, 1, 1,
0.5884994, -0.07234287, -0.9334084, 1, 1, 1, 1, 1,
0.5925894, -0.6359465, 3.237861, 1, 1, 1, 1, 1,
0.5956005, -0.4118926, 2.730014, 1, 1, 1, 1, 1,
0.5970684, -1.062383, 2.114718, 1, 1, 1, 1, 1,
0.5980005, -0.5911044, 1.739165, 1, 1, 1, 1, 1,
0.5997128, 0.184367, 0.9727932, 0, 0, 1, 1, 1,
0.6057965, -0.9026784, 3.941097, 1, 0, 0, 1, 1,
0.6094357, 1.172324, 2.823105, 1, 0, 0, 1, 1,
0.6108449, -1.459236, 2.504142, 1, 0, 0, 1, 1,
0.6116274, -0.3418559, 2.88801, 1, 0, 0, 1, 1,
0.6153158, -0.4645674, 3.92228, 1, 0, 0, 1, 1,
0.6164636, -1.075119, 4.673969, 0, 0, 0, 1, 1,
0.6183866, 0.9971074, 0.071677, 0, 0, 0, 1, 1,
0.6219458, 0.3582562, -0.08467463, 0, 0, 0, 1, 1,
0.6232435, 1.0197, 0.09086337, 0, 0, 0, 1, 1,
0.6257172, 0.2017861, 0.3304698, 0, 0, 0, 1, 1,
0.6282588, -0.5184617, 3.91034, 0, 0, 0, 1, 1,
0.6292822, 0.9180852, -0.1489274, 0, 0, 0, 1, 1,
0.6295246, -0.1300966, 2.691906, 1, 1, 1, 1, 1,
0.6357189, 0.006352656, 2.827234, 1, 1, 1, 1, 1,
0.6379144, -0.5408134, 1.433666, 1, 1, 1, 1, 1,
0.6384782, -0.37654, 0.8750941, 1, 1, 1, 1, 1,
0.6413328, 0.944827, 2.439467, 1, 1, 1, 1, 1,
0.6453295, 0.02199607, 1.298598, 1, 1, 1, 1, 1,
0.6499746, -0.4560231, 2.021656, 1, 1, 1, 1, 1,
0.6543989, 0.2357467, 1.494443, 1, 1, 1, 1, 1,
0.6606866, -0.3498292, 0.9800273, 1, 1, 1, 1, 1,
0.6640198, -0.4058496, 3.058655, 1, 1, 1, 1, 1,
0.6686139, 0.4942226, 1.914997, 1, 1, 1, 1, 1,
0.6692129, 0.02787039, 0.8868567, 1, 1, 1, 1, 1,
0.6702058, -1.090222, 3.462367, 1, 1, 1, 1, 1,
0.6760975, -1.460838, 2.432114, 1, 1, 1, 1, 1,
0.6789982, -2.106913, 1.584395, 1, 1, 1, 1, 1,
0.6819139, 0.7270564, 0.9685801, 0, 0, 1, 1, 1,
0.6821139, -0.8150382, 3.298676, 1, 0, 0, 1, 1,
0.6832468, -2.647263, 2.945008, 1, 0, 0, 1, 1,
0.6887064, 1.403415, 0.01228401, 1, 0, 0, 1, 1,
0.6925716, -0.4881502, 1.173158, 1, 0, 0, 1, 1,
0.6929916, 0.3361883, 1.522277, 1, 0, 0, 1, 1,
0.6952927, 1.391877, 0.1399053, 0, 0, 0, 1, 1,
0.6958129, -1.847261, 2.536267, 0, 0, 0, 1, 1,
0.6966323, -0.6468555, 3.440904, 0, 0, 0, 1, 1,
0.6993067, 1.307577, -0.9307493, 0, 0, 0, 1, 1,
0.7014157, -0.8205823, 3.117611, 0, 0, 0, 1, 1,
0.711408, 0.8455566, -1.119833, 0, 0, 0, 1, 1,
0.7171689, 1.209949, 0.2956383, 0, 0, 0, 1, 1,
0.719707, -0.9152339, 2.483807, 1, 1, 1, 1, 1,
0.7221119, 0.824012, 0.5307426, 1, 1, 1, 1, 1,
0.7243241, -0.0319234, 2.148869, 1, 1, 1, 1, 1,
0.7246135, 0.4202316, 1.43959, 1, 1, 1, 1, 1,
0.7261124, 0.8059426, -0.1471214, 1, 1, 1, 1, 1,
0.7262696, -0.02256485, 1.127428, 1, 1, 1, 1, 1,
0.7267826, -0.4334962, 4.644506, 1, 1, 1, 1, 1,
0.730413, -0.7294016, 1.133376, 1, 1, 1, 1, 1,
0.7305325, -0.163912, 2.912766, 1, 1, 1, 1, 1,
0.7376411, -1.177891, 4.381389, 1, 1, 1, 1, 1,
0.739111, -0.07535774, 0.1410496, 1, 1, 1, 1, 1,
0.7477111, -0.6491048, 3.053965, 1, 1, 1, 1, 1,
0.7484557, -0.2730943, 0.4347908, 1, 1, 1, 1, 1,
0.7541709, 0.531877, 0.6289264, 1, 1, 1, 1, 1,
0.756551, -1.248505, 1.682773, 1, 1, 1, 1, 1,
0.7622303, -0.4621369, 2.434727, 0, 0, 1, 1, 1,
0.7634744, 0.8940932, -0.3369085, 1, 0, 0, 1, 1,
0.7643649, 0.2240006, 1.731203, 1, 0, 0, 1, 1,
0.7704889, -2.329123, 2.728895, 1, 0, 0, 1, 1,
0.7715636, 0.3379243, 1.891852, 1, 0, 0, 1, 1,
0.7729859, 0.7266325, -0.3006225, 1, 0, 0, 1, 1,
0.7750617, 0.8472816, 0.2702897, 0, 0, 0, 1, 1,
0.7764937, 0.8160181, 2.497749, 0, 0, 0, 1, 1,
0.776638, -0.6541032, 1.936672, 0, 0, 0, 1, 1,
0.7823102, -0.51564, 1.560922, 0, 0, 0, 1, 1,
0.7876257, 0.2698644, 0.4995119, 0, 0, 0, 1, 1,
0.7936218, -1.427349, 2.589301, 0, 0, 0, 1, 1,
0.7944036, 0.02077032, -1.36313, 0, 0, 0, 1, 1,
0.7970756, 0.2509738, 2.695247, 1, 1, 1, 1, 1,
0.8019727, 0.9810703, 0.6418104, 1, 1, 1, 1, 1,
0.8027747, 0.2607667, 1.420442, 1, 1, 1, 1, 1,
0.8117977, -2.662297, 3.717591, 1, 1, 1, 1, 1,
0.8132616, -0.2755585, 1.445495, 1, 1, 1, 1, 1,
0.8138879, -0.2349897, 1.88034, 1, 1, 1, 1, 1,
0.8139581, 0.1621187, 1.155048, 1, 1, 1, 1, 1,
0.8283206, -0.3991764, 1.705017, 1, 1, 1, 1, 1,
0.8284772, -0.9207995, 2.680474, 1, 1, 1, 1, 1,
0.8286617, -0.2114396, 3.79237, 1, 1, 1, 1, 1,
0.8309274, -0.4787961, 3.720064, 1, 1, 1, 1, 1,
0.8358997, -0.0204523, 3.53124, 1, 1, 1, 1, 1,
0.8389472, -0.002690505, 2.011146, 1, 1, 1, 1, 1,
0.8414561, -0.740743, 3.077491, 1, 1, 1, 1, 1,
0.8458084, 0.2002601, 1.276446, 1, 1, 1, 1, 1,
0.8460894, -0.114753, 0.3861229, 0, 0, 1, 1, 1,
0.8535014, 1.003584, 1.253595, 1, 0, 0, 1, 1,
0.8541325, 0.1484129, 0.2778546, 1, 0, 0, 1, 1,
0.8543255, -0.1393259, 1.494896, 1, 0, 0, 1, 1,
0.8608992, -2.150548, 4.088499, 1, 0, 0, 1, 1,
0.8621396, -1.044147, 2.943892, 1, 0, 0, 1, 1,
0.8653311, -0.242298, 0.6501971, 0, 0, 0, 1, 1,
0.8657731, -1.280311, 2.730473, 0, 0, 0, 1, 1,
0.8695357, -0.2230121, 0.9285987, 0, 0, 0, 1, 1,
0.8699769, 1.198706, 0.3422304, 0, 0, 0, 1, 1,
0.872107, -0.7071931, 3.188658, 0, 0, 0, 1, 1,
0.878171, 0.6047412, 0.2305656, 0, 0, 0, 1, 1,
0.8782513, -0.9332489, 1.251903, 0, 0, 0, 1, 1,
0.8920295, -1.749619, 3.847416, 1, 1, 1, 1, 1,
0.8952656, 0.0975534, 2.153692, 1, 1, 1, 1, 1,
0.90909, -1.021265, 3.533267, 1, 1, 1, 1, 1,
0.9112383, 0.3889812, 1.45879, 1, 1, 1, 1, 1,
0.9178489, 0.1231003, 0.3534551, 1, 1, 1, 1, 1,
0.9190361, -0.9886774, 3.215756, 1, 1, 1, 1, 1,
0.9193742, 0.0007316065, 2.214107, 1, 1, 1, 1, 1,
0.9196889, 1.646258, -0.151183, 1, 1, 1, 1, 1,
0.9200985, -1.714004, 2.214896, 1, 1, 1, 1, 1,
0.9234941, 0.8521616, 0.5691288, 1, 1, 1, 1, 1,
0.9367912, 0.09114739, 0.977739, 1, 1, 1, 1, 1,
0.9534251, -0.1583016, 1.822439, 1, 1, 1, 1, 1,
0.9576566, 0.2235153, 0.2736977, 1, 1, 1, 1, 1,
0.9656472, 1.895017, 0.7844913, 1, 1, 1, 1, 1,
0.9692084, -0.009473841, 0.5583166, 1, 1, 1, 1, 1,
0.9697153, -0.6195466, 2.641784, 0, 0, 1, 1, 1,
0.9724962, 1.784814, -0.2169294, 1, 0, 0, 1, 1,
0.9730586, 0.7939691, 1.322948, 1, 0, 0, 1, 1,
0.9739217, 0.2234134, 0.9332368, 1, 0, 0, 1, 1,
0.9902735, 0.2903473, 0.6445845, 1, 0, 0, 1, 1,
0.9970865, 0.4699189, 0.568242, 1, 0, 0, 1, 1,
1.004033, -0.2164053, 2.780431, 0, 0, 0, 1, 1,
1.005677, 0.2660272, 1.975803, 0, 0, 0, 1, 1,
1.022083, -0.4715831, 2.544625, 0, 0, 0, 1, 1,
1.023224, -0.6025895, 0.9668074, 0, 0, 0, 1, 1,
1.024292, 0.8949517, 0.8809486, 0, 0, 0, 1, 1,
1.031889, -0.01741708, 1.973946, 0, 0, 0, 1, 1,
1.037042, -1.181417, 2.790746, 0, 0, 0, 1, 1,
1.03974, 1.770734, -0.2150943, 1, 1, 1, 1, 1,
1.048226, 0.7052122, 2.487425, 1, 1, 1, 1, 1,
1.04929, 1.139079, 0.720499, 1, 1, 1, 1, 1,
1.051115, 2.294376, 0.7986416, 1, 1, 1, 1, 1,
1.051888, 0.362857, 1.921929, 1, 1, 1, 1, 1,
1.06028, -1.241533, 2.091059, 1, 1, 1, 1, 1,
1.069342, 0.6417556, 1.797792, 1, 1, 1, 1, 1,
1.074505, 1.933003, 1.022003, 1, 1, 1, 1, 1,
1.085963, -1.673111, 1.43641, 1, 1, 1, 1, 1,
1.091349, -0.549366, 1.112773, 1, 1, 1, 1, 1,
1.102948, -0.198277, 2.480258, 1, 1, 1, 1, 1,
1.110001, -0.9968051, 1.632081, 1, 1, 1, 1, 1,
1.110131, -0.9816844, 1.790534, 1, 1, 1, 1, 1,
1.11037, -0.3005395, 2.849205, 1, 1, 1, 1, 1,
1.110956, 0.09213956, 0.8509842, 1, 1, 1, 1, 1,
1.112485, 0.3951769, 1.428002, 0, 0, 1, 1, 1,
1.116428, -0.1763319, 1.45332, 1, 0, 0, 1, 1,
1.117753, 0.8079777, 0.7212462, 1, 0, 0, 1, 1,
1.124926, 1.502589, -0.03420532, 1, 0, 0, 1, 1,
1.125664, 0.1694358, 0.01973457, 1, 0, 0, 1, 1,
1.126636, -0.5254955, 1.612884, 1, 0, 0, 1, 1,
1.130243, -0.08306649, 2.465121, 0, 0, 0, 1, 1,
1.131849, 1.061107, -0.6595793, 0, 0, 0, 1, 1,
1.147979, 0.5697455, 2.809088, 0, 0, 0, 1, 1,
1.149349, -0.3287885, 1.085582, 0, 0, 0, 1, 1,
1.154424, 0.4190472, 0.05845085, 0, 0, 0, 1, 1,
1.157125, 0.895095, 0.2778279, 0, 0, 0, 1, 1,
1.169283, -0.9985418, 2.482367, 0, 0, 0, 1, 1,
1.184756, -0.1078793, -0.1720845, 1, 1, 1, 1, 1,
1.203035, 1.211773, 0.857859, 1, 1, 1, 1, 1,
1.20379, -0.9052752, 2.174137, 1, 1, 1, 1, 1,
1.205641, 0.6005977, 1.492159, 1, 1, 1, 1, 1,
1.211002, -0.3862846, 0.8700146, 1, 1, 1, 1, 1,
1.212018, 0.1180505, 2.09594, 1, 1, 1, 1, 1,
1.217096, 2.684396, -1.393373, 1, 1, 1, 1, 1,
1.220677, 0.3717856, 1.987987, 1, 1, 1, 1, 1,
1.244619, 0.7278205, 0.136956, 1, 1, 1, 1, 1,
1.261872, 0.6207734, 1.993987, 1, 1, 1, 1, 1,
1.263163, 2.678711, -0.3277423, 1, 1, 1, 1, 1,
1.269688, 0.02754486, 1.883112, 1, 1, 1, 1, 1,
1.27172, 0.5149578, -1.122165, 1, 1, 1, 1, 1,
1.278961, -0.250802, 3.647884, 1, 1, 1, 1, 1,
1.307285, 0.08021799, 0.818089, 1, 1, 1, 1, 1,
1.312417, 0.9971414, 1.033123, 0, 0, 1, 1, 1,
1.332875, -0.07848657, 2.916294, 1, 0, 0, 1, 1,
1.336074, -0.6914952, 4.015419, 1, 0, 0, 1, 1,
1.338878, -0.2824441, 2.529913, 1, 0, 0, 1, 1,
1.340838, -1.128192, 3.036017, 1, 0, 0, 1, 1,
1.343686, -1.180445, 2.487544, 1, 0, 0, 1, 1,
1.347489, 1.241934, 0.4610498, 0, 0, 0, 1, 1,
1.351073, -1.614078, 0.6354338, 0, 0, 0, 1, 1,
1.360466, 0.08474655, 2.196437, 0, 0, 0, 1, 1,
1.362143, 1.159316, 2.530964, 0, 0, 0, 1, 1,
1.365483, -0.3313362, 2.610473, 0, 0, 0, 1, 1,
1.365951, -1.67966, 3.262481, 0, 0, 0, 1, 1,
1.37191, 1.812247, 0.7187372, 0, 0, 0, 1, 1,
1.378249, 0.02680502, 0.7063442, 1, 1, 1, 1, 1,
1.392834, 1.495249, 0.4768222, 1, 1, 1, 1, 1,
1.398679, 0.5144489, -0.3948418, 1, 1, 1, 1, 1,
1.403314, 0.1809991, 1.11262, 1, 1, 1, 1, 1,
1.406503, 0.05955694, 0.7862167, 1, 1, 1, 1, 1,
1.411581, -0.759439, 1.466071, 1, 1, 1, 1, 1,
1.418848, -0.4465966, 2.569267, 1, 1, 1, 1, 1,
1.420123, 0.1271802, 2.136516, 1, 1, 1, 1, 1,
1.44253, -0.5718153, 0.7430001, 1, 1, 1, 1, 1,
1.454839, 0.3870274, 1.263542, 1, 1, 1, 1, 1,
1.458201, 1.315378, 2.142514, 1, 1, 1, 1, 1,
1.46633, -1.896116, 3.709396, 1, 1, 1, 1, 1,
1.477048, 0.5024532, 1.243444, 1, 1, 1, 1, 1,
1.477827, -0.6731939, 1.332595, 1, 1, 1, 1, 1,
1.483866, 0.9953475, 1.615612, 1, 1, 1, 1, 1,
1.496163, 0.5407453, 0.7948048, 0, 0, 1, 1, 1,
1.507977, 0.9888067, 1.38336, 1, 0, 0, 1, 1,
1.51449, -0.0617478, 0.4991767, 1, 0, 0, 1, 1,
1.514617, 0.4736958, 0.8378983, 1, 0, 0, 1, 1,
1.541242, -0.3939828, 1.322127, 1, 0, 0, 1, 1,
1.544201, -1.283298, 2.136216, 1, 0, 0, 1, 1,
1.563076, -0.004084426, 1.593644, 0, 0, 0, 1, 1,
1.569861, 0.4962557, 1.960397, 0, 0, 0, 1, 1,
1.576337, -0.3995333, 2.147818, 0, 0, 0, 1, 1,
1.59496, -0.2983179, 3.015636, 0, 0, 0, 1, 1,
1.602322, -0.7431675, 1.003842, 0, 0, 0, 1, 1,
1.612114, -0.9593385, 1.860051, 0, 0, 0, 1, 1,
1.620278, -1.345495, 2.519052, 0, 0, 0, 1, 1,
1.621593, 1.034119, 2.816732, 1, 1, 1, 1, 1,
1.62639, 1.054371, 0.4555152, 1, 1, 1, 1, 1,
1.649468, 0.5361781, 0.6276044, 1, 1, 1, 1, 1,
1.651717, -0.5775054, 0.9274635, 1, 1, 1, 1, 1,
1.655447, 1.836936, 2.861658, 1, 1, 1, 1, 1,
1.656026, 0.5416862, 0.9177838, 1, 1, 1, 1, 1,
1.673097, -1.842608, 2.261446, 1, 1, 1, 1, 1,
1.673699, -1.10961, 1.970497, 1, 1, 1, 1, 1,
1.721635, 0.1787579, 2.253662, 1, 1, 1, 1, 1,
1.724438, -0.5296395, 0.9768856, 1, 1, 1, 1, 1,
1.738219, -0.2702495, 1.616348, 1, 1, 1, 1, 1,
1.740316, 1.384842, 1.460675, 1, 1, 1, 1, 1,
1.755617, 0.7236385, 1.349699, 1, 1, 1, 1, 1,
1.776621, 0.266784, 0.6483386, 1, 1, 1, 1, 1,
1.780318, -0.4615082, 1.735321, 1, 1, 1, 1, 1,
1.782189, -0.8381178, 0.757207, 0, 0, 1, 1, 1,
1.802271, 0.2019226, -0.007658076, 1, 0, 0, 1, 1,
1.807374, -0.4839982, 2.581734, 1, 0, 0, 1, 1,
1.809633, -1.127463, 1.46718, 1, 0, 0, 1, 1,
1.814461, 2.254455, -0.2293297, 1, 0, 0, 1, 1,
1.816686, -0.07777078, 1.252202, 1, 0, 0, 1, 1,
1.817121, -0.6582255, 2.884982, 0, 0, 0, 1, 1,
1.836668, 0.854423, 0.7242516, 0, 0, 0, 1, 1,
1.853392, 0.2455073, 1.169826, 0, 0, 0, 1, 1,
1.860129, 1.276739, 0.7268518, 0, 0, 0, 1, 1,
1.871902, -1.187209, 1.66095, 0, 0, 0, 1, 1,
1.894651, 0.9537992, -0.980185, 0, 0, 0, 1, 1,
1.897891, -1.191273, 3.784794, 0, 0, 0, 1, 1,
1.924927, -2.019259, 1.96042, 1, 1, 1, 1, 1,
1.948037, -1.226372, 1.906916, 1, 1, 1, 1, 1,
1.948847, 1.008448, 0.2782481, 1, 1, 1, 1, 1,
1.966427, 0.6565364, 0.5978816, 1, 1, 1, 1, 1,
1.977597, -2.019257, 2.331987, 1, 1, 1, 1, 1,
1.99678, 0.2106133, 2.309553, 1, 1, 1, 1, 1,
2.001478, -2.438493, 2.122937, 1, 1, 1, 1, 1,
2.048866, 0.4594105, 0.999867, 1, 1, 1, 1, 1,
2.063098, 1.250726, 0.9605113, 1, 1, 1, 1, 1,
2.063866, -1.039096, 3.563205, 1, 1, 1, 1, 1,
2.105992, 0.8876014, 1.354509, 1, 1, 1, 1, 1,
2.111348, 0.4812428, -0.3587607, 1, 1, 1, 1, 1,
2.113181, -0.2403717, 2.573847, 1, 1, 1, 1, 1,
2.156544, 0.4508371, 1.895328, 1, 1, 1, 1, 1,
2.193088, -0.3594651, 2.255463, 1, 1, 1, 1, 1,
2.197975, -0.5049798, 1.985094, 0, 0, 1, 1, 1,
2.219651, 0.9668644, 0.5843447, 1, 0, 0, 1, 1,
2.228218, -0.4550754, 3.487721, 1, 0, 0, 1, 1,
2.294254, 1.204472, 1.315279, 1, 0, 0, 1, 1,
2.319418, -0.782172, 1.01552, 1, 0, 0, 1, 1,
2.327192, -1.54278, 0.6919242, 1, 0, 0, 1, 1,
2.330323, 0.5650666, 1.241568, 0, 0, 0, 1, 1,
2.340538, -0.6589058, 1.34594, 0, 0, 0, 1, 1,
2.411733, 0.8136779, 1.138199, 0, 0, 0, 1, 1,
2.421328, -0.1263548, 0.4099059, 0, 0, 0, 1, 1,
2.439606, -0.7229365, 0.3554013, 0, 0, 0, 1, 1,
2.490192, 0.6268871, 3.120241, 0, 0, 0, 1, 1,
2.574322, 0.4185405, 2.800772, 0, 0, 0, 1, 1,
2.735289, 1.012506, -0.6498809, 1, 1, 1, 1, 1,
2.804086, -0.940672, 0.9496539, 1, 1, 1, 1, 1,
2.840645, -0.9692358, 1.508608, 1, 1, 1, 1, 1,
2.847872, -0.7199639, 3.009958, 1, 1, 1, 1, 1,
2.996909, 0.3140334, 0.198781, 1, 1, 1, 1, 1,
3.010862, -1.428425, 1.497333, 1, 1, 1, 1, 1,
3.194775, 0.3162515, 1.329546, 1, 1, 1, 1, 1
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
var radius = 10.41858;
var distance = 36.59481;
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
mvMatrix.translate( 0.5900555, 0.3584626, -0.1588953 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.59481);
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
