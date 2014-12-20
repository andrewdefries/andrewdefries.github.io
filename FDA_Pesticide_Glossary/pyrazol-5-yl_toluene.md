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
-2.94628, -1.174888, -2.458359, 1, 0, 0, 1,
-2.888818, -0.02536717, -1.526574, 1, 0.007843138, 0, 1,
-2.804331, -0.4976747, -2.131371, 1, 0.01176471, 0, 1,
-2.619947, -2.205571, -1.60609, 1, 0.01960784, 0, 1,
-2.581646, 0.2824593, 0.3909176, 1, 0.02352941, 0, 1,
-2.556586, -0.7048025, -1.203465, 1, 0.03137255, 0, 1,
-2.500061, -1.403623, -0.1918454, 1, 0.03529412, 0, 1,
-2.361386, 1.111946, -0.9585814, 1, 0.04313726, 0, 1,
-2.358171, 0.3758742, -0.8257208, 1, 0.04705882, 0, 1,
-2.347925, 0.04498105, -2.500526, 1, 0.05490196, 0, 1,
-2.332986, -1.428167, -2.508247, 1, 0.05882353, 0, 1,
-2.313428, -1.489673, -2.542608, 1, 0.06666667, 0, 1,
-2.23059, -0.333771, -0.3498985, 1, 0.07058824, 0, 1,
-2.162438, -0.3404497, -2.095025, 1, 0.07843138, 0, 1,
-2.090537, -0.7481939, -1.020612, 1, 0.08235294, 0, 1,
-2.089173, 1.693344, -2.113932, 1, 0.09019608, 0, 1,
-2.061146, -0.5608582, -2.166003, 1, 0.09411765, 0, 1,
-2.026806, -0.06549103, -1.722529, 1, 0.1019608, 0, 1,
-2.006048, -0.3328636, -2.549446, 1, 0.1098039, 0, 1,
-1.984462, -0.3039935, -1.879177, 1, 0.1137255, 0, 1,
-1.943933, 0.5910283, -2.655777, 1, 0.1215686, 0, 1,
-1.925601, 0.3437439, -2.560228, 1, 0.1254902, 0, 1,
-1.916788, -1.585697, -3.158267, 1, 0.1333333, 0, 1,
-1.912294, -1.597229, -2.539097, 1, 0.1372549, 0, 1,
-1.900571, -1.722257, 0.8744573, 1, 0.145098, 0, 1,
-1.884262, 0.0956903, -1.420265, 1, 0.1490196, 0, 1,
-1.847977, -0.2800859, -0.6188728, 1, 0.1568628, 0, 1,
-1.842434, 1.813702, 0.5742313, 1, 0.1607843, 0, 1,
-1.834897, 1.300971, -2.183841, 1, 0.1686275, 0, 1,
-1.798947, -1.40557, -2.233256, 1, 0.172549, 0, 1,
-1.79819, -1.18325, -1.250678, 1, 0.1803922, 0, 1,
-1.76305, 1.171107, -2.244177, 1, 0.1843137, 0, 1,
-1.761746, -0.3983884, -1.756234, 1, 0.1921569, 0, 1,
-1.75592, 0.2500852, -1.427538, 1, 0.1960784, 0, 1,
-1.74347, -0.06466312, -1.288013, 1, 0.2039216, 0, 1,
-1.740689, -0.2616349, -1.672171, 1, 0.2117647, 0, 1,
-1.736743, 0.1805734, 0.4542529, 1, 0.2156863, 0, 1,
-1.729423, 0.3527265, -3.315789, 1, 0.2235294, 0, 1,
-1.722129, -1.820388, -2.898067, 1, 0.227451, 0, 1,
-1.719982, 1.533826, 0.4147873, 1, 0.2352941, 0, 1,
-1.70788, -0.4581901, -0.966915, 1, 0.2392157, 0, 1,
-1.707557, -0.8997513, -0.1805928, 1, 0.2470588, 0, 1,
-1.694679, 1.30743, -1.979401, 1, 0.2509804, 0, 1,
-1.68965, 0.1814461, -0.5802694, 1, 0.2588235, 0, 1,
-1.684549, -0.6072426, -1.708216, 1, 0.2627451, 0, 1,
-1.681425, 0.8551094, -0.4911612, 1, 0.2705882, 0, 1,
-1.675578, -1.498588, -2.72671, 1, 0.2745098, 0, 1,
-1.663835, -0.2368886, -2.880335, 1, 0.282353, 0, 1,
-1.644792, -0.06539265, -1.631593, 1, 0.2862745, 0, 1,
-1.637309, 0.04622722, -1.390043, 1, 0.2941177, 0, 1,
-1.625183, -1.218139, -1.503548, 1, 0.3019608, 0, 1,
-1.617517, -1.887139, -0.4201879, 1, 0.3058824, 0, 1,
-1.614574, -0.7677662, -1.464117, 1, 0.3137255, 0, 1,
-1.611033, -0.2861241, -0.796336, 1, 0.3176471, 0, 1,
-1.60559, -1.565305, -1.392763, 1, 0.3254902, 0, 1,
-1.584625, 0.7960393, -1.142231, 1, 0.3294118, 0, 1,
-1.575721, -0.4889586, -1.232963, 1, 0.3372549, 0, 1,
-1.573656, 0.1307035, -0.3798279, 1, 0.3411765, 0, 1,
-1.568293, -0.3790364, -2.225508, 1, 0.3490196, 0, 1,
-1.567731, 0.7171116, -1.962854, 1, 0.3529412, 0, 1,
-1.561406, -0.4728882, -1.505171, 1, 0.3607843, 0, 1,
-1.555407, 1.695938, -0.2782087, 1, 0.3647059, 0, 1,
-1.552676, 0.05430394, -1.814913, 1, 0.372549, 0, 1,
-1.542217, 0.8418181, -1.050659, 1, 0.3764706, 0, 1,
-1.541115, -0.1169795, -3.50624, 1, 0.3843137, 0, 1,
-1.522296, -0.4498523, -1.086191, 1, 0.3882353, 0, 1,
-1.5208, 0.5108035, -0.3315868, 1, 0.3960784, 0, 1,
-1.516663, 0.1059125, -2.037457, 1, 0.4039216, 0, 1,
-1.497342, 0.6144015, -1.38305, 1, 0.4078431, 0, 1,
-1.496922, -0.942297, -0.4140838, 1, 0.4156863, 0, 1,
-1.493424, -0.6451795, -0.2602388, 1, 0.4196078, 0, 1,
-1.475389, -0.5036124, -1.534092, 1, 0.427451, 0, 1,
-1.475021, 0.07032952, -0.3122804, 1, 0.4313726, 0, 1,
-1.46597, 0.5330033, -1.492163, 1, 0.4392157, 0, 1,
-1.45451, -2.407455, -4.975129, 1, 0.4431373, 0, 1,
-1.444293, 2.352581, -0.1180539, 1, 0.4509804, 0, 1,
-1.441343, -1.671464, -2.315749, 1, 0.454902, 0, 1,
-1.434431, 0.5685847, -1.562114, 1, 0.4627451, 0, 1,
-1.433869, 0.7212093, -0.8110204, 1, 0.4666667, 0, 1,
-1.433421, 0.2288787, -0.9038224, 1, 0.4745098, 0, 1,
-1.416128, 1.718543, -1.770049, 1, 0.4784314, 0, 1,
-1.413743, 1.862194, -0.5374201, 1, 0.4862745, 0, 1,
-1.40597, 0.9921001, -1.04705, 1, 0.4901961, 0, 1,
-1.400734, -0.6405646, -2.15309, 1, 0.4980392, 0, 1,
-1.394505, -0.7391786, -3.489696, 1, 0.5058824, 0, 1,
-1.389909, -1.249396, -1.884637, 1, 0.509804, 0, 1,
-1.389043, -0.7000222, -1.232952, 1, 0.5176471, 0, 1,
-1.384319, -0.9696005, -1.877342, 1, 0.5215687, 0, 1,
-1.37722, 1.300809, 0.137045, 1, 0.5294118, 0, 1,
-1.376706, 0.0742044, -0.1255084, 1, 0.5333334, 0, 1,
-1.373226, 0.8417388, -1.922561, 1, 0.5411765, 0, 1,
-1.370267, 0.4633389, -2.40756, 1, 0.5450981, 0, 1,
-1.359331, -1.046048, 0.04368689, 1, 0.5529412, 0, 1,
-1.357334, -1.238202, -3.313524, 1, 0.5568628, 0, 1,
-1.3546, 0.1536562, -2.10091, 1, 0.5647059, 0, 1,
-1.34696, 1.118094, -1.104142, 1, 0.5686275, 0, 1,
-1.338949, 0.09626833, -2.107821, 1, 0.5764706, 0, 1,
-1.332995, 0.08881088, -1.211096, 1, 0.5803922, 0, 1,
-1.3319, 0.3244424, -1.111127, 1, 0.5882353, 0, 1,
-1.330596, -1.064424, -1.013262, 1, 0.5921569, 0, 1,
-1.328938, -0.2891452, -3.468362, 1, 0.6, 0, 1,
-1.322913, -0.1720039, -0.2209057, 1, 0.6078432, 0, 1,
-1.31306, -1.366362, -2.98735, 1, 0.6117647, 0, 1,
-1.304528, 1.027824, -0.1874866, 1, 0.6196079, 0, 1,
-1.299307, 0.5642163, 0.2315298, 1, 0.6235294, 0, 1,
-1.297548, 1.448158, 0.822641, 1, 0.6313726, 0, 1,
-1.291761, -1.661515, -3.503545, 1, 0.6352941, 0, 1,
-1.290994, -2.252487, -3.537186, 1, 0.6431373, 0, 1,
-1.290862, 3.184654, 1.02934, 1, 0.6470588, 0, 1,
-1.289639, 1.151611, 0.9358013, 1, 0.654902, 0, 1,
-1.289461, 1.574215, 0.2760053, 1, 0.6588235, 0, 1,
-1.284818, -1.055584, -1.644205, 1, 0.6666667, 0, 1,
-1.28381, 0.9823105, 0.09015911, 1, 0.6705883, 0, 1,
-1.283755, 0.7534776, -1.194687, 1, 0.6784314, 0, 1,
-1.277757, 0.009418281, -3.860442, 1, 0.682353, 0, 1,
-1.275201, 0.5329617, -0.7427841, 1, 0.6901961, 0, 1,
-1.274807, 0.433708, -0.5251135, 1, 0.6941177, 0, 1,
-1.268791, -0.1948338, -2.54337, 1, 0.7019608, 0, 1,
-1.261876, -1.237031, -2.995577, 1, 0.7098039, 0, 1,
-1.261819, 1.155719, -1.194185, 1, 0.7137255, 0, 1,
-1.256412, 1.63901, -1.343694, 1, 0.7215686, 0, 1,
-1.252702, 1.005514, -0.1195424, 1, 0.7254902, 0, 1,
-1.248299, 1.811928, -1.31662, 1, 0.7333333, 0, 1,
-1.244621, -1.575534, -3.244261, 1, 0.7372549, 0, 1,
-1.238836, 1.029595, -0.7860734, 1, 0.7450981, 0, 1,
-1.233442, -0.3178488, -0.2398147, 1, 0.7490196, 0, 1,
-1.219573, 0.7995974, -0.1184238, 1, 0.7568628, 0, 1,
-1.206863, -0.3031084, -1.750934, 1, 0.7607843, 0, 1,
-1.200147, -0.7937025, -2.347148, 1, 0.7686275, 0, 1,
-1.1972, 1.560717, -0.8927035, 1, 0.772549, 0, 1,
-1.196797, -1.042516, -2.85404, 1, 0.7803922, 0, 1,
-1.190347, -0.1526573, -2.001488, 1, 0.7843137, 0, 1,
-1.187746, -0.333852, -3.654112, 1, 0.7921569, 0, 1,
-1.174021, -0.8305079, -2.512918, 1, 0.7960784, 0, 1,
-1.166013, -0.08871004, -0.395445, 1, 0.8039216, 0, 1,
-1.164598, 1.250352, 0.4339091, 1, 0.8117647, 0, 1,
-1.163459, -0.1990004, -0.1221431, 1, 0.8156863, 0, 1,
-1.160688, -1.014061, -1.229941, 1, 0.8235294, 0, 1,
-1.159798, -1.525594, -2.261927, 1, 0.827451, 0, 1,
-1.145161, -0.4039343, -2.470378, 1, 0.8352941, 0, 1,
-1.144964, 0.8915125, -1.193892, 1, 0.8392157, 0, 1,
-1.142177, -0.5760906, -2.622683, 1, 0.8470588, 0, 1,
-1.124389, -0.630706, -0.2367472, 1, 0.8509804, 0, 1,
-1.122138, -1.520931, -2.15422, 1, 0.8588235, 0, 1,
-1.112458, -1.653116, -2.745488, 1, 0.8627451, 0, 1,
-1.102779, -0.7557843, -2.440892, 1, 0.8705882, 0, 1,
-1.100581, -0.01182684, -3.378699, 1, 0.8745098, 0, 1,
-1.09701, -0.2916209, -1.37034, 1, 0.8823529, 0, 1,
-1.096017, 0.2631122, -1.822447, 1, 0.8862745, 0, 1,
-1.087254, 0.1508111, -0.8806885, 1, 0.8941177, 0, 1,
-1.076617, 0.5342528, -0.8702063, 1, 0.8980392, 0, 1,
-1.073908, 0.01484661, -1.257847, 1, 0.9058824, 0, 1,
-1.069576, -0.3171919, -2.170212, 1, 0.9137255, 0, 1,
-1.062738, -0.9320093, -0.6648927, 1, 0.9176471, 0, 1,
-1.061921, -0.2013892, -0.6471497, 1, 0.9254902, 0, 1,
-1.053257, 0.6180274, -1.877331, 1, 0.9294118, 0, 1,
-1.052503, 0.8625349, 0.1528268, 1, 0.9372549, 0, 1,
-1.048288, 0.6461287, 0.4504014, 1, 0.9411765, 0, 1,
-1.042085, -1.06748, -2.58724, 1, 0.9490196, 0, 1,
-1.022914, 0.4962809, -0.6438169, 1, 0.9529412, 0, 1,
-1.016724, 1.434519, 0.09850574, 1, 0.9607843, 0, 1,
-1.0166, 0.09022482, -0.9732246, 1, 0.9647059, 0, 1,
-1.004792, 0.9296739, -1.70142, 1, 0.972549, 0, 1,
-1.004673, 1.455956, -1.783164, 1, 0.9764706, 0, 1,
-0.994307, 0.9264761, -0.3954646, 1, 0.9843137, 0, 1,
-0.9907727, 0.1244211, -1.566577, 1, 0.9882353, 0, 1,
-0.9821211, -1.163386, -2.141957, 1, 0.9960784, 0, 1,
-0.9773798, -0.9286011, -2.900104, 0.9960784, 1, 0, 1,
-0.9763553, 0.6249225, -0.9364288, 0.9921569, 1, 0, 1,
-0.9741883, 0.3514424, -0.317331, 0.9843137, 1, 0, 1,
-0.9665209, -0.3280688, -0.8427701, 0.9803922, 1, 0, 1,
-0.9622383, 1.210321, -0.7437983, 0.972549, 1, 0, 1,
-0.9566259, -0.3485231, -2.937445, 0.9686275, 1, 0, 1,
-0.9495439, -0.4975193, -2.12096, 0.9607843, 1, 0, 1,
-0.9494645, -0.1666973, -1.912494, 0.9568627, 1, 0, 1,
-0.9407389, -0.4733503, -2.592407, 0.9490196, 1, 0, 1,
-0.9182439, -0.8464078, -2.647439, 0.945098, 1, 0, 1,
-0.918215, 0.1266197, -3.462514, 0.9372549, 1, 0, 1,
-0.9083704, 0.05767275, -3.101577, 0.9333333, 1, 0, 1,
-0.9017268, 0.5901031, -0.6372812, 0.9254902, 1, 0, 1,
-0.8969414, -1.258264, -3.654457, 0.9215686, 1, 0, 1,
-0.8848584, -0.6579225, -2.253773, 0.9137255, 1, 0, 1,
-0.8848124, 1.605736, -1.304572, 0.9098039, 1, 0, 1,
-0.8826039, 0.545226, -0.8667798, 0.9019608, 1, 0, 1,
-0.8738, 1.013951, -0.5611532, 0.8941177, 1, 0, 1,
-0.8699609, -0.1529269, -2.254944, 0.8901961, 1, 0, 1,
-0.8680897, -1.533685, -3.759433, 0.8823529, 1, 0, 1,
-0.8663407, 0.6968447, -0.2138906, 0.8784314, 1, 0, 1,
-0.8622792, -0.965806, -3.422542, 0.8705882, 1, 0, 1,
-0.8612423, 2.25486, -1.21146, 0.8666667, 1, 0, 1,
-0.8602741, 1.828508, 0.805892, 0.8588235, 1, 0, 1,
-0.8483782, 0.1279008, 0.423898, 0.854902, 1, 0, 1,
-0.8478208, -2.422134, -3.870869, 0.8470588, 1, 0, 1,
-0.8455656, 0.8362323, 0.3391737, 0.8431373, 1, 0, 1,
-0.8395491, 0.07634147, -1.960335, 0.8352941, 1, 0, 1,
-0.8362927, -0.1008188, -2.577319, 0.8313726, 1, 0, 1,
-0.83097, 1.250502, 0.3347854, 0.8235294, 1, 0, 1,
-0.8268586, -0.002607334, -1.902858, 0.8196079, 1, 0, 1,
-0.8255191, 0.04395496, -1.427596, 0.8117647, 1, 0, 1,
-0.8251374, -0.3418241, -1.360916, 0.8078431, 1, 0, 1,
-0.8246869, -0.6779639, -1.897046, 0.8, 1, 0, 1,
-0.8202384, -0.1582636, -3.495028, 0.7921569, 1, 0, 1,
-0.8192253, 1.393158, -0.2914939, 0.7882353, 1, 0, 1,
-0.8190319, 0.08252461, -2.923537, 0.7803922, 1, 0, 1,
-0.8187071, -1.526023, -2.588189, 0.7764706, 1, 0, 1,
-0.814794, 0.5089495, -1.937653, 0.7686275, 1, 0, 1,
-0.8145894, -0.2084137, -1.680632, 0.7647059, 1, 0, 1,
-0.8094458, -1.012524, -3.542639, 0.7568628, 1, 0, 1,
-0.8073214, 0.7880436, -1.684698, 0.7529412, 1, 0, 1,
-0.8065186, 1.675131, 1.018199, 0.7450981, 1, 0, 1,
-0.8018959, -0.6972532, -1.205723, 0.7411765, 1, 0, 1,
-0.7990867, 0.2294338, -1.486447, 0.7333333, 1, 0, 1,
-0.7983521, -0.2968066, -1.611698, 0.7294118, 1, 0, 1,
-0.7959771, -0.6028693, -2.778384, 0.7215686, 1, 0, 1,
-0.7926568, -0.2473164, -0.5666595, 0.7176471, 1, 0, 1,
-0.7876936, 0.8319919, 0.8742313, 0.7098039, 1, 0, 1,
-0.7852192, 1.010012, -1.233135, 0.7058824, 1, 0, 1,
-0.7839599, -0.7420235, -2.647822, 0.6980392, 1, 0, 1,
-0.7822623, 0.004159946, -0.4391924, 0.6901961, 1, 0, 1,
-0.7801081, 0.9520241, 1.402589, 0.6862745, 1, 0, 1,
-0.7777619, 0.1146736, -1.284625, 0.6784314, 1, 0, 1,
-0.7649922, 1.340115, -0.9142313, 0.6745098, 1, 0, 1,
-0.7615782, -1.548782, -2.389267, 0.6666667, 1, 0, 1,
-0.7614792, -0.3518115, -1.89944, 0.6627451, 1, 0, 1,
-0.7604803, -0.5505112, -2.278763, 0.654902, 1, 0, 1,
-0.7595515, -0.4120759, -1.304041, 0.6509804, 1, 0, 1,
-0.7586389, -0.005713268, -1.707636, 0.6431373, 1, 0, 1,
-0.758137, 1.192781, 0.1426096, 0.6392157, 1, 0, 1,
-0.7578712, 0.2410594, -1.380538, 0.6313726, 1, 0, 1,
-0.7396178, 0.9125259, -0.7541074, 0.627451, 1, 0, 1,
-0.7378277, 1.802852, 0.3446484, 0.6196079, 1, 0, 1,
-0.7370722, 0.3229017, -1.499523, 0.6156863, 1, 0, 1,
-0.7266063, -0.4036303, -2.545761, 0.6078432, 1, 0, 1,
-0.722075, -0.2648426, -3.511994, 0.6039216, 1, 0, 1,
-0.7198692, -0.3008996, -2.10713, 0.5960785, 1, 0, 1,
-0.7151508, -0.3598807, -1.909557, 0.5882353, 1, 0, 1,
-0.7129153, -0.1150748, -0.9369854, 0.5843138, 1, 0, 1,
-0.7101768, -0.5603323, -2.001149, 0.5764706, 1, 0, 1,
-0.7089322, 0.6740157, -2.573582, 0.572549, 1, 0, 1,
-0.7075735, -0.4157594, -3.070928, 0.5647059, 1, 0, 1,
-0.7055145, -1.158987, -1.750584, 0.5607843, 1, 0, 1,
-0.7022496, 0.8114077, -2.066908, 0.5529412, 1, 0, 1,
-0.7010933, 0.1448224, -0.5698567, 0.5490196, 1, 0, 1,
-0.7000866, -0.9003389, -4.244853, 0.5411765, 1, 0, 1,
-0.6982905, 0.3094819, 0.4427061, 0.5372549, 1, 0, 1,
-0.6866027, 1.122737, -0.344235, 0.5294118, 1, 0, 1,
-0.6856112, -0.2660101, -2.772905, 0.5254902, 1, 0, 1,
-0.6842845, 1.802079, -0.3153293, 0.5176471, 1, 0, 1,
-0.6804078, -3.140674, -3.592569, 0.5137255, 1, 0, 1,
-0.6765853, -0.08430775, -0.5507889, 0.5058824, 1, 0, 1,
-0.6728817, 0.2328609, -1.470421, 0.5019608, 1, 0, 1,
-0.6642007, 0.6086077, -0.2749217, 0.4941176, 1, 0, 1,
-0.6582378, 0.6660656, -0.2882296, 0.4862745, 1, 0, 1,
-0.6562274, -0.5789068, -3.050323, 0.4823529, 1, 0, 1,
-0.6558041, 1.07478, -1.561824, 0.4745098, 1, 0, 1,
-0.6554443, 0.4476588, -1.580051, 0.4705882, 1, 0, 1,
-0.6516303, 0.5369807, -2.878095, 0.4627451, 1, 0, 1,
-0.6513013, 0.8158233, -1.717503, 0.4588235, 1, 0, 1,
-0.648721, -0.4250931, -1.815818, 0.4509804, 1, 0, 1,
-0.6466868, -1.088723, -1.960244, 0.4470588, 1, 0, 1,
-0.6405031, -1.229668, -3.348341, 0.4392157, 1, 0, 1,
-0.6379288, -0.2500936, -2.523329, 0.4352941, 1, 0, 1,
-0.635393, -0.6331003, -2.618412, 0.427451, 1, 0, 1,
-0.6349945, 0.2476987, -1.317184, 0.4235294, 1, 0, 1,
-0.6340374, 1.238421, 0.8188068, 0.4156863, 1, 0, 1,
-0.6272994, -0.9040788, 0.3276593, 0.4117647, 1, 0, 1,
-0.6265683, -0.3716472, -1.139015, 0.4039216, 1, 0, 1,
-0.6216199, 0.1920168, -0.1865492, 0.3960784, 1, 0, 1,
-0.6199172, 0.429246, -0.6596286, 0.3921569, 1, 0, 1,
-0.6197876, 1.221152, -1.787965, 0.3843137, 1, 0, 1,
-0.6171541, 2.828741, 0.1349852, 0.3803922, 1, 0, 1,
-0.6164865, -1.212896, -2.254915, 0.372549, 1, 0, 1,
-0.6021304, -0.3811548, -2.506082, 0.3686275, 1, 0, 1,
-0.6005315, -1.623719, -1.053214, 0.3607843, 1, 0, 1,
-0.5940564, -1.115174, -2.634298, 0.3568628, 1, 0, 1,
-0.5927243, 0.5603392, -0.6379811, 0.3490196, 1, 0, 1,
-0.5885581, 1.430612, -0.3885928, 0.345098, 1, 0, 1,
-0.5872028, -1.381308, -4.436804, 0.3372549, 1, 0, 1,
-0.5857369, 1.045406, -2.469803, 0.3333333, 1, 0, 1,
-0.5841112, 0.3380844, -0.1703171, 0.3254902, 1, 0, 1,
-0.5832915, 1.019852, 1.710528, 0.3215686, 1, 0, 1,
-0.5813195, 0.9910691, -1.799221, 0.3137255, 1, 0, 1,
-0.5792648, -1.86426, -1.693565, 0.3098039, 1, 0, 1,
-0.5720444, 0.6655859, -1.067232, 0.3019608, 1, 0, 1,
-0.5705674, 0.437087, -0.4051752, 0.2941177, 1, 0, 1,
-0.5693545, -0.4158188, -2.123216, 0.2901961, 1, 0, 1,
-0.5677761, 0.8419918, -1.328065, 0.282353, 1, 0, 1,
-0.566488, 0.6208947, -0.03487237, 0.2784314, 1, 0, 1,
-0.5643852, -0.2936336, -1.232587, 0.2705882, 1, 0, 1,
-0.5616902, 1.371296, -0.7928569, 0.2666667, 1, 0, 1,
-0.5522353, -1.446603, -2.895849, 0.2588235, 1, 0, 1,
-0.5501682, -1.903481, -3.326775, 0.254902, 1, 0, 1,
-0.543646, 1.393118, -0.2365587, 0.2470588, 1, 0, 1,
-0.5418767, -1.308738, -3.521842, 0.2431373, 1, 0, 1,
-0.5408917, -1.442404, -3.104334, 0.2352941, 1, 0, 1,
-0.5399193, 0.1189285, -2.342427, 0.2313726, 1, 0, 1,
-0.5390897, -0.7222167, -3.691139, 0.2235294, 1, 0, 1,
-0.5368068, -0.6570643, -2.423057, 0.2196078, 1, 0, 1,
-0.5366374, -0.2546661, -2.993086, 0.2117647, 1, 0, 1,
-0.5334973, 0.03792437, -1.391438, 0.2078431, 1, 0, 1,
-0.5275691, -1.532613, -0.9058643, 0.2, 1, 0, 1,
-0.5272108, 0.2938833, -1.014354, 0.1921569, 1, 0, 1,
-0.5232867, 1.310849, 0.3720507, 0.1882353, 1, 0, 1,
-0.5218728, 0.117087, -0.8587959, 0.1803922, 1, 0, 1,
-0.5211267, -0.9166446, -2.011883, 0.1764706, 1, 0, 1,
-0.5209613, 0.6800235, -0.8829492, 0.1686275, 1, 0, 1,
-0.5190874, -2.350088, -3.124346, 0.1647059, 1, 0, 1,
-0.5169135, 0.3859177, -1.797827, 0.1568628, 1, 0, 1,
-0.5145648, 0.6009151, -1.789456, 0.1529412, 1, 0, 1,
-0.5101762, -1.36242, -2.473871, 0.145098, 1, 0, 1,
-0.5085568, 0.2529487, -0.3236171, 0.1411765, 1, 0, 1,
-0.5064016, 0.1549873, -2.343375, 0.1333333, 1, 0, 1,
-0.5051466, -1.687442, -1.048936, 0.1294118, 1, 0, 1,
-0.5034058, 0.6618361, -0.01417834, 0.1215686, 1, 0, 1,
-0.5024139, -0.1651679, -1.055243, 0.1176471, 1, 0, 1,
-0.4975013, 0.6423338, -0.3955225, 0.1098039, 1, 0, 1,
-0.4938694, 0.01265978, -2.67293, 0.1058824, 1, 0, 1,
-0.491792, -1.706137, -4.256108, 0.09803922, 1, 0, 1,
-0.4900979, -0.9200538, -2.634984, 0.09019608, 1, 0, 1,
-0.4844958, -0.3113427, -2.262007, 0.08627451, 1, 0, 1,
-0.4842137, -0.1781714, -2.120274, 0.07843138, 1, 0, 1,
-0.4787335, -0.6364979, -2.843577, 0.07450981, 1, 0, 1,
-0.4785732, 1.928645, 0.3482983, 0.06666667, 1, 0, 1,
-0.478453, 1.863564, -1.205358, 0.0627451, 1, 0, 1,
-0.4781014, 0.907039, 0.4317955, 0.05490196, 1, 0, 1,
-0.4617501, -0.003162962, -2.737335, 0.05098039, 1, 0, 1,
-0.4597408, 1.548732, -0.9954, 0.04313726, 1, 0, 1,
-0.4567921, 0.6003257, -0.08156373, 0.03921569, 1, 0, 1,
-0.4549425, 0.2331044, -0.907493, 0.03137255, 1, 0, 1,
-0.4544325, -0.2959818, -2.530189, 0.02745098, 1, 0, 1,
-0.4492494, -0.06150352, -1.955334, 0.01960784, 1, 0, 1,
-0.4480999, -0.2344448, -1.307007, 0.01568628, 1, 0, 1,
-0.44581, -0.3092794, -1.846772, 0.007843138, 1, 0, 1,
-0.4448304, -0.966359, -2.840526, 0.003921569, 1, 0, 1,
-0.4430212, -0.08167728, -0.1757024, 0, 1, 0.003921569, 1,
-0.4425139, -0.646271, -3.872148, 0, 1, 0.01176471, 1,
-0.4416263, -0.5563784, -0.6035736, 0, 1, 0.01568628, 1,
-0.4381192, -0.1322918, -2.75598, 0, 1, 0.02352941, 1,
-0.4344901, -1.228494, -2.811711, 0, 1, 0.02745098, 1,
-0.4335235, -0.2850151, -1.342065, 0, 1, 0.03529412, 1,
-0.4289975, 1.423331, -1.440524, 0, 1, 0.03921569, 1,
-0.426809, 0.3393867, -2.654403, 0, 1, 0.04705882, 1,
-0.4259478, 1.957153, -0.3029803, 0, 1, 0.05098039, 1,
-0.4221925, 1.23686, -0.5633144, 0, 1, 0.05882353, 1,
-0.4182681, -0.303542, -0.9394775, 0, 1, 0.0627451, 1,
-0.4152432, 0.5266445, -1.07501, 0, 1, 0.07058824, 1,
-0.4148141, 0.9181349, -0.8457798, 0, 1, 0.07450981, 1,
-0.4141709, 0.7821996, -1.07824, 0, 1, 0.08235294, 1,
-0.4112885, -0.5645843, -3.028112, 0, 1, 0.08627451, 1,
-0.4096566, 1.846168, 0.2822748, 0, 1, 0.09411765, 1,
-0.4076858, 1.352883, -1.468067, 0, 1, 0.1019608, 1,
-0.402002, -0.6642439, -4.648694, 0, 1, 0.1058824, 1,
-0.4017516, 0.5135812, -0.2391262, 0, 1, 0.1137255, 1,
-0.4010249, -1.328961, -3.438394, 0, 1, 0.1176471, 1,
-0.4003126, 0.0947163, 0.9777912, 0, 1, 0.1254902, 1,
-0.3983401, -0.9238681, -2.269097, 0, 1, 0.1294118, 1,
-0.3927954, -1.318394, -3.149598, 0, 1, 0.1372549, 1,
-0.3906916, 1.365805, -1.700944, 0, 1, 0.1411765, 1,
-0.3894829, 1.315447, -0.1447111, 0, 1, 0.1490196, 1,
-0.3875886, -0.6192257, -2.534817, 0, 1, 0.1529412, 1,
-0.3815548, -0.08509436, -1.994956, 0, 1, 0.1607843, 1,
-0.3800762, -0.1104646, -2.770561, 0, 1, 0.1647059, 1,
-0.3797129, -0.633559, -1.93903, 0, 1, 0.172549, 1,
-0.3749771, -0.4788749, -3.1103, 0, 1, 0.1764706, 1,
-0.3726972, -1.534875, -4.133883, 0, 1, 0.1843137, 1,
-0.3712728, -0.6140304, -3.293421, 0, 1, 0.1882353, 1,
-0.3599771, -0.3740836, -2.061274, 0, 1, 0.1960784, 1,
-0.3548442, -1.75186, -2.017786, 0, 1, 0.2039216, 1,
-0.3537006, 2.360117, -1.089658, 0, 1, 0.2078431, 1,
-0.3486945, 0.4583933, -0.8638897, 0, 1, 0.2156863, 1,
-0.3377579, 1.280794, -0.7747764, 0, 1, 0.2196078, 1,
-0.3345167, -0.6966462, -1.345951, 0, 1, 0.227451, 1,
-0.3276985, -0.5013864, -3.773408, 0, 1, 0.2313726, 1,
-0.3253179, -2.360399, -2.24679, 0, 1, 0.2392157, 1,
-0.3249725, 0.01368868, -2.450586, 0, 1, 0.2431373, 1,
-0.320159, -1.246115, -4.567787, 0, 1, 0.2509804, 1,
-0.3179608, -0.4891714, -2.31396, 0, 1, 0.254902, 1,
-0.3134528, 1.288113, 0.2045425, 0, 1, 0.2627451, 1,
-0.3114761, 0.9474486, -2.208609, 0, 1, 0.2666667, 1,
-0.3082364, 1.050303, -0.155734, 0, 1, 0.2745098, 1,
-0.2973381, 0.6599777, 0.9392734, 0, 1, 0.2784314, 1,
-0.29441, -1.358328, -3.559123, 0, 1, 0.2862745, 1,
-0.2906757, 0.0131164, -1.755354, 0, 1, 0.2901961, 1,
-0.2872293, 1.561417, 1.629613, 0, 1, 0.2980392, 1,
-0.2792464, 0.009762317, -2.626707, 0, 1, 0.3058824, 1,
-0.2775387, -1.833557, -3.792655, 0, 1, 0.3098039, 1,
-0.2770833, 0.2689394, 0.1382814, 0, 1, 0.3176471, 1,
-0.2747059, -1.222214, -2.543686, 0, 1, 0.3215686, 1,
-0.2736378, -0.4858088, -3.859305, 0, 1, 0.3294118, 1,
-0.2716079, 0.5299471, -0.590133, 0, 1, 0.3333333, 1,
-0.2611336, -0.1763136, -2.552418, 0, 1, 0.3411765, 1,
-0.2602387, -1.422648, -5.582564, 0, 1, 0.345098, 1,
-0.2578564, -1.631703, -3.586651, 0, 1, 0.3529412, 1,
-0.2538775, -1.02054, -3.791846, 0, 1, 0.3568628, 1,
-0.2518146, 0.924628, 0.8026906, 0, 1, 0.3647059, 1,
-0.2514358, -0.1325333, -1.470326, 0, 1, 0.3686275, 1,
-0.2506377, -0.2664985, -5.244751, 0, 1, 0.3764706, 1,
-0.2482147, 1.099488, -1.396778, 0, 1, 0.3803922, 1,
-0.247156, 0.4888436, 0.0920864, 0, 1, 0.3882353, 1,
-0.2460907, 1.464917, 0.01795705, 0, 1, 0.3921569, 1,
-0.2441585, 0.4887892, 0.5479282, 0, 1, 0.4, 1,
-0.2403051, 0.914534, -0.2029817, 0, 1, 0.4078431, 1,
-0.2387556, 1.50966, 1.725548, 0, 1, 0.4117647, 1,
-0.2383079, -1.132971, -4.190987, 0, 1, 0.4196078, 1,
-0.2315098, 0.390256, -1.294141, 0, 1, 0.4235294, 1,
-0.2270071, -0.9107081, -2.81806, 0, 1, 0.4313726, 1,
-0.2262851, -0.1387657, -3.656705, 0, 1, 0.4352941, 1,
-0.2261748, 0.5530739, -0.5613168, 0, 1, 0.4431373, 1,
-0.2219379, -0.1049289, -2.522311, 0, 1, 0.4470588, 1,
-0.2208793, 2.196113, -0.9064369, 0, 1, 0.454902, 1,
-0.2204685, -2.032479, -2.624068, 0, 1, 0.4588235, 1,
-0.2201994, 0.4861564, -0.08479059, 0, 1, 0.4666667, 1,
-0.2165333, 0.7051208, 1.81561, 0, 1, 0.4705882, 1,
-0.2161937, 0.135069, -1.332866, 0, 1, 0.4784314, 1,
-0.214169, -0.7002468, -1.864322, 0, 1, 0.4823529, 1,
-0.2131729, 1.593454, 0.8505728, 0, 1, 0.4901961, 1,
-0.2081823, 1.553003, -0.6315439, 0, 1, 0.4941176, 1,
-0.2076865, 0.5595238, -0.1496032, 0, 1, 0.5019608, 1,
-0.2003242, 1.515783, 2.058158, 0, 1, 0.509804, 1,
-0.1985091, 1.058222, 0.5375757, 0, 1, 0.5137255, 1,
-0.1965236, -0.8761708, -0.4906913, 0, 1, 0.5215687, 1,
-0.1943406, -0.2115427, -4.189569, 0, 1, 0.5254902, 1,
-0.1930885, 0.08883246, -0.5283623, 0, 1, 0.5333334, 1,
-0.1922195, 1.008165, 1.102641, 0, 1, 0.5372549, 1,
-0.1902465, -0.6975324, -1.950927, 0, 1, 0.5450981, 1,
-0.190079, -0.1522362, -2.760462, 0, 1, 0.5490196, 1,
-0.1899505, 0.9701978, 2.237719, 0, 1, 0.5568628, 1,
-0.1899063, -0.5155717, -4.27478, 0, 1, 0.5607843, 1,
-0.1891173, -1.07166, -4.030602, 0, 1, 0.5686275, 1,
-0.1890647, 0.2035189, -2.876017, 0, 1, 0.572549, 1,
-0.1817305, -0.4461715, -3.140828, 0, 1, 0.5803922, 1,
-0.1814327, -0.03575202, -0.5288619, 0, 1, 0.5843138, 1,
-0.1720549, -0.8862633, -4.771111, 0, 1, 0.5921569, 1,
-0.1703621, -0.9819251, -3.438294, 0, 1, 0.5960785, 1,
-0.168344, 0.4954297, -0.5694772, 0, 1, 0.6039216, 1,
-0.1609763, -1.034707, -2.871068, 0, 1, 0.6117647, 1,
-0.1563877, -0.1818995, -4.218416, 0, 1, 0.6156863, 1,
-0.1545495, 0.3272635, 0.7780218, 0, 1, 0.6235294, 1,
-0.1540953, 1.285599, 0.03140562, 0, 1, 0.627451, 1,
-0.1514971, 0.6649118, -0.4559679, 0, 1, 0.6352941, 1,
-0.151273, -1.289977, -1.561731, 0, 1, 0.6392157, 1,
-0.1501273, 1.829593, -1.953565, 0, 1, 0.6470588, 1,
-0.1449142, 1.237942, -1.373869, 0, 1, 0.6509804, 1,
-0.1424946, -1.508268, -4.014682, 0, 1, 0.6588235, 1,
-0.141176, -1.281703, -2.341613, 0, 1, 0.6627451, 1,
-0.1410307, 0.7778876, -2.382773, 0, 1, 0.6705883, 1,
-0.1392042, -0.3543734, -3.31742, 0, 1, 0.6745098, 1,
-0.1385869, -0.2873586, -3.770989, 0, 1, 0.682353, 1,
-0.1384015, -1.207887, -3.274058, 0, 1, 0.6862745, 1,
-0.1383423, 0.5214698, 0.4774517, 0, 1, 0.6941177, 1,
-0.1367922, 0.5698497, -0.8274274, 0, 1, 0.7019608, 1,
-0.1362479, -0.4183348, -2.019794, 0, 1, 0.7058824, 1,
-0.1357929, -0.7587483, -2.621012, 0, 1, 0.7137255, 1,
-0.1355118, -0.6800863, -3.078848, 0, 1, 0.7176471, 1,
-0.1353798, -0.7476958, -2.611435, 0, 1, 0.7254902, 1,
-0.1258462, 1.406668, -0.1106249, 0, 1, 0.7294118, 1,
-0.1233832, -0.4926984, -3.201178, 0, 1, 0.7372549, 1,
-0.1194753, 0.3702606, 0.5158103, 0, 1, 0.7411765, 1,
-0.1130281, 0.9919497, -1.160933, 0, 1, 0.7490196, 1,
-0.1114512, -0.09599725, -2.165861, 0, 1, 0.7529412, 1,
-0.1074054, 0.6082729, -0.5711042, 0, 1, 0.7607843, 1,
-0.1027128, -2.157086, -2.708127, 0, 1, 0.7647059, 1,
-0.09899215, -0.1453159, -3.831488, 0, 1, 0.772549, 1,
-0.09085488, -0.5067357, -4.181917, 0, 1, 0.7764706, 1,
-0.08897084, 0.6094494, 0.4861552, 0, 1, 0.7843137, 1,
-0.08825845, -1.234366, -2.276313, 0, 1, 0.7882353, 1,
-0.08423222, -0.5415578, -1.766652, 0, 1, 0.7960784, 1,
-0.07795278, 0.03246581, -1.761922, 0, 1, 0.8039216, 1,
-0.07766604, 0.4615586, -0.6222205, 0, 1, 0.8078431, 1,
-0.07709267, -0.6770437, -1.941277, 0, 1, 0.8156863, 1,
-0.07326045, 3.280843, -2.551848, 0, 1, 0.8196079, 1,
-0.07298269, 1.161899, 0.546041, 0, 1, 0.827451, 1,
-0.07024683, -0.969352, -2.860573, 0, 1, 0.8313726, 1,
-0.0633469, -0.008552391, -0.446786, 0, 1, 0.8392157, 1,
-0.05898229, -0.3475311, -2.098947, 0, 1, 0.8431373, 1,
-0.05778768, -0.4314636, -4.339571, 0, 1, 0.8509804, 1,
-0.05699273, 0.6505504, -0.7177817, 0, 1, 0.854902, 1,
-0.05191303, 0.6672867, 0.7853007, 0, 1, 0.8627451, 1,
-0.05162122, 2.1534, 0.5108646, 0, 1, 0.8666667, 1,
-0.05085586, 0.8799127, 0.7163004, 0, 1, 0.8745098, 1,
-0.04905989, 1.252527, -1.334037, 0, 1, 0.8784314, 1,
-0.04819069, -0.6635513, -3.319848, 0, 1, 0.8862745, 1,
-0.040174, 0.8911181, 1.761034, 0, 1, 0.8901961, 1,
-0.03804041, 0.2794028, 0.6354493, 0, 1, 0.8980392, 1,
-0.03700985, 1.273714, 1.158439, 0, 1, 0.9058824, 1,
-0.03631967, -0.07319514, -3.182285, 0, 1, 0.9098039, 1,
-0.03251781, 2.08962, -0.08795239, 0, 1, 0.9176471, 1,
-0.03212184, -0.4417979, -6.044396, 0, 1, 0.9215686, 1,
-0.02607412, 1.364581, 0.09648872, 0, 1, 0.9294118, 1,
-0.02553473, -0.3528568, -2.354602, 0, 1, 0.9333333, 1,
-0.02368016, 0.9951147, -0.256385, 0, 1, 0.9411765, 1,
-0.02293382, 0.06517839, -0.1699999, 0, 1, 0.945098, 1,
-0.0218751, 1.262392, -1.142879, 0, 1, 0.9529412, 1,
-0.02092062, 0.7393007, 1.763413, 0, 1, 0.9568627, 1,
-0.020177, -1.862591, -4.394193, 0, 1, 0.9647059, 1,
-0.009462754, -2.113214, -2.418758, 0, 1, 0.9686275, 1,
-0.004723649, -1.360075, -3.005936, 0, 1, 0.9764706, 1,
-0.004004288, -1.256752, -4.322572, 0, 1, 0.9803922, 1,
-0.0009308579, 0.2202116, -0.2461093, 0, 1, 0.9882353, 1,
0.003570708, -0.1463918, 4.597989, 0, 1, 0.9921569, 1,
0.003793302, 0.4011427, 0.3986123, 0, 1, 1, 1,
0.004170026, -0.3625616, 3.828681, 0, 0.9921569, 1, 1,
0.004288527, 2.594977, 0.4620163, 0, 0.9882353, 1, 1,
0.005001826, 2.384611, 0.06482702, 0, 0.9803922, 1, 1,
0.0116756, -0.6648215, 3.661353, 0, 0.9764706, 1, 1,
0.01302608, 0.5994058, 1.657468, 0, 0.9686275, 1, 1,
0.01424298, -1.276385, 2.322422, 0, 0.9647059, 1, 1,
0.01500974, -0.5842581, 3.687807, 0, 0.9568627, 1, 1,
0.01644985, 0.3281019, 0.2625775, 0, 0.9529412, 1, 1,
0.01722911, -1.718199, 2.311512, 0, 0.945098, 1, 1,
0.01760851, 2.006068, 0.137475, 0, 0.9411765, 1, 1,
0.01903987, 0.856272, -0.6008064, 0, 0.9333333, 1, 1,
0.01948089, 1.297334, 0.9096859, 0, 0.9294118, 1, 1,
0.02290848, -0.9588338, 1.949953, 0, 0.9215686, 1, 1,
0.02598449, 0.3692425, -0.9429764, 0, 0.9176471, 1, 1,
0.02608868, 0.9271473, 1.632802, 0, 0.9098039, 1, 1,
0.0277801, 0.637579, 0.2981246, 0, 0.9058824, 1, 1,
0.03060286, 0.1402926, 0.5799378, 0, 0.8980392, 1, 1,
0.03206893, 0.5981685, -0.004629706, 0, 0.8901961, 1, 1,
0.03260875, 0.3159411, -0.4703421, 0, 0.8862745, 1, 1,
0.03320071, -0.01933442, 0.5478354, 0, 0.8784314, 1, 1,
0.03947934, 1.925492, 0.4917508, 0, 0.8745098, 1, 1,
0.04317093, 0.745386, -1.888653, 0, 0.8666667, 1, 1,
0.04904849, -0.5202305, 1.702218, 0, 0.8627451, 1, 1,
0.05460308, 0.6821386, 1.276654, 0, 0.854902, 1, 1,
0.06344242, 0.7298156, 0.7540179, 0, 0.8509804, 1, 1,
0.06358626, 1.281117, 0.8169881, 0, 0.8431373, 1, 1,
0.06375749, -0.1901976, 2.141656, 0, 0.8392157, 1, 1,
0.06611999, -0.3781408, 2.675134, 0, 0.8313726, 1, 1,
0.06626582, 0.10667, 0.6735908, 0, 0.827451, 1, 1,
0.06774369, -0.3671503, 1.51203, 0, 0.8196079, 1, 1,
0.06823026, -0.4564648, 2.255434, 0, 0.8156863, 1, 1,
0.06929051, -0.3434764, 4.212694, 0, 0.8078431, 1, 1,
0.06996489, -0.9413614, 2.758224, 0, 0.8039216, 1, 1,
0.07190885, -0.1472696, 3.922028, 0, 0.7960784, 1, 1,
0.0723849, -1.338191, 1.068327, 0, 0.7882353, 1, 1,
0.07871887, 2.248259, -0.202134, 0, 0.7843137, 1, 1,
0.07912444, -1.632018, 2.721387, 0, 0.7764706, 1, 1,
0.08183177, 1.297887, 0.04150762, 0, 0.772549, 1, 1,
0.08552723, 1.703722, 1.509248, 0, 0.7647059, 1, 1,
0.08837447, -0.8143745, 3.742606, 0, 0.7607843, 1, 1,
0.08845093, -0.3481926, 3.034698, 0, 0.7529412, 1, 1,
0.0925285, -0.05672774, 3.011857, 0, 0.7490196, 1, 1,
0.09274234, -0.3810602, 3.301706, 0, 0.7411765, 1, 1,
0.09311237, 0.4935864, 1.055491, 0, 0.7372549, 1, 1,
0.09503838, 0.137983, 1.604545, 0, 0.7294118, 1, 1,
0.09708501, 0.7881587, 0.8185347, 0, 0.7254902, 1, 1,
0.09791932, -0.2557855, 2.142273, 0, 0.7176471, 1, 1,
0.0987427, 0.2430364, 0.9492901, 0, 0.7137255, 1, 1,
0.0992824, -0.6894042, 3.097657, 0, 0.7058824, 1, 1,
0.09964103, 0.435064, 0.5013894, 0, 0.6980392, 1, 1,
0.1004244, -0.1059847, 1.594934, 0, 0.6941177, 1, 1,
0.1009754, 0.1767705, 0.8575076, 0, 0.6862745, 1, 1,
0.1013415, -0.5562646, 3.180687, 0, 0.682353, 1, 1,
0.1032541, -1.873348, 3.818652, 0, 0.6745098, 1, 1,
0.1038821, 1.519437, 0.5621459, 0, 0.6705883, 1, 1,
0.1079767, 1.93285, -0.9744183, 0, 0.6627451, 1, 1,
0.115492, -0.2420716, 2.023711, 0, 0.6588235, 1, 1,
0.1164029, 0.6539899, -0.7279454, 0, 0.6509804, 1, 1,
0.1171862, -0.07134871, 0.8127765, 0, 0.6470588, 1, 1,
0.1183776, 0.9520831, 2.675446, 0, 0.6392157, 1, 1,
0.1187805, 0.5922383, -1.214166, 0, 0.6352941, 1, 1,
0.1225366, 1.280949, 0.5104574, 0, 0.627451, 1, 1,
0.1253376, 1.397495, 0.5876621, 0, 0.6235294, 1, 1,
0.1359018, -0.6389123, 3.366373, 0, 0.6156863, 1, 1,
0.1446416, -0.6476892, 4.03347, 0, 0.6117647, 1, 1,
0.1456389, -0.5572316, 3.716895, 0, 0.6039216, 1, 1,
0.1466314, 0.1244706, -0.5115596, 0, 0.5960785, 1, 1,
0.1470236, 0.270099, -0.9873802, 0, 0.5921569, 1, 1,
0.1502869, -0.3504984, 3.773768, 0, 0.5843138, 1, 1,
0.1530882, -1.53964, 2.311137, 0, 0.5803922, 1, 1,
0.1582544, -1.256465, 2.585183, 0, 0.572549, 1, 1,
0.1585419, -1.784262, 2.732464, 0, 0.5686275, 1, 1,
0.1587585, 1.204971, -0.4845072, 0, 0.5607843, 1, 1,
0.1592575, 1.099547, 0.9106417, 0, 0.5568628, 1, 1,
0.1603514, -0.3716397, 3.522276, 0, 0.5490196, 1, 1,
0.1607123, -1.247615, 2.333997, 0, 0.5450981, 1, 1,
0.1638316, 0.4993596, 1.399897, 0, 0.5372549, 1, 1,
0.1652698, 1.170013, 0.1440734, 0, 0.5333334, 1, 1,
0.1671694, -0.07668842, 1.791461, 0, 0.5254902, 1, 1,
0.1672269, -0.9001694, 3.597117, 0, 0.5215687, 1, 1,
0.1685116, -0.8153594, 0.9920715, 0, 0.5137255, 1, 1,
0.169822, -1.398386, 2.2193, 0, 0.509804, 1, 1,
0.1755098, 0.3281538, 0.9239091, 0, 0.5019608, 1, 1,
0.17911, 0.4366124, -0.7925113, 0, 0.4941176, 1, 1,
0.1794542, 0.07022803, 2.888537, 0, 0.4901961, 1, 1,
0.1795788, -0.4308896, 2.462816, 0, 0.4823529, 1, 1,
0.1846631, -0.7069021, 1.914762, 0, 0.4784314, 1, 1,
0.186525, -0.1947411, 0.972267, 0, 0.4705882, 1, 1,
0.187702, -1.119268, 2.294138, 0, 0.4666667, 1, 1,
0.189375, -0.6771845, 2.012757, 0, 0.4588235, 1, 1,
0.1896644, -0.09860986, 4.804979, 0, 0.454902, 1, 1,
0.192763, -0.115558, 2.668965, 0, 0.4470588, 1, 1,
0.1931087, -0.6335003, 1.486948, 0, 0.4431373, 1, 1,
0.195247, -1.947801, 3.782144, 0, 0.4352941, 1, 1,
0.1965434, 0.8903416, -1.701895, 0, 0.4313726, 1, 1,
0.2002693, -0.5671625, 3.155996, 0, 0.4235294, 1, 1,
0.2040135, -0.145697, 2.42452, 0, 0.4196078, 1, 1,
0.2053409, 1.082397, -1.123122, 0, 0.4117647, 1, 1,
0.2129047, 0.8918853, 0.8516557, 0, 0.4078431, 1, 1,
0.2149908, -0.08846709, 2.46779, 0, 0.4, 1, 1,
0.216937, 0.3881572, 0.1565715, 0, 0.3921569, 1, 1,
0.2190402, -0.5173211, 2.724187, 0, 0.3882353, 1, 1,
0.222372, -0.6742086, 3.381317, 0, 0.3803922, 1, 1,
0.2351117, 0.5089422, -0.02464607, 0, 0.3764706, 1, 1,
0.2361035, 0.1614664, 0.7731358, 0, 0.3686275, 1, 1,
0.2399076, -0.642927, 1.664045, 0, 0.3647059, 1, 1,
0.2408174, 1.54101, -0.5140083, 0, 0.3568628, 1, 1,
0.2416977, 1.071892, -0.09345607, 0, 0.3529412, 1, 1,
0.2443539, -0.6002, 2.398115, 0, 0.345098, 1, 1,
0.244823, 0.2165482, 3.51432, 0, 0.3411765, 1, 1,
0.2476082, 0.1691196, 0.0208115, 0, 0.3333333, 1, 1,
0.2504133, -0.2010609, 1.331588, 0, 0.3294118, 1, 1,
0.2505068, -0.1132319, 1.930438, 0, 0.3215686, 1, 1,
0.2509145, 1.603881, 1.58377, 0, 0.3176471, 1, 1,
0.2525848, 0.2382064, -0.2171022, 0, 0.3098039, 1, 1,
0.2533404, -1.033341, 2.306576, 0, 0.3058824, 1, 1,
0.2614657, -1.168946, 4.041055, 0, 0.2980392, 1, 1,
0.2668423, 0.3523105, 0.2958445, 0, 0.2901961, 1, 1,
0.2702625, 1.060177, -0.2097862, 0, 0.2862745, 1, 1,
0.2785364, 1.136591, -0.36055, 0, 0.2784314, 1, 1,
0.2852738, -0.6623516, 1.756586, 0, 0.2745098, 1, 1,
0.2882833, -0.662665, 4.153167, 0, 0.2666667, 1, 1,
0.2888926, 1.732359, 0.4072771, 0, 0.2627451, 1, 1,
0.2903062, -1.552276, 3.859112, 0, 0.254902, 1, 1,
0.2919152, -1.535853, 5.553188, 0, 0.2509804, 1, 1,
0.2930315, 0.4181129, 0.7400079, 0, 0.2431373, 1, 1,
0.2932436, -1.494684, 3.883111, 0, 0.2392157, 1, 1,
0.2950534, 0.2417843, 1.287979, 0, 0.2313726, 1, 1,
0.2996343, -1.233552, 4.269624, 0, 0.227451, 1, 1,
0.3019891, 0.8267772, 1.0282, 0, 0.2196078, 1, 1,
0.3021173, 1.623772, -0.4068006, 0, 0.2156863, 1, 1,
0.3052381, 0.1031806, 1.586191, 0, 0.2078431, 1, 1,
0.3079444, 0.31353, 0.4775928, 0, 0.2039216, 1, 1,
0.3178392, -0.2069608, 0.8997935, 0, 0.1960784, 1, 1,
0.3203324, -1.077338, 3.274855, 0, 0.1882353, 1, 1,
0.3216696, -1.35765, 2.730323, 0, 0.1843137, 1, 1,
0.3220354, 0.7110906, 0.1535521, 0, 0.1764706, 1, 1,
0.3270027, -0.6511998, 4.191192, 0, 0.172549, 1, 1,
0.3297317, 0.3913062, 1.33016, 0, 0.1647059, 1, 1,
0.3300407, -0.4031757, 3.677128, 0, 0.1607843, 1, 1,
0.3322234, 0.06098321, -0.1635937, 0, 0.1529412, 1, 1,
0.3324705, 0.7417519, 0.7651192, 0, 0.1490196, 1, 1,
0.3362896, 1.168059, -1.173403, 0, 0.1411765, 1, 1,
0.3376662, 0.1391262, 0.9058294, 0, 0.1372549, 1, 1,
0.3449555, -1.313791, 2.087568, 0, 0.1294118, 1, 1,
0.3495215, 0.4865355, 0.1961945, 0, 0.1254902, 1, 1,
0.3506752, -0.177477, 1.873471, 0, 0.1176471, 1, 1,
0.3554043, 0.2832801, -1.074866, 0, 0.1137255, 1, 1,
0.35734, -0.6364881, 2.303371, 0, 0.1058824, 1, 1,
0.3580376, 0.7647778, 1.639673, 0, 0.09803922, 1, 1,
0.3581193, 1.466012, -0.1822353, 0, 0.09411765, 1, 1,
0.3583939, -0.6747484, 3.990711, 0, 0.08627451, 1, 1,
0.3606421, 1.246205, 0.5729341, 0, 0.08235294, 1, 1,
0.3687757, 0.2192968, 0.5521257, 0, 0.07450981, 1, 1,
0.3726955, 0.07334988, 1.951321, 0, 0.07058824, 1, 1,
0.3867863, -0.4150349, 1.98387, 0, 0.0627451, 1, 1,
0.3914894, -0.8788058, 2.871886, 0, 0.05882353, 1, 1,
0.3929779, 0.4913599, 1.022868, 0, 0.05098039, 1, 1,
0.3944083, -0.9335179, 1.872727, 0, 0.04705882, 1, 1,
0.3965966, 0.06688748, 0.1475071, 0, 0.03921569, 1, 1,
0.4000377, -0.2858, 3.914613, 0, 0.03529412, 1, 1,
0.404003, 1.269803, 1.499351, 0, 0.02745098, 1, 1,
0.4044651, -1.388783, 1.933975, 0, 0.02352941, 1, 1,
0.4072651, 1.53346, 0.6409951, 0, 0.01568628, 1, 1,
0.409884, -0.3971035, 1.217158, 0, 0.01176471, 1, 1,
0.4124765, -0.4868327, 2.26312, 0, 0.003921569, 1, 1,
0.4132045, -0.8704873, 4.225368, 0.003921569, 0, 1, 1,
0.4144339, 0.6289496, -0.385537, 0.007843138, 0, 1, 1,
0.4173139, -0.08037678, 0.6706406, 0.01568628, 0, 1, 1,
0.4177419, 0.3684398, 0.265831, 0.01960784, 0, 1, 1,
0.4197532, 1.141692, 1.359508, 0.02745098, 0, 1, 1,
0.4201353, -1.114885, 2.5065, 0.03137255, 0, 1, 1,
0.4226545, 1.932905, 0.1141736, 0.03921569, 0, 1, 1,
0.4457121, 1.064367, 0.2478652, 0.04313726, 0, 1, 1,
0.4559769, 0.3378952, 0.8329253, 0.05098039, 0, 1, 1,
0.4579997, -2.88101, 1.169685, 0.05490196, 0, 1, 1,
0.4666419, -0.762486, 3.647689, 0.0627451, 0, 1, 1,
0.4667631, 1.152475, -0.276859, 0.06666667, 0, 1, 1,
0.4694422, 0.7395762, 1.779071, 0.07450981, 0, 1, 1,
0.4718733, -0.5489271, 3.428648, 0.07843138, 0, 1, 1,
0.472506, -0.319956, 2.555586, 0.08627451, 0, 1, 1,
0.4727504, -0.872619, 2.665403, 0.09019608, 0, 1, 1,
0.473445, -0.4738719, 2.023723, 0.09803922, 0, 1, 1,
0.4757661, 0.05420556, 1.541096, 0.1058824, 0, 1, 1,
0.4805729, -0.06630351, 0.9506714, 0.1098039, 0, 1, 1,
0.4857279, -0.7349527, 3.230337, 0.1176471, 0, 1, 1,
0.4885061, -0.6114619, 0.1294633, 0.1215686, 0, 1, 1,
0.4973161, -0.4304943, 2.424389, 0.1294118, 0, 1, 1,
0.4980873, 0.8739995, 1.200325, 0.1333333, 0, 1, 1,
0.500452, 0.9933566, 0.9181845, 0.1411765, 0, 1, 1,
0.5055901, 0.07810314, 1.071238, 0.145098, 0, 1, 1,
0.5061264, 0.6890371, -0.1761235, 0.1529412, 0, 1, 1,
0.5076075, 0.4687229, 0.3701457, 0.1568628, 0, 1, 1,
0.5082571, -1.507665, 3.304126, 0.1647059, 0, 1, 1,
0.5108374, -0.5715051, 1.914415, 0.1686275, 0, 1, 1,
0.5140271, -0.2063414, 3.018881, 0.1764706, 0, 1, 1,
0.5163847, 0.9707835, -1.20099, 0.1803922, 0, 1, 1,
0.5169223, 1.115317, -0.3982177, 0.1882353, 0, 1, 1,
0.5172657, 0.02685511, 0.7620127, 0.1921569, 0, 1, 1,
0.5178966, -1.34074, 2.843481, 0.2, 0, 1, 1,
0.5203545, -1.049227, 4.260487, 0.2078431, 0, 1, 1,
0.5232516, 1.011755, 0.4007809, 0.2117647, 0, 1, 1,
0.5236528, -0.331545, 1.354978, 0.2196078, 0, 1, 1,
0.5249947, 0.3935676, 2.415197, 0.2235294, 0, 1, 1,
0.5263712, -1.304121, 1.766636, 0.2313726, 0, 1, 1,
0.5298458, -1.001969, 2.813906, 0.2352941, 0, 1, 1,
0.5304081, 1.525364, 0.7464201, 0.2431373, 0, 1, 1,
0.535757, -0.6824856, 2.736406, 0.2470588, 0, 1, 1,
0.5450127, -1.075968, 4.648265, 0.254902, 0, 1, 1,
0.5505934, 0.2797891, 2.04741, 0.2588235, 0, 1, 1,
0.5568171, -0.3418474, 0.7751048, 0.2666667, 0, 1, 1,
0.5593893, -0.2961193, 1.882263, 0.2705882, 0, 1, 1,
0.5666748, 1.297492, 1.175909, 0.2784314, 0, 1, 1,
0.5747733, 0.6668653, 0.3999111, 0.282353, 0, 1, 1,
0.5760616, -0.008668059, -0.3822105, 0.2901961, 0, 1, 1,
0.5776739, 0.2431315, 0.3828543, 0.2941177, 0, 1, 1,
0.5816404, -0.4834868, 3.163219, 0.3019608, 0, 1, 1,
0.5822831, 0.4526513, -0.6585174, 0.3098039, 0, 1, 1,
0.5836488, -1.270345, 4.617993, 0.3137255, 0, 1, 1,
0.5856982, 0.03220515, -0.412904, 0.3215686, 0, 1, 1,
0.5904558, 1.87354, -0.08230346, 0.3254902, 0, 1, 1,
0.596008, -0.1498957, 3.165942, 0.3333333, 0, 1, 1,
0.5987666, 0.01232105, 1.599491, 0.3372549, 0, 1, 1,
0.5991345, 0.973363, 2.814654, 0.345098, 0, 1, 1,
0.6005288, -0.2914048, 1.155753, 0.3490196, 0, 1, 1,
0.602425, 0.165607, 1.774061, 0.3568628, 0, 1, 1,
0.607561, -0.7631615, 1.102691, 0.3607843, 0, 1, 1,
0.6123929, 1.785705, 0.8175517, 0.3686275, 0, 1, 1,
0.6130728, 1.599047, 1.704107, 0.372549, 0, 1, 1,
0.6154576, 0.3388216, 0.2760513, 0.3803922, 0, 1, 1,
0.6181448, -0.6986043, 2.846881, 0.3843137, 0, 1, 1,
0.6194968, -0.7466021, 4.016921, 0.3921569, 0, 1, 1,
0.6217657, 0.01054003, 1.190882, 0.3960784, 0, 1, 1,
0.6223426, 0.6532614, -0.9965023, 0.4039216, 0, 1, 1,
0.62383, 0.1971135, 1.433723, 0.4117647, 0, 1, 1,
0.6249903, 0.8763015, 0.6647916, 0.4156863, 0, 1, 1,
0.6283841, -1.7831, 2.718476, 0.4235294, 0, 1, 1,
0.6392019, -0.4848153, 1.816972, 0.427451, 0, 1, 1,
0.6431407, -0.5752322, 2.506824, 0.4352941, 0, 1, 1,
0.6438194, -0.2331185, 0.8425046, 0.4392157, 0, 1, 1,
0.6495811, -0.30332, 0.7258652, 0.4470588, 0, 1, 1,
0.6505579, 0.06538811, 0.4828407, 0.4509804, 0, 1, 1,
0.6510953, -0.2303799, 3.433879, 0.4588235, 0, 1, 1,
0.6551752, -0.3365317, 2.837296, 0.4627451, 0, 1, 1,
0.6552866, -0.2594918, 1.896379, 0.4705882, 0, 1, 1,
0.657061, -1.624749, 3.304909, 0.4745098, 0, 1, 1,
0.6671317, -0.9423946, 2.221615, 0.4823529, 0, 1, 1,
0.6685439, 1.432996, 1.447818, 0.4862745, 0, 1, 1,
0.6691028, -1.844671, 2.478553, 0.4941176, 0, 1, 1,
0.6704105, 0.1591115, 1.673021, 0.5019608, 0, 1, 1,
0.6732319, -1.170649, 3.80528, 0.5058824, 0, 1, 1,
0.6790085, -1.749993, 0.8509104, 0.5137255, 0, 1, 1,
0.6844454, -0.7935608, 3.001228, 0.5176471, 0, 1, 1,
0.6845582, 0.3901256, 1.292819, 0.5254902, 0, 1, 1,
0.6867623, 0.9214901, -0.1560677, 0.5294118, 0, 1, 1,
0.6879106, -0.9202027, 3.15082, 0.5372549, 0, 1, 1,
0.6899521, -1.044123, 3.826788, 0.5411765, 0, 1, 1,
0.6922491, 0.9172727, 2.636654, 0.5490196, 0, 1, 1,
0.6935004, 0.4726641, 1.85661, 0.5529412, 0, 1, 1,
0.6940743, 1.176328, -0.1229459, 0.5607843, 0, 1, 1,
0.6964551, 0.5749097, 0.5720786, 0.5647059, 0, 1, 1,
0.7006202, -0.9819555, 3.005403, 0.572549, 0, 1, 1,
0.7014424, -0.3734977, 2.338833, 0.5764706, 0, 1, 1,
0.7014961, -0.8662949, 2.066868, 0.5843138, 0, 1, 1,
0.702048, -0.1535794, 1.661261, 0.5882353, 0, 1, 1,
0.7046894, 0.3458405, -0.5916741, 0.5960785, 0, 1, 1,
0.7048784, 2.033137, 1.937739, 0.6039216, 0, 1, 1,
0.7074554, 0.7170021, 0.007372533, 0.6078432, 0, 1, 1,
0.7079288, 0.6083859, -0.2315006, 0.6156863, 0, 1, 1,
0.7151666, -1.329583, 2.431597, 0.6196079, 0, 1, 1,
0.726043, -1.611717, 2.4434, 0.627451, 0, 1, 1,
0.7271477, 1.999699, -0.5479489, 0.6313726, 0, 1, 1,
0.7291467, 0.3393998, 2.619996, 0.6392157, 0, 1, 1,
0.7304506, 0.2657377, -0.03867127, 0.6431373, 0, 1, 1,
0.7310016, 0.1388112, 1.532007, 0.6509804, 0, 1, 1,
0.7316168, 0.6022707, 1.382758, 0.654902, 0, 1, 1,
0.7335718, -1.488314, 3.423262, 0.6627451, 0, 1, 1,
0.7447681, 1.472224, -1.066024, 0.6666667, 0, 1, 1,
0.7470613, 1.871899, 0.07438131, 0.6745098, 0, 1, 1,
0.7510009, 0.0825908, 1.15191, 0.6784314, 0, 1, 1,
0.7521493, -0.2893389, 2.883662, 0.6862745, 0, 1, 1,
0.7581281, 0.1311119, 0.357021, 0.6901961, 0, 1, 1,
0.7666309, 0.8179505, 1.009805, 0.6980392, 0, 1, 1,
0.7759383, 0.7688111, -0.09574348, 0.7058824, 0, 1, 1,
0.7929629, -0.7812656, 1.521093, 0.7098039, 0, 1, 1,
0.7936482, -0.5984538, 4.083335, 0.7176471, 0, 1, 1,
0.8047439, 2.118394, 1.562464, 0.7215686, 0, 1, 1,
0.8055386, -1.558205, 2.663922, 0.7294118, 0, 1, 1,
0.8119537, -0.6519437, 2.331734, 0.7333333, 0, 1, 1,
0.8145223, 0.003305359, 2.642994, 0.7411765, 0, 1, 1,
0.81754, 0.187962, 2.856957, 0.7450981, 0, 1, 1,
0.8230582, 0.8195798, 0.3593544, 0.7529412, 0, 1, 1,
0.8266974, 0.00730862, 1.271471, 0.7568628, 0, 1, 1,
0.8279952, 0.8111569, 0.7481868, 0.7647059, 0, 1, 1,
0.8377978, 0.7713464, 0.5655632, 0.7686275, 0, 1, 1,
0.8455139, 0.8446038, 1.12008, 0.7764706, 0, 1, 1,
0.8471763, -0.01558552, 2.947561, 0.7803922, 0, 1, 1,
0.8515546, 0.6345385, 0.7569305, 0.7882353, 0, 1, 1,
0.8521681, -0.3946865, 2.870092, 0.7921569, 0, 1, 1,
0.8599814, 0.7171805, 1.805582, 0.8, 0, 1, 1,
0.8610034, -0.9413519, 1.777893, 0.8078431, 0, 1, 1,
0.8619677, -0.1652781, 1.279296, 0.8117647, 0, 1, 1,
0.8689862, -1.082266, 3.12198, 0.8196079, 0, 1, 1,
0.8705359, -0.067324, 1.850602, 0.8235294, 0, 1, 1,
0.8749783, 1.05898, 0.5945742, 0.8313726, 0, 1, 1,
0.8753244, 1.837702, -0.005033097, 0.8352941, 0, 1, 1,
0.8771148, 0.2036714, 3.557732, 0.8431373, 0, 1, 1,
0.8774511, 0.9767559, 0.2225297, 0.8470588, 0, 1, 1,
0.8788118, -1.760639, 3.598265, 0.854902, 0, 1, 1,
0.8838782, -0.07648709, 1.716246, 0.8588235, 0, 1, 1,
0.8844755, -0.8451471, 3.08028, 0.8666667, 0, 1, 1,
0.8865718, 0.1563673, 0.9116296, 0.8705882, 0, 1, 1,
0.8884951, -0.2849751, 2.235756, 0.8784314, 0, 1, 1,
0.8900603, -0.3862602, 1.55453, 0.8823529, 0, 1, 1,
0.8914362, 1.235904, -1.336686, 0.8901961, 0, 1, 1,
0.8922023, -0.3931948, 1.57761, 0.8941177, 0, 1, 1,
0.8979844, -0.308636, 1.731784, 0.9019608, 0, 1, 1,
0.9042342, 1.774426, 1.374204, 0.9098039, 0, 1, 1,
0.906826, -0.2471997, 1.023688, 0.9137255, 0, 1, 1,
0.9075322, -0.1425544, 2.668548, 0.9215686, 0, 1, 1,
0.9170157, 0.9384213, -0.6352946, 0.9254902, 0, 1, 1,
0.9184003, -0.3757686, 3.368332, 0.9333333, 0, 1, 1,
0.9196714, -0.671245, 2.039543, 0.9372549, 0, 1, 1,
0.9273154, 1.018453, -0.2726215, 0.945098, 0, 1, 1,
0.9291813, -1.521402, 2.313465, 0.9490196, 0, 1, 1,
0.932684, -0.2344185, 0.651125, 0.9568627, 0, 1, 1,
0.9340455, -0.5288746, 2.736205, 0.9607843, 0, 1, 1,
0.9353977, -2.421695, 2.247552, 0.9686275, 0, 1, 1,
0.9356073, 0.3120372, 2.362795, 0.972549, 0, 1, 1,
0.9434166, 0.9386505, -0.5353695, 0.9803922, 0, 1, 1,
0.948598, 0.9958221, 0.06316807, 0.9843137, 0, 1, 1,
0.9546514, -1.530587, 2.073676, 0.9921569, 0, 1, 1,
0.9602909, 0.04172514, 0.9887143, 0.9960784, 0, 1, 1,
0.962533, -1.331128, 1.70737, 1, 0, 0.9960784, 1,
0.9693262, -0.4073867, 2.667835, 1, 0, 0.9882353, 1,
0.9752703, 0.3137385, 2.793433, 1, 0, 0.9843137, 1,
0.9794914, -1.124402, 0.4913168, 1, 0, 0.9764706, 1,
0.9899495, 0.2858248, 1.316315, 1, 0, 0.972549, 1,
0.9908609, 0.08802953, 1.054572, 1, 0, 0.9647059, 1,
0.9940009, 1.180136, 0.5916274, 1, 0, 0.9607843, 1,
0.9977228, 1.134609, 1.204742, 1, 0, 0.9529412, 1,
0.9992158, -0.9100302, 0.7389414, 1, 0, 0.9490196, 1,
1.009341, 0.8980505, 1.760351, 1, 0, 0.9411765, 1,
1.01077, 0.09638194, 2.137234, 1, 0, 0.9372549, 1,
1.010939, -0.5070898, 3.722199, 1, 0, 0.9294118, 1,
1.012497, -0.3329741, 1.533603, 1, 0, 0.9254902, 1,
1.013007, 0.3348393, -0.596319, 1, 0, 0.9176471, 1,
1.014969, 0.7238834, 1.711266, 1, 0, 0.9137255, 1,
1.016085, 0.1298211, 1.53562, 1, 0, 0.9058824, 1,
1.017135, -0.05531098, 2.26421, 1, 0, 0.9019608, 1,
1.018835, 0.7710873, 1.826425, 1, 0, 0.8941177, 1,
1.024127, -0.6125014, 1.823567, 1, 0, 0.8862745, 1,
1.026273, -0.2178285, 0.9672821, 1, 0, 0.8823529, 1,
1.033095, 0.02057353, 2.238537, 1, 0, 0.8745098, 1,
1.034594, 0.6151124, 0.04062887, 1, 0, 0.8705882, 1,
1.038138, -0.328444, 1.430459, 1, 0, 0.8627451, 1,
1.042935, -1.731161, 3.558914, 1, 0, 0.8588235, 1,
1.048329, 0.001812616, 0.7567973, 1, 0, 0.8509804, 1,
1.051417, -0.2623998, 3.133873, 1, 0, 0.8470588, 1,
1.051427, 0.8552004, 1.161738, 1, 0, 0.8392157, 1,
1.052454, -0.02490819, 0.912747, 1, 0, 0.8352941, 1,
1.054808, 1.182709, 1.440662, 1, 0, 0.827451, 1,
1.060495, -1.214144, 2.794347, 1, 0, 0.8235294, 1,
1.062682, 0.3570483, 2.68213, 1, 0, 0.8156863, 1,
1.0652, 0.7268624, 1.062916, 1, 0, 0.8117647, 1,
1.068134, 0.1935002, 0.7205511, 1, 0, 0.8039216, 1,
1.068287, 2.020186, -0.1139134, 1, 0, 0.7960784, 1,
1.06842, -2.72629, 2.376644, 1, 0, 0.7921569, 1,
1.069353, -0.05899019, 3.300212, 1, 0, 0.7843137, 1,
1.07794, 1.685875, 1.792753, 1, 0, 0.7803922, 1,
1.078129, -0.5341741, 0.7917426, 1, 0, 0.772549, 1,
1.082473, 0.958948, -0.8654216, 1, 0, 0.7686275, 1,
1.083416, 2.037335, 1.052442, 1, 0, 0.7607843, 1,
1.090977, 0.6013947, 1.369597, 1, 0, 0.7568628, 1,
1.091896, -1.160847, 0.9501479, 1, 0, 0.7490196, 1,
1.092451, 1.560022, 1.96531, 1, 0, 0.7450981, 1,
1.09811, 0.8803312, 1.051593, 1, 0, 0.7372549, 1,
1.09936, 0.2003141, 3.443011, 1, 0, 0.7333333, 1,
1.107637, 0.7285252, 1.454296, 1, 0, 0.7254902, 1,
1.108936, -0.4566998, 2.012494, 1, 0, 0.7215686, 1,
1.109055, -0.75796, 3.333671, 1, 0, 0.7137255, 1,
1.114627, 1.358683, 0.6084471, 1, 0, 0.7098039, 1,
1.123859, 0.723233, 0.6756967, 1, 0, 0.7019608, 1,
1.127052, 0.5551845, 1.981719, 1, 0, 0.6941177, 1,
1.129889, 2.401431, 0.1766079, 1, 0, 0.6901961, 1,
1.13741, 0.4098631, 1.700179, 1, 0, 0.682353, 1,
1.148879, -0.1137022, -0.8100479, 1, 0, 0.6784314, 1,
1.152937, 0.5847268, 0.3677807, 1, 0, 0.6705883, 1,
1.15322, 1.585775, 0.499453, 1, 0, 0.6666667, 1,
1.169607, 1.058664, 1.460815, 1, 0, 0.6588235, 1,
1.170585, 0.1891451, 1.893291, 1, 0, 0.654902, 1,
1.173944, 1.475224, 0.6757513, 1, 0, 0.6470588, 1,
1.176579, 0.3914907, -0.3664605, 1, 0, 0.6431373, 1,
1.180071, 1.153114, -0.7364836, 1, 0, 0.6352941, 1,
1.181449, 1.355663, 2.35015, 1, 0, 0.6313726, 1,
1.182559, -0.5817088, 3.136767, 1, 0, 0.6235294, 1,
1.185407, 1.276975, 1.773197, 1, 0, 0.6196079, 1,
1.195364, -0.9605119, 3.657082, 1, 0, 0.6117647, 1,
1.22236, -0.1919627, 1.327649, 1, 0, 0.6078432, 1,
1.233327, 0.6758199, 1.241329, 1, 0, 0.6, 1,
1.236095, -0.4761238, 2.529346, 1, 0, 0.5921569, 1,
1.236908, 1.090608, 0.4562107, 1, 0, 0.5882353, 1,
1.242403, -1.750695, 2.187515, 1, 0, 0.5803922, 1,
1.246598, -0.3834518, 3.844959, 1, 0, 0.5764706, 1,
1.247013, 0.4210722, 0.1595831, 1, 0, 0.5686275, 1,
1.247447, 1.010514, 0.8510149, 1, 0, 0.5647059, 1,
1.249731, 0.5196648, 1.361933, 1, 0, 0.5568628, 1,
1.257096, 1.775859, -0.1617526, 1, 0, 0.5529412, 1,
1.259981, -0.9569623, 3.254939, 1, 0, 0.5450981, 1,
1.262293, 0.2300304, 0.2981913, 1, 0, 0.5411765, 1,
1.263348, -0.1548778, 1.145885, 1, 0, 0.5333334, 1,
1.274829, -0.9385188, 3.246089, 1, 0, 0.5294118, 1,
1.275448, -0.1915814, 1.57322, 1, 0, 0.5215687, 1,
1.280785, 0.5835817, 1.316486, 1, 0, 0.5176471, 1,
1.286946, 1.024343, 0.5567919, 1, 0, 0.509804, 1,
1.29844, 1.572674, 0.06244377, 1, 0, 0.5058824, 1,
1.310008, -2.421683, 4.426647, 1, 0, 0.4980392, 1,
1.310952, 0.03993809, 1.880433, 1, 0, 0.4901961, 1,
1.333567, -0.3205789, 2.830765, 1, 0, 0.4862745, 1,
1.342713, -0.8238439, 1.694747, 1, 0, 0.4784314, 1,
1.353969, -0.9709454, 0.1599759, 1, 0, 0.4745098, 1,
1.365396, -0.3007436, 1.472685, 1, 0, 0.4666667, 1,
1.369794, -0.006199056, 2.973737, 1, 0, 0.4627451, 1,
1.381991, -0.590151, 0.4921609, 1, 0, 0.454902, 1,
1.399403, -1.010871, 2.179031, 1, 0, 0.4509804, 1,
1.415796, 0.05695496, -1.6501, 1, 0, 0.4431373, 1,
1.429613, 1.92355, 0.2812389, 1, 0, 0.4392157, 1,
1.439223, 1.228439, 2.551223, 1, 0, 0.4313726, 1,
1.442372, -0.6797686, 1.985837, 1, 0, 0.427451, 1,
1.443465, 0.05719028, -0.1411452, 1, 0, 0.4196078, 1,
1.443529, -1.405926, 3.50229, 1, 0, 0.4156863, 1,
1.446207, 1.323561, 1.026686, 1, 0, 0.4078431, 1,
1.45313, 0.3463044, 2.613509, 1, 0, 0.4039216, 1,
1.460119, -0.379794, 1.490591, 1, 0, 0.3960784, 1,
1.465332, 0.1433734, 0.8744407, 1, 0, 0.3882353, 1,
1.466176, -0.6299592, 1.576258, 1, 0, 0.3843137, 1,
1.475298, 0.7287405, 1.200838, 1, 0, 0.3764706, 1,
1.476057, 0.007526085, 0.6546333, 1, 0, 0.372549, 1,
1.492886, 0.5383582, 1.983142, 1, 0, 0.3647059, 1,
1.499814, 2.185614, -1.655519, 1, 0, 0.3607843, 1,
1.50286, 1.061272, 1.947714, 1, 0, 0.3529412, 1,
1.524225, -0.02807707, 0.5496597, 1, 0, 0.3490196, 1,
1.533666, 0.230787, 2.184342, 1, 0, 0.3411765, 1,
1.535131, 0.7887518, 3.579997, 1, 0, 0.3372549, 1,
1.54184, 0.142714, 0.1145897, 1, 0, 0.3294118, 1,
1.550269, -2.767126, 0.7132436, 1, 0, 0.3254902, 1,
1.554898, 1.22774, 2.437872, 1, 0, 0.3176471, 1,
1.561386, 0.09724682, 2.041371, 1, 0, 0.3137255, 1,
1.578765, -1.344237, 1.425548, 1, 0, 0.3058824, 1,
1.579457, 1.65992, 0.0217309, 1, 0, 0.2980392, 1,
1.589642, -0.002252419, 1.550976, 1, 0, 0.2941177, 1,
1.613055, 0.5826684, 2.113301, 1, 0, 0.2862745, 1,
1.616364, -0.1975546, 1.987441, 1, 0, 0.282353, 1,
1.619291, 1.156053, 1.389416, 1, 0, 0.2745098, 1,
1.653355, 1.028573, 1.56155, 1, 0, 0.2705882, 1,
1.655323, 1.838707, -1.216081, 1, 0, 0.2627451, 1,
1.657446, -0.7076355, 1.642642, 1, 0, 0.2588235, 1,
1.666178, -0.9258425, 2.80478, 1, 0, 0.2509804, 1,
1.666646, 0.9972721, 0.6965364, 1, 0, 0.2470588, 1,
1.733349, -1.177268, 0.3720733, 1, 0, 0.2392157, 1,
1.734508, 0.6115394, 0.6468995, 1, 0, 0.2352941, 1,
1.734529, -0.686719, 1.990996, 1, 0, 0.227451, 1,
1.734693, 0.3898969, 0.8873429, 1, 0, 0.2235294, 1,
1.746054, 1.30424, 3.10265, 1, 0, 0.2156863, 1,
1.762603, -0.9944694, 1.677531, 1, 0, 0.2117647, 1,
1.763175, 1.293615, 0.3581881, 1, 0, 0.2039216, 1,
1.788556, -1.581274, 2.270011, 1, 0, 0.1960784, 1,
1.815622, 0.240556, 0.7064912, 1, 0, 0.1921569, 1,
1.825269, -0.2352283, 3.71589, 1, 0, 0.1843137, 1,
1.826779, 1.689325, 0.9584924, 1, 0, 0.1803922, 1,
1.83551, -1.198148, 1.937087, 1, 0, 0.172549, 1,
1.848916, 1.161939, 3.368415, 1, 0, 0.1686275, 1,
1.868405, 0.3075921, 1.528973, 1, 0, 0.1607843, 1,
1.868781, 0.1363766, 0.6331359, 1, 0, 0.1568628, 1,
1.876292, -0.7826034, 1.744055, 1, 0, 0.1490196, 1,
1.895288, -0.5170178, 1.158125, 1, 0, 0.145098, 1,
1.917629, 0.01761633, 1.574446, 1, 0, 0.1372549, 1,
1.964158, 0.7630664, 0.8268772, 1, 0, 0.1333333, 1,
1.968419, 1.409334, 2.044802, 1, 0, 0.1254902, 1,
1.977686, -1.159993, 0.9669095, 1, 0, 0.1215686, 1,
1.981932, 1.165497, 0.69791, 1, 0, 0.1137255, 1,
2.019116, 1.432717, 2.590289, 1, 0, 0.1098039, 1,
2.059808, 0.5636068, 2.39544, 1, 0, 0.1019608, 1,
2.071673, 0.5156804, 1.740409, 1, 0, 0.09411765, 1,
2.106688, -0.3424277, 1.278893, 1, 0, 0.09019608, 1,
2.12816, -0.299641, 2.468261, 1, 0, 0.08235294, 1,
2.155809, -0.1168658, 2.34791, 1, 0, 0.07843138, 1,
2.318733, 1.228276, 1.166903, 1, 0, 0.07058824, 1,
2.385692, 1.2619, 0.3666772, 1, 0, 0.06666667, 1,
2.418703, 0.3145067, 2.388292, 1, 0, 0.05882353, 1,
2.441755, 1.023474, 3.062232, 1, 0, 0.05490196, 1,
2.59643, -2.904369, 1.880337, 1, 0, 0.04705882, 1,
2.648711, 0.05733992, -0.2219069, 1, 0, 0.04313726, 1,
2.747705, 1.022586, 0.6993231, 1, 0, 0.03529412, 1,
2.939637, -1.122059, 2.337451, 1, 0, 0.03137255, 1,
2.96585, 0.2790491, 2.110511, 1, 0, 0.02352941, 1,
3.155955, -0.3092413, 3.122464, 1, 0, 0.01960784, 1,
3.453134, -1.756688, 1.584445, 1, 0, 0.01176471, 1,
3.717103, -1.181006, 2.020849, 1, 0, 0.007843138, 1
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
0.3854111, -4.229121, -8.010186, 0, -0.5, 0.5, 0.5,
0.3854111, -4.229121, -8.010186, 1, -0.5, 0.5, 0.5,
0.3854111, -4.229121, -8.010186, 1, 1.5, 0.5, 0.5,
0.3854111, -4.229121, -8.010186, 0, 1.5, 0.5, 0.5
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
-4.075724, 0.07008433, -8.010186, 0, -0.5, 0.5, 0.5,
-4.075724, 0.07008433, -8.010186, 1, -0.5, 0.5, 0.5,
-4.075724, 0.07008433, -8.010186, 1, 1.5, 0.5, 0.5,
-4.075724, 0.07008433, -8.010186, 0, 1.5, 0.5, 0.5
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
-4.075724, -4.229121, -0.245604, 0, -0.5, 0.5, 0.5,
-4.075724, -4.229121, -0.245604, 1, -0.5, 0.5, 0.5,
-4.075724, -4.229121, -0.245604, 1, 1.5, 0.5, 0.5,
-4.075724, -4.229121, -0.245604, 0, 1.5, 0.5, 0.5
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
-2, -3.236997, -6.218359,
3, -3.236997, -6.218359,
-2, -3.236997, -6.218359,
-2, -3.402351, -6.516997,
-1, -3.236997, -6.218359,
-1, -3.402351, -6.516997,
0, -3.236997, -6.218359,
0, -3.402351, -6.516997,
1, -3.236997, -6.218359,
1, -3.402351, -6.516997,
2, -3.236997, -6.218359,
2, -3.402351, -6.516997,
3, -3.236997, -6.218359,
3, -3.402351, -6.516997
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
-2, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
-2, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
-2, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
-2, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5,
-1, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
-1, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
-1, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
-1, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5,
0, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
0, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
0, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
0, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5,
1, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
1, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
1, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
1, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5,
2, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
2, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
2, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
2, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5,
3, -3.733059, -7.114273, 0, -0.5, 0.5, 0.5,
3, -3.733059, -7.114273, 1, -0.5, 0.5, 0.5,
3, -3.733059, -7.114273, 1, 1.5, 0.5, 0.5,
3, -3.733059, -7.114273, 0, 1.5, 0.5, 0.5
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
-3.046231, -3, -6.218359,
-3.046231, 3, -6.218359,
-3.046231, -3, -6.218359,
-3.217813, -3, -6.516997,
-3.046231, -2, -6.218359,
-3.217813, -2, -6.516997,
-3.046231, -1, -6.218359,
-3.217813, -1, -6.516997,
-3.046231, 0, -6.218359,
-3.217813, 0, -6.516997,
-3.046231, 1, -6.218359,
-3.217813, 1, -6.516997,
-3.046231, 2, -6.218359,
-3.217813, 2, -6.516997,
-3.046231, 3, -6.218359,
-3.217813, 3, -6.516997
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
-3.560977, -3, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, -3, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, -3, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, -3, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, -2, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, -2, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, -2, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, -2, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, -1, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, -1, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, -1, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, -1, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, 0, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, 0, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, 0, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, 0, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, 1, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, 1, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, 1, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, 1, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, 2, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, 2, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, 2, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, 2, -7.114273, 0, 1.5, 0.5, 0.5,
-3.560977, 3, -7.114273, 0, -0.5, 0.5, 0.5,
-3.560977, 3, -7.114273, 1, -0.5, 0.5, 0.5,
-3.560977, 3, -7.114273, 1, 1.5, 0.5, 0.5,
-3.560977, 3, -7.114273, 0, 1.5, 0.5, 0.5
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
-3.046231, -3.236997, -6,
-3.046231, -3.236997, 4,
-3.046231, -3.236997, -6,
-3.217813, -3.402351, -6,
-3.046231, -3.236997, -4,
-3.217813, -3.402351, -4,
-3.046231, -3.236997, -2,
-3.217813, -3.402351, -2,
-3.046231, -3.236997, 0,
-3.217813, -3.402351, 0,
-3.046231, -3.236997, 2,
-3.217813, -3.402351, 2,
-3.046231, -3.236997, 4,
-3.217813, -3.402351, 4
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
"-6",
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
-3.560977, -3.733059, -6, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -6, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -6, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, -6, 0, 1.5, 0.5, 0.5,
-3.560977, -3.733059, -4, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -4, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -4, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, -4, 0, 1.5, 0.5, 0.5,
-3.560977, -3.733059, -2, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -2, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, -2, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, -2, 0, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 0, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 0, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 0, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 0, 0, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 2, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 2, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 2, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 2, 0, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 4, 0, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 4, 1, -0.5, 0.5, 0.5,
-3.560977, -3.733059, 4, 1, 1.5, 0.5, 0.5,
-3.560977, -3.733059, 4, 0, 1.5, 0.5, 0.5
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
-3.046231, -3.236997, -6.218359,
-3.046231, 3.377165, -6.218359,
-3.046231, -3.236997, 5.727151,
-3.046231, 3.377165, 5.727151,
-3.046231, -3.236997, -6.218359,
-3.046231, -3.236997, 5.727151,
-3.046231, 3.377165, -6.218359,
-3.046231, 3.377165, 5.727151,
-3.046231, -3.236997, -6.218359,
3.817053, -3.236997, -6.218359,
-3.046231, -3.236997, 5.727151,
3.817053, -3.236997, 5.727151,
-3.046231, 3.377165, -6.218359,
3.817053, 3.377165, -6.218359,
-3.046231, 3.377165, 5.727151,
3.817053, 3.377165, 5.727151,
3.817053, -3.236997, -6.218359,
3.817053, 3.377165, -6.218359,
3.817053, -3.236997, 5.727151,
3.817053, 3.377165, 5.727151,
3.817053, -3.236997, -6.218359,
3.817053, -3.236997, 5.727151,
3.817053, 3.377165, -6.218359,
3.817053, 3.377165, 5.727151
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
var radius = 8.160423;
var distance = 36.30664;
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
mvMatrix.translate( -0.3854111, -0.07008433, 0.245604 );
mvMatrix.scale( 1.285567, 1.333987, 0.7386213 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.30664);
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
pyrazol-5-yl_toluene<-read.table("pyrazol-5-yl_toluene.xyz")
```

```
## Error in read.table("pyrazol-5-yl_toluene.xyz"): no lines available in input
```

```r
x<-pyrazol-5-yl_toluene$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
```

```r
y<-pyrazol-5-yl_toluene$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
```

```r
z<-pyrazol-5-yl_toluene$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazol' not found
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
-2.94628, -1.174888, -2.458359, 0, 0, 1, 1, 1,
-2.888818, -0.02536717, -1.526574, 1, 0, 0, 1, 1,
-2.804331, -0.4976747, -2.131371, 1, 0, 0, 1, 1,
-2.619947, -2.205571, -1.60609, 1, 0, 0, 1, 1,
-2.581646, 0.2824593, 0.3909176, 1, 0, 0, 1, 1,
-2.556586, -0.7048025, -1.203465, 1, 0, 0, 1, 1,
-2.500061, -1.403623, -0.1918454, 0, 0, 0, 1, 1,
-2.361386, 1.111946, -0.9585814, 0, 0, 0, 1, 1,
-2.358171, 0.3758742, -0.8257208, 0, 0, 0, 1, 1,
-2.347925, 0.04498105, -2.500526, 0, 0, 0, 1, 1,
-2.332986, -1.428167, -2.508247, 0, 0, 0, 1, 1,
-2.313428, -1.489673, -2.542608, 0, 0, 0, 1, 1,
-2.23059, -0.333771, -0.3498985, 0, 0, 0, 1, 1,
-2.162438, -0.3404497, -2.095025, 1, 1, 1, 1, 1,
-2.090537, -0.7481939, -1.020612, 1, 1, 1, 1, 1,
-2.089173, 1.693344, -2.113932, 1, 1, 1, 1, 1,
-2.061146, -0.5608582, -2.166003, 1, 1, 1, 1, 1,
-2.026806, -0.06549103, -1.722529, 1, 1, 1, 1, 1,
-2.006048, -0.3328636, -2.549446, 1, 1, 1, 1, 1,
-1.984462, -0.3039935, -1.879177, 1, 1, 1, 1, 1,
-1.943933, 0.5910283, -2.655777, 1, 1, 1, 1, 1,
-1.925601, 0.3437439, -2.560228, 1, 1, 1, 1, 1,
-1.916788, -1.585697, -3.158267, 1, 1, 1, 1, 1,
-1.912294, -1.597229, -2.539097, 1, 1, 1, 1, 1,
-1.900571, -1.722257, 0.8744573, 1, 1, 1, 1, 1,
-1.884262, 0.0956903, -1.420265, 1, 1, 1, 1, 1,
-1.847977, -0.2800859, -0.6188728, 1, 1, 1, 1, 1,
-1.842434, 1.813702, 0.5742313, 1, 1, 1, 1, 1,
-1.834897, 1.300971, -2.183841, 0, 0, 1, 1, 1,
-1.798947, -1.40557, -2.233256, 1, 0, 0, 1, 1,
-1.79819, -1.18325, -1.250678, 1, 0, 0, 1, 1,
-1.76305, 1.171107, -2.244177, 1, 0, 0, 1, 1,
-1.761746, -0.3983884, -1.756234, 1, 0, 0, 1, 1,
-1.75592, 0.2500852, -1.427538, 1, 0, 0, 1, 1,
-1.74347, -0.06466312, -1.288013, 0, 0, 0, 1, 1,
-1.740689, -0.2616349, -1.672171, 0, 0, 0, 1, 1,
-1.736743, 0.1805734, 0.4542529, 0, 0, 0, 1, 1,
-1.729423, 0.3527265, -3.315789, 0, 0, 0, 1, 1,
-1.722129, -1.820388, -2.898067, 0, 0, 0, 1, 1,
-1.719982, 1.533826, 0.4147873, 0, 0, 0, 1, 1,
-1.70788, -0.4581901, -0.966915, 0, 0, 0, 1, 1,
-1.707557, -0.8997513, -0.1805928, 1, 1, 1, 1, 1,
-1.694679, 1.30743, -1.979401, 1, 1, 1, 1, 1,
-1.68965, 0.1814461, -0.5802694, 1, 1, 1, 1, 1,
-1.684549, -0.6072426, -1.708216, 1, 1, 1, 1, 1,
-1.681425, 0.8551094, -0.4911612, 1, 1, 1, 1, 1,
-1.675578, -1.498588, -2.72671, 1, 1, 1, 1, 1,
-1.663835, -0.2368886, -2.880335, 1, 1, 1, 1, 1,
-1.644792, -0.06539265, -1.631593, 1, 1, 1, 1, 1,
-1.637309, 0.04622722, -1.390043, 1, 1, 1, 1, 1,
-1.625183, -1.218139, -1.503548, 1, 1, 1, 1, 1,
-1.617517, -1.887139, -0.4201879, 1, 1, 1, 1, 1,
-1.614574, -0.7677662, -1.464117, 1, 1, 1, 1, 1,
-1.611033, -0.2861241, -0.796336, 1, 1, 1, 1, 1,
-1.60559, -1.565305, -1.392763, 1, 1, 1, 1, 1,
-1.584625, 0.7960393, -1.142231, 1, 1, 1, 1, 1,
-1.575721, -0.4889586, -1.232963, 0, 0, 1, 1, 1,
-1.573656, 0.1307035, -0.3798279, 1, 0, 0, 1, 1,
-1.568293, -0.3790364, -2.225508, 1, 0, 0, 1, 1,
-1.567731, 0.7171116, -1.962854, 1, 0, 0, 1, 1,
-1.561406, -0.4728882, -1.505171, 1, 0, 0, 1, 1,
-1.555407, 1.695938, -0.2782087, 1, 0, 0, 1, 1,
-1.552676, 0.05430394, -1.814913, 0, 0, 0, 1, 1,
-1.542217, 0.8418181, -1.050659, 0, 0, 0, 1, 1,
-1.541115, -0.1169795, -3.50624, 0, 0, 0, 1, 1,
-1.522296, -0.4498523, -1.086191, 0, 0, 0, 1, 1,
-1.5208, 0.5108035, -0.3315868, 0, 0, 0, 1, 1,
-1.516663, 0.1059125, -2.037457, 0, 0, 0, 1, 1,
-1.497342, 0.6144015, -1.38305, 0, 0, 0, 1, 1,
-1.496922, -0.942297, -0.4140838, 1, 1, 1, 1, 1,
-1.493424, -0.6451795, -0.2602388, 1, 1, 1, 1, 1,
-1.475389, -0.5036124, -1.534092, 1, 1, 1, 1, 1,
-1.475021, 0.07032952, -0.3122804, 1, 1, 1, 1, 1,
-1.46597, 0.5330033, -1.492163, 1, 1, 1, 1, 1,
-1.45451, -2.407455, -4.975129, 1, 1, 1, 1, 1,
-1.444293, 2.352581, -0.1180539, 1, 1, 1, 1, 1,
-1.441343, -1.671464, -2.315749, 1, 1, 1, 1, 1,
-1.434431, 0.5685847, -1.562114, 1, 1, 1, 1, 1,
-1.433869, 0.7212093, -0.8110204, 1, 1, 1, 1, 1,
-1.433421, 0.2288787, -0.9038224, 1, 1, 1, 1, 1,
-1.416128, 1.718543, -1.770049, 1, 1, 1, 1, 1,
-1.413743, 1.862194, -0.5374201, 1, 1, 1, 1, 1,
-1.40597, 0.9921001, -1.04705, 1, 1, 1, 1, 1,
-1.400734, -0.6405646, -2.15309, 1, 1, 1, 1, 1,
-1.394505, -0.7391786, -3.489696, 0, 0, 1, 1, 1,
-1.389909, -1.249396, -1.884637, 1, 0, 0, 1, 1,
-1.389043, -0.7000222, -1.232952, 1, 0, 0, 1, 1,
-1.384319, -0.9696005, -1.877342, 1, 0, 0, 1, 1,
-1.37722, 1.300809, 0.137045, 1, 0, 0, 1, 1,
-1.376706, 0.0742044, -0.1255084, 1, 0, 0, 1, 1,
-1.373226, 0.8417388, -1.922561, 0, 0, 0, 1, 1,
-1.370267, 0.4633389, -2.40756, 0, 0, 0, 1, 1,
-1.359331, -1.046048, 0.04368689, 0, 0, 0, 1, 1,
-1.357334, -1.238202, -3.313524, 0, 0, 0, 1, 1,
-1.3546, 0.1536562, -2.10091, 0, 0, 0, 1, 1,
-1.34696, 1.118094, -1.104142, 0, 0, 0, 1, 1,
-1.338949, 0.09626833, -2.107821, 0, 0, 0, 1, 1,
-1.332995, 0.08881088, -1.211096, 1, 1, 1, 1, 1,
-1.3319, 0.3244424, -1.111127, 1, 1, 1, 1, 1,
-1.330596, -1.064424, -1.013262, 1, 1, 1, 1, 1,
-1.328938, -0.2891452, -3.468362, 1, 1, 1, 1, 1,
-1.322913, -0.1720039, -0.2209057, 1, 1, 1, 1, 1,
-1.31306, -1.366362, -2.98735, 1, 1, 1, 1, 1,
-1.304528, 1.027824, -0.1874866, 1, 1, 1, 1, 1,
-1.299307, 0.5642163, 0.2315298, 1, 1, 1, 1, 1,
-1.297548, 1.448158, 0.822641, 1, 1, 1, 1, 1,
-1.291761, -1.661515, -3.503545, 1, 1, 1, 1, 1,
-1.290994, -2.252487, -3.537186, 1, 1, 1, 1, 1,
-1.290862, 3.184654, 1.02934, 1, 1, 1, 1, 1,
-1.289639, 1.151611, 0.9358013, 1, 1, 1, 1, 1,
-1.289461, 1.574215, 0.2760053, 1, 1, 1, 1, 1,
-1.284818, -1.055584, -1.644205, 1, 1, 1, 1, 1,
-1.28381, 0.9823105, 0.09015911, 0, 0, 1, 1, 1,
-1.283755, 0.7534776, -1.194687, 1, 0, 0, 1, 1,
-1.277757, 0.009418281, -3.860442, 1, 0, 0, 1, 1,
-1.275201, 0.5329617, -0.7427841, 1, 0, 0, 1, 1,
-1.274807, 0.433708, -0.5251135, 1, 0, 0, 1, 1,
-1.268791, -0.1948338, -2.54337, 1, 0, 0, 1, 1,
-1.261876, -1.237031, -2.995577, 0, 0, 0, 1, 1,
-1.261819, 1.155719, -1.194185, 0, 0, 0, 1, 1,
-1.256412, 1.63901, -1.343694, 0, 0, 0, 1, 1,
-1.252702, 1.005514, -0.1195424, 0, 0, 0, 1, 1,
-1.248299, 1.811928, -1.31662, 0, 0, 0, 1, 1,
-1.244621, -1.575534, -3.244261, 0, 0, 0, 1, 1,
-1.238836, 1.029595, -0.7860734, 0, 0, 0, 1, 1,
-1.233442, -0.3178488, -0.2398147, 1, 1, 1, 1, 1,
-1.219573, 0.7995974, -0.1184238, 1, 1, 1, 1, 1,
-1.206863, -0.3031084, -1.750934, 1, 1, 1, 1, 1,
-1.200147, -0.7937025, -2.347148, 1, 1, 1, 1, 1,
-1.1972, 1.560717, -0.8927035, 1, 1, 1, 1, 1,
-1.196797, -1.042516, -2.85404, 1, 1, 1, 1, 1,
-1.190347, -0.1526573, -2.001488, 1, 1, 1, 1, 1,
-1.187746, -0.333852, -3.654112, 1, 1, 1, 1, 1,
-1.174021, -0.8305079, -2.512918, 1, 1, 1, 1, 1,
-1.166013, -0.08871004, -0.395445, 1, 1, 1, 1, 1,
-1.164598, 1.250352, 0.4339091, 1, 1, 1, 1, 1,
-1.163459, -0.1990004, -0.1221431, 1, 1, 1, 1, 1,
-1.160688, -1.014061, -1.229941, 1, 1, 1, 1, 1,
-1.159798, -1.525594, -2.261927, 1, 1, 1, 1, 1,
-1.145161, -0.4039343, -2.470378, 1, 1, 1, 1, 1,
-1.144964, 0.8915125, -1.193892, 0, 0, 1, 1, 1,
-1.142177, -0.5760906, -2.622683, 1, 0, 0, 1, 1,
-1.124389, -0.630706, -0.2367472, 1, 0, 0, 1, 1,
-1.122138, -1.520931, -2.15422, 1, 0, 0, 1, 1,
-1.112458, -1.653116, -2.745488, 1, 0, 0, 1, 1,
-1.102779, -0.7557843, -2.440892, 1, 0, 0, 1, 1,
-1.100581, -0.01182684, -3.378699, 0, 0, 0, 1, 1,
-1.09701, -0.2916209, -1.37034, 0, 0, 0, 1, 1,
-1.096017, 0.2631122, -1.822447, 0, 0, 0, 1, 1,
-1.087254, 0.1508111, -0.8806885, 0, 0, 0, 1, 1,
-1.076617, 0.5342528, -0.8702063, 0, 0, 0, 1, 1,
-1.073908, 0.01484661, -1.257847, 0, 0, 0, 1, 1,
-1.069576, -0.3171919, -2.170212, 0, 0, 0, 1, 1,
-1.062738, -0.9320093, -0.6648927, 1, 1, 1, 1, 1,
-1.061921, -0.2013892, -0.6471497, 1, 1, 1, 1, 1,
-1.053257, 0.6180274, -1.877331, 1, 1, 1, 1, 1,
-1.052503, 0.8625349, 0.1528268, 1, 1, 1, 1, 1,
-1.048288, 0.6461287, 0.4504014, 1, 1, 1, 1, 1,
-1.042085, -1.06748, -2.58724, 1, 1, 1, 1, 1,
-1.022914, 0.4962809, -0.6438169, 1, 1, 1, 1, 1,
-1.016724, 1.434519, 0.09850574, 1, 1, 1, 1, 1,
-1.0166, 0.09022482, -0.9732246, 1, 1, 1, 1, 1,
-1.004792, 0.9296739, -1.70142, 1, 1, 1, 1, 1,
-1.004673, 1.455956, -1.783164, 1, 1, 1, 1, 1,
-0.994307, 0.9264761, -0.3954646, 1, 1, 1, 1, 1,
-0.9907727, 0.1244211, -1.566577, 1, 1, 1, 1, 1,
-0.9821211, -1.163386, -2.141957, 1, 1, 1, 1, 1,
-0.9773798, -0.9286011, -2.900104, 1, 1, 1, 1, 1,
-0.9763553, 0.6249225, -0.9364288, 0, 0, 1, 1, 1,
-0.9741883, 0.3514424, -0.317331, 1, 0, 0, 1, 1,
-0.9665209, -0.3280688, -0.8427701, 1, 0, 0, 1, 1,
-0.9622383, 1.210321, -0.7437983, 1, 0, 0, 1, 1,
-0.9566259, -0.3485231, -2.937445, 1, 0, 0, 1, 1,
-0.9495439, -0.4975193, -2.12096, 1, 0, 0, 1, 1,
-0.9494645, -0.1666973, -1.912494, 0, 0, 0, 1, 1,
-0.9407389, -0.4733503, -2.592407, 0, 0, 0, 1, 1,
-0.9182439, -0.8464078, -2.647439, 0, 0, 0, 1, 1,
-0.918215, 0.1266197, -3.462514, 0, 0, 0, 1, 1,
-0.9083704, 0.05767275, -3.101577, 0, 0, 0, 1, 1,
-0.9017268, 0.5901031, -0.6372812, 0, 0, 0, 1, 1,
-0.8969414, -1.258264, -3.654457, 0, 0, 0, 1, 1,
-0.8848584, -0.6579225, -2.253773, 1, 1, 1, 1, 1,
-0.8848124, 1.605736, -1.304572, 1, 1, 1, 1, 1,
-0.8826039, 0.545226, -0.8667798, 1, 1, 1, 1, 1,
-0.8738, 1.013951, -0.5611532, 1, 1, 1, 1, 1,
-0.8699609, -0.1529269, -2.254944, 1, 1, 1, 1, 1,
-0.8680897, -1.533685, -3.759433, 1, 1, 1, 1, 1,
-0.8663407, 0.6968447, -0.2138906, 1, 1, 1, 1, 1,
-0.8622792, -0.965806, -3.422542, 1, 1, 1, 1, 1,
-0.8612423, 2.25486, -1.21146, 1, 1, 1, 1, 1,
-0.8602741, 1.828508, 0.805892, 1, 1, 1, 1, 1,
-0.8483782, 0.1279008, 0.423898, 1, 1, 1, 1, 1,
-0.8478208, -2.422134, -3.870869, 1, 1, 1, 1, 1,
-0.8455656, 0.8362323, 0.3391737, 1, 1, 1, 1, 1,
-0.8395491, 0.07634147, -1.960335, 1, 1, 1, 1, 1,
-0.8362927, -0.1008188, -2.577319, 1, 1, 1, 1, 1,
-0.83097, 1.250502, 0.3347854, 0, 0, 1, 1, 1,
-0.8268586, -0.002607334, -1.902858, 1, 0, 0, 1, 1,
-0.8255191, 0.04395496, -1.427596, 1, 0, 0, 1, 1,
-0.8251374, -0.3418241, -1.360916, 1, 0, 0, 1, 1,
-0.8246869, -0.6779639, -1.897046, 1, 0, 0, 1, 1,
-0.8202384, -0.1582636, -3.495028, 1, 0, 0, 1, 1,
-0.8192253, 1.393158, -0.2914939, 0, 0, 0, 1, 1,
-0.8190319, 0.08252461, -2.923537, 0, 0, 0, 1, 1,
-0.8187071, -1.526023, -2.588189, 0, 0, 0, 1, 1,
-0.814794, 0.5089495, -1.937653, 0, 0, 0, 1, 1,
-0.8145894, -0.2084137, -1.680632, 0, 0, 0, 1, 1,
-0.8094458, -1.012524, -3.542639, 0, 0, 0, 1, 1,
-0.8073214, 0.7880436, -1.684698, 0, 0, 0, 1, 1,
-0.8065186, 1.675131, 1.018199, 1, 1, 1, 1, 1,
-0.8018959, -0.6972532, -1.205723, 1, 1, 1, 1, 1,
-0.7990867, 0.2294338, -1.486447, 1, 1, 1, 1, 1,
-0.7983521, -0.2968066, -1.611698, 1, 1, 1, 1, 1,
-0.7959771, -0.6028693, -2.778384, 1, 1, 1, 1, 1,
-0.7926568, -0.2473164, -0.5666595, 1, 1, 1, 1, 1,
-0.7876936, 0.8319919, 0.8742313, 1, 1, 1, 1, 1,
-0.7852192, 1.010012, -1.233135, 1, 1, 1, 1, 1,
-0.7839599, -0.7420235, -2.647822, 1, 1, 1, 1, 1,
-0.7822623, 0.004159946, -0.4391924, 1, 1, 1, 1, 1,
-0.7801081, 0.9520241, 1.402589, 1, 1, 1, 1, 1,
-0.7777619, 0.1146736, -1.284625, 1, 1, 1, 1, 1,
-0.7649922, 1.340115, -0.9142313, 1, 1, 1, 1, 1,
-0.7615782, -1.548782, -2.389267, 1, 1, 1, 1, 1,
-0.7614792, -0.3518115, -1.89944, 1, 1, 1, 1, 1,
-0.7604803, -0.5505112, -2.278763, 0, 0, 1, 1, 1,
-0.7595515, -0.4120759, -1.304041, 1, 0, 0, 1, 1,
-0.7586389, -0.005713268, -1.707636, 1, 0, 0, 1, 1,
-0.758137, 1.192781, 0.1426096, 1, 0, 0, 1, 1,
-0.7578712, 0.2410594, -1.380538, 1, 0, 0, 1, 1,
-0.7396178, 0.9125259, -0.7541074, 1, 0, 0, 1, 1,
-0.7378277, 1.802852, 0.3446484, 0, 0, 0, 1, 1,
-0.7370722, 0.3229017, -1.499523, 0, 0, 0, 1, 1,
-0.7266063, -0.4036303, -2.545761, 0, 0, 0, 1, 1,
-0.722075, -0.2648426, -3.511994, 0, 0, 0, 1, 1,
-0.7198692, -0.3008996, -2.10713, 0, 0, 0, 1, 1,
-0.7151508, -0.3598807, -1.909557, 0, 0, 0, 1, 1,
-0.7129153, -0.1150748, -0.9369854, 0, 0, 0, 1, 1,
-0.7101768, -0.5603323, -2.001149, 1, 1, 1, 1, 1,
-0.7089322, 0.6740157, -2.573582, 1, 1, 1, 1, 1,
-0.7075735, -0.4157594, -3.070928, 1, 1, 1, 1, 1,
-0.7055145, -1.158987, -1.750584, 1, 1, 1, 1, 1,
-0.7022496, 0.8114077, -2.066908, 1, 1, 1, 1, 1,
-0.7010933, 0.1448224, -0.5698567, 1, 1, 1, 1, 1,
-0.7000866, -0.9003389, -4.244853, 1, 1, 1, 1, 1,
-0.6982905, 0.3094819, 0.4427061, 1, 1, 1, 1, 1,
-0.6866027, 1.122737, -0.344235, 1, 1, 1, 1, 1,
-0.6856112, -0.2660101, -2.772905, 1, 1, 1, 1, 1,
-0.6842845, 1.802079, -0.3153293, 1, 1, 1, 1, 1,
-0.6804078, -3.140674, -3.592569, 1, 1, 1, 1, 1,
-0.6765853, -0.08430775, -0.5507889, 1, 1, 1, 1, 1,
-0.6728817, 0.2328609, -1.470421, 1, 1, 1, 1, 1,
-0.6642007, 0.6086077, -0.2749217, 1, 1, 1, 1, 1,
-0.6582378, 0.6660656, -0.2882296, 0, 0, 1, 1, 1,
-0.6562274, -0.5789068, -3.050323, 1, 0, 0, 1, 1,
-0.6558041, 1.07478, -1.561824, 1, 0, 0, 1, 1,
-0.6554443, 0.4476588, -1.580051, 1, 0, 0, 1, 1,
-0.6516303, 0.5369807, -2.878095, 1, 0, 0, 1, 1,
-0.6513013, 0.8158233, -1.717503, 1, 0, 0, 1, 1,
-0.648721, -0.4250931, -1.815818, 0, 0, 0, 1, 1,
-0.6466868, -1.088723, -1.960244, 0, 0, 0, 1, 1,
-0.6405031, -1.229668, -3.348341, 0, 0, 0, 1, 1,
-0.6379288, -0.2500936, -2.523329, 0, 0, 0, 1, 1,
-0.635393, -0.6331003, -2.618412, 0, 0, 0, 1, 1,
-0.6349945, 0.2476987, -1.317184, 0, 0, 0, 1, 1,
-0.6340374, 1.238421, 0.8188068, 0, 0, 0, 1, 1,
-0.6272994, -0.9040788, 0.3276593, 1, 1, 1, 1, 1,
-0.6265683, -0.3716472, -1.139015, 1, 1, 1, 1, 1,
-0.6216199, 0.1920168, -0.1865492, 1, 1, 1, 1, 1,
-0.6199172, 0.429246, -0.6596286, 1, 1, 1, 1, 1,
-0.6197876, 1.221152, -1.787965, 1, 1, 1, 1, 1,
-0.6171541, 2.828741, 0.1349852, 1, 1, 1, 1, 1,
-0.6164865, -1.212896, -2.254915, 1, 1, 1, 1, 1,
-0.6021304, -0.3811548, -2.506082, 1, 1, 1, 1, 1,
-0.6005315, -1.623719, -1.053214, 1, 1, 1, 1, 1,
-0.5940564, -1.115174, -2.634298, 1, 1, 1, 1, 1,
-0.5927243, 0.5603392, -0.6379811, 1, 1, 1, 1, 1,
-0.5885581, 1.430612, -0.3885928, 1, 1, 1, 1, 1,
-0.5872028, -1.381308, -4.436804, 1, 1, 1, 1, 1,
-0.5857369, 1.045406, -2.469803, 1, 1, 1, 1, 1,
-0.5841112, 0.3380844, -0.1703171, 1, 1, 1, 1, 1,
-0.5832915, 1.019852, 1.710528, 0, 0, 1, 1, 1,
-0.5813195, 0.9910691, -1.799221, 1, 0, 0, 1, 1,
-0.5792648, -1.86426, -1.693565, 1, 0, 0, 1, 1,
-0.5720444, 0.6655859, -1.067232, 1, 0, 0, 1, 1,
-0.5705674, 0.437087, -0.4051752, 1, 0, 0, 1, 1,
-0.5693545, -0.4158188, -2.123216, 1, 0, 0, 1, 1,
-0.5677761, 0.8419918, -1.328065, 0, 0, 0, 1, 1,
-0.566488, 0.6208947, -0.03487237, 0, 0, 0, 1, 1,
-0.5643852, -0.2936336, -1.232587, 0, 0, 0, 1, 1,
-0.5616902, 1.371296, -0.7928569, 0, 0, 0, 1, 1,
-0.5522353, -1.446603, -2.895849, 0, 0, 0, 1, 1,
-0.5501682, -1.903481, -3.326775, 0, 0, 0, 1, 1,
-0.543646, 1.393118, -0.2365587, 0, 0, 0, 1, 1,
-0.5418767, -1.308738, -3.521842, 1, 1, 1, 1, 1,
-0.5408917, -1.442404, -3.104334, 1, 1, 1, 1, 1,
-0.5399193, 0.1189285, -2.342427, 1, 1, 1, 1, 1,
-0.5390897, -0.7222167, -3.691139, 1, 1, 1, 1, 1,
-0.5368068, -0.6570643, -2.423057, 1, 1, 1, 1, 1,
-0.5366374, -0.2546661, -2.993086, 1, 1, 1, 1, 1,
-0.5334973, 0.03792437, -1.391438, 1, 1, 1, 1, 1,
-0.5275691, -1.532613, -0.9058643, 1, 1, 1, 1, 1,
-0.5272108, 0.2938833, -1.014354, 1, 1, 1, 1, 1,
-0.5232867, 1.310849, 0.3720507, 1, 1, 1, 1, 1,
-0.5218728, 0.117087, -0.8587959, 1, 1, 1, 1, 1,
-0.5211267, -0.9166446, -2.011883, 1, 1, 1, 1, 1,
-0.5209613, 0.6800235, -0.8829492, 1, 1, 1, 1, 1,
-0.5190874, -2.350088, -3.124346, 1, 1, 1, 1, 1,
-0.5169135, 0.3859177, -1.797827, 1, 1, 1, 1, 1,
-0.5145648, 0.6009151, -1.789456, 0, 0, 1, 1, 1,
-0.5101762, -1.36242, -2.473871, 1, 0, 0, 1, 1,
-0.5085568, 0.2529487, -0.3236171, 1, 0, 0, 1, 1,
-0.5064016, 0.1549873, -2.343375, 1, 0, 0, 1, 1,
-0.5051466, -1.687442, -1.048936, 1, 0, 0, 1, 1,
-0.5034058, 0.6618361, -0.01417834, 1, 0, 0, 1, 1,
-0.5024139, -0.1651679, -1.055243, 0, 0, 0, 1, 1,
-0.4975013, 0.6423338, -0.3955225, 0, 0, 0, 1, 1,
-0.4938694, 0.01265978, -2.67293, 0, 0, 0, 1, 1,
-0.491792, -1.706137, -4.256108, 0, 0, 0, 1, 1,
-0.4900979, -0.9200538, -2.634984, 0, 0, 0, 1, 1,
-0.4844958, -0.3113427, -2.262007, 0, 0, 0, 1, 1,
-0.4842137, -0.1781714, -2.120274, 0, 0, 0, 1, 1,
-0.4787335, -0.6364979, -2.843577, 1, 1, 1, 1, 1,
-0.4785732, 1.928645, 0.3482983, 1, 1, 1, 1, 1,
-0.478453, 1.863564, -1.205358, 1, 1, 1, 1, 1,
-0.4781014, 0.907039, 0.4317955, 1, 1, 1, 1, 1,
-0.4617501, -0.003162962, -2.737335, 1, 1, 1, 1, 1,
-0.4597408, 1.548732, -0.9954, 1, 1, 1, 1, 1,
-0.4567921, 0.6003257, -0.08156373, 1, 1, 1, 1, 1,
-0.4549425, 0.2331044, -0.907493, 1, 1, 1, 1, 1,
-0.4544325, -0.2959818, -2.530189, 1, 1, 1, 1, 1,
-0.4492494, -0.06150352, -1.955334, 1, 1, 1, 1, 1,
-0.4480999, -0.2344448, -1.307007, 1, 1, 1, 1, 1,
-0.44581, -0.3092794, -1.846772, 1, 1, 1, 1, 1,
-0.4448304, -0.966359, -2.840526, 1, 1, 1, 1, 1,
-0.4430212, -0.08167728, -0.1757024, 1, 1, 1, 1, 1,
-0.4425139, -0.646271, -3.872148, 1, 1, 1, 1, 1,
-0.4416263, -0.5563784, -0.6035736, 0, 0, 1, 1, 1,
-0.4381192, -0.1322918, -2.75598, 1, 0, 0, 1, 1,
-0.4344901, -1.228494, -2.811711, 1, 0, 0, 1, 1,
-0.4335235, -0.2850151, -1.342065, 1, 0, 0, 1, 1,
-0.4289975, 1.423331, -1.440524, 1, 0, 0, 1, 1,
-0.426809, 0.3393867, -2.654403, 1, 0, 0, 1, 1,
-0.4259478, 1.957153, -0.3029803, 0, 0, 0, 1, 1,
-0.4221925, 1.23686, -0.5633144, 0, 0, 0, 1, 1,
-0.4182681, -0.303542, -0.9394775, 0, 0, 0, 1, 1,
-0.4152432, 0.5266445, -1.07501, 0, 0, 0, 1, 1,
-0.4148141, 0.9181349, -0.8457798, 0, 0, 0, 1, 1,
-0.4141709, 0.7821996, -1.07824, 0, 0, 0, 1, 1,
-0.4112885, -0.5645843, -3.028112, 0, 0, 0, 1, 1,
-0.4096566, 1.846168, 0.2822748, 1, 1, 1, 1, 1,
-0.4076858, 1.352883, -1.468067, 1, 1, 1, 1, 1,
-0.402002, -0.6642439, -4.648694, 1, 1, 1, 1, 1,
-0.4017516, 0.5135812, -0.2391262, 1, 1, 1, 1, 1,
-0.4010249, -1.328961, -3.438394, 1, 1, 1, 1, 1,
-0.4003126, 0.0947163, 0.9777912, 1, 1, 1, 1, 1,
-0.3983401, -0.9238681, -2.269097, 1, 1, 1, 1, 1,
-0.3927954, -1.318394, -3.149598, 1, 1, 1, 1, 1,
-0.3906916, 1.365805, -1.700944, 1, 1, 1, 1, 1,
-0.3894829, 1.315447, -0.1447111, 1, 1, 1, 1, 1,
-0.3875886, -0.6192257, -2.534817, 1, 1, 1, 1, 1,
-0.3815548, -0.08509436, -1.994956, 1, 1, 1, 1, 1,
-0.3800762, -0.1104646, -2.770561, 1, 1, 1, 1, 1,
-0.3797129, -0.633559, -1.93903, 1, 1, 1, 1, 1,
-0.3749771, -0.4788749, -3.1103, 1, 1, 1, 1, 1,
-0.3726972, -1.534875, -4.133883, 0, 0, 1, 1, 1,
-0.3712728, -0.6140304, -3.293421, 1, 0, 0, 1, 1,
-0.3599771, -0.3740836, -2.061274, 1, 0, 0, 1, 1,
-0.3548442, -1.75186, -2.017786, 1, 0, 0, 1, 1,
-0.3537006, 2.360117, -1.089658, 1, 0, 0, 1, 1,
-0.3486945, 0.4583933, -0.8638897, 1, 0, 0, 1, 1,
-0.3377579, 1.280794, -0.7747764, 0, 0, 0, 1, 1,
-0.3345167, -0.6966462, -1.345951, 0, 0, 0, 1, 1,
-0.3276985, -0.5013864, -3.773408, 0, 0, 0, 1, 1,
-0.3253179, -2.360399, -2.24679, 0, 0, 0, 1, 1,
-0.3249725, 0.01368868, -2.450586, 0, 0, 0, 1, 1,
-0.320159, -1.246115, -4.567787, 0, 0, 0, 1, 1,
-0.3179608, -0.4891714, -2.31396, 0, 0, 0, 1, 1,
-0.3134528, 1.288113, 0.2045425, 1, 1, 1, 1, 1,
-0.3114761, 0.9474486, -2.208609, 1, 1, 1, 1, 1,
-0.3082364, 1.050303, -0.155734, 1, 1, 1, 1, 1,
-0.2973381, 0.6599777, 0.9392734, 1, 1, 1, 1, 1,
-0.29441, -1.358328, -3.559123, 1, 1, 1, 1, 1,
-0.2906757, 0.0131164, -1.755354, 1, 1, 1, 1, 1,
-0.2872293, 1.561417, 1.629613, 1, 1, 1, 1, 1,
-0.2792464, 0.009762317, -2.626707, 1, 1, 1, 1, 1,
-0.2775387, -1.833557, -3.792655, 1, 1, 1, 1, 1,
-0.2770833, 0.2689394, 0.1382814, 1, 1, 1, 1, 1,
-0.2747059, -1.222214, -2.543686, 1, 1, 1, 1, 1,
-0.2736378, -0.4858088, -3.859305, 1, 1, 1, 1, 1,
-0.2716079, 0.5299471, -0.590133, 1, 1, 1, 1, 1,
-0.2611336, -0.1763136, -2.552418, 1, 1, 1, 1, 1,
-0.2602387, -1.422648, -5.582564, 1, 1, 1, 1, 1,
-0.2578564, -1.631703, -3.586651, 0, 0, 1, 1, 1,
-0.2538775, -1.02054, -3.791846, 1, 0, 0, 1, 1,
-0.2518146, 0.924628, 0.8026906, 1, 0, 0, 1, 1,
-0.2514358, -0.1325333, -1.470326, 1, 0, 0, 1, 1,
-0.2506377, -0.2664985, -5.244751, 1, 0, 0, 1, 1,
-0.2482147, 1.099488, -1.396778, 1, 0, 0, 1, 1,
-0.247156, 0.4888436, 0.0920864, 0, 0, 0, 1, 1,
-0.2460907, 1.464917, 0.01795705, 0, 0, 0, 1, 1,
-0.2441585, 0.4887892, 0.5479282, 0, 0, 0, 1, 1,
-0.2403051, 0.914534, -0.2029817, 0, 0, 0, 1, 1,
-0.2387556, 1.50966, 1.725548, 0, 0, 0, 1, 1,
-0.2383079, -1.132971, -4.190987, 0, 0, 0, 1, 1,
-0.2315098, 0.390256, -1.294141, 0, 0, 0, 1, 1,
-0.2270071, -0.9107081, -2.81806, 1, 1, 1, 1, 1,
-0.2262851, -0.1387657, -3.656705, 1, 1, 1, 1, 1,
-0.2261748, 0.5530739, -0.5613168, 1, 1, 1, 1, 1,
-0.2219379, -0.1049289, -2.522311, 1, 1, 1, 1, 1,
-0.2208793, 2.196113, -0.9064369, 1, 1, 1, 1, 1,
-0.2204685, -2.032479, -2.624068, 1, 1, 1, 1, 1,
-0.2201994, 0.4861564, -0.08479059, 1, 1, 1, 1, 1,
-0.2165333, 0.7051208, 1.81561, 1, 1, 1, 1, 1,
-0.2161937, 0.135069, -1.332866, 1, 1, 1, 1, 1,
-0.214169, -0.7002468, -1.864322, 1, 1, 1, 1, 1,
-0.2131729, 1.593454, 0.8505728, 1, 1, 1, 1, 1,
-0.2081823, 1.553003, -0.6315439, 1, 1, 1, 1, 1,
-0.2076865, 0.5595238, -0.1496032, 1, 1, 1, 1, 1,
-0.2003242, 1.515783, 2.058158, 1, 1, 1, 1, 1,
-0.1985091, 1.058222, 0.5375757, 1, 1, 1, 1, 1,
-0.1965236, -0.8761708, -0.4906913, 0, 0, 1, 1, 1,
-0.1943406, -0.2115427, -4.189569, 1, 0, 0, 1, 1,
-0.1930885, 0.08883246, -0.5283623, 1, 0, 0, 1, 1,
-0.1922195, 1.008165, 1.102641, 1, 0, 0, 1, 1,
-0.1902465, -0.6975324, -1.950927, 1, 0, 0, 1, 1,
-0.190079, -0.1522362, -2.760462, 1, 0, 0, 1, 1,
-0.1899505, 0.9701978, 2.237719, 0, 0, 0, 1, 1,
-0.1899063, -0.5155717, -4.27478, 0, 0, 0, 1, 1,
-0.1891173, -1.07166, -4.030602, 0, 0, 0, 1, 1,
-0.1890647, 0.2035189, -2.876017, 0, 0, 0, 1, 1,
-0.1817305, -0.4461715, -3.140828, 0, 0, 0, 1, 1,
-0.1814327, -0.03575202, -0.5288619, 0, 0, 0, 1, 1,
-0.1720549, -0.8862633, -4.771111, 0, 0, 0, 1, 1,
-0.1703621, -0.9819251, -3.438294, 1, 1, 1, 1, 1,
-0.168344, 0.4954297, -0.5694772, 1, 1, 1, 1, 1,
-0.1609763, -1.034707, -2.871068, 1, 1, 1, 1, 1,
-0.1563877, -0.1818995, -4.218416, 1, 1, 1, 1, 1,
-0.1545495, 0.3272635, 0.7780218, 1, 1, 1, 1, 1,
-0.1540953, 1.285599, 0.03140562, 1, 1, 1, 1, 1,
-0.1514971, 0.6649118, -0.4559679, 1, 1, 1, 1, 1,
-0.151273, -1.289977, -1.561731, 1, 1, 1, 1, 1,
-0.1501273, 1.829593, -1.953565, 1, 1, 1, 1, 1,
-0.1449142, 1.237942, -1.373869, 1, 1, 1, 1, 1,
-0.1424946, -1.508268, -4.014682, 1, 1, 1, 1, 1,
-0.141176, -1.281703, -2.341613, 1, 1, 1, 1, 1,
-0.1410307, 0.7778876, -2.382773, 1, 1, 1, 1, 1,
-0.1392042, -0.3543734, -3.31742, 1, 1, 1, 1, 1,
-0.1385869, -0.2873586, -3.770989, 1, 1, 1, 1, 1,
-0.1384015, -1.207887, -3.274058, 0, 0, 1, 1, 1,
-0.1383423, 0.5214698, 0.4774517, 1, 0, 0, 1, 1,
-0.1367922, 0.5698497, -0.8274274, 1, 0, 0, 1, 1,
-0.1362479, -0.4183348, -2.019794, 1, 0, 0, 1, 1,
-0.1357929, -0.7587483, -2.621012, 1, 0, 0, 1, 1,
-0.1355118, -0.6800863, -3.078848, 1, 0, 0, 1, 1,
-0.1353798, -0.7476958, -2.611435, 0, 0, 0, 1, 1,
-0.1258462, 1.406668, -0.1106249, 0, 0, 0, 1, 1,
-0.1233832, -0.4926984, -3.201178, 0, 0, 0, 1, 1,
-0.1194753, 0.3702606, 0.5158103, 0, 0, 0, 1, 1,
-0.1130281, 0.9919497, -1.160933, 0, 0, 0, 1, 1,
-0.1114512, -0.09599725, -2.165861, 0, 0, 0, 1, 1,
-0.1074054, 0.6082729, -0.5711042, 0, 0, 0, 1, 1,
-0.1027128, -2.157086, -2.708127, 1, 1, 1, 1, 1,
-0.09899215, -0.1453159, -3.831488, 1, 1, 1, 1, 1,
-0.09085488, -0.5067357, -4.181917, 1, 1, 1, 1, 1,
-0.08897084, 0.6094494, 0.4861552, 1, 1, 1, 1, 1,
-0.08825845, -1.234366, -2.276313, 1, 1, 1, 1, 1,
-0.08423222, -0.5415578, -1.766652, 1, 1, 1, 1, 1,
-0.07795278, 0.03246581, -1.761922, 1, 1, 1, 1, 1,
-0.07766604, 0.4615586, -0.6222205, 1, 1, 1, 1, 1,
-0.07709267, -0.6770437, -1.941277, 1, 1, 1, 1, 1,
-0.07326045, 3.280843, -2.551848, 1, 1, 1, 1, 1,
-0.07298269, 1.161899, 0.546041, 1, 1, 1, 1, 1,
-0.07024683, -0.969352, -2.860573, 1, 1, 1, 1, 1,
-0.0633469, -0.008552391, -0.446786, 1, 1, 1, 1, 1,
-0.05898229, -0.3475311, -2.098947, 1, 1, 1, 1, 1,
-0.05778768, -0.4314636, -4.339571, 1, 1, 1, 1, 1,
-0.05699273, 0.6505504, -0.7177817, 0, 0, 1, 1, 1,
-0.05191303, 0.6672867, 0.7853007, 1, 0, 0, 1, 1,
-0.05162122, 2.1534, 0.5108646, 1, 0, 0, 1, 1,
-0.05085586, 0.8799127, 0.7163004, 1, 0, 0, 1, 1,
-0.04905989, 1.252527, -1.334037, 1, 0, 0, 1, 1,
-0.04819069, -0.6635513, -3.319848, 1, 0, 0, 1, 1,
-0.040174, 0.8911181, 1.761034, 0, 0, 0, 1, 1,
-0.03804041, 0.2794028, 0.6354493, 0, 0, 0, 1, 1,
-0.03700985, 1.273714, 1.158439, 0, 0, 0, 1, 1,
-0.03631967, -0.07319514, -3.182285, 0, 0, 0, 1, 1,
-0.03251781, 2.08962, -0.08795239, 0, 0, 0, 1, 1,
-0.03212184, -0.4417979, -6.044396, 0, 0, 0, 1, 1,
-0.02607412, 1.364581, 0.09648872, 0, 0, 0, 1, 1,
-0.02553473, -0.3528568, -2.354602, 1, 1, 1, 1, 1,
-0.02368016, 0.9951147, -0.256385, 1, 1, 1, 1, 1,
-0.02293382, 0.06517839, -0.1699999, 1, 1, 1, 1, 1,
-0.0218751, 1.262392, -1.142879, 1, 1, 1, 1, 1,
-0.02092062, 0.7393007, 1.763413, 1, 1, 1, 1, 1,
-0.020177, -1.862591, -4.394193, 1, 1, 1, 1, 1,
-0.009462754, -2.113214, -2.418758, 1, 1, 1, 1, 1,
-0.004723649, -1.360075, -3.005936, 1, 1, 1, 1, 1,
-0.004004288, -1.256752, -4.322572, 1, 1, 1, 1, 1,
-0.0009308579, 0.2202116, -0.2461093, 1, 1, 1, 1, 1,
0.003570708, -0.1463918, 4.597989, 1, 1, 1, 1, 1,
0.003793302, 0.4011427, 0.3986123, 1, 1, 1, 1, 1,
0.004170026, -0.3625616, 3.828681, 1, 1, 1, 1, 1,
0.004288527, 2.594977, 0.4620163, 1, 1, 1, 1, 1,
0.005001826, 2.384611, 0.06482702, 1, 1, 1, 1, 1,
0.0116756, -0.6648215, 3.661353, 0, 0, 1, 1, 1,
0.01302608, 0.5994058, 1.657468, 1, 0, 0, 1, 1,
0.01424298, -1.276385, 2.322422, 1, 0, 0, 1, 1,
0.01500974, -0.5842581, 3.687807, 1, 0, 0, 1, 1,
0.01644985, 0.3281019, 0.2625775, 1, 0, 0, 1, 1,
0.01722911, -1.718199, 2.311512, 1, 0, 0, 1, 1,
0.01760851, 2.006068, 0.137475, 0, 0, 0, 1, 1,
0.01903987, 0.856272, -0.6008064, 0, 0, 0, 1, 1,
0.01948089, 1.297334, 0.9096859, 0, 0, 0, 1, 1,
0.02290848, -0.9588338, 1.949953, 0, 0, 0, 1, 1,
0.02598449, 0.3692425, -0.9429764, 0, 0, 0, 1, 1,
0.02608868, 0.9271473, 1.632802, 0, 0, 0, 1, 1,
0.0277801, 0.637579, 0.2981246, 0, 0, 0, 1, 1,
0.03060286, 0.1402926, 0.5799378, 1, 1, 1, 1, 1,
0.03206893, 0.5981685, -0.004629706, 1, 1, 1, 1, 1,
0.03260875, 0.3159411, -0.4703421, 1, 1, 1, 1, 1,
0.03320071, -0.01933442, 0.5478354, 1, 1, 1, 1, 1,
0.03947934, 1.925492, 0.4917508, 1, 1, 1, 1, 1,
0.04317093, 0.745386, -1.888653, 1, 1, 1, 1, 1,
0.04904849, -0.5202305, 1.702218, 1, 1, 1, 1, 1,
0.05460308, 0.6821386, 1.276654, 1, 1, 1, 1, 1,
0.06344242, 0.7298156, 0.7540179, 1, 1, 1, 1, 1,
0.06358626, 1.281117, 0.8169881, 1, 1, 1, 1, 1,
0.06375749, -0.1901976, 2.141656, 1, 1, 1, 1, 1,
0.06611999, -0.3781408, 2.675134, 1, 1, 1, 1, 1,
0.06626582, 0.10667, 0.6735908, 1, 1, 1, 1, 1,
0.06774369, -0.3671503, 1.51203, 1, 1, 1, 1, 1,
0.06823026, -0.4564648, 2.255434, 1, 1, 1, 1, 1,
0.06929051, -0.3434764, 4.212694, 0, 0, 1, 1, 1,
0.06996489, -0.9413614, 2.758224, 1, 0, 0, 1, 1,
0.07190885, -0.1472696, 3.922028, 1, 0, 0, 1, 1,
0.0723849, -1.338191, 1.068327, 1, 0, 0, 1, 1,
0.07871887, 2.248259, -0.202134, 1, 0, 0, 1, 1,
0.07912444, -1.632018, 2.721387, 1, 0, 0, 1, 1,
0.08183177, 1.297887, 0.04150762, 0, 0, 0, 1, 1,
0.08552723, 1.703722, 1.509248, 0, 0, 0, 1, 1,
0.08837447, -0.8143745, 3.742606, 0, 0, 0, 1, 1,
0.08845093, -0.3481926, 3.034698, 0, 0, 0, 1, 1,
0.0925285, -0.05672774, 3.011857, 0, 0, 0, 1, 1,
0.09274234, -0.3810602, 3.301706, 0, 0, 0, 1, 1,
0.09311237, 0.4935864, 1.055491, 0, 0, 0, 1, 1,
0.09503838, 0.137983, 1.604545, 1, 1, 1, 1, 1,
0.09708501, 0.7881587, 0.8185347, 1, 1, 1, 1, 1,
0.09791932, -0.2557855, 2.142273, 1, 1, 1, 1, 1,
0.0987427, 0.2430364, 0.9492901, 1, 1, 1, 1, 1,
0.0992824, -0.6894042, 3.097657, 1, 1, 1, 1, 1,
0.09964103, 0.435064, 0.5013894, 1, 1, 1, 1, 1,
0.1004244, -0.1059847, 1.594934, 1, 1, 1, 1, 1,
0.1009754, 0.1767705, 0.8575076, 1, 1, 1, 1, 1,
0.1013415, -0.5562646, 3.180687, 1, 1, 1, 1, 1,
0.1032541, -1.873348, 3.818652, 1, 1, 1, 1, 1,
0.1038821, 1.519437, 0.5621459, 1, 1, 1, 1, 1,
0.1079767, 1.93285, -0.9744183, 1, 1, 1, 1, 1,
0.115492, -0.2420716, 2.023711, 1, 1, 1, 1, 1,
0.1164029, 0.6539899, -0.7279454, 1, 1, 1, 1, 1,
0.1171862, -0.07134871, 0.8127765, 1, 1, 1, 1, 1,
0.1183776, 0.9520831, 2.675446, 0, 0, 1, 1, 1,
0.1187805, 0.5922383, -1.214166, 1, 0, 0, 1, 1,
0.1225366, 1.280949, 0.5104574, 1, 0, 0, 1, 1,
0.1253376, 1.397495, 0.5876621, 1, 0, 0, 1, 1,
0.1359018, -0.6389123, 3.366373, 1, 0, 0, 1, 1,
0.1446416, -0.6476892, 4.03347, 1, 0, 0, 1, 1,
0.1456389, -0.5572316, 3.716895, 0, 0, 0, 1, 1,
0.1466314, 0.1244706, -0.5115596, 0, 0, 0, 1, 1,
0.1470236, 0.270099, -0.9873802, 0, 0, 0, 1, 1,
0.1502869, -0.3504984, 3.773768, 0, 0, 0, 1, 1,
0.1530882, -1.53964, 2.311137, 0, 0, 0, 1, 1,
0.1582544, -1.256465, 2.585183, 0, 0, 0, 1, 1,
0.1585419, -1.784262, 2.732464, 0, 0, 0, 1, 1,
0.1587585, 1.204971, -0.4845072, 1, 1, 1, 1, 1,
0.1592575, 1.099547, 0.9106417, 1, 1, 1, 1, 1,
0.1603514, -0.3716397, 3.522276, 1, 1, 1, 1, 1,
0.1607123, -1.247615, 2.333997, 1, 1, 1, 1, 1,
0.1638316, 0.4993596, 1.399897, 1, 1, 1, 1, 1,
0.1652698, 1.170013, 0.1440734, 1, 1, 1, 1, 1,
0.1671694, -0.07668842, 1.791461, 1, 1, 1, 1, 1,
0.1672269, -0.9001694, 3.597117, 1, 1, 1, 1, 1,
0.1685116, -0.8153594, 0.9920715, 1, 1, 1, 1, 1,
0.169822, -1.398386, 2.2193, 1, 1, 1, 1, 1,
0.1755098, 0.3281538, 0.9239091, 1, 1, 1, 1, 1,
0.17911, 0.4366124, -0.7925113, 1, 1, 1, 1, 1,
0.1794542, 0.07022803, 2.888537, 1, 1, 1, 1, 1,
0.1795788, -0.4308896, 2.462816, 1, 1, 1, 1, 1,
0.1846631, -0.7069021, 1.914762, 1, 1, 1, 1, 1,
0.186525, -0.1947411, 0.972267, 0, 0, 1, 1, 1,
0.187702, -1.119268, 2.294138, 1, 0, 0, 1, 1,
0.189375, -0.6771845, 2.012757, 1, 0, 0, 1, 1,
0.1896644, -0.09860986, 4.804979, 1, 0, 0, 1, 1,
0.192763, -0.115558, 2.668965, 1, 0, 0, 1, 1,
0.1931087, -0.6335003, 1.486948, 1, 0, 0, 1, 1,
0.195247, -1.947801, 3.782144, 0, 0, 0, 1, 1,
0.1965434, 0.8903416, -1.701895, 0, 0, 0, 1, 1,
0.2002693, -0.5671625, 3.155996, 0, 0, 0, 1, 1,
0.2040135, -0.145697, 2.42452, 0, 0, 0, 1, 1,
0.2053409, 1.082397, -1.123122, 0, 0, 0, 1, 1,
0.2129047, 0.8918853, 0.8516557, 0, 0, 0, 1, 1,
0.2149908, -0.08846709, 2.46779, 0, 0, 0, 1, 1,
0.216937, 0.3881572, 0.1565715, 1, 1, 1, 1, 1,
0.2190402, -0.5173211, 2.724187, 1, 1, 1, 1, 1,
0.222372, -0.6742086, 3.381317, 1, 1, 1, 1, 1,
0.2351117, 0.5089422, -0.02464607, 1, 1, 1, 1, 1,
0.2361035, 0.1614664, 0.7731358, 1, 1, 1, 1, 1,
0.2399076, -0.642927, 1.664045, 1, 1, 1, 1, 1,
0.2408174, 1.54101, -0.5140083, 1, 1, 1, 1, 1,
0.2416977, 1.071892, -0.09345607, 1, 1, 1, 1, 1,
0.2443539, -0.6002, 2.398115, 1, 1, 1, 1, 1,
0.244823, 0.2165482, 3.51432, 1, 1, 1, 1, 1,
0.2476082, 0.1691196, 0.0208115, 1, 1, 1, 1, 1,
0.2504133, -0.2010609, 1.331588, 1, 1, 1, 1, 1,
0.2505068, -0.1132319, 1.930438, 1, 1, 1, 1, 1,
0.2509145, 1.603881, 1.58377, 1, 1, 1, 1, 1,
0.2525848, 0.2382064, -0.2171022, 1, 1, 1, 1, 1,
0.2533404, -1.033341, 2.306576, 0, 0, 1, 1, 1,
0.2614657, -1.168946, 4.041055, 1, 0, 0, 1, 1,
0.2668423, 0.3523105, 0.2958445, 1, 0, 0, 1, 1,
0.2702625, 1.060177, -0.2097862, 1, 0, 0, 1, 1,
0.2785364, 1.136591, -0.36055, 1, 0, 0, 1, 1,
0.2852738, -0.6623516, 1.756586, 1, 0, 0, 1, 1,
0.2882833, -0.662665, 4.153167, 0, 0, 0, 1, 1,
0.2888926, 1.732359, 0.4072771, 0, 0, 0, 1, 1,
0.2903062, -1.552276, 3.859112, 0, 0, 0, 1, 1,
0.2919152, -1.535853, 5.553188, 0, 0, 0, 1, 1,
0.2930315, 0.4181129, 0.7400079, 0, 0, 0, 1, 1,
0.2932436, -1.494684, 3.883111, 0, 0, 0, 1, 1,
0.2950534, 0.2417843, 1.287979, 0, 0, 0, 1, 1,
0.2996343, -1.233552, 4.269624, 1, 1, 1, 1, 1,
0.3019891, 0.8267772, 1.0282, 1, 1, 1, 1, 1,
0.3021173, 1.623772, -0.4068006, 1, 1, 1, 1, 1,
0.3052381, 0.1031806, 1.586191, 1, 1, 1, 1, 1,
0.3079444, 0.31353, 0.4775928, 1, 1, 1, 1, 1,
0.3178392, -0.2069608, 0.8997935, 1, 1, 1, 1, 1,
0.3203324, -1.077338, 3.274855, 1, 1, 1, 1, 1,
0.3216696, -1.35765, 2.730323, 1, 1, 1, 1, 1,
0.3220354, 0.7110906, 0.1535521, 1, 1, 1, 1, 1,
0.3270027, -0.6511998, 4.191192, 1, 1, 1, 1, 1,
0.3297317, 0.3913062, 1.33016, 1, 1, 1, 1, 1,
0.3300407, -0.4031757, 3.677128, 1, 1, 1, 1, 1,
0.3322234, 0.06098321, -0.1635937, 1, 1, 1, 1, 1,
0.3324705, 0.7417519, 0.7651192, 1, 1, 1, 1, 1,
0.3362896, 1.168059, -1.173403, 1, 1, 1, 1, 1,
0.3376662, 0.1391262, 0.9058294, 0, 0, 1, 1, 1,
0.3449555, -1.313791, 2.087568, 1, 0, 0, 1, 1,
0.3495215, 0.4865355, 0.1961945, 1, 0, 0, 1, 1,
0.3506752, -0.177477, 1.873471, 1, 0, 0, 1, 1,
0.3554043, 0.2832801, -1.074866, 1, 0, 0, 1, 1,
0.35734, -0.6364881, 2.303371, 1, 0, 0, 1, 1,
0.3580376, 0.7647778, 1.639673, 0, 0, 0, 1, 1,
0.3581193, 1.466012, -0.1822353, 0, 0, 0, 1, 1,
0.3583939, -0.6747484, 3.990711, 0, 0, 0, 1, 1,
0.3606421, 1.246205, 0.5729341, 0, 0, 0, 1, 1,
0.3687757, 0.2192968, 0.5521257, 0, 0, 0, 1, 1,
0.3726955, 0.07334988, 1.951321, 0, 0, 0, 1, 1,
0.3867863, -0.4150349, 1.98387, 0, 0, 0, 1, 1,
0.3914894, -0.8788058, 2.871886, 1, 1, 1, 1, 1,
0.3929779, 0.4913599, 1.022868, 1, 1, 1, 1, 1,
0.3944083, -0.9335179, 1.872727, 1, 1, 1, 1, 1,
0.3965966, 0.06688748, 0.1475071, 1, 1, 1, 1, 1,
0.4000377, -0.2858, 3.914613, 1, 1, 1, 1, 1,
0.404003, 1.269803, 1.499351, 1, 1, 1, 1, 1,
0.4044651, -1.388783, 1.933975, 1, 1, 1, 1, 1,
0.4072651, 1.53346, 0.6409951, 1, 1, 1, 1, 1,
0.409884, -0.3971035, 1.217158, 1, 1, 1, 1, 1,
0.4124765, -0.4868327, 2.26312, 1, 1, 1, 1, 1,
0.4132045, -0.8704873, 4.225368, 1, 1, 1, 1, 1,
0.4144339, 0.6289496, -0.385537, 1, 1, 1, 1, 1,
0.4173139, -0.08037678, 0.6706406, 1, 1, 1, 1, 1,
0.4177419, 0.3684398, 0.265831, 1, 1, 1, 1, 1,
0.4197532, 1.141692, 1.359508, 1, 1, 1, 1, 1,
0.4201353, -1.114885, 2.5065, 0, 0, 1, 1, 1,
0.4226545, 1.932905, 0.1141736, 1, 0, 0, 1, 1,
0.4457121, 1.064367, 0.2478652, 1, 0, 0, 1, 1,
0.4559769, 0.3378952, 0.8329253, 1, 0, 0, 1, 1,
0.4579997, -2.88101, 1.169685, 1, 0, 0, 1, 1,
0.4666419, -0.762486, 3.647689, 1, 0, 0, 1, 1,
0.4667631, 1.152475, -0.276859, 0, 0, 0, 1, 1,
0.4694422, 0.7395762, 1.779071, 0, 0, 0, 1, 1,
0.4718733, -0.5489271, 3.428648, 0, 0, 0, 1, 1,
0.472506, -0.319956, 2.555586, 0, 0, 0, 1, 1,
0.4727504, -0.872619, 2.665403, 0, 0, 0, 1, 1,
0.473445, -0.4738719, 2.023723, 0, 0, 0, 1, 1,
0.4757661, 0.05420556, 1.541096, 0, 0, 0, 1, 1,
0.4805729, -0.06630351, 0.9506714, 1, 1, 1, 1, 1,
0.4857279, -0.7349527, 3.230337, 1, 1, 1, 1, 1,
0.4885061, -0.6114619, 0.1294633, 1, 1, 1, 1, 1,
0.4973161, -0.4304943, 2.424389, 1, 1, 1, 1, 1,
0.4980873, 0.8739995, 1.200325, 1, 1, 1, 1, 1,
0.500452, 0.9933566, 0.9181845, 1, 1, 1, 1, 1,
0.5055901, 0.07810314, 1.071238, 1, 1, 1, 1, 1,
0.5061264, 0.6890371, -0.1761235, 1, 1, 1, 1, 1,
0.5076075, 0.4687229, 0.3701457, 1, 1, 1, 1, 1,
0.5082571, -1.507665, 3.304126, 1, 1, 1, 1, 1,
0.5108374, -0.5715051, 1.914415, 1, 1, 1, 1, 1,
0.5140271, -0.2063414, 3.018881, 1, 1, 1, 1, 1,
0.5163847, 0.9707835, -1.20099, 1, 1, 1, 1, 1,
0.5169223, 1.115317, -0.3982177, 1, 1, 1, 1, 1,
0.5172657, 0.02685511, 0.7620127, 1, 1, 1, 1, 1,
0.5178966, -1.34074, 2.843481, 0, 0, 1, 1, 1,
0.5203545, -1.049227, 4.260487, 1, 0, 0, 1, 1,
0.5232516, 1.011755, 0.4007809, 1, 0, 0, 1, 1,
0.5236528, -0.331545, 1.354978, 1, 0, 0, 1, 1,
0.5249947, 0.3935676, 2.415197, 1, 0, 0, 1, 1,
0.5263712, -1.304121, 1.766636, 1, 0, 0, 1, 1,
0.5298458, -1.001969, 2.813906, 0, 0, 0, 1, 1,
0.5304081, 1.525364, 0.7464201, 0, 0, 0, 1, 1,
0.535757, -0.6824856, 2.736406, 0, 0, 0, 1, 1,
0.5450127, -1.075968, 4.648265, 0, 0, 0, 1, 1,
0.5505934, 0.2797891, 2.04741, 0, 0, 0, 1, 1,
0.5568171, -0.3418474, 0.7751048, 0, 0, 0, 1, 1,
0.5593893, -0.2961193, 1.882263, 0, 0, 0, 1, 1,
0.5666748, 1.297492, 1.175909, 1, 1, 1, 1, 1,
0.5747733, 0.6668653, 0.3999111, 1, 1, 1, 1, 1,
0.5760616, -0.008668059, -0.3822105, 1, 1, 1, 1, 1,
0.5776739, 0.2431315, 0.3828543, 1, 1, 1, 1, 1,
0.5816404, -0.4834868, 3.163219, 1, 1, 1, 1, 1,
0.5822831, 0.4526513, -0.6585174, 1, 1, 1, 1, 1,
0.5836488, -1.270345, 4.617993, 1, 1, 1, 1, 1,
0.5856982, 0.03220515, -0.412904, 1, 1, 1, 1, 1,
0.5904558, 1.87354, -0.08230346, 1, 1, 1, 1, 1,
0.596008, -0.1498957, 3.165942, 1, 1, 1, 1, 1,
0.5987666, 0.01232105, 1.599491, 1, 1, 1, 1, 1,
0.5991345, 0.973363, 2.814654, 1, 1, 1, 1, 1,
0.6005288, -0.2914048, 1.155753, 1, 1, 1, 1, 1,
0.602425, 0.165607, 1.774061, 1, 1, 1, 1, 1,
0.607561, -0.7631615, 1.102691, 1, 1, 1, 1, 1,
0.6123929, 1.785705, 0.8175517, 0, 0, 1, 1, 1,
0.6130728, 1.599047, 1.704107, 1, 0, 0, 1, 1,
0.6154576, 0.3388216, 0.2760513, 1, 0, 0, 1, 1,
0.6181448, -0.6986043, 2.846881, 1, 0, 0, 1, 1,
0.6194968, -0.7466021, 4.016921, 1, 0, 0, 1, 1,
0.6217657, 0.01054003, 1.190882, 1, 0, 0, 1, 1,
0.6223426, 0.6532614, -0.9965023, 0, 0, 0, 1, 1,
0.62383, 0.1971135, 1.433723, 0, 0, 0, 1, 1,
0.6249903, 0.8763015, 0.6647916, 0, 0, 0, 1, 1,
0.6283841, -1.7831, 2.718476, 0, 0, 0, 1, 1,
0.6392019, -0.4848153, 1.816972, 0, 0, 0, 1, 1,
0.6431407, -0.5752322, 2.506824, 0, 0, 0, 1, 1,
0.6438194, -0.2331185, 0.8425046, 0, 0, 0, 1, 1,
0.6495811, -0.30332, 0.7258652, 1, 1, 1, 1, 1,
0.6505579, 0.06538811, 0.4828407, 1, 1, 1, 1, 1,
0.6510953, -0.2303799, 3.433879, 1, 1, 1, 1, 1,
0.6551752, -0.3365317, 2.837296, 1, 1, 1, 1, 1,
0.6552866, -0.2594918, 1.896379, 1, 1, 1, 1, 1,
0.657061, -1.624749, 3.304909, 1, 1, 1, 1, 1,
0.6671317, -0.9423946, 2.221615, 1, 1, 1, 1, 1,
0.6685439, 1.432996, 1.447818, 1, 1, 1, 1, 1,
0.6691028, -1.844671, 2.478553, 1, 1, 1, 1, 1,
0.6704105, 0.1591115, 1.673021, 1, 1, 1, 1, 1,
0.6732319, -1.170649, 3.80528, 1, 1, 1, 1, 1,
0.6790085, -1.749993, 0.8509104, 1, 1, 1, 1, 1,
0.6844454, -0.7935608, 3.001228, 1, 1, 1, 1, 1,
0.6845582, 0.3901256, 1.292819, 1, 1, 1, 1, 1,
0.6867623, 0.9214901, -0.1560677, 1, 1, 1, 1, 1,
0.6879106, -0.9202027, 3.15082, 0, 0, 1, 1, 1,
0.6899521, -1.044123, 3.826788, 1, 0, 0, 1, 1,
0.6922491, 0.9172727, 2.636654, 1, 0, 0, 1, 1,
0.6935004, 0.4726641, 1.85661, 1, 0, 0, 1, 1,
0.6940743, 1.176328, -0.1229459, 1, 0, 0, 1, 1,
0.6964551, 0.5749097, 0.5720786, 1, 0, 0, 1, 1,
0.7006202, -0.9819555, 3.005403, 0, 0, 0, 1, 1,
0.7014424, -0.3734977, 2.338833, 0, 0, 0, 1, 1,
0.7014961, -0.8662949, 2.066868, 0, 0, 0, 1, 1,
0.702048, -0.1535794, 1.661261, 0, 0, 0, 1, 1,
0.7046894, 0.3458405, -0.5916741, 0, 0, 0, 1, 1,
0.7048784, 2.033137, 1.937739, 0, 0, 0, 1, 1,
0.7074554, 0.7170021, 0.007372533, 0, 0, 0, 1, 1,
0.7079288, 0.6083859, -0.2315006, 1, 1, 1, 1, 1,
0.7151666, -1.329583, 2.431597, 1, 1, 1, 1, 1,
0.726043, -1.611717, 2.4434, 1, 1, 1, 1, 1,
0.7271477, 1.999699, -0.5479489, 1, 1, 1, 1, 1,
0.7291467, 0.3393998, 2.619996, 1, 1, 1, 1, 1,
0.7304506, 0.2657377, -0.03867127, 1, 1, 1, 1, 1,
0.7310016, 0.1388112, 1.532007, 1, 1, 1, 1, 1,
0.7316168, 0.6022707, 1.382758, 1, 1, 1, 1, 1,
0.7335718, -1.488314, 3.423262, 1, 1, 1, 1, 1,
0.7447681, 1.472224, -1.066024, 1, 1, 1, 1, 1,
0.7470613, 1.871899, 0.07438131, 1, 1, 1, 1, 1,
0.7510009, 0.0825908, 1.15191, 1, 1, 1, 1, 1,
0.7521493, -0.2893389, 2.883662, 1, 1, 1, 1, 1,
0.7581281, 0.1311119, 0.357021, 1, 1, 1, 1, 1,
0.7666309, 0.8179505, 1.009805, 1, 1, 1, 1, 1,
0.7759383, 0.7688111, -0.09574348, 0, 0, 1, 1, 1,
0.7929629, -0.7812656, 1.521093, 1, 0, 0, 1, 1,
0.7936482, -0.5984538, 4.083335, 1, 0, 0, 1, 1,
0.8047439, 2.118394, 1.562464, 1, 0, 0, 1, 1,
0.8055386, -1.558205, 2.663922, 1, 0, 0, 1, 1,
0.8119537, -0.6519437, 2.331734, 1, 0, 0, 1, 1,
0.8145223, 0.003305359, 2.642994, 0, 0, 0, 1, 1,
0.81754, 0.187962, 2.856957, 0, 0, 0, 1, 1,
0.8230582, 0.8195798, 0.3593544, 0, 0, 0, 1, 1,
0.8266974, 0.00730862, 1.271471, 0, 0, 0, 1, 1,
0.8279952, 0.8111569, 0.7481868, 0, 0, 0, 1, 1,
0.8377978, 0.7713464, 0.5655632, 0, 0, 0, 1, 1,
0.8455139, 0.8446038, 1.12008, 0, 0, 0, 1, 1,
0.8471763, -0.01558552, 2.947561, 1, 1, 1, 1, 1,
0.8515546, 0.6345385, 0.7569305, 1, 1, 1, 1, 1,
0.8521681, -0.3946865, 2.870092, 1, 1, 1, 1, 1,
0.8599814, 0.7171805, 1.805582, 1, 1, 1, 1, 1,
0.8610034, -0.9413519, 1.777893, 1, 1, 1, 1, 1,
0.8619677, -0.1652781, 1.279296, 1, 1, 1, 1, 1,
0.8689862, -1.082266, 3.12198, 1, 1, 1, 1, 1,
0.8705359, -0.067324, 1.850602, 1, 1, 1, 1, 1,
0.8749783, 1.05898, 0.5945742, 1, 1, 1, 1, 1,
0.8753244, 1.837702, -0.005033097, 1, 1, 1, 1, 1,
0.8771148, 0.2036714, 3.557732, 1, 1, 1, 1, 1,
0.8774511, 0.9767559, 0.2225297, 1, 1, 1, 1, 1,
0.8788118, -1.760639, 3.598265, 1, 1, 1, 1, 1,
0.8838782, -0.07648709, 1.716246, 1, 1, 1, 1, 1,
0.8844755, -0.8451471, 3.08028, 1, 1, 1, 1, 1,
0.8865718, 0.1563673, 0.9116296, 0, 0, 1, 1, 1,
0.8884951, -0.2849751, 2.235756, 1, 0, 0, 1, 1,
0.8900603, -0.3862602, 1.55453, 1, 0, 0, 1, 1,
0.8914362, 1.235904, -1.336686, 1, 0, 0, 1, 1,
0.8922023, -0.3931948, 1.57761, 1, 0, 0, 1, 1,
0.8979844, -0.308636, 1.731784, 1, 0, 0, 1, 1,
0.9042342, 1.774426, 1.374204, 0, 0, 0, 1, 1,
0.906826, -0.2471997, 1.023688, 0, 0, 0, 1, 1,
0.9075322, -0.1425544, 2.668548, 0, 0, 0, 1, 1,
0.9170157, 0.9384213, -0.6352946, 0, 0, 0, 1, 1,
0.9184003, -0.3757686, 3.368332, 0, 0, 0, 1, 1,
0.9196714, -0.671245, 2.039543, 0, 0, 0, 1, 1,
0.9273154, 1.018453, -0.2726215, 0, 0, 0, 1, 1,
0.9291813, -1.521402, 2.313465, 1, 1, 1, 1, 1,
0.932684, -0.2344185, 0.651125, 1, 1, 1, 1, 1,
0.9340455, -0.5288746, 2.736205, 1, 1, 1, 1, 1,
0.9353977, -2.421695, 2.247552, 1, 1, 1, 1, 1,
0.9356073, 0.3120372, 2.362795, 1, 1, 1, 1, 1,
0.9434166, 0.9386505, -0.5353695, 1, 1, 1, 1, 1,
0.948598, 0.9958221, 0.06316807, 1, 1, 1, 1, 1,
0.9546514, -1.530587, 2.073676, 1, 1, 1, 1, 1,
0.9602909, 0.04172514, 0.9887143, 1, 1, 1, 1, 1,
0.962533, -1.331128, 1.70737, 1, 1, 1, 1, 1,
0.9693262, -0.4073867, 2.667835, 1, 1, 1, 1, 1,
0.9752703, 0.3137385, 2.793433, 1, 1, 1, 1, 1,
0.9794914, -1.124402, 0.4913168, 1, 1, 1, 1, 1,
0.9899495, 0.2858248, 1.316315, 1, 1, 1, 1, 1,
0.9908609, 0.08802953, 1.054572, 1, 1, 1, 1, 1,
0.9940009, 1.180136, 0.5916274, 0, 0, 1, 1, 1,
0.9977228, 1.134609, 1.204742, 1, 0, 0, 1, 1,
0.9992158, -0.9100302, 0.7389414, 1, 0, 0, 1, 1,
1.009341, 0.8980505, 1.760351, 1, 0, 0, 1, 1,
1.01077, 0.09638194, 2.137234, 1, 0, 0, 1, 1,
1.010939, -0.5070898, 3.722199, 1, 0, 0, 1, 1,
1.012497, -0.3329741, 1.533603, 0, 0, 0, 1, 1,
1.013007, 0.3348393, -0.596319, 0, 0, 0, 1, 1,
1.014969, 0.7238834, 1.711266, 0, 0, 0, 1, 1,
1.016085, 0.1298211, 1.53562, 0, 0, 0, 1, 1,
1.017135, -0.05531098, 2.26421, 0, 0, 0, 1, 1,
1.018835, 0.7710873, 1.826425, 0, 0, 0, 1, 1,
1.024127, -0.6125014, 1.823567, 0, 0, 0, 1, 1,
1.026273, -0.2178285, 0.9672821, 1, 1, 1, 1, 1,
1.033095, 0.02057353, 2.238537, 1, 1, 1, 1, 1,
1.034594, 0.6151124, 0.04062887, 1, 1, 1, 1, 1,
1.038138, -0.328444, 1.430459, 1, 1, 1, 1, 1,
1.042935, -1.731161, 3.558914, 1, 1, 1, 1, 1,
1.048329, 0.001812616, 0.7567973, 1, 1, 1, 1, 1,
1.051417, -0.2623998, 3.133873, 1, 1, 1, 1, 1,
1.051427, 0.8552004, 1.161738, 1, 1, 1, 1, 1,
1.052454, -0.02490819, 0.912747, 1, 1, 1, 1, 1,
1.054808, 1.182709, 1.440662, 1, 1, 1, 1, 1,
1.060495, -1.214144, 2.794347, 1, 1, 1, 1, 1,
1.062682, 0.3570483, 2.68213, 1, 1, 1, 1, 1,
1.0652, 0.7268624, 1.062916, 1, 1, 1, 1, 1,
1.068134, 0.1935002, 0.7205511, 1, 1, 1, 1, 1,
1.068287, 2.020186, -0.1139134, 1, 1, 1, 1, 1,
1.06842, -2.72629, 2.376644, 0, 0, 1, 1, 1,
1.069353, -0.05899019, 3.300212, 1, 0, 0, 1, 1,
1.07794, 1.685875, 1.792753, 1, 0, 0, 1, 1,
1.078129, -0.5341741, 0.7917426, 1, 0, 0, 1, 1,
1.082473, 0.958948, -0.8654216, 1, 0, 0, 1, 1,
1.083416, 2.037335, 1.052442, 1, 0, 0, 1, 1,
1.090977, 0.6013947, 1.369597, 0, 0, 0, 1, 1,
1.091896, -1.160847, 0.9501479, 0, 0, 0, 1, 1,
1.092451, 1.560022, 1.96531, 0, 0, 0, 1, 1,
1.09811, 0.8803312, 1.051593, 0, 0, 0, 1, 1,
1.09936, 0.2003141, 3.443011, 0, 0, 0, 1, 1,
1.107637, 0.7285252, 1.454296, 0, 0, 0, 1, 1,
1.108936, -0.4566998, 2.012494, 0, 0, 0, 1, 1,
1.109055, -0.75796, 3.333671, 1, 1, 1, 1, 1,
1.114627, 1.358683, 0.6084471, 1, 1, 1, 1, 1,
1.123859, 0.723233, 0.6756967, 1, 1, 1, 1, 1,
1.127052, 0.5551845, 1.981719, 1, 1, 1, 1, 1,
1.129889, 2.401431, 0.1766079, 1, 1, 1, 1, 1,
1.13741, 0.4098631, 1.700179, 1, 1, 1, 1, 1,
1.148879, -0.1137022, -0.8100479, 1, 1, 1, 1, 1,
1.152937, 0.5847268, 0.3677807, 1, 1, 1, 1, 1,
1.15322, 1.585775, 0.499453, 1, 1, 1, 1, 1,
1.169607, 1.058664, 1.460815, 1, 1, 1, 1, 1,
1.170585, 0.1891451, 1.893291, 1, 1, 1, 1, 1,
1.173944, 1.475224, 0.6757513, 1, 1, 1, 1, 1,
1.176579, 0.3914907, -0.3664605, 1, 1, 1, 1, 1,
1.180071, 1.153114, -0.7364836, 1, 1, 1, 1, 1,
1.181449, 1.355663, 2.35015, 1, 1, 1, 1, 1,
1.182559, -0.5817088, 3.136767, 0, 0, 1, 1, 1,
1.185407, 1.276975, 1.773197, 1, 0, 0, 1, 1,
1.195364, -0.9605119, 3.657082, 1, 0, 0, 1, 1,
1.22236, -0.1919627, 1.327649, 1, 0, 0, 1, 1,
1.233327, 0.6758199, 1.241329, 1, 0, 0, 1, 1,
1.236095, -0.4761238, 2.529346, 1, 0, 0, 1, 1,
1.236908, 1.090608, 0.4562107, 0, 0, 0, 1, 1,
1.242403, -1.750695, 2.187515, 0, 0, 0, 1, 1,
1.246598, -0.3834518, 3.844959, 0, 0, 0, 1, 1,
1.247013, 0.4210722, 0.1595831, 0, 0, 0, 1, 1,
1.247447, 1.010514, 0.8510149, 0, 0, 0, 1, 1,
1.249731, 0.5196648, 1.361933, 0, 0, 0, 1, 1,
1.257096, 1.775859, -0.1617526, 0, 0, 0, 1, 1,
1.259981, -0.9569623, 3.254939, 1, 1, 1, 1, 1,
1.262293, 0.2300304, 0.2981913, 1, 1, 1, 1, 1,
1.263348, -0.1548778, 1.145885, 1, 1, 1, 1, 1,
1.274829, -0.9385188, 3.246089, 1, 1, 1, 1, 1,
1.275448, -0.1915814, 1.57322, 1, 1, 1, 1, 1,
1.280785, 0.5835817, 1.316486, 1, 1, 1, 1, 1,
1.286946, 1.024343, 0.5567919, 1, 1, 1, 1, 1,
1.29844, 1.572674, 0.06244377, 1, 1, 1, 1, 1,
1.310008, -2.421683, 4.426647, 1, 1, 1, 1, 1,
1.310952, 0.03993809, 1.880433, 1, 1, 1, 1, 1,
1.333567, -0.3205789, 2.830765, 1, 1, 1, 1, 1,
1.342713, -0.8238439, 1.694747, 1, 1, 1, 1, 1,
1.353969, -0.9709454, 0.1599759, 1, 1, 1, 1, 1,
1.365396, -0.3007436, 1.472685, 1, 1, 1, 1, 1,
1.369794, -0.006199056, 2.973737, 1, 1, 1, 1, 1,
1.381991, -0.590151, 0.4921609, 0, 0, 1, 1, 1,
1.399403, -1.010871, 2.179031, 1, 0, 0, 1, 1,
1.415796, 0.05695496, -1.6501, 1, 0, 0, 1, 1,
1.429613, 1.92355, 0.2812389, 1, 0, 0, 1, 1,
1.439223, 1.228439, 2.551223, 1, 0, 0, 1, 1,
1.442372, -0.6797686, 1.985837, 1, 0, 0, 1, 1,
1.443465, 0.05719028, -0.1411452, 0, 0, 0, 1, 1,
1.443529, -1.405926, 3.50229, 0, 0, 0, 1, 1,
1.446207, 1.323561, 1.026686, 0, 0, 0, 1, 1,
1.45313, 0.3463044, 2.613509, 0, 0, 0, 1, 1,
1.460119, -0.379794, 1.490591, 0, 0, 0, 1, 1,
1.465332, 0.1433734, 0.8744407, 0, 0, 0, 1, 1,
1.466176, -0.6299592, 1.576258, 0, 0, 0, 1, 1,
1.475298, 0.7287405, 1.200838, 1, 1, 1, 1, 1,
1.476057, 0.007526085, 0.6546333, 1, 1, 1, 1, 1,
1.492886, 0.5383582, 1.983142, 1, 1, 1, 1, 1,
1.499814, 2.185614, -1.655519, 1, 1, 1, 1, 1,
1.50286, 1.061272, 1.947714, 1, 1, 1, 1, 1,
1.524225, -0.02807707, 0.5496597, 1, 1, 1, 1, 1,
1.533666, 0.230787, 2.184342, 1, 1, 1, 1, 1,
1.535131, 0.7887518, 3.579997, 1, 1, 1, 1, 1,
1.54184, 0.142714, 0.1145897, 1, 1, 1, 1, 1,
1.550269, -2.767126, 0.7132436, 1, 1, 1, 1, 1,
1.554898, 1.22774, 2.437872, 1, 1, 1, 1, 1,
1.561386, 0.09724682, 2.041371, 1, 1, 1, 1, 1,
1.578765, -1.344237, 1.425548, 1, 1, 1, 1, 1,
1.579457, 1.65992, 0.0217309, 1, 1, 1, 1, 1,
1.589642, -0.002252419, 1.550976, 1, 1, 1, 1, 1,
1.613055, 0.5826684, 2.113301, 0, 0, 1, 1, 1,
1.616364, -0.1975546, 1.987441, 1, 0, 0, 1, 1,
1.619291, 1.156053, 1.389416, 1, 0, 0, 1, 1,
1.653355, 1.028573, 1.56155, 1, 0, 0, 1, 1,
1.655323, 1.838707, -1.216081, 1, 0, 0, 1, 1,
1.657446, -0.7076355, 1.642642, 1, 0, 0, 1, 1,
1.666178, -0.9258425, 2.80478, 0, 0, 0, 1, 1,
1.666646, 0.9972721, 0.6965364, 0, 0, 0, 1, 1,
1.733349, -1.177268, 0.3720733, 0, 0, 0, 1, 1,
1.734508, 0.6115394, 0.6468995, 0, 0, 0, 1, 1,
1.734529, -0.686719, 1.990996, 0, 0, 0, 1, 1,
1.734693, 0.3898969, 0.8873429, 0, 0, 0, 1, 1,
1.746054, 1.30424, 3.10265, 0, 0, 0, 1, 1,
1.762603, -0.9944694, 1.677531, 1, 1, 1, 1, 1,
1.763175, 1.293615, 0.3581881, 1, 1, 1, 1, 1,
1.788556, -1.581274, 2.270011, 1, 1, 1, 1, 1,
1.815622, 0.240556, 0.7064912, 1, 1, 1, 1, 1,
1.825269, -0.2352283, 3.71589, 1, 1, 1, 1, 1,
1.826779, 1.689325, 0.9584924, 1, 1, 1, 1, 1,
1.83551, -1.198148, 1.937087, 1, 1, 1, 1, 1,
1.848916, 1.161939, 3.368415, 1, 1, 1, 1, 1,
1.868405, 0.3075921, 1.528973, 1, 1, 1, 1, 1,
1.868781, 0.1363766, 0.6331359, 1, 1, 1, 1, 1,
1.876292, -0.7826034, 1.744055, 1, 1, 1, 1, 1,
1.895288, -0.5170178, 1.158125, 1, 1, 1, 1, 1,
1.917629, 0.01761633, 1.574446, 1, 1, 1, 1, 1,
1.964158, 0.7630664, 0.8268772, 1, 1, 1, 1, 1,
1.968419, 1.409334, 2.044802, 1, 1, 1, 1, 1,
1.977686, -1.159993, 0.9669095, 0, 0, 1, 1, 1,
1.981932, 1.165497, 0.69791, 1, 0, 0, 1, 1,
2.019116, 1.432717, 2.590289, 1, 0, 0, 1, 1,
2.059808, 0.5636068, 2.39544, 1, 0, 0, 1, 1,
2.071673, 0.5156804, 1.740409, 1, 0, 0, 1, 1,
2.106688, -0.3424277, 1.278893, 1, 0, 0, 1, 1,
2.12816, -0.299641, 2.468261, 0, 0, 0, 1, 1,
2.155809, -0.1168658, 2.34791, 0, 0, 0, 1, 1,
2.318733, 1.228276, 1.166903, 0, 0, 0, 1, 1,
2.385692, 1.2619, 0.3666772, 0, 0, 0, 1, 1,
2.418703, 0.3145067, 2.388292, 0, 0, 0, 1, 1,
2.441755, 1.023474, 3.062232, 0, 0, 0, 1, 1,
2.59643, -2.904369, 1.880337, 0, 0, 0, 1, 1,
2.648711, 0.05733992, -0.2219069, 1, 1, 1, 1, 1,
2.747705, 1.022586, 0.6993231, 1, 1, 1, 1, 1,
2.939637, -1.122059, 2.337451, 1, 1, 1, 1, 1,
2.96585, 0.2790491, 2.110511, 1, 1, 1, 1, 1,
3.155955, -0.3092413, 3.122464, 1, 1, 1, 1, 1,
3.453134, -1.756688, 1.584445, 1, 1, 1, 1, 1,
3.717103, -1.181006, 2.020849, 1, 1, 1, 1, 1
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
var radius = 10.00441;
var distance = 35.14008;
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
mvMatrix.translate( -0.3854111, -0.07008457, 0.245604 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.14008);
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
