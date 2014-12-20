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
-3.0134, -0.4364147, -1.67523, 1, 0, 0, 1,
-2.730603, 1.686029, -1.589839, 1, 0.007843138, 0, 1,
-2.632678, 0.09574425, -2.641095, 1, 0.01176471, 0, 1,
-2.569118, -0.5609959, -2.721698, 1, 0.01960784, 0, 1,
-2.548168, -0.8831304, -1.532331, 1, 0.02352941, 0, 1,
-2.50971, 0.2101181, -2.092833, 1, 0.03137255, 0, 1,
-2.461499, -0.6313436, -3.220121, 1, 0.03529412, 0, 1,
-2.368663, 0.1271626, -0.8362058, 1, 0.04313726, 0, 1,
-2.357182, 1.49245, 0.1261829, 1, 0.04705882, 0, 1,
-2.323377, 0.372592, -0.4836119, 1, 0.05490196, 0, 1,
-2.322386, 0.7890762, -1.34689, 1, 0.05882353, 0, 1,
-2.305305, 0.6006536, -1.812031, 1, 0.06666667, 0, 1,
-2.29724, 0.3490762, -0.1609311, 1, 0.07058824, 0, 1,
-2.260607, -0.5871385, -1.815549, 1, 0.07843138, 0, 1,
-2.256348, -0.3215664, -2.107141, 1, 0.08235294, 0, 1,
-2.254714, -0.6863037, -2.26886, 1, 0.09019608, 0, 1,
-2.254703, -0.7066663, -1.484451, 1, 0.09411765, 0, 1,
-2.252462, -0.8348886, -2.814831, 1, 0.1019608, 0, 1,
-2.2491, 0.3944581, -1.245256, 1, 0.1098039, 0, 1,
-2.243525, -1.440335, -4.033477, 1, 0.1137255, 0, 1,
-2.240727, -1.177073, -3.610239, 1, 0.1215686, 0, 1,
-2.192272, 0.5457915, -2.38899, 1, 0.1254902, 0, 1,
-2.129456, 1.091541, 0.5820152, 1, 0.1333333, 0, 1,
-2.128178, -0.9685608, -1.476533, 1, 0.1372549, 0, 1,
-2.093234, 0.07450475, -0.4705096, 1, 0.145098, 0, 1,
-2.089036, 1.500861, -1.650949, 1, 0.1490196, 0, 1,
-2.083882, 1.791347, -0.5088016, 1, 0.1568628, 0, 1,
-2.049127, 0.4069676, -3.219028, 1, 0.1607843, 0, 1,
-2.037938, -0.5681455, -2.673094, 1, 0.1686275, 0, 1,
-2.02973, -2.232675, -4.267204, 1, 0.172549, 0, 1,
-2.017828, 0.2546257, -1.451328, 1, 0.1803922, 0, 1,
-2.006725, 0.4133277, -1.715986, 1, 0.1843137, 0, 1,
-1.99904, 0.3097657, -0.3955766, 1, 0.1921569, 0, 1,
-1.994278, -0.1449244, -3.327394, 1, 0.1960784, 0, 1,
-1.993109, 2.060323, 0.8437181, 1, 0.2039216, 0, 1,
-1.962123, -1.467088, -1.59837, 1, 0.2117647, 0, 1,
-1.953786, 1.311381, -0.8211621, 1, 0.2156863, 0, 1,
-1.915579, -0.7590358, -0.03959262, 1, 0.2235294, 0, 1,
-1.911468, -0.07285371, -1.586403, 1, 0.227451, 0, 1,
-1.901715, -0.5786547, -3.174035, 1, 0.2352941, 0, 1,
-1.891472, 0.5822929, -1.271167, 1, 0.2392157, 0, 1,
-1.889692, 0.2150387, -1.014568, 1, 0.2470588, 0, 1,
-1.876184, -0.0197681, -1.482378, 1, 0.2509804, 0, 1,
-1.875731, 0.2592721, -2.279192, 1, 0.2588235, 0, 1,
-1.848297, -0.8422925, -2.07132, 1, 0.2627451, 0, 1,
-1.841357, -0.01080422, -2.115784, 1, 0.2705882, 0, 1,
-1.803912, 0.415877, -0.9475924, 1, 0.2745098, 0, 1,
-1.778475, -0.7466761, -3.126894, 1, 0.282353, 0, 1,
-1.775688, 0.09151077, -1.990441, 1, 0.2862745, 0, 1,
-1.774773, -2.004158, -0.9743137, 1, 0.2941177, 0, 1,
-1.766799, -0.8303335, -2.105259, 1, 0.3019608, 0, 1,
-1.765967, -0.7314253, -0.9903855, 1, 0.3058824, 0, 1,
-1.760332, 2.29993, -0.7335782, 1, 0.3137255, 0, 1,
-1.759204, -1.272901, -1.859035, 1, 0.3176471, 0, 1,
-1.751008, 0.2400479, -1.370139, 1, 0.3254902, 0, 1,
-1.743355, 0.9511743, -0.8672295, 1, 0.3294118, 0, 1,
-1.739462, -1.956025, -2.174787, 1, 0.3372549, 0, 1,
-1.738415, 0.2633489, -0.7514637, 1, 0.3411765, 0, 1,
-1.732186, 0.07018111, 0.1736257, 1, 0.3490196, 0, 1,
-1.707301, 0.4594825, -2.302043, 1, 0.3529412, 0, 1,
-1.702136, 0.2340115, -1.595987, 1, 0.3607843, 0, 1,
-1.669747, 2.080916, -0.3367776, 1, 0.3647059, 0, 1,
-1.650482, 1.339169, -1.031123, 1, 0.372549, 0, 1,
-1.650026, 0.5038105, -1.674344, 1, 0.3764706, 0, 1,
-1.644155, 0.2890913, -0.2840589, 1, 0.3843137, 0, 1,
-1.64235, 0.7413173, -0.8793712, 1, 0.3882353, 0, 1,
-1.642265, -1.035885, -1.228752, 1, 0.3960784, 0, 1,
-1.629241, 0.8232553, -0.1267205, 1, 0.4039216, 0, 1,
-1.627622, -0.1243763, -3.26876, 1, 0.4078431, 0, 1,
-1.593084, -0.546896, -2.438414, 1, 0.4156863, 0, 1,
-1.583971, 0.05812357, -2.298117, 1, 0.4196078, 0, 1,
-1.564308, 1.38682, -1.390451, 1, 0.427451, 0, 1,
-1.539081, -0.6625969, -0.8088277, 1, 0.4313726, 0, 1,
-1.537616, 0.828127, -0.4215157, 1, 0.4392157, 0, 1,
-1.532435, 0.7919942, -0.7566864, 1, 0.4431373, 0, 1,
-1.523146, -1.044208, -3.615081, 1, 0.4509804, 0, 1,
-1.510842, -0.6874365, -4.811048, 1, 0.454902, 0, 1,
-1.492857, -0.8862857, -2.14253, 1, 0.4627451, 0, 1,
-1.479234, 0.5740169, -1.511811, 1, 0.4666667, 0, 1,
-1.47485, -0.04130477, -0.03874197, 1, 0.4745098, 0, 1,
-1.470236, -1.545969, -1.838038, 1, 0.4784314, 0, 1,
-1.466953, -1.564867, -3.268867, 1, 0.4862745, 0, 1,
-1.464273, -0.2719204, -1.663544, 1, 0.4901961, 0, 1,
-1.46037, -0.9110629, -3.578682, 1, 0.4980392, 0, 1,
-1.457767, 0.7501368, -1.918981, 1, 0.5058824, 0, 1,
-1.453443, 0.2926955, -1.934518, 1, 0.509804, 0, 1,
-1.446489, 0.1427553, -0.3157805, 1, 0.5176471, 0, 1,
-1.442417, -1.020063, -1.25429, 1, 0.5215687, 0, 1,
-1.439657, 0.7097155, 0.438266, 1, 0.5294118, 0, 1,
-1.437598, -2.059431, -3.447855, 1, 0.5333334, 0, 1,
-1.426176, -0.2840455, -1.734874, 1, 0.5411765, 0, 1,
-1.419188, -0.3090462, -2.329714, 1, 0.5450981, 0, 1,
-1.410475, 0.3809699, -3.633245, 1, 0.5529412, 0, 1,
-1.394661, -0.402506, -0.2788769, 1, 0.5568628, 0, 1,
-1.390671, 1.595115, -1.747219, 1, 0.5647059, 0, 1,
-1.384277, -0.7896771, -2.963824, 1, 0.5686275, 0, 1,
-1.381614, -2.042428, -2.253206, 1, 0.5764706, 0, 1,
-1.366859, 0.9212103, -0.593492, 1, 0.5803922, 0, 1,
-1.365579, -0.8930517, -3.522637, 1, 0.5882353, 0, 1,
-1.361115, -0.8601783, -2.001824, 1, 0.5921569, 0, 1,
-1.359088, 0.2070914, 0.6088926, 1, 0.6, 0, 1,
-1.357383, 1.535496, 0.5681235, 1, 0.6078432, 0, 1,
-1.356633, -1.15495, -3.103171, 1, 0.6117647, 0, 1,
-1.353681, 0.6418828, -1.382071, 1, 0.6196079, 0, 1,
-1.353216, 1.30926, 0.2127674, 1, 0.6235294, 0, 1,
-1.347656, 0.9970669, -1.05076, 1, 0.6313726, 0, 1,
-1.340532, -0.4577954, -1.901268, 1, 0.6352941, 0, 1,
-1.338865, 1.867831, 0.07315379, 1, 0.6431373, 0, 1,
-1.3287, 0.9826183, -1.791832, 1, 0.6470588, 0, 1,
-1.328245, 1.312815, -0.849398, 1, 0.654902, 0, 1,
-1.311369, -1.040264, -2.923311, 1, 0.6588235, 0, 1,
-1.309032, -0.1567834, -1.567056, 1, 0.6666667, 0, 1,
-1.308101, 0.8241913, -3.025333, 1, 0.6705883, 0, 1,
-1.304496, -0.6837943, -5.079541, 1, 0.6784314, 0, 1,
-1.296008, -0.5187967, -2.377529, 1, 0.682353, 0, 1,
-1.291768, 0.1733389, -2.136699, 1, 0.6901961, 0, 1,
-1.289155, 0.347317, -0.3111134, 1, 0.6941177, 0, 1,
-1.286585, -1.196814, -1.793915, 1, 0.7019608, 0, 1,
-1.284638, 1.191482, -0.7301698, 1, 0.7098039, 0, 1,
-1.282495, -0.006153484, -3.180979, 1, 0.7137255, 0, 1,
-1.281682, -0.05061269, -2.056135, 1, 0.7215686, 0, 1,
-1.28136, 0.04891879, -2.23995, 1, 0.7254902, 0, 1,
-1.276423, 0.2358605, -2.639804, 1, 0.7333333, 0, 1,
-1.261618, -0.0968686, -1.449023, 1, 0.7372549, 0, 1,
-1.253811, 0.4548737, -1.938477, 1, 0.7450981, 0, 1,
-1.250834, -0.5311432, -1.235127, 1, 0.7490196, 0, 1,
-1.250163, -0.7240635, -1.650383, 1, 0.7568628, 0, 1,
-1.248048, 1.75315, 0.03864113, 1, 0.7607843, 0, 1,
-1.238417, -0.7689291, -3.371522, 1, 0.7686275, 0, 1,
-1.237519, -1.41248, -2.631667, 1, 0.772549, 0, 1,
-1.231959, 0.03530924, -1.67835, 1, 0.7803922, 0, 1,
-1.228201, 0.9684652, -0.4679991, 1, 0.7843137, 0, 1,
-1.224991, 1.063104, -1.918583, 1, 0.7921569, 0, 1,
-1.223539, -1.599989, -1.769716, 1, 0.7960784, 0, 1,
-1.218438, 1.716781, -0.5044978, 1, 0.8039216, 0, 1,
-1.201024, 0.6327426, 0.7868823, 1, 0.8117647, 0, 1,
-1.199923, 3.341993, 0.04772613, 1, 0.8156863, 0, 1,
-1.19647, -0.9873261, -2.727034, 1, 0.8235294, 0, 1,
-1.190646, -0.007831319, -1.023512, 1, 0.827451, 0, 1,
-1.187265, 1.01738, 0.3994681, 1, 0.8352941, 0, 1,
-1.17938, 2.125051, -0.5640534, 1, 0.8392157, 0, 1,
-1.170495, 1.045402, -0.1129795, 1, 0.8470588, 0, 1,
-1.167459, 1.032199, -0.3729698, 1, 0.8509804, 0, 1,
-1.162425, -0.01943903, -1.782052, 1, 0.8588235, 0, 1,
-1.161641, -0.5129018, -1.83511, 1, 0.8627451, 0, 1,
-1.161376, -2.32209, -1.752229, 1, 0.8705882, 0, 1,
-1.156868, 0.06611981, -2.867431, 1, 0.8745098, 0, 1,
-1.154126, -1.58428, -4.003037, 1, 0.8823529, 0, 1,
-1.153495, -1.334564, -3.681642, 1, 0.8862745, 0, 1,
-1.146603, -0.3633911, -2.476377, 1, 0.8941177, 0, 1,
-1.139549, 0.3277639, -1.697563, 1, 0.8980392, 0, 1,
-1.139149, -0.9881806, -2.762649, 1, 0.9058824, 0, 1,
-1.133639, 0.04776904, -0.7166106, 1, 0.9137255, 0, 1,
-1.117771, 0.2245772, -0.4361256, 1, 0.9176471, 0, 1,
-1.117311, -1.842556, -4.396887, 1, 0.9254902, 0, 1,
-1.11368, -0.5135694, -0.3409627, 1, 0.9294118, 0, 1,
-1.11316, -0.6104845, -2.596967, 1, 0.9372549, 0, 1,
-1.11105, 2.241454, -1.074875, 1, 0.9411765, 0, 1,
-1.099437, 0.7071108, -1.700861, 1, 0.9490196, 0, 1,
-1.09129, 0.6082874, -1.298986, 1, 0.9529412, 0, 1,
-1.084124, -0.4566482, -3.619401, 1, 0.9607843, 0, 1,
-1.083554, 0.3204266, -0.2524905, 1, 0.9647059, 0, 1,
-1.082502, -0.0130432, -4.307359, 1, 0.972549, 0, 1,
-1.082484, -0.377801, -1.033871, 1, 0.9764706, 0, 1,
-1.070172, 0.2052607, -1.711116, 1, 0.9843137, 0, 1,
-1.065375, -0.03237195, -1.665134, 1, 0.9882353, 0, 1,
-1.048458, -0.2823006, -1.563727, 1, 0.9960784, 0, 1,
-1.046295, -0.8969284, -2.015953, 0.9960784, 1, 0, 1,
-1.040698, -0.09514742, -1.449051, 0.9921569, 1, 0, 1,
-1.038803, 0.3814723, -2.071464, 0.9843137, 1, 0, 1,
-1.032105, -0.5636258, -1.365748, 0.9803922, 1, 0, 1,
-1.030736, -0.468817, -2.263778, 0.972549, 1, 0, 1,
-1.028529, 0.2589859, -2.236539, 0.9686275, 1, 0, 1,
-1.010585, -1.845991, -2.153698, 0.9607843, 1, 0, 1,
-1.004301, -0.274116, -2.80032, 0.9568627, 1, 0, 1,
-0.9985646, 0.3559808, -0.1751961, 0.9490196, 1, 0, 1,
-0.9925102, 0.4025919, -0.9540287, 0.945098, 1, 0, 1,
-0.9879257, -1.000706, -1.351381, 0.9372549, 1, 0, 1,
-0.9868538, 0.4637457, 0.5441151, 0.9333333, 1, 0, 1,
-0.9850643, 0.6270414, -0.08747581, 0.9254902, 1, 0, 1,
-0.9847199, 1.506335, 0.03091371, 0.9215686, 1, 0, 1,
-0.9833505, 0.7741567, -1.137174, 0.9137255, 1, 0, 1,
-0.9826264, -0.3576063, -1.908337, 0.9098039, 1, 0, 1,
-0.9783254, 1.709612, -0.09080519, 0.9019608, 1, 0, 1,
-0.9714653, 0.8906199, -1.288291, 0.8941177, 1, 0, 1,
-0.9696115, -0.363583, -2.236001, 0.8901961, 1, 0, 1,
-0.9688291, 2.560956, -0.7945996, 0.8823529, 1, 0, 1,
-0.9677594, -0.3621936, -1.936055, 0.8784314, 1, 0, 1,
-0.9664811, 1.351976, -2.036874, 0.8705882, 1, 0, 1,
-0.9636343, -1.142967, -3.102862, 0.8666667, 1, 0, 1,
-0.9614154, 0.9698843, -0.1879071, 0.8588235, 1, 0, 1,
-0.9600859, -0.3733971, -0.7473469, 0.854902, 1, 0, 1,
-0.951691, -0.9689221, -2.731007, 0.8470588, 1, 0, 1,
-0.9452062, 2.08889, -0.292989, 0.8431373, 1, 0, 1,
-0.9378863, 0.7176965, -0.07210622, 0.8352941, 1, 0, 1,
-0.933832, -1.160833, -2.492504, 0.8313726, 1, 0, 1,
-0.9250726, 0.3872416, -0.6466131, 0.8235294, 1, 0, 1,
-0.9199125, -0.4317377, -2.307672, 0.8196079, 1, 0, 1,
-0.9198013, 0.2971236, 0.6053239, 0.8117647, 1, 0, 1,
-0.9184089, -0.2043117, -2.026425, 0.8078431, 1, 0, 1,
-0.9124486, -0.5401944, -1.951285, 0.8, 1, 0, 1,
-0.9005985, -0.8401003, -0.9264838, 0.7921569, 1, 0, 1,
-0.9004772, 0.6973569, -2.711228, 0.7882353, 1, 0, 1,
-0.8977323, -0.3813646, -0.7690682, 0.7803922, 1, 0, 1,
-0.8934687, 0.3658365, -2.476732, 0.7764706, 1, 0, 1,
-0.8877441, 1.678134, -0.8795033, 0.7686275, 1, 0, 1,
-0.8856784, -2.376084, -2.410706, 0.7647059, 1, 0, 1,
-0.884273, 0.5890768, -4.090116, 0.7568628, 1, 0, 1,
-0.8825679, 1.183857, -0.6184722, 0.7529412, 1, 0, 1,
-0.877635, -0.6840551, -1.865772, 0.7450981, 1, 0, 1,
-0.8703981, -1.37958, -3.282152, 0.7411765, 1, 0, 1,
-0.8702168, 0.407356, 0.7837416, 0.7333333, 1, 0, 1,
-0.8658013, -1.267717, -3.259297, 0.7294118, 1, 0, 1,
-0.8651838, -0.4284382, -3.726312, 0.7215686, 1, 0, 1,
-0.8581466, -1.088546, -4.244636, 0.7176471, 1, 0, 1,
-0.854474, -0.2318165, 0.1589958, 0.7098039, 1, 0, 1,
-0.8508594, -0.5890834, -1.507502, 0.7058824, 1, 0, 1,
-0.8442606, 0.1998355, -1.431395, 0.6980392, 1, 0, 1,
-0.8259551, -0.873374, -1.689725, 0.6901961, 1, 0, 1,
-0.8240966, -1.021987, -3.288442, 0.6862745, 1, 0, 1,
-0.8234755, -0.5286304, -3.992989, 0.6784314, 1, 0, 1,
-0.8176731, 0.8710519, -2.015493, 0.6745098, 1, 0, 1,
-0.8154739, 0.6522686, -0.4099213, 0.6666667, 1, 0, 1,
-0.814536, 1.72831, 0.4636768, 0.6627451, 1, 0, 1,
-0.8141361, -0.3507589, -2.684061, 0.654902, 1, 0, 1,
-0.8127933, -0.3597628, -2.262061, 0.6509804, 1, 0, 1,
-0.8121933, -0.04884491, -2.001314, 0.6431373, 1, 0, 1,
-0.8111256, -0.2216471, -1.104264, 0.6392157, 1, 0, 1,
-0.8109002, -0.2936815, -1.602982, 0.6313726, 1, 0, 1,
-0.8085045, -1.267699, -2.68734, 0.627451, 1, 0, 1,
-0.803252, -0.729171, -3.003434, 0.6196079, 1, 0, 1,
-0.8013558, -0.9563581, -2.551453, 0.6156863, 1, 0, 1,
-0.8008, 0.4756884, -0.2016669, 0.6078432, 1, 0, 1,
-0.7926424, 0.8241346, -0.7210505, 0.6039216, 1, 0, 1,
-0.7923791, -0.3916019, -3.477506, 0.5960785, 1, 0, 1,
-0.7853286, 1.617114, -1.173898, 0.5882353, 1, 0, 1,
-0.7803723, 1.058526, 0.4068244, 0.5843138, 1, 0, 1,
-0.767683, -0.2762947, -1.68454, 0.5764706, 1, 0, 1,
-0.7666491, 1.438713, 0.9072061, 0.572549, 1, 0, 1,
-0.7622729, -1.179021, -1.276885, 0.5647059, 1, 0, 1,
-0.7616821, 0.4321307, -1.901389, 0.5607843, 1, 0, 1,
-0.7608641, -1.179407, -4.461973, 0.5529412, 1, 0, 1,
-0.7589387, -0.3625994, -2.821237, 0.5490196, 1, 0, 1,
-0.7563898, -0.3411933, -0.880206, 0.5411765, 1, 0, 1,
-0.7558485, -0.07314198, -1.801863, 0.5372549, 1, 0, 1,
-0.7535748, 0.9550481, -0.4390911, 0.5294118, 1, 0, 1,
-0.7496493, 0.6556908, -0.1016213, 0.5254902, 1, 0, 1,
-0.7480491, -1.238869, -3.464386, 0.5176471, 1, 0, 1,
-0.7479715, 0.5465105, 0.6043459, 0.5137255, 1, 0, 1,
-0.7382009, 1.305789, -0.3121805, 0.5058824, 1, 0, 1,
-0.7306105, -1.308107, -3.686965, 0.5019608, 1, 0, 1,
-0.7232727, 0.7343386, -0.3851525, 0.4941176, 1, 0, 1,
-0.7187724, -0.364649, -1.353697, 0.4862745, 1, 0, 1,
-0.7159641, 0.4502658, 0.7053354, 0.4823529, 1, 0, 1,
-0.7090921, -1.606277, -3.634914, 0.4745098, 1, 0, 1,
-0.7081677, -2.101443, -2.744061, 0.4705882, 1, 0, 1,
-0.7081026, -1.191882, -2.015853, 0.4627451, 1, 0, 1,
-0.7060238, 1.009421, -0.9665878, 0.4588235, 1, 0, 1,
-0.7031003, 1.083962, 1.379374, 0.4509804, 1, 0, 1,
-0.6955288, -1.868695, -2.123069, 0.4470588, 1, 0, 1,
-0.6918722, -0.2945121, -2.963794, 0.4392157, 1, 0, 1,
-0.6896681, -0.4871164, -1.283944, 0.4352941, 1, 0, 1,
-0.6895458, -0.8673511, -3.219864, 0.427451, 1, 0, 1,
-0.6791215, -0.08906299, -2.703642, 0.4235294, 1, 0, 1,
-0.6716599, 1.103006, -1.590169, 0.4156863, 1, 0, 1,
-0.663157, 0.5090095, 1.16168, 0.4117647, 1, 0, 1,
-0.6612706, 0.9725648, 0.1106584, 0.4039216, 1, 0, 1,
-0.6569484, 2.21978, 1.003487, 0.3960784, 1, 0, 1,
-0.6540697, 0.1806768, -2.970045, 0.3921569, 1, 0, 1,
-0.645504, -1.148888, -2.054765, 0.3843137, 1, 0, 1,
-0.6411608, -1.624069, -0.6708605, 0.3803922, 1, 0, 1,
-0.6410134, -1.601215, -4.858662, 0.372549, 1, 0, 1,
-0.6358845, -0.2446171, -3.104362, 0.3686275, 1, 0, 1,
-0.6348206, 0.6012687, 0.5252537, 0.3607843, 1, 0, 1,
-0.6323218, -0.5147386, -1.460111, 0.3568628, 1, 0, 1,
-0.6309553, 1.450739, -1.175902, 0.3490196, 1, 0, 1,
-0.6234359, 0.1164433, -0.6119291, 0.345098, 1, 0, 1,
-0.6217844, 0.2012649, -0.6581985, 0.3372549, 1, 0, 1,
-0.6174595, -0.08570679, -1.681354, 0.3333333, 1, 0, 1,
-0.6152793, 0.5151594, 0.3428059, 0.3254902, 1, 0, 1,
-0.6092076, -0.1807397, -3.756248, 0.3215686, 1, 0, 1,
-0.6089781, -0.7672988, -3.182011, 0.3137255, 1, 0, 1,
-0.6081972, 0.6276138, -1.302905, 0.3098039, 1, 0, 1,
-0.6073955, -0.8968499, -2.389669, 0.3019608, 1, 0, 1,
-0.6009274, -0.00613548, -0.3095286, 0.2941177, 1, 0, 1,
-0.5995995, 0.4381234, -0.5526209, 0.2901961, 1, 0, 1,
-0.5948303, -1.122397, -2.942699, 0.282353, 1, 0, 1,
-0.5912249, 0.5741098, -0.7555988, 0.2784314, 1, 0, 1,
-0.591198, 1.107901, 1.459498, 0.2705882, 1, 0, 1,
-0.576264, -2.384485, -0.9308737, 0.2666667, 1, 0, 1,
-0.5761833, -0.5505628, -1.305116, 0.2588235, 1, 0, 1,
-0.5736794, -0.5891848, -2.057456, 0.254902, 1, 0, 1,
-0.5732399, -0.5013121, -1.128585, 0.2470588, 1, 0, 1,
-0.5696692, 0.2083258, -1.832858, 0.2431373, 1, 0, 1,
-0.5681213, 0.7856415, -1.865288, 0.2352941, 1, 0, 1,
-0.5651123, -1.051565, -2.571787, 0.2313726, 1, 0, 1,
-0.5640129, -0.2577935, -2.367758, 0.2235294, 1, 0, 1,
-0.5621136, 1.38521, 0.4769369, 0.2196078, 1, 0, 1,
-0.5614825, -0.7818897, -1.618572, 0.2117647, 1, 0, 1,
-0.5594656, -0.7851812, -2.976112, 0.2078431, 1, 0, 1,
-0.5562751, 0.3470254, -0.8665957, 0.2, 1, 0, 1,
-0.551834, 0.09308717, -0.08108524, 0.1921569, 1, 0, 1,
-0.5497342, -0.2320644, -2.794373, 0.1882353, 1, 0, 1,
-0.5440106, -0.5639813, -3.401436, 0.1803922, 1, 0, 1,
-0.542674, -0.3602411, -1.64296, 0.1764706, 1, 0, 1,
-0.5423306, -0.8286291, -3.469892, 0.1686275, 1, 0, 1,
-0.5413264, 0.518086, -1.021097, 0.1647059, 1, 0, 1,
-0.5391061, 1.220091, -0.5552503, 0.1568628, 1, 0, 1,
-0.5375572, 1.166814, 1.049168, 0.1529412, 1, 0, 1,
-0.5321203, -1.656126, -0.2799444, 0.145098, 1, 0, 1,
-0.5279943, 0.08447823, -1.797953, 0.1411765, 1, 0, 1,
-0.5235014, 0.9239575, -0.09975876, 0.1333333, 1, 0, 1,
-0.5219203, -0.9001865, -0.9640663, 0.1294118, 1, 0, 1,
-0.520394, -0.271831, -3.544402, 0.1215686, 1, 0, 1,
-0.5163458, 1.297917, -0.4446624, 0.1176471, 1, 0, 1,
-0.5159157, -0.1250229, 0.54129, 0.1098039, 1, 0, 1,
-0.5127059, -0.4839652, -3.086304, 0.1058824, 1, 0, 1,
-0.5120113, 0.7014953, -0.6073104, 0.09803922, 1, 0, 1,
-0.5119499, -0.08053017, -2.695615, 0.09019608, 1, 0, 1,
-0.5116118, 1.065451, 1.000421, 0.08627451, 1, 0, 1,
-0.510485, 0.9548606, -0.07177807, 0.07843138, 1, 0, 1,
-0.5097253, -1.631294, -1.109104, 0.07450981, 1, 0, 1,
-0.5065491, 1.861509, -1.63472, 0.06666667, 1, 0, 1,
-0.5048336, -0.5341883, -3.892992, 0.0627451, 1, 0, 1,
-0.4985821, -0.8676405, -2.17782, 0.05490196, 1, 0, 1,
-0.4982612, -0.498702, -0.860789, 0.05098039, 1, 0, 1,
-0.4945303, -0.04952049, -1.657634, 0.04313726, 1, 0, 1,
-0.4834235, 0.7118864, 1.744302, 0.03921569, 1, 0, 1,
-0.479828, -0.5252359, -2.295597, 0.03137255, 1, 0, 1,
-0.4790783, -0.04498791, -0.1255665, 0.02745098, 1, 0, 1,
-0.4787183, -0.7125273, -1.152276, 0.01960784, 1, 0, 1,
-0.4778155, -1.55322, -2.777534, 0.01568628, 1, 0, 1,
-0.4766048, 0.3863839, 0.08907705, 0.007843138, 1, 0, 1,
-0.476602, -1.970491, -4.390806, 0.003921569, 1, 0, 1,
-0.473083, 0.4980977, -0.349153, 0, 1, 0.003921569, 1,
-0.4720912, -2.314697, -3.976137, 0, 1, 0.01176471, 1,
-0.4658685, 0.5577695, -0.8114841, 0, 1, 0.01568628, 1,
-0.4625344, -0.5789645, -3.186846, 0, 1, 0.02352941, 1,
-0.4594858, -0.2950935, -3.636377, 0, 1, 0.02745098, 1,
-0.4586163, -1.609808, -2.974034, 0, 1, 0.03529412, 1,
-0.4563474, 1.187779, -0.8652726, 0, 1, 0.03921569, 1,
-0.4558065, 0.2889922, -0.4814465, 0, 1, 0.04705882, 1,
-0.455797, 0.7594532, -1.289417, 0, 1, 0.05098039, 1,
-0.4556065, 0.2758887, -0.3197388, 0, 1, 0.05882353, 1,
-0.4553902, 0.9574955, -0.4100731, 0, 1, 0.0627451, 1,
-0.4551404, 0.3082405, -1.187372, 0, 1, 0.07058824, 1,
-0.445697, -0.5772853, -3.156325, 0, 1, 0.07450981, 1,
-0.4454522, -0.3227627, -1.683358, 0, 1, 0.08235294, 1,
-0.4445671, -2.216014, -4.335916, 0, 1, 0.08627451, 1,
-0.4395175, -0.348739, -2.512924, 0, 1, 0.09411765, 1,
-0.4378682, 0.1662833, -2.250365, 0, 1, 0.1019608, 1,
-0.4372713, 0.9256497, -0.07582479, 0, 1, 0.1058824, 1,
-0.4372128, -0.1974689, -3.663059, 0, 1, 0.1137255, 1,
-0.4348357, -1.247085, -3.15736, 0, 1, 0.1176471, 1,
-0.4280587, 0.5056565, 0.5008497, 0, 1, 0.1254902, 1,
-0.4213879, -2.144886, -2.56562, 0, 1, 0.1294118, 1,
-0.4180573, 0.5789893, -0.9818249, 0, 1, 0.1372549, 1,
-0.4111471, 0.7438034, -0.1874907, 0, 1, 0.1411765, 1,
-0.4083277, -2.651083, -0.6175433, 0, 1, 0.1490196, 1,
-0.4044301, 0.9735818, -1.450475, 0, 1, 0.1529412, 1,
-0.401695, 0.5273371, -0.3671116, 0, 1, 0.1607843, 1,
-0.3997037, -0.2279307, -1.424096, 0, 1, 0.1647059, 1,
-0.3984924, 0.2955244, -1.127585, 0, 1, 0.172549, 1,
-0.3983635, 0.2264165, -1.800267, 0, 1, 0.1764706, 1,
-0.3982092, 0.7245124, -0.6671625, 0, 1, 0.1843137, 1,
-0.3968523, -0.05041405, -2.747076, 0, 1, 0.1882353, 1,
-0.3950482, 1.277656, -0.007479117, 0, 1, 0.1960784, 1,
-0.3926227, -0.5053794, -2.100788, 0, 1, 0.2039216, 1,
-0.3923017, 0.5151084, -0.9117442, 0, 1, 0.2078431, 1,
-0.3911788, 0.9186122, 0.1136406, 0, 1, 0.2156863, 1,
-0.3902882, -1.720958, -3.396839, 0, 1, 0.2196078, 1,
-0.3884237, -0.1286654, -1.735564, 0, 1, 0.227451, 1,
-0.3817692, -1.275278, -3.951864, 0, 1, 0.2313726, 1,
-0.3813401, 1.569889, 0.2662013, 0, 1, 0.2392157, 1,
-0.3811868, 0.4734793, -1.460002, 0, 1, 0.2431373, 1,
-0.3781278, 0.3291469, 0.01261533, 0, 1, 0.2509804, 1,
-0.3760912, -0.03389964, -1.401547, 0, 1, 0.254902, 1,
-0.3742916, -0.7841634, -2.59943, 0, 1, 0.2627451, 1,
-0.3682128, 0.04843363, -2.133075, 0, 1, 0.2666667, 1,
-0.3667005, -0.4364527, -1.714979, 0, 1, 0.2745098, 1,
-0.3660096, -0.2964627, -2.353457, 0, 1, 0.2784314, 1,
-0.3650115, -0.3953603, -2.27521, 0, 1, 0.2862745, 1,
-0.3631692, 0.4570475, -1.275708, 0, 1, 0.2901961, 1,
-0.35781, -0.7532864, -2.74525, 0, 1, 0.2980392, 1,
-0.3482868, -0.1279108, -2.972602, 0, 1, 0.3058824, 1,
-0.345641, -0.7908341, -2.077791, 0, 1, 0.3098039, 1,
-0.3427753, -0.1147062, -0.726954, 0, 1, 0.3176471, 1,
-0.3422436, 0.4674672, -0.326852, 0, 1, 0.3215686, 1,
-0.3413804, -1.625437, -3.104741, 0, 1, 0.3294118, 1,
-0.3409833, 1.167427, 0.3923399, 0, 1, 0.3333333, 1,
-0.3390567, -0.4554637, -1.409921, 0, 1, 0.3411765, 1,
-0.3386526, -0.2171399, -2.141685, 0, 1, 0.345098, 1,
-0.3383892, 1.419015, -0.6353247, 0, 1, 0.3529412, 1,
-0.3305607, -0.7157003, -1.580425, 0, 1, 0.3568628, 1,
-0.3305061, 0.04590557, -2.878573, 0, 1, 0.3647059, 1,
-0.3291174, 0.9672617, 0.1312852, 0, 1, 0.3686275, 1,
-0.3287837, 0.4732946, -1.283697, 0, 1, 0.3764706, 1,
-0.3249534, 0.5795397, -1.277241, 0, 1, 0.3803922, 1,
-0.322079, -0.51084, -2.667442, 0, 1, 0.3882353, 1,
-0.3217913, -1.151261, -2.250473, 0, 1, 0.3921569, 1,
-0.3199066, 0.8665851, -0.7570922, 0, 1, 0.4, 1,
-0.3146401, 1.371474, -1.684202, 0, 1, 0.4078431, 1,
-0.3111622, 1.127568, 0.4465443, 0, 1, 0.4117647, 1,
-0.3109082, 0.988853, -1.913188, 0, 1, 0.4196078, 1,
-0.3090343, -0.1338409, 0.254876, 0, 1, 0.4235294, 1,
-0.2975313, -0.06114133, -2.802184, 0, 1, 0.4313726, 1,
-0.2941176, -0.03562808, -1.408444, 0, 1, 0.4352941, 1,
-0.2940898, 0.7792337, -0.2752728, 0, 1, 0.4431373, 1,
-0.2934304, -0.1012782, -1.709938, 0, 1, 0.4470588, 1,
-0.2881913, -1.268819, -3.035064, 0, 1, 0.454902, 1,
-0.2862512, -1.51873, -1.044877, 0, 1, 0.4588235, 1,
-0.2856144, -0.8068028, -3.759281, 0, 1, 0.4666667, 1,
-0.285029, -0.9700372, -3.409636, 0, 1, 0.4705882, 1,
-0.282234, -1.299567, -1.295618, 0, 1, 0.4784314, 1,
-0.2813718, 0.9039862, -0.4852914, 0, 1, 0.4823529, 1,
-0.276211, 1.074854, -0.3288474, 0, 1, 0.4901961, 1,
-0.2760096, -0.8821956, -1.706172, 0, 1, 0.4941176, 1,
-0.2739775, -0.7307543, -3.560472, 0, 1, 0.5019608, 1,
-0.2733587, 1.110696, 1.213624, 0, 1, 0.509804, 1,
-0.2692323, 0.9001967, 0.1295257, 0, 1, 0.5137255, 1,
-0.2623613, -0.7357303, -1.760286, 0, 1, 0.5215687, 1,
-0.2609797, 1.054315, -0.2806707, 0, 1, 0.5254902, 1,
-0.2609539, 2.093791, 1.183531, 0, 1, 0.5333334, 1,
-0.2583895, -1.484466, -3.281285, 0, 1, 0.5372549, 1,
-0.2536573, 1.228476, -0.6835179, 0, 1, 0.5450981, 1,
-0.2534066, 1.596023, -2.127575, 0, 1, 0.5490196, 1,
-0.2532456, -0.06910573, -0.9550222, 0, 1, 0.5568628, 1,
-0.2530014, 1.447925, -1.351234, 0, 1, 0.5607843, 1,
-0.2469517, 0.3542305, -0.7620676, 0, 1, 0.5686275, 1,
-0.2460891, 1.213661, -2.7485, 0, 1, 0.572549, 1,
-0.2453975, -0.03755274, -1.918797, 0, 1, 0.5803922, 1,
-0.2406174, 0.6102716, 0.2639701, 0, 1, 0.5843138, 1,
-0.2392939, 2.208264, -1.33247, 0, 1, 0.5921569, 1,
-0.2287421, 0.160876, -0.06400296, 0, 1, 0.5960785, 1,
-0.2250913, -0.03305617, -1.147111, 0, 1, 0.6039216, 1,
-0.2222508, -1.841379, -1.722358, 0, 1, 0.6117647, 1,
-0.2205092, 0.5287293, 0.05468855, 0, 1, 0.6156863, 1,
-0.2184519, 1.15561, -0.5759728, 0, 1, 0.6235294, 1,
-0.2166169, 0.7416002, -1.910354, 0, 1, 0.627451, 1,
-0.2149281, -0.5575148, -2.712141, 0, 1, 0.6352941, 1,
-0.2134525, 0.9897002, 1.36918, 0, 1, 0.6392157, 1,
-0.211547, -1.761398, -4.717312, 0, 1, 0.6470588, 1,
-0.2113498, -0.1906409, -1.781312, 0, 1, 0.6509804, 1,
-0.2069786, -0.735195, -0.727002, 0, 1, 0.6588235, 1,
-0.2003866, 0.04127163, 0.3080491, 0, 1, 0.6627451, 1,
-0.1968018, 2.244941, 0.2225862, 0, 1, 0.6705883, 1,
-0.1938402, -0.4890165, -2.262243, 0, 1, 0.6745098, 1,
-0.1925562, -0.4444432, -3.099674, 0, 1, 0.682353, 1,
-0.1863431, 0.533994, 1.262389, 0, 1, 0.6862745, 1,
-0.1838768, -0.1673919, -1.502751, 0, 1, 0.6941177, 1,
-0.1826227, -1.648607, -3.962967, 0, 1, 0.7019608, 1,
-0.176861, 0.8140969, 0.3847994, 0, 1, 0.7058824, 1,
-0.1756298, -0.1928633, -3.390237, 0, 1, 0.7137255, 1,
-0.1753608, -1.855687, -1.732463, 0, 1, 0.7176471, 1,
-0.1635238, -1.08155, -2.467102, 0, 1, 0.7254902, 1,
-0.1626419, -1.815102, -2.944435, 0, 1, 0.7294118, 1,
-0.1580552, 0.5968525, 0.6577915, 0, 1, 0.7372549, 1,
-0.1568809, 0.8766311, 1.392349, 0, 1, 0.7411765, 1,
-0.1533339, -0.2676525, -2.802117, 0, 1, 0.7490196, 1,
-0.1527805, -0.3409286, -1.781368, 0, 1, 0.7529412, 1,
-0.1481605, 0.1402347, -1.75111, 0, 1, 0.7607843, 1,
-0.1426453, -0.2919406, -2.377177, 0, 1, 0.7647059, 1,
-0.1336429, -0.03835732, -2.975374, 0, 1, 0.772549, 1,
-0.1330845, -0.8457357, -3.105707, 0, 1, 0.7764706, 1,
-0.1324302, -0.9283442, -2.292939, 0, 1, 0.7843137, 1,
-0.1287778, 0.7366555, 0.3736241, 0, 1, 0.7882353, 1,
-0.1284709, -1.554246, -3.745586, 0, 1, 0.7960784, 1,
-0.1267598, -0.9276749, -3.951036, 0, 1, 0.8039216, 1,
-0.1253952, -0.5569173, -2.773735, 0, 1, 0.8078431, 1,
-0.1226179, 0.1004642, -0.2648821, 0, 1, 0.8156863, 1,
-0.1195891, 0.5785332, 1.624124, 0, 1, 0.8196079, 1,
-0.119503, -1.043649, -1.876499, 0, 1, 0.827451, 1,
-0.115192, -0.5545291, -3.81262, 0, 1, 0.8313726, 1,
-0.1125095, 2.310133, -0.3043822, 0, 1, 0.8392157, 1,
-0.1115899, 0.6491945, -0.9297385, 0, 1, 0.8431373, 1,
-0.1057349, -1.2701, -2.540039, 0, 1, 0.8509804, 1,
-0.102768, -0.2878717, -4.013701, 0, 1, 0.854902, 1,
-0.1020686, 0.7097216, 0.7743605, 0, 1, 0.8627451, 1,
-0.1012008, -0.7711401, -3.112186, 0, 1, 0.8666667, 1,
-0.09747847, 1.776746, -0.9584482, 0, 1, 0.8745098, 1,
-0.0951145, 1.400275, -1.215677, 0, 1, 0.8784314, 1,
-0.09434795, 0.3285713, -0.9831318, 0, 1, 0.8862745, 1,
-0.09074249, -0.2787696, -5.182751, 0, 1, 0.8901961, 1,
-0.08944061, 0.3500744, 0.3187445, 0, 1, 0.8980392, 1,
-0.08923685, 0.1270838, -1.437133, 0, 1, 0.9058824, 1,
-0.08180855, -0.2500271, -1.176217, 0, 1, 0.9098039, 1,
-0.0802625, -0.6224589, -3.899598, 0, 1, 0.9176471, 1,
-0.07758281, -0.4159148, -2.113917, 0, 1, 0.9215686, 1,
-0.07727868, 0.5061069, -2.060513, 0, 1, 0.9294118, 1,
-0.07392881, 1.531236, 0.3793531, 0, 1, 0.9333333, 1,
-0.07268242, -0.5467978, -2.204173, 0, 1, 0.9411765, 1,
-0.07010055, 0.894953, -0.1778305, 0, 1, 0.945098, 1,
-0.06637111, -2.895062, -3.281915, 0, 1, 0.9529412, 1,
-0.06633655, 2.122988, -1.466067, 0, 1, 0.9568627, 1,
-0.06472515, 0.9804598, 0.08741932, 0, 1, 0.9647059, 1,
-0.0630664, -0.6086577, -1.487717, 0, 1, 0.9686275, 1,
-0.05733429, 0.1065151, -1.217363, 0, 1, 0.9764706, 1,
-0.05642194, -0.9301347, -2.427311, 0, 1, 0.9803922, 1,
-0.05544432, 0.9737592, 0.1212298, 0, 1, 0.9882353, 1,
-0.0538585, 0.62985, -2.378919, 0, 1, 0.9921569, 1,
-0.05339013, 0.6227269, 0.1466418, 0, 1, 1, 1,
-0.05324099, 0.3104767, -0.06000188, 0, 0.9921569, 1, 1,
-0.04963458, -0.08509483, -2.459481, 0, 0.9882353, 1, 1,
-0.04952401, -0.9727611, -1.732409, 0, 0.9803922, 1, 1,
-0.04608386, -0.9011026, -3.591599, 0, 0.9764706, 1, 1,
-0.04498703, -0.9533318, -2.815263, 0, 0.9686275, 1, 1,
-0.04440887, 0.4987584, 1.249227, 0, 0.9647059, 1, 1,
-0.04364472, 2.710778, -0.2563241, 0, 0.9568627, 1, 1,
-0.0373945, -0.7633698, -2.720664, 0, 0.9529412, 1, 1,
-0.03368517, -1.140364, -1.549345, 0, 0.945098, 1, 1,
-0.02554958, 1.485938, -0.1251683, 0, 0.9411765, 1, 1,
-0.02080643, -1.924099, -2.797837, 0, 0.9333333, 1, 1,
-0.02027136, -2.002067, -3.353469, 0, 0.9294118, 1, 1,
-0.01851929, 0.2192953, -1.130067, 0, 0.9215686, 1, 1,
-0.01650479, -0.4319491, -2.492313, 0, 0.9176471, 1, 1,
-0.01625311, -0.4451948, -2.379179, 0, 0.9098039, 1, 1,
-0.01210076, -0.4094265, -2.853436, 0, 0.9058824, 1, 1,
-0.00600912, 0.2525143, 0.3354109, 0, 0.8980392, 1, 1,
-0.003846196, 0.6785141, -0.7511112, 0, 0.8901961, 1, 1,
-0.003430279, -1.681625, -3.165187, 0, 0.8862745, 1, 1,
-0.001237146, 0.1383127, 2.059644, 0, 0.8784314, 1, 1,
-0.0004589404, -0.7396931, -2.670455, 0, 0.8745098, 1, 1,
-0.0001170122, 1.491159, 0.6952754, 0, 0.8666667, 1, 1,
0.0006018802, 0.04499408, -0.3919365, 0, 0.8627451, 1, 1,
0.008931043, -2.853526, 2.102585, 0, 0.854902, 1, 1,
0.01246667, -0.4551198, 2.117747, 0, 0.8509804, 1, 1,
0.01495084, 2.452346, 1.075076, 0, 0.8431373, 1, 1,
0.0158948, -2.040705, 4.691616, 0, 0.8392157, 1, 1,
0.02372388, 0.4729018, -1.677423, 0, 0.8313726, 1, 1,
0.02598269, 0.03120152, 1.376063, 0, 0.827451, 1, 1,
0.02714264, 1.192894, -1.239919, 0, 0.8196079, 1, 1,
0.03512985, 0.5515034, -0.4399725, 0, 0.8156863, 1, 1,
0.03655943, -0.8316359, 4.974898, 0, 0.8078431, 1, 1,
0.04580676, 1.369489, 1.339762, 0, 0.8039216, 1, 1,
0.04806147, -1.510911, 2.43183, 0, 0.7960784, 1, 1,
0.05575723, 0.04528509, 1.916789, 0, 0.7882353, 1, 1,
0.05672881, -0.1678131, 2.942635, 0, 0.7843137, 1, 1,
0.06248293, -0.01829222, 1.769559, 0, 0.7764706, 1, 1,
0.06270763, -0.296039, 3.951862, 0, 0.772549, 1, 1,
0.06332392, 0.3619078, -0.3356512, 0, 0.7647059, 1, 1,
0.06851976, -0.7549759, 1.720863, 0, 0.7607843, 1, 1,
0.06928742, 2.164821, -0.2995197, 0, 0.7529412, 1, 1,
0.06973104, -0.2749025, 3.784879, 0, 0.7490196, 1, 1,
0.07748086, -0.4506923, 3.195972, 0, 0.7411765, 1, 1,
0.07786749, 1.33391, -0.133035, 0, 0.7372549, 1, 1,
0.07977067, -0.4763275, 2.794039, 0, 0.7294118, 1, 1,
0.08093428, -1.708307, 4.481059, 0, 0.7254902, 1, 1,
0.0816106, -1.99957, 1.807176, 0, 0.7176471, 1, 1,
0.08371726, -1.037426, 0.1754619, 0, 0.7137255, 1, 1,
0.08619779, 0.589358, 1.050901, 0, 0.7058824, 1, 1,
0.08707055, 2.5394, 1.223804, 0, 0.6980392, 1, 1,
0.08744007, -0.4382236, 3.64023, 0, 0.6941177, 1, 1,
0.08816493, -0.6822538, 3.513845, 0, 0.6862745, 1, 1,
0.08852948, 1.623584, -0.4170235, 0, 0.682353, 1, 1,
0.08888812, -0.4434732, 4.869081, 0, 0.6745098, 1, 1,
0.08927439, -0.4084306, 0.9502798, 0, 0.6705883, 1, 1,
0.09056647, 0.4344848, -0.2655208, 0, 0.6627451, 1, 1,
0.0906405, 0.3373991, 1.41744, 0, 0.6588235, 1, 1,
0.09732839, -0.6165947, 2.872922, 0, 0.6509804, 1, 1,
0.09802356, -0.786735, 1.610104, 0, 0.6470588, 1, 1,
0.09809098, 0.008366123, 1.550698, 0, 0.6392157, 1, 1,
0.1000938, -1.392559, 4.364849, 0, 0.6352941, 1, 1,
0.1015049, 2.043729, 0.094814, 0, 0.627451, 1, 1,
0.1056271, 0.228074, 0.1604946, 0, 0.6235294, 1, 1,
0.1058317, -1.168621, 1.067607, 0, 0.6156863, 1, 1,
0.1062116, 0.4201307, 1.217601, 0, 0.6117647, 1, 1,
0.1078279, -0.5007132, 5.490983, 0, 0.6039216, 1, 1,
0.1091929, -2.217992, 2.566163, 0, 0.5960785, 1, 1,
0.1102768, 0.415579, -0.7396637, 0, 0.5921569, 1, 1,
0.1119839, -0.2685296, 3.329633, 0, 0.5843138, 1, 1,
0.1202855, 1.102597, 1.06429, 0, 0.5803922, 1, 1,
0.120525, 0.3991275, 0.5981697, 0, 0.572549, 1, 1,
0.1273189, -0.6022155, 3.7862, 0, 0.5686275, 1, 1,
0.1277852, 1.309804, 2.808578, 0, 0.5607843, 1, 1,
0.1337876, -2.165561, 2.610129, 0, 0.5568628, 1, 1,
0.1361036, -0.4145569, 4.971658, 0, 0.5490196, 1, 1,
0.1413363, 0.9610421, -1.389786, 0, 0.5450981, 1, 1,
0.1485833, 0.9840477, -0.09936611, 0, 0.5372549, 1, 1,
0.156921, -0.6405565, 3.219154, 0, 0.5333334, 1, 1,
0.1580891, -0.1702601, 3.689458, 0, 0.5254902, 1, 1,
0.1587324, 0.9661762, 0.1784651, 0, 0.5215687, 1, 1,
0.1636945, -2.116933, 3.636725, 0, 0.5137255, 1, 1,
0.1711651, 0.697886, -1.544181, 0, 0.509804, 1, 1,
0.1755351, 1.478756, 1.292421, 0, 0.5019608, 1, 1,
0.1823631, 0.1744557, 0.104621, 0, 0.4941176, 1, 1,
0.1860861, -1.152919, 3.75097, 0, 0.4901961, 1, 1,
0.1886425, -0.08034256, 3.228098, 0, 0.4823529, 1, 1,
0.1913599, 0.03632206, 1.156116, 0, 0.4784314, 1, 1,
0.1925995, -0.2041545, 1.472822, 0, 0.4705882, 1, 1,
0.1974651, -1.469416, 3.824457, 0, 0.4666667, 1, 1,
0.19902, 0.06088693, 0.6902276, 0, 0.4588235, 1, 1,
0.1995962, -0.839403, 2.873437, 0, 0.454902, 1, 1,
0.2023307, 1.611282, 0.5005206, 0, 0.4470588, 1, 1,
0.2038714, -0.1793477, 4.573002, 0, 0.4431373, 1, 1,
0.2039988, 0.6683283, 0.1106061, 0, 0.4352941, 1, 1,
0.205272, 1.57505, -0.9896463, 0, 0.4313726, 1, 1,
0.2062585, 0.7337689, 1.015487, 0, 0.4235294, 1, 1,
0.20765, -0.05476945, 0.5805007, 0, 0.4196078, 1, 1,
0.2104511, -0.2895652, 4.111461, 0, 0.4117647, 1, 1,
0.2123511, -0.9679146, 1.601823, 0, 0.4078431, 1, 1,
0.2210184, 2.167604, -0.2489072, 0, 0.4, 1, 1,
0.2238679, -0.1778392, 0.6605728, 0, 0.3921569, 1, 1,
0.2246137, 0.1180102, 1.880453, 0, 0.3882353, 1, 1,
0.2246607, 0.2019396, 0.546814, 0, 0.3803922, 1, 1,
0.2253151, -1.635169, 4.210148, 0, 0.3764706, 1, 1,
0.2260113, 0.6439471, 0.8110592, 0, 0.3686275, 1, 1,
0.2294388, -0.2428951, 3.205041, 0, 0.3647059, 1, 1,
0.2312927, -0.1741713, 3.719216, 0, 0.3568628, 1, 1,
0.2318533, -1.910727, 2.712652, 0, 0.3529412, 1, 1,
0.2403811, -1.040961, 3.339193, 0, 0.345098, 1, 1,
0.2448308, 0.03180365, 1.234936, 0, 0.3411765, 1, 1,
0.2462889, -0.4773283, 3.552521, 0, 0.3333333, 1, 1,
0.2505535, 0.3576983, 1.430775, 0, 0.3294118, 1, 1,
0.2523661, 0.559168, 0.8872553, 0, 0.3215686, 1, 1,
0.2536928, -0.7494298, 3.353343, 0, 0.3176471, 1, 1,
0.25719, 1.005695, 0.128685, 0, 0.3098039, 1, 1,
0.2583773, 0.1188268, 2.055315, 0, 0.3058824, 1, 1,
0.2636878, -0.3428567, 2.052212, 0, 0.2980392, 1, 1,
0.2689006, -0.9459344, 3.289341, 0, 0.2901961, 1, 1,
0.2693316, 1.883888, 0.4044712, 0, 0.2862745, 1, 1,
0.2695842, 0.3205564, 2.89832, 0, 0.2784314, 1, 1,
0.2786045, -2.453592, 2.748771, 0, 0.2745098, 1, 1,
0.2815076, -1.527544, 3.206884, 0, 0.2666667, 1, 1,
0.283562, 2.508324, -0.4479994, 0, 0.2627451, 1, 1,
0.2842808, 0.365983, 1.588107, 0, 0.254902, 1, 1,
0.2881995, -0.8918672, 3.855108, 0, 0.2509804, 1, 1,
0.290804, -0.08063035, 0.1967466, 0, 0.2431373, 1, 1,
0.3015873, -0.2792587, 4.144712, 0, 0.2392157, 1, 1,
0.3044259, 0.884635, -1.402248, 0, 0.2313726, 1, 1,
0.3089537, -1.134944, 1.627676, 0, 0.227451, 1, 1,
0.3129781, -0.6267845, 2.791888, 0, 0.2196078, 1, 1,
0.3131024, -0.1324492, 3.065271, 0, 0.2156863, 1, 1,
0.3202576, -0.4829744, 3.692573, 0, 0.2078431, 1, 1,
0.3224049, 0.9227146, 1.103402, 0, 0.2039216, 1, 1,
0.323245, 0.5908267, 0.2485509, 0, 0.1960784, 1, 1,
0.3233839, 1.068914, -0.1401054, 0, 0.1882353, 1, 1,
0.3254309, -0.4281659, 0.5894698, 0, 0.1843137, 1, 1,
0.3265959, -1.014376, 3.085858, 0, 0.1764706, 1, 1,
0.3268998, 0.3629405, 0.7029964, 0, 0.172549, 1, 1,
0.3273268, 0.9582558, -1.497036, 0, 0.1647059, 1, 1,
0.329418, -0.1575616, 1.470415, 0, 0.1607843, 1, 1,
0.3338406, 0.1915817, -0.8338029, 0, 0.1529412, 1, 1,
0.3353106, 0.5719868, -0.4097418, 0, 0.1490196, 1, 1,
0.340545, -0.6625929, 2.553618, 0, 0.1411765, 1, 1,
0.3434633, -0.6227193, 2.277898, 0, 0.1372549, 1, 1,
0.3483875, -2.079771, 2.971982, 0, 0.1294118, 1, 1,
0.3556545, -0.6001725, 4.199594, 0, 0.1254902, 1, 1,
0.3594409, 0.2226503, 1.954238, 0, 0.1176471, 1, 1,
0.362582, 0.9221772, 1.817012, 0, 0.1137255, 1, 1,
0.3632823, 1.354285, -0.7835033, 0, 0.1058824, 1, 1,
0.3646214, 2.280265, 1.816834, 0, 0.09803922, 1, 1,
0.3647358, -1.40001, 3.761878, 0, 0.09411765, 1, 1,
0.3683872, -0.7142397, 1.976151, 0, 0.08627451, 1, 1,
0.3731183, 0.2750049, 1.089952, 0, 0.08235294, 1, 1,
0.3739205, 2.523141, 0.389924, 0, 0.07450981, 1, 1,
0.3753642, 2.873703, 3.366293, 0, 0.07058824, 1, 1,
0.3770038, -0.1648449, 1.370243, 0, 0.0627451, 1, 1,
0.3793518, -2.175756, 4.023488, 0, 0.05882353, 1, 1,
0.3796807, -0.6607525, 3.62574, 0, 0.05098039, 1, 1,
0.3801582, 0.77358, -0.0919955, 0, 0.04705882, 1, 1,
0.3870433, 0.2404272, 1.667324, 0, 0.03921569, 1, 1,
0.3875436, 0.8397242, 0.1842994, 0, 0.03529412, 1, 1,
0.3898627, 0.3597305, 0.6368283, 0, 0.02745098, 1, 1,
0.4051484, 1.437892, -0.7131041, 0, 0.02352941, 1, 1,
0.4193983, 1.465222, -0.2972229, 0, 0.01568628, 1, 1,
0.4291485, -1.637386, 2.861344, 0, 0.01176471, 1, 1,
0.429284, 1.299761, -0.1011665, 0, 0.003921569, 1, 1,
0.4322579, -0.5362371, 1.598102, 0.003921569, 0, 1, 1,
0.4324605, -0.4298426, 2.421566, 0.007843138, 0, 1, 1,
0.435308, 0.2889839, -0.307699, 0.01568628, 0, 1, 1,
0.435831, -0.04452941, 1.451379, 0.01960784, 0, 1, 1,
0.4363192, 2.56092, -0.5376239, 0.02745098, 0, 1, 1,
0.4381631, -0.5885682, 2.336331, 0.03137255, 0, 1, 1,
0.440448, -1.893701, 4.669541, 0.03921569, 0, 1, 1,
0.4427428, -0.1278414, 0.8984796, 0.04313726, 0, 1, 1,
0.4453319, -0.4468584, 3.053793, 0.05098039, 0, 1, 1,
0.446835, -0.606476, 3.717874, 0.05490196, 0, 1, 1,
0.4508525, -0.5978671, 2.288048, 0.0627451, 0, 1, 1,
0.4534682, -1.726743, 4.533907, 0.06666667, 0, 1, 1,
0.4608824, -1.327891, 2.274423, 0.07450981, 0, 1, 1,
0.4623969, -0.02881976, 1.85184, 0.07843138, 0, 1, 1,
0.4667063, 0.9962906, -0.803093, 0.08627451, 0, 1, 1,
0.467442, 1.927919, -0.1562537, 0.09019608, 0, 1, 1,
0.4701542, 0.8843338, -0.3635521, 0.09803922, 0, 1, 1,
0.4726401, -1.758498, 3.453958, 0.1058824, 0, 1, 1,
0.4742195, -1.271283, 3.626647, 0.1098039, 0, 1, 1,
0.4744842, -1.136404, 3.204844, 0.1176471, 0, 1, 1,
0.4758178, 1.035212, 0.6837553, 0.1215686, 0, 1, 1,
0.47813, -0.06195989, 3.06026, 0.1294118, 0, 1, 1,
0.4790106, -0.5053696, 3.744321, 0.1333333, 0, 1, 1,
0.4791779, 0.1776708, 0.1227782, 0.1411765, 0, 1, 1,
0.4796951, 0.4506593, 1.146301, 0.145098, 0, 1, 1,
0.4929143, -0.3635711, 2.017841, 0.1529412, 0, 1, 1,
0.4935283, -0.1855413, 0.3002123, 0.1568628, 0, 1, 1,
0.4938889, -0.5181298, 1.76444, 0.1647059, 0, 1, 1,
0.4957475, -0.7095707, 3.72136, 0.1686275, 0, 1, 1,
0.5016685, -0.5395743, 3.143861, 0.1764706, 0, 1, 1,
0.5045215, 0.02158327, 1.438648, 0.1803922, 0, 1, 1,
0.5049073, 0.8251052, 0.8620353, 0.1882353, 0, 1, 1,
0.5061882, 1.594126, -0.4270698, 0.1921569, 0, 1, 1,
0.5088215, -0.7403098, 1.803742, 0.2, 0, 1, 1,
0.5096923, -1.606799, 4.099868, 0.2078431, 0, 1, 1,
0.5106655, -1.813244, 3.096691, 0.2117647, 0, 1, 1,
0.5120196, -0.9018853, 3.584756, 0.2196078, 0, 1, 1,
0.5142362, -0.5473191, 2.877225, 0.2235294, 0, 1, 1,
0.5179555, 0.9041398, 1.423008, 0.2313726, 0, 1, 1,
0.5190434, -0.07268862, 0.9226776, 0.2352941, 0, 1, 1,
0.5253907, 1.151198, 0.9133635, 0.2431373, 0, 1, 1,
0.5284302, 0.1958158, -0.1729856, 0.2470588, 0, 1, 1,
0.5287786, 0.6038151, -1.00947, 0.254902, 0, 1, 1,
0.5300142, -1.378886, 1.610583, 0.2588235, 0, 1, 1,
0.5408129, 0.534902, -0.0486223, 0.2666667, 0, 1, 1,
0.5425986, -0.3161814, 3.460194, 0.2705882, 0, 1, 1,
0.546577, 1.189139, 1.180105, 0.2784314, 0, 1, 1,
0.5469204, 0.06658783, 0.7178093, 0.282353, 0, 1, 1,
0.5474569, -0.209796, 3.432837, 0.2901961, 0, 1, 1,
0.5492188, -0.2268732, 1.802283, 0.2941177, 0, 1, 1,
0.5525441, 0.3443435, 1.074862, 0.3019608, 0, 1, 1,
0.5535836, 1.726417, 0.02128712, 0.3098039, 0, 1, 1,
0.5558857, -1.211492, 2.856538, 0.3137255, 0, 1, 1,
0.5570451, 0.4267724, 0.5551834, 0.3215686, 0, 1, 1,
0.5601806, -0.5559201, 2.776792, 0.3254902, 0, 1, 1,
0.5602276, 0.6048035, 0.2696814, 0.3333333, 0, 1, 1,
0.5606458, -0.09639754, 3.723638, 0.3372549, 0, 1, 1,
0.5616398, 1.485276, 0.05989996, 0.345098, 0, 1, 1,
0.5621429, 0.4646239, 2.066975, 0.3490196, 0, 1, 1,
0.5672063, 0.4996326, 0.4782976, 0.3568628, 0, 1, 1,
0.581908, -1.244857, 3.021963, 0.3607843, 0, 1, 1,
0.5822733, 0.07244138, 1.127614, 0.3686275, 0, 1, 1,
0.5841349, -0.2365987, 4.045671, 0.372549, 0, 1, 1,
0.5868298, -0.7987189, 1.964828, 0.3803922, 0, 1, 1,
0.5898539, -0.9657173, 1.979118, 0.3843137, 0, 1, 1,
0.5913252, 1.032686, 1.092096, 0.3921569, 0, 1, 1,
0.593136, -0.0697333, 2.544635, 0.3960784, 0, 1, 1,
0.6021674, 1.397143, -1.154985, 0.4039216, 0, 1, 1,
0.6050631, -1.825603, 2.554366, 0.4117647, 0, 1, 1,
0.6084155, -0.6336767, 1.632652, 0.4156863, 0, 1, 1,
0.6102739, 1.247064, 0.2792425, 0.4235294, 0, 1, 1,
0.6105433, -0.4874844, 1.492753, 0.427451, 0, 1, 1,
0.61431, 1.428061, -1.548412, 0.4352941, 0, 1, 1,
0.6164192, -1.209034, 2.442677, 0.4392157, 0, 1, 1,
0.6164912, -0.0005137888, 0.9962249, 0.4470588, 0, 1, 1,
0.6197223, 1.232825, -0.3072351, 0.4509804, 0, 1, 1,
0.6200817, 0.1322585, 1.839643, 0.4588235, 0, 1, 1,
0.6212178, 0.4710558, 2.304061, 0.4627451, 0, 1, 1,
0.622549, 0.4091462, 0.8754691, 0.4705882, 0, 1, 1,
0.6267587, -1.211113, 2.880594, 0.4745098, 0, 1, 1,
0.6376366, 0.08857895, 2.079375, 0.4823529, 0, 1, 1,
0.6393202, -1.179429, -1.072503, 0.4862745, 0, 1, 1,
0.6400624, -0.9791417, 5.055338, 0.4941176, 0, 1, 1,
0.6463302, 0.7359099, 0.7440018, 0.5019608, 0, 1, 1,
0.6486977, 0.4835259, 0.4594529, 0.5058824, 0, 1, 1,
0.652646, -0.2752514, 2.85613, 0.5137255, 0, 1, 1,
0.6602399, 1.0289, 1.351686, 0.5176471, 0, 1, 1,
0.6610547, -0.9684926, 2.365207, 0.5254902, 0, 1, 1,
0.6660942, 0.01712178, 2.361295, 0.5294118, 0, 1, 1,
0.6713002, 1.190284, -0.2867732, 0.5372549, 0, 1, 1,
0.6771843, -2.3557, 1.935308, 0.5411765, 0, 1, 1,
0.6844153, -1.904497, 2.423226, 0.5490196, 0, 1, 1,
0.6869214, 1.29162, 0.327218, 0.5529412, 0, 1, 1,
0.6884731, 0.6348712, 0.07628782, 0.5607843, 0, 1, 1,
0.6893756, -0.4786228, 2.993474, 0.5647059, 0, 1, 1,
0.6928726, 1.181268, -0.7586603, 0.572549, 0, 1, 1,
0.6952303, 0.9975843, 0.3419611, 0.5764706, 0, 1, 1,
0.6971834, 0.946525, 0.9100499, 0.5843138, 0, 1, 1,
0.6977541, -0.03787693, -0.4444804, 0.5882353, 0, 1, 1,
0.6992558, -0.1966206, 1.243676, 0.5960785, 0, 1, 1,
0.6995715, 0.3218664, 0.7915255, 0.6039216, 0, 1, 1,
0.7020587, 0.1037868, 3.005719, 0.6078432, 0, 1, 1,
0.7052988, -1.197491, 3.447241, 0.6156863, 0, 1, 1,
0.7088966, 0.4019423, -0.03828767, 0.6196079, 0, 1, 1,
0.7104513, 0.3249336, 1.566148, 0.627451, 0, 1, 1,
0.7151157, -0.552272, 3.251507, 0.6313726, 0, 1, 1,
0.7188844, 0.1562358, 1.231728, 0.6392157, 0, 1, 1,
0.7190195, -0.5321258, 0.8219359, 0.6431373, 0, 1, 1,
0.7232301, 1.231742, -0.2801189, 0.6509804, 0, 1, 1,
0.7251526, -0.2165623, 1.614997, 0.654902, 0, 1, 1,
0.7273052, 0.187518, 0.3143959, 0.6627451, 0, 1, 1,
0.7282283, 0.7619517, 1.671937, 0.6666667, 0, 1, 1,
0.7308111, -0.9021001, 2.621136, 0.6745098, 0, 1, 1,
0.7390488, -0.7693074, 2.506458, 0.6784314, 0, 1, 1,
0.7403948, -1.521339, 4.403398, 0.6862745, 0, 1, 1,
0.7419657, 0.05135421, 1.276005, 0.6901961, 0, 1, 1,
0.7432494, -0.514695, 1.134994, 0.6980392, 0, 1, 1,
0.7453601, 0.6330019, 0.886044, 0.7058824, 0, 1, 1,
0.7456584, -0.5868092, 1.977397, 0.7098039, 0, 1, 1,
0.7465703, 0.4316943, 1.32147, 0.7176471, 0, 1, 1,
0.7477677, 0.4321118, 0.5174126, 0.7215686, 0, 1, 1,
0.7480329, 1.267284, 0.1530505, 0.7294118, 0, 1, 1,
0.7570247, 1.103185, 0.3198924, 0.7333333, 0, 1, 1,
0.7575801, 0.5682407, 3.178915, 0.7411765, 0, 1, 1,
0.7576082, 0.62281, -0.5185292, 0.7450981, 0, 1, 1,
0.7591733, -0.6453967, 1.633014, 0.7529412, 0, 1, 1,
0.7687166, 0.6085448, 0.5899089, 0.7568628, 0, 1, 1,
0.7893838, -1.461995, 2.581386, 0.7647059, 0, 1, 1,
0.7947716, -0.425073, 3.560595, 0.7686275, 0, 1, 1,
0.7950733, 1.310033, 0.8401293, 0.7764706, 0, 1, 1,
0.796192, -0.2784026, 1.109231, 0.7803922, 0, 1, 1,
0.7998216, 0.8442468, 1.252416, 0.7882353, 0, 1, 1,
0.8035223, -1.330395, 2.811703, 0.7921569, 0, 1, 1,
0.8046261, 1.92376, 1.429033, 0.8, 0, 1, 1,
0.8093546, 0.06210843, 2.158922, 0.8078431, 0, 1, 1,
0.8106855, -0.3318508, 3.095634, 0.8117647, 0, 1, 1,
0.8221012, -0.5257664, 3.196382, 0.8196079, 0, 1, 1,
0.8230889, -1.643414, 0.04059904, 0.8235294, 0, 1, 1,
0.8233808, -0.7150717, 1.886662, 0.8313726, 0, 1, 1,
0.8289303, 0.06727388, 2.354418, 0.8352941, 0, 1, 1,
0.8329187, 1.524929, 1.706631, 0.8431373, 0, 1, 1,
0.8361448, -1.081618, 3.915258, 0.8470588, 0, 1, 1,
0.8401549, 1.118634, 0.1754516, 0.854902, 0, 1, 1,
0.8425635, -0.3571537, 2.210898, 0.8588235, 0, 1, 1,
0.8559013, -0.8178596, 3.034641, 0.8666667, 0, 1, 1,
0.8570318, -0.4265421, 3.006521, 0.8705882, 0, 1, 1,
0.8590085, -0.128731, 3.070735, 0.8784314, 0, 1, 1,
0.8647304, -0.1980101, 3.297386, 0.8823529, 0, 1, 1,
0.8651452, 0.1089465, 2.812135, 0.8901961, 0, 1, 1,
0.8668613, -1.266507, 2.456883, 0.8941177, 0, 1, 1,
0.8698679, 0.9251255, -0.2069663, 0.9019608, 0, 1, 1,
0.8704185, 0.02534308, 0.9562451, 0.9098039, 0, 1, 1,
0.8708618, 1.553148, 2.601966, 0.9137255, 0, 1, 1,
0.8723428, -0.04358813, 2.789512, 0.9215686, 0, 1, 1,
0.8740991, 0.6514671, 2.522676, 0.9254902, 0, 1, 1,
0.8756494, -0.6228905, 2.208649, 0.9333333, 0, 1, 1,
0.8768265, -1.641319, 1.521483, 0.9372549, 0, 1, 1,
0.8829142, -1.483129, 2.091643, 0.945098, 0, 1, 1,
0.8844089, -0.06935412, 1.786033, 0.9490196, 0, 1, 1,
0.8854495, 0.3219155, 2.388439, 0.9568627, 0, 1, 1,
0.8953928, -0.6335321, 3.355875, 0.9607843, 0, 1, 1,
0.896407, 0.8373736, 0.6600906, 0.9686275, 0, 1, 1,
0.9020145, 1.152568, -0.1288401, 0.972549, 0, 1, 1,
0.9021013, 0.7488482, 0.5682865, 0.9803922, 0, 1, 1,
0.9031359, 0.6696678, 0.7986161, 0.9843137, 0, 1, 1,
0.9123412, 0.4053182, 2.848562, 0.9921569, 0, 1, 1,
0.9169962, -1.323122, 3.030163, 0.9960784, 0, 1, 1,
0.9229568, -0.3747572, 4.076198, 1, 0, 0.9960784, 1,
0.9265131, -0.6798757, 2.213325, 1, 0, 0.9882353, 1,
0.9280562, -0.7738311, 3.643687, 1, 0, 0.9843137, 1,
0.9313137, 1.028163, 0.270395, 1, 0, 0.9764706, 1,
0.9315539, -0.260414, 3.241549, 1, 0, 0.972549, 1,
0.9326037, -0.8023698, 4.2994, 1, 0, 0.9647059, 1,
0.9333119, -0.8548707, 4.237845, 1, 0, 0.9607843, 1,
0.935406, -2.518854, 3.063202, 1, 0, 0.9529412, 1,
0.9360768, -0.6615251, 3.022941, 1, 0, 0.9490196, 1,
0.9451918, -0.2061481, 1.363305, 1, 0, 0.9411765, 1,
0.9459106, -1.107084, 4.227718, 1, 0, 0.9372549, 1,
0.9486226, -1.671929, 3.821896, 1, 0, 0.9294118, 1,
0.9536006, 1.143339, 0.6549226, 1, 0, 0.9254902, 1,
0.9588938, 1.212998, 0.3930035, 1, 0, 0.9176471, 1,
0.9595697, -1.786846, 2.949647, 1, 0, 0.9137255, 1,
0.9665536, -1.273338, 3.12203, 1, 0, 0.9058824, 1,
0.9671034, -0.5878782, 2.87059, 1, 0, 0.9019608, 1,
0.9739107, 1.141106, -0.570825, 1, 0, 0.8941177, 1,
0.9779955, 0.3504657, 0.5560554, 1, 0, 0.8862745, 1,
0.9822224, 0.1180561, 1.162268, 1, 0, 0.8823529, 1,
0.9863627, -0.09887391, 1.717698, 1, 0, 0.8745098, 1,
0.9989169, -2.524392, 3.097906, 1, 0, 0.8705882, 1,
1.004341, 0.5036006, 0.8941721, 1, 0, 0.8627451, 1,
1.009821, -1.020677, 2.897647, 1, 0, 0.8588235, 1,
1.015683, -0.371438, -0.4354396, 1, 0, 0.8509804, 1,
1.016754, -0.7215782, 3.996816, 1, 0, 0.8470588, 1,
1.020547, -0.662496, 2.969579, 1, 0, 0.8392157, 1,
1.021253, -1.472589, 2.246034, 1, 0, 0.8352941, 1,
1.03218, -0.4834373, 1.06205, 1, 0, 0.827451, 1,
1.035341, -0.6599805, 1.403561, 1, 0, 0.8235294, 1,
1.03958, 1.654347, 1.278249, 1, 0, 0.8156863, 1,
1.052251, -0.7841455, 0.3545667, 1, 0, 0.8117647, 1,
1.054211, 0.2577063, 1.469896, 1, 0, 0.8039216, 1,
1.056532, 0.5755614, 1.939907, 1, 0, 0.7960784, 1,
1.063202, 0.08265578, 1.328275, 1, 0, 0.7921569, 1,
1.070317, 0.7113367, -0.9279011, 1, 0, 0.7843137, 1,
1.07651, -0.9752277, 2.149632, 1, 0, 0.7803922, 1,
1.083139, 0.3519014, 2.371687, 1, 0, 0.772549, 1,
1.088151, -1.094057, 3.108691, 1, 0, 0.7686275, 1,
1.090393, 0.2830842, 1.763349, 1, 0, 0.7607843, 1,
1.0999, 0.5437173, 1.383193, 1, 0, 0.7568628, 1,
1.110767, 0.8683265, -0.7678676, 1, 0, 0.7490196, 1,
1.11867, -0.931945, 1.546866, 1, 0, 0.7450981, 1,
1.118909, -0.03224041, 0.6756071, 1, 0, 0.7372549, 1,
1.125144, -2.575869, 1.075729, 1, 0, 0.7333333, 1,
1.138836, -0.2447769, 1.33378, 1, 0, 0.7254902, 1,
1.140454, 0.6823695, 0.3127473, 1, 0, 0.7215686, 1,
1.143, 0.8116893, 2.167747, 1, 0, 0.7137255, 1,
1.148111, 0.4337512, 2.038646, 1, 0, 0.7098039, 1,
1.156714, -1.043408, 1.172174, 1, 0, 0.7019608, 1,
1.159015, 0.6539481, 0.7348965, 1, 0, 0.6941177, 1,
1.159684, 0.4136339, 1.329607, 1, 0, 0.6901961, 1,
1.169247, 0.5371767, 2.700467, 1, 0, 0.682353, 1,
1.184096, -0.3655843, 2.294228, 1, 0, 0.6784314, 1,
1.185071, 0.4748681, 2.843742, 1, 0, 0.6705883, 1,
1.187797, 0.2908901, 0.3965944, 1, 0, 0.6666667, 1,
1.188644, 1.073964, 1.872521, 1, 0, 0.6588235, 1,
1.192749, -0.5605837, 0.640525, 1, 0, 0.654902, 1,
1.194827, -0.2588484, 1.757965, 1, 0, 0.6470588, 1,
1.198606, -0.8853651, 4.006962, 1, 0, 0.6431373, 1,
1.199074, -0.3292837, 2.086078, 1, 0, 0.6352941, 1,
1.201891, -1.347882, 0.3954149, 1, 0, 0.6313726, 1,
1.211482, -0.9639382, 2.099188, 1, 0, 0.6235294, 1,
1.220414, 0.6575848, 2.616239, 1, 0, 0.6196079, 1,
1.220886, -0.0903885, 1.107889, 1, 0, 0.6117647, 1,
1.235141, 2.013145, 1.970832, 1, 0, 0.6078432, 1,
1.240511, -0.2653483, 2.710779, 1, 0, 0.6, 1,
1.241846, 0.4177547, 0.9472757, 1, 0, 0.5921569, 1,
1.24775, -0.4623785, 1.528133, 1, 0, 0.5882353, 1,
1.259585, -0.3443368, 3.46007, 1, 0, 0.5803922, 1,
1.264257, -0.4995139, 2.08344, 1, 0, 0.5764706, 1,
1.276222, -0.3026966, 1.669748, 1, 0, 0.5686275, 1,
1.286046, -0.4514203, 0.954594, 1, 0, 0.5647059, 1,
1.289152, -0.835332, 1.554304, 1, 0, 0.5568628, 1,
1.289616, 0.4321281, 2.34114, 1, 0, 0.5529412, 1,
1.291098, -0.09478662, 2.173743, 1, 0, 0.5450981, 1,
1.293895, 1.349946, 1.500932, 1, 0, 0.5411765, 1,
1.294271, 1.902487, -0.8282033, 1, 0, 0.5333334, 1,
1.305912, 0.3527974, 0.2961075, 1, 0, 0.5294118, 1,
1.307256, 0.8673723, 0.5108987, 1, 0, 0.5215687, 1,
1.313631, 0.1119256, 3.72385, 1, 0, 0.5176471, 1,
1.314653, 0.2091815, 0.696021, 1, 0, 0.509804, 1,
1.338122, 0.8860295, 1.36125, 1, 0, 0.5058824, 1,
1.352677, 0.1051026, 1.431518, 1, 0, 0.4980392, 1,
1.360582, -1.563719, 3.124278, 1, 0, 0.4901961, 1,
1.360836, 1.245797, 1.9633, 1, 0, 0.4862745, 1,
1.365751, -0.08295908, 1.897715, 1, 0, 0.4784314, 1,
1.376233, -0.2706545, 3.28686, 1, 0, 0.4745098, 1,
1.379288, -0.1987609, 3.380912, 1, 0, 0.4666667, 1,
1.39792, -1.622707, 3.694693, 1, 0, 0.4627451, 1,
1.39976, 1.311725, 2.132736, 1, 0, 0.454902, 1,
1.408771, -0.5703167, 2.793744, 1, 0, 0.4509804, 1,
1.414395, 0.6902924, 1.407309, 1, 0, 0.4431373, 1,
1.421253, 0.5201659, 1.133493, 1, 0, 0.4392157, 1,
1.425531, 0.3311691, 1.430819, 1, 0, 0.4313726, 1,
1.43084, -1.185139, 3.186937, 1, 0, 0.427451, 1,
1.433432, -1.44679, 1.358669, 1, 0, 0.4196078, 1,
1.436779, 0.5250506, 1.715052, 1, 0, 0.4156863, 1,
1.451218, -0.2925348, 1.472212, 1, 0, 0.4078431, 1,
1.454423, 0.3293353, 3.332533, 1, 0, 0.4039216, 1,
1.461872, -0.223799, 2.039647, 1, 0, 0.3960784, 1,
1.469329, -2.327474, 2.128353, 1, 0, 0.3882353, 1,
1.474375, 0.04348147, 3.104737, 1, 0, 0.3843137, 1,
1.475566, 0.7753229, 1.187157, 1, 0, 0.3764706, 1,
1.490323, 0.2293311, 0.9910308, 1, 0, 0.372549, 1,
1.504436, -1.425574, 4.452662, 1, 0, 0.3647059, 1,
1.511553, -0.5657003, 2.526391, 1, 0, 0.3607843, 1,
1.524959, 1.594543, 1.455246, 1, 0, 0.3529412, 1,
1.540027, -0.1238851, 1.952645, 1, 0, 0.3490196, 1,
1.548342, -0.7559226, 1.44275, 1, 0, 0.3411765, 1,
1.549556, 2.634784, 0.9796218, 1, 0, 0.3372549, 1,
1.560994, -1.909991, 1.594518, 1, 0, 0.3294118, 1,
1.573038, -0.4496215, 1.396685, 1, 0, 0.3254902, 1,
1.588528, -0.5978616, 4.358212, 1, 0, 0.3176471, 1,
1.592719, -1.282684, 3.640683, 1, 0, 0.3137255, 1,
1.596467, 2.034646, 0.1128261, 1, 0, 0.3058824, 1,
1.618144, 1.279478, 1.125141, 1, 0, 0.2980392, 1,
1.628977, -0.3859493, 1.287871, 1, 0, 0.2941177, 1,
1.631094, -1.299174, -0.08105361, 1, 0, 0.2862745, 1,
1.66065, -0.8354154, 1.659677, 1, 0, 0.282353, 1,
1.668073, 0.002129175, 1.686197, 1, 0, 0.2745098, 1,
1.674625, 1.655432, 0.5892807, 1, 0, 0.2705882, 1,
1.676174, 0.9870225, -0.0336279, 1, 0, 0.2627451, 1,
1.730703, -0.2224232, 2.146329, 1, 0, 0.2588235, 1,
1.753515, -0.08603238, 1.793111, 1, 0, 0.2509804, 1,
1.773315, -1.281196, 3.26389, 1, 0, 0.2470588, 1,
1.848925, 0.5570104, -0.20602, 1, 0, 0.2392157, 1,
1.896733, -0.1304499, 2.291623, 1, 0, 0.2352941, 1,
1.899405, -0.8406947, 2.959104, 1, 0, 0.227451, 1,
1.929504, 1.524715, -0.8173626, 1, 0, 0.2235294, 1,
1.97096, 1.308712, 0.7945653, 1, 0, 0.2156863, 1,
1.986115, 0.3377182, 1.673414, 1, 0, 0.2117647, 1,
1.988291, 0.9758154, 4.518894, 1, 0, 0.2039216, 1,
2.052583, 0.7478816, 0.7781474, 1, 0, 0.1960784, 1,
2.066005, -0.8723032, 1.087791, 1, 0, 0.1921569, 1,
2.087506, -1.210032, 1.782091, 1, 0, 0.1843137, 1,
2.111445, 0.8167114, 1.257942, 1, 0, 0.1803922, 1,
2.145057, 0.3224722, 1.594685, 1, 0, 0.172549, 1,
2.158791, -1.475276, 1.474834, 1, 0, 0.1686275, 1,
2.15933, 0.9652134, 2.535151, 1, 0, 0.1607843, 1,
2.1619, 0.8538122, 1.352683, 1, 0, 0.1568628, 1,
2.171579, -0.7516168, 2.142191, 1, 0, 0.1490196, 1,
2.201662, -1.215688, 1.307736, 1, 0, 0.145098, 1,
2.208072, -0.1766353, 1.455359, 1, 0, 0.1372549, 1,
2.218582, 0.7142354, 1.303249, 1, 0, 0.1333333, 1,
2.220352, 1.372323, 0.4427352, 1, 0, 0.1254902, 1,
2.230328, -0.5272176, 2.039023, 1, 0, 0.1215686, 1,
2.233073, 1.702622, 0.6095062, 1, 0, 0.1137255, 1,
2.249963, 0.1451468, 2.225359, 1, 0, 0.1098039, 1,
2.252727, -0.983556, 0.912609, 1, 0, 0.1019608, 1,
2.299315, -0.7061549, -0.1016587, 1, 0, 0.09411765, 1,
2.312962, 0.3044514, 3.057969, 1, 0, 0.09019608, 1,
2.325383, 0.4810934, 2.279, 1, 0, 0.08235294, 1,
2.356011, 1.667607, 0.847459, 1, 0, 0.07843138, 1,
2.370433, 1.704298, 1.443213, 1, 0, 0.07058824, 1,
2.389693, -0.7826009, 1.432368, 1, 0, 0.06666667, 1,
2.390649, 0.7592593, 1.311187, 1, 0, 0.05882353, 1,
2.412733, -0.1460443, 1.942136, 1, 0, 0.05490196, 1,
2.52571, 1.819418, 0.4446093, 1, 0, 0.04705882, 1,
2.649138, -2.098276, 2.457245, 1, 0, 0.04313726, 1,
2.666677, -0.3057883, 2.246116, 1, 0, 0.03529412, 1,
2.890436, -0.05031544, 2.490072, 1, 0, 0.03137255, 1,
2.913263, 1.664602, 2.448779, 1, 0, 0.02352941, 1,
3.170503, -0.2497101, 2.440513, 1, 0, 0.01960784, 1,
3.37294, -0.07114217, 1.703467, 1, 0, 0.01176471, 1,
3.384149, 0.6837248, 1.548057, 1, 0, 0.007843138, 1
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
0.1853741, -3.952242, -6.991949, 0, -0.5, 0.5, 0.5,
0.1853741, -3.952242, -6.991949, 1, -0.5, 0.5, 0.5,
0.1853741, -3.952242, -6.991949, 1, 1.5, 0.5, 0.5,
0.1853741, -3.952242, -6.991949, 0, 1.5, 0.5, 0.5
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
-4.097785, 0.2234656, -6.991949, 0, -0.5, 0.5, 0.5,
-4.097785, 0.2234656, -6.991949, 1, -0.5, 0.5, 0.5,
-4.097785, 0.2234656, -6.991949, 1, 1.5, 0.5, 0.5,
-4.097785, 0.2234656, -6.991949, 0, 1.5, 0.5, 0.5
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
-4.097785, -3.952242, 0.1541164, 0, -0.5, 0.5, 0.5,
-4.097785, -3.952242, 0.1541164, 1, -0.5, 0.5, 0.5,
-4.097785, -3.952242, 0.1541164, 1, 1.5, 0.5, 0.5,
-4.097785, -3.952242, 0.1541164, 0, 1.5, 0.5, 0.5
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
-3, -2.988618, -5.342857,
3, -2.988618, -5.342857,
-3, -2.988618, -5.342857,
-3, -3.149222, -5.617705,
-2, -2.988618, -5.342857,
-2, -3.149222, -5.617705,
-1, -2.988618, -5.342857,
-1, -3.149222, -5.617705,
0, -2.988618, -5.342857,
0, -3.149222, -5.617705,
1, -2.988618, -5.342857,
1, -3.149222, -5.617705,
2, -2.988618, -5.342857,
2, -3.149222, -5.617705,
3, -2.988618, -5.342857,
3, -3.149222, -5.617705
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
-3, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
-3, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
-3, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
-3, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
-2, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
-2, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
-2, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
-2, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
-1, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
-1, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
-1, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
-1, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
0, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
0, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
0, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
0, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
1, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
1, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
1, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
1, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
2, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
2, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
2, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
2, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5,
3, -3.47043, -6.167403, 0, -0.5, 0.5, 0.5,
3, -3.47043, -6.167403, 1, -0.5, 0.5, 0.5,
3, -3.47043, -6.167403, 1, 1.5, 0.5, 0.5,
3, -3.47043, -6.167403, 0, 1.5, 0.5, 0.5
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
-3.109364, -2, -5.342857,
-3.109364, 3, -5.342857,
-3.109364, -2, -5.342857,
-3.274101, -2, -5.617705,
-3.109364, -1, -5.342857,
-3.274101, -1, -5.617705,
-3.109364, 0, -5.342857,
-3.274101, 0, -5.617705,
-3.109364, 1, -5.342857,
-3.274101, 1, -5.617705,
-3.109364, 2, -5.342857,
-3.274101, 2, -5.617705,
-3.109364, 3, -5.342857,
-3.274101, 3, -5.617705
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
-3.603574, -2, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, -2, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, -2, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, -2, -6.167403, 0, 1.5, 0.5, 0.5,
-3.603574, -1, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, -1, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, -1, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, -1, -6.167403, 0, 1.5, 0.5, 0.5,
-3.603574, 0, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, 0, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, 0, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, 0, -6.167403, 0, 1.5, 0.5, 0.5,
-3.603574, 1, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, 1, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, 1, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, 1, -6.167403, 0, 1.5, 0.5, 0.5,
-3.603574, 2, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, 2, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, 2, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, 2, -6.167403, 0, 1.5, 0.5, 0.5,
-3.603574, 3, -6.167403, 0, -0.5, 0.5, 0.5,
-3.603574, 3, -6.167403, 1, -0.5, 0.5, 0.5,
-3.603574, 3, -6.167403, 1, 1.5, 0.5, 0.5,
-3.603574, 3, -6.167403, 0, 1.5, 0.5, 0.5
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
-3.109364, -2.988618, -4,
-3.109364, -2.988618, 4,
-3.109364, -2.988618, -4,
-3.274101, -3.149222, -4,
-3.109364, -2.988618, -2,
-3.274101, -3.149222, -2,
-3.109364, -2.988618, 0,
-3.274101, -3.149222, 0,
-3.109364, -2.988618, 2,
-3.274101, -3.149222, 2,
-3.109364, -2.988618, 4,
-3.274101, -3.149222, 4
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
-3.603574, -3.47043, -4, 0, -0.5, 0.5, 0.5,
-3.603574, -3.47043, -4, 1, -0.5, 0.5, 0.5,
-3.603574, -3.47043, -4, 1, 1.5, 0.5, 0.5,
-3.603574, -3.47043, -4, 0, 1.5, 0.5, 0.5,
-3.603574, -3.47043, -2, 0, -0.5, 0.5, 0.5,
-3.603574, -3.47043, -2, 1, -0.5, 0.5, 0.5,
-3.603574, -3.47043, -2, 1, 1.5, 0.5, 0.5,
-3.603574, -3.47043, -2, 0, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 0, 0, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 0, 1, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 0, 1, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 0, 0, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 2, 0, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 2, 1, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 2, 1, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 2, 0, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 4, 0, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 4, 1, -0.5, 0.5, 0.5,
-3.603574, -3.47043, 4, 1, 1.5, 0.5, 0.5,
-3.603574, -3.47043, 4, 0, 1.5, 0.5, 0.5
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
-3.109364, -2.988618, -5.342857,
-3.109364, 3.435549, -5.342857,
-3.109364, -2.988618, 5.65109,
-3.109364, 3.435549, 5.65109,
-3.109364, -2.988618, -5.342857,
-3.109364, -2.988618, 5.65109,
-3.109364, 3.435549, -5.342857,
-3.109364, 3.435549, 5.65109,
-3.109364, -2.988618, -5.342857,
3.480112, -2.988618, -5.342857,
-3.109364, -2.988618, 5.65109,
3.480112, -2.988618, 5.65109,
-3.109364, 3.435549, -5.342857,
3.480112, 3.435549, -5.342857,
-3.109364, 3.435549, 5.65109,
3.480112, 3.435549, 5.65109,
3.480112, -2.988618, -5.342857,
3.480112, 3.435549, -5.342857,
3.480112, -2.988618, 5.65109,
3.480112, 3.435549, 5.65109,
3.480112, -2.988618, -5.342857,
3.480112, -2.988618, 5.65109,
3.480112, 3.435549, -5.342857,
3.480112, 3.435549, 5.65109
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
var radius = 7.655836;
var distance = 34.06168;
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
mvMatrix.translate( -0.1853741, -0.2234656, -0.1541164 );
mvMatrix.scale( 1.256191, 1.288516, 0.7529271 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06168);
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
quizalofop<-read.table("quizalofop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quizalofop$V2
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
y<-quizalofop$V3
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
z<-quizalofop$V4
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
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
-3.0134, -0.4364147, -1.67523, 0, 0, 1, 1, 1,
-2.730603, 1.686029, -1.589839, 1, 0, 0, 1, 1,
-2.632678, 0.09574425, -2.641095, 1, 0, 0, 1, 1,
-2.569118, -0.5609959, -2.721698, 1, 0, 0, 1, 1,
-2.548168, -0.8831304, -1.532331, 1, 0, 0, 1, 1,
-2.50971, 0.2101181, -2.092833, 1, 0, 0, 1, 1,
-2.461499, -0.6313436, -3.220121, 0, 0, 0, 1, 1,
-2.368663, 0.1271626, -0.8362058, 0, 0, 0, 1, 1,
-2.357182, 1.49245, 0.1261829, 0, 0, 0, 1, 1,
-2.323377, 0.372592, -0.4836119, 0, 0, 0, 1, 1,
-2.322386, 0.7890762, -1.34689, 0, 0, 0, 1, 1,
-2.305305, 0.6006536, -1.812031, 0, 0, 0, 1, 1,
-2.29724, 0.3490762, -0.1609311, 0, 0, 0, 1, 1,
-2.260607, -0.5871385, -1.815549, 1, 1, 1, 1, 1,
-2.256348, -0.3215664, -2.107141, 1, 1, 1, 1, 1,
-2.254714, -0.6863037, -2.26886, 1, 1, 1, 1, 1,
-2.254703, -0.7066663, -1.484451, 1, 1, 1, 1, 1,
-2.252462, -0.8348886, -2.814831, 1, 1, 1, 1, 1,
-2.2491, 0.3944581, -1.245256, 1, 1, 1, 1, 1,
-2.243525, -1.440335, -4.033477, 1, 1, 1, 1, 1,
-2.240727, -1.177073, -3.610239, 1, 1, 1, 1, 1,
-2.192272, 0.5457915, -2.38899, 1, 1, 1, 1, 1,
-2.129456, 1.091541, 0.5820152, 1, 1, 1, 1, 1,
-2.128178, -0.9685608, -1.476533, 1, 1, 1, 1, 1,
-2.093234, 0.07450475, -0.4705096, 1, 1, 1, 1, 1,
-2.089036, 1.500861, -1.650949, 1, 1, 1, 1, 1,
-2.083882, 1.791347, -0.5088016, 1, 1, 1, 1, 1,
-2.049127, 0.4069676, -3.219028, 1, 1, 1, 1, 1,
-2.037938, -0.5681455, -2.673094, 0, 0, 1, 1, 1,
-2.02973, -2.232675, -4.267204, 1, 0, 0, 1, 1,
-2.017828, 0.2546257, -1.451328, 1, 0, 0, 1, 1,
-2.006725, 0.4133277, -1.715986, 1, 0, 0, 1, 1,
-1.99904, 0.3097657, -0.3955766, 1, 0, 0, 1, 1,
-1.994278, -0.1449244, -3.327394, 1, 0, 0, 1, 1,
-1.993109, 2.060323, 0.8437181, 0, 0, 0, 1, 1,
-1.962123, -1.467088, -1.59837, 0, 0, 0, 1, 1,
-1.953786, 1.311381, -0.8211621, 0, 0, 0, 1, 1,
-1.915579, -0.7590358, -0.03959262, 0, 0, 0, 1, 1,
-1.911468, -0.07285371, -1.586403, 0, 0, 0, 1, 1,
-1.901715, -0.5786547, -3.174035, 0, 0, 0, 1, 1,
-1.891472, 0.5822929, -1.271167, 0, 0, 0, 1, 1,
-1.889692, 0.2150387, -1.014568, 1, 1, 1, 1, 1,
-1.876184, -0.0197681, -1.482378, 1, 1, 1, 1, 1,
-1.875731, 0.2592721, -2.279192, 1, 1, 1, 1, 1,
-1.848297, -0.8422925, -2.07132, 1, 1, 1, 1, 1,
-1.841357, -0.01080422, -2.115784, 1, 1, 1, 1, 1,
-1.803912, 0.415877, -0.9475924, 1, 1, 1, 1, 1,
-1.778475, -0.7466761, -3.126894, 1, 1, 1, 1, 1,
-1.775688, 0.09151077, -1.990441, 1, 1, 1, 1, 1,
-1.774773, -2.004158, -0.9743137, 1, 1, 1, 1, 1,
-1.766799, -0.8303335, -2.105259, 1, 1, 1, 1, 1,
-1.765967, -0.7314253, -0.9903855, 1, 1, 1, 1, 1,
-1.760332, 2.29993, -0.7335782, 1, 1, 1, 1, 1,
-1.759204, -1.272901, -1.859035, 1, 1, 1, 1, 1,
-1.751008, 0.2400479, -1.370139, 1, 1, 1, 1, 1,
-1.743355, 0.9511743, -0.8672295, 1, 1, 1, 1, 1,
-1.739462, -1.956025, -2.174787, 0, 0, 1, 1, 1,
-1.738415, 0.2633489, -0.7514637, 1, 0, 0, 1, 1,
-1.732186, 0.07018111, 0.1736257, 1, 0, 0, 1, 1,
-1.707301, 0.4594825, -2.302043, 1, 0, 0, 1, 1,
-1.702136, 0.2340115, -1.595987, 1, 0, 0, 1, 1,
-1.669747, 2.080916, -0.3367776, 1, 0, 0, 1, 1,
-1.650482, 1.339169, -1.031123, 0, 0, 0, 1, 1,
-1.650026, 0.5038105, -1.674344, 0, 0, 0, 1, 1,
-1.644155, 0.2890913, -0.2840589, 0, 0, 0, 1, 1,
-1.64235, 0.7413173, -0.8793712, 0, 0, 0, 1, 1,
-1.642265, -1.035885, -1.228752, 0, 0, 0, 1, 1,
-1.629241, 0.8232553, -0.1267205, 0, 0, 0, 1, 1,
-1.627622, -0.1243763, -3.26876, 0, 0, 0, 1, 1,
-1.593084, -0.546896, -2.438414, 1, 1, 1, 1, 1,
-1.583971, 0.05812357, -2.298117, 1, 1, 1, 1, 1,
-1.564308, 1.38682, -1.390451, 1, 1, 1, 1, 1,
-1.539081, -0.6625969, -0.8088277, 1, 1, 1, 1, 1,
-1.537616, 0.828127, -0.4215157, 1, 1, 1, 1, 1,
-1.532435, 0.7919942, -0.7566864, 1, 1, 1, 1, 1,
-1.523146, -1.044208, -3.615081, 1, 1, 1, 1, 1,
-1.510842, -0.6874365, -4.811048, 1, 1, 1, 1, 1,
-1.492857, -0.8862857, -2.14253, 1, 1, 1, 1, 1,
-1.479234, 0.5740169, -1.511811, 1, 1, 1, 1, 1,
-1.47485, -0.04130477, -0.03874197, 1, 1, 1, 1, 1,
-1.470236, -1.545969, -1.838038, 1, 1, 1, 1, 1,
-1.466953, -1.564867, -3.268867, 1, 1, 1, 1, 1,
-1.464273, -0.2719204, -1.663544, 1, 1, 1, 1, 1,
-1.46037, -0.9110629, -3.578682, 1, 1, 1, 1, 1,
-1.457767, 0.7501368, -1.918981, 0, 0, 1, 1, 1,
-1.453443, 0.2926955, -1.934518, 1, 0, 0, 1, 1,
-1.446489, 0.1427553, -0.3157805, 1, 0, 0, 1, 1,
-1.442417, -1.020063, -1.25429, 1, 0, 0, 1, 1,
-1.439657, 0.7097155, 0.438266, 1, 0, 0, 1, 1,
-1.437598, -2.059431, -3.447855, 1, 0, 0, 1, 1,
-1.426176, -0.2840455, -1.734874, 0, 0, 0, 1, 1,
-1.419188, -0.3090462, -2.329714, 0, 0, 0, 1, 1,
-1.410475, 0.3809699, -3.633245, 0, 0, 0, 1, 1,
-1.394661, -0.402506, -0.2788769, 0, 0, 0, 1, 1,
-1.390671, 1.595115, -1.747219, 0, 0, 0, 1, 1,
-1.384277, -0.7896771, -2.963824, 0, 0, 0, 1, 1,
-1.381614, -2.042428, -2.253206, 0, 0, 0, 1, 1,
-1.366859, 0.9212103, -0.593492, 1, 1, 1, 1, 1,
-1.365579, -0.8930517, -3.522637, 1, 1, 1, 1, 1,
-1.361115, -0.8601783, -2.001824, 1, 1, 1, 1, 1,
-1.359088, 0.2070914, 0.6088926, 1, 1, 1, 1, 1,
-1.357383, 1.535496, 0.5681235, 1, 1, 1, 1, 1,
-1.356633, -1.15495, -3.103171, 1, 1, 1, 1, 1,
-1.353681, 0.6418828, -1.382071, 1, 1, 1, 1, 1,
-1.353216, 1.30926, 0.2127674, 1, 1, 1, 1, 1,
-1.347656, 0.9970669, -1.05076, 1, 1, 1, 1, 1,
-1.340532, -0.4577954, -1.901268, 1, 1, 1, 1, 1,
-1.338865, 1.867831, 0.07315379, 1, 1, 1, 1, 1,
-1.3287, 0.9826183, -1.791832, 1, 1, 1, 1, 1,
-1.328245, 1.312815, -0.849398, 1, 1, 1, 1, 1,
-1.311369, -1.040264, -2.923311, 1, 1, 1, 1, 1,
-1.309032, -0.1567834, -1.567056, 1, 1, 1, 1, 1,
-1.308101, 0.8241913, -3.025333, 0, 0, 1, 1, 1,
-1.304496, -0.6837943, -5.079541, 1, 0, 0, 1, 1,
-1.296008, -0.5187967, -2.377529, 1, 0, 0, 1, 1,
-1.291768, 0.1733389, -2.136699, 1, 0, 0, 1, 1,
-1.289155, 0.347317, -0.3111134, 1, 0, 0, 1, 1,
-1.286585, -1.196814, -1.793915, 1, 0, 0, 1, 1,
-1.284638, 1.191482, -0.7301698, 0, 0, 0, 1, 1,
-1.282495, -0.006153484, -3.180979, 0, 0, 0, 1, 1,
-1.281682, -0.05061269, -2.056135, 0, 0, 0, 1, 1,
-1.28136, 0.04891879, -2.23995, 0, 0, 0, 1, 1,
-1.276423, 0.2358605, -2.639804, 0, 0, 0, 1, 1,
-1.261618, -0.0968686, -1.449023, 0, 0, 0, 1, 1,
-1.253811, 0.4548737, -1.938477, 0, 0, 0, 1, 1,
-1.250834, -0.5311432, -1.235127, 1, 1, 1, 1, 1,
-1.250163, -0.7240635, -1.650383, 1, 1, 1, 1, 1,
-1.248048, 1.75315, 0.03864113, 1, 1, 1, 1, 1,
-1.238417, -0.7689291, -3.371522, 1, 1, 1, 1, 1,
-1.237519, -1.41248, -2.631667, 1, 1, 1, 1, 1,
-1.231959, 0.03530924, -1.67835, 1, 1, 1, 1, 1,
-1.228201, 0.9684652, -0.4679991, 1, 1, 1, 1, 1,
-1.224991, 1.063104, -1.918583, 1, 1, 1, 1, 1,
-1.223539, -1.599989, -1.769716, 1, 1, 1, 1, 1,
-1.218438, 1.716781, -0.5044978, 1, 1, 1, 1, 1,
-1.201024, 0.6327426, 0.7868823, 1, 1, 1, 1, 1,
-1.199923, 3.341993, 0.04772613, 1, 1, 1, 1, 1,
-1.19647, -0.9873261, -2.727034, 1, 1, 1, 1, 1,
-1.190646, -0.007831319, -1.023512, 1, 1, 1, 1, 1,
-1.187265, 1.01738, 0.3994681, 1, 1, 1, 1, 1,
-1.17938, 2.125051, -0.5640534, 0, 0, 1, 1, 1,
-1.170495, 1.045402, -0.1129795, 1, 0, 0, 1, 1,
-1.167459, 1.032199, -0.3729698, 1, 0, 0, 1, 1,
-1.162425, -0.01943903, -1.782052, 1, 0, 0, 1, 1,
-1.161641, -0.5129018, -1.83511, 1, 0, 0, 1, 1,
-1.161376, -2.32209, -1.752229, 1, 0, 0, 1, 1,
-1.156868, 0.06611981, -2.867431, 0, 0, 0, 1, 1,
-1.154126, -1.58428, -4.003037, 0, 0, 0, 1, 1,
-1.153495, -1.334564, -3.681642, 0, 0, 0, 1, 1,
-1.146603, -0.3633911, -2.476377, 0, 0, 0, 1, 1,
-1.139549, 0.3277639, -1.697563, 0, 0, 0, 1, 1,
-1.139149, -0.9881806, -2.762649, 0, 0, 0, 1, 1,
-1.133639, 0.04776904, -0.7166106, 0, 0, 0, 1, 1,
-1.117771, 0.2245772, -0.4361256, 1, 1, 1, 1, 1,
-1.117311, -1.842556, -4.396887, 1, 1, 1, 1, 1,
-1.11368, -0.5135694, -0.3409627, 1, 1, 1, 1, 1,
-1.11316, -0.6104845, -2.596967, 1, 1, 1, 1, 1,
-1.11105, 2.241454, -1.074875, 1, 1, 1, 1, 1,
-1.099437, 0.7071108, -1.700861, 1, 1, 1, 1, 1,
-1.09129, 0.6082874, -1.298986, 1, 1, 1, 1, 1,
-1.084124, -0.4566482, -3.619401, 1, 1, 1, 1, 1,
-1.083554, 0.3204266, -0.2524905, 1, 1, 1, 1, 1,
-1.082502, -0.0130432, -4.307359, 1, 1, 1, 1, 1,
-1.082484, -0.377801, -1.033871, 1, 1, 1, 1, 1,
-1.070172, 0.2052607, -1.711116, 1, 1, 1, 1, 1,
-1.065375, -0.03237195, -1.665134, 1, 1, 1, 1, 1,
-1.048458, -0.2823006, -1.563727, 1, 1, 1, 1, 1,
-1.046295, -0.8969284, -2.015953, 1, 1, 1, 1, 1,
-1.040698, -0.09514742, -1.449051, 0, 0, 1, 1, 1,
-1.038803, 0.3814723, -2.071464, 1, 0, 0, 1, 1,
-1.032105, -0.5636258, -1.365748, 1, 0, 0, 1, 1,
-1.030736, -0.468817, -2.263778, 1, 0, 0, 1, 1,
-1.028529, 0.2589859, -2.236539, 1, 0, 0, 1, 1,
-1.010585, -1.845991, -2.153698, 1, 0, 0, 1, 1,
-1.004301, -0.274116, -2.80032, 0, 0, 0, 1, 1,
-0.9985646, 0.3559808, -0.1751961, 0, 0, 0, 1, 1,
-0.9925102, 0.4025919, -0.9540287, 0, 0, 0, 1, 1,
-0.9879257, -1.000706, -1.351381, 0, 0, 0, 1, 1,
-0.9868538, 0.4637457, 0.5441151, 0, 0, 0, 1, 1,
-0.9850643, 0.6270414, -0.08747581, 0, 0, 0, 1, 1,
-0.9847199, 1.506335, 0.03091371, 0, 0, 0, 1, 1,
-0.9833505, 0.7741567, -1.137174, 1, 1, 1, 1, 1,
-0.9826264, -0.3576063, -1.908337, 1, 1, 1, 1, 1,
-0.9783254, 1.709612, -0.09080519, 1, 1, 1, 1, 1,
-0.9714653, 0.8906199, -1.288291, 1, 1, 1, 1, 1,
-0.9696115, -0.363583, -2.236001, 1, 1, 1, 1, 1,
-0.9688291, 2.560956, -0.7945996, 1, 1, 1, 1, 1,
-0.9677594, -0.3621936, -1.936055, 1, 1, 1, 1, 1,
-0.9664811, 1.351976, -2.036874, 1, 1, 1, 1, 1,
-0.9636343, -1.142967, -3.102862, 1, 1, 1, 1, 1,
-0.9614154, 0.9698843, -0.1879071, 1, 1, 1, 1, 1,
-0.9600859, -0.3733971, -0.7473469, 1, 1, 1, 1, 1,
-0.951691, -0.9689221, -2.731007, 1, 1, 1, 1, 1,
-0.9452062, 2.08889, -0.292989, 1, 1, 1, 1, 1,
-0.9378863, 0.7176965, -0.07210622, 1, 1, 1, 1, 1,
-0.933832, -1.160833, -2.492504, 1, 1, 1, 1, 1,
-0.9250726, 0.3872416, -0.6466131, 0, 0, 1, 1, 1,
-0.9199125, -0.4317377, -2.307672, 1, 0, 0, 1, 1,
-0.9198013, 0.2971236, 0.6053239, 1, 0, 0, 1, 1,
-0.9184089, -0.2043117, -2.026425, 1, 0, 0, 1, 1,
-0.9124486, -0.5401944, -1.951285, 1, 0, 0, 1, 1,
-0.9005985, -0.8401003, -0.9264838, 1, 0, 0, 1, 1,
-0.9004772, 0.6973569, -2.711228, 0, 0, 0, 1, 1,
-0.8977323, -0.3813646, -0.7690682, 0, 0, 0, 1, 1,
-0.8934687, 0.3658365, -2.476732, 0, 0, 0, 1, 1,
-0.8877441, 1.678134, -0.8795033, 0, 0, 0, 1, 1,
-0.8856784, -2.376084, -2.410706, 0, 0, 0, 1, 1,
-0.884273, 0.5890768, -4.090116, 0, 0, 0, 1, 1,
-0.8825679, 1.183857, -0.6184722, 0, 0, 0, 1, 1,
-0.877635, -0.6840551, -1.865772, 1, 1, 1, 1, 1,
-0.8703981, -1.37958, -3.282152, 1, 1, 1, 1, 1,
-0.8702168, 0.407356, 0.7837416, 1, 1, 1, 1, 1,
-0.8658013, -1.267717, -3.259297, 1, 1, 1, 1, 1,
-0.8651838, -0.4284382, -3.726312, 1, 1, 1, 1, 1,
-0.8581466, -1.088546, -4.244636, 1, 1, 1, 1, 1,
-0.854474, -0.2318165, 0.1589958, 1, 1, 1, 1, 1,
-0.8508594, -0.5890834, -1.507502, 1, 1, 1, 1, 1,
-0.8442606, 0.1998355, -1.431395, 1, 1, 1, 1, 1,
-0.8259551, -0.873374, -1.689725, 1, 1, 1, 1, 1,
-0.8240966, -1.021987, -3.288442, 1, 1, 1, 1, 1,
-0.8234755, -0.5286304, -3.992989, 1, 1, 1, 1, 1,
-0.8176731, 0.8710519, -2.015493, 1, 1, 1, 1, 1,
-0.8154739, 0.6522686, -0.4099213, 1, 1, 1, 1, 1,
-0.814536, 1.72831, 0.4636768, 1, 1, 1, 1, 1,
-0.8141361, -0.3507589, -2.684061, 0, 0, 1, 1, 1,
-0.8127933, -0.3597628, -2.262061, 1, 0, 0, 1, 1,
-0.8121933, -0.04884491, -2.001314, 1, 0, 0, 1, 1,
-0.8111256, -0.2216471, -1.104264, 1, 0, 0, 1, 1,
-0.8109002, -0.2936815, -1.602982, 1, 0, 0, 1, 1,
-0.8085045, -1.267699, -2.68734, 1, 0, 0, 1, 1,
-0.803252, -0.729171, -3.003434, 0, 0, 0, 1, 1,
-0.8013558, -0.9563581, -2.551453, 0, 0, 0, 1, 1,
-0.8008, 0.4756884, -0.2016669, 0, 0, 0, 1, 1,
-0.7926424, 0.8241346, -0.7210505, 0, 0, 0, 1, 1,
-0.7923791, -0.3916019, -3.477506, 0, 0, 0, 1, 1,
-0.7853286, 1.617114, -1.173898, 0, 0, 0, 1, 1,
-0.7803723, 1.058526, 0.4068244, 0, 0, 0, 1, 1,
-0.767683, -0.2762947, -1.68454, 1, 1, 1, 1, 1,
-0.7666491, 1.438713, 0.9072061, 1, 1, 1, 1, 1,
-0.7622729, -1.179021, -1.276885, 1, 1, 1, 1, 1,
-0.7616821, 0.4321307, -1.901389, 1, 1, 1, 1, 1,
-0.7608641, -1.179407, -4.461973, 1, 1, 1, 1, 1,
-0.7589387, -0.3625994, -2.821237, 1, 1, 1, 1, 1,
-0.7563898, -0.3411933, -0.880206, 1, 1, 1, 1, 1,
-0.7558485, -0.07314198, -1.801863, 1, 1, 1, 1, 1,
-0.7535748, 0.9550481, -0.4390911, 1, 1, 1, 1, 1,
-0.7496493, 0.6556908, -0.1016213, 1, 1, 1, 1, 1,
-0.7480491, -1.238869, -3.464386, 1, 1, 1, 1, 1,
-0.7479715, 0.5465105, 0.6043459, 1, 1, 1, 1, 1,
-0.7382009, 1.305789, -0.3121805, 1, 1, 1, 1, 1,
-0.7306105, -1.308107, -3.686965, 1, 1, 1, 1, 1,
-0.7232727, 0.7343386, -0.3851525, 1, 1, 1, 1, 1,
-0.7187724, -0.364649, -1.353697, 0, 0, 1, 1, 1,
-0.7159641, 0.4502658, 0.7053354, 1, 0, 0, 1, 1,
-0.7090921, -1.606277, -3.634914, 1, 0, 0, 1, 1,
-0.7081677, -2.101443, -2.744061, 1, 0, 0, 1, 1,
-0.7081026, -1.191882, -2.015853, 1, 0, 0, 1, 1,
-0.7060238, 1.009421, -0.9665878, 1, 0, 0, 1, 1,
-0.7031003, 1.083962, 1.379374, 0, 0, 0, 1, 1,
-0.6955288, -1.868695, -2.123069, 0, 0, 0, 1, 1,
-0.6918722, -0.2945121, -2.963794, 0, 0, 0, 1, 1,
-0.6896681, -0.4871164, -1.283944, 0, 0, 0, 1, 1,
-0.6895458, -0.8673511, -3.219864, 0, 0, 0, 1, 1,
-0.6791215, -0.08906299, -2.703642, 0, 0, 0, 1, 1,
-0.6716599, 1.103006, -1.590169, 0, 0, 0, 1, 1,
-0.663157, 0.5090095, 1.16168, 1, 1, 1, 1, 1,
-0.6612706, 0.9725648, 0.1106584, 1, 1, 1, 1, 1,
-0.6569484, 2.21978, 1.003487, 1, 1, 1, 1, 1,
-0.6540697, 0.1806768, -2.970045, 1, 1, 1, 1, 1,
-0.645504, -1.148888, -2.054765, 1, 1, 1, 1, 1,
-0.6411608, -1.624069, -0.6708605, 1, 1, 1, 1, 1,
-0.6410134, -1.601215, -4.858662, 1, 1, 1, 1, 1,
-0.6358845, -0.2446171, -3.104362, 1, 1, 1, 1, 1,
-0.6348206, 0.6012687, 0.5252537, 1, 1, 1, 1, 1,
-0.6323218, -0.5147386, -1.460111, 1, 1, 1, 1, 1,
-0.6309553, 1.450739, -1.175902, 1, 1, 1, 1, 1,
-0.6234359, 0.1164433, -0.6119291, 1, 1, 1, 1, 1,
-0.6217844, 0.2012649, -0.6581985, 1, 1, 1, 1, 1,
-0.6174595, -0.08570679, -1.681354, 1, 1, 1, 1, 1,
-0.6152793, 0.5151594, 0.3428059, 1, 1, 1, 1, 1,
-0.6092076, -0.1807397, -3.756248, 0, 0, 1, 1, 1,
-0.6089781, -0.7672988, -3.182011, 1, 0, 0, 1, 1,
-0.6081972, 0.6276138, -1.302905, 1, 0, 0, 1, 1,
-0.6073955, -0.8968499, -2.389669, 1, 0, 0, 1, 1,
-0.6009274, -0.00613548, -0.3095286, 1, 0, 0, 1, 1,
-0.5995995, 0.4381234, -0.5526209, 1, 0, 0, 1, 1,
-0.5948303, -1.122397, -2.942699, 0, 0, 0, 1, 1,
-0.5912249, 0.5741098, -0.7555988, 0, 0, 0, 1, 1,
-0.591198, 1.107901, 1.459498, 0, 0, 0, 1, 1,
-0.576264, -2.384485, -0.9308737, 0, 0, 0, 1, 1,
-0.5761833, -0.5505628, -1.305116, 0, 0, 0, 1, 1,
-0.5736794, -0.5891848, -2.057456, 0, 0, 0, 1, 1,
-0.5732399, -0.5013121, -1.128585, 0, 0, 0, 1, 1,
-0.5696692, 0.2083258, -1.832858, 1, 1, 1, 1, 1,
-0.5681213, 0.7856415, -1.865288, 1, 1, 1, 1, 1,
-0.5651123, -1.051565, -2.571787, 1, 1, 1, 1, 1,
-0.5640129, -0.2577935, -2.367758, 1, 1, 1, 1, 1,
-0.5621136, 1.38521, 0.4769369, 1, 1, 1, 1, 1,
-0.5614825, -0.7818897, -1.618572, 1, 1, 1, 1, 1,
-0.5594656, -0.7851812, -2.976112, 1, 1, 1, 1, 1,
-0.5562751, 0.3470254, -0.8665957, 1, 1, 1, 1, 1,
-0.551834, 0.09308717, -0.08108524, 1, 1, 1, 1, 1,
-0.5497342, -0.2320644, -2.794373, 1, 1, 1, 1, 1,
-0.5440106, -0.5639813, -3.401436, 1, 1, 1, 1, 1,
-0.542674, -0.3602411, -1.64296, 1, 1, 1, 1, 1,
-0.5423306, -0.8286291, -3.469892, 1, 1, 1, 1, 1,
-0.5413264, 0.518086, -1.021097, 1, 1, 1, 1, 1,
-0.5391061, 1.220091, -0.5552503, 1, 1, 1, 1, 1,
-0.5375572, 1.166814, 1.049168, 0, 0, 1, 1, 1,
-0.5321203, -1.656126, -0.2799444, 1, 0, 0, 1, 1,
-0.5279943, 0.08447823, -1.797953, 1, 0, 0, 1, 1,
-0.5235014, 0.9239575, -0.09975876, 1, 0, 0, 1, 1,
-0.5219203, -0.9001865, -0.9640663, 1, 0, 0, 1, 1,
-0.520394, -0.271831, -3.544402, 1, 0, 0, 1, 1,
-0.5163458, 1.297917, -0.4446624, 0, 0, 0, 1, 1,
-0.5159157, -0.1250229, 0.54129, 0, 0, 0, 1, 1,
-0.5127059, -0.4839652, -3.086304, 0, 0, 0, 1, 1,
-0.5120113, 0.7014953, -0.6073104, 0, 0, 0, 1, 1,
-0.5119499, -0.08053017, -2.695615, 0, 0, 0, 1, 1,
-0.5116118, 1.065451, 1.000421, 0, 0, 0, 1, 1,
-0.510485, 0.9548606, -0.07177807, 0, 0, 0, 1, 1,
-0.5097253, -1.631294, -1.109104, 1, 1, 1, 1, 1,
-0.5065491, 1.861509, -1.63472, 1, 1, 1, 1, 1,
-0.5048336, -0.5341883, -3.892992, 1, 1, 1, 1, 1,
-0.4985821, -0.8676405, -2.17782, 1, 1, 1, 1, 1,
-0.4982612, -0.498702, -0.860789, 1, 1, 1, 1, 1,
-0.4945303, -0.04952049, -1.657634, 1, 1, 1, 1, 1,
-0.4834235, 0.7118864, 1.744302, 1, 1, 1, 1, 1,
-0.479828, -0.5252359, -2.295597, 1, 1, 1, 1, 1,
-0.4790783, -0.04498791, -0.1255665, 1, 1, 1, 1, 1,
-0.4787183, -0.7125273, -1.152276, 1, 1, 1, 1, 1,
-0.4778155, -1.55322, -2.777534, 1, 1, 1, 1, 1,
-0.4766048, 0.3863839, 0.08907705, 1, 1, 1, 1, 1,
-0.476602, -1.970491, -4.390806, 1, 1, 1, 1, 1,
-0.473083, 0.4980977, -0.349153, 1, 1, 1, 1, 1,
-0.4720912, -2.314697, -3.976137, 1, 1, 1, 1, 1,
-0.4658685, 0.5577695, -0.8114841, 0, 0, 1, 1, 1,
-0.4625344, -0.5789645, -3.186846, 1, 0, 0, 1, 1,
-0.4594858, -0.2950935, -3.636377, 1, 0, 0, 1, 1,
-0.4586163, -1.609808, -2.974034, 1, 0, 0, 1, 1,
-0.4563474, 1.187779, -0.8652726, 1, 0, 0, 1, 1,
-0.4558065, 0.2889922, -0.4814465, 1, 0, 0, 1, 1,
-0.455797, 0.7594532, -1.289417, 0, 0, 0, 1, 1,
-0.4556065, 0.2758887, -0.3197388, 0, 0, 0, 1, 1,
-0.4553902, 0.9574955, -0.4100731, 0, 0, 0, 1, 1,
-0.4551404, 0.3082405, -1.187372, 0, 0, 0, 1, 1,
-0.445697, -0.5772853, -3.156325, 0, 0, 0, 1, 1,
-0.4454522, -0.3227627, -1.683358, 0, 0, 0, 1, 1,
-0.4445671, -2.216014, -4.335916, 0, 0, 0, 1, 1,
-0.4395175, -0.348739, -2.512924, 1, 1, 1, 1, 1,
-0.4378682, 0.1662833, -2.250365, 1, 1, 1, 1, 1,
-0.4372713, 0.9256497, -0.07582479, 1, 1, 1, 1, 1,
-0.4372128, -0.1974689, -3.663059, 1, 1, 1, 1, 1,
-0.4348357, -1.247085, -3.15736, 1, 1, 1, 1, 1,
-0.4280587, 0.5056565, 0.5008497, 1, 1, 1, 1, 1,
-0.4213879, -2.144886, -2.56562, 1, 1, 1, 1, 1,
-0.4180573, 0.5789893, -0.9818249, 1, 1, 1, 1, 1,
-0.4111471, 0.7438034, -0.1874907, 1, 1, 1, 1, 1,
-0.4083277, -2.651083, -0.6175433, 1, 1, 1, 1, 1,
-0.4044301, 0.9735818, -1.450475, 1, 1, 1, 1, 1,
-0.401695, 0.5273371, -0.3671116, 1, 1, 1, 1, 1,
-0.3997037, -0.2279307, -1.424096, 1, 1, 1, 1, 1,
-0.3984924, 0.2955244, -1.127585, 1, 1, 1, 1, 1,
-0.3983635, 0.2264165, -1.800267, 1, 1, 1, 1, 1,
-0.3982092, 0.7245124, -0.6671625, 0, 0, 1, 1, 1,
-0.3968523, -0.05041405, -2.747076, 1, 0, 0, 1, 1,
-0.3950482, 1.277656, -0.007479117, 1, 0, 0, 1, 1,
-0.3926227, -0.5053794, -2.100788, 1, 0, 0, 1, 1,
-0.3923017, 0.5151084, -0.9117442, 1, 0, 0, 1, 1,
-0.3911788, 0.9186122, 0.1136406, 1, 0, 0, 1, 1,
-0.3902882, -1.720958, -3.396839, 0, 0, 0, 1, 1,
-0.3884237, -0.1286654, -1.735564, 0, 0, 0, 1, 1,
-0.3817692, -1.275278, -3.951864, 0, 0, 0, 1, 1,
-0.3813401, 1.569889, 0.2662013, 0, 0, 0, 1, 1,
-0.3811868, 0.4734793, -1.460002, 0, 0, 0, 1, 1,
-0.3781278, 0.3291469, 0.01261533, 0, 0, 0, 1, 1,
-0.3760912, -0.03389964, -1.401547, 0, 0, 0, 1, 1,
-0.3742916, -0.7841634, -2.59943, 1, 1, 1, 1, 1,
-0.3682128, 0.04843363, -2.133075, 1, 1, 1, 1, 1,
-0.3667005, -0.4364527, -1.714979, 1, 1, 1, 1, 1,
-0.3660096, -0.2964627, -2.353457, 1, 1, 1, 1, 1,
-0.3650115, -0.3953603, -2.27521, 1, 1, 1, 1, 1,
-0.3631692, 0.4570475, -1.275708, 1, 1, 1, 1, 1,
-0.35781, -0.7532864, -2.74525, 1, 1, 1, 1, 1,
-0.3482868, -0.1279108, -2.972602, 1, 1, 1, 1, 1,
-0.345641, -0.7908341, -2.077791, 1, 1, 1, 1, 1,
-0.3427753, -0.1147062, -0.726954, 1, 1, 1, 1, 1,
-0.3422436, 0.4674672, -0.326852, 1, 1, 1, 1, 1,
-0.3413804, -1.625437, -3.104741, 1, 1, 1, 1, 1,
-0.3409833, 1.167427, 0.3923399, 1, 1, 1, 1, 1,
-0.3390567, -0.4554637, -1.409921, 1, 1, 1, 1, 1,
-0.3386526, -0.2171399, -2.141685, 1, 1, 1, 1, 1,
-0.3383892, 1.419015, -0.6353247, 0, 0, 1, 1, 1,
-0.3305607, -0.7157003, -1.580425, 1, 0, 0, 1, 1,
-0.3305061, 0.04590557, -2.878573, 1, 0, 0, 1, 1,
-0.3291174, 0.9672617, 0.1312852, 1, 0, 0, 1, 1,
-0.3287837, 0.4732946, -1.283697, 1, 0, 0, 1, 1,
-0.3249534, 0.5795397, -1.277241, 1, 0, 0, 1, 1,
-0.322079, -0.51084, -2.667442, 0, 0, 0, 1, 1,
-0.3217913, -1.151261, -2.250473, 0, 0, 0, 1, 1,
-0.3199066, 0.8665851, -0.7570922, 0, 0, 0, 1, 1,
-0.3146401, 1.371474, -1.684202, 0, 0, 0, 1, 1,
-0.3111622, 1.127568, 0.4465443, 0, 0, 0, 1, 1,
-0.3109082, 0.988853, -1.913188, 0, 0, 0, 1, 1,
-0.3090343, -0.1338409, 0.254876, 0, 0, 0, 1, 1,
-0.2975313, -0.06114133, -2.802184, 1, 1, 1, 1, 1,
-0.2941176, -0.03562808, -1.408444, 1, 1, 1, 1, 1,
-0.2940898, 0.7792337, -0.2752728, 1, 1, 1, 1, 1,
-0.2934304, -0.1012782, -1.709938, 1, 1, 1, 1, 1,
-0.2881913, -1.268819, -3.035064, 1, 1, 1, 1, 1,
-0.2862512, -1.51873, -1.044877, 1, 1, 1, 1, 1,
-0.2856144, -0.8068028, -3.759281, 1, 1, 1, 1, 1,
-0.285029, -0.9700372, -3.409636, 1, 1, 1, 1, 1,
-0.282234, -1.299567, -1.295618, 1, 1, 1, 1, 1,
-0.2813718, 0.9039862, -0.4852914, 1, 1, 1, 1, 1,
-0.276211, 1.074854, -0.3288474, 1, 1, 1, 1, 1,
-0.2760096, -0.8821956, -1.706172, 1, 1, 1, 1, 1,
-0.2739775, -0.7307543, -3.560472, 1, 1, 1, 1, 1,
-0.2733587, 1.110696, 1.213624, 1, 1, 1, 1, 1,
-0.2692323, 0.9001967, 0.1295257, 1, 1, 1, 1, 1,
-0.2623613, -0.7357303, -1.760286, 0, 0, 1, 1, 1,
-0.2609797, 1.054315, -0.2806707, 1, 0, 0, 1, 1,
-0.2609539, 2.093791, 1.183531, 1, 0, 0, 1, 1,
-0.2583895, -1.484466, -3.281285, 1, 0, 0, 1, 1,
-0.2536573, 1.228476, -0.6835179, 1, 0, 0, 1, 1,
-0.2534066, 1.596023, -2.127575, 1, 0, 0, 1, 1,
-0.2532456, -0.06910573, -0.9550222, 0, 0, 0, 1, 1,
-0.2530014, 1.447925, -1.351234, 0, 0, 0, 1, 1,
-0.2469517, 0.3542305, -0.7620676, 0, 0, 0, 1, 1,
-0.2460891, 1.213661, -2.7485, 0, 0, 0, 1, 1,
-0.2453975, -0.03755274, -1.918797, 0, 0, 0, 1, 1,
-0.2406174, 0.6102716, 0.2639701, 0, 0, 0, 1, 1,
-0.2392939, 2.208264, -1.33247, 0, 0, 0, 1, 1,
-0.2287421, 0.160876, -0.06400296, 1, 1, 1, 1, 1,
-0.2250913, -0.03305617, -1.147111, 1, 1, 1, 1, 1,
-0.2222508, -1.841379, -1.722358, 1, 1, 1, 1, 1,
-0.2205092, 0.5287293, 0.05468855, 1, 1, 1, 1, 1,
-0.2184519, 1.15561, -0.5759728, 1, 1, 1, 1, 1,
-0.2166169, 0.7416002, -1.910354, 1, 1, 1, 1, 1,
-0.2149281, -0.5575148, -2.712141, 1, 1, 1, 1, 1,
-0.2134525, 0.9897002, 1.36918, 1, 1, 1, 1, 1,
-0.211547, -1.761398, -4.717312, 1, 1, 1, 1, 1,
-0.2113498, -0.1906409, -1.781312, 1, 1, 1, 1, 1,
-0.2069786, -0.735195, -0.727002, 1, 1, 1, 1, 1,
-0.2003866, 0.04127163, 0.3080491, 1, 1, 1, 1, 1,
-0.1968018, 2.244941, 0.2225862, 1, 1, 1, 1, 1,
-0.1938402, -0.4890165, -2.262243, 1, 1, 1, 1, 1,
-0.1925562, -0.4444432, -3.099674, 1, 1, 1, 1, 1,
-0.1863431, 0.533994, 1.262389, 0, 0, 1, 1, 1,
-0.1838768, -0.1673919, -1.502751, 1, 0, 0, 1, 1,
-0.1826227, -1.648607, -3.962967, 1, 0, 0, 1, 1,
-0.176861, 0.8140969, 0.3847994, 1, 0, 0, 1, 1,
-0.1756298, -0.1928633, -3.390237, 1, 0, 0, 1, 1,
-0.1753608, -1.855687, -1.732463, 1, 0, 0, 1, 1,
-0.1635238, -1.08155, -2.467102, 0, 0, 0, 1, 1,
-0.1626419, -1.815102, -2.944435, 0, 0, 0, 1, 1,
-0.1580552, 0.5968525, 0.6577915, 0, 0, 0, 1, 1,
-0.1568809, 0.8766311, 1.392349, 0, 0, 0, 1, 1,
-0.1533339, -0.2676525, -2.802117, 0, 0, 0, 1, 1,
-0.1527805, -0.3409286, -1.781368, 0, 0, 0, 1, 1,
-0.1481605, 0.1402347, -1.75111, 0, 0, 0, 1, 1,
-0.1426453, -0.2919406, -2.377177, 1, 1, 1, 1, 1,
-0.1336429, -0.03835732, -2.975374, 1, 1, 1, 1, 1,
-0.1330845, -0.8457357, -3.105707, 1, 1, 1, 1, 1,
-0.1324302, -0.9283442, -2.292939, 1, 1, 1, 1, 1,
-0.1287778, 0.7366555, 0.3736241, 1, 1, 1, 1, 1,
-0.1284709, -1.554246, -3.745586, 1, 1, 1, 1, 1,
-0.1267598, -0.9276749, -3.951036, 1, 1, 1, 1, 1,
-0.1253952, -0.5569173, -2.773735, 1, 1, 1, 1, 1,
-0.1226179, 0.1004642, -0.2648821, 1, 1, 1, 1, 1,
-0.1195891, 0.5785332, 1.624124, 1, 1, 1, 1, 1,
-0.119503, -1.043649, -1.876499, 1, 1, 1, 1, 1,
-0.115192, -0.5545291, -3.81262, 1, 1, 1, 1, 1,
-0.1125095, 2.310133, -0.3043822, 1, 1, 1, 1, 1,
-0.1115899, 0.6491945, -0.9297385, 1, 1, 1, 1, 1,
-0.1057349, -1.2701, -2.540039, 1, 1, 1, 1, 1,
-0.102768, -0.2878717, -4.013701, 0, 0, 1, 1, 1,
-0.1020686, 0.7097216, 0.7743605, 1, 0, 0, 1, 1,
-0.1012008, -0.7711401, -3.112186, 1, 0, 0, 1, 1,
-0.09747847, 1.776746, -0.9584482, 1, 0, 0, 1, 1,
-0.0951145, 1.400275, -1.215677, 1, 0, 0, 1, 1,
-0.09434795, 0.3285713, -0.9831318, 1, 0, 0, 1, 1,
-0.09074249, -0.2787696, -5.182751, 0, 0, 0, 1, 1,
-0.08944061, 0.3500744, 0.3187445, 0, 0, 0, 1, 1,
-0.08923685, 0.1270838, -1.437133, 0, 0, 0, 1, 1,
-0.08180855, -0.2500271, -1.176217, 0, 0, 0, 1, 1,
-0.0802625, -0.6224589, -3.899598, 0, 0, 0, 1, 1,
-0.07758281, -0.4159148, -2.113917, 0, 0, 0, 1, 1,
-0.07727868, 0.5061069, -2.060513, 0, 0, 0, 1, 1,
-0.07392881, 1.531236, 0.3793531, 1, 1, 1, 1, 1,
-0.07268242, -0.5467978, -2.204173, 1, 1, 1, 1, 1,
-0.07010055, 0.894953, -0.1778305, 1, 1, 1, 1, 1,
-0.06637111, -2.895062, -3.281915, 1, 1, 1, 1, 1,
-0.06633655, 2.122988, -1.466067, 1, 1, 1, 1, 1,
-0.06472515, 0.9804598, 0.08741932, 1, 1, 1, 1, 1,
-0.0630664, -0.6086577, -1.487717, 1, 1, 1, 1, 1,
-0.05733429, 0.1065151, -1.217363, 1, 1, 1, 1, 1,
-0.05642194, -0.9301347, -2.427311, 1, 1, 1, 1, 1,
-0.05544432, 0.9737592, 0.1212298, 1, 1, 1, 1, 1,
-0.0538585, 0.62985, -2.378919, 1, 1, 1, 1, 1,
-0.05339013, 0.6227269, 0.1466418, 1, 1, 1, 1, 1,
-0.05324099, 0.3104767, -0.06000188, 1, 1, 1, 1, 1,
-0.04963458, -0.08509483, -2.459481, 1, 1, 1, 1, 1,
-0.04952401, -0.9727611, -1.732409, 1, 1, 1, 1, 1,
-0.04608386, -0.9011026, -3.591599, 0, 0, 1, 1, 1,
-0.04498703, -0.9533318, -2.815263, 1, 0, 0, 1, 1,
-0.04440887, 0.4987584, 1.249227, 1, 0, 0, 1, 1,
-0.04364472, 2.710778, -0.2563241, 1, 0, 0, 1, 1,
-0.0373945, -0.7633698, -2.720664, 1, 0, 0, 1, 1,
-0.03368517, -1.140364, -1.549345, 1, 0, 0, 1, 1,
-0.02554958, 1.485938, -0.1251683, 0, 0, 0, 1, 1,
-0.02080643, -1.924099, -2.797837, 0, 0, 0, 1, 1,
-0.02027136, -2.002067, -3.353469, 0, 0, 0, 1, 1,
-0.01851929, 0.2192953, -1.130067, 0, 0, 0, 1, 1,
-0.01650479, -0.4319491, -2.492313, 0, 0, 0, 1, 1,
-0.01625311, -0.4451948, -2.379179, 0, 0, 0, 1, 1,
-0.01210076, -0.4094265, -2.853436, 0, 0, 0, 1, 1,
-0.00600912, 0.2525143, 0.3354109, 1, 1, 1, 1, 1,
-0.003846196, 0.6785141, -0.7511112, 1, 1, 1, 1, 1,
-0.003430279, -1.681625, -3.165187, 1, 1, 1, 1, 1,
-0.001237146, 0.1383127, 2.059644, 1, 1, 1, 1, 1,
-0.0004589404, -0.7396931, -2.670455, 1, 1, 1, 1, 1,
-0.0001170122, 1.491159, 0.6952754, 1, 1, 1, 1, 1,
0.0006018802, 0.04499408, -0.3919365, 1, 1, 1, 1, 1,
0.008931043, -2.853526, 2.102585, 1, 1, 1, 1, 1,
0.01246667, -0.4551198, 2.117747, 1, 1, 1, 1, 1,
0.01495084, 2.452346, 1.075076, 1, 1, 1, 1, 1,
0.0158948, -2.040705, 4.691616, 1, 1, 1, 1, 1,
0.02372388, 0.4729018, -1.677423, 1, 1, 1, 1, 1,
0.02598269, 0.03120152, 1.376063, 1, 1, 1, 1, 1,
0.02714264, 1.192894, -1.239919, 1, 1, 1, 1, 1,
0.03512985, 0.5515034, -0.4399725, 1, 1, 1, 1, 1,
0.03655943, -0.8316359, 4.974898, 0, 0, 1, 1, 1,
0.04580676, 1.369489, 1.339762, 1, 0, 0, 1, 1,
0.04806147, -1.510911, 2.43183, 1, 0, 0, 1, 1,
0.05575723, 0.04528509, 1.916789, 1, 0, 0, 1, 1,
0.05672881, -0.1678131, 2.942635, 1, 0, 0, 1, 1,
0.06248293, -0.01829222, 1.769559, 1, 0, 0, 1, 1,
0.06270763, -0.296039, 3.951862, 0, 0, 0, 1, 1,
0.06332392, 0.3619078, -0.3356512, 0, 0, 0, 1, 1,
0.06851976, -0.7549759, 1.720863, 0, 0, 0, 1, 1,
0.06928742, 2.164821, -0.2995197, 0, 0, 0, 1, 1,
0.06973104, -0.2749025, 3.784879, 0, 0, 0, 1, 1,
0.07748086, -0.4506923, 3.195972, 0, 0, 0, 1, 1,
0.07786749, 1.33391, -0.133035, 0, 0, 0, 1, 1,
0.07977067, -0.4763275, 2.794039, 1, 1, 1, 1, 1,
0.08093428, -1.708307, 4.481059, 1, 1, 1, 1, 1,
0.0816106, -1.99957, 1.807176, 1, 1, 1, 1, 1,
0.08371726, -1.037426, 0.1754619, 1, 1, 1, 1, 1,
0.08619779, 0.589358, 1.050901, 1, 1, 1, 1, 1,
0.08707055, 2.5394, 1.223804, 1, 1, 1, 1, 1,
0.08744007, -0.4382236, 3.64023, 1, 1, 1, 1, 1,
0.08816493, -0.6822538, 3.513845, 1, 1, 1, 1, 1,
0.08852948, 1.623584, -0.4170235, 1, 1, 1, 1, 1,
0.08888812, -0.4434732, 4.869081, 1, 1, 1, 1, 1,
0.08927439, -0.4084306, 0.9502798, 1, 1, 1, 1, 1,
0.09056647, 0.4344848, -0.2655208, 1, 1, 1, 1, 1,
0.0906405, 0.3373991, 1.41744, 1, 1, 1, 1, 1,
0.09732839, -0.6165947, 2.872922, 1, 1, 1, 1, 1,
0.09802356, -0.786735, 1.610104, 1, 1, 1, 1, 1,
0.09809098, 0.008366123, 1.550698, 0, 0, 1, 1, 1,
0.1000938, -1.392559, 4.364849, 1, 0, 0, 1, 1,
0.1015049, 2.043729, 0.094814, 1, 0, 0, 1, 1,
0.1056271, 0.228074, 0.1604946, 1, 0, 0, 1, 1,
0.1058317, -1.168621, 1.067607, 1, 0, 0, 1, 1,
0.1062116, 0.4201307, 1.217601, 1, 0, 0, 1, 1,
0.1078279, -0.5007132, 5.490983, 0, 0, 0, 1, 1,
0.1091929, -2.217992, 2.566163, 0, 0, 0, 1, 1,
0.1102768, 0.415579, -0.7396637, 0, 0, 0, 1, 1,
0.1119839, -0.2685296, 3.329633, 0, 0, 0, 1, 1,
0.1202855, 1.102597, 1.06429, 0, 0, 0, 1, 1,
0.120525, 0.3991275, 0.5981697, 0, 0, 0, 1, 1,
0.1273189, -0.6022155, 3.7862, 0, 0, 0, 1, 1,
0.1277852, 1.309804, 2.808578, 1, 1, 1, 1, 1,
0.1337876, -2.165561, 2.610129, 1, 1, 1, 1, 1,
0.1361036, -0.4145569, 4.971658, 1, 1, 1, 1, 1,
0.1413363, 0.9610421, -1.389786, 1, 1, 1, 1, 1,
0.1485833, 0.9840477, -0.09936611, 1, 1, 1, 1, 1,
0.156921, -0.6405565, 3.219154, 1, 1, 1, 1, 1,
0.1580891, -0.1702601, 3.689458, 1, 1, 1, 1, 1,
0.1587324, 0.9661762, 0.1784651, 1, 1, 1, 1, 1,
0.1636945, -2.116933, 3.636725, 1, 1, 1, 1, 1,
0.1711651, 0.697886, -1.544181, 1, 1, 1, 1, 1,
0.1755351, 1.478756, 1.292421, 1, 1, 1, 1, 1,
0.1823631, 0.1744557, 0.104621, 1, 1, 1, 1, 1,
0.1860861, -1.152919, 3.75097, 1, 1, 1, 1, 1,
0.1886425, -0.08034256, 3.228098, 1, 1, 1, 1, 1,
0.1913599, 0.03632206, 1.156116, 1, 1, 1, 1, 1,
0.1925995, -0.2041545, 1.472822, 0, 0, 1, 1, 1,
0.1974651, -1.469416, 3.824457, 1, 0, 0, 1, 1,
0.19902, 0.06088693, 0.6902276, 1, 0, 0, 1, 1,
0.1995962, -0.839403, 2.873437, 1, 0, 0, 1, 1,
0.2023307, 1.611282, 0.5005206, 1, 0, 0, 1, 1,
0.2038714, -0.1793477, 4.573002, 1, 0, 0, 1, 1,
0.2039988, 0.6683283, 0.1106061, 0, 0, 0, 1, 1,
0.205272, 1.57505, -0.9896463, 0, 0, 0, 1, 1,
0.2062585, 0.7337689, 1.015487, 0, 0, 0, 1, 1,
0.20765, -0.05476945, 0.5805007, 0, 0, 0, 1, 1,
0.2104511, -0.2895652, 4.111461, 0, 0, 0, 1, 1,
0.2123511, -0.9679146, 1.601823, 0, 0, 0, 1, 1,
0.2210184, 2.167604, -0.2489072, 0, 0, 0, 1, 1,
0.2238679, -0.1778392, 0.6605728, 1, 1, 1, 1, 1,
0.2246137, 0.1180102, 1.880453, 1, 1, 1, 1, 1,
0.2246607, 0.2019396, 0.546814, 1, 1, 1, 1, 1,
0.2253151, -1.635169, 4.210148, 1, 1, 1, 1, 1,
0.2260113, 0.6439471, 0.8110592, 1, 1, 1, 1, 1,
0.2294388, -0.2428951, 3.205041, 1, 1, 1, 1, 1,
0.2312927, -0.1741713, 3.719216, 1, 1, 1, 1, 1,
0.2318533, -1.910727, 2.712652, 1, 1, 1, 1, 1,
0.2403811, -1.040961, 3.339193, 1, 1, 1, 1, 1,
0.2448308, 0.03180365, 1.234936, 1, 1, 1, 1, 1,
0.2462889, -0.4773283, 3.552521, 1, 1, 1, 1, 1,
0.2505535, 0.3576983, 1.430775, 1, 1, 1, 1, 1,
0.2523661, 0.559168, 0.8872553, 1, 1, 1, 1, 1,
0.2536928, -0.7494298, 3.353343, 1, 1, 1, 1, 1,
0.25719, 1.005695, 0.128685, 1, 1, 1, 1, 1,
0.2583773, 0.1188268, 2.055315, 0, 0, 1, 1, 1,
0.2636878, -0.3428567, 2.052212, 1, 0, 0, 1, 1,
0.2689006, -0.9459344, 3.289341, 1, 0, 0, 1, 1,
0.2693316, 1.883888, 0.4044712, 1, 0, 0, 1, 1,
0.2695842, 0.3205564, 2.89832, 1, 0, 0, 1, 1,
0.2786045, -2.453592, 2.748771, 1, 0, 0, 1, 1,
0.2815076, -1.527544, 3.206884, 0, 0, 0, 1, 1,
0.283562, 2.508324, -0.4479994, 0, 0, 0, 1, 1,
0.2842808, 0.365983, 1.588107, 0, 0, 0, 1, 1,
0.2881995, -0.8918672, 3.855108, 0, 0, 0, 1, 1,
0.290804, -0.08063035, 0.1967466, 0, 0, 0, 1, 1,
0.3015873, -0.2792587, 4.144712, 0, 0, 0, 1, 1,
0.3044259, 0.884635, -1.402248, 0, 0, 0, 1, 1,
0.3089537, -1.134944, 1.627676, 1, 1, 1, 1, 1,
0.3129781, -0.6267845, 2.791888, 1, 1, 1, 1, 1,
0.3131024, -0.1324492, 3.065271, 1, 1, 1, 1, 1,
0.3202576, -0.4829744, 3.692573, 1, 1, 1, 1, 1,
0.3224049, 0.9227146, 1.103402, 1, 1, 1, 1, 1,
0.323245, 0.5908267, 0.2485509, 1, 1, 1, 1, 1,
0.3233839, 1.068914, -0.1401054, 1, 1, 1, 1, 1,
0.3254309, -0.4281659, 0.5894698, 1, 1, 1, 1, 1,
0.3265959, -1.014376, 3.085858, 1, 1, 1, 1, 1,
0.3268998, 0.3629405, 0.7029964, 1, 1, 1, 1, 1,
0.3273268, 0.9582558, -1.497036, 1, 1, 1, 1, 1,
0.329418, -0.1575616, 1.470415, 1, 1, 1, 1, 1,
0.3338406, 0.1915817, -0.8338029, 1, 1, 1, 1, 1,
0.3353106, 0.5719868, -0.4097418, 1, 1, 1, 1, 1,
0.340545, -0.6625929, 2.553618, 1, 1, 1, 1, 1,
0.3434633, -0.6227193, 2.277898, 0, 0, 1, 1, 1,
0.3483875, -2.079771, 2.971982, 1, 0, 0, 1, 1,
0.3556545, -0.6001725, 4.199594, 1, 0, 0, 1, 1,
0.3594409, 0.2226503, 1.954238, 1, 0, 0, 1, 1,
0.362582, 0.9221772, 1.817012, 1, 0, 0, 1, 1,
0.3632823, 1.354285, -0.7835033, 1, 0, 0, 1, 1,
0.3646214, 2.280265, 1.816834, 0, 0, 0, 1, 1,
0.3647358, -1.40001, 3.761878, 0, 0, 0, 1, 1,
0.3683872, -0.7142397, 1.976151, 0, 0, 0, 1, 1,
0.3731183, 0.2750049, 1.089952, 0, 0, 0, 1, 1,
0.3739205, 2.523141, 0.389924, 0, 0, 0, 1, 1,
0.3753642, 2.873703, 3.366293, 0, 0, 0, 1, 1,
0.3770038, -0.1648449, 1.370243, 0, 0, 0, 1, 1,
0.3793518, -2.175756, 4.023488, 1, 1, 1, 1, 1,
0.3796807, -0.6607525, 3.62574, 1, 1, 1, 1, 1,
0.3801582, 0.77358, -0.0919955, 1, 1, 1, 1, 1,
0.3870433, 0.2404272, 1.667324, 1, 1, 1, 1, 1,
0.3875436, 0.8397242, 0.1842994, 1, 1, 1, 1, 1,
0.3898627, 0.3597305, 0.6368283, 1, 1, 1, 1, 1,
0.4051484, 1.437892, -0.7131041, 1, 1, 1, 1, 1,
0.4193983, 1.465222, -0.2972229, 1, 1, 1, 1, 1,
0.4291485, -1.637386, 2.861344, 1, 1, 1, 1, 1,
0.429284, 1.299761, -0.1011665, 1, 1, 1, 1, 1,
0.4322579, -0.5362371, 1.598102, 1, 1, 1, 1, 1,
0.4324605, -0.4298426, 2.421566, 1, 1, 1, 1, 1,
0.435308, 0.2889839, -0.307699, 1, 1, 1, 1, 1,
0.435831, -0.04452941, 1.451379, 1, 1, 1, 1, 1,
0.4363192, 2.56092, -0.5376239, 1, 1, 1, 1, 1,
0.4381631, -0.5885682, 2.336331, 0, 0, 1, 1, 1,
0.440448, -1.893701, 4.669541, 1, 0, 0, 1, 1,
0.4427428, -0.1278414, 0.8984796, 1, 0, 0, 1, 1,
0.4453319, -0.4468584, 3.053793, 1, 0, 0, 1, 1,
0.446835, -0.606476, 3.717874, 1, 0, 0, 1, 1,
0.4508525, -0.5978671, 2.288048, 1, 0, 0, 1, 1,
0.4534682, -1.726743, 4.533907, 0, 0, 0, 1, 1,
0.4608824, -1.327891, 2.274423, 0, 0, 0, 1, 1,
0.4623969, -0.02881976, 1.85184, 0, 0, 0, 1, 1,
0.4667063, 0.9962906, -0.803093, 0, 0, 0, 1, 1,
0.467442, 1.927919, -0.1562537, 0, 0, 0, 1, 1,
0.4701542, 0.8843338, -0.3635521, 0, 0, 0, 1, 1,
0.4726401, -1.758498, 3.453958, 0, 0, 0, 1, 1,
0.4742195, -1.271283, 3.626647, 1, 1, 1, 1, 1,
0.4744842, -1.136404, 3.204844, 1, 1, 1, 1, 1,
0.4758178, 1.035212, 0.6837553, 1, 1, 1, 1, 1,
0.47813, -0.06195989, 3.06026, 1, 1, 1, 1, 1,
0.4790106, -0.5053696, 3.744321, 1, 1, 1, 1, 1,
0.4791779, 0.1776708, 0.1227782, 1, 1, 1, 1, 1,
0.4796951, 0.4506593, 1.146301, 1, 1, 1, 1, 1,
0.4929143, -0.3635711, 2.017841, 1, 1, 1, 1, 1,
0.4935283, -0.1855413, 0.3002123, 1, 1, 1, 1, 1,
0.4938889, -0.5181298, 1.76444, 1, 1, 1, 1, 1,
0.4957475, -0.7095707, 3.72136, 1, 1, 1, 1, 1,
0.5016685, -0.5395743, 3.143861, 1, 1, 1, 1, 1,
0.5045215, 0.02158327, 1.438648, 1, 1, 1, 1, 1,
0.5049073, 0.8251052, 0.8620353, 1, 1, 1, 1, 1,
0.5061882, 1.594126, -0.4270698, 1, 1, 1, 1, 1,
0.5088215, -0.7403098, 1.803742, 0, 0, 1, 1, 1,
0.5096923, -1.606799, 4.099868, 1, 0, 0, 1, 1,
0.5106655, -1.813244, 3.096691, 1, 0, 0, 1, 1,
0.5120196, -0.9018853, 3.584756, 1, 0, 0, 1, 1,
0.5142362, -0.5473191, 2.877225, 1, 0, 0, 1, 1,
0.5179555, 0.9041398, 1.423008, 1, 0, 0, 1, 1,
0.5190434, -0.07268862, 0.9226776, 0, 0, 0, 1, 1,
0.5253907, 1.151198, 0.9133635, 0, 0, 0, 1, 1,
0.5284302, 0.1958158, -0.1729856, 0, 0, 0, 1, 1,
0.5287786, 0.6038151, -1.00947, 0, 0, 0, 1, 1,
0.5300142, -1.378886, 1.610583, 0, 0, 0, 1, 1,
0.5408129, 0.534902, -0.0486223, 0, 0, 0, 1, 1,
0.5425986, -0.3161814, 3.460194, 0, 0, 0, 1, 1,
0.546577, 1.189139, 1.180105, 1, 1, 1, 1, 1,
0.5469204, 0.06658783, 0.7178093, 1, 1, 1, 1, 1,
0.5474569, -0.209796, 3.432837, 1, 1, 1, 1, 1,
0.5492188, -0.2268732, 1.802283, 1, 1, 1, 1, 1,
0.5525441, 0.3443435, 1.074862, 1, 1, 1, 1, 1,
0.5535836, 1.726417, 0.02128712, 1, 1, 1, 1, 1,
0.5558857, -1.211492, 2.856538, 1, 1, 1, 1, 1,
0.5570451, 0.4267724, 0.5551834, 1, 1, 1, 1, 1,
0.5601806, -0.5559201, 2.776792, 1, 1, 1, 1, 1,
0.5602276, 0.6048035, 0.2696814, 1, 1, 1, 1, 1,
0.5606458, -0.09639754, 3.723638, 1, 1, 1, 1, 1,
0.5616398, 1.485276, 0.05989996, 1, 1, 1, 1, 1,
0.5621429, 0.4646239, 2.066975, 1, 1, 1, 1, 1,
0.5672063, 0.4996326, 0.4782976, 1, 1, 1, 1, 1,
0.581908, -1.244857, 3.021963, 1, 1, 1, 1, 1,
0.5822733, 0.07244138, 1.127614, 0, 0, 1, 1, 1,
0.5841349, -0.2365987, 4.045671, 1, 0, 0, 1, 1,
0.5868298, -0.7987189, 1.964828, 1, 0, 0, 1, 1,
0.5898539, -0.9657173, 1.979118, 1, 0, 0, 1, 1,
0.5913252, 1.032686, 1.092096, 1, 0, 0, 1, 1,
0.593136, -0.0697333, 2.544635, 1, 0, 0, 1, 1,
0.6021674, 1.397143, -1.154985, 0, 0, 0, 1, 1,
0.6050631, -1.825603, 2.554366, 0, 0, 0, 1, 1,
0.6084155, -0.6336767, 1.632652, 0, 0, 0, 1, 1,
0.6102739, 1.247064, 0.2792425, 0, 0, 0, 1, 1,
0.6105433, -0.4874844, 1.492753, 0, 0, 0, 1, 1,
0.61431, 1.428061, -1.548412, 0, 0, 0, 1, 1,
0.6164192, -1.209034, 2.442677, 0, 0, 0, 1, 1,
0.6164912, -0.0005137888, 0.9962249, 1, 1, 1, 1, 1,
0.6197223, 1.232825, -0.3072351, 1, 1, 1, 1, 1,
0.6200817, 0.1322585, 1.839643, 1, 1, 1, 1, 1,
0.6212178, 0.4710558, 2.304061, 1, 1, 1, 1, 1,
0.622549, 0.4091462, 0.8754691, 1, 1, 1, 1, 1,
0.6267587, -1.211113, 2.880594, 1, 1, 1, 1, 1,
0.6376366, 0.08857895, 2.079375, 1, 1, 1, 1, 1,
0.6393202, -1.179429, -1.072503, 1, 1, 1, 1, 1,
0.6400624, -0.9791417, 5.055338, 1, 1, 1, 1, 1,
0.6463302, 0.7359099, 0.7440018, 1, 1, 1, 1, 1,
0.6486977, 0.4835259, 0.4594529, 1, 1, 1, 1, 1,
0.652646, -0.2752514, 2.85613, 1, 1, 1, 1, 1,
0.6602399, 1.0289, 1.351686, 1, 1, 1, 1, 1,
0.6610547, -0.9684926, 2.365207, 1, 1, 1, 1, 1,
0.6660942, 0.01712178, 2.361295, 1, 1, 1, 1, 1,
0.6713002, 1.190284, -0.2867732, 0, 0, 1, 1, 1,
0.6771843, -2.3557, 1.935308, 1, 0, 0, 1, 1,
0.6844153, -1.904497, 2.423226, 1, 0, 0, 1, 1,
0.6869214, 1.29162, 0.327218, 1, 0, 0, 1, 1,
0.6884731, 0.6348712, 0.07628782, 1, 0, 0, 1, 1,
0.6893756, -0.4786228, 2.993474, 1, 0, 0, 1, 1,
0.6928726, 1.181268, -0.7586603, 0, 0, 0, 1, 1,
0.6952303, 0.9975843, 0.3419611, 0, 0, 0, 1, 1,
0.6971834, 0.946525, 0.9100499, 0, 0, 0, 1, 1,
0.6977541, -0.03787693, -0.4444804, 0, 0, 0, 1, 1,
0.6992558, -0.1966206, 1.243676, 0, 0, 0, 1, 1,
0.6995715, 0.3218664, 0.7915255, 0, 0, 0, 1, 1,
0.7020587, 0.1037868, 3.005719, 0, 0, 0, 1, 1,
0.7052988, -1.197491, 3.447241, 1, 1, 1, 1, 1,
0.7088966, 0.4019423, -0.03828767, 1, 1, 1, 1, 1,
0.7104513, 0.3249336, 1.566148, 1, 1, 1, 1, 1,
0.7151157, -0.552272, 3.251507, 1, 1, 1, 1, 1,
0.7188844, 0.1562358, 1.231728, 1, 1, 1, 1, 1,
0.7190195, -0.5321258, 0.8219359, 1, 1, 1, 1, 1,
0.7232301, 1.231742, -0.2801189, 1, 1, 1, 1, 1,
0.7251526, -0.2165623, 1.614997, 1, 1, 1, 1, 1,
0.7273052, 0.187518, 0.3143959, 1, 1, 1, 1, 1,
0.7282283, 0.7619517, 1.671937, 1, 1, 1, 1, 1,
0.7308111, -0.9021001, 2.621136, 1, 1, 1, 1, 1,
0.7390488, -0.7693074, 2.506458, 1, 1, 1, 1, 1,
0.7403948, -1.521339, 4.403398, 1, 1, 1, 1, 1,
0.7419657, 0.05135421, 1.276005, 1, 1, 1, 1, 1,
0.7432494, -0.514695, 1.134994, 1, 1, 1, 1, 1,
0.7453601, 0.6330019, 0.886044, 0, 0, 1, 1, 1,
0.7456584, -0.5868092, 1.977397, 1, 0, 0, 1, 1,
0.7465703, 0.4316943, 1.32147, 1, 0, 0, 1, 1,
0.7477677, 0.4321118, 0.5174126, 1, 0, 0, 1, 1,
0.7480329, 1.267284, 0.1530505, 1, 0, 0, 1, 1,
0.7570247, 1.103185, 0.3198924, 1, 0, 0, 1, 1,
0.7575801, 0.5682407, 3.178915, 0, 0, 0, 1, 1,
0.7576082, 0.62281, -0.5185292, 0, 0, 0, 1, 1,
0.7591733, -0.6453967, 1.633014, 0, 0, 0, 1, 1,
0.7687166, 0.6085448, 0.5899089, 0, 0, 0, 1, 1,
0.7893838, -1.461995, 2.581386, 0, 0, 0, 1, 1,
0.7947716, -0.425073, 3.560595, 0, 0, 0, 1, 1,
0.7950733, 1.310033, 0.8401293, 0, 0, 0, 1, 1,
0.796192, -0.2784026, 1.109231, 1, 1, 1, 1, 1,
0.7998216, 0.8442468, 1.252416, 1, 1, 1, 1, 1,
0.8035223, -1.330395, 2.811703, 1, 1, 1, 1, 1,
0.8046261, 1.92376, 1.429033, 1, 1, 1, 1, 1,
0.8093546, 0.06210843, 2.158922, 1, 1, 1, 1, 1,
0.8106855, -0.3318508, 3.095634, 1, 1, 1, 1, 1,
0.8221012, -0.5257664, 3.196382, 1, 1, 1, 1, 1,
0.8230889, -1.643414, 0.04059904, 1, 1, 1, 1, 1,
0.8233808, -0.7150717, 1.886662, 1, 1, 1, 1, 1,
0.8289303, 0.06727388, 2.354418, 1, 1, 1, 1, 1,
0.8329187, 1.524929, 1.706631, 1, 1, 1, 1, 1,
0.8361448, -1.081618, 3.915258, 1, 1, 1, 1, 1,
0.8401549, 1.118634, 0.1754516, 1, 1, 1, 1, 1,
0.8425635, -0.3571537, 2.210898, 1, 1, 1, 1, 1,
0.8559013, -0.8178596, 3.034641, 1, 1, 1, 1, 1,
0.8570318, -0.4265421, 3.006521, 0, 0, 1, 1, 1,
0.8590085, -0.128731, 3.070735, 1, 0, 0, 1, 1,
0.8647304, -0.1980101, 3.297386, 1, 0, 0, 1, 1,
0.8651452, 0.1089465, 2.812135, 1, 0, 0, 1, 1,
0.8668613, -1.266507, 2.456883, 1, 0, 0, 1, 1,
0.8698679, 0.9251255, -0.2069663, 1, 0, 0, 1, 1,
0.8704185, 0.02534308, 0.9562451, 0, 0, 0, 1, 1,
0.8708618, 1.553148, 2.601966, 0, 0, 0, 1, 1,
0.8723428, -0.04358813, 2.789512, 0, 0, 0, 1, 1,
0.8740991, 0.6514671, 2.522676, 0, 0, 0, 1, 1,
0.8756494, -0.6228905, 2.208649, 0, 0, 0, 1, 1,
0.8768265, -1.641319, 1.521483, 0, 0, 0, 1, 1,
0.8829142, -1.483129, 2.091643, 0, 0, 0, 1, 1,
0.8844089, -0.06935412, 1.786033, 1, 1, 1, 1, 1,
0.8854495, 0.3219155, 2.388439, 1, 1, 1, 1, 1,
0.8953928, -0.6335321, 3.355875, 1, 1, 1, 1, 1,
0.896407, 0.8373736, 0.6600906, 1, 1, 1, 1, 1,
0.9020145, 1.152568, -0.1288401, 1, 1, 1, 1, 1,
0.9021013, 0.7488482, 0.5682865, 1, 1, 1, 1, 1,
0.9031359, 0.6696678, 0.7986161, 1, 1, 1, 1, 1,
0.9123412, 0.4053182, 2.848562, 1, 1, 1, 1, 1,
0.9169962, -1.323122, 3.030163, 1, 1, 1, 1, 1,
0.9229568, -0.3747572, 4.076198, 1, 1, 1, 1, 1,
0.9265131, -0.6798757, 2.213325, 1, 1, 1, 1, 1,
0.9280562, -0.7738311, 3.643687, 1, 1, 1, 1, 1,
0.9313137, 1.028163, 0.270395, 1, 1, 1, 1, 1,
0.9315539, -0.260414, 3.241549, 1, 1, 1, 1, 1,
0.9326037, -0.8023698, 4.2994, 1, 1, 1, 1, 1,
0.9333119, -0.8548707, 4.237845, 0, 0, 1, 1, 1,
0.935406, -2.518854, 3.063202, 1, 0, 0, 1, 1,
0.9360768, -0.6615251, 3.022941, 1, 0, 0, 1, 1,
0.9451918, -0.2061481, 1.363305, 1, 0, 0, 1, 1,
0.9459106, -1.107084, 4.227718, 1, 0, 0, 1, 1,
0.9486226, -1.671929, 3.821896, 1, 0, 0, 1, 1,
0.9536006, 1.143339, 0.6549226, 0, 0, 0, 1, 1,
0.9588938, 1.212998, 0.3930035, 0, 0, 0, 1, 1,
0.9595697, -1.786846, 2.949647, 0, 0, 0, 1, 1,
0.9665536, -1.273338, 3.12203, 0, 0, 0, 1, 1,
0.9671034, -0.5878782, 2.87059, 0, 0, 0, 1, 1,
0.9739107, 1.141106, -0.570825, 0, 0, 0, 1, 1,
0.9779955, 0.3504657, 0.5560554, 0, 0, 0, 1, 1,
0.9822224, 0.1180561, 1.162268, 1, 1, 1, 1, 1,
0.9863627, -0.09887391, 1.717698, 1, 1, 1, 1, 1,
0.9989169, -2.524392, 3.097906, 1, 1, 1, 1, 1,
1.004341, 0.5036006, 0.8941721, 1, 1, 1, 1, 1,
1.009821, -1.020677, 2.897647, 1, 1, 1, 1, 1,
1.015683, -0.371438, -0.4354396, 1, 1, 1, 1, 1,
1.016754, -0.7215782, 3.996816, 1, 1, 1, 1, 1,
1.020547, -0.662496, 2.969579, 1, 1, 1, 1, 1,
1.021253, -1.472589, 2.246034, 1, 1, 1, 1, 1,
1.03218, -0.4834373, 1.06205, 1, 1, 1, 1, 1,
1.035341, -0.6599805, 1.403561, 1, 1, 1, 1, 1,
1.03958, 1.654347, 1.278249, 1, 1, 1, 1, 1,
1.052251, -0.7841455, 0.3545667, 1, 1, 1, 1, 1,
1.054211, 0.2577063, 1.469896, 1, 1, 1, 1, 1,
1.056532, 0.5755614, 1.939907, 1, 1, 1, 1, 1,
1.063202, 0.08265578, 1.328275, 0, 0, 1, 1, 1,
1.070317, 0.7113367, -0.9279011, 1, 0, 0, 1, 1,
1.07651, -0.9752277, 2.149632, 1, 0, 0, 1, 1,
1.083139, 0.3519014, 2.371687, 1, 0, 0, 1, 1,
1.088151, -1.094057, 3.108691, 1, 0, 0, 1, 1,
1.090393, 0.2830842, 1.763349, 1, 0, 0, 1, 1,
1.0999, 0.5437173, 1.383193, 0, 0, 0, 1, 1,
1.110767, 0.8683265, -0.7678676, 0, 0, 0, 1, 1,
1.11867, -0.931945, 1.546866, 0, 0, 0, 1, 1,
1.118909, -0.03224041, 0.6756071, 0, 0, 0, 1, 1,
1.125144, -2.575869, 1.075729, 0, 0, 0, 1, 1,
1.138836, -0.2447769, 1.33378, 0, 0, 0, 1, 1,
1.140454, 0.6823695, 0.3127473, 0, 0, 0, 1, 1,
1.143, 0.8116893, 2.167747, 1, 1, 1, 1, 1,
1.148111, 0.4337512, 2.038646, 1, 1, 1, 1, 1,
1.156714, -1.043408, 1.172174, 1, 1, 1, 1, 1,
1.159015, 0.6539481, 0.7348965, 1, 1, 1, 1, 1,
1.159684, 0.4136339, 1.329607, 1, 1, 1, 1, 1,
1.169247, 0.5371767, 2.700467, 1, 1, 1, 1, 1,
1.184096, -0.3655843, 2.294228, 1, 1, 1, 1, 1,
1.185071, 0.4748681, 2.843742, 1, 1, 1, 1, 1,
1.187797, 0.2908901, 0.3965944, 1, 1, 1, 1, 1,
1.188644, 1.073964, 1.872521, 1, 1, 1, 1, 1,
1.192749, -0.5605837, 0.640525, 1, 1, 1, 1, 1,
1.194827, -0.2588484, 1.757965, 1, 1, 1, 1, 1,
1.198606, -0.8853651, 4.006962, 1, 1, 1, 1, 1,
1.199074, -0.3292837, 2.086078, 1, 1, 1, 1, 1,
1.201891, -1.347882, 0.3954149, 1, 1, 1, 1, 1,
1.211482, -0.9639382, 2.099188, 0, 0, 1, 1, 1,
1.220414, 0.6575848, 2.616239, 1, 0, 0, 1, 1,
1.220886, -0.0903885, 1.107889, 1, 0, 0, 1, 1,
1.235141, 2.013145, 1.970832, 1, 0, 0, 1, 1,
1.240511, -0.2653483, 2.710779, 1, 0, 0, 1, 1,
1.241846, 0.4177547, 0.9472757, 1, 0, 0, 1, 1,
1.24775, -0.4623785, 1.528133, 0, 0, 0, 1, 1,
1.259585, -0.3443368, 3.46007, 0, 0, 0, 1, 1,
1.264257, -0.4995139, 2.08344, 0, 0, 0, 1, 1,
1.276222, -0.3026966, 1.669748, 0, 0, 0, 1, 1,
1.286046, -0.4514203, 0.954594, 0, 0, 0, 1, 1,
1.289152, -0.835332, 1.554304, 0, 0, 0, 1, 1,
1.289616, 0.4321281, 2.34114, 0, 0, 0, 1, 1,
1.291098, -0.09478662, 2.173743, 1, 1, 1, 1, 1,
1.293895, 1.349946, 1.500932, 1, 1, 1, 1, 1,
1.294271, 1.902487, -0.8282033, 1, 1, 1, 1, 1,
1.305912, 0.3527974, 0.2961075, 1, 1, 1, 1, 1,
1.307256, 0.8673723, 0.5108987, 1, 1, 1, 1, 1,
1.313631, 0.1119256, 3.72385, 1, 1, 1, 1, 1,
1.314653, 0.2091815, 0.696021, 1, 1, 1, 1, 1,
1.338122, 0.8860295, 1.36125, 1, 1, 1, 1, 1,
1.352677, 0.1051026, 1.431518, 1, 1, 1, 1, 1,
1.360582, -1.563719, 3.124278, 1, 1, 1, 1, 1,
1.360836, 1.245797, 1.9633, 1, 1, 1, 1, 1,
1.365751, -0.08295908, 1.897715, 1, 1, 1, 1, 1,
1.376233, -0.2706545, 3.28686, 1, 1, 1, 1, 1,
1.379288, -0.1987609, 3.380912, 1, 1, 1, 1, 1,
1.39792, -1.622707, 3.694693, 1, 1, 1, 1, 1,
1.39976, 1.311725, 2.132736, 0, 0, 1, 1, 1,
1.408771, -0.5703167, 2.793744, 1, 0, 0, 1, 1,
1.414395, 0.6902924, 1.407309, 1, 0, 0, 1, 1,
1.421253, 0.5201659, 1.133493, 1, 0, 0, 1, 1,
1.425531, 0.3311691, 1.430819, 1, 0, 0, 1, 1,
1.43084, -1.185139, 3.186937, 1, 0, 0, 1, 1,
1.433432, -1.44679, 1.358669, 0, 0, 0, 1, 1,
1.436779, 0.5250506, 1.715052, 0, 0, 0, 1, 1,
1.451218, -0.2925348, 1.472212, 0, 0, 0, 1, 1,
1.454423, 0.3293353, 3.332533, 0, 0, 0, 1, 1,
1.461872, -0.223799, 2.039647, 0, 0, 0, 1, 1,
1.469329, -2.327474, 2.128353, 0, 0, 0, 1, 1,
1.474375, 0.04348147, 3.104737, 0, 0, 0, 1, 1,
1.475566, 0.7753229, 1.187157, 1, 1, 1, 1, 1,
1.490323, 0.2293311, 0.9910308, 1, 1, 1, 1, 1,
1.504436, -1.425574, 4.452662, 1, 1, 1, 1, 1,
1.511553, -0.5657003, 2.526391, 1, 1, 1, 1, 1,
1.524959, 1.594543, 1.455246, 1, 1, 1, 1, 1,
1.540027, -0.1238851, 1.952645, 1, 1, 1, 1, 1,
1.548342, -0.7559226, 1.44275, 1, 1, 1, 1, 1,
1.549556, 2.634784, 0.9796218, 1, 1, 1, 1, 1,
1.560994, -1.909991, 1.594518, 1, 1, 1, 1, 1,
1.573038, -0.4496215, 1.396685, 1, 1, 1, 1, 1,
1.588528, -0.5978616, 4.358212, 1, 1, 1, 1, 1,
1.592719, -1.282684, 3.640683, 1, 1, 1, 1, 1,
1.596467, 2.034646, 0.1128261, 1, 1, 1, 1, 1,
1.618144, 1.279478, 1.125141, 1, 1, 1, 1, 1,
1.628977, -0.3859493, 1.287871, 1, 1, 1, 1, 1,
1.631094, -1.299174, -0.08105361, 0, 0, 1, 1, 1,
1.66065, -0.8354154, 1.659677, 1, 0, 0, 1, 1,
1.668073, 0.002129175, 1.686197, 1, 0, 0, 1, 1,
1.674625, 1.655432, 0.5892807, 1, 0, 0, 1, 1,
1.676174, 0.9870225, -0.0336279, 1, 0, 0, 1, 1,
1.730703, -0.2224232, 2.146329, 1, 0, 0, 1, 1,
1.753515, -0.08603238, 1.793111, 0, 0, 0, 1, 1,
1.773315, -1.281196, 3.26389, 0, 0, 0, 1, 1,
1.848925, 0.5570104, -0.20602, 0, 0, 0, 1, 1,
1.896733, -0.1304499, 2.291623, 0, 0, 0, 1, 1,
1.899405, -0.8406947, 2.959104, 0, 0, 0, 1, 1,
1.929504, 1.524715, -0.8173626, 0, 0, 0, 1, 1,
1.97096, 1.308712, 0.7945653, 0, 0, 0, 1, 1,
1.986115, 0.3377182, 1.673414, 1, 1, 1, 1, 1,
1.988291, 0.9758154, 4.518894, 1, 1, 1, 1, 1,
2.052583, 0.7478816, 0.7781474, 1, 1, 1, 1, 1,
2.066005, -0.8723032, 1.087791, 1, 1, 1, 1, 1,
2.087506, -1.210032, 1.782091, 1, 1, 1, 1, 1,
2.111445, 0.8167114, 1.257942, 1, 1, 1, 1, 1,
2.145057, 0.3224722, 1.594685, 1, 1, 1, 1, 1,
2.158791, -1.475276, 1.474834, 1, 1, 1, 1, 1,
2.15933, 0.9652134, 2.535151, 1, 1, 1, 1, 1,
2.1619, 0.8538122, 1.352683, 1, 1, 1, 1, 1,
2.171579, -0.7516168, 2.142191, 1, 1, 1, 1, 1,
2.201662, -1.215688, 1.307736, 1, 1, 1, 1, 1,
2.208072, -0.1766353, 1.455359, 1, 1, 1, 1, 1,
2.218582, 0.7142354, 1.303249, 1, 1, 1, 1, 1,
2.220352, 1.372323, 0.4427352, 1, 1, 1, 1, 1,
2.230328, -0.5272176, 2.039023, 0, 0, 1, 1, 1,
2.233073, 1.702622, 0.6095062, 1, 0, 0, 1, 1,
2.249963, 0.1451468, 2.225359, 1, 0, 0, 1, 1,
2.252727, -0.983556, 0.912609, 1, 0, 0, 1, 1,
2.299315, -0.7061549, -0.1016587, 1, 0, 0, 1, 1,
2.312962, 0.3044514, 3.057969, 1, 0, 0, 1, 1,
2.325383, 0.4810934, 2.279, 0, 0, 0, 1, 1,
2.356011, 1.667607, 0.847459, 0, 0, 0, 1, 1,
2.370433, 1.704298, 1.443213, 0, 0, 0, 1, 1,
2.389693, -0.7826009, 1.432368, 0, 0, 0, 1, 1,
2.390649, 0.7592593, 1.311187, 0, 0, 0, 1, 1,
2.412733, -0.1460443, 1.942136, 0, 0, 0, 1, 1,
2.52571, 1.819418, 0.4446093, 0, 0, 0, 1, 1,
2.649138, -2.098276, 2.457245, 1, 1, 1, 1, 1,
2.666677, -0.3057883, 2.246116, 1, 1, 1, 1, 1,
2.890436, -0.05031544, 2.490072, 1, 1, 1, 1, 1,
2.913263, 1.664602, 2.448779, 1, 1, 1, 1, 1,
3.170503, -0.2497101, 2.440513, 1, 1, 1, 1, 1,
3.37294, -0.07114217, 1.703467, 1, 1, 1, 1, 1,
3.384149, 0.6837248, 1.548057, 1, 1, 1, 1, 1
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
var radius = 9.510253;
var distance = 33.40436;
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
mvMatrix.translate( -0.1853743, -0.2234656, -0.1541164 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40436);
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
