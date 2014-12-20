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
-3.47801, 0.6048367, -1.34809, 1, 0, 0, 1,
-3.155244, -1.12322, -2.594721, 1, 0.007843138, 0, 1,
-3.017022, -1.73988, -0.9187139, 1, 0.01176471, 0, 1,
-2.82754, -0.9835266, -3.046128, 1, 0.01960784, 0, 1,
-2.792836, -0.4006844, -1.678126, 1, 0.02352941, 0, 1,
-2.723432, -1.851008, -1.912308, 1, 0.03137255, 0, 1,
-2.654912, 0.2948171, -0.8882294, 1, 0.03529412, 0, 1,
-2.638798, 0.4538739, -1.70778, 1, 0.04313726, 0, 1,
-2.509973, 0.09519122, -2.249598, 1, 0.04705882, 0, 1,
-2.478458, -0.3932776, -1.469756, 1, 0.05490196, 0, 1,
-2.397726, 1.169068, -0.3490358, 1, 0.05882353, 0, 1,
-2.379851, 0.3350669, 0.2395782, 1, 0.06666667, 0, 1,
-2.321778, 0.8880717, -0.6934507, 1, 0.07058824, 0, 1,
-2.303447, -1.230823, -2.244465, 1, 0.07843138, 0, 1,
-2.296933, -0.7341085, -2.143121, 1, 0.08235294, 0, 1,
-2.287525, -0.4923393, 1.330973, 1, 0.09019608, 0, 1,
-2.269085, 2.7513, -1.655636, 1, 0.09411765, 0, 1,
-2.225608, 1.03818, -1.623214, 1, 0.1019608, 0, 1,
-2.216979, 0.359513, -2.712027, 1, 0.1098039, 0, 1,
-2.171782, 0.2183515, -1.841162, 1, 0.1137255, 0, 1,
-2.155819, 1.600166, -0.4781475, 1, 0.1215686, 0, 1,
-2.153086, 0.9310629, -1.81062, 1, 0.1254902, 0, 1,
-2.117926, 0.2576059, -2.329226, 1, 0.1333333, 0, 1,
-2.093534, 1.069274, -1.223278, 1, 0.1372549, 0, 1,
-2.086531, 0.1710861, -1.027789, 1, 0.145098, 0, 1,
-2.068585, 1.452914, -2.144114, 1, 0.1490196, 0, 1,
-2.027727, -2.638754, -1.21681, 1, 0.1568628, 0, 1,
-2.011633, -0.1290812, -0.4694745, 1, 0.1607843, 0, 1,
-2.006017, 0.1604729, -2.770912, 1, 0.1686275, 0, 1,
-1.998634, 1.24017, -1.538564, 1, 0.172549, 0, 1,
-1.961178, 1.133246, -0.3570513, 1, 0.1803922, 0, 1,
-1.929467, 1.696941, -0.2178498, 1, 0.1843137, 0, 1,
-1.924771, 0.07341139, -2.285333, 1, 0.1921569, 0, 1,
-1.919673, 0.2513801, -2.049513, 1, 0.1960784, 0, 1,
-1.872176, -0.932561, -2.582383, 1, 0.2039216, 0, 1,
-1.841573, -0.6073771, -2.685727, 1, 0.2117647, 0, 1,
-1.840048, -1.276133, -4.13947, 1, 0.2156863, 0, 1,
-1.83111, 0.01624361, -1.872921, 1, 0.2235294, 0, 1,
-1.81789, 0.7492949, -0.5020199, 1, 0.227451, 0, 1,
-1.75896, -0.7320343, -1.901126, 1, 0.2352941, 0, 1,
-1.751113, -1.124485, -2.257378, 1, 0.2392157, 0, 1,
-1.748113, -0.1834717, -0.1890986, 1, 0.2470588, 0, 1,
-1.738621, -0.4350267, -3.241709, 1, 0.2509804, 0, 1,
-1.724406, 1.42801, -1.286373, 1, 0.2588235, 0, 1,
-1.717839, -1.504557, -1.317415, 1, 0.2627451, 0, 1,
-1.710384, 0.1921526, -3.480279, 1, 0.2705882, 0, 1,
-1.705507, -0.5277987, -1.26625, 1, 0.2745098, 0, 1,
-1.704676, 0.6755065, -1.534789, 1, 0.282353, 0, 1,
-1.690904, 1.105888, 1.854239, 1, 0.2862745, 0, 1,
-1.688085, 0.4726087, -0.6195431, 1, 0.2941177, 0, 1,
-1.671359, -1.199609, -1.882752, 1, 0.3019608, 0, 1,
-1.662347, 0.1228908, -1.949488, 1, 0.3058824, 0, 1,
-1.646354, 1.969995, -0.4539052, 1, 0.3137255, 0, 1,
-1.645284, -1.498244, -3.018149, 1, 0.3176471, 0, 1,
-1.643236, -0.5700769, -3.167063, 1, 0.3254902, 0, 1,
-1.63823, -0.6630321, -2.550652, 1, 0.3294118, 0, 1,
-1.628517, -0.1275229, -0.9111174, 1, 0.3372549, 0, 1,
-1.627813, 0.01424206, -0.9996266, 1, 0.3411765, 0, 1,
-1.599363, -1.351642, -3.562539, 1, 0.3490196, 0, 1,
-1.595338, -0.5565491, -0.09337061, 1, 0.3529412, 0, 1,
-1.580421, -0.1511674, -0.4567896, 1, 0.3607843, 0, 1,
-1.571934, -1.079355, -2.398089, 1, 0.3647059, 0, 1,
-1.567927, 1.550218, -0.5347402, 1, 0.372549, 0, 1,
-1.560592, -0.8410609, -1.829459, 1, 0.3764706, 0, 1,
-1.55305, -0.864024, -1.468179, 1, 0.3843137, 0, 1,
-1.546198, 0.5977009, -1.15276, 1, 0.3882353, 0, 1,
-1.544451, -0.9893391, -2.774559, 1, 0.3960784, 0, 1,
-1.542119, 0.3620728, -2.075091, 1, 0.4039216, 0, 1,
-1.540556, -0.1085359, -1.585993, 1, 0.4078431, 0, 1,
-1.540363, -1.429013, -0.2480162, 1, 0.4156863, 0, 1,
-1.539597, 1.001959, 1.009313, 1, 0.4196078, 0, 1,
-1.536266, -0.4159454, -2.435118, 1, 0.427451, 0, 1,
-1.535326, -0.909002, -1.290107, 1, 0.4313726, 0, 1,
-1.530126, -1.632128, -3.127444, 1, 0.4392157, 0, 1,
-1.529968, -0.1285771, -2.324483, 1, 0.4431373, 0, 1,
-1.517565, -1.563805, -1.150506, 1, 0.4509804, 0, 1,
-1.514814, 0.9671844, -2.703403, 1, 0.454902, 0, 1,
-1.505113, 1.071336, -1.073525, 1, 0.4627451, 0, 1,
-1.500249, 0.7268173, -0.06687967, 1, 0.4666667, 0, 1,
-1.49343, -1.363958, -1.742763, 1, 0.4745098, 0, 1,
-1.484896, 1.017151, -1.424688, 1, 0.4784314, 0, 1,
-1.481441, -0.01554728, -0.1236502, 1, 0.4862745, 0, 1,
-1.47385, 1.153904, 0.145387, 1, 0.4901961, 0, 1,
-1.467252, -0.3023247, -0.8384233, 1, 0.4980392, 0, 1,
-1.459054, -0.8466926, -1.676534, 1, 0.5058824, 0, 1,
-1.429203, 0.02414351, -1.604544, 1, 0.509804, 0, 1,
-1.427429, 1.580076, -2.990148, 1, 0.5176471, 0, 1,
-1.419994, 0.7610561, -1.541816, 1, 0.5215687, 0, 1,
-1.402228, 1.274447, -0.5629937, 1, 0.5294118, 0, 1,
-1.400763, 1.915165, 0.1364961, 1, 0.5333334, 0, 1,
-1.40039, 0.3494232, -1.034714, 1, 0.5411765, 0, 1,
-1.398679, -0.3520184, -1.518264, 1, 0.5450981, 0, 1,
-1.383892, 0.7229545, -1.218562, 1, 0.5529412, 0, 1,
-1.378011, -0.3940533, -3.577582, 1, 0.5568628, 0, 1,
-1.366102, -0.6632305, -2.49563, 1, 0.5647059, 0, 1,
-1.358716, -0.1742297, -1.742736, 1, 0.5686275, 0, 1,
-1.358297, -0.2217731, -0.08559835, 1, 0.5764706, 0, 1,
-1.357264, -1.415862, -3.679087, 1, 0.5803922, 0, 1,
-1.355145, -1.633569, -2.406993, 1, 0.5882353, 0, 1,
-1.348903, 0.2450077, -0.8994693, 1, 0.5921569, 0, 1,
-1.334301, -1.358858, -3.390371, 1, 0.6, 0, 1,
-1.32842, 0.2643015, -0.2393785, 1, 0.6078432, 0, 1,
-1.327865, -0.460489, -1.973341, 1, 0.6117647, 0, 1,
-1.327278, -0.3689909, -3.222904, 1, 0.6196079, 0, 1,
-1.311555, -1.402516, -1.506968, 1, 0.6235294, 0, 1,
-1.308735, 0.5215846, -1.538719, 1, 0.6313726, 0, 1,
-1.308524, -0.1900381, -1.26942, 1, 0.6352941, 0, 1,
-1.307305, -0.6119359, -1.988435, 1, 0.6431373, 0, 1,
-1.306804, 1.25775, -1.737603, 1, 0.6470588, 0, 1,
-1.30373, -0.6504935, -1.849745, 1, 0.654902, 0, 1,
-1.291644, -0.3348354, -1.073812, 1, 0.6588235, 0, 1,
-1.282399, 0.9447129, -1.535237, 1, 0.6666667, 0, 1,
-1.280009, -0.5845714, -1.307848, 1, 0.6705883, 0, 1,
-1.278402, 1.159047, -1.786924, 1, 0.6784314, 0, 1,
-1.272177, 0.8861846, 0.5662761, 1, 0.682353, 0, 1,
-1.269608, 0.4267917, -0.06369295, 1, 0.6901961, 0, 1,
-1.267062, 1.412269, 1.441738, 1, 0.6941177, 0, 1,
-1.266105, 1.259877, 1.323641, 1, 0.7019608, 0, 1,
-1.263486, 0.00324949, -1.841443, 1, 0.7098039, 0, 1,
-1.257087, 0.6421139, -3.590238, 1, 0.7137255, 0, 1,
-1.254765, -0.6789765, -2.700641, 1, 0.7215686, 0, 1,
-1.253226, -0.6294682, 0.2086287, 1, 0.7254902, 0, 1,
-1.252394, -1.016311, -3.648142, 1, 0.7333333, 0, 1,
-1.25232, 0.7862219, -2.454149, 1, 0.7372549, 0, 1,
-1.245875, 0.6205952, -1.91555, 1, 0.7450981, 0, 1,
-1.241726, 1.194557, -0.1441602, 1, 0.7490196, 0, 1,
-1.233587, 0.1805242, 0.05497986, 1, 0.7568628, 0, 1,
-1.228205, -0.6657379, -0.1570641, 1, 0.7607843, 0, 1,
-1.225869, 0.1403078, -0.9425947, 1, 0.7686275, 0, 1,
-1.222197, 0.9356209, -1.136375, 1, 0.772549, 0, 1,
-1.213481, -0.5172598, -1.617345, 1, 0.7803922, 0, 1,
-1.20888, -0.3884408, -2.505645, 1, 0.7843137, 0, 1,
-1.208853, -1.508112, -3.283491, 1, 0.7921569, 0, 1,
-1.207558, 0.142175, -0.9081703, 1, 0.7960784, 0, 1,
-1.205879, 0.2265369, -1.345982, 1, 0.8039216, 0, 1,
-1.204911, 2.929585, -1.384579, 1, 0.8117647, 0, 1,
-1.197471, -0.4292271, -3.128295, 1, 0.8156863, 0, 1,
-1.197349, -0.1321256, -1.495193, 1, 0.8235294, 0, 1,
-1.195372, 1.377388, -0.08536097, 1, 0.827451, 0, 1,
-1.180229, 1.122807, -0.3758684, 1, 0.8352941, 0, 1,
-1.17829, 2.290048, 0.1404284, 1, 0.8392157, 0, 1,
-1.1775, -0.8369722, -1.847519, 1, 0.8470588, 0, 1,
-1.162245, 0.5654709, -0.9379377, 1, 0.8509804, 0, 1,
-1.151145, 1.755632, -0.05026556, 1, 0.8588235, 0, 1,
-1.148904, -0.6769541, -1.777556, 1, 0.8627451, 0, 1,
-1.148328, -0.4941566, -1.898566, 1, 0.8705882, 0, 1,
-1.146587, -0.05756346, -2.415214, 1, 0.8745098, 0, 1,
-1.139948, -0.9004148, -2.280577, 1, 0.8823529, 0, 1,
-1.135693, 0.7503695, -0.9312817, 1, 0.8862745, 0, 1,
-1.12809, 0.3413746, -0.5510243, 1, 0.8941177, 0, 1,
-1.127037, -0.3112158, -2.041288, 1, 0.8980392, 0, 1,
-1.126933, -0.1531214, -0.9558446, 1, 0.9058824, 0, 1,
-1.126742, -0.5824535, -2.751339, 1, 0.9137255, 0, 1,
-1.121812, -0.1897951, -3.256302, 1, 0.9176471, 0, 1,
-1.121767, -0.2814197, -0.8786895, 1, 0.9254902, 0, 1,
-1.120648, -0.3495805, -2.196165, 1, 0.9294118, 0, 1,
-1.117393, -0.7304, -2.835198, 1, 0.9372549, 0, 1,
-1.112385, -0.5155101, -2.992819, 1, 0.9411765, 0, 1,
-1.110165, -1.6764, -1.084173, 1, 0.9490196, 0, 1,
-1.103367, -1.834589, -1.239004, 1, 0.9529412, 0, 1,
-1.100696, -1.065579, -1.520418, 1, 0.9607843, 0, 1,
-1.09933, 0.2937583, -0.5371822, 1, 0.9647059, 0, 1,
-1.087504, -0.3103324, -2.414259, 1, 0.972549, 0, 1,
-1.076267, 0.1546075, -2.315189, 1, 0.9764706, 0, 1,
-1.057303, 0.6357691, -0.1906981, 1, 0.9843137, 0, 1,
-1.0572, 1.302603, -1.270238, 1, 0.9882353, 0, 1,
-1.055757, -0.3054019, -2.691511, 1, 0.9960784, 0, 1,
-1.055247, -0.9555395, -0.7313991, 0.9960784, 1, 0, 1,
-1.053183, -0.2081826, -2.724477, 0.9921569, 1, 0, 1,
-1.051606, 1.419624, -1.280565, 0.9843137, 1, 0, 1,
-1.035132, 0.5501148, -0.288805, 0.9803922, 1, 0, 1,
-1.027336, -1.402955, -2.337144, 0.972549, 1, 0, 1,
-1.023681, -0.7545531, -2.563987, 0.9686275, 1, 0, 1,
-1.017347, -0.5900735, -3.073303, 0.9607843, 1, 0, 1,
-1.01496, -1.728895, -1.765309, 0.9568627, 1, 0, 1,
-1.003615, 2.12113, -1.510452, 0.9490196, 1, 0, 1,
-1.001009, -0.1103088, -1.013838, 0.945098, 1, 0, 1,
-0.9963443, -1.165089, -1.602254, 0.9372549, 1, 0, 1,
-0.9961933, -0.1538244, -0.9191577, 0.9333333, 1, 0, 1,
-0.9926905, -0.6920201, -0.08162483, 0.9254902, 1, 0, 1,
-0.9873314, 0.001870548, -1.306692, 0.9215686, 1, 0, 1,
-0.9868672, 0.6201128, -3.368511, 0.9137255, 1, 0, 1,
-0.978659, -0.5851741, -0.5214584, 0.9098039, 1, 0, 1,
-0.9742538, -0.5002312, -1.528924, 0.9019608, 1, 0, 1,
-0.9709243, 0.5527452, -0.556793, 0.8941177, 1, 0, 1,
-0.9705073, 2.502958, 1.992109, 0.8901961, 1, 0, 1,
-0.9657636, -1.189327, -3.058166, 0.8823529, 1, 0, 1,
-0.9654075, 0.5151758, -1.598904, 0.8784314, 1, 0, 1,
-0.9639456, -0.1039623, -2.403539, 0.8705882, 1, 0, 1,
-0.9624138, 1.068667, 0.2612157, 0.8666667, 1, 0, 1,
-0.9620013, -0.6712137, -2.591402, 0.8588235, 1, 0, 1,
-0.9609604, 0.3566549, -1.027583, 0.854902, 1, 0, 1,
-0.9589054, 0.9200466, -0.8001431, 0.8470588, 1, 0, 1,
-0.9528447, -1.030332, -1.463884, 0.8431373, 1, 0, 1,
-0.952444, -0.03430264, -0.1033594, 0.8352941, 1, 0, 1,
-0.952043, -1.858181, -1.53383, 0.8313726, 1, 0, 1,
-0.9456534, 0.1616294, -1.220243, 0.8235294, 1, 0, 1,
-0.9385134, 0.09399203, -0.5019746, 0.8196079, 1, 0, 1,
-0.9382971, -0.9752152, -0.5066441, 0.8117647, 1, 0, 1,
-0.9362265, -1.85104, -1.434914, 0.8078431, 1, 0, 1,
-0.932276, 0.8316758, -0.5516394, 0.8, 1, 0, 1,
-0.9130316, 1.782901, -0.8820069, 0.7921569, 1, 0, 1,
-0.9006361, 2.391238, -1.26897, 0.7882353, 1, 0, 1,
-0.9000866, 0.4205151, -2.523422, 0.7803922, 1, 0, 1,
-0.8990277, 0.4625147, 0.7378638, 0.7764706, 1, 0, 1,
-0.8648369, -1.261512, -0.7421087, 0.7686275, 1, 0, 1,
-0.8615369, 0.6241704, -1.524842, 0.7647059, 1, 0, 1,
-0.861385, -0.07374971, -1.159866, 0.7568628, 1, 0, 1,
-0.8607253, -0.2871769, -3.675963, 0.7529412, 1, 0, 1,
-0.8594946, -0.8172423, -3.337339, 0.7450981, 1, 0, 1,
-0.8577809, 0.3515091, -2.883718, 0.7411765, 1, 0, 1,
-0.8551898, 0.09276398, -1.484233, 0.7333333, 1, 0, 1,
-0.8506936, 0.3057151, -1.388085, 0.7294118, 1, 0, 1,
-0.8506389, -0.8692023, -3.261027, 0.7215686, 1, 0, 1,
-0.8500428, 0.9809609, -1.682217, 0.7176471, 1, 0, 1,
-0.8441197, 1.401065, -1.427437, 0.7098039, 1, 0, 1,
-0.8424105, 0.7505077, 0.272531, 0.7058824, 1, 0, 1,
-0.8387238, -1.177759, -2.639377, 0.6980392, 1, 0, 1,
-0.8288584, -0.1612416, -2.0925, 0.6901961, 1, 0, 1,
-0.8239868, 0.3749494, -0.464644, 0.6862745, 1, 0, 1,
-0.8216522, 0.412554, -1.266795, 0.6784314, 1, 0, 1,
-0.8215696, 0.6670788, -1.975725, 0.6745098, 1, 0, 1,
-0.8164411, -0.9522102, -1.589849, 0.6666667, 1, 0, 1,
-0.8143361, -0.1322128, -1.467779, 0.6627451, 1, 0, 1,
-0.8137941, -1.060261, -1.724549, 0.654902, 1, 0, 1,
-0.810308, -0.9817111, -2.448519, 0.6509804, 1, 0, 1,
-0.8086578, 1.025039, -0.6288639, 0.6431373, 1, 0, 1,
-0.8054201, -0.5791649, -1.712104, 0.6392157, 1, 0, 1,
-0.8024154, -1.01635, -4.645606, 0.6313726, 1, 0, 1,
-0.7980503, -0.6203665, -1.979154, 0.627451, 1, 0, 1,
-0.7973121, 0.6824898, -0.3853391, 0.6196079, 1, 0, 1,
-0.7942928, 1.117074, -1.810476, 0.6156863, 1, 0, 1,
-0.7936555, 0.5266835, -1.858601, 0.6078432, 1, 0, 1,
-0.7895434, -0.7182677, -2.60243, 0.6039216, 1, 0, 1,
-0.7869491, 0.186487, -2.361098, 0.5960785, 1, 0, 1,
-0.7803288, 2.217828, -0.05482657, 0.5882353, 1, 0, 1,
-0.7767237, -0.6491498, -0.5561485, 0.5843138, 1, 0, 1,
-0.7714844, -0.3273981, -2.410169, 0.5764706, 1, 0, 1,
-0.7713299, -0.706614, -2.626463, 0.572549, 1, 0, 1,
-0.7696505, -0.3040897, -2.993134, 0.5647059, 1, 0, 1,
-0.7694979, -0.731057, -3.79425, 0.5607843, 1, 0, 1,
-0.7692502, -0.8452774, -2.297168, 0.5529412, 1, 0, 1,
-0.7688859, 2.060522, -1.003393, 0.5490196, 1, 0, 1,
-0.7659041, 1.577836, -0.5463282, 0.5411765, 1, 0, 1,
-0.760819, -1.470932, -2.226875, 0.5372549, 1, 0, 1,
-0.7603095, 1.199302, -0.7513217, 0.5294118, 1, 0, 1,
-0.7597058, -0.08620513, -2.33203, 0.5254902, 1, 0, 1,
-0.7555428, -0.09198819, -2.143535, 0.5176471, 1, 0, 1,
-0.7541362, -0.196445, -1.828082, 0.5137255, 1, 0, 1,
-0.7484158, 0.4990321, -0.497255, 0.5058824, 1, 0, 1,
-0.748412, -1.062654, -3.26883, 0.5019608, 1, 0, 1,
-0.7451048, 0.5321828, -1.169625, 0.4941176, 1, 0, 1,
-0.7377005, 0.5137152, 0.4593679, 0.4862745, 1, 0, 1,
-0.7363191, -0.9381759, -2.900221, 0.4823529, 1, 0, 1,
-0.7316762, -2.221761, -2.922293, 0.4745098, 1, 0, 1,
-0.7306862, 0.579191, -1.554281, 0.4705882, 1, 0, 1,
-0.724774, 1.069179, -0.791513, 0.4627451, 1, 0, 1,
-0.7232967, 0.8088277, -0.4642789, 0.4588235, 1, 0, 1,
-0.7221832, 0.7956941, -0.7258475, 0.4509804, 1, 0, 1,
-0.7168249, -1.633973, -2.678877, 0.4470588, 1, 0, 1,
-0.7135797, 0.3985477, -1.155969, 0.4392157, 1, 0, 1,
-0.7124788, -0.4626968, -2.057295, 0.4352941, 1, 0, 1,
-0.7101111, -2.329038, -1.575424, 0.427451, 1, 0, 1,
-0.7091461, 0.2339891, -1.593437, 0.4235294, 1, 0, 1,
-0.7089922, -1.027693, -3.611978, 0.4156863, 1, 0, 1,
-0.7076429, 0.4494017, -0.4214925, 0.4117647, 1, 0, 1,
-0.7050321, 0.309711, 0.05695903, 0.4039216, 1, 0, 1,
-0.7047675, 0.4848344, -0.5021291, 0.3960784, 1, 0, 1,
-0.702249, 0.309465, 0.6018959, 0.3921569, 1, 0, 1,
-0.6997826, 2.137249, -1.083004, 0.3843137, 1, 0, 1,
-0.6985838, 0.1552089, -1.378663, 0.3803922, 1, 0, 1,
-0.697019, -0.403617, -1.430728, 0.372549, 1, 0, 1,
-0.694827, -1.915853, -2.604999, 0.3686275, 1, 0, 1,
-0.6892315, 0.6226183, -2.081294, 0.3607843, 1, 0, 1,
-0.6784433, -1.848072, -3.02245, 0.3568628, 1, 0, 1,
-0.6769263, 1.373908, -0.4855281, 0.3490196, 1, 0, 1,
-0.6739215, 0.4888623, -1.111855, 0.345098, 1, 0, 1,
-0.6719832, 0.413846, -0.8906417, 0.3372549, 1, 0, 1,
-0.6719704, 0.9789419, -0.5079948, 0.3333333, 1, 0, 1,
-0.6708897, -1.280999, -2.446416, 0.3254902, 1, 0, 1,
-0.6502658, -0.4796774, -2.392501, 0.3215686, 1, 0, 1,
-0.6469688, -0.02859597, -1.277855, 0.3137255, 1, 0, 1,
-0.6434125, 0.2165754, -0.4982904, 0.3098039, 1, 0, 1,
-0.6344988, 0.09147087, -1.694159, 0.3019608, 1, 0, 1,
-0.6332741, 1.366734, 0.5717641, 0.2941177, 1, 0, 1,
-0.6322834, -0.8986301, -2.65174, 0.2901961, 1, 0, 1,
-0.6313788, -0.05412672, -1.954185, 0.282353, 1, 0, 1,
-0.6246444, -1.065117, -1.795722, 0.2784314, 1, 0, 1,
-0.6206217, -1.056493, -2.370186, 0.2705882, 1, 0, 1,
-0.6148369, -1.357599, -3.825722, 0.2666667, 1, 0, 1,
-0.6140769, 1.460159, -0.5155698, 0.2588235, 1, 0, 1,
-0.6138055, -0.3420658, -4.439548, 0.254902, 1, 0, 1,
-0.6098652, -1.499865, -1.862864, 0.2470588, 1, 0, 1,
-0.6085221, 0.8250694, -2.138587, 0.2431373, 1, 0, 1,
-0.6082649, -0.7523692, -1.23919, 0.2352941, 1, 0, 1,
-0.5898957, 0.2343955, -0.2821339, 0.2313726, 1, 0, 1,
-0.5883561, -0.3660119, -1.433829, 0.2235294, 1, 0, 1,
-0.5883141, -0.6982362, -2.983074, 0.2196078, 1, 0, 1,
-0.5823486, -0.7470011, -3.184002, 0.2117647, 1, 0, 1,
-0.5816154, 0.2875775, -0.6557642, 0.2078431, 1, 0, 1,
-0.5793908, 1.934759, 1.391132, 0.2, 1, 0, 1,
-0.5753009, 1.073862, -1.149185, 0.1921569, 1, 0, 1,
-0.5728071, 0.5187749, -0.2005235, 0.1882353, 1, 0, 1,
-0.5719347, 0.5443816, -0.8198561, 0.1803922, 1, 0, 1,
-0.5694841, 0.8371273, 0.05053084, 0.1764706, 1, 0, 1,
-0.5691823, 0.737583, -1.234426, 0.1686275, 1, 0, 1,
-0.5684088, 1.827056, 0.3892241, 0.1647059, 1, 0, 1,
-0.565669, -1.896045, -4.08809, 0.1568628, 1, 0, 1,
-0.5638998, -1.884234, -2.865799, 0.1529412, 1, 0, 1,
-0.5627858, -0.8200951, -2.88938, 0.145098, 1, 0, 1,
-0.5585045, -0.5072511, -2.738842, 0.1411765, 1, 0, 1,
-0.5491981, 1.518543, -0.1723154, 0.1333333, 1, 0, 1,
-0.5410967, 1.024152, -1.039046, 0.1294118, 1, 0, 1,
-0.5396641, 0.753004, -1.628044, 0.1215686, 1, 0, 1,
-0.5394282, -2.650336, -2.646415, 0.1176471, 1, 0, 1,
-0.5380065, -0.9401215, -2.891263, 0.1098039, 1, 0, 1,
-0.5367402, -0.8125362, -1.341267, 0.1058824, 1, 0, 1,
-0.5333816, -1.320688, -2.469124, 0.09803922, 1, 0, 1,
-0.5260376, -2.097552, -0.8940706, 0.09019608, 1, 0, 1,
-0.5244853, 0.6194769, -2.055954, 0.08627451, 1, 0, 1,
-0.5234663, -0.1882584, -4.090869, 0.07843138, 1, 0, 1,
-0.5231892, -0.6417713, -2.778489, 0.07450981, 1, 0, 1,
-0.5231748, -0.8953455, -1.877287, 0.06666667, 1, 0, 1,
-0.517126, 1.149638, 0.4100462, 0.0627451, 1, 0, 1,
-0.5095181, 0.4135246, -0.4631457, 0.05490196, 1, 0, 1,
-0.501599, 1.882902, -0.2142033, 0.05098039, 1, 0, 1,
-0.4993677, 0.9088057, -0.03453738, 0.04313726, 1, 0, 1,
-0.4964859, 0.5487578, -0.7166841, 0.03921569, 1, 0, 1,
-0.4942482, 0.2081269, -1.706353, 0.03137255, 1, 0, 1,
-0.4940298, -0.1832748, -1.546467, 0.02745098, 1, 0, 1,
-0.4902496, 0.745064, 1.886015, 0.01960784, 1, 0, 1,
-0.4862036, 2.44082, -0.1869101, 0.01568628, 1, 0, 1,
-0.4837756, 0.05147495, -2.493134, 0.007843138, 1, 0, 1,
-0.4751855, -0.3048344, -0.3356597, 0.003921569, 1, 0, 1,
-0.4751127, -0.7781949, -2.772229, 0, 1, 0.003921569, 1,
-0.4744042, 0.7248352, -0.4113331, 0, 1, 0.01176471, 1,
-0.4698856, -0.809419, -2.89377, 0, 1, 0.01568628, 1,
-0.4669233, 0.3533322, -1.451804, 0, 1, 0.02352941, 1,
-0.4630909, -0.7900975, -2.360277, 0, 1, 0.02745098, 1,
-0.45749, -1.631466, -1.77179, 0, 1, 0.03529412, 1,
-0.4563071, 0.8839079, 0.1934664, 0, 1, 0.03921569, 1,
-0.4510668, -0.4689685, -1.532461, 0, 1, 0.04705882, 1,
-0.4474324, 0.8568584, 0.4804267, 0, 1, 0.05098039, 1,
-0.4449913, 2.520602, -0.3084459, 0, 1, 0.05882353, 1,
-0.440937, -0.5440775, -1.06356, 0, 1, 0.0627451, 1,
-0.4362464, 1.646685, 0.8678384, 0, 1, 0.07058824, 1,
-0.4317859, -1.422653, -1.963641, 0, 1, 0.07450981, 1,
-0.4304993, 0.7211711, -4.455161, 0, 1, 0.08235294, 1,
-0.4278086, 0.9913076, -0.07980946, 0, 1, 0.08627451, 1,
-0.4241735, 1.214778, -2.473835, 0, 1, 0.09411765, 1,
-0.4223357, -0.1788931, -3.102032, 0, 1, 0.1019608, 1,
-0.4192744, 0.7899365, -0.5330884, 0, 1, 0.1058824, 1,
-0.4190499, 1.31105, 0.7613787, 0, 1, 0.1137255, 1,
-0.4171239, -0.9205745, -2.544085, 0, 1, 0.1176471, 1,
-0.4168786, -0.09684443, -1.517113, 0, 1, 0.1254902, 1,
-0.4150526, 0.9724977, -2.096969, 0, 1, 0.1294118, 1,
-0.4148727, -0.5933064, -3.261498, 0, 1, 0.1372549, 1,
-0.4121657, -0.4812206, -4.192436, 0, 1, 0.1411765, 1,
-0.4086713, 0.9150898, 0.4282819, 0, 1, 0.1490196, 1,
-0.405876, -0.3827819, -1.768184, 0, 1, 0.1529412, 1,
-0.4058141, -0.9770943, -3.569035, 0, 1, 0.1607843, 1,
-0.4012773, -0.3593345, -0.5428128, 0, 1, 0.1647059, 1,
-0.400568, 2.114708, -0.6210439, 0, 1, 0.172549, 1,
-0.3995479, 0.1782935, -1.668231, 0, 1, 0.1764706, 1,
-0.3910774, 1.406867, -0.3600065, 0, 1, 0.1843137, 1,
-0.3895288, 1.106325, 0.6839122, 0, 1, 0.1882353, 1,
-0.3887506, 0.9551479, -0.4644624, 0, 1, 0.1960784, 1,
-0.3823457, 2.108868, 1.095443, 0, 1, 0.2039216, 1,
-0.376008, 0.4155686, 0.08427788, 0, 1, 0.2078431, 1,
-0.3699105, -1.734466, -1.095444, 0, 1, 0.2156863, 1,
-0.3696726, 1.467271, -0.1534821, 0, 1, 0.2196078, 1,
-0.3603252, -0.2581237, -2.529772, 0, 1, 0.227451, 1,
-0.3561401, 0.4075117, -1.659454, 0, 1, 0.2313726, 1,
-0.3542225, -0.9606294, -2.511568, 0, 1, 0.2392157, 1,
-0.3515517, -1.711533, -4.032755, 0, 1, 0.2431373, 1,
-0.3489572, 0.179716, -2.379001, 0, 1, 0.2509804, 1,
-0.3485225, -0.4783288, -2.07742, 0, 1, 0.254902, 1,
-0.3484806, 1.331043, -1.677391, 0, 1, 0.2627451, 1,
-0.3470767, 0.3202323, 0.005221491, 0, 1, 0.2666667, 1,
-0.3453396, 0.7411612, -0.09568417, 0, 1, 0.2745098, 1,
-0.3418507, 1.549396, 1.284831, 0, 1, 0.2784314, 1,
-0.3410484, 1.588286, -0.2942597, 0, 1, 0.2862745, 1,
-0.3310924, -1.115236, -2.55069, 0, 1, 0.2901961, 1,
-0.3233338, -0.8433298, -2.464528, 0, 1, 0.2980392, 1,
-0.3232693, 0.1895279, -1.760854, 0, 1, 0.3058824, 1,
-0.3231164, -0.751319, -1.943842, 0, 1, 0.3098039, 1,
-0.3203895, -0.8143879, -2.111305, 0, 1, 0.3176471, 1,
-0.3196538, -0.6832657, -2.761879, 0, 1, 0.3215686, 1,
-0.3090522, -3.090818, -2.759281, 0, 1, 0.3294118, 1,
-0.3040776, -0.1403458, -2.601151, 0, 1, 0.3333333, 1,
-0.3040475, -1.950465, -3.212436, 0, 1, 0.3411765, 1,
-0.3038611, 1.184476, 0.7767196, 0, 1, 0.345098, 1,
-0.3028175, -0.2125201, -2.382377, 0, 1, 0.3529412, 1,
-0.3012353, -0.795299, -3.007708, 0, 1, 0.3568628, 1,
-0.2999007, 1.223633, -1.453477, 0, 1, 0.3647059, 1,
-0.297456, 0.9383968, 0.02258531, 0, 1, 0.3686275, 1,
-0.2925046, 0.001939179, -0.8269342, 0, 1, 0.3764706, 1,
-0.2903542, 1.173787, 0.2288629, 0, 1, 0.3803922, 1,
-0.2900821, -1.338688, -2.030321, 0, 1, 0.3882353, 1,
-0.289883, 0.3377371, -0.8151715, 0, 1, 0.3921569, 1,
-0.2734849, 0.2379071, -2.754205, 0, 1, 0.4, 1,
-0.2732919, -0.2299048, -3.601614, 0, 1, 0.4078431, 1,
-0.2722057, 0.1312477, -1.403225, 0, 1, 0.4117647, 1,
-0.2708432, 0.7681999, 0.5178069, 0, 1, 0.4196078, 1,
-0.2681636, -0.3482794, -1.713665, 0, 1, 0.4235294, 1,
-0.266773, -0.8759951, -1.625142, 0, 1, 0.4313726, 1,
-0.2639368, 3.161022, 0.6715479, 0, 1, 0.4352941, 1,
-0.2620149, -0.2614937, -2.275593, 0, 1, 0.4431373, 1,
-0.2590359, -0.4629519, -2.574558, 0, 1, 0.4470588, 1,
-0.2575179, 0.3934062, 0.1080703, 0, 1, 0.454902, 1,
-0.2522826, 1.456501, -0.2676637, 0, 1, 0.4588235, 1,
-0.2451683, -0.486557, -3.505393, 0, 1, 0.4666667, 1,
-0.2409574, 1.371941, -0.7151593, 0, 1, 0.4705882, 1,
-0.2379504, -1.380135, -2.825848, 0, 1, 0.4784314, 1,
-0.2353922, -0.5151787, -3.227462, 0, 1, 0.4823529, 1,
-0.2347784, 0.3844722, -0.5451702, 0, 1, 0.4901961, 1,
-0.2347172, 1.699794, 0.02791744, 0, 1, 0.4941176, 1,
-0.2346591, -0.5266378, -4.030035, 0, 1, 0.5019608, 1,
-0.2342838, 0.1647666, -0.7338074, 0, 1, 0.509804, 1,
-0.232271, 1.189881, 0.4996191, 0, 1, 0.5137255, 1,
-0.2317638, 0.5299504, -0.4918275, 0, 1, 0.5215687, 1,
-0.2312783, 0.07240119, -0.4002778, 0, 1, 0.5254902, 1,
-0.230144, 0.2785558, -0.9950127, 0, 1, 0.5333334, 1,
-0.2239975, -0.4508779, -0.7416501, 0, 1, 0.5372549, 1,
-0.2228566, -0.1058165, -1.094214, 0, 1, 0.5450981, 1,
-0.2139236, 0.2063351, 0.6562671, 0, 1, 0.5490196, 1,
-0.2102929, -0.2014683, -3.191107, 0, 1, 0.5568628, 1,
-0.2087578, 0.5959995, -0.3492823, 0, 1, 0.5607843, 1,
-0.2073475, 0.453277, 0.6495517, 0, 1, 0.5686275, 1,
-0.2071426, -0.4758514, -3.862185, 0, 1, 0.572549, 1,
-0.2054569, 1.096466, 0.5264515, 0, 1, 0.5803922, 1,
-0.205283, 0.5190831, -0.5660483, 0, 1, 0.5843138, 1,
-0.2043171, -0.2864405, -2.373458, 0, 1, 0.5921569, 1,
-0.2028959, 1.193311, 0.3611998, 0, 1, 0.5960785, 1,
-0.2022144, -0.7839103, -2.308803, 0, 1, 0.6039216, 1,
-0.2017755, 0.516687, -1.176276, 0, 1, 0.6117647, 1,
-0.2007385, 1.354979, 0.1784384, 0, 1, 0.6156863, 1,
-0.199595, 0.7908948, 1.440325, 0, 1, 0.6235294, 1,
-0.1981341, -0.2557581, -2.778451, 0, 1, 0.627451, 1,
-0.1972353, -0.9315415, -3.513178, 0, 1, 0.6352941, 1,
-0.187857, -2.236442, -2.131637, 0, 1, 0.6392157, 1,
-0.1817938, 0.9566106, 0.07512036, 0, 1, 0.6470588, 1,
-0.1753512, 0.2585507, -0.6845248, 0, 1, 0.6509804, 1,
-0.1749646, 1.45157, 0.218375, 0, 1, 0.6588235, 1,
-0.1743966, 0.8284012, 2.14113, 0, 1, 0.6627451, 1,
-0.1727129, 1.393218, 0.5952657, 0, 1, 0.6705883, 1,
-0.167989, -0.6057971, -3.377139, 0, 1, 0.6745098, 1,
-0.1660273, 0.3875681, -1.391115, 0, 1, 0.682353, 1,
-0.1614109, 0.9899859, -0.7652625, 0, 1, 0.6862745, 1,
-0.1603363, 0.8878988, -2.790433, 0, 1, 0.6941177, 1,
-0.1590158, 1.043537, -0.2608283, 0, 1, 0.7019608, 1,
-0.1582308, 0.2481536, 0.2481223, 0, 1, 0.7058824, 1,
-0.1542967, -0.7940252, -4.667626, 0, 1, 0.7137255, 1,
-0.1538129, 0.5448813, 0.4862317, 0, 1, 0.7176471, 1,
-0.1520846, 1.130224, -2.373215, 0, 1, 0.7254902, 1,
-0.1502347, -1.068073, -2.927623, 0, 1, 0.7294118, 1,
-0.1428339, -0.574416, -3.696346, 0, 1, 0.7372549, 1,
-0.1375249, -0.3415232, -1.819312, 0, 1, 0.7411765, 1,
-0.1363727, 0.1142066, -1.179034, 0, 1, 0.7490196, 1,
-0.1291576, 0.08298059, -3.035963, 0, 1, 0.7529412, 1,
-0.1276163, -0.2210119, -1.84567, 0, 1, 0.7607843, 1,
-0.1271243, -0.5338123, -1.914986, 0, 1, 0.7647059, 1,
-0.124502, 0.01609174, -1.66657, 0, 1, 0.772549, 1,
-0.1231154, 0.3195433, -0.3297231, 0, 1, 0.7764706, 1,
-0.1212171, 1.765866, 1.483434, 0, 1, 0.7843137, 1,
-0.1197465, -0.5945425, -4.46237, 0, 1, 0.7882353, 1,
-0.1179617, 0.5201693, 0.7495396, 0, 1, 0.7960784, 1,
-0.1176394, 0.6358168, -0.2571083, 0, 1, 0.8039216, 1,
-0.117387, -0.1965053, 0.3640363, 0, 1, 0.8078431, 1,
-0.1144771, -0.7586101, -6.143881, 0, 1, 0.8156863, 1,
-0.1137944, 0.7771125, -0.2985434, 0, 1, 0.8196079, 1,
-0.1064115, 0.1668309, -1.069532, 0, 1, 0.827451, 1,
-0.1032749, 0.04461579, -1.008166, 0, 1, 0.8313726, 1,
-0.09870542, 0.0491544, -1.440725, 0, 1, 0.8392157, 1,
-0.09825642, -0.1448871, -3.647992, 0, 1, 0.8431373, 1,
-0.09762751, -0.7964641, -2.07351, 0, 1, 0.8509804, 1,
-0.09734708, -1.125402, -3.098672, 0, 1, 0.854902, 1,
-0.097289, 0.1874002, -0.4075293, 0, 1, 0.8627451, 1,
-0.09585311, 1.696607, 0.9974163, 0, 1, 0.8666667, 1,
-0.09320049, 1.066723, -0.3900469, 0, 1, 0.8745098, 1,
-0.08833307, 0.3930597, -0.6648572, 0, 1, 0.8784314, 1,
-0.0837063, 0.7628691, -3.112121, 0, 1, 0.8862745, 1,
-0.0834105, 0.03725751, -3.031377, 0, 1, 0.8901961, 1,
-0.08060711, 0.2234254, 1.579502, 0, 1, 0.8980392, 1,
-0.08040531, 0.2763468, 1.326006, 0, 1, 0.9058824, 1,
-0.07998551, -1.826014, -5.558187, 0, 1, 0.9098039, 1,
-0.07704626, -0.8893252, -2.115683, 0, 1, 0.9176471, 1,
-0.07436138, -0.2609425, -4.928656, 0, 1, 0.9215686, 1,
-0.06886803, -0.1771607, -2.192634, 0, 1, 0.9294118, 1,
-0.06590628, -1.224211, -3.53893, 0, 1, 0.9333333, 1,
-0.06527293, 0.06515793, 1.203148, 0, 1, 0.9411765, 1,
-0.0645343, -0.5092263, -2.413878, 0, 1, 0.945098, 1,
-0.06170473, -1.074407, -2.143424, 0, 1, 0.9529412, 1,
-0.06049573, -0.8147906, -4.059382, 0, 1, 0.9568627, 1,
-0.05860831, -0.427828, -2.09706, 0, 1, 0.9647059, 1,
-0.05741936, 0.9190546, -1.830923, 0, 1, 0.9686275, 1,
-0.05365013, -0.008697107, -1.728031, 0, 1, 0.9764706, 1,
-0.0518115, -0.0950619, -2.703354, 0, 1, 0.9803922, 1,
-0.05156064, 0.6035464, -0.7976248, 0, 1, 0.9882353, 1,
-0.04780543, 1.383871, -1.214162, 0, 1, 0.9921569, 1,
-0.04536793, 1.210456, -0.6026118, 0, 1, 1, 1,
-0.03169136, 1.507753, 1.256582, 0, 0.9921569, 1, 1,
-0.03158071, 2.238465, -1.67727, 0, 0.9882353, 1, 1,
-0.03115899, 1.123838, 1.703867, 0, 0.9803922, 1, 1,
-0.03062678, -0.6280476, -1.60648, 0, 0.9764706, 1, 1,
-0.02456267, 1.167837, 0.5611204, 0, 0.9686275, 1, 1,
-0.02402242, -0.09022816, -4.035494, 0, 0.9647059, 1, 1,
-0.02243085, 0.7883452, -0.7347175, 0, 0.9568627, 1, 1,
-0.02042417, 0.7807909, 1.619048, 0, 0.9529412, 1, 1,
-0.02008538, -0.9388143, -2.735425, 0, 0.945098, 1, 1,
-0.01864951, -0.78251, -3.029606, 0, 0.9411765, 1, 1,
-0.01723087, 0.1950303, -0.2177394, 0, 0.9333333, 1, 1,
-0.01430572, -0.4188245, -2.474893, 0, 0.9294118, 1, 1,
-0.009987237, 0.2195521, -0.02198638, 0, 0.9215686, 1, 1,
-0.00889705, 0.2521615, -0.01630548, 0, 0.9176471, 1, 1,
-0.007598675, -0.4793147, -1.376951, 0, 0.9098039, 1, 1,
-0.003356468, 0.3219728, -0.1862146, 0, 0.9058824, 1, 1,
-0.002654105, 0.03520899, 0.1056411, 0, 0.8980392, 1, 1,
-0.002190646, -1.112079, -3.171079, 0, 0.8901961, 1, 1,
0.001896372, -0.829161, 1.637042, 0, 0.8862745, 1, 1,
0.001912978, 0.3084376, -0.5055655, 0, 0.8784314, 1, 1,
0.004841372, 2.183969, -0.5159279, 0, 0.8745098, 1, 1,
0.006105955, -0.7478541, 3.789917, 0, 0.8666667, 1, 1,
0.00859537, 0.1168902, 1.182244, 0, 0.8627451, 1, 1,
0.00917005, -0.2062479, 2.644624, 0, 0.854902, 1, 1,
0.01215408, 0.3616793, -1.848334, 0, 0.8509804, 1, 1,
0.01269485, -0.0003169986, 0.1587583, 0, 0.8431373, 1, 1,
0.01311374, -0.06586134, 3.080565, 0, 0.8392157, 1, 1,
0.01665146, 2.162977, 1.195204, 0, 0.8313726, 1, 1,
0.01799599, 1.323857, 0.4227672, 0, 0.827451, 1, 1,
0.02476165, -1.081573, 3.522783, 0, 0.8196079, 1, 1,
0.03168925, -1.160913, 2.13085, 0, 0.8156863, 1, 1,
0.03546186, -0.6522521, 4.427724, 0, 0.8078431, 1, 1,
0.0377464, 0.8799595, -3.185457, 0, 0.8039216, 1, 1,
0.04586628, -1.114466, 3.136844, 0, 0.7960784, 1, 1,
0.04601089, 1.474233, 1.642883, 0, 0.7882353, 1, 1,
0.04603909, -0.01474041, 2.617458, 0, 0.7843137, 1, 1,
0.04944814, -1.515854, 2.815192, 0, 0.7764706, 1, 1,
0.05339134, 1.94035, 0.4722511, 0, 0.772549, 1, 1,
0.05456723, 0.7743373, -1.042913, 0, 0.7647059, 1, 1,
0.05547539, 0.4483391, 0.7715524, 0, 0.7607843, 1, 1,
0.05686975, 0.04642636, 2.506547, 0, 0.7529412, 1, 1,
0.06257704, -0.1081861, 3.278599, 0, 0.7490196, 1, 1,
0.06788234, 0.4492007, 0.7204446, 0, 0.7411765, 1, 1,
0.06979012, -0.7701378, 2.973137, 0, 0.7372549, 1, 1,
0.07138625, 0.8968389, 0.02854256, 0, 0.7294118, 1, 1,
0.07258394, 1.186814, -2.047123, 0, 0.7254902, 1, 1,
0.07677107, 1.803324, 0.7679743, 0, 0.7176471, 1, 1,
0.08450878, -0.5491905, 3.821641, 0, 0.7137255, 1, 1,
0.08672089, 0.4141374, -0.4584371, 0, 0.7058824, 1, 1,
0.08685308, -1.20148, 3.658422, 0, 0.6980392, 1, 1,
0.08770442, -0.1887704, 4.437897, 0, 0.6941177, 1, 1,
0.08802698, -0.4718196, 3.818002, 0, 0.6862745, 1, 1,
0.08918066, -0.5160969, 2.919315, 0, 0.682353, 1, 1,
0.09039982, -0.8295426, 2.236691, 0, 0.6745098, 1, 1,
0.09476297, -1.183253, 3.609401, 0, 0.6705883, 1, 1,
0.09873688, -2.131566, 1.156425, 0, 0.6627451, 1, 1,
0.1010503, 0.2529078, 0.8951946, 0, 0.6588235, 1, 1,
0.1123788, -1.272588, 3.371527, 0, 0.6509804, 1, 1,
0.1153024, -0.3325086, 2.036998, 0, 0.6470588, 1, 1,
0.1153265, -0.320813, 2.964787, 0, 0.6392157, 1, 1,
0.1154206, -0.6055582, 2.528, 0, 0.6352941, 1, 1,
0.1159774, 0.436316, -0.489307, 0, 0.627451, 1, 1,
0.1249401, 0.0001404475, 0.9540408, 0, 0.6235294, 1, 1,
0.1275461, 1.67364, -0.6964284, 0, 0.6156863, 1, 1,
0.1308158, 0.7422895, 2.042782, 0, 0.6117647, 1, 1,
0.1346211, -0.6047277, 4.487934, 0, 0.6039216, 1, 1,
0.1347909, -0.6470808, 3.792407, 0, 0.5960785, 1, 1,
0.1352725, 0.4930659, -0.7533537, 0, 0.5921569, 1, 1,
0.1431459, 0.08432188, 1.15636, 0, 0.5843138, 1, 1,
0.1461838, 0.9193985, 0.5249597, 0, 0.5803922, 1, 1,
0.148712, 0.451221, 0.4226174, 0, 0.572549, 1, 1,
0.1488125, 1.11908, 0.1094073, 0, 0.5686275, 1, 1,
0.1490788, 0.7672552, -0.3363185, 0, 0.5607843, 1, 1,
0.1493123, -0.5968249, 3.253673, 0, 0.5568628, 1, 1,
0.1543674, -0.1821278, 1.037579, 0, 0.5490196, 1, 1,
0.1549154, -1.259242, 2.473652, 0, 0.5450981, 1, 1,
0.1560994, -0.1463099, 1.226834, 0, 0.5372549, 1, 1,
0.1572443, 0.2086895, 0.4546031, 0, 0.5333334, 1, 1,
0.1650721, 0.273682, 2.395995, 0, 0.5254902, 1, 1,
0.1658926, 1.300355, 0.2285545, 0, 0.5215687, 1, 1,
0.1697341, -0.9491851, 3.995568, 0, 0.5137255, 1, 1,
0.170486, -1.445968, 3.212805, 0, 0.509804, 1, 1,
0.1753266, 0.5113146, 0.7693183, 0, 0.5019608, 1, 1,
0.1757009, 0.9111541, -0.04282046, 0, 0.4941176, 1, 1,
0.1819762, 0.2562957, -1.50059, 0, 0.4901961, 1, 1,
0.1841338, 0.05217278, 0.4229379, 0, 0.4823529, 1, 1,
0.1857406, -0.7121048, 2.814852, 0, 0.4784314, 1, 1,
0.1881822, -0.003677928, 1.929263, 0, 0.4705882, 1, 1,
0.1940706, -0.6037275, 4.173383, 0, 0.4666667, 1, 1,
0.1999972, 0.1858626, -0.02381542, 0, 0.4588235, 1, 1,
0.2027913, -0.2594394, 3.379383, 0, 0.454902, 1, 1,
0.2047751, 1.182046, -0.2227651, 0, 0.4470588, 1, 1,
0.2073379, 1.085991, 0.7939917, 0, 0.4431373, 1, 1,
0.2088024, -1.050952, 3.120857, 0, 0.4352941, 1, 1,
0.208855, 0.353599, -0.04839758, 0, 0.4313726, 1, 1,
0.2134809, 0.204527, 0.8948994, 0, 0.4235294, 1, 1,
0.2182173, 1.721616, -0.5636978, 0, 0.4196078, 1, 1,
0.2184199, -0.3924591, 2.457673, 0, 0.4117647, 1, 1,
0.2191794, 1.998145, -0.8893732, 0, 0.4078431, 1, 1,
0.2215416, -0.6724262, 3.053105, 0, 0.4, 1, 1,
0.2242907, -1.390921, 4.192677, 0, 0.3921569, 1, 1,
0.2264522, 0.9451683, 0.04384017, 0, 0.3882353, 1, 1,
0.22779, 0.789467, -0.5882859, 0, 0.3803922, 1, 1,
0.2286483, -0.09682812, 1.309564, 0, 0.3764706, 1, 1,
0.2293324, -0.5688984, 2.065017, 0, 0.3686275, 1, 1,
0.232171, -0.7212794, 1.628554, 0, 0.3647059, 1, 1,
0.238532, 0.7738034, 0.3866504, 0, 0.3568628, 1, 1,
0.2407615, 0.4393509, 0.545369, 0, 0.3529412, 1, 1,
0.2410878, -0.2046438, 2.025309, 0, 0.345098, 1, 1,
0.2422203, -1.134857, 4.050566, 0, 0.3411765, 1, 1,
0.2422762, 0.03146454, 2.011603, 0, 0.3333333, 1, 1,
0.2454517, -0.4047786, 2.456444, 0, 0.3294118, 1, 1,
0.247983, -0.2513319, 1.196111, 0, 0.3215686, 1, 1,
0.2492116, -0.01481016, 1.964217, 0, 0.3176471, 1, 1,
0.2495202, -2.676715, 3.324045, 0, 0.3098039, 1, 1,
0.2552072, -1.461076, 2.125873, 0, 0.3058824, 1, 1,
0.2574817, -0.5976946, 2.022074, 0, 0.2980392, 1, 1,
0.2582383, 0.4460538, 0.3440492, 0, 0.2901961, 1, 1,
0.2586084, 0.2019921, 0.2005838, 0, 0.2862745, 1, 1,
0.2614743, -1.244468, 1.681883, 0, 0.2784314, 1, 1,
0.262462, 0.6078407, -0.5004703, 0, 0.2745098, 1, 1,
0.2630963, -2.229207, 2.235949, 0, 0.2666667, 1, 1,
0.2763714, -0.784005, 3.683459, 0, 0.2627451, 1, 1,
0.2786278, 0.8879893, 1.367921, 0, 0.254902, 1, 1,
0.2786497, -0.5425013, 4.523344, 0, 0.2509804, 1, 1,
0.2791449, 0.7150431, -1.518216, 0, 0.2431373, 1, 1,
0.2857749, -1.265476, 3.280683, 0, 0.2392157, 1, 1,
0.2891596, -0.8441939, 2.363971, 0, 0.2313726, 1, 1,
0.2918976, 0.3141664, 0.9086805, 0, 0.227451, 1, 1,
0.2924227, 0.105491, 0.2007925, 0, 0.2196078, 1, 1,
0.2938348, -0.3884486, 2.243654, 0, 0.2156863, 1, 1,
0.2984835, 0.1849512, 0.09855644, 0, 0.2078431, 1, 1,
0.3042337, -0.4514126, 1.126396, 0, 0.2039216, 1, 1,
0.3090135, 1.036752, -0.2981847, 0, 0.1960784, 1, 1,
0.316402, -1.261434, 4.391866, 0, 0.1882353, 1, 1,
0.3182212, 0.4904701, 2.464415, 0, 0.1843137, 1, 1,
0.3207801, 0.9644408, -1.243402, 0, 0.1764706, 1, 1,
0.3392707, 1.527419, -0.1058169, 0, 0.172549, 1, 1,
0.3433561, -0.4602137, 3.44946, 0, 0.1647059, 1, 1,
0.3470179, 0.1329004, 0.4710459, 0, 0.1607843, 1, 1,
0.3470731, 2.123713, 1.827155, 0, 0.1529412, 1, 1,
0.3515951, -0.2654231, 1.483217, 0, 0.1490196, 1, 1,
0.352491, -0.107518, 2.236142, 0, 0.1411765, 1, 1,
0.3530974, -0.4932667, 3.170137, 0, 0.1372549, 1, 1,
0.3532182, -0.1672578, 2.451155, 0, 0.1294118, 1, 1,
0.3545798, 0.3540071, 1.083848, 0, 0.1254902, 1, 1,
0.3582107, 1.405975, -1.102371, 0, 0.1176471, 1, 1,
0.3644482, 0.135466, -0.6344044, 0, 0.1137255, 1, 1,
0.3659081, 0.07523593, 3.23415, 0, 0.1058824, 1, 1,
0.3667465, 1.237808, 0.7927186, 0, 0.09803922, 1, 1,
0.3675102, -0.04278613, 0.9657775, 0, 0.09411765, 1, 1,
0.3689965, 0.05251691, 1.026622, 0, 0.08627451, 1, 1,
0.3694741, -0.5711254, 3.863073, 0, 0.08235294, 1, 1,
0.3703665, -0.8975142, 3.0093, 0, 0.07450981, 1, 1,
0.3729303, 0.7816792, 0.6551132, 0, 0.07058824, 1, 1,
0.3755842, 0.6361475, 1.359981, 0, 0.0627451, 1, 1,
0.3761925, 0.8995814, -0.5633391, 0, 0.05882353, 1, 1,
0.3769456, -1.162042, 2.757773, 0, 0.05098039, 1, 1,
0.3973341, -0.5675951, 1.409383, 0, 0.04705882, 1, 1,
0.3993879, 0.3705132, 1.456725, 0, 0.03921569, 1, 1,
0.4005623, 1.158286, 1.384044, 0, 0.03529412, 1, 1,
0.4009331, 0.3940538, -0.6515235, 0, 0.02745098, 1, 1,
0.4094275, 0.3719577, 1.281137, 0, 0.02352941, 1, 1,
0.4113464, -0.9482301, 2.176662, 0, 0.01568628, 1, 1,
0.4123296, -1.220024, 3.819132, 0, 0.01176471, 1, 1,
0.414012, 0.8475737, -0.162595, 0, 0.003921569, 1, 1,
0.4140191, -0.1528808, 2.117247, 0.003921569, 0, 1, 1,
0.4140951, 0.8870132, 0.2841632, 0.007843138, 0, 1, 1,
0.4200549, 1.583722, 2.777053, 0.01568628, 0, 1, 1,
0.4211755, -0.4070377, 3.073671, 0.01960784, 0, 1, 1,
0.4245639, -0.1884199, 0.5111792, 0.02745098, 0, 1, 1,
0.425329, 0.6640812, -0.4168158, 0.03137255, 0, 1, 1,
0.4312587, -0.3915891, 2.461103, 0.03921569, 0, 1, 1,
0.4330052, 1.569767, 0.6979889, 0.04313726, 0, 1, 1,
0.4394862, -0.2639717, 3.78881, 0.05098039, 0, 1, 1,
0.4398684, 1.22586, 1.052476, 0.05490196, 0, 1, 1,
0.4436477, -0.5643553, 3.473071, 0.0627451, 0, 1, 1,
0.456066, 0.08428933, 4.109798, 0.06666667, 0, 1, 1,
0.4624392, -1.173281, 2.865253, 0.07450981, 0, 1, 1,
0.4632396, 0.2335385, 0.8690333, 0.07843138, 0, 1, 1,
0.4732958, -0.5024143, 3.298115, 0.08627451, 0, 1, 1,
0.4735008, 0.6034841, -0.8948382, 0.09019608, 0, 1, 1,
0.4747643, 1.509605, 1.001158, 0.09803922, 0, 1, 1,
0.4764791, 1.581041, 0.782676, 0.1058824, 0, 1, 1,
0.4824843, -0.3406867, 2.926277, 0.1098039, 0, 1, 1,
0.4827266, -1.640822, 3.44813, 0.1176471, 0, 1, 1,
0.4838519, -0.7948635, 2.535311, 0.1215686, 0, 1, 1,
0.4853779, -0.9582793, 4.164839, 0.1294118, 0, 1, 1,
0.4860936, 2.195097, 1.532118, 0.1333333, 0, 1, 1,
0.4868762, -0.7719499, 2.096423, 0.1411765, 0, 1, 1,
0.4871578, -0.6410138, 1.589362, 0.145098, 0, 1, 1,
0.4889238, 0.4815955, 0.3613743, 0.1529412, 0, 1, 1,
0.4951582, 0.7133088, 1.395297, 0.1568628, 0, 1, 1,
0.496173, -0.5098765, 1.412002, 0.1647059, 0, 1, 1,
0.4968747, -0.6301339, 3.273002, 0.1686275, 0, 1, 1,
0.4996412, 1.538124, 0.5252798, 0.1764706, 0, 1, 1,
0.4997282, -0.3579262, 2.831488, 0.1803922, 0, 1, 1,
0.5038209, -1.63692, 3.391814, 0.1882353, 0, 1, 1,
0.5053713, -0.2496441, 2.708461, 0.1921569, 0, 1, 1,
0.5106916, -0.7361484, 1.917528, 0.2, 0, 1, 1,
0.5124162, -1.175227, 2.74385, 0.2078431, 0, 1, 1,
0.5175695, -0.9639453, 3.480974, 0.2117647, 0, 1, 1,
0.5218668, -0.336327, 1.819299, 0.2196078, 0, 1, 1,
0.5289159, -0.07890102, 1.893039, 0.2235294, 0, 1, 1,
0.5291718, -0.5432856, 3.156407, 0.2313726, 0, 1, 1,
0.530486, 0.666451, 0.8536061, 0.2352941, 0, 1, 1,
0.5443215, -0.7143061, 2.878358, 0.2431373, 0, 1, 1,
0.5477272, 1.258088, -0.3733095, 0.2470588, 0, 1, 1,
0.5482479, -1.526904, 3.427291, 0.254902, 0, 1, 1,
0.5496989, -0.2938126, 3.402088, 0.2588235, 0, 1, 1,
0.5570415, -0.6277946, 3.725122, 0.2666667, 0, 1, 1,
0.5574676, -1.270703, 1.538134, 0.2705882, 0, 1, 1,
0.5646974, 0.4082037, 0.4960863, 0.2784314, 0, 1, 1,
0.5675226, -0.306688, 0.7025917, 0.282353, 0, 1, 1,
0.5675583, -0.1955386, 1.057722, 0.2901961, 0, 1, 1,
0.5710742, 0.413133, 0.1894729, 0.2941177, 0, 1, 1,
0.5746599, 2.310447, -0.699093, 0.3019608, 0, 1, 1,
0.5801879, -0.07953361, 2.243947, 0.3098039, 0, 1, 1,
0.5803498, 0.607389, 0.7477783, 0.3137255, 0, 1, 1,
0.584067, 0.07268894, 0.6819374, 0.3215686, 0, 1, 1,
0.5876122, -0.02539636, 1.563043, 0.3254902, 0, 1, 1,
0.591353, 2.687739, 1.306171, 0.3333333, 0, 1, 1,
0.5921271, 0.1508083, 0.6376184, 0.3372549, 0, 1, 1,
0.5933335, 0.5622692, 2.49245, 0.345098, 0, 1, 1,
0.5940732, -0.8025814, 2.537072, 0.3490196, 0, 1, 1,
0.5991039, 2.049802, -0.3455219, 0.3568628, 0, 1, 1,
0.6047063, 0.14696, 1.281865, 0.3607843, 0, 1, 1,
0.6051753, 0.9338567, 1.153938, 0.3686275, 0, 1, 1,
0.6108477, 0.08444799, 0.7270537, 0.372549, 0, 1, 1,
0.6177195, 0.3948958, 0.1551896, 0.3803922, 0, 1, 1,
0.6185521, -0.03555058, 1.593186, 0.3843137, 0, 1, 1,
0.6223368, 0.05519013, 1.558221, 0.3921569, 0, 1, 1,
0.6409228, -0.2949902, 2.829268, 0.3960784, 0, 1, 1,
0.6454196, -0.2231522, 1.381309, 0.4039216, 0, 1, 1,
0.6480631, 0.5861228, 1.526585, 0.4117647, 0, 1, 1,
0.6496061, 0.8615186, 1.51474, 0.4156863, 0, 1, 1,
0.6508265, 0.2723463, 0.6161727, 0.4235294, 0, 1, 1,
0.6520054, -0.7970918, 1.65879, 0.427451, 0, 1, 1,
0.6521644, 0.01502012, 0.176445, 0.4352941, 0, 1, 1,
0.6570592, -0.2288454, 3.372224, 0.4392157, 0, 1, 1,
0.6603212, 1.319898, -0.04838465, 0.4470588, 0, 1, 1,
0.6612234, -0.5032736, 1.206459, 0.4509804, 0, 1, 1,
0.6633345, 0.9569764, -1.768301, 0.4588235, 0, 1, 1,
0.6676037, -0.862056, 2.964453, 0.4627451, 0, 1, 1,
0.6790618, 0.8119444, 1.586881, 0.4705882, 0, 1, 1,
0.6854511, 0.813836, 0.5852211, 0.4745098, 0, 1, 1,
0.6963148, -1.192479, 2.292879, 0.4823529, 0, 1, 1,
0.7020689, -0.4288822, 1.580598, 0.4862745, 0, 1, 1,
0.7086629, -0.1109683, 1.574162, 0.4941176, 0, 1, 1,
0.7110915, 1.776449, 0.6967211, 0.5019608, 0, 1, 1,
0.7131504, 1.07429, -0.2579488, 0.5058824, 0, 1, 1,
0.7133237, -0.4569752, 1.971112, 0.5137255, 0, 1, 1,
0.7170246, -0.3614973, 1.020987, 0.5176471, 0, 1, 1,
0.7203423, 0.6129278, 0.5282203, 0.5254902, 0, 1, 1,
0.7215704, 0.208522, -0.2063423, 0.5294118, 0, 1, 1,
0.7218595, 0.04590508, 2.099138, 0.5372549, 0, 1, 1,
0.723601, -0.4557754, 1.62538, 0.5411765, 0, 1, 1,
0.7278495, 0.2449718, 1.093031, 0.5490196, 0, 1, 1,
0.7288958, 0.5299156, 1.685091, 0.5529412, 0, 1, 1,
0.7297394, 0.4921362, 1.909135, 0.5607843, 0, 1, 1,
0.7299638, 0.09484025, 1.46763, 0.5647059, 0, 1, 1,
0.7317075, 2.143354, -0.3202171, 0.572549, 0, 1, 1,
0.7359642, 0.6192235, 1.835637, 0.5764706, 0, 1, 1,
0.7371088, -1.560299, 2.070909, 0.5843138, 0, 1, 1,
0.7371904, -0.7279724, 2.211348, 0.5882353, 0, 1, 1,
0.7374316, 2.092005, -0.1808328, 0.5960785, 0, 1, 1,
0.740992, 1.235322, -0.1648006, 0.6039216, 0, 1, 1,
0.7436337, -0.3768675, 1.135408, 0.6078432, 0, 1, 1,
0.7444816, 0.4872002, 2.072762, 0.6156863, 0, 1, 1,
0.7472905, 0.4323368, 1.536784, 0.6196079, 0, 1, 1,
0.7476535, 1.273377, 0.1498297, 0.627451, 0, 1, 1,
0.7512081, -1.415741, 2.794357, 0.6313726, 0, 1, 1,
0.7534597, -0.5121681, 4.341745, 0.6392157, 0, 1, 1,
0.7551906, 0.9999245, 2.287392, 0.6431373, 0, 1, 1,
0.7629037, -0.03091531, 1.322319, 0.6509804, 0, 1, 1,
0.7791474, -0.8676392, 1.637644, 0.654902, 0, 1, 1,
0.7881185, -0.5843458, 1.368041, 0.6627451, 0, 1, 1,
0.7932807, 0.2492362, 1.510262, 0.6666667, 0, 1, 1,
0.80144, 0.5850804, 1.660302, 0.6745098, 0, 1, 1,
0.8035963, 1.552871, 1.594563, 0.6784314, 0, 1, 1,
0.8055938, 0.3021168, 1.978172, 0.6862745, 0, 1, 1,
0.8065073, -0.2601253, 2.503011, 0.6901961, 0, 1, 1,
0.8074955, -0.3790373, 1.559023, 0.6980392, 0, 1, 1,
0.8166298, -1.253542, 2.930254, 0.7058824, 0, 1, 1,
0.8198238, 0.6184761, 1.316254, 0.7098039, 0, 1, 1,
0.8254189, -0.1465918, 2.012429, 0.7176471, 0, 1, 1,
0.8314149, 0.2446424, 2.044594, 0.7215686, 0, 1, 1,
0.8358628, -0.3373463, 2.957351, 0.7294118, 0, 1, 1,
0.839724, 0.9548083, 2.411529, 0.7333333, 0, 1, 1,
0.8450208, 0.1656191, 2.295582, 0.7411765, 0, 1, 1,
0.8496051, 1.702042, 0.189179, 0.7450981, 0, 1, 1,
0.8526731, -1.209201, 3.248802, 0.7529412, 0, 1, 1,
0.8594002, 0.2401196, 3.535123, 0.7568628, 0, 1, 1,
0.8636159, 0.04564721, 0.9670903, 0.7647059, 0, 1, 1,
0.8731379, 0.0659887, 1.934351, 0.7686275, 0, 1, 1,
0.8742398, -0.4598115, 4.349276, 0.7764706, 0, 1, 1,
0.8860124, 0.5628206, -0.1843149, 0.7803922, 0, 1, 1,
0.8914656, -0.8037388, 2.229478, 0.7882353, 0, 1, 1,
0.8946066, 0.6719934, -0.3169699, 0.7921569, 0, 1, 1,
0.8959568, 0.5636477, 1.491925, 0.8, 0, 1, 1,
0.9079884, -1.072707, 2.237183, 0.8078431, 0, 1, 1,
0.911856, -0.906018, 2.025946, 0.8117647, 0, 1, 1,
0.9140854, -0.4678706, 1.688231, 0.8196079, 0, 1, 1,
0.918029, 1.842977, 0.8464291, 0.8235294, 0, 1, 1,
0.926773, 0.337143, 3.295869, 0.8313726, 0, 1, 1,
0.929186, -0.1510962, 1.104646, 0.8352941, 0, 1, 1,
0.9316843, 0.9150011, 1.008758, 0.8431373, 0, 1, 1,
0.9363306, -0.5826679, 1.856212, 0.8470588, 0, 1, 1,
0.9366127, 0.07784718, 1.895292, 0.854902, 0, 1, 1,
0.936906, 0.5756103, 1.390328, 0.8588235, 0, 1, 1,
0.938493, 0.199296, 0.8110753, 0.8666667, 0, 1, 1,
0.9427653, 0.1475831, 2.670697, 0.8705882, 0, 1, 1,
0.9526544, -0.5262538, 1.544094, 0.8784314, 0, 1, 1,
0.95967, -1.239277, 2.025699, 0.8823529, 0, 1, 1,
0.9707515, -1.301087, 1.614691, 0.8901961, 0, 1, 1,
0.9747726, 1.0675, 0.5658884, 0.8941177, 0, 1, 1,
0.9767614, 0.3790096, 0.1843097, 0.9019608, 0, 1, 1,
0.9771833, -0.9376134, 1.78818, 0.9098039, 0, 1, 1,
0.9902788, 2.141536, -0.7636223, 0.9137255, 0, 1, 1,
0.9926087, 0.508606, 1.264569, 0.9215686, 0, 1, 1,
0.9935723, -1.00579, 2.647423, 0.9254902, 0, 1, 1,
0.9969833, 0.08257291, 2.322492, 0.9333333, 0, 1, 1,
0.9998918, -1.990296, 1.931552, 0.9372549, 0, 1, 1,
1.004022, 1.083377, 0.9279507, 0.945098, 0, 1, 1,
1.010062, -0.9286929, 1.804964, 0.9490196, 0, 1, 1,
1.010146, -0.8148771, 3.516872, 0.9568627, 0, 1, 1,
1.011255, 0.0279153, 0.6200653, 0.9607843, 0, 1, 1,
1.01903, 1.177797, 0.1946213, 0.9686275, 0, 1, 1,
1.032033, 0.2716497, 1.729835, 0.972549, 0, 1, 1,
1.035056, -1.727414, 6.786956, 0.9803922, 0, 1, 1,
1.03549, -0.3941256, 1.476342, 0.9843137, 0, 1, 1,
1.041623, -0.5380709, 2.958444, 0.9921569, 0, 1, 1,
1.042866, 0.9919605, -0.1267403, 0.9960784, 0, 1, 1,
1.04458, 0.8971676, -0.6591394, 1, 0, 0.9960784, 1,
1.050355, 0.1626481, 2.116669, 1, 0, 0.9882353, 1,
1.051392, -0.2973973, 2.802549, 1, 0, 0.9843137, 1,
1.059296, 1.899025, 1.174672, 1, 0, 0.9764706, 1,
1.067346, -0.4703347, 4.149737, 1, 0, 0.972549, 1,
1.072299, -0.2126392, 2.537321, 1, 0, 0.9647059, 1,
1.075289, 0.5628798, 1.973511, 1, 0, 0.9607843, 1,
1.07789, -1.29092, 3.743246, 1, 0, 0.9529412, 1,
1.077909, 0.9003881, 1.503094, 1, 0, 0.9490196, 1,
1.078199, 1.931727, 2.412075, 1, 0, 0.9411765, 1,
1.092023, 0.7726778, 0.0777042, 1, 0, 0.9372549, 1,
1.094923, -1.191462, 3.201999, 1, 0, 0.9294118, 1,
1.099104, 1.101156, 1.640227, 1, 0, 0.9254902, 1,
1.105244, 1.24949, 0.7297524, 1, 0, 0.9176471, 1,
1.1141, -0.9615007, 0.7158176, 1, 0, 0.9137255, 1,
1.114233, -0.04947703, 2.527157, 1, 0, 0.9058824, 1,
1.118895, -1.451344, 2.846407, 1, 0, 0.9019608, 1,
1.121161, -0.8538091, 2.066874, 1, 0, 0.8941177, 1,
1.133168, 2.152501, 0.09276861, 1, 0, 0.8862745, 1,
1.134022, 0.6854985, -0.04397701, 1, 0, 0.8823529, 1,
1.138224, 0.2251048, 2.894171, 1, 0, 0.8745098, 1,
1.141329, 0.1315675, 1.316882, 1, 0, 0.8705882, 1,
1.141588, 0.4928316, 0.8584778, 1, 0, 0.8627451, 1,
1.142127, 0.902823, -1.337889, 1, 0, 0.8588235, 1,
1.142885, -0.2861817, 2.06977, 1, 0, 0.8509804, 1,
1.143238, -0.2325901, 1.961739, 1, 0, 0.8470588, 1,
1.145779, 0.3724385, 1.136916, 1, 0, 0.8392157, 1,
1.14689, 0.2278486, 1.260975, 1, 0, 0.8352941, 1,
1.147894, 0.2146039, 3.522288, 1, 0, 0.827451, 1,
1.155851, 0.9053013, 0.45322, 1, 0, 0.8235294, 1,
1.157701, -1.510868, 1.479522, 1, 0, 0.8156863, 1,
1.159776, 1.538925, 0.6912928, 1, 0, 0.8117647, 1,
1.160282, 0.5634719, 0.7110695, 1, 0, 0.8039216, 1,
1.164248, 0.1178722, 1.48607, 1, 0, 0.7960784, 1,
1.166415, 0.5211942, 3.608367, 1, 0, 0.7921569, 1,
1.170792, 0.01881257, 2.622607, 1, 0, 0.7843137, 1,
1.175668, -0.844424, 2.518382, 1, 0, 0.7803922, 1,
1.176097, -0.5511767, 1.532517, 1, 0, 0.772549, 1,
1.182831, 0.942533, -0.9350833, 1, 0, 0.7686275, 1,
1.187826, 0.6432099, -0.05980745, 1, 0, 0.7607843, 1,
1.192998, 0.01363207, 1.804931, 1, 0, 0.7568628, 1,
1.196273, -0.3526057, 1.418596, 1, 0, 0.7490196, 1,
1.203153, -1.670272, 2.124964, 1, 0, 0.7450981, 1,
1.205047, -0.8366106, 1.791627, 1, 0, 0.7372549, 1,
1.206982, -0.7704311, 1.92095, 1, 0, 0.7333333, 1,
1.210967, -0.229654, 3.313322, 1, 0, 0.7254902, 1,
1.214071, 1.204657, -1.40039, 1, 0, 0.7215686, 1,
1.241196, -0.1042377, 2.70651, 1, 0, 0.7137255, 1,
1.243674, -0.3301969, 2.222281, 1, 0, 0.7098039, 1,
1.251601, -0.5116847, 1.110896, 1, 0, 0.7019608, 1,
1.252714, -1.317584, 3.233238, 1, 0, 0.6941177, 1,
1.259092, 0.3927939, 3.451011, 1, 0, 0.6901961, 1,
1.262174, 0.1077066, 2.883649, 1, 0, 0.682353, 1,
1.265702, 0.5492552, 1.7176, 1, 0, 0.6784314, 1,
1.267262, -0.9088988, 2.968858, 1, 0, 0.6705883, 1,
1.272278, 0.3076994, 3.185552, 1, 0, 0.6666667, 1,
1.272526, 0.6866249, 0.8266177, 1, 0, 0.6588235, 1,
1.284139, 0.4105382, 1.410928, 1, 0, 0.654902, 1,
1.285288, 0.1891412, 1.126754, 1, 0, 0.6470588, 1,
1.290749, 0.1664992, 1.128412, 1, 0, 0.6431373, 1,
1.292117, -0.1758022, 2.284471, 1, 0, 0.6352941, 1,
1.308187, -1.356862, 1.296891, 1, 0, 0.6313726, 1,
1.313869, 1.364319, 0.3958989, 1, 0, 0.6235294, 1,
1.316962, 0.08031718, 1.448866, 1, 0, 0.6196079, 1,
1.322869, 0.9661123, 2.073844, 1, 0, 0.6117647, 1,
1.323124, 0.01135366, 2.297704, 1, 0, 0.6078432, 1,
1.323186, -0.950943, 1.300536, 1, 0, 0.6, 1,
1.32678, -1.957201, 4.522403, 1, 0, 0.5921569, 1,
1.329952, -0.5900117, 3.054283, 1, 0, 0.5882353, 1,
1.330082, -2.461951, 1.630256, 1, 0, 0.5803922, 1,
1.334436, -0.1003201, 2.857658, 1, 0, 0.5764706, 1,
1.351769, -0.5505486, 2.709166, 1, 0, 0.5686275, 1,
1.35417, -0.6861687, 5.029603, 1, 0, 0.5647059, 1,
1.361853, -1.363249, 0.6540887, 1, 0, 0.5568628, 1,
1.363708, 1.312657, 0.7590292, 1, 0, 0.5529412, 1,
1.363894, -0.2871692, -0.4903483, 1, 0, 0.5450981, 1,
1.379259, 0.5657301, 0.9830939, 1, 0, 0.5411765, 1,
1.38082, -0.4820901, 2.534384, 1, 0, 0.5333334, 1,
1.390998, -2.140292, 1.749793, 1, 0, 0.5294118, 1,
1.408943, -0.6194251, 1.518568, 1, 0, 0.5215687, 1,
1.409678, 1.785012, -1.193415, 1, 0, 0.5176471, 1,
1.41868, 0.7576195, 2.085761, 1, 0, 0.509804, 1,
1.424778, -0.340204, 3.409728, 1, 0, 0.5058824, 1,
1.427581, -0.448381, 2.046128, 1, 0, 0.4980392, 1,
1.432939, 0.66638, 0.6881793, 1, 0, 0.4901961, 1,
1.452174, -0.7346776, 0.9645172, 1, 0, 0.4862745, 1,
1.454677, -1.450409, 2.812688, 1, 0, 0.4784314, 1,
1.461925, -0.0438926, -0.7516568, 1, 0, 0.4745098, 1,
1.46516, -0.78076, 3.261228, 1, 0, 0.4666667, 1,
1.489436, 0.4049931, 1.57933, 1, 0, 0.4627451, 1,
1.489871, 2.548007, 0.7326344, 1, 0, 0.454902, 1,
1.491153, -3.058352, 2.011597, 1, 0, 0.4509804, 1,
1.492776, -0.9364167, 2.35228, 1, 0, 0.4431373, 1,
1.494604, -0.2991408, 2.122507, 1, 0, 0.4392157, 1,
1.516436, -0.7635677, 1.913049, 1, 0, 0.4313726, 1,
1.51729, -0.418904, 1.621452, 1, 0, 0.427451, 1,
1.527239, -0.0812235, 0.7798112, 1, 0, 0.4196078, 1,
1.540577, 0.1514757, 2.69793, 1, 0, 0.4156863, 1,
1.551475, 1.430308, 0.4829002, 1, 0, 0.4078431, 1,
1.554351, 0.1627134, 0.7778509, 1, 0, 0.4039216, 1,
1.557371, 0.1173301, 0.298203, 1, 0, 0.3960784, 1,
1.570936, -0.06095086, 1.517846, 1, 0, 0.3882353, 1,
1.585135, -0.8554872, 2.199826, 1, 0, 0.3843137, 1,
1.59178, 0.4002169, -0.02580687, 1, 0, 0.3764706, 1,
1.596916, -0.9528087, 3.549669, 1, 0, 0.372549, 1,
1.598525, -0.6880387, 1.926016, 1, 0, 0.3647059, 1,
1.650475, 2.121301, 1.149608, 1, 0, 0.3607843, 1,
1.665421, -0.5611147, 1.74636, 1, 0, 0.3529412, 1,
1.665744, 1.378625, 0.3955826, 1, 0, 0.3490196, 1,
1.671781, 1.638041, -1.091553, 1, 0, 0.3411765, 1,
1.685264, -0.1419832, 1.974556, 1, 0, 0.3372549, 1,
1.693672, -1.373642, 2.242118, 1, 0, 0.3294118, 1,
1.696513, -1.635956, 0.9731395, 1, 0, 0.3254902, 1,
1.700817, 1.145973, 1.985242, 1, 0, 0.3176471, 1,
1.725807, -0.03449554, 0.3237394, 1, 0, 0.3137255, 1,
1.734677, 0.3499575, 2.354178, 1, 0, 0.3058824, 1,
1.744322, 0.03630285, 2.548691, 1, 0, 0.2980392, 1,
1.749382, 0.4235468, 0.6947344, 1, 0, 0.2941177, 1,
1.770844, 1.370735, 1.527458, 1, 0, 0.2862745, 1,
1.778141, -0.8282716, 0.5704498, 1, 0, 0.282353, 1,
1.808513, -0.3427376, 1.670454, 1, 0, 0.2745098, 1,
1.810897, -0.0495556, 2.289664, 1, 0, 0.2705882, 1,
1.823871, -0.9956607, 1.802215, 1, 0, 0.2627451, 1,
1.824957, 1.316854, 0.2000061, 1, 0, 0.2588235, 1,
1.832741, 0.7990662, 0.3063066, 1, 0, 0.2509804, 1,
1.842113, -1.435509, 3.172808, 1, 0, 0.2470588, 1,
1.84959, -0.3520984, 0.6331402, 1, 0, 0.2392157, 1,
1.857687, -0.4062325, 1.668911, 1, 0, 0.2352941, 1,
1.866594, 1.019815, 1.666226, 1, 0, 0.227451, 1,
1.868351, 0.87585, 0.3122406, 1, 0, 0.2235294, 1,
1.86837, -0.6095052, 2.223622, 1, 0, 0.2156863, 1,
1.874675, 2.131979, -0.07374471, 1, 0, 0.2117647, 1,
1.882286, -0.8771355, 0.2959478, 1, 0, 0.2039216, 1,
1.941874, -1.204901, 1.207662, 1, 0, 0.1960784, 1,
1.974712, 0.4307136, 0.2040263, 1, 0, 0.1921569, 1,
1.980779, 0.4734408, 1.997514, 1, 0, 0.1843137, 1,
2.038116, 0.4058027, 2.812948, 1, 0, 0.1803922, 1,
2.042382, -1.376765, 0.725373, 1, 0, 0.172549, 1,
2.045806, -0.3529277, 1.410198, 1, 0, 0.1686275, 1,
2.053555, 1.124079, 0.2302081, 1, 0, 0.1607843, 1,
2.062093, 1.098648, -0.03059931, 1, 0, 0.1568628, 1,
2.066223, 0.2974091, 1.377972, 1, 0, 0.1490196, 1,
2.073575, -1.88289, 2.474255, 1, 0, 0.145098, 1,
2.075449, 2.003097, 1.147968, 1, 0, 0.1372549, 1,
2.092355, -2.508536, 3.811657, 1, 0, 0.1333333, 1,
2.102091, 0.9533886, -0.1935378, 1, 0, 0.1254902, 1,
2.129458, 0.8758685, 1.485697, 1, 0, 0.1215686, 1,
2.140187, -0.1178741, 1.700127, 1, 0, 0.1137255, 1,
2.17414, 1.212909, -0.6397719, 1, 0, 0.1098039, 1,
2.184614, 0.07104303, 1.950282, 1, 0, 0.1019608, 1,
2.194713, 0.9827387, 0.2883818, 1, 0, 0.09411765, 1,
2.267409, 0.568261, 2.638566, 1, 0, 0.09019608, 1,
2.274416, 1.247597, 2.19985, 1, 0, 0.08235294, 1,
2.283509, 0.5758503, 1.280023, 1, 0, 0.07843138, 1,
2.30235, 1.168594, 1.819879, 1, 0, 0.07058824, 1,
2.305661, -1.948931, 3.340436, 1, 0, 0.06666667, 1,
2.377843, 0.5280857, 0.954239, 1, 0, 0.05882353, 1,
2.477553, 2.498681, 0.9876828, 1, 0, 0.05490196, 1,
2.520722, -0.6888687, 2.202469, 1, 0, 0.04705882, 1,
2.530098, 0.3568841, 1.081866, 1, 0, 0.04313726, 1,
2.541562, -1.997988, 2.35257, 1, 0, 0.03529412, 1,
2.547818, -0.6749952, 2.743601, 1, 0, 0.03137255, 1,
2.547991, 1.795558, -0.1467303, 1, 0, 0.02352941, 1,
2.556655, 0.0285109, 1.693456, 1, 0, 0.01960784, 1,
2.600662, -0.2759225, 1.401228, 1, 0, 0.01176471, 1,
2.643835, 1.474101, 2.875065, 1, 0, 0.007843138, 1
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
-0.4170873, -4.150506, -8.335658, 0, -0.5, 0.5, 0.5,
-0.4170873, -4.150506, -8.335658, 1, -0.5, 0.5, 0.5,
-0.4170873, -4.150506, -8.335658, 1, 1.5, 0.5, 0.5,
-0.4170873, -4.150506, -8.335658, 0, 1.5, 0.5, 0.5
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
-4.515663, 0.03510165, -8.335658, 0, -0.5, 0.5, 0.5,
-4.515663, 0.03510165, -8.335658, 1, -0.5, 0.5, 0.5,
-4.515663, 0.03510165, -8.335658, 1, 1.5, 0.5, 0.5,
-4.515663, 0.03510165, -8.335658, 0, 1.5, 0.5, 0.5
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
-4.515663, -4.150506, 0.3215377, 0, -0.5, 0.5, 0.5,
-4.515663, -4.150506, 0.3215377, 1, -0.5, 0.5, 0.5,
-4.515663, -4.150506, 0.3215377, 1, 1.5, 0.5, 0.5,
-4.515663, -4.150506, 0.3215377, 0, 1.5, 0.5, 0.5
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
-3, -3.184596, -6.337843,
2, -3.184596, -6.337843,
-3, -3.184596, -6.337843,
-3, -3.345581, -6.670813,
-2, -3.184596, -6.337843,
-2, -3.345581, -6.670813,
-1, -3.184596, -6.337843,
-1, -3.345581, -6.670813,
0, -3.184596, -6.337843,
0, -3.345581, -6.670813,
1, -3.184596, -6.337843,
1, -3.345581, -6.670813,
2, -3.184596, -6.337843,
2, -3.345581, -6.670813
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
-3, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
-3, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
-3, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
-3, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5,
-2, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
-2, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
-2, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
-2, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5,
-1, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
-1, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
-1, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
-1, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5,
0, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
0, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
0, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
0, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5,
1, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
1, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
1, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
1, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5,
2, -3.667551, -7.336751, 0, -0.5, 0.5, 0.5,
2, -3.667551, -7.336751, 1, -0.5, 0.5, 0.5,
2, -3.667551, -7.336751, 1, 1.5, 0.5, 0.5,
2, -3.667551, -7.336751, 0, 1.5, 0.5, 0.5
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
-3.569838, -3, -6.337843,
-3.569838, 3, -6.337843,
-3.569838, -3, -6.337843,
-3.727475, -3, -6.670813,
-3.569838, -2, -6.337843,
-3.727475, -2, -6.670813,
-3.569838, -1, -6.337843,
-3.727475, -1, -6.670813,
-3.569838, 0, -6.337843,
-3.727475, 0, -6.670813,
-3.569838, 1, -6.337843,
-3.727475, 1, -6.670813,
-3.569838, 2, -6.337843,
-3.727475, 2, -6.670813,
-3.569838, 3, -6.337843,
-3.727475, 3, -6.670813
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
-4.04275, -3, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, -3, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, -3, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, -3, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, -2, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, -2, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, -2, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, -2, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, -1, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, -1, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, -1, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, -1, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, 0, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, 0, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, 0, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, 0, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, 1, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, 1, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, 1, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, 1, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, 2, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, 2, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, 2, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, 2, -7.336751, 0, 1.5, 0.5, 0.5,
-4.04275, 3, -7.336751, 0, -0.5, 0.5, 0.5,
-4.04275, 3, -7.336751, 1, -0.5, 0.5, 0.5,
-4.04275, 3, -7.336751, 1, 1.5, 0.5, 0.5,
-4.04275, 3, -7.336751, 0, 1.5, 0.5, 0.5
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
-3.569838, -3.184596, -6,
-3.569838, -3.184596, 6,
-3.569838, -3.184596, -6,
-3.727475, -3.345581, -6,
-3.569838, -3.184596, -4,
-3.727475, -3.345581, -4,
-3.569838, -3.184596, -2,
-3.727475, -3.345581, -2,
-3.569838, -3.184596, 0,
-3.727475, -3.345581, 0,
-3.569838, -3.184596, 2,
-3.727475, -3.345581, 2,
-3.569838, -3.184596, 4,
-3.727475, -3.345581, 4,
-3.569838, -3.184596, 6,
-3.727475, -3.345581, 6
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
-4.04275, -3.667551, -6, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -6, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -6, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, -6, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, -4, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -4, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -4, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, -4, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, -2, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -2, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, -2, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, -2, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 0, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 0, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 0, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 0, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 2, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 2, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 2, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 2, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 4, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 4, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 4, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 4, 0, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 6, 0, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 6, 1, -0.5, 0.5, 0.5,
-4.04275, -3.667551, 6, 1, 1.5, 0.5, 0.5,
-4.04275, -3.667551, 6, 0, 1.5, 0.5, 0.5
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
-3.569838, -3.184596, -6.337843,
-3.569838, 3.254799, -6.337843,
-3.569838, -3.184596, 6.980919,
-3.569838, 3.254799, 6.980919,
-3.569838, -3.184596, -6.337843,
-3.569838, -3.184596, 6.980919,
-3.569838, 3.254799, -6.337843,
-3.569838, 3.254799, 6.980919,
-3.569838, -3.184596, -6.337843,
2.735663, -3.184596, -6.337843,
-3.569838, -3.184596, 6.980919,
2.735663, -3.184596, 6.980919,
-3.569838, 3.254799, -6.337843,
2.735663, 3.254799, -6.337843,
-3.569838, 3.254799, 6.980919,
2.735663, 3.254799, 6.980919,
2.735663, -3.184596, -6.337843,
2.735663, 3.254799, -6.337843,
2.735663, -3.184596, 6.980919,
2.735663, 3.254799, 6.980919,
2.735663, -3.184596, -6.337843,
2.735663, -3.184596, 6.980919,
2.735663, 3.254799, -6.337843,
2.735663, 3.254799, 6.980919
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
var radius = 8.587208;
var distance = 38.20546;
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
mvMatrix.translate( 0.4170873, -0.03510165, -0.3215377 );
mvMatrix.scale( 1.472469, 1.441852, 0.6971111 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.20546);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
terallethrin<-read.table("terallethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
y<-terallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
```

```r
z<-terallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'terallethrin' not found
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
-3.47801, 0.6048367, -1.34809, 0, 0, 1, 1, 1,
-3.155244, -1.12322, -2.594721, 1, 0, 0, 1, 1,
-3.017022, -1.73988, -0.9187139, 1, 0, 0, 1, 1,
-2.82754, -0.9835266, -3.046128, 1, 0, 0, 1, 1,
-2.792836, -0.4006844, -1.678126, 1, 0, 0, 1, 1,
-2.723432, -1.851008, -1.912308, 1, 0, 0, 1, 1,
-2.654912, 0.2948171, -0.8882294, 0, 0, 0, 1, 1,
-2.638798, 0.4538739, -1.70778, 0, 0, 0, 1, 1,
-2.509973, 0.09519122, -2.249598, 0, 0, 0, 1, 1,
-2.478458, -0.3932776, -1.469756, 0, 0, 0, 1, 1,
-2.397726, 1.169068, -0.3490358, 0, 0, 0, 1, 1,
-2.379851, 0.3350669, 0.2395782, 0, 0, 0, 1, 1,
-2.321778, 0.8880717, -0.6934507, 0, 0, 0, 1, 1,
-2.303447, -1.230823, -2.244465, 1, 1, 1, 1, 1,
-2.296933, -0.7341085, -2.143121, 1, 1, 1, 1, 1,
-2.287525, -0.4923393, 1.330973, 1, 1, 1, 1, 1,
-2.269085, 2.7513, -1.655636, 1, 1, 1, 1, 1,
-2.225608, 1.03818, -1.623214, 1, 1, 1, 1, 1,
-2.216979, 0.359513, -2.712027, 1, 1, 1, 1, 1,
-2.171782, 0.2183515, -1.841162, 1, 1, 1, 1, 1,
-2.155819, 1.600166, -0.4781475, 1, 1, 1, 1, 1,
-2.153086, 0.9310629, -1.81062, 1, 1, 1, 1, 1,
-2.117926, 0.2576059, -2.329226, 1, 1, 1, 1, 1,
-2.093534, 1.069274, -1.223278, 1, 1, 1, 1, 1,
-2.086531, 0.1710861, -1.027789, 1, 1, 1, 1, 1,
-2.068585, 1.452914, -2.144114, 1, 1, 1, 1, 1,
-2.027727, -2.638754, -1.21681, 1, 1, 1, 1, 1,
-2.011633, -0.1290812, -0.4694745, 1, 1, 1, 1, 1,
-2.006017, 0.1604729, -2.770912, 0, 0, 1, 1, 1,
-1.998634, 1.24017, -1.538564, 1, 0, 0, 1, 1,
-1.961178, 1.133246, -0.3570513, 1, 0, 0, 1, 1,
-1.929467, 1.696941, -0.2178498, 1, 0, 0, 1, 1,
-1.924771, 0.07341139, -2.285333, 1, 0, 0, 1, 1,
-1.919673, 0.2513801, -2.049513, 1, 0, 0, 1, 1,
-1.872176, -0.932561, -2.582383, 0, 0, 0, 1, 1,
-1.841573, -0.6073771, -2.685727, 0, 0, 0, 1, 1,
-1.840048, -1.276133, -4.13947, 0, 0, 0, 1, 1,
-1.83111, 0.01624361, -1.872921, 0, 0, 0, 1, 1,
-1.81789, 0.7492949, -0.5020199, 0, 0, 0, 1, 1,
-1.75896, -0.7320343, -1.901126, 0, 0, 0, 1, 1,
-1.751113, -1.124485, -2.257378, 0, 0, 0, 1, 1,
-1.748113, -0.1834717, -0.1890986, 1, 1, 1, 1, 1,
-1.738621, -0.4350267, -3.241709, 1, 1, 1, 1, 1,
-1.724406, 1.42801, -1.286373, 1, 1, 1, 1, 1,
-1.717839, -1.504557, -1.317415, 1, 1, 1, 1, 1,
-1.710384, 0.1921526, -3.480279, 1, 1, 1, 1, 1,
-1.705507, -0.5277987, -1.26625, 1, 1, 1, 1, 1,
-1.704676, 0.6755065, -1.534789, 1, 1, 1, 1, 1,
-1.690904, 1.105888, 1.854239, 1, 1, 1, 1, 1,
-1.688085, 0.4726087, -0.6195431, 1, 1, 1, 1, 1,
-1.671359, -1.199609, -1.882752, 1, 1, 1, 1, 1,
-1.662347, 0.1228908, -1.949488, 1, 1, 1, 1, 1,
-1.646354, 1.969995, -0.4539052, 1, 1, 1, 1, 1,
-1.645284, -1.498244, -3.018149, 1, 1, 1, 1, 1,
-1.643236, -0.5700769, -3.167063, 1, 1, 1, 1, 1,
-1.63823, -0.6630321, -2.550652, 1, 1, 1, 1, 1,
-1.628517, -0.1275229, -0.9111174, 0, 0, 1, 1, 1,
-1.627813, 0.01424206, -0.9996266, 1, 0, 0, 1, 1,
-1.599363, -1.351642, -3.562539, 1, 0, 0, 1, 1,
-1.595338, -0.5565491, -0.09337061, 1, 0, 0, 1, 1,
-1.580421, -0.1511674, -0.4567896, 1, 0, 0, 1, 1,
-1.571934, -1.079355, -2.398089, 1, 0, 0, 1, 1,
-1.567927, 1.550218, -0.5347402, 0, 0, 0, 1, 1,
-1.560592, -0.8410609, -1.829459, 0, 0, 0, 1, 1,
-1.55305, -0.864024, -1.468179, 0, 0, 0, 1, 1,
-1.546198, 0.5977009, -1.15276, 0, 0, 0, 1, 1,
-1.544451, -0.9893391, -2.774559, 0, 0, 0, 1, 1,
-1.542119, 0.3620728, -2.075091, 0, 0, 0, 1, 1,
-1.540556, -0.1085359, -1.585993, 0, 0, 0, 1, 1,
-1.540363, -1.429013, -0.2480162, 1, 1, 1, 1, 1,
-1.539597, 1.001959, 1.009313, 1, 1, 1, 1, 1,
-1.536266, -0.4159454, -2.435118, 1, 1, 1, 1, 1,
-1.535326, -0.909002, -1.290107, 1, 1, 1, 1, 1,
-1.530126, -1.632128, -3.127444, 1, 1, 1, 1, 1,
-1.529968, -0.1285771, -2.324483, 1, 1, 1, 1, 1,
-1.517565, -1.563805, -1.150506, 1, 1, 1, 1, 1,
-1.514814, 0.9671844, -2.703403, 1, 1, 1, 1, 1,
-1.505113, 1.071336, -1.073525, 1, 1, 1, 1, 1,
-1.500249, 0.7268173, -0.06687967, 1, 1, 1, 1, 1,
-1.49343, -1.363958, -1.742763, 1, 1, 1, 1, 1,
-1.484896, 1.017151, -1.424688, 1, 1, 1, 1, 1,
-1.481441, -0.01554728, -0.1236502, 1, 1, 1, 1, 1,
-1.47385, 1.153904, 0.145387, 1, 1, 1, 1, 1,
-1.467252, -0.3023247, -0.8384233, 1, 1, 1, 1, 1,
-1.459054, -0.8466926, -1.676534, 0, 0, 1, 1, 1,
-1.429203, 0.02414351, -1.604544, 1, 0, 0, 1, 1,
-1.427429, 1.580076, -2.990148, 1, 0, 0, 1, 1,
-1.419994, 0.7610561, -1.541816, 1, 0, 0, 1, 1,
-1.402228, 1.274447, -0.5629937, 1, 0, 0, 1, 1,
-1.400763, 1.915165, 0.1364961, 1, 0, 0, 1, 1,
-1.40039, 0.3494232, -1.034714, 0, 0, 0, 1, 1,
-1.398679, -0.3520184, -1.518264, 0, 0, 0, 1, 1,
-1.383892, 0.7229545, -1.218562, 0, 0, 0, 1, 1,
-1.378011, -0.3940533, -3.577582, 0, 0, 0, 1, 1,
-1.366102, -0.6632305, -2.49563, 0, 0, 0, 1, 1,
-1.358716, -0.1742297, -1.742736, 0, 0, 0, 1, 1,
-1.358297, -0.2217731, -0.08559835, 0, 0, 0, 1, 1,
-1.357264, -1.415862, -3.679087, 1, 1, 1, 1, 1,
-1.355145, -1.633569, -2.406993, 1, 1, 1, 1, 1,
-1.348903, 0.2450077, -0.8994693, 1, 1, 1, 1, 1,
-1.334301, -1.358858, -3.390371, 1, 1, 1, 1, 1,
-1.32842, 0.2643015, -0.2393785, 1, 1, 1, 1, 1,
-1.327865, -0.460489, -1.973341, 1, 1, 1, 1, 1,
-1.327278, -0.3689909, -3.222904, 1, 1, 1, 1, 1,
-1.311555, -1.402516, -1.506968, 1, 1, 1, 1, 1,
-1.308735, 0.5215846, -1.538719, 1, 1, 1, 1, 1,
-1.308524, -0.1900381, -1.26942, 1, 1, 1, 1, 1,
-1.307305, -0.6119359, -1.988435, 1, 1, 1, 1, 1,
-1.306804, 1.25775, -1.737603, 1, 1, 1, 1, 1,
-1.30373, -0.6504935, -1.849745, 1, 1, 1, 1, 1,
-1.291644, -0.3348354, -1.073812, 1, 1, 1, 1, 1,
-1.282399, 0.9447129, -1.535237, 1, 1, 1, 1, 1,
-1.280009, -0.5845714, -1.307848, 0, 0, 1, 1, 1,
-1.278402, 1.159047, -1.786924, 1, 0, 0, 1, 1,
-1.272177, 0.8861846, 0.5662761, 1, 0, 0, 1, 1,
-1.269608, 0.4267917, -0.06369295, 1, 0, 0, 1, 1,
-1.267062, 1.412269, 1.441738, 1, 0, 0, 1, 1,
-1.266105, 1.259877, 1.323641, 1, 0, 0, 1, 1,
-1.263486, 0.00324949, -1.841443, 0, 0, 0, 1, 1,
-1.257087, 0.6421139, -3.590238, 0, 0, 0, 1, 1,
-1.254765, -0.6789765, -2.700641, 0, 0, 0, 1, 1,
-1.253226, -0.6294682, 0.2086287, 0, 0, 0, 1, 1,
-1.252394, -1.016311, -3.648142, 0, 0, 0, 1, 1,
-1.25232, 0.7862219, -2.454149, 0, 0, 0, 1, 1,
-1.245875, 0.6205952, -1.91555, 0, 0, 0, 1, 1,
-1.241726, 1.194557, -0.1441602, 1, 1, 1, 1, 1,
-1.233587, 0.1805242, 0.05497986, 1, 1, 1, 1, 1,
-1.228205, -0.6657379, -0.1570641, 1, 1, 1, 1, 1,
-1.225869, 0.1403078, -0.9425947, 1, 1, 1, 1, 1,
-1.222197, 0.9356209, -1.136375, 1, 1, 1, 1, 1,
-1.213481, -0.5172598, -1.617345, 1, 1, 1, 1, 1,
-1.20888, -0.3884408, -2.505645, 1, 1, 1, 1, 1,
-1.208853, -1.508112, -3.283491, 1, 1, 1, 1, 1,
-1.207558, 0.142175, -0.9081703, 1, 1, 1, 1, 1,
-1.205879, 0.2265369, -1.345982, 1, 1, 1, 1, 1,
-1.204911, 2.929585, -1.384579, 1, 1, 1, 1, 1,
-1.197471, -0.4292271, -3.128295, 1, 1, 1, 1, 1,
-1.197349, -0.1321256, -1.495193, 1, 1, 1, 1, 1,
-1.195372, 1.377388, -0.08536097, 1, 1, 1, 1, 1,
-1.180229, 1.122807, -0.3758684, 1, 1, 1, 1, 1,
-1.17829, 2.290048, 0.1404284, 0, 0, 1, 1, 1,
-1.1775, -0.8369722, -1.847519, 1, 0, 0, 1, 1,
-1.162245, 0.5654709, -0.9379377, 1, 0, 0, 1, 1,
-1.151145, 1.755632, -0.05026556, 1, 0, 0, 1, 1,
-1.148904, -0.6769541, -1.777556, 1, 0, 0, 1, 1,
-1.148328, -0.4941566, -1.898566, 1, 0, 0, 1, 1,
-1.146587, -0.05756346, -2.415214, 0, 0, 0, 1, 1,
-1.139948, -0.9004148, -2.280577, 0, 0, 0, 1, 1,
-1.135693, 0.7503695, -0.9312817, 0, 0, 0, 1, 1,
-1.12809, 0.3413746, -0.5510243, 0, 0, 0, 1, 1,
-1.127037, -0.3112158, -2.041288, 0, 0, 0, 1, 1,
-1.126933, -0.1531214, -0.9558446, 0, 0, 0, 1, 1,
-1.126742, -0.5824535, -2.751339, 0, 0, 0, 1, 1,
-1.121812, -0.1897951, -3.256302, 1, 1, 1, 1, 1,
-1.121767, -0.2814197, -0.8786895, 1, 1, 1, 1, 1,
-1.120648, -0.3495805, -2.196165, 1, 1, 1, 1, 1,
-1.117393, -0.7304, -2.835198, 1, 1, 1, 1, 1,
-1.112385, -0.5155101, -2.992819, 1, 1, 1, 1, 1,
-1.110165, -1.6764, -1.084173, 1, 1, 1, 1, 1,
-1.103367, -1.834589, -1.239004, 1, 1, 1, 1, 1,
-1.100696, -1.065579, -1.520418, 1, 1, 1, 1, 1,
-1.09933, 0.2937583, -0.5371822, 1, 1, 1, 1, 1,
-1.087504, -0.3103324, -2.414259, 1, 1, 1, 1, 1,
-1.076267, 0.1546075, -2.315189, 1, 1, 1, 1, 1,
-1.057303, 0.6357691, -0.1906981, 1, 1, 1, 1, 1,
-1.0572, 1.302603, -1.270238, 1, 1, 1, 1, 1,
-1.055757, -0.3054019, -2.691511, 1, 1, 1, 1, 1,
-1.055247, -0.9555395, -0.7313991, 1, 1, 1, 1, 1,
-1.053183, -0.2081826, -2.724477, 0, 0, 1, 1, 1,
-1.051606, 1.419624, -1.280565, 1, 0, 0, 1, 1,
-1.035132, 0.5501148, -0.288805, 1, 0, 0, 1, 1,
-1.027336, -1.402955, -2.337144, 1, 0, 0, 1, 1,
-1.023681, -0.7545531, -2.563987, 1, 0, 0, 1, 1,
-1.017347, -0.5900735, -3.073303, 1, 0, 0, 1, 1,
-1.01496, -1.728895, -1.765309, 0, 0, 0, 1, 1,
-1.003615, 2.12113, -1.510452, 0, 0, 0, 1, 1,
-1.001009, -0.1103088, -1.013838, 0, 0, 0, 1, 1,
-0.9963443, -1.165089, -1.602254, 0, 0, 0, 1, 1,
-0.9961933, -0.1538244, -0.9191577, 0, 0, 0, 1, 1,
-0.9926905, -0.6920201, -0.08162483, 0, 0, 0, 1, 1,
-0.9873314, 0.001870548, -1.306692, 0, 0, 0, 1, 1,
-0.9868672, 0.6201128, -3.368511, 1, 1, 1, 1, 1,
-0.978659, -0.5851741, -0.5214584, 1, 1, 1, 1, 1,
-0.9742538, -0.5002312, -1.528924, 1, 1, 1, 1, 1,
-0.9709243, 0.5527452, -0.556793, 1, 1, 1, 1, 1,
-0.9705073, 2.502958, 1.992109, 1, 1, 1, 1, 1,
-0.9657636, -1.189327, -3.058166, 1, 1, 1, 1, 1,
-0.9654075, 0.5151758, -1.598904, 1, 1, 1, 1, 1,
-0.9639456, -0.1039623, -2.403539, 1, 1, 1, 1, 1,
-0.9624138, 1.068667, 0.2612157, 1, 1, 1, 1, 1,
-0.9620013, -0.6712137, -2.591402, 1, 1, 1, 1, 1,
-0.9609604, 0.3566549, -1.027583, 1, 1, 1, 1, 1,
-0.9589054, 0.9200466, -0.8001431, 1, 1, 1, 1, 1,
-0.9528447, -1.030332, -1.463884, 1, 1, 1, 1, 1,
-0.952444, -0.03430264, -0.1033594, 1, 1, 1, 1, 1,
-0.952043, -1.858181, -1.53383, 1, 1, 1, 1, 1,
-0.9456534, 0.1616294, -1.220243, 0, 0, 1, 1, 1,
-0.9385134, 0.09399203, -0.5019746, 1, 0, 0, 1, 1,
-0.9382971, -0.9752152, -0.5066441, 1, 0, 0, 1, 1,
-0.9362265, -1.85104, -1.434914, 1, 0, 0, 1, 1,
-0.932276, 0.8316758, -0.5516394, 1, 0, 0, 1, 1,
-0.9130316, 1.782901, -0.8820069, 1, 0, 0, 1, 1,
-0.9006361, 2.391238, -1.26897, 0, 0, 0, 1, 1,
-0.9000866, 0.4205151, -2.523422, 0, 0, 0, 1, 1,
-0.8990277, 0.4625147, 0.7378638, 0, 0, 0, 1, 1,
-0.8648369, -1.261512, -0.7421087, 0, 0, 0, 1, 1,
-0.8615369, 0.6241704, -1.524842, 0, 0, 0, 1, 1,
-0.861385, -0.07374971, -1.159866, 0, 0, 0, 1, 1,
-0.8607253, -0.2871769, -3.675963, 0, 0, 0, 1, 1,
-0.8594946, -0.8172423, -3.337339, 1, 1, 1, 1, 1,
-0.8577809, 0.3515091, -2.883718, 1, 1, 1, 1, 1,
-0.8551898, 0.09276398, -1.484233, 1, 1, 1, 1, 1,
-0.8506936, 0.3057151, -1.388085, 1, 1, 1, 1, 1,
-0.8506389, -0.8692023, -3.261027, 1, 1, 1, 1, 1,
-0.8500428, 0.9809609, -1.682217, 1, 1, 1, 1, 1,
-0.8441197, 1.401065, -1.427437, 1, 1, 1, 1, 1,
-0.8424105, 0.7505077, 0.272531, 1, 1, 1, 1, 1,
-0.8387238, -1.177759, -2.639377, 1, 1, 1, 1, 1,
-0.8288584, -0.1612416, -2.0925, 1, 1, 1, 1, 1,
-0.8239868, 0.3749494, -0.464644, 1, 1, 1, 1, 1,
-0.8216522, 0.412554, -1.266795, 1, 1, 1, 1, 1,
-0.8215696, 0.6670788, -1.975725, 1, 1, 1, 1, 1,
-0.8164411, -0.9522102, -1.589849, 1, 1, 1, 1, 1,
-0.8143361, -0.1322128, -1.467779, 1, 1, 1, 1, 1,
-0.8137941, -1.060261, -1.724549, 0, 0, 1, 1, 1,
-0.810308, -0.9817111, -2.448519, 1, 0, 0, 1, 1,
-0.8086578, 1.025039, -0.6288639, 1, 0, 0, 1, 1,
-0.8054201, -0.5791649, -1.712104, 1, 0, 0, 1, 1,
-0.8024154, -1.01635, -4.645606, 1, 0, 0, 1, 1,
-0.7980503, -0.6203665, -1.979154, 1, 0, 0, 1, 1,
-0.7973121, 0.6824898, -0.3853391, 0, 0, 0, 1, 1,
-0.7942928, 1.117074, -1.810476, 0, 0, 0, 1, 1,
-0.7936555, 0.5266835, -1.858601, 0, 0, 0, 1, 1,
-0.7895434, -0.7182677, -2.60243, 0, 0, 0, 1, 1,
-0.7869491, 0.186487, -2.361098, 0, 0, 0, 1, 1,
-0.7803288, 2.217828, -0.05482657, 0, 0, 0, 1, 1,
-0.7767237, -0.6491498, -0.5561485, 0, 0, 0, 1, 1,
-0.7714844, -0.3273981, -2.410169, 1, 1, 1, 1, 1,
-0.7713299, -0.706614, -2.626463, 1, 1, 1, 1, 1,
-0.7696505, -0.3040897, -2.993134, 1, 1, 1, 1, 1,
-0.7694979, -0.731057, -3.79425, 1, 1, 1, 1, 1,
-0.7692502, -0.8452774, -2.297168, 1, 1, 1, 1, 1,
-0.7688859, 2.060522, -1.003393, 1, 1, 1, 1, 1,
-0.7659041, 1.577836, -0.5463282, 1, 1, 1, 1, 1,
-0.760819, -1.470932, -2.226875, 1, 1, 1, 1, 1,
-0.7603095, 1.199302, -0.7513217, 1, 1, 1, 1, 1,
-0.7597058, -0.08620513, -2.33203, 1, 1, 1, 1, 1,
-0.7555428, -0.09198819, -2.143535, 1, 1, 1, 1, 1,
-0.7541362, -0.196445, -1.828082, 1, 1, 1, 1, 1,
-0.7484158, 0.4990321, -0.497255, 1, 1, 1, 1, 1,
-0.748412, -1.062654, -3.26883, 1, 1, 1, 1, 1,
-0.7451048, 0.5321828, -1.169625, 1, 1, 1, 1, 1,
-0.7377005, 0.5137152, 0.4593679, 0, 0, 1, 1, 1,
-0.7363191, -0.9381759, -2.900221, 1, 0, 0, 1, 1,
-0.7316762, -2.221761, -2.922293, 1, 0, 0, 1, 1,
-0.7306862, 0.579191, -1.554281, 1, 0, 0, 1, 1,
-0.724774, 1.069179, -0.791513, 1, 0, 0, 1, 1,
-0.7232967, 0.8088277, -0.4642789, 1, 0, 0, 1, 1,
-0.7221832, 0.7956941, -0.7258475, 0, 0, 0, 1, 1,
-0.7168249, -1.633973, -2.678877, 0, 0, 0, 1, 1,
-0.7135797, 0.3985477, -1.155969, 0, 0, 0, 1, 1,
-0.7124788, -0.4626968, -2.057295, 0, 0, 0, 1, 1,
-0.7101111, -2.329038, -1.575424, 0, 0, 0, 1, 1,
-0.7091461, 0.2339891, -1.593437, 0, 0, 0, 1, 1,
-0.7089922, -1.027693, -3.611978, 0, 0, 0, 1, 1,
-0.7076429, 0.4494017, -0.4214925, 1, 1, 1, 1, 1,
-0.7050321, 0.309711, 0.05695903, 1, 1, 1, 1, 1,
-0.7047675, 0.4848344, -0.5021291, 1, 1, 1, 1, 1,
-0.702249, 0.309465, 0.6018959, 1, 1, 1, 1, 1,
-0.6997826, 2.137249, -1.083004, 1, 1, 1, 1, 1,
-0.6985838, 0.1552089, -1.378663, 1, 1, 1, 1, 1,
-0.697019, -0.403617, -1.430728, 1, 1, 1, 1, 1,
-0.694827, -1.915853, -2.604999, 1, 1, 1, 1, 1,
-0.6892315, 0.6226183, -2.081294, 1, 1, 1, 1, 1,
-0.6784433, -1.848072, -3.02245, 1, 1, 1, 1, 1,
-0.6769263, 1.373908, -0.4855281, 1, 1, 1, 1, 1,
-0.6739215, 0.4888623, -1.111855, 1, 1, 1, 1, 1,
-0.6719832, 0.413846, -0.8906417, 1, 1, 1, 1, 1,
-0.6719704, 0.9789419, -0.5079948, 1, 1, 1, 1, 1,
-0.6708897, -1.280999, -2.446416, 1, 1, 1, 1, 1,
-0.6502658, -0.4796774, -2.392501, 0, 0, 1, 1, 1,
-0.6469688, -0.02859597, -1.277855, 1, 0, 0, 1, 1,
-0.6434125, 0.2165754, -0.4982904, 1, 0, 0, 1, 1,
-0.6344988, 0.09147087, -1.694159, 1, 0, 0, 1, 1,
-0.6332741, 1.366734, 0.5717641, 1, 0, 0, 1, 1,
-0.6322834, -0.8986301, -2.65174, 1, 0, 0, 1, 1,
-0.6313788, -0.05412672, -1.954185, 0, 0, 0, 1, 1,
-0.6246444, -1.065117, -1.795722, 0, 0, 0, 1, 1,
-0.6206217, -1.056493, -2.370186, 0, 0, 0, 1, 1,
-0.6148369, -1.357599, -3.825722, 0, 0, 0, 1, 1,
-0.6140769, 1.460159, -0.5155698, 0, 0, 0, 1, 1,
-0.6138055, -0.3420658, -4.439548, 0, 0, 0, 1, 1,
-0.6098652, -1.499865, -1.862864, 0, 0, 0, 1, 1,
-0.6085221, 0.8250694, -2.138587, 1, 1, 1, 1, 1,
-0.6082649, -0.7523692, -1.23919, 1, 1, 1, 1, 1,
-0.5898957, 0.2343955, -0.2821339, 1, 1, 1, 1, 1,
-0.5883561, -0.3660119, -1.433829, 1, 1, 1, 1, 1,
-0.5883141, -0.6982362, -2.983074, 1, 1, 1, 1, 1,
-0.5823486, -0.7470011, -3.184002, 1, 1, 1, 1, 1,
-0.5816154, 0.2875775, -0.6557642, 1, 1, 1, 1, 1,
-0.5793908, 1.934759, 1.391132, 1, 1, 1, 1, 1,
-0.5753009, 1.073862, -1.149185, 1, 1, 1, 1, 1,
-0.5728071, 0.5187749, -0.2005235, 1, 1, 1, 1, 1,
-0.5719347, 0.5443816, -0.8198561, 1, 1, 1, 1, 1,
-0.5694841, 0.8371273, 0.05053084, 1, 1, 1, 1, 1,
-0.5691823, 0.737583, -1.234426, 1, 1, 1, 1, 1,
-0.5684088, 1.827056, 0.3892241, 1, 1, 1, 1, 1,
-0.565669, -1.896045, -4.08809, 1, 1, 1, 1, 1,
-0.5638998, -1.884234, -2.865799, 0, 0, 1, 1, 1,
-0.5627858, -0.8200951, -2.88938, 1, 0, 0, 1, 1,
-0.5585045, -0.5072511, -2.738842, 1, 0, 0, 1, 1,
-0.5491981, 1.518543, -0.1723154, 1, 0, 0, 1, 1,
-0.5410967, 1.024152, -1.039046, 1, 0, 0, 1, 1,
-0.5396641, 0.753004, -1.628044, 1, 0, 0, 1, 1,
-0.5394282, -2.650336, -2.646415, 0, 0, 0, 1, 1,
-0.5380065, -0.9401215, -2.891263, 0, 0, 0, 1, 1,
-0.5367402, -0.8125362, -1.341267, 0, 0, 0, 1, 1,
-0.5333816, -1.320688, -2.469124, 0, 0, 0, 1, 1,
-0.5260376, -2.097552, -0.8940706, 0, 0, 0, 1, 1,
-0.5244853, 0.6194769, -2.055954, 0, 0, 0, 1, 1,
-0.5234663, -0.1882584, -4.090869, 0, 0, 0, 1, 1,
-0.5231892, -0.6417713, -2.778489, 1, 1, 1, 1, 1,
-0.5231748, -0.8953455, -1.877287, 1, 1, 1, 1, 1,
-0.517126, 1.149638, 0.4100462, 1, 1, 1, 1, 1,
-0.5095181, 0.4135246, -0.4631457, 1, 1, 1, 1, 1,
-0.501599, 1.882902, -0.2142033, 1, 1, 1, 1, 1,
-0.4993677, 0.9088057, -0.03453738, 1, 1, 1, 1, 1,
-0.4964859, 0.5487578, -0.7166841, 1, 1, 1, 1, 1,
-0.4942482, 0.2081269, -1.706353, 1, 1, 1, 1, 1,
-0.4940298, -0.1832748, -1.546467, 1, 1, 1, 1, 1,
-0.4902496, 0.745064, 1.886015, 1, 1, 1, 1, 1,
-0.4862036, 2.44082, -0.1869101, 1, 1, 1, 1, 1,
-0.4837756, 0.05147495, -2.493134, 1, 1, 1, 1, 1,
-0.4751855, -0.3048344, -0.3356597, 1, 1, 1, 1, 1,
-0.4751127, -0.7781949, -2.772229, 1, 1, 1, 1, 1,
-0.4744042, 0.7248352, -0.4113331, 1, 1, 1, 1, 1,
-0.4698856, -0.809419, -2.89377, 0, 0, 1, 1, 1,
-0.4669233, 0.3533322, -1.451804, 1, 0, 0, 1, 1,
-0.4630909, -0.7900975, -2.360277, 1, 0, 0, 1, 1,
-0.45749, -1.631466, -1.77179, 1, 0, 0, 1, 1,
-0.4563071, 0.8839079, 0.1934664, 1, 0, 0, 1, 1,
-0.4510668, -0.4689685, -1.532461, 1, 0, 0, 1, 1,
-0.4474324, 0.8568584, 0.4804267, 0, 0, 0, 1, 1,
-0.4449913, 2.520602, -0.3084459, 0, 0, 0, 1, 1,
-0.440937, -0.5440775, -1.06356, 0, 0, 0, 1, 1,
-0.4362464, 1.646685, 0.8678384, 0, 0, 0, 1, 1,
-0.4317859, -1.422653, -1.963641, 0, 0, 0, 1, 1,
-0.4304993, 0.7211711, -4.455161, 0, 0, 0, 1, 1,
-0.4278086, 0.9913076, -0.07980946, 0, 0, 0, 1, 1,
-0.4241735, 1.214778, -2.473835, 1, 1, 1, 1, 1,
-0.4223357, -0.1788931, -3.102032, 1, 1, 1, 1, 1,
-0.4192744, 0.7899365, -0.5330884, 1, 1, 1, 1, 1,
-0.4190499, 1.31105, 0.7613787, 1, 1, 1, 1, 1,
-0.4171239, -0.9205745, -2.544085, 1, 1, 1, 1, 1,
-0.4168786, -0.09684443, -1.517113, 1, 1, 1, 1, 1,
-0.4150526, 0.9724977, -2.096969, 1, 1, 1, 1, 1,
-0.4148727, -0.5933064, -3.261498, 1, 1, 1, 1, 1,
-0.4121657, -0.4812206, -4.192436, 1, 1, 1, 1, 1,
-0.4086713, 0.9150898, 0.4282819, 1, 1, 1, 1, 1,
-0.405876, -0.3827819, -1.768184, 1, 1, 1, 1, 1,
-0.4058141, -0.9770943, -3.569035, 1, 1, 1, 1, 1,
-0.4012773, -0.3593345, -0.5428128, 1, 1, 1, 1, 1,
-0.400568, 2.114708, -0.6210439, 1, 1, 1, 1, 1,
-0.3995479, 0.1782935, -1.668231, 1, 1, 1, 1, 1,
-0.3910774, 1.406867, -0.3600065, 0, 0, 1, 1, 1,
-0.3895288, 1.106325, 0.6839122, 1, 0, 0, 1, 1,
-0.3887506, 0.9551479, -0.4644624, 1, 0, 0, 1, 1,
-0.3823457, 2.108868, 1.095443, 1, 0, 0, 1, 1,
-0.376008, 0.4155686, 0.08427788, 1, 0, 0, 1, 1,
-0.3699105, -1.734466, -1.095444, 1, 0, 0, 1, 1,
-0.3696726, 1.467271, -0.1534821, 0, 0, 0, 1, 1,
-0.3603252, -0.2581237, -2.529772, 0, 0, 0, 1, 1,
-0.3561401, 0.4075117, -1.659454, 0, 0, 0, 1, 1,
-0.3542225, -0.9606294, -2.511568, 0, 0, 0, 1, 1,
-0.3515517, -1.711533, -4.032755, 0, 0, 0, 1, 1,
-0.3489572, 0.179716, -2.379001, 0, 0, 0, 1, 1,
-0.3485225, -0.4783288, -2.07742, 0, 0, 0, 1, 1,
-0.3484806, 1.331043, -1.677391, 1, 1, 1, 1, 1,
-0.3470767, 0.3202323, 0.005221491, 1, 1, 1, 1, 1,
-0.3453396, 0.7411612, -0.09568417, 1, 1, 1, 1, 1,
-0.3418507, 1.549396, 1.284831, 1, 1, 1, 1, 1,
-0.3410484, 1.588286, -0.2942597, 1, 1, 1, 1, 1,
-0.3310924, -1.115236, -2.55069, 1, 1, 1, 1, 1,
-0.3233338, -0.8433298, -2.464528, 1, 1, 1, 1, 1,
-0.3232693, 0.1895279, -1.760854, 1, 1, 1, 1, 1,
-0.3231164, -0.751319, -1.943842, 1, 1, 1, 1, 1,
-0.3203895, -0.8143879, -2.111305, 1, 1, 1, 1, 1,
-0.3196538, -0.6832657, -2.761879, 1, 1, 1, 1, 1,
-0.3090522, -3.090818, -2.759281, 1, 1, 1, 1, 1,
-0.3040776, -0.1403458, -2.601151, 1, 1, 1, 1, 1,
-0.3040475, -1.950465, -3.212436, 1, 1, 1, 1, 1,
-0.3038611, 1.184476, 0.7767196, 1, 1, 1, 1, 1,
-0.3028175, -0.2125201, -2.382377, 0, 0, 1, 1, 1,
-0.3012353, -0.795299, -3.007708, 1, 0, 0, 1, 1,
-0.2999007, 1.223633, -1.453477, 1, 0, 0, 1, 1,
-0.297456, 0.9383968, 0.02258531, 1, 0, 0, 1, 1,
-0.2925046, 0.001939179, -0.8269342, 1, 0, 0, 1, 1,
-0.2903542, 1.173787, 0.2288629, 1, 0, 0, 1, 1,
-0.2900821, -1.338688, -2.030321, 0, 0, 0, 1, 1,
-0.289883, 0.3377371, -0.8151715, 0, 0, 0, 1, 1,
-0.2734849, 0.2379071, -2.754205, 0, 0, 0, 1, 1,
-0.2732919, -0.2299048, -3.601614, 0, 0, 0, 1, 1,
-0.2722057, 0.1312477, -1.403225, 0, 0, 0, 1, 1,
-0.2708432, 0.7681999, 0.5178069, 0, 0, 0, 1, 1,
-0.2681636, -0.3482794, -1.713665, 0, 0, 0, 1, 1,
-0.266773, -0.8759951, -1.625142, 1, 1, 1, 1, 1,
-0.2639368, 3.161022, 0.6715479, 1, 1, 1, 1, 1,
-0.2620149, -0.2614937, -2.275593, 1, 1, 1, 1, 1,
-0.2590359, -0.4629519, -2.574558, 1, 1, 1, 1, 1,
-0.2575179, 0.3934062, 0.1080703, 1, 1, 1, 1, 1,
-0.2522826, 1.456501, -0.2676637, 1, 1, 1, 1, 1,
-0.2451683, -0.486557, -3.505393, 1, 1, 1, 1, 1,
-0.2409574, 1.371941, -0.7151593, 1, 1, 1, 1, 1,
-0.2379504, -1.380135, -2.825848, 1, 1, 1, 1, 1,
-0.2353922, -0.5151787, -3.227462, 1, 1, 1, 1, 1,
-0.2347784, 0.3844722, -0.5451702, 1, 1, 1, 1, 1,
-0.2347172, 1.699794, 0.02791744, 1, 1, 1, 1, 1,
-0.2346591, -0.5266378, -4.030035, 1, 1, 1, 1, 1,
-0.2342838, 0.1647666, -0.7338074, 1, 1, 1, 1, 1,
-0.232271, 1.189881, 0.4996191, 1, 1, 1, 1, 1,
-0.2317638, 0.5299504, -0.4918275, 0, 0, 1, 1, 1,
-0.2312783, 0.07240119, -0.4002778, 1, 0, 0, 1, 1,
-0.230144, 0.2785558, -0.9950127, 1, 0, 0, 1, 1,
-0.2239975, -0.4508779, -0.7416501, 1, 0, 0, 1, 1,
-0.2228566, -0.1058165, -1.094214, 1, 0, 0, 1, 1,
-0.2139236, 0.2063351, 0.6562671, 1, 0, 0, 1, 1,
-0.2102929, -0.2014683, -3.191107, 0, 0, 0, 1, 1,
-0.2087578, 0.5959995, -0.3492823, 0, 0, 0, 1, 1,
-0.2073475, 0.453277, 0.6495517, 0, 0, 0, 1, 1,
-0.2071426, -0.4758514, -3.862185, 0, 0, 0, 1, 1,
-0.2054569, 1.096466, 0.5264515, 0, 0, 0, 1, 1,
-0.205283, 0.5190831, -0.5660483, 0, 0, 0, 1, 1,
-0.2043171, -0.2864405, -2.373458, 0, 0, 0, 1, 1,
-0.2028959, 1.193311, 0.3611998, 1, 1, 1, 1, 1,
-0.2022144, -0.7839103, -2.308803, 1, 1, 1, 1, 1,
-0.2017755, 0.516687, -1.176276, 1, 1, 1, 1, 1,
-0.2007385, 1.354979, 0.1784384, 1, 1, 1, 1, 1,
-0.199595, 0.7908948, 1.440325, 1, 1, 1, 1, 1,
-0.1981341, -0.2557581, -2.778451, 1, 1, 1, 1, 1,
-0.1972353, -0.9315415, -3.513178, 1, 1, 1, 1, 1,
-0.187857, -2.236442, -2.131637, 1, 1, 1, 1, 1,
-0.1817938, 0.9566106, 0.07512036, 1, 1, 1, 1, 1,
-0.1753512, 0.2585507, -0.6845248, 1, 1, 1, 1, 1,
-0.1749646, 1.45157, 0.218375, 1, 1, 1, 1, 1,
-0.1743966, 0.8284012, 2.14113, 1, 1, 1, 1, 1,
-0.1727129, 1.393218, 0.5952657, 1, 1, 1, 1, 1,
-0.167989, -0.6057971, -3.377139, 1, 1, 1, 1, 1,
-0.1660273, 0.3875681, -1.391115, 1, 1, 1, 1, 1,
-0.1614109, 0.9899859, -0.7652625, 0, 0, 1, 1, 1,
-0.1603363, 0.8878988, -2.790433, 1, 0, 0, 1, 1,
-0.1590158, 1.043537, -0.2608283, 1, 0, 0, 1, 1,
-0.1582308, 0.2481536, 0.2481223, 1, 0, 0, 1, 1,
-0.1542967, -0.7940252, -4.667626, 1, 0, 0, 1, 1,
-0.1538129, 0.5448813, 0.4862317, 1, 0, 0, 1, 1,
-0.1520846, 1.130224, -2.373215, 0, 0, 0, 1, 1,
-0.1502347, -1.068073, -2.927623, 0, 0, 0, 1, 1,
-0.1428339, -0.574416, -3.696346, 0, 0, 0, 1, 1,
-0.1375249, -0.3415232, -1.819312, 0, 0, 0, 1, 1,
-0.1363727, 0.1142066, -1.179034, 0, 0, 0, 1, 1,
-0.1291576, 0.08298059, -3.035963, 0, 0, 0, 1, 1,
-0.1276163, -0.2210119, -1.84567, 0, 0, 0, 1, 1,
-0.1271243, -0.5338123, -1.914986, 1, 1, 1, 1, 1,
-0.124502, 0.01609174, -1.66657, 1, 1, 1, 1, 1,
-0.1231154, 0.3195433, -0.3297231, 1, 1, 1, 1, 1,
-0.1212171, 1.765866, 1.483434, 1, 1, 1, 1, 1,
-0.1197465, -0.5945425, -4.46237, 1, 1, 1, 1, 1,
-0.1179617, 0.5201693, 0.7495396, 1, 1, 1, 1, 1,
-0.1176394, 0.6358168, -0.2571083, 1, 1, 1, 1, 1,
-0.117387, -0.1965053, 0.3640363, 1, 1, 1, 1, 1,
-0.1144771, -0.7586101, -6.143881, 1, 1, 1, 1, 1,
-0.1137944, 0.7771125, -0.2985434, 1, 1, 1, 1, 1,
-0.1064115, 0.1668309, -1.069532, 1, 1, 1, 1, 1,
-0.1032749, 0.04461579, -1.008166, 1, 1, 1, 1, 1,
-0.09870542, 0.0491544, -1.440725, 1, 1, 1, 1, 1,
-0.09825642, -0.1448871, -3.647992, 1, 1, 1, 1, 1,
-0.09762751, -0.7964641, -2.07351, 1, 1, 1, 1, 1,
-0.09734708, -1.125402, -3.098672, 0, 0, 1, 1, 1,
-0.097289, 0.1874002, -0.4075293, 1, 0, 0, 1, 1,
-0.09585311, 1.696607, 0.9974163, 1, 0, 0, 1, 1,
-0.09320049, 1.066723, -0.3900469, 1, 0, 0, 1, 1,
-0.08833307, 0.3930597, -0.6648572, 1, 0, 0, 1, 1,
-0.0837063, 0.7628691, -3.112121, 1, 0, 0, 1, 1,
-0.0834105, 0.03725751, -3.031377, 0, 0, 0, 1, 1,
-0.08060711, 0.2234254, 1.579502, 0, 0, 0, 1, 1,
-0.08040531, 0.2763468, 1.326006, 0, 0, 0, 1, 1,
-0.07998551, -1.826014, -5.558187, 0, 0, 0, 1, 1,
-0.07704626, -0.8893252, -2.115683, 0, 0, 0, 1, 1,
-0.07436138, -0.2609425, -4.928656, 0, 0, 0, 1, 1,
-0.06886803, -0.1771607, -2.192634, 0, 0, 0, 1, 1,
-0.06590628, -1.224211, -3.53893, 1, 1, 1, 1, 1,
-0.06527293, 0.06515793, 1.203148, 1, 1, 1, 1, 1,
-0.0645343, -0.5092263, -2.413878, 1, 1, 1, 1, 1,
-0.06170473, -1.074407, -2.143424, 1, 1, 1, 1, 1,
-0.06049573, -0.8147906, -4.059382, 1, 1, 1, 1, 1,
-0.05860831, -0.427828, -2.09706, 1, 1, 1, 1, 1,
-0.05741936, 0.9190546, -1.830923, 1, 1, 1, 1, 1,
-0.05365013, -0.008697107, -1.728031, 1, 1, 1, 1, 1,
-0.0518115, -0.0950619, -2.703354, 1, 1, 1, 1, 1,
-0.05156064, 0.6035464, -0.7976248, 1, 1, 1, 1, 1,
-0.04780543, 1.383871, -1.214162, 1, 1, 1, 1, 1,
-0.04536793, 1.210456, -0.6026118, 1, 1, 1, 1, 1,
-0.03169136, 1.507753, 1.256582, 1, 1, 1, 1, 1,
-0.03158071, 2.238465, -1.67727, 1, 1, 1, 1, 1,
-0.03115899, 1.123838, 1.703867, 1, 1, 1, 1, 1,
-0.03062678, -0.6280476, -1.60648, 0, 0, 1, 1, 1,
-0.02456267, 1.167837, 0.5611204, 1, 0, 0, 1, 1,
-0.02402242, -0.09022816, -4.035494, 1, 0, 0, 1, 1,
-0.02243085, 0.7883452, -0.7347175, 1, 0, 0, 1, 1,
-0.02042417, 0.7807909, 1.619048, 1, 0, 0, 1, 1,
-0.02008538, -0.9388143, -2.735425, 1, 0, 0, 1, 1,
-0.01864951, -0.78251, -3.029606, 0, 0, 0, 1, 1,
-0.01723087, 0.1950303, -0.2177394, 0, 0, 0, 1, 1,
-0.01430572, -0.4188245, -2.474893, 0, 0, 0, 1, 1,
-0.009987237, 0.2195521, -0.02198638, 0, 0, 0, 1, 1,
-0.00889705, 0.2521615, -0.01630548, 0, 0, 0, 1, 1,
-0.007598675, -0.4793147, -1.376951, 0, 0, 0, 1, 1,
-0.003356468, 0.3219728, -0.1862146, 0, 0, 0, 1, 1,
-0.002654105, 0.03520899, 0.1056411, 1, 1, 1, 1, 1,
-0.002190646, -1.112079, -3.171079, 1, 1, 1, 1, 1,
0.001896372, -0.829161, 1.637042, 1, 1, 1, 1, 1,
0.001912978, 0.3084376, -0.5055655, 1, 1, 1, 1, 1,
0.004841372, 2.183969, -0.5159279, 1, 1, 1, 1, 1,
0.006105955, -0.7478541, 3.789917, 1, 1, 1, 1, 1,
0.00859537, 0.1168902, 1.182244, 1, 1, 1, 1, 1,
0.00917005, -0.2062479, 2.644624, 1, 1, 1, 1, 1,
0.01215408, 0.3616793, -1.848334, 1, 1, 1, 1, 1,
0.01269485, -0.0003169986, 0.1587583, 1, 1, 1, 1, 1,
0.01311374, -0.06586134, 3.080565, 1, 1, 1, 1, 1,
0.01665146, 2.162977, 1.195204, 1, 1, 1, 1, 1,
0.01799599, 1.323857, 0.4227672, 1, 1, 1, 1, 1,
0.02476165, -1.081573, 3.522783, 1, 1, 1, 1, 1,
0.03168925, -1.160913, 2.13085, 1, 1, 1, 1, 1,
0.03546186, -0.6522521, 4.427724, 0, 0, 1, 1, 1,
0.0377464, 0.8799595, -3.185457, 1, 0, 0, 1, 1,
0.04586628, -1.114466, 3.136844, 1, 0, 0, 1, 1,
0.04601089, 1.474233, 1.642883, 1, 0, 0, 1, 1,
0.04603909, -0.01474041, 2.617458, 1, 0, 0, 1, 1,
0.04944814, -1.515854, 2.815192, 1, 0, 0, 1, 1,
0.05339134, 1.94035, 0.4722511, 0, 0, 0, 1, 1,
0.05456723, 0.7743373, -1.042913, 0, 0, 0, 1, 1,
0.05547539, 0.4483391, 0.7715524, 0, 0, 0, 1, 1,
0.05686975, 0.04642636, 2.506547, 0, 0, 0, 1, 1,
0.06257704, -0.1081861, 3.278599, 0, 0, 0, 1, 1,
0.06788234, 0.4492007, 0.7204446, 0, 0, 0, 1, 1,
0.06979012, -0.7701378, 2.973137, 0, 0, 0, 1, 1,
0.07138625, 0.8968389, 0.02854256, 1, 1, 1, 1, 1,
0.07258394, 1.186814, -2.047123, 1, 1, 1, 1, 1,
0.07677107, 1.803324, 0.7679743, 1, 1, 1, 1, 1,
0.08450878, -0.5491905, 3.821641, 1, 1, 1, 1, 1,
0.08672089, 0.4141374, -0.4584371, 1, 1, 1, 1, 1,
0.08685308, -1.20148, 3.658422, 1, 1, 1, 1, 1,
0.08770442, -0.1887704, 4.437897, 1, 1, 1, 1, 1,
0.08802698, -0.4718196, 3.818002, 1, 1, 1, 1, 1,
0.08918066, -0.5160969, 2.919315, 1, 1, 1, 1, 1,
0.09039982, -0.8295426, 2.236691, 1, 1, 1, 1, 1,
0.09476297, -1.183253, 3.609401, 1, 1, 1, 1, 1,
0.09873688, -2.131566, 1.156425, 1, 1, 1, 1, 1,
0.1010503, 0.2529078, 0.8951946, 1, 1, 1, 1, 1,
0.1123788, -1.272588, 3.371527, 1, 1, 1, 1, 1,
0.1153024, -0.3325086, 2.036998, 1, 1, 1, 1, 1,
0.1153265, -0.320813, 2.964787, 0, 0, 1, 1, 1,
0.1154206, -0.6055582, 2.528, 1, 0, 0, 1, 1,
0.1159774, 0.436316, -0.489307, 1, 0, 0, 1, 1,
0.1249401, 0.0001404475, 0.9540408, 1, 0, 0, 1, 1,
0.1275461, 1.67364, -0.6964284, 1, 0, 0, 1, 1,
0.1308158, 0.7422895, 2.042782, 1, 0, 0, 1, 1,
0.1346211, -0.6047277, 4.487934, 0, 0, 0, 1, 1,
0.1347909, -0.6470808, 3.792407, 0, 0, 0, 1, 1,
0.1352725, 0.4930659, -0.7533537, 0, 0, 0, 1, 1,
0.1431459, 0.08432188, 1.15636, 0, 0, 0, 1, 1,
0.1461838, 0.9193985, 0.5249597, 0, 0, 0, 1, 1,
0.148712, 0.451221, 0.4226174, 0, 0, 0, 1, 1,
0.1488125, 1.11908, 0.1094073, 0, 0, 0, 1, 1,
0.1490788, 0.7672552, -0.3363185, 1, 1, 1, 1, 1,
0.1493123, -0.5968249, 3.253673, 1, 1, 1, 1, 1,
0.1543674, -0.1821278, 1.037579, 1, 1, 1, 1, 1,
0.1549154, -1.259242, 2.473652, 1, 1, 1, 1, 1,
0.1560994, -0.1463099, 1.226834, 1, 1, 1, 1, 1,
0.1572443, 0.2086895, 0.4546031, 1, 1, 1, 1, 1,
0.1650721, 0.273682, 2.395995, 1, 1, 1, 1, 1,
0.1658926, 1.300355, 0.2285545, 1, 1, 1, 1, 1,
0.1697341, -0.9491851, 3.995568, 1, 1, 1, 1, 1,
0.170486, -1.445968, 3.212805, 1, 1, 1, 1, 1,
0.1753266, 0.5113146, 0.7693183, 1, 1, 1, 1, 1,
0.1757009, 0.9111541, -0.04282046, 1, 1, 1, 1, 1,
0.1819762, 0.2562957, -1.50059, 1, 1, 1, 1, 1,
0.1841338, 0.05217278, 0.4229379, 1, 1, 1, 1, 1,
0.1857406, -0.7121048, 2.814852, 1, 1, 1, 1, 1,
0.1881822, -0.003677928, 1.929263, 0, 0, 1, 1, 1,
0.1940706, -0.6037275, 4.173383, 1, 0, 0, 1, 1,
0.1999972, 0.1858626, -0.02381542, 1, 0, 0, 1, 1,
0.2027913, -0.2594394, 3.379383, 1, 0, 0, 1, 1,
0.2047751, 1.182046, -0.2227651, 1, 0, 0, 1, 1,
0.2073379, 1.085991, 0.7939917, 1, 0, 0, 1, 1,
0.2088024, -1.050952, 3.120857, 0, 0, 0, 1, 1,
0.208855, 0.353599, -0.04839758, 0, 0, 0, 1, 1,
0.2134809, 0.204527, 0.8948994, 0, 0, 0, 1, 1,
0.2182173, 1.721616, -0.5636978, 0, 0, 0, 1, 1,
0.2184199, -0.3924591, 2.457673, 0, 0, 0, 1, 1,
0.2191794, 1.998145, -0.8893732, 0, 0, 0, 1, 1,
0.2215416, -0.6724262, 3.053105, 0, 0, 0, 1, 1,
0.2242907, -1.390921, 4.192677, 1, 1, 1, 1, 1,
0.2264522, 0.9451683, 0.04384017, 1, 1, 1, 1, 1,
0.22779, 0.789467, -0.5882859, 1, 1, 1, 1, 1,
0.2286483, -0.09682812, 1.309564, 1, 1, 1, 1, 1,
0.2293324, -0.5688984, 2.065017, 1, 1, 1, 1, 1,
0.232171, -0.7212794, 1.628554, 1, 1, 1, 1, 1,
0.238532, 0.7738034, 0.3866504, 1, 1, 1, 1, 1,
0.2407615, 0.4393509, 0.545369, 1, 1, 1, 1, 1,
0.2410878, -0.2046438, 2.025309, 1, 1, 1, 1, 1,
0.2422203, -1.134857, 4.050566, 1, 1, 1, 1, 1,
0.2422762, 0.03146454, 2.011603, 1, 1, 1, 1, 1,
0.2454517, -0.4047786, 2.456444, 1, 1, 1, 1, 1,
0.247983, -0.2513319, 1.196111, 1, 1, 1, 1, 1,
0.2492116, -0.01481016, 1.964217, 1, 1, 1, 1, 1,
0.2495202, -2.676715, 3.324045, 1, 1, 1, 1, 1,
0.2552072, -1.461076, 2.125873, 0, 0, 1, 1, 1,
0.2574817, -0.5976946, 2.022074, 1, 0, 0, 1, 1,
0.2582383, 0.4460538, 0.3440492, 1, 0, 0, 1, 1,
0.2586084, 0.2019921, 0.2005838, 1, 0, 0, 1, 1,
0.2614743, -1.244468, 1.681883, 1, 0, 0, 1, 1,
0.262462, 0.6078407, -0.5004703, 1, 0, 0, 1, 1,
0.2630963, -2.229207, 2.235949, 0, 0, 0, 1, 1,
0.2763714, -0.784005, 3.683459, 0, 0, 0, 1, 1,
0.2786278, 0.8879893, 1.367921, 0, 0, 0, 1, 1,
0.2786497, -0.5425013, 4.523344, 0, 0, 0, 1, 1,
0.2791449, 0.7150431, -1.518216, 0, 0, 0, 1, 1,
0.2857749, -1.265476, 3.280683, 0, 0, 0, 1, 1,
0.2891596, -0.8441939, 2.363971, 0, 0, 0, 1, 1,
0.2918976, 0.3141664, 0.9086805, 1, 1, 1, 1, 1,
0.2924227, 0.105491, 0.2007925, 1, 1, 1, 1, 1,
0.2938348, -0.3884486, 2.243654, 1, 1, 1, 1, 1,
0.2984835, 0.1849512, 0.09855644, 1, 1, 1, 1, 1,
0.3042337, -0.4514126, 1.126396, 1, 1, 1, 1, 1,
0.3090135, 1.036752, -0.2981847, 1, 1, 1, 1, 1,
0.316402, -1.261434, 4.391866, 1, 1, 1, 1, 1,
0.3182212, 0.4904701, 2.464415, 1, 1, 1, 1, 1,
0.3207801, 0.9644408, -1.243402, 1, 1, 1, 1, 1,
0.3392707, 1.527419, -0.1058169, 1, 1, 1, 1, 1,
0.3433561, -0.4602137, 3.44946, 1, 1, 1, 1, 1,
0.3470179, 0.1329004, 0.4710459, 1, 1, 1, 1, 1,
0.3470731, 2.123713, 1.827155, 1, 1, 1, 1, 1,
0.3515951, -0.2654231, 1.483217, 1, 1, 1, 1, 1,
0.352491, -0.107518, 2.236142, 1, 1, 1, 1, 1,
0.3530974, -0.4932667, 3.170137, 0, 0, 1, 1, 1,
0.3532182, -0.1672578, 2.451155, 1, 0, 0, 1, 1,
0.3545798, 0.3540071, 1.083848, 1, 0, 0, 1, 1,
0.3582107, 1.405975, -1.102371, 1, 0, 0, 1, 1,
0.3644482, 0.135466, -0.6344044, 1, 0, 0, 1, 1,
0.3659081, 0.07523593, 3.23415, 1, 0, 0, 1, 1,
0.3667465, 1.237808, 0.7927186, 0, 0, 0, 1, 1,
0.3675102, -0.04278613, 0.9657775, 0, 0, 0, 1, 1,
0.3689965, 0.05251691, 1.026622, 0, 0, 0, 1, 1,
0.3694741, -0.5711254, 3.863073, 0, 0, 0, 1, 1,
0.3703665, -0.8975142, 3.0093, 0, 0, 0, 1, 1,
0.3729303, 0.7816792, 0.6551132, 0, 0, 0, 1, 1,
0.3755842, 0.6361475, 1.359981, 0, 0, 0, 1, 1,
0.3761925, 0.8995814, -0.5633391, 1, 1, 1, 1, 1,
0.3769456, -1.162042, 2.757773, 1, 1, 1, 1, 1,
0.3973341, -0.5675951, 1.409383, 1, 1, 1, 1, 1,
0.3993879, 0.3705132, 1.456725, 1, 1, 1, 1, 1,
0.4005623, 1.158286, 1.384044, 1, 1, 1, 1, 1,
0.4009331, 0.3940538, -0.6515235, 1, 1, 1, 1, 1,
0.4094275, 0.3719577, 1.281137, 1, 1, 1, 1, 1,
0.4113464, -0.9482301, 2.176662, 1, 1, 1, 1, 1,
0.4123296, -1.220024, 3.819132, 1, 1, 1, 1, 1,
0.414012, 0.8475737, -0.162595, 1, 1, 1, 1, 1,
0.4140191, -0.1528808, 2.117247, 1, 1, 1, 1, 1,
0.4140951, 0.8870132, 0.2841632, 1, 1, 1, 1, 1,
0.4200549, 1.583722, 2.777053, 1, 1, 1, 1, 1,
0.4211755, -0.4070377, 3.073671, 1, 1, 1, 1, 1,
0.4245639, -0.1884199, 0.5111792, 1, 1, 1, 1, 1,
0.425329, 0.6640812, -0.4168158, 0, 0, 1, 1, 1,
0.4312587, -0.3915891, 2.461103, 1, 0, 0, 1, 1,
0.4330052, 1.569767, 0.6979889, 1, 0, 0, 1, 1,
0.4394862, -0.2639717, 3.78881, 1, 0, 0, 1, 1,
0.4398684, 1.22586, 1.052476, 1, 0, 0, 1, 1,
0.4436477, -0.5643553, 3.473071, 1, 0, 0, 1, 1,
0.456066, 0.08428933, 4.109798, 0, 0, 0, 1, 1,
0.4624392, -1.173281, 2.865253, 0, 0, 0, 1, 1,
0.4632396, 0.2335385, 0.8690333, 0, 0, 0, 1, 1,
0.4732958, -0.5024143, 3.298115, 0, 0, 0, 1, 1,
0.4735008, 0.6034841, -0.8948382, 0, 0, 0, 1, 1,
0.4747643, 1.509605, 1.001158, 0, 0, 0, 1, 1,
0.4764791, 1.581041, 0.782676, 0, 0, 0, 1, 1,
0.4824843, -0.3406867, 2.926277, 1, 1, 1, 1, 1,
0.4827266, -1.640822, 3.44813, 1, 1, 1, 1, 1,
0.4838519, -0.7948635, 2.535311, 1, 1, 1, 1, 1,
0.4853779, -0.9582793, 4.164839, 1, 1, 1, 1, 1,
0.4860936, 2.195097, 1.532118, 1, 1, 1, 1, 1,
0.4868762, -0.7719499, 2.096423, 1, 1, 1, 1, 1,
0.4871578, -0.6410138, 1.589362, 1, 1, 1, 1, 1,
0.4889238, 0.4815955, 0.3613743, 1, 1, 1, 1, 1,
0.4951582, 0.7133088, 1.395297, 1, 1, 1, 1, 1,
0.496173, -0.5098765, 1.412002, 1, 1, 1, 1, 1,
0.4968747, -0.6301339, 3.273002, 1, 1, 1, 1, 1,
0.4996412, 1.538124, 0.5252798, 1, 1, 1, 1, 1,
0.4997282, -0.3579262, 2.831488, 1, 1, 1, 1, 1,
0.5038209, -1.63692, 3.391814, 1, 1, 1, 1, 1,
0.5053713, -0.2496441, 2.708461, 1, 1, 1, 1, 1,
0.5106916, -0.7361484, 1.917528, 0, 0, 1, 1, 1,
0.5124162, -1.175227, 2.74385, 1, 0, 0, 1, 1,
0.5175695, -0.9639453, 3.480974, 1, 0, 0, 1, 1,
0.5218668, -0.336327, 1.819299, 1, 0, 0, 1, 1,
0.5289159, -0.07890102, 1.893039, 1, 0, 0, 1, 1,
0.5291718, -0.5432856, 3.156407, 1, 0, 0, 1, 1,
0.530486, 0.666451, 0.8536061, 0, 0, 0, 1, 1,
0.5443215, -0.7143061, 2.878358, 0, 0, 0, 1, 1,
0.5477272, 1.258088, -0.3733095, 0, 0, 0, 1, 1,
0.5482479, -1.526904, 3.427291, 0, 0, 0, 1, 1,
0.5496989, -0.2938126, 3.402088, 0, 0, 0, 1, 1,
0.5570415, -0.6277946, 3.725122, 0, 0, 0, 1, 1,
0.5574676, -1.270703, 1.538134, 0, 0, 0, 1, 1,
0.5646974, 0.4082037, 0.4960863, 1, 1, 1, 1, 1,
0.5675226, -0.306688, 0.7025917, 1, 1, 1, 1, 1,
0.5675583, -0.1955386, 1.057722, 1, 1, 1, 1, 1,
0.5710742, 0.413133, 0.1894729, 1, 1, 1, 1, 1,
0.5746599, 2.310447, -0.699093, 1, 1, 1, 1, 1,
0.5801879, -0.07953361, 2.243947, 1, 1, 1, 1, 1,
0.5803498, 0.607389, 0.7477783, 1, 1, 1, 1, 1,
0.584067, 0.07268894, 0.6819374, 1, 1, 1, 1, 1,
0.5876122, -0.02539636, 1.563043, 1, 1, 1, 1, 1,
0.591353, 2.687739, 1.306171, 1, 1, 1, 1, 1,
0.5921271, 0.1508083, 0.6376184, 1, 1, 1, 1, 1,
0.5933335, 0.5622692, 2.49245, 1, 1, 1, 1, 1,
0.5940732, -0.8025814, 2.537072, 1, 1, 1, 1, 1,
0.5991039, 2.049802, -0.3455219, 1, 1, 1, 1, 1,
0.6047063, 0.14696, 1.281865, 1, 1, 1, 1, 1,
0.6051753, 0.9338567, 1.153938, 0, 0, 1, 1, 1,
0.6108477, 0.08444799, 0.7270537, 1, 0, 0, 1, 1,
0.6177195, 0.3948958, 0.1551896, 1, 0, 0, 1, 1,
0.6185521, -0.03555058, 1.593186, 1, 0, 0, 1, 1,
0.6223368, 0.05519013, 1.558221, 1, 0, 0, 1, 1,
0.6409228, -0.2949902, 2.829268, 1, 0, 0, 1, 1,
0.6454196, -0.2231522, 1.381309, 0, 0, 0, 1, 1,
0.6480631, 0.5861228, 1.526585, 0, 0, 0, 1, 1,
0.6496061, 0.8615186, 1.51474, 0, 0, 0, 1, 1,
0.6508265, 0.2723463, 0.6161727, 0, 0, 0, 1, 1,
0.6520054, -0.7970918, 1.65879, 0, 0, 0, 1, 1,
0.6521644, 0.01502012, 0.176445, 0, 0, 0, 1, 1,
0.6570592, -0.2288454, 3.372224, 0, 0, 0, 1, 1,
0.6603212, 1.319898, -0.04838465, 1, 1, 1, 1, 1,
0.6612234, -0.5032736, 1.206459, 1, 1, 1, 1, 1,
0.6633345, 0.9569764, -1.768301, 1, 1, 1, 1, 1,
0.6676037, -0.862056, 2.964453, 1, 1, 1, 1, 1,
0.6790618, 0.8119444, 1.586881, 1, 1, 1, 1, 1,
0.6854511, 0.813836, 0.5852211, 1, 1, 1, 1, 1,
0.6963148, -1.192479, 2.292879, 1, 1, 1, 1, 1,
0.7020689, -0.4288822, 1.580598, 1, 1, 1, 1, 1,
0.7086629, -0.1109683, 1.574162, 1, 1, 1, 1, 1,
0.7110915, 1.776449, 0.6967211, 1, 1, 1, 1, 1,
0.7131504, 1.07429, -0.2579488, 1, 1, 1, 1, 1,
0.7133237, -0.4569752, 1.971112, 1, 1, 1, 1, 1,
0.7170246, -0.3614973, 1.020987, 1, 1, 1, 1, 1,
0.7203423, 0.6129278, 0.5282203, 1, 1, 1, 1, 1,
0.7215704, 0.208522, -0.2063423, 1, 1, 1, 1, 1,
0.7218595, 0.04590508, 2.099138, 0, 0, 1, 1, 1,
0.723601, -0.4557754, 1.62538, 1, 0, 0, 1, 1,
0.7278495, 0.2449718, 1.093031, 1, 0, 0, 1, 1,
0.7288958, 0.5299156, 1.685091, 1, 0, 0, 1, 1,
0.7297394, 0.4921362, 1.909135, 1, 0, 0, 1, 1,
0.7299638, 0.09484025, 1.46763, 1, 0, 0, 1, 1,
0.7317075, 2.143354, -0.3202171, 0, 0, 0, 1, 1,
0.7359642, 0.6192235, 1.835637, 0, 0, 0, 1, 1,
0.7371088, -1.560299, 2.070909, 0, 0, 0, 1, 1,
0.7371904, -0.7279724, 2.211348, 0, 0, 0, 1, 1,
0.7374316, 2.092005, -0.1808328, 0, 0, 0, 1, 1,
0.740992, 1.235322, -0.1648006, 0, 0, 0, 1, 1,
0.7436337, -0.3768675, 1.135408, 0, 0, 0, 1, 1,
0.7444816, 0.4872002, 2.072762, 1, 1, 1, 1, 1,
0.7472905, 0.4323368, 1.536784, 1, 1, 1, 1, 1,
0.7476535, 1.273377, 0.1498297, 1, 1, 1, 1, 1,
0.7512081, -1.415741, 2.794357, 1, 1, 1, 1, 1,
0.7534597, -0.5121681, 4.341745, 1, 1, 1, 1, 1,
0.7551906, 0.9999245, 2.287392, 1, 1, 1, 1, 1,
0.7629037, -0.03091531, 1.322319, 1, 1, 1, 1, 1,
0.7791474, -0.8676392, 1.637644, 1, 1, 1, 1, 1,
0.7881185, -0.5843458, 1.368041, 1, 1, 1, 1, 1,
0.7932807, 0.2492362, 1.510262, 1, 1, 1, 1, 1,
0.80144, 0.5850804, 1.660302, 1, 1, 1, 1, 1,
0.8035963, 1.552871, 1.594563, 1, 1, 1, 1, 1,
0.8055938, 0.3021168, 1.978172, 1, 1, 1, 1, 1,
0.8065073, -0.2601253, 2.503011, 1, 1, 1, 1, 1,
0.8074955, -0.3790373, 1.559023, 1, 1, 1, 1, 1,
0.8166298, -1.253542, 2.930254, 0, 0, 1, 1, 1,
0.8198238, 0.6184761, 1.316254, 1, 0, 0, 1, 1,
0.8254189, -0.1465918, 2.012429, 1, 0, 0, 1, 1,
0.8314149, 0.2446424, 2.044594, 1, 0, 0, 1, 1,
0.8358628, -0.3373463, 2.957351, 1, 0, 0, 1, 1,
0.839724, 0.9548083, 2.411529, 1, 0, 0, 1, 1,
0.8450208, 0.1656191, 2.295582, 0, 0, 0, 1, 1,
0.8496051, 1.702042, 0.189179, 0, 0, 0, 1, 1,
0.8526731, -1.209201, 3.248802, 0, 0, 0, 1, 1,
0.8594002, 0.2401196, 3.535123, 0, 0, 0, 1, 1,
0.8636159, 0.04564721, 0.9670903, 0, 0, 0, 1, 1,
0.8731379, 0.0659887, 1.934351, 0, 0, 0, 1, 1,
0.8742398, -0.4598115, 4.349276, 0, 0, 0, 1, 1,
0.8860124, 0.5628206, -0.1843149, 1, 1, 1, 1, 1,
0.8914656, -0.8037388, 2.229478, 1, 1, 1, 1, 1,
0.8946066, 0.6719934, -0.3169699, 1, 1, 1, 1, 1,
0.8959568, 0.5636477, 1.491925, 1, 1, 1, 1, 1,
0.9079884, -1.072707, 2.237183, 1, 1, 1, 1, 1,
0.911856, -0.906018, 2.025946, 1, 1, 1, 1, 1,
0.9140854, -0.4678706, 1.688231, 1, 1, 1, 1, 1,
0.918029, 1.842977, 0.8464291, 1, 1, 1, 1, 1,
0.926773, 0.337143, 3.295869, 1, 1, 1, 1, 1,
0.929186, -0.1510962, 1.104646, 1, 1, 1, 1, 1,
0.9316843, 0.9150011, 1.008758, 1, 1, 1, 1, 1,
0.9363306, -0.5826679, 1.856212, 1, 1, 1, 1, 1,
0.9366127, 0.07784718, 1.895292, 1, 1, 1, 1, 1,
0.936906, 0.5756103, 1.390328, 1, 1, 1, 1, 1,
0.938493, 0.199296, 0.8110753, 1, 1, 1, 1, 1,
0.9427653, 0.1475831, 2.670697, 0, 0, 1, 1, 1,
0.9526544, -0.5262538, 1.544094, 1, 0, 0, 1, 1,
0.95967, -1.239277, 2.025699, 1, 0, 0, 1, 1,
0.9707515, -1.301087, 1.614691, 1, 0, 0, 1, 1,
0.9747726, 1.0675, 0.5658884, 1, 0, 0, 1, 1,
0.9767614, 0.3790096, 0.1843097, 1, 0, 0, 1, 1,
0.9771833, -0.9376134, 1.78818, 0, 0, 0, 1, 1,
0.9902788, 2.141536, -0.7636223, 0, 0, 0, 1, 1,
0.9926087, 0.508606, 1.264569, 0, 0, 0, 1, 1,
0.9935723, -1.00579, 2.647423, 0, 0, 0, 1, 1,
0.9969833, 0.08257291, 2.322492, 0, 0, 0, 1, 1,
0.9998918, -1.990296, 1.931552, 0, 0, 0, 1, 1,
1.004022, 1.083377, 0.9279507, 0, 0, 0, 1, 1,
1.010062, -0.9286929, 1.804964, 1, 1, 1, 1, 1,
1.010146, -0.8148771, 3.516872, 1, 1, 1, 1, 1,
1.011255, 0.0279153, 0.6200653, 1, 1, 1, 1, 1,
1.01903, 1.177797, 0.1946213, 1, 1, 1, 1, 1,
1.032033, 0.2716497, 1.729835, 1, 1, 1, 1, 1,
1.035056, -1.727414, 6.786956, 1, 1, 1, 1, 1,
1.03549, -0.3941256, 1.476342, 1, 1, 1, 1, 1,
1.041623, -0.5380709, 2.958444, 1, 1, 1, 1, 1,
1.042866, 0.9919605, -0.1267403, 1, 1, 1, 1, 1,
1.04458, 0.8971676, -0.6591394, 1, 1, 1, 1, 1,
1.050355, 0.1626481, 2.116669, 1, 1, 1, 1, 1,
1.051392, -0.2973973, 2.802549, 1, 1, 1, 1, 1,
1.059296, 1.899025, 1.174672, 1, 1, 1, 1, 1,
1.067346, -0.4703347, 4.149737, 1, 1, 1, 1, 1,
1.072299, -0.2126392, 2.537321, 1, 1, 1, 1, 1,
1.075289, 0.5628798, 1.973511, 0, 0, 1, 1, 1,
1.07789, -1.29092, 3.743246, 1, 0, 0, 1, 1,
1.077909, 0.9003881, 1.503094, 1, 0, 0, 1, 1,
1.078199, 1.931727, 2.412075, 1, 0, 0, 1, 1,
1.092023, 0.7726778, 0.0777042, 1, 0, 0, 1, 1,
1.094923, -1.191462, 3.201999, 1, 0, 0, 1, 1,
1.099104, 1.101156, 1.640227, 0, 0, 0, 1, 1,
1.105244, 1.24949, 0.7297524, 0, 0, 0, 1, 1,
1.1141, -0.9615007, 0.7158176, 0, 0, 0, 1, 1,
1.114233, -0.04947703, 2.527157, 0, 0, 0, 1, 1,
1.118895, -1.451344, 2.846407, 0, 0, 0, 1, 1,
1.121161, -0.8538091, 2.066874, 0, 0, 0, 1, 1,
1.133168, 2.152501, 0.09276861, 0, 0, 0, 1, 1,
1.134022, 0.6854985, -0.04397701, 1, 1, 1, 1, 1,
1.138224, 0.2251048, 2.894171, 1, 1, 1, 1, 1,
1.141329, 0.1315675, 1.316882, 1, 1, 1, 1, 1,
1.141588, 0.4928316, 0.8584778, 1, 1, 1, 1, 1,
1.142127, 0.902823, -1.337889, 1, 1, 1, 1, 1,
1.142885, -0.2861817, 2.06977, 1, 1, 1, 1, 1,
1.143238, -0.2325901, 1.961739, 1, 1, 1, 1, 1,
1.145779, 0.3724385, 1.136916, 1, 1, 1, 1, 1,
1.14689, 0.2278486, 1.260975, 1, 1, 1, 1, 1,
1.147894, 0.2146039, 3.522288, 1, 1, 1, 1, 1,
1.155851, 0.9053013, 0.45322, 1, 1, 1, 1, 1,
1.157701, -1.510868, 1.479522, 1, 1, 1, 1, 1,
1.159776, 1.538925, 0.6912928, 1, 1, 1, 1, 1,
1.160282, 0.5634719, 0.7110695, 1, 1, 1, 1, 1,
1.164248, 0.1178722, 1.48607, 1, 1, 1, 1, 1,
1.166415, 0.5211942, 3.608367, 0, 0, 1, 1, 1,
1.170792, 0.01881257, 2.622607, 1, 0, 0, 1, 1,
1.175668, -0.844424, 2.518382, 1, 0, 0, 1, 1,
1.176097, -0.5511767, 1.532517, 1, 0, 0, 1, 1,
1.182831, 0.942533, -0.9350833, 1, 0, 0, 1, 1,
1.187826, 0.6432099, -0.05980745, 1, 0, 0, 1, 1,
1.192998, 0.01363207, 1.804931, 0, 0, 0, 1, 1,
1.196273, -0.3526057, 1.418596, 0, 0, 0, 1, 1,
1.203153, -1.670272, 2.124964, 0, 0, 0, 1, 1,
1.205047, -0.8366106, 1.791627, 0, 0, 0, 1, 1,
1.206982, -0.7704311, 1.92095, 0, 0, 0, 1, 1,
1.210967, -0.229654, 3.313322, 0, 0, 0, 1, 1,
1.214071, 1.204657, -1.40039, 0, 0, 0, 1, 1,
1.241196, -0.1042377, 2.70651, 1, 1, 1, 1, 1,
1.243674, -0.3301969, 2.222281, 1, 1, 1, 1, 1,
1.251601, -0.5116847, 1.110896, 1, 1, 1, 1, 1,
1.252714, -1.317584, 3.233238, 1, 1, 1, 1, 1,
1.259092, 0.3927939, 3.451011, 1, 1, 1, 1, 1,
1.262174, 0.1077066, 2.883649, 1, 1, 1, 1, 1,
1.265702, 0.5492552, 1.7176, 1, 1, 1, 1, 1,
1.267262, -0.9088988, 2.968858, 1, 1, 1, 1, 1,
1.272278, 0.3076994, 3.185552, 1, 1, 1, 1, 1,
1.272526, 0.6866249, 0.8266177, 1, 1, 1, 1, 1,
1.284139, 0.4105382, 1.410928, 1, 1, 1, 1, 1,
1.285288, 0.1891412, 1.126754, 1, 1, 1, 1, 1,
1.290749, 0.1664992, 1.128412, 1, 1, 1, 1, 1,
1.292117, -0.1758022, 2.284471, 1, 1, 1, 1, 1,
1.308187, -1.356862, 1.296891, 1, 1, 1, 1, 1,
1.313869, 1.364319, 0.3958989, 0, 0, 1, 1, 1,
1.316962, 0.08031718, 1.448866, 1, 0, 0, 1, 1,
1.322869, 0.9661123, 2.073844, 1, 0, 0, 1, 1,
1.323124, 0.01135366, 2.297704, 1, 0, 0, 1, 1,
1.323186, -0.950943, 1.300536, 1, 0, 0, 1, 1,
1.32678, -1.957201, 4.522403, 1, 0, 0, 1, 1,
1.329952, -0.5900117, 3.054283, 0, 0, 0, 1, 1,
1.330082, -2.461951, 1.630256, 0, 0, 0, 1, 1,
1.334436, -0.1003201, 2.857658, 0, 0, 0, 1, 1,
1.351769, -0.5505486, 2.709166, 0, 0, 0, 1, 1,
1.35417, -0.6861687, 5.029603, 0, 0, 0, 1, 1,
1.361853, -1.363249, 0.6540887, 0, 0, 0, 1, 1,
1.363708, 1.312657, 0.7590292, 0, 0, 0, 1, 1,
1.363894, -0.2871692, -0.4903483, 1, 1, 1, 1, 1,
1.379259, 0.5657301, 0.9830939, 1, 1, 1, 1, 1,
1.38082, -0.4820901, 2.534384, 1, 1, 1, 1, 1,
1.390998, -2.140292, 1.749793, 1, 1, 1, 1, 1,
1.408943, -0.6194251, 1.518568, 1, 1, 1, 1, 1,
1.409678, 1.785012, -1.193415, 1, 1, 1, 1, 1,
1.41868, 0.7576195, 2.085761, 1, 1, 1, 1, 1,
1.424778, -0.340204, 3.409728, 1, 1, 1, 1, 1,
1.427581, -0.448381, 2.046128, 1, 1, 1, 1, 1,
1.432939, 0.66638, 0.6881793, 1, 1, 1, 1, 1,
1.452174, -0.7346776, 0.9645172, 1, 1, 1, 1, 1,
1.454677, -1.450409, 2.812688, 1, 1, 1, 1, 1,
1.461925, -0.0438926, -0.7516568, 1, 1, 1, 1, 1,
1.46516, -0.78076, 3.261228, 1, 1, 1, 1, 1,
1.489436, 0.4049931, 1.57933, 1, 1, 1, 1, 1,
1.489871, 2.548007, 0.7326344, 0, 0, 1, 1, 1,
1.491153, -3.058352, 2.011597, 1, 0, 0, 1, 1,
1.492776, -0.9364167, 2.35228, 1, 0, 0, 1, 1,
1.494604, -0.2991408, 2.122507, 1, 0, 0, 1, 1,
1.516436, -0.7635677, 1.913049, 1, 0, 0, 1, 1,
1.51729, -0.418904, 1.621452, 1, 0, 0, 1, 1,
1.527239, -0.0812235, 0.7798112, 0, 0, 0, 1, 1,
1.540577, 0.1514757, 2.69793, 0, 0, 0, 1, 1,
1.551475, 1.430308, 0.4829002, 0, 0, 0, 1, 1,
1.554351, 0.1627134, 0.7778509, 0, 0, 0, 1, 1,
1.557371, 0.1173301, 0.298203, 0, 0, 0, 1, 1,
1.570936, -0.06095086, 1.517846, 0, 0, 0, 1, 1,
1.585135, -0.8554872, 2.199826, 0, 0, 0, 1, 1,
1.59178, 0.4002169, -0.02580687, 1, 1, 1, 1, 1,
1.596916, -0.9528087, 3.549669, 1, 1, 1, 1, 1,
1.598525, -0.6880387, 1.926016, 1, 1, 1, 1, 1,
1.650475, 2.121301, 1.149608, 1, 1, 1, 1, 1,
1.665421, -0.5611147, 1.74636, 1, 1, 1, 1, 1,
1.665744, 1.378625, 0.3955826, 1, 1, 1, 1, 1,
1.671781, 1.638041, -1.091553, 1, 1, 1, 1, 1,
1.685264, -0.1419832, 1.974556, 1, 1, 1, 1, 1,
1.693672, -1.373642, 2.242118, 1, 1, 1, 1, 1,
1.696513, -1.635956, 0.9731395, 1, 1, 1, 1, 1,
1.700817, 1.145973, 1.985242, 1, 1, 1, 1, 1,
1.725807, -0.03449554, 0.3237394, 1, 1, 1, 1, 1,
1.734677, 0.3499575, 2.354178, 1, 1, 1, 1, 1,
1.744322, 0.03630285, 2.548691, 1, 1, 1, 1, 1,
1.749382, 0.4235468, 0.6947344, 1, 1, 1, 1, 1,
1.770844, 1.370735, 1.527458, 0, 0, 1, 1, 1,
1.778141, -0.8282716, 0.5704498, 1, 0, 0, 1, 1,
1.808513, -0.3427376, 1.670454, 1, 0, 0, 1, 1,
1.810897, -0.0495556, 2.289664, 1, 0, 0, 1, 1,
1.823871, -0.9956607, 1.802215, 1, 0, 0, 1, 1,
1.824957, 1.316854, 0.2000061, 1, 0, 0, 1, 1,
1.832741, 0.7990662, 0.3063066, 0, 0, 0, 1, 1,
1.842113, -1.435509, 3.172808, 0, 0, 0, 1, 1,
1.84959, -0.3520984, 0.6331402, 0, 0, 0, 1, 1,
1.857687, -0.4062325, 1.668911, 0, 0, 0, 1, 1,
1.866594, 1.019815, 1.666226, 0, 0, 0, 1, 1,
1.868351, 0.87585, 0.3122406, 0, 0, 0, 1, 1,
1.86837, -0.6095052, 2.223622, 0, 0, 0, 1, 1,
1.874675, 2.131979, -0.07374471, 1, 1, 1, 1, 1,
1.882286, -0.8771355, 0.2959478, 1, 1, 1, 1, 1,
1.941874, -1.204901, 1.207662, 1, 1, 1, 1, 1,
1.974712, 0.4307136, 0.2040263, 1, 1, 1, 1, 1,
1.980779, 0.4734408, 1.997514, 1, 1, 1, 1, 1,
2.038116, 0.4058027, 2.812948, 1, 1, 1, 1, 1,
2.042382, -1.376765, 0.725373, 1, 1, 1, 1, 1,
2.045806, -0.3529277, 1.410198, 1, 1, 1, 1, 1,
2.053555, 1.124079, 0.2302081, 1, 1, 1, 1, 1,
2.062093, 1.098648, -0.03059931, 1, 1, 1, 1, 1,
2.066223, 0.2974091, 1.377972, 1, 1, 1, 1, 1,
2.073575, -1.88289, 2.474255, 1, 1, 1, 1, 1,
2.075449, 2.003097, 1.147968, 1, 1, 1, 1, 1,
2.092355, -2.508536, 3.811657, 1, 1, 1, 1, 1,
2.102091, 0.9533886, -0.1935378, 1, 1, 1, 1, 1,
2.129458, 0.8758685, 1.485697, 0, 0, 1, 1, 1,
2.140187, -0.1178741, 1.700127, 1, 0, 0, 1, 1,
2.17414, 1.212909, -0.6397719, 1, 0, 0, 1, 1,
2.184614, 0.07104303, 1.950282, 1, 0, 0, 1, 1,
2.194713, 0.9827387, 0.2883818, 1, 0, 0, 1, 1,
2.267409, 0.568261, 2.638566, 1, 0, 0, 1, 1,
2.274416, 1.247597, 2.19985, 0, 0, 0, 1, 1,
2.283509, 0.5758503, 1.280023, 0, 0, 0, 1, 1,
2.30235, 1.168594, 1.819879, 0, 0, 0, 1, 1,
2.305661, -1.948931, 3.340436, 0, 0, 0, 1, 1,
2.377843, 0.5280857, 0.954239, 0, 0, 0, 1, 1,
2.477553, 2.498681, 0.9876828, 0, 0, 0, 1, 1,
2.520722, -0.6888687, 2.202469, 0, 0, 0, 1, 1,
2.530098, 0.3568841, 1.081866, 1, 1, 1, 1, 1,
2.541562, -1.997988, 2.35257, 1, 1, 1, 1, 1,
2.547818, -0.6749952, 2.743601, 1, 1, 1, 1, 1,
2.547991, 1.795558, -0.1467303, 1, 1, 1, 1, 1,
2.556655, 0.0285109, 1.693456, 1, 1, 1, 1, 1,
2.600662, -0.2759225, 1.401228, 1, 1, 1, 1, 1,
2.643835, 1.474101, 2.875065, 1, 1, 1, 1, 1
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
var radius = 10.39176;
var distance = 36.50061;
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
mvMatrix.translate( 0.4170874, -0.03510165, -0.3215377 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.50061);
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
