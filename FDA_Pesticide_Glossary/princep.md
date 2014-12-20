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
-2.867614, -1.098605, -0.5023977, 1, 0, 0, 1,
-2.792941, -0.8602214, -0.2394355, 1, 0.007843138, 0, 1,
-2.495571, 0.4980902, -3.229498, 1, 0.01176471, 0, 1,
-2.447287, -1.145812, -1.756096, 1, 0.01960784, 0, 1,
-2.422503, 0.1268434, 0.2564286, 1, 0.02352941, 0, 1,
-2.35587, -0.6266161, -1.679663, 1, 0.03137255, 0, 1,
-2.310243, -1.569855, -4.052359, 1, 0.03529412, 0, 1,
-2.263018, -0.05319262, -0.7365922, 1, 0.04313726, 0, 1,
-2.255511, -1.745937, -3.090852, 1, 0.04705882, 0, 1,
-2.236156, -0.3316845, 0.7510258, 1, 0.05490196, 0, 1,
-2.203755, 0.3646585, -0.2842503, 1, 0.05882353, 0, 1,
-2.168759, 0.7198655, -1.926293, 1, 0.06666667, 0, 1,
-2.137533, -1.191669, -0.5681832, 1, 0.07058824, 0, 1,
-2.085945, 0.3527318, -2.253263, 1, 0.07843138, 0, 1,
-2.065883, -1.219161, -2.275332, 1, 0.08235294, 0, 1,
-2.038246, -0.4750532, -2.289648, 1, 0.09019608, 0, 1,
-2.005458, -1.198887, -2.241625, 1, 0.09411765, 0, 1,
-2.002139, 0.1439965, -0.9231387, 1, 0.1019608, 0, 1,
-1.999073, -0.8601438, -3.252, 1, 0.1098039, 0, 1,
-1.982181, -0.06038259, -1.296179, 1, 0.1137255, 0, 1,
-1.976347, -0.3205746, -0.7775904, 1, 0.1215686, 0, 1,
-1.951384, -0.6093525, -1.519914, 1, 0.1254902, 0, 1,
-1.929433, -0.6718882, -1.062789, 1, 0.1333333, 0, 1,
-1.912574, 2.525864, -1.065798, 1, 0.1372549, 0, 1,
-1.900027, -0.4246596, -1.905089, 1, 0.145098, 0, 1,
-1.880803, 1.028862, -1.766077, 1, 0.1490196, 0, 1,
-1.877604, 0.7686097, -2.400682, 1, 0.1568628, 0, 1,
-1.875849, -0.3611532, -2.228123, 1, 0.1607843, 0, 1,
-1.856831, -0.6643019, -1.929442, 1, 0.1686275, 0, 1,
-1.855684, 0.4919193, -0.924526, 1, 0.172549, 0, 1,
-1.851148, -1.251363, -2.007003, 1, 0.1803922, 0, 1,
-1.842158, -0.7068691, -1.271028, 1, 0.1843137, 0, 1,
-1.838413, -1.706902, -1.897305, 1, 0.1921569, 0, 1,
-1.816718, 0.332544, -2.416937, 1, 0.1960784, 0, 1,
-1.801102, -1.572162, -2.391827, 1, 0.2039216, 0, 1,
-1.795938, 0.01548743, 0.03279037, 1, 0.2117647, 0, 1,
-1.785272, 0.8077058, 0.533898, 1, 0.2156863, 0, 1,
-1.773696, -1.066405, -4.103717, 1, 0.2235294, 0, 1,
-1.76085, 1.349829, -0.6171383, 1, 0.227451, 0, 1,
-1.739814, 0.08216682, -0.9224868, 1, 0.2352941, 0, 1,
-1.736074, 0.18454, -2.083111, 1, 0.2392157, 0, 1,
-1.705709, 1.226057, -1.133339, 1, 0.2470588, 0, 1,
-1.704314, 1.085938, -2.510835, 1, 0.2509804, 0, 1,
-1.703815, 0.2684421, -1.836907, 1, 0.2588235, 0, 1,
-1.688797, -0.5590999, -2.548536, 1, 0.2627451, 0, 1,
-1.67511, 0.7324043, -1.028982, 1, 0.2705882, 0, 1,
-1.669673, -0.09392997, -0.774444, 1, 0.2745098, 0, 1,
-1.653326, 0.8775331, -0.1243599, 1, 0.282353, 0, 1,
-1.641628, -0.7428799, -1.641963, 1, 0.2862745, 0, 1,
-1.639601, 0.4641567, -1.060066, 1, 0.2941177, 0, 1,
-1.637829, -0.5780976, -2.373834, 1, 0.3019608, 0, 1,
-1.637582, -0.3504137, -2.514466, 1, 0.3058824, 0, 1,
-1.634378, 0.8530074, -0.8745222, 1, 0.3137255, 0, 1,
-1.621287, 0.1483108, -2.665583, 1, 0.3176471, 0, 1,
-1.61928, -0.277413, -1.968562, 1, 0.3254902, 0, 1,
-1.608713, 0.5282366, -1.330221, 1, 0.3294118, 0, 1,
-1.607953, 0.4423025, -2.269893, 1, 0.3372549, 0, 1,
-1.602045, -0.6232323, -1.021246, 1, 0.3411765, 0, 1,
-1.588508, -0.8165125, -1.537048, 1, 0.3490196, 0, 1,
-1.553443, -0.3357673, -2.499249, 1, 0.3529412, 0, 1,
-1.552882, 0.03411065, -0.06733074, 1, 0.3607843, 0, 1,
-1.526779, 0.3028717, -0.6146749, 1, 0.3647059, 0, 1,
-1.501607, -0.4620151, -1.182835, 1, 0.372549, 0, 1,
-1.487036, -1.836222, -1.397216, 1, 0.3764706, 0, 1,
-1.482471, 0.2344049, -0.1814991, 1, 0.3843137, 0, 1,
-1.481882, 1.203858, -1.510352, 1, 0.3882353, 0, 1,
-1.479631, 0.5857793, -0.681442, 1, 0.3960784, 0, 1,
-1.470858, 0.669593, -0.823086, 1, 0.4039216, 0, 1,
-1.462466, 0.6875228, -1.016117, 1, 0.4078431, 0, 1,
-1.455428, -0.315937, -1.860128, 1, 0.4156863, 0, 1,
-1.446228, 0.1000422, -2.11999, 1, 0.4196078, 0, 1,
-1.444223, 0.06744573, -1.460295, 1, 0.427451, 0, 1,
-1.43122, -0.5367743, -2.315489, 1, 0.4313726, 0, 1,
-1.430495, 1.251453, -1.316087, 1, 0.4392157, 0, 1,
-1.41415, 0.6842763, -0.403338, 1, 0.4431373, 0, 1,
-1.408869, -1.448476, -2.266589, 1, 0.4509804, 0, 1,
-1.401354, -0.2649125, -1.567751, 1, 0.454902, 0, 1,
-1.396762, 0.01473576, -0.2545645, 1, 0.4627451, 0, 1,
-1.391811, -0.4372334, -2.332107, 1, 0.4666667, 0, 1,
-1.391067, -1.719124, -2.980486, 1, 0.4745098, 0, 1,
-1.391026, 1.007908, -2.146913, 1, 0.4784314, 0, 1,
-1.387272, -0.564985, -3.18959, 1, 0.4862745, 0, 1,
-1.37716, 0.5839661, -0.6946999, 1, 0.4901961, 0, 1,
-1.37207, -0.3369551, -1.38928, 1, 0.4980392, 0, 1,
-1.371077, -0.5540839, -1.832159, 1, 0.5058824, 0, 1,
-1.363646, -1.197522, -1.535696, 1, 0.509804, 0, 1,
-1.34893, 0.2505848, -0.0568747, 1, 0.5176471, 0, 1,
-1.347653, -0.4100387, -2.310081, 1, 0.5215687, 0, 1,
-1.338898, -0.6448404, -2.232369, 1, 0.5294118, 0, 1,
-1.330357, -0.6602437, -2.24486, 1, 0.5333334, 0, 1,
-1.329857, 0.1888211, 0.3268558, 1, 0.5411765, 0, 1,
-1.322755, 0.6338532, -1.35284, 1, 0.5450981, 0, 1,
-1.313677, -1.16804, -1.709287, 1, 0.5529412, 0, 1,
-1.306705, 0.2672856, -2.051871, 1, 0.5568628, 0, 1,
-1.295774, 0.8999846, -2.143954, 1, 0.5647059, 0, 1,
-1.287967, 0.1669164, -1.588529, 1, 0.5686275, 0, 1,
-1.280117, -1.113269, -3.804141, 1, 0.5764706, 0, 1,
-1.27582, 0.0733554, -1.78935, 1, 0.5803922, 0, 1,
-1.25776, -0.3169087, -0.6558858, 1, 0.5882353, 0, 1,
-1.24863, -0.3010964, -3.019925, 1, 0.5921569, 0, 1,
-1.246968, -2.486265, -4.455547, 1, 0.6, 0, 1,
-1.245886, 1.061098, 0.132058, 1, 0.6078432, 0, 1,
-1.240859, 1.349808, -2.144959, 1, 0.6117647, 0, 1,
-1.240056, -0.03141395, -2.432933, 1, 0.6196079, 0, 1,
-1.239889, 0.7215638, -2.684061, 1, 0.6235294, 0, 1,
-1.230644, 0.6690741, -1.256236, 1, 0.6313726, 0, 1,
-1.213454, 0.1882595, -2.099389, 1, 0.6352941, 0, 1,
-1.210671, -1.134754, -0.8236297, 1, 0.6431373, 0, 1,
-1.205001, -0.5870758, -1.580999, 1, 0.6470588, 0, 1,
-1.193416, -0.3086018, -1.406003, 1, 0.654902, 0, 1,
-1.189248, 0.2624929, -3.513129, 1, 0.6588235, 0, 1,
-1.180894, -0.6393754, -3.267705, 1, 0.6666667, 0, 1,
-1.180053, -1.679921, -3.99435, 1, 0.6705883, 0, 1,
-1.177403, -1.101103, -3.630694, 1, 0.6784314, 0, 1,
-1.17456, 0.7811857, -0.1125762, 1, 0.682353, 0, 1,
-1.172206, 0.860253, -0.3997729, 1, 0.6901961, 0, 1,
-1.169135, -0.8451654, -1.991473, 1, 0.6941177, 0, 1,
-1.167628, -1.319838, -2.945661, 1, 0.7019608, 0, 1,
-1.164258, 0.7276384, -0.5263112, 1, 0.7098039, 0, 1,
-1.157737, -1.070102, -4.120348, 1, 0.7137255, 0, 1,
-1.152672, -0.05838227, 0.550312, 1, 0.7215686, 0, 1,
-1.147199, -1.682785, -4.451959, 1, 0.7254902, 0, 1,
-1.133188, 0.8896411, -1.596925, 1, 0.7333333, 0, 1,
-1.129027, 1.227753, 1.352764, 1, 0.7372549, 0, 1,
-1.128016, 0.1524143, -2.180438, 1, 0.7450981, 0, 1,
-1.124712, -1.003068, 0.03254152, 1, 0.7490196, 0, 1,
-1.121331, -0.4530722, -1.348026, 1, 0.7568628, 0, 1,
-1.110442, 0.2291181, -1.671953, 1, 0.7607843, 0, 1,
-1.109965, -1.878599, -1.69495, 1, 0.7686275, 0, 1,
-1.109339, 0.9151359, -1.596792, 1, 0.772549, 0, 1,
-1.105612, 0.02519543, -0.7705275, 1, 0.7803922, 0, 1,
-1.105118, -0.04210365, -1.476162, 1, 0.7843137, 0, 1,
-1.087225, -0.2359476, -1.055969, 1, 0.7921569, 0, 1,
-1.084778, 1.223376, -1.456599, 1, 0.7960784, 0, 1,
-1.073636, 1.184085, -0.6420699, 1, 0.8039216, 0, 1,
-1.069219, -0.5104374, -2.67305, 1, 0.8117647, 0, 1,
-1.062522, -0.01200337, -1.306163, 1, 0.8156863, 0, 1,
-1.057801, 0.6801705, -0.6400229, 1, 0.8235294, 0, 1,
-1.054896, -1.079992, -2.290214, 1, 0.827451, 0, 1,
-1.046185, 0.8388385, -0.2998406, 1, 0.8352941, 0, 1,
-1.040273, -1.090076, -1.470952, 1, 0.8392157, 0, 1,
-1.037879, 0.9264696, -0.1800958, 1, 0.8470588, 0, 1,
-1.034101, -0.2490481, -0.3414075, 1, 0.8509804, 0, 1,
-1.026256, 1.663104, -1.440412, 1, 0.8588235, 0, 1,
-1.021744, 0.6675835, -1.870578, 1, 0.8627451, 0, 1,
-1.020401, -0.2668335, -1.645455, 1, 0.8705882, 0, 1,
-1.015615, 0.05342676, -1.850562, 1, 0.8745098, 0, 1,
-0.9927869, -0.1576753, -2.434164, 1, 0.8823529, 0, 1,
-0.9865276, -0.1173082, -0.6004062, 1, 0.8862745, 0, 1,
-0.9858413, 1.273494, -1.952715, 1, 0.8941177, 0, 1,
-0.9840925, 0.3684379, -0.774958, 1, 0.8980392, 0, 1,
-0.9790025, -0.9677703, -2.678031, 1, 0.9058824, 0, 1,
-0.9786747, -1.983067, -2.404247, 1, 0.9137255, 0, 1,
-0.9543059, 0.9517584, 0.07929998, 1, 0.9176471, 0, 1,
-0.9513735, 1.270029, 0.3317036, 1, 0.9254902, 0, 1,
-0.9502326, 1.177008, -1.141645, 1, 0.9294118, 0, 1,
-0.9494603, 0.1164465, -2.128083, 1, 0.9372549, 0, 1,
-0.9462916, -0.9780367, -3.210298, 1, 0.9411765, 0, 1,
-0.9459874, 0.9906613, -1.678192, 1, 0.9490196, 0, 1,
-0.9434116, 1.15636, 0.1740259, 1, 0.9529412, 0, 1,
-0.9403356, -0.5143104, -0.8195373, 1, 0.9607843, 0, 1,
-0.9358165, -1.465655, -2.263464, 1, 0.9647059, 0, 1,
-0.9218014, -1.943362, -4.081763, 1, 0.972549, 0, 1,
-0.9197153, -0.1492529, -0.9761915, 1, 0.9764706, 0, 1,
-0.9180762, -0.6110486, -1.935843, 1, 0.9843137, 0, 1,
-0.9012427, -0.8216013, -0.7693235, 1, 0.9882353, 0, 1,
-0.895142, -0.1329193, -3.400743, 1, 0.9960784, 0, 1,
-0.8910943, 0.7473348, -2.132115, 0.9960784, 1, 0, 1,
-0.8890597, -1.396031, -1.421434, 0.9921569, 1, 0, 1,
-0.8888424, -0.6403422, -3.1433, 0.9843137, 1, 0, 1,
-0.871626, 0.7219378, -1.916057, 0.9803922, 1, 0, 1,
-0.871619, -0.3419286, -1.78738, 0.972549, 1, 0, 1,
-0.8713224, 0.2433532, -0.9736004, 0.9686275, 1, 0, 1,
-0.868602, 0.5781637, 0.3349968, 0.9607843, 1, 0, 1,
-0.8677955, 0.1146728, -1.015338, 0.9568627, 1, 0, 1,
-0.8671217, -0.87125, -0.8182937, 0.9490196, 1, 0, 1,
-0.8670832, -0.133139, -2.539809, 0.945098, 1, 0, 1,
-0.8667258, 1.397786, -1.59517, 0.9372549, 1, 0, 1,
-0.8604975, -0.7573866, -0.8436978, 0.9333333, 1, 0, 1,
-0.8584522, 0.03873549, -3.457514, 0.9254902, 1, 0, 1,
-0.8565339, 0.6366305, -1.895882, 0.9215686, 1, 0, 1,
-0.8483751, 1.610047, -0.145627, 0.9137255, 1, 0, 1,
-0.8468547, -0.1452357, -2.198475, 0.9098039, 1, 0, 1,
-0.8450302, 1.665673, -0.2800659, 0.9019608, 1, 0, 1,
-0.8414803, -1.328125, -3.25158, 0.8941177, 1, 0, 1,
-0.8354862, 0.01284367, -1.620181, 0.8901961, 1, 0, 1,
-0.8344344, 0.1340543, 0.2182898, 0.8823529, 1, 0, 1,
-0.8313521, 1.159435, -0.2203348, 0.8784314, 1, 0, 1,
-0.8304204, 0.1275892, -1.902366, 0.8705882, 1, 0, 1,
-0.829609, -0.5534215, -1.953441, 0.8666667, 1, 0, 1,
-0.818205, -0.9435905, -5.1551, 0.8588235, 1, 0, 1,
-0.810417, 1.384614, -1.407972, 0.854902, 1, 0, 1,
-0.8084145, 1.286692, 0.1838987, 0.8470588, 1, 0, 1,
-0.8047054, 1.193845, -0.6816621, 0.8431373, 1, 0, 1,
-0.8031328, -0.4254714, -2.816602, 0.8352941, 1, 0, 1,
-0.7993138, 0.7484425, 0.4716622, 0.8313726, 1, 0, 1,
-0.7975422, -0.4141359, -1.93791, 0.8235294, 1, 0, 1,
-0.7946994, 1.621088, -1.347607, 0.8196079, 1, 0, 1,
-0.7937716, 0.7331132, -1.01226, 0.8117647, 1, 0, 1,
-0.7927203, -0.2842561, -1.068748, 0.8078431, 1, 0, 1,
-0.7917315, -1.490517, -2.631002, 0.8, 1, 0, 1,
-0.7895164, -0.2773605, -1.58, 0.7921569, 1, 0, 1,
-0.7881245, -0.6673053, 0.1785463, 0.7882353, 1, 0, 1,
-0.7794667, -0.2161446, -1.071607, 0.7803922, 1, 0, 1,
-0.7770741, 1.572618, -0.7542586, 0.7764706, 1, 0, 1,
-0.7685916, 0.3910867, -0.90554, 0.7686275, 1, 0, 1,
-0.7670041, 0.8645477, -0.8807141, 0.7647059, 1, 0, 1,
-0.7651898, 0.5396866, -1.08294, 0.7568628, 1, 0, 1,
-0.7618567, -1.848377, -2.814902, 0.7529412, 1, 0, 1,
-0.7609105, -0.04061214, -1.879877, 0.7450981, 1, 0, 1,
-0.7491763, 1.955746, -0.379714, 0.7411765, 1, 0, 1,
-0.7433736, -0.2581087, -2.629653, 0.7333333, 1, 0, 1,
-0.7407917, -0.5634633, -0.808133, 0.7294118, 1, 0, 1,
-0.7319604, -0.9475536, -0.4979468, 0.7215686, 1, 0, 1,
-0.7293434, -0.07732816, -1.745789, 0.7176471, 1, 0, 1,
-0.7281149, 0.7356579, -0.7398815, 0.7098039, 1, 0, 1,
-0.7272351, 0.7945039, -1.973781, 0.7058824, 1, 0, 1,
-0.7244511, 0.5310203, -0.2244884, 0.6980392, 1, 0, 1,
-0.7226427, 0.561063, -1.562105, 0.6901961, 1, 0, 1,
-0.72101, -1.796261, -4.021768, 0.6862745, 1, 0, 1,
-0.718448, 0.7744712, -0.6736246, 0.6784314, 1, 0, 1,
-0.7149662, -0.5564787, -1.527908, 0.6745098, 1, 0, 1,
-0.7140955, 1.302118, 1.064916, 0.6666667, 1, 0, 1,
-0.7137373, -1.542302, -4.185796, 0.6627451, 1, 0, 1,
-0.7112628, -1.908128, -3.491001, 0.654902, 1, 0, 1,
-0.7091483, 0.3537846, -0.5944963, 0.6509804, 1, 0, 1,
-0.7052681, 0.06035257, -0.7187647, 0.6431373, 1, 0, 1,
-0.7023608, -1.755687, -2.054801, 0.6392157, 1, 0, 1,
-0.6972536, -0.1094499, -2.189778, 0.6313726, 1, 0, 1,
-0.6961069, -1.462428, -2.444786, 0.627451, 1, 0, 1,
-0.6960496, 0.4920996, -2.788271, 0.6196079, 1, 0, 1,
-0.6940042, 0.2452167, -1.296176, 0.6156863, 1, 0, 1,
-0.6923597, 1.108654, -1.427039, 0.6078432, 1, 0, 1,
-0.6841196, -2.015707, -1.437381, 0.6039216, 1, 0, 1,
-0.6837816, 0.6245794, -0.4144903, 0.5960785, 1, 0, 1,
-0.6781863, 0.5313084, 0.8333296, 0.5882353, 1, 0, 1,
-0.6685011, 1.097416, -0.4888088, 0.5843138, 1, 0, 1,
-0.6674821, -0.8408046, -1.447077, 0.5764706, 1, 0, 1,
-0.6651953, -0.88889, -2.035042, 0.572549, 1, 0, 1,
-0.6632222, -0.7933295, -2.814115, 0.5647059, 1, 0, 1,
-0.6619431, -0.6772013, -3.427388, 0.5607843, 1, 0, 1,
-0.6607429, -1.008677, -1.72202, 0.5529412, 1, 0, 1,
-0.6603225, 1.312993, -1.222195, 0.5490196, 1, 0, 1,
-0.6511637, -1.538106, -0.6631179, 0.5411765, 1, 0, 1,
-0.6490184, -0.751011, -2.897828, 0.5372549, 1, 0, 1,
-0.6472556, -0.8603627, -1.738276, 0.5294118, 1, 0, 1,
-0.6404564, 1.181105, -1.362387, 0.5254902, 1, 0, 1,
-0.6378905, -0.1471666, -2.627733, 0.5176471, 1, 0, 1,
-0.6310776, -0.4323517, -0.2270569, 0.5137255, 1, 0, 1,
-0.6278015, -1.300039, -3.093553, 0.5058824, 1, 0, 1,
-0.6243524, 0.6951571, -0.9660201, 0.5019608, 1, 0, 1,
-0.6226547, 0.6925382, -2.2226, 0.4941176, 1, 0, 1,
-0.6219133, 0.7364255, -0.04475204, 0.4862745, 1, 0, 1,
-0.6168161, -0.2694126, -2.22305, 0.4823529, 1, 0, 1,
-0.616668, 0.9547022, 0.5730995, 0.4745098, 1, 0, 1,
-0.6143032, 0.4146599, -1.504225, 0.4705882, 1, 0, 1,
-0.614167, -1.13688, -2.064777, 0.4627451, 1, 0, 1,
-0.6109037, 0.2255201, -1.064255, 0.4588235, 1, 0, 1,
-0.6081223, -0.1389863, -1.187269, 0.4509804, 1, 0, 1,
-0.6037544, -0.1616392, -1.527226, 0.4470588, 1, 0, 1,
-0.6037269, 0.7771354, -1.550955, 0.4392157, 1, 0, 1,
-0.601435, -0.1808095, -2.992696, 0.4352941, 1, 0, 1,
-0.601059, 1.365555, -0.2770929, 0.427451, 1, 0, 1,
-0.6008269, -0.4169143, -1.376194, 0.4235294, 1, 0, 1,
-0.5921726, 0.6932433, -0.9709557, 0.4156863, 1, 0, 1,
-0.5900378, 0.6528243, 1.509069, 0.4117647, 1, 0, 1,
-0.5882076, 0.8716896, -0.2477408, 0.4039216, 1, 0, 1,
-0.5856694, -0.02877908, -0.2208546, 0.3960784, 1, 0, 1,
-0.5833657, 0.004232118, -2.270754, 0.3921569, 1, 0, 1,
-0.5819243, 0.4850252, -3.398243, 0.3843137, 1, 0, 1,
-0.5816007, -0.1209842, -3.595558, 0.3803922, 1, 0, 1,
-0.5781684, 0.0595613, -1.18436, 0.372549, 1, 0, 1,
-0.5754269, 1.367071, -0.3031758, 0.3686275, 1, 0, 1,
-0.5680999, 0.6557005, -0.3818423, 0.3607843, 1, 0, 1,
-0.5672555, -0.09181317, -1.636829, 0.3568628, 1, 0, 1,
-0.5662661, 1.358486, 1.130023, 0.3490196, 1, 0, 1,
-0.5656272, -0.05001127, -2.077309, 0.345098, 1, 0, 1,
-0.5652351, -0.05823626, -1.935755, 0.3372549, 1, 0, 1,
-0.5469694, -1.592239, -1.763868, 0.3333333, 1, 0, 1,
-0.5441768, 1.134366, 1.590718, 0.3254902, 1, 0, 1,
-0.5399272, 0.1508489, -2.418068, 0.3215686, 1, 0, 1,
-0.5393347, -0.08435845, -1.57834, 0.3137255, 1, 0, 1,
-0.5326171, -1.094892, -4.397019, 0.3098039, 1, 0, 1,
-0.5288677, -1.339951, -3.32455, 0.3019608, 1, 0, 1,
-0.5264066, 1.155407, -0.08239076, 0.2941177, 1, 0, 1,
-0.5263366, -0.9293919, -1.780944, 0.2901961, 1, 0, 1,
-0.525694, -1.121608, -4.048056, 0.282353, 1, 0, 1,
-0.5108215, -0.9674065, -5.485601, 0.2784314, 1, 0, 1,
-0.5052059, -0.3942045, -3.081717, 0.2705882, 1, 0, 1,
-0.5050032, -0.6307237, -4.975457, 0.2666667, 1, 0, 1,
-0.5034472, -0.0197433, -2.135368, 0.2588235, 1, 0, 1,
-0.5030614, -0.4734302, -0.7486, 0.254902, 1, 0, 1,
-0.5010993, 1.774884, -0.7587358, 0.2470588, 1, 0, 1,
-0.499963, 0.3387919, -1.631472, 0.2431373, 1, 0, 1,
-0.497438, 0.9929767, -1.80344, 0.2352941, 1, 0, 1,
-0.4963713, 0.04422728, -1.738459, 0.2313726, 1, 0, 1,
-0.4954492, -0.4807381, -3.596187, 0.2235294, 1, 0, 1,
-0.49331, -0.7607787, -0.5474743, 0.2196078, 1, 0, 1,
-0.4916416, -0.07902245, -2.208275, 0.2117647, 1, 0, 1,
-0.4916109, -1.072262, -4.315802, 0.2078431, 1, 0, 1,
-0.490782, -0.2760904, -1.719197, 0.2, 1, 0, 1,
-0.48559, 0.3611078, -1.837041, 0.1921569, 1, 0, 1,
-0.4855611, 1.211898, -0.8732661, 0.1882353, 1, 0, 1,
-0.4768007, 1.393011, 0.7563852, 0.1803922, 1, 0, 1,
-0.4755967, 0.5493902, -1.184034, 0.1764706, 1, 0, 1,
-0.4754429, -0.09660304, -1.992695, 0.1686275, 1, 0, 1,
-0.4753402, 0.6271971, -1.045369, 0.1647059, 1, 0, 1,
-0.4735536, 0.3224445, 1.0276, 0.1568628, 1, 0, 1,
-0.4652629, -0.6670989, -3.696447, 0.1529412, 1, 0, 1,
-0.4639654, 1.588916, -1.02456, 0.145098, 1, 0, 1,
-0.460588, -0.867058, -2.82848, 0.1411765, 1, 0, 1,
-0.4557094, -1.186352, -4.666128, 0.1333333, 1, 0, 1,
-0.4542727, -1.236674, -1.86336, 0.1294118, 1, 0, 1,
-0.454015, -1.182324, -1.10692, 0.1215686, 1, 0, 1,
-0.4539338, 1.489342, -1.448321, 0.1176471, 1, 0, 1,
-0.4512531, -0.6697996, -2.600329, 0.1098039, 1, 0, 1,
-0.450587, -0.4297535, -2.501986, 0.1058824, 1, 0, 1,
-0.4413987, 0.139202, -0.9766538, 0.09803922, 1, 0, 1,
-0.436439, 1.409169, -0.9330112, 0.09019608, 1, 0, 1,
-0.4360141, -0.4918551, -1.455553, 0.08627451, 1, 0, 1,
-0.4313734, -0.06252904, -1.851474, 0.07843138, 1, 0, 1,
-0.431181, 0.7857451, 0.9515973, 0.07450981, 1, 0, 1,
-0.4298626, -0.1495843, -4.324927, 0.06666667, 1, 0, 1,
-0.4281652, 0.9150109, 2.558614, 0.0627451, 1, 0, 1,
-0.4276685, 1.637053, -2.054468, 0.05490196, 1, 0, 1,
-0.4234339, -0.5337409, -0.684334, 0.05098039, 1, 0, 1,
-0.4221393, -0.7335056, -3.05096, 0.04313726, 1, 0, 1,
-0.4183296, 0.04838856, -1.595546, 0.03921569, 1, 0, 1,
-0.415175, -0.357815, -1.840099, 0.03137255, 1, 0, 1,
-0.4118509, -1.020732, -3.195782, 0.02745098, 1, 0, 1,
-0.4115384, 1.504816, -0.03738561, 0.01960784, 1, 0, 1,
-0.4087624, -0.9838827, -1.435346, 0.01568628, 1, 0, 1,
-0.4027712, -0.5217736, -2.547663, 0.007843138, 1, 0, 1,
-0.4016066, -0.4911985, -2.083025, 0.003921569, 1, 0, 1,
-0.4014237, -0.3567207, -3.599084, 0, 1, 0.003921569, 1,
-0.3996322, -0.3357724, -2.535096, 0, 1, 0.01176471, 1,
-0.3959539, 1.279723, 0.8897306, 0, 1, 0.01568628, 1,
-0.3955173, -0.2543266, -3.699625, 0, 1, 0.02352941, 1,
-0.3938243, 0.3683646, -1.64433, 0, 1, 0.02745098, 1,
-0.3921579, -0.2166659, -1.096198, 0, 1, 0.03529412, 1,
-0.3835876, 0.276766, -0.08764619, 0, 1, 0.03921569, 1,
-0.3794419, -1.023451, -1.324152, 0, 1, 0.04705882, 1,
-0.378732, -0.7474886, -2.001057, 0, 1, 0.05098039, 1,
-0.3770683, 0.07265161, -0.6162492, 0, 1, 0.05882353, 1,
-0.3759352, -1.288024, -1.963678, 0, 1, 0.0627451, 1,
-0.3724753, 1.286576, -1.697787, 0, 1, 0.07058824, 1,
-0.369188, 0.176488, -1.492639, 0, 1, 0.07450981, 1,
-0.3668802, 0.7317088, -0.5828527, 0, 1, 0.08235294, 1,
-0.3666689, 0.5526893, -0.5644381, 0, 1, 0.08627451, 1,
-0.3588259, 0.7916139, 0.1472925, 0, 1, 0.09411765, 1,
-0.3563301, 1.040139, -0.3205803, 0, 1, 0.1019608, 1,
-0.3557186, 0.08842774, -0.8361186, 0, 1, 0.1058824, 1,
-0.352181, 1.966582, 0.4411802, 0, 1, 0.1137255, 1,
-0.3503004, 0.1550622, 0.9768061, 0, 1, 0.1176471, 1,
-0.3501983, 1.924316, -0.9299599, 0, 1, 0.1254902, 1,
-0.3496892, 0.6447776, -1.169629, 0, 1, 0.1294118, 1,
-0.3471802, 1.703295, -1.243452, 0, 1, 0.1372549, 1,
-0.3469015, 0.8707873, -0.609912, 0, 1, 0.1411765, 1,
-0.341054, -1.687418, -3.45933, 0, 1, 0.1490196, 1,
-0.3368655, 1.187918, -0.4501456, 0, 1, 0.1529412, 1,
-0.3324496, -0.8033115, -3.511058, 0, 1, 0.1607843, 1,
-0.3302777, -0.4606978, -2.858974, 0, 1, 0.1647059, 1,
-0.3136149, -0.8586409, -1.723326, 0, 1, 0.172549, 1,
-0.313115, -0.7329398, -3.896265, 0, 1, 0.1764706, 1,
-0.3108775, -0.4670797, -3.10743, 0, 1, 0.1843137, 1,
-0.3104904, 0.2660711, 0.4702383, 0, 1, 0.1882353, 1,
-0.3104728, -0.02235478, -0.7698874, 0, 1, 0.1960784, 1,
-0.3104317, -2.14888, -3.305861, 0, 1, 0.2039216, 1,
-0.3103498, -1.624454, -3.494095, 0, 1, 0.2078431, 1,
-0.3049806, -1.700021, -4.056341, 0, 1, 0.2156863, 1,
-0.3001361, -0.7034736, -1.337206, 0, 1, 0.2196078, 1,
-0.296936, 0.7347558, 1.288651, 0, 1, 0.227451, 1,
-0.2967285, -0.1340299, -3.674687, 0, 1, 0.2313726, 1,
-0.296707, 1.404339, -0.1550429, 0, 1, 0.2392157, 1,
-0.2962961, -0.100499, -3.748639, 0, 1, 0.2431373, 1,
-0.291421, 0.4715717, 0.357958, 0, 1, 0.2509804, 1,
-0.2864745, -0.6022739, -2.322134, 0, 1, 0.254902, 1,
-0.285781, -1.001182, -2.553649, 0, 1, 0.2627451, 1,
-0.2846936, -0.1670857, -1.862414, 0, 1, 0.2666667, 1,
-0.2815057, 0.3793243, -0.7967253, 0, 1, 0.2745098, 1,
-0.2797314, 1.091476, -1.512615, 0, 1, 0.2784314, 1,
-0.2769033, 1.897252, 0.009221123, 0, 1, 0.2862745, 1,
-0.2736147, -1.348132, -5.567665, 0, 1, 0.2901961, 1,
-0.2732927, 0.6966718, 0.1538708, 0, 1, 0.2980392, 1,
-0.2667991, -0.3643773, -1.403157, 0, 1, 0.3058824, 1,
-0.2647155, -1.219553, -2.050215, 0, 1, 0.3098039, 1,
-0.2633723, 0.2109923, -1.702122, 0, 1, 0.3176471, 1,
-0.2610793, 1.610263, -1.890407, 0, 1, 0.3215686, 1,
-0.2605122, 1.541547, 0.0973682, 0, 1, 0.3294118, 1,
-0.2603387, -0.3871323, -1.811303, 0, 1, 0.3333333, 1,
-0.2553344, -0.9238106, -4.214521, 0, 1, 0.3411765, 1,
-0.2543811, 0.05383188, -0.519673, 0, 1, 0.345098, 1,
-0.2541113, 1.905087, 0.445781, 0, 1, 0.3529412, 1,
-0.2534579, -0.8344896, -4.564793, 0, 1, 0.3568628, 1,
-0.2474089, 0.4226162, -0.6895987, 0, 1, 0.3647059, 1,
-0.2386734, 1.353713, 0.3495128, 0, 1, 0.3686275, 1,
-0.2379714, -1.490282, -2.852363, 0, 1, 0.3764706, 1,
-0.2311317, 0.1297009, -1.32298, 0, 1, 0.3803922, 1,
-0.2292415, -1.676723, -3.302702, 0, 1, 0.3882353, 1,
-0.2207763, 0.5079738, -0.9611677, 0, 1, 0.3921569, 1,
-0.2165925, 0.1390056, -1.076025, 0, 1, 0.4, 1,
-0.2151807, 0.5671068, -0.08605494, 0, 1, 0.4078431, 1,
-0.213013, -0.8425382, -1.602347, 0, 1, 0.4117647, 1,
-0.2128195, -0.8782414, -2.368948, 0, 1, 0.4196078, 1,
-0.2118484, 0.7986124, -0.0454211, 0, 1, 0.4235294, 1,
-0.2107799, 1.587268, 1.135685, 0, 1, 0.4313726, 1,
-0.1988171, 0.8402625, -0.2992653, 0, 1, 0.4352941, 1,
-0.1986484, 1.423132, -0.1469619, 0, 1, 0.4431373, 1,
-0.1965142, 0.4428114, -0.6000493, 0, 1, 0.4470588, 1,
-0.196033, 0.1794864, -0.2031799, 0, 1, 0.454902, 1,
-0.1946355, -1.340062, -1.636065, 0, 1, 0.4588235, 1,
-0.1917204, -0.1235263, -4.24882, 0, 1, 0.4666667, 1,
-0.1870432, -0.6347393, -4.819408, 0, 1, 0.4705882, 1,
-0.1853055, 1.194031, 1.636883, 0, 1, 0.4784314, 1,
-0.1831473, 1.550639, 1.702099, 0, 1, 0.4823529, 1,
-0.1808566, -0.920774, -3.937282, 0, 1, 0.4901961, 1,
-0.1802697, 2.034034, -0.6854685, 0, 1, 0.4941176, 1,
-0.1773709, 0.2421133, -1.27112, 0, 1, 0.5019608, 1,
-0.176018, -0.5583428, -4.115798, 0, 1, 0.509804, 1,
-0.1739855, 0.1141153, -1.024772, 0, 1, 0.5137255, 1,
-0.1730812, 1.376112, 0.5908772, 0, 1, 0.5215687, 1,
-0.169507, -0.4355032, -1.588596, 0, 1, 0.5254902, 1,
-0.168248, 0.6836589, -0.02993098, 0, 1, 0.5333334, 1,
-0.1660053, 0.5969819, 0.05011658, 0, 1, 0.5372549, 1,
-0.1598133, 0.4774769, 1.456054, 0, 1, 0.5450981, 1,
-0.1580464, 0.1455148, -1.230681, 0, 1, 0.5490196, 1,
-0.1574597, -0.01088389, -0.9601395, 0, 1, 0.5568628, 1,
-0.1562027, 0.3385023, 0.2331856, 0, 1, 0.5607843, 1,
-0.1548631, 2.122392, -0.6448848, 0, 1, 0.5686275, 1,
-0.1546488, -1.082796, -2.564888, 0, 1, 0.572549, 1,
-0.1529621, -1.414366, -2.373901, 0, 1, 0.5803922, 1,
-0.151488, 1.987135, 1.18756, 0, 1, 0.5843138, 1,
-0.1454257, 0.6051408, -0.2028099, 0, 1, 0.5921569, 1,
-0.142139, 0.3676701, -1.146867, 0, 1, 0.5960785, 1,
-0.1402578, 1.129441, 0.6837178, 0, 1, 0.6039216, 1,
-0.1353829, 0.4328872, -1.604146, 0, 1, 0.6117647, 1,
-0.1334198, -1.325636, -3.02159, 0, 1, 0.6156863, 1,
-0.1281228, -0.8332173, -2.596614, 0, 1, 0.6235294, 1,
-0.1258325, -0.1690157, -5.094049, 0, 1, 0.627451, 1,
-0.1236577, -0.768245, -3.68231, 0, 1, 0.6352941, 1,
-0.1231399, 1.224939, 0.3208977, 0, 1, 0.6392157, 1,
-0.116751, -0.8442109, -1.704863, 0, 1, 0.6470588, 1,
-0.1139909, 1.213942, 0.08578858, 0, 1, 0.6509804, 1,
-0.1093393, 0.8089712, -0.3211503, 0, 1, 0.6588235, 1,
-0.1065146, 0.3964489, -0.3578625, 0, 1, 0.6627451, 1,
-0.1059611, 0.6636738, -0.003388426, 0, 1, 0.6705883, 1,
-0.1050258, -1.159727, -1.318141, 0, 1, 0.6745098, 1,
-0.09741242, -0.3019335, -3.430862, 0, 1, 0.682353, 1,
-0.09576635, -0.2651529, -3.71257, 0, 1, 0.6862745, 1,
-0.09286741, 0.7819523, 0.0987176, 0, 1, 0.6941177, 1,
-0.09078897, 2.19554, -0.1567631, 0, 1, 0.7019608, 1,
-0.08772054, -0.328189, -2.744614, 0, 1, 0.7058824, 1,
-0.08546153, 0.1173925, -0.168821, 0, 1, 0.7137255, 1,
-0.08267965, 1.128469, -0.08702251, 0, 1, 0.7176471, 1,
-0.07990579, 0.2448394, 1.089205, 0, 1, 0.7254902, 1,
-0.07796982, 0.127308, -0.03106632, 0, 1, 0.7294118, 1,
-0.07360032, 0.2401498, 0.4005671, 0, 1, 0.7372549, 1,
-0.07310557, 0.2343851, 1.067873, 0, 1, 0.7411765, 1,
-0.06958598, 0.986096, 0.1649969, 0, 1, 0.7490196, 1,
-0.06913559, 0.7734178, -1.038193, 0, 1, 0.7529412, 1,
-0.06714939, -0.8596061, -4.681783, 0, 1, 0.7607843, 1,
-0.06688615, -0.2567721, -3.210296, 0, 1, 0.7647059, 1,
-0.06534637, 1.012904, -0.9562973, 0, 1, 0.772549, 1,
-0.06389161, -1.301772, -2.68381, 0, 1, 0.7764706, 1,
-0.06368575, -0.1742399, -3.72277, 0, 1, 0.7843137, 1,
-0.0630834, 0.07229011, -1.559154, 0, 1, 0.7882353, 1,
-0.05998951, 0.9766824, -1.954304, 0, 1, 0.7960784, 1,
-0.05793029, -1.094978, -4.218134, 0, 1, 0.8039216, 1,
-0.05244625, 0.05731862, -1.031096, 0, 1, 0.8078431, 1,
-0.05077327, -0.3288563, -3.425408, 0, 1, 0.8156863, 1,
-0.04511436, -0.476199, -1.377983, 0, 1, 0.8196079, 1,
-0.02522525, -0.4171568, -2.8429, 0, 1, 0.827451, 1,
-0.0248948, 2.247332, -1.311574, 0, 1, 0.8313726, 1,
-0.02248269, -0.5309207, -2.756375, 0, 1, 0.8392157, 1,
-0.02053056, 0.8528943, 0.4837481, 0, 1, 0.8431373, 1,
-0.01819715, 0.41536, -0.1866388, 0, 1, 0.8509804, 1,
-0.01470308, -0.1333815, -2.595275, 0, 1, 0.854902, 1,
-0.0114873, -1.035251, -5.0743, 0, 1, 0.8627451, 1,
-0.01130268, -1.192267, -2.335177, 0, 1, 0.8666667, 1,
-0.0104378, 0.3528876, -0.267905, 0, 1, 0.8745098, 1,
-0.01007657, 0.2472128, 0.6337885, 0, 1, 0.8784314, 1,
0.001006276, 1.088912, 1.784155, 0, 1, 0.8862745, 1,
0.002202087, 0.4370644, -1.86322, 0, 1, 0.8901961, 1,
0.004514431, -1.132337, 3.236516, 0, 1, 0.8980392, 1,
0.004630073, 0.1190407, 2.852493, 0, 1, 0.9058824, 1,
0.005988635, 0.9425484, -1.217419, 0, 1, 0.9098039, 1,
0.007928693, -1.228822, 3.956938, 0, 1, 0.9176471, 1,
0.01056254, 1.500402, -0.7515268, 0, 1, 0.9215686, 1,
0.01323588, -0.4311406, 3.063551, 0, 1, 0.9294118, 1,
0.01873973, -0.7777655, 4.518466, 0, 1, 0.9333333, 1,
0.01927279, -0.04587786, 2.000341, 0, 1, 0.9411765, 1,
0.01998447, 2.330273, -0.4335629, 0, 1, 0.945098, 1,
0.02017211, -0.8950697, 2.321033, 0, 1, 0.9529412, 1,
0.02658132, -0.0485521, 2.555386, 0, 1, 0.9568627, 1,
0.02794689, -0.2476315, 2.507992, 0, 1, 0.9647059, 1,
0.02950114, 0.5856689, 1.236641, 0, 1, 0.9686275, 1,
0.03026681, 0.9661973, 0.8639438, 0, 1, 0.9764706, 1,
0.03534814, -0.6707262, 2.975423, 0, 1, 0.9803922, 1,
0.03961491, -0.1113993, 3.449054, 0, 1, 0.9882353, 1,
0.04610415, 0.6616827, -0.7682667, 0, 1, 0.9921569, 1,
0.04890445, -1.360193, 3.869414, 0, 1, 1, 1,
0.05510108, 0.977817, -1.070146, 0, 0.9921569, 1, 1,
0.05953547, -0.7120047, 2.182241, 0, 0.9882353, 1, 1,
0.06429921, -1.447268, 3.260897, 0, 0.9803922, 1, 1,
0.06498876, 1.271536, -1.129043, 0, 0.9764706, 1, 1,
0.06518485, -0.3378635, 3.403939, 0, 0.9686275, 1, 1,
0.06605119, 0.6023657, -1.10426, 0, 0.9647059, 1, 1,
0.06637248, -0.9205977, 2.095336, 0, 0.9568627, 1, 1,
0.06749033, 0.0723881, 2.183628, 0, 0.9529412, 1, 1,
0.07041178, -0.2660763, 1.788858, 0, 0.945098, 1, 1,
0.07102244, 1.214703, 0.1089639, 0, 0.9411765, 1, 1,
0.07141104, -0.3876776, 2.54372, 0, 0.9333333, 1, 1,
0.07347429, -1.461954, 1.907266, 0, 0.9294118, 1, 1,
0.07654256, 0.4087048, 0.9421687, 0, 0.9215686, 1, 1,
0.07949733, -0.4565519, 1.329217, 0, 0.9176471, 1, 1,
0.0869601, 0.3362932, -1.952254, 0, 0.9098039, 1, 1,
0.08760694, 0.173276, 0.9496707, 0, 0.9058824, 1, 1,
0.08783317, -0.4704118, 4.199055, 0, 0.8980392, 1, 1,
0.09127044, -0.3305323, 3.490722, 0, 0.8901961, 1, 1,
0.09868316, 0.9978427, -0.1410173, 0, 0.8862745, 1, 1,
0.1074281, -0.9678205, 2.019606, 0, 0.8784314, 1, 1,
0.1100705, -0.5862674, 2.423404, 0, 0.8745098, 1, 1,
0.1128292, -0.02359367, 1.829492, 0, 0.8666667, 1, 1,
0.1132131, -1.834411, 2.281714, 0, 0.8627451, 1, 1,
0.1155871, 0.3558348, 2.371426, 0, 0.854902, 1, 1,
0.1161057, 0.2222553, 0.2080578, 0, 0.8509804, 1, 1,
0.1188823, -1.005131, 4.015563, 0, 0.8431373, 1, 1,
0.1243099, 0.6965957, 1.223408, 0, 0.8392157, 1, 1,
0.1256626, 0.01639793, 2.054714, 0, 0.8313726, 1, 1,
0.1271752, -1.794174, 4.427685, 0, 0.827451, 1, 1,
0.131615, -0.8538561, 3.098799, 0, 0.8196079, 1, 1,
0.1386958, 0.5459967, 0.3250514, 0, 0.8156863, 1, 1,
0.142501, -0.8947064, 3.200041, 0, 0.8078431, 1, 1,
0.1447291, -0.228682, 3.354226, 0, 0.8039216, 1, 1,
0.1476178, -1.829234, 2.020149, 0, 0.7960784, 1, 1,
0.1506789, -1.827111, 2.981592, 0, 0.7882353, 1, 1,
0.1520118, -1.835095, 3.205936, 0, 0.7843137, 1, 1,
0.1552395, -0.0468444, 0.1223573, 0, 0.7764706, 1, 1,
0.1553703, -0.9296714, 4.900884, 0, 0.772549, 1, 1,
0.1591371, -1.365106, 3.655283, 0, 0.7647059, 1, 1,
0.1596423, -0.6864986, 2.764939, 0, 0.7607843, 1, 1,
0.160144, 1.131791, 0.249519, 0, 0.7529412, 1, 1,
0.1610767, 0.8500867, 0.764331, 0, 0.7490196, 1, 1,
0.1613305, -0.08627044, 2.548255, 0, 0.7411765, 1, 1,
0.1636466, -0.1853589, 1.460093, 0, 0.7372549, 1, 1,
0.1639421, -0.2616979, 3.380833, 0, 0.7294118, 1, 1,
0.164103, -0.8443747, 2.148891, 0, 0.7254902, 1, 1,
0.1647774, -1.52937, 3.722066, 0, 0.7176471, 1, 1,
0.1651116, 0.04699875, 1.700386, 0, 0.7137255, 1, 1,
0.1690613, 0.1097487, 0.9270489, 0, 0.7058824, 1, 1,
0.1697149, 0.1972254, 0.6260087, 0, 0.6980392, 1, 1,
0.170155, -0.1995946, 4.861768, 0, 0.6941177, 1, 1,
0.1712086, -0.2972789, 1.093004, 0, 0.6862745, 1, 1,
0.1718898, 0.2563598, -0.3675912, 0, 0.682353, 1, 1,
0.1722576, 1.115451, -1.145269, 0, 0.6745098, 1, 1,
0.1726638, -0.1138081, 1.756328, 0, 0.6705883, 1, 1,
0.1820822, 0.3303914, 0.03781853, 0, 0.6627451, 1, 1,
0.1859914, -1.245868, 1.830546, 0, 0.6588235, 1, 1,
0.1875531, -2.471416, 2.429945, 0, 0.6509804, 1, 1,
0.1894409, 1.269426, 1.612305, 0, 0.6470588, 1, 1,
0.1910712, -0.933621, 1.627587, 0, 0.6392157, 1, 1,
0.1920474, -0.7914126, 5.029825, 0, 0.6352941, 1, 1,
0.2000235, -3.031335, 3.824656, 0, 0.627451, 1, 1,
0.2039307, 1.501897, 1.583772, 0, 0.6235294, 1, 1,
0.206667, 0.1248274, 1.992018, 0, 0.6156863, 1, 1,
0.2101839, 1.664611, 2.108488, 0, 0.6117647, 1, 1,
0.2139935, -0.3327843, 3.316523, 0, 0.6039216, 1, 1,
0.2142309, 0.1417082, 1.686725, 0, 0.5960785, 1, 1,
0.221887, -1.325854, 3.534812, 0, 0.5921569, 1, 1,
0.2260097, -0.2905783, 2.414429, 0, 0.5843138, 1, 1,
0.2267649, -1.873877, 1.799889, 0, 0.5803922, 1, 1,
0.2272374, -0.5200912, 4.63339, 0, 0.572549, 1, 1,
0.2282963, 0.8917314, 0.1205332, 0, 0.5686275, 1, 1,
0.2296925, 0.3615046, 1.187743, 0, 0.5607843, 1, 1,
0.2332165, -0.8064627, 3.673641, 0, 0.5568628, 1, 1,
0.2339039, -0.8821918, -0.3401302, 0, 0.5490196, 1, 1,
0.2376326, 0.3547484, 0.915081, 0, 0.5450981, 1, 1,
0.2439365, 0.6064549, 0.7442788, 0, 0.5372549, 1, 1,
0.249616, 0.8645228, -0.3897474, 0, 0.5333334, 1, 1,
0.2516535, -0.7656245, 4.633423, 0, 0.5254902, 1, 1,
0.253241, 0.5321801, 0.7810171, 0, 0.5215687, 1, 1,
0.253759, 1.020892, 0.1270946, 0, 0.5137255, 1, 1,
0.2542295, 1.22729, -0.5348984, 0, 0.509804, 1, 1,
0.2616503, -1.445554, 1.244278, 0, 0.5019608, 1, 1,
0.2664371, -1.517792, 4.466949, 0, 0.4941176, 1, 1,
0.2692711, -0.2938297, 2.363075, 0, 0.4901961, 1, 1,
0.2703903, -0.6654656, 1.636467, 0, 0.4823529, 1, 1,
0.271514, 1.110081, 1.545122, 0, 0.4784314, 1, 1,
0.2735822, 0.9208111, -0.7982166, 0, 0.4705882, 1, 1,
0.2786368, -0.4618679, 2.893657, 0, 0.4666667, 1, 1,
0.2787908, 0.175922, 2.945948, 0, 0.4588235, 1, 1,
0.282335, -1.12624, 4.319451, 0, 0.454902, 1, 1,
0.2871839, -0.4687566, 2.015568, 0, 0.4470588, 1, 1,
0.2874132, 0.2775525, -1.334707, 0, 0.4431373, 1, 1,
0.2884701, 0.9940928, -0.3135024, 0, 0.4352941, 1, 1,
0.289271, 0.03098677, 2.114642, 0, 0.4313726, 1, 1,
0.2910053, 0.8820078, 0.2617218, 0, 0.4235294, 1, 1,
0.2955645, 0.3840254, 1.33437, 0, 0.4196078, 1, 1,
0.2964085, 1.013166, -0.602807, 0, 0.4117647, 1, 1,
0.2984358, -0.4086688, 2.65856, 0, 0.4078431, 1, 1,
0.2997976, 1.229215, 0.7270407, 0, 0.4, 1, 1,
0.300448, -0.1703462, 2.331203, 0, 0.3921569, 1, 1,
0.3014894, 0.7343922, -0.04373378, 0, 0.3882353, 1, 1,
0.3111867, -1.211683, 3.590158, 0, 0.3803922, 1, 1,
0.3113344, 0.07830669, 0.6221735, 0, 0.3764706, 1, 1,
0.31255, -0.1969405, 1.797813, 0, 0.3686275, 1, 1,
0.3138692, -1.570318, 2.51571, 0, 0.3647059, 1, 1,
0.3173059, -0.4256993, 2.019344, 0, 0.3568628, 1, 1,
0.3232504, -1.82476, 3.518872, 0, 0.3529412, 1, 1,
0.3267386, -2.050188, 4.487926, 0, 0.345098, 1, 1,
0.3276846, 0.8908644, -0.24168, 0, 0.3411765, 1, 1,
0.3291109, -0.1962764, 0.5058775, 0, 0.3333333, 1, 1,
0.3307172, 0.0830867, 1.404391, 0, 0.3294118, 1, 1,
0.3343601, -0.4801171, 3.226204, 0, 0.3215686, 1, 1,
0.3367478, -0.7649834, 4.16431, 0, 0.3176471, 1, 1,
0.3416067, 0.6755449, 2.014396, 0, 0.3098039, 1, 1,
0.3427811, -0.610462, 3.618845, 0, 0.3058824, 1, 1,
0.3432596, 1.446809, -0.5193991, 0, 0.2980392, 1, 1,
0.3446846, -0.1774326, 1.146198, 0, 0.2901961, 1, 1,
0.3474655, -1.704706, 2.834248, 0, 0.2862745, 1, 1,
0.3538304, 1.86654, -0.2462093, 0, 0.2784314, 1, 1,
0.3575758, -0.0839893, 0.8626206, 0, 0.2745098, 1, 1,
0.3578658, -1.310188, 3.68807, 0, 0.2666667, 1, 1,
0.3590142, -0.270146, 1.85456, 0, 0.2627451, 1, 1,
0.3598374, -0.8588842, 4.201102, 0, 0.254902, 1, 1,
0.3618658, 0.3980201, 0.5660484, 0, 0.2509804, 1, 1,
0.3630829, 0.9922863, 1.41628, 0, 0.2431373, 1, 1,
0.3648862, 0.3443772, -1.037035, 0, 0.2392157, 1, 1,
0.3681982, -1.084935, 3.675158, 0, 0.2313726, 1, 1,
0.3713523, 0.8281445, -0.06478488, 0, 0.227451, 1, 1,
0.3724874, 2.011691, -0.5106826, 0, 0.2196078, 1, 1,
0.3740651, 0.8254403, -1.166342, 0, 0.2156863, 1, 1,
0.3802263, -0.1514926, 0.3664763, 0, 0.2078431, 1, 1,
0.3807195, -0.8498221, 2.154389, 0, 0.2039216, 1, 1,
0.3821335, 0.08451875, -0.2308736, 0, 0.1960784, 1, 1,
0.38519, 1.019102, 1.214777, 0, 0.1882353, 1, 1,
0.3862239, -0.511253, 2.561362, 0, 0.1843137, 1, 1,
0.3903424, 0.9404039, 0.5416714, 0, 0.1764706, 1, 1,
0.3925859, -1.416148, 1.437688, 0, 0.172549, 1, 1,
0.3949639, -0.3345036, 3.761612, 0, 0.1647059, 1, 1,
0.4045517, 1.947284, -1.101791, 0, 0.1607843, 1, 1,
0.4080828, -0.3792433, 3.329609, 0, 0.1529412, 1, 1,
0.4082405, -0.1828092, 2.561753, 0, 0.1490196, 1, 1,
0.4088741, 0.6656723, -0.5634838, 0, 0.1411765, 1, 1,
0.4103466, 0.5552387, 1.470832, 0, 0.1372549, 1, 1,
0.4104587, 2.816949, -0.1519226, 0, 0.1294118, 1, 1,
0.4157267, -0.5521973, 2.20387, 0, 0.1254902, 1, 1,
0.4170728, 0.1143205, 0.5360033, 0, 0.1176471, 1, 1,
0.4205036, 1.441236, -1.070929, 0, 0.1137255, 1, 1,
0.4243194, -0.6234623, 1.294827, 0, 0.1058824, 1, 1,
0.4262218, 0.8256187, 1.291227, 0, 0.09803922, 1, 1,
0.4279371, 0.4634533, 0.7110759, 0, 0.09411765, 1, 1,
0.4310394, 0.9548048, 1.933511, 0, 0.08627451, 1, 1,
0.4317797, 1.564698, 0.5518344, 0, 0.08235294, 1, 1,
0.4324972, 0.8955558, -0.02221295, 0, 0.07450981, 1, 1,
0.4336303, 0.2258628, -0.2736835, 0, 0.07058824, 1, 1,
0.4410768, 0.2434803, 0.2203484, 0, 0.0627451, 1, 1,
0.4431974, -0.1012631, 1.923752, 0, 0.05882353, 1, 1,
0.4437636, 0.966899, 0.6400169, 0, 0.05098039, 1, 1,
0.4445889, -0.6767302, 2.236503, 0, 0.04705882, 1, 1,
0.4457442, 1.000539, -1.169186, 0, 0.03921569, 1, 1,
0.4461691, -0.5447652, 2.154534, 0, 0.03529412, 1, 1,
0.4461853, -1.80411, 3.955791, 0, 0.02745098, 1, 1,
0.4483505, 1.825766, -1.442479, 0, 0.02352941, 1, 1,
0.4542197, 0.173316, 1.188739, 0, 0.01568628, 1, 1,
0.4561341, 0.3905533, 0.03163807, 0, 0.01176471, 1, 1,
0.4582048, -0.7458529, 3.130907, 0, 0.003921569, 1, 1,
0.4632078, -1.713883, 1.950004, 0.003921569, 0, 1, 1,
0.464321, -0.2471905, 2.940138, 0.007843138, 0, 1, 1,
0.4659043, -1.332047, 3.019641, 0.01568628, 0, 1, 1,
0.4672113, 1.5866, 1.310974, 0.01960784, 0, 1, 1,
0.4695943, -0.6872762, 4.216798, 0.02745098, 0, 1, 1,
0.4699482, -0.02413376, 3.257145, 0.03137255, 0, 1, 1,
0.4732286, 0.2268943, 1.30177, 0.03921569, 0, 1, 1,
0.4829833, -0.928049, 3.174374, 0.04313726, 0, 1, 1,
0.4845552, 0.558569, 0.2434877, 0.05098039, 0, 1, 1,
0.4862762, -0.4591499, 2.16678, 0.05490196, 0, 1, 1,
0.4866354, -0.09679631, 2.003291, 0.0627451, 0, 1, 1,
0.4879003, -1.195687, 3.550737, 0.06666667, 0, 1, 1,
0.494364, -0.1131826, 2.153513, 0.07450981, 0, 1, 1,
0.4982786, 0.9353994, -0.09962907, 0.07843138, 0, 1, 1,
0.4984473, -0.7184014, 2.807592, 0.08627451, 0, 1, 1,
0.4985575, 0.1532329, 2.370234, 0.09019608, 0, 1, 1,
0.498639, 0.6992282, 1.629913, 0.09803922, 0, 1, 1,
0.5012303, 1.106882, 0.0093575, 0.1058824, 0, 1, 1,
0.5022542, 0.282491, 0.6621523, 0.1098039, 0, 1, 1,
0.5024666, 0.007880203, 1.00608, 0.1176471, 0, 1, 1,
0.5088645, -0.7475517, 2.15205, 0.1215686, 0, 1, 1,
0.510411, 1.280126, 2.021163, 0.1294118, 0, 1, 1,
0.5126939, -0.6271746, 1.276646, 0.1333333, 0, 1, 1,
0.5158152, 1.439585, 0.3258874, 0.1411765, 0, 1, 1,
0.5186315, 0.2589371, 1.474613, 0.145098, 0, 1, 1,
0.518939, -0.9560425, 3.456943, 0.1529412, 0, 1, 1,
0.5193073, -0.8368236, 3.032768, 0.1568628, 0, 1, 1,
0.519969, 0.2657481, 0.02029045, 0.1647059, 0, 1, 1,
0.5208544, -1.07632, 2.861213, 0.1686275, 0, 1, 1,
0.523172, -0.7749411, 2.324007, 0.1764706, 0, 1, 1,
0.5278116, -0.9451714, 4.775765, 0.1803922, 0, 1, 1,
0.5318901, -0.1143984, 2.044723, 0.1882353, 0, 1, 1,
0.5324075, 0.3060295, 2.498985, 0.1921569, 0, 1, 1,
0.5327066, -0.1650511, 4.091613, 0.2, 0, 1, 1,
0.5328009, 0.7184986, 0.2494335, 0.2078431, 0, 1, 1,
0.532856, 1.53513, -0.8592678, 0.2117647, 0, 1, 1,
0.5447788, -0.5184064, 3.369566, 0.2196078, 0, 1, 1,
0.5483863, 0.4564364, 0.2569081, 0.2235294, 0, 1, 1,
0.5484723, 0.5840952, 0.2793534, 0.2313726, 0, 1, 1,
0.5554847, 0.4128711, 0.2330184, 0.2352941, 0, 1, 1,
0.5564978, -0.1736167, 2.281672, 0.2431373, 0, 1, 1,
0.5599562, 2.099605, 2.167785, 0.2470588, 0, 1, 1,
0.5629445, -1.058172, 2.896704, 0.254902, 0, 1, 1,
0.5636892, -0.2999298, 2.300455, 0.2588235, 0, 1, 1,
0.5640395, 0.3613481, 2.36425, 0.2666667, 0, 1, 1,
0.5735756, 0.4410864, 0.3844465, 0.2705882, 0, 1, 1,
0.5812559, 0.04846754, 0.6652079, 0.2784314, 0, 1, 1,
0.5827074, 0.8023502, 0.4689276, 0.282353, 0, 1, 1,
0.5873046, -0.3189069, 2.806228, 0.2901961, 0, 1, 1,
0.5893867, -0.9137273, 2.710256, 0.2941177, 0, 1, 1,
0.5896884, -0.7378693, 1.264099, 0.3019608, 0, 1, 1,
0.5964565, -0.2686095, 2.076349, 0.3098039, 0, 1, 1,
0.5977256, 0.3849294, 1.109798, 0.3137255, 0, 1, 1,
0.5999951, -1.331199, 2.299525, 0.3215686, 0, 1, 1,
0.6048555, 1.756782, -0.6846557, 0.3254902, 0, 1, 1,
0.6094164, 0.4548299, 0.3997267, 0.3333333, 0, 1, 1,
0.6132832, -0.6076332, 1.522084, 0.3372549, 0, 1, 1,
0.6167616, 0.7523071, 0.2542857, 0.345098, 0, 1, 1,
0.6188356, 0.5794337, 1.254081, 0.3490196, 0, 1, 1,
0.6188537, 1.732869, 1.587178, 0.3568628, 0, 1, 1,
0.6220512, -0.6721319, 1.863785, 0.3607843, 0, 1, 1,
0.6240641, 1.615247, 2.044348, 0.3686275, 0, 1, 1,
0.6276988, 0.1518669, 1.019573, 0.372549, 0, 1, 1,
0.6357977, 2.505616, 0.8291371, 0.3803922, 0, 1, 1,
0.6369126, -0.3378852, 1.756186, 0.3843137, 0, 1, 1,
0.6392386, 0.6854343, 0.5224683, 0.3921569, 0, 1, 1,
0.6425668, -0.6066194, 3.605077, 0.3960784, 0, 1, 1,
0.6438784, 1.189259, 2.39883, 0.4039216, 0, 1, 1,
0.6474572, -0.9547946, 3.516185, 0.4117647, 0, 1, 1,
0.6484121, -1.127885, 0.8525077, 0.4156863, 0, 1, 1,
0.6519303, -0.3591781, 1.66563, 0.4235294, 0, 1, 1,
0.6562666, -0.6961219, 1.422872, 0.427451, 0, 1, 1,
0.6567128, -0.2516443, 3.407736, 0.4352941, 0, 1, 1,
0.6581405, 0.7186266, 2.902622, 0.4392157, 0, 1, 1,
0.6597352, 1.180742, 0.1792789, 0.4470588, 0, 1, 1,
0.6631852, 1.070555, 1.213471, 0.4509804, 0, 1, 1,
0.6642088, 0.461064, 1.889473, 0.4588235, 0, 1, 1,
0.6813122, -0.1015265, 2.112916, 0.4627451, 0, 1, 1,
0.6831399, 0.6046888, 1.454695, 0.4705882, 0, 1, 1,
0.6845453, -1.186365, 2.024115, 0.4745098, 0, 1, 1,
0.6866936, -1.738096, 2.031587, 0.4823529, 0, 1, 1,
0.6873637, -1.143867, 3.471747, 0.4862745, 0, 1, 1,
0.6914167, 1.539924, 0.3970469, 0.4941176, 0, 1, 1,
0.7016985, 0.5474586, 1.773325, 0.5019608, 0, 1, 1,
0.7018952, 0.8001558, 0.8604912, 0.5058824, 0, 1, 1,
0.7067489, -0.8721972, 1.213394, 0.5137255, 0, 1, 1,
0.7088609, -0.4713923, 1.991951, 0.5176471, 0, 1, 1,
0.7093948, -1.342406, 2.216411, 0.5254902, 0, 1, 1,
0.7104177, 0.337449, -0.8497477, 0.5294118, 0, 1, 1,
0.7159464, -0.2158402, 1.599464, 0.5372549, 0, 1, 1,
0.7184374, 0.7925311, 1.936398, 0.5411765, 0, 1, 1,
0.7213229, 1.432546, 0.7729595, 0.5490196, 0, 1, 1,
0.7248729, 0.5770028, 2.95777, 0.5529412, 0, 1, 1,
0.725475, -1.002748, 3.052127, 0.5607843, 0, 1, 1,
0.7258743, 0.2844236, 0.9527954, 0.5647059, 0, 1, 1,
0.7270386, -0.7149918, 0.9618921, 0.572549, 0, 1, 1,
0.7287278, -1.103892, 4.874387, 0.5764706, 0, 1, 1,
0.731517, 0.9749389, 0.4579658, 0.5843138, 0, 1, 1,
0.7316671, -0.9224775, 1.251457, 0.5882353, 0, 1, 1,
0.7353323, 0.8168998, -1.390923, 0.5960785, 0, 1, 1,
0.7397386, -0.1161766, 0.8068457, 0.6039216, 0, 1, 1,
0.7421064, 0.7928285, -0.1001682, 0.6078432, 0, 1, 1,
0.750587, 1.159708, 1.540413, 0.6156863, 0, 1, 1,
0.7524981, -0.5974912, 2.285015, 0.6196079, 0, 1, 1,
0.7629225, 0.06738517, 0.5247278, 0.627451, 0, 1, 1,
0.7657014, -0.327912, 1.243001, 0.6313726, 0, 1, 1,
0.7657421, 0.4469274, 0.4086038, 0.6392157, 0, 1, 1,
0.7666612, -0.2424844, 1.868676, 0.6431373, 0, 1, 1,
0.7725149, -0.1625111, 1.065679, 0.6509804, 0, 1, 1,
0.7732462, 0.689282, 0.3162618, 0.654902, 0, 1, 1,
0.7738623, 0.2316537, 0.8597538, 0.6627451, 0, 1, 1,
0.7810122, -2.216011, 1.305817, 0.6666667, 0, 1, 1,
0.7813611, 0.8465348, 1.474162, 0.6745098, 0, 1, 1,
0.7852222, 0.2139249, 2.086001, 0.6784314, 0, 1, 1,
0.7869852, -0.3764415, 0.3328171, 0.6862745, 0, 1, 1,
0.7880013, -0.01434289, 2.235751, 0.6901961, 0, 1, 1,
0.7893175, -0.630381, 2.672024, 0.6980392, 0, 1, 1,
0.7985275, -0.9318928, 2.698804, 0.7058824, 0, 1, 1,
0.8030938, 0.2303939, 0.2950648, 0.7098039, 0, 1, 1,
0.8080497, -2.139455, 3.337606, 0.7176471, 0, 1, 1,
0.8095946, 1.133536, 0.3370278, 0.7215686, 0, 1, 1,
0.8107153, 0.2469857, 1.981428, 0.7294118, 0, 1, 1,
0.8155765, -0.4122127, 2.125242, 0.7333333, 0, 1, 1,
0.8166624, 0.4933839, 2.551548, 0.7411765, 0, 1, 1,
0.817997, -0.5827898, 1.81531, 0.7450981, 0, 1, 1,
0.8196073, 0.3837204, -1.8028, 0.7529412, 0, 1, 1,
0.822665, -1.414844, 2.813558, 0.7568628, 0, 1, 1,
0.8229334, -0.1031202, 2.1264, 0.7647059, 0, 1, 1,
0.8236115, 2.176949, 0.1786531, 0.7686275, 0, 1, 1,
0.8275601, -0.1126833, -0.2895605, 0.7764706, 0, 1, 1,
0.8281435, -1.66224, 3.161227, 0.7803922, 0, 1, 1,
0.833508, -0.5976867, 3.290523, 0.7882353, 0, 1, 1,
0.8347111, -0.5606142, 1.505415, 0.7921569, 0, 1, 1,
0.8347316, -0.9791374, 1.625906, 0.8, 0, 1, 1,
0.8378502, 1.129441, 0.9053717, 0.8078431, 0, 1, 1,
0.8384729, -0.1904307, 2.949343, 0.8117647, 0, 1, 1,
0.8385207, 0.360781, 1.049766, 0.8196079, 0, 1, 1,
0.8388371, -0.07451434, 1.302363, 0.8235294, 0, 1, 1,
0.8409553, -0.83324, 2.657158, 0.8313726, 0, 1, 1,
0.8420107, 0.7801453, 0.3281437, 0.8352941, 0, 1, 1,
0.8472564, -1.616032, 3.721932, 0.8431373, 0, 1, 1,
0.8503507, -0.01560888, 3.689914, 0.8470588, 0, 1, 1,
0.8538259, 0.2670312, 0.978133, 0.854902, 0, 1, 1,
0.8546993, -0.1260673, 0.9411085, 0.8588235, 0, 1, 1,
0.8643009, 0.02357437, 0.4446738, 0.8666667, 0, 1, 1,
0.864312, 0.7828054, 0.4882803, 0.8705882, 0, 1, 1,
0.8686098, 0.9721599, 1.392737, 0.8784314, 0, 1, 1,
0.871898, 0.6563291, -0.2377075, 0.8823529, 0, 1, 1,
0.8736711, -0.09373613, 1.353157, 0.8901961, 0, 1, 1,
0.8768829, 1.207017, 0.6778507, 0.8941177, 0, 1, 1,
0.8778369, -0.02404168, 1.477056, 0.9019608, 0, 1, 1,
0.8865855, 0.07110083, 2.553892, 0.9098039, 0, 1, 1,
0.88702, -0.384841, 1.168581, 0.9137255, 0, 1, 1,
0.9026802, 1.166605, -0.6299326, 0.9215686, 0, 1, 1,
0.9036462, -0.53105, 1.980113, 0.9254902, 0, 1, 1,
0.9041857, -0.9994358, 2.502029, 0.9333333, 0, 1, 1,
0.9108806, -1.060206, 2.289125, 0.9372549, 0, 1, 1,
0.9113333, -0.5825236, 3.14357, 0.945098, 0, 1, 1,
0.9153617, -0.2277486, 2.048959, 0.9490196, 0, 1, 1,
0.9302793, 0.1378119, 2.732705, 0.9568627, 0, 1, 1,
0.930692, -1.936096, 2.436518, 0.9607843, 0, 1, 1,
0.9364676, 0.9468156, 0.5798473, 0.9686275, 0, 1, 1,
0.9373313, -1.984119, 1.688643, 0.972549, 0, 1, 1,
0.9428831, 0.09417089, -0.6601581, 0.9803922, 0, 1, 1,
0.9437228, -0.8411772, 3.909431, 0.9843137, 0, 1, 1,
0.944555, -0.2966221, 1.324408, 0.9921569, 0, 1, 1,
0.9452292, -0.2722461, 3.110133, 0.9960784, 0, 1, 1,
0.9626516, 0.1907506, 2.400198, 1, 0, 0.9960784, 1,
0.9705088, 2.091883, 0.3936304, 1, 0, 0.9882353, 1,
0.9715866, -1.660094, 2.969949, 1, 0, 0.9843137, 1,
0.9816271, -2.225363, 3.429117, 1, 0, 0.9764706, 1,
0.9886168, -1.21226, 2.470277, 1, 0, 0.972549, 1,
0.9889831, -1.142713, 1.088102, 1, 0, 0.9647059, 1,
0.9910662, 0.4616725, 0.3976061, 1, 0, 0.9607843, 1,
0.9953406, -1.627726, 2.893304, 1, 0, 0.9529412, 1,
1.000232, -0.4548308, 1.146299, 1, 0, 0.9490196, 1,
1.004834, -0.6175492, 2.426696, 1, 0, 0.9411765, 1,
1.008063, 0.582477, 0.9357225, 1, 0, 0.9372549, 1,
1.009939, 1.164435, 1.377151, 1, 0, 0.9294118, 1,
1.015035, 1.183016, 1.90669, 1, 0, 0.9254902, 1,
1.017111, -0.4270111, 2.965003, 1, 0, 0.9176471, 1,
1.021448, -0.6310857, 0.8801448, 1, 0, 0.9137255, 1,
1.026619, 0.2722723, 1.413002, 1, 0, 0.9058824, 1,
1.039793, -0.1006038, 2.322553, 1, 0, 0.9019608, 1,
1.04575, 0.497216, 2.787359, 1, 0, 0.8941177, 1,
1.047554, -1.028615, 1.315841, 1, 0, 0.8862745, 1,
1.04889, -0.1941603, 1.577071, 1, 0, 0.8823529, 1,
1.051442, -0.2354928, 2.307637, 1, 0, 0.8745098, 1,
1.051997, -0.755975, 3.069324, 1, 0, 0.8705882, 1,
1.053269, -0.2567791, 1.661292, 1, 0, 0.8627451, 1,
1.058787, -0.3796726, 1.903418, 1, 0, 0.8588235, 1,
1.075778, 0.08521157, 1.674029, 1, 0, 0.8509804, 1,
1.081219, 0.3205768, 2.836686, 1, 0, 0.8470588, 1,
1.085459, -0.3256454, 1.385263, 1, 0, 0.8392157, 1,
1.091872, 0.5646104, 1.413449, 1, 0, 0.8352941, 1,
1.093571, -1.116729, 0.7716036, 1, 0, 0.827451, 1,
1.097984, -1.188768, 1.135022, 1, 0, 0.8235294, 1,
1.102574, -0.9683636, 2.908103, 1, 0, 0.8156863, 1,
1.108187, 1.111125, 1.342399, 1, 0, 0.8117647, 1,
1.109243, 0.6009179, 1.426227, 1, 0, 0.8039216, 1,
1.109807, 0.5723669, 3.606969, 1, 0, 0.7960784, 1,
1.109964, -0.3121327, 0.8833032, 1, 0, 0.7921569, 1,
1.111694, 0.1801771, 0.4738442, 1, 0, 0.7843137, 1,
1.115487, -1.341442, 2.196121, 1, 0, 0.7803922, 1,
1.119961, 0.4935576, 4.230879, 1, 0, 0.772549, 1,
1.120374, -0.1034051, 0.2816767, 1, 0, 0.7686275, 1,
1.121813, -1.768323, 2.025907, 1, 0, 0.7607843, 1,
1.12885, 1.679809, 0.06080678, 1, 0, 0.7568628, 1,
1.130853, -0.08039083, 2.712696, 1, 0, 0.7490196, 1,
1.134854, -0.1473867, 1.559561, 1, 0, 0.7450981, 1,
1.136464, -1.48865, 2.925181, 1, 0, 0.7372549, 1,
1.146537, 0.5175226, 0.2813919, 1, 0, 0.7333333, 1,
1.147527, 0.1092797, 0.9060308, 1, 0, 0.7254902, 1,
1.155166, 0.617817, 1.72196, 1, 0, 0.7215686, 1,
1.160403, -2.962179, 3.077014, 1, 0, 0.7137255, 1,
1.164153, -1.400669, 3.007119, 1, 0, 0.7098039, 1,
1.165639, 1.138335, 0.9463559, 1, 0, 0.7019608, 1,
1.168037, 0.8901873, 2.369104, 1, 0, 0.6941177, 1,
1.18596, 1.2403, -0.2151712, 1, 0, 0.6901961, 1,
1.190093, -1.019676, 1.617018, 1, 0, 0.682353, 1,
1.190514, -0.2874098, 0.6873664, 1, 0, 0.6784314, 1,
1.192476, -0.2227916, 4.164961, 1, 0, 0.6705883, 1,
1.202653, 0.3695285, 1.4864, 1, 0, 0.6666667, 1,
1.221589, 0.5304779, 1.855536, 1, 0, 0.6588235, 1,
1.249757, -1.861701, 2.658406, 1, 0, 0.654902, 1,
1.252165, -0.006042878, 2.348643, 1, 0, 0.6470588, 1,
1.253625, -2.666539, 2.157475, 1, 0, 0.6431373, 1,
1.258293, -0.2979177, 1.967891, 1, 0, 0.6352941, 1,
1.261531, 2.0075, -0.420042, 1, 0, 0.6313726, 1,
1.26614, -0.002431029, 0.0003956309, 1, 0, 0.6235294, 1,
1.266883, -0.09525178, 0.2574573, 1, 0, 0.6196079, 1,
1.27132, -0.2055476, 0.9672342, 1, 0, 0.6117647, 1,
1.277683, 0.8026077, -0.2699616, 1, 0, 0.6078432, 1,
1.283922, -0.5116397, 0.5567726, 1, 0, 0.6, 1,
1.286447, -0.5798792, 1.805488, 1, 0, 0.5921569, 1,
1.295763, -0.2217581, 2.019933, 1, 0, 0.5882353, 1,
1.32, 0.1474778, 1.786477, 1, 0, 0.5803922, 1,
1.32863, -0.009498135, -0.6090855, 1, 0, 0.5764706, 1,
1.337147, 0.6890082, 2.369924, 1, 0, 0.5686275, 1,
1.337515, 0.8481039, 1.999751, 1, 0, 0.5647059, 1,
1.33774, -1.789976, 3.015823, 1, 0, 0.5568628, 1,
1.340677, -2.530686, 3.287457, 1, 0, 0.5529412, 1,
1.342757, 0.7920218, 3.06261, 1, 0, 0.5450981, 1,
1.357091, 0.008763839, 1.868065, 1, 0, 0.5411765, 1,
1.35763, 1.171592, -0.7844306, 1, 0, 0.5333334, 1,
1.379581, -0.1685742, 1.884225, 1, 0, 0.5294118, 1,
1.390186, -0.2435762, 3.613082, 1, 0, 0.5215687, 1,
1.403178, -1.403023, 3.13258, 1, 0, 0.5176471, 1,
1.405088, 0.896468, 0.6561542, 1, 0, 0.509804, 1,
1.406445, 0.411558, 0.803458, 1, 0, 0.5058824, 1,
1.410844, -1.286329, 3.261809, 1, 0, 0.4980392, 1,
1.412408, 0.3862067, 2.032996, 1, 0, 0.4901961, 1,
1.424563, -0.9345077, 2.595112, 1, 0, 0.4862745, 1,
1.442577, 1.146505, 0.9192795, 1, 0, 0.4784314, 1,
1.444024, 0.5836552, 0.1855725, 1, 0, 0.4745098, 1,
1.445314, 0.1110602, 0.7725833, 1, 0, 0.4666667, 1,
1.453982, 0.1083511, 1.91114, 1, 0, 0.4627451, 1,
1.460935, 0.2293789, 1.080794, 1, 0, 0.454902, 1,
1.469937, -0.8705162, 3.208871, 1, 0, 0.4509804, 1,
1.470274, -0.02825701, 3.235716, 1, 0, 0.4431373, 1,
1.488571, 0.8173352, 1.298355, 1, 0, 0.4392157, 1,
1.491744, -0.2017527, 2.467269, 1, 0, 0.4313726, 1,
1.500934, -1.156607, 0.8254195, 1, 0, 0.427451, 1,
1.501114, 1.6177, 1.852649, 1, 0, 0.4196078, 1,
1.514638, 0.999748, 1.586213, 1, 0, 0.4156863, 1,
1.51537, 0.9510576, 0.9290428, 1, 0, 0.4078431, 1,
1.517216, 0.3768196, 2.458217, 1, 0, 0.4039216, 1,
1.519795, -0.6827753, 1.337039, 1, 0, 0.3960784, 1,
1.522947, 0.2498364, 2.116625, 1, 0, 0.3882353, 1,
1.532363, 1.022822, 3.552728, 1, 0, 0.3843137, 1,
1.538832, -1.254143, 2.362249, 1, 0, 0.3764706, 1,
1.544388, -1.264011, 2.705256, 1, 0, 0.372549, 1,
1.544549, -0.06439923, 1.510305, 1, 0, 0.3647059, 1,
1.548326, 0.3466282, 1.758471, 1, 0, 0.3607843, 1,
1.550206, -1.055917, 3.045257, 1, 0, 0.3529412, 1,
1.56836, 0.9570002, 1.028238, 1, 0, 0.3490196, 1,
1.571101, 0.9561967, 2.297027, 1, 0, 0.3411765, 1,
1.579173, -0.8404552, 1.887505, 1, 0, 0.3372549, 1,
1.580404, 0.7082331, 3.488244, 1, 0, 0.3294118, 1,
1.582445, 0.9953824, -1.347088, 1, 0, 0.3254902, 1,
1.584791, -0.6679561, 0.7638655, 1, 0, 0.3176471, 1,
1.601096, -1.07522, 1.974704, 1, 0, 0.3137255, 1,
1.610041, 0.4777307, 0.7841961, 1, 0, 0.3058824, 1,
1.611386, 0.1042006, 2.137788, 1, 0, 0.2980392, 1,
1.617827, 0.306741, 1.638665, 1, 0, 0.2941177, 1,
1.645197, 0.7010496, -1.042915, 1, 0, 0.2862745, 1,
1.651247, 0.029583, 0.005543641, 1, 0, 0.282353, 1,
1.655309, -0.819521, 3.160633, 1, 0, 0.2745098, 1,
1.669607, -0.9190071, 1.413841, 1, 0, 0.2705882, 1,
1.677288, 0.5740155, -0.008070556, 1, 0, 0.2627451, 1,
1.689165, 0.59089, 2.072075, 1, 0, 0.2588235, 1,
1.720053, -0.7414538, 2.111208, 1, 0, 0.2509804, 1,
1.726979, -1.216249, 2.931935, 1, 0, 0.2470588, 1,
1.734033, -0.6012341, 1.729138, 1, 0, 0.2392157, 1,
1.735636, -1.033175, 0.2010388, 1, 0, 0.2352941, 1,
1.75566, -0.9892585, 3.840768, 1, 0, 0.227451, 1,
1.76242, 0.2588345, 0.9006807, 1, 0, 0.2235294, 1,
1.77911, -0.8446961, 0.7950878, 1, 0, 0.2156863, 1,
1.783773, -0.2060585, 3.705082, 1, 0, 0.2117647, 1,
1.787449, -0.2501892, 2.335119, 1, 0, 0.2039216, 1,
1.790321, -0.2323196, 2.533072, 1, 0, 0.1960784, 1,
1.802667, 1.434581, 0.8220527, 1, 0, 0.1921569, 1,
1.824095, 0.05543217, 1.54332, 1, 0, 0.1843137, 1,
1.85364, 1.607583, 0.8551431, 1, 0, 0.1803922, 1,
1.857635, 1.078213, 0.2757211, 1, 0, 0.172549, 1,
1.860854, -0.3869154, 1.157556, 1, 0, 0.1686275, 1,
1.875344, 1.946097, 1.623989, 1, 0, 0.1607843, 1,
1.884658, -0.8734836, 1.262365, 1, 0, 0.1568628, 1,
1.89375, 0.1590863, 2.424907, 1, 0, 0.1490196, 1,
1.90152, 0.9128661, 0.8057817, 1, 0, 0.145098, 1,
1.907881, 2.073917, 1.680631, 1, 0, 0.1372549, 1,
1.919619, -0.5815548, 0.009387011, 1, 0, 0.1333333, 1,
1.934857, 2.227296, 0.9751052, 1, 0, 0.1254902, 1,
1.957544, -1.129686, 1.921995, 1, 0, 0.1215686, 1,
1.962114, 0.9679399, 1.446935, 1, 0, 0.1137255, 1,
1.96883, 0.4192779, 1.157871, 1, 0, 0.1098039, 1,
1.972751, -0.01646214, 1.153332, 1, 0, 0.1019608, 1,
1.98138, -0.7925761, 2.1574, 1, 0, 0.09411765, 1,
2.029114, -1.285065, 3.365977, 1, 0, 0.09019608, 1,
2.032053, 1.098546, 2.424812, 1, 0, 0.08235294, 1,
2.035753, -0.5813724, 1.445541, 1, 0, 0.07843138, 1,
2.125836, -0.6771285, 1.37682, 1, 0, 0.07058824, 1,
2.325246, 0.5874931, 1.850545, 1, 0, 0.06666667, 1,
2.332194, 0.0224929, 1.96664, 1, 0, 0.05882353, 1,
2.374763, 0.1002431, 0.02841664, 1, 0, 0.05490196, 1,
2.41292, 1.0885, 0.4308257, 1, 0, 0.04705882, 1,
2.536852, 0.1482477, 1.379416, 1, 0, 0.04313726, 1,
2.638725, -0.069185, 1.244401, 1, 0, 0.03529412, 1,
2.730183, -0.4823233, 2.351997, 1, 0, 0.03137255, 1,
2.76322, -0.4048693, 2.332572, 1, 0, 0.02352941, 1,
3.040889, -0.1681749, 3.938407, 1, 0, 0.01960784, 1,
3.087042, -0.07096907, 2.67416, 1, 0, 0.01176471, 1,
3.414119, -0.3919211, 1.85282, 1, 0, 0.007843138, 1
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
0.2732526, -4.02262, -7.36394, 0, -0.5, 0.5, 0.5,
0.2732526, -4.02262, -7.36394, 1, -0.5, 0.5, 0.5,
0.2732526, -4.02262, -7.36394, 1, 1.5, 0.5, 0.5,
0.2732526, -4.02262, -7.36394, 0, 1.5, 0.5, 0.5
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
-3.932367, -0.107193, -7.36394, 0, -0.5, 0.5, 0.5,
-3.932367, -0.107193, -7.36394, 1, -0.5, 0.5, 0.5,
-3.932367, -0.107193, -7.36394, 1, 1.5, 0.5, 0.5,
-3.932367, -0.107193, -7.36394, 0, 1.5, 0.5, 0.5
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
-3.932367, -4.02262, -0.2689202, 0, -0.5, 0.5, 0.5,
-3.932367, -4.02262, -0.2689202, 1, -0.5, 0.5, 0.5,
-3.932367, -4.02262, -0.2689202, 1, 1.5, 0.5, 0.5,
-3.932367, -4.02262, -0.2689202, 0, 1.5, 0.5, 0.5
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
-2, -3.11906, -5.726627,
3, -3.11906, -5.726627,
-2, -3.11906, -5.726627,
-2, -3.269653, -5.999513,
-1, -3.11906, -5.726627,
-1, -3.269653, -5.999513,
0, -3.11906, -5.726627,
0, -3.269653, -5.999513,
1, -3.11906, -5.726627,
1, -3.269653, -5.999513,
2, -3.11906, -5.726627,
2, -3.269653, -5.999513,
3, -3.11906, -5.726627,
3, -3.269653, -5.999513
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
-2, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
-2, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
-2, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
-2, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5,
-1, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
-1, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
-1, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
-1, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5,
0, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
0, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
0, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
0, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5,
1, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
1, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
1, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
1, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5,
2, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
2, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
2, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
2, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5,
3, -3.57084, -6.545283, 0, -0.5, 0.5, 0.5,
3, -3.57084, -6.545283, 1, -0.5, 0.5, 0.5,
3, -3.57084, -6.545283, 1, 1.5, 0.5, 0.5,
3, -3.57084, -6.545283, 0, 1.5, 0.5, 0.5
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
-2.961839, -3, -5.726627,
-2.961839, 2, -5.726627,
-2.961839, -3, -5.726627,
-3.123594, -3, -5.999513,
-2.961839, -2, -5.726627,
-3.123594, -2, -5.999513,
-2.961839, -1, -5.726627,
-3.123594, -1, -5.999513,
-2.961839, 0, -5.726627,
-3.123594, 0, -5.999513,
-2.961839, 1, -5.726627,
-3.123594, 1, -5.999513,
-2.961839, 2, -5.726627,
-3.123594, 2, -5.999513
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
-3.447103, -3, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, -3, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, -3, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, -3, -6.545283, 0, 1.5, 0.5, 0.5,
-3.447103, -2, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, -2, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, -2, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, -2, -6.545283, 0, 1.5, 0.5, 0.5,
-3.447103, -1, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, -1, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, -1, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, -1, -6.545283, 0, 1.5, 0.5, 0.5,
-3.447103, 0, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, 0, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, 0, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, 0, -6.545283, 0, 1.5, 0.5, 0.5,
-3.447103, 1, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, 1, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, 1, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, 1, -6.545283, 0, 1.5, 0.5, 0.5,
-3.447103, 2, -6.545283, 0, -0.5, 0.5, 0.5,
-3.447103, 2, -6.545283, 1, -0.5, 0.5, 0.5,
-3.447103, 2, -6.545283, 1, 1.5, 0.5, 0.5,
-3.447103, 2, -6.545283, 0, 1.5, 0.5, 0.5
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
-2.961839, -3.11906, -4,
-2.961839, -3.11906, 4,
-2.961839, -3.11906, -4,
-3.123594, -3.269653, -4,
-2.961839, -3.11906, -2,
-3.123594, -3.269653, -2,
-2.961839, -3.11906, 0,
-3.123594, -3.269653, 0,
-2.961839, -3.11906, 2,
-3.123594, -3.269653, 2,
-2.961839, -3.11906, 4,
-3.123594, -3.269653, 4
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
-3.447103, -3.57084, -4, 0, -0.5, 0.5, 0.5,
-3.447103, -3.57084, -4, 1, -0.5, 0.5, 0.5,
-3.447103, -3.57084, -4, 1, 1.5, 0.5, 0.5,
-3.447103, -3.57084, -4, 0, 1.5, 0.5, 0.5,
-3.447103, -3.57084, -2, 0, -0.5, 0.5, 0.5,
-3.447103, -3.57084, -2, 1, -0.5, 0.5, 0.5,
-3.447103, -3.57084, -2, 1, 1.5, 0.5, 0.5,
-3.447103, -3.57084, -2, 0, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 0, 0, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 0, 1, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 0, 1, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 0, 0, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 2, 0, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 2, 1, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 2, 1, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 2, 0, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 4, 0, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 4, 1, -0.5, 0.5, 0.5,
-3.447103, -3.57084, 4, 1, 1.5, 0.5, 0.5,
-3.447103, -3.57084, 4, 0, 1.5, 0.5, 0.5
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
-2.961839, -3.11906, -5.726627,
-2.961839, 2.904674, -5.726627,
-2.961839, -3.11906, 5.188787,
-2.961839, 2.904674, 5.188787,
-2.961839, -3.11906, -5.726627,
-2.961839, -3.11906, 5.188787,
-2.961839, 2.904674, -5.726627,
-2.961839, 2.904674, 5.188787,
-2.961839, -3.11906, -5.726627,
3.508345, -3.11906, -5.726627,
-2.961839, -3.11906, 5.188787,
3.508345, -3.11906, 5.188787,
-2.961839, 2.904674, -5.726627,
3.508345, 2.904674, -5.726627,
-2.961839, 2.904674, 5.188787,
3.508345, 2.904674, 5.188787,
3.508345, -3.11906, -5.726627,
3.508345, 2.904674, -5.726627,
3.508345, -3.11906, 5.188787,
3.508345, 2.904674, 5.188787,
3.508345, -3.11906, -5.726627,
3.508345, -3.11906, 5.188787,
3.508345, 2.904674, -5.726627,
3.508345, 2.904674, 5.188787
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
var radius = 7.500383;
var distance = 33.37005;
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
mvMatrix.translate( -0.2732526, 0.107193, 0.2689202 );
mvMatrix.scale( 1.253374, 1.346268, 0.7429457 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.37005);
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
princep<-read.table("princep.xyz")
```

```
## Error in read.table("princep.xyz"): no lines available in input
```

```r
x<-princep$V2
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
y<-princep$V3
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
```

```r
z<-princep$V4
```

```
## Error in eval(expr, envir, enclos): object 'princep' not found
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
-2.867614, -1.098605, -0.5023977, 0, 0, 1, 1, 1,
-2.792941, -0.8602214, -0.2394355, 1, 0, 0, 1, 1,
-2.495571, 0.4980902, -3.229498, 1, 0, 0, 1, 1,
-2.447287, -1.145812, -1.756096, 1, 0, 0, 1, 1,
-2.422503, 0.1268434, 0.2564286, 1, 0, 0, 1, 1,
-2.35587, -0.6266161, -1.679663, 1, 0, 0, 1, 1,
-2.310243, -1.569855, -4.052359, 0, 0, 0, 1, 1,
-2.263018, -0.05319262, -0.7365922, 0, 0, 0, 1, 1,
-2.255511, -1.745937, -3.090852, 0, 0, 0, 1, 1,
-2.236156, -0.3316845, 0.7510258, 0, 0, 0, 1, 1,
-2.203755, 0.3646585, -0.2842503, 0, 0, 0, 1, 1,
-2.168759, 0.7198655, -1.926293, 0, 0, 0, 1, 1,
-2.137533, -1.191669, -0.5681832, 0, 0, 0, 1, 1,
-2.085945, 0.3527318, -2.253263, 1, 1, 1, 1, 1,
-2.065883, -1.219161, -2.275332, 1, 1, 1, 1, 1,
-2.038246, -0.4750532, -2.289648, 1, 1, 1, 1, 1,
-2.005458, -1.198887, -2.241625, 1, 1, 1, 1, 1,
-2.002139, 0.1439965, -0.9231387, 1, 1, 1, 1, 1,
-1.999073, -0.8601438, -3.252, 1, 1, 1, 1, 1,
-1.982181, -0.06038259, -1.296179, 1, 1, 1, 1, 1,
-1.976347, -0.3205746, -0.7775904, 1, 1, 1, 1, 1,
-1.951384, -0.6093525, -1.519914, 1, 1, 1, 1, 1,
-1.929433, -0.6718882, -1.062789, 1, 1, 1, 1, 1,
-1.912574, 2.525864, -1.065798, 1, 1, 1, 1, 1,
-1.900027, -0.4246596, -1.905089, 1, 1, 1, 1, 1,
-1.880803, 1.028862, -1.766077, 1, 1, 1, 1, 1,
-1.877604, 0.7686097, -2.400682, 1, 1, 1, 1, 1,
-1.875849, -0.3611532, -2.228123, 1, 1, 1, 1, 1,
-1.856831, -0.6643019, -1.929442, 0, 0, 1, 1, 1,
-1.855684, 0.4919193, -0.924526, 1, 0, 0, 1, 1,
-1.851148, -1.251363, -2.007003, 1, 0, 0, 1, 1,
-1.842158, -0.7068691, -1.271028, 1, 0, 0, 1, 1,
-1.838413, -1.706902, -1.897305, 1, 0, 0, 1, 1,
-1.816718, 0.332544, -2.416937, 1, 0, 0, 1, 1,
-1.801102, -1.572162, -2.391827, 0, 0, 0, 1, 1,
-1.795938, 0.01548743, 0.03279037, 0, 0, 0, 1, 1,
-1.785272, 0.8077058, 0.533898, 0, 0, 0, 1, 1,
-1.773696, -1.066405, -4.103717, 0, 0, 0, 1, 1,
-1.76085, 1.349829, -0.6171383, 0, 0, 0, 1, 1,
-1.739814, 0.08216682, -0.9224868, 0, 0, 0, 1, 1,
-1.736074, 0.18454, -2.083111, 0, 0, 0, 1, 1,
-1.705709, 1.226057, -1.133339, 1, 1, 1, 1, 1,
-1.704314, 1.085938, -2.510835, 1, 1, 1, 1, 1,
-1.703815, 0.2684421, -1.836907, 1, 1, 1, 1, 1,
-1.688797, -0.5590999, -2.548536, 1, 1, 1, 1, 1,
-1.67511, 0.7324043, -1.028982, 1, 1, 1, 1, 1,
-1.669673, -0.09392997, -0.774444, 1, 1, 1, 1, 1,
-1.653326, 0.8775331, -0.1243599, 1, 1, 1, 1, 1,
-1.641628, -0.7428799, -1.641963, 1, 1, 1, 1, 1,
-1.639601, 0.4641567, -1.060066, 1, 1, 1, 1, 1,
-1.637829, -0.5780976, -2.373834, 1, 1, 1, 1, 1,
-1.637582, -0.3504137, -2.514466, 1, 1, 1, 1, 1,
-1.634378, 0.8530074, -0.8745222, 1, 1, 1, 1, 1,
-1.621287, 0.1483108, -2.665583, 1, 1, 1, 1, 1,
-1.61928, -0.277413, -1.968562, 1, 1, 1, 1, 1,
-1.608713, 0.5282366, -1.330221, 1, 1, 1, 1, 1,
-1.607953, 0.4423025, -2.269893, 0, 0, 1, 1, 1,
-1.602045, -0.6232323, -1.021246, 1, 0, 0, 1, 1,
-1.588508, -0.8165125, -1.537048, 1, 0, 0, 1, 1,
-1.553443, -0.3357673, -2.499249, 1, 0, 0, 1, 1,
-1.552882, 0.03411065, -0.06733074, 1, 0, 0, 1, 1,
-1.526779, 0.3028717, -0.6146749, 1, 0, 0, 1, 1,
-1.501607, -0.4620151, -1.182835, 0, 0, 0, 1, 1,
-1.487036, -1.836222, -1.397216, 0, 0, 0, 1, 1,
-1.482471, 0.2344049, -0.1814991, 0, 0, 0, 1, 1,
-1.481882, 1.203858, -1.510352, 0, 0, 0, 1, 1,
-1.479631, 0.5857793, -0.681442, 0, 0, 0, 1, 1,
-1.470858, 0.669593, -0.823086, 0, 0, 0, 1, 1,
-1.462466, 0.6875228, -1.016117, 0, 0, 0, 1, 1,
-1.455428, -0.315937, -1.860128, 1, 1, 1, 1, 1,
-1.446228, 0.1000422, -2.11999, 1, 1, 1, 1, 1,
-1.444223, 0.06744573, -1.460295, 1, 1, 1, 1, 1,
-1.43122, -0.5367743, -2.315489, 1, 1, 1, 1, 1,
-1.430495, 1.251453, -1.316087, 1, 1, 1, 1, 1,
-1.41415, 0.6842763, -0.403338, 1, 1, 1, 1, 1,
-1.408869, -1.448476, -2.266589, 1, 1, 1, 1, 1,
-1.401354, -0.2649125, -1.567751, 1, 1, 1, 1, 1,
-1.396762, 0.01473576, -0.2545645, 1, 1, 1, 1, 1,
-1.391811, -0.4372334, -2.332107, 1, 1, 1, 1, 1,
-1.391067, -1.719124, -2.980486, 1, 1, 1, 1, 1,
-1.391026, 1.007908, -2.146913, 1, 1, 1, 1, 1,
-1.387272, -0.564985, -3.18959, 1, 1, 1, 1, 1,
-1.37716, 0.5839661, -0.6946999, 1, 1, 1, 1, 1,
-1.37207, -0.3369551, -1.38928, 1, 1, 1, 1, 1,
-1.371077, -0.5540839, -1.832159, 0, 0, 1, 1, 1,
-1.363646, -1.197522, -1.535696, 1, 0, 0, 1, 1,
-1.34893, 0.2505848, -0.0568747, 1, 0, 0, 1, 1,
-1.347653, -0.4100387, -2.310081, 1, 0, 0, 1, 1,
-1.338898, -0.6448404, -2.232369, 1, 0, 0, 1, 1,
-1.330357, -0.6602437, -2.24486, 1, 0, 0, 1, 1,
-1.329857, 0.1888211, 0.3268558, 0, 0, 0, 1, 1,
-1.322755, 0.6338532, -1.35284, 0, 0, 0, 1, 1,
-1.313677, -1.16804, -1.709287, 0, 0, 0, 1, 1,
-1.306705, 0.2672856, -2.051871, 0, 0, 0, 1, 1,
-1.295774, 0.8999846, -2.143954, 0, 0, 0, 1, 1,
-1.287967, 0.1669164, -1.588529, 0, 0, 0, 1, 1,
-1.280117, -1.113269, -3.804141, 0, 0, 0, 1, 1,
-1.27582, 0.0733554, -1.78935, 1, 1, 1, 1, 1,
-1.25776, -0.3169087, -0.6558858, 1, 1, 1, 1, 1,
-1.24863, -0.3010964, -3.019925, 1, 1, 1, 1, 1,
-1.246968, -2.486265, -4.455547, 1, 1, 1, 1, 1,
-1.245886, 1.061098, 0.132058, 1, 1, 1, 1, 1,
-1.240859, 1.349808, -2.144959, 1, 1, 1, 1, 1,
-1.240056, -0.03141395, -2.432933, 1, 1, 1, 1, 1,
-1.239889, 0.7215638, -2.684061, 1, 1, 1, 1, 1,
-1.230644, 0.6690741, -1.256236, 1, 1, 1, 1, 1,
-1.213454, 0.1882595, -2.099389, 1, 1, 1, 1, 1,
-1.210671, -1.134754, -0.8236297, 1, 1, 1, 1, 1,
-1.205001, -0.5870758, -1.580999, 1, 1, 1, 1, 1,
-1.193416, -0.3086018, -1.406003, 1, 1, 1, 1, 1,
-1.189248, 0.2624929, -3.513129, 1, 1, 1, 1, 1,
-1.180894, -0.6393754, -3.267705, 1, 1, 1, 1, 1,
-1.180053, -1.679921, -3.99435, 0, 0, 1, 1, 1,
-1.177403, -1.101103, -3.630694, 1, 0, 0, 1, 1,
-1.17456, 0.7811857, -0.1125762, 1, 0, 0, 1, 1,
-1.172206, 0.860253, -0.3997729, 1, 0, 0, 1, 1,
-1.169135, -0.8451654, -1.991473, 1, 0, 0, 1, 1,
-1.167628, -1.319838, -2.945661, 1, 0, 0, 1, 1,
-1.164258, 0.7276384, -0.5263112, 0, 0, 0, 1, 1,
-1.157737, -1.070102, -4.120348, 0, 0, 0, 1, 1,
-1.152672, -0.05838227, 0.550312, 0, 0, 0, 1, 1,
-1.147199, -1.682785, -4.451959, 0, 0, 0, 1, 1,
-1.133188, 0.8896411, -1.596925, 0, 0, 0, 1, 1,
-1.129027, 1.227753, 1.352764, 0, 0, 0, 1, 1,
-1.128016, 0.1524143, -2.180438, 0, 0, 0, 1, 1,
-1.124712, -1.003068, 0.03254152, 1, 1, 1, 1, 1,
-1.121331, -0.4530722, -1.348026, 1, 1, 1, 1, 1,
-1.110442, 0.2291181, -1.671953, 1, 1, 1, 1, 1,
-1.109965, -1.878599, -1.69495, 1, 1, 1, 1, 1,
-1.109339, 0.9151359, -1.596792, 1, 1, 1, 1, 1,
-1.105612, 0.02519543, -0.7705275, 1, 1, 1, 1, 1,
-1.105118, -0.04210365, -1.476162, 1, 1, 1, 1, 1,
-1.087225, -0.2359476, -1.055969, 1, 1, 1, 1, 1,
-1.084778, 1.223376, -1.456599, 1, 1, 1, 1, 1,
-1.073636, 1.184085, -0.6420699, 1, 1, 1, 1, 1,
-1.069219, -0.5104374, -2.67305, 1, 1, 1, 1, 1,
-1.062522, -0.01200337, -1.306163, 1, 1, 1, 1, 1,
-1.057801, 0.6801705, -0.6400229, 1, 1, 1, 1, 1,
-1.054896, -1.079992, -2.290214, 1, 1, 1, 1, 1,
-1.046185, 0.8388385, -0.2998406, 1, 1, 1, 1, 1,
-1.040273, -1.090076, -1.470952, 0, 0, 1, 1, 1,
-1.037879, 0.9264696, -0.1800958, 1, 0, 0, 1, 1,
-1.034101, -0.2490481, -0.3414075, 1, 0, 0, 1, 1,
-1.026256, 1.663104, -1.440412, 1, 0, 0, 1, 1,
-1.021744, 0.6675835, -1.870578, 1, 0, 0, 1, 1,
-1.020401, -0.2668335, -1.645455, 1, 0, 0, 1, 1,
-1.015615, 0.05342676, -1.850562, 0, 0, 0, 1, 1,
-0.9927869, -0.1576753, -2.434164, 0, 0, 0, 1, 1,
-0.9865276, -0.1173082, -0.6004062, 0, 0, 0, 1, 1,
-0.9858413, 1.273494, -1.952715, 0, 0, 0, 1, 1,
-0.9840925, 0.3684379, -0.774958, 0, 0, 0, 1, 1,
-0.9790025, -0.9677703, -2.678031, 0, 0, 0, 1, 1,
-0.9786747, -1.983067, -2.404247, 0, 0, 0, 1, 1,
-0.9543059, 0.9517584, 0.07929998, 1, 1, 1, 1, 1,
-0.9513735, 1.270029, 0.3317036, 1, 1, 1, 1, 1,
-0.9502326, 1.177008, -1.141645, 1, 1, 1, 1, 1,
-0.9494603, 0.1164465, -2.128083, 1, 1, 1, 1, 1,
-0.9462916, -0.9780367, -3.210298, 1, 1, 1, 1, 1,
-0.9459874, 0.9906613, -1.678192, 1, 1, 1, 1, 1,
-0.9434116, 1.15636, 0.1740259, 1, 1, 1, 1, 1,
-0.9403356, -0.5143104, -0.8195373, 1, 1, 1, 1, 1,
-0.9358165, -1.465655, -2.263464, 1, 1, 1, 1, 1,
-0.9218014, -1.943362, -4.081763, 1, 1, 1, 1, 1,
-0.9197153, -0.1492529, -0.9761915, 1, 1, 1, 1, 1,
-0.9180762, -0.6110486, -1.935843, 1, 1, 1, 1, 1,
-0.9012427, -0.8216013, -0.7693235, 1, 1, 1, 1, 1,
-0.895142, -0.1329193, -3.400743, 1, 1, 1, 1, 1,
-0.8910943, 0.7473348, -2.132115, 1, 1, 1, 1, 1,
-0.8890597, -1.396031, -1.421434, 0, 0, 1, 1, 1,
-0.8888424, -0.6403422, -3.1433, 1, 0, 0, 1, 1,
-0.871626, 0.7219378, -1.916057, 1, 0, 0, 1, 1,
-0.871619, -0.3419286, -1.78738, 1, 0, 0, 1, 1,
-0.8713224, 0.2433532, -0.9736004, 1, 0, 0, 1, 1,
-0.868602, 0.5781637, 0.3349968, 1, 0, 0, 1, 1,
-0.8677955, 0.1146728, -1.015338, 0, 0, 0, 1, 1,
-0.8671217, -0.87125, -0.8182937, 0, 0, 0, 1, 1,
-0.8670832, -0.133139, -2.539809, 0, 0, 0, 1, 1,
-0.8667258, 1.397786, -1.59517, 0, 0, 0, 1, 1,
-0.8604975, -0.7573866, -0.8436978, 0, 0, 0, 1, 1,
-0.8584522, 0.03873549, -3.457514, 0, 0, 0, 1, 1,
-0.8565339, 0.6366305, -1.895882, 0, 0, 0, 1, 1,
-0.8483751, 1.610047, -0.145627, 1, 1, 1, 1, 1,
-0.8468547, -0.1452357, -2.198475, 1, 1, 1, 1, 1,
-0.8450302, 1.665673, -0.2800659, 1, 1, 1, 1, 1,
-0.8414803, -1.328125, -3.25158, 1, 1, 1, 1, 1,
-0.8354862, 0.01284367, -1.620181, 1, 1, 1, 1, 1,
-0.8344344, 0.1340543, 0.2182898, 1, 1, 1, 1, 1,
-0.8313521, 1.159435, -0.2203348, 1, 1, 1, 1, 1,
-0.8304204, 0.1275892, -1.902366, 1, 1, 1, 1, 1,
-0.829609, -0.5534215, -1.953441, 1, 1, 1, 1, 1,
-0.818205, -0.9435905, -5.1551, 1, 1, 1, 1, 1,
-0.810417, 1.384614, -1.407972, 1, 1, 1, 1, 1,
-0.8084145, 1.286692, 0.1838987, 1, 1, 1, 1, 1,
-0.8047054, 1.193845, -0.6816621, 1, 1, 1, 1, 1,
-0.8031328, -0.4254714, -2.816602, 1, 1, 1, 1, 1,
-0.7993138, 0.7484425, 0.4716622, 1, 1, 1, 1, 1,
-0.7975422, -0.4141359, -1.93791, 0, 0, 1, 1, 1,
-0.7946994, 1.621088, -1.347607, 1, 0, 0, 1, 1,
-0.7937716, 0.7331132, -1.01226, 1, 0, 0, 1, 1,
-0.7927203, -0.2842561, -1.068748, 1, 0, 0, 1, 1,
-0.7917315, -1.490517, -2.631002, 1, 0, 0, 1, 1,
-0.7895164, -0.2773605, -1.58, 1, 0, 0, 1, 1,
-0.7881245, -0.6673053, 0.1785463, 0, 0, 0, 1, 1,
-0.7794667, -0.2161446, -1.071607, 0, 0, 0, 1, 1,
-0.7770741, 1.572618, -0.7542586, 0, 0, 0, 1, 1,
-0.7685916, 0.3910867, -0.90554, 0, 0, 0, 1, 1,
-0.7670041, 0.8645477, -0.8807141, 0, 0, 0, 1, 1,
-0.7651898, 0.5396866, -1.08294, 0, 0, 0, 1, 1,
-0.7618567, -1.848377, -2.814902, 0, 0, 0, 1, 1,
-0.7609105, -0.04061214, -1.879877, 1, 1, 1, 1, 1,
-0.7491763, 1.955746, -0.379714, 1, 1, 1, 1, 1,
-0.7433736, -0.2581087, -2.629653, 1, 1, 1, 1, 1,
-0.7407917, -0.5634633, -0.808133, 1, 1, 1, 1, 1,
-0.7319604, -0.9475536, -0.4979468, 1, 1, 1, 1, 1,
-0.7293434, -0.07732816, -1.745789, 1, 1, 1, 1, 1,
-0.7281149, 0.7356579, -0.7398815, 1, 1, 1, 1, 1,
-0.7272351, 0.7945039, -1.973781, 1, 1, 1, 1, 1,
-0.7244511, 0.5310203, -0.2244884, 1, 1, 1, 1, 1,
-0.7226427, 0.561063, -1.562105, 1, 1, 1, 1, 1,
-0.72101, -1.796261, -4.021768, 1, 1, 1, 1, 1,
-0.718448, 0.7744712, -0.6736246, 1, 1, 1, 1, 1,
-0.7149662, -0.5564787, -1.527908, 1, 1, 1, 1, 1,
-0.7140955, 1.302118, 1.064916, 1, 1, 1, 1, 1,
-0.7137373, -1.542302, -4.185796, 1, 1, 1, 1, 1,
-0.7112628, -1.908128, -3.491001, 0, 0, 1, 1, 1,
-0.7091483, 0.3537846, -0.5944963, 1, 0, 0, 1, 1,
-0.7052681, 0.06035257, -0.7187647, 1, 0, 0, 1, 1,
-0.7023608, -1.755687, -2.054801, 1, 0, 0, 1, 1,
-0.6972536, -0.1094499, -2.189778, 1, 0, 0, 1, 1,
-0.6961069, -1.462428, -2.444786, 1, 0, 0, 1, 1,
-0.6960496, 0.4920996, -2.788271, 0, 0, 0, 1, 1,
-0.6940042, 0.2452167, -1.296176, 0, 0, 0, 1, 1,
-0.6923597, 1.108654, -1.427039, 0, 0, 0, 1, 1,
-0.6841196, -2.015707, -1.437381, 0, 0, 0, 1, 1,
-0.6837816, 0.6245794, -0.4144903, 0, 0, 0, 1, 1,
-0.6781863, 0.5313084, 0.8333296, 0, 0, 0, 1, 1,
-0.6685011, 1.097416, -0.4888088, 0, 0, 0, 1, 1,
-0.6674821, -0.8408046, -1.447077, 1, 1, 1, 1, 1,
-0.6651953, -0.88889, -2.035042, 1, 1, 1, 1, 1,
-0.6632222, -0.7933295, -2.814115, 1, 1, 1, 1, 1,
-0.6619431, -0.6772013, -3.427388, 1, 1, 1, 1, 1,
-0.6607429, -1.008677, -1.72202, 1, 1, 1, 1, 1,
-0.6603225, 1.312993, -1.222195, 1, 1, 1, 1, 1,
-0.6511637, -1.538106, -0.6631179, 1, 1, 1, 1, 1,
-0.6490184, -0.751011, -2.897828, 1, 1, 1, 1, 1,
-0.6472556, -0.8603627, -1.738276, 1, 1, 1, 1, 1,
-0.6404564, 1.181105, -1.362387, 1, 1, 1, 1, 1,
-0.6378905, -0.1471666, -2.627733, 1, 1, 1, 1, 1,
-0.6310776, -0.4323517, -0.2270569, 1, 1, 1, 1, 1,
-0.6278015, -1.300039, -3.093553, 1, 1, 1, 1, 1,
-0.6243524, 0.6951571, -0.9660201, 1, 1, 1, 1, 1,
-0.6226547, 0.6925382, -2.2226, 1, 1, 1, 1, 1,
-0.6219133, 0.7364255, -0.04475204, 0, 0, 1, 1, 1,
-0.6168161, -0.2694126, -2.22305, 1, 0, 0, 1, 1,
-0.616668, 0.9547022, 0.5730995, 1, 0, 0, 1, 1,
-0.6143032, 0.4146599, -1.504225, 1, 0, 0, 1, 1,
-0.614167, -1.13688, -2.064777, 1, 0, 0, 1, 1,
-0.6109037, 0.2255201, -1.064255, 1, 0, 0, 1, 1,
-0.6081223, -0.1389863, -1.187269, 0, 0, 0, 1, 1,
-0.6037544, -0.1616392, -1.527226, 0, 0, 0, 1, 1,
-0.6037269, 0.7771354, -1.550955, 0, 0, 0, 1, 1,
-0.601435, -0.1808095, -2.992696, 0, 0, 0, 1, 1,
-0.601059, 1.365555, -0.2770929, 0, 0, 0, 1, 1,
-0.6008269, -0.4169143, -1.376194, 0, 0, 0, 1, 1,
-0.5921726, 0.6932433, -0.9709557, 0, 0, 0, 1, 1,
-0.5900378, 0.6528243, 1.509069, 1, 1, 1, 1, 1,
-0.5882076, 0.8716896, -0.2477408, 1, 1, 1, 1, 1,
-0.5856694, -0.02877908, -0.2208546, 1, 1, 1, 1, 1,
-0.5833657, 0.004232118, -2.270754, 1, 1, 1, 1, 1,
-0.5819243, 0.4850252, -3.398243, 1, 1, 1, 1, 1,
-0.5816007, -0.1209842, -3.595558, 1, 1, 1, 1, 1,
-0.5781684, 0.0595613, -1.18436, 1, 1, 1, 1, 1,
-0.5754269, 1.367071, -0.3031758, 1, 1, 1, 1, 1,
-0.5680999, 0.6557005, -0.3818423, 1, 1, 1, 1, 1,
-0.5672555, -0.09181317, -1.636829, 1, 1, 1, 1, 1,
-0.5662661, 1.358486, 1.130023, 1, 1, 1, 1, 1,
-0.5656272, -0.05001127, -2.077309, 1, 1, 1, 1, 1,
-0.5652351, -0.05823626, -1.935755, 1, 1, 1, 1, 1,
-0.5469694, -1.592239, -1.763868, 1, 1, 1, 1, 1,
-0.5441768, 1.134366, 1.590718, 1, 1, 1, 1, 1,
-0.5399272, 0.1508489, -2.418068, 0, 0, 1, 1, 1,
-0.5393347, -0.08435845, -1.57834, 1, 0, 0, 1, 1,
-0.5326171, -1.094892, -4.397019, 1, 0, 0, 1, 1,
-0.5288677, -1.339951, -3.32455, 1, 0, 0, 1, 1,
-0.5264066, 1.155407, -0.08239076, 1, 0, 0, 1, 1,
-0.5263366, -0.9293919, -1.780944, 1, 0, 0, 1, 1,
-0.525694, -1.121608, -4.048056, 0, 0, 0, 1, 1,
-0.5108215, -0.9674065, -5.485601, 0, 0, 0, 1, 1,
-0.5052059, -0.3942045, -3.081717, 0, 0, 0, 1, 1,
-0.5050032, -0.6307237, -4.975457, 0, 0, 0, 1, 1,
-0.5034472, -0.0197433, -2.135368, 0, 0, 0, 1, 1,
-0.5030614, -0.4734302, -0.7486, 0, 0, 0, 1, 1,
-0.5010993, 1.774884, -0.7587358, 0, 0, 0, 1, 1,
-0.499963, 0.3387919, -1.631472, 1, 1, 1, 1, 1,
-0.497438, 0.9929767, -1.80344, 1, 1, 1, 1, 1,
-0.4963713, 0.04422728, -1.738459, 1, 1, 1, 1, 1,
-0.4954492, -0.4807381, -3.596187, 1, 1, 1, 1, 1,
-0.49331, -0.7607787, -0.5474743, 1, 1, 1, 1, 1,
-0.4916416, -0.07902245, -2.208275, 1, 1, 1, 1, 1,
-0.4916109, -1.072262, -4.315802, 1, 1, 1, 1, 1,
-0.490782, -0.2760904, -1.719197, 1, 1, 1, 1, 1,
-0.48559, 0.3611078, -1.837041, 1, 1, 1, 1, 1,
-0.4855611, 1.211898, -0.8732661, 1, 1, 1, 1, 1,
-0.4768007, 1.393011, 0.7563852, 1, 1, 1, 1, 1,
-0.4755967, 0.5493902, -1.184034, 1, 1, 1, 1, 1,
-0.4754429, -0.09660304, -1.992695, 1, 1, 1, 1, 1,
-0.4753402, 0.6271971, -1.045369, 1, 1, 1, 1, 1,
-0.4735536, 0.3224445, 1.0276, 1, 1, 1, 1, 1,
-0.4652629, -0.6670989, -3.696447, 0, 0, 1, 1, 1,
-0.4639654, 1.588916, -1.02456, 1, 0, 0, 1, 1,
-0.460588, -0.867058, -2.82848, 1, 0, 0, 1, 1,
-0.4557094, -1.186352, -4.666128, 1, 0, 0, 1, 1,
-0.4542727, -1.236674, -1.86336, 1, 0, 0, 1, 1,
-0.454015, -1.182324, -1.10692, 1, 0, 0, 1, 1,
-0.4539338, 1.489342, -1.448321, 0, 0, 0, 1, 1,
-0.4512531, -0.6697996, -2.600329, 0, 0, 0, 1, 1,
-0.450587, -0.4297535, -2.501986, 0, 0, 0, 1, 1,
-0.4413987, 0.139202, -0.9766538, 0, 0, 0, 1, 1,
-0.436439, 1.409169, -0.9330112, 0, 0, 0, 1, 1,
-0.4360141, -0.4918551, -1.455553, 0, 0, 0, 1, 1,
-0.4313734, -0.06252904, -1.851474, 0, 0, 0, 1, 1,
-0.431181, 0.7857451, 0.9515973, 1, 1, 1, 1, 1,
-0.4298626, -0.1495843, -4.324927, 1, 1, 1, 1, 1,
-0.4281652, 0.9150109, 2.558614, 1, 1, 1, 1, 1,
-0.4276685, 1.637053, -2.054468, 1, 1, 1, 1, 1,
-0.4234339, -0.5337409, -0.684334, 1, 1, 1, 1, 1,
-0.4221393, -0.7335056, -3.05096, 1, 1, 1, 1, 1,
-0.4183296, 0.04838856, -1.595546, 1, 1, 1, 1, 1,
-0.415175, -0.357815, -1.840099, 1, 1, 1, 1, 1,
-0.4118509, -1.020732, -3.195782, 1, 1, 1, 1, 1,
-0.4115384, 1.504816, -0.03738561, 1, 1, 1, 1, 1,
-0.4087624, -0.9838827, -1.435346, 1, 1, 1, 1, 1,
-0.4027712, -0.5217736, -2.547663, 1, 1, 1, 1, 1,
-0.4016066, -0.4911985, -2.083025, 1, 1, 1, 1, 1,
-0.4014237, -0.3567207, -3.599084, 1, 1, 1, 1, 1,
-0.3996322, -0.3357724, -2.535096, 1, 1, 1, 1, 1,
-0.3959539, 1.279723, 0.8897306, 0, 0, 1, 1, 1,
-0.3955173, -0.2543266, -3.699625, 1, 0, 0, 1, 1,
-0.3938243, 0.3683646, -1.64433, 1, 0, 0, 1, 1,
-0.3921579, -0.2166659, -1.096198, 1, 0, 0, 1, 1,
-0.3835876, 0.276766, -0.08764619, 1, 0, 0, 1, 1,
-0.3794419, -1.023451, -1.324152, 1, 0, 0, 1, 1,
-0.378732, -0.7474886, -2.001057, 0, 0, 0, 1, 1,
-0.3770683, 0.07265161, -0.6162492, 0, 0, 0, 1, 1,
-0.3759352, -1.288024, -1.963678, 0, 0, 0, 1, 1,
-0.3724753, 1.286576, -1.697787, 0, 0, 0, 1, 1,
-0.369188, 0.176488, -1.492639, 0, 0, 0, 1, 1,
-0.3668802, 0.7317088, -0.5828527, 0, 0, 0, 1, 1,
-0.3666689, 0.5526893, -0.5644381, 0, 0, 0, 1, 1,
-0.3588259, 0.7916139, 0.1472925, 1, 1, 1, 1, 1,
-0.3563301, 1.040139, -0.3205803, 1, 1, 1, 1, 1,
-0.3557186, 0.08842774, -0.8361186, 1, 1, 1, 1, 1,
-0.352181, 1.966582, 0.4411802, 1, 1, 1, 1, 1,
-0.3503004, 0.1550622, 0.9768061, 1, 1, 1, 1, 1,
-0.3501983, 1.924316, -0.9299599, 1, 1, 1, 1, 1,
-0.3496892, 0.6447776, -1.169629, 1, 1, 1, 1, 1,
-0.3471802, 1.703295, -1.243452, 1, 1, 1, 1, 1,
-0.3469015, 0.8707873, -0.609912, 1, 1, 1, 1, 1,
-0.341054, -1.687418, -3.45933, 1, 1, 1, 1, 1,
-0.3368655, 1.187918, -0.4501456, 1, 1, 1, 1, 1,
-0.3324496, -0.8033115, -3.511058, 1, 1, 1, 1, 1,
-0.3302777, -0.4606978, -2.858974, 1, 1, 1, 1, 1,
-0.3136149, -0.8586409, -1.723326, 1, 1, 1, 1, 1,
-0.313115, -0.7329398, -3.896265, 1, 1, 1, 1, 1,
-0.3108775, -0.4670797, -3.10743, 0, 0, 1, 1, 1,
-0.3104904, 0.2660711, 0.4702383, 1, 0, 0, 1, 1,
-0.3104728, -0.02235478, -0.7698874, 1, 0, 0, 1, 1,
-0.3104317, -2.14888, -3.305861, 1, 0, 0, 1, 1,
-0.3103498, -1.624454, -3.494095, 1, 0, 0, 1, 1,
-0.3049806, -1.700021, -4.056341, 1, 0, 0, 1, 1,
-0.3001361, -0.7034736, -1.337206, 0, 0, 0, 1, 1,
-0.296936, 0.7347558, 1.288651, 0, 0, 0, 1, 1,
-0.2967285, -0.1340299, -3.674687, 0, 0, 0, 1, 1,
-0.296707, 1.404339, -0.1550429, 0, 0, 0, 1, 1,
-0.2962961, -0.100499, -3.748639, 0, 0, 0, 1, 1,
-0.291421, 0.4715717, 0.357958, 0, 0, 0, 1, 1,
-0.2864745, -0.6022739, -2.322134, 0, 0, 0, 1, 1,
-0.285781, -1.001182, -2.553649, 1, 1, 1, 1, 1,
-0.2846936, -0.1670857, -1.862414, 1, 1, 1, 1, 1,
-0.2815057, 0.3793243, -0.7967253, 1, 1, 1, 1, 1,
-0.2797314, 1.091476, -1.512615, 1, 1, 1, 1, 1,
-0.2769033, 1.897252, 0.009221123, 1, 1, 1, 1, 1,
-0.2736147, -1.348132, -5.567665, 1, 1, 1, 1, 1,
-0.2732927, 0.6966718, 0.1538708, 1, 1, 1, 1, 1,
-0.2667991, -0.3643773, -1.403157, 1, 1, 1, 1, 1,
-0.2647155, -1.219553, -2.050215, 1, 1, 1, 1, 1,
-0.2633723, 0.2109923, -1.702122, 1, 1, 1, 1, 1,
-0.2610793, 1.610263, -1.890407, 1, 1, 1, 1, 1,
-0.2605122, 1.541547, 0.0973682, 1, 1, 1, 1, 1,
-0.2603387, -0.3871323, -1.811303, 1, 1, 1, 1, 1,
-0.2553344, -0.9238106, -4.214521, 1, 1, 1, 1, 1,
-0.2543811, 0.05383188, -0.519673, 1, 1, 1, 1, 1,
-0.2541113, 1.905087, 0.445781, 0, 0, 1, 1, 1,
-0.2534579, -0.8344896, -4.564793, 1, 0, 0, 1, 1,
-0.2474089, 0.4226162, -0.6895987, 1, 0, 0, 1, 1,
-0.2386734, 1.353713, 0.3495128, 1, 0, 0, 1, 1,
-0.2379714, -1.490282, -2.852363, 1, 0, 0, 1, 1,
-0.2311317, 0.1297009, -1.32298, 1, 0, 0, 1, 1,
-0.2292415, -1.676723, -3.302702, 0, 0, 0, 1, 1,
-0.2207763, 0.5079738, -0.9611677, 0, 0, 0, 1, 1,
-0.2165925, 0.1390056, -1.076025, 0, 0, 0, 1, 1,
-0.2151807, 0.5671068, -0.08605494, 0, 0, 0, 1, 1,
-0.213013, -0.8425382, -1.602347, 0, 0, 0, 1, 1,
-0.2128195, -0.8782414, -2.368948, 0, 0, 0, 1, 1,
-0.2118484, 0.7986124, -0.0454211, 0, 0, 0, 1, 1,
-0.2107799, 1.587268, 1.135685, 1, 1, 1, 1, 1,
-0.1988171, 0.8402625, -0.2992653, 1, 1, 1, 1, 1,
-0.1986484, 1.423132, -0.1469619, 1, 1, 1, 1, 1,
-0.1965142, 0.4428114, -0.6000493, 1, 1, 1, 1, 1,
-0.196033, 0.1794864, -0.2031799, 1, 1, 1, 1, 1,
-0.1946355, -1.340062, -1.636065, 1, 1, 1, 1, 1,
-0.1917204, -0.1235263, -4.24882, 1, 1, 1, 1, 1,
-0.1870432, -0.6347393, -4.819408, 1, 1, 1, 1, 1,
-0.1853055, 1.194031, 1.636883, 1, 1, 1, 1, 1,
-0.1831473, 1.550639, 1.702099, 1, 1, 1, 1, 1,
-0.1808566, -0.920774, -3.937282, 1, 1, 1, 1, 1,
-0.1802697, 2.034034, -0.6854685, 1, 1, 1, 1, 1,
-0.1773709, 0.2421133, -1.27112, 1, 1, 1, 1, 1,
-0.176018, -0.5583428, -4.115798, 1, 1, 1, 1, 1,
-0.1739855, 0.1141153, -1.024772, 1, 1, 1, 1, 1,
-0.1730812, 1.376112, 0.5908772, 0, 0, 1, 1, 1,
-0.169507, -0.4355032, -1.588596, 1, 0, 0, 1, 1,
-0.168248, 0.6836589, -0.02993098, 1, 0, 0, 1, 1,
-0.1660053, 0.5969819, 0.05011658, 1, 0, 0, 1, 1,
-0.1598133, 0.4774769, 1.456054, 1, 0, 0, 1, 1,
-0.1580464, 0.1455148, -1.230681, 1, 0, 0, 1, 1,
-0.1574597, -0.01088389, -0.9601395, 0, 0, 0, 1, 1,
-0.1562027, 0.3385023, 0.2331856, 0, 0, 0, 1, 1,
-0.1548631, 2.122392, -0.6448848, 0, 0, 0, 1, 1,
-0.1546488, -1.082796, -2.564888, 0, 0, 0, 1, 1,
-0.1529621, -1.414366, -2.373901, 0, 0, 0, 1, 1,
-0.151488, 1.987135, 1.18756, 0, 0, 0, 1, 1,
-0.1454257, 0.6051408, -0.2028099, 0, 0, 0, 1, 1,
-0.142139, 0.3676701, -1.146867, 1, 1, 1, 1, 1,
-0.1402578, 1.129441, 0.6837178, 1, 1, 1, 1, 1,
-0.1353829, 0.4328872, -1.604146, 1, 1, 1, 1, 1,
-0.1334198, -1.325636, -3.02159, 1, 1, 1, 1, 1,
-0.1281228, -0.8332173, -2.596614, 1, 1, 1, 1, 1,
-0.1258325, -0.1690157, -5.094049, 1, 1, 1, 1, 1,
-0.1236577, -0.768245, -3.68231, 1, 1, 1, 1, 1,
-0.1231399, 1.224939, 0.3208977, 1, 1, 1, 1, 1,
-0.116751, -0.8442109, -1.704863, 1, 1, 1, 1, 1,
-0.1139909, 1.213942, 0.08578858, 1, 1, 1, 1, 1,
-0.1093393, 0.8089712, -0.3211503, 1, 1, 1, 1, 1,
-0.1065146, 0.3964489, -0.3578625, 1, 1, 1, 1, 1,
-0.1059611, 0.6636738, -0.003388426, 1, 1, 1, 1, 1,
-0.1050258, -1.159727, -1.318141, 1, 1, 1, 1, 1,
-0.09741242, -0.3019335, -3.430862, 1, 1, 1, 1, 1,
-0.09576635, -0.2651529, -3.71257, 0, 0, 1, 1, 1,
-0.09286741, 0.7819523, 0.0987176, 1, 0, 0, 1, 1,
-0.09078897, 2.19554, -0.1567631, 1, 0, 0, 1, 1,
-0.08772054, -0.328189, -2.744614, 1, 0, 0, 1, 1,
-0.08546153, 0.1173925, -0.168821, 1, 0, 0, 1, 1,
-0.08267965, 1.128469, -0.08702251, 1, 0, 0, 1, 1,
-0.07990579, 0.2448394, 1.089205, 0, 0, 0, 1, 1,
-0.07796982, 0.127308, -0.03106632, 0, 0, 0, 1, 1,
-0.07360032, 0.2401498, 0.4005671, 0, 0, 0, 1, 1,
-0.07310557, 0.2343851, 1.067873, 0, 0, 0, 1, 1,
-0.06958598, 0.986096, 0.1649969, 0, 0, 0, 1, 1,
-0.06913559, 0.7734178, -1.038193, 0, 0, 0, 1, 1,
-0.06714939, -0.8596061, -4.681783, 0, 0, 0, 1, 1,
-0.06688615, -0.2567721, -3.210296, 1, 1, 1, 1, 1,
-0.06534637, 1.012904, -0.9562973, 1, 1, 1, 1, 1,
-0.06389161, -1.301772, -2.68381, 1, 1, 1, 1, 1,
-0.06368575, -0.1742399, -3.72277, 1, 1, 1, 1, 1,
-0.0630834, 0.07229011, -1.559154, 1, 1, 1, 1, 1,
-0.05998951, 0.9766824, -1.954304, 1, 1, 1, 1, 1,
-0.05793029, -1.094978, -4.218134, 1, 1, 1, 1, 1,
-0.05244625, 0.05731862, -1.031096, 1, 1, 1, 1, 1,
-0.05077327, -0.3288563, -3.425408, 1, 1, 1, 1, 1,
-0.04511436, -0.476199, -1.377983, 1, 1, 1, 1, 1,
-0.02522525, -0.4171568, -2.8429, 1, 1, 1, 1, 1,
-0.0248948, 2.247332, -1.311574, 1, 1, 1, 1, 1,
-0.02248269, -0.5309207, -2.756375, 1, 1, 1, 1, 1,
-0.02053056, 0.8528943, 0.4837481, 1, 1, 1, 1, 1,
-0.01819715, 0.41536, -0.1866388, 1, 1, 1, 1, 1,
-0.01470308, -0.1333815, -2.595275, 0, 0, 1, 1, 1,
-0.0114873, -1.035251, -5.0743, 1, 0, 0, 1, 1,
-0.01130268, -1.192267, -2.335177, 1, 0, 0, 1, 1,
-0.0104378, 0.3528876, -0.267905, 1, 0, 0, 1, 1,
-0.01007657, 0.2472128, 0.6337885, 1, 0, 0, 1, 1,
0.001006276, 1.088912, 1.784155, 1, 0, 0, 1, 1,
0.002202087, 0.4370644, -1.86322, 0, 0, 0, 1, 1,
0.004514431, -1.132337, 3.236516, 0, 0, 0, 1, 1,
0.004630073, 0.1190407, 2.852493, 0, 0, 0, 1, 1,
0.005988635, 0.9425484, -1.217419, 0, 0, 0, 1, 1,
0.007928693, -1.228822, 3.956938, 0, 0, 0, 1, 1,
0.01056254, 1.500402, -0.7515268, 0, 0, 0, 1, 1,
0.01323588, -0.4311406, 3.063551, 0, 0, 0, 1, 1,
0.01873973, -0.7777655, 4.518466, 1, 1, 1, 1, 1,
0.01927279, -0.04587786, 2.000341, 1, 1, 1, 1, 1,
0.01998447, 2.330273, -0.4335629, 1, 1, 1, 1, 1,
0.02017211, -0.8950697, 2.321033, 1, 1, 1, 1, 1,
0.02658132, -0.0485521, 2.555386, 1, 1, 1, 1, 1,
0.02794689, -0.2476315, 2.507992, 1, 1, 1, 1, 1,
0.02950114, 0.5856689, 1.236641, 1, 1, 1, 1, 1,
0.03026681, 0.9661973, 0.8639438, 1, 1, 1, 1, 1,
0.03534814, -0.6707262, 2.975423, 1, 1, 1, 1, 1,
0.03961491, -0.1113993, 3.449054, 1, 1, 1, 1, 1,
0.04610415, 0.6616827, -0.7682667, 1, 1, 1, 1, 1,
0.04890445, -1.360193, 3.869414, 1, 1, 1, 1, 1,
0.05510108, 0.977817, -1.070146, 1, 1, 1, 1, 1,
0.05953547, -0.7120047, 2.182241, 1, 1, 1, 1, 1,
0.06429921, -1.447268, 3.260897, 1, 1, 1, 1, 1,
0.06498876, 1.271536, -1.129043, 0, 0, 1, 1, 1,
0.06518485, -0.3378635, 3.403939, 1, 0, 0, 1, 1,
0.06605119, 0.6023657, -1.10426, 1, 0, 0, 1, 1,
0.06637248, -0.9205977, 2.095336, 1, 0, 0, 1, 1,
0.06749033, 0.0723881, 2.183628, 1, 0, 0, 1, 1,
0.07041178, -0.2660763, 1.788858, 1, 0, 0, 1, 1,
0.07102244, 1.214703, 0.1089639, 0, 0, 0, 1, 1,
0.07141104, -0.3876776, 2.54372, 0, 0, 0, 1, 1,
0.07347429, -1.461954, 1.907266, 0, 0, 0, 1, 1,
0.07654256, 0.4087048, 0.9421687, 0, 0, 0, 1, 1,
0.07949733, -0.4565519, 1.329217, 0, 0, 0, 1, 1,
0.0869601, 0.3362932, -1.952254, 0, 0, 0, 1, 1,
0.08760694, 0.173276, 0.9496707, 0, 0, 0, 1, 1,
0.08783317, -0.4704118, 4.199055, 1, 1, 1, 1, 1,
0.09127044, -0.3305323, 3.490722, 1, 1, 1, 1, 1,
0.09868316, 0.9978427, -0.1410173, 1, 1, 1, 1, 1,
0.1074281, -0.9678205, 2.019606, 1, 1, 1, 1, 1,
0.1100705, -0.5862674, 2.423404, 1, 1, 1, 1, 1,
0.1128292, -0.02359367, 1.829492, 1, 1, 1, 1, 1,
0.1132131, -1.834411, 2.281714, 1, 1, 1, 1, 1,
0.1155871, 0.3558348, 2.371426, 1, 1, 1, 1, 1,
0.1161057, 0.2222553, 0.2080578, 1, 1, 1, 1, 1,
0.1188823, -1.005131, 4.015563, 1, 1, 1, 1, 1,
0.1243099, 0.6965957, 1.223408, 1, 1, 1, 1, 1,
0.1256626, 0.01639793, 2.054714, 1, 1, 1, 1, 1,
0.1271752, -1.794174, 4.427685, 1, 1, 1, 1, 1,
0.131615, -0.8538561, 3.098799, 1, 1, 1, 1, 1,
0.1386958, 0.5459967, 0.3250514, 1, 1, 1, 1, 1,
0.142501, -0.8947064, 3.200041, 0, 0, 1, 1, 1,
0.1447291, -0.228682, 3.354226, 1, 0, 0, 1, 1,
0.1476178, -1.829234, 2.020149, 1, 0, 0, 1, 1,
0.1506789, -1.827111, 2.981592, 1, 0, 0, 1, 1,
0.1520118, -1.835095, 3.205936, 1, 0, 0, 1, 1,
0.1552395, -0.0468444, 0.1223573, 1, 0, 0, 1, 1,
0.1553703, -0.9296714, 4.900884, 0, 0, 0, 1, 1,
0.1591371, -1.365106, 3.655283, 0, 0, 0, 1, 1,
0.1596423, -0.6864986, 2.764939, 0, 0, 0, 1, 1,
0.160144, 1.131791, 0.249519, 0, 0, 0, 1, 1,
0.1610767, 0.8500867, 0.764331, 0, 0, 0, 1, 1,
0.1613305, -0.08627044, 2.548255, 0, 0, 0, 1, 1,
0.1636466, -0.1853589, 1.460093, 0, 0, 0, 1, 1,
0.1639421, -0.2616979, 3.380833, 1, 1, 1, 1, 1,
0.164103, -0.8443747, 2.148891, 1, 1, 1, 1, 1,
0.1647774, -1.52937, 3.722066, 1, 1, 1, 1, 1,
0.1651116, 0.04699875, 1.700386, 1, 1, 1, 1, 1,
0.1690613, 0.1097487, 0.9270489, 1, 1, 1, 1, 1,
0.1697149, 0.1972254, 0.6260087, 1, 1, 1, 1, 1,
0.170155, -0.1995946, 4.861768, 1, 1, 1, 1, 1,
0.1712086, -0.2972789, 1.093004, 1, 1, 1, 1, 1,
0.1718898, 0.2563598, -0.3675912, 1, 1, 1, 1, 1,
0.1722576, 1.115451, -1.145269, 1, 1, 1, 1, 1,
0.1726638, -0.1138081, 1.756328, 1, 1, 1, 1, 1,
0.1820822, 0.3303914, 0.03781853, 1, 1, 1, 1, 1,
0.1859914, -1.245868, 1.830546, 1, 1, 1, 1, 1,
0.1875531, -2.471416, 2.429945, 1, 1, 1, 1, 1,
0.1894409, 1.269426, 1.612305, 1, 1, 1, 1, 1,
0.1910712, -0.933621, 1.627587, 0, 0, 1, 1, 1,
0.1920474, -0.7914126, 5.029825, 1, 0, 0, 1, 1,
0.2000235, -3.031335, 3.824656, 1, 0, 0, 1, 1,
0.2039307, 1.501897, 1.583772, 1, 0, 0, 1, 1,
0.206667, 0.1248274, 1.992018, 1, 0, 0, 1, 1,
0.2101839, 1.664611, 2.108488, 1, 0, 0, 1, 1,
0.2139935, -0.3327843, 3.316523, 0, 0, 0, 1, 1,
0.2142309, 0.1417082, 1.686725, 0, 0, 0, 1, 1,
0.221887, -1.325854, 3.534812, 0, 0, 0, 1, 1,
0.2260097, -0.2905783, 2.414429, 0, 0, 0, 1, 1,
0.2267649, -1.873877, 1.799889, 0, 0, 0, 1, 1,
0.2272374, -0.5200912, 4.63339, 0, 0, 0, 1, 1,
0.2282963, 0.8917314, 0.1205332, 0, 0, 0, 1, 1,
0.2296925, 0.3615046, 1.187743, 1, 1, 1, 1, 1,
0.2332165, -0.8064627, 3.673641, 1, 1, 1, 1, 1,
0.2339039, -0.8821918, -0.3401302, 1, 1, 1, 1, 1,
0.2376326, 0.3547484, 0.915081, 1, 1, 1, 1, 1,
0.2439365, 0.6064549, 0.7442788, 1, 1, 1, 1, 1,
0.249616, 0.8645228, -0.3897474, 1, 1, 1, 1, 1,
0.2516535, -0.7656245, 4.633423, 1, 1, 1, 1, 1,
0.253241, 0.5321801, 0.7810171, 1, 1, 1, 1, 1,
0.253759, 1.020892, 0.1270946, 1, 1, 1, 1, 1,
0.2542295, 1.22729, -0.5348984, 1, 1, 1, 1, 1,
0.2616503, -1.445554, 1.244278, 1, 1, 1, 1, 1,
0.2664371, -1.517792, 4.466949, 1, 1, 1, 1, 1,
0.2692711, -0.2938297, 2.363075, 1, 1, 1, 1, 1,
0.2703903, -0.6654656, 1.636467, 1, 1, 1, 1, 1,
0.271514, 1.110081, 1.545122, 1, 1, 1, 1, 1,
0.2735822, 0.9208111, -0.7982166, 0, 0, 1, 1, 1,
0.2786368, -0.4618679, 2.893657, 1, 0, 0, 1, 1,
0.2787908, 0.175922, 2.945948, 1, 0, 0, 1, 1,
0.282335, -1.12624, 4.319451, 1, 0, 0, 1, 1,
0.2871839, -0.4687566, 2.015568, 1, 0, 0, 1, 1,
0.2874132, 0.2775525, -1.334707, 1, 0, 0, 1, 1,
0.2884701, 0.9940928, -0.3135024, 0, 0, 0, 1, 1,
0.289271, 0.03098677, 2.114642, 0, 0, 0, 1, 1,
0.2910053, 0.8820078, 0.2617218, 0, 0, 0, 1, 1,
0.2955645, 0.3840254, 1.33437, 0, 0, 0, 1, 1,
0.2964085, 1.013166, -0.602807, 0, 0, 0, 1, 1,
0.2984358, -0.4086688, 2.65856, 0, 0, 0, 1, 1,
0.2997976, 1.229215, 0.7270407, 0, 0, 0, 1, 1,
0.300448, -0.1703462, 2.331203, 1, 1, 1, 1, 1,
0.3014894, 0.7343922, -0.04373378, 1, 1, 1, 1, 1,
0.3111867, -1.211683, 3.590158, 1, 1, 1, 1, 1,
0.3113344, 0.07830669, 0.6221735, 1, 1, 1, 1, 1,
0.31255, -0.1969405, 1.797813, 1, 1, 1, 1, 1,
0.3138692, -1.570318, 2.51571, 1, 1, 1, 1, 1,
0.3173059, -0.4256993, 2.019344, 1, 1, 1, 1, 1,
0.3232504, -1.82476, 3.518872, 1, 1, 1, 1, 1,
0.3267386, -2.050188, 4.487926, 1, 1, 1, 1, 1,
0.3276846, 0.8908644, -0.24168, 1, 1, 1, 1, 1,
0.3291109, -0.1962764, 0.5058775, 1, 1, 1, 1, 1,
0.3307172, 0.0830867, 1.404391, 1, 1, 1, 1, 1,
0.3343601, -0.4801171, 3.226204, 1, 1, 1, 1, 1,
0.3367478, -0.7649834, 4.16431, 1, 1, 1, 1, 1,
0.3416067, 0.6755449, 2.014396, 1, 1, 1, 1, 1,
0.3427811, -0.610462, 3.618845, 0, 0, 1, 1, 1,
0.3432596, 1.446809, -0.5193991, 1, 0, 0, 1, 1,
0.3446846, -0.1774326, 1.146198, 1, 0, 0, 1, 1,
0.3474655, -1.704706, 2.834248, 1, 0, 0, 1, 1,
0.3538304, 1.86654, -0.2462093, 1, 0, 0, 1, 1,
0.3575758, -0.0839893, 0.8626206, 1, 0, 0, 1, 1,
0.3578658, -1.310188, 3.68807, 0, 0, 0, 1, 1,
0.3590142, -0.270146, 1.85456, 0, 0, 0, 1, 1,
0.3598374, -0.8588842, 4.201102, 0, 0, 0, 1, 1,
0.3618658, 0.3980201, 0.5660484, 0, 0, 0, 1, 1,
0.3630829, 0.9922863, 1.41628, 0, 0, 0, 1, 1,
0.3648862, 0.3443772, -1.037035, 0, 0, 0, 1, 1,
0.3681982, -1.084935, 3.675158, 0, 0, 0, 1, 1,
0.3713523, 0.8281445, -0.06478488, 1, 1, 1, 1, 1,
0.3724874, 2.011691, -0.5106826, 1, 1, 1, 1, 1,
0.3740651, 0.8254403, -1.166342, 1, 1, 1, 1, 1,
0.3802263, -0.1514926, 0.3664763, 1, 1, 1, 1, 1,
0.3807195, -0.8498221, 2.154389, 1, 1, 1, 1, 1,
0.3821335, 0.08451875, -0.2308736, 1, 1, 1, 1, 1,
0.38519, 1.019102, 1.214777, 1, 1, 1, 1, 1,
0.3862239, -0.511253, 2.561362, 1, 1, 1, 1, 1,
0.3903424, 0.9404039, 0.5416714, 1, 1, 1, 1, 1,
0.3925859, -1.416148, 1.437688, 1, 1, 1, 1, 1,
0.3949639, -0.3345036, 3.761612, 1, 1, 1, 1, 1,
0.4045517, 1.947284, -1.101791, 1, 1, 1, 1, 1,
0.4080828, -0.3792433, 3.329609, 1, 1, 1, 1, 1,
0.4082405, -0.1828092, 2.561753, 1, 1, 1, 1, 1,
0.4088741, 0.6656723, -0.5634838, 1, 1, 1, 1, 1,
0.4103466, 0.5552387, 1.470832, 0, 0, 1, 1, 1,
0.4104587, 2.816949, -0.1519226, 1, 0, 0, 1, 1,
0.4157267, -0.5521973, 2.20387, 1, 0, 0, 1, 1,
0.4170728, 0.1143205, 0.5360033, 1, 0, 0, 1, 1,
0.4205036, 1.441236, -1.070929, 1, 0, 0, 1, 1,
0.4243194, -0.6234623, 1.294827, 1, 0, 0, 1, 1,
0.4262218, 0.8256187, 1.291227, 0, 0, 0, 1, 1,
0.4279371, 0.4634533, 0.7110759, 0, 0, 0, 1, 1,
0.4310394, 0.9548048, 1.933511, 0, 0, 0, 1, 1,
0.4317797, 1.564698, 0.5518344, 0, 0, 0, 1, 1,
0.4324972, 0.8955558, -0.02221295, 0, 0, 0, 1, 1,
0.4336303, 0.2258628, -0.2736835, 0, 0, 0, 1, 1,
0.4410768, 0.2434803, 0.2203484, 0, 0, 0, 1, 1,
0.4431974, -0.1012631, 1.923752, 1, 1, 1, 1, 1,
0.4437636, 0.966899, 0.6400169, 1, 1, 1, 1, 1,
0.4445889, -0.6767302, 2.236503, 1, 1, 1, 1, 1,
0.4457442, 1.000539, -1.169186, 1, 1, 1, 1, 1,
0.4461691, -0.5447652, 2.154534, 1, 1, 1, 1, 1,
0.4461853, -1.80411, 3.955791, 1, 1, 1, 1, 1,
0.4483505, 1.825766, -1.442479, 1, 1, 1, 1, 1,
0.4542197, 0.173316, 1.188739, 1, 1, 1, 1, 1,
0.4561341, 0.3905533, 0.03163807, 1, 1, 1, 1, 1,
0.4582048, -0.7458529, 3.130907, 1, 1, 1, 1, 1,
0.4632078, -1.713883, 1.950004, 1, 1, 1, 1, 1,
0.464321, -0.2471905, 2.940138, 1, 1, 1, 1, 1,
0.4659043, -1.332047, 3.019641, 1, 1, 1, 1, 1,
0.4672113, 1.5866, 1.310974, 1, 1, 1, 1, 1,
0.4695943, -0.6872762, 4.216798, 1, 1, 1, 1, 1,
0.4699482, -0.02413376, 3.257145, 0, 0, 1, 1, 1,
0.4732286, 0.2268943, 1.30177, 1, 0, 0, 1, 1,
0.4829833, -0.928049, 3.174374, 1, 0, 0, 1, 1,
0.4845552, 0.558569, 0.2434877, 1, 0, 0, 1, 1,
0.4862762, -0.4591499, 2.16678, 1, 0, 0, 1, 1,
0.4866354, -0.09679631, 2.003291, 1, 0, 0, 1, 1,
0.4879003, -1.195687, 3.550737, 0, 0, 0, 1, 1,
0.494364, -0.1131826, 2.153513, 0, 0, 0, 1, 1,
0.4982786, 0.9353994, -0.09962907, 0, 0, 0, 1, 1,
0.4984473, -0.7184014, 2.807592, 0, 0, 0, 1, 1,
0.4985575, 0.1532329, 2.370234, 0, 0, 0, 1, 1,
0.498639, 0.6992282, 1.629913, 0, 0, 0, 1, 1,
0.5012303, 1.106882, 0.0093575, 0, 0, 0, 1, 1,
0.5022542, 0.282491, 0.6621523, 1, 1, 1, 1, 1,
0.5024666, 0.007880203, 1.00608, 1, 1, 1, 1, 1,
0.5088645, -0.7475517, 2.15205, 1, 1, 1, 1, 1,
0.510411, 1.280126, 2.021163, 1, 1, 1, 1, 1,
0.5126939, -0.6271746, 1.276646, 1, 1, 1, 1, 1,
0.5158152, 1.439585, 0.3258874, 1, 1, 1, 1, 1,
0.5186315, 0.2589371, 1.474613, 1, 1, 1, 1, 1,
0.518939, -0.9560425, 3.456943, 1, 1, 1, 1, 1,
0.5193073, -0.8368236, 3.032768, 1, 1, 1, 1, 1,
0.519969, 0.2657481, 0.02029045, 1, 1, 1, 1, 1,
0.5208544, -1.07632, 2.861213, 1, 1, 1, 1, 1,
0.523172, -0.7749411, 2.324007, 1, 1, 1, 1, 1,
0.5278116, -0.9451714, 4.775765, 1, 1, 1, 1, 1,
0.5318901, -0.1143984, 2.044723, 1, 1, 1, 1, 1,
0.5324075, 0.3060295, 2.498985, 1, 1, 1, 1, 1,
0.5327066, -0.1650511, 4.091613, 0, 0, 1, 1, 1,
0.5328009, 0.7184986, 0.2494335, 1, 0, 0, 1, 1,
0.532856, 1.53513, -0.8592678, 1, 0, 0, 1, 1,
0.5447788, -0.5184064, 3.369566, 1, 0, 0, 1, 1,
0.5483863, 0.4564364, 0.2569081, 1, 0, 0, 1, 1,
0.5484723, 0.5840952, 0.2793534, 1, 0, 0, 1, 1,
0.5554847, 0.4128711, 0.2330184, 0, 0, 0, 1, 1,
0.5564978, -0.1736167, 2.281672, 0, 0, 0, 1, 1,
0.5599562, 2.099605, 2.167785, 0, 0, 0, 1, 1,
0.5629445, -1.058172, 2.896704, 0, 0, 0, 1, 1,
0.5636892, -0.2999298, 2.300455, 0, 0, 0, 1, 1,
0.5640395, 0.3613481, 2.36425, 0, 0, 0, 1, 1,
0.5735756, 0.4410864, 0.3844465, 0, 0, 0, 1, 1,
0.5812559, 0.04846754, 0.6652079, 1, 1, 1, 1, 1,
0.5827074, 0.8023502, 0.4689276, 1, 1, 1, 1, 1,
0.5873046, -0.3189069, 2.806228, 1, 1, 1, 1, 1,
0.5893867, -0.9137273, 2.710256, 1, 1, 1, 1, 1,
0.5896884, -0.7378693, 1.264099, 1, 1, 1, 1, 1,
0.5964565, -0.2686095, 2.076349, 1, 1, 1, 1, 1,
0.5977256, 0.3849294, 1.109798, 1, 1, 1, 1, 1,
0.5999951, -1.331199, 2.299525, 1, 1, 1, 1, 1,
0.6048555, 1.756782, -0.6846557, 1, 1, 1, 1, 1,
0.6094164, 0.4548299, 0.3997267, 1, 1, 1, 1, 1,
0.6132832, -0.6076332, 1.522084, 1, 1, 1, 1, 1,
0.6167616, 0.7523071, 0.2542857, 1, 1, 1, 1, 1,
0.6188356, 0.5794337, 1.254081, 1, 1, 1, 1, 1,
0.6188537, 1.732869, 1.587178, 1, 1, 1, 1, 1,
0.6220512, -0.6721319, 1.863785, 1, 1, 1, 1, 1,
0.6240641, 1.615247, 2.044348, 0, 0, 1, 1, 1,
0.6276988, 0.1518669, 1.019573, 1, 0, 0, 1, 1,
0.6357977, 2.505616, 0.8291371, 1, 0, 0, 1, 1,
0.6369126, -0.3378852, 1.756186, 1, 0, 0, 1, 1,
0.6392386, 0.6854343, 0.5224683, 1, 0, 0, 1, 1,
0.6425668, -0.6066194, 3.605077, 1, 0, 0, 1, 1,
0.6438784, 1.189259, 2.39883, 0, 0, 0, 1, 1,
0.6474572, -0.9547946, 3.516185, 0, 0, 0, 1, 1,
0.6484121, -1.127885, 0.8525077, 0, 0, 0, 1, 1,
0.6519303, -0.3591781, 1.66563, 0, 0, 0, 1, 1,
0.6562666, -0.6961219, 1.422872, 0, 0, 0, 1, 1,
0.6567128, -0.2516443, 3.407736, 0, 0, 0, 1, 1,
0.6581405, 0.7186266, 2.902622, 0, 0, 0, 1, 1,
0.6597352, 1.180742, 0.1792789, 1, 1, 1, 1, 1,
0.6631852, 1.070555, 1.213471, 1, 1, 1, 1, 1,
0.6642088, 0.461064, 1.889473, 1, 1, 1, 1, 1,
0.6813122, -0.1015265, 2.112916, 1, 1, 1, 1, 1,
0.6831399, 0.6046888, 1.454695, 1, 1, 1, 1, 1,
0.6845453, -1.186365, 2.024115, 1, 1, 1, 1, 1,
0.6866936, -1.738096, 2.031587, 1, 1, 1, 1, 1,
0.6873637, -1.143867, 3.471747, 1, 1, 1, 1, 1,
0.6914167, 1.539924, 0.3970469, 1, 1, 1, 1, 1,
0.7016985, 0.5474586, 1.773325, 1, 1, 1, 1, 1,
0.7018952, 0.8001558, 0.8604912, 1, 1, 1, 1, 1,
0.7067489, -0.8721972, 1.213394, 1, 1, 1, 1, 1,
0.7088609, -0.4713923, 1.991951, 1, 1, 1, 1, 1,
0.7093948, -1.342406, 2.216411, 1, 1, 1, 1, 1,
0.7104177, 0.337449, -0.8497477, 1, 1, 1, 1, 1,
0.7159464, -0.2158402, 1.599464, 0, 0, 1, 1, 1,
0.7184374, 0.7925311, 1.936398, 1, 0, 0, 1, 1,
0.7213229, 1.432546, 0.7729595, 1, 0, 0, 1, 1,
0.7248729, 0.5770028, 2.95777, 1, 0, 0, 1, 1,
0.725475, -1.002748, 3.052127, 1, 0, 0, 1, 1,
0.7258743, 0.2844236, 0.9527954, 1, 0, 0, 1, 1,
0.7270386, -0.7149918, 0.9618921, 0, 0, 0, 1, 1,
0.7287278, -1.103892, 4.874387, 0, 0, 0, 1, 1,
0.731517, 0.9749389, 0.4579658, 0, 0, 0, 1, 1,
0.7316671, -0.9224775, 1.251457, 0, 0, 0, 1, 1,
0.7353323, 0.8168998, -1.390923, 0, 0, 0, 1, 1,
0.7397386, -0.1161766, 0.8068457, 0, 0, 0, 1, 1,
0.7421064, 0.7928285, -0.1001682, 0, 0, 0, 1, 1,
0.750587, 1.159708, 1.540413, 1, 1, 1, 1, 1,
0.7524981, -0.5974912, 2.285015, 1, 1, 1, 1, 1,
0.7629225, 0.06738517, 0.5247278, 1, 1, 1, 1, 1,
0.7657014, -0.327912, 1.243001, 1, 1, 1, 1, 1,
0.7657421, 0.4469274, 0.4086038, 1, 1, 1, 1, 1,
0.7666612, -0.2424844, 1.868676, 1, 1, 1, 1, 1,
0.7725149, -0.1625111, 1.065679, 1, 1, 1, 1, 1,
0.7732462, 0.689282, 0.3162618, 1, 1, 1, 1, 1,
0.7738623, 0.2316537, 0.8597538, 1, 1, 1, 1, 1,
0.7810122, -2.216011, 1.305817, 1, 1, 1, 1, 1,
0.7813611, 0.8465348, 1.474162, 1, 1, 1, 1, 1,
0.7852222, 0.2139249, 2.086001, 1, 1, 1, 1, 1,
0.7869852, -0.3764415, 0.3328171, 1, 1, 1, 1, 1,
0.7880013, -0.01434289, 2.235751, 1, 1, 1, 1, 1,
0.7893175, -0.630381, 2.672024, 1, 1, 1, 1, 1,
0.7985275, -0.9318928, 2.698804, 0, 0, 1, 1, 1,
0.8030938, 0.2303939, 0.2950648, 1, 0, 0, 1, 1,
0.8080497, -2.139455, 3.337606, 1, 0, 0, 1, 1,
0.8095946, 1.133536, 0.3370278, 1, 0, 0, 1, 1,
0.8107153, 0.2469857, 1.981428, 1, 0, 0, 1, 1,
0.8155765, -0.4122127, 2.125242, 1, 0, 0, 1, 1,
0.8166624, 0.4933839, 2.551548, 0, 0, 0, 1, 1,
0.817997, -0.5827898, 1.81531, 0, 0, 0, 1, 1,
0.8196073, 0.3837204, -1.8028, 0, 0, 0, 1, 1,
0.822665, -1.414844, 2.813558, 0, 0, 0, 1, 1,
0.8229334, -0.1031202, 2.1264, 0, 0, 0, 1, 1,
0.8236115, 2.176949, 0.1786531, 0, 0, 0, 1, 1,
0.8275601, -0.1126833, -0.2895605, 0, 0, 0, 1, 1,
0.8281435, -1.66224, 3.161227, 1, 1, 1, 1, 1,
0.833508, -0.5976867, 3.290523, 1, 1, 1, 1, 1,
0.8347111, -0.5606142, 1.505415, 1, 1, 1, 1, 1,
0.8347316, -0.9791374, 1.625906, 1, 1, 1, 1, 1,
0.8378502, 1.129441, 0.9053717, 1, 1, 1, 1, 1,
0.8384729, -0.1904307, 2.949343, 1, 1, 1, 1, 1,
0.8385207, 0.360781, 1.049766, 1, 1, 1, 1, 1,
0.8388371, -0.07451434, 1.302363, 1, 1, 1, 1, 1,
0.8409553, -0.83324, 2.657158, 1, 1, 1, 1, 1,
0.8420107, 0.7801453, 0.3281437, 1, 1, 1, 1, 1,
0.8472564, -1.616032, 3.721932, 1, 1, 1, 1, 1,
0.8503507, -0.01560888, 3.689914, 1, 1, 1, 1, 1,
0.8538259, 0.2670312, 0.978133, 1, 1, 1, 1, 1,
0.8546993, -0.1260673, 0.9411085, 1, 1, 1, 1, 1,
0.8643009, 0.02357437, 0.4446738, 1, 1, 1, 1, 1,
0.864312, 0.7828054, 0.4882803, 0, 0, 1, 1, 1,
0.8686098, 0.9721599, 1.392737, 1, 0, 0, 1, 1,
0.871898, 0.6563291, -0.2377075, 1, 0, 0, 1, 1,
0.8736711, -0.09373613, 1.353157, 1, 0, 0, 1, 1,
0.8768829, 1.207017, 0.6778507, 1, 0, 0, 1, 1,
0.8778369, -0.02404168, 1.477056, 1, 0, 0, 1, 1,
0.8865855, 0.07110083, 2.553892, 0, 0, 0, 1, 1,
0.88702, -0.384841, 1.168581, 0, 0, 0, 1, 1,
0.9026802, 1.166605, -0.6299326, 0, 0, 0, 1, 1,
0.9036462, -0.53105, 1.980113, 0, 0, 0, 1, 1,
0.9041857, -0.9994358, 2.502029, 0, 0, 0, 1, 1,
0.9108806, -1.060206, 2.289125, 0, 0, 0, 1, 1,
0.9113333, -0.5825236, 3.14357, 0, 0, 0, 1, 1,
0.9153617, -0.2277486, 2.048959, 1, 1, 1, 1, 1,
0.9302793, 0.1378119, 2.732705, 1, 1, 1, 1, 1,
0.930692, -1.936096, 2.436518, 1, 1, 1, 1, 1,
0.9364676, 0.9468156, 0.5798473, 1, 1, 1, 1, 1,
0.9373313, -1.984119, 1.688643, 1, 1, 1, 1, 1,
0.9428831, 0.09417089, -0.6601581, 1, 1, 1, 1, 1,
0.9437228, -0.8411772, 3.909431, 1, 1, 1, 1, 1,
0.944555, -0.2966221, 1.324408, 1, 1, 1, 1, 1,
0.9452292, -0.2722461, 3.110133, 1, 1, 1, 1, 1,
0.9626516, 0.1907506, 2.400198, 1, 1, 1, 1, 1,
0.9705088, 2.091883, 0.3936304, 1, 1, 1, 1, 1,
0.9715866, -1.660094, 2.969949, 1, 1, 1, 1, 1,
0.9816271, -2.225363, 3.429117, 1, 1, 1, 1, 1,
0.9886168, -1.21226, 2.470277, 1, 1, 1, 1, 1,
0.9889831, -1.142713, 1.088102, 1, 1, 1, 1, 1,
0.9910662, 0.4616725, 0.3976061, 0, 0, 1, 1, 1,
0.9953406, -1.627726, 2.893304, 1, 0, 0, 1, 1,
1.000232, -0.4548308, 1.146299, 1, 0, 0, 1, 1,
1.004834, -0.6175492, 2.426696, 1, 0, 0, 1, 1,
1.008063, 0.582477, 0.9357225, 1, 0, 0, 1, 1,
1.009939, 1.164435, 1.377151, 1, 0, 0, 1, 1,
1.015035, 1.183016, 1.90669, 0, 0, 0, 1, 1,
1.017111, -0.4270111, 2.965003, 0, 0, 0, 1, 1,
1.021448, -0.6310857, 0.8801448, 0, 0, 0, 1, 1,
1.026619, 0.2722723, 1.413002, 0, 0, 0, 1, 1,
1.039793, -0.1006038, 2.322553, 0, 0, 0, 1, 1,
1.04575, 0.497216, 2.787359, 0, 0, 0, 1, 1,
1.047554, -1.028615, 1.315841, 0, 0, 0, 1, 1,
1.04889, -0.1941603, 1.577071, 1, 1, 1, 1, 1,
1.051442, -0.2354928, 2.307637, 1, 1, 1, 1, 1,
1.051997, -0.755975, 3.069324, 1, 1, 1, 1, 1,
1.053269, -0.2567791, 1.661292, 1, 1, 1, 1, 1,
1.058787, -0.3796726, 1.903418, 1, 1, 1, 1, 1,
1.075778, 0.08521157, 1.674029, 1, 1, 1, 1, 1,
1.081219, 0.3205768, 2.836686, 1, 1, 1, 1, 1,
1.085459, -0.3256454, 1.385263, 1, 1, 1, 1, 1,
1.091872, 0.5646104, 1.413449, 1, 1, 1, 1, 1,
1.093571, -1.116729, 0.7716036, 1, 1, 1, 1, 1,
1.097984, -1.188768, 1.135022, 1, 1, 1, 1, 1,
1.102574, -0.9683636, 2.908103, 1, 1, 1, 1, 1,
1.108187, 1.111125, 1.342399, 1, 1, 1, 1, 1,
1.109243, 0.6009179, 1.426227, 1, 1, 1, 1, 1,
1.109807, 0.5723669, 3.606969, 1, 1, 1, 1, 1,
1.109964, -0.3121327, 0.8833032, 0, 0, 1, 1, 1,
1.111694, 0.1801771, 0.4738442, 1, 0, 0, 1, 1,
1.115487, -1.341442, 2.196121, 1, 0, 0, 1, 1,
1.119961, 0.4935576, 4.230879, 1, 0, 0, 1, 1,
1.120374, -0.1034051, 0.2816767, 1, 0, 0, 1, 1,
1.121813, -1.768323, 2.025907, 1, 0, 0, 1, 1,
1.12885, 1.679809, 0.06080678, 0, 0, 0, 1, 1,
1.130853, -0.08039083, 2.712696, 0, 0, 0, 1, 1,
1.134854, -0.1473867, 1.559561, 0, 0, 0, 1, 1,
1.136464, -1.48865, 2.925181, 0, 0, 0, 1, 1,
1.146537, 0.5175226, 0.2813919, 0, 0, 0, 1, 1,
1.147527, 0.1092797, 0.9060308, 0, 0, 0, 1, 1,
1.155166, 0.617817, 1.72196, 0, 0, 0, 1, 1,
1.160403, -2.962179, 3.077014, 1, 1, 1, 1, 1,
1.164153, -1.400669, 3.007119, 1, 1, 1, 1, 1,
1.165639, 1.138335, 0.9463559, 1, 1, 1, 1, 1,
1.168037, 0.8901873, 2.369104, 1, 1, 1, 1, 1,
1.18596, 1.2403, -0.2151712, 1, 1, 1, 1, 1,
1.190093, -1.019676, 1.617018, 1, 1, 1, 1, 1,
1.190514, -0.2874098, 0.6873664, 1, 1, 1, 1, 1,
1.192476, -0.2227916, 4.164961, 1, 1, 1, 1, 1,
1.202653, 0.3695285, 1.4864, 1, 1, 1, 1, 1,
1.221589, 0.5304779, 1.855536, 1, 1, 1, 1, 1,
1.249757, -1.861701, 2.658406, 1, 1, 1, 1, 1,
1.252165, -0.006042878, 2.348643, 1, 1, 1, 1, 1,
1.253625, -2.666539, 2.157475, 1, 1, 1, 1, 1,
1.258293, -0.2979177, 1.967891, 1, 1, 1, 1, 1,
1.261531, 2.0075, -0.420042, 1, 1, 1, 1, 1,
1.26614, -0.002431029, 0.0003956309, 0, 0, 1, 1, 1,
1.266883, -0.09525178, 0.2574573, 1, 0, 0, 1, 1,
1.27132, -0.2055476, 0.9672342, 1, 0, 0, 1, 1,
1.277683, 0.8026077, -0.2699616, 1, 0, 0, 1, 1,
1.283922, -0.5116397, 0.5567726, 1, 0, 0, 1, 1,
1.286447, -0.5798792, 1.805488, 1, 0, 0, 1, 1,
1.295763, -0.2217581, 2.019933, 0, 0, 0, 1, 1,
1.32, 0.1474778, 1.786477, 0, 0, 0, 1, 1,
1.32863, -0.009498135, -0.6090855, 0, 0, 0, 1, 1,
1.337147, 0.6890082, 2.369924, 0, 0, 0, 1, 1,
1.337515, 0.8481039, 1.999751, 0, 0, 0, 1, 1,
1.33774, -1.789976, 3.015823, 0, 0, 0, 1, 1,
1.340677, -2.530686, 3.287457, 0, 0, 0, 1, 1,
1.342757, 0.7920218, 3.06261, 1, 1, 1, 1, 1,
1.357091, 0.008763839, 1.868065, 1, 1, 1, 1, 1,
1.35763, 1.171592, -0.7844306, 1, 1, 1, 1, 1,
1.379581, -0.1685742, 1.884225, 1, 1, 1, 1, 1,
1.390186, -0.2435762, 3.613082, 1, 1, 1, 1, 1,
1.403178, -1.403023, 3.13258, 1, 1, 1, 1, 1,
1.405088, 0.896468, 0.6561542, 1, 1, 1, 1, 1,
1.406445, 0.411558, 0.803458, 1, 1, 1, 1, 1,
1.410844, -1.286329, 3.261809, 1, 1, 1, 1, 1,
1.412408, 0.3862067, 2.032996, 1, 1, 1, 1, 1,
1.424563, -0.9345077, 2.595112, 1, 1, 1, 1, 1,
1.442577, 1.146505, 0.9192795, 1, 1, 1, 1, 1,
1.444024, 0.5836552, 0.1855725, 1, 1, 1, 1, 1,
1.445314, 0.1110602, 0.7725833, 1, 1, 1, 1, 1,
1.453982, 0.1083511, 1.91114, 1, 1, 1, 1, 1,
1.460935, 0.2293789, 1.080794, 0, 0, 1, 1, 1,
1.469937, -0.8705162, 3.208871, 1, 0, 0, 1, 1,
1.470274, -0.02825701, 3.235716, 1, 0, 0, 1, 1,
1.488571, 0.8173352, 1.298355, 1, 0, 0, 1, 1,
1.491744, -0.2017527, 2.467269, 1, 0, 0, 1, 1,
1.500934, -1.156607, 0.8254195, 1, 0, 0, 1, 1,
1.501114, 1.6177, 1.852649, 0, 0, 0, 1, 1,
1.514638, 0.999748, 1.586213, 0, 0, 0, 1, 1,
1.51537, 0.9510576, 0.9290428, 0, 0, 0, 1, 1,
1.517216, 0.3768196, 2.458217, 0, 0, 0, 1, 1,
1.519795, -0.6827753, 1.337039, 0, 0, 0, 1, 1,
1.522947, 0.2498364, 2.116625, 0, 0, 0, 1, 1,
1.532363, 1.022822, 3.552728, 0, 0, 0, 1, 1,
1.538832, -1.254143, 2.362249, 1, 1, 1, 1, 1,
1.544388, -1.264011, 2.705256, 1, 1, 1, 1, 1,
1.544549, -0.06439923, 1.510305, 1, 1, 1, 1, 1,
1.548326, 0.3466282, 1.758471, 1, 1, 1, 1, 1,
1.550206, -1.055917, 3.045257, 1, 1, 1, 1, 1,
1.56836, 0.9570002, 1.028238, 1, 1, 1, 1, 1,
1.571101, 0.9561967, 2.297027, 1, 1, 1, 1, 1,
1.579173, -0.8404552, 1.887505, 1, 1, 1, 1, 1,
1.580404, 0.7082331, 3.488244, 1, 1, 1, 1, 1,
1.582445, 0.9953824, -1.347088, 1, 1, 1, 1, 1,
1.584791, -0.6679561, 0.7638655, 1, 1, 1, 1, 1,
1.601096, -1.07522, 1.974704, 1, 1, 1, 1, 1,
1.610041, 0.4777307, 0.7841961, 1, 1, 1, 1, 1,
1.611386, 0.1042006, 2.137788, 1, 1, 1, 1, 1,
1.617827, 0.306741, 1.638665, 1, 1, 1, 1, 1,
1.645197, 0.7010496, -1.042915, 0, 0, 1, 1, 1,
1.651247, 0.029583, 0.005543641, 1, 0, 0, 1, 1,
1.655309, -0.819521, 3.160633, 1, 0, 0, 1, 1,
1.669607, -0.9190071, 1.413841, 1, 0, 0, 1, 1,
1.677288, 0.5740155, -0.008070556, 1, 0, 0, 1, 1,
1.689165, 0.59089, 2.072075, 1, 0, 0, 1, 1,
1.720053, -0.7414538, 2.111208, 0, 0, 0, 1, 1,
1.726979, -1.216249, 2.931935, 0, 0, 0, 1, 1,
1.734033, -0.6012341, 1.729138, 0, 0, 0, 1, 1,
1.735636, -1.033175, 0.2010388, 0, 0, 0, 1, 1,
1.75566, -0.9892585, 3.840768, 0, 0, 0, 1, 1,
1.76242, 0.2588345, 0.9006807, 0, 0, 0, 1, 1,
1.77911, -0.8446961, 0.7950878, 0, 0, 0, 1, 1,
1.783773, -0.2060585, 3.705082, 1, 1, 1, 1, 1,
1.787449, -0.2501892, 2.335119, 1, 1, 1, 1, 1,
1.790321, -0.2323196, 2.533072, 1, 1, 1, 1, 1,
1.802667, 1.434581, 0.8220527, 1, 1, 1, 1, 1,
1.824095, 0.05543217, 1.54332, 1, 1, 1, 1, 1,
1.85364, 1.607583, 0.8551431, 1, 1, 1, 1, 1,
1.857635, 1.078213, 0.2757211, 1, 1, 1, 1, 1,
1.860854, -0.3869154, 1.157556, 1, 1, 1, 1, 1,
1.875344, 1.946097, 1.623989, 1, 1, 1, 1, 1,
1.884658, -0.8734836, 1.262365, 1, 1, 1, 1, 1,
1.89375, 0.1590863, 2.424907, 1, 1, 1, 1, 1,
1.90152, 0.9128661, 0.8057817, 1, 1, 1, 1, 1,
1.907881, 2.073917, 1.680631, 1, 1, 1, 1, 1,
1.919619, -0.5815548, 0.009387011, 1, 1, 1, 1, 1,
1.934857, 2.227296, 0.9751052, 1, 1, 1, 1, 1,
1.957544, -1.129686, 1.921995, 0, 0, 1, 1, 1,
1.962114, 0.9679399, 1.446935, 1, 0, 0, 1, 1,
1.96883, 0.4192779, 1.157871, 1, 0, 0, 1, 1,
1.972751, -0.01646214, 1.153332, 1, 0, 0, 1, 1,
1.98138, -0.7925761, 2.1574, 1, 0, 0, 1, 1,
2.029114, -1.285065, 3.365977, 1, 0, 0, 1, 1,
2.032053, 1.098546, 2.424812, 0, 0, 0, 1, 1,
2.035753, -0.5813724, 1.445541, 0, 0, 0, 1, 1,
2.125836, -0.6771285, 1.37682, 0, 0, 0, 1, 1,
2.325246, 0.5874931, 1.850545, 0, 0, 0, 1, 1,
2.332194, 0.0224929, 1.96664, 0, 0, 0, 1, 1,
2.374763, 0.1002431, 0.02841664, 0, 0, 0, 1, 1,
2.41292, 1.0885, 0.4308257, 0, 0, 0, 1, 1,
2.536852, 0.1482477, 1.379416, 1, 1, 1, 1, 1,
2.638725, -0.069185, 1.244401, 1, 1, 1, 1, 1,
2.730183, -0.4823233, 2.351997, 1, 1, 1, 1, 1,
2.76322, -0.4048693, 2.332572, 1, 1, 1, 1, 1,
3.040889, -0.1681749, 3.938407, 1, 1, 1, 1, 1,
3.087042, -0.07096907, 2.67416, 1, 1, 1, 1, 1,
3.414119, -0.3919211, 1.85282, 1, 1, 1, 1, 1
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
var radius = 9.348049;
var distance = 32.83463;
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
mvMatrix.translate( -0.2732526, 0.107193, 0.2689202 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.83463);
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
