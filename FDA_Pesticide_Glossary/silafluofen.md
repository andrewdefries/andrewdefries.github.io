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
-3.636892, -0.7220805, -1.60606, 1, 0, 0, 1,
-3.155021, 0.3592851, -1.869113, 1, 0.007843138, 0, 1,
-2.555199, 1.482918, -3.192739, 1, 0.01176471, 0, 1,
-2.481358, -0.1541145, -1.38039, 1, 0.01960784, 0, 1,
-2.468171, -0.6323061, -0.9055449, 1, 0.02352941, 0, 1,
-2.407527, -1.513769, -1.96718, 1, 0.03137255, 0, 1,
-2.357701, -0.740159, -2.293775, 1, 0.03529412, 0, 1,
-2.29354, -1.104046, -1.338808, 1, 0.04313726, 0, 1,
-2.236669, -0.6264821, -2.008811, 1, 0.04705882, 0, 1,
-2.217386, -1.701182, -1.222939, 1, 0.05490196, 0, 1,
-2.191014, 0.8160401, -0.6034805, 1, 0.05882353, 0, 1,
-2.14773, -0.259429, -1.51423, 1, 0.06666667, 0, 1,
-2.141301, -0.8564436, -2.863549, 1, 0.07058824, 0, 1,
-2.140208, 0.03651921, -1.287486, 1, 0.07843138, 0, 1,
-2.134134, -1.099894, -1.275897, 1, 0.08235294, 0, 1,
-2.101081, 0.4329849, -1.496847, 1, 0.09019608, 0, 1,
-2.092025, -0.3637127, -2.348677, 1, 0.09411765, 0, 1,
-2.077883, -1.875537, -3.989247, 1, 0.1019608, 0, 1,
-2.041738, 0.6625552, 0.4977642, 1, 0.1098039, 0, 1,
-2.031481, -0.4248624, -2.802491, 1, 0.1137255, 0, 1,
-2.023772, 0.8781426, -2.473446, 1, 0.1215686, 0, 1,
-2.01128, 0.09886279, -1.324954, 1, 0.1254902, 0, 1,
-1.983147, -0.5882746, -1.001969, 1, 0.1333333, 0, 1,
-1.980864, 0.2164575, -2.254163, 1, 0.1372549, 0, 1,
-1.97901, 0.7517325, -0.408045, 1, 0.145098, 0, 1,
-1.965816, -0.2264453, -3.200983, 1, 0.1490196, 0, 1,
-1.953481, -1.792797, -1.310339, 1, 0.1568628, 0, 1,
-1.946188, -1.58544, -2.095689, 1, 0.1607843, 0, 1,
-1.943116, 0.6360977, -2.0843, 1, 0.1686275, 0, 1,
-1.942951, -0.08397015, -1.935342, 1, 0.172549, 0, 1,
-1.940525, 1.459396, -0.3370736, 1, 0.1803922, 0, 1,
-1.91174, 0.2792497, -0.6489527, 1, 0.1843137, 0, 1,
-1.910152, -1.263228, -1.735484, 1, 0.1921569, 0, 1,
-1.90741, -0.634782, 0.9323612, 1, 0.1960784, 0, 1,
-1.8996, -0.1150385, -2.601742, 1, 0.2039216, 0, 1,
-1.896743, 2.164323, -1.241645, 1, 0.2117647, 0, 1,
-1.885152, 1.546281, -0.8491416, 1, 0.2156863, 0, 1,
-1.861282, -0.7002797, -1.829738, 1, 0.2235294, 0, 1,
-1.856774, 0.5702828, -1.154399, 1, 0.227451, 0, 1,
-1.831548, 2.011327, -1.628358, 1, 0.2352941, 0, 1,
-1.830055, -0.3594888, 0.1162152, 1, 0.2392157, 0, 1,
-1.751054, -1.89346, -2.447257, 1, 0.2470588, 0, 1,
-1.750077, 0.1138782, 0.4419798, 1, 0.2509804, 0, 1,
-1.705559, 0.2741294, -0.6970936, 1, 0.2588235, 0, 1,
-1.693131, 1.003119, -0.1495058, 1, 0.2627451, 0, 1,
-1.679301, 0.1364888, -2.924579, 1, 0.2705882, 0, 1,
-1.659271, 0.4178718, -2.078136, 1, 0.2745098, 0, 1,
-1.634463, -1.314327, -3.059183, 1, 0.282353, 0, 1,
-1.605693, -0.8331192, -2.72268, 1, 0.2862745, 0, 1,
-1.604561, 0.7332939, -1.341175, 1, 0.2941177, 0, 1,
-1.603563, -0.2702924, -2.185946, 1, 0.3019608, 0, 1,
-1.602772, -0.1157833, -2.36171, 1, 0.3058824, 0, 1,
-1.571555, -0.0672634, -1.500129, 1, 0.3137255, 0, 1,
-1.570766, -0.01042118, -1.985576, 1, 0.3176471, 0, 1,
-1.56125, -0.4118584, -2.89786, 1, 0.3254902, 0, 1,
-1.547882, -0.0653292, -0.8287981, 1, 0.3294118, 0, 1,
-1.545586, -0.4767345, -0.8777514, 1, 0.3372549, 0, 1,
-1.540075, -1.210242, -3.358578, 1, 0.3411765, 0, 1,
-1.531143, 0.4123223, -1.530792, 1, 0.3490196, 0, 1,
-1.525785, -0.503038, -1.504422, 1, 0.3529412, 0, 1,
-1.5235, -1.277593, -2.023743, 1, 0.3607843, 0, 1,
-1.516381, -1.41446, -1.259132, 1, 0.3647059, 0, 1,
-1.47929, -1.283913, -1.605398, 1, 0.372549, 0, 1,
-1.458905, -0.6211868, -3.936297, 1, 0.3764706, 0, 1,
-1.447964, 0.2440027, 0.1917791, 1, 0.3843137, 0, 1,
-1.446663, 1.685906, -0.4608126, 1, 0.3882353, 0, 1,
-1.444288, -0.9589549, -1.729012, 1, 0.3960784, 0, 1,
-1.441332, 0.9006616, -0.3796869, 1, 0.4039216, 0, 1,
-1.439569, 0.5344306, -0.2172066, 1, 0.4078431, 0, 1,
-1.431671, -0.6277678, -0.808226, 1, 0.4156863, 0, 1,
-1.430051, -1.022446, -1.640975, 1, 0.4196078, 0, 1,
-1.429774, 0.01574211, -0.4471163, 1, 0.427451, 0, 1,
-1.424083, -0.385784, -2.052689, 1, 0.4313726, 0, 1,
-1.421047, 1.445169, 0.9283492, 1, 0.4392157, 0, 1,
-1.412929, 0.4410818, -1.61133, 1, 0.4431373, 0, 1,
-1.412705, 0.7502494, -0.9943396, 1, 0.4509804, 0, 1,
-1.409995, -1.351673, -1.564466, 1, 0.454902, 0, 1,
-1.393764, 0.2040079, -3.026755, 1, 0.4627451, 0, 1,
-1.382346, 0.3011272, -0.5533968, 1, 0.4666667, 0, 1,
-1.379919, 1.437821, -0.8266568, 1, 0.4745098, 0, 1,
-1.364326, -0.8738697, -2.654466, 1, 0.4784314, 0, 1,
-1.353239, 0.9170009, 0.7202625, 1, 0.4862745, 0, 1,
-1.346011, 0.00813795, -1.54935, 1, 0.4901961, 0, 1,
-1.343038, 0.9049199, -2.187539, 1, 0.4980392, 0, 1,
-1.334374, -1.538872, -3.830996, 1, 0.5058824, 0, 1,
-1.331649, 0.388725, -3.163492, 1, 0.509804, 0, 1,
-1.331529, -1.326153, -2.393044, 1, 0.5176471, 0, 1,
-1.330275, -0.7185243, -1.95644, 1, 0.5215687, 0, 1,
-1.312648, 0.8688927, -1.926359, 1, 0.5294118, 0, 1,
-1.307676, 1.410415, -1.496684, 1, 0.5333334, 0, 1,
-1.285945, -0.4772425, -2.872835, 1, 0.5411765, 0, 1,
-1.281637, -0.8939906, -3.036885, 1, 0.5450981, 0, 1,
-1.275376, 1.739455, -1.456009, 1, 0.5529412, 0, 1,
-1.274304, -0.2518673, 0.2910518, 1, 0.5568628, 0, 1,
-1.274078, 0.8272804, -0.9827612, 1, 0.5647059, 0, 1,
-1.268869, -0.4593211, 0.185793, 1, 0.5686275, 0, 1,
-1.268392, 1.495475, 0.126862, 1, 0.5764706, 0, 1,
-1.256032, -0.4662401, -1.048166, 1, 0.5803922, 0, 1,
-1.250463, -1.972314, -2.256653, 1, 0.5882353, 0, 1,
-1.248625, -0.4557061, -1.888769, 1, 0.5921569, 0, 1,
-1.247106, -0.4942815, -1.580908, 1, 0.6, 0, 1,
-1.237313, -0.2836423, -1.696985, 1, 0.6078432, 0, 1,
-1.227278, -1.308134, 0.3855797, 1, 0.6117647, 0, 1,
-1.226695, 2.577204, 0.1827463, 1, 0.6196079, 0, 1,
-1.219629, -0.3183444, 0.005890496, 1, 0.6235294, 0, 1,
-1.21759, 0.4934768, 0.61846, 1, 0.6313726, 0, 1,
-1.215133, -0.9155164, -0.9477459, 1, 0.6352941, 0, 1,
-1.209555, 0.5916106, -0.4658648, 1, 0.6431373, 0, 1,
-1.209083, 0.1004419, -1.053709, 1, 0.6470588, 0, 1,
-1.206747, -0.9884337, -0.9130324, 1, 0.654902, 0, 1,
-1.193035, 0.8803746, 0.10879, 1, 0.6588235, 0, 1,
-1.182045, 2.13419, 0.09402534, 1, 0.6666667, 0, 1,
-1.170929, -0.439829, -1.047271, 1, 0.6705883, 0, 1,
-1.170569, 1.106671, -2.113422, 1, 0.6784314, 0, 1,
-1.164194, 0.4865296, 0.2986099, 1, 0.682353, 0, 1,
-1.15673, -0.2700902, -2.094205, 1, 0.6901961, 0, 1,
-1.155048, -1.36289, -1.77108, 1, 0.6941177, 0, 1,
-1.152028, 0.1734452, 0.4473624, 1, 0.7019608, 0, 1,
-1.148436, -1.58702, -2.931963, 1, 0.7098039, 0, 1,
-1.143034, 0.6909415, -1.27695, 1, 0.7137255, 0, 1,
-1.138854, 2.202516, -1.265141, 1, 0.7215686, 0, 1,
-1.138485, 1.48527, -0.3710668, 1, 0.7254902, 0, 1,
-1.127705, 0.1926429, -0.4453652, 1, 0.7333333, 0, 1,
-1.127013, -1.116109, -2.212002, 1, 0.7372549, 0, 1,
-1.126743, 0.6591074, -1.837512, 1, 0.7450981, 0, 1,
-1.124572, 1.415824, -1.227906, 1, 0.7490196, 0, 1,
-1.120915, -0.3668589, -1.38402, 1, 0.7568628, 0, 1,
-1.113757, -0.3105478, -1.622962, 1, 0.7607843, 0, 1,
-1.110425, -1.808416, -2.487899, 1, 0.7686275, 0, 1,
-1.106189, -0.667886, -2.366012, 1, 0.772549, 0, 1,
-1.099797, -0.5537226, -4.493055, 1, 0.7803922, 0, 1,
-1.094334, 0.252865, 1.035926, 1, 0.7843137, 0, 1,
-1.08838, 0.2752487, -2.075861, 1, 0.7921569, 0, 1,
-1.076526, 0.4970257, 1.264107, 1, 0.7960784, 0, 1,
-1.069436, 1.470553, -3.166471, 1, 0.8039216, 0, 1,
-1.068082, 1.851042, -1.948807, 1, 0.8117647, 0, 1,
-1.067425, 0.3352594, -1.462011, 1, 0.8156863, 0, 1,
-1.064842, -1.864435, -2.382635, 1, 0.8235294, 0, 1,
-1.050098, 0.1413923, -0.4910759, 1, 0.827451, 0, 1,
-1.048455, -1.423645, -2.15514, 1, 0.8352941, 0, 1,
-1.038666, -1.48897, -2.592418, 1, 0.8392157, 0, 1,
-1.024314, -1.591825, -4.391905, 1, 0.8470588, 0, 1,
-1.023076, -0.1021742, -3.194834, 1, 0.8509804, 0, 1,
-1.018706, -1.763614, -2.365971, 1, 0.8588235, 0, 1,
-1.017926, -0.5636138, -2.903684, 1, 0.8627451, 0, 1,
-1.010117, 0.6865468, 0.7259661, 1, 0.8705882, 0, 1,
-1.009825, 1.046325, -1.468973, 1, 0.8745098, 0, 1,
-1.008984, -0.1588125, -2.702383, 1, 0.8823529, 0, 1,
-1.008091, -1.465458, -2.579524, 1, 0.8862745, 0, 1,
-0.9976281, -0.5377811, -1.745342, 1, 0.8941177, 0, 1,
-0.9975197, 0.06550844, -1.864338, 1, 0.8980392, 0, 1,
-0.9963414, -1.987228, -2.946702, 1, 0.9058824, 0, 1,
-0.9947679, 0.3715708, -1.167565, 1, 0.9137255, 0, 1,
-0.9929027, 0.3327301, -1.698729, 1, 0.9176471, 0, 1,
-0.9928954, 1.495858, -1.946916, 1, 0.9254902, 0, 1,
-0.9917626, 0.770761, -1.544796, 1, 0.9294118, 0, 1,
-0.9787564, 0.231503, -1.465424, 1, 0.9372549, 0, 1,
-0.9780558, -1.399087, -4.483991, 1, 0.9411765, 0, 1,
-0.9747366, 0.03822818, -3.677605, 1, 0.9490196, 0, 1,
-0.9742665, 0.1602502, -2.911569, 1, 0.9529412, 0, 1,
-0.9722294, -0.8615866, -1.338799, 1, 0.9607843, 0, 1,
-0.9565579, 2.164952, -0.7341404, 1, 0.9647059, 0, 1,
-0.9548129, 0.1288904, -1.629918, 1, 0.972549, 0, 1,
-0.954344, -0.7169341, -1.890281, 1, 0.9764706, 0, 1,
-0.9507648, 0.685803, 0.1543992, 1, 0.9843137, 0, 1,
-0.9416102, 0.8126501, -2.020405, 1, 0.9882353, 0, 1,
-0.9408042, -0.5206885, -0.6189818, 1, 0.9960784, 0, 1,
-0.9378424, 0.6968886, -1.852373, 0.9960784, 1, 0, 1,
-0.9349461, 1.479814, -1.283957, 0.9921569, 1, 0, 1,
-0.9322869, 0.5722772, -2.223491, 0.9843137, 1, 0, 1,
-0.9317856, 0.01864703, -0.9944301, 0.9803922, 1, 0, 1,
-0.922233, 0.7434483, -0.1755422, 0.972549, 1, 0, 1,
-0.9203758, -0.7950462, -2.032212, 0.9686275, 1, 0, 1,
-0.9193339, 0.2031165, -1.99679, 0.9607843, 1, 0, 1,
-0.9187875, 1.28899, -1.817618, 0.9568627, 1, 0, 1,
-0.9047394, 0.1987284, -0.3934923, 0.9490196, 1, 0, 1,
-0.9018556, -0.31163, -4.163241, 0.945098, 1, 0, 1,
-0.8908255, -0.8138648, -1.711779, 0.9372549, 1, 0, 1,
-0.8898713, -1.659963, -2.303247, 0.9333333, 1, 0, 1,
-0.8893033, 0.07405091, -3.056105, 0.9254902, 1, 0, 1,
-0.8887752, 0.9264259, -0.4125614, 0.9215686, 1, 0, 1,
-0.8850287, 2.652184, -1.071748, 0.9137255, 1, 0, 1,
-0.883123, 0.3674428, -1.960063, 0.9098039, 1, 0, 1,
-0.882336, -1.097865, -3.644439, 0.9019608, 1, 0, 1,
-0.8782642, -0.1819965, -0.8935919, 0.8941177, 1, 0, 1,
-0.877394, -0.7788923, -2.529804, 0.8901961, 1, 0, 1,
-0.8773612, -0.8241921, -1.596287, 0.8823529, 1, 0, 1,
-0.8704226, -0.656719, -2.285753, 0.8784314, 1, 0, 1,
-0.8693592, 0.3407137, -0.3626128, 0.8705882, 1, 0, 1,
-0.8675801, -0.2064239, -3.431504, 0.8666667, 1, 0, 1,
-0.8646499, 0.3838264, 0.5122547, 0.8588235, 1, 0, 1,
-0.8646334, -0.7841552, -1.187683, 0.854902, 1, 0, 1,
-0.8639132, 0.1815997, -1.411667, 0.8470588, 1, 0, 1,
-0.8612951, 2.046458, -0.7123165, 0.8431373, 1, 0, 1,
-0.8604406, 1.515376, 0.576761, 0.8352941, 1, 0, 1,
-0.8580473, -0.06560752, -1.313783, 0.8313726, 1, 0, 1,
-0.8561123, 0.6813108, -0.4724053, 0.8235294, 1, 0, 1,
-0.8543777, -0.3042159, -1.648085, 0.8196079, 1, 0, 1,
-0.8538056, 0.3000266, -1.861815, 0.8117647, 1, 0, 1,
-0.8506214, 1.58108, 0.5400234, 0.8078431, 1, 0, 1,
-0.8499088, -1.739261, -1.905154, 0.8, 1, 0, 1,
-0.8469154, -1.171056, -2.33557, 0.7921569, 1, 0, 1,
-0.8464254, -0.6756178, -2.208166, 0.7882353, 1, 0, 1,
-0.8449363, 1.850461, 0.102216, 0.7803922, 1, 0, 1,
-0.8362935, 0.7370428, -1.889243, 0.7764706, 1, 0, 1,
-0.8335206, 0.01051913, -2.156119, 0.7686275, 1, 0, 1,
-0.8288199, -0.5911004, -2.300897, 0.7647059, 1, 0, 1,
-0.8256154, -0.8548232, -2.541955, 0.7568628, 1, 0, 1,
-0.8214641, 1.022179, -2.174269, 0.7529412, 1, 0, 1,
-0.8187765, -0.06525923, -1.12133, 0.7450981, 1, 0, 1,
-0.8140873, 0.03002165, -2.429139, 0.7411765, 1, 0, 1,
-0.8137949, -0.3691356, -0.8916201, 0.7333333, 1, 0, 1,
-0.8133355, 1.08369, -1.418125, 0.7294118, 1, 0, 1,
-0.8130621, 0.2320989, -2.038514, 0.7215686, 1, 0, 1,
-0.8097752, -1.156229, -2.402633, 0.7176471, 1, 0, 1,
-0.8045488, 0.4783739, -1.836998, 0.7098039, 1, 0, 1,
-0.7929162, -1.015254, -2.518862, 0.7058824, 1, 0, 1,
-0.7854125, 0.2881335, -0.3121778, 0.6980392, 1, 0, 1,
-0.7828658, -0.5505245, -2.791903, 0.6901961, 1, 0, 1,
-0.7752952, 0.7544743, -0.2373921, 0.6862745, 1, 0, 1,
-0.7741688, 1.128942, -0.1906987, 0.6784314, 1, 0, 1,
-0.773401, 0.861579, 0.003359319, 0.6745098, 1, 0, 1,
-0.7661865, -0.903434, -1.23325, 0.6666667, 1, 0, 1,
-0.7647073, -0.8214005, -2.071396, 0.6627451, 1, 0, 1,
-0.7634288, 0.970881, -0.8062761, 0.654902, 1, 0, 1,
-0.7616061, 0.4054078, -2.61439, 0.6509804, 1, 0, 1,
-0.7571187, 0.9970018, -1.972364, 0.6431373, 1, 0, 1,
-0.7536477, -0.8866258, -1.268257, 0.6392157, 1, 0, 1,
-0.7475643, 0.2511916, -1.337346, 0.6313726, 1, 0, 1,
-0.7458894, 1.382704, -2.249221, 0.627451, 1, 0, 1,
-0.7364591, -0.2667584, -2.246005, 0.6196079, 1, 0, 1,
-0.7353035, 0.4333543, -1.042148, 0.6156863, 1, 0, 1,
-0.7340459, 0.06075035, 0.658993, 0.6078432, 1, 0, 1,
-0.7277749, -0.2692585, -2.821039, 0.6039216, 1, 0, 1,
-0.7270763, -0.7511793, -1.684003, 0.5960785, 1, 0, 1,
-0.7206793, -1.427845, -2.889412, 0.5882353, 1, 0, 1,
-0.7163481, 0.1804734, -0.5379314, 0.5843138, 1, 0, 1,
-0.7118642, 0.1435442, -2.616671, 0.5764706, 1, 0, 1,
-0.7105389, 0.464596, 0.5076449, 0.572549, 1, 0, 1,
-0.707563, 0.547493, 0.8317392, 0.5647059, 1, 0, 1,
-0.7016035, -1.220277, -2.0964, 0.5607843, 1, 0, 1,
-0.6991788, 2.049887, 0.3331189, 0.5529412, 1, 0, 1,
-0.698707, -1.287998, -2.891521, 0.5490196, 1, 0, 1,
-0.6929291, -1.565109, -3.348548, 0.5411765, 1, 0, 1,
-0.6924847, 0.07934389, 0.5124771, 0.5372549, 1, 0, 1,
-0.6909058, 1.877726, 0.2193055, 0.5294118, 1, 0, 1,
-0.6866063, -0.7574612, -2.785495, 0.5254902, 1, 0, 1,
-0.6850426, 1.214918, 0.1064725, 0.5176471, 1, 0, 1,
-0.6826106, 1.791931, 1.137562, 0.5137255, 1, 0, 1,
-0.6798556, -1.965496, -3.36051, 0.5058824, 1, 0, 1,
-0.6739282, -0.5763041, -1.792256, 0.5019608, 1, 0, 1,
-0.6683354, -0.1625719, -2.759579, 0.4941176, 1, 0, 1,
-0.6659199, 0.5637965, 0.6879969, 0.4862745, 1, 0, 1,
-0.6622131, 0.2125651, -0.2337084, 0.4823529, 1, 0, 1,
-0.6579897, 1.603692, -1.209982, 0.4745098, 1, 0, 1,
-0.6579189, -0.9432004, -1.861532, 0.4705882, 1, 0, 1,
-0.6566339, 0.06146812, 0.3880022, 0.4627451, 1, 0, 1,
-0.6565343, 1.227479, 1.316989, 0.4588235, 1, 0, 1,
-0.6555451, 1.03108, 0.1484295, 0.4509804, 1, 0, 1,
-0.6489595, 0.9127271, -1.50834, 0.4470588, 1, 0, 1,
-0.6448976, 0.04835117, -1.202351, 0.4392157, 1, 0, 1,
-0.6445132, 1.877357, -2.619698, 0.4352941, 1, 0, 1,
-0.6443083, 1.064226, 0.2091211, 0.427451, 1, 0, 1,
-0.6394753, 0.8646445, -1.511401, 0.4235294, 1, 0, 1,
-0.6346548, -0.3536508, -2.921397, 0.4156863, 1, 0, 1,
-0.630915, 0.140928, -0.2501055, 0.4117647, 1, 0, 1,
-0.6237251, 0.9419823, 1.225569, 0.4039216, 1, 0, 1,
-0.6227134, 0.7390538, 0.2506542, 0.3960784, 1, 0, 1,
-0.6216922, -0.7391627, -2.60746, 0.3921569, 1, 0, 1,
-0.6202075, 0.4035097, 1.127085, 0.3843137, 1, 0, 1,
-0.6200766, 0.1682982, -1.185909, 0.3803922, 1, 0, 1,
-0.6186901, 0.324359, -1.454451, 0.372549, 1, 0, 1,
-0.6173139, 0.5246897, -0.5937741, 0.3686275, 1, 0, 1,
-0.6164888, 1.1761, -1.72972, 0.3607843, 1, 0, 1,
-0.6151741, -1.63861, -4.049333, 0.3568628, 1, 0, 1,
-0.6130779, 1.756858, -1.650886, 0.3490196, 1, 0, 1,
-0.6086739, 1.631367, -0.3116389, 0.345098, 1, 0, 1,
-0.6070048, 1.55291, 0.3539525, 0.3372549, 1, 0, 1,
-0.6028779, -1.542343, -3.266176, 0.3333333, 1, 0, 1,
-0.6010337, 1.019674, 2.837832, 0.3254902, 1, 0, 1,
-0.6000636, 0.01513788, -1.90161, 0.3215686, 1, 0, 1,
-0.5930532, 0.0675857, -1.15396, 0.3137255, 1, 0, 1,
-0.5920662, 0.122302, 0.7960333, 0.3098039, 1, 0, 1,
-0.5909737, 0.284736, -1.450263, 0.3019608, 1, 0, 1,
-0.5854279, 0.02420847, -1.651401, 0.2941177, 1, 0, 1,
-0.5768487, 0.8235417, -2.329592, 0.2901961, 1, 0, 1,
-0.5739891, -0.7468938, -3.451828, 0.282353, 1, 0, 1,
-0.5691976, 0.3668524, -1.153275, 0.2784314, 1, 0, 1,
-0.5661327, 0.5870664, 0.1653542, 0.2705882, 1, 0, 1,
-0.563543, -1.129341, -3.152607, 0.2666667, 1, 0, 1,
-0.5605227, -0.1414127, -2.008758, 0.2588235, 1, 0, 1,
-0.5588859, 0.1209187, -0.6446894, 0.254902, 1, 0, 1,
-0.5539499, -0.7778959, -1.101092, 0.2470588, 1, 0, 1,
-0.5506722, 1.777618, -1.406476, 0.2431373, 1, 0, 1,
-0.5483179, 1.78748, -0.1774981, 0.2352941, 1, 0, 1,
-0.5475353, -1.664967, -4.472323, 0.2313726, 1, 0, 1,
-0.546934, -0.3878841, -2.38575, 0.2235294, 1, 0, 1,
-0.5461675, -0.5137256, -4.225689, 0.2196078, 1, 0, 1,
-0.5458455, -0.436932, -2.913857, 0.2117647, 1, 0, 1,
-0.5433589, 1.597234, -2.543, 0.2078431, 1, 0, 1,
-0.5433094, -0.9820374, -2.408813, 0.2, 1, 0, 1,
-0.5370058, -1.694716, -1.154537, 0.1921569, 1, 0, 1,
-0.5347822, -1.644091, -4.203006, 0.1882353, 1, 0, 1,
-0.5307252, -1.665787, -3.070818, 0.1803922, 1, 0, 1,
-0.529531, -1.239786, -2.657043, 0.1764706, 1, 0, 1,
-0.5266741, -0.3457, -1.164859, 0.1686275, 1, 0, 1,
-0.5256777, -0.3341866, -1.429665, 0.1647059, 1, 0, 1,
-0.5220363, -1.261024, -3.469086, 0.1568628, 1, 0, 1,
-0.5218973, 1.188475, -1.847125, 0.1529412, 1, 0, 1,
-0.5093045, 0.06892502, -0.9598236, 0.145098, 1, 0, 1,
-0.5074432, 0.4728636, -0.4845162, 0.1411765, 1, 0, 1,
-0.5067468, 0.5878375, -0.9915197, 0.1333333, 1, 0, 1,
-0.503961, -0.6240309, -2.754666, 0.1294118, 1, 0, 1,
-0.5039598, -1.452866, -1.854339, 0.1215686, 1, 0, 1,
-0.5038098, -0.08642425, -0.3829261, 0.1176471, 1, 0, 1,
-0.5004579, -1.52515, -3.70441, 0.1098039, 1, 0, 1,
-0.4961362, -0.4078254, -1.550559, 0.1058824, 1, 0, 1,
-0.494629, -0.5016462, -1.737532, 0.09803922, 1, 0, 1,
-0.4931933, 0.5834637, -2.867326, 0.09019608, 1, 0, 1,
-0.4898423, 0.916068, 0.4064483, 0.08627451, 1, 0, 1,
-0.4841873, -0.01368301, -2.445893, 0.07843138, 1, 0, 1,
-0.4835911, 0.725858, -0.1559413, 0.07450981, 1, 0, 1,
-0.4829779, 0.3268484, 0.4755443, 0.06666667, 1, 0, 1,
-0.47882, 0.6890528, -2.282219, 0.0627451, 1, 0, 1,
-0.4715428, 0.3396121, -1.523993, 0.05490196, 1, 0, 1,
-0.4713119, -0.5763982, -1.261611, 0.05098039, 1, 0, 1,
-0.4647414, 0.6914636, -1.058122, 0.04313726, 1, 0, 1,
-0.4642574, -2.129874, -4.28783, 0.03921569, 1, 0, 1,
-0.4640581, 0.104875, -1.107176, 0.03137255, 1, 0, 1,
-0.4635679, 1.052384, -0.03840241, 0.02745098, 1, 0, 1,
-0.4598354, -0.4235597, -1.545872, 0.01960784, 1, 0, 1,
-0.4579754, 0.06642073, -0.8468806, 0.01568628, 1, 0, 1,
-0.4532951, -0.1484805, -2.114972, 0.007843138, 1, 0, 1,
-0.4529619, 0.9906129, -0.9311323, 0.003921569, 1, 0, 1,
-0.4462705, -0.3987413, -1.990925, 0, 1, 0.003921569, 1,
-0.446099, -1.685532, -2.703923, 0, 1, 0.01176471, 1,
-0.4430276, -0.05564061, -0.6824482, 0, 1, 0.01568628, 1,
-0.4399287, -0.09190737, -1.245827, 0, 1, 0.02352941, 1,
-0.4377714, -0.965748, -0.5496606, 0, 1, 0.02745098, 1,
-0.437633, 0.5897753, -0.7462669, 0, 1, 0.03529412, 1,
-0.4372413, -0.1266061, -2.511332, 0, 1, 0.03921569, 1,
-0.4364227, 1.194624, -0.2760293, 0, 1, 0.04705882, 1,
-0.4352384, 1.281279, 0.3157682, 0, 1, 0.05098039, 1,
-0.4327626, 0.06121696, -0.8604618, 0, 1, 0.05882353, 1,
-0.4323503, -0.07473949, -1.495139, 0, 1, 0.0627451, 1,
-0.4319045, -0.006412795, -0.4878741, 0, 1, 0.07058824, 1,
-0.4313065, 1.081644, -0.2774783, 0, 1, 0.07450981, 1,
-0.4290814, 0.08626893, -2.40745, 0, 1, 0.08235294, 1,
-0.4254565, 0.7791761, 0.3459628, 0, 1, 0.08627451, 1,
-0.4231013, 0.7577315, -1.438973, 0, 1, 0.09411765, 1,
-0.4202698, -0.5078838, -3.772831, 0, 1, 0.1019608, 1,
-0.4104653, 1.935964, 0.7380401, 0, 1, 0.1058824, 1,
-0.4036757, 0.4801776, -0.4678289, 0, 1, 0.1137255, 1,
-0.394473, -0.9121494, -4.068673, 0, 1, 0.1176471, 1,
-0.3933206, -0.02630418, -2.344559, 0, 1, 0.1254902, 1,
-0.3929034, -1.325499, -2.066502, 0, 1, 0.1294118, 1,
-0.3900993, -0.9414422, -2.739705, 0, 1, 0.1372549, 1,
-0.389855, -0.2397096, -3.037803, 0, 1, 0.1411765, 1,
-0.3840931, -0.6023846, -4.408943, 0, 1, 0.1490196, 1,
-0.3786199, -0.3205253, -2.06192, 0, 1, 0.1529412, 1,
-0.3785191, -1.250689, -2.051086, 0, 1, 0.1607843, 1,
-0.3701528, 0.5709939, -0.6358989, 0, 1, 0.1647059, 1,
-0.369669, -0.8199711, -1.471025, 0, 1, 0.172549, 1,
-0.3681143, 0.3954527, -1.963597, 0, 1, 0.1764706, 1,
-0.3670448, -0.2205774, -2.272796, 0, 1, 0.1843137, 1,
-0.3658849, 0.676055, 0.7151208, 0, 1, 0.1882353, 1,
-0.3646125, 0.9047995, 0.5369262, 0, 1, 0.1960784, 1,
-0.3603532, 0.8687115, -1.443904, 0, 1, 0.2039216, 1,
-0.3592992, -2.32002, -4.235205, 0, 1, 0.2078431, 1,
-0.3501879, 0.1393197, -0.5863543, 0, 1, 0.2156863, 1,
-0.3485186, 0.4215253, -0.01234593, 0, 1, 0.2196078, 1,
-0.3480797, -0.9720839, -2.116253, 0, 1, 0.227451, 1,
-0.3457088, 0.3934511, 0.6387248, 0, 1, 0.2313726, 1,
-0.3451088, -1.061881, -3.987848, 0, 1, 0.2392157, 1,
-0.3379093, 0.1976703, -0.3987341, 0, 1, 0.2431373, 1,
-0.3356663, 0.6877522, -0.1395995, 0, 1, 0.2509804, 1,
-0.3331617, -0.8127846, -2.834671, 0, 1, 0.254902, 1,
-0.3312216, -0.5253935, -2.00642, 0, 1, 0.2627451, 1,
-0.3262672, -1.374268, -3.398848, 0, 1, 0.2666667, 1,
-0.3258724, 0.2502057, -0.2184976, 0, 1, 0.2745098, 1,
-0.3253145, 0.8275696, -0.8834916, 0, 1, 0.2784314, 1,
-0.3186969, 2.056606, -0.3394916, 0, 1, 0.2862745, 1,
-0.3074808, 0.8605003, -0.01487133, 0, 1, 0.2901961, 1,
-0.3066176, 1.133062, 0.4533382, 0, 1, 0.2980392, 1,
-0.2972621, 0.6832427, 0.194117, 0, 1, 0.3058824, 1,
-0.2956316, 0.7541471, -0.04315729, 0, 1, 0.3098039, 1,
-0.2790669, -0.6440635, -3.914574, 0, 1, 0.3176471, 1,
-0.2729126, -0.9190667, -2.035755, 0, 1, 0.3215686, 1,
-0.2650413, -0.4350947, -2.123115, 0, 1, 0.3294118, 1,
-0.2628195, -0.519478, -2.469104, 0, 1, 0.3333333, 1,
-0.26019, -0.1372407, -2.843708, 0, 1, 0.3411765, 1,
-0.2559818, 0.243364, -0.7350867, 0, 1, 0.345098, 1,
-0.2550043, -0.5854023, -2.308884, 0, 1, 0.3529412, 1,
-0.2548617, 0.4046841, -2.817154, 0, 1, 0.3568628, 1,
-0.2505992, -0.24214, -4.270372, 0, 1, 0.3647059, 1,
-0.2417239, -0.6377963, -3.282064, 0, 1, 0.3686275, 1,
-0.2406513, -0.8291528, -3.230716, 0, 1, 0.3764706, 1,
-0.2401818, 0.9622637, -0.2729446, 0, 1, 0.3803922, 1,
-0.2383929, -0.01543023, -3.532913, 0, 1, 0.3882353, 1,
-0.2377596, -2.058431, -2.69693, 0, 1, 0.3921569, 1,
-0.2367157, -1.332372, -3.029546, 0, 1, 0.4, 1,
-0.2354006, -1.369853, -3.17938, 0, 1, 0.4078431, 1,
-0.2344, -0.0409952, -3.246095, 0, 1, 0.4117647, 1,
-0.2316763, -0.3076752, -4.708424, 0, 1, 0.4196078, 1,
-0.2273407, -0.2987866, -2.27348, 0, 1, 0.4235294, 1,
-0.227028, 0.1788626, -1.602328, 0, 1, 0.4313726, 1,
-0.2234965, 0.5171562, -0.3622177, 0, 1, 0.4352941, 1,
-0.2234154, 0.830629, -0.4275337, 0, 1, 0.4431373, 1,
-0.2174592, -0.3056735, -1.74137, 0, 1, 0.4470588, 1,
-0.2152683, -0.5225883, -2.775828, 0, 1, 0.454902, 1,
-0.2098921, -0.9899588, -3.58754, 0, 1, 0.4588235, 1,
-0.2082387, 0.918636, 0.07843751, 0, 1, 0.4666667, 1,
-0.2054214, -0.08168212, -2.203986, 0, 1, 0.4705882, 1,
-0.2005118, 0.2013841, -1.127462, 0, 1, 0.4784314, 1,
-0.1998743, -0.8689094, -3.714175, 0, 1, 0.4823529, 1,
-0.1963513, 0.9478547, 0.693241, 0, 1, 0.4901961, 1,
-0.1958444, -0.04410896, -3.699511, 0, 1, 0.4941176, 1,
-0.1951102, 0.3649476, -1.399338, 0, 1, 0.5019608, 1,
-0.1918384, 0.8268633, -0.2676705, 0, 1, 0.509804, 1,
-0.1883996, 0.232772, 1.390547, 0, 1, 0.5137255, 1,
-0.1851157, -1.00461, -1.825769, 0, 1, 0.5215687, 1,
-0.1847628, 1.519841, -0.2045129, 0, 1, 0.5254902, 1,
-0.1845358, 0.355565, -1.164944, 0, 1, 0.5333334, 1,
-0.1774735, -0.08056789, -2.314201, 0, 1, 0.5372549, 1,
-0.1774437, -0.125008, -3.182168, 0, 1, 0.5450981, 1,
-0.1753134, 0.5977464, -0.1879709, 0, 1, 0.5490196, 1,
-0.1719078, 1.195363, -1.409937, 0, 1, 0.5568628, 1,
-0.1717345, -0.2355927, -3.715009, 0, 1, 0.5607843, 1,
-0.1708229, 0.01424579, -1.742005, 0, 1, 0.5686275, 1,
-0.1673571, 0.9860088, -1.66066, 0, 1, 0.572549, 1,
-0.1667876, -1.041067, -5.062318, 0, 1, 0.5803922, 1,
-0.1630942, -2.164756, -2.125465, 0, 1, 0.5843138, 1,
-0.1627018, -1.174726, -0.9885077, 0, 1, 0.5921569, 1,
-0.1617664, -0.8809475, -2.543684, 0, 1, 0.5960785, 1,
-0.1611281, -0.7535025, -1.627337, 0, 1, 0.6039216, 1,
-0.1609308, -1.359028, -2.557246, 0, 1, 0.6117647, 1,
-0.160523, -0.3948459, -2.515972, 0, 1, 0.6156863, 1,
-0.158839, -0.9798864, -2.652813, 0, 1, 0.6235294, 1,
-0.1564711, -1.643433, -5.63825, 0, 1, 0.627451, 1,
-0.15204, 1.444279, -1.74149, 0, 1, 0.6352941, 1,
-0.148995, 0.9966338, 1.082277, 0, 1, 0.6392157, 1,
-0.1472463, -0.457493, -3.645856, 0, 1, 0.6470588, 1,
-0.1365858, 0.3467981, -1.294224, 0, 1, 0.6509804, 1,
-0.1342771, 0.8062784, 1.619964, 0, 1, 0.6588235, 1,
-0.131983, 0.1566947, -1.939344, 0, 1, 0.6627451, 1,
-0.1306001, -0.3418829, -3.256324, 0, 1, 0.6705883, 1,
-0.1290886, -1.149992, -3.124478, 0, 1, 0.6745098, 1,
-0.1243287, 0.926496, -1.193086, 0, 1, 0.682353, 1,
-0.1192933, 0.745233, -0.005359629, 0, 1, 0.6862745, 1,
-0.1185677, 1.408378, -0.5995111, 0, 1, 0.6941177, 1,
-0.114956, -1.492381, -3.816168, 0, 1, 0.7019608, 1,
-0.1116527, -0.4206626, -3.091604, 0, 1, 0.7058824, 1,
-0.1052328, -0.8975875, -3.084843, 0, 1, 0.7137255, 1,
-0.1037766, -0.9988173, -4.169783, 0, 1, 0.7176471, 1,
-0.1010018, 1.412346, -1.048636, 0, 1, 0.7254902, 1,
-0.09624889, -0.7920871, -1.299976, 0, 1, 0.7294118, 1,
-0.09500626, -0.8566268, -3.386872, 0, 1, 0.7372549, 1,
-0.08859017, 1.054633, -0.4848249, 0, 1, 0.7411765, 1,
-0.08809102, -1.898837, -3.574933, 0, 1, 0.7490196, 1,
-0.08676144, -1.152629, -2.421474, 0, 1, 0.7529412, 1,
-0.08598666, 0.8182892, 0.8000963, 0, 1, 0.7607843, 1,
-0.07895331, 1.677535, 1.789421, 0, 1, 0.7647059, 1,
-0.07703681, 0.7453934, 1.640962, 0, 1, 0.772549, 1,
-0.07660586, -0.8996254, -2.957927, 0, 1, 0.7764706, 1,
-0.07540321, -0.7037167, -3.330764, 0, 1, 0.7843137, 1,
-0.07241724, -0.5592452, -2.455366, 0, 1, 0.7882353, 1,
-0.06922358, 0.9739219, 0.1959427, 0, 1, 0.7960784, 1,
-0.06606595, 1.221263, -1.10631, 0, 1, 0.8039216, 1,
-0.06256855, -0.2428507, -3.761744, 0, 1, 0.8078431, 1,
-0.0600258, 1.27019, -2.136877, 0, 1, 0.8156863, 1,
-0.0600246, 0.406716, 1.220064, 0, 1, 0.8196079, 1,
-0.05638961, 0.6465328, -2.474964, 0, 1, 0.827451, 1,
-0.04904348, 0.7931458, 0.6882709, 0, 1, 0.8313726, 1,
-0.04789429, -2.24169, -4.105111, 0, 1, 0.8392157, 1,
-0.04771659, -0.2305365, -2.683424, 0, 1, 0.8431373, 1,
-0.04582587, 0.5024939, -0.3157984, 0, 1, 0.8509804, 1,
-0.04551613, 0.1480635, -1.152504, 0, 1, 0.854902, 1,
-0.04446911, -1.433835, -4.559485, 0, 1, 0.8627451, 1,
-0.0423745, -0.05901746, -1.899668, 0, 1, 0.8666667, 1,
-0.04208647, 0.7576906, 1.364936, 0, 1, 0.8745098, 1,
-0.03948336, 1.425288, 0.9501948, 0, 1, 0.8784314, 1,
-0.03943681, 0.3850654, -0.5652452, 0, 1, 0.8862745, 1,
-0.0374995, 0.8339879, -0.4860127, 0, 1, 0.8901961, 1,
-0.03525257, -3.411596, -2.862734, 0, 1, 0.8980392, 1,
-0.03269785, -2.336738, -1.93084, 0, 1, 0.9058824, 1,
-0.02716041, 1.581799, -2.015073, 0, 1, 0.9098039, 1,
-0.02628282, -0.9903627, -2.609635, 0, 1, 0.9176471, 1,
-0.024234, 0.6423189, 0.4922594, 0, 1, 0.9215686, 1,
-0.02393405, 0.7527461, -1.996059, 0, 1, 0.9294118, 1,
-0.02305798, -0.1798592, -2.682938, 0, 1, 0.9333333, 1,
-0.01829077, 0.2689953, -0.007522078, 0, 1, 0.9411765, 1,
-0.01371131, 0.8787407, -0.957277, 0, 1, 0.945098, 1,
-0.0135882, -0.05678731, -0.1257392, 0, 1, 0.9529412, 1,
-0.01016551, -1.429027, -5.721003, 0, 1, 0.9568627, 1,
-0.008995154, -0.5800176, -2.985571, 0, 1, 0.9647059, 1,
-0.002530541, -0.9655697, -3.644773, 0, 1, 0.9686275, 1,
-0.0006711754, -0.4000158, -3.292181, 0, 1, 0.9764706, 1,
0.005632073, 0.7666721, -0.8688195, 0, 1, 0.9803922, 1,
0.007520183, -2.396608, 3.931736, 0, 1, 0.9882353, 1,
0.00888089, 0.4921227, 0.06784409, 0, 1, 0.9921569, 1,
0.009677188, -0.5585636, 4.257576, 0, 1, 1, 1,
0.01212309, 0.2305474, -1.695644, 0, 0.9921569, 1, 1,
0.01347192, 0.04953038, 0.5137617, 0, 0.9882353, 1, 1,
0.02243847, -0.6361269, 2.893863, 0, 0.9803922, 1, 1,
0.02329964, -0.3403141, 2.032264, 0, 0.9764706, 1, 1,
0.02541343, 0.9634356, 0.5777428, 0, 0.9686275, 1, 1,
0.02818887, -0.398973, 2.35816, 0, 0.9647059, 1, 1,
0.02940487, 0.2425845, 2.032742, 0, 0.9568627, 1, 1,
0.02976226, 0.2754345, -0.01875259, 0, 0.9529412, 1, 1,
0.03232753, -0.5766512, 3.279217, 0, 0.945098, 1, 1,
0.03237863, -1.406504, 3.852901, 0, 0.9411765, 1, 1,
0.04193911, 0.153212, 0.5148215, 0, 0.9333333, 1, 1,
0.0460857, 0.3721772, -0.5132866, 0, 0.9294118, 1, 1,
0.04791654, 0.6478533, 0.2419185, 0, 0.9215686, 1, 1,
0.05363468, 0.7690201, 0.5924355, 0, 0.9176471, 1, 1,
0.05510463, -0.3026666, 3.357305, 0, 0.9098039, 1, 1,
0.05535259, -0.7720477, 3.043407, 0, 0.9058824, 1, 1,
0.05863633, 1.811978, -0.2377362, 0, 0.8980392, 1, 1,
0.06026614, -0.7534909, 3.702911, 0, 0.8901961, 1, 1,
0.06045676, -0.5460929, 4.477528, 0, 0.8862745, 1, 1,
0.06797048, 0.8525842, 0.3708553, 0, 0.8784314, 1, 1,
0.07094124, -0.7890908, 5.221087, 0, 0.8745098, 1, 1,
0.07358561, -0.2685958, 2.819475, 0, 0.8666667, 1, 1,
0.07987384, -0.6340106, 4.206793, 0, 0.8627451, 1, 1,
0.0808625, 1.321548, -0.155333, 0, 0.854902, 1, 1,
0.08112899, -0.7088929, 4.540896, 0, 0.8509804, 1, 1,
0.08214266, -0.2498089, 3.722098, 0, 0.8431373, 1, 1,
0.08555983, 0.05748586, -0.1832978, 0, 0.8392157, 1, 1,
0.08756889, 1.036222, 1.12589, 0, 0.8313726, 1, 1,
0.09014731, 0.07118021, 0.0646468, 0, 0.827451, 1, 1,
0.09822351, -1.000737, 3.557821, 0, 0.8196079, 1, 1,
0.09940527, -0.5236324, 2.829651, 0, 0.8156863, 1, 1,
0.102283, -0.9675311, 2.151762, 0, 0.8078431, 1, 1,
0.1032224, -1.122124, 3.134583, 0, 0.8039216, 1, 1,
0.1033079, -0.1953315, 3.202438, 0, 0.7960784, 1, 1,
0.1069663, 1.035761, -0.3894434, 0, 0.7882353, 1, 1,
0.1099712, -0.2672743, 3.074157, 0, 0.7843137, 1, 1,
0.1124248, 0.2200222, 0.06129202, 0, 0.7764706, 1, 1,
0.1162231, -1.211356, 1.805544, 0, 0.772549, 1, 1,
0.116253, 0.676757, 0.9538842, 0, 0.7647059, 1, 1,
0.121274, -0.3361565, 1.664533, 0, 0.7607843, 1, 1,
0.125828, -0.3288867, 3.815322, 0, 0.7529412, 1, 1,
0.1293528, 0.185346, 0.7789633, 0, 0.7490196, 1, 1,
0.1300042, -0.216062, 4.274495, 0, 0.7411765, 1, 1,
0.1321611, -1.708557, 1.628007, 0, 0.7372549, 1, 1,
0.1340271, -1.981619, 3.180866, 0, 0.7294118, 1, 1,
0.1345735, 1.412448, -0.1825242, 0, 0.7254902, 1, 1,
0.1376142, 0.7212173, -0.3521748, 0, 0.7176471, 1, 1,
0.1400196, -0.2450276, 3.656643, 0, 0.7137255, 1, 1,
0.1401964, -0.3305365, 2.205599, 0, 0.7058824, 1, 1,
0.1410134, -0.2884459, 4.439024, 0, 0.6980392, 1, 1,
0.1425434, -0.04653807, 2.473586, 0, 0.6941177, 1, 1,
0.1479186, -0.4465001, 2.730149, 0, 0.6862745, 1, 1,
0.1499442, 0.4397103, -1.279026, 0, 0.682353, 1, 1,
0.150984, -2.29103, 1.751032, 0, 0.6745098, 1, 1,
0.1524201, 0.5697167, 0.1422189, 0, 0.6705883, 1, 1,
0.1569198, -0.7264583, 3.839752, 0, 0.6627451, 1, 1,
0.1591162, 0.76208, 1.073093, 0, 0.6588235, 1, 1,
0.1594337, 0.5631887, 0.8725093, 0, 0.6509804, 1, 1,
0.163224, 1.072633, -1.050912, 0, 0.6470588, 1, 1,
0.1660119, 0.4008036, -0.7737856, 0, 0.6392157, 1, 1,
0.1678526, -1.047843, 2.842525, 0, 0.6352941, 1, 1,
0.1766701, 0.8234691, 1.801434, 0, 0.627451, 1, 1,
0.1786339, -1.433709, 4.339658, 0, 0.6235294, 1, 1,
0.1869939, -1.026212, 3.004033, 0, 0.6156863, 1, 1,
0.1924724, 1.094941, 0.6666669, 0, 0.6117647, 1, 1,
0.1963274, 0.6087732, 0.3381544, 0, 0.6039216, 1, 1,
0.1982067, -0.4719649, 3.034635, 0, 0.5960785, 1, 1,
0.2003088, 0.2519333, 3.029774, 0, 0.5921569, 1, 1,
0.2078694, 0.6974816, 0.8782287, 0, 0.5843138, 1, 1,
0.2087577, 1.188042, 0.08845852, 0, 0.5803922, 1, 1,
0.2100108, -0.3458692, 3.425918, 0, 0.572549, 1, 1,
0.2152133, 0.04623396, 1.145447, 0, 0.5686275, 1, 1,
0.2154432, -0.6621186, 1.276292, 0, 0.5607843, 1, 1,
0.2154985, -0.161534, 0.8795079, 0, 0.5568628, 1, 1,
0.2175247, 1.432879, 0.6235182, 0, 0.5490196, 1, 1,
0.2178203, -0.3070615, 3.515665, 0, 0.5450981, 1, 1,
0.2242043, -0.2167366, 1.639855, 0, 0.5372549, 1, 1,
0.2262675, -1.289952, 2.277804, 0, 0.5333334, 1, 1,
0.2313159, -0.1729771, 0.7117727, 0, 0.5254902, 1, 1,
0.2385533, 0.2127437, 1.228129, 0, 0.5215687, 1, 1,
0.2402313, -0.02317087, 1.023788, 0, 0.5137255, 1, 1,
0.2437991, -0.8942381, 2.334548, 0, 0.509804, 1, 1,
0.2460983, -0.336852, 1.83351, 0, 0.5019608, 1, 1,
0.2576153, -1.813515, 2.560152, 0, 0.4941176, 1, 1,
0.2579971, -2.483296, 4.012078, 0, 0.4901961, 1, 1,
0.2591406, -0.04207614, -1.041645, 0, 0.4823529, 1, 1,
0.2593256, -0.7385893, 4.02216, 0, 0.4784314, 1, 1,
0.2635103, 0.5543976, 1.168735, 0, 0.4705882, 1, 1,
0.2637249, 0.4792018, 0.376325, 0, 0.4666667, 1, 1,
0.2665591, -0.2431696, 3.298286, 0, 0.4588235, 1, 1,
0.2670966, 0.3063283, 0.8888934, 0, 0.454902, 1, 1,
0.2670989, 1.462854, 1.5181, 0, 0.4470588, 1, 1,
0.2678875, -1.920966, 3.42476, 0, 0.4431373, 1, 1,
0.2716119, 1.580285, -0.9793992, 0, 0.4352941, 1, 1,
0.271689, 0.2960834, -0.6519517, 0, 0.4313726, 1, 1,
0.2723721, 1.156121, -0.9160105, 0, 0.4235294, 1, 1,
0.2737708, -0.3501243, 2.828296, 0, 0.4196078, 1, 1,
0.2800004, -0.436542, 1.865802, 0, 0.4117647, 1, 1,
0.2820824, -0.5937656, 3.66719, 0, 0.4078431, 1, 1,
0.286924, 0.9640182, 1.085429, 0, 0.4, 1, 1,
0.2945011, 1.332152, 0.9013676, 0, 0.3921569, 1, 1,
0.2990987, 0.1621509, 2.253422, 0, 0.3882353, 1, 1,
0.3006724, 0.7249067, -0.645598, 0, 0.3803922, 1, 1,
0.301402, -1.650825, 3.172552, 0, 0.3764706, 1, 1,
0.310824, -1.165789, 3.333759, 0, 0.3686275, 1, 1,
0.3111006, 1.365319, -0.1805324, 0, 0.3647059, 1, 1,
0.314476, 1.238107, -0.2646677, 0, 0.3568628, 1, 1,
0.3161984, -0.02367765, 1.336883, 0, 0.3529412, 1, 1,
0.3182312, -1.018797, 2.869785, 0, 0.345098, 1, 1,
0.3216592, -1.455968, 4.45558, 0, 0.3411765, 1, 1,
0.3252411, 0.4394762, 1.246451, 0, 0.3333333, 1, 1,
0.3266328, 0.4242798, -0.5676402, 0, 0.3294118, 1, 1,
0.3276921, 0.3166203, 0.1535544, 0, 0.3215686, 1, 1,
0.3278582, -0.05045948, 0.5826675, 0, 0.3176471, 1, 1,
0.3320056, -2.332442, 3.933808, 0, 0.3098039, 1, 1,
0.3331196, -0.3344889, 1.43389, 0, 0.3058824, 1, 1,
0.3344582, -1.106388, 2.035793, 0, 0.2980392, 1, 1,
0.3348697, 1.387594, 0.224225, 0, 0.2901961, 1, 1,
0.338564, -0.07148951, 2.007191, 0, 0.2862745, 1, 1,
0.3408014, 0.09443294, 0.7634279, 0, 0.2784314, 1, 1,
0.3464836, 1.191471, 0.03287239, 0, 0.2745098, 1, 1,
0.3509486, 0.9069421, 0.09524875, 0, 0.2666667, 1, 1,
0.3551209, 1.000553, -0.9395697, 0, 0.2627451, 1, 1,
0.3601457, 0.5285981, 0.09802621, 0, 0.254902, 1, 1,
0.3625177, -0.9259573, 0.07747148, 0, 0.2509804, 1, 1,
0.3650675, -0.9837084, 2.383843, 0, 0.2431373, 1, 1,
0.3657134, -0.1627517, 1.514482, 0, 0.2392157, 1, 1,
0.371774, 1.467888, 0.08234725, 0, 0.2313726, 1, 1,
0.3725251, -0.7287885, 2.667414, 0, 0.227451, 1, 1,
0.3732475, -0.3255018, 1.316071, 0, 0.2196078, 1, 1,
0.3783444, 0.3334007, 1.040255, 0, 0.2156863, 1, 1,
0.3790746, 0.2611527, 1.229316, 0, 0.2078431, 1, 1,
0.3811663, 0.6480182, 0.7346834, 0, 0.2039216, 1, 1,
0.3847957, -0.1575543, 0.1487556, 0, 0.1960784, 1, 1,
0.3892163, 0.05719315, 0.04636323, 0, 0.1882353, 1, 1,
0.3939922, -0.3733247, 2.909269, 0, 0.1843137, 1, 1,
0.3946782, -0.3496201, 1.756871, 0, 0.1764706, 1, 1,
0.4005094, 1.574925, 0.2418291, 0, 0.172549, 1, 1,
0.4054737, 1.309846, 1.187029, 0, 0.1647059, 1, 1,
0.4058942, -0.1349724, 2.478753, 0, 0.1607843, 1, 1,
0.410778, -0.8998404, 5.987612, 0, 0.1529412, 1, 1,
0.4182067, -0.3831268, 1.286833, 0, 0.1490196, 1, 1,
0.4183503, -0.4462661, 3.16434, 0, 0.1411765, 1, 1,
0.4184728, -0.5913793, 1.281078, 0, 0.1372549, 1, 1,
0.4187246, 0.904213, 3.691584, 0, 0.1294118, 1, 1,
0.42114, -1.230906, 2.924792, 0, 0.1254902, 1, 1,
0.4224513, 1.279601, 0.8970869, 0, 0.1176471, 1, 1,
0.4239437, -0.9963132, 3.02258, 0, 0.1137255, 1, 1,
0.4240595, 0.6310759, 0.9203313, 0, 0.1058824, 1, 1,
0.4249456, -0.5307753, 3.276008, 0, 0.09803922, 1, 1,
0.4278542, 1.428833, 1.606473, 0, 0.09411765, 1, 1,
0.4303287, -0.2370969, 2.559704, 0, 0.08627451, 1, 1,
0.4317544, -0.7340474, 2.839843, 0, 0.08235294, 1, 1,
0.4334054, -0.9749624, 3.36196, 0, 0.07450981, 1, 1,
0.4414617, -0.3925651, 0.6479691, 0, 0.07058824, 1, 1,
0.4415416, -0.5507788, 0.3384802, 0, 0.0627451, 1, 1,
0.4442524, 0.09675076, 2.044077, 0, 0.05882353, 1, 1,
0.4463377, -1.242387, 2.027292, 0, 0.05098039, 1, 1,
0.4497017, -0.4768954, 2.731167, 0, 0.04705882, 1, 1,
0.4534082, 1.342398, 0.392124, 0, 0.03921569, 1, 1,
0.462813, -0.9869705, 2.008381, 0, 0.03529412, 1, 1,
0.4736423, -0.6912068, 2.737417, 0, 0.02745098, 1, 1,
0.4752231, -1.579652, 2.548171, 0, 0.02352941, 1, 1,
0.4778407, 0.9354805, 1.302894, 0, 0.01568628, 1, 1,
0.4794898, -0.234724, 2.642988, 0, 0.01176471, 1, 1,
0.4840176, 1.04011, 0.7799972, 0, 0.003921569, 1, 1,
0.4875469, -1.187797, 2.967223, 0.003921569, 0, 1, 1,
0.4907206, 0.2412122, -0.4273307, 0.007843138, 0, 1, 1,
0.4908913, -0.8304751, 1.604232, 0.01568628, 0, 1, 1,
0.4913286, 2.550016, -0.4890726, 0.01960784, 0, 1, 1,
0.4917654, 0.3627427, 0.6328355, 0.02745098, 0, 1, 1,
0.4918684, 0.2653199, 3.127578, 0.03137255, 0, 1, 1,
0.4935483, -0.3427549, 3.396552, 0.03921569, 0, 1, 1,
0.5022277, -0.1918413, 1.785253, 0.04313726, 0, 1, 1,
0.5024524, -0.4541923, 3.391498, 0.05098039, 0, 1, 1,
0.505128, 0.8545767, 0.8969598, 0.05490196, 0, 1, 1,
0.5083935, 1.834545, 0.3039628, 0.0627451, 0, 1, 1,
0.5105778, 0.9870396, 0.5382007, 0.06666667, 0, 1, 1,
0.5247655, -1.72603, 1.802587, 0.07450981, 0, 1, 1,
0.5250305, -1.019333, 1.627997, 0.07843138, 0, 1, 1,
0.530135, 1.76957, 0.3012679, 0.08627451, 0, 1, 1,
0.5333276, -1.333147, 3.142665, 0.09019608, 0, 1, 1,
0.5342841, 1.013375, 1.082091, 0.09803922, 0, 1, 1,
0.5365517, -1.607775, 3.400035, 0.1058824, 0, 1, 1,
0.5397108, -0.6914087, 3.662936, 0.1098039, 0, 1, 1,
0.5402571, 0.2617887, 0.84706, 0.1176471, 0, 1, 1,
0.5404352, -0.9416446, 1.733067, 0.1215686, 0, 1, 1,
0.5410303, -0.4877182, 0.2450319, 0.1294118, 0, 1, 1,
0.5452018, -0.5928388, 2.43616, 0.1333333, 0, 1, 1,
0.5461046, -0.1903681, 1.745348, 0.1411765, 0, 1, 1,
0.546205, 0.09058028, 1.169328, 0.145098, 0, 1, 1,
0.5475166, 0.3774188, 1.317485, 0.1529412, 0, 1, 1,
0.5485427, 0.5002862, 1.196139, 0.1568628, 0, 1, 1,
0.5538483, 1.221334, 0.2624277, 0.1647059, 0, 1, 1,
0.5611225, 1.405495, 1.065915, 0.1686275, 0, 1, 1,
0.5611708, 0.4241921, 1.170557, 0.1764706, 0, 1, 1,
0.5622302, 0.2987719, 0.9530639, 0.1803922, 0, 1, 1,
0.5636947, -1.306982, 3.079439, 0.1882353, 0, 1, 1,
0.5639578, -0.5263662, 2.234259, 0.1921569, 0, 1, 1,
0.564867, -0.1868226, 1.66237, 0.2, 0, 1, 1,
0.5673214, 1.214112, -1.820936, 0.2078431, 0, 1, 1,
0.5677791, 1.558881, -0.08794467, 0.2117647, 0, 1, 1,
0.56933, 0.6785383, 0.9675925, 0.2196078, 0, 1, 1,
0.5700058, 1.559657, 1.187445, 0.2235294, 0, 1, 1,
0.5704356, 1.396742, 1.299739, 0.2313726, 0, 1, 1,
0.5705369, 0.0906971, 1.573161, 0.2352941, 0, 1, 1,
0.57144, 1.16681, 1.918702, 0.2431373, 0, 1, 1,
0.5790582, -0.6690552, 3.360824, 0.2470588, 0, 1, 1,
0.5827984, -1.932518, 3.941018, 0.254902, 0, 1, 1,
0.5828078, 0.06656997, 2.531553, 0.2588235, 0, 1, 1,
0.5845096, -1.242886, 2.843752, 0.2666667, 0, 1, 1,
0.5871942, -0.5482566, 3.381621, 0.2705882, 0, 1, 1,
0.5875666, -1.301358, 1.565613, 0.2784314, 0, 1, 1,
0.5876198, 0.4077389, 3.003273, 0.282353, 0, 1, 1,
0.5902331, 0.508325, 1.708838, 0.2901961, 0, 1, 1,
0.5906538, -1.394845, 2.513469, 0.2941177, 0, 1, 1,
0.5950188, -1.028657, 4.181408, 0.3019608, 0, 1, 1,
0.5961726, 0.1339199, 2.578576, 0.3098039, 0, 1, 1,
0.6008012, -1.134972, 2.942764, 0.3137255, 0, 1, 1,
0.6054146, 0.7712358, 1.728175, 0.3215686, 0, 1, 1,
0.6059419, 0.08524195, 1.434054, 0.3254902, 0, 1, 1,
0.6083807, 1.438198, 0.05377231, 0.3333333, 0, 1, 1,
0.6100104, -0.3907187, 3.029224, 0.3372549, 0, 1, 1,
0.6109295, 2.256335, 0.5778847, 0.345098, 0, 1, 1,
0.6156169, -0.8327008, 3.074394, 0.3490196, 0, 1, 1,
0.616492, 0.3598512, 0.6594262, 0.3568628, 0, 1, 1,
0.6178444, 0.3458549, 2.521248, 0.3607843, 0, 1, 1,
0.6190175, -0.3855971, 0.4712738, 0.3686275, 0, 1, 1,
0.6210985, -1.456718, 2.590803, 0.372549, 0, 1, 1,
0.6262003, 0.8977087, 1.09893, 0.3803922, 0, 1, 1,
0.6267601, 0.5402797, 2.312233, 0.3843137, 0, 1, 1,
0.6269795, 0.9338455, 1.284603, 0.3921569, 0, 1, 1,
0.6309744, 0.7419043, 0.9436601, 0.3960784, 0, 1, 1,
0.6357453, 0.5959687, 2.354182, 0.4039216, 0, 1, 1,
0.6370203, 0.1178317, 0.9903896, 0.4117647, 0, 1, 1,
0.6382816, 0.3590671, 1.213884, 0.4156863, 0, 1, 1,
0.6398368, 0.9949856, -0.4039946, 0.4235294, 0, 1, 1,
0.6400778, -0.7545714, 2.444436, 0.427451, 0, 1, 1,
0.6451442, -1.812619, 2.167151, 0.4352941, 0, 1, 1,
0.6463485, 0.7923415, 1.404211, 0.4392157, 0, 1, 1,
0.6468166, 0.2490825, -0.3684285, 0.4470588, 0, 1, 1,
0.6509933, 0.2050766, 0.8846447, 0.4509804, 0, 1, 1,
0.6513644, -0.5586779, 1.655151, 0.4588235, 0, 1, 1,
0.6516324, 0.4050727, 1.045873, 0.4627451, 0, 1, 1,
0.6590925, 0.2876613, 0.7055459, 0.4705882, 0, 1, 1,
0.6594684, 0.3878165, 0.2183421, 0.4745098, 0, 1, 1,
0.6629101, -0.9791428, 2.160333, 0.4823529, 0, 1, 1,
0.6646358, -2.448396, 2.932566, 0.4862745, 0, 1, 1,
0.6692408, -0.02957519, 1.749835, 0.4941176, 0, 1, 1,
0.6699166, -0.5561869, 1.464994, 0.5019608, 0, 1, 1,
0.672387, -0.6342208, 4.835743, 0.5058824, 0, 1, 1,
0.6790325, -1.681181, 4.005691, 0.5137255, 0, 1, 1,
0.6794567, -0.9003342, 3.867089, 0.5176471, 0, 1, 1,
0.6850016, 1.43575, -0.1829242, 0.5254902, 0, 1, 1,
0.6893818, -1.190034, 2.932085, 0.5294118, 0, 1, 1,
0.68968, 0.3348955, 2.042801, 0.5372549, 0, 1, 1,
0.6923257, -1.113817, 1.519325, 0.5411765, 0, 1, 1,
0.6982186, 0.2194044, 2.668588, 0.5490196, 0, 1, 1,
0.6988806, 1.192239, 1.205724, 0.5529412, 0, 1, 1,
0.6993757, -3.215425, 4.592469, 0.5607843, 0, 1, 1,
0.7019286, 0.4143471, -0.4263852, 0.5647059, 0, 1, 1,
0.7022655, 0.4280809, 0.7086761, 0.572549, 0, 1, 1,
0.7058666, -0.8529127, 1.122196, 0.5764706, 0, 1, 1,
0.7077419, 0.5568061, 0.8991591, 0.5843138, 0, 1, 1,
0.7116029, 2.958259, 0.2635698, 0.5882353, 0, 1, 1,
0.7118583, 0.007895942, 0.4777241, 0.5960785, 0, 1, 1,
0.717348, 0.3366175, 0.9303967, 0.6039216, 0, 1, 1,
0.7205685, 0.2502593, 1.327873, 0.6078432, 0, 1, 1,
0.7228321, -0.7127754, 1.282998, 0.6156863, 0, 1, 1,
0.7272553, 0.2701361, 0.0698418, 0.6196079, 0, 1, 1,
0.727955, 0.5433635, 0.2486292, 0.627451, 0, 1, 1,
0.7329577, 0.2281133, 0.1761288, 0.6313726, 0, 1, 1,
0.735776, -0.6117074, 1.971784, 0.6392157, 0, 1, 1,
0.7359669, -0.4578423, 2.849928, 0.6431373, 0, 1, 1,
0.7400251, 0.0893746, 3.273476, 0.6509804, 0, 1, 1,
0.7441261, -0.08467092, 1.559257, 0.654902, 0, 1, 1,
0.7467262, -1.396437, 2.000884, 0.6627451, 0, 1, 1,
0.7480514, -0.4255894, 3.069972, 0.6666667, 0, 1, 1,
0.7603106, 0.2464059, 2.277797, 0.6745098, 0, 1, 1,
0.7644085, -0.2883531, 1.715807, 0.6784314, 0, 1, 1,
0.767432, 0.7829456, 2.151823, 0.6862745, 0, 1, 1,
0.7780359, 1.404134, 0.847724, 0.6901961, 0, 1, 1,
0.779402, 0.2858475, 1.213305, 0.6980392, 0, 1, 1,
0.7804981, -0.01933051, 0.6356587, 0.7058824, 0, 1, 1,
0.7810195, -1.312041, 2.9766, 0.7098039, 0, 1, 1,
0.7827779, -0.9619164, 2.056343, 0.7176471, 0, 1, 1,
0.7928079, 1.351256, 1.854983, 0.7215686, 0, 1, 1,
0.7928503, 0.1145278, 2.639004, 0.7294118, 0, 1, 1,
0.7966006, -0.7492089, 0.6427264, 0.7333333, 0, 1, 1,
0.8042259, -0.4789685, 2.417535, 0.7411765, 0, 1, 1,
0.8107477, 0.05867551, 1.286226, 0.7450981, 0, 1, 1,
0.812943, 0.2844747, 2.015686, 0.7529412, 0, 1, 1,
0.8141559, 0.05586885, 1.342963, 0.7568628, 0, 1, 1,
0.8153434, -0.5847897, 3.871758, 0.7647059, 0, 1, 1,
0.8158607, -0.6431211, 2.141033, 0.7686275, 0, 1, 1,
0.8200307, -1.795726, 3.664701, 0.7764706, 0, 1, 1,
0.8209332, 1.488116, 1.342697, 0.7803922, 0, 1, 1,
0.8214235, -2.218538, 3.305443, 0.7882353, 0, 1, 1,
0.8293398, -0.8878132, 1.774677, 0.7921569, 0, 1, 1,
0.8303564, 1.143339, 1.472948, 0.8, 0, 1, 1,
0.8342401, 0.4622116, 1.260346, 0.8078431, 0, 1, 1,
0.8343321, -1.001277, 1.875296, 0.8117647, 0, 1, 1,
0.8361148, -0.6317452, 2.069335, 0.8196079, 0, 1, 1,
0.8487452, -1.248873, 3.769079, 0.8235294, 0, 1, 1,
0.8502601, -1.89943, 4.637599, 0.8313726, 0, 1, 1,
0.8508533, -1.251318, 3.348321, 0.8352941, 0, 1, 1,
0.8537487, -0.1236047, 1.7359, 0.8431373, 0, 1, 1,
0.8821008, 0.3564901, 0.8614945, 0.8470588, 0, 1, 1,
0.8823944, 1.510111, 0.4470148, 0.854902, 0, 1, 1,
0.8842104, -0.0432367, 2.576128, 0.8588235, 0, 1, 1,
0.8878142, -0.9418979, 2.866894, 0.8666667, 0, 1, 1,
0.8882309, 1.664467, 0.1452902, 0.8705882, 0, 1, 1,
0.8888608, -0.0973644, 3.738496, 0.8784314, 0, 1, 1,
0.8969622, 0.8870153, 1.399623, 0.8823529, 0, 1, 1,
0.9010985, 0.2141776, 1.393719, 0.8901961, 0, 1, 1,
0.9035218, 0.0297185, 2.009662, 0.8941177, 0, 1, 1,
0.914665, -0.3323688, 1.173444, 0.9019608, 0, 1, 1,
0.9243269, -2.230139, 3.688493, 0.9098039, 0, 1, 1,
0.9294276, 1.014985, -0.09116367, 0.9137255, 0, 1, 1,
0.929837, 0.9599917, 0.2054797, 0.9215686, 0, 1, 1,
0.9314571, -1.394551, 2.365194, 0.9254902, 0, 1, 1,
0.9315689, -1.002274, 3.90712, 0.9333333, 0, 1, 1,
0.9409953, 0.9881844, 1.751039, 0.9372549, 0, 1, 1,
0.9423373, 1.406913, 2.24345, 0.945098, 0, 1, 1,
0.9526709, -0.5503942, 2.464773, 0.9490196, 0, 1, 1,
0.9526781, 0.2033632, 1.340707, 0.9568627, 0, 1, 1,
0.9642876, -0.7385406, 2.499748, 0.9607843, 0, 1, 1,
0.9759545, 1.191835, 0.3167856, 0.9686275, 0, 1, 1,
0.9771274, -1.041243, 2.391249, 0.972549, 0, 1, 1,
0.9776822, 0.3337851, 1.463491, 0.9803922, 0, 1, 1,
0.9857095, 0.03026013, 0.9357661, 0.9843137, 0, 1, 1,
0.9865837, -0.6475891, 0.9554088, 0.9921569, 0, 1, 1,
0.9930455, 0.005059755, 1.035338, 0.9960784, 0, 1, 1,
1.003099, -2.315389, 2.251688, 1, 0, 0.9960784, 1,
1.006017, 1.740143, 2.217748, 1, 0, 0.9882353, 1,
1.006545, 1.263401, -0.1137506, 1, 0, 0.9843137, 1,
1.014767, -0.5304838, 3.418861, 1, 0, 0.9764706, 1,
1.023237, 0.7436653, 1.320765, 1, 0, 0.972549, 1,
1.023932, -2.154352, 3.704241, 1, 0, 0.9647059, 1,
1.030354, 0.003329515, 0.2434022, 1, 0, 0.9607843, 1,
1.035122, 0.03236771, 1.915954, 1, 0, 0.9529412, 1,
1.03563, -1.468679, 3.021525, 1, 0, 0.9490196, 1,
1.039354, 1.310744, 1.979143, 1, 0, 0.9411765, 1,
1.041448, 0.8372653, 0.8779847, 1, 0, 0.9372549, 1,
1.0417, 0.1132556, 3.016488, 1, 0, 0.9294118, 1,
1.049104, -0.1708448, 2.55715, 1, 0, 0.9254902, 1,
1.051541, 0.09000053, 2.266273, 1, 0, 0.9176471, 1,
1.053203, -1.304382, 2.127444, 1, 0, 0.9137255, 1,
1.077538, 0.2413508, 0.2721583, 1, 0, 0.9058824, 1,
1.078558, -0.7404533, 1.61014, 1, 0, 0.9019608, 1,
1.078642, 0.5358568, 0.6990164, 1, 0, 0.8941177, 1,
1.078809, 0.1179419, 1.611623, 1, 0, 0.8862745, 1,
1.082906, -0.3372138, -0.07562008, 1, 0, 0.8823529, 1,
1.083053, -0.2488913, 0.8055755, 1, 0, 0.8745098, 1,
1.086685, 0.746512, 1.594872, 1, 0, 0.8705882, 1,
1.09078, -1.830047, 4.432145, 1, 0, 0.8627451, 1,
1.097166, -1.754121, 2.105963, 1, 0, 0.8588235, 1,
1.100457, 0.2560103, 1.852168, 1, 0, 0.8509804, 1,
1.102521, 2.242915, 1.18282, 1, 0, 0.8470588, 1,
1.115406, -0.1710459, 1.515188, 1, 0, 0.8392157, 1,
1.115901, 0.3350496, 0.2008429, 1, 0, 0.8352941, 1,
1.116832, -0.4693053, 1.165417, 1, 0, 0.827451, 1,
1.117731, 1.251893, 0.8136321, 1, 0, 0.8235294, 1,
1.120439, -0.362747, 1.077479, 1, 0, 0.8156863, 1,
1.12235, -0.4038696, 1.995397, 1, 0, 0.8117647, 1,
1.123582, -0.1554791, 2.936659, 1, 0, 0.8039216, 1,
1.130621, -0.02474449, 1.672101, 1, 0, 0.7960784, 1,
1.143273, -2.810583, 2.594256, 1, 0, 0.7921569, 1,
1.152314, -0.04670792, 1.202804, 1, 0, 0.7843137, 1,
1.158727, -0.1562792, 1.647012, 1, 0, 0.7803922, 1,
1.158961, 1.19769, 0.9762473, 1, 0, 0.772549, 1,
1.160284, 0.7789766, 1.114018, 1, 0, 0.7686275, 1,
1.174497, 0.3425311, 1.069669, 1, 0, 0.7607843, 1,
1.175177, -1.32435, 3.117848, 1, 0, 0.7568628, 1,
1.180631, 0.08999636, 1.0949, 1, 0, 0.7490196, 1,
1.180825, 1.336973, 2.472472, 1, 0, 0.7450981, 1,
1.198765, -0.3636517, 0.1501601, 1, 0, 0.7372549, 1,
1.225308, 0.06756486, 2.353234, 1, 0, 0.7333333, 1,
1.227906, 1.056003, 0.6241003, 1, 0, 0.7254902, 1,
1.241071, 1.055223, 1.57632, 1, 0, 0.7215686, 1,
1.24246, -0.4415289, 1.347653, 1, 0, 0.7137255, 1,
1.242473, -0.7512433, 0.7610393, 1, 0, 0.7098039, 1,
1.246853, 1.017431, 0.01729994, 1, 0, 0.7019608, 1,
1.255561, 2.027427, 0.7202431, 1, 0, 0.6941177, 1,
1.256185, 1.21309, 0.3493591, 1, 0, 0.6901961, 1,
1.260123, 0.9234333, 1.391298, 1, 0, 0.682353, 1,
1.261359, 1.495957, 1.044495, 1, 0, 0.6784314, 1,
1.261654, -1.256338, 3.175594, 1, 0, 0.6705883, 1,
1.262837, -0.3365611, 2.680523, 1, 0, 0.6666667, 1,
1.264435, -0.5130125, 1.662796, 1, 0, 0.6588235, 1,
1.266595, -0.8433291, 1.198948, 1, 0, 0.654902, 1,
1.267534, 0.4003111, 2.058465, 1, 0, 0.6470588, 1,
1.267602, 0.2247181, 1.099408, 1, 0, 0.6431373, 1,
1.273117, -0.6325576, -0.2424129, 1, 0, 0.6352941, 1,
1.276146, -1.367789, 0.7994401, 1, 0, 0.6313726, 1,
1.276514, -1.701301, 1.739895, 1, 0, 0.6235294, 1,
1.286309, -0.3850995, 1.302108, 1, 0, 0.6196079, 1,
1.291317, -0.07269537, 1.939763, 1, 0, 0.6117647, 1,
1.30931, -0.8079489, 3.189605, 1, 0, 0.6078432, 1,
1.313972, 1.117643, 0.2546305, 1, 0, 0.6, 1,
1.323127, 0.4238095, 2.896325, 1, 0, 0.5921569, 1,
1.324384, 1.10409, 1.764022, 1, 0, 0.5882353, 1,
1.327791, 0.1923957, 3.243259, 1, 0, 0.5803922, 1,
1.328932, 0.06929354, 1.882095, 1, 0, 0.5764706, 1,
1.343799, 0.04723975, 3.869872, 1, 0, 0.5686275, 1,
1.343996, 0.8905861, 1.875487, 1, 0, 0.5647059, 1,
1.344658, 0.6287351, 0.1518542, 1, 0, 0.5568628, 1,
1.34997, -0.3265481, 2.71391, 1, 0, 0.5529412, 1,
1.354938, 0.9509083, 2.019788, 1, 0, 0.5450981, 1,
1.356668, -0.2615048, 0.8926683, 1, 0, 0.5411765, 1,
1.362037, 1.167386, 1.926609, 1, 0, 0.5333334, 1,
1.366262, 1.610047, -0.1241287, 1, 0, 0.5294118, 1,
1.370581, -0.193595, 1.242721, 1, 0, 0.5215687, 1,
1.375436, -0.03240417, 2.010676, 1, 0, 0.5176471, 1,
1.381557, 0.681183, 0.7948655, 1, 0, 0.509804, 1,
1.383074, -0.8284751, 4.377001, 1, 0, 0.5058824, 1,
1.395198, 0.263492, 3.063031, 1, 0, 0.4980392, 1,
1.396314, -0.5566229, 4.791296, 1, 0, 0.4901961, 1,
1.397536, 0.4872482, 0.860053, 1, 0, 0.4862745, 1,
1.397581, -0.6584525, 1.472619, 1, 0, 0.4784314, 1,
1.398296, 0.4278543, 1.713674, 1, 0, 0.4745098, 1,
1.40258, -0.112798, 0.2962754, 1, 0, 0.4666667, 1,
1.409395, -0.2812585, 1.668931, 1, 0, 0.4627451, 1,
1.409906, 0.5860878, 1.95051, 1, 0, 0.454902, 1,
1.409977, 1.241357, 2.595068, 1, 0, 0.4509804, 1,
1.418324, -0.3949738, 2.317071, 1, 0, 0.4431373, 1,
1.418626, 0.5402805, 1.230856, 1, 0, 0.4392157, 1,
1.420328, 0.5021417, 1.460272, 1, 0, 0.4313726, 1,
1.42194, -0.3894635, 1.801762, 1, 0, 0.427451, 1,
1.423158, 1.929676, 0.906079, 1, 0, 0.4196078, 1,
1.431601, 0.8729385, -0.6485775, 1, 0, 0.4156863, 1,
1.432331, -1.230497, 3.957289, 1, 0, 0.4078431, 1,
1.436519, 0.7752869, -0.4824465, 1, 0, 0.4039216, 1,
1.436552, -0.1736301, -1.551363, 1, 0, 0.3960784, 1,
1.437506, -0.07688911, 1.689687, 1, 0, 0.3882353, 1,
1.45123, -1.164134, 1.818138, 1, 0, 0.3843137, 1,
1.452673, 0.2704889, 2.370337, 1, 0, 0.3764706, 1,
1.45991, 0.5303212, 3.426961, 1, 0, 0.372549, 1,
1.484907, 1.681949, 2.847601, 1, 0, 0.3647059, 1,
1.493647, 1.547169, 1.939815, 1, 0, 0.3607843, 1,
1.494559, -0.8390056, 2.726199, 1, 0, 0.3529412, 1,
1.49581, 1.558544, 0.3496853, 1, 0, 0.3490196, 1,
1.498805, -0.5664693, 1.20512, 1, 0, 0.3411765, 1,
1.500081, 0.5900041, 2.697069, 1, 0, 0.3372549, 1,
1.509365, -0.4488928, 2.961658, 1, 0, 0.3294118, 1,
1.510385, -0.1252945, 2.95858, 1, 0, 0.3254902, 1,
1.528529, 1.387295, 0.834594, 1, 0, 0.3176471, 1,
1.530285, 0.7749702, 2.602579, 1, 0, 0.3137255, 1,
1.537997, -0.8643818, 4.043942, 1, 0, 0.3058824, 1,
1.539552, -1.142901, 1.499268, 1, 0, 0.2980392, 1,
1.543852, 0.5358502, 1.501132, 1, 0, 0.2941177, 1,
1.547855, -0.04846059, 1.285873, 1, 0, 0.2862745, 1,
1.552624, -0.1733882, 2.850002, 1, 0, 0.282353, 1,
1.559174, -0.4353105, 1.917038, 1, 0, 0.2745098, 1,
1.567602, 0.9771144, 0.5759709, 1, 0, 0.2705882, 1,
1.588667, -0.1767225, 3.162419, 1, 0, 0.2627451, 1,
1.592304, 0.8887367, 1.104555, 1, 0, 0.2588235, 1,
1.596274, 0.9520767, 1.057471, 1, 0, 0.2509804, 1,
1.603556, -0.7788349, 3.018757, 1, 0, 0.2470588, 1,
1.604714, -0.8461208, 3.611382, 1, 0, 0.2392157, 1,
1.613128, 0.73049, 0.8148254, 1, 0, 0.2352941, 1,
1.629359, 1.774851, -0.4053281, 1, 0, 0.227451, 1,
1.631469, 0.3742163, -0.4189383, 1, 0, 0.2235294, 1,
1.640729, 0.07719155, -0.202755, 1, 0, 0.2156863, 1,
1.667245, 0.5847416, 0.03237598, 1, 0, 0.2117647, 1,
1.691128, 0.6844571, 0.37147, 1, 0, 0.2039216, 1,
1.699883, -0.2539436, 2.908916, 1, 0, 0.1960784, 1,
1.713311, -1.960287, 2.944266, 1, 0, 0.1921569, 1,
1.73725, -0.133622, 0.3504684, 1, 0, 0.1843137, 1,
1.747862, -0.8972412, 1.513127, 1, 0, 0.1803922, 1,
1.773691, 0.1239667, 3.481111, 1, 0, 0.172549, 1,
1.77828, -0.09634549, 0.8498664, 1, 0, 0.1686275, 1,
1.827321, -0.09921809, 0.6976351, 1, 0, 0.1607843, 1,
1.856938, 0.5519329, 1.467501, 1, 0, 0.1568628, 1,
1.917531, 0.218579, 1.625497, 1, 0, 0.1490196, 1,
1.919972, -0.2267161, 0.6028355, 1, 0, 0.145098, 1,
1.935867, 0.01053762, 2.557645, 1, 0, 0.1372549, 1,
1.937412, 1.218452, 3.071461, 1, 0, 0.1333333, 1,
1.943899, -0.4118877, 2.118861, 1, 0, 0.1254902, 1,
1.999797, -0.6339976, 1.224357, 1, 0, 0.1215686, 1,
2.001287, -1.242456, 3.087713, 1, 0, 0.1137255, 1,
2.008818, 0.804361, 1.808532, 1, 0, 0.1098039, 1,
2.015305, -1.009887, 2.797558, 1, 0, 0.1019608, 1,
2.022519, 1.129198, 0.8907991, 1, 0, 0.09411765, 1,
2.029164, 1.042564, 1.026157, 1, 0, 0.09019608, 1,
2.097247, 1.173958, 1.87747, 1, 0, 0.08235294, 1,
2.105284, 0.6848059, 0.5184914, 1, 0, 0.07843138, 1,
2.106717, 0.5628061, 2.38698, 1, 0, 0.07058824, 1,
2.138743, 1.239052, 1.340664, 1, 0, 0.06666667, 1,
2.182806, 1.220535, 0.05215618, 1, 0, 0.05882353, 1,
2.206276, 1.786911, -0.7356059, 1, 0, 0.05490196, 1,
2.218238, -0.7703819, 1.713359, 1, 0, 0.04705882, 1,
2.289343, 1.199142, 0.7153492, 1, 0, 0.04313726, 1,
2.467108, -0.07145907, 0.263992, 1, 0, 0.03529412, 1,
2.496993, -0.05391765, 3.446157, 1, 0, 0.03137255, 1,
2.520589, 1.407022, 0.8555046, 1, 0, 0.02352941, 1,
2.922341, -0.4781529, -0.3233609, 1, 0, 0.01960784, 1,
3.185169, 0.9248145, 1.031137, 1, 0, 0.01176471, 1,
3.191403, -0.08645669, 1.11996, 1, 0, 0.007843138, 1
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
-0.2227442, -4.491287, -7.705613, 0, -0.5, 0.5, 0.5,
-0.2227442, -4.491287, -7.705613, 1, -0.5, 0.5, 0.5,
-0.2227442, -4.491287, -7.705613, 1, 1.5, 0.5, 0.5,
-0.2227442, -4.491287, -7.705613, 0, 1.5, 0.5, 0.5
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
-4.794288, -0.2266687, -7.705613, 0, -0.5, 0.5, 0.5,
-4.794288, -0.2266687, -7.705613, 1, -0.5, 0.5, 0.5,
-4.794288, -0.2266687, -7.705613, 1, 1.5, 0.5, 0.5,
-4.794288, -0.2266687, -7.705613, 0, 1.5, 0.5, 0.5
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
-4.794288, -4.491287, 0.1333044, 0, -0.5, 0.5, 0.5,
-4.794288, -4.491287, 0.1333044, 1, -0.5, 0.5, 0.5,
-4.794288, -4.491287, 0.1333044, 1, 1.5, 0.5, 0.5,
-4.794288, -4.491287, 0.1333044, 0, 1.5, 0.5, 0.5
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
-3, -3.507144, -5.896632,
3, -3.507144, -5.896632,
-3, -3.507144, -5.896632,
-3, -3.671168, -6.198129,
-2, -3.507144, -5.896632,
-2, -3.671168, -6.198129,
-1, -3.507144, -5.896632,
-1, -3.671168, -6.198129,
0, -3.507144, -5.896632,
0, -3.671168, -6.198129,
1, -3.507144, -5.896632,
1, -3.671168, -6.198129,
2, -3.507144, -5.896632,
2, -3.671168, -6.198129,
3, -3.507144, -5.896632,
3, -3.671168, -6.198129
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
-3, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
-3, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
-3, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
-3, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
-2, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
-2, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
-2, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
-2, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
-1, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
-1, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
-1, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
-1, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
0, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
0, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
0, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
0, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
1, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
1, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
1, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
1, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
2, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
2, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
2, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
2, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5,
3, -3.999215, -6.801123, 0, -0.5, 0.5, 0.5,
3, -3.999215, -6.801123, 1, -0.5, 0.5, 0.5,
3, -3.999215, -6.801123, 1, 1.5, 0.5, 0.5,
3, -3.999215, -6.801123, 0, 1.5, 0.5, 0.5
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
-3.739316, -3, -5.896632,
-3.739316, 2, -5.896632,
-3.739316, -3, -5.896632,
-3.915145, -3, -6.198129,
-3.739316, -2, -5.896632,
-3.915145, -2, -6.198129,
-3.739316, -1, -5.896632,
-3.915145, -1, -6.198129,
-3.739316, 0, -5.896632,
-3.915145, 0, -6.198129,
-3.739316, 1, -5.896632,
-3.915145, 1, -6.198129,
-3.739316, 2, -5.896632,
-3.915145, 2, -6.198129
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
-4.266802, -3, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, -3, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, -3, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, -3, -6.801123, 0, 1.5, 0.5, 0.5,
-4.266802, -2, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, -2, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, -2, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, -2, -6.801123, 0, 1.5, 0.5, 0.5,
-4.266802, -1, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, -1, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, -1, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, -1, -6.801123, 0, 1.5, 0.5, 0.5,
-4.266802, 0, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, 0, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, 0, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, 0, -6.801123, 0, 1.5, 0.5, 0.5,
-4.266802, 1, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, 1, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, 1, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, 1, -6.801123, 0, 1.5, 0.5, 0.5,
-4.266802, 2, -6.801123, 0, -0.5, 0.5, 0.5,
-4.266802, 2, -6.801123, 1, -0.5, 0.5, 0.5,
-4.266802, 2, -6.801123, 1, 1.5, 0.5, 0.5,
-4.266802, 2, -6.801123, 0, 1.5, 0.5, 0.5
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
-3.739316, -3.507144, -4,
-3.739316, -3.507144, 4,
-3.739316, -3.507144, -4,
-3.915145, -3.671168, -4,
-3.739316, -3.507144, -2,
-3.915145, -3.671168, -2,
-3.739316, -3.507144, 0,
-3.915145, -3.671168, 0,
-3.739316, -3.507144, 2,
-3.915145, -3.671168, 2,
-3.739316, -3.507144, 4,
-3.915145, -3.671168, 4
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
-4.266802, -3.999215, -4, 0, -0.5, 0.5, 0.5,
-4.266802, -3.999215, -4, 1, -0.5, 0.5, 0.5,
-4.266802, -3.999215, -4, 1, 1.5, 0.5, 0.5,
-4.266802, -3.999215, -4, 0, 1.5, 0.5, 0.5,
-4.266802, -3.999215, -2, 0, -0.5, 0.5, 0.5,
-4.266802, -3.999215, -2, 1, -0.5, 0.5, 0.5,
-4.266802, -3.999215, -2, 1, 1.5, 0.5, 0.5,
-4.266802, -3.999215, -2, 0, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 0, 0, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 0, 1, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 0, 1, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 0, 0, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 2, 0, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 2, 1, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 2, 1, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 2, 0, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 4, 0, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 4, 1, -0.5, 0.5, 0.5,
-4.266802, -3.999215, 4, 1, 1.5, 0.5, 0.5,
-4.266802, -3.999215, 4, 0, 1.5, 0.5, 0.5
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
-3.739316, -3.507144, -5.896632,
-3.739316, 3.053807, -5.896632,
-3.739316, -3.507144, 6.163241,
-3.739316, 3.053807, 6.163241,
-3.739316, -3.507144, -5.896632,
-3.739316, -3.507144, 6.163241,
-3.739316, 3.053807, -5.896632,
-3.739316, 3.053807, 6.163241,
-3.739316, -3.507144, -5.896632,
3.293828, -3.507144, -5.896632,
-3.739316, -3.507144, 6.163241,
3.293828, -3.507144, 6.163241,
-3.739316, 3.053807, -5.896632,
3.293828, 3.053807, -5.896632,
-3.739316, 3.053807, 6.163241,
3.293828, 3.053807, 6.163241,
3.293828, -3.507144, -5.896632,
3.293828, 3.053807, -5.896632,
3.293828, -3.507144, 6.163241,
3.293828, 3.053807, 6.163241,
3.293828, -3.507144, -5.896632,
3.293828, -3.507144, 6.163241,
3.293828, 3.053807, -5.896632,
3.293828, 3.053807, 6.163241
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
var radius = 8.237016;
var distance = 36.64741;
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
mvMatrix.translate( 0.2227442, 0.2266687, -0.1333044 );
mvMatrix.scale( 1.266293, 1.357429, 0.738484 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.64741);
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
silafluofen<-read.table("silafluofen.xyz")
```

```
## Error in read.table("silafluofen.xyz"): no lines available in input
```

```r
x<-silafluofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
y<-silafluofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
```

```r
z<-silafluofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'silafluofen' not found
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
-3.636892, -0.7220805, -1.60606, 0, 0, 1, 1, 1,
-3.155021, 0.3592851, -1.869113, 1, 0, 0, 1, 1,
-2.555199, 1.482918, -3.192739, 1, 0, 0, 1, 1,
-2.481358, -0.1541145, -1.38039, 1, 0, 0, 1, 1,
-2.468171, -0.6323061, -0.9055449, 1, 0, 0, 1, 1,
-2.407527, -1.513769, -1.96718, 1, 0, 0, 1, 1,
-2.357701, -0.740159, -2.293775, 0, 0, 0, 1, 1,
-2.29354, -1.104046, -1.338808, 0, 0, 0, 1, 1,
-2.236669, -0.6264821, -2.008811, 0, 0, 0, 1, 1,
-2.217386, -1.701182, -1.222939, 0, 0, 0, 1, 1,
-2.191014, 0.8160401, -0.6034805, 0, 0, 0, 1, 1,
-2.14773, -0.259429, -1.51423, 0, 0, 0, 1, 1,
-2.141301, -0.8564436, -2.863549, 0, 0, 0, 1, 1,
-2.140208, 0.03651921, -1.287486, 1, 1, 1, 1, 1,
-2.134134, -1.099894, -1.275897, 1, 1, 1, 1, 1,
-2.101081, 0.4329849, -1.496847, 1, 1, 1, 1, 1,
-2.092025, -0.3637127, -2.348677, 1, 1, 1, 1, 1,
-2.077883, -1.875537, -3.989247, 1, 1, 1, 1, 1,
-2.041738, 0.6625552, 0.4977642, 1, 1, 1, 1, 1,
-2.031481, -0.4248624, -2.802491, 1, 1, 1, 1, 1,
-2.023772, 0.8781426, -2.473446, 1, 1, 1, 1, 1,
-2.01128, 0.09886279, -1.324954, 1, 1, 1, 1, 1,
-1.983147, -0.5882746, -1.001969, 1, 1, 1, 1, 1,
-1.980864, 0.2164575, -2.254163, 1, 1, 1, 1, 1,
-1.97901, 0.7517325, -0.408045, 1, 1, 1, 1, 1,
-1.965816, -0.2264453, -3.200983, 1, 1, 1, 1, 1,
-1.953481, -1.792797, -1.310339, 1, 1, 1, 1, 1,
-1.946188, -1.58544, -2.095689, 1, 1, 1, 1, 1,
-1.943116, 0.6360977, -2.0843, 0, 0, 1, 1, 1,
-1.942951, -0.08397015, -1.935342, 1, 0, 0, 1, 1,
-1.940525, 1.459396, -0.3370736, 1, 0, 0, 1, 1,
-1.91174, 0.2792497, -0.6489527, 1, 0, 0, 1, 1,
-1.910152, -1.263228, -1.735484, 1, 0, 0, 1, 1,
-1.90741, -0.634782, 0.9323612, 1, 0, 0, 1, 1,
-1.8996, -0.1150385, -2.601742, 0, 0, 0, 1, 1,
-1.896743, 2.164323, -1.241645, 0, 0, 0, 1, 1,
-1.885152, 1.546281, -0.8491416, 0, 0, 0, 1, 1,
-1.861282, -0.7002797, -1.829738, 0, 0, 0, 1, 1,
-1.856774, 0.5702828, -1.154399, 0, 0, 0, 1, 1,
-1.831548, 2.011327, -1.628358, 0, 0, 0, 1, 1,
-1.830055, -0.3594888, 0.1162152, 0, 0, 0, 1, 1,
-1.751054, -1.89346, -2.447257, 1, 1, 1, 1, 1,
-1.750077, 0.1138782, 0.4419798, 1, 1, 1, 1, 1,
-1.705559, 0.2741294, -0.6970936, 1, 1, 1, 1, 1,
-1.693131, 1.003119, -0.1495058, 1, 1, 1, 1, 1,
-1.679301, 0.1364888, -2.924579, 1, 1, 1, 1, 1,
-1.659271, 0.4178718, -2.078136, 1, 1, 1, 1, 1,
-1.634463, -1.314327, -3.059183, 1, 1, 1, 1, 1,
-1.605693, -0.8331192, -2.72268, 1, 1, 1, 1, 1,
-1.604561, 0.7332939, -1.341175, 1, 1, 1, 1, 1,
-1.603563, -0.2702924, -2.185946, 1, 1, 1, 1, 1,
-1.602772, -0.1157833, -2.36171, 1, 1, 1, 1, 1,
-1.571555, -0.0672634, -1.500129, 1, 1, 1, 1, 1,
-1.570766, -0.01042118, -1.985576, 1, 1, 1, 1, 1,
-1.56125, -0.4118584, -2.89786, 1, 1, 1, 1, 1,
-1.547882, -0.0653292, -0.8287981, 1, 1, 1, 1, 1,
-1.545586, -0.4767345, -0.8777514, 0, 0, 1, 1, 1,
-1.540075, -1.210242, -3.358578, 1, 0, 0, 1, 1,
-1.531143, 0.4123223, -1.530792, 1, 0, 0, 1, 1,
-1.525785, -0.503038, -1.504422, 1, 0, 0, 1, 1,
-1.5235, -1.277593, -2.023743, 1, 0, 0, 1, 1,
-1.516381, -1.41446, -1.259132, 1, 0, 0, 1, 1,
-1.47929, -1.283913, -1.605398, 0, 0, 0, 1, 1,
-1.458905, -0.6211868, -3.936297, 0, 0, 0, 1, 1,
-1.447964, 0.2440027, 0.1917791, 0, 0, 0, 1, 1,
-1.446663, 1.685906, -0.4608126, 0, 0, 0, 1, 1,
-1.444288, -0.9589549, -1.729012, 0, 0, 0, 1, 1,
-1.441332, 0.9006616, -0.3796869, 0, 0, 0, 1, 1,
-1.439569, 0.5344306, -0.2172066, 0, 0, 0, 1, 1,
-1.431671, -0.6277678, -0.808226, 1, 1, 1, 1, 1,
-1.430051, -1.022446, -1.640975, 1, 1, 1, 1, 1,
-1.429774, 0.01574211, -0.4471163, 1, 1, 1, 1, 1,
-1.424083, -0.385784, -2.052689, 1, 1, 1, 1, 1,
-1.421047, 1.445169, 0.9283492, 1, 1, 1, 1, 1,
-1.412929, 0.4410818, -1.61133, 1, 1, 1, 1, 1,
-1.412705, 0.7502494, -0.9943396, 1, 1, 1, 1, 1,
-1.409995, -1.351673, -1.564466, 1, 1, 1, 1, 1,
-1.393764, 0.2040079, -3.026755, 1, 1, 1, 1, 1,
-1.382346, 0.3011272, -0.5533968, 1, 1, 1, 1, 1,
-1.379919, 1.437821, -0.8266568, 1, 1, 1, 1, 1,
-1.364326, -0.8738697, -2.654466, 1, 1, 1, 1, 1,
-1.353239, 0.9170009, 0.7202625, 1, 1, 1, 1, 1,
-1.346011, 0.00813795, -1.54935, 1, 1, 1, 1, 1,
-1.343038, 0.9049199, -2.187539, 1, 1, 1, 1, 1,
-1.334374, -1.538872, -3.830996, 0, 0, 1, 1, 1,
-1.331649, 0.388725, -3.163492, 1, 0, 0, 1, 1,
-1.331529, -1.326153, -2.393044, 1, 0, 0, 1, 1,
-1.330275, -0.7185243, -1.95644, 1, 0, 0, 1, 1,
-1.312648, 0.8688927, -1.926359, 1, 0, 0, 1, 1,
-1.307676, 1.410415, -1.496684, 1, 0, 0, 1, 1,
-1.285945, -0.4772425, -2.872835, 0, 0, 0, 1, 1,
-1.281637, -0.8939906, -3.036885, 0, 0, 0, 1, 1,
-1.275376, 1.739455, -1.456009, 0, 0, 0, 1, 1,
-1.274304, -0.2518673, 0.2910518, 0, 0, 0, 1, 1,
-1.274078, 0.8272804, -0.9827612, 0, 0, 0, 1, 1,
-1.268869, -0.4593211, 0.185793, 0, 0, 0, 1, 1,
-1.268392, 1.495475, 0.126862, 0, 0, 0, 1, 1,
-1.256032, -0.4662401, -1.048166, 1, 1, 1, 1, 1,
-1.250463, -1.972314, -2.256653, 1, 1, 1, 1, 1,
-1.248625, -0.4557061, -1.888769, 1, 1, 1, 1, 1,
-1.247106, -0.4942815, -1.580908, 1, 1, 1, 1, 1,
-1.237313, -0.2836423, -1.696985, 1, 1, 1, 1, 1,
-1.227278, -1.308134, 0.3855797, 1, 1, 1, 1, 1,
-1.226695, 2.577204, 0.1827463, 1, 1, 1, 1, 1,
-1.219629, -0.3183444, 0.005890496, 1, 1, 1, 1, 1,
-1.21759, 0.4934768, 0.61846, 1, 1, 1, 1, 1,
-1.215133, -0.9155164, -0.9477459, 1, 1, 1, 1, 1,
-1.209555, 0.5916106, -0.4658648, 1, 1, 1, 1, 1,
-1.209083, 0.1004419, -1.053709, 1, 1, 1, 1, 1,
-1.206747, -0.9884337, -0.9130324, 1, 1, 1, 1, 1,
-1.193035, 0.8803746, 0.10879, 1, 1, 1, 1, 1,
-1.182045, 2.13419, 0.09402534, 1, 1, 1, 1, 1,
-1.170929, -0.439829, -1.047271, 0, 0, 1, 1, 1,
-1.170569, 1.106671, -2.113422, 1, 0, 0, 1, 1,
-1.164194, 0.4865296, 0.2986099, 1, 0, 0, 1, 1,
-1.15673, -0.2700902, -2.094205, 1, 0, 0, 1, 1,
-1.155048, -1.36289, -1.77108, 1, 0, 0, 1, 1,
-1.152028, 0.1734452, 0.4473624, 1, 0, 0, 1, 1,
-1.148436, -1.58702, -2.931963, 0, 0, 0, 1, 1,
-1.143034, 0.6909415, -1.27695, 0, 0, 0, 1, 1,
-1.138854, 2.202516, -1.265141, 0, 0, 0, 1, 1,
-1.138485, 1.48527, -0.3710668, 0, 0, 0, 1, 1,
-1.127705, 0.1926429, -0.4453652, 0, 0, 0, 1, 1,
-1.127013, -1.116109, -2.212002, 0, 0, 0, 1, 1,
-1.126743, 0.6591074, -1.837512, 0, 0, 0, 1, 1,
-1.124572, 1.415824, -1.227906, 1, 1, 1, 1, 1,
-1.120915, -0.3668589, -1.38402, 1, 1, 1, 1, 1,
-1.113757, -0.3105478, -1.622962, 1, 1, 1, 1, 1,
-1.110425, -1.808416, -2.487899, 1, 1, 1, 1, 1,
-1.106189, -0.667886, -2.366012, 1, 1, 1, 1, 1,
-1.099797, -0.5537226, -4.493055, 1, 1, 1, 1, 1,
-1.094334, 0.252865, 1.035926, 1, 1, 1, 1, 1,
-1.08838, 0.2752487, -2.075861, 1, 1, 1, 1, 1,
-1.076526, 0.4970257, 1.264107, 1, 1, 1, 1, 1,
-1.069436, 1.470553, -3.166471, 1, 1, 1, 1, 1,
-1.068082, 1.851042, -1.948807, 1, 1, 1, 1, 1,
-1.067425, 0.3352594, -1.462011, 1, 1, 1, 1, 1,
-1.064842, -1.864435, -2.382635, 1, 1, 1, 1, 1,
-1.050098, 0.1413923, -0.4910759, 1, 1, 1, 1, 1,
-1.048455, -1.423645, -2.15514, 1, 1, 1, 1, 1,
-1.038666, -1.48897, -2.592418, 0, 0, 1, 1, 1,
-1.024314, -1.591825, -4.391905, 1, 0, 0, 1, 1,
-1.023076, -0.1021742, -3.194834, 1, 0, 0, 1, 1,
-1.018706, -1.763614, -2.365971, 1, 0, 0, 1, 1,
-1.017926, -0.5636138, -2.903684, 1, 0, 0, 1, 1,
-1.010117, 0.6865468, 0.7259661, 1, 0, 0, 1, 1,
-1.009825, 1.046325, -1.468973, 0, 0, 0, 1, 1,
-1.008984, -0.1588125, -2.702383, 0, 0, 0, 1, 1,
-1.008091, -1.465458, -2.579524, 0, 0, 0, 1, 1,
-0.9976281, -0.5377811, -1.745342, 0, 0, 0, 1, 1,
-0.9975197, 0.06550844, -1.864338, 0, 0, 0, 1, 1,
-0.9963414, -1.987228, -2.946702, 0, 0, 0, 1, 1,
-0.9947679, 0.3715708, -1.167565, 0, 0, 0, 1, 1,
-0.9929027, 0.3327301, -1.698729, 1, 1, 1, 1, 1,
-0.9928954, 1.495858, -1.946916, 1, 1, 1, 1, 1,
-0.9917626, 0.770761, -1.544796, 1, 1, 1, 1, 1,
-0.9787564, 0.231503, -1.465424, 1, 1, 1, 1, 1,
-0.9780558, -1.399087, -4.483991, 1, 1, 1, 1, 1,
-0.9747366, 0.03822818, -3.677605, 1, 1, 1, 1, 1,
-0.9742665, 0.1602502, -2.911569, 1, 1, 1, 1, 1,
-0.9722294, -0.8615866, -1.338799, 1, 1, 1, 1, 1,
-0.9565579, 2.164952, -0.7341404, 1, 1, 1, 1, 1,
-0.9548129, 0.1288904, -1.629918, 1, 1, 1, 1, 1,
-0.954344, -0.7169341, -1.890281, 1, 1, 1, 1, 1,
-0.9507648, 0.685803, 0.1543992, 1, 1, 1, 1, 1,
-0.9416102, 0.8126501, -2.020405, 1, 1, 1, 1, 1,
-0.9408042, -0.5206885, -0.6189818, 1, 1, 1, 1, 1,
-0.9378424, 0.6968886, -1.852373, 1, 1, 1, 1, 1,
-0.9349461, 1.479814, -1.283957, 0, 0, 1, 1, 1,
-0.9322869, 0.5722772, -2.223491, 1, 0, 0, 1, 1,
-0.9317856, 0.01864703, -0.9944301, 1, 0, 0, 1, 1,
-0.922233, 0.7434483, -0.1755422, 1, 0, 0, 1, 1,
-0.9203758, -0.7950462, -2.032212, 1, 0, 0, 1, 1,
-0.9193339, 0.2031165, -1.99679, 1, 0, 0, 1, 1,
-0.9187875, 1.28899, -1.817618, 0, 0, 0, 1, 1,
-0.9047394, 0.1987284, -0.3934923, 0, 0, 0, 1, 1,
-0.9018556, -0.31163, -4.163241, 0, 0, 0, 1, 1,
-0.8908255, -0.8138648, -1.711779, 0, 0, 0, 1, 1,
-0.8898713, -1.659963, -2.303247, 0, 0, 0, 1, 1,
-0.8893033, 0.07405091, -3.056105, 0, 0, 0, 1, 1,
-0.8887752, 0.9264259, -0.4125614, 0, 0, 0, 1, 1,
-0.8850287, 2.652184, -1.071748, 1, 1, 1, 1, 1,
-0.883123, 0.3674428, -1.960063, 1, 1, 1, 1, 1,
-0.882336, -1.097865, -3.644439, 1, 1, 1, 1, 1,
-0.8782642, -0.1819965, -0.8935919, 1, 1, 1, 1, 1,
-0.877394, -0.7788923, -2.529804, 1, 1, 1, 1, 1,
-0.8773612, -0.8241921, -1.596287, 1, 1, 1, 1, 1,
-0.8704226, -0.656719, -2.285753, 1, 1, 1, 1, 1,
-0.8693592, 0.3407137, -0.3626128, 1, 1, 1, 1, 1,
-0.8675801, -0.2064239, -3.431504, 1, 1, 1, 1, 1,
-0.8646499, 0.3838264, 0.5122547, 1, 1, 1, 1, 1,
-0.8646334, -0.7841552, -1.187683, 1, 1, 1, 1, 1,
-0.8639132, 0.1815997, -1.411667, 1, 1, 1, 1, 1,
-0.8612951, 2.046458, -0.7123165, 1, 1, 1, 1, 1,
-0.8604406, 1.515376, 0.576761, 1, 1, 1, 1, 1,
-0.8580473, -0.06560752, -1.313783, 1, 1, 1, 1, 1,
-0.8561123, 0.6813108, -0.4724053, 0, 0, 1, 1, 1,
-0.8543777, -0.3042159, -1.648085, 1, 0, 0, 1, 1,
-0.8538056, 0.3000266, -1.861815, 1, 0, 0, 1, 1,
-0.8506214, 1.58108, 0.5400234, 1, 0, 0, 1, 1,
-0.8499088, -1.739261, -1.905154, 1, 0, 0, 1, 1,
-0.8469154, -1.171056, -2.33557, 1, 0, 0, 1, 1,
-0.8464254, -0.6756178, -2.208166, 0, 0, 0, 1, 1,
-0.8449363, 1.850461, 0.102216, 0, 0, 0, 1, 1,
-0.8362935, 0.7370428, -1.889243, 0, 0, 0, 1, 1,
-0.8335206, 0.01051913, -2.156119, 0, 0, 0, 1, 1,
-0.8288199, -0.5911004, -2.300897, 0, 0, 0, 1, 1,
-0.8256154, -0.8548232, -2.541955, 0, 0, 0, 1, 1,
-0.8214641, 1.022179, -2.174269, 0, 0, 0, 1, 1,
-0.8187765, -0.06525923, -1.12133, 1, 1, 1, 1, 1,
-0.8140873, 0.03002165, -2.429139, 1, 1, 1, 1, 1,
-0.8137949, -0.3691356, -0.8916201, 1, 1, 1, 1, 1,
-0.8133355, 1.08369, -1.418125, 1, 1, 1, 1, 1,
-0.8130621, 0.2320989, -2.038514, 1, 1, 1, 1, 1,
-0.8097752, -1.156229, -2.402633, 1, 1, 1, 1, 1,
-0.8045488, 0.4783739, -1.836998, 1, 1, 1, 1, 1,
-0.7929162, -1.015254, -2.518862, 1, 1, 1, 1, 1,
-0.7854125, 0.2881335, -0.3121778, 1, 1, 1, 1, 1,
-0.7828658, -0.5505245, -2.791903, 1, 1, 1, 1, 1,
-0.7752952, 0.7544743, -0.2373921, 1, 1, 1, 1, 1,
-0.7741688, 1.128942, -0.1906987, 1, 1, 1, 1, 1,
-0.773401, 0.861579, 0.003359319, 1, 1, 1, 1, 1,
-0.7661865, -0.903434, -1.23325, 1, 1, 1, 1, 1,
-0.7647073, -0.8214005, -2.071396, 1, 1, 1, 1, 1,
-0.7634288, 0.970881, -0.8062761, 0, 0, 1, 1, 1,
-0.7616061, 0.4054078, -2.61439, 1, 0, 0, 1, 1,
-0.7571187, 0.9970018, -1.972364, 1, 0, 0, 1, 1,
-0.7536477, -0.8866258, -1.268257, 1, 0, 0, 1, 1,
-0.7475643, 0.2511916, -1.337346, 1, 0, 0, 1, 1,
-0.7458894, 1.382704, -2.249221, 1, 0, 0, 1, 1,
-0.7364591, -0.2667584, -2.246005, 0, 0, 0, 1, 1,
-0.7353035, 0.4333543, -1.042148, 0, 0, 0, 1, 1,
-0.7340459, 0.06075035, 0.658993, 0, 0, 0, 1, 1,
-0.7277749, -0.2692585, -2.821039, 0, 0, 0, 1, 1,
-0.7270763, -0.7511793, -1.684003, 0, 0, 0, 1, 1,
-0.7206793, -1.427845, -2.889412, 0, 0, 0, 1, 1,
-0.7163481, 0.1804734, -0.5379314, 0, 0, 0, 1, 1,
-0.7118642, 0.1435442, -2.616671, 1, 1, 1, 1, 1,
-0.7105389, 0.464596, 0.5076449, 1, 1, 1, 1, 1,
-0.707563, 0.547493, 0.8317392, 1, 1, 1, 1, 1,
-0.7016035, -1.220277, -2.0964, 1, 1, 1, 1, 1,
-0.6991788, 2.049887, 0.3331189, 1, 1, 1, 1, 1,
-0.698707, -1.287998, -2.891521, 1, 1, 1, 1, 1,
-0.6929291, -1.565109, -3.348548, 1, 1, 1, 1, 1,
-0.6924847, 0.07934389, 0.5124771, 1, 1, 1, 1, 1,
-0.6909058, 1.877726, 0.2193055, 1, 1, 1, 1, 1,
-0.6866063, -0.7574612, -2.785495, 1, 1, 1, 1, 1,
-0.6850426, 1.214918, 0.1064725, 1, 1, 1, 1, 1,
-0.6826106, 1.791931, 1.137562, 1, 1, 1, 1, 1,
-0.6798556, -1.965496, -3.36051, 1, 1, 1, 1, 1,
-0.6739282, -0.5763041, -1.792256, 1, 1, 1, 1, 1,
-0.6683354, -0.1625719, -2.759579, 1, 1, 1, 1, 1,
-0.6659199, 0.5637965, 0.6879969, 0, 0, 1, 1, 1,
-0.6622131, 0.2125651, -0.2337084, 1, 0, 0, 1, 1,
-0.6579897, 1.603692, -1.209982, 1, 0, 0, 1, 1,
-0.6579189, -0.9432004, -1.861532, 1, 0, 0, 1, 1,
-0.6566339, 0.06146812, 0.3880022, 1, 0, 0, 1, 1,
-0.6565343, 1.227479, 1.316989, 1, 0, 0, 1, 1,
-0.6555451, 1.03108, 0.1484295, 0, 0, 0, 1, 1,
-0.6489595, 0.9127271, -1.50834, 0, 0, 0, 1, 1,
-0.6448976, 0.04835117, -1.202351, 0, 0, 0, 1, 1,
-0.6445132, 1.877357, -2.619698, 0, 0, 0, 1, 1,
-0.6443083, 1.064226, 0.2091211, 0, 0, 0, 1, 1,
-0.6394753, 0.8646445, -1.511401, 0, 0, 0, 1, 1,
-0.6346548, -0.3536508, -2.921397, 0, 0, 0, 1, 1,
-0.630915, 0.140928, -0.2501055, 1, 1, 1, 1, 1,
-0.6237251, 0.9419823, 1.225569, 1, 1, 1, 1, 1,
-0.6227134, 0.7390538, 0.2506542, 1, 1, 1, 1, 1,
-0.6216922, -0.7391627, -2.60746, 1, 1, 1, 1, 1,
-0.6202075, 0.4035097, 1.127085, 1, 1, 1, 1, 1,
-0.6200766, 0.1682982, -1.185909, 1, 1, 1, 1, 1,
-0.6186901, 0.324359, -1.454451, 1, 1, 1, 1, 1,
-0.6173139, 0.5246897, -0.5937741, 1, 1, 1, 1, 1,
-0.6164888, 1.1761, -1.72972, 1, 1, 1, 1, 1,
-0.6151741, -1.63861, -4.049333, 1, 1, 1, 1, 1,
-0.6130779, 1.756858, -1.650886, 1, 1, 1, 1, 1,
-0.6086739, 1.631367, -0.3116389, 1, 1, 1, 1, 1,
-0.6070048, 1.55291, 0.3539525, 1, 1, 1, 1, 1,
-0.6028779, -1.542343, -3.266176, 1, 1, 1, 1, 1,
-0.6010337, 1.019674, 2.837832, 1, 1, 1, 1, 1,
-0.6000636, 0.01513788, -1.90161, 0, 0, 1, 1, 1,
-0.5930532, 0.0675857, -1.15396, 1, 0, 0, 1, 1,
-0.5920662, 0.122302, 0.7960333, 1, 0, 0, 1, 1,
-0.5909737, 0.284736, -1.450263, 1, 0, 0, 1, 1,
-0.5854279, 0.02420847, -1.651401, 1, 0, 0, 1, 1,
-0.5768487, 0.8235417, -2.329592, 1, 0, 0, 1, 1,
-0.5739891, -0.7468938, -3.451828, 0, 0, 0, 1, 1,
-0.5691976, 0.3668524, -1.153275, 0, 0, 0, 1, 1,
-0.5661327, 0.5870664, 0.1653542, 0, 0, 0, 1, 1,
-0.563543, -1.129341, -3.152607, 0, 0, 0, 1, 1,
-0.5605227, -0.1414127, -2.008758, 0, 0, 0, 1, 1,
-0.5588859, 0.1209187, -0.6446894, 0, 0, 0, 1, 1,
-0.5539499, -0.7778959, -1.101092, 0, 0, 0, 1, 1,
-0.5506722, 1.777618, -1.406476, 1, 1, 1, 1, 1,
-0.5483179, 1.78748, -0.1774981, 1, 1, 1, 1, 1,
-0.5475353, -1.664967, -4.472323, 1, 1, 1, 1, 1,
-0.546934, -0.3878841, -2.38575, 1, 1, 1, 1, 1,
-0.5461675, -0.5137256, -4.225689, 1, 1, 1, 1, 1,
-0.5458455, -0.436932, -2.913857, 1, 1, 1, 1, 1,
-0.5433589, 1.597234, -2.543, 1, 1, 1, 1, 1,
-0.5433094, -0.9820374, -2.408813, 1, 1, 1, 1, 1,
-0.5370058, -1.694716, -1.154537, 1, 1, 1, 1, 1,
-0.5347822, -1.644091, -4.203006, 1, 1, 1, 1, 1,
-0.5307252, -1.665787, -3.070818, 1, 1, 1, 1, 1,
-0.529531, -1.239786, -2.657043, 1, 1, 1, 1, 1,
-0.5266741, -0.3457, -1.164859, 1, 1, 1, 1, 1,
-0.5256777, -0.3341866, -1.429665, 1, 1, 1, 1, 1,
-0.5220363, -1.261024, -3.469086, 1, 1, 1, 1, 1,
-0.5218973, 1.188475, -1.847125, 0, 0, 1, 1, 1,
-0.5093045, 0.06892502, -0.9598236, 1, 0, 0, 1, 1,
-0.5074432, 0.4728636, -0.4845162, 1, 0, 0, 1, 1,
-0.5067468, 0.5878375, -0.9915197, 1, 0, 0, 1, 1,
-0.503961, -0.6240309, -2.754666, 1, 0, 0, 1, 1,
-0.5039598, -1.452866, -1.854339, 1, 0, 0, 1, 1,
-0.5038098, -0.08642425, -0.3829261, 0, 0, 0, 1, 1,
-0.5004579, -1.52515, -3.70441, 0, 0, 0, 1, 1,
-0.4961362, -0.4078254, -1.550559, 0, 0, 0, 1, 1,
-0.494629, -0.5016462, -1.737532, 0, 0, 0, 1, 1,
-0.4931933, 0.5834637, -2.867326, 0, 0, 0, 1, 1,
-0.4898423, 0.916068, 0.4064483, 0, 0, 0, 1, 1,
-0.4841873, -0.01368301, -2.445893, 0, 0, 0, 1, 1,
-0.4835911, 0.725858, -0.1559413, 1, 1, 1, 1, 1,
-0.4829779, 0.3268484, 0.4755443, 1, 1, 1, 1, 1,
-0.47882, 0.6890528, -2.282219, 1, 1, 1, 1, 1,
-0.4715428, 0.3396121, -1.523993, 1, 1, 1, 1, 1,
-0.4713119, -0.5763982, -1.261611, 1, 1, 1, 1, 1,
-0.4647414, 0.6914636, -1.058122, 1, 1, 1, 1, 1,
-0.4642574, -2.129874, -4.28783, 1, 1, 1, 1, 1,
-0.4640581, 0.104875, -1.107176, 1, 1, 1, 1, 1,
-0.4635679, 1.052384, -0.03840241, 1, 1, 1, 1, 1,
-0.4598354, -0.4235597, -1.545872, 1, 1, 1, 1, 1,
-0.4579754, 0.06642073, -0.8468806, 1, 1, 1, 1, 1,
-0.4532951, -0.1484805, -2.114972, 1, 1, 1, 1, 1,
-0.4529619, 0.9906129, -0.9311323, 1, 1, 1, 1, 1,
-0.4462705, -0.3987413, -1.990925, 1, 1, 1, 1, 1,
-0.446099, -1.685532, -2.703923, 1, 1, 1, 1, 1,
-0.4430276, -0.05564061, -0.6824482, 0, 0, 1, 1, 1,
-0.4399287, -0.09190737, -1.245827, 1, 0, 0, 1, 1,
-0.4377714, -0.965748, -0.5496606, 1, 0, 0, 1, 1,
-0.437633, 0.5897753, -0.7462669, 1, 0, 0, 1, 1,
-0.4372413, -0.1266061, -2.511332, 1, 0, 0, 1, 1,
-0.4364227, 1.194624, -0.2760293, 1, 0, 0, 1, 1,
-0.4352384, 1.281279, 0.3157682, 0, 0, 0, 1, 1,
-0.4327626, 0.06121696, -0.8604618, 0, 0, 0, 1, 1,
-0.4323503, -0.07473949, -1.495139, 0, 0, 0, 1, 1,
-0.4319045, -0.006412795, -0.4878741, 0, 0, 0, 1, 1,
-0.4313065, 1.081644, -0.2774783, 0, 0, 0, 1, 1,
-0.4290814, 0.08626893, -2.40745, 0, 0, 0, 1, 1,
-0.4254565, 0.7791761, 0.3459628, 0, 0, 0, 1, 1,
-0.4231013, 0.7577315, -1.438973, 1, 1, 1, 1, 1,
-0.4202698, -0.5078838, -3.772831, 1, 1, 1, 1, 1,
-0.4104653, 1.935964, 0.7380401, 1, 1, 1, 1, 1,
-0.4036757, 0.4801776, -0.4678289, 1, 1, 1, 1, 1,
-0.394473, -0.9121494, -4.068673, 1, 1, 1, 1, 1,
-0.3933206, -0.02630418, -2.344559, 1, 1, 1, 1, 1,
-0.3929034, -1.325499, -2.066502, 1, 1, 1, 1, 1,
-0.3900993, -0.9414422, -2.739705, 1, 1, 1, 1, 1,
-0.389855, -0.2397096, -3.037803, 1, 1, 1, 1, 1,
-0.3840931, -0.6023846, -4.408943, 1, 1, 1, 1, 1,
-0.3786199, -0.3205253, -2.06192, 1, 1, 1, 1, 1,
-0.3785191, -1.250689, -2.051086, 1, 1, 1, 1, 1,
-0.3701528, 0.5709939, -0.6358989, 1, 1, 1, 1, 1,
-0.369669, -0.8199711, -1.471025, 1, 1, 1, 1, 1,
-0.3681143, 0.3954527, -1.963597, 1, 1, 1, 1, 1,
-0.3670448, -0.2205774, -2.272796, 0, 0, 1, 1, 1,
-0.3658849, 0.676055, 0.7151208, 1, 0, 0, 1, 1,
-0.3646125, 0.9047995, 0.5369262, 1, 0, 0, 1, 1,
-0.3603532, 0.8687115, -1.443904, 1, 0, 0, 1, 1,
-0.3592992, -2.32002, -4.235205, 1, 0, 0, 1, 1,
-0.3501879, 0.1393197, -0.5863543, 1, 0, 0, 1, 1,
-0.3485186, 0.4215253, -0.01234593, 0, 0, 0, 1, 1,
-0.3480797, -0.9720839, -2.116253, 0, 0, 0, 1, 1,
-0.3457088, 0.3934511, 0.6387248, 0, 0, 0, 1, 1,
-0.3451088, -1.061881, -3.987848, 0, 0, 0, 1, 1,
-0.3379093, 0.1976703, -0.3987341, 0, 0, 0, 1, 1,
-0.3356663, 0.6877522, -0.1395995, 0, 0, 0, 1, 1,
-0.3331617, -0.8127846, -2.834671, 0, 0, 0, 1, 1,
-0.3312216, -0.5253935, -2.00642, 1, 1, 1, 1, 1,
-0.3262672, -1.374268, -3.398848, 1, 1, 1, 1, 1,
-0.3258724, 0.2502057, -0.2184976, 1, 1, 1, 1, 1,
-0.3253145, 0.8275696, -0.8834916, 1, 1, 1, 1, 1,
-0.3186969, 2.056606, -0.3394916, 1, 1, 1, 1, 1,
-0.3074808, 0.8605003, -0.01487133, 1, 1, 1, 1, 1,
-0.3066176, 1.133062, 0.4533382, 1, 1, 1, 1, 1,
-0.2972621, 0.6832427, 0.194117, 1, 1, 1, 1, 1,
-0.2956316, 0.7541471, -0.04315729, 1, 1, 1, 1, 1,
-0.2790669, -0.6440635, -3.914574, 1, 1, 1, 1, 1,
-0.2729126, -0.9190667, -2.035755, 1, 1, 1, 1, 1,
-0.2650413, -0.4350947, -2.123115, 1, 1, 1, 1, 1,
-0.2628195, -0.519478, -2.469104, 1, 1, 1, 1, 1,
-0.26019, -0.1372407, -2.843708, 1, 1, 1, 1, 1,
-0.2559818, 0.243364, -0.7350867, 1, 1, 1, 1, 1,
-0.2550043, -0.5854023, -2.308884, 0, 0, 1, 1, 1,
-0.2548617, 0.4046841, -2.817154, 1, 0, 0, 1, 1,
-0.2505992, -0.24214, -4.270372, 1, 0, 0, 1, 1,
-0.2417239, -0.6377963, -3.282064, 1, 0, 0, 1, 1,
-0.2406513, -0.8291528, -3.230716, 1, 0, 0, 1, 1,
-0.2401818, 0.9622637, -0.2729446, 1, 0, 0, 1, 1,
-0.2383929, -0.01543023, -3.532913, 0, 0, 0, 1, 1,
-0.2377596, -2.058431, -2.69693, 0, 0, 0, 1, 1,
-0.2367157, -1.332372, -3.029546, 0, 0, 0, 1, 1,
-0.2354006, -1.369853, -3.17938, 0, 0, 0, 1, 1,
-0.2344, -0.0409952, -3.246095, 0, 0, 0, 1, 1,
-0.2316763, -0.3076752, -4.708424, 0, 0, 0, 1, 1,
-0.2273407, -0.2987866, -2.27348, 0, 0, 0, 1, 1,
-0.227028, 0.1788626, -1.602328, 1, 1, 1, 1, 1,
-0.2234965, 0.5171562, -0.3622177, 1, 1, 1, 1, 1,
-0.2234154, 0.830629, -0.4275337, 1, 1, 1, 1, 1,
-0.2174592, -0.3056735, -1.74137, 1, 1, 1, 1, 1,
-0.2152683, -0.5225883, -2.775828, 1, 1, 1, 1, 1,
-0.2098921, -0.9899588, -3.58754, 1, 1, 1, 1, 1,
-0.2082387, 0.918636, 0.07843751, 1, 1, 1, 1, 1,
-0.2054214, -0.08168212, -2.203986, 1, 1, 1, 1, 1,
-0.2005118, 0.2013841, -1.127462, 1, 1, 1, 1, 1,
-0.1998743, -0.8689094, -3.714175, 1, 1, 1, 1, 1,
-0.1963513, 0.9478547, 0.693241, 1, 1, 1, 1, 1,
-0.1958444, -0.04410896, -3.699511, 1, 1, 1, 1, 1,
-0.1951102, 0.3649476, -1.399338, 1, 1, 1, 1, 1,
-0.1918384, 0.8268633, -0.2676705, 1, 1, 1, 1, 1,
-0.1883996, 0.232772, 1.390547, 1, 1, 1, 1, 1,
-0.1851157, -1.00461, -1.825769, 0, 0, 1, 1, 1,
-0.1847628, 1.519841, -0.2045129, 1, 0, 0, 1, 1,
-0.1845358, 0.355565, -1.164944, 1, 0, 0, 1, 1,
-0.1774735, -0.08056789, -2.314201, 1, 0, 0, 1, 1,
-0.1774437, -0.125008, -3.182168, 1, 0, 0, 1, 1,
-0.1753134, 0.5977464, -0.1879709, 1, 0, 0, 1, 1,
-0.1719078, 1.195363, -1.409937, 0, 0, 0, 1, 1,
-0.1717345, -0.2355927, -3.715009, 0, 0, 0, 1, 1,
-0.1708229, 0.01424579, -1.742005, 0, 0, 0, 1, 1,
-0.1673571, 0.9860088, -1.66066, 0, 0, 0, 1, 1,
-0.1667876, -1.041067, -5.062318, 0, 0, 0, 1, 1,
-0.1630942, -2.164756, -2.125465, 0, 0, 0, 1, 1,
-0.1627018, -1.174726, -0.9885077, 0, 0, 0, 1, 1,
-0.1617664, -0.8809475, -2.543684, 1, 1, 1, 1, 1,
-0.1611281, -0.7535025, -1.627337, 1, 1, 1, 1, 1,
-0.1609308, -1.359028, -2.557246, 1, 1, 1, 1, 1,
-0.160523, -0.3948459, -2.515972, 1, 1, 1, 1, 1,
-0.158839, -0.9798864, -2.652813, 1, 1, 1, 1, 1,
-0.1564711, -1.643433, -5.63825, 1, 1, 1, 1, 1,
-0.15204, 1.444279, -1.74149, 1, 1, 1, 1, 1,
-0.148995, 0.9966338, 1.082277, 1, 1, 1, 1, 1,
-0.1472463, -0.457493, -3.645856, 1, 1, 1, 1, 1,
-0.1365858, 0.3467981, -1.294224, 1, 1, 1, 1, 1,
-0.1342771, 0.8062784, 1.619964, 1, 1, 1, 1, 1,
-0.131983, 0.1566947, -1.939344, 1, 1, 1, 1, 1,
-0.1306001, -0.3418829, -3.256324, 1, 1, 1, 1, 1,
-0.1290886, -1.149992, -3.124478, 1, 1, 1, 1, 1,
-0.1243287, 0.926496, -1.193086, 1, 1, 1, 1, 1,
-0.1192933, 0.745233, -0.005359629, 0, 0, 1, 1, 1,
-0.1185677, 1.408378, -0.5995111, 1, 0, 0, 1, 1,
-0.114956, -1.492381, -3.816168, 1, 0, 0, 1, 1,
-0.1116527, -0.4206626, -3.091604, 1, 0, 0, 1, 1,
-0.1052328, -0.8975875, -3.084843, 1, 0, 0, 1, 1,
-0.1037766, -0.9988173, -4.169783, 1, 0, 0, 1, 1,
-0.1010018, 1.412346, -1.048636, 0, 0, 0, 1, 1,
-0.09624889, -0.7920871, -1.299976, 0, 0, 0, 1, 1,
-0.09500626, -0.8566268, -3.386872, 0, 0, 0, 1, 1,
-0.08859017, 1.054633, -0.4848249, 0, 0, 0, 1, 1,
-0.08809102, -1.898837, -3.574933, 0, 0, 0, 1, 1,
-0.08676144, -1.152629, -2.421474, 0, 0, 0, 1, 1,
-0.08598666, 0.8182892, 0.8000963, 0, 0, 0, 1, 1,
-0.07895331, 1.677535, 1.789421, 1, 1, 1, 1, 1,
-0.07703681, 0.7453934, 1.640962, 1, 1, 1, 1, 1,
-0.07660586, -0.8996254, -2.957927, 1, 1, 1, 1, 1,
-0.07540321, -0.7037167, -3.330764, 1, 1, 1, 1, 1,
-0.07241724, -0.5592452, -2.455366, 1, 1, 1, 1, 1,
-0.06922358, 0.9739219, 0.1959427, 1, 1, 1, 1, 1,
-0.06606595, 1.221263, -1.10631, 1, 1, 1, 1, 1,
-0.06256855, -0.2428507, -3.761744, 1, 1, 1, 1, 1,
-0.0600258, 1.27019, -2.136877, 1, 1, 1, 1, 1,
-0.0600246, 0.406716, 1.220064, 1, 1, 1, 1, 1,
-0.05638961, 0.6465328, -2.474964, 1, 1, 1, 1, 1,
-0.04904348, 0.7931458, 0.6882709, 1, 1, 1, 1, 1,
-0.04789429, -2.24169, -4.105111, 1, 1, 1, 1, 1,
-0.04771659, -0.2305365, -2.683424, 1, 1, 1, 1, 1,
-0.04582587, 0.5024939, -0.3157984, 1, 1, 1, 1, 1,
-0.04551613, 0.1480635, -1.152504, 0, 0, 1, 1, 1,
-0.04446911, -1.433835, -4.559485, 1, 0, 0, 1, 1,
-0.0423745, -0.05901746, -1.899668, 1, 0, 0, 1, 1,
-0.04208647, 0.7576906, 1.364936, 1, 0, 0, 1, 1,
-0.03948336, 1.425288, 0.9501948, 1, 0, 0, 1, 1,
-0.03943681, 0.3850654, -0.5652452, 1, 0, 0, 1, 1,
-0.0374995, 0.8339879, -0.4860127, 0, 0, 0, 1, 1,
-0.03525257, -3.411596, -2.862734, 0, 0, 0, 1, 1,
-0.03269785, -2.336738, -1.93084, 0, 0, 0, 1, 1,
-0.02716041, 1.581799, -2.015073, 0, 0, 0, 1, 1,
-0.02628282, -0.9903627, -2.609635, 0, 0, 0, 1, 1,
-0.024234, 0.6423189, 0.4922594, 0, 0, 0, 1, 1,
-0.02393405, 0.7527461, -1.996059, 0, 0, 0, 1, 1,
-0.02305798, -0.1798592, -2.682938, 1, 1, 1, 1, 1,
-0.01829077, 0.2689953, -0.007522078, 1, 1, 1, 1, 1,
-0.01371131, 0.8787407, -0.957277, 1, 1, 1, 1, 1,
-0.0135882, -0.05678731, -0.1257392, 1, 1, 1, 1, 1,
-0.01016551, -1.429027, -5.721003, 1, 1, 1, 1, 1,
-0.008995154, -0.5800176, -2.985571, 1, 1, 1, 1, 1,
-0.002530541, -0.9655697, -3.644773, 1, 1, 1, 1, 1,
-0.0006711754, -0.4000158, -3.292181, 1, 1, 1, 1, 1,
0.005632073, 0.7666721, -0.8688195, 1, 1, 1, 1, 1,
0.007520183, -2.396608, 3.931736, 1, 1, 1, 1, 1,
0.00888089, 0.4921227, 0.06784409, 1, 1, 1, 1, 1,
0.009677188, -0.5585636, 4.257576, 1, 1, 1, 1, 1,
0.01212309, 0.2305474, -1.695644, 1, 1, 1, 1, 1,
0.01347192, 0.04953038, 0.5137617, 1, 1, 1, 1, 1,
0.02243847, -0.6361269, 2.893863, 1, 1, 1, 1, 1,
0.02329964, -0.3403141, 2.032264, 0, 0, 1, 1, 1,
0.02541343, 0.9634356, 0.5777428, 1, 0, 0, 1, 1,
0.02818887, -0.398973, 2.35816, 1, 0, 0, 1, 1,
0.02940487, 0.2425845, 2.032742, 1, 0, 0, 1, 1,
0.02976226, 0.2754345, -0.01875259, 1, 0, 0, 1, 1,
0.03232753, -0.5766512, 3.279217, 1, 0, 0, 1, 1,
0.03237863, -1.406504, 3.852901, 0, 0, 0, 1, 1,
0.04193911, 0.153212, 0.5148215, 0, 0, 0, 1, 1,
0.0460857, 0.3721772, -0.5132866, 0, 0, 0, 1, 1,
0.04791654, 0.6478533, 0.2419185, 0, 0, 0, 1, 1,
0.05363468, 0.7690201, 0.5924355, 0, 0, 0, 1, 1,
0.05510463, -0.3026666, 3.357305, 0, 0, 0, 1, 1,
0.05535259, -0.7720477, 3.043407, 0, 0, 0, 1, 1,
0.05863633, 1.811978, -0.2377362, 1, 1, 1, 1, 1,
0.06026614, -0.7534909, 3.702911, 1, 1, 1, 1, 1,
0.06045676, -0.5460929, 4.477528, 1, 1, 1, 1, 1,
0.06797048, 0.8525842, 0.3708553, 1, 1, 1, 1, 1,
0.07094124, -0.7890908, 5.221087, 1, 1, 1, 1, 1,
0.07358561, -0.2685958, 2.819475, 1, 1, 1, 1, 1,
0.07987384, -0.6340106, 4.206793, 1, 1, 1, 1, 1,
0.0808625, 1.321548, -0.155333, 1, 1, 1, 1, 1,
0.08112899, -0.7088929, 4.540896, 1, 1, 1, 1, 1,
0.08214266, -0.2498089, 3.722098, 1, 1, 1, 1, 1,
0.08555983, 0.05748586, -0.1832978, 1, 1, 1, 1, 1,
0.08756889, 1.036222, 1.12589, 1, 1, 1, 1, 1,
0.09014731, 0.07118021, 0.0646468, 1, 1, 1, 1, 1,
0.09822351, -1.000737, 3.557821, 1, 1, 1, 1, 1,
0.09940527, -0.5236324, 2.829651, 1, 1, 1, 1, 1,
0.102283, -0.9675311, 2.151762, 0, 0, 1, 1, 1,
0.1032224, -1.122124, 3.134583, 1, 0, 0, 1, 1,
0.1033079, -0.1953315, 3.202438, 1, 0, 0, 1, 1,
0.1069663, 1.035761, -0.3894434, 1, 0, 0, 1, 1,
0.1099712, -0.2672743, 3.074157, 1, 0, 0, 1, 1,
0.1124248, 0.2200222, 0.06129202, 1, 0, 0, 1, 1,
0.1162231, -1.211356, 1.805544, 0, 0, 0, 1, 1,
0.116253, 0.676757, 0.9538842, 0, 0, 0, 1, 1,
0.121274, -0.3361565, 1.664533, 0, 0, 0, 1, 1,
0.125828, -0.3288867, 3.815322, 0, 0, 0, 1, 1,
0.1293528, 0.185346, 0.7789633, 0, 0, 0, 1, 1,
0.1300042, -0.216062, 4.274495, 0, 0, 0, 1, 1,
0.1321611, -1.708557, 1.628007, 0, 0, 0, 1, 1,
0.1340271, -1.981619, 3.180866, 1, 1, 1, 1, 1,
0.1345735, 1.412448, -0.1825242, 1, 1, 1, 1, 1,
0.1376142, 0.7212173, -0.3521748, 1, 1, 1, 1, 1,
0.1400196, -0.2450276, 3.656643, 1, 1, 1, 1, 1,
0.1401964, -0.3305365, 2.205599, 1, 1, 1, 1, 1,
0.1410134, -0.2884459, 4.439024, 1, 1, 1, 1, 1,
0.1425434, -0.04653807, 2.473586, 1, 1, 1, 1, 1,
0.1479186, -0.4465001, 2.730149, 1, 1, 1, 1, 1,
0.1499442, 0.4397103, -1.279026, 1, 1, 1, 1, 1,
0.150984, -2.29103, 1.751032, 1, 1, 1, 1, 1,
0.1524201, 0.5697167, 0.1422189, 1, 1, 1, 1, 1,
0.1569198, -0.7264583, 3.839752, 1, 1, 1, 1, 1,
0.1591162, 0.76208, 1.073093, 1, 1, 1, 1, 1,
0.1594337, 0.5631887, 0.8725093, 1, 1, 1, 1, 1,
0.163224, 1.072633, -1.050912, 1, 1, 1, 1, 1,
0.1660119, 0.4008036, -0.7737856, 0, 0, 1, 1, 1,
0.1678526, -1.047843, 2.842525, 1, 0, 0, 1, 1,
0.1766701, 0.8234691, 1.801434, 1, 0, 0, 1, 1,
0.1786339, -1.433709, 4.339658, 1, 0, 0, 1, 1,
0.1869939, -1.026212, 3.004033, 1, 0, 0, 1, 1,
0.1924724, 1.094941, 0.6666669, 1, 0, 0, 1, 1,
0.1963274, 0.6087732, 0.3381544, 0, 0, 0, 1, 1,
0.1982067, -0.4719649, 3.034635, 0, 0, 0, 1, 1,
0.2003088, 0.2519333, 3.029774, 0, 0, 0, 1, 1,
0.2078694, 0.6974816, 0.8782287, 0, 0, 0, 1, 1,
0.2087577, 1.188042, 0.08845852, 0, 0, 0, 1, 1,
0.2100108, -0.3458692, 3.425918, 0, 0, 0, 1, 1,
0.2152133, 0.04623396, 1.145447, 0, 0, 0, 1, 1,
0.2154432, -0.6621186, 1.276292, 1, 1, 1, 1, 1,
0.2154985, -0.161534, 0.8795079, 1, 1, 1, 1, 1,
0.2175247, 1.432879, 0.6235182, 1, 1, 1, 1, 1,
0.2178203, -0.3070615, 3.515665, 1, 1, 1, 1, 1,
0.2242043, -0.2167366, 1.639855, 1, 1, 1, 1, 1,
0.2262675, -1.289952, 2.277804, 1, 1, 1, 1, 1,
0.2313159, -0.1729771, 0.7117727, 1, 1, 1, 1, 1,
0.2385533, 0.2127437, 1.228129, 1, 1, 1, 1, 1,
0.2402313, -0.02317087, 1.023788, 1, 1, 1, 1, 1,
0.2437991, -0.8942381, 2.334548, 1, 1, 1, 1, 1,
0.2460983, -0.336852, 1.83351, 1, 1, 1, 1, 1,
0.2576153, -1.813515, 2.560152, 1, 1, 1, 1, 1,
0.2579971, -2.483296, 4.012078, 1, 1, 1, 1, 1,
0.2591406, -0.04207614, -1.041645, 1, 1, 1, 1, 1,
0.2593256, -0.7385893, 4.02216, 1, 1, 1, 1, 1,
0.2635103, 0.5543976, 1.168735, 0, 0, 1, 1, 1,
0.2637249, 0.4792018, 0.376325, 1, 0, 0, 1, 1,
0.2665591, -0.2431696, 3.298286, 1, 0, 0, 1, 1,
0.2670966, 0.3063283, 0.8888934, 1, 0, 0, 1, 1,
0.2670989, 1.462854, 1.5181, 1, 0, 0, 1, 1,
0.2678875, -1.920966, 3.42476, 1, 0, 0, 1, 1,
0.2716119, 1.580285, -0.9793992, 0, 0, 0, 1, 1,
0.271689, 0.2960834, -0.6519517, 0, 0, 0, 1, 1,
0.2723721, 1.156121, -0.9160105, 0, 0, 0, 1, 1,
0.2737708, -0.3501243, 2.828296, 0, 0, 0, 1, 1,
0.2800004, -0.436542, 1.865802, 0, 0, 0, 1, 1,
0.2820824, -0.5937656, 3.66719, 0, 0, 0, 1, 1,
0.286924, 0.9640182, 1.085429, 0, 0, 0, 1, 1,
0.2945011, 1.332152, 0.9013676, 1, 1, 1, 1, 1,
0.2990987, 0.1621509, 2.253422, 1, 1, 1, 1, 1,
0.3006724, 0.7249067, -0.645598, 1, 1, 1, 1, 1,
0.301402, -1.650825, 3.172552, 1, 1, 1, 1, 1,
0.310824, -1.165789, 3.333759, 1, 1, 1, 1, 1,
0.3111006, 1.365319, -0.1805324, 1, 1, 1, 1, 1,
0.314476, 1.238107, -0.2646677, 1, 1, 1, 1, 1,
0.3161984, -0.02367765, 1.336883, 1, 1, 1, 1, 1,
0.3182312, -1.018797, 2.869785, 1, 1, 1, 1, 1,
0.3216592, -1.455968, 4.45558, 1, 1, 1, 1, 1,
0.3252411, 0.4394762, 1.246451, 1, 1, 1, 1, 1,
0.3266328, 0.4242798, -0.5676402, 1, 1, 1, 1, 1,
0.3276921, 0.3166203, 0.1535544, 1, 1, 1, 1, 1,
0.3278582, -0.05045948, 0.5826675, 1, 1, 1, 1, 1,
0.3320056, -2.332442, 3.933808, 1, 1, 1, 1, 1,
0.3331196, -0.3344889, 1.43389, 0, 0, 1, 1, 1,
0.3344582, -1.106388, 2.035793, 1, 0, 0, 1, 1,
0.3348697, 1.387594, 0.224225, 1, 0, 0, 1, 1,
0.338564, -0.07148951, 2.007191, 1, 0, 0, 1, 1,
0.3408014, 0.09443294, 0.7634279, 1, 0, 0, 1, 1,
0.3464836, 1.191471, 0.03287239, 1, 0, 0, 1, 1,
0.3509486, 0.9069421, 0.09524875, 0, 0, 0, 1, 1,
0.3551209, 1.000553, -0.9395697, 0, 0, 0, 1, 1,
0.3601457, 0.5285981, 0.09802621, 0, 0, 0, 1, 1,
0.3625177, -0.9259573, 0.07747148, 0, 0, 0, 1, 1,
0.3650675, -0.9837084, 2.383843, 0, 0, 0, 1, 1,
0.3657134, -0.1627517, 1.514482, 0, 0, 0, 1, 1,
0.371774, 1.467888, 0.08234725, 0, 0, 0, 1, 1,
0.3725251, -0.7287885, 2.667414, 1, 1, 1, 1, 1,
0.3732475, -0.3255018, 1.316071, 1, 1, 1, 1, 1,
0.3783444, 0.3334007, 1.040255, 1, 1, 1, 1, 1,
0.3790746, 0.2611527, 1.229316, 1, 1, 1, 1, 1,
0.3811663, 0.6480182, 0.7346834, 1, 1, 1, 1, 1,
0.3847957, -0.1575543, 0.1487556, 1, 1, 1, 1, 1,
0.3892163, 0.05719315, 0.04636323, 1, 1, 1, 1, 1,
0.3939922, -0.3733247, 2.909269, 1, 1, 1, 1, 1,
0.3946782, -0.3496201, 1.756871, 1, 1, 1, 1, 1,
0.4005094, 1.574925, 0.2418291, 1, 1, 1, 1, 1,
0.4054737, 1.309846, 1.187029, 1, 1, 1, 1, 1,
0.4058942, -0.1349724, 2.478753, 1, 1, 1, 1, 1,
0.410778, -0.8998404, 5.987612, 1, 1, 1, 1, 1,
0.4182067, -0.3831268, 1.286833, 1, 1, 1, 1, 1,
0.4183503, -0.4462661, 3.16434, 1, 1, 1, 1, 1,
0.4184728, -0.5913793, 1.281078, 0, 0, 1, 1, 1,
0.4187246, 0.904213, 3.691584, 1, 0, 0, 1, 1,
0.42114, -1.230906, 2.924792, 1, 0, 0, 1, 1,
0.4224513, 1.279601, 0.8970869, 1, 0, 0, 1, 1,
0.4239437, -0.9963132, 3.02258, 1, 0, 0, 1, 1,
0.4240595, 0.6310759, 0.9203313, 1, 0, 0, 1, 1,
0.4249456, -0.5307753, 3.276008, 0, 0, 0, 1, 1,
0.4278542, 1.428833, 1.606473, 0, 0, 0, 1, 1,
0.4303287, -0.2370969, 2.559704, 0, 0, 0, 1, 1,
0.4317544, -0.7340474, 2.839843, 0, 0, 0, 1, 1,
0.4334054, -0.9749624, 3.36196, 0, 0, 0, 1, 1,
0.4414617, -0.3925651, 0.6479691, 0, 0, 0, 1, 1,
0.4415416, -0.5507788, 0.3384802, 0, 0, 0, 1, 1,
0.4442524, 0.09675076, 2.044077, 1, 1, 1, 1, 1,
0.4463377, -1.242387, 2.027292, 1, 1, 1, 1, 1,
0.4497017, -0.4768954, 2.731167, 1, 1, 1, 1, 1,
0.4534082, 1.342398, 0.392124, 1, 1, 1, 1, 1,
0.462813, -0.9869705, 2.008381, 1, 1, 1, 1, 1,
0.4736423, -0.6912068, 2.737417, 1, 1, 1, 1, 1,
0.4752231, -1.579652, 2.548171, 1, 1, 1, 1, 1,
0.4778407, 0.9354805, 1.302894, 1, 1, 1, 1, 1,
0.4794898, -0.234724, 2.642988, 1, 1, 1, 1, 1,
0.4840176, 1.04011, 0.7799972, 1, 1, 1, 1, 1,
0.4875469, -1.187797, 2.967223, 1, 1, 1, 1, 1,
0.4907206, 0.2412122, -0.4273307, 1, 1, 1, 1, 1,
0.4908913, -0.8304751, 1.604232, 1, 1, 1, 1, 1,
0.4913286, 2.550016, -0.4890726, 1, 1, 1, 1, 1,
0.4917654, 0.3627427, 0.6328355, 1, 1, 1, 1, 1,
0.4918684, 0.2653199, 3.127578, 0, 0, 1, 1, 1,
0.4935483, -0.3427549, 3.396552, 1, 0, 0, 1, 1,
0.5022277, -0.1918413, 1.785253, 1, 0, 0, 1, 1,
0.5024524, -0.4541923, 3.391498, 1, 0, 0, 1, 1,
0.505128, 0.8545767, 0.8969598, 1, 0, 0, 1, 1,
0.5083935, 1.834545, 0.3039628, 1, 0, 0, 1, 1,
0.5105778, 0.9870396, 0.5382007, 0, 0, 0, 1, 1,
0.5247655, -1.72603, 1.802587, 0, 0, 0, 1, 1,
0.5250305, -1.019333, 1.627997, 0, 0, 0, 1, 1,
0.530135, 1.76957, 0.3012679, 0, 0, 0, 1, 1,
0.5333276, -1.333147, 3.142665, 0, 0, 0, 1, 1,
0.5342841, 1.013375, 1.082091, 0, 0, 0, 1, 1,
0.5365517, -1.607775, 3.400035, 0, 0, 0, 1, 1,
0.5397108, -0.6914087, 3.662936, 1, 1, 1, 1, 1,
0.5402571, 0.2617887, 0.84706, 1, 1, 1, 1, 1,
0.5404352, -0.9416446, 1.733067, 1, 1, 1, 1, 1,
0.5410303, -0.4877182, 0.2450319, 1, 1, 1, 1, 1,
0.5452018, -0.5928388, 2.43616, 1, 1, 1, 1, 1,
0.5461046, -0.1903681, 1.745348, 1, 1, 1, 1, 1,
0.546205, 0.09058028, 1.169328, 1, 1, 1, 1, 1,
0.5475166, 0.3774188, 1.317485, 1, 1, 1, 1, 1,
0.5485427, 0.5002862, 1.196139, 1, 1, 1, 1, 1,
0.5538483, 1.221334, 0.2624277, 1, 1, 1, 1, 1,
0.5611225, 1.405495, 1.065915, 1, 1, 1, 1, 1,
0.5611708, 0.4241921, 1.170557, 1, 1, 1, 1, 1,
0.5622302, 0.2987719, 0.9530639, 1, 1, 1, 1, 1,
0.5636947, -1.306982, 3.079439, 1, 1, 1, 1, 1,
0.5639578, -0.5263662, 2.234259, 1, 1, 1, 1, 1,
0.564867, -0.1868226, 1.66237, 0, 0, 1, 1, 1,
0.5673214, 1.214112, -1.820936, 1, 0, 0, 1, 1,
0.5677791, 1.558881, -0.08794467, 1, 0, 0, 1, 1,
0.56933, 0.6785383, 0.9675925, 1, 0, 0, 1, 1,
0.5700058, 1.559657, 1.187445, 1, 0, 0, 1, 1,
0.5704356, 1.396742, 1.299739, 1, 0, 0, 1, 1,
0.5705369, 0.0906971, 1.573161, 0, 0, 0, 1, 1,
0.57144, 1.16681, 1.918702, 0, 0, 0, 1, 1,
0.5790582, -0.6690552, 3.360824, 0, 0, 0, 1, 1,
0.5827984, -1.932518, 3.941018, 0, 0, 0, 1, 1,
0.5828078, 0.06656997, 2.531553, 0, 0, 0, 1, 1,
0.5845096, -1.242886, 2.843752, 0, 0, 0, 1, 1,
0.5871942, -0.5482566, 3.381621, 0, 0, 0, 1, 1,
0.5875666, -1.301358, 1.565613, 1, 1, 1, 1, 1,
0.5876198, 0.4077389, 3.003273, 1, 1, 1, 1, 1,
0.5902331, 0.508325, 1.708838, 1, 1, 1, 1, 1,
0.5906538, -1.394845, 2.513469, 1, 1, 1, 1, 1,
0.5950188, -1.028657, 4.181408, 1, 1, 1, 1, 1,
0.5961726, 0.1339199, 2.578576, 1, 1, 1, 1, 1,
0.6008012, -1.134972, 2.942764, 1, 1, 1, 1, 1,
0.6054146, 0.7712358, 1.728175, 1, 1, 1, 1, 1,
0.6059419, 0.08524195, 1.434054, 1, 1, 1, 1, 1,
0.6083807, 1.438198, 0.05377231, 1, 1, 1, 1, 1,
0.6100104, -0.3907187, 3.029224, 1, 1, 1, 1, 1,
0.6109295, 2.256335, 0.5778847, 1, 1, 1, 1, 1,
0.6156169, -0.8327008, 3.074394, 1, 1, 1, 1, 1,
0.616492, 0.3598512, 0.6594262, 1, 1, 1, 1, 1,
0.6178444, 0.3458549, 2.521248, 1, 1, 1, 1, 1,
0.6190175, -0.3855971, 0.4712738, 0, 0, 1, 1, 1,
0.6210985, -1.456718, 2.590803, 1, 0, 0, 1, 1,
0.6262003, 0.8977087, 1.09893, 1, 0, 0, 1, 1,
0.6267601, 0.5402797, 2.312233, 1, 0, 0, 1, 1,
0.6269795, 0.9338455, 1.284603, 1, 0, 0, 1, 1,
0.6309744, 0.7419043, 0.9436601, 1, 0, 0, 1, 1,
0.6357453, 0.5959687, 2.354182, 0, 0, 0, 1, 1,
0.6370203, 0.1178317, 0.9903896, 0, 0, 0, 1, 1,
0.6382816, 0.3590671, 1.213884, 0, 0, 0, 1, 1,
0.6398368, 0.9949856, -0.4039946, 0, 0, 0, 1, 1,
0.6400778, -0.7545714, 2.444436, 0, 0, 0, 1, 1,
0.6451442, -1.812619, 2.167151, 0, 0, 0, 1, 1,
0.6463485, 0.7923415, 1.404211, 0, 0, 0, 1, 1,
0.6468166, 0.2490825, -0.3684285, 1, 1, 1, 1, 1,
0.6509933, 0.2050766, 0.8846447, 1, 1, 1, 1, 1,
0.6513644, -0.5586779, 1.655151, 1, 1, 1, 1, 1,
0.6516324, 0.4050727, 1.045873, 1, 1, 1, 1, 1,
0.6590925, 0.2876613, 0.7055459, 1, 1, 1, 1, 1,
0.6594684, 0.3878165, 0.2183421, 1, 1, 1, 1, 1,
0.6629101, -0.9791428, 2.160333, 1, 1, 1, 1, 1,
0.6646358, -2.448396, 2.932566, 1, 1, 1, 1, 1,
0.6692408, -0.02957519, 1.749835, 1, 1, 1, 1, 1,
0.6699166, -0.5561869, 1.464994, 1, 1, 1, 1, 1,
0.672387, -0.6342208, 4.835743, 1, 1, 1, 1, 1,
0.6790325, -1.681181, 4.005691, 1, 1, 1, 1, 1,
0.6794567, -0.9003342, 3.867089, 1, 1, 1, 1, 1,
0.6850016, 1.43575, -0.1829242, 1, 1, 1, 1, 1,
0.6893818, -1.190034, 2.932085, 1, 1, 1, 1, 1,
0.68968, 0.3348955, 2.042801, 0, 0, 1, 1, 1,
0.6923257, -1.113817, 1.519325, 1, 0, 0, 1, 1,
0.6982186, 0.2194044, 2.668588, 1, 0, 0, 1, 1,
0.6988806, 1.192239, 1.205724, 1, 0, 0, 1, 1,
0.6993757, -3.215425, 4.592469, 1, 0, 0, 1, 1,
0.7019286, 0.4143471, -0.4263852, 1, 0, 0, 1, 1,
0.7022655, 0.4280809, 0.7086761, 0, 0, 0, 1, 1,
0.7058666, -0.8529127, 1.122196, 0, 0, 0, 1, 1,
0.7077419, 0.5568061, 0.8991591, 0, 0, 0, 1, 1,
0.7116029, 2.958259, 0.2635698, 0, 0, 0, 1, 1,
0.7118583, 0.007895942, 0.4777241, 0, 0, 0, 1, 1,
0.717348, 0.3366175, 0.9303967, 0, 0, 0, 1, 1,
0.7205685, 0.2502593, 1.327873, 0, 0, 0, 1, 1,
0.7228321, -0.7127754, 1.282998, 1, 1, 1, 1, 1,
0.7272553, 0.2701361, 0.0698418, 1, 1, 1, 1, 1,
0.727955, 0.5433635, 0.2486292, 1, 1, 1, 1, 1,
0.7329577, 0.2281133, 0.1761288, 1, 1, 1, 1, 1,
0.735776, -0.6117074, 1.971784, 1, 1, 1, 1, 1,
0.7359669, -0.4578423, 2.849928, 1, 1, 1, 1, 1,
0.7400251, 0.0893746, 3.273476, 1, 1, 1, 1, 1,
0.7441261, -0.08467092, 1.559257, 1, 1, 1, 1, 1,
0.7467262, -1.396437, 2.000884, 1, 1, 1, 1, 1,
0.7480514, -0.4255894, 3.069972, 1, 1, 1, 1, 1,
0.7603106, 0.2464059, 2.277797, 1, 1, 1, 1, 1,
0.7644085, -0.2883531, 1.715807, 1, 1, 1, 1, 1,
0.767432, 0.7829456, 2.151823, 1, 1, 1, 1, 1,
0.7780359, 1.404134, 0.847724, 1, 1, 1, 1, 1,
0.779402, 0.2858475, 1.213305, 1, 1, 1, 1, 1,
0.7804981, -0.01933051, 0.6356587, 0, 0, 1, 1, 1,
0.7810195, -1.312041, 2.9766, 1, 0, 0, 1, 1,
0.7827779, -0.9619164, 2.056343, 1, 0, 0, 1, 1,
0.7928079, 1.351256, 1.854983, 1, 0, 0, 1, 1,
0.7928503, 0.1145278, 2.639004, 1, 0, 0, 1, 1,
0.7966006, -0.7492089, 0.6427264, 1, 0, 0, 1, 1,
0.8042259, -0.4789685, 2.417535, 0, 0, 0, 1, 1,
0.8107477, 0.05867551, 1.286226, 0, 0, 0, 1, 1,
0.812943, 0.2844747, 2.015686, 0, 0, 0, 1, 1,
0.8141559, 0.05586885, 1.342963, 0, 0, 0, 1, 1,
0.8153434, -0.5847897, 3.871758, 0, 0, 0, 1, 1,
0.8158607, -0.6431211, 2.141033, 0, 0, 0, 1, 1,
0.8200307, -1.795726, 3.664701, 0, 0, 0, 1, 1,
0.8209332, 1.488116, 1.342697, 1, 1, 1, 1, 1,
0.8214235, -2.218538, 3.305443, 1, 1, 1, 1, 1,
0.8293398, -0.8878132, 1.774677, 1, 1, 1, 1, 1,
0.8303564, 1.143339, 1.472948, 1, 1, 1, 1, 1,
0.8342401, 0.4622116, 1.260346, 1, 1, 1, 1, 1,
0.8343321, -1.001277, 1.875296, 1, 1, 1, 1, 1,
0.8361148, -0.6317452, 2.069335, 1, 1, 1, 1, 1,
0.8487452, -1.248873, 3.769079, 1, 1, 1, 1, 1,
0.8502601, -1.89943, 4.637599, 1, 1, 1, 1, 1,
0.8508533, -1.251318, 3.348321, 1, 1, 1, 1, 1,
0.8537487, -0.1236047, 1.7359, 1, 1, 1, 1, 1,
0.8821008, 0.3564901, 0.8614945, 1, 1, 1, 1, 1,
0.8823944, 1.510111, 0.4470148, 1, 1, 1, 1, 1,
0.8842104, -0.0432367, 2.576128, 1, 1, 1, 1, 1,
0.8878142, -0.9418979, 2.866894, 1, 1, 1, 1, 1,
0.8882309, 1.664467, 0.1452902, 0, 0, 1, 1, 1,
0.8888608, -0.0973644, 3.738496, 1, 0, 0, 1, 1,
0.8969622, 0.8870153, 1.399623, 1, 0, 0, 1, 1,
0.9010985, 0.2141776, 1.393719, 1, 0, 0, 1, 1,
0.9035218, 0.0297185, 2.009662, 1, 0, 0, 1, 1,
0.914665, -0.3323688, 1.173444, 1, 0, 0, 1, 1,
0.9243269, -2.230139, 3.688493, 0, 0, 0, 1, 1,
0.9294276, 1.014985, -0.09116367, 0, 0, 0, 1, 1,
0.929837, 0.9599917, 0.2054797, 0, 0, 0, 1, 1,
0.9314571, -1.394551, 2.365194, 0, 0, 0, 1, 1,
0.9315689, -1.002274, 3.90712, 0, 0, 0, 1, 1,
0.9409953, 0.9881844, 1.751039, 0, 0, 0, 1, 1,
0.9423373, 1.406913, 2.24345, 0, 0, 0, 1, 1,
0.9526709, -0.5503942, 2.464773, 1, 1, 1, 1, 1,
0.9526781, 0.2033632, 1.340707, 1, 1, 1, 1, 1,
0.9642876, -0.7385406, 2.499748, 1, 1, 1, 1, 1,
0.9759545, 1.191835, 0.3167856, 1, 1, 1, 1, 1,
0.9771274, -1.041243, 2.391249, 1, 1, 1, 1, 1,
0.9776822, 0.3337851, 1.463491, 1, 1, 1, 1, 1,
0.9857095, 0.03026013, 0.9357661, 1, 1, 1, 1, 1,
0.9865837, -0.6475891, 0.9554088, 1, 1, 1, 1, 1,
0.9930455, 0.005059755, 1.035338, 1, 1, 1, 1, 1,
1.003099, -2.315389, 2.251688, 1, 1, 1, 1, 1,
1.006017, 1.740143, 2.217748, 1, 1, 1, 1, 1,
1.006545, 1.263401, -0.1137506, 1, 1, 1, 1, 1,
1.014767, -0.5304838, 3.418861, 1, 1, 1, 1, 1,
1.023237, 0.7436653, 1.320765, 1, 1, 1, 1, 1,
1.023932, -2.154352, 3.704241, 1, 1, 1, 1, 1,
1.030354, 0.003329515, 0.2434022, 0, 0, 1, 1, 1,
1.035122, 0.03236771, 1.915954, 1, 0, 0, 1, 1,
1.03563, -1.468679, 3.021525, 1, 0, 0, 1, 1,
1.039354, 1.310744, 1.979143, 1, 0, 0, 1, 1,
1.041448, 0.8372653, 0.8779847, 1, 0, 0, 1, 1,
1.0417, 0.1132556, 3.016488, 1, 0, 0, 1, 1,
1.049104, -0.1708448, 2.55715, 0, 0, 0, 1, 1,
1.051541, 0.09000053, 2.266273, 0, 0, 0, 1, 1,
1.053203, -1.304382, 2.127444, 0, 0, 0, 1, 1,
1.077538, 0.2413508, 0.2721583, 0, 0, 0, 1, 1,
1.078558, -0.7404533, 1.61014, 0, 0, 0, 1, 1,
1.078642, 0.5358568, 0.6990164, 0, 0, 0, 1, 1,
1.078809, 0.1179419, 1.611623, 0, 0, 0, 1, 1,
1.082906, -0.3372138, -0.07562008, 1, 1, 1, 1, 1,
1.083053, -0.2488913, 0.8055755, 1, 1, 1, 1, 1,
1.086685, 0.746512, 1.594872, 1, 1, 1, 1, 1,
1.09078, -1.830047, 4.432145, 1, 1, 1, 1, 1,
1.097166, -1.754121, 2.105963, 1, 1, 1, 1, 1,
1.100457, 0.2560103, 1.852168, 1, 1, 1, 1, 1,
1.102521, 2.242915, 1.18282, 1, 1, 1, 1, 1,
1.115406, -0.1710459, 1.515188, 1, 1, 1, 1, 1,
1.115901, 0.3350496, 0.2008429, 1, 1, 1, 1, 1,
1.116832, -0.4693053, 1.165417, 1, 1, 1, 1, 1,
1.117731, 1.251893, 0.8136321, 1, 1, 1, 1, 1,
1.120439, -0.362747, 1.077479, 1, 1, 1, 1, 1,
1.12235, -0.4038696, 1.995397, 1, 1, 1, 1, 1,
1.123582, -0.1554791, 2.936659, 1, 1, 1, 1, 1,
1.130621, -0.02474449, 1.672101, 1, 1, 1, 1, 1,
1.143273, -2.810583, 2.594256, 0, 0, 1, 1, 1,
1.152314, -0.04670792, 1.202804, 1, 0, 0, 1, 1,
1.158727, -0.1562792, 1.647012, 1, 0, 0, 1, 1,
1.158961, 1.19769, 0.9762473, 1, 0, 0, 1, 1,
1.160284, 0.7789766, 1.114018, 1, 0, 0, 1, 1,
1.174497, 0.3425311, 1.069669, 1, 0, 0, 1, 1,
1.175177, -1.32435, 3.117848, 0, 0, 0, 1, 1,
1.180631, 0.08999636, 1.0949, 0, 0, 0, 1, 1,
1.180825, 1.336973, 2.472472, 0, 0, 0, 1, 1,
1.198765, -0.3636517, 0.1501601, 0, 0, 0, 1, 1,
1.225308, 0.06756486, 2.353234, 0, 0, 0, 1, 1,
1.227906, 1.056003, 0.6241003, 0, 0, 0, 1, 1,
1.241071, 1.055223, 1.57632, 0, 0, 0, 1, 1,
1.24246, -0.4415289, 1.347653, 1, 1, 1, 1, 1,
1.242473, -0.7512433, 0.7610393, 1, 1, 1, 1, 1,
1.246853, 1.017431, 0.01729994, 1, 1, 1, 1, 1,
1.255561, 2.027427, 0.7202431, 1, 1, 1, 1, 1,
1.256185, 1.21309, 0.3493591, 1, 1, 1, 1, 1,
1.260123, 0.9234333, 1.391298, 1, 1, 1, 1, 1,
1.261359, 1.495957, 1.044495, 1, 1, 1, 1, 1,
1.261654, -1.256338, 3.175594, 1, 1, 1, 1, 1,
1.262837, -0.3365611, 2.680523, 1, 1, 1, 1, 1,
1.264435, -0.5130125, 1.662796, 1, 1, 1, 1, 1,
1.266595, -0.8433291, 1.198948, 1, 1, 1, 1, 1,
1.267534, 0.4003111, 2.058465, 1, 1, 1, 1, 1,
1.267602, 0.2247181, 1.099408, 1, 1, 1, 1, 1,
1.273117, -0.6325576, -0.2424129, 1, 1, 1, 1, 1,
1.276146, -1.367789, 0.7994401, 1, 1, 1, 1, 1,
1.276514, -1.701301, 1.739895, 0, 0, 1, 1, 1,
1.286309, -0.3850995, 1.302108, 1, 0, 0, 1, 1,
1.291317, -0.07269537, 1.939763, 1, 0, 0, 1, 1,
1.30931, -0.8079489, 3.189605, 1, 0, 0, 1, 1,
1.313972, 1.117643, 0.2546305, 1, 0, 0, 1, 1,
1.323127, 0.4238095, 2.896325, 1, 0, 0, 1, 1,
1.324384, 1.10409, 1.764022, 0, 0, 0, 1, 1,
1.327791, 0.1923957, 3.243259, 0, 0, 0, 1, 1,
1.328932, 0.06929354, 1.882095, 0, 0, 0, 1, 1,
1.343799, 0.04723975, 3.869872, 0, 0, 0, 1, 1,
1.343996, 0.8905861, 1.875487, 0, 0, 0, 1, 1,
1.344658, 0.6287351, 0.1518542, 0, 0, 0, 1, 1,
1.34997, -0.3265481, 2.71391, 0, 0, 0, 1, 1,
1.354938, 0.9509083, 2.019788, 1, 1, 1, 1, 1,
1.356668, -0.2615048, 0.8926683, 1, 1, 1, 1, 1,
1.362037, 1.167386, 1.926609, 1, 1, 1, 1, 1,
1.366262, 1.610047, -0.1241287, 1, 1, 1, 1, 1,
1.370581, -0.193595, 1.242721, 1, 1, 1, 1, 1,
1.375436, -0.03240417, 2.010676, 1, 1, 1, 1, 1,
1.381557, 0.681183, 0.7948655, 1, 1, 1, 1, 1,
1.383074, -0.8284751, 4.377001, 1, 1, 1, 1, 1,
1.395198, 0.263492, 3.063031, 1, 1, 1, 1, 1,
1.396314, -0.5566229, 4.791296, 1, 1, 1, 1, 1,
1.397536, 0.4872482, 0.860053, 1, 1, 1, 1, 1,
1.397581, -0.6584525, 1.472619, 1, 1, 1, 1, 1,
1.398296, 0.4278543, 1.713674, 1, 1, 1, 1, 1,
1.40258, -0.112798, 0.2962754, 1, 1, 1, 1, 1,
1.409395, -0.2812585, 1.668931, 1, 1, 1, 1, 1,
1.409906, 0.5860878, 1.95051, 0, 0, 1, 1, 1,
1.409977, 1.241357, 2.595068, 1, 0, 0, 1, 1,
1.418324, -0.3949738, 2.317071, 1, 0, 0, 1, 1,
1.418626, 0.5402805, 1.230856, 1, 0, 0, 1, 1,
1.420328, 0.5021417, 1.460272, 1, 0, 0, 1, 1,
1.42194, -0.3894635, 1.801762, 1, 0, 0, 1, 1,
1.423158, 1.929676, 0.906079, 0, 0, 0, 1, 1,
1.431601, 0.8729385, -0.6485775, 0, 0, 0, 1, 1,
1.432331, -1.230497, 3.957289, 0, 0, 0, 1, 1,
1.436519, 0.7752869, -0.4824465, 0, 0, 0, 1, 1,
1.436552, -0.1736301, -1.551363, 0, 0, 0, 1, 1,
1.437506, -0.07688911, 1.689687, 0, 0, 0, 1, 1,
1.45123, -1.164134, 1.818138, 0, 0, 0, 1, 1,
1.452673, 0.2704889, 2.370337, 1, 1, 1, 1, 1,
1.45991, 0.5303212, 3.426961, 1, 1, 1, 1, 1,
1.484907, 1.681949, 2.847601, 1, 1, 1, 1, 1,
1.493647, 1.547169, 1.939815, 1, 1, 1, 1, 1,
1.494559, -0.8390056, 2.726199, 1, 1, 1, 1, 1,
1.49581, 1.558544, 0.3496853, 1, 1, 1, 1, 1,
1.498805, -0.5664693, 1.20512, 1, 1, 1, 1, 1,
1.500081, 0.5900041, 2.697069, 1, 1, 1, 1, 1,
1.509365, -0.4488928, 2.961658, 1, 1, 1, 1, 1,
1.510385, -0.1252945, 2.95858, 1, 1, 1, 1, 1,
1.528529, 1.387295, 0.834594, 1, 1, 1, 1, 1,
1.530285, 0.7749702, 2.602579, 1, 1, 1, 1, 1,
1.537997, -0.8643818, 4.043942, 1, 1, 1, 1, 1,
1.539552, -1.142901, 1.499268, 1, 1, 1, 1, 1,
1.543852, 0.5358502, 1.501132, 1, 1, 1, 1, 1,
1.547855, -0.04846059, 1.285873, 0, 0, 1, 1, 1,
1.552624, -0.1733882, 2.850002, 1, 0, 0, 1, 1,
1.559174, -0.4353105, 1.917038, 1, 0, 0, 1, 1,
1.567602, 0.9771144, 0.5759709, 1, 0, 0, 1, 1,
1.588667, -0.1767225, 3.162419, 1, 0, 0, 1, 1,
1.592304, 0.8887367, 1.104555, 1, 0, 0, 1, 1,
1.596274, 0.9520767, 1.057471, 0, 0, 0, 1, 1,
1.603556, -0.7788349, 3.018757, 0, 0, 0, 1, 1,
1.604714, -0.8461208, 3.611382, 0, 0, 0, 1, 1,
1.613128, 0.73049, 0.8148254, 0, 0, 0, 1, 1,
1.629359, 1.774851, -0.4053281, 0, 0, 0, 1, 1,
1.631469, 0.3742163, -0.4189383, 0, 0, 0, 1, 1,
1.640729, 0.07719155, -0.202755, 0, 0, 0, 1, 1,
1.667245, 0.5847416, 0.03237598, 1, 1, 1, 1, 1,
1.691128, 0.6844571, 0.37147, 1, 1, 1, 1, 1,
1.699883, -0.2539436, 2.908916, 1, 1, 1, 1, 1,
1.713311, -1.960287, 2.944266, 1, 1, 1, 1, 1,
1.73725, -0.133622, 0.3504684, 1, 1, 1, 1, 1,
1.747862, -0.8972412, 1.513127, 1, 1, 1, 1, 1,
1.773691, 0.1239667, 3.481111, 1, 1, 1, 1, 1,
1.77828, -0.09634549, 0.8498664, 1, 1, 1, 1, 1,
1.827321, -0.09921809, 0.6976351, 1, 1, 1, 1, 1,
1.856938, 0.5519329, 1.467501, 1, 1, 1, 1, 1,
1.917531, 0.218579, 1.625497, 1, 1, 1, 1, 1,
1.919972, -0.2267161, 0.6028355, 1, 1, 1, 1, 1,
1.935867, 0.01053762, 2.557645, 1, 1, 1, 1, 1,
1.937412, 1.218452, 3.071461, 1, 1, 1, 1, 1,
1.943899, -0.4118877, 2.118861, 1, 1, 1, 1, 1,
1.999797, -0.6339976, 1.224357, 0, 0, 1, 1, 1,
2.001287, -1.242456, 3.087713, 1, 0, 0, 1, 1,
2.008818, 0.804361, 1.808532, 1, 0, 0, 1, 1,
2.015305, -1.009887, 2.797558, 1, 0, 0, 1, 1,
2.022519, 1.129198, 0.8907991, 1, 0, 0, 1, 1,
2.029164, 1.042564, 1.026157, 1, 0, 0, 1, 1,
2.097247, 1.173958, 1.87747, 0, 0, 0, 1, 1,
2.105284, 0.6848059, 0.5184914, 0, 0, 0, 1, 1,
2.106717, 0.5628061, 2.38698, 0, 0, 0, 1, 1,
2.138743, 1.239052, 1.340664, 0, 0, 0, 1, 1,
2.182806, 1.220535, 0.05215618, 0, 0, 0, 1, 1,
2.206276, 1.786911, -0.7356059, 0, 0, 0, 1, 1,
2.218238, -0.7703819, 1.713359, 0, 0, 0, 1, 1,
2.289343, 1.199142, 0.7153492, 1, 1, 1, 1, 1,
2.467108, -0.07145907, 0.263992, 1, 1, 1, 1, 1,
2.496993, -0.05391765, 3.446157, 1, 1, 1, 1, 1,
2.520589, 1.407022, 0.8555046, 1, 1, 1, 1, 1,
2.922341, -0.4781529, -0.3233609, 1, 1, 1, 1, 1,
3.185169, 0.9248145, 1.031137, 1, 1, 1, 1, 1,
3.191403, -0.08645669, 1.11996, 1, 1, 1, 1, 1
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
var radius = 10.08046;
var distance = 35.40718;
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
mvMatrix.translate( 0.2227442, 0.2266687, -0.1333044 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.40718);
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
