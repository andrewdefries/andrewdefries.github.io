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
-2.911095, -0.1471398, -1.423063, 1, 0, 0, 1,
-2.80024, -0.0008134485, -0.5424694, 1, 0.007843138, 0, 1,
-2.765486, -0.5822952, -3.514189, 1, 0.01176471, 0, 1,
-2.713792, -1.174168, -3.461524, 1, 0.01960784, 0, 1,
-2.607392, 0.2211882, -1.774882, 1, 0.02352941, 0, 1,
-2.541474, 0.638617, 0.1856529, 1, 0.03137255, 0, 1,
-2.392531, 1.733762, 2.091861, 1, 0.03529412, 0, 1,
-2.387185, 0.2272598, -1.089754, 1, 0.04313726, 0, 1,
-2.380196, -0.3135185, -3.13719, 1, 0.04705882, 0, 1,
-2.236638, 0.57112, 1.086612, 1, 0.05490196, 0, 1,
-2.206065, 0.3698139, -2.200943, 1, 0.05882353, 0, 1,
-2.186134, -1.21688, -1.792662, 1, 0.06666667, 0, 1,
-2.077211, -0.3444657, -1.130664, 1, 0.07058824, 0, 1,
-2.067072, -1.119182, -1.825225, 1, 0.07843138, 0, 1,
-2.011765, -0.8114235, -0.9974635, 1, 0.08235294, 0, 1,
-2.001475, -1.130369, -1.060224, 1, 0.09019608, 0, 1,
-1.998979, -0.7015232, -1.229106, 1, 0.09411765, 0, 1,
-1.993356, -0.5001276, -0.7618753, 1, 0.1019608, 0, 1,
-1.991396, -0.9370845, -1.518018, 1, 0.1098039, 0, 1,
-1.984298, 0.409457, -2.578307, 1, 0.1137255, 0, 1,
-1.982903, -0.2225991, -1.760381, 1, 0.1215686, 0, 1,
-1.918876, 0.250516, -1.380983, 1, 0.1254902, 0, 1,
-1.909596, 0.5151529, -0.2817726, 1, 0.1333333, 0, 1,
-1.888611, 0.8067634, -2.236769, 1, 0.1372549, 0, 1,
-1.86267, 0.6072125, -1.139052, 1, 0.145098, 0, 1,
-1.86002, 1.664977, -1.456491, 1, 0.1490196, 0, 1,
-1.845605, 0.348223, -2.197482, 1, 0.1568628, 0, 1,
-1.840624, -0.1924513, -1.601655, 1, 0.1607843, 0, 1,
-1.829186, 0.6326306, -1.097447, 1, 0.1686275, 0, 1,
-1.82786, 0.3398616, -1.301529, 1, 0.172549, 0, 1,
-1.814249, 0.2195475, -2.299952, 1, 0.1803922, 0, 1,
-1.796511, 1.113606, -2.257146, 1, 0.1843137, 0, 1,
-1.785672, 1.530352, -2.260029, 1, 0.1921569, 0, 1,
-1.763886, -0.6440907, -3.756131, 1, 0.1960784, 0, 1,
-1.762058, 1.476688, -1.396871, 1, 0.2039216, 0, 1,
-1.751902, 0.05455627, -3.12222, 1, 0.2117647, 0, 1,
-1.719639, 0.2869671, -1.48396, 1, 0.2156863, 0, 1,
-1.716704, 0.7017594, -2.096056, 1, 0.2235294, 0, 1,
-1.702685, -1.59037, -0.7348539, 1, 0.227451, 0, 1,
-1.699759, -0.3000699, -0.5844379, 1, 0.2352941, 0, 1,
-1.686216, -0.2060492, -1.142013, 1, 0.2392157, 0, 1,
-1.678877, 0.02232783, -1.415752, 1, 0.2470588, 0, 1,
-1.677674, 0.5638993, -1.638399, 1, 0.2509804, 0, 1,
-1.664986, -0.5366728, -1.825353, 1, 0.2588235, 0, 1,
-1.661153, 0.1496232, -2.444251, 1, 0.2627451, 0, 1,
-1.64048, -0.9175555, -1.732296, 1, 0.2705882, 0, 1,
-1.633555, -1.173394, -2.248534, 1, 0.2745098, 0, 1,
-1.62609, -0.2002374, -1.58119, 1, 0.282353, 0, 1,
-1.61664, -0.8087118, -2.095398, 1, 0.2862745, 0, 1,
-1.61203, 1.988552, -1.965919, 1, 0.2941177, 0, 1,
-1.588662, -1.765442, -3.404378, 1, 0.3019608, 0, 1,
-1.573324, -1.874659, -3.270222, 1, 0.3058824, 0, 1,
-1.573318, -0.8770508, -3.172473, 1, 0.3137255, 0, 1,
-1.549816, 1.632053, -0.2913994, 1, 0.3176471, 0, 1,
-1.542454, 0.1917786, -0.9610018, 1, 0.3254902, 0, 1,
-1.533466, -2.056292, -1.406466, 1, 0.3294118, 0, 1,
-1.520167, -0.3131171, -2.900279, 1, 0.3372549, 0, 1,
-1.52004, 0.3009097, -1.247453, 1, 0.3411765, 0, 1,
-1.504893, 1.162168, -0.4506882, 1, 0.3490196, 0, 1,
-1.492568, 0.4300964, -2.449246, 1, 0.3529412, 0, 1,
-1.492053, -0.3415089, -0.6380749, 1, 0.3607843, 0, 1,
-1.484354, 1.647713, -1.798409, 1, 0.3647059, 0, 1,
-1.479714, -0.8420681, -2.631373, 1, 0.372549, 0, 1,
-1.479192, 0.5170988, -1.556119, 1, 0.3764706, 0, 1,
-1.478389, -1.687222, -2.894721, 1, 0.3843137, 0, 1,
-1.464529, 1.403289, 0.1849753, 1, 0.3882353, 0, 1,
-1.458857, -0.6886859, -3.244539, 1, 0.3960784, 0, 1,
-1.442965, 0.3365059, -1.500266, 1, 0.4039216, 0, 1,
-1.440985, 0.1192258, -2.781892, 1, 0.4078431, 0, 1,
-1.433901, -0.6841055, -2.654121, 1, 0.4156863, 0, 1,
-1.425799, -0.9331638, 0.2077648, 1, 0.4196078, 0, 1,
-1.413761, -0.279637, -1.184314, 1, 0.427451, 0, 1,
-1.41029, 0.03474369, 0.9453373, 1, 0.4313726, 0, 1,
-1.404792, 1.897953, -0.02972833, 1, 0.4392157, 0, 1,
-1.400833, -0.5121329, -3.449305, 1, 0.4431373, 0, 1,
-1.39975, -0.7565575, -2.372621, 1, 0.4509804, 0, 1,
-1.3747, -0.4886245, -2.167182, 1, 0.454902, 0, 1,
-1.372887, 0.6726331, -1.622762, 1, 0.4627451, 0, 1,
-1.360118, 0.1769094, -2.56855, 1, 0.4666667, 0, 1,
-1.350135, 0.7995149, -0.5792496, 1, 0.4745098, 0, 1,
-1.345887, 0.3535146, -0.2422607, 1, 0.4784314, 0, 1,
-1.343928, 0.7700199, -0.5907768, 1, 0.4862745, 0, 1,
-1.337696, 1.538631, -0.6045215, 1, 0.4901961, 0, 1,
-1.334119, 0.5221117, -0.9745876, 1, 0.4980392, 0, 1,
-1.325418, -0.6221489, -2.770046, 1, 0.5058824, 0, 1,
-1.321384, -1.403477, -2.291028, 1, 0.509804, 0, 1,
-1.317146, -1.037052, -3.097852, 1, 0.5176471, 0, 1,
-1.301526, 0.2499217, -1.441263, 1, 0.5215687, 0, 1,
-1.295094, 0.5404981, -1.12897, 1, 0.5294118, 0, 1,
-1.291438, 0.9226335, 1.087584, 1, 0.5333334, 0, 1,
-1.289273, 0.9404901, -1.410942, 1, 0.5411765, 0, 1,
-1.277503, -1.80478, -3.915717, 1, 0.5450981, 0, 1,
-1.277011, -0.4154587, -1.929231, 1, 0.5529412, 0, 1,
-1.274514, -0.8009315, -1.908791, 1, 0.5568628, 0, 1,
-1.270041, -1.871773, -0.7075027, 1, 0.5647059, 0, 1,
-1.270022, 0.519336, -0.5821567, 1, 0.5686275, 0, 1,
-1.265827, 0.7191783, 0.9027754, 1, 0.5764706, 0, 1,
-1.262517, -0.0947074, -1.024215, 1, 0.5803922, 0, 1,
-1.262129, 0.6305574, -1.257655, 1, 0.5882353, 0, 1,
-1.258263, 0.1996889, -0.6081764, 1, 0.5921569, 0, 1,
-1.24623, -1.084995, -3.243571, 1, 0.6, 0, 1,
-1.238029, 1.135499, -0.2133783, 1, 0.6078432, 0, 1,
-1.221691, -0.6974065, -0.5327974, 1, 0.6117647, 0, 1,
-1.218367, -1.308194, -0.7300118, 1, 0.6196079, 0, 1,
-1.211089, 1.665814, -0.8917489, 1, 0.6235294, 0, 1,
-1.191164, -0.8127972, -1.076231, 1, 0.6313726, 0, 1,
-1.191151, 0.291935, -0.4803216, 1, 0.6352941, 0, 1,
-1.183881, 0.6840582, -1.147921, 1, 0.6431373, 0, 1,
-1.181867, -0.2792965, -2.221566, 1, 0.6470588, 0, 1,
-1.171441, 1.535903, 0.411842, 1, 0.654902, 0, 1,
-1.163506, 1.058627, -1.344703, 1, 0.6588235, 0, 1,
-1.160623, 0.3707191, -0.3456898, 1, 0.6666667, 0, 1,
-1.158505, 0.8467944, -1.29684, 1, 0.6705883, 0, 1,
-1.158434, 0.2279514, -3.660338, 1, 0.6784314, 0, 1,
-1.152097, -0.8182649, -2.142565, 1, 0.682353, 0, 1,
-1.142852, -0.7773301, -0.4404884, 1, 0.6901961, 0, 1,
-1.142294, -0.7290008, -4.536763, 1, 0.6941177, 0, 1,
-1.142061, 0.04278682, -2.580802, 1, 0.7019608, 0, 1,
-1.141511, 0.9724121, 0.6764916, 1, 0.7098039, 0, 1,
-1.141399, 0.5031031, -1.332937, 1, 0.7137255, 0, 1,
-1.126938, 0.2652283, -1.880755, 1, 0.7215686, 0, 1,
-1.12517, -0.9081355, -3.749326, 1, 0.7254902, 0, 1,
-1.117019, -0.9318168, -3.166501, 1, 0.7333333, 0, 1,
-1.108071, 0.5385199, -3.104565, 1, 0.7372549, 0, 1,
-1.107872, 0.07425896, -1.843993, 1, 0.7450981, 0, 1,
-1.106885, -0.3294434, -2.17434, 1, 0.7490196, 0, 1,
-1.096859, 0.2698761, -2.033761, 1, 0.7568628, 0, 1,
-1.094193, 0.220219, -0.04403386, 1, 0.7607843, 0, 1,
-1.094119, 0.924369, -0.3994004, 1, 0.7686275, 0, 1,
-1.085745, -1.243524, -3.229669, 1, 0.772549, 0, 1,
-1.079992, -1.366449, -1.819041, 1, 0.7803922, 0, 1,
-1.057857, -0.2850399, -3.003881, 1, 0.7843137, 0, 1,
-1.048787, 1.460142, -0.4744547, 1, 0.7921569, 0, 1,
-1.047944, 0.7484425, 0.6725978, 1, 0.7960784, 0, 1,
-1.04486, -1.354632, -4.59934, 1, 0.8039216, 0, 1,
-1.042415, -0.8066742, -1.595173, 1, 0.8117647, 0, 1,
-1.041479, 0.1734234, -1.739887, 1, 0.8156863, 0, 1,
-1.038951, -0.4129044, -2.616789, 1, 0.8235294, 0, 1,
-1.029997, 0.7875916, -1.225758, 1, 0.827451, 0, 1,
-1.023964, -0.9508693, -1.938924, 1, 0.8352941, 0, 1,
-1.022216, 0.5250452, -1.356804, 1, 0.8392157, 0, 1,
-1.021068, -0.5712548, -2.278429, 1, 0.8470588, 0, 1,
-1.013881, -1.882816, -2.502214, 1, 0.8509804, 0, 1,
-1.013727, -0.6945438, -2.399263, 1, 0.8588235, 0, 1,
-1.008391, -0.1119152, -0.851291, 1, 0.8627451, 0, 1,
-1.001741, -0.3448328, -1.214925, 1, 0.8705882, 0, 1,
-0.9973022, 1.051466, -0.3609382, 1, 0.8745098, 0, 1,
-0.9971915, 0.3021465, -1.614465, 1, 0.8823529, 0, 1,
-0.9969418, 0.9030042, 0.8362764, 1, 0.8862745, 0, 1,
-0.9943897, -1.025924, -1.622242, 1, 0.8941177, 0, 1,
-0.9882625, 0.3885142, -0.1722682, 1, 0.8980392, 0, 1,
-0.9872431, 0.05944791, 0.26135, 1, 0.9058824, 0, 1,
-0.9870752, -0.07081773, -1.996016, 1, 0.9137255, 0, 1,
-0.9861637, 0.2702846, -1.837458, 1, 0.9176471, 0, 1,
-0.9847226, 0.02753386, -2.720205, 1, 0.9254902, 0, 1,
-0.9797623, -2.141223, -1.269568, 1, 0.9294118, 0, 1,
-0.9786245, 1.784989, 0.6670981, 1, 0.9372549, 0, 1,
-0.9685158, -0.800223, -1.672177, 1, 0.9411765, 0, 1,
-0.9609982, -1.035483, -0.8437819, 1, 0.9490196, 0, 1,
-0.9597625, -0.3844201, -2.252831, 1, 0.9529412, 0, 1,
-0.9554093, 0.1765238, -3.228861, 1, 0.9607843, 0, 1,
-0.9553325, 0.9436272, 0.75423, 1, 0.9647059, 0, 1,
-0.9551696, 1.796616, -0.1785305, 1, 0.972549, 0, 1,
-0.9537545, 0.07549716, -2.353882, 1, 0.9764706, 0, 1,
-0.9355103, -0.4441375, -1.830744, 1, 0.9843137, 0, 1,
-0.9316002, 0.4757512, -1.843903, 1, 0.9882353, 0, 1,
-0.9289237, 1.698591, -0.3518426, 1, 0.9960784, 0, 1,
-0.9245427, -1.726089, -2.475993, 0.9960784, 1, 0, 1,
-0.9203301, 1.38301, 0.5668764, 0.9921569, 1, 0, 1,
-0.9136306, -0.23991, -1.366704, 0.9843137, 1, 0, 1,
-0.9100337, 1.252824, 2.09479, 0.9803922, 1, 0, 1,
-0.9093024, -0.8214651, -1.836516, 0.972549, 1, 0, 1,
-0.9091244, -0.8033493, -1.053951, 0.9686275, 1, 0, 1,
-0.9055445, -0.1391808, -1.535843, 0.9607843, 1, 0, 1,
-0.9054004, 1.849445, 0.05148846, 0.9568627, 1, 0, 1,
-0.9033217, -1.001311, -3.206664, 0.9490196, 1, 0, 1,
-0.8972938, 2.439693, -1.670081, 0.945098, 1, 0, 1,
-0.8970856, -1.373113, -3.248168, 0.9372549, 1, 0, 1,
-0.896195, -0.9277076, 0.1745774, 0.9333333, 1, 0, 1,
-0.8951007, 0.5335949, -0.3351778, 0.9254902, 1, 0, 1,
-0.8937057, -1.084184, -2.793014, 0.9215686, 1, 0, 1,
-0.890403, 0.3770429, -2.696278, 0.9137255, 1, 0, 1,
-0.8863429, -0.1371274, -1.929706, 0.9098039, 1, 0, 1,
-0.8827736, 0.9768065, -0.6847106, 0.9019608, 1, 0, 1,
-0.882664, 0.215716, -3.057812, 0.8941177, 1, 0, 1,
-0.8786466, -0.4428873, -1.940631, 0.8901961, 1, 0, 1,
-0.8778788, 0.8217531, -0.04197984, 0.8823529, 1, 0, 1,
-0.8623518, 1.315599, -1.467277, 0.8784314, 1, 0, 1,
-0.8618023, 0.03903041, -1.773338, 0.8705882, 1, 0, 1,
-0.8601173, 0.234752, -1.867518, 0.8666667, 1, 0, 1,
-0.8560494, 1.240314, -1.237521, 0.8588235, 1, 0, 1,
-0.8502863, -1.116764, -2.822045, 0.854902, 1, 0, 1,
-0.8446491, 1.188295, -1.359714, 0.8470588, 1, 0, 1,
-0.8443231, 1.179709, -1.452986, 0.8431373, 1, 0, 1,
-0.8442094, -0.01537725, -0.8555608, 0.8352941, 1, 0, 1,
-0.8432882, -1.093156, -2.222667, 0.8313726, 1, 0, 1,
-0.8402296, 0.01123301, -1.76603, 0.8235294, 1, 0, 1,
-0.8312492, -0.5798114, -3.175923, 0.8196079, 1, 0, 1,
-0.8261983, -0.01733475, -0.8264325, 0.8117647, 1, 0, 1,
-0.8254724, 0.9370242, -0.1018074, 0.8078431, 1, 0, 1,
-0.8211669, -0.02032506, -1.836847, 0.8, 1, 0, 1,
-0.8191914, 0.137035, -2.461893, 0.7921569, 1, 0, 1,
-0.8180008, -1.322196, -2.12369, 0.7882353, 1, 0, 1,
-0.8088263, 0.4060713, -1.720512, 0.7803922, 1, 0, 1,
-0.8082118, -0.5572771, -2.801592, 0.7764706, 1, 0, 1,
-0.8028659, 1.871384, -1.079614, 0.7686275, 1, 0, 1,
-0.79637, 0.3196199, -1.026091, 0.7647059, 1, 0, 1,
-0.7912754, 1.849293, -1.000172, 0.7568628, 1, 0, 1,
-0.7882392, 0.7778895, -0.9570161, 0.7529412, 1, 0, 1,
-0.7864215, -0.533358, -3.51632, 0.7450981, 1, 0, 1,
-0.7846822, 0.04417735, -2.125435, 0.7411765, 1, 0, 1,
-0.7813637, -0.4404979, -2.4791, 0.7333333, 1, 0, 1,
-0.7783839, 1.284147, -0.5818795, 0.7294118, 1, 0, 1,
-0.7774909, -0.5834575, -3.795232, 0.7215686, 1, 0, 1,
-0.7756197, 0.6385573, -2.248111, 0.7176471, 1, 0, 1,
-0.7735251, -0.2780789, -1.708787, 0.7098039, 1, 0, 1,
-0.7726616, -0.8368605, -0.8234714, 0.7058824, 1, 0, 1,
-0.7704238, -0.6884038, -2.806657, 0.6980392, 1, 0, 1,
-0.7665574, -0.08281543, -1.632628, 0.6901961, 1, 0, 1,
-0.7629297, -1.110993, -3.417675, 0.6862745, 1, 0, 1,
-0.7580585, 1.056586, -0.7049161, 0.6784314, 1, 0, 1,
-0.7553641, 1.609488, 1.002291, 0.6745098, 1, 0, 1,
-0.7547207, 0.4487644, 1.848694, 0.6666667, 1, 0, 1,
-0.753929, -1.552714, -2.294295, 0.6627451, 1, 0, 1,
-0.7527016, 0.2681394, -2.470012, 0.654902, 1, 0, 1,
-0.7515538, -0.7492368, -3.064185, 0.6509804, 1, 0, 1,
-0.7436967, 0.2931947, -1.743085, 0.6431373, 1, 0, 1,
-0.7392461, -0.131546, 0.4763695, 0.6392157, 1, 0, 1,
-0.7374312, -0.4120009, -2.101958, 0.6313726, 1, 0, 1,
-0.7304909, 0.02688719, -0.2289781, 0.627451, 1, 0, 1,
-0.7279201, 1.078418, -0.5727115, 0.6196079, 1, 0, 1,
-0.7270914, 0.9701338, -0.01487899, 0.6156863, 1, 0, 1,
-0.7268226, -0.8556249, -2.132481, 0.6078432, 1, 0, 1,
-0.7251109, -0.724048, -0.6110187, 0.6039216, 1, 0, 1,
-0.714443, -0.2036835, -1.745289, 0.5960785, 1, 0, 1,
-0.7062441, -0.3958526, -2.000767, 0.5882353, 1, 0, 1,
-0.7044386, 1.344094, -1.289506, 0.5843138, 1, 0, 1,
-0.7020604, -1.222301, -2.228328, 0.5764706, 1, 0, 1,
-0.6999277, 0.4859792, -1.088215, 0.572549, 1, 0, 1,
-0.6982586, 0.7432796, -0.2247902, 0.5647059, 1, 0, 1,
-0.6970963, 0.1903818, -1.361362, 0.5607843, 1, 0, 1,
-0.6957994, 0.8812344, 0.09166006, 0.5529412, 1, 0, 1,
-0.6945978, -0.6376752, -1.827223, 0.5490196, 1, 0, 1,
-0.6930062, 0.747909, -1.476131, 0.5411765, 1, 0, 1,
-0.6866462, -2.245837, -3.837236, 0.5372549, 1, 0, 1,
-0.682012, -0.333556, -2.021888, 0.5294118, 1, 0, 1,
-0.6741185, -1.396679, -2.219064, 0.5254902, 1, 0, 1,
-0.6721717, 0.3116398, -1.17147, 0.5176471, 1, 0, 1,
-0.6703485, -0.257017, -2.747937, 0.5137255, 1, 0, 1,
-0.6654392, -0.3447769, -2.917781, 0.5058824, 1, 0, 1,
-0.6569976, -0.5133025, -2.771425, 0.5019608, 1, 0, 1,
-0.6556656, 0.4132914, -0.8489756, 0.4941176, 1, 0, 1,
-0.6500698, -0.1333894, -2.37832, 0.4862745, 1, 0, 1,
-0.6465929, 0.2542474, -1.34799, 0.4823529, 1, 0, 1,
-0.6457949, 0.7478893, -1.205917, 0.4745098, 1, 0, 1,
-0.6454012, -0.8686607, -5.110085, 0.4705882, 1, 0, 1,
-0.6414174, 0.6348731, -1.624127, 0.4627451, 1, 0, 1,
-0.6407557, 0.8189185, 0.4527121, 0.4588235, 1, 0, 1,
-0.6398902, 0.1543954, -1.75181, 0.4509804, 1, 0, 1,
-0.6335574, -0.7706118, -2.366461, 0.4470588, 1, 0, 1,
-0.6321005, -0.7789583, -2.480028, 0.4392157, 1, 0, 1,
-0.6288384, -0.855879, -2.782729, 0.4352941, 1, 0, 1,
-0.6284076, 0.8504641, -1.389158, 0.427451, 1, 0, 1,
-0.6107649, 1.635107, 0.4295905, 0.4235294, 1, 0, 1,
-0.6056394, 0.7115662, 0.210529, 0.4156863, 1, 0, 1,
-0.6028317, -0.5571684, -1.427125, 0.4117647, 1, 0, 1,
-0.6028035, -0.6882994, -2.896593, 0.4039216, 1, 0, 1,
-0.6010592, -1.596057, -1.608874, 0.3960784, 1, 0, 1,
-0.598534, 0.6190107, -2.790741, 0.3921569, 1, 0, 1,
-0.5963495, 1.131667, -0.6999983, 0.3843137, 1, 0, 1,
-0.5949174, 1.308539, -0.6848901, 0.3803922, 1, 0, 1,
-0.5948281, -0.4721428, 0.03678409, 0.372549, 1, 0, 1,
-0.5887082, -0.6892827, -3.237915, 0.3686275, 1, 0, 1,
-0.5873621, 0.1995681, -1.143984, 0.3607843, 1, 0, 1,
-0.5870362, 0.2907025, -3.07209, 0.3568628, 1, 0, 1,
-0.5812945, -3.00631, -0.7388813, 0.3490196, 1, 0, 1,
-0.5798223, -0.04088224, -1.793953, 0.345098, 1, 0, 1,
-0.5785863, 0.08426776, 0.07240046, 0.3372549, 1, 0, 1,
-0.5726168, -0.5180013, -1.246741, 0.3333333, 1, 0, 1,
-0.5703603, -0.5824088, -0.3064435, 0.3254902, 1, 0, 1,
-0.5686855, 1.139489, -0.6855673, 0.3215686, 1, 0, 1,
-0.560929, 0.2047903, -0.2508332, 0.3137255, 1, 0, 1,
-0.5602705, 0.3530714, 0.4563754, 0.3098039, 1, 0, 1,
-0.5573505, -0.05418708, -1.189005, 0.3019608, 1, 0, 1,
-0.5571583, 1.767038, -1.185381, 0.2941177, 1, 0, 1,
-0.5487344, 1.482727, -0.8076499, 0.2901961, 1, 0, 1,
-0.5419264, 0.8449508, 1.260729, 0.282353, 1, 0, 1,
-0.5410714, -1.522211, -0.8409976, 0.2784314, 1, 0, 1,
-0.5371766, 1.10428, -1.536228, 0.2705882, 1, 0, 1,
-0.5325138, 0.3360854, -0.264042, 0.2666667, 1, 0, 1,
-0.5323129, 0.2412379, -1.270015, 0.2588235, 1, 0, 1,
-0.5313908, 0.8781524, -2.143957, 0.254902, 1, 0, 1,
-0.5271143, -0.5268379, -2.106582, 0.2470588, 1, 0, 1,
-0.51894, 0.9575937, -1.950853, 0.2431373, 1, 0, 1,
-0.5151693, 2.68059, -1.103442, 0.2352941, 1, 0, 1,
-0.5076267, 0.1527711, -2.280361, 0.2313726, 1, 0, 1,
-0.5075864, 0.8026239, -1.263579, 0.2235294, 1, 0, 1,
-0.4989305, -0.1200392, -2.298806, 0.2196078, 1, 0, 1,
-0.4984998, -0.3807487, -1.076535, 0.2117647, 1, 0, 1,
-0.4970874, 0.760226, -1.255711, 0.2078431, 1, 0, 1,
-0.4952259, 0.211715, 0.3838674, 0.2, 1, 0, 1,
-0.4949034, -1.029481, -3.609419, 0.1921569, 1, 0, 1,
-0.48725, 0.4315844, -1.432178, 0.1882353, 1, 0, 1,
-0.4871562, 0.9945079, -0.4343632, 0.1803922, 1, 0, 1,
-0.4809184, 0.4948449, -1.417049, 0.1764706, 1, 0, 1,
-0.4782793, 0.5609329, -0.451723, 0.1686275, 1, 0, 1,
-0.4774725, 1.128046, -1.794842, 0.1647059, 1, 0, 1,
-0.4773737, -0.753637, -2.667101, 0.1568628, 1, 0, 1,
-0.476668, -1.304942, -2.875628, 0.1529412, 1, 0, 1,
-0.4733594, -1.68001, -2.180012, 0.145098, 1, 0, 1,
-0.4716153, -1.29279, -3.730263, 0.1411765, 1, 0, 1,
-0.4712024, 0.3530621, 0.4982253, 0.1333333, 1, 0, 1,
-0.4708081, -0.5015845, -0.2412185, 0.1294118, 1, 0, 1,
-0.4658573, -1.02797, -1.58041, 0.1215686, 1, 0, 1,
-0.465602, -0.2226893, -3.025322, 0.1176471, 1, 0, 1,
-0.4650195, 0.946519, 0.2092079, 0.1098039, 1, 0, 1,
-0.4639013, 1.316527, 0.423829, 0.1058824, 1, 0, 1,
-0.4619806, 0.03591752, 1.042382, 0.09803922, 1, 0, 1,
-0.4586163, 0.9224412, -1.756237, 0.09019608, 1, 0, 1,
-0.4538857, -1.314617, -2.559407, 0.08627451, 1, 0, 1,
-0.4536785, -0.6482763, -1.658612, 0.07843138, 1, 0, 1,
-0.4504589, 0.4843285, 1.834752, 0.07450981, 1, 0, 1,
-0.4457662, 0.3055091, -3.196787, 0.06666667, 1, 0, 1,
-0.4445754, -0.6888472, -0.3643072, 0.0627451, 1, 0, 1,
-0.4308858, -0.7318553, -2.904349, 0.05490196, 1, 0, 1,
-0.4265883, 0.849294, -0.5177374, 0.05098039, 1, 0, 1,
-0.4254509, -0.5937819, -2.76972, 0.04313726, 1, 0, 1,
-0.4099905, -0.4068978, -3.665835, 0.03921569, 1, 0, 1,
-0.4099559, -0.066369, -2.188289, 0.03137255, 1, 0, 1,
-0.4090998, -0.550335, -3.115726, 0.02745098, 1, 0, 1,
-0.4076378, 0.8541459, -0.289694, 0.01960784, 1, 0, 1,
-0.4018639, 0.1047792, -2.380548, 0.01568628, 1, 0, 1,
-0.4016243, -0.3343586, -2.089352, 0.007843138, 1, 0, 1,
-0.4005551, 0.2668532, -2.06063, 0.003921569, 1, 0, 1,
-0.3928863, -1.060714, -2.841013, 0, 1, 0.003921569, 1,
-0.3922107, -0.3004007, -5.127784, 0, 1, 0.01176471, 1,
-0.390916, 1.477971, 2.455041, 0, 1, 0.01568628, 1,
-0.3908484, 0.8948843, 1.040167, 0, 1, 0.02352941, 1,
-0.390714, -1.155572, -3.807995, 0, 1, 0.02745098, 1,
-0.3892388, -1.039929, -4.602149, 0, 1, 0.03529412, 1,
-0.3883417, 0.004136365, 0.2725733, 0, 1, 0.03921569, 1,
-0.386376, -1.567648, -3.554067, 0, 1, 0.04705882, 1,
-0.3860242, -1.46362, -1.69167, 0, 1, 0.05098039, 1,
-0.3853099, 0.01431472, -1.34768, 0, 1, 0.05882353, 1,
-0.3846235, -0.1296984, -0.8267951, 0, 1, 0.0627451, 1,
-0.3786405, 0.1279785, -1.522307, 0, 1, 0.07058824, 1,
-0.376504, -0.7178859, -3.641972, 0, 1, 0.07450981, 1,
-0.3733103, -1.447146, -4.153333, 0, 1, 0.08235294, 1,
-0.371668, 0.08984247, 0.7236695, 0, 1, 0.08627451, 1,
-0.3678468, 0.6387644, -1.849339, 0, 1, 0.09411765, 1,
-0.3666137, -0.8642153, -2.431374, 0, 1, 0.1019608, 1,
-0.3659897, -0.5775356, -2.034347, 0, 1, 0.1058824, 1,
-0.3626218, 0.1815279, -0.5939109, 0, 1, 0.1137255, 1,
-0.3582123, 0.7797678, -0.9549114, 0, 1, 0.1176471, 1,
-0.3520051, 0.2305803, -1.403103, 0, 1, 0.1254902, 1,
-0.351929, 0.709899, 0.05407712, 0, 1, 0.1294118, 1,
-0.3516352, -0.1648498, -2.453585, 0, 1, 0.1372549, 1,
-0.3472292, 1.256492, -1.119069, 0, 1, 0.1411765, 1,
-0.3427965, 1.855276, 2.200989, 0, 1, 0.1490196, 1,
-0.3427282, -0.2872903, -2.47366, 0, 1, 0.1529412, 1,
-0.3377753, 0.6552029, -0.3181492, 0, 1, 0.1607843, 1,
-0.3376, 0.8362309, -0.783053, 0, 1, 0.1647059, 1,
-0.3348703, 1.272133, -0.9846991, 0, 1, 0.172549, 1,
-0.3338681, -0.4790575, -3.02614, 0, 1, 0.1764706, 1,
-0.333558, -0.7509675, -4.147346, 0, 1, 0.1843137, 1,
-0.3335139, 1.377714, -2.414592, 0, 1, 0.1882353, 1,
-0.3325855, 1.454454, 0.9463677, 0, 1, 0.1960784, 1,
-0.3303292, 0.3830713, -0.03718685, 0, 1, 0.2039216, 1,
-0.3285412, -1.556967, -3.243023, 0, 1, 0.2078431, 1,
-0.3257116, -0.665862, -3.230503, 0, 1, 0.2156863, 1,
-0.3193159, -0.4819056, -3.2118, 0, 1, 0.2196078, 1,
-0.3189153, 0.4600173, -0.7733459, 0, 1, 0.227451, 1,
-0.3177345, 0.9639926, 0.05281664, 0, 1, 0.2313726, 1,
-0.3175699, 1.396334, -0.6240743, 0, 1, 0.2392157, 1,
-0.3157152, -2.117951, -1.227134, 0, 1, 0.2431373, 1,
-0.3073746, -1.969025, -4.292972, 0, 1, 0.2509804, 1,
-0.3051146, 1.90286, -0.501282, 0, 1, 0.254902, 1,
-0.3041199, 1.925907, 1.332568, 0, 1, 0.2627451, 1,
-0.3037952, 0.05229342, -1.648748, 0, 1, 0.2666667, 1,
-0.3003196, 0.5871004, 2.002384, 0, 1, 0.2745098, 1,
-0.2999563, 0.2098519, -0.2974095, 0, 1, 0.2784314, 1,
-0.2990777, 0.2359049, -0.9311748, 0, 1, 0.2862745, 1,
-0.2969786, 0.5668293, -0.4725989, 0, 1, 0.2901961, 1,
-0.296076, 1.244395, 0.6327599, 0, 1, 0.2980392, 1,
-0.2955477, 1.408498, -0.2255974, 0, 1, 0.3058824, 1,
-0.2947078, 0.04759535, -1.571155, 0, 1, 0.3098039, 1,
-0.2882631, 0.2781068, 0.09048834, 0, 1, 0.3176471, 1,
-0.2830777, -0.6621074, -3.087777, 0, 1, 0.3215686, 1,
-0.2816035, 0.973943, -1.05731, 0, 1, 0.3294118, 1,
-0.2813121, 0.5815256, 0.02727454, 0, 1, 0.3333333, 1,
-0.2794686, 0.1225649, -3.095254, 0, 1, 0.3411765, 1,
-0.2769822, -0.9615092, -2.968149, 0, 1, 0.345098, 1,
-0.2759692, -0.02160782, 0.3155621, 0, 1, 0.3529412, 1,
-0.2692668, -1.461652, -3.601202, 0, 1, 0.3568628, 1,
-0.2663037, 0.7554018, -1.841716, 0, 1, 0.3647059, 1,
-0.2662925, -0.2308516, -1.080784, 0, 1, 0.3686275, 1,
-0.2643998, 0.614574, -1.619482, 0, 1, 0.3764706, 1,
-0.2641964, 1.401208, -0.2063644, 0, 1, 0.3803922, 1,
-0.2627801, 0.07164961, 0.416818, 0, 1, 0.3882353, 1,
-0.2577129, 0.2742037, -1.43584, 0, 1, 0.3921569, 1,
-0.2573967, -0.1874898, -1.994829, 0, 1, 0.4, 1,
-0.2561583, 0.1011502, -2.792724, 0, 1, 0.4078431, 1,
-0.2517014, -1.333826, -2.330228, 0, 1, 0.4117647, 1,
-0.2461597, -1.393042, -1.573168, 0, 1, 0.4196078, 1,
-0.246043, 1.160151, 1.480229, 0, 1, 0.4235294, 1,
-0.2432687, 2.438753, -1.328254, 0, 1, 0.4313726, 1,
-0.2398248, 0.3116056, -0.09784594, 0, 1, 0.4352941, 1,
-0.2368074, 0.1776115, -0.9829493, 0, 1, 0.4431373, 1,
-0.2344624, 1.165946, -0.8718188, 0, 1, 0.4470588, 1,
-0.2328125, 0.5293634, 0.8982252, 0, 1, 0.454902, 1,
-0.2319622, -1.220739, -3.279073, 0, 1, 0.4588235, 1,
-0.2316986, 0.7330745, 0.7812248, 0, 1, 0.4666667, 1,
-0.2300506, -0.6641262, -2.686336, 0, 1, 0.4705882, 1,
-0.2285004, 0.1500059, -0.1693662, 0, 1, 0.4784314, 1,
-0.2273587, 0.7949792, -0.4992476, 0, 1, 0.4823529, 1,
-0.2238321, 0.1468203, -2.820865, 0, 1, 0.4901961, 1,
-0.2218539, 0.9020165, -1.010188, 0, 1, 0.4941176, 1,
-0.2217576, 0.4592554, 0.05240491, 0, 1, 0.5019608, 1,
-0.2205738, -0.6686823, -1.217015, 0, 1, 0.509804, 1,
-0.2198006, -0.6222417, -3.426346, 0, 1, 0.5137255, 1,
-0.219699, -1.11823, -2.955878, 0, 1, 0.5215687, 1,
-0.2150008, -0.6346376, -2.781768, 0, 1, 0.5254902, 1,
-0.2120788, 0.2439221, -0.5318565, 0, 1, 0.5333334, 1,
-0.2069036, 0.7463921, -0.6233999, 0, 1, 0.5372549, 1,
-0.2042381, 0.9495573, 0.2984563, 0, 1, 0.5450981, 1,
-0.200831, 0.5935804, -0.4726187, 0, 1, 0.5490196, 1,
-0.1995584, 0.6700534, 1.050307, 0, 1, 0.5568628, 1,
-0.1967669, 0.131003, -0.2687065, 0, 1, 0.5607843, 1,
-0.1910228, -1.178903, -3.081247, 0, 1, 0.5686275, 1,
-0.1851823, 2.437139, -0.04836323, 0, 1, 0.572549, 1,
-0.1841746, -0.3897829, -3.956366, 0, 1, 0.5803922, 1,
-0.1829133, 0.332818, -1.149777, 0, 1, 0.5843138, 1,
-0.1823791, -0.03314284, -3.294213, 0, 1, 0.5921569, 1,
-0.1796857, 0.6099769, -1.503489, 0, 1, 0.5960785, 1,
-0.1796633, -0.9465703, -1.101332, 0, 1, 0.6039216, 1,
-0.1792933, -1.181491, -2.165942, 0, 1, 0.6117647, 1,
-0.1765413, 0.5634662, -0.3698177, 0, 1, 0.6156863, 1,
-0.1738369, 0.2317566, -0.1239253, 0, 1, 0.6235294, 1,
-0.1656995, 1.352525, -1.106411, 0, 1, 0.627451, 1,
-0.1655686, 0.6147396, 0.7097991, 0, 1, 0.6352941, 1,
-0.1642868, 0.5249664, -0.3472454, 0, 1, 0.6392157, 1,
-0.1615091, 0.04797383, -1.232418, 0, 1, 0.6470588, 1,
-0.1574024, 1.805542, 0.7063587, 0, 1, 0.6509804, 1,
-0.1561446, 0.7559973, 0.3037254, 0, 1, 0.6588235, 1,
-0.1549357, -2.008593, -3.553661, 0, 1, 0.6627451, 1,
-0.1548098, -0.322963, -3.866139, 0, 1, 0.6705883, 1,
-0.1494871, -0.6946325, -3.683162, 0, 1, 0.6745098, 1,
-0.147147, 1.061082, -0.8588468, 0, 1, 0.682353, 1,
-0.1453037, -0.4395205, -2.607602, 0, 1, 0.6862745, 1,
-0.144178, -0.6303285, -2.230973, 0, 1, 0.6941177, 1,
-0.1390983, 0.7030302, -0.6448346, 0, 1, 0.7019608, 1,
-0.1385099, -0.03612977, -1.695339, 0, 1, 0.7058824, 1,
-0.1340409, -1.065889, -1.890122, 0, 1, 0.7137255, 1,
-0.1324985, 0.7158281, -1.251616, 0, 1, 0.7176471, 1,
-0.1315427, -0.6115904, -2.710362, 0, 1, 0.7254902, 1,
-0.1312132, -0.5650524, -3.5696, 0, 1, 0.7294118, 1,
-0.1306325, 0.1685633, -1.011727, 0, 1, 0.7372549, 1,
-0.1303101, -2.240738, -4.344234, 0, 1, 0.7411765, 1,
-0.1271288, -1.608366, -3.951667, 0, 1, 0.7490196, 1,
-0.1270629, -1.693767, -4.48068, 0, 1, 0.7529412, 1,
-0.1256367, -1.285717, -2.614332, 0, 1, 0.7607843, 1,
-0.1240447, -1.5861, -2.73018, 0, 1, 0.7647059, 1,
-0.1191248, 1.482362, -0.7415691, 0, 1, 0.772549, 1,
-0.118632, 0.01967579, -1.668379, 0, 1, 0.7764706, 1,
-0.1185085, -0.9199243, -1.48264, 0, 1, 0.7843137, 1,
-0.1167236, 0.062413, 0.08717843, 0, 1, 0.7882353, 1,
-0.115416, -1.7573, -3.081752, 0, 1, 0.7960784, 1,
-0.1124409, -0.9924757, -3.778954, 0, 1, 0.8039216, 1,
-0.1102677, 0.6615461, -0.352825, 0, 1, 0.8078431, 1,
-0.1023118, 0.03376417, -1.292114, 0, 1, 0.8156863, 1,
-0.0989809, -0.2850785, -3.764452, 0, 1, 0.8196079, 1,
-0.09820307, -0.9905551, -2.73307, 0, 1, 0.827451, 1,
-0.09670336, -0.5590411, -2.110825, 0, 1, 0.8313726, 1,
-0.09666489, -1.289706, -3.087752, 0, 1, 0.8392157, 1,
-0.09567235, -1.045575, -3.843707, 0, 1, 0.8431373, 1,
-0.09431239, 0.4048665, -0.8184862, 0, 1, 0.8509804, 1,
-0.09126663, -0.1758823, -2.083508, 0, 1, 0.854902, 1,
-0.08550133, 0.3466513, -0.7733329, 0, 1, 0.8627451, 1,
-0.0797605, -0.1081593, -0.424615, 0, 1, 0.8666667, 1,
-0.07562561, 0.4342133, -0.7023979, 0, 1, 0.8745098, 1,
-0.07372659, -0.3298495, -1.45373, 0, 1, 0.8784314, 1,
-0.07358702, -1.736455, -3.244299, 0, 1, 0.8862745, 1,
-0.07263146, -0.6884651, -3.228114, 0, 1, 0.8901961, 1,
-0.07196823, -0.2850552, -2.191588, 0, 1, 0.8980392, 1,
-0.06941462, 1.063361, 0.08675934, 0, 1, 0.9058824, 1,
-0.06663749, -0.761808, -2.18425, 0, 1, 0.9098039, 1,
-0.06578277, -0.8491975, -1.905063, 0, 1, 0.9176471, 1,
-0.06309193, -0.562198, -2.797805, 0, 1, 0.9215686, 1,
-0.06308909, 0.8889382, 0.2289124, 0, 1, 0.9294118, 1,
-0.06098411, 0.1555338, -1.472217, 0, 1, 0.9333333, 1,
-0.05553781, 0.896134, -1.76434, 0, 1, 0.9411765, 1,
-0.05021949, 1.733715, 0.4111562, 0, 1, 0.945098, 1,
-0.04769589, 1.129687, -0.5765399, 0, 1, 0.9529412, 1,
-0.04307633, -0.4200825, -4.491777, 0, 1, 0.9568627, 1,
-0.04136273, -1.355397, -4.116553, 0, 1, 0.9647059, 1,
-0.04096567, -0.2419173, -4.00846, 0, 1, 0.9686275, 1,
-0.03901951, 0.336057, 0.6447615, 0, 1, 0.9764706, 1,
-0.03502212, 0.8346072, -0.4720316, 0, 1, 0.9803922, 1,
-0.03357209, -0.1237607, -2.377953, 0, 1, 0.9882353, 1,
-0.03190831, -1.882634, -3.156628, 0, 1, 0.9921569, 1,
-0.02739945, 0.2387774, 1.26061, 0, 1, 1, 1,
-0.02532036, 0.4872886, -0.9954385, 0, 0.9921569, 1, 1,
-0.01993452, 0.2046903, 1.064412, 0, 0.9882353, 1, 1,
-0.01946165, 1.063013, 0.4615043, 0, 0.9803922, 1, 1,
-0.01873628, -0.8736324, -4.016107, 0, 0.9764706, 1, 1,
-0.01807056, -1.373608, -4.042806, 0, 0.9686275, 1, 1,
-0.007907311, 0.3621706, -1.189845, 0, 0.9647059, 1, 1,
-0.007050228, 0.7011468, 0.271692, 0, 0.9568627, 1, 1,
-0.003535844, 0.2617873, 1.370235, 0, 0.9529412, 1, 1,
-0.003052028, 0.7620733, 1.176525, 0, 0.945098, 1, 1,
-0.000976781, 0.4873273, 0.1472072, 0, 0.9411765, 1, 1,
-0.000249722, 0.1583444, -0.3219047, 0, 0.9333333, 1, 1,
0.0007024052, 0.1041055, 1.621373, 0, 0.9294118, 1, 1,
0.0007772768, 0.8717471, 0.4628509, 0, 0.9215686, 1, 1,
0.002990779, 0.1949813, -1.014732, 0, 0.9176471, 1, 1,
0.007726009, -0.5065515, 4.326573, 0, 0.9098039, 1, 1,
0.0141014, 0.5824388, -0.09494068, 0, 0.9058824, 1, 1,
0.01573073, 0.5901288, 2.311111, 0, 0.8980392, 1, 1,
0.02055723, -0.2907734, 4.109344, 0, 0.8901961, 1, 1,
0.02425009, 0.3857285, -0.292803, 0, 0.8862745, 1, 1,
0.02755513, -0.08050483, 3.745093, 0, 0.8784314, 1, 1,
0.03009197, 0.1656668, -0.8764292, 0, 0.8745098, 1, 1,
0.03238847, 0.547646, 0.3759831, 0, 0.8666667, 1, 1,
0.0365138, -1.101576, 1.530162, 0, 0.8627451, 1, 1,
0.03671605, -0.2669434, 2.839159, 0, 0.854902, 1, 1,
0.04324361, 0.6504072, 1.450494, 0, 0.8509804, 1, 1,
0.04418523, -0.7582625, 3.711662, 0, 0.8431373, 1, 1,
0.04473753, -0.3739423, 3.176661, 0, 0.8392157, 1, 1,
0.04803509, -1.199855, 2.764808, 0, 0.8313726, 1, 1,
0.04949361, -0.02662271, 0.4661462, 0, 0.827451, 1, 1,
0.04984384, 1.521244, 0.7890899, 0, 0.8196079, 1, 1,
0.05145204, -0.661478, 3.7528, 0, 0.8156863, 1, 1,
0.05987579, -0.778981, 3.762215, 0, 0.8078431, 1, 1,
0.06188156, -0.1152767, 3.433188, 0, 0.8039216, 1, 1,
0.06385293, -0.7848342, 5.092963, 0, 0.7960784, 1, 1,
0.06537052, -0.4673414, 3.187026, 0, 0.7882353, 1, 1,
0.07242141, -0.1455612, 2.387212, 0, 0.7843137, 1, 1,
0.07546211, 0.1395189, -0.1891322, 0, 0.7764706, 1, 1,
0.07618531, -0.1575478, 2.100521, 0, 0.772549, 1, 1,
0.0788541, 0.8171653, 0.8512609, 0, 0.7647059, 1, 1,
0.07921785, 0.5696408, -0.7206039, 0, 0.7607843, 1, 1,
0.08070125, 0.1741258, 0.4576995, 0, 0.7529412, 1, 1,
0.08799249, 1.431161, -0.0401721, 0, 0.7490196, 1, 1,
0.09391139, -0.9545406, 3.221604, 0, 0.7411765, 1, 1,
0.09843463, -1.195553, 3.151662, 0, 0.7372549, 1, 1,
0.09882735, -0.7602226, 3.405221, 0, 0.7294118, 1, 1,
0.1026519, 0.645578, 0.5250022, 0, 0.7254902, 1, 1,
0.1030679, 0.02569679, 0.6037716, 0, 0.7176471, 1, 1,
0.1039437, 0.1346053, 1.794298, 0, 0.7137255, 1, 1,
0.107067, -0.6768752, 1.621937, 0, 0.7058824, 1, 1,
0.1081091, -2.201916, 2.817891, 0, 0.6980392, 1, 1,
0.1122036, -2.168945, 3.235686, 0, 0.6941177, 1, 1,
0.1154412, 2.811893, 1.198895, 0, 0.6862745, 1, 1,
0.1274895, -0.718058, 4.406095, 0, 0.682353, 1, 1,
0.1303797, -0.3332452, 0.00476191, 0, 0.6745098, 1, 1,
0.133282, -0.3632587, 2.97947, 0, 0.6705883, 1, 1,
0.1378574, 1.265784, -1.174994, 0, 0.6627451, 1, 1,
0.1393681, -1.723038, 4.561873, 0, 0.6588235, 1, 1,
0.1415662, -1.183015, 5.063052, 0, 0.6509804, 1, 1,
0.1471267, -1.696458, 1.837149, 0, 0.6470588, 1, 1,
0.1473207, 0.5469342, 1.066747, 0, 0.6392157, 1, 1,
0.1497471, -0.7403092, 4.210681, 0, 0.6352941, 1, 1,
0.1508478, -0.9498168, 2.508607, 0, 0.627451, 1, 1,
0.1560861, -1.822158, 2.613663, 0, 0.6235294, 1, 1,
0.161796, -0.09597482, 0.7355923, 0, 0.6156863, 1, 1,
0.16299, 0.3114409, 0.190051, 0, 0.6117647, 1, 1,
0.1657439, -0.6748917, 2.778255, 0, 0.6039216, 1, 1,
0.169236, -0.4060678, 4.628686, 0, 0.5960785, 1, 1,
0.171622, 0.05599678, 0.9053559, 0, 0.5921569, 1, 1,
0.1774845, 1.644883, -1.088788, 0, 0.5843138, 1, 1,
0.1781307, 1.890401, -1.379399, 0, 0.5803922, 1, 1,
0.1840142, 2.617697, -0.1973339, 0, 0.572549, 1, 1,
0.1864826, -1.46352, 3.268844, 0, 0.5686275, 1, 1,
0.1935058, -0.8562261, 4.408769, 0, 0.5607843, 1, 1,
0.1937748, -0.1704554, 3.794051, 0, 0.5568628, 1, 1,
0.1959559, 1.286024, 1.421611, 0, 0.5490196, 1, 1,
0.1962522, -2.267516, 2.950653, 0, 0.5450981, 1, 1,
0.1962923, -0.6544775, 2.990343, 0, 0.5372549, 1, 1,
0.1999698, -0.1300146, 3.016628, 0, 0.5333334, 1, 1,
0.2003563, -0.1008473, 3.02234, 0, 0.5254902, 1, 1,
0.2034011, -1.237852, 3.178728, 0, 0.5215687, 1, 1,
0.2045635, -0.5328204, 3.480163, 0, 0.5137255, 1, 1,
0.2071885, 0.1301888, 1.673344, 0, 0.509804, 1, 1,
0.2072607, 2.668557, -0.8770447, 0, 0.5019608, 1, 1,
0.2113844, -0.5257398, 2.85404, 0, 0.4941176, 1, 1,
0.2131759, -0.969992, 3.898511, 0, 0.4901961, 1, 1,
0.2132192, 1.137135, 0.8800962, 0, 0.4823529, 1, 1,
0.21435, 0.1013384, 2.027742, 0, 0.4784314, 1, 1,
0.2150236, 0.1404228, 2.80689, 0, 0.4705882, 1, 1,
0.2189652, 1.946129, 0.5214608, 0, 0.4666667, 1, 1,
0.2219204, 0.2236979, 1.614129, 0, 0.4588235, 1, 1,
0.2234928, 0.3663015, 1.710679, 0, 0.454902, 1, 1,
0.2255267, 0.2680106, 1.233499, 0, 0.4470588, 1, 1,
0.2309254, -0.7518236, 2.077182, 0, 0.4431373, 1, 1,
0.2320242, 2.008884, 0.0305371, 0, 0.4352941, 1, 1,
0.2383548, 0.0767497, 1.362198, 0, 0.4313726, 1, 1,
0.241357, -0.3985503, 3.118956, 0, 0.4235294, 1, 1,
0.243977, -0.1420948, 3.020621, 0, 0.4196078, 1, 1,
0.2441494, -2.113959, 3.663887, 0, 0.4117647, 1, 1,
0.2479015, -0.1156937, 1.833043, 0, 0.4078431, 1, 1,
0.2501803, -1.249652, 4.068633, 0, 0.4, 1, 1,
0.2517138, 0.9167882, 1.050917, 0, 0.3921569, 1, 1,
0.2565313, 0.6841775, 1.33244, 0, 0.3882353, 1, 1,
0.2570071, 0.2930437, 0.7762965, 0, 0.3803922, 1, 1,
0.2573734, 0.3184389, -1.116692, 0, 0.3764706, 1, 1,
0.2585863, -1.199771, 3.434299, 0, 0.3686275, 1, 1,
0.259856, -0.007405419, 2.089902, 0, 0.3647059, 1, 1,
0.2614043, 0.5223727, 1.066983, 0, 0.3568628, 1, 1,
0.2617347, -0.2565538, 2.222273, 0, 0.3529412, 1, 1,
0.2621801, 0.5880185, 0.7761495, 0, 0.345098, 1, 1,
0.2627694, -0.8314265, 2.851735, 0, 0.3411765, 1, 1,
0.2634218, -1.42245, 2.599008, 0, 0.3333333, 1, 1,
0.2666563, 0.2878881, 0.3549061, 0, 0.3294118, 1, 1,
0.2671091, -0.2052992, 1.233295, 0, 0.3215686, 1, 1,
0.2689133, 0.2837988, 2.04742, 0, 0.3176471, 1, 1,
0.269891, -0.1243083, 0.828902, 0, 0.3098039, 1, 1,
0.2749475, 0.3807882, 1.44275, 0, 0.3058824, 1, 1,
0.2783928, 1.186241, -0.7261335, 0, 0.2980392, 1, 1,
0.2809973, -0.5999213, 3.659873, 0, 0.2901961, 1, 1,
0.2842298, 0.6836871, 0.6841696, 0, 0.2862745, 1, 1,
0.2850146, -0.9967489, 3.551362, 0, 0.2784314, 1, 1,
0.2851743, 0.3595648, 1.254243, 0, 0.2745098, 1, 1,
0.287714, -0.1654893, 3.21196, 0, 0.2666667, 1, 1,
0.2897154, 0.6777861, 0.4008048, 0, 0.2627451, 1, 1,
0.2922161, -1.600112, 2.850896, 0, 0.254902, 1, 1,
0.2939105, -0.689087, 3.238036, 0, 0.2509804, 1, 1,
0.2946478, 0.03410319, 1.513053, 0, 0.2431373, 1, 1,
0.3004847, 0.2483645, 1.086241, 0, 0.2392157, 1, 1,
0.3011612, 0.2194145, 1.668306, 0, 0.2313726, 1, 1,
0.3031107, 0.3524098, 0.7815723, 0, 0.227451, 1, 1,
0.3039476, -0.6188954, 4.557106, 0, 0.2196078, 1, 1,
0.3042653, 0.08725455, 1.348778, 0, 0.2156863, 1, 1,
0.3053505, 2.444444, 0.9186319, 0, 0.2078431, 1, 1,
0.3084766, -1.556707, 3.041937, 0, 0.2039216, 1, 1,
0.3088602, 0.0880029, -0.9813638, 0, 0.1960784, 1, 1,
0.3101489, 0.6897004, 1.173523, 0, 0.1882353, 1, 1,
0.3110865, -0.8518683, 3.429257, 0, 0.1843137, 1, 1,
0.3114218, -1.093919, 4.179753, 0, 0.1764706, 1, 1,
0.3121963, 0.7052379, 0.8041312, 0, 0.172549, 1, 1,
0.3132473, 0.1947105, -0.7679175, 0, 0.1647059, 1, 1,
0.315917, -0.5530418, 3.732128, 0, 0.1607843, 1, 1,
0.316342, -0.08907951, 0.8689091, 0, 0.1529412, 1, 1,
0.3215466, 0.4838938, -0.2418432, 0, 0.1490196, 1, 1,
0.3217569, -1.552587, 3.113304, 0, 0.1411765, 1, 1,
0.3245551, -0.06441841, 1.544653, 0, 0.1372549, 1, 1,
0.3268287, -0.9799454, 2.00129, 0, 0.1294118, 1, 1,
0.3276441, 0.8623784, -0.2651095, 0, 0.1254902, 1, 1,
0.3301032, -0.9136822, 2.628106, 0, 0.1176471, 1, 1,
0.3426959, -0.7915812, 1.935541, 0, 0.1137255, 1, 1,
0.3434636, 0.6195996, 0.2334292, 0, 0.1058824, 1, 1,
0.3484882, 2.389869, 1.178359, 0, 0.09803922, 1, 1,
0.3486003, 1.23139, 0.2000332, 0, 0.09411765, 1, 1,
0.3488114, -0.3686496, 2.601664, 0, 0.08627451, 1, 1,
0.3488282, -0.9875767, 2.644705, 0, 0.08235294, 1, 1,
0.3573813, -0.8655101, 2.87649, 0, 0.07450981, 1, 1,
0.3579284, -2.539849, 2.943429, 0, 0.07058824, 1, 1,
0.3605702, 0.5123769, 0.5899456, 0, 0.0627451, 1, 1,
0.3624474, 1.079527, 0.1306266, 0, 0.05882353, 1, 1,
0.3671805, -0.4851374, 2.751662, 0, 0.05098039, 1, 1,
0.3739848, -0.4471567, 1.636148, 0, 0.04705882, 1, 1,
0.3741342, 0.0671621, 0.7561182, 0, 0.03921569, 1, 1,
0.3800183, -0.5131606, 0.9655799, 0, 0.03529412, 1, 1,
0.3834469, 0.2661779, 1.550461, 0, 0.02745098, 1, 1,
0.3845283, -0.04876335, 1.704044, 0, 0.02352941, 1, 1,
0.3868613, 0.8071421, 0.9283529, 0, 0.01568628, 1, 1,
0.3911685, -1.116379, 3.284508, 0, 0.01176471, 1, 1,
0.3937798, -0.9387638, 2.714484, 0, 0.003921569, 1, 1,
0.395572, 0.07037231, 0.7153342, 0.003921569, 0, 1, 1,
0.4034028, -1.91417, 3.486322, 0.007843138, 0, 1, 1,
0.40381, -0.7246067, 3.205303, 0.01568628, 0, 1, 1,
0.4076297, -0.6136047, 2.775117, 0.01960784, 0, 1, 1,
0.4080227, 0.9097512, -0.1668555, 0.02745098, 0, 1, 1,
0.4093907, 1.286492, 0.2432102, 0.03137255, 0, 1, 1,
0.4179784, 2.163411, 0.5519871, 0.03921569, 0, 1, 1,
0.4275412, 1.680837, 0.6953187, 0.04313726, 0, 1, 1,
0.4321298, -0.2450728, 2.852867, 0.05098039, 0, 1, 1,
0.4323945, -0.4642335, 1.927416, 0.05490196, 0, 1, 1,
0.4337832, 2.162421, 0.5300245, 0.0627451, 0, 1, 1,
0.4394298, -0.3413125, 2.396832, 0.06666667, 0, 1, 1,
0.439492, -0.9896477, 2.788341, 0.07450981, 0, 1, 1,
0.4531893, 1.987944, 0.8206145, 0.07843138, 0, 1, 1,
0.4556891, -0.6680843, 3.715076, 0.08627451, 0, 1, 1,
0.4574086, -0.9563611, 0.3125597, 0.09019608, 0, 1, 1,
0.4608482, 0.9799931, 1.179468, 0.09803922, 0, 1, 1,
0.4678896, -0.7861349, 2.730878, 0.1058824, 0, 1, 1,
0.4700212, -2.113227, 2.027133, 0.1098039, 0, 1, 1,
0.4724084, -0.6285725, 0.7047601, 0.1176471, 0, 1, 1,
0.4732791, -1.190619, 3.274711, 0.1215686, 0, 1, 1,
0.4841533, -0.03079129, 2.57623, 0.1294118, 0, 1, 1,
0.4866038, -1.008969, 1.473289, 0.1333333, 0, 1, 1,
0.4902069, -1.939046, 1.881915, 0.1411765, 0, 1, 1,
0.4940034, 0.1438762, -0.308181, 0.145098, 0, 1, 1,
0.4944596, -0.5422257, 2.523869, 0.1529412, 0, 1, 1,
0.4949248, -0.6312398, 2.89078, 0.1568628, 0, 1, 1,
0.4988109, -1.20849, 3.047947, 0.1647059, 0, 1, 1,
0.4999947, -0.7327445, 2.47695, 0.1686275, 0, 1, 1,
0.502642, 1.1978, 0.5296312, 0.1764706, 0, 1, 1,
0.5078152, -0.8724838, 2.049633, 0.1803922, 0, 1, 1,
0.510532, 0.2879285, 1.601037, 0.1882353, 0, 1, 1,
0.5107782, -0.8435924, 1.294224, 0.1921569, 0, 1, 1,
0.5108207, 3.440502, -0.1880694, 0.2, 0, 1, 1,
0.5177839, -0.02527416, 1.95272, 0.2078431, 0, 1, 1,
0.5200181, -0.3856921, 1.32117, 0.2117647, 0, 1, 1,
0.521433, 0.09665522, 4.505893, 0.2196078, 0, 1, 1,
0.5225944, 0.7260945, 1.060396, 0.2235294, 0, 1, 1,
0.5256609, 0.8981135, -1.644509, 0.2313726, 0, 1, 1,
0.5307748, 0.04994074, 0.8447055, 0.2352941, 0, 1, 1,
0.5308934, 0.07205203, 0.7471958, 0.2431373, 0, 1, 1,
0.532187, -0.9034009, 2.321089, 0.2470588, 0, 1, 1,
0.5354093, -0.4346706, 0.2297431, 0.254902, 0, 1, 1,
0.5365206, -2.74993, 3.816638, 0.2588235, 0, 1, 1,
0.5367113, -0.1860879, 0.8252247, 0.2666667, 0, 1, 1,
0.5393859, -0.617974, 1.022531, 0.2705882, 0, 1, 1,
0.5440165, -0.1827472, 0.9386714, 0.2784314, 0, 1, 1,
0.5453367, 2.124672, -0.264758, 0.282353, 0, 1, 1,
0.546621, 1.253635, 3.094219, 0.2901961, 0, 1, 1,
0.5513897, 0.6599311, -0.01113916, 0.2941177, 0, 1, 1,
0.5549209, -0.4129032, 0.466808, 0.3019608, 0, 1, 1,
0.5565306, -1.200973, 2.039567, 0.3098039, 0, 1, 1,
0.5602399, 1.297428, 0.7068888, 0.3137255, 0, 1, 1,
0.5616063, -1.000517, 2.323321, 0.3215686, 0, 1, 1,
0.5622727, 1.111875, 0.8232925, 0.3254902, 0, 1, 1,
0.5789864, 0.6185688, 0.06013272, 0.3333333, 0, 1, 1,
0.5810714, -0.9161937, 2.019061, 0.3372549, 0, 1, 1,
0.5828624, 1.291015, 0.3595411, 0.345098, 0, 1, 1,
0.5847934, 0.703563, 1.097657, 0.3490196, 0, 1, 1,
0.588569, -0.7440653, 2.348191, 0.3568628, 0, 1, 1,
0.5915291, 0.1373035, 1.549742, 0.3607843, 0, 1, 1,
0.6030639, -0.8920141, 2.973338, 0.3686275, 0, 1, 1,
0.6056911, 0.1898184, 1.099019, 0.372549, 0, 1, 1,
0.615295, 0.3535107, 1.65594, 0.3803922, 0, 1, 1,
0.6198641, 0.2628379, -0.417403, 0.3843137, 0, 1, 1,
0.6227989, -0.9939619, 2.666774, 0.3921569, 0, 1, 1,
0.6265365, 1.213151, 1.952628, 0.3960784, 0, 1, 1,
0.6316598, -0.01802656, 1.921697, 0.4039216, 0, 1, 1,
0.6331757, -0.08838893, 1.114769, 0.4117647, 0, 1, 1,
0.6396194, -0.7913117, 2.743917, 0.4156863, 0, 1, 1,
0.6417295, 1.360076, 0.4652784, 0.4235294, 0, 1, 1,
0.6489609, 0.6646651, 1.377813, 0.427451, 0, 1, 1,
0.6497738, -0.6293162, 3.105391, 0.4352941, 0, 1, 1,
0.6503968, -0.7213039, 3.00421, 0.4392157, 0, 1, 1,
0.6527348, 0.09062325, 2.333904, 0.4470588, 0, 1, 1,
0.6550345, 0.8868406, -0.2560722, 0.4509804, 0, 1, 1,
0.6557783, 0.5601254, 0.624963, 0.4588235, 0, 1, 1,
0.6604666, 0.4587055, -0.4192348, 0.4627451, 0, 1, 1,
0.6614848, 0.3119536, 1.123247, 0.4705882, 0, 1, 1,
0.6846776, 1.782055, 0.1065359, 0.4745098, 0, 1, 1,
0.6854836, 0.237848, 0.853296, 0.4823529, 0, 1, 1,
0.6885347, 0.5144557, -0.3779412, 0.4862745, 0, 1, 1,
0.69618, -0.4625352, 2.011816, 0.4941176, 0, 1, 1,
0.6964802, -0.4297861, 2.42557, 0.5019608, 0, 1, 1,
0.6985507, -1.225479, 1.373903, 0.5058824, 0, 1, 1,
0.7015463, -0.7496248, 2.640553, 0.5137255, 0, 1, 1,
0.7023307, 0.6223266, -0.2515279, 0.5176471, 0, 1, 1,
0.7092407, 0.3566461, 1.768927, 0.5254902, 0, 1, 1,
0.7096145, -0.9817111, 3.086203, 0.5294118, 0, 1, 1,
0.7144069, 0.6852515, 2.070341, 0.5372549, 0, 1, 1,
0.7192801, -0.6256688, 0.16297, 0.5411765, 0, 1, 1,
0.7220088, 0.2992206, 0.1651092, 0.5490196, 0, 1, 1,
0.731239, 0.6631666, 0.3290661, 0.5529412, 0, 1, 1,
0.7385664, 0.7623267, 0.7769752, 0.5607843, 0, 1, 1,
0.7413977, -0.3955993, 2.290529, 0.5647059, 0, 1, 1,
0.7461147, 0.7845497, 1.046614, 0.572549, 0, 1, 1,
0.7462574, 0.0512453, 1.784054, 0.5764706, 0, 1, 1,
0.7491782, 0.3318399, 1.772334, 0.5843138, 0, 1, 1,
0.756421, -0.6328971, 2.667622, 0.5882353, 0, 1, 1,
0.7663901, 0.02824701, -0.5788174, 0.5960785, 0, 1, 1,
0.7705013, -0.6702607, 2.487435, 0.6039216, 0, 1, 1,
0.7753953, 0.8918477, -0.1941517, 0.6078432, 0, 1, 1,
0.7782105, 0.2225845, -0.08054887, 0.6156863, 0, 1, 1,
0.7811103, -0.2582682, 1.841706, 0.6196079, 0, 1, 1,
0.7821892, 0.3177116, 0.9486202, 0.627451, 0, 1, 1,
0.7871715, -0.686391, 0.8423468, 0.6313726, 0, 1, 1,
0.7917283, 1.153459, 2.099211, 0.6392157, 0, 1, 1,
0.7928361, -0.145443, 0.7859064, 0.6431373, 0, 1, 1,
0.7931454, -0.03427609, 0.7110313, 0.6509804, 0, 1, 1,
0.7932377, -0.7937621, 2.894584, 0.654902, 0, 1, 1,
0.7951236, -0.1053564, 1.420107, 0.6627451, 0, 1, 1,
0.795439, 1.446236, 2.349676, 0.6666667, 0, 1, 1,
0.796771, 0.5824203, 2.748592, 0.6745098, 0, 1, 1,
0.8010949, -1.057664, 2.644741, 0.6784314, 0, 1, 1,
0.8024607, 0.2346514, 0.5195049, 0.6862745, 0, 1, 1,
0.8035125, -0.2774538, 3.12054, 0.6901961, 0, 1, 1,
0.8066294, -0.5591704, 2.228033, 0.6980392, 0, 1, 1,
0.8113531, 0.06419677, 2.551198, 0.7058824, 0, 1, 1,
0.813045, -0.8228602, 3.703604, 0.7098039, 0, 1, 1,
0.8142268, -0.907665, 2.362998, 0.7176471, 0, 1, 1,
0.819946, -0.8590446, 2.850682, 0.7215686, 0, 1, 1,
0.8208765, -0.6514857, 1.543569, 0.7294118, 0, 1, 1,
0.823454, -2.005238, 1.874771, 0.7333333, 0, 1, 1,
0.8288389, -1.914172, 2.891083, 0.7411765, 0, 1, 1,
0.8369725, 0.3829172, 1.924749, 0.7450981, 0, 1, 1,
0.8377544, 0.5366505, -0.8876576, 0.7529412, 0, 1, 1,
0.8378097, 0.02268032, 1.549754, 0.7568628, 0, 1, 1,
0.8391243, 0.4289882, 1.530232, 0.7647059, 0, 1, 1,
0.8475539, -0.176127, 2.296035, 0.7686275, 0, 1, 1,
0.8576365, 0.3384345, 2.506658, 0.7764706, 0, 1, 1,
0.857689, 0.4751614, -1.940108, 0.7803922, 0, 1, 1,
0.8583726, 1.665719, 2.385339, 0.7882353, 0, 1, 1,
0.8584908, 0.8633231, 0.2468023, 0.7921569, 0, 1, 1,
0.8591968, -0.0926668, 3.102299, 0.8, 0, 1, 1,
0.8596925, 0.63139, 0.6060622, 0.8078431, 0, 1, 1,
0.8678265, -0.9007909, 1.167116, 0.8117647, 0, 1, 1,
0.8712895, -1.160315, 3.29788, 0.8196079, 0, 1, 1,
0.8716435, 0.8825732, -0.3891971, 0.8235294, 0, 1, 1,
0.8771476, -1.094023, 1.414502, 0.8313726, 0, 1, 1,
0.8804725, 0.7849935, 0.8235658, 0.8352941, 0, 1, 1,
0.8840908, -0.1665636, 3.21566, 0.8431373, 0, 1, 1,
0.8862236, 1.213256, 2.739612, 0.8470588, 0, 1, 1,
0.8910177, -1.277286, 4.045321, 0.854902, 0, 1, 1,
0.8916553, 2.513379, 0.5679258, 0.8588235, 0, 1, 1,
0.8953856, -0.2389286, 1.035247, 0.8666667, 0, 1, 1,
0.895521, -0.4372621, 3.774914, 0.8705882, 0, 1, 1,
0.9052415, 0.09776872, 1.998403, 0.8784314, 0, 1, 1,
0.9112584, -1.678872, 3.192289, 0.8823529, 0, 1, 1,
0.9169297, 0.178836, 1.883643, 0.8901961, 0, 1, 1,
0.925589, 0.9416113, 2.365424, 0.8941177, 0, 1, 1,
0.9313802, -0.9483123, 0.3176194, 0.9019608, 0, 1, 1,
0.931899, -0.1985665, 1.721398, 0.9098039, 0, 1, 1,
0.9323877, 0.3888397, 2.022125, 0.9137255, 0, 1, 1,
0.9354847, -1.232248, 2.556003, 0.9215686, 0, 1, 1,
0.9387575, -0.1359027, 1.469977, 0.9254902, 0, 1, 1,
0.9410067, -0.9217144, 3.955435, 0.9333333, 0, 1, 1,
0.9456648, 0.9251062, 0.8161654, 0.9372549, 0, 1, 1,
0.9601672, 0.1075694, 2.436152, 0.945098, 0, 1, 1,
0.9610443, -0.5801948, 2.126749, 0.9490196, 0, 1, 1,
0.9712097, 0.9744689, 2.739152, 0.9568627, 0, 1, 1,
0.9762438, -0.6122092, 2.952218, 0.9607843, 0, 1, 1,
0.9764665, -0.7594995, 2.013351, 0.9686275, 0, 1, 1,
0.9782864, -0.6799917, 2.28638, 0.972549, 0, 1, 1,
0.9821308, -0.3407567, 1.942432, 0.9803922, 0, 1, 1,
0.982438, -0.3694121, 3.009205, 0.9843137, 0, 1, 1,
0.9866733, -1.18734, 3.794295, 0.9921569, 0, 1, 1,
0.9960176, -1.055895, 1.224667, 0.9960784, 0, 1, 1,
1.000203, -0.1053078, 2.593669, 1, 0, 0.9960784, 1,
1.004744, 1.075046, 1.816842, 1, 0, 0.9882353, 1,
1.004904, -1.104504, 2.935556, 1, 0, 0.9843137, 1,
1.006204, -0.2258287, 1.124871, 1, 0, 0.9764706, 1,
1.008269, -0.881584, 2.548876, 1, 0, 0.972549, 1,
1.039331, -1.410391, 3.475814, 1, 0, 0.9647059, 1,
1.040685, 1.701599, 0.8922236, 1, 0, 0.9607843, 1,
1.041069, 1.527711, -0.8579312, 1, 0, 0.9529412, 1,
1.042029, -1.160651, 2.789098, 1, 0, 0.9490196, 1,
1.042861, 0.4699864, 1.483247, 1, 0, 0.9411765, 1,
1.043132, -0.3475409, 1.99569, 1, 0, 0.9372549, 1,
1.053109, 0.06041031, 0.9286368, 1, 0, 0.9294118, 1,
1.055115, -1.660998, 2.3741, 1, 0, 0.9254902, 1,
1.071357, -0.1570859, 0.3501356, 1, 0, 0.9176471, 1,
1.077163, 1.634177, 0.1069182, 1, 0, 0.9137255, 1,
1.088537, -3.374713, 2.164357, 1, 0, 0.9058824, 1,
1.097568, 0.3666122, 0.2661488, 1, 0, 0.9019608, 1,
1.102596, -0.9070767, 2.165577, 1, 0, 0.8941177, 1,
1.102959, 0.49017, 1.754385, 1, 0, 0.8862745, 1,
1.107521, -1.043332, 2.582778, 1, 0, 0.8823529, 1,
1.109548, -1.270269, 2.355587, 1, 0, 0.8745098, 1,
1.109616, -1.008465, 2.227374, 1, 0, 0.8705882, 1,
1.112381, -0.3063709, 1.694527, 1, 0, 0.8627451, 1,
1.120242, -1.050791, 1.110009, 1, 0, 0.8588235, 1,
1.123799, -0.5119112, 2.21725, 1, 0, 0.8509804, 1,
1.123841, 1.220147, 0.2867552, 1, 0, 0.8470588, 1,
1.124436, -0.6326591, 1.849704, 1, 0, 0.8392157, 1,
1.132978, 0.2753844, 0.7454307, 1, 0, 0.8352941, 1,
1.142016, 0.805477, 0.9472816, 1, 0, 0.827451, 1,
1.147519, -2.096745, 2.079644, 1, 0, 0.8235294, 1,
1.149797, 0.333917, 2.356203, 1, 0, 0.8156863, 1,
1.155, 1.962731, 0.4105089, 1, 0, 0.8117647, 1,
1.16184, 1.493981, 0.3939351, 1, 0, 0.8039216, 1,
1.166092, -0.9017512, 3.207066, 1, 0, 0.7960784, 1,
1.171162, 0.7060592, 1.388784, 1, 0, 0.7921569, 1,
1.179306, -0.9715937, 2.555798, 1, 0, 0.7843137, 1,
1.18163, -0.4402247, 1.571249, 1, 0, 0.7803922, 1,
1.189965, 0.448593, 1.138923, 1, 0, 0.772549, 1,
1.192891, -0.4472268, 1.370651, 1, 0, 0.7686275, 1,
1.198332, 0.8193104, 0.03961758, 1, 0, 0.7607843, 1,
1.203393, 0.2321173, 1.981266, 1, 0, 0.7568628, 1,
1.205842, -2.687054, 1.640093, 1, 0, 0.7490196, 1,
1.215836, 0.4390559, 1.838137, 1, 0, 0.7450981, 1,
1.221552, 0.2720256, 4.07721, 1, 0, 0.7372549, 1,
1.251504, -1.396511, 1.908743, 1, 0, 0.7333333, 1,
1.261739, -0.6615664, 2.234858, 1, 0, 0.7254902, 1,
1.262028, -1.253669, 1.650257, 1, 0, 0.7215686, 1,
1.267581, -0.04713298, 2.33361, 1, 0, 0.7137255, 1,
1.280829, 1.557096, 0.9531848, 1, 0, 0.7098039, 1,
1.291498, 0.7129585, 1.930749, 1, 0, 0.7019608, 1,
1.292284, -0.9427434, 0.8807814, 1, 0, 0.6941177, 1,
1.294159, 1.318666, 0.1124294, 1, 0, 0.6901961, 1,
1.298904, 1.26406, 1.332385, 1, 0, 0.682353, 1,
1.326343, 0.642593, -0.1697279, 1, 0, 0.6784314, 1,
1.328758, -0.08339013, 1.105073, 1, 0, 0.6705883, 1,
1.332372, 0.1474657, 0.7152449, 1, 0, 0.6666667, 1,
1.340258, 1.247522, 0.9743094, 1, 0, 0.6588235, 1,
1.351563, -1.48008, 3.077744, 1, 0, 0.654902, 1,
1.360518, -1.30025, 2.715708, 1, 0, 0.6470588, 1,
1.36916, 2.062582, 0.4570156, 1, 0, 0.6431373, 1,
1.37001, 1.919609, 1.121083, 1, 0, 0.6352941, 1,
1.377941, -0.09994208, 1.141248, 1, 0, 0.6313726, 1,
1.381799, -0.1471078, 2.892326, 1, 0, 0.6235294, 1,
1.386405, 0.4503924, 1.187939, 1, 0, 0.6196079, 1,
1.398445, -0.7749491, 2.109225, 1, 0, 0.6117647, 1,
1.412166, 0.08200988, 0.7705805, 1, 0, 0.6078432, 1,
1.413966, -0.9226809, 0.9589614, 1, 0, 0.6, 1,
1.416528, -0.1044877, 2.425184, 1, 0, 0.5921569, 1,
1.435172, -1.054286, 2.376622, 1, 0, 0.5882353, 1,
1.440787, -0.08133334, 1.873899, 1, 0, 0.5803922, 1,
1.44448, -0.6930955, 2.706566, 1, 0, 0.5764706, 1,
1.445914, 1.713727, 0.9603917, 1, 0, 0.5686275, 1,
1.4476, 0.02223871, 0.330339, 1, 0, 0.5647059, 1,
1.451688, -0.1149088, 3.141877, 1, 0, 0.5568628, 1,
1.457772, -0.2152984, 3.053093, 1, 0, 0.5529412, 1,
1.458172, 0.624746, 1.806822, 1, 0, 0.5450981, 1,
1.464653, -0.4243425, 2.231755, 1, 0, 0.5411765, 1,
1.470588, -0.4379418, 1.547942, 1, 0, 0.5333334, 1,
1.477703, 0.5023793, 0.8168136, 1, 0, 0.5294118, 1,
1.481073, -2.070376, 2.529892, 1, 0, 0.5215687, 1,
1.483112, 1.093518, 1.53723, 1, 0, 0.5176471, 1,
1.489963, 0.44373, 0.8350205, 1, 0, 0.509804, 1,
1.493767, -0.6169529, 3.622581, 1, 0, 0.5058824, 1,
1.494939, -0.3168715, 0.4751906, 1, 0, 0.4980392, 1,
1.494958, 0.2955663, -0.4170804, 1, 0, 0.4901961, 1,
1.501321, 1.708454, 2.665753, 1, 0, 0.4862745, 1,
1.507832, 0.233507, 1.647379, 1, 0, 0.4784314, 1,
1.515023, -0.01185711, 1.265746, 1, 0, 0.4745098, 1,
1.526164, -1.532198, 2.680748, 1, 0, 0.4666667, 1,
1.526644, 0.9720885, 1.514686, 1, 0, 0.4627451, 1,
1.527433, -0.08219766, 2.49372, 1, 0, 0.454902, 1,
1.528242, -0.9511261, 2.204837, 1, 0, 0.4509804, 1,
1.531834, 0.3825034, 1.763613, 1, 0, 0.4431373, 1,
1.553266, 0.1296324, 3.377763, 1, 0, 0.4392157, 1,
1.561756, 0.6344789, 0.3465264, 1, 0, 0.4313726, 1,
1.56736, 0.435528, 2.308215, 1, 0, 0.427451, 1,
1.568505, -0.7036273, 2.609299, 1, 0, 0.4196078, 1,
1.571314, 0.5761237, -0.449384, 1, 0, 0.4156863, 1,
1.576489, -0.1697706, 0.6692674, 1, 0, 0.4078431, 1,
1.602586, -1.675667, 2.42145, 1, 0, 0.4039216, 1,
1.608114, 0.3393773, 0.6034122, 1, 0, 0.3960784, 1,
1.608598, -0.9915482, 3.501062, 1, 0, 0.3882353, 1,
1.608672, -0.2251829, 2.327043, 1, 0, 0.3843137, 1,
1.609885, 0.2017341, 1.424937, 1, 0, 0.3764706, 1,
1.618071, 0.5621839, 2.163564, 1, 0, 0.372549, 1,
1.619328, 0.8255587, 2.556264, 1, 0, 0.3647059, 1,
1.620737, 0.1651134, 0.6256074, 1, 0, 0.3607843, 1,
1.629464, -0.2534303, 2.048764, 1, 0, 0.3529412, 1,
1.636901, -0.1462665, 2.795211, 1, 0, 0.3490196, 1,
1.648814, -1.231875, 4.678141, 1, 0, 0.3411765, 1,
1.663277, -0.8772679, 0.4358048, 1, 0, 0.3372549, 1,
1.66962, 1.104312, -0.2874566, 1, 0, 0.3294118, 1,
1.687931, -0.9687281, 2.448735, 1, 0, 0.3254902, 1,
1.690138, 0.7239251, 0.0816015, 1, 0, 0.3176471, 1,
1.703635, 2.024302, 0.4494821, 1, 0, 0.3137255, 1,
1.712798, 1.510546, 0.02603118, 1, 0, 0.3058824, 1,
1.721064, 0.7758814, 1.487231, 1, 0, 0.2980392, 1,
1.727044, -0.9883337, 2.962266, 1, 0, 0.2941177, 1,
1.729338, 1.239473, 2.818976, 1, 0, 0.2862745, 1,
1.735686, -1.867002, 3.662421, 1, 0, 0.282353, 1,
1.743355, 0.3644183, 1.44667, 1, 0, 0.2745098, 1,
1.74525, -0.2398669, 1.542178, 1, 0, 0.2705882, 1,
1.755894, 1.976345, 1.419595, 1, 0, 0.2627451, 1,
1.759528, -0.1270956, 2.923563, 1, 0, 0.2588235, 1,
1.761176, 0.003947579, -0.219812, 1, 0, 0.2509804, 1,
1.773755, -1.58254, 3.244862, 1, 0, 0.2470588, 1,
1.810281, -1.06548, 3.680469, 1, 0, 0.2392157, 1,
1.831296, -0.2677253, 0.3814464, 1, 0, 0.2352941, 1,
1.842611, -1.629227, 2.504437, 1, 0, 0.227451, 1,
1.866999, -0.9591171, 2.016895, 1, 0, 0.2235294, 1,
1.871985, 0.2043223, 0.6332839, 1, 0, 0.2156863, 1,
1.911092, 0.6979694, 2.973493, 1, 0, 0.2117647, 1,
1.91813, 1.107408, 0.7352939, 1, 0, 0.2039216, 1,
1.925564, -1.032179, -1.220441, 1, 0, 0.1960784, 1,
1.930076, -1.811548, 2.968311, 1, 0, 0.1921569, 1,
1.931738, 0.2318744, 0.596759, 1, 0, 0.1843137, 1,
1.938453, -1.25831, 2.796932, 1, 0, 0.1803922, 1,
1.94092, -1.26924, 3.396315, 1, 0, 0.172549, 1,
1.946836, -1.218723, 3.042504, 1, 0, 0.1686275, 1,
1.95297, 0.5344071, 3.861259, 1, 0, 0.1607843, 1,
1.962677, -1.092114, 1.487874, 1, 0, 0.1568628, 1,
1.974874, 0.09619312, 0.4695256, 1, 0, 0.1490196, 1,
1.989131, -0.007934437, 1.635901, 1, 0, 0.145098, 1,
1.995545, -1.027783, 1.778949, 1, 0, 0.1372549, 1,
2.019918, -0.08663247, 0.7892296, 1, 0, 0.1333333, 1,
2.024978, -1.222297, 4.491437, 1, 0, 0.1254902, 1,
2.034057, -0.01866437, 0.9547724, 1, 0, 0.1215686, 1,
2.046518, 1.109122, 0.8604865, 1, 0, 0.1137255, 1,
2.049255, -0.7926985, 3.407309, 1, 0, 0.1098039, 1,
2.086364, 0.6289622, 0.02826432, 1, 0, 0.1019608, 1,
2.087247, 0.9551798, 2.082055, 1, 0, 0.09411765, 1,
2.12176, -0.5699829, 0.3542215, 1, 0, 0.09019608, 1,
2.151697, 0.09509733, 0.410036, 1, 0, 0.08235294, 1,
2.185314, -0.207899, 0.6399922, 1, 0, 0.07843138, 1,
2.190386, 0.9392912, 1.775848, 1, 0, 0.07058824, 1,
2.205413, -0.225676, 0.3269286, 1, 0, 0.06666667, 1,
2.210659, -0.8949887, 2.268752, 1, 0, 0.05882353, 1,
2.279223, -0.7298343, 1.931554, 1, 0, 0.05490196, 1,
2.499557, 0.07033292, 1.42292, 1, 0, 0.04705882, 1,
2.585145, 0.6886644, 1.00479, 1, 0, 0.04313726, 1,
2.594063, 0.4790283, 3.239474, 1, 0, 0.03529412, 1,
2.642209, 0.8789596, -0.672538, 1, 0, 0.03137255, 1,
2.800223, -1.052299, 1.50118, 1, 0, 0.02352941, 1,
2.893996, -0.569603, 2.112426, 1, 0, 0.01960784, 1,
3.089613, 1.508745, 1.080673, 1, 0, 0.01176471, 1,
3.334595, -1.433655, 2.365309, 1, 0, 0.007843138, 1
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
0.21175, -4.529892, -6.8602, 0, -0.5, 0.5, 0.5,
0.21175, -4.529892, -6.8602, 1, -0.5, 0.5, 0.5,
0.21175, -4.529892, -6.8602, 1, 1.5, 0.5, 0.5,
0.21175, -4.529892, -6.8602, 0, 1.5, 0.5, 0.5
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
-3.969739, 0.03289449, -6.8602, 0, -0.5, 0.5, 0.5,
-3.969739, 0.03289449, -6.8602, 1, -0.5, 0.5, 0.5,
-3.969739, 0.03289449, -6.8602, 1, 1.5, 0.5, 0.5,
-3.969739, 0.03289449, -6.8602, 0, 1.5, 0.5, 0.5
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
-3.969739, -4.529892, -0.01741028, 0, -0.5, 0.5, 0.5,
-3.969739, -4.529892, -0.01741028, 1, -0.5, 0.5, 0.5,
-3.969739, -4.529892, -0.01741028, 1, 1.5, 0.5, 0.5,
-3.969739, -4.529892, -0.01741028, 0, 1.5, 0.5, 0.5
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
-2, -3.476941, -5.281095,
3, -3.476941, -5.281095,
-2, -3.476941, -5.281095,
-2, -3.652433, -5.544279,
-1, -3.476941, -5.281095,
-1, -3.652433, -5.544279,
0, -3.476941, -5.281095,
0, -3.652433, -5.544279,
1, -3.476941, -5.281095,
1, -3.652433, -5.544279,
2, -3.476941, -5.281095,
2, -3.652433, -5.544279,
3, -3.476941, -5.281095,
3, -3.652433, -5.544279
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
-2, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
-2, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
-2, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
-2, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5,
-1, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
-1, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
-1, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
-1, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5,
0, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
0, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
0, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
0, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5,
1, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
1, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
1, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
1, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5,
2, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
2, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
2, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
2, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5,
3, -4.003417, -6.070648, 0, -0.5, 0.5, 0.5,
3, -4.003417, -6.070648, 1, -0.5, 0.5, 0.5,
3, -4.003417, -6.070648, 1, 1.5, 0.5, 0.5,
3, -4.003417, -6.070648, 0, 1.5, 0.5, 0.5
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
-3.00478, -3, -5.281095,
-3.00478, 3, -5.281095,
-3.00478, -3, -5.281095,
-3.165607, -3, -5.544279,
-3.00478, -2, -5.281095,
-3.165607, -2, -5.544279,
-3.00478, -1, -5.281095,
-3.165607, -1, -5.544279,
-3.00478, 0, -5.281095,
-3.165607, 0, -5.544279,
-3.00478, 1, -5.281095,
-3.165607, 1, -5.544279,
-3.00478, 2, -5.281095,
-3.165607, 2, -5.544279,
-3.00478, 3, -5.281095,
-3.165607, 3, -5.544279
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
-3.48726, -3, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, -3, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, -3, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, -3, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, -2, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, -2, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, -2, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, -2, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, -1, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, -1, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, -1, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, -1, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, 0, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, 0, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, 0, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, 0, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, 1, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, 1, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, 1, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, 1, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, 2, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, 2, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, 2, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, 2, -6.070648, 0, 1.5, 0.5, 0.5,
-3.48726, 3, -6.070648, 0, -0.5, 0.5, 0.5,
-3.48726, 3, -6.070648, 1, -0.5, 0.5, 0.5,
-3.48726, 3, -6.070648, 1, 1.5, 0.5, 0.5,
-3.48726, 3, -6.070648, 0, 1.5, 0.5, 0.5
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
-3.00478, -3.476941, -4,
-3.00478, -3.476941, 4,
-3.00478, -3.476941, -4,
-3.165607, -3.652433, -4,
-3.00478, -3.476941, -2,
-3.165607, -3.652433, -2,
-3.00478, -3.476941, 0,
-3.165607, -3.652433, 0,
-3.00478, -3.476941, 2,
-3.165607, -3.652433, 2,
-3.00478, -3.476941, 4,
-3.165607, -3.652433, 4
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
-3.48726, -4.003417, -4, 0, -0.5, 0.5, 0.5,
-3.48726, -4.003417, -4, 1, -0.5, 0.5, 0.5,
-3.48726, -4.003417, -4, 1, 1.5, 0.5, 0.5,
-3.48726, -4.003417, -4, 0, 1.5, 0.5, 0.5,
-3.48726, -4.003417, -2, 0, -0.5, 0.5, 0.5,
-3.48726, -4.003417, -2, 1, -0.5, 0.5, 0.5,
-3.48726, -4.003417, -2, 1, 1.5, 0.5, 0.5,
-3.48726, -4.003417, -2, 0, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 0, 0, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 0, 1, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 0, 1, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 0, 0, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 2, 0, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 2, 1, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 2, 1, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 2, 0, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 4, 0, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 4, 1, -0.5, 0.5, 0.5,
-3.48726, -4.003417, 4, 1, 1.5, 0.5, 0.5,
-3.48726, -4.003417, 4, 0, 1.5, 0.5, 0.5
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
-3.00478, -3.476941, -5.281095,
-3.00478, 3.54273, -5.281095,
-3.00478, -3.476941, 5.246274,
-3.00478, 3.54273, 5.246274,
-3.00478, -3.476941, -5.281095,
-3.00478, -3.476941, 5.246274,
-3.00478, 3.54273, -5.281095,
-3.00478, 3.54273, 5.246274,
-3.00478, -3.476941, -5.281095,
3.42828, -3.476941, -5.281095,
-3.00478, -3.476941, 5.246274,
3.42828, -3.476941, 5.246274,
-3.00478, 3.54273, -5.281095,
3.42828, 3.54273, -5.281095,
-3.00478, 3.54273, 5.246274,
3.42828, 3.54273, 5.246274,
3.42828, -3.476941, -5.281095,
3.42828, 3.54273, -5.281095,
3.42828, -3.476941, 5.246274,
3.42828, 3.54273, 5.246274,
3.42828, -3.476941, -5.281095,
3.42828, -3.476941, 5.246274,
3.42828, 3.54273, -5.281095,
3.42828, 3.54273, 5.246274
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
var radius = 7.57962;
var distance = 33.72258;
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
mvMatrix.translate( -0.21175, -0.03289449, 0.01741028 );
mvMatrix.scale( 1.273925, 1.167467, 0.7784693 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72258);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
propaquizafop<-read.table("propaquizafop.xyz")
```

```
## Error in read.table("propaquizafop.xyz"): no lines available in input
```

```r
x<-propaquizafop$V2
```

```
## Error in eval(expr, envir, enclos): object 'propaquizafop' not found
```

```r
y<-propaquizafop$V3
```

```
## Error in eval(expr, envir, enclos): object 'propaquizafop' not found
```

```r
z<-propaquizafop$V4
```

```
## Error in eval(expr, envir, enclos): object 'propaquizafop' not found
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
-2.911095, -0.1471398, -1.423063, 0, 0, 1, 1, 1,
-2.80024, -0.0008134485, -0.5424694, 1, 0, 0, 1, 1,
-2.765486, -0.5822952, -3.514189, 1, 0, 0, 1, 1,
-2.713792, -1.174168, -3.461524, 1, 0, 0, 1, 1,
-2.607392, 0.2211882, -1.774882, 1, 0, 0, 1, 1,
-2.541474, 0.638617, 0.1856529, 1, 0, 0, 1, 1,
-2.392531, 1.733762, 2.091861, 0, 0, 0, 1, 1,
-2.387185, 0.2272598, -1.089754, 0, 0, 0, 1, 1,
-2.380196, -0.3135185, -3.13719, 0, 0, 0, 1, 1,
-2.236638, 0.57112, 1.086612, 0, 0, 0, 1, 1,
-2.206065, 0.3698139, -2.200943, 0, 0, 0, 1, 1,
-2.186134, -1.21688, -1.792662, 0, 0, 0, 1, 1,
-2.077211, -0.3444657, -1.130664, 0, 0, 0, 1, 1,
-2.067072, -1.119182, -1.825225, 1, 1, 1, 1, 1,
-2.011765, -0.8114235, -0.9974635, 1, 1, 1, 1, 1,
-2.001475, -1.130369, -1.060224, 1, 1, 1, 1, 1,
-1.998979, -0.7015232, -1.229106, 1, 1, 1, 1, 1,
-1.993356, -0.5001276, -0.7618753, 1, 1, 1, 1, 1,
-1.991396, -0.9370845, -1.518018, 1, 1, 1, 1, 1,
-1.984298, 0.409457, -2.578307, 1, 1, 1, 1, 1,
-1.982903, -0.2225991, -1.760381, 1, 1, 1, 1, 1,
-1.918876, 0.250516, -1.380983, 1, 1, 1, 1, 1,
-1.909596, 0.5151529, -0.2817726, 1, 1, 1, 1, 1,
-1.888611, 0.8067634, -2.236769, 1, 1, 1, 1, 1,
-1.86267, 0.6072125, -1.139052, 1, 1, 1, 1, 1,
-1.86002, 1.664977, -1.456491, 1, 1, 1, 1, 1,
-1.845605, 0.348223, -2.197482, 1, 1, 1, 1, 1,
-1.840624, -0.1924513, -1.601655, 1, 1, 1, 1, 1,
-1.829186, 0.6326306, -1.097447, 0, 0, 1, 1, 1,
-1.82786, 0.3398616, -1.301529, 1, 0, 0, 1, 1,
-1.814249, 0.2195475, -2.299952, 1, 0, 0, 1, 1,
-1.796511, 1.113606, -2.257146, 1, 0, 0, 1, 1,
-1.785672, 1.530352, -2.260029, 1, 0, 0, 1, 1,
-1.763886, -0.6440907, -3.756131, 1, 0, 0, 1, 1,
-1.762058, 1.476688, -1.396871, 0, 0, 0, 1, 1,
-1.751902, 0.05455627, -3.12222, 0, 0, 0, 1, 1,
-1.719639, 0.2869671, -1.48396, 0, 0, 0, 1, 1,
-1.716704, 0.7017594, -2.096056, 0, 0, 0, 1, 1,
-1.702685, -1.59037, -0.7348539, 0, 0, 0, 1, 1,
-1.699759, -0.3000699, -0.5844379, 0, 0, 0, 1, 1,
-1.686216, -0.2060492, -1.142013, 0, 0, 0, 1, 1,
-1.678877, 0.02232783, -1.415752, 1, 1, 1, 1, 1,
-1.677674, 0.5638993, -1.638399, 1, 1, 1, 1, 1,
-1.664986, -0.5366728, -1.825353, 1, 1, 1, 1, 1,
-1.661153, 0.1496232, -2.444251, 1, 1, 1, 1, 1,
-1.64048, -0.9175555, -1.732296, 1, 1, 1, 1, 1,
-1.633555, -1.173394, -2.248534, 1, 1, 1, 1, 1,
-1.62609, -0.2002374, -1.58119, 1, 1, 1, 1, 1,
-1.61664, -0.8087118, -2.095398, 1, 1, 1, 1, 1,
-1.61203, 1.988552, -1.965919, 1, 1, 1, 1, 1,
-1.588662, -1.765442, -3.404378, 1, 1, 1, 1, 1,
-1.573324, -1.874659, -3.270222, 1, 1, 1, 1, 1,
-1.573318, -0.8770508, -3.172473, 1, 1, 1, 1, 1,
-1.549816, 1.632053, -0.2913994, 1, 1, 1, 1, 1,
-1.542454, 0.1917786, -0.9610018, 1, 1, 1, 1, 1,
-1.533466, -2.056292, -1.406466, 1, 1, 1, 1, 1,
-1.520167, -0.3131171, -2.900279, 0, 0, 1, 1, 1,
-1.52004, 0.3009097, -1.247453, 1, 0, 0, 1, 1,
-1.504893, 1.162168, -0.4506882, 1, 0, 0, 1, 1,
-1.492568, 0.4300964, -2.449246, 1, 0, 0, 1, 1,
-1.492053, -0.3415089, -0.6380749, 1, 0, 0, 1, 1,
-1.484354, 1.647713, -1.798409, 1, 0, 0, 1, 1,
-1.479714, -0.8420681, -2.631373, 0, 0, 0, 1, 1,
-1.479192, 0.5170988, -1.556119, 0, 0, 0, 1, 1,
-1.478389, -1.687222, -2.894721, 0, 0, 0, 1, 1,
-1.464529, 1.403289, 0.1849753, 0, 0, 0, 1, 1,
-1.458857, -0.6886859, -3.244539, 0, 0, 0, 1, 1,
-1.442965, 0.3365059, -1.500266, 0, 0, 0, 1, 1,
-1.440985, 0.1192258, -2.781892, 0, 0, 0, 1, 1,
-1.433901, -0.6841055, -2.654121, 1, 1, 1, 1, 1,
-1.425799, -0.9331638, 0.2077648, 1, 1, 1, 1, 1,
-1.413761, -0.279637, -1.184314, 1, 1, 1, 1, 1,
-1.41029, 0.03474369, 0.9453373, 1, 1, 1, 1, 1,
-1.404792, 1.897953, -0.02972833, 1, 1, 1, 1, 1,
-1.400833, -0.5121329, -3.449305, 1, 1, 1, 1, 1,
-1.39975, -0.7565575, -2.372621, 1, 1, 1, 1, 1,
-1.3747, -0.4886245, -2.167182, 1, 1, 1, 1, 1,
-1.372887, 0.6726331, -1.622762, 1, 1, 1, 1, 1,
-1.360118, 0.1769094, -2.56855, 1, 1, 1, 1, 1,
-1.350135, 0.7995149, -0.5792496, 1, 1, 1, 1, 1,
-1.345887, 0.3535146, -0.2422607, 1, 1, 1, 1, 1,
-1.343928, 0.7700199, -0.5907768, 1, 1, 1, 1, 1,
-1.337696, 1.538631, -0.6045215, 1, 1, 1, 1, 1,
-1.334119, 0.5221117, -0.9745876, 1, 1, 1, 1, 1,
-1.325418, -0.6221489, -2.770046, 0, 0, 1, 1, 1,
-1.321384, -1.403477, -2.291028, 1, 0, 0, 1, 1,
-1.317146, -1.037052, -3.097852, 1, 0, 0, 1, 1,
-1.301526, 0.2499217, -1.441263, 1, 0, 0, 1, 1,
-1.295094, 0.5404981, -1.12897, 1, 0, 0, 1, 1,
-1.291438, 0.9226335, 1.087584, 1, 0, 0, 1, 1,
-1.289273, 0.9404901, -1.410942, 0, 0, 0, 1, 1,
-1.277503, -1.80478, -3.915717, 0, 0, 0, 1, 1,
-1.277011, -0.4154587, -1.929231, 0, 0, 0, 1, 1,
-1.274514, -0.8009315, -1.908791, 0, 0, 0, 1, 1,
-1.270041, -1.871773, -0.7075027, 0, 0, 0, 1, 1,
-1.270022, 0.519336, -0.5821567, 0, 0, 0, 1, 1,
-1.265827, 0.7191783, 0.9027754, 0, 0, 0, 1, 1,
-1.262517, -0.0947074, -1.024215, 1, 1, 1, 1, 1,
-1.262129, 0.6305574, -1.257655, 1, 1, 1, 1, 1,
-1.258263, 0.1996889, -0.6081764, 1, 1, 1, 1, 1,
-1.24623, -1.084995, -3.243571, 1, 1, 1, 1, 1,
-1.238029, 1.135499, -0.2133783, 1, 1, 1, 1, 1,
-1.221691, -0.6974065, -0.5327974, 1, 1, 1, 1, 1,
-1.218367, -1.308194, -0.7300118, 1, 1, 1, 1, 1,
-1.211089, 1.665814, -0.8917489, 1, 1, 1, 1, 1,
-1.191164, -0.8127972, -1.076231, 1, 1, 1, 1, 1,
-1.191151, 0.291935, -0.4803216, 1, 1, 1, 1, 1,
-1.183881, 0.6840582, -1.147921, 1, 1, 1, 1, 1,
-1.181867, -0.2792965, -2.221566, 1, 1, 1, 1, 1,
-1.171441, 1.535903, 0.411842, 1, 1, 1, 1, 1,
-1.163506, 1.058627, -1.344703, 1, 1, 1, 1, 1,
-1.160623, 0.3707191, -0.3456898, 1, 1, 1, 1, 1,
-1.158505, 0.8467944, -1.29684, 0, 0, 1, 1, 1,
-1.158434, 0.2279514, -3.660338, 1, 0, 0, 1, 1,
-1.152097, -0.8182649, -2.142565, 1, 0, 0, 1, 1,
-1.142852, -0.7773301, -0.4404884, 1, 0, 0, 1, 1,
-1.142294, -0.7290008, -4.536763, 1, 0, 0, 1, 1,
-1.142061, 0.04278682, -2.580802, 1, 0, 0, 1, 1,
-1.141511, 0.9724121, 0.6764916, 0, 0, 0, 1, 1,
-1.141399, 0.5031031, -1.332937, 0, 0, 0, 1, 1,
-1.126938, 0.2652283, -1.880755, 0, 0, 0, 1, 1,
-1.12517, -0.9081355, -3.749326, 0, 0, 0, 1, 1,
-1.117019, -0.9318168, -3.166501, 0, 0, 0, 1, 1,
-1.108071, 0.5385199, -3.104565, 0, 0, 0, 1, 1,
-1.107872, 0.07425896, -1.843993, 0, 0, 0, 1, 1,
-1.106885, -0.3294434, -2.17434, 1, 1, 1, 1, 1,
-1.096859, 0.2698761, -2.033761, 1, 1, 1, 1, 1,
-1.094193, 0.220219, -0.04403386, 1, 1, 1, 1, 1,
-1.094119, 0.924369, -0.3994004, 1, 1, 1, 1, 1,
-1.085745, -1.243524, -3.229669, 1, 1, 1, 1, 1,
-1.079992, -1.366449, -1.819041, 1, 1, 1, 1, 1,
-1.057857, -0.2850399, -3.003881, 1, 1, 1, 1, 1,
-1.048787, 1.460142, -0.4744547, 1, 1, 1, 1, 1,
-1.047944, 0.7484425, 0.6725978, 1, 1, 1, 1, 1,
-1.04486, -1.354632, -4.59934, 1, 1, 1, 1, 1,
-1.042415, -0.8066742, -1.595173, 1, 1, 1, 1, 1,
-1.041479, 0.1734234, -1.739887, 1, 1, 1, 1, 1,
-1.038951, -0.4129044, -2.616789, 1, 1, 1, 1, 1,
-1.029997, 0.7875916, -1.225758, 1, 1, 1, 1, 1,
-1.023964, -0.9508693, -1.938924, 1, 1, 1, 1, 1,
-1.022216, 0.5250452, -1.356804, 0, 0, 1, 1, 1,
-1.021068, -0.5712548, -2.278429, 1, 0, 0, 1, 1,
-1.013881, -1.882816, -2.502214, 1, 0, 0, 1, 1,
-1.013727, -0.6945438, -2.399263, 1, 0, 0, 1, 1,
-1.008391, -0.1119152, -0.851291, 1, 0, 0, 1, 1,
-1.001741, -0.3448328, -1.214925, 1, 0, 0, 1, 1,
-0.9973022, 1.051466, -0.3609382, 0, 0, 0, 1, 1,
-0.9971915, 0.3021465, -1.614465, 0, 0, 0, 1, 1,
-0.9969418, 0.9030042, 0.8362764, 0, 0, 0, 1, 1,
-0.9943897, -1.025924, -1.622242, 0, 0, 0, 1, 1,
-0.9882625, 0.3885142, -0.1722682, 0, 0, 0, 1, 1,
-0.9872431, 0.05944791, 0.26135, 0, 0, 0, 1, 1,
-0.9870752, -0.07081773, -1.996016, 0, 0, 0, 1, 1,
-0.9861637, 0.2702846, -1.837458, 1, 1, 1, 1, 1,
-0.9847226, 0.02753386, -2.720205, 1, 1, 1, 1, 1,
-0.9797623, -2.141223, -1.269568, 1, 1, 1, 1, 1,
-0.9786245, 1.784989, 0.6670981, 1, 1, 1, 1, 1,
-0.9685158, -0.800223, -1.672177, 1, 1, 1, 1, 1,
-0.9609982, -1.035483, -0.8437819, 1, 1, 1, 1, 1,
-0.9597625, -0.3844201, -2.252831, 1, 1, 1, 1, 1,
-0.9554093, 0.1765238, -3.228861, 1, 1, 1, 1, 1,
-0.9553325, 0.9436272, 0.75423, 1, 1, 1, 1, 1,
-0.9551696, 1.796616, -0.1785305, 1, 1, 1, 1, 1,
-0.9537545, 0.07549716, -2.353882, 1, 1, 1, 1, 1,
-0.9355103, -0.4441375, -1.830744, 1, 1, 1, 1, 1,
-0.9316002, 0.4757512, -1.843903, 1, 1, 1, 1, 1,
-0.9289237, 1.698591, -0.3518426, 1, 1, 1, 1, 1,
-0.9245427, -1.726089, -2.475993, 1, 1, 1, 1, 1,
-0.9203301, 1.38301, 0.5668764, 0, 0, 1, 1, 1,
-0.9136306, -0.23991, -1.366704, 1, 0, 0, 1, 1,
-0.9100337, 1.252824, 2.09479, 1, 0, 0, 1, 1,
-0.9093024, -0.8214651, -1.836516, 1, 0, 0, 1, 1,
-0.9091244, -0.8033493, -1.053951, 1, 0, 0, 1, 1,
-0.9055445, -0.1391808, -1.535843, 1, 0, 0, 1, 1,
-0.9054004, 1.849445, 0.05148846, 0, 0, 0, 1, 1,
-0.9033217, -1.001311, -3.206664, 0, 0, 0, 1, 1,
-0.8972938, 2.439693, -1.670081, 0, 0, 0, 1, 1,
-0.8970856, -1.373113, -3.248168, 0, 0, 0, 1, 1,
-0.896195, -0.9277076, 0.1745774, 0, 0, 0, 1, 1,
-0.8951007, 0.5335949, -0.3351778, 0, 0, 0, 1, 1,
-0.8937057, -1.084184, -2.793014, 0, 0, 0, 1, 1,
-0.890403, 0.3770429, -2.696278, 1, 1, 1, 1, 1,
-0.8863429, -0.1371274, -1.929706, 1, 1, 1, 1, 1,
-0.8827736, 0.9768065, -0.6847106, 1, 1, 1, 1, 1,
-0.882664, 0.215716, -3.057812, 1, 1, 1, 1, 1,
-0.8786466, -0.4428873, -1.940631, 1, 1, 1, 1, 1,
-0.8778788, 0.8217531, -0.04197984, 1, 1, 1, 1, 1,
-0.8623518, 1.315599, -1.467277, 1, 1, 1, 1, 1,
-0.8618023, 0.03903041, -1.773338, 1, 1, 1, 1, 1,
-0.8601173, 0.234752, -1.867518, 1, 1, 1, 1, 1,
-0.8560494, 1.240314, -1.237521, 1, 1, 1, 1, 1,
-0.8502863, -1.116764, -2.822045, 1, 1, 1, 1, 1,
-0.8446491, 1.188295, -1.359714, 1, 1, 1, 1, 1,
-0.8443231, 1.179709, -1.452986, 1, 1, 1, 1, 1,
-0.8442094, -0.01537725, -0.8555608, 1, 1, 1, 1, 1,
-0.8432882, -1.093156, -2.222667, 1, 1, 1, 1, 1,
-0.8402296, 0.01123301, -1.76603, 0, 0, 1, 1, 1,
-0.8312492, -0.5798114, -3.175923, 1, 0, 0, 1, 1,
-0.8261983, -0.01733475, -0.8264325, 1, 0, 0, 1, 1,
-0.8254724, 0.9370242, -0.1018074, 1, 0, 0, 1, 1,
-0.8211669, -0.02032506, -1.836847, 1, 0, 0, 1, 1,
-0.8191914, 0.137035, -2.461893, 1, 0, 0, 1, 1,
-0.8180008, -1.322196, -2.12369, 0, 0, 0, 1, 1,
-0.8088263, 0.4060713, -1.720512, 0, 0, 0, 1, 1,
-0.8082118, -0.5572771, -2.801592, 0, 0, 0, 1, 1,
-0.8028659, 1.871384, -1.079614, 0, 0, 0, 1, 1,
-0.79637, 0.3196199, -1.026091, 0, 0, 0, 1, 1,
-0.7912754, 1.849293, -1.000172, 0, 0, 0, 1, 1,
-0.7882392, 0.7778895, -0.9570161, 0, 0, 0, 1, 1,
-0.7864215, -0.533358, -3.51632, 1, 1, 1, 1, 1,
-0.7846822, 0.04417735, -2.125435, 1, 1, 1, 1, 1,
-0.7813637, -0.4404979, -2.4791, 1, 1, 1, 1, 1,
-0.7783839, 1.284147, -0.5818795, 1, 1, 1, 1, 1,
-0.7774909, -0.5834575, -3.795232, 1, 1, 1, 1, 1,
-0.7756197, 0.6385573, -2.248111, 1, 1, 1, 1, 1,
-0.7735251, -0.2780789, -1.708787, 1, 1, 1, 1, 1,
-0.7726616, -0.8368605, -0.8234714, 1, 1, 1, 1, 1,
-0.7704238, -0.6884038, -2.806657, 1, 1, 1, 1, 1,
-0.7665574, -0.08281543, -1.632628, 1, 1, 1, 1, 1,
-0.7629297, -1.110993, -3.417675, 1, 1, 1, 1, 1,
-0.7580585, 1.056586, -0.7049161, 1, 1, 1, 1, 1,
-0.7553641, 1.609488, 1.002291, 1, 1, 1, 1, 1,
-0.7547207, 0.4487644, 1.848694, 1, 1, 1, 1, 1,
-0.753929, -1.552714, -2.294295, 1, 1, 1, 1, 1,
-0.7527016, 0.2681394, -2.470012, 0, 0, 1, 1, 1,
-0.7515538, -0.7492368, -3.064185, 1, 0, 0, 1, 1,
-0.7436967, 0.2931947, -1.743085, 1, 0, 0, 1, 1,
-0.7392461, -0.131546, 0.4763695, 1, 0, 0, 1, 1,
-0.7374312, -0.4120009, -2.101958, 1, 0, 0, 1, 1,
-0.7304909, 0.02688719, -0.2289781, 1, 0, 0, 1, 1,
-0.7279201, 1.078418, -0.5727115, 0, 0, 0, 1, 1,
-0.7270914, 0.9701338, -0.01487899, 0, 0, 0, 1, 1,
-0.7268226, -0.8556249, -2.132481, 0, 0, 0, 1, 1,
-0.7251109, -0.724048, -0.6110187, 0, 0, 0, 1, 1,
-0.714443, -0.2036835, -1.745289, 0, 0, 0, 1, 1,
-0.7062441, -0.3958526, -2.000767, 0, 0, 0, 1, 1,
-0.7044386, 1.344094, -1.289506, 0, 0, 0, 1, 1,
-0.7020604, -1.222301, -2.228328, 1, 1, 1, 1, 1,
-0.6999277, 0.4859792, -1.088215, 1, 1, 1, 1, 1,
-0.6982586, 0.7432796, -0.2247902, 1, 1, 1, 1, 1,
-0.6970963, 0.1903818, -1.361362, 1, 1, 1, 1, 1,
-0.6957994, 0.8812344, 0.09166006, 1, 1, 1, 1, 1,
-0.6945978, -0.6376752, -1.827223, 1, 1, 1, 1, 1,
-0.6930062, 0.747909, -1.476131, 1, 1, 1, 1, 1,
-0.6866462, -2.245837, -3.837236, 1, 1, 1, 1, 1,
-0.682012, -0.333556, -2.021888, 1, 1, 1, 1, 1,
-0.6741185, -1.396679, -2.219064, 1, 1, 1, 1, 1,
-0.6721717, 0.3116398, -1.17147, 1, 1, 1, 1, 1,
-0.6703485, -0.257017, -2.747937, 1, 1, 1, 1, 1,
-0.6654392, -0.3447769, -2.917781, 1, 1, 1, 1, 1,
-0.6569976, -0.5133025, -2.771425, 1, 1, 1, 1, 1,
-0.6556656, 0.4132914, -0.8489756, 1, 1, 1, 1, 1,
-0.6500698, -0.1333894, -2.37832, 0, 0, 1, 1, 1,
-0.6465929, 0.2542474, -1.34799, 1, 0, 0, 1, 1,
-0.6457949, 0.7478893, -1.205917, 1, 0, 0, 1, 1,
-0.6454012, -0.8686607, -5.110085, 1, 0, 0, 1, 1,
-0.6414174, 0.6348731, -1.624127, 1, 0, 0, 1, 1,
-0.6407557, 0.8189185, 0.4527121, 1, 0, 0, 1, 1,
-0.6398902, 0.1543954, -1.75181, 0, 0, 0, 1, 1,
-0.6335574, -0.7706118, -2.366461, 0, 0, 0, 1, 1,
-0.6321005, -0.7789583, -2.480028, 0, 0, 0, 1, 1,
-0.6288384, -0.855879, -2.782729, 0, 0, 0, 1, 1,
-0.6284076, 0.8504641, -1.389158, 0, 0, 0, 1, 1,
-0.6107649, 1.635107, 0.4295905, 0, 0, 0, 1, 1,
-0.6056394, 0.7115662, 0.210529, 0, 0, 0, 1, 1,
-0.6028317, -0.5571684, -1.427125, 1, 1, 1, 1, 1,
-0.6028035, -0.6882994, -2.896593, 1, 1, 1, 1, 1,
-0.6010592, -1.596057, -1.608874, 1, 1, 1, 1, 1,
-0.598534, 0.6190107, -2.790741, 1, 1, 1, 1, 1,
-0.5963495, 1.131667, -0.6999983, 1, 1, 1, 1, 1,
-0.5949174, 1.308539, -0.6848901, 1, 1, 1, 1, 1,
-0.5948281, -0.4721428, 0.03678409, 1, 1, 1, 1, 1,
-0.5887082, -0.6892827, -3.237915, 1, 1, 1, 1, 1,
-0.5873621, 0.1995681, -1.143984, 1, 1, 1, 1, 1,
-0.5870362, 0.2907025, -3.07209, 1, 1, 1, 1, 1,
-0.5812945, -3.00631, -0.7388813, 1, 1, 1, 1, 1,
-0.5798223, -0.04088224, -1.793953, 1, 1, 1, 1, 1,
-0.5785863, 0.08426776, 0.07240046, 1, 1, 1, 1, 1,
-0.5726168, -0.5180013, -1.246741, 1, 1, 1, 1, 1,
-0.5703603, -0.5824088, -0.3064435, 1, 1, 1, 1, 1,
-0.5686855, 1.139489, -0.6855673, 0, 0, 1, 1, 1,
-0.560929, 0.2047903, -0.2508332, 1, 0, 0, 1, 1,
-0.5602705, 0.3530714, 0.4563754, 1, 0, 0, 1, 1,
-0.5573505, -0.05418708, -1.189005, 1, 0, 0, 1, 1,
-0.5571583, 1.767038, -1.185381, 1, 0, 0, 1, 1,
-0.5487344, 1.482727, -0.8076499, 1, 0, 0, 1, 1,
-0.5419264, 0.8449508, 1.260729, 0, 0, 0, 1, 1,
-0.5410714, -1.522211, -0.8409976, 0, 0, 0, 1, 1,
-0.5371766, 1.10428, -1.536228, 0, 0, 0, 1, 1,
-0.5325138, 0.3360854, -0.264042, 0, 0, 0, 1, 1,
-0.5323129, 0.2412379, -1.270015, 0, 0, 0, 1, 1,
-0.5313908, 0.8781524, -2.143957, 0, 0, 0, 1, 1,
-0.5271143, -0.5268379, -2.106582, 0, 0, 0, 1, 1,
-0.51894, 0.9575937, -1.950853, 1, 1, 1, 1, 1,
-0.5151693, 2.68059, -1.103442, 1, 1, 1, 1, 1,
-0.5076267, 0.1527711, -2.280361, 1, 1, 1, 1, 1,
-0.5075864, 0.8026239, -1.263579, 1, 1, 1, 1, 1,
-0.4989305, -0.1200392, -2.298806, 1, 1, 1, 1, 1,
-0.4984998, -0.3807487, -1.076535, 1, 1, 1, 1, 1,
-0.4970874, 0.760226, -1.255711, 1, 1, 1, 1, 1,
-0.4952259, 0.211715, 0.3838674, 1, 1, 1, 1, 1,
-0.4949034, -1.029481, -3.609419, 1, 1, 1, 1, 1,
-0.48725, 0.4315844, -1.432178, 1, 1, 1, 1, 1,
-0.4871562, 0.9945079, -0.4343632, 1, 1, 1, 1, 1,
-0.4809184, 0.4948449, -1.417049, 1, 1, 1, 1, 1,
-0.4782793, 0.5609329, -0.451723, 1, 1, 1, 1, 1,
-0.4774725, 1.128046, -1.794842, 1, 1, 1, 1, 1,
-0.4773737, -0.753637, -2.667101, 1, 1, 1, 1, 1,
-0.476668, -1.304942, -2.875628, 0, 0, 1, 1, 1,
-0.4733594, -1.68001, -2.180012, 1, 0, 0, 1, 1,
-0.4716153, -1.29279, -3.730263, 1, 0, 0, 1, 1,
-0.4712024, 0.3530621, 0.4982253, 1, 0, 0, 1, 1,
-0.4708081, -0.5015845, -0.2412185, 1, 0, 0, 1, 1,
-0.4658573, -1.02797, -1.58041, 1, 0, 0, 1, 1,
-0.465602, -0.2226893, -3.025322, 0, 0, 0, 1, 1,
-0.4650195, 0.946519, 0.2092079, 0, 0, 0, 1, 1,
-0.4639013, 1.316527, 0.423829, 0, 0, 0, 1, 1,
-0.4619806, 0.03591752, 1.042382, 0, 0, 0, 1, 1,
-0.4586163, 0.9224412, -1.756237, 0, 0, 0, 1, 1,
-0.4538857, -1.314617, -2.559407, 0, 0, 0, 1, 1,
-0.4536785, -0.6482763, -1.658612, 0, 0, 0, 1, 1,
-0.4504589, 0.4843285, 1.834752, 1, 1, 1, 1, 1,
-0.4457662, 0.3055091, -3.196787, 1, 1, 1, 1, 1,
-0.4445754, -0.6888472, -0.3643072, 1, 1, 1, 1, 1,
-0.4308858, -0.7318553, -2.904349, 1, 1, 1, 1, 1,
-0.4265883, 0.849294, -0.5177374, 1, 1, 1, 1, 1,
-0.4254509, -0.5937819, -2.76972, 1, 1, 1, 1, 1,
-0.4099905, -0.4068978, -3.665835, 1, 1, 1, 1, 1,
-0.4099559, -0.066369, -2.188289, 1, 1, 1, 1, 1,
-0.4090998, -0.550335, -3.115726, 1, 1, 1, 1, 1,
-0.4076378, 0.8541459, -0.289694, 1, 1, 1, 1, 1,
-0.4018639, 0.1047792, -2.380548, 1, 1, 1, 1, 1,
-0.4016243, -0.3343586, -2.089352, 1, 1, 1, 1, 1,
-0.4005551, 0.2668532, -2.06063, 1, 1, 1, 1, 1,
-0.3928863, -1.060714, -2.841013, 1, 1, 1, 1, 1,
-0.3922107, -0.3004007, -5.127784, 1, 1, 1, 1, 1,
-0.390916, 1.477971, 2.455041, 0, 0, 1, 1, 1,
-0.3908484, 0.8948843, 1.040167, 1, 0, 0, 1, 1,
-0.390714, -1.155572, -3.807995, 1, 0, 0, 1, 1,
-0.3892388, -1.039929, -4.602149, 1, 0, 0, 1, 1,
-0.3883417, 0.004136365, 0.2725733, 1, 0, 0, 1, 1,
-0.386376, -1.567648, -3.554067, 1, 0, 0, 1, 1,
-0.3860242, -1.46362, -1.69167, 0, 0, 0, 1, 1,
-0.3853099, 0.01431472, -1.34768, 0, 0, 0, 1, 1,
-0.3846235, -0.1296984, -0.8267951, 0, 0, 0, 1, 1,
-0.3786405, 0.1279785, -1.522307, 0, 0, 0, 1, 1,
-0.376504, -0.7178859, -3.641972, 0, 0, 0, 1, 1,
-0.3733103, -1.447146, -4.153333, 0, 0, 0, 1, 1,
-0.371668, 0.08984247, 0.7236695, 0, 0, 0, 1, 1,
-0.3678468, 0.6387644, -1.849339, 1, 1, 1, 1, 1,
-0.3666137, -0.8642153, -2.431374, 1, 1, 1, 1, 1,
-0.3659897, -0.5775356, -2.034347, 1, 1, 1, 1, 1,
-0.3626218, 0.1815279, -0.5939109, 1, 1, 1, 1, 1,
-0.3582123, 0.7797678, -0.9549114, 1, 1, 1, 1, 1,
-0.3520051, 0.2305803, -1.403103, 1, 1, 1, 1, 1,
-0.351929, 0.709899, 0.05407712, 1, 1, 1, 1, 1,
-0.3516352, -0.1648498, -2.453585, 1, 1, 1, 1, 1,
-0.3472292, 1.256492, -1.119069, 1, 1, 1, 1, 1,
-0.3427965, 1.855276, 2.200989, 1, 1, 1, 1, 1,
-0.3427282, -0.2872903, -2.47366, 1, 1, 1, 1, 1,
-0.3377753, 0.6552029, -0.3181492, 1, 1, 1, 1, 1,
-0.3376, 0.8362309, -0.783053, 1, 1, 1, 1, 1,
-0.3348703, 1.272133, -0.9846991, 1, 1, 1, 1, 1,
-0.3338681, -0.4790575, -3.02614, 1, 1, 1, 1, 1,
-0.333558, -0.7509675, -4.147346, 0, 0, 1, 1, 1,
-0.3335139, 1.377714, -2.414592, 1, 0, 0, 1, 1,
-0.3325855, 1.454454, 0.9463677, 1, 0, 0, 1, 1,
-0.3303292, 0.3830713, -0.03718685, 1, 0, 0, 1, 1,
-0.3285412, -1.556967, -3.243023, 1, 0, 0, 1, 1,
-0.3257116, -0.665862, -3.230503, 1, 0, 0, 1, 1,
-0.3193159, -0.4819056, -3.2118, 0, 0, 0, 1, 1,
-0.3189153, 0.4600173, -0.7733459, 0, 0, 0, 1, 1,
-0.3177345, 0.9639926, 0.05281664, 0, 0, 0, 1, 1,
-0.3175699, 1.396334, -0.6240743, 0, 0, 0, 1, 1,
-0.3157152, -2.117951, -1.227134, 0, 0, 0, 1, 1,
-0.3073746, -1.969025, -4.292972, 0, 0, 0, 1, 1,
-0.3051146, 1.90286, -0.501282, 0, 0, 0, 1, 1,
-0.3041199, 1.925907, 1.332568, 1, 1, 1, 1, 1,
-0.3037952, 0.05229342, -1.648748, 1, 1, 1, 1, 1,
-0.3003196, 0.5871004, 2.002384, 1, 1, 1, 1, 1,
-0.2999563, 0.2098519, -0.2974095, 1, 1, 1, 1, 1,
-0.2990777, 0.2359049, -0.9311748, 1, 1, 1, 1, 1,
-0.2969786, 0.5668293, -0.4725989, 1, 1, 1, 1, 1,
-0.296076, 1.244395, 0.6327599, 1, 1, 1, 1, 1,
-0.2955477, 1.408498, -0.2255974, 1, 1, 1, 1, 1,
-0.2947078, 0.04759535, -1.571155, 1, 1, 1, 1, 1,
-0.2882631, 0.2781068, 0.09048834, 1, 1, 1, 1, 1,
-0.2830777, -0.6621074, -3.087777, 1, 1, 1, 1, 1,
-0.2816035, 0.973943, -1.05731, 1, 1, 1, 1, 1,
-0.2813121, 0.5815256, 0.02727454, 1, 1, 1, 1, 1,
-0.2794686, 0.1225649, -3.095254, 1, 1, 1, 1, 1,
-0.2769822, -0.9615092, -2.968149, 1, 1, 1, 1, 1,
-0.2759692, -0.02160782, 0.3155621, 0, 0, 1, 1, 1,
-0.2692668, -1.461652, -3.601202, 1, 0, 0, 1, 1,
-0.2663037, 0.7554018, -1.841716, 1, 0, 0, 1, 1,
-0.2662925, -0.2308516, -1.080784, 1, 0, 0, 1, 1,
-0.2643998, 0.614574, -1.619482, 1, 0, 0, 1, 1,
-0.2641964, 1.401208, -0.2063644, 1, 0, 0, 1, 1,
-0.2627801, 0.07164961, 0.416818, 0, 0, 0, 1, 1,
-0.2577129, 0.2742037, -1.43584, 0, 0, 0, 1, 1,
-0.2573967, -0.1874898, -1.994829, 0, 0, 0, 1, 1,
-0.2561583, 0.1011502, -2.792724, 0, 0, 0, 1, 1,
-0.2517014, -1.333826, -2.330228, 0, 0, 0, 1, 1,
-0.2461597, -1.393042, -1.573168, 0, 0, 0, 1, 1,
-0.246043, 1.160151, 1.480229, 0, 0, 0, 1, 1,
-0.2432687, 2.438753, -1.328254, 1, 1, 1, 1, 1,
-0.2398248, 0.3116056, -0.09784594, 1, 1, 1, 1, 1,
-0.2368074, 0.1776115, -0.9829493, 1, 1, 1, 1, 1,
-0.2344624, 1.165946, -0.8718188, 1, 1, 1, 1, 1,
-0.2328125, 0.5293634, 0.8982252, 1, 1, 1, 1, 1,
-0.2319622, -1.220739, -3.279073, 1, 1, 1, 1, 1,
-0.2316986, 0.7330745, 0.7812248, 1, 1, 1, 1, 1,
-0.2300506, -0.6641262, -2.686336, 1, 1, 1, 1, 1,
-0.2285004, 0.1500059, -0.1693662, 1, 1, 1, 1, 1,
-0.2273587, 0.7949792, -0.4992476, 1, 1, 1, 1, 1,
-0.2238321, 0.1468203, -2.820865, 1, 1, 1, 1, 1,
-0.2218539, 0.9020165, -1.010188, 1, 1, 1, 1, 1,
-0.2217576, 0.4592554, 0.05240491, 1, 1, 1, 1, 1,
-0.2205738, -0.6686823, -1.217015, 1, 1, 1, 1, 1,
-0.2198006, -0.6222417, -3.426346, 1, 1, 1, 1, 1,
-0.219699, -1.11823, -2.955878, 0, 0, 1, 1, 1,
-0.2150008, -0.6346376, -2.781768, 1, 0, 0, 1, 1,
-0.2120788, 0.2439221, -0.5318565, 1, 0, 0, 1, 1,
-0.2069036, 0.7463921, -0.6233999, 1, 0, 0, 1, 1,
-0.2042381, 0.9495573, 0.2984563, 1, 0, 0, 1, 1,
-0.200831, 0.5935804, -0.4726187, 1, 0, 0, 1, 1,
-0.1995584, 0.6700534, 1.050307, 0, 0, 0, 1, 1,
-0.1967669, 0.131003, -0.2687065, 0, 0, 0, 1, 1,
-0.1910228, -1.178903, -3.081247, 0, 0, 0, 1, 1,
-0.1851823, 2.437139, -0.04836323, 0, 0, 0, 1, 1,
-0.1841746, -0.3897829, -3.956366, 0, 0, 0, 1, 1,
-0.1829133, 0.332818, -1.149777, 0, 0, 0, 1, 1,
-0.1823791, -0.03314284, -3.294213, 0, 0, 0, 1, 1,
-0.1796857, 0.6099769, -1.503489, 1, 1, 1, 1, 1,
-0.1796633, -0.9465703, -1.101332, 1, 1, 1, 1, 1,
-0.1792933, -1.181491, -2.165942, 1, 1, 1, 1, 1,
-0.1765413, 0.5634662, -0.3698177, 1, 1, 1, 1, 1,
-0.1738369, 0.2317566, -0.1239253, 1, 1, 1, 1, 1,
-0.1656995, 1.352525, -1.106411, 1, 1, 1, 1, 1,
-0.1655686, 0.6147396, 0.7097991, 1, 1, 1, 1, 1,
-0.1642868, 0.5249664, -0.3472454, 1, 1, 1, 1, 1,
-0.1615091, 0.04797383, -1.232418, 1, 1, 1, 1, 1,
-0.1574024, 1.805542, 0.7063587, 1, 1, 1, 1, 1,
-0.1561446, 0.7559973, 0.3037254, 1, 1, 1, 1, 1,
-0.1549357, -2.008593, -3.553661, 1, 1, 1, 1, 1,
-0.1548098, -0.322963, -3.866139, 1, 1, 1, 1, 1,
-0.1494871, -0.6946325, -3.683162, 1, 1, 1, 1, 1,
-0.147147, 1.061082, -0.8588468, 1, 1, 1, 1, 1,
-0.1453037, -0.4395205, -2.607602, 0, 0, 1, 1, 1,
-0.144178, -0.6303285, -2.230973, 1, 0, 0, 1, 1,
-0.1390983, 0.7030302, -0.6448346, 1, 0, 0, 1, 1,
-0.1385099, -0.03612977, -1.695339, 1, 0, 0, 1, 1,
-0.1340409, -1.065889, -1.890122, 1, 0, 0, 1, 1,
-0.1324985, 0.7158281, -1.251616, 1, 0, 0, 1, 1,
-0.1315427, -0.6115904, -2.710362, 0, 0, 0, 1, 1,
-0.1312132, -0.5650524, -3.5696, 0, 0, 0, 1, 1,
-0.1306325, 0.1685633, -1.011727, 0, 0, 0, 1, 1,
-0.1303101, -2.240738, -4.344234, 0, 0, 0, 1, 1,
-0.1271288, -1.608366, -3.951667, 0, 0, 0, 1, 1,
-0.1270629, -1.693767, -4.48068, 0, 0, 0, 1, 1,
-0.1256367, -1.285717, -2.614332, 0, 0, 0, 1, 1,
-0.1240447, -1.5861, -2.73018, 1, 1, 1, 1, 1,
-0.1191248, 1.482362, -0.7415691, 1, 1, 1, 1, 1,
-0.118632, 0.01967579, -1.668379, 1, 1, 1, 1, 1,
-0.1185085, -0.9199243, -1.48264, 1, 1, 1, 1, 1,
-0.1167236, 0.062413, 0.08717843, 1, 1, 1, 1, 1,
-0.115416, -1.7573, -3.081752, 1, 1, 1, 1, 1,
-0.1124409, -0.9924757, -3.778954, 1, 1, 1, 1, 1,
-0.1102677, 0.6615461, -0.352825, 1, 1, 1, 1, 1,
-0.1023118, 0.03376417, -1.292114, 1, 1, 1, 1, 1,
-0.0989809, -0.2850785, -3.764452, 1, 1, 1, 1, 1,
-0.09820307, -0.9905551, -2.73307, 1, 1, 1, 1, 1,
-0.09670336, -0.5590411, -2.110825, 1, 1, 1, 1, 1,
-0.09666489, -1.289706, -3.087752, 1, 1, 1, 1, 1,
-0.09567235, -1.045575, -3.843707, 1, 1, 1, 1, 1,
-0.09431239, 0.4048665, -0.8184862, 1, 1, 1, 1, 1,
-0.09126663, -0.1758823, -2.083508, 0, 0, 1, 1, 1,
-0.08550133, 0.3466513, -0.7733329, 1, 0, 0, 1, 1,
-0.0797605, -0.1081593, -0.424615, 1, 0, 0, 1, 1,
-0.07562561, 0.4342133, -0.7023979, 1, 0, 0, 1, 1,
-0.07372659, -0.3298495, -1.45373, 1, 0, 0, 1, 1,
-0.07358702, -1.736455, -3.244299, 1, 0, 0, 1, 1,
-0.07263146, -0.6884651, -3.228114, 0, 0, 0, 1, 1,
-0.07196823, -0.2850552, -2.191588, 0, 0, 0, 1, 1,
-0.06941462, 1.063361, 0.08675934, 0, 0, 0, 1, 1,
-0.06663749, -0.761808, -2.18425, 0, 0, 0, 1, 1,
-0.06578277, -0.8491975, -1.905063, 0, 0, 0, 1, 1,
-0.06309193, -0.562198, -2.797805, 0, 0, 0, 1, 1,
-0.06308909, 0.8889382, 0.2289124, 0, 0, 0, 1, 1,
-0.06098411, 0.1555338, -1.472217, 1, 1, 1, 1, 1,
-0.05553781, 0.896134, -1.76434, 1, 1, 1, 1, 1,
-0.05021949, 1.733715, 0.4111562, 1, 1, 1, 1, 1,
-0.04769589, 1.129687, -0.5765399, 1, 1, 1, 1, 1,
-0.04307633, -0.4200825, -4.491777, 1, 1, 1, 1, 1,
-0.04136273, -1.355397, -4.116553, 1, 1, 1, 1, 1,
-0.04096567, -0.2419173, -4.00846, 1, 1, 1, 1, 1,
-0.03901951, 0.336057, 0.6447615, 1, 1, 1, 1, 1,
-0.03502212, 0.8346072, -0.4720316, 1, 1, 1, 1, 1,
-0.03357209, -0.1237607, -2.377953, 1, 1, 1, 1, 1,
-0.03190831, -1.882634, -3.156628, 1, 1, 1, 1, 1,
-0.02739945, 0.2387774, 1.26061, 1, 1, 1, 1, 1,
-0.02532036, 0.4872886, -0.9954385, 1, 1, 1, 1, 1,
-0.01993452, 0.2046903, 1.064412, 1, 1, 1, 1, 1,
-0.01946165, 1.063013, 0.4615043, 1, 1, 1, 1, 1,
-0.01873628, -0.8736324, -4.016107, 0, 0, 1, 1, 1,
-0.01807056, -1.373608, -4.042806, 1, 0, 0, 1, 1,
-0.007907311, 0.3621706, -1.189845, 1, 0, 0, 1, 1,
-0.007050228, 0.7011468, 0.271692, 1, 0, 0, 1, 1,
-0.003535844, 0.2617873, 1.370235, 1, 0, 0, 1, 1,
-0.003052028, 0.7620733, 1.176525, 1, 0, 0, 1, 1,
-0.000976781, 0.4873273, 0.1472072, 0, 0, 0, 1, 1,
-0.000249722, 0.1583444, -0.3219047, 0, 0, 0, 1, 1,
0.0007024052, 0.1041055, 1.621373, 0, 0, 0, 1, 1,
0.0007772768, 0.8717471, 0.4628509, 0, 0, 0, 1, 1,
0.002990779, 0.1949813, -1.014732, 0, 0, 0, 1, 1,
0.007726009, -0.5065515, 4.326573, 0, 0, 0, 1, 1,
0.0141014, 0.5824388, -0.09494068, 0, 0, 0, 1, 1,
0.01573073, 0.5901288, 2.311111, 1, 1, 1, 1, 1,
0.02055723, -0.2907734, 4.109344, 1, 1, 1, 1, 1,
0.02425009, 0.3857285, -0.292803, 1, 1, 1, 1, 1,
0.02755513, -0.08050483, 3.745093, 1, 1, 1, 1, 1,
0.03009197, 0.1656668, -0.8764292, 1, 1, 1, 1, 1,
0.03238847, 0.547646, 0.3759831, 1, 1, 1, 1, 1,
0.0365138, -1.101576, 1.530162, 1, 1, 1, 1, 1,
0.03671605, -0.2669434, 2.839159, 1, 1, 1, 1, 1,
0.04324361, 0.6504072, 1.450494, 1, 1, 1, 1, 1,
0.04418523, -0.7582625, 3.711662, 1, 1, 1, 1, 1,
0.04473753, -0.3739423, 3.176661, 1, 1, 1, 1, 1,
0.04803509, -1.199855, 2.764808, 1, 1, 1, 1, 1,
0.04949361, -0.02662271, 0.4661462, 1, 1, 1, 1, 1,
0.04984384, 1.521244, 0.7890899, 1, 1, 1, 1, 1,
0.05145204, -0.661478, 3.7528, 1, 1, 1, 1, 1,
0.05987579, -0.778981, 3.762215, 0, 0, 1, 1, 1,
0.06188156, -0.1152767, 3.433188, 1, 0, 0, 1, 1,
0.06385293, -0.7848342, 5.092963, 1, 0, 0, 1, 1,
0.06537052, -0.4673414, 3.187026, 1, 0, 0, 1, 1,
0.07242141, -0.1455612, 2.387212, 1, 0, 0, 1, 1,
0.07546211, 0.1395189, -0.1891322, 1, 0, 0, 1, 1,
0.07618531, -0.1575478, 2.100521, 0, 0, 0, 1, 1,
0.0788541, 0.8171653, 0.8512609, 0, 0, 0, 1, 1,
0.07921785, 0.5696408, -0.7206039, 0, 0, 0, 1, 1,
0.08070125, 0.1741258, 0.4576995, 0, 0, 0, 1, 1,
0.08799249, 1.431161, -0.0401721, 0, 0, 0, 1, 1,
0.09391139, -0.9545406, 3.221604, 0, 0, 0, 1, 1,
0.09843463, -1.195553, 3.151662, 0, 0, 0, 1, 1,
0.09882735, -0.7602226, 3.405221, 1, 1, 1, 1, 1,
0.1026519, 0.645578, 0.5250022, 1, 1, 1, 1, 1,
0.1030679, 0.02569679, 0.6037716, 1, 1, 1, 1, 1,
0.1039437, 0.1346053, 1.794298, 1, 1, 1, 1, 1,
0.107067, -0.6768752, 1.621937, 1, 1, 1, 1, 1,
0.1081091, -2.201916, 2.817891, 1, 1, 1, 1, 1,
0.1122036, -2.168945, 3.235686, 1, 1, 1, 1, 1,
0.1154412, 2.811893, 1.198895, 1, 1, 1, 1, 1,
0.1274895, -0.718058, 4.406095, 1, 1, 1, 1, 1,
0.1303797, -0.3332452, 0.00476191, 1, 1, 1, 1, 1,
0.133282, -0.3632587, 2.97947, 1, 1, 1, 1, 1,
0.1378574, 1.265784, -1.174994, 1, 1, 1, 1, 1,
0.1393681, -1.723038, 4.561873, 1, 1, 1, 1, 1,
0.1415662, -1.183015, 5.063052, 1, 1, 1, 1, 1,
0.1471267, -1.696458, 1.837149, 1, 1, 1, 1, 1,
0.1473207, 0.5469342, 1.066747, 0, 0, 1, 1, 1,
0.1497471, -0.7403092, 4.210681, 1, 0, 0, 1, 1,
0.1508478, -0.9498168, 2.508607, 1, 0, 0, 1, 1,
0.1560861, -1.822158, 2.613663, 1, 0, 0, 1, 1,
0.161796, -0.09597482, 0.7355923, 1, 0, 0, 1, 1,
0.16299, 0.3114409, 0.190051, 1, 0, 0, 1, 1,
0.1657439, -0.6748917, 2.778255, 0, 0, 0, 1, 1,
0.169236, -0.4060678, 4.628686, 0, 0, 0, 1, 1,
0.171622, 0.05599678, 0.9053559, 0, 0, 0, 1, 1,
0.1774845, 1.644883, -1.088788, 0, 0, 0, 1, 1,
0.1781307, 1.890401, -1.379399, 0, 0, 0, 1, 1,
0.1840142, 2.617697, -0.1973339, 0, 0, 0, 1, 1,
0.1864826, -1.46352, 3.268844, 0, 0, 0, 1, 1,
0.1935058, -0.8562261, 4.408769, 1, 1, 1, 1, 1,
0.1937748, -0.1704554, 3.794051, 1, 1, 1, 1, 1,
0.1959559, 1.286024, 1.421611, 1, 1, 1, 1, 1,
0.1962522, -2.267516, 2.950653, 1, 1, 1, 1, 1,
0.1962923, -0.6544775, 2.990343, 1, 1, 1, 1, 1,
0.1999698, -0.1300146, 3.016628, 1, 1, 1, 1, 1,
0.2003563, -0.1008473, 3.02234, 1, 1, 1, 1, 1,
0.2034011, -1.237852, 3.178728, 1, 1, 1, 1, 1,
0.2045635, -0.5328204, 3.480163, 1, 1, 1, 1, 1,
0.2071885, 0.1301888, 1.673344, 1, 1, 1, 1, 1,
0.2072607, 2.668557, -0.8770447, 1, 1, 1, 1, 1,
0.2113844, -0.5257398, 2.85404, 1, 1, 1, 1, 1,
0.2131759, -0.969992, 3.898511, 1, 1, 1, 1, 1,
0.2132192, 1.137135, 0.8800962, 1, 1, 1, 1, 1,
0.21435, 0.1013384, 2.027742, 1, 1, 1, 1, 1,
0.2150236, 0.1404228, 2.80689, 0, 0, 1, 1, 1,
0.2189652, 1.946129, 0.5214608, 1, 0, 0, 1, 1,
0.2219204, 0.2236979, 1.614129, 1, 0, 0, 1, 1,
0.2234928, 0.3663015, 1.710679, 1, 0, 0, 1, 1,
0.2255267, 0.2680106, 1.233499, 1, 0, 0, 1, 1,
0.2309254, -0.7518236, 2.077182, 1, 0, 0, 1, 1,
0.2320242, 2.008884, 0.0305371, 0, 0, 0, 1, 1,
0.2383548, 0.0767497, 1.362198, 0, 0, 0, 1, 1,
0.241357, -0.3985503, 3.118956, 0, 0, 0, 1, 1,
0.243977, -0.1420948, 3.020621, 0, 0, 0, 1, 1,
0.2441494, -2.113959, 3.663887, 0, 0, 0, 1, 1,
0.2479015, -0.1156937, 1.833043, 0, 0, 0, 1, 1,
0.2501803, -1.249652, 4.068633, 0, 0, 0, 1, 1,
0.2517138, 0.9167882, 1.050917, 1, 1, 1, 1, 1,
0.2565313, 0.6841775, 1.33244, 1, 1, 1, 1, 1,
0.2570071, 0.2930437, 0.7762965, 1, 1, 1, 1, 1,
0.2573734, 0.3184389, -1.116692, 1, 1, 1, 1, 1,
0.2585863, -1.199771, 3.434299, 1, 1, 1, 1, 1,
0.259856, -0.007405419, 2.089902, 1, 1, 1, 1, 1,
0.2614043, 0.5223727, 1.066983, 1, 1, 1, 1, 1,
0.2617347, -0.2565538, 2.222273, 1, 1, 1, 1, 1,
0.2621801, 0.5880185, 0.7761495, 1, 1, 1, 1, 1,
0.2627694, -0.8314265, 2.851735, 1, 1, 1, 1, 1,
0.2634218, -1.42245, 2.599008, 1, 1, 1, 1, 1,
0.2666563, 0.2878881, 0.3549061, 1, 1, 1, 1, 1,
0.2671091, -0.2052992, 1.233295, 1, 1, 1, 1, 1,
0.2689133, 0.2837988, 2.04742, 1, 1, 1, 1, 1,
0.269891, -0.1243083, 0.828902, 1, 1, 1, 1, 1,
0.2749475, 0.3807882, 1.44275, 0, 0, 1, 1, 1,
0.2783928, 1.186241, -0.7261335, 1, 0, 0, 1, 1,
0.2809973, -0.5999213, 3.659873, 1, 0, 0, 1, 1,
0.2842298, 0.6836871, 0.6841696, 1, 0, 0, 1, 1,
0.2850146, -0.9967489, 3.551362, 1, 0, 0, 1, 1,
0.2851743, 0.3595648, 1.254243, 1, 0, 0, 1, 1,
0.287714, -0.1654893, 3.21196, 0, 0, 0, 1, 1,
0.2897154, 0.6777861, 0.4008048, 0, 0, 0, 1, 1,
0.2922161, -1.600112, 2.850896, 0, 0, 0, 1, 1,
0.2939105, -0.689087, 3.238036, 0, 0, 0, 1, 1,
0.2946478, 0.03410319, 1.513053, 0, 0, 0, 1, 1,
0.3004847, 0.2483645, 1.086241, 0, 0, 0, 1, 1,
0.3011612, 0.2194145, 1.668306, 0, 0, 0, 1, 1,
0.3031107, 0.3524098, 0.7815723, 1, 1, 1, 1, 1,
0.3039476, -0.6188954, 4.557106, 1, 1, 1, 1, 1,
0.3042653, 0.08725455, 1.348778, 1, 1, 1, 1, 1,
0.3053505, 2.444444, 0.9186319, 1, 1, 1, 1, 1,
0.3084766, -1.556707, 3.041937, 1, 1, 1, 1, 1,
0.3088602, 0.0880029, -0.9813638, 1, 1, 1, 1, 1,
0.3101489, 0.6897004, 1.173523, 1, 1, 1, 1, 1,
0.3110865, -0.8518683, 3.429257, 1, 1, 1, 1, 1,
0.3114218, -1.093919, 4.179753, 1, 1, 1, 1, 1,
0.3121963, 0.7052379, 0.8041312, 1, 1, 1, 1, 1,
0.3132473, 0.1947105, -0.7679175, 1, 1, 1, 1, 1,
0.315917, -0.5530418, 3.732128, 1, 1, 1, 1, 1,
0.316342, -0.08907951, 0.8689091, 1, 1, 1, 1, 1,
0.3215466, 0.4838938, -0.2418432, 1, 1, 1, 1, 1,
0.3217569, -1.552587, 3.113304, 1, 1, 1, 1, 1,
0.3245551, -0.06441841, 1.544653, 0, 0, 1, 1, 1,
0.3268287, -0.9799454, 2.00129, 1, 0, 0, 1, 1,
0.3276441, 0.8623784, -0.2651095, 1, 0, 0, 1, 1,
0.3301032, -0.9136822, 2.628106, 1, 0, 0, 1, 1,
0.3426959, -0.7915812, 1.935541, 1, 0, 0, 1, 1,
0.3434636, 0.6195996, 0.2334292, 1, 0, 0, 1, 1,
0.3484882, 2.389869, 1.178359, 0, 0, 0, 1, 1,
0.3486003, 1.23139, 0.2000332, 0, 0, 0, 1, 1,
0.3488114, -0.3686496, 2.601664, 0, 0, 0, 1, 1,
0.3488282, -0.9875767, 2.644705, 0, 0, 0, 1, 1,
0.3573813, -0.8655101, 2.87649, 0, 0, 0, 1, 1,
0.3579284, -2.539849, 2.943429, 0, 0, 0, 1, 1,
0.3605702, 0.5123769, 0.5899456, 0, 0, 0, 1, 1,
0.3624474, 1.079527, 0.1306266, 1, 1, 1, 1, 1,
0.3671805, -0.4851374, 2.751662, 1, 1, 1, 1, 1,
0.3739848, -0.4471567, 1.636148, 1, 1, 1, 1, 1,
0.3741342, 0.0671621, 0.7561182, 1, 1, 1, 1, 1,
0.3800183, -0.5131606, 0.9655799, 1, 1, 1, 1, 1,
0.3834469, 0.2661779, 1.550461, 1, 1, 1, 1, 1,
0.3845283, -0.04876335, 1.704044, 1, 1, 1, 1, 1,
0.3868613, 0.8071421, 0.9283529, 1, 1, 1, 1, 1,
0.3911685, -1.116379, 3.284508, 1, 1, 1, 1, 1,
0.3937798, -0.9387638, 2.714484, 1, 1, 1, 1, 1,
0.395572, 0.07037231, 0.7153342, 1, 1, 1, 1, 1,
0.4034028, -1.91417, 3.486322, 1, 1, 1, 1, 1,
0.40381, -0.7246067, 3.205303, 1, 1, 1, 1, 1,
0.4076297, -0.6136047, 2.775117, 1, 1, 1, 1, 1,
0.4080227, 0.9097512, -0.1668555, 1, 1, 1, 1, 1,
0.4093907, 1.286492, 0.2432102, 0, 0, 1, 1, 1,
0.4179784, 2.163411, 0.5519871, 1, 0, 0, 1, 1,
0.4275412, 1.680837, 0.6953187, 1, 0, 0, 1, 1,
0.4321298, -0.2450728, 2.852867, 1, 0, 0, 1, 1,
0.4323945, -0.4642335, 1.927416, 1, 0, 0, 1, 1,
0.4337832, 2.162421, 0.5300245, 1, 0, 0, 1, 1,
0.4394298, -0.3413125, 2.396832, 0, 0, 0, 1, 1,
0.439492, -0.9896477, 2.788341, 0, 0, 0, 1, 1,
0.4531893, 1.987944, 0.8206145, 0, 0, 0, 1, 1,
0.4556891, -0.6680843, 3.715076, 0, 0, 0, 1, 1,
0.4574086, -0.9563611, 0.3125597, 0, 0, 0, 1, 1,
0.4608482, 0.9799931, 1.179468, 0, 0, 0, 1, 1,
0.4678896, -0.7861349, 2.730878, 0, 0, 0, 1, 1,
0.4700212, -2.113227, 2.027133, 1, 1, 1, 1, 1,
0.4724084, -0.6285725, 0.7047601, 1, 1, 1, 1, 1,
0.4732791, -1.190619, 3.274711, 1, 1, 1, 1, 1,
0.4841533, -0.03079129, 2.57623, 1, 1, 1, 1, 1,
0.4866038, -1.008969, 1.473289, 1, 1, 1, 1, 1,
0.4902069, -1.939046, 1.881915, 1, 1, 1, 1, 1,
0.4940034, 0.1438762, -0.308181, 1, 1, 1, 1, 1,
0.4944596, -0.5422257, 2.523869, 1, 1, 1, 1, 1,
0.4949248, -0.6312398, 2.89078, 1, 1, 1, 1, 1,
0.4988109, -1.20849, 3.047947, 1, 1, 1, 1, 1,
0.4999947, -0.7327445, 2.47695, 1, 1, 1, 1, 1,
0.502642, 1.1978, 0.5296312, 1, 1, 1, 1, 1,
0.5078152, -0.8724838, 2.049633, 1, 1, 1, 1, 1,
0.510532, 0.2879285, 1.601037, 1, 1, 1, 1, 1,
0.5107782, -0.8435924, 1.294224, 1, 1, 1, 1, 1,
0.5108207, 3.440502, -0.1880694, 0, 0, 1, 1, 1,
0.5177839, -0.02527416, 1.95272, 1, 0, 0, 1, 1,
0.5200181, -0.3856921, 1.32117, 1, 0, 0, 1, 1,
0.521433, 0.09665522, 4.505893, 1, 0, 0, 1, 1,
0.5225944, 0.7260945, 1.060396, 1, 0, 0, 1, 1,
0.5256609, 0.8981135, -1.644509, 1, 0, 0, 1, 1,
0.5307748, 0.04994074, 0.8447055, 0, 0, 0, 1, 1,
0.5308934, 0.07205203, 0.7471958, 0, 0, 0, 1, 1,
0.532187, -0.9034009, 2.321089, 0, 0, 0, 1, 1,
0.5354093, -0.4346706, 0.2297431, 0, 0, 0, 1, 1,
0.5365206, -2.74993, 3.816638, 0, 0, 0, 1, 1,
0.5367113, -0.1860879, 0.8252247, 0, 0, 0, 1, 1,
0.5393859, -0.617974, 1.022531, 0, 0, 0, 1, 1,
0.5440165, -0.1827472, 0.9386714, 1, 1, 1, 1, 1,
0.5453367, 2.124672, -0.264758, 1, 1, 1, 1, 1,
0.546621, 1.253635, 3.094219, 1, 1, 1, 1, 1,
0.5513897, 0.6599311, -0.01113916, 1, 1, 1, 1, 1,
0.5549209, -0.4129032, 0.466808, 1, 1, 1, 1, 1,
0.5565306, -1.200973, 2.039567, 1, 1, 1, 1, 1,
0.5602399, 1.297428, 0.7068888, 1, 1, 1, 1, 1,
0.5616063, -1.000517, 2.323321, 1, 1, 1, 1, 1,
0.5622727, 1.111875, 0.8232925, 1, 1, 1, 1, 1,
0.5789864, 0.6185688, 0.06013272, 1, 1, 1, 1, 1,
0.5810714, -0.9161937, 2.019061, 1, 1, 1, 1, 1,
0.5828624, 1.291015, 0.3595411, 1, 1, 1, 1, 1,
0.5847934, 0.703563, 1.097657, 1, 1, 1, 1, 1,
0.588569, -0.7440653, 2.348191, 1, 1, 1, 1, 1,
0.5915291, 0.1373035, 1.549742, 1, 1, 1, 1, 1,
0.6030639, -0.8920141, 2.973338, 0, 0, 1, 1, 1,
0.6056911, 0.1898184, 1.099019, 1, 0, 0, 1, 1,
0.615295, 0.3535107, 1.65594, 1, 0, 0, 1, 1,
0.6198641, 0.2628379, -0.417403, 1, 0, 0, 1, 1,
0.6227989, -0.9939619, 2.666774, 1, 0, 0, 1, 1,
0.6265365, 1.213151, 1.952628, 1, 0, 0, 1, 1,
0.6316598, -0.01802656, 1.921697, 0, 0, 0, 1, 1,
0.6331757, -0.08838893, 1.114769, 0, 0, 0, 1, 1,
0.6396194, -0.7913117, 2.743917, 0, 0, 0, 1, 1,
0.6417295, 1.360076, 0.4652784, 0, 0, 0, 1, 1,
0.6489609, 0.6646651, 1.377813, 0, 0, 0, 1, 1,
0.6497738, -0.6293162, 3.105391, 0, 0, 0, 1, 1,
0.6503968, -0.7213039, 3.00421, 0, 0, 0, 1, 1,
0.6527348, 0.09062325, 2.333904, 1, 1, 1, 1, 1,
0.6550345, 0.8868406, -0.2560722, 1, 1, 1, 1, 1,
0.6557783, 0.5601254, 0.624963, 1, 1, 1, 1, 1,
0.6604666, 0.4587055, -0.4192348, 1, 1, 1, 1, 1,
0.6614848, 0.3119536, 1.123247, 1, 1, 1, 1, 1,
0.6846776, 1.782055, 0.1065359, 1, 1, 1, 1, 1,
0.6854836, 0.237848, 0.853296, 1, 1, 1, 1, 1,
0.6885347, 0.5144557, -0.3779412, 1, 1, 1, 1, 1,
0.69618, -0.4625352, 2.011816, 1, 1, 1, 1, 1,
0.6964802, -0.4297861, 2.42557, 1, 1, 1, 1, 1,
0.6985507, -1.225479, 1.373903, 1, 1, 1, 1, 1,
0.7015463, -0.7496248, 2.640553, 1, 1, 1, 1, 1,
0.7023307, 0.6223266, -0.2515279, 1, 1, 1, 1, 1,
0.7092407, 0.3566461, 1.768927, 1, 1, 1, 1, 1,
0.7096145, -0.9817111, 3.086203, 1, 1, 1, 1, 1,
0.7144069, 0.6852515, 2.070341, 0, 0, 1, 1, 1,
0.7192801, -0.6256688, 0.16297, 1, 0, 0, 1, 1,
0.7220088, 0.2992206, 0.1651092, 1, 0, 0, 1, 1,
0.731239, 0.6631666, 0.3290661, 1, 0, 0, 1, 1,
0.7385664, 0.7623267, 0.7769752, 1, 0, 0, 1, 1,
0.7413977, -0.3955993, 2.290529, 1, 0, 0, 1, 1,
0.7461147, 0.7845497, 1.046614, 0, 0, 0, 1, 1,
0.7462574, 0.0512453, 1.784054, 0, 0, 0, 1, 1,
0.7491782, 0.3318399, 1.772334, 0, 0, 0, 1, 1,
0.756421, -0.6328971, 2.667622, 0, 0, 0, 1, 1,
0.7663901, 0.02824701, -0.5788174, 0, 0, 0, 1, 1,
0.7705013, -0.6702607, 2.487435, 0, 0, 0, 1, 1,
0.7753953, 0.8918477, -0.1941517, 0, 0, 0, 1, 1,
0.7782105, 0.2225845, -0.08054887, 1, 1, 1, 1, 1,
0.7811103, -0.2582682, 1.841706, 1, 1, 1, 1, 1,
0.7821892, 0.3177116, 0.9486202, 1, 1, 1, 1, 1,
0.7871715, -0.686391, 0.8423468, 1, 1, 1, 1, 1,
0.7917283, 1.153459, 2.099211, 1, 1, 1, 1, 1,
0.7928361, -0.145443, 0.7859064, 1, 1, 1, 1, 1,
0.7931454, -0.03427609, 0.7110313, 1, 1, 1, 1, 1,
0.7932377, -0.7937621, 2.894584, 1, 1, 1, 1, 1,
0.7951236, -0.1053564, 1.420107, 1, 1, 1, 1, 1,
0.795439, 1.446236, 2.349676, 1, 1, 1, 1, 1,
0.796771, 0.5824203, 2.748592, 1, 1, 1, 1, 1,
0.8010949, -1.057664, 2.644741, 1, 1, 1, 1, 1,
0.8024607, 0.2346514, 0.5195049, 1, 1, 1, 1, 1,
0.8035125, -0.2774538, 3.12054, 1, 1, 1, 1, 1,
0.8066294, -0.5591704, 2.228033, 1, 1, 1, 1, 1,
0.8113531, 0.06419677, 2.551198, 0, 0, 1, 1, 1,
0.813045, -0.8228602, 3.703604, 1, 0, 0, 1, 1,
0.8142268, -0.907665, 2.362998, 1, 0, 0, 1, 1,
0.819946, -0.8590446, 2.850682, 1, 0, 0, 1, 1,
0.8208765, -0.6514857, 1.543569, 1, 0, 0, 1, 1,
0.823454, -2.005238, 1.874771, 1, 0, 0, 1, 1,
0.8288389, -1.914172, 2.891083, 0, 0, 0, 1, 1,
0.8369725, 0.3829172, 1.924749, 0, 0, 0, 1, 1,
0.8377544, 0.5366505, -0.8876576, 0, 0, 0, 1, 1,
0.8378097, 0.02268032, 1.549754, 0, 0, 0, 1, 1,
0.8391243, 0.4289882, 1.530232, 0, 0, 0, 1, 1,
0.8475539, -0.176127, 2.296035, 0, 0, 0, 1, 1,
0.8576365, 0.3384345, 2.506658, 0, 0, 0, 1, 1,
0.857689, 0.4751614, -1.940108, 1, 1, 1, 1, 1,
0.8583726, 1.665719, 2.385339, 1, 1, 1, 1, 1,
0.8584908, 0.8633231, 0.2468023, 1, 1, 1, 1, 1,
0.8591968, -0.0926668, 3.102299, 1, 1, 1, 1, 1,
0.8596925, 0.63139, 0.6060622, 1, 1, 1, 1, 1,
0.8678265, -0.9007909, 1.167116, 1, 1, 1, 1, 1,
0.8712895, -1.160315, 3.29788, 1, 1, 1, 1, 1,
0.8716435, 0.8825732, -0.3891971, 1, 1, 1, 1, 1,
0.8771476, -1.094023, 1.414502, 1, 1, 1, 1, 1,
0.8804725, 0.7849935, 0.8235658, 1, 1, 1, 1, 1,
0.8840908, -0.1665636, 3.21566, 1, 1, 1, 1, 1,
0.8862236, 1.213256, 2.739612, 1, 1, 1, 1, 1,
0.8910177, -1.277286, 4.045321, 1, 1, 1, 1, 1,
0.8916553, 2.513379, 0.5679258, 1, 1, 1, 1, 1,
0.8953856, -0.2389286, 1.035247, 1, 1, 1, 1, 1,
0.895521, -0.4372621, 3.774914, 0, 0, 1, 1, 1,
0.9052415, 0.09776872, 1.998403, 1, 0, 0, 1, 1,
0.9112584, -1.678872, 3.192289, 1, 0, 0, 1, 1,
0.9169297, 0.178836, 1.883643, 1, 0, 0, 1, 1,
0.925589, 0.9416113, 2.365424, 1, 0, 0, 1, 1,
0.9313802, -0.9483123, 0.3176194, 1, 0, 0, 1, 1,
0.931899, -0.1985665, 1.721398, 0, 0, 0, 1, 1,
0.9323877, 0.3888397, 2.022125, 0, 0, 0, 1, 1,
0.9354847, -1.232248, 2.556003, 0, 0, 0, 1, 1,
0.9387575, -0.1359027, 1.469977, 0, 0, 0, 1, 1,
0.9410067, -0.9217144, 3.955435, 0, 0, 0, 1, 1,
0.9456648, 0.9251062, 0.8161654, 0, 0, 0, 1, 1,
0.9601672, 0.1075694, 2.436152, 0, 0, 0, 1, 1,
0.9610443, -0.5801948, 2.126749, 1, 1, 1, 1, 1,
0.9712097, 0.9744689, 2.739152, 1, 1, 1, 1, 1,
0.9762438, -0.6122092, 2.952218, 1, 1, 1, 1, 1,
0.9764665, -0.7594995, 2.013351, 1, 1, 1, 1, 1,
0.9782864, -0.6799917, 2.28638, 1, 1, 1, 1, 1,
0.9821308, -0.3407567, 1.942432, 1, 1, 1, 1, 1,
0.982438, -0.3694121, 3.009205, 1, 1, 1, 1, 1,
0.9866733, -1.18734, 3.794295, 1, 1, 1, 1, 1,
0.9960176, -1.055895, 1.224667, 1, 1, 1, 1, 1,
1.000203, -0.1053078, 2.593669, 1, 1, 1, 1, 1,
1.004744, 1.075046, 1.816842, 1, 1, 1, 1, 1,
1.004904, -1.104504, 2.935556, 1, 1, 1, 1, 1,
1.006204, -0.2258287, 1.124871, 1, 1, 1, 1, 1,
1.008269, -0.881584, 2.548876, 1, 1, 1, 1, 1,
1.039331, -1.410391, 3.475814, 1, 1, 1, 1, 1,
1.040685, 1.701599, 0.8922236, 0, 0, 1, 1, 1,
1.041069, 1.527711, -0.8579312, 1, 0, 0, 1, 1,
1.042029, -1.160651, 2.789098, 1, 0, 0, 1, 1,
1.042861, 0.4699864, 1.483247, 1, 0, 0, 1, 1,
1.043132, -0.3475409, 1.99569, 1, 0, 0, 1, 1,
1.053109, 0.06041031, 0.9286368, 1, 0, 0, 1, 1,
1.055115, -1.660998, 2.3741, 0, 0, 0, 1, 1,
1.071357, -0.1570859, 0.3501356, 0, 0, 0, 1, 1,
1.077163, 1.634177, 0.1069182, 0, 0, 0, 1, 1,
1.088537, -3.374713, 2.164357, 0, 0, 0, 1, 1,
1.097568, 0.3666122, 0.2661488, 0, 0, 0, 1, 1,
1.102596, -0.9070767, 2.165577, 0, 0, 0, 1, 1,
1.102959, 0.49017, 1.754385, 0, 0, 0, 1, 1,
1.107521, -1.043332, 2.582778, 1, 1, 1, 1, 1,
1.109548, -1.270269, 2.355587, 1, 1, 1, 1, 1,
1.109616, -1.008465, 2.227374, 1, 1, 1, 1, 1,
1.112381, -0.3063709, 1.694527, 1, 1, 1, 1, 1,
1.120242, -1.050791, 1.110009, 1, 1, 1, 1, 1,
1.123799, -0.5119112, 2.21725, 1, 1, 1, 1, 1,
1.123841, 1.220147, 0.2867552, 1, 1, 1, 1, 1,
1.124436, -0.6326591, 1.849704, 1, 1, 1, 1, 1,
1.132978, 0.2753844, 0.7454307, 1, 1, 1, 1, 1,
1.142016, 0.805477, 0.9472816, 1, 1, 1, 1, 1,
1.147519, -2.096745, 2.079644, 1, 1, 1, 1, 1,
1.149797, 0.333917, 2.356203, 1, 1, 1, 1, 1,
1.155, 1.962731, 0.4105089, 1, 1, 1, 1, 1,
1.16184, 1.493981, 0.3939351, 1, 1, 1, 1, 1,
1.166092, -0.9017512, 3.207066, 1, 1, 1, 1, 1,
1.171162, 0.7060592, 1.388784, 0, 0, 1, 1, 1,
1.179306, -0.9715937, 2.555798, 1, 0, 0, 1, 1,
1.18163, -0.4402247, 1.571249, 1, 0, 0, 1, 1,
1.189965, 0.448593, 1.138923, 1, 0, 0, 1, 1,
1.192891, -0.4472268, 1.370651, 1, 0, 0, 1, 1,
1.198332, 0.8193104, 0.03961758, 1, 0, 0, 1, 1,
1.203393, 0.2321173, 1.981266, 0, 0, 0, 1, 1,
1.205842, -2.687054, 1.640093, 0, 0, 0, 1, 1,
1.215836, 0.4390559, 1.838137, 0, 0, 0, 1, 1,
1.221552, 0.2720256, 4.07721, 0, 0, 0, 1, 1,
1.251504, -1.396511, 1.908743, 0, 0, 0, 1, 1,
1.261739, -0.6615664, 2.234858, 0, 0, 0, 1, 1,
1.262028, -1.253669, 1.650257, 0, 0, 0, 1, 1,
1.267581, -0.04713298, 2.33361, 1, 1, 1, 1, 1,
1.280829, 1.557096, 0.9531848, 1, 1, 1, 1, 1,
1.291498, 0.7129585, 1.930749, 1, 1, 1, 1, 1,
1.292284, -0.9427434, 0.8807814, 1, 1, 1, 1, 1,
1.294159, 1.318666, 0.1124294, 1, 1, 1, 1, 1,
1.298904, 1.26406, 1.332385, 1, 1, 1, 1, 1,
1.326343, 0.642593, -0.1697279, 1, 1, 1, 1, 1,
1.328758, -0.08339013, 1.105073, 1, 1, 1, 1, 1,
1.332372, 0.1474657, 0.7152449, 1, 1, 1, 1, 1,
1.340258, 1.247522, 0.9743094, 1, 1, 1, 1, 1,
1.351563, -1.48008, 3.077744, 1, 1, 1, 1, 1,
1.360518, -1.30025, 2.715708, 1, 1, 1, 1, 1,
1.36916, 2.062582, 0.4570156, 1, 1, 1, 1, 1,
1.37001, 1.919609, 1.121083, 1, 1, 1, 1, 1,
1.377941, -0.09994208, 1.141248, 1, 1, 1, 1, 1,
1.381799, -0.1471078, 2.892326, 0, 0, 1, 1, 1,
1.386405, 0.4503924, 1.187939, 1, 0, 0, 1, 1,
1.398445, -0.7749491, 2.109225, 1, 0, 0, 1, 1,
1.412166, 0.08200988, 0.7705805, 1, 0, 0, 1, 1,
1.413966, -0.9226809, 0.9589614, 1, 0, 0, 1, 1,
1.416528, -0.1044877, 2.425184, 1, 0, 0, 1, 1,
1.435172, -1.054286, 2.376622, 0, 0, 0, 1, 1,
1.440787, -0.08133334, 1.873899, 0, 0, 0, 1, 1,
1.44448, -0.6930955, 2.706566, 0, 0, 0, 1, 1,
1.445914, 1.713727, 0.9603917, 0, 0, 0, 1, 1,
1.4476, 0.02223871, 0.330339, 0, 0, 0, 1, 1,
1.451688, -0.1149088, 3.141877, 0, 0, 0, 1, 1,
1.457772, -0.2152984, 3.053093, 0, 0, 0, 1, 1,
1.458172, 0.624746, 1.806822, 1, 1, 1, 1, 1,
1.464653, -0.4243425, 2.231755, 1, 1, 1, 1, 1,
1.470588, -0.4379418, 1.547942, 1, 1, 1, 1, 1,
1.477703, 0.5023793, 0.8168136, 1, 1, 1, 1, 1,
1.481073, -2.070376, 2.529892, 1, 1, 1, 1, 1,
1.483112, 1.093518, 1.53723, 1, 1, 1, 1, 1,
1.489963, 0.44373, 0.8350205, 1, 1, 1, 1, 1,
1.493767, -0.6169529, 3.622581, 1, 1, 1, 1, 1,
1.494939, -0.3168715, 0.4751906, 1, 1, 1, 1, 1,
1.494958, 0.2955663, -0.4170804, 1, 1, 1, 1, 1,
1.501321, 1.708454, 2.665753, 1, 1, 1, 1, 1,
1.507832, 0.233507, 1.647379, 1, 1, 1, 1, 1,
1.515023, -0.01185711, 1.265746, 1, 1, 1, 1, 1,
1.526164, -1.532198, 2.680748, 1, 1, 1, 1, 1,
1.526644, 0.9720885, 1.514686, 1, 1, 1, 1, 1,
1.527433, -0.08219766, 2.49372, 0, 0, 1, 1, 1,
1.528242, -0.9511261, 2.204837, 1, 0, 0, 1, 1,
1.531834, 0.3825034, 1.763613, 1, 0, 0, 1, 1,
1.553266, 0.1296324, 3.377763, 1, 0, 0, 1, 1,
1.561756, 0.6344789, 0.3465264, 1, 0, 0, 1, 1,
1.56736, 0.435528, 2.308215, 1, 0, 0, 1, 1,
1.568505, -0.7036273, 2.609299, 0, 0, 0, 1, 1,
1.571314, 0.5761237, -0.449384, 0, 0, 0, 1, 1,
1.576489, -0.1697706, 0.6692674, 0, 0, 0, 1, 1,
1.602586, -1.675667, 2.42145, 0, 0, 0, 1, 1,
1.608114, 0.3393773, 0.6034122, 0, 0, 0, 1, 1,
1.608598, -0.9915482, 3.501062, 0, 0, 0, 1, 1,
1.608672, -0.2251829, 2.327043, 0, 0, 0, 1, 1,
1.609885, 0.2017341, 1.424937, 1, 1, 1, 1, 1,
1.618071, 0.5621839, 2.163564, 1, 1, 1, 1, 1,
1.619328, 0.8255587, 2.556264, 1, 1, 1, 1, 1,
1.620737, 0.1651134, 0.6256074, 1, 1, 1, 1, 1,
1.629464, -0.2534303, 2.048764, 1, 1, 1, 1, 1,
1.636901, -0.1462665, 2.795211, 1, 1, 1, 1, 1,
1.648814, -1.231875, 4.678141, 1, 1, 1, 1, 1,
1.663277, -0.8772679, 0.4358048, 1, 1, 1, 1, 1,
1.66962, 1.104312, -0.2874566, 1, 1, 1, 1, 1,
1.687931, -0.9687281, 2.448735, 1, 1, 1, 1, 1,
1.690138, 0.7239251, 0.0816015, 1, 1, 1, 1, 1,
1.703635, 2.024302, 0.4494821, 1, 1, 1, 1, 1,
1.712798, 1.510546, 0.02603118, 1, 1, 1, 1, 1,
1.721064, 0.7758814, 1.487231, 1, 1, 1, 1, 1,
1.727044, -0.9883337, 2.962266, 1, 1, 1, 1, 1,
1.729338, 1.239473, 2.818976, 0, 0, 1, 1, 1,
1.735686, -1.867002, 3.662421, 1, 0, 0, 1, 1,
1.743355, 0.3644183, 1.44667, 1, 0, 0, 1, 1,
1.74525, -0.2398669, 1.542178, 1, 0, 0, 1, 1,
1.755894, 1.976345, 1.419595, 1, 0, 0, 1, 1,
1.759528, -0.1270956, 2.923563, 1, 0, 0, 1, 1,
1.761176, 0.003947579, -0.219812, 0, 0, 0, 1, 1,
1.773755, -1.58254, 3.244862, 0, 0, 0, 1, 1,
1.810281, -1.06548, 3.680469, 0, 0, 0, 1, 1,
1.831296, -0.2677253, 0.3814464, 0, 0, 0, 1, 1,
1.842611, -1.629227, 2.504437, 0, 0, 0, 1, 1,
1.866999, -0.9591171, 2.016895, 0, 0, 0, 1, 1,
1.871985, 0.2043223, 0.6332839, 0, 0, 0, 1, 1,
1.911092, 0.6979694, 2.973493, 1, 1, 1, 1, 1,
1.91813, 1.107408, 0.7352939, 1, 1, 1, 1, 1,
1.925564, -1.032179, -1.220441, 1, 1, 1, 1, 1,
1.930076, -1.811548, 2.968311, 1, 1, 1, 1, 1,
1.931738, 0.2318744, 0.596759, 1, 1, 1, 1, 1,
1.938453, -1.25831, 2.796932, 1, 1, 1, 1, 1,
1.94092, -1.26924, 3.396315, 1, 1, 1, 1, 1,
1.946836, -1.218723, 3.042504, 1, 1, 1, 1, 1,
1.95297, 0.5344071, 3.861259, 1, 1, 1, 1, 1,
1.962677, -1.092114, 1.487874, 1, 1, 1, 1, 1,
1.974874, 0.09619312, 0.4695256, 1, 1, 1, 1, 1,
1.989131, -0.007934437, 1.635901, 1, 1, 1, 1, 1,
1.995545, -1.027783, 1.778949, 1, 1, 1, 1, 1,
2.019918, -0.08663247, 0.7892296, 1, 1, 1, 1, 1,
2.024978, -1.222297, 4.491437, 1, 1, 1, 1, 1,
2.034057, -0.01866437, 0.9547724, 0, 0, 1, 1, 1,
2.046518, 1.109122, 0.8604865, 1, 0, 0, 1, 1,
2.049255, -0.7926985, 3.407309, 1, 0, 0, 1, 1,
2.086364, 0.6289622, 0.02826432, 1, 0, 0, 1, 1,
2.087247, 0.9551798, 2.082055, 1, 0, 0, 1, 1,
2.12176, -0.5699829, 0.3542215, 1, 0, 0, 1, 1,
2.151697, 0.09509733, 0.410036, 0, 0, 0, 1, 1,
2.185314, -0.207899, 0.6399922, 0, 0, 0, 1, 1,
2.190386, 0.9392912, 1.775848, 0, 0, 0, 1, 1,
2.205413, -0.225676, 0.3269286, 0, 0, 0, 1, 1,
2.210659, -0.8949887, 2.268752, 0, 0, 0, 1, 1,
2.279223, -0.7298343, 1.931554, 0, 0, 0, 1, 1,
2.499557, 0.07033292, 1.42292, 0, 0, 0, 1, 1,
2.585145, 0.6886644, 1.00479, 1, 1, 1, 1, 1,
2.594063, 0.4790283, 3.239474, 1, 1, 1, 1, 1,
2.642209, 0.8789596, -0.672538, 1, 1, 1, 1, 1,
2.800223, -1.052299, 1.50118, 1, 1, 1, 1, 1,
2.893996, -0.569603, 2.112426, 1, 1, 1, 1, 1,
3.089613, 1.508745, 1.080673, 1, 1, 1, 1, 1,
3.334595, -1.433655, 2.365309, 1, 1, 1, 1, 1
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
var radius = 9.447298;
var distance = 33.18323;
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
mvMatrix.translate( -0.2117499, -0.03289461, 0.01741028 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18323);
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
