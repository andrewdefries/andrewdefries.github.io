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
-3.37229, -0.6133736, -2.015757, 1, 0, 0, 1,
-2.883448, -0.588974, -2.074665, 1, 0.007843138, 0, 1,
-2.823942, -0.004179914, -1.376716, 1, 0.01176471, 0, 1,
-2.586477, 1.887903, -0.480822, 1, 0.01960784, 0, 1,
-2.335825, 2.062376, -0.721173, 1, 0.02352941, 0, 1,
-2.305033, -1.558525, -2.263557, 1, 0.03137255, 0, 1,
-2.279503, 1.216224, -1.684857, 1, 0.03529412, 0, 1,
-2.257355, -1.190607, -2.313996, 1, 0.04313726, 0, 1,
-2.253302, -1.147414, -3.067677, 1, 0.04705882, 0, 1,
-2.25307, -0.1204471, -1.823789, 1, 0.05490196, 0, 1,
-2.237885, -0.5021183, -1.858571, 1, 0.05882353, 0, 1,
-2.20798, -1.27028, -1.190119, 1, 0.06666667, 0, 1,
-2.198033, -0.01890305, -2.752695, 1, 0.07058824, 0, 1,
-2.191609, -1.371419, -2.29017, 1, 0.07843138, 0, 1,
-2.189745, -0.9171364, -1.645299, 1, 0.08235294, 0, 1,
-2.161065, -0.2376576, -1.69609, 1, 0.09019608, 0, 1,
-2.159316, 1.75705, 0.5439946, 1, 0.09411765, 0, 1,
-2.156207, 0.01823002, -1.897206, 1, 0.1019608, 0, 1,
-2.134781, 0.131128, -2.459573, 1, 0.1098039, 0, 1,
-2.117749, 0.1143296, -0.4549289, 1, 0.1137255, 0, 1,
-2.113173, -0.4809746, -1.775557, 1, 0.1215686, 0, 1,
-2.10631, -0.6348611, -1.375834, 1, 0.1254902, 0, 1,
-2.077492, 1.760011, -2.63816, 1, 0.1333333, 0, 1,
-2.046368, 1.146038, 0.8437207, 1, 0.1372549, 0, 1,
-2.007285, 1.510895, 0.05286362, 1, 0.145098, 0, 1,
-1.951394, 0.3491824, -2.41561, 1, 0.1490196, 0, 1,
-1.927194, -0.7251263, -1.526606, 1, 0.1568628, 0, 1,
-1.901178, -0.3977563, -0.655327, 1, 0.1607843, 0, 1,
-1.900017, 0.7809334, -1.308463, 1, 0.1686275, 0, 1,
-1.891984, -1.222652, -2.015637, 1, 0.172549, 0, 1,
-1.851268, -1.229412, -3.354048, 1, 0.1803922, 0, 1,
-1.823151, -0.3701736, -0.4248229, 1, 0.1843137, 0, 1,
-1.808157, -0.9353039, -3.495286, 1, 0.1921569, 0, 1,
-1.804132, -1.807693, -0.5206663, 1, 0.1960784, 0, 1,
-1.803063, -0.1871455, -1.199872, 1, 0.2039216, 0, 1,
-1.800206, -1.353867, -2.502109, 1, 0.2117647, 0, 1,
-1.792473, 0.1519069, -1.20184, 1, 0.2156863, 0, 1,
-1.782598, -0.09627601, -0.2393188, 1, 0.2235294, 0, 1,
-1.732261, 0.5411506, -1.324241, 1, 0.227451, 0, 1,
-1.709348, 0.8439351, -0.4990422, 1, 0.2352941, 0, 1,
-1.705261, -0.9783918, -2.437433, 1, 0.2392157, 0, 1,
-1.688258, -1.044371, -3.166214, 1, 0.2470588, 0, 1,
-1.684355, -0.1410891, -1.428726, 1, 0.2509804, 0, 1,
-1.641109, 0.05526605, -1.778916, 1, 0.2588235, 0, 1,
-1.639316, 0.6533894, -1.331451, 1, 0.2627451, 0, 1,
-1.637808, 0.3914139, -1.552711, 1, 0.2705882, 0, 1,
-1.630971, 2.168527, -0.4097377, 1, 0.2745098, 0, 1,
-1.630047, 1.225508, -1.267117, 1, 0.282353, 0, 1,
-1.622365, 0.4946412, -2.514124, 1, 0.2862745, 0, 1,
-1.611436, 1.727287, 0.5325032, 1, 0.2941177, 0, 1,
-1.600328, 0.5364473, -1.01704, 1, 0.3019608, 0, 1,
-1.599312, -0.1623897, -1.045968, 1, 0.3058824, 0, 1,
-1.598874, 2.312765, -1.163462, 1, 0.3137255, 0, 1,
-1.581995, -1.030833, -1.914405, 1, 0.3176471, 0, 1,
-1.581993, 0.411014, 0.2378195, 1, 0.3254902, 0, 1,
-1.581966, 1.048335, -1.935028, 1, 0.3294118, 0, 1,
-1.576378, 1.247353, -1.739513, 1, 0.3372549, 0, 1,
-1.569496, -1.072854, -0.01057827, 1, 0.3411765, 0, 1,
-1.56624, 2.634159, 0.09996948, 1, 0.3490196, 0, 1,
-1.561018, -1.688882, -3.736399, 1, 0.3529412, 0, 1,
-1.559186, 0.1317155, -2.348342, 1, 0.3607843, 0, 1,
-1.556134, -0.8634472, -3.368464, 1, 0.3647059, 0, 1,
-1.548791, 0.579064, -1.335389, 1, 0.372549, 0, 1,
-1.52673, 0.3799415, -0.8483923, 1, 0.3764706, 0, 1,
-1.516494, 0.6925741, -0.2809723, 1, 0.3843137, 0, 1,
-1.502888, -2.10497, -3.179209, 1, 0.3882353, 0, 1,
-1.493858, 0.373079, -1.337899, 1, 0.3960784, 0, 1,
-1.489661, -0.8072681, -1.602338, 1, 0.4039216, 0, 1,
-1.487521, 0.6412455, -1.290037, 1, 0.4078431, 0, 1,
-1.486167, 1.347215, -1.653173, 1, 0.4156863, 0, 1,
-1.478096, -1.133039, -1.546875, 1, 0.4196078, 0, 1,
-1.464486, -0.3109205, -2.716531, 1, 0.427451, 0, 1,
-1.43823, -1.713296, -1.041737, 1, 0.4313726, 0, 1,
-1.429285, 0.6677473, -2.486456, 1, 0.4392157, 0, 1,
-1.42573, 1.000938, 1.486905, 1, 0.4431373, 0, 1,
-1.421815, 0.6530596, -0.1052607, 1, 0.4509804, 0, 1,
-1.404782, -0.3268054, -0.06199105, 1, 0.454902, 0, 1,
-1.395152, 0.1302725, -1.553492, 1, 0.4627451, 0, 1,
-1.393239, -1.068576, -3.896188, 1, 0.4666667, 0, 1,
-1.381396, 0.2625723, -1.431836, 1, 0.4745098, 0, 1,
-1.376947, -1.976858, -4.374387, 1, 0.4784314, 0, 1,
-1.374391, 0.3553309, -0.6012669, 1, 0.4862745, 0, 1,
-1.369864, 0.2216507, -0.9905941, 1, 0.4901961, 0, 1,
-1.355653, -0.562848, -2.111626, 1, 0.4980392, 0, 1,
-1.3556, -0.06843837, -1.879292, 1, 0.5058824, 0, 1,
-1.348103, -0.8851875, -0.7928091, 1, 0.509804, 0, 1,
-1.346773, 1.0136, -0.8977274, 1, 0.5176471, 0, 1,
-1.319705, -0.3746572, -2.507508, 1, 0.5215687, 0, 1,
-1.306303, 2.292141, -0.983712, 1, 0.5294118, 0, 1,
-1.290342, -0.4959086, -2.099343, 1, 0.5333334, 0, 1,
-1.28554, -0.2798847, -0.03597694, 1, 0.5411765, 0, 1,
-1.283338, -1.586231, -3.229846, 1, 0.5450981, 0, 1,
-1.2733, -0.2531392, -2.648577, 1, 0.5529412, 0, 1,
-1.273, -0.5384837, -3.347171, 1, 0.5568628, 0, 1,
-1.253226, -0.4631398, -1.522842, 1, 0.5647059, 0, 1,
-1.252847, -0.4391029, -2.187282, 1, 0.5686275, 0, 1,
-1.245231, 0.09760872, 0.2702726, 1, 0.5764706, 0, 1,
-1.234621, 0.2727091, -0.7577384, 1, 0.5803922, 0, 1,
-1.223249, 0.05315107, -0.03911574, 1, 0.5882353, 0, 1,
-1.220516, -0.05083607, -3.297271, 1, 0.5921569, 0, 1,
-1.215524, -0.1565341, -3.004422, 1, 0.6, 0, 1,
-1.204232, 1.186293, -1.448823, 1, 0.6078432, 0, 1,
-1.191411, 1.426801, -0.4983326, 1, 0.6117647, 0, 1,
-1.183988, -0.8086313, -3.362452, 1, 0.6196079, 0, 1,
-1.175182, -0.7765208, -1.223733, 1, 0.6235294, 0, 1,
-1.166462, -0.6537507, -2.05748, 1, 0.6313726, 0, 1,
-1.161752, -0.2785111, -2.370766, 1, 0.6352941, 0, 1,
-1.158089, 0.2303393, -0.3459891, 1, 0.6431373, 0, 1,
-1.155419, 0.7901645, -0.6561079, 1, 0.6470588, 0, 1,
-1.144383, -0.6818489, -1.691055, 1, 0.654902, 0, 1,
-1.141737, -0.9569632, -1.889159, 1, 0.6588235, 0, 1,
-1.140149, -1.15826, -1.957801, 1, 0.6666667, 0, 1,
-1.137887, 1.563451, -0.496505, 1, 0.6705883, 0, 1,
-1.135794, -1.437806, -2.49675, 1, 0.6784314, 0, 1,
-1.130635, 1.796036, 0.1246321, 1, 0.682353, 0, 1,
-1.12984, 0.07318188, -1.33315, 1, 0.6901961, 0, 1,
-1.127695, 0.01866596, -3.654059, 1, 0.6941177, 0, 1,
-1.12584, 0.8772847, -0.4269389, 1, 0.7019608, 0, 1,
-1.122635, 2.132889, -0.8789895, 1, 0.7098039, 0, 1,
-1.121045, 0.4021594, -0.3065295, 1, 0.7137255, 0, 1,
-1.116807, 1.083174, -0.1521792, 1, 0.7215686, 0, 1,
-1.107443, -0.5114964, -0.1580904, 1, 0.7254902, 0, 1,
-1.101315, 0.1441156, -2.569358, 1, 0.7333333, 0, 1,
-1.095971, -0.4543245, -2.42866, 1, 0.7372549, 0, 1,
-1.094163, 0.03160657, -1.903273, 1, 0.7450981, 0, 1,
-1.084505, 0.1968153, -2.434247, 1, 0.7490196, 0, 1,
-1.084469, 0.1643227, -1.857653, 1, 0.7568628, 0, 1,
-1.081965, 2.194175, -0.2374614, 1, 0.7607843, 0, 1,
-1.079303, -1.046237, -1.575241, 1, 0.7686275, 0, 1,
-1.066847, -0.587509, -1.68881, 1, 0.772549, 0, 1,
-1.066164, -1.424938, -1.381056, 1, 0.7803922, 0, 1,
-1.061001, -0.1471477, -0.1897964, 1, 0.7843137, 0, 1,
-1.056141, 1.117055, 0.3898994, 1, 0.7921569, 0, 1,
-1.047891, 1.063806, -1.21707, 1, 0.7960784, 0, 1,
-1.038746, -0.1109325, -2.623767, 1, 0.8039216, 0, 1,
-1.033222, -0.7615329, -1.054794, 1, 0.8117647, 0, 1,
-1.030561, -0.1154232, -0.8430039, 1, 0.8156863, 0, 1,
-1.028096, -1.201044, -2.844484, 1, 0.8235294, 0, 1,
-1.026264, -0.8797414, -1.88159, 1, 0.827451, 0, 1,
-1.024048, 0.5671341, -0.1300069, 1, 0.8352941, 0, 1,
-1.018387, 0.7617806, -1.988001, 1, 0.8392157, 0, 1,
-1.008514, 1.666653, 0.5535613, 1, 0.8470588, 0, 1,
-1.006075, -0.5859001, -3.68478, 1, 0.8509804, 0, 1,
-0.9998783, 2.313619, -1.421447, 1, 0.8588235, 0, 1,
-0.9942823, 1.836996, -2.282929, 1, 0.8627451, 0, 1,
-0.9936067, -1.159213, -4.317557, 1, 0.8705882, 0, 1,
-0.991354, -0.3314986, -4.052701, 1, 0.8745098, 0, 1,
-0.9831527, -0.9863861, -2.962873, 1, 0.8823529, 0, 1,
-0.9810934, -0.1517116, -1.649427, 1, 0.8862745, 0, 1,
-0.9619849, -0.8121111, -1.519875, 1, 0.8941177, 0, 1,
-0.959655, 0.7733213, -2.670722, 1, 0.8980392, 0, 1,
-0.955353, -0.3466306, -1.632538, 1, 0.9058824, 0, 1,
-0.9525509, -0.6515223, -2.155284, 1, 0.9137255, 0, 1,
-0.9472274, -0.08832985, -1.61561, 1, 0.9176471, 0, 1,
-0.9452783, 2.08865, -1.178929, 1, 0.9254902, 0, 1,
-0.9418969, -0.7770835, -2.364468, 1, 0.9294118, 0, 1,
-0.9411876, 0.9551877, 0.02740107, 1, 0.9372549, 0, 1,
-0.9371629, -0.2261468, -0.7263849, 1, 0.9411765, 0, 1,
-0.9368413, -0.2004035, -1.743433, 1, 0.9490196, 0, 1,
-0.9337504, -0.01793519, -1.250885, 1, 0.9529412, 0, 1,
-0.9310209, 0.0686079, -1.998344, 1, 0.9607843, 0, 1,
-0.9241025, -0.8010033, -4.047404, 1, 0.9647059, 0, 1,
-0.9240626, 0.0844439, -1.909858, 1, 0.972549, 0, 1,
-0.9193636, 0.383737, -2.177443, 1, 0.9764706, 0, 1,
-0.9178957, 1.844657, -0.5345777, 1, 0.9843137, 0, 1,
-0.9168711, 0.2339143, -0.4618247, 1, 0.9882353, 0, 1,
-0.9125813, -0.1171419, -1.34907, 1, 0.9960784, 0, 1,
-0.9095605, 0.09246185, -1.146378, 0.9960784, 1, 0, 1,
-0.9093727, -2.044272, -2.473565, 0.9921569, 1, 0, 1,
-0.9058505, -0.2310221, -3.294936, 0.9843137, 1, 0, 1,
-0.9044608, -0.01525095, -3.051607, 0.9803922, 1, 0, 1,
-0.8986102, -0.5689151, -2.234107, 0.972549, 1, 0, 1,
-0.8904365, 0.8239194, -1.717444, 0.9686275, 1, 0, 1,
-0.8903683, 0.1440843, -2.187689, 0.9607843, 1, 0, 1,
-0.8901957, 0.4205912, -1.595573, 0.9568627, 1, 0, 1,
-0.8846564, 0.06427883, -0.8480595, 0.9490196, 1, 0, 1,
-0.8813912, -0.9401605, -0.9510491, 0.945098, 1, 0, 1,
-0.8809412, -1.222728, -2.562133, 0.9372549, 1, 0, 1,
-0.8754198, -1.307003, -1.971559, 0.9333333, 1, 0, 1,
-0.8690311, 1.906158, -0.4097921, 0.9254902, 1, 0, 1,
-0.8590923, -1.108109, -2.723893, 0.9215686, 1, 0, 1,
-0.8552039, -0.0508298, -0.8887222, 0.9137255, 1, 0, 1,
-0.8542007, -0.3302649, -2.057031, 0.9098039, 1, 0, 1,
-0.8514802, -1.045778, -4.116009, 0.9019608, 1, 0, 1,
-0.850225, -0.7200956, -1.295934, 0.8941177, 1, 0, 1,
-0.849297, -0.6557468, -3.729769, 0.8901961, 1, 0, 1,
-0.846076, -0.4894271, -3.974413, 0.8823529, 1, 0, 1,
-0.8452098, 1.078838, -0.9125341, 0.8784314, 1, 0, 1,
-0.8391473, -0.5340335, -3.155869, 0.8705882, 1, 0, 1,
-0.8370662, -0.6998879, -5.008066, 0.8666667, 1, 0, 1,
-0.8353329, 0.2489596, -1.713938, 0.8588235, 1, 0, 1,
-0.8278194, -1.516093, -2.099163, 0.854902, 1, 0, 1,
-0.8259757, -1.200746, -2.283283, 0.8470588, 1, 0, 1,
-0.8224701, 0.2901468, 0.01922223, 0.8431373, 1, 0, 1,
-0.818157, 1.888698, -1.128624, 0.8352941, 1, 0, 1,
-0.8178373, -0.3009227, -3.180686, 0.8313726, 1, 0, 1,
-0.8173507, -0.3793727, -0.8951547, 0.8235294, 1, 0, 1,
-0.8123378, -0.5419092, -2.508244, 0.8196079, 1, 0, 1,
-0.8067953, -0.7247807, -4.105968, 0.8117647, 1, 0, 1,
-0.8041193, -0.9328603, -1.329168, 0.8078431, 1, 0, 1,
-0.8033926, 1.161292, 0.1549294, 0.8, 1, 0, 1,
-0.8032534, 0.2500623, -2.612868, 0.7921569, 1, 0, 1,
-0.7997485, 0.6062474, 0.694112, 0.7882353, 1, 0, 1,
-0.7986851, 0.2218667, -0.6184107, 0.7803922, 1, 0, 1,
-0.7950714, -0.3527265, -2.1784, 0.7764706, 1, 0, 1,
-0.79402, -0.6840822, -3.155553, 0.7686275, 1, 0, 1,
-0.7903783, 0.1547991, -1.527707, 0.7647059, 1, 0, 1,
-0.7887111, 1.371134, 1.533136, 0.7568628, 1, 0, 1,
-0.7784574, -0.2885213, -3.844897, 0.7529412, 1, 0, 1,
-0.7771217, -0.7957158, -2.706383, 0.7450981, 1, 0, 1,
-0.7751671, 0.6658527, 0.007068273, 0.7411765, 1, 0, 1,
-0.7693446, 1.028204, -0.7901636, 0.7333333, 1, 0, 1,
-0.7655804, -0.3485478, -3.315701, 0.7294118, 1, 0, 1,
-0.7650883, 0.845219, -1.165828, 0.7215686, 1, 0, 1,
-0.7636456, 1.34583, -0.4158066, 0.7176471, 1, 0, 1,
-0.7632145, -0.2412313, -2.405095, 0.7098039, 1, 0, 1,
-0.7600068, 0.5590976, -0.6075783, 0.7058824, 1, 0, 1,
-0.7596945, 0.2268297, -1.687802, 0.6980392, 1, 0, 1,
-0.7596832, 0.3505592, 0.05008988, 0.6901961, 1, 0, 1,
-0.759677, 1.406897, 0.2113179, 0.6862745, 1, 0, 1,
-0.7554544, -1.527189, -3.077667, 0.6784314, 1, 0, 1,
-0.7534996, -0.2209803, -2.449429, 0.6745098, 1, 0, 1,
-0.7518871, 0.7603178, 0.5634977, 0.6666667, 1, 0, 1,
-0.750423, -0.08607538, -1.307559, 0.6627451, 1, 0, 1,
-0.7493581, 0.7887984, -2.420252, 0.654902, 1, 0, 1,
-0.7361016, -0.09734522, 0.8180329, 0.6509804, 1, 0, 1,
-0.7317963, 0.9142178, -0.2321008, 0.6431373, 1, 0, 1,
-0.7313101, -1.609298, -1.917055, 0.6392157, 1, 0, 1,
-0.7255951, -1.340454, -1.627204, 0.6313726, 1, 0, 1,
-0.7234773, 0.7735254, 0.5882264, 0.627451, 1, 0, 1,
-0.7233794, 2.805872, 0.437344, 0.6196079, 1, 0, 1,
-0.7177165, -0.7455107, -1.573109, 0.6156863, 1, 0, 1,
-0.7129325, -0.08950115, -2.225426, 0.6078432, 1, 0, 1,
-0.7107787, 0.1069951, -2.193534, 0.6039216, 1, 0, 1,
-0.7090577, -1.479771, -0.4374459, 0.5960785, 1, 0, 1,
-0.7049168, 1.55456, -0.5271379, 0.5882353, 1, 0, 1,
-0.7041598, 0.1124072, -0.07989945, 0.5843138, 1, 0, 1,
-0.7030462, 1.20187, -1.296242, 0.5764706, 1, 0, 1,
-0.6974645, -0.0301284, -2.361634, 0.572549, 1, 0, 1,
-0.6921781, 0.4036615, -1.75477, 0.5647059, 1, 0, 1,
-0.6830519, 0.6214775, -1.520476, 0.5607843, 1, 0, 1,
-0.6813973, -0.07920476, -0.7720119, 0.5529412, 1, 0, 1,
-0.6810059, -0.72712, -2.639056, 0.5490196, 1, 0, 1,
-0.6800255, 1.348896, -0.3957351, 0.5411765, 1, 0, 1,
-0.6770374, -1.369946, -2.09776, 0.5372549, 1, 0, 1,
-0.6593599, -0.06420321, -0.3670531, 0.5294118, 1, 0, 1,
-0.6576843, 1.078702, -0.5427381, 0.5254902, 1, 0, 1,
-0.6574203, 1.636537, 0.687986, 0.5176471, 1, 0, 1,
-0.6561925, 0.7059193, -0.1584753, 0.5137255, 1, 0, 1,
-0.6555843, -1.069304, -2.411888, 0.5058824, 1, 0, 1,
-0.6546291, 0.1396679, 1.161271, 0.5019608, 1, 0, 1,
-0.6522768, -0.7230154, -3.108504, 0.4941176, 1, 0, 1,
-0.6501305, 0.1715246, -1.677723, 0.4862745, 1, 0, 1,
-0.6484545, -1.864855, -4.50811, 0.4823529, 1, 0, 1,
-0.6463103, 0.7789861, 0.4308876, 0.4745098, 1, 0, 1,
-0.6396797, 0.7968073, 0.37814, 0.4705882, 1, 0, 1,
-0.6344109, 0.8585237, -0.6992745, 0.4627451, 1, 0, 1,
-0.632822, -1.292157, -4.917591, 0.4588235, 1, 0, 1,
-0.6283219, 1.083735, -2.992632, 0.4509804, 1, 0, 1,
-0.6276956, -1.340019, -5.458405, 0.4470588, 1, 0, 1,
-0.6266114, 1.862562, -0.3536042, 0.4392157, 1, 0, 1,
-0.6265681, -0.03231549, -1.139088, 0.4352941, 1, 0, 1,
-0.6258706, 0.3717465, -0.8043602, 0.427451, 1, 0, 1,
-0.6256428, -0.2435091, 0.3593609, 0.4235294, 1, 0, 1,
-0.6210334, 0.8757449, 0.3719672, 0.4156863, 1, 0, 1,
-0.6179283, 2.075968, -1.591844, 0.4117647, 1, 0, 1,
-0.6166533, 0.5852356, -1.386016, 0.4039216, 1, 0, 1,
-0.6058507, -0.679926, -2.549677, 0.3960784, 1, 0, 1,
-0.5988798, 0.09704254, -1.06223, 0.3921569, 1, 0, 1,
-0.5967194, 0.1402222, 0.5819561, 0.3843137, 1, 0, 1,
-0.5956056, -0.3466716, -1.408348, 0.3803922, 1, 0, 1,
-0.5953639, -0.2899396, -2.807657, 0.372549, 1, 0, 1,
-0.5948897, -0.3915238, -3.075252, 0.3686275, 1, 0, 1,
-0.5913364, -0.0439411, -2.809564, 0.3607843, 1, 0, 1,
-0.5896021, 1.457215, 0.1174715, 0.3568628, 1, 0, 1,
-0.5883106, -0.9625066, -2.894951, 0.3490196, 1, 0, 1,
-0.5879311, 0.9759774, 0.6649269, 0.345098, 1, 0, 1,
-0.5845824, 1.178497, -0.1033764, 0.3372549, 1, 0, 1,
-0.5809017, 1.422492, -0.9251212, 0.3333333, 1, 0, 1,
-0.5768275, 1.212668, 0.2122791, 0.3254902, 1, 0, 1,
-0.5715138, -0.6481212, -3.223689, 0.3215686, 1, 0, 1,
-0.5702127, 0.7409387, -0.04411246, 0.3137255, 1, 0, 1,
-0.5674791, 1.218667, -1.449117, 0.3098039, 1, 0, 1,
-0.5674211, 1.222835, -0.2298877, 0.3019608, 1, 0, 1,
-0.5655426, 1.652415, -0.3818857, 0.2941177, 1, 0, 1,
-0.5638052, 0.0827259, -2.005897, 0.2901961, 1, 0, 1,
-0.5602538, 0.6519285, 1.338269, 0.282353, 1, 0, 1,
-0.557778, 1.130194, -0.9094713, 0.2784314, 1, 0, 1,
-0.557767, -1.614351, -3.560232, 0.2705882, 1, 0, 1,
-0.5572154, -1.28099, -2.850421, 0.2666667, 1, 0, 1,
-0.5479693, 0.231566, -0.88793, 0.2588235, 1, 0, 1,
-0.5438415, 0.08302976, -0.1694078, 0.254902, 1, 0, 1,
-0.5436161, -1.139539, -1.848743, 0.2470588, 1, 0, 1,
-0.543483, -0.786156, -2.432191, 0.2431373, 1, 0, 1,
-0.5424837, 2.501271, 0.5040151, 0.2352941, 1, 0, 1,
-0.5416848, 1.542855, -1.103693, 0.2313726, 1, 0, 1,
-0.5413616, 1.283012, 0.3722287, 0.2235294, 1, 0, 1,
-0.5382253, -0.9231958, -2.1285, 0.2196078, 1, 0, 1,
-0.5376999, 0.7215902, -1.374367, 0.2117647, 1, 0, 1,
-0.5360814, 1.855243, -0.4789851, 0.2078431, 1, 0, 1,
-0.535863, -0.4708312, -3.968067, 0.2, 1, 0, 1,
-0.5337214, -0.7326701, -3.133109, 0.1921569, 1, 0, 1,
-0.5283363, 1.415973, 1.022868, 0.1882353, 1, 0, 1,
-0.5259033, -0.3570172, -1.548245, 0.1803922, 1, 0, 1,
-0.525503, -0.5718434, -3.061391, 0.1764706, 1, 0, 1,
-0.5242105, 0.7391993, -0.7649572, 0.1686275, 1, 0, 1,
-0.5234068, 1.01957, 1.417403, 0.1647059, 1, 0, 1,
-0.5223576, -0.2546863, -1.064829, 0.1568628, 1, 0, 1,
-0.5142788, 1.336445, -0.4258647, 0.1529412, 1, 0, 1,
-0.5132954, 0.2094492, -2.987084, 0.145098, 1, 0, 1,
-0.5095919, 0.1246739, -1.239472, 0.1411765, 1, 0, 1,
-0.5093743, 0.2261388, 0.3970224, 0.1333333, 1, 0, 1,
-0.5089285, -0.2502138, -4.049275, 0.1294118, 1, 0, 1,
-0.4966854, 0.4623418, -0.453139, 0.1215686, 1, 0, 1,
-0.4904645, 0.2842413, -2.212463, 0.1176471, 1, 0, 1,
-0.4888191, -2.686647, -2.33176, 0.1098039, 1, 0, 1,
-0.4835455, 1.28753, -1.822967, 0.1058824, 1, 0, 1,
-0.4689563, -1.241883, -1.928807, 0.09803922, 1, 0, 1,
-0.4668964, -1.478582, -3.458683, 0.09019608, 1, 0, 1,
-0.4658372, 0.104742, -0.1457378, 0.08627451, 1, 0, 1,
-0.4626459, 1.36406, -1.207654, 0.07843138, 1, 0, 1,
-0.4588421, 0.2908736, -1.566596, 0.07450981, 1, 0, 1,
-0.4574975, 1.18456, 0.1279876, 0.06666667, 1, 0, 1,
-0.4547755, -1.102883, -3.536358, 0.0627451, 1, 0, 1,
-0.4535352, -0.2148927, -0.2294429, 0.05490196, 1, 0, 1,
-0.4512435, -0.2964977, -0.2195111, 0.05098039, 1, 0, 1,
-0.4506494, -0.7476992, -2.76108, 0.04313726, 1, 0, 1,
-0.4423337, 0.7190349, 0.7491202, 0.03921569, 1, 0, 1,
-0.4413725, -0.5232604, -3.825503, 0.03137255, 1, 0, 1,
-0.4399299, 2.420948, 1.191296, 0.02745098, 1, 0, 1,
-0.4394421, -3.642138, -2.780278, 0.01960784, 1, 0, 1,
-0.4393609, 0.8676643, -0.2579211, 0.01568628, 1, 0, 1,
-0.4344353, 0.08029873, -2.21292, 0.007843138, 1, 0, 1,
-0.4317747, 1.770339, 0.2015131, 0.003921569, 1, 0, 1,
-0.4289565, -0.9896289, -1.796701, 0, 1, 0.003921569, 1,
-0.4279477, -2.086899, -1.388277, 0, 1, 0.01176471, 1,
-0.4266255, -0.2964103, -2.274397, 0, 1, 0.01568628, 1,
-0.4262944, -0.1549294, -2.469953, 0, 1, 0.02352941, 1,
-0.4230077, 0.296412, -2.076537, 0, 1, 0.02745098, 1,
-0.422965, 0.5065947, -2.238651, 0, 1, 0.03529412, 1,
-0.4104538, -0.613089, -3.247226, 0, 1, 0.03921569, 1,
-0.4060171, -0.2110262, -1.903077, 0, 1, 0.04705882, 1,
-0.4035631, 0.7562246, -1.157738, 0, 1, 0.05098039, 1,
-0.4033573, 1.612951, 0.3849259, 0, 1, 0.05882353, 1,
-0.3981035, -0.005275501, -1.39341, 0, 1, 0.0627451, 1,
-0.3947088, 0.8693568, -1.305097, 0, 1, 0.07058824, 1,
-0.3933695, 0.470265, -0.2855359, 0, 1, 0.07450981, 1,
-0.3918216, -0.5109022, -2.717884, 0, 1, 0.08235294, 1,
-0.3870842, 1.387712, -0.591226, 0, 1, 0.08627451, 1,
-0.3824682, -0.4458805, -0.4297223, 0, 1, 0.09411765, 1,
-0.3784733, 0.1422167, -0.8271456, 0, 1, 0.1019608, 1,
-0.3747878, -1.311433, -4.610322, 0, 1, 0.1058824, 1,
-0.3651909, 0.9349365, -1.896406, 0, 1, 0.1137255, 1,
-0.3608843, -0.1217815, -2.102956, 0, 1, 0.1176471, 1,
-0.3593903, 0.9762859, 1.163262, 0, 1, 0.1254902, 1,
-0.3575127, -0.2865894, -0.8119845, 0, 1, 0.1294118, 1,
-0.3523441, -1.392986, -3.13597, 0, 1, 0.1372549, 1,
-0.3506305, 0.05967946, -1.182683, 0, 1, 0.1411765, 1,
-0.3430509, -0.5929264, -0.5810271, 0, 1, 0.1490196, 1,
-0.3385533, 0.07479452, -0.9813468, 0, 1, 0.1529412, 1,
-0.3384645, -2.357187, -2.00471, 0, 1, 0.1607843, 1,
-0.3308605, 1.716341, 0.3720515, 0, 1, 0.1647059, 1,
-0.3192439, -0.6416336, -0.2491072, 0, 1, 0.172549, 1,
-0.3140307, -0.6466966, -3.922041, 0, 1, 0.1764706, 1,
-0.3124537, -1.736496, -3.223812, 0, 1, 0.1843137, 1,
-0.3020098, -0.09012655, -1.274225, 0, 1, 0.1882353, 1,
-0.2989688, 1.477428, 1.747439, 0, 1, 0.1960784, 1,
-0.2982103, -0.01608431, -1.661174, 0, 1, 0.2039216, 1,
-0.291182, -1.174311, -2.184371, 0, 1, 0.2078431, 1,
-0.2886296, 0.2595, -1.58911, 0, 1, 0.2156863, 1,
-0.2806787, 0.136508, 0.1749038, 0, 1, 0.2196078, 1,
-0.2754756, 1.16715, -0.7157668, 0, 1, 0.227451, 1,
-0.2752684, 0.6298512, -1.949954, 0, 1, 0.2313726, 1,
-0.2742409, -0.3784829, -3.892421, 0, 1, 0.2392157, 1,
-0.2687169, 0.7922071, -2.044147, 0, 1, 0.2431373, 1,
-0.267321, -2.18759, -4.091657, 0, 1, 0.2509804, 1,
-0.2660966, 0.446654, -1.5706, 0, 1, 0.254902, 1,
-0.2631323, -0.1558574, -0.2762392, 0, 1, 0.2627451, 1,
-0.2630273, 1.720638, 0.6698855, 0, 1, 0.2666667, 1,
-0.2613348, -1.017396, -2.962055, 0, 1, 0.2745098, 1,
-0.2575005, -1.251753, -1.793891, 0, 1, 0.2784314, 1,
-0.2571704, 0.2566296, 0.0284918, 0, 1, 0.2862745, 1,
-0.2569843, 0.546875, -1.302247, 0, 1, 0.2901961, 1,
-0.2534612, 0.4893599, -2.815525, 0, 1, 0.2980392, 1,
-0.2528065, -0.2078263, -0.9254172, 0, 1, 0.3058824, 1,
-0.2524125, 0.1943872, -1.059725, 0, 1, 0.3098039, 1,
-0.2504738, 1.197129, 0.9289658, 0, 1, 0.3176471, 1,
-0.2432174, -0.7386048, -5.096555, 0, 1, 0.3215686, 1,
-0.2407795, -0.2246923, -1.9438, 0, 1, 0.3294118, 1,
-0.2371274, 1.582504, 0.1285813, 0, 1, 0.3333333, 1,
-0.2340073, -1.828412, -2.236735, 0, 1, 0.3411765, 1,
-0.2332971, 0.8596267, 0.838028, 0, 1, 0.345098, 1,
-0.2322256, -0.1503771, -2.36861, 0, 1, 0.3529412, 1,
-0.2302508, 0.7862383, 0.2938229, 0, 1, 0.3568628, 1,
-0.2232543, -0.6230195, -2.361199, 0, 1, 0.3647059, 1,
-0.220664, 1.131908, -0.1367748, 0, 1, 0.3686275, 1,
-0.2197532, -0.4249149, -2.079517, 0, 1, 0.3764706, 1,
-0.2165098, -0.6746557, -3.95673, 0, 1, 0.3803922, 1,
-0.2147853, -1.343341, -1.455578, 0, 1, 0.3882353, 1,
-0.2100158, -1.026502, -2.585908, 0, 1, 0.3921569, 1,
-0.2049172, 1.448591, 1.044615, 0, 1, 0.4, 1,
-0.202567, 0.1300044, -0.9339482, 0, 1, 0.4078431, 1,
-0.2018706, 0.2272043, -0.03855671, 0, 1, 0.4117647, 1,
-0.2001054, -0.6979018, -3.78065, 0, 1, 0.4196078, 1,
-0.1925072, 0.8881363, -0.02560287, 0, 1, 0.4235294, 1,
-0.1923793, 0.03702684, 0.1239413, 0, 1, 0.4313726, 1,
-0.1905029, 0.5211389, -1.402876, 0, 1, 0.4352941, 1,
-0.188167, -0.5547177, -3.907914, 0, 1, 0.4431373, 1,
-0.1870017, 0.7785424, 0.3702274, 0, 1, 0.4470588, 1,
-0.1853015, -0.9558659, -2.543688, 0, 1, 0.454902, 1,
-0.183524, -1.029615, -2.023626, 0, 1, 0.4588235, 1,
-0.1798348, 0.1603911, -1.229965, 0, 1, 0.4666667, 1,
-0.1794886, -1.624108, -2.358955, 0, 1, 0.4705882, 1,
-0.169659, 0.7547358, -0.3520808, 0, 1, 0.4784314, 1,
-0.1686637, 0.404661, 0.2901232, 0, 1, 0.4823529, 1,
-0.1676375, -2.264815, -2.60324, 0, 1, 0.4901961, 1,
-0.1653709, -1.192254, -3.827471, 0, 1, 0.4941176, 1,
-0.1619219, -0.6753947, -1.408422, 0, 1, 0.5019608, 1,
-0.1605786, -1.473976, -2.750894, 0, 1, 0.509804, 1,
-0.160569, 0.614206, -1.275514, 0, 1, 0.5137255, 1,
-0.1596391, -0.6476357, -3.865121, 0, 1, 0.5215687, 1,
-0.1506143, -1.105224, -0.5969945, 0, 1, 0.5254902, 1,
-0.1437768, 0.508615, 0.4362108, 0, 1, 0.5333334, 1,
-0.1436933, -0.5557296, -2.364358, 0, 1, 0.5372549, 1,
-0.1436309, 0.5300997, 0.7536691, 0, 1, 0.5450981, 1,
-0.1414598, 0.5906946, -0.9108922, 0, 1, 0.5490196, 1,
-0.1372592, 1.387089, -0.6763695, 0, 1, 0.5568628, 1,
-0.1363546, -0.4553945, -2.88377, 0, 1, 0.5607843, 1,
-0.134621, 2.066054, -0.5200393, 0, 1, 0.5686275, 1,
-0.1327699, -1.026937, -1.227689, 0, 1, 0.572549, 1,
-0.1322622, -1.509073, -4.366249, 0, 1, 0.5803922, 1,
-0.1301286, -0.03860016, -1.425412, 0, 1, 0.5843138, 1,
-0.1299514, -2.082205, -2.455669, 0, 1, 0.5921569, 1,
-0.1293716, -1.603557, -3.625266, 0, 1, 0.5960785, 1,
-0.1292203, -0.2369613, -3.610531, 0, 1, 0.6039216, 1,
-0.1241753, 1.077069, -0.4569685, 0, 1, 0.6117647, 1,
-0.1213189, 0.7999223, -0.7997301, 0, 1, 0.6156863, 1,
-0.1200422, 1.132967, 0.5967048, 0, 1, 0.6235294, 1,
-0.1182863, -1.116663, -3.781535, 0, 1, 0.627451, 1,
-0.1161964, 1.877841, -1.099986, 0, 1, 0.6352941, 1,
-0.1154455, -1.437413, -3.818908, 0, 1, 0.6392157, 1,
-0.1034919, 0.2572574, -0.8829681, 0, 1, 0.6470588, 1,
-0.101936, -0.4950507, -3.881581, 0, 1, 0.6509804, 1,
-0.1017249, -1.018741, -2.990724, 0, 1, 0.6588235, 1,
-0.09535169, 0.3825804, 0.4692101, 0, 1, 0.6627451, 1,
-0.08979069, -1.232816, -2.438881, 0, 1, 0.6705883, 1,
-0.08581711, 1.224911, 0.7520707, 0, 1, 0.6745098, 1,
-0.08524978, -1.006054, -2.997472, 0, 1, 0.682353, 1,
-0.07602223, -0.1125335, -2.125187, 0, 1, 0.6862745, 1,
-0.07555956, 0.8733088, 0.273366, 0, 1, 0.6941177, 1,
-0.07287616, 0.4025978, -2.252509, 0, 1, 0.7019608, 1,
-0.07039835, -1.040686, -4.754488, 0, 1, 0.7058824, 1,
-0.06909814, 0.455096, 1.089122, 0, 1, 0.7137255, 1,
-0.06713288, 0.5889208, 0.06072109, 0, 1, 0.7176471, 1,
-0.06499433, 0.5396644, 0.009071198, 0, 1, 0.7254902, 1,
-0.06443919, -0.4745406, -3.397644, 0, 1, 0.7294118, 1,
-0.06134554, -1.703435, -4.575935, 0, 1, 0.7372549, 1,
-0.05699069, -1.195259, -4.163687, 0, 1, 0.7411765, 1,
-0.05474666, 1.100603, -0.3569289, 0, 1, 0.7490196, 1,
-0.05357877, 0.299366, -0.3444355, 0, 1, 0.7529412, 1,
-0.04907566, -0.8365069, -4.090284, 0, 1, 0.7607843, 1,
-0.04815793, 0.2504658, -1.350487, 0, 1, 0.7647059, 1,
-0.04597533, -0.1882428, -3.972358, 0, 1, 0.772549, 1,
-0.04406572, 1.060228, 0.7962736, 0, 1, 0.7764706, 1,
-0.04361793, 2.653347, -0.0487449, 0, 1, 0.7843137, 1,
-0.04249324, 0.1258805, -0.1213124, 0, 1, 0.7882353, 1,
-0.03552646, -0.2086989, -0.9036281, 0, 1, 0.7960784, 1,
-0.03471556, -0.223989, -3.432433, 0, 1, 0.8039216, 1,
-0.02842223, 0.9402168, 0.4178029, 0, 1, 0.8078431, 1,
-0.0278877, -0.458851, -3.833869, 0, 1, 0.8156863, 1,
-0.02773642, 1.513449, 0.269857, 0, 1, 0.8196079, 1,
-0.02714362, 0.703862, 0.9092098, 0, 1, 0.827451, 1,
-0.02360878, 0.1010577, -0.56665, 0, 1, 0.8313726, 1,
-0.0212421, -1.27918, -5.672571, 0, 1, 0.8392157, 1,
-0.01491002, -0.5743849, -3.463135, 0, 1, 0.8431373, 1,
-0.01303344, 0.8517665, -0.7690803, 0, 1, 0.8509804, 1,
-0.01144782, 0.04246661, -0.07951068, 0, 1, 0.854902, 1,
-0.01015372, 0.6263485, -1.50537, 0, 1, 0.8627451, 1,
-0.008236133, 0.6352993, -0.8618044, 0, 1, 0.8666667, 1,
-0.006251953, -0.4886607, -3.168884, 0, 1, 0.8745098, 1,
0.00195189, 0.4083396, 0.3957028, 0, 1, 0.8784314, 1,
0.004554883, 0.03625975, 0.2563502, 0, 1, 0.8862745, 1,
0.007321891, -1.251259, 2.731352, 0, 1, 0.8901961, 1,
0.00819556, 0.6418338, -0.2091436, 0, 1, 0.8980392, 1,
0.008303657, 0.9570276, -0.250392, 0, 1, 0.9058824, 1,
0.009649967, -1.074207, 1.851397, 0, 1, 0.9098039, 1,
0.01532255, -0.8044599, 2.111176, 0, 1, 0.9176471, 1,
0.022797, 1.350116, 2.014339, 0, 1, 0.9215686, 1,
0.02413036, 0.4044159, 1.635402, 0, 1, 0.9294118, 1,
0.02471209, 1.570165, 1.170216, 0, 1, 0.9333333, 1,
0.02560843, 1.75381, -1.545049, 0, 1, 0.9411765, 1,
0.03086367, -0.2632897, 3.701219, 0, 1, 0.945098, 1,
0.03388223, 0.2806866, -3.5628, 0, 1, 0.9529412, 1,
0.03579811, -2.24483, 3.27783, 0, 1, 0.9568627, 1,
0.03649204, 0.7248523, 1.034834, 0, 1, 0.9647059, 1,
0.04192105, 0.4073994, -0.4446587, 0, 1, 0.9686275, 1,
0.04431461, -2.49447, 5.029113, 0, 1, 0.9764706, 1,
0.04663001, 1.41176, -0.1867341, 0, 1, 0.9803922, 1,
0.04785934, -0.3210148, 4.205976, 0, 1, 0.9882353, 1,
0.04942397, -1.089386, 5.868875, 0, 1, 0.9921569, 1,
0.0508844, -0.1340031, 1.42708, 0, 1, 1, 1,
0.05179923, 0.1341909, 0.988703, 0, 0.9921569, 1, 1,
0.05330199, 0.3175592, 0.4076055, 0, 0.9882353, 1, 1,
0.05514302, 0.9672757, -0.3693494, 0, 0.9803922, 1, 1,
0.05840081, 0.3849925, -0.9214425, 0, 0.9764706, 1, 1,
0.05914668, -0.6234531, 2.204362, 0, 0.9686275, 1, 1,
0.06433615, -2.421058, 3.288947, 0, 0.9647059, 1, 1,
0.06491678, -1.03315, 1.801672, 0, 0.9568627, 1, 1,
0.06513338, -0.7140796, 1.316269, 0, 0.9529412, 1, 1,
0.06515647, 0.5446424, -0.4521304, 0, 0.945098, 1, 1,
0.07300237, -0.9742861, 2.518918, 0, 0.9411765, 1, 1,
0.07302696, 0.4479594, 2.054766, 0, 0.9333333, 1, 1,
0.07364731, 0.3288019, -0.6741984, 0, 0.9294118, 1, 1,
0.07388546, 0.8009907, -0.8026352, 0, 0.9215686, 1, 1,
0.07412491, 1.703372, -1.073127, 0, 0.9176471, 1, 1,
0.07487968, 1.092131, -1.578653, 0, 0.9098039, 1, 1,
0.08197857, 1.457417, 1.52424, 0, 0.9058824, 1, 1,
0.08403568, -0.8243405, 5.235953, 0, 0.8980392, 1, 1,
0.08588891, 0.13817, 0.9439394, 0, 0.8901961, 1, 1,
0.08715765, 0.06046562, -0.3469836, 0, 0.8862745, 1, 1,
0.08750484, -0.2766063, 2.883559, 0, 0.8784314, 1, 1,
0.08956118, 1.198731, 0.1095774, 0, 0.8745098, 1, 1,
0.09568712, -0.9931087, 3.50698, 0, 0.8666667, 1, 1,
0.0961642, 1.179505, 1.433868, 0, 0.8627451, 1, 1,
0.09741332, 1.150199, -0.8335092, 0, 0.854902, 1, 1,
0.09852459, -0.7749522, 3.214453, 0, 0.8509804, 1, 1,
0.1002624, 0.9190066, -0.0181911, 0, 0.8431373, 1, 1,
0.1012905, -1.035829, 4.442744, 0, 0.8392157, 1, 1,
0.1023396, -1.13835, 5.309165, 0, 0.8313726, 1, 1,
0.1023772, 0.007850693, 1.720667, 0, 0.827451, 1, 1,
0.1067312, 1.694015, 0.2624705, 0, 0.8196079, 1, 1,
0.1154889, 1.025385, -0.02092371, 0, 0.8156863, 1, 1,
0.1174613, 0.09746514, 2.115373, 0, 0.8078431, 1, 1,
0.1191734, -1.567153, 2.812457, 0, 0.8039216, 1, 1,
0.1245175, 0.7704877, -0.2660752, 0, 0.7960784, 1, 1,
0.1255575, 0.3382638, 2.092086, 0, 0.7882353, 1, 1,
0.1257204, -0.4032578, 2.122185, 0, 0.7843137, 1, 1,
0.127264, -0.06824565, 2.414844, 0, 0.7764706, 1, 1,
0.1309073, 0.3818335, -1.130188, 0, 0.772549, 1, 1,
0.1327804, -0.812205, 2.544901, 0, 0.7647059, 1, 1,
0.1344403, -0.2296043, 1.949561, 0, 0.7607843, 1, 1,
0.1353474, -1.226307, 4.400747, 0, 0.7529412, 1, 1,
0.1357233, -0.3376365, 2.46833, 0, 0.7490196, 1, 1,
0.145927, -1.130612, 2.27823, 0, 0.7411765, 1, 1,
0.1474632, 0.3462162, 0.131573, 0, 0.7372549, 1, 1,
0.1500725, -0.524507, 3.944792, 0, 0.7294118, 1, 1,
0.1521869, -1.368364, 3.947379, 0, 0.7254902, 1, 1,
0.152253, -0.7733632, 1.603641, 0, 0.7176471, 1, 1,
0.1590156, -0.1777401, 2.237784, 0, 0.7137255, 1, 1,
0.1634069, -0.1630082, 2.775951, 0, 0.7058824, 1, 1,
0.1641117, 0.06350192, 0.8500312, 0, 0.6980392, 1, 1,
0.1641374, 0.4779263, -0.7602815, 0, 0.6941177, 1, 1,
0.1658333, 0.1698818, 2.923246, 0, 0.6862745, 1, 1,
0.1662495, -1.314162, 3.719254, 0, 0.682353, 1, 1,
0.1669556, -1.069337, 4.63163, 0, 0.6745098, 1, 1,
0.1735774, -1.700815, 5.282181, 0, 0.6705883, 1, 1,
0.1761312, -1.639446, 2.977877, 0, 0.6627451, 1, 1,
0.180882, 0.2316438, -0.1945078, 0, 0.6588235, 1, 1,
0.181354, -0.9845788, 4.001582, 0, 0.6509804, 1, 1,
0.184947, -0.7242033, 4.079119, 0, 0.6470588, 1, 1,
0.1887918, 0.381359, -0.09570293, 0, 0.6392157, 1, 1,
0.1899659, -0.0514478, 3.300562, 0, 0.6352941, 1, 1,
0.1918473, -0.05762968, 2.567274, 0, 0.627451, 1, 1,
0.1936263, -0.4079509, 2.760291, 0, 0.6235294, 1, 1,
0.1988269, -0.1831193, 1.91134, 0, 0.6156863, 1, 1,
0.2031356, 0.04728459, 2.58592, 0, 0.6117647, 1, 1,
0.2101011, -1.382489, 4.612285, 0, 0.6039216, 1, 1,
0.2123019, -0.2358759, 2.427443, 0, 0.5960785, 1, 1,
0.214643, -0.8502497, 3.117406, 0, 0.5921569, 1, 1,
0.2170732, -0.1166584, 1.722255, 0, 0.5843138, 1, 1,
0.2213187, -0.113039, 0.1267153, 0, 0.5803922, 1, 1,
0.2214407, 1.95817, 1.323646, 0, 0.572549, 1, 1,
0.2273965, -0.1157647, 0.3519019, 0, 0.5686275, 1, 1,
0.2274112, -0.6136512, 3.225587, 0, 0.5607843, 1, 1,
0.2291944, -0.2685381, 2.400403, 0, 0.5568628, 1, 1,
0.2292884, -0.09863985, 2.607526, 0, 0.5490196, 1, 1,
0.2305715, 0.03413868, 1.220988, 0, 0.5450981, 1, 1,
0.2354899, -0.5094149, 2.427429, 0, 0.5372549, 1, 1,
0.2429764, 0.4453643, -0.3058953, 0, 0.5333334, 1, 1,
0.2483188, 0.3305216, -0.7151253, 0, 0.5254902, 1, 1,
0.2510086, -0.2499659, 3.431694, 0, 0.5215687, 1, 1,
0.253303, -0.2899853, 4.593517, 0, 0.5137255, 1, 1,
0.2537239, 0.3245848, -0.2887277, 0, 0.509804, 1, 1,
0.2562375, -0.02136226, 0.2127443, 0, 0.5019608, 1, 1,
0.2563183, 0.5866071, -0.0306117, 0, 0.4941176, 1, 1,
0.2580791, -0.03679611, 1.027836, 0, 0.4901961, 1, 1,
0.2612749, -0.4568296, 2.332142, 0, 0.4823529, 1, 1,
0.262948, 2.226704, 0.3953219, 0, 0.4784314, 1, 1,
0.2696787, 0.07947037, 0.9482727, 0, 0.4705882, 1, 1,
0.2726019, -0.9644628, 2.249413, 0, 0.4666667, 1, 1,
0.272817, -0.7298483, 4.11459, 0, 0.4588235, 1, 1,
0.278676, -0.387173, 1.54025, 0, 0.454902, 1, 1,
0.2795242, 0.0296904, -0.05517363, 0, 0.4470588, 1, 1,
0.2820417, -1.39604, 2.061335, 0, 0.4431373, 1, 1,
0.282443, -0.1745123, 2.73897, 0, 0.4352941, 1, 1,
0.2837027, 1.55332, -1.042903, 0, 0.4313726, 1, 1,
0.2872643, 0.8506206, 2.267054, 0, 0.4235294, 1, 1,
0.2874543, 2.222743, 0.6916465, 0, 0.4196078, 1, 1,
0.2890224, 0.3250544, 1.20225, 0, 0.4117647, 1, 1,
0.289434, 0.9043397, -1.38019, 0, 0.4078431, 1, 1,
0.2898338, 0.3402041, 0.3716284, 0, 0.4, 1, 1,
0.2904624, 0.765887, 0.6946383, 0, 0.3921569, 1, 1,
0.2999704, -0.7032876, 2.007591, 0, 0.3882353, 1, 1,
0.3029737, -1.389454, 4.598497, 0, 0.3803922, 1, 1,
0.3037711, -0.8609487, 4.497085, 0, 0.3764706, 1, 1,
0.3067401, -0.3469129, 3.233387, 0, 0.3686275, 1, 1,
0.3070822, -0.3765493, 2.026842, 0, 0.3647059, 1, 1,
0.3087105, 1.232638, 0.3492473, 0, 0.3568628, 1, 1,
0.3163897, 2.185265, 1.071055, 0, 0.3529412, 1, 1,
0.3194647, -0.04330777, 1.558755, 0, 0.345098, 1, 1,
0.3206186, -0.2528149, 2.982173, 0, 0.3411765, 1, 1,
0.326482, 0.9734274, 0.254631, 0, 0.3333333, 1, 1,
0.3276941, 0.8763779, 0.7457454, 0, 0.3294118, 1, 1,
0.3299963, 0.5701574, -0.7737414, 0, 0.3215686, 1, 1,
0.3302879, -0.2102819, 2.837076, 0, 0.3176471, 1, 1,
0.3316599, -0.827502, 4.547782, 0, 0.3098039, 1, 1,
0.3323703, -1.005852, 3.449618, 0, 0.3058824, 1, 1,
0.3367845, -0.05088442, 3.205247, 0, 0.2980392, 1, 1,
0.3420058, 0.9068666, -0.1634214, 0, 0.2901961, 1, 1,
0.3442413, 0.7541494, 1.898393, 0, 0.2862745, 1, 1,
0.3467295, -0.8249665, 4.526284, 0, 0.2784314, 1, 1,
0.3469412, 0.3653439, -0.1064689, 0, 0.2745098, 1, 1,
0.3471817, -0.8871186, 4.553643, 0, 0.2666667, 1, 1,
0.3501089, 0.518306, -0.2562592, 0, 0.2627451, 1, 1,
0.3557042, -0.006654226, 1.245898, 0, 0.254902, 1, 1,
0.3559116, 1.294848, 0.644084, 0, 0.2509804, 1, 1,
0.3562683, -0.3997653, 0.7778072, 0, 0.2431373, 1, 1,
0.359452, 0.6241155, -0.06363985, 0, 0.2392157, 1, 1,
0.3607464, 0.8965124, -0.3444759, 0, 0.2313726, 1, 1,
0.3648535, -0.07874847, 2.910704, 0, 0.227451, 1, 1,
0.3668255, -0.4985394, 2.497443, 0, 0.2196078, 1, 1,
0.3679618, -0.3158769, 2.296147, 0, 0.2156863, 1, 1,
0.3680833, -0.1605465, 2.253309, 0, 0.2078431, 1, 1,
0.3707762, 1.682221, 0.3120359, 0, 0.2039216, 1, 1,
0.3726437, 1.103927, 1.252597, 0, 0.1960784, 1, 1,
0.3771674, -0.9116793, 3.033499, 0, 0.1882353, 1, 1,
0.3828601, 0.04596819, 1.061662, 0, 0.1843137, 1, 1,
0.3892851, -0.2256343, 4.369226, 0, 0.1764706, 1, 1,
0.396164, -1.742299, 2.773269, 0, 0.172549, 1, 1,
0.4012558, -0.9141895, 1.42551, 0, 0.1647059, 1, 1,
0.4045103, 0.7549468, 0.6740491, 0, 0.1607843, 1, 1,
0.4058715, 0.4248106, 1.499053, 0, 0.1529412, 1, 1,
0.4088458, -0.6038765, 2.963398, 0, 0.1490196, 1, 1,
0.4094678, 0.8128664, 1.678317, 0, 0.1411765, 1, 1,
0.4124086, 1.877765, 0.224583, 0, 0.1372549, 1, 1,
0.4131846, -0.6275799, 1.989619, 0, 0.1294118, 1, 1,
0.4135301, -1.194503, 2.837652, 0, 0.1254902, 1, 1,
0.4157423, 0.4958568, 0.6540512, 0, 0.1176471, 1, 1,
0.4174352, -0.9210925, 4.381503, 0, 0.1137255, 1, 1,
0.4193386, 0.4306416, 0.2604433, 0, 0.1058824, 1, 1,
0.4238099, 1.191609, -2.862063, 0, 0.09803922, 1, 1,
0.4240751, 0.3677323, -1.830503, 0, 0.09411765, 1, 1,
0.4290471, -1.222409, 2.142601, 0, 0.08627451, 1, 1,
0.4302243, -0.817646, 3.095251, 0, 0.08235294, 1, 1,
0.4312486, -1.54782, 3.837242, 0, 0.07450981, 1, 1,
0.4408468, 0.6419724, 0.6209044, 0, 0.07058824, 1, 1,
0.4481046, 0.9144958, 0.6747038, 0, 0.0627451, 1, 1,
0.4495955, 0.0582833, 1.313621, 0, 0.05882353, 1, 1,
0.4502092, -0.219413, 1.820275, 0, 0.05098039, 1, 1,
0.4614675, 0.747565, 0.8605749, 0, 0.04705882, 1, 1,
0.4618124, -1.625355, 4.888245, 0, 0.03921569, 1, 1,
0.4680455, -1.39367, 3.808418, 0, 0.03529412, 1, 1,
0.4685843, 1.91238, -1.108195, 0, 0.02745098, 1, 1,
0.4686423, 0.4012207, 1.248928, 0, 0.02352941, 1, 1,
0.4695481, -0.1680394, 0.7815903, 0, 0.01568628, 1, 1,
0.4785244, 0.8017847, 0.02806314, 0, 0.01176471, 1, 1,
0.4830683, 1.358364, 0.1150235, 0, 0.003921569, 1, 1,
0.4890448, -0.2782374, 2.243025, 0.003921569, 0, 1, 1,
0.492746, -0.1464141, 1.151537, 0.007843138, 0, 1, 1,
0.4954754, -0.517036, 2.196338, 0.01568628, 0, 1, 1,
0.5027103, -0.6726708, 3.017477, 0.01960784, 0, 1, 1,
0.5036094, -0.8322799, 2.808667, 0.02745098, 0, 1, 1,
0.5049594, -0.1548821, -0.3533101, 0.03137255, 0, 1, 1,
0.5111405, -0.903071, 0.2886608, 0.03921569, 0, 1, 1,
0.5117686, -0.06936659, 0.92805, 0.04313726, 0, 1, 1,
0.512894, 0.2397731, 1.603441, 0.05098039, 0, 1, 1,
0.5133284, -0.06658956, 1.094333, 0.05490196, 0, 1, 1,
0.5139212, 0.2445356, -0.3473749, 0.0627451, 0, 1, 1,
0.5169447, 0.4166187, 1.521385, 0.06666667, 0, 1, 1,
0.5243756, 0.8760664, 1.166432, 0.07450981, 0, 1, 1,
0.5252493, -0.5868635, 2.517944, 0.07843138, 0, 1, 1,
0.526054, 1.109434, -0.7083423, 0.08627451, 0, 1, 1,
0.5296943, -1.364913, 4.543723, 0.09019608, 0, 1, 1,
0.5327315, -2.175073, 2.221664, 0.09803922, 0, 1, 1,
0.5360022, -1.621467, 2.094714, 0.1058824, 0, 1, 1,
0.5380964, -1.596932, 5.00694, 0.1098039, 0, 1, 1,
0.5392681, 0.3690986, 0.1129985, 0.1176471, 0, 1, 1,
0.5461274, 1.058626, -0.4434007, 0.1215686, 0, 1, 1,
0.5464342, 2.601886, -0.1975359, 0.1294118, 0, 1, 1,
0.5481129, 0.1493776, 2.275961, 0.1333333, 0, 1, 1,
0.5487642, -0.2926411, 1.95539, 0.1411765, 0, 1, 1,
0.549779, -0.145025, 1.691133, 0.145098, 0, 1, 1,
0.5513934, 1.899408, -0.1314536, 0.1529412, 0, 1, 1,
0.5529026, 1.795225, 1.733473, 0.1568628, 0, 1, 1,
0.5585601, 0.8015385, 0.7516409, 0.1647059, 0, 1, 1,
0.5586796, -0.3784637, 1.973766, 0.1686275, 0, 1, 1,
0.5648598, 1.419725, 1.267471, 0.1764706, 0, 1, 1,
0.5686592, 0.3157903, -0.2718021, 0.1803922, 0, 1, 1,
0.5754454, 1.441202, -0.1320981, 0.1882353, 0, 1, 1,
0.575685, -0.5078615, 1.93808, 0.1921569, 0, 1, 1,
0.5828827, -1.295092, 1.943973, 0.2, 0, 1, 1,
0.5903299, 0.842471, -0.2070275, 0.2078431, 0, 1, 1,
0.5918224, 0.1757347, 1.755943, 0.2117647, 0, 1, 1,
0.594243, -0.3223173, 0.08323167, 0.2196078, 0, 1, 1,
0.5993792, -0.3308182, 1.3234, 0.2235294, 0, 1, 1,
0.6027481, 0.7847886, -0.1843039, 0.2313726, 0, 1, 1,
0.6030365, -0.4083738, 2.389628, 0.2352941, 0, 1, 1,
0.6068779, 0.4401373, -0.1541864, 0.2431373, 0, 1, 1,
0.6079426, -0.6214617, 4.345044, 0.2470588, 0, 1, 1,
0.6125808, -0.7251648, 3.934945, 0.254902, 0, 1, 1,
0.6166499, -0.1348986, 1.887105, 0.2588235, 0, 1, 1,
0.6210148, -0.3491742, -0.1747568, 0.2666667, 0, 1, 1,
0.6300528, 0.522873, -0.2539662, 0.2705882, 0, 1, 1,
0.6326624, 0.3530774, 2.189613, 0.2784314, 0, 1, 1,
0.6333341, -0.2761484, 1.33347, 0.282353, 0, 1, 1,
0.6337072, -0.8750291, 1.661538, 0.2901961, 0, 1, 1,
0.6355404, -0.2243911, 1.728317, 0.2941177, 0, 1, 1,
0.6457379, 1.370557, 1.10111, 0.3019608, 0, 1, 1,
0.6492016, -1.130966, 3.617928, 0.3098039, 0, 1, 1,
0.6524032, -1.229776, 2.460757, 0.3137255, 0, 1, 1,
0.65596, -0.9229605, 2.457778, 0.3215686, 0, 1, 1,
0.6595401, -1.461776, 3.587232, 0.3254902, 0, 1, 1,
0.6634166, 0.3625434, 0.4062161, 0.3333333, 0, 1, 1,
0.6754156, -1.077396, 1.462675, 0.3372549, 0, 1, 1,
0.6766872, 0.4518578, -1.265061, 0.345098, 0, 1, 1,
0.6789792, 0.07771134, 2.164008, 0.3490196, 0, 1, 1,
0.6802871, -1.508954, 3.45802, 0.3568628, 0, 1, 1,
0.6877941, 0.31858, 0.5117185, 0.3607843, 0, 1, 1,
0.6896787, -0.1401112, 1.944477, 0.3686275, 0, 1, 1,
0.693123, -0.09907117, 1.168081, 0.372549, 0, 1, 1,
0.6934797, 0.1166601, 0.9516652, 0.3803922, 0, 1, 1,
0.6948026, -0.5603669, 3.905205, 0.3843137, 0, 1, 1,
0.6990587, 0.1639589, 1.270713, 0.3921569, 0, 1, 1,
0.6992527, 1.124102, 2.024525, 0.3960784, 0, 1, 1,
0.7003285, 0.008118094, 1.042208, 0.4039216, 0, 1, 1,
0.7058287, 0.1721926, 2.577328, 0.4117647, 0, 1, 1,
0.7083488, -3.008562, 3.978572, 0.4156863, 0, 1, 1,
0.7097059, -1.339462, 1.607174, 0.4235294, 0, 1, 1,
0.7155659, 1.608744, 3.889886, 0.427451, 0, 1, 1,
0.721298, 1.141409, 1.71905, 0.4352941, 0, 1, 1,
0.7229121, -0.1542788, 1.137751, 0.4392157, 0, 1, 1,
0.7276245, -0.598098, 0.5130461, 0.4470588, 0, 1, 1,
0.7310073, 0.2561808, 1.319479, 0.4509804, 0, 1, 1,
0.7374914, 0.7912111, 2.388351, 0.4588235, 0, 1, 1,
0.7401009, 1.991305, 0.1781214, 0.4627451, 0, 1, 1,
0.7409849, -0.01624647, 1.354993, 0.4705882, 0, 1, 1,
0.7424724, -0.974379, 2.25265, 0.4745098, 0, 1, 1,
0.7554476, -1.364574, 2.958511, 0.4823529, 0, 1, 1,
0.7565016, 0.08500445, 2.050974, 0.4862745, 0, 1, 1,
0.7636012, 0.6831964, 1.086053, 0.4941176, 0, 1, 1,
0.7646458, -0.2399674, 1.612462, 0.5019608, 0, 1, 1,
0.7681541, -0.9917583, 0.9326959, 0.5058824, 0, 1, 1,
0.7699075, -0.9147846, 1.373545, 0.5137255, 0, 1, 1,
0.7699625, -0.06269241, 1.695563, 0.5176471, 0, 1, 1,
0.7703184, 0.4797312, 1.546201, 0.5254902, 0, 1, 1,
0.7703501, 0.903852, -0.11479, 0.5294118, 0, 1, 1,
0.7705052, 0.9586374, 0.5623209, 0.5372549, 0, 1, 1,
0.7751116, 0.2360772, 2.197975, 0.5411765, 0, 1, 1,
0.7804135, 0.002897182, 1.760455, 0.5490196, 0, 1, 1,
0.7830594, 0.8434635, 1.290064, 0.5529412, 0, 1, 1,
0.7838765, -0.6228563, 2.266036, 0.5607843, 0, 1, 1,
0.7878357, -0.7222724, 2.413047, 0.5647059, 0, 1, 1,
0.797595, 0.4565296, -1.080618, 0.572549, 0, 1, 1,
0.7980716, -0.1735194, 1.693916, 0.5764706, 0, 1, 1,
0.8001286, 0.1336463, 0.4079644, 0.5843138, 0, 1, 1,
0.8008204, 1.80686, -0.1497502, 0.5882353, 0, 1, 1,
0.8023917, 0.7344531, 0.6622077, 0.5960785, 0, 1, 1,
0.8032597, 1.143242, -0.01412714, 0.6039216, 0, 1, 1,
0.8048788, 0.7148066, 1.489814, 0.6078432, 0, 1, 1,
0.8091644, 0.04478142, 0.8995932, 0.6156863, 0, 1, 1,
0.8133152, 0.06719713, 1.8573, 0.6196079, 0, 1, 1,
0.8297983, -0.812252, 2.060493, 0.627451, 0, 1, 1,
0.8316798, -0.09051253, 1.917574, 0.6313726, 0, 1, 1,
0.83619, -0.09415533, 4.104495, 0.6392157, 0, 1, 1,
0.8454267, 0.2096624, 1.514177, 0.6431373, 0, 1, 1,
0.8464636, 0.3319312, 1.960973, 0.6509804, 0, 1, 1,
0.8506923, 0.7519874, 1.268224, 0.654902, 0, 1, 1,
0.8555562, -0.4463174, 2.597399, 0.6627451, 0, 1, 1,
0.860761, -0.663645, 0.5603037, 0.6666667, 0, 1, 1,
0.8617459, -1.386861, 1.959566, 0.6745098, 0, 1, 1,
0.8645541, 1.390822, 1.17952, 0.6784314, 0, 1, 1,
0.8671939, -0.378664, 2.127449, 0.6862745, 0, 1, 1,
0.8692917, -0.9098184, 2.810577, 0.6901961, 0, 1, 1,
0.8731346, 0.1569115, 0.9887279, 0.6980392, 0, 1, 1,
0.8741058, -0.2212225, 3.873082, 0.7058824, 0, 1, 1,
0.8770899, -1.238312, 2.960814, 0.7098039, 0, 1, 1,
0.8776417, 0.4692604, 1.106455, 0.7176471, 0, 1, 1,
0.8777611, -1.21604, 3.838533, 0.7215686, 0, 1, 1,
0.8824541, -0.3205215, 0.6206555, 0.7294118, 0, 1, 1,
0.8870258, 0.9737971, 0.04024799, 0.7333333, 0, 1, 1,
0.8936666, -0.2931134, 1.207772, 0.7411765, 0, 1, 1,
0.9004777, -0.2513611, 2.571555, 0.7450981, 0, 1, 1,
0.9068437, 0.7731864, 0.9492061, 0.7529412, 0, 1, 1,
0.9136748, 1.857515, 1.22165, 0.7568628, 0, 1, 1,
0.914058, -0.3792648, 3.551551, 0.7647059, 0, 1, 1,
0.9142983, 0.6412065, 1.373239, 0.7686275, 0, 1, 1,
0.9162105, -0.3361387, 1.760907, 0.7764706, 0, 1, 1,
0.9199265, -1.559663, 2.829302, 0.7803922, 0, 1, 1,
0.9210246, 1.05371, 0.9665444, 0.7882353, 0, 1, 1,
0.9290091, 1.874982, 0.6289474, 0.7921569, 0, 1, 1,
0.9323687, -2.409693, 1.415927, 0.8, 0, 1, 1,
0.9373489, -0.3407447, 0.4864745, 0.8078431, 0, 1, 1,
0.9408596, 0.9513735, 0.5214893, 0.8117647, 0, 1, 1,
0.9435517, 0.2404231, 1.432653, 0.8196079, 0, 1, 1,
0.9526176, -0.3641969, 2.654793, 0.8235294, 0, 1, 1,
0.9530777, 1.271639, 0.3276074, 0.8313726, 0, 1, 1,
0.9548302, -0.5713893, 1.724367, 0.8352941, 0, 1, 1,
0.9564179, 1.06436, 1.38409, 0.8431373, 0, 1, 1,
0.9578651, -1.224672, 1.253648, 0.8470588, 0, 1, 1,
0.9688378, 0.7527345, 2.229292, 0.854902, 0, 1, 1,
0.9734408, 0.9245009, -0.2135495, 0.8588235, 0, 1, 1,
0.9766268, 0.3993846, -0.2790498, 0.8666667, 0, 1, 1,
0.9811907, -1.22094, 3.950682, 0.8705882, 0, 1, 1,
0.9865329, -0.7346386, 2.534755, 0.8784314, 0, 1, 1,
1.00862, -1.1598, 2.329313, 0.8823529, 0, 1, 1,
1.008947, -0.01493634, 2.299235, 0.8901961, 0, 1, 1,
1.010289, 0.4721189, 0.6116301, 0.8941177, 0, 1, 1,
1.014157, 0.3153396, 3.126931, 0.9019608, 0, 1, 1,
1.026972, 0.1724844, 1.774743, 0.9098039, 0, 1, 1,
1.027046, -1.384143, 3.451542, 0.9137255, 0, 1, 1,
1.030443, 0.6084564, 1.667607, 0.9215686, 0, 1, 1,
1.033669, -0.4570445, 3.256776, 0.9254902, 0, 1, 1,
1.034315, 2.079589, 1.801025, 0.9333333, 0, 1, 1,
1.034986, -2.534648, 2.631238, 0.9372549, 0, 1, 1,
1.046237, -1.203985, 4.512743, 0.945098, 0, 1, 1,
1.050111, -0.8144662, 0.7785774, 0.9490196, 0, 1, 1,
1.051841, 1.668073, 0.3173212, 0.9568627, 0, 1, 1,
1.052285, 1.086926, -0.29512, 0.9607843, 0, 1, 1,
1.054208, 0.9023862, 0.5505738, 0.9686275, 0, 1, 1,
1.056895, 1.179242, 3.808213, 0.972549, 0, 1, 1,
1.056987, -0.4165004, 0.226052, 0.9803922, 0, 1, 1,
1.075679, 0.4757435, 2.204052, 0.9843137, 0, 1, 1,
1.080355, -0.3997868, 2.331948, 0.9921569, 0, 1, 1,
1.084608, -1.225481, 3.408455, 0.9960784, 0, 1, 1,
1.090523, -0.4096557, 4.423591, 1, 0, 0.9960784, 1,
1.091128, -0.5760613, 1.896809, 1, 0, 0.9882353, 1,
1.091379, -1.535905, 2.962562, 1, 0, 0.9843137, 1,
1.091696, -0.9726718, 1.902254, 1, 0, 0.9764706, 1,
1.093823, 1.168139, 1.765734, 1, 0, 0.972549, 1,
1.094087, 0.7491274, 2.569259, 1, 0, 0.9647059, 1,
1.095675, 0.4672762, 0.5151744, 1, 0, 0.9607843, 1,
1.097034, -2.173059, 1.516605, 1, 0, 0.9529412, 1,
1.107453, 1.577028, -0.4216336, 1, 0, 0.9490196, 1,
1.112754, -2.01488, 2.808316, 1, 0, 0.9411765, 1,
1.115306, 0.5379616, 3.112228, 1, 0, 0.9372549, 1,
1.118419, 0.1387776, 1.742155, 1, 0, 0.9294118, 1,
1.135672, 0.05943762, 2.207645, 1, 0, 0.9254902, 1,
1.140859, 3.092725, 0.7680163, 1, 0, 0.9176471, 1,
1.148885, -0.1951926, 0.8999696, 1, 0, 0.9137255, 1,
1.154201, 0.8559826, 2.009928, 1, 0, 0.9058824, 1,
1.155556, -0.1533077, 1.83557, 1, 0, 0.9019608, 1,
1.168585, -1.691563, 0.7316415, 1, 0, 0.8941177, 1,
1.179149, 0.1515431, 1.828181, 1, 0, 0.8862745, 1,
1.179905, -1.716962, 2.3376, 1, 0, 0.8823529, 1,
1.180454, -1.632324, 1.793483, 1, 0, 0.8745098, 1,
1.183363, 0.2591272, 1.533166, 1, 0, 0.8705882, 1,
1.188795, -1.496079, 2.17139, 1, 0, 0.8627451, 1,
1.189821, -0.9740959, 1.372821, 1, 0, 0.8588235, 1,
1.190369, 0.2994125, 0.9279396, 1, 0, 0.8509804, 1,
1.196704, -1.042005, 3.396976, 1, 0, 0.8470588, 1,
1.204902, -0.08012835, 0.4508459, 1, 0, 0.8392157, 1,
1.207668, -1.041901, 1.090318, 1, 0, 0.8352941, 1,
1.230256, -1.050339, 1.32868, 1, 0, 0.827451, 1,
1.232738, -1.150671, 3.19995, 1, 0, 0.8235294, 1,
1.233534, 0.00372342, -0.296772, 1, 0, 0.8156863, 1,
1.23973, 0.9356706, 0.8496276, 1, 0, 0.8117647, 1,
1.240937, 1.059875, 0.2181948, 1, 0, 0.8039216, 1,
1.24551, -0.698844, 1.739272, 1, 0, 0.7960784, 1,
1.247843, 0.1882076, 2.07579, 1, 0, 0.7921569, 1,
1.253361, 1.256767, -0.3277423, 1, 0, 0.7843137, 1,
1.26748, -0.1946034, 2.222934, 1, 0, 0.7803922, 1,
1.271239, 0.1915601, 2.18971, 1, 0, 0.772549, 1,
1.275147, -2.221764, 2.360799, 1, 0, 0.7686275, 1,
1.277398, -0.107412, 0.7668194, 1, 0, 0.7607843, 1,
1.280782, -0.06106773, 0.7127131, 1, 0, 0.7568628, 1,
1.282961, -0.306637, 1.914776, 1, 0, 0.7490196, 1,
1.285068, -0.9696726, 2.444479, 1, 0, 0.7450981, 1,
1.289044, -0.3427296, 2.821334, 1, 0, 0.7372549, 1,
1.290197, -1.623362, 2.676399, 1, 0, 0.7333333, 1,
1.2942, 1.057336, 0.2763374, 1, 0, 0.7254902, 1,
1.295925, -0.006498888, 2.336337, 1, 0, 0.7215686, 1,
1.30367, -1.319644, 2.041158, 1, 0, 0.7137255, 1,
1.305595, 0.6376516, 1.401915, 1, 0, 0.7098039, 1,
1.310137, 1.842625, 1.266201, 1, 0, 0.7019608, 1,
1.324024, 0.3319045, 0.3656172, 1, 0, 0.6941177, 1,
1.328252, 0.4097596, 2.095215, 1, 0, 0.6901961, 1,
1.339312, 1.653919, -0.4383203, 1, 0, 0.682353, 1,
1.339716, 0.3446031, 0.6757049, 1, 0, 0.6784314, 1,
1.33972, 0.2740203, 1.052559, 1, 0, 0.6705883, 1,
1.345375, -1.067406, 2.572606, 1, 0, 0.6666667, 1,
1.345714, -0.1581062, 2.204949, 1, 0, 0.6588235, 1,
1.345761, 1.242177, -0.1994899, 1, 0, 0.654902, 1,
1.35179, -0.3149275, 2.691814, 1, 0, 0.6470588, 1,
1.352993, -2.146168, 3.225209, 1, 0, 0.6431373, 1,
1.3571, 0.09774742, 3.627633, 1, 0, 0.6352941, 1,
1.369539, 0.3964348, 1.680807, 1, 0, 0.6313726, 1,
1.385733, 1.466445, 1.698157, 1, 0, 0.6235294, 1,
1.389068, -0.8310046, 2.997261, 1, 0, 0.6196079, 1,
1.390914, 0.1013959, 3.61625, 1, 0, 0.6117647, 1,
1.400584, -0.45206, -0.1004643, 1, 0, 0.6078432, 1,
1.406859, 0.1827103, 1.804959, 1, 0, 0.6, 1,
1.416362, 0.7856513, 0.6183124, 1, 0, 0.5921569, 1,
1.417049, 0.9324314, 2.53573, 1, 0, 0.5882353, 1,
1.429149, -0.2938578, 1.67116, 1, 0, 0.5803922, 1,
1.433296, -0.2573366, 1.921135, 1, 0, 0.5764706, 1,
1.433831, 0.4186236, -1.485688, 1, 0, 0.5686275, 1,
1.435558, -0.9070959, 3.244232, 1, 0, 0.5647059, 1,
1.435752, -0.4553822, 2.567157, 1, 0, 0.5568628, 1,
1.44155, -1.156334, 3.219384, 1, 0, 0.5529412, 1,
1.444402, -0.72754, 3.402315, 1, 0, 0.5450981, 1,
1.449365, -0.06002595, 1.721117, 1, 0, 0.5411765, 1,
1.451732, -0.3283962, 2.630454, 1, 0, 0.5333334, 1,
1.45735, -0.4949743, 0.4691943, 1, 0, 0.5294118, 1,
1.472211, 0.1940708, 1.615376, 1, 0, 0.5215687, 1,
1.473562, -0.9441719, 1.739419, 1, 0, 0.5176471, 1,
1.479166, 1.041452, -0.06821039, 1, 0, 0.509804, 1,
1.48063, -0.7414434, 2.775076, 1, 0, 0.5058824, 1,
1.485076, -0.2528284, 1.236618, 1, 0, 0.4980392, 1,
1.493518, -0.1122362, 1.071799, 1, 0, 0.4901961, 1,
1.526893, 2.003171, -0.3667731, 1, 0, 0.4862745, 1,
1.528855, -0.4943603, 2.416799, 1, 0, 0.4784314, 1,
1.535292, 0.4779651, 2.47691, 1, 0, 0.4745098, 1,
1.537879, 0.8760842, 1.23127, 1, 0, 0.4666667, 1,
1.540764, -0.5421934, -0.4545005, 1, 0, 0.4627451, 1,
1.541243, 1.459501, 2.007104, 1, 0, 0.454902, 1,
1.545151, 0.1904206, 4.099966, 1, 0, 0.4509804, 1,
1.546073, 0.09453344, 2.207752, 1, 0, 0.4431373, 1,
1.548423, 0.7585918, 1.361672, 1, 0, 0.4392157, 1,
1.551451, 0.6844556, 0.5464104, 1, 0, 0.4313726, 1,
1.56037, 1.267017, 1.180451, 1, 0, 0.427451, 1,
1.568579, -1.22828, 3.082232, 1, 0, 0.4196078, 1,
1.570727, 0.987068, 2.285707, 1, 0, 0.4156863, 1,
1.57729, 0.3208238, 2.819715, 1, 0, 0.4078431, 1,
1.581628, -0.6493906, 0.94055, 1, 0, 0.4039216, 1,
1.582359, 0.2666535, 0.2635306, 1, 0, 0.3960784, 1,
1.595128, 2.034531, 1.151934, 1, 0, 0.3882353, 1,
1.624758, -1.20567, 1.467434, 1, 0, 0.3843137, 1,
1.628095, 0.2222775, 0.8441618, 1, 0, 0.3764706, 1,
1.630499, 0.8260404, 1.98924, 1, 0, 0.372549, 1,
1.632529, 0.710847, 1.911591, 1, 0, 0.3647059, 1,
1.644791, -0.3558016, 2.044014, 1, 0, 0.3607843, 1,
1.665889, -0.134934, 1.093546, 1, 0, 0.3529412, 1,
1.668686, -0.3209861, 1.863753, 1, 0, 0.3490196, 1,
1.693194, -1.09882, 2.526336, 1, 0, 0.3411765, 1,
1.693643, 0.5119645, 0.4769531, 1, 0, 0.3372549, 1,
1.703778, 1.428223, -0.07406013, 1, 0, 0.3294118, 1,
1.705695, 0.2874453, 0.4902336, 1, 0, 0.3254902, 1,
1.721566, -1.141725, 1.680332, 1, 0, 0.3176471, 1,
1.729439, -0.6015961, 3.264845, 1, 0, 0.3137255, 1,
1.739074, 0.8637758, 1.710682, 1, 0, 0.3058824, 1,
1.740467, 0.556485, 1.328216, 1, 0, 0.2980392, 1,
1.741454, 1.829161, 0.9919987, 1, 0, 0.2941177, 1,
1.759816, 0.008558257, -0.2560202, 1, 0, 0.2862745, 1,
1.763188, 1.160866, -0.2516327, 1, 0, 0.282353, 1,
1.764844, 0.3134573, 1.612762, 1, 0, 0.2745098, 1,
1.764967, 0.5331281, -0.3080055, 1, 0, 0.2705882, 1,
1.768862, 0.5986845, 3.197404, 1, 0, 0.2627451, 1,
1.775287, 0.1714842, 1.479317, 1, 0, 0.2588235, 1,
1.779832, 0.7132964, 1.105496, 1, 0, 0.2509804, 1,
1.780384, 0.3756838, 1.007685, 1, 0, 0.2470588, 1,
1.819768, -1.947599, 2.896294, 1, 0, 0.2392157, 1,
1.841786, -1.389511, 2.67357, 1, 0, 0.2352941, 1,
1.844276, -1.371518, 1.198507, 1, 0, 0.227451, 1,
1.88071, 1.034942, 1.406808, 1, 0, 0.2235294, 1,
1.883868, -0.9584429, 1.57619, 1, 0, 0.2156863, 1,
1.912812, -1.223675, 1.993396, 1, 0, 0.2117647, 1,
1.924896, 0.1834727, 2.502862, 1, 0, 0.2039216, 1,
1.925291, 1.205804, 1.747816, 1, 0, 0.1960784, 1,
1.928955, 0.1870672, 1.822031, 1, 0, 0.1921569, 1,
1.931079, 0.9565246, 2.424573, 1, 0, 0.1843137, 1,
1.937282, -0.9247773, 2.756502, 1, 0, 0.1803922, 1,
1.961849, -1.610364, 2.445555, 1, 0, 0.172549, 1,
2.011675, -0.2235712, 3.069355, 1, 0, 0.1686275, 1,
2.033759, -0.3357979, 2.468948, 1, 0, 0.1607843, 1,
2.042824, 0.3286841, 0.6084613, 1, 0, 0.1568628, 1,
2.051816, 0.5216661, 1.285835, 1, 0, 0.1490196, 1,
2.0559, 0.9022084, 0.2363322, 1, 0, 0.145098, 1,
2.087817, 0.6059813, 0.7355127, 1, 0, 0.1372549, 1,
2.088892, -0.03189135, 2.356435, 1, 0, 0.1333333, 1,
2.095183, -0.4300906, -0.7584624, 1, 0, 0.1254902, 1,
2.112845, -0.7088782, 1.658583, 1, 0, 0.1215686, 1,
2.132737, -0.1032888, 1.316831, 1, 0, 0.1137255, 1,
2.165489, 0.4829484, 2.898388, 1, 0, 0.1098039, 1,
2.170818, -0.4676323, 0.2077709, 1, 0, 0.1019608, 1,
2.204693, 0.8186367, -0.01686969, 1, 0, 0.09411765, 1,
2.213045, -0.2309265, 0.9724599, 1, 0, 0.09019608, 1,
2.248818, -0.1194979, 0.6924989, 1, 0, 0.08235294, 1,
2.279701, -0.6360343, 0.8832561, 1, 0, 0.07843138, 1,
2.336665, 1.66625, 2.740311, 1, 0, 0.07058824, 1,
2.404932, -0.8649853, 2.426201, 1, 0, 0.06666667, 1,
2.448405, -0.5908556, 2.987725, 1, 0, 0.05882353, 1,
2.495711, -0.157537, -0.7076609, 1, 0, 0.05490196, 1,
2.512731, 0.5956346, 3.16281, 1, 0, 0.04705882, 1,
2.674373, -1.397586, 3.582887, 1, 0, 0.04313726, 1,
2.741593, 1.245506, 1.618705, 1, 0, 0.03529412, 1,
2.743057, -0.3243252, 2.603447, 1, 0, 0.03137255, 1,
2.783067, -0.5033149, 1.967767, 1, 0, 0.02352941, 1,
2.811575, -1.156359, 0.7844113, 1, 0, 0.01960784, 1,
2.996347, 0.6851909, 0.6217866, 1, 0, 0.01176471, 1,
3.112125, -0.6073427, 2.62607, 1, 0, 0.007843138, 1
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
-0.1300826, -4.783697, -7.628846, 0, -0.5, 0.5, 0.5,
-0.1300826, -4.783697, -7.628846, 1, -0.5, 0.5, 0.5,
-0.1300826, -4.783697, -7.628846, 1, 1.5, 0.5, 0.5,
-0.1300826, -4.783697, -7.628846, 0, 1.5, 0.5, 0.5
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
-4.471398, -0.2747065, -7.628846, 0, -0.5, 0.5, 0.5,
-4.471398, -0.2747065, -7.628846, 1, -0.5, 0.5, 0.5,
-4.471398, -0.2747065, -7.628846, 1, 1.5, 0.5, 0.5,
-4.471398, -0.2747065, -7.628846, 0, 1.5, 0.5, 0.5
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
-4.471398, -4.783697, 0.09815168, 0, -0.5, 0.5, 0.5,
-4.471398, -4.783697, 0.09815168, 1, -0.5, 0.5, 0.5,
-4.471398, -4.783697, 0.09815168, 1, 1.5, 0.5, 0.5,
-4.471398, -4.783697, 0.09815168, 0, 1.5, 0.5, 0.5
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
-3, -3.743161, -5.845693,
3, -3.743161, -5.845693,
-3, -3.743161, -5.845693,
-3, -3.916584, -6.142885,
-2, -3.743161, -5.845693,
-2, -3.916584, -6.142885,
-1, -3.743161, -5.845693,
-1, -3.916584, -6.142885,
0, -3.743161, -5.845693,
0, -3.916584, -6.142885,
1, -3.743161, -5.845693,
1, -3.916584, -6.142885,
2, -3.743161, -5.845693,
2, -3.916584, -6.142885,
3, -3.743161, -5.845693,
3, -3.916584, -6.142885
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
-3, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
-3, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
-3, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
-3, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
-2, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
-2, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
-2, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
-2, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
-1, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
-1, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
-1, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
-1, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
0, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
0, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
0, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
0, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
1, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
1, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
1, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
1, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
2, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
2, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
2, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
2, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5,
3, -4.263429, -6.737269, 0, -0.5, 0.5, 0.5,
3, -4.263429, -6.737269, 1, -0.5, 0.5, 0.5,
3, -4.263429, -6.737269, 1, 1.5, 0.5, 0.5,
3, -4.263429, -6.737269, 0, 1.5, 0.5, 0.5
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
-3.469556, -3, -5.845693,
-3.469556, 3, -5.845693,
-3.469556, -3, -5.845693,
-3.63653, -3, -6.142885,
-3.469556, -2, -5.845693,
-3.63653, -2, -6.142885,
-3.469556, -1, -5.845693,
-3.63653, -1, -6.142885,
-3.469556, 0, -5.845693,
-3.63653, 0, -6.142885,
-3.469556, 1, -5.845693,
-3.63653, 1, -6.142885,
-3.469556, 2, -5.845693,
-3.63653, 2, -6.142885,
-3.469556, 3, -5.845693,
-3.63653, 3, -6.142885
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
-3.970477, -3, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, -3, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, -3, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, -3, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, -2, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, -2, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, -2, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, -2, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, -1, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, -1, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, -1, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, -1, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, 0, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, 0, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, 0, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, 0, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, 1, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, 1, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, 1, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, 1, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, 2, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, 2, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, 2, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, 2, -6.737269, 0, 1.5, 0.5, 0.5,
-3.970477, 3, -6.737269, 0, -0.5, 0.5, 0.5,
-3.970477, 3, -6.737269, 1, -0.5, 0.5, 0.5,
-3.970477, 3, -6.737269, 1, 1.5, 0.5, 0.5,
-3.970477, 3, -6.737269, 0, 1.5, 0.5, 0.5
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
-3.469556, -3.743161, -4,
-3.469556, -3.743161, 4,
-3.469556, -3.743161, -4,
-3.63653, -3.916584, -4,
-3.469556, -3.743161, -2,
-3.63653, -3.916584, -2,
-3.469556, -3.743161, 0,
-3.63653, -3.916584, 0,
-3.469556, -3.743161, 2,
-3.63653, -3.916584, 2,
-3.469556, -3.743161, 4,
-3.63653, -3.916584, 4
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
-3.970477, -4.263429, -4, 0, -0.5, 0.5, 0.5,
-3.970477, -4.263429, -4, 1, -0.5, 0.5, 0.5,
-3.970477, -4.263429, -4, 1, 1.5, 0.5, 0.5,
-3.970477, -4.263429, -4, 0, 1.5, 0.5, 0.5,
-3.970477, -4.263429, -2, 0, -0.5, 0.5, 0.5,
-3.970477, -4.263429, -2, 1, -0.5, 0.5, 0.5,
-3.970477, -4.263429, -2, 1, 1.5, 0.5, 0.5,
-3.970477, -4.263429, -2, 0, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 0, 0, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 0, 1, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 0, 1, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 0, 0, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 2, 0, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 2, 1, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 2, 1, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 2, 0, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 4, 0, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 4, 1, -0.5, 0.5, 0.5,
-3.970477, -4.263429, 4, 1, 1.5, 0.5, 0.5,
-3.970477, -4.263429, 4, 0, 1.5, 0.5, 0.5
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
-3.469556, -3.743161, -5.845693,
-3.469556, 3.193748, -5.845693,
-3.469556, -3.743161, 6.041996,
-3.469556, 3.193748, 6.041996,
-3.469556, -3.743161, -5.845693,
-3.469556, -3.743161, 6.041996,
-3.469556, 3.193748, -5.845693,
-3.469556, 3.193748, 6.041996,
-3.469556, -3.743161, -5.845693,
3.209391, -3.743161, -5.845693,
-3.469556, -3.743161, 6.041996,
3.209391, -3.743161, 6.041996,
-3.469556, 3.193748, -5.845693,
3.209391, 3.193748, -5.845693,
-3.469556, 3.193748, 6.041996,
3.209391, 3.193748, 6.041996,
3.209391, -3.743161, -5.845693,
3.209391, 3.193748, -5.845693,
3.209391, -3.743161, 6.041996,
3.209391, 3.193748, 6.041996,
3.209391, -3.743161, -5.845693,
3.209391, -3.743161, 6.041996,
3.209391, 3.193748, -5.845693,
3.209391, 3.193748, 6.041996
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
var radius = 8.169138;
var distance = 36.34542;
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
mvMatrix.translate( 0.1300826, 0.2747065, -0.09815168 );
mvMatrix.scale( 1.322459, 1.273281, 0.7430067 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.34542);
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
succinic_acid<-read.table("succinic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-succinic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
```

```r
y<-succinic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
```

```r
z<-succinic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'succinic_acid' not found
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
-3.37229, -0.6133736, -2.015757, 0, 0, 1, 1, 1,
-2.883448, -0.588974, -2.074665, 1, 0, 0, 1, 1,
-2.823942, -0.004179914, -1.376716, 1, 0, 0, 1, 1,
-2.586477, 1.887903, -0.480822, 1, 0, 0, 1, 1,
-2.335825, 2.062376, -0.721173, 1, 0, 0, 1, 1,
-2.305033, -1.558525, -2.263557, 1, 0, 0, 1, 1,
-2.279503, 1.216224, -1.684857, 0, 0, 0, 1, 1,
-2.257355, -1.190607, -2.313996, 0, 0, 0, 1, 1,
-2.253302, -1.147414, -3.067677, 0, 0, 0, 1, 1,
-2.25307, -0.1204471, -1.823789, 0, 0, 0, 1, 1,
-2.237885, -0.5021183, -1.858571, 0, 0, 0, 1, 1,
-2.20798, -1.27028, -1.190119, 0, 0, 0, 1, 1,
-2.198033, -0.01890305, -2.752695, 0, 0, 0, 1, 1,
-2.191609, -1.371419, -2.29017, 1, 1, 1, 1, 1,
-2.189745, -0.9171364, -1.645299, 1, 1, 1, 1, 1,
-2.161065, -0.2376576, -1.69609, 1, 1, 1, 1, 1,
-2.159316, 1.75705, 0.5439946, 1, 1, 1, 1, 1,
-2.156207, 0.01823002, -1.897206, 1, 1, 1, 1, 1,
-2.134781, 0.131128, -2.459573, 1, 1, 1, 1, 1,
-2.117749, 0.1143296, -0.4549289, 1, 1, 1, 1, 1,
-2.113173, -0.4809746, -1.775557, 1, 1, 1, 1, 1,
-2.10631, -0.6348611, -1.375834, 1, 1, 1, 1, 1,
-2.077492, 1.760011, -2.63816, 1, 1, 1, 1, 1,
-2.046368, 1.146038, 0.8437207, 1, 1, 1, 1, 1,
-2.007285, 1.510895, 0.05286362, 1, 1, 1, 1, 1,
-1.951394, 0.3491824, -2.41561, 1, 1, 1, 1, 1,
-1.927194, -0.7251263, -1.526606, 1, 1, 1, 1, 1,
-1.901178, -0.3977563, -0.655327, 1, 1, 1, 1, 1,
-1.900017, 0.7809334, -1.308463, 0, 0, 1, 1, 1,
-1.891984, -1.222652, -2.015637, 1, 0, 0, 1, 1,
-1.851268, -1.229412, -3.354048, 1, 0, 0, 1, 1,
-1.823151, -0.3701736, -0.4248229, 1, 0, 0, 1, 1,
-1.808157, -0.9353039, -3.495286, 1, 0, 0, 1, 1,
-1.804132, -1.807693, -0.5206663, 1, 0, 0, 1, 1,
-1.803063, -0.1871455, -1.199872, 0, 0, 0, 1, 1,
-1.800206, -1.353867, -2.502109, 0, 0, 0, 1, 1,
-1.792473, 0.1519069, -1.20184, 0, 0, 0, 1, 1,
-1.782598, -0.09627601, -0.2393188, 0, 0, 0, 1, 1,
-1.732261, 0.5411506, -1.324241, 0, 0, 0, 1, 1,
-1.709348, 0.8439351, -0.4990422, 0, 0, 0, 1, 1,
-1.705261, -0.9783918, -2.437433, 0, 0, 0, 1, 1,
-1.688258, -1.044371, -3.166214, 1, 1, 1, 1, 1,
-1.684355, -0.1410891, -1.428726, 1, 1, 1, 1, 1,
-1.641109, 0.05526605, -1.778916, 1, 1, 1, 1, 1,
-1.639316, 0.6533894, -1.331451, 1, 1, 1, 1, 1,
-1.637808, 0.3914139, -1.552711, 1, 1, 1, 1, 1,
-1.630971, 2.168527, -0.4097377, 1, 1, 1, 1, 1,
-1.630047, 1.225508, -1.267117, 1, 1, 1, 1, 1,
-1.622365, 0.4946412, -2.514124, 1, 1, 1, 1, 1,
-1.611436, 1.727287, 0.5325032, 1, 1, 1, 1, 1,
-1.600328, 0.5364473, -1.01704, 1, 1, 1, 1, 1,
-1.599312, -0.1623897, -1.045968, 1, 1, 1, 1, 1,
-1.598874, 2.312765, -1.163462, 1, 1, 1, 1, 1,
-1.581995, -1.030833, -1.914405, 1, 1, 1, 1, 1,
-1.581993, 0.411014, 0.2378195, 1, 1, 1, 1, 1,
-1.581966, 1.048335, -1.935028, 1, 1, 1, 1, 1,
-1.576378, 1.247353, -1.739513, 0, 0, 1, 1, 1,
-1.569496, -1.072854, -0.01057827, 1, 0, 0, 1, 1,
-1.56624, 2.634159, 0.09996948, 1, 0, 0, 1, 1,
-1.561018, -1.688882, -3.736399, 1, 0, 0, 1, 1,
-1.559186, 0.1317155, -2.348342, 1, 0, 0, 1, 1,
-1.556134, -0.8634472, -3.368464, 1, 0, 0, 1, 1,
-1.548791, 0.579064, -1.335389, 0, 0, 0, 1, 1,
-1.52673, 0.3799415, -0.8483923, 0, 0, 0, 1, 1,
-1.516494, 0.6925741, -0.2809723, 0, 0, 0, 1, 1,
-1.502888, -2.10497, -3.179209, 0, 0, 0, 1, 1,
-1.493858, 0.373079, -1.337899, 0, 0, 0, 1, 1,
-1.489661, -0.8072681, -1.602338, 0, 0, 0, 1, 1,
-1.487521, 0.6412455, -1.290037, 0, 0, 0, 1, 1,
-1.486167, 1.347215, -1.653173, 1, 1, 1, 1, 1,
-1.478096, -1.133039, -1.546875, 1, 1, 1, 1, 1,
-1.464486, -0.3109205, -2.716531, 1, 1, 1, 1, 1,
-1.43823, -1.713296, -1.041737, 1, 1, 1, 1, 1,
-1.429285, 0.6677473, -2.486456, 1, 1, 1, 1, 1,
-1.42573, 1.000938, 1.486905, 1, 1, 1, 1, 1,
-1.421815, 0.6530596, -0.1052607, 1, 1, 1, 1, 1,
-1.404782, -0.3268054, -0.06199105, 1, 1, 1, 1, 1,
-1.395152, 0.1302725, -1.553492, 1, 1, 1, 1, 1,
-1.393239, -1.068576, -3.896188, 1, 1, 1, 1, 1,
-1.381396, 0.2625723, -1.431836, 1, 1, 1, 1, 1,
-1.376947, -1.976858, -4.374387, 1, 1, 1, 1, 1,
-1.374391, 0.3553309, -0.6012669, 1, 1, 1, 1, 1,
-1.369864, 0.2216507, -0.9905941, 1, 1, 1, 1, 1,
-1.355653, -0.562848, -2.111626, 1, 1, 1, 1, 1,
-1.3556, -0.06843837, -1.879292, 0, 0, 1, 1, 1,
-1.348103, -0.8851875, -0.7928091, 1, 0, 0, 1, 1,
-1.346773, 1.0136, -0.8977274, 1, 0, 0, 1, 1,
-1.319705, -0.3746572, -2.507508, 1, 0, 0, 1, 1,
-1.306303, 2.292141, -0.983712, 1, 0, 0, 1, 1,
-1.290342, -0.4959086, -2.099343, 1, 0, 0, 1, 1,
-1.28554, -0.2798847, -0.03597694, 0, 0, 0, 1, 1,
-1.283338, -1.586231, -3.229846, 0, 0, 0, 1, 1,
-1.2733, -0.2531392, -2.648577, 0, 0, 0, 1, 1,
-1.273, -0.5384837, -3.347171, 0, 0, 0, 1, 1,
-1.253226, -0.4631398, -1.522842, 0, 0, 0, 1, 1,
-1.252847, -0.4391029, -2.187282, 0, 0, 0, 1, 1,
-1.245231, 0.09760872, 0.2702726, 0, 0, 0, 1, 1,
-1.234621, 0.2727091, -0.7577384, 1, 1, 1, 1, 1,
-1.223249, 0.05315107, -0.03911574, 1, 1, 1, 1, 1,
-1.220516, -0.05083607, -3.297271, 1, 1, 1, 1, 1,
-1.215524, -0.1565341, -3.004422, 1, 1, 1, 1, 1,
-1.204232, 1.186293, -1.448823, 1, 1, 1, 1, 1,
-1.191411, 1.426801, -0.4983326, 1, 1, 1, 1, 1,
-1.183988, -0.8086313, -3.362452, 1, 1, 1, 1, 1,
-1.175182, -0.7765208, -1.223733, 1, 1, 1, 1, 1,
-1.166462, -0.6537507, -2.05748, 1, 1, 1, 1, 1,
-1.161752, -0.2785111, -2.370766, 1, 1, 1, 1, 1,
-1.158089, 0.2303393, -0.3459891, 1, 1, 1, 1, 1,
-1.155419, 0.7901645, -0.6561079, 1, 1, 1, 1, 1,
-1.144383, -0.6818489, -1.691055, 1, 1, 1, 1, 1,
-1.141737, -0.9569632, -1.889159, 1, 1, 1, 1, 1,
-1.140149, -1.15826, -1.957801, 1, 1, 1, 1, 1,
-1.137887, 1.563451, -0.496505, 0, 0, 1, 1, 1,
-1.135794, -1.437806, -2.49675, 1, 0, 0, 1, 1,
-1.130635, 1.796036, 0.1246321, 1, 0, 0, 1, 1,
-1.12984, 0.07318188, -1.33315, 1, 0, 0, 1, 1,
-1.127695, 0.01866596, -3.654059, 1, 0, 0, 1, 1,
-1.12584, 0.8772847, -0.4269389, 1, 0, 0, 1, 1,
-1.122635, 2.132889, -0.8789895, 0, 0, 0, 1, 1,
-1.121045, 0.4021594, -0.3065295, 0, 0, 0, 1, 1,
-1.116807, 1.083174, -0.1521792, 0, 0, 0, 1, 1,
-1.107443, -0.5114964, -0.1580904, 0, 0, 0, 1, 1,
-1.101315, 0.1441156, -2.569358, 0, 0, 0, 1, 1,
-1.095971, -0.4543245, -2.42866, 0, 0, 0, 1, 1,
-1.094163, 0.03160657, -1.903273, 0, 0, 0, 1, 1,
-1.084505, 0.1968153, -2.434247, 1, 1, 1, 1, 1,
-1.084469, 0.1643227, -1.857653, 1, 1, 1, 1, 1,
-1.081965, 2.194175, -0.2374614, 1, 1, 1, 1, 1,
-1.079303, -1.046237, -1.575241, 1, 1, 1, 1, 1,
-1.066847, -0.587509, -1.68881, 1, 1, 1, 1, 1,
-1.066164, -1.424938, -1.381056, 1, 1, 1, 1, 1,
-1.061001, -0.1471477, -0.1897964, 1, 1, 1, 1, 1,
-1.056141, 1.117055, 0.3898994, 1, 1, 1, 1, 1,
-1.047891, 1.063806, -1.21707, 1, 1, 1, 1, 1,
-1.038746, -0.1109325, -2.623767, 1, 1, 1, 1, 1,
-1.033222, -0.7615329, -1.054794, 1, 1, 1, 1, 1,
-1.030561, -0.1154232, -0.8430039, 1, 1, 1, 1, 1,
-1.028096, -1.201044, -2.844484, 1, 1, 1, 1, 1,
-1.026264, -0.8797414, -1.88159, 1, 1, 1, 1, 1,
-1.024048, 0.5671341, -0.1300069, 1, 1, 1, 1, 1,
-1.018387, 0.7617806, -1.988001, 0, 0, 1, 1, 1,
-1.008514, 1.666653, 0.5535613, 1, 0, 0, 1, 1,
-1.006075, -0.5859001, -3.68478, 1, 0, 0, 1, 1,
-0.9998783, 2.313619, -1.421447, 1, 0, 0, 1, 1,
-0.9942823, 1.836996, -2.282929, 1, 0, 0, 1, 1,
-0.9936067, -1.159213, -4.317557, 1, 0, 0, 1, 1,
-0.991354, -0.3314986, -4.052701, 0, 0, 0, 1, 1,
-0.9831527, -0.9863861, -2.962873, 0, 0, 0, 1, 1,
-0.9810934, -0.1517116, -1.649427, 0, 0, 0, 1, 1,
-0.9619849, -0.8121111, -1.519875, 0, 0, 0, 1, 1,
-0.959655, 0.7733213, -2.670722, 0, 0, 0, 1, 1,
-0.955353, -0.3466306, -1.632538, 0, 0, 0, 1, 1,
-0.9525509, -0.6515223, -2.155284, 0, 0, 0, 1, 1,
-0.9472274, -0.08832985, -1.61561, 1, 1, 1, 1, 1,
-0.9452783, 2.08865, -1.178929, 1, 1, 1, 1, 1,
-0.9418969, -0.7770835, -2.364468, 1, 1, 1, 1, 1,
-0.9411876, 0.9551877, 0.02740107, 1, 1, 1, 1, 1,
-0.9371629, -0.2261468, -0.7263849, 1, 1, 1, 1, 1,
-0.9368413, -0.2004035, -1.743433, 1, 1, 1, 1, 1,
-0.9337504, -0.01793519, -1.250885, 1, 1, 1, 1, 1,
-0.9310209, 0.0686079, -1.998344, 1, 1, 1, 1, 1,
-0.9241025, -0.8010033, -4.047404, 1, 1, 1, 1, 1,
-0.9240626, 0.0844439, -1.909858, 1, 1, 1, 1, 1,
-0.9193636, 0.383737, -2.177443, 1, 1, 1, 1, 1,
-0.9178957, 1.844657, -0.5345777, 1, 1, 1, 1, 1,
-0.9168711, 0.2339143, -0.4618247, 1, 1, 1, 1, 1,
-0.9125813, -0.1171419, -1.34907, 1, 1, 1, 1, 1,
-0.9095605, 0.09246185, -1.146378, 1, 1, 1, 1, 1,
-0.9093727, -2.044272, -2.473565, 0, 0, 1, 1, 1,
-0.9058505, -0.2310221, -3.294936, 1, 0, 0, 1, 1,
-0.9044608, -0.01525095, -3.051607, 1, 0, 0, 1, 1,
-0.8986102, -0.5689151, -2.234107, 1, 0, 0, 1, 1,
-0.8904365, 0.8239194, -1.717444, 1, 0, 0, 1, 1,
-0.8903683, 0.1440843, -2.187689, 1, 0, 0, 1, 1,
-0.8901957, 0.4205912, -1.595573, 0, 0, 0, 1, 1,
-0.8846564, 0.06427883, -0.8480595, 0, 0, 0, 1, 1,
-0.8813912, -0.9401605, -0.9510491, 0, 0, 0, 1, 1,
-0.8809412, -1.222728, -2.562133, 0, 0, 0, 1, 1,
-0.8754198, -1.307003, -1.971559, 0, 0, 0, 1, 1,
-0.8690311, 1.906158, -0.4097921, 0, 0, 0, 1, 1,
-0.8590923, -1.108109, -2.723893, 0, 0, 0, 1, 1,
-0.8552039, -0.0508298, -0.8887222, 1, 1, 1, 1, 1,
-0.8542007, -0.3302649, -2.057031, 1, 1, 1, 1, 1,
-0.8514802, -1.045778, -4.116009, 1, 1, 1, 1, 1,
-0.850225, -0.7200956, -1.295934, 1, 1, 1, 1, 1,
-0.849297, -0.6557468, -3.729769, 1, 1, 1, 1, 1,
-0.846076, -0.4894271, -3.974413, 1, 1, 1, 1, 1,
-0.8452098, 1.078838, -0.9125341, 1, 1, 1, 1, 1,
-0.8391473, -0.5340335, -3.155869, 1, 1, 1, 1, 1,
-0.8370662, -0.6998879, -5.008066, 1, 1, 1, 1, 1,
-0.8353329, 0.2489596, -1.713938, 1, 1, 1, 1, 1,
-0.8278194, -1.516093, -2.099163, 1, 1, 1, 1, 1,
-0.8259757, -1.200746, -2.283283, 1, 1, 1, 1, 1,
-0.8224701, 0.2901468, 0.01922223, 1, 1, 1, 1, 1,
-0.818157, 1.888698, -1.128624, 1, 1, 1, 1, 1,
-0.8178373, -0.3009227, -3.180686, 1, 1, 1, 1, 1,
-0.8173507, -0.3793727, -0.8951547, 0, 0, 1, 1, 1,
-0.8123378, -0.5419092, -2.508244, 1, 0, 0, 1, 1,
-0.8067953, -0.7247807, -4.105968, 1, 0, 0, 1, 1,
-0.8041193, -0.9328603, -1.329168, 1, 0, 0, 1, 1,
-0.8033926, 1.161292, 0.1549294, 1, 0, 0, 1, 1,
-0.8032534, 0.2500623, -2.612868, 1, 0, 0, 1, 1,
-0.7997485, 0.6062474, 0.694112, 0, 0, 0, 1, 1,
-0.7986851, 0.2218667, -0.6184107, 0, 0, 0, 1, 1,
-0.7950714, -0.3527265, -2.1784, 0, 0, 0, 1, 1,
-0.79402, -0.6840822, -3.155553, 0, 0, 0, 1, 1,
-0.7903783, 0.1547991, -1.527707, 0, 0, 0, 1, 1,
-0.7887111, 1.371134, 1.533136, 0, 0, 0, 1, 1,
-0.7784574, -0.2885213, -3.844897, 0, 0, 0, 1, 1,
-0.7771217, -0.7957158, -2.706383, 1, 1, 1, 1, 1,
-0.7751671, 0.6658527, 0.007068273, 1, 1, 1, 1, 1,
-0.7693446, 1.028204, -0.7901636, 1, 1, 1, 1, 1,
-0.7655804, -0.3485478, -3.315701, 1, 1, 1, 1, 1,
-0.7650883, 0.845219, -1.165828, 1, 1, 1, 1, 1,
-0.7636456, 1.34583, -0.4158066, 1, 1, 1, 1, 1,
-0.7632145, -0.2412313, -2.405095, 1, 1, 1, 1, 1,
-0.7600068, 0.5590976, -0.6075783, 1, 1, 1, 1, 1,
-0.7596945, 0.2268297, -1.687802, 1, 1, 1, 1, 1,
-0.7596832, 0.3505592, 0.05008988, 1, 1, 1, 1, 1,
-0.759677, 1.406897, 0.2113179, 1, 1, 1, 1, 1,
-0.7554544, -1.527189, -3.077667, 1, 1, 1, 1, 1,
-0.7534996, -0.2209803, -2.449429, 1, 1, 1, 1, 1,
-0.7518871, 0.7603178, 0.5634977, 1, 1, 1, 1, 1,
-0.750423, -0.08607538, -1.307559, 1, 1, 1, 1, 1,
-0.7493581, 0.7887984, -2.420252, 0, 0, 1, 1, 1,
-0.7361016, -0.09734522, 0.8180329, 1, 0, 0, 1, 1,
-0.7317963, 0.9142178, -0.2321008, 1, 0, 0, 1, 1,
-0.7313101, -1.609298, -1.917055, 1, 0, 0, 1, 1,
-0.7255951, -1.340454, -1.627204, 1, 0, 0, 1, 1,
-0.7234773, 0.7735254, 0.5882264, 1, 0, 0, 1, 1,
-0.7233794, 2.805872, 0.437344, 0, 0, 0, 1, 1,
-0.7177165, -0.7455107, -1.573109, 0, 0, 0, 1, 1,
-0.7129325, -0.08950115, -2.225426, 0, 0, 0, 1, 1,
-0.7107787, 0.1069951, -2.193534, 0, 0, 0, 1, 1,
-0.7090577, -1.479771, -0.4374459, 0, 0, 0, 1, 1,
-0.7049168, 1.55456, -0.5271379, 0, 0, 0, 1, 1,
-0.7041598, 0.1124072, -0.07989945, 0, 0, 0, 1, 1,
-0.7030462, 1.20187, -1.296242, 1, 1, 1, 1, 1,
-0.6974645, -0.0301284, -2.361634, 1, 1, 1, 1, 1,
-0.6921781, 0.4036615, -1.75477, 1, 1, 1, 1, 1,
-0.6830519, 0.6214775, -1.520476, 1, 1, 1, 1, 1,
-0.6813973, -0.07920476, -0.7720119, 1, 1, 1, 1, 1,
-0.6810059, -0.72712, -2.639056, 1, 1, 1, 1, 1,
-0.6800255, 1.348896, -0.3957351, 1, 1, 1, 1, 1,
-0.6770374, -1.369946, -2.09776, 1, 1, 1, 1, 1,
-0.6593599, -0.06420321, -0.3670531, 1, 1, 1, 1, 1,
-0.6576843, 1.078702, -0.5427381, 1, 1, 1, 1, 1,
-0.6574203, 1.636537, 0.687986, 1, 1, 1, 1, 1,
-0.6561925, 0.7059193, -0.1584753, 1, 1, 1, 1, 1,
-0.6555843, -1.069304, -2.411888, 1, 1, 1, 1, 1,
-0.6546291, 0.1396679, 1.161271, 1, 1, 1, 1, 1,
-0.6522768, -0.7230154, -3.108504, 1, 1, 1, 1, 1,
-0.6501305, 0.1715246, -1.677723, 0, 0, 1, 1, 1,
-0.6484545, -1.864855, -4.50811, 1, 0, 0, 1, 1,
-0.6463103, 0.7789861, 0.4308876, 1, 0, 0, 1, 1,
-0.6396797, 0.7968073, 0.37814, 1, 0, 0, 1, 1,
-0.6344109, 0.8585237, -0.6992745, 1, 0, 0, 1, 1,
-0.632822, -1.292157, -4.917591, 1, 0, 0, 1, 1,
-0.6283219, 1.083735, -2.992632, 0, 0, 0, 1, 1,
-0.6276956, -1.340019, -5.458405, 0, 0, 0, 1, 1,
-0.6266114, 1.862562, -0.3536042, 0, 0, 0, 1, 1,
-0.6265681, -0.03231549, -1.139088, 0, 0, 0, 1, 1,
-0.6258706, 0.3717465, -0.8043602, 0, 0, 0, 1, 1,
-0.6256428, -0.2435091, 0.3593609, 0, 0, 0, 1, 1,
-0.6210334, 0.8757449, 0.3719672, 0, 0, 0, 1, 1,
-0.6179283, 2.075968, -1.591844, 1, 1, 1, 1, 1,
-0.6166533, 0.5852356, -1.386016, 1, 1, 1, 1, 1,
-0.6058507, -0.679926, -2.549677, 1, 1, 1, 1, 1,
-0.5988798, 0.09704254, -1.06223, 1, 1, 1, 1, 1,
-0.5967194, 0.1402222, 0.5819561, 1, 1, 1, 1, 1,
-0.5956056, -0.3466716, -1.408348, 1, 1, 1, 1, 1,
-0.5953639, -0.2899396, -2.807657, 1, 1, 1, 1, 1,
-0.5948897, -0.3915238, -3.075252, 1, 1, 1, 1, 1,
-0.5913364, -0.0439411, -2.809564, 1, 1, 1, 1, 1,
-0.5896021, 1.457215, 0.1174715, 1, 1, 1, 1, 1,
-0.5883106, -0.9625066, -2.894951, 1, 1, 1, 1, 1,
-0.5879311, 0.9759774, 0.6649269, 1, 1, 1, 1, 1,
-0.5845824, 1.178497, -0.1033764, 1, 1, 1, 1, 1,
-0.5809017, 1.422492, -0.9251212, 1, 1, 1, 1, 1,
-0.5768275, 1.212668, 0.2122791, 1, 1, 1, 1, 1,
-0.5715138, -0.6481212, -3.223689, 0, 0, 1, 1, 1,
-0.5702127, 0.7409387, -0.04411246, 1, 0, 0, 1, 1,
-0.5674791, 1.218667, -1.449117, 1, 0, 0, 1, 1,
-0.5674211, 1.222835, -0.2298877, 1, 0, 0, 1, 1,
-0.5655426, 1.652415, -0.3818857, 1, 0, 0, 1, 1,
-0.5638052, 0.0827259, -2.005897, 1, 0, 0, 1, 1,
-0.5602538, 0.6519285, 1.338269, 0, 0, 0, 1, 1,
-0.557778, 1.130194, -0.9094713, 0, 0, 0, 1, 1,
-0.557767, -1.614351, -3.560232, 0, 0, 0, 1, 1,
-0.5572154, -1.28099, -2.850421, 0, 0, 0, 1, 1,
-0.5479693, 0.231566, -0.88793, 0, 0, 0, 1, 1,
-0.5438415, 0.08302976, -0.1694078, 0, 0, 0, 1, 1,
-0.5436161, -1.139539, -1.848743, 0, 0, 0, 1, 1,
-0.543483, -0.786156, -2.432191, 1, 1, 1, 1, 1,
-0.5424837, 2.501271, 0.5040151, 1, 1, 1, 1, 1,
-0.5416848, 1.542855, -1.103693, 1, 1, 1, 1, 1,
-0.5413616, 1.283012, 0.3722287, 1, 1, 1, 1, 1,
-0.5382253, -0.9231958, -2.1285, 1, 1, 1, 1, 1,
-0.5376999, 0.7215902, -1.374367, 1, 1, 1, 1, 1,
-0.5360814, 1.855243, -0.4789851, 1, 1, 1, 1, 1,
-0.535863, -0.4708312, -3.968067, 1, 1, 1, 1, 1,
-0.5337214, -0.7326701, -3.133109, 1, 1, 1, 1, 1,
-0.5283363, 1.415973, 1.022868, 1, 1, 1, 1, 1,
-0.5259033, -0.3570172, -1.548245, 1, 1, 1, 1, 1,
-0.525503, -0.5718434, -3.061391, 1, 1, 1, 1, 1,
-0.5242105, 0.7391993, -0.7649572, 1, 1, 1, 1, 1,
-0.5234068, 1.01957, 1.417403, 1, 1, 1, 1, 1,
-0.5223576, -0.2546863, -1.064829, 1, 1, 1, 1, 1,
-0.5142788, 1.336445, -0.4258647, 0, 0, 1, 1, 1,
-0.5132954, 0.2094492, -2.987084, 1, 0, 0, 1, 1,
-0.5095919, 0.1246739, -1.239472, 1, 0, 0, 1, 1,
-0.5093743, 0.2261388, 0.3970224, 1, 0, 0, 1, 1,
-0.5089285, -0.2502138, -4.049275, 1, 0, 0, 1, 1,
-0.4966854, 0.4623418, -0.453139, 1, 0, 0, 1, 1,
-0.4904645, 0.2842413, -2.212463, 0, 0, 0, 1, 1,
-0.4888191, -2.686647, -2.33176, 0, 0, 0, 1, 1,
-0.4835455, 1.28753, -1.822967, 0, 0, 0, 1, 1,
-0.4689563, -1.241883, -1.928807, 0, 0, 0, 1, 1,
-0.4668964, -1.478582, -3.458683, 0, 0, 0, 1, 1,
-0.4658372, 0.104742, -0.1457378, 0, 0, 0, 1, 1,
-0.4626459, 1.36406, -1.207654, 0, 0, 0, 1, 1,
-0.4588421, 0.2908736, -1.566596, 1, 1, 1, 1, 1,
-0.4574975, 1.18456, 0.1279876, 1, 1, 1, 1, 1,
-0.4547755, -1.102883, -3.536358, 1, 1, 1, 1, 1,
-0.4535352, -0.2148927, -0.2294429, 1, 1, 1, 1, 1,
-0.4512435, -0.2964977, -0.2195111, 1, 1, 1, 1, 1,
-0.4506494, -0.7476992, -2.76108, 1, 1, 1, 1, 1,
-0.4423337, 0.7190349, 0.7491202, 1, 1, 1, 1, 1,
-0.4413725, -0.5232604, -3.825503, 1, 1, 1, 1, 1,
-0.4399299, 2.420948, 1.191296, 1, 1, 1, 1, 1,
-0.4394421, -3.642138, -2.780278, 1, 1, 1, 1, 1,
-0.4393609, 0.8676643, -0.2579211, 1, 1, 1, 1, 1,
-0.4344353, 0.08029873, -2.21292, 1, 1, 1, 1, 1,
-0.4317747, 1.770339, 0.2015131, 1, 1, 1, 1, 1,
-0.4289565, -0.9896289, -1.796701, 1, 1, 1, 1, 1,
-0.4279477, -2.086899, -1.388277, 1, 1, 1, 1, 1,
-0.4266255, -0.2964103, -2.274397, 0, 0, 1, 1, 1,
-0.4262944, -0.1549294, -2.469953, 1, 0, 0, 1, 1,
-0.4230077, 0.296412, -2.076537, 1, 0, 0, 1, 1,
-0.422965, 0.5065947, -2.238651, 1, 0, 0, 1, 1,
-0.4104538, -0.613089, -3.247226, 1, 0, 0, 1, 1,
-0.4060171, -0.2110262, -1.903077, 1, 0, 0, 1, 1,
-0.4035631, 0.7562246, -1.157738, 0, 0, 0, 1, 1,
-0.4033573, 1.612951, 0.3849259, 0, 0, 0, 1, 1,
-0.3981035, -0.005275501, -1.39341, 0, 0, 0, 1, 1,
-0.3947088, 0.8693568, -1.305097, 0, 0, 0, 1, 1,
-0.3933695, 0.470265, -0.2855359, 0, 0, 0, 1, 1,
-0.3918216, -0.5109022, -2.717884, 0, 0, 0, 1, 1,
-0.3870842, 1.387712, -0.591226, 0, 0, 0, 1, 1,
-0.3824682, -0.4458805, -0.4297223, 1, 1, 1, 1, 1,
-0.3784733, 0.1422167, -0.8271456, 1, 1, 1, 1, 1,
-0.3747878, -1.311433, -4.610322, 1, 1, 1, 1, 1,
-0.3651909, 0.9349365, -1.896406, 1, 1, 1, 1, 1,
-0.3608843, -0.1217815, -2.102956, 1, 1, 1, 1, 1,
-0.3593903, 0.9762859, 1.163262, 1, 1, 1, 1, 1,
-0.3575127, -0.2865894, -0.8119845, 1, 1, 1, 1, 1,
-0.3523441, -1.392986, -3.13597, 1, 1, 1, 1, 1,
-0.3506305, 0.05967946, -1.182683, 1, 1, 1, 1, 1,
-0.3430509, -0.5929264, -0.5810271, 1, 1, 1, 1, 1,
-0.3385533, 0.07479452, -0.9813468, 1, 1, 1, 1, 1,
-0.3384645, -2.357187, -2.00471, 1, 1, 1, 1, 1,
-0.3308605, 1.716341, 0.3720515, 1, 1, 1, 1, 1,
-0.3192439, -0.6416336, -0.2491072, 1, 1, 1, 1, 1,
-0.3140307, -0.6466966, -3.922041, 1, 1, 1, 1, 1,
-0.3124537, -1.736496, -3.223812, 0, 0, 1, 1, 1,
-0.3020098, -0.09012655, -1.274225, 1, 0, 0, 1, 1,
-0.2989688, 1.477428, 1.747439, 1, 0, 0, 1, 1,
-0.2982103, -0.01608431, -1.661174, 1, 0, 0, 1, 1,
-0.291182, -1.174311, -2.184371, 1, 0, 0, 1, 1,
-0.2886296, 0.2595, -1.58911, 1, 0, 0, 1, 1,
-0.2806787, 0.136508, 0.1749038, 0, 0, 0, 1, 1,
-0.2754756, 1.16715, -0.7157668, 0, 0, 0, 1, 1,
-0.2752684, 0.6298512, -1.949954, 0, 0, 0, 1, 1,
-0.2742409, -0.3784829, -3.892421, 0, 0, 0, 1, 1,
-0.2687169, 0.7922071, -2.044147, 0, 0, 0, 1, 1,
-0.267321, -2.18759, -4.091657, 0, 0, 0, 1, 1,
-0.2660966, 0.446654, -1.5706, 0, 0, 0, 1, 1,
-0.2631323, -0.1558574, -0.2762392, 1, 1, 1, 1, 1,
-0.2630273, 1.720638, 0.6698855, 1, 1, 1, 1, 1,
-0.2613348, -1.017396, -2.962055, 1, 1, 1, 1, 1,
-0.2575005, -1.251753, -1.793891, 1, 1, 1, 1, 1,
-0.2571704, 0.2566296, 0.0284918, 1, 1, 1, 1, 1,
-0.2569843, 0.546875, -1.302247, 1, 1, 1, 1, 1,
-0.2534612, 0.4893599, -2.815525, 1, 1, 1, 1, 1,
-0.2528065, -0.2078263, -0.9254172, 1, 1, 1, 1, 1,
-0.2524125, 0.1943872, -1.059725, 1, 1, 1, 1, 1,
-0.2504738, 1.197129, 0.9289658, 1, 1, 1, 1, 1,
-0.2432174, -0.7386048, -5.096555, 1, 1, 1, 1, 1,
-0.2407795, -0.2246923, -1.9438, 1, 1, 1, 1, 1,
-0.2371274, 1.582504, 0.1285813, 1, 1, 1, 1, 1,
-0.2340073, -1.828412, -2.236735, 1, 1, 1, 1, 1,
-0.2332971, 0.8596267, 0.838028, 1, 1, 1, 1, 1,
-0.2322256, -0.1503771, -2.36861, 0, 0, 1, 1, 1,
-0.2302508, 0.7862383, 0.2938229, 1, 0, 0, 1, 1,
-0.2232543, -0.6230195, -2.361199, 1, 0, 0, 1, 1,
-0.220664, 1.131908, -0.1367748, 1, 0, 0, 1, 1,
-0.2197532, -0.4249149, -2.079517, 1, 0, 0, 1, 1,
-0.2165098, -0.6746557, -3.95673, 1, 0, 0, 1, 1,
-0.2147853, -1.343341, -1.455578, 0, 0, 0, 1, 1,
-0.2100158, -1.026502, -2.585908, 0, 0, 0, 1, 1,
-0.2049172, 1.448591, 1.044615, 0, 0, 0, 1, 1,
-0.202567, 0.1300044, -0.9339482, 0, 0, 0, 1, 1,
-0.2018706, 0.2272043, -0.03855671, 0, 0, 0, 1, 1,
-0.2001054, -0.6979018, -3.78065, 0, 0, 0, 1, 1,
-0.1925072, 0.8881363, -0.02560287, 0, 0, 0, 1, 1,
-0.1923793, 0.03702684, 0.1239413, 1, 1, 1, 1, 1,
-0.1905029, 0.5211389, -1.402876, 1, 1, 1, 1, 1,
-0.188167, -0.5547177, -3.907914, 1, 1, 1, 1, 1,
-0.1870017, 0.7785424, 0.3702274, 1, 1, 1, 1, 1,
-0.1853015, -0.9558659, -2.543688, 1, 1, 1, 1, 1,
-0.183524, -1.029615, -2.023626, 1, 1, 1, 1, 1,
-0.1798348, 0.1603911, -1.229965, 1, 1, 1, 1, 1,
-0.1794886, -1.624108, -2.358955, 1, 1, 1, 1, 1,
-0.169659, 0.7547358, -0.3520808, 1, 1, 1, 1, 1,
-0.1686637, 0.404661, 0.2901232, 1, 1, 1, 1, 1,
-0.1676375, -2.264815, -2.60324, 1, 1, 1, 1, 1,
-0.1653709, -1.192254, -3.827471, 1, 1, 1, 1, 1,
-0.1619219, -0.6753947, -1.408422, 1, 1, 1, 1, 1,
-0.1605786, -1.473976, -2.750894, 1, 1, 1, 1, 1,
-0.160569, 0.614206, -1.275514, 1, 1, 1, 1, 1,
-0.1596391, -0.6476357, -3.865121, 0, 0, 1, 1, 1,
-0.1506143, -1.105224, -0.5969945, 1, 0, 0, 1, 1,
-0.1437768, 0.508615, 0.4362108, 1, 0, 0, 1, 1,
-0.1436933, -0.5557296, -2.364358, 1, 0, 0, 1, 1,
-0.1436309, 0.5300997, 0.7536691, 1, 0, 0, 1, 1,
-0.1414598, 0.5906946, -0.9108922, 1, 0, 0, 1, 1,
-0.1372592, 1.387089, -0.6763695, 0, 0, 0, 1, 1,
-0.1363546, -0.4553945, -2.88377, 0, 0, 0, 1, 1,
-0.134621, 2.066054, -0.5200393, 0, 0, 0, 1, 1,
-0.1327699, -1.026937, -1.227689, 0, 0, 0, 1, 1,
-0.1322622, -1.509073, -4.366249, 0, 0, 0, 1, 1,
-0.1301286, -0.03860016, -1.425412, 0, 0, 0, 1, 1,
-0.1299514, -2.082205, -2.455669, 0, 0, 0, 1, 1,
-0.1293716, -1.603557, -3.625266, 1, 1, 1, 1, 1,
-0.1292203, -0.2369613, -3.610531, 1, 1, 1, 1, 1,
-0.1241753, 1.077069, -0.4569685, 1, 1, 1, 1, 1,
-0.1213189, 0.7999223, -0.7997301, 1, 1, 1, 1, 1,
-0.1200422, 1.132967, 0.5967048, 1, 1, 1, 1, 1,
-0.1182863, -1.116663, -3.781535, 1, 1, 1, 1, 1,
-0.1161964, 1.877841, -1.099986, 1, 1, 1, 1, 1,
-0.1154455, -1.437413, -3.818908, 1, 1, 1, 1, 1,
-0.1034919, 0.2572574, -0.8829681, 1, 1, 1, 1, 1,
-0.101936, -0.4950507, -3.881581, 1, 1, 1, 1, 1,
-0.1017249, -1.018741, -2.990724, 1, 1, 1, 1, 1,
-0.09535169, 0.3825804, 0.4692101, 1, 1, 1, 1, 1,
-0.08979069, -1.232816, -2.438881, 1, 1, 1, 1, 1,
-0.08581711, 1.224911, 0.7520707, 1, 1, 1, 1, 1,
-0.08524978, -1.006054, -2.997472, 1, 1, 1, 1, 1,
-0.07602223, -0.1125335, -2.125187, 0, 0, 1, 1, 1,
-0.07555956, 0.8733088, 0.273366, 1, 0, 0, 1, 1,
-0.07287616, 0.4025978, -2.252509, 1, 0, 0, 1, 1,
-0.07039835, -1.040686, -4.754488, 1, 0, 0, 1, 1,
-0.06909814, 0.455096, 1.089122, 1, 0, 0, 1, 1,
-0.06713288, 0.5889208, 0.06072109, 1, 0, 0, 1, 1,
-0.06499433, 0.5396644, 0.009071198, 0, 0, 0, 1, 1,
-0.06443919, -0.4745406, -3.397644, 0, 0, 0, 1, 1,
-0.06134554, -1.703435, -4.575935, 0, 0, 0, 1, 1,
-0.05699069, -1.195259, -4.163687, 0, 0, 0, 1, 1,
-0.05474666, 1.100603, -0.3569289, 0, 0, 0, 1, 1,
-0.05357877, 0.299366, -0.3444355, 0, 0, 0, 1, 1,
-0.04907566, -0.8365069, -4.090284, 0, 0, 0, 1, 1,
-0.04815793, 0.2504658, -1.350487, 1, 1, 1, 1, 1,
-0.04597533, -0.1882428, -3.972358, 1, 1, 1, 1, 1,
-0.04406572, 1.060228, 0.7962736, 1, 1, 1, 1, 1,
-0.04361793, 2.653347, -0.0487449, 1, 1, 1, 1, 1,
-0.04249324, 0.1258805, -0.1213124, 1, 1, 1, 1, 1,
-0.03552646, -0.2086989, -0.9036281, 1, 1, 1, 1, 1,
-0.03471556, -0.223989, -3.432433, 1, 1, 1, 1, 1,
-0.02842223, 0.9402168, 0.4178029, 1, 1, 1, 1, 1,
-0.0278877, -0.458851, -3.833869, 1, 1, 1, 1, 1,
-0.02773642, 1.513449, 0.269857, 1, 1, 1, 1, 1,
-0.02714362, 0.703862, 0.9092098, 1, 1, 1, 1, 1,
-0.02360878, 0.1010577, -0.56665, 1, 1, 1, 1, 1,
-0.0212421, -1.27918, -5.672571, 1, 1, 1, 1, 1,
-0.01491002, -0.5743849, -3.463135, 1, 1, 1, 1, 1,
-0.01303344, 0.8517665, -0.7690803, 1, 1, 1, 1, 1,
-0.01144782, 0.04246661, -0.07951068, 0, 0, 1, 1, 1,
-0.01015372, 0.6263485, -1.50537, 1, 0, 0, 1, 1,
-0.008236133, 0.6352993, -0.8618044, 1, 0, 0, 1, 1,
-0.006251953, -0.4886607, -3.168884, 1, 0, 0, 1, 1,
0.00195189, 0.4083396, 0.3957028, 1, 0, 0, 1, 1,
0.004554883, 0.03625975, 0.2563502, 1, 0, 0, 1, 1,
0.007321891, -1.251259, 2.731352, 0, 0, 0, 1, 1,
0.00819556, 0.6418338, -0.2091436, 0, 0, 0, 1, 1,
0.008303657, 0.9570276, -0.250392, 0, 0, 0, 1, 1,
0.009649967, -1.074207, 1.851397, 0, 0, 0, 1, 1,
0.01532255, -0.8044599, 2.111176, 0, 0, 0, 1, 1,
0.022797, 1.350116, 2.014339, 0, 0, 0, 1, 1,
0.02413036, 0.4044159, 1.635402, 0, 0, 0, 1, 1,
0.02471209, 1.570165, 1.170216, 1, 1, 1, 1, 1,
0.02560843, 1.75381, -1.545049, 1, 1, 1, 1, 1,
0.03086367, -0.2632897, 3.701219, 1, 1, 1, 1, 1,
0.03388223, 0.2806866, -3.5628, 1, 1, 1, 1, 1,
0.03579811, -2.24483, 3.27783, 1, 1, 1, 1, 1,
0.03649204, 0.7248523, 1.034834, 1, 1, 1, 1, 1,
0.04192105, 0.4073994, -0.4446587, 1, 1, 1, 1, 1,
0.04431461, -2.49447, 5.029113, 1, 1, 1, 1, 1,
0.04663001, 1.41176, -0.1867341, 1, 1, 1, 1, 1,
0.04785934, -0.3210148, 4.205976, 1, 1, 1, 1, 1,
0.04942397, -1.089386, 5.868875, 1, 1, 1, 1, 1,
0.0508844, -0.1340031, 1.42708, 1, 1, 1, 1, 1,
0.05179923, 0.1341909, 0.988703, 1, 1, 1, 1, 1,
0.05330199, 0.3175592, 0.4076055, 1, 1, 1, 1, 1,
0.05514302, 0.9672757, -0.3693494, 1, 1, 1, 1, 1,
0.05840081, 0.3849925, -0.9214425, 0, 0, 1, 1, 1,
0.05914668, -0.6234531, 2.204362, 1, 0, 0, 1, 1,
0.06433615, -2.421058, 3.288947, 1, 0, 0, 1, 1,
0.06491678, -1.03315, 1.801672, 1, 0, 0, 1, 1,
0.06513338, -0.7140796, 1.316269, 1, 0, 0, 1, 1,
0.06515647, 0.5446424, -0.4521304, 1, 0, 0, 1, 1,
0.07300237, -0.9742861, 2.518918, 0, 0, 0, 1, 1,
0.07302696, 0.4479594, 2.054766, 0, 0, 0, 1, 1,
0.07364731, 0.3288019, -0.6741984, 0, 0, 0, 1, 1,
0.07388546, 0.8009907, -0.8026352, 0, 0, 0, 1, 1,
0.07412491, 1.703372, -1.073127, 0, 0, 0, 1, 1,
0.07487968, 1.092131, -1.578653, 0, 0, 0, 1, 1,
0.08197857, 1.457417, 1.52424, 0, 0, 0, 1, 1,
0.08403568, -0.8243405, 5.235953, 1, 1, 1, 1, 1,
0.08588891, 0.13817, 0.9439394, 1, 1, 1, 1, 1,
0.08715765, 0.06046562, -0.3469836, 1, 1, 1, 1, 1,
0.08750484, -0.2766063, 2.883559, 1, 1, 1, 1, 1,
0.08956118, 1.198731, 0.1095774, 1, 1, 1, 1, 1,
0.09568712, -0.9931087, 3.50698, 1, 1, 1, 1, 1,
0.0961642, 1.179505, 1.433868, 1, 1, 1, 1, 1,
0.09741332, 1.150199, -0.8335092, 1, 1, 1, 1, 1,
0.09852459, -0.7749522, 3.214453, 1, 1, 1, 1, 1,
0.1002624, 0.9190066, -0.0181911, 1, 1, 1, 1, 1,
0.1012905, -1.035829, 4.442744, 1, 1, 1, 1, 1,
0.1023396, -1.13835, 5.309165, 1, 1, 1, 1, 1,
0.1023772, 0.007850693, 1.720667, 1, 1, 1, 1, 1,
0.1067312, 1.694015, 0.2624705, 1, 1, 1, 1, 1,
0.1154889, 1.025385, -0.02092371, 1, 1, 1, 1, 1,
0.1174613, 0.09746514, 2.115373, 0, 0, 1, 1, 1,
0.1191734, -1.567153, 2.812457, 1, 0, 0, 1, 1,
0.1245175, 0.7704877, -0.2660752, 1, 0, 0, 1, 1,
0.1255575, 0.3382638, 2.092086, 1, 0, 0, 1, 1,
0.1257204, -0.4032578, 2.122185, 1, 0, 0, 1, 1,
0.127264, -0.06824565, 2.414844, 1, 0, 0, 1, 1,
0.1309073, 0.3818335, -1.130188, 0, 0, 0, 1, 1,
0.1327804, -0.812205, 2.544901, 0, 0, 0, 1, 1,
0.1344403, -0.2296043, 1.949561, 0, 0, 0, 1, 1,
0.1353474, -1.226307, 4.400747, 0, 0, 0, 1, 1,
0.1357233, -0.3376365, 2.46833, 0, 0, 0, 1, 1,
0.145927, -1.130612, 2.27823, 0, 0, 0, 1, 1,
0.1474632, 0.3462162, 0.131573, 0, 0, 0, 1, 1,
0.1500725, -0.524507, 3.944792, 1, 1, 1, 1, 1,
0.1521869, -1.368364, 3.947379, 1, 1, 1, 1, 1,
0.152253, -0.7733632, 1.603641, 1, 1, 1, 1, 1,
0.1590156, -0.1777401, 2.237784, 1, 1, 1, 1, 1,
0.1634069, -0.1630082, 2.775951, 1, 1, 1, 1, 1,
0.1641117, 0.06350192, 0.8500312, 1, 1, 1, 1, 1,
0.1641374, 0.4779263, -0.7602815, 1, 1, 1, 1, 1,
0.1658333, 0.1698818, 2.923246, 1, 1, 1, 1, 1,
0.1662495, -1.314162, 3.719254, 1, 1, 1, 1, 1,
0.1669556, -1.069337, 4.63163, 1, 1, 1, 1, 1,
0.1735774, -1.700815, 5.282181, 1, 1, 1, 1, 1,
0.1761312, -1.639446, 2.977877, 1, 1, 1, 1, 1,
0.180882, 0.2316438, -0.1945078, 1, 1, 1, 1, 1,
0.181354, -0.9845788, 4.001582, 1, 1, 1, 1, 1,
0.184947, -0.7242033, 4.079119, 1, 1, 1, 1, 1,
0.1887918, 0.381359, -0.09570293, 0, 0, 1, 1, 1,
0.1899659, -0.0514478, 3.300562, 1, 0, 0, 1, 1,
0.1918473, -0.05762968, 2.567274, 1, 0, 0, 1, 1,
0.1936263, -0.4079509, 2.760291, 1, 0, 0, 1, 1,
0.1988269, -0.1831193, 1.91134, 1, 0, 0, 1, 1,
0.2031356, 0.04728459, 2.58592, 1, 0, 0, 1, 1,
0.2101011, -1.382489, 4.612285, 0, 0, 0, 1, 1,
0.2123019, -0.2358759, 2.427443, 0, 0, 0, 1, 1,
0.214643, -0.8502497, 3.117406, 0, 0, 0, 1, 1,
0.2170732, -0.1166584, 1.722255, 0, 0, 0, 1, 1,
0.2213187, -0.113039, 0.1267153, 0, 0, 0, 1, 1,
0.2214407, 1.95817, 1.323646, 0, 0, 0, 1, 1,
0.2273965, -0.1157647, 0.3519019, 0, 0, 0, 1, 1,
0.2274112, -0.6136512, 3.225587, 1, 1, 1, 1, 1,
0.2291944, -0.2685381, 2.400403, 1, 1, 1, 1, 1,
0.2292884, -0.09863985, 2.607526, 1, 1, 1, 1, 1,
0.2305715, 0.03413868, 1.220988, 1, 1, 1, 1, 1,
0.2354899, -0.5094149, 2.427429, 1, 1, 1, 1, 1,
0.2429764, 0.4453643, -0.3058953, 1, 1, 1, 1, 1,
0.2483188, 0.3305216, -0.7151253, 1, 1, 1, 1, 1,
0.2510086, -0.2499659, 3.431694, 1, 1, 1, 1, 1,
0.253303, -0.2899853, 4.593517, 1, 1, 1, 1, 1,
0.2537239, 0.3245848, -0.2887277, 1, 1, 1, 1, 1,
0.2562375, -0.02136226, 0.2127443, 1, 1, 1, 1, 1,
0.2563183, 0.5866071, -0.0306117, 1, 1, 1, 1, 1,
0.2580791, -0.03679611, 1.027836, 1, 1, 1, 1, 1,
0.2612749, -0.4568296, 2.332142, 1, 1, 1, 1, 1,
0.262948, 2.226704, 0.3953219, 1, 1, 1, 1, 1,
0.2696787, 0.07947037, 0.9482727, 0, 0, 1, 1, 1,
0.2726019, -0.9644628, 2.249413, 1, 0, 0, 1, 1,
0.272817, -0.7298483, 4.11459, 1, 0, 0, 1, 1,
0.278676, -0.387173, 1.54025, 1, 0, 0, 1, 1,
0.2795242, 0.0296904, -0.05517363, 1, 0, 0, 1, 1,
0.2820417, -1.39604, 2.061335, 1, 0, 0, 1, 1,
0.282443, -0.1745123, 2.73897, 0, 0, 0, 1, 1,
0.2837027, 1.55332, -1.042903, 0, 0, 0, 1, 1,
0.2872643, 0.8506206, 2.267054, 0, 0, 0, 1, 1,
0.2874543, 2.222743, 0.6916465, 0, 0, 0, 1, 1,
0.2890224, 0.3250544, 1.20225, 0, 0, 0, 1, 1,
0.289434, 0.9043397, -1.38019, 0, 0, 0, 1, 1,
0.2898338, 0.3402041, 0.3716284, 0, 0, 0, 1, 1,
0.2904624, 0.765887, 0.6946383, 1, 1, 1, 1, 1,
0.2999704, -0.7032876, 2.007591, 1, 1, 1, 1, 1,
0.3029737, -1.389454, 4.598497, 1, 1, 1, 1, 1,
0.3037711, -0.8609487, 4.497085, 1, 1, 1, 1, 1,
0.3067401, -0.3469129, 3.233387, 1, 1, 1, 1, 1,
0.3070822, -0.3765493, 2.026842, 1, 1, 1, 1, 1,
0.3087105, 1.232638, 0.3492473, 1, 1, 1, 1, 1,
0.3163897, 2.185265, 1.071055, 1, 1, 1, 1, 1,
0.3194647, -0.04330777, 1.558755, 1, 1, 1, 1, 1,
0.3206186, -0.2528149, 2.982173, 1, 1, 1, 1, 1,
0.326482, 0.9734274, 0.254631, 1, 1, 1, 1, 1,
0.3276941, 0.8763779, 0.7457454, 1, 1, 1, 1, 1,
0.3299963, 0.5701574, -0.7737414, 1, 1, 1, 1, 1,
0.3302879, -0.2102819, 2.837076, 1, 1, 1, 1, 1,
0.3316599, -0.827502, 4.547782, 1, 1, 1, 1, 1,
0.3323703, -1.005852, 3.449618, 0, 0, 1, 1, 1,
0.3367845, -0.05088442, 3.205247, 1, 0, 0, 1, 1,
0.3420058, 0.9068666, -0.1634214, 1, 0, 0, 1, 1,
0.3442413, 0.7541494, 1.898393, 1, 0, 0, 1, 1,
0.3467295, -0.8249665, 4.526284, 1, 0, 0, 1, 1,
0.3469412, 0.3653439, -0.1064689, 1, 0, 0, 1, 1,
0.3471817, -0.8871186, 4.553643, 0, 0, 0, 1, 1,
0.3501089, 0.518306, -0.2562592, 0, 0, 0, 1, 1,
0.3557042, -0.006654226, 1.245898, 0, 0, 0, 1, 1,
0.3559116, 1.294848, 0.644084, 0, 0, 0, 1, 1,
0.3562683, -0.3997653, 0.7778072, 0, 0, 0, 1, 1,
0.359452, 0.6241155, -0.06363985, 0, 0, 0, 1, 1,
0.3607464, 0.8965124, -0.3444759, 0, 0, 0, 1, 1,
0.3648535, -0.07874847, 2.910704, 1, 1, 1, 1, 1,
0.3668255, -0.4985394, 2.497443, 1, 1, 1, 1, 1,
0.3679618, -0.3158769, 2.296147, 1, 1, 1, 1, 1,
0.3680833, -0.1605465, 2.253309, 1, 1, 1, 1, 1,
0.3707762, 1.682221, 0.3120359, 1, 1, 1, 1, 1,
0.3726437, 1.103927, 1.252597, 1, 1, 1, 1, 1,
0.3771674, -0.9116793, 3.033499, 1, 1, 1, 1, 1,
0.3828601, 0.04596819, 1.061662, 1, 1, 1, 1, 1,
0.3892851, -0.2256343, 4.369226, 1, 1, 1, 1, 1,
0.396164, -1.742299, 2.773269, 1, 1, 1, 1, 1,
0.4012558, -0.9141895, 1.42551, 1, 1, 1, 1, 1,
0.4045103, 0.7549468, 0.6740491, 1, 1, 1, 1, 1,
0.4058715, 0.4248106, 1.499053, 1, 1, 1, 1, 1,
0.4088458, -0.6038765, 2.963398, 1, 1, 1, 1, 1,
0.4094678, 0.8128664, 1.678317, 1, 1, 1, 1, 1,
0.4124086, 1.877765, 0.224583, 0, 0, 1, 1, 1,
0.4131846, -0.6275799, 1.989619, 1, 0, 0, 1, 1,
0.4135301, -1.194503, 2.837652, 1, 0, 0, 1, 1,
0.4157423, 0.4958568, 0.6540512, 1, 0, 0, 1, 1,
0.4174352, -0.9210925, 4.381503, 1, 0, 0, 1, 1,
0.4193386, 0.4306416, 0.2604433, 1, 0, 0, 1, 1,
0.4238099, 1.191609, -2.862063, 0, 0, 0, 1, 1,
0.4240751, 0.3677323, -1.830503, 0, 0, 0, 1, 1,
0.4290471, -1.222409, 2.142601, 0, 0, 0, 1, 1,
0.4302243, -0.817646, 3.095251, 0, 0, 0, 1, 1,
0.4312486, -1.54782, 3.837242, 0, 0, 0, 1, 1,
0.4408468, 0.6419724, 0.6209044, 0, 0, 0, 1, 1,
0.4481046, 0.9144958, 0.6747038, 0, 0, 0, 1, 1,
0.4495955, 0.0582833, 1.313621, 1, 1, 1, 1, 1,
0.4502092, -0.219413, 1.820275, 1, 1, 1, 1, 1,
0.4614675, 0.747565, 0.8605749, 1, 1, 1, 1, 1,
0.4618124, -1.625355, 4.888245, 1, 1, 1, 1, 1,
0.4680455, -1.39367, 3.808418, 1, 1, 1, 1, 1,
0.4685843, 1.91238, -1.108195, 1, 1, 1, 1, 1,
0.4686423, 0.4012207, 1.248928, 1, 1, 1, 1, 1,
0.4695481, -0.1680394, 0.7815903, 1, 1, 1, 1, 1,
0.4785244, 0.8017847, 0.02806314, 1, 1, 1, 1, 1,
0.4830683, 1.358364, 0.1150235, 1, 1, 1, 1, 1,
0.4890448, -0.2782374, 2.243025, 1, 1, 1, 1, 1,
0.492746, -0.1464141, 1.151537, 1, 1, 1, 1, 1,
0.4954754, -0.517036, 2.196338, 1, 1, 1, 1, 1,
0.5027103, -0.6726708, 3.017477, 1, 1, 1, 1, 1,
0.5036094, -0.8322799, 2.808667, 1, 1, 1, 1, 1,
0.5049594, -0.1548821, -0.3533101, 0, 0, 1, 1, 1,
0.5111405, -0.903071, 0.2886608, 1, 0, 0, 1, 1,
0.5117686, -0.06936659, 0.92805, 1, 0, 0, 1, 1,
0.512894, 0.2397731, 1.603441, 1, 0, 0, 1, 1,
0.5133284, -0.06658956, 1.094333, 1, 0, 0, 1, 1,
0.5139212, 0.2445356, -0.3473749, 1, 0, 0, 1, 1,
0.5169447, 0.4166187, 1.521385, 0, 0, 0, 1, 1,
0.5243756, 0.8760664, 1.166432, 0, 0, 0, 1, 1,
0.5252493, -0.5868635, 2.517944, 0, 0, 0, 1, 1,
0.526054, 1.109434, -0.7083423, 0, 0, 0, 1, 1,
0.5296943, -1.364913, 4.543723, 0, 0, 0, 1, 1,
0.5327315, -2.175073, 2.221664, 0, 0, 0, 1, 1,
0.5360022, -1.621467, 2.094714, 0, 0, 0, 1, 1,
0.5380964, -1.596932, 5.00694, 1, 1, 1, 1, 1,
0.5392681, 0.3690986, 0.1129985, 1, 1, 1, 1, 1,
0.5461274, 1.058626, -0.4434007, 1, 1, 1, 1, 1,
0.5464342, 2.601886, -0.1975359, 1, 1, 1, 1, 1,
0.5481129, 0.1493776, 2.275961, 1, 1, 1, 1, 1,
0.5487642, -0.2926411, 1.95539, 1, 1, 1, 1, 1,
0.549779, -0.145025, 1.691133, 1, 1, 1, 1, 1,
0.5513934, 1.899408, -0.1314536, 1, 1, 1, 1, 1,
0.5529026, 1.795225, 1.733473, 1, 1, 1, 1, 1,
0.5585601, 0.8015385, 0.7516409, 1, 1, 1, 1, 1,
0.5586796, -0.3784637, 1.973766, 1, 1, 1, 1, 1,
0.5648598, 1.419725, 1.267471, 1, 1, 1, 1, 1,
0.5686592, 0.3157903, -0.2718021, 1, 1, 1, 1, 1,
0.5754454, 1.441202, -0.1320981, 1, 1, 1, 1, 1,
0.575685, -0.5078615, 1.93808, 1, 1, 1, 1, 1,
0.5828827, -1.295092, 1.943973, 0, 0, 1, 1, 1,
0.5903299, 0.842471, -0.2070275, 1, 0, 0, 1, 1,
0.5918224, 0.1757347, 1.755943, 1, 0, 0, 1, 1,
0.594243, -0.3223173, 0.08323167, 1, 0, 0, 1, 1,
0.5993792, -0.3308182, 1.3234, 1, 0, 0, 1, 1,
0.6027481, 0.7847886, -0.1843039, 1, 0, 0, 1, 1,
0.6030365, -0.4083738, 2.389628, 0, 0, 0, 1, 1,
0.6068779, 0.4401373, -0.1541864, 0, 0, 0, 1, 1,
0.6079426, -0.6214617, 4.345044, 0, 0, 0, 1, 1,
0.6125808, -0.7251648, 3.934945, 0, 0, 0, 1, 1,
0.6166499, -0.1348986, 1.887105, 0, 0, 0, 1, 1,
0.6210148, -0.3491742, -0.1747568, 0, 0, 0, 1, 1,
0.6300528, 0.522873, -0.2539662, 0, 0, 0, 1, 1,
0.6326624, 0.3530774, 2.189613, 1, 1, 1, 1, 1,
0.6333341, -0.2761484, 1.33347, 1, 1, 1, 1, 1,
0.6337072, -0.8750291, 1.661538, 1, 1, 1, 1, 1,
0.6355404, -0.2243911, 1.728317, 1, 1, 1, 1, 1,
0.6457379, 1.370557, 1.10111, 1, 1, 1, 1, 1,
0.6492016, -1.130966, 3.617928, 1, 1, 1, 1, 1,
0.6524032, -1.229776, 2.460757, 1, 1, 1, 1, 1,
0.65596, -0.9229605, 2.457778, 1, 1, 1, 1, 1,
0.6595401, -1.461776, 3.587232, 1, 1, 1, 1, 1,
0.6634166, 0.3625434, 0.4062161, 1, 1, 1, 1, 1,
0.6754156, -1.077396, 1.462675, 1, 1, 1, 1, 1,
0.6766872, 0.4518578, -1.265061, 1, 1, 1, 1, 1,
0.6789792, 0.07771134, 2.164008, 1, 1, 1, 1, 1,
0.6802871, -1.508954, 3.45802, 1, 1, 1, 1, 1,
0.6877941, 0.31858, 0.5117185, 1, 1, 1, 1, 1,
0.6896787, -0.1401112, 1.944477, 0, 0, 1, 1, 1,
0.693123, -0.09907117, 1.168081, 1, 0, 0, 1, 1,
0.6934797, 0.1166601, 0.9516652, 1, 0, 0, 1, 1,
0.6948026, -0.5603669, 3.905205, 1, 0, 0, 1, 1,
0.6990587, 0.1639589, 1.270713, 1, 0, 0, 1, 1,
0.6992527, 1.124102, 2.024525, 1, 0, 0, 1, 1,
0.7003285, 0.008118094, 1.042208, 0, 0, 0, 1, 1,
0.7058287, 0.1721926, 2.577328, 0, 0, 0, 1, 1,
0.7083488, -3.008562, 3.978572, 0, 0, 0, 1, 1,
0.7097059, -1.339462, 1.607174, 0, 0, 0, 1, 1,
0.7155659, 1.608744, 3.889886, 0, 0, 0, 1, 1,
0.721298, 1.141409, 1.71905, 0, 0, 0, 1, 1,
0.7229121, -0.1542788, 1.137751, 0, 0, 0, 1, 1,
0.7276245, -0.598098, 0.5130461, 1, 1, 1, 1, 1,
0.7310073, 0.2561808, 1.319479, 1, 1, 1, 1, 1,
0.7374914, 0.7912111, 2.388351, 1, 1, 1, 1, 1,
0.7401009, 1.991305, 0.1781214, 1, 1, 1, 1, 1,
0.7409849, -0.01624647, 1.354993, 1, 1, 1, 1, 1,
0.7424724, -0.974379, 2.25265, 1, 1, 1, 1, 1,
0.7554476, -1.364574, 2.958511, 1, 1, 1, 1, 1,
0.7565016, 0.08500445, 2.050974, 1, 1, 1, 1, 1,
0.7636012, 0.6831964, 1.086053, 1, 1, 1, 1, 1,
0.7646458, -0.2399674, 1.612462, 1, 1, 1, 1, 1,
0.7681541, -0.9917583, 0.9326959, 1, 1, 1, 1, 1,
0.7699075, -0.9147846, 1.373545, 1, 1, 1, 1, 1,
0.7699625, -0.06269241, 1.695563, 1, 1, 1, 1, 1,
0.7703184, 0.4797312, 1.546201, 1, 1, 1, 1, 1,
0.7703501, 0.903852, -0.11479, 1, 1, 1, 1, 1,
0.7705052, 0.9586374, 0.5623209, 0, 0, 1, 1, 1,
0.7751116, 0.2360772, 2.197975, 1, 0, 0, 1, 1,
0.7804135, 0.002897182, 1.760455, 1, 0, 0, 1, 1,
0.7830594, 0.8434635, 1.290064, 1, 0, 0, 1, 1,
0.7838765, -0.6228563, 2.266036, 1, 0, 0, 1, 1,
0.7878357, -0.7222724, 2.413047, 1, 0, 0, 1, 1,
0.797595, 0.4565296, -1.080618, 0, 0, 0, 1, 1,
0.7980716, -0.1735194, 1.693916, 0, 0, 0, 1, 1,
0.8001286, 0.1336463, 0.4079644, 0, 0, 0, 1, 1,
0.8008204, 1.80686, -0.1497502, 0, 0, 0, 1, 1,
0.8023917, 0.7344531, 0.6622077, 0, 0, 0, 1, 1,
0.8032597, 1.143242, -0.01412714, 0, 0, 0, 1, 1,
0.8048788, 0.7148066, 1.489814, 0, 0, 0, 1, 1,
0.8091644, 0.04478142, 0.8995932, 1, 1, 1, 1, 1,
0.8133152, 0.06719713, 1.8573, 1, 1, 1, 1, 1,
0.8297983, -0.812252, 2.060493, 1, 1, 1, 1, 1,
0.8316798, -0.09051253, 1.917574, 1, 1, 1, 1, 1,
0.83619, -0.09415533, 4.104495, 1, 1, 1, 1, 1,
0.8454267, 0.2096624, 1.514177, 1, 1, 1, 1, 1,
0.8464636, 0.3319312, 1.960973, 1, 1, 1, 1, 1,
0.8506923, 0.7519874, 1.268224, 1, 1, 1, 1, 1,
0.8555562, -0.4463174, 2.597399, 1, 1, 1, 1, 1,
0.860761, -0.663645, 0.5603037, 1, 1, 1, 1, 1,
0.8617459, -1.386861, 1.959566, 1, 1, 1, 1, 1,
0.8645541, 1.390822, 1.17952, 1, 1, 1, 1, 1,
0.8671939, -0.378664, 2.127449, 1, 1, 1, 1, 1,
0.8692917, -0.9098184, 2.810577, 1, 1, 1, 1, 1,
0.8731346, 0.1569115, 0.9887279, 1, 1, 1, 1, 1,
0.8741058, -0.2212225, 3.873082, 0, 0, 1, 1, 1,
0.8770899, -1.238312, 2.960814, 1, 0, 0, 1, 1,
0.8776417, 0.4692604, 1.106455, 1, 0, 0, 1, 1,
0.8777611, -1.21604, 3.838533, 1, 0, 0, 1, 1,
0.8824541, -0.3205215, 0.6206555, 1, 0, 0, 1, 1,
0.8870258, 0.9737971, 0.04024799, 1, 0, 0, 1, 1,
0.8936666, -0.2931134, 1.207772, 0, 0, 0, 1, 1,
0.9004777, -0.2513611, 2.571555, 0, 0, 0, 1, 1,
0.9068437, 0.7731864, 0.9492061, 0, 0, 0, 1, 1,
0.9136748, 1.857515, 1.22165, 0, 0, 0, 1, 1,
0.914058, -0.3792648, 3.551551, 0, 0, 0, 1, 1,
0.9142983, 0.6412065, 1.373239, 0, 0, 0, 1, 1,
0.9162105, -0.3361387, 1.760907, 0, 0, 0, 1, 1,
0.9199265, -1.559663, 2.829302, 1, 1, 1, 1, 1,
0.9210246, 1.05371, 0.9665444, 1, 1, 1, 1, 1,
0.9290091, 1.874982, 0.6289474, 1, 1, 1, 1, 1,
0.9323687, -2.409693, 1.415927, 1, 1, 1, 1, 1,
0.9373489, -0.3407447, 0.4864745, 1, 1, 1, 1, 1,
0.9408596, 0.9513735, 0.5214893, 1, 1, 1, 1, 1,
0.9435517, 0.2404231, 1.432653, 1, 1, 1, 1, 1,
0.9526176, -0.3641969, 2.654793, 1, 1, 1, 1, 1,
0.9530777, 1.271639, 0.3276074, 1, 1, 1, 1, 1,
0.9548302, -0.5713893, 1.724367, 1, 1, 1, 1, 1,
0.9564179, 1.06436, 1.38409, 1, 1, 1, 1, 1,
0.9578651, -1.224672, 1.253648, 1, 1, 1, 1, 1,
0.9688378, 0.7527345, 2.229292, 1, 1, 1, 1, 1,
0.9734408, 0.9245009, -0.2135495, 1, 1, 1, 1, 1,
0.9766268, 0.3993846, -0.2790498, 1, 1, 1, 1, 1,
0.9811907, -1.22094, 3.950682, 0, 0, 1, 1, 1,
0.9865329, -0.7346386, 2.534755, 1, 0, 0, 1, 1,
1.00862, -1.1598, 2.329313, 1, 0, 0, 1, 1,
1.008947, -0.01493634, 2.299235, 1, 0, 0, 1, 1,
1.010289, 0.4721189, 0.6116301, 1, 0, 0, 1, 1,
1.014157, 0.3153396, 3.126931, 1, 0, 0, 1, 1,
1.026972, 0.1724844, 1.774743, 0, 0, 0, 1, 1,
1.027046, -1.384143, 3.451542, 0, 0, 0, 1, 1,
1.030443, 0.6084564, 1.667607, 0, 0, 0, 1, 1,
1.033669, -0.4570445, 3.256776, 0, 0, 0, 1, 1,
1.034315, 2.079589, 1.801025, 0, 0, 0, 1, 1,
1.034986, -2.534648, 2.631238, 0, 0, 0, 1, 1,
1.046237, -1.203985, 4.512743, 0, 0, 0, 1, 1,
1.050111, -0.8144662, 0.7785774, 1, 1, 1, 1, 1,
1.051841, 1.668073, 0.3173212, 1, 1, 1, 1, 1,
1.052285, 1.086926, -0.29512, 1, 1, 1, 1, 1,
1.054208, 0.9023862, 0.5505738, 1, 1, 1, 1, 1,
1.056895, 1.179242, 3.808213, 1, 1, 1, 1, 1,
1.056987, -0.4165004, 0.226052, 1, 1, 1, 1, 1,
1.075679, 0.4757435, 2.204052, 1, 1, 1, 1, 1,
1.080355, -0.3997868, 2.331948, 1, 1, 1, 1, 1,
1.084608, -1.225481, 3.408455, 1, 1, 1, 1, 1,
1.090523, -0.4096557, 4.423591, 1, 1, 1, 1, 1,
1.091128, -0.5760613, 1.896809, 1, 1, 1, 1, 1,
1.091379, -1.535905, 2.962562, 1, 1, 1, 1, 1,
1.091696, -0.9726718, 1.902254, 1, 1, 1, 1, 1,
1.093823, 1.168139, 1.765734, 1, 1, 1, 1, 1,
1.094087, 0.7491274, 2.569259, 1, 1, 1, 1, 1,
1.095675, 0.4672762, 0.5151744, 0, 0, 1, 1, 1,
1.097034, -2.173059, 1.516605, 1, 0, 0, 1, 1,
1.107453, 1.577028, -0.4216336, 1, 0, 0, 1, 1,
1.112754, -2.01488, 2.808316, 1, 0, 0, 1, 1,
1.115306, 0.5379616, 3.112228, 1, 0, 0, 1, 1,
1.118419, 0.1387776, 1.742155, 1, 0, 0, 1, 1,
1.135672, 0.05943762, 2.207645, 0, 0, 0, 1, 1,
1.140859, 3.092725, 0.7680163, 0, 0, 0, 1, 1,
1.148885, -0.1951926, 0.8999696, 0, 0, 0, 1, 1,
1.154201, 0.8559826, 2.009928, 0, 0, 0, 1, 1,
1.155556, -0.1533077, 1.83557, 0, 0, 0, 1, 1,
1.168585, -1.691563, 0.7316415, 0, 0, 0, 1, 1,
1.179149, 0.1515431, 1.828181, 0, 0, 0, 1, 1,
1.179905, -1.716962, 2.3376, 1, 1, 1, 1, 1,
1.180454, -1.632324, 1.793483, 1, 1, 1, 1, 1,
1.183363, 0.2591272, 1.533166, 1, 1, 1, 1, 1,
1.188795, -1.496079, 2.17139, 1, 1, 1, 1, 1,
1.189821, -0.9740959, 1.372821, 1, 1, 1, 1, 1,
1.190369, 0.2994125, 0.9279396, 1, 1, 1, 1, 1,
1.196704, -1.042005, 3.396976, 1, 1, 1, 1, 1,
1.204902, -0.08012835, 0.4508459, 1, 1, 1, 1, 1,
1.207668, -1.041901, 1.090318, 1, 1, 1, 1, 1,
1.230256, -1.050339, 1.32868, 1, 1, 1, 1, 1,
1.232738, -1.150671, 3.19995, 1, 1, 1, 1, 1,
1.233534, 0.00372342, -0.296772, 1, 1, 1, 1, 1,
1.23973, 0.9356706, 0.8496276, 1, 1, 1, 1, 1,
1.240937, 1.059875, 0.2181948, 1, 1, 1, 1, 1,
1.24551, -0.698844, 1.739272, 1, 1, 1, 1, 1,
1.247843, 0.1882076, 2.07579, 0, 0, 1, 1, 1,
1.253361, 1.256767, -0.3277423, 1, 0, 0, 1, 1,
1.26748, -0.1946034, 2.222934, 1, 0, 0, 1, 1,
1.271239, 0.1915601, 2.18971, 1, 0, 0, 1, 1,
1.275147, -2.221764, 2.360799, 1, 0, 0, 1, 1,
1.277398, -0.107412, 0.7668194, 1, 0, 0, 1, 1,
1.280782, -0.06106773, 0.7127131, 0, 0, 0, 1, 1,
1.282961, -0.306637, 1.914776, 0, 0, 0, 1, 1,
1.285068, -0.9696726, 2.444479, 0, 0, 0, 1, 1,
1.289044, -0.3427296, 2.821334, 0, 0, 0, 1, 1,
1.290197, -1.623362, 2.676399, 0, 0, 0, 1, 1,
1.2942, 1.057336, 0.2763374, 0, 0, 0, 1, 1,
1.295925, -0.006498888, 2.336337, 0, 0, 0, 1, 1,
1.30367, -1.319644, 2.041158, 1, 1, 1, 1, 1,
1.305595, 0.6376516, 1.401915, 1, 1, 1, 1, 1,
1.310137, 1.842625, 1.266201, 1, 1, 1, 1, 1,
1.324024, 0.3319045, 0.3656172, 1, 1, 1, 1, 1,
1.328252, 0.4097596, 2.095215, 1, 1, 1, 1, 1,
1.339312, 1.653919, -0.4383203, 1, 1, 1, 1, 1,
1.339716, 0.3446031, 0.6757049, 1, 1, 1, 1, 1,
1.33972, 0.2740203, 1.052559, 1, 1, 1, 1, 1,
1.345375, -1.067406, 2.572606, 1, 1, 1, 1, 1,
1.345714, -0.1581062, 2.204949, 1, 1, 1, 1, 1,
1.345761, 1.242177, -0.1994899, 1, 1, 1, 1, 1,
1.35179, -0.3149275, 2.691814, 1, 1, 1, 1, 1,
1.352993, -2.146168, 3.225209, 1, 1, 1, 1, 1,
1.3571, 0.09774742, 3.627633, 1, 1, 1, 1, 1,
1.369539, 0.3964348, 1.680807, 1, 1, 1, 1, 1,
1.385733, 1.466445, 1.698157, 0, 0, 1, 1, 1,
1.389068, -0.8310046, 2.997261, 1, 0, 0, 1, 1,
1.390914, 0.1013959, 3.61625, 1, 0, 0, 1, 1,
1.400584, -0.45206, -0.1004643, 1, 0, 0, 1, 1,
1.406859, 0.1827103, 1.804959, 1, 0, 0, 1, 1,
1.416362, 0.7856513, 0.6183124, 1, 0, 0, 1, 1,
1.417049, 0.9324314, 2.53573, 0, 0, 0, 1, 1,
1.429149, -0.2938578, 1.67116, 0, 0, 0, 1, 1,
1.433296, -0.2573366, 1.921135, 0, 0, 0, 1, 1,
1.433831, 0.4186236, -1.485688, 0, 0, 0, 1, 1,
1.435558, -0.9070959, 3.244232, 0, 0, 0, 1, 1,
1.435752, -0.4553822, 2.567157, 0, 0, 0, 1, 1,
1.44155, -1.156334, 3.219384, 0, 0, 0, 1, 1,
1.444402, -0.72754, 3.402315, 1, 1, 1, 1, 1,
1.449365, -0.06002595, 1.721117, 1, 1, 1, 1, 1,
1.451732, -0.3283962, 2.630454, 1, 1, 1, 1, 1,
1.45735, -0.4949743, 0.4691943, 1, 1, 1, 1, 1,
1.472211, 0.1940708, 1.615376, 1, 1, 1, 1, 1,
1.473562, -0.9441719, 1.739419, 1, 1, 1, 1, 1,
1.479166, 1.041452, -0.06821039, 1, 1, 1, 1, 1,
1.48063, -0.7414434, 2.775076, 1, 1, 1, 1, 1,
1.485076, -0.2528284, 1.236618, 1, 1, 1, 1, 1,
1.493518, -0.1122362, 1.071799, 1, 1, 1, 1, 1,
1.526893, 2.003171, -0.3667731, 1, 1, 1, 1, 1,
1.528855, -0.4943603, 2.416799, 1, 1, 1, 1, 1,
1.535292, 0.4779651, 2.47691, 1, 1, 1, 1, 1,
1.537879, 0.8760842, 1.23127, 1, 1, 1, 1, 1,
1.540764, -0.5421934, -0.4545005, 1, 1, 1, 1, 1,
1.541243, 1.459501, 2.007104, 0, 0, 1, 1, 1,
1.545151, 0.1904206, 4.099966, 1, 0, 0, 1, 1,
1.546073, 0.09453344, 2.207752, 1, 0, 0, 1, 1,
1.548423, 0.7585918, 1.361672, 1, 0, 0, 1, 1,
1.551451, 0.6844556, 0.5464104, 1, 0, 0, 1, 1,
1.56037, 1.267017, 1.180451, 1, 0, 0, 1, 1,
1.568579, -1.22828, 3.082232, 0, 0, 0, 1, 1,
1.570727, 0.987068, 2.285707, 0, 0, 0, 1, 1,
1.57729, 0.3208238, 2.819715, 0, 0, 0, 1, 1,
1.581628, -0.6493906, 0.94055, 0, 0, 0, 1, 1,
1.582359, 0.2666535, 0.2635306, 0, 0, 0, 1, 1,
1.595128, 2.034531, 1.151934, 0, 0, 0, 1, 1,
1.624758, -1.20567, 1.467434, 0, 0, 0, 1, 1,
1.628095, 0.2222775, 0.8441618, 1, 1, 1, 1, 1,
1.630499, 0.8260404, 1.98924, 1, 1, 1, 1, 1,
1.632529, 0.710847, 1.911591, 1, 1, 1, 1, 1,
1.644791, -0.3558016, 2.044014, 1, 1, 1, 1, 1,
1.665889, -0.134934, 1.093546, 1, 1, 1, 1, 1,
1.668686, -0.3209861, 1.863753, 1, 1, 1, 1, 1,
1.693194, -1.09882, 2.526336, 1, 1, 1, 1, 1,
1.693643, 0.5119645, 0.4769531, 1, 1, 1, 1, 1,
1.703778, 1.428223, -0.07406013, 1, 1, 1, 1, 1,
1.705695, 0.2874453, 0.4902336, 1, 1, 1, 1, 1,
1.721566, -1.141725, 1.680332, 1, 1, 1, 1, 1,
1.729439, -0.6015961, 3.264845, 1, 1, 1, 1, 1,
1.739074, 0.8637758, 1.710682, 1, 1, 1, 1, 1,
1.740467, 0.556485, 1.328216, 1, 1, 1, 1, 1,
1.741454, 1.829161, 0.9919987, 1, 1, 1, 1, 1,
1.759816, 0.008558257, -0.2560202, 0, 0, 1, 1, 1,
1.763188, 1.160866, -0.2516327, 1, 0, 0, 1, 1,
1.764844, 0.3134573, 1.612762, 1, 0, 0, 1, 1,
1.764967, 0.5331281, -0.3080055, 1, 0, 0, 1, 1,
1.768862, 0.5986845, 3.197404, 1, 0, 0, 1, 1,
1.775287, 0.1714842, 1.479317, 1, 0, 0, 1, 1,
1.779832, 0.7132964, 1.105496, 0, 0, 0, 1, 1,
1.780384, 0.3756838, 1.007685, 0, 0, 0, 1, 1,
1.819768, -1.947599, 2.896294, 0, 0, 0, 1, 1,
1.841786, -1.389511, 2.67357, 0, 0, 0, 1, 1,
1.844276, -1.371518, 1.198507, 0, 0, 0, 1, 1,
1.88071, 1.034942, 1.406808, 0, 0, 0, 1, 1,
1.883868, -0.9584429, 1.57619, 0, 0, 0, 1, 1,
1.912812, -1.223675, 1.993396, 1, 1, 1, 1, 1,
1.924896, 0.1834727, 2.502862, 1, 1, 1, 1, 1,
1.925291, 1.205804, 1.747816, 1, 1, 1, 1, 1,
1.928955, 0.1870672, 1.822031, 1, 1, 1, 1, 1,
1.931079, 0.9565246, 2.424573, 1, 1, 1, 1, 1,
1.937282, -0.9247773, 2.756502, 1, 1, 1, 1, 1,
1.961849, -1.610364, 2.445555, 1, 1, 1, 1, 1,
2.011675, -0.2235712, 3.069355, 1, 1, 1, 1, 1,
2.033759, -0.3357979, 2.468948, 1, 1, 1, 1, 1,
2.042824, 0.3286841, 0.6084613, 1, 1, 1, 1, 1,
2.051816, 0.5216661, 1.285835, 1, 1, 1, 1, 1,
2.0559, 0.9022084, 0.2363322, 1, 1, 1, 1, 1,
2.087817, 0.6059813, 0.7355127, 1, 1, 1, 1, 1,
2.088892, -0.03189135, 2.356435, 1, 1, 1, 1, 1,
2.095183, -0.4300906, -0.7584624, 1, 1, 1, 1, 1,
2.112845, -0.7088782, 1.658583, 0, 0, 1, 1, 1,
2.132737, -0.1032888, 1.316831, 1, 0, 0, 1, 1,
2.165489, 0.4829484, 2.898388, 1, 0, 0, 1, 1,
2.170818, -0.4676323, 0.2077709, 1, 0, 0, 1, 1,
2.204693, 0.8186367, -0.01686969, 1, 0, 0, 1, 1,
2.213045, -0.2309265, 0.9724599, 1, 0, 0, 1, 1,
2.248818, -0.1194979, 0.6924989, 0, 0, 0, 1, 1,
2.279701, -0.6360343, 0.8832561, 0, 0, 0, 1, 1,
2.336665, 1.66625, 2.740311, 0, 0, 0, 1, 1,
2.404932, -0.8649853, 2.426201, 0, 0, 0, 1, 1,
2.448405, -0.5908556, 2.987725, 0, 0, 0, 1, 1,
2.495711, -0.157537, -0.7076609, 0, 0, 0, 1, 1,
2.512731, 0.5956346, 3.16281, 0, 0, 0, 1, 1,
2.674373, -1.397586, 3.582887, 1, 1, 1, 1, 1,
2.741593, 1.245506, 1.618705, 1, 1, 1, 1, 1,
2.743057, -0.3243252, 2.603447, 1, 1, 1, 1, 1,
2.783067, -0.5033149, 1.967767, 1, 1, 1, 1, 1,
2.811575, -1.156359, 0.7844113, 1, 1, 1, 1, 1,
2.996347, 0.6851909, 0.6217866, 1, 1, 1, 1, 1,
3.112125, -0.6073427, 2.62607, 1, 1, 1, 1, 1
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
var radius = 10.01625;
var distance = 35.18166;
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
mvMatrix.translate( 0.1300826, 0.2747066, -0.09815168 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.18166);
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