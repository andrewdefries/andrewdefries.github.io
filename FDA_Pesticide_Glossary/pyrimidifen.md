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
-3.542892, -2.226556, -2.866197, 1, 0, 0, 1,
-3.468737, -0.2102105, -2.63909, 1, 0.007843138, 0, 1,
-3.108569, -0.4806915, -0.3879543, 1, 0.01176471, 0, 1,
-2.971056, 0.268705, -2.239429, 1, 0.01960784, 0, 1,
-2.818477, 0.330869, -1.734992, 1, 0.02352941, 0, 1,
-2.814365, -1.531173, -2.475103, 1, 0.03137255, 0, 1,
-2.777306, -1.175637, -2.501812, 1, 0.03529412, 0, 1,
-2.774976, -2.38061, -0.8254268, 1, 0.04313726, 0, 1,
-2.514747, 1.458361, -0.7583361, 1, 0.04705882, 0, 1,
-2.511362, 0.4778275, -0.4825969, 1, 0.05490196, 0, 1,
-2.501565, -0.7611406, 0.1891469, 1, 0.05882353, 0, 1,
-2.431649, -1.106213, -1.759365, 1, 0.06666667, 0, 1,
-2.42983, -1.239463, -0.975901, 1, 0.07058824, 0, 1,
-2.401572, 0.420628, -1.614434, 1, 0.07843138, 0, 1,
-2.354382, -0.2028958, -2.118873, 1, 0.08235294, 0, 1,
-2.334636, -0.3992042, -2.063386, 1, 0.09019608, 0, 1,
-2.229894, 1.103597, -0.3157214, 1, 0.09411765, 0, 1,
-2.220225, -0.3308735, -0.5000924, 1, 0.1019608, 0, 1,
-2.164467, -0.669508, -3.282336, 1, 0.1098039, 0, 1,
-2.15191, -0.1238958, -0.5206828, 1, 0.1137255, 0, 1,
-2.13759, 0.6308648, -0.04543489, 1, 0.1215686, 0, 1,
-2.091466, -0.1407079, -3.736182, 1, 0.1254902, 0, 1,
-2.079873, -0.8164246, -2.919008, 1, 0.1333333, 0, 1,
-2.068999, 0.2107506, -2.608315, 1, 0.1372549, 0, 1,
-2.068103, 1.41144, 0.02502585, 1, 0.145098, 0, 1,
-2.049075, 1.598269, -0.7644252, 1, 0.1490196, 0, 1,
-2.043297, 0.359141, -2.402392, 1, 0.1568628, 0, 1,
-2.02689, -2.304777, -0.7586496, 1, 0.1607843, 0, 1,
-2.0224, -0.1970456, -2.891394, 1, 0.1686275, 0, 1,
-1.978529, -0.5702428, -1.794735, 1, 0.172549, 0, 1,
-1.945372, -0.1651717, -1.233406, 1, 0.1803922, 0, 1,
-1.925649, 0.02822316, -1.417377, 1, 0.1843137, 0, 1,
-1.918767, 1.585195, 0.9017854, 1, 0.1921569, 0, 1,
-1.914422, -0.7759035, -1.476217, 1, 0.1960784, 0, 1,
-1.91125, -0.1516753, -2.815515, 1, 0.2039216, 0, 1,
-1.907549, -2.010584, -2.643435, 1, 0.2117647, 0, 1,
-1.89864, -0.8655616, -2.426092, 1, 0.2156863, 0, 1,
-1.888967, -0.6343715, -2.296566, 1, 0.2235294, 0, 1,
-1.887999, 1.577972, -2.121219, 1, 0.227451, 0, 1,
-1.86177, -1.254669, -1.766926, 1, 0.2352941, 0, 1,
-1.85962, -0.4695134, -2.661792, 1, 0.2392157, 0, 1,
-1.83115, -0.1842361, -1.996027, 1, 0.2470588, 0, 1,
-1.830992, -0.01998182, -0.8448762, 1, 0.2509804, 0, 1,
-1.830274, -1.17127, -3.281049, 1, 0.2588235, 0, 1,
-1.823999, 0.3688646, -1.695284, 1, 0.2627451, 0, 1,
-1.803554, 0.5993177, -0.6597068, 1, 0.2705882, 0, 1,
-1.800011, 0.9978201, -2.218899, 1, 0.2745098, 0, 1,
-1.793388, -0.9697829, -2.641206, 1, 0.282353, 0, 1,
-1.790223, 0.209512, -2.233566, 1, 0.2862745, 0, 1,
-1.78844, -0.3577922, -0.6459261, 1, 0.2941177, 0, 1,
-1.76919, 0.105753, -1.346084, 1, 0.3019608, 0, 1,
-1.728019, 1.641729, -0.5212976, 1, 0.3058824, 0, 1,
-1.725773, -0.03625807, -1.128459, 1, 0.3137255, 0, 1,
-1.722238, -1.011338, -2.273873, 1, 0.3176471, 0, 1,
-1.693597, -1.343901, -3.481915, 1, 0.3254902, 0, 1,
-1.6807, -0.6012389, -3.170963, 1, 0.3294118, 0, 1,
-1.669651, -1.091399, 0.3427013, 1, 0.3372549, 0, 1,
-1.667904, 0.3298973, -1.200729, 1, 0.3411765, 0, 1,
-1.664866, -0.9169303, -1.098524, 1, 0.3490196, 0, 1,
-1.657217, -0.5627406, -2.196136, 1, 0.3529412, 0, 1,
-1.637829, 0.1656249, -1.690968, 1, 0.3607843, 0, 1,
-1.620644, -1.37917, -2.700683, 1, 0.3647059, 0, 1,
-1.613109, 0.6195117, -1.269318, 1, 0.372549, 0, 1,
-1.604711, 0.4599345, 0.2244375, 1, 0.3764706, 0, 1,
-1.577929, -0.1624598, -3.388879, 1, 0.3843137, 0, 1,
-1.566986, -0.5673302, 0.09542082, 1, 0.3882353, 0, 1,
-1.56674, 1.078024, -1.093547, 1, 0.3960784, 0, 1,
-1.555976, 1.159406, -1.015698, 1, 0.4039216, 0, 1,
-1.555873, -1.424842, -3.145813, 1, 0.4078431, 0, 1,
-1.549704, 1.433004, -0.9937832, 1, 0.4156863, 0, 1,
-1.54631, -0.1786014, -3.386748, 1, 0.4196078, 0, 1,
-1.541993, -0.5040486, -2.619795, 1, 0.427451, 0, 1,
-1.527506, 0.5637349, -0.6316063, 1, 0.4313726, 0, 1,
-1.504515, 0.8691862, -1.989111, 1, 0.4392157, 0, 1,
-1.476045, -0.7413541, -0.7256957, 1, 0.4431373, 0, 1,
-1.474087, -0.4903005, -1.506353, 1, 0.4509804, 0, 1,
-1.471045, 0.2888455, -0.8420641, 1, 0.454902, 0, 1,
-1.44293, -2.116727, -3.628195, 1, 0.4627451, 0, 1,
-1.441248, -0.3208391, -3.353937, 1, 0.4666667, 0, 1,
-1.435435, -0.07218818, -2.34175, 1, 0.4745098, 0, 1,
-1.422835, 0.5946299, -0.4377795, 1, 0.4784314, 0, 1,
-1.42089, -2.463816, -3.703541, 1, 0.4862745, 0, 1,
-1.387362, 1.407037, -1.613207, 1, 0.4901961, 0, 1,
-1.377236, -1.008192, -2.277642, 1, 0.4980392, 0, 1,
-1.371131, 0.5200914, -2.156713, 1, 0.5058824, 0, 1,
-1.368574, -0.2198181, -1.573165, 1, 0.509804, 0, 1,
-1.34594, -0.2419389, -0.9919785, 1, 0.5176471, 0, 1,
-1.345492, 0.9088465, -1.200007, 1, 0.5215687, 0, 1,
-1.344979, -0.2300216, -1.648902, 1, 0.5294118, 0, 1,
-1.305334, 0.55872, -0.2678866, 1, 0.5333334, 0, 1,
-1.305258, -1.748495, -3.547456, 1, 0.5411765, 0, 1,
-1.305122, -0.1561519, -0.4373042, 1, 0.5450981, 0, 1,
-1.305021, 0.609938, -1.781304, 1, 0.5529412, 0, 1,
-1.300926, -0.5493095, -0.3225756, 1, 0.5568628, 0, 1,
-1.300766, -0.04241319, -2.233637, 1, 0.5647059, 0, 1,
-1.29258, -0.3873355, -3.45515, 1, 0.5686275, 0, 1,
-1.278406, 0.1252434, -0.9436842, 1, 0.5764706, 0, 1,
-1.270764, 1.227304, -0.7765665, 1, 0.5803922, 0, 1,
-1.269422, 0.5018367, -1.483682, 1, 0.5882353, 0, 1,
-1.253718, -1.173299, -1.065864, 1, 0.5921569, 0, 1,
-1.249203, -0.7500513, -1.958028, 1, 0.6, 0, 1,
-1.242446, 0.3067683, -0.5692264, 1, 0.6078432, 0, 1,
-1.231687, 1.462457, -0.211997, 1, 0.6117647, 0, 1,
-1.219225, -1.664328, -3.532521, 1, 0.6196079, 0, 1,
-1.215841, 0.3349065, -0.4437443, 1, 0.6235294, 0, 1,
-1.201714, -1.867316, -2.594197, 1, 0.6313726, 0, 1,
-1.176746, -0.3222385, -0.4406379, 1, 0.6352941, 0, 1,
-1.144513, -0.740354, -2.567285, 1, 0.6431373, 0, 1,
-1.143973, -0.2678275, -1.934303, 1, 0.6470588, 0, 1,
-1.143826, -0.5701394, -2.796055, 1, 0.654902, 0, 1,
-1.143014, 0.7636356, -1.607467, 1, 0.6588235, 0, 1,
-1.138393, 0.5730735, -2.040945, 1, 0.6666667, 0, 1,
-1.135192, -1.129372, -1.678393, 1, 0.6705883, 0, 1,
-1.134986, -0.4922628, -2.235059, 1, 0.6784314, 0, 1,
-1.132504, 0.7333487, -0.9472976, 1, 0.682353, 0, 1,
-1.128807, 0.008099975, -1.257514, 1, 0.6901961, 0, 1,
-1.125263, -1.431822, -1.536973, 1, 0.6941177, 0, 1,
-1.118445, -0.5571167, -2.133132, 1, 0.7019608, 0, 1,
-1.116937, -1.127911, -2.271833, 1, 0.7098039, 0, 1,
-1.111575, -0.7855255, -3.375412, 1, 0.7137255, 0, 1,
-1.107902, 0.5307953, -1.056999, 1, 0.7215686, 0, 1,
-1.102866, -2.282459, -1.808856, 1, 0.7254902, 0, 1,
-1.09919, -2.479741, -3.475012, 1, 0.7333333, 0, 1,
-1.096144, -0.3830481, -2.066559, 1, 0.7372549, 0, 1,
-1.09452, -1.314939, -0.6732669, 1, 0.7450981, 0, 1,
-1.084202, -0.3698581, -2.99265, 1, 0.7490196, 0, 1,
-1.074419, -1.760783, -2.80054, 1, 0.7568628, 0, 1,
-1.066445, 0.6656702, 0.5280951, 1, 0.7607843, 0, 1,
-1.058069, -1.865662, -3.348592, 1, 0.7686275, 0, 1,
-1.05217, -0.8477325, -1.974449, 1, 0.772549, 0, 1,
-1.050674, -0.2279873, -3.103571, 1, 0.7803922, 0, 1,
-1.05067, 0.3904407, -2.115258, 1, 0.7843137, 0, 1,
-1.033007, -1.105448, -1.08462, 1, 0.7921569, 0, 1,
-1.029978, 0.2151805, -2.469138, 1, 0.7960784, 0, 1,
-1.026033, -0.3530304, -2.435941, 1, 0.8039216, 0, 1,
-1.019155, 0.3758858, -0.4333214, 1, 0.8117647, 0, 1,
-1.017032, -1.581245, -2.718828, 1, 0.8156863, 0, 1,
-1.002081, -1.668588, -2.254043, 1, 0.8235294, 0, 1,
-0.9997964, 0.6586488, -1.375976, 1, 0.827451, 0, 1,
-0.990268, -0.5864689, -1.534462, 1, 0.8352941, 0, 1,
-0.9881082, -0.3467508, -1.99184, 1, 0.8392157, 0, 1,
-0.9852021, -1.141571, -3.734621, 1, 0.8470588, 0, 1,
-0.9829442, 2.386721, -0.2871622, 1, 0.8509804, 0, 1,
-0.9814108, 0.2243818, -1.448148, 1, 0.8588235, 0, 1,
-0.9739566, 0.5150592, -0.7671387, 1, 0.8627451, 0, 1,
-0.9641283, 0.1751299, -2.170467, 1, 0.8705882, 0, 1,
-0.9638293, 1.451728, 0.04920416, 1, 0.8745098, 0, 1,
-0.9581691, -0.2357801, -1.057028, 1, 0.8823529, 0, 1,
-0.9574209, 1.055079, -0.2747623, 1, 0.8862745, 0, 1,
-0.9572044, -1.034579, -2.153889, 1, 0.8941177, 0, 1,
-0.9521134, -0.5827827, -2.605775, 1, 0.8980392, 0, 1,
-0.9509455, 1.436854, -1.110638, 1, 0.9058824, 0, 1,
-0.948062, 0.2523608, -0.2817584, 1, 0.9137255, 0, 1,
-0.9368016, -0.9331268, -2.803928, 1, 0.9176471, 0, 1,
-0.9246941, 0.2929591, 0.3184433, 1, 0.9254902, 0, 1,
-0.9143797, -0.1406493, -2.431005, 1, 0.9294118, 0, 1,
-0.9058861, -1.052619, -1.288065, 1, 0.9372549, 0, 1,
-0.9033815, 0.2571197, -2.858214, 1, 0.9411765, 0, 1,
-0.898913, 0.5889753, -2.10734, 1, 0.9490196, 0, 1,
-0.8898099, -0.7096075, -1.092881, 1, 0.9529412, 0, 1,
-0.8865737, 0.6371679, 0.5203747, 1, 0.9607843, 0, 1,
-0.8801112, 0.2071217, -1.295684, 1, 0.9647059, 0, 1,
-0.8753055, -1.146288, -2.564168, 1, 0.972549, 0, 1,
-0.8737238, -1.061571, -2.690284, 1, 0.9764706, 0, 1,
-0.8721303, -0.5255967, -1.296749, 1, 0.9843137, 0, 1,
-0.864996, -1.630357, -2.588245, 1, 0.9882353, 0, 1,
-0.8573269, -2.38085, -3.149044, 1, 0.9960784, 0, 1,
-0.8562584, -0.5874715, -3.348809, 0.9960784, 1, 0, 1,
-0.848101, 0.2547848, -1.46403, 0.9921569, 1, 0, 1,
-0.83902, 1.071607, 0.7536442, 0.9843137, 1, 0, 1,
-0.8385978, -0.1263558, -1.197754, 0.9803922, 1, 0, 1,
-0.8334627, -1.21986, -3.413881, 0.972549, 1, 0, 1,
-0.8258229, 0.9312446, -0.7723886, 0.9686275, 1, 0, 1,
-0.8190047, 0.1153401, 0.8596806, 0.9607843, 1, 0, 1,
-0.8140454, -1.3214, -1.223984, 0.9568627, 1, 0, 1,
-0.8134691, -0.2813405, -1.390126, 0.9490196, 1, 0, 1,
-0.8087597, 0.4382491, -0.9521739, 0.945098, 1, 0, 1,
-0.8065887, 0.835665, -1.524935, 0.9372549, 1, 0, 1,
-0.8064196, 2.116368, -1.284223, 0.9333333, 1, 0, 1,
-0.8018326, -1.701762, -3.531397, 0.9254902, 1, 0, 1,
-0.7984188, 1.209729, -0.9387342, 0.9215686, 1, 0, 1,
-0.7918899, -0.4225723, -1.458408, 0.9137255, 1, 0, 1,
-0.7910383, 0.2206581, -2.13009, 0.9098039, 1, 0, 1,
-0.7909053, -0.06799071, -3.839417, 0.9019608, 1, 0, 1,
-0.7769746, -0.1696975, -2.866552, 0.8941177, 1, 0, 1,
-0.771719, 1.738859, -0.1321397, 0.8901961, 1, 0, 1,
-0.7679744, -1.008728, -4.030746, 0.8823529, 1, 0, 1,
-0.76651, 1.717608, -1.227811, 0.8784314, 1, 0, 1,
-0.7608986, -1.228925, -0.9409124, 0.8705882, 1, 0, 1,
-0.7596961, 0.5506722, -1.401164, 0.8666667, 1, 0, 1,
-0.7530212, 1.629648, -0.9202907, 0.8588235, 1, 0, 1,
-0.7529052, -1.169288, -3.174297, 0.854902, 1, 0, 1,
-0.7518672, 0.402629, -2.452333, 0.8470588, 1, 0, 1,
-0.7507544, 0.1658111, -2.335745, 0.8431373, 1, 0, 1,
-0.7495377, 0.2478752, -1.826012, 0.8352941, 1, 0, 1,
-0.7483419, 2.128983, -0.2010206, 0.8313726, 1, 0, 1,
-0.7391736, -0.5076917, -2.398167, 0.8235294, 1, 0, 1,
-0.7351405, 1.393089, -0.2529025, 0.8196079, 1, 0, 1,
-0.73131, -0.991816, -2.635565, 0.8117647, 1, 0, 1,
-0.7259554, 0.01446943, -2.505333, 0.8078431, 1, 0, 1,
-0.7242182, 0.4414735, -1.32175, 0.8, 1, 0, 1,
-0.7226818, 1.272992, -0.9892054, 0.7921569, 1, 0, 1,
-0.7200087, -0.5379696, -2.646875, 0.7882353, 1, 0, 1,
-0.718288, 0.07502792, -1.538855, 0.7803922, 1, 0, 1,
-0.7176525, 0.06566559, -1.267547, 0.7764706, 1, 0, 1,
-0.716237, 2.305274, 0.04422331, 0.7686275, 1, 0, 1,
-0.7141053, -1.552163, -2.469403, 0.7647059, 1, 0, 1,
-0.7137646, 0.2170361, -2.917754, 0.7568628, 1, 0, 1,
-0.7089084, 0.5873976, -1.8724, 0.7529412, 1, 0, 1,
-0.7077537, 1.363014, -1.009242, 0.7450981, 1, 0, 1,
-0.707413, 0.4274367, -0.8656193, 0.7411765, 1, 0, 1,
-0.7003593, 1.918597, 0.2401751, 0.7333333, 1, 0, 1,
-0.6983522, -0.3488419, -3.317053, 0.7294118, 1, 0, 1,
-0.6964605, 0.6546521, 0.9794383, 0.7215686, 1, 0, 1,
-0.693382, 0.9855227, 0.6452396, 0.7176471, 1, 0, 1,
-0.6921585, -0.4034611, -1.885972, 0.7098039, 1, 0, 1,
-0.6897127, -0.3979704, -2.000359, 0.7058824, 1, 0, 1,
-0.6887161, 1.109435, -1.105858, 0.6980392, 1, 0, 1,
-0.6858113, -1.189645, -3.270746, 0.6901961, 1, 0, 1,
-0.6853485, -1.213982, -2.004388, 0.6862745, 1, 0, 1,
-0.6850313, -0.7362826, -3.039647, 0.6784314, 1, 0, 1,
-0.6799019, -0.3593344, -4.307407, 0.6745098, 1, 0, 1,
-0.6767044, -0.7202126, -3.625885, 0.6666667, 1, 0, 1,
-0.6766083, -0.7767025, -3.845188, 0.6627451, 1, 0, 1,
-0.6744581, -0.4611187, -1.766666, 0.654902, 1, 0, 1,
-0.6672376, -2.067342, -3.092711, 0.6509804, 1, 0, 1,
-0.6593043, 0.8059853, -0.3229743, 0.6431373, 1, 0, 1,
-0.6409655, -1.10908, -0.667255, 0.6392157, 1, 0, 1,
-0.6316856, 1.425985, -0.3330281, 0.6313726, 1, 0, 1,
-0.6268279, 0.3846315, -3.352581, 0.627451, 1, 0, 1,
-0.6228677, 0.768157, 0.4683725, 0.6196079, 1, 0, 1,
-0.6153842, 1.257117, -0.0103582, 0.6156863, 1, 0, 1,
-0.6141783, 0.7221988, -1.485176, 0.6078432, 1, 0, 1,
-0.6118171, 0.5551837, -0.7860596, 0.6039216, 1, 0, 1,
-0.6105331, 0.8070351, -1.216915, 0.5960785, 1, 0, 1,
-0.6091658, -1.866791, -2.650255, 0.5882353, 1, 0, 1,
-0.6069528, 0.05996225, -0.7066713, 0.5843138, 1, 0, 1,
-0.6062661, -0.5700366, -2.061496, 0.5764706, 1, 0, 1,
-0.6056026, 0.3437333, -0.8458939, 0.572549, 1, 0, 1,
-0.6053098, -0.7154503, -1.457516, 0.5647059, 1, 0, 1,
-0.600724, 0.1052527, -1.991219, 0.5607843, 1, 0, 1,
-0.5999737, -0.9187803, -1.573611, 0.5529412, 1, 0, 1,
-0.5995559, 1.274507, -0.3231558, 0.5490196, 1, 0, 1,
-0.5993778, -1.515268, -2.801596, 0.5411765, 1, 0, 1,
-0.5988333, -2.592561, -3.048567, 0.5372549, 1, 0, 1,
-0.5977956, -1.763295, -4.556288, 0.5294118, 1, 0, 1,
-0.5972112, 1.00234, 0.4708472, 0.5254902, 1, 0, 1,
-0.5962479, 0.4042939, -0.5015301, 0.5176471, 1, 0, 1,
-0.5854498, -0.7153946, -3.097079, 0.5137255, 1, 0, 1,
-0.5822892, -0.05659851, -0.8061043, 0.5058824, 1, 0, 1,
-0.578573, -1.234353, -4.210579, 0.5019608, 1, 0, 1,
-0.5755125, -0.9357961, -2.408052, 0.4941176, 1, 0, 1,
-0.571787, -1.268028, -3.661092, 0.4862745, 1, 0, 1,
-0.56954, 0.193851, -1.370347, 0.4823529, 1, 0, 1,
-0.5656531, -1.227305, -2.366618, 0.4745098, 1, 0, 1,
-0.564415, -1.504185, -1.933303, 0.4705882, 1, 0, 1,
-0.5618531, -0.4598171, -1.071311, 0.4627451, 1, 0, 1,
-0.5608701, 1.12676, -0.3575283, 0.4588235, 1, 0, 1,
-0.5583529, -0.8349841, -2.826137, 0.4509804, 1, 0, 1,
-0.5575206, 0.2882117, -1.579043, 0.4470588, 1, 0, 1,
-0.5545478, 1.318787, 0.08478894, 0.4392157, 1, 0, 1,
-0.5504327, 1.513179, 0.1221789, 0.4352941, 1, 0, 1,
-0.5422737, 0.03627991, 0.00642476, 0.427451, 1, 0, 1,
-0.530758, -0.2468643, 0.5276187, 0.4235294, 1, 0, 1,
-0.5288413, -1.176751, -1.793109, 0.4156863, 1, 0, 1,
-0.5253779, -0.1258352, -1.924285, 0.4117647, 1, 0, 1,
-0.5244097, 0.8662684, -0.08111726, 0.4039216, 1, 0, 1,
-0.5240839, 0.3662679, -1.127626, 0.3960784, 1, 0, 1,
-0.5237893, 1.504587, 0.761158, 0.3921569, 1, 0, 1,
-0.5210549, -1.24491, -3.770663, 0.3843137, 1, 0, 1,
-0.5187045, -0.4257837, -1.952117, 0.3803922, 1, 0, 1,
-0.5185733, 0.7266878, 0.1123952, 0.372549, 1, 0, 1,
-0.5184586, -0.3705688, -1.294722, 0.3686275, 1, 0, 1,
-0.5133864, -0.4081003, -0.5652446, 0.3607843, 1, 0, 1,
-0.5120968, 0.3626203, 1.965175, 0.3568628, 1, 0, 1,
-0.5108915, 0.3608004, -1.30659, 0.3490196, 1, 0, 1,
-0.5097185, 0.2974891, -0.6891249, 0.345098, 1, 0, 1,
-0.5009073, -0.6824901, -3.221344, 0.3372549, 1, 0, 1,
-0.4986945, -0.2513455, -0.1607383, 0.3333333, 1, 0, 1,
-0.4936487, 0.9176582, 0.03669796, 0.3254902, 1, 0, 1,
-0.485412, 0.9639372, 0.9848859, 0.3215686, 1, 0, 1,
-0.4850225, -0.264473, -1.670249, 0.3137255, 1, 0, 1,
-0.4825314, -0.6769493, -3.805445, 0.3098039, 1, 0, 1,
-0.4778499, -1.62249, -2.264423, 0.3019608, 1, 0, 1,
-0.4775079, 0.7532647, -0.5574234, 0.2941177, 1, 0, 1,
-0.4772381, -0.8430475, -0.8903419, 0.2901961, 1, 0, 1,
-0.467464, -0.658582, -0.02078801, 0.282353, 1, 0, 1,
-0.4667305, 2.615807, -0.43367, 0.2784314, 1, 0, 1,
-0.4632885, 0.3594238, -2.507563, 0.2705882, 1, 0, 1,
-0.460374, 1.233845, -0.4110123, 0.2666667, 1, 0, 1,
-0.4564914, 0.5157415, -0.7561086, 0.2588235, 1, 0, 1,
-0.4479479, 0.2843455, -0.8932387, 0.254902, 1, 0, 1,
-0.4329614, -0.4745526, -3.612527, 0.2470588, 1, 0, 1,
-0.432168, 0.05825748, -2.805268, 0.2431373, 1, 0, 1,
-0.427464, 2.219082, 0.3090571, 0.2352941, 1, 0, 1,
-0.4257186, 0.2317544, -0.8219442, 0.2313726, 1, 0, 1,
-0.4256907, 1.175338, 0.9400291, 0.2235294, 1, 0, 1,
-0.4246998, 2.675256, 1.319139, 0.2196078, 1, 0, 1,
-0.4224489, 1.001599, -0.4075748, 0.2117647, 1, 0, 1,
-0.4220574, 0.1470505, -1.421853, 0.2078431, 1, 0, 1,
-0.4211128, 0.519854, -1.457755, 0.2, 1, 0, 1,
-0.4167466, -0.4780847, -1.509457, 0.1921569, 1, 0, 1,
-0.4156333, -1.058541, -1.571365, 0.1882353, 1, 0, 1,
-0.4072109, 1.810678, 0.621992, 0.1803922, 1, 0, 1,
-0.4054951, -0.324061, -1.590366, 0.1764706, 1, 0, 1,
-0.4035541, 0.6312328, -1.019709, 0.1686275, 1, 0, 1,
-0.4024849, -0.3229025, -4.425253, 0.1647059, 1, 0, 1,
-0.3983816, 0.3117284, -2.743985, 0.1568628, 1, 0, 1,
-0.3961961, 1.205763, 2.726715, 0.1529412, 1, 0, 1,
-0.3915246, -0.6502053, -2.932047, 0.145098, 1, 0, 1,
-0.3896646, 1.374064, 1.59033, 0.1411765, 1, 0, 1,
-0.3882656, -0.4070587, -2.153502, 0.1333333, 1, 0, 1,
-0.3867485, -2.137854, -3.376972, 0.1294118, 1, 0, 1,
-0.3834969, -1.731758, -3.160206, 0.1215686, 1, 0, 1,
-0.3813925, -0.133197, -3.13289, 0.1176471, 1, 0, 1,
-0.3747554, 1.057815, -0.9482584, 0.1098039, 1, 0, 1,
-0.3721053, -0.2163904, -3.375615, 0.1058824, 1, 0, 1,
-0.3694664, -0.1761603, -1.5368, 0.09803922, 1, 0, 1,
-0.3619121, 0.9688933, -0.9370292, 0.09019608, 1, 0, 1,
-0.3614426, 0.3970689, -0.06274804, 0.08627451, 1, 0, 1,
-0.3605193, 0.54159, -0.9886494, 0.07843138, 1, 0, 1,
-0.3604759, -0.4567311, -3.791156, 0.07450981, 1, 0, 1,
-0.3508337, -1.63673, -4.442352, 0.06666667, 1, 0, 1,
-0.3478034, 0.5526171, -0.1934579, 0.0627451, 1, 0, 1,
-0.3474464, 0.9822611, 2.387434, 0.05490196, 1, 0, 1,
-0.345096, 0.7720157, 1.254381, 0.05098039, 1, 0, 1,
-0.3380963, 0.7515486, 0.2375165, 0.04313726, 1, 0, 1,
-0.3360795, -2.821151, -2.621488, 0.03921569, 1, 0, 1,
-0.3329472, 0.07436635, -3.481301, 0.03137255, 1, 0, 1,
-0.3293284, 0.03571339, -0.8786007, 0.02745098, 1, 0, 1,
-0.3288872, 0.6545635, 1.117467, 0.01960784, 1, 0, 1,
-0.3248713, 1.02626, -0.2924189, 0.01568628, 1, 0, 1,
-0.3234769, -1.488922, -2.13228, 0.007843138, 1, 0, 1,
-0.3225235, 0.1773085, -1.831274, 0.003921569, 1, 0, 1,
-0.3224204, 2.005887, 0.03470495, 0, 1, 0.003921569, 1,
-0.3183551, -0.2381345, -1.761035, 0, 1, 0.01176471, 1,
-0.317576, 1.371708, -1.284178, 0, 1, 0.01568628, 1,
-0.3166222, -0.4857127, -3.500308, 0, 1, 0.02352941, 1,
-0.3149655, 1.12058, 0.5975134, 0, 1, 0.02745098, 1,
-0.3125165, -0.7374992, -2.47548, 0, 1, 0.03529412, 1,
-0.3083288, 0.7943496, -0.2575766, 0, 1, 0.03921569, 1,
-0.3016191, -3.04442, -5.20809, 0, 1, 0.04705882, 1,
-0.2993864, 1.107411, -2.260834, 0, 1, 0.05098039, 1,
-0.2978519, 0.9163545, -1.518048, 0, 1, 0.05882353, 1,
-0.2971685, 2.228081, -0.3274478, 0, 1, 0.0627451, 1,
-0.2971659, -0.04010852, -2.032789, 0, 1, 0.07058824, 1,
-0.2935947, 0.05825148, -1.7276, 0, 1, 0.07450981, 1,
-0.2931722, 1.225359, -0.7777528, 0, 1, 0.08235294, 1,
-0.2927958, -0.9572185, -4.519549, 0, 1, 0.08627451, 1,
-0.2926897, 0.9402623, 0.8347951, 0, 1, 0.09411765, 1,
-0.29071, 0.5716725, 1.382673, 0, 1, 0.1019608, 1,
-0.2899349, 0.06029326, -1.60575, 0, 1, 0.1058824, 1,
-0.2884526, 0.674105, -1.229623, 0, 1, 0.1137255, 1,
-0.2876008, -0.7745469, -2.724061, 0, 1, 0.1176471, 1,
-0.2818866, -1.01307, -4.862581, 0, 1, 0.1254902, 1,
-0.2802896, 2.127905, -0.4115703, 0, 1, 0.1294118, 1,
-0.275672, -0.430912, -2.698362, 0, 1, 0.1372549, 1,
-0.2749459, 1.540962, -0.5308154, 0, 1, 0.1411765, 1,
-0.2738655, 2.361581, 0.5319163, 0, 1, 0.1490196, 1,
-0.2633589, 0.5811873, 0.1850604, 0, 1, 0.1529412, 1,
-0.2624205, -1.08872, -3.173648, 0, 1, 0.1607843, 1,
-0.2622163, 0.6754123, 0.3740215, 0, 1, 0.1647059, 1,
-0.2609099, 1.435374, -1.38107, 0, 1, 0.172549, 1,
-0.2597907, 0.4640129, -0.09318174, 0, 1, 0.1764706, 1,
-0.2575966, -0.5038195, -1.71945, 0, 1, 0.1843137, 1,
-0.2565316, 0.2466941, 1.361707, 0, 1, 0.1882353, 1,
-0.2564205, -2.361404, -4.417953, 0, 1, 0.1960784, 1,
-0.2549998, -0.8602327, -2.503722, 0, 1, 0.2039216, 1,
-0.2469454, -1.070456, -3.84621, 0, 1, 0.2078431, 1,
-0.2469126, 0.04378412, -1.026479, 0, 1, 0.2156863, 1,
-0.2459638, -3.838959, -2.557571, 0, 1, 0.2196078, 1,
-0.2383619, -0.9042558, -4.092372, 0, 1, 0.227451, 1,
-0.2357345, -0.1351822, -0.7296205, 0, 1, 0.2313726, 1,
-0.2340688, -1.474283, -2.420621, 0, 1, 0.2392157, 1,
-0.2284893, 1.270536, 2.601465, 0, 1, 0.2431373, 1,
-0.2261861, 0.8237594, 1.745987, 0, 1, 0.2509804, 1,
-0.2212737, 1.014742, 0.42057, 0, 1, 0.254902, 1,
-0.2150399, -0.2062465, -1.858752, 0, 1, 0.2627451, 1,
-0.2137074, 0.5982371, 0.2976114, 0, 1, 0.2666667, 1,
-0.2118827, 0.6974075, 1.129043, 0, 1, 0.2745098, 1,
-0.2071454, 2.104314, -0.7457304, 0, 1, 0.2784314, 1,
-0.2032574, -1.221457, -3.106542, 0, 1, 0.2862745, 1,
-0.2028778, -0.03145589, -3.823636, 0, 1, 0.2901961, 1,
-0.2009967, -0.4882038, -4.538769, 0, 1, 0.2980392, 1,
-0.199513, -0.9842063, -2.245341, 0, 1, 0.3058824, 1,
-0.194313, -0.3198331, -2.367849, 0, 1, 0.3098039, 1,
-0.1894035, -0.9543513, -2.89992, 0, 1, 0.3176471, 1,
-0.1862199, 0.9309367, -0.1983131, 0, 1, 0.3215686, 1,
-0.183484, 0.9374296, -1.102957, 0, 1, 0.3294118, 1,
-0.1773508, 0.03287299, -1.383365, 0, 1, 0.3333333, 1,
-0.1721872, 2.046214, -0.255029, 0, 1, 0.3411765, 1,
-0.1713884, -1.580282, -3.589589, 0, 1, 0.345098, 1,
-0.1709629, 2.011997, 1.258772, 0, 1, 0.3529412, 1,
-0.1704032, -0.8023315, -1.512084, 0, 1, 0.3568628, 1,
-0.1680117, -0.6725535, -6.380745, 0, 1, 0.3647059, 1,
-0.1635201, -0.3779556, -2.843958, 0, 1, 0.3686275, 1,
-0.1623072, 0.3159381, 0.7954288, 0, 1, 0.3764706, 1,
-0.1620582, -0.3113187, -1.925165, 0, 1, 0.3803922, 1,
-0.157977, -0.7088679, -3.767663, 0, 1, 0.3882353, 1,
-0.1533214, 1.386551, -0.4172515, 0, 1, 0.3921569, 1,
-0.1522867, 0.64468, 0.8360028, 0, 1, 0.4, 1,
-0.1518615, 0.4615955, 0.6434497, 0, 1, 0.4078431, 1,
-0.1478982, -1.157405, -4.219478, 0, 1, 0.4117647, 1,
-0.1433558, 0.7228252, -0.2916055, 0, 1, 0.4196078, 1,
-0.1382245, -0.6849306, -2.041027, 0, 1, 0.4235294, 1,
-0.137454, -0.891734, -3.790333, 0, 1, 0.4313726, 1,
-0.1368185, 0.8675777, 0.3928563, 0, 1, 0.4352941, 1,
-0.1296787, -1.518045, -2.040496, 0, 1, 0.4431373, 1,
-0.1277332, -0.2564289, -0.8981358, 0, 1, 0.4470588, 1,
-0.1230665, 0.6213479, -1.044274, 0, 1, 0.454902, 1,
-0.1153924, 0.6344391, 1.177734, 0, 1, 0.4588235, 1,
-0.1121793, 0.4161333, -0.2446597, 0, 1, 0.4666667, 1,
-0.1068643, 1.4637, 0.6234178, 0, 1, 0.4705882, 1,
-0.1048568, 0.4467233, 0.3008001, 0, 1, 0.4784314, 1,
-0.1036543, -0.3363608, -2.513103, 0, 1, 0.4823529, 1,
-0.09485385, 1.5371, -0.6344614, 0, 1, 0.4901961, 1,
-0.09455772, -1.041932, -2.444747, 0, 1, 0.4941176, 1,
-0.08863476, -1.086258, -3.557936, 0, 1, 0.5019608, 1,
-0.08298961, 2.55945, -1.37426, 0, 1, 0.509804, 1,
-0.07989696, 0.6468154, -0.5573954, 0, 1, 0.5137255, 1,
-0.07870401, 0.4542445, 1.733979, 0, 1, 0.5215687, 1,
-0.07694123, 0.6348543, 1.163705, 0, 1, 0.5254902, 1,
-0.07606538, -0.08330722, -3.221043, 0, 1, 0.5333334, 1,
-0.07597169, -0.4714368, -3.837123, 0, 1, 0.5372549, 1,
-0.05907612, -0.7442796, -2.952152, 0, 1, 0.5450981, 1,
-0.0586874, -0.2708319, -2.892039, 0, 1, 0.5490196, 1,
-0.05567251, 0.3154511, 1.242637, 0, 1, 0.5568628, 1,
-0.05341522, -0.2069547, -2.043822, 0, 1, 0.5607843, 1,
-0.05210472, 0.6196012, 1.734815, 0, 1, 0.5686275, 1,
-0.04855481, -0.4921429, -3.406819, 0, 1, 0.572549, 1,
-0.04513063, 1.169199, 0.6096096, 0, 1, 0.5803922, 1,
-0.04373497, -0.0009886881, -1.80886, 0, 1, 0.5843138, 1,
-0.02824267, -0.1036927, -3.62306, 0, 1, 0.5921569, 1,
-0.02771055, 1.33736, -0.9530358, 0, 1, 0.5960785, 1,
-0.02303089, 0.3940592, -0.269339, 0, 1, 0.6039216, 1,
-0.01705655, -1.613762, -2.002413, 0, 1, 0.6117647, 1,
-0.01538967, -0.5475569, -5.580492, 0, 1, 0.6156863, 1,
-0.01109798, -0.2886981, -3.510769, 0, 1, 0.6235294, 1,
-0.01104075, 0.6197252, -0.08560237, 0, 1, 0.627451, 1,
-0.01053979, 1.704211, -1.909956, 0, 1, 0.6352941, 1,
-0.006416622, 1.043702, -0.244789, 0, 1, 0.6392157, 1,
-0.005495335, -1.438747, -2.530464, 0, 1, 0.6470588, 1,
-0.004711145, -0.4473295, -3.195099, 0, 1, 0.6509804, 1,
-0.002740985, 1.794994, 1.733073, 0, 1, 0.6588235, 1,
-0.002534814, 0.7615383, 1.129321, 0, 1, 0.6627451, 1,
-0.002457327, -0.4145689, -1.905862, 0, 1, 0.6705883, 1,
-0.00157153, 0.8973204, -1.01127, 0, 1, 0.6745098, 1,
-0.001286299, 0.03102765, -0.02282123, 0, 1, 0.682353, 1,
-3.714245e-05, -0.5840061, -2.885381, 0, 1, 0.6862745, 1,
0.0004930298, -2.317981, 1.71673, 0, 1, 0.6941177, 1,
0.001559333, 0.6204525, -1.009404, 0, 1, 0.7019608, 1,
0.003511593, -0.954246, 2.05427, 0, 1, 0.7058824, 1,
0.005580625, 1.65868, 1.975283, 0, 1, 0.7137255, 1,
0.009087023, 0.02423249, 0.1740364, 0, 1, 0.7176471, 1,
0.01170511, -1.469758, 3.369313, 0, 1, 0.7254902, 1,
0.01192195, 0.5782849, -0.9647948, 0, 1, 0.7294118, 1,
0.01315851, -0.4666949, 1.61741, 0, 1, 0.7372549, 1,
0.01536995, 0.7842643, 1.704357, 0, 1, 0.7411765, 1,
0.01743666, -0.5030125, 4.89471, 0, 1, 0.7490196, 1,
0.02103641, 1.385877, -0.1479484, 0, 1, 0.7529412, 1,
0.02420177, 0.8358633, 0.8752457, 0, 1, 0.7607843, 1,
0.02534003, 0.7577092, -1.025688, 0, 1, 0.7647059, 1,
0.03022898, -1.229157, 4.043468, 0, 1, 0.772549, 1,
0.0307272, 0.6284587, 0.3908513, 0, 1, 0.7764706, 1,
0.03582135, -0.8675848, 3.02953, 0, 1, 0.7843137, 1,
0.04010282, -0.0989901, 2.632206, 0, 1, 0.7882353, 1,
0.04279065, 0.1619682, 0.7061754, 0, 1, 0.7960784, 1,
0.04665421, 0.5461736, -1.407342, 0, 1, 0.8039216, 1,
0.05022292, -0.8402238, 3.979865, 0, 1, 0.8078431, 1,
0.05198478, 0.6387522, 1.347255, 0, 1, 0.8156863, 1,
0.05344785, -0.7383101, 1.864848, 0, 1, 0.8196079, 1,
0.0534692, 2.979077, 0.05652342, 0, 1, 0.827451, 1,
0.05406136, -0.866137, 1.821765, 0, 1, 0.8313726, 1,
0.05679948, 1.021796, -0.2857089, 0, 1, 0.8392157, 1,
0.05956092, -0.03763974, 1.58433, 0, 1, 0.8431373, 1,
0.06527671, -0.708226, 3.922582, 0, 1, 0.8509804, 1,
0.06559702, 0.5219678, -0.3290612, 0, 1, 0.854902, 1,
0.06957223, -0.3430366, 2.81928, 0, 1, 0.8627451, 1,
0.06995345, -0.04780788, 2.231456, 0, 1, 0.8666667, 1,
0.07900245, -0.6642472, 3.647608, 0, 1, 0.8745098, 1,
0.07973485, 0.2264633, 0.009664344, 0, 1, 0.8784314, 1,
0.08397233, 1.50057, -1.056035, 0, 1, 0.8862745, 1,
0.0848323, -0.5721751, 2.565857, 0, 1, 0.8901961, 1,
0.08546031, -0.3825862, 4.09596, 0, 1, 0.8980392, 1,
0.08587356, -1.892674, 1.659128, 0, 1, 0.9058824, 1,
0.0874924, -1.882272, 3.259807, 0, 1, 0.9098039, 1,
0.09325139, 0.2092067, -0.0006504873, 0, 1, 0.9176471, 1,
0.09551159, -0.4089106, 3.318401, 0, 1, 0.9215686, 1,
0.09934248, 0.9172069, 1.301206, 0, 1, 0.9294118, 1,
0.1083764, -0.2474678, 1.722272, 0, 1, 0.9333333, 1,
0.1192785, -0.9458072, 3.718902, 0, 1, 0.9411765, 1,
0.1192795, -0.05391238, -0.4658171, 0, 1, 0.945098, 1,
0.1203835, 0.09504022, 0.2317349, 0, 1, 0.9529412, 1,
0.1222232, -0.3748969, 3.56533, 0, 1, 0.9568627, 1,
0.1222863, 0.01310555, 2.461576, 0, 1, 0.9647059, 1,
0.1236658, 0.6904717, -0.4093182, 0, 1, 0.9686275, 1,
0.1238612, -0.8123521, 3.106535, 0, 1, 0.9764706, 1,
0.1254622, 1.149643, -1.811789, 0, 1, 0.9803922, 1,
0.1262349, 0.2327106, 0.5512657, 0, 1, 0.9882353, 1,
0.1286717, 0.6790698, 0.5563307, 0, 1, 0.9921569, 1,
0.1287648, -0.02965948, 1.579499, 0, 1, 1, 1,
0.1305582, 0.3676623, 1.380349, 0, 0.9921569, 1, 1,
0.1318621, 0.5189224, -0.6298954, 0, 0.9882353, 1, 1,
0.1336278, -2.622402, 4.261104, 0, 0.9803922, 1, 1,
0.1347172, -0.9328655, 2.773266, 0, 0.9764706, 1, 1,
0.1351233, 1.741269, -2.193807, 0, 0.9686275, 1, 1,
0.1359455, -0.3921283, 2.69305, 0, 0.9647059, 1, 1,
0.1389715, 0.3864519, -2.810387, 0, 0.9568627, 1, 1,
0.1416001, -0.5186133, 3.432135, 0, 0.9529412, 1, 1,
0.1451728, 1.748817, -0.7899936, 0, 0.945098, 1, 1,
0.1465271, -0.6625104, 3.445393, 0, 0.9411765, 1, 1,
0.1472671, 0.2326989, 2.236013, 0, 0.9333333, 1, 1,
0.1498729, 0.1753341, -0.03142224, 0, 0.9294118, 1, 1,
0.1504803, -0.2813537, 1.04653, 0, 0.9215686, 1, 1,
0.1513677, 0.1576578, -0.6392237, 0, 0.9176471, 1, 1,
0.1574005, -0.3031268, 1.569025, 0, 0.9098039, 1, 1,
0.1586291, 0.6987659, -0.2461615, 0, 0.9058824, 1, 1,
0.1594785, -1.959708, 2.966691, 0, 0.8980392, 1, 1,
0.1603744, 0.5281442, -0.7531143, 0, 0.8901961, 1, 1,
0.1729868, 0.7150285, -1.781409, 0, 0.8862745, 1, 1,
0.1771836, 0.7995248, 0.967707, 0, 0.8784314, 1, 1,
0.1867913, -0.6111314, 2.611954, 0, 0.8745098, 1, 1,
0.1954168, -0.05242443, 0.9677308, 0, 0.8666667, 1, 1,
0.1977169, 0.6175417, -0.1937406, 0, 0.8627451, 1, 1,
0.2010666, 1.062349, 0.1724102, 0, 0.854902, 1, 1,
0.2029182, -1.195695, 1.624923, 0, 0.8509804, 1, 1,
0.2038042, 0.9896096, 0.06551606, 0, 0.8431373, 1, 1,
0.2153298, -1.186134, 1.891797, 0, 0.8392157, 1, 1,
0.2231684, 0.4700204, 0.1594834, 0, 0.8313726, 1, 1,
0.2255698, 0.344088, 0.2925118, 0, 0.827451, 1, 1,
0.2349263, -0.9593413, 1.952807, 0, 0.8196079, 1, 1,
0.2371899, -1.048011, 2.080684, 0, 0.8156863, 1, 1,
0.2399348, -1.486748, 3.525808, 0, 0.8078431, 1, 1,
0.2492799, -0.3514639, 0.8810789, 0, 0.8039216, 1, 1,
0.2515458, 1.486838, -0.552658, 0, 0.7960784, 1, 1,
0.2534474, 0.5542858, -0.7308233, 0, 0.7882353, 1, 1,
0.2550557, 0.3403037, 0.8888747, 0, 0.7843137, 1, 1,
0.2576815, 0.7672638, 1.978591, 0, 0.7764706, 1, 1,
0.2586024, 1.070109, 1.048579, 0, 0.772549, 1, 1,
0.2586536, -0.2799935, 3.858396, 0, 0.7647059, 1, 1,
0.2603565, -1.692059, 3.753335, 0, 0.7607843, 1, 1,
0.2626117, 0.5636105, 0.4047127, 0, 0.7529412, 1, 1,
0.2637915, -0.8503509, 2.313227, 0, 0.7490196, 1, 1,
0.2648747, -0.1343833, 1.940163, 0, 0.7411765, 1, 1,
0.2691231, -0.9727291, 2.925307, 0, 0.7372549, 1, 1,
0.2719635, 0.2105429, 0.9008495, 0, 0.7294118, 1, 1,
0.2760013, 0.3687865, 0.45766, 0, 0.7254902, 1, 1,
0.2767236, -1.744495, 3.288996, 0, 0.7176471, 1, 1,
0.2818353, 0.9615254, 1.167656, 0, 0.7137255, 1, 1,
0.2844677, -1.513109, 2.190058, 0, 0.7058824, 1, 1,
0.2862974, 0.1099336, 1.096784, 0, 0.6980392, 1, 1,
0.2879119, 0.6481149, 0.4272806, 0, 0.6941177, 1, 1,
0.2954971, 1.251472, -0.09564266, 0, 0.6862745, 1, 1,
0.2962579, 0.6117818, 1.75086, 0, 0.682353, 1, 1,
0.2963248, 0.8355993, -0.6679508, 0, 0.6745098, 1, 1,
0.2968009, 0.4663056, -0.9379714, 0, 0.6705883, 1, 1,
0.2980891, -0.0564509, 1.155066, 0, 0.6627451, 1, 1,
0.3005396, 0.2605777, 0.2392572, 0, 0.6588235, 1, 1,
0.3036789, -0.6592519, 3.144101, 0, 0.6509804, 1, 1,
0.3041097, -0.4066148, 3.138832, 0, 0.6470588, 1, 1,
0.305634, 0.8252504, -0.8205726, 0, 0.6392157, 1, 1,
0.3058169, -1.648495, 4.000652, 0, 0.6352941, 1, 1,
0.3097353, -2.136549, 4.482417, 0, 0.627451, 1, 1,
0.309903, -0.3114602, 0.1753425, 0, 0.6235294, 1, 1,
0.3118659, -1.560521, 1.941216, 0, 0.6156863, 1, 1,
0.3125806, 0.1361246, 0.7282524, 0, 0.6117647, 1, 1,
0.3158461, -0.8211117, 1.985929, 0, 0.6039216, 1, 1,
0.3172329, -1.925691, 3.099768, 0, 0.5960785, 1, 1,
0.3182802, 0.367814, 1.193166, 0, 0.5921569, 1, 1,
0.320861, 1.312543, -0.4629185, 0, 0.5843138, 1, 1,
0.3263034, 1.524741, -0.9971402, 0, 0.5803922, 1, 1,
0.3353537, -0.651373, 1.906736, 0, 0.572549, 1, 1,
0.3367083, -0.3304761, 2.943387, 0, 0.5686275, 1, 1,
0.3380243, 0.03792191, 2.903024, 0, 0.5607843, 1, 1,
0.3448485, 1.164604, 0.1641724, 0, 0.5568628, 1, 1,
0.3452794, 0.8011103, 0.2147824, 0, 0.5490196, 1, 1,
0.346976, 0.3198365, -0.4036648, 0, 0.5450981, 1, 1,
0.3502451, -1.312225, 1.68704, 0, 0.5372549, 1, 1,
0.3509938, -0.3153571, 2.72466, 0, 0.5333334, 1, 1,
0.3518195, -1.807692, 2.298062, 0, 0.5254902, 1, 1,
0.3537764, -0.2408738, 1.388255, 0, 0.5215687, 1, 1,
0.3563033, 0.7264294, 0.2275344, 0, 0.5137255, 1, 1,
0.3656833, -0.2495957, 3.156411, 0, 0.509804, 1, 1,
0.3676999, 0.6712241, 1.273219, 0, 0.5019608, 1, 1,
0.368176, -0.2369577, 1.57667, 0, 0.4941176, 1, 1,
0.3718537, -1.860566, 3.111903, 0, 0.4901961, 1, 1,
0.3722369, 1.029614, 0.176333, 0, 0.4823529, 1, 1,
0.3730685, 0.3510456, 1.880349, 0, 0.4784314, 1, 1,
0.3745777, 0.4714794, 0.5566003, 0, 0.4705882, 1, 1,
0.3749976, 0.09271982, 0.2519028, 0, 0.4666667, 1, 1,
0.3793599, 0.2802726, -0.02640011, 0, 0.4588235, 1, 1,
0.3801183, 2.611898, -0.8982517, 0, 0.454902, 1, 1,
0.3805096, 1.377142, 1.870698, 0, 0.4470588, 1, 1,
0.3830581, 1.3329, -1.531396, 0, 0.4431373, 1, 1,
0.3840674, -0.7390049, 4.483407, 0, 0.4352941, 1, 1,
0.3841162, 0.6183209, 1.063185, 0, 0.4313726, 1, 1,
0.3868438, -0.6154485, 2.860008, 0, 0.4235294, 1, 1,
0.3874488, 1.297294, 0.185124, 0, 0.4196078, 1, 1,
0.3902758, 0.2880844, 2.280299, 0, 0.4117647, 1, 1,
0.3937474, 0.5505442, 2.920908, 0, 0.4078431, 1, 1,
0.3968568, 0.06764404, 0.0143691, 0, 0.4, 1, 1,
0.3971393, -1.153618, 2.861187, 0, 0.3921569, 1, 1,
0.4084522, -1.416161, 2.475485, 0, 0.3882353, 1, 1,
0.4090436, -0.9409564, 0.1575842, 0, 0.3803922, 1, 1,
0.4114074, 1.149231, 1.434449, 0, 0.3764706, 1, 1,
0.4162335, 0.4212686, 2.740066, 0, 0.3686275, 1, 1,
0.4167956, -0.2264496, 3.099221, 0, 0.3647059, 1, 1,
0.42106, -1.264985, 4.070791, 0, 0.3568628, 1, 1,
0.4246642, -1.382543, 3.449555, 0, 0.3529412, 1, 1,
0.4250254, 1.389987, 1.547853, 0, 0.345098, 1, 1,
0.4273228, 0.6427434, 1.686336, 0, 0.3411765, 1, 1,
0.4285192, -1.495106, 3.290792, 0, 0.3333333, 1, 1,
0.4322411, 0.1320029, 1.051018, 0, 0.3294118, 1, 1,
0.4323101, -0.3733752, 1.445887, 0, 0.3215686, 1, 1,
0.4359329, -0.6224247, 2.505446, 0, 0.3176471, 1, 1,
0.4384838, -0.4700596, 2.746486, 0, 0.3098039, 1, 1,
0.4433166, -1.944008, 3.707564, 0, 0.3058824, 1, 1,
0.4438407, 0.148378, 3.108599, 0, 0.2980392, 1, 1,
0.4453719, 0.3341416, 0.9565831, 0, 0.2901961, 1, 1,
0.446903, 0.9161813, -0.2221496, 0, 0.2862745, 1, 1,
0.4474417, -0.4756215, 2.18739, 0, 0.2784314, 1, 1,
0.448245, -0.6190184, 2.381331, 0, 0.2745098, 1, 1,
0.4501009, -0.3083349, 3.232104, 0, 0.2666667, 1, 1,
0.4519196, -0.384019, 3.109463, 0, 0.2627451, 1, 1,
0.4523208, -1.513907, 1.757585, 0, 0.254902, 1, 1,
0.4524251, -2.69402, 2.369608, 0, 0.2509804, 1, 1,
0.4540256, -1.860887, 3.223734, 0, 0.2431373, 1, 1,
0.4544443, -1.615499, 3.999581, 0, 0.2392157, 1, 1,
0.4575154, -0.2032293, 0.2514118, 0, 0.2313726, 1, 1,
0.4630985, -0.7624691, 4.724705, 0, 0.227451, 1, 1,
0.4645692, 0.6028332, 1.5825, 0, 0.2196078, 1, 1,
0.4677946, -0.1949806, 2.21177, 0, 0.2156863, 1, 1,
0.4721442, -0.2736707, 3.287525, 0, 0.2078431, 1, 1,
0.4724358, -1.268499, 4.426937, 0, 0.2039216, 1, 1,
0.4754142, 1.178963, 1.651467, 0, 0.1960784, 1, 1,
0.4779814, -1.240004, 1.558703, 0, 0.1882353, 1, 1,
0.4816194, 1.127806, -1.22012, 0, 0.1843137, 1, 1,
0.4831437, -0.02642387, 2.042679, 0, 0.1764706, 1, 1,
0.4849581, 1.191502, -0.2568247, 0, 0.172549, 1, 1,
0.4875923, -1.754264, 3.282954, 0, 0.1647059, 1, 1,
0.4876997, -0.1067678, 2.595578, 0, 0.1607843, 1, 1,
0.4881656, -0.2192461, 1.431059, 0, 0.1529412, 1, 1,
0.4918788, 0.2712227, 0.8402957, 0, 0.1490196, 1, 1,
0.4925727, 0.05556336, 1.40244, 0, 0.1411765, 1, 1,
0.4949554, -0.8955256, 1.879298, 0, 0.1372549, 1, 1,
0.4951684, 0.2847028, 1.142832, 0, 0.1294118, 1, 1,
0.4976428, 1.24045, 0.9183373, 0, 0.1254902, 1, 1,
0.498588, 1.027312, 0.4403957, 0, 0.1176471, 1, 1,
0.5049204, -0.9542408, 1.718854, 0, 0.1137255, 1, 1,
0.5077173, 1.03906, 0.6290992, 0, 0.1058824, 1, 1,
0.5168394, -0.1706149, 2.758013, 0, 0.09803922, 1, 1,
0.5193841, 0.7434081, 0.186776, 0, 0.09411765, 1, 1,
0.5202015, -0.7551823, 1.105402, 0, 0.08627451, 1, 1,
0.5211667, 1.329947, 1.68219, 0, 0.08235294, 1, 1,
0.5213401, 1.582758, 0.6190107, 0, 0.07450981, 1, 1,
0.5214248, 0.2375821, 1.426154, 0, 0.07058824, 1, 1,
0.5225229, -0.5300097, 1.690941, 0, 0.0627451, 1, 1,
0.526937, -0.1937841, 1.034132, 0, 0.05882353, 1, 1,
0.5272399, 0.6190735, 1.177711, 0, 0.05098039, 1, 1,
0.5306866, -0.910718, 2.936614, 0, 0.04705882, 1, 1,
0.5332253, 0.1786257, 1.592415, 0, 0.03921569, 1, 1,
0.5334629, -0.442377, 2.191706, 0, 0.03529412, 1, 1,
0.5392807, 0.4782794, 0.3250548, 0, 0.02745098, 1, 1,
0.5403548, 0.4400499, 2.301251, 0, 0.02352941, 1, 1,
0.5431478, -0.6128106, 3.879075, 0, 0.01568628, 1, 1,
0.5450188, 0.3595628, 0.904613, 0, 0.01176471, 1, 1,
0.5452494, 0.001060639, 2.10613, 0, 0.003921569, 1, 1,
0.5467756, 0.7198389, 0.2843059, 0.003921569, 0, 1, 1,
0.550174, -1.711926, 3.936531, 0.007843138, 0, 1, 1,
0.5537277, 0.3813902, -0.4333797, 0.01568628, 0, 1, 1,
0.5540026, 1.739211, -0.9439476, 0.01960784, 0, 1, 1,
0.5559012, -0.8998661, 3.270984, 0.02745098, 0, 1, 1,
0.5577316, -0.9270163, 1.758313, 0.03137255, 0, 1, 1,
0.5586439, -0.1178292, 2.40329, 0.03921569, 0, 1, 1,
0.563444, -0.0008541131, 3.04475, 0.04313726, 0, 1, 1,
0.5648735, -1.008054, 2.653155, 0.05098039, 0, 1, 1,
0.5719598, 0.4919917, 0.4760893, 0.05490196, 0, 1, 1,
0.5726021, 0.30495, 0.1662795, 0.0627451, 0, 1, 1,
0.5764265, -0.614818, 1.570715, 0.06666667, 0, 1, 1,
0.5954436, 1.260566, 1.073272, 0.07450981, 0, 1, 1,
0.5969828, 1.567392, 0.7424113, 0.07843138, 0, 1, 1,
0.6045161, -0.4655679, 2.829551, 0.08627451, 0, 1, 1,
0.604758, -0.3183102, 1.819101, 0.09019608, 0, 1, 1,
0.6091947, -0.1209044, 2.610539, 0.09803922, 0, 1, 1,
0.6092659, 0.4220225, 1.750292, 0.1058824, 0, 1, 1,
0.6114491, -0.1967281, 0.2600234, 0.1098039, 0, 1, 1,
0.6135271, -0.1839444, 1.714701, 0.1176471, 0, 1, 1,
0.6156368, -0.3720906, 0.8560163, 0.1215686, 0, 1, 1,
0.616912, -0.0008132657, 0.9883643, 0.1294118, 0, 1, 1,
0.6207189, 0.6608781, 1.657662, 0.1333333, 0, 1, 1,
0.6226127, -0.6895782, 2.149727, 0.1411765, 0, 1, 1,
0.6267179, -2.123214, 2.079486, 0.145098, 0, 1, 1,
0.6286817, -0.7883695, 3.657712, 0.1529412, 0, 1, 1,
0.6298458, -0.9298908, 4.274148, 0.1568628, 0, 1, 1,
0.6301724, 0.006285948, 0.6136003, 0.1647059, 0, 1, 1,
0.6351417, 0.1277385, 2.168516, 0.1686275, 0, 1, 1,
0.6353568, -0.6148985, 1.186179, 0.1764706, 0, 1, 1,
0.638437, 0.03957202, 3.21999, 0.1803922, 0, 1, 1,
0.6421509, 1.56589, -0.3712125, 0.1882353, 0, 1, 1,
0.644981, 1.211167, 1.22154, 0.1921569, 0, 1, 1,
0.6458628, 0.8315498, 0.1661319, 0.2, 0, 1, 1,
0.6469789, -1.081901, 1.685079, 0.2078431, 0, 1, 1,
0.6471123, 0.8795775, 1.30242, 0.2117647, 0, 1, 1,
0.6481847, -1.692086, 2.585552, 0.2196078, 0, 1, 1,
0.6482243, -0.4852733, 0.4805965, 0.2235294, 0, 1, 1,
0.6513904, -0.4982218, 1.562251, 0.2313726, 0, 1, 1,
0.6552857, 0.307909, -0.7980474, 0.2352941, 0, 1, 1,
0.6556813, 0.8715104, 0.7177759, 0.2431373, 0, 1, 1,
0.659234, -0.9759358, 3.47658, 0.2470588, 0, 1, 1,
0.6610773, -0.6100147, 3.205554, 0.254902, 0, 1, 1,
0.6618654, -0.9569014, 3.571126, 0.2588235, 0, 1, 1,
0.6635804, -1.155609, 3.958438, 0.2666667, 0, 1, 1,
0.664439, -0.8069194, 4.157376, 0.2705882, 0, 1, 1,
0.6689942, 0.8899838, 0.5605419, 0.2784314, 0, 1, 1,
0.6692934, -0.1726561, 3.264635, 0.282353, 0, 1, 1,
0.6713404, -2.592239, 2.590825, 0.2901961, 0, 1, 1,
0.6724173, 0.5134861, 1.194349, 0.2941177, 0, 1, 1,
0.6735022, -0.8556365, 2.581305, 0.3019608, 0, 1, 1,
0.6764359, -0.07768071, 1.237893, 0.3098039, 0, 1, 1,
0.6819074, -1.73602, 2.42284, 0.3137255, 0, 1, 1,
0.6847169, -1.245627, 3.312652, 0.3215686, 0, 1, 1,
0.6852785, 0.7640321, -0.8618499, 0.3254902, 0, 1, 1,
0.6858117, -1.457686, 3.737865, 0.3333333, 0, 1, 1,
0.6931149, -0.6181837, 3.077112, 0.3372549, 0, 1, 1,
0.6950734, 0.9300957, 2.355068, 0.345098, 0, 1, 1,
0.6974826, -0.7897858, 2.831074, 0.3490196, 0, 1, 1,
0.6984619, 0.5289477, 0.01488632, 0.3568628, 0, 1, 1,
0.7043834, -0.5360914, 2.156014, 0.3607843, 0, 1, 1,
0.705456, -0.8735493, 1.558146, 0.3686275, 0, 1, 1,
0.7112408, -0.2599247, -0.2552266, 0.372549, 0, 1, 1,
0.7152557, -2.21827, 1.111954, 0.3803922, 0, 1, 1,
0.7153438, 0.508803, -0.1543416, 0.3843137, 0, 1, 1,
0.7183852, -0.4329515, 2.412407, 0.3921569, 0, 1, 1,
0.7231366, -1.253706, 3.463775, 0.3960784, 0, 1, 1,
0.7240975, -0.02267066, 1.927413, 0.4039216, 0, 1, 1,
0.726145, -0.2856662, 2.185341, 0.4117647, 0, 1, 1,
0.7299544, 0.2205522, 0.6882978, 0.4156863, 0, 1, 1,
0.733103, -0.8996937, 2.983739, 0.4235294, 0, 1, 1,
0.7378123, 0.698384, -0.01912586, 0.427451, 0, 1, 1,
0.7381288, -0.9811972, 3.15177, 0.4352941, 0, 1, 1,
0.7386323, -1.315181, 4.907626, 0.4392157, 0, 1, 1,
0.7401623, 0.3391104, 1.815958, 0.4470588, 0, 1, 1,
0.7421626, -0.007111056, 1.12026, 0.4509804, 0, 1, 1,
0.7433009, 0.238158, 0.4748455, 0.4588235, 0, 1, 1,
0.7487045, -2.264375, 1.832635, 0.4627451, 0, 1, 1,
0.7500035, -0.5479305, 2.744077, 0.4705882, 0, 1, 1,
0.7526115, 0.08045155, 2.147052, 0.4745098, 0, 1, 1,
0.7560039, -0.7424024, 2.217474, 0.4823529, 0, 1, 1,
0.7605328, 0.6707732, 0.08774418, 0.4862745, 0, 1, 1,
0.768734, -0.6177205, 0.2006126, 0.4941176, 0, 1, 1,
0.7701409, -0.826252, 1.968243, 0.5019608, 0, 1, 1,
0.7707671, -1.954973, 2.028293, 0.5058824, 0, 1, 1,
0.7732275, 0.1936586, -0.7120612, 0.5137255, 0, 1, 1,
0.7734312, 0.8581743, 0.6218815, 0.5176471, 0, 1, 1,
0.783436, -0.7778262, 2.222412, 0.5254902, 0, 1, 1,
0.7913789, -0.1002831, 1.540481, 0.5294118, 0, 1, 1,
0.7923525, 2.209296, 0.9839244, 0.5372549, 0, 1, 1,
0.7942736, 0.9813278, 2.907013, 0.5411765, 0, 1, 1,
0.7955196, -0.1164534, 1.036377, 0.5490196, 0, 1, 1,
0.7963513, -0.2010678, 0.9197428, 0.5529412, 0, 1, 1,
0.8017452, -0.4269784, 2.362469, 0.5607843, 0, 1, 1,
0.8033952, 0.4997309, 2.000232, 0.5647059, 0, 1, 1,
0.8048582, 0.1302499, 1.71689, 0.572549, 0, 1, 1,
0.8094596, 0.1832345, 0.7526205, 0.5764706, 0, 1, 1,
0.8117276, 0.02783798, 2.879248, 0.5843138, 0, 1, 1,
0.8134196, -0.8445168, 3.306709, 0.5882353, 0, 1, 1,
0.8222501, 0.5724285, 0.3016336, 0.5960785, 0, 1, 1,
0.8256086, -0.7981238, 2.572119, 0.6039216, 0, 1, 1,
0.8263473, 1.290267, -1.783859, 0.6078432, 0, 1, 1,
0.8267692, 1.798958, 1.35488, 0.6156863, 0, 1, 1,
0.8291911, 0.6004534, 0.3847264, 0.6196079, 0, 1, 1,
0.8307514, 0.7665663, 0.4574766, 0.627451, 0, 1, 1,
0.832355, 0.3838499, 1.811025, 0.6313726, 0, 1, 1,
0.8340347, 0.6428483, -0.5917238, 0.6392157, 0, 1, 1,
0.8344959, -1.276534, 4.163422, 0.6431373, 0, 1, 1,
0.8364331, 1.402537, -0.908316, 0.6509804, 0, 1, 1,
0.840637, -0.7420186, 3.162736, 0.654902, 0, 1, 1,
0.8425907, -0.8159615, 2.139656, 0.6627451, 0, 1, 1,
0.8458642, 0.4953671, 0.9797493, 0.6666667, 0, 1, 1,
0.8484374, -0.09622625, 2.345002, 0.6745098, 0, 1, 1,
0.8494728, 0.9975657, 1.606619, 0.6784314, 0, 1, 1,
0.8517169, -0.05013488, 1.628819, 0.6862745, 0, 1, 1,
0.8534692, -0.4078771, 1.212168, 0.6901961, 0, 1, 1,
0.8537115, -1.17914, 2.335222, 0.6980392, 0, 1, 1,
0.8591936, -0.6105581, 1.611336, 0.7058824, 0, 1, 1,
0.8595853, 0.3342306, 1.962498, 0.7098039, 0, 1, 1,
0.8618471, 0.1509336, 3.555131, 0.7176471, 0, 1, 1,
0.8632492, -0.6603042, 2.987262, 0.7215686, 0, 1, 1,
0.864227, -0.02945684, 2.154371, 0.7294118, 0, 1, 1,
0.8648729, -0.7475717, 2.559154, 0.7333333, 0, 1, 1,
0.8669572, -0.7681223, 0.1415043, 0.7411765, 0, 1, 1,
0.8724357, 0.769575, 0.4533789, 0.7450981, 0, 1, 1,
0.8750577, 0.06860784, 1.112492, 0.7529412, 0, 1, 1,
0.8811932, 1.208095, -0.73274, 0.7568628, 0, 1, 1,
0.8828181, -0.7605191, 2.681437, 0.7647059, 0, 1, 1,
0.8856164, -1.025052, 3.265213, 0.7686275, 0, 1, 1,
0.8991556, 0.972032, 0.5408717, 0.7764706, 0, 1, 1,
0.8997999, 0.8969076, 0.1546971, 0.7803922, 0, 1, 1,
0.8999913, -0.241466, 0.8027939, 0.7882353, 0, 1, 1,
0.901287, 0.02803629, 0.8913124, 0.7921569, 0, 1, 1,
0.903801, -2.168456, 3.480726, 0.8, 0, 1, 1,
0.9047052, -0.321389, 1.561674, 0.8078431, 0, 1, 1,
0.9111193, -0.4943474, 1.93374, 0.8117647, 0, 1, 1,
0.9169091, 1.454124, -1.233737, 0.8196079, 0, 1, 1,
0.9239292, 0.6855615, -0.0696532, 0.8235294, 0, 1, 1,
0.9243411, -0.2375274, 1.489673, 0.8313726, 0, 1, 1,
0.9244226, -1.374709, 3.653281, 0.8352941, 0, 1, 1,
0.9332552, -0.1416484, 2.189267, 0.8431373, 0, 1, 1,
0.9368834, 1.051878, 1.776882, 0.8470588, 0, 1, 1,
0.9435144, -0.7595932, 2.46005, 0.854902, 0, 1, 1,
0.9442502, 1.297612, -0.11275, 0.8588235, 0, 1, 1,
0.9521149, -1.419087, 3.623139, 0.8666667, 0, 1, 1,
0.9546728, 0.455767, 0.9064631, 0.8705882, 0, 1, 1,
0.9576335, 0.07891466, 2.047435, 0.8784314, 0, 1, 1,
0.9626261, 0.7152866, 0.1147631, 0.8823529, 0, 1, 1,
0.9648338, -0.4635581, 2.95814, 0.8901961, 0, 1, 1,
0.9732879, 0.5754445, -0.9902335, 0.8941177, 0, 1, 1,
0.9759283, 0.007268643, -0.03982123, 0.9019608, 0, 1, 1,
0.9772314, 0.7513633, 1.391635, 0.9098039, 0, 1, 1,
0.9782971, 0.1170854, 0.7321113, 0.9137255, 0, 1, 1,
1.001474, 0.09533328, 0.8814363, 0.9215686, 0, 1, 1,
1.006211, 0.09723619, 2.618953, 0.9254902, 0, 1, 1,
1.006422, -0.5989968, 2.532595, 0.9333333, 0, 1, 1,
1.007157, -1.660107, 2.011602, 0.9372549, 0, 1, 1,
1.010097, 1.844338, 1.695872, 0.945098, 0, 1, 1,
1.01063, -0.2015823, 1.655493, 0.9490196, 0, 1, 1,
1.011775, 1.37105, 1.094034, 0.9568627, 0, 1, 1,
1.015028, 0.08797295, 1.314534, 0.9607843, 0, 1, 1,
1.022279, -0.1966775, 2.089164, 0.9686275, 0, 1, 1,
1.046278, 0.3732573, 2.54125, 0.972549, 0, 1, 1,
1.050108, 1.351255, -1.72793, 0.9803922, 0, 1, 1,
1.058545, -0.9739096, 1.111157, 0.9843137, 0, 1, 1,
1.067147, 1.610112, 0.5264997, 0.9921569, 0, 1, 1,
1.06835, 0.5417003, 0.9808149, 0.9960784, 0, 1, 1,
1.072298, -0.2253747, 1.228398, 1, 0, 0.9960784, 1,
1.0727, 0.77403, 1.989629, 1, 0, 0.9882353, 1,
1.073233, -0.4225415, 0.8364437, 1, 0, 0.9843137, 1,
1.074051, 1.540674, -0.0328837, 1, 0, 0.9764706, 1,
1.08042, -0.5595851, 0.3347791, 1, 0, 0.972549, 1,
1.081082, -0.7263928, 3.060575, 1, 0, 0.9647059, 1,
1.083053, 0.9612158, 1.100981, 1, 0, 0.9607843, 1,
1.084966, 0.20394, 3.080258, 1, 0, 0.9529412, 1,
1.090896, 1.449505, 0.9042804, 1, 0, 0.9490196, 1,
1.096429, 1.828973, -0.4743896, 1, 0, 0.9411765, 1,
1.099343, 0.9525707, 0.3948328, 1, 0, 0.9372549, 1,
1.099938, -2.597984, 3.928177, 1, 0, 0.9294118, 1,
1.10188, -1.356517, 1.937866, 1, 0, 0.9254902, 1,
1.112706, -0.317955, 1.641414, 1, 0, 0.9176471, 1,
1.113569, 0.985526, 0.9333727, 1, 0, 0.9137255, 1,
1.113956, -0.5537774, 0.63894, 1, 0, 0.9058824, 1,
1.117699, 0.7762955, 1.522821, 1, 0, 0.9019608, 1,
1.120689, 1.674015, -0.09801149, 1, 0, 0.8941177, 1,
1.121149, 0.2090476, -0.3083853, 1, 0, 0.8862745, 1,
1.121169, -1.81594, 3.586593, 1, 0, 0.8823529, 1,
1.125129, 1.522477, 1.144754, 1, 0, 0.8745098, 1,
1.125207, 1.573484, 0.0741469, 1, 0, 0.8705882, 1,
1.142121, -0.3984219, 2.021532, 1, 0, 0.8627451, 1,
1.142651, -0.9070093, 3.256843, 1, 0, 0.8588235, 1,
1.143972, 0.2659788, 1.657354, 1, 0, 0.8509804, 1,
1.145984, -1.257139, 2.000385, 1, 0, 0.8470588, 1,
1.146188, -1.08534, 1.537309, 1, 0, 0.8392157, 1,
1.148794, -1.057965, 2.458355, 1, 0, 0.8352941, 1,
1.155985, -0.5778351, 0.4836619, 1, 0, 0.827451, 1,
1.156188, -0.009203548, 1.593682, 1, 0, 0.8235294, 1,
1.157187, -0.1111064, 2.403298, 1, 0, 0.8156863, 1,
1.165137, 0.2493772, 1.583865, 1, 0, 0.8117647, 1,
1.167647, 0.7096327, -0.9731736, 1, 0, 0.8039216, 1,
1.17045, -0.2933532, 2.334033, 1, 0, 0.7960784, 1,
1.185334, 0.8505245, -0.8684874, 1, 0, 0.7921569, 1,
1.191866, -1.479484, 1.691117, 1, 0, 0.7843137, 1,
1.201664, 0.7725194, 1.447142, 1, 0, 0.7803922, 1,
1.206421, 0.24588, 0.9833298, 1, 0, 0.772549, 1,
1.20959, -0.4156188, 2.046349, 1, 0, 0.7686275, 1,
1.218744, -0.6559079, 1.239326, 1, 0, 0.7607843, 1,
1.219657, 0.5002657, 2.715919, 1, 0, 0.7568628, 1,
1.223725, 1.402413, 2.397018, 1, 0, 0.7490196, 1,
1.23122, 1.419236, 0.1068631, 1, 0, 0.7450981, 1,
1.234725, -0.4668428, 2.965964, 1, 0, 0.7372549, 1,
1.237778, -0.5050254, 2.062111, 1, 0, 0.7333333, 1,
1.239564, -2.051769, 0.4238906, 1, 0, 0.7254902, 1,
1.247127, -0.3101974, 0.2613334, 1, 0, 0.7215686, 1,
1.248114, -0.9998733, 2.908285, 1, 0, 0.7137255, 1,
1.257392, -1.309307, 1.715496, 1, 0, 0.7098039, 1,
1.258667, -0.2239839, -0.3880484, 1, 0, 0.7019608, 1,
1.259499, 1.198013, 0.2938873, 1, 0, 0.6941177, 1,
1.264775, -0.2005588, 1.732514, 1, 0, 0.6901961, 1,
1.273356, 0.1259683, 1.281641, 1, 0, 0.682353, 1,
1.277895, 0.3068796, -0.8565087, 1, 0, 0.6784314, 1,
1.278076, -2.502328, 2.140771, 1, 0, 0.6705883, 1,
1.27885, 1.545303, 0.6212999, 1, 0, 0.6666667, 1,
1.283695, 0.01961765, 1.438926, 1, 0, 0.6588235, 1,
1.283926, 0.6776276, 0.6493865, 1, 0, 0.654902, 1,
1.292941, 0.845262, 3.517761, 1, 0, 0.6470588, 1,
1.296542, -0.5941796, 1.724044, 1, 0, 0.6431373, 1,
1.297191, 0.2272893, -1.367797, 1, 0, 0.6352941, 1,
1.29757, 0.06908707, 0.9439405, 1, 0, 0.6313726, 1,
1.29983, -0.4889046, 0.7839144, 1, 0, 0.6235294, 1,
1.300315, 0.5618377, 0.8949665, 1, 0, 0.6196079, 1,
1.306685, 0.08195326, 3.145746, 1, 0, 0.6117647, 1,
1.311024, 1.253182, 2.324596, 1, 0, 0.6078432, 1,
1.316113, 2.7507, -0.9708242, 1, 0, 0.6, 1,
1.32618, 2.265995, -0.4659911, 1, 0, 0.5921569, 1,
1.32704, -0.5129145, 1.693572, 1, 0, 0.5882353, 1,
1.334558, -0.0530504, -0.1371775, 1, 0, 0.5803922, 1,
1.340391, -0.6886567, 1.94303, 1, 0, 0.5764706, 1,
1.341069, 0.6889445, 2.291327, 1, 0, 0.5686275, 1,
1.344976, -0.8973818, 2.811315, 1, 0, 0.5647059, 1,
1.354639, 0.7588199, 4.025568, 1, 0, 0.5568628, 1,
1.361008, 1.730458, -0.8816978, 1, 0, 0.5529412, 1,
1.362189, -0.5620074, 0.02396289, 1, 0, 0.5450981, 1,
1.376824, 0.2769001, 2.8607, 1, 0, 0.5411765, 1,
1.382434, -1.988232, 3.414088, 1, 0, 0.5333334, 1,
1.394448, 1.163366, 0.5277941, 1, 0, 0.5294118, 1,
1.395263, -0.3086086, 1.837397, 1, 0, 0.5215687, 1,
1.416589, -0.8262073, 2.817886, 1, 0, 0.5176471, 1,
1.418569, -1.754545, 2.964181, 1, 0, 0.509804, 1,
1.418949, 0.6611139, 0.3206404, 1, 0, 0.5058824, 1,
1.431516, -0.7011446, 3.208412, 1, 0, 0.4980392, 1,
1.433399, 0.2265876, -0.06881233, 1, 0, 0.4901961, 1,
1.43346, -0.08916169, 0.3713665, 1, 0, 0.4862745, 1,
1.445155, 1.742001, 0.7863868, 1, 0, 0.4784314, 1,
1.445211, -0.7684325, 3.067159, 1, 0, 0.4745098, 1,
1.451652, -0.0562974, 1.594945, 1, 0, 0.4666667, 1,
1.465423, -0.1603018, 3.566506, 1, 0, 0.4627451, 1,
1.474725, 0.4676135, 1.917392, 1, 0, 0.454902, 1,
1.475295, -0.382648, 3.530346, 1, 0, 0.4509804, 1,
1.477039, 1.822734, -1.08408, 1, 0, 0.4431373, 1,
1.482314, -1.666849, 3.034339, 1, 0, 0.4392157, 1,
1.487696, -1.420346, 4.476567, 1, 0, 0.4313726, 1,
1.497383, -0.3331002, 2.396111, 1, 0, 0.427451, 1,
1.510456, -0.1687999, 2.097103, 1, 0, 0.4196078, 1,
1.514304, -0.3528699, 2.709256, 1, 0, 0.4156863, 1,
1.516181, -2.053428, 4.148006, 1, 0, 0.4078431, 1,
1.530826, -1.249898, 1.781072, 1, 0, 0.4039216, 1,
1.532293, -1.183066, 1.65177, 1, 0, 0.3960784, 1,
1.537204, 1.995701, 0.3476183, 1, 0, 0.3882353, 1,
1.540404, 1.154143, 0.7836671, 1, 0, 0.3843137, 1,
1.542612, -0.142593, 2.060202, 1, 0, 0.3764706, 1,
1.551446, -0.1485856, 1.775227, 1, 0, 0.372549, 1,
1.552766, -0.4593747, 3.039489, 1, 0, 0.3647059, 1,
1.556824, 0.001790881, 1.168887, 1, 0, 0.3607843, 1,
1.575208, 0.03238464, 2.105542, 1, 0, 0.3529412, 1,
1.580047, 1.12916, 0.2732177, 1, 0, 0.3490196, 1,
1.582236, 0.9211984, 0.4950971, 1, 0, 0.3411765, 1,
1.600326, 0.1512409, 2.688585, 1, 0, 0.3372549, 1,
1.600923, 0.2299768, 1.30562, 1, 0, 0.3294118, 1,
1.608901, 1.174378, 0.05271382, 1, 0, 0.3254902, 1,
1.623345, 0.3275672, 2.991629, 1, 0, 0.3176471, 1,
1.633916, -0.9642207, 1.819274, 1, 0, 0.3137255, 1,
1.639701, -0.576887, 1.797151, 1, 0, 0.3058824, 1,
1.642427, 0.8093664, -0.009440788, 1, 0, 0.2980392, 1,
1.648615, -0.1963781, 0.7327335, 1, 0, 0.2941177, 1,
1.659809, 0.3517169, -0.08218071, 1, 0, 0.2862745, 1,
1.663632, 1.110117, 1.552637, 1, 0, 0.282353, 1,
1.667195, 0.08463971, 1.954311, 1, 0, 0.2745098, 1,
1.677095, 1.872061, 0.9379745, 1, 0, 0.2705882, 1,
1.686769, -1.931967, 3.217112, 1, 0, 0.2627451, 1,
1.717268, 0.02299313, 1.56858, 1, 0, 0.2588235, 1,
1.757193, 0.7726803, 1.16194, 1, 0, 0.2509804, 1,
1.761912, -0.1489611, 2.072041, 1, 0, 0.2470588, 1,
1.76344, -2.216359, 1.630153, 1, 0, 0.2392157, 1,
1.770979, 0.5356928, 2.432449, 1, 0, 0.2352941, 1,
1.781642, 0.4086535, 3.123132, 1, 0, 0.227451, 1,
1.800412, 0.1890682, 1.547968, 1, 0, 0.2235294, 1,
1.809439, 0.6489589, 0.6689603, 1, 0, 0.2156863, 1,
1.810848, -1.648324, 0.8518342, 1, 0, 0.2117647, 1,
1.825751, 2.915412, 0.6983831, 1, 0, 0.2039216, 1,
1.834279, 0.3951888, 1.58024, 1, 0, 0.1960784, 1,
1.853336, -0.3529325, 2.274259, 1, 0, 0.1921569, 1,
1.922383, -1.081914, 1.541965, 1, 0, 0.1843137, 1,
1.923912, -0.3810204, 1.448022, 1, 0, 0.1803922, 1,
1.927746, -0.5387387, 3.430536, 1, 0, 0.172549, 1,
1.932199, 0.5438404, 0.4699972, 1, 0, 0.1686275, 1,
1.933652, -1.587888, 3.152082, 1, 0, 0.1607843, 1,
1.955248, -0.5041867, 3.655658, 1, 0, 0.1568628, 1,
2.010468, 0.756092, 1.570775, 1, 0, 0.1490196, 1,
2.076454, 1.774489, 1.111298, 1, 0, 0.145098, 1,
2.086946, -1.456587, 2.294952, 1, 0, 0.1372549, 1,
2.096242, -0.5921478, 2.310308, 1, 0, 0.1333333, 1,
2.099073, 0.1801787, 0.1127718, 1, 0, 0.1254902, 1,
2.101199, -0.7801503, 4.305334, 1, 0, 0.1215686, 1,
2.154155, 1.398303, -0.4121943, 1, 0, 0.1137255, 1,
2.193617, -0.4573252, 1.906086, 1, 0, 0.1098039, 1,
2.21309, -0.7507964, 0.6979045, 1, 0, 0.1019608, 1,
2.220111, 0.2206138, 2.203456, 1, 0, 0.09411765, 1,
2.233686, -0.7885144, 1.32695, 1, 0, 0.09019608, 1,
2.25685, -0.8020241, 2.553497, 1, 0, 0.08235294, 1,
2.28523, 0.7826159, 1.82346, 1, 0, 0.07843138, 1,
2.338854, 0.9277467, 1.671615, 1, 0, 0.07058824, 1,
2.468888, 1.264033, 0.2216177, 1, 0, 0.06666667, 1,
2.499392, -0.3633173, 0.1304455, 1, 0, 0.05882353, 1,
2.665299, -0.4571694, 1.625378, 1, 0, 0.05490196, 1,
2.680085, 0.9498114, 2.584749, 1, 0, 0.04705882, 1,
2.747632, -0.2171705, 3.212818, 1, 0, 0.04313726, 1,
2.754844, 2.033033, 0.1127341, 1, 0, 0.03529412, 1,
2.797979, 1.247242, 0.1783545, 1, 0, 0.03137255, 1,
2.7987, -0.1839623, 1.351861, 1, 0, 0.02352941, 1,
3.050154, 0.6341371, 1.450611, 1, 0, 0.01960784, 1,
3.139771, -0.8744512, 2.410827, 1, 0, 0.01176471, 1,
3.233974, -1.681244, 4.248456, 1, 0, 0.007843138, 1
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
-0.1544588, -4.994616, -8.294125, 0, -0.5, 0.5, 0.5,
-0.1544588, -4.994616, -8.294125, 1, -0.5, 0.5, 0.5,
-0.1544588, -4.994616, -8.294125, 1, 1.5, 0.5, 0.5,
-0.1544588, -4.994616, -8.294125, 0, 1.5, 0.5, 0.5
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
-4.691571, -0.4299409, -8.294125, 0, -0.5, 0.5, 0.5,
-4.691571, -0.4299409, -8.294125, 1, -0.5, 0.5, 0.5,
-4.691571, -0.4299409, -8.294125, 1, 1.5, 0.5, 0.5,
-4.691571, -0.4299409, -8.294125, 0, 1.5, 0.5, 0.5
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
-4.691571, -4.994616, -0.7365596, 0, -0.5, 0.5, 0.5,
-4.691571, -4.994616, -0.7365596, 1, -0.5, 0.5, 0.5,
-4.691571, -4.994616, -0.7365596, 1, 1.5, 0.5, 0.5,
-4.691571, -4.994616, -0.7365596, 0, 1.5, 0.5, 0.5
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
-3, -3.941229, -6.550071,
3, -3.941229, -6.550071,
-3, -3.941229, -6.550071,
-3, -4.116794, -6.840746,
-2, -3.941229, -6.550071,
-2, -4.116794, -6.840746,
-1, -3.941229, -6.550071,
-1, -4.116794, -6.840746,
0, -3.941229, -6.550071,
0, -4.116794, -6.840746,
1, -3.941229, -6.550071,
1, -4.116794, -6.840746,
2, -3.941229, -6.550071,
2, -4.116794, -6.840746,
3, -3.941229, -6.550071,
3, -4.116794, -6.840746
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
-3, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
-3, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
-3, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
-3, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
-2, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
-2, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
-2, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
-2, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
-1, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
-1, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
-1, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
-1, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
0, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
0, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
0, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
0, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
1, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
1, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
1, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
1, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
2, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
2, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
2, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
2, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5,
3, -4.467922, -7.422098, 0, -0.5, 0.5, 0.5,
3, -4.467922, -7.422098, 1, -0.5, 0.5, 0.5,
3, -4.467922, -7.422098, 1, 1.5, 0.5, 0.5,
3, -4.467922, -7.422098, 0, 1.5, 0.5, 0.5
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
-3.644545, -3, -6.550071,
-3.644545, 2, -6.550071,
-3.644545, -3, -6.550071,
-3.819049, -3, -6.840746,
-3.644545, -2, -6.550071,
-3.819049, -2, -6.840746,
-3.644545, -1, -6.550071,
-3.819049, -1, -6.840746,
-3.644545, 0, -6.550071,
-3.819049, 0, -6.840746,
-3.644545, 1, -6.550071,
-3.819049, 1, -6.840746,
-3.644545, 2, -6.550071,
-3.819049, 2, -6.840746
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
-4.168058, -3, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, -3, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, -3, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, -3, -7.422098, 0, 1.5, 0.5, 0.5,
-4.168058, -2, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, -2, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, -2, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, -2, -7.422098, 0, 1.5, 0.5, 0.5,
-4.168058, -1, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, -1, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, -1, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, -1, -7.422098, 0, 1.5, 0.5, 0.5,
-4.168058, 0, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, 0, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, 0, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, 0, -7.422098, 0, 1.5, 0.5, 0.5,
-4.168058, 1, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, 1, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, 1, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, 1, -7.422098, 0, 1.5, 0.5, 0.5,
-4.168058, 2, -7.422098, 0, -0.5, 0.5, 0.5,
-4.168058, 2, -7.422098, 1, -0.5, 0.5, 0.5,
-4.168058, 2, -7.422098, 1, 1.5, 0.5, 0.5,
-4.168058, 2, -7.422098, 0, 1.5, 0.5, 0.5
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
-3.644545, -3.941229, -6,
-3.644545, -3.941229, 4,
-3.644545, -3.941229, -6,
-3.819049, -4.116794, -6,
-3.644545, -3.941229, -4,
-3.819049, -4.116794, -4,
-3.644545, -3.941229, -2,
-3.819049, -4.116794, -2,
-3.644545, -3.941229, 0,
-3.819049, -4.116794, 0,
-3.644545, -3.941229, 2,
-3.819049, -4.116794, 2,
-3.644545, -3.941229, 4,
-3.819049, -4.116794, 4
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
-4.168058, -4.467922, -6, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -6, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -6, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, -6, 0, 1.5, 0.5, 0.5,
-4.168058, -4.467922, -4, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -4, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -4, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, -4, 0, 1.5, 0.5, 0.5,
-4.168058, -4.467922, -2, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -2, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, -2, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, -2, 0, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 0, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 0, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 0, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 0, 0, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 2, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 2, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 2, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 2, 0, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 4, 0, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 4, 1, -0.5, 0.5, 0.5,
-4.168058, -4.467922, 4, 1, 1.5, 0.5, 0.5,
-4.168058, -4.467922, 4, 0, 1.5, 0.5, 0.5
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
-3.644545, -3.941229, -6.550071,
-3.644545, 3.081347, -6.550071,
-3.644545, -3.941229, 5.076952,
-3.644545, 3.081347, 5.076952,
-3.644545, -3.941229, -6.550071,
-3.644545, -3.941229, 5.076952,
-3.644545, 3.081347, -6.550071,
-3.644545, 3.081347, 5.076952,
-3.644545, -3.941229, -6.550071,
3.335628, -3.941229, -6.550071,
-3.644545, -3.941229, 5.076952,
3.335628, -3.941229, 5.076952,
-3.644545, 3.081347, -6.550071,
3.335628, 3.081347, -6.550071,
-3.644545, 3.081347, 5.076952,
3.335628, 3.081347, 5.076952,
3.335628, -3.941229, -6.550071,
3.335628, 3.081347, -6.550071,
3.335628, -3.941229, 5.076952,
3.335628, 3.081347, 5.076952,
3.335628, -3.941229, -6.550071,
3.335628, -3.941229, 5.076952,
3.335628, 3.081347, -6.550071,
3.335628, 3.081347, 5.076952
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
var radius = 8.15483;
var distance = 36.28176;
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
mvMatrix.translate( 0.1544588, 0.4299409, 0.7365596 );
mvMatrix.scale( 1.263173, 1.255545, 0.7583336 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.28176);
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
pyrimidifen<-read.table("pyrimidifen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrimidifen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
```

```r
y<-pyrimidifen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
```

```r
z<-pyrimidifen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidifen' not found
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
-3.542892, -2.226556, -2.866197, 0, 0, 1, 1, 1,
-3.468737, -0.2102105, -2.63909, 1, 0, 0, 1, 1,
-3.108569, -0.4806915, -0.3879543, 1, 0, 0, 1, 1,
-2.971056, 0.268705, -2.239429, 1, 0, 0, 1, 1,
-2.818477, 0.330869, -1.734992, 1, 0, 0, 1, 1,
-2.814365, -1.531173, -2.475103, 1, 0, 0, 1, 1,
-2.777306, -1.175637, -2.501812, 0, 0, 0, 1, 1,
-2.774976, -2.38061, -0.8254268, 0, 0, 0, 1, 1,
-2.514747, 1.458361, -0.7583361, 0, 0, 0, 1, 1,
-2.511362, 0.4778275, -0.4825969, 0, 0, 0, 1, 1,
-2.501565, -0.7611406, 0.1891469, 0, 0, 0, 1, 1,
-2.431649, -1.106213, -1.759365, 0, 0, 0, 1, 1,
-2.42983, -1.239463, -0.975901, 0, 0, 0, 1, 1,
-2.401572, 0.420628, -1.614434, 1, 1, 1, 1, 1,
-2.354382, -0.2028958, -2.118873, 1, 1, 1, 1, 1,
-2.334636, -0.3992042, -2.063386, 1, 1, 1, 1, 1,
-2.229894, 1.103597, -0.3157214, 1, 1, 1, 1, 1,
-2.220225, -0.3308735, -0.5000924, 1, 1, 1, 1, 1,
-2.164467, -0.669508, -3.282336, 1, 1, 1, 1, 1,
-2.15191, -0.1238958, -0.5206828, 1, 1, 1, 1, 1,
-2.13759, 0.6308648, -0.04543489, 1, 1, 1, 1, 1,
-2.091466, -0.1407079, -3.736182, 1, 1, 1, 1, 1,
-2.079873, -0.8164246, -2.919008, 1, 1, 1, 1, 1,
-2.068999, 0.2107506, -2.608315, 1, 1, 1, 1, 1,
-2.068103, 1.41144, 0.02502585, 1, 1, 1, 1, 1,
-2.049075, 1.598269, -0.7644252, 1, 1, 1, 1, 1,
-2.043297, 0.359141, -2.402392, 1, 1, 1, 1, 1,
-2.02689, -2.304777, -0.7586496, 1, 1, 1, 1, 1,
-2.0224, -0.1970456, -2.891394, 0, 0, 1, 1, 1,
-1.978529, -0.5702428, -1.794735, 1, 0, 0, 1, 1,
-1.945372, -0.1651717, -1.233406, 1, 0, 0, 1, 1,
-1.925649, 0.02822316, -1.417377, 1, 0, 0, 1, 1,
-1.918767, 1.585195, 0.9017854, 1, 0, 0, 1, 1,
-1.914422, -0.7759035, -1.476217, 1, 0, 0, 1, 1,
-1.91125, -0.1516753, -2.815515, 0, 0, 0, 1, 1,
-1.907549, -2.010584, -2.643435, 0, 0, 0, 1, 1,
-1.89864, -0.8655616, -2.426092, 0, 0, 0, 1, 1,
-1.888967, -0.6343715, -2.296566, 0, 0, 0, 1, 1,
-1.887999, 1.577972, -2.121219, 0, 0, 0, 1, 1,
-1.86177, -1.254669, -1.766926, 0, 0, 0, 1, 1,
-1.85962, -0.4695134, -2.661792, 0, 0, 0, 1, 1,
-1.83115, -0.1842361, -1.996027, 1, 1, 1, 1, 1,
-1.830992, -0.01998182, -0.8448762, 1, 1, 1, 1, 1,
-1.830274, -1.17127, -3.281049, 1, 1, 1, 1, 1,
-1.823999, 0.3688646, -1.695284, 1, 1, 1, 1, 1,
-1.803554, 0.5993177, -0.6597068, 1, 1, 1, 1, 1,
-1.800011, 0.9978201, -2.218899, 1, 1, 1, 1, 1,
-1.793388, -0.9697829, -2.641206, 1, 1, 1, 1, 1,
-1.790223, 0.209512, -2.233566, 1, 1, 1, 1, 1,
-1.78844, -0.3577922, -0.6459261, 1, 1, 1, 1, 1,
-1.76919, 0.105753, -1.346084, 1, 1, 1, 1, 1,
-1.728019, 1.641729, -0.5212976, 1, 1, 1, 1, 1,
-1.725773, -0.03625807, -1.128459, 1, 1, 1, 1, 1,
-1.722238, -1.011338, -2.273873, 1, 1, 1, 1, 1,
-1.693597, -1.343901, -3.481915, 1, 1, 1, 1, 1,
-1.6807, -0.6012389, -3.170963, 1, 1, 1, 1, 1,
-1.669651, -1.091399, 0.3427013, 0, 0, 1, 1, 1,
-1.667904, 0.3298973, -1.200729, 1, 0, 0, 1, 1,
-1.664866, -0.9169303, -1.098524, 1, 0, 0, 1, 1,
-1.657217, -0.5627406, -2.196136, 1, 0, 0, 1, 1,
-1.637829, 0.1656249, -1.690968, 1, 0, 0, 1, 1,
-1.620644, -1.37917, -2.700683, 1, 0, 0, 1, 1,
-1.613109, 0.6195117, -1.269318, 0, 0, 0, 1, 1,
-1.604711, 0.4599345, 0.2244375, 0, 0, 0, 1, 1,
-1.577929, -0.1624598, -3.388879, 0, 0, 0, 1, 1,
-1.566986, -0.5673302, 0.09542082, 0, 0, 0, 1, 1,
-1.56674, 1.078024, -1.093547, 0, 0, 0, 1, 1,
-1.555976, 1.159406, -1.015698, 0, 0, 0, 1, 1,
-1.555873, -1.424842, -3.145813, 0, 0, 0, 1, 1,
-1.549704, 1.433004, -0.9937832, 1, 1, 1, 1, 1,
-1.54631, -0.1786014, -3.386748, 1, 1, 1, 1, 1,
-1.541993, -0.5040486, -2.619795, 1, 1, 1, 1, 1,
-1.527506, 0.5637349, -0.6316063, 1, 1, 1, 1, 1,
-1.504515, 0.8691862, -1.989111, 1, 1, 1, 1, 1,
-1.476045, -0.7413541, -0.7256957, 1, 1, 1, 1, 1,
-1.474087, -0.4903005, -1.506353, 1, 1, 1, 1, 1,
-1.471045, 0.2888455, -0.8420641, 1, 1, 1, 1, 1,
-1.44293, -2.116727, -3.628195, 1, 1, 1, 1, 1,
-1.441248, -0.3208391, -3.353937, 1, 1, 1, 1, 1,
-1.435435, -0.07218818, -2.34175, 1, 1, 1, 1, 1,
-1.422835, 0.5946299, -0.4377795, 1, 1, 1, 1, 1,
-1.42089, -2.463816, -3.703541, 1, 1, 1, 1, 1,
-1.387362, 1.407037, -1.613207, 1, 1, 1, 1, 1,
-1.377236, -1.008192, -2.277642, 1, 1, 1, 1, 1,
-1.371131, 0.5200914, -2.156713, 0, 0, 1, 1, 1,
-1.368574, -0.2198181, -1.573165, 1, 0, 0, 1, 1,
-1.34594, -0.2419389, -0.9919785, 1, 0, 0, 1, 1,
-1.345492, 0.9088465, -1.200007, 1, 0, 0, 1, 1,
-1.344979, -0.2300216, -1.648902, 1, 0, 0, 1, 1,
-1.305334, 0.55872, -0.2678866, 1, 0, 0, 1, 1,
-1.305258, -1.748495, -3.547456, 0, 0, 0, 1, 1,
-1.305122, -0.1561519, -0.4373042, 0, 0, 0, 1, 1,
-1.305021, 0.609938, -1.781304, 0, 0, 0, 1, 1,
-1.300926, -0.5493095, -0.3225756, 0, 0, 0, 1, 1,
-1.300766, -0.04241319, -2.233637, 0, 0, 0, 1, 1,
-1.29258, -0.3873355, -3.45515, 0, 0, 0, 1, 1,
-1.278406, 0.1252434, -0.9436842, 0, 0, 0, 1, 1,
-1.270764, 1.227304, -0.7765665, 1, 1, 1, 1, 1,
-1.269422, 0.5018367, -1.483682, 1, 1, 1, 1, 1,
-1.253718, -1.173299, -1.065864, 1, 1, 1, 1, 1,
-1.249203, -0.7500513, -1.958028, 1, 1, 1, 1, 1,
-1.242446, 0.3067683, -0.5692264, 1, 1, 1, 1, 1,
-1.231687, 1.462457, -0.211997, 1, 1, 1, 1, 1,
-1.219225, -1.664328, -3.532521, 1, 1, 1, 1, 1,
-1.215841, 0.3349065, -0.4437443, 1, 1, 1, 1, 1,
-1.201714, -1.867316, -2.594197, 1, 1, 1, 1, 1,
-1.176746, -0.3222385, -0.4406379, 1, 1, 1, 1, 1,
-1.144513, -0.740354, -2.567285, 1, 1, 1, 1, 1,
-1.143973, -0.2678275, -1.934303, 1, 1, 1, 1, 1,
-1.143826, -0.5701394, -2.796055, 1, 1, 1, 1, 1,
-1.143014, 0.7636356, -1.607467, 1, 1, 1, 1, 1,
-1.138393, 0.5730735, -2.040945, 1, 1, 1, 1, 1,
-1.135192, -1.129372, -1.678393, 0, 0, 1, 1, 1,
-1.134986, -0.4922628, -2.235059, 1, 0, 0, 1, 1,
-1.132504, 0.7333487, -0.9472976, 1, 0, 0, 1, 1,
-1.128807, 0.008099975, -1.257514, 1, 0, 0, 1, 1,
-1.125263, -1.431822, -1.536973, 1, 0, 0, 1, 1,
-1.118445, -0.5571167, -2.133132, 1, 0, 0, 1, 1,
-1.116937, -1.127911, -2.271833, 0, 0, 0, 1, 1,
-1.111575, -0.7855255, -3.375412, 0, 0, 0, 1, 1,
-1.107902, 0.5307953, -1.056999, 0, 0, 0, 1, 1,
-1.102866, -2.282459, -1.808856, 0, 0, 0, 1, 1,
-1.09919, -2.479741, -3.475012, 0, 0, 0, 1, 1,
-1.096144, -0.3830481, -2.066559, 0, 0, 0, 1, 1,
-1.09452, -1.314939, -0.6732669, 0, 0, 0, 1, 1,
-1.084202, -0.3698581, -2.99265, 1, 1, 1, 1, 1,
-1.074419, -1.760783, -2.80054, 1, 1, 1, 1, 1,
-1.066445, 0.6656702, 0.5280951, 1, 1, 1, 1, 1,
-1.058069, -1.865662, -3.348592, 1, 1, 1, 1, 1,
-1.05217, -0.8477325, -1.974449, 1, 1, 1, 1, 1,
-1.050674, -0.2279873, -3.103571, 1, 1, 1, 1, 1,
-1.05067, 0.3904407, -2.115258, 1, 1, 1, 1, 1,
-1.033007, -1.105448, -1.08462, 1, 1, 1, 1, 1,
-1.029978, 0.2151805, -2.469138, 1, 1, 1, 1, 1,
-1.026033, -0.3530304, -2.435941, 1, 1, 1, 1, 1,
-1.019155, 0.3758858, -0.4333214, 1, 1, 1, 1, 1,
-1.017032, -1.581245, -2.718828, 1, 1, 1, 1, 1,
-1.002081, -1.668588, -2.254043, 1, 1, 1, 1, 1,
-0.9997964, 0.6586488, -1.375976, 1, 1, 1, 1, 1,
-0.990268, -0.5864689, -1.534462, 1, 1, 1, 1, 1,
-0.9881082, -0.3467508, -1.99184, 0, 0, 1, 1, 1,
-0.9852021, -1.141571, -3.734621, 1, 0, 0, 1, 1,
-0.9829442, 2.386721, -0.2871622, 1, 0, 0, 1, 1,
-0.9814108, 0.2243818, -1.448148, 1, 0, 0, 1, 1,
-0.9739566, 0.5150592, -0.7671387, 1, 0, 0, 1, 1,
-0.9641283, 0.1751299, -2.170467, 1, 0, 0, 1, 1,
-0.9638293, 1.451728, 0.04920416, 0, 0, 0, 1, 1,
-0.9581691, -0.2357801, -1.057028, 0, 0, 0, 1, 1,
-0.9574209, 1.055079, -0.2747623, 0, 0, 0, 1, 1,
-0.9572044, -1.034579, -2.153889, 0, 0, 0, 1, 1,
-0.9521134, -0.5827827, -2.605775, 0, 0, 0, 1, 1,
-0.9509455, 1.436854, -1.110638, 0, 0, 0, 1, 1,
-0.948062, 0.2523608, -0.2817584, 0, 0, 0, 1, 1,
-0.9368016, -0.9331268, -2.803928, 1, 1, 1, 1, 1,
-0.9246941, 0.2929591, 0.3184433, 1, 1, 1, 1, 1,
-0.9143797, -0.1406493, -2.431005, 1, 1, 1, 1, 1,
-0.9058861, -1.052619, -1.288065, 1, 1, 1, 1, 1,
-0.9033815, 0.2571197, -2.858214, 1, 1, 1, 1, 1,
-0.898913, 0.5889753, -2.10734, 1, 1, 1, 1, 1,
-0.8898099, -0.7096075, -1.092881, 1, 1, 1, 1, 1,
-0.8865737, 0.6371679, 0.5203747, 1, 1, 1, 1, 1,
-0.8801112, 0.2071217, -1.295684, 1, 1, 1, 1, 1,
-0.8753055, -1.146288, -2.564168, 1, 1, 1, 1, 1,
-0.8737238, -1.061571, -2.690284, 1, 1, 1, 1, 1,
-0.8721303, -0.5255967, -1.296749, 1, 1, 1, 1, 1,
-0.864996, -1.630357, -2.588245, 1, 1, 1, 1, 1,
-0.8573269, -2.38085, -3.149044, 1, 1, 1, 1, 1,
-0.8562584, -0.5874715, -3.348809, 1, 1, 1, 1, 1,
-0.848101, 0.2547848, -1.46403, 0, 0, 1, 1, 1,
-0.83902, 1.071607, 0.7536442, 1, 0, 0, 1, 1,
-0.8385978, -0.1263558, -1.197754, 1, 0, 0, 1, 1,
-0.8334627, -1.21986, -3.413881, 1, 0, 0, 1, 1,
-0.8258229, 0.9312446, -0.7723886, 1, 0, 0, 1, 1,
-0.8190047, 0.1153401, 0.8596806, 1, 0, 0, 1, 1,
-0.8140454, -1.3214, -1.223984, 0, 0, 0, 1, 1,
-0.8134691, -0.2813405, -1.390126, 0, 0, 0, 1, 1,
-0.8087597, 0.4382491, -0.9521739, 0, 0, 0, 1, 1,
-0.8065887, 0.835665, -1.524935, 0, 0, 0, 1, 1,
-0.8064196, 2.116368, -1.284223, 0, 0, 0, 1, 1,
-0.8018326, -1.701762, -3.531397, 0, 0, 0, 1, 1,
-0.7984188, 1.209729, -0.9387342, 0, 0, 0, 1, 1,
-0.7918899, -0.4225723, -1.458408, 1, 1, 1, 1, 1,
-0.7910383, 0.2206581, -2.13009, 1, 1, 1, 1, 1,
-0.7909053, -0.06799071, -3.839417, 1, 1, 1, 1, 1,
-0.7769746, -0.1696975, -2.866552, 1, 1, 1, 1, 1,
-0.771719, 1.738859, -0.1321397, 1, 1, 1, 1, 1,
-0.7679744, -1.008728, -4.030746, 1, 1, 1, 1, 1,
-0.76651, 1.717608, -1.227811, 1, 1, 1, 1, 1,
-0.7608986, -1.228925, -0.9409124, 1, 1, 1, 1, 1,
-0.7596961, 0.5506722, -1.401164, 1, 1, 1, 1, 1,
-0.7530212, 1.629648, -0.9202907, 1, 1, 1, 1, 1,
-0.7529052, -1.169288, -3.174297, 1, 1, 1, 1, 1,
-0.7518672, 0.402629, -2.452333, 1, 1, 1, 1, 1,
-0.7507544, 0.1658111, -2.335745, 1, 1, 1, 1, 1,
-0.7495377, 0.2478752, -1.826012, 1, 1, 1, 1, 1,
-0.7483419, 2.128983, -0.2010206, 1, 1, 1, 1, 1,
-0.7391736, -0.5076917, -2.398167, 0, 0, 1, 1, 1,
-0.7351405, 1.393089, -0.2529025, 1, 0, 0, 1, 1,
-0.73131, -0.991816, -2.635565, 1, 0, 0, 1, 1,
-0.7259554, 0.01446943, -2.505333, 1, 0, 0, 1, 1,
-0.7242182, 0.4414735, -1.32175, 1, 0, 0, 1, 1,
-0.7226818, 1.272992, -0.9892054, 1, 0, 0, 1, 1,
-0.7200087, -0.5379696, -2.646875, 0, 0, 0, 1, 1,
-0.718288, 0.07502792, -1.538855, 0, 0, 0, 1, 1,
-0.7176525, 0.06566559, -1.267547, 0, 0, 0, 1, 1,
-0.716237, 2.305274, 0.04422331, 0, 0, 0, 1, 1,
-0.7141053, -1.552163, -2.469403, 0, 0, 0, 1, 1,
-0.7137646, 0.2170361, -2.917754, 0, 0, 0, 1, 1,
-0.7089084, 0.5873976, -1.8724, 0, 0, 0, 1, 1,
-0.7077537, 1.363014, -1.009242, 1, 1, 1, 1, 1,
-0.707413, 0.4274367, -0.8656193, 1, 1, 1, 1, 1,
-0.7003593, 1.918597, 0.2401751, 1, 1, 1, 1, 1,
-0.6983522, -0.3488419, -3.317053, 1, 1, 1, 1, 1,
-0.6964605, 0.6546521, 0.9794383, 1, 1, 1, 1, 1,
-0.693382, 0.9855227, 0.6452396, 1, 1, 1, 1, 1,
-0.6921585, -0.4034611, -1.885972, 1, 1, 1, 1, 1,
-0.6897127, -0.3979704, -2.000359, 1, 1, 1, 1, 1,
-0.6887161, 1.109435, -1.105858, 1, 1, 1, 1, 1,
-0.6858113, -1.189645, -3.270746, 1, 1, 1, 1, 1,
-0.6853485, -1.213982, -2.004388, 1, 1, 1, 1, 1,
-0.6850313, -0.7362826, -3.039647, 1, 1, 1, 1, 1,
-0.6799019, -0.3593344, -4.307407, 1, 1, 1, 1, 1,
-0.6767044, -0.7202126, -3.625885, 1, 1, 1, 1, 1,
-0.6766083, -0.7767025, -3.845188, 1, 1, 1, 1, 1,
-0.6744581, -0.4611187, -1.766666, 0, 0, 1, 1, 1,
-0.6672376, -2.067342, -3.092711, 1, 0, 0, 1, 1,
-0.6593043, 0.8059853, -0.3229743, 1, 0, 0, 1, 1,
-0.6409655, -1.10908, -0.667255, 1, 0, 0, 1, 1,
-0.6316856, 1.425985, -0.3330281, 1, 0, 0, 1, 1,
-0.6268279, 0.3846315, -3.352581, 1, 0, 0, 1, 1,
-0.6228677, 0.768157, 0.4683725, 0, 0, 0, 1, 1,
-0.6153842, 1.257117, -0.0103582, 0, 0, 0, 1, 1,
-0.6141783, 0.7221988, -1.485176, 0, 0, 0, 1, 1,
-0.6118171, 0.5551837, -0.7860596, 0, 0, 0, 1, 1,
-0.6105331, 0.8070351, -1.216915, 0, 0, 0, 1, 1,
-0.6091658, -1.866791, -2.650255, 0, 0, 0, 1, 1,
-0.6069528, 0.05996225, -0.7066713, 0, 0, 0, 1, 1,
-0.6062661, -0.5700366, -2.061496, 1, 1, 1, 1, 1,
-0.6056026, 0.3437333, -0.8458939, 1, 1, 1, 1, 1,
-0.6053098, -0.7154503, -1.457516, 1, 1, 1, 1, 1,
-0.600724, 0.1052527, -1.991219, 1, 1, 1, 1, 1,
-0.5999737, -0.9187803, -1.573611, 1, 1, 1, 1, 1,
-0.5995559, 1.274507, -0.3231558, 1, 1, 1, 1, 1,
-0.5993778, -1.515268, -2.801596, 1, 1, 1, 1, 1,
-0.5988333, -2.592561, -3.048567, 1, 1, 1, 1, 1,
-0.5977956, -1.763295, -4.556288, 1, 1, 1, 1, 1,
-0.5972112, 1.00234, 0.4708472, 1, 1, 1, 1, 1,
-0.5962479, 0.4042939, -0.5015301, 1, 1, 1, 1, 1,
-0.5854498, -0.7153946, -3.097079, 1, 1, 1, 1, 1,
-0.5822892, -0.05659851, -0.8061043, 1, 1, 1, 1, 1,
-0.578573, -1.234353, -4.210579, 1, 1, 1, 1, 1,
-0.5755125, -0.9357961, -2.408052, 1, 1, 1, 1, 1,
-0.571787, -1.268028, -3.661092, 0, 0, 1, 1, 1,
-0.56954, 0.193851, -1.370347, 1, 0, 0, 1, 1,
-0.5656531, -1.227305, -2.366618, 1, 0, 0, 1, 1,
-0.564415, -1.504185, -1.933303, 1, 0, 0, 1, 1,
-0.5618531, -0.4598171, -1.071311, 1, 0, 0, 1, 1,
-0.5608701, 1.12676, -0.3575283, 1, 0, 0, 1, 1,
-0.5583529, -0.8349841, -2.826137, 0, 0, 0, 1, 1,
-0.5575206, 0.2882117, -1.579043, 0, 0, 0, 1, 1,
-0.5545478, 1.318787, 0.08478894, 0, 0, 0, 1, 1,
-0.5504327, 1.513179, 0.1221789, 0, 0, 0, 1, 1,
-0.5422737, 0.03627991, 0.00642476, 0, 0, 0, 1, 1,
-0.530758, -0.2468643, 0.5276187, 0, 0, 0, 1, 1,
-0.5288413, -1.176751, -1.793109, 0, 0, 0, 1, 1,
-0.5253779, -0.1258352, -1.924285, 1, 1, 1, 1, 1,
-0.5244097, 0.8662684, -0.08111726, 1, 1, 1, 1, 1,
-0.5240839, 0.3662679, -1.127626, 1, 1, 1, 1, 1,
-0.5237893, 1.504587, 0.761158, 1, 1, 1, 1, 1,
-0.5210549, -1.24491, -3.770663, 1, 1, 1, 1, 1,
-0.5187045, -0.4257837, -1.952117, 1, 1, 1, 1, 1,
-0.5185733, 0.7266878, 0.1123952, 1, 1, 1, 1, 1,
-0.5184586, -0.3705688, -1.294722, 1, 1, 1, 1, 1,
-0.5133864, -0.4081003, -0.5652446, 1, 1, 1, 1, 1,
-0.5120968, 0.3626203, 1.965175, 1, 1, 1, 1, 1,
-0.5108915, 0.3608004, -1.30659, 1, 1, 1, 1, 1,
-0.5097185, 0.2974891, -0.6891249, 1, 1, 1, 1, 1,
-0.5009073, -0.6824901, -3.221344, 1, 1, 1, 1, 1,
-0.4986945, -0.2513455, -0.1607383, 1, 1, 1, 1, 1,
-0.4936487, 0.9176582, 0.03669796, 1, 1, 1, 1, 1,
-0.485412, 0.9639372, 0.9848859, 0, 0, 1, 1, 1,
-0.4850225, -0.264473, -1.670249, 1, 0, 0, 1, 1,
-0.4825314, -0.6769493, -3.805445, 1, 0, 0, 1, 1,
-0.4778499, -1.62249, -2.264423, 1, 0, 0, 1, 1,
-0.4775079, 0.7532647, -0.5574234, 1, 0, 0, 1, 1,
-0.4772381, -0.8430475, -0.8903419, 1, 0, 0, 1, 1,
-0.467464, -0.658582, -0.02078801, 0, 0, 0, 1, 1,
-0.4667305, 2.615807, -0.43367, 0, 0, 0, 1, 1,
-0.4632885, 0.3594238, -2.507563, 0, 0, 0, 1, 1,
-0.460374, 1.233845, -0.4110123, 0, 0, 0, 1, 1,
-0.4564914, 0.5157415, -0.7561086, 0, 0, 0, 1, 1,
-0.4479479, 0.2843455, -0.8932387, 0, 0, 0, 1, 1,
-0.4329614, -0.4745526, -3.612527, 0, 0, 0, 1, 1,
-0.432168, 0.05825748, -2.805268, 1, 1, 1, 1, 1,
-0.427464, 2.219082, 0.3090571, 1, 1, 1, 1, 1,
-0.4257186, 0.2317544, -0.8219442, 1, 1, 1, 1, 1,
-0.4256907, 1.175338, 0.9400291, 1, 1, 1, 1, 1,
-0.4246998, 2.675256, 1.319139, 1, 1, 1, 1, 1,
-0.4224489, 1.001599, -0.4075748, 1, 1, 1, 1, 1,
-0.4220574, 0.1470505, -1.421853, 1, 1, 1, 1, 1,
-0.4211128, 0.519854, -1.457755, 1, 1, 1, 1, 1,
-0.4167466, -0.4780847, -1.509457, 1, 1, 1, 1, 1,
-0.4156333, -1.058541, -1.571365, 1, 1, 1, 1, 1,
-0.4072109, 1.810678, 0.621992, 1, 1, 1, 1, 1,
-0.4054951, -0.324061, -1.590366, 1, 1, 1, 1, 1,
-0.4035541, 0.6312328, -1.019709, 1, 1, 1, 1, 1,
-0.4024849, -0.3229025, -4.425253, 1, 1, 1, 1, 1,
-0.3983816, 0.3117284, -2.743985, 1, 1, 1, 1, 1,
-0.3961961, 1.205763, 2.726715, 0, 0, 1, 1, 1,
-0.3915246, -0.6502053, -2.932047, 1, 0, 0, 1, 1,
-0.3896646, 1.374064, 1.59033, 1, 0, 0, 1, 1,
-0.3882656, -0.4070587, -2.153502, 1, 0, 0, 1, 1,
-0.3867485, -2.137854, -3.376972, 1, 0, 0, 1, 1,
-0.3834969, -1.731758, -3.160206, 1, 0, 0, 1, 1,
-0.3813925, -0.133197, -3.13289, 0, 0, 0, 1, 1,
-0.3747554, 1.057815, -0.9482584, 0, 0, 0, 1, 1,
-0.3721053, -0.2163904, -3.375615, 0, 0, 0, 1, 1,
-0.3694664, -0.1761603, -1.5368, 0, 0, 0, 1, 1,
-0.3619121, 0.9688933, -0.9370292, 0, 0, 0, 1, 1,
-0.3614426, 0.3970689, -0.06274804, 0, 0, 0, 1, 1,
-0.3605193, 0.54159, -0.9886494, 0, 0, 0, 1, 1,
-0.3604759, -0.4567311, -3.791156, 1, 1, 1, 1, 1,
-0.3508337, -1.63673, -4.442352, 1, 1, 1, 1, 1,
-0.3478034, 0.5526171, -0.1934579, 1, 1, 1, 1, 1,
-0.3474464, 0.9822611, 2.387434, 1, 1, 1, 1, 1,
-0.345096, 0.7720157, 1.254381, 1, 1, 1, 1, 1,
-0.3380963, 0.7515486, 0.2375165, 1, 1, 1, 1, 1,
-0.3360795, -2.821151, -2.621488, 1, 1, 1, 1, 1,
-0.3329472, 0.07436635, -3.481301, 1, 1, 1, 1, 1,
-0.3293284, 0.03571339, -0.8786007, 1, 1, 1, 1, 1,
-0.3288872, 0.6545635, 1.117467, 1, 1, 1, 1, 1,
-0.3248713, 1.02626, -0.2924189, 1, 1, 1, 1, 1,
-0.3234769, -1.488922, -2.13228, 1, 1, 1, 1, 1,
-0.3225235, 0.1773085, -1.831274, 1, 1, 1, 1, 1,
-0.3224204, 2.005887, 0.03470495, 1, 1, 1, 1, 1,
-0.3183551, -0.2381345, -1.761035, 1, 1, 1, 1, 1,
-0.317576, 1.371708, -1.284178, 0, 0, 1, 1, 1,
-0.3166222, -0.4857127, -3.500308, 1, 0, 0, 1, 1,
-0.3149655, 1.12058, 0.5975134, 1, 0, 0, 1, 1,
-0.3125165, -0.7374992, -2.47548, 1, 0, 0, 1, 1,
-0.3083288, 0.7943496, -0.2575766, 1, 0, 0, 1, 1,
-0.3016191, -3.04442, -5.20809, 1, 0, 0, 1, 1,
-0.2993864, 1.107411, -2.260834, 0, 0, 0, 1, 1,
-0.2978519, 0.9163545, -1.518048, 0, 0, 0, 1, 1,
-0.2971685, 2.228081, -0.3274478, 0, 0, 0, 1, 1,
-0.2971659, -0.04010852, -2.032789, 0, 0, 0, 1, 1,
-0.2935947, 0.05825148, -1.7276, 0, 0, 0, 1, 1,
-0.2931722, 1.225359, -0.7777528, 0, 0, 0, 1, 1,
-0.2927958, -0.9572185, -4.519549, 0, 0, 0, 1, 1,
-0.2926897, 0.9402623, 0.8347951, 1, 1, 1, 1, 1,
-0.29071, 0.5716725, 1.382673, 1, 1, 1, 1, 1,
-0.2899349, 0.06029326, -1.60575, 1, 1, 1, 1, 1,
-0.2884526, 0.674105, -1.229623, 1, 1, 1, 1, 1,
-0.2876008, -0.7745469, -2.724061, 1, 1, 1, 1, 1,
-0.2818866, -1.01307, -4.862581, 1, 1, 1, 1, 1,
-0.2802896, 2.127905, -0.4115703, 1, 1, 1, 1, 1,
-0.275672, -0.430912, -2.698362, 1, 1, 1, 1, 1,
-0.2749459, 1.540962, -0.5308154, 1, 1, 1, 1, 1,
-0.2738655, 2.361581, 0.5319163, 1, 1, 1, 1, 1,
-0.2633589, 0.5811873, 0.1850604, 1, 1, 1, 1, 1,
-0.2624205, -1.08872, -3.173648, 1, 1, 1, 1, 1,
-0.2622163, 0.6754123, 0.3740215, 1, 1, 1, 1, 1,
-0.2609099, 1.435374, -1.38107, 1, 1, 1, 1, 1,
-0.2597907, 0.4640129, -0.09318174, 1, 1, 1, 1, 1,
-0.2575966, -0.5038195, -1.71945, 0, 0, 1, 1, 1,
-0.2565316, 0.2466941, 1.361707, 1, 0, 0, 1, 1,
-0.2564205, -2.361404, -4.417953, 1, 0, 0, 1, 1,
-0.2549998, -0.8602327, -2.503722, 1, 0, 0, 1, 1,
-0.2469454, -1.070456, -3.84621, 1, 0, 0, 1, 1,
-0.2469126, 0.04378412, -1.026479, 1, 0, 0, 1, 1,
-0.2459638, -3.838959, -2.557571, 0, 0, 0, 1, 1,
-0.2383619, -0.9042558, -4.092372, 0, 0, 0, 1, 1,
-0.2357345, -0.1351822, -0.7296205, 0, 0, 0, 1, 1,
-0.2340688, -1.474283, -2.420621, 0, 0, 0, 1, 1,
-0.2284893, 1.270536, 2.601465, 0, 0, 0, 1, 1,
-0.2261861, 0.8237594, 1.745987, 0, 0, 0, 1, 1,
-0.2212737, 1.014742, 0.42057, 0, 0, 0, 1, 1,
-0.2150399, -0.2062465, -1.858752, 1, 1, 1, 1, 1,
-0.2137074, 0.5982371, 0.2976114, 1, 1, 1, 1, 1,
-0.2118827, 0.6974075, 1.129043, 1, 1, 1, 1, 1,
-0.2071454, 2.104314, -0.7457304, 1, 1, 1, 1, 1,
-0.2032574, -1.221457, -3.106542, 1, 1, 1, 1, 1,
-0.2028778, -0.03145589, -3.823636, 1, 1, 1, 1, 1,
-0.2009967, -0.4882038, -4.538769, 1, 1, 1, 1, 1,
-0.199513, -0.9842063, -2.245341, 1, 1, 1, 1, 1,
-0.194313, -0.3198331, -2.367849, 1, 1, 1, 1, 1,
-0.1894035, -0.9543513, -2.89992, 1, 1, 1, 1, 1,
-0.1862199, 0.9309367, -0.1983131, 1, 1, 1, 1, 1,
-0.183484, 0.9374296, -1.102957, 1, 1, 1, 1, 1,
-0.1773508, 0.03287299, -1.383365, 1, 1, 1, 1, 1,
-0.1721872, 2.046214, -0.255029, 1, 1, 1, 1, 1,
-0.1713884, -1.580282, -3.589589, 1, 1, 1, 1, 1,
-0.1709629, 2.011997, 1.258772, 0, 0, 1, 1, 1,
-0.1704032, -0.8023315, -1.512084, 1, 0, 0, 1, 1,
-0.1680117, -0.6725535, -6.380745, 1, 0, 0, 1, 1,
-0.1635201, -0.3779556, -2.843958, 1, 0, 0, 1, 1,
-0.1623072, 0.3159381, 0.7954288, 1, 0, 0, 1, 1,
-0.1620582, -0.3113187, -1.925165, 1, 0, 0, 1, 1,
-0.157977, -0.7088679, -3.767663, 0, 0, 0, 1, 1,
-0.1533214, 1.386551, -0.4172515, 0, 0, 0, 1, 1,
-0.1522867, 0.64468, 0.8360028, 0, 0, 0, 1, 1,
-0.1518615, 0.4615955, 0.6434497, 0, 0, 0, 1, 1,
-0.1478982, -1.157405, -4.219478, 0, 0, 0, 1, 1,
-0.1433558, 0.7228252, -0.2916055, 0, 0, 0, 1, 1,
-0.1382245, -0.6849306, -2.041027, 0, 0, 0, 1, 1,
-0.137454, -0.891734, -3.790333, 1, 1, 1, 1, 1,
-0.1368185, 0.8675777, 0.3928563, 1, 1, 1, 1, 1,
-0.1296787, -1.518045, -2.040496, 1, 1, 1, 1, 1,
-0.1277332, -0.2564289, -0.8981358, 1, 1, 1, 1, 1,
-0.1230665, 0.6213479, -1.044274, 1, 1, 1, 1, 1,
-0.1153924, 0.6344391, 1.177734, 1, 1, 1, 1, 1,
-0.1121793, 0.4161333, -0.2446597, 1, 1, 1, 1, 1,
-0.1068643, 1.4637, 0.6234178, 1, 1, 1, 1, 1,
-0.1048568, 0.4467233, 0.3008001, 1, 1, 1, 1, 1,
-0.1036543, -0.3363608, -2.513103, 1, 1, 1, 1, 1,
-0.09485385, 1.5371, -0.6344614, 1, 1, 1, 1, 1,
-0.09455772, -1.041932, -2.444747, 1, 1, 1, 1, 1,
-0.08863476, -1.086258, -3.557936, 1, 1, 1, 1, 1,
-0.08298961, 2.55945, -1.37426, 1, 1, 1, 1, 1,
-0.07989696, 0.6468154, -0.5573954, 1, 1, 1, 1, 1,
-0.07870401, 0.4542445, 1.733979, 0, 0, 1, 1, 1,
-0.07694123, 0.6348543, 1.163705, 1, 0, 0, 1, 1,
-0.07606538, -0.08330722, -3.221043, 1, 0, 0, 1, 1,
-0.07597169, -0.4714368, -3.837123, 1, 0, 0, 1, 1,
-0.05907612, -0.7442796, -2.952152, 1, 0, 0, 1, 1,
-0.0586874, -0.2708319, -2.892039, 1, 0, 0, 1, 1,
-0.05567251, 0.3154511, 1.242637, 0, 0, 0, 1, 1,
-0.05341522, -0.2069547, -2.043822, 0, 0, 0, 1, 1,
-0.05210472, 0.6196012, 1.734815, 0, 0, 0, 1, 1,
-0.04855481, -0.4921429, -3.406819, 0, 0, 0, 1, 1,
-0.04513063, 1.169199, 0.6096096, 0, 0, 0, 1, 1,
-0.04373497, -0.0009886881, -1.80886, 0, 0, 0, 1, 1,
-0.02824267, -0.1036927, -3.62306, 0, 0, 0, 1, 1,
-0.02771055, 1.33736, -0.9530358, 1, 1, 1, 1, 1,
-0.02303089, 0.3940592, -0.269339, 1, 1, 1, 1, 1,
-0.01705655, -1.613762, -2.002413, 1, 1, 1, 1, 1,
-0.01538967, -0.5475569, -5.580492, 1, 1, 1, 1, 1,
-0.01109798, -0.2886981, -3.510769, 1, 1, 1, 1, 1,
-0.01104075, 0.6197252, -0.08560237, 1, 1, 1, 1, 1,
-0.01053979, 1.704211, -1.909956, 1, 1, 1, 1, 1,
-0.006416622, 1.043702, -0.244789, 1, 1, 1, 1, 1,
-0.005495335, -1.438747, -2.530464, 1, 1, 1, 1, 1,
-0.004711145, -0.4473295, -3.195099, 1, 1, 1, 1, 1,
-0.002740985, 1.794994, 1.733073, 1, 1, 1, 1, 1,
-0.002534814, 0.7615383, 1.129321, 1, 1, 1, 1, 1,
-0.002457327, -0.4145689, -1.905862, 1, 1, 1, 1, 1,
-0.00157153, 0.8973204, -1.01127, 1, 1, 1, 1, 1,
-0.001286299, 0.03102765, -0.02282123, 1, 1, 1, 1, 1,
-3.714245e-05, -0.5840061, -2.885381, 0, 0, 1, 1, 1,
0.0004930298, -2.317981, 1.71673, 1, 0, 0, 1, 1,
0.001559333, 0.6204525, -1.009404, 1, 0, 0, 1, 1,
0.003511593, -0.954246, 2.05427, 1, 0, 0, 1, 1,
0.005580625, 1.65868, 1.975283, 1, 0, 0, 1, 1,
0.009087023, 0.02423249, 0.1740364, 1, 0, 0, 1, 1,
0.01170511, -1.469758, 3.369313, 0, 0, 0, 1, 1,
0.01192195, 0.5782849, -0.9647948, 0, 0, 0, 1, 1,
0.01315851, -0.4666949, 1.61741, 0, 0, 0, 1, 1,
0.01536995, 0.7842643, 1.704357, 0, 0, 0, 1, 1,
0.01743666, -0.5030125, 4.89471, 0, 0, 0, 1, 1,
0.02103641, 1.385877, -0.1479484, 0, 0, 0, 1, 1,
0.02420177, 0.8358633, 0.8752457, 0, 0, 0, 1, 1,
0.02534003, 0.7577092, -1.025688, 1, 1, 1, 1, 1,
0.03022898, -1.229157, 4.043468, 1, 1, 1, 1, 1,
0.0307272, 0.6284587, 0.3908513, 1, 1, 1, 1, 1,
0.03582135, -0.8675848, 3.02953, 1, 1, 1, 1, 1,
0.04010282, -0.0989901, 2.632206, 1, 1, 1, 1, 1,
0.04279065, 0.1619682, 0.7061754, 1, 1, 1, 1, 1,
0.04665421, 0.5461736, -1.407342, 1, 1, 1, 1, 1,
0.05022292, -0.8402238, 3.979865, 1, 1, 1, 1, 1,
0.05198478, 0.6387522, 1.347255, 1, 1, 1, 1, 1,
0.05344785, -0.7383101, 1.864848, 1, 1, 1, 1, 1,
0.0534692, 2.979077, 0.05652342, 1, 1, 1, 1, 1,
0.05406136, -0.866137, 1.821765, 1, 1, 1, 1, 1,
0.05679948, 1.021796, -0.2857089, 1, 1, 1, 1, 1,
0.05956092, -0.03763974, 1.58433, 1, 1, 1, 1, 1,
0.06527671, -0.708226, 3.922582, 1, 1, 1, 1, 1,
0.06559702, 0.5219678, -0.3290612, 0, 0, 1, 1, 1,
0.06957223, -0.3430366, 2.81928, 1, 0, 0, 1, 1,
0.06995345, -0.04780788, 2.231456, 1, 0, 0, 1, 1,
0.07900245, -0.6642472, 3.647608, 1, 0, 0, 1, 1,
0.07973485, 0.2264633, 0.009664344, 1, 0, 0, 1, 1,
0.08397233, 1.50057, -1.056035, 1, 0, 0, 1, 1,
0.0848323, -0.5721751, 2.565857, 0, 0, 0, 1, 1,
0.08546031, -0.3825862, 4.09596, 0, 0, 0, 1, 1,
0.08587356, -1.892674, 1.659128, 0, 0, 0, 1, 1,
0.0874924, -1.882272, 3.259807, 0, 0, 0, 1, 1,
0.09325139, 0.2092067, -0.0006504873, 0, 0, 0, 1, 1,
0.09551159, -0.4089106, 3.318401, 0, 0, 0, 1, 1,
0.09934248, 0.9172069, 1.301206, 0, 0, 0, 1, 1,
0.1083764, -0.2474678, 1.722272, 1, 1, 1, 1, 1,
0.1192785, -0.9458072, 3.718902, 1, 1, 1, 1, 1,
0.1192795, -0.05391238, -0.4658171, 1, 1, 1, 1, 1,
0.1203835, 0.09504022, 0.2317349, 1, 1, 1, 1, 1,
0.1222232, -0.3748969, 3.56533, 1, 1, 1, 1, 1,
0.1222863, 0.01310555, 2.461576, 1, 1, 1, 1, 1,
0.1236658, 0.6904717, -0.4093182, 1, 1, 1, 1, 1,
0.1238612, -0.8123521, 3.106535, 1, 1, 1, 1, 1,
0.1254622, 1.149643, -1.811789, 1, 1, 1, 1, 1,
0.1262349, 0.2327106, 0.5512657, 1, 1, 1, 1, 1,
0.1286717, 0.6790698, 0.5563307, 1, 1, 1, 1, 1,
0.1287648, -0.02965948, 1.579499, 1, 1, 1, 1, 1,
0.1305582, 0.3676623, 1.380349, 1, 1, 1, 1, 1,
0.1318621, 0.5189224, -0.6298954, 1, 1, 1, 1, 1,
0.1336278, -2.622402, 4.261104, 1, 1, 1, 1, 1,
0.1347172, -0.9328655, 2.773266, 0, 0, 1, 1, 1,
0.1351233, 1.741269, -2.193807, 1, 0, 0, 1, 1,
0.1359455, -0.3921283, 2.69305, 1, 0, 0, 1, 1,
0.1389715, 0.3864519, -2.810387, 1, 0, 0, 1, 1,
0.1416001, -0.5186133, 3.432135, 1, 0, 0, 1, 1,
0.1451728, 1.748817, -0.7899936, 1, 0, 0, 1, 1,
0.1465271, -0.6625104, 3.445393, 0, 0, 0, 1, 1,
0.1472671, 0.2326989, 2.236013, 0, 0, 0, 1, 1,
0.1498729, 0.1753341, -0.03142224, 0, 0, 0, 1, 1,
0.1504803, -0.2813537, 1.04653, 0, 0, 0, 1, 1,
0.1513677, 0.1576578, -0.6392237, 0, 0, 0, 1, 1,
0.1574005, -0.3031268, 1.569025, 0, 0, 0, 1, 1,
0.1586291, 0.6987659, -0.2461615, 0, 0, 0, 1, 1,
0.1594785, -1.959708, 2.966691, 1, 1, 1, 1, 1,
0.1603744, 0.5281442, -0.7531143, 1, 1, 1, 1, 1,
0.1729868, 0.7150285, -1.781409, 1, 1, 1, 1, 1,
0.1771836, 0.7995248, 0.967707, 1, 1, 1, 1, 1,
0.1867913, -0.6111314, 2.611954, 1, 1, 1, 1, 1,
0.1954168, -0.05242443, 0.9677308, 1, 1, 1, 1, 1,
0.1977169, 0.6175417, -0.1937406, 1, 1, 1, 1, 1,
0.2010666, 1.062349, 0.1724102, 1, 1, 1, 1, 1,
0.2029182, -1.195695, 1.624923, 1, 1, 1, 1, 1,
0.2038042, 0.9896096, 0.06551606, 1, 1, 1, 1, 1,
0.2153298, -1.186134, 1.891797, 1, 1, 1, 1, 1,
0.2231684, 0.4700204, 0.1594834, 1, 1, 1, 1, 1,
0.2255698, 0.344088, 0.2925118, 1, 1, 1, 1, 1,
0.2349263, -0.9593413, 1.952807, 1, 1, 1, 1, 1,
0.2371899, -1.048011, 2.080684, 1, 1, 1, 1, 1,
0.2399348, -1.486748, 3.525808, 0, 0, 1, 1, 1,
0.2492799, -0.3514639, 0.8810789, 1, 0, 0, 1, 1,
0.2515458, 1.486838, -0.552658, 1, 0, 0, 1, 1,
0.2534474, 0.5542858, -0.7308233, 1, 0, 0, 1, 1,
0.2550557, 0.3403037, 0.8888747, 1, 0, 0, 1, 1,
0.2576815, 0.7672638, 1.978591, 1, 0, 0, 1, 1,
0.2586024, 1.070109, 1.048579, 0, 0, 0, 1, 1,
0.2586536, -0.2799935, 3.858396, 0, 0, 0, 1, 1,
0.2603565, -1.692059, 3.753335, 0, 0, 0, 1, 1,
0.2626117, 0.5636105, 0.4047127, 0, 0, 0, 1, 1,
0.2637915, -0.8503509, 2.313227, 0, 0, 0, 1, 1,
0.2648747, -0.1343833, 1.940163, 0, 0, 0, 1, 1,
0.2691231, -0.9727291, 2.925307, 0, 0, 0, 1, 1,
0.2719635, 0.2105429, 0.9008495, 1, 1, 1, 1, 1,
0.2760013, 0.3687865, 0.45766, 1, 1, 1, 1, 1,
0.2767236, -1.744495, 3.288996, 1, 1, 1, 1, 1,
0.2818353, 0.9615254, 1.167656, 1, 1, 1, 1, 1,
0.2844677, -1.513109, 2.190058, 1, 1, 1, 1, 1,
0.2862974, 0.1099336, 1.096784, 1, 1, 1, 1, 1,
0.2879119, 0.6481149, 0.4272806, 1, 1, 1, 1, 1,
0.2954971, 1.251472, -0.09564266, 1, 1, 1, 1, 1,
0.2962579, 0.6117818, 1.75086, 1, 1, 1, 1, 1,
0.2963248, 0.8355993, -0.6679508, 1, 1, 1, 1, 1,
0.2968009, 0.4663056, -0.9379714, 1, 1, 1, 1, 1,
0.2980891, -0.0564509, 1.155066, 1, 1, 1, 1, 1,
0.3005396, 0.2605777, 0.2392572, 1, 1, 1, 1, 1,
0.3036789, -0.6592519, 3.144101, 1, 1, 1, 1, 1,
0.3041097, -0.4066148, 3.138832, 1, 1, 1, 1, 1,
0.305634, 0.8252504, -0.8205726, 0, 0, 1, 1, 1,
0.3058169, -1.648495, 4.000652, 1, 0, 0, 1, 1,
0.3097353, -2.136549, 4.482417, 1, 0, 0, 1, 1,
0.309903, -0.3114602, 0.1753425, 1, 0, 0, 1, 1,
0.3118659, -1.560521, 1.941216, 1, 0, 0, 1, 1,
0.3125806, 0.1361246, 0.7282524, 1, 0, 0, 1, 1,
0.3158461, -0.8211117, 1.985929, 0, 0, 0, 1, 1,
0.3172329, -1.925691, 3.099768, 0, 0, 0, 1, 1,
0.3182802, 0.367814, 1.193166, 0, 0, 0, 1, 1,
0.320861, 1.312543, -0.4629185, 0, 0, 0, 1, 1,
0.3263034, 1.524741, -0.9971402, 0, 0, 0, 1, 1,
0.3353537, -0.651373, 1.906736, 0, 0, 0, 1, 1,
0.3367083, -0.3304761, 2.943387, 0, 0, 0, 1, 1,
0.3380243, 0.03792191, 2.903024, 1, 1, 1, 1, 1,
0.3448485, 1.164604, 0.1641724, 1, 1, 1, 1, 1,
0.3452794, 0.8011103, 0.2147824, 1, 1, 1, 1, 1,
0.346976, 0.3198365, -0.4036648, 1, 1, 1, 1, 1,
0.3502451, -1.312225, 1.68704, 1, 1, 1, 1, 1,
0.3509938, -0.3153571, 2.72466, 1, 1, 1, 1, 1,
0.3518195, -1.807692, 2.298062, 1, 1, 1, 1, 1,
0.3537764, -0.2408738, 1.388255, 1, 1, 1, 1, 1,
0.3563033, 0.7264294, 0.2275344, 1, 1, 1, 1, 1,
0.3656833, -0.2495957, 3.156411, 1, 1, 1, 1, 1,
0.3676999, 0.6712241, 1.273219, 1, 1, 1, 1, 1,
0.368176, -0.2369577, 1.57667, 1, 1, 1, 1, 1,
0.3718537, -1.860566, 3.111903, 1, 1, 1, 1, 1,
0.3722369, 1.029614, 0.176333, 1, 1, 1, 1, 1,
0.3730685, 0.3510456, 1.880349, 1, 1, 1, 1, 1,
0.3745777, 0.4714794, 0.5566003, 0, 0, 1, 1, 1,
0.3749976, 0.09271982, 0.2519028, 1, 0, 0, 1, 1,
0.3793599, 0.2802726, -0.02640011, 1, 0, 0, 1, 1,
0.3801183, 2.611898, -0.8982517, 1, 0, 0, 1, 1,
0.3805096, 1.377142, 1.870698, 1, 0, 0, 1, 1,
0.3830581, 1.3329, -1.531396, 1, 0, 0, 1, 1,
0.3840674, -0.7390049, 4.483407, 0, 0, 0, 1, 1,
0.3841162, 0.6183209, 1.063185, 0, 0, 0, 1, 1,
0.3868438, -0.6154485, 2.860008, 0, 0, 0, 1, 1,
0.3874488, 1.297294, 0.185124, 0, 0, 0, 1, 1,
0.3902758, 0.2880844, 2.280299, 0, 0, 0, 1, 1,
0.3937474, 0.5505442, 2.920908, 0, 0, 0, 1, 1,
0.3968568, 0.06764404, 0.0143691, 0, 0, 0, 1, 1,
0.3971393, -1.153618, 2.861187, 1, 1, 1, 1, 1,
0.4084522, -1.416161, 2.475485, 1, 1, 1, 1, 1,
0.4090436, -0.9409564, 0.1575842, 1, 1, 1, 1, 1,
0.4114074, 1.149231, 1.434449, 1, 1, 1, 1, 1,
0.4162335, 0.4212686, 2.740066, 1, 1, 1, 1, 1,
0.4167956, -0.2264496, 3.099221, 1, 1, 1, 1, 1,
0.42106, -1.264985, 4.070791, 1, 1, 1, 1, 1,
0.4246642, -1.382543, 3.449555, 1, 1, 1, 1, 1,
0.4250254, 1.389987, 1.547853, 1, 1, 1, 1, 1,
0.4273228, 0.6427434, 1.686336, 1, 1, 1, 1, 1,
0.4285192, -1.495106, 3.290792, 1, 1, 1, 1, 1,
0.4322411, 0.1320029, 1.051018, 1, 1, 1, 1, 1,
0.4323101, -0.3733752, 1.445887, 1, 1, 1, 1, 1,
0.4359329, -0.6224247, 2.505446, 1, 1, 1, 1, 1,
0.4384838, -0.4700596, 2.746486, 1, 1, 1, 1, 1,
0.4433166, -1.944008, 3.707564, 0, 0, 1, 1, 1,
0.4438407, 0.148378, 3.108599, 1, 0, 0, 1, 1,
0.4453719, 0.3341416, 0.9565831, 1, 0, 0, 1, 1,
0.446903, 0.9161813, -0.2221496, 1, 0, 0, 1, 1,
0.4474417, -0.4756215, 2.18739, 1, 0, 0, 1, 1,
0.448245, -0.6190184, 2.381331, 1, 0, 0, 1, 1,
0.4501009, -0.3083349, 3.232104, 0, 0, 0, 1, 1,
0.4519196, -0.384019, 3.109463, 0, 0, 0, 1, 1,
0.4523208, -1.513907, 1.757585, 0, 0, 0, 1, 1,
0.4524251, -2.69402, 2.369608, 0, 0, 0, 1, 1,
0.4540256, -1.860887, 3.223734, 0, 0, 0, 1, 1,
0.4544443, -1.615499, 3.999581, 0, 0, 0, 1, 1,
0.4575154, -0.2032293, 0.2514118, 0, 0, 0, 1, 1,
0.4630985, -0.7624691, 4.724705, 1, 1, 1, 1, 1,
0.4645692, 0.6028332, 1.5825, 1, 1, 1, 1, 1,
0.4677946, -0.1949806, 2.21177, 1, 1, 1, 1, 1,
0.4721442, -0.2736707, 3.287525, 1, 1, 1, 1, 1,
0.4724358, -1.268499, 4.426937, 1, 1, 1, 1, 1,
0.4754142, 1.178963, 1.651467, 1, 1, 1, 1, 1,
0.4779814, -1.240004, 1.558703, 1, 1, 1, 1, 1,
0.4816194, 1.127806, -1.22012, 1, 1, 1, 1, 1,
0.4831437, -0.02642387, 2.042679, 1, 1, 1, 1, 1,
0.4849581, 1.191502, -0.2568247, 1, 1, 1, 1, 1,
0.4875923, -1.754264, 3.282954, 1, 1, 1, 1, 1,
0.4876997, -0.1067678, 2.595578, 1, 1, 1, 1, 1,
0.4881656, -0.2192461, 1.431059, 1, 1, 1, 1, 1,
0.4918788, 0.2712227, 0.8402957, 1, 1, 1, 1, 1,
0.4925727, 0.05556336, 1.40244, 1, 1, 1, 1, 1,
0.4949554, -0.8955256, 1.879298, 0, 0, 1, 1, 1,
0.4951684, 0.2847028, 1.142832, 1, 0, 0, 1, 1,
0.4976428, 1.24045, 0.9183373, 1, 0, 0, 1, 1,
0.498588, 1.027312, 0.4403957, 1, 0, 0, 1, 1,
0.5049204, -0.9542408, 1.718854, 1, 0, 0, 1, 1,
0.5077173, 1.03906, 0.6290992, 1, 0, 0, 1, 1,
0.5168394, -0.1706149, 2.758013, 0, 0, 0, 1, 1,
0.5193841, 0.7434081, 0.186776, 0, 0, 0, 1, 1,
0.5202015, -0.7551823, 1.105402, 0, 0, 0, 1, 1,
0.5211667, 1.329947, 1.68219, 0, 0, 0, 1, 1,
0.5213401, 1.582758, 0.6190107, 0, 0, 0, 1, 1,
0.5214248, 0.2375821, 1.426154, 0, 0, 0, 1, 1,
0.5225229, -0.5300097, 1.690941, 0, 0, 0, 1, 1,
0.526937, -0.1937841, 1.034132, 1, 1, 1, 1, 1,
0.5272399, 0.6190735, 1.177711, 1, 1, 1, 1, 1,
0.5306866, -0.910718, 2.936614, 1, 1, 1, 1, 1,
0.5332253, 0.1786257, 1.592415, 1, 1, 1, 1, 1,
0.5334629, -0.442377, 2.191706, 1, 1, 1, 1, 1,
0.5392807, 0.4782794, 0.3250548, 1, 1, 1, 1, 1,
0.5403548, 0.4400499, 2.301251, 1, 1, 1, 1, 1,
0.5431478, -0.6128106, 3.879075, 1, 1, 1, 1, 1,
0.5450188, 0.3595628, 0.904613, 1, 1, 1, 1, 1,
0.5452494, 0.001060639, 2.10613, 1, 1, 1, 1, 1,
0.5467756, 0.7198389, 0.2843059, 1, 1, 1, 1, 1,
0.550174, -1.711926, 3.936531, 1, 1, 1, 1, 1,
0.5537277, 0.3813902, -0.4333797, 1, 1, 1, 1, 1,
0.5540026, 1.739211, -0.9439476, 1, 1, 1, 1, 1,
0.5559012, -0.8998661, 3.270984, 1, 1, 1, 1, 1,
0.5577316, -0.9270163, 1.758313, 0, 0, 1, 1, 1,
0.5586439, -0.1178292, 2.40329, 1, 0, 0, 1, 1,
0.563444, -0.0008541131, 3.04475, 1, 0, 0, 1, 1,
0.5648735, -1.008054, 2.653155, 1, 0, 0, 1, 1,
0.5719598, 0.4919917, 0.4760893, 1, 0, 0, 1, 1,
0.5726021, 0.30495, 0.1662795, 1, 0, 0, 1, 1,
0.5764265, -0.614818, 1.570715, 0, 0, 0, 1, 1,
0.5954436, 1.260566, 1.073272, 0, 0, 0, 1, 1,
0.5969828, 1.567392, 0.7424113, 0, 0, 0, 1, 1,
0.6045161, -0.4655679, 2.829551, 0, 0, 0, 1, 1,
0.604758, -0.3183102, 1.819101, 0, 0, 0, 1, 1,
0.6091947, -0.1209044, 2.610539, 0, 0, 0, 1, 1,
0.6092659, 0.4220225, 1.750292, 0, 0, 0, 1, 1,
0.6114491, -0.1967281, 0.2600234, 1, 1, 1, 1, 1,
0.6135271, -0.1839444, 1.714701, 1, 1, 1, 1, 1,
0.6156368, -0.3720906, 0.8560163, 1, 1, 1, 1, 1,
0.616912, -0.0008132657, 0.9883643, 1, 1, 1, 1, 1,
0.6207189, 0.6608781, 1.657662, 1, 1, 1, 1, 1,
0.6226127, -0.6895782, 2.149727, 1, 1, 1, 1, 1,
0.6267179, -2.123214, 2.079486, 1, 1, 1, 1, 1,
0.6286817, -0.7883695, 3.657712, 1, 1, 1, 1, 1,
0.6298458, -0.9298908, 4.274148, 1, 1, 1, 1, 1,
0.6301724, 0.006285948, 0.6136003, 1, 1, 1, 1, 1,
0.6351417, 0.1277385, 2.168516, 1, 1, 1, 1, 1,
0.6353568, -0.6148985, 1.186179, 1, 1, 1, 1, 1,
0.638437, 0.03957202, 3.21999, 1, 1, 1, 1, 1,
0.6421509, 1.56589, -0.3712125, 1, 1, 1, 1, 1,
0.644981, 1.211167, 1.22154, 1, 1, 1, 1, 1,
0.6458628, 0.8315498, 0.1661319, 0, 0, 1, 1, 1,
0.6469789, -1.081901, 1.685079, 1, 0, 0, 1, 1,
0.6471123, 0.8795775, 1.30242, 1, 0, 0, 1, 1,
0.6481847, -1.692086, 2.585552, 1, 0, 0, 1, 1,
0.6482243, -0.4852733, 0.4805965, 1, 0, 0, 1, 1,
0.6513904, -0.4982218, 1.562251, 1, 0, 0, 1, 1,
0.6552857, 0.307909, -0.7980474, 0, 0, 0, 1, 1,
0.6556813, 0.8715104, 0.7177759, 0, 0, 0, 1, 1,
0.659234, -0.9759358, 3.47658, 0, 0, 0, 1, 1,
0.6610773, -0.6100147, 3.205554, 0, 0, 0, 1, 1,
0.6618654, -0.9569014, 3.571126, 0, 0, 0, 1, 1,
0.6635804, -1.155609, 3.958438, 0, 0, 0, 1, 1,
0.664439, -0.8069194, 4.157376, 0, 0, 0, 1, 1,
0.6689942, 0.8899838, 0.5605419, 1, 1, 1, 1, 1,
0.6692934, -0.1726561, 3.264635, 1, 1, 1, 1, 1,
0.6713404, -2.592239, 2.590825, 1, 1, 1, 1, 1,
0.6724173, 0.5134861, 1.194349, 1, 1, 1, 1, 1,
0.6735022, -0.8556365, 2.581305, 1, 1, 1, 1, 1,
0.6764359, -0.07768071, 1.237893, 1, 1, 1, 1, 1,
0.6819074, -1.73602, 2.42284, 1, 1, 1, 1, 1,
0.6847169, -1.245627, 3.312652, 1, 1, 1, 1, 1,
0.6852785, 0.7640321, -0.8618499, 1, 1, 1, 1, 1,
0.6858117, -1.457686, 3.737865, 1, 1, 1, 1, 1,
0.6931149, -0.6181837, 3.077112, 1, 1, 1, 1, 1,
0.6950734, 0.9300957, 2.355068, 1, 1, 1, 1, 1,
0.6974826, -0.7897858, 2.831074, 1, 1, 1, 1, 1,
0.6984619, 0.5289477, 0.01488632, 1, 1, 1, 1, 1,
0.7043834, -0.5360914, 2.156014, 1, 1, 1, 1, 1,
0.705456, -0.8735493, 1.558146, 0, 0, 1, 1, 1,
0.7112408, -0.2599247, -0.2552266, 1, 0, 0, 1, 1,
0.7152557, -2.21827, 1.111954, 1, 0, 0, 1, 1,
0.7153438, 0.508803, -0.1543416, 1, 0, 0, 1, 1,
0.7183852, -0.4329515, 2.412407, 1, 0, 0, 1, 1,
0.7231366, -1.253706, 3.463775, 1, 0, 0, 1, 1,
0.7240975, -0.02267066, 1.927413, 0, 0, 0, 1, 1,
0.726145, -0.2856662, 2.185341, 0, 0, 0, 1, 1,
0.7299544, 0.2205522, 0.6882978, 0, 0, 0, 1, 1,
0.733103, -0.8996937, 2.983739, 0, 0, 0, 1, 1,
0.7378123, 0.698384, -0.01912586, 0, 0, 0, 1, 1,
0.7381288, -0.9811972, 3.15177, 0, 0, 0, 1, 1,
0.7386323, -1.315181, 4.907626, 0, 0, 0, 1, 1,
0.7401623, 0.3391104, 1.815958, 1, 1, 1, 1, 1,
0.7421626, -0.007111056, 1.12026, 1, 1, 1, 1, 1,
0.7433009, 0.238158, 0.4748455, 1, 1, 1, 1, 1,
0.7487045, -2.264375, 1.832635, 1, 1, 1, 1, 1,
0.7500035, -0.5479305, 2.744077, 1, 1, 1, 1, 1,
0.7526115, 0.08045155, 2.147052, 1, 1, 1, 1, 1,
0.7560039, -0.7424024, 2.217474, 1, 1, 1, 1, 1,
0.7605328, 0.6707732, 0.08774418, 1, 1, 1, 1, 1,
0.768734, -0.6177205, 0.2006126, 1, 1, 1, 1, 1,
0.7701409, -0.826252, 1.968243, 1, 1, 1, 1, 1,
0.7707671, -1.954973, 2.028293, 1, 1, 1, 1, 1,
0.7732275, 0.1936586, -0.7120612, 1, 1, 1, 1, 1,
0.7734312, 0.8581743, 0.6218815, 1, 1, 1, 1, 1,
0.783436, -0.7778262, 2.222412, 1, 1, 1, 1, 1,
0.7913789, -0.1002831, 1.540481, 1, 1, 1, 1, 1,
0.7923525, 2.209296, 0.9839244, 0, 0, 1, 1, 1,
0.7942736, 0.9813278, 2.907013, 1, 0, 0, 1, 1,
0.7955196, -0.1164534, 1.036377, 1, 0, 0, 1, 1,
0.7963513, -0.2010678, 0.9197428, 1, 0, 0, 1, 1,
0.8017452, -0.4269784, 2.362469, 1, 0, 0, 1, 1,
0.8033952, 0.4997309, 2.000232, 1, 0, 0, 1, 1,
0.8048582, 0.1302499, 1.71689, 0, 0, 0, 1, 1,
0.8094596, 0.1832345, 0.7526205, 0, 0, 0, 1, 1,
0.8117276, 0.02783798, 2.879248, 0, 0, 0, 1, 1,
0.8134196, -0.8445168, 3.306709, 0, 0, 0, 1, 1,
0.8222501, 0.5724285, 0.3016336, 0, 0, 0, 1, 1,
0.8256086, -0.7981238, 2.572119, 0, 0, 0, 1, 1,
0.8263473, 1.290267, -1.783859, 0, 0, 0, 1, 1,
0.8267692, 1.798958, 1.35488, 1, 1, 1, 1, 1,
0.8291911, 0.6004534, 0.3847264, 1, 1, 1, 1, 1,
0.8307514, 0.7665663, 0.4574766, 1, 1, 1, 1, 1,
0.832355, 0.3838499, 1.811025, 1, 1, 1, 1, 1,
0.8340347, 0.6428483, -0.5917238, 1, 1, 1, 1, 1,
0.8344959, -1.276534, 4.163422, 1, 1, 1, 1, 1,
0.8364331, 1.402537, -0.908316, 1, 1, 1, 1, 1,
0.840637, -0.7420186, 3.162736, 1, 1, 1, 1, 1,
0.8425907, -0.8159615, 2.139656, 1, 1, 1, 1, 1,
0.8458642, 0.4953671, 0.9797493, 1, 1, 1, 1, 1,
0.8484374, -0.09622625, 2.345002, 1, 1, 1, 1, 1,
0.8494728, 0.9975657, 1.606619, 1, 1, 1, 1, 1,
0.8517169, -0.05013488, 1.628819, 1, 1, 1, 1, 1,
0.8534692, -0.4078771, 1.212168, 1, 1, 1, 1, 1,
0.8537115, -1.17914, 2.335222, 1, 1, 1, 1, 1,
0.8591936, -0.6105581, 1.611336, 0, 0, 1, 1, 1,
0.8595853, 0.3342306, 1.962498, 1, 0, 0, 1, 1,
0.8618471, 0.1509336, 3.555131, 1, 0, 0, 1, 1,
0.8632492, -0.6603042, 2.987262, 1, 0, 0, 1, 1,
0.864227, -0.02945684, 2.154371, 1, 0, 0, 1, 1,
0.8648729, -0.7475717, 2.559154, 1, 0, 0, 1, 1,
0.8669572, -0.7681223, 0.1415043, 0, 0, 0, 1, 1,
0.8724357, 0.769575, 0.4533789, 0, 0, 0, 1, 1,
0.8750577, 0.06860784, 1.112492, 0, 0, 0, 1, 1,
0.8811932, 1.208095, -0.73274, 0, 0, 0, 1, 1,
0.8828181, -0.7605191, 2.681437, 0, 0, 0, 1, 1,
0.8856164, -1.025052, 3.265213, 0, 0, 0, 1, 1,
0.8991556, 0.972032, 0.5408717, 0, 0, 0, 1, 1,
0.8997999, 0.8969076, 0.1546971, 1, 1, 1, 1, 1,
0.8999913, -0.241466, 0.8027939, 1, 1, 1, 1, 1,
0.901287, 0.02803629, 0.8913124, 1, 1, 1, 1, 1,
0.903801, -2.168456, 3.480726, 1, 1, 1, 1, 1,
0.9047052, -0.321389, 1.561674, 1, 1, 1, 1, 1,
0.9111193, -0.4943474, 1.93374, 1, 1, 1, 1, 1,
0.9169091, 1.454124, -1.233737, 1, 1, 1, 1, 1,
0.9239292, 0.6855615, -0.0696532, 1, 1, 1, 1, 1,
0.9243411, -0.2375274, 1.489673, 1, 1, 1, 1, 1,
0.9244226, -1.374709, 3.653281, 1, 1, 1, 1, 1,
0.9332552, -0.1416484, 2.189267, 1, 1, 1, 1, 1,
0.9368834, 1.051878, 1.776882, 1, 1, 1, 1, 1,
0.9435144, -0.7595932, 2.46005, 1, 1, 1, 1, 1,
0.9442502, 1.297612, -0.11275, 1, 1, 1, 1, 1,
0.9521149, -1.419087, 3.623139, 1, 1, 1, 1, 1,
0.9546728, 0.455767, 0.9064631, 0, 0, 1, 1, 1,
0.9576335, 0.07891466, 2.047435, 1, 0, 0, 1, 1,
0.9626261, 0.7152866, 0.1147631, 1, 0, 0, 1, 1,
0.9648338, -0.4635581, 2.95814, 1, 0, 0, 1, 1,
0.9732879, 0.5754445, -0.9902335, 1, 0, 0, 1, 1,
0.9759283, 0.007268643, -0.03982123, 1, 0, 0, 1, 1,
0.9772314, 0.7513633, 1.391635, 0, 0, 0, 1, 1,
0.9782971, 0.1170854, 0.7321113, 0, 0, 0, 1, 1,
1.001474, 0.09533328, 0.8814363, 0, 0, 0, 1, 1,
1.006211, 0.09723619, 2.618953, 0, 0, 0, 1, 1,
1.006422, -0.5989968, 2.532595, 0, 0, 0, 1, 1,
1.007157, -1.660107, 2.011602, 0, 0, 0, 1, 1,
1.010097, 1.844338, 1.695872, 0, 0, 0, 1, 1,
1.01063, -0.2015823, 1.655493, 1, 1, 1, 1, 1,
1.011775, 1.37105, 1.094034, 1, 1, 1, 1, 1,
1.015028, 0.08797295, 1.314534, 1, 1, 1, 1, 1,
1.022279, -0.1966775, 2.089164, 1, 1, 1, 1, 1,
1.046278, 0.3732573, 2.54125, 1, 1, 1, 1, 1,
1.050108, 1.351255, -1.72793, 1, 1, 1, 1, 1,
1.058545, -0.9739096, 1.111157, 1, 1, 1, 1, 1,
1.067147, 1.610112, 0.5264997, 1, 1, 1, 1, 1,
1.06835, 0.5417003, 0.9808149, 1, 1, 1, 1, 1,
1.072298, -0.2253747, 1.228398, 1, 1, 1, 1, 1,
1.0727, 0.77403, 1.989629, 1, 1, 1, 1, 1,
1.073233, -0.4225415, 0.8364437, 1, 1, 1, 1, 1,
1.074051, 1.540674, -0.0328837, 1, 1, 1, 1, 1,
1.08042, -0.5595851, 0.3347791, 1, 1, 1, 1, 1,
1.081082, -0.7263928, 3.060575, 1, 1, 1, 1, 1,
1.083053, 0.9612158, 1.100981, 0, 0, 1, 1, 1,
1.084966, 0.20394, 3.080258, 1, 0, 0, 1, 1,
1.090896, 1.449505, 0.9042804, 1, 0, 0, 1, 1,
1.096429, 1.828973, -0.4743896, 1, 0, 0, 1, 1,
1.099343, 0.9525707, 0.3948328, 1, 0, 0, 1, 1,
1.099938, -2.597984, 3.928177, 1, 0, 0, 1, 1,
1.10188, -1.356517, 1.937866, 0, 0, 0, 1, 1,
1.112706, -0.317955, 1.641414, 0, 0, 0, 1, 1,
1.113569, 0.985526, 0.9333727, 0, 0, 0, 1, 1,
1.113956, -0.5537774, 0.63894, 0, 0, 0, 1, 1,
1.117699, 0.7762955, 1.522821, 0, 0, 0, 1, 1,
1.120689, 1.674015, -0.09801149, 0, 0, 0, 1, 1,
1.121149, 0.2090476, -0.3083853, 0, 0, 0, 1, 1,
1.121169, -1.81594, 3.586593, 1, 1, 1, 1, 1,
1.125129, 1.522477, 1.144754, 1, 1, 1, 1, 1,
1.125207, 1.573484, 0.0741469, 1, 1, 1, 1, 1,
1.142121, -0.3984219, 2.021532, 1, 1, 1, 1, 1,
1.142651, -0.9070093, 3.256843, 1, 1, 1, 1, 1,
1.143972, 0.2659788, 1.657354, 1, 1, 1, 1, 1,
1.145984, -1.257139, 2.000385, 1, 1, 1, 1, 1,
1.146188, -1.08534, 1.537309, 1, 1, 1, 1, 1,
1.148794, -1.057965, 2.458355, 1, 1, 1, 1, 1,
1.155985, -0.5778351, 0.4836619, 1, 1, 1, 1, 1,
1.156188, -0.009203548, 1.593682, 1, 1, 1, 1, 1,
1.157187, -0.1111064, 2.403298, 1, 1, 1, 1, 1,
1.165137, 0.2493772, 1.583865, 1, 1, 1, 1, 1,
1.167647, 0.7096327, -0.9731736, 1, 1, 1, 1, 1,
1.17045, -0.2933532, 2.334033, 1, 1, 1, 1, 1,
1.185334, 0.8505245, -0.8684874, 0, 0, 1, 1, 1,
1.191866, -1.479484, 1.691117, 1, 0, 0, 1, 1,
1.201664, 0.7725194, 1.447142, 1, 0, 0, 1, 1,
1.206421, 0.24588, 0.9833298, 1, 0, 0, 1, 1,
1.20959, -0.4156188, 2.046349, 1, 0, 0, 1, 1,
1.218744, -0.6559079, 1.239326, 1, 0, 0, 1, 1,
1.219657, 0.5002657, 2.715919, 0, 0, 0, 1, 1,
1.223725, 1.402413, 2.397018, 0, 0, 0, 1, 1,
1.23122, 1.419236, 0.1068631, 0, 0, 0, 1, 1,
1.234725, -0.4668428, 2.965964, 0, 0, 0, 1, 1,
1.237778, -0.5050254, 2.062111, 0, 0, 0, 1, 1,
1.239564, -2.051769, 0.4238906, 0, 0, 0, 1, 1,
1.247127, -0.3101974, 0.2613334, 0, 0, 0, 1, 1,
1.248114, -0.9998733, 2.908285, 1, 1, 1, 1, 1,
1.257392, -1.309307, 1.715496, 1, 1, 1, 1, 1,
1.258667, -0.2239839, -0.3880484, 1, 1, 1, 1, 1,
1.259499, 1.198013, 0.2938873, 1, 1, 1, 1, 1,
1.264775, -0.2005588, 1.732514, 1, 1, 1, 1, 1,
1.273356, 0.1259683, 1.281641, 1, 1, 1, 1, 1,
1.277895, 0.3068796, -0.8565087, 1, 1, 1, 1, 1,
1.278076, -2.502328, 2.140771, 1, 1, 1, 1, 1,
1.27885, 1.545303, 0.6212999, 1, 1, 1, 1, 1,
1.283695, 0.01961765, 1.438926, 1, 1, 1, 1, 1,
1.283926, 0.6776276, 0.6493865, 1, 1, 1, 1, 1,
1.292941, 0.845262, 3.517761, 1, 1, 1, 1, 1,
1.296542, -0.5941796, 1.724044, 1, 1, 1, 1, 1,
1.297191, 0.2272893, -1.367797, 1, 1, 1, 1, 1,
1.29757, 0.06908707, 0.9439405, 1, 1, 1, 1, 1,
1.29983, -0.4889046, 0.7839144, 0, 0, 1, 1, 1,
1.300315, 0.5618377, 0.8949665, 1, 0, 0, 1, 1,
1.306685, 0.08195326, 3.145746, 1, 0, 0, 1, 1,
1.311024, 1.253182, 2.324596, 1, 0, 0, 1, 1,
1.316113, 2.7507, -0.9708242, 1, 0, 0, 1, 1,
1.32618, 2.265995, -0.4659911, 1, 0, 0, 1, 1,
1.32704, -0.5129145, 1.693572, 0, 0, 0, 1, 1,
1.334558, -0.0530504, -0.1371775, 0, 0, 0, 1, 1,
1.340391, -0.6886567, 1.94303, 0, 0, 0, 1, 1,
1.341069, 0.6889445, 2.291327, 0, 0, 0, 1, 1,
1.344976, -0.8973818, 2.811315, 0, 0, 0, 1, 1,
1.354639, 0.7588199, 4.025568, 0, 0, 0, 1, 1,
1.361008, 1.730458, -0.8816978, 0, 0, 0, 1, 1,
1.362189, -0.5620074, 0.02396289, 1, 1, 1, 1, 1,
1.376824, 0.2769001, 2.8607, 1, 1, 1, 1, 1,
1.382434, -1.988232, 3.414088, 1, 1, 1, 1, 1,
1.394448, 1.163366, 0.5277941, 1, 1, 1, 1, 1,
1.395263, -0.3086086, 1.837397, 1, 1, 1, 1, 1,
1.416589, -0.8262073, 2.817886, 1, 1, 1, 1, 1,
1.418569, -1.754545, 2.964181, 1, 1, 1, 1, 1,
1.418949, 0.6611139, 0.3206404, 1, 1, 1, 1, 1,
1.431516, -0.7011446, 3.208412, 1, 1, 1, 1, 1,
1.433399, 0.2265876, -0.06881233, 1, 1, 1, 1, 1,
1.43346, -0.08916169, 0.3713665, 1, 1, 1, 1, 1,
1.445155, 1.742001, 0.7863868, 1, 1, 1, 1, 1,
1.445211, -0.7684325, 3.067159, 1, 1, 1, 1, 1,
1.451652, -0.0562974, 1.594945, 1, 1, 1, 1, 1,
1.465423, -0.1603018, 3.566506, 1, 1, 1, 1, 1,
1.474725, 0.4676135, 1.917392, 0, 0, 1, 1, 1,
1.475295, -0.382648, 3.530346, 1, 0, 0, 1, 1,
1.477039, 1.822734, -1.08408, 1, 0, 0, 1, 1,
1.482314, -1.666849, 3.034339, 1, 0, 0, 1, 1,
1.487696, -1.420346, 4.476567, 1, 0, 0, 1, 1,
1.497383, -0.3331002, 2.396111, 1, 0, 0, 1, 1,
1.510456, -0.1687999, 2.097103, 0, 0, 0, 1, 1,
1.514304, -0.3528699, 2.709256, 0, 0, 0, 1, 1,
1.516181, -2.053428, 4.148006, 0, 0, 0, 1, 1,
1.530826, -1.249898, 1.781072, 0, 0, 0, 1, 1,
1.532293, -1.183066, 1.65177, 0, 0, 0, 1, 1,
1.537204, 1.995701, 0.3476183, 0, 0, 0, 1, 1,
1.540404, 1.154143, 0.7836671, 0, 0, 0, 1, 1,
1.542612, -0.142593, 2.060202, 1, 1, 1, 1, 1,
1.551446, -0.1485856, 1.775227, 1, 1, 1, 1, 1,
1.552766, -0.4593747, 3.039489, 1, 1, 1, 1, 1,
1.556824, 0.001790881, 1.168887, 1, 1, 1, 1, 1,
1.575208, 0.03238464, 2.105542, 1, 1, 1, 1, 1,
1.580047, 1.12916, 0.2732177, 1, 1, 1, 1, 1,
1.582236, 0.9211984, 0.4950971, 1, 1, 1, 1, 1,
1.600326, 0.1512409, 2.688585, 1, 1, 1, 1, 1,
1.600923, 0.2299768, 1.30562, 1, 1, 1, 1, 1,
1.608901, 1.174378, 0.05271382, 1, 1, 1, 1, 1,
1.623345, 0.3275672, 2.991629, 1, 1, 1, 1, 1,
1.633916, -0.9642207, 1.819274, 1, 1, 1, 1, 1,
1.639701, -0.576887, 1.797151, 1, 1, 1, 1, 1,
1.642427, 0.8093664, -0.009440788, 1, 1, 1, 1, 1,
1.648615, -0.1963781, 0.7327335, 1, 1, 1, 1, 1,
1.659809, 0.3517169, -0.08218071, 0, 0, 1, 1, 1,
1.663632, 1.110117, 1.552637, 1, 0, 0, 1, 1,
1.667195, 0.08463971, 1.954311, 1, 0, 0, 1, 1,
1.677095, 1.872061, 0.9379745, 1, 0, 0, 1, 1,
1.686769, -1.931967, 3.217112, 1, 0, 0, 1, 1,
1.717268, 0.02299313, 1.56858, 1, 0, 0, 1, 1,
1.757193, 0.7726803, 1.16194, 0, 0, 0, 1, 1,
1.761912, -0.1489611, 2.072041, 0, 0, 0, 1, 1,
1.76344, -2.216359, 1.630153, 0, 0, 0, 1, 1,
1.770979, 0.5356928, 2.432449, 0, 0, 0, 1, 1,
1.781642, 0.4086535, 3.123132, 0, 0, 0, 1, 1,
1.800412, 0.1890682, 1.547968, 0, 0, 0, 1, 1,
1.809439, 0.6489589, 0.6689603, 0, 0, 0, 1, 1,
1.810848, -1.648324, 0.8518342, 1, 1, 1, 1, 1,
1.825751, 2.915412, 0.6983831, 1, 1, 1, 1, 1,
1.834279, 0.3951888, 1.58024, 1, 1, 1, 1, 1,
1.853336, -0.3529325, 2.274259, 1, 1, 1, 1, 1,
1.922383, -1.081914, 1.541965, 1, 1, 1, 1, 1,
1.923912, -0.3810204, 1.448022, 1, 1, 1, 1, 1,
1.927746, -0.5387387, 3.430536, 1, 1, 1, 1, 1,
1.932199, 0.5438404, 0.4699972, 1, 1, 1, 1, 1,
1.933652, -1.587888, 3.152082, 1, 1, 1, 1, 1,
1.955248, -0.5041867, 3.655658, 1, 1, 1, 1, 1,
2.010468, 0.756092, 1.570775, 1, 1, 1, 1, 1,
2.076454, 1.774489, 1.111298, 1, 1, 1, 1, 1,
2.086946, -1.456587, 2.294952, 1, 1, 1, 1, 1,
2.096242, -0.5921478, 2.310308, 1, 1, 1, 1, 1,
2.099073, 0.1801787, 0.1127718, 1, 1, 1, 1, 1,
2.101199, -0.7801503, 4.305334, 0, 0, 1, 1, 1,
2.154155, 1.398303, -0.4121943, 1, 0, 0, 1, 1,
2.193617, -0.4573252, 1.906086, 1, 0, 0, 1, 1,
2.21309, -0.7507964, 0.6979045, 1, 0, 0, 1, 1,
2.220111, 0.2206138, 2.203456, 1, 0, 0, 1, 1,
2.233686, -0.7885144, 1.32695, 1, 0, 0, 1, 1,
2.25685, -0.8020241, 2.553497, 0, 0, 0, 1, 1,
2.28523, 0.7826159, 1.82346, 0, 0, 0, 1, 1,
2.338854, 0.9277467, 1.671615, 0, 0, 0, 1, 1,
2.468888, 1.264033, 0.2216177, 0, 0, 0, 1, 1,
2.499392, -0.3633173, 0.1304455, 0, 0, 0, 1, 1,
2.665299, -0.4571694, 1.625378, 0, 0, 0, 1, 1,
2.680085, 0.9498114, 2.584749, 0, 0, 0, 1, 1,
2.747632, -0.2171705, 3.212818, 1, 1, 1, 1, 1,
2.754844, 2.033033, 0.1127341, 1, 1, 1, 1, 1,
2.797979, 1.247242, 0.1783545, 1, 1, 1, 1, 1,
2.7987, -0.1839623, 1.351861, 1, 1, 1, 1, 1,
3.050154, 0.6341371, 1.450611, 1, 1, 1, 1, 1,
3.139771, -0.8744512, 2.410827, 1, 1, 1, 1, 1,
3.233974, -1.681244, 4.248456, 1, 1, 1, 1, 1
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
var radius = 10.01199;
var distance = 35.1667;
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
mvMatrix.translate( 0.1544588, 0.4299411, 0.7365596 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1667);
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
